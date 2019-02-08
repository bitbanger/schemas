(declaim (sb-ext:muffle-conditions cl:warning))

(load "matcher.lisp")
(load "real_util.lisp")
(load "protoschemas.lisp")
(load "stories.lisp")

(defun test-extract-vars (wffs want)
(block outer
	(setf tev-got (extract-vars wffs))
	(cond
		((same-list-unordered tev-got want)
			(format t "PASS~%")
		)

		(t
			(format t "FAIL: wanted vars ~s, but got ~s~%" want tev-got)
		)
	)
)
)

(defun test-unify-wffs (wff1 wff2 bindings want)
(block outer

	(setf tuw-got (unify-wffs wff1 wff2 bindings))

	(cond
		((ht-eq tuw-got want)
			(format t "PASS~%")
		)

		(t (progn
			(format t "FAIL: wanted bindings~%")
			(print-ht want)
			(format t "but got~%")
			(print-ht tuw-got)
		))
	)

)
)



(format t "test-extract-vars:~%")
(test-extract-vars
	; WFFs
	(list
		'(1)
		'(2)
		'(3 nil 4)
	)

	; want
	nil
)

(test-extract-vars
	; WFFs
	(list
		'(?x eat.v ?y)
		'(?x ?x ?y)
		'(1 2 ?z 4)
		nil
		'(4 5)
		'(nil)
	)

	; want
	'(?x ?y ?z)
)

(test-extract-vars
	; WFFs
	(list
		'(?x eat.v ?y)
		'(1 2 ?z 4)
	)

	; want
	'(?x ?y ?z)
)



(format t "test-unify-wffs:~%")

; pre-existing bindings are fine if they don't conflict
(test-unify-wffs
	; wff1
	'(?x eat.v ?y)

	; wff2
	'(|Mariel| eat.v (k potato.n))

	; pre-existing bindings
	(mk-hashtable (list
		'(?z 3)
	))

	; want bindings
	(mk-hashtable (list
		'(?z 3)
		'(?x |Mariel|)
		'(?y (k potato.n))
	))
)

; any pre-existing binding conflict should preclude
; the match
(test-unify-wffs
	; wff1
	'(?x eat.v ?y)

	; wff2
	'(|Mariel| eat.v (k potato.n))

	; pre-existing bindings
	(mk-hashtable (list
		'(?x |Gaurav|)
	))

	; want bindings
	nil
)

