(load "parse.lisp")
(load "real_util.lisp")

; Example canonical story
'(
	; Frank and little May are in the field with the wagon.
	((AT-ABOUT.PR E1.SK NOW0)
		(LITTLE.A MAY.NAME)
		(FIELD.N FIELD1.SK)
		(WAGON.N WAGON1.SK)
		(INDEF.A FIELD1.SK)
		(INDEF.A WAGON1.SK)
		(** (((ADV-E (IN.P FIELD1.SK)) ((ADV-E (WITH.P WAGON1.SK)) BE.V)) FRANK.NAME) E1.SK)
		(** (((ADV-E (IN.P FIELD1.SK)) ((ADV-E (WITH.P WAGON1.SK)) BE.V)) MAY.NAME) E1.SK)
	)

	; They have come to find flowers.
	((BEFORE.PR E2.SK NOW1)
		(** (((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N)))))) COME.V) THEY.PRO) E2.SK)
	)

	; May has a red flower.
	((AT-ABOUT.PR E3.SK NOW2)
		(FLOWER.N FLOWER1.SK)
		(RED.A FLOWER1.SK)
		(** ((HAVE.V FLOWER1.SK) MAY.NAME) E3.SK)
	)

	; Frank has three yellow flowers.
	((AT-ABOUT.PR E4.SK NOW3)
		(3.A FLOWERS1.SK)
		((SET_OF.PR (K ((ATTR YELLOW.A) FLOWER.N))) FLOWERS1.SK)
		(** ((HAVE.V FLOWERS1.SK) FRANK.NAME) E4.SK)
	)

	; He will let May have them.
	((AFTER.PR E7.SK NOW4)
		(** ((LET.V MAY.NAME (KA (HAVE.V THEY.PRO))) HE.PRO) E7.SK)
	)

	; She will take them to the wagon.
	((AFTER.PR E6.SK NOW5)
		(WAGON.N WAGON2.SK)
		(INDEF.A WAGON2.SK)
		(** ((TAKE.V THEY.PRO (TO.P-ARG WAGON2.SK)) SHE.PRO) E6.SK)
	)

	; She is glad to get the pretty flowers.
	((AT-ABOUT.PR E7.SK NOW6)
		((SET_OF.PR (K ((ATTR PRETTY.A) FLOWER.N))) FLOWERS2.SK)
		(** ((BE.V (K GLAD.A) (KA (GET.V FLOWERS2.SK))) SHE.PRO) E7.SK)
	)
)


; TODO (CURRENT): rewrite parse functions to determine whether
; something is a pred, proposition, modifier, term...
