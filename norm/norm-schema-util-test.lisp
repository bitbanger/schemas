(declaim (sb-ext:muffle-conditions cl:warning))

(load "norm-schema-util.lisp")
(load "norm-protoschemas.lisp")
(load "norm-stories.lisp")
(load "norm-unify.lisp")

(format t "~s~%" (schema? do_action_to_enable_action.v))

; TODO: check constraints
(defun unify-with-schema (phi schema)
(let (bindings)
	(loop for sec in (schema-sections schema)
		do (loop for formula in (section-formulas sec) do
			(block uni
				;(format t "~s~%" (car formula))
				;(format t "	~s~%" (second formula))
				(setf bindings (unify (second formula) phi nil))
				(if (null bindings)
					; then
					;(format t "no uni~%")
					nil
					; else
					(progn
					(format t "UNIFIED~%")
					(format t "	~s~%" formula)
					(format t "WITH~%")
					(format t "	~s~%" phi)
					(format t "bindings:~%~s~%" (ht-to-str bindings))
					(format t "final schema:~%~s~%" (apply-bindings schema bindings))
					)
				)
			)
		)
	)
	)
)

; TODO: for each bound individual (& all its sub-individuals),
; extract all relevant props from story. This code exists in
; coref.lisp. Then figure out a way to add them to the schema
; as additional constraints.
(loop for sent in *MONKEY-STORY* do
	(loop for phi in sent do
		; (format t "~s~%" phi)
		(unify-with-schema phi take_object.v)
	)
)
