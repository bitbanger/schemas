(declaim (sb-ext:muffle-conditions cl:warning))

(load "norm-schema-util.lisp")
(load "norm-protoschemas.lisp")
(load "norm-stories.lisp")
(load "norm-unify.lisp")
(load "norm-generalize.lisp")

; TODO: check constraints
(defun unify-with-schema (phi schema story)
(let (bindings)
(block outer
	(loop for sec in (schema-sections schema)
		do (format t "	schema sec ~s~%" (section-name sec))
		do (loop for formula in (section-formulas sec) do
			(block uni
				(format t "		schema ~s~%" (second formula))
				;(format t "	~s~%" (second formula))
				(setf new-bindings (unify (second formula) phi bindings))
				; (format t "set bindings are ~s~%" (ht-to-str bindings))
				; (setf (gethash bindings (car formula)) 
				(if (null new-bindings)
					; then
					;(format t "no uni~%")
					;(return-from outer nil)
					nil
					; else
					(progn
					(format t "bound to ~s~%" (second formula))
					(format t "bindings are ~s~%" new-bindings)
					(if (canon-charstar? phi)
						; then
						; (format t "temporal formula ~s <-> ~s~%" (third phi) (car formula))
						(if (bind-if-unbound (car formula) (third phi) new-bindings)
							; then
							(return-from outer new-bindings)
							; (setf bindings new-bindings)
							; else
							(format t "~s already bound; cannot bind!~%" (car formula))
						)

						; else
						(return-from outer new-bindings)
					)
					;(format t "UNIFIED~%")
					;(format t "	~s~%" formula)
					; (format t "WITH~%")
					; (format t "	~s~%" phi)
					;(format t "bindings:~%~s~%" (ht-to-str bindings))
					;(format t "small individuals:~%~s~%" (extract-small-individuals phi))
					;(format t "extra constraints:~%~s~%" (story-select-term-constraints story (extract-small-individuals phi)))
					;(format t "final schema:~%~s~%" (apply-bindings schema bindings))
					;(format t "final schema with added constraint:~%~s~%" (add-role-constraint (apply-bindings schema bindings) 'TRUE))

					(return-from outer bindings)
					)
				)
			)
		)
	)

	(return-from outer bindings)
	)
))



; (setf test-story *FLOWER-STORY*)
(setf test-story *KITE-STORY*)

; TODO: for each bound individual (& all its sub-individuals),
; extract all relevant props from story. This code exists in
; coref.lisp. Then figure out a way to add them to the schema
; as additional constraints.
(defun match-story-to-schema (test-story in-schema generalize)
(block outer
	(setf test-schema in-schema)

	(loop for sent in test-story do
		(loop for phi in sent do (block uni-loop
	
			(setf small-inds (extract-small-individuals phi))
			(setf constraints (story-select-term-constraints test-story small-inds))
	
			(format t "trying:~%")
			(format t "	formula ~s~%" phi)
			(setf go-match (unify-with-schema phi test-schema test-story))
	
			(if (not (null go-match))
				; then
				(block print-go-match
					(format t "bound to story formula ~s~%" phi)
					; (format t "Extra constraints: ~s~%" constraints)
	
					(setf go-match-schema (apply-bindings test-schema go-match))
	
					; Make sure the full matched sentence goes in the step slot
					(setf new-steps (list ':Steps))
					(loop for s in (cdr (get-section go-match-schema ':Steps)) do (block fix-steps
						(if (and (canon-charstar? phi) (equal (third phi) (car s)))
							; then
							(setf new-steps (append new-steps (list (list (car s) (car phi)))))
							; else
							(setf new-steps (append new-steps (list s)))
					)))
					(setf go-match-schema (set-section go-match-schema ':Steps new-steps))
	
					(loop for const in constraints do (block const-add
						(setf go-match-schema (add-role-constraint go-match-schema const))
					))
					; Now replace terms by variables
					(if generalize
						(progn
						(format t "generalizing~%")
						(setf gen-cursor "?_A")
						(loop for ind in small-inds do (block gen-ind-loop
							(setf go-match-schema (replace-vals ind (intern gen-cursor) go-match-schema))
							(setf gen-cursor (next-str gen-cursor))
						))
						)
					)
					; (format t "test-schema match + generalization:~%~s~%" "")
					; (print-schema go-match-schema)
					; (return-from outer go-match-schema)
					(setf test-schema go-match-schema)
				)
			)
		))
	)

	(return-from outer test-schema)
)
)

(setf kite-gen-schema (match-story-to-schema *KITE-STORY* go_somewhere.v t))
(print-schema kite-gen-schema)
(format t "~s~%" *KITE-STORY-2*)
(setf kite-lv2-schema (match-story-to-schema *KITE-STORY-2* kite-gen-schema nil))
(format t "done~%")
(print-schema kite-lv2-schema)
