(setf matches (list))
(setf chain-matches (list))
; story 0:
	; "Frank wanted to get buff."
	; "So he got some weights."
	; "He started to work out."
	; "He worked out for months ."
	; "Frank got buff."
discarding schema GET.1.V learned from this story
; best schemas are:
; RUN.401.V
; RECEIVING_VERB.?
; GET.143.V
; GET.1669.V
; GET.346.V
(setf matches (append matches '(( (5.0 3)
("Frank wanted to get buff." "So he got some weights."
 "He started to work out." "He worked out for months ." "Frank got buff.")
(EPI-SCHEMA ((FRANK.NAME ((ADV-A (TO.P ?X_A)) GET.3.V) WEIGHT14.SK
              (AT.P-ARG ?L))
             ** E15.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (WEIGHT14.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (FRANK.NAME = WEIGHT14.SK)))
		(!R5 (FRANK.NAME RAT.N))
		(!R6 (?X_A (ALL.ADV SAFE.A)))
		(!R7 (?X_A HOLE.N))
		(!R8 (E15.SK (RIGHT-AFTER ?X_B)))
		(!R9 (WEIGHT14.SK (PLUR WEIGHT.N)))
	)
	(:GOALS
		(E10.SK (FRANK.NAME (WANT.V (THAT (FRANK.NAME (HAVE.V WEIGHT14.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (FRANK.NAME HAVE.V WEIGHT14.SK)))
		(?I2 (FRANK.NAME (AT.P ?L)))
		(?I3 (WEIGHT14.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (FRANK.NAME HAVE.V WEIGHT14.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E15.SK))
		(!W2 (?I1 PRECOND-OF E15.SK))
		(!W3 (?I2 PRECOND-OF E15.SK))
		(!W4 (?I3 PRECOND-OF E15.SK))
		(!W5 (?P1 POSTCOND-OF E15.SK))
		(!W6 (E15.SK (SAME-TIME ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E10.SK (BEFORE NOW0)))
		(!W9 (E15.SK (BEFORE NOW1)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0 4)
("Frank wanted to get buff." "So he got some weights."
 "He started to work out." "He worked out for months ." "Frank got buff.")
(EPI-SCHEMA ((FRANK.NAME GET.5.V WEIGHT14.SK (AT.P-ARG ?L)) ** E15.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (WEIGHT14.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (FRANK.NAME = WEIGHT14.SK)))
		(!R5 (FRANK.NAME MONKEY.N))
		(!R6 (WEIGHT14.SK COCOANUT.N))
		(!R7 (?X_A GROUND.N))
		(!R8 (WEIGHT14.SK (TO.P ?X_A)))
		(!R9 (WEIGHT14.SK (PLUR WEIGHT.N)))
	)
	(:GOALS
		(E10.SK (FRANK.NAME (WANT.V (THAT (FRANK.NAME (HAVE.V WEIGHT14.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (FRANK.NAME HAVE.V WEIGHT14.SK)))
		(?I2 (FRANK.NAME (AT.P ?L)))
		(?I3 (WEIGHT14.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (FRANK.NAME HAVE.V WEIGHT14.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E15.SK))
		(!W2 (?I1 PRECOND-OF E15.SK))
		(!W3 (?I2 PRECOND-OF E15.SK))
		(!W4 (?I3 PRECOND-OF E15.SK))
		(!W5 (?P1 POSTCOND-OF E15.SK))
		(!W6 (?X_E (CONSEC E15.SK)))
		(!W7 (E15.SK (AT-ABOUT ?X_F)))
		(!W8 (?X_E (AT-ABOUT ?X_F)))
		(!W9 (E10.SK (BEFORE NOW0)))
		(!W10 (E15.SK (BEFORE NOW1)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 1:
	; "We had a read in one day at school."
	; "All we did the whole day was read."
	; "I took some books from home."
	; "I sat in a bean bag."
	; "It was the most relaxing day ever."
discarding schema TAKE.8.V learned from this story
; best schemas are:
; TAKE.946.V
; TAKE.135.V
; TAKE.413.V
; FIND.773.V
; TAKE.1270.V
(setf matches (append matches '(( (4.4231253 3)
("We had a read in one day at school." "All we did the whole day was read."
 "I took some books from home." "I sat in a bean bag."
 "It was the most relaxing day ever.")
(EPI-SCHEMA ((ME48.SK ((ADV-A (FROM.P (K HOME.N))) TAKE.9.V) BOOK35.SK
              (AT.P-ARG ?L))
             ** E38.SK)
	(:ROLES
		(!R1 (BOOK35.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME48.SK = BOOK35.SK)))
		(!R4 (BOOK35.SK (= (K (L #:G1507072 (AND (?X_A GOOD.A) (?X_B CARE.N)))))))
		(!R5 (WE47.SK MOTHER.N))
		(!R6 (WE47.SK (PERTAIN-TO ME48.SK)))
		(!R7 (BOOK35.SK (OF.P ?X_G)))
		(!R8 (?X_G (PLUR KITTEN.N)))
		(!R9 (?X_D (PERTAIN-TO ME48.SK)))
		(!R10 (?X_E (PERTAIN-TO ME48.SK)))
		(!R11 (?X_F HOME.N))
		(!R12 (?X_F (PERTAIN-TO ?X_G)))
		(!R13 (ME48.SK AGENT.N))
		(!R14 (BOOK35.SK (PLUR BOOK.N)))
		(!R15 (WE47.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME48.SK (WANT.V (THAT (ME48.SK (HAVE.V BOOK35.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME48.SK HAVE.V BOOK35.SK)))
		(?I2 (ME48.SK (AT.P ?L)))
		(?I3 (BOOK35.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME48.SK HAVE.V BOOK35.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E38.SK))
		(!W2 (?I1 PRECOND-OF E38.SK))
		(!W3 (?I2 PRECOND-OF E38.SK))
		(!W4 (?I3 PRECOND-OF E38.SK))
		(!W5 (?P1 POSTCOND-OF E38.SK))
		(!W6 (E38.SK (AFTER ?X_K)))
		(!W7 (?X_K (AT-ABOUT ?X_L)))
		(!W8 (E38.SK (BEFORE NOW7)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.1509376 4)
("We had a read in one day at school." "All we did the whole day was read."
 "I took some books from home." "I sat in a bean bag."
 "It was the most relaxing day ever.")
(EPI-SCHEMA ((ME48.SK ((ADV-A (FROM.P (K HOME.N))) TAKE.12.V) BOOK35.SK
              (AT.P-ARG ?X_C))
             ** E38.SK)
	(:ROLES
		(!R1 (BOOK35.SK INANIMATE_OBJECT.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (ME48.SK = BOOK35.SK)))
		(!R4 (ME48.SK MAN.N))
		(!R5 (WE47.SK (PERTAIN-TO BOOK35.SK)))
		(!R6 (WE47.SK BROTHER.N))
		(!R7 (DAY46.SK (= ME48.SK)))
		(!R8 (?X_C FARM.N))
		(!R9 (BOOK35.SK (PLUR BOOK.N)))
		(!R10 (ME48.SK AGENT.N))
		(!R11 (WE47.SK AGENT.N))
		(!R12 (DAY46.SK DAY.N))
		(!R13 (DAY46.SK (MOST.ADV RELAXING.A)))
	)
	(:GOALS
		(?G1 (ME48.SK (WANT.V (THAT (ME48.SK (HAVE.V BOOK35.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME48.SK HAVE.V BOOK35.SK)))
		(?I2 (ME48.SK (AT.P ?X_C)))
		(?I3 (BOOK35.SK (AT.P ?X_C)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME48.SK HAVE.V BOOK35.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E38.SK))
		(!W2 (?I1 PRECOND-OF E38.SK))
		(!W3 (?I2 PRECOND-OF E38.SK))
		(!W4 (?I3 PRECOND-OF E38.SK))
		(!W5 (?P1 POSTCOND-OF E38.SK))
		(!W6 (E38.SK (BEFORE ?X_G)))
		(!W7 (E38.SK (BEFORE NOW7)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.6509376 5)
("We had a read in one day at school." "All we did the whole day was read."
 "I took some books from home." "I sat in a bean bag."
 "It was the most relaxing day ever.")
(EPI-SCHEMA ((ME48.SK ((ADV-A (FROM.P (K HOME.N))) (HOME.ADV TAKE.15.V))
              BOOK35.SK (AT.P-ARG ?L))
             ** E38.SK)
	(:ROLES
		(!R1 (BOOK35.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME48.SK = BOOK35.SK)))
		(!R4 (ME48.SK (PLUR GIRL.N)))
		(!R5 (BOOK35.SK GIANT.A))
		(!R6 (BOOK35.SK FROG.N))
		(!R7 (WE47.SK (PERTAIN-TO ME48.SK)))
		(!R8 (WE47.SK (PLUR FRIEND.N)))
		(!R9 (BOOK35.SK (PLUR BOOK.N)))
		(!R10 (ME48.SK AGENT.N))
		(!R11 (WE47.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME48.SK (WANT.V (THAT (ME48.SK (HAVE.V BOOK35.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME48.SK HAVE.V BOOK35.SK)))
		(?I2 (ME48.SK (AT.P ?L)))
		(?I3 (BOOK35.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME48.SK HAVE.V BOOK35.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E38.SK))
		(!W2 (?I1 PRECOND-OF E38.SK))
		(!W3 (?I2 PRECOND-OF E38.SK))
		(!W4 (?I3 PRECOND-OF E38.SK))
		(!W5 (?P1 POSTCOND-OF E38.SK))
		(!W6 (E38.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E38.SK (BEFORE NOW7)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 2:
	; "I loved swimming at the beach."
	; "One day I saw a big shark."
	; "The shark suddenly attacked me."
	; "I lost my left hand."
	; "I never went back to the beach ever since."
; best schemas are:
; RUN.254.V
; TAKE.10.V
; TAKE.135.V
; TAKE.8.V
; FLY.235.V
; GIVE.194.V

; story 3:
	; "Shannon saw a bird in the tree in her backyard."
	; "It was making a nest!"
	; "It took the bird hours."
	; "Finally, she was done."
	; "She sat down in the nest to rest."
discarding schema SIT.41.V learned from this story
; best schemas are:
; TAKE.1391.V
; RUN.350.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
(setf matches (append matches '(( (1.53125 1)
("Shannon saw a bird in the tree in her backyard." "It was making a nest!"
 "It took the bird hours." "Finally, she was done."
 "She sat down in the nest to rest.")
(EPI-SCHEMA ((SHANNON.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.53.V
              (KA ((THERE.ADV SEE.V) BIRD84.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) BIRD84.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (SHANNON.NAME AGENT.N))
		(!R4 (BIRD84.SK BIRD.N))
		(!R5 (BACKYARD86.SK BACKYARD.N))
		(!R6 (BACKYARD86.SK (PERTAIN-TO SHANNON.NAME)))
		(!R7 (TREE85.SK TREE.N))
		(!R8 (BIRD84.SK (IN.P TREE85.SK)))
	)
	(:GOALS
		(?G1 (SHANNON.NAME (WANT.V (THAT (NOT (SHANNON.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (SHANNON.NAME (THERE.ADV SEE.V) BIRD84.SK)) CAUSE-OF
    (KE (SHANNON.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E87.SK
   (SHANNON.NAME ((ADV-A (IN.P BACKYARD86.SK)) (THERE.ADV (THERE.ADV SEE.V)))
    BIRD84.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E87.SK))
		(!W2 (E87.SK (BEFORE ?X_D)))
		(!W3 (E87.SK (BEFORE NOW15)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (0.03125 3)
("Shannon saw a bird in the tree in her backyard." "It was making a nest!"
 "It took the bird hours." "Finally, she was done."
 "She sat down in the nest to rest.")
(EPI-SCHEMA ((TREE85.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.61.V
              (KA (TAKE.V HOURS93.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA (TAKE.V HOURS93.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (TREE85.SK FEMALE.A))
		(!R4 (TREE85.SK AGENT.N))
		(!R5 (TREE85.SK TREE.N))
		(!R6 (HOURS93.SK ((NN BIRD.N) (PLUR HOUR.N))))
		(!R7 (BIRD84.SK BIRD.N))
		(!R8 (BIRD84.SK (IN.P TREE85.SK)))
	)
	(:GOALS
		(?G1 (TREE85.SK (WANT.V (THAT (NOT (TREE85.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (TREE85.SK TAKE.V HOURS93.SK)) CAUSE-OF
    (KE (TREE85.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E94.SK (TREE85.SK TAKE.V HOURS93.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E94.SK))
		(!W2 (E94.SK (AFTER ?X_D)))
		(!W3 (?X_D (AT-ABOUT ?X_E)))
		(!W4 (E94.SK (BEFORE NOW17)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 4:
	; "I went on a run at the park one day."
	; "It was early morning."
	; "I saw my friend's car."
	; "She was running with my other friend."
	; "They were shirtless."
; best schemas are:
; TAKE.10.V
; TAKE.135.V
; RUN.929.V
; TAKE.8.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; RUN.28.V
(setf matches (append matches '(( (3.0 2)
("I went on a run at the park one day." "It was early morning."
 "I saw my friend's car." "She was running with my other friend."
 "They were shirtless.")
(EPI-SCHEMA ((SHE.PRO
              ((ADV-A (WITH.P OBJECT117.SK))
               ((ADV-A (FROM.P ?X_C))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (THROUGH.P PARK109.SK)) RUN.109.V))))
              ?L2)
             ** E116.SK)
	(:ROLES
		(!R1 (?X_C LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?X_C = ?L2)))
		(!R4 (OBJECT117.SK (PERTAIN-TO SHE.PRO)))
		(!R5 (OBJECT117.SK DOG.N))
		(!R6 (?X_C END.N))
		(!R7 (SHE.PRO FEMALE.A))
		(!R8 (SHE.PRO AGENT.N))
		(!R9 (PARK109.SK PARK.N))
		(!R10 (OBJECT117.SK (PERTAIN-TO ME.PRO)))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SHE.PRO (AT.P ?X_C)))
		(?I2 (NOT (SHE.PRO (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SHE.PRO (AT.P ?X_C))))
		(?P2 (SHE.PRO (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E116.SK))
		(!W2 (?I2 BEFORE E116.SK))
		(!W3 (?P1 AFTER E116.SK))
		(!W4 (?P2 AFTER E116.SK))
		(!W5 (?G1 CAUSE-OF E116.SK))
		(!W6 (E116.SK (BEFORE ?X_F)))
		(!W7 (E116.SK (BEFORE NOW23)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.185855 1)
("I went on a run at the park one day." "It was early morning."
 "I saw my friend's car." "She was running with my other friend."
 "They were shirtless.")
(EPI-SCHEMA ((SHE.PRO
              ((ADV-A (WITH.P OBJECT117.SK))
               ((ADV-A (FROM.P PARK109.SK))
                ((ADV-A (TO.P ?L2)) ((ADV-A (AT.P ME119.SK)) RUN.112.V))))
              ?L2)
             ** E116.SK)
	(:ROLES
		(!R1 (PARK109.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (PARK109.SK = ?L2)))
		(!R4 (ME119.SK CAT.N))
		(!R5 (SHE.PRO HEN.N))
		(!R6 (SHE.PRO FEMALE.A))
		(!R7 (SHE.PRO AGENT.N))
		(!R8 (OBJECT117.SK (PERTAIN-TO ME.PRO)))
		(!R9 (PARK109.SK PARK.N))
		(!R10 (ME119.SK AGENT.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SHE.PRO (AT.P PARK109.SK)))
		(?I2 (NOT (SHE.PRO (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SHE.PRO (AT.P PARK109.SK))))
		(?P2 (SHE.PRO (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E116.SK))
		(!W2 (?I2 BEFORE E116.SK))
		(!W3 (?P1 AFTER E116.SK))
		(!W4 (?P2 AFTER E116.SK))
		(!W5 (?G1 CAUSE-OF E116.SK))
		(!W6 (E116.SK (AFTER ?X_D)))
		(!W7 (?X_D (AT-ABOUT ?X_E)))
		(!W8 (E116.SK (BEFORE NOW23)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 5:
	; "The wind was howling."
	; "A storm had just hit."
	; "Everyone ran inside to get out of it."
	; "The power went out."
	; "Everyone hunkered down to hide."
; best schemas are:
; GO.340.V
; GO.680.V
; GO.19.V
; GO.30.V
; GO.90.V
; GO.100.V

; story 6:
	; "The man put on a hat."
	; "It made his head itch."
	; "He looked at the label."
	; "The label said it was wool."
	; "The man decided he didn't like wool."
; best schemas are:
; GO.1083.V
; RUN.311.V
; RUN.401.V
; GO.423.V
; GO.1261.V
; GO.51.V

; story 7:
	; "Maeva got money for her birthday."
	; "She had a list of things to buy."
	; "She went out with her friends."
	; "They bought clothes."
	; "She went home."
discarding schema GET.73.V learned from this story
discarding schema GO.105.V learned from this story
; best schemas are:
; GET.104.V
; GET.460.V
; GET.660.V
; RUN.401.V
(setf matches (append matches '(( (5.0 6)
("Maeva got money for her birthday." "She had a list of things to buy."
 "She went out with her friends." "They bought clothes." "She went home.")
(EPI-SCHEMA ((MAEVA.NAME GET.177.V
              (KA ((ADV-A (WITH.P MAEVA.NAME)) (BE.PASV FED_UP.V)))
              (AT.P-ARG ?L))
             ** E166.SK)
	(:ROLES
		(!R1 (MAEVA.NAME AGENT.N))
		(!R2
   ((KA ((ADV-A (WITH.P MAEVA.NAME)) (BE.PASV FED_UP.V))) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4
   (NOT (MAEVA.NAME = (KA ((ADV-A (WITH.P MAEVA.NAME)) (BE.PASV FED_UP.V))))))
		(!R5 (MAEVA.NAME (PERTAIN-TO MAEVA.NAME)))
		(!R6 (MAEVA.NAME BANK.N))
		(!R7 (MAEVA.NAME MONEY.N))
		(!R8 (MAEVA.NAME (PERTAIN-TO ?X_A)))
		(!R9 (?X_A MALE.A))
		(!R10 (?X_A AGENT.N))
		(!R11 (LIST171.SK LIST.N))
		(!R12 (BIRTHDAY165.SK (PERTAIN-TO MAEVA.NAME)))
		(!R13 (BIRTHDAY165.SK BIRTHDAY.N))
		(!R14 (OBJECT172.SK (= (K (PLUR THING.N)))))
		(!R15 (LIST171.SK (OF.P OBJECT172.SK)))
		(!R16 (FRIEND185.SK (PERTAIN-TO MAEVA.NAME)))
		(!R17 (FRIEND185.SK (PLUR FRIEND.N)))
		(!R18 (OBJECT162.SK (= (K MONEY.N))))
		(!R19 (OBJECT162.SK (FOR.P BIRTHDAY165.SK)))
	)
	(:GOALS
		(?G1
   (MAEVA.NAME
    (WANT.V
     (THAT
      (MAEVA.NAME
       (HAVE.V (KA ((ADV-A (WITH.P MAEVA.NAME)) (BE.PASV FED_UP.V)))))))))
	)
	(:PRECONDS
		(?I1
   (NOT
    (MAEVA.NAME HAVE.V (KA ((ADV-A (WITH.P MAEVA.NAME)) (BE.PASV FED_UP.V))))))
		(?I2 (MAEVA.NAME (AT.P ?L)))
		(?I3 ((KA ((ADV-A (WITH.P MAEVA.NAME)) (BE.PASV FED_UP.V))) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E181.SK
   (MAEVA.NAME HAVE.V (KA ((ADV-A (WITH.P MAEVA.NAME)) (BE.PASV FED_UP.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E166.SK))
		(!W2 (?I1 PRECOND-OF E166.SK))
		(!W3 (?I2 PRECOND-OF E166.SK))
		(!W4 (?I3 PRECOND-OF E166.SK))
		(!W5 (E181.SK POSTCOND-OF E166.SK))
		(!W6 (E166.SK (BEFORE ?X_D)))
		(!W7 (E166.SK (BEFORE NOW35)))
		(!W8 (E181.SK (BEFORE NOW36)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.6411133 3)
("Maeva got money for her birthday." "She had a list of things to buy."
 "She went out with her friends." "They bought clothes." "She went home.")
(EPI-SCHEMA ((MAEVA.NAME ((ADV-A (FROM.P (K WORK.N))) GET.178.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E166.SK)
	(:ROLES
		(!R1 (MAEVA.NAME AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAEVA.NAME = (K HOME.N))))
		(!R5 (BIRTHDAY165.SK WIFE.N))
		(!R6 (LIST171.SK LIST.N))
		(!R7 (OBJECT172.SK (= (K (PLUR THING.N)))))
		(!R8 (LIST171.SK (OF.P OBJECT172.SK)))
		(!R9 (BIRTHDAY165.SK BIRTHDAY.N))
		(!R10 (BIRTHDAY165.SK (PERTAIN-TO MAEVA.NAME)))
		(!R11 (OBJECT162.SK (= (K MONEY.N))))
		(!R12 (OBJECT162.SK (FOR.P BIRTHDAY165.SK)))
		(!R13 (FRIEND185.SK (PERTAIN-TO MAEVA.NAME)))
		(!R14 (FRIEND185.SK (PLUR FRIEND.N)))
	)
	(:GOALS
		(?G1 (MAEVA.NAME (WANT.V (THAT (MAEVA.NAME (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAEVA.NAME HAVE.V (K HOME.N))))
		(?I2 (MAEVA.NAME (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E181.SK (MAEVA.NAME HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E166.SK))
		(!W2 (?I1 PRECOND-OF E166.SK))
		(!W3 (?I2 PRECOND-OF E166.SK))
		(!W4 (?I3 PRECOND-OF E166.SK))
		(!W5 (E181.SK POSTCOND-OF E166.SK))
		(!W6 (E166.SK (BEFORE ?X_D)))
		(!W7 (E166.SK (BEFORE NOW35)))
		(!W8 (E181.SK (BEFORE NOW36)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.6411133 4)
("Maeva got money for her birthday." "She had a list of things to buy."
 "She went out with her friends." "They bought clothes." "She went home.")
(EPI-SCHEMA ((MAEVA.NAME ((ADV-A (FROM.P (K WORK.N))) GET.179.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E166.SK)
	(:ROLES
		(!R1 (MAEVA.NAME AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAEVA.NAME = (K HOME.N))))
		(!R5 (MAEVA.NAME DAD.N))
		(!R6 (E166.SK (RIGHT-AFTER ?X_A)))
		(!R7 (MAEVA.NAME (PERTAIN-TO ?X_B)))
		(!R8 (BIRTHDAY165.SK CAR.N))
		(!R9 (LIST171.SK LIST.N))
		(!R10 (OBJECT172.SK (= (K (PLUR THING.N)))))
		(!R11 (LIST171.SK (OF.P OBJECT172.SK)))
		(!R12 (BIRTHDAY165.SK BIRTHDAY.N))
		(!R13 (BIRTHDAY165.SK (PERTAIN-TO MAEVA.NAME)))
		(!R14 (OBJECT162.SK (= (K MONEY.N))))
		(!R15 (OBJECT162.SK (FOR.P BIRTHDAY165.SK)))
		(!R16 (FRIEND185.SK (PERTAIN-TO MAEVA.NAME)))
		(!R17 (FRIEND185.SK (PLUR FRIEND.N)))
	)
	(:GOALS
		(?G1 (MAEVA.NAME (WANT.V (THAT (MAEVA.NAME (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAEVA.NAME HAVE.V (K HOME.N))))
		(?I2 (MAEVA.NAME (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E181.SK (MAEVA.NAME HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E166.SK))
		(!W2 (?I1 PRECOND-OF E166.SK))
		(!W3 (?I2 PRECOND-OF E166.SK))
		(!W4 (?I3 PRECOND-OF E166.SK))
		(!W5 (E181.SK POSTCOND-OF E166.SK))
		(!W6 (E166.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E166.SK (BEFORE NOW35)))
		(!W9 (E181.SK (BEFORE NOW36)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.5 6)
("Maeva got money for her birthday." "She had a list of things to buy."
 "She went out with her friends." "They bought clothes." "She went home.")
(EPI-SCHEMA ((MAEVA.NAME
              ((ADV-A (WITH.P FRIEND185.SK))
               (OUT.ADV
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?L2))
                  ((ADV-A (FOR.P (KA (GET.V (K HELP.N))))) RUN.180.V)))))
              ?L2)
             ** E186.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (MAEVA.NAME FRIEND.N))
		(!R5 (MAEVA.NAME (PERTAIN-TO MAEVA.NAME)))
		(!R6 (MAEVA.NAME FEMALE.A))
		(!R7 (MAEVA.NAME AGENT.N))
		(!R8 (E186.SK (RIGHT-AFTER ?X_A)))
		(!R9 (BIRTHDAY165.SK GIRL.N))
		(!R10 (BIRTHDAY165.SK HEAD.N))
		(!R11 (FRIEND185.SK HEAD.N))
		(!R12 (FRIEND185.SK (PERTAIN-TO MAEVA.NAME)))
		(!R13 (FRIEND185.SK (PLUR FRIEND.N)))
		(!R14 (BIRTHDAY165.SK (PERTAIN-TO MAEVA.NAME)))
		(!R15 (BIRTHDAY165.SK BIRTHDAY.N))
		(!R16 (OBJECT162.SK (= (K MONEY.N))))
		(!R17 (OBJECT162.SK (FOR.P BIRTHDAY165.SK)))
	)
	(:GOALS
		(?G1 (MAEVA.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAEVA.NAME (AT.P ?L1)))
		(?I2 (NOT (MAEVA.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAEVA.NAME (AT.P ?L1))))
		(?P2 (MAEVA.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E186.SK))
		(!W2 (?I2 BEFORE E186.SK))
		(!W3 (?P1 AFTER E186.SK))
		(!W4 (?P2 AFTER E186.SK))
		(!W5 (?G1 CAUSE-OF E186.SK))
		(!W6 (E186.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E186.SK (BEFORE NOW37)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 8:
	; "I went to this new pizza place yesterday."
	; "It was absolutely amazing."
	; "I could not stop eating."
	; "I wanted more."
	; "I knew I had to go back."
discarding schema GO.107.V learned from this story
; best schemas are:
; RUN.229.V
; FLY.235.V
; GO.591.V
; GO.658.V
; GO.1083.V
(setf matches (append matches '(( (4.227813 4)
("I went to this new pizza place yesterday." "It was absolutely amazing."
 "I could not stop eating." "I wanted more." "I knew I had to go back.")
(EPI-SCHEMA ((ME197.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P OBJECT191.SK))
                 ((ADV-A (AT.P OBJECT191.SK)) RUN.181.V))))
              OBJECT191.SK)
             ** E192.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (OBJECT191.SK LOCATION.N))
		(!R3 (NOT (?L1 = OBJECT191.SK)))
		(!R4 (OBJECT191.SK CAT.N))
		(!R5 (ME197.SK HEN.N))
		(!R6 (ME197.SK AGENT.N))
		(!R7 (OBJECT191.SK (ATTENDED-TO-BY*.A SPEAKER)))
	)
	(:GOALS
		(?G1 (ME197.SK (WANT.V (KA ((ADV-A (AT.P OBJECT191.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME197.SK (AT.P ?L1)))
		(?I2 (NOT (ME197.SK (AT.P OBJECT191.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME197.SK (AT.P ?L1))))
		(?P2 (ME197.SK (AT.P OBJECT191.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E192.SK))
		(!W2 (?I2 BEFORE E192.SK))
		(!W3 (?P1 AFTER E192.SK))
		(!W4 (?P2 AFTER E192.SK))
		(!W5 (?G1 CAUSE-OF E192.SK))
		(!W6 (E192.SK (BEFORE ?X_E)))
		(!W7 (E192.SK (BEFORE NOW40)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.1834373 3)
("I went to this new pizza place yesterday." "It was absolutely amazing."
 "I could not stop eating." "I wanted more." "I knew I had to go back.")
(EPI-SCHEMA ((ME197.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P OBJECT191.SK)) (AWAY.ADV FLY.182.V))))
              OBJECT191.SK)
             ** E192.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (OBJECT191.SK LOCATION.N))
		(!R3 (NOT (?L1 = OBJECT191.SK)))
		(!R4 (ME197.SK ((NN MOTHER.N) BIRD.N)))
		(!R5 (ME197.SK BIRD.N))
		(!R6 (ME197.SK ((NN BABY.N) BIRD.N)))
		(!R7 (ME197.SK AGENT.N))
		(!R8 (OBJECT191.SK (ATTENDED-TO-BY*.A SPEAKER)))
	)
	(:GOALS
		(?G1 (ME197.SK (WANT.V (KA ((ADV-A (AT.P OBJECT191.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME197.SK (AT.P ?L1)))
		(?I2 (NOT (ME197.SK (AT.P OBJECT191.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME197.SK (AT.P ?L1))))
		(?P2 (ME197.SK (AT.P OBJECT191.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E192.SK))
		(!W2 (?I2 BEFORE E192.SK))
		(!W3 (?P1 AFTER E192.SK))
		(!W4 (?P2 AFTER E192.SK))
		(!W5 (?G1 CAUSE-OF E192.SK))
		(!W6 (E192.SK (BEFORE ?X_C)))
		(!W7 (E192.SK (BEFORE NOW40)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.7278125 5)
("I went to this new pizza place yesterday." "It was absolutely amazing."
 "I could not stop eating." "I wanted more." "I knew I had to go back.")
(EPI-SCHEMA ((ME197.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P OBJECT191.SK)) ((ADV-A (FROM.P ?L1)) GO.183.V)))
              OBJECT191.SK)
             ** E192.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (OBJECT191.SK LOCATION.N))
		(!R3 (NOT (?L1 = OBJECT191.SK)))
		(!R4 (ME197.SK CAT.N))
		(!R5 (ME197.SK NEW.A))
		(!R6 (OBJECT191.SK ((NN PET.N) STORE.N)))
		(!R7 (?X_A CAT.N))
		(!R8 (?X_A NICE.A))
		(!R9 (?X_A (PERTAIN-TO ME197.SK)))
		(!R10 (ME197.SK AGENT.N))
		(!R11 (OBJECT191.SK (ATTENDED-TO-BY*.A SPEAKER)))
	)
	(:GOALS
		(?G1 (ME197.SK (WANT.V (KA ((ADV-A (AT.P OBJECT191.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME197.SK (AT.P ?L1)))
		(?I2 (NOT (ME197.SK (AT.P OBJECT191.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME197.SK (AT.P ?L1))))
		(?P2 (ME197.SK (AT.P OBJECT191.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E192.SK))
		(!W2 (?I2 BEFORE E192.SK))
		(!W3 (?P1 AFTER E192.SK))
		(!W4 (?P2 AFTER E192.SK))
		(!W5 (?G1 CAUSE-OF E192.SK))
		(!W6 (E192.SK (BEFORE ?X_E)))
		(!W7 (E192.SK (BEFORE NOW40)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.7278125 3)
("I went to this new pizza place yesterday." "It was absolutely amazing."
 "I could not stop eating." "I wanted more." "I knew I had to go back.")
(EPI-SCHEMA ((ME197.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P OBJECT191.SK))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_A)) PLAY.V))))
                  GO.184.V))))
              OBJECT191.SK)
             ** E192.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (OBJECT191.SK LOCATION.N))
		(!R3 (NOT (?L1 = OBJECT191.SK)))
		(!R4 (?X_A (PLUR FRIEND.N)))
		(!R5 (?X_A HOME.N))
		(!R6 (?X_A (PERTAIN-TO ME197.SK)))
		(!R7 (ME197.SK GIRL.N))
		(!R8 (?X_A (PERTAIN-TO ?X_B)))
		(!R9 (ME197.SK AGENT.N))
		(!R10 (OBJECT191.SK (ATTENDED-TO-BY*.A SPEAKER)))
	)
	(:GOALS
		(?G1 (ME197.SK (WANT.V (KA ((ADV-A (AT.P OBJECT191.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME197.SK (AT.P ?L1)))
		(?I2 (NOT (ME197.SK (AT.P OBJECT191.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME197.SK (AT.P ?L1))))
		(?P2 (ME197.SK (AT.P OBJECT191.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E192.SK))
		(!W2 (?I2 BEFORE E192.SK))
		(!W3 (?P1 AFTER E192.SK))
		(!W4 (?P2 AFTER E192.SK))
		(!W5 (?G1 CAUSE-OF E192.SK))
		(!W6 (E192.SK (BEFORE ?X_E)))
		(!W7 (E192.SK (BEFORE NOW40)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.7278125 3)
("I went to this new pizza place yesterday." "It was absolutely amazing."
 "I could not stop eating." "I wanted more." "I knew I had to go back.")
(EPI-SCHEMA ((ME197.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P OBJECT191.SK))
                 ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_A)) LOOK.V))))
                  GO.185.V))))
              OBJECT191.SK)
             ** E192.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (OBJECT191.SK LOCATION.N))
		(!R3 (NOT (?L1 = OBJECT191.SK)))
		(!R4 (?X_A (PLUR CLOTHE.N)))
		(!R5 (ME197.SK MAN.N))
		(!R6 (?X_B (PERTAIN-TO ME197.SK)))
		(!R7 (?X_B WIFE.N))
		(!R8 (ME197.SK AGENT.N))
		(!R9 (OBJECT191.SK (ATTENDED-TO-BY*.A SPEAKER)))
	)
	(:GOALS
		(?G1 (ME197.SK (WANT.V (KA ((ADV-A (AT.P OBJECT191.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME197.SK (AT.P ?L1)))
		(?I2 (NOT (ME197.SK (AT.P OBJECT191.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME197.SK (AT.P ?L1))))
		(?P2 (ME197.SK (AT.P OBJECT191.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E192.SK))
		(!W2 (?I2 BEFORE E192.SK))
		(!W3 (?P1 AFTER E192.SK))
		(!W4 (?P2 AFTER E192.SK))
		(!W5 (?G1 CAUSE-OF E192.SK))
		(!W6 (E192.SK (BEFORE ?X_E)))
		(!W7 (E192.SK (BEFORE NOW40)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 9:
	; "Ellen moved to a new city."
	; "She didn't know where anything was."
	; "It was hard."
	; "Living in her hometown was easier."
	; "Ellen moved back home."
discarding schema MOVE.109.V learned from this story
; best schemas are:
; MOVE.342.V
; MOVE.501.V
; GO.843.V
; GET.826.V
; TAKE.958.V
(setf matches (append matches '(( (4.6953125 2)
("Ellen moved to a new city." "She didn't know where anything was."
 "It was hard." "Living in her hometown was easier." "Ellen moved back home.")
(EPI-SCHEMA ((ELLEN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P CITY203.SK)) MOVE.186.V))
              CITY203.SK)
             ** E204.SK)
	(:ROLES
		(!R1 (ELLEN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (CITY203.SK LOCATION.N))
		(!R4 (NOT (?L1 = CITY203.SK)))
		(!R5 (CITY203.SK CITY.N))
		(!R6 (CITY203.SK NEW.A))
		(!R7 (HOMETOWN211.SK HOMETOWN.N))
		(!R8 (HOMETOWN211.SK (PERTAIN-TO ELLEN.NAME)))
	)
	(:GOALS
		(?G1 (ELLEN.NAME (WANT.V (KA ((ADV-A (AT.P CITY203.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ELLEN.NAME (AT.P ?L1)))
		(?I2 (NOT (ELLEN.NAME (AT.P CITY203.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ELLEN.NAME (AT.P ?L1))))
		(?P2 (ELLEN.NAME (AT.P CITY203.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E204.SK))
		(!W2 (?I2 BEFORE E204.SK))
		(!W3 (?P1 AFTER E204.SK))
		(!W4 (?P2 AFTER E204.SK))
		(!W5 (?G1 CAUSE-OF E204.SK))
		(!W6 (E204.SK (BEFORE ?X_D)))
		(!W7 (E204.SK (BEFORE NOW45)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.1953125 3)
("Ellen moved to a new city." "She didn't know where anything was."
 "It was hard." "Living in her hometown was easier." "Ellen moved back home.")
(EPI-SCHEMA ((ELLEN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P CITY203.SK)) MOVE.187.V))
              CITY203.SK)
             ** E204.SK)
	(:ROLES
		(!R1 (ELLEN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (CITY203.SK LOCATION.N))
		(!R4 (NOT (?L1 = CITY203.SK)))
		(!R5 (CITY203.SK TOWN.N))
		(!R6 (CITY203.SK CITY.N))
		(!R7 (CITY203.SK MUNICIPALITY.N))
		(!R8 (CITY203.SK NEW.A))
		(!R9 (HOMETOWN211.SK HOMETOWN.N))
		(!R10 (HOMETOWN211.SK (PERTAIN-TO ELLEN.NAME)))
	)
	(:GOALS
		(?G1 (ELLEN.NAME (WANT.V (KA ((ADV-A (AT.P CITY203.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ELLEN.NAME (AT.P ?L1)))
		(?I2 (NOT (ELLEN.NAME (AT.P CITY203.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ELLEN.NAME (AT.P ?L1))))
		(?P2 (ELLEN.NAME (AT.P CITY203.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E204.SK))
		(!W2 (?I2 BEFORE E204.SK))
		(!W3 (?P1 AFTER E204.SK))
		(!W4 (?P2 AFTER E204.SK))
		(!W5 (?G1 CAUSE-OF E204.SK))
		(!W6 (E204.SK (BEFORE ?X_D)))
		(!W7 (E204.SK (BEFORE NOW45)))
	)
	(:CERTAINTIES
		(!C1 (!R7 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.6411133 5)
("Ellen moved to a new city." "She didn't know where anything was."
 "It was hard." "Living in her hometown was easier." "Ellen moved back home.")
(EPI-SCHEMA ((ELLEN.NAME ((ADV-A (TO.P CITY203.SK)) TAKE.200.V) CITY203.SK
              (AT.P-ARG ?L))
             ** E204.SK)
	(:ROLES
		(!R1 (ELLEN.NAME AGENT.N))
		(!R2 (CITY203.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (ELLEN.NAME = CITY203.SK)))
		(!R5 (CITY203.SK ((NN CAR.N) COLOR.N)))
		(!R6 (ELLEN.NAME MAN.N))
		(!R7 (CITY203.SK SHOP.N))
		(!R8 (HOMETOWN211.SK HOMETOWN.N))
		(!R9 (HOMETOWN211.SK (PERTAIN-TO ELLEN.NAME)))
		(!R10 (CITY203.SK CITY.N))
		(!R11 (CITY203.SK NEW.A))
	)
	(:GOALS
		(?G1 (ELLEN.NAME (WANT.V (THAT (ELLEN.NAME (HAVE.V CITY203.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ELLEN.NAME HAVE.V CITY203.SK)))
		(?I2 (ELLEN.NAME (AT.P ?L)))
		(?I3 (CITY203.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ELLEN.NAME HAVE.V CITY203.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E204.SK))
		(!W2 (?I1 PRECOND-OF E204.SK))
		(!W3 (?I2 PRECOND-OF E204.SK))
		(!W4 (?I3 PRECOND-OF E204.SK))
		(!W5 (?P1 POSTCOND-OF E204.SK))
		(!W6 (?G1 (BEFORE ?X_E)))
		(!W7 (E204.SK (BEFORE ?X_G)))
		(!W8 (E204.SK (BEFORE NOW45)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 10:
	; "Allie wanted an iPad."
	; "She really liked it."
	; "But she wanted a new one."
	; "So she went to the store."
	; "When she got back she had a newer one."
; best schemas are:
; GO.591.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
; GO.90.V
; GO.806.V
; GO.1220.V
; GO.387.V
(setf matches (append matches '(( (5.0 5)
("Allie wanted an iPad." "She really liked it." "But she wanted a new one."
 "So she went to the store." "When she got back she had a newer one.")
(EPI-SCHEMA ((ALLIE.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE231.SK)) GO.201.V))
              STORE231.SK)
             ** E232.SK)
	(:ROLES
		(!R1 (ALLIE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE231.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE231.SK)))
		(!R5 (ALLIE.NAME CAT.N))
		(!R6 (ALLIE.NAME NEW.A))
		(!R7 (STORE231.SK ((NN PET.N) STORE.N)))
		(!R8 (?X_A CAT.N))
		(!R9 (?X_A NICE.A))
		(!R10 (?X_A (PERTAIN-TO ALLIE.NAME)))
		(!R11 (ALLIE.NAME IPAD.N))
		(!R12 (STORE231.SK STORE.N))
	)
	(:GOALS
		(E219.SK (ALLIE.NAME (WANT.V (KA ((ADV-A (AT.P STORE231.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ALLIE.NAME (AT.P ?L1)))
		(?I2 (NOT (ALLIE.NAME (AT.P STORE231.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ALLIE.NAME (AT.P ?L1))))
		(?P2 (ALLIE.NAME (AT.P STORE231.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E232.SK))
		(!W2 (?I2 BEFORE E232.SK))
		(!W3 (?P1 AFTER E232.SK))
		(!W4 (?P2 AFTER E232.SK))
		(!W5 (E219.SK CAUSE-OF E232.SK))
		(!W6 (E232.SK (BEFORE ?X_E)))
		(!W7 (E219.SK (BEFORE NOW50)))
		(!W8 (E232.SK (BEFORE NOW53)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.03125 6)
("Allie wanted an iPad." "She really liked it." "But she wanted a new one."
 "So she went to the store." "When she got back she had a newer one.")
(EPI-SCHEMA ((ALLIE.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.202.V
              (KA (LIKE.V IT239.SK)))
             ** ?E)
	(:ROLES
		(!R1 (ALLIE.NAME AGENT.N))
		(!R2 ((KA (LIKE.V IT239.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (NEW228.SK ((NN HAIR.N) CUT.N)))
		(!R5 (IT239.SK ((NN HAIR.N) STYLIST.N)))
		(!R6 (IT239.SK HAIR.N))
		(!R7 (IT239.SK (PERTAIN-TO ALLIE.NAME)))
		(!R8 (ALLIE.NAME IPAD.N))
		(!R9 (NEW228.SK NEW.A))
	)
	(:GOALS
		(E219.SK (ALLIE.NAME (WANT.V (THAT (NOT (ALLIE.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ALLIE.NAME LIKE.V IT239.SK)) CAUSE-OF
    (KE (ALLIE.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E221.SK (ALLIE.NAME LIKE.V IT239.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E219.SK CAUSE-OF E221.SK))
		(!W2 (E219.SK (BEFORE ?X_E)))
		(!W3 (E221.SK (BEFORE ?X_G)))
		(!W4 (E219.SK (BEFORE NOW50)))
		(!W5 (E221.SK (BEFORE NOW51)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.03125 6)
("Allie wanted an iPad." "She really liked it." "But she wanted a new one."
 "So she went to the store." "When she got back she had a newer one.")
(EPI-SCHEMA ((ALLIE.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.203.V
              (KA (LIKE.V IT239.SK)))
             ** ?E)
	(:ROLES
		(!R1 (ALLIE.NAME AGENT.N))
		(!R2 ((KA (LIKE.V IT239.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (NEW228.SK ((NN HAIR.N) CUT.N)))
		(!R5 (IT239.SK ((NN HAIR.N) STYLIST.N)))
		(!R6 (IT239.SK HAIR.N))
		(!R7 (IT239.SK (PERTAIN-TO ALLIE.NAME)))
		(!R8 (ALLIE.NAME IPAD.N))
		(!R9 (NEW228.SK NEW.A))
	)
	(:GOALS
		(E229.SK (ALLIE.NAME (WANT.V (THAT (NOT (ALLIE.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ALLIE.NAME LIKE.V IT239.SK)) CAUSE-OF
    (KE (ALLIE.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E221.SK (ALLIE.NAME LIKE.V IT239.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E229.SK CAUSE-OF E221.SK))
		(!W2 (E229.SK (BEFORE ?X_E)))
		(!W3 (E221.SK (BEFORE ?X_G)))
		(!W4 (E221.SK (BEFORE NOW51)))
		(!W5 (E229.SK (BEFORE NOW52)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0 3)
("Allie wanted an iPad." "She really liked it." "But she wanted a new one."
 "So she went to the store." "When she got back she had a newer one.")
(EPI-SCHEMA ((ALLIE.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE231.SK)) ((ADV-A (FROM.P ?L1)) GO.207.V)))
              STORE231.SK)
             ** E232.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE231.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE231.SK)))
		(!R4 (ALLIE.NAME AGENT.N))
		(!R5 (ALLIE.NAME IPAD.N))
		(!R6 (STORE231.SK STORE.N))
	)
	(:GOALS
		(E219.SK (ALLIE.NAME (WANT.V (KA ((ADV-A (AT.P STORE231.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ALLIE.NAME (AT.P ?L1)))
		(?I2 (NOT (ALLIE.NAME (AT.P STORE231.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ALLIE.NAME (AT.P ?L1))))
		(?P2 (ALLIE.NAME (AT.P STORE231.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E232.SK))
		(!W2 (?I2 BEFORE E232.SK))
		(!W3 (?P1 AFTER E232.SK))
		(!W4 (?P2 AFTER E232.SK))
		(!W5 (E219.SK CAUSE-OF E232.SK))
		(!W6 (E232.SK (BEFORE ?X_D)))
		(!W7 (E219.SK (BEFORE NOW50)))
		(!W8 (E232.SK (BEFORE NOW53)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0 3)
("Allie wanted an iPad." "She really liked it." "But she wanted a new one."
 "So she went to the store." "When she got back she had a newer one.")
(EPI-SCHEMA ((ALLIE.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE231.SK)) GO.209.V))
              STORE231.SK)
             ** E232.SK)
	(:ROLES
		(!R1 (ALLIE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE231.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE231.SK)))
		(!R5 (ALLIE.NAME IPAD.N))
		(!R6 (STORE231.SK STORE.N))
	)
	(:GOALS
		(E219.SK (ALLIE.NAME (WANT.V (KA ((ADV-A (AT.P STORE231.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ALLIE.NAME (AT.P ?L1)))
		(?I2 (NOT (ALLIE.NAME (AT.P STORE231.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ALLIE.NAME (AT.P ?L1))))
		(?P2 (ALLIE.NAME (AT.P STORE231.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E232.SK))
		(!W2 (?I2 BEFORE E232.SK))
		(!W3 (?P1 AFTER E232.SK))
		(!W4 (?P2 AFTER E232.SK))
		(!W5 (E219.SK CAUSE-OF E232.SK))
		(!W6 (E232.SK (BEFORE ?X_D)))
		(!W7 (E219.SK (BEFORE NOW50)))
		(!W8 (E232.SK (BEFORE NOW53)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0 7)
("Allie wanted an iPad." "She really liked it." "But she wanted a new one."
 "So she went to the store." "When she got back she had a newer one.")
(EPI-SCHEMA ((ALLIE.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE231.SK)) GO.210.V))
              STORE231.SK)
             ** E232.SK)
	(:ROLES
		(!R1 (ALLIE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE231.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE231.SK)))
		(!R5 (NEW228.SK ((NN HAIR.N) CUT.N)))
		(!R6 (STORE231.SK ((NN HAIR.N) STYLIST.N)))
		(!R7 (STORE231.SK HAIR.N))
		(!R8 (STORE231.SK (PERTAIN-TO ALLIE.NAME)))
		(!R9 (ALLIE.NAME IPAD.N))
		(!R10 (STORE231.SK STORE.N))
		(!R11 (NEW228.SK NEW.A))
	)
	(:GOALS
		(E219.SK (ALLIE.NAME (WANT.V (KA ((ADV-A (AT.P STORE231.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ALLIE.NAME (AT.P ?L1)))
		(?I2 (NOT (ALLIE.NAME (AT.P STORE231.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ALLIE.NAME (AT.P ?L1))))
		(?P2 (ALLIE.NAME (AT.P STORE231.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E232.SK))
		(!W2 (?I2 BEFORE E232.SK))
		(!W3 (?P1 AFTER E232.SK))
		(!W4 (?P2 AFTER E232.SK))
		(!W5 (E219.SK CAUSE-OF E232.SK))
		(!W6 (E232.SK (BEFORE ?X_E)))
		(!W7 (E219.SK (BEFORE ?X_G)))
		(!W8 (E219.SK (BEFORE NOW50)))
		(!W9 (E232.SK (BEFORE NOW53)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 11:
	; "A little boy sat under the apple tree."
	; "He saw an apple fall."
	; "He wondered why it did that."
	; "His interest soared."
	; "He studied it for years."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; CLIMB_GET_EAT.349.PR
; GO.423.V
; GO.100.V
; GO.742.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
(setf matches (append matches '(( (1.03125 2)
("A little boy sat under the apple tree." "He saw an apple fall."
 "He wondered why it did that." "His interest soared."
 "He studied it for years.")
(EPI-SCHEMA ((BOY240.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.211.V
              (KA ((THERE.ADV SEE.V) FALL249.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) FALL249.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (BOY240.SK AGENT.N))
		(!R4 (BOY240.SK BOY.N))
		(!R5 (BOY240.SK LITTLE.A))
		(!R6 (FALL249.SK ((NN APPLE.N) FALL.N)))
		(!R7 (INTEREST253.SK (PERTAIN-TO BOY240.SK)))
		(!R8 (INTEREST253.SK INTEREST.N))
	)
	(:GOALS
		(?G1 (BOY240.SK (WANT.V (THAT (NOT (BOY240.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (BOY240.SK (THERE.ADV SEE.V) FALL249.SK)) CAUSE-OF
    (KE (BOY240.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E250.SK (BOY240.SK (THERE.ADV (THERE.ADV SEE.V)) FALL249.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E250.SK))
		(!W2 (E250.SK (BEFORE ?X_D)))
		(!W3 (E250.SK (BEFORE NOW56)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 12:
	; "Dad let me plant a flower."
	; "It grew very quickly."
	; "I made sure to water it every day."
	; "Now there is a bunch of them."
	; "He says I have a green thumb."
; best schemas are:
; FLY.235.V
; GO.1083.V
; GO.123.V
; RUN.28.V
; RUN.229.V
; RUN.254.V

; story 13:
	; "It was a very long day."
	; "It was also very hot outside."
	; "Fred was about to walk out the door."
	; "Then he remembered the sunscreen."
	; "He had to go back outside."
; best schemas are:
; TAKE.10.V
; TAKE.135.V
; GET.333.V
; PLAY.669.V
; PLAY.670.V
; GO.671.V

; story 14:
	; "A little baby was sleeping."
	; "Her siblings tried to wake her up."
	; "She didn't wake up."
	; "She slept all day."
	; "She stayed up all night."
; best schemas are:
; GO.642.V
; SIT.211.V
; FLY.235.V
; GO.1338.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V

; story 15:
	; "A New Mexican restaurant opened up."
	; "It looked good."
	; "Nance wanted to go."
	; "When she went she loved it."
	; "She was happy it was good."
; best schemas are:
; FLY.235.V
; GO.591.V
; GO.658.V
; GO.1083.V
; GO.123.V
; GIVE.194.V

; story 16:
	; "The cat meowed at the door."
	; "The owner let the cat out."
	; "The cat played in a field."
	; "He came back with a mouse."
	; "The cat gave the mouse to the owner."
discarding schema GIVE.194.V learned from this story
discarding schema COME.196.V learned from this story
discarding schema PLAY.195.V learned from this story
; best schemas are:
; GO.253.V
; COME.917.V
; COME.917.V
(setf matches (append matches '(( (4.4524517 3)
("The cat meowed at the door." "The owner let the cat out."
 "The cat played in a field." "He came back with a mouse."
 "The cat gave the mouse to the owner.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (WITH.P MOUSE329.SK))
               (BACK.ADV
                ((ADV-A (FROM.P FIELD326.SK))
                 ((ADV-A (TO.P ?L2)) (OUTSIDE.ADV COME.318.V)))))
              ?L2)
             ** E330.SK)
	(:ROLES
		(!R1 (FIELD326.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (FIELD326.SK = ?L2)))
		(!R4 (DOOR315.SK HOUSE.N))
		(!R5 (DOOR315.SK (PERTAIN-TO HE.PRO)))
		(!R6 (DOOR315.SK (= ?X_A)))
		(!R7 (?X_A DAY.N))
		(!R8 (?X_A (VERY.ADV LONG.A)))
		(!R9 (HE.PRO MALE.A))
		(!R10 (HE.PRO AGENT.N))
		(!R11 (MOUSE329.SK MOUSE.N))
		(!R12 (DOOR315.SK DOOR.N))
		(!R13 (DOOR315.SK STRUCTURE.N))
		(!R14 (FIELD326.SK FIELD.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P FIELD326.SK)))
		(?I2 (NOT (HE.PRO (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P FIELD326.SK))))
		(?P2 (HE.PRO (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E330.SK))
		(!W2 (?I2 BEFORE E330.SK))
		(!W3 (?P1 AFTER E330.SK))
		(!W4 (?P2 AFTER E330.SK))
		(!W5 (?G1 CAUSE-OF E330.SK))
		(!W6 (E330.SK (BEFORE ?X_E)))
		(!W7 (E330.SK (BEFORE NOW83)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.2302294 1)
("The cat meowed at the door." "The owner let the cat out."
 "The cat played in a field." "He came back with a mouse."
 "The cat gave the mouse to the owner.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (WITH.P MOUSE329.SK))
               (BACK.ADV
                ((ADV-A (FROM.P FIELD326.SK))
                 ((ADV-A (TO.P ?L2))
                  ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N))))))
                   COME.319.V)))))
              ?L2)
             ** E330.SK)
	(:ROLES
		(!R1 (FIELD326.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (FIELD326.SK = ?L2)))
		(!R4 (E330.SK (IMPINGES-ON ?X_A)))
		(!R5 (HE.PRO MALE.A))
		(!R6 (HE.PRO AGENT.N))
		(!R7 (MOUSE329.SK MOUSE.N))
		(!R8 (FIELD326.SK FIELD.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P FIELD326.SK)))
		(?I2 (NOT (HE.PRO (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P FIELD326.SK))))
		(?P2 (HE.PRO (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E330.SK))
		(!W2 (?I2 BEFORE E330.SK))
		(!W3 (?P1 AFTER E330.SK))
		(!W4 (?P2 AFTER E330.SK))
		(!W5 (?G1 CAUSE-OF E330.SK))
		(!W6 (?X_E (AT-ABOUT ?X_F)))
		(!W7 (E330.SK (BEFORE NOW83)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.2302294 1)
("The cat meowed at the door." "The owner let the cat out."
 "The cat played in a field." "He came back with a mouse."
 "The cat gave the mouse to the owner.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (WITH.P MOUSE329.SK))
               (BACK.ADV
                ((ADV-A (FROM.P FIELD326.SK))
                 ((ADV-A (TO.P ?L2))
                  ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N))))))
                   COME.319.V)))))
              ?L2)
             ** E330.SK)
	(:ROLES
		(!R1 (FIELD326.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (FIELD326.SK = ?L2)))
		(!R4 (E330.SK (IMPINGES-ON ?X_A)))
		(!R5 (HE.PRO MALE.A))
		(!R6 (HE.PRO AGENT.N))
		(!R7 (MOUSE329.SK MOUSE.N))
		(!R8 (FIELD326.SK FIELD.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P FIELD326.SK)))
		(?I2 (NOT (HE.PRO (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P FIELD326.SK))))
		(?P2 (HE.PRO (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E330.SK))
		(!W2 (?I2 BEFORE E330.SK))
		(!W3 (?P1 AFTER E330.SK))
		(!W4 (?P2 AFTER E330.SK))
		(!W5 (?G1 CAUSE-OF E330.SK))
		(!W6 (?X_E (AT-ABOUT ?X_F)))
		(!W7 (E330.SK (BEFORE NOW83)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 17:
	; "I was having a bad day."
	; "My hair was a mess."
	; "Then I went to cvs."
	; "When I was there I got hair stuff."
	; "Then I used it and it was great."
discarding schema GO.212.V learned from this story
; best schemas are:
; FLY.235.V
; GIVE.194.V
; TAKE.10.V
; TAKE.135.V
; GO.387.V
(setf matches (append matches '(( (4.1834373 3)
("I was having a bad day." "My hair was a mess." "Then I went to cvs."
 "When I was there I got hair stuff." "Then I used it and it was great.")
(EPI-SCHEMA ((ME350.SK
              (AWAY.ADV
               ((ADV-A (TO.P (K (PLUR CV.N))))
                ((ADV-A (FROM.P ?L1)) FLY.320.V)))
              (K (PLUR CV.N)))
             ** E344.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K (PLUR CV.N)) LOCATION.N))
		(!R3 (NOT (?L1 = (K (PLUR CV.N)))))
		(!R4 (ME350.SK ((NN MOTHER.N) BIRD.N)))
		(!R5 (ME350.SK BIRD.N))
		(!R6 (ME350.SK ((NN BABY.N) BIRD.N)))
		(!R7 (ME350.SK AGENT.N))
		(!R8 (HAIR340.SK HAIR.N))
		(!R9 (HAIR340.SK (PERTAIN-TO ME350.SK)))
	)
	(:GOALS
		(?G1 (ME350.SK (WANT.V (KA ((ADV-A (AT.P (K (PLUR CV.N)))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME350.SK (AT.P ?L1)))
		(?I2 (NOT (ME350.SK (AT.P (K (PLUR CV.N))))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME350.SK (AT.P ?L1))))
		(?P2 (ME350.SK (AT.P (K (PLUR CV.N)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E344.SK))
		(!W2 (?I2 BEFORE E344.SK))
		(!W3 (?P1 AFTER E344.SK))
		(!W4 (?P2 AFTER E344.SK))
		(!W5 (?G1 CAUSE-OF E344.SK))
		(!W6 (E344.SK (BEFORE ?X_C)))
		(!W7 (E344.SK (BEFORE NOW87)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.5 6)
("I was having a bad day." "My hair was a mess." "Then I went to cvs."
 "When I was there I got hair stuff." "Then I used it and it was great.")
(EPI-SCHEMA ((ME350.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K (PLUR CV.N)))) GO.324.V))
              (K (PLUR CV.N)))
             ** E344.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K (PLUR CV.N)) LOCATION.N))
		(!R3 (NOT (?L1 = (K (PLUR CV.N)))))
		(!R4 (?X_A ((NN HAIR.N) CUT.N)))
		(!R5 (?X_A NEW.A))
		(!R6 ((K (PLUR CV.N)) ((NN HAIR.N) STYLIST.N)))
		(!R7 ((K (PLUR CV.N)) HAIR.N))
		(!R8 ((K (PLUR CV.N)) (PERTAIN-TO ME350.SK)))
		(!R9 (ME350.SK AGENT.N))
		(!R10 (HAIR340.SK HAIR.N))
		(!R11 (HAIR340.SK (PERTAIN-TO ME350.SK)))
	)
	(:GOALS
		(?G1 (ME350.SK (WANT.V (KA ((ADV-A (AT.P (K (PLUR CV.N)))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME350.SK (AT.P ?L1)))
		(?I2 (NOT (ME350.SK (AT.P (K (PLUR CV.N))))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME350.SK (AT.P ?L1))))
		(?P2 (ME350.SK (AT.P (K (PLUR CV.N)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E344.SK))
		(!W2 (?I2 BEFORE E344.SK))
		(!W3 (?P1 AFTER E344.SK))
		(!W4 (?P2 AFTER E344.SK))
		(!W5 (?G1 CAUSE-OF E344.SK))
		(!W6 (E344.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E344.SK (BEFORE NOW87)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 18:
	; "Jay went into the woods by himself."
	; "He suddenly got lost."
	; "He did not know where to go."
	; "He was wandering for an hour."
	; "He finally went out."
discarding schema GO.220.V learned from this story
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.539.V
; GO.340.V
; GO.680.V
; GO.19.V
(setf matches (append matches '(( (2.5 0)
("Jay went into the woods by himself." "He suddenly got lost."
 "He did not know where to go." "He was wandering for an hour."
 "He finally went out.")
(EPI-SCHEMA ((JAY.NAME
              ((ADV-A (INTO.P WOOD367.SK))
               ((ADV-A (BY.P JAY.NAME))
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?L2))
                  ((ADV-A
                    (FOR.P (KA ((ADV-A (WITH.P (SET-OF ?X_A ?X_F))) PLAY.V))))
                   GO.325.V)))))
              ?L2)
             ** E368.SK)
	(:ROLES
		(!R1 (JAY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A LAP.N))
		(!R6 (?X_A (PERTAIN-TO ?X_A)))
		(!R7 (?X_B (IMPINGES-ON E368.SK)))
		(!R8 (?X_C (PERTAIN-TO JAY.NAME)))
		(!R9 (?X_D DOLL.N))
		(!R10 (?X_D (PERTAIN-TO JAY.NAME)))
		(!R11 (?X_E SPADE.N))
		(!R12 (?X_E (PERTAIN-TO ?X_F)))
		(!R13 (?X_G (IMPINGES-ON ?X_J)))
		(!R14 (WOOD367.SK (PLUR WOOD.N)))
	)
	(:GOALS
		(?G1 (JAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JAY.NAME (AT.P ?L1)))
		(?I2 (NOT (JAY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JAY.NAME (AT.P ?L1))))
		(?P2 (JAY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E368.SK))
		(!W2 (?I2 BEFORE E368.SK))
		(!W3 (?P1 AFTER E368.SK))
		(!W4 (?P2 AFTER E368.SK))
		(!W5 (?G1 CAUSE-OF E368.SK))
		(!W6 (E368.SK (AT-ABOUT ?X_K)))
		(!W7 (?X_J (AT-ABOUT ?X_K)))
		(!W8 (E368.SK (BEFORE NOW90)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("Jay went into the woods by himself." "He suddenly got lost."
 "He did not know where to go." "He was wandering for an hour."
 "He finally went out.")
(EPI-SCHEMA ((JAY.NAME
              ((ADV-A (INTO.P WOOD367.SK))
               ((ADV-A (BY.P JAY.NAME))
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?X_D)) ((ADV-A (WITH.P ?X_A)) GO.326.V)))))
              ?X_D)
             ** E368.SK)
	(:ROLES
		(!R1 (JAY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_D LOCATION.N))
		(!R4 (NOT (?L1 = ?X_D)))
		(!R5 (?X_A (PERTAIN-TO JAY.NAME)))
		(!R6 (?X_A KITE.N))
		(!R7 (?X_D FIELD.N))
		(!R8 (E368.SK (IMPINGES-ON ?X_F)))
		(!R9 (?X_B (PERTAIN-TO JAY.NAME)))
		(!R10 (?X_B KITE.N))
		(!R11 (WOOD367.SK (PLUR WOOD.N)))
	)
	(:GOALS
		(?G1 (JAY.NAME (WANT.V (KA ((ADV-A (AT.P ?X_D)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JAY.NAME (AT.P ?L1)))
		(?I2 (NOT (JAY.NAME (AT.P ?X_D))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JAY.NAME (AT.P ?L1))))
		(?P2 (JAY.NAME (AT.P ?X_D)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E368.SK))
		(!W2 (?I2 BEFORE E368.SK))
		(!W3 (?P1 AFTER E368.SK))
		(!W4 (?P2 AFTER E368.SK))
		(!W5 (?G1 CAUSE-OF E368.SK))
		(!W6 (?X_F (AT-ABOUT ?X_G)))
		(!W7 (E368.SK (BEFORE NOW90)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("Jay went into the woods by himself." "He suddenly got lost."
 "He did not know where to go." "He was wandering for an hour."
 "He finally went out.")
(EPI-SCHEMA ((JAY.NAME
              ((ADV-A (INTO.P WOOD367.SK))
               ((ADV-A (BY.P JAY.NAME))
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?L2))
                  ((ADV-A (IN.P (K YESTERDAY.N)))
                   ((ADV-A (ON.P ?X_A)) GO.327.V))))))
              ?L2)
             ** E368.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (JAY.NAME AGENT.N))
		(!R5 (?X_A PLANE.N))
		(!R6 (WOOD367.SK (PLUR WOOD.N)))
	)
	(:GOALS
		(?G1 (JAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JAY.NAME (AT.P ?L1)))
		(?I2 (NOT (JAY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JAY.NAME (AT.P ?L1))))
		(?P2 (JAY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E368.SK))
		(!W2 (?I2 BEFORE E368.SK))
		(!W3 (?P1 AFTER E368.SK))
		(!W4 (?P2 AFTER E368.SK))
		(!W5 (?G1 CAUSE-OF E368.SK))
		(!W6 (E368.SK (BEFORE ?X_D)))
		(!W7 (E368.SK (BEFORE NOW90)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 19:
	; "I was afraid of my granddad's horse."
	; "It was behind a fence."
	; "I went in there by myself once."
	; "It reared up on its hind legs."
	; "I ran away quickly."
; best schemas are:
; FLY.235.V
; GIVE.194.V
; TAKE.413.V
; RUN.227.V
; PLAY.920.V
; EAT.195.V

; story 20:
	; "Fred always wanted to know how he would look like in a cap."
	; "He decides to buy one."
	; "Fred loves how he looks in a cap."
	; "His friends love it too."
	; "He is glad he bought a cap."
; best schemas are:
; RUN.401.V
; GET.672.V
; GET.73.V
; GET.324.V
; GO_GET_NIL.677.PR
; SIT.274.V

; story 21:
	; "The boy went off a jump."
	; "He came down hard."
	; "His wheel got bent."
	; "He took it to a shop."
	; "They said the wheel was ruined."
; best schemas are:
; TAKE.958.V
; COME.126.V
; GO.423.V
; GO.90.V
; GO.591.V
; GO.742.V

; story 22:
	; "Bill was at a stop light."
	; "The light was on red."
	; "Billy began to look around while waiting."
	; "He suddenly heard a horn behind him."
	; "The light had turned green."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.626.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.627.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.251.V
; TAKE.958.V
; SIT.211.V
; SIT.505.V
(setf matches (append matches '(( (1.53125 4)
("Bill was at a stop light." "The light was on red."
 "Billy began to look around while waiting."
 "He suddenly heard a horn behind him." "The light had turned green.")
(EPI-SCHEMA ((BILLY.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.364.V
              (KA ((BEFORE.ADV HEAR.V) HORN428.SK)))
             ** ?E)
	(:ROLES
		(!R1 (BILLY.NAME AGENT.N))
		(!R2 ((KA ((BEFORE.ADV HEAR.V) HORN428.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (HORN428.SK SONG.N))
		(!R5 (BILLY.NAME MAN.N))
		(!R6 (E431.SK (IMPINGES-ON E429.SK)))
		(!R7 (HORN428.SK (BEHIND.P (K BILL.N))))
		(!R8 (HORN428.SK HORN.N))
		(!R9 (E431.SK (IMPINGES-ON E430.SK)))
	)
	(:GOALS
		(?G1 (BILLY.NAME (WANT.V (THAT (NOT (BILLY.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (BILLY.NAME (BEFORE.ADV HEAR.V) HORN428.SK)) CAUSE-OF
    (KE (BILLY.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E429.SK (BILLY.NAME (BEFORE.ADV (BEFORE.ADV HEAR.V)) HORN428.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E429.SK))
		(!W2 (E429.SK (BEFORE ?X_E)))
		(!W3 (E429.SK (BEFORE NOW113)))
		(!W4 (E430.SK (BEFORE NOW114)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.53125 3)
("Bill was at a stop light." "The light was on red."
 "Billy began to look around while waiting."
 "He suddenly heard a horn behind him." "The light had turned green.")
(EPI-SCHEMA ((BILLY.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.366.V
              (KA ((BEFORE.ADV HEAR.V) HORN428.SK)))
             ** ?E)
	(:ROLES
		(!R1 (BILLY.NAME AGENT.N))
		(!R2 ((KA ((BEFORE.ADV HEAR.V) HORN428.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (BILLY.NAME MAN.N))
		(!R5 (HORN428.SK SONG.N))
		(!R6 (E429.SK (IMPINGES-ON ?X_D)))
		(!R7 (HORN428.SK (BEHIND.P (K BILL.N))))
		(!R8 (HORN428.SK HORN.N))
	)
	(:GOALS
		(?G1 (BILLY.NAME (WANT.V (THAT (NOT (BILLY.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (BILLY.NAME (BEFORE.ADV HEAR.V) HORN428.SK)) CAUSE-OF
    (KE (BILLY.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E429.SK (BILLY.NAME (BEFORE.ADV (BEFORE.ADV HEAR.V)) HORN428.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E429.SK))
		(!W2 (?X_D (BEFORE ?X_E)))
		(!W3 (E429.SK (BEFORE NOW113)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 23:
	; "I was coming through a door at work."
	; "I saw my friend Amy."
	; "I almost ran into her."
	; "She was wearing a purple two piece."
	; "We did not say anything."
discarding schema COME.239.V learned from this story
; best schemas are:
; COME.605.V
; RUN.401.V
; COME.126.V
; TAKE.413.V
; GO.658.V
(setf matches (append matches '(( (3.2278125 2)
("I was coming through a door at work." "I saw my friend Amy."
 "I almost ran into her." "She was wearing a purple two piece."
 "We did not say anything.")
(EPI-SCHEMA ((ME450.SK
              ((ADV-A (THROUGH.P DOOR437.SK))
               ((ADV-A (AT.P (K WORK.N)))
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?L2))
                  ((ADV-A (FOR.P (KA VISIT.V))) COME.373.V)))))
              ?L2)
             ** E436.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (E436.SK (RIGHT-AFTER ?X_A)))
		(!R5 (ME450.SK FRIEND.N))
		(!R6 (ME450.SK (PERTAIN-TO ME450.SK)))
		(!R7 (FRIEND441.SK (PLUR BROTHER.N)))
		(!R8 (DOOR437.SK DOOR.N))
		(!R9 (ME450.SK AGENT.N))
		(!R10 (FRIEND441.SK (PERTAIN-TO ME450.SK)))
		(!R11 (FRIEND441.SK FRIEND.N))
	)
	(:GOALS
		(?G1 (ME450.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME450.SK (AT.P ?L1)))
		(?I2 (NOT (ME450.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME450.SK (AT.P ?L1))))
		(?P2 (ME450.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E436.SK))
		(!W2 (?I2 BEFORE E436.SK))
		(!W3 (?P1 AFTER E436.SK))
		(!W4 (?P2 AFTER E436.SK))
		(!W5 (?G1 CAUSE-OF E436.SK))
		(!W6 (E436.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (?G1 (BEFORE ?X_I)))
		(!W9 (E436.SK (BEFORE NOW115)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.2278125 4)
("I was coming through a door at work." "I saw my friend Amy."
 "I almost ran into her." "She was wearing a purple two piece."
 "We did not say anything.")
(EPI-SCHEMA ((ME450.SK
              ((ADV-A (INTO.P FRIEND441.SK))
               (ALMOST.ADV
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?L2))
                  ((ADV-A (FOR.P (KA (GET.V (K HELP.N))))) RUN.374.V)))))
              ?L2)
             ** E444.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (ME450.SK FRIEND.N))
		(!R5 (ME450.SK (PERTAIN-TO ME450.SK)))
		(!R6 (ME450.SK FEMALE.A))
		(!R7 (E444.SK (RIGHT-AFTER ?X_A)))
		(!R8 (FRIEND441.SK GIRL.N))
		(!R9 (FRIEND441.SK HEAD.N))
		(!R10 (?X_C HEAD.N))
		(!R11 (?X_C (PERTAIN-TO ME450.SK)))
		(!R12 (ME450.SK AGENT.N))
		(!R13 (FRIEND441.SK (PERTAIN-TO ME450.SK)))
		(!R14 (FRIEND441.SK FRIEND.N))
		(!R15 (FRIEND441.SK PERSON.N))
	)
	(:GOALS
		(?G1 (ME450.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME450.SK (AT.P ?L1)))
		(?I2 (NOT (ME450.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME450.SK (AT.P ?L1))))
		(?P2 (ME450.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E444.SK))
		(!W2 (?I2 BEFORE E444.SK))
		(!W3 (?P1 AFTER E444.SK))
		(!W4 (?P2 AFTER E444.SK))
		(!W5 (?G1 CAUSE-OF E444.SK))
		(!W6 (E444.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E444.SK (BEFORE NOW117)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.2278125 3)
("I was coming through a door at work." "I saw my friend Amy."
 "I almost ran into her." "She was wearing a purple two piece."
 "We did not say anything.")
(EPI-SCHEMA ((ME450.SK
              ((ADV-A (THROUGH.P DOOR437.SK))
               ((ADV-A (AT.P (K WORK.N)))
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?L2)) ((ADV-A (BY.P ?X_A)) COME.375.V)))))
              ?L2)
             ** E436.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (ME450.SK FRIEND.N))
		(!R5 (ME450.SK BEST.A))
		(!R6 (?X_A HOUSE.N))
		(!R7 (ME450.SK (PERTAIN-TO ME450.SK)))
		(!R8 (E436.SK (RIGHT-AFTER ?X_B)))
		(!R9 (FRIEND441.SK SON.N))
		(!R10 (DOOR437.SK DOOR.N))
		(!R11 (ME450.SK AGENT.N))
		(!R12 (FRIEND441.SK (PERTAIN-TO ME450.SK)))
		(!R13 (FRIEND441.SK FRIEND.N))
		(!R14 (FRIEND441.SK PERSON.N))
	)
	(:GOALS
		(?G1 (ME450.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME450.SK (AT.P ?L1)))
		(?I2 (NOT (ME450.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME450.SK (AT.P ?L1))))
		(?P2 (ME450.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E436.SK))
		(!W2 (?I2 BEFORE E436.SK))
		(!W3 (?P1 AFTER E436.SK))
		(!W4 (?P2 AFTER E436.SK))
		(!W5 (?G1 CAUSE-OF E436.SK))
		(!W6 (E436.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E436.SK (BEFORE NOW115)))
	)
	(:CERTAINTIES
		(!C1 (!R14 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R13 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.7278125 1)
("I was coming through a door at work." "I saw my friend Amy."
 "I almost ran into her." "She was wearing a purple two piece."
 "We did not say anything.")
(EPI-SCHEMA ((ME450.SK
              ((ADV-A (THROUGH.P DOOR437.SK))
               ((ADV-A (AT.P (K WORK.N)))
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?L2))
                  ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FRIEND441.SK)) PLAY.V))))
                   COME.383.V)))))
              ?L2)
             ** E436.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (FRIEND441.SK (PLUR FRIEND.N)))
		(!R5 (FRIEND441.SK HOME.N))
		(!R6 (ME450.SK GIRL.N))
		(!R7 (DOOR437.SK DOOR.N))
		(!R8 (ME450.SK AGENT.N))
		(!R9 (FRIEND441.SK (PERTAIN-TO ME450.SK)))
		(!R10 (FRIEND441.SK FRIEND.N))
	)
	(:GOALS
		(?G1 (ME450.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME450.SK (AT.P ?L1)))
		(?I2 (NOT (ME450.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME450.SK (AT.P ?L1))))
		(?P2 (ME450.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E436.SK))
		(!W2 (?I2 BEFORE E436.SK))
		(!W3 (?P1 AFTER E436.SK))
		(!W4 (?P2 AFTER E436.SK))
		(!W5 (?G1 CAUSE-OF E436.SK))
		(!W6 (E436.SK (BEFORE ?X_E)))
		(!W7 (E436.SK (BEFORE NOW115)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 24:
	; "Ben came home late at night."
	; "He did not want to wake up his wife."
	; "He did not turn on the light."
	; "He slipped and fell down."
	; "His leg was broken."
discarding schema AVOID_ACTION_TO_AVOID_DISPLEASURE.251.V learned from this story
discarding schema FALL.250.V learned from this story
; best schemas are:
; GO.1083.V
; GO.123.V
; FIND.773.V
; GET.88.V
(setf matches (append matches '(( (3.2278125 1)
("Ben came home late at night." "He did not want to wake up his wife."
 "He did not turn on the light." "He slipped and fell down."
 "His leg was broken.")
(EPI-SCHEMA ((HE.PRO
              (DOWN.ADV
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_A)) LOOK.V))))
                  FALL.384.V))))
              ?L2)
             ** E459.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (?X_A (PLUR CLOTHE.N)))
		(!R5 (HE.PRO MAN.N))
		(!R6 (WIFE454.SK (PERTAIN-TO HE.PRO)))
		(!R7 (E459.SK (AT-OR-BEFORE NOW123)))
		(!R8 (WIFE454.SK WIFE.N))
		(!R9 (WIFE454.SK (PERTAIN-TO BEN.NAME)))
		(!R10 (BEN.NAME LEG.N))
		(!R11 (BEN.NAME (PERTAIN-TO HE.PRO)))
		(!R12 (HE.PRO MALE.A))
		(!R13 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P ?L1)))
		(?I2 (NOT (HE.PRO (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P ?L1))))
		(?P2 (HE.PRO (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E459.SK))
		(!W2 (?I2 BEFORE E459.SK))
		(!W3 (?P1 AFTER E459.SK))
		(!W4 (?P2 AFTER E459.SK))
		(!W5 (?G1 CAUSE-OF E459.SK))
		(!W6 (E459.SK (BEFORE ?X_E)))
		(!W7 (E458.SK (BEFORE NOW123)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.2278125 2)
("Ben came home late at night." "He did not want to wake up his wife."
 "He did not turn on the light." "He slipped and fell down."
 "His leg was broken.")
(EPI-SCHEMA ((HE.PRO
              (DOWN.ADV
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_A)) LOOK.V))))
                  FALL.385.V))))
              ?L2)
             ** E459.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (?X_A (PLUR CLOTHE.N)))
		(!R5 (WIFE454.SK ((NN HEAD.N) ITCH.N)))
		(!R6 (WIFE454.SK (PERTAIN-TO HE.PRO)))
		(!R7 (HE.PRO MAN.N))
		(!R8 (E459.SK (AT-OR-BEFORE NOW123)))
		(!R9 (WIFE454.SK WIFE.N))
		(!R10 (WIFE454.SK (PERTAIN-TO BEN.NAME)))
		(!R11 (BEN.NAME LEG.N))
		(!R12 (BEN.NAME (PERTAIN-TO HE.PRO)))
		(!R13 (HE.PRO MALE.A))
		(!R14 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P ?L1)))
		(?I2 (NOT (HE.PRO (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P ?L1))))
		(?P2 (HE.PRO (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E459.SK))
		(!W2 (?I2 BEFORE E459.SK))
		(!W3 (?P1 AFTER E459.SK))
		(!W4 (?P2 AFTER E459.SK))
		(!W5 (?G1 CAUSE-OF E459.SK))
		(!W6 (E459.SK (BEFORE ?X_E)))
		(!W7 (E458.SK (BEFORE NOW123)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 25:
	; "Susie loved clothes."
	; "She got a striped shirt yesterday."
	; "She did not like it."
	; "Finally she liked it."
	; "Susie was happy about it."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; GO.19.V
; GO.90.V
; GO.1241.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
; GO.504.V
(setf matches (append matches '(( (1.5 1)
("Susie loved clothes." "She got a striped shirt yesterday."
 "She did not like it." "Finally she liked it." "Susie was happy about it.")
(EPI-SCHEMA ((SUSIE.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.404.V
              (KA (LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))))
             ** ?E)
	(:ROLES
		(!R1 (SUSIE.NAME AGENT.N))
		(!R2 ((KA (LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (SUSIE.NAME BIRD.N))
		(!R5 (?X_B CAGE.N))
	)
	(:GOALS
		(?G1 (SUSIE.NAME (WANT.V (THAT (NOT (SUSIE.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (SUSIE.NAME LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))) CAUSE-OF
    (KE (SUSIE.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E472.SK (SUSIE.NAME LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E472.SK))
		(!W2 (E472.SK (BEFORE ?X_D)))
		(!W3 (E472.SK (BEFORE NOW128)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.53125 4)
("Susie loved clothes." "She got a striped shirt yesterday."
 "She did not like it." "Finally she liked it." "Susie was happy about it.")
(EPI-SCHEMA ((SUSIE.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.405.V
              (KA (LIKE.V IT474.SK)))
             ** ?E)
	(:ROLES
		(!R1 (SUSIE.NAME AGENT.N))
		(!R2 ((KA (LIKE.V IT474.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (?X_A ((NN HAIR.N) CUT.N)))
		(!R5 (?X_A NEW.A))
		(!R6 (IT474.SK ((NN HAIR.N) STYLIST.N)))
		(!R7 (IT474.SK HAIR.N))
		(!R8 (IT474.SK (PERTAIN-TO SUSIE.NAME)))
	)
	(:GOALS
		(?G1 (SUSIE.NAME (WANT.V (THAT (NOT (SUSIE.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (SUSIE.NAME LIKE.V IT474.SK)) CAUSE-OF
    (KE (SUSIE.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E472.SK (SUSIE.NAME LIKE.V IT474.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E472.SK))
		(!W2 (?G1 (BEFORE ?X_E)))
		(!W3 (E472.SK (BEFORE ?X_G)))
		(!W4 (E472.SK (BEFORE NOW128)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 26:
	; "The market was rallying."
	; "Kelley was not happy about it."
	; "She didn't want it to go up that much."
	; "She was short."
	; "So she was losing money."
; best schemas are:

; story 27:
	; "Sandy loved to hike."
	; "On her hike she ran into a bear."
	; "She wasn't sure what to do."
	; "She stayed still and quiet."
	; "The bear finally ran away."
discarding schema RUN.266.V learned from this story
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; GIVE.902.V
; GO.1272.V
; RUN.227.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
(setf matches (append matches '(( (3.0 0)
("Sandy loved to hike." "On her hike she ran into a bear."
 "She wasn't sure what to do." "She stayed still and quiet."
 "The bear finally ran away.")
(EPI-SCHEMA ((SANDY.NAME
              ((ADV-A (INTO.P BEAR494.SK))
               ((ADV-S (ON.P HIKE492.SK))
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?L2)) ((ADV-A (IN.P HIKE492.SK)) RUN.411.V)))))
              ?L2)
             ** E491.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (SANDY.NAME AGENT.N))
		(!R5 (BEAR494.SK BEAR.N))
		(!R6 (E491.SK (RIGHT-AFTER U135)))
		(!R7 (HIKE492.SK HIKE.N))
		(!R8 (HIKE492.SK (PERTAIN-TO SANDY.NAME)))
	)
	(:GOALS
		(?G1 (SANDY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SANDY.NAME (AT.P ?L1)))
		(?I2 (NOT (SANDY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SANDY.NAME (AT.P ?L1))))
		(?P2 (SANDY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E491.SK))
		(!W2 (?I2 BEFORE E491.SK))
		(!W3 (?P1 AFTER E491.SK))
		(!W4 (?P2 AFTER E491.SK))
		(!W5 (?G1 CAUSE-OF E491.SK))
		(!W6 (E491.SK (BEFORE ?X_D)))
		(!W7 (E491.SK (SAME-TIME NOW136)))
		(!W8 (E495.SK (BEFORE NOW136)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 1)
("Sandy loved to hike." "On her hike she ran into a bear."
 "She wasn't sure what to do." "She stayed still and quiet."
 "The bear finally ran away.")
(EPI-SCHEMA ((SANDY.NAME
              ((ADV-A (INTO.P BEAR494.SK))
               ((ADV-S (ON.P HIKE492.SK))
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?L2)) ((ADV-A (AT.P ?X_A)) RUN.412.V)))))
              ?L2)
             ** E491.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (?X_A CAT.N))
		(!R5 (SANDY.NAME HEN.N))
		(!R6 (?X_A (ATTENDED-TO-BY*.A ?X_B)))
		(!R7 (SANDY.NAME AGENT.N))
		(!R8 (?X_A FLOWER.N))
		(!R9 (?X_A ORGANISM.N))
		(!R10 (BEAR494.SK BEAR.N))
		(!R11 (HIKE492.SK HIKE.N))
		(!R12 (HIKE492.SK (PERTAIN-TO SANDY.NAME)))
		(!R13 (E491.SK (RIGHT-AFTER U135)))
	)
	(:GOALS
		(?G1 (SANDY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SANDY.NAME (AT.P ?L1)))
		(?I2 (NOT (SANDY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SANDY.NAME (AT.P ?L1))))
		(?P2 (SANDY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E491.SK))
		(!W2 (?I2 BEFORE E491.SK))
		(!W3 (?P1 AFTER E491.SK))
		(!W4 (?P2 AFTER E491.SK))
		(!W5 (?G1 CAUSE-OF E491.SK))
		(!W6 (E491.SK (BEFORE ?X_E)))
		(!W7 (E491.SK (SAME-TIME NOW136)))
		(!W8 (E495.SK (BEFORE NOW136)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 28:
	; "My granddad has a pond."
	; "He has let me feed the fish."
	; "The fish know you are coming."
	; "The water starts to move."
	; "Then you throw in the food."
; best schemas are:
; GET.1260.V
; TAKE.413.V
; FEED.660.V
; GIVE.194.V
; FEED_TAKE_NIL.1100.PR
; CLIMB_GET_EAT.349.PR

; story 29:
	; "Tom wanted a pet."
	; "Tom knew a dog or cat would be too much of a liability."
	; "Tom went to the pet store."
	; "Tom found a lizard he liked."
	; "Tom bought the lizard."
; best schemas are:
; GO.591.V
; GO.90.V
; GO.806.V
; GO.1220.V
; GO.594.V
; GO.828.V
(setf matches (append matches '(( (5.0 8)
("Tom wanted a pet." "Tom knew a dog or cat would be too much of a liability."
 "Tom went to the pet store." "Tom found a lizard he liked."
 "Tom bought the lizard.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE546.SK)) GO.430.V))
              STORE546.SK)
             ** E532.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE546.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE546.SK)))
		(!R5 (TOM.NAME CAT.N))
		(!R6 (TOM.NAME NEW.A))
		(!R7 (LIZARD536.SK CAT.N))
		(!R8 (LIZARD536.SK NICE.A))
		(!R9 (LIZARD536.SK (PERTAIN-TO TOM.NAME)))
		(!R10 (PET523.SK PET.N))
		(!R11 (STORE546.SK ((NN PET.N) STORE.N)))
		(!R12 (LIZARD536.SK LIZARD.N))
		(!R13 (LIZARD536.SK VERTEBRATE.N))
	)
	(:GOALS
		(E524.SK (TOM.NAME (WANT.V (KA ((ADV-A (AT.P STORE546.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P STORE546.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P ?L1))))
		(?P2 (TOM.NAME (AT.P STORE546.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E532.SK))
		(!W2 (?I2 BEFORE E532.SK))
		(!W3 (?P1 AFTER E532.SK))
		(!W4 (?P2 AFTER E532.SK))
		(!W5 (E524.SK CAUSE-OF E532.SK))
		(!W6 (E532.SK (BEFORE ?X_E)))
		(!W7 (E524.SK (BEFORE NOW145)))
		(!W8 (E532.SK (BEFORE NOW147)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0 3)
("Tom wanted a pet." "Tom knew a dog or cat would be too much of a liability."
 "Tom went to the pet store." "Tom found a lizard he liked."
 "Tom bought the lizard.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE546.SK)) ((ADV-A (FROM.P ?L1)) GO.431.V)))
              STORE546.SK)
             ** E532.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE546.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE546.SK)))
		(!R4 (TOM.NAME AGENT.N))
		(!R5 (STORE546.SK STORE.N))
		(!R6 (PET523.SK PET.N))
		(!R7 (STORE546.SK ((NN PET.N) STORE.N)))
	)
	(:GOALS
		(E524.SK (TOM.NAME (WANT.V (KA ((ADV-A (AT.P STORE546.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P STORE546.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P ?L1))))
		(?P2 (TOM.NAME (AT.P STORE546.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E532.SK))
		(!W2 (?I2 BEFORE E532.SK))
		(!W3 (?P1 AFTER E532.SK))
		(!W4 (?P2 AFTER E532.SK))
		(!W5 (E524.SK CAUSE-OF E532.SK))
		(!W6 (E532.SK (BEFORE ?X_D)))
		(!W7 (E524.SK (BEFORE NOW145)))
		(!W8 (E532.SK (BEFORE NOW147)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0 3)
("Tom wanted a pet." "Tom knew a dog or cat would be too much of a liability."
 "Tom went to the pet store." "Tom found a lizard he liked."
 "Tom bought the lizard.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE546.SK)) GO.433.V))
              STORE546.SK)
             ** E532.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE546.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE546.SK)))
		(!R5 (STORE546.SK STORE.N))
		(!R6 (PET523.SK PET.N))
		(!R7 (STORE546.SK ((NN PET.N) STORE.N)))
	)
	(:GOALS
		(E524.SK (TOM.NAME (WANT.V (KA ((ADV-A (AT.P STORE546.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P STORE546.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P ?L1))))
		(?P2 (TOM.NAME (AT.P STORE546.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E532.SK))
		(!W2 (?I2 BEFORE E532.SK))
		(!W3 (?P1 AFTER E532.SK))
		(!W4 (?P2 AFTER E532.SK))
		(!W5 (E524.SK CAUSE-OF E532.SK))
		(!W6 (E532.SK (BEFORE ?X_D)))
		(!W7 (E524.SK (BEFORE NOW145)))
		(!W8 (E532.SK (BEFORE NOW147)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0 3)
("Tom wanted a pet." "Tom knew a dog or cat would be too much of a liability."
 "Tom went to the pet store." "Tom found a lizard he liked."
 "Tom bought the lizard.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE546.SK)) GO.433.V))
              STORE546.SK)
             ** E532.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE546.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE546.SK)))
		(!R5 (STORE546.SK STORE.N))
		(!R6 (PET523.SK PET.N))
		(!R7 (STORE546.SK ((NN PET.N) STORE.N)))
	)
	(:GOALS
		(E524.SK (TOM.NAME (WANT.V (KA ((ADV-A (AT.P STORE546.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P STORE546.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P ?L1))))
		(?P2 (TOM.NAME (AT.P STORE546.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E532.SK))
		(!W2 (?I2 BEFORE E532.SK))
		(!W3 (?P1 AFTER E532.SK))
		(!W4 (?P2 AFTER E532.SK))
		(!W5 (E524.SK CAUSE-OF E532.SK))
		(!W6 (E532.SK (BEFORE ?X_D)))
		(!W7 (E524.SK (BEFORE NOW145)))
		(!W8 (E532.SK (BEFORE NOW147)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0 4)
("Tom wanted a pet." "Tom knew a dog or cat would be too much of a liability."
 "Tom went to the pet store." "Tom found a lizard he liked."
 "Tom bought the lizard.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE546.SK)) ((ADV-A (FROM.P ?L1)) GO.434.V)))
              STORE546.SK)
             ** E532.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE546.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE546.SK)))
		(!R4 (TOM.NAME AGENT.N))
		(!R5 (STORE546.SK MALL.N))
		(!R6 (STORE546.SK STORE.N))
		(!R7 (PET523.SK PET.N))
		(!R8 (STORE546.SK ((NN PET.N) STORE.N)))
	)
	(:GOALS
		(E524.SK (TOM.NAME (WANT.V (KA ((ADV-A (AT.P STORE546.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P STORE546.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P ?L1))))
		(?P2 (TOM.NAME (AT.P STORE546.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E532.SK))
		(!W2 (?I2 BEFORE E532.SK))
		(!W3 (?P1 AFTER E532.SK))
		(!W4 (?P2 AFTER E532.SK))
		(!W5 (E524.SK CAUSE-OF E532.SK))
		(!W6 (E532.SK (BEFORE ?X_D)))
		(!W7 (E524.SK (BEFORE NOW145)))
		(!W8 (E532.SK (BEFORE NOW147)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 30:
	; "The teacher drew a shape."
	; "She asked for it's name."
	; "The boy said square."
	; "The teacher corrected the boy."
	; "It was a triangle."
; best schemas are:
; GO.423.V
; GO.742.V
; COME.126.V
; GO.642.V
; MOVE.342.V
; MOVE.501.V
(setf matches (append matches '(( (2.405 0)
("The teacher drew a shape." "She asked for it's name." "The boy said square."
 "The teacher corrected the boy." "It was a triangle.")
(EPI-SCHEMA ((TEACHER549.SK
              ((ADV-A (FOR.P NAME557.SK))
               ((ADV-A (TO.P ?X_B)) ((ADV-A (FROM.P ?L1)) ASK.445.V)))
              ?X_B)
             ** E559.SK)
	(:ROLES
		(!R1 (TEACHER549.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_B LOCATION.N))
		(!R4 (NOT (?L1 = ?X_B)))
		(!R5 (?X_B CITY.N))
		(!R6 (?X_B NEW.A))
		(!R7 (TEACHER549.SK TEACHER.N))
		(!R8 (NAME557.SK NAME.N))
		(!R9 (SHAPE551.SK SHAPE.N))
		(!R10 (NAME557.SK (PERTAIN-TO SHAPE551.SK)))
	)
	(:GOALS
		(?G1 (TEACHER549.SK (WANT.V (KA ((ADV-A (AT.P ?X_B)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TEACHER549.SK (AT.P ?L1)))
		(?I2 (NOT (TEACHER549.SK (AT.P ?X_B))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TEACHER549.SK (AT.P ?L1))))
		(?P2 (TEACHER549.SK (AT.P ?X_B)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E559.SK))
		(!W2 (?I2 BEFORE E559.SK))
		(!W3 (?P1 AFTER E559.SK))
		(!W4 (?P2 AFTER E559.SK))
		(!W5 (?G1 CAUSE-OF E559.SK))
		(!W6 (E559.SK (BEFORE ?X_D)))
		(!W7 (E559.SK (BEFORE NOW151)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 0)
("The teacher drew a shape." "She asked for it's name." "The boy said square."
 "The teacher corrected the boy." "It was a triangle.")
(EPI-SCHEMA ((TEACHER549.SK
              ((ADV-A (FOR.P NAME557.SK))
               ((ADV-A (TO.P ?X_B)) ((ADV-A (FROM.P ?L1)) ASK.446.V)))
              ?X_B)
             ** E559.SK)
	(:ROLES
		(!R1 (TEACHER549.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_B LOCATION.N))
		(!R4 (NOT (?L1 = ?X_B)))
		(!R5 (?X_B TOWN.N))
		(!R6 (?X_B NEW.A))
		(!R7 (TEACHER549.SK TEACHER.N))
		(!R8 (NAME557.SK NAME.N))
		(!R9 (SHAPE551.SK SHAPE.N))
		(!R10 (NAME557.SK (PERTAIN-TO SHAPE551.SK)))
	)
	(:GOALS
		(?G1 (TEACHER549.SK (WANT.V (KA ((ADV-A (AT.P ?X_B)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TEACHER549.SK (AT.P ?L1)))
		(?I2 (NOT (TEACHER549.SK (AT.P ?X_B))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TEACHER549.SK (AT.P ?L1))))
		(?P2 (TEACHER549.SK (AT.P ?X_B)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E559.SK))
		(!W2 (?I2 BEFORE E559.SK))
		(!W3 (?P1 AFTER E559.SK))
		(!W4 (?P2 AFTER E559.SK))
		(!W5 (?G1 CAUSE-OF E559.SK))
		(!W6 (E559.SK (BEFORE ?X_D)))
		(!W7 (E559.SK (BEFORE NOW151)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 31:
	; "Leo is walking home."
	; "He sees a dog stuck in a tree."
	; "He frees the dog from the tree."
	; "The dog runs off."
	; "Leo saved the dog's life."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1152.V
; RUN.179.V
; RUN.179.V
; COME.280.V
; CLIMB.347.V
(setf matches (append matches '(( (1.53125 1)
("Leo is walking home." "He sees a dog stuck in a tree."
 "He frees the dog from the tree." "The dog runs off."
 "Leo saved the dog's life.")
(EPI-SCHEMA ((LEO.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.447.V
              (KA ((THERE.ADV SEE.V) DOG576.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) DOG576.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (LEO.NAME AGENT.N))
		(!R4 (DOG576.SK ((ADV-A (IN.P TREE577.SK)) (BE.PASV STICK.V))))
		(!R5 (DOG576.SK DOG.N))
		(!R6 (TREE577.SK TREE.N))
		(!R7 (LIFE589.SK LIFE.N))
		(!R8 (LIFE589.SK (PERTAIN-TO DOG576.SK)))
	)
	(:GOALS
		(?G1 (LEO.NAME (WANT.V (THAT (NOT (LEO.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (LEO.NAME (THERE.ADV SEE.V) DOG576.SK)) CAUSE-OF
    (KE (LEO.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E578.SK (LEO.NAME (THERE.ADV (THERE.ADV SEE.V)) DOG576.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E578.SK))
		(!W2 (E578.SK (BEFORE ?X_D)))
		(!W3 (E578.SK (AT-ABOUT NOW156)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 32:
	; "I got one of those new drones."
	; "It is a lot of fun."
	; "I have been flying it all over town."
	; "It takes some really cool videos."
	; "You will have to come check them out."
; best schemas are:
; TAKE.413.V
; RUN.401.V
; TAKE.255.V
; TAKE.946.V
; TAKE.10.V
; TAKE.135.V

; story 33:
	; "I was invited to see a baseball game."
	; "When I sat down I was so bored."
	; "I just wanted to leave."
	; "I had nothing to do."
	; "So I fell asleep."
; best schemas are:
; PLAY.920.V
; PLAY.1257.V
; PLAY.103.V
; PLAY.991.V
; PLAY.301.V
; PLAY.402.V

; story 34:
	; "Tom had a girlfriend he loved very much."
	; "He cut her with his nails one day."
	; "She asked him to cut them."
	; "He cut his nails."
	; "His girlfriend was happy that he cut his nails."
; best schemas are:
; GET.73.V
; TAKE.10.V
; TAKE.135.V
; GET.333.V
; PLAY.669.V
; PLAY.670.V

; story 35:
	; "I was afraid to try a gainer."
	; "I had to do it my own way."
	; "I got to the board."
	; "I made the board go up and down."
	; "Then I finally did a gainer."
; best schemas are:
; RUN.401.V
; FLY.235.V
; GET.518.V
; TAKE.542.V
; GET.1260.V
; GET.88.V
(setf matches (append matches '(( (4.5 10)
("I was afraid to try a gainer." "I had to do it my own way."
 "I got to the board." "I made the board go up and down."
 "Then I finally did a gainer.")
(EPI-SCHEMA ((ME676.SK ((ADV-A (TO.P BOARD664.SK)) GET.599.V) WAY662.SK
              (AT.P-ARG ?L))
             ** E668.SK)
	(:ROLES
		(!R1 (WAY662.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME676.SK = WAY662.SK)))
		(!R4 (?X_A LIST.N))
		(!R5 (GAINER660.SK BIRTHDAY.N))
		(!R6 (?X_C (= (K (PLUR THING.N)))))
		(!R7 (?X_A (OF.P ?X_C)))
		(!R8 (GAINER660.SK (PLUR FRIEND.N)))
		(!R9 (WAY662.SK (= (K MONEY.N))))
		(!R10 (WAY662.SK (FOR.P GAINER660.SK)))
		(!R11 (GAINER660.SK (PLUR NAIL.N)))
		(!R12 (GAINER660.SK (PERTAIN-TO ME676.SK)))
		(!R13 (WAY662.SK GIRLFRIEND.N))
		(!R14 (?X_C (PLUR NAIL.N)))
		(!R15 (?X_C (PERTAIN-TO ME676.SK)))
		(!R16 (?X_C (= ?X_D)))
		(!R17 (?X_D DAY.N))
		(!R18 (BOARD664.SK BOARD.N))
		(!R19 (GAINER660.SK GAINER.N))
		(!R20 (WAY662.SK OWN.A))
		(!R21 (WAY662.SK WAY.N))
		(!R22 (WAY662.SK (PERTAIN-TO ME676.SK)))
		(!R23 (ME676.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME676.SK (WANT.V (THAT (ME676.SK (HAVE.V WAY662.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME676.SK HAVE.V WAY662.SK)))
		(?I2 (ME676.SK (AT.P ?L)))
		(?I3 (WAY662.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME676.SK HAVE.V WAY662.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E668.SK))
		(!W2 (?I1 PRECOND-OF E668.SK))
		(!W3 (?I2 PRECOND-OF E668.SK))
		(!W4 (?I3 PRECOND-OF E668.SK))
		(!W5 (?P1 POSTCOND-OF E668.SK))
		(!W6 (E668.SK (BEFORE ?X_H)))
		(!W7 (?P1 (BEFORE ?X_J)))
		(!W8 (?P1 (BEFORE ?X_L)))
		(!W9 (?X_K (BEFORE ?X_L)))
		(!W10 (E668.SK (BEFORE NOW177)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.2278125 1)
("I was afraid to try a gainer." "I had to do it my own way."
 "I got to the board." "I made the board go up and down."
 "Then I finally did a gainer.")
(EPI-SCHEMA ((ME676.SK ((ADV-A (TO.P BOARD664.SK)) GET.608.V)
              (KA
               ((ADV-A
                 (WITH.P
                  (K
                   (L #:G1792470
                    (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
                (BE.PASV CATCH.V)))
              (AT.P-ARG ?L))
             ** E668.SK)
	(:ROLES
		(!R1
   ((KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_A (TOO.ADV MANY.A)) (?X_B FISH.N))))))
      (BE.PASV CATCH.V)))
    INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3
   (NOT
    (ME676.SK =
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_C (TOO.ADV MANY.A)) (?X_D FISH.N))))))
       (BE.PASV CATCH.V))))))
		(!R4 (ME676.SK MAN.N))
		(!R5 (WAY662.SK LIMIT.N))
		(!R6 (BOARD664.SK BOARD.N))
		(!R7 (WAY662.SK OWN.A))
		(!R8 (WAY662.SK WAY.N))
		(!R9 (WAY662.SK (PERTAIN-TO ME676.SK)))
		(!R10 (ME676.SK AGENT.N))
	)
	(:GOALS
		(?G1
   (ME676.SK
    (WANT.V
     (THAT
      (ME676.SK
       (HAVE.V
        (KA
         ((ADV-A
           (WITH.P
            (K (L #:G1792470 (AND (?X_F (TOO.ADV MANY.A)) (?X_G FISH.N))))))
          (BE.PASV CATCH.V)))))))))
	)
	(:PRECONDS
		(?I1
   (NOT
    (ME676.SK HAVE.V
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_H (TOO.ADV MANY.A)) (?X_I FISH.N))))))
       (BE.PASV CATCH.V))))))
		(?I2 (ME676.SK (AT.P ?L)))
		(?I3
   ((KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_J (TOO.ADV MANY.A)) (?X_K FISH.N))))))
      (BE.PASV CATCH.V)))
    (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1
   (ME676.SK HAVE.V
    (KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_M (TOO.ADV MANY.A)) (?X_N FISH.N))))))
      (BE.PASV CATCH.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E668.SK))
		(!W2 (?I1 PRECOND-OF E668.SK))
		(!W3 (?I2 PRECOND-OF E668.SK))
		(!W4 (?I3 PRECOND-OF E668.SK))
		(!W5 (?P1 POSTCOND-OF E668.SK))
		(!W6 (E668.SK (BEFORE ?X_P)))
		(!W7 (E668.SK (BEFORE NOW177)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.7278125 0)
("I was afraid to try a gainer." "I had to do it my own way."
 "I got to the board." "I made the board go up and down."
 "Then I finally did a gainer.")
(EPI-SCHEMA ((ME676.SK ((ADV-A (TO.P BOARD664.SK)) GET.609.V) ?X_F
              (AT.P-ARG ?L))
             ** E668.SK)
	(:ROLES
		(!R1 (?X_F INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME676.SK = ?X_F)))
		(!R4 (?X_F CAT.N))
		(!R5 (?X_H (RIGHT-AFTER ?X_A)))
		(!R6 (ME676.SK WIFE.N))
		(!R7 (?X_B CAT.N))
		(!R8 (ME676.SK (PERTAIN-TO ?X_C)))
		(!R9 (?G1 (RIGHT-AFTER ?X_D)))
		(!R10 (ME676.SK AGENT.N))
		(!R11 (BOARD664.SK BOARD.N))
		(!R12 (WAY662.SK (PERTAIN-TO ME676.SK)))
		(!R13 (WAY662.SK OWN.A))
		(!R14 (WAY662.SK WAY.N))
	)
	(:GOALS
		(?G1 (ME676.SK (WANT.V (THAT (ME676.SK (HAVE.V ?X_F))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME676.SK HAVE.V ?X_F)))
		(?I2 (ME676.SK (AT.P ?L)))
		(?I3 (?X_F (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME676.SK HAVE.V ?X_F))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E668.SK))
		(!W2 (?I1 PRECOND-OF E668.SK))
		(!W3 (?I2 PRECOND-OF E668.SK))
		(!W4 (?I3 PRECOND-OF E668.SK))
		(!W5 (?P1 POSTCOND-OF E668.SK))
		(!W6 (E668.SK (BEFORE ?X_I)))
		(!W7 (?X_H (SAME-TIME ?X_I)))
		(!W8 (?G1 (SAME-TIME ?X_L)))
		(!W9 (?X_K (AT-ABOUT ?X_L)))
		(!W10 (E668.SK (BEFORE NOW177)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 36:
	; "The girls went to the pond."
	; "They caught a giant frog."
	; "They took it home and put it in a bucket."
	; "They showed it to all their friends."
	; "The frog lived with them for a month."
discarding schema TAKE.413.V learned from this story
; best schemas are:
; BUMP.400.V
; RUN.401.V
; GO.658.V
; GET.518.V
; GET.517.V

; story 37:
	; "Tom had a cat."
	; "He decided to get another one."
	; "The two cats didn't get along."
	; "Tom tried his best to get them to live together."
	; "It never worked and he had to get rid of one."
; best schemas are:
; GET.672.V
; GET.848.V
; GET.88.V
; GET.457.V
; GET.1322.V
; GET.324.V

; story 38:
	; "The boy shot a basket."
	; "It bounced hard off the rim."
	; "It went into the street."
	; "His brother ran after it."
	; "He caught it in the street."
; best schemas are:
; RUN.254.V
; GO.423.V
; GO.168.V
; GO.742.V
; GO.1084.V
; GO.658.V

; story 39:
	; "Jack went to his friend's place."
	; "The house was huge."
	; "It made Jack feel poor."
	; "Jack left early."
	; "Jack stopped talking to that friend."
; best schemas are:
; GO.658.V
; GO.671.V
; GO.253.V
; COME.126.V
; GO.531.V
; GO.1084.V
(setf matches (append matches '(( (4.0 9)
("Jack went to his friend's place." "The house was huge."
 "It made Jack feel poor." "Jack left early."
 "Jack stopped talking to that friend.")
(EPI-SCHEMA ((JACK.NAME
              ((ADV-A
                (FOR.P
                 (KA ((ADV-A (WITH.P NEW-SALIENT-ENTITY*759.SK)) PLAY.V))))
               ((ADV-A (TO.P PLACE745.SK)) ((ADV-A (FROM.P ?L1)) GO.768.V)))
              PLACE745.SK)
             ** E746.SK)
	(:ROLES
		(!R1 (JACK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (PLACE745.SK LOCATION.N))
		(!R4 (NOT (?L1 = PLACE745.SK)))
		(!R5 (NEW-SALIENT-ENTITY*759.SK HOME.N))
		(!R6 (NEW-SALIENT-ENTITY*759.SK (PERTAIN-TO JACK.NAME)))
		(!R7 (JACK.NAME GIRL.N))
		(!R8 (JACK.NAME FROG.N))
		(!R9 (JACK.NAME PERSON.N))
		(!R10 (JACK.NAME GIANT.A))
		(!R11 (NEW-SALIENT-ENTITY*759.SK (PLUR FRIEND.N)))
		(!R12 (?X_B (PLUR GIRL.N)))
		(!R13 (NEW-SALIENT-ENTITY*759.SK (PERTAIN-TO ?X_B)))
		(!R14 (PLACE745.SK PLACE.N))
		(!R15 (NEW-SALIENT-ENTITY*759.SK NEW-SALIENT-ENTITY*.N))
		(!R16 (NEW-SALIENT-ENTITY*759.SK FRIEND.N))
	)
	(:GOALS
		(?G1 (JACK.NAME (WANT.V (KA ((ADV-A (AT.P PLACE745.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JACK.NAME (AT.P ?L1)))
		(?I2 (NOT (JACK.NAME (AT.P PLACE745.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JACK.NAME (AT.P ?L1))))
		(?P2 (JACK.NAME (AT.P PLACE745.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E746.SK))
		(!W2 (?I2 BEFORE E746.SK))
		(!W3 (?P1 AFTER E746.SK))
		(!W4 (?P2 AFTER E746.SK))
		(!W5 (?G1 CAUSE-OF E746.SK))
		(!W6 (E746.SK (BEFORE ?X_E)))
		(!W7 (E746.SK (BEFORE NOW195)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 10)
("Jack went to his friend's place." "The house was huge."
 "It made Jack feel poor." "Jack left early."
 "Jack stopped talking to that friend.")
(EPI-SCHEMA ((JACK.NAME
              ((ADV-A
                (FOR.P
                 (KA ((ADV-A (WITH.P NEW-SALIENT-ENTITY*759.SK)) PLAY.V))))
               ((ADV-A (TO.P PLACE745.SK)) ((ADV-A (FROM.P ?L1)) GO.769.V)))
              PLACE745.SK)
             ** E746.SK)
	(:ROLES
		(!R1 (JACK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (PLACE745.SK LOCATION.N))
		(!R4 (NOT (?L1 = PLACE745.SK)))
		(!R5 (NEW-SALIENT-ENTITY*759.SK (PLUR FRIEND.N)))
		(!R6 (NEW-SALIENT-ENTITY*759.SK HOME.N))
		(!R7 (NEW-SALIENT-ENTITY*759.SK (PERTAIN-TO JACK.NAME)))
		(!R8 (JACK.NAME GIRL.N))
		(!R9 (NEW-SALIENT-ENTITY*759.SK (PERTAIN-TO ?X_B)))
		(!R10 (JACK.NAME GIANT.A))
		(!R11 (JACK.NAME FROG.N))
		(!R12 (JACK.NAME PERSON.N))
		(!R13 (NEW-SALIENT-ENTITY*759.SK (PLUR GIRL.N)))
		(!R14 (?X_C (PERTAIN-TO NEW-SALIENT-ENTITY*759.SK)))
		(!R15 (?X_C (PLUR FRIEND.N)))
		(!R16 (PLACE745.SK PLACE.N))
		(!R17 (NEW-SALIENT-ENTITY*759.SK NEW-SALIENT-ENTITY*.N))
		(!R18 (NEW-SALIENT-ENTITY*759.SK FRIEND.N))
	)
	(:GOALS
		(?G1 (JACK.NAME (WANT.V (KA ((ADV-A (AT.P PLACE745.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JACK.NAME (AT.P ?L1)))
		(?I2 (NOT (JACK.NAME (AT.P PLACE745.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JACK.NAME (AT.P ?L1))))
		(?P2 (JACK.NAME (AT.P PLACE745.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E746.SK))
		(!W2 (?I2 BEFORE E746.SK))
		(!W3 (?P1 AFTER E746.SK))
		(!W4 (?P2 AFTER E746.SK))
		(!W5 (?G1 CAUSE-OF E746.SK))
		(!W6 (E746.SK (BEFORE ?X_E)))
		(!W7 (E746.SK (BEFORE NOW195)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.3086734 5)
("Jack went to his friend's place." "The house was huge."
 "It made Jack feel poor." "Jack left early."
 "Jack stopped talking to that friend.")
(EPI-SCHEMA ((JACK.NAME
              (OUTSIDE.ADV
               ((ADV-A (TO.P PLACE745.SK)) ((ADV-A (FROM.P ?L1)) GO.770.V)))
              PLACE745.SK)
             ** E746.SK)
	(:ROLES
		(!R1 (JACK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (PLACE745.SK LOCATION.N))
		(!R4 (NOT (?L1 = PLACE745.SK)))
		(!R5 (HOUSE748.SK (PERTAIN-TO JACK.NAME)))
		(!R6 (HOUSE748.SK (= ?X_A)))
		(!R7 (?X_A DAY.N))
		(!R8 (?X_A (VERY.ADV LONG.A)))
		(!R9 (HOUSE748.SK DOOR.N))
		(!R10 (PLACE745.SK PLACE.N))
		(!R11 (HOUSE748.SK HOUSE.N))
		(!R12 (HOUSE748.SK STRUCTURE.N))
	)
	(:GOALS
		(?G1 (JACK.NAME (WANT.V (KA ((ADV-A (AT.P PLACE745.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JACK.NAME (AT.P ?L1)))
		(?I2 (NOT (JACK.NAME (AT.P PLACE745.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JACK.NAME (AT.P ?L1))))
		(?P2 (JACK.NAME (AT.P PLACE745.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E746.SK))
		(!W2 (?I2 BEFORE E746.SK))
		(!W3 (?P1 AFTER E746.SK))
		(!W4 (?P2 AFTER E746.SK))
		(!W5 (?G1 CAUSE-OF E746.SK))
		(!W6 (E746.SK (BEFORE ?X_E)))
		(!W7 (E746.SK (BEFORE NOW195)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R11 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R12 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 6)
("Jack went to his friend's place." "The house was huge."
 "It made Jack feel poor." "Jack left early."
 "Jack stopped talking to that friend.")
(EPI-SCHEMA ((JACK.NAME
              ((ADV-A (BY.P HOUSE748.SK))
               ((ADV-A (TO.P PLACE745.SK)) ((ADV-A (FROM.P ?L1)) COME.771.V)))
              PLACE745.SK)
             ** E746.SK)
	(:ROLES
		(!R1 (JACK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (PLACE745.SK LOCATION.N))
		(!R4 (NOT (?L1 = PLACE745.SK)))
		(!R5 (JACK.NAME FRIEND.N))
		(!R6 (JACK.NAME BEST.A))
		(!R7 (JACK.NAME (PERTAIN-TO NEW-SALIENT-ENTITY*759.SK)))
		(!R8 (NEW-SALIENT-ENTITY*759.SK AGENT.N))
		(!R9 (E746.SK (RIGHT-AFTER ?X_B)))
		(!R10 (?X_C SON.N))
		(!R11 (?X_C (PERTAIN-TO NEW-SALIENT-ENTITY*759.SK)))
		(!R12 (PLACE745.SK PLACE.N))
		(!R13 (HOUSE748.SK HOUSE.N))
		(!R14 (NEW-SALIENT-ENTITY*759.SK NEW-SALIENT-ENTITY*.N))
		(!R15 (NEW-SALIENT-ENTITY*759.SK FRIEND.N))
	)
	(:GOALS
		(?G1 (JACK.NAME (WANT.V (KA ((ADV-A (AT.P PLACE745.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JACK.NAME (AT.P ?L1)))
		(?I2 (NOT (JACK.NAME (AT.P PLACE745.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JACK.NAME (AT.P ?L1))))
		(?P2 (JACK.NAME (AT.P PLACE745.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E746.SK))
		(!W2 (?I2 BEFORE E746.SK))
		(!W3 (?P1 AFTER E746.SK))
		(!W4 (?P2 AFTER E746.SK))
		(!W5 (?G1 CAUSE-OF E746.SK))
		(!W6 (E746.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E746.SK (BEFORE NOW195)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 5)
("Jack went to his friend's place." "The house was huge."
 "It made Jack feel poor." "Jack left early."
 "Jack stopped talking to that friend.")
(EPI-SCHEMA ((JACK.NAME
              ((ADV-A SO.ADV OFF.P)
               ((ADV-A (TO.P PLACE745.SK)) ((ADV-A (FROM.P ?L1)) GO.772.V)))
              PLACE745.SK)
             ** E746.SK)
	(:ROLES
		(!R1 (JACK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (PLACE745.SK LOCATION.N))
		(!R4 (NOT (?L1 = PLACE745.SK)))
		(!R5 (HOUSE748.SK (PLUR MOVIE.N)))
		(!R6 (NEW-SALIENT-ENTITY*759.SK (PERTAIN-TO JACK.NAME)))
		(!R7 (PLACE745.SK PLACE.N))
		(!R8 (HOUSE748.SK HOUSE.N))
		(!R9 (NEW-SALIENT-ENTITY*759.SK NEW-SALIENT-ENTITY*.N))
		(!R10 (NEW-SALIENT-ENTITY*759.SK FRIEND.N))
	)
	(:GOALS
		(?G1 (JACK.NAME (WANT.V (KA ((ADV-A (AT.P PLACE745.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JACK.NAME (AT.P ?L1)))
		(?I2 (NOT (JACK.NAME (AT.P PLACE745.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JACK.NAME (AT.P ?L1))))
		(?P2 (JACK.NAME (AT.P PLACE745.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E746.SK))
		(!W2 (?I2 BEFORE E746.SK))
		(!W3 (?P1 AFTER E746.SK))
		(!W4 (?P2 AFTER E746.SK))
		(!W5 (?G1 CAUSE-OF E746.SK))
		(!W6 (?G1 (BEFORE ?X_E)))
		(!W7 (E746.SK (BEFORE ?X_G)))
		(!W8 (E746.SK (BEFORE NOW195)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.5 5)
("Jack went to his friend's place." "The house was huge."
 "It made Jack feel poor." "Jack left early."
 "Jack stopped talking to that friend.")
(EPI-SCHEMA ((JACK.NAME
              ((ADV-A (OFF.P HOUSE748.SK))
               ((ADV-A (TO.P PLACE745.SK)) ((ADV-A (FROM.P ?L1)) GO.773.V)))
              PLACE745.SK)
             ** E746.SK)
	(:ROLES
		(!R1 (JACK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (PLACE745.SK LOCATION.N))
		(!R4 (NOT (?L1 = PLACE745.SK)))
		(!R5 (JACK.NAME FRIEND.N))
		(!R6 (HOUSE748.SK ROAD.N))
		(!R7 (JACK.NAME (PERTAIN-TO ?X_B)))
		(!R8 (?X_C (PERTAIN-TO ?X_B)))
		(!R9 (?X_C CAR.N))
		(!R10 (PLACE745.SK PLACE.N))
		(!R11 (HOUSE748.SK HOUSE.N))
		(!R12 (HOUSE748.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (JACK.NAME (WANT.V (KA ((ADV-A (AT.P PLACE745.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JACK.NAME (AT.P ?L1)))
		(?I2 (NOT (JACK.NAME (AT.P PLACE745.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JACK.NAME (AT.P ?L1))))
		(?P2 (JACK.NAME (AT.P PLACE745.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E746.SK))
		(!W2 (?I2 BEFORE E746.SK))
		(!W3 (?P1 AFTER E746.SK))
		(!W4 (?P2 AFTER E746.SK))
		(!W5 (?G1 CAUSE-OF E746.SK))
		(!W6 (E746.SK (BEFORE ?X_F)))
		(!W7 (E746.SK (BEFORE NOW195)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 40:
	; "Today we had a storm."
	; "It rained very hard for a long time."
	; "The wind blew loudly."
	; "I was glad when the storm was over."
	; "When I went outside, I saw a rainbow!"
; best schemas are:
; GO.658.V
; GO.671.V
; FLY.235.V
; TAKE.542.V
; GIVE.194.V
; TAKE.413.V

; story 41:
	; "Jane had never been in love before."
	; "She got her first boyfriend."
	; "It was in high school."
	; "She thought she loved him but they broke up."
	; "It took her a long time to get over it."
; best schemas are:
; TAKE.10.V
; TAKE.542.V
; TAKE.8.V
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V
; RUN.401.V
(setf matches (append matches '(( (0.03125 3)
("Jane had never been in love before." "She got her first boyfriend."
 "It was in high school." "She thought she loved him but they broke up."
 "It took her a long time to get over it.")
(EPI-SCHEMA ((IT.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.783.V
              (KA (TAKE.V SHE.PRO)))
             ** ?E)
	(:ROLES
		(!R1 ((KA (TAKE.V SHE.PRO)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (IT.PRO FEMALE.A))
		(!R4 (IT.PRO AGENT.N))
		(!R5 (SHE.PRO FEMALE.A))
		(!R6 (SHE.PRO AGENT.N))
		(!R7 (OBJECT784.SK (PERTAIN-TO SHE.PRO)))
	)
	(:GOALS
		(?G1 (IT.PRO (WANT.V (THAT (NOT (IT.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1 ((KE (IT.PRO TAKE.V SHE.PRO)) CAUSE-OF (KE (IT.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E795.SK (IT.PRO TAKE.V SHE.PRO))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E795.SK))
		(!W2 (E795.SK (AFTER ?X_D)))
		(!W3 (?X_D (AT-ABOUT ?X_E)))
		(!W4 (E795.SK (BEFORE NOW209)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 42:
	; "Tina was hungry."
	; "So she decided to get ice cream."
	; "She tried a taste."
	; "It was good."
	; "Tina wanted to go back."
; best schemas are:
; CLIMB_GET_EAT.349.PR
; GET.821.V
; GO_FIND_EAT.566.PR
; GO_GET_NIL.677.PR
; RUN.401.V
; GET.826.V

; story 43:
	; "The man took a shower."
	; "The hot water went cold."
	; "He still had soap in his hair."
	; "He washed his hair quickly."
	; "He was shivering when he got out of the shower."
; best schemas are:
; GET.1260.V
; GET.50.V
; GET.338.V
; TAKE.928.V
; TAKE.1.V
; TAKE.10.V
(setf matches (append matches '(( (4.4049997 2)
("The man took a shower." "The hot water went cold."
 "He still had soap in his hair." "He washed his hair quickly."
 "He was shivering when he got out of the shower.")
(EPI-SCHEMA ((MAN811.SK WASH.789.V
              (KA
               ((ADV-A
                 (WITH.P
                  (K
                   (L #:G1792470
                    (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
                (BE.PASV CATCH.V)))
              (AT.P-ARG ?L))
             ** E832.SK)
	(:ROLES
		(!R1 (MAN811.SK AGENT.N))
		(!R2
   ((KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_A (TOO.ADV MANY.A)) (?X_B FISH.N))))))
      (BE.PASV CATCH.V)))
    INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4
   (NOT
    (MAN811.SK =
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_C (TOO.ADV MANY.A)) (?X_D FISH.N))))))
       (BE.PASV CATCH.V))))))
		(!R5 (HAIR824.SK LIMIT.N))
		(!R6 (MAN811.SK MAN.N))
		(!R7 (HAIR824.SK (PERTAIN-TO MAN811.SK)))
		(!R8 (HAIR824.SK HAIR.N))
		(!R9 (OBJECT817.SK (= (K SOAP.N))))
		(!R10 (OBJECT817.SK (IN.P HAIR824.SK)))
	)
	(:GOALS
		(?G1
   (MAN811.SK
    (WANT.V
     (THAT
      (MAN811.SK
       (HAVE.V
        (KA
         ((ADV-A
           (WITH.P
            (K (L #:G1792470 (AND (?X_F (TOO.ADV MANY.A)) (?X_G FISH.N))))))
          (BE.PASV CATCH.V)))))))))
	)
	(:PRECONDS
		(?I1
   (NOT
    (MAN811.SK HAVE.V
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_H (TOO.ADV MANY.A)) (?X_I FISH.N))))))
       (BE.PASV CATCH.V))))))
		(?I2 (MAN811.SK (AT.P ?L)))
		(?I3
   ((KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_J (TOO.ADV MANY.A)) (?X_K FISH.N))))))
      (BE.PASV CATCH.V)))
    (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E827.SK
   (MAN811.SK HAVE.V
    (KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_M (TOO.ADV MANY.A)) (?X_N FISH.N))))))
      (BE.PASV CATCH.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E832.SK))
		(!W2 (?I1 PRECOND-OF E832.SK))
		(!W3 (?I2 PRECOND-OF E832.SK))
		(!W4 (?I3 PRECOND-OF E832.SK))
		(!W5 (E827.SK POSTCOND-OF E832.SK))
		(!W6 (E832.SK (BEFORE ?X_P)))
		(!W7 (E827.SK (BEFORE NOW217)))
		(!W8 (E832.SK (BEFORE NOW218)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.4049997 5)
("The man took a shower." "The hot water went cold."
 "He still had soap in his hair." "He washed his hair quickly."
 "He was shivering when he got out of the shower.")
(EPI-SCHEMA ((MAN811.SK WASH.790.V OBJECT817.SK (AT.P-ARG ?L)) ** E832.SK)
	(:ROLES
		(!R1 (MAN811.SK AGENT.N))
		(!R2 (OBJECT817.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAN811.SK = OBJECT817.SK)))
		(!R5 (OBJECT817.SK (PERTAIN-TO MAN811.SK)))
		(!R6 (OBJECT817.SK LUNCH.N))
		(!R7 (MAN811.SK MAN.N))
		(!R8 (HAIR824.SK (PERTAIN-TO MAN811.SK)))
		(!R9 (HAIR824.SK HAIR.N))
		(!R10 (OBJECT817.SK (= (K SOAP.N))))
		(!R11 (OBJECT817.SK (IN.P HAIR824.SK)))
	)
	(:GOALS
		(?G1 (MAN811.SK (WANT.V (THAT (MAN811.SK (HAVE.V OBJECT817.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN811.SK HAVE.V OBJECT817.SK)))
		(?I2 (MAN811.SK (AT.P ?L)))
		(?I3 (OBJECT817.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E827.SK (MAN811.SK HAVE.V OBJECT817.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E832.SK))
		(!W2 (?I1 PRECOND-OF E832.SK))
		(!W3 (?I2 PRECOND-OF E832.SK))
		(!W4 (?I3 PRECOND-OF E832.SK))
		(!W5 (E827.SK POSTCOND-OF E832.SK))
		(!W6 (E832.SK (BEFORE ?X_D)))
		(!W7 (E827.SK (BEFORE NOW217)))
		(!W8 (E832.SK (BEFORE NOW218)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 44:
	; "Joe needed a new sliding door."
	; "His old was broken."
	; "So Joe went to the store to look for another one."
	; "Joe found a very nice one,
Joe loved his new door ."
; best schemas are:
; GO.591.V
; TAKE.958.V
; GIVE.947.V
; GO.90.V
; FIND.129.V
; MOVE.342.V

; story 45:
	; "Today I went to lunch."
	; "I got the gumbo."
	; "It was good but salty."
	; "I drank a lot of water."
	; "I would still get it again though."
; best schemas are:
; GO.658.V
; GO.671.V
; RUN.401.V
; FLY.235.V
; GO.168.V
; GET.50.V
(setf matches (append matches '(( (4.1834373 4)
("Today I went to lunch." "I got the gumbo." "It was good but salty."
 "I drank a lot of water." "I would still get it again though.")
(EPI-SCHEMA ((ME860.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_A)) PLAY.V))))
               ((ADV-A (TO.P (K LUNCH.N))) ((ADV-A (FROM.P ?L1)) GO.850.V)))
              (K LUNCH.N))
             ** E850.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K LUNCH.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K LUNCH.N))))
		(!R4 (?X_A HOME.N))
		(!R5 (?X_A (PERTAIN-TO ME860.SK)))
		(!R6 (ME860.SK GIRL.N))
		(!R7 (ME860.SK FROG.N))
		(!R8 (ME860.SK PERSON.N))
		(!R9 (ME860.SK GIANT.A))
		(!R10 (?X_A (PLUR FRIEND.N)))
		(!R11 (?X_B (PLUR GIRL.N)))
		(!R12 (?X_A (PERTAIN-TO ?X_B)))
		(!R13 (ME860.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME860.SK (WANT.V (KA ((ADV-A (AT.P (K LUNCH.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME860.SK (AT.P ?L1)))
		(?I2 (NOT (ME860.SK (AT.P (K LUNCH.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME860.SK (AT.P ?L1))))
		(?P2 (ME860.SK (AT.P (K LUNCH.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E850.SK))
		(!W2 (?I2 BEFORE E850.SK))
		(!W3 (?P1 AFTER E850.SK))
		(!W4 (?P2 AFTER E850.SK))
		(!W5 (?G1 CAUSE-OF E850.SK))
		(!W6 (E850.SK (BEFORE ?X_E)))
		(!W7 (E850.SK (BEFORE NOW224)))
	)
	(:CERTAINTIES
		(!C1 (!R8 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.1834373 4)
("Today I went to lunch." "I got the gumbo." "It was good but salty."
 "I drank a lot of water." "I would still get it again though.")
(EPI-SCHEMA ((ME860.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_A)) PLAY.V))))
               ((ADV-A (TO.P (K LUNCH.N))) ((ADV-A (FROM.P ?L1)) GO.851.V)))
              (K LUNCH.N))
             ** E850.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K LUNCH.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K LUNCH.N))))
		(!R4 (?X_A (PLUR FRIEND.N)))
		(!R5 (?X_A HOME.N))
		(!R6 (?X_A (PERTAIN-TO ME860.SK)))
		(!R7 (ME860.SK GIRL.N))
		(!R8 (?X_A (PERTAIN-TO ?X_B)))
		(!R9 (ME860.SK GIANT.A))
		(!R10 (ME860.SK FROG.N))
		(!R11 (ME860.SK PERSON.N))
		(!R12 (?X_A (PLUR GIRL.N)))
		(!R13 (?X_C (PERTAIN-TO ?X_A)))
		(!R14 (?X_C (PLUR FRIEND.N)))
		(!R15 (ME860.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME860.SK (WANT.V (KA ((ADV-A (AT.P (K LUNCH.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME860.SK (AT.P ?L1)))
		(?I2 (NOT (ME860.SK (AT.P (K LUNCH.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME860.SK (AT.P ?L1))))
		(?P2 (ME860.SK (AT.P (K LUNCH.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E850.SK))
		(!W2 (?I2 BEFORE E850.SK))
		(!W3 (?P1 AFTER E850.SK))
		(!W4 (?P2 AFTER E850.SK))
		(!W5 (?G1 CAUSE-OF E850.SK))
		(!W6 (E850.SK (BEFORE ?X_E)))
		(!W7 (E850.SK (BEFORE NOW224)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.7278125 5)
("Today I went to lunch." "I got the gumbo." "It was good but salty."
 "I drank a lot of water." "I would still get it again though.")
(EPI-SCHEMA ((ME860.SK
              ((ADV-A (FOR.P (KA (GET.V (K HELP.N)))))
               ((ADV-A (TO.P (K LUNCH.N))) ((ADV-A (FROM.P ?L1)) RUN.852.V)))
              (K LUNCH.N))
             ** E850.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K LUNCH.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K LUNCH.N))))
		(!R4 (ME860.SK FRIEND.N))
		(!R5 (ME860.SK (PERTAIN-TO ME860.SK)))
		(!R6 (ME860.SK FEMALE.A))
		(!R7 (E850.SK (RIGHT-AFTER ?X_A)))
		(!R8 (?X_B GIRL.N))
		(!R9 (?X_B (PERTAIN-TO ME860.SK)))
		(!R10 (?X_B HEAD.N))
		(!R11 (?X_C HEAD.N))
		(!R12 (?X_C (PERTAIN-TO ME860.SK)))
		(!R13 (ME860.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME860.SK (WANT.V (KA ((ADV-A (AT.P (K LUNCH.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME860.SK (AT.P ?L1)))
		(?I2 (NOT (ME860.SK (AT.P (K LUNCH.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME860.SK (AT.P ?L1))))
		(?P2 (ME860.SK (AT.P (K LUNCH.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E850.SK))
		(!W2 (?I2 BEFORE E850.SK))
		(!W3 (?P1 AFTER E850.SK))
		(!W4 (?P2 AFTER E850.SK))
		(!W5 (?G1 CAUSE-OF E850.SK))
		(!W6 (E850.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E850.SK (BEFORE NOW224)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.1834373 3)
("Today I went to lunch." "I got the gumbo." "It was good but salty."
 "I drank a lot of water." "I would still get it again though.")
(EPI-SCHEMA ((ME860.SK
              (AWAY.ADV
               ((ADV-A (TO.P (K LUNCH.N))) ((ADV-A (FROM.P ?L1)) FLY.853.V)))
              (K LUNCH.N))
             ** E850.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K LUNCH.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K LUNCH.N))))
		(!R4 (ME860.SK ((NN MOTHER.N) BIRD.N)))
		(!R5 (ME860.SK BIRD.N))
		(!R6 (ME860.SK ((NN BABY.N) BIRD.N)))
		(!R7 (ME860.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME860.SK (WANT.V (KA ((ADV-A (AT.P (K LUNCH.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME860.SK (AT.P ?L1)))
		(?I2 (NOT (ME860.SK (AT.P (K LUNCH.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME860.SK (AT.P ?L1))))
		(?P2 (ME860.SK (AT.P (K LUNCH.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E850.SK))
		(!W2 (?I2 BEFORE E850.SK))
		(!W3 (?P1 AFTER E850.SK))
		(!W4 (?P2 AFTER E850.SK))
		(!W5 (?G1 CAUSE-OF E850.SK))
		(!W6 (E850.SK (BEFORE ?X_C)))
		(!W7 (E850.SK (BEFORE NOW224)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.7278125 6)
("Today I went to lunch." "I got the gumbo." "It was good but salty."
 "I drank a lot of water." "I would still get it again though.")
(EPI-SCHEMA ((ME860.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K LUNCH.N))) GO.854.V))
              (K LUNCH.N))
             ** E850.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K LUNCH.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K LUNCH.N))))
		(!R4 ((K LUNCH.N) CAFETERIA.N))
		(!R5 (E850.SK (RIGHT-AFTER ?X_A)))
		(!R6 (?X_B LUNCH.N))
		(!R7 ((K LUNCH.N) HAT.N))
		(!R8 ((K LUNCH.N) ARTIFACT.N))
		(!R9 (ME860.SK MAN.N))
		(!R10 (?X_B ((NN HEAD.N) ITCH.N)))
		(!R11 (?X_B (PERTAIN-TO ME860.SK)))
		(!R12 (ME860.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME860.SK (WANT.V (KA ((ADV-A (AT.P (K LUNCH.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME860.SK (AT.P ?L1)))
		(?I2 (NOT (ME860.SK (AT.P (K LUNCH.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME860.SK (AT.P ?L1))))
		(?P2 (ME860.SK (AT.P (K LUNCH.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E850.SK))
		(!W2 (?I2 BEFORE E850.SK))
		(!W3 (?P1 AFTER E850.SK))
		(!W4 (?P2 AFTER E850.SK))
		(!W5 (?G1 CAUSE-OF E850.SK))
		(!W6 (E850.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E850.SK (BEFORE NOW224)))
	)
	(:CERTAINTIES
		(!C1 (!R8 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.227813 5)
("Today I went to lunch." "I got the gumbo." "It was good but salty."
 "I drank a lot of water." "I would still get it again though.")
(EPI-SCHEMA ((ME860.SK GET.855.V GUMBO852.SK (AT.P-ARG ?L)) ** E853.SK)
	(:ROLES
		(!R1 (GUMBO852.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME860.SK = GUMBO852.SK)))
		(!R4 (ME860.SK MAN.N))
		(!R5 (GUMBO852.SK (PERTAIN-TO ME860.SK)))
		(!R6 (GUMBO852.SK LUNCH.N))
		(!R7 (ME860.SK AGENT.N))
		(!R8 (GUMBO852.SK GUMBO.N))
	)
	(:GOALS
		(?G1 (ME860.SK (WANT.V (THAT (ME860.SK (HAVE.V GUMBO852.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME860.SK HAVE.V GUMBO852.SK)))
		(?I2 (ME860.SK (AT.P ?L)))
		(?I3 (GUMBO852.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME860.SK HAVE.V GUMBO852.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E853.SK))
		(!W2 (?I1 PRECOND-OF E853.SK))
		(!W3 (?I2 PRECOND-OF E853.SK))
		(!W4 (?I3 PRECOND-OF E853.SK))
		(!W5 (?P1 POSTCOND-OF E853.SK))
		(!W6 (E853.SK (BEFORE ?X_D)))
		(!W7 (E853.SK (BEFORE NOW225)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 46:
	; "Fred looked outside."
	; "It looked like he got new neighbors."
	; "He was excited."
	; "He went to introduce himself."
	; "He made some friends."
; best schemas are:
; GO.658.V
; GO.671.V
; GO.531.V
; GO.1084.V
; GO.276.V
; GO.1083.V
(setf matches (append matches '(( (3.0 6)
("Fred looked outside." "It looked like he got new neighbors."
 "He was excited." "He went to introduce himself." "He made some friends.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FRIEND877.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.856.V)))
              ?L2)
             ** E870.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND877.SK HOME.N))
		(!R6 (FRIEND877.SK (PERTAIN-TO FRED.NAME)))
		(!R7 (FRED.NAME GIRL.N))
		(!R8 (FRED.NAME FROG.N))
		(!R9 (FRED.NAME PERSON.N))
		(!R10 (FRED.NAME GIANT.A))
		(!R11 (?X_B (PLUR GIRL.N)))
		(!R12 (FRIEND877.SK (PERTAIN-TO ?X_B)))
		(!R13 (FRIEND877.SK (PLUR FRIEND.N)))
	)
	(:GOALS
		(?G1 (FRED.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRED.NAME (AT.P ?L1))))
		(?P2 (FRED.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E870.SK))
		(!W2 (?I2 BEFORE E870.SK))
		(!W3 (?P1 AFTER E870.SK))
		(!W4 (?P2 AFTER E870.SK))
		(!W5 (?G1 CAUSE-OF E870.SK))
		(!W6 (E870.SK (BEFORE ?X_E)))
		(!W7 (E870.SK (BEFORE NOW232)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0 7)
("Fred looked outside." "It looked like he got new neighbors."
 "He was excited." "He went to introduce himself." "He made some friends.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FRIEND877.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.857.V)))
              ?L2)
             ** E870.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND877.SK HOME.N))
		(!R6 (FRIEND877.SK (PERTAIN-TO FRED.NAME)))
		(!R7 (FRED.NAME GIRL.N))
		(!R8 (FRIEND877.SK (PERTAIN-TO ?X_B)))
		(!R9 (FRED.NAME GIANT.A))
		(!R10 (FRED.NAME FROG.N))
		(!R11 (FRED.NAME PERSON.N))
		(!R12 (FRIEND877.SK (PLUR GIRL.N)))
		(!R13 (?X_C (PERTAIN-TO FRIEND877.SK)))
		(!R14 (?X_C (PLUR FRIEND.N)))
		(!R15 (FRIEND877.SK (PLUR FRIEND.N)))
	)
	(:GOALS
		(?G1 (FRED.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRED.NAME (AT.P ?L1))))
		(?P2 (FRED.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E870.SK))
		(!W2 (?I2 BEFORE E870.SK))
		(!W3 (?P1 AFTER E870.SK))
		(!W4 (?P2 AFTER E870.SK))
		(!W5 (?G1 CAUSE-OF E870.SK))
		(!W6 (E870.SK (BEFORE ?X_E)))
		(!W7 (E870.SK (BEFORE NOW232)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0 1)
("Fred looked outside." "It looked like he got new neighbors."
 "He was excited." "He went to introduce himself." "He made some friends.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (FOR.P (KA (INTRODUCE.V FRED.NAME))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-A SO.ADV OFF.P) GO.858.V))))
              ?L2)
             ** E870.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A (PLUR MOVIE.N)))
		(!R6 (FRIEND877.SK (PERTAIN-TO FRED.NAME)))
		(!R7 (FRIEND877.SK FRIEND.N))
		(!R8 (FRIEND877.SK (PLUR FRIEND.N)))
	)
	(:GOALS
		(?G1 (FRED.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRED.NAME (AT.P ?L1))))
		(?P2 (FRED.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E870.SK))
		(!W2 (?I2 BEFORE E870.SK))
		(!W3 (?P1 AFTER E870.SK))
		(!W4 (?P2 AFTER E870.SK))
		(!W5 (?G1 CAUSE-OF E870.SK))
		(!W6 (?G1 (BEFORE ?X_E)))
		(!W7 (E870.SK (BEFORE ?X_G)))
		(!W8 (E870.SK (BEFORE NOW232)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 1)
("Fred looked outside." "It looked like he got new neighbors."
 "He was excited." "He went to introduce himself." "He made some friends.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (FOR.P (KA (INTRODUCE.V FRED.NAME))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-A (OFF.P ?X_A)) GO.859.V))))
              ?L2)
             ** E870.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRED.NAME FRIEND.N))
		(!R6 (?X_A ROAD.N))
		(!R7 (FRED.NAME (PERTAIN-TO ?X_B)))
		(!R8 (?X_C (PERTAIN-TO ?X_B)))
		(!R9 (?X_C CAR.N))
	)
	(:GOALS
		(?G1 (FRED.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRED.NAME (AT.P ?L1))))
		(?P2 (FRED.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E870.SK))
		(!W2 (?I2 BEFORE E870.SK))
		(!W3 (?P1 AFTER E870.SK))
		(!W4 (?P2 AFTER E870.SK))
		(!W5 (?G1 CAUSE-OF E870.SK))
		(!W6 (E870.SK (BEFORE ?X_F)))
		(!W7 (E870.SK (BEFORE NOW232)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 3)
("Fred looked outside." "It looked like he got new neighbors."
 "He was excited." "He went to introduce himself." "He made some friends.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_A)) LOOK.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.861.V)))
              ?L2)
             ** E870.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A (PLUR CLOTHE.N)))
		(!R6 (FRED.NAME MAN.N))
		(!R7 (FRIEND877.SK (PERTAIN-TO FRED.NAME)))
		(!R8 (FRIEND877.SK WIFE.N))
		(!R9 (FRIEND877.SK (PLUR FRIEND.N)))
	)
	(:GOALS
		(?G1 (FRED.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRED.NAME (AT.P ?L1))))
		(?P2 (FRED.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E870.SK))
		(!W2 (?I2 BEFORE E870.SK))
		(!W3 (?P1 AFTER E870.SK))
		(!W4 (?P2 AFTER E870.SK))
		(!W5 (?G1 CAUSE-OF E870.SK))
		(!W6 (E870.SK (BEFORE ?X_E)))
		(!W7 (E870.SK (BEFORE NOW232)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 47:
	; "Bryan was back from vacation."
	; "He had work today."
	; "He was not excited."
	; "He got into work."
	; "He found he wasn't behind on his work."
; best schemas are:
; GET.460.V
; GET.660.V
; RUN.401.V
; GO.740.V
; COME.239.V
; TAKE.10.V
(setf matches (append matches '(( (4.6411133 3)
("Bryan was back from vacation." "He had work today." "He was not excited."
 "He got into work." "He found he wasn't behind on his work.")
(EPI-SCHEMA ((BRYAN.NAME
              ((ADV-A (INTO.P (K WORK.N)))
               ((ADV-A (FROM.P (K WORK.N))) GET.862.V))
              (K HOME.N) (AT.P-ARG ?L))
             ** E884.SK)
	(:ROLES
		(!R1 (BRYAN.NAME AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (BRYAN.NAME = (K HOME.N))))
		(!R5 (WORK888.SK WIFE.N))
		(!R6 (WORK888.SK (PERTAIN-TO BRYAN.NAME)))
		(!R7 (WORK888.SK WORK.N))
	)
	(:GOALS
		(?G1 (BRYAN.NAME (WANT.V (THAT (BRYAN.NAME (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (BRYAN.NAME HAVE.V (K HOME.N))))
		(?I2 (BRYAN.NAME (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (BRYAN.NAME HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E884.SK))
		(!W2 (?I1 PRECOND-OF E884.SK))
		(!W3 (?I2 PRECOND-OF E884.SK))
		(!W4 (?I3 PRECOND-OF E884.SK))
		(!W5 (?P1 POSTCOND-OF E884.SK))
		(!W6 (E884.SK (BEFORE ?X_D)))
		(!W7 (E884.SK (BEFORE NOW237)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.6411133 4)
("Bryan was back from vacation." "He had work today." "He was not excited."
 "He got into work." "He found he wasn't behind on his work.")
(EPI-SCHEMA ((BRYAN.NAME
              ((ADV-A (INTO.P (K WORK.N)))
               ((ADV-A (FROM.P (K WORK.N))) GET.863.V))
              (K HOME.N) (AT.P-ARG ?L))
             ** E884.SK)
	(:ROLES
		(!R1 (BRYAN.NAME AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (BRYAN.NAME = (K HOME.N))))
		(!R5 (BRYAN.NAME DAD.N))
		(!R6 (E884.SK (RIGHT-AFTER ?X_A)))
		(!R7 (BRYAN.NAME (PERTAIN-TO ?X_B)))
		(!R8 (WORK888.SK CAR.N))
		(!R9 (WORK888.SK (PERTAIN-TO BRYAN.NAME)))
		(!R10 (WORK888.SK WORK.N))
	)
	(:GOALS
		(?G1 (BRYAN.NAME (WANT.V (THAT (BRYAN.NAME (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (BRYAN.NAME HAVE.V (K HOME.N))))
		(?I2 (BRYAN.NAME (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (BRYAN.NAME HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E884.SK))
		(!W2 (?I1 PRECOND-OF E884.SK))
		(!W3 (?I2 PRECOND-OF E884.SK))
		(!W4 (?I3 PRECOND-OF E884.SK))
		(!W5 (?P1 POSTCOND-OF E884.SK))
		(!W6 (E884.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E884.SK (BEFORE NOW237)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 48:
	; "A violinist liked to play."
	; "She never played acoustically."
	; "Her friend told her to try it."
	; "She loved the sound."
	; "She records it."
; best schemas are:
; GO.658.V
; GO.671.V
; PLAY.1257.V
; PLAY.524.V
; GET.518.V
; GET.517.V

; story 49:
	; "It was the middle of summer."
	; "Kara didn't want to go outside."
	; "It was too hot."
	; "So she just stayed in."
	; "It wasn't worth it being in the heat."
discarding schema AVOID_ACTION_TO_AVOID_DISPLEASURE.539.V learned from this story
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; TRAVEL.V
; GO.340.V
; GO.680.V
; GO.19.V

; story 50:
	; "My brother had a ball."
	; "He threw it to my son."
	; "My son could not catch it."
	; "It rolled right past my son."
	; "My son picked the ball up."
; best schemas are:
; TAKE.542.V
; GO.658.V
; GO.671.V
; GIVE.1297.V
; TAKE.10.V
; TAKE.135.V

; story 51:
	; "Lisa took her family to the farm."
	; "Her kids had a great time."
	; "Her daughter then touched the pig."
	; "She laughed."
	; "She had a fun time."
discarding schema TAKE.624.V learned from this story
; best schemas are:
; TAKE.928.V
; TAKE.1039.V
; TAKE.10.V
; TAKE.135.V
; TAKE.542.V
(setf matches (append matches '(( (6.1953125 21)
("Lisa took her family to the farm." "Her kids had a great time."
 "Her daughter then touched the pig." "She laughed." "She had a fun time.")
(EPI-SCHEMA ((LISA.NAME ((ADV-A (TO.P FARM947.SK)) TAKE.1043.V) FAMILY950.SK
              (AT.P-ARG FARM947.SK))
             ** E953.SK)
	(:ROLES
		(!R1 (FAMILY950.SK INANIMATE_OBJECT.N))
		(!R2 (FARM947.SK LOCATION.N))
		(!R3 (NOT (LISA.NAME = FAMILY950.SK)))
		(!R4 (LISA.NAME MAN.N))
		(!R5 (LISA.NAME (PERTAIN-TO FAMILY950.SK)))
		(!R6 (FAMILY950.SK (= LISA.NAME)))
		(!R7 (FAMILY950.SK DAY.N))
		(!R8 (FAMILY950.SK READ.N))
		(!R9 (FAMILY950.SK (IN.P FAMILY950.SK)))
		(!R10 (FAMILY950.SK (PLUR NAIL.N)))
		(!R11 (FAMILY950.SK (= ?X_A)))
		(!R12 (?X_A DAY.N))
		(!R13 (LISA.NAME (PLUR NAIL.N)))
		(!R14 (FAMILY950.SK GIRLFRIEND.N))
		(!R15 (FAMILY950.SK BALL.N))
		(!R16 (FAMILY950.SK ARTIFACT.N))
		(!R17 (FAMILY950.SK SON.N))
		(!R18 (LISA.NAME AGENT.N))
		(!R19 (LISA.NAME BROTHER.N))
		(!R20 (LISA.NAME PERSON.N))
		(!R21 (LISA.NAME (PERTAIN-TO LISA.NAME)))
		(!R22 (KID973.SK SON.N))
		(!R23 (FARM947.SK FARM.N))
		(!R24 (KID973.SK (PERTAIN-TO LISA.NAME)))
		(!R25 (KID973.SK (PLUR KID.N)))
		(!R26 (FAMILY950.SK (PERTAIN-TO LISA.NAME)))
		(!R27 (FAMILY950.SK FAMILY.N))
		(!R28 (DAUGHTER963.SK DAUGHTER.N))
		(!R29 (DAUGHTER963.SK (PERTAIN-TO LISA.NAME)))
		(!R30 (E955.SK (RIGHT-AFTER U254)))
	)
	(:GOALS
		(?G1 (LISA.NAME (WANT.V (THAT (LISA.NAME (HAVE.V FAMILY950.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (LISA.NAME ((ADV-A (AT.P (K SCHOOL.N))) HAVE.V) FAMILY950.SK)))
		(?I2 (LISA.NAME (AT.P FARM947.SK)))
		(?I3 (FAMILY950.SK (AT.P FARM947.SK)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (LISA.NAME ((ADV-A (AT.P (K SCHOOL.N))) HAVE.V) FAMILY950.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E953.SK))
		(!W2 (?I1 PRECOND-OF E953.SK))
		(!W3 (?I2 PRECOND-OF E953.SK))
		(!W4 (?I3 PRECOND-OF E953.SK))
		(!W5 (?P1 POSTCOND-OF E953.SK))
		(!W6 (E953.SK (BEFORE ?X_G)))
		(!W7 (?P1 (BEFORE ?X_I)))
		(!W8 (?P1 (BEFORE ?X_L)))
		(!W9 (?X_K (BEFORE ?X_L)))
		(!W10 (?P1 (BEFORE ?X_P)))
		(!W11 (E955.SK (SAME-TIME ?X_P)))
		(!W12 (E953.SK (BEFORE NOW254)))
		(!W13 (E955.SK (SAME-TIME NOW255)))
		(!W14 (E961.SK (BEFORE NOW255)))
	)
	(:CERTAINTIES
		(!C1 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R19 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R16 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R15 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C7 (!R16 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C10 (!R19 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C11 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C12 (!R19 CERTAIN-TO-DEGREE (/ 1 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.6953125 13)
("Lisa took her family to the farm." "Her kids had a great time."
 "Her daughter then touched the pig." "She laughed." "She had a fun time.")
(EPI-SCHEMA ((LISA.NAME ((ADV-A (TO.P FARM947.SK)) TAKE.1044.V) FAMILY950.SK
              (AT.P-ARG FARM947.SK))
             ** E953.SK)
	(:ROLES
		(!R1 (FAMILY950.SK INANIMATE_OBJECT.N))
		(!R2 (FARM947.SK LOCATION.N))
		(!R3 (NOT (LISA.NAME = FAMILY950.SK)))
		(!R4 (LISA.NAME MAN.N))
		(!R5 (LISA.NAME (PERTAIN-TO FAMILY950.SK)))
		(!R6 (?X_B (= LISA.NAME)))
		(!R7 (?X_B DAY.N))
		(!R8 (FAMILY950.SK BALL.N))
		(!R9 (?P1 (RIGHT-AFTER ?X_A)))
		(!R10 (LISA.NAME BROTHER.N))
		(!R11 (LISA.NAME PERSON.N))
		(!R12 (LISA.NAME AGENT.N))
		(!R13 (LISA.NAME (PERTAIN-TO LISA.NAME)))
		(!R14 (FAMILY950.SK SON.N))
		(!R15 (KID973.SK SON.N))
		(!R16 (FARM947.SK FARM.N))
		(!R17 (KID973.SK (PERTAIN-TO LISA.NAME)))
		(!R18 (KID973.SK (PLUR KID.N)))
		(!R19 (FAMILY950.SK (PERTAIN-TO LISA.NAME)))
		(!R20 (FAMILY950.SK FAMILY.N))
		(!R21 (DAUGHTER963.SK DAUGHTER.N))
		(!R22 (DAUGHTER963.SK (PERTAIN-TO LISA.NAME)))
	)
	(:GOALS
		(?G1 (LISA.NAME (WANT.V (THAT (LISA.NAME (HAVE.V FAMILY950.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (LISA.NAME HAVE.V FAMILY950.SK)))
		(?I2 (LISA.NAME (AT.P FARM947.SK)))
		(?I3 (FAMILY950.SK (AT.P FARM947.SK)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (LISA.NAME HAVE.V FAMILY950.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E953.SK))
		(!W2 (?I1 PRECOND-OF E953.SK))
		(!W3 (?I2 PRECOND-OF E953.SK))
		(!W4 (?I3 PRECOND-OF E953.SK))
		(!W5 (?P1 POSTCOND-OF E953.SK))
		(!W6 (E953.SK (BEFORE ?X_G)))
		(!W7 (?P1 (SAME-TIME ?X_M)))
		(!W8 (?X_L (BEFORE ?X_M)))
		(!W9 (E953.SK (BEFORE NOW254)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R11 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.6953125 10)
("Lisa took her family to the farm." "Her kids had a great time."
 "Her daughter then touched the pig." "She laughed." "She had a fun time.")
(EPI-SCHEMA ((LISA.NAME ((ADV-A (TO.P FARM947.SK)) TAKE.1045.V) FAMILY950.SK
              (AT.P-ARG FARM947.SK))
             ** E953.SK)
	(:ROLES
		(!R1 (FAMILY950.SK INANIMATE_OBJECT.N))
		(!R2 (FARM947.SK LOCATION.N))
		(!R3 (NOT (LISA.NAME = FAMILY950.SK)))
		(!R4 (LISA.NAME MAN.N))
		(!R5 (FAMILY950.SK (PERTAIN-TO FAMILY950.SK)))
		(!R6 (FAMILY950.SK BROTHER.N))
		(!R7 (?X_A (= LISA.NAME)))
		(!R8 (LISA.NAME AGENT.N))
		(!R9 (?X_A DAY.N))
		(!R10 (FAMILY950.SK READ.N))
		(!R11 (FAMILY950.SK (IN.P ?X_A)))
		(!R12 (FAMILY950.SK AGENT.N))
		(!R13 (FAMILY950.SK FAMILY.N))
		(!R14 (FAMILY950.SK (PERTAIN-TO LISA.NAME)))
		(!R15 (KID973.SK (PERTAIN-TO LISA.NAME)))
		(!R16 (KID973.SK (PLUR KID.N)))
		(!R17 (DAUGHTER963.SK DAUGHTER.N))
		(!R18 (DAUGHTER963.SK (PERTAIN-TO LISA.NAME)))
		(!R19 (FARM947.SK FARM.N))
	)
	(:GOALS
		(?G1 (LISA.NAME (WANT.V (THAT (LISA.NAME (HAVE.V FAMILY950.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (LISA.NAME ((ADV-A (AT.P (K SCHOOL.N))) HAVE.V) FAMILY950.SK)))
		(?I2 (LISA.NAME (AT.P FARM947.SK)))
		(?I3 (FAMILY950.SK (AT.P FARM947.SK)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (LISA.NAME ((ADV-A (AT.P (K SCHOOL.N))) HAVE.V) FAMILY950.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E953.SK))
		(!W2 (?I1 PRECOND-OF E953.SK))
		(!W3 (?I2 PRECOND-OF E953.SK))
		(!W4 (?I3 PRECOND-OF E953.SK))
		(!W5 (?P1 POSTCOND-OF E953.SK))
		(!W6 (E953.SK (BEFORE ?X_G)))
		(!W7 (?P1 (BEFORE ?X_I)))
		(!W8 (E953.SK (BEFORE NOW254)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.6953125 8)
("Lisa took her family to the farm." "Her kids had a great time."
 "Her daughter then touched the pig." "She laughed." "She had a fun time.")
(EPI-SCHEMA ((LISA.NAME ((ADV-A (TO.P FARM947.SK)) TAKE.1046.V) FAMILY950.SK
              (AT.P-ARG FARM947.SK))
             ** E953.SK)
	(:ROLES
		(!R1 (LISA.NAME AGENT.N))
		(!R2 (FAMILY950.SK INANIMATE_OBJECT.N))
		(!R3 (FARM947.SK LOCATION.N))
		(!R4 (NOT (LISA.NAME = FAMILY950.SK)))
		(!R5 (LISA.NAME MAN.N))
		(!R6 (FAMILY950.SK (PERTAIN-TO FAMILY950.SK)))
		(!R7 (FAMILY950.SK BROTHER.N))
		(!R8 (?X_B (= LISA.NAME)))
		(!R9 (?X_B DAY.N))
		(!R10 (FAMILY950.SK FAMILY.N))
		(!R11 (FAMILY950.SK (PERTAIN-TO LISA.NAME)))
		(!R12 (KID973.SK (PERTAIN-TO LISA.NAME)))
		(!R13 (KID973.SK (PLUR KID.N)))
		(!R14 (DAUGHTER963.SK DAUGHTER.N))
		(!R15 (DAUGHTER963.SK (PERTAIN-TO LISA.NAME)))
		(!R16 (FARM947.SK FARM.N))
	)
	(:GOALS
		(?G1 (LISA.NAME (WANT.V (THAT (LISA.NAME (HAVE.V FAMILY950.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (LISA.NAME HAVE.V FAMILY950.SK)))
		(?I2 (LISA.NAME (AT.P FARM947.SK)))
		(?I3 (FAMILY950.SK (AT.P FARM947.SK)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (LISA.NAME HAVE.V FAMILY950.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E953.SK))
		(!W2 (?I1 PRECOND-OF E953.SK))
		(!W3 (?I2 PRECOND-OF E953.SK))
		(!W4 (?I3 PRECOND-OF E953.SK))
		(!W5 (?P1 POSTCOND-OF E953.SK))
		(!W6 (E953.SK (BEFORE ?X_G)))
		(!W7 (E953.SK (BEFORE NOW254)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.6953125 16)
("Lisa took her family to the farm." "Her kids had a great time."
 "Her daughter then touched the pig." "She laughed." "She had a fun time.")
(EPI-SCHEMA ((LISA.NAME ((ADV-A (TO.P FARM947.SK)) TAKE.1047.V) FAMILY950.SK
              (AT.P-ARG FARM947.SK))
             ** E953.SK)
	(:ROLES
		(!R1 (FAMILY950.SK INANIMATE_OBJECT.N))
		(!R2 (FARM947.SK LOCATION.N))
		(!R3 (NOT (LISA.NAME = FAMILY950.SK)))
		(!R4 (LISA.NAME MAN.N))
		(!R5 (FAMILY950.SK (PERTAIN-TO FAMILY950.SK)))
		(!R6 (FAMILY950.SK BROTHER.N))
		(!R7 (KID973.SK (= LISA.NAME)))
		(!R8 (LISA.NAME AGENT.N))
		(!R9 (KID973.SK DAY.N))
		(!R10 (FAMILY950.SK READ.N))
		(!R11 (FAMILY950.SK (IN.P KID973.SK)))
		(!R12 (FAMILY950.SK AGENT.N))
		(!R13 (KID973.SK (PLUR NAIL.N)))
		(!R14 (KID973.SK (= ?X_A)))
		(!R15 (?X_A DAY.N))
		(!R16 (FAMILY950.SK (PLUR NAIL.N)))
		(!R17 (FAMILY950.SK GIRLFRIEND.N))
		(!R18 (FARM947.SK FARM.N))
		(!R19 (KID973.SK (PERTAIN-TO LISA.NAME)))
		(!R20 (KID973.SK (PLUR KID.N)))
		(!R21 (FAMILY950.SK (PERTAIN-TO LISA.NAME)))
		(!R22 (FAMILY950.SK FAMILY.N))
		(!R23 (DAUGHTER963.SK DAUGHTER.N))
		(!R24 (DAUGHTER963.SK (PERTAIN-TO LISA.NAME)))
	)
	(:GOALS
		(?G1 (LISA.NAME (WANT.V (THAT (LISA.NAME (HAVE.V FAMILY950.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (LISA.NAME ((ADV-A (AT.P (K SCHOOL.N))) HAVE.V) FAMILY950.SK)))
		(?I2 (LISA.NAME (AT.P FARM947.SK)))
		(?I3 (FAMILY950.SK (AT.P FARM947.SK)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (LISA.NAME ((ADV-A (AT.P (K SCHOOL.N))) HAVE.V) FAMILY950.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E953.SK))
		(!W2 (?I1 PRECOND-OF E953.SK))
		(!W3 (?I2 PRECOND-OF E953.SK))
		(!W4 (?I3 PRECOND-OF E953.SK))
		(!W5 (?P1 POSTCOND-OF E953.SK))
		(!W6 (E953.SK (BEFORE ?X_G)))
		(!W7 (?P1 (BEFORE ?X_I)))
		(!W8 (?P1 (BEFORE ?X_L)))
		(!W9 (?X_K (BEFORE ?X_L)))
		(!W10 (E953.SK (BEFORE NOW254)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 52:
	; "Ethan went to Haiti."
	; "He wanted to look like the people."
	; "He went to a market to get clothes."
	; "He saw some sandals."
	; "He bought them."
; best schemas are:
; GO.658.V
; GO.671.V
; TAKE.928.V
; GO.1083.V
; GO.123.V
; COME.605.V
(setf matches (append matches '(( (4.5 7)
("Ethan went to Haiti." "He wanted to look like the people."
 "He went to a market to get clothes." "He saw some sandals." "He bought them.")
(EPI-SCHEMA ((ETHAN.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_A)) PLAY.V))))
               ((ADV-A (TO.P HAITI.NAME)) ((ADV-A (FROM.P ?L1)) GO.1048.V)))
              HAITI.NAME)
             ** E975.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (HAITI.NAME LOCATION.N))
		(!R4 (NOT (?L1 = HAITI.NAME)))
		(!R5 (?X_A HOME.N))
		(!R6 (?X_A (PERTAIN-TO ETHAN.NAME)))
		(!R7 (ETHAN.NAME GIRL.N))
		(!R8 (ETHAN.NAME FROG.N))
		(!R9 (ETHAN.NAME PERSON.N))
		(!R10 (ETHAN.NAME GIANT.A))
		(!R11 (?X_A (PLUR FRIEND.N)))
		(!R12 (?X_B (PLUR GIRL.N)))
		(!R13 (?X_A (PERTAIN-TO ?X_B)))
		(!R14 (PERSON978.SK (PLUR PERSON.N)))
	)
	(:GOALS
		(E979.SK (ETHAN.NAME (WANT.V (KA ((ADV-A (AT.P HAITI.NAME)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ETHAN.NAME (AT.P ?L1)))
		(?I2 (NOT (ETHAN.NAME (AT.P HAITI.NAME))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ETHAN.NAME (AT.P ?L1))))
		(?P2 (ETHAN.NAME (AT.P HAITI.NAME)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E975.SK))
		(!W2 (?I2 BEFORE E975.SK))
		(!W3 (?P1 AFTER E975.SK))
		(!W4 (?P2 AFTER E975.SK))
		(!W5 (E979.SK CAUSE-OF E975.SK))
		(!W6 (E975.SK (BEFORE ?X_E)))
		(!W7 (E975.SK (BEFORE NOW259)))
		(!W8 (E979.SK (BEFORE NOW260)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.5 7)
("Ethan went to Haiti." "He wanted to look like the people."
 "He went to a market to get clothes." "He saw some sandals." "He bought them.")
(EPI-SCHEMA ((ETHAN.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_A)) PLAY.V))))
               ((ADV-A (TO.P HAITI.NAME)) ((ADV-A (FROM.P ?L1)) GO.1049.V)))
              HAITI.NAME)
             ** E975.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (HAITI.NAME LOCATION.N))
		(!R4 (NOT (?L1 = HAITI.NAME)))
		(!R5 (?X_A (PLUR FRIEND.N)))
		(!R6 (?X_A HOME.N))
		(!R7 (?X_A (PERTAIN-TO ETHAN.NAME)))
		(!R8 (ETHAN.NAME GIRL.N))
		(!R9 (?X_A (PERTAIN-TO ?X_B)))
		(!R10 (ETHAN.NAME GIANT.A))
		(!R11 (ETHAN.NAME FROG.N))
		(!R12 (ETHAN.NAME PERSON.N))
		(!R13 (?X_A (PLUR GIRL.N)))
		(!R14 (?X_C (PERTAIN-TO ?X_A)))
		(!R15 (?X_C (PLUR FRIEND.N)))
		(!R16 (PERSON978.SK (PLUR PERSON.N)))
	)
	(:GOALS
		(E979.SK (ETHAN.NAME (WANT.V (KA ((ADV-A (AT.P HAITI.NAME)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ETHAN.NAME (AT.P ?L1)))
		(?I2 (NOT (ETHAN.NAME (AT.P HAITI.NAME))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ETHAN.NAME (AT.P ?L1))))
		(?P2 (ETHAN.NAME (AT.P HAITI.NAME)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E975.SK))
		(!W2 (?I2 BEFORE E975.SK))
		(!W3 (?P1 AFTER E975.SK))
		(!W4 (?P2 AFTER E975.SK))
		(!W5 (E979.SK CAUSE-OF E975.SK))
		(!W6 (E975.SK (BEFORE ?X_E)))
		(!W7 (E975.SK (BEFORE NOW259)))
		(!W8 (E979.SK (BEFORE NOW260)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.5 4)
("Ethan went to Haiti." "He wanted to look like the people."
 "He went to a market to get clothes." "He saw some sandals." "He bought them.")
(EPI-SCHEMA ((ETHAN.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_A)) LOOK.V))))
               ((ADV-A (TO.P HAITI.NAME)) ((ADV-A (FROM.P ?L1)) GO.1051.V)))
              HAITI.NAME)
             ** E975.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (HAITI.NAME LOCATION.N))
		(!R4 (NOT (?L1 = HAITI.NAME)))
		(!R5 (?X_A (PLUR CLOTHE.N)))
		(!R6 (ETHAN.NAME MAN.N))
		(!R7 (?X_B (PERTAIN-TO ETHAN.NAME)))
		(!R8 (?X_B WIFE.N))
		(!R9 (PERSON978.SK (PLUR PERSON.N)))
	)
	(:GOALS
		(E979.SK (ETHAN.NAME (WANT.V (KA ((ADV-A (AT.P HAITI.NAME)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ETHAN.NAME (AT.P ?L1)))
		(?I2 (NOT (ETHAN.NAME (AT.P HAITI.NAME))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ETHAN.NAME (AT.P ?L1))))
		(?P2 (ETHAN.NAME (AT.P HAITI.NAME)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E975.SK))
		(!W2 (?I2 BEFORE E975.SK))
		(!W3 (?P1 AFTER E975.SK))
		(!W4 (?P2 AFTER E975.SK))
		(!W5 (E979.SK CAUSE-OF E975.SK))
		(!W6 (E975.SK (BEFORE ?X_E)))
		(!W7 (E975.SK (BEFORE NOW259)))
		(!W8 (E979.SK (BEFORE NOW260)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.5 4)
("Ethan went to Haiti." "He wanted to look like the people."
 "He went to a market to get clothes." "He saw some sandals." "He bought them.")
(EPI-SCHEMA ((ETHAN.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_A)) LOOK.V))))
               ((ADV-A (TO.P HAITI.NAME)) ((ADV-A (FROM.P ?L1)) GO.1052.V)))
              HAITI.NAME)
             ** E975.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (HAITI.NAME LOCATION.N))
		(!R4 (NOT (?L1 = HAITI.NAME)))
		(!R5 (?X_A (PLUR CLOTHE.N)))
		(!R6 (?X_B WIFE.N))
		(!R7 (?X_B ((NN HEAD.N) ITCH.N)))
		(!R8 (?X_B (PERTAIN-TO ETHAN.NAME)))
		(!R9 (ETHAN.NAME MAN.N))
		(!R10 (PERSON978.SK (PLUR PERSON.N)))
	)
	(:GOALS
		(E979.SK (ETHAN.NAME (WANT.V (KA ((ADV-A (AT.P HAITI.NAME)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ETHAN.NAME (AT.P ?L1)))
		(?I2 (NOT (ETHAN.NAME (AT.P HAITI.NAME))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ETHAN.NAME (AT.P ?L1))))
		(?P2 (ETHAN.NAME (AT.P HAITI.NAME)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E975.SK))
		(!W2 (?I2 BEFORE E975.SK))
		(!W3 (?P1 AFTER E975.SK))
		(!W4 (?P2 AFTER E975.SK))
		(!W5 (E979.SK CAUSE-OF E975.SK))
		(!W6 (E975.SK (BEFORE ?X_E)))
		(!W7 (E975.SK (BEFORE NOW259)))
		(!W8 (E979.SK (BEFORE NOW260)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.5 4)
("Ethan went to Haiti." "He wanted to look like the people."
 "He went to a market to get clothes." "He saw some sandals." "He bought them.")
(EPI-SCHEMA ((ETHAN.NAME
              ((ADV-A (FOR.P (KA VISIT.V)))
               ((ADV-A (TO.P HAITI.NAME)) ((ADV-A (FROM.P ?L1)) COME.1053.V)))
              HAITI.NAME)
             ** E975.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (HAITI.NAME LOCATION.N))
		(!R4 (NOT (?L1 = HAITI.NAME)))
		(!R5 (E975.SK (RIGHT-AFTER ?X_A)))
		(!R6 (ETHAN.NAME FRIEND.N))
		(!R7 (ETHAN.NAME (PERTAIN-TO ?X_B)))
		(!R8 (?X_B AGENT.N))
		(!R9 (?X_C (PERTAIN-TO ?X_B)))
		(!R10 (?X_C (PLUR BROTHER.N)))
		(!R11 (PERSON978.SK (PLUR PERSON.N)))
	)
	(:GOALS
		(E979.SK (ETHAN.NAME (WANT.V (KA ((ADV-A (AT.P HAITI.NAME)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ETHAN.NAME (AT.P ?L1)))
		(?I2 (NOT (ETHAN.NAME (AT.P HAITI.NAME))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ETHAN.NAME (AT.P ?L1))))
		(?P2 (ETHAN.NAME (AT.P HAITI.NAME)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E975.SK))
		(!W2 (?I2 BEFORE E975.SK))
		(!W3 (?P1 AFTER E975.SK))
		(!W4 (?P2 AFTER E975.SK))
		(!W5 (E979.SK CAUSE-OF E975.SK))
		(!W6 (E975.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E979.SK (BEFORE ?X_I)))
		(!W9 (E975.SK (BEFORE NOW259)))
		(!W10 (E979.SK (BEFORE NOW260)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 53:
	; "Tomorrow was father's day."
	; "Jack wanted to get his father a new grill."
	; "Jack went to the store."
	; "Got a nice new grill."
	; "His father loved his new grill."
discarding schema GO.650.V learned from this story
; best schemas are:
; GO.90.V
; GO.591.V
; GO.806.V
; GO.1220.V
; GO.594.V
(setf matches (append matches '(( (5.0 3)
("Tomorrow was father's day." "Jack wanted to get his father a new grill."
 "Jack went to the store." "Got a nice new grill."
 "His father loved his new grill.")
(EPI-SCHEMA ((JACK.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE996.SK)) ((ADV-A (FROM.P ?L1)) GO.1054.V)))
              STORE996.SK)
             ** E997.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE996.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE996.SK)))
		(!R4 (JACK.NAME AGENT.N))
		(!R5 (STORE996.SK STORE.N))
		(!R6 (FATHER993.SK (PERTAIN-TO JACK.NAME)))
		(!R7 (FATHER993.SK FATHER.N))
		(!R8 (OBJECT1003.SK (PERTAIN-TO FATHER993.SK)))
	)
	(:GOALS
		(E994.SK (JACK.NAME (WANT.V (KA ((ADV-A (AT.P STORE996.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JACK.NAME (AT.P ?L1)))
		(?I2 (NOT (JACK.NAME (AT.P STORE996.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JACK.NAME (AT.P ?L1))))
		(?P2 (JACK.NAME (AT.P STORE996.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E997.SK))
		(!W2 (?I2 BEFORE E997.SK))
		(!W3 (?P1 AFTER E997.SK))
		(!W4 (?P2 AFTER E997.SK))
		(!W5 (E994.SK CAUSE-OF E997.SK))
		(!W6 (E997.SK (BEFORE ?X_D)))
		(!W7 (E994.SK (BEFORE NOW265)))
		(!W8 (E997.SK (BEFORE NOW266)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.5 7)
("Tomorrow was father's day." "Jack wanted to get his father a new grill."
 "Jack went to the store." "Got a nice new grill."
 "His father loved his new grill.")
(EPI-SCHEMA ((JACK.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE996.SK)) GO.1055.V))
              STORE996.SK)
             ** E997.SK)
	(:ROLES
		(!R1 (JACK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE996.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE996.SK)))
		(!R5 (JACK.NAME CAT.N))
		(!R6 (JACK.NAME NEW.A))
		(!R7 (STORE996.SK ((NN PET.N) STORE.N)))
		(!R8 (FATHER993.SK CAT.N))
		(!R9 (FATHER993.SK NICE.A))
		(!R10 (STORE996.SK STORE.N))
		(!R11 (FATHER993.SK FATHER.N))
		(!R12 (FATHER993.SK (PERTAIN-TO JACK.NAME)))
		(!R13 (OBJECT1003.SK (PERTAIN-TO FATHER993.SK)))
	)
	(:GOALS
		(E994.SK (JACK.NAME (WANT.V (KA ((ADV-A (AT.P STORE996.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JACK.NAME (AT.P ?L1)))
		(?I2 (NOT (JACK.NAME (AT.P STORE996.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JACK.NAME (AT.P ?L1))))
		(?P2 (JACK.NAME (AT.P STORE996.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E997.SK))
		(!W2 (?I2 BEFORE E997.SK))
		(!W3 (?P1 AFTER E997.SK))
		(!W4 (?P2 AFTER E997.SK))
		(!W5 (E994.SK CAUSE-OF E997.SK))
		(!W6 (E997.SK (BEFORE ?X_E)))
		(!W7 (E994.SK (BEFORE NOW265)))
		(!W8 (E997.SK (BEFORE NOW266)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0 3)
("Tomorrow was father's day." "Jack wanted to get his father a new grill."
 "Jack went to the store." "Got a nice new grill."
 "His father loved his new grill.")
(EPI-SCHEMA ((JACK.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE996.SK)) GO.1057.V))
              STORE996.SK)
             ** E997.SK)
	(:ROLES
		(!R1 (JACK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE996.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE996.SK)))
		(!R5 (STORE996.SK STORE.N))
		(!R6 (FATHER993.SK (PERTAIN-TO JACK.NAME)))
		(!R7 (FATHER993.SK FATHER.N))
		(!R8 (OBJECT1003.SK (PERTAIN-TO FATHER993.SK)))
	)
	(:GOALS
		(E994.SK (JACK.NAME (WANT.V (KA ((ADV-A (AT.P STORE996.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JACK.NAME (AT.P ?L1)))
		(?I2 (NOT (JACK.NAME (AT.P STORE996.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JACK.NAME (AT.P ?L1))))
		(?P2 (JACK.NAME (AT.P STORE996.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E997.SK))
		(!W2 (?I2 BEFORE E997.SK))
		(!W3 (?P1 AFTER E997.SK))
		(!W4 (?P2 AFTER E997.SK))
		(!W5 (E994.SK CAUSE-OF E997.SK))
		(!W6 (E997.SK (BEFORE ?X_D)))
		(!W7 (E994.SK (BEFORE NOW265)))
		(!W8 (E997.SK (BEFORE NOW266)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0 3)
("Tomorrow was father's day." "Jack wanted to get his father a new grill."
 "Jack went to the store." "Got a nice new grill."
 "His father loved his new grill.")
(EPI-SCHEMA ((JACK.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE996.SK)) GO.1057.V))
              STORE996.SK)
             ** E997.SK)
	(:ROLES
		(!R1 (JACK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE996.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE996.SK)))
		(!R5 (STORE996.SK STORE.N))
		(!R6 (FATHER993.SK (PERTAIN-TO JACK.NAME)))
		(!R7 (FATHER993.SK FATHER.N))
		(!R8 (OBJECT1003.SK (PERTAIN-TO FATHER993.SK)))
	)
	(:GOALS
		(E994.SK (JACK.NAME (WANT.V (KA ((ADV-A (AT.P STORE996.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JACK.NAME (AT.P ?L1)))
		(?I2 (NOT (JACK.NAME (AT.P STORE996.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JACK.NAME (AT.P ?L1))))
		(?P2 (JACK.NAME (AT.P STORE996.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E997.SK))
		(!W2 (?I2 BEFORE E997.SK))
		(!W3 (?P1 AFTER E997.SK))
		(!W4 (?P2 AFTER E997.SK))
		(!W5 (E994.SK CAUSE-OF E997.SK))
		(!W6 (E997.SK (BEFORE ?X_D)))
		(!W7 (E994.SK (BEFORE NOW265)))
		(!W8 (E997.SK (BEFORE NOW266)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 54:
	; "The newspaper was outside."
	; "My dad got home from work."
	; "He got out of his car."
	; "He picked the newspaper up."
	; "He took it inside the house."
discarding schema GET.660.V learned from this story
; best schemas are:
; TAKE.624.V
; TAKE.928.V
; GET.460.V
; GET.413.V
; TAKE.946.V
(setf matches (append matches '(( (4.0 8)
("The newspaper was outside." "My dad got home from work."
 "He got out of his car." "He picked the newspaper up."
 "He took it inside the house.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (INSIDE.P HOUSE1018.SK))
               ((ADV-A (TO.P ?X_A)) TAKE.1058.V))
              IT.PRO (AT.P-ARG ?L))
             ** E1019.SK)
	(:ROLES
		(!R1 (IT.PRO INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = IT.PRO)))
		(!R4 (IT.PRO FAMILY.N))
		(!R5 (IT.PRO (PERTAIN-TO HE.PRO)))
		(!R6 (?X_A FARM.N))
		(!R7 (DAD1009.SK (PLUR KID.N)))
		(!R8 (DAD1009.SK DAUGHTER.N))
		(!R9 (DAD1009.SK (PERTAIN-TO HE.PRO)))
		(!R10 (HOUSE1018.SK HOUSE.N))
		(!R11 (HE.PRO MALE.A))
		(!R12 (HE.PRO AGENT.N))
		(!R13 (DAD1009.SK DAD.N))
		(!R14 (DAD1009.SK RELATIVE.N))
		(!R15 (DAD1009.SK (PERTAIN-TO ME.PRO)))
		(!R16 (CAR1013.SK (PERTAIN-TO DAD1009.SK)))
		(!R17 (CAR1013.SK CAR.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V IT.PRO))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V IT.PRO)))
		(?I2 (HE.PRO (AT.P ?L)))
		(?I3 (IT.PRO (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V IT.PRO))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1019.SK))
		(!W2 (?I1 PRECOND-OF E1019.SK))
		(!W3 (?I2 PRECOND-OF E1019.SK))
		(!W4 (?I3 PRECOND-OF E1019.SK))
		(!W5 (?P1 POSTCOND-OF E1019.SK))
		(!W6 (E1019.SK (BEFORE ?X_G)))
		(!W7 (E1019.SK (BEFORE NOW273)))
	)
	(:CERTAINTIES
		(!C1 (!R14 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R13 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R14 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R13 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (6.0884376 20)
("The newspaper was outside." "My dad got home from work."
 "He got out of his car." "He picked the newspaper up."
 "He took it inside the house.")
(EPI-SCHEMA ((HE.PRO ((ADV-A (INSIDE.P HOUSE1018.SK)) TAKE.1059.V) IT.PRO
              (AT.P-ARG ?X_C))
             ** E1019.SK)
	(:ROLES
		(!R1 (IT.PRO INANIMATE_OBJECT.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (HE.PRO = IT.PRO)))
		(!R4 (HE.PRO MAN.N))
		(!R5 (HE.PRO (PERTAIN-TO IT.PRO)))
		(!R6 (DAD1009.SK (= HE.PRO)))
		(!R7 (?X_C FARM.N))
		(!R8 (DAD1009.SK DAY.N))
		(!R9 (IT.PRO READ.N))
		(!R10 (IT.PRO (IN.P DAD1009.SK)))
		(!R11 (DAD1009.SK (PLUR NAIL.N)))
		(!R12 (DAD1009.SK (= ?X_A)))
		(!R13 (?X_A DAY.N))
		(!R14 (DAD1009.SK (PERTAIN-TO HE.PRO)))
		(!R15 (HE.PRO (PERTAIN-TO HE.PRO)))
		(!R16 (HE.PRO (PLUR NAIL.N)))
		(!R17 (IT.PRO (PERTAIN-TO HE.PRO)))
		(!R18 (IT.PRO GIRLFRIEND.N))
		(!R19 (IT.PRO BALL.N))
		(!R20 (IT.PRO ARTIFACT.N))
		(!R21 (DAD1009.SK SON.N))
		(!R22 (DAD1009.SK (PERTAIN-TO DAD1009.SK)))
		(!R23 (DAD1009.SK AGENT.N))
		(!R24 (HE.PRO BROTHER.N))
		(!R25 (HE.PRO PERSON.N))
		(!R26 (HE.PRO (PERTAIN-TO DAD1009.SK)))
		(!R27 (CAR1013.SK SON.N))
		(!R28 (HOUSE1018.SK HOUSE.N))
		(!R29 (HE.PRO MALE.A))
		(!R30 (HE.PRO AGENT.N))
		(!R31 (E1005.SK (RIGHT-AFTER U268)))
		(!R32 (DAD1009.SK DAD.N))
		(!R33 (DAD1009.SK RELATIVE.N))
		(!R34 (CAR1013.SK (PERTAIN-TO DAD1009.SK)))
		(!R35 (CAR1013.SK CAR.N))
		(!R36 (DAD1009.SK (PERTAIN-TO ME.PRO)))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V IT.PRO))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO ((ADV-A (AT.P (K SCHOOL.N))) HAVE.V) IT.PRO)))
		(?I2 (HE.PRO (AT.P ?X_C)))
		(?I3 (IT.PRO (AT.P ?X_C)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (HE.PRO ((ADV-A (AT.P (K SCHOOL.N))) HAVE.V) IT.PRO))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1019.SK))
		(!W2 (?I1 PRECOND-OF E1019.SK))
		(!W3 (?I2 PRECOND-OF E1019.SK))
		(!W4 (?I3 PRECOND-OF E1019.SK))
		(!W5 (?P1 POSTCOND-OF E1019.SK))
		(!W6 (E1019.SK (BEFORE ?X_G)))
		(!W7 (?P1 (BEFORE ?X_I)))
		(!W8 (?P1 (BEFORE ?X_L)))
		(!W9 (?X_K (BEFORE ?X_L)))
		(!W10 (?P1 (BEFORE ?X_P)))
		(!W11 (E1005.SK (SAME-TIME ?X_P)))
		(!W12 (E1019.SK (BEFORE NOW273)))
		(!W13 (E1005.SK (SAME-TIME NOW269)))
		(!W14 (E1022.SK (BEFORE NOW269)))
	)
	(:CERTAINTIES
		(!C1 (!R25 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R24 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R19 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C7 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R25 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C10 (!R24 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C11 (!R25 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C12 (!R24 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C13 (!R33 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C14 (!R21 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C15 (!R32 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C16 (!R33 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C17 (!R21 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C18 (!R33 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C19 (!R21 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C20 (!R33 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C21 (!R32 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C22 (!R33 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C23 (!R33 CERTAIN-TO-DEGREE (/ 2 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.046113 4)
("The newspaper was outside." "My dad got home from work."
 "He got out of his car." "He picked the newspaper up."
 "He took it inside the house.")
(EPI-SCHEMA ((DAD1009.SK ((ADV-A (FROM.P (K WORK.N))) GET.1060.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E1008.SK)
	(:ROLES
		(!R1 (DAD1009.SK AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (DAD1009.SK = (K HOME.N))))
		(!R5 (DAD1009.SK WIFE.N))
		(!R6 (DAD1009.SK (PERTAIN-TO DAD1009.SK)))
		(!R7 (E1008.SK (RIGHT-AFTER U269)))
		(!R8 (DAD1009.SK DAD.N))
		(!R9 (DAD1009.SK PERSON.N))
		(!R10 (DAD1009.SK (PERTAIN-TO ME.PRO)))
		(!R11 (CAR1013.SK (PERTAIN-TO DAD1009.SK)))
		(!R12 (CAR1013.SK CAR.N))
	)
	(:GOALS
		(?G1 (DAD1009.SK (WANT.V (THAT (DAD1009.SK (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (DAD1009.SK HAVE.V (K HOME.N))))
		(?I2 (DAD1009.SK (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (DAD1009.SK HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1008.SK))
		(!W2 (?I1 PRECOND-OF E1008.SK))
		(!W3 (?I2 PRECOND-OF E1008.SK))
		(!W4 (?I3 PRECOND-OF E1008.SK))
		(!W5 (?P1 POSTCOND-OF E1008.SK))
		(!W6 (E1008.SK (BEFORE ?X_D)))
		(!W7 (E1008.SK (SAME-TIME NOW270)))
		(!W8 (E1011.SK (BEFORE NOW270)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.546113 7)
("The newspaper was outside." "My dad got home from work."
 "He got out of his car." "He picked the newspaper up."
 "He took it inside the house.")
(EPI-SCHEMA ((DAD1009.SK ((ADV-A (FROM.P (K WORK.N))) GET.1061.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E1008.SK)
	(:ROLES
		(!R1 (DAD1009.SK AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (DAD1009.SK = (K HOME.N))))
		(!R5 ((K HOME.N) CALL.N))
		(!R6 (DAD1009.SK PLACE.N))
		(!R7 (DAD1009.SK HOUSE.N))
		(!R8 (ME.PRO MALE.A))
		(!R9 (ME.PRO AGENT.N))
		(!R10 (E1008.SK (RIGHT-AFTER U269)))
		(!R11 (DAD1009.SK DAD.N))
		(!R12 (DAD1009.SK (PERTAIN-TO ME.PRO)))
		(!R13 (CAR1013.SK (PERTAIN-TO DAD1009.SK)))
		(!R14 (CAR1013.SK CAR.N))
	)
	(:GOALS
		(?G1 (DAD1009.SK (WANT.V (THAT (DAD1009.SK (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (DAD1009.SK HAVE.V (K HOME.N))))
		(?I2 (DAD1009.SK (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (DAD1009.SK HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1008.SK))
		(!W2 (?I1 PRECOND-OF E1008.SK))
		(!W3 (?I2 PRECOND-OF E1008.SK))
		(!W4 (?I3 PRECOND-OF E1008.SK))
		(!W5 (?P1 POSTCOND-OF E1008.SK))
		(!W6 (E1008.SK (BEFORE ?X_E)))
		(!W7 (E1008.SK (SAME-TIME NOW270)))
		(!W8 (E1011.SK (BEFORE NOW270)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 55:
	; "The man heard his phone ring."
	; "He didn't know where it was."
	; "He followed the sound."
	; "He found his phone."
	; "He could not answer it in time."
discarding schema FOLLOW.709.V learned from this story
discarding schema FIND.708.V learned from this story
; best schemas are:
; FIND.1361.V
; SHOP.797.V
; FIND.798.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.626.V
(setf matches (append matches '(( (3.905 1)
("The man heard his phone ring." "He didn't know where it was."
 "He followed the sound." "He found his phone."
 "He could not answer it in time.")
(EPI-SCHEMA ((MAN1024.SK FIND.1063.V RING1027.SK) ** E1040.SK)
	(:ROLES
		(!R1 (MAN1024.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (RING1027.SK ((NN GAS.N) STATION.N)))
		(!R4 (RING1027.SK ((NN PHONE.N) RING.N)))
		(!R5 (RING1027.SK PHONE.N))
		(!R6 (MAN1024.SK MAN.N))
		(!R7 (RING1027.SK (PERTAIN-TO MAN1024.SK)))
	)
	(:PRECONDS
		(?I1 (MAN1024.SK (AT.P ?L)))
		(?I2 (RING1027.SK (AT.P ?L)))
		(?I3 (MAN1024.SK ((ADV-A (FOR.P RING1027.SK)) SEARCH.V)))
		(?I4 (NOT (MAN1024.SK (KNOW.V (THAT (RING1027.SK (AT.P ?L)))))))
		(?I5 (NOT (MAN1024.SK (HAVE.V RING1027.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1024.SK (KNOW.V (THAT (RING1027.SK (AT.P ?L))))))
		(?P2 (MAN1024.SK (HAVE.V RING1027.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1040.SK (BEFORE ?X_E)))
		(!W2 (E1040.SK (BEFORE NOW277)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 0)
("The man heard his phone ring." "He didn't know where it was."
 "He followed the sound." "He found his phone."
 "He could not answer it in time.")
(EPI-SCHEMA ((MAN1024.SK FIND.1074.V (K (PLUR PANT.N))) ** E1040.SK)
	(:ROLES
		(!R1 (MAN1024.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (?I3 (RIGHT-AFTER ?X_A)))
		(!R4 (RING1027.SK ((NN PHONE.N) RING.N)))
		(!R5 (RING1027.SK PHONE.N))
		(!R6 (MAN1024.SK MAN.N))
		(!R7 (RING1027.SK (PERTAIN-TO MAN1024.SK)))
	)
	(:PRECONDS
		(?I1 (MAN1024.SK (AT.P ?L)))
		(?I2 ((K (PLUR PANT.N)) (AT.P ?L)))
		(?I3 (MAN1024.SK (BE.PASV ((ADV-A (FOR.P (K (PLUR PANT.N)))) SEARCH.V))))
		(?I4 (NOT (MAN1024.SK (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?L)))))))
		(?I5 (NOT (MAN1024.SK (HAVE.V (K (PLUR PANT.N))))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1024.SK (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?L))))))
		(?P2 (MAN1024.SK (HAVE.V (K (PLUR PANT.N)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I3 (SAME-TIME ?X_D)))
		(!W2 (E1040.SK (BEFORE ?X_F)))
		(!W3 (E1040.SK (BEFORE NOW277)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.93625 2)
("The man heard his phone ring." "He didn't know where it was."
 "He followed the sound." "He found his phone."
 "He could not answer it in time.")
(EPI-SCHEMA ((MAN1024.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1075.V
              (KA ((BEFORE.ADV HEAR.V) RING1027.SK)))
             ** ?E)
	(:ROLES
		(!R1 (MAN1024.SK AGENT.N))
		(!R2 ((KA ((BEFORE.ADV HEAR.V) RING1027.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (RING1027.SK SONG.N))
		(!R5 (?X_A (IMPINGES-ON E1023.SK)))
		(!R6 (RING1027.SK ((NN PHONE.N) RING.N)))
		(!R7 (RING1027.SK PHONE.N))
		(!R8 (MAN1024.SK MAN.N))
		(!R9 (RING1027.SK (PERTAIN-TO MAN1024.SK)))
		(!R10 (E1023.SK (RIGHT-AFTER U273)))
	)
	(:GOALS
		(?G1 (MAN1024.SK (WANT.V (THAT (NOT (MAN1024.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN1024.SK (BEFORE.ADV HEAR.V) RING1027.SK)) CAUSE-OF
    (KE (MAN1024.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1023.SK (MAN1024.SK (BEFORE.ADV (BEFORE.ADV HEAR.V)) RING1027.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1023.SK))
		(!W2 (E1023.SK (BEFORE ?X_E)))
		(!W3 (E1023.SK (SAME-TIME NOW274)))
		(!W4 (E1028.SK (BEFORE NOW274)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.93625 2)
("The man heard his phone ring." "He didn't know where it was."
 "He followed the sound." "He found his phone."
 "He could not answer it in time.")
(EPI-SCHEMA ((MAN1024.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1077.V
              (KA ((BEFORE.ADV HEAR.V) RING1027.SK)))
             ** ?E)
	(:ROLES
		(!R1 (MAN1024.SK AGENT.N))
		(!R2 ((KA ((BEFORE.ADV HEAR.V) RING1027.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (RING1027.SK SONG.N))
		(!R5 (?X_A (IMPINGES-ON E1028.SK)))
		(!R6 (MAN1024.SK MAN.N))
		(!R7 (RING1027.SK (PERTAIN-TO MAN1024.SK)))
		(!R8 (RING1027.SK PHONE.N))
		(!R9 (RING1027.SK ((NN PHONE.N) RING.N)))
		(!R10 (E1023.SK (RIGHT-AFTER U273)))
	)
	(:GOALS
		(?G1 (MAN1024.SK (WANT.V (THAT (NOT (MAN1024.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN1024.SK (BEFORE.ADV HEAR.V) RING1027.SK)) CAUSE-OF
    (KE (MAN1024.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1028.SK (MAN1024.SK (BEFORE.ADV (BEFORE.ADV HEAR.V)) RING1027.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1028.SK))
		(!W2 (E1028.SK (BEFORE ?X_E)))
		(!W3 (E1028.SK (BEFORE NOW274)))
		(!W4 (E1023.SK (SAME-TIME NOW274)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 56:
	; "The girl made a dress."
	; "The dress was pretty."
	; "All her friends wanted one."
	; "She made each friend a dress of their own."
	; "He friends each wore the dress at the girl's wedding."
discarding schema MAKE.721.V learned from this story
discarding schema PLAY.724.V learned from this story
; best schemas are:
; GO.658.V
; GO.671.V
; TAKE.928.V
; TAKE.1039.V

; story 57:
	; "Tom loved ice skating."
	; "He invited a friend to do it."
	; "The friend didn't know how."
	; "Tom pushed him too hard."
	; "The friend fell and hurt himself."
discarding schema FALL.734.V learned from this story
; best schemas are:
; GO.658.V
; GO.671.V
; TAKE.928.V
; GET.518.V
; GET.517.V
(setf matches (append matches '(( (3.26625 5)
("Tom loved ice skating." "He invited a friend to do it."
 "The friend didn't know how." "Tom pushed him too hard."
 "The friend fell and hurt himself.")
(EPI-SCHEMA ((FRIEND1066.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FRIEND1066.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.1151.V)))
              ?L2)
             ** E1076.SK)
	(:ROLES
		(!R1 (FRIEND1066.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND1066.SK HOME.N))
		(!R6 (FRIEND1066.SK (PERTAIN-TO FRIEND1066.SK)))
		(!R7 (FRIEND1066.SK GIRL.N))
		(!R8 (FRIEND1066.SK FROG.N))
		(!R9 (FRIEND1066.SK GIANT.A))
		(!R10 (FRIEND1066.SK (PLUR FRIEND.N)))
		(!R11 (?X_B (PLUR GIRL.N)))
		(!R12 (FRIEND1066.SK (PERTAIN-TO ?X_B)))
		(!R13 (E1081.SK (AT-OR-BEFORE NOW288)))
		(!R14 (FRIEND1066.SK FRIEND.N))
		(!R15 (FRIEND1066.SK PERSON.N))
	)
	(:GOALS
		(?G1 (FRIEND1066.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND1066.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND1066.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND1066.SK (AT.P ?L1))))
		(?P2 (FRIEND1066.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1076.SK))
		(!W2 (?I2 BEFORE E1076.SK))
		(!W3 (?P1 AFTER E1076.SK))
		(!W4 (?P2 AFTER E1076.SK))
		(!W5 (?G1 CAUSE-OF E1076.SK))
		(!W6 (E1076.SK (BEFORE ?X_E)))
		(!W7 (E1076.SK (CONSEC E1080.SK)))
		(!W8 (E1080.SK (DURING E1073.SK)))
		(!W9 (E1076.SK (DURING E1073.SK)))
		(!W10 (E1073.SK (BEFORE NOW288)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R14 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C8 (!R14 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C9 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.26625 6)
("Tom loved ice skating." "He invited a friend to do it."
 "The friend didn't know how." "Tom pushed him too hard."
 "The friend fell and hurt himself.")
(EPI-SCHEMA ((FRIEND1066.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FRIEND1066.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.1152.V)))
              ?L2)
             ** E1076.SK)
	(:ROLES
		(!R1 (FRIEND1066.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND1066.SK HOME.N))
		(!R6 (FRIEND1066.SK GIRL.N))
		(!R7 (FRIEND1066.SK (PERTAIN-TO ?X_B)))
		(!R8 (FRIEND1066.SK GIANT.A))
		(!R9 (FRIEND1066.SK FROG.N))
		(!R10 (FRIEND1066.SK (PLUR GIRL.N)))
		(!R11 (FRIEND1066.SK (PERTAIN-TO FRIEND1066.SK)))
		(!R12 (FRIEND1066.SK (PLUR FRIEND.N)))
		(!R13 (E1081.SK (AT-OR-BEFORE NOW288)))
		(!R14 (FRIEND1066.SK FRIEND.N))
		(!R15 (FRIEND1066.SK PERSON.N))
	)
	(:GOALS
		(?G1 (FRIEND1066.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND1066.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND1066.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND1066.SK (AT.P ?L1))))
		(?P2 (FRIEND1066.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1076.SK))
		(!W2 (?I2 BEFORE E1076.SK))
		(!W3 (?P1 AFTER E1076.SK))
		(!W4 (?P2 AFTER E1076.SK))
		(!W5 (?G1 CAUSE-OF E1076.SK))
		(!W6 (E1076.SK (BEFORE ?X_E)))
		(!W7 (E1076.SK (CONSEC E1080.SK)))
		(!W8 (E1080.SK (DURING E1073.SK)))
		(!W9 (E1076.SK (DURING E1073.SK)))
		(!W10 (E1073.SK (BEFORE NOW288)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R14 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C8 (!R14 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C9 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C10 (!R15 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C11 (!R14 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C12 (!R15 CERTAIN-TO-DEGREE (/ 2 5)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 58:
	; "My brother was in a bad mood."
	; "He opened a can of paint."
	; "He splashed it on the ground."
	; "I told him to clean it up."
	; "He refused to clean it up."
; best schemas are:
; TAKE.928.V
; TAKE.1039.V
; GO.658.V
; GO.671.V
; TAKE.542.V
; TAKE.10.V

; story 59:
	; "Mike was at a ball game."
	; "He needed a snack."
	; "He went to buy a snack."
	; "On the way back from getting a snack."
	; "Mike fell down and broke his arm."
discarding schema GO.758.V learned from this story
; best schemas are:
; GO.1024.V
; GO.292.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.539.V
; PLAY.991.V
(setf matches (append matches '(( (5.5 4)
("Mike was at a ball game." "He needed a snack." "He went to buy a snack."
 "On the way back from getting a snack." "Mike fell down and broke his arm.")
(EPI-SCHEMA ((MIKE.NAME
              ((ADV-A (FOR.P (KA (BUY.V SNACK1108.SK))))
               (OUT.ADV
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P GAME1102.SK)) GO.1210.V))))
              ?L2)
             ** E1109.SK)
	(:ROLES
		(!R1 (MIKE.NAME AGENT.N))
		(!R2 (GAME1102.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (GAME1102.SK = ?L2)))
		(!R5 ((KA (BUY.V SNACK1108.SK)) PASS.N))
		(!R6 ((KA (BUY.V SNACK1108.SK)) BALL.N))
		(!R7 (GAME1102.SK ((NN BALL.N) GAME.N)))
		(!R8 (SNACK1108.SK SNACK.N))
		(!R9 (ARM1118.SK (PERTAIN-TO MIKE.NAME)))
		(!R10 (ARM1118.SK ARM.N))
	)
	(:GOALS
		(?G1 (MIKE.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(E1120.SK (MIKE.NAME (AT.P GAME1102.SK)))
		(?I2 (NOT (MIKE.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MIKE.NAME (AT.P GAME1102.SK))))
		(?P2 (MIKE.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1120.SK BEFORE E1109.SK))
		(!W2 (?I2 BEFORE E1109.SK))
		(!W3 (?P1 AFTER E1109.SK))
		(!W4 (?P2 AFTER E1109.SK))
		(!W5 (?G1 CAUSE-OF E1109.SK))
		(!W6 (E1109.SK (BEFORE ?X_E)))
		(!W7 (E1120.SK (BEFORE NOW294)))
		(!W8 (E1109.SK (BEFORE NOW296)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 60:
	; "The cat went to the living room."
	; "There was something funny."
	; "It had a new pillow."
	; "The cat poked the pillow with its paw."
	; "The cat liked the new pillow."
; best schemas are:
; WALK.989.V
; GET.848.V
; GET.1322.V
; GO.591.V
; GET.826.V
; RUN.311.V
(setf matches (append matches '(( (4.9049997 3)
("The cat went to the living room." "There was something funny."
 "It had a new pillow." "The cat poked the pillow with its paw."
 "The cat liked the new pillow.")
(EPI-SCHEMA ((CAT1122.SK
              ((ADV-A (INTO.P ROOM1125.SK))
               ((ADV-A (TO.P ROOM1125.SK)) ((ADV-A (FROM.P ?L1)) WALK.1213.V)))
              ROOM1125.SK)
             ** E1121.SK)
	(:ROLES
		(!R1 (CAT1122.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (ROOM1125.SK LOCATION.N))
		(!R4 (NOT (?L1 = ROOM1125.SK)))
		(!R5 (CAT1122.SK CAT.N))
		(!R6 (PAW1139.SK (PERTAIN-TO CAT1122.SK)))
		(!R7 (PAW1139.SK PAW.N))
		(!R8 (ROOM1125.SK ((NN LIVING.N) ROOM.N)))
		(!R9 (E1121.SK (RIGHT-AFTER U298)))
	)
	(:GOALS
		(?G1 (CAT1122.SK (WANT.V (KA ((ADV-A (AT.P ROOM1125.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT1122.SK (AT.P ?L1)))
		(?I2 (NOT (CAT1122.SK (AT.P ROOM1125.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CAT1122.SK (AT.P ?L1))))
		(?P2 (CAT1122.SK (AT.P ROOM1125.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1121.SK))
		(!W2 (?I2 BEFORE E1121.SK))
		(!W3 (?P1 AFTER E1121.SK))
		(!W4 (?P2 AFTER E1121.SK))
		(!W5 (?G1 CAUSE-OF E1121.SK))
		(!W6 (E1121.SK (SAME-TIME ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1121.SK (SAME-TIME NOW299)))
		(!W9 (E1126.SK (BEFORE NOW299)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 7)
("The cat went to the living room." "There was something funny."
 "It had a new pillow." "The cat poked the pillow with its paw."
 "The cat liked the new pillow.")
(EPI-SCHEMA ((CAT1122.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ROOM1125.SK)) GO.1216.V))
              ROOM1125.SK)
             ** E1121.SK)
	(:ROLES
		(!R1 (CAT1122.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (ROOM1125.SK LOCATION.N))
		(!R4 (NOT (?L1 = ROOM1125.SK)))
		(!R5 (CAT1122.SK NEW.A))
		(!R6 (ROOM1125.SK ((NN PET.N) STORE.N)))
		(!R7 (CAT1122.SK NICE.A))
		(!R8 (CAT1122.SK (PERTAIN-TO CAT1122.SK)))
		(!R9 (ROOM1125.SK ((NN LIVING.N) ROOM.N)))
		(!R10 (E1121.SK (RIGHT-AFTER U298)))
		(!R11 (CAT1122.SK CAT.N))
		(!R12 (PAW1139.SK (PERTAIN-TO CAT1122.SK)))
		(!R13 (PAW1139.SK PAW.N))
	)
	(:GOALS
		(?G1 (CAT1122.SK (WANT.V (KA ((ADV-A (AT.P ROOM1125.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT1122.SK (AT.P ?L1)))
		(?I2 (NOT (CAT1122.SK (AT.P ROOM1125.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CAT1122.SK (AT.P ?L1))))
		(?P2 (CAT1122.SK (AT.P ROOM1125.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1121.SK))
		(!W2 (?I2 BEFORE E1121.SK))
		(!W3 (?P1 AFTER E1121.SK))
		(!W4 (?P2 AFTER E1121.SK))
		(!W5 (?G1 CAUSE-OF E1121.SK))
		(!W6 (E1121.SK (BEFORE ?X_E)))
		(!W7 (E1121.SK (SAME-TIME NOW299)))
		(!W8 (E1126.SK (BEFORE NOW299)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.9049997 4)
("The cat went to the living room." "There was something funny."
 "It had a new pillow." "The cat poked the pillow with its paw."
 "The cat liked the new pillow.")
(EPI-SCHEMA ((CAT1122.SK
              ((ADV-A (ACROSS.P ROOM1125.SK))
               ((ADV-A (TO.P ROOM1125.SK)) ((ADV-A (FROM.P ?L1)) RUN.1230.V)))
              ROOM1125.SK)
             ** E1121.SK)
	(:ROLES
		(!R1 (CAT1122.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (ROOM1125.SK LOCATION.N))
		(!R4 (NOT (?L1 = ROOM1125.SK)))
		(!R5 (CAT1122.SK MOUSE.N))
		(!R6 (ROOM1125.SK ROOM.N))
		(!R7 (ROOM1125.SK (PERTAIN-TO ?X_B)))
		(!R8 (?X_B MAN.N))
		(!R9 (CAT1122.SK CAT.N))
		(!R10 (CAT1122.SK PLACENTAL.N))
		(!R11 (PAW1139.SK (PERTAIN-TO CAT1122.SK)))
		(!R12 (PAW1139.SK PAW.N))
		(!R13 (ROOM1125.SK ((NN LIVING.N) ROOM.N)))
		(!R14 (E1121.SK (RIGHT-AFTER U298)))
	)
	(:GOALS
		(?G1 (CAT1122.SK (WANT.V (KA ((ADV-A (AT.P ROOM1125.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT1122.SK (AT.P ?L1)))
		(?I2 (NOT (CAT1122.SK (AT.P ROOM1125.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CAT1122.SK (AT.P ?L1))))
		(?P2 (CAT1122.SK (AT.P ROOM1125.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1121.SK))
		(!W2 (?I2 BEFORE E1121.SK))
		(!W3 (?P1 AFTER E1121.SK))
		(!W4 (?P2 AFTER E1121.SK))
		(!W5 (?G1 CAUSE-OF E1121.SK))
		(!W6 (E1121.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E1121.SK (SAME-TIME NOW299)))
		(!W9 (E1126.SK (BEFORE NOW299)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 61:
	; "Andre was at a party."
	; "He then lost his phone."
	; "The whole party stopped."
	; "People are all looking for it."
	; "They found it."
; best schemas are:
; FIND.1361.V
; FIND.319.V
; FIND.708.V
; SEARCH.V
; FIND.V
; COME.917.V

