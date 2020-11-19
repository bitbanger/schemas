(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "norm-matcher.lisp")
(ll-load "norm-schema-util.lisp")

(loop for schema-pair in (top-story-matches-easy '("I ate a steak." "Then I went home."))
	do (print-schema (car schema-pair))
)
