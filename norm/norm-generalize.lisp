(load "norm-stories.lisp")
(load "coref.lisp")

(defparameter *GEN-KB-EXPLICIT* (make-hash-table :test #'equal))
(defparameter *GEN-KB-ARG-IND* (make-hash-table :test #'equal))
(defparameter *GEN-KB-PRED-IND* (make-hash-table :test #'equal))
(defparameter *GEN-KB* (list *GEN-KB-EXPLICIT* *GEN-KB-ARG-IND* *GEN-KB-PRED-IND*))

(defparameter *GEN-STORY* *COUSIN-STORY*)

(defun temporal-prop? (prop)
	; TODO: more nuanced temporal proposition identification
	(has-element prop '**)
)

(defun lambda-prop? (prop)
	; TODO: more nuanced lambda proposition identification
	(has-element prop 'LAMBDA.EL)
)

(defun story-term-constraints (story)
(let (
			(gen-kb (list (make-hash-table :test #'equal)
						  (make-hash-table :test #'equal)
						  (make-hash-table :test #'equal)))

			(constraints (make-hash-table :test #'equal))
	)
(block outer
	; Index the story into the knowledge base
	(loop for sent in story do
		(loop for wff in sent
			do (add-to-kb wff gen-kb)))

	; Reindex only small individuals by only non-lambda,
	; non-temporal constraints
	(loop for arg being the hash-keys of (kb-arg-ind gen-kb)
		if (canon-small-individual? arg) do (block inner
			(loop for pred in (gethash arg (kb-arg-ind gen-kb))
				if (and
						(not (temporal-prop? pred))
						(not (lambda-prop? pred)))
				; then
				do (if (not (member pred (gethash arg constraints) :test #'equal))
					; then
					(push pred (gethash arg constraints))
				)
			)
		)
	)

	; Return the constraints
	(return-from outer constraints)
)
)
)

(defun story-select-term-constraints (story terms)
(let ((constraints (story-term-constraints story)))
	(remove-duplicates (loop for term being the hash-keys of constraints
		if (member term terms :test #'equal)
		append (gethash term constraints)) :test #'equal)
)
)

(defun extract-small-individuals (phi)
(block outer
	; (format t "extracting from ~s~%" phi)
	(return-from outer (get-elements-pred phi #'canon-small-individual?))
)
)

; print all term constraints
(print-ht (story-select-term-constraints *COUSIN-STORY* '(HENRY.NAME CITY1.SK HE.PRO)))
