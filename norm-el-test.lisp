(declaim (sb-ext:muffle-conditions cl:warning))

(load "norm-el.lisp")

(defun test-types (phi want)
(let (got)
(block outer
	; CODE
	(setf got (typecheck phi))

	(setf unwanted (set-difference got want :test #'equal))
	(setf missing (set-difference want got :test #'equal))


	(if (not (same-list-unordered got want))
		; then
		(progn
			(format t "FAIL~%	formula: ~s~%	wanted types: ~s~%	got types: ~s~%" phi want got)
			(return-from outer nil)
		)
	)

	(format t "PASS~%")
	(return-from outer t)
)
)
)

(defun test-mods (phi want)
(let (got)
(block outer
	; CODE
	(setf got (pred-mods phi))

	(setf unwanted (set-difference got want :test #'equal))
	(setf missing (set-difference want got :test #'equal))


	(if (not (same-list-unordered got want))
		; then
		(progn
			(format t "FAIL~%	formula: ~s~%	wanted modifiers: ~s~%	got modifiers: ~s~%" phi want got)
			(return-from outer nil)
		)
	)

	(format t "PASS~%")
	(return-from outer t)
)
)
)



; typecheck tests
(format t "typecheck tests:~%")

(test-types
	; formula
	'FLOWER.N

	; want types
	'(
		canon-pred?
	)
)
(test-types
	; formula
	'(RED.A FLOWER.N)

	; want types
	'(
	)
)
(test-types
	; formula
	'((ATTR RED.A) FLOWER.N)

	; want types
	'(
		canon-pred?
	)
)
(test-types
	; formula
	'RUN.V

	; want types
	'(
		canon-pred?
	)
)
(test-types
	; formula
	'(TO.P PAYLESS.NAME)

	; want types
	'(
		canon-pred?
	)
)
(test-types
	; formula
	'(ADV-A (TO.P PAYLESS.NAME))

	; want types
	'(
		canon-mod?
	)
)
(test-types
	; formula
	'((ADV-A (TO.P PAYLESS.NAME)) RUN.V)

	; want types
	'(
		canon-pred?
	)
)
(test-types
	; formula
	'(AGAIN.ADV-S ((ADV-A (TO.P PAYLESS.NAME)) RUN.V))

	; want types
	'(
		canon-pred?
	)
)
(test-types
	; formula
	'(I.PRO (AGAIN.ADV-S ((ADV-A (TO.P PAYLESS.NAME)) RUN.V)))

	; want types
	'(
		canon-prop?
	)
)
(test-types
	; formula
	'((I.PRO (AGAIN.ADV-S ((ADV-A (TO.P PAYLESS.NAME)) RUN.V))) ** NOW)

	; want types
	'(
		canon-prop?
	)
)
(test-types
	; formula
	'(THAT ((I.PRO (AGAIN.ADV-S ((ADV-A (TO.P PAYLESS.NAME)) RUN.V))) ** NOW))

	; want types
	'(
		canon-individual?
	)
)
(test-types
	; formula
	'(CAUSE-OF.N (THAT ((I.PRO (AGAIN.ADV-S ((ADV-A (TO.P PAYLESS.NAME)) RUN.V))) ** NOW)))

	; want types
	'(
		canon-pred?
	)
)
(test-types
	; formula
	'(THAT.PRO CAUSE-OF.N (THAT ((I.PRO (AGAIN.ADV-S ((ADV-A (TO.P PAYLESS.NAME)) RUN.V))) ** NOW)))

	; want types
	'(
		canon-prop?
	)
)



; pred-mods tests
(format t "~%~%")
(format t "pred-mods tests:~%")

(test-mods
	; formula
	'RUN.V

	; want mods
	'(
	)
)

(test-mods
	; formula
	'(AGAIN.ADV-S RUN.V)

	; want mods
	'(
		AGAIN.ADV-S
	)
)

(test-mods
	; formula
	'((ADV-A (TO.P PAYLESS.NAME)) RUN.V)

	; want mods
	'(
		(ADV-A (TO.P PAYLESS.NAME))
	)
)

(test-mods
	; formula
	'(AGAIN.ADV-S ((ADV-A (TO.P PAYLESS.NAME)) RUN.V))

	; want mods
	'(
		AGAIN.ADV-S
		(ADV-A (TO.P PAYLESS.NAME))
	)
)
(test-mods
	; formula
	'((ADV-A (TO.P PAYLESS.NAME)) (AGAIN.ADV-S RUN.V))

	; want mods
	'(
		AGAIN.ADV-S
		(ADV-A (TO.P PAYLESS.NAME))
	)
)
