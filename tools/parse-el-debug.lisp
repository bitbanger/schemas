
(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")
(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "new-ulf-parser.lisp")

; (setf els (len-parse-sents 
(dbg-tag 'schema-postproc)

(setf sents (loop for line = (read-line *standard-input* nil :eof) ; stream, no error, :eof value
	until (eq line :eof)
	collect line))

(setf elfs (len-parse-sents sents t))

(loop for elf-sent in elfs
	do (loop for elf in elf-sent
		do (format t "~s~%" elf)))