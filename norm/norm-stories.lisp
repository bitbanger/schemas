(defparameter *FLOWER-STORY*
'(
	; Frank and little May are in the field with the wagon.
	((E1.SK AT-ABOUT.PR NOW0)
		(MAY.NAME LITTLE.A)
		(FIELD1.SK FIELD_1.N)
		(WAGON1.SK WAGON_1.N)
		(FIELD1.SK INDEF.A)
		(WAGON1.SK INDEF.A)
		((FRANK.NAME ((ADV-E (IN.P FIELD1.SK)) ((ADV-E (WITH.P WAGON1.SK)) BE.V))) ** E1.SK)
		((MAY.NAME ((ADV-E (IN.P FIELD1.SK)) ((ADV-E (WITH.P WAGON1.SK)) BE.V))) ** E1.SK)
	)

	; They have come to find flowers.
	((E2.SK BEFORE.PR NOW1)
		((THEY.PRO ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER_1.N)))))) COME.V)) ** E2.SK)
	)

	; May has a red flower.
	((E3.SK AT-ABOUT.PR NOW2)
		(FLOWER1.SK FLOWER_1.N)
		(FLOWER1.SK RED.A)
		((MAY.NAME (HAVE.V FLOWER1.SK)) ** E3.SK)
	)

	; Frank has three yellow flowers.
	((E4.SK AT-ABOUT.PR NOW3)
		(FLOWERS1.SK 3.A)
		(FLOWERS1.SK (SET_OF.PR (K ((ATTR YELLOW.A) FLOWER_1.N))))
		((FRANK.NAME (HAVE.V FLOWERS1.SK)) ** E4.SK)
	)

	; He will let May have them.
	((E7.SK AFTER.PR NOW4)
		((HE.PRO (LET.V MAY.NAME (KA (HAVE.V THEY.PRO)))) ** E7.SK)
	)

	; She will take them to the wagon.
	((E6.SK AFTER.PR NOW5)
		(WAGON2.SK WAGON_1.N)
		(WAGON2.SK INDEF.A)
		((SHE.PRO (TAKE.V THEY.PRO (TO.P-ARG WAGON2.SK))) ** E6.SK)
	)

	; She is glad to get the pretty flowers.
	((E7.SK AT-ABOUT.PR NOW6)
		(FLOWERS2.SK (SET_OF.PR (K ((ATTR PRETTY.A) FLOWER_1.N))))
		((SHE.PRO (BE.V (K GLAD.A) (KA (GET.V FLOWERS2.SK)))) ** E7.SK)
	)
)
)

(defparameter *MONKEY-STORY*
'(
	((E1.SK AT-ABOUT.PR NOW0)
		(MONKEY1.SK MONKEY_1.N)
		(MONKEY1.SK INDEF.A)
		(TREE1.SK TREE_1.N)
		((MONKEY1.SK (CAN.MD (KA (CLIMB.V TREE1.SK)))) ** E1.SK)
	)

	((E2.SK AT-ABOUT.PR NOW1)
		((MONKEY1.SK (CLIMB.V TREE1.SK)) ** E2.SK)
	)

	((E2.SK CONSEC.PR E3.SK)
		(COCOANUT1.SK COCOANUT_1.N)
		((MONKEY1.SK (GET.V COCOANUT1.SK)) ** E3.SK)
	)

	((E4.SK AT-ABOUT.PR NOW2)
		(GROUND1.SK GROUND_1.N)
		(GROUND1.SK INDEF.A)
		((MONKEY1.SK (DROP.V COCOANUT1.SK (TO.P-ARG GROUND1.SK))) ** E4.SK)
	)

	((E5.SK AT-ABOUT.PR NOW3)
		((MONKEY1.SK ((ADV-A DOWN.A) COME.V)) ** E5.SK)
	)

	((E5.SK CONSEC.PR E6.SK)
		((MONKEY1.SK (EAT.V COCOANUT1.SK)) ** E6.SK)
	)
)
)

(defparameter *MONKEY-STORY-2*
'(
	; What is in this monkey's hands?
	; (skipping for now)
	; TODO: think about how to handle questions

	; The monkey has a cocoanut.
	((E1.SK AT-ABOUT.PR NOW0)
		(MONKEY1.SK MONKEY.N)
		(MONKEY1.SK INDEF.A)
		(COCOANUT1.SK COCOANUT.N)
		((MONKEY1.SK (HAVE.V COCOANUT1.SK)) ** E1.SK)
	)

	; He likes the cocoanut.
	((E2.SK AT-ABOUT.PR NOW1)
		((MONKEY1.SK (LIKE.V COCOANUT1.SK)) ** E2.SK)
	)

	; He will eat it.
	((E3.SK AFTER.PR NOW2)
		((MONKEY1.SK (EAT.V COCOANUT1.SK)) ** E3.SK)
	)
)
)
