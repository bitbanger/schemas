(declaim (sb-ext:muffle-conditions cl:warning))

(load "norm-schema-util.lisp")
(load "norm-protoschemas.lisp")
(load "norm-stories.lisp")
(load "norm-unify.lisp")
(load "norm-generalize.lisp")

(format t "~s~%" (schema? do_action_to_enable_action.v))

; TODO: check constraints
(defun unify-with-schema (phi schema story)
(let (bindings)
(block outer
	(loop for sec in (schema-sections schema)
		do (loop for formula in (section-formulas sec) do
			(block uni
				;(format t "~s~%" (car formula))
				;(format t "	~s~%" (second formula))
				(setf bindings (unify (second formula) phi nil))
				; (setf (gethash bindings (car formula)) 
				(if (null bindings)
					; then
					;(format t "no uni~%")
					;(return-from outer nil)
					nil
					; else
					(progn
					(if (canon-charstar? phi)
						; then
						; (format t "temporal formula ~s <-> ~s~%" (third phi) (car formula))
						(if (bind-if-unbound (car formula) (third phi) bindings)
							; then
							(return-from outer bindings)
							; else
							(format t "~s already bound; cannot bind!~%" (car formula))
						)
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

					; (return-from outer bindings)
					)
				)
			)
		)
	)

	(return-from outer nil)
	)
))

; TODO: for each bound individual (& all its sub-individuals),
; extract all relevant props from story. This code exists in
; coref.lisp. Then figure out a way to add them to the schema
; as additional constraints.
(loop for sent in *COUSIN-STORY* do
	(loop for phi in sent do (block uni-loop
		; (format t "~s~%" phi)

		(setf small-inds (extract-small-individuals phi))
		(setf constraints (story-select-term-constraints *COUSIN-STORY* small-inds))
		; (format t "Extra constraints: ~s~%" constraints)

		(setf go-match (unify-with-schema phi go_somewhere.v *COUSIN-STORY*))
		(setf enable-match (unify-with-schema phi do_action_to_enable_action.v *COUSIN-STORY*))

		(if (not (null go-match))
			; then
			(block print-go-match
				(setf go-match-schema (apply-bindings go_somewhere.v go-match))
				(loop for const in constraints do (block const-add
					(setf go-match-schema (add-role-constraint go-match-schema const))
				))
				; Now replace terms by variables
				(setf gen-cursor "?_A")
				(loop for ind in small-inds do (block gen-ind-loop
					(setf go-match-schema (replace-vals ind (intern gen-cursor) go-match-schema))
					(setf gen-cursor (next-str gen-cursor))
				))
				(format t "Go match: ~s~%" go-match-schema)
			)
		)
		(if (not (null enable-match))
			; then
			(block print-enable-match
				(setf enable-match-schema (apply-bindings do_action_to_enable_action.v enable-match))
				(loop for const in constraints do (block const-add
					(setf enable-match-schema (add-role-constraint enable-match-schema const))
				))
				(setf gen-cursor "?_A")
				(loop for ind in small-inds do (block gen-ind-loop
					(setf enable-match-schema (replace-vals ind (intern gen-cursor) enable-match-schema))
					(setf gen-cursor (next-str gen-cursor))
				))
				(format t "Enable match: ~s~%" enable-match-schema)
			)
		)



	))
)
