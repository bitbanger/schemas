(load "real_util.lisp")
(load "stories.lisp")
(load "parse.lisp")

(defparameter *KB* (make-hash-table :test #'equal))
(defparameter *KB-ARG-IND* (make-hash-table :test #'equal))
(defparameter *KB-PRED-IND* (make-hash-table :test #'equal))

(defparameter *STORY* flowers_el)

; Extract all arguments from a proposition
(defun prop-args (prop)
	(loop for e in prop
		if (and (term? e) (not (kind? e)))
			collect e
	)
)

; Determine whether a term needs coreference
(defun coref? (term)
(or
	(lex-pronoun? term)
	(gethash (list term 'THE.A) *KB*)
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
(defun get-term-preds (term)
	(loop for prop in (gethash term *KB-ARG-IND*)
		if (not (null (get-pred prop)))
			collect (get-pred prop)
	)
)

(defun safe-inc (n)
	(if (null n) 1 (+ n 1))
)


; Process the story one sentence at a time, so we can do
; coreference analysis in one pass.
(loop for conj in *STORY* do (block loop_outer



		; Add all propositions to the KB, indexed by their arguments
		(loop for wff in conj do (block loop_inner
			; Normalize out episode characterizers
			(setf effective-wff wff)
			(if (char-wff? wff) (setf effective-wff (car wff)))

			; Add the entire formula to the main KB
			(setf (gethash wff *KB*) t)

			(setf pred (get-pred effective-wff))


			; Index the formula by its args in the indexed KB
			; ...and the args by the pred
			(loop for prop-arg in (prop-args effective-wff) do
				(push wff (gethash prop-arg *KB-ARG-IND*))
				(push prop-arg (gethash pred *KB-PRED-IND*))
				
			)
		)))


		; Find story terms that need coreference
		(loop for e in (get-elements-pred conj #'term?)
			if (coref? e) do (block resolve-coref
				; For each pred, find other terms w/ that pred
				(setf share-count (make-hash-table :test #'equal))

				(loop for pred in (get-term-preds e)
					if (not (equal pred 'THE.A))
						; do (format t "~s: ~s~%" pred (gethash pred *KB-PRED-IND*))
						append (loop for term in (gethash pred *KB-PRED-IND*)
							if (not (equal term e))
								; collect term
								do (setf (gethash term share-count) (safe-inc (gethash term share-count)))
						)
				)

				(setf max-count 0)
				(setf max-coref nil)
				(loop for term being the hash-keys of share-count
					if (> (gethash term share-count) max-count)
						do (block update
							(setf max-count (gethash term share-count))
							(setf max-coref term)
						)
				)

				(format t "best coreference for ~s: ~s (~s shared preds)~%" e max-coref max-count)
			)
		)

)


