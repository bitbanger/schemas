(load "norm-schema-util.lisp")
(load "norm-unify.lisp")

; norm-link.lisp contains functions to link schemas together by their
; pre- and post-conditions.

(defun link-schemas-onedir (schema-post schema-pre story)
(block outer
	(setf schema-pre-uniq nil)
	(setf schema-post-uniq nil)
	(setf bindings nil)
	(let ((uniq-pair (uniquify-shared-vars schema-pre schema-post)))
		(progn
			(setf schema-pre-uniq (car uniq-pair))
			(setf schema-post-uniq (second uniq-pair))
		)
	)

	(setf story-time-props
		(loop for phi in (linearize-story story)
			if (time-prop? phi) collect phi))

	(setf all-ep-rels
		(loop for schema in (list schema-post schema-pre)
			append (mapcar #'second (section-formulas (get-section schema ':Episode-relations)))
		)
	)

	(load-time-model (append story-time-props all-ep-rels))


	; (format t "trying to link ~s and ~s~%" (second schema-post) (second schema-pre))
	(setf schema-post-ep (third (second schema-post)))
	(setf schema-pre-ep (third (second schema-pre)))
	(loop for post-pair in (section-formulas (get-section schema-post ':Postconds))
		do (loop for pre-pair in (section-formulas (get-section schema-pre ':Preconds))
			do (block match-conds
				; (format t "comparing ~s and ~s~%" schema-post-ep schema-pre-ep)
				(if
					; NOTE: this "precond-of" only means Allen time rel (p m),
					; and doesn't do any causation testing.
					(not (eval-time-prop (list schema-post-ep 'after schema-pre-ep)))
					; then
					(block check-pre-post
						(setf pre (second pre-pair))
						(setf post (second post-pair))
						; (format t "matching pre ~s and post ~s~%" pre post)
						(setf post-bindings (unify post pre nil schema-post nil))
						(setf pre-bindings (unify post pre nil schema-post nil))
						; (format t "post-bindings are ~s~%" (ht-to-str post-bindings))
						; (format t "pre-bindings are ~s~%" (ht-to-str pre-bindings))

						(if (or (or (not (null post-bindings)) (not (null pre-bindings))) (equal pre post))
							(return-from outer (list post-bindings pre-bindings))
						)
					)
				)
			)
		)
	)

	(return-from outer nil)
)
)
