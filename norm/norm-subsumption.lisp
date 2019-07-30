(load "parse.lisp")
(load "norm-el.lisp")
(load "real_util.lisp")

(defun subsumes (schema-pred story-pred)
(block outer
	; If they're equal, schema subsumes story
	(if (equal schema-pred story-pred)
		(return-from outer t)
	)

	; Default case: no subsumption
	(return-from outer nil)
)
)
