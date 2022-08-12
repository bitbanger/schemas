(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "schema-el.lisp")
(ll-load "all-coling-ulfs.lisp")

(setf total-ulfs 0)
(loop for story in *COLING-ULFS* do (block outer
	(loop for ulf in story do (block inner
		(setf total-ulfs (+ 1 total-ulfs))
		(if (> (length (get-elements-pred ulf #'lex-adv?)) 0)
			(format t "~s~%~%~s~%~%~%" (get-elements-pred ulf #'lex-adv?) ulf))
	))
))

(format t "~s~%" total-ulfs)
