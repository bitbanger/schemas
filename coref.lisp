(load "real_util.lisp")
(load "stories.lisp")
(load "parse.lisp")

(defparameter *KB-EXPLICIT* (make-hash-table :test #'equal))
(defparameter *KB-ARG-IND* (make-hash-table :test #'equal))
(defparameter *KB-PRED-IND* (make-hash-table :test #'equal))
(defparameter *KB* (list *KB-EXPLICIT* *KB-ARG-IND* *KB-PRED-IND*))

(defun kb-explicit (kb)
	(car kb)
)

(defun kb-arg-ind (kb)
	(second kb)
)

(defun kb-pred-ind (kb)
	(third kb)
)

(defparameter *STORY* flowers_el)

; Extract all arguments from a proposition
(defun prop-args (prop)
	(loop for e in prop
		if (and (term? e) (not (kind? e)))
			collect e
	)
)

(defun all-prop-args (prop)
	(loop for e in prop
		if (and (term? e) (not (adv? e)))
			collect e
	)
)

(defun prop-mods (prop)
	(loop for e in prop
		if (adv? e)
			collect e
	)
)

; Determine whether a term needs coreference
(defun coref? (term kb)
(or
	(lex-pronoun? term)
	(eval-prop (list term 'THE.A) kb)
)
)

; Extract the predicate from a proposition
(defun get-pred (prop)
(block gp
	(loop for e in prop
		if (el-pred? e)
			do (return-from gp e)
	)
)
)

; Get all predicates that apply to a term
(defun get-term-preds (term kb)
(append
	(loop for prop in (gethash term (kb-arg-ind kb))
		if (not (null (get-pred prop)))
			collect (get-pred prop)
	)

	(loop for pred in *IRREGULAR-PREDS*
		if (eval-prop (list term pred) kb)
			collect pred
	)
)
)

; Get all terms to which a predicate applies
(defun get-pred-terms (pred kb)
	; "Irregular" predicates aren't evaluated using the KB
	(if (not (irregular-pred? pred))
		(gethash pred (kb-pred-ind kb))

		; else
		(loop for term being the hash-keys of (kb-arg-ind kb)
			if (eval-prop (list term pred) kb)
				collect term
		)
	)
)

; Evaluate whether a proposition is true given a knowledge base
(defun eval-prop (prop kb)
(let (arg)
(block outer
	; Only lists are propositions
	(if (not (listp prop)) (return-from outer 'ERROR))

	(setf pred (get-pred prop))
	(setf args (all-prop-args prop))
	(setf mods (prop-mods prop))

	; (format t "raw proposition: ~s~%" prop)
	; (format t "canonical proposition: ~s(" pred)
	;(loop for arg in args
	;	do (format t " ~s " arg)
	;)
	;(format t ")~%")
	;(if (> (length mods) 0) (block print-mods
	;	(format t "	prop modifiers:~%")
	;	(loop for mod in mods
	;		do (format t "		~s~%" mod)
	;	)
	;))



	; Strip negations
	(if (equal (car prop) 'NOT)
		(return-from outer (not (eval-prop (second prop) kb))))

	; Check for explicit knowledge of this or its negation.
	(if (gethash prop (kb-explicit kb))
		(return-from outer t)
	)
	(if (gethash (list 'NOT prop) (kb-explicit kb))
		(return-from outer nil)
	)

	; Special cases for implicitly evaluable monadic predicates
	(if (and (equal 2 (length prop)) (equal 1 (length args))) (block monadic-special-cases
		(setf arg (car args))

		; Names refer to agents.
		(if (and (symbolp arg) (has-suffix? (string arg) ".NAME"))
			(if (equal pred 'AGENT1.N)
				(return-from outer t))
		)

		; He and she pronouns refer to agents.
		; TODO: handle "they"
		(if (and (symbolp arg) (or (equal arg 'HE.PRO) (equal arg 'SHE.PRO)))
			(if (equal pred 'AGENT1.N)
				(return-from outer t))
		)
	))

	; Handle "OR"s
	(if (not (null (member 'OR prop))) (block handle-or
		(loop for e in prop
			if (not (equal 'OR e)) do (block handle-or-inner
				(setf ep-res (eval-prop e kb))
				(if (equal 'ERROR ep-res) (return-from outer 'ERROR))
				(if ep-res (return-from outer t))
			)
		)

		; Nothing evaluated to t
		(return-from outer nil)
	))

	; Handle "ANDs"
	(if (not (null (member 'AND prop))) (block handle-or
		(loop for e in prop
			if (not (equal 'AND e)) do (block handle-or-inner
				(setf ep-res (eval-prop e kb))
				(if (equal 'ERROR ep-res) (return-from outer 'ERROR))
				(if (null ep-res) (return-from outer nil))
			)
		)

		; Nothing evaluated to nil
		(return-from outer t)
	))

))
)

(defun safe-inc (n)
	(if (null n) 1 (+ n 1))
)

(defparameter *IRREGULAR-PREDS* '(
	AGENT1.N
))

(defun irregular-pred? (pred)
	(not (null (member pred *IRREGULAR-PREDS*)))
)

; Add a formula to the knowledge base, under all its various indices
(defun add-to-kb (wff kb) (block add
	; Normalize out episode characterizers
	(setf effective-wff wff)
	(if (char-wff? wff) (setf effective-wff (car wff)))

	; Add the entire formula to the main KB
	(setf (gethash wff (kb-explicit kb)) t)

	(setf pred (get-pred effective-wff))


	; Index the formula by its args in the indexed KB
	; ...and the args by the pred
	(loop for prop-arg in (prop-args effective-wff) do
		(push wff (gethash prop-arg (kb-arg-ind kb)))
		(push prop-arg (gethash pred (kb-pred-ind kb)))
		
	)
))


; Add some "basic world knowledge"
(add-to-kb '(FRANK.NAME MALE.A) *KB*)
(add-to-kb '(MAY.NAME FEMALE.A) *KB*)
(add-to-kb '(HE.PRO MALE.A) *KB*)
(add-to-kb '(SHE.PRO FEMALE.A) *KB*)


; Process the story one sentence at a time, so we can do
; coreference analysis in one pass.
(defun process-story-coref (story kb)
(loop for conj in story do (block loop_outer
		; Add all propositions to the KB, indexed by their arguments
		(loop for wff in conj do (block loop_inner
			(add-to-kb wff kb)
		)))


		; Find story terms that need coreference
		(loop for e in (get-elements-pred conj #'term?)
			if (coref? e kb) do (block resolve-coref
				; For each pred, find other terms w/ that pred
				(setf share-count (make-hash-table :test #'equal))

				(loop for pred in (get-term-preds e kb)
					if (not (equal pred 'THE.A))
						; do (format t "~s: ~s~%" pred (gethash pred (kb-pred-ind kb)))
						append (loop for term in (get-pred-terms pred kb)
							if (not (equal term e))
								; collect term
								do (setf (gethash term share-count) (safe-inc (gethash term share-count)))
						)
				)

				(setf max-count 0)
				(setf max-coref nil)
				(loop for term being the hash-keys of share-count
					if (>= (gethash term share-count) max-count)
						do (block update
							(setf max-count (gethash term share-count))
							(setf max-coref term)
						)
				)

				; (format t "best coreference for ~s: ~s (~s shared preds)~%" e max-coref max-count)
			)
		)

)
)

(process-story-coref *STORY* *KB*)



(eval-prop '(MAY.NAME EAT.V (K BALL.N) (ADV-A (WITH.P (K GUSTO.N)))) *KB*)
