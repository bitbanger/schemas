(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load "nesl-compos.lisp")
(ll-load-superdir "schema-util.lisp")
(ll-load-superdir "ll-util.lisp")

(loop for sch in (mapcar #'car *NESL-COMPOS-AND-PROTOS*)
	if (has-element sch 'SICK.A)
		do (print-schema sch))
