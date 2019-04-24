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
