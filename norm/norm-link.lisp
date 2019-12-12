(load "norm-schema-util.lisp")

; norm-link.lisp contains functions to link schemas together by their
; pre- and post-conditions.

(defun link-schemas-onedir (schema-post schema-pre)
(block outer
	(setf schema-pre-uniq nil)
	(setf schema-post-uniq nil)
	(let ((uniq-pair (uniquify-shared-vars schema-pre schema-post)))
		(progn
			(setf schema-pre-uniq (car uniq-pair))
			(setf schema-post-uniq (second uniq-pair))
		)
	)

	(loop for post in (section-formulas (get-section schema-post ':Postconds))
		do (loop for pre in (section-formulas (get-section schema-pre ':Preconds))
			do (block match-conds
				(if (equal (second pre) (second post))
					; then
					; (format t "matching pre ~s and post ~s~%" pre post)
					(return-from outer t)
				)
			)
		)
	)

	(return-from outer nil)
)
)
