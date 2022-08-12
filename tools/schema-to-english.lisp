(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load-superdir "schema-to-english.lisp")
(ll-load-superdir "schema-util.lisp")

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
		(format t "~%"))

	(loop for line in (schema-to-english sch)
		do (format t "; ~a~%" line))
	(print-schema sch)
))
