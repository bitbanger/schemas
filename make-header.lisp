(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "schema-to-english.lisp")

(read)
(setf sch (read))
; (format t "~s~%" sch)
(setf sents (join-str-list *NEWLINE-STR* (schema-to-english sch)))
(setf sents (replace-all sents "_PROTO" ""))
(format t "~s~%" sents)
(setf outp (run-proc-with-stdin
	"/home/lane/miniconda3/bin/python3"
	'("/home/lane/Code/gpt/summarize_story.py")
	sents))
(format t "~s~%" outp)
(format t "~s~%" (gpt-schema-header sch 2))
