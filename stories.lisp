; story 1
(defparameter may-story
; The Ballad of Kittenball May
'(

  ; Here is May with her kitten.
  ((E1.SK AT-ABOUT.P NOW0) 
   (KITTEN3.SK KITTEN.N)
   (KITTEN3.SK PERTAIN-TO MAY.NAME) 
   (MAY.NAME WITH.P KITTEN3.SK)
   ((MAY.NAME BE.V) ** E1.SK))


    ; Her mother gave the kitten to her.
    ((E4.SK BEFORE.P NOW1) 
     (MOTHER5.SK MOTHER.N)
     (MOTHER5.SK MOTHER-OF.N SHE.PRO) 
     (KITTEN6.SK KITTEN.N)
     ((MOTHER5.SK (GIVE-TO.V SHE.PRO KITTEN6.SK)) ** E4.SK))

    ; She is kind to the pretty kitten.
    ((E7.SK AT-ABOUT.P NOW2) 
     (KITTEN9.SK (PRETTY.A KITTEN.N)) 
     ((SHE.PRO ((ADV-A (TO.P KITTEN9.SK)) (BE.V KIND.A))) ** E7.SK))


    ; She likes to see it jump and play.
    ((E10.SK AT-ABOUT.P NOW3)
     ((SHE.PRO (LIKE.V (KA (L X ((X SEE.V IT.PRO JUMP.V) AND.CC 
                                 (X SEE.V IT.PRO PLAY.V)))))) ** E10.SK))

	; TODO: are "it jump" / "it play" valid arguments for "see"? I guess predicate args are OK, but it really feels like they should be reified to me...


    ; See it run with May's ball!
    ((BALL11.SK BALL.N)
     (BALL11.SK PERTAIN-TO MAY.NAME)
     ((({YOU}.PRO SEE.V (IT.PRO ((ADV-A (WITH.P BALL11.SK)) RUN.V))) ** E12.SK) !))



   ; It does not run far with it.
   ((NOT (SOME E4 (E4 AT-ABOUT.P NOW5)
                  ((IT.PRO (FAR.ADV (ADV-A (WITH.P IT.PRO)) RUN.V)) ** E4))))



   ; If May can get the ball she will not take it.
   ((E11.SK AT-ABOUT.P NOW6)
    (BALL13.SK BALL.N)
    (((IF.PS (MAY.NAME (CAN.MD (GET.V BALL13.SK))))
      (NOT (WILL.MD (SHE.PRO (TAKE.V IT.PRO))))) ** E11.SK))




  ; She will give it to the kitten to play with.
  ((E13.SK AT-ABOUT.P NOW7)
   (KITTEN14.SK KITTEN.N)
   ((WILL.MD (SHE.PRO ((ADV-A (FOR.P (KA (PLAY-WITH.V IT.PRO))))
                       (GIVE-TO.V KITTEN14.SK IT.PRO)))) ** E13.SK))




)
)


(defparameter fishing-1
'(

	; Boys like to catch fish.
	(
		(E1.SK AT-ABOUT.P NOW0)

		((ALL B (B BOY.N)
			((B LIKE.V (KA (CATCH.V (K (PLUR FISH.N))))))) ** E1.SK)
	)

	; It is a good sport.
	(
		(E2.SK AT-ABOUT.P NOW1)

		((IT.PRO (GOOD.A SPORT.N)) ** E2.SK)
	)

	; Here is Tom with his rod and line.
	(
		(E3.SK AT-ABOUT.P NOW2)

		(ROD1.SK ROD.N)
		(LINE1.SK LINE.N)
		(ROD1.SK PERTAIN-TO TOM.NAME)
		(LINE1.SK PERTAIN-TO TOM.NAME)
		(TOM.NAME WITH.P ROD1.SK)
		(TOM.NAME WITH.P LINE1.SK)

		; Unclear (to me) whether this is a copula
		; or an existential "be", but it's useful
		; as a characterizer regardless, even if it's
		; only a "dummy" characterizer.
		((TOM.NAME BE.V) ** E3.SK)
	)

	; A hook is on the end of the line.
	(
		(E4.SK AT-ABOUT.P NOW3)

		(HOOK1.SK HOOK.N)
		(LINE2.SK LINE.N)
		(END1.SK END.N)
		(END1.SK PERTAIN-TO LINE2.SK)

		((HOOK1.SK ON.P END1.SK) ** E4.SK)
	)

	; He has a bag, too.
	(
		(E5.SK AT-ABOUT.P NOW4)

		(BAG1.SK BAG.N)

		((HE.PRO (TOO.ADV-A (HAVE.V BAG1.SK))) ** E5.SK)
	)

	; The bag is to put the fish in.
	(
		(E6.SK AT-ABOUT.P NOW5)

		(BAG2.SK BAG.N)
		(FISH1.SK (PLUR FISH.N))

		((BAG2.SK FOR.P (KA ((IN.P BAG2.SK) PUT.V FISH1.SK))) ** E6.SK)
	)

	; Here is the fish for Tom to catch.
	(
		(E7.SK AT-ABOUT.P NOW6)

		(FISH2.SK FISH.N)

		((FISH2.SK ((FOR.P (KA (TOM.NAME CATCH.V FISH2.SK))) BE.V)) ** E7.SK)
	)

	; It swims with its tail.
	(
		(E8.SK AT-ABOUT.P NOW7)

		(TAIL1.SK TAIL.N)
		(TAIL1.SK PERTAIN-TO IT.PRO)

		((IT.PRO ((WITH.P TAIL1.SK) SWIM.V)) ** E8.SK)
	)

	; It can swim very fast.
	(
		(E9.SK AT-ABOUT.P NOW8)

		((IT.PRO (CAN.MD ((ADV-A (VERY.ADV-A FAST.A)) SWIM.V))) ** E9.SK)
	)
)
)

(defparameter play-sand
'(
	; The monkey can climb a tree.
	((E1.SK AT-ABOUT.P NOW0)
		(MONKEY1.SK MONKEY.N)
		(TREE1.SK TREE.N)
		((MONKEY1.SK (CAN.MD (CLIMB.V TREE1.SK))) ** E1.SK))

	; He climbs the tree and gets a cocoanut. (1/3)
	((E2.SK AT-ABOUT.P NOW1)
		(TREE2.SK TREE.N)
		((HE.PRO (CLIMB.V TREE2.SK)) ** E2.SK))

	; He climbs the tree and gets a cocoanut. (2/3)
	((E3.SK AT-ABOUT.P NOW2)
		(COCONUT1.SK COCONUT.N)
		((HE.PRO (GET.V COCONUT1.SK)) ** E3.SK))

	; He climbs the tree and gets a cocoanut.
	((E2.SK CONSEC E3.SK))
)
)

(defparameter fishing_green
'(

	; Simeon and Pedro like to fish.
	( (E0.SK AT-ABOUT.P NOW0)
 		((SIMEON.NAME LIKE.V (KA FISH.V)) ** E0.SK)

		((PEDRO.NAME LIKE.V (KA FISH.V)) ** E0.SK)
	)

	; Sometimes they sit on the bridge.
	( (E1.SK AT-ABOUT.P NOW1)
		(BRIDGE1.SK BRIDGE.N)
		((THEY.PRO (SOMETIMES.ADV-F (SIT_ON.V BRIDGE1.SK))) ** E1.SK)
	)

	; Sometimes they sit on the bank of the river.
	( (E2.SK AT-ABOUT.P NOW2)
		(BRIDGE1.SK BRIDGE.N)
		(BANK1.SK BANK.N)
		(RIVER1.SK RIVER.N)
		(BANK1.SK PERTAIN-TO RIVER1.SK)
		((THEY.PRO (SOMETIMES.ADV-F (SIT_ON.V BANK1.SK))) ** E2.SK)
	)

	; They have poles, long lines, and little iron hooks.
	( (E3.SK AT-ABOUT.P NOW3)
		((THEY.PRO (HAVE.V (K (PLUR POLE.N)))) ** E3.SK)
		((THEY.PRO (HAVE.V (K (PLUR (LONG.A LINE.N))))) ** E3.SK)
		((THEY.PRO (HAVE.V (K (PLUR (LITTLE.A (IRON.N HOOK.N)))))) ** E3.SK)
	)

	; This morning Simeon caught a large fish.
	( (E4.SK DURING.P MORNING1.SK) (MORNING1.SK BEFORE.P NOW4) (MORNING1.SK MORNING.N)
		(FISH1.SK FISH.N)
		(FISH1.SK LARGE.A)
		((SIMEON.NAME CATCH.V FISH1.SK) ** E4.SK)
	)

	; Pedro caught many small ones.
	( (E5.SK BEFORE.P NOW5)
		(PEDRO.NAME (CATCH.V (MANY.D (PLUR (SMALL.A ONE.PRO)))))
	)

	; The boys caught some crabs, too.
	( (E6.SK BEFORE.P NOW6)
		(BOYS1.SK (PLUR BOY.N))
		(CRABS1.SK (PLUR CRAB.N))
		((BOYS1.SK (CATCH.V CRABS1.SK)) ** E6.SK)
	)

	; They use a net to catch the crabs.
	( (E7.SK AT-ABOUT.P NOW7)
		(NET1.SK NET.N)
		(CRABS2.SK (PLUR CRAB.N))
		((THEY.PRO ((ADV-A (FOR.P (KA (CATCH.V CRABS2.SK)))) (USE.V NET1.SK))) ** E7.SK)
	)
)
)

(defparameter fishing_blue
'(
	; There are fish in their pond.
	( (E0.SK AT-ABOUT.P NOW0)
		(FISH1.SK (PLUR FISH.N))
		(POND1.SK POND.N)
		(POND1.SK PERTAIN-TO THEY.PRO)
		((FISH1.SK (BE.V (IN.P-ARG POND1.SK))) ** E0.SK)
	)

	; They are very nice fish.
	( (E1.SK AT-ABOUT.P NOW1)
		((THEY.PRO (VERY.ADV-A NICE.A)) ** E1.SK)
		((THEY.PRO (PLUR FISH.N)) ** E1.SK)
	)

	; We will come and catch them.
	( (E2.SK AFTER.P NOW2) (E3.SK CONSEC E2.SK)
		((WE.PRO COME.V) ** E2.SK)
		((WE.PRO (CATCH.V THEY.PRO)) ** E3.SK)
	)

	; We will take the long rod, and the hook and line.
	( (E4.SK AFTER.P NOW3)
		(ROD1.SK ROD.N)
		(ROD1.SK LONG.A)
		(HOOK1.SK HOOK.N)
		(LINE1.SK LINE.N)

		((WE.PRO (TAKE.V ROD1.SK)) ** E4.SK)
		((WE.PRO (TAKE.V HOOK1.SK)) ** E4.SK)
		((WE.PRO (TAKE.V LINE1.SK)) ** E4.SK)
	)

	; We must have a bag, too.
	( (E5.SK AT-ABOUT.P NOW4)
		((WE.PRO (MUST.AUX-S (HAVE.V (K BAG.N)))) ** E5.SK)
	)

	; It must be strong, to keep the fish safe.
	( (E6.SK AT-ABOUT.P NOW5)
		((IT.PRO ((ADV-A (FOR.P (KA (KEEP.V FISH.N SAFE.A)))) (MUST.AUX_S (BE.V STRONG.A)))) ** E6.SK)
	)
)
)

(defparameter flowers_ulf
'(
	; Frank and little May are in the field with the wagon.
	((FRANK.NAME AND.CC (LITTLE.A MAY.NAME)) ((PRES BE.V) (ADV-A (IN.P (THE.D FIELD.N))) (ADV-A (WITH.P (THE.D WAGON.N)))))

	; They have come to find flowers.
	(THEY.PRO ((PRES PERF) COME.V (ADV-A ({FOR}.P (KA (FIND.V (K (PLUR FLOWER.N))))))))

	; May has a red flower.
	(MAY.NAME ((PRES HAVE.V) (A.D (RED.A FLOWER.N))))

	; Frank has three yellow flowers.
	(FRANK.NAME ((PRES HAVE.V) (3.D (YELLOW.A FLOWER.N))))

	; He will let May have them.
	(HE.PRO ((PRES WILL.AUX-S) LET.V MAY.NAME (KA (HAVE.V THEY.PRO))))

	; She will take them to the wagon.
	(SHE.PRO ((PRES WILL.AUX-S) TAKE.V THEY.PRO (ADV-A (TO.P (THE.D WAGON.N)))))

	; She is glad to get the pretty flowers.
	(SHE.PRO ((PRES BE.V) GLAD.A (KA (GET.V (THE.D (PLUR (PRETTY.A FLOWER.N)))))))
)
)

(defparameter flowers_el
'(

	; Frank and little May are in the field with the wagon.
	( (E1.SK AT-ABOUT NOW0)
		(MAY.NAME LITTLE.A)
		(FIELD1.SK FIELD.N)
		(WAGON1.SK WAGON.N)
		(FIELD1.SK THE.A) ; these two are marked for coreference resolution with the.a...
		(WAGON1.SK THE.A) ; ...but there won't be any match for them
		((FRANK.NAME (BE.V (IN.P FIELD1.SK) (ADV-A (WITH.P WAGON1.SK)))) ** E1.SK)
		((MAY.NAME (BE.V (IN.P FIELD1.SK) (ADV-A (WITH.P WAGON1.SK)))) ** E1.SK)
	)

	; They have come to find flowers.
	( (E2.SK BEFORE NOW1)
		((THEY.PRO COME.V (ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N))))))) ** E2.SK)
	)

	; May has a red flower.
	( (E3.SK AT-ABOUT NOW2)
		(FLOWER1.SK FLOWER.N)
		(FLOWER1.SK RED.A)
		((MAY.NAME (HAVE.V FLOWER1.SK)) ** E3.SK)
	)

	; Frank has three yellow flowers.
	( (E4.SK AT-ABOUT NOW3)
		(FLOWERS1.SK 3.A)
		(FLOWERS1.SK YELLOW_SET.A)
		(FLOWERS1.SK FLOWER_SET.N)

		((FRANK.NAME (HAVE.V FLOWERS1.SK)) ** E4.SK)
	)

	; He will let May have them.
	( (E5.SK AFTER NOW4)
		((HE.PRO (LET.V MAY.NAME (KA (HAVE.V THEY.PRO)))) ** E5.SK)
	)

	; She will take them to the wagon.
	( (E6.SK AFTER NOW5)
		(WAGON2.SK WAGON.N)
		(WAGON2.SK THE.A) ; the "the" determiner marks this for possible coreference resolution
		((SHE.PRO (TAKE.V THEY.PRO (TO.P-ARG WAGON2.SK))) ** E6.SK)
	)

	; She is glad to get the pretty flowers.
	( (E7.SK AT-ABOUT NOW6)
		(FLOWERS2.SK PRETTY_SET.A)
		(FLOWERS2.SK FLOWER_SET.N)
		(FLOWERS2.SK THE.A) ; the "the" determiner marks this for possible coreference resolution

		; TODO: paraphrasing :/
		((SHE.PRO (BE.V GLAD.A (KA (GET.V FLOWERS2.SK)))) ** E7.SK)
	)
)
)
