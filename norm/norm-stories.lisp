(defparameter *FLOWER-STORY*
'(
	; Frank and little May are in the field with the wagon.
	((E1.SK AT-ABOUT.PR NOW0)
		(MAY.NAME LITTLE.A)
		(FIELD1.SK FIELD.N)
		(WAGON1.SK WAGON.N)
		(FIELD1.SK INDEF.A)
		(WAGON1.SK INDEF.A)
		((FRANK.NAME ((ADV-E (IN.P FIELD1.SK)) ((ADV-E (WITH.P WAGON1.SK)) BE.V))) ** E1.SK)
		((MAY.NAME ((ADV-E (IN.P FIELD1.SK)) ((ADV-E (WITH.P WAGON1.SK)) BE.V))) ** E1.SK)
	)

	; They have come to find flowers.
	((E2.SK BEFORE.PR NOW1)
		((THEY.PRO ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N)))))) COME.V)) ** E2.SK)
	)

	; May has a red flower.
	((E3.SK AT-ABOUT.PR NOW2)
		(FLOWER1.SK FLOWER.N)
		(FLOWER1.SK RED.A)
		((MAY.NAME (HAVE.V FLOWER1.SK)) ** E3.SK)
	)

	; Frank has three yellow flowers.
	((E4.SK AT-ABOUT.PR NOW3)
		(FLOWERS1.SK 3.A)
		(FLOWERS1.SK (SET_OF.PR (K ((ATTR YELLOW.A) FLOWER.N))))
		((FRANK.NAME (HAVE.V FLOWERS1.SK)) ** E4.SK)
	)

	; He will let May have them.
	((E7.SK AFTER.PR NOW4)
		((HE.PRO (LET.V MAY.NAME (KA (HAVE.V THEY.PRO)))) ** E7.SK)
	)

	; She will take them to the wagon.
	((E6.SK AFTER.PR NOW5)
		(WAGON2.SK WAGON.N)
		(WAGON2.SK INDEF.A)
		((SHE.PRO (TAKE.V THEY.PRO (TO.P-ARG WAGON2.SK))) ** E6.SK)
	)

	; She is glad to get the pretty flowers.
	((E7.SK AT-ABOUT.PR NOW6)
		(FLOWERS2.SK (SET_OF.PR (K ((ATTR PRETTY.A) FLOWER.N))))
		((SHE.PRO (BE.V (K GLAD.A) (KA (GET.V FLOWERS2.SK)))) ** E7.SK)
	)
)
)
