(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(load "../stories/roc-mcguffey-stories.lisp")

(ll-load-superdir "schema-matcher.lisp")
(ll-load-superdir "schema-matcher.lisp")
(ll-load-superdir "schema-link.lisp")
(ll-load-superdir "schema-util.lisp")

(loop for roc-story in *ROC*
	do (handler-case (loop for schema in (top-story-matches-easy roc-story)
		do (print-schema (car schema))
	) (error () (format t "story processing error~%")))
)
