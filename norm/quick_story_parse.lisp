(declaim (sb-ext:muffle-conditions cl:warning))

(if (<= (length sb-ext:*posix-argv*) 1)
	; then
	(quit)
)

(load "ll-load.lisp")

(ll-load "schema-parser.lisp")

(format t "~s~%"
	(parse-story (cdr sb-ext:*posix-argv*))
)
