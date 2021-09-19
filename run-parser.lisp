(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "new-ulf-parser.lisp")
(ll-load "stories/roc-mcguffey-stories.lisp")

(loop for story in *ROC-MCGUFFEY* do
(loop for sent in story do (block parse
	(setf els (len-parse-sents (list sent)))
	(format t "~a~%~s~%~%" sent els)
)))
