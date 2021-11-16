(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "ll-util.lisp")
(ll-load "verbalizations.lisp")

(setf verbalized-schemas (get-elements-pred *VERBALIZED-SCHEMAS* (lambda (x) (and (listp x) (listp (car x)) (equal (caar x) 'SCHEMA-HEADER.)))))

(loop for vs in verbalized-schemas do (block ps
	(format t "~s~%" (car vs))

	(loop for el in (cdr vs) do (block ps2
		(if (equal (car el) 'EPISODE-RELATIONS.)
			(return-from ps2))

		(format t "	~s~%" (car el))
		(loop for phi in (cdr el) do (block ps3
			(if (and (listp phi) (varp (car phi)))
				(setf phi (cdr phi)))

			(if (listp phi) (progn
				(format t "		")
				(loop for el in phi for i from 0
					if (> i 0) do (format t " ")
					do (format t "~s" el))
				(format t "~%"))
				; else
				(format t "		~s~%" phi))
			
		))
	))

	(format t "~%")
))
