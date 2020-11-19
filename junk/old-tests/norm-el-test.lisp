(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "norm-el.lisp")

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

(defun test-base (pred want)
(let (got)
(block outer
	(setf got (pred-base pred))

	(if (not (equal want got))
		; then
		(progn
			(format t "FAIL~%	pred: ~s~%	wanted base pred: ~s~%	got base pred: ~s~%" pred want got)
			(return-from outer nil)
		)
	)

	(format t "PASS~%")
	(return-from outer t)
)
)
)

(defun test-prop-args-pred-mods (prop want)
	(check (lambda (x) (equal x 4)) (length want))

(let (got got-pre-args got-pred got-post-args got-mods
	want-pre-args want-pred want-post-args want-mods
	pre-args-wrong pred-wrong post-args-wrong mods-wrong)
(block outer
	(setf want-pre-args (car want))
	(setf want-pred (second want))
	(setf want-post-args (third want))
	(setf want-mods (fourth want))

	(setf got (prop-args-pred-mods prop))
	
	(setf got-pre-args (car got))
	(setf got-pred (second got))
	(setf got-post-args (third got))
	(setf got-mods (fourth got))

	(setf pre-args-wrong (not (equal got-pre-args want-pre-args)))
	(setf pred-wrong (not (equal got-pred want-pred)))
	(setf post-args-wrong (not (equal got-post-args want-post-args)))
	(setf mods-wrong (not (same-list-unordered want-mods got-mods)))

	(if (or pre-args-wrong pred-wrong post-args-wrong mods-wrong)
		; then
		(block fail
			(format t "FAIL~%	prop: ~s~%" prop)
			(if pre-args-wrong
				; then
				(progn
				(format t "	got pre-args ~s~%" got-pre-args)
				(format t " 	want pre-args ~s~%" want-pre-args)
				)
			)
			(if pred-wrong
				; then
				(progn
				(format t "	got pred ~s~%" got-pred)
				(format t " 	want pred ~s~%" want-pred)
				)
			)
			(if post-args-wrong
				; then
				(progn
				(format t "	got post-args ~s~%" got-post-args)
				(format t " 	want post-args ~s~%" want-post-args)
				)
			)
			(if mods-wrong
				; then
				(progn
				(format t "	got mods ~s~%" got-mods)
				(format t " 	want mods ~s~%" want-mods)
				)
			)

			(return-from outer nil)
		)
	)

	(format t "PASS~%")
	(return-from outer t)
)
)
)

(defun test-pred-args (pred want)
(let (got)
(block outer
	(setf got (pred-args pred))

	(if (not (equal want got))
		; then
		(block fail
			(format t "FAIL~%	pred: ~s~%" pred)
			(format t "	got postfix args ~s~%" got)
			(format t "		wanted ~s~%" want)
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
	'(ATTR RED.A)

	; want types
	'(
		canon-mod?
	)
)
(test-types
	; formula
	'(ATTR ((ATTR RED.A) FLOWER.N))

	; want types
	'(
		canon-mod?
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


; pred-base tests
(format t "~%~%")
(format t "pred-base tests:~%")

(test-base
	; pred
	'EAT.V
	; want
	'EAT.V
)

(test-base
	; pred
	'((ATTR RED.A) FLOWER.N)
	; want
	'FLOWER.N
)

(test-base
	; pred
	'(AGAIN.ADV-S ((ADV-A (TO.P PAYLESS.NAME)) RUN.V))
	; want
	'RUN.V
)


; pred-args tests
(format t "~%~%")
(format t "pred-args tests:~%")
(test-pred-args
	; pred
	'EAT.V
	; want
	'(
	)
)
(test-pred-args
	; pred
	'(EAT.V (K APPLE.N))
	; want
	'(
		(K APPLE.N)
	)
)
(test-pred-args
	; pred
	'(((ADV-A (WITH.P SHE.PRO)) MOVE.V) (K APPLE.N) (TO.P-ARG HOUSE1.SK))
	; want
	'(
		(K APPLE.N)
		(TO.P-ARG HOUSE1.SK)
	)
)


; prop-args-pred-mods tests
(format t "~%~%")
(format t "prop-args-pred-mods tests:~%")
(test-prop-args-pred-mods
	; prop
	'(I.PRO (EAT.V (K APPLE.N)))
	; want
	'(
		; want prefix args
		(
			I.PRO
		)

		; want pred
		EAT.V

		; want postfix args
		(
			(K APPLE.N)
		)

		; want mods
		(
		)
	)
)
(test-prop-args-pred-mods
	; prop
	'(I.PRO ((QUICKLY.ADV-A EAT.V) (K APPLE.N)))
	; want
	'(
		; want prefix args
		(
			I.PRO
		)

		; want pred
		EAT.V

		; want postfix args
		(
			(K APPLE.N)
		)

		; want mods
		(
			QUICKLY.ADV-A
		)
	)
)
(test-prop-args-pred-mods
	; prop
	'(I.PRO (QUICKLY.ADV-A EAT.V) (K APPLE.N))
	; want
	'(
		; want prefix args
		(
			I.PRO
		)

		; want pred
		EAT.V

		; want postfix args
		(
			(K APPLE.N)
		)

		; want mods
		(
			QUICKLY.ADV-A
		)
	)
)
(test-prop-args-pred-mods
	; prop
	'(THEY.PRO ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N)))))) COME.V))
	; want
	'(
		; want prefix args
		(
			THEY.PRO
		)

		; want pred
		COME.V

		; want postfix args
		(
		)

		; want mods
		(
			(ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N))))))
		)
	)
)
