(defparameter *FLOWER-STORY*
'(
	; Frank and little May are in the field with the wagon.
	((E1.SK AT-ABOUT NOW0)
		(MAY.NAME LITTLE.A)
		(FIELD1.SK FIELD_1.N)
		(WAGON1.SK WAGON_1.N)
		(FIELD1.SK INDEF.A)
		(WAGON1.SK INDEF.A)
		((FRANK.NAME ((ADV-E (IN.P FIELD1.SK)) ((ADV-E (WITH.P WAGON1.SK)) BE.V))) ** E1.SK)
		((MAY.NAME ((ADV-E (IN.P FIELD1.SK)) ((ADV-E (WITH.P WAGON1.SK)) BE.V))) ** E1.SK)
	)

	; They have come to find flowers.
	((E2.SK BEFORE NOW1)
		((THEY.PRO ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER_1.N)))))) COME.V)) ** E2.SK)
	)

	; May has a red flower.
	((E3.SK AT-ABOUT NOW2)
		(FLOWER1.SK FLOWER_1.N)
		(FLOWER1.SK RED.A)
		((MAY.NAME (HAVE.V FLOWER1.SK)) ** E3.SK)
	)

	; Frank has three yellow flowers.
	((E4.SK AT-ABOUT NOW3)
		(FLOWERS1.SK 3.A)
		(FLOWERS1.SK (SET_OF (K ((ATTR YELLOW.A) FLOWER_1.N))))
		((FRANK.NAME (HAVE.V FLOWERS1.SK)) ** E4.SK)
	)

	; He will let May have them.
	((E7.SK AFTER NOW4)
		((HE.PRO (LET.V MAY.NAME (KA (HAVE.V THEY.PRO)))) ** E7.SK)
	)

	; She will take them to the wagon.
	((E6.SK AFTER NOW5)
		(WAGON2.SK WAGON_1.N)
		(WAGON2.SK INDEF.A)
		((SHE.PRO (TAKE.V THEY.PRO (TO.P-ARG WAGON2.SK))) ** E6.SK)
	)

	; She is glad to get the pretty flowers.
	((E7.SK AT-ABOUT NOW6)
		(FLOWERS2.SK (SET_OF (K ((ATTR PRETTY.A) FLOWER_1.N))))
		((SHE.PRO (BE.V (K GLAD.A) (KA (GET.V FLOWERS2.SK)))) ** E7.SK)
	)
)
)

(defparameter *MONKEY-STORY*
'(
	((E1.SK AT-ABOUT NOW0)
		(MONKEY1.SK MONKEY_1.N)
		(MONKEY1.SK INDEF.A)
		(TREE1.SK TREE_1.N)
		((MONKEY1.SK (CAN.MD (KA (CLIMB.V TREE1.SK)))) ** E1.SK)
	)

	((E2.SK AT-ABOUT NOW1)
		((MONKEY1.SK (CLIMB.V TREE1.SK)) ** E2.SK)
	)

	((E2.SK CONSEC E3.SK)
		(COCOANUT1.SK COCOANUT_1.N)
		((MONKEY1.SK (GET.V COCOANUT1.SK)) ** E3.SK)
	)

	((E4.SK AT-ABOUT NOW2)
		(GROUND1.SK GROUND_1.N)
		(GROUND1.SK INDEF.A)
		((MONKEY1.SK (DROP.V COCOANUT1.SK (TO.P-ARG GROUND1.SK))) ** E4.SK)
	)

	((E5.SK AT-ABOUT NOW3)
		((MONKEY1.SK ((ADV-A DOWN.A) COME.V)) ** E5.SK)
	)

	((E5.SK CONSEC E6.SK)
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
	((E1.SK AT-ABOUT NOW0)
		(MONKEY1.SK MONKEY.N)
		(MONKEY1.SK INDEF.A)
		(COCOANUT1.SK COCOANUT.N)
		((MONKEY1.SK (HAVE.V COCOANUT1.SK)) ** E1.SK)
	)

	; He likes the cocoanut.
	((E2.SK AT-ABOUT NOW1)
		((MONKEY1.SK (LIKE.V COCOANUT1.SK)) ** E2.SK)
	)

	; He will eat it.
	((E3.SK AFTER NOW2)
		((MONKEY1.SK (EAT.V COCOANUT1.SK)) ** E3.SK)
	)
)
)

(defparameter *KITE-STORY*
	'(
		; Frank has gone to the field with his kite.
		((E1.SK BEFORE NOW0)
			(KITE1.SK KITE_1.N)
			(KITE1.SK PERTAIN-TO FRANK.NAME)
			(FIELD1.SK FIELD_1.N)
			((FRANK.NAME (((ADV-A (WITH.P KITE1.SK)) GO.V) (TO.P-ARG FIELD1.SK))) ** E1.SK)
		)
	)
)

(defparameter *KITE-STORY-2*
	'(
		; This is a fine day.
		((E1.SK AT-ABOUT NOW0)
			(E1.SK DAY.N)
			(E1.SK FINE.A)
		)

		; The sun shines bright.
		((E2.SK AT-ABOUT NOW1)
			(SUN1.SK SUN.N)
			((SUN1.SK ((ADV-A BRIGHT.A) SHINE.V)) ** E2.SK)
		)

		; There is a good wind, and my kite flies high.
		((E3.SK AT-ABOUT NOW2)
			(WIND1.SK WIND.N)
			(WIND1.SK GOOD.A)
			(KITE1.SK KITE_1.N)
			(KITE1.SK PERTAIN-TO I.PRO)
			((KITE1.SK ((ADV-A HIGH.A) FLY.V)) ** E3.SK)
		)
	)
)

(defparameter *COUSIN-STORY*
	; His cousin Henry came from the city to see him.
	'(

		((E1.SK BEFORE NOW0)
			(HENRY.NAME COUSIN-OF.PR HE.PRO)
			(CITY1.SK CITY_1.N)
			((HENRY.NAME ((ADV-A (FOR.P (KA (SEE.V HE.PRO)))) (COME.V (FROM.P-ARG CITY1.SK)))) ** E1.SK)
		)
	)
)

(defparameter *PARSED-MONKEY-STORY* '(

(((MONKEY2.SK ((CAN.MD CLIMB.V) TREE3.SK)) ** E1.SK)

(E1.SK (AT-ABOUT NOW0))

(MONKEY2.SK MONKEY.N)

(TREE3.SK TREE.N))



((E0 (ORIENTS OBJECT4.SK))

(OBJECT4.SK (AT-ABOUT NOW1))

(TREE5.SK TREE.N)

(E1 (ORIENTS OBJECT6.SK))

(OBJECT6.SK (AT-ABOUT NOW1))

(COCOANUT7.SK COCOANUT.N)

(OBJECT4.SK (CONSEC OBJECT6.SK))

((HE.PRO (GET.V COCOANUT7.SK)) ** OBJECT6.SK)

((HE.PRO (CLIMB.V TREE5.SK)) ** OBJECT4.SK))



((OBJECT9.SK (TO.P GROUND10.SK))

(OBJECT9.SK COCOANUT.N)

(OBJECT8.SK (AT-ABOUT NOW2))

(E2 (ORIENTS OBJECT8.SK))

((HE.PRO (DROP.V OBJECT9.SK)) ** OBJECT8.SK)

(GROUND10.SK GROUND.N))



(((HE.PRO (EAT.V IT.PRO)) ** OBJECT12.SK)

((HE.PRO (EAT.V IT.PRO)) ** E14.SK)

((HE.PRO (DOWN.ADV COME.V)) ** E13.SK)

(E3 (ORIENTS E11.SK))

(E11.SK (AT-ABOUT NOW3))

(E11.SK (ORIENTS OBJECT12.SK))

(OBJECT12.SK (AT-ABOUT NOW3))

(E13.SK (DURING E11.SK))

(E14.SK (DURING E11.SK))

(E13.SK (CONSEC E14.SK)))

))
