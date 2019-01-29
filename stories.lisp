; story 1
; The Ballad of Kittenball May
'(

  ; Here is May with her kitten.
  ((E1.SK AT-ABOUT NOW0) 
   (KITTEN3.SK KITTEN.N)
   (KITTEN3.SK PERTAIN-TO MAY.NAME) 
   (MAY.NAME WITH.P KITTEN3.SK)
   ((MAY.NAME BE.V) ** E1.SK))


    ; Her mother gave the kitten to her.
    ((E4.SK BEFORE NOW1) 
     (MOTHER5.SK MOTHER.N)
     (MOTHER5.SK MOTHER-OF.N SHE.PRO) 
     (KITTEN6.SK KITTEN.N)
     ((MOTHER5.SK GIVE-TO.V SHE.PRO KITTEN6.SK) ** E4.SK))

    ; She is kind to the pretty kitten.
    ((E7.SK AT-ABOUT NOW2) 
     (KITTEN9.SK (PRETTY.A KITTEN.N)) 
     ((SHE.PRO ((ADV-A (TO.P KITTEN9.SK)) (BE.V KIND.A))) ** E7.SK))


    ; She likes to see it jump and play.
    ((E10.SK AT-ABOUT NOW3)
     ((SHE.PRO (LIKE.V (KA (L X ((X SEE.V IT.PRO JUMP.V) AND.CC 
                                 (X SEE.V IT.PRO PLAY.V)))))) ** E10.SK))


    ; See it run with May's ball!
    ((BALL11.SK BALL.N)
     (BALL11.SK PERTAIN-TO MAY.NAME)
     ((({YOU}.PRO SEE.V IT.PRO ((ADV-A (WITH.P BALL11.SK)) RUN.V)) ** E12.SK) !))



   ; It does not run far with it.
   ((NOT (SOME E4 (E4 AT-ABOUT NOW5)
                  ((IT.PRO (FAR.ADV (ADV-A (WITH.P IT.PRO)) RUN.V)) ** E4))))



   ; If May can get the ball she will not take it.
   ((E11.SK AT-ABOUT NOW6)
    (BALL13.SK BALL.N)
    (((IF.PS (MAY.NAME (CAN.MD (GET.V BALL13.SK))))
      (NOT (WILL.MD (SHE.PRO TAKE.V IT.PRO)))) ** E11.SK))




  ; She will give it to the kitten to play with.
  ((E13.SK AT-ABOUT NOW7)
   (KITTEN14.SK KITTEN.N)
   ((WILL.MD (SHE.PRO ((ADV-A (FOR.P (KA (PLAY-WITH.V IT.PRO))))
                       (GIVE-TO.V KITTEN14.SK IT.PRO)))) ** E13.SK))




)
