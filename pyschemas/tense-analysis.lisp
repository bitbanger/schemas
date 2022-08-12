(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load-superdir "ll-util.lisp")
(ll-load "all-coling-ulfs.lisp")

(ldefun tenses-in-ulf (ulf)
(block outer
	(setf found '())
	(loop for tense in '(PAST PRES WILL.AUX-S)
		if (has-element ulf tense)
			do (setf found (append found (list tense))))
	(return-from outer found)
)
)

(setf count-ht (make-hash-table :test #'equal))

(loop for story in *COLING-ULFS* do (block outer
	(loop for ulf in story do (block inner
		(setf ct (length (tenses-in-ulf ulf)))
		(if (> ct 1)
			(format t "~s~%" ulf))
		(if (null (gethash ct count-ht))
			(setf (gethash ct count-ht) 0))
		(setf (gethash ct count-ht)
			(+ 1 (gethash ct count-ht)))
	))
))

(print-ht count-ht)
