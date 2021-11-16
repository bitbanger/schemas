(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "thurs-schemas.lisp")
(ll-load "schema-to-english.lisp")
(ll-load "schema-util.lisp")
(ll-load "ll-util.lisp")

(loop for story in *FRAMENET-SCHEMAS*
	do (loop for schema in story
		do (register-schema schema)))

; (setf *FRAMENET-SCHEMAS*
	; (sort *FRAMENET-SCHEMAS* #'< :key (lambda (x) (rechash (get-schema-match-name (schema-pred x))))))

(loop for story in *FRAMENET-SCHEMAS* for i from 0 do (block loop-block
	(if (equal (length story) 0) (return-from loop-block))
	(if (> i 0) (format t "~%~%------~%~%"))
	(loop for schema in story for j from 0
		do (block print-eng
			(setf eng (schema-to-english schema t))
			(if (null eng) (return-from print-eng))

			(if (> j 0) (format t "~%"))

			(loop for line in eng for k from 0
				if (> k 0) do (format t "~%	")
				do (format t "~s" line))
		)
	)
))
