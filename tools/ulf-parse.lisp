
(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")
(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "new-ulf-parser.lisp")

; (setf els (len-parse-sents 

(setf sents (loop for line = (read-line *standard-input* nil :eof) ; stream, no error, :eof value
	until (eq line :eof)
	collect line))

(setf ulfs (len-ulfs sents))
(loop for i from 0 to (- (length sents) 1) do (block pr
	(setf ulf-sent (nth i ulfs))

	; (format t "~s~%~%" sent)

	; (format t "	ULF:~%")
	(format t "~s~%~%" ulf-sent)

))
