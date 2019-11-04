(declaim (sb-ext:muffle-conditions cl:warning))

(load "ttt/src/load")
(load "init1.lisp")
(load "real_util.lisp")
(load "parse.lisp")
(load "norm-el.lisp")

; (load "process-sentence1.lisp") ; for hide-ttt-ops and unhide-ttt-ops

(defun has-ext? (x e)
    (and
        (symbolp x)
        (stringp e)
        (>= (length (string x)) (length e))
        (equal
            e
            (subseq
                (string x)
                (- (length (string x)) (length e))
                (length (string x))
            )
        )
    )
)

(defun lex-noun? (x)
	(has-ext? x ".N")
)

(defun vp-shifter? (x)
(and
	(has-suffix? (format nil "~s" x) "VP")
	(has-prefix? (format nil "~s" x) "PRED")
)
)

(defun modif-advp? (x)
(and
	(has-suffix? (format nil "~s" x) "ADVP")
	(has-prefix? (format nil "~s" x) "MODIF")
)
)

(defun unflatten! (x)
(let ((lst (reverse x)) (cursor nil) (modded-verbs (list)))
(block outer
	(setf nonverbs (loop for e in lst if (not (lex-verb? e)) collect e))
	(setf verbs (loop for e in lst if (lex-verb? e) collect e))

	
	(loop for verb in verbs do (block vblock
		(setf cursor verb)
		(loop for el in nonverbs
			do (setf cursor (list (list 'attr el) cursor)))
		(setf modded-verbs (append modded-verbs (list cursor)))
	))

	(return-from outer (and-chain modded-verbs))
)
)
)

(defun nonverb-pred? (p)
	(and (canon-pred? p) (not (lex-verb? (pred-base p))))
)

(defun lambdify-preds! (ps)
(let ((tmp-sym (gensym)))
	(list 'L tmp-sym
		(append (list 'AND) (mapcar (lambda (x) (list tmp-sym x)) ps)))
)
)

(defparameter *SCHEMA-CLEANUP-RULES* '(
	; The case with only one argument
	; (/ (KA (L _!1 (_!1 _!2)))
	; 	(KA _!2))

	; The case with unbracketed serial arguments
	; (/ (KA (L _!1 (_!1 _!2 _+3)))
	; 	(KA _!2 _+3))

	; Get rid of monadic lambda predicates.
	(/ (_*1 (L _!.2 (_!.2 _+3)) _*4)
		(_*1 (_+3) _*4)
	)

	; Split out conjoined verb predications w/
	; the same subject, and fix their "nested"
	; episode characterizations.
	(/
		(_*6 (( ((_!. _+2) AND.CC (_!. _+3)) [**] _!4) [**] _!5) _*7)
		(_*6 ((_!. _+2) ** _!5) ((_!. _+3) ** _!4) _*7)
	)

	; Kill :O
	(/
		(:O _+)
		(_+)
	)

	; Strip narrative structures
	(/
		((SPEAKER TELL.V HEARER (THAT _!1)) [**] _!2)
		(_!1 [**] _!2)
	)

	; Flatten lists of modifiers to float,
	; so they can be unfloated by another
	; rule.
	(/
		(_*1 ((!2 canon-mod?) (+ canon-mod?)) _*3)
		(_*1 !2 + _*3)
	)

	; Un-flatten stacked predicates.
	(/
		((* ~ AND.CC) ((+ nonverb-pred?)))
		(* (lambdify-preds! (+)))
	)

	; To BE.V, or not to BE.V?
	(/
		((!1 ~ THERE.PRO) (BE.V (!2 probably-pred?)))
		(!1 !2)
	)

	; "There is X" => "X is"
	(/
		(THERE.PRO (BE.V (= _!1)))
		(_!1 BE.V)
	)

	; Fix weird type-shifters
	(/
		(!1 modif-advp?)
		ADV-A
	)

	; Kill PRED****.VP
	(/
		((!1 vp-shifter?) _+)
		(_+)
	)

	; Unflatten post-args
	(/
		((!1 canon-individual?) (!2 canon-pred?) (+ canon-individual?))
		(!1 (!2 +))
	)
))

(defparameter *SCHEMA-CLEANUP-FUNCS* '(
	skolemize-adets
	split-and-eps
	norm-conjunctive-infixes
	split-top-level-lambda-ands
	apply-mono-lambdas
	split-top-level-ands
	unfloat-modifiers
	split-double-charstars
	split-and-preds
	bubble-up-pred-charstars
	sink-prop-mods
	name-skolems
))

; Ideally, this wouldn't be necessary, but sometimes
; Skolemized things still get the OBJECT name, e.g. if
; a lambda-and predicate was Skolemized and couldn't be
; parsed for a name until it was split later.
(defun name-skolems (phi)
(block outer
	(setf phi-copy (copy-list phi))
	(loop for form in phi do (block loop-outer
		(if (and
				(listp form)
				(equal 2 (length form))
				(lex-skolem? (car form))
				(symbolp (second form))
				(has-prefix? (format nil "~s" (car form)) "OBJECT")
				)
			; then
			(block loop-inner
				(setf sym-prefix (car (split-str (format nil "~s" (second form)) ".")))
				(if (equal sym-prefix "OBJECT")
					; then
					(return-from loop-outer)
				)

				(setf new-skolem (new-skolem! (intern sym-prefix)))
				(setf phi-copy (replace-vals (car form) new-skolem phi))
			)
		)
	))

	(return-from outer phi-copy)
)
)

(defun sink-prop-mods (phi)
(block outer
	(setf phi-copy (copy-list phi))

	(loop for loop-form in phi do (block loop-outer
		(setf form (copy-item loop-form))

		; Strip charstars.
		(setf char-eps (list))
		(loop while (and (listp form) (equal 3 (length form)) (equal (second form) '**))
			do (progn
			(setf char-eps (append (list (third form)) char-eps))
			(setf form (car form))
			)
		)

		(if (not (listp form))
			(return-from loop-outer)
		)

		; Strip prop mods and NOTs.
		(setf pmods (list))
		(loop while (and (listp form) (equal 2 (length form)) (or (canon-mod? (car form)) (equal 'NOT (car form)))) do (block loop-inner
			(progn
			(setf pmods (append (list (car form)) pmods))
			(setf form (second form))
			)
		))

		(if (not (listp form))
			(return-from loop-outer)
		)

		(if (or (null pmods) (loop for e in pmods always (equal 'NOT e)))
			(return-from loop-outer)
		)

		; We should have a fully fixed predicate by now,
		; or else we probably shouldn't be doing this
		; transformation.
		(if (not (canon-pred? (second form)))
			(return-from loop-outer)
		)

		; ...So we should also confirm no floating modifiers!
		(if (loop for e in (cddr form) thereis (canon-mod? e))
			(return-from loop-outer)
		)

		; Apply the prop mods to the predicate.
		(setf new-pred (copy-item (second form)))
		(loop for pmod in pmods
			if (not (equal 'NOT pmod))
			do (setf new-pred (list pmod new-pred))
		)

		; Replace the predicate.
		(setf new-form (append (list (car form) new-pred) (cddr form)))

		; Re-apply charstars.
		(loop for char-ep in char-eps
			do (setf new-form (list new-form '** char-ep))
		)

		; Re-apply NOTs.
		(loop for pmod in pmods
			if (equal 'NOT pmod)
			do (setf new-form (list 'NOT new-form))
		)

		; Remove the old form and add the new one.
		(setf phi-copy (remove loop-form phi-copy :test #'equal))
		(setf phi-copy (append (list new-form) phi-copy))
	))

	(return-from outer phi-copy)
)
)

(defun charstar-triple? (x)
	(and
		(listp x)
		(equal 3 (length x))
		(equal (second x) '**)
	)
)

(defun sk-charstar-triple? (x)
	(and
		(charstar-triple? x)
		(lex-skolem? (third x))
	)
)

(defun bubble-up-pred-charstars (phi)
(block outer
	(setf phi-copy (copy-list phi))

	(loop for loop-form in phi do (block loop-outer
		(setf form (copy-item loop-form))

		; Strip existing charstars.
		(setf char-eps (list))
		(loop while (and (listp form) (equal 3 (length form)) (equal (second form) '**))
			do (progn
			(setf char-eps (append (list (third form)) char-eps))
			(setf form (car form))
			)
		)

		(if (not (listp form))
			(return-from loop-outer)
		)


		; Find embedded charstars.
		; (Only with Skolemized episodes---variables usually
		; mean we still need to process out a lambda/quantifier.)
		(setf embedded-eps (list))
		(setf new-form (copy-list form))
		(setf embedded (get-elements-pred-pairs new-form #'sk-charstar-triple?))
		(loop while (not (null embedded)) do (block loop-inner
			(setf embedded-form (car (car (car embedded))))
			(setf embedded-ep (third (car (car embedded))))
			(setf embedded-eps (append (list embedded-ep) embedded-eps))
	
			; Replace embedded charstars with the naked predicates.
			; (format t "target is ~s~%" (second (car embedded)))
			; (format t "new val is ~s~%" embedded-form)
			(setf new-form (replace-element-idx new-form (second (car embedded)) embedded-form))
	
			(setf embedded (get-elements-pred-pairs new-form #'sk-charstar-triple?))
		))

		; Re-apply embedded charstars on the outside.
		(loop for e in embedded-eps
			do (setf new-form (list new-form '** e))
		)

		; Re-apply existing charstars.
		(loop for char-ep in char-eps
			do (setf new-form (list new-form '** char-ep))
		)

		; Remove the old form from the copy and add the new one.
		(setf phi-copy (remove loop-form phi-copy :test #'equal))
		(setf phi-copy (append (list new-form) phi-copy))
	))

	(return-from outer phi-copy)
)
)

(defun and-list? (l)
(and
	(listp l)
	(> (length l) 1)
	(or
		(equal (car l) 'AND)
		(equal (car l) 'AND.CC)
	)
)
)

(defun split-and-preds (phi)
(block outer
	(setf phi-copy (copy-list phi))

	(loop for e in phi do (block loop-outer
		(if (or
				; (IND (AND P1 P2 ...))
				(and
				(equal 2 (length e))
				(canon-individual? (car e))
				(and-list? (second e)))

				; (IND AND P1 P2 ...)
				(and
				(canon-individual? (car e))
				(and-list? (cdr e)))
			)
			; then
			(block loop-inner
				; (format t "split-and-preds got ~s~%" e)
				(setf and-list (second e))
				(if (and-list? (cdr e)) (setf and-list (cdr e)))
				(setf new-forms (mapcar (lambda (x) (list (car e) x)) (cdr and-list)))


				; (format t "got and-list ~s~%" (cdr and-list))
				; If the predicates have associated episodes,
				; we'll infer here that they're consecutive.
				(setf pred-eps (loop for e in (cdr and-list) if (and (listp e) (charstar-triple? (strip-pred-mods-individuals e))) collect (strip-pred-mods-individuals e)))
				(setf consec-forms (list))
				(if (> (length pred-eps) 1)
					; then
					(progn
					(setf last-pred-ep nil)
					(loop for pred-ep in pred-eps
							for i from 0 do (block consec-eps-block
						(if (> i 0)
							; then
							(setf consec-forms (append consec-forms (list (list (third last-pred-ep) 'CONSEC (third pred-ep)))))
						)

						(setf last-pred-ep pred-ep)
					))
					)
				)
				(if (not (null consec-forms))
					; then
					(setf phi-copy (append consec-forms phi-copy))
				)

				(setf phi-copy (append new-forms phi-copy))
				(setf phi-copy (remove e phi-copy :test #'equal))
			)
		)
	))

	(return-from outer phi-copy)
)
)

(defun split-double-charstars (phi)
(block outer
	(setf phi-copy (copy-list phi))

	(loop for e in phi do (block loop-outer
		(if (and
				(listp e)
				(listp (car e))
				(equal 3 (length e))
				(equal (second e) '**)
				(equal 3 (length (car e)))
				(equal (second (car e)) '**))
			; then
			(block loop-inner
				(setf form (car (car e)))
				(setf add1 (list form '** (third (car e))))
				(setf add2 (list form '** (third e)))
				(setf phi-copy (append (list add1 add2) phi-copy))
				(setf phi-copy (remove e phi-copy :test #'equal))
			)
		)
	))

	(return-from outer phi-copy)
)
)

(defun and-chain (phis)
;(norm-singletons
(unwrap-singletons
	(loop for phi in phis
		for i from 0
			if (equal i 0)
				append (list phi)
			else
				append (list 'AND.CC phi)
	)
)
)

(defparameter *EXISTENTIAL-SYMS* '(
	ONE.DET
	A.DET
	AN.DET
	SOME
	THE
	THE.DET
))

; probably-pred identifies things that
; are either canon preds, or will be later,
; once other fixes are applied. This helps
; massage out some cyclical dependencies
; between fix rules.
(defun probably-pred? (p)
(block outer
	; If it's a pred with floating mods,
	; it can pass---those will get fixed
	; later, so we'll strip them out now.
	(setf stripped-p (copy-item p))
	(setf did-strip-mods nil)
	(if (listp stripped-p)
		; then
		(loop for el in p
			do (if (canon-mod? el)
				; then
				(progn
				(setf stripped-p (remove el stripped-p :test #'equal))
				(setf did-strip-mods t)
				)
			)
		)
	)
	(if did-strip-mods
		; then
		(progn
		; (format t "recursing on stripped ~s~%" stripped-p)
		(return-from outer (probably-pred? (unwrap-singletons stripped-p)))
		)
	)

	; Strip charstars
	(if (charstar-triple? p)
		(return-from outer (probably-pred? (car p)))
	)

	; BE.V is weird and can pass
	(if (and (listp p) (equal (car p) 'BE.V))
		(return-from outer t)
	)

	(if (canon-pred? p)
		(return-from outer t)
	)
)
)

(defun strip-pred-mods-individuals (p)
(block outer
	(return-from outer (unwrap-singletons (loop for e in p if (not (or (canon-mod? e) (canon-individual? e))) collect e)))
)
)

(defun unfloat-modifiers (phi)
	(process-construction phi
		(lambda (x)
			(or
				(member x phi :test #'equal)
				(and (listp x) (equal (car x) 'KA))
			)
		)

		#'unfloat-modifiers-processor)
)

(defun unfloat-modifiers-processor (pair phi)
(block outer
	(setf phi-copy (copy-list phi))
	;(loop for loop-form in phi do (block loop-outer

	(setf loop-form (car pair))

	(block loop-outer
		(setf form (copy-item loop-form))
		(setf char-ep nil)
		(setf pr-mods (list))

		; Strip charstars.
		(if (and (equal 3 (length form)) (equal (second form) '**))
			; then
			(progn
			(setf char-ep (third form))
			(setf form (car form))
			)
		)

		(if (not (listp form))
			(return-from loop-outer)
		)

		; Strip propositional modifiers and NOT.
		(loop while (and (equal (length form) 2) (or (equal (car form) 'NOT) (canon-mod? (car form))))
			do (progn
			(setf pr-mods (append (list (car form)) pr-mods))
			(setf form (second form))
			)
		)

		(if (not (listp form))
			(return-from loop-outer)
		)

		; If the second element is an illegal pred charstar,
		; strip it now.
		(setf embedded-char-ep nil)
		(if (and
			(equal (length form) 2)
			(listp (second form))
			(equal (length (second form)) 3)
			(equal (second (second form)) '**))
			; then
			(progn
			(setf embedded-char-ep (third (second form)))
			(setf form (list (car form) (car (second form))))
			)
		)

		; Modifiers can't float in lists of size 2
		; unless they're the second element. But,
		; the second element is a predicate, so
		; we can try flattening it in and continuing,
		; if it has modifiers floating in its top level.
		(if (and
				(equal (length form) 2)
				(not (canon-mod? (second form)))
				(listp (second form))
				(loop for e in (second form) thereis (canon-mod? e))
			)
			; then
			(if (listp (second form))
				; then
				(progn
				(setf form (append (list (car form)) (second form)))
				)
				; else
				(return-from loop-outer)
			)
		)

		(setf uf-mods (list))

		; Loop through and collect all modifiers.
		; Apply them to the predicate, and leave the
		; individuals alone. If there's a third type,
		; this isn't a valid predicate and we should
		; leave it alone.
		(setf uf-target (copy-item form))
		(setf uf-pred nil)
		(loop for el in form
			for i from 0 do (block loop-inner
			(cond
			; Only one pred allowed.
			((probably-pred? el)
				; then
				(if (not (null uf-pred))
					; then
					(return-from loop-outer)
					; else
					(setf uf-pred el)
				)
			)

			((canon-individual? el)
				(return-from loop-inner))

			; Mods are allowed in the first slot
			; of a (mod pred) pair, but nowhere
			; else.
			((canon-mod? el)
				(if (not (equal i 0))
					; then
					(progn
					(setf uf-mods (append uf-mods (list el)))
					(setf uf-target (remove el uf-target :test #'equal))
					)
				)
			)

			; Only mods, preds, and individuals allowed.
			;(t (return-from loop-outer))
		)))

		(setf new-uf-pred (copy-item uf-pred))

		; Strip off all legal modifiers that were already
		; applied to the predicate.
		(setf existing-mods (list))
		(loop while (and
						(listp new-uf-pred)
						(equal (length new-uf-pred) 2)
						(canon-mod? (car new-uf-pred)))
			do (progn
				(setf existing-mods (append (list (car new-uf-pred)) existing-mods))
				(setf new-uf-pred (second new-uf-pred))
			)
		)
		(setf uf-mods (append existing-mods uf-mods))

		; If the predicate also wraps up floating mods,
		; e.g. (I.PRO REALLY.ADV-A (GO.V (ADV-A TO.P SCHOOL1.SK))),
		; we'll bubble them up, too.
		(if (and
				(not (null new-uf-pred))
				(listp new-uf-pred))
			; then
			(progn
				(setf inner-pred-mods (loop for e in new-uf-pred if (canon-mod? e) collect e))
				(if (and
						(not (null inner-pred-mods))
						; A mod's not floating if the length is 2
						; and the mod is the first element.
						(not (and (equal (length new-uf-pred) 2) (canon-mod? (car new-uf-pred))))
					)
					; then
					(progn
						(setf uf-mods (append inner-pred-mods uf-mods))
						(setf new-uf-pred (unwrap-singletons (loop for e in new-uf-pred if (not (canon-mod? e)) collect e)))
					)
				)
			)
		)

		; Stack the floating mods on the predicate.
		(loop for m in uf-mods
			do (setf new-uf-pred (list m new-uf-pred))
		)

		; Replace the old predicate.
		(setf uf-target (replace-vals uf-pred new-uf-pred uf-target))

		; Re-apply any stripped propositional modifiers.
		(loop for pm in pr-mods
			do (setf uf-target (list pm uf-target))
		)

		; Replace any stripped charstars.
		(if (not (null char-ep))
			; then
			(setf uf-target (list uf-target '** char-ep))
		)
		(if (not (null embedded-char-ep))
			; then
			(setf uf-target (list uf-target '** embedded-char-ep))
		)

		; Replace the old formula.
		; (setf phi-copy (replace-vals loop-form uf-target phi-copy))
		(setf phi-copy (replace-element-idx phi-copy (second pair) uf-target))
	)

	(return-from outer phi-copy)
)
)

(defun process-construction (phi pred processor)
(let (last-phi-copy phi-copy)
(block outer
	(setf last-phi-copy nil)
	(setf phi-copy (copy-list phi))

	(block loop-outer
		(setf pairs nil)

		; We want to avoid processing some things because we know they're
		; unfixable (i.e. idempotent transformations on an unerasable error).
		; Hopefully, they'll be repaired in due time by another rule, and then
		; fed back here to be processed for real; we're only skipping them for
		; this call to process-construction.
		(setf skippable (make-hash-table :test #'equal))

		(loop while t do (block loop-inner
			(setf pairs (get-elements-pred-pairs phi-copy pred))

			(if (null pairs)
				(return-from loop-outer)
			)

			; Advance through the list of pairs until an unskippable one
			; is found
			; (format t "pre pairs is ~s~%" pairs)
			(block skip-loop (loop while t
				do (if (and (> (length pairs) 0) (gethash (car pairs) skippable))
					; then
					(setf pairs (cdr pairs))
					; else
					(return-from skip-loop))
			))
			; (format t "post pairs is ~s~%" pairs)
			; (format t "skippable was ~s~%" (ht-to-str skippable))

			; Check again whether there's a valid pair
			(if (null pairs)
				(return-from loop-outer)
			)

			; The processor takes a pair and a formula and returns a new formula.
			(setf phi-copy (funcall processor (car pairs) phi-copy))
			(if (null phi-copy)
				(format t "processor ~s gave value nil~%" processor)
			)

			(if (same-list-unordered phi-copy last-phi-copy)
				; then
				(progn
				; (format t "setting ~s as skippable~%" (car pairs))
				(setf (gethash (car pairs) skippable) t)
				)
			)

			(setf last-phi-copy (copy-list phi-copy))
		))
	)

	(return-from outer phi-copy)
)
)
)

(defun norm-conjunctive-infixes (phi)
	(process-construction phi
		; (mk-ttt-pred '(canon-prop? (+ (<> AND canon-prop?))))
		(mk-ttt-pred '(_! (+ (<> AND _!))))

		#'norm-conjunctive-infixes-processor
	)
)

(defun norm-conjunctive-infixes-processor (pair phi)
(block outer
	; (format t "infix processor called on ~s~%" (car pair))

	(setf form (car pair))
	(setf conj (second form))
	(setf subforms (loop for e in form if (not (equal e conj)) collect e))
	(setf new-form (append (list conj) subforms))

	(setf phi-copy (replace-element-idx phi-copy (second pair) new-form))

	(return-from outer phi-copy)
)
)

(defun skolem-sym-num (s)
(if (and
		(symbolp s)
		(> (length (string s)) 11)
		(equal "NEW-SKOLEM-" (subseq (string s) 0 11))
		(num-str? (subseq (string s) 11 (length (string s)))))
	; then
	(parse-integer (subseq (string s) 11 (length (string s))))
)
)

(defun skolem-sym? (s)
	(not (null (skolem-sym-num s)))
)

(defun get-highest-skolem-num (phi)
	(reduce #'max (append (list 0) (mapcar #'skolem-sym-num (remove-duplicates (get-elements-pred phi #'skolem-sym?)))))
)

; Reports whether the subtree rooted at the given
; tree index are free of any scope dependencies.
(defun free-scope? (idx phi)
)

(defun skolemize-adets-processor (pair phi)
(block outer
	(setf adet (car pair))

	(if (not (listp adet))
		(return-from outer phi)
	)

	; Some quantifiers are tagged with this.
	(if (equal (car adet) ':Q)
		(progn
		; (format t "got :Q in ~s~%" adet)
		(setf adet (cdr adet))
		)
	)

	(setf adet-idx (second pair))

	; Check whether the Skolemization would be
	; free or relative to another quantifier.
	(if (loop for anc in (idx-ancestors phi adet-idx)
			; NOTE: can't use canon-lambda? here because
			; there may be unrepaired syntax inside the lambda,
			; which could lead to this Skolemization happening
			; anyway before the lambda gets repaired. Rule
			; application ordering could fix this, but we can
			; also just assume that one of these headers is
			; present iff the remainder will be accurately
			; repaired into the appropriate structure.
			thereis (or
				(equal (caar anc) 'L)
				(equal (caar anc) 'LAMBDA)
				(equal (caar anc) 'LAMBDA.EL)
				(equal (caar anc) 'ALL)))
		; then
		(return-from outer phi)
	)

	(setf atemporals (list))

	(setf skolem-placeholder-num (get-highest-skolem-num phi))

	(setf skolem-placeholder (intern (format nil "NEW-SKOLEM-~s" skolem-placeholder-num)))

	(setf skolem-placeholder-num (+ 1 skolem-placeholder-num))

	(setf adet-var (second adet))
	; (setf adet-formulas (replace-vals adet-var skolem-placeholder (cddr adet)))
	(setf adet-formulas (subst-for-free skolem-placeholder adet-var (cddr adet)))

	; (format t "formulas are ~s~%" adet-formulas)


	; (format t "second adet is ~s~%" (second adet))
	(if (and
			(equal (length adet) 2)
			;(or (equal (car adet) 'THE) (equal (car adet) 'THE.DET))
			;(canon-pred? (second adet))
		)
		; then
		(block handle-the
			; Skolemize the predicate (by its name, if possible)
			(setf new-skolem nil)
			(if (symbolp (second adet))
				; then
				(setf new-skolem (new-skolem! (intern (car (split-str (format nil "~s" (second adet)) ".")))))
				; else
				(progn
				(setf new-skolem (new-skolem! 'OBJECT))
				)
			)
			; (format t "new skolem name is ~s~%" new-skolem)
			; (format t "body is ~s~%" (second adet))

			; Replace the THE-clause with the Skolem name
			(setf phi-copy (replace-element-idx phi adet-idx new-skolem))

			; Add the atemporal Skolem proposition to the conjunction
			(setf phi-copy (append (list (list new-skolem (second adet))) phi-copy))

			(return-from outer phi-copy)
		)
		; else
		(if (or (equal (car adet) 'THE) (equal (car adet) 'THE.DET))
			; then
			(progn
				; (format t "ERROR: invalid THE construction ~s~%" adet)
				(return-from outer phi)
			)
		)
	)

	; If the second part of a length-2 thing isn't a predicate, we can't do anything.
	;(if (equal (length adet) 2)
	;	(return-from outer phi)
	;)
			

	; SOME quantifiers have restrictor matrices, which we can count as "adet formulas"
	; for the later replacement. We'll split by ANDs and mark each split formula down,
	; though, so that we can automatically determine that they should be added as
	; atemporals.
	(setf restrictors (list))
	(if (equal (car adet) 'SOME)
		; then
		(block handle-some
			;(setf adet-formulas (replace-vals adet-var skolem-placeholder (cdddr adet)))
			(setf adet-formulas (subst-for-free skolem-placeholder adet-var (cdddr adet)))
			; (setf restrictors (replace-vals adet-var skolem-placeholder (split-lst (third adet) 'AND)))
			(setf restrictors (subst-for-free skolem-placeholder adet-var (split-lst (third adet) 'AND)))
			(setf adet-formulas (append adet-formulas restrictors))
		)
	)

	(setf final-adet-formulas (list))
	(loop for form in adet-formulas
		; TODO: better if condition here to identify atemporals
		do (if (or (and (listp form) (equal skolem-placeholder (car form))) (member form restrictors :test #'equal) )
			; then
			(setf atemporals (append atemporals (list form)))
			; else
			(setf final-adet-formulas (append final-adet-formulas (list form)))
		)
	)

	; Replace the adet
	(setf phi-copy (replace-element-idx phi adet-idx (and-chain final-adet-formulas)))



	; Add the atemporals
	(setf phi-copy (append atemporals phi-copy))

	; Make a new Skolem name based on the first atemporal.
	; Probably there'll only ever be one (valid) one for this.
	; If there isn't one at all, we'll just call it "OBJECT".
	(setf new-skolem nil)
	(loop for atemp in atemporals
		if (and (equal 2 (length atemp)) (symbolp (second atemp)))
			do (setf new-skolem (new-skolem! (intern (car (split-str (format nil "~s" (second atemp)) ".")))))
	)
	(if (null new-skolem)
		(setf new-skolem (new-skolem! 'OBJECT))
	)

	(setf phi-copy (replace-vals skolem-placeholder new-skolem phi-copy))
	(return-from outer phi-copy)
)
)

(defun skolemize-adets (phi)
	(process-construction
		phi
		(lambda (x)
			(and
				(listp x)
				(> (length x) 1)
				(or
					(member (car x) *EXISTENTIAL-SYMS* :test #'equal)
					(and
						(> (length x) 2)
						(equal (car x) ':Q)
						(member (second x) *EXISTENTIAL-SYMS* :test #'equal)
					)
				)
			)
		)
		#'skolemize-adets-processor)
)

(defun apply-lambda (l args)
(block outer
	(if (not (canon-lambda? l))
		(return-from outer nil))

	(setf l-args (listify-nonlists (second l)))
	(if (not (equal (length l-args) (length args)))
		(return-from outer nil)
	)

	(setf l-form (third l))
	(loop for arg in args
		for l-arg in l-args
			; do (setf l-form (replace-vals l-arg arg l-form)))
			do (setf l-form (subst-for-free arg l-arg l-form)))

	(return-from outer l-form)
)
)

(defun split-top-level-lambda-ands (phi)
(let (phi-copy props)
(block outer
	(setf phi-copy (copy-list phi))
	(loop for e in phi do (block loop-outer
		(if (and
				(listp e)
				(equal 2 (length e))
				(canon-lambda? (second e))
				(equal (car (third (second e))) 'AND))
			; then
			(block loop-inner
				(setf props (cdr (apply-lambda (second e) (list (car e)))))
				(loop for prop in props do (block loop-add-constrs
					(setf phi-copy (append (list prop) phi-copy))
				))
				(setf phi-copy (remove e phi-copy :test #'equal))
			)
		)
	))

	(return-from outer phi-copy)
)
)
)

(defun apply-mono-lambdas (phi)
	(process-construction
		phi
		(lambda (x)
			(and
				(canon-atomic-prop? x)
				(let ((pred (prop-pred x))) (and
				(canon-lambda? pred)
				(equal 1 (length (listify-nonlists (second pred)))))
		)))

		#'apply-mono-lambdas-processor
	)
)

(defun apply-mono-lambdas-processor (pair phi)
(block outer
	; (format t "mono lambda processor got ~s~%" pair)

	(setf lam-breakdown (prop-args-pred-mods (car pair)))

	(setf l-pre-args (car lam-breakdown))
	(setf lam (second lam-breakdown))
	(setf l-post-args (third lam-breakdown))
	(setf l-mods (fourth lam-breakdown))
	(setf l-var (car (listify-nonlists (second lam))))

	;(setf l-props (get-elements-pred-pairs (third lam)
	;	(lambda (p) (and
	;		(canon-atomic-prop? p)
	;		(equal 1 (length (prop-pre-args p)))
	;		(equal (car (prop-pre-args p)) l-var)))))
	;(setf l-props (get-elements-pred-pairs (third lam)
	;	(lambda (p) (and (listp p) (> (length p) 0) (equal (car p) l-var)))))
	;(format t "enclosed props:~%")
	;(loop for lp in l-props
	;	do (format t "	~s~%" lp))
	;(format t "and mods to apply:~%")
	;(loop for lp in l-mods
	;	do (format t "	~s~%" lp))

	
	(defun tmp-stack-mods! (lst)
		(block outer
			(setf tmp-sm-cursor (copy-list lst))
			(loop for lm in l-mods
				do (setf tmp-sm-cursor (list lm tmp-sm-cursor)))
			(return-from outer tmp-sm-cursor)
		)
	)

	(setf lam-body (copy-item (third lam)))

	; We're going to use two temp symbols: one to
	; only consider propositions over the lambda
	; variable *before it gets re-bound*, and another
	; to make sure we don't infinitely correct props
	; with the first symbol, because the correction
	; would otherwie still have it.

	(setf tmp-sym1 (gensym))

	(setf lam-body (subst-for-free tmp-sym1 l-var lam-body))

	(setf tmp-sym2 (gensym))
	(setf lam-body (ttt-replace lam-body
		(list tmp-sym1 '_*)
		(list 'tmp-stack-mods! (list tmp-sym2 '_*))))
	; (setf lam-body (replace-vals tmp-sym (car l-pre-args) lam-body))
	(setf lam-body (subst-for-free (car l-pre-args) tmp-sym2 lam-body))

	; (format t "stacked mods on inner pred to get: ~s~%" lam-body)

	; (format t "~%~%~%")

	(setf phi-copy (replace-element-idx phi (second pair) lam-body))

	(return-from outer phi-copy)
)
)

(defun anded-props? (l)
	(and (listp l) (> (length l) 0) (equal (car l) 'AND)
		(loop for e in (cdr l) always (canon-prop? e)))
)

(defun split-top-level-ands (phi)
(block outer

	(setf phi-copy (copy-list phi))
	(loop for e in phi do (block loop-outer
		; Ignore an AND at the beginning, so that we
		; can use this same function to handle ones
		; that are missing their ANDs.
		(setf target e)
		(if (and (listp e) (> (length e) 0) (equal (car e) 'AND))
			; then
			(setf target (cdr e))
		)

		; Ignore splitting infix ANDs, too.
		;(if (matches-ttt target '(canon-prop? (+ (<> AND canon-prop?))))
			; then
			;(setf target (split-lst target 'AND))
		;)

		(if (and (listp target) (loop for form in target always (or (canon-prop? form) (anded-props? form))))
		;(if (listp target)
			; then
			(block split-ands
			(loop for form in target
				if (canon-prop? form)
				do (setf phi-copy (append (list form) phi-copy))
				if (anded-props? form)
				do (setf phi-copy (append (cdr form) phi-copy)))
			(setf phi-copy (remove e phi-copy :test #'equal))
			)
		)
	))

	(return-from outer phi-copy)
)
)

; TODO: do this for > 2 and-chained props
(defun split-and-eps (phi)
(block outer
	(setf phi-copy (copy-list phi))
	(loop for phi-e in phi do (block loop-outer
		(setf e phi-e)
		(if (and
				(listp e)
				;(canon-charstar? e)
				(equal (second e) '**)
				(lex-skolem? (third e))
				(listp (car e))
				(equal 3 (length (car e)))
				(equal 'AND.CC (second (car e)))
				;(canon-prop? (car (car e)))
				;(canon-prop? (third (car e)))
				)
			; then
			(block loop-inner
				(setf ep (third e))
				(setf prop1 (car (car e)))
				(setf prop2 (third (car e)))
				(setf subep1 (new-skolem! 'E))
				(setf subep2 (new-skolem! 'E))
				(setf phi-copy (append (list (list subep1 'DURING ep)) phi-copy))
				(setf phi-copy (append (list (list subep2 'DURING ep)) phi-copy))
				(setf phi-copy (append (list (list subep1 'CONSEC subep2)) phi-copy))
				(setf phi-copy (remove e phi-copy :test #'equal))
				(setf phi-copy (append phi-copy (list (list prop1 '** subep1))))
				(setf phi-copy (append phi-copy (list (list prop2 '** subep2))))
			)
		)
	))

	(return-from outer phi-copy)
)
)

(defun schema-cleanup-ttt (phi)
	(unhide-ttt-ops
		(ttt:apply-rules *SCHEMA-CLEANUP-RULES*
			(hide-ttt-ops phi)
			:rule-order :slow-forward))
)

(defun schema-cleanup-lisp (phi)
(block outer
	(setf phi-copy (copy-list phi))
	(loop for func in *SCHEMA-CLEANUP-FUNCS*
		do (block inner
			(setf old-phi-copy (copy-list phi-copy))
			(setf new-phi-copy (funcall func phi-copy))
			(setf phi-copy new-phi-copy)
			(if (null phi-copy)
				(format t "func ~s gave null phi~%" func)
			)
		)
	)
	(return-from outer phi-copy)
)
)

(defun schema-cleanup (phi)
(let (last-phi-copy phi-copy)
(block outer
	; until convergence
	(setf last-phi-copy (copy-list phi))
	(setf phi-copy (copy-list phi))
	(loop while t do (block inner
		(setf phi-copy (remove-duplicates (schema-cleanup-ttt phi-copy) :test #'equal))
		(setf phi-copy (remove-duplicates (schema-cleanup-lisp phi-copy) :test #'equal))
		(if (same-list-unordered phi-copy last-phi-copy)
			; then
			(return-from outer phi-copy)
			; else
			(progn
			; (format t "last phi ~s didn't equal phi ~s~%" last-phi-copy phi-copy)
			(setf last-phi-copy (copy-list phi-copy))
			)
		)
	))
)
)
)

; (defparameter *PHI* '(KA (L Y (Y GO.V (K BIRDING.N)))))
; (defparameter *PSI* '(KA (L Y (Y EAT.V))))
; (format t "~s~%	-> ~s~%" *PHI* (uncompress-lambda *PHI*))
; (format t "~s~%	-> ~s~%" *PSI* (uncompress-lambda *PSI*))

; (defparameter *PHI* '(
 ;((((MAN6.SK EAT.V) AND.CC (MAN6.SK SLEEP.V)) ** E5.SK) ** E4.SK)))


; (format t "~s~%" (schema-cleanup *PHI*))

(defun schema-parse (sent)
	(schema-cleanup (interpret sent))
)

(defun sp (sent)
	;(format t "~s~%" (interpret sent))
	(format t "~s~%" (schema-parse sent))
	; (format t "~s~%" (skolemize-adets (interpret sent)))
)

; (sp "They took it home and put it in a bucket.")
;(sp "Today we were playing outside.")
;(sp "We saw a lot of dark clouds in the sky.")

;(sp "My son is a little child.")

(defun process-stdin-story (story-processor-fn should-fix)
(block outer
	(let ((sentences (list)) (lines (list)))
	(loop while t do (let ((line (read-line)))
		(if (> (length line) 0)
			; then
			(progn
			(setf sentences (append sentences (list
				(if should-fix
					; then
					(schema-parse line)
					; else
					(interpret line)
				)
			)))
			(setf lines (append lines (list line)))
			)
			; else
			(progn
				(funcall story-processor-fn sentences lines)
				(setf sentences (list))
				(setf lines (list))
			)
		)
	)))
))

; (process-stdin-story (lambda (sents lines) (format t "~s~%~%~%" sents)))
