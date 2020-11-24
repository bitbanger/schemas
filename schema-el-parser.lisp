(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "ttt/src/load")
(ll-load-subdir "el_parse" "init1.lisp")
(ll-load "ll-util.lisp")
(ll-load "schema-el-lex.lisp")
(ll-load "schema-el.lisp")
(ll-load "schema-coref.lisp")

(defparameter *KA-ARG-VERBS* '(
	WANT.V
	NEED.V
	BELIEVE.V
	HOPE.V
	GET.V
	THINK.V
	WISH.V
	TELL.V
	ASK.V
	FORCE.V
	TRY.V
	SEEM.V
	APPEAR.V
	DECIDE.V
	LIKE.V
	LOVE.V
	HATE.V
	DISLIKE.V
))

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
	(lambdify-preds-maybe-colon ps nil)
)

(defun lambdify-preds-colon! (ps)
	(lambdify-preds-maybe-colon ps t)
)

(defun lambdify-preds-maybe-colon (ps colon)
(let ((tmp-sym (gensym)))
	(list
		(if colon ':L 'L)
		tmp-sym
		(if colon
			; then
			(append (list ':O 'AND) (mapcar (lambda (x) (list ':I tmp-sym x)) ps))
			; else
			(append (list 'AND) (mapcar (lambda (x) (list tmp-sym x)) ps))
		)
	)
)
)

(defun idx-tag-num (sym)
(block outer
	(if (and
			(symbolp sym)
			(equal 3 (length (split-str (string sym) "$")))
			(is-num-str? (second (split-str (string sym) "$")))
		)
		; then
		(let ((spl (split-str (string sym) "$")))
			(return-from outer (parse-integer (second spl)))
		)
		; else
		(return-from outer nil)
	)
)
)

(defun remove-idx-tag (sym)
(block outer
	(if (and
			(symbolp sym)
			(equal 3 (length (split-str (string sym) "$")))
			(is-num-str? (second (split-str (string sym) "$")))
		)
		; then
		(let ((spl (split-str (string sym) "$")))
			(return-from outer (intern (format nil "~a~a" (car spl) (third spl))))
		)
		; else
		(return-from outer sym)
	)
)
)

(defun pred-vp? (s)
(and
	(symbolp s)
	(has-ext? s ".VP")
	(has-prefix? (string s) "PRED")
)
)

(defun mono-lam? (l)
(and
	(listp l)
	(equal (length l) 3)
	(equal (car l) 'L)
	(symbolp (second l))
	(equal (second l) (third l))
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

	; Fix weird DO.V
	(/
		(pred-vp? mono-lam? _*)
		(DO.V _*)
	)

	; s/TO/KA/g
	(/
		TO
		KA
	)

	; N'T is NOT
	(/
		|N'T.ADV|
		NOT
	)

	; N'T with explicit bars is also NOT
	; (I'm not sure why this happens)
	(/
		|\|N'T.ADV\||
		NOT
	)

	; :R can just be ADV-A
	(/
		(:R _+)
		(ADV-A _+)
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

	; Turn parallel kind and PP arguments inside PP
	; phrases into a valid, conjunctive construction,
	; e.g.,
	; (in.p ((k front.n) (of.p billy.name)))
	; becomes
	; (in.p (k (l x (and (x front.n) (x (of.p billy.name))))))
	(/
		((!1 lex-p?) ((K (!2 canon-pred?)) (!3 canon-prep?)))
		(!1 (K (lambdify-preds! (!2 !3))))
	)

	; Strip unnecessary parens from predicates.
	(/
		((!1 canon-pred?))
		!1
	)

	; Un-flatten stacked predicates.
	(/
		((* ~ AND.CC) ((+ nonverb-pred?)))
		(* (lambdify-preds! (+)))
	)
	(/
		((* ~ AND) ((+ nonverb-pred?)))
		(* (lambdify-preds! (+)))
	)

	; CAN should usually be CAN.MD.
	(/
		CAN
		CAN.MD
	)

	; We prefer MDs in this family
	(/
		WILL.AUX
		WILL.MD
	)

	; Floating prepositions in verb predicates should be mods.
	(/
		(_*1 (!2 canon-pred?) _*3 (!4 canon-prep?) _*5)
		(_*1 ((adv-a !4) !2) _*3 _*5)
	)
	(/
		(_*1 (!2 canon-prep?) _*3 (!4 canon-pred?) _*5)
		(_*1 ((adv-a !2) !4) _*3 _*5)
	)

	; Naked predicates as PP objects should be
	; reified, for lack of anything else to do.
	(/
		((!1 lex-p?) (!2 verb-pred?))
		(!1 (KA !2))
	)
	(/
		((!1 lex-p?) (!2 canon-pred?))
		(!1 (K !2))
	)

	; We don't need "such", "so", etc.
	; until we can figure out what to
	; do with them. (TODO)
	;(/
		;(_*1 SUCH.D _*2)
		;(_*1 _*2)
	;)

	; Un-flatten composite predicates.
	(/
		(<> (!2 canon-pred?) (+ canon-pred?))
		(lambdify-preds! (!2 +))
	)

	; Lambdify conjunctive predicates.
	(/
		(AND (+ canon-pred?))
		(lambdify-preds! (+))
	)
	(/
		(AND.CC (+ canon-pred?))
		(lambdify-preds! (+))
	)

	; Conjunctions of individuals are
	; actually sets.
	(/
		(AND (+ canon-individual?))
		(SET-OF +)
	)

	; Unwrap singleton individual lists.
	(/
		((!1 canon-individual?))
		!1
	)

	; Auxiliary "be" can always be a copula,
	; for now (Gene says it's OK!). Change when
	; Len adds aux-identification back into parser.
	(/
		BE.AUX
		BE.V
	)

	; Auxiliary "have" without a verb predicate
	; after it can be a verb.
	(/
		(HAVE.AUX (!1 ~ verb-pred?))
		(HAVE.V !1)
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

	; Fix non-auxiliary HAVE.AUX
	(/
		(HAVE.AUX (!1 ~ canon-ka?))
		(HAVE.V !1)
	)

	; Fix weird type-shifters
	(/
		(!1 modif-advp?)
		ADV-A
	)

	; Kill PRED****.VP
	;(/
	;	((!1 vp-shifter?) _+)
	;	(_+)
	;)

	; Unflatten post-args
	(/
		((!1 canon-individual?) (!2 canon-pred?) (+ canon-individual?))
		(!1 (!2 +))
	)

	; Remove progressive indicators
	(/
		((<> prog _*1 (!2 canon-pred?)))
		(_*1 !2)
	)

	; "Get <adj>" is valid, but kind-ify the adjective?
	(/
		(GET.V (!1 adj-pred?))
		(GET.V (KJ !1))
	)

	; Strip out some coordinating conjunctions.
	(/
		(BUT.CC _*1)
		(_*1)
	)
	(/
		(SO.CC _*1)
		(_*1)
	)
))

(defparameter *SCHEMA-CLEANUP-FUNCS* '(
	pull-out-lambda-advs ; run this before lambda splitters
	skolemize-adets
	split-and-eps
	norm-conjunctive-infixes
	split-top-level-lambda-ands
	apply-mono-lambdas
	; weird-lambda-to-do
	split-top-level-ands
	unfloat-modifiers
	split-double-charstars
	split-and-preds
	bubble-up-pred-charstars
	sink-prop-mods
	name-skolems
	deindex-will
	purposify-ka-args
	rename-gensyms
	flatten-nested-ands
	apply-such-determiners
	remove-aux-do-did
))

(defun extract-noun-sym (form)
(block outer
	(if (not (listp form))
		(return-from outer nil)
	)

	(setf last-noun nil)
	(loop for e in form
		if (or (lex-noun? e) (mp e (list (id? 'PLUR) 'lex-noun?)))
			do (setf last-noun e))

	(if (null last-noun)
		(return-from outer nil)
	)

	(if (mp last-noun (list (id? 'PLUR) 'lex-noun?))
		; then
		(setf last-noun (concat-strs (car (split-str (format nil "~s" (second last-noun)) ".")) "S"))
		; else
		(setf last-noun (car (split-str (format nil "~s" last-noun) ".")))
	)

	(return-from outer last-noun)
)
)

(defun deindex-will (phi)
(block outer
	(setf phi-copy (copy-list phi))
	(loop for form in phi do (block loop-outer
		(if (and
				(canon-charstar? form)
				(not (null (member 'WILL.MD (prop-mods (car form)) :test #'equal)))
			)
			; then
			(block loop-inner
				(setf deindexed-no-ep (ttt-replace
					(car form)
					(list 'will.md '_!1)
					'_!1
				))

				(setf new-ep (new-skolem! 'E))

				(setf deindexed (list deindexed-no-ep '** new-ep))

				(setf phi-copy (replace-vals form deindexed phi-copy))
				(setf phi-copy (append phi-copy (list (list new-ep 'AFTER (third form)))))
			)
		)
	))

	(return-from outer phi-copy)
)
)

(defun personal-pronoun? (p)
(and
	(has-suffix? (string p) "PRO")
	(or
		(has-prefix? (string p) "I$")
		(has-prefix? (string p) "ME$")
		(has-prefix? (string p) "HE$")
		(has-prefix? (string p) "SHE$")
		(has-prefix? (string p) "WE$")
		(has-prefix? (string p) "THEY$")
	)
)
)

(defun has-skolem-prefix? (sym pre)
(and
	(symbolp sym)
	(let ((spl (split-str (string sym) ".")))
		(equal (length spl) 2)
		(equal (second spl) "SK")
		(has-prefix? (car spl) pre)
		(is-num-str? (remove-prefix (car spl) pre))
	)
)
)

(defun is-characterized? (phi sym)
	(not (null (get-elements-pred phi (lambda (x)
		(and
			(canon-charstar? x)
			(equal (third x) sym)
		)
	))))
)

; Ideally, this wouldn't be necessary, but sometimes
; Skolemized things still get the OBJECT name, e.g. if
; a lambda-and predicate was Skolemized and couldn't be
; parsed for a name until it was split later.
; Further, certain things can be stuck with the default
; "E" name even if they don't characterize any episodes;
; we'll fix that, too.
(defun name-skolems (phi)
	(name-skolems-maybe-accept-non-nouns
		(name-skolems-maybe-accept-non-nouns phi nil)
		t
	)
)

(defun is-skolemized-from-pred (sk pred)
(let (noun-sym)
(block outer
	(setf noun-sym (extract-noun-sym pred))
	(if (and
		(not (null noun-sym))
		(has-prefix? (format nil "~s" sk) noun-sym)
		)
		; then
		(return-from outer t)
	)

	(return-from outer nil)
)
)
)

(defun name-skolems-maybe-accept-non-nouns (phi accept-non-nouns)
(block outer
	(setf phi-copy (copy-list phi))
	(loop for form in phi do (block loop-outer
		(if (not (listp form))
			(return-from loop-outer)
		)

		(if (and
				(listp form)
				(canon-charstar? form)
				(lex-skolem? (third form))
				; (has-prefix? (format nil "~s" (third form)) "OBJECT")
				(has-skolem-prefix? (third form) "OBJECT")
				)
			; then
			(block loop-inner
				(setf new-skolem (new-skolem! 'E))
				(setf phi-copy (replace-vals (third form) new-skolem phi-copy))
			)
		)

		(setf noun-sym (extract-noun-sym (second form)))

		(setf constraints (loop for form2 in phi if (and (equal (length form2) 2) (equal (car form2) (car form))) collect form2))

		(if (and
				(listp form)
				(equal 2 (length form))
				(lex-skolem? (car form))
				; don't rename it if another noun predicate has already "claimed" it:
				(loop for c in constraints never (is-skolemized-from-pred (car c) (second c)))
				(or
					(symbolp (second form))
					(and
						(not (null noun-sym))
						(not (has-prefix? (format nil "~s" (car form)) noun-sym))
					)
				)
				(or
					; we can replace renamed stuff if we find a noun
					(has-skolem-prefix? (car form) "OBJECT")
					(and
						(has-skolem-prefix? (car form) "E")
						(not (is-characterized? phi-copy (car form)))
					)
					(and
						(not (null noun-sym))
						(not (has-prefix? (format nil "~s" (car form)) noun-sym))
					)
				)
				)
			; then
			(block loop-inner
				(setf sym-prefix nil)


				(if (null noun-sym)
					; then
					(progn
						(setf sym-spl (split-str (format nil "~s" (second form)) "."))
						(setf sym-prefix (car sym-spl))
						(setf sym-suffix (second sym-spl))

						; Note: we prefer to do this with nouns. We can do it
						; with adjectives if no other "word" predicates are
						; available, but if there are several, we'll always
						; choose a noun first.
						(if (and (not accept-non-nouns) (not (equal sym-suffix "N")))
							; then
							(return-from loop-outer)
						)

						; if the thing is actually given the OBJECT.N predicate,
						; we don't need to rename it
						(if (equal sym-prefix "OBJECT")
							; then
							(return-from loop-outer)
						)
					)
					; else
					(setf sym-prefix noun-sym)
				)

				; (format t "replacing ~s with ~s~%" (car form) sym-prefix)

				(setf new-skolem (new-skolem! (intern sym-prefix)))
				(setf phi-copy (replace-vals (car form) new-skolem phi-copy))
			)
		)
	))

	(return-from outer phi-copy)
)
)

(defun unique-var (cursor used)
	(if (not (member cursor used :test #'equal))
		; then
		cursor
		; else
		(unique-var (next-str cursor) used)
	)
)

(defun replace-dets-with-k (x)
(block outer
	(if (not (listp x))
		; then
		(return-from outer x)
	)

	(setf x-copy (copy-item x))

	(setf dets (get-elements-pred x #'lex-det?))

	(loop for det in dets
		do (setf x-copy (replace-vals det 'K x-copy))
	)

	(return-from outer x-copy)
)
)

(defun arg-with-adv-lambda? (arg)
(and
	(listp arg)
	(equal (car arg) 'K)
	(canon-lambda? (second arg))
	(listp (third (second arg)))
	(equal (car (third (second arg))) 'AND)
	(loop for y in (cdr (third (second arg)))
		thereis (canon-mod? (second y)))
)
)

(defun remove-aux-do-did (phi)
(block outer
	(setf phi-copy (copy-item phi))

	(loop for form in phi do (block inner
		(if (contains form 'DO.AUX)
			; then
			(setf phi-copy (replace-vals form (remove 'DO.AUX form :test #'equal) phi-copy))
		)

		; Re-orient the episode backward in time.
		(if (contains form 'DID.AUX)
			; then
			(block did1
				; Remove DID.AUX.
				(setf new-form (remove 'DID.AUX form :test #'equal))

				; If there's an episode, replace the
				; episode in the formula with a new one,
				; and add a formula constraining the
				; new one to be before the old one.
				(if (canon-charstar? new-form)
					; then
					(block did2
						(setf ep (third new-form))
						(setf new-ep (new-skolem! 'E))
						(setf phi-copy (append phi-copy (list (list new-ep 'BEFORE ep))))
						(setf new-form (list (car new-form) (second new-form) new-ep))
					)
				)

				; Replace the old formula.
				(setf phi-copy (replace-vals form new-form phi-copy))
			)
		)
	))

	(return-from outer phi-copy)
)
)

(defun pull-out-lambda-advs (phi)
(block outer
	(setf phi-copy (copy-item phi))

	(setf lambda-advs (get-elements-pred phi-copy
		(lambda (x) (and
			(canon-prop? (replace-dets-with-k x))
			(not (canon-charstar? (replace-dets-with-k x)))
			(loop for arg in (prop-post-args (replace-dets-with-k x))
				thereis (arg-with-adv-lambda? arg))
			)
		))
	)

	(loop for raw-la in lambda-advs
		do (block inner
			(setf prop-copy (copy-item raw-la))
			(setf la (replace-dets-with-k raw-la))
			; find all mods in the lambdas
			(loop for arg in (prop-post-args la)
				do (block get-mods
					(setf la-mods (loop for x in (cdr (third (second arg)))
						if (canon-mod? (second x))
							; then
							collect (second x)
					))
					; remove the mods from the lambda
					(setf new-l-props (loop for x in (cdr (third (second arg)))
						if (not (canon-mod? (second x)))
							; then
							collect x
					))
					(setf prop-copy (replace-vals (third (second arg)) (append (list (car (third (second arg)))) new-l-props) prop-copy))
					; add the mods to the proposition
					; (setf prop-copy-pred (second prop-copy))
					(setf la-pred-base (pred-base (prop-pred la)))
					(setf new-la-pred-base (copy-item la-pred-base))
					(loop for la-mod in (remove-duplicates la-mods :test #'equal)
						do (setf new-la-pred-base (list la-mod new-la-pred-base))
					)
					; (format t "replacing pred base ~s with new one ~s~%" la-pred-base new-la-pred-base)
					(setf prop-copy (replace-vals la-pred-base new-la-pred-base prop-copy))
					; (setf prop-copy (list (car prop-copy) prop-copy-pred))
				)
			)

			(setf phi-copy (replace-vals raw-la prop-copy phi-copy))
		)
	)

	(return-from outer phi-copy)
)
)

(defun apply-such-determiners (phi)
(block outer
	(setf phi-copy (copy-list phi))

	(setf such-constrs (get-elements-pred phi-copy
		(lambda (x) (and
			(listp x)
			(not (null (member (car x) '(SUCH SUCH.D SUCH.DET) :test #'equal)))
			(canon-pred? (second x))
		))
	))

	(loop for sc in such-constrs
		do (block inner
			(if (lex-adj? (pred-base (second sc)))
				; then
				(setf phi-copy (replace-vals sc (list 'A.D (list 'SUCH.ADV (second sc))) phi-copy))
			)

			(if (and
				(canon-lambda? (second sc))
				(mp (third (second sc)) (list (list 'id? 'AND) 'any?+))
				)
				; then
				(block suchify-adjs-in-lambda
					; (format t "got lambda such-constr: ~s~%" sc)
					(setf l-preds (cdr (third (second sc))))
					(setf new-l-preds (list))
					(loop for lp in l-preds
						do (if (and (canon-prop? lp) (lex-adj? (pred-base (prop-pred lp))))
							; then
							(setf new-l-preds (append new-l-preds (list (add-prop-mods lp (list 'SUCH.ADV)))))
							; else
							(setf new-l-preds (append new-l-preds (list lp)))
						)
					)
					(setf new-lambda (list 'L (second (second sc)) (append (list 'AND) new-l-preds)))
					(setf phi-copy (replace-vals sc (list 'A.D new-lambda) phi-copy))
				)
			)
		)
	)

	(return-from outer phi-copy)
)
)

(defun flatten-nested-and (phi)
	(loop for e in (split-conjunction phi)
		if (pre-or-infix-and-list? e)
			append (flatten-nested-and e)
		else
			collect e
	)
)

(defun flatten-nested-ands (phi)
(block outer
	(setf phi-copy (copy-list phi))

	(setf nested-ands (get-elements-pred phi-copy
		(lambda (x) (and
			(pre-or-infix-and-list? x)
			(loop for e in x
				thereis (pre-or-infix-and-list? e))
		))
	))

	; Only look through the top-level ones.
	(setf nested-ands (loop for n in nested-ands
		if (loop for n2 in nested-ands never (and
			(not (equal n n2))
			(has-element n2 n)
		))
			collect n
	))

	; Flatten the nested conjunctions.
	(loop for n in nested-ands
		do (setf phi-copy (replace-vals n (append (list 'AND) (flatten-nested-and n)) phi-copy))
	)

	(return-from outer phi-copy)
)
)

(defun rename-gensyms (phi)
(block outer
	(setf phi-copy (copy-list phi))

	(setf used-vars (get-elements-pred phi-copy #'lex-naked-var?))

	(setf used-gensyms (get-elements-pred phi-copy #'lex-gensym?))

	(loop for ug in used-gensyms
		do (block inner
			(setf new-gs-var (intern (unique-var "X" used-vars)))
			(setf used-vars (append used-vars (list new-gs-var)))
			(setf phi-copy (replace-vals ug new-gs-var phi-copy))
		)
	)

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

(defun pre-or-infix-and-list? (l)
(and
	(listp l)
	(> (length l) 1)
	(or
		(equal (car l) 'AND)
		(equal (car l) 'AND.CC)
		(> 1 (length (split-lst l 'AND)))
		(> 1 (length (split-lst l 'AND.CC)))
	)
)
)

(defun split-and-preds (phi)
(block outer
	(setf phi-copy (copy-list phi))

	(loop for e in phi do (block loop-outer
		(if (not (listp e))
			(return-from loop-outer)
		)

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
	ONE.D
	A.DET
	A.D
	AN.DET
	AN.D
	SOME
	SOME.D
	SOME.DET
	THE
	THE.D
	THE.DET
	THE_INV.DET
	THAT.D
	THIS.D
))

; probably-pred identifies things that
; are either canon preds, or will be later,
; once other fixes are applied. This helps
; massage out some cyclical dependencies
; between fix rules.
(defun probably-pred? (p)
(block outer
	(if (canon-pred? p)
		(return-from outer t)
	)

	(if (not (listp p))
		(return-from outer nil)
	)

	(if (canon-pred? (unwrap-singletons (loop for e in p if (not (canon-prep? e)) collect e)))
		(return-from outer t)
	)

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
)
)

(defun strip-pred-mods-individuals (p)
(block outer
	(return-from outer (unwrap-singletons (loop for e in p if (not (or (canon-mod? e) (canon-individual? e))) collect e)))
)
)

; Make sure "ka" args are wrapped in "for.p",
; unless the verb permits a direct KA arg
(defun purposify-ka-args (phi)
(let ((tmp-phi phi))
(block outer
	(setf tmp-phi (process-construction tmp-phi
		(lambda (x) (and (canon-prop? x)
					(not (equal (prop-pred x) 'USED_TO.V))
						(has-element-pred (prop-post-args x)
							(lambda (y) (and (canon-kind? y) (equal (car y) 'KA))))))
		#'purposify-ka-args-processor))

	(return-from outer tmp-phi)
)
)
)

(defun purposify-ka-args-processor (pair phi)
(block outer
	; (format t "purposify-ka-args-processor called on ~s~%" pair)

	(setf phi-copy (copy-list phi))

	(setf prop-elements (prop-args-pred-mods (car pair)))
	(setf pre-args (car prop-elements))
	(setf pred (second prop-elements))
	(setf post-args (third prop-elements))
	(setf mods (fourth prop-elements))

	(if (not (lex-verb? pred))
		(return-from outer phi-copy)
	)

	(if (not (null (member (remove-idx-tag pred) *KA-ARG-VERBS* :test #'equal)))
		(return-from outer phi-copy)
	)

	(setf ka-args (list))
	(setf non-ka-args (list))
	(loop for arg in post-args
		do (if (and (canon-kind? arg) (equal (car arg) 'KA))
			; then
			(setf ka-args (append ka-args (list arg)))
			; else
			(setf non-ka-args (append non-ka-args (list arg)))
		)
	)

	; Make modifiers out of the KA args.
	(loop for ka-arg in ka-args
		do (setf mods (append mods (list
			(list 'ADV-A (list 'FOR.P ka-arg))
		)))
	)

	(setf new-prop (render-prop pre-args pred non-ka-args mods))

	(setf phi-copy (replace-element-idx phi-copy (second pair) new-prop))
)
)

(defun unfloat-modifiers (phi)
(let ((tmp-phi (copy-item phi)))
(block outer
		(setf tmp-phi (process-construction tmp-phi
			(lambda (x) (and (listp x) (equal (car x) 'KA)))
			#'unfloat-modifiers-processor))

		(setf tmp-phi (process-construction tmp-phi
			(lambda (x) (member x tmp-phi :test #'equal))
			#'unfloat-modifiers-processor))

		(return-from outer tmp-phi)
)
)
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

		; Nonlists don't have modifiers
		(if (not (listp form))
			(return-from outer phi-copy)
		)

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
		(loop while (and (>= (length form) 2) (or (equal (car form) 'NOT) (canon-mod? (car form))))
			do (progn
			(setf pr-mods (append (list (car form)) pr-mods))
			; (setf form (second form))
			(setf form (unwrap-singletons (cdr form)))
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
				; (format t "form is now ~s~%" form)
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
		; (setf uf-target (replace-vals uf-pred new-uf-pred uf-target))
		; Shallow replacement; the predicate could exist in individuals/mods as a kind!
		(setf uf-target (loop for e in uf-target collect (if (equal e uf-pred) new-uf-pred e)))

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
		(if (not (equal (car pair) uf-target))
			(progn
				(setf phi-copy (replace-element-idx phi-copy (second pair) uf-target))
			)
		)
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

(defun atemporal-form? (form skp restrictors)
(or
	(and
		(listp form)
		(equal skp (car form))
	)
	(member form restrictors :test #'equal)
)
)

(defun split-conjunction (phi)
(block outer
	(if (not (listp phi))
		(return-from outer (list phi))
	)

	; prefix
	(if (or
		(equal (car phi) 'AND)
		(equal (car phi) 'AND.CC))
		; then
		(return-from outer (cdr phi))
	)

	; infix chain
	(if (not (null (member 'AND phi :test #'equal)))
		; then
		(return-from outer (split-lst phi 'AND))
	)
	(if (not (null (member 'AND.CC phi :test #'equal)))
		; then
		(return-from outer (split-lst phi 'AND.CC))
	)

	; no conjunction case
	(return-from outer (list phi))
)
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

	; The new ULF processor will add word
	; tags to determiners more aggressively,
	; so we'll strip them here.
	(setf adet (append (list (remove-idx-tag (car adet))) (cdr adet)))

	(setf adet-idx (second pair))

	; Check whether the Skolemization would be
	; free or relative to another quantifier.
	(if (and (loop for anc in (idx-ancestors phi adet-idx)
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
			; ... BUT, if the scope has been
			; explicitly marked as "invariant",
			; e.g. the determiner was "my" or
			; something, we can continue.
			(not (equal (car adet) 'THE_INV.DET))
		)
		; then
		(progn
			(return-from outer phi)
		)
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
	(if (or
			(equal (length adet) 2)
			(not (or (lex-var? (second adet)) (lex-naked-var? (second adet))))
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

			; Add the atemporal Skolem propositions to the conjunction
			(setf phi-copy (append (list (list new-skolem (lambdify-preds! (cdr adet)))) phi-copy))

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
	(if (or (equal (car adet) 'SOME) (equal (car adet) 'SOME.D) (equal (car adet) 'SOME.DET))
		; then
		(block handle-some
			;(setf adet-formulas (replace-vals adet-var skolem-placeholder (cdddr adet)))
			(setf adet-formulas (subst-for-free skolem-placeholder adet-var (cdddr adet)))

			(setf split-conj (split-lst (third adet) 'AND))
			(if (equal (car (third adet)) 'AND)
				; then
				(setf split-conj (cdr (third adet)))
			)

			(setf restrictors (replace-vals adet-var skolem-placeholder split-conj))
			(setf restrictors (subst-for-free skolem-placeholder adet-var split-conj))
			(setf adet-formulas (append adet-formulas restrictors))
		)
	)

	(setf final-adet-formulas (list))
	(loop for form in adet-formulas
		; TODO: better if condition here to identify atemporals
		; do (if (or (and (listp form) (equal skolem-placeholder (car form))) (member form restrictors :test #'equal) )
		do (if (atemporal-form? form skolem-placeholder restrictors)
			; then
			(setf atemporals (append atemporals (list form)))
			; else
			(if (> (length (split-conjunction form)) 1)
				; then loop through the conjunction
				; to split out temporals and atemporals
				(block split-atemps
					(loop for cform in (split-conjunction form)
						if (atemporal-form? cform skolem-placeholder restrictors)
							do (setf atemporals (append atemporals (list cform)))
						else
							do (setf final-adet-formulas (append final-adet-formulas (list cform)))
					)
				)
				; else
				(setf final-adet-formulas (append final-adet-formulas (list form)))
			)
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
					(member (remove-idx-tag (car x)) *EXISTENTIAL-SYMS* :test #'equal)
					(and
						(> (length x) 2)
						(equal (car x) ':Q)
						(member (remove-idx-tag (second x)) *EXISTENTIAL-SYMS* :test #'equal)
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
	; (format t "got breakdown ~s~%" lam-breakdown)

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
	; would otherwise still have it.

	(setf tmp-sym1 (gensym))

	(setf lam-body (subst-for-free tmp-sym1 l-var lam-body))

	(setf tmp-sym2 (gensym))
	; (format t "pre-ttt, lam-body is ~s~%" lam-body)
	(setf lam-body (ttt-replace lam-body
		(list '<> tmp-sym1 '_*)
		(list 'tmp-stack-mods! (list tmp-sym2 '_*))))
	; (format t "post-ttt, lam-body is ~s~%" lam-body)
	; (setf lam-body (replace-vals tmp-sym (car l-pre-args) lam-body))
	; (format t "substituting ~s for ~s in ~s~%" (car l-pre-args) tmp-sym2 lam-body)
	(setf lam-body (subst-for-free (car l-pre-args) tmp-sym2 lam-body))
	; (format t "tmp-sym1 is ~s, tmp-sym2 is ~s~%" tmp-sym1 tmp-sym2)

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
				(or 
					(equal 'AND.CC (second (car e)))
					(equal 'AND (car (car e)))
				)
				;(canon-prop? (car (car e)))
				;(canon-prop? (third (car e)))
				)
			; then
			(block loop-inner
				(setf ep (third e))

				(setf prop1 nil)
				(setf prop2 nil)
				(if (equal 'AND.CC (second (car e)))
					; then
					(progn
						(setf prop1 (car (car e)))
						(setf prop2 (third (car e)))
					)
					; else, AND is (car (car e))
					(progn
						(setf prop1 (second (car e)))
						(setf prop2 (third (car e)))
					)
				)

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
			; (format t "applying func ~s~%" func)
			(setf old-phi-copy (copy-list phi-copy))
			(setf new-phi-copy (funcall func phi-copy))
			; (format t "got new phi ~s~%" new-phi-copy)
			;(if (not (same-list-unordered old-phi-copy new-phi-copy))
			;	(progn
			;	 (format t "func ~s updated~%" func)
			;	 (format t "new phi: ~s~%~%" new-phi-copy)
			;	)
			;)
			;(if (and (has-element old-phi-copy 'TOGETHER.ADV) (not (has-element new-phi-copy 'TOGETHER.ADV)))
			;	(format t "func ~s removed TOGETHER.ADV~%" func)
			;)
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
		; (format t "here1~%")
		; (format t "doing a cleanup pass of ~s~%" phi)
		(setf phi-copy (remove-duplicates (schema-cleanup-ttt phi-copy) :test #'equal))
		; (format t "here2~%")
		(setf phi-copy (remove-duplicates (schema-cleanup-lisp phi-copy) :test #'equal))
		; (format t "here3~%")
		(if (same-list-unordered phi-copy last-phi-copy)
			; then
			(return-from outer phi-copy)
			; else
			(progn
			; (format t "last phi ~s didn't equal phi ~s~%" last-phi-copy phi-copy)
			; (format t "last phi-copy minus phi-copy: ~s~%" (set-difference last-phi-copy phi-copy :test #'equal))
			; (format t "phi-copy minus last phi-copy: ~s~%" (set-difference phi-copy last-phi-copy :test #'equal))
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
	(progn
	(setf *glob-idx* 0) ; for multi-sentence parser word indexing
	(schema-cleanup (interpret sent))
	)
)

(defun in-span (num span)
	(and (>= num (car span)) (<= num (second span)))
)

; This replaces a given word at a sentence index with
; the same word, plus "of it"; re-runs the coreference
; analyzer on the modified istory; and then modifies
; the original coreference clusters such that the given
; noun is treated as the "it".
; So, for example, "I had a phone, but I wanted a new one"
; would become "I had a phone, I wanted a new one of it",
; the coreference resolver would link "it" to "phone",
; and then the coreference cluster for "it" would be added
; back in, with its index replaced with the index for "one".
(defun get-coref-of-noun (sents idx)
	
)

(defun parse-story (sents)
	(parse-story-maybe-from-ulf sents nil)
)

(defun parse-story-maybe-from-ulf (sents pre-ulfs)
(block outer
	(setf *glob-idx* 0)
	(if (not (null pre-ulfs))
		; then
		(setf new-sents (loop for sent in sents
			for pre-ulf in pre-ulfs
			; do (format t "original interpretation: ~s~%" (interpret-lf pre-ulf))
			collect (schema-cleanup
			(interpret-lf pre-ulf)
			)
		))
		; else
		(setf new-sents (loop for sent in sents
			collect (schema-cleanup
			(interpret sent)
			)
		))
	)
	; (format t "finished initial parse~%")
	; (format t "new-sents is: ~s~%" new-sents)


	; PERFORM COREFERENCE
	(setf new-sents (resolve-coreference sents new-sents))


	; (format t "individual-mapped coref clusters: ~s~%" clusters)
	; (format t "resolved parse: ~s~%" new-sents)

	(setf needs-cleaning (remove-duplicates (get-elements-pred new-sents (lambda (x)
		(let ((spl (split-str (format nil "~s" x) "$")))
			(and
				(symbolp x)
				(and
					(equal 3 (length spl))
					(num-str? (second spl)))
			)
		)
	)) :test #'equal))
	(loop for nc in needs-cleaning
		do (block clean-nums
			; (format t "need to clean ~s~%" nc)
			(setf nc-repl (let ((spl (split-str (format nil "~s" nc) "$")))
				(intern (concat-strs (car spl) (third spl)))
			))
			; (format t "replacing with ~s~%" nc-repl)
			(setf new-sents (replace-vals nc nc-repl new-sents))
		)
	)

	; (format t "number-cleaned, final parse: ~s~%" new-sents)

	; call schema-cleanup one more time, as the coref tags
	; interfere with the cleanup procedures sometimes
	; TODO: find out why & fix it
	(return-from outer (mapcar #'schema-cleanup new-sents))
)
)

(defun filtered-parse-story (story)
	(loop for sent in (parse-story story) collect (loop for wff in sent if (canon-prop? wff) collect wff))
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
	(let ((sentences (list)) (lines (list)) (story-count 0))
	(progn
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
				; (format t "~%~%~%STORY ~d:~%" story-count)
				(setf story-count (+ 1 story-count))
				(funcall story-processor-fn sentences lines)
				(setf sentences (list))
				(setf lines (list))
			)
		)
	))))
))

; (process-stdin-story (lambda (sents lines) (format t "~s~%~%~%" sents)))