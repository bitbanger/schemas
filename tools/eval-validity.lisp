(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")
(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "new-ulf-parser.lisp")

(setf sents (loop for line = (read-line *standard-input* nil :eof) ; stream, no error, :eof value
	until (eq line :eof)
	collect line))

(setf elfs (len-parse-sents sents))

(setf valid 0)
(setf total 0)
(loop for elf-sent in elfs
	do (setf total (+ total 1))
	if (loop for elf in elf-sent
		always (canon-prop? elf))
		; then
		do (setf valid (+ valid 1)))

(format t "~d / ~d~%" valid total)
