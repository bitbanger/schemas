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

(defun lex-attr-pred? (x)
(or
	(has-ext? x ".N")
	(has-ext? x ".NN")
	(has-ext? x ".A")
)
)

(defun lex-noun? (x)
	(has-ext? x ".N")
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
		(list 'AND (mapcar (lambda (x) (list tmp-sym x)) ps)))
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

	; Apply attr modifiers to composite nouns.
	(/
		((!1 lex-attr-pred?) (!2 lex-noun?))
		((ATTR !1) !2)
	)

	; Clean up this weird construction for now.
	(/
		(_!1 BE.V (= _!2))
		(_!1 EL_EQUAL.V _!2)
	)

	; Sometimes it tries to put preds in charstars.
	(/
		((!1 canon-pred?) [**] _!2)
		!1
	)

	; Un-flatten stacked predicates.
	(/
		((* ~ AND.CC) ((+ nonverb-pred?)))
		(* (lambdify-preds! (+)))
	)

	; To BE.V, or not to BE.V?
	(/
		(BE.V (!1 canon-pred?))
		!1
	)
))

(defparameter *SCHEMA-CLEANUP-FUNCS* '(
	skolemize-adets
	split-and-eps
	norm-conjunctive-infixes
	split-top-level-lambda-ands
	apply-mono-lambdas
))

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
	A.DET
	AN.DET
	SOME
	THE
	THE.DET
))

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

			(if (equal phi-copy last-phi-copy)
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
		(mk-ttt-pred '(canon-prop? (+ (<> AND canon-prop?))))

		#'norm-conjunctive-infixes-processor
	)
)

(defun mk-ttt-pred (pattern)
	(lambda (x) (matches-ttt x pattern))
)

(defun matches-ttt (phi pattern)
(let ((new-sym (gensym)))
	(equal new-sym (unhide-ttt-ops
		(ttt:apply-rules
			(list (list '/ pattern new-sym))
			(hide-ttt-ops phi)
			:rule-order :slow-forward)))
)
)

(defun ttt-replace (phi old new)
	(unhide-ttt-ops
		(ttt:apply-rules
			(list (list '/ old new))
			(hide-ttt-ops phi)
			:rule-order :slow-forward))
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
			(canon-pred? (second adet)))
		; then
		(block handle-the
			; Skolemize the predicate (by its name, if possible)
			(setf new-skolem nil)
			(if (symbolp (second adet))
				; then
				(setf new-skolem (new-skolem! (intern (car (split-str (format nil "~s" (second adet)) ".")))))
				; else
				(setf new-skolem (new-skolem! 'OBJECT))
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
			

	; HANDLE (SOME E0 (E0 BEFORE NOW0) USE.V)

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

	(setf lam-body (copy-list (third lam)))

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

; TODO: do this for > 2 and-chained props
(defun split-and-eps (phi)
(block outer
	(setf phi-copy (copy-list phi))
	(loop for e in phi do (block loop-outer
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
			(setf phi-copy (funcall func phi-copy))
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
		(setf phi-copy (schema-cleanup-ttt phi-copy))
		(setf phi-copy (schema-cleanup-lisp phi-copy))
		(if (equal phi-copy last-phi-copy)
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

(defun process-stdin-story (story-processor-fn)
(block outer
	(let ((sentences (list)) (lines (list)))
	(loop while t do (let ((line (read-line)))
		(if (> (length line) 0)
			; then
			(progn
			(setf sentences (append sentences (list (schema-parse line))))
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
