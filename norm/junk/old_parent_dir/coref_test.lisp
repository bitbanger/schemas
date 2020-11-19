(declaim (sb-ext:muffle-conditions cl:warning))

(load "coref.lisp")

(defparameter *TEST-KB-EXPLICIT* (make-hash-table :test #'equal))
(defparameter *TEST-KB-ARG-IND* (make-hash-table :test #'equal))
(defparameter *TEST-KB-PRED-IND* (make-hash-table :test #'equal))
(defparameter *TEST-KB* (list *TEST-KB-EXPLICIT* *TEST-KB-ARG-IND* *TEST-KB-PRED-IND*))

(defun test-eval (prop want)
(let (got)
(block outer
	(setf got (eval-prop prop *TEST-KB*))

	(if (equal got want) (format t "PASS~%")
		; else
		(format t "FAIL~%	prop: ~s~%	wanted: ~s~%	got: ~s~%" prop want got)
	)
)))

; Test setup
(add-to-kb '(JACOB.NAME MALE.N) *TEST-KB*)
(add-to-kb '(ABBY.NAME WARM.A) *TEST-KB*)

; Tests
(test-eval
	; prop
	'(JACOB.NAME MALE.N)
	; want
	t
)
(test-eval
	; prop
	'(JACOB.NAME FEMALE.N)
	; want
	nil
)
(test-eval
	; prop
	'(NOT (JACOB.NAME MALE.N))
	; want
	nil
)
(test-eval
	; prop
	'(NOT (JACOB.NAME FEMALE.N))
	; want
	t
)
(test-eval
	; prop
	'(OR (JACOB.NAME FEMALE.N) (JACOB.NAME MALE.N))
	; want
	t
)
(test-eval
	; prop
	'(AND (JACOB.NAME MALE.N) (JACOB.NAME FEMALE.N))
	; want
	nil
)
(test-eval
	; prop
	'(NOT (AND (JACOB.NAME MALE.N) (JACOB.NAME FEMALE.N)))
	; want
	t
)
(test-eval
	; prop
	'(NOT (AND (JACOB.NAME MALE.N) (NOT (OR (NOT (ABBY.NAME COLD.A)) (JACOB.NAME FEMALE.N)))))
	; want
	t
)
(test-eval
	; prop
	'(NOT (AND (JACOB.NAME MALE.N) (NOT (OR (NOT (ABBY.NAME WARM.A)) (JACOB.NAME FEMALE.N)))))
	; want
	nil
)
