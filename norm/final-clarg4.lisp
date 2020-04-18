(setf matches (list))
(setf chain-matches (list))
; story 0:
	; "Mary wanted to stop working."
	; "She was tired of working."
	; "She met a man with a lot of money."
	; "She married him."
	; "She never had to work again."
; best schemas are:
; RUN.311.V
; GO.423.V
; GO.1261.V
; GO.51.V
; RUN.227.V
; FLOAT.561.V

; story 1:
	; "Susie say a girl was playing ball."
	; "She wanted to play with her too."
	; "So she went ahead and asked for permission."
	; "The girl said no."
	; "Susie then started to cry."
discarding schema GO.6.V learned from this story
; best schemas are:
; GO.658.V
; GO.1024.V
; GO.642.V
; RUN.401.V
; BUMP.400.V
(setf matches (append matches '(( (2.905 0)
("Susie say a girl was playing ball." "She wanted to play with her too."
 "So she went ahead and asked for permission." "The girl said no."
 "Susie then started to cry.")
(EPI-SCHEMA ((GIRL26.SK
              (AHEAD.ADV
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_A)) PLAY.V))))
                  GO.7.V))))
              ?L2)
             ** E30.SK)
	(:ROLES
		(!R1 (GIRL26.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A (PLUR FRIEND.N)))
		(!R6 (?X_A HOME.N))
		(!R7 (?X_A (PERTAIN-TO GIRL26.SK)))
		(!R8 (?X_A (PERTAIN-TO ?X_B)))
		(!R9 (GIRL26.SK GIRL.N))
		(!R10 (E35.SK (AT-OR-BEFORE NOW7)))
	)
	(:GOALS
		(?G1 (GIRL26.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL26.SK (AT.P ?L1)))
		(?I2 (NOT (GIRL26.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL26.SK (AT.P ?L1))))
		(?P2 (GIRL26.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E30.SK))
		(!W2 (?I2 BEFORE E30.SK))
		(!W3 (?P1 AFTER E30.SK))
		(!W4 (?P2 AFTER E30.SK))
		(!W5 (?G1 CAUSE-OF E30.SK))
		(!W6 (E30.SK (BEFORE ?X_E)))
		(!W7 (E30.SK (CONSEC E34.SK)))
		(!W8 (E34.SK (DURING E28.SK)))
		(!W9 (E30.SK (DURING E28.SK)))
		(!W10 (E28.SK (BEFORE NOW7)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 0)
("Susie say a girl was playing ball." "She wanted to play with her too."
 "So she went ahead and asked for permission." "The girl said no."
 "Susie then started to cry.")
(EPI-SCHEMA ((GIRL26.SK
              (AHEAD.ADV
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) (OUT.ADV ((ADV-A (FOR.P ?X_A)) GO.8.V)))))
              ?L2)
             ** E30.SK)
	(:ROLES
		(!R1 (GIRL26.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A PASS.N))
		(!R6 (?X_A BALL.N))
		(!R7 (?X_B ARM.N))
		(!R8 (?X_B (PERTAIN-TO GIRL26.SK)))
		(!R9 (GIRL26.SK GIRL.N))
		(!R10 (E35.SK (AT-OR-BEFORE NOW7)))
	)
	(:GOALS
		(?G1 (GIRL26.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL26.SK (AT.P ?L1)))
		(?I2 (NOT (GIRL26.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL26.SK (AT.P ?L1))))
		(?P2 (GIRL26.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E30.SK))
		(!W2 (?I2 BEFORE E30.SK))
		(!W3 (?P1 AFTER E30.SK))
		(!W4 (?P2 AFTER E30.SK))
		(!W5 (?G1 CAUSE-OF E30.SK))
		(!W6 (E30.SK (BEFORE ?X_E)))
		(!W7 (E30.SK (CONSEC E34.SK)))
		(!W8 (E34.SK (DURING E28.SK)))
		(!W9 (E30.SK (DURING E28.SK)))
		(!W10 (E28.SK (BEFORE NOW7)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 0)
("Susie say a girl was playing ball." "She wanted to play with her too."
 "So she went ahead and asked for permission." "The girl said no."
 "Susie then started to cry.")
(EPI-SCHEMA ((GIRL26.SK
              (AHEAD.ADV ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.9.V)))
              ?X_C)
             ** E30.SK)
	(:ROLES
		(!R1 (GIRL26.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (?X_A (PLUR PERSON.N)))
		(!R6 (GIRL26.SK GIRL.N))
		(!R7 (E35.SK (AT-OR-BEFORE NOW7)))
	)
	(:GOALS
		(?G1 (GIRL26.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL26.SK (AT.P ?L1)))
		(?I2 (NOT (GIRL26.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL26.SK (AT.P ?L1))))
		(?P2 (GIRL26.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E30.SK))
		(!W2 (?I2 BEFORE E30.SK))
		(!W3 (?P1 AFTER E30.SK))
		(!W4 (?P2 AFTER E30.SK))
		(!W5 (?G1 CAUSE-OF E30.SK))
		(!W6 (E30.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E30.SK (CONSEC E34.SK)))
		(!W9 (E34.SK (DURING E28.SK)))
		(!W10 (E30.SK (DURING E28.SK)))
		(!W11 (E28.SK (BEFORE NOW7)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 2)
("Susie say a girl was playing ball." "She wanted to play with her too."
 "So she went ahead and asked for permission." "The girl said no."
 "Susie then started to cry.")
(EPI-SCHEMA ((GIRL26.SK
              (AHEAD.ADV
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA (GET.V (K HELP.N))))) RUN.10.V))))
              ?L2)
             ** E30.SK)
	(:ROLES
		(!R1 (GIRL26.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (GIRL26.SK FRIEND.N))
		(!R6 (?X_D FEMALE.A))
		(!R7 (?X_D AGENT.N))
		(!R8 (E30.SK (RIGHT-AFTER ?X_A)))
		(!R9 (GIRL26.SK (PERTAIN-TO ?X_D)))
		(!R10 (GIRL26.SK HEAD.N))
		(!R11 (?X_C HEAD.N))
		(!R12 (?X_C (PERTAIN-TO ?X_D)))
		(!R13 (E35.SK (AT-OR-BEFORE NOW7)))
		(!R14 (GIRL26.SK GIRL.N))
		(!R15 (GIRL26.SK PERSON.N))
	)
	(:GOALS
		(?G1 (GIRL26.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL26.SK (AT.P ?L1)))
		(?I2 (NOT (GIRL26.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (GIRL26.SK (AT.P ?L1))))
		(?P2 (GIRL26.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E30.SK))
		(!W2 (?I2 BEFORE E30.SK))
		(!W3 (?P1 AFTER E30.SK))
		(!W4 (?P2 AFTER E30.SK))
		(!W5 (?G1 CAUSE-OF E30.SK))
		(!W6 (E30.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E30.SK (CONSEC E34.SK)))
		(!W9 (E34.SK (DURING E28.SK)))
		(!W10 (E30.SK (DURING E28.SK)))
		(!W11 (E28.SK (BEFORE NOW7)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R14 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 2:
	; "The boy locked the cage."
	; "He left for school."
	; "He returned home."
	; "The cage was unlocked."
	; "He caught his brother playing with his bird."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; GO.423.V
; GO.1411.V
; GO.742.V
; TAKE.135.V
; TAKE.1391.V

; story 3:
	; "The man went to a cafeteria."
	; "He got his lunch."
	; "He sat down by himself."
	; "A woman asked if she could sit down."
	; "The woman became a new friend."
discarding schema SIT.49.V learned from this story
discarding schema GO.51.V learned from this story
discarding schema GET.50.V learned from this story
; best schemas are:
; RUN.401.V
; GO.642.V
; GO.843.V
(setf matches (append matches '(( (4.4049997 8)
("The man went to a cafeteria." "He got his lunch." "He sat down by himself."
 "A woman asked if she could sit down." "The woman became a new friend.")
(EPI-SCHEMA ((MAN75.SK
              ((ADV-A (FOR.P (KA (GET.V (K HELP.N)))))
               ((ADV-A (TO.P CAFETERIA77.SK)) ((ADV-A (FROM.P ?L1)) RUN.31.V)))
              CAFETERIA77.SK)
             ** E74.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (CAFETERIA77.SK LOCATION.N))
		(!R3 (NOT (?L1 = CAFETERIA77.SK)))
		(!R4 (MAN75.SK FRIEND.N))
		(!R5 (MAN75.SK (PERTAIN-TO MAN75.SK)))
		(!R6 (MAN75.SK FEMALE.A))
		(!R7 (MAN75.SK AGENT.N))
		(!R8 (LUNCH83.SK GIRL.N))
		(!R9 (LUNCH83.SK HEAD.N))
		(!R10 (?X_C HEAD.N))
		(!R11 (?X_C (PERTAIN-TO MAN75.SK)))
		(!R12 (CAFETERIA77.SK CAFETERIA.N))
		(!R13 (E74.SK (RIGHT-AFTER U14)))
		(!R14 (MAN75.SK MAN.N))
		(!R15 (MAN75.SK PERSON.N))
		(!R16 (LUNCH83.SK (PERTAIN-TO MAN75.SK)))
		(!R17 (LUNCH83.SK LUNCH.N))
	)
	(:GOALS
		(?G1 (MAN75.SK (WANT.V (KA ((ADV-A (AT.P CAFETERIA77.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN75.SK (AT.P ?L1)))
		(?I2 (NOT (MAN75.SK (AT.P CAFETERIA77.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN75.SK (AT.P ?L1))))
		(?P2 (MAN75.SK (AT.P CAFETERIA77.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E74.SK))
		(!W2 (?I2 BEFORE E74.SK))
		(!W3 (?P1 AFTER E74.SK))
		(!W4 (?P2 AFTER E74.SK))
		(!W5 (?G1 CAUSE-OF E74.SK))
		(!W6 (E74.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E74.SK (SAME-TIME NOW15)))
		(!W9 (E78.SK (BEFORE NOW15)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R14 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.68625 3)
("The man went to a cafeteria." "He got his lunch." "He sat down by himself."
 "A woman asked if she could sit down." "The woman became a new friend.")
(EPI-SCHEMA ((MAN75.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P CAFETERIA77.SK)) GO.32.V))
              CAFETERIA77.SK)
             ** E74.SK)
	(:ROLES
		(!R1 (MAN75.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (CAFETERIA77.SK LOCATION.N))
		(!R4 (NOT (?L1 = CAFETERIA77.SK)))
		(!R5 (WOMAN89.SK (PLUR PERSON.N)))
		(!R6 (CAFETERIA77.SK CAFETERIA.N))
		(!R7 (MAN75.SK MAN.N))
		(!R8 (E74.SK (RIGHT-AFTER U14)))
		(!R9 (LUNCH83.SK (PERTAIN-TO MAN75.SK)))
		(!R10 (LUNCH83.SK LUNCH.N))
		(!R11 (WOMAN89.SK WOMAN.N))
	)
	(:GOALS
		(?G1 (MAN75.SK (WANT.V (KA ((ADV-A (AT.P CAFETERIA77.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN75.SK (AT.P ?L1)))
		(?I2 (NOT (MAN75.SK (AT.P CAFETERIA77.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN75.SK (AT.P ?L1))))
		(?P2 (MAN75.SK (AT.P CAFETERIA77.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E74.SK))
		(!W2 (?I2 BEFORE E74.SK))
		(!W3 (?P1 AFTER E74.SK))
		(!W4 (?P2 AFTER E74.SK))
		(!W5 (?G1 CAUSE-OF E74.SK))
		(!W6 (E74.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E74.SK (SAME-TIME NOW15)))
		(!W9 (E78.SK (BEFORE NOW15)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 4:
	; "I was sitting in the house."
	; "The garbage started to smell."
	; "It was very bad."
	; "So I had to take it out."
	; "It still did not get rid of the smell."
discarding schema SIT.65.V learned from this story
; best schemas are:
; COME.126.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1029.V
; FLY.235.V
; GIVE.194.V
; TAKE.413.V

; story 5:
	; "Susie got lost."
	; "She needed a map."
	; "So she looked through her pocket."
	; "She found an old map."
	; "She was relieved."
; best schemas are:
; FIND.773.V
; COME.917.V
; COME.917.V
; COME.917.V
; GO.1083.V
; GO_FIND_EAT.566.PR

; story 6:
	; "Susie loved chocolate."
	; "So she got a box."
	; "She then decided to go and eat it."
	; "It tasted bad."
	; "She was not happy about it."
discarding schema GET.79.V learned from this story
; best schemas are:
; RUN.58.V
; RUN.401.V
; GO.423.V
; FIND.1005.V
; RECEIVING_VERB.?

; story 7:
	; "The man was in the dark."
	; "He looked for a flashlight."
	; "He could not find one."
	; "He became frightened."
	; "The power came back on in five minutes."
; best schemas are:
; GO.1083.V
; RUN.311.V
; GO.423.V
; GO.1261.V
; GO.51.V
; RUN.227.V

; story 8:
	; "Jerry has a mouse."
	; "His wife wants to get a cat."
	; "Jerry said no."
	; "His wife got a cat behind his back."
	; "The cat and mouse are best friends."
discarding schema GET.88.V learned from this story
; best schemas are:
; FEED.660.V
; GIVE.194.V
; GET.310.V
; GET.848.V
; GET.460.V
(setf matches (append matches '(( (4.9049997 3)
("Jerry has a mouse." "His wife wants to get a cat." "Jerry said no."
 "His wife got a cat behind his back." "The cat and mouse are best friends.")
(EPI-SCHEMA ((WIFE182.SK GET.67.V (KA (BE.PASV STARTLE.V)) (AT.P-ARG ?L)) **
             E192.SK)
	(:ROLES
		(!R1 (WIFE182.SK AGENT.N))
		(!R2 ((KA (BE.PASV STARTLE.V)) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (WIFE182.SK = (KA (BE.PASV STARTLE.V)))))
		(!R5 (WIFE182.SK MOUSE.N))
		(!R6 (CAT184.SK CAT.N))
		(!R7 (E181.SK (RIGHT-AFTER U40)))
		(!R8 (CAT191.SK CAT.N))
		(!R9 (WIFE182.SK WIFE.N))
		(!R10 (WIFE182.SK (PERTAIN-TO JERRY.NAME)))
		(!R11 (E187.SK (RIGHT-AFTER U42)))
	)
	(:GOALS
		(E181.SK
   (WIFE182.SK (WANT.V (THAT (WIFE182.SK (HAVE.V (KA (BE.PASV STARTLE.V))))))))
	)
	(:PRECONDS
		(?I1 (NOT (WIFE182.SK HAVE.V (KA (BE.PASV STARTLE.V)))))
		(?I2 (WIFE182.SK (AT.P ?L)))
		(?I3 ((KA (BE.PASV STARTLE.V)) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (WIFE182.SK HAVE.V (KA (BE.PASV STARTLE.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E192.SK))
		(!W2 (?I1 PRECOND-OF E192.SK))
		(!W3 (?I2 PRECOND-OF E192.SK))
		(!W4 (?I3 PRECOND-OF E192.SK))
		(!W5 (?P1 POSTCOND-OF E192.SK))
		(!W6 (E192.SK (BEFORE ?X_C)))
		(!W7 (E181.SK (SAME-TIME NOW41)))
		(!W8 (E185.SK (AT-ABOUT NOW41)))
		(!W9 (E192.SK (BEFORE NOW43)))
		(!W10 (E187.SK (SAME-TIME NOW43)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.546113 2)
("Jerry has a mouse." "His wife wants to get a cat." "Jerry said no."
 "His wife got a cat behind his back." "The cat and mouse are best friends.")
(EPI-SCHEMA ((WIFE182.SK ((ADV-A (FROM.P (K WORK.N))) GET.70.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E192.SK)
	(:ROLES
		(!R1 (WIFE182.SK AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (WIFE182.SK = (K HOME.N))))
		(!R5 (WIFE182.SK (PERTAIN-TO WIFE182.SK)))
		(!R6 (CAT184.SK CAT.N))
		(!R7 (E181.SK (RIGHT-AFTER U40)))
		(!R8 (CAT191.SK CAT.N))
		(!R9 (E187.SK (RIGHT-AFTER U42)))
		(!R10 (WIFE182.SK WIFE.N))
		(!R11 (WIFE182.SK (PERTAIN-TO JERRY.NAME)))
	)
	(:GOALS
		(E185.SK (WIFE182.SK (WANT.V (THAT (WIFE182.SK (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (WIFE182.SK HAVE.V (K HOME.N))))
		(?I2 (WIFE182.SK (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (WIFE182.SK HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E192.SK))
		(!W2 (?I1 PRECOND-OF E192.SK))
		(!W3 (?I2 PRECOND-OF E192.SK))
		(!W4 (?I3 PRECOND-OF E192.SK))
		(!W5 (?P1 POSTCOND-OF E192.SK))
		(!W6 (E192.SK (BEFORE ?X_D)))
		(!W7 (E185.SK (AT-ABOUT NOW41)))
		(!W8 (E181.SK (SAME-TIME NOW41)))
		(!W9 (E192.SK (BEFORE NOW43)))
		(!W10 (E187.SK (SAME-TIME NOW43)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 9:
	; "The singer worked hard."
	; "She got better."
	; "People noticed her."
	; "She made an album."
	; "The people bought it."
discarding schema MAKE.100.V learned from this story
discarding schema PLAY.103.V learned from this story
; best schemas are:
; RUN.401.V
; TAKE.413.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1136.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1127.V
(setf matches (append matches '(( (1.2590625 2)
("The singer worked hard." "She got better." "People noticed her."
 "She made an album." "The people bought it.")
(EPI-SCHEMA (((K (PLUR PERSON.N)) AVOID_ACTION_TO_AVOID_DISPLEASURE.75.V
              (KA NOTICE.V))
             ** ?E)
	(:ROLES
		(!R1 ((K (PLUR PERSON.N)) AGENT.N))
		(!R2 ((KA NOTICE.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 ((K (PLUR PERSON.N)) MAN.N))
		(!R5 (SINGER195.SK SINGER.N))
	)
	(:GOALS
		(?G1
   ((K (PLUR PERSON.N))
    (WANT.V (THAT (NOT ((K (PLUR PERSON.N)) (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE ((K (PLUR PERSON.N)) NOTICE.V)) CAUSE-OF
    (KE ((K (PLUR PERSON.N)) (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E198.SK ((K (PLUR PERSON.N)) NOTICE.V))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E198.SK))
		(!W2 (E198.SK (BEFORE ?X_C)))
		(!W3 (E198.SK (BEFORE NOW47)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.2590625 2)
("The singer worked hard." "She got better." "People noticed her."
 "She made an album." "The people bought it.")
(EPI-SCHEMA (((K (PLUR PERSON.N)) AVOID_ACTION_TO_AVOID_DISPLEASURE.75.V
              (KA NOTICE.V))
             ** ?E)
	(:ROLES
		(!R1 ((K (PLUR PERSON.N)) AGENT.N))
		(!R2 ((KA NOTICE.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 ((K (PLUR PERSON.N)) MAN.N))
		(!R5 (SINGER195.SK SINGER.N))
	)
	(:GOALS
		(?G1
   ((K (PLUR PERSON.N))
    (WANT.V (THAT (NOT ((K (PLUR PERSON.N)) (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE ((K (PLUR PERSON.N)) NOTICE.V)) CAUSE-OF
    (KE ((K (PLUR PERSON.N)) (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E198.SK ((K (PLUR PERSON.N)) NOTICE.V))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E198.SK))
		(!W2 (E198.SK (BEFORE ?X_C)))
		(!W3 (E198.SK (BEFORE NOW47)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 10:
	; "Travis had a rough life."
	; "He didn't like to talk about it."
	; "He often hid himself."
	; "He stayed in the corner of rooms."
	; "Then someone approached him."
; best schemas are:
; RUN.311.V
; TAKE.413.V
; WALK.989.V
; BUMP.400.V
; GO.276.V
; SIT.274.V

; story 11:
	; "Tom was in a band."
	; "They had very few fans."
	; "They tried to hold a show."
	; "Half a dozen people showed up."
	; "Tom's band still played their heart out."
; best schemas are:
; GIVE.194.V
; TAKE.413.V
; FEED.660.V
; TAKE.946.V
; GIVE.1297.V
; TAKE.135.V

; story 12:
	; "My son was outside playing."
	; "His best friend came by the house."
	; "They went off on an adventure."
	; "They were gone for quite some time."
	; "They came home before dark."
discarding schema COME.126.V learned from this story
; best schemas are:
; GO.658.V
; COME.605.V
; COME.239.V
; TAKE.413.V
; GO.642.V
(setf matches (append matches '(( (2.905 4)
("My son was outside playing." "His best friend came by the house."
 "They went off on an adventure." "They were gone for quite some time."
 "They came home before dark.")
(EPI-SCHEMA ((FRIEND250.SK
              ((ADV-A (BY.P HOUSE252.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P SON247.SK)) PLAY.V))))
                  COME.102.V))))
              ?L2)
             ** E249.SK)
	(:ROLES
		(!R1 (FRIEND250.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (SON247.SK (PLUR FRIEND.N)))
		(!R6 (SON247.SK HOME.N))
		(!R7 (SON247.SK (PERTAIN-TO FRIEND250.SK)))
		(!R8 (FRIEND250.SK GIRL.N))
		(!R9 (HOUSE252.SK HOUSE.N))
		(!R10 (E249.SK (RIGHT-AFTER U60)))
		(!R11 (SON247.SK SON.N))
		(!R12 (SON247.SK (PERTAIN-TO ME263.SK)))
		(!R13 (ME263.SK AGENT.N))
		(!R14 (FRIEND250.SK FRIEND.N))
		(!R15 (FRIEND250.SK PERSON.N))
		(!R16 (FRIEND250.SK BEST.A))
		(!R17 (FRIEND250.SK (PERTAIN-TO ME263.SK)))
	)
	(:GOALS
		(?G1 (FRIEND250.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND250.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND250.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND250.SK (AT.P ?L1))))
		(?P2 (FRIEND250.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E249.SK))
		(!W2 (?I2 BEFORE E249.SK))
		(!W3 (?P1 AFTER E249.SK))
		(!W4 (?P2 AFTER E249.SK))
		(!W5 (?G1 CAUSE-OF E249.SK))
		(!W6 (E249.SK (BEFORE ?X_E)))
		(!W7 (E249.SK (SAME-TIME NOW61)))
		(!W8 (E256.SK (BEFORE NOW61)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R14 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.9049997 1)
("My son was outside playing." "His best friend came by the house."
 "They went off on an adventure." "They were gone for quite some time."
 "They came home before dark.")
(EPI-SCHEMA ((FRIEND250.SK
              ((ADV-A (BY.P HOUSE252.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA VISIT.V))) COME.103.V))))
              ?L2)
             ** E249.SK)
	(:ROLES
		(!R1 (FRIEND250.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (SON247.SK (PLUR BROTHER.N)))
		(!R6 (HOUSE252.SK HOUSE.N))
		(!R7 (SON247.SK SON.N))
		(!R8 (SON247.SK (PERTAIN-TO ME263.SK)))
		(!R9 (ME263.SK AGENT.N))
		(!R10 (FRIEND250.SK FRIEND.N))
		(!R11 (FRIEND250.SK BEST.A))
		(!R12 (FRIEND250.SK (PERTAIN-TO ME263.SK)))
		(!R13 (E249.SK (RIGHT-AFTER U60)))
	)
	(:GOALS
		(?G1 (FRIEND250.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND250.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND250.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND250.SK (AT.P ?L1))))
		(?P2 (FRIEND250.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E249.SK))
		(!W2 (?I2 BEFORE E249.SK))
		(!W3 (?P1 AFTER E249.SK))
		(!W4 (?P2 AFTER E249.SK))
		(!W5 (?G1 CAUSE-OF E249.SK))
		(!W6 (E249.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (?G1 (BEFORE ?X_I)))
		(!W9 (E249.SK (SAME-TIME NOW61)))
		(!W10 (E256.SK (BEFORE NOW61)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 2)
("My son was outside playing." "His best friend came by the house."
 "They went off on an adventure." "They were gone for quite some time."
 "They came home before dark.")
(EPI-SCHEMA ((FRIEND250.SK
              ((ADV-A (BY.P HOUSE252.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (AT.P (K WORK.N)))
                  ((ADV-A (THROUGH.P ?X_A)) COME.104.V)))))
              ?L2)
             ** E249.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (?X_A DOOR.N))
		(!R5 (FRIEND250.SK AGENT.N))
		(!R6 (SON247.SK (PERTAIN-TO FRIEND250.SK)))
		(!R7 (SON247.SK FRIEND.N))
		(!R8 (HOUSE252.SK HOUSE.N))
		(!R9 (E249.SK (RIGHT-AFTER U60)))
		(!R10 (SON247.SK SON.N))
		(!R11 (SON247.SK PERSON.N))
		(!R12 (SON247.SK (PERTAIN-TO ME263.SK)))
		(!R13 (ME263.SK AGENT.N))
		(!R14 (FRIEND250.SK FRIEND.N))
		(!R15 (FRIEND250.SK BEST.A))
		(!R16 (FRIEND250.SK (PERTAIN-TO ME263.SK)))
	)
	(:GOALS
		(?G1 (FRIEND250.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND250.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND250.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND250.SK (AT.P ?L1))))
		(?P2 (FRIEND250.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E249.SK))
		(!W2 (?I2 BEFORE E249.SK))
		(!W3 (?P1 AFTER E249.SK))
		(!W4 (?P2 AFTER E249.SK))
		(!W5 (?G1 CAUSE-OF E249.SK))
		(!W6 (E249.SK (BEFORE ?X_E)))
		(!W7 (E249.SK (SAME-TIME NOW61)))
		(!W8 (E256.SK (BEFORE NOW61)))
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
(setf matches (append matches '(( (2.6328125 0)
("My son was outside playing." "His best friend came by the house."
 "They went off on an adventure." "They were gone for quite some time."
 "They came home before dark.")
(EPI-SCHEMA ((FRIEND250.SK
              ((ADV-A (BY.P HOUSE252.SK))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) COME.129.V)))
              ?X_C)
             ** E249.SK)
	(:ROLES
		(!R1 (FRIEND250.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (THEY264.SK (PLUR PERSON.N)))
		(!R6 (FRIEND250.SK FRIEND.N))
		(!R7 (FRIEND250.SK BEST.A))
		(!R8 (HOUSE252.SK HOUSE.N))
		(!R9 (FRIEND250.SK (PERTAIN-TO ME263.SK)))
		(!R10 (ME263.SK AGENT.N))
		(!R11 (E249.SK (RIGHT-AFTER U60)))
		(!R12 (SON247.SK SON.N))
		(!R13 (SON247.SK (PERTAIN-TO ME263.SK)))
		(!R14 (THEY264.SK AGENT.N))
	)
	(:GOALS
		(?G1 (FRIEND250.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND250.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND250.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND250.SK (AT.P ?L1))))
		(?P2 (FRIEND250.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E249.SK))
		(!W2 (?I2 BEFORE E249.SK))
		(!W3 (?P1 AFTER E249.SK))
		(!W4 (?P2 AFTER E249.SK))
		(!W5 (?G1 CAUSE-OF E249.SK))
		(!W6 (E249.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E249.SK (SAME-TIME NOW61)))
		(!W9 (E256.SK (BEFORE NOW61)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 13:
	; "Rose was at the jewelry store."
	; "She wanted to buy a new watch."
	; "She tried on each one."
	; "She liked the rose gold watch the most."
	; "She bought it and wore it home."
; best schemas are:
; GO.591.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
; TAKE.958.V
; GET.518.V
; GET.672.V
; GET.826.V
(setf matches (append matches '(( (3.03125 6)
("Rose was at the jewelry store." "She wanted to buy a new watch."
 "She tried on each one." "She liked the rose gold watch the most."
 "She bought it and wore it home.")
(EPI-SCHEMA ((ROSE.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.131.V
              (KA (LIKE.V WATCH283.SK)))
             ** ?E)
	(:ROLES
		(!R1 (ROSE.NAME AGENT.N))
		(!R2 ((KA (LIKE.V WATCH283.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (WATCH273.SK ((NN HAIR.N) CUT.N)))
		(!R5 (WATCH283.SK ((NN HAIR.N) STYLIST.N)))
		(!R6 (WATCH283.SK HAIR.N))
		(!R7 (WATCH283.SK (PERTAIN-TO ROSE.NAME)))
		(!R8 (PRED?282.SK PRED?.N))
		(!R9 (PRED?282.SK MOST.A))
		(!R10 (WATCH273.SK WATCH.N))
		(!R11 (WATCH273.SK NEW.A))
	)
	(:GOALS
		(E274.SK (ROSE.NAME (WANT.V (THAT (NOT (ROSE.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ROSE.NAME LIKE.V WATCH283.SK)) CAUSE-OF
    (KE (ROSE.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E284.SK (ROSE.NAME LIKE.V WATCH283.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E274.SK CAUSE-OF E284.SK))
		(!W2 (E274.SK (BEFORE ?X_E)))
		(!W3 (E284.SK (BEFORE ?X_G)))
		(!W4 (E274.SK (BEFORE NOW66)))
		(!W5 (E284.SK (BEFORE NOW68)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (6.0 6)
("Rose was at the jewelry store." "She wanted to buy a new watch."
 "She tried on each one." "She liked the rose gold watch the most."
 "She bought it and wore it home.")
(EPI-SCHEMA ((ROSE.NAME BUY.142.V WATCH283.SK (AT.P-ARG STORE268.SK)) **
             E290.SK)
	(:ROLES
		(!R1 (ROSE.NAME AGENT.N))
		(!R2 (WATCH283.SK INANIMATE_OBJECT.N))
		(!R3 (STORE268.SK LOCATION.N))
		(!R4 (NOT (ROSE.NAME = WATCH283.SK)))
		(!R5 (?X_A PHONE.N))
		(!R6 (WATCH283.SK PRED?.N))
		(!R7 (?X_B (AT-OR-BEFORE ?X_J)))
		(!R8 (STORE268.SK ((NN JEWELRY.N) STORE.N)))
		(!R9 (WATCH273.SK WATCH.N))
		(!R10 (WATCH273.SK NEW.A))
	)
	(:GOALS
		(E274.SK (ROSE.NAME (WANT.V (THAT (ROSE.NAME (HAVE.V WATCH283.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ROSE.NAME HAVE.V WATCH283.SK)))
		(E294.SK (ROSE.NAME (AT.P STORE268.SK)))
		(?I3 (WATCH283.SK (AT.P STORE268.SK)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ROSE.NAME HAVE.V WATCH283.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E290.SK))
		(!W2 (?I1 PRECOND-OF E290.SK))
		(!W3 (E294.SK PRECOND-OF E290.SK))
		(!W4 (?I3 PRECOND-OF E290.SK))
		(!W5 (?P1 POSTCOND-OF E290.SK))
		(!W6 (E274.SK (BEFORE ?X_F)))
		(!W7 (?X_H (CONSEC E290.SK)))
		(!W8 (E290.SK (DURING ?X_I)))
		(!W9 (?X_H (DURING ?X_I)))
		(!W10 (?X_I (BEFORE ?X_J)))
		(!W11 (E294.SK (BEFORE NOW65)))
		(!W12 (E274.SK (BEFORE NOW66)))
		(!W13 (E290.SK (BEFORE NOW69)))
		(!W14 (E287.SK (BEFORE NOW69)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (6.0 7)
("Rose was at the jewelry store." "She wanted to buy a new watch."
 "She tried on each one." "She liked the rose gold watch the most."
 "She bought it and wore it home.")
(EPI-SCHEMA ((ROSE.NAME BUY.143.V WATCH283.SK (AT.P-ARG STORE268.SK)) **
             E290.SK)
	(:ROLES
		(!R1 (ROSE.NAME AGENT.N))
		(!R2 (WATCH283.SK INANIMATE_OBJECT.N))
		(!R3 (STORE268.SK LOCATION.N))
		(!R4 (NOT (ROSE.NAME = WATCH283.SK)))
		(!R5 (WATCH283.SK DOG.N))
		(!R6 (WATCH283.SK NEW.A))
		(!R7 (?X_A (PERTAIN-TO ROSE.NAME)))
		(!R8 (?X_A DOG.N))
		(!R9 (?X_B (WALK.V ROSE.NAME)))
		(!R10 (?X_B EVENING.N))
		(!R11 (STORE268.SK ((NN JEWELRY.N) STORE.N)))
		(!R12 (WATCH273.SK WATCH.N))
		(!R13 (WATCH273.SK NEW.A))
	)
	(:GOALS
		(E274.SK (ROSE.NAME (WANT.V (THAT (ROSE.NAME (HAVE.V WATCH283.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ROSE.NAME HAVE.V WATCH283.SK)))
		(E294.SK (ROSE.NAME (AT.P STORE268.SK)))
		(?I3 (WATCH283.SK (AT.P STORE268.SK)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ROSE.NAME HAVE.V WATCH283.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E290.SK))
		(!W2 (?I1 PRECOND-OF E290.SK))
		(!W3 (E294.SK PRECOND-OF E290.SK))
		(!W4 (?I3 PRECOND-OF E290.SK))
		(!W5 (?P1 POSTCOND-OF E290.SK))
		(!W6 (E290.SK (AT-ABOUT ?X_F)))
		(!W7 (E294.SK (BEFORE NOW65)))
		(!W8 (E274.SK (BEFORE NOW66)))
		(!W9 (E290.SK (BEFORE NOW69)))
		(!W10 (E287.SK (BEFORE NOW69)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 14:
	; "Jill bought a new dress."
	; "She tried it on when she got home."
	; "The dress didn't fit."
	; "Jill couldn't find the receipt."
	; "Jill gave the dress to one of her friends."
; best schemas are:
; GIVE.947.V
; GIVE.241.V
; GET.518.V
; GET.672.V
; GET.826.V
; GET.848.V
(setf matches (append matches '(( (4.625 3)
("Jill bought a new dress." "She tried it on when she got home."
 "The dress didn't fit." "Jill couldn't find the receipt."
 "Jill gave the dress to one of her friends.")
(EPI-SCHEMA ((JILL.NAME BUY.146.V DRESS299.SK (AT.P-ARG ?L)) ** E300.SK)
	(:ROLES
		(!R1 (DRESS299.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (JILL.NAME = DRESS299.SK)))
		(!R4 (DRESS299.SK KITTEN.N))
		(!R5 (JILL.NAME AGENT.N))
		(!R6 (?X_A (PERTAIN-TO JILL.NAME)))
		(!R7 (?X_A (PLUR SHOE.N)))
		(!R8 (DRESS299.SK NEW.A))
		(!R9 (DRESS299.SK DRESS.N))
	)
	(:GOALS
		(?G1 (JILL.NAME (WANT.V (THAT (JILL.NAME (HAVE.V DRESS299.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (JILL.NAME HAVE.V DRESS299.SK)))
		(?I2 (JILL.NAME (AT.P ?L)))
		(?I3 (DRESS299.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (JILL.NAME HAVE.V DRESS299.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E300.SK))
		(!W2 (?I1 PRECOND-OF E300.SK))
		(!W3 (?I2 PRECOND-OF E300.SK))
		(!W4 (?I3 PRECOND-OF E300.SK))
		(!W5 (?P1 POSTCOND-OF E300.SK))
		(!W6 (E300.SK (BEFORE ?X_E)))
		(!W7 (E300.SK (BEFORE NOW70)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.125 3)
("Jill bought a new dress." "She tried it on when she got home."
 "The dress didn't fit." "Jill couldn't find the receipt."
 "Jill gave the dress to one of her friends.")
(EPI-SCHEMA ((JILL.NAME BUY.147.V DRESS299.SK (AT.P-ARG ?L)) ** E300.SK)
	(:ROLES
		(!R1 (JILL.NAME AGENT.N))
		(!R2 (DRESS299.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (JILL.NAME = DRESS299.SK)))
		(!R5 (?X_A PHONE.N))
		(!R6 (DRESS299.SK PRED?.N))
		(!R7 (?X_B (AT-OR-BEFORE ?X_J)))
		(!R8 (DRESS299.SK NEW.A))
		(!R9 (DRESS299.SK DRESS.N))
	)
	(:GOALS
		(?G1 (JILL.NAME (WANT.V (THAT (JILL.NAME (HAVE.V DRESS299.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (JILL.NAME HAVE.V DRESS299.SK)))
		(?I2 (JILL.NAME (AT.P ?L)))
		(?I3 (DRESS299.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (JILL.NAME HAVE.V DRESS299.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E300.SK))
		(!W2 (?I1 PRECOND-OF E300.SK))
		(!W3 (?I2 PRECOND-OF E300.SK))
		(!W4 (?I3 PRECOND-OF E300.SK))
		(!W5 (?P1 POSTCOND-OF E300.SK))
		(!W6 (?G1 (BEFORE ?X_F)))
		(!W7 (?X_H (CONSEC E300.SK)))
		(!W8 (E300.SK (DURING ?X_I)))
		(!W9 (?X_H (DURING ?X_I)))
		(!W10 (?X_I (BEFORE ?X_J)))
		(!W11 (E300.SK (BEFORE NOW70)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.625 3)
("Jill bought a new dress." "She tried it on when she got home."
 "The dress didn't fit." "Jill couldn't find the receipt."
 "Jill gave the dress to one of her friends.")
(EPI-SCHEMA ((JILL.NAME BUY.148.V DRESS299.SK (AT.P-ARG ?L)) ** E300.SK)
	(:ROLES
		(!R1 (JILL.NAME AGENT.N))
		(!R2 (DRESS299.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (JILL.NAME = DRESS299.SK)))
		(!R5 (DRESS299.SK DOG.N))
		(!R6 (?X_A (PERTAIN-TO JILL.NAME)))
		(!R7 (?X_A DOG.N))
		(!R8 (?X_B (WALK.V JILL.NAME)))
		(!R9 (?X_B EVENING.N))
		(!R10 (DRESS299.SK NEW.A))
		(!R11 (DRESS299.SK DRESS.N))
	)
	(:GOALS
		(?G1 (JILL.NAME (WANT.V (THAT (JILL.NAME (HAVE.V DRESS299.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (JILL.NAME HAVE.V DRESS299.SK)))
		(?I2 (JILL.NAME (AT.P ?L)))
		(?I3 (DRESS299.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (JILL.NAME HAVE.V DRESS299.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E300.SK))
		(!W2 (?I1 PRECOND-OF E300.SK))
		(!W3 (?I2 PRECOND-OF E300.SK))
		(!W4 (?I3 PRECOND-OF E300.SK))
		(!W5 (?P1 POSTCOND-OF E300.SK))
		(!W6 (E300.SK (AT-ABOUT ?X_F)))
		(!W7 (E300.SK (BEFORE NOW70)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 15:
	; "I was walking my dog."
	; "I let go of the leash."
	; "I ran after her."
	; "I got a cut on my thigh from a branch."
	; "I still have the scar."
discarding schema GET.218.V learned from this story
; best schemas are:
; GET.826.V
; RUN.401.V
; GET.1260.V
; GET.88.V
; GIVE.194.V
(setf matches (append matches '(( (7.0 4)
("I was walking my dog." "I let go of the leash." "I ran after her."
 "I got a cut on my thigh from a branch." "I still have the scar.")
(EPI-SCHEMA ((ME337.SK ((ADV-A (FROM.P BRANCH330.SK)) GET.150.V) CUT332.SK
              (AT.P-ARG ?L))
             ** E333.SK)
	(:ROLES
		(!R1 (CUT332.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME337.SK = CUT332.SK)))
		(!R4 (CUT332.SK DOG.N))
		(!R5 (CUT332.SK NEW.A))
		(!R6 (?X_B (WALK.V ME337.SK)))
		(!R7 (?X_B EVENING.N))
		(!R8 (CUT332.SK CUT.N))
		(!R9 (BRANCH330.SK BRANCH.N))
		(!R10 (SCAR335.SK SCAR.N))
		(!R11 (DOG322.SK DOG.N))
		(!R12 (DOG322.SK (PERTAIN-TO ME337.SK)))
		(!R13 (ME337.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME337.SK (WANT.V (THAT (ME337.SK (HAVE.V CUT332.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME337.SK HAVE.V CUT332.SK)))
		(?I2 (ME337.SK (AT.P ?L)))
		(?I3 (CUT332.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E336.SK (ME337.SK HAVE.V CUT332.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E333.SK))
		(!W2 (?I1 PRECOND-OF E333.SK))
		(!W3 (?I2 PRECOND-OF E333.SK))
		(!W4 (?I3 PRECOND-OF E333.SK))
		(!W5 (E336.SK POSTCOND-OF E333.SK))
		(!W6 (E333.SK (AT-ABOUT ?X_F)))
		(!W7 (E333.SK (BEFORE NOW78)))
		(!W8 (E336.SK (AT-ABOUT NOW79)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.2278125 4)
("I was walking my dog." "I let go of the leash." "I ran after her."
 "I got a cut on my thigh from a branch." "I still have the scar.")
(EPI-SCHEMA ((ME337.SK
              ((ADV-A (AFTER.P SHE.PRO))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA (GET.V (K HELP.N))))) RUN.151.V))))
              ?L2)
             ** E327.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (ME337.SK FRIEND.N))
		(!R5 (ME337.SK (PERTAIN-TO ME337.SK)))
		(!R6 (ME337.SK FEMALE.A))
		(!R7 (E327.SK (RIGHT-AFTER ?X_A)))
		(!R8 (DOG322.SK GIRL.N))
		(!R9 (DOG322.SK HEAD.N))
		(!R10 (?X_C HEAD.N))
		(!R11 (?X_C (PERTAIN-TO ME337.SK)))
		(!R12 (SHE.PRO FEMALE.A))
		(!R13 (SHE.PRO AGENT.N))
		(!R14 (DOG322.SK DOG.N))
		(!R15 (DOG322.SK (PERTAIN-TO ME337.SK)))
		(!R16 (ME337.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME337.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME337.SK (AT.P ?L1)))
		(?I2 (NOT (ME337.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME337.SK (AT.P ?L1))))
		(?P2 (ME337.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E327.SK))
		(!W2 (?I2 BEFORE E327.SK))
		(!W3 (?P1 AFTER E327.SK))
		(!W4 (?P2 AFTER E327.SK))
		(!W5 (?G1 CAUSE-OF E327.SK))
		(!W6 (E327.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E327.SK (BEFORE NOW77)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.227813 1)
("I was walking my dog." "I let go of the leash." "I ran after her."
 "I got a cut on my thigh from a branch." "I still have the scar.")
(EPI-SCHEMA ((ME337.SK ((ADV-A (FROM.P BRANCH330.SK)) GET.152.V)
              (KA
               ((ADV-A
                 (WITH.P
                  (K
                   (L #:G1792470
                    (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
                (BE.PASV CATCH.V)))
              (AT.P-ARG ?L))
             ** E333.SK)
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
    (ME337.SK =
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_C (TOO.ADV MANY.A)) (?X_D FISH.N))))))
       (BE.PASV CATCH.V))))))
		(!R4 (ME337.SK MAN.N))
		(!R5 (DOG322.SK LIMIT.N))
		(!R6 (CUT332.SK CUT.N))
		(!R7 (BRANCH330.SK BRANCH.N))
		(!R8 (SCAR335.SK SCAR.N))
		(!R9 (DOG322.SK DOG.N))
		(!R10 (DOG322.SK (PERTAIN-TO ME337.SK)))
		(!R11 (ME337.SK AGENT.N))
	)
	(:GOALS
		(?G1
   (ME337.SK
    (WANT.V
     (THAT
      (ME337.SK
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
    (ME337.SK HAVE.V
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_H (TOO.ADV MANY.A)) (?X_I FISH.N))))))
       (BE.PASV CATCH.V))))))
		(?I2 (ME337.SK (AT.P ?L)))
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
		(E336.SK
   (ME337.SK HAVE.V
    (KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_M (TOO.ADV MANY.A)) (?X_N FISH.N))))))
      (BE.PASV CATCH.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E333.SK))
		(!W2 (?I1 PRECOND-OF E333.SK))
		(!W3 (?I2 PRECOND-OF E333.SK))
		(!W4 (?I3 PRECOND-OF E333.SK))
		(!W5 (E336.SK POSTCOND-OF E333.SK))
		(!W6 (E333.SK (BEFORE ?X_P)))
		(!W7 (E333.SK (BEFORE NOW78)))
		(!W8 (E336.SK (AT-ABOUT NOW79)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (6.227813 3)
("I was walking my dog." "I let go of the leash." "I ran after her."
 "I got a cut on my thigh from a branch." "I still have the scar.")
(EPI-SCHEMA ((ME337.SK ((ADV-A (FROM.P BRANCH330.SK)) GET.153.V) CUT332.SK
              (AT.P-ARG ?L))
             ** E333.SK)
	(:ROLES
		(!R1 (CUT332.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME337.SK = CUT332.SK)))
		(!R4 (CUT332.SK CAT.N))
		(!R5 (?X_H (RIGHT-AFTER ?X_A)))
		(!R6 (ME337.SK WIFE.N))
		(!R7 (?X_B CAT.N))
		(!R8 (ME337.SK (PERTAIN-TO ?X_C)))
		(!R9 (?G1 (RIGHT-AFTER ?X_D)))
		(!R10 (CUT332.SK CUT.N))
		(!R11 (BRANCH330.SK BRANCH.N))
		(!R12 (ME337.SK AGENT.N))
		(!R13 (SCAR335.SK SCAR.N))
		(!R14 (DOG322.SK (PERTAIN-TO ME337.SK)))
		(!R15 (DOG322.SK DOG.N))
	)
	(:GOALS
		(?G1 (ME337.SK (WANT.V (THAT (ME337.SK (HAVE.V CUT332.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME337.SK HAVE.V CUT332.SK)))
		(?I2 (ME337.SK (AT.P ?L)))
		(?I3 (CUT332.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E336.SK (ME337.SK HAVE.V CUT332.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E333.SK))
		(!W2 (?I1 PRECOND-OF E333.SK))
		(!W3 (?I2 PRECOND-OF E333.SK))
		(!W4 (?I3 PRECOND-OF E333.SK))
		(!W5 (E336.SK POSTCOND-OF E333.SK))
		(!W6 (E333.SK (BEFORE ?X_I)))
		(!W7 (?X_H (SAME-TIME ?X_I)))
		(!W8 (?G1 (SAME-TIME ?X_L)))
		(!W9 (?X_K (AT-ABOUT ?X_L)))
		(!W10 (E333.SK (BEFORE NOW78)))
		(!W11 (E336.SK (AT-ABOUT NOW79)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 16:
	; "The man looked outside."
	; "It was sunny."
	; "The man decided to go for a job."
	; "It started raining."
	; "The man ran home."
discarding schema RUN.227.V learned from this story
; best schemas are:
; GO.1083.V
; RUN.311.V
; GO.423.V
; GO.1261.V
; GO.51.V
(setf matches (append matches '(( (2.905 0)
("The man looked outside." "It was sunny." "The man decided to go for a job."
 "It started raining." "The man ran home.")
(EPI-SCHEMA ((MAN339.SK
              (HOME.ADV
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_A)) LOOK.V))))
                  RUN.155.V))))
              ?L2)
             ** E350.SK)
	(:ROLES
		(!R1 (MAN339.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A (PLUR CLOTHE.N)))
		(!R6 (?X_B (PERTAIN-TO MAN339.SK)))
		(!R7 (?X_B WIFE.N))
		(!R8 (MAN339.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN339.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN339.SK (AT.P ?L1)))
		(?I2 (NOT (MAN339.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN339.SK (AT.P ?L1))))
		(?P2 (MAN339.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E350.SK))
		(!W2 (?I2 BEFORE E350.SK))
		(!W3 (?P1 AFTER E350.SK))
		(!W4 (?P2 AFTER E350.SK))
		(!W5 (?G1 CAUSE-OF E350.SK))
		(!W6 (E350.SK (BEFORE ?X_E)))
		(!W7 (E350.SK (BEFORE NOW84)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 1)
("The man looked outside." "It was sunny." "The man decided to go for a job."
 "It started raining." "The man ran home.")
(EPI-SCHEMA ((MAN339.SK
              (HOME.ADV
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-A (ACROSS.P ?X_A)) RUN.156.V))))
              ?L2)
             ** E350.SK)
	(:ROLES
		(!R1 (MAN339.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (MAN339.SK MOUSE.N))
		(!R6 (?X_A ((NN LIVING.N) ROOM.N)))
		(!R7 (?X_A ROOM.N))
		(!R8 (?X_A (PERTAIN-TO MAN339.SK)))
		(!R9 (E350.SK (RIGHT-AFTER ?X_C)))
		(!R10 (MAN339.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN339.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN339.SK (AT.P ?L1)))
		(?I2 (NOT (MAN339.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN339.SK (AT.P ?L1))))
		(?P2 (MAN339.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E350.SK))
		(!W2 (?I2 BEFORE E350.SK))
		(!W3 (?P1 AFTER E350.SK))
		(!W4 (?P2 AFTER E350.SK))
		(!W5 (?G1 CAUSE-OF E350.SK))
		(!W6 (E350.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E350.SK (BEFORE NOW84)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 0)
("The man looked outside." "It was sunny." "The man decided to go for a job."
 "It started raining." "The man ran home.")
(EPI-SCHEMA ((MAN339.SK
              (HOME.ADV
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?X_E)) (OUT.ADV RUN.157.V))))
              ?X_E)
             ** E350.SK)
	(:ROLES
		(!R1 (MAN339.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_E LOCATION.N))
		(!R4 (NOT (?L1 = ?X_E)))
		(!R5 (?X_E MAILBOX.N))
		(!R6 (?X_E (PERTAIN-TO MAN339.SK)))
		(!R7 (E350.SK (RIGHT-AFTER ?X_A)))
		(!R8 (?X_B PAPER.N))
		(!R9 (?X_B (PERTAIN-TO MAN339.SK)))
		(!R10 (?X_C ((NN PAPER.N) BOY.N)))
		(!R11 (?X_C (PERTAIN-TO MAN339.SK)))
		(!R12 (MAN339.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN339.SK (WANT.V (KA ((ADV-A (AT.P ?X_E)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN339.SK (AT.P ?L1)))
		(?I2 (NOT (MAN339.SK (AT.P ?X_E))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN339.SK (AT.P ?L1))))
		(?P2 (MAN339.SK (AT.P ?X_E)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E350.SK))
		(!W2 (?I2 BEFORE E350.SK))
		(!W3 (?P1 AFTER E350.SK))
		(!W4 (?P2 AFTER E350.SK))
		(!W5 (?G1 CAUSE-OF E350.SK))
		(!W6 (E350.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E350.SK (BEFORE NOW84)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 3)
("The man looked outside." "It was sunny." "The man decided to go for a job."
 "It started raining." "The man ran home.")
(EPI-SCHEMA ((MAN339.SK
              (HOME.ADV
               ((ADV-A (TO.P (K FISHING.N))) ((ADV-A (FROM.P ?L1)) RUN.158.V)))
              (K FISHING.N))
             ** E350.SK)
	(:ROLES
		(!R1 (MAN339.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K FISHING.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K FISHING.N))))
		(!R5 (E350.SK (RIGHT-AFTER ?X_A)))
		(!R6 (?X_B LIMIT.N))
		(!R7 (?X_B (PERTAIN-TO MAN339.SK)))
		(!R8 (MAN339.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN339.SK (WANT.V (KA ((ADV-A (AT.P (K FISHING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN339.SK (AT.P ?L1)))
		(?I2 (NOT (MAN339.SK (AT.P (K FISHING.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN339.SK (AT.P ?L1))))
		(?P2 (MAN339.SK (AT.P (K FISHING.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E350.SK))
		(!W2 (?I2 BEFORE E350.SK))
		(!W3 (?P1 AFTER E350.SK))
		(!W4 (?P2 AFTER E350.SK))
		(!W5 (?G1 CAUSE-OF E350.SK))
		(!W6 (E350.SK (SAME-TIME ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E350.SK (BEFORE NOW84)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 0)
("The man looked outside." "It was sunny." "The man decided to go for a job."
 "It started raining." "The man ran home.")
(EPI-SCHEMA ((MAN339.SK
              (HOME.ADV
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?X_E)) (OUT.ADV RUN.159.V))))
              ?X_E)
             ** E350.SK)
	(:ROLES
		(!R1 (MAN339.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_E LOCATION.N))
		(!R4 (NOT (?L1 = ?X_E)))
		(!R5 (?X_E MAILBOX.N))
		(!R6 (?X_E (PERTAIN-TO MAN339.SK)))
		(!R7 (E350.SK (RIGHT-AFTER ?X_A)))
		(!R8 (?X_B PAPER.N))
		(!R9 (?X_B (PERTAIN-TO MAN339.SK)))
		(!R10 (?X_C ((NN PAPER.N) BOY.N)))
		(!R11 (?X_C (PERTAIN-TO MAN339.SK)))
		(!R12 (?X_E FLASHLIGHT.N))
		(!R13 (?X_E INSTRUMENTALITY.N))
		(!R14 (MAN339.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN339.SK (WANT.V (KA ((ADV-A (AT.P ?X_E)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN339.SK (AT.P ?L1)))
		(?I2 (NOT (MAN339.SK (AT.P ?X_E))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN339.SK (AT.P ?L1))))
		(?P2 (MAN339.SK (AT.P ?X_E)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E350.SK))
		(!W2 (?I2 BEFORE E350.SK))
		(!W3 (?P1 AFTER E350.SK))
		(!W4 (?P2 AFTER E350.SK))
		(!W5 (?G1 CAUSE-OF E350.SK))
		(!W6 (E350.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E350.SK (BEFORE NOW84)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 17:
	; "The couple went to a show."
	; "It was too loud for the girl."
	; "She asked to leave."
	; "The boy refused."
	; "The girl left alone."
; best schemas are:
; GO.423.V
; GO.658.V
; GO.6.V
; GO.51.V
; GO.742.V
; GO.642.V

; story 18:
	; "One time I ran out of gas."
	; "Someone saw me."
	; "He went to buy gas for me."
	; "He told me to pay it forward."
	; "I appreciated that."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; TAKE.413.V
; COME.605.V
; GO.658.V
; FLY.235.V
; GO.1083.V

; story 19:
	; "Sam was feeling bad."
	; "He wasn't sure what it was."
	; "A friend suggested drinking more water."
	; "Sam gave it a try."
	; "It made him feel a bit better."
; best schemas are:
; GO.168.V
; GET.73.V
; GIVE.V
; BUMP.400.V
; RUN.401.V
; GO.531.V

; story 20:
	; "We ordered some food."
	; "It was kind of gross."
	; "It was not what I expected."
	; "I had to throw it away."
	; "I never got it again."
; best schemas are:
; FEED.660.V
; GIVE.1297.V
; FLY.235.V
; GIVE.194.V
; TAKE.413.V
; COME.605.V

; story 21:
	; "Kelsi was engaged."
	; "She just got a new ring."
	; "She was happy about it."
	; "But it was too small."
	; "She had to get another one."
discarding schema GET.254.V learned from this story
; best schemas are:
; GET.518.V
; GET.826.V
; GET.848.V
; GET.1224.V
; GET.1322.V
(setf matches (append matches '(( (4.5 4)
("Kelsi was engaged." "She just got a new ring." "She was happy about it."
 "But it was too small." "She had to get another one.")
(EPI-SCHEMA ((KELSI.NAME GET.184.V RING427.SK (AT.P-ARG ?L)) ** E428.SK)
	(:ROLES
		(!R1 (KELSI.NAME AGENT.N))
		(!R2 (RING427.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (KELSI.NAME = RING427.SK)))
		(!R5 (RING427.SK DOG.N))
		(!R6 (?X_A (PERTAIN-TO KELSI.NAME)))
		(!R7 (?X_A DOG.N))
		(!R8 (?X_B (WALK.V KELSI.NAME)))
		(!R9 (?X_B EVENING.N))
		(!R10 (RING427.SK RING.N))
		(!R11 (RING427.SK NEW.A))
	)
	(:GOALS
		(?G1 (KELSI.NAME (WANT.V (THAT (KELSI.NAME (HAVE.V RING427.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (KELSI.NAME HAVE.V RING427.SK)))
		(?I2 (KELSI.NAME (AT.P ?L)))
		(?I3 (RING427.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (KELSI.NAME HAVE.V RING427.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E428.SK))
		(!W2 (?I1 PRECOND-OF E428.SK))
		(!W3 (?I2 PRECOND-OF E428.SK))
		(!W4 (?I3 PRECOND-OF E428.SK))
		(!W5 (?P1 POSTCOND-OF E428.SK))
		(!W6 (E428.SK (AT-ABOUT ?X_F)))
		(!W7 (E428.SK (BEFORE NOW106)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.5 4)
("Kelsi was engaged." "She just got a new ring." "She was happy about it."
 "But it was too small." "She had to get another one.")
(EPI-SCHEMA ((KELSI.NAME GET.186.V RING427.SK (AT.P-ARG ?L)) ** E428.SK)
	(:ROLES
		(!R1 (KELSI.NAME AGENT.N))
		(!R2 (RING427.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (KELSI.NAME = RING427.SK)))
		(!R5 (RING427.SK SWEATSHIRT.N))
		(!R6 (RING427.SK RING.N))
		(!R7 (RING427.SK NEW.A))
	)
	(:GOALS
		(?G1 (KELSI.NAME (WANT.V (THAT (KELSI.NAME (HAVE.V RING427.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (KELSI.NAME HAVE.V RING427.SK)))
		(?I2 (KELSI.NAME (AT.P ?L)))
		(?I3 (RING427.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (KELSI.NAME HAVE.V RING427.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E428.SK))
		(!W2 (?I1 PRECOND-OF E428.SK))
		(!W3 (?I2 PRECOND-OF E428.SK))
		(!W4 (?I3 PRECOND-OF E428.SK))
		(!W5 (?P1 POSTCOND-OF E428.SK))
		(!W6 (E428.SK (BEFORE ?X_D)))
		(!W7 (?G1 (BEFORE ?X_F)))
		(!W8 (E428.SK (BEFORE NOW106)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 22:
	; "The janitor needed to clean his mop."
	; "He took it to the sink."
	; "He got it out."
	; "He washed it."
	; "He put it away."
discarding schema TAKE.255.V learned from this story
; best schemas are:
; GET.672.V
; GET.324.V
; GO_GET_NIL.677.PR
; RECEIVING_VERB.?
; RUN.401.V
(setf matches (append matches '(( (3.905 4)
("The janitor needed to clean his mop." "He took it to the sink."
 "He got it out." "He washed it." "He put it away.")
(EPI-SCHEMA ((JANITOR437.SK GET.188.V IT450.SK (AT.P-ARG ?L)) ** E445.SK)
	(:ROLES
		(!R1 (JANITOR437.SK AGENT.N))
		(!R2 (IT450.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (JANITOR437.SK = IT450.SK)))
		(!R5 (?X_A PHONE.N))
		(!R6 (IT450.SK PRED?.N))
		(!R7 (?X_B (AT-OR-BEFORE ?X_J)))
		(!R8 (JANITOR437.SK JANITOR.N))
		(!R9 (PRED?440.SK (PERTAIN-TO JANITOR437.SK)))
		(!R10 (PRED?440.SK PRED?.N))
	)
	(:GOALS
		(?G1 (JANITOR437.SK (WANT.V (THAT (JANITOR437.SK (HAVE.V IT450.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (JANITOR437.SK HAVE.V IT450.SK)))
		(?I2 (JANITOR437.SK (AT.P ?L)))
		(?I3 (IT450.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (JANITOR437.SK HAVE.V IT450.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E445.SK))
		(!W2 (?I1 PRECOND-OF E445.SK))
		(!W3 (?I2 PRECOND-OF E445.SK))
		(!W4 (?I3 PRECOND-OF E445.SK))
		(!W5 (?P1 POSTCOND-OF E445.SK))
		(!W6 (?G1 (BEFORE ?X_F)))
		(!W7 (?X_H (CONSEC E445.SK)))
		(!W8 (E445.SK (DURING ?X_I)))
		(!W9 (?X_H (DURING ?X_I)))
		(!W10 (?X_I (BEFORE ?X_J)))
		(!W11 (E445.SK (BEFORE NOW112)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (0.905 2)
("The janitor needed to clean his mop." "He took it to the sink."
 "He got it out." "He washed it." "He put it away.")
(EPI-SCHEMA ((JANITOR437.SK GO_GET_NIL.190.PR ?L IT450.SK) ** ?E)
	(:ROLES
		(!R1 (IT450.SK INANIMATE_OBJECT.N))
		(!R2 (IT450.SK PRED?.N))
		(!R3 (NOT (JANITOR437.SK = IT450.SK)))
		(!R4 (JANITOR437.SK AGENT.N))
		(!R5 (JANITOR437.SK JANITOR.N))
		(!R6 (PRED?440.SK (PERTAIN-TO JANITOR437.SK)))
		(!R7 (PRED?440.SK PRED?.N))
	)
	(:PRECONDS
		(?I1 (JANITOR437.SK (AT.P ?L1_2)))
		(?I2 (NOT (JANITOR437.SK (AT.P ?L))))
	)
	(:STEPS
		(?E1 (JANITOR437.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L)) GO.673.V)) ?L))
		(E445.SK (JANITOR437.SK GET.672.V IT450.SK (AT.P-ARG ?L2)))
	)
	(:POSTCONDS
		(?P1 (JANITOR437.SK HAVE.V IT450.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE E445.SK))
		(!W2 (E445.SK (BEFORE NOW112)))
	)
)
))))
(setf matches (append matches '(( (0.905 2)
("The janitor needed to clean his mop." "He took it to the sink."
 "He got it out." "He washed it." "He put it away.")
(EPI-SCHEMA ((JANITOR437.SK GO_GET_NIL.191.PR ?L IT450.SK) ** ?E)
	(:ROLES
		(!R1 (IT450.SK INANIMATE_OBJECT.N))
		(!R2 (IT450.SK PRED?.N))
		(!R3 (NOT (JANITOR437.SK = IT450.SK)))
		(!R4 (JANITOR437.SK AGENT.N))
		(!R5 (JANITOR437.SK JANITOR.N))
		(!R6 (PRED?440.SK PRED?.N))
		(!R7 (PRED?440.SK (PERTAIN-TO JANITOR437.SK)))
	)
	(:PRECONDS
		(?I1 (JANITOR437.SK (AT.P ?L1_2)))
		(?I2 (NOT (JANITOR437.SK (AT.P ?L))))
	)
	(:STEPS
		(?E1 (JANITOR437.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L)) GO.673.V)) ?L))
		(E447.SK (JANITOR437.SK GET.672.V IT450.SK (AT.P-ARG ?L2)))
	)
	(:POSTCONDS
		(?P1 (JANITOR437.SK HAVE.V IT450.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE E447.SK))
		(!W2 (E447.SK (BEFORE NOW113)))
	)
)
))))

; story 23:
	; "I had gold earrings."
	; "I wore them everyday."
	; "Then they broke."
	; "I was heartbroken."
	; "Now I had nothing to wear."
; best schemas are:
; GIVE.194.V
; TAKE.413.V
; FEED.660.V
; TAKE.946.V
; GIVE.1297.V
; TAKE.135.V

; story 24:
	; "It was the girl's first day at school."
	; "She was very nervous."
	; "She went into the classroom."
	; "She saw her friend."
	; "She sat next to her friend."
discarding schema SIT.274.V learned from this story
discarding schema GO.276.V learned from this story
; best schemas are:
; GO.168.V
; COME.605.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; GO.531.V
(setf matches (append matches '(( (3.2278125 2)
("It was the girl's first day at school." "She was very nervous."
 "She went into the classroom." "She saw her friend."
 "She sat next to her friend.")
(EPI-SCHEMA ((SHE.PRO
              ((ADV-A (INTO.P CLASSROOM464.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA VISIT.V))) COME.208.V))))
              ?L2)
             ** E466.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (E466.SK (RIGHT-AFTER ?X_A)))
		(!R5 (SHE.PRO FRIEND.N))
		(!R6 (SHE.PRO (PERTAIN-TO SHE.PRO)))
		(!R7 (FRIEND470.SK (PLUR BROTHER.N)))
		(!R8 (CLASSROOM464.SK CLASSROOM.N))
		(!R9 (SHE.PRO FEMALE.A))
		(!R10 (SHE.PRO AGENT.N))
		(!R11 (FRIEND470.SK (PERTAIN-TO SHE.PRO)))
		(!R12 (FRIEND470.SK FRIEND.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SHE.PRO (AT.P ?L1)))
		(?I2 (NOT (SHE.PRO (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SHE.PRO (AT.P ?L1))))
		(?P2 (SHE.PRO (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E466.SK))
		(!W2 (?I2 BEFORE E466.SK))
		(!W3 (?P1 AFTER E466.SK))
		(!W4 (?P2 AFTER E466.SK))
		(!W5 (?G1 CAUSE-OF E466.SK))
		(!W6 (E466.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (?G1 (BEFORE ?X_I)))
		(!W9 (E466.SK (BEFORE NOW122)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.53125 1)
("It was the girl's first day at school." "She was very nervous."
 "She went into the classroom." "She saw her friend."
 "She sat next to her friend.")
(EPI-SCHEMA ((SHE.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.209.V
              (KA ((THERE.ADV SEE.V) FRIEND470.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) FRIEND470.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (SHE.PRO FEMALE.A))
		(!R4 (SHE.PRO AGENT.N))
		(!R5 (FRIEND470.SK (PERTAIN-TO SHE.PRO)))
		(!R6 (FRIEND470.SK FRIEND.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (NOT (SHE.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (SHE.PRO (THERE.ADV SEE.V) FRIEND470.SK)) CAUSE-OF
    (KE (SHE.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E471.SK (SHE.PRO (THERE.ADV (THERE.ADV SEE.V)) FRIEND470.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E471.SK))
		(!W2 (E471.SK (BEFORE ?X_D)))
		(!W3 (E471.SK (BEFORE NOW123)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.5 0)
("It was the girl's first day at school." "She was very nervous."
 "She went into the classroom." "She saw her friend."
 "She sat next to her friend.")
(EPI-SCHEMA ((SHE.PRO
              ((ADV-A (INTO.P CLASSROOM464.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-A SO.ADV OFF.P) GO.212.V))))
              ?L2)
             ** E466.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (?X_A (PLUR MOVIE.N)))
		(!R5 (CLASSROOM464.SK CLASSROOM.N))
		(!R6 (SHE.PRO FEMALE.A))
		(!R7 (SHE.PRO AGENT.N))
		(!R8 (FRIEND470.SK (PERTAIN-TO SHE.PRO)))
		(!R9 (FRIEND470.SK FRIEND.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SHE.PRO (AT.P ?L1)))
		(?I2 (NOT (SHE.PRO (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SHE.PRO (AT.P ?L1))))
		(?P2 (SHE.PRO (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E466.SK))
		(!W2 (?I2 BEFORE E466.SK))
		(!W3 (?P1 AFTER E466.SK))
		(!W4 (?P2 AFTER E466.SK))
		(!W5 (?G1 CAUSE-OF E466.SK))
		(!W6 (?G1 (BEFORE ?X_E)))
		(!W7 (E466.SK (BEFORE ?X_G)))
		(!W8 (E466.SK (BEFORE NOW122)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 25:
	; "Tina was on her way to bed."
	; "She had a late night."
	; "She slept for eight hours."
	; "When she woke up it was ten."
	; "She was two hours late for school."
; best schemas are:
; GET.395.V
; SIT.211.V
; SIT.505.V
; SIT.49.V
; SIT.65.V
; SIT.274.V

; story 26:
	; "Susan had a new phone."
	; "She was walking in the woods one day."
	; "She lost her phone."
	; "She got upset."
	; "Then she found it later."
discarding schema FIND.319.V learned from this story
; best schemas are:
; FIND.129.V
; FIND.1361.V
; FIND.708.V
; GET.826.V
; SEARCH.V
; error processing story
; story 27:
	; "Susie had the flu."
	; "It made her feel groggy."
	; "So she had to call in sick."
	; "Thankfully work let her off."
	; "But she only got one day."
discarding schema GET.333.V learned from this story
; best schemas are:
; GET.821.V
; GET.826.V
; TAKE.135.V
; PLAY.669.V
; PLAY.670.V
; error processing story
; story 28:
	; "The man poured a glass of water."
	; "He looked in the water."
	; "There was something floating in there."
	; "He poured the water out."
	; "He got water in another glass."
; best schemas are:
; GO.1083.V
; FLOAT.561.V
; RUN.311.V
; RUN.401.V
; GO.423.V
; GO.1261.V

; story 29:
	; "Tom bought a new car."
	; "It was a very fast car."
	; "He thought the car was made to be driven fast."
	; "He drove the car fast."
	; "He had a great time."
; best schemas are:
; TAKE.958.V
; GET.518.V
; GET.826.V
; GET.848.V
; GET.870.V
; GET.1224.V
(setf matches (append matches '(( (5.6128125 5)
("Tom bought a new car." "It was a very fast car."
 "He thought the car was made to be driven fast." "He drove the car fast."
 "He had a great time.")
(EPI-SCHEMA ((TOM.NAME BUY.242.V CAR543.SK (AT.P-ARG ?L)) ** E545.SK)
	(:ROLES
		(!R1 (CAR543.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (TOM.NAME = CAR543.SK)))
		(!R4 (CAR543.SK KITTEN.N))
		(!R5 (TOM.NAME AGENT.N))
		(!R6 (CAR548.SK (PERTAIN-TO TOM.NAME)))
		(!R7 (CAR548.SK (PLUR SHOE.N)))
		(!R8 (CAR543.SK NEW.A))
		(!R9 (CAR543.SK CAR.N))
		(!R10 (TIME561.SK TIME.N))
		(!R11 (TIME561.SK GREAT.A))
		(!R12 (CAR548.SK CAR.N))
		(!R13 (CAR548.SK (VERY.ADV FAST.A)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V CAR543.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V CAR543.SK)))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 (CAR543.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E563.SK (TOM.NAME HAVE.V CAR543.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E545.SK))
		(!W2 (?I1 PRECOND-OF E545.SK))
		(!W3 (?I2 PRECOND-OF E545.SK))
		(!W4 (?I3 PRECOND-OF E545.SK))
		(!W5 (E563.SK POSTCOND-OF E545.SK))
		(!W6 (E545.SK (BEFORE ?X_E)))
		(!W7 (E545.SK (BEFORE NOW145)))
		(!W8 (E563.SK (BEFORE NOW149)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.6128125 3)
("Tom bought a new car." "It was a very fast car."
 "He thought the car was made to be driven fast." "He drove the car fast."
 "He had a great time.")
(EPI-SCHEMA ((TOM.NAME BUY.243.V CAR543.SK (AT.P-ARG ?L)) ** E545.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (CAR543.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = CAR543.SK)))
		(!R5 (CAR543.SK DOG.N))
		(!R6 (?X_A (PERTAIN-TO TOM.NAME)))
		(!R7 (?X_A DOG.N))
		(!R8 (?X_B (WALK.V TOM.NAME)))
		(!R9 (?X_B EVENING.N))
		(!R10 (CAR543.SK NEW.A))
		(!R11 (CAR543.SK CAR.N))
		(!R12 (TIME561.SK TIME.N))
		(!R13 (TIME561.SK GREAT.A))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V CAR543.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V CAR543.SK)))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 (CAR543.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E563.SK (TOM.NAME HAVE.V CAR543.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E545.SK))
		(!W2 (?I1 PRECOND-OF E545.SK))
		(!W3 (?I2 PRECOND-OF E545.SK))
		(!W4 (?I3 PRECOND-OF E545.SK))
		(!W5 (E563.SK POSTCOND-OF E545.SK))
		(!W6 (E545.SK (AT-ABOUT ?X_F)))
		(!W7 (E545.SK (BEFORE NOW145)))
		(!W8 (E563.SK (BEFORE NOW149)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.6128125 4)
("Tom bought a new car." "It was a very fast car."
 "He thought the car was made to be driven fast." "He drove the car fast."
 "He had a great time.")
(EPI-SCHEMA ((TOM.NAME ((ADV-A (IN.P CAR543.SK)) BUY.245.V) CAR543.SK
              (AT.P-ARG ?L))
             ** E545.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (CAR543.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = CAR543.SK)))
		(!R5 (CAR548.SK (PERTAIN-TO TOM.NAME)))
		(!R6 (CAR548.SK STREET.N))
		(!R7 (TIME561.SK TIME.N))
		(!R8 (TIME561.SK GREAT.A))
		(!R9 (CAR543.SK NEW.A))
		(!R10 (CAR543.SK CAR.N))
		(!R11 (CAR548.SK CAR.N))
		(!R12 (CAR548.SK ARTIFACT.N))
		(!R13 (CAR548.SK (VERY.ADV FAST.A)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V CAR543.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V CAR543.SK)))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 (CAR543.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E563.SK (TOM.NAME HAVE.V CAR543.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E545.SK))
		(!W2 (?I1 PRECOND-OF E545.SK))
		(!W3 (?I2 PRECOND-OF E545.SK))
		(!W4 (?I3 PRECOND-OF E545.SK))
		(!W5 (E563.SK POSTCOND-OF E545.SK))
		(!W6 (E545.SK (BEFORE ?X_E)))
		(!W7 (E545.SK (BEFORE NOW145)))
		(!W8 (E563.SK (BEFORE NOW149)))
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
(setf matches (append matches '(( (5.6128125 3)
("Tom bought a new car." "It was a very fast car."
 "He thought the car was made to be driven fast." "He drove the car fast."
 "He had a great time.")
(EPI-SCHEMA ((TOM.NAME BUY.246.V CAR543.SK (AT.P-ARG ?L)) ** E545.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (CAR543.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = CAR543.SK)))
		(!R5 (CAR543.SK SWEATSHIRT.N))
		(!R6 (CAR543.SK NEW.A))
		(!R7 (CAR543.SK CAR.N))
		(!R8 (CAR543.SK ARTIFACT.N))
		(!R9 (TIME561.SK TIME.N))
		(!R10 (TIME561.SK GREAT.A))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V CAR543.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V CAR543.SK)))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 (CAR543.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E563.SK (TOM.NAME HAVE.V CAR543.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E545.SK))
		(!W2 (?I1 PRECOND-OF E545.SK))
		(!W3 (?I2 PRECOND-OF E545.SK))
		(!W4 (?I3 PRECOND-OF E545.SK))
		(!W5 (E563.SK POSTCOND-OF E545.SK))
		(!W6 (E545.SK (BEFORE ?X_D)))
		(!W7 (?G1 (BEFORE ?X_F)))
		(!W8 (E545.SK (BEFORE NOW145)))
		(!W9 (E563.SK (BEFORE NOW149)))
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

; story 30:
	; "The cat was purring."
	; "The cat put its head back down."
	; "The cat had a funny look."
	; "The cat started eating."
	; "I had bought it a different food."
; best schemas are:
; FEED.660.V
; FEED.445.V
; FEED.446.V
; EAT.895.V
; EAT.456.V
; GET.457.V
(setf matches (append matches '(( (5.4049997 6)
("The cat was purring." "The cat put its head back down."
 "The cat had a funny look." "The cat started eating."
 "I had bought it a different food.")
(EPI-SCHEMA ((CAT567.SK BUY.278.V LOOK579.SK (AT.P-ARG ?L)) ** E588.SK)
	(:ROLES
		(!R1 (CAT567.SK AGENT.N))
		(!R2 (LOOK579.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (CAT567.SK = LOOK579.SK)))
		(!R5 (LOOK579.SK ((NN FOOD.N) OUT.N)))
		(!R6 (CAT567.SK (PERTAIN-TO CAT567.SK)))
		(!R7 (LOOK579.SK (FOR.P CAT567.SK)))
		(!R8 (LOOK579.SK LOOK.N))
		(!R9 (LOOK579.SK FUNNY.A))
		(!R10 (E574.SK (RIGHT-AFTER U151)))
		(!R11 (FOOD591.SK FOOD.N))
		(!R12 (FOOD591.SK DIFFERENT.A))
		(!R13 (E588.SK (IMPINGES-ON E585.SK)))
		(!R14 (CAT567.SK CAT.N))
		(!R15 (HEAD572.SK (PERTAIN-TO CAT567.SK)))
		(!R16 (HEAD572.SK HEAD.N))
	)
	(:GOALS
		(?G1 (CAT567.SK (WANT.V (THAT (CAT567.SK (HAVE.V LOOK579.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (CAT567.SK HAVE.V LOOK579.SK)))
		(?I2 (CAT567.SK (AT.P ?L)))
		(?I3 (LOOK579.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E574.SK (CAT567.SK HAVE.V LOOK579.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E588.SK))
		(!W2 (?I1 PRECOND-OF E588.SK))
		(!W3 (?I2 PRECOND-OF E588.SK))
		(!W4 (?I3 PRECOND-OF E588.SK))
		(!W5 (E574.SK POSTCOND-OF E588.SK))
		(!W6 (E588.SK (BEFORE ?X_E)))
		(!W7 (E574.SK (SAME-TIME NOW152)))
		(!W8 (E580.SK (BEFORE NOW152)))
		(!W9 (E585.SK (BEFORE NOW154)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 31:
	; "Helen went to a hair stylist."
	; "She wanted a new hair cut."
	; "Stylist has cut her hair too short."
	; "Helen did not like it."
	; "She did not tip him."
discarding schema AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V learned from this story
discarding schema GO.387.V learned from this story
; best schemas are:
; GO.591.V
; GO.843.V
; GET.826.V
; GO.168.V
(setf matches (append matches '(( (5.0 8)
("Helen went to a hair stylist." "She wanted a new hair cut."
 "Stylist has cut her hair too short." "Helen did not like it."
 "She did not tip him.")
(EPI-SCHEMA ((HELEN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STYLIST596.SK)) GO.279.V))
              STYLIST596.SK)
             ** E597.SK)
	(:ROLES
		(!R1 (HELEN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STYLIST596.SK LOCATION.N))
		(!R4 (NOT (?L1 = STYLIST596.SK)))
		(!R5 (HELEN.NAME CAT.N))
		(!R6 (HELEN.NAME NEW.A))
		(!R7 (STYLIST596.SK ((NN PET.N) STORE.N)))
		(!R8 (STYLIST596.SK CAT.N))
		(!R9 (STYLIST596.SK NICE.A))
		(!R10 (CUT602.SK ((NN HAIR.N) CUT.N)))
		(!R11 (CUT602.SK NEW.A))
		(!R12 (STYLIST596.SK ((NN HAIR.N) STYLIST.N)))
		(!R13 (STYLIST596.SK HAIR.N))
		(!R14 (STYLIST596.SK (PERTAIN-TO HELEN.NAME)))
	)
	(:GOALS
		(E603.SK (HELEN.NAME (WANT.V (KA ((ADV-A (AT.P STYLIST596.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HELEN.NAME (AT.P ?L1)))
		(?I2 (NOT (HELEN.NAME (AT.P STYLIST596.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HELEN.NAME (AT.P ?L1))))
		(?P2 (HELEN.NAME (AT.P STYLIST596.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E597.SK))
		(!W2 (?I2 BEFORE E597.SK))
		(!W3 (?P1 AFTER E597.SK))
		(!W4 (?P2 AFTER E597.SK))
		(!W5 (E603.SK CAUSE-OF E597.SK))
		(!W6 (E597.SK (BEFORE ?X_E)))
		(!W7 (E597.SK (BEFORE NOW155)))
		(!W8 (E603.SK (BEFORE NOW156)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 32:
	; "John needed clothes."
	; "So he separated his clothes."
	; "He began to wash them."
	; "After washing them he dried them."
	; "John now has clothes."
; best schemas are:
; GIVE.194.V
; TAKE.413.V
; GET.1260.V
; GET.88.V
; RUN.401.V
; FEED.660.V

; story 33:
	; "I had the stairs near me."
	; "They were very loud."
	; "It bothered me."
	; "Thankfully the sound went down."
	; "I was happy about that."
; best schemas are:
; GIVE.194.V
; TAKE.413.V
; TAKE.255.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; FEED.660.V
; TAKE.946.V

; story 34:
	; "Tom had a day off."
	; "It was warm and nice out."
	; "He invited a bunch of people to the lake."
	; "Everyone turned him down."
	; "Tom went by himself and had fun."
; best schemas are:
; GO.168.V
; GO.504.V
; GO.401.V
; GO.658.V
; TAKE.135.V
; GO.1083.V
(setf matches (append matches '(( (2.5 0)
("Tom had a day off." "It was warm and nice out."
 "He invited a bunch of people to the lake." "Everyone turned him down."
 "Tom went by himself and had fun.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (BY.P HIMSELF.PRO))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?X_B))
                 ((ADV-A (IN.P (K YESTERDAY.N))) GO.330.V))))
              ?X_B)
             ** E668.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?X_B LOCATION.N))
		(!R3 (NOT (?L1 = ?X_B)))
		(!R4 (?X_B ((NN WATER.N) PARK.N)))
		(!R5 (TOM.NAME AGENT.N))
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
		(!W1 (?I1 BEFORE E668.SK))
		(!W2 (?I2 BEFORE E668.SK))
		(!W3 (?P1 AFTER E668.SK))
		(!W4 (?P2 AFTER E668.SK))
		(!W5 (?G1 CAUSE-OF E668.SK))
		(!W6 (E668.SK (BEFORE ?X_D)))
		(!W7 (E668.SK (BEFORE NOW174)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.7032032 2)
("Tom had a day off." "It was warm and nice out."
 "He invited a bunch of people to the lake." "Everyone turned him down."
 "Tom went by himself and had fun.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (BY.P HIMSELF.PRO))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.331.V)))
              ?X_C)
             ** E668.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (TOM.NAME MAN.N))
		(!R6 (?X_C ((NN MEETING.N) SPOT.N)))
		(!R7 (DAY654.SK (PERTAIN-TO TOM.NAME)))
		(!R8 (DAY654.SK DATE.N))
		(!R9 (DAY654.SK DAY.N))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (AT.P ?L1))))
		(?P2 (TOM.NAME (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E668.SK))
		(!W2 (?I2 BEFORE E668.SK))
		(!W3 (?P1 AFTER E668.SK))
		(!W4 (?P2 AFTER E668.SK))
		(!W5 (?G1 CAUSE-OF E668.SK))
		(!W6 (E668.SK (BEFORE ?X_E)))
		(!W7 (E668.SK (BEFORE NOW174)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 1)
("Tom had a day off." "It was warm and nice out."
 "He invited a bunch of people to the lake." "Everyone turned him down."
 "Tom went by himself and had fun.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (BY.P HIMSELF.PRO))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_A)) PLAY.V))))
                  GO.332.V))))
              ?L2)
             ** E668.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A (PLUR FRIEND.N)))
		(!R6 (?X_A HOME.N))
		(!R7 (?X_A (PERTAIN-TO TOM.NAME)))
		(!R8 (TOM.NAME GIRL.N))
		(!R9 (?X_A (PERTAIN-TO ?X_B)))
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
		(!W1 (?I1 BEFORE E668.SK))
		(!W2 (?I2 BEFORE E668.SK))
		(!W3 (?P1 AFTER E668.SK))
		(!W4 (?P2 AFTER E668.SK))
		(!W5 (?G1 CAUSE-OF E668.SK))
		(!W6 (E668.SK (BEFORE ?X_E)))
		(!W7 (E668.SK (BEFORE NOW174)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 1)
("Tom had a day off." "It was warm and nice out."
 "He invited a bunch of people to the lake." "Everyone turned him down."
 "Tom went by himself and had fun.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (BY.P HIMSELF.PRO))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_A)) LOOK.V))))
                  GO.334.V))))
              ?L2)
             ** E668.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A (PLUR CLOTHE.N)))
		(!R6 (TOM.NAME MAN.N))
		(!R7 (?X_B (PERTAIN-TO TOM.NAME)))
		(!R8 (?X_B WIFE.N))
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
		(!W1 (?I1 BEFORE E668.SK))
		(!W2 (?I2 BEFORE E668.SK))
		(!W3 (?P1 AFTER E668.SK))
		(!W4 (?P2 AFTER E668.SK))
		(!W5 (?G1 CAUSE-OF E668.SK))
		(!W6 (E668.SK (BEFORE ?X_E)))
		(!W7 (E668.SK (BEFORE NOW174)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 35:
	; "Tom got home from work."
	; "The cats seemed quite hungry."
	; "He decided to feed them."
	; "His wife told Tom she had just fed them."
	; "Tom took the food back."
discarding schema GET.460.V learned from this story
; best schemas are:
; GET.88.V
; GET.457.V
; GET.660.V
; FEED_TAKE_NIL.1100.PR
; TAKE.946.V
(setf matches (append matches '(( (5.1411133 4)
("Tom got home from work." "The cats seemed quite hungry."
 "He decided to feed them." "His wife told Tom she had just fed them."
 "Tom took the food back.")
(EPI-SCHEMA ((TOM.NAME ((ADV-A (FROM.P (K WORK.N))) GET.335.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E672.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = (K HOME.N))))
		(!R5 ((K HOME.N) CAT.N))
		(!R6 (TOM.NAME WIFE.N))
		(!R7 (CATS674.SK CAT.N))
		(!R8 (TOM.NAME (PERTAIN-TO ?X_C)))
		(!R9 (?G1 (RIGHT-AFTER ?X_D)))
		(!R10 (WIFE679.SK WIFE.N))
		(!R11 (WIFE679.SK (PERTAIN-TO TOM.NAME)))
		(!R12 (E673.SK (RIGHT-AFTER U175)))
		(!R13 (CATS674.SK (PLUR CAT.N)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V (K HOME.N))))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (TOM.NAME HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E672.SK))
		(!W2 (?I1 PRECOND-OF E672.SK))
		(!W3 (?I2 PRECOND-OF E672.SK))
		(!W4 (?I3 PRECOND-OF E672.SK))
		(!W5 (?P1 POSTCOND-OF E672.SK))
		(!W6 (E672.SK (BEFORE ?X_I)))
		(!W7 (E673.SK (SAME-TIME ?X_I)))
		(!W8 (?G1 (SAME-TIME ?X_L)))
		(!W9 (?X_K (AT-ABOUT ?X_L)))
		(!W10 (E672.SK (BEFORE NOW175)))
		(!W11 (E673.SK (SAME-TIME NOW176)))
		(!W12 (OBJECT675.SK (BEFORE NOW176)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.6411133 5)
("Tom got home from work." "The cats seemed quite hungry."
 "He decided to feed them." "His wife told Tom she had just fed them."
 "Tom took the food back.")
(EPI-SCHEMA ((TOM.NAME ((ADV-A (FROM.P (K WORK.N))) GET.336.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E672.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = (K HOME.N))))
		(!R5 ((K HOME.N) ((NN FOOD.N) OUT.N)))
		(!R6 (CATS674.SK (PERTAIN-TO TOM.NAME)))
		(!R7 ((K HOME.N) (FOR.P CATS674.SK)))
		(!R8 (CATS674.SK CAT.N))
		(!R9 (WIFE679.SK WIFE.N))
		(!R10 (WIFE679.SK (PERTAIN-TO TOM.NAME)))
		(!R11 (CATS674.SK (PLUR CAT.N)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V (K HOME.N))))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (TOM.NAME HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E672.SK))
		(!W2 (?I1 PRECOND-OF E672.SK))
		(!W3 (?I2 PRECOND-OF E672.SK))
		(!W4 (?I3 PRECOND-OF E672.SK))
		(!W5 (?P1 POSTCOND-OF E672.SK))
		(!W6 (E672.SK (BEFORE ?X_E)))
		(!W7 (E672.SK (BEFORE NOW175)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.6411133 4)
("Tom got home from work." "The cats seemed quite hungry."
 "He decided to feed them." "His wife told Tom she had just fed them."
 "Tom took the food back.")
(EPI-SCHEMA ((TOM.NAME ((ADV-A (FROM.P (K WORK.N))) GET.337.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E672.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = (K HOME.N))))
		(!R5 (TOM.NAME DAD.N))
		(!R6 (E672.SK (RIGHT-AFTER ?X_A)))
		(!R7 (TOM.NAME (PERTAIN-TO ?X_B)))
		(!R8 (WIFE679.SK CAR.N))
		(!R9 (WIFE679.SK WIFE.N))
		(!R10 (WIFE679.SK (PERTAIN-TO TOM.NAME)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V (K HOME.N))))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (TOM.NAME HAVE.V (K HOME.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E672.SK))
		(!W2 (?I1 PRECOND-OF E672.SK))
		(!W3 (?I2 PRECOND-OF E672.SK))
		(!W4 (?I3 PRECOND-OF E672.SK))
		(!W5 (?P1 POSTCOND-OF E672.SK))
		(!W6 (E672.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E672.SK (BEFORE NOW175)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (0.5 4)
("Tom got home from work." "The cats seemed quite hungry."
 "He decided to feed them." "His wife told Tom she had just fed them."
 "Tom took the food back.")
(EPI-SCHEMA ((TOM.NAME FEED_TAKE_NIL.339.PR CATS674.SK FOOD683.SK) ** ?E)
	(:ROLES
		(!R1 (FOOD683.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (FOOD683.SK FOOD.N))
		(!R4 (WIFE679.SK WIFE.N))
		(!R5 (WIFE679.SK (PERTAIN-TO TOM.NAME)))
	)
	(:PRECONDS
		(?I1 (TOM.NAME HAVE.V FOOD683.SK))
		(?I2 (CATS674.SK HUNGRY.A))
	)
	(:STEPS
		(?E1 (TOM.NAME ((ADV-A (TO.P ?X_A)) FEED.338.V) CATS674.SK FOOD683.SK))
		(E684.SK
   (TOM.NAME ((ADV-A (WITH.P TOM.NAME)) (HOME.ADV TAKE.1087.V)) FOOD683.SK
    (AT.P-ARG ?L)))
	)
	(:POSTCONDS
		(?P1 (TOM.NAME HAVE.V FOOD683.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE E684.SK))
		(!W2 (E684.SK (BEFORE NOW179)))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_B<- ?E1) = TOM.NAME))
		(!S2 ((?X_C<- ?E1) = FOOD683.SK))
		(!S3 ((?X_D<- ?E1) = CATS674.SK))
		(!S4 ((?X_A<- ?E1) = ?X_A))
		(!S5 ((?E1<- ?E1) = ?E1))
	)
)
))))

; story 36:
	; "The dog was in a cage."
	; "He howled all day."
	; "The family got rid of the dog."
	; "The next family let the dog outside."
	; "The dog did not howl at all."
; best schemas are:
; SIT.274.V
; SIT.65.V
; RUN.179.V
; RUN.179.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; GET.826.V

; story 37:
	; "Billy was playing outside."
	; "He tripped over a rock."
	; "Both of his shoes came off."
	; "He picked up both shoes."
	; "He put his shoes back on his feet."
; best schemas are:
; FLY.235.V
; GIVE.194.V
; TAKE.413.V
; EAT.516.V
; GET.518.V
; RUN.28.V

; story 38:
	; "We were sitting at home tonight."
	; "It was quiet."
	; "My wife heard a buzzing sound."
	; "I went and sat near where she heard the sound."
	; "We heard nothing."
; best schemas are:
; GO.168.V
; GO.658.V
; GO.1083.V
; GIVE.194.V
; FOLLOW.709.V
; FLY.235.V

; story 39:
	; "We went to the water park yesterday."
	; "It was a wild day."
	; "When we got there the lies were very long."
	; "They were too long."
	; "So we decided to leave."
discarding schema GO.504.V learned from this story
; best schemas are:
; GO.387.V
; TAKE.135.V
; GO.19.V
; GO.90.V
; GO.1241.V
(setf matches (append matches '(( (3.9580421 2)
("We went to the water park yesterday." "It was a wild day."
 "When we got there the lies were very long." "They were too long."
 "So we decided to leave.")
(EPI-SCHEMA ((WE758.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P PARK741.SK))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_C)) PLAY.V))))
                  GO.392.V))))
              PARK741.SK)
             ** E744.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (PARK741.SK LOCATION.N))
		(!R3 (NOT (?L1 = PARK741.SK)))
		(!R4 (?X_C (PLUR FRIEND.N)))
		(!R5 (?X_C HOME.N))
		(!R6 (WE758.SK GIRL.N))
		(!R7 (?X_A (AT-OR-BEFORE ?X_J)))
		(!R8 (?X_B (AT-OR-BEFORE ?X_J)))
		(!R9 (?X_C WIFE.N))
		(!R10 (?X_C (PERTAIN-TO WE758.SK)))
		(!R11 (PARK741.SK ((NN WATER.N) PARK.N)))
		(!R12 (WE758.SK AGENT.N))
	)
	(:GOALS
		(?G1 (WE758.SK (WANT.V (KA ((ADV-A (AT.P PARK741.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (WE758.SK (AT.P ?L1)))
		(?I2 (NOT (WE758.SK (AT.P PARK741.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (WE758.SK (AT.P ?L1))))
		(?P2 (WE758.SK (AT.P PARK741.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E744.SK))
		(!W2 (?I2 BEFORE E744.SK))
		(!W3 (?P1 AFTER E744.SK))
		(!W4 (?P2 AFTER E744.SK))
		(!W5 (?G1 CAUSE-OF E744.SK))
		(!W6 (E744.SK (BEFORE ?X_E)))
		(!W7 (E744.SK (DURING ?X_I)))
		(!W8 (?X_H (DURING ?X_I)))
		(!W9 (E744.SK (CONSEC ?X_H)))
		(!W10 (?X_I (BEFORE ?X_J)))
		(!W11 (E744.SK (BEFORE NOW195)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.7302296 2)
("We went to the water park yesterday." "It was a wild day."
 "When we got there the lies were very long." "They were too long."
 "So we decided to leave.")
(EPI-SCHEMA ((WE758.SK
              ((ADV-A (ON.P ?X_A))
               ((ADV-A (IN.P (K YESTERDAY.N)))
                ((ADV-A (TO.P PARK741.SK)) ((ADV-A (FROM.P ?L1)) GO.403.V))))
              PARK741.SK)
             ** E744.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (PARK741.SK LOCATION.N))
		(!R3 (NOT (?L1 = PARK741.SK)))
		(!R4 (?X_A PLANE.N))
		(!R5 (PARK741.SK ((NN WATER.N) PARK.N)))
		(!R6 (WE758.SK AGENT.N))
	)
	(:GOALS
		(?G1 (WE758.SK (WANT.V (KA ((ADV-A (AT.P PARK741.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (WE758.SK (AT.P ?L1)))
		(?I2 (NOT (WE758.SK (AT.P PARK741.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (WE758.SK (AT.P ?L1))))
		(?P2 (WE758.SK (AT.P PARK741.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E744.SK))
		(!W2 (?I2 BEFORE E744.SK))
		(!W3 (?P1 AFTER E744.SK))
		(!W4 (?P2 AFTER E744.SK))
		(!W5 (?G1 CAUSE-OF E744.SK))
		(!W6 (E744.SK (BEFORE ?X_D)))
		(!W7 (E744.SK (BEFORE NOW195)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.7302296 3)
("We went to the water park yesterday." "It was a wild day."
 "When we got there the lies were very long." "They were too long."
 "So we decided to leave.")
(EPI-SCHEMA ((WE758.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P PARK741.SK)) ((ADV-A (FROM.P ?L1)) GO.404.V)))
              PARK741.SK)
             ** E744.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (PARK741.SK LOCATION.N))
		(!R3 (NOT (?L1 = PARK741.SK)))
		(!R4 (PARK741.SK STORE.N))
		(!R5 (PARK741.SK ((NN WATER.N) PARK.N)))
		(!R6 (WE758.SK AGENT.N))
	)
	(:GOALS
		(?G1 (WE758.SK (WANT.V (KA ((ADV-A (AT.P PARK741.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (WE758.SK (AT.P ?L1)))
		(?I2 (NOT (WE758.SK (AT.P PARK741.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (WE758.SK (AT.P ?L1))))
		(?P2 (WE758.SK (AT.P PARK741.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E744.SK))
		(!W2 (?I2 BEFORE E744.SK))
		(!W3 (?P1 AFTER E744.SK))
		(!W4 (?P2 AFTER E744.SK))
		(!W5 (?G1 CAUSE-OF E744.SK))
		(!W6 (E744.SK (BEFORE ?X_D)))
		(!W7 (E744.SK (BEFORE NOW195)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.7302296 3)
("We went to the water park yesterday." "It was a wild day."
 "When we got there the lies were very long." "They were too long."
 "So we decided to leave.")
(EPI-SCHEMA ((WE758.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P PARK741.SK)) ((ADV-A (FROM.P ?L1)) GO.405.V)))
              PARK741.SK)
             ** E744.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (PARK741.SK LOCATION.N))
		(!R3 (NOT (?L1 = PARK741.SK)))
		(!R4 (PARK741.SK BEACH.N))
		(!R5 (PARK741.SK ((NN WATER.N) PARK.N)))
		(!R6 (WE758.SK AGENT.N))
	)
	(:GOALS
		(?G1 (WE758.SK (WANT.V (KA ((ADV-A (AT.P PARK741.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (WE758.SK (AT.P ?L1)))
		(?I2 (NOT (WE758.SK (AT.P PARK741.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (WE758.SK (AT.P ?L1))))
		(?P2 (WE758.SK (AT.P PARK741.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E744.SK))
		(!W2 (?I2 BEFORE E744.SK))
		(!W3 (?P1 AFTER E744.SK))
		(!W4 (?P2 AFTER E744.SK))
		(!W5 (?G1 CAUSE-OF E744.SK))
		(!W6 (E744.SK (BEFORE ?X_D)))
		(!W7 (E744.SK (BEFORE NOW195)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 40:
	; "I wanted a new rain coat."
	; "I went to the store to find one."
	; "There was a very small selection."
	; "I found a bright pink one."
	; "It was perfect for me."
; best schemas are:
; GO.591.V
; FLY.235.V
; GO.387.V
; GO.1083.V
; GO.278.V
; GO.650.V

; story 41:
	; "My dog had puppies."
	; "It was cold outside."
	; "She came into the garage."
	; "She had one puppy outside."
	; "It did not survive."
; best schemas are:
; GET.826.V
; GET.218.V
; FIND.1038.V
; TAKE.1039.V
; TAKE.1290.V
; LAY_DOWN.1041.V

; story 42:
	; "The man floated down the river."
	; "His boat tipped over."
	; "He swam to the tipped over boat."
	; "He climbed on top of the boat."
	; "He was rescued."
discarding schema FLOAT.561.V learned from this story
; best schemas are:
; GO.51.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; GO.1261.V
; GO.401.V
; GO.537.V
(setf matches (append matches '(( (5.1633005 5)
("The man floated down the river." "His boat tipped over."
 "He swam to the tipped over boat." "He climbed on top of the boat."
 "He was rescued.")
(EPI-SCHEMA ((MAN801.SK
              ((ADV-A (DOWN.P RIVER803.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P BOAT806.SK)) (OUT.ADV FLOAT.463.V))))
              BOAT806.SK)
             ** E800.SK)
	(:ROLES
		(!R1 (MAN801.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (BOAT806.SK LOCATION.N))
		(!R4 (NOT (?L1 = BOAT806.SK)))
		(!R5 (BOAT806.SK MAILBOX.N))
		(!R6 (?X_B PAPER.N))
		(!R7 (?X_B (PERTAIN-TO MAN801.SK)))
		(!R8 (?X_C ((NN PAPER.N) BOY.N)))
		(!R9 (?X_C (PERTAIN-TO MAN801.SK)))
		(!R10 (BOAT806.SK FLASHLIGHT.N))
		(!R11 (RIVER803.SK RIVER.N))
		(!R12 (E800.SK (RIGHT-AFTER U209)))
		(!R13 (MAN801.SK MAN.N))
		(!R14 (BOAT806.SK (PERTAIN-TO MAN801.SK)))
		(!R15 (BOAT806.SK BOAT.N))
		(!R16 (BOAT806.SK INSTRUMENTALITY.N))
	)
	(:GOALS
		(?G1 (MAN801.SK (WANT.V (KA ((ADV-A (AT.P BOAT806.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN801.SK (AT.P ?L1)))
		(?I2 (NOT (MAN801.SK (AT.P BOAT806.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN801.SK (AT.P ?L1))))
		(?P2 (MAN801.SK (AT.P BOAT806.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E800.SK))
		(!W2 (?I2 BEFORE E800.SK))
		(!W3 (?P1 AFTER E800.SK))
		(!W4 (?P2 AFTER E800.SK))
		(!W5 (?G1 CAUSE-OF E800.SK))
		(!W6 (E800.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E800.SK (SAME-TIME NOW210)))
		(!W9 (E804.SK (BEFORE NOW210)))
	)
	(:CERTAINTIES
		(!C1 (!R16 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R16 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R15 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R16 CERTAIN-TO-DEGREE (/ 2 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.9049997 4)
("The man floated down the river." "His boat tipped over."
 "He swam to the tipped over boat." "He climbed on top of the boat."
 "He was rescued.")
(EPI-SCHEMA ((MAN801.SK
              ((ADV-A (DOWN.P RIVER803.SK))
               ((ADV-A (TO.P (K FISHING.N)))
                ((ADV-A (FROM.P ?L1)) FLOAT.477.V)))
              (K FISHING.N))
             ** E800.SK)
	(:ROLES
		(!R1 (MAN801.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K FISHING.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K FISHING.N))))
		(!R5 (BOAT806.SK LIMIT.N))
		(!R6 (RIVER803.SK RIVER.N))
		(!R7 (E800.SK (RIGHT-AFTER U209)))
		(!R8 (MAN801.SK MAN.N))
		(!R9 (BOAT806.SK (PERTAIN-TO MAN801.SK)))
		(!R10 (BOAT806.SK BOAT.N))
	)
	(:GOALS
		(?G1 (MAN801.SK (WANT.V (KA ((ADV-A (AT.P (K FISHING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN801.SK (AT.P ?L1)))
		(?I2 (NOT (MAN801.SK (AT.P (K FISHING.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN801.SK (AT.P ?L1))))
		(?P2 (MAN801.SK (AT.P (K FISHING.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E800.SK))
		(!W2 (?I2 BEFORE E800.SK))
		(!W3 (?P1 AFTER E800.SK))
		(!W4 (?P2 AFTER E800.SK))
		(!W5 (?G1 CAUSE-OF E800.SK))
		(!W6 (E800.SK (SAME-TIME ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E800.SK (SAME-TIME NOW210)))
		(!W9 (E804.SK (BEFORE NOW210)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 5)
("The man floated down the river." "His boat tipped over."
 "He swam to the tipped over boat." "He climbed on top of the boat."
 "He was rescued.")
(EPI-SCHEMA ((MAN801.SK
              ((ADV-A (DOWN.P RIVER803.SK))
               ((ADV-A (TO.P BOAT810.SK)) ((ADV-A (FROM.P ?L1)) FLOAT.478.V)))
              BOAT810.SK)
             ** E800.SK)
	(:ROLES
		(!R1 (MAN801.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (BOAT810.SK LOCATION.N))
		(!R4 (NOT (?L1 = BOAT810.SK)))
		(!R5 (BOAT810.SK ((NN MEETING.N) SPOT.N)))
		(!R6 (BOAT806.SK DATE.N))
		(!R7 (RIVER803.SK RIVER.N))
		(!R8 (E800.SK (RIGHT-AFTER U209)))
		(!R9 (MAN801.SK MAN.N))
		(!R10 (BOAT806.SK (PERTAIN-TO MAN801.SK)))
		(!R11 (BOAT806.SK BOAT.N))
		(!R12 (BOAT810.SK BOAT.N))
	)
	(:GOALS
		(?G1 (MAN801.SK (WANT.V (KA ((ADV-A (AT.P BOAT810.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN801.SK (AT.P ?L1)))
		(?I2 (NOT (MAN801.SK (AT.P BOAT810.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN801.SK (AT.P ?L1))))
		(?P2 (MAN801.SK (AT.P BOAT810.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E800.SK))
		(!W2 (?I2 BEFORE E800.SK))
		(!W3 (?P1 AFTER E800.SK))
		(!W4 (?P2 AFTER E800.SK))
		(!W5 (?G1 CAUSE-OF E800.SK))
		(!W6 (E800.SK (BEFORE ?X_E)))
		(!W7 (E800.SK (SAME-TIME NOW210)))
		(!W8 (E804.SK (BEFORE NOW210)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 3)
("The man floated down the river." "His boat tipped over."
 "He swam to the tipped over boat." "He climbed on top of the boat."
 "He was rescued.")
(EPI-SCHEMA ((MAN801.SK
              ((ADV-A (DOWN.P RIVER803.SK))
               ((ADV-A (TO.P (K JAIL.N))) ((ADV-A (FROM.P ?L1)) FLOAT.479.V)))
              (K JAIL.N))
             ** E800.SK)
	(:ROLES
		(!R1 (MAN801.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K JAIL.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K JAIL.N))))
		(!R5 (RIVER803.SK RIVER.N))
		(!R6 (MAN801.SK MAN.N))
		(!R7 (BOAT806.SK (PERTAIN-TO MAN801.SK)))
		(!R8 (BOAT806.SK BOAT.N))
		(!R9 (E800.SK (RIGHT-AFTER U209)))
	)
	(:GOALS
		(?G1 (MAN801.SK (WANT.V (KA ((ADV-A (AT.P (K JAIL.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN801.SK (AT.P ?L1)))
		(?I2 (NOT (MAN801.SK (AT.P (K JAIL.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN801.SK (AT.P ?L1))))
		(?P2 (MAN801.SK (AT.P (K JAIL.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E800.SK))
		(!W2 (?I2 BEFORE E800.SK))
		(!W3 (?P1 AFTER E800.SK))
		(!W4 (?P2 AFTER E800.SK))
		(!W5 (?G1 CAUSE-OF E800.SK))
		(!W6 (E800.SK (SAME-TIME ?X_E)))
		(!W7 (?X_D (BEFORE ?X_E)))
		(!W8 (E800.SK (SAME-TIME NOW210)))
		(!W9 (E804.SK (BEFORE NOW210)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 43:
	; "We just bought a new house."
	; "It is so big compared to our other house."
	; "We did need a bigger place."
	; "The kids love the yard."
	; "It is a nice place."
; best schemas are:
; GO.591.V
; GO.387.V
; COME.126.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1029.V
; TAKE.624.V
; TAKE.946.V

; story 44:
	; "The boy was home alone."
	; "He thought he heard a noise."
	; "He called his mom."
	; "His mom told him to lock up the house."
	; "That made the boy more afraid."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; COME.126.V
; SIT.65.V
; TAKE.542.V
; GET.672.V
; GO.51.V

; story 45:
	; "Joseph likes pets."
	; "He has two dogs and three cats."
	; "One day one of the dogs got lost."
	; "Joseph tried to find him very hard."
	; "He finally find him."
; best schemas are:
; GO.591.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1029.V
; GO.480.V
; FLY.235.V
; FIND.773.V
; GO.387.V

; story 46:
	; "Susie got some bad ice cream."
	; "It looked good at first."
	; "Then it melted."
	; "Susie was not pleased."
	; "She didn't want it anymore."
; best schemas are:
; RUN.401.V
; RECEIVING_VERB.?
; GET.143.V
; GET.1669.V
; GET.346.V
; GET.671.V

; story 47:
	; "Bill was driving down the road."
	; "He saw his friend Amy walking."
	; "He stopped his car."
	; "He gave her a ride."
	; "Then he went home."
; best schemas are:
; GO.1084.V
; COME.280.V
; GET.660.V
; GO.168.V
; GO.292.V
; GO.658.V

; story 48:
	; "Reese wanted to be more active."
	; "He mostly sat around the house."
	; "He wanted to be more fit."
	; "He started playing one hour outside a day."
	; "He is much more fit now."
discarding schema SIT.590.V learned from this story
; best schemas are:
; PLAY.669.V
; PLAY.670.V
; SIT.65.V
; GO.671.V
; TAKE.1270.V

; story 49:
	; "The tree lost its leaves."
	; "That winter it became very cold."
	; "The branches froze."
	; "The tree lost its branches."
	; "The next spring the leaves could not grow back."
; best schemas are:
; CLIMB.347.V
; GET.218.V
; SIT.274.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; GET.526.V
; CLIMB_GET_EAT.349.PR

; story 50:
	; "Kevin needed some bananas."
	; "He went too the store."
	; "Got some bananas."
	; "He took them home."
	; "Enjoyed himself one."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V
; GO.90.V
; GO.423.V
; GO.591.V
; GO.806.V
; GO.1220.V
; error processing story
; story 51:
	; "I was walking back from the store."
	; "It was a hot day."
	; "A man gave me a ride the rest of the way."
	; "He was a little rude to me."
	; "I thanked him anyway."
; best schemas are:
; TAKE.135.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; GIVE.194.V
; TAKE.1270.V
; RUN.311.V
; GO.591.V

; story 52:
	; "My friend came to visit."
	; "She wanted to go out."
	; "I asked if she wanted to meet my brothers."
	; "I was in trouble that night."
	; "I didn't find out why until the next day."
discarding schema COME.605.V learned from this story
; best schemas are:
; GO.168.V
; GO.387.V
; GO.658.V
; COME.126.V
; TAKE.135.V
(setf matches (append matches '(( (5.4049997 5)
("My friend came to visit." "She wanted to go out."
 "I asked if she wanted to meet my brothers." "I was in trouble that night."
 "I didn't find out why until the next day.")
(EPI-SCHEMA ((FRIEND976.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FRIEND976.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.635.V)))
              ?L2)
             ** E975.SK)
	(:ROLES
		(!R1 (FRIEND976.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND976.SK (PLUR FRIEND.N)))
		(!R6 (FRIEND976.SK HOME.N))
		(!R7 (FRIEND976.SK (PERTAIN-TO FRIEND976.SK)))
		(!R8 (FRIEND976.SK GIRL.N))
		(!R9 (?X_B (AT-OR-BEFORE NOW262)))
		(!R10 (FRIEND976.SK WIFE.N))
		(!R11 (E975.SK (RIGHT-AFTER U259)))
		(!R12 (FRIEND976.SK FRIEND.N))
		(!R13 (FRIEND976.SK PERSON.N))
		(!R14 (FRIEND976.SK (PERTAIN-TO ME989.SK)))
		(!R15 (ME989.SK AGENT.N))
		(!R16 (BROTHER984.SK (PERTAIN-TO ME989.SK)))
		(!R17 (BROTHER984.SK (PLUR BROTHER.N)))
		(!R18 (OBJECT982.SK (AT-OR-BEFORE NOW262)))
	)
	(:GOALS
		(E980.SK (FRIEND976.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND976.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND976.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND976.SK (AT.P ?L1))))
		(?P2 (FRIEND976.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E975.SK))
		(!W2 (?I2 BEFORE E975.SK))
		(!W3 (?P1 AFTER E975.SK))
		(!W4 (?P2 AFTER E975.SK))
		(!W5 (E980.SK CAUSE-OF E975.SK))
		(!W6 (E975.SK (BEFORE ?X_E)))
		(!W7 (E975.SK (DURING ?X_I)))
		(!W8 (?X_H (DURING ?X_I)))
		(!W9 (E975.SK (CONSEC ?X_H)))
		(!W10 (?X_I (BEFORE NOW262)))
		(!W11 (E975.SK (SAME-TIME NOW260)))
		(!W12 (E978.SK (BEFORE NOW260)))
		(!W13 (E980.SK (BEFORE NOW261)))
		(!W14 (E981.SK (BEFORE NOW262)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C7 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C8 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C9 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C10 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C11 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C12 (!R13 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C13 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C14 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C15 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 4)
("My friend came to visit." "She wanted to go out."
 "I asked if she wanted to meet my brothers." "I was in trouble that night."
 "I didn't find out why until the next day.")
(EPI-SCHEMA ((FRIEND976.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FRIEND976.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.636.V)))
              ?L2)
             ** E975.SK)
	(:ROLES
		(!R1 (FRIEND976.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND976.SK (PLUR FRIEND.N)))
		(!R6 (FRIEND976.SK HOME.N))
		(!R7 (FRIEND976.SK (PERTAIN-TO FRIEND976.SK)))
		(!R8 (FRIEND976.SK GIRL.N))
		(!R9 (E975.SK (RIGHT-AFTER U259)))
		(!R10 (FRIEND976.SK FRIEND.N))
		(!R11 (FRIEND976.SK PERSON.N))
		(!R12 (FRIEND976.SK (PERTAIN-TO ME989.SK)))
		(!R13 (ME989.SK AGENT.N))
		(!R14 (BROTHER984.SK (PERTAIN-TO ME989.SK)))
		(!R15 (BROTHER984.SK (PLUR BROTHER.N)))
	)
	(:GOALS
		(E980.SK (FRIEND976.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND976.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND976.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND976.SK (AT.P ?L1))))
		(?P2 (FRIEND976.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E975.SK))
		(!W2 (?I2 BEFORE E975.SK))
		(!W3 (?P1 AFTER E975.SK))
		(!W4 (?P2 AFTER E975.SK))
		(!W5 (E980.SK CAUSE-OF E975.SK))
		(!W6 (E975.SK (BEFORE ?X_E)))
		(!W7 (E975.SK (SAME-TIME NOW260)))
		(!W8 (E978.SK (BEFORE NOW260)))
		(!W9 (E980.SK (BEFORE NOW261)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R11 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R11 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C7 (!R10 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R11 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C9 (!R10 CERTAIN-TO-DEGREE (/ 1 5)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.4049997 3)
("My friend came to visit." "She wanted to go out."
 "I asked if she wanted to meet my brothers." "I was in trouble that night."
 "I didn't find out why until the next day.")
(EPI-SCHEMA ((FRIEND976.SK
              ((ADV-A (FOR.P (KA VISIT.V)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-A (BY.P ?X_A)) COME.637.V))))
              ?L2)
             ** E975.SK)
	(:ROLES
		(!R1 (FRIEND976.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND976.SK BEST.A))
		(!R6 (?X_A HOUSE.N))
		(!R7 (FRIEND976.SK SON.N))
		(!R8 (E975.SK (RIGHT-AFTER U259)))
		(!R9 (FRIEND976.SK FRIEND.N))
		(!R10 (FRIEND976.SK PERSON.N))
		(!R11 (FRIEND976.SK (PERTAIN-TO ME989.SK)))
		(!R12 (ME989.SK AGENT.N))
		(!R13 (BROTHER984.SK (PERTAIN-TO ME989.SK)))
		(!R14 (BROTHER984.SK (PLUR BROTHER.N)))
	)
	(:GOALS
		(E980.SK (FRIEND976.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND976.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND976.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND976.SK (AT.P ?L1))))
		(?P2 (FRIEND976.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E975.SK))
		(!W2 (?I2 BEFORE E975.SK))
		(!W3 (?P1 AFTER E975.SK))
		(!W4 (?P2 AFTER E975.SK))
		(!W5 (E980.SK CAUSE-OF E975.SK))
		(!W6 (E975.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E980.SK (BEFORE NOW261)))
		(!W9 (E975.SK (SAME-TIME NOW260)))
		(!W10 (E978.SK (BEFORE NOW260)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 53:
	; "Dan decided to go to his pond."
	; "He picked up a rock."
	; "It skipped three times."
	; "One rock was too big."
	; "It just made a big splash."
; best schemas are:
; PLAY.799.V
; MAKE.V
; RUN.254.V
; GO.742.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; MAKE.100.V

; story 54:
	; "The man turned on the light."
	; "The bulb made a noise."
	; "The light went out."
	; "The man replaced the bulb."
	; "Light filled the man's room."
; best schemas are:
; RUN.311.V
; SHOP.797.V
; FIND.798.V
; FOLLOW.709.V
; TAKE.656.V
; SIT.49.V

; story 55:
	; "Ernesto is a cat."
	; "He likes to hunt bugs."
	; "Yesterday there was a fly on top of the desk."
	; "He jumped and caught the fly."
	; "Then Ernesto ate the fly."
; best schemas are:
; RUN.28.V
; RUN.229.V
; RUN.254.V
; FEED.660.V
; GO.591.V
; WALK.989.V
(setf matches (append matches '(( (3.905 8)
("Ernesto is a cat." "He likes to hunt bugs."
 "Yesterday there was a fly on top of the desk."
 "He jumped and caught the fly." "Then Ernesto ate the fly.")
(EPI-SCHEMA ((CAT1031.SK ((ADV-A (TO.P ?X_A)) FEED.730.V) ERNESTO.NAME
              FLY1041.SK)
             ** ?X_G)
	(:ROLES
		(!R1 (CAT1031.SK AGENT.N))
		(!R2 (ERNESTO.NAME AGENT.N))
		(!R3 (FLY1041.SK FOOD.N))
		(!R4 (NOT (CAT1031.SK = ERNESTO.NAME)))
		(!R5 (NOT (ERNESTO.NAME = FLY1041.SK)))
		(!R6 (NOT (CAT1031.SK = FLY1041.SK)))
		(!R7 (FLY1041.SK MOUSE.N))
		(!R8 (CAT1031.SK OLD.A))
		(!R9 (ERNESTO.NAME MOUSE.N))
		(!R10 (?X_A (PERTAIN-TO CAT1031.SK)))
		(!R11 (FLY1041.SK FLY.N))
		(!R12 (FLY1041.SK ANIMAL.N))
		(!R13 (CAT1031.SK CAT.N))
	)
	(:GOALS
		(?G1 (CAT1031.SK (WANT.V (THAT (NOT (ERNESTO.NAME HUNGRY.A))))))
		(?G2 (CAT1031.SK (WANT.V (THAT (ERNESTO.NAME EAT.V FLY1041.SK)))))
	)
	(:PRECONDS
		(?I1 (CAT1031.SK HAVE.V FLY1041.SK))
		(?I2 (ERNESTO.NAME HUNGRY.A))
	)
	(:STEPS
		(E1044.SK (ERNESTO.NAME EAT.V FLY1041.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (CAT1031.SK (HAVE.V FLY1041.SK))))
		(?P2 (NOT (ERNESTO.NAME HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1044.SK AFTER ?X_G))
		(!W2 (?I1 (AT-ABOUT ?X_F)))
		(!W3 (?X_G (AFTER ?X_H)))
		(!W4 (?X_H (AT-ABOUT ?X_I)))
		(!W5 (E1044.SK (BEFORE NOW279)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
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
(setf matches (append matches '(( (3.405 9)
("Ernesto is a cat." "He likes to hunt bugs."
 "Yesterday there was a fly on top of the desk."
 "He jumped and caught the fly." "Then Ernesto ate the fly.")
(EPI-SCHEMA ((FLY1039.SK ((ADV-A (TO.P ?X_A)) FEED.731.V) ERNESTO.NAME
              FLY1041.SK)
             ** ?X_G)
	(:ROLES
		(!R1 (FLY1039.SK AGENT.N))
		(!R2 (ERNESTO.NAME AGENT.N))
		(!R3 (FLY1041.SK FOOD.N))
		(!R4 (NOT (FLY1039.SK = ERNESTO.NAME)))
		(!R5 (NOT (ERNESTO.NAME = FLY1041.SK)))
		(!R6 (NOT (FLY1039.SK = FLY1041.SK)))
		(!R7 (FLY1041.SK MOUSE.N))
		(!R8 (FLY1039.SK CAT.N))
		(!R9 (FLY1039.SK OLD.A))
		(!R10 (ERNESTO.NAME MOUSE.N))
		(!R11 (?X_A (PERTAIN-TO FLY1039.SK)))
		(!R12 (FLY1041.SK FLY.N))
		(!R13 (FLY1041.SK ANIMAL.N))
		(!R14 (FLY1039.SK FLY.N))
		(!R15 (FLY1039.SK ANIMAL.N))
	)
	(:GOALS
		(?G1 (FLY1039.SK (WANT.V (THAT (NOT (ERNESTO.NAME HUNGRY.A))))))
		(?G2 (FLY1039.SK (WANT.V (THAT (ERNESTO.NAME EAT.V FLY1041.SK)))))
	)
	(:PRECONDS
		(?I1 (FLY1039.SK HAVE.V FLY1041.SK))
		(?I2 (ERNESTO.NAME HUNGRY.A))
	)
	(:STEPS
		(E1044.SK (ERNESTO.NAME EAT.V FLY1041.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (FLY1039.SK (HAVE.V FLY1041.SK))))
		(?P2 (NOT (ERNESTO.NAME HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1044.SK AFTER ?X_G))
		(!W2 (?I1 (AT-ABOUT ?X_F)))
		(!W3 (?X_G (AFTER ?X_H)))
		(!W4 (?X_H (AT-ABOUT ?X_I)))
		(!W5 (E1044.SK (BEFORE NOW279)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
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
(setf matches (append matches '(( (3.405 9)
("Ernesto is a cat." "He likes to hunt bugs."
 "Yesterday there was a fly on top of the desk."
 "He jumped and caught the fly." "Then Ernesto ate the fly.")
(EPI-SCHEMA ((FLY1035.SK ((ADV-A (TO.P ?X_A)) FEED.732.V) ERNESTO.NAME
              FLY1041.SK)
             ** ?X_G)
	(:ROLES
		(!R1 (FLY1035.SK AGENT.N))
		(!R2 (ERNESTO.NAME AGENT.N))
		(!R3 (FLY1041.SK FOOD.N))
		(!R4 (NOT (FLY1035.SK = ERNESTO.NAME)))
		(!R5 (NOT (ERNESTO.NAME = FLY1041.SK)))
		(!R6 (NOT (FLY1035.SK = FLY1041.SK)))
		(!R7 (FLY1041.SK MOUSE.N))
		(!R8 (FLY1035.SK CAT.N))
		(!R9 (FLY1035.SK OLD.A))
		(!R10 (ERNESTO.NAME MOUSE.N))
		(!R11 (?X_A (PERTAIN-TO FLY1035.SK)))
		(!R12 (FLY1041.SK FLY.N))
		(!R13 (FLY1041.SK ANIMAL.N))
		(!R14 (FLY1035.SK FLY.N))
		(!R15 (FLY1035.SK ANIMAL.N))
		(!R16 (FLY1035.SK (ON_TOP_OF.P DESK1036.SK)))
		(!R17 (DESK1036.SK DESK.N))
	)
	(:GOALS
		(?G1 (FLY1035.SK (WANT.V (THAT (NOT (ERNESTO.NAME HUNGRY.A))))))
		(?G2 (FLY1035.SK (WANT.V (THAT (ERNESTO.NAME EAT.V FLY1041.SK)))))
	)
	(:PRECONDS
		(?I1 (FLY1035.SK HAVE.V FLY1041.SK))
		(?I2 (ERNESTO.NAME HUNGRY.A))
	)
	(:STEPS
		(E1044.SK (ERNESTO.NAME EAT.V FLY1041.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (FLY1035.SK (HAVE.V FLY1041.SK))))
		(?P2 (NOT (ERNESTO.NAME HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1044.SK AFTER ?X_G))
		(!W2 (?I1 (AT-ABOUT ?X_F)))
		(!W3 (?X_G (AFTER ?X_H)))
		(!W4 (?X_H (AT-ABOUT ?X_I)))
		(!W5 (E1044.SK (BEFORE NOW279)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
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

; story 56:
	; "The man hung up the phone."
	; "The woman wondered why."
	; "The woman called him back."
	; "The man didn't answer."
	; "The woman thought she knew why."
discarding schema AVOID_ACTION_TO_AVOID_DISPLEASURE.662.V learned from this story
; best schemas are:
; TAKE.656.V
; FIND.1361.V
; FIND.708.V
; FOLLOW.709.V
; GO.168.V

; story 57:
	; "It was snowing outside Tom's house one day."
	; "Tom liked playing in the snow."
	; "Tom went outside."
	; "Tom played in the snow."
	; "Tom made a snowman."
discarding schema PLAY.669.V learned from this story
discarding schema PLAY.670.V learned from this story
discarding schema GO.671.V learned from this story
; best schemas are:
; SIT.65.V
; GO.340.V
; GO.168.V
(setf matches (append matches '(( (3.0 3)
("It was snowing outside Tom's house one day." "Tom liked playing in the snow."
 "Tom went outside." "Tom played in the snow." "Tom made a snowman.")
(EPI-SCHEMA ((TOM.NAME
              (OUTSIDE.ADV
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A
                   (FOR.P
                    (KA ((ADV-A (WITH.P (SET-OF ?X_A TOM.NAME))) PLAY.V))))
                  GO.770.V))))
              ?L2)
             ** E1073.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A LAP.N))
		(!R6 (?X_A (PERTAIN-TO ?X_A)))
		(!R7 (?X_B (IMPINGES-ON E1073.SK)))
		(!R8 (?X_C (PERTAIN-TO TOM.NAME)))
		(!R9 (SNOWMAN1078.SK DOLL.N))
		(!R10 (SNOWMAN1078.SK (PERTAIN-TO TOM.NAME)))
		(!R11 (HOUSE1067.SK SPADE.N))
		(!R12 (?X_G (IMPINGES-ON ?X_J)))
		(!R13 (HOUSE1067.SK HOUSE.N))
		(!R14 (HOUSE1067.SK (PERTAIN-TO TOM.NAME)))
		(!R15 (DAY1068.SK DAY.N))
		(!R16 (HOUSE1067.SK (= DAY1068.SK)))
		(!R17 (SNOWMAN1078.SK SNOWMAN.N))
		(!R18 (SNOWMAN1078.SK ARTIFACT.N))
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
		(!W1 (?I1 BEFORE E1073.SK))
		(!W2 (?I2 BEFORE E1073.SK))
		(!W3 (?P1 AFTER E1073.SK))
		(!W4 (?P2 AFTER E1073.SK))
		(!W5 (?G1 CAUSE-OF E1073.SK))
		(!W6 (E1073.SK (AT-ABOUT ?X_K)))
		(!W7 (?X_J (AT-ABOUT ?X_K)))
		(!W8 (E1073.SK (BEFORE NOW287)))
	)
	(:CERTAINTIES
		(!C1 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R17 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 58:
	; "Tom was walking."
	; "He suddenly saw a wallet."
	; "He picked it up and tried to find the owner."
	; "He could not find him."
	; "He kept it."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; SEARCH.V
; FIND.V
; COME.917.V
; COME.917.V
; COME.917.V
(setf matches (append matches '(( (1.53125 1)
("Tom was walking." "He suddenly saw a wallet."
 "He picked it up and tried to find the owner." "He could not find him."
 "He kept it.")
(EPI-SCHEMA ((TOM.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.772.V
              (KA ((THERE.ADV SEE.V) WALLET1083.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) WALLET1083.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (TOM.NAME AGENT.N))
		(!R4 (WALLET1083.SK WALLET.N))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (NOT (TOM.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (TOM.NAME (THERE.ADV SEE.V) WALLET1083.SK)) CAUSE-OF
    (KE (TOM.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1084.SK (TOM.NAME (THERE.ADV (THERE.ADV SEE.V)) WALLET1083.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1084.SK))
		(!W2 (E1084.SK (BEFORE ?X_D)))
		(!W3 (E1084.SK (BEFORE NOW291)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 59:
	; "Susie was very hungry."
	; "She didn't get food yet."
	; "Hours went by."
	; "She still hadn't eaten."
	; "She needed something in her system."
; best schemas are:
; CLIMB_GET_EAT.349.PR
; EAT.V
; FEED.V
; EAT.342.V
; FEED.343.V
; FEED.351.V

; story 60:
	; "John went to the casino last night."
	; "I was a little jealous."
	; "I could not go."
	; "He had a fun night."
	; "He won a little money too."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; GET.104.V
; FIND.129.V
; GET.672.V
; TAKE.255.V
; GIVE.241.V

; story 61:
	; "I wanted to make a cake."
	; "But I didn't want it to be too easy."
	; "So I made a tiramisu."
	; "It was delicious."
	; "But it took forever."
; best schemas are:
; TAKE.656.V
; GO.742.V
; GO.740.V
; TAKE.413.V
; GO.387.V
; TAKE.946.V

; story 62:
	; "A little Mary was jumping on a couch."
	; "Her mom told her to stop."
	; "Mary did not listen."
	; "She jumped and fell down."
	; "Mary cried."
discarding schema FALL.700.V learned from this story
; best schemas are:
; TAKE.542.V
; FALL.1625.V
; FALL.25.V
; FALL.859.V
; FALL.1128.V
(setf matches (append matches '(( (3.5 0)
("A little Mary was jumping on a couch." "Her mom told her to stop."
 "Mary did not listen." "She jumped and fell down." "Mary cried.")
(EPI-SCHEMA ((MARY.NAME
              (DOWN.ADV
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-A (INTO.P ?X_A)) FALL.815.V))))
              ?L2)
             ** E1144.SK)
	(:ROLES
		(!R1 (MARY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A SNOW.N))
		(!R6 (MOM1137.SK MOM.N))
		(!R7 (MOM1137.SK (PERTAIN-TO MARY.NAME)))
		(!R8 (E1144.SK (AT-OR-BEFORE NOW313)))
	)
	(:GOALS
		(?G1 (MARY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MARY.NAME (AT.P ?L1)))
		(?I2 (NOT (MARY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MARY.NAME (AT.P ?L1))))
		(?P2 (MARY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1144.SK))
		(!W2 (?I2 BEFORE E1144.SK))
		(!W3 (?P1 AFTER E1144.SK))
		(!W4 (?P2 AFTER E1144.SK))
		(!W5 (?G1 CAUSE-OF E1144.SK))
		(!W6 (?X_F (CONSEC E1144.SK)))
		(!W7 (E1144.SK (DURING ?X_G)))
		(!W8 (?X_F (DURING ?X_G)))
		(!W9 (?X_G (BEFORE NOW313)))
		(!W10 (E1142.SK (BEFORE NOW313)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("A little Mary was jumping on a couch." "Her mom told her to stop."
 "Mary did not listen." "She jumped and fell down." "Mary cried.")
(EPI-SCHEMA ((MARY.NAME
              (DOWN.ADV
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-A (ON.P ?X_A)) FALL.816.V))))
              ?L2)
             ** E1144.SK)
	(:ROLES
		(!R1 (MARY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A GROUND.N))
		(!R6 (MOM1137.SK (PERTAIN-TO MARY.NAME)))
		(!R7 (MOM1137.SK MOM.N))
		(!R8 (E1144.SK (AT-OR-BEFORE NOW313)))
	)
	(:GOALS
		(?G1 (MARY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MARY.NAME (AT.P ?L1)))
		(?I2 (NOT (MARY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MARY.NAME (AT.P ?L1))))
		(?P2 (MARY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1144.SK))
		(!W2 (?I2 BEFORE E1144.SK))
		(!W3 (?P1 AFTER E1144.SK))
		(!W4 (?P2 AFTER E1144.SK))
		(!W5 (?G1 CAUSE-OF E1144.SK))
		(!W6 (E1144.SK (BEFORE ?X_D)))
		(!W7 (E1142.SK (BEFORE NOW313)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0 2)
("A little Mary was jumping on a couch." "Her mom told her to stop."
 "Mary did not listen." "She jumped and fell down." "Mary cried.")
(EPI-SCHEMA ((MARY.NAME
              (DOWN.ADV
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-S (ON.P MOM1137.SK)) FALL.817.V))))
              ?L2)
             ** E1144.SK)
	(:ROLES
		(!R1 (MARY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (MOM1137.SK FIRST.A))
		(!R6 (MOM1137.SK LESSON.N))
		(!R7 (E1144.SK (RIGHT-AFTER ?X_B)))
		(!R8 (E1144.SK (AT-OR-BEFORE NOW313)))
		(!R9 (MOM1137.SK MOM.N))
		(!R10 (MOM1137.SK (PERTAIN-TO MARY.NAME)))
	)
	(:GOALS
		(?G1 (MARY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MARY.NAME (AT.P ?L1)))
		(?I2 (NOT (MARY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MARY.NAME (AT.P ?L1))))
		(?P2 (MARY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1144.SK))
		(!W2 (?I2 BEFORE E1144.SK))
		(!W3 (?P1 AFTER E1144.SK))
		(!W4 (?P2 AFTER E1144.SK))
		(!W5 (?G1 CAUSE-OF E1144.SK))
		(!W6 (?G1 (BEFORE ?X_E)))
		(!W7 (E1144.SK (SAME-TIME ?X_H)))
		(!W8 (?X_G (BEFORE ?X_H)))
		(!W9 (E1142.SK (BEFORE NOW313)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0 0)
("A little Mary was jumping on a couch." "Her mom told her to stop."
 "Mary did not listen." "She jumped and fell down." "Mary cried.")
(EPI-SCHEMA ((MARY.NAME
              (DOWN.ADV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.818.V)))
              ?L2)
             ** E1144.SK)
	(:ROLES
		(!R1 (MARY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (MOM1137.SK (PERTAIN-TO MARY.NAME)))
		(!R6 (MOM1137.SK MOM.N))
		(!R7 (E1144.SK (AT-OR-BEFORE NOW313)))
	)
	(:GOALS
		(?G1 (MARY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MARY.NAME (AT.P ?L1)))
		(?I2 (NOT (MARY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MARY.NAME (AT.P ?L1))))
		(?P2 (MARY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1144.SK))
		(!W2 (?I2 BEFORE E1144.SK))
		(!W3 (?P1 AFTER E1144.SK))
		(!W4 (?P2 AFTER E1144.SK))
		(!W5 (?G1 CAUSE-OF E1144.SK))
		(!W6 (?X_C (BEFORE NOW313)))
		(!W7 (E1142.SK (BEFORE NOW313)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 63:
	; "Jennifer was a little girl."
	; "A man pulled up to her house."
	; "He offered her candy."
	; "Jennifer's brother was with her."
	; "He told her to stay away."
; best schemas are:
; TAKE.656.V
; GO.168.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; TAKE.135.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; TAKE.624.V

; story 64:
	; "I went to work yesterday."
	; "I began to cough."
	; "I went into the bathroom to clean up."
	; "I saw that I was very sick."
	; "I went home early from work."
discarding schema GO.740.V learned from this story
; best schemas are:
; TAKE.656.V
; TAKE.885.V
; GO.742.V
; GO.806.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
(setf matches (append matches '(( (2.7278125 2)
("I went to work yesterday." "I began to cough."
 "I went into the bathroom to clean up." "I saw that I was very sick."
 "I went home early from work.")
(EPI-SCHEMA ((ME1176.SK
              ((ADV-A HOME.ADV EARLY.A (FROM.P (K WORK.N)))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.920.V)))
              ?X_C)
             ** E1175.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (?L1 = ?X_C)))
		(!R4 (ME1176.SK NEW.A))
		(!R5 (?X_C ((NN PET.N) STORE.N)))
		(!R6 (?X_A CAT.N))
		(!R7 (?X_A NICE.A))
		(!R8 (?X_A (PERTAIN-TO ME1176.SK)))
		(!R9 (ME1176.SK CAT.N))
		(!R10 (?X_A FLY.N))
		(!R11 (?X_A ANIMAL.N))
		(!R12 (BATHROOM1172.SK DESK.N))
		(!R13 (?X_A (ON_TOP_OF.P BATHROOM1172.SK)))
		(!R14 (ME1176.SK AGENT.N))
		(!R15 (BATHROOM1172.SK BATHROOM.N))
		(!R16 (BATHROOM1172.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (ME1176.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1176.SK (AT.P ?L1)))
		(?I2 (NOT (ME1176.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1176.SK (AT.P ?L1))))
		(?P2 (ME1176.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1175.SK))
		(!W2 (?I2 BEFORE E1175.SK))
		(!W3 (?P1 AFTER E1175.SK))
		(!W4 (?P2 AFTER E1175.SK))
		(!W5 (?G1 CAUSE-OF E1175.SK))
		(!W6 (E1175.SK (BEFORE ?X_E)))
		(!W7 (E1175.SK (BEFORE NOW324)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R16 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R15 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.1834376 2)
("I went to work yesterday." "I began to cough."
 "I went into the bathroom to clean up." "I saw that I was very sick."
 "I went home early from work.")
(EPI-SCHEMA ((ME1176.SK
              ((ADV-A HOME.ADV EARLY.A (FROM.P (K WORK.N)))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.921.V)))
              ?X_C)
             ** E1175.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (?L1 = ?X_C)))
		(!R4 (ME1176.SK CAT.N))
		(!R5 (ME1176.SK NEW.A))
		(!R6 (?X_C ((NN PET.N) STORE.N)))
		(!R7 (?X_A NICE.A))
		(!R8 (?X_A (PERTAIN-TO ME1176.SK)))
		(!R9 (ME1176.SK FLY.N))
		(!R10 (ME1176.SK ANIMAL.N))
		(!R11 (?X_A CAT.N))
		(!R12 (BATHROOM1172.SK CAKE.N))
		(!R13 (ME1176.SK AGENT.N))
		(!R14 (BATHROOM1172.SK BATHROOM.N))
		(!R15 (BATHROOM1172.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (ME1176.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1176.SK (AT.P ?L1)))
		(?I2 (NOT (ME1176.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1176.SK (AT.P ?L1))))
		(?P2 (ME1176.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1175.SK))
		(!W2 (?I2 BEFORE E1175.SK))
		(!W3 (?P1 AFTER E1175.SK))
		(!W4 (?P2 AFTER E1175.SK))
		(!W5 (?G1 CAUSE-OF E1175.SK))
		(!W6 (E1175.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_H)))
		(!W8 (E1175.SK (BEFORE NOW324)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 65:
	; "Kris lost her job."
	; "She was sad at first."
	; "She looked for a new job."
	; "She got an interview."
	; "Kris got a new job!"
discarding schema GET.741.V learned from this story
; best schemas are:
; GET.518.V
; GET.826.V
; GET.848.V
; GET.1224.V
; GET.254.V
(setf matches (append matches '(( (4.0 5)
("Kris lost her job." "She was sad at first." "She looked for a new job."
 "She got an interview." "Kris got a new job!")
(EPI-SCHEMA ((SHE.PRO GET.925.V INTERVIEW1186.SK (AT.P-ARG ?L)) ** E1187.SK)
	(:ROLES
		(!R1 (INTERVIEW1186.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (SHE.PRO = INTERVIEW1186.SK)))
		(!R4 (INTERVIEW1186.SK DOG.N))
		(!R5 (INTERVIEW1186.SK NEW.A))
		(!R6 (?X_A (PERTAIN-TO SHE.PRO)))
		(!R7 (?X_A DOG.N))
		(!R8 (?X_B (WALK.V SHE.PRO)))
		(!R9 (?X_B EVENING.N))
		(!R10 (SHE.PRO FEMALE.A))
		(!R11 (SHE.PRO AGENT.N))
		(!R12 (INTERVIEW1186.SK INTERVIEW.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (SHE.PRO (HAVE.V INTERVIEW1186.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SHE.PRO HAVE.V INTERVIEW1186.SK)))
		(?I2 (SHE.PRO (AT.P ?L)))
		(?I3 (INTERVIEW1186.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (SHE.PRO HAVE.V INTERVIEW1186.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1187.SK))
		(!W2 (?I1 PRECOND-OF E1187.SK))
		(!W3 (?I2 PRECOND-OF E1187.SK))
		(!W4 (?I3 PRECOND-OF E1187.SK))
		(!W5 (?P1 POSTCOND-OF E1187.SK))
		(!W6 (E1187.SK (AT-ABOUT ?X_F)))
		(!W7 (E1187.SK (BEFORE NOW328)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 5)
("Kris lost her job." "She was sad at first." "She looked for a new job."
 "She got an interview." "Kris got a new job!")
(EPI-SCHEMA ((SHE.PRO GET.927.V INTERVIEW1186.SK (AT.P-ARG ?L)) ** E1187.SK)
	(:ROLES
		(!R1 (INTERVIEW1186.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (SHE.PRO = INTERVIEW1186.SK)))
		(!R4 (INTERVIEW1186.SK SWEATSHIRT.N))
		(!R5 (INTERVIEW1186.SK NEW.A))
		(!R6 (SHE.PRO FEMALE.A))
		(!R7 (SHE.PRO AGENT.N))
		(!R8 (INTERVIEW1186.SK INTERVIEW.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (SHE.PRO (HAVE.V INTERVIEW1186.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SHE.PRO HAVE.V INTERVIEW1186.SK)))
		(?I2 (SHE.PRO (AT.P ?L)))
		(?I3 (INTERVIEW1186.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (SHE.PRO HAVE.V INTERVIEW1186.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1187.SK))
		(!W2 (?I1 PRECOND-OF E1187.SK))
		(!W3 (?I2 PRECOND-OF E1187.SK))
		(!W4 (?I3 PRECOND-OF E1187.SK))
		(!W5 (?P1 POSTCOND-OF E1187.SK))
		(!W6 (E1187.SK (BEFORE ?X_D)))
		(!W7 (?G1 (BEFORE ?X_F)))
		(!W8 (E1187.SK (BEFORE NOW328)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 5)
("Kris lost her job." "She was sad at first." "She looked for a new job."
 "She got an interview." "Kris got a new job!")
(EPI-SCHEMA ((SHE.PRO GET.928.V INTERVIEW1186.SK (AT.P-ARG ?L)) ** E1187.SK)
	(:ROLES
		(!R1 (INTERVIEW1186.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (SHE.PRO = INTERVIEW1186.SK)))
		(!R4 (INTERVIEW1186.SK RING.N))
		(!R5 (INTERVIEW1186.SK NEW.A))
		(!R6 (SHE.PRO FEMALE.A))
		(!R7 (SHE.PRO AGENT.N))
		(!R8 (INTERVIEW1186.SK INTERVIEW.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (SHE.PRO (HAVE.V INTERVIEW1186.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SHE.PRO HAVE.V INTERVIEW1186.SK)))
		(?I2 (SHE.PRO (AT.P ?L)))
		(?I3 (INTERVIEW1186.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (SHE.PRO HAVE.V INTERVIEW1186.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1187.SK))
		(!W2 (?I1 PRECOND-OF E1187.SK))
		(!W3 (?I2 PRECOND-OF E1187.SK))
		(!W4 (?I3 PRECOND-OF E1187.SK))
		(!W5 (?P1 POSTCOND-OF E1187.SK))
		(!W6 (E1187.SK (BEFORE ?X_D)))
		(!W7 (E1187.SK (BEFORE NOW328)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 66:
	; "Two kids visited their friend's house."
	; "His friend wasn't home."
	; "A big dog was in the yard."
	; "It ran over to the kids."
	; "It bit them right on the hands."
; best schemas are:
; COME.126.V
; COME.605.V
; GO.194.V
; TAKE.624.V
; TAKE.656.V
; GO.168.V

; story 67:
	; "John wanted to get a new pet."
	; "He went to the pound to look for one."
	; "He saw a sad puppy."
	; "John felt deeply for it."
	; "He took him home as his new pet."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; GO.742.V
; GO.806.V
; GO.740.V
(setf matches (append matches '(( (3.5 6)
("John wanted to get a new pet." "He went to the pound to look for one."
 "He saw a sad puppy." "John felt deeply for it."
 "He took him home as his new pet.")
(EPI-SCHEMA ((JOHN.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.992.V
              (KA
               ((ADV-A
                 (L #:G1091718
                  (AND (#:G1091718 LIKE.P)
                       (#:G1091718
                        (= (KA ((ADV-A (AFTER.P PRED?1220.SK)) RUN.V)))))))
                FEEL.V)))
             ** ?E)
	(:ROLES
		(!R1
   ((KA
     ((ADV-A
       (L #:G1091718
        (AND (?X_A LIKE.P)
             (?X_B (= (KA ((ADV-A (AFTER.P PRED?1220.SK)) RUN.V)))))))
      FEEL.V))
    ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (JOHN.NAME MAN.N))
		(!R4 (PRED?1220.SK NEW-SALIENT-ENTITY*.N))
		(!R5 (OBJECT1230.SK BREATH.N))
		(!R6 (JOHN.NAME AGENT.N))
		(!R7 (PRED?1220.SK LITTLE.A))
		(!R8 (PET1216.SK PET.N))
		(!R9 (PET1216.SK NEW.A))
		(!R10 (PUPPY1225.SK PUPPY.N))
		(!R11 (PUPPY1225.SK SAD.A))
		(!R12 (PRED?1220.SK PRED?.N))
		(!R13 (OBJECT1230.SK (PERTAIN-TO JOHN.NAME)))
	)
	(:GOALS
		(E1217.SK (JOHN.NAME (WANT.V (THAT (NOT (JOHN.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE
     (JOHN.NAME
      ((ADV-A
        (L #:G1091718
         (AND (?X_D LIKE.P)
              (?X_E (= (KA ((ADV-A (AFTER.P PRED?1220.SK)) RUN.V)))))))
       FEEL.V)))
    CAUSE-OF (KE (JOHN.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1228.SK
   (JOHN.NAME
    ((ADV-A (FOR.P PUPPY1225.SK))
     (DEEPLY.ADV
      ((ADV-A
        (L #:G1091718
         (AND (?X_G LIKE.P)
              (?X_H (= (KA ((ADV-A (AFTER.P PRED?1220.SK)) RUN.V)))))))
       ((ADV-A
         (L #:G1091718
          (AND (?X_I LIKE.P)
               (?X_J (= (KA ((ADV-A (AFTER.P PRED?1220.SK)) RUN.V)))))))
        FEEL.V))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1217.SK CAUSE-OF E1228.SK))
		(!W2 (E1228.SK (BEFORE ?X_M)))
		(!W3 (E1217.SK (BEFORE NOW335)))
		(!W4 (E1228.SK (BEFORE NOW338)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0 11)
("John wanted to get a new pet." "He went to the pound to look for one."
 "He saw a sad puppy." "John felt deeply for it."
 "He took him home as his new pet.")
(EPI-SCHEMA ((JOHN.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.1005.V
              (KA
               ((ADV-A
                 (L #:G1091718
                  (AND (#:G1091718 LIKE.P)
                       (#:G1091718
                        (= (KA ((ADV-A (AFTER.P JOHN.NAME)) RUN.V)))))))
                FEEL.V)))
             ** ?E)
	(:ROLES
		(!R1
   ((KA
     ((ADV-A
       (L #:G1091718
        (AND (?X_A LIKE.P)
             (?X_B (= (KA ((ADV-A (AFTER.P JOHN.NAME)) RUN.V)))))))
      FEEL.V))
    ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (JOHN.NAME MAN.N))
		(!R4 (JOHN.NAME NEW-SALIENT-ENTITY*.N))
		(!R5 (OBJECT1230.SK BREATH.N))
		(!R6 (JOHN.NAME AGENT.N))
		(!R7 (JOHN.NAME PRED?.N))
		(!R8 (JOHN.NAME MONEY.N))
		(!R9 (OBJECT1230.SK BROTHER.N))
		(!R10 (?X_F (PERTAIN-TO JOHN.NAME)))
		(!R11 (?X_F CANDY.N))
		(!R12 (?X_K HOUSE.N))
		(!R13 (?X_K (PERTAIN-TO JOHN.NAME)))
		(!R14 (JOHN.NAME GIRL.N))
		(!R15 (JOHN.NAME ADULT.N))
		(!R16 (JOHN.NAME LITTLE.A))
		(!R17 (PET1216.SK PET.N))
		(!R18 (PET1216.SK NEW.A))
		(!R19 (PUPPY1225.SK PUPPY.N))
		(!R20 (PUPPY1225.SK SAD.A))
		(!R21 (OBJECT1230.SK (PERTAIN-TO JOHN.NAME)))
	)
	(:GOALS
		(E1217.SK (JOHN.NAME (WANT.V (THAT (NOT (JOHN.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE
     (JOHN.NAME
      ((ADV-A
        (L #:G1091718
         (AND (?X_D LIKE.P)
              (?X_E (= (KA ((ADV-A (AFTER.P JOHN.NAME)) RUN.V)))))))
       FEEL.V)))
    CAUSE-OF (KE (JOHN.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1228.SK
   (JOHN.NAME
    ((ADV-A (FOR.P PUPPY1225.SK))
     (DEEPLY.ADV
      ((ADV-A
        (L #:G1091718
         (AND (?X_G LIKE.P)
              (?X_H (= (KA ((ADV-A (AFTER.P JOHN.NAME)) RUN.V)))))))
       ((ADV-A
         (L #:G1091718
          (AND (?X_I LIKE.P)
               (?X_J (= (KA ((ADV-A (AFTER.P JOHN.NAME)) RUN.V)))))))
        FEEL.V))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1217.SK CAUSE-OF E1228.SK))
		(!W2 (E1228.SK (BEFORE ?X_M)))
		(!W3 (E1217.SK (BEFORE NOW335)))
		(!W4 (E1228.SK (BEFORE NOW338)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R3 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R14 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.5 7)
("John wanted to get a new pet." "He went to the pound to look for one."
 "He saw a sad puppy." "John felt deeply for it."
 "He took him home as his new pet.")
(EPI-SCHEMA ((JOHN.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.1012.V
              (KA
               ((ADV-A
                 (L #:G1091718
                  (AND (#:G1091718 LIKE.P)
                       (#:G1091718
                        (= (KA ((ADV-A (AFTER.P PRED?1220.SK)) RUN.V)))))))
                FEEL.V)))
             ** ?E)
	(:ROLES
		(!R1
   ((KA
     ((ADV-A
       (L #:G1091718
        (AND (?X_A LIKE.P)
             (?X_B (= (KA ((ADV-A (AFTER.P PRED?1220.SK)) RUN.V)))))))
      FEEL.V))
    ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (JOHN.NAME MAN.N))
		(!R4 (PRED?1220.SK NEW-SALIENT-ENTITY*.N))
		(!R5 (OBJECT1230.SK BREATH.N))
		(!R6 (JOHN.NAME AGENT.N))
		(!R7 (PRED?1220.SK LITTLE.A))
		(!R8 (PRED?1220.SK MONEY.N))
		(!R9 (PET1216.SK PET.N))
		(!R10 (PET1216.SK NEW.A))
		(!R11 (PUPPY1225.SK PUPPY.N))
		(!R12 (PUPPY1225.SK SAD.A))
		(!R13 (PRED?1220.SK PRED?.N))
		(!R14 (OBJECT1230.SK (PERTAIN-TO JOHN.NAME)))
	)
	(:GOALS
		(E1217.SK (JOHN.NAME (WANT.V (THAT (NOT (JOHN.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE
     (JOHN.NAME
      ((ADV-A
        (L #:G1091718
         (AND (?X_D LIKE.P)
              (?X_E (= (KA ((ADV-A (AFTER.P PRED?1220.SK)) RUN.V)))))))
       FEEL.V)))
    CAUSE-OF (KE (JOHN.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1228.SK
   (JOHN.NAME
    ((ADV-A (FOR.P PUPPY1225.SK))
     (DEEPLY.ADV
      ((ADV-A
        (L #:G1091718
         (AND (?X_G LIKE.P)
              (?X_H (= (KA ((ADV-A (AFTER.P PRED?1220.SK)) RUN.V)))))))
       ((ADV-A
         (L #:G1091718
          (AND (?X_I LIKE.P)
               (?X_J (= (KA ((ADV-A (AFTER.P PRED?1220.SK)) RUN.V)))))))
        FEEL.V))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1217.SK CAUSE-OF E1228.SK))
		(!W2 (E1228.SK (BEFORE ?X_M)))
		(!W3 (E1217.SK (BEFORE NOW335)))
		(!W4 (E1228.SK (BEFORE NOW338)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 68:
	; "It didn't matter what he said."
	; "She wasn't going to listen."
	; "She covered her ears with her hands."
	; "She made a loud noise."
	; "He gave up trying to talk."
discarding schema PLAY.799.V learned from this story
; best schemas are:
; TAKE.656.V
; GO.742.V
; GO.806.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; GO.740.V

; story 69:
	; "John had his day off."
	; "John wanted to go to the beach."
	; "He got on his car and drove to the beach."
	; "John swam in the water."
	; "John had a good day."
discarding schema GET.821.V learned from this story
; best schemas are:
; TAKE.928.V
; GET.826.V
; GET.870.V
; GET.333.V
; GET.338.V
(setf matches (append matches '(( (6.5 5)
("John had his day off." "John wanted to go to the beach."
 "He got on his car and drove to the beach." "John swam in the water."
 "John had a good day.")
(EPI-SCHEMA ((JOHN.NAME ((ADV-A (ON.P CAR1262.SK)) GET.1134.V) DAY1272.SK
              (AT.P-ARG ?L))
             ** E1263.SK)
	(:ROLES
		(!R1 (JOHN.NAME AGENT.N))
		(!R2 (DAY1272.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (JOHN.NAME = DAY1272.SK)))
		(!R5 (DAY1272.SK DOG.N))
		(!R6 (DAY1272.SK NEW.A))
		(!R7 (DAY1254.SK DOG.N))
		(!R8 (?X_B (WALK.V JOHN.NAME)))
		(!R9 (?X_B EVENING.N))
		(!R10 (BEACH1256.SK BEACH.N))
		(!R11 (DAY1272.SK DAY.N))
		(!R12 (DAY1272.SK GOOD.A))
		(!R13 (DAY1254.SK DAY.N))
		(!R14 (DAY1254.SK (PERTAIN-TO JOHN.NAME)))
		(!R15 (CAR1262.SK (PERTAIN-TO JOHN.NAME)))
		(!R16 (CAR1262.SK CAR.N))
	)
	(:GOALS
		(E1257.SK (JOHN.NAME (WANT.V (THAT (JOHN.NAME (HAVE.V DAY1272.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (JOHN.NAME HAVE.V DAY1272.SK)))
		(?I2 (JOHN.NAME (AT.P ?L)))
		(?I3 (DAY1272.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E1273.SK (JOHN.NAME HAVE.V DAY1272.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1263.SK))
		(!W2 (?I1 PRECOND-OF E1263.SK))
		(!W3 (?I2 PRECOND-OF E1263.SK))
		(!W4 (?I3 PRECOND-OF E1263.SK))
		(!W5 (E1273.SK POSTCOND-OF E1263.SK))
		(!W6 (E1263.SK (AT-ABOUT ?X_F)))
		(!W7 (E1257.SK (BEFORE NOW346)))
		(!W8 (E1263.SK (CONSEC E1264.SK)))
		(!W9 (E1264.SK (BEFORE NOW347)))
		(!W10 (E1263.SK (BEFORE NOW347)))
		(!W11 (E1273.SK (BEFORE NOW349)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (7.0 3)
("John had his day off." "John wanted to go to the beach."
 "He got on his car and drove to the beach." "John swam in the water."
 "John had a good day.")
(EPI-SCHEMA ((JOHN.NAME
              ((ADV-A (ON.P CAR1262.SK))
               ((ADV-A (IN.P CAR1262.SK)) GET.1135.V))
              DAY1272.SK (AT.P-ARG ?L))
             ** E1263.SK)
	(:ROLES
		(!R1 (JOHN.NAME AGENT.N))
		(!R2 (DAY1272.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (JOHN.NAME = DAY1272.SK)))
		(!R5 (DAY1254.SK STREET.N))
		(!R6 (BEACH1256.SK BEACH.N))
		(!R7 (DAY1272.SK DAY.N))
		(!R8 (DAY1272.SK GOOD.A))
		(!R9 (CAR1262.SK CAR.N))
		(!R10 (CAR1262.SK (PERTAIN-TO JOHN.NAME)))
		(!R11 (DAY1254.SK DAY.N))
		(!R12 (DAY1254.SK (PERTAIN-TO JOHN.NAME)))
	)
	(:GOALS
		(E1257.SK (JOHN.NAME (WANT.V (THAT (JOHN.NAME (HAVE.V DAY1272.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (JOHN.NAME HAVE.V DAY1272.SK)))
		(?I2 (JOHN.NAME (AT.P ?L)))
		(?I3 (DAY1272.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E1273.SK (JOHN.NAME HAVE.V DAY1272.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1263.SK))
		(!W2 (?I1 PRECOND-OF E1263.SK))
		(!W3 (?I2 PRECOND-OF E1263.SK))
		(!W4 (?I3 PRECOND-OF E1263.SK))
		(!W5 (E1273.SK POSTCOND-OF E1263.SK))
		(!W6 (E1263.SK (BEFORE ?X_E)))
		(!W7 (E1257.SK (BEFORE NOW346)))
		(!W8 (E1263.SK (CONSEC E1264.SK)))
		(!W9 (E1264.SK (BEFORE NOW347)))
		(!W10 (E1263.SK (BEFORE NOW347)))
		(!W11 (E1273.SK (BEFORE NOW349)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 70:
	; "Blake wanted to catch a chick."
	; "There were chicks near a hen."
	; "The chicks could get through the fence."
	; "The hen could not."
	; "He never caught one."
; best schemas are:
; FLY.235.V
; RUN.28.V
; RUN.229.V
; RUN.254.V
; GO_GET_NIL.677.PR
; GO.742.V

; story 71:
	; "Lucy wanted to skate."
	; "She hadn't done it before."
	; "She decided to take lessons."
	; "On her first lesson she fell."
	; "It would be away until she got good."
discarding schema FALL.859.V learned from this story
; best schemas are:
; MOVE.342.V
; MOVE.501.V
; MOVE.109.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (4.5 0)
("Lucy wanted to skate." "She hadn't done it before."
 "She decided to take lessons." "On her first lesson she fell."
 "It would be away until she got good.")
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-S (ON.P LESSON1296.SK))
               ((ADV-A (TO.P ?X_B)) ((ADV-A (FROM.P ?L1)) FALL.1155.V)))
              ?X_B)
             ** E1295.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_B LOCATION.N))
		(!R4 (NOT (?L1 = ?X_B)))
		(!R5 (?X_B CITY.N))
		(!R6 (?X_B NEW.A))
		(!R7 (LESSON1296.SK (PERTAIN-TO LUCY.NAME)))
		(!R8 (LESSON1296.SK FIRST.A))
		(!R9 (LESSON1296.SK LESSON.N))
		(!R10 (E1295.SK (RIGHT-AFTER U357)))
	)
	(:GOALS
		(E1290.SK (LUCY.NAME (WANT.V (KA ((ADV-A (AT.P ?X_B)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LUCY.NAME (AT.P ?L1)))
		(?I2 (NOT (LUCY.NAME (AT.P ?X_B))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (LUCY.NAME (AT.P ?L1))))
		(?P2 (LUCY.NAME (AT.P ?X_B)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1295.SK))
		(!W2 (?I2 BEFORE E1295.SK))
		(!W3 (?P1 AFTER E1295.SK))
		(!W4 (?P2 AFTER E1295.SK))
		(!W5 (E1290.SK CAUSE-OF E1295.SK))
		(!W6 (E1295.SK (BEFORE ?X_D)))
		(!W7 (E1290.SK (BEFORE NOW355)))
		(!W8 (E1295.SK (SAME-TIME NOW358)))
		(!W9 (E1298.SK (BEFORE NOW358)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.5 0)
("Lucy wanted to skate." "She hadn't done it before."
 "She decided to take lessons." "On her first lesson she fell."
 "It would be away until she got good.")
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-S (ON.P LESSON1296.SK))
               ((ADV-A (TO.P ?X_B)) ((ADV-A (FROM.P ?L1)) FALL.1156.V)))
              ?X_B)
             ** E1295.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_B LOCATION.N))
		(!R4 (NOT (?L1 = ?X_B)))
		(!R5 (?X_B TOWN.N))
		(!R6 (?X_B NEW.A))
		(!R7 (LESSON1296.SK (PERTAIN-TO LUCY.NAME)))
		(!R8 (LESSON1296.SK FIRST.A))
		(!R9 (LESSON1296.SK LESSON.N))
		(!R10 (E1295.SK (RIGHT-AFTER U357)))
	)
	(:GOALS
		(E1290.SK (LUCY.NAME (WANT.V (KA ((ADV-A (AT.P ?X_B)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LUCY.NAME (AT.P ?L1)))
		(?I2 (NOT (LUCY.NAME (AT.P ?X_B))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (LUCY.NAME (AT.P ?L1))))
		(?P2 (LUCY.NAME (AT.P ?X_B)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1295.SK))
		(!W2 (?I2 BEFORE E1295.SK))
		(!W3 (?P1 AFTER E1295.SK))
		(!W4 (?P2 AFTER E1295.SK))
		(!W5 (E1290.SK CAUSE-OF E1295.SK))
		(!W6 (E1295.SK (BEFORE ?X_D)))
		(!W7 (E1290.SK (BEFORE NOW355)))
		(!W8 (E1295.SK (SAME-TIME NOW358)))
		(!W9 (E1298.SK (BEFORE NOW358)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0 1)
("Lucy wanted to skate." "She hadn't done it before."
 "She decided to take lessons." "On her first lesson she fell."
 "It would be away until she got good.")
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-S (ON.P LESSON1296.SK))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) FALL.1157.V)))
              ?X_C)
             ** E1295.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (?X_C CITY.N))
		(!R6 (?X_C NEW.A))
		(!R7 (LESSON1296.SK HOMETOWN.N))
		(!R8 (E1295.SK (RIGHT-AFTER U357)))
		(!R9 (LESSON1296.SK (PERTAIN-TO LUCY.NAME)))
		(!R10 (LESSON1296.SK FIRST.A))
		(!R11 (LESSON1296.SK LESSON.N))
	)
	(:GOALS
		(E1290.SK (LUCY.NAME (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LUCY.NAME (AT.P ?L1)))
		(?I2 (NOT (LUCY.NAME (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (LUCY.NAME (AT.P ?L1))))
		(?P2 (LUCY.NAME (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1295.SK))
		(!W2 (?I2 BEFORE E1295.SK))
		(!W3 (?P1 AFTER E1295.SK))
		(!W4 (?P2 AFTER E1295.SK))
		(!W5 (E1290.SK CAUSE-OF E1295.SK))
		(!W6 (E1295.SK (BEFORE ?X_E)))
		(!W7 (E1290.SK (BEFORE NOW355)))
		(!W8 (E1295.SK (SAME-TIME NOW358)))
		(!W9 (E1298.SK (BEFORE NOW358)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 72:
	; "The cat hid in the bush."
	; "The man saw it."
	; "The man called to the cat."
	; "The cat refused to budge."
	; "The man brought the cat inside."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; GO.1152.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1136.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.662.V
(setf matches (append matches '(( (1.43625 1)
("The cat hid in the bush." "The man saw it." "The man called to the cat."
 "The cat refused to budge." "The man brought the cat inside.")
(EPI-SCHEMA ((MAN1304.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1174.V
              (KA ((THERE.ADV SEE.V) IT.PRO)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) IT.PRO)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (MAN1304.SK AGENT.N))
		(!R4 (MAN1304.SK MAN.N))
		(!R5 (E1303.SK (RIGHT-AFTER U360)))
	)
	(:GOALS
		(?G1 (MAN1304.SK (WANT.V (THAT (NOT (MAN1304.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN1304.SK (THERE.ADV SEE.V) IT.PRO)) CAUSE-OF
    (KE (MAN1304.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1303.SK (MAN1304.SK (THERE.ADV (THERE.ADV SEE.V)) IT.PRO))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1303.SK))
		(!W2 (E1303.SK (BEFORE ?X_D)))
		(!W3 (E1303.SK (SAME-TIME NOW361)))
		(!W4 (E1306.SK (BEFORE NOW361)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.43625 1)
("The cat hid in the bush." "The man saw it." "The man called to the cat."
 "The cat refused to budge." "The man brought the cat inside.")
(EPI-SCHEMA ((MAN1304.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1175.V
              (KA ((THERE.ADV SEE.V) IT.PRO)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) IT.PRO)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (MAN1304.SK AGENT.N))
		(!R4 (MAN1304.SK MAN.N))
		(!R5 (E1303.SK (RIGHT-AFTER U360)))
	)
	(:GOALS
		(?G1 (MAN1304.SK (WANT.V (THAT (NOT (MAN1304.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN1304.SK (THERE.ADV SEE.V) IT.PRO)) CAUSE-OF
    (KE (MAN1304.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1306.SK (MAN1304.SK (THERE.ADV (THERE.ADV SEE.V)) IT.PRO))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1306.SK))
		(!W2 (E1306.SK (BEFORE ?X_D)))
		(!W3 (E1306.SK (BEFORE NOW361)))
		(!W4 (E1303.SK (SAME-TIME NOW361)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 73:
	; "He took the cat to the vet."
	; "The vet called it sick."
	; "The man got some medicine."
	; "The cat took the medicine."
	; "The cat got better."
discarding schema TAKE.885.V learned from this story
; best schemas are:
; TAKE.656.V
; GO.1152.V
; TAKE.1.V
; TAKE.10.V
; TAKE.135.V
(setf matches (append matches '(( (5.09125 6)
("He took the cat to the vet." "The vet called it sick."
 "The man got some medicine." "The cat took the medicine."
 "The cat got better.")
(EPI-SCHEMA ((MAN1329.SK ((ADV-A (TO.P VET1323.SK)) TAKE.1182.V) CAT1322.SK
              (AT.P-ARG ?X_C))
             ** E1324.SK)
	(:ROLES
		(!R1 (MAN1329.SK AGENT.N))
		(!R2 (CAT1322.SK INANIMATE_OBJECT.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (MAN1329.SK = CAT1322.SK)))
		(!R5 (MAN1329.SK BROTHER.N))
		(!R6 (?X_A (= MAN1329.SK)))
		(!R7 (?X_C FARM.N))
		(!R8 (?X_A DAY.N))
		(!R9 (?X_A NEXT.A))
		(!R10 (MAN1329.SK FRIEND.N))
		(!R11 (MAN1329.SK (PERTAIN-TO CAT1322.SK)))
		(!R12 (CAT1322.SK AGENT.N))
		(!R13 (?X_B (PERTAIN-TO CAT1322.SK)))
		(!R14 (?X_B (PLUR BROTHER.N)))
		(!R15 (VET1323.SK VET.N))
		(!R16 (CAT1322.SK CAT.N))
		(!R17 (MAN1329.SK MAN.N))
		(!R18 (MAN1329.SK PERSON.N))
	)
	(:GOALS
		(?G1 (MAN1329.SK (WANT.V (THAT (MAN1329.SK (HAVE.V CAT1322.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN1329.SK HAVE.V CAT1322.SK)))
		(?I2 (MAN1329.SK (AT.P ?X_C)))
		(?I3 (CAT1322.SK (AT.P ?X_C)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1329.SK HAVE.V CAT1322.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1324.SK))
		(!W2 (?I1 PRECOND-OF E1324.SK))
		(!W3 (?I2 PRECOND-OF E1324.SK))
		(!W4 (?I3 PRECOND-OF E1324.SK))
		(!W5 (?P1 POSTCOND-OF E1324.SK))
		(!W6 (E1324.SK (BEFORE ?X_G)))
		(!W7 (?G1 (BEFORE ?X_I)))
		(!W8 (E1324.SK (BEFORE NOW365)))
	)
	(:CERTAINTIES
		(!C1 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R17 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C7 (!R5 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C8 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C9 (!R17 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C10 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 5)
("He took the cat to the vet." "The vet called it sick."
 "The man got some medicine." "The cat took the medicine."
 "The cat got better.")
(EPI-SCHEMA ((MAN1329.SK ((ADV-A (TO.P VET1323.SK)) TAKE.1184.V) CAT1322.SK
              (AT.P-ARG ?L))
             ** E1324.SK)
	(:ROLES
		(!R1 (MAN1329.SK AGENT.N))
		(!R2 (CAT1322.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAN1329.SK = CAT1322.SK)))
		(!R5 (CAT1322.SK WATCH.N))
		(!R6 (CAT1322.SK (PERTAIN-TO MAN1329.SK)))
		(!R7 (VET1323.SK VET.N))
		(!R8 (CAT1322.SK CAT.N))
		(!R9 (MAN1329.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN1329.SK (WANT.V (THAT (MAN1329.SK (HAVE.V CAT1322.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN1329.SK HAVE.V CAT1322.SK)))
		(?I2 (MAN1329.SK (AT.P ?L)))
		(?I3 (CAT1322.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1329.SK HAVE.V CAT1322.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1324.SK))
		(!W2 (?I1 PRECOND-OF E1324.SK))
		(!W3 (?I2 PRECOND-OF E1324.SK))
		(!W4 (?I3 PRECOND-OF E1324.SK))
		(!W5 (?P1 POSTCOND-OF E1324.SK))
		(!W6 (E1324.SK (BEFORE ?X_D)))
		(!W7 (E1324.SK (BEFORE NOW365)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 3)
("He took the cat to the vet." "The vet called it sick."
 "The man got some medicine." "The cat took the medicine."
 "The cat got better.")
(EPI-SCHEMA ((MAN1329.SK ((ADV-A (TO.P VET1323.SK)) TAKE.1186.V) CAT1322.SK
              (AT.P-ARG ?X_C))
             ** E1324.SK)
	(:ROLES
		(!R1 (MAN1329.SK AGENT.N))
		(!R2 (CAT1322.SK INANIMATE_OBJECT.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (MAN1329.SK = CAT1322.SK)))
		(!R5 (?X_A (PERTAIN-TO CAT1322.SK)))
		(!R6 (?X_A BROTHER.N))
		(!R7 (?X_B (= MAN1329.SK)))
		(!R8 (?X_B DAY.N))
		(!R9 (?X_C FARM.N))
		(!R10 (VET1323.SK VET.N))
		(!R11 (CAT1322.SK CAT.N))
		(!R12 (MAN1329.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN1329.SK (WANT.V (THAT (MAN1329.SK (HAVE.V CAT1322.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN1329.SK HAVE.V CAT1322.SK)))
		(?I2 (MAN1329.SK (AT.P ?X_C)))
		(?I3 (CAT1322.SK (AT.P ?X_C)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1329.SK HAVE.V CAT1322.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1324.SK))
		(!W2 (?I1 PRECOND-OF E1324.SK))
		(!W3 (?I2 PRECOND-OF E1324.SK))
		(!W4 (?I3 PRECOND-OF E1324.SK))
		(!W5 (?P1 POSTCOND-OF E1324.SK))
		(!W6 (E1324.SK (BEFORE ?X_G)))
		(!W7 (E1324.SK (BEFORE NOW365)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 74:
	; "Susie was new at school."
	; "She was nervous."
	; "She was afraid she would make no friends."
	; "Thankfully she did."
	; "Susie was happy she did."
; best schemas are:
; GIVE.947.V
; FIND.129.V
; MOVE.342.V
; GO.423.V
; EAT.516.V
; GET.518.V

; story 75:
	; "The cat ran out of food."
	; "I had no more in my house."
	; "I bought some more from the store."
	; "I filled up my cat's bowl of food."
	; "The cat ate his food."
; best schemas are:
; GO.1152.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; GO.742.V
; GO.806.V
; GO.740.V
; GO.1040.V

; story 76:
	; "Lisa was running through the park."
	; "She loved playing with her dog."
	; "They played catch."
	; "At the end she went in the lake."
	; "She loved to swim in it."
discarding schema RUN.929.V learned from this story
; best schemas are:
; GO.504.V
; RUN.179.V
; GO.340.V
; RUN.179.V
; RUN.350.V
(setf matches (append matches '(( (6.0114794 3)
("Lisa was running through the park." "She loved playing with her dog."
 "They played catch." "At the end she went in the lake."
 "She loved to swim in it.")
(EPI-SCHEMA ((LISA.NAME
              ((ADV-A (THROUGH.P PARK1371.SK))
               ((ADV-A (FROM.P END1380.SK))
                ((ADV-A (TO.P PARK1371.SK))
                 ((ADV-A (IN.P (K YESTERDAY.N))) RUN.1317.V))))
              PARK1371.SK)
             ** E1370.SK)
	(:ROLES
		(!R1 (END1380.SK LOCATION.N))
		(!R2 (PARK1371.SK LOCATION.N))
		(!R3 (NOT (END1380.SK = PARK1371.SK)))
		(!R4 (PARK1371.SK ((NN WATER.N) PARK.N)))
		(!R5 (LISA.NAME AGENT.N))
		(!R6 (DOG1375.SK (PERTAIN-TO LISA.NAME)))
		(!R7 (DOG1375.SK DOG.N))
		(!R8 (PARK1371.SK PARK.N))
		(!R9 (END1380.SK END.N))
	)
	(:GOALS
		(?G1 (LISA.NAME (WANT.V (KA ((ADV-A (AT.P PARK1371.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LISA.NAME (AT.P END1380.SK)))
		(?I2 (NOT (LISA.NAME (AT.P PARK1371.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (LISA.NAME (AT.P END1380.SK))))
		(?P2 (LISA.NAME (AT.P PARK1371.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1370.SK))
		(!W2 (?I2 BEFORE E1370.SK))
		(!W3 (?P1 AFTER E1370.SK))
		(!W4 (?P2 AFTER E1370.SK))
		(!W5 (?G1 CAUSE-OF E1370.SK))
		(!W6 (E1370.SK (BEFORE ?X_D)))
		(!W7 (E1370.SK (BEFORE NOW380)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.78125 2)
("Lisa was running through the park." "She loved playing with her dog."
 "They played catch." "At the end she went in the lake."
 "She loved to swim in it.")
(EPI-SCHEMA ((LISA.NAME
              ((ADV-A (THROUGH.P PARK1371.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P END1380.SK)) RUN.1318.V)))
              ?L2)
             ** E1370.SK)
	(:ROLES
		(!R1 (LISA.NAME AGENT.N))
		(!R2 (END1380.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (END1380.SK = ?L2)))
		(!R5 (LISA.NAME DOG.N))
		(!R6 (PARK1371.SK PARK.N))
		(!R7 (DOG1375.SK (PERTAIN-TO LISA.NAME)))
		(!R8 (DOG1375.SK DOG.N))
		(!R9 (END1380.SK END.N))
	)
	(:GOALS
		(?G1 (LISA.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LISA.NAME (AT.P END1380.SK)))
		(?I2 (NOT (LISA.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (LISA.NAME (AT.P END1380.SK))))
		(?P2 (LISA.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1370.SK))
		(!W2 (?I2 BEFORE E1370.SK))
		(!W3 (?P1 AFTER E1370.SK))
		(!W4 (?P2 AFTER E1370.SK))
		(!W5 (?G1 CAUSE-OF E1370.SK))
		(!W6 (E1370.SK (AT-ABOUT ?X_C)))
		(!W7 (E1370.SK (BEFORE NOW380)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.78125 2)
("Lisa was running through the park." "She loved playing with her dog."
 "They played catch." "At the end she went in the lake."
 "She loved to swim in it.")
(EPI-SCHEMA ((LISA.NAME
              ((ADV-A (THROUGH.P PARK1371.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P END1380.SK)) RUN.1318.V)))
              ?L2)
             ** E1370.SK)
	(:ROLES
		(!R1 (LISA.NAME AGENT.N))
		(!R2 (END1380.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (END1380.SK = ?L2)))
		(!R5 (LISA.NAME DOG.N))
		(!R6 (PARK1371.SK PARK.N))
		(!R7 (DOG1375.SK (PERTAIN-TO LISA.NAME)))
		(!R8 (DOG1375.SK DOG.N))
		(!R9 (END1380.SK END.N))
	)
	(:GOALS
		(?G1 (LISA.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LISA.NAME (AT.P END1380.SK)))
		(?I2 (NOT (LISA.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (LISA.NAME (AT.P END1380.SK))))
		(?P2 (LISA.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1370.SK))
		(!W2 (?I2 BEFORE E1370.SK))
		(!W3 (?P1 AFTER E1370.SK))
		(!W4 (?P2 AFTER E1370.SK))
		(!W5 (?G1 CAUSE-OF E1370.SK))
		(!W6 (E1370.SK (AT-ABOUT ?X_C)))
		(!W7 (E1370.SK (BEFORE NOW380)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.28125 2)
("Lisa was running through the park." "She loved playing with her dog."
 "They played catch." "At the end she went in the lake."
 "She loved to swim in it.")
(EPI-SCHEMA ((LISA.NAME
              ((ADV-A (THROUGH.P PARK1371.SK))
               ((ADV-A (FROM.P END1380.SK))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A
                   (FOR.P
                    (KA ((ADV-A (WITH.P (SET-OF ?X_A LISA.NAME))) PLAY.V))))
                  RUN.1319.V))))
              ?L2)
             ** E1370.SK)
	(:ROLES
		(!R1 (LISA.NAME AGENT.N))
		(!R2 (END1380.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (END1380.SK = ?L2)))
		(!R5 (?X_A LAP.N))
		(!R6 (?X_A (PERTAIN-TO ?X_A)))
		(!R7 (?X_B (IMPINGES-ON E1370.SK)))
		(!R8 (?X_C (PERTAIN-TO LISA.NAME)))
		(!R9 (?X_D DOLL.N))
		(!R10 (?X_D (PERTAIN-TO LISA.NAME)))
		(!R11 (DOG1375.SK SPADE.N))
		(!R12 (?X_G (IMPINGES-ON ?X_J)))
		(!R13 (PARK1371.SK PARK.N))
		(!R14 (DOG1375.SK (PERTAIN-TO LISA.NAME)))
		(!R15 (DOG1375.SK DOG.N))
		(!R16 (END1380.SK END.N))
	)
	(:GOALS
		(?G1 (LISA.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LISA.NAME (AT.P END1380.SK)))
		(?I2 (NOT (LISA.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (LISA.NAME (AT.P END1380.SK))))
		(?P2 (LISA.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1370.SK))
		(!W2 (?I2 BEFORE E1370.SK))
		(!W3 (?P1 AFTER E1370.SK))
		(!W4 (?P2 AFTER E1370.SK))
		(!W5 (?G1 CAUSE-OF E1370.SK))
		(!W6 (E1370.SK (AT-ABOUT ?X_K)))
		(!W7 (?X_J (AT-ABOUT ?X_K)))
		(!W8 (E1370.SK (BEFORE NOW380)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.78125 2)
("Lisa was running through the park." "She loved playing with her dog."
 "They played catch." "At the end she went in the lake."
 "She loved to swim in it.")
(EPI-SCHEMA ((LISA.NAME
              ((ADV-A (THROUGH.P PARK1371.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P END1380.SK)) RUN.1320.V)))
              ?L2)
             ** E1370.SK)
	(:ROLES
		(!R1 (LISA.NAME AGENT.N))
		(!R2 (END1380.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (END1380.SK = ?L2)))
		(!R5 (LISA.NAME DOG.N))
		(!R6 (PARK1371.SK PARK.N))
		(!R7 (DOG1375.SK (PERTAIN-TO LISA.NAME)))
		(!R8 (DOG1375.SK DOG.N))
		(!R9 (END1380.SK END.N))
	)
	(:GOALS
		(?G1 (LISA.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LISA.NAME (AT.P END1380.SK)))
		(?I2 (NOT (LISA.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (LISA.NAME (AT.P END1380.SK))))
		(?P2 (LISA.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1370.SK))
		(!W2 (?I2 BEFORE E1370.SK))
		(!W3 (?P1 AFTER E1370.SK))
		(!W4 (?P2 AFTER E1370.SK))
		(!W5 (?G1 CAUSE-OF E1370.SK))
		(!W6 (E1370.SK (AT-ABOUT ?X_C)))
		(!W7 (E1370.SK (BEFORE NOW380)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 77:
	; "Allie wanted a tattoo."
	; "She really wanted one."
	; "All her friends had one."
	; "So she went to get it done."
	; "But it was very painful."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; GET.672.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; TAKE.255.V
; GIVE.241.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V

; story 78:
	; "A man wanted a new car color."
	; "He asked his friends what color."
	; "They said blue."
	; "He took it to the shop."
	; "It got painted blue."
discarding schema TAKE.958.V learned from this story
; best schemas are:
; GO.1152.V
; TAKE.885.V
; GO.1220.V
; GO.1241.V
; TAKE.656.V
(setf matches (append matches '(( (6.015625 6)
("A man wanted a new car color." "He asked his friends what color."
 "They said blue." "He took it to the shop." "It got painted blue.")
(EPI-SCHEMA ((MAN1398.SK ((ADV-A (TO.P SHOP1409.SK)) TAKE.1346.V) COLOR1403.SK
              (AT.P-ARG ?X_C))
             ** E1410.SK)
	(:ROLES
		(!R1 (MAN1398.SK AGENT.N))
		(!R2 (COLOR1403.SK INANIMATE_OBJECT.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (MAN1398.SK = COLOR1403.SK)))
		(!R5 (THEY1412.SK BROTHER.N))
		(!R6 (?X_B (= MAN1398.SK)))
		(!R7 (?X_B DAY.N))
		(!R8 (?X_C FARM.N))
		(!R9 (THEY1412.SK CANDY.N))
		(!R10 (THEY1412.SK (PERTAIN-TO COLOR1403.SK)))
		(!R11 (?X_D (PERTAIN-TO COLOR1403.SK)))
		(!R12 (?X_D BROTHER.N))
		(!R13 (?X_E HOUSE.N))
		(!R14 (?X_E (PERTAIN-TO COLOR1403.SK)))
		(!R15 (MAN1398.SK GIRL.N))
		(!R16 (MAN1398.SK LITTLE.A))
		(!R17 (COLOR1403.SK ((NN CAR.N) COLOR.N)))
		(!R18 (COLOR1403.SK NEW.A))
		(!R19 (MAN1398.SK MAN.N))
		(!R20 (MAN1398.SK ADULT.N))
		(!R21 (SHOP1409.SK SHOP.N))
		(!R22 (THEY1412.SK AGENT.N))
	)
	(:GOALS
		(E1404.SK (MAN1398.SK (WANT.V (THAT (MAN1398.SK (HAVE.V COLOR1403.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN1398.SK HAVE.V COLOR1403.SK)))
		(?I2 (MAN1398.SK (AT.P ?X_C)))
		(?I3 (COLOR1403.SK (AT.P ?X_C)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1398.SK HAVE.V COLOR1403.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1410.SK))
		(!W2 (?I1 PRECOND-OF E1410.SK))
		(!W3 (?I2 PRECOND-OF E1410.SK))
		(!W4 (?I3 PRECOND-OF E1410.SK))
		(!W5 (?P1 POSTCOND-OF E1410.SK))
		(!W6 (E1410.SK (BEFORE ?X_G)))
		(!W7 (E1404.SK (BEFORE NOW390)))
		(!W8 (E1410.SK (BEFORE NOW393)))
	)
	(:CERTAINTIES
		(!C1 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R19 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R15 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R19 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C7 (!R19 CERTAIN-TO-DEGREE (/ 1 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.9140625 7)
("A man wanted a new car color." "He asked his friends what color."
 "They said blue." "He took it to the shop." "It got painted blue.")
(EPI-SCHEMA ((MAN1398.SK ((ADV-A (TO.P SHOP1409.SK)) TAKE.1362.V) COLOR1403.SK
              (AT.P-ARG ?X_C))
             ** E1410.SK)
	(:ROLES
		(!R1 (MAN1398.SK AGENT.N))
		(!R2 (COLOR1403.SK INANIMATE_OBJECT.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (MAN1398.SK = COLOR1403.SK)))
		(!R5 (MAN1398.SK BROTHER.N))
		(!R6 (?X_A (= MAN1398.SK)))
		(!R7 (?X_C FARM.N))
		(!R8 (?X_A DAY.N))
		(!R9 (?X_A NEXT.A))
		(!R10 (MAN1398.SK FRIEND.N))
		(!R11 (MAN1398.SK (PERTAIN-TO COLOR1403.SK)))
		(!R12 (COLOR1403.SK AGENT.N))
		(!R13 (THEY1412.SK (PERTAIN-TO COLOR1403.SK)))
		(!R14 (THEY1412.SK (PLUR BROTHER.N)))
		(!R15 (COLOR1403.SK ((NN CAR.N) COLOR.N)))
		(!R16 (COLOR1403.SK NEW.A))
		(!R17 (MAN1398.SK MAN.N))
		(!R18 (MAN1398.SK PERSON.N))
		(!R19 (SHOP1409.SK SHOP.N))
		(!R20 (THEY1412.SK AGENT.N))
	)
	(:GOALS
		(E1404.SK (MAN1398.SK (WANT.V (THAT (MAN1398.SK (HAVE.V COLOR1403.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN1398.SK HAVE.V COLOR1403.SK)))
		(?I2 (MAN1398.SK (AT.P ?X_C)))
		(?I3 (COLOR1403.SK (AT.P ?X_C)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1398.SK HAVE.V COLOR1403.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1410.SK))
		(!W2 (?I1 PRECOND-OF E1410.SK))
		(!W3 (?I2 PRECOND-OF E1410.SK))
		(!W4 (?I3 PRECOND-OF E1410.SK))
		(!W5 (?P1 POSTCOND-OF E1410.SK))
		(!W6 (E1410.SK (BEFORE ?X_G)))
		(!W7 (E1404.SK (BEFORE ?X_I)))
		(!W8 (E1404.SK (BEFORE NOW390)))
		(!W9 (E1410.SK (BEFORE NOW393)))
	)
	(:CERTAINTIES
		(!C1 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R17 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C7 (!R5 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C9 (!R17 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C10 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R18 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C13 (!R17 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C14 (!R18 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C15 (!R18 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 79:
	; "Carlton liked to play with all children."
	; "One child was sick however."
	; "His mother told him not to play with him."
	; "And so Carlton listened."
	; "So he did not get sick."
; best schemas are:
; TAKE.946.V
; GIVE.947.V
; GIVE.1297.V
; GET.671.V
; FLY.235.V
; TAKE.656.V

; story 80:
	; "The cat walked into the living room."
	; "There was a ball on the floor."
	; "The cat swatted the ball around."
	; "The cat played with the ball."
	; "The cat liked the ball."
discarding schema WALK.989.V learned from this story
discarding schema PLAY.990.V learned from this story
; best schemas are:
; GO.1338.V
; GO.1152.V
; GO.1220.V
; GO.1241.V
(setf matches (append matches '(( (4.5311556 14)
("The cat walked into the living room." "There was a ball on the floor."
 "The cat swatted the ball around." "The cat played with the ball."
 "The cat liked the ball.")
(EPI-SCHEMA ((CAT1422.SK
              ((ADV-A (INTO.P ROOM1425.SK))
               ((ADV-A (TO.P BALL1434.SK)) ((ADV-A (FROM.P ?L1)) WALK.1392.V)))
              BALL1434.SK)
             ** E1421.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (BALL1434.SK LOCATION.N))
		(!R3 (NOT (?L1 = BALL1434.SK)))
		(!R4 (CAT1422.SK NEW.A))
		(!R5 (BALL1434.SK ((NN PET.N) STORE.N)))
		(!R6 (CAT1422.SK NICE.A))
		(!R7 (CAT1422.SK (PERTAIN-TO CAT1422.SK)))
		(!R8 (CAT1422.SK FLY.N))
		(!R9 (BALL1429.SK DESK.N))
		(!R10 (CAT1422.SK (ON_TOP_OF.P BALL1429.SK)))
		(!R11 (?X_A CHICK.N))
		(!R12 (CAT1422.SK HEN.N))
		(!R13 (?X_F (NEAR.P CAT1422.SK)))
		(!R14 (?X_F (= (K (PLUR CHICK.N)))))
		(!R15 (BALL1429.SK FENCE.N))
		(!R16 (?X_B ((NN CAR.N) COLOR.N)))
		(!R17 (?X_B NEW.A))
		(!R18 (CAT1422.SK MAN.N))
		(!R19 (BALL1434.SK SHOP.N))
		(!R20 (CAT1422.SK AGENT.N))
		(!R21 (ROOM1425.SK ((NN LIVING.N) ROOM.N)))
		(!R22 (E1421.SK (RIGHT-AFTER U399)))
		(!R23 (CAT1422.SK CAT.N))
		(!R24 (CAT1422.SK ANIMAL.N))
		(!R25 (CAT1422.SK VERTEBRATE.N))
		(!R26 (BALL1429.SK BALL.N))
		(!R27 (BALL1429.SK INSTRUMENTALITY.N))
		(!R28 (BALL1429.SK ARTIFACT.N))
		(!R29 (BALL1429.SK (ON.P FLOOR1430.SK)))
		(!R30 (FLOOR1430.SK FLOOR.N))
		(!R31 (BALL1434.SK BALL.N))
		(!R32 (BALL1434.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (CAT1422.SK (WANT.V (KA ((ADV-A (AT.P BALL1434.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT1422.SK (AT.P ?L1)))
		(?I2 (NOT (CAT1422.SK (AT.P BALL1434.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CAT1422.SK (AT.P ?L1))))
		(?P2 (CAT1422.SK (AT.P BALL1434.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1421.SK))
		(!W2 (?I2 BEFORE E1421.SK))
		(!W3 (?P1 AFTER E1421.SK))
		(!W4 (?P2 AFTER E1421.SK))
		(!W5 (?G1 CAUSE-OF E1421.SK))
		(!W6 (E1421.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_J)))
		(!W8 (?G1 (BEFORE ?X_L)))
		(!W9 (E1421.SK (SAME-TIME NOW400)))
		(!W10 (E1426.SK (BEFORE NOW400)))
	)
	(:CERTAINTIES
		(!C1 (!R24 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R23 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R25 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R12 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R24 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R28 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R9 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C9 (!R15 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C10 (!R24 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C11 (!R23 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C12 (!R25 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C13 (!R27 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C14 (!R26 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C15 (!R28 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C16 (!R32 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C17 (!R19 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C18 (!R31 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.5311558 8)
("The cat walked into the living room." "There was a ball on the floor."
 "The cat swatted the ball around." "The cat played with the ball."
 "The cat liked the ball.")
(EPI-SCHEMA ((CAT1422.SK
              ((ADV-A (INTO.P ROOM1425.SK))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) WALK.1393.V)))
              ?X_C)
             ** E1421.SK)
	(:ROLES
		(!R1 (CAT1422.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (CAT1422.SK NEW.A))
		(!R6 (?X_C ((NN PET.N) STORE.N)))
		(!R7 (CAT1422.SK NICE.A))
		(!R8 (CAT1422.SK (PERTAIN-TO CAT1422.SK)))
		(!R9 (CAT1422.SK FLY.N))
		(!R10 (BALL1429.SK DESK.N))
		(!R11 (CAT1422.SK (ON_TOP_OF.P BALL1429.SK)))
		(!R12 (?X_A CHICK.N))
		(!R13 (CAT1422.SK HEN.N))
		(!R14 (?X_F (NEAR.P CAT1422.SK)))
		(!R15 (?X_F (= (K (PLUR CHICK.N)))))
		(!R16 (BALL1429.SK FENCE.N))
		(!R17 (ROOM1425.SK ((NN LIVING.N) ROOM.N)))
		(!R18 (E1421.SK (RIGHT-AFTER U399)))
		(!R19 (CAT1422.SK CAT.N))
		(!R20 (CAT1422.SK ANIMAL.N))
		(!R21 (CAT1422.SK VERTEBRATE.N))
		(!R22 (BALL1429.SK BALL.N))
		(!R23 (BALL1429.SK INSTRUMENTALITY.N))
		(!R24 (BALL1429.SK ARTIFACT.N))
		(!R25 (BALL1429.SK (ON.P FLOOR1430.SK)))
		(!R26 (FLOOR1430.SK FLOOR.N))
	)
	(:GOALS
		(?G1 (CAT1422.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT1422.SK (AT.P ?L1)))
		(?I2 (NOT (CAT1422.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CAT1422.SK (AT.P ?L1))))
		(?P2 (CAT1422.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1421.SK))
		(!W2 (?I2 BEFORE E1421.SK))
		(!W3 (?P1 AFTER E1421.SK))
		(!W4 (?P2 AFTER E1421.SK))
		(!W5 (?G1 CAUSE-OF E1421.SK))
		(!W6 (E1421.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_J)))
		(!W8 (E1421.SK (SAME-TIME NOW400)))
		(!W9 (E1426.SK (BEFORE NOW400)))
	)
	(:CERTAINTIES
		(!C1 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R19 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R21 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R13 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R24 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C9 (!R16 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C10 (!R20 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C11 (!R19 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C12 (!R21 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C13 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C14 (!R22 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C15 (!R24 CERTAIN-TO-DEGREE (/ 2 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.2780123 8)
("The cat walked into the living room." "There was a ball on the floor."
 "The cat swatted the ball around." "The cat played with the ball."
 "The cat liked the ball.")
(EPI-SCHEMA ((CAT1422.SK
              ((ADV-A (INTO.P ROOM1425.SK))
               ((ADV-A (TO.P ?X_G)) ((ADV-A (FROM.P ?L1)) WALK.1394.V)))
              ?X_G)
             ** E1421.SK)
	(:ROLES
		(!R1 (CAT1422.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_G LOCATION.N))
		(!R4 (NOT (?L1 = ?X_G)))
		(!R5 (CAT1422.SK NEW.A))
		(!R6 (?X_G ((NN PET.N) STORE.N)))
		(!R7 (CAT1422.SK NICE.A))
		(!R8 (CAT1422.SK FLY.N))
		(!R9 (BALL1429.SK DESK.N))
		(!R10 (CAT1422.SK (ON_TOP_OF.P BALL1429.SK)))
		(!R11 (CAT1422.SK FOOD.N))
		(!R12 (CAT1422.SK (PERTAIN-TO CAT1422.SK)))
		(!R13 (BALL1429.SK HOUSE.N))
		(!R14 (?X_C AGENT.N))
		(!R15 (BALL1429.SK (PERTAIN-TO ?X_C)))
		(!R16 (?X_G STORE.N))
		(!R17 (ROOM1425.SK ((NN LIVING.N) ROOM.N)))
		(!R18 (E1421.SK (RIGHT-AFTER U399)))
		(!R19 (CAT1422.SK CAT.N))
		(!R20 (CAT1422.SK ANIMAL.N))
		(!R21 (BALL1429.SK BALL.N))
		(!R22 (BALL1429.SK INSTRUMENTALITY.N))
		(!R23 (BALL1429.SK ARTIFACT.N))
		(!R24 (BALL1429.SK (ON.P FLOOR1430.SK)))
		(!R25 (FLOOR1430.SK FLOOR.N))
	)
	(:GOALS
		(?G1 (CAT1422.SK (WANT.V (KA ((ADV-A (AT.P ?X_G)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT1422.SK (AT.P ?L1)))
		(?I2 (NOT (CAT1422.SK (AT.P ?X_G))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CAT1422.SK (AT.P ?L1))))
		(?P2 (CAT1422.SK (AT.P ?X_G)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1421.SK))
		(!W2 (?I2 BEFORE E1421.SK))
		(!W3 (?P1 AFTER E1421.SK))
		(!W4 (?P2 AFTER E1421.SK))
		(!W5 (?G1 CAUSE-OF E1421.SK))
		(!W6 (E1421.SK (BEFORE ?X_E)))
		(!W7 (E1421.SK (SAME-TIME NOW400)))
		(!W8 (E1426.SK (BEFORE NOW400)))
	)
	(:CERTAINTIES
		(!C1 (!R20 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R19 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R23 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R9 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C7 (!R20 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R19 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C9 (!R22 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C10 (!R21 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C11 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0826998 8)
("The cat walked into the living room." "There was a ball on the floor."
 "The cat swatted the ball around." "The cat played with the ball."
 "The cat liked the ball.")
(EPI-SCHEMA ((CAT1422.SK
              ((ADV-A (INTO.P ROOM1425.SK))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) WALK.1395.V)))
              ?X_C)
             ** E1421.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (?L1 = ?X_C)))
		(!R4 (CAT1422.SK NEW.A))
		(!R5 (?X_C ((NN PET.N) STORE.N)))
		(!R6 (CAT1422.SK NICE.A))
		(!R7 (CAT1422.SK FLY.N))
		(!R8 (CAT1422.SK DESK.N))
		(!R9 (CAT1422.SK (ON_TOP_OF.P CAT1422.SK)))
		(!R10 (CAT1422.SK HOUSE.N))
		(!R11 (CAT1422.SK ARTIFACT.N))
		(!R12 (CAT1422.SK (PERTAIN-TO CAT1422.SK)))
		(!R13 (CAT1422.SK AGENT.N))
		(!R14 (?X_C STORE.N))
		(!R15 (ROOM1425.SK ((NN LIVING.N) ROOM.N)))
		(!R16 (E1421.SK (RIGHT-AFTER U399)))
		(!R17 (CAT1422.SK CAT.N))
		(!R18 (CAT1422.SK ANIMAL.N))
	)
	(:GOALS
		(?G1 (CAT1422.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT1422.SK (AT.P ?L1)))
		(?I2 (NOT (CAT1422.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CAT1422.SK (AT.P ?L1))))
		(?P2 (CAT1422.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1421.SK))
		(!W2 (?I2 BEFORE E1421.SK))
		(!W3 (?P1 AFTER E1421.SK))
		(!W4 (?P2 AFTER E1421.SK))
		(!W5 (?G1 CAUSE-OF E1421.SK))
		(!W6 (E1421.SK (BEFORE ?X_E)))
		(!W7 (E1421.SK (SAME-TIME NOW400)))
		(!W8 (E1426.SK (BEFORE NOW400)))
	)
	(:CERTAINTIES
		(!C1 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R17 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R7 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R8 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C7 (!R11 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C9 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C10 (!R17 CERTAIN-TO-DEGREE (/ 1 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 81:
	; "The man found a crate."
	; "He couldn't get it open."
	; "He looked for a hammer at home."
	; "He went back to the crate with the hammer."
	; "The crate was gone."
discarding schema FIND.1005.V learned from this story
; best schemas are:
; SHOP.797.V
; FIND.773.V
; FIND.888.V
; FIND.1361.V
; FIND.436.V
(setf matches (append matches '(( (3.405 1)
("The man found a crate." "He couldn't get it open."
 "He looked for a hammer at home." "He went back to the crate with the hammer."
 "The crate was gone.")
(EPI-SCHEMA ((MAN1448.SK ((ADV-A (ON.P ?X_A)) FIND.1400.V) CRATE1450.SK) **
             E1447.SK)
	(:ROLES
		(!R1 (MAN1448.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (?X_A GROUND.N))
		(!R4 (CRATE1450.SK BAG.N))
		(!R5 (?X_C (PERTAIN-TO MAN1448.SK)))
		(!R6 (?X_C WIFE.N))
		(!R7 (CRATE1450.SK CRATE.N))
		(!R8 (CRATE1450.SK CONTAINER.N))
		(!R9 (MAN1448.SK MAN.N))
		(!R10 (E1447.SK (RIGHT-AFTER U404)))
	)
	(:PRECONDS
		(?I1 (MAN1448.SK (AT.P ?L)))
		(?I2 (CRATE1450.SK (AT.P ?L)))
		(?I3 (MAN1448.SK ((ADV-A (FOR.P CRATE1450.SK)) SEARCH.V)))
		(?I4 (NOT (MAN1448.SK (KNOW.V (THAT (CRATE1450.SK (AT.P ?L)))))))
		(?I5 (NOT (MAN1448.SK (HAVE.V CRATE1450.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1448.SK (KNOW.V (THAT (CRATE1450.SK (AT.P ?L))))))
		(?P2 (MAN1448.SK (HAVE.V CRATE1450.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1447.SK (SAME-TIME ?X_H)))
		(!W2 (?X_G (BEFORE ?X_H)))
		(!W3 (E1447.SK (SAME-TIME NOW405)))
		(!W4 (E1451.SK (BEFORE NOW405)))
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
(setf matches (append matches '(( (3.405 1)
("The man found a crate." "He couldn't get it open."
 "He looked for a hammer at home." "He went back to the crate with the hammer."
 "The crate was gone.")
(EPI-SCHEMA ((MAN1448.SK FIND.1401.V CRATE1450.SK) ** E1447.SK)
	(:ROLES
		(!R1 (MAN1448.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (CRATE1450.SK ANSWER.N))
		(!R4 (?X_B STREET.N))
		(!R5 (MAN1448.SK (IN.P ?X_B)))
		(!R6 (CRATE1450.SK CRATE.N))
		(!R7 (MAN1448.SK MAN.N))
		(!R8 (E1447.SK (RIGHT-AFTER U404)))
	)
	(:PRECONDS
		(?I1 (MAN1448.SK (AT.P ?L)))
		(?I2 (CRATE1450.SK (AT.P ?L)))
		(?I3 (MAN1448.SK ((ADV-A (FOR.P CRATE1450.SK)) SEARCH.V)))
		(?I4 (NOT (MAN1448.SK (KNOW.V (THAT (CRATE1450.SK (AT.P ?L)))))))
		(?I5 (NOT (MAN1448.SK (HAVE.V CRATE1450.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1448.SK (KNOW.V (THAT (CRATE1450.SK (AT.P ?L))))))
		(?P2 (MAN1448.SK (HAVE.V CRATE1450.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1447.SK (SAME-TIME ?X_G)))
		(!W2 (?X_F (BEFORE ?X_G)))
		(!W3 (E1447.SK (SAME-TIME NOW405)))
		(!W4 (E1451.SK (BEFORE NOW405)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 1)
("The man found a crate." "He couldn't get it open."
 "He looked for a hammer at home." "He went back to the crate with the hammer."
 "The crate was gone.")
(EPI-SCHEMA ((MAN1448.SK FIND.1402.V CRATE1450.SK) ** E1447.SK)
	(:ROLES
		(!R1 (MAN1448.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (CRATE1450.SK ((NN GAS.N) STATION.N)))
		(!R4 (?X_A PHONE.N))
		(!R5 (?X_A (PERTAIN-TO MAN1448.SK)))
		(!R6 (CRATE1450.SK CRATE.N))
		(!R7 (MAN1448.SK MAN.N))
		(!R8 (E1447.SK (RIGHT-AFTER U404)))
	)
	(:PRECONDS
		(?I1 (MAN1448.SK (AT.P ?L)))
		(?I2 (CRATE1450.SK (AT.P ?L)))
		(?I3 (MAN1448.SK ((ADV-A (FOR.P CRATE1450.SK)) SEARCH.V)))
		(?I4 (NOT (MAN1448.SK (KNOW.V (THAT (CRATE1450.SK (AT.P ?L)))))))
		(?I5 (NOT (MAN1448.SK (HAVE.V CRATE1450.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1448.SK (KNOW.V (THAT (CRATE1450.SK (AT.P ?L))))))
		(?P2 (MAN1448.SK (HAVE.V CRATE1450.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1447.SK (BEFORE ?X_E)))
		(!W2 (E1447.SK (SAME-TIME NOW405)))
		(!W3 (E1451.SK (BEFORE NOW405)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 1)
("The man found a crate." "He couldn't get it open."
 "He looked for a hammer at home." "He went back to the crate with the hammer."
 "The crate was gone.")
(EPI-SCHEMA ((MAN1448.SK FIND.1403.V CRATE1450.SK) ** E1447.SK)
	(:ROLES
		(!R1 (MAN1448.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (CRATE1450.SK (= (K SOMETHING.N))))
		(!R4 (?X_A (PERTAIN-TO MAN1448.SK)))
		(!R5 (?X_A GUITAR.N))
		(!R6 (CRATE1450.SK CRATE.N))
		(!R7 (MAN1448.SK MAN.N))
		(!R8 (E1447.SK (RIGHT-AFTER U404)))
	)
	(:PRECONDS
		(?I1 (MAN1448.SK (AT.P ?L)))
		(?I2 (CRATE1450.SK (AT.P ?L)))
		(?I3 (MAN1448.SK ((ADV-A (FOR.P CRATE1450.SK)) SEARCH.V)))
		(?I4 (NOT (MAN1448.SK (KNOW.V (THAT (CRATE1450.SK (AT.P ?L)))))))
		(?I5 (NOT (MAN1448.SK (HAVE.V CRATE1450.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1448.SK (KNOW.V (THAT (CRATE1450.SK (AT.P ?L))))))
		(?P2 (MAN1448.SK (HAVE.V CRATE1450.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1447.SK (BEFORE ?X_F)))
		(!W2 (?X_E (BEFORE ?X_F)))
		(!W3 (E1447.SK (SAME-TIME NOW405)))
		(!W4 (E1451.SK (BEFORE NOW405)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 82:
	; "Tom went on a vacation."
	; "He went on a cruise."
	; "It was a ten day trip."
	; "Tom had fun."
	; "Tom wanted to go on another cruise."
; best schemas are:
; GO_FIND_EAT.566.PR
; GO_GET_NIL.677.PR
; GET.826.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.539.V
; GIVE.902.V
; CLIMB_GET_EAT.349.PR
; error processing story
; story 83:
	; "The sun set."
	; "The man was still lost."
	; "He felt himself panic."
	; "He controlled the panic."
	; "He waited for help to find him."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1136.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.662.V
(setf matches (append matches '(( (2.2878125 6)
("The sun set." "The man was still lost." "He felt himself panic."
 "He controlled the panic." "He waited for help to find him.")
(EPI-SCHEMA ((MAN1475.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1414.V
              (KA
               ((ADV-A
                 (L #:G1091718
                  (AND (#:G1091718 LIKE.P)
                       (#:G1091718
                        (= (KA ((ADV-A (AFTER.P MAN1475.SK)) RUN.V)))))))
                FEEL.V)))
             ** ?E)
	(:ROLES
		(!R1
   ((KA
     ((ADV-A
       (L #:G1091718
        (AND (?X_A LIKE.P)
             (?X_B (= (KA ((ADV-A (AFTER.P MAN1475.SK)) RUN.V)))))))
      FEEL.V))
    ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (MAN1475.SK NEW-SALIENT-ENTITY*.N))
		(!R4 (?X_C (PERTAIN-TO MAN1475.SK)))
		(!R5 (?X_C BREATH.N))
		(!R6 (MAN1475.SK AGENT.N))
		(!R7 (MAN1475.SK PRED?.N))
		(!R8 (MAN1475.SK MONEY.N))
		(!R9 (?X_C BROTHER.N))
		(!R10 (?X_C (PERTAIN-TO ?X_L)))
		(!R11 (?X_F (PERTAIN-TO ?X_L)))
		(!R12 (?X_F CANDY.N))
		(!R13 (?X_K HOUSE.N))
		(!R14 (?X_K (PERTAIN-TO ?X_L)))
		(!R15 (MAN1475.SK GIRL.N))
		(!R16 (MAN1475.SK LITTLE.A))
		(!R17 (?X_N PRED?.N))
		(!R18 (MAN1475.SK MAN.N))
		(!R19 (MAN1475.SK ADULT.N))
	)
	(:GOALS
		(?G1 (MAN1475.SK (WANT.V (THAT (NOT (MAN1475.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE
     (MAN1475.SK
      ((ADV-A
        (L #:G1091718
         (AND (?X_D LIKE.P)
              (?X_E (= (KA ((ADV-A (AFTER.P MAN1475.SK)) RUN.V)))))))
       FEEL.V)))
    CAUSE-OF (KE (MAN1475.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1478.SK
   (MAN1475.SK
    ((ADV-A
      (L #:G1091718
       (AND (?X_I LIKE.P)
            (?X_J (= (KA ((ADV-A (AFTER.P MAN1475.SK)) RUN.V)))))))
     ((ADV-A
       (L #:G1091718
        (AND (?X_G LIKE.P)
             (?X_H (= (KA ((ADV-A (AFTER.P MAN1475.SK)) RUN.V)))))))
      FEEL.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1478.SK))
		(!W2 (E1478.SK (BEFORE ?X_M)))
		(!W3 (?G1 (BEFORE ?X_Q)))
		(!W4 (E1478.SK (BEFORE NOW417)))
	)
	(:CERTAINTIES
		(!C1 (!R19 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R18 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R15 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R15 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R19 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R18 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R19 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.2878125 6)
("The sun set." "The man was still lost." "He felt himself panic."
 "He controlled the panic." "He waited for help to find him.")
(EPI-SCHEMA ((MAN1475.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1415.V
              (KA
               ((ADV-A
                 (L #:G1091718
                  (AND (#:G1091718 LIKE.P)
                       (#:G1091718
                        (= (KA ((ADV-A (AFTER.P MAN1475.SK)) RUN.V)))))))
                FEEL.V)))
             ** ?E)
	(:ROLES
		(!R1
   ((KA
     ((ADV-A
       (L #:G1091718
        (AND (?X_A LIKE.P)
             (?X_B (= (KA ((ADV-A (AFTER.P MAN1475.SK)) RUN.V)))))))
      FEEL.V))
    ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (MAN1475.SK NEW-SALIENT-ENTITY*.N))
		(!R4 (?X_C (PERTAIN-TO MAN1475.SK)))
		(!R5 (?X_C BREATH.N))
		(!R6 (MAN1475.SK AGENT.N))
		(!R7 (MAN1475.SK PRED?.N))
		(!R8 (MAN1475.SK MONEY.N))
		(!R9 (?X_C BROTHER.N))
		(!R10 (?X_C (PERTAIN-TO ?X_L)))
		(!R11 (?X_F (PERTAIN-TO ?X_L)))
		(!R12 (?X_F CANDY.N))
		(!R13 (?X_K HOUSE.N))
		(!R14 (?X_K (PERTAIN-TO ?X_L)))
		(!R15 (MAN1475.SK GIRL.N))
		(!R16 (MAN1475.SK LITTLE.A))
		(!R17 (MAN1475.SK MAN.N))
		(!R18 (MAN1475.SK ADULT.N))
	)
	(:GOALS
		(?G1 (MAN1475.SK (WANT.V (THAT (NOT (MAN1475.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE
     (MAN1475.SK
      ((ADV-A
        (L #:G1091718
         (AND (?X_D LIKE.P)
              (?X_E (= (KA ((ADV-A (AFTER.P MAN1475.SK)) RUN.V)))))))
       FEEL.V)))
    CAUSE-OF (KE (MAN1475.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1478.SK
   (MAN1475.SK
    ((ADV-A
      (L #:G1091718
       (AND (?X_I LIKE.P)
            (?X_J (= (KA ((ADV-A (AFTER.P MAN1475.SK)) RUN.V)))))))
     ((ADV-A
       (L #:G1091718
        (AND (?X_G LIKE.P)
             (?X_H (= (KA ((ADV-A (AFTER.P MAN1475.SK)) RUN.V)))))))
      FEEL.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1478.SK))
		(!W2 (E1478.SK (BEFORE ?X_M)))
		(!W3 (E1478.SK (BEFORE NOW417)))
	)
	(:CERTAINTIES
		(!C1 (!R18 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R17 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R15 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R15 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R18 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R17 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R18 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.905 0)
("The sun set." "The man was still lost." "He felt himself panic."
 "He controlled the panic." "He waited for help to find him.")
(EPI-SCHEMA ((MAN1475.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1416.V
              (KA
               ((ADV-A
                 (L #:G1091718
                  (AND (#:G1091718 LIKE.P)
                       (#:G1091718 (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
                FEEL.V)))
             ** ?E)
	(:ROLES
		(!R1
   ((KA
     ((ADV-A
       (L #:G1091718
        (AND (?X_A LIKE.P) (?X_B (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
      FEEL.V))
    ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (?X_K NEW-SALIENT-ENTITY*.N))
		(!R4 (?X_C (PERTAIN-TO MAN1475.SK)))
		(!R5 (?X_C BREATH.N))
		(!R6 (MAN1475.SK AGENT.N))
		(!R7 (?X_K LITTLE.A))
		(!R8 (?X_K PRED?.N))
		(!R9 (MAN1475.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN1475.SK (WANT.V (THAT (NOT (MAN1475.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE
     (MAN1475.SK
      ((ADV-A
        (L #:G1091718
         (AND (?X_D LIKE.P) (?X_E (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
       FEEL.V)))
    CAUSE-OF (KE (MAN1475.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1478.SK
   (MAN1475.SK
    ((ADV-A
      (L #:G1091718
       (AND (?X_I LIKE.P) (?X_J (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
     ((ADV-A
       (L #:G1091718
        (AND (?X_G LIKE.P) (?X_H (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
      FEEL.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1478.SK))
		(!W2 (E1478.SK (BEFORE ?X_M)))
		(!W3 (E1478.SK (BEFORE NOW417)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.905 0)
("The sun set." "The man was still lost." "He felt himself panic."
 "He controlled the panic." "He waited for help to find him.")
(EPI-SCHEMA ((MAN1475.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1417.V
              (KA
               ((ADV-A
                 (L #:G1091718
                  (AND (#:G1091718 LIKE.P)
                       (#:G1091718 (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
                FEEL.V)))
             ** ?E)
	(:ROLES
		(!R1
   ((KA
     ((ADV-A
       (L #:G1091718
        (AND (?X_A LIKE.P) (?X_B (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
      FEEL.V))
    ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (?X_K NEW-SALIENT-ENTITY*.N))
		(!R4 (?X_C (PERTAIN-TO MAN1475.SK)))
		(!R5 (?X_C BREATH.N))
		(!R6 (MAN1475.SK AGENT.N))
		(!R7 (?X_K PRED?.N))
		(!R8 (?X_K LITTLE.A))
		(!R9 (?X_K MONEY.N))
		(!R10 (MAN1475.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN1475.SK (WANT.V (THAT (NOT (MAN1475.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE
     (MAN1475.SK
      ((ADV-A
        (L #:G1091718
         (AND (?X_D LIKE.P) (?X_E (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
       FEEL.V)))
    CAUSE-OF (KE (MAN1475.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1478.SK
   (MAN1475.SK
    ((ADV-A
      (L #:G1091718
       (AND (?X_I LIKE.P) (?X_J (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
     ((ADV-A
       (L #:G1091718
        (AND (?X_G LIKE.P) (?X_H (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
      FEEL.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1478.SK))
		(!W2 (E1478.SK (BEFORE ?X_M)))
		(!W3 (E1478.SK (BEFORE NOW417)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 84:
	; "Helen bought a nice plant in the store."
	; "She put it into the window at home."
	; "Next morning she wanted to water it."
	; "She found it broken on the floor."
	; "It was her cat."
; best schemas are:
; GO.1338.V
; GO.1152.V
; GO.1241.V
; GO.1220.V
; GO.742.V
; GO.806.V

; story 85:
	; "Kelley stayed up very late."
	; "She wanted to get more work done."
	; "So she loaded up on caffeine."
	; "It worked."
	; "But then she felt sick."
; best schemas are:

; story 86:
	; "Charles was playing football."
	; "He went out for a pass."
	; "He caught the ball."
	; "But he landed on a window."
	; "He had to let his arm heal."
discarding schema GO.1024.V learned from this story
; best schemas are:
; GO.758.V
; GO.1220.V
; GO.1241.V
; GO.1338.V
; SIT.590.V
(setf matches (append matches '(( (3.5 0)
("Charles was playing football." "He went out for a pass."
 "He caught the ball." "But he landed on a window."
 "He had to let his arm heal.")
(EPI-SCHEMA ((CHARLES.NAME
              (OUT.ADV
               ((ADV-A (FROM.P ?X_C))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA (BUY.V ?X_A)))) GO.1521.V))))
              ?L2)
             ** E1508.SK)
	(:ROLES
		(!R1 (CHARLES.NAME AGENT.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?X_C = ?L2)))
		(!R5 (?X_C ((NN BALL.N) GAME.N)))
		(!R6 (?X_A SNACK.N))
		(!R7 (PASS1507.SK PASS.N))
		(!R8 (PASS1507.SK BALL.N))
		(!R9 (ARM1517.SK ARM.N))
		(!R10 (ARM1517.SK (PERTAIN-TO CHARLES.NAME)))
	)
	(:GOALS
		(?G1 (CHARLES.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CHARLES.NAME (AT.P ?X_C)))
		(?I2 (NOT (CHARLES.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CHARLES.NAME (AT.P ?X_C))))
		(?P2 (CHARLES.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1508.SK))
		(!W2 (?I2 BEFORE E1508.SK))
		(!W3 (?P1 AFTER E1508.SK))
		(!W4 (?P2 AFTER E1508.SK))
		(!W5 (?G1 CAUSE-OF E1508.SK))
		(!W6 (?I1 (BEFORE ?X_F)))
		(!W7 (E1508.SK (BEFORE ?X_H)))
		(!W8 (E1508.SK (BEFORE NOW431)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.2302296 10)
("Charles was playing football." "He went out for a pass."
 "He caught the ball." "But he landed on a window."
 "He had to let his arm heal.")
(EPI-SCHEMA ((CHARLES.NAME
              ((ADV-A (FOR.P PASS1507.SK))
               (OUT.ADV
                ((ADV-A (TO.P ?X_G)) ((ADV-A (FROM.P ?L1)) GO.1522.V))))
              ?X_G)
             ** E1508.SK)
	(:ROLES
		(!R1 (CHARLES.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_G LOCATION.N))
		(!R4 (NOT (?L1 = ?X_G)))
		(!R5 (CHARLES.NAME NEW.A))
		(!R6 (?X_G ((NN PET.N) STORE.N)))
		(!R7 (ARM1517.SK CAT.N))
		(!R8 (ARM1517.SK NICE.A))
		(!R9 (ARM1517.SK FLY.N))
		(!R10 (ARM1517.SK ANIMAL.N))
		(!R11 (WINDOW1513.SK DESK.N))
		(!R12 (ARM1517.SK (ON_TOP_OF.P WINDOW1513.SK)))
		(!R13 (ARM1517.SK FOOD.N))
		(!R14 (CHARLES.NAME CAT.N))
		(!R15 (WINDOW1513.SK HOUSE.N))
		(!R16 (?X_C AGENT.N))
		(!R17 (WINDOW1513.SK (PERTAIN-TO ?X_C)))
		(!R18 (?X_G STORE.N))
		(!R19 (PASS1507.SK PASS.N))
		(!R20 (PASS1507.SK BALL.N))
		(!R21 (WINDOW1513.SK WINDOW.N))
		(!R22 (WINDOW1513.SK ARTIFACT.N))
		(!R23 (WINDOW1513.SK STRUCTURE.N))
		(!R24 (ARM1517.SK ARM.N))
		(!R25 (ARM1517.SK (PERTAIN-TO CHARLES.NAME)))
	)
	(:GOALS
		(?G1 (CHARLES.NAME (WANT.V (KA ((ADV-A (AT.P ?X_G)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CHARLES.NAME (AT.P ?L1)))
		(?I2 (NOT (CHARLES.NAME (AT.P ?X_G))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CHARLES.NAME (AT.P ?L1))))
		(?P2 (CHARLES.NAME (AT.P ?X_G)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1508.SK))
		(!W2 (?I2 BEFORE E1508.SK))
		(!W3 (?P1 AFTER E1508.SK))
		(!W4 (?P2 AFTER E1508.SK))
		(!W5 (?G1 CAUSE-OF E1508.SK))
		(!W6 (E1508.SK (BEFORE ?X_E)))
		(!W7 (E1508.SK (BEFORE NOW431)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R22 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R15 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C7 (!R22 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R21 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C9 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.7302296 10)
("Charles was playing football." "He went out for a pass."
 "He caught the ball." "But he landed on a window."
 "He had to let his arm heal.")
(EPI-SCHEMA ((CHARLES.NAME
              ((ADV-A (FOR.P PASS1507.SK))
               (OUT.ADV
                ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.1523.V))))
              ?X_C)
             ** E1508.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (?L1 = ?X_C)))
		(!R4 (CHARLES.NAME NEW.A))
		(!R5 (?X_C ((NN PET.N) STORE.N)))
		(!R6 (WINDOW1513.SK CAT.N))
		(!R7 (WINDOW1513.SK NICE.A))
		(!R8 (CHARLES.NAME CAT.N))
		(!R9 (WINDOW1513.SK FLY.N))
		(!R10 (WINDOW1513.SK ANIMAL.N))
		(!R11 (WINDOW1513.SK DESK.N))
		(!R12 (WINDOW1513.SK (ON_TOP_OF.P WINDOW1513.SK)))
		(!R13 (WINDOW1513.SK HOUSE.N))
		(!R14 (WINDOW1513.SK (PERTAIN-TO CHARLES.NAME)))
		(!R15 (CHARLES.NAME AGENT.N))
		(!R16 (?X_C STORE.N))
		(!R17 (PASS1507.SK PASS.N))
		(!R18 (PASS1507.SK BALL.N))
		(!R19 (ARM1517.SK ARM.N))
		(!R20 (ARM1517.SK (PERTAIN-TO CHARLES.NAME)))
		(!R21 (WINDOW1513.SK WINDOW.N))
		(!R22 (WINDOW1513.SK ARTIFACT.N))
		(!R23 (WINDOW1513.SK STRUCTURE.N))
	)
	(:GOALS
		(?G1 (CHARLES.NAME (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CHARLES.NAME (AT.P ?L1)))
		(?I2 (NOT (CHARLES.NAME (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CHARLES.NAME (AT.P ?L1))))
		(?P2 (CHARLES.NAME (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1508.SK))
		(!W2 (?I2 BEFORE E1508.SK))
		(!W3 (?P1 AFTER E1508.SK))
		(!W4 (?P2 AFTER E1508.SK))
		(!W5 (?G1 CAUSE-OF E1508.SK))
		(!W6 (E1508.SK (BEFORE ?X_E)))
		(!W7 (E1508.SK (BEFORE NOW431)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R22 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C7 (!R22 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C8 (!R13 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C9 (!R22 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C10 (!R21 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C11 (!R23 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C12 (!R23 CERTAIN-TO-DEGREE (/ 2 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.2302296 13)
("Charles was playing football." "He went out for a pass."
 "He caught the ball." "But he landed on a window."
 "He had to let his arm heal.")
(EPI-SCHEMA ((CHARLES.NAME
              ((ADV-A (FOR.P PASS1507.SK))
               (OUT.ADV
                ((ADV-A (TO.P ?X_I)) ((ADV-A (FROM.P ?L1)) GO.1524.V))))
              ?X_I)
             ** E1508.SK)
	(:ROLES
		(!R1 (CHARLES.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_I LOCATION.N))
		(!R4 (NOT (?L1 = ?X_I)))
		(!R5 (CHARLES.NAME NEW.A))
		(!R6 (?X_I ((NN PET.N) STORE.N)))
		(!R7 (ARM1517.SK CAT.N))
		(!R8 (ARM1517.SK NICE.A))
		(!R9 (CHARLES.NAME CAT.N))
		(!R10 (ARM1517.SK FLY.N))
		(!R11 (WINDOW1513.SK DESK.N))
		(!R12 (ARM1517.SK (ON_TOP_OF.P WINDOW1513.SK)))
		(!R13 (?X_A CHICK.N))
		(!R14 (ARM1517.SK HEN.N))
		(!R15 (ARM1517.SK VERTEBRATE.N))
		(!R16 (ARM1517.SK ANIMAL.N))
		(!R17 (?X_F (NEAR.P ARM1517.SK)))
		(!R18 (?X_F (= (K (PLUR CHICK.N)))))
		(!R19 (WINDOW1513.SK FENCE.N))
		(!R20 (?X_B ((NN CAR.N) COLOR.N)))
		(!R21 (?X_B NEW.A))
		(!R22 (CHARLES.NAME MAN.N))
		(!R23 (?X_I SHOP.N))
		(!R24 (ARM1517.SK AGENT.N))
		(!R25 (PASS1507.SK PASS.N))
		(!R26 (PASS1507.SK BALL.N))
		(!R27 (WINDOW1513.SK WINDOW.N))
		(!R28 (WINDOW1513.SK ARTIFACT.N))
		(!R29 (WINDOW1513.SK STRUCTURE.N))
		(!R30 (ARM1517.SK ARM.N))
		(!R31 (ARM1517.SK (PERTAIN-TO CHARLES.NAME)))
	)
	(:GOALS
		(?G1 (CHARLES.NAME (WANT.V (KA ((ADV-A (AT.P ?X_I)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CHARLES.NAME (AT.P ?L1)))
		(?I2 (NOT (CHARLES.NAME (AT.P ?X_I))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CHARLES.NAME (AT.P ?L1))))
		(?P2 (CHARLES.NAME (AT.P ?X_I)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1508.SK))
		(!W2 (?I2 BEFORE E1508.SK))
		(!W3 (?P1 AFTER E1508.SK))
		(!W4 (?P2 AFTER E1508.SK))
		(!W5 (?G1 CAUSE-OF E1508.SK))
		(!W6 (E1508.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_J)))
		(!W8 (?G1 (BEFORE ?X_L)))
		(!W9 (E1508.SK (BEFORE NOW431)))
	)
	(:CERTAINTIES
		(!C1 (!R16 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R14 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R16 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C7 (!R28 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R11 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C9 (!R19 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C10 (!R28 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C11 (!R27 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C12 (!R29 CERTAIN-TO-DEGREE (/ 2 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 87:
	; "The man filled the pool with water."
	; "He jumped in the pool."
	; "The water was cold."
	; "He got out of the pool."
	; "He bought a heater for the water."
; best schemas are:
; GO.1338.V
; SIT.49.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; TAKE.885.V
; GO.51.V

; story 88:
	; "Allie was watching a show yesterday."
	; "It was very funny."
	; "Allie laughed out loud."
	; "She didn't know how to keep it in."
	; "She wanted to watch it again."
; best schemas are:
; GO.19.V
; GO.90.V
; GO.504.V
; GO.350.V
; GO.828.V
; GO.107.V

; story 89:
	; "The doll caught on fire."
	; "The girl thought it was funny."
	; "She watched it burn."
	; "It caught the house on fire."
	; "The whole house burned down."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; TAKE.885.V
; GO.1220.V
; GO.1241.V
; SIT.65.V

; story 90:
	; "The dog went outside."
	; "It walked over by the tree."
	; "The dog trotted around the tree."
	; "The dog found a spot."
	; "The dog laid down and took a nap."
discarding schema FIND.1038.V learned from this story
discarding schema TAKE.1039.V learned from this story
; best schemas are:
; GO_FIND_EAT.566.PR
; GO.1338.V
; GO.1152.V
; FIND.562.V
(setf matches (append matches '(( (0.5 4)
("The dog went outside." "It walked over by the tree."
 "The dog trotted around the tree." "The dog found a spot."
 "The dog laid down and took a nap.")
(EPI-SCHEMA ((DOG1560.SK GO_FIND_EAT.1592.PR ?X_A SPOT1572.SK TREE1562.SK) **
             ?E)
	(:ROLES
		(!R1 (?X_A FIELD.N))
		(!R2 (SPOT1572.SK (OF.P (K GRASS.N))))
		(!R3 (DOG1560.SK COW.N))
		(!R4 (TREE1562.SK FOOD.N))
		(!R5 (TREE1562.SK GRASS.N))
		(!R6 (DOG1560.SK DOG.N))
		(!R7 (DOG1560.SK PLACENTAL.N))
		(!R8 (TREE1562.SK TREE.N))
		(!R9 (TREE1562.SK VASCULAR_PLANT.N))
		(!R10 (SPOT1572.SK SPOT.N))
	)
	(:PRECONDS
		(?I1 (DOG1560.SK (AT.P ?L1_2)))
		(?I2 (NOT (DOG1560.SK (AT.P ?X_A))))
	)
	(:STEPS
		(E1559.SK
   (DOG1560.SK
    (OUTSIDE.ADV
     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) (OUT.ADV GO.563.V))))
    ?X_A))
		(?E2 (DOG1560.SK FIND.562.V SPOT1572.SK))
		(?E3 (DOG1560.SK EAT.564.V TREE1562.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (DOG1560.SK (HAVE.V TREE1562.SK))))
		(?P2 (NOT (DOG1560.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1559.SK BEFORE ?E2))
		(!W2 (?E2 BEFORE ?E3))
		(!W3 (E1559.SK (BEFORE NOW450)))
	)
	(:CERTAINTIES
		(!C1 (!R7 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R3 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
	)
)
))))
(setf matches (append matches '(( (0.5 4)
("The dog went outside." "It walked over by the tree."
 "The dog trotted around the tree." "The dog found a spot."
 "The dog laid down and took a nap.")
(EPI-SCHEMA ((DOG1560.SK GO_FIND_EAT.1593.PR ?X_A SPOT1572.SK DOG1570.SK) ** ?E)
	(:ROLES
		(!R1 (?X_A FIELD.N))
		(!R2 (SPOT1572.SK (OF.P (K GRASS.N))))
		(!R3 (DOG1560.SK COW.N))
		(!R4 (DOG1570.SK FOOD.N))
		(!R5 (DOG1570.SK GRASS.N))
		(!R6 (DOG1560.SK DOG.N))
		(!R7 (DOG1560.SK PLACENTAL.N))
		(!R8 (SPOT1572.SK SPOT.N))
		(!R9 (DOG1570.SK DOG.N))
		(!R10 (DOG1570.SK ORGANISM.N))
	)
	(:PRECONDS
		(?I1 (DOG1560.SK (AT.P ?L1_2)))
		(?I2 (NOT (DOG1560.SK (AT.P ?X_A))))
	)
	(:STEPS
		(E1559.SK
   (DOG1560.SK
    (OUTSIDE.ADV
     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) (OUT.ADV GO.563.V))))
    ?X_A))
		(?E2 (DOG1560.SK FIND.562.V SPOT1572.SK))
		(?E3 (DOG1560.SK EAT.564.V DOG1570.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (DOG1560.SK (HAVE.V DOG1570.SK))))
		(?P2 (NOT (DOG1560.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1559.SK BEFORE ?E2))
		(!W2 (?E2 BEFORE ?E3))
		(!W3 (E1559.SK (BEFORE NOW450)))
	)
	(:CERTAINTIES
		(!C1 (!R7 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R3 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
	)
)
))))
(setf matches (append matches '(( (0.5 4)
("The dog went outside." "It walked over by the tree."
 "The dog trotted around the tree." "The dog found a spot."
 "The dog laid down and took a nap.")
(EPI-SCHEMA ((DOG1570.SK GO_FIND_EAT.1595.PR ?X_A SPOT1572.SK DOG1560.SK) ** ?E)
	(:ROLES
		(!R1 (?X_A FIELD.N))
		(!R2 (SPOT1572.SK (OF.P (K GRASS.N))))
		(!R3 (DOG1570.SK COW.N))
		(!R4 (DOG1560.SK FOOD.N))
		(!R5 (DOG1560.SK GRASS.N))
		(!R6 (SPOT1572.SK SPOT.N))
		(!R7 (DOG1570.SK DOG.N))
		(!R8 (DOG1570.SK PLACENTAL.N))
		(!R9 (E1569.SK (RIGHT-AFTER U452)))
		(!R10 (DOG1560.SK DOG.N))
		(!R11 (DOG1560.SK ORGANISM.N))
	)
	(:PRECONDS
		(?I1 (DOG1570.SK (AT.P ?L1_2)))
		(?I2 (NOT (DOG1570.SK (AT.P ?X_A))))
	)
	(:STEPS
		(?E1
   (DOG1570.SK (OUT.ADV ((ADV-A (TO.P ?X_A)) ((ADV-A (FROM.P ?L1)) GO.563.V)))
    ?X_A))
		(E1573.SK (DOG1570.SK FIND.562.V SPOT1572.SK))
		(?E3 (DOG1570.SK EAT.564.V DOG1560.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (DOG1570.SK (HAVE.V DOG1560.SK))))
		(?P2 (NOT (DOG1570.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE E1573.SK))
		(!W2 (E1573.SK BEFORE ?E3))
		(!W3 (E1573.SK (BEFORE NOW453)))
		(!W4 (E1569.SK (SAME-TIME NOW453)))
	)
	(:CERTAINTIES
		(!C1 (!R8 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R3 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
	)
)
))))
(setf matches (append matches '(( (2.68625 15)
("The dog went outside." "It walked over by the tree."
 "The dog trotted around the tree." "The dog found a spot."
 "The dog laid down and took a nap.")
(EPI-SCHEMA ((DOG1560.SK
              (OUTSIDE.ADV
               ((ADV-A (TO.P ?X_I)) ((ADV-A (FROM.P ?L1)) GO.1603.V)))
              ?X_I)
             ** E1559.SK)
	(:ROLES
		(!R1 (DOG1560.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_I LOCATION.N))
		(!R4 (NOT (?L1 = ?X_I)))
		(!R5 (DOG1560.SK NEW.A))
		(!R6 (?X_I ((NN PET.N) STORE.N)))
		(!R7 (TREE1562.SK CAT.N))
		(!R8 (TREE1562.SK NICE.A))
		(!R9 (TREE1562.SK (PERTAIN-TO DOG1560.SK)))
		(!R10 (DOG1560.SK CAT.N))
		(!R11 (TREE1562.SK FLY.N))
		(!R12 (SPOT1572.SK DESK.N))
		(!R13 (TREE1562.SK (ON_TOP_OF.P SPOT1572.SK)))
		(!R14 (TREE1567.SK CHICK.N))
		(!R15 (TREE1562.SK HEN.N))
		(!R16 (TREE1562.SK VERTEBRATE.N))
		(!R17 (TREE1562.SK ANIMAL.N))
		(!R18 (?X_F (NEAR.P TREE1562.SK)))
		(!R19 (?X_F (= (K (PLUR CHICK.N)))))
		(!R20 (SPOT1572.SK FENCE.N))
		(!R21 (?X_B ((NN CAR.N) COLOR.N)))
		(!R22 (?X_B NEW.A))
		(!R23 (DOG1560.SK MAN.N))
		(!R24 (?X_I SHOP.N))
		(!R25 (TREE1562.SK AGENT.N))
		(!R26 (DOG1560.SK DOG.N))
		(!R27 (DOG1560.SK CARNIVORE.N))
		(!R28 (TREE1562.SK TREE.N))
		(!R29 (TREE1562.SK ORGANISM.N))
		(!R30 (TREE1567.SK TREE.N))
		(!R31 (TREE1567.SK ORGANISM.N))
		(!R32 (SPOT1572.SK SPOT.N))
		(!R33 (SPOT1572.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (DOG1560.SK (WANT.V (KA ((ADV-A (AT.P ?X_I)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG1560.SK (AT.P ?L1)))
		(?I2 (NOT (DOG1560.SK (AT.P ?X_I))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG1560.SK (AT.P ?L1))))
		(?P2 (DOG1560.SK (AT.P ?X_I)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1559.SK))
		(!W2 (?I2 BEFORE E1559.SK))
		(!W3 (?P1 AFTER E1559.SK))
		(!W4 (?P2 AFTER E1559.SK))
		(!W5 (?G1 CAUSE-OF E1559.SK))
		(!W6 (E1559.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_J)))
		(!W8 (?G1 (BEFORE ?X_L)))
		(!W9 (E1559.SK (BEFORE NOW450)))
	)
	(:CERTAINTIES
		(!C1 (!R17 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R16 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C5 (!R15 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R17 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C7 (!R33 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C9 (!R20 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C10 (!R27 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C11 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R26 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C13 (!R27 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C14 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C15 (!R29 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R28 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C17 (!R29 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C18 (!R29 CERTAIN-TO-DEGREE (/ 3 3)))
		(!C19 (!R29 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R29 CERTAIN-TO-DEGREE (/ 3 4)))
		(!C21 (!R29 CERTAIN-TO-DEGREE (/ 3 4)))
		(!C22 (!R31 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C23 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C24 (!R30 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C25 (!R33 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C26 (!R32 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C27 (!R33 CERTAIN-TO-DEGREE (/ 2 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.68625 13)
("The dog went outside." "It walked over by the tree."
 "The dog trotted around the tree." "The dog found a spot."
 "The dog laid down and took a nap.")
(EPI-SCHEMA ((DOG1560.SK
              (OUTSIDE.ADV
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.1604.V)))
              ?X_C)
             ** E1559.SK)
	(:ROLES
		(!R1 (DOG1560.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (DOG1560.SK NEW.A))
		(!R6 (?X_C ((NN PET.N) STORE.N)))
		(!R7 (TREE1562.SK CAT.N))
		(!R8 (TREE1562.SK NICE.A))
		(!R9 (TREE1562.SK (PERTAIN-TO DOG1560.SK)))
		(!R10 (DOG1560.SK CAT.N))
		(!R11 (TREE1562.SK FLY.N))
		(!R12 (SPOT1572.SK DESK.N))
		(!R13 (TREE1562.SK (ON_TOP_OF.P SPOT1572.SK)))
		(!R14 (TREE1567.SK CHICK.N))
		(!R15 (TREE1562.SK HEN.N))
		(!R16 (TREE1562.SK VERTEBRATE.N))
		(!R17 (TREE1562.SK ANIMAL.N))
		(!R18 (?X_F (NEAR.P TREE1562.SK)))
		(!R19 (?X_F (= (K (PLUR CHICK.N)))))
		(!R20 (SPOT1572.SK FENCE.N))
		(!R21 (DOG1560.SK DOG.N))
		(!R22 (DOG1560.SK CARNIVORE.N))
		(!R23 (TREE1562.SK TREE.N))
		(!R24 (TREE1562.SK ORGANISM.N))
		(!R25 (TREE1567.SK TREE.N))
		(!R26 (TREE1567.SK ORGANISM.N))
		(!R27 (SPOT1572.SK SPOT.N))
		(!R28 (SPOT1572.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (DOG1560.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG1560.SK (AT.P ?L1)))
		(?I2 (NOT (DOG1560.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG1560.SK (AT.P ?L1))))
		(?P2 (DOG1560.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1559.SK))
		(!W2 (?I2 BEFORE E1559.SK))
		(!W3 (?P1 AFTER E1559.SK))
		(!W4 (?P2 AFTER E1559.SK))
		(!W5 (?G1 CAUSE-OF E1559.SK))
		(!W6 (E1559.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_J)))
		(!W8 (E1559.SK (BEFORE NOW450)))
	)
	(:CERTAINTIES
		(!C1 (!R17 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C4 (!R16 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C5 (!R15 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C6 (!R17 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C7 (!R28 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C8 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C9 (!R20 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C10 (!R22 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C11 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C12 (!R21 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C13 (!R22 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C14 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C15 (!R24 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C16 (!R23 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C17 (!R24 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C18 (!R24 CERTAIN-TO-DEGREE (/ 3 3)))
		(!C19 (!R24 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C20 (!R24 CERTAIN-TO-DEGREE (/ 3 4)))
		(!C21 (!R24 CERTAIN-TO-DEGREE (/ 3 4)))
		(!C22 (!R26 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C23 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C24 (!R25 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C25 (!R28 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C26 (!R27 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C27 (!R28 CERTAIN-TO-DEGREE (/ 2 3)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.405 2)
("The dog went outside." "It walked over by the tree."
 "The dog trotted around the tree." "The dog found a spot."
 "The dog laid down and took a nap.")
(EPI-SCHEMA ((DOG1570.SK FIND.1605.V SPOT1572.SK) ** E1569.SK)
	(:ROLES
		(!R1 (DOG1570.SK AGENT.N))
		(!R2 (?X_B LOCATION.N))
		(!R3 (DOG1570.SK COW.N))
		(!R4 (SPOT1572.SK (OF.P (K GRASS.N))))
		(!R5 (?X_B FIELD.N))
		(!R6 (SPOT1572.SK SPOT.N))
		(!R7 (DOG1570.SK DOG.N))
		(!R8 (DOG1570.SK PLACENTAL.N))
		(!R9 (E1569.SK (RIGHT-AFTER U452)))
	)
	(:PRECONDS
		(?I1 (DOG1570.SK (AT.P ?X_B)))
		(?I2 (SPOT1572.SK (AT.P ?X_B)))
		(?I3 (DOG1570.SK ((ADV-A (FOR.P SPOT1572.SK)) SEARCH.V)))
		(?I4 (NOT (DOG1570.SK (KNOW.V (THAT (SPOT1572.SK (AT.P ?X_B)))))))
		(?I5 (NOT (DOG1570.SK (HAVE.V SPOT1572.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (DOG1570.SK (KNOW.V (THAT (SPOT1572.SK (AT.P ?X_B))))))
		(?P2 (DOG1570.SK (HAVE.V SPOT1572.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1569.SK (SAME-TIME ?X_G)))
		(!W2 (?X_F (BEFORE ?X_G)))
		(!W3 (E1569.SK (SAME-TIME NOW453)))
		(!W4 (E1573.SK (BEFORE NOW453)))
	)
	(:CERTAINTIES
		(!C1 (!R8 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R3 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 91:
	; "Bill got some surprise money."
	; "He didn't know what to do with it."
	; "He asked his dad."
	; "His dad told him to invest it."
	; "He did so."
; best schemas are:
; GET.104.V
; GET.73.V
; GET.660.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V
; FIND.129.V

; story 92:
	; "There was a knock on the door."
	; "The man inside was busy."
	; "He did not open the door."
	; "There was a louder knock on the door."
	; "The man answered the louder knock."
discarding schema AVOID_ACTION_TO_AVOID_DISPLEASURE.1059.V learned from this story
; best schemas are:
; FOLLOW.709.V
; GO.1083.V
; GO.1338.V
; RUN.311.V
; GO.51.V

; story 93:
	; "Tom got a kitten."
	; "It ran away within days."
	; "Tom never found it."
	; "He got another cat."
	; "By the time Tom's kitten returned he had forgotten about it."
discarding schema FIND.1069.V learned from this story
discarding schema GET.1070.V learned from this story
; best schemas are:
; GET.518.V
; GET.333.V
; GET.821.V
; GET.826.V
(setf matches (append matches '(( (4.4049997 6)
("Tom got a kitten." "It ran away within days." "Tom never found it."
 "He got another cat."
 "By the time Tom's kitten returned he had forgotten about it.")
(EPI-SCHEMA ((TOM.NAME ((ADV-A (ON.P ?X_C)) GET.1662.V) KITTEN1621.SK
              (AT.P-ARG ?L))
             ** E1622.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (KITTEN1621.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = KITTEN1621.SK)))
		(!R5 (?X_A BEACH.N))
		(!R6 (KITTEN1621.SK DAY.N))
		(!R7 (KITTEN1621.SK GOOD.A))
		(!R8 (TOM.NAME DAY.N))
		(!R9 (?X_C (PERTAIN-TO TOM.NAME)))
		(!R10 (?X_C CAR.N))
		(!R11 (KITTEN1621.SK KITTEN.N))
		(!R12 (TOM.NAME (PERTAIN-TO TOM.NAME)))
		(!R13 (TOM.NAME KITTEN.N))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V KITTEN1621.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V KITTEN1621.SK)))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 (KITTEN1621.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (TOM.NAME HAVE.V KITTEN1621.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1622.SK))
		(!W2 (?I1 PRECOND-OF E1622.SK))
		(!W3 (?I2 PRECOND-OF E1622.SK))
		(!W4 (?I3 PRECOND-OF E1622.SK))
		(!W5 (?P1 POSTCOND-OF E1622.SK))
		(!W6 (?G1 (BEFORE ?X_G)))
		(!W7 (E1622.SK (CONSEC ?X_H)))
		(!W8 (?X_H (BEFORE ?X_J)))
		(!W9 (E1622.SK (BEFORE ?X_J)))
		(!W10 (?P1 (BEFORE ?X_L)))
		(!W11 (E1622.SK (BEFORE NOW465)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 6)
("Tom got a kitten." "It ran away within days." "Tom never found it."
 "He got another cat."
 "By the time Tom's kitten returned he had forgotten about it.")
(EPI-SCHEMA ((TOM.NAME GET.1663.V KITTEN1621.SK (AT.P-ARG ?L)) ** E1622.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (KITTEN1621.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = KITTEN1621.SK)))
		(!R5 (KITTEN1621.SK DOG.N))
		(!R6 (KITTEN1621.SK NEW.A))
		(!R7 (TOM.NAME DOG.N))
		(!R8 (?X_B (WALK.V TOM.NAME)))
		(!R9 (?X_B EVENING.N))
		(!R10 (KITTEN1621.SK KITTEN.N))
		(!R11 (KITTEN1621.SK ANIMAL.N))
		(!R12 (TOM.NAME (PERTAIN-TO TOM.NAME)))
		(!R13 (TOM.NAME KITTEN.N))
		(!R14 (TOM.NAME ANIMAL.N))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V KITTEN1621.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V KITTEN1621.SK)))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 (KITTEN1621.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (TOM.NAME HAVE.V KITTEN1621.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1622.SK))
		(!W2 (?I1 PRECOND-OF E1622.SK))
		(!W3 (?I2 PRECOND-OF E1622.SK))
		(!W4 (?I3 PRECOND-OF E1622.SK))
		(!W5 (?P1 POSTCOND-OF E1622.SK))
		(!W6 (E1622.SK (AT-ABOUT ?X_F)))
		(!W7 (E1622.SK (BEFORE NOW465)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R14 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 94:
	; "The man sat down on the ground."
	; "He was tired of walking."
	; "He took out his water bottle."
	; "It was empty."
	; "The man had to keep walking to find water."
; best schemas are:
; SIT.49.V
; FIND.773.V
; SIT.1258.V
; SIT.784.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V

; story 95:
	; "It was cold in my house."
	; "I looked for a blanket."
	; "The one I found was too small."
	; "I found a bigger blanket."
	; "I covered myself with the blanket."
; best schemas are:
; GO.1338.V
; GO.1152.V
; TAKE.1391.V
; GO.1220.V
; GO.1241.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V

; story 96:
	; "Magee was only good at running."
	; "He loved to run all the time."
	; "One day he ran far away from home."
	; "Magee was never seen again."
	; "Some say Magee is still running today."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; TAKE.946.V
; COME.280.V

; story 97:
	; "Mitchell couldn't get to sleep."
	; "He tried to watch tv."
	; "That didn't help."
	; "He then decided to lay down."
	; "He fell right asleep."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; GET.526.V
; GET.672.V

; story 98:
	; "Simon called his dog."
	; "The dog did not come."
	; "He yelled his dogs name."
	; "His mom heard him."
	; "His mom found his dog."
; best schemas are:
; GO.1338.V
; GO.1152.V
; TAKE.1391.V
; GO.742.V
; GO.806.V
; GO.1220.V

; story 99:
	; "There was a loud noise outside."
	; "The woman felt scared."
	; "She called a friend."
	; "The friend came over."
	; "They could not find the source of the noise."
; best schemas are:
; GO.168.V
; RUN.401.V
; GO.658.V
; GO.387.V
; TAKE.656.V
; TAKE.1391.V

