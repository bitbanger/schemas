(declaim (sb-ext:muffle-conditions cl:warning))

(load "norm-unify.lisp")

(defun test-unify (fn schema story bindings want-bindings)
(let (got-bindings)
(block outer
	(if (null bindings)
		(setf bindings (make-hash-table :test #'equal))
	)

	(setf got-bindings (funcall fn schema story bindings))
	(if (not (ht-eq got-bindings want-bindings))
		; then
		(progn
		(format t "FAIL~%")
		(format t "	function: ~s~%" fn)
		(format t "	schema arg: ~s~%" schema)
		(format t "	story arg: ~s~%" story)
		(format t "	wanted bindings:~%~s~%" (tab-all-lines 1 (ht-to-str want-bindings)))
		(format t "	got bindings:~%~s~%" (tab-all-lines 1 (ht-to-str got-bindings)))
		(return-from outer nil)
		)
	)

	(format t "PASS~%")
	(return-from outer t)
)
)
)

(test-unify
	; unification function
	#'unify-props

	; schema arg
	'(I.PRO (EAT.V (K STEAK.N)))

	; story arg
	'(I.PRO (EAT.V (K STEAK.N)))

	; prior bindings
	*EMPTY-HT*

	; want bindings
	*EMPTY-HT*
)

(test-unify
	; unification function
	#'unify-props

	; schema arg
	'(I.PRO (EAT.V (K APPLE.N)))

	; story arg
	'(I.PRO (EAT.V (K STEAK.N)))

	; prior bindings
	*EMPTY-HT*

	; want bindings
	nil
)

(test-unify
	; unification function
	#'unify-props

	; schema arg
	'(I.PRO (EAT.V ?x))

	; story arg
	'(I.PRO (EAT.V (K STEAK.N)))

	; prior bindings
	*EMPTY-HT*

	; want bindings
	(mk-hashtable (list
		(list
			; key
			'?x

			; val
			'(K STEAK.N)
		)
	))
)

(test-unify
	; unification function
	#'unify-props

	; schema arg
	'(I.PRO (EAT.V ?x ?y))

	; story arg
	'(I.PRO (EAT.V (K STEAK.N) (K APPLE.N)))

	; prior bindings
	*EMPTY-HT*

	; want bindings
	(mk-hashtable (list
		(list
			; key
			'?x

			; val
			'(K STEAK.N)
		)
		(list
			; key
			'?y

			; val
			'(K APPLE.N)
		)
	))
)

(test-unify
	; unification function
	#'unify-props

	; schema arg
	'(I.PRO (EAT.V ?x ?x))

	; story arg
	'(I.PRO (EAT.V (K STEAK.N) (K STEAK.N)))

	; prior bindings
	*EMPTY-HT*

	; want bindings
	(mk-hashtable (list
		(list
			; key
			'?x

			; val
			'(K STEAK.N)
		)
	))
)

(test-unify
	; unification function
	#'unify-props

	; schema arg
	'(I.PRO (EAT.V ?x ?x))

	; story arg
	'(I.PRO (EAT.V (K STEAK.N) (K APPLE.N)))

	; prior bindings
	*EMPTY-HT*

	; want bindings
	nil
)
