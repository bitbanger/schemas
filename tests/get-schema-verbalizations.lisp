(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load-superdir "verbalize-schemas.lisp")
(ll-load-superdir "ll-util.lisp")

(ll-load "old-nesl-compos.lisp")

(ldefun verbalized-steps (schema)
	(mapcar #'cdr (cdr (car (loop for sec in (verbalize-schema schema)
		if (and (listp sec) (equal (car sec) 'STEPS.))
			collect sec))))
)

(loop for schema in *NESL-COMPOS* for i from 0
	if (> i 0)
		do (format t "~%")
	do (handler-case (loop for st in (verbalized-steps schema)
		do (format t "~a~%" (join-str-list " " (mapcar #'string st))))
			(error () nil)))
