(declaim (sb-ext:muffle-conditions cl:warning))

(load "verbalize-schemas.lisp")
(load "schema-util.lisp")

(setf sch (read))

; (setf sch (replace-vals '?K 'JOHN.NAME sch))

(setf names '(
	JOHN.NAME
	MARY.NAME
	JAKE.NAME
	ELLEN.NAME
	PETER.NAME
	GINA.NAME
))

(setf pre-vars (dedupe (loop for phi in (section-formulas (get-section sch ':Steps))
	collect (car (second phi)))))

;(loop for pv in pre-vars for n in names
	;do (format t "~s ~s~%" pv n))
	;do (setf sch (replace-vals pv n sch)))

; (format t "~s~%" (gpt-verbalize-schema sch))

; (format t "~s~%" (verbalize-schema sch))
(format t ":steps~%")
(loop for l in (gpt-verbalize-steps sch)
	do (format t "~s@~s~%" (car l) (second l)))

(format t ":goals~%")
(loop for l in (gpt-verbalize-goals sch)
	do (format t "~s@~s~%" (car l) (second l)))
