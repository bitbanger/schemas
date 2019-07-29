(declaim (sb-ext:muffle-conditions cl:warning))

(load "norm-schema-util.lisp")
(load "norm-protoschemas.lisp")
(load "norm-stories.lisp")
(load "norm-unify.lisp")

(format t "~s~%" (schema? do_action_to_enable_action.v))

(defun unify-with-schema (phi schema)
(let (bindings)
	(loop for sec in (schema-sections do_action_to_enable_action.v)
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
					)
				)
			)
		)
	)
	)
)


(loop for sent in *FLOWER-STORY* do
	(loop for phi in sent do
		;(format t "~s~%" phi)
		(unify-with-schema phi do_action_to_enable_action.v)
	)
)
