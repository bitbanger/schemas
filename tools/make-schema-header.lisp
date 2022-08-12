(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load-superdir "schema-to-english.lisp")

(defparameter *TAKE-VARS* t)

(loop for i from 0 while t do (block read-schemas
	(setf sch (read))
	(if (null sch)
		(return-from read-schemas))

	(setf eng (schema-to-english sch))
	(if (and (not *TAKE-VARS*)
		(loop for sent in eng
			thereis (search "?" sent)))
		; then
		(return-from read-schemas))

	(if (> i 0)
		(format t "~%~%~%"))

	(print-schema sch)
	(format t "~%")
	(format t "~%")

	(loop for sent in eng
		do (format t "~a~%" sent))

	(format t "~%")
	(format t "~%")
	(setf new-header (gpt-schema-header sch))
	(if (null new-header)
		; then
		(format t "couldn't generate new schema header~%")
		; else
		(format t "generated schema header: ~s~%" new-header))
))
