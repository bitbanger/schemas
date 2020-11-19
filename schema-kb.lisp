(load "ll-load.lisp")

(ll-load "schema-el.lisp")

(defun kb-explicit (kb)
	(car kb)
)

(defun kb-arg-ind (kb)
	(second kb)
)

(defun kb-pred-ind (kb)
	(third kb)
)

; Curry an argument out of a proposition
; to form a monadic lambda predicate that
; holds for that argument
(defun curry (prop carg)
(block cr
	; Strip charstars
	(if (canon-charstar? prop)
		; then
		(progn
		(setf curry-res (curry (car prop) carg))

		(if (not (listp curry-res))
			; monadic predicate, uncurried;
			; lambda the charstar back into
			; it (we can assume carg is the
			; only arg)
			(return-from cr (list 'LAMBDA.EL (list 'X) (list (list 'X curry-res) (second prop) (third prop))))
		)

		(return-from cr (list (car curry-res) (second curry-res) (list (third curry-res) (second prop) (third prop))))
		;(return-from cr (curry (car prop) carg))
		)
	)

	(setf pre-args (listify-nonlists (prop-pre-args prop)))
	(setf post-args (listify-nonlists (prop-post-args prop)))

	; Don't curry a predicate that's already monadic
	(if (equal 1 (+ (length pre-args) (length post-args)))
		(return-from cr (prop-pred prop)))

	(setf lmb (list 'LAMBDA.EL (list 'X)))
	(setf lmb-args (list))
	; Add the prefix arguments
	(loop for arg in pre-args
		if (not (equal arg carg))
			do (setf lmb-args (append lmb-args (list arg)))
		else
			do (setf lmb-args (append lmb-args (list 'X)))
	)
	; Add the predicate
	(dbg 'coref "prop is ~s~%" prop)
	(dbg 'coref "carg is ~s~%" carg)
	(dbg 'coref "pre-args are ~s~%" pre-args)
	(setf lmb-args (append lmb-args (list (prop-pred prop))))
	(dbg 'coref "lmb-args now has pred ~s~%" (prop-pred prop))
	; Add the postfix arguments
	(dbg 'coref "post-args are ~s~%" post-args)
	(dbg 'coref "~%")
	(loop for arg in post-args
		if (not (equal arg carg))
			do (setf lmb-args (append lmb-args (list arg)))
		else
			do (setf lmb-args (append lmb-args (list 'X)))
	)
	(setf lmb (append lmb (list lmb-args)))

	(return-from cr lmb)
)
)

; Add a formula to the knowledge base, under all its various indices
(defun add-to-kb (wff kb) (block add
	; Normalize out episode characterizers
	(setf effective-wff wff)
	;(if (char-wff? wff) (setf effective-wff (car wff)))
	(if (canon-charstar? wff) (setf effective-wff (car wff)))

	; Add the entire formula to the main KB
	(setf (gethash wff (kb-explicit kb)) t)

	(setf pred (prop-pred effective-wff))


	; Index the formula by its args in the indexed KB
	; ...and the args by the curried proposition predicate,
	; or just the predicate if it's monadic. Also the curried
	; propositions by their respective arguments, for symmetry.
	(setf args (prop-all-args effective-wff))
	(loop for prop-arg in args do (block pal
		(push wff (gethash prop-arg (kb-arg-ind kb)))

		;(format t "got ~s args in ~s~%" (length args) effective-wff)

		(if (equal 1 (length args))
			(progn
			;(format t "pushing ~s to gethash of pred ~s~%" prop-arg pred)
			(push prop-arg (gethash pred (kb-pred-ind kb)))
			)
			; else
			(progn
				; (format t "pushing ~s to the gethash of ~s~%" prop-arg (curry effective-wff prop-arg))
				;(setf curried (curry effective-wff prop-arg))
				(setf curried (curry wff prop-arg))
				(push prop-arg (gethash curried (kb-pred-ind kb)))

				; duplicate-averse append prop-arg to curried in pred ind
				(if (null (member prop-arg (gethash curried (kb-pred-ind kb)) :test #'equal))
					(setf (gethash curried (kb-pred-ind kb)) (append (gethash curried (kb-pred-ind kb)) (list prop-arg))))

				; duplicate-averse append curried prop to prop-arg in arg ind
				(if (null (member (list prop-arg curried) (gethash prop-arg (kb-arg-ind kb)) :test #'equal))
					(setf (gethash prop-arg (kb-arg-ind kb)) (append (gethash prop-arg (kb-arg-ind kb)) (list (list prop-arg curried)))))

				; (format t "pushing ~s to the gethash of ~s~%" (list prop-arg curried) prop-arg)
			)
			)
	)
	)
))

(defparameter *STORY-KB-MAP* (make-hash-table :test #'equal))

(defun story-to-kb (story)
(block outer
	(if (not (null (gethash story *STORY-KB-MAP*)))
		(return-from outer (gethash story *STORY-KB-MAP*))
	)

	(setf skb-exp (make-hash-table :test #'equal))
	(setf skb-arg (make-hash-table :test #'equal))
	(setf skb-pred (make-hash-table :test #'equal))
	(setf skb (list skb-exp skb-arg skb-pred))
	(loop for wff in story do (add-to-kb wff skb))

	(setf (gethash story *STORY-KB-MAP*) skb)

	(if (has-element story 'I.PRO)
		; then
		(add-to-kb '(I.PRO AGENT.N) skb)
	)
	(if (has-element story 'YOU.PRO)
		; then
		(add-to-kb '(YOU.PRO AGENT.N) skb)
	)
	(if (has-element story 'SHE.PRO)
		; then
		(progn
			(add-to-kb '(SHE.PRO FEMALE.A) skb)
			(add-to-kb '(SHE.PRO AGENT.N) skb)
		)
	)
	(if (has-element story 'HE.PRO)
		; then
		(progn
			(add-to-kb '(HE.PRO MALE.A) skb)
			(add-to-kb '(HE.PRO AGENT.N) skb)
		)
	)

	(return-from outer skb)
)
)
