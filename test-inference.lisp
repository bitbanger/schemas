(declaim (sb-ext:muffle-conditions cl:warning))

(load "real_util.lisp")
(load "inference.lisp")

(defun test-match (got want-pairs)
	(cond
		((ht-eq got (mk-hashtable want-pairs))
			(format t "PASS~%")
		)

		(t
			(progn
				(format t "FAIL: got~%")

				(print-ht got)

				(format t "~%but wanted~%")
				
				(print-ht (mk-hashtable want-pairs))

				(format t "~%")
			)
		)
	)
)


(defun test-apply-bindings (pattern binding-pairs want)
(progn
	(setf got (apply-bindings pattern (mk-hashtable binding-pairs)))

	(cond
		((equal got want)
			(format t "PASS~%")
		)

		(t
			(format t "FAIL: got~%")
			(format t "~s~%" got)
			(format t "~%but wanted~%")
			(format t "~s~%" want)
		)
	)
)
)


(defun test-apply-inference-rule (formula rule want)
(progn
	(setf got (apply-inference-rule formula rule))

	(cond
		((equal got want)
			(format t "PASS~%")
		)

		(t
			(format t "FAIL: got~%")
			(format t "~s~%" got)
			(format t "~%but wanted~%")
			(format t "~s~%" want)
		)
	)
)
)



(format t "match-formula tests:~%")

(test-match
	(match-formula
		1
		1
		nil
	)

	t
)

(test-match
	; got
	(match-formula
		'(1 2 3 4)
		'(1 2 ?x 4)
		nil
	)

	; want
	'(
		(?x 3)
	)

)

(test-match
	; got
	(match-formula
		'(1 2 3 4)
		'(1 2 ?x ?x)
		nil
	)

	; want
	nil
)

(test-match
	; got
	(match-formula
		'(1 2 3 3)
		'(1 2 ?x ?x)
		nil
	)

	; want
	'(
		(?x 3)
	)
)

(test-match
	; got
	(match-formula
		'(1 2 (4 5 6) 4)
		'(1 2 (?x ?y ?z) ?x)
		nil
	)

	; want
	'(
		(?x 4)
		(?y 5)
		(?z 6)
	)
)

(test-match
	; got
	(match-formula
		'(1 2 (4 5 6) 7)
		'(1 2 (?x ?y ?z) ?x)
		nil
	)

	; want
	nil
)

(test-match
	; got
	(match-formula
		'(1 2 (4 5 ?a) 4)
		'(1 2 (?x ?y ?z) ?x)

		; constraints
		(mk-hashtable (list
			(list
				'?x
				; one constraint: x must be EVEN
				(list
					(lambda (x) (equal 0 (mod x 2)))
				)
			)
		))
	)

	; want
	'(
		(?x 4)
		(?y 5)
		(?z ?a)
	)
)

(test-match
	; got
	(match-formula
		'(1 2 (4 5 ?a) 4)
		'(1 2 (?x ?y ?z) ?x)

		; constraints
		(mk-hashtable (list
			(list
				'?x
				(list
					; one constraint: x must be ODD
					(lambda (x) (equal 1 (mod x 2)))
				)
			)
		))
	)

	; want
	nil
)

; this tries to unify 1 and 1, which is fine
(test-match
	; got
	(match-formula
		'(1 2 ?x ?y ?a)
		'(?a ?b 1 4 ?x)

		; constraints
		(mk-hashtable nil)
	)

	; want
	'(
		(?a 1)
		(?b 2)
		(?x 1)
		(?y 4)
	)
)

; this one tries to unify 1 and 3 after the substitution
(test-match
	; got
	(match-formula
		'(1 2 ?x ?y ?a)
		'(?a ?b 3 4 ?x)

		; constraints
		(mk-hashtable nil)
	)

	; want
	nil
)

(format t "apply-bindings tests:~%")
(test-apply-bindings
	'(1 2 ?x 4)
	nil

	'(1 2 ?x 4)
)

(test-apply-bindings
	'(1 2 ?x 4)
	'(
		(?x 3)
	)

	'(1 2 3 4)
)

(test-apply-bindings
	'(1 2 (?x ?y ?z) ?x)
	'(
		(?x 3)
		(?z (?x ?x ?x))
	)

	'(1 2 (3 ?y (3 3 3)) 3)
)


(format t "apply-inference-rule tests:~%")

; the verb predicate should allow a verb binding
(test-apply-inference-rule
	; formula to base inference on
	'(I.pro eat.v (k ham.n))

	; inference rule
	(list
		; match pattern
		'(?x ?y ?z)

		; variable constraints
		(mk-hashtable (list
			; y must be a verb symbol
			(list
				'?y
				(list #'verbp)
			)
		))

		; inferent
		'(?x do.v (ka (?y ?z)))
	)

	; desired result
	'(I.pro do.v (ka (eat.v (k ham.n))))
)

; the verb predicate should reject a noun binding
(test-apply-inference-rule
	; formula to base inference on
	'(I.pro eat-noun.n (k ham.n))

	; inference rule
	(list
		; match pattern
		'(?x ?y ?z)

		; variable constraints
		(mk-hashtable (list
			; y must be a verb symbol
			(list
				'?y
				(list #'verbp)
			)
		))

		; inferent
		'(?x do.v (ka (?y ?z)))
	)

	; desired result
	nil
)
