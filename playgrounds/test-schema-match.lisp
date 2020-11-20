(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load-superdir "schema-matcher.lisp")
(ll-load-superdir "schema-util.lisp")

(loop for schema-pair in (top-story-matches-easy '("A girl ate a steak." "Then she went home."))
	do (print-schema (car schema-pair))
)
