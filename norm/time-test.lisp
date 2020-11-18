(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "norm-time.lisp")

(defparameter *RELS* '(
	(?A BEFORE ?B)
	(?C AFTER ?B)
	(?C CONSEC ?D)
	(?E DURING ?D)
	(?D STRICTLY-BEFORE ?F)
	(?D BEFORE ?G)
))


(load-time-model *RELS*)

(defparameter *TESTS* '(
	(
		(?F AFTER ?E)
		t
	)
	(
		(?G AFTER ?E)
		nil
	)
	(
		(?A BEFORE ?C)
		t
	)
	(
		(?A DURING ?C)
		nil
	)
	(
		(?C BEFORE ?F)
		t
	)
))

(loop for test in *TESTS*
	for i from 0
	do (block tst
		(setf res (eval-time-prop (car test)))
		(if (not (equal res (second test)))
			; then
			(format t "test for ~s failed (wanted ~s, got ~s)~%" (car test) (second test) res)
			; else
			(format t "PASS~%")
		)
	)
)
