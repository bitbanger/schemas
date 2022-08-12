(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "schema-html-renderer.lisp")

(setf sch (read))
(if (symbolp sch)
	(setf sch (read)))
(if (equal (car sch) 'EPI-SCHEMA)
	(setf sch (list sch)))

(format t "~a~%" (schema-webpage-html sch))
