(setf matches (list))
(setf chain-matches (list))
; story 0:
	; "I see a girl."
	; "I see a boy."
	; "I see a boy and a girl."
	; "The boy can see the girl."
	; "I can see the girl and the boy."
	; "I can see the girl."
; best schemas are:
; TAKE.413.V
; BUMP.400.V
; RUN.401.V
; GO.658.V
; PLAY.724.V
; FLY.235.V

; story 1:
	; "A parrot can talk."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; FLY.235.V
; TAKE.1391.V
; FIND.1167.V
; MOVE.342.V
; MOVE.501.V

; story 2:
	; "The boy and the dog run."
; best schemas are:
; RUN.179.V
; RUN.179.V
; RUN.929.V
; GO.423.V
; GO.1040.V
; GO.194.V

; story 3:
	; "The hen will run at the cat."
discarding schema RUN.28.V learned from this story
; best schemas are:
; RUN.229.V
; RUN.254.V
; RUN.350.V
; GO.591.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
(setf matches (append matches '(( (3.405 0)
("The hen will run at the cat.")
(EPI-SCHEMA ((HEN35.SK
              ((ADV-A (AT.P CAT36.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.35.V)))
              ?L2)
             ** E38.SK)
	(:ROLES
		(!R1 (HEN35.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (CAT36.SK (ATTENDED-TO-BY*.A ?X_B)))
		(!R6 (CAT36.SK CAT.N))
		(!R7 (HEN35.SK HEN.N))
	)
	(:GOALS
		(?G1 (HEN35.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HEN35.SK (AT.P ?L1)))
		(?I2 (NOT (HEN35.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HEN35.SK (AT.P ?L1))))
		(?P2 (HEN35.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E38.SK))
		(!W2 (?I2 BEFORE E38.SK))
		(!W3 (?P1 AFTER E38.SK))
		(!W4 (?P2 AFTER E38.SK))
		(!W5 (?G1 CAUSE-OF E38.SK))
		(!W6 (E38.SK (BEFORE ?X_E)))
		(!W7 (E38.SK (AFTER E34.SK)))
		(!W8 (E34.SK (AT-ABOUT NOW8)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 1)
("The hen will run at the cat.")
(EPI-SCHEMA ((HEN35.SK
              ((ADV-A (AT.P CAT36.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA (CATCH.V ?X_A)))) RUN.36.V))))
              ?L2)
             ** E38.SK)
	(:ROLES
		(!R1 (HEN35.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (HEN35.SK CAT.N))
		(!R6 (?X_A RAT.N))
		(!R7 (?X_A BIG.A))
		(!R8 (CAT36.SK CAT.N))
		(!R9 (HEN35.SK HEN.N))
		(!R10 (HEN35.SK VERTEBRATE.N))
	)
	(:GOALS
		(?G1 (HEN35.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HEN35.SK (AT.P ?L1)))
		(?I2 (NOT (HEN35.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HEN35.SK (AT.P ?L1))))
		(?P2 (HEN35.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E38.SK))
		(!W2 (?I2 BEFORE E38.SK))
		(!W3 (?P1 AFTER E38.SK))
		(!W4 (?P2 AFTER E38.SK))
		(!W5 (?G1 CAUSE-OF E38.SK))
		(!W6 (?X_D (CONSEC E38.SK)))
		(!W7 (E38.SK (BEFORE ?X_E)))
		(!W8 (?X_D (BEFORE ?X_E)))
		(!W9 (E38.SK (AFTER E34.SK)))
		(!W10 (E34.SK (AT-ABOUT NOW8)))
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
(setf matches (append matches '(( (2.905 1)
("The hen will run at the cat.")
(EPI-SCHEMA ((HEN35.SK
              ((ADV-A (AT.P CAT36.SK))
               ((ADV-A (TO.P ?X_D)) ((ADV-A (FROM.P ?X_B)) RUN.37.V)))
              ?X_D)
             ** E38.SK)
	(:ROLES
		(!R1 (HEN35.SK AGENT.N))
		(!R2 (?X_B LOCATION.N))
		(!R3 (?X_D LOCATION.N))
		(!R4 (NOT (?X_B = ?X_D)))
		(!R5 (HEN35.SK BLACK.A))
		(!R6 (?X_D (PERTAIN-TO HEN35.SK)))
		(!R7 (?X_D NEST.N))
		(!R8 (E38.SK (IMPINGES-ON ?X_F)))
		(!R9 (?X_B TOP.N))
		(!R10 (?X_B (PERTAIN-TO ?X_A)))
		(!R11 (CAT36.SK CAT.N))
		(!R12 (HEN35.SK HEN.N))
	)
	(:GOALS
		(?G1 (HEN35.SK (WANT.V (KA ((ADV-A (AT.P ?X_D)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HEN35.SK (AT.P ?X_B)))
		(?I2 (NOT (HEN35.SK (AT.P ?X_D))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HEN35.SK (AT.P ?X_B))))
		(?P2 (HEN35.SK (AT.P ?X_D)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E38.SK))
		(!W2 (?I2 BEFORE E38.SK))
		(!W3 (?P1 AFTER E38.SK))
		(!W4 (?P2 AFTER E38.SK))
		(!W5 (?G1 CAUSE-OF E38.SK))
		(!W6 (?X_F (AT-ABOUT ?X_G)))
		(!W7 (E38.SK (AFTER E34.SK)))
		(!W8 (E34.SK (AT-ABOUT NOW8)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 4)
("The hen will run at the cat.")
(EPI-SCHEMA ((HEN35.SK
              ((ADV-A (AT.P CAT36.SK))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) RUN.38.V)))
              ?X_C)
             ** E38.SK)
	(:ROLES
		(!R1 (HEN35.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (HEN35.SK CAT.N))
		(!R6 (HEN35.SK NEW.A))
		(!R7 (?X_C ((NN PET.N) STORE.N)))
		(!R8 (CAT36.SK NICE.A))
		(!R9 (CAT36.SK (PERTAIN-TO HEN35.SK)))
		(!R10 (HEN35.SK HEN.N))
		(!R11 (HEN35.SK VERTEBRATE.N))
		(!R12 (CAT36.SK CAT.N))
	)
	(:GOALS
		(?G1 (HEN35.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HEN35.SK (AT.P ?L1)))
		(?I2 (NOT (HEN35.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HEN35.SK (AT.P ?L1))))
		(?P2 (HEN35.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E38.SK))
		(!W2 (?I2 BEFORE E38.SK))
		(!W3 (?P1 AFTER E38.SK))
		(!W4 (?P2 AFTER E38.SK))
		(!W5 (?G1 CAUSE-OF E38.SK))
		(!W6 (E38.SK (BEFORE ?X_E)))
		(!W7 (E38.SK (AFTER E34.SK)))
		(!W8 (E34.SK (AT-ABOUT NOW8)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 4:
	; "The dog and hen run at the cat."
; best schemas are:
; RUN.28.V
; RUN.229.V
; RUN.254.V
; FEED.660.V
; GO.591.V
; GET.848.V

; story 5:
	; "I see one dog and two cats."
; best schemas are:
; RUN.179.V
; RUN.179.V
; GET.826.V
; GET.218.V
; RUN.929.V
; FIND.1038.V

; story 6:
	; "She saw Rover run off with the hat."
; best schemas are:
; SIT.211.V
; SIT.505.V
; SIT.49.V
; SIT.65.V
; SIT.274.V

; story 7:
	; "Here come Jack and Jill on a red sled."
; best schemas are:
; FEED.457.V
; FEED.457.V
; TAKE.542.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1152.V
; COME.917.V
; COME.917.V

; story 8:
	; "The Hare runs from the Dog."
; best schemas are:

; story 9:
	; "The Fox will eat the Hen."
; best schemas are:

; story 10:
	; "The Man breaks the Ice."
; best schemas are:
; TAKE.10.V
; TAKE.135.V
; RUN.311.V
; GO.423.V
; FIND.773.V
; FIND.888.V

; story 11:
	; "That man is shooting partridges."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; TAKE.10.V
; TAKE.135.V
; RUN.311.V
; GO.423.V
; FIND.773.V

; story 12:
	; "The rat ran from the box."
discarding schema RUN.58.V learned from this story
; best schemas are:
; RUN.254.V
; GO.423.V
; GET.143.V
; GIVE.902.V
; GET.79.V
(setf matches (append matches '(( (3.905 4)
("The rat ran from the box.")
(EPI-SCHEMA ((RAT75.SK
              ((ADV-A (FOR.P (KA (CATCH.V RAT75.SK))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P BOX77.SK)) RUN.81.V)))
              ?L2)
             ** E74.SK)
	(:ROLES
		(!R1 (RAT75.SK AGENT.N))
		(!R2 (BOX77.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (BOX77.SK = ?L2)))
		(!R5 (RAT75.SK CAT.N))
		(!R6 (RAT75.SK BIG.A))
		(!R7 (BOX77.SK BOX.N))
		(!R8 (E74.SK (RIGHT-AFTER U16)))
		(!R9 (RAT75.SK RAT.N))
		(!R10 (RAT75.SK PLACENTAL.N))
	)
	(:GOALS
		(?G1 (RAT75.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (RAT75.SK (AT.P BOX77.SK)))
		(?I2 (NOT (RAT75.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (RAT75.SK (AT.P BOX77.SK))))
		(?P2 (RAT75.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E74.SK))
		(!W2 (?I2 BEFORE E74.SK))
		(!W3 (?P1 AFTER E74.SK))
		(!W4 (?P2 AFTER E74.SK))
		(!W5 (?G1 CAUSE-OF E74.SK))
		(!W6 (?X_D (CONSEC E74.SK)))
		(!W7 (E74.SK (BEFORE ?X_E)))
		(!W8 (?X_D (BEFORE ?X_E)))
		(!W9 (E74.SK (SAME-TIME NOW17)))
		(!W10 (E78.SK (BEFORE NOW17)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R10 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R9 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 3)
("The rat ran from the box.")
(EPI-SCHEMA ((RAT75.SK
              (OUT.ADV
               ((ADV-A (TO.P ?X_E)) ((ADV-A (FROM.P BOX77.SK)) RUN.82.V)))
              ?X_E)
             ** E74.SK)
	(:ROLES
		(!R1 (RAT75.SK AGENT.N))
		(!R2 (BOX77.SK LOCATION.N))
		(!R3 (?X_E LOCATION.N))
		(!R4 (NOT (BOX77.SK = ?X_E)))
		(!R5 (?X_E MAILBOX.N))
		(!R6 (?X_E (PERTAIN-TO RAT75.SK)))
		(!R7 (RAT75.SK MAN.N))
		(!R8 (?X_B PAPER.N))
		(!R9 (?X_B (PERTAIN-TO RAT75.SK)))
		(!R10 (?X_C ((NN PAPER.N) BOY.N)))
		(!R11 (?X_C (PERTAIN-TO RAT75.SK)))
		(!R12 (BOX77.SK BOX.N))
		(!R13 (RAT75.SK RAT.N))
		(!R14 (E74.SK (RIGHT-AFTER U16)))
	)
	(:GOALS
		(?G1 (RAT75.SK (WANT.V (KA ((ADV-A (AT.P ?X_E)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (RAT75.SK (AT.P BOX77.SK)))
		(?I2 (NOT (RAT75.SK (AT.P ?X_E))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (RAT75.SK (AT.P BOX77.SK))))
		(?P2 (RAT75.SK (AT.P ?X_E)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E74.SK))
		(!W2 (?I2 BEFORE E74.SK))
		(!W3 (?P1 AFTER E74.SK))
		(!W4 (?P2 AFTER E74.SK))
		(!W5 (?G1 CAUSE-OF E74.SK))
		(!W6 (E74.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E74.SK (SAME-TIME NOW17)))
		(!W9 (E78.SK (BEFORE NOW17)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 13:
	; "The man with the big hat has a cow."
; best schemas are:
; TAKE.10.V
; TAKE.135.V
; FIND.562.V
; EAT.564.V
; FIND.773.V
; FIND.888.V

; story 14:
	; "The baby can not have the bird."
	; "She can not fly and catch it."
; best schemas are:
; FLY.235.V
; SIT.211.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; GO.1338.V
; TAKE.1391.V
; FIND.1167.V

; story 15:
	; "I have four apples on this plate."
	; "If I put two apples on the box, I shall leave two apples on the plate."
	; "Four apples are two apples and two apples."
	; "If I put three apples on the box, I shall leave one apple on the plate."
	; "Four apples are three apples and one apple."
	; "If I put one on the box, I shall leave on the plate."
; best schemas are:
; TAKE.1.V
; FEED.660.V
; FLY.235.V
; GIVE.194.V
; TAKE.413.V
; GO.591.V

; story 16:
	; "The bear was small then, so he was not afraid of him."
	; "He cut the tree down, and as soon as it fell, the dogs caught the bear."
; best schemas are:
; TAKE.1.V
; FOLLOW.69.V
; FLY.235.V
; GIVE.194.V
; TAKE.413.V
; RUN.179.V

; story 17:
	; "The cat saw the rat."
	; "Off ran the rat, and off ran the cat."
	; "But the rat got to the hole all safe."
discarding schema GET.143.V learned from this story
; best schemas are:
; RUN.254.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; GET.848.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; GET.88.V
(setf matches (append matches '(( (1.43625 1)
("The cat saw the rat." "Off ran the rat, and off ran the cat."
 "But the rat got to the hole all safe.")
(EPI-SCHEMA ((CAT122.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.237.V
              (KA ((THERE.ADV SEE.V) RAT124.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) RAT124.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (CAT122.SK AGENT.N))
		(!R4 (RAT124.SK RAT.N))
		(!R5 (CAT122.SK CAT.N))
		(!R6 (E121.SK (RIGHT-AFTER U28)))
	)
	(:GOALS
		(?G1 (CAT122.SK (WANT.V (THAT (NOT (CAT122.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (CAT122.SK (THERE.ADV SEE.V) RAT124.SK)) CAUSE-OF
    (KE (CAT122.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E121.SK (CAT122.SK (THERE.ADV (THERE.ADV SEE.V)) RAT124.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E121.SK))
		(!W2 (E121.SK (BEFORE ?X_D)))
		(!W3 (E121.SK (SAME-TIME NOW29)))
		(!W4 (E125.SK (BEFORE NOW29)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.43625 1)
("The cat saw the rat." "Off ran the rat, and off ran the cat."
 "But the rat got to the hole all safe.")
(EPI-SCHEMA ((CAT122.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.238.V
              (KA ((THERE.ADV SEE.V) RAT124.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) RAT124.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (CAT122.SK AGENT.N))
		(!R4 (RAT124.SK RAT.N))
		(!R5 (CAT122.SK CAT.N))
		(!R6 (E121.SK (RIGHT-AFTER U28)))
	)
	(:GOALS
		(?G1 (CAT122.SK (WANT.V (THAT (NOT (CAT122.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (CAT122.SK (THERE.ADV SEE.V) RAT124.SK)) CAUSE-OF
    (KE (CAT122.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E125.SK (CAT122.SK (THERE.ADV (THERE.ADV SEE.V)) RAT124.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E125.SK))
		(!W2 (E125.SK (BEFORE ?X_D)))
		(!W3 (E125.SK (BEFORE NOW29)))
		(!W4 (E121.SK (SAME-TIME NOW29)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.9049997 4)
("The cat saw the rat." "Off ran the rat, and off ran the cat."
 "But the rat got to the hole all safe.")
(EPI-SCHEMA ((RAT124.SK ((ADV-A (TO.P HOLE134.SK)) GET.243.V) CAT122.SK
              (AT.P-ARG ?L))
             ** E130.SK)
	(:ROLES
		(!R1 (RAT124.SK AGENT.N))
		(!R2 (CAT122.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (RAT124.SK = CAT122.SK)))
		(!R5 (RAT124.SK WIFE.N))
		(!R6 (?X_B CAT.N))
		(!R7 (RAT124.SK (PERTAIN-TO ?X_C)))
		(!R8 (?G1 (RIGHT-AFTER ?X_D)))
		(!R9 (RAT124.SK RAT.N))
		(!R10 (HOLE134.SK (ALL.ADV SAFE.A)))
		(!R11 (HOLE134.SK HOLE.N))
		(!R12 (E130.SK (RIGHT-AFTER U30)))
		(!R13 (E121.SK (RIGHT-AFTER U28)))
		(!R14 (CAT122.SK CAT.N))
	)
	(:GOALS
		(?G1 (RAT124.SK (WANT.V (THAT (RAT124.SK (HAVE.V CAT122.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (RAT124.SK HAVE.V CAT122.SK)))
		(?I2 (RAT124.SK (AT.P ?L)))
		(?I3 (CAT122.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (RAT124.SK HAVE.V CAT122.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E130.SK))
		(!W2 (?I1 PRECOND-OF E130.SK))
		(!W3 (?I2 PRECOND-OF E130.SK))
		(!W4 (?I3 PRECOND-OF E130.SK))
		(!W5 (?P1 POSTCOND-OF E130.SK))
		(!W6 (E130.SK (BEFORE ?X_I)))
		(!W7 (E121.SK (SAME-TIME ?X_I)))
		(!W8 (?G1 (SAME-TIME ?X_L)))
		(!W9 (?X_K (AT-ABOUT ?X_L)))
		(!W10 (E130.SK (SAME-TIME NOW31)))
		(!W11 (E136.SK (BEFORE NOW31)))
		(!W12 (E121.SK (SAME-TIME NOW29)))
		(!W13 (E125.SK (BEFORE NOW29)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 18:
	; "It is not a dog, but it has legs."
	; "It is not a bird, but it has wings."
	; "It says buz, buz, buz."
	; "It is busy all the day."
; best schemas are:
; GET.826.V
; RUN.179.V
; RUN.179.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; TAKE.135.V
; FLY.235.V
; error processing story
; story 19:
	; "I like to see John run with his kite."
	; "He can run as fast as the other boys, but he can not jump far."
	; "He does not like to look at books and pictures, but he can play on a drum."
; best schemas are:
; GO.680.V

; story 20:
	; "Ada has a fan in her hand."
	; "These fans are May's."
	; "Ada has May's white fan."
; best schemas are:
; TAKE.1.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 21:
	; "The boy has a big dog."
	; "You may see the dog play ball."
; best schemas are:
; GET.826.V
; GET.218.V
; FIND.1038.V
; TAKE.1039.V
; LAY_DOWN.1041.V
; GIVE.800.V

; story 22:
	; "I have a doll."
	; "I can see my doll."
	; "My doll has a hat."
	; "The girl has a doll and a hat."
; best schemas are:
; TAKE.1.V
; TAKE.413.V
; PLAY.301.V
; PLAY.724.V
; BUMP.400.V
; GIVE.194.V

; story 23:
	; "A dog runs."
	; "The dog is black."
	; "It is a large, black dog."
	; "Is it Tom's black dog?"
	; "It is my black dog."
	; "My large, black dog runs."
; best schemas are:
; RUN.179.V
; RUN.179.V
; RUN.350.V
; RUN.929.V
; RUN.254.V
; GO.1040.V
(setf matches (append matches '(( (2.905 0)
("A dog runs." "The dog is black." "It is a large, black dog."
 "Is it Tom's black dog?" "It is my black dog." "My large, black dog runs.")
(EPI-SCHEMA ((DOG211.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.299.V))
              ?L2)
             ** E210.SK)
	(:ROLES
		(!R1 (DOG211.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (DOG211.SK DOG.N))
	)
	(:GOALS
		(?G1 (DOG211.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG211.SK (AT.P ?L1)))
		(?I2 (NOT (DOG211.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG211.SK (AT.P ?L1))))
		(?P2 (DOG211.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E210.SK))
		(!W2 (?I2 BEFORE E210.SK))
		(!W3 (?P1 AFTER E210.SK))
		(!W4 (?P2 AFTER E210.SK))
		(!W5 (?G1 CAUSE-OF E210.SK))
		(!W6 (E210.SK (AT-ABOUT ?X_C)))
		(!W7 (E210.SK (AT-ABOUT NOW48)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 0)
("A dog runs." "The dog is black." "It is a large, black dog."
 "Is it Tom's black dog?" "It is my black dog." "My large, black dog runs.")
(EPI-SCHEMA ((DOG211.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.299.V))
              ?L2)
             ** E210.SK)
	(:ROLES
		(!R1 (DOG211.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (DOG211.SK DOG.N))
	)
	(:GOALS
		(?G1 (DOG211.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG211.SK (AT.P ?L1)))
		(?I2 (NOT (DOG211.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG211.SK (AT.P ?L1))))
		(?P2 (DOG211.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E210.SK))
		(!W2 (?I2 BEFORE E210.SK))
		(!W3 (?P1 AFTER E210.SK))
		(!W4 (?P2 AFTER E210.SK))
		(!W5 (?G1 CAUSE-OF E210.SK))
		(!W6 (E210.SK (AT-ABOUT ?X_C)))
		(!W7 (E210.SK (AT-ABOUT NOW48)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.4049997 10)
("A dog runs." "The dog is black." "It is a large, black dog."
 "Is it Tom's black dog?" "It is my black dog." "My large, black dog runs.")
(EPI-SCHEMA ((DOG211.SK
              ((ADV-A (FROM.P OBJECT222.SK))
               ((ADV-A (TO.P DOG224.SK)) RUN.300.V))
              DOG224.SK)
             ** E210.SK)
	(:ROLES
		(!R1 (DOG211.SK AGENT.N))
		(!R2 (OBJECT222.SK LOCATION.N))
		(!R3 (DOG224.SK LOCATION.N))
		(!R4 (NOT (OBJECT222.SK = DOG224.SK)))
		(!R5 (DOG211.SK BLACK.A))
		(!R6 (DOG211.SK HEN.N))
		(!R7 (DOG224.SK (PERTAIN-TO DOG211.SK)))
		(!R8 (DOG224.SK NEST.N))
		(!R9 (E210.SK (IMPINGES-ON ?X_F)))
		(!R10 (OBJECT222.SK TOP.N))
		(!R11 (DOG211.SK DOG.N))
		(!R12 (DOG211.SK VERTEBRATE.N))
		(!R13 (DOG224.SK (PERTAIN-TO ME.PRO)))
		(!R14 (DOG224.SK LARGE.A))
		(!R15 (OBJECT222.SK (PERTAIN-TO ME.PRO)))
	)
	(:GOALS
		(?G1 (DOG211.SK (WANT.V (KA ((ADV-A (AT.P DOG224.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG211.SK (AT.P OBJECT222.SK)))
		(?I2 (NOT (DOG211.SK (AT.P DOG224.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG211.SK (AT.P OBJECT222.SK))))
		(?P2 (DOG211.SK (AT.P DOG224.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E210.SK))
		(!W2 (?I2 BEFORE E210.SK))
		(!W3 (?P1 AFTER E210.SK))
		(!W4 (?P2 AFTER E210.SK))
		(!W5 (?G1 CAUSE-OF E210.SK))
		(!W6 (?X_F (AT-ABOUT ?X_G)))
		(!W7 (E210.SK (AT-ABOUT NOW48)))
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
(setf matches (append matches '(( (2.905 1)
("A dog runs." "The dog is black." "It is a large, black dog."
 "Is it Tom's black dog?" "It is my black dog." "My large, black dog runs.")
(EPI-SCHEMA ((DOG211.SK
              ((ADV-A (THROUGH.P ?X_A))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_C)) RUN.301.V)))
              ?L2)
             ** E210.SK)
	(:ROLES
		(!R1 (DOG211.SK AGENT.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?X_C = ?L2)))
		(!R5 (?X_A PARK.N))
		(!R6 (DOG211.SK (PERTAIN-TO DOG211.SK)))
		(!R7 (?X_C END.N))
		(!R8 (DOG211.SK DOG.N))
	)
	(:GOALS
		(?G1 (DOG211.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG211.SK (AT.P ?X_C)))
		(?I2 (NOT (DOG211.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG211.SK (AT.P ?X_C))))
		(?P2 (DOG211.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E210.SK))
		(!W2 (?I2 BEFORE E210.SK))
		(!W3 (?P1 AFTER E210.SK))
		(!W4 (?P2 AFTER E210.SK))
		(!W5 (?G1 CAUSE-OF E210.SK))
		(!W6 (E210.SK (BEFORE ?X_F)))
		(!W7 (E210.SK (AT-ABOUT NOW48)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 3)
("A dog runs." "The dog is black." "It is a large, black dog."
 "Is it Tom's black dog?" "It is my black dog." "My large, black dog runs.")
(EPI-SCHEMA ((DOG211.SK
              ((ADV-A (FOR.P (KA (CATCH.V DOG213.SK))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.302.V)))
              ?L2)
             ** E210.SK)
	(:ROLES
		(!R1 (DOG211.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (DOG211.SK CAT.N))
		(!R6 (DOG213.SK RAT.N))
		(!R7 (DOG213.SK BIG.A))
		(!R8 (DOG211.SK DOG.N))
		(!R9 (DOG211.SK CARNIVORE.N))
		(!R10 (DOG213.SK DOG.N))
		(!R11 (DOG213.SK PLACENTAL.N))
	)
	(:GOALS
		(?G1 (DOG211.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG211.SK (AT.P ?L1)))
		(?I2 (NOT (DOG211.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG211.SK (AT.P ?L1))))
		(?P2 (DOG211.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E210.SK))
		(!W2 (?I2 BEFORE E210.SK))
		(!W3 (?P1 AFTER E210.SK))
		(!W4 (?P2 AFTER E210.SK))
		(!W5 (?G1 CAUSE-OF E210.SK))
		(!W6 (?X_D (CONSEC E210.SK)))
		(!W7 (E210.SK (BEFORE ?X_E)))
		(!W8 (?X_D (BEFORE ?X_E)))
		(!W9 (E210.SK (AT-ABOUT NOW48)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 0)
("A dog runs." "The dog is black." "It is a large, black dog."
 "Is it Tom's black dog?" "It is my black dog." "My large, black dog runs.")
(EPI-SCHEMA ((DOG211.SK
              (OUTSIDE.ADV
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.303.V)))
              ?L2)
             ** E210.SK)
	(:ROLES
		(!R1 (DOG211.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (DOG211.SK DOG.N))
	)
	(:GOALS
		(?G1 (DOG211.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG211.SK (AT.P ?L1)))
		(?I2 (NOT (DOG211.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG211.SK (AT.P ?L1))))
		(?P2 (DOG211.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E210.SK))
		(!W2 (?I2 BEFORE E210.SK))
		(!W3 (?P1 AFTER E210.SK))
		(!W4 (?P2 AFTER E210.SK))
		(!W5 (?G1 CAUSE-OF E210.SK))
		(!W6 (E210.SK (BEFORE ?X_C)))
		(!W7 (E210.SK (AT-ABOUT NOW48)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 24:
	; "One day Ned went out to walk."
	; "He looked up and saw a green bird."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; PLAY.669.V
; GO.671.V
; GET.826.V
; GO.100.V
; error processing story
; story 25:
	; "Baby sits on the soft mat."
	; "You may play near her a while."
discarding schema SIT.211.V learned from this story
; best schemas are:
; SIT.505.V
; SIT.49.V
; SIT.65.V
; SIT.274.V
; SIT.V
(setf matches (append matches '(( (2.8815625 4)
("Baby sits on the soft mat." "You may play near her a while.")
(EPI-SCHEMA (((K BABY.N)
              ((ADV-A (BY.P (K BABY.N)))
               (DOWN.ADV
                ((ADV-A (IN.P MAT247.SK))
                 ((ADV-A (ON.P MAT247.SK)) SIT.356.V)))))
             ** E248.SK)
	(:ROLES
		(!R1 ((K BABY.N) AGENT.N))
		(!R2 (MAT247.SK INANIMATE_OBJECT.N))
		(!R3 (MAT247.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 ((K BABY.N) MAN.N))
		(!R6 (?X_A (PERTAIN-TO (K BABY.N))))
		(!R7 (?X_A LUNCH.N))
		(!R8 (MAT247.SK CAFETERIA.N))
		(!R9 (MAT247.SK MAT.N))
		(!R10 (MAT247.SK ARTIFACT.N))
		(!R11 (MAT247.SK SOFT.A))
	)
	(:GOALS
		(?G1 ((K BABY.N) (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 ((K BABY.N) (AT.P ?L)))
		(?I2 (MAT247.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:EPISODE-RELATIONS
		(!W1 (E248.SK (BEFORE ?X_E)))
		(!W2 (E248.SK (AT-ABOUT NOW56)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R3 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R10 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R9 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R10 CERTAIN-TO-DEGREE (/ 2 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 26:
	; "Little Jack has a funny horse."
	; "He rides the spade."
; best schemas are:
; PLAY.920.V
; EAT.195.V
; TAKE.1270.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 27:
	; "The puppies are full of fun."
	; "I like to see them play with each other."
; best schemas are:
; RUN.179.V
; RUN.179.V
; GET.826.V
; GET.218.V
; RUN.929.V
; FIND.1038.V

; story 28:
	; "This cat was in a nest."
	; "A hen ran at her."
discarding schema RUN.229.V learned from this story
; best schemas are:
; RUN.28.V
; RUN.350.V
; RUN.254.V
; TAKE.1391.V
; GO.591.V
(setf matches (append matches '(( (3.405 0)
("This cat was in a nest." "A hen ran at her.")
(EPI-SCHEMA ((HEN274.SK
              ((ADV-A (AT.P CAT271.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.373.V)))
              ?L2)
             ** E278.SK)
	(:ROLES
		(!R1 (HEN274.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (CAT271.SK CAT.N))
		(!R6 (HEN274.SK HEN.N))
		(!R7 (CAT271.SK (ATTENDED-TO-BY*.A SPEAKER)))
	)
	(:GOALS
		(?G1 (HEN274.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HEN274.SK (AT.P ?L1)))
		(?I2 (NOT (HEN274.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HEN274.SK (AT.P ?L1))))
		(?P2 (HEN274.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E278.SK))
		(!W2 (?I2 BEFORE E278.SK))
		(!W3 (?P1 AFTER E278.SK))
		(!W4 (?P2 AFTER E278.SK))
		(!W5 (?G1 CAUSE-OF E278.SK))
		(!W6 (E278.SK (AFTER ?X_D)))
		(!W7 (?X_D (AT-ABOUT ?X_E)))
		(!W8 (E278.SK (BEFORE NOW63)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 5)
("This cat was in a nest." "A hen ran at her.")
(EPI-SCHEMA ((HEN274.SK
              ((ADV-A (AT.P CAT271.SK))
               ((ADV-A (TO.P NEST273.SK)) ((ADV-A (FROM.P ?X_B)) RUN.374.V)))
              NEST273.SK)
             ** E278.SK)
	(:ROLES
		(!R1 (HEN274.SK AGENT.N))
		(!R2 (?X_B LOCATION.N))
		(!R3 (NEST273.SK LOCATION.N))
		(!R4 (NOT (?X_B = NEST273.SK)))
		(!R5 (HEN274.SK BLACK.A))
		(!R6 (NEST273.SK (PERTAIN-TO HEN274.SK)))
		(!R7 (E278.SK (IMPINGES-ON ?X_F)))
		(!R8 (?X_B TOP.N))
		(!R9 (?X_B (PERTAIN-TO ?X_A)))
		(!R10 (CAT271.SK CAT.N))
		(!R11 (HEN274.SK HEN.N))
		(!R12 (CAT271.SK (ATTENDED-TO-BY*.A SPEAKER)))
		(!R13 (NEST273.SK NEST.N))
	)
	(:GOALS
		(?G1 (HEN274.SK (WANT.V (KA ((ADV-A (AT.P NEST273.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HEN274.SK (AT.P ?X_B)))
		(?I2 (NOT (HEN274.SK (AT.P NEST273.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HEN274.SK (AT.P ?X_B))))
		(?P2 (HEN274.SK (AT.P NEST273.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E278.SK))
		(!W2 (?I2 BEFORE E278.SK))
		(!W3 (?P1 AFTER E278.SK))
		(!W4 (?P2 AFTER E278.SK))
		(!W5 (?G1 CAUSE-OF E278.SK))
		(!W6 (?X_F (AT-ABOUT ?X_G)))
		(!W7 (E278.SK (BEFORE NOW63)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 1)
("This cat was in a nest." "A hen ran at her.")
(EPI-SCHEMA ((HEN274.SK
              ((ADV-A (AT.P CAT271.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA (CATCH.V ?X_A)))) RUN.375.V))))
              ?L2)
             ** E278.SK)
	(:ROLES
		(!R1 (HEN274.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (HEN274.SK CAT.N))
		(!R6 (?X_A RAT.N))
		(!R7 (?X_A BIG.A))
		(!R8 (CAT271.SK CAT.N))
		(!R9 (HEN274.SK HEN.N))
		(!R10 (HEN274.SK VERTEBRATE.N))
		(!R11 (CAT271.SK (ATTENDED-TO-BY*.A SPEAKER)))
	)
	(:GOALS
		(?G1 (HEN274.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HEN274.SK (AT.P ?L1)))
		(?I2 (NOT (HEN274.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HEN274.SK (AT.P ?L1))))
		(?P2 (HEN274.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E278.SK))
		(!W2 (?I2 BEFORE E278.SK))
		(!W3 (?P1 AFTER E278.SK))
		(!W4 (?P2 AFTER E278.SK))
		(!W5 (?G1 CAUSE-OF E278.SK))
		(!W6 (?X_D (CONSEC E278.SK)))
		(!W7 (E278.SK (BEFORE ?X_E)))
		(!W8 (?X_D (BEFORE ?X_E)))
		(!W9 (E278.SK (BEFORE NOW63)))
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
(setf matches (append matches '(( (2.905 4)
("This cat was in a nest." "A hen ran at her.")
(EPI-SCHEMA ((HEN274.SK
              ((ADV-A (AT.P CAT271.SK))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) RUN.382.V)))
              ?X_C)
             ** E278.SK)
	(:ROLES
		(!R1 (HEN274.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (HEN274.SK CAT.N))
		(!R6 (HEN274.SK NEW.A))
		(!R7 (?X_C ((NN PET.N) STORE.N)))
		(!R8 (CAT271.SK NICE.A))
		(!R9 (CAT271.SK (PERTAIN-TO HEN274.SK)))
		(!R10 (HEN274.SK HEN.N))
		(!R11 (HEN274.SK VERTEBRATE.N))
		(!R12 (CAT271.SK CAT.N))
		(!R13 (CAT271.SK (ATTENDED-TO-BY*.A SPEAKER)))
	)
	(:GOALS
		(?G1 (HEN274.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HEN274.SK (AT.P ?L1)))
		(?I2 (NOT (HEN274.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HEN274.SK (AT.P ?L1))))
		(?P2 (HEN274.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E278.SK))
		(!W2 (?I2 BEFORE E278.SK))
		(!W3 (?P1 AFTER E278.SK))
		(!W4 (?P2 AFTER E278.SK))
		(!W5 (?G1 CAUSE-OF E278.SK))
		(!W6 (E278.SK (BEFORE ?X_E)))
		(!W7 (E278.SK (BEFORE NOW63)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 29:
	; "The cat is on the box."
	; "She saw a big rat and ran to catch it."
discarding schema RUN.254.V learned from this story
; best schemas are:
; RUN.58.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; RUN.28.V
; RUN.229.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
(setf matches (append matches '(( (3.905 3)
("The cat is on the box." "She saw a big rat and ran to catch it.")
(EPI-SCHEMA ((CAT281.SK
              ((ADV-A (FOR.P (KA (CATCH.V RAT288.SK))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P BOX283.SK)) RUN.383.V)))
              ?L2)
             ** E290.SK)
	(:ROLES
		(!R1 (CAT281.SK AGENT.N))
		(!R2 (BOX283.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (BOX283.SK = ?L2)))
		(!R5 (CAT281.SK RAT.N))
		(!R6 (E290.SK (RIGHT-AFTER ?X_A)))
		(!R7 (CAT281.SK CAT.N))
		(!R8 (CAT281.SK PLACENTAL.N))
		(!R9 (RAT288.SK RAT.N))
		(!R10 (RAT288.SK BIG.A))
		(!R11 (BOX283.SK BOX.N))
	)
	(:GOALS
		(?G1 (CAT281.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT281.SK (AT.P BOX283.SK)))
		(?I2 (NOT (CAT281.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CAT281.SK (AT.P BOX283.SK))))
		(?P2 (CAT281.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E290.SK))
		(!W2 (?I2 BEFORE E290.SK))
		(!W3 (?P1 AFTER E290.SK))
		(!W4 (?P2 AFTER E290.SK))
		(!W5 (?G1 CAUSE-OF E290.SK))
		(!W6 (E290.SK (SAME-TIME ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E294.SK (CONSEC E290.SK)))
		(!W9 (E290.SK (BEFORE NOW65)))
		(!W10 (E294.SK (BEFORE NOW65)))
	)
	(:CERTAINTIES
		(!C1 (!R8 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 1)
("The cat is on the box." "She saw a big rat and ran to catch it.")
(EPI-SCHEMA ((CAT281.SK
              ((ADV-A (FOR.P (KA (CATCH.V RAT288.SK))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-A (AT.P CAT281.SK)) RUN.386.V))))
              ?L2)
             ** E290.SK)
	(:ROLES
		(!R1 (CAT281.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (CAT281.SK HEN.N))
		(!R6 (RAT288.SK RAT.N))
		(!R7 (RAT288.SK BIG.A))
		(!R8 (CAT281.SK CAT.N))
		(!R9 (CAT281.SK VERTEBRATE.N))
	)
	(:GOALS
		(?G1 (CAT281.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT281.SK (AT.P ?L1)))
		(?I2 (NOT (CAT281.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CAT281.SK (AT.P ?L1))))
		(?P2 (CAT281.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E290.SK))
		(!W2 (?I2 BEFORE E290.SK))
		(!W3 (?P1 AFTER E290.SK))
		(!W4 (?P2 AFTER E290.SK))
		(!W5 (?G1 CAUSE-OF E290.SK))
		(!W6 (E290.SK (AFTER ?X_D)))
		(!W7 (?X_D (AT-ABOUT ?X_E)))
		(!W8 (E294.SK (CONSEC E290.SK)))
		(!W9 (E290.SK (BEFORE NOW65)))
		(!W10 (E294.SK (BEFORE NOW65)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R9 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R8 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 1)
("The cat is on the box." "She saw a big rat and ran to catch it.")
(EPI-SCHEMA ((CAT281.SK
              ((ADV-A (FOR.P (KA (CATCH.V RAT288.SK))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-A (AT.P CAT281.SK)) RUN.387.V))))
              ?L2)
             ** E290.SK)
	(:ROLES
		(!R1 (CAT281.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (CAT281.SK HEN.N))
		(!R6 (CAT281.SK (ATTENDED-TO-BY*.A ?X_B)))
		(!R7 (RAT288.SK RAT.N))
		(!R8 (RAT288.SK BIG.A))
		(!R9 (CAT281.SK CAT.N))
		(!R10 (CAT281.SK VERTEBRATE.N))
	)
	(:GOALS
		(?G1 (CAT281.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT281.SK (AT.P ?L1)))
		(?I2 (NOT (CAT281.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CAT281.SK (AT.P ?L1))))
		(?P2 (CAT281.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E290.SK))
		(!W2 (?I2 BEFORE E290.SK))
		(!W3 (?P1 AFTER E290.SK))
		(!W4 (?P2 AFTER E290.SK))
		(!W5 (?G1 CAUSE-OF E290.SK))
		(!W6 (E290.SK (BEFORE ?X_E)))
		(!W7 (E294.SK (CONSEC E290.SK)))
		(!W8 (E290.SK (BEFORE NOW65)))
		(!W9 (E294.SK (BEFORE NOW65)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R10 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R9 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.43625 1)
("The cat is on the box." "She saw a big rat and ran to catch it.")
(EPI-SCHEMA ((CAT281.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
              (KA ((THERE.ADV SEE.V) RAT288.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) RAT288.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (CAT281.SK AGENT.N))
		(!R4 (CAT281.SK CAT.N))
		(!R5 (RAT288.SK RAT.N))
		(!R6 (RAT288.SK BIG.A))
	)
	(:GOALS
		(?G1 (CAT281.SK (WANT.V (THAT (NOT (CAT281.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (CAT281.SK (THERE.ADV SEE.V) RAT288.SK)) CAUSE-OF
    (KE (CAT281.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E294.SK (CAT281.SK (THERE.ADV (THERE.ADV SEE.V)) RAT288.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E294.SK))
		(!W2 (E294.SK (BEFORE ?X_D)))
		(!W3 (E294.SK (CONSEC E290.SK)))
		(!W4 (E290.SK (BEFORE NOW65)))
		(!W5 (E294.SK (BEFORE NOW65)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 30:
	; "I love little Lucy."
	; "But now she has gone far away to her home."
; best schemas are:
; TAKE.1.V
; FLY.235.V
; GIVE.194.V
; TAKE.413.V
; RUN.28.V
; RUN.229.V

; story 31:
	; "Here is Jean with her hoop."
	; "Jean can roll the hoop very fast."
	; "The hoop has bells on it."
	; "The bells tinkle, tinkle, tinkle."
; best schemas are:
; GO_FIND_EAT.566.PR
; GO_GET_NIL.677.PR
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V

; story 32:
	; "I see a nest, Rosy!"
	; "Can you see it?"
	; "It is in this big green tree."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; RUN.229.V
; COME.280.V
; RUN.350.V
(setf matches (append matches '(( (1.03125 2)
("I see a nest, Rosy!" "Can you see it?" "It is in this big green tree.")
(EPI-SCHEMA ((ME.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.460.V
              (KA ((THERE.ADV SEE.V) ROSY329.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) ROSY329.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ME.PRO AGENT.N))
		(!R4 (ROSY329.SK ROSY.A))
		(!R5 (ROSY329.SK NEST.N))
	)
	(:GOALS
		(?G1 (ME.PRO (WANT.V (THAT (NOT (ME.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME.PRO (THERE.ADV SEE.V) ROSY329.SK)) CAUSE-OF
    (KE (ME.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E330.SK (ME.PRO (THERE.ADV (THERE.ADV SEE.V)) ROSY329.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E330.SK))
		(!W2 (E330.SK (BEFORE ?X_D)))
		(!W3 (E330.SK (AT-ABOUT NOW72)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.03125 5)
("I see a nest, Rosy!" "Can you see it?" "It is in this big green tree.")
(EPI-SCHEMA ((ME.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.462.V
              (KA ((THERE.ADV SEE.V) ROSY329.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) ROSY329.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ME.PRO AGENT.N))
		(!R4 (ME.PRO CAT.N))
		(!R5 (ROSY329.SK RAT.N))
		(!R6 (ROSY329.SK BIG.A))
		(!R7 (ROSY329.SK ROSY.A))
		(!R8 (ROSY329.SK NEST.N))
	)
	(:GOALS
		(?G1 (ME.PRO (WANT.V (THAT (NOT (ME.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME.PRO (THERE.ADV SEE.V) ROSY329.SK)) CAUSE-OF
    (KE (ME.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E330.SK (ME.PRO (THERE.ADV (THERE.ADV SEE.V)) ROSY329.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E330.SK))
		(!W2 (E330.SK (BEFORE ?X_D)))
		(!W3 (E330.SK (CONSEC ?X_C)))
		(!W4 (?X_C (BEFORE ?X_F)))
		(!W5 (E330.SK (BEFORE ?X_F)))
		(!W6 (E330.SK (AT-ABOUT NOW72)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.03125 5)
("I see a nest, Rosy!" "Can you see it?" "It is in this big green tree.")
(EPI-SCHEMA ((ME.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.464.V
              (KA ((THERE.ADV SEE.V) ROSY329.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) ROSY329.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ME.PRO MALE.A))
		(!R4 (ME.PRO AGENT.N))
		(!R5 (ROSY329.SK GREEN.A))
		(!R6 (ROSY329.SK BIRD.N))
		(!R7 (?X_A (AT-OR-BEFORE ?X_H)))
		(!R8 (ROSY329.SK ROSY.A))
		(!R9 (ROSY329.SK NEST.N))
	)
	(:GOALS
		(?G1 (ME.PRO (WANT.V (THAT (NOT (ME.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME.PRO (THERE.ADV SEE.V) ROSY329.SK)) CAUSE-OF
    (KE (ME.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E330.SK (ME.PRO (THERE.ADV (THERE.ADV SEE.V)) ROSY329.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E330.SK))
		(!W2 (E330.SK (BEFORE ?X_D)))
		(!W3 (E330.SK (DURING ?X_G)))
		(!W4 (?X_F (CONSEC E330.SK)))
		(!W5 (?X_F (DURING ?X_G)))
		(!W6 (?X_G (BEFORE ?X_H)))
		(!W7 (E330.SK (AT-ABOUT NOW72)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 33:
	; "Did Cora go to the hill?"
	; "We did not see her there."
	; "When we saw Cora this morning, she was dressing her doll."
	; "She said she was going to see Elsie."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
; TAKE.1.V
; RUN.229.V
; RUN.401.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; FLY.235.V

; story 34:
	; "The bird can fly."
	; "The baby can not have the bird."
	; "She can not fly."
	; "She may play with my doll."
	; "She may have my big hat."
; best schemas are:
; FLY.235.V
; TAKE.1.V
; PLAY.301.V
; GO.658.V
; SIT.211.V
; RUN.254.V

; story 35:
	; "The cats are on the steps."
	; "One cat is sitting on the steps."
	; "One cat is lying on the steps."
	; "Is the black cat lying on the mat?"
	; "No; it is the white one."
	; "The black one is sitting near the white one."
; best schemas are:
; SIT.211.V
; RUN.28.V
; RUN.229.V
; RUN.254.V
; RUN.350.V
; RUN.472.V

; story 36:
	; "Kate has left her doll in its little bed, and has gone to play with Mary and James."
	; "They are all in the shade, now, by the brook."
	; "James digs in the soft sand with his spade, and Mary picks up little stones and puts them in her lap."
	; "James and Mary are glad to see Kate."
	; "She will help them pick up stones and dig, by the little brook."
discarding schema GO.340.V learned from this story
; best schemas are:
; GO.537.V
; PLAY.524.V
; PLAY.679.V
; PLAY.301.V
; GO.658.V
(setf matches (append matches '(( (4.5 10)
("Kate has left her doll in its little bed, and has gone to play with Mary and James."
 "They are all in the shade, now, by the brook."
 "James digs in the soft sand with his spade, and Mary picks up little stones and puts them in her lap."
 "James and Mary are glad to see Kate."
 "She will help them pick up stones and dig, by the little brook.")
(EPI-SCHEMA ((KATE.NAME
              ((ADV-A (IN.P OBJECT408.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P DOLL409.SK))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P OBJECT408.SK)) PLAY.V))))
                  GO.630.V))))
              DOLL409.SK)
             ** E401.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (DOLL409.SK LOCATION.N))
		(!R3 (NOT (?L1 = DOLL409.SK)))
		(!R4 (OBJECT408.SK (PLUR FRIEND.N)))
		(!R5 (OBJECT408.SK HOME.N))
		(!R6 (KATE.NAME GIRL.N))
		(!R7 (KATE.NAME BIRD.N))
		(!R8 (OBJECT408.SK DOLL.N))
		(!R9 (KATE.NAME AGENT.N))
		(!R10 (DOLL409.SK BIG.A))
		(!R11 (DOLL409.SK HAT.N))
		(!R12 (E406.SK (IMPINGES-ON E401.SK)))
		(!R13 (E405.SK (IMPINGES-ON E400.SK)))
		(!R14 (DOLL409.SK DOLL.N))
		(!R15 (DOLL409.SK ARTIFACT.N))
		(!R16 (DOLL409.SK (PERTAIN-TO KATE.NAME)))
		(!R17 (OBJECT408.SK (PERTAIN-TO KATE.NAME)))
	)
	(:GOALS
		(?G1 (KATE.NAME (WANT.V (KA ((ADV-A (AT.P DOLL409.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (KATE.NAME (AT.P ?L1)))
		(?I2 (NOT (KATE.NAME (AT.P DOLL409.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (KATE.NAME (AT.P ?L1))))
		(?P2 (KATE.NAME (AT.P DOLL409.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E401.SK))
		(!W2 (?I2 BEFORE E401.SK))
		(!W3 (?P1 AFTER E401.SK))
		(!W4 (?P2 AFTER E401.SK))
		(!W5 (?G1 CAUSE-OF E401.SK))
		(!W6 (E401.SK (BEFORE ?X_E)))
		(!W7 (E401.SK (AT-ABOUT NOW90)))
		(!W8 (E400.SK (AT-ABOUT NOW90)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R11 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 6)
("Kate has left her doll in its little bed, and has gone to play with Mary and James."
 "They are all in the shade, now, by the brook."
 "James digs in the soft sand with his spade, and Mary picks up little stones and puts them in her lap."
 "James and Mary are glad to see Kate."
 "She will help them pick up stones and dig, by the little brook.")
(EPI-SCHEMA ((KATE.NAME
              ((ADV-A (IN.P OBJECT408.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P DOLL409.SK))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P OBJECT408.SK)) PLAY.V))))
                  GO.638.V))))
              DOLL409.SK)
             ** E401.SK)
	(:ROLES
		(!R1 (KATE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (DOLL409.SK LOCATION.N))
		(!R4 (NOT (?L1 = DOLL409.SK)))
		(!R5 (OBJECT408.SK (PLUR FRIEND.N)))
		(!R6 (OBJECT408.SK HOME.N))
		(!R7 (KATE.NAME GIRL.N))
		(!R8 (E406.SK (IMPINGES-ON E401.SK)))
		(!R9 (E405.SK (IMPINGES-ON E400.SK)))
		(!R10 (OBJECT408.SK (PERTAIN-TO KATE.NAME)))
		(!R11 (DOLL409.SK DOLL.N))
		(!R12 (DOLL409.SK (PERTAIN-TO KATE.NAME)))
	)
	(:GOALS
		(?G1 (KATE.NAME (WANT.V (KA ((ADV-A (AT.P DOLL409.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (KATE.NAME (AT.P ?L1)))
		(?I2 (NOT (KATE.NAME (AT.P DOLL409.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (KATE.NAME (AT.P ?L1))))
		(?P2 (KATE.NAME (AT.P DOLL409.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E401.SK))
		(!W2 (?I2 BEFORE E401.SK))
		(!W3 (?P1 AFTER E401.SK))
		(!W4 (?P2 AFTER E401.SK))
		(!W5 (?G1 CAUSE-OF E401.SK))
		(!W6 (E401.SK (BEFORE ?X_E)))
		(!W7 (E401.SK (AT-ABOUT NOW90)))
		(!W8 (E400.SK (AT-ABOUT NOW90)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 37:
	; "My papa gave me two pretty rabbits."
	; "My rabbits eat from my hand."
	; "I shall keep them in a little house."
	; "I love my dear papa."
discarding schema FEED.343.V learned from this story
discarding schema FEED.351.V learned from this story
discarding schema EAT.342.V learned from this story
; best schemas are:
; PLAY.524.V
; FEED.196.V
; TAKE.1.V
(setf matches (append matches '(( (2.1328125 4)
("My papa gave me two pretty rabbits." "My rabbits eat from my hand."
 "I shall keep them in a little house." "I love my dear papa.")
(EPI-SCHEMA ((ME454.SK ((ADV-A (TO.P PAPA437.SK)) FEED.640.V) RABBITS440.SK
              ?X_D)
             ** ?X_G)
	(:ROLES
		(!R1 (RABBITS440.SK AGENT.N))
		(!R2 (?X_D FOOD.N))
		(!R3 (NOT (ME454.SK = RABBITS440.SK)))
		(!R4 (NOT (RABBITS440.SK = ?X_D)))
		(!R5 (NOT (ME454.SK = ?X_D)))
		(!R6 (?X_D MOUSE.N))
		(!R7 (ME454.SK CAT.N))
		(!R8 (ME454.SK OLD.A))
		(!R9 (RABBITS440.SK MOUSE.N))
		(!R10 (?X_D FOUR.A))
		(!R11 (?X_D (PLUR APPLE.N)))
		(!R12 (E439.SK (RIGHT-AFTER U95)))
		(!R13 (PAPA437.SK PAPA.N))
		(!R14 (PAPA437.SK (DEAR.ADV PAPA.N)))
		(!R15 (PAPA437.SK (PERTAIN-TO ME454.SK)))
		(!R16 (ME454.SK AGENT.N))
		(!R17 (HAND443.SK (PERTAIN-TO ME454.SK)))
		(!R18 (HAND443.SK HAND.N))
		(!R19 (RABBITS440.SK (PLUR RABBIT.N)))
		(!R20 (RABBITS440.SK (PERTAIN-TO ME454.SK)))
	)
	(:GOALS
		(?G1 (ME454.SK (WANT.V (THAT (NOT (RABBITS440.SK HUNGRY.A))))))
		(?G2 (ME454.SK (WANT.V (THAT (RABBITS440.SK EAT.V ?X_D)))))
	)
	(:PRECONDS
		(?I1 (ME454.SK HAVE.V ?X_D))
		(?I2 (RABBITS440.SK HUNGRY.A))
	)
	(:STEPS
		(E439.SK (RABBITS440.SK ((ADV-A (FROM.P HAND443.SK)) EAT.191.V) ?X_D))
	)
	(:POSTCONDS
		(?P1 (NOT (ME454.SK (HAVE.V ?X_D))))
		(?P2 (NOT (RABBITS440.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E439.SK AFTER ?X_G))
		(!W2 (?I1 (AT-ABOUT ?X_F)))
		(!W3 (?X_G (AFTER ?X_H)))
		(!W4 (?X_H (AT-ABOUT ?X_I)))
		(!W5 (E439.SK (SAME-TIME NOW96)))
		(!W6 (E444.SK (AT-ABOUT NOW96)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R4 NECESSARY-TO-DEGREE 1.0))
		(!N4 (!R5 NECESSARY-TO-DEGREE 1.0))
		(!N5 (!R6 NECESSARY-TO-DEGREE 1.0))
		(!N6 (!E NECESSARY-TO-DEGREE 1.0))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_A<- E439.SK) = RABBITS440.SK))
		(!S2 ((?X_C<- E439.SK) = ?X_D))
		(!S3 ((?E1<- E439.SK) = E439.SK))
	)
)
))))
(setf matches (append matches '(( (2.1328125 4)
("My papa gave me two pretty rabbits." "My rabbits eat from my hand."
 "I shall keep them in a little house." "I love my dear papa.")
(EPI-SCHEMA ((ME454.SK ((ADV-A (TO.P HAND443.SK)) FEED.642.V) RABBITS440.SK
              ?X_D)
             ** ?X_G)
	(:ROLES
		(!R1 (RABBITS440.SK AGENT.N))
		(!R2 (?X_D FOOD.N))
		(!R3 (NOT (ME454.SK = RABBITS440.SK)))
		(!R4 (NOT (RABBITS440.SK = ?X_D)))
		(!R5 (NOT (ME454.SK = ?X_D)))
		(!R6 (?X_D MOUSE.N))
		(!R7 (ME454.SK CAT.N))
		(!R8 (ME454.SK OLD.A))
		(!R9 (RABBITS440.SK MOUSE.N))
		(!R10 (?X_D FOUR.A))
		(!R11 (?X_D (PLUR APPLE.N)))
		(!R12 (E439.SK (RIGHT-AFTER U95)))
		(!R13 (ME454.SK AGENT.N))
		(!R14 (HAND443.SK (PERTAIN-TO ME454.SK)))
		(!R15 (HAND443.SK HAND.N))
		(!R16 (RABBITS440.SK (PLUR RABBIT.N)))
		(!R17 (RABBITS440.SK (PERTAIN-TO ME454.SK)))
		(!R18 (PAPA437.SK (DEAR.ADV PAPA.N)))
		(!R19 (PAPA437.SK PAPA.N))
		(!R20 (PAPA437.SK (PERTAIN-TO ME454.SK)))
	)
	(:GOALS
		(?G1 (ME454.SK (WANT.V (THAT (NOT (RABBITS440.SK HUNGRY.A))))))
		(?G2 (ME454.SK (WANT.V (THAT (RABBITS440.SK EAT.V ?X_D)))))
	)
	(:PRECONDS
		(?I1 (ME454.SK HAVE.V ?X_D))
		(?I2 (RABBITS440.SK HUNGRY.A))
	)
	(:STEPS
		(E439.SK (RABBITS440.SK ((ADV-A (FROM.P HAND443.SK)) EAT.191.V) ?X_D))
	)
	(:POSTCONDS
		(?P1 (NOT (ME454.SK (HAVE.V ?X_D))))
		(?P2 (NOT (RABBITS440.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E439.SK AFTER ?X_G))
		(!W2 (?I1 (AT-ABOUT ?X_F)))
		(!W3 (?X_G (AFTER ?X_H)))
		(!W4 (?X_H (AT-ABOUT ?X_I)))
		(!W5 (E439.SK (SAME-TIME NOW96)))
		(!W6 (E444.SK (AT-ABOUT NOW96)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R4 NECESSARY-TO-DEGREE 1.0))
		(!N4 (!R5 NECESSARY-TO-DEGREE 1.0))
		(!N5 (!R6 NECESSARY-TO-DEGREE 1.0))
		(!N6 (!E NECESSARY-TO-DEGREE 1.0))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_A<- E439.SK) = RABBITS440.SK))
		(!S2 ((?X_C<- E439.SK) = ?X_D))
		(!S3 ((?E1<- E439.SK) = E439.SK))
	)
)
))))
(setf matches (append matches '(( (2.1328125 4)
("My papa gave me two pretty rabbits." "My rabbits eat from my hand."
 "I shall keep them in a little house." "I love my dear papa.")
(EPI-SCHEMA ((ME454.SK ((ADV-A (TO.P PAPA437.SK)) FEED.644.V) RABBITS440.SK
              ?X_D)
             ** ?X_G)
	(:ROLES
		(!R1 (RABBITS440.SK AGENT.N))
		(!R2 (?X_D FOOD.N))
		(!R3 (NOT (ME454.SK = RABBITS440.SK)))
		(!R4 (NOT (RABBITS440.SK = ?X_D)))
		(!R5 (NOT (ME454.SK = ?X_D)))
		(!R6 (?X_D MOUSE.N))
		(!R7 (ME454.SK CAT.N))
		(!R8 (ME454.SK OLD.A))
		(!R9 (RABBITS440.SK MOUSE.N))
		(!R10 (?X_D FOUR.A))
		(!R11 (?X_D (PLUR APPLE.N)))
		(!R12 (E439.SK (RIGHT-AFTER U95)))
		(!R13 (ME454.SK AGENT.N))
		(!R14 (PAPA437.SK (DEAR.ADV PAPA.N)))
		(!R15 (PAPA437.SK PAPA.N))
		(!R16 (PAPA437.SK (PERTAIN-TO ME454.SK)))
		(!R17 (RABBITS440.SK (PLUR RABBIT.N)))
		(!R18 (RABBITS440.SK (PERTAIN-TO ME454.SK)))
		(!R19 (HAND443.SK HAND.N))
		(!R20 (HAND443.SK (PERTAIN-TO ME454.SK)))
	)
	(:GOALS
		(?G1 (ME454.SK (WANT.V (THAT (NOT (RABBITS440.SK HUNGRY.A))))))
		(?G2 (ME454.SK (WANT.V (THAT (RABBITS440.SK EAT.V ?X_D)))))
	)
	(:PRECONDS
		(?I1 (ME454.SK HAVE.V ?X_D))
		(?I2 (RABBITS440.SK HUNGRY.A))
	)
	(:STEPS
		(E444.SK (RABBITS440.SK ((ADV-A (FROM.P HAND443.SK)) EAT.191.V) ?X_D))
	)
	(:POSTCONDS
		(?P1 (NOT (ME454.SK (HAVE.V ?X_D))))
		(?P2 (NOT (RABBITS440.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E444.SK AFTER ?X_G))
		(!W2 (?I1 (AT-ABOUT ?X_F)))
		(!W3 (?X_G (AFTER ?X_H)))
		(!W4 (?X_H (AT-ABOUT ?X_I)))
		(!W5 (E444.SK (AT-ABOUT NOW96)))
		(!W6 (E439.SK (SAME-TIME NOW96)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R4 NECESSARY-TO-DEGREE 1.0))
		(!N4 (!R5 NECESSARY-TO-DEGREE 1.0))
		(!N5 (!R6 NECESSARY-TO-DEGREE 1.0))
		(!N6 (!E NECESSARY-TO-DEGREE 1.0))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_A<- E444.SK) = RABBITS440.SK))
		(!S2 ((?X_C<- E444.SK) = ?X_D))
		(!S3 ((?E1<- E444.SK) = E444.SK))
	)
)
))))

; story 38:
	; "I have three good apples."
	; "One is red, and two are yellow."
	; "I will give you the red one."
	; "I see a big red apple in the tree."
; best schemas are:
; PLAY.524.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
; GO.537.V
; TAKE.1.V
; GIVE.194.V
; FEED.660.V
(setf matches (append matches '(( (2.2590625 2)
("I have three good apples." "One is red, and two are yellow."
 "I will give you the red one." "I see a big red apple in the tree.")
(EPI-SCHEMA ((ME473.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.698.V
              (KA ((THERE.ADV SEE.V) BIG471.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) BIG471.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ME473.SK CAT.N))
		(!R4 (BIG471.SK RAT.N))
		(!R5 (ME473.SK AGENT.N))
		(!R6 (BIG471.SK BIG.A))
		(!R7 (TREE469.SK TREE.N))
	)
	(:GOALS
		(?G1 (ME473.SK (WANT.V (THAT (NOT (ME473.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME473.SK (THERE.ADV SEE.V) BIG471.SK)) CAUSE-OF
    (KE (ME473.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E472.SK
   (ME473.SK ((ADV-A (IN.P TREE469.SK)) (THERE.ADV (THERE.ADV SEE.V)))
    BIG471.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E472.SK))
		(!W2 (E472.SK (BEFORE ?X_D)))
		(!W3 (E472.SK (CONSEC ?X_C)))
		(!W4 (?X_C (BEFORE ?X_F)))
		(!W5 (E472.SK (BEFORE ?X_F)))
		(!W6 (E472.SK (AT-ABOUT NOW102)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (7.183437 10)
("I have three good apples." "One is red, and two are yellow."
 "I will give you the red one." "I see a big red apple in the tree.")
(EPI-SCHEMA ((ME473.SK ((ADV-A (TO.P ?X_B)) FEED.708.V) YOU.PRO ONE463.SK) **
             E466.SK)
	(:ROLES
		(!R1 (ONE463.SK FOOD.N))
		(!R2 (NOT (ME473.SK = YOU.PRO)))
		(!R3 (NOT (YOU.PRO = ONE463.SK)))
		(!R4 (NOT (ME473.SK = ONE463.SK)))
		(!R5 (ONE463.SK MOUSE.N))
		(!R6 (ME473.SK CAT.N))
		(!R7 (ME473.SK OLD.A))
		(!R8 (YOU.PRO MOUSE.N))
		(!R9 (ONE463.SK FOUR.A))
		(!R10 (ONE463.SK (PLUR APPLE.N)))
		(!R11 (?X_J (RIGHT-AFTER ?X_A)))
		(!R12 (?X_B PAPA.N))
		(!R13 (?X_B (DEAR.ADV PAPA.N)))
		(!R14 (?X_B (PERTAIN-TO ME473.SK)))
		(!R15 (YOU.PRO (PLUR RABBIT.N)))
		(!R16 (YOU.PRO (PERTAIN-TO ME473.SK)))
		(!R17 (?X_C (PERTAIN-TO ME473.SK)))
		(!R18 (?X_C HAND.N))
		(!R19 (ONE463.SK ONE.N))
		(!R20 (ONE463.SK RED.A))
		(!R21 (ME473.SK AGENT.N))
		(!R22 (YOU.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (ME473.SK (WANT.V (THAT (NOT (YOU.PRO HUNGRY.A))))))
		(?G2 (ME473.SK (WANT.V (THAT (YOU.PRO EAT.V ONE463.SK)))))
	)
	(:PRECONDS
		(?I1 (ME473.SK HAVE.V ONE463.SK))
		(?I2 (YOU.PRO HUNGRY.A))
	)
	(:STEPS
		(?E1 (YOU.PRO ((ADV-A (FROM.P ?X_C)) EAT.191.V) ONE463.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (ME473.SK (HAVE.V ONE463.SK))))
		(?P2 (NOT (YOU.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E466.SK))
		(!W2 (?I1 (AT-ABOUT ?X_F)))
		(!W3 (E466.SK (AFTER ?X_H)))
		(!W4 (?X_H (AT-ABOUT ?X_I)))
		(!W5 (?E1 (AT-ABOUT ?X_K)))
		(!W6 (?X_J (SAME-TIME ?X_K)))
		(!W7 (E466.SK (AFTER E460.SK)))
		(!W8 (E460.SK (AT-ABOUT NOW101)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R4 NECESSARY-TO-DEGREE 1.0))
		(!N4 (!R5 NECESSARY-TO-DEGREE 1.0))
		(!N5 (!R6 NECESSARY-TO-DEGREE 1.0))
		(!N6 (!E NECESSARY-TO-DEGREE 1.0))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_A<- ?E1) = YOU.PRO))
		(!S2 ((?X_C<- ?E1) = ONE463.SK))
		(!S3 ((?E1<- ?E1) = ?E1))
	)
)
))))

; story 39:
	; "I have three good apples."
	; "One is red, and two are yellow."
	; "I will give you the red one."
	; "I see a big red apple in the tree."
; best schemas are:
; PLAY.524.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
; GO.537.V
; TAKE.1.V
; GIVE.194.V
; FEED.660.V
(setf matches (append matches '(( (2.2590625 2)
("I have three good apples." "One is red, and two are yellow."
 "I will give you the red one." "I see a big red apple in the tree.")
(EPI-SCHEMA ((ME492.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.698.V
              (KA ((THERE.ADV SEE.V) BIG490.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) BIG490.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ME492.SK CAT.N))
		(!R4 (BIG490.SK RAT.N))
		(!R5 (ME492.SK AGENT.N))
		(!R6 (BIG490.SK BIG.A))
		(!R7 (TREE488.SK TREE.N))
	)
	(:GOALS
		(?G1 (ME492.SK (WANT.V (THAT (NOT (ME492.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME492.SK (THERE.ADV SEE.V) BIG490.SK)) CAUSE-OF
    (KE (ME492.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E491.SK
   (ME492.SK ((ADV-A (IN.P TREE488.SK)) (THERE.ADV (THERE.ADV SEE.V)))
    BIG490.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E491.SK))
		(!W2 (E491.SK (BEFORE ?X_D)))
		(!W3 (E491.SK (CONSEC ?X_C)))
		(!W4 (?X_C (BEFORE ?X_F)))
		(!W5 (E491.SK (BEFORE ?X_F)))
		(!W6 (E491.SK (AT-ABOUT NOW106)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (7.183437 10)
("I have three good apples." "One is red, and two are yellow."
 "I will give you the red one." "I see a big red apple in the tree.")
(EPI-SCHEMA ((ME492.SK ((ADV-A (TO.P ?X_B)) FEED.708.V) YOU.PRO ONE484.SK) **
             E485.SK)
	(:ROLES
		(!R1 (ONE484.SK FOOD.N))
		(!R2 (NOT (ME492.SK = YOU.PRO)))
		(!R3 (NOT (YOU.PRO = ONE484.SK)))
		(!R4 (NOT (ME492.SK = ONE484.SK)))
		(!R5 (ONE484.SK MOUSE.N))
		(!R6 (ME492.SK CAT.N))
		(!R7 (ME492.SK OLD.A))
		(!R8 (YOU.PRO MOUSE.N))
		(!R9 (ONE484.SK FOUR.A))
		(!R10 (ONE484.SK (PLUR APPLE.N)))
		(!R11 (?X_J (RIGHT-AFTER ?X_A)))
		(!R12 (?X_B PAPA.N))
		(!R13 (?X_B (DEAR.ADV PAPA.N)))
		(!R14 (?X_B (PERTAIN-TO ME492.SK)))
		(!R15 (YOU.PRO (PLUR RABBIT.N)))
		(!R16 (YOU.PRO (PERTAIN-TO ME492.SK)))
		(!R17 (?X_C (PERTAIN-TO ME492.SK)))
		(!R18 (?X_C HAND.N))
		(!R19 (ONE484.SK ONE.N))
		(!R20 (ONE484.SK RED.A))
		(!R21 (ME492.SK AGENT.N))
		(!R22 (YOU.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (ME492.SK (WANT.V (THAT (NOT (YOU.PRO HUNGRY.A))))))
		(?G2 (ME492.SK (WANT.V (THAT (YOU.PRO EAT.V ONE484.SK)))))
	)
	(:PRECONDS
		(?I1 (ME492.SK HAVE.V ONE484.SK))
		(?I2 (YOU.PRO HUNGRY.A))
	)
	(:STEPS
		(?E1 (YOU.PRO ((ADV-A (FROM.P ?X_C)) EAT.191.V) ONE484.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (ME492.SK (HAVE.V ONE484.SK))))
		(?P2 (NOT (YOU.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E485.SK))
		(!W2 (?I1 (AT-ABOUT ?X_F)))
		(!W3 (E485.SK (AFTER ?X_H)))
		(!W4 (?X_H (AT-ABOUT ?X_I)))
		(!W5 (?E1 (AT-ABOUT ?X_K)))
		(!W6 (?X_J (SAME-TIME ?X_K)))
		(!W7 (E485.SK (AFTER E481.SK)))
		(!W8 (E481.SK (AT-ABOUT NOW105)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R4 NECESSARY-TO-DEGREE 1.0))
		(!N4 (!R5 NECESSARY-TO-DEGREE 1.0))
		(!N5 (!R6 NECESSARY-TO-DEGREE 1.0))
		(!N6 (!E NECESSARY-TO-DEGREE 1.0))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_A<- ?E1) = YOU.PRO))
		(!S2 ((?X_C<- ?E1) = ONE484.SK))
		(!S3 ((?E1<- ?E1) = ?E1))
	)
)
))))

; story 40:
	; "Come with me, and see the boys."
	; "One little boy has a drum."
	; "Two boys have big hats."
	; "One boy has a ball."
; best schemas are:
; PLAY.524.V
; TAKE.656.V
; GIVE.1297.V
; GET.1669.V
; PLAY.990.V
; PLAY.991.V

; story 41:
	; "A top spins."
	; "The tops spin."
	; "Tom spins the tops."
	; "He spins the tops on a box."
	; "Tom spins my large top."
	; "He spins my small top."
	; "Spin, tops, spin."
; best schemas are:
; TAKE.1.V
; PLAY.524.V
; FLY.235.V
; GO.537.V
; TAKE.413.V
; FEED.660.V

; story 42:
	; "Here are two dogs."
	; "One dog is black."
	; "One dog is white."
	; "A dog runs."
	; "The dogs run."
	; "Run, dogs, run."
	; "One dog and one dog are two dogs."
discarding schema RUN.179.V learned from this story
discarding schema RUN.179.V learned from this story
; best schemas are:
; RUN.350.V
; RUN.929.V
; GO.1040.V
; GO.194.V
(setf matches (append matches '(( (2.405 2)
("Here are two dogs." "One dog is black." "One dog is white." "A dog runs."
 "The dogs run." "Run, dogs, run." "One dog and one dog are two dogs.")
(EPI-SCHEMA ((DOG542.SK ((ADV-A (FROM.P ?X_B)) ((ADV-A (TO.P ?X_D)) RUN.798.V))
              ?X_D)
             ** E541.SK)
	(:ROLES
		(!R1 (DOG542.SK AGENT.N))
		(!R2 (?X_B LOCATION.N))
		(!R3 (?X_D LOCATION.N))
		(!R4 (NOT (?X_B = ?X_D)))
		(!R5 (DOG542.SK BLACK.A))
		(!R6 (DOG542.SK HEN.N))
		(!R7 (?X_D (PERTAIN-TO DOG542.SK)))
		(!R8 (?X_D NEST.N))
		(!R9 (E541.SK (IMPINGES-ON ?X_F)))
		(!R10 (?X_B TOP.N))
		(!R11 (?X_B (PERTAIN-TO ?X_A)))
		(!R12 (DOG542.SK DOG.N))
		(!R13 (DOG542.SK VERTEBRATE.N))
	)
	(:GOALS
		(?G1 (DOG542.SK (WANT.V (KA ((ADV-A (AT.P ?X_D)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG542.SK (AT.P ?X_B)))
		(?I2 (NOT (DOG542.SK (AT.P ?X_D))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG542.SK (AT.P ?X_B))))
		(?P2 (DOG542.SK (AT.P ?X_D)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E541.SK))
		(!W2 (?I2 BEFORE E541.SK))
		(!W3 (?P1 AFTER E541.SK))
		(!W4 (?P2 AFTER E541.SK))
		(!W5 (?G1 CAUSE-OF E541.SK))
		(!W6 (?X_F (AT-ABOUT ?X_G)))
		(!W7 (E541.SK (AT-ABOUT NOW121)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 1)
("Here are two dogs." "One dog is black." "One dog is white." "A dog runs."
 "The dogs run." "Run, dogs, run." "One dog and one dog are two dogs.")
(EPI-SCHEMA ((DOG542.SK
              ((ADV-A (THROUGH.P ?X_A))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_C)) RUN.799.V)))
              ?L2)
             ** E541.SK)
	(:ROLES
		(!R1 (DOG542.SK AGENT.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?X_C = ?L2)))
		(!R5 (?X_A PARK.N))
		(!R6 (DOGS532.SK (PERTAIN-TO DOG542.SK)))
		(!R7 (DOGS532.SK DOG.N))
		(!R8 (?X_C END.N))
		(!R9 (DOG542.SK DOG.N))
		(!R10 (DOGS532.SK TWO.A))
		(!R11 (DOGS532.SK (PLUR DOG.N)))
	)
	(:GOALS
		(?G1 (DOG542.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG542.SK (AT.P ?X_C)))
		(?I2 (NOT (DOG542.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG542.SK (AT.P ?X_C))))
		(?P2 (DOG542.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E541.SK))
		(!W2 (?I2 BEFORE E541.SK))
		(!W3 (?P1 AFTER E541.SK))
		(!W4 (?P2 AFTER E541.SK))
		(!W5 (?G1 CAUSE-OF E541.SK))
		(!W6 (E541.SK (BEFORE ?X_F)))
		(!W7 (E541.SK (AT-ABOUT NOW121)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 0)
("Here are two dogs." "One dog is black." "One dog is white." "A dog runs."
 "The dogs run." "Run, dogs, run." "One dog and one dog are two dogs.")
(EPI-SCHEMA ((DOG542.SK
              (OUTSIDE.ADV
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.303.V)))
              ?L2)
             ** E541.SK)
	(:ROLES
		(!R1 (DOG542.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (DOG542.SK DOG.N))
	)
	(:GOALS
		(?G1 (DOG542.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG542.SK (AT.P ?L1)))
		(?I2 (NOT (DOG542.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG542.SK (AT.P ?L1))))
		(?P2 (DOG542.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E541.SK))
		(!W2 (?I2 BEFORE E541.SK))
		(!W3 (?P1 AFTER E541.SK))
		(!W4 (?P2 AFTER E541.SK))
		(!W5 (?G1 CAUSE-OF E541.SK))
		(!W6 (E541.SK (BEFORE ?X_C)))
		(!W7 (E541.SK (AT-ABOUT NOW121)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 0)
("Here are two dogs." "One dog is black." "One dog is white." "A dog runs."
 "The dogs run." "Run, dogs, run." "One dog and one dog are two dogs.")
(EPI-SCHEMA ((DOG542.SK
              ((ADV-A (IN.P ?X_A))
               (OUTSIDE.ADV
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.800.V))))
              ?L2)
             ** E541.SK)
	(:ROLES
		(!R1 (DOG542.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A YARD.N))
		(!R6 (E541.SK (RIGHT-AFTER ?X_B)))
		(!R7 (?X_C (PERTAIN-TO DOG542.SK)))
		(!R8 (DOG542.SK DOG.N))
	)
	(:GOALS
		(?G1 (DOG542.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG542.SK (AT.P ?L1)))
		(?I2 (NOT (DOG542.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG542.SK (AT.P ?L1))))
		(?P2 (DOG542.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E541.SK))
		(!W2 (?I2 BEFORE E541.SK))
		(!W3 (?P1 AFTER E541.SK))
		(!W4 (?P2 AFTER E541.SK))
		(!W5 (?G1 CAUSE-OF E541.SK))
		(!W6 (E541.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E541.SK (AT-ABOUT NOW121)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 43:
	; "Do you see the man and the woman in this large boat?"
	; "They have no house; they live in the boat."
	; "What have they in the boat?"
	; "They have corn and cocoanuts."
	; "They are taking them to Manila."
; best schemas are:
; TAKE.1.V
; TAKE.928.V
; TAKE.10.V
; TAKE.135.V
; TAKE.885.V
; TAKE.958.V

; story 44:
	; "The girl is good to the little baby."
	; "The baby may have my big doll."
	; "She can not catch the bird."
	; "She may come with me and see the bird fly."
; best schemas are:
; PLAY.524.V
; GO.537.V
; GO.758.V
; TAKE.1.V
; FLY.235.V
; RUN.254.V

; story 45:
	; "It is raining."
	; "It rains on the cows and the calf."
	; "It rains on the man and the horses."
	; "One of the horses is drinking from the brook."
	; "The rain makes the grass and the flowers grow."
; best schemas are:
; FIND.562.V
; EAT.564.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; GO_FIND_EAT.566.PR
; EAT.586.V
; PLAY.920.V

; story 46:
	; "The little boy has a red wagon."
	; "The boy will let little May ride in it."
	; "Come, May, come and see my wagon."
	; "You may get in it, and have a ride."
	; "I will take you with me to the fields."
	; "You may have a good ride."
; best schemas are:
; TAKE.895.V
; TAKE.1.V
; GO.866.V
; GO.839.V
; GO.843.V
; TAKE.946.V

; story 47:
	; "Here is John with his ball."
	; "He and Tyke are playing ball."
	; "John likes to play ball with Tyke."
	; "John can catch the ball."
	; "Tyke can catch it, too."
	; "John rolls the ball to Tyke."
	; "Tyke takes the ball to John."
discarding schema TAKE.656.V learned from this story
discarding schema ROLL.657.V learned from this story
; best schemas are:
; PLAY.990.V
; PLAY.991.V
; GO.866.V
; GO.1084.V
(setf matches (append matches '(( (4.1953125 9)
("Here is John with his ball." "He and Tyke are playing ball."
 "John likes to play ball with Tyke." "John can catch the ball."
 "Tyke can catch it, too." "John rolls the ball to Tyke."
 "Tyke takes the ball to John.")
(EPI-SCHEMA ((JOHN.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_B)) PLAY.V))))
               ((ADV-A (TO.P BALL651.SK)) ((ADV-A (FROM.P ?X_F)) ROLL.1112.V)))
              BALL651.SK)
             ** E662.SK)
	(:ROLES
		(!R1 (?X_F LOCATION.N))
		(!R2 (BALL651.SK LOCATION.N))
		(!R3 (NOT (?X_F = BALL651.SK)))
		(!R4 (?X_B (PLUR FRIEND.N)))
		(!R5 (?X_B HOME.N))
		(!R6 (JOHN.NAME BIRD.N))
		(!R7 (?X_B DOLL.N))
		(!R8 (BALL651.SK HAT.N))
		(!R9 (?X_F (PLUR TOP.N)))
		(!R10 (?X_F (ON.P ?X_A)))
		(!R11 (?X_A BOX.N))
		(!R12 (?X_B (PERTAIN-TO JOHN.NAME)))
		(!R13 (BALL651.SK TOP.N))
		(!R14 (JOHN.NAME GIRL.N))
		(!R15 (?X_B LITTLE.A))
		(!R16 (?X_B BABY.N))
		(!R17 (?X_B BIRD.N))
		(!R18 (BALL651.SK BIG.A))
		(!R19 (BALL651.SK DOLL.N))
		(!R20 (JOHN.NAME AGENT.N))
		(!R21 (JOHN.NAME (WITH.P BALL651.SK)))
		(!R22 (BALL651.SK (PERTAIN-TO JOHN.NAME)))
		(!R23 (BALL651.SK (TO.P (K TYKE.N))))
		(!R24 (BALL651.SK (TO.P JOHN.NAME)))
		(!R25 (BALL651.SK BALL.N))
		(!R26 (BALL651.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (JOHN.NAME (WANT.V (KA ((ADV-A (AT.P BALL651.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JOHN.NAME (AT.P ?X_F)))
		(?I2 (NOT (JOHN.NAME (AT.P BALL651.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JOHN.NAME (AT.P ?X_F))))
		(?P2 (JOHN.NAME (AT.P BALL651.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E662.SK))
		(!W2 (?I2 BEFORE E662.SK))
		(!W3 (?P1 AFTER E662.SK))
		(!W4 (?P2 AFTER E662.SK))
		(!W5 (?G1 CAUSE-OF E662.SK))
		(!W6 (E662.SK (BEFORE ?X_E)))
		(!W7 (E662.SK (AT-ABOUT NOW150)))
	)
	(:CERTAINTIES
		(!C1 (!R26 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R19 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R26 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R25 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R26 CERTAIN-TO-DEGREE (/ 2 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.1953125 14)
("Here is John with his ball." "He and Tyke are playing ball."
 "John likes to play ball with Tyke." "John can catch the ball."
 "Tyke can catch it, too." "John rolls the ball to Tyke."
 "Tyke takes the ball to John.")
(EPI-SCHEMA ((JOHN.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P BALL651.SK)) PLAY.V))))
               ((ADV-A (TO.P BALL651.SK)) ((ADV-A (FROM.P ?X_B)) ROLL.1113.V)))
              BALL651.SK)
             ** E662.SK)
	(:ROLES
		(!R1 (?X_B LOCATION.N))
		(!R2 (BALL651.SK LOCATION.N))
		(!R3 (NOT (?X_B = BALL651.SK)))
		(!R4 (BALL651.SK (PLUR FRIEND.N)))
		(!R5 (BALL651.SK HOME.N))
		(!R6 (JOHN.NAME GIRL.N))
		(!R7 (BALL651.SK HAT.N))
		(!R8 (JOHN.NAME LITTLE.A))
		(!R9 (JOHN.NAME BIRD.N))
		(!R10 (JOHN.NAME BABY.N))
		(!R11 (BALL651.SK DOLL.N))
		(!R12 (BALL651.SK BIG.A))
		(!R13 (?X_B (PLUR FIELD.N)))
		(!R14 (BALL651.SK WAGON.N))
		(!R15 (BALL651.SK RED.A))
		(!R16 (JOHN.NAME AGENT.N))
		(!R17 (JOHN.NAME (WITH.P BALL651.SK)))
		(!R18 (BALL651.SK (PERTAIN-TO JOHN.NAME)))
		(!R19 (BALL651.SK (TO.P (K TYKE.N))))
		(!R20 (BALL651.SK (TO.P JOHN.NAME)))
		(!R21 (BALL651.SK BALL.N))
		(!R22 (BALL651.SK ARTIFACT.N))
		(!R23 (BALL651.SK INSTRUMENTALITY.N))
	)
	(:GOALS
		(?G1 (JOHN.NAME (WANT.V (KA ((ADV-A (AT.P BALL651.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JOHN.NAME (AT.P ?X_B)))
		(?I2 (NOT (JOHN.NAME (AT.P BALL651.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JOHN.NAME (AT.P ?X_B))))
		(?P2 (JOHN.NAME (AT.P BALL651.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E662.SK))
		(!W2 (?I2 BEFORE E662.SK))
		(!W3 (?P1 AFTER E662.SK))
		(!W4 (?P2 AFTER E662.SK))
		(!W5 (?G1 CAUSE-OF E662.SK))
		(!W6 (E662.SK (BEFORE ?X_E)))
		(!W7 (E662.SK (AT-ABOUT NOW150)))
	)
	(:CERTAINTIES
		(!C1 (!R22 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C4 (!R22 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C6 (!R14 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C7 (!R22 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R22 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C10 (!R22 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R22 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R14 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C13 (!R22 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R22 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R22 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R22 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R14 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C18 (!R22 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R22 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R22 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R22 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R21 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C23 (!R22 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C24 (!R22 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C25 (!R22 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C26 (!R23 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C27 (!R23 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C28 (!R23 CERTAIN-TO-DEGREE (/ 2 6)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 48:
	; "The old cat can catch a mouse."
	; "She has a mouse in her mouth."
	; "What will she do with it?"
	; "She will give it to her little kittens."
	; "They will play with the mouse."
	; "They are not afraid of it; but the mouse is afraid of the kittens."
discarding schema FEED.660.V learned from this story
; best schemas are:
; TAKE.895.V
; GIVE.194.V
; FEED.196.V
; PLAY.524.V
; GIVE.1297.V
(setf matches (append matches '(( (8.809999 6)
("The old cat can catch a mouse." "She has a mouse in her mouth."
 "What will she do with it?" "She will give it to her little kittens."
 "They will play with the mouse."
 "They are not afraid of it; but the mouse is afraid of the kittens.")
(EPI-SCHEMA ((CAT677.SK ((ADV-A (TO.P OBJECT687.SK)) FEED.1127.V) MOUSE675.SK
              MOUSE682.SK)
             ** E690.SK)
	(:ROLES
		(!R1 (CAT677.SK AGENT.N))
		(!R2 (MOUSE675.SK AGENT.N))
		(!R3 (MOUSE682.SK FOOD.N))
		(!R4 (NOT (CAT677.SK = MOUSE675.SK)))
		(!R5 (NOT (MOUSE675.SK = MOUSE682.SK)))
		(!R6 (NOT (CAT677.SK = MOUSE682.SK)))
		(!R7 (MOUSE682.SK FOUR.A))
		(!R8 (MOUSE682.SK (PLUR APPLE.N)))
		(!R9 (MOUSE682.SK MOUSE.N))
		(!R10 (CAT677.SK CAT.N))
		(!R11 (CAT677.SK OLD.A))
		(!R12 (MOUSE675.SK MOUSE.N))
		(!R13 (OBJECT687.SK (PERTAIN-TO CAT677.SK)))
	)
	(:GOALS
		(?G1 (CAT677.SK (WANT.V (THAT (NOT (MOUSE675.SK HUNGRY.A))))))
		(?G2 (CAT677.SK (WANT.V (THAT (MOUSE675.SK EAT.V MOUSE682.SK)))))
	)
	(:PRECONDS
		(E683.SK (CAT677.SK HAVE.V MOUSE682.SK))
		(?I2 (MOUSE675.SK HUNGRY.A))
	)
	(:STEPS
		(?E1 (MOUSE675.SK EAT.191.V MOUSE682.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (CAT677.SK (HAVE.V MOUSE682.SK))))
		(?P2 (NOT (MOUSE675.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E690.SK))
		(!W2 (E683.SK (AT-ABOUT ?X_F)))
		(!W3 (E690.SK (AFTER ?X_H)))
		(!W4 (?X_H (AT-ABOUT ?X_I)))
		(!W5 (E683.SK (AT-ABOUT NOW153)))
		(!W6 (E690.SK (AFTER E686.SK)))
		(!W7 (E686.SK (AT-ABOUT NOW155)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R4 NECESSARY-TO-DEGREE 1.0))
		(!N4 (!R5 NECESSARY-TO-DEGREE 1.0))
		(!N5 (!R6 NECESSARY-TO-DEGREE 1.0))
		(!N6 (!E NECESSARY-TO-DEGREE 1.0))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_A<- ?E1) = MOUSE675.SK))
		(!S2 ((?X_C<- ?E1) = MOUSE682.SK))
		(!S3 ((?E1<- ?E1) = ?E1))
	)
)
))))

; story 49:
	; "Ann gave Ned three cakes of paint."
	; "She told him to paint just what you see here."
	; "She gave him red and yellow."
	; "Here is a new color: It is purple."
	; "Red and blue make purple."
; best schemas are:
; TAKE.958.V
; GIVE.947.V
; GIVE.V
; FIND.129.V
; MOVE.342.V
; EAT.516.V

; story 50:
	; "A little bird can not eat nuts."
	; "He likes crumbs."
	; "Squirrels have sharp teeth."
	; "It is easy for them to eat nuts."
; best schemas are:
; FEED.660.V
; FEED.196.V
; TAKE.895.V
; EAT.V
; FEED.V
; FEED.343.V
; error processing story
; story 51:
	; "Little Henry went to school this morning."
	; "All the children were glad to see him as he came down the street."
	; "He is a funny little boy, and I am sure you would like him."
	; "He says he will grow very fast and soon be a man."
	; "He likes to go to school."
; best schemas are:
; RUN.472.V
; FIND.888.V
; GO.642.V
; GO.423.V
; GO.1261.V
; GO.1411.V

; story 52:
	; "Frank has gone to the field with his kite."
	; "He likes to play with it."
	; "It is the kite his father gave him."
	; "He will run and the kite will fly."
	; "He can run very fast, and the kite can fly very high."
	; "John does not like to run with a kite."
	; "He likes to play on his drum."
	; "He will play on his drum, and Frank will run with his kite."
discarding schema GO.680.V learned from this story
; best schemas are:
; GO.1084.V
; GO.1024.V
; GO.1040.V
; GO.1083.V
; GO.340.V
(setf matches (append matches '(( (4.7302294 5)
("Frank has gone to the field with his kite." "He likes to play with it."
 "It is the kite his father gave him." "He will run and the kite will fly."
 "He can run very fast, and the kite can fly very high."
 "John does not like to run with a kite." "He likes to play on his drum."
 "He will play on his drum, and Frank will run with his kite.")
(EPI-SCHEMA ((FRANK.NAME
              ((ADV-A (WITH.P KITE765.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P FIELD763.SK))
                 ((ADV-A
                   (FOR.P
                    (KA
                     ((ADV-A (WITH.P (SET-OF KITE792.SK FRANK.NAME)))
                      PLAY.V))))
                  GO.1168.V))))
              FIELD763.SK)
             ** E762.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (FIELD763.SK LOCATION.N))
		(!R4 (NOT (?L1 = FIELD763.SK)))
		(!R5 (KITE792.SK LAP.N))
		(!R6 (KITE792.SK (PERTAIN-TO KITE792.SK)))
		(!R7 (?X_B (IMPINGES-ON E762.SK)))
		(!R8 (?X_C (PERTAIN-TO FRANK.NAME)))
		(!R9 (?X_D DOLL.N))
		(!R10 (?X_D (PERTAIN-TO FRANK.NAME)))
		(!R11 (KITE765.SK SPADE.N))
		(!R12 (FIELD763.SK FIELD.N))
		(!R13 (E762.SK (IMPINGES-ON E757.SK)))
		(!R14 (KITE792.SK (PERTAIN-TO FRANK.NAME)))
		(!R15 (KITE792.SK KITE.N))
		(!R16 (KITE765.SK (PERTAIN-TO FRANK.NAME)))
		(!R17 (KITE765.SK KITE.N))
	)
	(:GOALS
		(?G1 (FRANK.NAME (WANT.V (KA ((ADV-A (AT.P FIELD763.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRANK.NAME (AT.P ?L1)))
		(?I2 (NOT (FRANK.NAME (AT.P FIELD763.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRANK.NAME (AT.P ?L1))))
		(?P2 (FRANK.NAME (AT.P FIELD763.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E762.SK))
		(!W2 (?I2 BEFORE E762.SK))
		(!W3 (?P1 AFTER E762.SK))
		(!W4 (?P2 AFTER E762.SK))
		(!W5 (?G1 CAUSE-OF E762.SK))
		(!W6 (E762.SK (AT-ABOUT ?X_K)))
		(!W7 (E757.SK (AT-ABOUT ?X_K)))
		(!W8 (E757.SK (AT-ABOUT NOW172)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 53:
	; "I have a large mango."
	; "This mango is larger than mine."
	; "That is the largest mango in the basket."
	; "This tree is tall."
	; "That tree is taller than this one."
	; "The cocoanut tree is the tallest tree in the yard."
; best schemas are:
; CLIMB_GET_EAT.349.PR
; PLAY.524.V
; FEED.457.V
; FEED.457.V
; EAT.323.V
; FEED.324.V

; story 54:
	; "I can see a swan."
	; "A swan can swim well."
	; "A swan can not walk well, but she can swim very fast."
	; "The swan has a nest by the side of the pond."
	; "She lays eggs in her nest."
	; "She is a white swan."
; best schemas are:
; TAKE.1391.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; PLAY.524.V
; PLAY.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; PLAY.920.V

; story 55:
	; "We live on the round earth."
	; "There is land and water on all sides of it."
	; "Men have sailed all around it in ships."
	; "All sails are set."
	; "Men can sail it over the wide, wide sea."
; best schemas are:
; GO.742.V
; FALL.25.V
; FIND.773.V
; CLIMB_GET_EAT.349.PR
; FLOAT.561.V
; GO.423.V

; story 56:
	; "I see a fox on a box, and a fox in front of a box."
	; "Frank has two foxes and two boxes."
	; "He gave each fox a box in which to sleep."
	; "He put hay in the boxes."
	; "The boxes are good houses for them."
	; "Frank feeds his foxes and gives them water."
; best schemas are:
; TAKE.895.V
; GO.866.V
; GO.1024.V
; PLAY.524.V
; GO.1084.V
; GO.1040.V

; story 57:
	; "The girls have come to play with the baby."
	; "Two girls have little dolls."
	; "One girl has a red dress."
	; "The baby is glad to see the girls."
	; "The girl with the red dress is May."
	; "May is glad to see the good baby."
	; "She will take the baby to see the bird."
; best schemas are:
; GO.1367.V
; TAKE.1270.V
; TAKE.1290.V
; GO.1084.V
; GO.1338.V
; GO.1024.V
(setf matches (append matches '(( (2.905 16)
("The girls have come to play with the baby." "Two girls have little dolls."
 "One girl has a red dress." "The baby is glad to see the girls."
 "The girl with the red dress is May." "May is glad to see the good baby."
 "She will take the baby to see the bird.")
(EPI-SCHEMA ((GIRL914.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P BABY913.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_B)) COME.1406.V)))
              ?L2)
             ** E911.SK)
	(:ROLES
		(!R1 (?X_B LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?X_B = ?L2)))
		(!R4 (BABY913.SK (PLUR FRIEND.N)))
		(!R5 (BABY913.SK HOME.N))
		(!R6 (GIRL914.SK GIRL.N))
		(!R7 (BABY913.SK HAT.N))
		(!R8 (GIRL914.SK LITTLE.A))
		(!R9 (GIRL914.SK BIRD.N))
		(!R10 (GIRL914.SK BABY.N))
		(!R11 (BABY913.SK DOLL.N))
		(!R12 (BABY913.SK BIG.A))
		(!R13 (?X_B (PLUR FIELD.N)))
		(!R14 (BABY913.SK WAGON.N))
		(!R15 (BABY913.SK RED.A))
		(!R16 (GIRL914.SK AGENT.N))
		(!R17 (BABY913.SK (PERTAIN-TO GIRL914.SK)))
		(!R18 (BABY913.SK BOX.N))
		(!R19 (BABY913.SK ARTIFACT.N))
		(!R20 (BABY913.SK CONTAINER.N))
		(!R21 (GIRL914.SK FOX.N))
		(!R22 (GIRL914.SK VERTEBRATE.N))
		(!R23 (GIRL914.SK (PLUR GIRL.N)))
		(!R24 (BABY913.SK BABY.N))
		(!R25 (E911.SK (IMPINGES-ON E239)))
	)
	(:GOALS
		(?G1 (GIRL914.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL914.SK (AT.P ?X_B)))
		(?I2 (NOT (GIRL914.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL914.SK (AT.P ?X_B))))
		(?P2 (GIRL914.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E911.SK))
		(!W2 (?I2 BEFORE E911.SK))
		(!W3 (?P1 AFTER E911.SK))
		(!W4 (?P2 AFTER E911.SK))
		(!W5 (?G1 CAUSE-OF E911.SK))
		(!W6 (E911.SK (BEFORE ?X_E)))
		(!W7 (OBJECT916.SK (AT-ABOUT NOW204)))
	)
	(:CERTAINTIES
		(!C1 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C4 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C6 (!R14 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C7 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C10 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R14 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C13 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R14 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C18 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R18 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C23 (!R19 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C24 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C25 (!R19 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C26 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C27 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C28 (!R20 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C29 (!R22 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C30 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C31 (!R21 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C32 (!R22 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C33 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 12)
("The girls have come to play with the baby." "Two girls have little dolls."
 "One girl has a red dress." "The baby is glad to see the girls."
 "The girl with the red dress is May." "May is glad to see the good baby."
 "She will take the baby to see the bird.")
(EPI-SCHEMA ((GIRL914.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P BABY913.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_B)) COME.1445.V)))
              ?L2)
             ** E911.SK)
	(:ROLES
		(!R1 (?X_B LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?X_B = ?L2)))
		(!R4 (BABY913.SK (PLUR FRIEND.N)))
		(!R5 (BABY913.SK HOME.N))
		(!R6 (GIRL914.SK GIRL.N))
		(!R7 (BABY913.SK HAT.N))
		(!R8 (GIRL914.SK LITTLE.A))
		(!R9 (GIRL914.SK BIRD.N))
		(!R10 (GIRL914.SK BABY.N))
		(!R11 (BABY913.SK DOLL.N))
		(!R12 (BABY913.SK BIG.A))
		(!R13 (?X_B (PLUR FIELD.N)))
		(!R14 (BABY913.SK WAGON.N))
		(!R15 (BABY913.SK ARTIFACT.N))
		(!R16 (BABY913.SK RED.A))
		(!R17 (GIRL914.SK AGENT.N))
		(!R18 (BABY913.SK (PERTAIN-TO GIRL914.SK)))
		(!R19 (GIRL914.SK (PLUR GIRL.N)))
		(!R20 (BABY913.SK BABY.N))
		(!R21 (E911.SK (IMPINGES-ON E239)))
	)
	(:GOALS
		(?G1 (GIRL914.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL914.SK (AT.P ?X_B)))
		(?I2 (NOT (GIRL914.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL914.SK (AT.P ?X_B))))
		(?P2 (GIRL914.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E911.SK))
		(!W2 (?I2 BEFORE E911.SK))
		(!W3 (?P1 AFTER E911.SK))
		(!W4 (?P2 AFTER E911.SK))
		(!W5 (?G1 CAUSE-OF E911.SK))
		(!W6 (E911.SK (BEFORE ?X_E)))
		(!W7 (OBJECT916.SK (AT-ABOUT NOW204)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R14 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C7 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C10 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R14 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C13 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R14 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C18 (!R15 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R15 CERTAIN-TO-DEGREE (/ 2 5)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.075139 21)
("The girls have come to play with the baby." "Two girls have little dolls."
 "One girl has a red dress." "The baby is glad to see the girls."
 "The girl with the red dress is May." "May is glad to see the good baby."
 "She will take the baby to see the bird.")
(EPI-SCHEMA ((GIRL914.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P BABY913.SK)) PLAY.V))))
               ((ADV-A (TO.P ?X_H)) ((ADV-A (FROM.P BIRD948.SK)) COME.1446.V)))
              ?X_H)
             ** E911.SK)
	(:ROLES
		(!R1 (BIRD948.SK LOCATION.N))
		(!R2 (?X_H LOCATION.N))
		(!R3 (NOT (BIRD948.SK = ?X_H)))
		(!R4 (BABY913.SK (PLUR FRIEND.N)))
		(!R5 (BABY913.SK HOME.N))
		(!R6 (GIRL914.SK BIRD.N))
		(!R7 (BABY913.SK DOLL.N))
		(!R8 (DRESS929.SK HAT.N))
		(!R9 (BIRD948.SK (PLUR TOP.N)))
		(!R10 (BABY913.SK (PERTAIN-TO GIRL914.SK)))
		(!R11 (?X_H TOP.N))
		(!R12 (GIRL914.SK GIRL.N))
		(!R13 (BABY913.SK BIRD.N))
		(!R14 (DRESS929.SK BIG.A))
		(!R15 (DRESS929.SK DOLL.N))
		(!R16 (BABY913.SK LITTLE.A))
		(!R17 (BABY913.SK BOY.N))
		(!R18 (BIRD948.SK (PLUR FIELD.N)))
		(!R19 (DRESS929.SK (PERTAIN-TO GIRL914.SK)))
		(!R20 (DRESS929.SK WAGON.N))
		(!R21 (GIRL914.SK AGENT.N))
		(!R22 (BIRD948.SK FOX.N))
		(!R23 (BIRD948.SK (ON.P ?X_A)))
		(!R24 (?X_A BOX.N))
		(!R25 (DRESS929.SK (PLUR BOX.N)))
		(!R26 (BABY913.SK BOX.N))
		(!R27 (BABY913.SK ARTIFACT.N))
		(!R28 (GIRL914.SK (PLUR GIRL.N)))
		(!R29 (BABY913.SK BABY.N))
		(!R30 (E911.SK (IMPINGES-ON E239)))
		(!R31 (DRESS929.SK RED.A))
		(!R32 (DRESS929.SK DRESS.N))
		(!R33 (DRESS929.SK CLOTHING.N))
		(!R34 (DRESS929.SK ARTIFACT.N))
		(!R35 (T937.SK (WITH.P DRESS929.SK)))
		(!R36 (T937.SK GIRL.N))
		(!R37 (BIRD948.SK BIRD.N))
		(!R38 (BIRD948.SK VERTEBRATE.N))
	)
	(:GOALS
		(?G1 (GIRL914.SK (WANT.V (KA ((ADV-A (AT.P ?X_H)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL914.SK (AT.P BIRD948.SK)))
		(?I2 (NOT (GIRL914.SK (AT.P ?X_H))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL914.SK (AT.P BIRD948.SK))))
		(?P2 (GIRL914.SK (AT.P ?X_H)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E911.SK))
		(!W2 (?I2 BEFORE E911.SK))
		(!W3 (?P1 AFTER E911.SK))
		(!W4 (?P2 AFTER E911.SK))
		(!W5 (?G1 CAUSE-OF E911.SK))
		(!W6 (E911.SK (BEFORE ?X_E)))
		(!W7 (OBJECT916.SK (AT-ABOUT NOW204)))
	)
	(:CERTAINTIES
		(!C1 (!R34 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R15 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R34 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R20 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R34 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R27 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R26 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C10 (!R33 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C11 (!R32 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C12 (!R34 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C13 (!R34 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C14 (!R20 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C15 (!R34 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R38 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C17 (!R22 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C18 (!R37 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.075139 13)
("The girls have come to play with the baby." "Two girls have little dolls."
 "One girl has a red dress." "The baby is glad to see the girls."
 "The girl with the red dress is May." "May is glad to see the good baby."
 "She will take the baby to see the bird.")
(EPI-SCHEMA ((GIRL914.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P BABY913.SK)) PLAY.V))))
               ((ADV-A (TO.P ?X_H)) ((ADV-A (FROM.P ?X_F)) COME.1447.V)))
              ?X_H)
             ** E911.SK)
	(:ROLES
		(!R1 (?X_F LOCATION.N))
		(!R2 (?X_H LOCATION.N))
		(!R3 (NOT (?X_F = ?X_H)))
		(!R4 (BABY913.SK (PLUR FRIEND.N)))
		(!R5 (BABY913.SK HOME.N))
		(!R6 (GIRL914.SK BIRD.N))
		(!R7 (BABY913.SK DOLL.N))
		(!R8 (DRESS929.SK HAT.N))
		(!R9 (?X_F (PLUR TOP.N)))
		(!R10 (?X_F (ON.P ?X_A)))
		(!R11 (?X_A BOX.N))
		(!R12 (BABY913.SK (PERTAIN-TO GIRL914.SK)))
		(!R13 (?X_H TOP.N))
		(!R14 (GIRL914.SK GIRL.N))
		(!R15 (BABY913.SK BIRD.N))
		(!R16 (DRESS929.SK BIG.A))
		(!R17 (DRESS929.SK DOLL.N))
		(!R18 (BABY913.SK LITTLE.A))
		(!R19 (BABY913.SK BOY.N))
		(!R20 (?X_F (PLUR FIELD.N)))
		(!R21 (GIRL914.SK AGENT.N))
		(!R22 (DRESS929.SK (PERTAIN-TO GIRL914.SK)))
		(!R23 (DRESS929.SK WAGON.N))
		(!R24 (GIRL914.SK (PLUR GIRL.N)))
		(!R25 (BABY913.SK BABY.N))
		(!R26 (E911.SK (IMPINGES-ON E239)))
		(!R27 (DRESS929.SK RED.A))
		(!R28 (DRESS929.SK DRESS.N))
		(!R29 (DRESS929.SK CLOTHING.N))
		(!R30 (DRESS929.SK ARTIFACT.N))
		(!R31 (T937.SK (WITH.P DRESS929.SK)))
		(!R32 (T937.SK GIRL.N))
	)
	(:GOALS
		(?G1 (GIRL914.SK (WANT.V (KA ((ADV-A (AT.P ?X_H)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL914.SK (AT.P ?X_F)))
		(?I2 (NOT (GIRL914.SK (AT.P ?X_H))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL914.SK (AT.P ?X_F))))
		(?P2 (GIRL914.SK (AT.P ?X_H)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E911.SK))
		(!W2 (?I2 BEFORE E911.SK))
		(!W3 (?P1 AFTER E911.SK))
		(!W4 (?P2 AFTER E911.SK))
		(!W5 (?G1 CAUSE-OF E911.SK))
		(!W6 (E911.SK (BEFORE ?X_E)))
		(!W7 (OBJECT916.SK (AT-ABOUT NOW204)))
	)
	(:CERTAINTIES
		(!C1 (!R30 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R17 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R30 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R23 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R30 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R29 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C8 (!R28 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C9 (!R30 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C10 (!R30 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C11 (!R23 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R30 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 58:
	; "The girls have come to play with the baby."
	; "Two girls have little dolls."
	; "One girl has a red dress."
	; "The baby is glad to see the girls."
	; "The girl with the red dress is May."
	; "May is glad to see the good baby."
	; "She will take the baby to see the bird."
; best schemas are:
; GO.1367.V
; TAKE.1270.V
; TAKE.1290.V
; GO.1084.V
; GO.1338.V
; GO.1024.V
(setf matches (append matches '(( (2.905 16)
("The girls have come to play with the baby." "Two girls have little dolls."
 "One girl has a red dress." "The baby is glad to see the girls."
 "The girl with the red dress is May." "May is glad to see the good baby."
 "She will take the baby to see the bird.")
(EPI-SCHEMA ((GIRL952.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P BABY951.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_B)) COME.1406.V)))
              ?L2)
             ** E949.SK)
	(:ROLES
		(!R1 (?X_B LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?X_B = ?L2)))
		(!R4 (BABY951.SK (PLUR FRIEND.N)))
		(!R5 (BABY951.SK HOME.N))
		(!R6 (GIRL952.SK GIRL.N))
		(!R7 (BABY951.SK HAT.N))
		(!R8 (GIRL952.SK LITTLE.A))
		(!R9 (GIRL952.SK BIRD.N))
		(!R10 (GIRL952.SK BABY.N))
		(!R11 (BABY951.SK DOLL.N))
		(!R12 (BABY951.SK BIG.A))
		(!R13 (?X_B (PLUR FIELD.N)))
		(!R14 (BABY951.SK WAGON.N))
		(!R15 (BABY951.SK RED.A))
		(!R16 (GIRL952.SK AGENT.N))
		(!R17 (BABY951.SK (PERTAIN-TO GIRL952.SK)))
		(!R18 (BABY951.SK BOX.N))
		(!R19 (BABY951.SK ARTIFACT.N))
		(!R20 (BABY951.SK CONTAINER.N))
		(!R21 (GIRL952.SK FOX.N))
		(!R22 (GIRL952.SK VERTEBRATE.N))
		(!R23 (GIRL952.SK (PLUR GIRL.N)))
		(!R24 (BABY951.SK BABY.N))
		(!R25 (E949.SK (IMPINGES-ON E246)))
	)
	(:GOALS
		(?G1 (GIRL952.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL952.SK (AT.P ?X_B)))
		(?I2 (NOT (GIRL952.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL952.SK (AT.P ?X_B))))
		(?P2 (GIRL952.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E949.SK))
		(!W2 (?I2 BEFORE E949.SK))
		(!W3 (?P1 AFTER E949.SK))
		(!W4 (?P2 AFTER E949.SK))
		(!W5 (?G1 CAUSE-OF E949.SK))
		(!W6 (E949.SK (BEFORE ?X_E)))
		(!W7 (OBJECT954.SK (AT-ABOUT NOW211)))
	)
	(:CERTAINTIES
		(!C1 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C4 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C6 (!R14 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C7 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C10 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R14 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C13 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R14 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C18 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R18 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C23 (!R19 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C24 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C25 (!R19 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C26 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C27 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C28 (!R20 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C29 (!R22 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C30 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C31 (!R21 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C32 (!R22 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C33 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 12)
("The girls have come to play with the baby." "Two girls have little dolls."
 "One girl has a red dress." "The baby is glad to see the girls."
 "The girl with the red dress is May." "May is glad to see the good baby."
 "She will take the baby to see the bird.")
(EPI-SCHEMA ((GIRL952.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P BABY951.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_B)) COME.1445.V)))
              ?L2)
             ** E949.SK)
	(:ROLES
		(!R1 (?X_B LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?X_B = ?L2)))
		(!R4 (BABY951.SK (PLUR FRIEND.N)))
		(!R5 (BABY951.SK HOME.N))
		(!R6 (GIRL952.SK GIRL.N))
		(!R7 (BABY951.SK HAT.N))
		(!R8 (GIRL952.SK LITTLE.A))
		(!R9 (GIRL952.SK BIRD.N))
		(!R10 (GIRL952.SK BABY.N))
		(!R11 (BABY951.SK DOLL.N))
		(!R12 (BABY951.SK BIG.A))
		(!R13 (?X_B (PLUR FIELD.N)))
		(!R14 (BABY951.SK WAGON.N))
		(!R15 (BABY951.SK ARTIFACT.N))
		(!R16 (BABY951.SK RED.A))
		(!R17 (GIRL952.SK AGENT.N))
		(!R18 (BABY951.SK (PERTAIN-TO GIRL952.SK)))
		(!R19 (GIRL952.SK (PLUR GIRL.N)))
		(!R20 (BABY951.SK BABY.N))
		(!R21 (E949.SK (IMPINGES-ON E246)))
	)
	(:GOALS
		(?G1 (GIRL952.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL952.SK (AT.P ?X_B)))
		(?I2 (NOT (GIRL952.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL952.SK (AT.P ?X_B))))
		(?P2 (GIRL952.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E949.SK))
		(!W2 (?I2 BEFORE E949.SK))
		(!W3 (?P1 AFTER E949.SK))
		(!W4 (?P2 AFTER E949.SK))
		(!W5 (?G1 CAUSE-OF E949.SK))
		(!W6 (E949.SK (BEFORE ?X_E)))
		(!W7 (OBJECT954.SK (AT-ABOUT NOW211)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R14 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C7 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C10 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R14 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C13 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R14 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C18 (!R15 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R15 CERTAIN-TO-DEGREE (/ 2 5)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.075139 21)
("The girls have come to play with the baby." "Two girls have little dolls."
 "One girl has a red dress." "The baby is glad to see the girls."
 "The girl with the red dress is May." "May is glad to see the good baby."
 "She will take the baby to see the bird.")
(EPI-SCHEMA ((GIRL952.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P BABY951.SK)) PLAY.V))))
               ((ADV-A (TO.P ?X_H)) ((ADV-A (FROM.P BIRD979.SK)) COME.1446.V)))
              ?X_H)
             ** E949.SK)
	(:ROLES
		(!R1 (BIRD979.SK LOCATION.N))
		(!R2 (?X_H LOCATION.N))
		(!R3 (NOT (BIRD979.SK = ?X_H)))
		(!R4 (BABY951.SK (PLUR FRIEND.N)))
		(!R5 (BABY951.SK HOME.N))
		(!R6 (GIRL952.SK BIRD.N))
		(!R7 (BABY951.SK DOLL.N))
		(!R8 (DRESS962.SK HAT.N))
		(!R9 (BIRD979.SK (PLUR TOP.N)))
		(!R10 (BABY951.SK (PERTAIN-TO GIRL952.SK)))
		(!R11 (?X_H TOP.N))
		(!R12 (GIRL952.SK GIRL.N))
		(!R13 (BABY951.SK BIRD.N))
		(!R14 (DRESS962.SK BIG.A))
		(!R15 (DRESS962.SK DOLL.N))
		(!R16 (BABY951.SK LITTLE.A))
		(!R17 (BABY951.SK BOY.N))
		(!R18 (BIRD979.SK (PLUR FIELD.N)))
		(!R19 (DRESS962.SK (PERTAIN-TO GIRL952.SK)))
		(!R20 (DRESS962.SK WAGON.N))
		(!R21 (GIRL952.SK AGENT.N))
		(!R22 (BIRD979.SK FOX.N))
		(!R23 (BIRD979.SK (ON.P ?X_A)))
		(!R24 (?X_A BOX.N))
		(!R25 (DRESS962.SK (PLUR BOX.N)))
		(!R26 (BABY951.SK BOX.N))
		(!R27 (BABY951.SK ARTIFACT.N))
		(!R28 (GIRL952.SK (PLUR GIRL.N)))
		(!R29 (BABY951.SK BABY.N))
		(!R30 (E949.SK (IMPINGES-ON E246)))
		(!R31 (DRESS962.SK RED.A))
		(!R32 (DRESS962.SK DRESS.N))
		(!R33 (DRESS962.SK CLOTHING.N))
		(!R34 (DRESS962.SK ARTIFACT.N))
		(!R35 (T970.SK (WITH.P DRESS962.SK)))
		(!R36 (T970.SK GIRL.N))
		(!R37 (BIRD979.SK BIRD.N))
		(!R38 (BIRD979.SK VERTEBRATE.N))
	)
	(:GOALS
		(?G1 (GIRL952.SK (WANT.V (KA ((ADV-A (AT.P ?X_H)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL952.SK (AT.P BIRD979.SK)))
		(?I2 (NOT (GIRL952.SK (AT.P ?X_H))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL952.SK (AT.P BIRD979.SK))))
		(?P2 (GIRL952.SK (AT.P ?X_H)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E949.SK))
		(!W2 (?I2 BEFORE E949.SK))
		(!W3 (?P1 AFTER E949.SK))
		(!W4 (?P2 AFTER E949.SK))
		(!W5 (?G1 CAUSE-OF E949.SK))
		(!W6 (E949.SK (BEFORE ?X_E)))
		(!W7 (OBJECT954.SK (AT-ABOUT NOW211)))
	)
	(:CERTAINTIES
		(!C1 (!R34 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R15 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R34 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R20 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R34 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R27 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R26 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C10 (!R33 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C11 (!R32 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C12 (!R34 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C13 (!R34 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C14 (!R20 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C15 (!R34 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R38 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C17 (!R22 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C18 (!R37 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.075139 13)
("The girls have come to play with the baby." "Two girls have little dolls."
 "One girl has a red dress." "The baby is glad to see the girls."
 "The girl with the red dress is May." "May is glad to see the good baby."
 "She will take the baby to see the bird.")
(EPI-SCHEMA ((GIRL952.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P BABY951.SK)) PLAY.V))))
               ((ADV-A (TO.P ?X_H)) ((ADV-A (FROM.P ?X_F)) COME.1447.V)))
              ?X_H)
             ** E949.SK)
	(:ROLES
		(!R1 (?X_F LOCATION.N))
		(!R2 (?X_H LOCATION.N))
		(!R3 (NOT (?X_F = ?X_H)))
		(!R4 (BABY951.SK (PLUR FRIEND.N)))
		(!R5 (BABY951.SK HOME.N))
		(!R6 (GIRL952.SK BIRD.N))
		(!R7 (BABY951.SK DOLL.N))
		(!R8 (DRESS962.SK HAT.N))
		(!R9 (?X_F (PLUR TOP.N)))
		(!R10 (?X_F (ON.P ?X_A)))
		(!R11 (?X_A BOX.N))
		(!R12 (BABY951.SK (PERTAIN-TO GIRL952.SK)))
		(!R13 (?X_H TOP.N))
		(!R14 (GIRL952.SK GIRL.N))
		(!R15 (BABY951.SK BIRD.N))
		(!R16 (DRESS962.SK BIG.A))
		(!R17 (DRESS962.SK DOLL.N))
		(!R18 (BABY951.SK LITTLE.A))
		(!R19 (BABY951.SK BOY.N))
		(!R20 (?X_F (PLUR FIELD.N)))
		(!R21 (GIRL952.SK AGENT.N))
		(!R22 (DRESS962.SK (PERTAIN-TO GIRL952.SK)))
		(!R23 (DRESS962.SK WAGON.N))
		(!R24 (GIRL952.SK (PLUR GIRL.N)))
		(!R25 (BABY951.SK BABY.N))
		(!R26 (E949.SK (IMPINGES-ON E246)))
		(!R27 (DRESS962.SK RED.A))
		(!R28 (DRESS962.SK DRESS.N))
		(!R29 (DRESS962.SK CLOTHING.N))
		(!R30 (DRESS962.SK ARTIFACT.N))
		(!R31 (T970.SK (WITH.P DRESS962.SK)))
		(!R32 (T970.SK GIRL.N))
	)
	(:GOALS
		(?G1 (GIRL952.SK (WANT.V (KA ((ADV-A (AT.P ?X_H)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL952.SK (AT.P ?X_F)))
		(?I2 (NOT (GIRL952.SK (AT.P ?X_H))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL952.SK (AT.P ?X_F))))
		(?P2 (GIRL952.SK (AT.P ?X_H)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E949.SK))
		(!W2 (?I2 BEFORE E949.SK))
		(!W3 (?P1 AFTER E949.SK))
		(!W4 (?P2 AFTER E949.SK))
		(!W5 (?G1 CAUSE-OF E949.SK))
		(!W6 (E949.SK (BEFORE ?X_E)))
		(!W7 (OBJECT954.SK (AT-ABOUT NOW211)))
	)
	(:CERTAINTIES
		(!C1 (!R30 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R17 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R30 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R23 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R30 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R29 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C8 (!R28 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C9 (!R30 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C10 (!R30 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C11 (!R23 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R30 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 59:
	; "I have a pet hen."
	; "She has a nest in a box."
	; "Two eggs are in the nest."
	; "One day when she went away to get her dinner, a big rat came to get an egg; but he did not get the egg."
	; "My hen saw him and did not let him get the egg."
	; "A rat will eat an egg if he can get it."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; GO.1367.V
; TAKE.895.V
; GO.1338.V
; GO.866.V

; story 60:
	; "The cat has the rat."
	; "I had the cat."
	; "I can see."
	; "I can see a cat."
	; "And I see a black rat."
	; "The cat can see and the rat can see."
	; "A rat can see my cat."
	; "The black rat ran."
	; "My black cat ran."
	; "My cat has the rat."
	; "I can see a cat and a rat."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; TAKE.895.V
; GO.1367.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
; PLAY.524.V
(setf matches (append matches '(( (2.68625 16)
("The cat has the rat." "I had the cat." "I can see." "I can see a cat."
 "And I see a black rat." "The cat can see and the rat can see."
 "A rat can see my cat." "The black rat ran." "My black cat ran."
 "My cat has the rat." "I can see a cat and a rat.")
(EPI-SCHEMA ((RAT1029.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P CAT1011.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_B)) RUN.1649.V)))
              ?L2)
             ** E1044.SK)
	(:ROLES
		(!R1 (?X_B LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?X_B = ?L2)))
		(!R4 (CAT1011.SK (PLUR FRIEND.N)))
		(!R5 (CAT1011.SK HOME.N))
		(!R6 (RAT1029.SK GIRL.N))
		(!R7 (CAT1011.SK HAT.N))
		(!R8 (RAT1029.SK LITTLE.A))
		(!R9 (RAT1029.SK BIRD.N))
		(!R10 (RAT1029.SK BABY.N))
		(!R11 (CAT1011.SK DOLL.N))
		(!R12 (CAT1011.SK BIG.A))
		(!R13 (?X_B (PLUR FIELD.N)))
		(!R14 (CAT1011.SK WAGON.N))
		(!R15 (CAT1011.SK RED.A))
		(!R16 (RAT1029.SK AGENT.N))
		(!R17 (CAT1011.SK (PERTAIN-TO RAT1029.SK)))
		(!R18 (CAT1011.SK BOX.N))
		(!R19 (CAT1011.SK ARTIFACT.N))
		(!R20 (CAT1011.SK CONTAINER.N))
		(!R21 (RAT1029.SK FOX.N))
		(!R22 (RAT1029.SK BLACK.A))
		(!R23 (RAT1029.SK RAT.N))
		(!R24 (RAT1029.SK VERTEBRATE.N))
		(!R25 (RAT1029.SK PLACENTAL.N))
		(!R26 (CAT1011.SK BLACK.A))
		(!R27 (CAT1011.SK CAT.N))
		(!R28 (CAT1011.SK (PERTAIN-TO ME1056.SK)))
		(!R29 (ME1056.SK AGENT.N))
	)
	(:GOALS
		(?G1 (RAT1029.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (RAT1029.SK (AT.P ?X_B)))
		(?I2 (NOT (RAT1029.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (RAT1029.SK (AT.P ?X_B))))
		(?P2 (RAT1029.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1044.SK))
		(!W2 (?I2 BEFORE E1044.SK))
		(!W3 (?P1 AFTER E1044.SK))
		(!W4 (?P2 AFTER E1044.SK))
		(!W5 (?G1 CAUSE-OF E1044.SK))
		(!W6 (E1044.SK (BEFORE ?X_E)))
		(!W7 (E1044.SK (BEFORE NOW230)))
	)
	(:CERTAINTIES
		(!C1 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C4 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C6 (!R14 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C7 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C10 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R14 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C13 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R14 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C18 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R18 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C23 (!R19 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C24 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C25 (!R19 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C26 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C27 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C28 (!R20 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C29 (!R24 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C30 (!R9 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C31 (!R21 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C32 (!R24 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C33 (!R9 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C34 (!R24 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C35 (!R23 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C36 (!R24 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C37 (!R25 CERTAIN-TO-DEGREE (/ 2 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.2590625 2)
("The cat has the rat." "I had the cat." "I can see." "I can see a cat."
 "And I see a black rat." "The cat can see and the rat can see."
 "A rat can see my cat." "The black rat ran." "My black cat ran."
 "My cat has the rat." "I can see a cat and a rat.")
(EPI-SCHEMA ((ME1056.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1650.V
              (KA ((THERE.ADV SEE.V) RAT1029.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) RAT1029.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ME1056.SK CAT.N))
		(!R4 (RAT1029.SK BIG.A))
		(!R5 (ME1056.SK AGENT.N))
		(!R6 (RAT1029.SK BLACK.A))
		(!R7 (RAT1029.SK RAT.N))
		(!R8 (CAT1011.SK BLACK.A))
		(!R9 (CAT1011.SK CAT.N))
		(!R10 (CAT1011.SK (PERTAIN-TO ME1056.SK)))
	)
	(:GOALS
		(?G1 (ME1056.SK (WANT.V (THAT (NOT (ME1056.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME1056.SK (THERE.ADV SEE.V) RAT1029.SK)) CAUSE-OF
    (KE (ME1056.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1032.SK (ME1056.SK (THERE.ADV (THERE.ADV SEE.V)) RAT1029.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1032.SK))
		(!W2 (E1032.SK (BEFORE ?X_D)))
		(!W3 (E1032.SK (CONSEC ?X_C)))
		(!W4 (?X_C (BEFORE ?X_F)))
		(!W5 (E1032.SK (BEFORE ?X_F)))
		(!W6 (E1032.SK (AT-ABOUT NOW227)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 61:
	; "Frank and little May are in the field with the wagon."
	; "They have come to find flowers."
	; "May has a red flower."
	; "Frank has three yellow flowers."
	; "He will let May have them."
	; "She will take them to the wagon She is glad to get the pretty flowers."
; best schemas are:
; GO.1367.V
; COME.917.V
; COME.917.V
; COME.917.V
; GO.1084.V
; GO.1338.V
(setf matches (append matches '(( (5.25562 15)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P WAGON1059.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2))
                ((ADV-A (FROM.P FIELD1058.SK)) COME.1665.V)))
              ?L2)
             ** E1060.SK)
	(:ROLES
		(!R1 (FIELD1058.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (FIELD1058.SK = ?L2)))
		(!R4 (WAGON1059.SK (PLUR FRIEND.N)))
		(!R5 (WAGON1059.SK HOME.N))
		(!R6 (MAY.NAME GIRL.N))
		(!R7 (WAGON1059.SK HAT.N))
		(!R8 (MAY.NAME LITTLE.A))
		(!R9 (MAY.NAME BIRD.N))
		(!R10 (MAY.NAME BABY.N))
		(!R11 (WAGON1059.SK DOLL.N))
		(!R12 (WAGON1059.SK BIG.A))
		(!R13 (FIELD1058.SK (PLUR FIELD.N)))
		(!R14 (WAGON1059.SK RED.A))
		(!R15 (MAY.NAME AGENT.N))
		(!R16 (WAGON1059.SK (PERTAIN-TO MAY.NAME)))
		(!R17 (WAGON1059.SK BOX.N))
		(!R18 (MAY.NAME FOX.N))
		(!R19 (MAY.NAME VERTEBRATE.N))
		(!R20 (E1060.SK (IMPINGES-ON E276)))
		(!R21 (FIELD1058.SK FIELD.N))
		(!R22 (WAGON1059.SK WAGON.N))
		(!R23 (WAGON1059.SK ARTIFACT.N))
		(!R24 (WAGON1059.SK CONTAINER.N))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1058.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAY.NAME (AT.P FIELD1058.SK))))
		(?P2 (MAY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1060.SK))
		(!W2 (?I2 BEFORE E1060.SK))
		(!W3 (?P1 AFTER E1060.SK))
		(!W4 (?P2 AFTER E1060.SK))
		(!W5 (?G1 CAUSE-OF E1060.SK))
		(!W6 (E1060.SK (BEFORE ?X_E)))
		(!W7 (OBJECT1061.SK (AT-ABOUT NOW236)))
	)
	(:CERTAINTIES
		(!C1 (!R23 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C4 (!R23 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C6 (!R22 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C7 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R23 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C10 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R22 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C13 (!R23 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R23 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R23 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R22 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C18 (!R23 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R23 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R23 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R23 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R17 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C23 (!R23 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C24 (!R23 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C25 (!R23 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C26 (!R24 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C27 (!R24 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C28 (!R24 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C29 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C30 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C31 (!R18 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C32 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C33 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C34 (!R23 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C35 (!R22 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C36 (!R23 CERTAIN-TO-DEGREE (/ 2 7)))
		(!C37 (!R23 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C38 (!R23 CERTAIN-TO-DEGREE (/ 2 7)))
		(!C39 (!R24 CERTAIN-TO-DEGREE (/ 2 7)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.7302294 1)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N))))))
               ((ADV-A (TO.P ?L2))
                ((ADV-A (FROM.P FIELD1058.SK)) COME.1666.V)))
              ?L2)
             ** E1060.SK)
	(:ROLES
		(!R1 (MAY.NAME AGENT.N))
		(!R2 (FIELD1058.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (FIELD1058.SK = ?L2)))
		(!R5 (FIELD1058.SK FIELD.N))
		(!R6 (E1060.SK (IMPINGES-ON E276)))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1058.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAY.NAME (AT.P FIELD1058.SK))))
		(?P2 (MAY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1060.SK))
		(!W2 (?I2 BEFORE E1060.SK))
		(!W3 (?P1 AFTER E1060.SK))
		(!W4 (?P2 AFTER E1060.SK))
		(!W5 (?G1 CAUSE-OF E1060.SK))
		(!W6 (?X_E (AT-ABOUT ?X_F)))
		(!W7 (OBJECT1061.SK (AT-ABOUT NOW236)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.7302294 1)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N))))))
               ((ADV-A (TO.P ?L2))
                ((ADV-A (FROM.P FIELD1058.SK)) COME.1666.V)))
              ?L2)
             ** E1060.SK)
	(:ROLES
		(!R1 (MAY.NAME AGENT.N))
		(!R2 (FIELD1058.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (FIELD1058.SK = ?L2)))
		(!R5 (FIELD1058.SK FIELD.N))
		(!R6 (E1060.SK (IMPINGES-ON E276)))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1058.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAY.NAME (AT.P FIELD1058.SK))))
		(?P2 (MAY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1060.SK))
		(!W2 (?I2 BEFORE E1060.SK))
		(!W3 (?P1 AFTER E1060.SK))
		(!W4 (?P2 AFTER E1060.SK))
		(!W5 (?G1 CAUSE-OF E1060.SK))
		(!W6 (?X_E (AT-ABOUT ?X_F)))
		(!W7 (OBJECT1061.SK (AT-ABOUT NOW236)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.7302294 1)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N))))))
               ((ADV-A (TO.P ?L2))
                ((ADV-A (FROM.P FIELD1058.SK)) COME.1666.V)))
              ?L2)
             ** E1060.SK)
	(:ROLES
		(!R1 (MAY.NAME AGENT.N))
		(!R2 (FIELD1058.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (FIELD1058.SK = ?L2)))
		(!R5 (FIELD1058.SK FIELD.N))
		(!R6 (E1060.SK (IMPINGES-ON E276)))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1058.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAY.NAME (AT.P FIELD1058.SK))))
		(?P2 (MAY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1060.SK))
		(!W2 (?I2 BEFORE E1060.SK))
		(!W3 (?P1 AFTER E1060.SK))
		(!W4 (?P2 AFTER E1060.SK))
		(!W5 (?G1 CAUSE-OF E1060.SK))
		(!W6 (?X_E (AT-ABOUT ?X_F)))
		(!W7 (OBJECT1061.SK (AT-ABOUT NOW236)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.925542 12)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P WAGON1059.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2))
                ((ADV-A (FROM.P FIELD1058.SK)) COME.1667.V)))
              ?L2)
             ** E1060.SK)
	(:ROLES
		(!R1 (FIELD1058.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (FIELD1058.SK = ?L2)))
		(!R4 (WAGON1059.SK (PLUR FRIEND.N)))
		(!R5 (WAGON1059.SK HOME.N))
		(!R6 (MAY.NAME GIRL.N))
		(!R7 (WAGON1059.SK HAT.N))
		(!R8 (MAY.NAME LITTLE.A))
		(!R9 (MAY.NAME BIRD.N))
		(!R10 (MAY.NAME BABY.N))
		(!R11 (WAGON1059.SK DOLL.N))
		(!R12 (WAGON1059.SK BIG.A))
		(!R13 (FIELD1058.SK (PLUR FIELD.N)))
		(!R14 (WAGON1059.SK RED.A))
		(!R15 (MAY.NAME AGENT.N))
		(!R16 (WAGON1059.SK (PERTAIN-TO MAY.NAME)))
		(!R17 (E1060.SK (IMPINGES-ON E276)))
		(!R18 (FIELD1058.SK FIELD.N))
		(!R19 (WAGON1059.SK WAGON.N))
		(!R20 (WAGON1059.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1058.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAY.NAME (AT.P FIELD1058.SK))))
		(?P2 (MAY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1060.SK))
		(!W2 (?I2 BEFORE E1060.SK))
		(!W3 (?P1 AFTER E1060.SK))
		(!W4 (?P2 AFTER E1060.SK))
		(!W5 (?G1 CAUSE-OF E1060.SK))
		(!W6 (E1060.SK (BEFORE ?X_E)))
		(!W7 (OBJECT1061.SK (AT-ABOUT NOW236)))
	)
	(:CERTAINTIES
		(!C1 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C4 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C6 (!R19 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C7 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C10 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R19 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C13 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R19 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C18 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R19 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C23 (!R20 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C24 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C25 (!R20 CERTAIN-TO-DEGREE (/ 2 6)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.925542 23)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FLOWER1064.SK)) PLAY.V))))
               ((ADV-A (TO.P ?X_H))
                ((ADV-A (FROM.P FIELD1058.SK)) COME.1668.V)))
              ?X_H)
             ** E1060.SK)
	(:ROLES
		(!R1 (FIELD1058.SK LOCATION.N))
		(!R2 (?X_H LOCATION.N))
		(!R3 (NOT (FIELD1058.SK = ?X_H)))
		(!R4 (FLOWER1064.SK (PLUR FRIEND.N)))
		(!R5 (FLOWER1064.SK HOME.N))
		(!R6 (MAY.NAME BIRD.N))
		(!R7 (FLOWER1064.SK DOLL.N))
		(!R8 (WAGON1059.SK HAT.N))
		(!R9 (FIELD1058.SK (PLUR TOP.N)))
		(!R10 (FLOWER1064.SK (PERTAIN-TO MAY.NAME)))
		(!R11 (?X_H TOP.N))
		(!R12 (MAY.NAME GIRL.N))
		(!R13 (FLOWER1064.SK BABY.N))
		(!R14 (FLOWER1064.SK BIRD.N))
		(!R15 (WAGON1059.SK BIG.A))
		(!R16 (WAGON1059.SK DOLL.N))
		(!R17 (FLOWER1064.SK LITTLE.A))
		(!R18 (FLOWER1064.SK BOY.N))
		(!R19 (FIELD1058.SK (PLUR FIELD.N)))
		(!R20 (WAGON1059.SK RED.A))
		(!R21 (WAGON1059.SK (PERTAIN-TO MAY.NAME)))
		(!R22 (MAY.NAME AGENT.N))
		(!R23 (FIELD1058.SK FOX.N))
		(!R24 (FIELD1058.SK (ON.P WAGON1070.SK)))
		(!R25 (WAGON1070.SK BOX.N))
		(!R26 (WAGON1059.SK (PLUR BOX.N)))
		(!R27 (FLOWER1064.SK BOX.N))
		(!R28 (FLOWER1064.SK ARTIFACT.N))
		(!R29 (E1060.SK (IMPINGES-ON E276)))
		(!R30 (FIELD1058.SK FIELD.N))
		(!R31 (WAGON1059.SK WAGON.N))
		(!R32 (WAGON1059.SK ARTIFACT.N))
		(!R33 (FLOWER1064.SK RED.A))
		(!R34 (FLOWER1064.SK FLOWER.N))
		(!R35 (FLOWER1064.SK ORGANISM.N))
		(!R36 (WAGON1070.SK WAGON.N))
		(!R37 (WAGON1070.SK CONTAINER.N))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?X_H)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1058.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?X_H))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAY.NAME (AT.P FIELD1058.SK))))
		(?P2 (MAY.NAME (AT.P ?X_H)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1060.SK))
		(!W2 (?I2 BEFORE E1060.SK))
		(!W3 (?P1 AFTER E1060.SK))
		(!W4 (?P2 AFTER E1060.SK))
		(!W5 (?G1 CAUSE-OF E1060.SK))
		(!W6 (E1060.SK (BEFORE ?X_E)))
		(!W7 (OBJECT1061.SK (AT-ABOUT NOW236)))
	)
	(:CERTAINTIES
		(!C1 (!R32 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R16 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R32 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R31 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R32 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R28 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R27 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C10 (!R32 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C11 (!R31 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C12 (!R32 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C13 (!R35 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C14 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C15 (!R34 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C16 (!R37 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C17 (!R25 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C18 (!R36 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C19 (!R37 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C20 (!R25 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 62:
	; "James is kind to Fanny."
	; "She is his little sister."
	; "He has a nice wagon."
	; "He plays horse, and gives her a ride."
discarding schema GIVE.919.V learned from this story
discarding schema PLAY.920.V learned from this story
discarding schema PLAY.922.V learned from this story
; best schemas are:
; PLAY_GIVE_NIL.925.PR
; PLAY.1257.V
; GO.1367.V
(setf matches (append matches '(( (3.6411133 1)
("James is kind to Fanny." "She is his little sister." "He has a nice wagon."
 "He plays horse, and gives her a ride.")
(EPI-SCHEMA ((JAMES.NAME PLAY_GIVE_NIL.1669.PR JAMES.NAME WAGON1082.SK) ** ?E)
	(:ROLES
		(!R1 (WAGON1082.SK INANIMATE_OBJECT.N))
		(!R2 (JAMES.NAME AGENT.N))
		(!R3 (WAGON1082.SK WAGON.N))
		(!R4 (WAGON1082.SK NICE.A))
		(!R5 (RIDE1086.SK RIDE.N))
		(!R6 (OBJECT1077.SK (PERTAIN-TO JAMES.NAME)))
	)
	(:PRECONDS
		(?I1 (NOT (WAGON1082.SK EXIST.V)))
	)
	(:STEPS
		(E1088.SK (JAMES.NAME PLAY.922.V WAGON1082.SK))
		(E1087.SK
   (JAMES.NAME ((ADV-A (TO.P JAMES.NAME)) GIVE.919.V) JAMES.NAME WAGON1082.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (JAMES.NAME HAVE.V WAGON1082.SK)))
		(E1083.SK (JAMES.NAME HAVE.V WAGON1082.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1088.SK BEFORE E1087.SK))
		(!W2 (E1083.SK (AT-ABOUT NOW242)))
		(!W3 (E1088.SK (CONSEC E1087.SK)))
		(!W4 (E1087.SK (AT-ABOUT NOW243)))
		(!W5 (E1088.SK (AT-ABOUT NOW243)))
	)
)
))))
(setf matches (append matches '(( (2.5 4)
("James is kind to Fanny." "She is his little sister." "He has a nice wagon."
 "He plays horse, and gives her a ride.")
(EPI-SCHEMA ((JAMES.NAME PLAY_GIVE_NIL.1670.PR JAMES.NAME (K HORSE.N)) ** ?E)
	(:ROLES
		(!R1 ((K HORSE.N) INANIMATE_OBJECT.N))
		(!R2 ((K HORSE.N) WAGON.N))
		(!R3 ((K HORSE.N) NICE.A))
		(!R4 (JAMES.NAME AGENT.N))
		(!R5 (WAGON1082.SK WAGON.N))
		(!R6 (WAGON1082.SK NICE.A))
		(!R7 (RIDE1086.SK RIDE.N))
		(!R8 (OBJECT1077.SK (PERTAIN-TO JAMES.NAME)))
	)
	(:PRECONDS
		(?I1 (NOT ((K HORSE.N) EXIST.V)))
	)
	(:STEPS
		(E1088.SK (JAMES.NAME PLAY.922.V (K HORSE.N)))
		(E1087.SK
   (JAMES.NAME ((ADV-A (TO.P JAMES.NAME)) GIVE.919.V) JAMES.NAME (K HORSE.N)))
	)
	(:POSTCONDS
		(?P1 (NOT (JAMES.NAME HAVE.V (K HORSE.N))))
		(E1083.SK (JAMES.NAME HAVE.V (K HORSE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1088.SK BEFORE E1087.SK))
		(!W2 (E1083.SK (AT-ABOUT NOW242)))
		(!W3 (E1088.SK (CONSEC E1087.SK)))
		(!W4 (E1088.SK (AT-ABOUT NOW243)))
		(!W5 (E1087.SK (AT-ABOUT NOW243)))
	)
)
))))
(setf matches (append matches '(( (2.5 4)
("James is kind to Fanny." "She is his little sister." "He has a nice wagon."
 "He plays horse, and gives her a ride.")
(EPI-SCHEMA ((JAMES.NAME PLAY_GIVE_NIL.1672.PR JAMES.NAME RIDE1086.SK) ** ?E)
	(:ROLES
		(!R1 (RIDE1086.SK INANIMATE_OBJECT.N))
		(!R2 (RIDE1086.SK WAGON.N))
		(!R3 (RIDE1086.SK NICE.A))
		(!R4 (JAMES.NAME AGENT.N))
		(!R5 (RIDE1086.SK RIDE.N))
		(!R6 (WAGON1082.SK WAGON.N))
		(!R7 (WAGON1082.SK NICE.A))
		(!R8 (OBJECT1077.SK (PERTAIN-TO JAMES.NAME)))
	)
	(:PRECONDS
		(?I1 (NOT (RIDE1086.SK EXIST.V)))
	)
	(:STEPS
		(E1088.SK (JAMES.NAME PLAY.922.V RIDE1086.SK))
		(E1087.SK
   (JAMES.NAME ((ADV-A (TO.P JAMES.NAME)) GIVE.919.V) JAMES.NAME RIDE1086.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (JAMES.NAME HAVE.V RIDE1086.SK)))
		(E1083.SK (JAMES.NAME HAVE.V RIDE1086.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1088.SK BEFORE E1087.SK))
		(!W2 (E1083.SK (AT-ABOUT NOW242)))
		(!W3 (E1088.SK (AT-ABOUT NOW243)))
		(!W4 (E1088.SK (CONSEC E1087.SK)))
		(!W5 (E1087.SK (AT-ABOUT NOW243)))
	)
)
))))
(setf matches (append matches '(( (4.6411133 7)
("James is kind to Fanny." "She is his little sister." "He has a nice wagon."
 "He plays horse, and gives her a ride.")
(EPI-SCHEMA ((JAMES.NAME ((ADV-A (WITH.P WAGON1082.SK)) PLAY.1692.V)
              (K HORSE.N))
             ** E1088.SK)
	(:ROLES
		(!R1 (JAMES.NAME AGENT.N))
		(!R2 (WAGON1082.SK TOY.N))
		(!R3 (WAGON1082.SK INANIMATE_OBJECT.N))
		(!R4 ((K HORSE.N) GAME.N))
		(!R5 (?X_I (RIGHT-AFTER ?X_A)))
		(!R6 (JAMES.NAME SWAN.N))
		(!R7 (WAGON1082.SK (PERTAIN-TO JAMES.NAME)))
		(!R8 (WAGON1082.SK NEST.N))
		(!R9 (WAGON1082.SK WAGON.N))
		(!R10 (WAGON1082.SK NICE.A))
		(!R11 (OBJECT1077.SK (PERTAIN-TO JAMES.NAME)))
	)
	(:GOALS
		(?G1 (JAMES.NAME (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(E1083.SK (JAMES.NAME HAVE.V WAGON1082.SK))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (JAMES.NAME EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E1083.SK (AT-ABOUT ?X_E)))
		(!W3 (E1088.SK (CONSEC ?X_F)))
		(!W4 (?X_F (AT-ABOUT ?X_H)))
		(!W5 (E1088.SK (AT-ABOUT ?X_H)))
		(!W6 (E1083.SK (AT-ABOUT ?X_J)))
		(!W7 (?X_I (SAME-TIME ?X_J)))
		(!W8 (E1083.SK (AT-ABOUT NOW242)))
		(!W9 (E1088.SK (CONSEC E1087.SK)))
		(!W10 (E1087.SK (AT-ABOUT NOW243)))
		(!W11 (E1088.SK (AT-ABOUT NOW243)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 63:
	; "Frank has a pretty boat."
	; "It is white, with a black line near the water."
	; "He keeps it in the pond, near his home."
	; "He always takes good care of it."
	; "Frank has been at work in the garden, and will now row a while."
discarding schema TAKE.928.V learned from this story
; best schemas are:
; TAKE.946.V
; GET.460.V
; GET.660.V
; TAKE.624.V
; TAKE.8.V

; story 64:
	; "My mother gave me a new book."
	; "I took it to school one morning, to let the girls see the pictures."
	; "Soon after this I found my pet kitten and took her home with me."
	; "I like to play with my pet kitten."
	; "I will do as mother says."
	; "I will take good care of the kitten."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; GO.1367.V
; GO.1338.V
; TAKE.895.V
; GO.866.V
(setf matches (append matches '(( (5.5884376 17)
("My mother gave me a new book."
 "I took it to school one morning, to let the girls see the pictures."
 "Soon after this I found my pet kitten and took her home with me."
 "I like to play with my pet kitten." "I will do as mother says."
 "I will take good care of the kitten.")
(EPI-SCHEMA ((ME1150.SK (HOME.ADV TAKE.1717.V) OBJECT1145.SK (AT.P-ARG ?L)) **
             E1149.SK)
	(:ROLES
		(!R1 (OBJECT1145.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1150.SK = OBJECT1145.SK)))
		(!R4 (ME1150.SK (PLUR GIRL.N)))
		(!R5 (OBJECT1145.SK GIANT.A))
		(!R6 (OBJECT1145.SK FROG.N))
		(!R7 (MOTHER1119.SK (PLUR FRIEND.N)))
		(!R8 (OBJECT1145.SK GIRL.N))
		(!R9 (OBJECT1145.SK PERSON.N))
		(!R10 (MOTHER1119.SK AGENT.N))
		(!R11 (ME1150.SK GIRL.N))
		(!R12 (MOTHER1119.SK LITTLE.A))
		(!R13 (MOTHER1119.SK BABY.N))
		(!R14 (MOTHER1119.SK BIRD.N))
		(!R15 (OBJECT1145.SK ((NN BIRD.N) FLY.N)))
		(!R16 (ME1150.SK FOX.N))
		(!R17 (MOTHER1119.SK FOX.N))
		(!R18 (MOTHER1119.SK VERTEBRATE.N))
		(!R19 (BOOK1123.SK BOX.N))
		(!R20 (MOTHER1119.SK (ON.P BOOK1123.SK)))
		(!R21 (OBJECT1145.SK (PLUR FOX.N)))
		(!R22 (OBJECT1145.SK (PERTAIN-TO ?X_C)))
		(!R23
   (OBJECT1145.SK
    (= (K (L #:G3414044 (AND (#:G3414044 GOOD.A) (#:G3414044 CARE.N)))))))
		(!R24 (OBJECT1145.SK (OF.P KITTEN1147.SK)))
		(!R25 (KITTEN1147.SK (PLUR KITTEN.N)))
		(!R26 (HOME1137.SK HOME.N))
		(!R27 (HOME1137.SK (PERTAIN-TO KITTEN1147.SK)))
		(!R28 (BOOK1123.SK BOOK.N))
		(!R29 (BOOK1123.SK ARTIFACT.N))
		(!R30 (BOOK1123.SK NEW.A))
		(!R31 (MOTHER1119.SK MOTHER.N))
		(!R32 (MOTHER1119.SK RELATIVE.N))
		(!R33 (MOTHER1119.SK (PERTAIN-TO ME1150.SK)))
		(!R34 (ME1150.SK AGENT.N))
		(!R35 (OBJECT1134.SK (PERTAIN-TO ME1150.SK)))
		(!R36 (OBJECT1139.SK (PERTAIN-TO ME1150.SK)))
	)
	(:GOALS
		(?G1 (ME1150.SK (WANT.V (THAT (ME1150.SK (HAVE.V OBJECT1145.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1150.SK HAVE.V OBJECT1145.SK)))
		(?I2 (ME1150.SK (AT.P ?L)))
		(?I3 (OBJECT1145.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME1150.SK HAVE.V OBJECT1145.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1149.SK))
		(!W2 (?I1 PRECOND-OF E1149.SK))
		(!W3 (?I2 PRECOND-OF E1149.SK))
		(!W4 (?I3 PRECOND-OF E1149.SK))
		(!W5 (?P1 POSTCOND-OF E1149.SK))
		(!W6 (E1149.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1149.SK (AFTER E1144.SK)))
		(!W9 (E1144.SK (AT-ABOUT NOW254)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R17 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C7 (!R29 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R19 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R28 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C10 (!R32 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C11 (!R13 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R31 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.5884376 17)
("My mother gave me a new book."
 "I took it to school one morning, to let the girls see the pictures."
 "Soon after this I found my pet kitten and took her home with me."
 "I like to play with my pet kitten." "I will do as mother says."
 "I will take good care of the kitten.")
(EPI-SCHEMA ((ME1150.SK (HOME.ADV TAKE.1718.V) OBJECT1145.SK (AT.P-ARG ?L)) **
             E1149.SK)
	(:ROLES
		(!R1 (OBJECT1145.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1150.SK = OBJECT1145.SK)))
		(!R4 (ME1150.SK (PLUR GIRL.N)))
		(!R5 (OBJECT1145.SK GIANT.A))
		(!R6 (OBJECT1145.SK FROG.N))
		(!R7 (MOTHER1119.SK (PLUR FRIEND.N)))
		(!R8 (OBJECT1145.SK GIRL.N))
		(!R9 (OBJECT1145.SK PERSON.N))
		(!R10 (MOTHER1119.SK AGENT.N))
		(!R11 (ME1150.SK GIRL.N))
		(!R12 (MOTHER1119.SK LITTLE.A))
		(!R13 (MOTHER1119.SK BABY.N))
		(!R14 (MOTHER1119.SK BIRD.N))
		(!R15 (OBJECT1145.SK ((NN BIRD.N) FLY.N)))
		(!R16 (ME1150.SK FOX.N))
		(!R17 (MOTHER1119.SK (PLUR FOX.N)))
		(!R18 (OBJECT1145.SK FOX.N))
		(!R19 (OBJECT1145.SK VERTEBRATE.N))
		(!R20 (BOOK1123.SK BOX.N))
		(!R21 (OBJECT1145.SK (ON.P BOOK1123.SK)))
		(!R22
   (OBJECT1145.SK
    (= (K (L #:G3414044 (AND (#:G3414044 GOOD.A) (#:G3414044 CARE.N)))))))
		(!R23 (OBJECT1145.SK (OF.P KITTEN1147.SK)))
		(!R24 (KITTEN1147.SK (PLUR KITTEN.N)))
		(!R25 (HOME1137.SK HOME.N))
		(!R26 (HOME1137.SK (PERTAIN-TO KITTEN1147.SK)))
		(!R27 (BOOK1123.SK BOOK.N))
		(!R28 (BOOK1123.SK ARTIFACT.N))
		(!R29 (BOOK1123.SK NEW.A))
		(!R30 (MOTHER1119.SK MOTHER.N))
		(!R31 (MOTHER1119.SK RELATIVE.N))
		(!R32 (MOTHER1119.SK (PERTAIN-TO ME1150.SK)))
		(!R33 (ME1150.SK AGENT.N))
		(!R34 (OBJECT1134.SK (PERTAIN-TO ME1150.SK)))
		(!R35 (OBJECT1139.SK (PERTAIN-TO ME1150.SK)))
	)
	(:GOALS
		(?G1 (ME1150.SK (WANT.V (THAT (ME1150.SK (HAVE.V OBJECT1145.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1150.SK HAVE.V OBJECT1145.SK)))
		(?I2 (ME1150.SK (AT.P ?L)))
		(?I3 (OBJECT1145.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME1150.SK HAVE.V OBJECT1145.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1149.SK))
		(!W2 (?I1 PRECOND-OF E1149.SK))
		(!W3 (?I2 PRECOND-OF E1149.SK))
		(!W4 (?I3 PRECOND-OF E1149.SK))
		(!W5 (?P1 POSTCOND-OF E1149.SK))
		(!W6 (E1149.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1149.SK (AFTER E1144.SK)))
		(!W9 (E1144.SK (AT-ABOUT NOW254)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R18 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R28 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C7 (!R20 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C8 (!R27 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R31 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C10 (!R13 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C11 (!R30 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.3606253 12)
("My mother gave me a new book."
 "I took it to school one morning, to let the girls see the pictures."
 "Soon after this I found my pet kitten and took her home with me."
 "I like to play with my pet kitten." "I will do as mother says."
 "I will take good care of the kitten.")
(EPI-SCHEMA ((ME1150.SK (HOME.ADV TAKE.1776.V) OBJECT1145.SK (AT.P-ARG ?L)) **
             E1149.SK)
	(:ROLES
		(!R1 (OBJECT1145.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1150.SK = OBJECT1145.SK)))
		(!R4 (ME1150.SK (PLUR GIRL.N)))
		(!R5 (OBJECT1145.SK GIANT.A))
		(!R6 (OBJECT1145.SK FROG.N))
		(!R7 (MOTHER1119.SK (PLUR FRIEND.N)))
		(!R8 (OBJECT1145.SK GIRL.N))
		(!R9 (OBJECT1145.SK PERSON.N))
		(!R10 (MOTHER1119.SK AGENT.N))
		(!R11 (ME1150.SK GIRL.N))
		(!R12 (MOTHER1119.SK LITTLE.A))
		(!R13 (MOTHER1119.SK BABY.N))
		(!R14 (MOTHER1119.SK BIRD.N))
		(!R15 (OBJECT1145.SK ((NN BIRD.N) FLY.N)))
		(!R16
   (OBJECT1145.SK
    (= (K (L #:G3414044 (AND (#:G3414044 GOOD.A) (#:G3414044 CARE.N)))))))
		(!R17 (OBJECT1145.SK (OF.P KITTEN1147.SK)))
		(!R18 (KITTEN1147.SK (PLUR KITTEN.N)))
		(!R19 (HOME1137.SK HOME.N))
		(!R20 (HOME1137.SK (PERTAIN-TO KITTEN1147.SK)))
		(!R21 (MOTHER1119.SK MOTHER.N))
		(!R22 (MOTHER1119.SK RELATIVE.N))
		(!R23 (MOTHER1119.SK (PERTAIN-TO ME1150.SK)))
		(!R24 (ME1150.SK AGENT.N))
		(!R25 (OBJECT1134.SK (PERTAIN-TO ME1150.SK)))
		(!R26 (OBJECT1139.SK (PERTAIN-TO ME1150.SK)))
	)
	(:GOALS
		(?G1 (ME1150.SK (WANT.V (THAT (ME1150.SK (HAVE.V OBJECT1145.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1150.SK HAVE.V OBJECT1145.SK)))
		(?I2 (ME1150.SK (AT.P ?L)))
		(?I3 (OBJECT1145.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME1150.SK HAVE.V OBJECT1145.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1149.SK))
		(!W2 (?I1 PRECOND-OF E1149.SK))
		(!W3 (?I2 PRECOND-OF E1149.SK))
		(!W4 (?I3 PRECOND-OF E1149.SK))
		(!W5 (?P1 POSTCOND-OF E1149.SK))
		(!W6 (E1149.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1149.SK (AFTER E1144.SK)))
		(!W9 (E1144.SK (AT-ABOUT NOW254)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R22 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R13 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R21 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 65:
	; "This boy has a hat."
	; "His hat is black."
	; "The bat is in his hand."
	; "He has his bat."
	; "This is a black hat."
	; "The boy had a black hat."
	; "This black hat is his."
	; "I had a black bat."
	; "The black bat is my bat."
	; "The boy has his bat in his hand."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; GO.1367.V
; TAKE.895.V
; GO.1338.V
; GO.1024.V

; story 66:
	; "Has Charley seen the nest in the big apple tree?"
	; "Oh, yes!"
	; "and he has seen the sweet apples, too."
	; "A big apple is on the green grass."
	; "Charley will get it for Rosy."
; best schemas are:
; EAT.586.V
; FEED.660.V
; FEED.196.V
; EAT.564.V
; CLIMB_GET_EAT.349.PR
; GO_FIND_EAT.566.PR

; story 67:
	; "This is a schoolhouse in America."
	; "We can see some boys and girls in the street."
	; "The boys and girls are going to school."
	; "Last night they studied their lessons."
	; "This is a large, fine schoolhouse; it is made of stone."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; GO.1367.V
; TAKE.895.V
; GO.1338.V
; GO.866.V

; story 68:
	; "A sail-boat is on the pond."
	; "The man holds the sail."
	; "The wind blows on the sail, and the boat moves fast."
	; "There is a row-boat too."
	; "I like a row-boat."
	; "It is fun to row."
; best schemas are:
; FLOAT.561.V
; TAKE.928.V
; TAKE.10.V
; TAKE.135.V
; TAKE.885.V
; TAKE.958.V

; story 69:
	; "Here is our fine new tent."
	; "There is room for all of us."
	; "Here is a fine flag for you, boys."
	; "It is red, white and blue."
	; "We have made it for the top of your tent."
	; "We will take our flag and drum."
; best schemas are:
; GO.1338.V
; GO.1024.V
; TAKE.1270.V
; TAKE.1290.V
; GO.1367.V
; GO.866.V

; story 70:
	; "This is my dog Jip."
	; "Jip is a black-and-white dog."
	; "He sits and looks at me."
	; "He has a hat on his head."
	; "Has Jip a hat?"
	; "No; he has my hat."
	; "Jip, Jip, that is my hat."
	; "Jip, give me my hat."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; GO.1367.V
; TAKE.895.V
; GO.1338.V
; PLAY.524.V

; story 71:
	; "Mother gave them to me."
	; "She gave them to me this morning."
	; "My father gave me two red ones."
	; "I will keep the red flower."
	; "I will give all my yellow flowers to Lucy."
	; "She will like them."
	; "She will take them home with her."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; TAKE.895.V
; GO.1367.V
; GO.1338.V
; TAKE.1.V
(setf matches (append matches '(( (5.544062 14)
("Mother gave them to me." "She gave them to me this morning."
 "My father gave me two red ones." "I will keep the red flower."
 "I will give all my yellow flowers to Lucy." "She will like them."
 "She will take them home with her.")
(EPI-SCHEMA ((MOTHER.NAME ((ADV-A (WITH.P MOTHER.NAME)) (HOME.ADV TAKE.2167.V))
              THEY1352.SK (AT.P-ARG ?L))
             ** E1349.SK)
	(:ROLES
		(!R1 (MOTHER.NAME AGENT.N))
		(!R2 (THEY1352.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MOTHER.NAME = THEY1352.SK)))
		(!R5 (MOTHER.NAME (PLUR GIRL.N)))
		(!R6 (THEY1352.SK GIANT.A))
		(!R7 (THEY1352.SK FROG.N))
		(!R8 (FATHER1336.SK (PERTAIN-TO MOTHER.NAME)))
		(!R9 (FATHER1336.SK (PLUR FRIEND.N)))
		(!R10 (THEY1352.SK GIRL.N))
		(!R11 (THEY1352.SK PERSON.N))
		(!R12 (FATHER1336.SK AGENT.N))
		(!R13 (MOTHER.NAME GIRL.N))
		(!R14 (FATHER1336.SK LITTLE.A))
		(!R15 (FATHER1336.SK BABY.N))
		(!R16 (FATHER1336.SK BIRD.N))
		(!R17 (THEY1352.SK ((NN BIRD.N) FLY.N)))
		(!R18 (MOTHER.NAME FOX.N))
		(!R19 (FATHER1336.SK FOX.N))
		(!R20 (FATHER1336.SK VERTEBRATE.N))
		(!R21 (?X_B BOX.N))
		(!R22 (FATHER1336.SK (ON.P ?X_B)))
		(!R23 (THEY1352.SK (PLUR FOX.N)))
		(!R24 (THEY1352.SK (PERTAIN-TO ?X_C)))
		(!R25 (THEY1352.SK AGENT.N))
		(!R26 (FATHER1336.SK FATHER.N))
		(!R27 (FATHER1336.SK RELATIVE.N))
		(!R28 (FATHER1336.SK (PERTAIN-TO ME1351.SK)))
		(!R29 (ME1351.SK AGENT.N))
		(!R30 (OBJECT1344.SK (PERTAIN-TO ME1351.SK)))
	)
	(:GOALS
		(?G1 (MOTHER.NAME (WANT.V (THAT (MOTHER.NAME (HAVE.V THEY1352.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MOTHER.NAME HAVE.V THEY1352.SK)))
		(?I2 (MOTHER.NAME (AT.P ?L)))
		(?I3 (THEY1352.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MOTHER.NAME HAVE.V THEY1352.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1349.SK))
		(!W2 (?I1 PRECOND-OF E1349.SK))
		(!W3 (?I2 PRECOND-OF E1349.SK))
		(!W4 (?I3 PRECOND-OF E1349.SK))
		(!W5 (?P1 POSTCOND-OF E1349.SK))
		(!W6 (E1349.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1349.SK (AFTER E1348.SK)))
		(!W9 (E1348.SK (AT-ABOUT NOW301)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R16 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R19 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C7 (!R27 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R15 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R26 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (6.2718744 13)
("Mother gave them to me." "She gave them to me this morning."
 "My father gave me two red ones." "I will keep the red flower."
 "I will give all my yellow flowers to Lucy." "She will like them."
 "She will take them home with her.")
(EPI-SCHEMA ((MOTHER.NAME ((ADV-A (WITH.P MOTHER.NAME)) (HOME.ADV TAKE.2168.V))
              THEY1352.SK (AT.P-ARG ?L))
             ** E1349.SK)
	(:ROLES
		(!R1 (MOTHER.NAME AGENT.N))
		(!R2 (THEY1352.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MOTHER.NAME = THEY1352.SK)))
		(!R5 (MOTHER.NAME (PLUR GIRL.N)))
		(!R6 (THEY1352.SK GIANT.A))
		(!R7 (THEY1352.SK FROG.N))
		(!R8 (FATHER1336.SK (PERTAIN-TO MOTHER.NAME)))
		(!R9 (FATHER1336.SK (PLUR FRIEND.N)))
		(!R10 (THEY1352.SK GIRL.N))
		(!R11 (THEY1352.SK PERSON.N))
		(!R12 (FATHER1336.SK AGENT.N))
		(!R13 (MOTHER.NAME GIRL.N))
		(!R14 (FATHER1336.SK LITTLE.A))
		(!R15 (FATHER1336.SK BABY.N))
		(!R16 (FATHER1336.SK BIRD.N))
		(!R17 (THEY1352.SK ((NN BIRD.N) FLY.N)))
		(!R18 (MOTHER.NAME FOX.N))
		(!R19 (FATHER1336.SK (PLUR FOX.N)))
		(!R20 (THEY1352.SK FOX.N))
		(!R21 (THEY1352.SK VERTEBRATE.N))
		(!R22 (?X_C BOX.N))
		(!R23 (THEY1352.SK (ON.P ?X_C)))
		(!R24 (THEY1352.SK AGENT.N))
		(!R25 (FATHER1336.SK FATHER.N))
		(!R26 (FATHER1336.SK RELATIVE.N))
		(!R27 (FATHER1336.SK (PERTAIN-TO ME1351.SK)))
		(!R28 (ME1351.SK AGENT.N))
		(!R29 (OBJECT1344.SK (PERTAIN-TO ME1351.SK)))
	)
	(:GOALS
		(?G1 (MOTHER.NAME (WANT.V (THAT (MOTHER.NAME (HAVE.V THEY1352.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MOTHER.NAME HAVE.V THEY1352.SK)))
		(?I2 (MOTHER.NAME (AT.P ?L)))
		(?I3 (THEY1352.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MOTHER.NAME HAVE.V THEY1352.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1349.SK))
		(!W2 (?I1 PRECOND-OF E1349.SK))
		(!W3 (?I2 PRECOND-OF E1349.SK))
		(!W4 (?I3 PRECOND-OF E1349.SK))
		(!W5 (?P1 POSTCOND-OF E1349.SK))
		(!W6 (E1349.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1349.SK (AFTER E1348.SK)))
		(!W9 (E1348.SK (AT-ABOUT NOW301)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R21 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R20 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R26 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C7 (!R15 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C8 (!R25 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R26 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C10 (!R25 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.31625 11)
("Mother gave them to me." "She gave them to me this morning."
 "My father gave me two red ones." "I will keep the red flower."
 "I will give all my yellow flowers to Lucy." "She will like them."
 "She will take them home with her.")
(EPI-SCHEMA ((MOTHER.NAME ((ADV-A (WITH.P MOTHER.NAME)) (HOME.ADV TAKE.2169.V))
              THEY1352.SK (AT.P-ARG ?L))
             ** E1349.SK)
	(:ROLES
		(!R1 (MOTHER.NAME AGENT.N))
		(!R2 (THEY1352.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MOTHER.NAME = THEY1352.SK)))
		(!R5 (MOTHER.NAME (PLUR GIRL.N)))
		(!R6 (THEY1352.SK GIANT.A))
		(!R7 (THEY1352.SK FROG.N))
		(!R8 (FATHER1336.SK (PERTAIN-TO MOTHER.NAME)))
		(!R9 (FATHER1336.SK (PLUR FRIEND.N)))
		(!R10 (THEY1352.SK GIRL.N))
		(!R11 (THEY1352.SK PERSON.N))
		(!R12 (FATHER1336.SK AGENT.N))
		(!R13 (MOTHER.NAME GIRL.N))
		(!R14 (FATHER1336.SK LITTLE.A))
		(!R15 (FATHER1336.SK BABY.N))
		(!R16 (FATHER1336.SK BIRD.N))
		(!R17 (THEY1352.SK ((NN BIRD.N) FLY.N)))
		(!R18 (THEY1352.SK AGENT.N))
		(!R19 (FATHER1336.SK FATHER.N))
		(!R20 (FATHER1336.SK RELATIVE.N))
		(!R21 (FATHER1336.SK (PERTAIN-TO ME1351.SK)))
		(!R22 (ME1351.SK AGENT.N))
		(!R23 (OBJECT1344.SK (PERTAIN-TO ME1351.SK)))
	)
	(:GOALS
		(?G1 (MOTHER.NAME (WANT.V (THAT (MOTHER.NAME (HAVE.V THEY1352.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MOTHER.NAME HAVE.V THEY1352.SK)))
		(?I2 (MOTHER.NAME (AT.P ?L)))
		(?I3 (THEY1352.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MOTHER.NAME HAVE.V THEY1352.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1349.SK))
		(!W2 (?I1 PRECOND-OF E1349.SK))
		(!W3 (?I2 PRECOND-OF E1349.SK))
		(!W4 (?I3 PRECOND-OF E1349.SK))
		(!W5 (?P1 POSTCOND-OF E1349.SK))
		(!W6 (E1349.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1349.SK (AFTER E1348.SK)))
		(!W9 (E1348.SK (AT-ABOUT NOW301)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R15 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R19 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0884376 8)
("Mother gave them to me." "She gave them to me this morning."
 "My father gave me two red ones." "I will keep the red flower."
 "I will give all my yellow flowers to Lucy." "She will like them."
 "She will take them home with her.")
(EPI-SCHEMA ((MOTHER.NAME ((ADV-A (WITH.P MOTHER.NAME)) (HOME.ADV TAKE.2191.V))
              THEY1352.SK (AT.P-ARG ?L))
             ** E1349.SK)
	(:ROLES
		(!R1 (MOTHER.NAME AGENT.N))
		(!R2 (THEY1352.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MOTHER.NAME = THEY1352.SK)))
		(!R5 (MOTHER.NAME (PLUR GIRL.N)))
		(!R6 (THEY1352.SK GIANT.A))
		(!R7 (THEY1352.SK FROG.N))
		(!R8 (FATHER1336.SK (PERTAIN-TO MOTHER.NAME)))
		(!R9 (FATHER1336.SK (PLUR FRIEND.N)))
		(!R10 (MOTHER.NAME GIRL.N))
		(!R11 (THEY1352.SK GIRL.N))
		(!R12 (THEY1352.SK PERSON.N))
		(!R13 (FATHER1336.SK AGENT.N))
		(!R14 (THEY1352.SK AGENT.N))
		(!R15 (FATHER1336.SK FATHER.N))
		(!R16 (FATHER1336.SK (PERTAIN-TO ME1351.SK)))
		(!R17 (ME1351.SK AGENT.N))
		(!R18 (OBJECT1344.SK (PERTAIN-TO ME1351.SK)))
	)
	(:GOALS
		(?G1 (MOTHER.NAME (WANT.V (THAT (MOTHER.NAME (HAVE.V THEY1352.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MOTHER.NAME HAVE.V THEY1352.SK)))
		(?I2 (MOTHER.NAME (AT.P ?L)))
		(?I3 (THEY1352.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MOTHER.NAME HAVE.V THEY1352.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1349.SK))
		(!W2 (?I1 PRECOND-OF E1349.SK))
		(!W3 (?I2 PRECOND-OF E1349.SK))
		(!W4 (?I3 PRECOND-OF E1349.SK))
		(!W5 (?P1 POSTCOND-OF E1349.SK))
		(!W6 (E1349.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1349.SK (AFTER E1348.SK)))
		(!W9 (E1348.SK (AT-ABOUT NOW301)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 72:
	; "These women came to the river to wash clothes."
	; "They brought them in large baskets on their heads."
	; "They dip the clothes in the water."
	; "Then they put soap on them."
	; "They lay the clothes on a large stone and pound them with a stick."
	; "Then they dip them in the water again."
	; "Now the clothes are white and clean."
; best schemas are:
; GO.1367.V
; GO.866.V
; GO.1084.V
; GO.1338.V
; GO.1024.V
; GO.1040.V

; story 73:
	; "The sun has set, and the pond is still."
	; "John, Ned, Ben, Tom, and Nell stand on the bank, and look at the duck."
	; "The dog with a black spot on his back, is with Tom."
	; "See!"
	; "Tom has his hat in his hand."
	; "He has left his big top on the box."
; best schemas are:
; GO.1367.V
; GO.866.V
; GO.1338.V
; GO.1024.V
; TAKE.1270.V
; TAKE.1290.V
(setf matches (append matches '(( (5.3092012 13)
("The sun has set, and the pond is still."
 "John, Ned, Ben, Tom, and Nell stand on the bank, and look at the duck."
 "The dog with a black spot on his back, is with Tom." "See!"
 "Tom has his hat in his hand." "He has left his big top on the box.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (ON.P BOX1399.SK))
               ((ADV-A (FROM.P ?X_B))
                ((ADV-A (TO.P OBJECT1398.SK))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P HAT1393.SK)) PLAY.V))))
                  GO.2372.V))))
              OBJECT1398.SK)
             ** E1396.SK)
	(:ROLES
		(!R1 (?X_B LOCATION.N))
		(!R2 (OBJECT1398.SK LOCATION.N))
		(!R3 (NOT (?X_B = OBJECT1398.SK)))
		(!R4 (HAT1393.SK (PLUR FRIEND.N)))
		(!R5 (HAT1393.SK HOME.N))
		(!R6 (HE.PRO GIRL.N))
		(!R7 (HE.PRO LITTLE.A))
		(!R8 (HE.PRO BIRD.N))
		(!R9 (HE.PRO BABY.N))
		(!R10 (HAT1393.SK DOLL.N))
		(!R11 (HAT1393.SK BIG.A))
		(!R12 (?X_B (PLUR FIELD.N)))
		(!R13 (HAT1393.SK WAGON.N))
		(!R14 (HAT1393.SK RED.A))
		(!R15 (HAT1393.SK (PERTAIN-TO HE.PRO)))
		(!R16 (HAT1393.SK BOX.N))
		(!R17 (HAT1393.SK CONTAINER.N))
		(!R18 (HE.PRO FOX.N))
		(!R19 (HE.PRO VERTEBRATE.N))
		(!R20 (BOX1399.SK BOX.N))
		(!R21 (OBJECT1398.SK (PERTAIN-TO HE.PRO)))
		(!R22 (HE.PRO MALE.A))
		(!R23 (HE.PRO AGENT.N))
		(!R24 (E1397.SK (IMPINGES-ON E1396.SK)))
		(!R25 (HAT1393.SK (PERTAIN-TO TOM.NAME)))
		(!R26 (HAT1393.SK HAT.N))
		(!R27 (HAT1393.SK ARTIFACT.N))
		(!R28 (HAND1394.SK (PERTAIN-TO TOM.NAME)))
		(!R29 (HAND1394.SK HAND.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P OBJECT1398.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P ?X_B)))
		(?I2 (NOT (HE.PRO (AT.P OBJECT1398.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P ?X_B))))
		(?P2 (HE.PRO (AT.P OBJECT1398.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1396.SK))
		(!W2 (?I2 BEFORE E1396.SK))
		(!W3 (?P1 AFTER E1396.SK))
		(!W4 (?P2 AFTER E1396.SK))
		(!W5 (?G1 CAUSE-OF E1396.SK))
		(!W6 (E1396.SK (BEFORE ?X_E)))
		(!W7 (E1396.SK (AT-ABOUT NOW314)))
	)
	(:CERTAINTIES
		(!C1 (!R27 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R26 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C4 (!R27 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C7 (!R27 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R27 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R10 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C10 (!R27 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R27 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R13 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C13 (!R27 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R27 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R27 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R27 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R13 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C18 (!R27 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R27 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R27 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R27 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R16 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C23 (!R27 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C24 (!R27 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C25 (!R27 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C26 (!R17 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C27 (!R17 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C28 (!R17 CERTAIN-TO-DEGREE (/ 2 7)))
		(!C29 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C30 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C31 (!R18 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C32 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C33 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C34 (!R27 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C35 (!R26 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C36 (!R27 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C37 (!R27 CERTAIN-TO-DEGREE (/ 2 7)))
		(!C38 (!R27 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C39 (!R27 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C40 (!R27 CERTAIN-TO-DEGREE (/ 2 7)))
		(!C41 (!R27 CERTAIN-TO-DEGREE (/ 2 7)))
		(!C42 (!R27 CERTAIN-TO-DEGREE (/ 3 5)))
		(!C43 (!R27 CERTAIN-TO-DEGREE (/ 3 6)))
		(!C44 (!R27 CERTAIN-TO-DEGREE (/ 3 7)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.5307636 15)
("The sun has set, and the pond is still."
 "John, Ned, Ben, Tom, and Nell stand on the bank, and look at the duck."
 "The dog with a black spot on his back, is with Tom." "See!"
 "Tom has his hat in his hand." "He has left his big top on the box.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (ON.P BOX1399.SK))
               ((ADV-A (FROM.P ?X_F))
                ((ADV-A (TO.P OBJECT1398.SK))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P DOG1386.SK)) PLAY.V))))
                  GO.2373.V))))
              OBJECT1398.SK)
             ** E1396.SK)
	(:ROLES
		(!R1 (?X_F LOCATION.N))
		(!R2 (OBJECT1398.SK LOCATION.N))
		(!R3 (NOT (?X_F = OBJECT1398.SK)))
		(!R4 (DOG1386.SK (PLUR FRIEND.N)))
		(!R5 (DOG1386.SK HOME.N))
		(!R6 (HE.PRO BIRD.N))
		(!R7 (DOG1386.SK DOLL.N))
		(!R8 (?X_F (PLUR TOP.N)))
		(!R9 (?X_F (ON.P BOX1399.SK)))
		(!R10 (HAT1393.SK (PERTAIN-TO HE.PRO)))
		(!R11 (DOG1386.SK (PERTAIN-TO HE.PRO)))
		(!R12 (OBJECT1398.SK TOP.N))
		(!R13 (HE.PRO GIRL.N))
		(!R14 (DOG1386.SK LITTLE.A))
		(!R15 (DOG1386.SK BABY.N))
		(!R16 (DOG1386.SK BIRD.N))
		(!R17 (HAT1393.SK BIG.A))
		(!R18 (HAT1393.SK DOLL.N))
		(!R19 (HAT1393.SK (PERTAIN-TO DUCK1384.SK)))
		(!R20 (DUCK1384.SK AGENT.N))
		(!R21 (OBJECT1398.SK (PERTAIN-TO HE.PRO)))
		(!R22 (HE.PRO MALE.A))
		(!R23 (HE.PRO AGENT.N))
		(!R24 (E1397.SK (IMPINGES-ON E1396.SK)))
		(!R25 (DUCK1384.SK DUCK.N))
		(!R26 (DOG1386.SK DOG.N))
		(!R27 (DOG1386.SK VERTEBRATE.N))
		(!R28 (HAT1393.SK (PERTAIN-TO TOM.NAME)))
		(!R29 (HAT1393.SK HAT.N))
		(!R30 (HAT1393.SK ARTIFACT.N))
		(!R31 (HAND1394.SK (PERTAIN-TO TOM.NAME)))
		(!R32 (HAND1394.SK HAND.N))
		(!R33 (BOX1399.SK BOX.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P OBJECT1398.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P ?X_F)))
		(?I2 (NOT (HE.PRO (AT.P OBJECT1398.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P ?X_F))))
		(?P2 (HE.PRO (AT.P OBJECT1398.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1396.SK))
		(!W2 (?I2 BEFORE E1396.SK))
		(!W3 (?P1 AFTER E1396.SK))
		(!W4 (?P2 AFTER E1396.SK))
		(!W5 (?G1 CAUSE-OF E1396.SK))
		(!W6 (E1396.SK (BEFORE ?X_E)))
		(!W7 (E1396.SK (AT-ABOUT NOW314)))
	)
	(:CERTAINTIES
		(!C1 (!R30 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R29 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R18 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R27 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R16 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R26 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C7 (!R30 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R29 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (6.921622 25)
("The sun has set, and the pond is still."
 "John, Ned, Ben, Tom, and Nell stand on the bank, and look at the duck."
 "The dog with a black spot on his back, is with Tom." "See!"
 "Tom has his hat in his hand." "He has left his big top on the box.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (ON.P BOX1399.SK))
               ((ADV-A (FROM.P DOG1386.SK))
                ((ADV-A (TO.P OBJECT1398.SK))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P DUCK1384.SK)) PLAY.V))))
                  GO.2374.V))))
              OBJECT1398.SK)
             ** E1396.SK)
	(:ROLES
		(!R1 (DOG1386.SK LOCATION.N))
		(!R2 (OBJECT1398.SK LOCATION.N))
		(!R3 (NOT (DOG1386.SK = OBJECT1398.SK)))
		(!R4 (DUCK1384.SK (PLUR FRIEND.N)))
		(!R5 (DUCK1384.SK HOME.N))
		(!R6 (HE.PRO BIRD.N))
		(!R7 (DUCK1384.SK DOLL.N))
		(!R8 (DOG1386.SK (PLUR TOP.N)))
		(!R9 (DUCK1384.SK (PERTAIN-TO HE.PRO)))
		(!R10 (OBJECT1398.SK TOP.N))
		(!R11 (HE.PRO GIRL.N))
		(!R12 (DUCK1384.SK BABY.N))
		(!R13 (DUCK1384.SK BIRD.N))
		(!R14 (HAT1393.SK BIG.A))
		(!R15 (HAT1393.SK DOLL.N))
		(!R16 (DUCK1384.SK LITTLE.A))
		(!R17 (DUCK1384.SK BOY.N))
		(!R18 (DOG1386.SK (PLUR FIELD.N)))
		(!R19 (HAT1393.SK RED.A))
		(!R20 (HAT1393.SK (PERTAIN-TO HE.PRO)))
		(!R21 (HAT1393.SK WAGON.N))
		(!R22 (DOG1386.SK FOX.N))
		(!R23 (DOG1386.SK (ON.P BOX1399.SK)))
		(!R24 (HAT1393.SK (PLUR BOX.N)))
		(!R25 (DUCK1384.SK BOX.N))
		(!R26 (DUCK1384.SK ARTIFACT.N))
		(!R27 (OBJECT1398.SK (PERTAIN-TO HE.PRO)))
		(!R28 (HE.PRO MALE.A))
		(!R29 (HE.PRO AGENT.N))
		(!R30 (E1397.SK (IMPINGES-ON E1396.SK)))
		(!R31 (DUCK1384.SK DUCK.N))
		(!R32 (DOG1386.SK DOG.N))
		(!R33 (DOG1386.SK CARNIVORE.N))
		(!R34 (HAT1393.SK (PERTAIN-TO TOM.NAME)))
		(!R35 (HAT1393.SK HAT.N))
		(!R36 (HAT1393.SK ARTIFACT.N))
		(!R37 (HAND1394.SK (PERTAIN-TO TOM.NAME)))
		(!R38 (HAND1394.SK HAND.N))
		(!R39 (BOX1399.SK BOX.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P OBJECT1398.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P DOG1386.SK)))
		(?I2 (NOT (HE.PRO (AT.P OBJECT1398.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P DOG1386.SK))))
		(?P2 (HE.PRO (AT.P OBJECT1398.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1396.SK))
		(!W2 (?I2 BEFORE E1396.SK))
		(!W3 (?P1 AFTER E1396.SK))
		(!W4 (?P2 AFTER E1396.SK))
		(!W5 (?G1 CAUSE-OF E1396.SK))
		(!W6 (E1396.SK (BEFORE ?X_E)))
		(!W7 (E1396.SK (AT-ABOUT NOW314)))
	)
	(:CERTAINTIES
		(!C1 (!R36 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R35 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R15 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R36 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R21 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R36 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R26 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R25 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C10 (!R33 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C11 (!R22 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R32 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C13 (!R36 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R35 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C15 (!R36 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C16 (!R21 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C17 (!R36 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.421622 16)
("The sun has set, and the pond is still."
 "John, Ned, Ben, Tom, and Nell stand on the bank, and look at the duck."
 "The dog with a black spot on his back, is with Tom." "See!"
 "Tom has his hat in his hand." "He has left his big top on the box.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (ON.P BOX1399.SK))
               ((ADV-A (FROM.P ?X_F))
                ((ADV-A (TO.P OBJECT1398.SK))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P DUCK1384.SK)) PLAY.V))))
                  GO.2375.V))))
              OBJECT1398.SK)
             ** E1396.SK)
	(:ROLES
		(!R1 (?X_F LOCATION.N))
		(!R2 (OBJECT1398.SK LOCATION.N))
		(!R3 (NOT (?X_F = OBJECT1398.SK)))
		(!R4 (DUCK1384.SK (PLUR FRIEND.N)))
		(!R5 (DUCK1384.SK HOME.N))
		(!R6 (HE.PRO BIRD.N))
		(!R7 (DUCK1384.SK DOLL.N))
		(!R8 (?X_F (PLUR TOP.N)))
		(!R9 (?X_F (ON.P BOX1399.SK)))
		(!R10 (DUCK1384.SK (PERTAIN-TO HE.PRO)))
		(!R11 (OBJECT1398.SK TOP.N))
		(!R12 (HE.PRO GIRL.N))
		(!R13 (DUCK1384.SK BABY.N))
		(!R14 (DUCK1384.SK BIRD.N))
		(!R15 (HAT1393.SK BIG.A))
		(!R16 (HAT1393.SK DOLL.N))
		(!R17 (DUCK1384.SK LITTLE.A))
		(!R18 (DUCK1384.SK BOY.N))
		(!R19 (?X_F (PLUR FIELD.N)))
		(!R20 (HAT1393.SK RED.A))
		(!R21 (HAT1393.SK (PERTAIN-TO HE.PRO)))
		(!R22 (HAT1393.SK WAGON.N))
		(!R23 (OBJECT1398.SK (PERTAIN-TO HE.PRO)))
		(!R24 (HE.PRO MALE.A))
		(!R25 (HE.PRO AGENT.N))
		(!R26 (E1397.SK (IMPINGES-ON E1396.SK)))
		(!R27 (DUCK1384.SK DUCK.N))
		(!R28 (HAT1393.SK (PERTAIN-TO TOM.NAME)))
		(!R29 (HAT1393.SK HAT.N))
		(!R30 (HAT1393.SK ARTIFACT.N))
		(!R31 (HAND1394.SK (PERTAIN-TO TOM.NAME)))
		(!R32 (HAND1394.SK HAND.N))
		(!R33 (BOX1399.SK BOX.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P OBJECT1398.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P ?X_F)))
		(?I2 (NOT (HE.PRO (AT.P OBJECT1398.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P ?X_F))))
		(?P2 (HE.PRO (AT.P OBJECT1398.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1396.SK))
		(!W2 (?I2 BEFORE E1396.SK))
		(!W3 (?P1 AFTER E1396.SK))
		(!W4 (?P2 AFTER E1396.SK))
		(!W5 (?G1 CAUSE-OF E1396.SK))
		(!W6 (E1396.SK (BEFORE ?X_E)))
		(!W7 (E1396.SK (AT-ABOUT NOW314)))
	)
	(:CERTAINTIES
		(!C1 (!R30 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R29 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R16 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R30 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R22 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R30 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R30 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C8 (!R29 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C9 (!R30 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C10 (!R22 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C11 (!R30 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 74:
	; "Here is May with her kitten."
	; "Her mother gave the kitten to her."
	; "She is kind to the pretty kitten."
	; "She likes to see it jump and play."
	; "See it run with May's ball!"
	; "It does not run far with it."
	; "If May can get the ball she will not take it."
	; "She will give it to the kitten to play with."
discarding schema GIVE.1297.V learned from this story
; best schemas are:
; TAKE.946.V
; TAKE.656.V
; TAKE.928.V
; GIVE.947.V
; GIVE_TAKE_NIL.1099.PR
(setf matches (append matches '(( (3.405 1)
("Here is May with her kitten." "Her mother gave the kitten to her."
 "She is kind to the pretty kitten." "She likes to see it jump and play."
 "See it run with May's ball!" "It does not run far with it."
 "If May can get the ball she will not take it."
 "She will give it to the kitten to play with.")
(EPI-SCHEMA ((KITTENS1402.SK ((ADV-A (TO.P KITTENS1402.SK)) GIVE.2486.V)
              KITTENS1402.SK ?X_F)
             ** E1403.SK)
	(:ROLES
		(!R1 (?X_F INANIMATE_OBJECT.N))
		(!R2 (?X_F BOOK.N))
		(!R3 (?X_F NEW.A))
		(!R4 (KITTENS1402.SK AGENT.N))
		(!R5 (KITTENS1402.SK (PERTAIN-TO KITTENS1402.SK)))
		(!R6 (E1403.SK (RIGHT-AFTER U315)))
		(!R7 (KITTENS1402.SK (PLUR KITTEN.N)))
		(!R8 (KITTENS1402.SK MOTHER.N))
		(!R9 (KITTENS1402.SK PRETTY.A))
		(!R10 (KITTENS1402.SK KITTEN.N))
		(!R11 (KITTENS1402.SK (PERTAIN-TO MAY.NAME)))
		(!R12 (MAY.NAME BALL.N))
		(!R13 (MAY.NAME (PERTAIN-TO MAY.NAME)))
		(!R14 (OBJECT1409.SK (= (K KIND.N))))
		(!R15 (OBJECT1409.SK (TO.P KITTENS1402.SK)))
		(!R16 (OBJECT1421.SK (= KITTENS1402.SK)))
	)
	(:GOALS
		(?G1 (KITTENS1402.SK (WANT.V (THAT (KITTENS1402.SK (HAVE.V ?X_F))))))
	)
	(:PRECONDS
		(?I1 (KITTENS1402.SK HAVE.V ?X_F))
		(?I2 (NOT (KITTENS1402.SK HAVE.V ?X_F)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (KITTENS1402.SK HAVE.V ?X_F)))
		(?P2 (KITTENS1402.SK HAVE.V ?X_F))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1403.SK (SAME-TIME ?X_I)))
		(!W2 (?X_H (BEFORE ?X_I)))
		(!W3 (E1403.SK (SAME-TIME NOW316)))
		(!W4 (E1407.SK (BEFORE NOW316)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 75:
	; "Will you let me ride home with you, Frank?"
	; "Yes, May, you may sit by me in the wagon if you like."
	; "Get in, and give me the whip."
	; "I will not whip the good horse."
	; "Now, here we go!"
	; "Here is the apple tree, but we can not see the nest in it."
; best schemas are:
; GO.1367.V
; TAKE.1270.V
; TAKE.1290.V
; GO.1338.V
; GO.1084.V
; GO.1024.V

; story 76:
	; "See Baby try to catch the hoop!"
	; "Baby can not catch it."
	; "The hoop rolls away from Baby."
	; "Look, Baby!"
	; "See the hoop roll!"
	; "Hear the bells, Baby!"
	; "The bells say, Tinkle, tinkle, tinkle."
; best schemas are:
; RUN.254.V
; GET.1260.V
; SIT.211.V
; SIT.505.V
; GO.866.V
; GO.1084.V

; story 77:
	; "Is this May?"
	; "No; this is Ada."
	; "May is not here."
	; "Ada is sitting in May's chair."
	; "She is looking at a fan which lies on a box."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; GO.1367.V
; GO.1338.V
; TAKE.895.V
; GO.866.V

; story 78:
	; "Here is a fisherman."
	; "He is ready to put his net into the water."
	; "He stands on two long poles over the water."
	; "He has a basket for his fish."
	; "His net is larger than Simeon's net."
	; "The men in the boats use a larger net than this."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; TAKE.895.V
; GO.1367.V
; TAKE.1.V
; PLAY.524.V

; story 79:
	; "These boys are Ned and Roy."
	; "The large boy is Roy."
	; "The boy who has a bun is Ned."
	; "The boys are sitting on the floor."
	; "Roy's dog, Carlo, lies near Ned."
	; "Is he lying near Roy?"
	; "Ned and Roy are good boys."
; best schemas are:
; GO.1338.V
; GO.1024.V
; GO.1040.V
; GO.1083.V
; GO.1367.V
; GO.866.V

; story 80:
	; "Did the boys swing their hats and cheer?"
	; "This morning there were many boys and girls on the hill."
	; "They had their sleds with them."
	; "The snow on the hill was just right, and they had fine sport."
	; "How the boys did swing their hats and cheer!"
	; "They did this when the little girls were ahead."
	; "When the boys were ahead, the girls said,— Ho, ho!"
	; "There they go; Over the ice and over the snow."
; best schemas are:
; GO.1338.V
; GO.1024.V
; GO.1040.V
; GO.1083.V
; PLAY.524.V
; TAKE.542.V

; story 81:
	; "The man has a little dog."
	; "The boy has a big dog."
	; "See the little dog run!"
	; "He has my ball."
	; "The little dog may have the ball."
	; "He may run and play with it."
	; "She can not take it."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; GO.1338.V
; GO.1024.V
; GO.1040.V
; GO.1083.V

; story 82:
	; "These men fish in the sea."
	; "They have a large net."
	; "They carry the net in a boat and drip it into the water."
	; "Soon they pull it to the shore."
	; "Sometimes they find many fish in it."
	; "The women put the fish in the basket and take them home."
	; "Pedro and Simeon like to watch the men in the boats and help pull in the net."
; best schemas are:
; GO.1367.V
; TAKE.928.V
; TAKE.1270.V
; TAKE.1290.V
; GET.1260.V
; TAKE.1.V

; story 83:
	; "The boy can run and play."
	; "The boy can play ball."
	; "The man may see the boy play."
	; "The boy may take the ball."
	; "The baby has a big doll."
	; "The little girl has a ball."
	; "I can see the baby."
	; "The baby may have my ball."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; GO.1338.V
; TAKE.895.V
; GO.1367.V
; PLAY.524.V

; story 84:
	; "This is Fred and his sled."
	; "It is a red sled."
	; "It is a red sled, and it has black letters on it."
	; "Fred let Frank stand on his sled, and Frank fell into the snow."
	; "I am Fred and this is Frank."
	; "This is my red sled."
	; "My sled is a pretty sled."
	; "I let frank have my sled, and he fell into the snow."
	; "Frank can not stand on my sled."
	; "I can stand on it."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; GO.1367.V
; GO.1338.V
; TAKE.895.V
; GO.1084.V
(setf matches (append matches '(( (2.5 17)
("This is Fred and his sled." "It is a red sled."
 "It is a red sled, and it has black letters on it."
 "Fred let Frank stand on his sled, and Frank fell into the snow."
 "I am Fred and this is Frank." "This is my red sled."
 "My sled is a pretty sled."
 "I let frank have my sled, and he fell into the snow."
 "Frank can not stand on my sled." "I can stand on it.")
(EPI-SCHEMA ((FRANK.NAME
              ((ADV-A (INTO.P SNOW1660.SK))
               ((ADV-A (FROM.P ?X_B))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P OBJECT1645.SK)) PLAY.V))))
                  FALL.3190.V))))
              ?L2)
             ** E1662.SK)
	(:ROLES
		(!R1 (?X_B LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?X_B = ?L2)))
		(!R4 (OBJECT1645.SK (PLUR FRIEND.N)))
		(!R5 (OBJECT1645.SK HOME.N))
		(!R6 (FRANK.NAME GIRL.N))
		(!R7 (OBJECT1645.SK HAT.N))
		(!R8 (FRANK.NAME LITTLE.A))
		(!R9 (FRANK.NAME BIRD.N))
		(!R10 (FRANK.NAME BABY.N))
		(!R11 (OBJECT1645.SK DOLL.N))
		(!R12 (OBJECT1645.SK BIG.A))
		(!R13 (?X_B (PLUR FIELD.N)))
		(!R14 (OBJECT1645.SK WAGON.N))
		(!R15 (OBJECT1645.SK RED.A))
		(!R16 (FRANK.NAME AGENT.N))
		(!R17 (OBJECT1645.SK (PERTAIN-TO FRANK.NAME)))
		(!R18 (OBJECT1645.SK BOX.N))
		(!R19 (OBJECT1645.SK ARTIFACT.N))
		(!R20 (OBJECT1645.SK CONTAINER.N))
		(!R21 (FRANK.NAME FOX.N))
		(!R22 (FRANK.NAME VERTEBRATE.N))
		(!R23 (SNOW1660.SK SNOW.N))
		(!R24 (OBJECT1658.SK (PERTAIN-TO FRANK.NAME)))
		(!R25 (E1663.SK (AT-OR-BEFORE NOW387)))
		(!R26 (OBJECT1645.SK (PERTAIN-TO FRED.NAME)))
	)
	(:GOALS
		(?G1 (FRANK.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRANK.NAME (AT.P ?X_B)))
		(?I2 (NOT (FRANK.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRANK.NAME (AT.P ?X_B))))
		(?P2 (FRANK.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1662.SK))
		(!W2 (?I2 BEFORE E1662.SK))
		(!W3 (?P1 AFTER E1662.SK))
		(!W4 (?P2 AFTER E1662.SK))
		(!W5 (?G1 CAUSE-OF E1662.SK))
		(!W6 (E1662.SK (BEFORE ?X_E)))
		(!W7 (E1661.SK (CONSEC E1662.SK)))
		(!W8 (E1662.SK (DURING E1657.SK)))
		(!W9 (E1661.SK (DURING E1657.SK)))
		(!W10 (E1657.SK (BEFORE NOW387)))
	)
	(:CERTAINTIES
		(!C1 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C4 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C6 (!R14 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C7 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C10 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R14 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C13 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R14 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C18 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R18 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C23 (!R19 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C24 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C25 (!R19 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C26 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C27 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C28 (!R20 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C29 (!R22 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C30 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C31 (!R21 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C32 (!R22 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C33 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.6953125 24)
("This is Fred and his sled." "It is a red sled."
 "It is a red sled, and it has black letters on it."
 "Fred let Frank stand on his sled, and Frank fell into the snow."
 "I am Fred and this is Frank." "This is my red sled."
 "My sled is a pretty sled."
 "I let frank have my sled, and he fell into the snow."
 "Frank can not stand on my sled." "I can stand on it.")
(EPI-SCHEMA ((FRANK.NAME
              ((ADV-A (INTO.P SNOW1660.SK))
               ((ADV-A (FROM.P OBJECT1652.SK))
                ((ADV-A (TO.P ?X_H))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P OBJECT1645.SK)) PLAY.V))))
                  FALL.3191.V))))
              ?X_H)
             ** E1662.SK)
	(:ROLES
		(!R1 (OBJECT1652.SK LOCATION.N))
		(!R2 (?X_H LOCATION.N))
		(!R3 (NOT (OBJECT1652.SK = ?X_H)))
		(!R4 (OBJECT1645.SK (PLUR FRIEND.N)))
		(!R5 (OBJECT1645.SK HOME.N))
		(!R6 (FRANK.NAME BIRD.N))
		(!R7 (OBJECT1645.SK DOLL.N))
		(!R8 (SLED1655.SK HAT.N))
		(!R9 (OBJECT1652.SK (PLUR TOP.N)))
		(!R10 (OBJECT1645.SK (PERTAIN-TO FRANK.NAME)))
		(!R11 (?X_H TOP.N))
		(!R12 (FRANK.NAME GIRL.N))
		(!R13 (OBJECT1645.SK BABY.N))
		(!R14 (OBJECT1645.SK BIRD.N))
		(!R15 (SLED1655.SK BIG.A))
		(!R16 (SLED1655.SK DOLL.N))
		(!R17 (OBJECT1645.SK LITTLE.A))
		(!R18 (OBJECT1645.SK BOY.N))
		(!R19 (OBJECT1652.SK (PLUR FIELD.N)))
		(!R20 (SLED1655.SK (PERTAIN-TO FRANK.NAME)))
		(!R21 (SLED1655.SK WAGON.N))
		(!R22 (FRANK.NAME AGENT.N))
		(!R23 (OBJECT1652.SK FOX.N))
		(!R24 (IT1687.SK BOX.N))
		(!R25 (SLED1655.SK (PLUR BOX.N)))
		(!R26 (OBJECT1645.SK BOX.N))
		(!R27 (OBJECT1645.SK ARTIFACT.N))
		(!R28 (SNOW1660.SK SNOW.N))
		(!R29 (OBJECT1658.SK (PERTAIN-TO FRANK.NAME)))
		(!R30 (E1663.SK (AT-OR-BEFORE NOW387)))
		(!R31 (OBJECT1645.SK (PERTAIN-TO FRED.NAME)))
		(!R32 (SLED1655.SK RED.A))
		(!R33 (SLED1655.SK SLED.N))
		(!R34 (SLED1655.SK ARTIFACT.N))
		(!R35 (SLED1655.SK INSTRUMENTALITY.N))
		(!R36 (OBJECT1652.SK (ON.P IT1687.SK)))
		(!R37
   (OBJECT1652.SK
    (=
     (K
      (L #:G7058709 (AND (#:G7058709 BLACK.A) (#:G7058709 (PLUR LETTER.N))))))))
	)
	(:GOALS
		(?G1 (FRANK.NAME (WANT.V (KA ((ADV-A (AT.P ?X_H)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRANK.NAME (AT.P OBJECT1652.SK)))
		(?I2 (NOT (FRANK.NAME (AT.P ?X_H))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRANK.NAME (AT.P OBJECT1652.SK))))
		(?P2 (FRANK.NAME (AT.P ?X_H)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1662.SK))
		(!W2 (?I2 BEFORE E1662.SK))
		(!W3 (?P1 AFTER E1662.SK))
		(!W4 (?P2 AFTER E1662.SK))
		(!W5 (?G1 CAUSE-OF E1662.SK))
		(!W6 (E1662.SK (BEFORE ?X_E)))
		(!W7 (E1661.SK (CONSEC E1662.SK)))
		(!W8 (E1662.SK (DURING E1657.SK)))
		(!W9 (E1661.SK (DURING E1657.SK)))
		(!W10 (E1657.SK (BEFORE NOW387)))
	)
	(:CERTAINTIES
		(!C1 (!R34 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R16 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R34 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R21 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R34 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R27 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R26 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C10 (!R34 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C11 (!R33 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C12 (!R34 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C13 (!R35 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C14 (!R21 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C15 (!R35 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 13)
("This is Fred and his sled." "It is a red sled."
 "It is a red sled, and it has black letters on it."
 "Fred let Frank stand on his sled, and Frank fell into the snow."
 "I am Fred and this is Frank." "This is my red sled."
 "My sled is a pretty sled."
 "I let frank have my sled, and he fell into the snow."
 "Frank can not stand on my sled." "I can stand on it.")
(EPI-SCHEMA ((FRANK.NAME
              ((ADV-A (INTO.P SNOW1660.SK))
               ((ADV-A (FROM.P ?X_B))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P OBJECT1645.SK)) PLAY.V))))
                  FALL.3193.V))))
              ?L2)
             ** E1662.SK)
	(:ROLES
		(!R1 (?X_B LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?X_B = ?L2)))
		(!R4 (OBJECT1645.SK (PLUR FRIEND.N)))
		(!R5 (OBJECT1645.SK HOME.N))
		(!R6 (FRANK.NAME GIRL.N))
		(!R7 (OBJECT1645.SK HAT.N))
		(!R8 (FRANK.NAME LITTLE.A))
		(!R9 (FRANK.NAME BIRD.N))
		(!R10 (FRANK.NAME BABY.N))
		(!R11 (OBJECT1645.SK DOLL.N))
		(!R12 (OBJECT1645.SK BIG.A))
		(!R13 (?X_B (PLUR FIELD.N)))
		(!R14 (OBJECT1645.SK WAGON.N))
		(!R15 (OBJECT1645.SK ARTIFACT.N))
		(!R16 (OBJECT1645.SK RED.A))
		(!R17 (FRANK.NAME AGENT.N))
		(!R18 (OBJECT1645.SK (PERTAIN-TO FRANK.NAME)))
		(!R19 (SNOW1660.SK SNOW.N))
		(!R20 (OBJECT1658.SK (PERTAIN-TO FRANK.NAME)))
		(!R21 (E1663.SK (AT-OR-BEFORE NOW387)))
		(!R22 (OBJECT1645.SK (PERTAIN-TO FRED.NAME)))
	)
	(:GOALS
		(?G1 (FRANK.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRANK.NAME (AT.P ?X_B)))
		(?I2 (NOT (FRANK.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRANK.NAME (AT.P ?X_B))))
		(?P2 (FRANK.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1662.SK))
		(!W2 (?I2 BEFORE E1662.SK))
		(!W3 (?P1 AFTER E1662.SK))
		(!W4 (?P2 AFTER E1662.SK))
		(!W5 (?G1 CAUSE-OF E1662.SK))
		(!W6 (E1662.SK (BEFORE ?X_E)))
		(!W7 (E1661.SK (CONSEC E1662.SK)))
		(!W8 (E1662.SK (DURING E1657.SK)))
		(!W9 (E1661.SK (DURING E1657.SK)))
		(!W10 (E1657.SK (BEFORE NOW387)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R14 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C7 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C10 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R14 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C13 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R14 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C18 (!R15 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R15 CERTAIN-TO-DEGREE (/ 2 5)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 85:
	; "Ned has a nice boat on the pond."
	; "He can row the boat."
	; "Ned has an oar in his right hand, and an oar in his left hand."
	; "He can row with two oars."
	; "I can row a boat."
	; "I can row with two oars."
	; "No one is in the boat with Ned."
	; "He must take care not to fall out."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; TAKE.895.V
; GO.1367.V
; GO.1338.V
; PLAY.524.V

; story 86:
	; "Yes, Fred, I see it."
	; "Can you see eggs in the nest?"
	; "Yes, Rosy, I can."
	; "Oh, Fred, can I get a peep at them?"
	; "I will get the nest, Rosy, and let you see it."
	; "No!"
	; "no!"
	; "I beg you not to get it."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; TAKE.895.V
; GO.1367.V
; GO.1338.V
; TAKE.1.V

; story 87:
	; "The cherry is red."
	; "The buttercup is yellow."
	; "I can paint a buttercup or a cherry."
	; "The buttercup is a flower, but the cherry is a fruit."
	; "The color of the orange is not red and it is not yellow."
	; "We call this color orange."
	; "I can make orange."
	; "Red and yellow make orange."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; GO.1367.V
; TAKE.895.V
; GO.1338.V
; GO.1084.V

; story 88:
	; "This is Tom and May."
	; "Tom and May can play ball."
	; "Tom has a little bat and a little ball."
	; "Tom has hit the ball."
	; "See it fly!"
	; "See May run!"
	; "Will she get the ball?"
	; "O, yes, she will get the ball."
	; "Run, May, run, and get the ball!"
discarding schema GET.1669.V learned from this story
; best schemas are:
; GO.1367.V
; GO_GET_NIL.677.PR
; GET.672.V
; PLAY.990.V
; PLAY.991.V
(setf matches (append matches '(( (1.1411133 1)
("This is Tom and May." "Tom and May can play ball."
 "Tom has a little bat and a little ball." "Tom has hit the ball."
 "See it fly!" "See May run!" "Will she get the ball?"
 "O, yes, she will get the ball." "Run, May, run, and get the ball!")
(EPI-SCHEMA ((SHE.PRO GO_GET_NIL.3268.PR ?L BALL1776.SK) ** ?E)
	(:ROLES
		(!R1 (BALL1776.SK INANIMATE_OBJECT.N))
		(!R2 (BALL1776.SK PRED?.N))
		(!R3 (NOT (SHE.PRO = BALL1776.SK)))
		(!R4 (SHE.PRO FEMALE.A))
		(!R5 (SHE.PRO AGENT.N))
		(!R6 (BALL1776.SK BALL.N))
	)
	(:PRECONDS
		(?I1 (SHE.PRO (AT.P ?L1_2)))
		(?I2 (NOT (SHE.PRO (AT.P ?L))))
	)
	(:STEPS
		(?E1 (SHE.PRO ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L)) GO.673.V)) ?L))
		(E1777.SK (SHE.PRO GET.672.V BALL1776.SK (AT.P-ARG ?L2)))
	)
	(:POSTCONDS
		(?P1 (SHE.PRO HAVE.V BALL1776.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE E1777.SK))
		(!W2 (E1777.SK (AFTER E1775.SK)))
		(!W3 (E1775.SK (AT-ABOUT NOW425)))
	)
)
))))
(setf matches (append matches '(( (4.1411133 3)
("This is Tom and May." "Tom and May can play ball."
 "Tom has a little bat and a little ball." "Tom has hit the ball."
 "See it fly!" "See May run!" "Will she get the ball?"
 "O, yes, she will get the ball." "Run, May, run, and get the ball!")
(EPI-SCHEMA ((SHE.PRO GET.3279.V BALL1776.SK (AT.P-ARG ?L)) ** E1777.SK)
	(:ROLES
		(!R1 (BALL1776.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (SHE.PRO = BALL1776.SK)))
		(!R4 (?X_A PHONE.N))
		(!R5 (BALL1776.SK PRED?.N))
		(!R6 (?X_B (AT-OR-BEFORE ?X_J)))
		(!R7 (BALL1776.SK BALL.N))
		(!R8 (SHE.PRO FEMALE.A))
		(!R9 (SHE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (SHE.PRO (HAVE.V BALL1776.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SHE.PRO HAVE.V BALL1776.SK)))
		(?I2 (SHE.PRO (AT.P ?L)))
		(?I3 (BALL1776.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (SHE.PRO HAVE.V BALL1776.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1777.SK))
		(!W2 (?I1 PRECOND-OF E1777.SK))
		(!W3 (?I2 PRECOND-OF E1777.SK))
		(!W4 (?I3 PRECOND-OF E1777.SK))
		(!W5 (?P1 POSTCOND-OF E1777.SK))
		(!W6 (?G1 (BEFORE ?X_F)))
		(!W7 (?X_H (CONSEC E1777.SK)))
		(!W8 (E1777.SK (DURING ?X_I)))
		(!W9 (?X_H (DURING ?X_I)))
		(!W10 (?X_I (BEFORE ?X_J)))
		(!W11 (E1777.SK (AFTER E1775.SK)))
		(!W12 (E1775.SK (AT-ABOUT NOW425)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 89:
	; "There are fish in their pond."
	; "They are very nice fish."
	; "We will come and catch them."
	; "We will take the long rod, and the hook and line."
	; "We must have a bag, too."
	; "It must be strong, to keep the fish safe."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; GO.1367.V
; TAKE.895.V
; GO.1338.V
; GO.866.V

; story 90:
	; "I see May and her dolls."
	; "May is in her little chair."
	; "She has a doll in her lap."
	; "One doll is sitting on a bed."
	; "The doll on the bed is wax."
	; "The doll in her lap is not wax."
	; "May's dolls have blue eyes."
	; "Has May blue eyes?"
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; PLAY.524.V
; GO.1367.V
; TAKE.895.V
; GO.1338.V

; story 91:
	; "It is night."
	; "The moon and stars are shining."
	; "I see many stars."
	; "At night the boys and girls are asleep."
	; "In the day they play or work."
	; "When night comes they are very tired."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; TAKE.895.V
; GO.1367.V
; GO.1338.V
; TAKE.1.V

; story 92:
	; "This girl has a fan."
	; "The fan is in her hand."
	; "She can fan the cat."
	; "I see a girl."
	; "And I see a cat and a fan."
	; "This girl has the cat."
	; "And the girl has the fan."
	; "The fan is in her hand."
	; "I can fan the girl."
	; "She can fan her cat."
	; "This is my black fan."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; TAKE.1.V
; TAKE.895.V
; FEED.660.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
; error processing story
; story 93:
	; "Do you see that tree on the hill?"
	; "Well, a nest is in that tree."
	; "Charley, Fred and I went to see the nest."
	; "It had eggs in it."
	; "Charley went up the tree and got the nest for us to see."
	; "As he held it in his hand, an egg fell on the grass."
	; "Was not that too bad?"
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; TAKE.895.V
; GO.1367.V
; PLAY.524.V
; GO.1338.V
(setf matches (append matches '(( (3.6390626 12)
("Do you see that tree on the hill?" "Well, a nest is in that tree."
 "Charley, Fred and I went to see the nest." "It had eggs in it."
 "Charley went up the tree and got the nest for us to see."
 "As he held it in his hand, an egg fell on the grass." "Was not that too bad?")
(EPI-SCHEMA ((ME1908.SK
              ((ADV-A
                (FOR.P
                 (KA ((ADV-A (WITH.P NEW-SALIENT-ENTITY*1882.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_B)) GO.3558.V)))
              ?L2)
             ** E1892.SK)
	(:ROLES
		(!R1 (?X_B LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?X_B = ?L2)))
		(!R4 (NEW-SALIENT-ENTITY*1882.SK (PLUR FRIEND.N)))
		(!R5 (NEW-SALIENT-ENTITY*1882.SK HOME.N))
		(!R6 (ME1908.SK GIRL.N))
		(!R7 (NEW-SALIENT-ENTITY*1882.SK HAT.N))
		(!R8 (ME1908.SK LITTLE.A))
		(!R9 (ME1908.SK BIRD.N))
		(!R10 (ME1908.SK BABY.N))
		(!R11 (NEW-SALIENT-ENTITY*1882.SK DOLL.N))
		(!R12 (NEW-SALIENT-ENTITY*1882.SK BIG.A))
		(!R13 (?X_B (PLUR FIELD.N)))
		(!R14 (NEW-SALIENT-ENTITY*1882.SK WAGON.N))
		(!R15 (NEW-SALIENT-ENTITY*1882.SK RED.A))
		(!R16 (NEW-SALIENT-ENTITY*1882.SK (PERTAIN-TO ME1908.SK)))
		(!R17 (NEW-SALIENT-ENTITY*1882.SK BOX.N))
		(!R18 (NEW-SALIENT-ENTITY*1882.SK ARTIFACT.N))
		(!R19 (NEW-SALIENT-ENTITY*1882.SK CONTAINER.N))
		(!R20 (ME1908.SK FOX.N))
		(!R21 (ME1908.SK VERTEBRATE.N))
		(!R22 (NEST1889.SK NEST.N))
		(!R23 (ME1908.SK AGENT.N))
		(!R24 (NEW-SALIENT-ENTITY*1882.SK NEW-SALIENT-ENTITY*.N))
		(!R25 (NEW-SALIENT-ENTITY*1882.SK TREE.N))
		(!R26 (NEW-SALIENT-ENTITY*1882.SK HAND.N))
		(!R27 (NEW-SALIENT-ENTITY*1882.SK (PERTAIN-TO HE.PRO)))
		(!R28 (HE.PRO MALE.A))
		(!R29 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (ME1908.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1908.SK (AT.P ?X_B)))
		(?I2 (NOT (ME1908.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1908.SK (AT.P ?X_B))))
		(?P2 (ME1908.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1892.SK))
		(!W2 (?I2 BEFORE E1892.SK))
		(!W3 (?P1 AFTER E1892.SK))
		(!W4 (?P2 AFTER E1892.SK))
		(!W5 (?G1 CAUSE-OF E1892.SK))
		(!W6 (E1892.SK (BEFORE ?X_E)))
		(!W7 (E1892.SK (BEFORE NOW460)))
		(!W8 (OBJECT1888.SK (BEFORE NOW460)))
	)
	(:CERTAINTIES
		(!C1 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C4 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C6 (!R14 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C7 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C10 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R14 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C13 (!R18 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R18 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R18 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R14 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C18 (!R18 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R18 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R18 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R18 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R17 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C23 (!R18 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C24 (!R18 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C25 (!R18 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C26 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C27 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C28 (!R19 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C29 (!R21 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C30 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C31 (!R20 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C32 (!R21 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C33 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.955625 20)
("Do you see that tree on the hill?" "Well, a nest is in that tree."
 "Charley, Fred and I went to see the nest." "It had eggs in it."
 "Charley went up the tree and got the nest for us to see."
 "As he held it in his hand, an egg fell on the grass." "Was not that too bad?")
(EPI-SCHEMA ((ME1908.SK
              ((ADV-A
                (FOR.P
                 (KA ((ADV-A (WITH.P NEW-SALIENT-ENTITY*1882.SK)) PLAY.V))))
               ((ADV-A (TO.P ?X_H)) ((ADV-A (FROM.P TREE1896.SK)) GO.3560.V)))
              ?X_H)
             ** E1892.SK)
	(:ROLES
		(!R1 (TREE1896.SK LOCATION.N))
		(!R2 (?X_H LOCATION.N))
		(!R3 (NOT (TREE1896.SK = ?X_H)))
		(!R4 (NEW-SALIENT-ENTITY*1882.SK (PLUR FRIEND.N)))
		(!R5 (NEW-SALIENT-ENTITY*1882.SK HOME.N))
		(!R6 (ME1908.SK BIRD.N))
		(!R7 (NEW-SALIENT-ENTITY*1882.SK HAT.N))
		(!R8 (TREE1896.SK (PLUR TOP.N)))
		(!R9 (?X_H TOP.N))
		(!R10 (ME1908.SK GIRL.N))
		(!R11 (NEW-SALIENT-ENTITY*1882.SK BABY.N))
		(!R12 (NEW-SALIENT-ENTITY*1882.SK BIRD.N))
		(!R13 (NEW-SALIENT-ENTITY*1882.SK BIG.A))
		(!R14 (NEW-SALIENT-ENTITY*1882.SK DOLL.N))
		(!R15 (NEW-SALIENT-ENTITY*1882.SK LITTLE.A))
		(!R16 (NEW-SALIENT-ENTITY*1882.SK BOY.N))
		(!R17 (TREE1896.SK (PLUR FIELD.N)))
		(!R18 (NEW-SALIENT-ENTITY*1882.SK RED.A))
		(!R19 (NEW-SALIENT-ENTITY*1882.SK (PERTAIN-TO ME1908.SK)))
		(!R20 (NEW-SALIENT-ENTITY*1882.SK WAGON.N))
		(!R21 (TREE1896.SK FOX.N))
		(!R22 (TREE1896.SK (ON.P ?X_A)))
		(!R23 (?X_A BOX.N))
		(!R24 (NEW-SALIENT-ENTITY*1882.SK (PLUR BOX.N)))
		(!R25 (NEW-SALIENT-ENTITY*1882.SK BOX.N))
		(!R26 (NEW-SALIENT-ENTITY*1882.SK ARTIFACT.N))
		(!R27 (NEST1889.SK NEST.N))
		(!R28 (ME1908.SK AGENT.N))
		(!R29 (TREE1896.SK TREE.N))
		(!R30 (TREE1896.SK ORGANISM.N))
		(!R31 (NEW-SALIENT-ENTITY*1882.SK NEW-SALIENT-ENTITY*.N))
		(!R32 (NEW-SALIENT-ENTITY*1882.SK TREE.N))
		(!R33 (NEW-SALIENT-ENTITY*1882.SK ORGANISM.N))
		(!R34 (NEW-SALIENT-ENTITY*1882.SK HAND.N))
		(!R35 (NEW-SALIENT-ENTITY*1882.SK (PERTAIN-TO HE.PRO)))
		(!R36 (HE.PRO MALE.A))
		(!R37 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (ME1908.SK (WANT.V (KA ((ADV-A (AT.P ?X_H)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1908.SK (AT.P TREE1896.SK)))
		(?I2 (NOT (ME1908.SK (AT.P ?X_H))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1908.SK (AT.P TREE1896.SK))))
		(?P2 (ME1908.SK (AT.P ?X_H)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1892.SK))
		(!W2 (?I2 BEFORE E1892.SK))
		(!W3 (?P1 AFTER E1892.SK))
		(!W4 (?P2 AFTER E1892.SK))
		(!W5 (?G1 CAUSE-OF E1892.SK))
		(!W6 (E1892.SK (BEFORE ?X_E)))
		(!W7 (E1892.SK (BEFORE NOW460)))
		(!W8 (OBJECT1888.SK (BEFORE NOW460)))
	)
	(:CERTAINTIES
		(!C1 (!R26 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R14 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R26 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R20 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R26 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R26 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R25 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C10 (!R33 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C11 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C12 (!R32 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C13 (!R30 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C14 (!R21 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C15 (!R29 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C16 (!R33 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C17 (!R32 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 94:
	; "Nell has a new sled."
	; "Nell says, I must take baby May for a ride, then I must go to school."
	; "Here you can see Nell with baby May on the sled."
	; "Baby likes to ride on the new sled."
	; "She likes to play in the white snow."
	; "If Nell runs too fast, May calls, Stop, stop!"
	; "Baby can not tell Nell that she is going too fast."
	; "Soon baby May can say, too fast!"
; best schemas are:
; PLAY.669.V
; PLAY.670.V
; PLAY_GIVE_NIL.925.PR
; GO_GET_NIL.677.PR
; PLAY.524.V
; PLAY.V

; story 95:
	; "See!"
	; "John is rolling the ball to Tyke."
	; "Run!"
	; "Tyke!"
	; "Get the ball."
	; "Good dog!"
	; "Take the ball to John."
; best schemas are:
; ROLL.657.V
; TAKE.656.V
; GIVE.1297.V
; GET.1669.V
; PLAY.990.V
; PLAY.991.V

; story 96:
	; "Frank and little May are in the field with the wagon."
	; "They have come to find flowers."
	; "May has a red flower."
	; "Frank has three yellow flowers."
	; "He will let May have them."
	; "She will take them to the wagon."
	; "She is glad to get the pretty flowers."
; best schemas are:
; GO.1367.V
; TAKE.1270.V
; TAKE.1290.V
; GO.1338.V
; GO.1084.V
; GO.1024.V
(setf matches (append matches '(( (5.25562 15)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon." "She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P WAGON1941.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2))
                ((ADV-A (FROM.P FIELD1940.SK)) COME.1665.V)))
              ?L2)
             ** E1942.SK)
	(:ROLES
		(!R1 (FIELD1940.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (FIELD1940.SK = ?L2)))
		(!R4 (WAGON1941.SK (PLUR FRIEND.N)))
		(!R5 (WAGON1941.SK HOME.N))
		(!R6 (MAY.NAME GIRL.N))
		(!R7 (WAGON1941.SK HAT.N))
		(!R8 (MAY.NAME LITTLE.A))
		(!R9 (MAY.NAME BIRD.N))
		(!R10 (MAY.NAME BABY.N))
		(!R11 (WAGON1941.SK DOLL.N))
		(!R12 (WAGON1941.SK BIG.A))
		(!R13 (FIELD1940.SK (PLUR FIELD.N)))
		(!R14 (WAGON1941.SK RED.A))
		(!R15 (MAY.NAME AGENT.N))
		(!R16 (WAGON1941.SK (PERTAIN-TO MAY.NAME)))
		(!R17 (WAGON1941.SK BOX.N))
		(!R18 (MAY.NAME FOX.N))
		(!R19 (MAY.NAME VERTEBRATE.N))
		(!R20 (E1942.SK (IMPINGES-ON E539)))
		(!R21 (FIELD1940.SK FIELD.N))
		(!R22 (WAGON1941.SK WAGON.N))
		(!R23 (WAGON1941.SK ARTIFACT.N))
		(!R24 (WAGON1941.SK CONTAINER.N))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1940.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAY.NAME (AT.P FIELD1940.SK))))
		(?P2 (MAY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1942.SK))
		(!W2 (?I2 BEFORE E1942.SK))
		(!W3 (?P1 AFTER E1942.SK))
		(!W4 (?P2 AFTER E1942.SK))
		(!W5 (?G1 CAUSE-OF E1942.SK))
		(!W6 (E1942.SK (BEFORE ?X_E)))
		(!W7 (OBJECT1943.SK (AT-ABOUT NOW482)))
	)
	(:CERTAINTIES
		(!C1 (!R23 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C4 (!R23 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C6 (!R22 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C7 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R23 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C10 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R22 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C13 (!R23 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R23 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R23 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R22 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C18 (!R23 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R23 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R23 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R23 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R17 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C23 (!R23 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C24 (!R23 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C25 (!R23 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C26 (!R24 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C27 (!R24 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C28 (!R24 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C29 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C30 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C31 (!R18 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C32 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C33 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C34 (!R23 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C35 (!R22 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C36 (!R23 CERTAIN-TO-DEGREE (/ 2 7)))
		(!C37 (!R23 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C38 (!R23 CERTAIN-TO-DEGREE (/ 2 7)))
		(!C39 (!R24 CERTAIN-TO-DEGREE (/ 2 7)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.925542 21)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon." "She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FLOWER1946.SK)) PLAY.V))))
               ((ADV-A (TO.P ?X_H))
                ((ADV-A (FROM.P FIELD1940.SK)) COME.3585.V)))
              ?X_H)
             ** E1942.SK)
	(:ROLES
		(!R1 (FIELD1940.SK LOCATION.N))
		(!R2 (?X_H LOCATION.N))
		(!R3 (NOT (FIELD1940.SK = ?X_H)))
		(!R4 (FLOWER1946.SK (PLUR FRIEND.N)))
		(!R5 (FLOWER1946.SK HOME.N))
		(!R6 (MAY.NAME BIRD.N))
		(!R7 (FLOWER1946.SK DOLL.N))
		(!R8 (WAGON1941.SK HAT.N))
		(!R9 (FIELD1940.SK (PLUR TOP.N)))
		(!R10 (FLOWER1946.SK (PERTAIN-TO MAY.NAME)))
		(!R11 (?X_H TOP.N))
		(!R12 (MAY.NAME GIRL.N))
		(!R13 (FLOWER1946.SK BABY.N))
		(!R14 (FLOWER1946.SK BIRD.N))
		(!R15 (WAGON1941.SK BIG.A))
		(!R16 (WAGON1941.SK DOLL.N))
		(!R17 (FLOWER1946.SK LITTLE.A))
		(!R18 (FLOWER1946.SK BOY.N))
		(!R19 (FIELD1940.SK (PLUR FIELD.N)))
		(!R20 (WAGON1941.SK RED.A))
		(!R21 (WAGON1941.SK (PERTAIN-TO MAY.NAME)))
		(!R22 (MAY.NAME AGENT.N))
		(!R23 (FIELD1940.SK FOX.N))
		(!R24 (FIELD1940.SK (ON.P ?X_A)))
		(!R25 (?X_A BOX.N))
		(!R26 (WAGON1941.SK (PLUR BOX.N)))
		(!R27 (FLOWER1946.SK BOX.N))
		(!R28 (FLOWER1946.SK ARTIFACT.N))
		(!R29 (E1942.SK (IMPINGES-ON E539)))
		(!R30 (FIELD1940.SK FIELD.N))
		(!R31 (WAGON1941.SK WAGON.N))
		(!R32 (WAGON1941.SK ARTIFACT.N))
		(!R33 (FLOWER1946.SK RED.A))
		(!R34 (FLOWER1946.SK FLOWER.N))
		(!R35 (FLOWER1946.SK ORGANISM.N))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?X_H)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1940.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?X_H))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAY.NAME (AT.P FIELD1940.SK))))
		(?P2 (MAY.NAME (AT.P ?X_H)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1942.SK))
		(!W2 (?I2 BEFORE E1942.SK))
		(!W3 (?P1 AFTER E1942.SK))
		(!W4 (?P2 AFTER E1942.SK))
		(!W5 (?G1 CAUSE-OF E1942.SK))
		(!W6 (E1942.SK (BEFORE ?X_E)))
		(!W7 (OBJECT1943.SK (AT-ABOUT NOW482)))
	)
	(:CERTAINTIES
		(!C1 (!R32 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R16 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R32 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R31 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R32 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R28 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R27 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C10 (!R32 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C11 (!R31 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C12 (!R32 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C13 (!R35 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C14 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C15 (!R34 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.925542 12)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon." "She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P WAGON1941.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2))
                ((ADV-A (FROM.P FIELD1940.SK)) COME.1667.V)))
              ?L2)
             ** E1942.SK)
	(:ROLES
		(!R1 (FIELD1940.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (FIELD1940.SK = ?L2)))
		(!R4 (WAGON1941.SK (PLUR FRIEND.N)))
		(!R5 (WAGON1941.SK HOME.N))
		(!R6 (MAY.NAME GIRL.N))
		(!R7 (WAGON1941.SK HAT.N))
		(!R8 (MAY.NAME LITTLE.A))
		(!R9 (MAY.NAME BIRD.N))
		(!R10 (MAY.NAME BABY.N))
		(!R11 (WAGON1941.SK DOLL.N))
		(!R12 (WAGON1941.SK BIG.A))
		(!R13 (FIELD1940.SK (PLUR FIELD.N)))
		(!R14 (WAGON1941.SK RED.A))
		(!R15 (MAY.NAME AGENT.N))
		(!R16 (WAGON1941.SK (PERTAIN-TO MAY.NAME)))
		(!R17 (E1942.SK (IMPINGES-ON E539)))
		(!R18 (FIELD1940.SK FIELD.N))
		(!R19 (WAGON1941.SK WAGON.N))
		(!R20 (WAGON1941.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1940.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAY.NAME (AT.P FIELD1940.SK))))
		(?P2 (MAY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1942.SK))
		(!W2 (?I2 BEFORE E1942.SK))
		(!W3 (?P1 AFTER E1942.SK))
		(!W4 (?P2 AFTER E1942.SK))
		(!W5 (?G1 CAUSE-OF E1942.SK))
		(!W6 (E1942.SK (BEFORE ?X_E)))
		(!W7 (OBJECT1943.SK (AT-ABOUT NOW482)))
	)
	(:CERTAINTIES
		(!C1 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C4 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C6 (!R19 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C7 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C10 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R19 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C13 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R19 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C18 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R19 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C23 (!R20 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C24 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C25 (!R20 CERTAIN-TO-DEGREE (/ 2 6)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.925542 17)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon." "She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FLOWER1946.SK)) PLAY.V))))
               ((ADV-A (TO.P ?X_H))
                ((ADV-A (FROM.P FIELD1940.SK)) COME.3586.V)))
              ?X_H)
             ** E1942.SK)
	(:ROLES
		(!R1 (FIELD1940.SK LOCATION.N))
		(!R2 (?X_H LOCATION.N))
		(!R3 (NOT (FIELD1940.SK = ?X_H)))
		(!R4 (FLOWER1946.SK (PLUR FRIEND.N)))
		(!R5 (FLOWER1946.SK HOME.N))
		(!R6 (MAY.NAME BIRD.N))
		(!R7 (FLOWER1946.SK DOLL.N))
		(!R8 (WAGON1941.SK HAT.N))
		(!R9 (FIELD1940.SK (PLUR TOP.N)))
		(!R10 (FIELD1940.SK (ON.P ?X_A)))
		(!R11 (?X_A BOX.N))
		(!R12 (FLOWER1946.SK (PERTAIN-TO MAY.NAME)))
		(!R13 (?X_H TOP.N))
		(!R14 (MAY.NAME GIRL.N))
		(!R15 (FLOWER1946.SK BABY.N))
		(!R16 (FLOWER1946.SK BIRD.N))
		(!R17 (WAGON1941.SK BIG.A))
		(!R18 (WAGON1941.SK DOLL.N))
		(!R19 (FLOWER1946.SK LITTLE.A))
		(!R20 (FLOWER1946.SK BOY.N))
		(!R21 (FIELD1940.SK (PLUR FIELD.N)))
		(!R22 (MAY.NAME AGENT.N))
		(!R23 (WAGON1941.SK RED.A))
		(!R24 (WAGON1941.SK (PERTAIN-TO MAY.NAME)))
		(!R25 (E1942.SK (IMPINGES-ON E539)))
		(!R26 (FIELD1940.SK FIELD.N))
		(!R27 (WAGON1941.SK WAGON.N))
		(!R28 (WAGON1941.SK ARTIFACT.N))
		(!R29 (FLOWER1946.SK RED.A))
		(!R30 (FLOWER1946.SK FLOWER.N))
		(!R31 (FLOWER1946.SK ORGANISM.N))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?X_H)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1940.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?X_H))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAY.NAME (AT.P FIELD1940.SK))))
		(?P2 (MAY.NAME (AT.P ?X_H)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1942.SK))
		(!W2 (?I2 BEFORE E1942.SK))
		(!W3 (?P1 AFTER E1942.SK))
		(!W4 (?P2 AFTER E1942.SK))
		(!W5 (?G1 CAUSE-OF E1942.SK))
		(!W6 (E1942.SK (BEFORE ?X_E)))
		(!W7 (OBJECT1943.SK (AT-ABOUT NOW482)))
	)
	(:CERTAINTIES
		(!C1 (!R28 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R18 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R28 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R27 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R28 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R28 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C8 (!R27 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C9 (!R28 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C10 (!R31 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C11 (!R16 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R30 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 97:
	; "Frank and little May are in the field with the wagon."
	; "They have come to find flowers."
	; "May has a red flower."
	; "Frank has three yellow flowers."
	; "He will let May have them."
	; "She will take them to the wagon."
	; "She is glad to get the pretty flowers."
; best schemas are:
; GO.1367.V
; TAKE.1270.V
; TAKE.1290.V
; GO.1338.V
; GO.1084.V
; GO.1024.V
(setf matches (append matches '(( (5.25562 15)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon." "She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P WAGON1960.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2))
                ((ADV-A (FROM.P FIELD1959.SK)) COME.1665.V)))
              ?L2)
             ** E1961.SK)
	(:ROLES
		(!R1 (FIELD1959.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (FIELD1959.SK = ?L2)))
		(!R4 (WAGON1960.SK (PLUR FRIEND.N)))
		(!R5 (WAGON1960.SK HOME.N))
		(!R6 (MAY.NAME GIRL.N))
		(!R7 (WAGON1960.SK HAT.N))
		(!R8 (MAY.NAME LITTLE.A))
		(!R9 (MAY.NAME BIRD.N))
		(!R10 (MAY.NAME BABY.N))
		(!R11 (WAGON1960.SK DOLL.N))
		(!R12 (WAGON1960.SK BIG.A))
		(!R13 (FIELD1959.SK (PLUR FIELD.N)))
		(!R14 (WAGON1960.SK RED.A))
		(!R15 (MAY.NAME AGENT.N))
		(!R16 (WAGON1960.SK (PERTAIN-TO MAY.NAME)))
		(!R17 (WAGON1960.SK BOX.N))
		(!R18 (MAY.NAME FOX.N))
		(!R19 (MAY.NAME VERTEBRATE.N))
		(!R20 (E1961.SK (IMPINGES-ON E547)))
		(!R21 (FIELD1959.SK FIELD.N))
		(!R22 (WAGON1960.SK WAGON.N))
		(!R23 (WAGON1960.SK ARTIFACT.N))
		(!R24 (WAGON1960.SK CONTAINER.N))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1959.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAY.NAME (AT.P FIELD1959.SK))))
		(?P2 (MAY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1961.SK))
		(!W2 (?I2 BEFORE E1961.SK))
		(!W3 (?P1 AFTER E1961.SK))
		(!W4 (?P2 AFTER E1961.SK))
		(!W5 (?G1 CAUSE-OF E1961.SK))
		(!W6 (E1961.SK (BEFORE ?X_E)))
		(!W7 (OBJECT1962.SK (AT-ABOUT NOW489)))
	)
	(:CERTAINTIES
		(!C1 (!R23 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C4 (!R23 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C6 (!R22 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C7 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R23 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C10 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R22 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C13 (!R23 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R23 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R23 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R22 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C18 (!R23 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R23 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R23 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R23 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R17 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C23 (!R23 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C24 (!R23 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C25 (!R23 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C26 (!R24 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C27 (!R24 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C28 (!R24 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C29 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C30 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C31 (!R18 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C32 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C33 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C34 (!R23 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C35 (!R22 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C36 (!R23 CERTAIN-TO-DEGREE (/ 2 7)))
		(!C37 (!R23 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C38 (!R23 CERTAIN-TO-DEGREE (/ 2 7)))
		(!C39 (!R24 CERTAIN-TO-DEGREE (/ 2 7)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.925542 21)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon." "She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FLOWER1965.SK)) PLAY.V))))
               ((ADV-A (TO.P ?X_H))
                ((ADV-A (FROM.P FIELD1959.SK)) COME.3585.V)))
              ?X_H)
             ** E1961.SK)
	(:ROLES
		(!R1 (FIELD1959.SK LOCATION.N))
		(!R2 (?X_H LOCATION.N))
		(!R3 (NOT (FIELD1959.SK = ?X_H)))
		(!R4 (FLOWER1965.SK (PLUR FRIEND.N)))
		(!R5 (FLOWER1965.SK HOME.N))
		(!R6 (MAY.NAME BIRD.N))
		(!R7 (FLOWER1965.SK DOLL.N))
		(!R8 (WAGON1960.SK HAT.N))
		(!R9 (FIELD1959.SK (PLUR TOP.N)))
		(!R10 (FLOWER1965.SK (PERTAIN-TO MAY.NAME)))
		(!R11 (?X_H TOP.N))
		(!R12 (MAY.NAME GIRL.N))
		(!R13 (FLOWER1965.SK BABY.N))
		(!R14 (FLOWER1965.SK BIRD.N))
		(!R15 (WAGON1960.SK BIG.A))
		(!R16 (WAGON1960.SK DOLL.N))
		(!R17 (FLOWER1965.SK LITTLE.A))
		(!R18 (FLOWER1965.SK BOY.N))
		(!R19 (FIELD1959.SK (PLUR FIELD.N)))
		(!R20 (WAGON1960.SK RED.A))
		(!R21 (WAGON1960.SK (PERTAIN-TO MAY.NAME)))
		(!R22 (MAY.NAME AGENT.N))
		(!R23 (FIELD1959.SK FOX.N))
		(!R24 (FIELD1959.SK (ON.P ?X_A)))
		(!R25 (?X_A BOX.N))
		(!R26 (WAGON1960.SK (PLUR BOX.N)))
		(!R27 (FLOWER1965.SK BOX.N))
		(!R28 (FLOWER1965.SK ARTIFACT.N))
		(!R29 (E1961.SK (IMPINGES-ON E547)))
		(!R30 (FIELD1959.SK FIELD.N))
		(!R31 (WAGON1960.SK WAGON.N))
		(!R32 (WAGON1960.SK ARTIFACT.N))
		(!R33 (FLOWER1965.SK RED.A))
		(!R34 (FLOWER1965.SK FLOWER.N))
		(!R35 (FLOWER1965.SK ORGANISM.N))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?X_H)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1959.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?X_H))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAY.NAME (AT.P FIELD1959.SK))))
		(?P2 (MAY.NAME (AT.P ?X_H)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1961.SK))
		(!W2 (?I2 BEFORE E1961.SK))
		(!W3 (?P1 AFTER E1961.SK))
		(!W4 (?P2 AFTER E1961.SK))
		(!W5 (?G1 CAUSE-OF E1961.SK))
		(!W6 (E1961.SK (BEFORE ?X_E)))
		(!W7 (OBJECT1962.SK (AT-ABOUT NOW489)))
	)
	(:CERTAINTIES
		(!C1 (!R32 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R16 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R32 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R31 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R32 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R28 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R27 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C10 (!R32 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C11 (!R31 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C12 (!R32 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C13 (!R35 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C14 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C15 (!R34 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.925542 12)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon." "She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P WAGON1960.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2))
                ((ADV-A (FROM.P FIELD1959.SK)) COME.1667.V)))
              ?L2)
             ** E1961.SK)
	(:ROLES
		(!R1 (FIELD1959.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (FIELD1959.SK = ?L2)))
		(!R4 (WAGON1960.SK (PLUR FRIEND.N)))
		(!R5 (WAGON1960.SK HOME.N))
		(!R6 (MAY.NAME GIRL.N))
		(!R7 (WAGON1960.SK HAT.N))
		(!R8 (MAY.NAME LITTLE.A))
		(!R9 (MAY.NAME BIRD.N))
		(!R10 (MAY.NAME BABY.N))
		(!R11 (WAGON1960.SK DOLL.N))
		(!R12 (WAGON1960.SK BIG.A))
		(!R13 (FIELD1959.SK (PLUR FIELD.N)))
		(!R14 (WAGON1960.SK RED.A))
		(!R15 (MAY.NAME AGENT.N))
		(!R16 (WAGON1960.SK (PERTAIN-TO MAY.NAME)))
		(!R17 (E1961.SK (IMPINGES-ON E547)))
		(!R18 (FIELD1959.SK FIELD.N))
		(!R19 (WAGON1960.SK WAGON.N))
		(!R20 (WAGON1960.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1959.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAY.NAME (AT.P FIELD1959.SK))))
		(?P2 (MAY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1961.SK))
		(!W2 (?I2 BEFORE E1961.SK))
		(!W3 (?P1 AFTER E1961.SK))
		(!W4 (?P2 AFTER E1961.SK))
		(!W5 (?G1 CAUSE-OF E1961.SK))
		(!W6 (E1961.SK (BEFORE ?X_E)))
		(!W7 (OBJECT1962.SK (AT-ABOUT NOW489)))
	)
	(:CERTAINTIES
		(!C1 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C4 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C6 (!R19 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C7 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C10 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R19 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C13 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C14 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R19 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C18 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R19 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C23 (!R20 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C24 (!R20 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C25 (!R20 CERTAIN-TO-DEGREE (/ 2 6)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.925542 17)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon." "She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FLOWER1965.SK)) PLAY.V))))
               ((ADV-A (TO.P ?X_H))
                ((ADV-A (FROM.P FIELD1959.SK)) COME.3586.V)))
              ?X_H)
             ** E1961.SK)
	(:ROLES
		(!R1 (FIELD1959.SK LOCATION.N))
		(!R2 (?X_H LOCATION.N))
		(!R3 (NOT (FIELD1959.SK = ?X_H)))
		(!R4 (FLOWER1965.SK (PLUR FRIEND.N)))
		(!R5 (FLOWER1965.SK HOME.N))
		(!R6 (MAY.NAME BIRD.N))
		(!R7 (FLOWER1965.SK DOLL.N))
		(!R8 (WAGON1960.SK HAT.N))
		(!R9 (FIELD1959.SK (PLUR TOP.N)))
		(!R10 (FIELD1959.SK (ON.P ?X_A)))
		(!R11 (?X_A BOX.N))
		(!R12 (FLOWER1965.SK (PERTAIN-TO MAY.NAME)))
		(!R13 (?X_H TOP.N))
		(!R14 (MAY.NAME GIRL.N))
		(!R15 (FLOWER1965.SK BABY.N))
		(!R16 (FLOWER1965.SK BIRD.N))
		(!R17 (WAGON1960.SK BIG.A))
		(!R18 (WAGON1960.SK DOLL.N))
		(!R19 (FLOWER1965.SK LITTLE.A))
		(!R20 (FLOWER1965.SK BOY.N))
		(!R21 (FIELD1959.SK (PLUR FIELD.N)))
		(!R22 (MAY.NAME AGENT.N))
		(!R23 (WAGON1960.SK RED.A))
		(!R24 (WAGON1960.SK (PERTAIN-TO MAY.NAME)))
		(!R25 (E1961.SK (IMPINGES-ON E547)))
		(!R26 (FIELD1959.SK FIELD.N))
		(!R27 (WAGON1960.SK WAGON.N))
		(!R28 (WAGON1960.SK ARTIFACT.N))
		(!R29 (FLOWER1965.SK RED.A))
		(!R30 (FLOWER1965.SK FLOWER.N))
		(!R31 (FLOWER1965.SK ORGANISM.N))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?X_H)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1959.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?X_H))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAY.NAME (AT.P FIELD1959.SK))))
		(?P2 (MAY.NAME (AT.P ?X_H)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1961.SK))
		(!W2 (?I2 BEFORE E1961.SK))
		(!W3 (?P1 AFTER E1961.SK))
		(!W4 (?P2 AFTER E1961.SK))
		(!W5 (?G1 CAUSE-OF E1961.SK))
		(!W6 (E1961.SK (BEFORE ?X_E)))
		(!W7 (OBJECT1962.SK (AT-ABOUT NOW489)))
	)
	(:CERTAINTIES
		(!C1 (!R28 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R18 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R28 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R27 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R28 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R28 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C8 (!R27 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C9 (!R28 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C10 (!R31 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C11 (!R16 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R30 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 98:
	; "Here is a large tree."
	; "The leaves grow on the branches of the tree."
	; "The branches grow from the trunk of the tree."
	; "What is the trunk of the tree?"
	; "The large part of the tree is called the trunk."
	; "Do you know what the roots are?"
	; "The roots grow in the ground."
	; "They get water and food for the tree from the ground."
; best schemas are:
; CLIMB_GET_EAT.349.PR
; GET.218.V
; EAT.323.V
; FEED.324.V
; FEED.325.V
; FEED.660.V

; story 99:
	; "The boys and girls are having fine sport."
	; "The snow on the hill is just right, and their sleds run well."
	; "O, look at them!"
	; "Elsie and Roy are ahead."
	; "Ho, ho!"
	; "There they go; Over the ice and over the snow."
; best schemas are:
; TAKE.1270.V
; TAKE.1290.V
; TAKE.895.V
; GO.1367.V
; GO.1338.V
; GO.866.V

