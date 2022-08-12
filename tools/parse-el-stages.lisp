
(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")
(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "new-ulf-parser.lisp")

; (setf els (len-parse-sents 
; (setf *show-stages* t)

(setf sents (loop for line = (read-line *standard-input* nil :eof) ; stream, no error, :eof value
	until (eq line :eof)
	collect line))

(setf ulfs (len-ulfs sents))
(setf outp (parse-story-maybe-from-ulf-full-output sents ulfs))

(setf raw-interps (car outp))
(setf final-interps (fifth outp))

(loop for i from 0 to (- (length sents) 1) do (block pr
	(setf sent (nth i sents))
	(setf ulf-sent (nth i ulfs))
	(setf raw-sent (nth i raw-interps))
	(setf final-sent (nth i final-interps))

	(format t "~s~%~%" sent)

	(format t "	ULF:~%")
	(format t "		~s~%~%" ulf-sent)

	(format t "	EL (raw):~%")
	(loop for phi in raw-sent
		do (format t "		~s~%~%" phi))

	(format t "	EL (final):~%")
	(loop for phi in final-sent
		if (canon-prop? phi)
			do (format t "		~s~%" phi))
))
