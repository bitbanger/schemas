(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "schema-util.lisp")
(ll-load-superdir "schema-el.lisp")
(ll-load "all-coling-ulfs.lisp")

(setf normal-qs '(THE A AN SOME THE.DET A.DET AN.DET SOME.DET))

(ldefun weird-q? (q)
	(and (lex-det? q)
		(and (not (contains normal-qs q))
		(let ((word (intern (car (split-str (string q) "$")))))
			(progn (format nil "comparing ~s~%" word) (not (contains normal-qs word))))))
)

(setf total-ulfs 0)
(loop for story in *COLING-ULFS* do (block outer
	(loop for ulf in story do (block inner
		(setf total-ulfs (+ 1 total-ulfs))
		(if (> (length (get-elements-pred ulf #'weird-q?)) 0)
			;(format t "~s~%~%~s~%~%~%" (get-elements-pred ulf #'lex-adv?) ulf))
			(format t "~s~%" (get-elements-pred ulf #'weird-q?)))
	))
))

(format t "~s~%" total-ulfs)
