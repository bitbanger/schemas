(declaim (sb-ext:muffle-conditions cl:warning))

(load "real_util.lisp")
(load "inference.lisp")

(defun ht-eq-oneway (ht1 ht2)
	(loop for key being the hash-keys of ht1
		always (equal (gethash key ht1) (gethash key ht2))
	)
)

(defun ht-eq (ht1 ht2)
(cond

	((and (hashtablep ht1) (not (hashtablep ht2)))
		nil)
	((and (hashtablep ht2) (not (hashtablep ht1)))
		nil)

	((and (not (hashtablep ht1)) (not (hashtablep ht2)))
		(equal ht1 ht2)
	)

	((and
		(ht-eq-oneway ht1 ht2)
		(ht-eq-oneway ht2 ht1)
	) t)

	(t nil)
)
)

(defun print-ht (ht)
(cond
	((not (hashtablep ht)) (format t "	value ~s~%" ht))

	(t (loop for key being the hash-keys of ht
		do (format t "	~s: ~s~%" key (gethash key ht))
	))
)
)

(defun mk-want-bind (pairs)
(cond
	((equal pairs t) t)

	((null pairs) nil)

	(t (progn
		(setf want-bind (make-hash-table :test #'equal))
		(loop for pair in pairs
			do (setf (gethash (car pair) want-bind) (second pair))
		)
		want-bind
	))
)
)

(defun test-match (got want-pairs)
	(cond
		((ht-eq got (mk-want-bind want-pairs))
			(format t "PASS~%")
		)

		(t
			(progn
				(format t "FAIL: got~%")

				(print-ht got)

				(format t "~%but wanted~%")
				
				(print-ht (mk-want-bind want-pairs))

				(format t "~%")
			)
		)
	)
)


(defun test-apply-bindings (pattern binding-pairs want)
(progn
	(setf got (apply-bindings pattern (mk-want-bind binding-pairs)))

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
	)

	t
)

(test-match
	; got
	(match-formula
		'(1 2 3 4)
		'(1 2 ?x 4)
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
	)

	; want
	nil
)

(test-match
	; got
	(match-formula
		'(1 2 3 3)
		'(1 2 ?x ?x)
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
(test-apply-inference-rule
	; formula to base inference on
	'(I.pro eat.v (k ham.n))

	; inference rule
	'(
		; match pattern
		(?x eat.v (k ?y))

		; inferent
		(?x do.v (ka (eat.v (k ?y))))
	)

	; desired result
	'(I.pro do.v (ka (eat.v (k ham.n))))
)
