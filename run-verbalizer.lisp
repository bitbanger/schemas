(declaim (sb-ext:muffle-conditions cl:warning))

(load "verbalize-schemas.lisp")

(setf verbalized (verbalize-schema (car (read))))

(format t "~s~%" verbalized)

(loop for sec in verbalized
	if (equal (car sec) 'STEPS.)
		do (loop for form in (cdr sec)
			do (format t "~a~%" (join-str-list " " (loop for x in (cdr form) collect (string x))))))
