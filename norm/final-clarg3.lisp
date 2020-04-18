(setf matches (list))
(setf chain-matches (list))
; story 0:
	; "The man put on his watch."
	; "His watch was not running."
	; "He took his watch off."
	; "He shook the watch."
	; "The watch started running again."
discarding schema TAKE.1.V learned from this story
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; TAKE.10.V
; TAKE.135.V
; RUN.311.V
; RUN.227.V
(setf matches (append matches '(( (4.5178127 4)
("The man put on his watch." "His watch was not running."
 "He took his watch off." "He shook the watch."
 "The watch started running again.")
(EPI-SCHEMA ((MAN2.SK TAKE.10.V WATCH5.SK (AT.P-ARG ?X_C)) ** E18.SK)
	(:ROLES
		(!R1 (MAN2.SK AGENT.N))
		(!R2 (WATCH5.SK INANIMATE_OBJECT.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (MAN2.SK = WATCH5.SK)))
		(!R5 (WATCH5.SK (PERTAIN-TO WATCH5.SK)))
		(!R6 (WATCH5.SK BROTHER.N))
		(!R7 (?X_B (= MAN2.SK)))
		(!R8 (?X_B DAY.N))
		(!R9 (?X_C FARM.N))
		(!R10 (WATCH5.SK WATCH.N))
		(!R11 (MAN2.SK MAN.N))
		(!R12 (WATCH5.SK (PERTAIN-TO MAN2.SK)))
	)
	(:GOALS
		(?G1 (MAN2.SK (WANT.V (THAT (MAN2.SK (HAVE.V WATCH5.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN2.SK HAVE.V WATCH5.SK)))
		(?I2 (MAN2.SK (AT.P ?X_C)))
		(?I3 (WATCH5.SK (AT.P ?X_C)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN2.SK HAVE.V WATCH5.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E18.SK))
		(!W2 (?I1 PRECOND-OF E18.SK))
		(!W3 (?I2 PRECOND-OF E18.SK))
		(!W4 (?I3 PRECOND-OF E18.SK))
		(!W5 (?P1 POSTCOND-OF E18.SK))
		(!W6 (E18.SK (BEFORE ?X_G)))
		(!W7 (E18.SK (BEFORE NOW2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 1:
	; "The man put on his jacket."
	; "He soon became too hot."
	; "He took his jacket off."
	; "He became cold again."
	; "He put on a coat that was not as warm."
discarding schema TAKE.10.V learned from this story
; best schemas are:
; GIVE.241.V
; TAKE.1.V
; TAKE.135.V
; TAKE.885.V
; TAKE.958.V
(setf matches (append matches '(( (4.727813 4)
("The man put on his jacket." "He soon became too hot."
 "He took his jacket off." "He became cold again."
 "He put on a coat that was not as warm.")
(EPI-SCHEMA ((HE.PRO TAKE.27.V MAN27.SK (AT.P-ARG ?L)) ** E40.SK)
	(:ROLES
		(!R1 (MAN27.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = MAN27.SK)))
		(!R4 (MAN27.SK WATCH.N))
		(!R5 (HE.PRO MAN.N))
		(!R6 (MAN27.SK MAN.N))
		(!R7 (MAN27.SK JACKET.N))
		(!R8 (MAN27.SK ARTIFACT.N))
		(!R9 (MAN27.SK (PERTAIN-TO HE.PRO)))
		(!R10 (HE.PRO MALE.A))
		(!R11 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V MAN27.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V MAN27.SK)))
		(?I2 (HE.PRO (AT.P ?L)))
		(?I3 (MAN27.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V MAN27.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E40.SK))
		(!W2 (?I1 PRECOND-OF E40.SK))
		(!W3 (?I2 PRECOND-OF E40.SK))
		(!W4 (?I3 PRECOND-OF E40.SK))
		(!W5 (?P1 POSTCOND-OF E40.SK))
		(!W6 (E40.SK (BEFORE ?X_D)))
		(!W7 (E40.SK (BEFORE NOW7)))
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
("The man put on his jacket." "He soon became too hot."
 "He took his jacket off." "He became cold again."
 "He put on a coat that was not as warm.")
(EPI-SCHEMA ((HE.PRO TAKE.28.V MAN27.SK (AT.P-ARG ?X_C)) ** E40.SK)
	(:ROLES
		(!R1 (MAN27.SK INANIMATE_OBJECT.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (HE.PRO = MAN27.SK)))
		(!R4 (HE.PRO MAN.N))
		(!R5 (MAN27.SK (PERTAIN-TO MAN27.SK)))
		(!R6 (MAN27.SK BROTHER.N))
		(!R7 (?X_B (= HE.PRO)))
		(!R8 (?X_B DAY.N))
		(!R9 (?X_C FARM.N))
		(!R10 (MAN27.SK MAN.N))
		(!R11 (MAN27.SK PERSON.N))
		(!R12 (MAN27.SK JACKET.N))
		(!R13 (MAN27.SK (PERTAIN-TO HE.PRO)))
		(!R14 (HE.PRO MALE.A))
		(!R15 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V MAN27.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V MAN27.SK)))
		(?I2 (HE.PRO (AT.P ?X_C)))
		(?I3 (MAN27.SK (AT.P ?X_C)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V MAN27.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E40.SK))
		(!W2 (?I1 PRECOND-OF E40.SK))
		(!W3 (?I2 PRECOND-OF E40.SK))
		(!W4 (?I3 PRECOND-OF E40.SK))
		(!W5 (?P1 POSTCOND-OF E40.SK))
		(!W6 (E40.SK (BEFORE ?X_G)))
		(!W7 (E40.SK (BEFORE NOW7)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.227813 4)
("The man put on his jacket." "He soon became too hot."
 "He took his jacket off." "He became cold again."
 "He put on a coat that was not as warm.")
(EPI-SCHEMA ((HE.PRO ((ADV-A (TO.P ?X_A)) TAKE.29.V) MAN27.SK (AT.P-ARG ?L)) **
             E40.SK)
	(:ROLES
		(!R1 (MAN27.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = MAN27.SK)))
		(!R4 (?X_A VET.N))
		(!R5 (MAN27.SK CAT.N))
		(!R6 (HE.PRO MAN.N))
		(!R7 (MAN27.SK MAN.N))
		(!R8 (MAN27.SK JACKET.N))
		(!R9 (MAN27.SK (PERTAIN-TO HE.PRO)))
		(!R10 (HE.PRO MALE.A))
		(!R11 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V MAN27.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V MAN27.SK)))
		(?I2 (HE.PRO (AT.P ?L)))
		(?I3 (MAN27.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V MAN27.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E40.SK))
		(!W2 (?I1 PRECOND-OF E40.SK))
		(!W3 (?I2 PRECOND-OF E40.SK))
		(!W4 (?I3 PRECOND-OF E40.SK))
		(!W5 (?P1 POSTCOND-OF E40.SK))
		(!W6 (E40.SK (BEFORE ?X_E)))
		(!W7 (E40.SK (BEFORE NOW7)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.227813 6)
("The man put on his jacket." "He soon became too hot."
 "He took his jacket off." "He became cold again."
 "He put on a coat that was not as warm.")
(EPI-SCHEMA ((HE.PRO ((ADV-A (TO.P COAT46.SK)) TAKE.30.V) MAN27.SK
              (AT.P-ARG ?L))
             ** E40.SK)
	(:ROLES
		(!R1 (MAN27.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = MAN27.SK)))
		(!R4 (MAN27.SK ((NN CAR.N) COLOR.N)))
		(!R5 (MAN27.SK NEW.A))
		(!R6 (HE.PRO MAN.N))
		(!R7 (COAT46.SK SHOP.N))
		(!R8 (MAN27.SK MAN.N))
		(!R9 (MAN27.SK JACKET.N))
		(!R10 (MAN27.SK (PERTAIN-TO HE.PRO)))
		(!R11 (HE.PRO MALE.A))
		(!R12 (HE.PRO AGENT.N))
		(!R13 (COAT46.SK COAT.N))
		(!R14 (COAT46.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V MAN27.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V MAN27.SK)))
		(?I2 (HE.PRO (AT.P ?L)))
		(?I3 (MAN27.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V MAN27.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E40.SK))
		(!W2 (?I1 PRECOND-OF E40.SK))
		(!W3 (?I2 PRECOND-OF E40.SK))
		(!W4 (?I3 PRECOND-OF E40.SK))
		(!W5 (?P1 POSTCOND-OF E40.SK))
		(!W6 (?G1 (BEFORE ?X_E)))
		(!W7 (E40.SK (BEFORE ?X_G)))
		(!W8 (E40.SK (BEFORE NOW7)))
	)
	(:CERTAINTIES
		(!C1 (!R14 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R13 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 2:
	; "I went on a plane yesterday."
	; "As I got on it something happened."
	; "We had to turn back."
	; "A fire came about."
	; "It was scary."
discarding schema GO.19.V learned from this story
; best schemas are:
; FLY.235.V
; GO.591.V
; GO.658.V
; GO.1083.V
; GIVE.194.V
(setf matches (append matches '(( (3.1834376 0)
("I went on a plane yesterday." "As I got on it something happened."
 "We had to turn back." "A fire came about." "It was scary.")
(EPI-SCHEMA ((ME69.SK
              ((ADV-A (ON.P PLANE51.SK))
               ((ADV-A (IN.P (K YESTERDAY.N)))
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?L2)) (AWAY.ADV FLY.31.V)))))
              ?L2)
             ** E59.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (ME69.SK ((NN MOTHER.N) BIRD.N)))
		(!R5 (ME69.SK BIRD.N))
		(!R6 (ME69.SK ((NN BABY.N) BIRD.N)))
		(!R7 (ME69.SK AGENT.N))
		(!R8 (PLANE51.SK PLANE.N))
	)
	(:GOALS
		(?G1 (ME69.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME69.SK (AT.P ?L1)))
		(?I2 (NOT (ME69.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME69.SK (AT.P ?L1))))
		(?P2 (ME69.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E59.SK))
		(!W2 (?I2 BEFORE E59.SK))
		(!W3 (?P1 AFTER E59.SK))
		(!W4 (?P2 AFTER E59.SK))
		(!W5 (?G1 CAUSE-OF E59.SK))
		(!W6 (E59.SK (BEFORE ?X_C)))
		(!W7 (E59.SK (BEFORE NOW10)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.7278125 1)
("I went on a plane yesterday." "As I got on it something happened."
 "We had to turn back." "A fire came about." "It was scary.")
(EPI-SCHEMA ((ME69.SK
              ((ADV-A (ON.P PLANE51.SK))
               ((ADV-A (IN.P (K YESTERDAY.N)))
                ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.32.V))))
              ?X_C)
             ** E59.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (?L1 = ?X_C)))
		(!R4 (ME69.SK CAT.N))
		(!R5 (ME69.SK NEW.A))
		(!R6 (?X_C ((NN PET.N) STORE.N)))
		(!R7 (?X_A CAT.N))
		(!R8 (?X_A NICE.A))
		(!R9 (?X_A (PERTAIN-TO ME69.SK)))
		(!R10 (ME69.SK AGENT.N))
		(!R11 (PLANE51.SK PLANE.N))
	)
	(:GOALS
		(?G1 (ME69.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME69.SK (AT.P ?L1)))
		(?I2 (NOT (ME69.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME69.SK (AT.P ?L1))))
		(?P2 (ME69.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E59.SK))
		(!W2 (?I2 BEFORE E59.SK))
		(!W3 (?P1 AFTER E59.SK))
		(!W4 (?P2 AFTER E59.SK))
		(!W5 (?G1 CAUSE-OF E59.SK))
		(!W6 (E59.SK (BEFORE ?X_E)))
		(!W7 (E59.SK (BEFORE NOW10)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.7278125 0)
("I went on a plane yesterday." "As I got on it something happened."
 "We had to turn back." "A fire came about." "It was scary.")
(EPI-SCHEMA ((ME69.SK
              ((ADV-A (ON.P PLANE51.SK))
               ((ADV-A (IN.P (K YESTERDAY.N)))
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?L2))
                  ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_A)) PLAY.V))))
                   GO.33.V)))))
              ?L2)
             ** E59.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (?X_A (PLUR FRIEND.N)))
		(!R5 (?X_A HOME.N))
		(!R6 (?X_A (PERTAIN-TO ME69.SK)))
		(!R7 (ME69.SK GIRL.N))
		(!R8 (?X_A (PERTAIN-TO ?X_B)))
		(!R9 (ME69.SK AGENT.N))
		(!R10 (PLANE51.SK PLANE.N))
	)
	(:GOALS
		(?G1 (ME69.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME69.SK (AT.P ?L1)))
		(?I2 (NOT (ME69.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME69.SK (AT.P ?L1))))
		(?P2 (ME69.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E59.SK))
		(!W2 (?I2 BEFORE E59.SK))
		(!W3 (?P1 AFTER E59.SK))
		(!W4 (?P2 AFTER E59.SK))
		(!W5 (?G1 CAUSE-OF E59.SK))
		(!W6 (E59.SK (BEFORE ?X_E)))
		(!W7 (E59.SK (BEFORE NOW10)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.7278125 0)
("I went on a plane yesterday." "As I got on it something happened."
 "We had to turn back." "A fire came about." "It was scary.")
(EPI-SCHEMA ((ME69.SK
              ((ADV-A (ON.P PLANE51.SK))
               ((ADV-A (IN.P (K YESTERDAY.N)))
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?L2))
                  ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_A)) LOOK.V))))
                   GO.34.V)))))
              ?L2)
             ** E59.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (?X_A (PLUR CLOTHE.N)))
		(!R5 (ME69.SK MAN.N))
		(!R6 (?X_B (PERTAIN-TO ME69.SK)))
		(!R7 (?X_B WIFE.N))
		(!R8 (ME69.SK AGENT.N))
		(!R9 (PLANE51.SK PLANE.N))
	)
	(:GOALS
		(?G1 (ME69.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME69.SK (AT.P ?L1)))
		(?I2 (NOT (ME69.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME69.SK (AT.P ?L1))))
		(?P2 (ME69.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E59.SK))
		(!W2 (?I2 BEFORE E59.SK))
		(!W3 (?P1 AFTER E59.SK))
		(!W4 (?P2 AFTER E59.SK))
		(!W5 (?G1 CAUSE-OF E59.SK))
		(!W6 (E59.SK (BEFORE ?X_E)))
		(!W7 (E59.SK (BEFORE NOW10)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 3:
	; "Ethan sat in a chair."
	; "The chair was old."
	; "The chair broke."
	; "Ethan fell on the ground."
	; "He decided to buy a new one."
discarding schema SIT.24.V learned from this story
; best schemas are:
; SIT.1381.V
; SIT.211.V
; SIT.505.V
; SIT.49.V
; SIT.65.V
(setf matches (append matches '(( (3.5618622 1)
("Ethan sat in a chair." "The chair was old." "The chair broke."
 "Ethan fell on the ground." "He decided to buy a new one.")
(EPI-SCHEMA ((ETHAN.NAME
              ((ADV-A (ON.P CHAIR74.SK)) ((ADV-A (IN.P CHAIR74.SK)) SIT.36.V)))
             ** E76.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (CHAIR74.SK INANIMATE_OBJECT.N))
		(!R3 (CHAIR74.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (CHAIR74.SK (PERTAIN-TO ?X_A)))
		(!R6 (CHAIR74.SK CHAIR.N))
	)
	(:GOALS
		(?G1 (ETHAN.NAME (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (ETHAN.NAME (AT.P ?L)))
		(?I2 (CHAIR74.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:EPISODE-RELATIONS
		(!W1 (E76.SK (AT-ABOUT ?X_E)))
		(!W2 (E76.SK (BEFORE NOW15)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.2920918 2)
("Ethan sat in a chair." "The chair was old." "The chair broke."
 "Ethan fell on the ground." "He decided to buy a new one.")
(EPI-SCHEMA ((ETHAN.NAME
              (SOMETIMES.ADV
               ((ADV-A (IN.P CHAIR74.SK))
                ((ADV-A (ON.P CHAIR74.SK)) SIT.38.V))))
             ** E76.SK)
	(:ROLES
		(!R1 (CHAIR74.SK INANIMATE_OBJECT.N))
		(!R2 (CHAIR74.SK FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (ETHAN.NAME AGENT.N))
		(!R5 (CHAIR74.SK BRIDGE.N))
		(!R6 (CHAIR74.SK CHAIR.N))
		(!R7 (CHAIR74.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (ETHAN.NAME (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (ETHAN.NAME (AT.P ?L)))
		(?I2 (CHAIR74.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:EPISODE-RELATIONS
		(!W1 (E76.SK (AT-ABOUT ?X_D)))
		(!W2 (E76.SK (BEFORE NOW15)))
	)
	(:CERTAINTIES
		(!C1 (!R7 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R2 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R5 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R7 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R6 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.2920918 3)
("Ethan sat in a chair." "The chair was old." "The chair broke."
 "Ethan fell on the ground." "He decided to buy a new one.")
(EPI-SCHEMA ((ETHAN.NAME
              ((ADV-A (BY.P ETHAN.NAME))
               (DOWN.ADV
                ((ADV-A (IN.P CHAIR74.SK))
                 ((ADV-A (ON.P CHAIR74.SK)) SIT.39.V)))))
             ** E76.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (CHAIR74.SK INANIMATE_OBJECT.N))
		(!R3 (CHAIR74.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (ETHAN.NAME MAN.N))
		(!R6 (?X_A (PERTAIN-TO ETHAN.NAME)))
		(!R7 (?X_A LUNCH.N))
		(!R8 (CHAIR74.SK CAFETERIA.N))
		(!R9 (CHAIR74.SK CHAIR.N))
		(!R10 (CHAIR74.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (ETHAN.NAME (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (ETHAN.NAME (AT.P ?L)))
		(?I2 (CHAIR74.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:EPISODE-RELATIONS
		(!W1 (E76.SK (BEFORE ?X_E)))
		(!W2 (E76.SK (BEFORE NOW15)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R3 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R10 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R9 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.2920918 2)
("Ethan sat in a chair." "The chair was old." "The chair broke."
 "Ethan fell on the ground." "He decided to buy a new one.")
(EPI-SCHEMA ((ETHAN.NAME
              ((ADV-A (ON.P CHAIR74.SK)) ((ADV-A (IN.P CHAIR74.SK)) SIT.40.V)))
             ** E76.SK)
	(:ROLES
		(!R1 (CHAIR74.SK INANIMATE_OBJECT.N))
		(!R2 (CHAIR74.SK FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (CHAIR74.SK HOUSE.N))
		(!R5 (ETHAN.NAME AGENT.N))
		(!R6 (CHAIR74.SK CHAIR.N))
		(!R7 (CHAIR74.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (ETHAN.NAME (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (ETHAN.NAME (AT.P ?L)))
		(?I2 (CHAIR74.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:EPISODE-RELATIONS
		(!W1 (E76.SK (BEFORE ?X_D)))
		(!W2 (E76.SK (BEFORE NOW15)))
	)
	(:CERTAINTIES
		(!C1 (!R7 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R2 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R4 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R7 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R6 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 4:
	; "Lucy went for a walk."
	; "She saw a squirrel."
	; "Then she looked again."
	; "It wasn't a squirrel."
	; "It was a chipmunk."
discarding schema GO.30.V learned from this story
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.539.V
; GO.1083.V
; GO.100.V
(setf matches (append matches '(( (1.53125 1)
("Lucy went for a walk." "She saw a squirrel." "Then she looked again."
 "It wasn't a squirrel." "It was a chipmunk.")
(EPI-SCHEMA ((LUCY.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.41.V
              (KA ((THERE.ADV SEE.V) SQUIRREL100.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) SQUIRREL100.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (LUCY.NAME AGENT.N))
		(!R4 (SQUIRREL100.SK SQUIRREL.N))
	)
	(:GOALS
		(?G1 (LUCY.NAME (WANT.V (THAT (NOT (LUCY.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (LUCY.NAME (THERE.ADV SEE.V) SQUIRREL100.SK)) CAUSE-OF
    (KE (LUCY.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E104.SK (LUCY.NAME (THERE.ADV (THERE.ADV SEE.V)) SQUIRREL100.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E104.SK))
		(!W2 (E104.SK (BEFORE ?X_D)))
		(!W3 (E104.SK (BEFORE NOW21)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 1)
("Lucy went for a walk." "She saw a squirrel." "Then she looked again."
 "It wasn't a squirrel." "It was a chipmunk.")
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_A)) LOOK.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.46.V)))
              ?L2)
             ** E98.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A (PLUR CLOTHE.N)))
		(!R6 (LUCY.NAME MAN.N))
		(!R7 (?X_B (PERTAIN-TO LUCY.NAME)))
		(!R8 (?X_B WIFE.N))
		(!R9 (WALK96.SK WALK.N))
	)
	(:GOALS
		(?G1 (LUCY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LUCY.NAME (AT.P ?L1)))
		(?I2 (NOT (LUCY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (LUCY.NAME (AT.P ?L1))))
		(?P2 (LUCY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E98.SK))
		(!W2 (?I2 BEFORE E98.SK))
		(!W3 (?P1 AFTER E98.SK))
		(!W4 (?P2 AFTER E98.SK))
		(!W5 (?G1 CAUSE-OF E98.SK))
		(!W6 (E98.SK (BEFORE ?X_E)))
		(!W7 (E98.SK (BEFORE NOW20)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("Lucy went for a walk." "She saw a squirrel." "Then she looked again."
 "It wasn't a squirrel." "It was a chipmunk.")
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (ON.P FRIDAY.NAME)) VISIT.V) ?X_A)))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.47.V)))
              ?L2)
             ** E98.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (LUCY.NAME AGENT.N))
		(!R5 (?X_A FARM.N))
		(!R6 (WALK96.SK WALK.N))
	)
	(:GOALS
		(?G1 (LUCY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LUCY.NAME (AT.P ?L1)))
		(?I2 (NOT (LUCY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (LUCY.NAME (AT.P ?L1))))
		(?P2 (LUCY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E98.SK))
		(!W2 (?I2 BEFORE E98.SK))
		(!W3 (?P1 AFTER E98.SK))
		(!W4 (?P2 AFTER E98.SK))
		(!W5 (?G1 CAUSE-OF E98.SK))
		(!W6 (E98.SK (BEFORE ?X_D)))
		(!W7 (E98.SK (BEFORE NOW20)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 5:
	; "Yesterday I got a kindle book."
	; "It was great."
	; "I liked the book a lot."
	; "I read it in two days."
	; "It was impressive."
discarding schema GET.37.V learned from this story
; best schemas are:
; RUN.401.V
; FLY.235.V
; GET.1260.V
; GET.88.V
; GIVE.194.V
(setf matches (append matches '(( (2.7278125 0)
("Yesterday I got a kindle book." "It was great." "I liked the book a lot."
 "I read it in two days." "It was impressive.")
(EPI-SCHEMA ((ME124.SK GET.50.V
              (KA
               ((ADV-A
                 (WITH.P
                  (K
                   (L #:G1792470
                    (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
                (BE.PASV CATCH.V)))
              (AT.P-ARG ?L))
             ** E116.SK)
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
    (ME124.SK =
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_C (TOO.ADV MANY.A)) (?X_D FISH.N))))))
       (BE.PASV CATCH.V))))))
		(!R4 (ME124.SK MAN.N))
		(!R5 (?X_E LIMIT.N))
		(!R6 (?X_E (PERTAIN-TO ME124.SK)))
		(!R7 (BOOK115.SK KINDLE.A))
		(!R8 (BOOK115.SK BOOK.N))
		(!R9 (ME124.SK AGENT.N))
	)
	(:GOALS
		(?G1
   (ME124.SK
    (WANT.V
     (THAT
      (ME124.SK
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
    (ME124.SK HAVE.V
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_H (TOO.ADV MANY.A)) (?X_I FISH.N))))))
       (BE.PASV CATCH.V))))))
		(?I2 (ME124.SK (AT.P ?L)))
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
   (ME124.SK HAVE.V
    (KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_M (TOO.ADV MANY.A)) (?X_N FISH.N))))))
      (BE.PASV CATCH.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E116.SK))
		(!W2 (?I1 PRECOND-OF E116.SK))
		(!W3 (?I2 PRECOND-OF E116.SK))
		(!W4 (?I3 PRECOND-OF E116.SK))
		(!W5 (?P1 POSTCOND-OF E116.SK))
		(!W6 (E116.SK (BEFORE ?X_P)))
		(!W7 (E116.SK (BEFORE NOW25)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4231253 3)
("Yesterday I got a kindle book." "It was great." "I liked the book a lot."
 "I read it in two days." "It was impressive.")
(EPI-SCHEMA ((ME124.SK GET.51.V BOOK115.SK (AT.P-ARG ?L)) ** E116.SK)
	(:ROLES
		(!R1 (BOOK115.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME124.SK = BOOK115.SK)))
		(!R4 (BOOK115.SK CAT.N))
		(!R5 (?X_H (RIGHT-AFTER ?X_A)))
		(!R6 (ME124.SK WIFE.N))
		(!R7 (?X_B CAT.N))
		(!R8 (ME124.SK (PERTAIN-TO ?X_C)))
		(!R9 (?G1 (RIGHT-AFTER ?X_D)))
		(!R10 (BOOK115.SK KINDLE.A))
		(!R11 (BOOK115.SK BOOK.N))
		(!R12 (ME124.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME124.SK (WANT.V (THAT (ME124.SK (HAVE.V BOOK115.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME124.SK HAVE.V BOOK115.SK)))
		(?I2 (ME124.SK (AT.P ?L)))
		(?I3 (BOOK115.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME124.SK HAVE.V BOOK115.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E116.SK))
		(!W2 (?I1 PRECOND-OF E116.SK))
		(!W3 (?I2 PRECOND-OF E116.SK))
		(!W4 (?I3 PRECOND-OF E116.SK))
		(!W5 (?P1 POSTCOND-OF E116.SK))
		(!W6 (E116.SK (BEFORE ?X_I)))
		(!W7 (?X_H (SAME-TIME ?X_I)))
		(!W8 (?G1 (SAME-TIME ?X_L)))
		(!W9 (?X_K (AT-ABOUT ?X_L)))
		(!W10 (E116.SK (BEFORE NOW25)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 6:
	; "The orange fell from the tree."
	; "It hit a girl on the head."
	; "The girl looked up at the tree."
	; "Another orange fell from the tree."
	; "That orange broke her nose."
; best schemas are:
; BUMP.400.V
; RUN.401.V
; CLIMB_GET_EAT.349.PR
; GO.658.V
; GO.6.V
; GO_FIND_EAT.566.PR

; story 7:
	; "I needed a to write a song."
	; "I had nothing to write with."
	; "I looked in my desk for a pen."
	; "I only saw a pen cap."
	; "I threw the pen cap away."
; best schemas are:
; GIVE.194.V
; TAKE.413.V
; GO.1083.V
; FLY.235.V
; COME.605.V
; TAKE.255.V

; story 8:
	; "The hedge started to grow."
	; "Spring came around."
	; "The hedge started to bud flowers."
	; "The flowers grew."
	; "The roses were very beautiful."
; best schemas are:
; COME.917.V
; COME.917.V
; COME.917.V
; FIND.518.V
; SIT.211.V
; SIT.505.V

; story 9:
	; "I went to the store yesterday."
	; "I tried some things on."
	; "I liked them but they were too expensive."
	; "I couldn't buy them."
	; "So I put them back."
discarding schema GO.90.V learned from this story
; best schemas are:
; GO.591.V
; FLY.235.V
; GO.828.V
; GO.278.V
; GO.650.V
(setf matches (append matches '(( (4.227813 4)
("I went to the store yesterday." "I tried some things on."
 "I liked them but they were too expensive." "I couldn't buy them."
 "So I put them back.")
(EPI-SCHEMA ((ME213.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE204.SK)) ((ADV-A (FROM.P ?L1)) GO.140.V)))
              STORE204.SK)
             ** E205.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE204.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE204.SK)))
		(!R4 (ME213.SK CAT.N))
		(!R5 (ME213.SK NEW.A))
		(!R6 (STORE204.SK ((NN PET.N) STORE.N)))
		(!R7 (?X_A CAT.N))
		(!R8 (?X_A NICE.A))
		(!R9 (?X_A (PERTAIN-TO ME213.SK)))
		(!R10 (ME213.SK AGENT.N))
		(!R11 (STORE204.SK STORE.N))
	)
	(:GOALS
		(?G1 (ME213.SK (WANT.V (KA ((ADV-A (AT.P STORE204.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME213.SK (AT.P ?L1)))
		(?I2 (NOT (ME213.SK (AT.P STORE204.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME213.SK (AT.P ?L1))))
		(?P2 (ME213.SK (AT.P STORE204.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E205.SK))
		(!W2 (?I2 BEFORE E205.SK))
		(!W3 (?P1 AFTER E205.SK))
		(!W4 (?P2 AFTER E205.SK))
		(!W5 (?G1 CAUSE-OF E205.SK))
		(!W6 (E205.SK (BEFORE ?X_E)))
		(!W7 (E205.SK (BEFORE NOW45)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.1834373 3)
("I went to the store yesterday." "I tried some things on."
 "I liked them but they were too expensive." "I couldn't buy them."
 "So I put them back.")
(EPI-SCHEMA ((ME213.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P STORE204.SK)) (AWAY.ADV FLY.141.V))))
              STORE204.SK)
             ** E205.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE204.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE204.SK)))
		(!R4 (ME213.SK ((NN MOTHER.N) BIRD.N)))
		(!R5 (ME213.SK BIRD.N))
		(!R6 (ME213.SK ((NN BABY.N) BIRD.N)))
		(!R7 (ME213.SK AGENT.N))
		(!R8 (STORE204.SK STORE.N))
	)
	(:GOALS
		(?G1 (ME213.SK (WANT.V (KA ((ADV-A (AT.P STORE204.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME213.SK (AT.P ?L1)))
		(?I2 (NOT (ME213.SK (AT.P STORE204.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME213.SK (AT.P ?L1))))
		(?P2 (ME213.SK (AT.P STORE204.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E205.SK))
		(!W2 (?I2 BEFORE E205.SK))
		(!W3 (?P1 AFTER E205.SK))
		(!W4 (?P2 AFTER E205.SK))
		(!W5 (?G1 CAUSE-OF E205.SK))
		(!W6 (E205.SK (BEFORE ?X_C)))
		(!W7 (E205.SK (BEFORE NOW45)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 4)
("I went to the store yesterday." "I tried some things on."
 "I liked them but they were too expensive." "I couldn't buy them."
 "So I put them back.")
(EPI-SCHEMA ((ME213.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE204.SK)) ((ADV-A (FROM.P ?L1)) GO.142.V)))
              STORE204.SK)
             ** E205.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE204.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE204.SK)))
		(!R4 (STORE204.SK MALL.N))
		(!R5 (ME213.SK AGENT.N))
		(!R6 (STORE204.SK STORE.N))
	)
	(:GOALS
		(?G1 (ME213.SK (WANT.V (KA ((ADV-A (AT.P STORE204.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME213.SK (AT.P ?L1)))
		(?I2 (NOT (ME213.SK (AT.P STORE204.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME213.SK (AT.P ?L1))))
		(?P2 (ME213.SK (AT.P STORE204.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E205.SK))
		(!W2 (?I2 BEFORE E205.SK))
		(!W3 (?P1 AFTER E205.SK))
		(!W4 (?P2 AFTER E205.SK))
		(!W5 (?G1 CAUSE-OF E205.SK))
		(!W6 (E205.SK (BEFORE ?X_D)))
		(!W7 (E205.SK (BEFORE NOW45)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 3)
("I went to the store yesterday." "I tried some things on."
 "I liked them but they were too expensive." "I couldn't buy them."
 "So I put them back.")
(EPI-SCHEMA ((ME213.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE204.SK)) ((ADV-A (FROM.P ?L1)) GO.143.V)))
              STORE204.SK)
             ** E205.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE204.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE204.SK)))
		(!R4 (?X_A PET.N))
		(!R5 (STORE204.SK ((NN PET.N) STORE.N)))
		(!R6 (ME213.SK AGENT.N))
		(!R7 (STORE204.SK STORE.N))
	)
	(:GOALS
		(?G1 (ME213.SK (WANT.V (KA ((ADV-A (AT.P STORE204.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME213.SK (AT.P ?L1)))
		(?I2 (NOT (ME213.SK (AT.P STORE204.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME213.SK (AT.P ?L1))))
		(?P2 (ME213.SK (AT.P STORE204.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E205.SK))
		(!W2 (?I2 BEFORE E205.SK))
		(!W3 (?P1 AFTER E205.SK))
		(!W4 (?P2 AFTER E205.SK))
		(!W5 (?G1 CAUSE-OF E205.SK))
		(!W6 (?G1 (BEFORE ?X_E)))
		(!W7 (E205.SK (BEFORE ?X_G)))
		(!W8 (E205.SK (BEFORE NOW45)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 3)
("I went to the store yesterday." "I tried some things on."
 "I liked them but they were too expensive." "I couldn't buy them."
 "So I put them back.")
(EPI-SCHEMA ((ME213.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE204.SK)) ((ADV-A (FROM.P ?L1)) GO.144.V)))
              STORE204.SK)
             ** E205.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE204.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE204.SK)))
		(!R4 (?X_B (PERTAIN-TO ME213.SK)))
		(!R5 (?X_B FATHER.N))
		(!R6 (?X_A (PERTAIN-TO ?X_B)))
		(!R7 (ME213.SK AGENT.N))
		(!R8 (STORE204.SK STORE.N))
	)
	(:GOALS
		(?G1 (ME213.SK (WANT.V (KA ((ADV-A (AT.P STORE204.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME213.SK (AT.P ?L1)))
		(?I2 (NOT (ME213.SK (AT.P STORE204.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME213.SK (AT.P ?L1))))
		(?P2 (ME213.SK (AT.P STORE204.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E205.SK))
		(!W2 (?I2 BEFORE E205.SK))
		(!W3 (?P1 AFTER E205.SK))
		(!W4 (?P2 AFTER E205.SK))
		(!W5 (?G1 CAUSE-OF E205.SK))
		(!W6 (?G1 (BEFORE ?X_F)))
		(!W7 (E205.SK (BEFORE ?X_H)))
		(!W8 (E205.SK (BEFORE NOW45)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 10:
	; "The man told a story."
	; "The boy liked it."
	; "The boy asked to hear it again."
	; "The man refused."
	; "The boy tried to read the story by himself."
; best schemas are:
; GO.423.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.626.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.627.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.662.V
; MOVE.342.V
; MOVE.501.V
(setf matches (append matches '(( (1.93625 1)
("The man told a story." "The boy liked it." "The boy asked to hear it again."
 "The man refused." "The boy tried to read the story by himself.")
(EPI-SCHEMA ((MAN216.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.149.V (KA ANSWER.V))
             ** ?E)
	(:ROLES
		(!R1 (MAN216.SK AGENT.N))
		(!R2 ((KA ANSWER.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (STORY218.SK STORY.N))
		(!R5 (MAN216.SK MAN.N))
		(!R6 (E215.SK (RIGHT-AFTER U49)))
	)
	(:GOALS
		(?G1 (MAN216.SK (WANT.V (THAT (NOT (MAN216.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1 ((KE (MAN216.SK ANSWER.V)) CAUSE-OF (KE (MAN216.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E215.SK (MAN216.SK ANSWER.V))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E215.SK))
		(!W2 (E215.SK (BEFORE ?X_C)))
		(!W3 (E215.SK (SAME-TIME NOW50)))
		(!W4 (E219.SK (BEFORE NOW50)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.93625 1)
("The man told a story." "The boy liked it." "The boy asked to hear it again."
 "The man refused." "The boy tried to read the story by himself.")
(EPI-SCHEMA ((MAN216.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.150.V (KA ANSWER.V))
             ** ?E)
	(:ROLES
		(!R1 (MAN216.SK AGENT.N))
		(!R2 ((KA ANSWER.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (MAN216.SK MAN.N))
		(!R5 (STORY218.SK STORY.N))
		(!R6 (E215.SK (RIGHT-AFTER U49)))
	)
	(:GOALS
		(?G1 (MAN216.SK (WANT.V (THAT (NOT (MAN216.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1 ((KE (MAN216.SK ANSWER.V)) CAUSE-OF (KE (MAN216.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E219.SK (MAN216.SK ANSWER.V))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E219.SK))
		(!W2 (E219.SK (BEFORE ?X_C)))
		(!W3 (E219.SK (BEFORE NOW50)))
		(!W4 (E215.SK (SAME-TIME NOW50)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.405 5)
("The man told a story." "The boy liked it." "The boy asked to hear it again."
 "The man refused." "The boy tried to read the story by himself.")
(EPI-SCHEMA ((MAN216.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORY218.SK)) TELL.153.V))
              STORY218.SK)
             ** E215.SK)
	(:ROLES
		(!R1 (MAN216.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORY218.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORY218.SK)))
		(!R5 (STORY218.SK CITY.N))
		(!R6 (STORY218.SK NEW.A))
		(!R7 (STORY218.SK STORY.N))
		(!R8 (MAN216.SK MAN.N))
		(!R9 (E215.SK (RIGHT-AFTER U49)))
	)
	(:GOALS
		(?G1 (MAN216.SK (WANT.V (KA ((ADV-A (AT.P STORY218.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN216.SK (AT.P ?L1)))
		(?I2 (NOT (MAN216.SK (AT.P STORY218.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN216.SK (AT.P ?L1))))
		(?P2 (MAN216.SK (AT.P STORY218.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E215.SK))
		(!W2 (?I2 BEFORE E215.SK))
		(!W3 (?P1 AFTER E215.SK))
		(!W4 (?P2 AFTER E215.SK))
		(!W5 (?G1 CAUSE-OF E215.SK))
		(!W6 (E215.SK (BEFORE ?X_D)))
		(!W7 (E215.SK (SAME-TIME NOW50)))
		(!W8 (E219.SK (BEFORE NOW50)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.405 5)
("The man told a story." "The boy liked it." "The boy asked to hear it again."
 "The man refused." "The boy tried to read the story by himself.")
(EPI-SCHEMA ((MAN216.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORY218.SK)) TELL.154.V))
              STORY218.SK)
             ** E215.SK)
	(:ROLES
		(!R1 (MAN216.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORY218.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORY218.SK)))
		(!R5 (STORY218.SK TOWN.N))
		(!R6 (STORY218.SK NEW.A))
		(!R7 (STORY218.SK STORY.N))
		(!R8 (MAN216.SK MAN.N))
		(!R9 (E215.SK (RIGHT-AFTER U49)))
	)
	(:GOALS
		(?G1 (MAN216.SK (WANT.V (KA ((ADV-A (AT.P STORY218.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN216.SK (AT.P ?L1)))
		(?I2 (NOT (MAN216.SK (AT.P STORY218.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN216.SK (AT.P ?L1))))
		(?P2 (MAN216.SK (AT.P STORY218.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E215.SK))
		(!W2 (?I2 BEFORE E215.SK))
		(!W3 (?P1 AFTER E215.SK))
		(!W4 (?P2 AFTER E215.SK))
		(!W5 (?G1 CAUSE-OF E215.SK))
		(!W6 (E215.SK (BEFORE ?X_D)))
		(!W7 (E215.SK (SAME-TIME NOW50)))
		(!W8 (E219.SK (BEFORE NOW50)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 11:
	; "I went to visit a farm on Friday."
	; "It was a long drive to get there."
	; "They had a lot of animals."
	; "I got to pet the cow."
	; "It was a very fun day."
; best schemas are:
; TAKE.10.V
; TAKE.413.V
; TAKE.1270.V
; TAKE.1391.V
; GIVE.194.V
; GO.591.V
(setf matches (append matches '(( (2.7278125 1)
("I went to visit a farm on Friday." "It was a long drive to get there."
 "They had a lot of animals." "I got to pet the cow." "It was a very fun day.")
(EPI-SCHEMA ((ME257.SK
              ((ADV-A
                (FOR.P (KA ((ADV-A (ON.P FRIDAY.NAME)) VISIT.V) FARM240.SK)))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.160.V)))
              ?X_C)
             ** E241.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (?L1 = ?X_C)))
		(!R4 (ME257.SK CAT.N))
		(!R5 (ME257.SK NEW.A))
		(!R6 (?X_C ((NN PET.N) STORE.N)))
		(!R7 (?X_A CAT.N))
		(!R8 (?X_A NICE.A))
		(!R9 (?X_A (PERTAIN-TO ME257.SK)))
		(!R10 (ME257.SK AGENT.N))
		(!R11 (FARM240.SK FARM.N))
	)
	(:GOALS
		(?G1 (ME257.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME257.SK (AT.P ?L1)))
		(?I2 (NOT (ME257.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME257.SK (AT.P ?L1))))
		(?P2 (ME257.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E241.SK))
		(!W2 (?I2 BEFORE E241.SK))
		(!W3 (?P1 AFTER E241.SK))
		(!W4 (?P2 AFTER E241.SK))
		(!W5 (?G1 CAUSE-OF E241.SK))
		(!W6 (E241.SK (BEFORE ?X_E)))
		(!W7 (E241.SK (BEFORE NOW55)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 12:
	; "Kate felt something run across her foot."
	; "It was a giant spider!"
	; "She swatted it away."
	; "It ran under her bed."
	; "She could not sleep that night."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; SIT.211.V
; SIT.505.V
; SIT.49.V
; SIT.65.V
; SIT.274.V

; story 13:
	; "Devin got fed up with his bank."
	; "He called them for help."
	; "They didn't respond."
	; "He took his money out."
	; "He found a new bank."
discarding schema GET.104.V learned from this story
discarding schema FIND.129.V learned from this story
; best schemas are:
; RUN.401.V
; GET.518.V
; GET.826.V
; GET.848.V
(setf matches (append matches '(( (4.5 6)
("Devin got fed up with his bank." "He called them for help."
 "They didn't respond." "He took his money out." "He found a new bank.")
(EPI-SCHEMA ((DEVIN.NAME GET.208.V
              (KA ((ADV-A (WITH.P DEVIN.NAME)) (BE.PASV FED_UP.V)))
              (AT.P-ARG ?L))
             ** E283.SK)
	(:ROLES
		(!R1 (DEVIN.NAME AGENT.N))
		(!R2
   ((KA ((ADV-A (WITH.P DEVIN.NAME)) (BE.PASV FED_UP.V))) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4
   (NOT (DEVIN.NAME = (KA ((ADV-A (WITH.P DEVIN.NAME)) (BE.PASV FED_UP.V))))))
		(!R5 ((KA ((ADV-A (WITH.P DEVIN.NAME)) (BE.PASV FED_UP.V))) DOG.N))
		(!R6 ((KA ((ADV-A (WITH.P DEVIN.NAME)) (BE.PASV FED_UP.V))) NEW.A))
		(!R7 (DEVIN.NAME DOG.N))
		(!R8 (?X_B (WALK.V DEVIN.NAME)))
		(!R9 (?X_B EVENING.N))
		(!R10 (DEVIN.NAME (PERTAIN-TO DEVIN.NAME)))
		(!R11 (DEVIN.NAME BANK.N))
		(!R12 (DEVIN.NAME MONEY.N))
		(!R13 (DEVIN.NAME (PERTAIN-TO HE.PRO)))
		(!R14 (HE.PRO MALE.A))
		(!R15 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1
   (DEVIN.NAME
    (WANT.V
     (THAT
      (DEVIN.NAME
       (HAVE.V (KA ((ADV-A (WITH.P DEVIN.NAME)) (BE.PASV FED_UP.V)))))))))
	)
	(:PRECONDS
		(?I1
   (NOT
    (DEVIN.NAME HAVE.V (KA ((ADV-A (WITH.P DEVIN.NAME)) (BE.PASV FED_UP.V))))))
		(?I2 (DEVIN.NAME (AT.P ?L)))
		(?I3 ((KA ((ADV-A (WITH.P DEVIN.NAME)) (BE.PASV FED_UP.V))) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1
   (DEVIN.NAME HAVE.V (KA ((ADV-A (WITH.P DEVIN.NAME)) (BE.PASV FED_UP.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E283.SK))
		(!W2 (?I1 PRECOND-OF E283.SK))
		(!W3 (?I2 PRECOND-OF E283.SK))
		(!W4 (?I3 PRECOND-OF E283.SK))
		(!W5 (?P1 POSTCOND-OF E283.SK))
		(!W6 (E283.SK (AT-ABOUT ?X_F)))
		(!W7 (E283.SK (BEFORE NOW65)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 14:
	; "The rose bush bloomed."
	; "The man cut a rose."
	; "He gave it to the woman."
	; "The woman got mad."
	; "She did not like her roses cut."
; best schemas are:
; THANK.603.V
; FEED.288.V
; GO.642.V
; GIVE.V
; TAKE.1.V
; TAKE.10.V

; story 15:
	; "Emmy lived on a farm."
	; "She stayed in a pen with her brother."
	; "One day a man came and saw Emmy."
	; "He took her home."
	; "They are very happy together."
discarding schema TAKE.135.V learned from this story
; best schemas are:
; TAKE.10.V
; GO.212.V
; GO.401.V
; TAKE.1.V
; TAKE.885.V
(setf matches (append matches '(( (6.100312 9)
("Emmy lived on a farm." "She stayed in a pen with her brother."
 "One day a man came and saw Emmy." "He took her home."
 "They are very happy together.")
(EPI-SCHEMA ((MAN341.SK TAKE.223.V EMMY.NAME (AT.P-ARG FARM329.SK)) ** E344.SK)
	(:ROLES
		(!R1 (MAN341.SK AGENT.N))
		(!R2 (EMMY.NAME INANIMATE_OBJECT.N))
		(!R3 (FARM329.SK LOCATION.N))
		(!R4 (NOT (MAN341.SK = EMMY.NAME)))
		(!R5 (EMMY.NAME (PERTAIN-TO EMMY.NAME)))
		(!R6 (EMMY.NAME BROTHER.N))
		(!R7 (EMMY.NAME WATCH.N))
		(!R8 (EMMY.NAME (PERTAIN-TO MAN341.SK)))
		(!R9 (BROTHER336.SK (PERTAIN-TO EMMY.NAME)))
		(!R10 (BROTHER336.SK BROTHER.N))
		(!R11 (FARM329.SK FARM.N))
		(!R12 (DAY342.SK DAY.N))
		(!R13 (DAY342.SK (= MAN341.SK)))
		(!R14 (MAN341.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN341.SK (WANT.V (THAT (MAN341.SK (HAVE.V EMMY.NAME))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN341.SK HAVE.V EMMY.NAME)))
		(?I2 (MAN341.SK (AT.P FARM329.SK)))
		(?I3 (EMMY.NAME (AT.P FARM329.SK)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN341.SK HAVE.V EMMY.NAME))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E344.SK))
		(!W2 (?I1 PRECOND-OF E344.SK))
		(!W3 (?I2 PRECOND-OF E344.SK))
		(!W4 (?I3 PRECOND-OF E344.SK))
		(!W5 (?P1 POSTCOND-OF E344.SK))
		(!W6 (E344.SK (BEFORE ?X_G)))
		(!W7 (E344.SK (BEFORE ?X_F)))
		(!W8 (E344.SK (BEFORE NOW78)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.600312 7)
("Emmy lived on a farm." "She stayed in a pen with her brother."
 "One day a man came and saw Emmy." "He took her home."
 "They are very happy together.")
(EPI-SCHEMA ((MAN341.SK TAKE.262.V EMMY.NAME (AT.P-ARG FARM329.SK)) ** E344.SK)
	(:ROLES
		(!R1 (MAN341.SK AGENT.N))
		(!R2 (EMMY.NAME INANIMATE_OBJECT.N))
		(!R3 (FARM329.SK LOCATION.N))
		(!R4 (NOT (MAN341.SK = EMMY.NAME)))
		(!R5 (EMMY.NAME WATCH.N))
		(!R6 (EMMY.NAME (PERTAIN-TO MAN341.SK)))
		(!R7 (MAN341.SK MAN.N))
		(!R8 (BROTHER336.SK (PERTAIN-TO EMMY.NAME)))
		(!R9 (BROTHER336.SK BROTHER.N))
		(!R10 (DAY342.SK (= MAN341.SK)))
		(!R11 (DAY342.SK DAY.N))
		(!R12 (FARM329.SK FARM.N))
	)
	(:GOALS
		(?G1 (MAN341.SK (WANT.V (THAT (MAN341.SK (HAVE.V EMMY.NAME))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN341.SK HAVE.V EMMY.NAME)))
		(?I2 (MAN341.SK (AT.P FARM329.SK)))
		(?I3 (EMMY.NAME (AT.P FARM329.SK)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN341.SK HAVE.V EMMY.NAME))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E344.SK))
		(!W2 (?I1 PRECOND-OF E344.SK))
		(!W3 (?I2 PRECOND-OF E344.SK))
		(!W4 (?I3 PRECOND-OF E344.SK))
		(!W5 (?P1 POSTCOND-OF E344.SK))
		(!W6 (E344.SK (BEFORE ?X_D)))
		(!W7 (E344.SK (BEFORE NOW78)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.600312 6)
("Emmy lived on a farm." "She stayed in a pen with her brother."
 "One day a man came and saw Emmy." "He took her home."
 "They are very happy together.")
(EPI-SCHEMA ((MAN341.SK ((ADV-A (TO.P ?X_A)) TAKE.263.V) EMMY.NAME
              (AT.P-ARG FARM329.SK))
             ** E344.SK)
	(:ROLES
		(!R1 (MAN341.SK AGENT.N))
		(!R2 (EMMY.NAME INANIMATE_OBJECT.N))
		(!R3 (FARM329.SK LOCATION.N))
		(!R4 (NOT (MAN341.SK = EMMY.NAME)))
		(!R5 (?X_A VET.N))
		(!R6 (EMMY.NAME CAT.N))
		(!R7 (MAN341.SK MAN.N))
		(!R8 (BROTHER336.SK (PERTAIN-TO EMMY.NAME)))
		(!R9 (BROTHER336.SK BROTHER.N))
		(!R10 (DAY342.SK (= MAN341.SK)))
		(!R11 (DAY342.SK DAY.N))
		(!R12 (FARM329.SK FARM.N))
	)
	(:GOALS
		(?G1 (MAN341.SK (WANT.V (THAT (MAN341.SK (HAVE.V EMMY.NAME))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN341.SK HAVE.V EMMY.NAME)))
		(?I2 (MAN341.SK (AT.P FARM329.SK)))
		(?I3 (EMMY.NAME (AT.P FARM329.SK)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN341.SK HAVE.V EMMY.NAME))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E344.SK))
		(!W2 (?I1 PRECOND-OF E344.SK))
		(!W3 (?I2 PRECOND-OF E344.SK))
		(!W4 (?I3 PRECOND-OF E344.SK))
		(!W5 (?P1 POSTCOND-OF E344.SK))
		(!W6 (E344.SK (BEFORE ?X_E)))
		(!W7 (E344.SK (BEFORE NOW78)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 16:
	; "I was in high school."
	; "I went to a park with a friend."
	; "I lost my friend."
	; "I was late for my curfew."
	; "I got in trouble."
discarding schema GO.168.V learned from this story
; best schemas are:
; GO.212.V
; GO.658.V
; TAKE.413.V
; COME.126.V
; COME.605.V
(setf matches (append matches '(( (3.9580421 2)
("I was in high school." "I went to a park with a friend." "I lost my friend."
 "I was late for my curfew." "I got in trouble.")
(EPI-SCHEMA ((ME364.SK
              ((ADV-A (WITH.P FRIEND350.SK))
               ((ADV-A (TO.P PARK349.SK)) ((ADV-A (FROM.P ?L1)) GO.264.V)))
              PARK349.SK)
             ** E354.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (PARK349.SK LOCATION.N))
		(!R3 (NOT (?L1 = PARK349.SK)))
		(!R4 (?X_A (PLUR PERSON.N)))
		(!R5 (ME364.SK MAN.N))
		(!R6 (?X_A WOMAN.N))
		(!R7 (ME364.SK AGENT.N))
		(!R8 (PARK349.SK PARK.N))
		(!R9 (FRIEND350.SK FRIEND.N))
		(!R10 (FRIEND358.SK (PERTAIN-TO ME364.SK)))
		(!R11 (FRIEND358.SK FRIEND.N))
		(!R12 (CURFEW362.SK (PERTAIN-TO ME364.SK)))
		(!R13 (CURFEW362.SK CURFEW.N))
	)
	(:GOALS
		(?G1 (ME364.SK (WANT.V (KA ((ADV-A (AT.P PARK349.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME364.SK (AT.P ?L1)))
		(?I2 (NOT (ME364.SK (AT.P PARK349.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME364.SK (AT.P ?L1))))
		(?P2 (ME364.SK (AT.P PARK349.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E354.SK))
		(!W2 (?I2 BEFORE E354.SK))
		(!W3 (?P1 AFTER E354.SK))
		(!W4 (?P2 AFTER E354.SK))
		(!W5 (?G1 CAUSE-OF E354.SK))
		(!W6 (E354.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E354.SK (BEFORE NOW81)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.458042 4)
("I was in high school." "I went to a park with a friend." "I lost my friend."
 "I was late for my curfew." "I got in trouble.")
(EPI-SCHEMA ((ME364.SK
              ((ADV-A (WITH.P FRIEND350.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P PARK349.SK))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FRIEND350.SK)) PLAY.V))))
                  GO.265.V))))
              PARK349.SK)
             ** E354.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (PARK349.SK LOCATION.N))
		(!R3 (NOT (?L1 = PARK349.SK)))
		(!R4 (FRIEND350.SK (PLUR FRIEND.N)))
		(!R5 (FRIEND350.SK HOME.N))
		(!R6 (FRIEND350.SK (PERTAIN-TO ME364.SK)))
		(!R7 (ME364.SK GIRL.N))
		(!R8 (FRIEND350.SK (PERTAIN-TO ?X_B)))
		(!R9 (ME364.SK AGENT.N))
		(!R10 (PARK349.SK PARK.N))
		(!R11 (FRIEND358.SK (PERTAIN-TO ME364.SK)))
		(!R12 (FRIEND358.SK FRIEND.N))
		(!R13 (CURFEW362.SK (PERTAIN-TO ME364.SK)))
		(!R14 (CURFEW362.SK CURFEW.N))
		(!R15 (FRIEND350.SK FRIEND.N))
	)
	(:GOALS
		(?G1 (ME364.SK (WANT.V (KA ((ADV-A (AT.P PARK349.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME364.SK (AT.P ?L1)))
		(?I2 (NOT (ME364.SK (AT.P PARK349.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME364.SK (AT.P ?L1))))
		(?P2 (ME364.SK (AT.P PARK349.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E354.SK))
		(!W2 (?I2 BEFORE E354.SK))
		(!W3 (?P1 AFTER E354.SK))
		(!W4 (?P2 AFTER E354.SK))
		(!W5 (?G1 CAUSE-OF E354.SK))
		(!W6 (E354.SK (BEFORE ?X_E)))
		(!W7 (E354.SK (BEFORE NOW81)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.458042 5)
("I was in high school." "I went to a park with a friend." "I lost my friend."
 "I was late for my curfew." "I got in trouble.")
(EPI-SCHEMA ((ME364.SK
              ((ADV-A (WITH.P FRIEND350.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P PARK349.SK)) ((ADV-A (BY.P ?X_A)) COME.291.V))))
              PARK349.SK)
             ** E354.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (PARK349.SK LOCATION.N))
		(!R3 (NOT (?L1 = PARK349.SK)))
		(!R4 (ME364.SK FRIEND.N))
		(!R5 (ME364.SK BEST.A))
		(!R6 (?X_A HOUSE.N))
		(!R7 (ME364.SK (PERTAIN-TO ME364.SK)))
		(!R8 (E354.SK (RIGHT-AFTER ?X_B)))
		(!R9 (FRIEND358.SK SON.N))
		(!R10 (PARK349.SK PARK.N))
		(!R11 (FRIEND350.SK FRIEND.N))
		(!R12 (ME364.SK AGENT.N))
		(!R13 (FRIEND358.SK (PERTAIN-TO ME364.SK)))
		(!R14 (FRIEND358.SK FRIEND.N))
		(!R15 (FRIEND358.SK PERSON.N))
		(!R16 (CURFEW362.SK (PERTAIN-TO ME364.SK)))
		(!R17 (CURFEW362.SK CURFEW.N))
	)
	(:GOALS
		(?G1 (ME364.SK (WANT.V (KA ((ADV-A (AT.P PARK349.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME364.SK (AT.P ?L1)))
		(?I2 (NOT (ME364.SK (AT.P PARK349.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME364.SK (AT.P ?L1))))
		(?P2 (ME364.SK (AT.P PARK349.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E354.SK))
		(!W2 (?I2 BEFORE E354.SK))
		(!W3 (?P1 AFTER E354.SK))
		(!W4 (?P2 AFTER E354.SK))
		(!W5 (?G1 CAUSE-OF E354.SK))
		(!W6 (E354.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E354.SK (BEFORE NOW81)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.458042 4)
("I was in high school." "I went to a park with a friend." "I lost my friend."
 "I was late for my curfew." "I got in trouble.")
(EPI-SCHEMA ((ME364.SK
              ((ADV-A (WITH.P FRIEND350.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P PARK349.SK))
                 ((ADV-A (FOR.P (KA VISIT.V))) COME.292.V))))
              PARK349.SK)
             ** E354.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (PARK349.SK LOCATION.N))
		(!R3 (NOT (?L1 = PARK349.SK)))
		(!R4 (E354.SK (RIGHT-AFTER ?X_A)))
		(!R5 (ME364.SK FRIEND.N))
		(!R6 (ME364.SK (PERTAIN-TO ME364.SK)))
		(!R7 (FRIEND358.SK (PLUR BROTHER.N)))
		(!R8 (PARK349.SK PARK.N))
		(!R9 (FRIEND350.SK FRIEND.N))
		(!R10 (ME364.SK AGENT.N))
		(!R11 (FRIEND358.SK (PERTAIN-TO ME364.SK)))
		(!R12 (FRIEND358.SK FRIEND.N))
		(!R13 (CURFEW362.SK (PERTAIN-TO ME364.SK)))
		(!R14 (CURFEW362.SK CURFEW.N))
	)
	(:GOALS
		(?G1 (ME364.SK (WANT.V (KA ((ADV-A (AT.P PARK349.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME364.SK (AT.P ?L1)))
		(?I2 (NOT (ME364.SK (AT.P PARK349.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME364.SK (AT.P ?L1))))
		(?P2 (ME364.SK (AT.P PARK349.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E354.SK))
		(!W2 (?I2 BEFORE E354.SK))
		(!W3 (?P1 AFTER E354.SK))
		(!W4 (?P2 AFTER E354.SK))
		(!W5 (?G1 CAUSE-OF E354.SK))
		(!W6 (E354.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (?G1 (BEFORE ?X_I)))
		(!W9 (E354.SK (BEFORE NOW81)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 17:
	; "Today I saw a baby bird."
	; "The bird was in a tree."
	; "The mother bird was teaching the baby bird."
	; "She dropped the bird out of the nest."
	; "The baby bird flew away."
discarding schema FLY.235.V learned from this story
; best schemas are:
; TAKE.1391.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1029.V
; RUN.350.V
(setf matches (append matches '(( (1.03125 2)
("Today I saw a baby bird." "The bird was in a tree."
 "The mother bird was teaching the baby bird."
 "She dropped the bird out of the nest." "The baby bird flew away.")
(EPI-SCHEMA ((ME.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
              (KA ((THERE.ADV SEE.V) BIRD371.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) BIRD371.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ME.PRO AGENT.N))
		(!R4 (BIRD371.SK ((NN MOTHER.N) BIRD.N)))
		(!R5 (BIRD371.SK BIRD.N))
		(!R6 (BIRD371.SK ((NN BABY.N) BIRD.N)))
	)
	(:GOALS
		(?G1 (ME.PRO (WANT.V (THAT (NOT (ME.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME.PRO (THERE.ADV SEE.V) BIRD371.SK)) CAUSE-OF
    (KE (ME.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E372.SK (ME.PRO (THERE.ADV (THERE.ADV SEE.V)) BIRD371.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E372.SK))
		(!W2 (E372.SK (BEFORE ?X_D)))
		(!W3 (E372.SK (BEFORE NOW85)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 18:
	; "Yesterday I went out to eat."
	; "I ate a lot."
	; "Too much to the point where I was full."
	; "I then fell sick."
	; "It was just too much."
; best schemas are:
; TAKE.302.V
; GO.212.V
; FEED.660.V
; GO.253.V
; GO.658.V
; GO.240.V
(setf matches (append matches '(( (2.7278125 0)
("Yesterday I went out to eat." "I ate a lot."
 "Too much to the point where I was full." "I then fell sick."
 "It was just too much.")
(EPI-SCHEMA ((ME399.SK
              ((ADV-A (FOR.P (KA EAT.V)))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.331.V)))
              ?X_C)
             ** E390.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (?L1 = ?X_C)))
		(!R4 (?X_A (PLUR PERSON.N)))
		(!R5 (ME399.SK MAN.N))
		(!R6 (?X_A WOMAN.N))
		(!R7 (ME399.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME399.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME399.SK (AT.P ?L1)))
		(?I2 (NOT (ME399.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME399.SK (AT.P ?L1))))
		(?P2 (ME399.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E390.SK))
		(!W2 (?I2 BEFORE E390.SK))
		(!W3 (?P1 AFTER E390.SK))
		(!W4 (?P2 AFTER E390.SK))
		(!W5 (?G1 CAUSE-OF E390.SK))
		(!W6 (E390.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E390.SK (BEFORE NOW90)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.8731067 2)
("Yesterday I went out to eat." "I ate a lot."
 "Too much to the point where I was full." "I then fell sick."
 "It was just too much.")
(EPI-SCHEMA ((ME399.SK
              ((ADV-A (FOR.P (KA EAT.V)))
               ((ADV-A (TO.P ?X_F)) ((ADV-A (FROM.P POINT395.SK)) GO.333.V)))
              ?X_F)
             ** E390.SK)
	(:ROLES
		(!R1 (POINT395.SK LOCATION.N))
		(!R2 (?X_F LOCATION.N))
		(!R3 (NOT (POINT395.SK = ?X_F)))
		(!R4 (ME399.SK MAN.N))
		(!R5 (?X_F ((NN MEETING.N) SPOT.N)))
		(!R6 (?X_A DATE.N))
		(!R7 (?X_A (PERTAIN-TO ME399.SK)))
		(!R8 (?X_A BROTHER.N))
		(!R9 (POINT395.SK FARM.N))
		(!R10 (?X_F PEN.N))
		(!R11 (ME399.SK AGENT.N))
		(!R12 (POINT395.SK POINT.N))
	)
	(:GOALS
		(?G1 (ME399.SK (WANT.V (KA ((ADV-A (AT.P ?X_F)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME399.SK (AT.P POINT395.SK)))
		(?I2 (NOT (ME399.SK (AT.P ?X_F))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME399.SK (AT.P POINT395.SK))))
		(?P2 (ME399.SK (AT.P ?X_F)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E390.SK))
		(!W2 (?I2 BEFORE E390.SK))
		(!W3 (?P1 AFTER E390.SK))
		(!W4 (?P2 AFTER E390.SK))
		(!W5 (?G1 CAUSE-OF E390.SK))
		(!W6 (E390.SK (BEFORE ?X_E)))
		(!W7 (E390.SK (BEFORE NOW90)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.8731067 2)
("Yesterday I went out to eat." "I ate a lot."
 "Too much to the point where I was full." "I then fell sick."
 "It was just too much.")
(EPI-SCHEMA ((ME399.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P POINT395.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.334.V)))
              ?L2)
             ** E390.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (POINT395.SK (PLUR FRIEND.N)))
		(!R5 (POINT395.SK HOME.N))
		(!R6 (POINT395.SK (PERTAIN-TO ME399.SK)))
		(!R7 (ME399.SK GIRL.N))
		(!R8 (POINT395.SK (PERTAIN-TO ?X_B)))
		(!R9 (ME399.SK AGENT.N))
		(!R10 (POINT395.SK POINT.N))
	)
	(:GOALS
		(?G1 (ME399.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME399.SK (AT.P ?L1)))
		(?I2 (NOT (ME399.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME399.SK (AT.P ?L1))))
		(?P2 (ME399.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E390.SK))
		(!W2 (?I2 BEFORE E390.SK))
		(!W3 (?P1 AFTER E390.SK))
		(!W4 (?P2 AFTER E390.SK))
		(!W5 (?G1 CAUSE-OF E390.SK))
		(!W6 (E390.SK (BEFORE ?X_E)))
		(!W7 (E390.SK (BEFORE NOW90)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.8731067 2)
("Yesterday I went out to eat." "I ate a lot."
 "Too much to the point where I was full." "I then fell sick."
 "It was just too much.")
(EPI-SCHEMA ((ME399.SK
              ((ADV-A (FOR.P (KA EAT.V)))
               ((ADV-A (TO.P ?X_F)) ((ADV-A (FROM.P POINT395.SK)) GO.335.V)))
              ?X_F)
             ** E390.SK)
	(:ROLES
		(!R1 (POINT395.SK LOCATION.N))
		(!R2 (?X_F LOCATION.N))
		(!R3 (NOT (POINT395.SK = ?X_F)))
		(!R4 (ME399.SK MAN.N))
		(!R5 (?X_F ((NN MEETING.N) SPOT.N)))
		(!R6 (?X_A DATE.N))
		(!R7 (?X_F PEN.N))
		(!R8 (?X_A BROTHER.N))
		(!R9 (?X_A (PERTAIN-TO ME399.SK)))
		(!R10 (POINT395.SK FARM.N))
		(!R11 (ME399.SK AGENT.N))
		(!R12 (POINT395.SK POINT.N))
	)
	(:GOALS
		(?G1 (ME399.SK (WANT.V (KA ((ADV-A (AT.P ?X_F)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME399.SK (AT.P POINT395.SK)))
		(?I2 (NOT (ME399.SK (AT.P ?X_F))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME399.SK (AT.P POINT395.SK))))
		(?P2 (ME399.SK (AT.P ?X_F)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E390.SK))
		(!W2 (?I2 BEFORE E390.SK))
		(!W3 (?P1 AFTER E390.SK))
		(!W4 (?P2 AFTER E390.SK))
		(!W5 (?G1 CAUSE-OF E390.SK))
		(!W6 (E390.SK (BEFORE ?X_E)))
		(!W7 (E390.SK (BEFORE NOW90)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 19:
	; "The man felt cold."
	; "He took a warm shower."
	; "He felt better in the shower."
	; "When he got out he felt cold again."
	; "He got back in the shower."
; best schemas are:
; GO.212.V
; TAKE.1.V
; TAKE.10.V
; GO.253.V
; RUN.311.V
; GO.423.V

; story 20:
	; "Today I went swimming."
	; "I love to swim."
	; "The water was very cold."
	; "The water made my teeth chatter."
	; "The water was so cold, I had to get out."
discarding schema GO.253.V learned from this story
; best schemas are:
; TAKE.302.V
; GO.212.V
; FLY.235.V
; GO.658.V
; GO.591.V
(setf matches (append matches '(( (3.7278125 3)
("Today I went swimming." "I love to swim." "The water was very cold."
 "The water made my teeth chatter." "The water was so cold, I had to get out.")
(EPI-SCHEMA ((ME435.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K SWIMMING.N))) GO.349.V))
              (K SWIMMING.N))
             ** E414.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K SWIMMING.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K SWIMMING.N))))
		(!R4 (?X_A (PLUR PERSON.N)))
		(!R5 (ME435.SK MAN.N))
		(!R6 (?X_A WOMAN.N))
		(!R7 (ME435.SK AGENT.N))
		(!R8 (CHATTER430.SK (PERTAIN-TO ME435.SK)))
		(!R9 (CHATTER430.SK ((NN (PLUR TOOTH.N)) CHATTER.N)))
	)
	(:GOALS
		(?G1 (ME435.SK (WANT.V (KA ((ADV-A (AT.P (K SWIMMING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME435.SK (AT.P ?L1)))
		(?I2 (NOT (ME435.SK (AT.P (K SWIMMING.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME435.SK (AT.P ?L1))))
		(?P2 (ME435.SK (AT.P (K SWIMMING.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E414.SK))
		(!W2 (?I2 BEFORE E414.SK))
		(!W3 (?P1 AFTER E414.SK))
		(!W4 (?P2 AFTER E414.SK))
		(!W5 (?G1 CAUSE-OF E414.SK))
		(!W6 (E414.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E414.SK (BEFORE NOW100)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.1834373 3)
("Today I went swimming." "I love to swim." "The water was very cold."
 "The water made my teeth chatter." "The water was so cold, I had to get out.")
(EPI-SCHEMA ((ME435.SK
              (AWAY.ADV
               ((ADV-A (TO.P (K SWIMMING.N)))
                ((ADV-A (FROM.P ?L1)) FLY.350.V)))
              (K SWIMMING.N))
             ** E414.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K SWIMMING.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K SWIMMING.N))))
		(!R4 (ME435.SK ((NN MOTHER.N) BIRD.N)))
		(!R5 (ME435.SK BIRD.N))
		(!R6 (ME435.SK ((NN BABY.N) BIRD.N)))
		(!R7 (ME435.SK AGENT.N))
		(!R8 (CHATTER430.SK (PERTAIN-TO ME435.SK)))
		(!R9 (CHATTER430.SK ((NN (PLUR TOOTH.N)) CHATTER.N)))
	)
	(:GOALS
		(?G1 (ME435.SK (WANT.V (KA ((ADV-A (AT.P (K SWIMMING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME435.SK (AT.P ?L1)))
		(?I2 (NOT (ME435.SK (AT.P (K SWIMMING.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME435.SK (AT.P ?L1))))
		(?P2 (ME435.SK (AT.P (K SWIMMING.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E414.SK))
		(!W2 (?I2 BEFORE E414.SK))
		(!W3 (?P1 AFTER E414.SK))
		(!W4 (?P2 AFTER E414.SK))
		(!W5 (?G1 CAUSE-OF E414.SK))
		(!W6 (E414.SK (BEFORE ?X_C)))
		(!W7 (E414.SK (BEFORE NOW100)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.227813 5)
("Today I went swimming." "I love to swim." "The water was very cold."
 "The water made my teeth chatter." "The water was so cold, I had to get out.")
(EPI-SCHEMA ((ME435.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P CHATTER430.SK)) PLAY.V))))
               ((ADV-A (TO.P (K SWIMMING.N))) ((ADV-A (FROM.P ?L1)) GO.351.V)))
              (K SWIMMING.N))
             ** E414.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K SWIMMING.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K SWIMMING.N))))
		(!R4 (CHATTER430.SK (PLUR FRIEND.N)))
		(!R5 (CHATTER430.SK HOME.N))
		(!R6 (ME435.SK GIRL.N))
		(!R7 (ME435.SK AGENT.N))
		(!R8 (CHATTER430.SK (PERTAIN-TO ME435.SK)))
		(!R9 (CHATTER430.SK ((NN (PLUR TOOTH.N)) CHATTER.N)))
	)
	(:GOALS
		(?G1 (ME435.SK (WANT.V (KA ((ADV-A (AT.P (K SWIMMING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME435.SK (AT.P ?L1)))
		(?I2 (NOT (ME435.SK (AT.P (K SWIMMING.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME435.SK (AT.P ?L1))))
		(?P2 (ME435.SK (AT.P (K SWIMMING.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E414.SK))
		(!W2 (?I2 BEFORE E414.SK))
		(!W3 (?P1 AFTER E414.SK))
		(!W4 (?P2 AFTER E414.SK))
		(!W5 (?G1 CAUSE-OF E414.SK))
		(!W6 (E414.SK (BEFORE ?X_E)))
		(!W7 (E414.SK (BEFORE NOW100)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.227813 7)
("Today I went swimming." "I love to swim." "The water was very cold."
 "The water made my teeth chatter." "The water was so cold, I had to get out.")
(EPI-SCHEMA ((ME435.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K SWIMMING.N))) GO.352.V))
              (K SWIMMING.N))
             ** E414.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K SWIMMING.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K SWIMMING.N))))
		(!R4 (ME435.SK CAT.N))
		(!R5 (ME435.SK NEW.A))
		(!R6 ((K SWIMMING.N) ((NN PET.N) STORE.N)))
		(!R7 (CHATTER430.SK CAT.N))
		(!R8 (CHATTER430.SK NICE.A))
		(!R9 (ME435.SK AGENT.N))
		(!R10 (CHATTER430.SK (PERTAIN-TO ME435.SK)))
		(!R11 (CHATTER430.SK ((NN (PLUR TOOTH.N)) CHATTER.N)))
	)
	(:GOALS
		(?G1 (ME435.SK (WANT.V (KA ((ADV-A (AT.P (K SWIMMING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME435.SK (AT.P ?L1)))
		(?I2 (NOT (ME435.SK (AT.P (K SWIMMING.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME435.SK (AT.P ?L1))))
		(?P2 (ME435.SK (AT.P (K SWIMMING.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E414.SK))
		(!W2 (?I2 BEFORE E414.SK))
		(!W3 (?P1 AFTER E414.SK))
		(!W4 (?P2 AFTER E414.SK))
		(!W5 (?G1 CAUSE-OF E414.SK))
		(!W6 (E414.SK (BEFORE ?X_E)))
		(!W7 (E414.SK (BEFORE NOW100)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 21:
	; "Julia loved flowers."
	; "She thought they were so pretty."
	; "One day she was walking."
	; "She saw a field of flowers."
	; "She had fun playing the flowers."
; best schemas are:
; TAKE.302.V
; PLAY.195.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; PLAY.402.V
; TAKE.10.V
; TAKE.413.V
(setf matches (append matches '(( (1.53125 4)
("Julia loved flowers." "She thought they were so pretty."
 "One day she was walking." "She saw a field of flowers."
 "She had fun playing the flowers.")
(EPI-SCHEMA ((JULIA.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.358.V
              (KA ((THERE.ADV SEE.V) FIELD446.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) FIELD446.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (JULIA.NAME AGENT.N))
		(!R4 (FIELD446.SK ((NN MOTHER.N) BIRD.N)))
		(!R5 (FIELD446.SK BIRD.N))
		(!R6 (FIELD446.SK ((NN BABY.N) BIRD.N)))
		(!R7 (FIELD446.SK (OF.P (K (PLUR FLOWER.N)))))
		(!R8 (FIELD446.SK FIELD.N))
	)
	(:GOALS
		(?G1 (JULIA.NAME (WANT.V (THAT (NOT (JULIA.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (JULIA.NAME (THERE.ADV SEE.V) FIELD446.SK)) CAUSE-OF
    (KE (JULIA.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E447.SK (JULIA.NAME (THERE.ADV (THERE.ADV SEE.V)) FIELD446.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E447.SK))
		(!W2 (E447.SK (BEFORE ?X_D)))
		(!W3 (E447.SK (BEFORE ?X_E)))
		(!W4 (E447.SK (BEFORE NOW108)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 22:
	; "Toni had a cat."
	; "She loved the cat."
	; "One day it got caught in the tree."
	; "Toni got mad."
	; "She looked for it and tried to get it."
; best schemas are:
; CLIMB_GET_EAT.349.PR
; GET.848.V
; GET.88.V
; GET.333.V
; GET.821.V
; GET.457.V

; story 23:
	; "Susie was so hungry."
	; "She filled her plate to the top."
	; "She needed to eat."
	; "All the sudden she got full."
	; "She put on too much."
; best schemas are:
; FEED_TAKE_NIL.1100.PR
; CLIMB_GET_EAT.349.PR
; GO_FIND_EAT.566.PR
; EAT.V
; FEED.V
; FEED.343.V

; story 24:
	; "It was a raining night."
	; "It was too bad to go out."
	; "So Tina had to stay home."
	; "Tina had to cook."
	; "She wasn't happy about that."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; TAKE.135.V
; GET.672.V
; TAKE.255.V
; GIVE.241.V
; GET.324.V

; story 25:
	; "It was a hot day."
	; "Fred wanted water balloons."
	; "So he filled some up."
	; "Then he threw them at his friends."
	; "They had a large fight."
; best schemas are:
; TAKE.928.V
; TAKE.10.V
; TAKE.135.V
; GET.672.V
; EAT.1200.V
; PLAY.1257.V

; story 26:
	; "I was on my way to get ice cream."
	; "Then I saw the line."
	; "It was far too long."
	; "It was around the corner."
	; "So I went home instead."
discarding schema GO.292.V learned from this story
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; GO.658.V
; TAKE.302.V
; GO.212.V
; FLY.235.V
(setf matches (append matches '(( (1.53125 4)
("I was on my way to get ice cream." "Then I saw the line."
 "It was far too long." "It was around the corner." "So I went home instead.")
(EPI-SCHEMA ((ME535.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.426.V
              (KA ((THERE.ADV SEE.V) LINE529.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) LINE529.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (LINE529.SK ((NN MOTHER.N) BIRD.N)))
		(!R4 (LINE529.SK BIRD.N))
		(!R5 (LINE529.SK ((NN BABY.N) BIRD.N)))
		(!R6 (ME535.SK AGENT.N))
		(!R7 (LINE529.SK LINE.N))
		(!R8 (WAY527.SK (PERTAIN-TO ME535.SK)))
		(!R9 (WAY527.SK WAY.N))
	)
	(:GOALS
		(?G1 (ME535.SK (WANT.V (THAT (NOT (ME535.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME535.SK (THERE.ADV SEE.V) LINE529.SK)) CAUSE-OF
    (KE (ME535.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E530.SK (ME535.SK (THERE.ADV (THERE.ADV SEE.V)) LINE529.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E530.SK))
		(!W2 (E530.SK (BEFORE ?X_D)))
		(!W3 (E530.SK (BEFORE ?X_E)))
		(!W4 (E530.SK (BEFORE NOW131)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.509063 3)
("I was on my way to get ice cream." "Then I saw the line."
 "It was far too long." "It was around the corner." "So I went home instead.")
(EPI-SCHEMA ((ME535.SK
              (INSTEAD.ADV
               ((ADV-A HOME.N)
                ((ADV-A (FROM.P CORNER533.SK))
                 ((ADV-A (TO.P ?L2))
                  ((ADV-A (FOR.P (KA ((ADV-A (WITH.P WAY527.SK)) PLAY.V))))
                   GO.430.V)))))
              ?L2)
             ** E534.SK)
	(:ROLES
		(!R1 (CORNER533.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (CORNER533.SK = ?L2)))
		(!R4 (WAY527.SK (PLUR FRIEND.N)))
		(!R5 (WAY527.SK HOME.N))
		(!R6 (ME535.SK GIRL.N))
		(!R7 (WAY527.SK WAY.N))
		(!R8 (WAY527.SK (PERTAIN-TO ME535.SK)))
		(!R9 (ME535.SK AGENT.N))
		(!R10 (CORNER533.SK CORNER.N))
	)
	(:GOALS
		(?G1 (ME535.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME535.SK (AT.P CORNER533.SK)))
		(?I2 (NOT (ME535.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME535.SK (AT.P CORNER533.SK))))
		(?P2 (ME535.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E534.SK))
		(!W2 (?I2 BEFORE E534.SK))
		(!W3 (?P1 AFTER E534.SK))
		(!W4 (?P2 AFTER E534.SK))
		(!W5 (?G1 CAUSE-OF E534.SK))
		(!W6 (E534.SK (BEFORE ?X_E)))
		(!W7 (E534.SK (BEFORE NOW134)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.009063 1)
("I was on my way to get ice cream." "Then I saw the line."
 "It was far too long." "It was around the corner." "So I went home instead.")
(EPI-SCHEMA ((ME535.SK
              (INSTEAD.ADV
               ((ADV-A HOME.N)
                ((ADV-A (TO.P ?X_C))
                 ((ADV-A (FROM.P CORNER533.SK)) GO.443.V))))
              ?X_C)
             ** E534.SK)
	(:ROLES
		(!R1 (CORNER533.SK LOCATION.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (CORNER533.SK = ?X_C)))
		(!R4 (?X_A (PLUR PERSON.N)))
		(!R5 (ME535.SK MAN.N))
		(!R6 (?X_A WOMAN.N))
		(!R7 (ME535.SK AGENT.N))
		(!R8 (WAY527.SK (PERTAIN-TO ME535.SK)))
		(!R9 (WAY527.SK WAY.N))
		(!R10 (CORNER533.SK CORNER.N))
	)
	(:GOALS
		(?G1 (ME535.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME535.SK (AT.P CORNER533.SK)))
		(?I2 (NOT (ME535.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME535.SK (AT.P CORNER533.SK))))
		(?P2 (ME535.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E534.SK))
		(!W2 (?I2 BEFORE E534.SK))
		(!W3 (?P1 AFTER E534.SK))
		(!W4 (?P2 AFTER E534.SK))
		(!W5 (?G1 CAUSE-OF E534.SK))
		(!W6 (E534.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E534.SK (BEFORE NOW134)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4646873 1)
("I was on my way to get ice cream." "Then I saw the line."
 "It was far too long." "It was around the corner." "So I went home instead.")
(EPI-SCHEMA ((ME535.SK
              (INSTEAD.ADV
               ((ADV-A HOME.N)
                ((ADV-A (FROM.P CORNER533.SK))
                 ((ADV-A (TO.P ?L2)) (AWAY.ADV FLY.444.V)))))
              ?L2)
             ** E534.SK)
	(:ROLES
		(!R1 (CORNER533.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (CORNER533.SK = ?L2)))
		(!R4 (ME535.SK ((NN MOTHER.N) BIRD.N)))
		(!R5 (ME535.SK BIRD.N))
		(!R6 (ME535.SK ((NN BABY.N) BIRD.N)))
		(!R7 (ME535.SK AGENT.N))
		(!R8 (WAY527.SK (PERTAIN-TO ME535.SK)))
		(!R9 (WAY527.SK WAY.N))
		(!R10 (CORNER533.SK CORNER.N))
	)
	(:GOALS
		(?G1 (ME535.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME535.SK (AT.P CORNER533.SK)))
		(?I2 (NOT (ME535.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME535.SK (AT.P CORNER533.SK))))
		(?P2 (ME535.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E534.SK))
		(!W2 (?I2 BEFORE E534.SK))
		(!W3 (?P1 AFTER E534.SK))
		(!W4 (?P2 AFTER E534.SK))
		(!W5 (?G1 CAUSE-OF E534.SK))
		(!W6 (E534.SK (BEFORE ?X_C)))
		(!W7 (E534.SK (BEFORE NOW134)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 27:
	; "The man turned on the light."
	; "A mouse got startled."
	; "The mouse ran across the living room."
	; "The man got startled."
	; "The man hid in his room."
discarding schema RUN.311.V learned from this story
discarding schema GET.310.V learned from this story
; best schemas are:
; WALK.989.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; GO.212.V
; RUN.401.V
(setf matches (append matches '(( (2.405 1)
("The man turned on the light." "A mouse got startled."
 "The mouse ran across the living room." "The man got startled."
 "The man hid in his room.")
(EPI-SCHEMA ((MOUSE551.SK
              ((ADV-A (ACROSS.P ROOM560.SK))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) RUN.474.V)))
              ?X_C)
             ** E556.SK)
	(:ROLES
		(!R1 (MOUSE551.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (?X_A (PLUR PERSON.N)))
		(!R6 (MOUSE551.SK MAN.N))
		(!R7 (?X_A WOMAN.N))
		(!R8 (MOUSE551.SK MOUSE.N))
		(!R9 (ROOM560.SK ((NN LIVING.N) ROOM.N)))
		(!R10 (ROOM560.SK ROOM.N))
		(!R11 (ROOM560.SK (PERTAIN-TO MAN547.SK)))
		(!R12 (MAN547.SK MAN.N))
		(!R13 (E556.SK (RIGHT-AFTER U136)))
	)
	(:GOALS
		(?G1 (MOUSE551.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MOUSE551.SK (AT.P ?L1)))
		(?I2 (NOT (MOUSE551.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MOUSE551.SK (AT.P ?L1))))
		(?P2 (MOUSE551.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E556.SK))
		(!W2 (?I2 BEFORE E556.SK))
		(!W3 (?P1 AFTER E556.SK))
		(!W4 (?P2 AFTER E556.SK))
		(!W5 (?G1 CAUSE-OF E556.SK))
		(!W6 (E556.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E556.SK (SAME-TIME NOW137)))
		(!W9 (E563.SK (BEFORE NOW137)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.81 5)
("The man turned on the light." "A mouse got startled."
 "The mouse ran across the living room." "The man got startled."
 "The man hid in his room.")
(EPI-SCHEMA ((MOUSE551.SK
              ((ADV-A (ACROSS.P ROOM560.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA (GET.V (K HELP.N))))) RUN.475.V))))
              ?L2)
             ** E556.SK)
	(:ROLES
		(!R1 (MOUSE551.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (MOUSE551.SK FRIEND.N))
		(!R6 (MOUSE551.SK (PERTAIN-TO MAN547.SK)))
		(!R7 (MAN547.SK FEMALE.A))
		(!R8 (MAN547.SK AGENT.N))
		(!R9 (ROOM560.SK GIRL.N))
		(!R10 (ROOM560.SK HEAD.N))
		(!R11 (?X_C HEAD.N))
		(!R12 (?X_C (PERTAIN-TO MAN547.SK)))
		(!R13 (MOUSE551.SK MOUSE.N))
		(!R14 (E556.SK (RIGHT-AFTER U136)))
		(!R15 (MAN547.SK MAN.N))
		(!R16 (ROOM560.SK ((NN LIVING.N) ROOM.N)))
		(!R17 (ROOM560.SK (PERTAIN-TO MAN547.SK)))
		(!R18 (ROOM560.SK ROOM.N))
	)
	(:GOALS
		(?G1 (MOUSE551.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MOUSE551.SK (AT.P ?L1)))
		(?I2 (NOT (MOUSE551.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MOUSE551.SK (AT.P ?L1))))
		(?P2 (MOUSE551.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E556.SK))
		(!W2 (?I2 BEFORE E556.SK))
		(!W3 (?P1 AFTER E556.SK))
		(!W4 (?P2 AFTER E556.SK))
		(!W5 (?G1 CAUSE-OF E556.SK))
		(!W6 (E556.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E556.SK (SAME-TIME NOW137)))
		(!W9 (E563.SK (BEFORE NOW137)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 28:
	; "Tom moved to a new city."
	; "He couldn't find a church he liked."
	; "He tried going to a black church."
	; "Tom had a lot of fun there."
	; "He returned often."
discarding schema MOVE.342.V learned from this story
; best schemas are:
; MOVE.109.V
; MOVE.501.V
; GO.591.V
; GO.387.V
; GO.843.V
(setf matches (append matches '(( (4.6953125 2)
("Tom moved to a new city." "He couldn't find a church he liked."
 "He tried going to a black church." "Tom had a lot of fun there."
 "He returned often.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P CITY579.SK)) MOVE.476.V))
              CITY579.SK)
             ** E580.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (CITY579.SK LOCATION.N))
		(!R4 (NOT (?L1 = CITY579.SK)))
		(!R5 (?X_A HOMETOWN.N))
		(!R6 (?X_A (PERTAIN-TO TOM.NAME)))
		(!R7 (CITY579.SK CITY.N))
		(!R8 (CITY579.SK NEW.A))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA ((ADV-A (AT.P CITY579.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P CITY579.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P ?L1))))
		(?P2 (TOM.NAME (AT.P CITY579.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E580.SK))
		(!W2 (?I2 BEFORE E580.SK))
		(!W3 (?P1 AFTER E580.SK))
		(!W4 (?P2 AFTER E580.SK))
		(!W5 (?G1 CAUSE-OF E580.SK))
		(!W6 (E580.SK (BEFORE ?X_E)))
		(!W7 (E580.SK (BEFORE NOW140)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.1953125 3)
("Tom moved to a new city." "He couldn't find a church he liked."
 "He tried going to a black church." "Tom had a lot of fun there."
 "He returned often.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P CITY579.SK)) MOVE.477.V))
              CITY579.SK)
             ** E580.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (CITY579.SK LOCATION.N))
		(!R4 (NOT (?L1 = CITY579.SK)))
		(!R5 (CITY579.SK TOWN.N))
		(!R6 (CITY579.SK CITY.N))
		(!R7 (CITY579.SK MUNICIPALITY.N))
		(!R8 (CITY579.SK NEW.A))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA ((ADV-A (AT.P CITY579.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P CITY579.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P ?L1))))
		(?P2 (TOM.NAME (AT.P CITY579.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E580.SK))
		(!W2 (?I2 BEFORE E580.SK))
		(!W3 (?P1 AFTER E580.SK))
		(!W4 (?P2 AFTER E580.SK))
		(!W5 (?G1 CAUSE-OF E580.SK))
		(!W6 (E580.SK (BEFORE ?X_D)))
		(!W7 (E580.SK (BEFORE NOW140)))
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
(setf matches (append matches '(( (3.6953125 3)
("Tom moved to a new city." "He couldn't find a church he liked."
 "He tried going to a black church." "Tom had a lot of fun there."
 "He returned often.")
(EPI-SCHEMA ((TOM.NAME
              (OFTEN.ADV
               ((ADV-A (TO.P ?X_C))
                ((ADV-A (FROM.P CITY579.SK)) RETURN.478.V)))
              ?X_C)
             ** E597.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (CITY579.SK LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (CITY579.SK = ?X_C)))
		(!R5 (TOM.NAME CAT.N))
		(!R6 (TOM.NAME NEW.A))
		(!R7 (?X_C ((NN PET.N) STORE.N)))
		(!R8 (?X_A CAT.N))
		(!R9 (?X_A NICE.A))
		(!R10 (?X_A (PERTAIN-TO TOM.NAME)))
		(!R11 (CITY579.SK CITY.N))
		(!R12 (CITY579.SK NEW.A))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P CITY579.SK)))
		(?I2 (NOT (TOM.NAME (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P CITY579.SK))))
		(?P2 (TOM.NAME (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E597.SK))
		(!W2 (?I2 BEFORE E597.SK))
		(!W3 (?P1 AFTER E597.SK))
		(!W4 (?P2 AFTER E597.SK))
		(!W5 (?G1 CAUSE-OF E597.SK))
		(!W6 (E597.SK (BEFORE ?X_E)))
		(!W7 (E597.SK (BEFORE NOW144)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.1953125 2)
("Tom moved to a new city." "He couldn't find a church he liked."
 "He tried going to a black church." "Tom had a lot of fun there."
 "He returned often.")
(EPI-SCHEMA ((TOM.NAME
              (OFTEN.ADV
               ((ADV-A (TO.P ?X_C))
                ((ADV-A (FROM.P CITY579.SK)) RETURN.479.V)))
              ?X_C)
             ** E597.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (CITY579.SK LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (CITY579.SK = ?X_C)))
		(!R5 (CITY579.SK ((NN HAIR.N) CUT.N)))
		(!R6 (?X_C ((NN HAIR.N) STYLIST.N)))
		(!R7 (?X_C HAIR.N))
		(!R8 (?X_C (PERTAIN-TO TOM.NAME)))
		(!R9 (CITY579.SK CITY.N))
		(!R10 (CITY579.SK NEW.A))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P CITY579.SK)))
		(?I2 (NOT (TOM.NAME (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P CITY579.SK))))
		(?P2 (TOM.NAME (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E597.SK))
		(!W2 (?I2 BEFORE E597.SK))
		(!W3 (?P1 AFTER E597.SK))
		(!W4 (?P2 AFTER E597.SK))
		(!W5 (?G1 CAUSE-OF E597.SK))
		(!W6 (E597.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E597.SK (BEFORE NOW144)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 29:
	; "Tina liked Fred."
	; "She wanted to ask him out."
	; "When Tina and Fred saw each other she asked."
	; "Fred said no."
	; "Tina was crushed."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
(setf matches (append matches '(( (2.5 2)
("Tina liked Fred." "She wanted to ask him out."
 "When Tina and Fred saw each other she asked." "Fred said no."
 "Tina was crushed.")
(EPI-SCHEMA ((TINA.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.481.V
              (KA (LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))))
             ** ?E)
	(:ROLES
		(!R1 (TINA.NAME AGENT.N))
		(!R2 ((KA (LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (TINA.NAME BIRD.N))
		(!R5 (?X_B CAGE.N))
	)
	(:GOALS
		(E601.SK (TINA.NAME (WANT.V (THAT (NOT (TINA.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (TINA.NAME LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))) CAUSE-OF
    (KE (TINA.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E599.SK (TINA.NAME LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E601.SK CAUSE-OF E599.SK))
		(!W2 (E599.SK (BEFORE ?X_D)))
		(!W3 (E599.SK (BEFORE NOW145)))
		(!W4 (E601.SK (BEFORE NOW146)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.53125 5)
("Tina liked Fred." "She wanted to ask him out."
 "When Tina and Fred saw each other she asked." "Fred said no."
 "Tina was crushed.")
(EPI-SCHEMA ((TINA.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.483.V
              (KA (LIKE.V FRED.NAME)))
             ** ?E)
	(:ROLES
		(!R1 (TINA.NAME AGENT.N))
		(!R2 ((KA (LIKE.V FRED.NAME)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (?X_A ((NN HAIR.N) CUT.N)))
		(!R5 (?X_A NEW.A))
		(!R6 (FRED.NAME ((NN HAIR.N) STYLIST.N)))
		(!R7 (FRED.NAME HAIR.N))
		(!R8 (FRED.NAME (PERTAIN-TO TINA.NAME)))
	)
	(:GOALS
		(E601.SK (TINA.NAME (WANT.V (THAT (NOT (TINA.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (TINA.NAME LIKE.V FRED.NAME)) CAUSE-OF
    (KE (TINA.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E599.SK (TINA.NAME LIKE.V FRED.NAME))
	)
	(:EPISODE-RELATIONS
		(!W1 (E601.SK CAUSE-OF E599.SK))
		(!W2 (E601.SK (BEFORE ?X_E)))
		(!W3 (E599.SK (BEFORE ?X_G)))
		(!W4 (E599.SK (BEFORE NOW145)))
		(!W5 (E601.SK (BEFORE NOW146)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 30:
	; "The girl stood up."
	; "She bumped her head on something."
	; "She sat back down."
	; "Her head was bleeding."
	; "Her friend ran to get help."
discarding schema RUN.401.V learned from this story
discarding schema BUMP.400.V learned from this story
; best schemas are:
; GO.658.V
; GO.212.V
; GET.73.V
; TAKE.413.V
(setf matches (append matches '(( (2.905 4)
("The girl stood up." "She bumped her head on something." "She sat back down."
 "Her head was bleeding." "Her friend ran to get help.")
(EPI-SCHEMA ((FRIEND624.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P GIRL608.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.489.V)))
              ?L2)
             ** E623.SK)
	(:ROLES
		(!R1 (FRIEND624.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (GIRL608.SK (PLUR FRIEND.N)))
		(!R6 (GIRL608.SK HOME.N))
		(!R7 (GIRL608.SK (PERTAIN-TO FRIEND624.SK)))
		(!R8 (FRIEND624.SK GIRL.N))
		(!R9 (E623.SK (RIGHT-AFTER U153)))
		(!R10 (GIRL608.SK GIRL.N))
		(!R11 (GIRL608.SK HEAD.N))
		(!R12 (GIRL608.SK (PERTAIN-TO SHE.PRO)))
		(!R13 (SHE.PRO FEMALE.A))
		(!R14 (SHE.PRO AGENT.N))
		(!R15 (HEAD620.SK HEAD.N))
		(!R16 (HEAD620.SK (PERTAIN-TO SHE.PRO)))
		(!R17 (FRIEND624.SK FRIEND.N))
		(!R18 (FRIEND624.SK PERSON.N))
		(!R19 (FRIEND624.SK (PERTAIN-TO SHE.PRO)))
	)
	(:GOALS
		(?G1 (FRIEND624.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND624.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND624.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND624.SK (AT.P ?L1))))
		(?P2 (FRIEND624.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E623.SK))
		(!W2 (?I2 BEFORE E623.SK))
		(!W3 (?P1 AFTER E623.SK))
		(!W4 (?P2 AFTER E623.SK))
		(!W5 (?G1 CAUSE-OF E623.SK))
		(!W6 (E623.SK (BEFORE ?X_E)))
		(!W7 (E623.SK (SAME-TIME NOW154)))
		(!W8 (E626.SK (BEFORE NOW154)))
	)
	(:CERTAINTIES
		(!C1 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R17 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R17 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 1)
("The girl stood up." "She bumped her head on something." "She sat back down."
 "Her head was bleeding." "Her friend ran to get help.")
(EPI-SCHEMA ((FRIEND624.SK
              ((ADV-A (FOR.P (KA (GET.V (K HELP.N)))))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) RUN.490.V)))
              ?X_C)
             ** E623.SK)
	(:ROLES
		(!R1 (FRIEND624.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (?X_A (PLUR PERSON.N)))
		(!R6 (FRIEND624.SK MAN.N))
		(!R7 (?X_A WOMAN.N))
		(!R8 (FRIEND624.SK FRIEND.N))
		(!R9 (FRIEND624.SK PERSON.N))
		(!R10 (FRIEND624.SK (PERTAIN-TO SHE.PRO)))
		(!R11 (SHE.PRO FEMALE.A))
		(!R12 (SHE.PRO AGENT.N))
		(!R13 (E623.SK (RIGHT-AFTER U153)))
		(!R14 (GIRL608.SK GIRL.N))
		(!R15 (GIRL608.SK (PERTAIN-TO SHE.PRO)))
		(!R16 (GIRL608.SK HEAD.N))
		(!R17 (HEAD620.SK HEAD.N))
		(!R18 (HEAD620.SK (PERTAIN-TO SHE.PRO)))
	)
	(:GOALS
		(?G1 (FRIEND624.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND624.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND624.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND624.SK (AT.P ?L1))))
		(?P2 (FRIEND624.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E623.SK))
		(!W2 (?I2 BEFORE E623.SK))
		(!W3 (?P1 AFTER E623.SK))
		(!W4 (?P2 AFTER E623.SK))
		(!W5 (?G1 CAUSE-OF E623.SK))
		(!W6 (E623.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E623.SK (SAME-TIME NOW154)))
		(!W9 (E626.SK (BEFORE NOW154)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 31:
	; "The man went out to his mailbox."
	; "He looked for his paper."
	; "His paper was not there."
	; "He called his paper boy."
	; "His paper boy was running late."
discarding schema GO.423.V learned from this story
; best schemas are:
; GO.1083.V
; GO.212.V
; GO.253.V
; GO.1261.V
; GO.51.V
(setf matches (append matches '(( (4.4049997 4)
("The man went out to his mailbox." "He looked for his paper."
 "His paper was not there." "He called his paper boy."
 "His paper boy was running late.")
(EPI-SCHEMA ((MAN628.SK
              (OUT.ADV
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P MAILBOX631.SK))
                 ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_A)) LOOK.V))))
                  GO.547.V))))
              MAILBOX631.SK)
             ** E627.SK)
	(:ROLES
		(!R1 (MAN628.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (MAILBOX631.SK LOCATION.N))
		(!R4 (NOT (?L1 = MAILBOX631.SK)))
		(!R5 (?X_A (PLUR CLOTHE.N)))
		(!R6 (MAILBOX631.SK WIFE.N))
		(!R7 (E627.SK (RIGHT-AFTER U154)))
		(!R8 (MAILBOX631.SK MAILBOX.N))
		(!R9 (MAILBOX631.SK (PERTAIN-TO MAN628.SK)))
		(!R10 (MAN628.SK MAN.N))
		(!R11 (PAPER636.SK PAPER.N))
		(!R12 (PAPER636.SK (PERTAIN-TO MAN628.SK)))
		(!R13 (BOY651.SK ((NN PAPER.N) BOY.N)))
		(!R14 (BOY651.SK (PERTAIN-TO MAN628.SK)))
	)
	(:GOALS
		(?G1 (MAN628.SK (WANT.V (KA ((ADV-A (AT.P MAILBOX631.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN628.SK (AT.P ?L1)))
		(?I2 (NOT (MAN628.SK (AT.P MAILBOX631.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN628.SK (AT.P ?L1))))
		(?P2 (MAN628.SK (AT.P MAILBOX631.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E627.SK))
		(!W2 (?I2 BEFORE E627.SK))
		(!W3 (?P1 AFTER E627.SK))
		(!W4 (?P2 AFTER E627.SK))
		(!W5 (?G1 CAUSE-OF E627.SK))
		(!W6 (E627.SK (BEFORE ?X_E)))
		(!W7 (E627.SK (SAME-TIME NOW155)))
		(!W8 (E632.SK (BEFORE NOW155)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 3)
("The man went out to his mailbox." "He looked for his paper."
 "His paper was not there." "He called his paper boy."
 "His paper boy was running late.")
(EPI-SCHEMA ((MAN628.SK
              (OUT.ADV
               ((ADV-A (TO.P MAILBOX631.SK)) ((ADV-A (FROM.P ?L1)) GO.548.V)))
              MAILBOX631.SK)
             ** E627.SK)
	(:ROLES
		(!R1 (MAN628.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (MAILBOX631.SK LOCATION.N))
		(!R4 (NOT (?L1 = MAILBOX631.SK)))
		(!R5 (?X_A (PLUR PERSON.N)))
		(!R6 (?X_A WOMAN.N))
		(!R7 (MAILBOX631.SK MAILBOX.N))
		(!R8 (MAILBOX631.SK (PERTAIN-TO MAN628.SK)))
		(!R9 (MAN628.SK MAN.N))
		(!R10 (E627.SK (RIGHT-AFTER U154)))
		(!R11 (PAPER636.SK PAPER.N))
		(!R12 (PAPER636.SK (PERTAIN-TO MAN628.SK)))
		(!R13 (BOY651.SK ((NN PAPER.N) BOY.N)))
		(!R14 (BOY651.SK (PERTAIN-TO MAN628.SK)))
	)
	(:GOALS
		(?G1 (MAN628.SK (WANT.V (KA ((ADV-A (AT.P MAILBOX631.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN628.SK (AT.P ?L1)))
		(?I2 (NOT (MAN628.SK (AT.P MAILBOX631.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN628.SK (AT.P ?L1))))
		(?P2 (MAN628.SK (AT.P MAILBOX631.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E627.SK))
		(!W2 (?I2 BEFORE E627.SK))
		(!W3 (?P1 AFTER E627.SK))
		(!W4 (?P2 AFTER E627.SK))
		(!W5 (?G1 CAUSE-OF E627.SK))
		(!W6 (E627.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E627.SK (SAME-TIME NOW155)))
		(!W9 (E632.SK (BEFORE NOW155)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 7)
("The man went out to his mailbox." "He looked for his paper."
 "His paper was not there." "He called his paper boy."
 "His paper boy was running late.")
(EPI-SCHEMA ((MAN628.SK
              (OUT.ADV
               ((ADV-A (TO.P MAILBOX631.SK)) ((ADV-A (FROM.P ?X_B)) GO.549.V)))
              MAILBOX631.SK)
             ** E627.SK)
	(:ROLES
		(!R1 (MAN628.SK AGENT.N))
		(!R2 (?X_B LOCATION.N))
		(!R3 (MAILBOX631.SK LOCATION.N))
		(!R4 (NOT (?X_B = MAILBOX631.SK)))
		(!R5 (MAILBOX631.SK ((NN MEETING.N) SPOT.N)))
		(!R6 (MAILBOX631.SK DATE.N))
		(!R7 (MAILBOX631.SK BROTHER.N))
		(!R8 (?X_B FARM.N))
		(!R9 (MAILBOX631.SK PEN.N))
		(!R10 (E627.SK (RIGHT-AFTER U154)))
		(!R11 (MAILBOX631.SK MAILBOX.N))
		(!R12 (MAILBOX631.SK INSTRUMENTALITY.N))
		(!R13 (MAILBOX631.SK (PERTAIN-TO MAN628.SK)))
		(!R14 (MAN628.SK MAN.N))
		(!R15 (PAPER636.SK PAPER.N))
		(!R16 (PAPER636.SK (PERTAIN-TO MAN628.SK)))
		(!R17 (BOY651.SK ((NN PAPER.N) BOY.N)))
		(!R18 (BOY651.SK (PERTAIN-TO MAN628.SK)))
	)
	(:GOALS
		(?G1 (MAN628.SK (WANT.V (KA ((ADV-A (AT.P MAILBOX631.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN628.SK (AT.P ?X_B)))
		(?I2 (NOT (MAN628.SK (AT.P MAILBOX631.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN628.SK (AT.P ?X_B))))
		(?P2 (MAN628.SK (AT.P MAILBOX631.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E627.SK))
		(!W2 (?I2 BEFORE E627.SK))
		(!W3 (?P1 AFTER E627.SK))
		(!W4 (?P2 AFTER E627.SK))
		(!W5 (?G1 CAUSE-OF E627.SK))
		(!W6 (E627.SK (BEFORE ?X_E)))
		(!W7 (E627.SK (SAME-TIME NOW155)))
		(!W8 (E632.SK (BEFORE NOW155)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R9 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R12 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.9049997 4)
("The man went out to his mailbox." "He looked for his paper."
 "His paper was not there." "He called his paper boy."
 "His paper boy was running late.")
(EPI-SCHEMA ((MAN628.SK
              (OUT.ADV
               ((ADV-A (TO.P (K FISHING.N))) ((ADV-A (FROM.P ?L1)) GO.550.V)))
              (K FISHING.N))
             ** E627.SK)
	(:ROLES
		(!R1 (MAN628.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K FISHING.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K FISHING.N))))
		(!R5 (MAILBOX631.SK LIMIT.N))
		(!R6 (MAILBOX631.SK MAILBOX.N))
		(!R7 (MAILBOX631.SK (PERTAIN-TO MAN628.SK)))
		(!R8 (MAN628.SK MAN.N))
		(!R9 (PAPER636.SK PAPER.N))
		(!R10 (PAPER636.SK (PERTAIN-TO MAN628.SK)))
		(!R11 (BOY651.SK ((NN PAPER.N) BOY.N)))
		(!R12 (BOY651.SK (PERTAIN-TO MAN628.SK)))
		(!R13 (E627.SK (RIGHT-AFTER U154)))
	)
	(:GOALS
		(?G1 (MAN628.SK (WANT.V (KA ((ADV-A (AT.P (K FISHING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN628.SK (AT.P ?L1)))
		(?I2 (NOT (MAN628.SK (AT.P (K FISHING.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN628.SK (AT.P ?L1))))
		(?P2 (MAN628.SK (AT.P (K FISHING.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E627.SK))
		(!W2 (?I2 BEFORE E627.SK))
		(!W3 (?P1 AFTER E627.SK))
		(!W4 (?P2 AFTER E627.SK))
		(!W5 (?G1 CAUSE-OF E627.SK))
		(!W6 (E627.SK (SAME-TIME ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E627.SK (SAME-TIME NOW155)))
		(!W9 (E632.SK (BEFORE NOW155)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.9049997 5)
("The man went out to his mailbox." "He looked for his paper."
 "His paper was not there." "He called his paper boy."
 "His paper boy was running late.")
(EPI-SCHEMA ((MAN628.SK
              (OUT.ADV
               ((ADV-A (TO.P MAILBOX631.SK)) ((ADV-A (FROM.P ?L1)) GO.551.V)))
              MAILBOX631.SK)
             ** E627.SK)
	(:ROLES
		(!R1 (MAN628.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (MAILBOX631.SK LOCATION.N))
		(!R4 (NOT (?L1 = MAILBOX631.SK)))
		(!R5 (MAILBOX631.SK CAFETERIA.N))
		(!R6 (MAILBOX631.SK LUNCH.N))
		(!R7 (MAILBOX631.SK MAILBOX.N))
		(!R8 (MAILBOX631.SK ARTIFACT.N))
		(!R9 (MAILBOX631.SK (PERTAIN-TO MAN628.SK)))
		(!R10 (MAN628.SK MAN.N))
		(!R11 (PAPER636.SK PAPER.N))
		(!R12 (PAPER636.SK (PERTAIN-TO MAN628.SK)))
		(!R13 (BOY651.SK ((NN PAPER.N) BOY.N)))
		(!R14 (BOY651.SK (PERTAIN-TO MAN628.SK)))
		(!R15 (E627.SK (RIGHT-AFTER U154)))
	)
	(:GOALS
		(?G1 (MAN628.SK (WANT.V (KA ((ADV-A (AT.P MAILBOX631.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN628.SK (AT.P ?L1)))
		(?I2 (NOT (MAN628.SK (AT.P MAILBOX631.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN628.SK (AT.P ?L1))))
		(?P2 (MAN628.SK (AT.P MAILBOX631.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E627.SK))
		(!W2 (?I2 BEFORE E627.SK))
		(!W3 (?P1 AFTER E627.SK))
		(!W4 (?P2 AFTER E627.SK))
		(!W5 (?G1 CAUSE-OF E627.SK))
		(!W6 (E627.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E627.SK (SAME-TIME NOW155)))
		(!W9 (E632.SK (BEFORE NOW155)))
	)
	(:CERTAINTIES
		(!C1 (!R8 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R8 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R7 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 32:
	; "I got a new kitten."
	; "The kitten was bad."
	; "It ate my shoes."
	; "I then trained it to be good."
	; "It was a good kitten from then on."
discarding schema EAT.516.V learned from this story
discarding schema GET.518.V learned from this story
; best schemas are:
; TAKE.302.V
; FEED.660.V
; TAKE.946.V
; GIVE.1297.V
(setf matches (append matches '(( (4.1328125 9)
("I got a new kitten." "The kitten was bad." "It ate my shoes."
 "I then trained it to be good." "It was a good kitten from then on.")
(EPI-SCHEMA ((ME675.SK ((ADV-A (TO.P SHOE669.SK)) FEED.566.V) KITTEN660.SK
              SHOE669.SK)
             ** ?X_G)
	(:ROLES
		(!R1 (KITTEN660.SK AGENT.N))
		(!R2 (SHOE669.SK FOOD.N))
		(!R3 (NOT (ME675.SK = KITTEN660.SK)))
		(!R4 (NOT (KITTEN660.SK = SHOE669.SK)))
		(!R5 (NOT (ME675.SK = SHOE669.SK)))
		(!R6 (SHOE669.SK MOUSE.N))
		(!R7 (ME675.SK CAT.N))
		(!R8 (ME675.SK OLD.A))
		(!R9 (KITTEN660.SK MOUSE.N))
		(!R10 (KITTEN660.SK NEW.A))
		(!R11 (KITTEN660.SK KITTEN.N))
		(!R12 (KITTEN660.SK ANIMAL.N))
		(!R13 (ME675.SK AGENT.N))
		(!R14 (SHOE669.SK (PERTAIN-TO ME675.SK)))
		(!R15 (SHOE669.SK (PLUR SHOE.N)))
	)
	(:GOALS
		(?G1 (ME675.SK (WANT.V (THAT (NOT (KITTEN660.SK HUNGRY.A))))))
		(?G2 (ME675.SK (WANT.V (THAT (KITTEN660.SK EAT.V SHOE669.SK)))))
	)
	(:PRECONDS
		(?I1 (ME675.SK HAVE.V SHOE669.SK))
		(?I2 (KITTEN660.SK HUNGRY.A))
	)
	(:STEPS
		(E672.SK (KITTEN660.SK EAT.V SHOE669.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (ME675.SK (HAVE.V SHOE669.SK))))
		(?P2 (NOT (KITTEN660.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E672.SK AFTER ?X_G))
		(!W2 (?I1 (AT-ABOUT ?X_F)))
		(!W3 (?X_G (AFTER ?X_H)))
		(!W4 (?X_H (AT-ABOUT ?X_I)))
		(!W5 (E672.SK (BEFORE NOW162)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R4 NECESSARY-TO-DEGREE 1.0))
		(!N4 (!R5 NECESSARY-TO-DEGREE 1.0))
		(!N5 (!R6 NECESSARY-TO-DEGREE 1.0))
		(!N6 (!E NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 33:
	; "Fred wanted to go to the movies."
	; "So off he went."
	; "He went with his friend."
	; "Fred saw two different movies."
	; "They were great."
discarding schema GO.531.V learned from this story
; best schemas are:
; GO.212.V
; TAKE.542.V
; GO.658.V
; TAKE.413.V
; TAKE.302.V
(setf matches (append matches '(( (3.955625 2)
("Fred wanted to go to the movies." "So off he went."
 "He went with his friend." "Fred saw two different movies." "They were great.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A SO.ADV OFF.P)
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.598.V)))
              ?X_C)
             ** E684.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (THEY695.SK (PLUR PERSON.N)))
		(!R6 (FRED.NAME MAN.N))
		(!R7 (THEY695.SK WOMAN.N))
		(!R8 (MOVIE682.SK (PLUR MOVIE.N)))
		(!R9 (FRIEND691.SK (PERTAIN-TO FRED.NAME)))
		(!R10 (FRIEND691.SK FRIEND.N))
		(!R11 (THEY695.SK AGENT.N))
	)
	(:GOALS
		(E683.SK (FRED.NAME (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRED.NAME (AT.P ?L1))))
		(?P2 (FRED.NAME (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E684.SK))
		(!W2 (?I2 BEFORE E684.SK))
		(!W3 (?P1 AFTER E684.SK))
		(!W4 (?P2 AFTER E684.SK))
		(!W5 (E683.SK CAUSE-OF E684.SK))
		(!W6 (E684.SK (BEFORE ?X_E)))
		(!W7 (E683.SK (BEFORE ?X_G)))
		(!W8 (E683.SK (BEFORE NOW165)))
		(!W9 (E684.SK (BEFORE NOW166)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.5 3)
("Fred wanted to go to the movies." "So off he went."
 "He went with his friend." "Fred saw two different movies." "They were great.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A SO.ADV OFF.P)
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FRIEND691.SK)) PLAY.V))))
                  GO.606.V))))
              ?L2)
             ** E684.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND691.SK (PLUR FRIEND.N)))
		(!R6 (FRIEND691.SK HOME.N))
		(!R7 (FRED.NAME GIRL.N))
		(!R8 (MOVIE682.SK (PLUR MOVIE.N)))
		(!R9 (FRIEND691.SK (PERTAIN-TO FRED.NAME)))
		(!R10 (FRIEND691.SK FRIEND.N))
	)
	(:GOALS
		(E683.SK (FRED.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
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
		(!W1 (?I1 BEFORE E684.SK))
		(!W2 (?I2 BEFORE E684.SK))
		(!W3 (?P1 AFTER E684.SK))
		(!W4 (?P2 AFTER E684.SK))
		(!W5 (E683.SK CAUSE-OF E684.SK))
		(!W6 (E684.SK (BEFORE ?X_E)))
		(!W7 (E683.SK (BEFORE NOW165)))
		(!W8 (E684.SK (BEFORE NOW166)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 34:
	; "Ethan loved the snow."
	; "He saw it snow outside."
	; "He asked his mom if he could play."
	; "He took his sled."
	; "He went down the hill."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V
; PLAY.669.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; FALL.1625.V
; COME.280.V
(setf matches (append matches '(( (1.53125 1)
("Ethan loved the snow." "He saw it snow outside."
 "He asked his mom if he could play." "He took his sled."
 "He went down the hill.")
(EPI-SCHEMA ((ETHAN.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
              (KA ((THERE.ADV SEE.V) IT.PRO)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) IT.PRO)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ETHAN.NAME AGENT.N))
		(!R4 (MOM704.SK (PERTAIN-TO ETHAN.NAME)))
		(!R5 (MOM704.SK MOM.N))
		(!R6 (SLED708.SK (PERTAIN-TO ETHAN.NAME)))
		(!R7 (SLED708.SK SLED.N))
	)
	(:GOALS
		(?G1 (ETHAN.NAME (WANT.V (THAT (NOT (ETHAN.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ETHAN.NAME (THERE.ADV SEE.V) IT.PRO)) CAUSE-OF
    (KE (ETHAN.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E702.SK (ETHAN.NAME (THERE.ADV (THERE.ADV SEE.V)) IT.PRO))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E702.SK))
		(!W2 (E702.SK (BEFORE ?X_D)))
		(!W3 (E702.SK (BEFORE NOW171)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (0.53125 2)
("Ethan loved the snow." "He saw it snow outside."
 "He asked his mom if he could play." "He took his sled."
 "He went down the hill.")
(EPI-SCHEMA ((ETHAN.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.627.V
              (KA (TAKE.V SLED708.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA (TAKE.V SLED708.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ETHAN.NAME FEMALE.A))
		(!R4 (ETHAN.NAME AGENT.N))
		(!R5 (SLED708.SK (PERTAIN-TO ETHAN.NAME)))
		(!R6 (SLED708.SK SLED.N))
		(!R7 (MOM704.SK (PERTAIN-TO ETHAN.NAME)))
		(!R8 (MOM704.SK MOM.N))
	)
	(:GOALS
		(?G1 (ETHAN.NAME (WANT.V (THAT (NOT (ETHAN.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ETHAN.NAME TAKE.V SLED708.SK)) CAUSE-OF
    (KE (ETHAN.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E709.SK (ETHAN.NAME TAKE.V SLED708.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E709.SK))
		(!W2 (E709.SK (AFTER ?X_D)))
		(!W3 (?X_D (AT-ABOUT ?X_E)))
		(!W4 (E709.SK (BEFORE NOW173)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.53125 4)
("Ethan loved the snow." "He saw it snow outside."
 "He asked his mom if he could play." "He took his sled."
 "He went down the hill.")
(EPI-SCHEMA ((ETHAN.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.651.V
              (KA ((THERE.ADV SEE.V) IT.PRO)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) IT.PRO)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ETHAN.NAME AGENT.N))
		(!R4 (IT.PRO ((NN MOTHER.N) BIRD.N)))
		(!R5 (IT.PRO BIRD.N))
		(!R6 (IT.PRO ((NN BABY.N) BIRD.N)))
		(!R7 (MOM704.SK (PERTAIN-TO ETHAN.NAME)))
		(!R8 (MOM704.SK MOM.N))
		(!R9 (SLED708.SK (PERTAIN-TO ETHAN.NAME)))
		(!R10 (SLED708.SK SLED.N))
	)
	(:GOALS
		(?G1 (ETHAN.NAME (WANT.V (THAT (NOT (ETHAN.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ETHAN.NAME (THERE.ADV SEE.V) IT.PRO)) CAUSE-OF
    (KE (ETHAN.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E702.SK (ETHAN.NAME (THERE.ADV (THERE.ADV SEE.V)) IT.PRO))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E702.SK))
		(!W2 (E702.SK (BEFORE ?X_D)))
		(!W3 (E702.SK (BEFORE ?X_E)))
		(!W4 (E702.SK (BEFORE NOW171)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 35:
	; "The cow left the barn."
	; "It went out to the field."
	; "The other cows were out in the field."
	; "The cow found a spot of grass."
	; "The cow ate the grass."
discarding schema FIND.562.V learned from this story
discarding schema GO.563.V learned from this story
; best schemas are:
; GO_FIND_EAT.566.PR
; COME.917.V
; COME.917.V
; COME.917.V
(setf matches (append matches '(( (5.5 2)
("The cow left the barn." "It went out to the field."
 "The other cows were out in the field." "The cow found a spot of grass."
 "The cow ate the grass.")
(EPI-SCHEMA ((COW714.SK GO_FIND_EAT.695.PR FIELD719.SK SPOT728.SK GRASS735.SK)
             ** ?E)
	(:ROLES
		(!R1 (GRASS735.SK FOOD.N))
		(!R2 (GRASS735.SK GRASS.N))
		(!R3 (E732.SK (RIGHT-AFTER U178)))
		(!R4 (SPOT728.SK (OF.P (K GRASS.N))))
		(!R5 (SPOT728.SK SPOT.N))
		(!R6 (E724.SK (RIGHT-AFTER U177)))
		(!R7 (COW714.SK COW.N))
		(!R8 (FIELD719.SK FIELD.N))
	)
	(:PRECONDS
		(?I1 (COW714.SK (AT.P ?L1_2)))
		(?I2 (NOT (COW714.SK (AT.P FIELD719.SK))))
	)
	(:STEPS
		(E720.SK
   (COW714.SK
    (OUT.ADV ((ADV-A (TO.P FIELD719.SK)) ((ADV-A (FROM.P ?L1)) GO.563.V)))
    FIELD719.SK))
		(E724.SK (COW714.SK FIND.562.V SPOT728.SK))
		(E732.SK (COW714.SK EAT.564.V GRASS735.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (COW714.SK (HAVE.V GRASS735.SK))))
		(?P2 (NOT (COW714.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E720.SK BEFORE E724.SK))
		(!W2 (E724.SK BEFORE E732.SK))
		(!W3 (E732.SK (SAME-TIME NOW179)))
		(!W4 (E736.SK (BEFORE NOW179)))
		(!W5 (E724.SK (SAME-TIME NOW178)))
		(!W6 (E731.SK (BEFORE NOW178)))
		(!W7 (E720.SK (BEFORE NOW176)))
	)
)
))))
(setf matches (append matches '(( (5.0 3)
("The cow left the barn." "It went out to the field."
 "The other cows were out in the field." "The cow found a spot of grass."
 "The cow ate the grass.")
(EPI-SCHEMA ((COW714.SK GO_FIND_EAT.678.PR BARN716.SK SPOT728.SK GRASS735.SK)
             ** ?E)
	(:ROLES
		(!R1 (BARN716.SK FIELD.N))
		(!R2 (GRASS735.SK FOOD.N))
		(!R3 (BARN716.SK BARN.N))
		(!R4 (E713.SK (RIGHT-AFTER U174)))
		(!R5 (SPOT728.SK (OF.P (K GRASS.N))))
		(!R6 (SPOT728.SK SPOT.N))
		(!R7 (E724.SK (RIGHT-AFTER U177)))
		(!R8 (COW714.SK COW.N))
		(!R9 (GRASS735.SK GRASS.N))
		(!R10 (E732.SK (RIGHT-AFTER U178)))
	)
	(:PRECONDS
		(?I1 (COW714.SK (AT.P ?L1_2)))
		(?I2 (NOT (COW714.SK (AT.P BARN716.SK))))
	)
	(:STEPS
		(E713.SK
   (COW714.SK
    (OUT.ADV ((ADV-A (TO.P BARN716.SK)) ((ADV-A (FROM.P ?L1)) GO.563.V)))
    BARN716.SK))
		(E724.SK (COW714.SK FIND.562.V SPOT728.SK))
		(E732.SK (COW714.SK EAT.564.V GRASS735.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (COW714.SK (HAVE.V GRASS735.SK))))
		(?P2 (NOT (COW714.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E713.SK BEFORE E724.SK))
		(!W2 (E724.SK BEFORE E732.SK))
		(!W3 (E713.SK (SAME-TIME NOW175)))
		(!W4 (E717.SK (BEFORE NOW175)))
		(!W5 (E724.SK (SAME-TIME NOW178)))
		(!W6 (E731.SK (BEFORE NOW178)))
		(!W7 (E732.SK (SAME-TIME NOW179)))
		(!W8 (E736.SK (BEFORE NOW179)))
	)
)
))))
(setf matches (append matches '(( (5.0 3)
("The cow left the barn." "It went out to the field."
 "The other cows were out in the field." "The cow found a spot of grass."
 "The cow ate the grass.")
(EPI-SCHEMA ((COW714.SK GO_FIND_EAT.684.PR BARN716.SK SPOT728.SK GRASS735.SK)
             ** ?E)
	(:ROLES
		(!R1 (BARN716.SK FIELD.N))
		(!R2 (GRASS735.SK FOOD.N))
		(!R3 (BARN716.SK BARN.N))
		(!R4 (E713.SK (RIGHT-AFTER U174)))
		(!R5 (SPOT728.SK SPOT.N))
		(!R6 (SPOT728.SK (OF.P (K GRASS.N))))
		(!R7 (E724.SK (RIGHT-AFTER U177)))
		(!R8 (COW714.SK COW.N))
		(!R9 (GRASS735.SK GRASS.N))
		(!R10 (E732.SK (RIGHT-AFTER U178)))
	)
	(:PRECONDS
		(?I1 (COW714.SK (AT.P ?L1_2)))
		(?I2 (NOT (COW714.SK (AT.P BARN716.SK))))
	)
	(:STEPS
		(E717.SK
   (COW714.SK
    (OUT.ADV ((ADV-A (TO.P BARN716.SK)) ((ADV-A (FROM.P ?L1)) GO.563.V)))
    BARN716.SK))
		(E724.SK (COW714.SK FIND.562.V SPOT728.SK))
		(E732.SK (COW714.SK EAT.564.V GRASS735.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (COW714.SK (HAVE.V GRASS735.SK))))
		(?P2 (NOT (COW714.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E717.SK BEFORE E724.SK))
		(!W2 (E724.SK BEFORE E732.SK))
		(!W3 (E717.SK (BEFORE NOW175)))
		(!W4 (E713.SK (SAME-TIME NOW175)))
		(!W5 (E724.SK (SAME-TIME NOW178)))
		(!W6 (E731.SK (BEFORE NOW178)))
		(!W7 (E732.SK (SAME-TIME NOW179)))
		(!W8 (E736.SK (BEFORE NOW179)))
	)
)
))))

; story 36:
	; "Shelley wanted a new cat."
	; "She went to the pet store."
	; "She found a nice cat."
	; "Shelley bought the cat and things for the cat."
	; "She loved her cat."
discarding schema GO.591.V learned from this story
; best schemas are:
; GO.278.V
; GET.848.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; GET.1322.V
; GO.90.V
(setf matches (append matches '(( (3.905 3)
("Shelley wanted a new cat." "She went to the pet store."
 "She found a nice cat." "Shelley bought the cat and things for the cat."
 "She loved her cat.")
(EPI-SCHEMA ((CAT742.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE748.SK)) GO.710.V))
              STORE748.SK)
             ** E749.SK)
	(:ROLES
		(!R1 (CAT742.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE748.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE748.SK)))
		(!R5 (?X_A PET.N))
		(!R6 (CAT742.SK NEW.A))
		(!R7 (CAT742.SK CAT.N))
		(!R8 (STORE748.SK ((NN PET.N) STORE.N)))
		(!R9 (CAT755.SK (PERTAIN-TO CAT742.SK)))
		(!R10 (CAT755.SK NICE.A))
		(!R11 (CAT755.SK CAT.N))
	)
	(:GOALS
		(?G1 (CAT742.SK (WANT.V (KA ((ADV-A (AT.P STORE748.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT742.SK (AT.P ?L1)))
		(?I2 (NOT (CAT742.SK (AT.P STORE748.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CAT742.SK (AT.P ?L1))))
		(?P2 (CAT742.SK (AT.P STORE748.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E749.SK))
		(!W2 (?I2 BEFORE E749.SK))
		(!W3 (?P1 AFTER E749.SK))
		(!W4 (?P2 AFTER E749.SK))
		(!W5 (?G1 CAUSE-OF E749.SK))
		(!W6 (?G1 (BEFORE ?X_E)))
		(!W7 (E749.SK (BEFORE ?X_G)))
		(!W8 (E749.SK (BEFORE NOW181)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 3)
("Shelley wanted a new cat." "She went to the pet store."
 "She found a nice cat." "Shelley bought the cat and things for the cat."
 "She loved her cat.")
(EPI-SCHEMA ((CAT742.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE748.SK)) ((ADV-A (FROM.P ?L1)) GO.724.V)))
              STORE748.SK)
             ** E749.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE748.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE748.SK)))
		(!R4 (CAT742.SK AGENT.N))
		(!R5 (STORE748.SK STORE.N))
		(!R6 (CAT742.SK CAT.N))
		(!R7 (CAT742.SK NEW.A))
		(!R8 (STORE748.SK ((NN PET.N) STORE.N)))
		(!R9 (CAT755.SK NICE.A))
		(!R10 (CAT755.SK CAT.N))
		(!R11 (CAT755.SK (PERTAIN-TO CAT742.SK)))
	)
	(:GOALS
		(?G1 (CAT742.SK (WANT.V (KA ((ADV-A (AT.P STORE748.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT742.SK (AT.P ?L1)))
		(?I2 (NOT (CAT742.SK (AT.P STORE748.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CAT742.SK (AT.P ?L1))))
		(?P2 (CAT742.SK (AT.P STORE748.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E749.SK))
		(!W2 (?I2 BEFORE E749.SK))
		(!W3 (?P1 AFTER E749.SK))
		(!W4 (?P2 AFTER E749.SK))
		(!W5 (?G1 CAUSE-OF E749.SK))
		(!W6 (E749.SK (BEFORE ?X_D)))
		(!W7 (E749.SK (BEFORE NOW181)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 37:
	; "A girl went to play with her friends."
	; "She went across the street."
	; "The parents went over to get her."
	; "She was lost."
	; "They found her in their home."
discarding schema GO.658.V learned from this story
; best schemas are:
; RUN.401.V
; GO.212.V
; GET.517.V
; GET.660.V
; GO.1084.V
(setf matches (append matches '(( (2.905 5)
("A girl went to play with her friends." "She went across the street."
 "The parents went over to get her." "She was lost."
 "They found her in their home.")
(EPI-SCHEMA ((GIRL765.SK
              ((ADV-A (FOR.P (KA (GET.V (K HELP.N)))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.725.V)))
              ?L2)
             ** E770.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (GIRL765.SK FRIEND.N))
		(!R5 (GIRL765.SK (PERTAIN-TO GIRL765.SK)))
		(!R6 (GIRL765.SK FEMALE.A))
		(!R7 (GIRL765.SK AGENT.N))
		(!R8 (E770.SK (RIGHT-AFTER ?X_A)))
		(!R9 (FRIEND769.SK GIRL.N))
		(!R10 (FRIEND769.SK HEAD.N))
		(!R11 (FRIEND769.SK (PLUR FRIEND.N)))
		(!R12 (FRIEND769.SK HOME.N))
		(!R13 (FRIEND769.SK (PERTAIN-TO THEY.PRO)))
		(!R14 (FRIEND769.SK (PERTAIN-TO GIRL765.SK)))
		(!R15 (GIRL765.SK GIRL.N))
		(!R16 (GIRL765.SK PERSON.N))
	)
	(:GOALS
		(?G1 (GIRL765.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL765.SK (AT.P ?L1)))
		(?I2 (NOT (GIRL765.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL765.SK (AT.P ?L1))))
		(?P2 (GIRL765.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E770.SK))
		(!W2 (?I2 BEFORE E770.SK))
		(!W3 (?P1 AFTER E770.SK))
		(!W4 (?P2 AFTER E770.SK))
		(!W5 (?G1 CAUSE-OF E770.SK))
		(!W6 (E770.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E770.SK (BEFORE NOW185)))
	)
	(:CERTAINTIES
		(!C1 (!R16 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R15 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R16 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R15 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R16 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C7 (!R15 CERTAIN-TO-DEGREE (/ 1 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5751388 2)
("A girl went to play with her friends." "She went across the street."
 "The parents went over to get her." "She was lost."
 "They found her in their home.")
(EPI-SCHEMA ((GIRL765.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FRIEND769.SK)) PLAY.V))))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.726.V)))
              ?X_C)
             ** E770.SK)
	(:ROLES
		(!R1 (GIRL765.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (PARENT784.SK (PLUR PERSON.N)))
		(!R6 (GIRL765.SK MAN.N))
		(!R7 (PARENT784.SK WOMAN.N))
		(!R8 (FRIEND769.SK (PLUR FRIEND.N)))
		(!R9 (FRIEND769.SK HOME.N))
		(!R10 (FRIEND769.SK (PERTAIN-TO GIRL765.SK)))
		(!R11 (GIRL765.SK GIRL.N))
		(!R12 (GIRL765.SK ADULT.N))
		(!R13 (FRIEND769.SK (PERTAIN-TO THEY.PRO)))
		(!R14 (PARENT784.SK (PLUR PARENT.N)))
	)
	(:GOALS
		(?G1 (GIRL765.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL765.SK (AT.P ?L1)))
		(?I2 (NOT (GIRL765.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL765.SK (AT.P ?L1))))
		(?P2 (GIRL765.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E770.SK))
		(!W2 (?I2 BEFORE E770.SK))
		(!W3 (?P1 AFTER E770.SK))
		(!W4 (?P2 AFTER E770.SK))
		(!W5 (?G1 CAUSE-OF E770.SK))
		(!W6 (E770.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E770.SK (BEFORE NOW185)))
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
(setf matches (append matches '(( (3.2136734 3)
("A girl went to play with her friends." "She went across the street."
 "The parents went over to get her." "She was lost."
 "They found her in their home.")
(EPI-SCHEMA ((GIRL765.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FRIEND769.SK)) PLAY.V))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-A (OFF.P STREET772.SK)) GO.755.V))))
              ?L2)
             ** E770.SK)
	(:ROLES
		(!R1 (GIRL765.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (GIRL765.SK FRIEND.N))
		(!R6 (STREET772.SK ROAD.N))
		(!R7 (GIRL765.SK (PERTAIN-TO GIRL765.SK)))
		(!R8 (FRIEND769.SK CAR.N))
		(!R9 (FRIEND769.SK (PLUR FRIEND.N)))
		(!R10 (FRIEND769.SK HOME.N))
		(!R11 (FRIEND769.SK (PERTAIN-TO GIRL765.SK)))
		(!R12 (GIRL765.SK GIRL.N))
		(!R13 (GIRL765.SK PERSON.N))
		(!R14 (FRIEND769.SK (PERTAIN-TO THEY.PRO)))
		(!R15 (STREET772.SK STREET.N))
	)
	(:GOALS
		(?G1 (GIRL765.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL765.SK (AT.P ?L1)))
		(?I2 (NOT (GIRL765.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL765.SK (AT.P ?L1))))
		(?P2 (GIRL765.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E770.SK))
		(!W2 (?I2 BEFORE E770.SK))
		(!W3 (?P1 AFTER E770.SK))
		(!W4 (?P2 AFTER E770.SK))
		(!W5 (?G1 CAUSE-OF E770.SK))
		(!W6 (E770.SK (BEFORE ?X_F)))
		(!W7 (E770.SK (BEFORE NOW185)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 3)))
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

; story 38:
	; "Fred wanted a phone."
	; "He never had had one before."
	; "So he went and got one."
	; "But when he turned it on it didn't work."
	; "He was duped."
discarding schema GET.672.V learned from this story
discarding schema GO.673.V learned from this story
; best schemas are:
; GO_GET_NIL.677.PR
; GET.324.V
; FOLLOW.709.V
; RUN.401.V
(setf matches (append matches '(( (2.5 1)
("Fred wanted a phone." "He never had had one before."
 "So he went and got one." "But when he turned it on it didn't work."
 "He was duped.")
(EPI-SCHEMA ((FRED.NAME GO_GET_NIL.757.PR ?L PRED?797.SK) ** ?E)
	(:ROLES
		(!R1 (PRED?797.SK INANIMATE_OBJECT.N))
		(!R2 (NOT (FRED.NAME = PRED?797.SK)))
		(!R3 (FRED.NAME AGENT.N))
		(!R4 (PRED?797.SK PRED?.N))
		(!R5 (E800.SK (AT-OR-BEFORE NOW192)))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1_2)))
		(?I2 (NOT (FRED.NAME (AT.P ?L))))
	)
	(:STEPS
		(E798.SK (FRED.NAME ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L)) GO.756.V)) ?L))
		(E799.SK (FRED.NAME GET.672.V PRED?797.SK (AT.P-ARG ?L2)))
	)
	(:POSTCONDS
		(?P1 (FRED.NAME HAVE.V PRED?797.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E798.SK BEFORE E799.SK))
		(!W2 (E798.SK (CONSEC E799.SK)))
		(!W3 (E799.SK (DURING E795.SK)))
		(!W4 (E798.SK (DURING E795.SK)))
		(!W5 (E795.SK (BEFORE NOW192)))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_A<- E798.SK) = PHONE787.SK))
		(!S2 ((?X_C<- E798.SK) = FRED.NAME))
		(!S3 ((?X_D<- E798.SK) = E790.SK))
		(!S4 ((?X_G<- E798.SK) = NOW190))
		(!S5 ((?L<- E798.SK) = ?L))
		(!S6 ((?E1<- E798.SK) = E798.SK))
	)
)
))))
(setf matches (append matches '(( (2.5 1)
("Fred wanted a phone." "He never had had one before."
 "So he went and got one." "But when he turned it on it didn't work."
 "He was duped.")
(EPI-SCHEMA ((FRED.NAME GO_GET_NIL.762.PR ?L PRED?797.SK) ** ?E)
	(:ROLES
		(!R1 (PRED?797.SK INANIMATE_OBJECT.N))
		(!R2 (NOT (FRED.NAME = PRED?797.SK)))
		(!R3 (FRED.NAME AGENT.N))
		(!R4 (PRED?797.SK PRED?.N))
		(!R5 (E800.SK (AT-OR-BEFORE NOW192)))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1_2)))
		(?I2 (NOT (FRED.NAME (AT.P ?L))))
	)
	(:STEPS
		(E798.SK (FRED.NAME ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L)) GO.673.V)) ?L))
		(E799.SK (FRED.NAME GET.761.V PRED?797.SK (AT.P-ARG ?L2)))
	)
	(:POSTCONDS
		(?P1 (FRED.NAME HAVE.V PRED?797.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E798.SK BEFORE E799.SK))
		(!W2 (E799.SK (DURING E795.SK)))
		(!W3 (E798.SK (DURING E795.SK)))
		(!W4 (E798.SK (CONSEC E799.SK)))
		(!W5 (E795.SK (BEFORE NOW192)))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_C<- E799.SK) = PHONE787.SK))
		(!S2 ((?X_D<- E799.SK) = FRED.NAME))
		(!S3 ((?X_E<- E799.SK) = E790.SK))
		(!S4 ((?X_G<- E799.SK) = NOW190))
		(!S5 ((?X_B<- E799.SK) = PRED?797.SK))
		(!S6 ((?L2<- E799.SK) = ?L2))
		(!S7 ((?E2<- E799.SK) = E799.SK))
	)
)
))))
(setf matches (append matches '(( (1.5 2)
("Fred wanted a phone." "He never had had one before."
 "So he went and got one." "But when he turned it on it didn't work."
 "He was duped.")
(EPI-SCHEMA ((FRED.NAME GO_GET_NIL.759.PR ?L PRED?797.SK) ** ?E)
	(:ROLES
		(!R1 (PRED?797.SK INANIMATE_OBJECT.N))
		(!R2 (NOT (FRED.NAME = PRED?797.SK)))
		(!R3 (FRED.NAME AGENT.N))
		(!R4 (PRED?797.SK PRED?.N))
		(!R5 (E800.SK (AT-OR-BEFORE NOW192)))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1_2)))
		(?I2 (NOT (FRED.NAME (AT.P ?L))))
	)
	(:STEPS
		(E798.SK (FRED.NAME ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L)) GO.758.V)) ?L))
		(E800.SK (FRED.NAME GET.672.V PRED?797.SK (AT.P-ARG ?L2)))
	)
	(:POSTCONDS
		(?P1 (FRED.NAME HAVE.V PRED?797.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E798.SK BEFORE E800.SK))
		(!W2 (E798.SK (DURING E795.SK)))
		(!W3 (E799.SK (DURING E795.SK)))
		(!W4 (E798.SK (CONSEC E799.SK)))
		(!W5 (E795.SK (BEFORE NOW192)))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_C<- E798.SK) = PHONE787.SK))
		(!S2 ((?X_D<- E798.SK) = FRED.NAME))
		(!S3 ((?X_G<- E798.SK) = E790.SK))
		(!S4 ((?X_J<- E798.SK) = NOW190))
		(!S5 ((?L<- E798.SK) = ?L))
		(!S6 ((?E1<- E798.SK) = E798.SK))
	)
)
))))
(setf matches (append matches '(( (4.0 4)
("Fred wanted a phone." "He never had had one before."
 "So he went and got one." "But when he turned it on it didn't work."
 "He was duped.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_C)) FOLLOW.786.V)) ?X_C)
             ** E798.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (FRED.NAME MAN.N))
		(!R6 (?X_C SOUND.N))
		(!R7 (PHONE787.SK ((NN PHONE.N) RING.N)))
		(!R8 (PHONE787.SK (PERTAIN-TO FRED.NAME)))
		(!R9 (E800.SK (AT-OR-BEFORE NOW192)))
		(!R10 (PHONE787.SK PHONE.N))
	)
	(:GOALS
		(E790.SK (FRED.NAME (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRED.NAME (AT.P ?L1))))
		(?P2 (FRED.NAME (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E798.SK))
		(!W2 (?I2 BEFORE E798.SK))
		(!W3 (?P1 AFTER E798.SK))
		(!W4 (?P2 AFTER E798.SK))
		(!W5 (E790.SK CAUSE-OF E798.SK))
		(!W6 (E798.SK (BEFORE ?X_E)))
		(!W7 (E790.SK (BEFORE NOW190)))
		(!W8 (E798.SK (CONSEC E799.SK)))
		(!W9 (E799.SK (DURING E795.SK)))
		(!W10 (E798.SK (DURING E795.SK)))
		(!W11 (E795.SK (BEFORE NOW192)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.5 2)
("Fred wanted a phone." "He never had had one before."
 "So he went and got one." "But when he turned it on it didn't work."
 "He was duped.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (FOR.P (KA (GET.V (K HELP.N)))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.787.V)))
              ?L2)
             ** E798.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRED.NAME FRIEND.N))
		(!R6 (FRED.NAME (PERTAIN-TO ?X_D)))
		(!R7 (?X_D FEMALE.A))
		(!R8 (?X_D AGENT.N))
		(!R9 (E798.SK (RIGHT-AFTER ?X_A)))
		(!R10 (?X_B GIRL.N))
		(!R11 (?X_B (PERTAIN-TO ?X_D)))
		(!R12 (?X_B HEAD.N))
		(!R13 (?X_C HEAD.N))
		(!R14 (?X_C (PERTAIN-TO ?X_D)))
		(!R15 (PHONE787.SK PHONE.N))
		(!R16 (E800.SK (AT-OR-BEFORE NOW192)))
	)
	(:GOALS
		(E790.SK (FRED.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
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
		(!W1 (?I1 BEFORE E798.SK))
		(!W2 (?I2 BEFORE E798.SK))
		(!W3 (?P1 AFTER E798.SK))
		(!W4 (?P2 AFTER E798.SK))
		(!W5 (E790.SK CAUSE-OF E798.SK))
		(!W6 (E798.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E790.SK (BEFORE NOW190)))
		(!W9 (E798.SK (CONSEC E799.SK)))
		(!W10 (E799.SK (DURING E795.SK)))
		(!W11 (E798.SK (DURING E795.SK)))
		(!W12 (E795.SK (BEFORE NOW192)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 39:
	; "Logan is going to the park."
	; "He plays in the sand."
	; "He runs all around the grass."
	; "He climbs and climbs."
	; "He swings very high."
discarding schema GO.678.V learned from this story
; best schemas are:
; GO.340.V
; GO.168.V
; GO.658.V
; GO.504.V
; GO_FIND_EAT.566.PR
(setf matches (append matches '(( (3.7302296 3)
("Logan is going to the park." "He plays in the sand."
 "He runs all around the grass." "He climbs and climbs." "He swings very high.")
(EPI-SCHEMA ((LOGAN.NAME
              ((ADV-A
                (FOR.P (KA ((ADV-A (WITH.P (SET-OF ?X_A ?X_F))) PLAY.V))))
               ((ADV-A (TO.P PARK806.SK)) ((ADV-A (FROM.P ?L1)) GO.788.V)))
              PARK806.SK)
             ** E805.SK)
	(:ROLES
		(!R1 (LOGAN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (PARK806.SK LOCATION.N))
		(!R4 (NOT (?L1 = PARK806.SK)))
		(!R5 (?X_A LAP.N))
		(!R6 (?X_A (PERTAIN-TO ?X_A)))
		(!R7 (?X_B (IMPINGES-ON E805.SK)))
		(!R8 (?X_C (PERTAIN-TO LOGAN.NAME)))
		(!R9 (?X_D DOLL.N))
		(!R10 (?X_D (PERTAIN-TO LOGAN.NAME)))
		(!R11 (SAND808.SK SPADE.N))
		(!R12 (SAND808.SK (PERTAIN-TO ?X_F)))
		(!R13 (?X_G (IMPINGES-ON ?X_J)))
		(!R14 (PARK806.SK PARK.N))
		(!R15 (SAND808.SK SAND.N))
		(!R16 (SAND808.SK MATERIAL.N))
	)
	(:GOALS
		(?G1 (LOGAN.NAME (WANT.V (KA ((ADV-A (AT.P PARK806.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LOGAN.NAME (AT.P ?L1)))
		(?I2 (NOT (LOGAN.NAME (AT.P PARK806.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (LOGAN.NAME (AT.P ?L1))))
		(?P2 (LOGAN.NAME (AT.P PARK806.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E805.SK))
		(!W2 (?I2 BEFORE E805.SK))
		(!W3 (?P1 AFTER E805.SK))
		(!W4 (?P2 AFTER E805.SK))
		(!W5 (?G1 CAUSE-OF E805.SK))
		(!W6 (E805.SK (AT-ABOUT ?X_K)))
		(!W7 (?X_J (AT-ABOUT ?X_K)))
		(!W8 (E805.SK (AT-ABOUT NOW195)))
	)
	(:CERTAINTIES
		(!C1 (!R16 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R11 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R15 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.2302294 2)
("Logan is going to the park." "He plays in the sand."
 "He runs all around the grass." "He climbs and climbs." "He swings very high.")
(EPI-SCHEMA ((LOGAN.NAME
              ((ADV-A (WITH.P ?X_A))
               ((ADV-A (TO.P PARK806.SK)) ((ADV-A (FROM.P ?L1)) GO.789.V)))
              PARK806.SK)
             ** E805.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (PARK806.SK LOCATION.N))
		(!R3 (NOT (?L1 = PARK806.SK)))
		(!R4 (LOGAN.NAME AGENT.N))
		(!R5 (?X_A FRIEND.N))
		(!R6 (?X_B (PERTAIN-TO LOGAN.NAME)))
		(!R7 (?X_B FRIEND.N))
		(!R8 (?X_C (PERTAIN-TO LOGAN.NAME)))
		(!R9 (?X_C CURFEW.N))
		(!R10 (PARK806.SK PARK.N))
	)
	(:GOALS
		(?G1 (LOGAN.NAME (WANT.V (KA ((ADV-A (AT.P PARK806.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LOGAN.NAME (AT.P ?L1)))
		(?I2 (NOT (LOGAN.NAME (AT.P PARK806.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (LOGAN.NAME (AT.P ?L1))))
		(?P2 (LOGAN.NAME (AT.P PARK806.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E805.SK))
		(!W2 (?I2 BEFORE E805.SK))
		(!W3 (?P1 AFTER E805.SK))
		(!W4 (?P2 AFTER E805.SK))
		(!W5 (?G1 CAUSE-OF E805.SK))
		(!W6 (E805.SK (BEFORE ?X_G)))
		(!W7 (E805.SK (AT-ABOUT NOW195)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.7302296 3)
("Logan is going to the park." "He plays in the sand."
 "He runs all around the grass." "He climbs and climbs." "He swings very high.")
(EPI-SCHEMA ((LOGAN.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_A)) PLAY.V))))
               ((ADV-A (TO.P PARK806.SK)) ((ADV-A (FROM.P ?L1)) GO.790.V)))
              PARK806.SK)
             ** E805.SK)
	(:ROLES
		(!R1 (LOGAN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (PARK806.SK LOCATION.N))
		(!R4 (NOT (?L1 = PARK806.SK)))
		(!R5 (?X_A (PLUR FRIEND.N)))
		(!R6 (?X_A HOME.N))
		(!R7 (?X_A (PERTAIN-TO LOGAN.NAME)))
		(!R8 (LOGAN.NAME GIRL.N))
		(!R9 (?X_A (PERTAIN-TO ?X_B)))
		(!R10 (PARK806.SK PARK.N))
	)
	(:GOALS
		(?G1 (LOGAN.NAME (WANT.V (KA ((ADV-A (AT.P PARK806.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LOGAN.NAME (AT.P ?L1)))
		(?I2 (NOT (LOGAN.NAME (AT.P PARK806.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (LOGAN.NAME (AT.P ?L1))))
		(?P2 (LOGAN.NAME (AT.P PARK806.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E805.SK))
		(!W2 (?I2 BEFORE E805.SK))
		(!W3 (?P1 AFTER E805.SK))
		(!W4 (?P2 AFTER E805.SK))
		(!W5 (?G1 CAUSE-OF E805.SK))
		(!W6 (E805.SK (BEFORE ?X_E)))
		(!W7 (E805.SK (AT-ABOUT NOW195)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.2302294 2)
("Logan is going to the park." "He plays in the sand."
 "He runs all around the grass." "He climbs and climbs." "He swings very high.")
(EPI-SCHEMA ((LOGAN.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P PARK806.SK)) ((ADV-A (FROM.P ?L1)) GO.791.V)))
              PARK806.SK)
             ** E805.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (PARK806.SK LOCATION.N))
		(!R3 (NOT (?L1 = PARK806.SK)))
		(!R4 (PARK806.SK ((NN WATER.N) PARK.N)))
		(!R5 (LOGAN.NAME AGENT.N))
		(!R6 (PARK806.SK PARK.N))
	)
	(:GOALS
		(?G1 (LOGAN.NAME (WANT.V (KA ((ADV-A (AT.P PARK806.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LOGAN.NAME (AT.P ?L1)))
		(?I2 (NOT (LOGAN.NAME (AT.P PARK806.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (LOGAN.NAME (AT.P ?L1))))
		(?P2 (LOGAN.NAME (AT.P PARK806.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E805.SK))
		(!W2 (?I2 BEFORE E805.SK))
		(!W3 (?P1 AFTER E805.SK))
		(!W4 (?P2 AFTER E805.SK))
		(!W5 (?G1 CAUSE-OF E805.SK))
		(!W6 (E805.SK (BEFORE ?X_D)))
		(!W7 (E805.SK (AT-ABOUT NOW195)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (0.5 4)
("Logan is going to the park." "He plays in the sand."
 "He runs all around the grass." "He climbs and climbs." "He swings very high.")
(EPI-SCHEMA ((LOGAN.NAME GO_FIND_EAT.794.PR ?X_A PARK806.SK GRASS811.SK) ** ?E)
	(:ROLES
		(!R1 (?X_A FIELD.N))
		(!R2 (PARK806.SK (OF.P (K GRASS.N))))
		(!R3 (PARK806.SK SPOT.N))
		(!R4 (LOGAN.NAME COW.N))
		(!R5 (GRASS811.SK FOOD.N))
		(!R6 (GRASS811.SK GRASS.N))
	)
	(:PRECONDS
		(?I1 (LOGAN.NAME (AT.P ?L1_2)))
		(?I2 (NOT (LOGAN.NAME (AT.P ?X_A))))
	)
	(:STEPS
		(E812.SK
   (LOGAN.NAME (OUT.ADV ((ADV-A (TO.P ?X_A)) ((ADV-A (FROM.P ?L1)) GO.563.V)))
    ?X_A))
		(?E2 (LOGAN.NAME FIND.792.V PARK806.SK))
		(?E3 (LOGAN.NAME EAT.564.V GRASS811.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (LOGAN.NAME (HAVE.V GRASS811.SK))))
		(?P2 (NOT (LOGAN.NAME HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E812.SK BEFORE ?E2))
		(!W2 (?E2 BEFORE ?E3))
		(!W3 (E813.SK (AT-ABOUT NOW198)))
		(!W4 (E812.SK (AT-ABOUT NOW198)))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_B<- ?E2) = LOGAN.NAME))
		(!S2 ((?X_C<- ?E2) = PARK806.SK))
		(!S3 ((?E2<- ?E2) = ?E2))
	)
)
))))
(setf matches (append matches '(( (0.5 4)
("Logan is going to the park." "He plays in the sand."
 "He runs all around the grass." "He climbs and climbs." "He swings very high.")
(EPI-SCHEMA ((LOGAN.NAME GO_FIND_EAT.795.PR ?X_A PARK806.SK GRASS811.SK) ** ?E)
	(:ROLES
		(!R1 (?X_A FIELD.N))
		(!R2 (PARK806.SK (OF.P (K GRASS.N))))
		(!R3 (PARK806.SK SPOT.N))
		(!R4 (LOGAN.NAME COW.N))
		(!R5 (GRASS811.SK FOOD.N))
		(!R6 (GRASS811.SK GRASS.N))
	)
	(:PRECONDS
		(?I1 (LOGAN.NAME (AT.P ?L1_2)))
		(?I2 (NOT (LOGAN.NAME (AT.P ?X_A))))
	)
	(:STEPS
		(E813.SK
   (LOGAN.NAME (OUT.ADV ((ADV-A (TO.P ?X_A)) ((ADV-A (FROM.P ?L1)) GO.563.V)))
    ?X_A))
		(?E2 (LOGAN.NAME FIND.792.V PARK806.SK))
		(?E3 (LOGAN.NAME EAT.564.V GRASS811.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (LOGAN.NAME (HAVE.V GRASS811.SK))))
		(?P2 (NOT (LOGAN.NAME HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E813.SK BEFORE ?E2))
		(!W2 (?E2 BEFORE ?E3))
		(!W3 (E813.SK (AT-ABOUT NOW198)))
		(!W4 (E812.SK (AT-ABOUT NOW198)))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_B<- ?E2) = LOGAN.NAME))
		(!S2 ((?X_C<- ?E2) = PARK806.SK))
		(!S3 ((?E2<- ?E2) = ?E2))
	)
)
))))
(setf matches (append matches '(( (1.5 6)
("Logan is going to the park." "He plays in the sand."
 "He runs all around the grass." "He climbs and climbs." "He swings very high.")
(EPI-SCHEMA ((LOGAN.NAME GO_FIND_EAT.793.PR PARK806.SK PARK806.SK GRASS811.SK)
             ** ?E)
	(:ROLES
		(!R1 (PARK806.SK FIELD.N))
		(!R2 (PARK806.SK (OF.P (K GRASS.N))))
		(!R3 (PARK806.SK SPOT.N))
		(!R4 (LOGAN.NAME COW.N))
		(!R5 (GRASS811.SK FOOD.N))
		(!R6 (PARK806.SK PARK.N))
		(!R7 (PARK806.SK TRACT.N))
		(!R8 (GRASS811.SK GRASS.N))
	)
	(:PRECONDS
		(?I1 (LOGAN.NAME (AT.P ?L1_2)))
		(?I2 (NOT (LOGAN.NAME (AT.P PARK806.SK))))
	)
	(:STEPS
		(E805.SK
   (LOGAN.NAME
    (OUT.ADV ((ADV-A (TO.P PARK806.SK)) ((ADV-A (FROM.P ?L1)) GO.563.V)))
    PARK806.SK))
		(?E2 (LOGAN.NAME FIND.792.V PARK806.SK))
		(?E3 (LOGAN.NAME EAT.564.V GRASS811.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (LOGAN.NAME (HAVE.V GRASS811.SK))))
		(?P2 (NOT (LOGAN.NAME HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E805.SK BEFORE ?E2))
		(!W2 (?E2 BEFORE ?E3))
		(!W3 (E805.SK (AT-ABOUT NOW195)))
	)
	(:CERTAINTIES
		(!C1 (!R7 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R1 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_B<- ?E2) = LOGAN.NAME))
		(!S2 ((?X_C<- ?E2) = PARK806.SK))
		(!S3 ((?E2<- ?E2) = ?E2))
	)
)
))))

; story 40:
	; "The boy walked the dog."
	; "The dog saw a cat."
	; "The dog chased after the cat."
	; "The boy had to let go of the dog."
	; "The dog ran away after the cat."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; GET.826.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; WALK.989.V
; PLAY.991.V
(setf matches (append matches '(( (1.43625 1)
("The boy walked the dog." "The dog saw a cat." "The dog chased after the cat."
 "The boy had to let go of the dog." "The dog ran away after the cat.")
(EPI-SCHEMA ((DOG818.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.801.V
              (KA ((THERE.ADV SEE.V) CAT827.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) CAT827.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (DOG818.SK AGENT.N))
		(!R4 (DOG818.SK DOG.N))
		(!R5 (CAT827.SK CAT.N))
		(!R6 (E824.SK (RIGHT-AFTER U200)))
	)
	(:GOALS
		(?G1 (DOG818.SK (WANT.V (THAT (NOT (DOG818.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (DOG818.SK (THERE.ADV SEE.V) CAT827.SK)) CAUSE-OF
    (KE (DOG818.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E824.SK (DOG818.SK (THERE.ADV (THERE.ADV SEE.V)) CAT827.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E824.SK))
		(!W2 (E824.SK (BEFORE ?X_D)))
		(!W3 (E824.SK (SAME-TIME NOW201)))
		(!W4 (E828.SK (BEFORE NOW201)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.43625 1)
("The boy walked the dog." "The dog saw a cat." "The dog chased after the cat."
 "The boy had to let go of the dog." "The dog ran away after the cat.")
(EPI-SCHEMA ((DOG818.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.802.V
              (KA ((THERE.ADV SEE.V) CAT827.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) CAT827.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (DOG818.SK AGENT.N))
		(!R4 (DOG818.SK DOG.N))
		(!R5 (CAT827.SK CAT.N))
		(!R6 (E824.SK (RIGHT-AFTER U200)))
	)
	(:GOALS
		(?G1 (DOG818.SK (WANT.V (THAT (NOT (DOG818.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (DOG818.SK (THERE.ADV SEE.V) CAT827.SK)) CAUSE-OF
    (KE (DOG818.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E828.SK (DOG818.SK (THERE.ADV (THERE.ADV SEE.V)) CAT827.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E828.SK))
		(!W2 (E828.SK (BEFORE ?X_D)))
		(!W3 (E828.SK (BEFORE NOW201)))
		(!W4 (E824.SK (SAME-TIME NOW201)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.43625 1)
("The boy walked the dog." "The dog saw a cat." "The dog chased after the cat."
 "The boy had to let go of the dog." "The dog ran away after the cat.")
(EPI-SCHEMA ((DOG818.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.805.V
              (KA ((THERE.ADV SEE.V) CAT827.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) CAT827.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (DOG818.SK AGENT.N))
		(!R4 (?X_A (PERTAIN-TO DOG818.SK)))
		(!R5 (?X_A MOM.N))
		(!R6 (?X_B (PERTAIN-TO DOG818.SK)))
		(!R7 (?X_B SLED.N))
		(!R8 (DOG818.SK DOG.N))
		(!R9 (CAT827.SK CAT.N))
		(!R10 (E824.SK (RIGHT-AFTER U200)))
	)
	(:GOALS
		(?G1 (DOG818.SK (WANT.V (THAT (NOT (DOG818.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (DOG818.SK (THERE.ADV SEE.V) CAT827.SK)) CAUSE-OF
    (KE (DOG818.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E824.SK (DOG818.SK (THERE.ADV (THERE.ADV SEE.V)) CAT827.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E824.SK))
		(!W2 (E824.SK (BEFORE ?X_D)))
		(!W3 (E824.SK (BEFORE ?X_G)))
		(!W4 (E824.SK (SAME-TIME NOW201)))
		(!W5 (E828.SK (BEFORE NOW201)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.43625 1)
("The boy walked the dog." "The dog saw a cat." "The dog chased after the cat."
 "The boy had to let go of the dog." "The dog ran away after the cat.")
(EPI-SCHEMA ((DOG818.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.806.V
              (KA ((THERE.ADV SEE.V) CAT827.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) CAT827.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (DOG818.SK AGENT.N))
		(!R4 (?X_A (PERTAIN-TO DOG818.SK)))
		(!R5 (?X_A MOM.N))
		(!R6 (?X_B (PERTAIN-TO DOG818.SK)))
		(!R7 (?X_B SLED.N))
		(!R8 (CAT827.SK CAT.N))
		(!R9 (DOG818.SK DOG.N))
		(!R10 (E824.SK (RIGHT-AFTER U200)))
	)
	(:GOALS
		(?G1 (DOG818.SK (WANT.V (THAT (NOT (DOG818.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (DOG818.SK (THERE.ADV SEE.V) CAT827.SK)) CAUSE-OF
    (KE (DOG818.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E828.SK (DOG818.SK (THERE.ADV (THERE.ADV SEE.V)) CAT827.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E828.SK))
		(!W2 (E828.SK (BEFORE ?X_D)))
		(!W3 (E828.SK (BEFORE ?X_G)))
		(!W4 (E828.SK (BEFORE NOW201)))
		(!W5 (E824.SK (SAME-TIME NOW201)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 41:
	; "The boy got ready for church."
	; "He did not want to go."
	; "He hid in his closet."
	; "His mom found him."
	; "His mom made him go to church."
; best schemas are:
; GO.423.V
; GO.742.V
; GO_FIND_EAT.566.PR
; COME.917.V
; COME.917.V
; COME.917.V

; story 42:
	; "The fly landed on the wall."
	; "The man tried to hit it."
	; "The fly got away."
	; "The man woke up his son."
	; "His son got the fly."
discarding schema GET.713.V learned from this story
; best schemas are:
; GET.1260.V
; GET.50.V
; GO.212.V
; GO.423.V
; GET.741.V
(setf matches (append matches '(( (2.405 3)
("The fly landed on the wall." "The man tried to hit it." "The fly got away."
 "The man woke up his son." "His son got the fly.")
(EPI-SCHEMA ((FLY858.SK ((ADV-A (ON.P WALL860.SK)) LAND.817.V)
              (KA
               ((ADV-A
                 (WITH.P
                  (K
                   (L #:G1792470
                    (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
                (BE.PASV CATCH.V)))
              (AT.P-ARG ?L))
             ** E857.SK)
	(:ROLES
		(!R1 (FLY858.SK AGENT.N))
		(!R2
   ((KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_A (TOO.ADV MANY.A)) (?X_B FISH.N))))))
      (BE.PASV CATCH.V)))
    INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4
   (NOT
    (FLY858.SK =
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_C (TOO.ADV MANY.A)) (?X_D FISH.N))))))
       (BE.PASV CATCH.V))))))
		(!R5 (FLY858.SK MAN.N))
		(!R6 (MAN864.SK LIMIT.N))
		(!R7 (MAN864.SK (PERTAIN-TO FLY858.SK)))
		(!R8 (WALL860.SK WALL.N))
		(!R9 (FLY858.SK FLY.N))
		(!R10 (E857.SK (RIGHT-AFTER U209)))
		(!R11 (MAN864.SK MAN.N))
		(!R12 (MAN864.SK SON.N))
		(!R13 (MAN864.SK PERSON.N))
		(!R14 (MAN864.SK (PERTAIN-TO HE.PRO)))
		(!R15 (HE.PRO MALE.A))
		(!R16 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1
   (FLY858.SK
    (WANT.V
     (THAT
      (FLY858.SK
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
    (FLY858.SK HAVE.V
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_H (TOO.ADV MANY.A)) (?X_I FISH.N))))))
       (BE.PASV CATCH.V))))))
		(?I2 (FLY858.SK (AT.P ?L)))
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
   (FLY858.SK HAVE.V
    (KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_M (TOO.ADV MANY.A)) (?X_N FISH.N))))))
      (BE.PASV CATCH.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E857.SK))
		(!W2 (?I1 PRECOND-OF E857.SK))
		(!W3 (?I2 PRECOND-OF E857.SK))
		(!W4 (?I3 PRECOND-OF E857.SK))
		(!W5 (?P1 POSTCOND-OF E857.SK))
		(!W6 (E857.SK (BEFORE ?X_P)))
		(!W7 (E857.SK (SAME-TIME NOW210)))
		(!W8 (E862.SK (BEFORE NOW210)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R11 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 3)
("The fly landed on the wall." "The man tried to hit it." "The fly got away."
 "The man woke up his son." "His son got the fly.")
(EPI-SCHEMA ((FLY858.SK ((ADV-A (ON.P WALL860.SK)) LAND.818.V)
              (KA
               ((ADV-A
                 (WITH.P
                  (K
                   (L #:G1792470
                    (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
                (BE.PASV CATCH.V)))
              (AT.P-ARG ?L))
             ** E857.SK)
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
    (FLY858.SK =
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_C (TOO.ADV MANY.A)) (?X_D FISH.N))))))
       (BE.PASV CATCH.V))))))
		(!R4 (FLY858.SK MAN.N))
		(!R5 (MAN864.SK LIMIT.N))
		(!R6 (MAN864.SK (PERTAIN-TO FLY858.SK)))
		(!R7 (?X_L KINDLE.A))
		(!R8 (?X_L BOOK.N))
		(!R9 (FLY858.SK AGENT.N))
		(!R10 (WALL860.SK WALL.N))
		(!R11 (FLY858.SK FLY.N))
		(!R12 (E857.SK (RIGHT-AFTER U209)))
		(!R13 (MAN864.SK MAN.N))
		(!R14 (MAN864.SK SON.N))
		(!R15 (MAN864.SK PERSON.N))
		(!R16 (MAN864.SK (PERTAIN-TO HE.PRO)))
		(!R17 (HE.PRO MALE.A))
		(!R18 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1
   (FLY858.SK
    (WANT.V
     (THAT
      (FLY858.SK
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
    (FLY858.SK HAVE.V
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_H (TOO.ADV MANY.A)) (?X_I FISH.N))))))
       (BE.PASV CATCH.V))))))
		(?I2 (FLY858.SK (AT.P ?L)))
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
   (FLY858.SK HAVE.V
    (KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_M (TOO.ADV MANY.A)) (?X_N FISH.N))))))
      (BE.PASV CATCH.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E857.SK))
		(!W2 (?I1 PRECOND-OF E857.SK))
		(!W3 (?I2 PRECOND-OF E857.SK))
		(!W4 (?I3 PRECOND-OF E857.SK))
		(!W5 (?P1 POSTCOND-OF E857.SK))
		(!W6 (E857.SK (BEFORE ?X_P)))
		(!W7 (E857.SK (BEFORE ?X_R)))
		(!W8 (E857.SK (SAME-TIME NOW210)))
		(!W9 (E862.SK (BEFORE NOW210)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R13 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.546113 11)
("The fly landed on the wall." "The man tried to hit it." "The fly got away."
 "The man woke up his son." "His son got the fly.")
(EPI-SCHEMA ((FLY858.SK
              ((ADV-A (ON.P WALL860.SK))
               ((ADV-A (FROM.P (K WORK.N))) LAND.838.V))
              (K HOME.N) (AT.P-ARG ?L))
             ** E857.SK)
	(:ROLES
		(!R1 (FLY858.SK AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (FLY858.SK = (K HOME.N))))
		(!R5 (FLY858.SK DAD.N))
		(!R6 (MAN864.SK (PERTAIN-TO FLY858.SK)))
		(!R7 (MAN864.SK CAR.N))
		(!R8 (FLY858.SK (PLUR FRIEND.N)))
		(!R9 (FLY858.SK HOME.N))
		(!R10 (MAN864.SK GIRL.N))
		(!R11 (FLY858.SK (PERTAIN-TO MAN864.SK)))
		(!R12 (FLY858.SK (PERTAIN-TO ?X_C)))
		(!R13 (MAN864.SK STREET.N))
		(!R14 (MAN864.SK ARTIFACT.N))
		(!R15 (WALL860.SK WALL.N))
		(!R16 (FLY858.SK FLY.N))
		(!R17 (E857.SK (RIGHT-AFTER U209)))
		(!R18 (MAN864.SK MAN.N))
		(!R19 (MAN864.SK ADULT.N))
		(!R20 (MAN864.SK SON.N))
		(!R21 (MAN864.SK PERSON.N))
		(!R22 (MAN864.SK (PERTAIN-TO HE.PRO)))
		(!R23 (HE.PRO MALE.A))
		(!R24 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (FLY858.SK (WANT.V (THAT (FLY858.SK (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (FLY858.SK HAVE.V (K HOME.N))))
		(?I2 (FLY858.SK (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (FLY858.SK HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E857.SK))
		(!W2 (?I1 PRECOND-OF E857.SK))
		(!W3 (?I2 PRECOND-OF E857.SK))
		(!W4 (?I3 PRECOND-OF E857.SK))
		(!W5 (?P1 POSTCOND-OF E857.SK))
		(!W6 (E857.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E857.SK (SAME-TIME NOW210)))
		(!W9 (E862.SK (BEFORE NOW210)))
	)
	(:CERTAINTIES
		(!C1 (!R14 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R13 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C6 (!R18 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C7 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C8 (!R10 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C9 (!R21 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C10 (!R20 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C11 (!R21 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R21 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C13 (!R21 CERTAIN-TO-DEGREE (/ 3 3)))
		(!C14 (!R21 CERTAIN-TO-DEGREE (/ 3 3)))
		(!C15 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C16 (!R18 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C17 (!R19 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C18 (!R21 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C19 (!R21 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C20 (!R20 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C21 (!R21 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R21 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C23 (!R21 CERTAIN-TO-DEGREE (/ 3 4)))
		(!C24 (!R21 CERTAIN-TO-DEGREE (/ 3 4)))
		(!C25 (!R21 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C26 (!R21 CERTAIN-TO-DEGREE (/ 3 5)))
		(!C27 (!R21 CERTAIN-TO-DEGREE (/ 3 5)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 43:
	; "My friend came to visit me."
	; "She brought her young son with her."
	; "He was a cute little boy."
	; "We gave him some toys to play with."
	; "We had a great visit."
; best schemas are:
; TAKE.542.V
; COME.605.V
; GET.741.V
; TAKE.413.V
; GO.828.V
; TAKE.302.V
(setf matches (append matches '(( (4.4049997 1)
("My friend came to visit me." "She brought her young son with her."
 "He was a cute little boy." "We gave him some toys to play with."
 "We had a great visit.")
(EPI-SCHEMA ((FRIEND887.SK
              ((ADV-A (FOR.P (KA VISIT.V)))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.866.V)))
              ?L2)
             ** E886.SK)
	(:ROLES
		(!R1 (FRIEND887.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND887.SK (PLUR BROTHER.N)))
		(!R6 (E886.SK (RIGHT-AFTER U214)))
		(!R7 (FRIEND887.SK FRIEND.N))
		(!R8 (FRIEND887.SK (PERTAIN-TO ME904.SK)))
		(!R9 (ME904.SK AGENT.N))
		(!R10 (OBJECT891.SK (PERTAIN-TO FRIEND887.SK)))
	)
	(:GOALS
		(?G1 (FRIEND887.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND887.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND887.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND887.SK (AT.P ?L1))))
		(?P2 (FRIEND887.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E886.SK))
		(!W2 (?I2 BEFORE E886.SK))
		(!W3 (?P1 AFTER E886.SK))
		(!W4 (?P2 AFTER E886.SK))
		(!W5 (?G1 CAUSE-OF E886.SK))
		(!W6 (E886.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (?G1 (BEFORE ?X_I)))
		(!W9 (E886.SK (SAME-TIME NOW215)))
		(!W10 (E889.SK (BEFORE NOW215)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.7662497 11)
("My friend came to visit me." "She brought her young son with her."
 "He was a cute little boy." "We gave him some toys to play with."
 "We had a great visit.")
(EPI-SCHEMA ((FRIEND887.SK
              ((ADV-A (FOR.P (KA (VISIT.V ME904.SK))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P FRIEND887.SK)) (OUT.ADV COME.911.V))))
              FRIEND887.SK)
             ** E886.SK)
	(:ROLES
		(!R1 (FRIEND887.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (FRIEND887.SK LOCATION.N))
		(!R4 (NOT (?L1 = FRIEND887.SK)))
		(!R5 (FRIEND887.SK MAILBOX.N))
		(!R6 (FRIEND887.SK PAPER.N))
		(!R7 (FRIEND887.SK (PERTAIN-TO FRIEND887.SK)))
		(!R8 (OBJECT891.SK ((NN PAPER.N) BOY.N)))
		(!R9 (FRIEND887.SK FLY.N))
		(!R10 (FRIEND887.SK SON.N))
		(!R11 (FRIEND887.SK MAN.N))
		(!R12 (ME904.SK MALE.A))
		(!R13 (E886.SK (RIGHT-AFTER U214)))
		(!R14 (FRIEND887.SK FRIEND.N))
		(!R15 (FRIEND887.SK PERSON.N))
		(!R16 (OBJECT891.SK (PERTAIN-TO FRIEND887.SK)))
		(!R17 (FRIEND887.SK (PERTAIN-TO ME904.SK)))
		(!R18 (ME904.SK AGENT.N))
	)
	(:GOALS
		(?G1 (FRIEND887.SK (WANT.V (KA ((ADV-A (AT.P FRIEND887.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND887.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND887.SK (AT.P FRIEND887.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND887.SK (AT.P ?L1))))
		(?P2 (FRIEND887.SK (AT.P FRIEND887.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E886.SK))
		(!W2 (?I2 BEFORE E886.SK))
		(!W3 (?P1 AFTER E886.SK))
		(!W4 (?P2 AFTER E886.SK))
		(!W5 (?G1 CAUSE-OF E886.SK))
		(!W6 (E886.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E886.SK (SAME-TIME NOW215)))
		(!W9 (E889.SK (BEFORE NOW215)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R10 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C6 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C8 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C9 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C10 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C11 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C13 (!R14 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C14 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C15 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R15 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C17 (!R15 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C18 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C19 (!R14 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C20 (!R15 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R15 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C22 (!R15 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C23 (!R15 CERTAIN-TO-DEGREE (/ 2 6)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 44:
	; "There was a penny on the ground."
	; "My son went to pick it up."
	; "I told him not to get it."
	; "The penny was lying tails up."
	; "We left the penny right there."
discarding schema GO.742.V learned from this story
; best schemas are:
; GO.828.V
; GO.212.V
; TAKE.928.V
; COME.126.V
; FLY.235.V
(setf matches (append matches '(( (6.0053124 9)
("There was a penny on the ground." "My son went to pick it up."
 "I told him not to get it." "The penny was lying tails up."
 "We left the penny right there.")
(EPI-SCHEMA ((SON913.SK
              ((ADV-A (FOR.P (KA (PICK_UP.V PENNY910.SK))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P SON913.SK)) (OUT.ADV GO.931.V))))
              SON913.SK)
             ** E912.SK)
	(:ROLES
		(!R1 (SON913.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (SON913.SK LOCATION.N))
		(!R4 (NOT (?L1 = SON913.SK)))
		(!R5 (SON913.SK MAILBOX.N))
		(!R6 (SON913.SK PAPER.N))
		(!R7 (SON913.SK ((NN PAPER.N) BOY.N)))
		(!R8 (SON913.SK (PERTAIN-TO SON913.SK)))
		(!R9 (SON913.SK FLY.N))
		(!R10 (SON913.SK MAN.N))
		(!R11 (ME921.SK MALE.A))
		(!R12 (PENNY910.SK PENNY.N))
		(!R13 (PENNY910.SK (ON.P GROUND911.SK)))
		(!R14 (GROUND911.SK GROUND.N))
		(!R15 (E912.SK (RIGHT-AFTER U220)))
		(!R16 (ME921.SK AGENT.N))
		(!R17 (SON913.SK SON.N))
		(!R18 (SON913.SK PERSON.N))
		(!R19 (SON913.SK (PERTAIN-TO ME921.SK)))
	)
	(:GOALS
		(?G1 (SON913.SK (WANT.V (KA ((ADV-A (AT.P SON913.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SON913.SK (AT.P ?L1)))
		(?I2 (NOT (SON913.SK (AT.P SON913.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SON913.SK (AT.P ?L1))))
		(?P2 (SON913.SK (AT.P SON913.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E912.SK))
		(!W2 (?I2 BEFORE E912.SK))
		(!W3 (?P1 AFTER E912.SK))
		(!W4 (?P2 AFTER E912.SK))
		(!W5 (?G1 CAUSE-OF E912.SK))
		(!W6 (E912.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E912.SK (SAME-TIME NOW221)))
		(!W9 (E915.SK (BEFORE NOW221)))
	)
	(:CERTAINTIES
		(!C1 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R17 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C4 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R17 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R10 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C8 (!R18 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C9 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C10 (!R10 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C11 (!R17 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C13 (!R17 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C14 (!R18 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C15 (!R18 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C16 (!R18 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C17 (!R17 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C18 (!R18 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C19 (!R18 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C20 (!R18 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C21 (!R17 CERTAIN-TO-DEGREE (/ 1 7)))
		(!C22 (!R18 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C23 (!R18 CERTAIN-TO-DEGREE (/ 2 7)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 1)
("There was a penny on the ground." "My son went to pick it up."
 "I told him not to get it." "The penny was lying tails up."
 "We left the penny right there.")
(EPI-SCHEMA ((SON913.SK
              ((ADV-A (FOR.P (KA (PICK_UP.V PENNY910.SK))))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.932.V)))
              ?X_C)
             ** E912.SK)
	(:ROLES
		(!R1 (SON913.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (?X_A (PLUR PERSON.N)))
		(!R6 (SON913.SK MAN.N))
		(!R7 (?X_A WOMAN.N))
		(!R8 (PENNY910.SK PENNY.N))
		(!R9 (SON913.SK SON.N))
		(!R10 (SON913.SK PERSON.N))
		(!R11 (PENNY910.SK (ON.P GROUND911.SK)))
		(!R12 (GROUND911.SK GROUND.N))
		(!R13 (E912.SK (RIGHT-AFTER U220)))
		(!R14 (SON913.SK (PERTAIN-TO ME921.SK)))
		(!R15 (ME921.SK AGENT.N))
	)
	(:GOALS
		(?G1 (SON913.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SON913.SK (AT.P ?L1)))
		(?I2 (NOT (SON913.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SON913.SK (AT.P ?L1))))
		(?P2 (SON913.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E912.SK))
		(!W2 (?I2 BEFORE E912.SK))
		(!W3 (?P1 AFTER E912.SK))
		(!W4 (?P2 AFTER E912.SK))
		(!W5 (?G1 CAUSE-OF E912.SK))
		(!W6 (E912.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E912.SK (SAME-TIME NOW221)))
		(!W9 (E915.SK (BEFORE NOW221)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 2)
("There was a penny on the ground." "My son went to pick it up."
 "I told him not to get it." "The penny was lying tails up."
 "We left the penny right there.")
(EPI-SCHEMA ((SON913.SK
              ((ADV-A (FOR.P (KA (PICK_UP.V PENNY910.SK))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-A (BY.P ?X_A)) COME.940.V))))
              ?L2)
             ** E912.SK)
	(:ROLES
		(!R1 (SON913.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (SON913.SK FRIEND.N))
		(!R6 (SON913.SK BEST.A))
		(!R7 (?X_A HOUSE.N))
		(!R8 (PENNY910.SK PENNY.N))
		(!R9 (PENNY910.SK (ON.P GROUND911.SK)))
		(!R10 (GROUND911.SK GROUND.N))
		(!R11 (E912.SK (RIGHT-AFTER U220)))
		(!R12 (SON913.SK SON.N))
		(!R13 (SON913.SK PERSON.N))
		(!R14 (SON913.SK (PERTAIN-TO ME921.SK)))
		(!R15 (ME921.SK AGENT.N))
	)
	(:GOALS
		(?G1 (SON913.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SON913.SK (AT.P ?L1)))
		(?I2 (NOT (SON913.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SON913.SK (AT.P ?L1))))
		(?P2 (SON913.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E912.SK))
		(!W2 (?I2 BEFORE E912.SK))
		(!W3 (?P1 AFTER E912.SK))
		(!W4 (?P2 AFTER E912.SK))
		(!W5 (?G1 CAUSE-OF E912.SK))
		(!W6 (E912.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E912.SK (SAME-TIME NOW221)))
		(!W9 (E915.SK (BEFORE NOW221)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C7 (!R12 CERTAIN-TO-DEGREE (/ 1 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 3)
("There was a penny on the ground." "My son went to pick it up."
 "I told him not to get it." "The penny was lying tails up."
 "We left the penny right there.")
(EPI-SCHEMA ((SON913.SK
              ((ADV-A (FOR.P (KA (PICK_UP.V PENNY910.SK))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) (AWAY.ADV FLY.941.V))))
              ?L2)
             ** E912.SK)
	(:ROLES
		(!R1 (SON913.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (SON913.SK ((NN MOTHER.N) BIRD.N)))
		(!R6 (SON913.SK BIRD.N))
		(!R7 (SON913.SK ((NN BABY.N) BIRD.N)))
		(!R8 (PENNY910.SK PENNY.N))
		(!R9 (SON913.SK SON.N))
		(!R10 (PENNY910.SK (ON.P GROUND911.SK)))
		(!R11 (GROUND911.SK GROUND.N))
		(!R12 (E912.SK (RIGHT-AFTER U220)))
		(!R13 (SON913.SK (PERTAIN-TO ME921.SK)))
		(!R14 (ME921.SK AGENT.N))
	)
	(:GOALS
		(?G1 (SON913.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SON913.SK (AT.P ?L1)))
		(?I2 (NOT (SON913.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SON913.SK (AT.P ?L1))))
		(?P2 (SON913.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E912.SK))
		(!W2 (?I2 BEFORE E912.SK))
		(!W3 (?P1 AFTER E912.SK))
		(!W4 (?P2 AFTER E912.SK))
		(!W5 (?G1 CAUSE-OF E912.SK))
		(!W6 (E912.SK (BEFORE ?X_C)))
		(!W7 (E912.SK (SAME-TIME NOW221)))
		(!W8 (E915.SK (BEFORE NOW221)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 45:
	; "The man found a bag on the ground."
	; "He looked inside."
	; "It was groceries."
	; "He brought them home."
	; "He made his wife dinner with them."
discarding schema FIND.773.V learned from this story
; best schemas are:
; GO.828.V
; GET.870.V
; GO.1083.V
; GO.212.V
; TAKE.928.V

; story 46:
	; "I have a cat."
	; "My cat is very mean."
	; "It does not like my other cats."
	; "It fights with my other cats."
	; "I might have to get rid of it."
; best schemas are:
; TAKE.928.V
; TAKE.302.V
; GIVE.194.V
; GET.870.V
; FEED.660.V
; GET.88.V

; story 47:
	; "I went to the store today."
	; "I saw some chips."
	; "They were six dollars."
	; "It was too expensive."
	; "So I did not buy them."
; best schemas are:
; TAKE.1039.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; TAKE.928.V
; GO.828.V
; GET.870.V
; GO.591.V
(setf matches (append matches '(( (1.53125 4)
("I went to the store today." "I saw some chips." "They were six dollars."
 "It was too expensive." "So I did not buy them.")
(EPI-SCHEMA ((ME980.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1081.V
              (KA ((THERE.ADV SEE.V) CHIP974.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) CHIP974.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (CHIP974.SK ((NN MOTHER.N) BIRD.N)))
		(!R4 (CHIP974.SK BIRD.N))
		(!R5 (CHIP974.SK ((NN BABY.N) BIRD.N)))
		(!R6 (ME980.SK AGENT.N))
		(!R7 (CHIP974.SK (PLUR CHIP.N)))
	)
	(:GOALS
		(?G1 (ME980.SK (WANT.V (THAT (NOT (ME980.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME980.SK (THERE.ADV SEE.V) CHIP974.SK)) CAUSE-OF
    (KE (ME980.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E975.SK (ME980.SK (THERE.ADV (THERE.ADV SEE.V)) CHIP974.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E975.SK))
		(!W2 (E975.SK (BEFORE ?X_D)))
		(!W3 (E975.SK (BEFORE ?X_E)))
		(!W4 (E975.SK (BEFORE NOW236)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.955625 10)
("I went to the store today." "I saw some chips." "They were six dollars."
 "It was too expensive." "So I did not buy them.")
(EPI-SCHEMA ((ME980.SK
              (OUT.ADV
               ((ADV-A (TO.P TODAY969.SK)) ((ADV-A (FROM.P ?L1)) GO.1084.V)))
              TODAY969.SK)
             ** E970.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (TODAY969.SK LOCATION.N))
		(!R3 (NOT (?L1 = TODAY969.SK)))
		(!R4 (TODAY969.SK MAILBOX.N))
		(!R5 (ME980.SK MAN.N))
		(!R6 (E970.SK (RIGHT-AFTER ?X_A)))
		(!R7 (TODAY969.SK PAPER.N))
		(!R8 (?X_C ((NN PAPER.N) BOY.N)))
		(!R9 (?X_C (PERTAIN-TO ME980.SK)))
		(!R10 (ME980.SK FLY.N))
		(!R11 (TODAY969.SK SON.N))
		(!R12 (TODAY969.SK MAN.N))
		(!R13 (TODAY969.SK PERSON.N))
		(!R14 (TODAY969.SK (PERTAIN-TO ME980.SK)))
		(!R15 (ME980.SK MALE.A))
		(!R16 (TODAY969.SK ((NN STORE.N) TODAY.N)))
		(!R17 (ME980.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME980.SK (WANT.V (KA ((ADV-A (AT.P TODAY969.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME980.SK (AT.P ?L1)))
		(?I2 (NOT (ME980.SK (AT.P TODAY969.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME980.SK (AT.P ?L1))))
		(?P2 (ME980.SK (AT.P TODAY969.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E970.SK))
		(!W2 (?I2 BEFORE E970.SK))
		(!W3 (?P1 AFTER E970.SK))
		(!W4 (?P2 AFTER E970.SK))
		(!W5 (?G1 CAUSE-OF E970.SK))
		(!W6 (E970.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E970.SK (BEFORE NOW235)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R12 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R13 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.7278125 5)
("I went to the store today." "I saw some chips." "They were six dollars."
 "It was too expensive." "So I did not buy them.")
(EPI-SCHEMA ((ME980.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TODAY969.SK)) GO.1086.V))
              TODAY969.SK)
             ** E970.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (TODAY969.SK LOCATION.N))
		(!R3 (NOT (?L1 = TODAY969.SK)))
		(!R4 (ME980.SK CAT.N))
		(!R5 (ME980.SK NEW.A))
		(!R6 (TODAY969.SK ((NN PET.N) STORE.N)))
		(!R7 (?X_A CAT.N))
		(!R8 (?X_A NICE.A))
		(!R9 (?X_A (PERTAIN-TO ME980.SK)))
		(!R10 (TODAY969.SK ((NN STORE.N) TODAY.N)))
		(!R11 (ME980.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME980.SK (WANT.V (KA ((ADV-A (AT.P TODAY969.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME980.SK (AT.P ?L1)))
		(?I2 (NOT (ME980.SK (AT.P TODAY969.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME980.SK (AT.P ?L1))))
		(?P2 (ME980.SK (AT.P TODAY969.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E970.SK))
		(!W2 (?I2 BEFORE E970.SK))
		(!W3 (?P1 AFTER E970.SK))
		(!W4 (?P2 AFTER E970.SK))
		(!W5 (?G1 CAUSE-OF E970.SK))
		(!W6 (E970.SK (BEFORE ?X_E)))
		(!W7 (E970.SK (BEFORE NOW235)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 48:
	; "The family was going on a cruise."
	; "They were excited."
	; "It was ten days long."
	; "They went on the cruise."
	; "They had a great time."
; best schemas are:
; GET.870.V
; TAKE.928.V
; TAKE.895.V
; SEARCH.695.V
; FIND.696.V
; TAKE.624.V

; story 49:
	; "Jacob has long hair."
	; "He wants to get it cut."
	; "He heads down to the barber."
	; "He has his hair cut."
	; "Jacob loves his new hair."
; best schemas are:
; GET.218.V
; GO.387.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
; GET.73.V
; GET.517.V
; GIVE.V

; story 50:
	; "I wanted to run twenty miles after work."
	; "I had to hurry."
	; "It was about to be dark."
	; "I made it to 12 miles."
	; "Then I had to stop."
; best schemas are:
; TAKE.1039.V
; TAKE.928.V
; GET.870.V
; GO.1084.V
; TAKE.302.V
; GO.828.V

; story 51:
	; "Lynn gets a new dog."
	; "She loves her dog."
	; "She is out one evening walking him."
	; "Her dog runs off away from her."
	; "She cannot catch him and he runs away."
discarding schema GET.826.V learned from this story
; best schemas are:
; GET.518.V
; GET.848.V
; GET.1224.V
; GET.1260.V
; GET.50.V
(setf matches (append matches '(( (4.5 4)
("Lynn gets a new dog." "She loves her dog."
 "She is out one evening walking him." "Her dog runs off away from her."
 "She cannot catch him and he runs away.")
(EPI-SCHEMA ((LYNN.NAME GET.1126.V DOG1025.SK (AT.P-ARG ?L)) ** E1026.SK)
	(:ROLES
		(!R1 (LYNN.NAME AGENT.N))
		(!R2 (DOG1025.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (LYNN.NAME = DOG1025.SK)))
		(!R5 (DOG1025.SK SWEATSHIRT.N))
		(!R6 (DOG1025.SK DOG.N))
		(!R7 (DOG1025.SK NEW.A))
		(!R8 (DOG1030.SK (PERTAIN-TO LYNN.NAME)))
		(!R9 (DOG1030.SK DOG.N))
		(!R10 (EVENING1035.SK (WALK.V LYNN.NAME)))
		(!R11 (EVENING1035.SK EVENING.N))
	)
	(:GOALS
		(?G1 (LYNN.NAME (WANT.V (THAT (LYNN.NAME (HAVE.V DOG1025.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (LYNN.NAME HAVE.V DOG1025.SK)))
		(?I2 (LYNN.NAME (AT.P ?L)))
		(?I3 (DOG1025.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (LYNN.NAME HAVE.V DOG1025.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1026.SK))
		(!W2 (?I1 PRECOND-OF E1026.SK))
		(!W3 (?I2 PRECOND-OF E1026.SK))
		(!W4 (?I3 PRECOND-OF E1026.SK))
		(!W5 (?P1 POSTCOND-OF E1026.SK))
		(!W6 (E1026.SK (BEFORE ?X_D)))
		(!W7 (?G1 (BEFORE ?X_F)))
		(!W8 (E1026.SK (AT-ABOUT NOW255)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0 2)
("Lynn gets a new dog." "She loves her dog."
 "She is out one evening walking him." "Her dog runs off away from her."
 "She cannot catch him and he runs away.")
(EPI-SCHEMA ((LYNN.NAME GET.1127.V
              (KA
               ((ADV-A
                 (WITH.P
                  (K
                   (L #:G1792470
                    (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
                (BE.PASV CATCH.V)))
              (AT.P-ARG ?L))
             ** E1026.SK)
	(:ROLES
		(!R1 (LYNN.NAME AGENT.N))
		(!R2
   ((KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_A (TOO.ADV MANY.A)) (?X_B FISH.N))))))
      (BE.PASV CATCH.V)))
    INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4
   (NOT
    (LYNN.NAME =
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_C (TOO.ADV MANY.A)) (?X_D FISH.N))))))
       (BE.PASV CATCH.V))))))
		(!R5 (LYNN.NAME MAN.N))
		(!R6 (DOG1030.SK LIMIT.N))
		(!R7 (DOG1025.SK DOG.N))
		(!R8 (DOG1025.SK NEW.A))
		(!R9 (DOG1030.SK (PERTAIN-TO LYNN.NAME)))
		(!R10 (DOG1030.SK DOG.N))
		(!R11 (EVENING1035.SK (WALK.V LYNN.NAME)))
		(!R12 (EVENING1035.SK EVENING.N))
	)
	(:GOALS
		(?G1
   (LYNN.NAME
    (WANT.V
     (THAT
      (LYNN.NAME
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
    (LYNN.NAME HAVE.V
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_H (TOO.ADV MANY.A)) (?X_I FISH.N))))))
       (BE.PASV CATCH.V))))))
		(?I2 (LYNN.NAME (AT.P ?L)))
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
   (LYNN.NAME HAVE.V
    (KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_M (TOO.ADV MANY.A)) (?X_N FISH.N))))))
      (BE.PASV CATCH.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1026.SK))
		(!W2 (?I1 PRECOND-OF E1026.SK))
		(!W3 (?I2 PRECOND-OF E1026.SK))
		(!W4 (?I3 PRECOND-OF E1026.SK))
		(!W5 (?P1 POSTCOND-OF E1026.SK))
		(!W6 (E1026.SK (BEFORE ?X_P)))
		(!W7 (E1026.SK (AT-ABOUT NOW255)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0 2)
("Lynn gets a new dog." "She loves her dog."
 "She is out one evening walking him." "Her dog runs off away from her."
 "She cannot catch him and he runs away.")
(EPI-SCHEMA ((LYNN.NAME GET.1128.V
              (KA
               ((ADV-A
                 (WITH.P
                  (K
                   (L #:G1792470
                    (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
                (BE.PASV CATCH.V)))
              (AT.P-ARG ?L))
             ** E1026.SK)
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
    (LYNN.NAME =
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_C (TOO.ADV MANY.A)) (?X_D FISH.N))))))
       (BE.PASV CATCH.V))))))
		(!R4 (LYNN.NAME MAN.N))
		(!R5 (DOG1030.SK LIMIT.N))
		(!R6 (?X_L KINDLE.A))
		(!R7 (?X_L BOOK.N))
		(!R8 (LYNN.NAME AGENT.N))
		(!R9 (DOG1025.SK DOG.N))
		(!R10 (DOG1025.SK NEW.A))
		(!R11 (DOG1030.SK (PERTAIN-TO LYNN.NAME)))
		(!R12 (DOG1030.SK DOG.N))
		(!R13 (EVENING1035.SK (WALK.V LYNN.NAME)))
		(!R14 (EVENING1035.SK EVENING.N))
	)
	(:GOALS
		(?G1
   (LYNN.NAME
    (WANT.V
     (THAT
      (LYNN.NAME
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
    (LYNN.NAME HAVE.V
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_H (TOO.ADV MANY.A)) (?X_I FISH.N))))))
       (BE.PASV CATCH.V))))))
		(?I2 (LYNN.NAME (AT.P ?L)))
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
   (LYNN.NAME HAVE.V
    (KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_M (TOO.ADV MANY.A)) (?X_N FISH.N))))))
      (BE.PASV CATCH.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1026.SK))
		(!W2 (?I1 PRECOND-OF E1026.SK))
		(!W3 (?I2 PRECOND-OF E1026.SK))
		(!W4 (?I3 PRECOND-OF E1026.SK))
		(!W5 (?P1 POSTCOND-OF E1026.SK))
		(!W6 (E1026.SK (BEFORE ?X_P)))
		(!W7 (E1026.SK (BEFORE ?X_R)))
		(!W8 (E1026.SK (AT-ABOUT NOW255)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 52:
	; "Michael was very shy."
	; "He would only play by himself."
	; "One day I asked him to play with me."
	; "We have been friends ever since."
	; "Michael is my best friend."
; best schemas are:
; TAKE.10.V
; GET.333.V
; PLAY.669.V
; PLAY.670.V
; GO.671.V
; GET.821.V

; story 53:
	; "Susie tried on the dress."
	; "She found it very uncomfortable."
	; "She wasn't sure she wanted to even wear it."
	; "Susie put it away."
	; "She never wore it again."
; best schemas are:
; SPRINT.1181.V
; MAKE.721.V
; PLAY.724.V
; MOVE.342.V
; MOVE.501.V
; MOVE.109.V
(setf matches (append matches '(( (2.5 0)
("Susie tried on the dress." "She found it very uncomfortable."
 "She wasn't sure she wanted to even wear it." "Susie put it away."
 "She never wore it again.")
(EPI-SCHEMA ((SUSIE.NAME
              ((ADV-A (ON.P DRESS1051.SK))
               ((ADV-A (TO.P ?X_B)) ((ADV-A (FROM.P ?L1)) TRY.1142.V)))
              ?X_B)
             ** E1052.SK)
	(:ROLES
		(!R1 (SUSIE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_B LOCATION.N))
		(!R4 (NOT (?L1 = ?X_B)))
		(!R5 (?X_B CITY.N))
		(!R6 (?X_B NEW.A))
		(!R7 (DRESS1051.SK DRESS.N))
	)
	(:GOALS
		(?G1 (SUSIE.NAME (WANT.V (KA ((ADV-A (AT.P ?X_B)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SUSIE.NAME (AT.P ?L1)))
		(?I2 (NOT (SUSIE.NAME (AT.P ?X_B))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SUSIE.NAME (AT.P ?L1))))
		(?P2 (SUSIE.NAME (AT.P ?X_B)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1052.SK))
		(!W2 (?I2 BEFORE E1052.SK))
		(!W3 (?P1 AFTER E1052.SK))
		(!W4 (?P2 AFTER E1052.SK))
		(!W5 (?G1 CAUSE-OF E1052.SK))
		(!W6 (E1052.SK (BEFORE ?X_D)))
		(!W7 (E1052.SK (BEFORE NOW265)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("Susie tried on the dress." "She found it very uncomfortable."
 "She wasn't sure she wanted to even wear it." "Susie put it away."
 "She never wore it again.")
(EPI-SCHEMA ((SUSIE.NAME
              ((ADV-A (ON.P DRESS1051.SK))
               ((ADV-A (TO.P ?X_B)) ((ADV-A (FROM.P ?L1)) TRY.1143.V)))
              ?X_B)
             ** E1052.SK)
	(:ROLES
		(!R1 (SUSIE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_B LOCATION.N))
		(!R4 (NOT (?L1 = ?X_B)))
		(!R5 (?X_B TOWN.N))
		(!R6 (?X_B NEW.A))
		(!R7 (DRESS1051.SK DRESS.N))
	)
	(:GOALS
		(?G1 (SUSIE.NAME (WANT.V (KA ((ADV-A (AT.P ?X_B)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SUSIE.NAME (AT.P ?L1)))
		(?I2 (NOT (SUSIE.NAME (AT.P ?X_B))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SUSIE.NAME (AT.P ?L1))))
		(?P2 (SUSIE.NAME (AT.P ?X_B)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1052.SK))
		(!W2 (?I2 BEFORE E1052.SK))
		(!W3 (?P1 AFTER E1052.SK))
		(!W4 (?P2 AFTER E1052.SK))
		(!W5 (?G1 CAUSE-OF E1052.SK))
		(!W6 (E1052.SK (BEFORE ?X_D)))
		(!W7 (E1052.SK (BEFORE NOW265)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("Susie tried on the dress." "She found it very uncomfortable."
 "She wasn't sure she wanted to even wear it." "Susie put it away."
 "She never wore it again.")
(EPI-SCHEMA ((SUSIE.NAME
              ((ADV-A (ON.P DRESS1051.SK))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) TRY.1144.V)))
              ?X_C)
             ** E1052.SK)
	(:ROLES
		(!R1 (SUSIE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (?X_C CITY.N))
		(!R6 (?X_C NEW.A))
		(!R7 (?X_A HOMETOWN.N))
		(!R8 (?X_A (PERTAIN-TO SUSIE.NAME)))
		(!R9 (DRESS1051.SK DRESS.N))
	)
	(:GOALS
		(?G1 (SUSIE.NAME (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SUSIE.NAME (AT.P ?L1)))
		(?I2 (NOT (SUSIE.NAME (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SUSIE.NAME (AT.P ?L1))))
		(?P2 (SUSIE.NAME (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1052.SK))
		(!W2 (?I2 BEFORE E1052.SK))
		(!W3 (?P1 AFTER E1052.SK))
		(!W4 (?P2 AFTER E1052.SK))
		(!W5 (?G1 CAUSE-OF E1052.SK))
		(!W6 (E1052.SK (BEFORE ?X_E)))
		(!W7 (E1052.SK (BEFORE NOW265)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 54:
	; "It was very hot outside."
	; "So we wanted to go where it was cool."
	; "We walked into the building."
	; "But then we walked out."
	; "The building was far too cold."
; best schemas are:
; TAKE.1039.V
; TAKE.928.V
; GET.870.V
; GO.1084.V
; GO.828.V
; TAKE.302.V
(setf matches (append matches '(( (2.955625 1)
("It was very hot outside." "So we wanted to go where it was cool."
 "We walked into the building." "But then we walked out."
 "The building was far too cold.")
(EPI-SCHEMA ((WE1071.SK
              ((ADV-A (INTO.P BUILDING1065.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?X_D)) (OUT.ADV WALK.1147.V))))
              ?X_D)
             ** E1066.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?X_D LOCATION.N))
		(!R3 (NOT (?L1 = ?X_D)))
		(!R4 (?X_D MAILBOX.N))
		(!R5 (WE1071.SK MAN.N))
		(!R6 (E1066.SK (RIGHT-AFTER ?X_A)))
		(!R7 (?X_D PAPER.N))
		(!R8 (?X_C ((NN PAPER.N) BOY.N)))
		(!R9 (?X_C (PERTAIN-TO WE1071.SK)))
		(!R10 (WE1071.SK FLY.N))
		(!R11 (?X_D SON.N))
		(!R12 (?X_D MAN.N))
		(!R13 (?X_D PERSON.N))
		(!R14 (?X_D (PERTAIN-TO WE1071.SK)))
		(!R15 (WE1071.SK MALE.A))
		(!R16 (?X_D ((NN STORE.N) TODAY.N)))
		(!R17 (WE1071.SK AGENT.N))
		(!R18 (BUILDING1065.SK BUILDING.N))
	)
	(:GOALS
		(?G1 (WE1071.SK (WANT.V (KA ((ADV-A (AT.P ?X_D)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (WE1071.SK (AT.P ?L1)))
		(?I2 (NOT (WE1071.SK (AT.P ?X_D))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (WE1071.SK (AT.P ?L1))))
		(?P2 (WE1071.SK (AT.P ?X_D)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1066.SK))
		(!W2 (?I2 BEFORE E1066.SK))
		(!W3 (?P1 AFTER E1066.SK))
		(!W4 (?P2 AFTER E1066.SK))
		(!W5 (?G1 CAUSE-OF E1066.SK))
		(!W6 (E1066.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1066.SK (BEFORE ?X_F)))
		(!W9 (E1066.SK (BEFORE NOW272)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R12 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R13 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.955625 1)
("It was very hot outside." "So we wanted to go where it was cool."
 "We walked into the building." "But then we walked out."
 "The building was far too cold.")
(EPI-SCHEMA ((WE1071.SK
              ((ADV-A (INTO.P BUILDING1065.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?X_E)) (OUT.ADV WALK.1148.V))))
              ?X_E)
             ** E1066.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?X_E LOCATION.N))
		(!R3 (NOT (?L1 = ?X_E)))
		(!R4 (?X_E MAILBOX.N))
		(!R5 (WE1071.SK MAN.N))
		(!R6 (E1066.SK (RIGHT-AFTER ?X_A)))
		(!R7 (?X_E PAPER.N))
		(!R8 (?X_C ((NN PAPER.N) BOY.N)))
		(!R9 (?X_C (PERTAIN-TO WE1071.SK)))
		(!R10 (WE1071.SK FLY.N))
		(!R11 (?X_E SON.N))
		(!R12 (?X_E MAN.N))
		(!R13 (?X_E PERSON.N))
		(!R14 (?X_E (PERTAIN-TO WE1071.SK)))
		(!R15 (WE1071.SK MALE.A))
		(!R16 (BUILDING1065.SK BUILDING.N))
		(!R17 (WE1071.SK AGENT.N))
	)
	(:GOALS
		(?G1 (WE1071.SK (WANT.V (KA ((ADV-A (AT.P ?X_E)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (WE1071.SK (AT.P ?L1)))
		(?I2 (NOT (WE1071.SK (AT.P ?X_E))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (WE1071.SK (AT.P ?L1))))
		(?P2 (WE1071.SK (AT.P ?X_E)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1066.SK))
		(!W2 (?I2 BEFORE E1066.SK))
		(!W3 (?P1 AFTER E1066.SK))
		(!W4 (?P2 AFTER E1066.SK))
		(!W5 (?G1 CAUSE-OF E1066.SK))
		(!W6 (E1066.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1066.SK (BEFORE NOW272)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R12 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R13 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 55:
	; "Sam's cat ran away one day."
	; "Sam never got along with it."
	; "He tried to look for a day or two."
	; "Sam quickly gave up the search."
	; "He got a new cat instead."
discarding schema GET.848.V learned from this story
; best schemas are:
; TAKE.1039.V
; TAKE.928.V
; GET.870.V
; GO.591.V
; GET.1322.V
(setf matches (append matches '(( (5.5017385 12)
("Sam's cat ran away one day." "Sam never got along with it."
 "He tried to look for a day or two." "Sam quickly gave up the search."
 "He got a new cat instead.")
(EPI-SCHEMA ((HE.PRO ((ADV-A (FROM.P (K WORK.N))) GET.1177.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E1091.SK)
	(:ROLES
		(!R1 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = (K HOME.N))))
		(!R4 (HE.PRO DAD.N))
		(!R5 (E1091.SK (RIGHT-AFTER ?X_A)))
		(!R6 (CAT1075.SK (PERTAIN-TO HE.PRO)))
		(!R7 (CAT1075.SK CAR.N))
		(!R8 (HE.PRO (PLUR FRIEND.N)))
		(!R9 (HE.PRO HOME.N))
		(!R10 (SAM.NAME GIRL.N))
		(!R11 (HE.PRO (PERTAIN-TO SAM.NAME)))
		(!R12 (HE.PRO (PERTAIN-TO ?X_C)))
		(!R13 (CAT1075.SK STREET.N))
		(!R14 (CAT1075.SK ARTIFACT.N))
		(!R15 (?X_B VISIT.N))
		(!R16 (?X_B GREAT.A))
		(!R17 (SAM.NAME FRIEND.N))
		(!R18 (SAM.NAME PERSON.N))
		(!R19 (CAT1075.SK AGENT.N))
		(!R20 (SAM.NAME (PERTAIN-TO CAT1075.SK)))
		(!R21 (CAT1090.SK CAT.N))
		(!R22 (CAT1090.SK NEW.A))
		(!R23 (HE.PRO MALE.A))
		(!R24 (HE.PRO AGENT.N))
		(!R25 (CAT1075.SK CAT.N))
		(!R26 (CAT1075.SK (PERTAIN-TO SAM.NAME)))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V (K HOME.N))))
		(?I2 (HE.PRO (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1091.SK))
		(!W2 (?I1 PRECOND-OF E1091.SK))
		(!W3 (?I2 PRECOND-OF E1091.SK))
		(!W4 (?I3 PRECOND-OF E1091.SK))
		(!W5 (?P1 POSTCOND-OF E1091.SK))
		(!W6 (E1091.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (?P1 (BEFORE ?X_L)))
		(!W9 (E1091.SK (BEFORE NOW279)))
	)
	(:CERTAINTIES
		(!C1 (!R14 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R13 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R17 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C7 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C9 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C10 (!R17 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C11 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 56:
	; "Tom was out for a walk."
	; "It started to rain."
	; "His socks got wet."
	; "Tom felt gross about it."
	; "He went home and changed."
discarding schema GO.866.V learned from this story
; best schemas are:
; GO.30.V
; GO.292.V
; GO.658.V
; GO.1024.V
; GO.480.V
(setf matches (append matches '(( (3.0 0)
("Tom was out for a walk." "It started to rain." "His socks got wet."
 "Tom felt gross about it." "He went home and changed.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A HOME.N)
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-A (FOR.P WALK1093.SK)) GO.1191.V))))
              ?L2)
             ** E1100.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (SOCKS1097.SK (PLUR SOCK.N)))
		(!R6 (SOCKS1097.SK (PERTAIN-TO TOM.NAME)))
		(!R7 (E1101.SK (AT-OR-BEFORE NOW284)))
		(!R8 (WALK1093.SK WALK.N))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P ?L1))))
		(?P2 (TOM.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1100.SK))
		(!W2 (?I2 BEFORE E1100.SK))
		(!W3 (?P1 AFTER E1100.SK))
		(!W4 (?P2 AFTER E1100.SK))
		(!W5 (?G1 CAUSE-OF E1100.SK))
		(!W6 (E1100.SK (BEFORE ?X_D)))
		(!W7 (E1100.SK (BEFORE NOW284)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 2)
("Tom was out for a walk." "It started to rain." "His socks got wet."
 "Tom felt gross about it." "He went home and changed.")
(EPI-SCHEMA ((TOM.NAME
              (INSTEAD.ADV
               ((ADV-A HOME.N)
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_B)) GO.1192.V))))
              ?L2)
             ** E1100.SK)
	(:ROLES
		(!R1 (?X_B LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?X_B = ?L2)))
		(!R4 (TOM.NAME AGENT.N))
		(!R5 (WALK1093.SK (PERTAIN-TO TOM.NAME)))
		(!R6 (WALK1093.SK WAY.N))
		(!R7 (?X_B CORNER.N))
		(!R8 (SOCKS1097.SK (PLUR SOCK.N)))
		(!R9 (SOCKS1097.SK (PERTAIN-TO TOM.NAME)))
		(!R10 (E1101.SK (AT-OR-BEFORE NOW284)))
		(!R11 (WALK1093.SK WALK.N))
		(!R12 (WALK1093.SK ACTION.N))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?X_B)))
		(?I2 (NOT (TOM.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P ?X_B))))
		(?P2 (TOM.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1100.SK))
		(!W2 (?I2 BEFORE E1100.SK))
		(!W3 (?P1 AFTER E1100.SK))
		(!W4 (?P2 AFTER E1100.SK))
		(!W5 (?G1 CAUSE-OF E1100.SK))
		(!W6 (E1100.SK (BEFORE ?X_E)))
		(!W7 (E1100.SK (BEFORE NOW284)))
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
(setf matches (append matches '(( (3.0 3)
("Tom was out for a walk." "It started to rain." "His socks got wet."
 "Tom felt gross about it." "He went home and changed.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A HOME.N)
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P SOCKS1097.SK)) PLAY.V))))
                  GO.1193.V))))
              ?L2)
             ** E1100.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (SOCKS1097.SK (PLUR FRIEND.N)))
		(!R6 (SOCKS1097.SK HOME.N))
		(!R7 (TOM.NAME GIRL.N))
		(!R8 (E1101.SK (AT-OR-BEFORE NOW284)))
		(!R9 (SOCKS1097.SK (PLUR SOCK.N)))
		(!R10 (SOCKS1097.SK (PERTAIN-TO TOM.NAME)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P ?L1))))
		(?P2 (TOM.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1100.SK))
		(!W2 (?I2 BEFORE E1100.SK))
		(!W3 (?P1 AFTER E1100.SK))
		(!W4 (?P2 AFTER E1100.SK))
		(!W5 (?G1 CAUSE-OF E1100.SK))
		(!W6 (E1100.SK (BEFORE ?X_E)))
		(!W7 (E1100.SK (BEFORE NOW284)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.405 2)
("Tom was out for a walk." "It started to rain." "His socks got wet."
 "Tom felt gross about it." "He went home and changed.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A HOME.N)
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 (OUT.ADV ((ADV-A (FOR.P WALK1093.SK)) GO.1194.V)))))
              ?L2)
             ** E1100.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (WALK1093.SK PASS.N))
		(!R6 (WALK1093.SK BALL.N))
		(!R7 (SOCKS1097.SK ARM.N))
		(!R8 (E1101.SK (AT-OR-BEFORE NOW284)))
		(!R9 (WALK1093.SK WALK.N))
		(!R10 (SOCKS1097.SK (PLUR SOCK.N)))
		(!R11 (SOCKS1097.SK (PERTAIN-TO TOM.NAME)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P ?L1))))
		(?P2 (TOM.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1100.SK))
		(!W2 (?I2 BEFORE E1100.SK))
		(!W3 (?P1 AFTER E1100.SK))
		(!W4 (?P2 AFTER E1100.SK))
		(!W5 (?G1 CAUSE-OF E1100.SK))
		(!W6 (E1100.SK (BEFORE ?X_E)))
		(!W7 (E1100.SK (BEFORE NOW284)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("Tom was out for a walk." "It started to rain." "His socks got wet."
 "Tom felt gross about it." "He went home and changed.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A HOME.N)
               ((ADV-A (TO.P ?X_B)) ((ADV-A (FROM.P ?L1)) GO.1195.V)))
              ?X_B)
             ** E1100.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_B LOCATION.N))
		(!R4 (NOT (?L1 = ?X_B)))
		(!R5 (?X_B PLACE.N))
		(!R6 (SOCKS1097.SK (PLUR SOCK.N)))
		(!R7 (SOCKS1097.SK (PERTAIN-TO TOM.NAME)))
		(!R8 (E1101.SK (AT-OR-BEFORE NOW284)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA ((ADV-A (AT.P ?X_B)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P ?X_B))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P ?L1))))
		(?P2 (TOM.NAME (AT.P ?X_B)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1100.SK))
		(!W2 (?I2 BEFORE E1100.SK))
		(!W3 (?P1 AFTER E1100.SK))
		(!W4 (?P2 AFTER E1100.SK))
		(!W5 (?G1 CAUSE-OF E1100.SK))
		(!W6 (E1100.SK (BEFORE ?X_D)))
		(!W7 (E1100.SK (BEFORE NOW284)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 57:
	; "Tim got in the car."
	; "He started the car."
	; "He turned out of his street."
	; "He saw a red light."
	; "He stopped."
discarding schema GET.870.V learned from this story
; best schemas are:
; GET.741.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.804.V
; GET.821.V
(setf matches (append matches '(( (4.792363 7)
("Tim got in the car." "He started the car." "He turned out of his street."
 "He saw a red light." "He stopped.")
(EPI-SCHEMA ((TIM.NAME
              ((ADV-A (IN.P CAR1104.SK))
               ((ADV-A (FROM.P (K WORK.N))) GET.1196.V))
              (K HOME.N) (AT.P-ARG ?L))
             ** E1106.SK)
	(:ROLES
		(!R1 (TIM.NAME AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TIM.NAME = (K HOME.N))))
		(!R5 (TIM.NAME DAD.N))
		(!R6 (E1106.SK (RIGHT-AFTER ?X_A)))
		(!R7 (CAR1104.SK (PERTAIN-TO TIM.NAME)))
		(!R8 (TIM.NAME (PLUR FRIEND.N)))
		(!R9 (TIM.NAME HOME.N))
		(!R10 (?X_B GIRL.N))
		(!R11 (TIM.NAME (PERTAIN-TO ?X_B)))
		(!R12 (TIM.NAME (PERTAIN-TO ?X_C)))
		(!R13 (CAR1104.SK STREET.N))
		(!R14 (STREET1111.SK (PERTAIN-TO TIM.NAME)))
		(!R15 (STREET1111.SK STREET.N))
		(!R16 (CAR1104.SK CAR.N))
		(!R17 (CAR1104.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (TIM.NAME (WANT.V (THAT (TIM.NAME (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (TIM.NAME HAVE.V (K HOME.N))))
		(?I2 (TIM.NAME (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (TIM.NAME HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1106.SK))
		(!W2 (?I1 PRECOND-OF E1106.SK))
		(!W3 (?I2 PRECOND-OF E1106.SK))
		(!W4 (?I3 PRECOND-OF E1106.SK))
		(!W5 (?P1 POSTCOND-OF E1106.SK))
		(!W6 (E1106.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E1106.SK (BEFORE NOW285)))
	)
	(:CERTAINTIES
		(!C1 (!R17 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R16 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R13 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R17 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R16 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.53125 1)
("Tim got in the car." "He started the car." "He turned out of his street."
 "He saw a red light." "He stopped.")
(EPI-SCHEMA ((TIM.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.1197.V
              (KA ((THERE.ADV SEE.V) LIGHT1116.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) LIGHT1116.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (TIM.NAME AGENT.N))
		(!R4 (LIGHT1116.SK LIGHT.N))
		(!R5 (LIGHT1116.SK RED.A))
		(!R6 (STREET1111.SK (PERTAIN-TO TIM.NAME)))
		(!R7 (STREET1111.SK STREET.N))
	)
	(:GOALS
		(?G1 (TIM.NAME (WANT.V (THAT (NOT (TIM.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (TIM.NAME (THERE.ADV SEE.V) LIGHT1116.SK)) CAUSE-OF
    (KE (TIM.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1117.SK (TIM.NAME (THERE.ADV (THERE.ADV SEE.V)) LIGHT1116.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1117.SK))
		(!W2 (E1117.SK (BEFORE ?X_D)))
		(!W3 (E1117.SK (BEFORE NOW288)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.03125 4)
("Tim got in the car." "He started the car." "He turned out of his street."
 "He saw a red light." "He stopped.")
(EPI-SCHEMA ((TIM.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.1201.V
              (KA ((THERE.ADV SEE.V) LIGHT1116.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) LIGHT1116.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (TIM.NAME AGENT.N))
		(!R4 (STREET1111.SK MOM.N))
		(!R5 (CAR1104.SK (PERTAIN-TO TIM.NAME)))
		(!R6 (CAR1104.SK SLED.N))
		(!R7 (LIGHT1116.SK LIGHT.N))
		(!R8 (LIGHT1116.SK RED.A))
		(!R9 (CAR1104.SK CAR.N))
		(!R10 (CAR1104.SK INSTRUMENTALITY.N))
		(!R11 (STREET1111.SK (PERTAIN-TO TIM.NAME)))
		(!R12 (STREET1111.SK STREET.N))
	)
	(:GOALS
		(?G1 (TIM.NAME (WANT.V (THAT (NOT (TIM.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (TIM.NAME (THERE.ADV SEE.V) LIGHT1116.SK)) CAUSE-OF
    (KE (TIM.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1117.SK (TIM.NAME (THERE.ADV (THERE.ADV SEE.V)) LIGHT1116.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1117.SK))
		(!W2 (E1117.SK (BEFORE ?X_D)))
		(!W3 (E1117.SK (BEFORE ?X_G)))
		(!W4 (E1117.SK (BEFORE NOW288)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.53125 3)
("Tim got in the car." "He started the car." "He turned out of his street."
 "He saw a red light." "He stopped.")
(EPI-SCHEMA ((TIM.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.1210.V
              (KA ((THERE.ADV SEE.V) LIGHT1116.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) LIGHT1116.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (TIM.NAME AGENT.N))
		(!R4 (LIGHT1116.SK CAT.N))
		(!R5 (TIM.NAME DOG.N))
		(!R6 (?X_F (RIGHT-AFTER ?X_A)))
		(!R7 (LIGHT1116.SK LIGHT.N))
		(!R8 (LIGHT1116.SK RED.A))
		(!R9 (STREET1111.SK (PERTAIN-TO TIM.NAME)))
		(!R10 (STREET1111.SK STREET.N))
	)
	(:GOALS
		(?G1 (TIM.NAME (WANT.V (THAT (NOT (TIM.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (TIM.NAME (THERE.ADV SEE.V) LIGHT1116.SK)) CAUSE-OF
    (KE (TIM.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1117.SK (TIM.NAME (THERE.ADV (THERE.ADV SEE.V)) LIGHT1116.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1117.SK))
		(!W2 (E1117.SK (BEFORE ?X_D)))
		(!W3 (E1117.SK (BEFORE ?X_G)))
		(!W4 (?X_F (SAME-TIME ?X_G)))
		(!W5 (E1117.SK (BEFORE NOW288)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.5 2)
("Tim got in the car." "He started the car." "He turned out of his street."
 "He saw a red light." "He stopped.")
(EPI-SCHEMA ((TIM.NAME
              ((ADV-A (IN.P CAR1104.SK))
               ((ADV-A (ON.P CAR1104.SK)) GET.1214.V))
              ?X_E (AT.P-ARG ?L))
             ** E1106.SK)
	(:ROLES
		(!R1 (TIM.NAME AGENT.N))
		(!R2 (?X_E INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TIM.NAME = ?X_E)))
		(!R5 (?X_A BEACH.N))
		(!R6 (?X_E DAY.N))
		(!R7 (?X_E GOOD.A))
		(!R8 (STREET1111.SK DAY.N))
		(!R9 (CAR1104.SK (PERTAIN-TO TIM.NAME)))
		(!R10 (CAR1104.SK CAR.N))
		(!R11 (STREET1111.SK (PERTAIN-TO TIM.NAME)))
		(!R12 (STREET1111.SK STREET.N))
	)
	(:GOALS
		(?G1 (TIM.NAME (WANT.V (THAT (TIM.NAME (HAVE.V ?X_E))))))
	)
	(:PRECONDS
		(?I1 (NOT (TIM.NAME HAVE.V ?X_E)))
		(?I2 (TIM.NAME (AT.P ?L)))
		(?I3 (?X_E (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (TIM.NAME HAVE.V ?X_E))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1106.SK))
		(!W2 (?I1 PRECOND-OF E1106.SK))
		(!W3 (?I2 PRECOND-OF E1106.SK))
		(!W4 (?I3 PRECOND-OF E1106.SK))
		(!W5 (?P1 POSTCOND-OF E1106.SK))
		(!W6 (?G1 (BEFORE ?X_G)))
		(!W7 (E1106.SK (CONSEC ?X_H)))
		(!W8 (?X_H (BEFORE ?X_J)))
		(!W9 (E1106.SK (BEFORE ?X_J)))
		(!W10 (?P1 (BEFORE ?X_L)))
		(!W11 (E1106.SK (BEFORE NOW285)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 58:
	; "The man found the answer."
	; "He told everyone he could."
	; "People did not like the answer."
	; "They got angry at the man."
	; "They hung the man in the street."
discarding schema FIND.888.V learned from this story
; best schemas are:
; GET.870.V
; GO.212.V
; GO.1084.V
; GO.828.V
; GET.741.V

; story 59:
	; "I took it the harness off the cat."
	; "The cat did not want to go back inside."
	; "I took the cat outside."
	; "We bought the cat a harness."
	; "The cat always liked to go outside."
; best schemas are:
; TAKE.1039.V
; TAKE.928.V
; TAKE.302.V
; GO.1084.V
; GO.828.V
; GET.870.V
(setf matches (append matches '(( (4.6834373 9)
("I took it the harness off the cat." "The cat did not want to go back inside."
 "I took the cat outside." "We bought the cat a harness."
 "The cat always liked to go outside.")
(EPI-SCHEMA ((ME1159.SK
              ((ADV-A (OFF.P CAT1139.SK)) ((ADV-A (TO.P ?X_A)) TAKE.1236.V))
              IT.PRO (AT.P-ARG ?L))
             ** E1140.SK)
	(:ROLES
		(!R1 (IT.PRO INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1159.SK = IT.PRO)))
		(!R4 (IT.PRO WORM.N))
		(!R5 (?X_A NEST.N))
		(!R6 (ME1159.SK BIRD.N))
		(!R7 (ME1159.SK ((NN BABY.N) BIRD.N)))
		(!R8 (ME1159.SK ((NN MOTHER.N) BIRD.N)))
		(!R9 (IT.PRO TREE.N))
		(!R10 (?X_A (PERTAIN-TO ME1159.SK)))
		(!R11 (IT.PRO (PERTAIN-TO ME1159.SK)))
		(!R12 (IT.PRO CAT.N))
		(!R13 (IT.PRO ANIMAL.N))
		(!R14 (IT.PRO ORGANISM.N))
		(!R15 (?X_B (PERTAIN-TO ME1159.SK)))
		(!R16 (CAT1139.SK CAT.N))
		(!R17 (HARNESS1138.SK HARNESS.N))
		(!R18 (ME1159.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME1159.SK (WANT.V (THAT (ME1159.SK (HAVE.V IT.PRO))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1159.SK HAVE.V IT.PRO)))
		(?I2 (ME1159.SK (AT.P ?L)))
		(?I3 (IT.PRO (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME1159.SK HAVE.V IT.PRO))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1140.SK))
		(!W2 (?I1 PRECOND-OF E1140.SK))
		(!W3 (?I2 PRECOND-OF E1140.SK))
		(!W4 (?I3 PRECOND-OF E1140.SK))
		(!W5 (?P1 POSTCOND-OF E1140.SK))
		(!W6 (E1140.SK (BEFORE ?X_E)))
		(!W7 (?P1 (AT-ABOUT ?X_H)))
		(!W8 (E1140.SK (BEFORE NOW295)))
	)
	(:CERTAINTIES
		(!C1 (!R14 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R14 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R13 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C8 (!R12 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C9 (!R14 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0884376 8)
("I took it the harness off the cat." "The cat did not want to go back inside."
 "I took the cat outside." "We bought the cat a harness."
 "The cat always liked to go outside.")
(EPI-SCHEMA ((ME1159.SK
              ((ADV-A (OFF.P CAT1139.SK)) ((ADV-A (TO.P ?X_A)) TAKE.1237.V))
              IT.PRO (AT.P-ARG ?L))
             ** E1140.SK)
	(:ROLES
		(!R1 (IT.PRO INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1159.SK = IT.PRO)))
		(!R4 (IT.PRO WORM.N))
		(!R5 (?X_A (PERTAIN-TO ME1159.SK)))
		(!R6 (?X_A NEST.N))
		(!R7 (ME1159.SK BIRD.N))
		(!R8 (ME1159.SK ((NN BABY.N) BIRD.N)))
		(!R9 (ME1159.SK ((NN MOTHER.N) BIRD.N)))
		(!R10 (IT.PRO TREE.N))
		(!R11 (IT.PRO ORGANISM.N))
		(!R12 (IT.PRO VISIT.N))
		(!R13 (IT.PRO GREAT.A))
		(!R14 (?X_B FRIEND.N))
		(!R15 (?X_A (PERTAIN-TO ?X_B)))
		(!R16 (?X_B (PERTAIN-TO CAT1146.SK)))
		(!R17 (CAT1146.SK AGENT.N))
		(!R18 (CAT1139.SK CAT.N))
		(!R19 (HARNESS1138.SK HARNESS.N))
		(!R20 (ME1159.SK AGENT.N))
		(!R21 (CAT1146.SK CAT.N))
	)
	(:GOALS
		(?G1 (ME1159.SK (WANT.V (THAT (ME1159.SK (HAVE.V IT.PRO))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1159.SK HAVE.V IT.PRO)))
		(?I2 (ME1159.SK (AT.P ?L)))
		(?I3 (IT.PRO (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME1159.SK HAVE.V IT.PRO))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1140.SK))
		(!W2 (?I1 PRECOND-OF E1140.SK))
		(!W3 (?I2 PRECOND-OF E1140.SK))
		(!W4 (?I3 PRECOND-OF E1140.SK))
		(!W5 (?P1 POSTCOND-OF E1140.SK))
		(!W6 (E1140.SK (BEFORE ?X_E)))
		(!W7 (?P1 (BEFORE ?X_I)))
		(!W8 (E1140.SK (BEFORE NOW295)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.6834373 6)
("I took it the harness off the cat." "The cat did not want to go back inside."
 "I took the cat outside." "We bought the cat a harness."
 "The cat always liked to go outside.")
(EPI-SCHEMA ((ME1159.SK
              ((ADV-A (OFF.P CAT1139.SK)) ((ADV-A (TO.P ?X_A)) TAKE.1238.V))
              IT.PRO (AT.P-ARG ?L))
             ** E1140.SK)
	(:ROLES
		(!R1 (IT.PRO INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1159.SK = IT.PRO)))
		(!R4 (IT.PRO WORM.N))
		(!R5 (?X_A (PERTAIN-TO ME1159.SK)))
		(!R6 (?X_A NEST.N))
		(!R7 (ME1159.SK BIRD.N))
		(!R8 (ME1159.SK ((NN BABY.N) BIRD.N)))
		(!R9 (ME1159.SK ((NN MOTHER.N) BIRD.N)))
		(!R10 (IT.PRO TREE.N))
		(!R11 (IT.PRO ORGANISM.N))
		(!R12 (CAT1139.SK CAT.N))
		(!R13 (HARNESS1138.SK HARNESS.N))
		(!R14 (ME1159.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME1159.SK (WANT.V (THAT (ME1159.SK (HAVE.V IT.PRO))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1159.SK HAVE.V IT.PRO)))
		(?I2 (ME1159.SK (AT.P ?L)))
		(?I3 (IT.PRO (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME1159.SK HAVE.V IT.PRO))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1140.SK))
		(!W2 (?I1 PRECOND-OF E1140.SK))
		(!W3 (?I2 PRECOND-OF E1140.SK))
		(!W4 (?I3 PRECOND-OF E1140.SK))
		(!W5 (?P1 POSTCOND-OF E1140.SK))
		(!W6 (E1140.SK (BEFORE ?X_E)))
		(!W7 (E1140.SK (BEFORE NOW295)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 60:
	; "I used to run around a pond."
	; "It was there one fall."
	; "The next fall it had vanished."
	; "There was nothing but dirt."
	; "I was surprised."
; best schemas are:
; GO.1241.V
; TAKE.1039.V
; TAKE.928.V
; GO.1084.V
; GO.828.V
; GET.870.V

; story 61:
	; "My dog was dreaming."
	; "It was lying on the floor."
	; "Then it jumped up quickly."
	; "My dog let out a bark."
	; "I had never seen her do that before."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; RUN.179.V
; RUN.179.V
; RUN.929.V
; GO.1040.V
; FOLLOW.69.V

; story 62:
	; "My brother had a goldfish."
	; "The fish let him pet it."
	; "He put his finger in the water."
	; "The fish swam up to him."
	; "And he pet the fish."
; best schemas are:
; GET.1260.V
; GET.50.V
; TAKE.1039.V
; TAKE.10.V
; GET.338.V
; TAKE.22.V

; story 63:
	; "Bob loves to fish."
	; "He got up early one morning."
	; "He got his fishing pole ready."
	; "Next he walked to the lake."
	; "Bob caught a big fish."
discarding schema WALK.1063.V learned from this story
; best schemas are:
; TAKE.1391.V
; RUN.254.V
; GET.1260.V
; GET.50.V
; GO.1241.V
(setf matches (append matches '(( (5.4112496 13)
("Bob loves to fish." "He got up early one morning."
 "He got his fishing pole ready." "Next he walked to the lake."
 "Bob caught a big fish.")
(EPI-SCHEMA ((HE.PRO
              (OUT.ADV
               ((ADV-A (TO.P LAKE1216.SK)) ((ADV-A (FROM.P ?L1)) WALK.1491.V)))
              LAKE1216.SK)
             ** E1217.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (LAKE1216.SK LOCATION.N))
		(!R3 (NOT (?L1 = LAKE1216.SK)))
		(!R4 (LAKE1216.SK MAILBOX.N))
		(!R5 (HE.PRO MAN.N))
		(!R6 (E1217.SK (RIGHT-AFTER ?X_A)))
		(!R7 (LAKE1216.SK PAPER.N))
		(!R8 (POLE1214.SK ((NN PAPER.N) BOY.N)))
		(!R9 (HE.PRO FLY.N))
		(!R10 (LAKE1216.SK SON.N))
		(!R11 (LAKE1216.SK MAN.N))
		(!R12 (LAKE1216.SK PERSON.N))
		(!R13 (LAKE1216.SK (PERTAIN-TO HE.PRO)))
		(!R14 (LAKE1216.SK ((NN STORE.N) TODAY.N)))
		(!R15 (LAKE1216.SK HARNESS.N))
		(!R16 (LAKE1216.SK INSTRUMENTALITY.N))
		(!R17 (HE.PRO CAT.N))
		(!R18 (HE.PRO ANIMAL.N))
		(!R19 (LAKE1216.SK LAKE.N))
		(!R20 (POLE1214.SK ((NN FISHING.N) POLE.N)))
		(!R21 (POLE1214.SK (PERTAIN-TO HE.PRO)))
		(!R22 (HE.PRO MALE.A))
		(!R23 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P LAKE1216.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P ?L1)))
		(?I2 (NOT (HE.PRO (AT.P LAKE1216.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P ?L1))))
		(?P2 (HE.PRO (AT.P LAKE1216.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1217.SK))
		(!W2 (?I2 BEFORE E1217.SK))
		(!W3 (?P1 AFTER E1217.SK))
		(!W4 (?P2 AFTER E1217.SK))
		(!W5 (?G1 CAUSE-OF E1217.SK))
		(!W6 (E1217.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1217.SK (BEFORE ?X_F)))
		(!W9 (E1217.SK (BEFORE NOW318)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R12 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R12 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R12 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C9 (!R16 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C10 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C11 (!R15 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C13 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C14 (!R17 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 64:
	; "Martha wanted to go to the fair."
	; "So off she went."
	; "When she got there she met her friends."
	; "They had fun."
	; "They stayed for three hours."
; best schemas are:
; GET.870.V
; TAKE.928.V
; TAKE.542.V
; TAKE.895.V
; EAT.1200.V
; PLAY.1257.V

; story 65:
	; "I was hanging out with my friend."
	; "He pulled in front of my car."
	; "I went off the road."
	; "There was mud flying."
	; "Then I got back in front."
; best schemas are:
; GET.870.V
; GET.741.V
; GO.1220.V
; SIT.274.V
; GO.1241.V
; GO.168.V
(setf matches (append matches '(( (2.405 1)
("I was hanging out with my friend." "He pulled in front of my car."
 "I went off the road." "There was mud flying." "Then I got back in front.")
(EPI-SCHEMA ((FRIEND1237.SK
              ((ADV-A (OFF.P ROAD1244.SK))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.1528.V)))
              ?X_C)
             ** E1245.SK)
	(:ROLES
		(!R1 (FRIEND1237.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (?X_A (PLUR PERSON.N)))
		(!R6 (?X_A WOMAN.N))
		(!R7 (FRIEND1237.SK MAN.N))
		(!R8 (?X_B STREET.N))
		(!R9 (FRIEND1237.SK (IN.P ?X_B)))
		(!R10 (FRIEND1237.SK FRIEND.N))
		(!R11 (FRIEND1237.SK PERSON.N))
		(!R12 (ROAD1244.SK ROAD.N))
		(!R13 (FRIEND1237.SK (PERTAIN-TO ME.PRO)))
		(!R14 (CAR1241.SK (PERTAIN-TO ME.PRO)))
		(!R15 (CAR1241.SK CAR.N))
	)
	(:GOALS
		(?G1 (FRIEND1237.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND1237.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND1237.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND1237.SK (AT.P ?L1))))
		(?P2 (FRIEND1237.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1245.SK))
		(!W2 (?I2 BEFORE E1245.SK))
		(!W3 (?P1 AFTER E1245.SK))
		(!W4 (?P2 AFTER E1245.SK))
		(!W5 (?G1 CAUSE-OF E1245.SK))
		(!W6 (E1245.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E1245.SK (BEFORE NOW327)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.76625 17)
("I was hanging out with my friend." "He pulled in front of my car."
 "I went off the road." "There was mud flying." "Then I got back in front.")
(EPI-SCHEMA ((FRIEND1237.SK
              ((ADV-A (OFF.P ROAD1244.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P FRIEND1237.SK)) (OUT.ADV GO.1530.V))))
              FRIEND1237.SK)
             ** E1245.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (FRIEND1237.SK LOCATION.N))
		(!R3 (NOT (?L1 = FRIEND1237.SK)))
		(!R4 (FRIEND1237.SK MAILBOX.N))
		(!R5 (E1245.SK (RIGHT-AFTER ?X_A)))
		(!R6 (FRIEND1237.SK PAPER.N))
		(!R7 (CAR1241.SK ((NN PAPER.N) BOY.N)))
		(!R8 (CAR1241.SK (PERTAIN-TO FRIEND1237.SK)))
		(!R9 (FRIEND1237.SK FLY.N))
		(!R10 (FRIEND1237.SK SON.N))
		(!R11 (FRIEND1237.SK MAN.N))
		(!R12 (FRIEND1237.SK (PERTAIN-TO FRIEND1237.SK)))
		(!R13 (FRIEND1237.SK MALE.A))
		(!R14 (FRIEND1237.SK ((NN STORE.N) TODAY.N)))
		(!R15 (FRIEND1237.SK AGENT.N))
		(!R16 (FRIEND1237.SK HARNESS.N))
		(!R17 (FRIEND1237.SK INSTRUMENTALITY.N))
		(!R18 (FRIEND1237.SK CAT.N))
		(!R19 (FRIEND1237.SK ANIMAL.N))
		(!R20 (ROAD1244.SK ROAD.N))
		(!R21 (CAR1241.SK (PERTAIN-TO ME.PRO)))
		(!R22 (CAR1241.SK CAR.N))
		(!R23 (FRIEND1237.SK FRIEND.N))
		(!R24 (FRIEND1237.SK PERSON.N))
		(!R25 (FRIEND1237.SK (PERTAIN-TO ME.PRO)))
	)
	(:GOALS
		(?G1 (FRIEND1237.SK (WANT.V (KA ((ADV-A (AT.P FRIEND1237.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND1237.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND1237.SK (AT.P FRIEND1237.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND1237.SK (AT.P ?L1))))
		(?P2 (FRIEND1237.SK (AT.P FRIEND1237.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1245.SK))
		(!W2 (?I2 BEFORE E1245.SK))
		(!W3 (?P1 AFTER E1245.SK))
		(!W4 (?P2 AFTER E1245.SK))
		(!W5 (?G1 CAUSE-OF E1245.SK))
		(!W6 (E1245.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1245.SK (BEFORE ?X_F)))
		(!W9 (E1245.SK (BEFORE NOW327)))
	)
	(:CERTAINTIES
		(!C1 (!R24 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R10 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C4 (!R24 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C6 (!R24 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R11 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C8 (!R24 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C9 (!R17 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C10 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C11 (!R16 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C13 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C14 (!R18 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C15 (!R24 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C16 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C17 (!R23 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C18 (!R24 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C19 (!R23 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C20 (!R24 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C21 (!R24 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C22 (!R24 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C23 (!R24 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C24 (!R24 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C25 (!R23 CERTAIN-TO-DEGREE (/ 1 6)))
		(!C26 (!R24 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C27 (!R24 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C28 (!R24 CERTAIN-TO-DEGREE (/ 2 6)))
		(!C29 (!R24 CERTAIN-TO-DEGREE (/ 2 6)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 3)
("I was hanging out with my friend." "He pulled in front of my car."
 "I went off the road." "There was mud flying." "Then I got back in front.")
(EPI-SCHEMA ((FRIEND1237.SK
              ((ADV-A (OFF.P ROAD1244.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?X_E))
                 ((ADV-A (WITH.P FRIEND1237.SK)) GO.1531.V))))
              ?X_E)
             ** E1245.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?X_E LOCATION.N))
		(!R3 (NOT (?L1 = ?X_E)))
		(!R4 (FRIEND1237.SK AGENT.N))
		(!R5 (?X_E PARK.N))
		(!R6 (FRIEND1237.SK (PERTAIN-TO FRIEND1237.SK)))
		(!R7 (CAR1241.SK (PERTAIN-TO FRIEND1237.SK)))
		(!R8 (CAR1241.SK CURFEW.N))
		(!R9 (ROAD1244.SK ROAD.N))
		(!R10 (CAR1241.SK (PERTAIN-TO ME.PRO)))
		(!R11 (CAR1241.SK CAR.N))
		(!R12 (FRIEND1237.SK FRIEND.N))
		(!R13 (FRIEND1237.SK (PERTAIN-TO ME.PRO)))
	)
	(:GOALS
		(?G1 (FRIEND1237.SK (WANT.V (KA ((ADV-A (AT.P ?X_E)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND1237.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND1237.SK (AT.P ?X_E))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND1237.SK (AT.P ?L1))))
		(?P2 (FRIEND1237.SK (AT.P ?X_E)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1245.SK))
		(!W2 (?I2 BEFORE E1245.SK))
		(!W3 (?P1 AFTER E1245.SK))
		(!W4 (?P2 AFTER E1245.SK))
		(!W5 (?G1 CAUSE-OF E1245.SK))
		(!W6 (E1245.SK (BEFORE ?X_G)))
		(!W7 (E1245.SK (BEFORE NOW327)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 66:
	; "I turned on the fan."
	; "It would not work."
	; "I saw that it was unplugged."
	; "I plugged the fan back in."
	; "The fan blew wind in the room."
; best schemas are:
; TAKE.1391.V
; GO.1241.V
; TAKE.1039.V
; GET.870.V
; TAKE.928.V
; GO.1084.V

; story 67:
	; "Tom used to have his own boat."
	; "He had to sell it."
	; "Now he just comes out on my boat."
	; "We have such a great time together."
	; "Now I have someone to help me clean my boat."
; best schemas are:
; GET.870.V
; GET.741.V
; TAKE.542.V
; TAKE.895.V
; TAKE.413.V
; TAKE.928.V

; story 68:
	; "The man was crying."
	; "His friend asked why."
	; "The man would not answer."
	; "The friend asked again."
	; "The man lashed out in anger."
; best schemas are:
; GET.870.V
; GO.1084.V
; GO.1220.V
; GO.1241.V
; GO.828.V
; GO.212.V

; story 69:
	; "The man smiled."
	; "The woman noticed."
	; "The woman smiled back."
	; "The man did not notice."
	; "The woman felt silly."
discarding schema AVOID_ACTION_TO_AVOID_DISPLEASURE.1136.V learned from this story
; best schemas are:
; GO.1220.V
; GO.212.V
; GO.1084.V
; GO.1241.V
; GO.828.V

; story 70:
	; "The man shook his head."
	; "The woman asked why."
	; "The man would not answer."
	; "The woman walked away."
	; "The man looked dejected."
; best schemas are:
; GO.1220.V
; GO.212.V
; GET.517.V
; GO.1084.V
; GO.1241.V
; GO.828.V

; story 71:
	; "Last week we had a beach day."
	; "It was great."
	; "I was really looking forward to it."
	; "When we went it was very hot."
	; "I jumped in right away."
; best schemas are:
; TAKE.1391.V
; TAKE.928.V
; GO.1241.V
; TAKE.1039.V
; GET.870.V
; TAKE.895.V

; story 72:
	; "The girl blinked her eyes."
	; "The boy blinked back at her."
	; "This was a game they had."
	; "The game could not stay tied."
	; "The girl blinked back at the boy."
; best schemas are:
; GO.1084.V
; GO.1241.V
; GO.828.V
; PLAY.724.V
; GET.870.V
; GET.517.V

; story 73:
	; "The kids went out in the rain."
	; "They become very wet."
	; "One of the kids got too cold."
	; "The kids went back inside."
	; "They all dried off."
; best schemas are:
; GO.495.V
; ROLL.657.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.539.V
; TAKE.624.V
; TRAVEL.V

; story 74:
	; "My friends and I were running."
	; "I was behind the group."
	; "I sprinted to try to catch up."
	; "They all ran faster than me."
	; "I came in last place."
discarding schema SPRINT.1181.V learned from this story
; best schemas are:
; TAKE.1391.V
; GO.1241.V
; GET.870.V
; TAKE.928.V
; TAKE.1039.V
(setf matches (append matches '(( (5.2724996 11)
("My friends and I were running." "I was behind the group."
 "I sprinted to try to catch up." "They all ran faster than me."
 "I came in last place.")
(EPI-SCHEMA ((ME1371.SK
              ((ADV-A (FOR.P (KA (TRY.V (KA CATCH_UP.V)))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P FRIEND1362.SK)) (OUT.ADV SPRINT.1782.V))))
              FRIEND1362.SK)
             ** E1366.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (FRIEND1362.SK LOCATION.N))
		(!R3 (NOT (?L1 = FRIEND1362.SK)))
		(!R4 (FRIEND1362.SK MAILBOX.N))
		(!R5 (ME1371.SK MAN.N))
		(!R6 (E1366.SK (RIGHT-AFTER ?X_A)))
		(!R7 (FRIEND1362.SK PAPER.N))
		(!R8 (?X_C ((NN PAPER.N) BOY.N)))
		(!R9 (?X_C (PERTAIN-TO ME1371.SK)))
		(!R10 (ME1371.SK FLY.N))
		(!R11 (FRIEND1362.SK SON.N))
		(!R12 (FRIEND1362.SK MAN.N))
		(!R13 (FRIEND1362.SK PERSON.N))
		(!R14 (ME1371.SK MALE.A))
		(!R15 (FRIEND1362.SK ((NN STORE.N) TODAY.N)))
		(!R16 (FRIEND1362.SK HARNESS.N))
		(!R17 (FRIEND1362.SK INSTRUMENTALITY.N))
		(!R18 (ME1371.SK CAT.N))
		(!R19 (ME1371.SK ANIMAL.N))
		(!R20 (FRIEND1362.SK (PLUR FRIEND.N)))
		(!R21 (FRIEND1362.SK (PERTAIN-TO ME1371.SK)))
		(!R22 (ME1371.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME1371.SK (WANT.V (KA ((ADV-A (AT.P FRIEND1362.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1371.SK (AT.P ?L1)))
		(?I2 (NOT (ME1371.SK (AT.P FRIEND1362.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1371.SK (AT.P ?L1))))
		(?P2 (ME1371.SK (AT.P FRIEND1362.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1366.SK))
		(!W2 (?I2 BEFORE E1366.SK))
		(!W3 (?P1 AFTER E1366.SK))
		(!W4 (?P2 AFTER E1366.SK))
		(!W5 (?G1 CAUSE-OF E1366.SK))
		(!W6 (E1366.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1366.SK (BEFORE ?X_F)))
		(!W9 (E1366.SK (BEFORE NOW372)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R12 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R13 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C9 (!R17 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C10 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C11 (!R16 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C13 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C14 (!R18 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 75:
	; "I was eating with my friends."
	; "We were about to go to someone's house."
	; "I was out of gas."
	; "And I did not know the way."
	; "They had to wait on me."
; best schemas are:
; TAKE.1391.V
; GET.870.V
; GO.1241.V
; TAKE.928.V
; GO.1084.V
; GO.828.V

; story 76:
	; "Tom was dogsitting for a friend."
	; "He accidentally let it out."
	; "The dog ran away."
	; "It was never seen again."
	; "Tom had to buy them a new dog."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.804.V
; PLAY.1257.V
; GET.826.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
(setf matches (append matches '(( (1.03125 4)
("Tom was dogsitting for a friend." "He accidentally let it out."
 "The dog ran away." "It was never seen again."
 "Tom had to buy them a new dog.")
(EPI-SCHEMA ((IT.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.1837.V
              (KA ((THERE.ADV SEE.V) DOG1387.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) DOG1387.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (IT.PRO AGENT.N))
		(!R4 (DOG1387.SK CAT.N))
		(!R5 (IT.PRO DOG.N))
		(!R6 (?X_F (RIGHT-AFTER ?X_A)))
		(!R7 (DOG1387.SK DOG.N))
		(!R8 (DOG1387.SK CARNIVORE.N))
	)
	(:GOALS
		(?G1 (IT.PRO (WANT.V (THAT (NOT (IT.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (IT.PRO (THERE.ADV SEE.V) DOG1387.SK)) CAUSE-OF
    (KE (IT.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1389.SK
   (IT.PRO (AGAIN.ADV (NEVER.ADV (THERE.ADV (THERE.ADV SEE.V)))) DOG1387.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1389.SK))
		(!W2 (E1389.SK (BEFORE ?X_D)))
		(!W3 (E1389.SK (BEFORE ?X_G)))
		(!W4 (?X_F (SAME-TIME ?X_G)))
		(!W5 (E1389.SK (BEFORE NOW383)))
	)
	(:CERTAINTIES
		(!C1 (!R8 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.03125 4)
("Tom was dogsitting for a friend." "He accidentally let it out."
 "The dog ran away." "It was never seen again."
 "Tom had to buy them a new dog.")
(EPI-SCHEMA ((IT.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.1838.V
              (KA ((THERE.ADV SEE.V) DOG1393.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) DOG1393.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (IT.PRO AGENT.N))
		(!R4 (DOG1393.SK CAT.N))
		(!R5 (IT.PRO DOG.N))
		(!R6 (?X_F (RIGHT-AFTER ?X_A)))
		(!R7 (DOG1393.SK DOG.N))
		(!R8 (DOG1393.SK CARNIVORE.N))
		(!R9 (DOG1393.SK NEW.A))
	)
	(:GOALS
		(?G1 (IT.PRO (WANT.V (THAT (NOT (IT.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (IT.PRO (THERE.ADV SEE.V) DOG1393.SK)) CAUSE-OF
    (KE (IT.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1389.SK
   (IT.PRO (AGAIN.ADV (NEVER.ADV (THERE.ADV (THERE.ADV SEE.V)))) DOG1393.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1389.SK))
		(!W2 (E1389.SK (BEFORE ?X_D)))
		(!W3 (E1389.SK (BEFORE ?X_G)))
		(!W4 (?X_F (SAME-TIME ?X_G)))
		(!W5 (E1389.SK (BEFORE NOW383)))
	)
	(:CERTAINTIES
		(!C1 (!R8 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.0 1)
("Tom was dogsitting for a friend." "He accidentally let it out."
 "The dog ran away." "It was never seen again."
 "Tom had to buy them a new dog.")
(EPI-SCHEMA ((IT.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.1855.V
              (KA ((THERE.ADV SEE.V) ?X_B)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) ?X_B)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (IT.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (IT.PRO (WANT.V (THAT (NOT (IT.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (IT.PRO (THERE.ADV SEE.V) ?X_B)) CAUSE-OF
    (KE (IT.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1389.SK (IT.PRO (AGAIN.ADV (NEVER.ADV (THERE.ADV (THERE.ADV SEE.V)))) ?X_B))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1389.SK))
		(!W2 (E1389.SK (BEFORE ?X_D)))
		(!W3 (E1389.SK (BEFORE NOW383)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.0 1)
("Tom was dogsitting for a friend." "He accidentally let it out."
 "The dog ran away." "It was never seen again."
 "Tom had to buy them a new dog.")
(EPI-SCHEMA ((IT.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.1856.V
              (KA ((THERE.ADV SEE.V) ?X_E)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) ?X_E)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (IT.PRO AGENT.N))
		(!R4 (?X_A (PERTAIN-TO IT.PRO)))
		(!R5 (?X_A MOM.N))
		(!R6 (?X_B (PERTAIN-TO IT.PRO)))
		(!R7 (?X_B SLED.N))
	)
	(:GOALS
		(?G1 (IT.PRO (WANT.V (THAT (NOT (IT.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (IT.PRO (THERE.ADV SEE.V) ?X_E)) CAUSE-OF
    (KE (IT.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1389.SK (IT.PRO (AGAIN.ADV (NEVER.ADV (THERE.ADV (THERE.ADV SEE.V)))) ?X_E))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1389.SK))
		(!W2 (E1389.SK (BEFORE ?X_D)))
		(!W3 (E1389.SK (BEFORE ?X_G)))
		(!W4 (E1389.SK (BEFORE NOW383)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 77:
	; "Allie went to the store."
	; "She saw candy on sale."
	; "It looked great."
	; "She got sour candy."
	; "She got five bags."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; GO.90.V
; GO.591.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.804.V
; GO.806.V
(setf matches (append matches '(( (1.53125 1)
("Allie went to the store." "She saw candy on sale." "It looked great."
 "She got sour candy." "She got five bags.")
(EPI-SCHEMA ((ALLIE.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.1866.V
              (KA ((THERE.ADV SEE.V) (K CANDY.N))))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) (K CANDY.N))) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ALLIE.NAME AGENT.N))
	)
	(:GOALS
		(?G1 (ALLIE.NAME (WANT.V (THAT (NOT (ALLIE.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ALLIE.NAME (THERE.ADV SEE.V) (K CANDY.N))) CAUSE-OF
    (KE (ALLIE.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1399.SK
   (ALLIE.NAME ((ADV-A (ON.P (K SALE.N))) (THERE.ADV (THERE.ADV SEE.V)))
    (K CANDY.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1399.SK))
		(!W2 (E1399.SK (BEFORE ?X_D)))
		(!W3 (E1399.SK (BEFORE NOW386)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.53125 1)
("Allie went to the store." "She saw candy on sale." "It looked great."
 "She got sour candy." "She got five bags.")
(EPI-SCHEMA ((ALLIE.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.1867.V
              (KA ((THERE.ADV SEE.V) (K CANDY.N))))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) (K CANDY.N))) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ALLIE.NAME AGENT.N))
		(!R4 (?X_A (PERTAIN-TO ALLIE.NAME)))
		(!R5 (?X_A MOM.N))
		(!R6 (?X_B (PERTAIN-TO ALLIE.NAME)))
		(!R7 (?X_B SLED.N))
	)
	(:GOALS
		(?G1 (ALLIE.NAME (WANT.V (THAT (NOT (ALLIE.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ALLIE.NAME (THERE.ADV SEE.V) (K CANDY.N))) CAUSE-OF
    (KE (ALLIE.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1399.SK
   (ALLIE.NAME ((ADV-A (ON.P (K SALE.N))) (THERE.ADV (THERE.ADV SEE.V)))
    (K CANDY.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1399.SK))
		(!W2 (E1399.SK (BEFORE ?X_D)))
		(!W3 (E1399.SK (BEFORE ?X_G)))
		(!W4 (E1399.SK (BEFORE NOW386)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 3)
("Allie went to the store." "She saw candy on sale." "It looked great."
 "She got sour candy." "She got five bags.")
(EPI-SCHEMA ((ALLIE.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE1396.SK)) ((ADV-A (FROM.P ?L1)) GO.1868.V)))
              STORE1396.SK)
             ** E1397.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE1396.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE1396.SK)))
		(!R4 (ALLIE.NAME AGENT.N))
		(!R5 (STORE1396.SK STORE.N))
	)
	(:GOALS
		(?G1 (ALLIE.NAME (WANT.V (KA ((ADV-A (AT.P STORE1396.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ALLIE.NAME (AT.P ?L1)))
		(?I2 (NOT (ALLIE.NAME (AT.P STORE1396.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ALLIE.NAME (AT.P ?L1))))
		(?P2 (ALLIE.NAME (AT.P STORE1396.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1397.SK))
		(!W2 (?I2 BEFORE E1397.SK))
		(!W3 (?P1 AFTER E1397.SK))
		(!W4 (?P2 AFTER E1397.SK))
		(!W5 (?G1 CAUSE-OF E1397.SK))
		(!W6 (E1397.SK (BEFORE ?X_D)))
		(!W7 (E1397.SK (BEFORE NOW385)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 5)
("Allie went to the store." "She saw candy on sale." "It looked great."
 "She got sour candy." "She got five bags.")
(EPI-SCHEMA ((ALLIE.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE1396.SK)) GO.1869.V))
              STORE1396.SK)
             ** E1397.SK)
	(:ROLES
		(!R1 (ALLIE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE1396.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE1396.SK)))
		(!R5 (ALLIE.NAME CAT.N))
		(!R6 (ALLIE.NAME NEW.A))
		(!R7 (STORE1396.SK ((NN PET.N) STORE.N)))
		(!R8 (?X_A CAT.N))
		(!R9 (?X_A NICE.A))
		(!R10 (?X_A (PERTAIN-TO ALLIE.NAME)))
		(!R11 (STORE1396.SK STORE.N))
	)
	(:GOALS
		(?G1 (ALLIE.NAME (WANT.V (KA ((ADV-A (AT.P STORE1396.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ALLIE.NAME (AT.P ?L1)))
		(?I2 (NOT (ALLIE.NAME (AT.P STORE1396.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ALLIE.NAME (AT.P ?L1))))
		(?P2 (ALLIE.NAME (AT.P STORE1396.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1397.SK))
		(!W2 (?I2 BEFORE E1397.SK))
		(!W3 (?P1 AFTER E1397.SK))
		(!W4 (?P2 AFTER E1397.SK))
		(!W5 (?G1 CAUSE-OF E1397.SK))
		(!W6 (E1397.SK (BEFORE ?X_E)))
		(!W7 (E1397.SK (BEFORE NOW385)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.53125 3)
("Allie went to the store." "She saw candy on sale." "It looked great."
 "She got sour candy." "She got five bags.")
(EPI-SCHEMA ((ALLIE.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.1870.V
              (KA ((THERE.ADV SEE.V) (K CANDY.N))))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) (K CANDY.N))) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ALLIE.NAME AGENT.N))
		(!R4 ((K CANDY.N) CAT.N))
		(!R5 (ALLIE.NAME DOG.N))
		(!R6 (?X_F (RIGHT-AFTER ?X_A)))
	)
	(:GOALS
		(?G1 (ALLIE.NAME (WANT.V (THAT (NOT (ALLIE.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ALLIE.NAME (THERE.ADV SEE.V) (K CANDY.N))) CAUSE-OF
    (KE (ALLIE.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1399.SK
   (ALLIE.NAME ((ADV-A (ON.P (K SALE.N))) (THERE.ADV (THERE.ADV SEE.V)))
    (K CANDY.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1399.SK))
		(!W2 (E1399.SK (BEFORE ?X_D)))
		(!W3 (E1399.SK (BEFORE ?X_G)))
		(!W4 (?X_F (SAME-TIME ?X_G)))
		(!W5 (E1399.SK (BEFORE NOW386)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 78:
	; "Suzy got a new sweatshirt."
	; "She was not sure she liked it."
	; "Sure enough, she did not."
	; "It was too big."
	; "Suzy wanted to give it away."
discarding schema GET.1224.V learned from this story
; best schemas are:
; GET.518.V
; GET.826.V
; GET.848.V
; GET.254.V
; GET.1322.V
(setf matches (append matches '(( (5.603306 2)
("Suzy got a new sweatshirt." "She was not sure she liked it."
 "Sure enough, she did not." "It was too big." "Suzy wanted to give it away.")
(EPI-SCHEMA ((SUZY.NAME GET.1872.V SWEATSHIRT1407.SK (AT.P-ARG ?L)) ** E1408.SK)
	(:ROLES
		(!R1 (SWEATSHIRT1407.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (SUZY.NAME = SWEATSHIRT1407.SK)))
		(!R4 (SWEATSHIRT1407.SK KITTEN.N))
		(!R5 (SUZY.NAME AGENT.N))
		(!R6 (?X_A (PERTAIN-TO SUZY.NAME)))
		(!R7 (?X_A (PLUR SHOE.N)))
		(!R8 (SWEATSHIRT1407.SK SWEATSHIRT.N))
		(!R9 (SWEATSHIRT1407.SK NEW.A))
	)
	(:GOALS
		(E1414.SK (SUZY.NAME (WANT.V (THAT (SUZY.NAME (HAVE.V SWEATSHIRT1407.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SUZY.NAME HAVE.V SWEATSHIRT1407.SK)))
		(?I2 (SUZY.NAME (AT.P ?L)))
		(?I3 (SWEATSHIRT1407.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (SUZY.NAME HAVE.V SWEATSHIRT1407.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1408.SK))
		(!W2 (?I1 PRECOND-OF E1408.SK))
		(!W3 (?I2 PRECOND-OF E1408.SK))
		(!W4 (?I3 PRECOND-OF E1408.SK))
		(!W5 (?P1 POSTCOND-OF E1408.SK))
		(!W6 (E1408.SK (BEFORE ?X_E)))
		(!W7 (E1408.SK (BEFORE NOW390)))
		(!W8 (E1414.SK (BEFORE NOW394)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.603306 2)
("Suzy got a new sweatshirt." "She was not sure she liked it."
 "Sure enough, she did not." "It was too big." "Suzy wanted to give it away.")
(EPI-SCHEMA ((SUZY.NAME GET.1873.V SWEATSHIRT1407.SK (AT.P-ARG ?L)) ** E1408.SK)
	(:ROLES
		(!R1 (SUZY.NAME AGENT.N))
		(!R2 (SWEATSHIRT1407.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (SUZY.NAME = SWEATSHIRT1407.SK)))
		(!R5 (SWEATSHIRT1407.SK DOG.N))
		(!R6 (?X_A (PERTAIN-TO SUZY.NAME)))
		(!R7 (?X_A DOG.N))
		(!R8 (?X_B (WALK.V SUZY.NAME)))
		(!R9 (?X_B EVENING.N))
		(!R10 (SWEATSHIRT1407.SK SWEATSHIRT.N))
		(!R11 (SWEATSHIRT1407.SK NEW.A))
	)
	(:GOALS
		(E1414.SK (SUZY.NAME (WANT.V (THAT (SUZY.NAME (HAVE.V SWEATSHIRT1407.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SUZY.NAME HAVE.V SWEATSHIRT1407.SK)))
		(?I2 (SUZY.NAME (AT.P ?L)))
		(?I3 (SWEATSHIRT1407.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (SUZY.NAME HAVE.V SWEATSHIRT1407.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1408.SK))
		(!W2 (?I1 PRECOND-OF E1408.SK))
		(!W3 (?I2 PRECOND-OF E1408.SK))
		(!W4 (?I3 PRECOND-OF E1408.SK))
		(!W5 (?P1 POSTCOND-OF E1408.SK))
		(!W6 (E1408.SK (AT-ABOUT ?X_F)))
		(!W7 (E1408.SK (BEFORE NOW390)))
		(!W8 (E1414.SK (BEFORE NOW394)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.603306 2)
("Suzy got a new sweatshirt." "She was not sure she liked it."
 "Sure enough, she did not." "It was too big." "Suzy wanted to give it away.")
(EPI-SCHEMA ((SUZY.NAME GET.1875.V SWEATSHIRT1407.SK (AT.P-ARG ?L)) ** E1408.SK)
	(:ROLES
		(!R1 (SUZY.NAME AGENT.N))
		(!R2 (SWEATSHIRT1407.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (SUZY.NAME = SWEATSHIRT1407.SK)))
		(!R5 (SWEATSHIRT1407.SK RING.N))
		(!R6 (SWEATSHIRT1407.SK SWEATSHIRT.N))
		(!R7 (SWEATSHIRT1407.SK NEW.A))
	)
	(:GOALS
		(E1414.SK (SUZY.NAME (WANT.V (THAT (SUZY.NAME (HAVE.V SWEATSHIRT1407.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SUZY.NAME HAVE.V SWEATSHIRT1407.SK)))
		(?I2 (SUZY.NAME (AT.P ?L)))
		(?I3 (SWEATSHIRT1407.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (SUZY.NAME HAVE.V SWEATSHIRT1407.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1408.SK))
		(!W2 (?I1 PRECOND-OF E1408.SK))
		(!W3 (?I2 PRECOND-OF E1408.SK))
		(!W4 (?I3 PRECOND-OF E1408.SK))
		(!W5 (?P1 POSTCOND-OF E1408.SK))
		(!W6 (E1408.SK (BEFORE ?X_D)))
		(!W7 (E1408.SK (BEFORE NOW390)))
		(!W8 (E1414.SK (BEFORE NOW394)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 79:
	; "I once saw a wolf."
	; "I was walking in the woods when I saw him."
	; "He was patrolling the woods."
	; "He was so big."
	; "I ran home very quickly."
; best schemas are:
; TAKE.1391.V
; GO.1241.V
; TAKE.1039.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; TAKE.928.V
; GO.1084.V
(setf matches (append matches '(( (4.41125 13)
("I once saw a wolf." "I was walking in the woods when I saw him."
 "He was patrolling the woods." "He was so big." "I ran home very quickly.")
(EPI-SCHEMA ((ME1428.SK
              (VERY.ADV
               (QUICKLY.ADV
                (HOME.ADV
                 ((ADV-A (FROM.P ?L1))
                  ((ADV-A (TO.P WOODS1420.SK)) (OUT.ADV RUN.1877.V))))))
              WOODS1420.SK)
             ** E1427.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (WOODS1420.SK LOCATION.N))
		(!R3 (NOT (?L1 = WOODS1420.SK)))
		(!R4 (WOODS1420.SK MAILBOX.N))
		(!R5 (ME1428.SK MAN.N))
		(!R6 (E1427.SK (RIGHT-AFTER ?X_A)))
		(!R7 (WOODS1420.SK PAPER.N))
		(!R8 (?X_C ((NN PAPER.N) BOY.N)))
		(!R9 (?X_C (PERTAIN-TO ME1428.SK)))
		(!R10 (ME1428.SK FLY.N))
		(!R11 (WOODS1420.SK SON.N))
		(!R12 (WOODS1420.SK MAN.N))
		(!R13 (WOODS1420.SK PERSON.N))
		(!R14 (WOODS1420.SK (PERTAIN-TO ME1428.SK)))
		(!R15 (ME1428.SK MALE.A))
		(!R16 (WOODS1420.SK ((NN STORE.N) TODAY.N)))
		(!R17 (WOODS1420.SK HARNESS.N))
		(!R18 (WOODS1420.SK INSTRUMENTALITY.N))
		(!R19 (ME1428.SK CAT.N))
		(!R20 (ME1428.SK ANIMAL.N))
		(!R21 (ME1428.SK AGENT.N))
		(!R22 (WOODS1420.SK (PLUR WOOD.N)))
	)
	(:GOALS
		(?G1 (ME1428.SK (WANT.V (KA ((ADV-A (AT.P WOODS1420.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1428.SK (AT.P ?L1)))
		(?I2 (NOT (ME1428.SK (AT.P WOODS1420.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1428.SK (AT.P ?L1))))
		(?P2 (ME1428.SK (AT.P WOODS1420.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1427.SK))
		(!W2 (?I2 BEFORE E1427.SK))
		(!W3 (?P1 AFTER E1427.SK))
		(!W4 (?P2 AFTER E1427.SK))
		(!W5 (?G1 CAUSE-OF E1427.SK))
		(!W6 (E1427.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1427.SK (BEFORE ?X_F)))
		(!W9 (E1427.SK (BEFORE NOW399)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R12 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R13 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C9 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C10 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C11 (!R17 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C13 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C14 (!R19 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.53125 4)
("I once saw a wolf." "I was walking in the woods when I saw him."
 "He was patrolling the woods." "He was so big." "I ran home very quickly.")
(EPI-SCHEMA ((ME1428.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1878.V
              (KA ((THERE.ADV SEE.V) OBJECT1417.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) OBJECT1417.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (OBJECT1417.SK ((NN MOTHER.N) BIRD.N)))
		(!R4 (OBJECT1417.SK BIRD.N))
		(!R5 (OBJECT1417.SK ((NN BABY.N) BIRD.N)))
		(!R6 (ME1428.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME1428.SK (WANT.V (THAT (NOT (ME1428.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME1428.SK (THERE.ADV SEE.V) OBJECT1417.SK)) CAUSE-OF
    (KE (ME1428.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1418.SK (ME1428.SK (THERE.ADV (THERE.ADV SEE.V)) OBJECT1417.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1418.SK))
		(!W2 (E1418.SK (BEFORE ?X_D)))
		(!W3 (E1418.SK (BEFORE ?X_E)))
		(!W4 (E1418.SK (BEFORE NOW395)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.955625 11)
("I once saw a wolf." "I was walking in the woods when I saw him."
 "He was patrolling the woods." "He was so big." "I ran home very quickly.")
(EPI-SCHEMA ((ME1428.SK
              (VERY.ADV
               (QUICKLY.ADV
                (HOME.ADV
                 ((ADV-A (FROM.P ?L1))
                  ((ADV-A (TO.P WOODS1420.SK)) (OUT.ADV RUN.1879.V))))))
              WOODS1420.SK)
             ** E1427.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (WOODS1420.SK LOCATION.N))
		(!R3 (NOT (?L1 = WOODS1420.SK)))
		(!R4 (WOODS1420.SK MAILBOX.N))
		(!R5 (ME1428.SK MAN.N))
		(!R6 (E1427.SK (RIGHT-AFTER ?X_A)))
		(!R7 (WOODS1420.SK PAPER.N))
		(!R8 (?X_C ((NN PAPER.N) BOY.N)))
		(!R9 (?X_C (PERTAIN-TO ME1428.SK)))
		(!R10 (ME1428.SK FLY.N))
		(!R11 (WOODS1420.SK SON.N))
		(!R12 (WOODS1420.SK MAN.N))
		(!R13 (WOODS1420.SK PERSON.N))
		(!R14 (WOODS1420.SK (PERTAIN-TO ME1428.SK)))
		(!R15 (ME1428.SK MALE.A))
		(!R16 (WOODS1420.SK ((NN STORE.N) TODAY.N)))
		(!R17 (ME1428.SK AGENT.N))
		(!R18 (WOODS1420.SK (PLUR WOOD.N)))
	)
	(:GOALS
		(?G1 (ME1428.SK (WANT.V (KA ((ADV-A (AT.P WOODS1420.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1428.SK (AT.P ?L1)))
		(?I2 (NOT (ME1428.SK (AT.P WOODS1420.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1428.SK (AT.P ?L1))))
		(?P2 (ME1428.SK (AT.P WOODS1420.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1427.SK))
		(!W2 (?I2 BEFORE E1427.SK))
		(!W3 (?P1 AFTER E1427.SK))
		(!W4 (?P2 AFTER E1427.SK))
		(!W5 (?G1 CAUSE-OF E1427.SK))
		(!W6 (E1427.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1427.SK (BEFORE ?X_F)))
		(!W9 (E1427.SK (BEFORE NOW399)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R12 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R13 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 80:
	; "Last night I was super tired."
	; "I really wanted to sleep."
	; "But I could not."
	; "So i stayed awake."
	; "It was torture."
; best schemas are:
; TAKE.1391.V
; GO.1241.V
; TAKE.1039.V
; TAKE.928.V
; GO.1084.V
; GO.828.V

; story 81:
	; "The man planted a tree."
	; "The tree grew to be very tall."
	; "One day their was a big storm."
	; "A branch fell from the tree."
	; "It broke a window of the man's house."
; best schemas are:
; GO.1084.V
; GO.1220.V
; GO.1241.V
; GO.828.V
; GO.212.V
; TAKE.928.V

; story 82:
	; "I went to the beach yesterday."
	; "I laid in a hammock."
	; "It was very relaxing."
	; "I fell asleep."
	; "I never wanted to go."
discarding schema GO.1241.V learned from this story
; best schemas are:
; TAKE.1391.V
; TAKE.1039.V
; TAKE.928.V
; GO.1084.V
; GO.828.V
(setf matches (append matches '(( (3.955625 11)
("I went to the beach yesterday." "I laid in a hammock."
 "It was very relaxing." "I fell asleep." "I never wanted to go.")
(EPI-SCHEMA ((ME1472.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P BEACH1463.SK)) (OUT.ADV GO.1896.V))))
              BEACH1463.SK)
             ** E1464.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (BEACH1463.SK LOCATION.N))
		(!R3 (NOT (?L1 = BEACH1463.SK)))
		(!R4 (BEACH1463.SK MAILBOX.N))
		(!R5 (ME1472.SK MAN.N))
		(!R6 (E1464.SK (RIGHT-AFTER ?X_A)))
		(!R7 (BEACH1463.SK PAPER.N))
		(!R8 (?X_C ((NN PAPER.N) BOY.N)))
		(!R9 (?X_C (PERTAIN-TO ME1472.SK)))
		(!R10 (ME1472.SK FLY.N))
		(!R11 (BEACH1463.SK SON.N))
		(!R12 (BEACH1463.SK MAN.N))
		(!R13 (BEACH1463.SK PERSON.N))
		(!R14 (BEACH1463.SK (PERTAIN-TO ME1472.SK)))
		(!R15 (ME1472.SK MALE.A))
		(!R16 (BEACH1463.SK ((NN STORE.N) TODAY.N)))
		(!R17 (ME1472.SK AGENT.N))
		(!R18 (BEACH1463.SK BEACH.N))
	)
	(:GOALS
		(?G1 (ME1472.SK (WANT.V (KA ((ADV-A (AT.P BEACH1463.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1472.SK (AT.P ?L1)))
		(?I2 (NOT (ME1472.SK (AT.P BEACH1463.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1472.SK (AT.P ?L1))))
		(?P2 (ME1472.SK (AT.P BEACH1463.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1464.SK))
		(!W2 (?I2 BEFORE E1464.SK))
		(!W3 (?P1 AFTER E1464.SK))
		(!W4 (?P2 AFTER E1464.SK))
		(!W5 (?G1 CAUSE-OF E1464.SK))
		(!W6 (E1464.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1464.SK (BEFORE ?X_F)))
		(!W9 (E1464.SK (BEFORE NOW410)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R12 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R13 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.955625 10)
("I went to the beach yesterday." "I laid in a hammock."
 "It was very relaxing." "I fell asleep." "I never wanted to go.")
(EPI-SCHEMA ((ME1472.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P BEACH1463.SK)) (OUT.ADV GO.1897.V))))
              BEACH1463.SK)
             ** E1464.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (BEACH1463.SK LOCATION.N))
		(!R3 (NOT (?L1 = BEACH1463.SK)))
		(!R4 (BEACH1463.SK MAILBOX.N))
		(!R5 (ME1472.SK MAN.N))
		(!R6 (E1464.SK (RIGHT-AFTER ?X_A)))
		(!R7 (BEACH1463.SK PAPER.N))
		(!R8 (?X_C ((NN PAPER.N) BOY.N)))
		(!R9 (?X_C (PERTAIN-TO ME1472.SK)))
		(!R10 (ME1472.SK FLY.N))
		(!R11 (BEACH1463.SK SON.N))
		(!R12 (BEACH1463.SK MAN.N))
		(!R13 (BEACH1463.SK PERSON.N))
		(!R14 (BEACH1463.SK (PERTAIN-TO ME1472.SK)))
		(!R15 (ME1472.SK MALE.A))
		(!R16 (BEACH1463.SK BEACH.N))
		(!R17 (ME1472.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME1472.SK (WANT.V (KA ((ADV-A (AT.P BEACH1463.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1472.SK (AT.P ?L1)))
		(?I2 (NOT (ME1472.SK (AT.P BEACH1463.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1472.SK (AT.P ?L1))))
		(?P2 (ME1472.SK (AT.P BEACH1463.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1464.SK))
		(!W2 (?I2 BEFORE E1464.SK))
		(!W3 (?P1 AFTER E1464.SK))
		(!W4 (?P2 AFTER E1464.SK))
		(!W5 (?G1 CAUSE-OF E1464.SK))
		(!W6 (E1464.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1464.SK (BEFORE NOW410)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R12 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R13 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 83:
	; "The man heard about a tragedy."
	; "He wanted to help."
	; "He called the cops."
	; "He asked if he could help."
	; "They told him to stay out of the way."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1136.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.662.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1059.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1127.V
; GO.1084.V

; story 84:
	; "John found a kid crying on a bench."
	; "John wanted to cheer him up."
	; "John bought him ice cream."
	; "The kid smiled."
	; "John made a new friend."
discarding schema PLAY.1257.V learned from this story
; best schemas are:
; GET.870.V
; SIT.274.V
; GET.741.V
; SIT.211.V
; SIT.505.V
(setf matches (append matches '(( (6.232593 10)
("John found a kid crying on a bench." "John wanted to cheer him up."
 "John bought him ice cream." "The kid smiled." "John made a new friend.")
(EPI-SCHEMA ((JOHN.NAME ((ADV-A (FROM.P (K WORK.N))) BUY.1903.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E1498.SK)
	(:ROLES
		(!R1 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (JOHN.NAME = (K HOME.N))))
		(!R4 (JOHN.NAME DAD.N))
		(!R5 (E1498.SK (RIGHT-AFTER ?X_A)))
		(!R6 (BENCH1493.SK (PERTAIN-TO JOHN.NAME)))
		(!R7 (BENCH1493.SK CAR.N))
		(!R8 (JOHN.NAME (PLUR FRIEND.N)))
		(!R9 (JOHN.NAME HOME.N))
		(!R10 (FRIEND1505.SK GIRL.N))
		(!R11 (JOHN.NAME (PERTAIN-TO FRIEND1505.SK)))
		(!R12 (JOHN.NAME (PERTAIN-TO ?X_C)))
		(!R13 (BENCH1493.SK STREET.N))
		(!R14 (?X_B VISIT.N))
		(!R15 (?X_B GREAT.A))
		(!R16 (JOHN.NAME AGENT.N))
		(!R17 (BENCH1493.SK (PERTAIN-TO FRIEND1505.SK)))
		(!R18 (?X_I AGENT.N))
		(!R19 (FRIEND1505.SK (PERTAIN-TO ?X_I)))
		(!R20 (HE.PRO MALE.A))
		(!R21 (HE.PRO AGENT.N))
		(!R22 (BENCH1493.SK BENCH.N))
		(!R23 (BENCH1493.SK INSTRUMENTALITY.N))
		(!R24 (BENCH1493.SK ARTIFACT.N))
		(!R25 (FRIEND1505.SK FRIEND.N))
		(!R26 (FRIEND1505.SK PERSON.N))
		(!R27 (FRIEND1505.SK NEW.A))
	)
	(:GOALS
		(E1496.SK (JOHN.NAME (WANT.V (THAT (JOHN.NAME (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (JOHN.NAME HAVE.V (K HOME.N))))
		(?I2 (JOHN.NAME (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (JOHN.NAME HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1498.SK))
		(!W2 (?I1 PRECOND-OF E1498.SK))
		(!W3 (?I2 PRECOND-OF E1498.SK))
		(!W4 (?I3 PRECOND-OF E1498.SK))
		(!W5 (?P1 POSTCOND-OF E1498.SK))
		(!W6 (E1498.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (?P1 (BEFORE ?X_L)))
		(!W9 (E1496.SK (BEFORE NOW421)))
		(!W10 (E1498.SK (BEFORE NOW422)))
	)
	(:CERTAINTIES
		(!C1 (!R24 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R13 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R26 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R25 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C7 (!R26 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R10 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C9 (!R26 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C10 (!R25 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C11 (!R26 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C13 (!R22 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C14 (!R24 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R26 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R25 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C17 (!R26 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.3713427 9)
("John found a kid crying on a bench." "John wanted to cheer him up."
 "John bought him ice cream." "The kid smiled." "John made a new friend.")
(EPI-SCHEMA ((JOHN.NAME ((ADV-A (FROM.P (K WORK.N))) BUY.1908.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E1498.SK)
	(:ROLES
		(!R1 (JOHN.NAME AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (JOHN.NAME = (K HOME.N))))
		(!R5 (JOHN.NAME DAD.N))
		(!R6 (E1498.SK (RIGHT-AFTER ?X_A)))
		(!R7 (BENCH1493.SK (PERTAIN-TO JOHN.NAME)))
		(!R8 (BENCH1493.SK CAR.N))
		(!R9 (JOHN.NAME (PLUR FRIEND.N)))
		(!R10 (JOHN.NAME HOME.N))
		(!R11 (FRIEND1505.SK GIRL.N))
		(!R12 (JOHN.NAME (PERTAIN-TO FRIEND1505.SK)))
		(!R13 (JOHN.NAME (PERTAIN-TO ?X_C)))
		(!R14 (BENCH1493.SK STREET.N))
		(!R15 (HE.PRO MALE.A))
		(!R16 (HE.PRO AGENT.N))
		(!R17 (BENCH1493.SK BENCH.N))
		(!R18 (BENCH1493.SK INSTRUMENTALITY.N))
		(!R19 (BENCH1493.SK ARTIFACT.N))
		(!R20 (FRIEND1505.SK FRIEND.N))
		(!R21 (FRIEND1505.SK PERSON.N))
		(!R22 (FRIEND1505.SK NEW.A))
	)
	(:GOALS
		(E1496.SK (JOHN.NAME (WANT.V (THAT (JOHN.NAME (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (JOHN.NAME HAVE.V (K HOME.N))))
		(?I2 (JOHN.NAME (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (JOHN.NAME HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1498.SK))
		(!W2 (?I1 PRECOND-OF E1498.SK))
		(!W3 (?I2 PRECOND-OF E1498.SK))
		(!W4 (?I3 PRECOND-OF E1498.SK))
		(!W5 (?P1 POSTCOND-OF E1498.SK))
		(!W6 (E1498.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E1496.SK (BEFORE NOW421)))
		(!W9 (E1498.SK (BEFORE NOW422)))
	)
	(:CERTAINTIES
		(!C1 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R14 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R17 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R21 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R11 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C9 (!R20 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C10 (!R21 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C11 (!R11 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 85:
	; "The couple worked out."
	; "The woman felt dizzy."
	; "The man sat down with her."
	; "The woman felt sick."
	; "The woman threw up on the man."
; best schemas are:
; GO.1220.V
; GO.212.V
; GO.1084.V
; GO.1241.V
; GO.828.V
; GET.870.V

; story 86:
	; "The man went fishing."
	; "He caught more than his limit."
	; "He kept all of the fish."
	; "He got caught with too many fish."
	; "He had to pay a big fine."
discarding schema GET.1260.V learned from this story
discarding schema GO.1261.V learned from this story
; best schemas are:
; GET.50.V
; TAKE.1391.V
; GO.1241.V
; GO.1084.V
(setf matches (append matches '(( (3.905 0)
("The man went fishing." "He caught more than his limit."
 "He kept all of the fish." "He got caught with too many fish."
 "He had to pay a big fine.")
(EPI-SCHEMA ((MAN1525.SK GET.1921.V
              (KA
               ((ADV-A
                 (WITH.P
                  (K
                   (L #:G1792470
                    (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
                (BE.PASV CATCH.V)))
              (AT.P-ARG ?L))
             ** E1534.SK)
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
    (MAN1525.SK =
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_C (TOO.ADV MANY.A)) (?X_D FISH.N))))))
       (BE.PASV CATCH.V))))))
		(!R4 (?X_L KINDLE.A))
		(!R5 (?X_L BOOK.N))
		(!R6 (MAN1525.SK AGENT.N))
		(!R7 (LIMIT1530.SK LIMIT.N))
		(!R8 (MAN1525.SK MAN.N))
		(!R9 (LIMIT1530.SK (PERTAIN-TO MAN1525.SK)))
	)
	(:GOALS
		(?G1
   (MAN1525.SK
    (WANT.V
     (THAT
      (MAN1525.SK
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
    (MAN1525.SK HAVE.V
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_H (TOO.ADV MANY.A)) (?X_I FISH.N))))))
       (BE.PASV CATCH.V))))))
		(?I2 (MAN1525.SK (AT.P ?L)))
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
   (MAN1525.SK HAVE.V
    (KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_M (TOO.ADV MANY.A)) (?X_N FISH.N))))))
      (BE.PASV CATCH.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1534.SK))
		(!W2 (?I1 PRECOND-OF E1534.SK))
		(!W3 (?I2 PRECOND-OF E1534.SK))
		(!W4 (?I3 PRECOND-OF E1534.SK))
		(!W5 (?P1 POSTCOND-OF E1534.SK))
		(!W6 (E1534.SK (BEFORE ?X_P)))
		(!W7 (E1534.SK (BEFORE ?X_R)))
		(!W8 (E1534.SK (BEFORE NOW433)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.9049997 17)
("The man went fishing." "He caught more than his limit."
 "He kept all of the fish." "He got caught with too many fish."
 "He had to pay a big fine.")
(EPI-SCHEMA ((MAN1525.SK
              (OUT.ADV
               ((ADV-A (TO.P (K FISHING.N))) ((ADV-A (FROM.P ?L1)) GO.1935.V)))
              (K FISHING.N))
             ** E1524.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K FISHING.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K FISHING.N))))
		(!R4 ((K FISHING.N) MAILBOX.N))
		(!R5 ((K FISHING.N) PAPER.N))
		(!R6 (LIMIT1530.SK ((NN PAPER.N) BOY.N)))
		(!R7 (MAN1525.SK FLY.N))
		(!R8 ((K FISHING.N) SON.N))
		(!R9 ((K FISHING.N) MAN.N))
		(!R10 ((K FISHING.N) PERSON.N))
		(!R11 ((K FISHING.N) (PERTAIN-TO MAN1525.SK)))
		(!R12 (MAN1525.SK MALE.A))
		(!R13 ((K FISHING.N) ((NN STORE.N) TODAY.N)))
		(!R14 (MAN1525.SK AGENT.N))
		(!R15 ((K FISHING.N) HARNESS.N))
		(!R16 ((K FISHING.N) INSTRUMENTALITY.N))
		(!R17 (MAN1525.SK CAT.N))
		(!R18 (MAN1525.SK ANIMAL.N))
		(!R19 (E1524.SK (RIGHT-AFTER U429)))
		(!R20 (MAN1525.SK MAN.N))
		(!R21 (LIMIT1530.SK LIMIT.N))
		(!R22 (LIMIT1530.SK (PERTAIN-TO MAN1525.SK)))
	)
	(:GOALS
		(?G1 (MAN1525.SK (WANT.V (KA ((ADV-A (AT.P (K FISHING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1525.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1525.SK (AT.P (K FISHING.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1525.SK (AT.P ?L1))))
		(?P2 (MAN1525.SK (AT.P (K FISHING.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1524.SK))
		(!W2 (?I2 BEFORE E1524.SK))
		(!W3 (?P1 AFTER E1524.SK))
		(!W4 (?P2 AFTER E1524.SK))
		(!W5 (?G1 CAUSE-OF E1524.SK))
		(!W6 (E1524.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1524.SK (BEFORE ?X_F)))
		(!W9 (E1524.SK (SAME-TIME NOW430)))
		(!W10 (E1527.SK (BEFORE NOW430)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R10 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R8 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R10 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R9 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R10 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C9 (!R16 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C10 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C11 (!R15 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C13 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C14 (!R17 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.9049997 13)
("The man went fishing." "He caught more than his limit."
 "He kept all of the fish." "He got caught with too many fish."
 "He had to pay a big fine.")
(EPI-SCHEMA ((MAN1525.SK
              (OUT.ADV
               ((ADV-A (TO.P (K FISHING.N))) ((ADV-A (FROM.P ?L1)) GO.1936.V)))
              (K FISHING.N))
             ** E1524.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K FISHING.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K FISHING.N))))
		(!R4 ((K FISHING.N) MAILBOX.N))
		(!R5 ((K FISHING.N) PAPER.N))
		(!R6 (LIMIT1530.SK ((NN PAPER.N) BOY.N)))
		(!R7 (MAN1525.SK FLY.N))
		(!R8 ((K FISHING.N) SON.N))
		(!R9 ((K FISHING.N) MAN.N))
		(!R10 ((K FISHING.N) PERSON.N))
		(!R11 ((K FISHING.N) (PERTAIN-TO MAN1525.SK)))
		(!R12 (MAN1525.SK MALE.A))
		(!R13 ((K FISHING.N) ((NN STORE.N) TODAY.N)))
		(!R14 (MAN1525.SK AGENT.N))
		(!R15 (E1524.SK (RIGHT-AFTER U429)))
		(!R16 (MAN1525.SK MAN.N))
		(!R17 (LIMIT1530.SK LIMIT.N))
		(!R18 (LIMIT1530.SK (PERTAIN-TO MAN1525.SK)))
	)
	(:GOALS
		(?G1 (MAN1525.SK (WANT.V (KA ((ADV-A (AT.P (K FISHING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1525.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1525.SK (AT.P (K FISHING.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1525.SK (AT.P ?L1))))
		(?P2 (MAN1525.SK (AT.P (K FISHING.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1524.SK))
		(!W2 (?I2 BEFORE E1524.SK))
		(!W3 (?P1 AFTER E1524.SK))
		(!W4 (?P2 AFTER E1524.SK))
		(!W5 (?G1 CAUSE-OF E1524.SK))
		(!W6 (E1524.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1524.SK (BEFORE ?X_F)))
		(!W9 (E1524.SK (SAME-TIME NOW430)))
		(!W10 (E1527.SK (BEFORE NOW430)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R10 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R8 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R10 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R9 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R10 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 87:
	; "We went in a hike in the woods by my house."
	; "The trees were very high."
	; "My brother climbed one of the trees."
	; "We told him to get down."
	; "He fell from the tree."
; best schemas are:
; TAKE.1391.V
; GO.1241.V
; TAKE.1039.V
; TAKE.928.V
; GO.1084.V
; GO.828.V
(setf matches (append matches '(( (4.41125 15)
("We went in a hike in the woods by my house." "The trees were very high."
 "My brother climbed one of the trees." "We told him to get down."
 "He fell from the tree.")
(EPI-SCHEMA ((WE1562.SK
              ((ADV-A (IN.P HIKE1542.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P WOOD1545.SK)) (OUT.ADV GO.1956.V))))
              WOOD1545.SK)
             ** E1546.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (WOOD1545.SK LOCATION.N))
		(!R3 (NOT (?L1 = WOOD1545.SK)))
		(!R4 (WOOD1545.SK MAILBOX.N))
		(!R5 (WE1562.SK MAN.N))
		(!R6 (E1546.SK (RIGHT-AFTER ?X_A)))
		(!R7 (WOOD1545.SK PAPER.N))
		(!R8 (BROTHER1551.SK ((NN PAPER.N) BOY.N)))
		(!R9 (BROTHER1551.SK (PERTAIN-TO WE1562.SK)))
		(!R10 (WE1562.SK FLY.N))
		(!R11 (WOOD1545.SK SON.N))
		(!R12 (WOOD1545.SK MAN.N))
		(!R13 (WOOD1545.SK PERSON.N))
		(!R14 (WOOD1545.SK (PERTAIN-TO WE1562.SK)))
		(!R15 (WE1562.SK MALE.A))
		(!R16 (WOOD1545.SK ((NN STORE.N) TODAY.N)))
		(!R17 (WOOD1545.SK HARNESS.N))
		(!R18 (WOOD1545.SK INSTRUMENTALITY.N))
		(!R19 (WE1562.SK CAT.N))
		(!R20 (WE1562.SK ANIMAL.N))
		(!R21 (WE1562.SK AGENT.N))
		(!R22 (HIKE1542.SK HIKE.N))
		(!R23 (WOOD1545.SK (PLUR WOOD.N)))
		(!R24 (BROTHER1551.SK BROTHER.N))
		(!R25 (BROTHER1551.SK (PERTAIN-TO ME1561.SK)))
		(!R26 (ME1561.SK AGENT.N))
	)
	(:GOALS
		(?G1 (WE1562.SK (WANT.V (KA ((ADV-A (AT.P WOOD1545.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (WE1562.SK (AT.P ?L1)))
		(?I2 (NOT (WE1562.SK (AT.P WOOD1545.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (WE1562.SK (AT.P ?L1))))
		(?P2 (WE1562.SK (AT.P WOOD1545.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1546.SK))
		(!W2 (?I2 BEFORE E1546.SK))
		(!W3 (?P1 AFTER E1546.SK))
		(!W4 (?P2 AFTER E1546.SK))
		(!W5 (?G1 CAUSE-OF E1546.SK))
		(!W6 (E1546.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1546.SK (BEFORE ?X_F)))
		(!W9 (E1546.SK (BEFORE NOW435)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R12 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R13 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C9 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C10 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C11 (!R17 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C13 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C14 (!R19 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.955625 13)
("We went in a hike in the woods by my house." "The trees were very high."
 "My brother climbed one of the trees." "We told him to get down."
 "He fell from the tree.")
(EPI-SCHEMA ((WE1562.SK
              ((ADV-A (IN.P HIKE1542.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P WOOD1545.SK)) (OUT.ADV GO.1969.V))))
              WOOD1545.SK)
             ** E1546.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (WOOD1545.SK LOCATION.N))
		(!R3 (NOT (?L1 = WOOD1545.SK)))
		(!R4 (WOOD1545.SK MAILBOX.N))
		(!R5 (WE1562.SK MAN.N))
		(!R6 (E1546.SK (RIGHT-AFTER ?X_A)))
		(!R7 (WOOD1545.SK PAPER.N))
		(!R8 (BROTHER1551.SK ((NN PAPER.N) BOY.N)))
		(!R9 (BROTHER1551.SK (PERTAIN-TO WE1562.SK)))
		(!R10 (WE1562.SK FLY.N))
		(!R11 (WOOD1545.SK SON.N))
		(!R12 (WOOD1545.SK MAN.N))
		(!R13 (WOOD1545.SK PERSON.N))
		(!R14 (WOOD1545.SK (PERTAIN-TO WE1562.SK)))
		(!R15 (WE1562.SK MALE.A))
		(!R16 (WOOD1545.SK ((NN STORE.N) TODAY.N)))
		(!R17 (WE1562.SK AGENT.N))
		(!R18 (HIKE1542.SK HIKE.N))
		(!R19 (WOOD1545.SK (PLUR WOOD.N)))
		(!R20 (BROTHER1551.SK BROTHER.N))
		(!R21 (BROTHER1551.SK (PERTAIN-TO ME1561.SK)))
		(!R22 (ME1561.SK AGENT.N))
	)
	(:GOALS
		(?G1 (WE1562.SK (WANT.V (KA ((ADV-A (AT.P WOOD1545.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (WE1562.SK (AT.P ?L1)))
		(?I2 (NOT (WE1562.SK (AT.P WOOD1545.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (WE1562.SK (AT.P ?L1))))
		(?P2 (WE1562.SK (AT.P WOOD1545.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1546.SK))
		(!W2 (?I2 BEFORE E1546.SK))
		(!W3 (?P1 AFTER E1546.SK))
		(!W4 (?P2 AFTER E1546.SK))
		(!W5 (?G1 CAUSE-OF E1546.SK))
		(!W6 (E1546.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1546.SK (BEFORE ?X_F)))
		(!W9 (E1546.SK (BEFORE NOW435)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R12 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R13 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.455625 13)
("We went in a hike in the woods by my house." "The trees were very high."
 "My brother climbed one of the trees." "We told him to get down."
 "He fell from the tree.")
(EPI-SCHEMA ((WE1562.SK
              ((ADV-A (IN.P HIKE1542.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P WOOD1545.SK)) (OUT.ADV GO.1970.V))))
              WOOD1545.SK)
             ** E1546.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (WOOD1545.SK LOCATION.N))
		(!R3 (NOT (?L1 = WOOD1545.SK)))
		(!R4 (WOOD1545.SK MAILBOX.N))
		(!R5 (WE1562.SK MAN.N))
		(!R6 (E1546.SK (RIGHT-AFTER ?X_A)))
		(!R7 (WOOD1545.SK PAPER.N))
		(!R8 (WOOD1545.SK (PERTAIN-TO WE1562.SK)))
		(!R9 (BROTHER1551.SK ((NN PAPER.N) BOY.N)))
		(!R10 (BROTHER1551.SK (PERTAIN-TO WE1562.SK)))
		(!R11 (WE1562.SK FLY.N))
		(!R12 (WOOD1545.SK SON.N))
		(!R13 (WOOD1545.SK MAN.N))
		(!R14 (WOOD1545.SK PERSON.N))
		(!R15 (WOOD1545.SK (PERTAIN-TO ME1561.SK)))
		(!R16 (ME1561.SK MALE.A))
		(!R17 (WE1562.SK AGENT.N))
		(!R18 (HIKE1542.SK HIKE.N))
		(!R19 (WOOD1545.SK (PLUR WOOD.N)))
		(!R20 (ME1561.SK AGENT.N))
		(!R21 (BROTHER1551.SK (PERTAIN-TO ME1561.SK)))
		(!R22 (BROTHER1551.SK BROTHER.N))
	)
	(:GOALS
		(?G1 (WE1562.SK (WANT.V (KA ((ADV-A (AT.P WOOD1545.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (WE1562.SK (AT.P ?L1)))
		(?I2 (NOT (WE1562.SK (AT.P WOOD1545.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (WE1562.SK (AT.P ?L1))))
		(?P2 (WE1562.SK (AT.P WOOD1545.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1546.SK))
		(!W2 (?I2 BEFORE E1546.SK))
		(!W3 (?P1 AFTER E1546.SK))
		(!W4 (?P2 AFTER E1546.SK))
		(!W5 (?G1 CAUSE-OF E1546.SK))
		(!W6 (E1546.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1546.SK (BEFORE NOW435)))
	)
	(:CERTAINTIES
		(!C1 (!R14 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R13 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R14 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R12 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R14 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R13 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R14 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 88:
	; "Mark is driving home."
	; "Mark hits a dog in the road."
	; "Mark gets out to see the dog."
	; "The dog is dead."
	; "Mark is sad he killed the dog."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.804.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1152.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.626.V

; story 89:
	; "I was sitting in my chair."
	; "I leaned back a little too far."
	; "I heard a tiny crack."
	; "I looked down at my chair."
	; "One of the legs had a crack."
; best schemas are:
; SIT.1381.V
; SIT.24.V
; GO_GET_NIL.677.PR
; SIT.211.V
; SIT.505.V
; SIT.49.V
(setf matches (append matches '(( (2.7920918 3)
("I was sitting in my chair." "I leaned back a little too far."
 "I heard a tiny crack." "I looked down at my chair."
 "One of the legs had a crack.")
(EPI-SCHEMA ((CHAIR1599.SK
              (SOMETIMES.ADV
               ((ADV-A (IN.P CHAIR1583.SK))
                ((ADV-A (ON.P CHAIR1583.SK)) SIT.2003.V))))
             ** E1581.SK)
	(:ROLES
		(!R1 (CHAIR1583.SK INANIMATE_OBJECT.N))
		(!R2 (CHAIR1583.SK FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (CHAIR1599.SK AGENT.N))
		(!R5 (CHAIR1583.SK BRIDGE.N))
		(!R6 (CHAIR1583.SK CHAIR.N))
		(!R7 (CHAIR1583.SK ARTIFACT.N))
		(!R8 (CHAIR1583.SK (PERTAIN-TO CHAIR1599.SK)))
		(!R9 (CHAIR1599.SK CHAIR.N))
		(!R10 (CHAIR1599.SK (PERTAIN-TO ME.PRO)))
	)
	(:GOALS
		(?G1 (CHAIR1599.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (CHAIR1599.SK (AT.P ?L)))
		(?I2 (CHAIR1583.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:EPISODE-RELATIONS
		(!W1 (E1581.SK (AT-ABOUT ?X_D)))
		(!W2 (E1581.SK (BEFORE NOW445)))
	)
	(:CERTAINTIES
		(!C1 (!R7 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R2 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R5 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R7 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R6 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 90:
	; "The boy kicked the rock."
	; "The rock came loose."
	; "It fell down a hill side."
	; "Someone was walking up the hill."
	; "The rock almost hit them."
; best schemas are:
; GO.1084.V
; GO.1241.V
; GO.828.V
; COME.126.V
; GO.1220.V
; GO.212.V

; story 91:
	; "A new teacher had a bad class."
	; "The children threw paper."
	; "The paper hit the teacher."
	; "She turned back at the class."
	; "She told them to shut up and sit down."
; best schemas are:
; GIVE.947.V
; FIND.129.V
; EAT.516.V
; GET.518.V
; GET.826.V
; GET.848.V

; story 92:
	; "The baby started to cry."
	; "The mother walked over to the baby."
	; "She saw that the baby was hungry."
	; "She breastfed the baby."
	; "The baby went back to sleep."
discarding schema GO.1338.V learned from this story
; best schemas are:
; FLY.235.V
; TAKE.928.V
; TAKE.1391.V
; TAKE.1039.V
; TAKE.302.V
(setf matches (append matches '(( (2.405 3)
("The baby started to cry." "The mother walked over to the baby."
 "She saw that the baby was hungry." "She breastfed the baby."
 "The baby went back to sleep.")
(EPI-SCHEMA ((BABY1640.SK
              ((ADV-A (FOR.P (KA SLEEP.V)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) (AWAY.ADV FLY.2042.V))))
              ?L2)
             ** E1654.SK)
	(:ROLES
		(!R1 (BABY1640.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (BABY1640.SK ((NN MOTHER.N) BIRD.N)))
		(!R6 (BABY1640.SK BIRD.N))
		(!R7 (BABY1640.SK ((NN BABY.N) BIRD.N)))
		(!R8 (BABY1640.SK BABY.N))
		(!R9 (E1654.SK (RIGHT-AFTER U463)))
	)
	(:GOALS
		(?G1 (BABY1640.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BABY1640.SK (AT.P ?L1)))
		(?I2 (NOT (BABY1640.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (BABY1640.SK (AT.P ?L1))))
		(?P2 (BABY1640.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1654.SK))
		(!W2 (?I2 BEFORE E1654.SK))
		(!W3 (?P1 AFTER E1654.SK))
		(!W4 (?P2 AFTER E1654.SK))
		(!W5 (?G1 CAUSE-OF E1654.SK))
		(!W6 (E1654.SK (BEFORE ?X_C)))
		(!W7 (E1654.SK (SAME-TIME NOW464)))
		(!W8 (E1657.SK (BEFORE NOW464)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 93:
	; "I was driving my grandmother's truck."
	; "She was holding coffee."
	; "I took a sharp turn."
	; "Coffee was all over her lap."
	; "She was nice about it."
; best schemas are:
; TAKE.1391.V
; TAKE.1039.V
; GO.1241.V
; TAKE.928.V
; TAKE.302.V
; GET.870.V

; story 94:
	; "The man ran out of gas."
	; "He tried to call for help."
	; "His phone would not work."
	; "He walked ten miles."
	; "He found a gas station."
discarding schema FIND.1361.V learned from this story
; best schemas are:
; FIND.708.V
; SHOP.797.V
; FOLLOW.709.V
; FIND.773.V
; FIND.888.V
(setf matches (append matches '(( (2.905 3)
("The man ran out of gas." "He tried to call for help."
 "His phone would not work." "He walked ten miles." "He found a gas station.")
(EPI-SCHEMA ((MAN1676.SK FIND.2066.V STATION1685.SK) ** E1686.SK)
	(:ROLES
		(!R1 (MAN1676.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (STATION1685.SK ((NN PHONE.N) RING.N)))
		(!R4 (STATION1685.SK PHONE.N))
		(!R5 (STATION1685.SK (PERTAIN-TO MAN1676.SK)))
		(!R6 (MAN1676.SK MAN.N))
		(!R7 (STATION1685.SK ((NN GAS.N) STATION.N)))
		(!R8 (PHONE1680.SK PHONE.N))
		(!R9 (PHONE1680.SK (PERTAIN-TO MAN1676.SK)))
	)
	(:PRECONDS
		(?I1 (MAN1676.SK (AT.P ?L)))
		(?I2 (STATION1685.SK (AT.P ?L)))
		(?I3 (MAN1676.SK ((ADV-A (FOR.P STATION1685.SK)) SEARCH.V)))
		(?I4 (NOT (MAN1676.SK (KNOW.V (THAT (STATION1685.SK (AT.P ?L)))))))
		(?I5 (NOT (MAN1676.SK (HAVE.V STATION1685.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1676.SK (KNOW.V (THAT (STATION1685.SK (AT.P ?L))))))
		(?P2 (MAN1676.SK (HAVE.V STATION1685.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1686.SK (BEFORE ?X_D)))
		(!W2 (E1686.SK (BEFORE NOW474)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.405 2)
("The man ran out of gas." "He tried to call for help."
 "His phone would not work." "He walked ten miles." "He found a gas station.")
(EPI-SCHEMA ((MAN1676.SK ((ADV-A (ON.P ?X_A)) FIND.2077.V) STATION1685.SK) **
             E1686.SK)
	(:ROLES
		(!R1 (MAN1676.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (?X_A GROUND.N))
		(!R4 (STATION1685.SK BAG.N))
		(!R5 (E1686.SK (RIGHT-AFTER ?X_B)))
		(!R6 (PHONE1680.SK WIFE.N))
		(!R7 (STATION1685.SK ((NN GAS.N) STATION.N)))
		(!R8 (MAN1676.SK MAN.N))
		(!R9 (PHONE1680.SK PHONE.N))
		(!R10 (PHONE1680.SK (PERTAIN-TO MAN1676.SK)))
	)
	(:PRECONDS
		(?I1 (MAN1676.SK (AT.P ?L)))
		(?I2 (STATION1685.SK (AT.P ?L)))
		(?I3 (MAN1676.SK ((ADV-A (FOR.P STATION1685.SK)) SEARCH.V)))
		(?I4 (NOT (MAN1676.SK (KNOW.V (THAT (STATION1685.SK (AT.P ?L)))))))
		(?I5 (NOT (MAN1676.SK (HAVE.V STATION1685.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1676.SK (KNOW.V (THAT (STATION1685.SK (AT.P ?L))))))
		(?P2 (MAN1676.SK (HAVE.V STATION1685.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1686.SK (SAME-TIME ?X_H)))
		(!W2 (?X_G (BEFORE ?X_H)))
		(!W3 (E1686.SK (BEFORE NOW474)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 1)
("The man ran out of gas." "He tried to call for help."
 "His phone would not work." "He walked ten miles." "He found a gas station.")
(EPI-SCHEMA ((MAN1676.SK FIND.2078.V STATION1685.SK) ** E1686.SK)
	(:ROLES
		(!R1 (MAN1676.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (STATION1685.SK ANSWER.N))
		(!R4 (E1686.SK (RIGHT-AFTER ?X_A)))
		(!R5 (?X_B STREET.N))
		(!R6 (MAN1676.SK (IN.P ?X_B)))
		(!R7 (MAN1676.SK MAN.N))
		(!R8 (STATION1685.SK ((NN GAS.N) STATION.N)))
		(!R9 (PHONE1680.SK PHONE.N))
		(!R10 (PHONE1680.SK (PERTAIN-TO MAN1676.SK)))
	)
	(:PRECONDS
		(?I1 (MAN1676.SK (AT.P ?L)))
		(?I2 (STATION1685.SK (AT.P ?L)))
		(?I3 (MAN1676.SK ((ADV-A (FOR.P STATION1685.SK)) SEARCH.V)))
		(?I4 (NOT (MAN1676.SK (KNOW.V (THAT (STATION1685.SK (AT.P ?L)))))))
		(?I5 (NOT (MAN1676.SK (HAVE.V STATION1685.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1676.SK (KNOW.V (THAT (STATION1685.SK (AT.P ?L))))))
		(?P2 (MAN1676.SK (HAVE.V STATION1685.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1686.SK (SAME-TIME ?X_G)))
		(!W2 (?X_F (BEFORE ?X_G)))
		(!W3 (E1686.SK (BEFORE NOW474)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 95:
	; "Susie got a puppy."
	; "One day she lost it."
	; "She looked everywhere."
	; "Finally she found it."
	; "It was under her bed."
; best schemas are:
; GET.826.V
; GET.333.V
; GET.821.V
; GET.218.V
; FIND.1038.V
; SHOP.797.V
(setf matches (append matches '(( (2.0 4)
("Susie got a puppy." "One day she lost it." "She looked everywhere."
 "Finally she found it." "It was under her bed.")
(EPI-SCHEMA (((K SUSIE.N)
              (BE.PASV ((ADV-A (FOR.P (K (PLUR PANT.N)))) SHOP.2084.V)))
             ** E1689.SK)
	(:ROLES
		(!R1 ((K SUSIE.N) AGENT.N))
		(!R2 (?LX LOCATION.N))
		(!R3 (?LO LOCATION.N))
		(!R4 (E1689.SK (RIGHT-AFTER ?X_A)))
		(!R5 ((K SUSIE.N) MAN.N))
		(!R6 (PUPPY1688.SK PUPPY.N))
	)
	(:GOALS
		(?G1 ((K SUSIE.N) (WANT.V (KA (FIND.V (K (PLUR PANT.N)))))))
		(?G2 ((K SUSIE.N) (WANT.V (KA (HAVE.V (K (PLUR PANT.N)))))))
	)
	(:PRECONDS
		(?I1 ((K SUSIE.N) (AT.P ?LX)))
		(?I2 ((K (PLUR PANT.N)) (AT.P ?LO)))
		(?I3 (NOT ((K SUSIE.N) (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?LO)))))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E1697.SK ((K SUSIE.N) (FIND.V (K (PLUR PANT.N)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1689.SK (SAME-TIME ?X_D)))
		(!W2 (E1697.SK (BEFORE ?X_F)))
		(!W3 (E1689.SK (BEFORE NOW475)))
		(!W4 (E1697.SK (BEFORE NOW478)))
	)
)
))))

; story 96:
	; "The bird caught a worm."
	; "It took the worm to its nest."
	; "It fed the worm to a baby bird."
	; "The baby bird was still hungry."
	; "The bird caught another worm."
discarding schema TAKE.1391.V learned from this story
; best schemas are:
; TAKE.1039.V
; TAKE.928.V
; TAKE.302.V
; FLY.235.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
(setf matches (append matches '(( (7.4933786 6)
("The bird caught a worm." "It took the worm to its nest."
 "It fed the worm to a baby bird." "The baby bird was still hungry."
 "The bird caught another worm.")
(EPI-SCHEMA ((BIRD1703.SK ((ADV-A (TO.P NEST1711.SK)) TAKE.2085.V) WORM1705.SK
              (AT.P-ARG ?L))
             ** E1712.SK)
	(:ROLES
		(!R1 (WORM1705.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (BIRD1703.SK = WORM1705.SK)))
		(!R4 (BIRD1703.SK ((NN BABY.N) BIRD.N)))
		(!R5 (BIRD1703.SK ((NN MOTHER.N) BIRD.N)))
		(!R6 (WORM1705.SK TREE.N))
		(!R7 (BIRD1703.SK AGENT.N))
		(!R8 (WORM1705.SK (PERTAIN-TO BIRD1703.SK)))
		(!R9 (WORM1705.SK CAT.N))
		(!R10 (WORM1705.SK WORM.N))
		(!R11 (WORM1705.SK ORGANISM.N))
		(!R12 (WORM1705.SK ANIMAL.N))
		(!R13 (BIRD1703.SK BIRD.N))
		(!R14 (NEST1711.SK (PERTAIN-TO BIRD1703.SK)))
		(!R15 (NEST1711.SK NEST.N))
	)
	(:GOALS
		(?G1 (BIRD1703.SK (WANT.V (THAT (BIRD1703.SK (HAVE.V WORM1705.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (BIRD1703.SK HAVE.V WORM1705.SK)))
		(?I2 (BIRD1703.SK (AT.P ?L)))
		(?I3 (WORM1705.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (BIRD1703.SK HAVE.V WORM1705.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1712.SK))
		(!W2 (?I1 PRECOND-OF E1712.SK))
		(!W3 (?I2 PRECOND-OF E1712.SK))
		(!W4 (?I3 PRECOND-OF E1712.SK))
		(!W5 (?P1 POSTCOND-OF E1712.SK))
		(!W6 (E1712.SK (BEFORE ?X_E)))
		(!W7 (?P1 (AT-ABOUT ?X_H)))
		(!W8 (E1712.SK (BEFORE NOW481)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R10 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R6 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C4 (!R12 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R9 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R11 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R12 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C8 (!R9 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C9 (!R11 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C10 (!R11 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C11 (!R10 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C12 (!R12 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C13 (!R12 CERTAIN-TO-DEGREE (/ 2 5)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (7.1633005 8)
("The bird caught a worm." "It took the worm to its nest."
 "It fed the worm to a baby bird." "The baby bird was still hungry."
 "The bird caught another worm.")
(EPI-SCHEMA ((BIRD1703.SK ((ADV-A (TO.P NEST1711.SK)) TAKE.2086.V) WORM1705.SK
              (AT.P-ARG ?L))
             ** E1712.SK)
	(:ROLES
		(!R1 (WORM1705.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (BIRD1703.SK = WORM1705.SK)))
		(!R4 (BIRD1703.SK ((NN BABY.N) BIRD.N)))
		(!R5 (BIRD1703.SK ((NN MOTHER.N) BIRD.N)))
		(!R6 (WORM1705.SK TREE.N))
		(!R7 (WORM1705.SK VISIT.N))
		(!R8 (WORM1705.SK GREAT.A))
		(!R9 (NEST1711.SK FRIEND.N))
		(!R10 (NEST1711.SK (PERTAIN-TO NEST1711.SK)))
		(!R11 (BIRD1703.SK AGENT.N))
		(!R12 (WORM1705.SK WORM.N))
		(!R13 (WORM1705.SK ORGANISM.N))
		(!R14 (BIRD1703.SK BIRD.N))
		(!R15 (NEST1711.SK (PERTAIN-TO BIRD1703.SK)))
		(!R16 (NEST1711.SK NEST.N))
	)
	(:GOALS
		(?G1 (BIRD1703.SK (WANT.V (THAT (BIRD1703.SK (HAVE.V WORM1705.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (BIRD1703.SK HAVE.V WORM1705.SK)))
		(?I2 (BIRD1703.SK (AT.P ?L)))
		(?I3 (WORM1705.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (BIRD1703.SK HAVE.V WORM1705.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1712.SK))
		(!W2 (?I1 PRECOND-OF E1712.SK))
		(!W3 (?I2 PRECOND-OF E1712.SK))
		(!W4 (?I3 PRECOND-OF E1712.SK))
		(!W5 (?P1 POSTCOND-OF E1712.SK))
		(!W6 (E1712.SK (BEFORE ?X_E)))
		(!W7 (?P1 (BEFORE ?X_I)))
		(!W8 (E1712.SK (BEFORE NOW481)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R6 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (7.1633005 4)
("The bird caught a worm." "It took the worm to its nest."
 "It fed the worm to a baby bird." "The baby bird was still hungry."
 "The bird caught another worm.")
(EPI-SCHEMA ((BIRD1703.SK ((ADV-A (TO.P NEST1711.SK)) TAKE.2087.V) WORM1705.SK
              (AT.P-ARG ?L))
             ** E1712.SK)
	(:ROLES
		(!R1 (BIRD1703.SK AGENT.N))
		(!R2 (WORM1705.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (BIRD1703.SK = WORM1705.SK)))
		(!R5 (BIRD1703.SK ((NN BABY.N) BIRD.N)))
		(!R6 (BIRD1703.SK ((NN MOTHER.N) BIRD.N)))
		(!R7 (WORM1705.SK TREE.N))
		(!R8 (WORM1705.SK WORM.N))
		(!R9 (WORM1705.SK ORGANISM.N))
		(!R10 (BIRD1703.SK BIRD.N))
		(!R11 (NEST1711.SK (PERTAIN-TO BIRD1703.SK)))
		(!R12 (NEST1711.SK NEST.N))
	)
	(:GOALS
		(?G1 (BIRD1703.SK (WANT.V (THAT (BIRD1703.SK (HAVE.V WORM1705.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (BIRD1703.SK HAVE.V WORM1705.SK)))
		(?I2 (BIRD1703.SK (AT.P ?L)))
		(?I3 (WORM1705.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (BIRD1703.SK HAVE.V WORM1705.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1712.SK))
		(!W2 (?I1 PRECOND-OF E1712.SK))
		(!W3 (?I2 PRECOND-OF E1712.SK))
		(!W4 (?I3 PRECOND-OF E1712.SK))
		(!W5 (?P1 POSTCOND-OF E1712.SK))
		(!W6 (E1712.SK (BEFORE ?X_E)))
		(!W7 (E1712.SK (BEFORE NOW481)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R7 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R9 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R8 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 97:
	; "Today I went to school."
	; "It was the first day of school."
	; "I met all my new teachers."
	; "I got all of my homework."
	; "I went home from school."
; best schemas are:
; TAKE.1391.V
; GO.1241.V
; TAKE.1039.V
; GO.1084.V
; GO.828.V
; GET.870.V
(setf matches (append matches '(( (4.91125 14)
("Today I went to school." "It was the first day of school."
 "I met all my new teachers." "I got all of my homework."
 "I went home from school.")
(EPI-SCHEMA ((ME1736.SK
              (OUT.ADV
               ((ADV-A (TO.P (K SCHOOL.N))) ((ADV-A (FROM.P ?L1)) GO.2107.V)))
              (K SCHOOL.N))
             ** E1727.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K SCHOOL.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K SCHOOL.N))))
		(!R4 ((K SCHOOL.N) MAILBOX.N))
		(!R5 (ME1736.SK MAN.N))
		(!R6 (E1727.SK (RIGHT-AFTER ?X_A)))
		(!R7 ((K SCHOOL.N) PAPER.N))
		(!R8 (OBJECT1731.SK ((NN PAPER.N) BOY.N)))
		(!R9 (ME1736.SK FLY.N))
		(!R10 ((K SCHOOL.N) SON.N))
		(!R11 ((K SCHOOL.N) MAN.N))
		(!R12 ((K SCHOOL.N) PERSON.N))
		(!R13 ((K SCHOOL.N) (PERTAIN-TO ME1736.SK)))
		(!R14 (ME1736.SK MALE.A))
		(!R15 ((K SCHOOL.N) ((NN STORE.N) TODAY.N)))
		(!R16 ((K SCHOOL.N) HARNESS.N))
		(!R17 ((K SCHOOL.N) INSTRUMENTALITY.N))
		(!R18 (ME1736.SK CAT.N))
		(!R19 (ME1736.SK ANIMAL.N))
		(!R20 (ME1736.SK AGENT.N))
		(!R21 (OBJECT1731.SK (PERTAIN-TO ME1736.SK)))
	)
	(:GOALS
		(?G1 (ME1736.SK (WANT.V (KA ((ADV-A (AT.P (K SCHOOL.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1736.SK (AT.P ?L1)))
		(?I2 (NOT (ME1736.SK (AT.P (K SCHOOL.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1736.SK (AT.P ?L1))))
		(?P2 (ME1736.SK (AT.P (K SCHOOL.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1727.SK))
		(!W2 (?I2 BEFORE E1727.SK))
		(!W3 (?P1 AFTER E1727.SK))
		(!W4 (?P2 AFTER E1727.SK))
		(!W5 (?G1 CAUSE-OF E1727.SK))
		(!W6 (E1727.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1727.SK (BEFORE ?X_F)))
		(!W9 (E1727.SK (BEFORE NOW485)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R12 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R12 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R12 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C9 (!R17 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C10 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C11 (!R16 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C13 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C14 (!R18 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.455625 12)
("Today I went to school." "It was the first day of school."
 "I met all my new teachers." "I got all of my homework."
 "I went home from school.")
(EPI-SCHEMA ((ME1736.SK
              (OUT.ADV
               ((ADV-A (TO.P (K SCHOOL.N))) ((ADV-A (FROM.P ?L1)) GO.2111.V)))
              (K SCHOOL.N))
             ** E1727.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K SCHOOL.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K SCHOOL.N))))
		(!R4 ((K SCHOOL.N) MAILBOX.N))
		(!R5 (ME1736.SK MAN.N))
		(!R6 (E1727.SK (RIGHT-AFTER ?X_A)))
		(!R7 ((K SCHOOL.N) PAPER.N))
		(!R8 (OBJECT1731.SK ((NN PAPER.N) BOY.N)))
		(!R9 (ME1736.SK FLY.N))
		(!R10 ((K SCHOOL.N) SON.N))
		(!R11 ((K SCHOOL.N) MAN.N))
		(!R12 ((K SCHOOL.N) PERSON.N))
		(!R13 ((K SCHOOL.N) (PERTAIN-TO ME1736.SK)))
		(!R14 (ME1736.SK MALE.A))
		(!R15 ((K SCHOOL.N) ((NN STORE.N) TODAY.N)))
		(!R16 (ME1736.SK AGENT.N))
		(!R17 (OBJECT1731.SK (PERTAIN-TO ME1736.SK)))
	)
	(:GOALS
		(?G1 (ME1736.SK (WANT.V (KA ((ADV-A (AT.P (K SCHOOL.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1736.SK (AT.P ?L1)))
		(?I2 (NOT (ME1736.SK (AT.P (K SCHOOL.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1736.SK (AT.P ?L1))))
		(?P2 (ME1736.SK (AT.P (K SCHOOL.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1727.SK))
		(!W2 (?I2 BEFORE E1727.SK))
		(!W3 (?P1 AFTER E1727.SK))
		(!W4 (?P2 AFTER E1727.SK))
		(!W5 (?G1 CAUSE-OF E1727.SK))
		(!W6 (E1727.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1727.SK (BEFORE ?X_F)))
		(!W9 (E1727.SK (BEFORE NOW485)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R12 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R12 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R12 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.455625 11)
("Today I went to school." "It was the first day of school."
 "I met all my new teachers." "I got all of my homework."
 "I went home from school.")
(EPI-SCHEMA ((ME1736.SK
              (OUT.ADV
               ((ADV-A (TO.P (K SCHOOL.N))) ((ADV-A (FROM.P ?L1)) GO.2112.V)))
              (K SCHOOL.N))
             ** E1727.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K SCHOOL.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K SCHOOL.N))))
		(!R4 ((K SCHOOL.N) MAILBOX.N))
		(!R5 (ME1736.SK MAN.N))
		(!R6 (E1727.SK (RIGHT-AFTER ?X_A)))
		(!R7 ((K SCHOOL.N) PAPER.N))
		(!R8 (OBJECT1731.SK ((NN PAPER.N) BOY.N)))
		(!R9 (ME1736.SK FLY.N))
		(!R10 ((K SCHOOL.N) SON.N))
		(!R11 ((K SCHOOL.N) MAN.N))
		(!R12 ((K SCHOOL.N) PERSON.N))
		(!R13 ((K SCHOOL.N) (PERTAIN-TO ME1736.SK)))
		(!R14 (ME1736.SK MALE.A))
		(!R15 (ME1736.SK AGENT.N))
		(!R16 (OBJECT1731.SK (PERTAIN-TO ME1736.SK)))
	)
	(:GOALS
		(?G1 (ME1736.SK (WANT.V (KA ((ADV-A (AT.P (K SCHOOL.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1736.SK (AT.P ?L1)))
		(?I2 (NOT (ME1736.SK (AT.P (K SCHOOL.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1736.SK (AT.P ?L1))))
		(?P2 (ME1736.SK (AT.P (K SCHOOL.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1727.SK))
		(!W2 (?I2 BEFORE E1727.SK))
		(!W3 (?P1 AFTER E1727.SK))
		(!W4 (?P2 AFTER E1727.SK))
		(!W5 (?G1 CAUSE-OF E1727.SK))
		(!W6 (E1727.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1727.SK (BEFORE NOW485)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R12 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R12 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R12 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 98:
	; "I was in Chicago."
	; "I was singing with a few people."
	; "A man listened to us sing."
	; "He gave us tips."
	; "It was very helpful."
; best schemas are:
; TAKE.1391.V
; GO.1241.V
; TAKE.1039.V
; GO.1084.V
; GO.828.V
; TAKE.928.V

; story 99:
	; "The tree started to grow."
	; "It was in another tree's shadow."
	; "It needed more sun."
	; "One day the other tree fell."
	; "The tree grew quickly then."
; best schemas are:
; TAKE.928.V
; TAKE.1391.V
; TAKE.1039.V
; TAKE.302.V
; CLIMB.347.V
; CLIMB_GET_EAT.349.PR

