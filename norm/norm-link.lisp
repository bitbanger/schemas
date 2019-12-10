(load "norm-schema-util.lisp")

; norm-link.lisp contains functions to link schemas together by their
; pre- and post-conditions.

(defun link-schemas-onedir (schema-pre schema-post)
(block outer
	(setf schema-pre-uniq nil)
	(setf schema-post-uniq nil)
	(let ((uniq-pair (uniquify-shared-vars schema-pre schema-post)))
		(progn
			(setf schema-pre-uniq (car uniq-pair))
			(setf schema-post-uniq (second uniq-pair))
		)
	)

	(loop for pre in (section-formulas (get-section schema-pre ':Preconds))
		do (loop for post in (section-formulas (get-section schema-post ':Postconds))
			do (block match-conds
				(format t "precond ~s and postcond ~s~%" pre post)
			)
		)
	)
)
)
