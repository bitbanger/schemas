
; ("The monkey can climb a tree." "He climbs the tree and gets a cocoanut." "He drops the cocoanut to the ground." "He comes down and eats it.")

(defparameter *MONKEY-PROC-1*
'(((TREE91.SK TREE.N) (MONKEY90.SK MONKEY.N) (E89.SK (AT-ABOUT NOW6))
  (E5 (ORIENTS E89.SK)) ((MONKEY90.SK ((CAN.MD CLIMB.V) TREE91.SK)) ** E89.SK))
 (((MONKEY90.SK (CLIMB.V TREE91.SK)) ** E97.SK)
  ((MONKEY90.SK (GET.V COCOANUT95.SK)) ** E96.SK) (E97.SK (CONSEC E96.SK))
  (COCOANUT95.SK COCOANUT.N) (E96.SK (AT-ABOUT NOW7)) (E7 (ORIENTS E96.SK))
  (TREE91.SK TREE.N) (E97.SK (AT-ABOUT NOW7)) (E6 (ORIENTS E97.SK)))
 ((GROUND102.SK GROUND.N) ((MONKEY90.SK (DROP.V COCOANUT95.SK)) ** E103.SK)
  (E8 (ORIENTS E103.SK)) (E103.SK (AT-ABOUT NOW8)) (COCOANUT95.SK COCOANUT.N)
  (COCOANUT95.SK (TO.P GROUND102.SK)))
 ((E106.SK (CONSEC E107.SK)) (E107.SK (DURING E104.SK))
  (E106.SK (DURING E104.SK)) (E108.SK (AT-ABOUT NOW9))
  (E104.SK (ORIENTS E108.SK)) (E104.SK (AT-ABOUT NOW9)) (E9 (ORIENTS E104.SK))
  ((MONKEY90.SK (DOWN.ADV COME.V)) ** E106.SK)
  ((MONKEY90.SK (EAT.V COCOANUT95.SK)) ** E107.SK)
  ((MONKEY90.SK (EAT.V COCOANUT95.SK)) ** E108.SK)))
)




; ("The monkey has a cocoanut." "He likes the cocoanut." "He will eat it." "The monkey is brown." "It has a large tail." "His eyes are large.")

(defparameter *MONKEY-PROC-2*
'(((COCOANUT69.SK COCOANUT.N) (E70.SK (AT-ABOUT NOW0)) (U66.SK (SAME-TIME NOW0))
  (MONKEY67.SK MONKEY.N) ((MONKEY67.SK (HAVE.V COCOANUT69.SK)) ** U66.SK)
  ((MONKEY67.SK (HAVE.V COCOANUT69.SK)) ** E70.SK))
 ((COCOANUT69.SK COCOANUT.N) (E73.SK (AT-ABOUT NOW1)) (E0 (ORIENTS E73.SK))
  ((MONKEY67.SK (LIKE.V COCOANUT69.SK)) ** E73.SK))
 (((MONKEY67.SK (WILL.MD (EAT.V COCOANUT69.SK))) ** E74.SK)
  (E1 (ORIENTS E74.SK)) (E74.SK (AT-ABOUT NOW2)))
 (((MONKEY67.SK BROWN.A) ** E75.SK) ((MONKEY67.SK BROWN.A) ** E87.SK)
  (E87.SK (AT-ABOUT NOW3)) (E2 (ORIENTS E87.SK)) (E75.SK (SAME-TIME NOW3))
  (E75.SK (RIGHT-AFTER U2)) (MONKEY67.SK MONKEY.N))
 ((TAIL82.SK TAIL.N) (TAIL82.SK LARGE.A) (E83.SK (AT-ABOUT NOW4))
  (E3 (ORIENTS E83.SK)) ((MONKEY67.SK (HAVE.V TAIL82.SK)) ** E83.SK))
 (((EYES85.SK LARGE.A) ** E84.SK) ((EYES85.SK LARGE.A) ** E88.SK)
  (E88.SK (AT-ABOUT NOW5)) (E4 (ORIENTS E88.SK)) (E84.SK (SAME-TIME NOW5))
  (E84.SK (RIGHT-AFTER U4)) (EYES85.SK (PLUR EYE.N))
  (EYES85.SK (PERTAIN-TO MONKEY67.SK))))

)
