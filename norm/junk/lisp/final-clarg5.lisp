(setf matches (list))
(setf chain-matches (list))
; story 0:
	; "I was jogging down the road."
	; "My dad lives out of town."
	; "He saw me."
	; "He picked me up."
	; "We went for some Chinese food."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1029.V
; FLY.235.V
; COME.605.V
; FEED.1088.V
; FEED_TAKE_NIL.1100.PR
; EAT.342.V

; story 1:
	; "My brother was wearing a hat."
	; "He took it off his head."
	; "He threw it on the floor."
	; "I picked the hat up."
	; "I put it on our hat rack."
discarding schema TAKE.22.V learned from this story
; best schemas are:
; TAKE.135.V
; TAKE.413.V
; BUMP.400.V
; RUN.401.V
; COME.605.V
(setf matches (append matches '(( (4.4049997 5)
("My brother was wearing a hat." "He took it off his head."
 "He threw it on the floor." "I picked the hat up." "I put it on our hat rack.")
(EPI-SCHEMA ((BROTHER27.SK ((ADV-A (OFF.P HEAD31.SK)) TAKE.74.V) IT50.SK
              (AT.P-ARG ?X_C))
             ** E34.SK)
	(:ROLES
		(!R1 (BROTHER27.SK AGENT.N))
		(!R2 (IT50.SK INANIMATE_OBJECT.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (BROTHER27.SK = IT50.SK)))
		(!R5 (BROTHER27.SK MAN.N))
		(!R6 (BROTHER27.SK (PERTAIN-TO IT50.SK)))
		(!R7 (?X_B (= BROTHER27.SK)))
		(!R8 (?X_B DAY.N))
		(!R9 (?X_C FARM.N))
		(!R10 (BROTHER27.SK BROTHER.N))
		(!R11 (BROTHER27.SK PERSON.N))
		(!R12 (BROTHER27.SK (PERTAIN-TO ME51.SK)))
		(!R13 (ME51.SK AGENT.N))
		(!R14 (HEAD31.SK (PERTAIN-TO BROTHER27.SK)))
		(!R15 (HEAD31.SK HEAD.N))
	)
	(:GOALS
		(?G1 (BROTHER27.SK (WANT.V (THAT (BROTHER27.SK (HAVE.V IT50.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (BROTHER27.SK HAVE.V IT50.SK)))
		(?I2 (BROTHER27.SK (AT.P ?X_C)))
		(?I3 (IT50.SK (AT.P ?X_C)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (BROTHER27.SK HAVE.V IT50.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E34.SK))
		(!W2 (?I1 PRECOND-OF E34.SK))
		(!W3 (?I2 PRECOND-OF E34.SK))
		(!W4 (?I3 PRECOND-OF E34.SK))
		(!W5 (?P1 POSTCOND-OF E34.SK))
		(!W6 (E34.SK (BEFORE ?X_G)))
		(!W7 (E34.SK (BEFORE NOW6)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R5 CERTAIN-TO-DEGREE (/ 1 3)))
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
(setf matches (append matches '(( (3.905 8)
("My brother was wearing a hat." "He took it off his head."
 "He threw it on the floor." "I picked the hat up." "I put it on our hat rack.")
(EPI-SCHEMA ((BROTHER27.SK ((ADV-A (OFF.P HEAD31.SK)) (HOME.ADV TAKE.75.V))
              IT50.SK (AT.P-ARG ?L))
             ** E34.SK)
	(:ROLES
		(!R1 (BROTHER27.SK AGENT.N))
		(!R2 (IT50.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (BROTHER27.SK = IT50.SK)))
		(!R5 (BROTHER27.SK (PLUR GIRL.N)))
		(!R6 (IT50.SK GIANT.A))
		(!R7 (IT50.SK FROG.N))
		(!R8 (BROTHER27.SK (PERTAIN-TO BROTHER27.SK)))
		(!R9 (BROTHER27.SK (PLUR FRIEND.N)))
		(!R10 (BROTHER27.SK BROTHER.N))
		(!R11 (BROTHER27.SK (PERTAIN-TO ME51.SK)))
		(!R12 (ME51.SK AGENT.N))
		(!R13 (HEAD31.SK (PERTAIN-TO BROTHER27.SK)))
		(!R14 (HEAD31.SK HEAD.N))
	)
	(:GOALS
		(?G1 (BROTHER27.SK (WANT.V (THAT (BROTHER27.SK (HAVE.V IT50.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (BROTHER27.SK HAVE.V IT50.SK)))
		(?I2 (BROTHER27.SK (AT.P ?L)))
		(?I3 (IT50.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (BROTHER27.SK HAVE.V IT50.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E34.SK))
		(!W2 (?I1 PRECOND-OF E34.SK))
		(!W3 (?I2 PRECOND-OF E34.SK))
		(!W4 (?I3 PRECOND-OF E34.SK))
		(!W5 (?P1 POSTCOND-OF E34.SK))
		(!W6 (E34.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E34.SK (BEFORE NOW6)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 2:
	; "The dog was thirsty."
	; "The man brought him water."
	; "The dog followed the man home."
	; "The man fed him."
	; "The dog never left the man's side."
discarding schema FOLLOW.69.V learned from this story
; best schemas are:
; FOLLOW.709.V
; GO.423.V
; GO.1261.V
; GO.51.V
; GO.504.V
(setf matches (append matches '(( (3.405 8)
("The dog was thirsty." "The man brought him water."
 "The dog followed the man home." "The man fed him."
 "The dog never left the man's side.")
(EPI-SCHEMA ((DOG60.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P MAN64.SK)) FOLLOW.112.V))
              MAN64.SK)
             ** E67.SK)
	(:ROLES
		(!R1 (DOG60.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (MAN64.SK LOCATION.N))
		(!R4 (NOT (?L1 = MAN64.SK)))
		(!R5 (DOG60.SK MAN.N))
		(!R6 (MAN64.SK SOUND.N))
		(!R7 (SIDE83.SK ((NN PHONE.N) RING.N)))
		(!R8 (SIDE83.SK (PERTAIN-TO DOG60.SK)))
		(!R9 (SIDE83.SK PHONE.N))
		(!R10 (DOG60.SK DOG.N))
		(!R11 (E67.SK (RIGHT-AFTER U11)))
		(!R12 (MAN64.SK MAN.N))
		(!R13 (SIDE83.SK SIDE.N))
		(!R14 (SIDE83.SK (PERTAIN-TO MAN64.SK)))
	)
	(:GOALS
		(?G1 (DOG60.SK (WANT.V (KA ((ADV-A (AT.P MAN64.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG60.SK (AT.P ?L1)))
		(?I2 (NOT (DOG60.SK (AT.P MAN64.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG60.SK (AT.P ?L1))))
		(?P2 (DOG60.SK (AT.P MAN64.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E67.SK))
		(!W2 (?I2 BEFORE E67.SK))
		(!W3 (?P1 AFTER E67.SK))
		(!W4 (?P2 AFTER E67.SK))
		(!W5 (?G1 CAUSE-OF E67.SK))
		(!W6 (E67.SK (BEFORE ?X_E)))
		(!W7 (E67.SK (SAME-TIME NOW12)))
		(!W8 (E72.SK (BEFORE NOW12)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 8)
("The dog was thirsty." "The man brought him water."
 "The dog followed the man home." "The man fed him."
 "The dog never left the man's side.")
(EPI-SCHEMA ((DOG60.SK
              (OUT.ADV
               ((ADV-A (TO.P MAN64.SK)) ((ADV-A (FROM.P ?L1)) FOLLOW.113.V)))
              MAN64.SK)
             ** E67.SK)
	(:ROLES
		(!R1 (DOG60.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (MAN64.SK LOCATION.N))
		(!R4 (NOT (?L1 = MAN64.SK)))
		(!R5 (MAN64.SK MAILBOX.N))
		(!R6 (MAN64.SK (PERTAIN-TO DOG60.SK)))
		(!R7 (DOG60.SK MAN.N))
		(!R8 (SIDE83.SK PAPER.N))
		(!R9 (SIDE83.SK (PERTAIN-TO DOG60.SK)))
		(!R10 (?X_C ((NN PAPER.N) BOY.N)))
		(!R11 (?X_C (PERTAIN-TO DOG60.SK)))
		(!R12 (DOG60.SK DOG.N))
		(!R13 (E67.SK (RIGHT-AFTER U11)))
		(!R14 (MAN64.SK MAN.N))
		(!R15 (SIDE83.SK SIDE.N))
		(!R16 (SIDE83.SK (PERTAIN-TO MAN64.SK)))
	)
	(:GOALS
		(?G1 (DOG60.SK (WANT.V (KA ((ADV-A (AT.P MAN64.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG60.SK (AT.P ?L1)))
		(?I2 (NOT (DOG60.SK (AT.P MAN64.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG60.SK (AT.P ?L1))))
		(?P2 (DOG60.SK (AT.P MAN64.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E67.SK))
		(!W2 (?I2 BEFORE E67.SK))
		(!W3 (?P1 AFTER E67.SK))
		(!W4 (?P2 AFTER E67.SK))
		(!W5 (?G1 CAUSE-OF E67.SK))
		(!W6 (E67.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E67.SK (SAME-TIME NOW12)))
		(!W9 (E72.SK (BEFORE NOW12)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 6)
("The dog was thirsty." "The man brought him water."
 "The dog followed the man home." "The man fed him."
 "The dog never left the man's side.")
(EPI-SCHEMA ((DOG60.SK
              ((ADV-A (FROM.P ?L1))
               ((ADV-A (TO.P (K FISHING.N))) FOLLOW.114.V))
              (K FISHING.N))
             ** E67.SK)
	(:ROLES
		(!R1 (DOG60.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K FISHING.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K FISHING.N))))
		(!R5 (DOG60.SK MAN.N))
		(!R6 (SIDE83.SK LIMIT.N))
		(!R7 (SIDE83.SK (PERTAIN-TO DOG60.SK)))
		(!R8 (DOG60.SK DOG.N))
		(!R9 (E67.SK (RIGHT-AFTER U11)))
		(!R10 (MAN64.SK MAN.N))
		(!R11 (SIDE83.SK SIDE.N))
		(!R12 (SIDE83.SK (PERTAIN-TO MAN64.SK)))
	)
	(:GOALS
		(?G1 (DOG60.SK (WANT.V (KA ((ADV-A (AT.P (K FISHING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG60.SK (AT.P ?L1)))
		(?I2 (NOT (DOG60.SK (AT.P (K FISHING.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG60.SK (AT.P ?L1))))
		(?P2 (DOG60.SK (AT.P (K FISHING.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E67.SK))
		(!W2 (?I2 BEFORE E67.SK))
		(!W3 (?P1 AFTER E67.SK))
		(!W4 (?P2 AFTER E67.SK))
		(!W5 (?G1 CAUSE-OF E67.SK))
		(!W6 (E67.SK (SAME-TIME ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E67.SK (SAME-TIME NOW12)))
		(!W9 (E72.SK (BEFORE NOW12)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 7)
("The dog was thirsty." "The man brought him water."
 "The dog followed the man home." "The man fed him."
 "The dog never left the man's side.")
(EPI-SCHEMA ((DOG60.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P MAN64.SK)) FOLLOW.115.V))
              MAN64.SK)
             ** E67.SK)
	(:ROLES
		(!R1 (DOG60.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (MAN64.SK LOCATION.N))
		(!R4 (NOT (?L1 = MAN64.SK)))
		(!R5 (MAN64.SK CAFETERIA.N))
		(!R6 (DOG60.SK MAN.N))
		(!R7 (SIDE83.SK (PERTAIN-TO DOG60.SK)))
		(!R8 (SIDE83.SK LUNCH.N))
		(!R9 (DOG60.SK DOG.N))
		(!R10 (E67.SK (RIGHT-AFTER U11)))
		(!R11 (MAN64.SK MAN.N))
		(!R12 (SIDE83.SK SIDE.N))
		(!R13 (SIDE83.SK (PERTAIN-TO MAN64.SK)))
	)
	(:GOALS
		(?G1 (DOG60.SK (WANT.V (KA ((ADV-A (AT.P MAN64.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG60.SK (AT.P ?L1)))
		(?I2 (NOT (DOG60.SK (AT.P MAN64.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG60.SK (AT.P ?L1))))
		(?P2 (DOG60.SK (AT.P MAN64.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E67.SK))
		(!W2 (?I2 BEFORE E67.SK))
		(!W3 (?P1 AFTER E67.SK))
		(!W4 (?P2 AFTER E67.SK))
		(!W5 (?G1 CAUSE-OF E67.SK))
		(!W6 (E67.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E67.SK (SAME-TIME NOW12)))
		(!W9 (E72.SK (BEFORE NOW12)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 3:
	; "Tom's dog escaped."
	; "Tom asked his friend to help find the dog."
	; "They covered a lot of ground looking."
	; "They never found the dog."
	; "Tom was very upset."
; best schemas are:
; FIND.773.V
; FIND.1038.V
; RUN.179.V
; RUN.179.V
; RUN.401.V
; RUN.929.V
(setf matches (append matches '(( (2.905 0)
("Tom's dog escaped." "Tom asked his friend to help find the dog."
 "They covered a lot of ground looking." "They never found the dog."
 "Tom was very upset.")
(EPI-SCHEMA ((DOG90.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) ESCAPE.119.V))
              ?L2)
             ** E89.SK)
	(:ROLES
		(!R1 (DOG90.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (DOG90.SK DOG.N))
		(!R6 (DOG90.SK FRIEND.N))
		(!R7 (DOG90.SK (PERTAIN-TO TOM.NAME)))
	)
	(:GOALS
		(?G1 (DOG90.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG90.SK (AT.P ?L1)))
		(?I2 (NOT (DOG90.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG90.SK (AT.P ?L1))))
		(?P2 (DOG90.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E89.SK))
		(!W2 (?I2 BEFORE E89.SK))
		(!W3 (?P1 AFTER E89.SK))
		(!W4 (?P2 AFTER E89.SK))
		(!W5 (?G1 CAUSE-OF E89.SK))
		(!W6 (E89.SK (AT-ABOUT ?X_C)))
		(!W7 (E89.SK (BEFORE NOW15)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 0)
("Tom's dog escaped." "Tom asked his friend to help find the dog."
 "They covered a lot of ground looking." "They never found the dog."
 "Tom was very upset.")
(EPI-SCHEMA ((DOG90.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) ESCAPE.119.V))
              ?L2)
             ** E89.SK)
	(:ROLES
		(!R1 (DOG90.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (DOG90.SK DOG.N))
		(!R6 (DOG90.SK FRIEND.N))
		(!R7 (DOG90.SK (PERTAIN-TO TOM.NAME)))
	)
	(:GOALS
		(?G1 (DOG90.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG90.SK (AT.P ?L1)))
		(?I2 (NOT (DOG90.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG90.SK (AT.P ?L1))))
		(?P2 (DOG90.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E89.SK))
		(!W2 (?I2 BEFORE E89.SK))
		(!W3 (?P1 AFTER E89.SK))
		(!W4 (?P2 AFTER E89.SK))
		(!W5 (?G1 CAUSE-OF E89.SK))
		(!W6 (E89.SK (AT-ABOUT ?X_C)))
		(!W7 (E89.SK (BEFORE NOW15)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 3)
("Tom's dog escaped." "Tom asked his friend to help find the dog."
 "They covered a lot of ground looking." "They never found the dog."
 "Tom was very upset.")
(EPI-SCHEMA ((DOG90.SK
              ((ADV-A (FOR.P (KA (GET.V (K HELP.N)))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) ESCAPE.120.V)))
              ?L2)
             ** E89.SK)
	(:ROLES
		(!R1 (DOG90.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (TOM.NAME FEMALE.A))
		(!R6 (TOM.NAME AGENT.N))
		(!R7 (E89.SK (RIGHT-AFTER ?X_A)))
		(!R8 (DOG90.SK GIRL.N))
		(!R9 (DOG90.SK HEAD.N))
		(!R10 (DOG90.SK DOG.N))
		(!R11 (DOG90.SK FRIEND.N))
		(!R12 (DOG90.SK PERSON.N))
		(!R13 (DOG90.SK (PERTAIN-TO TOM.NAME)))
	)
	(:GOALS
		(?G1 (DOG90.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG90.SK (AT.P ?L1)))
		(?I2 (NOT (DOG90.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG90.SK (AT.P ?L1))))
		(?P2 (DOG90.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E89.SK))
		(!W2 (?I2 BEFORE E89.SK))
		(!W3 (?P1 AFTER E89.SK))
		(!W4 (?P2 AFTER E89.SK))
		(!W5 (?G1 CAUSE-OF E89.SK))
		(!W6 (E89.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E89.SK (BEFORE NOW15)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R8 CERTAIN-TO-DEGREE (/ 1 3)))
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
(setf matches (append matches '(( (2.905 1)
("Tom's dog escaped." "Tom asked his friend to help find the dog."
 "They covered a lot of ground looking." "They never found the dog."
 "Tom was very upset.")
(EPI-SCHEMA ((DOG90.SK
              ((ADV-A (THROUGH.P ?X_A))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_C)) ESCAPE.121.V)))
              ?L2)
             ** E89.SK)
	(:ROLES
		(!R1 (DOG90.SK AGENT.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?X_C = ?L2)))
		(!R5 (?X_A PARK.N))
		(!R6 (DOG90.SK (PERTAIN-TO DOG90.SK)))
		(!R7 (?X_C END.N))
		(!R8 (DOG90.SK DOG.N))
		(!R9 (DOG90.SK FRIEND.N))
		(!R10 (DOG90.SK (PERTAIN-TO TOM.NAME)))
	)
	(:GOALS
		(?G1 (DOG90.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG90.SK (AT.P ?X_C)))
		(?I2 (NOT (DOG90.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG90.SK (AT.P ?X_C))))
		(?P2 (DOG90.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E89.SK))
		(!W2 (?I2 BEFORE E89.SK))
		(!W3 (?P1 AFTER E89.SK))
		(!W4 (?P2 AFTER E89.SK))
		(!W5 (?G1 CAUSE-OF E89.SK))
		(!W6 (E89.SK (BEFORE ?X_F)))
		(!W7 (E89.SK (BEFORE NOW15)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 4:
	; "Lucy wanted to play accordion."
	; "She came for her first lesson."
	; "Lucy was very tiny."
	; "She put accordion on her lap."
	; "She felt a big pain in her knees."
discarding schema COME.149.V learned from this story
; best schemas are:
; GO.340.V
; PLAY.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1152.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; PLAY.920.V
(setf matches (append matches '(( (5.0 3)
("Lucy wanted to play accordion." "She came for her first lesson."
 "Lucy was very tiny." "She put accordion on her lap."
 "She felt a big pain in her knees.")
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-A
                (FOR.P
                 (KA ((ADV-A (WITH.P (SET-OF LAP116.SK LUCY.NAME))) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.122.V)))
              ?L2)
             ** E111.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (LAP116.SK (PERTAIN-TO LAP116.SK)))
		(!R6 (?X_B (IMPINGES-ON E111.SK)))
		(!R7 (?X_D DOLL.N))
		(!R8 (?X_D (PERTAIN-TO LUCY.NAME)))
		(!R9 (OBJECT110.SK SPADE.N))
		(!R10 (?X_G (IMPINGES-ON ?X_J)))
		(!R11 (KNEE125.SK (PERTAIN-TO LUCY.NAME)))
		(!R12 (KNEE125.SK (PLUR KNEE.N)))
		(!R13 (OBJECT110.SK (PERTAIN-TO LUCY.NAME)))
		(!R14 (LAP116.SK (PERTAIN-TO LUCY.NAME)))
		(!R15 (LAP116.SK LAP.N))
	)
	(:GOALS
		(E108.SK (LUCY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
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
		(!W1 (?I1 BEFORE E111.SK))
		(!W2 (?I2 BEFORE E111.SK))
		(!W3 (?P1 AFTER E111.SK))
		(!W4 (?P2 AFTER E111.SK))
		(!W5 (E108.SK CAUSE-OF E111.SK))
		(!W6 (E111.SK (AT-ABOUT ?X_K)))
		(!W7 (?X_J (AT-ABOUT ?X_K)))
		(!W8 (E108.SK (BEFORE NOW20)))
		(!W9 (E111.SK (BEFORE NOW21)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.53125 3)
("Lucy wanted to play accordion." "She came for her first lesson."
 "Lucy was very tiny." "She put accordion on her lap."
 "She felt a big pain in her knees.")
(EPI-SCHEMA ((LUCY.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.151.V (KA COME.V)) **
             ?E)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 ((KA COME.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (LUCY.NAME DOG.N))
		(!R5 (OBJECT110.SK (PERTAIN-TO LUCY.NAME)))
		(!R6 (LAP116.SK (PERTAIN-TO LUCY.NAME)))
		(!R7 (LAP116.SK LAP.N))
		(!R8 (KNEE125.SK (PERTAIN-TO LUCY.NAME)))
		(!R9 (KNEE125.SK (PLUR KNEE.N)))
	)
	(:GOALS
		(E108.SK (LUCY.NAME (WANT.V (THAT (NOT (LUCY.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (LUCY.NAME ((ADV-A (FOR.P OBJECT110.SK)) COME.V))) CAUSE-OF
    (KE (LUCY.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E111.SK (LUCY.NAME ((ADV-A (FOR.P OBJECT110.SK)) COME.V)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E108.SK CAUSE-OF E111.SK))
		(!W2 (E111.SK (BEFORE ?X_C)))
		(!W3 (E108.SK (BEFORE NOW20)))
		(!W4 (E111.SK (BEFORE NOW21)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0 3)
("Lucy wanted to play accordion." "She came for her first lesson."
 "Lucy was very tiny." "She put accordion on her lap."
 "She felt a big pain in her knees.")
(EPI-SCHEMA ((LUCY.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.174.V
              (KA
               ((ADV-A
                 (L #:G1091718
                  (AND (#:G1091718 LIKE.P)
                       (#:G1091718 (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
                FEEL.V)))
             ** ?E)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2
   ((KA
     ((ADV-A
       (L #:G1091718
        (AND (?X_A LIKE.P) (?X_B (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
      FEEL.V))
    ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (LUCY.NAME MAN.N))
		(!R5 (?X_K NEW-SALIENT-ENTITY*.N))
		(!R6 (?X_K PRED?.N))
		(!R7 (OBJECT110.SK BREATH.N))
		(!R8 (PAIN124.SK PAIN.N))
		(!R9 (PAIN124.SK BIG.A))
		(!R10 (OBJECT110.SK (PERTAIN-TO LUCY.NAME)))
		(!R11 (LAP116.SK (PERTAIN-TO LUCY.NAME)))
		(!R12 (LAP116.SK LAP.N))
		(!R13 (KNEE125.SK (PERTAIN-TO LUCY.NAME)))
		(!R14 (KNEE125.SK (PLUR KNEE.N)))
	)
	(:GOALS
		(E108.SK (LUCY.NAME (WANT.V (THAT (NOT (LUCY.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE
     (LUCY.NAME
      ((ADV-A
        (L #:G1091718
         (AND (?X_D LIKE.P) (?X_E (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
       FEEL.V)))
    CAUSE-OF (KE (LUCY.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E127.SK
   (LUCY.NAME
    ((ADV-A (IN.P KNEE125.SK))
     ((ADV-A
       (L #:G1091718
        (AND (?X_G LIKE.P) (?X_H (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
      ((ADV-A
        (L #:G1091718
         (AND (?X_I LIKE.P) (?X_J (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
       FEEL.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E108.SK CAUSE-OF E127.SK))
		(!W2 (E127.SK (BEFORE ?X_M)))
		(!W3 (E108.SK (BEFORE NOW20)))
		(!W4 (E127.SK (BEFORE NOW24)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0 3)
("Lucy wanted to play accordion." "She came for her first lesson."
 "Lucy was very tiny." "She put accordion on her lap."
 "She felt a big pain in her knees.")
(EPI-SCHEMA ((LUCY.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.175.V
              (KA
               ((ADV-A
                 (L #:G1091718
                  (AND (#:G1091718 LIKE.P)
                       (#:G1091718 (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
                FEEL.V)))
             ** ?E)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2
   ((KA
     ((ADV-A
       (L #:G1091718
        (AND (?X_A LIKE.P) (?X_B (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
      FEEL.V))
    ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (LUCY.NAME MAN.N))
		(!R5 (?X_K NEW-SALIENT-ENTITY*.N))
		(!R6 (?X_K PRED?.N))
		(!R7 (LAP116.SK BREATH.N))
		(!R8 (PAIN124.SK PAIN.N))
		(!R9 (PAIN124.SK BIG.A))
		(!R10 (LAP116.SK (PERTAIN-TO LUCY.NAME)))
		(!R11 (LAP116.SK LAP.N))
		(!R12 (KNEE125.SK (PERTAIN-TO LUCY.NAME)))
		(!R13 (KNEE125.SK (PLUR KNEE.N)))
		(!R14 (OBJECT110.SK (PERTAIN-TO LUCY.NAME)))
	)
	(:GOALS
		(E108.SK (LUCY.NAME (WANT.V (THAT (NOT (LUCY.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE
     (LUCY.NAME
      ((ADV-A
        (L #:G1091718
         (AND (?X_D LIKE.P) (?X_E (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
       FEEL.V)))
    CAUSE-OF (KE (LUCY.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E127.SK
   (LUCY.NAME
    ((ADV-A (IN.P KNEE125.SK))
     ((ADV-A
       (L #:G1091718
        (AND (?X_G LIKE.P) (?X_H (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
      ((ADV-A
        (L #:G1091718
         (AND (?X_I LIKE.P) (?X_J (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
       FEEL.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E108.SK CAUSE-OF E127.SK))
		(!W2 (E127.SK (BEFORE ?X_M)))
		(!W3 (E108.SK (BEFORE NOW20)))
		(!W4 (E127.SK (BEFORE NOW24)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0 3)
("Lucy wanted to play accordion." "She came for her first lesson."
 "Lucy was very tiny." "She put accordion on her lap."
 "She felt a big pain in her knees.")
(EPI-SCHEMA ((LUCY.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.177.V
              (KA
               ((ADV-A
                 (L #:G1091718
                  (AND (#:G1091718 LIKE.P)
                       (#:G1091718 (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
                FEEL.V)))
             ** ?E)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2
   ((KA
     ((ADV-A
       (L #:G1091718
        (AND (?X_A LIKE.P) (?X_B (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
      FEEL.V))
    ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (LUCY.NAME MAN.N))
		(!R5 (?X_K NEW-SALIENT-ENTITY*.N))
		(!R6 (?X_K PRED?.N))
		(!R7 (KNEE125.SK BREATH.N))
		(!R8 (PAIN124.SK PAIN.N))
		(!R9 (PAIN124.SK BIG.A))
		(!R10 (KNEE125.SK (PLUR KNEE.N)))
		(!R11 (KNEE125.SK (PERTAIN-TO LUCY.NAME)))
		(!R12 (LAP116.SK LAP.N))
		(!R13 (LAP116.SK (PERTAIN-TO LUCY.NAME)))
		(!R14 (OBJECT110.SK (PERTAIN-TO LUCY.NAME)))
	)
	(:GOALS
		(E108.SK (LUCY.NAME (WANT.V (THAT (NOT (LUCY.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE
     (LUCY.NAME
      ((ADV-A
        (L #:G1091718
         (AND (?X_D LIKE.P) (?X_E (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
       FEEL.V)))
    CAUSE-OF (KE (LUCY.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E127.SK
   (LUCY.NAME
    ((ADV-A (IN.P KNEE125.SK))
     ((ADV-A
       (L #:G1091718
        (AND (?X_G LIKE.P) (?X_H (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
      ((ADV-A
        (L #:G1091718
         (AND (?X_I LIKE.P) (?X_J (= (KA ((ADV-A (AFTER.P ?X_K)) RUN.V)))))))
       FEEL.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E108.SK CAUSE-OF E127.SK))
		(!W2 (E127.SK (BEFORE ?X_M)))
		(!W3 (E108.SK (BEFORE NOW20)))
		(!W4 (E127.SK (BEFORE NOW24)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 5:
	; "Joe had run out of dish soap."
	; "So Joe went to the store."
	; "He found the best soap."
	; "Bought the best soap and took it home."
	; "Joe no longer needed soap."
discarding schema RUN.184.V learned from this story
discarding schema FIND.187.V learned from this story
; best schemas are:
; GO.90.V
; GO.591.V
; GO.806.V
; GO.1220.V
(setf matches (append matches '(( (4.0 3)
("Joe had run out of dish soap." "So Joe went to the store."
 "He found the best soap." "Bought the best soap and took it home."
 "Joe no longer needed soap.")
(EPI-SCHEMA ((JOE.NAME
              ((ADV-A OUT.P (OF.P (K ((NN DISH.N) SOAP.N))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P STORE138.SK))
                 ((ADV-A (IN.P (K YESTERDAY.N))) RUN.231.V))))
              STORE138.SK)
             ** E130.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE138.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE138.SK)))
		(!R4 (JOE.NAME AGENT.N))
		(!R5 (E136.SK (IMPINGES-ON E130.SK)))
		(!R6 (STORE138.SK STORE.N))
	)
	(:GOALS
		(?G1 (JOE.NAME (WANT.V (KA ((ADV-A (AT.P STORE138.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JOE.NAME (AT.P ?L1)))
		(?I2 (NOT (JOE.NAME (AT.P STORE138.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JOE.NAME (AT.P ?L1))))
		(?P2 (JOE.NAME (AT.P STORE138.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E130.SK))
		(!W2 (?I2 BEFORE E130.SK))
		(!W3 (?P1 AFTER E130.SK))
		(!W4 (?P2 AFTER E130.SK))
		(!W5 (?G1 CAUSE-OF E130.SK))
		(!W6 (E130.SK (BEFORE ?X_D)))
		(!W7 (E130.SK (BEFORE NOW25)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 5)
("Joe had run out of dish soap." "So Joe went to the store."
 "He found the best soap." "Bought the best soap and took it home."
 "Joe no longer needed soap.")
(EPI-SCHEMA ((JOE.NAME
              ((ADV-A OUT.P (OF.P (K ((NN DISH.N) SOAP.N))))
               ((ADV-A (TO.P STORE138.SK)) ((ADV-A (FROM.P ?L1)) RUN.232.V)))
              STORE138.SK)
             ** E130.SK)
	(:ROLES
		(!R1 (JOE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE138.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE138.SK)))
		(!R5 (JOE.NAME CAT.N))
		(!R6 (JOE.NAME NEW.A))
		(!R7 (STORE138.SK ((NN PET.N) STORE.N)))
		(!R8 (?X_A CAT.N))
		(!R9 (?X_A NICE.A))
		(!R10 (?X_A (PERTAIN-TO JOE.NAME)))
		(!R11 (E136.SK (IMPINGES-ON E130.SK)))
		(!R12 (STORE138.SK STORE.N))
	)
	(:GOALS
		(?G1 (JOE.NAME (WANT.V (KA ((ADV-A (AT.P STORE138.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JOE.NAME (AT.P ?L1)))
		(?I2 (NOT (JOE.NAME (AT.P STORE138.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JOE.NAME (AT.P ?L1))))
		(?P2 (JOE.NAME (AT.P STORE138.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E130.SK))
		(!W2 (?I2 BEFORE E130.SK))
		(!W3 (?P1 AFTER E130.SK))
		(!W4 (?P2 AFTER E130.SK))
		(!W5 (?G1 CAUSE-OF E130.SK))
		(!W6 (E130.SK (BEFORE ?X_E)))
		(!W7 (E130.SK (BEFORE NOW25)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("Joe had run out of dish soap." "So Joe went to the store."
 "He found the best soap." "Bought the best soap and took it home."
 "Joe no longer needed soap.")
(EPI-SCHEMA ((JOE.NAME
              ((ADV-A OUT.P (OF.P (K ((NN DISH.N) SOAP.N))))
               ((ADV-A (TO.P ?X_B)) ((ADV-A (FROM.P ?L1)) RUN.233.V)))
              ?X_B)
             ** E130.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?X_B LOCATION.N))
		(!R3 (NOT (?L1 = ?X_B)))
		(!R4 (?X_B ((NN STORE.N) TODAY.N)))
		(!R5 (JOE.NAME AGENT.N))
		(!R6 (E136.SK (IMPINGES-ON E130.SK)))
	)
	(:GOALS
		(?G1 (JOE.NAME (WANT.V (KA ((ADV-A (AT.P ?X_B)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JOE.NAME (AT.P ?L1)))
		(?I2 (NOT (JOE.NAME (AT.P ?X_B))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JOE.NAME (AT.P ?L1))))
		(?P2 (JOE.NAME (AT.P ?X_B)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E130.SK))
		(!W2 (?I2 BEFORE E130.SK))
		(!W3 (?P1 AFTER E130.SK))
		(!W4 (?P2 AFTER E130.SK))
		(!W5 (?G1 CAUSE-OF E130.SK))
		(!W6 (E130.SK (BEFORE ?X_D)))
		(!W7 (E130.SK (BEFORE NOW25)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 3)
("Joe had run out of dish soap." "So Joe went to the store."
 "He found the best soap." "Bought the best soap and took it home."
 "Joe no longer needed soap.")
(EPI-SCHEMA ((JOE.NAME
              ((ADV-A OUT.P (OF.P (K ((NN DISH.N) SOAP.N))))
               ((ADV-A (TO.P STORE138.SK)) ((ADV-A (FROM.P ?L1)) RUN.234.V)))
              STORE138.SK)
             ** E130.SK)
	(:ROLES
		(!R1 (JOE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE138.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE138.SK)))
		(!R5 (E136.SK (IMPINGES-ON E130.SK)))
		(!R6 (STORE138.SK STORE.N))
	)
	(:GOALS
		(?G1 (JOE.NAME (WANT.V (KA ((ADV-A (AT.P STORE138.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JOE.NAME (AT.P ?L1)))
		(?I2 (NOT (JOE.NAME (AT.P STORE138.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JOE.NAME (AT.P ?L1))))
		(?P2 (JOE.NAME (AT.P STORE138.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E130.SK))
		(!W2 (?I2 BEFORE E130.SK))
		(!W3 (?P1 AFTER E130.SK))
		(!W4 (?P2 AFTER E130.SK))
		(!W5 (?G1 CAUSE-OF E130.SK))
		(!W6 (E130.SK (BEFORE ?X_D)))
		(!W7 (E130.SK (BEFORE NOW25)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 6:
	; "The man turned it on."
	; "It did not respond."
	; "The man unplugged it."
	; "He took it apart."
	; "He could never get that thing to work."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; TAKE.1.V
; TAKE.10.V
; TAKE.135.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.662.V
; TAKE.885.V
(setf matches (append matches '(( (4.227813 5)
("The man turned it on." "It did not respond." "The man unplugged it."
 "He took it apart." "He could never get that thing to work.")
(EPI-SCHEMA ((HE.PRO TAKE.239.V IT.PRO (AT.P-ARG ?L)) ** E181.SK)
	(:ROLES
		(!R1 (IT.PRO INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = IT.PRO)))
		(!R4 (IT.PRO WATCH.N))
		(!R5 (HE.PRO MAN.N))
		(!R6 (IT.PRO (PERTAIN-TO HE.PRO)))
		(!R7 (HE.PRO MALE.A))
		(!R8 (HE.PRO AGENT.N))
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
		(!W1 (?E1 SAME-TIME E181.SK))
		(!W2 (?I1 PRECOND-OF E181.SK))
		(!W3 (?I2 PRECOND-OF E181.SK))
		(!W4 (?I3 PRECOND-OF E181.SK))
		(!W5 (?P1 POSTCOND-OF E181.SK))
		(!W6 (E181.SK (BEFORE ?X_D)))
		(!W7 (E181.SK (BEFORE NOW33)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.227813 5)
("The man turned it on." "It did not respond." "The man unplugged it."
 "He took it apart." "He could never get that thing to work.")
(EPI-SCHEMA ((HE.PRO TAKE.241.V IT.PRO (AT.P-ARG ?X_C)) ** E181.SK)
	(:ROLES
		(!R1 (IT.PRO INANIMATE_OBJECT.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (HE.PRO = IT.PRO)))
		(!R4 (HE.PRO MAN.N))
		(!R5 (MAN160.SK (PERTAIN-TO IT.PRO)))
		(!R6 (MAN160.SK BROTHER.N))
		(!R7 (?X_B (= HE.PRO)))
		(!R8 (?X_B DAY.N))
		(!R9 (?X_C FARM.N))
		(!R10 (HE.PRO MALE.A))
		(!R11 (HE.PRO AGENT.N))
		(!R12 (MAN160.SK MAN.N))
		(!R13 (MAN160.SK PERSON.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V IT.PRO))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V IT.PRO)))
		(?I2 (HE.PRO (AT.P ?X_C)))
		(?I3 (IT.PRO (AT.P ?X_C)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V IT.PRO))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E181.SK))
		(!W2 (?I1 PRECOND-OF E181.SK))
		(!W3 (?I2 PRECOND-OF E181.SK))
		(!W4 (?I3 PRECOND-OF E181.SK))
		(!W5 (?P1 POSTCOND-OF E181.SK))
		(!W6 (E181.SK (BEFORE ?X_G)))
		(!W7 (E181.SK (BEFORE NOW33)))
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
(setf matches (append matches '(( (4.227813 4)
("The man turned it on." "It did not respond." "The man unplugged it."
 "He took it apart." "He could never get that thing to work.")
(EPI-SCHEMA ((HE.PRO ((ADV-A (TO.P ?X_A)) TAKE.243.V) IT.PRO (AT.P-ARG ?L)) **
             E181.SK)
	(:ROLES
		(!R1 (IT.PRO INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = IT.PRO)))
		(!R4 (?X_A VET.N))
		(!R5 (IT.PRO CAT.N))
		(!R6 (HE.PRO MAN.N))
		(!R7 (HE.PRO MALE.A))
		(!R8 (HE.PRO AGENT.N))
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
		(!W1 (?E1 SAME-TIME E181.SK))
		(!W2 (?I1 PRECOND-OF E181.SK))
		(!W3 (?I2 PRECOND-OF E181.SK))
		(!W4 (?I3 PRECOND-OF E181.SK))
		(!W5 (?P1 POSTCOND-OF E181.SK))
		(!W6 (E181.SK (BEFORE ?X_E)))
		(!W7 (E181.SK (BEFORE NOW33)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 7:
	; "The dog went outside in the yard."
	; "There was something new in the yard."
	; "The dog sniffed it."
	; "The dog went inside it and slept."
	; "The dog liked its new dog house."
discarding schema GO.194.V learned from this story
; best schemas are:
; GO.1040.V
; GO.495.V
; GET.826.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1152.V
; FOLLOW.69.V
(setf matches (append matches '(( (2.905 0)
("The dog went outside in the yard." "There was something new in the yard."
 "The dog sniffed it." "The dog went inside it and slept."
 "The dog liked its new dog house.")
(EPI-SCHEMA ((DOG185.SK
              ((ADV-A (IN.P YARD187.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) (OUTSIDE.ADV GO.244.V))))
              ?L2)
             ** E184.SK)
	(:ROLES
		(!R1 (DOG185.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (YARD187.SK YARD.N))
		(!R6 (DOG185.SK DOG.N))
		(!R7 (E184.SK (RIGHT-AFTER U34)))
		(!R8 (OBJECT204.SK (PERTAIN-TO DOG185.SK)))
	)
	(:GOALS
		(?G1 (DOG185.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG185.SK (AT.P ?L1)))
		(?I2 (NOT (DOG185.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG185.SK (AT.P ?L1))))
		(?P2 (DOG185.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E184.SK))
		(!W2 (?I2 BEFORE E184.SK))
		(!W3 (?P1 AFTER E184.SK))
		(!W4 (?P2 AFTER E184.SK))
		(!W5 (?G1 CAUSE-OF E184.SK))
		(!W6 (E184.SK (BEFORE ?X_C)))
		(!W7 (E184.SK (SAME-TIME NOW35)))
		(!W8 (E188.SK (BEFORE NOW35)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.405 3)
("The dog went outside in the yard." "There was something new in the yard."
 "The dog sniffed it." "The dog went inside it and slept."
 "The dog liked its new dog house.")
(EPI-SCHEMA ((DOG185.SK
              ((ADV-A (IN.P YARD187.SK))
               (OUTSIDE.ADV
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.245.V))))
              ?L2)
             ** E184.SK)
	(:ROLES
		(!R1 (DOG185.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (YARD187.SK RAIN.N))
		(!R6 (OBJECT204.SK (PLUR BOOT.N)))
		(!R7 (YARD187.SK (PERTAIN-TO DOG185.SK)))
		(!R8 (E184.SK (RIGHT-AFTER U34)))
		(!R9 (YARD187.SK YARD.N))
		(!R10 (DOG185.SK DOG.N))
		(!R11 (OBJECT204.SK (PERTAIN-TO DOG185.SK)))
	)
	(:GOALS
		(?G1 (DOG185.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG185.SK (AT.P ?L1)))
		(?I2 (NOT (DOG185.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG185.SK (AT.P ?L1))))
		(?P2 (DOG185.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E184.SK))
		(!W2 (?I2 BEFORE E184.SK))
		(!W3 (?P1 AFTER E184.SK))
		(!W4 (?P2 AFTER E184.SK))
		(!W5 (?G1 CAUSE-OF E184.SK))
		(!W6 (E184.SK (BEFORE ?X_F)))
		(!W7 (E184.SK (SAME-TIME NOW35)))
		(!W8 (E188.SK (BEFORE NOW35)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (0.93625 1)
("The dog went outside in the yard." "There was something new in the yard."
 "The dog sniffed it." "The dog went inside it and slept."
 "The dog liked its new dog house.")
(EPI-SCHEMA ((DOG185.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.248.V (KA COME.V)) **
             ?E)
	(:ROLES
		(!R1 (DOG185.SK AGENT.N))
		(!R2 ((KA COME.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (YARD187.SK YARD.N))
		(!R5 (DOG185.SK DOG.N))
		(!R6 (E184.SK (RIGHT-AFTER U34)))
		(!R7 (OBJECT204.SK (PERTAIN-TO DOG185.SK)))
	)
	(:GOALS
		(?G1 (DOG185.SK (WANT.V (THAT (NOT (DOG185.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (DOG185.SK ((ADV-A (IN.P YARD187.SK)) (OUTSIDE.ADV COME.V)))) CAUSE-OF
    (KE (DOG185.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E184.SK (DOG185.SK ((ADV-A (IN.P YARD187.SK)) (OUTSIDE.ADV COME.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E184.SK))
		(!W2 (E184.SK (BEFORE ?X_C)))
		(!W3 (E184.SK (SAME-TIME NOW35)))
		(!W4 (E188.SK (BEFORE NOW35)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (0.93625 1)
("The dog went outside in the yard." "There was something new in the yard."
 "The dog sniffed it." "The dog went inside it and slept."
 "The dog liked its new dog house.")
(EPI-SCHEMA ((DOG185.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.249.V (KA COME.V)) **
             ?E)
	(:ROLES
		(!R1 (DOG185.SK AGENT.N))
		(!R2 ((KA COME.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (DOG185.SK DOG.N))
		(!R5 (YARD187.SK YARD.N))
		(!R6 (OBJECT204.SK (PERTAIN-TO DOG185.SK)))
		(!R7 (E184.SK (RIGHT-AFTER U34)))
	)
	(:GOALS
		(?G1 (DOG185.SK (WANT.V (THAT (NOT (DOG185.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (DOG185.SK ((ADV-A (IN.P YARD187.SK)) (OUTSIDE.ADV COME.V)))) CAUSE-OF
    (KE (DOG185.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E188.SK (DOG185.SK ((ADV-A (IN.P YARD187.SK)) (OUTSIDE.ADV COME.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E188.SK))
		(!W2 (E188.SK (BEFORE ?X_C)))
		(!W3 (E188.SK (BEFORE NOW35)))
		(!W4 (E184.SK (SAME-TIME NOW35)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.9049997 5)
("The dog went outside in the yard." "There was something new in the yard."
 "The dog sniffed it." "The dog went inside it and slept."
 "The dog liked its new dog house.")
(EPI-SCHEMA ((DOG185.SK
              ((ADV-A (IN.P YARD187.SK))
               (OUTSIDE.ADV
                ((ADV-A (TO.P DOG185.SK))
                 ((ADV-A (FROM.P ?L1)) FOLLOW.253.V))))
              DOG185.SK)
             ** E184.SK)
	(:ROLES
		(!R1 (DOG185.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (DOG185.SK LOCATION.N))
		(!R4 (NOT (?L1 = DOG185.SK)))
		(!R5 (DOG185.SK MAN.N))
		(!R6 (OBJECT204.SK SIDE.N))
		(!R7 (YARD187.SK YARD.N))
		(!R8 (E184.SK (RIGHT-AFTER U34)))
		(!R9 (DOG185.SK DOG.N))
		(!R10 (OBJECT204.SK (PERTAIN-TO DOG185.SK)))
	)
	(:GOALS
		(?G1 (DOG185.SK (WANT.V (KA ((ADV-A (AT.P DOG185.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG185.SK (AT.P ?L1)))
		(?I2 (NOT (DOG185.SK (AT.P DOG185.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (DOG185.SK (AT.P ?L1))))
		(?P2 (DOG185.SK (AT.P DOG185.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E184.SK))
		(!W2 (?I2 BEFORE E184.SK))
		(!W3 (?P1 AFTER E184.SK))
		(!W4 (?P2 AFTER E184.SK))
		(!W5 (?G1 CAUSE-OF E184.SK))
		(!W6 (E184.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E184.SK (SAME-TIME NOW35)))
		(!W9 (E188.SK (BEFORE NOW35)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 8:
	; "The man filled up his backpack."
	; "He tried it on."
	; "It felt too heavy."
	; "He took the backpack off."
	; "He took some of the stuff out of the backpack."
discarding schema TAKE.199.V learned from this story
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; FIND.773.V
; TAKE.1.V
; TAKE.10.V
; TAKE.135.V
(setf matches (append matches '(( (4.368926 4)
("The man filled up his backpack." "He tried it on." "It felt too heavy."
 "He took the backpack off." "He took some of the stuff out of the backpack.")
(EPI-SCHEMA ((HE.PRO TAKE.287.V BACKPACK219.SK (AT.P-ARG ?L)) ** E220.SK)
	(:ROLES
		(!R1 (BACKPACK219.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = BACKPACK219.SK)))
		(!R4 (BACKPACK219.SK WATCH.N))
		(!R5 (HE.PRO MAN.N))
		(!R6 (BACKPACK219.SK (PERTAIN-TO HE.PRO)))
		(!R7 (HE.PRO MALE.A))
		(!R8 (HE.PRO AGENT.N))
		(!R9 (BACKPACK219.SK BACKPACK.N))
		(!R10 (BACKPACK219.SK INSTRUMENTALITY.N))
		(!R11 (MAN209.SK (PERTAIN-TO HE.PRO)))
		(!R12 (MAN209.SK BACKPACK.N))
		(!R13 (MAN209.SK MAN.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V BACKPACK219.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V BACKPACK219.SK)))
		(?I2 (HE.PRO (AT.P ?L)))
		(?I3 (BACKPACK219.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V BACKPACK219.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E220.SK))
		(!W2 (?I1 PRECOND-OF E220.SK))
		(!W3 (?I2 PRECOND-OF E220.SK))
		(!W4 (?I3 PRECOND-OF E220.SK))
		(!W5 (?P1 POSTCOND-OF E220.SK))
		(!W6 (E220.SK (BEFORE ?X_D)))
		(!W7 (E220.SK (BEFORE NOW43)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.368926 4)
("The man filled up his backpack." "He tried it on." "It felt too heavy."
 "He took the backpack off." "He took some of the stuff out of the backpack.")
(EPI-SCHEMA ((HE.PRO TAKE.289.V BACKPACK219.SK (AT.P-ARG ?X_C)) ** E220.SK)
	(:ROLES
		(!R1 (BACKPACK219.SK INANIMATE_OBJECT.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (HE.PRO = BACKPACK219.SK)))
		(!R4 (HE.PRO MAN.N))
		(!R5 (MAN209.SK (PERTAIN-TO BACKPACK219.SK)))
		(!R6 (MAN209.SK BROTHER.N))
		(!R7 (?X_B (= HE.PRO)))
		(!R8 (?X_B DAY.N))
		(!R9 (?X_C FARM.N))
		(!R10 (BACKPACK219.SK BACKPACK.N))
		(!R11 (MAN209.SK BACKPACK.N))
		(!R12 (MAN209.SK MAN.N))
		(!R13 (MAN209.SK PERSON.N))
		(!R14 (MAN209.SK (PERTAIN-TO HE.PRO)))
		(!R15 (HE.PRO MALE.A))
		(!R16 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V BACKPACK219.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V BACKPACK219.SK)))
		(?I2 (HE.PRO (AT.P ?X_C)))
		(?I3 (BACKPACK219.SK (AT.P ?X_C)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V BACKPACK219.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E220.SK))
		(!W2 (?I1 PRECOND-OF E220.SK))
		(!W3 (?I2 PRECOND-OF E220.SK))
		(!W4 (?I3 PRECOND-OF E220.SK))
		(!W5 (?P1 POSTCOND-OF E220.SK))
		(!W6 (E220.SK (BEFORE ?X_G)))
		(!W7 (E220.SK (BEFORE NOW43)))
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

; story 9:
	; "I live on a bay."
	; "One day I went swimming."
	; "I saw a dark shadow in the water."
	; "It was a few feet long."
	; "I hope it was not an alligator."
; best schemas are:
; GO.504.V
; FLY.235.V
; COME.605.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; TAKE.135.V

; story 10:
	; "I had a great time."
	; "There were plenty of people there."
	; "I had to find skates that fit."
	; "It was cold inside."
	; "This was at the ice rink."
; best schemas are:
; RUN.229.V
; FLY.235.V
; TAKE.413.V
; GO.1083.V
; GO_GET_NIL.677.PR
; GIVE.194.V

; story 11:
	; "Ben's dog Skip was very old."
	; "One day Skip got sick."
	; "Ben took Skip to the vet."
	; "The vet told ben that it was Skip's time."
	; "Ben sadly put Skip down."
; best schemas are:
; TAKE.885.V

; story 12:
	; "Tom loved fast boats."
	; "He got into racing."
	; "It was pretty dangerous."
	; "Tom flipped his boat once."
	; "He gave up racing after that."
discarding schema GET.234.V learned from this story
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; GET.672.V
; GET.324.V
; GO_GET_NIL.677.PR
(setf matches (append matches '(( (4.5 3)
("Tom loved fast boats." "He got into racing." "It was pretty dangerous."
 "Tom flipped his boat once." "He gave up racing after that.")
(EPI-SCHEMA ((TOM.NAME ((ADV-A (INTO.P (K (PLUR RACING.N)))) GET.343.V)
              NEW-SALIENT-ENTITY*289.SK (AT.P-ARG ?L))
             ** E278.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (NEW-SALIENT-ENTITY*289.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = NEW-SALIENT-ENTITY*289.SK)))
		(!R5 (?X_A PHONE.N))
		(!R6 (?X_B (AT-OR-BEFORE ?X_J)))
		(!R7 (BOAT283.SK (PERTAIN-TO TOM.NAME)))
		(!R8 (BOAT283.SK BOAT.N))
		(!R9 (NEW-SALIENT-ENTITY*289.SK NEW-SALIENT-ENTITY*.N))
		(!R10 (NEW-SALIENT-ENTITY*289.SK PRED?.N))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V NEW-SALIENT-ENTITY*289.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V NEW-SALIENT-ENTITY*289.SK)))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 (NEW-SALIENT-ENTITY*289.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (TOM.NAME HAVE.V NEW-SALIENT-ENTITY*289.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E278.SK))
		(!W2 (?I1 PRECOND-OF E278.SK))
		(!W3 (?I2 PRECOND-OF E278.SK))
		(!W4 (?I3 PRECOND-OF E278.SK))
		(!W5 (?P1 POSTCOND-OF E278.SK))
		(!W6 (?G1 (BEFORE ?X_F)))
		(!W7 (?X_H (CONSEC E278.SK)))
		(!W8 (E278.SK (DURING ?X_I)))
		(!W9 (?X_H (DURING ?X_I)))
		(!W10 (?X_I (BEFORE ?X_J)))
		(!W11 (E278.SK (BEFORE NOW61)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.5 1)
("Tom loved fast boats." "He got into racing." "It was pretty dangerous."
 "Tom flipped his boat once." "He gave up racing after that.")
(EPI-SCHEMA ((TOM.NAME GO_GET_NIL.345.PR ?L NEW-SALIENT-ENTITY*289.SK) ** ?E)
	(:ROLES
		(!R1 (NEW-SALIENT-ENTITY*289.SK INANIMATE_OBJECT.N))
		(!R2 (NOT (TOM.NAME = NEW-SALIENT-ENTITY*289.SK)))
		(!R3 (TOM.NAME AGENT.N))
		(!R4 (BOAT283.SK (PERTAIN-TO TOM.NAME)))
		(!R5 (BOAT283.SK BOAT.N))
		(!R6 (NEW-SALIENT-ENTITY*289.SK NEW-SALIENT-ENTITY*.N))
		(!R7 (NEW-SALIENT-ENTITY*289.SK PRED?.N))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1_2)))
		(?I2 (NOT (TOM.NAME (AT.P ?L))))
	)
	(:STEPS
		(?E1 (TOM.NAME ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L)) GO.673.V)) ?L))
		(E278.SK
   (TOM.NAME ((ADV-A (INTO.P (K (PLUR RACING.N)))) GET.672.V)
    NEW-SALIENT-ENTITY*289.SK (AT.P-ARG ?L2)))
	)
	(:POSTCONDS
		(?P1 (TOM.NAME HAVE.V NEW-SALIENT-ENTITY*289.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE E278.SK))
		(!W2 (E278.SK (BEFORE NOW61)))
	)
)
))))

; story 13:
	; "Allie felt not so good last night."
	; "She ate too much."
	; "So she had to sleep it off."
	; "Then she woke up."
	; "She felt so much better."
; best schemas are:

; story 14:
	; "John asked Tom to be his best man."
	; "They met in grade school."
	; "They spent the rest of their school years together."
	; "They were always together."
	; "They are best friends."
; best schemas are:
; FLY.235.V
; GIVE.194.V
; TAKE.413.V
; RUN.28.V
; RUN.229.V
; RUN.254.V

; story 15:
	; "I had to take graduation pictures."
	; "I went to a studio."
	; "They gave me a jacket."
	; "They took two pictures."
	; "One of them is on my wall."
discarding schema GIVE.241.V learned from this story
discarding schema GO.240.V learned from this story
; best schemas are:
; GIVE.194.V
; FLY.235.V
; GO.591.V
; GO.658.V
(setf matches (append matches '(( (5.558931 3)
("I had to take graduation pictures." "I went to a studio."
 "They gave me a jacket." "They took two pictures."
 "One of them is on my wall.")
(EPI-SCHEMA ((THEY339.SK ((ADV-A (TO.P ME338.SK)) GIVE.356.V) ME338.SK
              JACKET329.SK)
             ** E330.SK)
	(:ROLES
		(!R1 (JACKET329.SK INANIMATE_OBJECT.N))
		(!R2 (THEY339.SK CAT.N))
		(!R3 (?X_A OWNER.N))
		(!R4 (ME338.SK MOUSE.N))
		(!R5 (E330.SK (RIGHT-AFTER ?X_B)))
		(!R6 (ME338.SK AGENT.N))
		(!R7 (JACKET329.SK JACKET.N))
		(!R8 (THEY339.SK AGENT.N))
		(!R9 (PRED?336.SK PRED?.N))
		(!R10 (PRED?336.SK (OF.P THEY339.SK)))
		(!R11 (WALL337.SK WALL.N))
		(!R12 (WALL337.SK (PERTAIN-TO ME338.SK)))
	)
	(:GOALS
		(?G1 (THEY339.SK (WANT.V (THAT (ME338.SK (HAVE.V JACKET329.SK))))))
	)
	(:PRECONDS
		(?I1 (THEY339.SK HAVE.V JACKET329.SK))
		(?I2 (NOT (ME338.SK HAVE.V JACKET329.SK)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (THEY339.SK HAVE.V JACKET329.SK)))
		(?P2 (ME338.SK HAVE.V JACKET329.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E330.SK (SAME-TIME ?X_G)))
		(!W2 (?X_F (BEFORE ?X_G)))
		(!W3 (E330.SK (BEFORE NOW77)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.37875 2)
("I had to take graduation pictures." "I went to a studio."
 "They gave me a jacket." "They took two pictures."
 "One of them is on my wall.")
(EPI-SCHEMA ((ME338.SK
              (AWAY.ADV
               ((ADV-A (TO.P STUDIO326.SK)) ((ADV-A (FROM.P ?L1)) FLY.357.V)))
              STUDIO326.SK)
             ** E327.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STUDIO326.SK LOCATION.N))
		(!R3 (NOT (?L1 = STUDIO326.SK)))
		(!R4 (ME338.SK ((NN MOTHER.N) BIRD.N)))
		(!R5 (ME338.SK BIRD.N))
		(!R6 (ME338.SK ((NN BABY.N) BIRD.N)))
		(!R7 (ME338.SK AGENT.N))
		(!R8 (STUDIO326.SK STUDIO.N))
		(!R9 (WALL337.SK WALL.N))
		(!R10 (WALL337.SK (PERTAIN-TO ME338.SK)))
	)
	(:GOALS
		(?G1 (ME338.SK (WANT.V (KA ((ADV-A (AT.P STUDIO326.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME338.SK (AT.P ?L1)))
		(?I2 (NOT (ME338.SK (AT.P STUDIO326.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME338.SK (AT.P ?L1))))
		(?P2 (ME338.SK (AT.P STUDIO326.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E327.SK))
		(!W2 (?I2 BEFORE E327.SK))
		(!W3 (?P1 AFTER E327.SK))
		(!W4 (?P2 AFTER E327.SK))
		(!W5 (?G1 CAUSE-OF E327.SK))
		(!W6 (E327.SK (BEFORE ?X_C)))
		(!W7 (E327.SK (BEFORE NOW76)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4231253 6)
("I had to take graduation pictures." "I went to a studio."
 "They gave me a jacket." "They took two pictures."
 "One of them is on my wall.")
(EPI-SCHEMA ((ME338.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STUDIO326.SK)) GO.358.V))
              STUDIO326.SK)
             ** E327.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STUDIO326.SK LOCATION.N))
		(!R3 (NOT (?L1 = STUDIO326.SK)))
		(!R4 (ME338.SK CAT.N))
		(!R5 (ME338.SK NEW.A))
		(!R6 (STUDIO326.SK ((NN PET.N) STORE.N)))
		(!R7 (WALL337.SK CAT.N))
		(!R8 (WALL337.SK NICE.A))
		(!R9 (STUDIO326.SK STUDIO.N))
		(!R10 (ME338.SK AGENT.N))
		(!R11 (WALL337.SK WALL.N))
		(!R12 (WALL337.SK (PERTAIN-TO ME338.SK)))
	)
	(:GOALS
		(?G1 (ME338.SK (WANT.V (KA ((ADV-A (AT.P STUDIO326.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME338.SK (AT.P ?L1)))
		(?I2 (NOT (ME338.SK (AT.P STUDIO326.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME338.SK (AT.P ?L1))))
		(?P2 (ME338.SK (AT.P STUDIO326.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E327.SK))
		(!W2 (?I2 BEFORE E327.SK))
		(!W3 (?P1 AFTER E327.SK))
		(!W4 (?P2 AFTER E327.SK))
		(!W5 (?G1 CAUSE-OF E327.SK))
		(!W6 (E327.SK (BEFORE ?X_E)))
		(!W7 (E327.SK (BEFORE NOW76)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4231253 4)
("I had to take graduation pictures." "I went to a studio."
 "They gave me a jacket." "They took two pictures."
 "One of them is on my wall.")
(EPI-SCHEMA ((ME338.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P WALL337.SK)) PLAY.V))))
               ((ADV-A (TO.P STUDIO326.SK)) ((ADV-A (FROM.P ?L1)) GO.359.V)))
              STUDIO326.SK)
             ** E327.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STUDIO326.SK LOCATION.N))
		(!R3 (NOT (?L1 = STUDIO326.SK)))
		(!R4 (WALL337.SK (PLUR FRIEND.N)))
		(!R5 (WALL337.SK HOME.N))
		(!R6 (ME338.SK GIRL.N))
		(!R7 (STUDIO326.SK STUDIO.N))
		(!R8 (ME338.SK AGENT.N))
		(!R9 (WALL337.SK WALL.N))
		(!R10 (WALL337.SK (PERTAIN-TO ME338.SK)))
	)
	(:GOALS
		(?G1 (ME338.SK (WANT.V (KA ((ADV-A (AT.P STUDIO326.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME338.SK (AT.P ?L1)))
		(?I2 (NOT (ME338.SK (AT.P STUDIO326.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME338.SK (AT.P ?L1))))
		(?P2 (ME338.SK (AT.P STUDIO326.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E327.SK))
		(!W2 (?I2 BEFORE E327.SK))
		(!W3 (?P1 AFTER E327.SK))
		(!W4 (?P2 AFTER E327.SK))
		(!W5 (?G1 CAUSE-OF E327.SK))
		(!W6 (E327.SK (BEFORE ?X_E)))
		(!W7 (E327.SK (BEFORE NOW76)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 16:
	; "I was walking down the street."
	; "I saw this guy hanging out."
	; "I noticed he had a watch."
	; "I asked him the time."
	; "He told me it was 5:11."
; best schemas are:
; RUN.229.V
; GIVE.194.V
; TAKE.885.V
; GO.591.V
; GO.1083.V
; TAKE.1.V
(setf matches (append matches '(( (3.1328125 3)
("I was walking down the street." "I saw this guy hanging out."
 "I noticed he had a watch." "I asked him the time." "He told me it was 5:11.")
(EPI-SCHEMA ((ME359.SK
              ((ADV-A (DOWN.P STREET342.SK))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) WALK.369.V)))
              ?X_C)
             ** E341.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (?L1 = ?X_C)))
		(!R4 (ME359.SK CAT.N))
		(!R5 (ME359.SK NEW.A))
		(!R6 (?X_C ((NN PET.N) STORE.N)))
		(!R7 (GUY345.SK CAT.N))
		(!R8 (GUY345.SK NICE.A))
		(!R9 (GUY345.SK (PERTAIN-TO ME359.SK)))
		(!R10 (STREET342.SK STREET.N))
		(!R11 (ME359.SK AGENT.N))
		(!R12 (GUY345.SK GUY.N))
		(!R13 (GUY345.SK (ATTENDED-TO-BY*.A SPEAKER)))
	)
	(:GOALS
		(?G1 (ME359.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME359.SK (AT.P ?L1)))
		(?I2 (NOT (ME359.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME359.SK (AT.P ?L1))))
		(?P2 (ME359.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E341.SK))
		(!W2 (?I2 BEFORE E341.SK))
		(!W3 (?P1 AFTER E341.SK))
		(!W4 (?P2 AFTER E341.SK))
		(!W5 (?G1 CAUSE-OF E341.SK))
		(!W6 (E341.SK (BEFORE ?X_E)))
		(!W7 (E341.SK (BEFORE NOW80)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.7278125 2)
("I was walking down the street." "I saw this guy hanging out."
 "I noticed he had a watch." "I asked him the time." "He told me it was 5:11.")
(EPI-SCHEMA ((ME359.SK
              ((ADV-A (DOWN.P STREET342.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_A)) LOOK.V))))
                  WALK.370.V))))
              ?L2)
             ** E341.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (?X_A (PLUR CLOTHE.N)))
		(!R5 (ME359.SK MAN.N))
		(!R6 (GUY345.SK (PERTAIN-TO ME359.SK)))
		(!R7 (GUY345.SK WIFE.N))
		(!R8 (STREET342.SK STREET.N))
		(!R9 (ME359.SK AGENT.N))
		(!R10 (GUY345.SK GUY.N))
		(!R11 (GUY345.SK PERSON.N))
		(!R12 (GUY345.SK (ATTENDED-TO-BY*.A SPEAKER)))
	)
	(:GOALS
		(?G1 (ME359.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME359.SK (AT.P ?L1)))
		(?I2 (NOT (ME359.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME359.SK (AT.P ?L1))))
		(?P2 (ME359.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E341.SK))
		(!W2 (?I2 BEFORE E341.SK))
		(!W3 (?P1 AFTER E341.SK))
		(!W4 (?P2 AFTER E341.SK))
		(!W5 (?G1 CAUSE-OF E341.SK))
		(!W6 (E341.SK (BEFORE ?X_E)))
		(!W7 (E341.SK (BEFORE NOW80)))
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

; story 17:
	; "A homeless man was on the street."
	; "He asked for help."
	; "Tina gave him a helping hand."
	; "He was so thankful."
	; "They both felt really good."
discarding schema FEED.288.V learned from this story
; best schemas are:
; FIND.888.V
; THANK.603.V
; SIT.49.V
; FEED.343.V
; FEED.351.V

; story 18:
	; "I went to Texas last week."
	; "It was very fun."
	; "We had bbq food."
	; "It tasted very good."
	; "I wanted to go back."
; best schemas are:
; FLY.235.V
; FEED.660.V
; GO_FIND_EAT.566.PR
; GO.591.V
; GO.658.V
; GO.1083.V

; story 19:
	; "Lucy was playing with her doll."
	; "All of the sudden her brother took it."
	; "Lucy started to cry."
	; "She asked for it back."
	; "Lucy needed it back right away."
discarding schema PLAY.301.V learned from this story
discarding schema PLAY.303.V learned from this story
; best schemas are:
; GO.340.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V
; TAKE.135.V
; TAKE.22.V
; error processing story
; story 20:
	; "Lewis didn't do his homework."
	; "He had to go to summer school."
	; "He liked the teacher."
	; "They became good friends."
	; "Lewis learned a lot at summer school."
discarding schema AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V learned from this story
; best schemas are:
; RUN.401.V
; COME.239.V
; GO.642.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TAKE.928.V

; story 21:
	; "I had some wine a while ago."
	; "I wanted to like it."
	; "But it tasted so bad."
	; "I wanted to vomit."
	; "I never wanted to drink again."
; best schemas are:
; FLY.235.V
; GIVE.194.V
; TAKE.413.V
; FEED.660.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V

; story 22:
	; "Clare found the letter."
	; "She opened it up."
	; "Inside was a small note."
	; "She threw the note away."
	; "She kept the envelope to use."
discarding schema FIND.333.V learned from this story
; best schemas are:
; SIT.211.V
; SIT.505.V
; SIT.49.V
; SIT.65.V
; SIT.274.V

; story 23:
	; "The cat strolled through the house."
	; "It found something funny."
	; "There was a pink ball on the floor."
	; "The cat swatted the ball."
	; "The cat liked playing with the ball."
discarding schema STROLL.340.V learned from this story
; best schemas are:
; PLAY.990.V
; PLAY.991.V
; SIT.65.V
; PLAY.670.V
; WALK.989.V
(setf matches (append matches '(( (3.405 1)
("The cat strolled through the house." "It found something funny."
 "There was a pink ball on the floor." "The cat swatted the ball."
 "The cat liked playing with the ball.")
(EPI-SCHEMA ((CAT444.SK
              ((ADV-A (THROUGH.P HOUSE446.SK))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (INTO.P FLOOR451.SK)) STROLL.462.V))))
              ?L2)
             ** E443.SK)
	(:ROLES
		(!R1 (CAT444.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FLOOR451.SK ((NN LIVING.N) ROOM.N)))
		(!R6 (HOUSE446.SK HOUSE.N))
		(!R7 (CAT444.SK CAT.N))
		(!R8 (E443.SK (RIGHT-AFTER U114)))
		(!R9 (FLOOR451.SK FLOOR.N))
		(!R10 (OBJECT450.SK (ON.P FLOOR451.SK)))
	)
	(:GOALS
		(?G1 (CAT444.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT444.SK (AT.P ?L1)))
		(?I2 (NOT (CAT444.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CAT444.SK (AT.P ?L1))))
		(?P2 (CAT444.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E443.SK))
		(!W2 (?I2 BEFORE E443.SK))
		(!W3 (?P1 AFTER E443.SK))
		(!W4 (?P2 AFTER E443.SK))
		(!W5 (?G1 CAUSE-OF E443.SK))
		(!W6 (E443.SK (SAME-TIME ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E443.SK (SAME-TIME NOW115)))
		(!W9 (E447.SK (BEFORE NOW115)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 24:
	; "Fred loved fishing."
	; "He loved going with his friends."
	; "Fred went to the local pond yesterday."
	; "He caught a large fish."
	; "He brought it back to eat it."
; best schemas are:
; RUN.254.V
; GET.1260.V
; GO.658.V
; TAKE.413.V
; COME.126.V
; COME.605.V
(setf matches (append matches '(( (3.905 5)
("Fred loved fishing." "He loved going with his friends."
 "Fred went to the local pond yesterday." "He caught a large fish."
 "He brought it back to eat it.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P OBJECT474.SK))
                 ((ADV-A (FOR.P (KA (CATCH.V FISH481.SK)))) RUN.463.V))))
              OBJECT474.SK)
             ** E475.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (OBJECT474.SK LOCATION.N))
		(!R4 (NOT (?L1 = OBJECT474.SK)))
		(!R5 (FRED.NAME CAT.N))
		(!R6 (FISH481.SK RAT.N))
		(!R7 (FISH481.SK BIG.A))
		(!R8 (FISH481.SK FISH.N))
		(!R9 (FISH481.SK VERTEBRATE.N))
		(!R10 (FISH481.SK LARGE.A))
	)
	(:GOALS
		(?G1 (FRED.NAME (WANT.V (KA ((ADV-A (AT.P OBJECT474.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P OBJECT474.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRED.NAME (AT.P ?L1))))
		(?P2 (FRED.NAME (AT.P OBJECT474.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E475.SK))
		(!W2 (?I2 BEFORE E475.SK))
		(!W3 (?P1 AFTER E475.SK))
		(!W4 (?P2 AFTER E475.SK))
		(!W5 (?G1 CAUSE-OF E475.SK))
		(!W6 (?X_D (CONSEC E475.SK)))
		(!W7 (E475.SK (BEFORE ?X_E)))
		(!W8 (?X_D (BEFORE ?X_E)))
		(!W9 (E475.SK (BEFORE NOW122)))
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
(setf matches (append matches '(( (4.5 6)
("Fred loved fishing." "He loved going with his friends."
 "Fred went to the local pond yesterday." "He caught a large fish."
 "He brought it back to eat it.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P OBJECT474.SK))
                 ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FRIEND472.SK)) PLAY.V))))
                  GO.472.V))))
              OBJECT474.SK)
             ** E475.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (OBJECT474.SK LOCATION.N))
		(!R4 (NOT (?L1 = OBJECT474.SK)))
		(!R5 (FRIEND472.SK HOME.N))
		(!R6 (FRIEND472.SK (PERTAIN-TO FRED.NAME)))
		(!R7 (FRED.NAME GIRL.N))
		(!R8 (FRIEND472.SK (PLUR FRIEND.N)))
		(!R9 (FRIEND472.SK (PERTAIN-TO HE483.SK)))
		(!R10 (HE483.SK AGENT.N))
	)
	(:GOALS
		(?G1 (FRED.NAME (WANT.V (KA ((ADV-A (AT.P OBJECT474.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P OBJECT474.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRED.NAME (AT.P ?L1))))
		(?P2 (FRED.NAME (AT.P OBJECT474.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E475.SK))
		(!W2 (?I2 BEFORE E475.SK))
		(!W3 (?P1 AFTER E475.SK))
		(!W4 (?P2 AFTER E475.SK))
		(!W5 (?G1 CAUSE-OF E475.SK))
		(!W6 (E475.SK (BEFORE ?X_E)))
		(!W7 (E475.SK (BEFORE NOW122)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 8)
("Fred loved fishing." "He loved going with his friends."
 "Fred went to the local pond yesterday." "He caught a large fish."
 "He brought it back to eat it.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P OBJECT474.SK))
                 ((ADV-A (BY.P ?X_A)) COME.486.V))))
              OBJECT474.SK)
             ** E475.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (OBJECT474.SK LOCATION.N))
		(!R4 (NOT (?L1 = OBJECT474.SK)))
		(!R5 (FRED.NAME FRIEND.N))
		(!R6 (FRED.NAME BEST.A))
		(!R7 (?X_A HOUSE.N))
		(!R8 (FRED.NAME (PERTAIN-TO FRIEND472.SK)))
		(!R9 (FRIEND472.SK AGENT.N))
		(!R10 (E475.SK (RIGHT-AFTER ?X_B)))
		(!R11 (FRIEND472.SK SON.N))
		(!R12 (FRIEND472.SK (PERTAIN-TO FRIEND472.SK)))
		(!R13 (FRIEND472.SK (PLUR FRIEND.N)))
		(!R14 (FRIEND472.SK (PERTAIN-TO HE483.SK)))
		(!R15 (HE483.SK AGENT.N))
	)
	(:GOALS
		(?G1 (FRED.NAME (WANT.V (KA ((ADV-A (AT.P OBJECT474.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P OBJECT474.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRED.NAME (AT.P ?L1))))
		(?P2 (FRED.NAME (AT.P OBJECT474.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E475.SK))
		(!W2 (?I2 BEFORE E475.SK))
		(!W3 (?P1 AFTER E475.SK))
		(!W4 (?P2 AFTER E475.SK))
		(!W5 (?G1 CAUSE-OF E475.SK))
		(!W6 (E475.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E475.SK (BEFORE NOW122)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 7)
("Fred loved fishing." "He loved going with his friends."
 "Fred went to the local pond yesterday." "He caught a large fish."
 "He brought it back to eat it.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P OBJECT474.SK))
                 ((ADV-A (FOR.P (KA VISIT.V))) COME.487.V))))
              OBJECT474.SK)
             ** E475.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (OBJECT474.SK LOCATION.N))
		(!R4 (NOT (?L1 = OBJECT474.SK)))
		(!R5 (E475.SK (RIGHT-AFTER ?X_A)))
		(!R6 (FRED.NAME FRIEND.N))
		(!R7 (FRED.NAME (PERTAIN-TO FRIEND472.SK)))
		(!R8 (FRIEND472.SK AGENT.N))
		(!R9 (FRIEND472.SK (PERTAIN-TO FRIEND472.SK)))
		(!R10 (FRIEND472.SK (PLUR BROTHER.N)))
		(!R11 (FRIEND472.SK (PLUR FRIEND.N)))
		(!R12 (FRIEND472.SK (PERTAIN-TO HE483.SK)))
		(!R13 (HE483.SK AGENT.N))
	)
	(:GOALS
		(?G1 (FRED.NAME (WANT.V (KA ((ADV-A (AT.P OBJECT474.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P OBJECT474.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (FRED.NAME (AT.P ?L1))))
		(?P2 (FRED.NAME (AT.P OBJECT474.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E475.SK))
		(!W2 (?I2 BEFORE E475.SK))
		(!W3 (?P1 AFTER E475.SK))
		(!W4 (?P2 AFTER E475.SK))
		(!W5 (?G1 CAUSE-OF E475.SK))
		(!W6 (E475.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (?G1 (BEFORE ?X_I)))
		(!W9 (E475.SK (BEFORE NOW122)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 25:
	; "We were out all day yesterday."
	; "The heat made me tired."
	; "I could barely function."
	; "So when we got to the house I slept."
	; "I had a long nap."
; best schemas are:
; GIVE.194.V
; TAKE.413.V
; TAKE.1039.V
; FEED.660.V
; TAKE.946.V
; GIVE.1297.V

; story 26:
	; "The man made a date."
	; "He was excited to go."
	; "He got ready for the date."
	; "He went to the meeting spot."
	; "His date never showed up."
discarding schema PLAY.402.V learned from this story
; best schemas are:
; GO.423.V
; GO.1261.V
; GO.51.V
; GO.537.V
; GO.1083.V
(setf matches (append matches '(( (4.4049997 6)
("The man made a date." "He was excited to go." "He got ready for the date."
 "He went to the meeting spot." "His date never showed up.")
(EPI-SCHEMA ((MAN498.SK
              (OUT.ADV
               ((ADV-A (TO.P SPOT508.SK)) ((ADV-A (FROM.P ?L1)) GO.501.V)))
              SPOT508.SK)
             ** E509.SK)
	(:ROLES
		(!R1 (MAN498.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (SPOT508.SK LOCATION.N))
		(!R4 (NOT (?L1 = SPOT508.SK)))
		(!R5 (SPOT508.SK MAILBOX.N))
		(!R6 (SPOT508.SK (PERTAIN-TO MAN498.SK)))
		(!R7 (E509.SK (RIGHT-AFTER ?X_A)))
		(!R8 (DATE500.SK PAPER.N))
		(!R9 (?X_C ((NN PAPER.N) BOY.N)))
		(!R10 (?X_C (PERTAIN-TO MAN498.SK)))
		(!R11 (SPOT508.SK ((NN MEETING.N) SPOT.N)))
		(!R12 (DATE500.SK DATE.N))
		(!R13 (MAN498.SK MAN.N))
		(!R14 (DATE500.SK (PERTAIN-TO MAN498.SK)))
	)
	(:GOALS
		(?G1 (MAN498.SK (WANT.V (KA ((ADV-A (AT.P SPOT508.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN498.SK (AT.P ?L1)))
		(?I2 (NOT (MAN498.SK (AT.P SPOT508.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN498.SK (AT.P ?L1))))
		(?P2 (MAN498.SK (AT.P SPOT508.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E509.SK))
		(!W2 (?I2 BEFORE E509.SK))
		(!W3 (?P1 AFTER E509.SK))
		(!W4 (?P2 AFTER E509.SK))
		(!W5 (?G1 CAUSE-OF E509.SK))
		(!W6 (E509.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E509.SK (BEFORE NOW133)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 4)
("The man made a date." "He was excited to go." "He got ready for the date."
 "He went to the meeting spot." "His date never showed up.")
(EPI-SCHEMA ((MAN498.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K FISHING.N))) GO.502.V))
              (K FISHING.N))
             ** E509.SK)
	(:ROLES
		(!R1 (MAN498.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K FISHING.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K FISHING.N))))
		(!R5 (E509.SK (RIGHT-AFTER ?X_A)))
		(!R6 (DATE500.SK LIMIT.N))
		(!R7 (SPOT508.SK ((NN MEETING.N) SPOT.N)))
		(!R8 (DATE500.SK DATE.N))
		(!R9 (MAN498.SK MAN.N))
		(!R10 (DATE500.SK (PERTAIN-TO MAN498.SK)))
	)
	(:GOALS
		(?G1 (MAN498.SK (WANT.V (KA ((ADV-A (AT.P (K FISHING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN498.SK (AT.P ?L1)))
		(?I2 (NOT (MAN498.SK (AT.P (K FISHING.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN498.SK (AT.P ?L1))))
		(?P2 (MAN498.SK (AT.P (K FISHING.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E509.SK))
		(!W2 (?I2 BEFORE E509.SK))
		(!W3 (?P1 AFTER E509.SK))
		(!W4 (?P2 AFTER E509.SK))
		(!W5 (?G1 CAUSE-OF E509.SK))
		(!W6 (E509.SK (SAME-TIME ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E509.SK (BEFORE NOW133)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 5)
("The man made a date." "He was excited to go." "He got ready for the date."
 "He went to the meeting spot." "His date never showed up.")
(EPI-SCHEMA ((MAN498.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P SPOT508.SK)) GO.503.V))
              SPOT508.SK)
             ** E509.SK)
	(:ROLES
		(!R1 (MAN498.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (SPOT508.SK LOCATION.N))
		(!R4 (NOT (?L1 = SPOT508.SK)))
		(!R5 (SPOT508.SK CAFETERIA.N))
		(!R6 (E509.SK (RIGHT-AFTER ?X_A)))
		(!R7 (DATE500.SK LUNCH.N))
		(!R8 (SPOT508.SK ((NN MEETING.N) SPOT.N)))
		(!R9 (DATE500.SK DATE.N))
		(!R10 (MAN498.SK MAN.N))
		(!R11 (DATE500.SK (PERTAIN-TO MAN498.SK)))
	)
	(:GOALS
		(?G1 (MAN498.SK (WANT.V (KA ((ADV-A (AT.P SPOT508.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN498.SK (AT.P ?L1)))
		(?I2 (NOT (MAN498.SK (AT.P SPOT508.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN498.SK (AT.P ?L1))))
		(?P2 (MAN498.SK (AT.P SPOT508.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E509.SK))
		(!W2 (?I2 BEFORE E509.SK))
		(!W3 (?P1 AFTER E509.SK))
		(!W4 (?P2 AFTER E509.SK))
		(!W5 (?G1 CAUSE-OF E509.SK))
		(!W6 (E509.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E509.SK (BEFORE NOW133)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 3)
("The man made a date." "He was excited to go." "He got ready for the date."
 "He went to the meeting spot." "His date never showed up.")
(EPI-SCHEMA ((MAN498.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K JAIL.N))) GO.504.V))
              (K JAIL.N))
             ** E509.SK)
	(:ROLES
		(!R1 (MAN498.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K JAIL.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K JAIL.N))))
		(!R5 (E509.SK (RIGHT-AFTER ?X_A)))
		(!R6 (MAN498.SK MAN.N))
		(!R7 (SPOT508.SK ((NN MEETING.N) SPOT.N)))
		(!R8 (DATE500.SK (PERTAIN-TO MAN498.SK)))
		(!R9 (DATE500.SK DATE.N))
	)
	(:GOALS
		(?G1 (MAN498.SK (WANT.V (KA ((ADV-A (AT.P (K JAIL.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN498.SK (AT.P ?L1)))
		(?I2 (NOT (MAN498.SK (AT.P (K JAIL.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN498.SK (AT.P ?L1))))
		(?P2 (MAN498.SK (AT.P (K JAIL.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E509.SK))
		(!W2 (?I2 BEFORE E509.SK))
		(!W3 (?P1 AFTER E509.SK))
		(!W4 (?P2 AFTER E509.SK))
		(!W5 (?G1 CAUSE-OF E509.SK))
		(!W6 (E509.SK (SAME-TIME ?X_E)))
		(!W7 (?X_D (BEFORE ?X_E)))
		(!W8 (E509.SK (BEFORE NOW133)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 4)
("The man made a date." "He was excited to go." "He got ready for the date."
 "He went to the meeting spot." "His date never showed up.")
(EPI-SCHEMA ((MAN498.SK
              ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_A)) LOOK.V))))
               ((ADV-A (TO.P SPOT508.SK)) ((ADV-A (FROM.P ?L1)) GO.505.V)))
              SPOT508.SK)
             ** E509.SK)
	(:ROLES
		(!R1 (MAN498.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (SPOT508.SK LOCATION.N))
		(!R4 (NOT (?L1 = SPOT508.SK)))
		(!R5 (?X_A (PLUR CLOTHE.N)))
		(!R6 (DATE500.SK WIFE.N))
		(!R7 (SPOT508.SK ((NN MEETING.N) SPOT.N)))
		(!R8 (DATE500.SK DATE.N))
		(!R9 (MAN498.SK MAN.N))
		(!R10 (DATE500.SK (PERTAIN-TO MAN498.SK)))
	)
	(:GOALS
		(?G1 (MAN498.SK (WANT.V (KA ((ADV-A (AT.P SPOT508.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN498.SK (AT.P ?L1)))
		(?I2 (NOT (MAN498.SK (AT.P SPOT508.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN498.SK (AT.P ?L1))))
		(?P2 (MAN498.SK (AT.P SPOT508.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E509.SK))
		(!W2 (?I2 BEFORE E509.SK))
		(!W3 (?P1 AFTER E509.SK))
		(!W4 (?P2 AFTER E509.SK))
		(!W5 (?G1 CAUSE-OF E509.SK))
		(!W6 (E509.SK (BEFORE ?X_E)))
		(!W7 (E509.SK (BEFORE NOW133)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 27:
	; "John wanted to start a family."
	; "He thought highly of family values."
	; "He met a great girl."
	; "They fell in love."
	; "They got married."
; best schemas are:
; RUN.401.V
; GO.658.V
; TAKE.413.V
; FLY.235.V
; COME.126.V
; TAKE.624.V

; story 28:
	; "Tom got a call from his sister."
	; "She wanted to come over in three hours."
	; "His place was a mess."
	; "He cleaned his house."
	; "They had a good time at his house."
discarding schema GET.413.V learned from this story
; best schemas are:
; TAKE.946.V
; GET.1260.V
; GET.88.V
; GET.460.V
; GIVE.194.V
(setf matches (append matches '(( (2.5 3)
("Tom got a call from his sister." "She wanted to come over in three hours."
 "His place was a mess." "He cleaned his house."
 "They had a good time at his house.")
(EPI-SCHEMA ((TOM.NAME GET.529.V
              (KA
               ((ADV-A
                 (WITH.P
                  (K
                   (L #:G1792470
                    (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
                (BE.PASV CATCH.V)))
              (AT.P-ARG ?L))
             ** E534.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2
   ((KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_A (TOO.ADV MANY.A)) (?X_B FISH.N))))))
      (BE.PASV CATCH.V)))
    INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4
   (NOT
    (TOM.NAME =
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_C (TOO.ADV MANY.A)) (?X_D FISH.N))))))
       (BE.PASV CATCH.V))))))
		(!R5 (TOM.NAME MAN.N))
		(!R6 (TOM.NAME LIMIT.N))
		(!R7 (TOM.NAME (PERTAIN-TO TOM.NAME)))
		(!R8 (CALL533.SK CALL.N))
		(!R9 (TOM.NAME PLACE.N))
		(!R10 (TOM.NAME HOUSE.N))
		(!R11 (TOM.NAME (PERTAIN-TO HE.PRO)))
		(!R12 (HE.PRO MALE.A))
		(!R13 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1
   (TOM.NAME
    (WANT.V
     (THAT
      (TOM.NAME
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
    (TOM.NAME HAVE.V
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_H (TOO.ADV MANY.A)) (?X_I FISH.N))))))
       (BE.PASV CATCH.V))))))
		(?I2 (TOM.NAME (AT.P ?L)))
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
   (TOM.NAME HAVE.V
    (KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_M (TOO.ADV MANY.A)) (?X_N FISH.N))))))
      (BE.PASV CATCH.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E534.SK))
		(!W2 (?I1 PRECOND-OF E534.SK))
		(!W3 (?I2 PRECOND-OF E534.SK))
		(!W4 (?I3 PRECOND-OF E534.SK))
		(!W5 (?P1 POSTCOND-OF E534.SK))
		(!W6 (E534.SK (BEFORE ?X_P)))
		(!W7 (E534.SK (BEFORE NOW140)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.368926 4)
("Tom got a call from his sister." "She wanted to come over in three hours."
 "His place was a mess." "He cleaned his house."
 "They had a good time at his house.")
(EPI-SCHEMA ((TOM.NAME GET.530.V CALL533.SK (AT.P-ARG ?L)) ** E534.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (CALL533.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = CALL533.SK)))
		(!R5 (CALL533.SK CAT.N))
		(!R6 (TOM.NAME WIFE.N))
		(!R7 (SHE560.SK CAT.N))
		(!R8 (?G1 (RIGHT-AFTER ?X_D)))
		(!R9 (CALL533.SK CALL.N))
		(!R10 (E536.SK (RIGHT-AFTER U141)))
		(!R11 (TOM.NAME PLACE.N))
		(!R12 (TOM.NAME HOUSE.N))
		(!R13 (TOM.NAME (PERTAIN-TO HE.PRO)))
		(!R14 (HE.PRO MALE.A))
		(!R15 (HE.PRO AGENT.N))
		(!R16 (SHE560.SK AGENT.N))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V CALL533.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V CALL533.SK)))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 (CALL533.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (TOM.NAME HAVE.V CALL533.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E534.SK))
		(!W2 (?I1 PRECOND-OF E534.SK))
		(!W3 (?I2 PRECOND-OF E534.SK))
		(!W4 (?I3 PRECOND-OF E534.SK))
		(!W5 (?P1 POSTCOND-OF E534.SK))
		(!W6 (E534.SK (BEFORE ?X_I)))
		(!W7 (E536.SK (SAME-TIME ?X_I)))
		(!W8 (?G1 (SAME-TIME ?X_L)))
		(!W9 (?X_K (AT-ABOUT ?X_L)))
		(!W10 (E534.SK (BEFORE NOW140)))
		(!W11 (E536.SK (SAME-TIME NOW142)))
		(!W12 (E563.SK (BEFORE NOW142)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.1411133 4)
("Tom got a call from his sister." "She wanted to come over in three hours."
 "His place was a mess." "He cleaned his house."
 "They had a good time at his house.")
(EPI-SCHEMA ((TOM.NAME ((ADV-A (FROM.P (K WORK.N))) GET.531.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E534.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = (K HOME.N))))
		(!R5 (TOM.NAME WIFE.N))
		(!R6 (TOM.NAME (PERTAIN-TO TOM.NAME)))
		(!R7 (CALL533.SK CALL.N))
		(!R8 (TOM.NAME PLACE.N))
		(!R9 (TOM.NAME HOUSE.N))
		(!R10 (TOM.NAME (PERTAIN-TO HE.PRO)))
		(!R11 (HE.PRO MALE.A))
		(!R12 (HE.PRO AGENT.N))
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
		(!W1 (?E1 SAME-TIME E534.SK))
		(!W2 (?I1 PRECOND-OF E534.SK))
		(!W3 (?I2 PRECOND-OF E534.SK))
		(!W4 (?I3 PRECOND-OF E534.SK))
		(!W5 (?P1 POSTCOND-OF E534.SK))
		(!W6 (E534.SK (BEFORE ?X_D)))
		(!W7 (E534.SK (BEFORE NOW140)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 29:
	; "Judy is driving home."
	; "She hits a rabbit on the road."
	; "She gets out to check on it."
	; "The rabbit is dead."
	; "Judy drives home."
; best schemas are:
; GO.292.V
; GO.658.V
; GO.866.V
; GO.1084.V
; GO.480.V
; TAKE.946.V
(setf matches (append matches '(( (2.5 0)
("Judy is driving home." "She hits a rabbit on the road."
 "She gets out to check on it." "The rabbit is dead." "Judy drives home.")
(EPI-SCHEMA ((JUDY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (ON.P IT.PRO)) CHECK.V))))
               ((ADV-A (FROM.P ?X_B))
                ((ADV-A (TO.P ?L2)) ((ADV-A HOME.N) (INSTEAD.ADV GO.533.V)))))
              ?L2)
             ** E573.SK)
	(:ROLES
		(!R1 (?X_B LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?X_B = ?L2)))
		(!R4 (JUDY.NAME AGENT.N))
		(!R5 (?X_A (PERTAIN-TO JUDY.NAME)))
		(!R6 (?X_A WAY.N))
		(!R7 (?X_B CORNER.N))
	)
	(:GOALS
		(?G1 (JUDY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JUDY.NAME (AT.P ?X_B)))
		(?I2 (NOT (JUDY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JUDY.NAME (AT.P ?X_B))))
		(?P2 (JUDY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E573.SK))
		(!W2 (?I2 BEFORE E573.SK))
		(!W3 (?P1 AFTER E573.SK))
		(!W4 (?P2 AFTER E573.SK))
		(!W5 (?G1 CAUSE-OF E573.SK))
		(!W6 (E573.SK (BEFORE ?X_E)))
		(!W7 (E573.SK (AT-ABOUT NOW147)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 1)
("Judy is driving home." "She hits a rabbit on the road."
 "She gets out to check on it." "The rabbit is dead." "Judy drives home.")
(EPI-SCHEMA ((JUDY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_A)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.534.V)))
              ?L2)
             ** E573.SK)
	(:ROLES
		(!R1 (JUDY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A (PLUR FRIEND.N)))
		(!R6 (?X_A HOME.N))
		(!R7 (?X_A (PERTAIN-TO JUDY.NAME)))
		(!R8 (JUDY.NAME GIRL.N))
		(!R9 (?X_A (PERTAIN-TO ?X_B)))
	)
	(:GOALS
		(?G1 (JUDY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JUDY.NAME (AT.P ?L1)))
		(?I2 (NOT (JUDY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JUDY.NAME (AT.P ?L1))))
		(?P2 (JUDY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E573.SK))
		(!W2 (?I2 BEFORE E573.SK))
		(!W3 (?P1 AFTER E573.SK))
		(!W4 (?P2 AFTER E573.SK))
		(!W5 (?G1 CAUSE-OF E573.SK))
		(!W6 (E573.SK (BEFORE ?X_E)))
		(!W7 (E573.SK (AT-ABOUT NOW147)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 2)
("Judy is driving home." "She hits a rabbit on the road."
 "She gets out to check on it." "The rabbit is dead." "Judy drives home.")
(EPI-SCHEMA ((JUDY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (ON.P IT.PRO)) CHECK.V))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-A HOME.N) GO.535.V))))
              ?L2)
             ** E573.SK)
	(:ROLES
		(!R1 (JUDY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (ROAD570.SK (PLUR SOCK.N)))
		(!R6 (ROAD570.SK (PERTAIN-TO JUDY.NAME)))
		(!R7 (?X_B (AT-OR-BEFORE ?X_E)))
		(!R8 (ROAD570.SK ROAD.N))
		(!R9 (RABBIT569.SK (ON.P ROAD570.SK)))
		(!R10 (RABBIT569.SK RABBIT.N))
	)
	(:GOALS
		(?G1 (JUDY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JUDY.NAME (AT.P ?L1)))
		(?I2 (NOT (JUDY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JUDY.NAME (AT.P ?L1))))
		(?P2 (JUDY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E573.SK))
		(!W2 (?I2 BEFORE E573.SK))
		(!W3 (?P1 AFTER E573.SK))
		(!W4 (?P2 AFTER E573.SK))
		(!W5 (?G1 CAUSE-OF E573.SK))
		(!W6 (E573.SK (BEFORE ?X_E)))
		(!W7 (E573.SK (AT-ABOUT NOW147)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0 1)
("Judy is driving home." "She hits a rabbit on the road."
 "She gets out to check on it." "The rabbit is dead." "Judy drives home.")
(EPI-SCHEMA ((JUDY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (ON.P IT.PRO)) CHECK.V))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) ((ADV-A (OFF.P ROAD570.SK)) GO.536.V))))
              ?L2)
             ** E573.SK)
	(:ROLES
		(!R1 (JUDY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (JUDY.NAME FRIEND.N))
		(!R6 (JUDY.NAME (PERTAIN-TO ?X_B)))
		(!R7 (?X_C (PERTAIN-TO ?X_B)))
		(!R8 (?X_C CAR.N))
		(!R9 (ROAD570.SK ROAD.N))
		(!R10 (RABBIT569.SK (ON.P ROAD570.SK)))
		(!R11 (RABBIT569.SK RABBIT.N))
	)
	(:GOALS
		(?G1 (JUDY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JUDY.NAME (AT.P ?L1)))
		(?I2 (NOT (JUDY.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JUDY.NAME (AT.P ?L1))))
		(?P2 (JUDY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E573.SK))
		(!W2 (?I2 BEFORE E573.SK))
		(!W3 (?P1 AFTER E573.SK))
		(!W4 (?P2 AFTER E573.SK))
		(!W5 (?G1 CAUSE-OF E573.SK))
		(!W6 (E573.SK (BEFORE ?X_F)))
		(!W7 (E573.SK (AT-ABOUT NOW147)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("Judy is driving home." "She hits a rabbit on the road."
 "She gets out to check on it." "The rabbit is dead." "Judy drives home.")
(EPI-SCHEMA ((JUDY.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (ON.P IT.PRO)) CHECK.V))))
               ((ADV-A (TO.P ?X_B)) ((ADV-A (FROM.P ?L1)) GO.537.V)))
              ?X_B)
             ** E573.SK)
	(:ROLES
		(!R1 (JUDY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_B LOCATION.N))
		(!R4 (NOT (?L1 = ?X_B)))
		(!R5 (?X_B PLACE.N))
	)
	(:GOALS
		(?G1 (JUDY.NAME (WANT.V (KA ((ADV-A (AT.P ?X_B)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JUDY.NAME (AT.P ?L1)))
		(?I2 (NOT (JUDY.NAME (AT.P ?X_B))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (JUDY.NAME (AT.P ?L1))))
		(?P2 (JUDY.NAME (AT.P ?X_B)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E573.SK))
		(!W2 (?I2 BEFORE E573.SK))
		(!W3 (?P1 AFTER E573.SK))
		(!W4 (?P2 AFTER E573.SK))
		(!W5 (?G1 CAUSE-OF E573.SK))
		(!W6 (E573.SK (BEFORE ?X_D)))
		(!W7 (E573.SK (AT-ABOUT NOW147)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 30:
	; "I am pretty weak."
	; "I could not do one pull-up."
	; "I tried every day for a month."
	; "I started getting stronger."
	; "I can now do 5 pull-ups."
; best schemas are:
; FLY.235.V
; GIVE.194.V
; TAKE.413.V
; RUN.28.V
; RUN.229.V
; RUN.254.V

; story 31:
	; "Tom was tired of work."
	; "He decided to go on vacation."
	; "Tom was having a great time."
	; "He didn't want it to end."
	; "He extended it by days."
; best schemas are:
; GO.671.V
; GO.19.V
; GO.90.V
; GO.1241.V
; GO.504.V
; GO.350.V

; story 32:
	; "The man played his guitar."
	; "He found something he liked."
	; "He wrote it down."
	; "He built off of it."
	; "He wrote a pretty good song."
discarding schema FIND.436.V learned from this story
discarding schema PLAY.431.V learned from this story
discarding schema PLAY.437.V learned from this story
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.626.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.627.V
; SEARCH.695.V

; story 33:
	; "I like to play fire."
	; "One day I create a fire in my room."
	; "My bed was on fire."
	; "I burn my hand."
	; "I had a burn mark in my hand."
; best schemas are:
; PLAY.669.V
; PLAY.670.V
; PLAY.799.V
; PLAY.402.V
; PLAY.V
; EAT.342.V

; story 34:
	; "Susan loved to feed her cat."
	; "She bought the best food for it."
	; "She got the food out for the cat."
	; "She put it in the bowl."
	; "The cat ate the food."
discarding schema FEED.445.V learned from this story
discarding schema FEED.446.V learned from this story
discarding schema GET.457.V learned from this story
discarding schema EAT.456.V learned from this story
; best schemas are:
; FEED.660.V
; CLIMB_GET_EAT.349.PR
(setf matches (append matches '(( (4.4049997 9)
("Susan loved to feed her cat." "She bought the best food for it."
 "She got the food out for the cat." "She put it in the bowl."
 "The cat ate the food.")
(EPI-SCHEMA ((SUSAN.NAME ((ADV-A (TO.P CAT663.SK)) FEED.567.V) CAT663.SK
              FOOD689.SK)
             ** ?X_G)
	(:ROLES
		(!R1 (SUSAN.NAME AGENT.N))
		(!R2 (CAT663.SK AGENT.N))
		(!R3 (NOT (SUSAN.NAME = CAT663.SK)))
		(!R4 (NOT (CAT663.SK = FOOD689.SK)))
		(!R5 (NOT (SUSAN.NAME = FOOD689.SK)))
		(!R6 (FOOD689.SK MOUSE.N))
		(!R7 (SUSAN.NAME CAT.N))
		(!R8 (SUSAN.NAME OLD.A))
		(!R9 (CAT663.SK MOUSE.N))
		(!R10 (FOOD689.SK FOOD.N))
		(!R11 (E686.SK (RIGHT-AFTER U173)))
		(!R12 (CAT663.SK CAT.N))
		(!R13 (CAT663.SK PLACENTAL.N))
		(!R14 (CAT663.SK (PERTAIN-TO SUSAN.NAME)))
		(!R15 (OUT679.SK ((NN FOOD.N) OUT.N)))
		(!R16 (OUT679.SK (FOR.P CAT663.SK)))
	)
	(:GOALS
		(?G1 (SUSAN.NAME (WANT.V (THAT (NOT (CAT663.SK HUNGRY.A))))))
		(?G2 (SUSAN.NAME (WANT.V (THAT (CAT663.SK EAT.V FOOD689.SK)))))
	)
	(:PRECONDS
		(?I1 (SUSAN.NAME HAVE.V FOOD689.SK))
		(?I2 (CAT663.SK HUNGRY.A))
	)
	(:STEPS
		(E686.SK (CAT663.SK EAT.V FOOD689.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (SUSAN.NAME (HAVE.V FOOD689.SK))))
		(?P2 (NOT (CAT663.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E686.SK AFTER ?X_G))
		(!W2 (?I1 (AT-ABOUT ?X_F)))
		(!W3 (?X_G (AFTER ?X_H)))
		(!W4 (?X_H (AT-ABOUT ?X_I)))
		(!W5 (E686.SK (SAME-TIME NOW174)))
		(!W6 (E690.SK (BEFORE NOW174)))
	)
	(:CERTAINTIES
		(!C1 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R9 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R13 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R12 CERTAIN-TO-DEGREE (/ 1 3)))
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
(setf matches (append matches '(( (1.0 3)
("Susan loved to feed her cat." "She bought the best food for it."
 "She got the food out for the cat." "She put it in the bowl."
 "The cat ate the food.")
(EPI-SCHEMA ((SUSAN.NAME CLIMB_GET_EAT.569.PR ?X_A FOOD674.SK) ** ?E)
	(:ROLES
		(!R1 (?X_A TREE.N))
		(!R2 (FOOD674.SK INANIMATE_OBJECT.N))
		(!R3 (NOT (SUSAN.NAME = FOOD674.SK)))
		(!R4 (?X_A LOCATION.N))
		(!R5 (FOOD674.SK COCOANUT.N))
		(!R6 (SUSAN.NAME MONKEY.N))
		(!R7 (CAT663.SK CAT.N))
		(!R8 (CAT663.SK (PERTAIN-TO SUSAN.NAME)))
		(!R9 (FOOD674.SK FOOD.N))
		(!R10 (FOOD674.SK BEST.A))
		(!R11 (OUT679.SK ((NN FOOD.N) OUT.N)))
		(!R12 (OUT679.SK (FOR.P CAT663.SK)))
	)
	(:PRECONDS
		(?I1 (SUSAN.NAME (AT.P ?L1_2)))
		(?I2 (NOT (SUSAN.NAME (AT.P ?X_A))))
	)
	(:STEPS
		(?E1
   (SUSAN.NAME ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) CLIMB.347.V)) ?X_A))
		(E675.SK
   (SUSAN.NAME ((ADV-A (FOR.P CAT663.SK)) GET.346.V) FOOD674.SK
    (AT.P-ARG ?X_A)))
		(?E3 (SUSAN.NAME EAT.323.V FOOD674.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (SUSAN.NAME (HAVE.V FOOD674.SK))))
		(?P2 (NOT (SUSAN.NAME HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE E675.SK))
		(!W2 (E675.SK BEFORE ?E3))
		(!W3 (E675.SK (BEFORE NOW171)))
	)
)
))))
(setf matches (append matches '(( (1.0 3)
("Susan loved to feed her cat." "She bought the best food for it."
 "She got the food out for the cat." "She put it in the bowl."
 "The cat ate the food.")
(EPI-SCHEMA ((CAT663.SK CLIMB_GET_EAT.570.PR ?X_A FOOD689.SK) ** ?E)
	(:ROLES
		(!R1 (?X_A TREE.N))
		(!R2 (FOOD689.SK INANIMATE_OBJECT.N))
		(!R3 (NOT (CAT663.SK = FOOD689.SK)))
		(!R4 (?X_A LOCATION.N))
		(!R5 (FOOD689.SK COCOANUT.N))
		(!R6 (CAT663.SK MONKEY.N))
		(!R7 (CAT663.SK CAT.N))
		(!R8 (CAT663.SK PLACENTAL.N))
		(!R9 (FOOD689.SK FOOD.N))
		(!R10 (CAT663.SK (PERTAIN-TO SUSAN.NAME)))
		(!R11 (OUT679.SK (FOR.P CAT663.SK)))
		(!R12 (OUT679.SK ((NN FOOD.N) OUT.N)))
		(!R13 (E686.SK (RIGHT-AFTER U173)))
	)
	(:PRECONDS
		(?I1 (CAT663.SK (AT.P ?L1_2)))
		(?I2 (NOT (CAT663.SK (AT.P ?X_A))))
	)
	(:STEPS
		(?E1
   (CAT663.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) CLIMB.347.V)) ?X_A))
		(?E2 (CAT663.SK GET.346.V FOOD689.SK (AT.P-ARG ?X_A)))
		(E690.SK (CAT663.SK EAT.323.V FOOD689.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (CAT663.SK (HAVE.V FOOD689.SK))))
		(?P2 (NOT (CAT663.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE ?E2))
		(!W2 (?E2 BEFORE E690.SK))
		(!W3 (E690.SK (BEFORE NOW174)))
		(!W4 (E686.SK (SAME-TIME NOW174)))
	)
	(:CERTAINTIES
		(!C1 (!R8 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
	)
)
))))
(setf matches (append matches '(( (1.0 3)
("Susan loved to feed her cat." "She bought the best food for it."
 "She got the food out for the cat." "She put it in the bowl."
 "The cat ate the food.")
(EPI-SCHEMA ((CAT663.SK CLIMB_GET_EAT.571.PR ?X_A FOOD689.SK) ** ?E)
	(:ROLES
		(!R1 (?X_A TREE.N))
		(!R2 (FOOD689.SK INANIMATE_OBJECT.N))
		(!R3 (NOT (CAT663.SK = FOOD689.SK)))
		(!R4 (?X_A LOCATION.N))
		(!R5 (FOOD689.SK COCOANUT.N))
		(!R6 (CAT663.SK MONKEY.N))
		(!R7 (FOOD689.SK FOOD.N))
		(!R8 (CAT663.SK CAT.N))
		(!R9 (CAT663.SK PLACENTAL.N))
		(!R10 (E686.SK (RIGHT-AFTER U173)))
		(!R11 (CAT663.SK (PERTAIN-TO SUSAN.NAME)))
		(!R12 (OUT679.SK (FOR.P CAT663.SK)))
		(!R13 (OUT679.SK ((NN FOOD.N) OUT.N)))
	)
	(:PRECONDS
		(?I1 (CAT663.SK (AT.P ?L1_2)))
		(?I2 (NOT (CAT663.SK (AT.P ?X_A))))
	)
	(:STEPS
		(?E1
   (CAT663.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) CLIMB.347.V)) ?X_A))
		(?E2 (CAT663.SK GET.346.V FOOD689.SK (AT.P-ARG ?X_A)))
		(E686.SK (CAT663.SK EAT.323.V FOOD689.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (CAT663.SK (HAVE.V FOOD689.SK))))
		(?P2 (NOT (CAT663.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE ?E2))
		(!W2 (?E2 BEFORE E686.SK))
		(!W3 (E686.SK (SAME-TIME NOW174)))
		(!W4 (E690.SK (BEFORE NOW174)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
	)
)
))))

; story 35:
	; "A new pizza place opened up."
	; "I decided to try it."
	; "It was great."
	; "I got to customize my pizza."
	; "I decided to go back the next day."
; best schemas are:
; GO.843.V
; GET.826.V
; EAT.516.V
; MOVE.342.V
; MOVE.501.V
; MOVE.109.V

; story 36:
	; "The man saw a rabbit."
	; "He was hungry."
	; "He chased the rabbit."
	; "The rabbit outran him."
	; "The man sat down in defeat."
; best schemas are:
; EAT.342.V
; FEED.343.V
; FEED.351.V
; FEED.288.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1136.V

; story 37:
	; "Spencer went outside in the rain."
	; "He put on his boots."
	; "He stepped in his yard."
	; "The mud made him stick."
	; "He eventually got out."
discarding schema GO.495.V learned from this story
; best schemas are:
; GO.194.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.539.V
; GO.340.V
; GO.680.V
(setf matches (append matches '(( (3.0 2)
("Spencer went outside in the rain." "He put on his boots."
 "He stepped in his yard." "The mud made him stick." "He eventually got out.")
(EPI-SCHEMA ((SPENCER.NAME
              ((ADV-A (IN.P RAIN726.SK))
               (OUTSIDE.ADV
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.616.V))))
              ?L2)
             ** E727.SK)
	(:ROLES
		(!R1 (SPENCER.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (RAIN726.SK YARD.N))
		(!R6 (SPENCER.NAME DOG.N))
		(!R7 (E727.SK (RIGHT-AFTER ?X_B)))
		(!R8 (RAIN726.SK RAIN.N))
		(!R9 (BOOT732.SK (PERTAIN-TO SPENCER.NAME)))
		(!R10 (BOOT732.SK (PLUR BOOT.N)))
		(!R11 (YARD737.SK (PERTAIN-TO SPENCER.NAME)))
		(!R12 (YARD737.SK YARD.N))
	)
	(:GOALS
		(?G1 (SPENCER.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SPENCER.NAME (AT.P ?L1)))
		(?I2 (NOT (SPENCER.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SPENCER.NAME (AT.P ?L1))))
		(?P2 (SPENCER.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E727.SK))
		(!W2 (?I2 BEFORE E727.SK))
		(!W3 (?P1 AFTER E727.SK))
		(!W4 (?P2 AFTER E727.SK))
		(!W5 (?G1 CAUSE-OF E727.SK))
		(!W6 (E727.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (E727.SK (BEFORE NOW185)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0 3)
("Spencer went outside in the rain." "He put on his boots."
 "He stepped in his yard." "The mud made him stick." "He eventually got out.")
(EPI-SCHEMA ((SPENCER.NAME
              ((ADV-A (IN.P RAIN726.SK))
               (OUTSIDE.ADV
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?L2))
                  ((ADV-A
                    (FOR.P
                     (KA
                      ((ADV-A (WITH.P (SET-OF YARD737.SK SPENCER.NAME)))
                       PLAY.V))))
                   GO.617.V)))))
              ?L2)
             ** E727.SK)
	(:ROLES
		(!R1 (SPENCER.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (YARD737.SK LAP.N))
		(!R6 (YARD737.SK (PERTAIN-TO YARD737.SK)))
		(!R7 (?X_B (IMPINGES-ON E727.SK)))
		(!R8 (?X_C (PERTAIN-TO SPENCER.NAME)))
		(!R9 (?X_D DOLL.N))
		(!R10 (?X_D (PERTAIN-TO SPENCER.NAME)))
		(!R11 (BOOT732.SK SPADE.N))
		(!R12 (?X_G (IMPINGES-ON ?X_J)))
		(!R13 (RAIN726.SK RAIN.N))
		(!R14 (YARD737.SK (PERTAIN-TO SPENCER.NAME)))
		(!R15 (YARD737.SK YARD.N))
		(!R16 (BOOT732.SK (PERTAIN-TO SPENCER.NAME)))
		(!R17 (BOOT732.SK (PLUR BOOT.N)))
	)
	(:GOALS
		(?G1 (SPENCER.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SPENCER.NAME (AT.P ?L1)))
		(?I2 (NOT (SPENCER.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SPENCER.NAME (AT.P ?L1))))
		(?P2 (SPENCER.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E727.SK))
		(!W2 (?I2 BEFORE E727.SK))
		(!W3 (?P1 AFTER E727.SK))
		(!W4 (?P2 AFTER E727.SK))
		(!W5 (?G1 CAUSE-OF E727.SK))
		(!W6 (E727.SK (AT-ABOUT ?X_K)))
		(!W7 (?X_J (AT-ABOUT ?X_K)))
		(!W8 (E727.SK (BEFORE NOW185)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.5 2)
("Spencer went outside in the rain." "He put on his boots."
 "He stepped in his yard." "The mud made him stick." "He eventually got out.")
(EPI-SCHEMA ((SPENCER.NAME
              ((ADV-A (IN.P RAIN726.SK))
               (OUTSIDE.ADV
                ((ADV-A (FROM.P ?L1))
                 ((ADV-A (TO.P ?X_D))
                  ((ADV-A (WITH.P BOOT732.SK)) GO.618.V)))))
              ?X_D)
             ** E727.SK)
	(:ROLES
		(!R1 (SPENCER.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_D LOCATION.N))
		(!R4 (NOT (?L1 = ?X_D)))
		(!R5 (BOOT732.SK KITE.N))
		(!R6 (?X_D FIELD.N))
		(!R7 (E727.SK (IMPINGES-ON ?X_F)))
		(!R8 (YARD737.SK KITE.N))
		(!R9 (RAIN726.SK RAIN.N))
		(!R10 (YARD737.SK (PERTAIN-TO SPENCER.NAME)))
		(!R11 (YARD737.SK YARD.N))
		(!R12 (BOOT732.SK (PERTAIN-TO SPENCER.NAME)))
		(!R13 (BOOT732.SK (PLUR BOOT.N)))
	)
	(:GOALS
		(?G1 (SPENCER.NAME (WANT.V (KA ((ADV-A (AT.P ?X_D)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SPENCER.NAME (AT.P ?L1)))
		(?I2 (NOT (SPENCER.NAME (AT.P ?X_D))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SPENCER.NAME (AT.P ?L1))))
		(?P2 (SPENCER.NAME (AT.P ?X_D)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E727.SK))
		(!W2 (?I2 BEFORE E727.SK))
		(!W3 (?P1 AFTER E727.SK))
		(!W4 (?P2 AFTER E727.SK))
		(!W5 (?G1 CAUSE-OF E727.SK))
		(!W6 (?X_F (AT-ABOUT ?X_G)))
		(!W7 (E727.SK (BEFORE NOW185)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 38:
	; "I went out to eat yesterday."
	; "I later had leftovers."
	; "I didn't like the leftovers."
	; "They did not taste good,
I threw them out."
; best schemas are:
; GIVE.194.V
; TAKE.413.V
; FEED.660.V
; TAKE.946.V
; GIVE.1297.V
; TAKE.135.V

; story 39:
	; "Brenda was a nurse."
	; "She had two kids."
	; "She moved to a new town."
	; "Then they grew up."
	; "So she went back to work."
discarding schema MOVE.501.V learned from this story
; best schemas are:
; FLY.235.V
; TAKE.413.V
; MOVE.109.V
; GET.826.V
; TAKE.958.V
(setf matches (append matches '(( (3.6953125 5)
("Brenda was a nurse." "She had two kids." "She moved to a new town."
 "Then they grew up." "So she went back to work.")
(EPI-SCHEMA ((BRENDA.NAME
              (AWAY.ADV
               ((ADV-A (TO.P TOWN764.SK)) ((ADV-A (FROM.P ?L1)) FLY.626.V)))
              TOWN764.SK)
             ** E765.SK)
	(:ROLES
		(!R1 (BRENDA.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (TOWN764.SK LOCATION.N))
		(!R4 (NOT (?L1 = TOWN764.SK)))
		(!R5 (BRENDA.NAME ((NN MOTHER.N) BIRD.N)))
		(!R6 (BRENDA.NAME BIRD.N))
		(!R7 (BRENDA.NAME ((NN BABY.N) BIRD.N)))
		(!R8 (TOWN764.SK TOWN.N))
		(!R9 (TOWN764.SK NEW.A))
	)
	(:GOALS
		(?G1 (BRENDA.NAME (WANT.V (KA ((ADV-A (AT.P TOWN764.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BRENDA.NAME (AT.P ?L1)))
		(?I2 (NOT (BRENDA.NAME (AT.P TOWN764.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (BRENDA.NAME (AT.P ?L1))))
		(?P2 (BRENDA.NAME (AT.P TOWN764.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E765.SK))
		(!W2 (?I2 BEFORE E765.SK))
		(!W3 (?P1 AFTER E765.SK))
		(!W4 (?P2 AFTER E765.SK))
		(!W5 (?G1 CAUSE-OF E765.SK))
		(!W6 (E765.SK (BEFORE ?X_C)))
		(!W7 (E765.SK (BEFORE NOW196)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.227813 7)
("Brenda was a nurse." "She had two kids." "She moved to a new town."
 "Then they grew up." "So she went back to work.")
(EPI-SCHEMA ((BRENDA.NAME ((ADV-A (TO.P TOWN764.SK)) (HOME.ADV TAKE.627.V))
              NURSE756.SK (AT.P-ARG ?L))
             ** E765.SK)
	(:ROLES
		(!R1 (BRENDA.NAME AGENT.N))
		(!R2 (NURSE756.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (BRENDA.NAME = NURSE756.SK)))
		(!R5 (BRENDA.NAME (PLUR GIRL.N)))
		(!R6 (NURSE756.SK GIANT.A))
		(!R7 (NURSE756.SK FROG.N))
		(!R8 (THEY768.SK (PERTAIN-TO BRENDA.NAME)))
		(!R9 (THEY768.SK (PLUR FRIEND.N)))
		(!R10 (TOWN764.SK TOWN.N))
		(!R11 (TOWN764.SK NEW.A))
		(!R12 (NURSE756.SK NURSE.N))
		(!R13 (NURSE756.SK PERSON.N))
		(!R14 (THEY768.SK AGENT.N))
	)
	(:GOALS
		(?G1 (BRENDA.NAME (WANT.V (THAT (BRENDA.NAME (HAVE.V NURSE756.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (BRENDA.NAME HAVE.V NURSE756.SK)))
		(?I2 (BRENDA.NAME (AT.P ?L)))
		(?I3 (NURSE756.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (BRENDA.NAME HAVE.V NURSE756.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E765.SK))
		(!W2 (?I1 PRECOND-OF E765.SK))
		(!W3 (?I2 PRECOND-OF E765.SK))
		(!W4 (?I3 PRECOND-OF E765.SK))
		(!W5 (?P1 POSTCOND-OF E765.SK))
		(!W6 (E765.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E765.SK (BEFORE NOW196)))
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
(setf matches (append matches '(( (4.1953125 3)
("Brenda was a nurse." "She had two kids." "She moved to a new town."
 "Then they grew up." "So she went back to work.")
(EPI-SCHEMA ((BRENDA.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TOWN764.SK)) MOVE.628.V))
              TOWN764.SK)
             ** E765.SK)
	(:ROLES
		(!R1 (BRENDA.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (TOWN764.SK LOCATION.N))
		(!R4 (NOT (?L1 = TOWN764.SK)))
		(!R5 (TOWN764.SK CITY.N))
		(!R6 (?X_A HOMETOWN.N))
		(!R7 (?X_A (PERTAIN-TO BRENDA.NAME)))
		(!R8 (TOWN764.SK TOWN.N))
		(!R9 (TOWN764.SK MUNICIPALITY.N))
		(!R10 (TOWN764.SK NEW.A))
	)
	(:GOALS
		(?G1 (BRENDA.NAME (WANT.V (KA ((ADV-A (AT.P TOWN764.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BRENDA.NAME (AT.P ?L1)))
		(?I2 (NOT (BRENDA.NAME (AT.P TOWN764.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (BRENDA.NAME (AT.P ?L1))))
		(?P2 (BRENDA.NAME (AT.P TOWN764.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E765.SK))
		(!W2 (?I2 BEFORE E765.SK))
		(!W3 (?P1 AFTER E765.SK))
		(!W4 (?P2 AFTER E765.SK))
		(!W5 (?G1 CAUSE-OF E765.SK))
		(!W6 (E765.SK (BEFORE ?X_E)))
		(!W7 (E765.SK (BEFORE NOW196)))
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
(setf matches (append matches '(( (4.6411133 5)
("Brenda was a nurse." "She had two kids." "She moved to a new town."
 "Then they grew up." "So she went back to work.")
(EPI-SCHEMA ((BRENDA.NAME ((ADV-A (TO.P TOWN764.SK)) TAKE.639.V) TOWN764.SK
              (AT.P-ARG ?L))
             ** E765.SK)
	(:ROLES
		(!R1 (BRENDA.NAME AGENT.N))
		(!R2 (TOWN764.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (BRENDA.NAME = TOWN764.SK)))
		(!R5 (TOWN764.SK ((NN CAR.N) COLOR.N)))
		(!R6 (BRENDA.NAME MAN.N))
		(!R7 (TOWN764.SK SHOP.N))
		(!R8 (TOWN764.SK TOWN.N))
		(!R9 (TOWN764.SK NEW.A))
	)
	(:GOALS
		(?G1 (BRENDA.NAME (WANT.V (THAT (BRENDA.NAME (HAVE.V TOWN764.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (BRENDA.NAME HAVE.V TOWN764.SK)))
		(?I2 (BRENDA.NAME (AT.P ?L)))
		(?I3 (TOWN764.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (BRENDA.NAME HAVE.V TOWN764.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E765.SK))
		(!W2 (?I1 PRECOND-OF E765.SK))
		(!W3 (?I2 PRECOND-OF E765.SK))
		(!W4 (?I3 PRECOND-OF E765.SK))
		(!W5 (?P1 POSTCOND-OF E765.SK))
		(!W6 (?G1 (BEFORE ?X_E)))
		(!W7 (E765.SK (BEFORE ?X_G)))
		(!W8 (E765.SK (BEFORE NOW196)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 40:
	; "The man liked a drug."
	; "He tried to find some."
	; "It was illegal."
	; "The cops saw him."
	; "The man went to jail."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; GO.504.V
; SHOP.797.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; GO.423.V
(setf matches (append matches '(( (4.4049997 3)
("The man liked a drug." "He tried to find some." "It was illegal."
 "The cops saw him." "The man went to jail.")
(EPI-SCHEMA ((MAN771.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K JAIL.N))) GO.649.V))
              (K JAIL.N))
             ** E783.SK)
	(:ROLES
		(!R1 (MAN771.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K JAIL.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K JAIL.N))))
		(!R5 (?X_B ((NN MEETING.N) SPOT.N)))
		(!R6 (?X_C (PERTAIN-TO MAN771.SK)))
		(!R7 (?X_C DATE.N))
		(!R8 (MAN771.SK MAN.N))
		(!R9 (E783.SK (RIGHT-AFTER U202)))
	)
	(:GOALS
		(?G1 (MAN771.SK (WANT.V (KA ((ADV-A (AT.P (K JAIL.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN771.SK (AT.P ?L1)))
		(?I2 (NOT (MAN771.SK (AT.P (K JAIL.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN771.SK (AT.P ?L1))))
		(?P2 (MAN771.SK (AT.P (K JAIL.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E783.SK))
		(!W2 (?I2 BEFORE E783.SK))
		(!W3 (?P1 AFTER E783.SK))
		(!W4 (?P2 AFTER E783.SK))
		(!W5 (?G1 CAUSE-OF E783.SK))
		(!W6 (E783.SK (SAME-TIME ?X_E)))
		(!W7 (?X_D (BEFORE ?X_E)))
		(!W8 (E783.SK (BEFORE ?X_H)))
		(!W9 (E783.SK (SAME-TIME NOW203)))
		(!W10 (E786.SK (BEFORE NOW203)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.405 1)
("The man liked a drug." "He tried to find some." "It was illegal."
 "The cops saw him." "The man went to jail.")
(EPI-SCHEMA ((MAN771.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.652.V
              (KA (LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))))
             ** ?E)
	(:ROLES
		(!R1 (MAN771.SK AGENT.N))
		(!R2 ((KA (LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (MAN771.SK BIRD.N))
		(!R5 (?X_B CAGE.N))
		(!R6 (DRUG773.SK DRUG.N))
		(!R7 (MAN771.SK MAN.N))
		(!R8 (E770.SK (RIGHT-AFTER U198)))
	)
	(:GOALS
		(?G1 (MAN771.SK (WANT.V (THAT (NOT (MAN771.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN771.SK LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))) CAUSE-OF
    (KE (MAN771.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E770.SK (MAN771.SK LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E770.SK))
		(!W2 (E770.SK (BEFORE ?X_D)))
		(!W3 (E770.SK (SAME-TIME NOW199)))
		(!W4 (E774.SK (BEFORE NOW199)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.405 1)
("The man liked a drug." "He tried to find some." "It was illegal."
 "The cops saw him." "The man went to jail.")
(EPI-SCHEMA ((MAN771.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.654.V
              (KA (LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))))
             ** ?E)
	(:ROLES
		(!R1 (MAN771.SK AGENT.N))
		(!R2 ((KA (LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (MAN771.SK BIRD.N))
		(!R5 (?X_B CAGE.N))
		(!R6 (MAN771.SK MAN.N))
		(!R7 (DRUG773.SK DRUG.N))
		(!R8 (E770.SK (RIGHT-AFTER U198)))
	)
	(:GOALS
		(?G1 (MAN771.SK (WANT.V (THAT (NOT (MAN771.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN771.SK LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))) CAUSE-OF
    (KE (MAN771.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E774.SK (MAN771.SK LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E774.SK))
		(!W2 (E774.SK (BEFORE ?X_D)))
		(!W3 (E774.SK (BEFORE NOW199)))
		(!W4 (E770.SK (SAME-TIME NOW199)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 5)
("The man liked a drug." "He tried to find some." "It was illegal."
 "The cops saw him." "The man went to jail.")
(EPI-SCHEMA ((MAN771.SK
              (OUT.ADV
               ((ADV-A (TO.P (K JAIL.N))) ((ADV-A (FROM.P ?L1)) GO.656.V)))
              (K JAIL.N))
             ** E783.SK)
	(:ROLES
		(!R1 (MAN771.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K JAIL.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K JAIL.N))))
		(!R5 ((K JAIL.N) MAILBOX.N))
		(!R6 ((K JAIL.N) (PERTAIN-TO MAN771.SK)))
		(!R7 (?X_B PAPER.N))
		(!R8 (?X_B (PERTAIN-TO MAN771.SK)))
		(!R9 (?X_C ((NN PAPER.N) BOY.N)))
		(!R10 (?X_C (PERTAIN-TO MAN771.SK)))
		(!R11 (MAN771.SK MAN.N))
		(!R12 (E783.SK (RIGHT-AFTER U202)))
	)
	(:GOALS
		(?G1 (MAN771.SK (WANT.V (KA ((ADV-A (AT.P (K JAIL.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN771.SK (AT.P ?L1)))
		(?I2 (NOT (MAN771.SK (AT.P (K JAIL.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN771.SK (AT.P ?L1))))
		(?P2 (MAN771.SK (AT.P (K JAIL.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E783.SK))
		(!W2 (?I2 BEFORE E783.SK))
		(!W3 (?P1 AFTER E783.SK))
		(!W4 (?P2 AFTER E783.SK))
		(!W5 (?G1 CAUSE-OF E783.SK))
		(!W6 (E783.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E783.SK (SAME-TIME NOW203)))
		(!W9 (E786.SK (BEFORE NOW203)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 41:
	; "A little boy went to a shoe store."
	; "He wanted to buy his mom shoes."
	; "He didn't have enough money."
	; "A man paid for him."
	; "The boy was so happy!"
; best schemas are:
; GO.423.V
; GO.90.V
; GO.806.V
; GO.1220.V
; GO.1261.V
; GO.51.V

; story 42:
	; "Susie looked at her cd."
	; "It was all scratched."
	; "She wondered if it would work."
	; "Unfortunately it did not."
	; "She had to buy another one."
; best schemas are:
; GO.1083.V
; TRAVEL.V
; RUN.28.V
; RUN.58.V
; RUN.179.V
; RUN.229.V

; story 43:
	; "Chad was going out for a pass."
	; "He was on in the parking lot."
	; "Someone was guarding him."
	; "He hit the ground hard."
	; "His arm was broken."
; best schemas are:
; GO.1024.V
; GO.742.V
; GO.758.V
; GO.30.V
; EAT.323.V
; FEED.324.V
(setf matches (append matches '(( (3.5 2)
("Chad was going out for a pass." "He was on in the parking lot."
 "Someone was guarding him." "He hit the ground hard." "His arm was broken.")
(EPI-SCHEMA ((CHAD.NAME
              ((ADV-A (FOR.P PASS828.SK))
               (OUT.ADV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.665.V))))
              ?L2)
             ** E827.SK)
	(:ROLES
		(!R1 (CHAD.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (PASS828.SK BALL.N))
		(!R6 (ARM838.SK (PERTAIN-TO CHAD.NAME)))
		(!R7 (PASS828.SK PASS.N))
		(!R8 (ARM838.SK ARM.N))
		(!R9 (ARM838.SK (PERTAIN-TO HE.PRO)))
		(!R10 (HE.PRO MALE.A))
		(!R11 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (CHAD.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CHAD.NAME (AT.P ?L1)))
		(?I2 (NOT (CHAD.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CHAD.NAME (AT.P ?L1))))
		(?P2 (CHAD.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E827.SK))
		(!W2 (?I2 BEFORE E827.SK))
		(!W3 (?P1 AFTER E827.SK))
		(!W4 (?P2 AFTER E827.SK))
		(!W5 (?G1 CAUSE-OF E827.SK))
		(!W6 (E827.SK (BEFORE ?X_E)))
		(!W7 (E827.SK (BEFORE NOW214)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0 1)
("Chad was going out for a pass." "He was on in the parking lot."
 "Someone was guarding him." "He hit the ground hard." "His arm was broken.")
(EPI-SCHEMA ((CHAD.NAME
              ((ADV-A (FOR.P (KA (PICK_UP.V ?X_A))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.666.V)))
              ?L2)
             ** E827.SK)
	(:ROLES
		(!R1 (CHAD.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (?X_A PENNY.N))
		(!R6 (CHAD.NAME SON.N))
		(!R7 (?X_A (ON.P GROUND834.SK)))
		(!R8 (E827.SK (RIGHT-AFTER ?X_C)))
		(!R9 (CHAD.NAME (PERTAIN-TO ?X_D)))
		(!R10 (?X_D AGENT.N))
		(!R11 (PASS828.SK PASS.N))
		(!R12 (GROUND834.SK GROUND.N))
	)
	(:GOALS
		(?G1 (CHAD.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CHAD.NAME (AT.P ?L1)))
		(?I2 (NOT (CHAD.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CHAD.NAME (AT.P ?L1))))
		(?P2 (CHAD.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E827.SK))
		(!W2 (?I2 BEFORE E827.SK))
		(!W3 (?P1 AFTER E827.SK))
		(!W4 (?P2 AFTER E827.SK))
		(!W5 (?G1 CAUSE-OF E827.SK))
		(!W6 (E827.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E827.SK (BEFORE NOW214)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.0 1)
("Chad was going out for a pass." "He was on in the parking lot."
 "Someone was guarding him." "He hit the ground hard." "His arm was broken.")
(EPI-SCHEMA ((CHAD.NAME
              ((ADV-A (FOR.P (KA (BUY.V ?X_A))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_C)) GO.667.V)))
              ?L2)
             ** E827.SK)
	(:ROLES
		(!R1 (CHAD.NAME AGENT.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?X_C = ?L2)))
		(!R5 (?X_C ((NN BALL.N) GAME.N)))
		(!R6 (?X_A SNACK.N))
		(!R7 (ARM838.SK (PERTAIN-TO CHAD.NAME)))
		(!R8 (PASS828.SK PASS.N))
		(!R9 (ARM838.SK ARM.N))
		(!R10 (ARM838.SK (PERTAIN-TO HE.PRO)))
		(!R11 (HE.PRO MALE.A))
		(!R12 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (CHAD.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CHAD.NAME (AT.P ?X_C)))
		(?I2 (NOT (CHAD.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CHAD.NAME (AT.P ?X_C))))
		(?P2 (CHAD.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E827.SK))
		(!W2 (?I2 BEFORE E827.SK))
		(!W3 (?P1 AFTER E827.SK))
		(!W4 (?P2 AFTER E827.SK))
		(!W5 (?G1 CAUSE-OF E827.SK))
		(!W6 (?I1 (BEFORE ?X_F)))
		(!W7 (E827.SK (BEFORE ?X_H)))
		(!W8 (E827.SK (BEFORE NOW214)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 0)
("Chad was going out for a pass." "He was on in the parking lot."
 "Someone was guarding him." "He hit the ground hard." "His arm was broken.")
(EPI-SCHEMA ((CHAD.NAME
              ((ADV-A (FOR.P PASS828.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.668.V)))
              ?L2)
             ** E827.SK)
	(:ROLES
		(!R1 (CHAD.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (PASS828.SK WALK.N))
		(!R6 (PASS828.SK PASS.N))
	)
	(:GOALS
		(?G1 (CHAD.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CHAD.NAME (AT.P ?L1)))
		(?I2 (NOT (CHAD.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (CHAD.NAME (AT.P ?L1))))
		(?P2 (CHAD.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E827.SK))
		(!W2 (?I2 BEFORE E827.SK))
		(!W3 (?P1 AFTER E827.SK))
		(!W4 (?P2 AFTER E827.SK))
		(!W5 (?G1 CAUSE-OF E827.SK))
		(!W6 (E827.SK (BEFORE ?X_D)))
		(!W7 (E827.SK (BEFORE NOW214)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 44:
	; "Allie loved her device."
	; "She used it all the time."
	; "Then she found out she had ten percent left."
	; "It was not good."
	; "She was near done."
; best schemas are:
; GIVE.281.V
; TAKE.895.V
; SIT.211.V
; SIT.505.V
; SIT.49.V
; SIT.65.V

; story 45:
	; "Gary went to the pond."
	; "He cast his rod in it."
	; "He caught a fish."
	; "He pulled it up."
	; "It was actually a boot."
; best schemas are:
; GET.1260.V
; SIT.211.V
; SIT.505.V
; SIT.49.V
; SIT.65.V
; SIT.274.V

; story 46:
	; "Susie went to her sister's house."
	; "She heard too much yelling though."
	; "So she decided to leave."
	; "She couldn't take the yelling."
	; "It was to much for her."
; best schemas are:
; GO.671.V
; GET.413.V
; SIT.65.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; COME.126.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.539.V

; story 47:
	; "The boy sat at the table."
	; "He was expecting food."
	; "His mom saw him sitting there."
	; "She ignored him."
	; "The boy made his own food."
; best schemas are:
; GO.658.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; PLAY.V
; PLAY.920.V
; PLAY.679.V

; story 48:
	; "Susie loved Cheerios."
	; "But they weren't gluten free."
	; "So she couldn't eat them."
	; "Then she got a gluten free box."
	; "She loved it."
; best schemas are:
; RUN.401.V
; FLY.235.V
; GET.1260.V
; GET.88.V
; GIVE.194.V
; TAKE.413.V
(setf matches (append matches '(( (2.5 1)
("Susie loved Cheerios." "But they weren't gluten free."
 "So she couldn't eat them." "Then she got a gluten free box." "She loved it.")
(EPI-SCHEMA ((SUSIE.NAME GET.710.V
              (KA
               ((ADV-A
                 (WITH.P
                  (K
                   (L #:G1792470
                    (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
                (BE.PASV CATCH.V)))
              (AT.P-ARG ?L))
             ** E912.SK)
	(:ROLES
		(!R1 (SUSIE.NAME AGENT.N))
		(!R2
   ((KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_A (TOO.ADV MANY.A)) (?X_B FISH.N))))))
      (BE.PASV CATCH.V)))
    INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4
   (NOT
    (SUSIE.NAME =
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_C (TOO.ADV MANY.A)) (?X_D FISH.N))))))
       (BE.PASV CATCH.V))))))
		(!R5 (SUSIE.NAME MAN.N))
		(!R6 (?X_E LIMIT.N))
		(!R7 (?X_E (PERTAIN-TO SUSIE.NAME)))
		(!R8 (GLUTEN911.SK GLUTEN.A))
	)
	(:GOALS
		(?G1
   (SUSIE.NAME
    (WANT.V
     (THAT
      (SUSIE.NAME
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
    (SUSIE.NAME HAVE.V
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_H (TOO.ADV MANY.A)) (?X_I FISH.N))))))
       (BE.PASV CATCH.V))))))
		(?I2 (SUSIE.NAME (AT.P ?L)))
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
   (SUSIE.NAME HAVE.V
    (KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_M (TOO.ADV MANY.A)) (?X_N FISH.N))))))
      (BE.PASV CATCH.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E912.SK))
		(!W2 (?I1 PRECOND-OF E912.SK))
		(!W3 (?I2 PRECOND-OF E912.SK))
		(!W4 (?I3 PRECOND-OF E912.SK))
		(!W5 (?P1 POSTCOND-OF E912.SK))
		(!W6 (E912.SK (BEFORE ?X_P)))
		(!W7 (E912.SK (BEFORE NOW242)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.227813 5)
("Susie loved Cheerios." "But they weren't gluten free."
 "So she couldn't eat them." "Then she got a gluten free box." "She loved it.")
(EPI-SCHEMA ((SUSIE.NAME GET.711.V GLUTEN911.SK (AT.P-ARG ?L)) ** E912.SK)
	(:ROLES
		(!R1 (SUSIE.NAME AGENT.N))
		(!R2 (GLUTEN911.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (SUSIE.NAME = GLUTEN911.SK)))
		(!R5 (GLUTEN911.SK CAT.N))
		(!R6 (?X_H (RIGHT-AFTER ?X_A)))
		(!R7 (SUSIE.NAME WIFE.N))
		(!R8 (THEY915.SK CAT.N))
		(!R9 (SUSIE.NAME (PERTAIN-TO ?X_C)))
		(!R10 (?G1 (RIGHT-AFTER ?X_D)))
		(!R11 (GLUTEN911.SK GLUTEN.A))
		(!R12 (THEY915.SK AGENT.N))
	)
	(:GOALS
		(?G1 (SUSIE.NAME (WANT.V (THAT (SUSIE.NAME (HAVE.V GLUTEN911.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SUSIE.NAME HAVE.V GLUTEN911.SK)))
		(?I2 (SUSIE.NAME (AT.P ?L)))
		(?I3 (GLUTEN911.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (SUSIE.NAME HAVE.V GLUTEN911.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E912.SK))
		(!W2 (?I1 PRECOND-OF E912.SK))
		(!W3 (?I2 PRECOND-OF E912.SK))
		(!W4 (?I3 PRECOND-OF E912.SK))
		(!W5 (?P1 POSTCOND-OF E912.SK))
		(!W6 (E912.SK (BEFORE ?X_I)))
		(!W7 (?X_H (SAME-TIME ?X_I)))
		(!W8 (?G1 (SAME-TIME ?X_L)))
		(!W9 (?X_K (AT-ABOUT ?X_L)))
		(!W10 (E912.SK (BEFORE NOW242)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 49:
	; "The man cracked an egg."
	; "He put the egg in the pan."
	; "The yoke broke when it dropped."
	; "The man threw out the egg."
	; "The man cracked another egg."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; TAKE.1.V
; TAKE.10.V
; TAKE.135.V
; RUN.311.V
; GO.423.V

; story 50:
	; "I was at work."
	; "I was using the walking stacker."
	; "My friend stood in my way."
	; "He wanted me to get certified first."
	; "I almost ran him over."
; best schemas are:
; TAKE.413.V
; COME.239.V
; RUN.401.V
; COME.126.V
; COME.605.V
; FLY.235.V

; story 51:
	; "Fred wanted to go on a ride."
	; "But the park wouldn't let him."
	; "He was too short."
	; "He begged but they said no."
	; "So he had to find something else."
; best schemas are:
; GO.168.V
; GO.678.V
; RUN.929.V
; RUN.60.V
; TAKE.1270.V
; TRAVEL.V

; story 52:
	; "A song played on the radio."
	; "The man had not heard the song before."
	; "He liked the song."
	; "He called the radio."
	; "They told him the name of the artist."
discarding schema AVOID_ACTION_TO_AVOID_DISPLEASURE.626.V learned from this story
discarding schema AVOID_ACTION_TO_AVOID_DISPLEASURE.627.V learned from this story
; best schemas are:
; PLAY.402.V
; PLAY.431.V
; PLAY.437.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
(setf matches (append matches '(( (1.43625 4)
("A song played on the radio." "The man had not heard the song before."
 "He liked the song." "He called the radio."
 "They told him the name of the artist.")
(EPI-SCHEMA ((MAN973.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.825.V
              (KA (LIKE.V SONG967.SK)))
             ** ?E)
	(:ROLES
		(!R1 (MAN973.SK AGENT.N))
		(!R2 ((KA (LIKE.V SONG967.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (?X_A ((NN HAIR.N) CUT.N)))
		(!R5 (?X_A NEW.A))
		(!R6 (SONG967.SK ((NN HAIR.N) STYLIST.N)))
		(!R7 (SONG967.SK HAIR.N))
		(!R8 (SONG967.SK (PERTAIN-TO MAN973.SK)))
		(!R9 (SONG967.SK SONG.N))
		(!R10 (MAN973.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN973.SK (WANT.V (THAT (NOT (MAN973.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN973.SK LIKE.V SONG967.SK)) CAUSE-OF
    (KE (MAN973.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E979.SK (MAN973.SK LIKE.V SONG967.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E979.SK))
		(!W2 (?G1 (BEFORE ?X_E)))
		(!W3 (E979.SK (BEFORE ?X_G)))
		(!W4 (E979.SK (BEFORE NOW261)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 53:
	; "The man was wearing glasses."
	; "A rock hit the glasses."
	; "The glasses broke."
	; "He showed his friend."
	; "His friend said the glasses saved his eye."
; best schemas are:
; SPRINT.1181.V
; GET.73.V
; GO.642.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; TAKE.1.V
; TAKE.10.V

; story 54:
	; "I ate a big muffin."
	; "But it wouldn't go away!"
	; "There always seemed to be more!"
	; "So I ate more!"
	; "Now I'm sick to my stomach."
; best schemas are:
; FEED.660.V
; FLY.235.V
; GO.866.V
; GIVE.194.V
; TAKE.413.V
; GET.848.V

; story 55:
	; "Lucy was searching on YouTube."
	; "She found a great song."
	; "She listened to it all day."
	; "Lucy loved it."
	; "She wanted to buy the album."
discarding schema SEARCH.695.V learned from this story
discarding schema FIND.696.V learned from this story
; best schemas are:
; SEARCH.V
; GO_FIND_EAT.566.PR
; SHOP.797.V
; FIND.V
(setf matches (append matches '(( (2.0 4)
("Lucy was searching on YouTube." "She found a great song."
 "She listened to it all day." "Lucy loved it." "She wanted to buy the album.")
(EPI-SCHEMA ((LUCY.NAME GO_FIND_EAT.904.PR LUCY.NAME SONG1029.SK ?X_D) ** ?E)
	(:ROLES
		(!R1 (LUCY.NAME FIELD.N))
		(!R2 (SONG1029.SK (OF.P (K GRASS.N))))
		(!R3 (SONG1029.SK SPOT.N))
		(!R4 (LUCY.NAME COW.N))
		(!R5 (?X_D FOOD.N))
		(!R6 (?X_D GRASS.N))
		(!R7 (SONG1029.SK SONG.N))
		(!R8 (SONG1029.SK GREAT.A))
		(!R9 (SONG1029.SK ALBUM.N))
		(!R10 (SONG1029.SK ARTIFACT.N))
	)
	(:PRECONDS
		(?I1 (LUCY.NAME (AT.P ?L1_2)))
		(?I2 (NOT (LUCY.NAME (AT.P LUCY.NAME))))
	)
	(:STEPS
		(?E1
   (LUCY.NAME
    (OUT.ADV ((ADV-A (TO.P LUCY.NAME)) ((ADV-A (FROM.P ?L1)) GO.903.V)))
    LUCY.NAME))
		(E1032.SK (LUCY.NAME FIND.562.V SONG1029.SK))
		(?E3 (LUCY.NAME EAT.564.V ?X_D))
	)
	(:POSTCONDS
		(?P1 (NOT (LUCY.NAME (HAVE.V ?X_D))))
		(?P2 (NOT (LUCY.NAME HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE E1032.SK))
		(!W2 (E1032.SK BEFORE ?E3))
		(!W3 (E1032.SK (BEFORE NOW275)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R3 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_A<- ?E1) = SONG1029.SK))
		(!S2 ((?X_B<- ?E1) = LUCY.NAME))
		(!S3 ((?X_C<- ?E1) = E1041.SK))
		(!S4 ((?X_E<- ?E1) = NOW278))
		(!S5 ((?E1<- ?E1) = ?E1))
	)
)
))))
(setf matches (append matches '(( (3.5 2)
("Lucy was searching on YouTube." "She found a great song."
 "She listened to it all day." "Lucy loved it." "She wanted to buy the album.")
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-A (ON.P YOUTUBE.NAME))
               ((ADV-A (FOR.P (K (PLUR PANT.N)))) (BE.PASV SHOP.919.V))))
             ** E1024.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?LX LOCATION.N))
		(!R3 (?LO LOCATION.N))
		(!R4 (E1024.SK (RIGHT-AFTER ?X_A)))
		(!R5 (LUCY.NAME MAN.N))
		(!R6 (SONG1029.SK SONG.N))
		(!R7 (SONG1029.SK GREAT.A))
		(!R8 (SONG1029.SK ALBUM.N))
	)
	(:GOALS
		(E1041.SK (LUCY.NAME (WANT.V (KA (FIND.V (K (PLUR PANT.N)))))))
		(?G2 (LUCY.NAME (WANT.V (KA (HAVE.V (K (PLUR PANT.N)))))))
	)
	(:PRECONDS
		(?I1 (LUCY.NAME (AT.P ?LX)))
		(?I2 ((K (PLUR PANT.N)) (AT.P ?LO)))
		(?I3 (NOT (LUCY.NAME (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?LO)))))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E1032.SK (LUCY.NAME (FIND.V (K (PLUR PANT.N)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1024.SK (SAME-TIME ?X_D)))
		(!W2 (E1032.SK (BEFORE ?X_F)))
		(!W3 (E1024.SK (BEFORE NOW274)))
		(!W4 (E1032.SK (BEFORE NOW275)))
		(!W5 (E1041.SK (BEFORE NOW278)))
	)
)
))))

; story 56:
	; "There was a box in the garage."
	; "I didn't know what was inside."
	; "I asked my father to open it."
	; "He opened the box for me."
	; "There was blank paper in the box."
; best schemas are:
; GO.866.V
; GO.423.V
; FLY.235.V
; GO.1083.V
; RUN.58.V
; RIDE.438.V

; story 57:
	; "Kara wanted to go swimming."
	; "She went to the lake."
	; "There, she dove into the water."
	; "She swam for almost an hour!"
	; "After, she felt refreshed and happy."
discarding schema GO.781.V learned from this story
; best schemas are:
; WALK.1063.V
; GO.253.V
; TAKE.928.V
; GET.338.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
(setf matches (append matches '(( (4.5 3)
("Kara wanted to go swimming." "She went to the lake."
 "There, she dove into the water." "She swam for almost an hour!"
 "After, she felt refreshed and happy.")
(EPI-SCHEMA ((KARA.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K SWIMMING.N))) GO.991.V))
              (K SWIMMING.N))
             ** E1064.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K SWIMMING.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K SWIMMING.N))))
		(!R4 (KARA.NAME AGENT.N))
		(!R5 (?X_A (PERTAIN-TO KARA.NAME)))
		(!R6 (?X_A ((NN (PLUR TOOTH.N)) CHATTER.N)))
		(!R7 (LAKE1063.SK LAKE.N))
	)
	(:GOALS
		(E1061.SK (KARA.NAME (WANT.V (KA ((ADV-A (AT.P (K SWIMMING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (KARA.NAME (AT.P ?L1)))
		(?I2 (NOT (KARA.NAME (AT.P (K SWIMMING.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (KARA.NAME (AT.P ?L1))))
		(?P2 (KARA.NAME (AT.P (K SWIMMING.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1064.SK))
		(!W2 (?I2 BEFORE E1064.SK))
		(!W3 (?P1 AFTER E1064.SK))
		(!W4 (?P2 AFTER E1064.SK))
		(!W5 (E1061.SK CAUSE-OF E1064.SK))
		(!W6 (E1064.SK (BEFORE ?X_D)))
		(!W7 (E1061.SK (BEFORE NOW284)))
		(!W8 (E1064.SK (BEFORE NOW285)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 58:
	; "The man ran very fast."
	; "He stopped to catch his breath."
	; "He was more tired than he thought."
	; "He sat down for a break."
	; "He didn't feel like running after that."
discarding schema AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V learned from this story
discarding schema SIT.784.V learned from this story
discarding schema RUN.794.V learned from this story
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; GET.1260.V
; GO.866.V
(setf matches (append matches '(( (3.405 3)
("The man ran very fast." "He stopped to catch his breath."
 "He was more tired than he thought." "He sat down for a break."
 "He didn't feel like running after that.")
(EPI-SCHEMA ((MAN1073.SK
              (VERY.ADV
               (FAST.ADV
                ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) RUN.1004.V))))
              ?X_C)
             ** E1072.SK)
	(:ROLES
		(!R1 (MAN1073.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (?X_A (PLUR PERSON.N)))
		(!R6 (MAN1073.SK FRIEND.N))
		(!R7 (MAN1073.SK (PERTAIN-TO MAN1073.SK)))
		(!R8 (BREATH1077.SK EYE.N))
		(!R9 (MAN1073.SK MAN.N))
		(!R10 (MAN1073.SK PERSON.N))
		(!R11 (BREATH1077.SK (PERTAIN-TO MAN1073.SK)))
		(!R12 (BREATH1077.SK BREATH.N))
	)
	(:GOALS
		(?G1 (MAN1073.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1073.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1073.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1073.SK (AT.P ?L1))))
		(?P2 (MAN1073.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1072.SK))
		(!W2 (?I2 BEFORE E1072.SK))
		(!W3 (?P1 AFTER E1072.SK))
		(!W4 (?P2 AFTER E1072.SK))
		(!W5 (?G1 CAUSE-OF E1072.SK))
		(!W6 (E1072.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E1072.SK (BEFORE NOW289)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R10 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R9 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R10 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C7 (!R9 CERTAIN-TO-DEGREE (/ 1 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 59:
	; "The man shopped for pants."
	; "He couldn't find any that fit."
	; "He found a big and tall store."
	; "He found some pants that fit."
	; "He bought some pants there."
discarding schema SHOP.797.V learned from this story
discarding schema FIND.798.V learned from this story
; best schemas are:
; FIND.773.V
; FIND.888.V
; FIND.1361.V
; FIND.1005.V
(setf matches (append matches '(( (2.905 1)
("The man shopped for pants." "He couldn't find any that fit."
 "He found a big and tall store." "He found some pants that fit."
 "He bought some pants there.")
(EPI-SCHEMA ((MAN1092.SK ((ADV-A (ON.P ?X_A)) FIND.1005.V) (K (PLUR PANT.N)))
             ** E1097.SK)
	(:ROLES
		(!R1 (MAN1092.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (?X_A GROUND.N))
		(!R4 ((K (PLUR PANT.N)) BAG.N))
		(!R5 (E1097.SK (RIGHT-AFTER ?X_B)))
		(!R6 (?X_C (PERTAIN-TO MAN1092.SK)))
		(!R7 (?X_C WIFE.N))
		(!R8 (E1091.SK (RIGHT-AFTER U293)))
		(!R9 (MAN1092.SK MAN.N))
	)
	(:PRECONDS
		(?I1 (MAN1092.SK (AT.P ?L)))
		(?I2 ((K (PLUR PANT.N)) (AT.P ?L)))
		(E1091.SK (MAN1092.SK (BE.PASV ((ADV-A (FOR.P (K (PLUR PANT.N)))) SEARCH.V))))
		(?I4 (NOT (MAN1092.SK (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?L)))))))
		(?I5 (NOT (MAN1092.SK (HAVE.V (K (PLUR PANT.N))))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1092.SK (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?L))))))
		(?P2 (MAN1092.SK (HAVE.V (K (PLUR PANT.N)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1097.SK (SAME-TIME ?X_H)))
		(!W2 (?X_G (BEFORE ?X_H)))
		(!W3 (E1091.SK (SAME-TIME NOW294)))
		(!W4 (E1097.SK (BEFORE NOW296)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 1)
("The man shopped for pants." "He couldn't find any that fit."
 "He found a big and tall store." "He found some pants that fit."
 "He bought some pants there.")
(EPI-SCHEMA ((MAN1092.SK FIND.1006.V (K (PLUR PANT.N))) ** E1097.SK)
	(:ROLES
		(!R1 (MAN1092.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 ((K (PLUR PANT.N)) ANSWER.N))
		(!R4 (E1097.SK (RIGHT-AFTER ?X_A)))
		(!R5 (?X_B STREET.N))
		(!R6 (MAN1092.SK (IN.P ?X_B)))
		(!R7 (E1091.SK (RIGHT-AFTER U293)))
		(!R8 (MAN1092.SK MAN.N))
	)
	(:PRECONDS
		(?I1 (MAN1092.SK (AT.P ?L)))
		(?I2 ((K (PLUR PANT.N)) (AT.P ?L)))
		(E1091.SK (MAN1092.SK (BE.PASV ((ADV-A (FOR.P (K (PLUR PANT.N)))) SEARCH.V))))
		(?I4 (NOT (MAN1092.SK (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?L)))))))
		(?I5 (NOT (MAN1092.SK (HAVE.V (K (PLUR PANT.N))))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1092.SK (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?L))))))
		(?P2 (MAN1092.SK (HAVE.V (K (PLUR PANT.N)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1097.SK (SAME-TIME ?X_G)))
		(!W2 (?X_F (BEFORE ?X_G)))
		(!W3 (E1091.SK (SAME-TIME NOW294)))
		(!W4 (E1097.SK (BEFORE NOW296)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 1)
("The man shopped for pants." "He couldn't find any that fit."
 "He found a big and tall store." "He found some pants that fit."
 "He bought some pants there.")
(EPI-SCHEMA ((MAN1092.SK FIND.1007.V (K (PLUR PANT.N))) ** E1097.SK)
	(:ROLES
		(!R1 (MAN1092.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 ((K (PLUR PANT.N)) ((NN GAS.N) STATION.N)))
		(!R4 (?X_A PHONE.N))
		(!R5 (?X_A (PERTAIN-TO MAN1092.SK)))
		(!R6 (E1091.SK (RIGHT-AFTER U293)))
		(!R7 (MAN1092.SK MAN.N))
	)
	(:PRECONDS
		(?I1 (MAN1092.SK (AT.P ?L)))
		(?I2 ((K (PLUR PANT.N)) (AT.P ?L)))
		(E1091.SK (MAN1092.SK (BE.PASV ((ADV-A (FOR.P (K (PLUR PANT.N)))) SEARCH.V))))
		(?I4 (NOT (MAN1092.SK (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?L)))))))
		(?I5 (NOT (MAN1092.SK (HAVE.V (K (PLUR PANT.N))))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1092.SK (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?L))))))
		(?P2 (MAN1092.SK (HAVE.V (K (PLUR PANT.N)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1097.SK (BEFORE ?X_E)))
		(!W2 (E1091.SK (SAME-TIME NOW294)))
		(!W3 (E1097.SK (BEFORE NOW296)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.405 1)
("The man shopped for pants." "He couldn't find any that fit."
 "He found a big and tall store." "He found some pants that fit."
 "He bought some pants there.")
(EPI-SCHEMA ((MAN1092.SK ((ADV-A (ON.P ?X_A)) FIND.1008.V) (K (PLUR PANT.N)))
             ** E1097.SK)
	(:ROLES
		(!R1 (MAN1092.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (?X_A GROUND.N))
		(!R4 ((K (PLUR PANT.N)) BAG.N))
		(!R5 (E1097.SK (RIGHT-AFTER ?X_B)))
		(!R6 (?X_C (PERTAIN-TO MAN1092.SK)))
		(!R7 (?X_C WIFE.N))
		(!R8 (MAN1092.SK MAN.N))
		(!R9 (E1091.SK (RIGHT-AFTER U293)))
	)
	(:PRECONDS
		(?I1 (MAN1092.SK (AT.P ?L)))
		(?I2 ((K (PLUR PANT.N)) (AT.P ?L)))
		(E1091.SK (MAN1092.SK (BE.PASV ((ADV-A (FOR.P (K (PLUR PANT.N)))) SEARCH.V))))
		(?I4 (NOT (MAN1092.SK (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?L)))))))
		(?I5 (NOT (MAN1092.SK (HAVE.V (K (PLUR PANT.N))))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1092.SK (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?L))))))
		(?P2 (MAN1092.SK (HAVE.V (K (PLUR PANT.N)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1097.SK (SAME-TIME ?X_H)))
		(!W2 (?X_G (BEFORE ?X_H)))
		(!W3 (E1091.SK (SAME-TIME ?X_I)))
		(!W4 (E1097.SK (BEFORE ?X_K)))
		(!W5 (E1097.SK (BEFORE NOW296)))
		(!W6 (E1091.SK (SAME-TIME NOW294)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 60:
	; "Julie's dog was always cold."
	; "She gave her a dog sweater."
	; "The dog loved it!"
	; "She could run around outside in the cold."
	; "Julie liked to see her dog happy."
discarding schema GIVE.800.V learned from this story
; best schemas are:
; GIVE.V
; RUN.179.V
; RUN.179.V
; GET.826.V
; GET.218.V

; story 61:
	; "My son had just started eating foods."
	; "We gave him some peaches to start out on."
	; "He loved them."
	; "I think he got more on him than in him."
	; "It was really funny."
; best schemas are:
; GO.866.V
; COME.126.V
; FLY.235.V
; GIVE.194.V
; TAKE.413.V
; GO.742.V

; story 62:
	; "I went to the mall yesterday."
	; "I thought there was a sale."
	; "So I showed up at the store."
	; "There was no sale."
	; "I was so upset."
discarding schema GO.828.V learned from this story
; best schemas are:
; GO.866.V
; TAKE.1039.V
; FLY.235.V
; GO.90.V
; GO.658.V
(setf matches (append matches '(( (3.7278125 3)
("I went to the mall yesterday." "I thought there was a sale."
 "So I showed up at the store." "There was no sale." "I was so upset.")
(EPI-SCHEMA ((ME1157.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P MALL1142.SK)) ((ADV-A (FROM.P ?L1)) GO.1048.V)))
              MALL1142.SK)
             ** E1144.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (MALL1142.SK LOCATION.N))
		(!R3 (NOT (?L1 = MALL1142.SK)))
		(!R4 (?X_A (PLUR PERSON.N)))
		(!R5 (ME1157.SK FRIEND.N))
		(!R6 (ME1157.SK (PERTAIN-TO ?X_B)))
		(!R7 (?X_B MAN.N))
		(!R8 (?X_F (PERTAIN-TO ?X_B)))
		(!R9 (?X_F EYE.N))
		(!R10 (ME1157.SK AGENT.N))
		(!R11 (MALL1142.SK MALL.N))
		(!R12 (MALL1142.SK STORE.N))
	)
	(:GOALS
		(?G1 (ME1157.SK (WANT.V (KA ((ADV-A (AT.P MALL1142.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1157.SK (AT.P ?L1)))
		(?I2 (NOT (ME1157.SK (AT.P MALL1142.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1157.SK (AT.P ?L1))))
		(?P2 (ME1157.SK (AT.P MALL1142.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1144.SK))
		(!W2 (?I2 BEFORE E1144.SK))
		(!W3 (?P1 AFTER E1144.SK))
		(!W4 (?P2 AFTER E1144.SK))
		(!W5 (?G1 CAUSE-OF E1144.SK))
		(!W6 (E1144.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E1144.SK (BEFORE NOW309)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.1834373 3)
("I went to the mall yesterday." "I thought there was a sale."
 "So I showed up at the store." "There was no sale." "I was so upset.")
(EPI-SCHEMA ((ME1157.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P MALL1142.SK)) (AWAY.ADV FLY.1050.V))))
              MALL1142.SK)
             ** E1144.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (MALL1142.SK LOCATION.N))
		(!R3 (NOT (?L1 = MALL1142.SK)))
		(!R4 (ME1157.SK ((NN MOTHER.N) BIRD.N)))
		(!R5 (ME1157.SK BIRD.N))
		(!R6 (ME1157.SK ((NN BABY.N) BIRD.N)))
		(!R7 (ME1157.SK AGENT.N))
		(!R8 (MALL1142.SK MALL.N))
		(!R9 (MALL1142.SK STORE.N))
	)
	(:GOALS
		(?G1 (ME1157.SK (WANT.V (KA ((ADV-A (AT.P MALL1142.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1157.SK (AT.P ?L1)))
		(?I2 (NOT (ME1157.SK (AT.P MALL1142.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1157.SK (AT.P ?L1))))
		(?P2 (ME1157.SK (AT.P MALL1142.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1144.SK))
		(!W2 (?I2 BEFORE E1144.SK))
		(!W3 (?P1 AFTER E1144.SK))
		(!W4 (?P2 AFTER E1144.SK))
		(!W5 (?G1 CAUSE-OF E1144.SK))
		(!W6 (E1144.SK (BEFORE ?X_C)))
		(!W7 (E1144.SK (BEFORE NOW309)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 3)
("I went to the mall yesterday." "I thought there was a sale."
 "So I showed up at the store." "There was no sale." "I was so upset.")
(EPI-SCHEMA ((ME1157.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P MALL1142.SK)) ((ADV-A (FROM.P ?L1)) GO.1051.V)))
              MALL1142.SK)
             ** E1144.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (MALL1142.SK LOCATION.N))
		(!R3 (NOT (?L1 = MALL1142.SK)))
		(!R4 (ME1157.SK AGENT.N))
		(!R5 (MALL1142.SK MALL.N))
		(!R6 (MALL1142.SK STORE.N))
	)
	(:GOALS
		(?G1 (ME1157.SK (WANT.V (KA ((ADV-A (AT.P MALL1142.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1157.SK (AT.P ?L1)))
		(?I2 (NOT (ME1157.SK (AT.P MALL1142.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1157.SK (AT.P ?L1))))
		(?P2 (ME1157.SK (AT.P MALL1142.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1144.SK))
		(!W2 (?I2 BEFORE E1144.SK))
		(!W3 (?P1 AFTER E1144.SK))
		(!W4 (?P2 AFTER E1144.SK))
		(!W5 (?G1 CAUSE-OF E1144.SK))
		(!W6 (E1144.SK (BEFORE ?X_D)))
		(!W7 (E1144.SK (BEFORE NOW309)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.5 5)
("I went to the mall yesterday." "I thought there was a sale."
 "So I showed up at the store." "There was no sale." "I was so upset.")
(EPI-SCHEMA ((ME1157.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P MALL1142.SK)) ((ADV-A (FROM.P ?L1)) GO.1052.V)))
              MALL1142.SK)
             ** E1144.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (MALL1142.SK LOCATION.N))
		(!R3 (NOT (?L1 = MALL1142.SK)))
		(!R4 (MALL1142.SK ((NN SHOE.N) STORE.N)))
		(!R5 (ME1157.SK LITTLE.A))
		(!R6 (ME1157.SK BOY.N))
		(!R7 (?X_A (PERTAIN-TO ME1157.SK)))
		(!R8 (?X_A ((NN MOM.N) (PLUR SHOE.N))))
		(!R9 (ME1157.SK AGENT.N))
		(!R10 (MALL1142.SK MALL.N))
		(!R11 (MALL1142.SK STORE.N))
	)
	(:GOALS
		(?G1 (ME1157.SK (WANT.V (KA ((ADV-A (AT.P MALL1142.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1157.SK (AT.P ?L1)))
		(?I2 (NOT (ME1157.SK (AT.P MALL1142.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1157.SK (AT.P ?L1))))
		(?P2 (ME1157.SK (AT.P MALL1142.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1144.SK))
		(!W2 (?I2 BEFORE E1144.SK))
		(!W3 (?P1 AFTER E1144.SK))
		(!W4 (?P2 AFTER E1144.SK))
		(!W5 (?G1 CAUSE-OF E1144.SK))
		(!W6 (E1144.SK (BEFORE ?X_D)))
		(!W7 (E1144.SK (BEFORE ?X_F)))
		(!W8 (?G1 (BEFORE ?X_H)))
		(!W9 (E1144.SK (BEFORE NOW309)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 63:
	; "Tom noticed a stray cat."
	; "He thought it might be friendly."
	; "Tom tried to go up and pet it."
	; "The cat scratched at him."
	; "Tom left it alone."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
; RUN.28.V
; RUN.229.V
; RUN.254.V
; FEED.660.V
; TAKE.895.V

; story 64:
	; "Kim needed some new chairs."
	; "She threw away her old ones."
	; "Kim went to the store and got more."
	; "She set up her chairs."
	; "They looked nice."
; best schemas are:
; GO.90.V
; GO.591.V
; GO.658.V
; GO.806.V
; GO.1220.V
; GO.387.V
(setf matches (append matches '(( (4.0 3)
("Kim needed some new chairs." "She threw away her old ones."
 "Kim went to the store and got more." "She set up her chairs."
 "They looked nice.")
(EPI-SCHEMA ((KIM.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE1180.SK)) ((ADV-A (FROM.P ?L1)) GO.1065.V)))
              STORE1180.SK)
             ** E1182.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE1180.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE1180.SK)))
		(!R4 (KIM.NAME AGENT.N))
		(!R5 (STORE1180.SK STORE.N))
		(!R6 (OBJECT1177.SK (PERTAIN-TO KIM.NAME)))
	)
	(:GOALS
		(?G1 (KIM.NAME (WANT.V (KA ((ADV-A (AT.P STORE1180.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (KIM.NAME (AT.P ?L1)))
		(?I2 (NOT (KIM.NAME (AT.P STORE1180.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (KIM.NAME (AT.P ?L1))))
		(?P2 (KIM.NAME (AT.P STORE1180.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1182.SK))
		(!W2 (?I2 BEFORE E1182.SK))
		(!W3 (?P1 AFTER E1182.SK))
		(!W4 (?P2 AFTER E1182.SK))
		(!W5 (?G1 CAUSE-OF E1182.SK))
		(!W6 (E1182.SK (BEFORE ?X_D)))
		(!W7 (E1182.SK (BEFORE NOW321)))
		(!W8 (OBJECT1181.SK (BEFORE NOW321)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.5 7)
("Kim needed some new chairs." "She threw away her old ones."
 "Kim went to the store and got more." "She set up her chairs."
 "They looked nice.")
(EPI-SCHEMA ((KIM.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE1180.SK)) ((ADV-A (FROM.P ?L1)) GO.1067.V)))
              STORE1180.SK)
             ** E1182.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE1180.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE1180.SK)))
		(!R4 (KIM.NAME AGENT.N))
		(!R5 (STORE1180.SK ((NN SHOE.N) STORE.N)))
		(!R6 (KIM.NAME LITTLE.A))
		(!R7 (KIM.NAME BOY.N))
		(!R8 (CHAIR1174.SK (PERTAIN-TO KIM.NAME)))
		(!R9 (CHAIR1174.SK ((NN MOM.N) (PLUR SHOE.N))))
		(!R10 (STORE1180.SK STORE.N))
		(!R11 (OBJECT1177.SK (PERTAIN-TO KIM.NAME)))
		(!R12 (CHAIR1174.SK (PLUR CHAIR.N)))
		(!R13 (CHAIR1174.SK NEW.A))
	)
	(:GOALS
		(?G1 (KIM.NAME (WANT.V (KA ((ADV-A (AT.P STORE1180.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (KIM.NAME (AT.P ?L1)))
		(?I2 (NOT (KIM.NAME (AT.P STORE1180.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (KIM.NAME (AT.P ?L1))))
		(?P2 (KIM.NAME (AT.P STORE1180.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1182.SK))
		(!W2 (?I2 BEFORE E1182.SK))
		(!W3 (?P1 AFTER E1182.SK))
		(!W4 (?P2 AFTER E1182.SK))
		(!W5 (?G1 CAUSE-OF E1182.SK))
		(!W6 (E1182.SK (BEFORE ?X_D)))
		(!W7 (E1182.SK (BEFORE ?X_F)))
		(!W8 (?G1 (BEFORE ?X_H)))
		(!W9 (E1182.SK (BEFORE NOW321)))
		(!W10 (OBJECT1181.SK (BEFORE NOW321)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 3)
("Kim needed some new chairs." "She threw away her old ones."
 "Kim went to the store and got more." "She set up her chairs."
 "They looked nice.")
(EPI-SCHEMA ((KIM.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE1180.SK)) GO.1069.V))
              STORE1180.SK)
             ** E1182.SK)
	(:ROLES
		(!R1 (KIM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE1180.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE1180.SK)))
		(!R5 (STORE1180.SK STORE.N))
		(!R6 (OBJECT1177.SK (PERTAIN-TO KIM.NAME)))
	)
	(:GOALS
		(?G1 (KIM.NAME (WANT.V (KA ((ADV-A (AT.P STORE1180.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (KIM.NAME (AT.P ?L1)))
		(?I2 (NOT (KIM.NAME (AT.P STORE1180.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (KIM.NAME (AT.P ?L1))))
		(?P2 (KIM.NAME (AT.P STORE1180.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1182.SK))
		(!W2 (?I2 BEFORE E1182.SK))
		(!W3 (?P1 AFTER E1182.SK))
		(!W4 (?P2 AFTER E1182.SK))
		(!W5 (?G1 CAUSE-OF E1182.SK))
		(!W6 (E1182.SK (BEFORE ?X_D)))
		(!W7 (E1182.SK (BEFORE NOW321)))
		(!W8 (OBJECT1181.SK (BEFORE NOW321)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 7)
("Kim needed some new chairs." "She threw away her old ones."
 "Kim went to the store and got more." "She set up her chairs."
 "They looked nice.")
(EPI-SCHEMA ((KIM.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE1180.SK)) GO.1070.V))
              STORE1180.SK)
             ** E1182.SK)
	(:ROLES
		(!R1 (KIM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE1180.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE1180.SK)))
		(!R5 (CHAIR1174.SK ((NN HAIR.N) CUT.N)))
		(!R6 (STORE1180.SK ((NN HAIR.N) STYLIST.N)))
		(!R7 (STORE1180.SK HAIR.N))
		(!R8 (STORE1180.SK (PERTAIN-TO KIM.NAME)))
		(!R9 (STORE1180.SK STORE.N))
		(!R10 (OBJECT1177.SK (PERTAIN-TO KIM.NAME)))
		(!R11 (CHAIR1174.SK (PLUR CHAIR.N)))
		(!R12 (CHAIR1174.SK NEW.A))
	)
	(:GOALS
		(?G1 (KIM.NAME (WANT.V (KA ((ADV-A (AT.P STORE1180.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (KIM.NAME (AT.P ?L1)))
		(?I2 (NOT (KIM.NAME (AT.P STORE1180.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (KIM.NAME (AT.P ?L1))))
		(?P2 (KIM.NAME (AT.P STORE1180.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1182.SK))
		(!W2 (?I2 BEFORE E1182.SK))
		(!W3 (?P1 AFTER E1182.SK))
		(!W4 (?P2 AFTER E1182.SK))
		(!W5 (?G1 CAUSE-OF E1182.SK))
		(!W6 (E1182.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E1182.SK (BEFORE NOW321)))
		(!W9 (OBJECT1181.SK (BEFORE NOW321)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 65:
	; "A new restaurant opened in town."
	; "I was eager to try it."
	; "It looked good."
	; "So I went to it."
	; "But the line was so long I ended up leaving."
discarding schema GO.843.V learned from this story
; best schemas are:
; GO.591.V
; GO.866.V
; TAKE.1039.V
; FLY.235.V
; GO.387.V
(setf matches (append matches '(( (5.0 4)
("A new restaurant opened in town." "I was eager to try it." "It looked good."
 "So I went to it." "But the line was so long I ended up leaving.")
(EPI-SCHEMA ((ME1198.SK
              ((ADV-A (FROM.P ?L1))
               ((ADV-A (TO.P RESTAURANT1189.SK)) GO.1071.V))
              RESTAURANT1189.SK)
             ** E1193.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (RESTAURANT1189.SK LOCATION.N))
		(!R3 (NOT (?L1 = RESTAURANT1189.SK)))
		(!R4 (RESTAURANT1189.SK ((NN PIZZA.N) PLACE.N)))
		(!R5 (RESTAURANT1189.SK ((ADV-A (IN.P (K TOWN.N))) (BE.PASV OPEN.V))))
		(!R6 (RESTAURANT1189.SK NEW.A))
		(!R7 (RESTAURANT1189.SK RESTAURANT.N))
		(!R8 (ME1198.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME1198.SK (WANT.V (KA ((ADV-A (AT.P RESTAURANT1189.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1198.SK (AT.P ?L1)))
		(?I2 (NOT (ME1198.SK (AT.P RESTAURANT1189.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1198.SK (AT.P ?L1))))
		(?P2 (ME1198.SK (AT.P RESTAURANT1189.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1193.SK))
		(!W2 (?I2 BEFORE E1193.SK))
		(!W3 (?P1 AFTER E1193.SK))
		(!W4 (?P2 AFTER E1193.SK))
		(!W5 (?G1 CAUSE-OF E1193.SK))
		(!W6 (E1193.SK (BEFORE ?X_D)))
		(!W7 (E1193.SK (BEFORE NOW327)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.7278125 3)
("A new restaurant opened in town." "I was eager to try it." "It looked good."
 "So I went to it." "But the line was so long I ended up leaving.")
(EPI-SCHEMA ((ME1198.SK
              ((ADV-A (FROM.P ?L1))
               ((ADV-A (TO.P RESTAURANT1189.SK)) GO.1072.V))
              RESTAURANT1189.SK)
             ** E1193.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (RESTAURANT1189.SK LOCATION.N))
		(!R3 (NOT (?L1 = RESTAURANT1189.SK)))
		(!R4 (?X_A (PLUR PERSON.N)))
		(!R5 (ME1198.SK FRIEND.N))
		(!R6 (ME1198.SK (PERTAIN-TO ?X_B)))
		(!R7 (?X_B MAN.N))
		(!R8 (?X_F (PERTAIN-TO ?X_B)))
		(!R9 (?X_F EYE.N))
		(!R10 (RESTAURANT1189.SK ((ADV-A (IN.P (K TOWN.N))) (BE.PASV OPEN.V))))
		(!R11 (RESTAURANT1189.SK NEW.A))
		(!R12 (RESTAURANT1189.SK RESTAURANT.N))
		(!R13 (ME1198.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME1198.SK (WANT.V (KA ((ADV-A (AT.P RESTAURANT1189.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1198.SK (AT.P ?L1)))
		(?I2 (NOT (ME1198.SK (AT.P RESTAURANT1189.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1198.SK (AT.P ?L1))))
		(?P2 (ME1198.SK (AT.P RESTAURANT1189.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1193.SK))
		(!W2 (?I2 BEFORE E1193.SK))
		(!W3 (?P1 AFTER E1193.SK))
		(!W4 (?P2 AFTER E1193.SK))
		(!W5 (?G1 CAUSE-OF E1193.SK))
		(!W6 (E1193.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E1193.SK (BEFORE NOW327)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.1834373 3)
("A new restaurant opened in town." "I was eager to try it." "It looked good."
 "So I went to it." "But the line was so long I ended up leaving.")
(EPI-SCHEMA ((ME1198.SK
              (AWAY.ADV
               ((ADV-A (TO.P RESTAURANT1189.SK))
                ((ADV-A (FROM.P ?L1)) FLY.1073.V)))
              RESTAURANT1189.SK)
             ** E1193.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (RESTAURANT1189.SK LOCATION.N))
		(!R3 (NOT (?L1 = RESTAURANT1189.SK)))
		(!R4 (ME1198.SK ((NN MOTHER.N) BIRD.N)))
		(!R5 (ME1198.SK BIRD.N))
		(!R6 (ME1198.SK ((NN BABY.N) BIRD.N)))
		(!R7 (RESTAURANT1189.SK ((ADV-A (IN.P (K TOWN.N))) (BE.PASV OPEN.V))))
		(!R8 (RESTAURANT1189.SK NEW.A))
		(!R9 (RESTAURANT1189.SK RESTAURANT.N))
		(!R10 (ME1198.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME1198.SK (WANT.V (KA ((ADV-A (AT.P RESTAURANT1189.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1198.SK (AT.P ?L1)))
		(?I2 (NOT (ME1198.SK (AT.P RESTAURANT1189.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1198.SK (AT.P ?L1))))
		(?P2 (ME1198.SK (AT.P RESTAURANT1189.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1193.SK))
		(!W2 (?I2 BEFORE E1193.SK))
		(!W3 (?P1 AFTER E1193.SK))
		(!W4 (?P2 AFTER E1193.SK))
		(!W5 (?G1 CAUSE-OF E1193.SK))
		(!W6 (E1193.SK (BEFORE ?X_C)))
		(!W7 (E1193.SK (BEFORE NOW327)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 7)
("A new restaurant opened in town." "I was eager to try it." "It looked good."
 "So I went to it." "But the line was so long I ended up leaving.")
(EPI-SCHEMA ((ME1198.SK
              ((ADV-A (FROM.P ?L1))
               ((ADV-A (TO.P RESTAURANT1189.SK)) GO.1074.V))
              RESTAURANT1189.SK)
             ** E1193.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (RESTAURANT1189.SK LOCATION.N))
		(!R3 (NOT (?L1 = RESTAURANT1189.SK)))
		(!R4 (RESTAURANT1189.SK ((NN HAIR.N) CUT.N)))
		(!R5 (RESTAURANT1189.SK ((NN HAIR.N) STYLIST.N)))
		(!R6 (RESTAURANT1189.SK HAIR.N))
		(!R7 (RESTAURANT1189.SK (PERTAIN-TO ME1198.SK)))
		(!R8 (ME1198.SK AGENT.N))
		(!R9 (RESTAURANT1189.SK ((ADV-A (IN.P (K TOWN.N))) (BE.PASV OPEN.V))))
		(!R10 (RESTAURANT1189.SK NEW.A))
		(!R11 (RESTAURANT1189.SK RESTAURANT.N))
	)
	(:GOALS
		(?G1 (ME1198.SK (WANT.V (KA ((ADV-A (AT.P RESTAURANT1189.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1198.SK (AT.P ?L1)))
		(?I2 (NOT (ME1198.SK (AT.P RESTAURANT1189.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (ME1198.SK (AT.P ?L1))))
		(?P2 (ME1198.SK (AT.P RESTAURANT1189.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1193.SK))
		(!W2 (?I2 BEFORE E1193.SK))
		(!W3 (?P1 AFTER E1193.SK))
		(!W4 (?P2 AFTER E1193.SK))
		(!W5 (?G1 CAUSE-OF E1193.SK))
		(!W6 (E1193.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E1193.SK (BEFORE NOW327)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 66:
	; "It was my son's first birthday."
	; "I cannot believe how fast it has gone by."
	; "He is getting so big."
	; "He got a smash cake for himself."
	; "He loved it."
; best schemas are:
; TAKE.1039.V
; RUN.401.V
; FLY.235.V
; GET.848.V
; GO.866.V
; GET.1260.V
(setf matches (append matches '(( (4.9231253 7)
("It was my son's first birthday." "I cannot believe how fast it has gone by."
 "He is getting so big." "He got a smash cake for himself." "He loved it.")
(EPI-SCHEMA ((HE.PRO GET.1075.V CAKE1206.SK (AT.P-ARG ?L)) ** E1207.SK)
	(:ROLES
		(!R1 (CAKE1206.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = CAKE1206.SK)))
		(!R4 (?X_A LIST.N))
		(!R5 (HIMSELF1211.SK BIRTHDAY.N))
		(!R6 (?X_B (= (K (PLUR THING.N)))))
		(!R7 (?X_A (OF.P ?X_B)))
		(!R8 (HIMSELF1211.SK (PLUR FRIEND.N)))
		(!R9 (CAKE1206.SK (= (K MONEY.N))))
		(!R10 (HIMSELF1211.SK FRIEND.N))
		(!R11 (HIMSELF1211.SK (PERTAIN-TO HE.PRO)))
		(!R12 (HE.PRO MAN.N))
		(!R13 (?X_D EYE.N))
		(!R14 (?X_D (PERTAIN-TO HE.PRO)))
		(!R15 (HE.PRO MALE.A))
		(!R16 (HE.PRO AGENT.N))
		(!R17 (CAKE1206.SK ((NN SMASH.N) CAKE.N)))
		(!R18 (CAKE1206.SK (FOR.P HIMSELF1211.SK)))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V CAKE1206.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V CAKE1206.SK)))
		(?I2 (HE.PRO (AT.P ?L)))
		(?I3 (CAKE1206.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V CAKE1206.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1207.SK))
		(!W2 (?I1 PRECOND-OF E1207.SK))
		(!W3 (?I2 PRECOND-OF E1207.SK))
		(!W4 (?I3 PRECOND-OF E1207.SK))
		(!W5 (?P1 POSTCOND-OF E1207.SK))
		(!W6 (E1207.SK (BEFORE ?X_H)))
		(!W7 (?P1 (BEFORE ?X_J)))
		(!W8 (E1207.SK (BEFORE NOW332)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.7278125 0)
("It was my son's first birthday." "I cannot believe how fast it has gone by."
 "He is getting so big." "He got a smash cake for himself." "He loved it.")
(EPI-SCHEMA ((HE.PRO GET.1077.V
              (KA
               ((ADV-A
                 (WITH.P
                  (K
                   (L #:G1792470
                    (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
                (BE.PASV CATCH.V)))
              (AT.P-ARG ?L))
             ** E1207.SK)
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
    (HE.PRO =
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_C (TOO.ADV MANY.A)) (?X_D FISH.N))))))
       (BE.PASV CATCH.V))))))
		(!R4 (HE.PRO MAN.N))
		(!R5 (?X_E LIMIT.N))
		(!R6 (?X_E (PERTAIN-TO HE.PRO)))
		(!R7 (CAKE1206.SK ((NN SMASH.N) CAKE.N)))
		(!R8 (HE.PRO MALE.A))
		(!R9 (HE.PRO AGENT.N))
		(!R10 (CAKE1206.SK (FOR.P HIMSELF1211.SK)))
	)
	(:GOALS
		(?G1
   (HE.PRO
    (WANT.V
     (THAT
      (HE.PRO
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
    (HE.PRO HAVE.V
     (KA
      ((ADV-A
        (WITH.P
         (K (L #:G1792470 (AND (?X_H (TOO.ADV MANY.A)) (?X_I FISH.N))))))
       (BE.PASV CATCH.V))))))
		(?I2 (HE.PRO (AT.P ?L)))
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
   (HE.PRO HAVE.V
    (KA
     ((ADV-A
       (WITH.P (K (L #:G1792470 (AND (?X_M (TOO.ADV MANY.A)) (?X_N FISH.N))))))
      (BE.PASV CATCH.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1207.SK))
		(!W2 (?I1 PRECOND-OF E1207.SK))
		(!W3 (?I2 PRECOND-OF E1207.SK))
		(!W4 (?I3 PRECOND-OF E1207.SK))
		(!W5 (?P1 POSTCOND-OF E1207.SK))
		(!W6 (E1207.SK (BEFORE ?X_P)))
		(!W7 (E1207.SK (BEFORE NOW332)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 67:
	; "The man was playing poker."
	; "He had a flush."
	; "He went all in."
	; "He got called with two pairs."
	; "He won the hand."
; best schemas are:
; FEED.288.V
; GO_GET_NIL.677.PR
; GET.848.V
; GET.857.V
; GO.866.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
(setf matches (append matches '(( (2.405 1)
("The man was playing poker." "He had a flush." "He went all in."
 "He got called with two pairs." "He won the hand.")
(EPI-SCHEMA ((MAN1214.SK GO_GET_NIL.1086.PR ?L PRED?1219.SK) ** ?E)
	(:ROLES
		(!R1 (PRED?1219.SK INANIMATE_OBJECT.N))
		(!R2 (NOT (MAN1214.SK = PRED?1219.SK)))
		(!R3 (MAN1214.SK AGENT.N))
		(!R4 (PRED?1219.SK PRED?.N))
		(!R5 (PRED?1219.SK FLUSH.A))
		(!R6 (MAN1214.SK MAN.N))
	)
	(:PRECONDS
		(?I1 (MAN1214.SK (AT.P ?L1_2)))
		(?I2 (NOT (MAN1214.SK (AT.P ?L))))
	)
	(:STEPS
		(E1221.SK
   (MAN1214.SK
    ((ADV-A (L P (:Q ALL P)) IN.P)
     ((ADV-A (TO.P ?L)) ((ADV-A (FROM.P ?L1)) GO.673.V)))
    ?L))
		(?E2 (MAN1214.SK GET.672.V PRED?1219.SK (AT.P-ARG ?L2)))
	)
	(:POSTCONDS
		(E1220.SK (MAN1214.SK HAVE.V PRED?1219.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1221.SK BEFORE ?E2))
		(!W2 (E1220.SK (BEFORE NOW335)))
		(!W3 (E1221.SK (BEFORE NOW336)))
	)
)
))))
(setf matches (append matches '(( (2.905 4)
("The man was playing poker." "He had a flush." "He went all in."
 "He got called with two pairs." "He won the hand.")
(EPI-SCHEMA ((MAN1214.SK
              ((ADV-A (L P (:Q ALL P)) IN.P)
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.1102.V)))
              ?X_C)
             ** E1221.SK)
	(:ROLES
		(!R1 (MAN1214.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (?X_A (PLUR PERSON.N)))
		(!R6 (MAN1214.SK FRIEND.N))
		(!R7 (MAN1214.SK (PERTAIN-TO MAN1214.SK)))
		(!R8 (HAND1224.SK (PERTAIN-TO MAN1214.SK)))
		(!R9 (HAND1224.SK EYE.N))
		(!R10 (MAN1214.SK MAN.N))
		(!R11 (MAN1214.SK PERSON.N))
		(!R12 (HAND1224.SK HAND.N))
		(!R13 (HAND1224.SK BODY_PART.N))
	)
	(:GOALS
		(?G1 (MAN1214.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1214.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1214.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1214.SK (AT.P ?L1))))
		(?P2 (MAN1214.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1221.SK))
		(!W2 (?I2 BEFORE E1221.SK))
		(!W3 (?P1 AFTER E1221.SK))
		(!W4 (?P2 AFTER E1221.SK))
		(!W5 (?G1 CAUSE-OF E1221.SK))
		(!W6 (E1221.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E1221.SK (BEFORE NOW336)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R11 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R13 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C7 (!R9 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C8 (!R12 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 68:
	; "Tyra is a poor."
	; "Tyra is a homeless."
	; "Tyra has to beg on the street for money."
	; "Tyra catches a break one day."
	; "A man gives her money and a place to live."
; best schemas are:
; GO.866.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; TAKE.135.V
; GET.848.V
; FIND.888.V
; GET.1260.V

; story 69:
	; "The boy ran into the kitchen."
	; "His hand hit the cup on the table."
	; "It hit the ground with a bounce."
	; "The cup did not break."
	; "The cup was made of plastic."
; best schemas are:
; GO.742.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; RUN.311.V
; SPRINT.1181.V
; GO.423.V

; story 70:
	; "Matt left his window open."
	; "His cat got out of the house."
	; "Matt looked for his cat."
	; "He put posters up to find his cat."
	; "Someone called him with his cat."
; best schemas are:
; STROLL.340.V
; SIT.65.V
; RUN.28.V
; RUN.229.V
; RUN.254.V
; COME.126.V

; story 71:
	; "A family really loved rainbows."
	; "They would always look for them."
	; "It rained one day."
	; "They looked outside."
	; "They saw a rainbow."
; best schemas are:
; PLAY.669.V
; COME.280.V
; GO.671.V
; PLAY.670.V
; TAKE.1270.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1029.V

; story 72:
	; "The man mixed a drink."
	; "It tasted very good."
	; "His friend asked for one."
	; "The man made his friend a drink."
	; "His friend gave the drink it's own name."
; best schemas are:
; GO.866.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; GET.848.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; GET.857.V
; GIVE.241.V

; story 73:
	; "Tom was a ten year old boy."
	; "Tom lived with his parents."
	; "Tom wanted a pet."
	; "His parents did not allow pets in the house."
	; "Tom cried."
discarding schema AVOID_ACTION_TO_AVOID_DISPLEASURE.1029.V learned from this story
; best schemas are:
; SIT.65.V
; GIVE.947.V
; GIVE.1086.V
; GIVE.1297.V
; GIVE_TAKE_NIL.1099.PR

; story 74:
	; "Tom loved playing baseball."
	; "He had a big game."
	; "He was up to hit."
	; "He hit a long drive."
	; "He was able to make a run and win the game."
; best schemas are:
; PLAY.V
; PLAY.920.V
; PLAY.679.V
; PLAY.1257.V
; PLAY.103.V
; PLAY.669.V

; story 75:
	; "Tom had a cabin near a river."
	; "He would visit often."
	; "ONe day the river flooded."
	; "Tom's cabin was swept away."
	; "Tom was sad for years."
; best schemas are:
; FIND.1167.V
; TAKE.928.V
; GET.338.V
; GET.848.V
; GET.857.V
; GET.73.V

; story 76:
	; "The man folded the clothes."
	; "He put them away."
	; "The next day they were gone."
	; "He went to look for them."
	; "His wife was refolding them."
discarding schema GO.1083.V learned from this story
; best schemas are:
; GO.866.V
; GO.504.V
; GO.642.V
; GO.423.V
; GO.1261.V
(setf matches (append matches '(( (3.405 3)
("The man folded the clothes." "He put them away."
 "The next day they were gone." "He went to look for them."
 "His wife was refolding them.")
(EPI-SCHEMA ((MAN1370.SK
              ((ADV-A (FOR.P (KA ((ADV-A (FOR.P CLOTHE1373.SK)) LOOK.V))))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.1354.V)))
              ?X_C)
             ** E1381.SK)
	(:ROLES
		(!R1 (MAN1370.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (?X_A (PLUR PERSON.N)))
		(!R6 (MAN1370.SK FRIEND.N))
		(!R7 (MAN1370.SK (PERTAIN-TO MAN1370.SK)))
		(!R8 (WIFE1384.SK EYE.N))
		(!R9 (CLOTHE1373.SK (PLUR CLOTHE.N)))
		(!R10 (MAN1370.SK MAN.N))
		(!R11 (MAN1370.SK PERSON.N))
		(!R12 (WIFE1384.SK (PERTAIN-TO MAN1370.SK)))
		(!R13 (WIFE1384.SK WIFE.N))
	)
	(:GOALS
		(?G1 (MAN1370.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1370.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1370.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1370.SK (AT.P ?L1))))
		(?P2 (MAN1370.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1381.SK))
		(!W2 (?I2 BEFORE E1381.SK))
		(!W3 (?P1 AFTER E1381.SK))
		(!W4 (?P2 AFTER E1381.SK))
		(!W5 (?G1 CAUSE-OF E1381.SK))
		(!W6 (E1381.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E1381.SK (BEFORE NOW382)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R11 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R10 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R11 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C7 (!R10 CERTAIN-TO-DEGREE (/ 1 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.108203 4)
("The man folded the clothes." "He put them away."
 "The next day they were gone." "He went to look for them."
 "His wife was refolding them.")
(EPI-SCHEMA ((MAN1370.SK
              ((ADV-A (FOR.P (KA ((ADV-A (FOR.P CLOTHE1373.SK)) LOOK.V))))
               ((ADV-A (TO.P (K JAIL.N))) ((ADV-A (FROM.P ?L1)) GO.1355.V)))
              (K JAIL.N))
             ** E1381.SK)
	(:ROLES
		(!R1 (MAN1370.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K JAIL.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K JAIL.N))))
		(!R5 (E1381.SK (RIGHT-AFTER ?X_A)))
		(!R6 (?X_B ((NN MEETING.N) SPOT.N)))
		(!R7 (DAY1378.SK (PERTAIN-TO MAN1370.SK)))
		(!R8 (DAY1378.SK DATE.N))
		(!R9 (CLOTHE1373.SK (PLUR CLOTHE.N)))
		(!R10 (MAN1370.SK MAN.N))
		(!R11 (WIFE1384.SK (PERTAIN-TO MAN1370.SK)))
		(!R12 (WIFE1384.SK WIFE.N))
		(!R13 (DAY1378.SK DAY.N))
		(!R14 (DAY1378.SK NEXT.A))
	)
	(:GOALS
		(?G1 (MAN1370.SK (WANT.V (KA ((ADV-A (AT.P (K JAIL.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1370.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1370.SK (AT.P (K JAIL.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1370.SK (AT.P ?L1))))
		(?P2 (MAN1370.SK (AT.P (K JAIL.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1381.SK))
		(!W2 (?I2 BEFORE E1381.SK))
		(!W3 (?P1 AFTER E1381.SK))
		(!W4 (?P2 AFTER E1381.SK))
		(!W5 (?G1 CAUSE-OF E1381.SK))
		(!W6 (E1381.SK (SAME-TIME ?X_E)))
		(!W7 (?X_D (BEFORE ?X_E)))
		(!W8 (E1381.SK (BEFORE ?X_H)))
		(!W9 (E1381.SK (BEFORE NOW382)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 0)
("The man folded the clothes." "He put them away."
 "The next day they were gone." "He went to look for them."
 "His wife was refolding them.")
(EPI-SCHEMA ((MAN1370.SK
              ((ADV-A (FOR.P (KA ((ADV-A (FOR.P CLOTHE1373.SK)) LOOK.V))))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) GO.1356.V)))
              ?X_C)
             ** E1381.SK)
	(:ROLES
		(!R1 (MAN1370.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (?X_A (PLUR PERSON.N)))
		(!R6 (CLOTHE1373.SK (PLUR CLOTHE.N)))
		(!R7 (MAN1370.SK MAN.N))
		(!R8 (WIFE1384.SK (PERTAIN-TO MAN1370.SK)))
		(!R9 (WIFE1384.SK WIFE.N))
	)
	(:GOALS
		(?G1 (MAN1370.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1370.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1370.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1370.SK (AT.P ?L1))))
		(?P2 (MAN1370.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1381.SK))
		(!W2 (?I2 BEFORE E1381.SK))
		(!W3 (?P1 AFTER E1381.SK))
		(!W4 (?P2 AFTER E1381.SK))
		(!W5 (?G1 CAUSE-OF E1381.SK))
		(!W6 (E1381.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E1381.SK (BEFORE NOW382)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 4)
("The man folded the clothes." "He put them away."
 "The next day they were gone." "He went to look for them."
 "His wife was refolding them.")
(EPI-SCHEMA ((MAN1370.SK
              ((ADV-A (FOR.P (KA ((ADV-A (FOR.P CLOTHE1373.SK)) LOOK.V))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P WIFE1384.SK)) (OUT.ADV GO.1357.V))))
              WIFE1384.SK)
             ** E1381.SK)
	(:ROLES
		(!R1 (MAN1370.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (WIFE1384.SK LOCATION.N))
		(!R4 (NOT (?L1 = WIFE1384.SK)))
		(!R5 (WIFE1384.SK MAILBOX.N))
		(!R6 (E1381.SK (RIGHT-AFTER ?X_A)))
		(!R7 (?X_B PAPER.N))
		(!R8 (?X_B (PERTAIN-TO MAN1370.SK)))
		(!R9 (?X_C ((NN PAPER.N) BOY.N)))
		(!R10 (?X_C (PERTAIN-TO MAN1370.SK)))
		(!R11 (CLOTHE1373.SK (PLUR CLOTHE.N)))
		(!R12 (MAN1370.SK MAN.N))
		(!R13 (WIFE1384.SK (PERTAIN-TO MAN1370.SK)))
		(!R14 (WIFE1384.SK WIFE.N))
	)
	(:GOALS
		(?G1 (MAN1370.SK (WANT.V (KA ((ADV-A (AT.P WIFE1384.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1370.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1370.SK (AT.P WIFE1384.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1370.SK (AT.P ?L1))))
		(?P2 (MAN1370.SK (AT.P WIFE1384.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1381.SK))
		(!W2 (?I2 BEFORE E1381.SK))
		(!W3 (?P1 AFTER E1381.SK))
		(!W4 (?P2 AFTER E1381.SK))
		(!W5 (?G1 CAUSE-OF E1381.SK))
		(!W6 (E1381.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1381.SK (BEFORE NOW382)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 4)
("The man folded the clothes." "He put them away."
 "The next day they were gone." "He went to look for them."
 "His wife was refolding them.")
(EPI-SCHEMA ((MAN1370.SK
              ((ADV-A (FOR.P (KA ((ADV-A (FOR.P CLOTHE1373.SK)) LOOK.V))))
               ((ADV-A (TO.P (K FISHING.N))) ((ADV-A (FROM.P ?L1)) GO.1358.V)))
              (K FISHING.N))
             ** E1381.SK)
	(:ROLES
		(!R1 (MAN1370.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K FISHING.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K FISHING.N))))
		(!R5 (E1381.SK (RIGHT-AFTER ?X_A)))
		(!R6 (WIFE1384.SK LIMIT.N))
		(!R7 (CLOTHE1373.SK (PLUR CLOTHE.N)))
		(!R8 (MAN1370.SK MAN.N))
		(!R9 (WIFE1384.SK (PERTAIN-TO MAN1370.SK)))
		(!R10 (WIFE1384.SK WIFE.N))
	)
	(:GOALS
		(?G1 (MAN1370.SK (WANT.V (KA ((ADV-A (AT.P (K FISHING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1370.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1370.SK (AT.P (K FISHING.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1370.SK (AT.P ?L1))))
		(?P2 (MAN1370.SK (AT.P (K FISHING.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1381.SK))
		(!W2 (?I2 BEFORE E1381.SK))
		(!W3 (?P1 AFTER E1381.SK))
		(!W4 (?P2 AFTER E1381.SK))
		(!W5 (?G1 CAUSE-OF E1381.SK))
		(!W6 (E1381.SK (SAME-TIME ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1381.SK (BEFORE NOW382)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 77:
	; "Tom had an old stove."
	; "It went out one night."
	; "Tom didn't smell the gas."
	; "It made him feel sick."
	; "Tom had to fix it."
; best schemas are:
; FEED.660.V
; FIND.1361.V
; GO_FIND_EAT.566.PR
; GO_GET_NIL.677.PR
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (1.0 1)
("Tom had an old stove." "It went out one night." "Tom didn't smell the gas."
 "It made him feel sick." "Tom had to fix it.")
(EPI-SCHEMA ((STOVE1390.SK GO_GET_NIL.1366.PR NIGHT1393.SK ?X_B) ** ?E)
	(:ROLES
		(!R1 (?X_B INANIMATE_OBJECT.N))
		(!R2 (?X_B PRED?.N))
		(!R3 (NOT (STOVE1390.SK = ?X_B)))
		(!R4 (STOVE1390.SK AGENT.N))
		(!R5 (NIGHT1393.SK NIGHT.N))
		(!R6 (STOVE1390.SK OLD.A))
		(!R7 (STOVE1390.SK STOVE.N))
	)
	(:PRECONDS
		(?I1 (STOVE1390.SK (AT.P ?L1_2)))
		(?I2 (NOT (STOVE1390.SK (AT.P NIGHT1393.SK))))
	)
	(:STEPS
		(E1394.SK
   (STOVE1390.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P NIGHT1393.SK)) GO.673.V))
    NIGHT1393.SK))
		(?E2 (STOVE1390.SK GET.672.V ?X_B (AT.P-ARG ?L2)))
	)
	(:POSTCONDS
		(?P1 (STOVE1390.SK HAVE.V ?X_B))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1394.SK BEFORE ?E2))
		(!W2 (E1394.SK (BEFORE NOW385)))
	)
)
))))

; story 78:
	; "Gary loved to ride bikes."
	; "He met a girl who did, too."
	; "He asked her on a date."
	; "They got their bikes together."
	; "They rode around the town."
discarding schema RIDE.1113.V learned from this story
discarding schema GET.1111.V learned from this story
; best schemas are:
; TAKE.1039.V
; RUN.401.V
; GO.866.V
; TAKE.413.V
(setf matches (append matches '(( (3.6858547 2)
("Gary loved to ride bikes." "He met a girl who did, too."
 "He asked her on a date." "They got their bikes together."
 "They rode around the town.")
(EPI-SCHEMA ((THEY1417.SK
              ((ADV-A (AROUND.P TOWN1415.SK))
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) RIDE.1395.V)))
              ?X_C)
             ** E1416.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (?L1 = ?X_C)))
		(!R4 (GIRL1404.SK (PLUR PERSON.N)))
		(!R5 (THEY1417.SK FRIEND.N))
		(!R6 (THEY1417.SK (PERTAIN-TO THEY1417.SK)))
		(!R7 (THEY1417.SK MAN.N))
		(!R8 (BIKE1412.SK EYE.N))
		(!R9 (TOWN1415.SK TOWN.N))
		(!R10 (GIRL1404.SK GIRL.N))
		(!R11 (BIKE1412.SK (PLUR BIKE.N)))
		(!R12 (BIKE1412.SK (PERTAIN-TO THEY1417.SK)))
		(!R13 (THEY1417.SK AGENT.N))
	)
	(:GOALS
		(?G1 (THEY1417.SK (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (THEY1417.SK (AT.P ?L1)))
		(?I2 (NOT (THEY1417.SK (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (THEY1417.SK (AT.P ?L1))))
		(?P2 (THEY1417.SK (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1416.SK))
		(!W2 (?I2 BEFORE E1416.SK))
		(!W3 (?P1 AFTER E1416.SK))
		(!W4 (?P2 AFTER E1416.SK))
		(!W5 (?G1 CAUSE-OF E1416.SK))
		(!W6 (E1416.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E1416.SK (BEFORE NOW393)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 79:
	; "The man was cooking."
	; "He knocked over some oil."
	; "The oil fell on the floor."
	; "He did not notice."
	; "He slipped on the oil."
discarding schema AVOID_ACTION_TO_AVOID_DISPLEASURE.1127.V learned from this story
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.1136.V
; GO.866.V
; SIT.49.V
; GO.423.V
; GO.1261.V
(setf matches (append matches '(( (1.93625 1)
("The man was cooking." "He knocked over some oil."
 "The oil fell on the floor." "He did not notice." "He slipped on the oil.")
(EPI-SCHEMA ((MAN1419.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1421.V
              (KA NOTICE.V))
             ** ?E)
	(:ROLES
		(!R1 (MAN1419.SK AGENT.N))
		(!R2 ((KA NOTICE.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (MAN1419.SK MAN.N))
		(!R5 (OIL1421.SK OIL.N))
	)
	(:GOALS
		(?G1 (MAN1419.SK (WANT.V (THAT (NOT (MAN1419.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN1419.SK ((ADV-A (OVER.P OIL1421.SK)) NOTICE.V))) CAUSE-OF
    (KE (MAN1419.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1422.SK (MAN1419.SK ((ADV-A (OVER.P OIL1421.SK)) NOTICE.V)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1422.SK))
		(!W2 (E1422.SK (BEFORE ?X_C)))
		(!W3 (E1422.SK (BEFORE NOW395)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 80:
	; "Tony was out playing with friends."
	; "Some of them were jumping rope."
	; "They asked Tony to jump in."
	; "Tony tried and fell down."
	; "All his friends made fun of him."
; best schemas are:
; TAKE.1391.V
; GO.866.V
; TAKE.1039.V
; TAKE.413.V
; SPRINT.1181.V
; BUMP.400.V
(setf matches (append matches '(( (2.7278125 1)
("Tony was out playing with friends." "Some of them were jumping rope."
 "They asked Tony to jump in." "Tony tried and fell down."
 "All his friends made fun of him.")
(EPI-SCHEMA ((TONY.NAME
              (DOWN.ADV
               ((ADV-A (TO.P ?X_C)) ((ADV-A (FROM.P ?L1)) FALL.1429.V)))
              ?X_C)
             ** E1438.SK)
	(:ROLES
		(!R1 (TONY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (?L1 = ?X_C)))
		(!R5 (THEY1441.SK (PLUR PERSON.N)))
		(!R6 (TONY.NAME FRIEND.N))
		(!R7 (TONY.NAME (PERTAIN-TO ?X_B)))
		(!R8 (?X_B MAN.N))
		(!R9 (?X_F (PERTAIN-TO ?X_B)))
		(!R10 (?X_F EYE.N))
		(!R11 (E1438.SK (AT-OR-BEFORE NOW402)))
		(!R12 (THEY1441.SK AGENT.N))
	)
	(:GOALS
		(?G1 (TONY.NAME (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TONY.NAME (AT.P ?L1)))
		(?I2 (NOT (TONY.NAME (AT.P ?X_C))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (TONY.NAME (AT.P ?L1))))
		(?P2 (TONY.NAME (AT.P ?X_C)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1438.SK))
		(!W2 (?I2 BEFORE E1438.SK))
		(!W3 (?P1 AFTER E1438.SK))
		(!W4 (?P2 AFTER E1438.SK))
		(!W5 (?G1 CAUSE-OF E1438.SK))
		(!W6 (E1438.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E1437.SK (BEFORE NOW402)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 81:
	; "A new movie just came out."
	; "I was very excited."
	; "I took all my friends with me."
	; "When we got there though, we were sad."
	; "It only lasted one hour."
; best schemas are:
; TAKE.1391.V
; GO.531.V
; GO.866.V
; PLAY.1257.V
; TAKE.958.V
; TAKE.1039.V

; story 82:
	; "The man had a craving."
	; "He ignored it."
	; "The craving grew."
	; "He gave into the craving."
	; "The man felt guilty."
; best schemas are:
; THANK.603.V
; FEED.288.V
; GIVE.V
; TAKE.1.V
; TAKE.10.V
; TAKE.135.V

; story 83:
	; "Little Alice had a doll."
	; "It was her favorite."
	; "Once Mark came to visit."
	; "He broke the doll."
	; "Alice cried."
; best schemas are:
; PLAY.301.V
; PLAY.303.V
; COME.605.V
; PLAY.V
; PLAY.920.V
; PLAY.679.V
(setf matches (append matches '(( (3.5 3)
("Little Alice had a doll." "It was her favorite." "Once Mark came to visit."
 "He broke the doll." "Alice cried.")
(EPI-SCHEMA ((MARK.NAME
              ((ADV-A (FOR.P (KA VISIT.V)))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.1458.V)))
              ?L2)
             ** E1477.SK)
	(:ROLES
		(!R1 (MARK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (E1477.SK (RIGHT-AFTER ?X_A)))
		(!R6 (MARK.NAME FRIEND.N))
		(!R7 (MARK.NAME (PERTAIN-TO SHE.PRO)))
		(!R8 (OBJECT1475.SK (PLUR BROTHER.N)))
		(!R9 (OBJECT1475.SK (PERTAIN-TO SHE.PRO)))
		(!R10 (SHE.PRO FEMALE.A))
		(!R11 (SHE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (MARK.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MARK.NAME (AT.P ?L1)))
		(?I2 (NOT (MARK.NAME (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MARK.NAME (AT.P ?L1))))
		(?P2 (MARK.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1477.SK))
		(!W2 (?I2 BEFORE E1477.SK))
		(!W3 (?P1 AFTER E1477.SK))
		(!W4 (?P2 AFTER E1477.SK))
		(!W5 (?G1 CAUSE-OF E1477.SK))
		(!W6 (E1477.SK (SAME-TIME ?X_G)))
		(!W7 (?X_F (BEFORE ?X_G)))
		(!W8 (?G1 (BEFORE ?X_I)))
		(!W9 (E1477.SK (BEFORE NOW416)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 84:
	; "Tom wanted to start a farm."
	; "Tom saved up money to buy a farm."
	; "He went to the auction."
	; "He bought some goats."
	; "He started the farm with his new goats."
discarding schema GO.1152.V learned from this story
; best schemas are:
; GO.758.V
; GO.100.V
; GO.105.V
; GO.740.V
; GET.104.V
(setf matches (append matches '(( (5.6953125 6)
("Tom wanted to start a farm." "Tom saved up money to buy a farm."
 "He went to the auction." "He bought some goats."
 "He started the farm with his new goats.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (FOR.P (KA (BUY.V ?X_A))))
               ((ADV-A (TO.P AUCTION1491.SK))
                ((ADV-A (FROM.P FARM1484.SK)) GO.1463.V)))
              AUCTION1491.SK)
             ** E1492.SK)
	(:ROLES
		(!R1 (FARM1484.SK LOCATION.N))
		(!R2 (AUCTION1491.SK LOCATION.N))
		(!R3 (NOT (FARM1484.SK = AUCTION1491.SK)))
		(!R4 (FARM1484.SK ((NN BALL.N) GAME.N)))
		(!R5 (?X_A SNACK.N))
		(!R6 (OBJECT1500.SK ARM.N))
		(!R7 (AUCTION1491.SK AUCTION.N))
		(!R8 (FARM1484.SK FARM.N))
		(!R9 (OBJECT1500.SK (PERTAIN-TO HE.PRO)))
		(!R10 (HE.PRO MALE.A))
		(!R11 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P AUCTION1491.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P FARM1484.SK)))
		(?I2 (NOT (HE.PRO (AT.P AUCTION1491.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P FARM1484.SK))))
		(?P2 (HE.PRO (AT.P AUCTION1491.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1492.SK))
		(!W2 (?I2 BEFORE E1492.SK))
		(!W3 (?P1 AFTER E1492.SK))
		(!W4 (?P2 AFTER E1492.SK))
		(!W5 (?G1 CAUSE-OF E1492.SK))
		(!W6 (?I1 (BEFORE ?X_F)))
		(!W7 (E1492.SK (BEFORE ?X_H)))
		(!W8 (E1492.SK (BEFORE NOW421)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.6953125 4)
("Tom wanted to start a farm." "Tom saved up money to buy a farm."
 "He went to the auction." "He bought some goats."
 "He started the farm with his new goats.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A
                (FOR.P (KA ((ADV-A (ON.P FRIDAY.NAME)) VISIT.V) FARM1484.SK)))
               ((ADV-A (TO.P AUCTION1491.SK))
                ((ADV-A (FROM.P FARM1488.SK)) GO.1465.V)))
              AUCTION1491.SK)
             ** E1492.SK)
	(:ROLES
		(!R1 (FARM1488.SK LOCATION.N))
		(!R2 (AUCTION1491.SK LOCATION.N))
		(!R3 (NOT (FARM1488.SK = AUCTION1491.SK)))
		(!R4 (HE.PRO MALE.A))
		(!R5 (HE.PRO AGENT.N))
		(!R6 (AUCTION1491.SK AUCTION.N))
		(!R7 (OBJECT1500.SK (PERTAIN-TO HE.PRO)))
		(!R8 (FARM1484.SK FARM.N))
		(!R9 (FARM1488.SK FARM.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P AUCTION1491.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P FARM1488.SK)))
		(?I2 (NOT (HE.PRO (AT.P AUCTION1491.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P FARM1488.SK))))
		(?P2 (HE.PRO (AT.P AUCTION1491.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1492.SK))
		(!W2 (?I2 BEFORE E1492.SK))
		(!W3 (?P1 AFTER E1492.SK))
		(!W4 (?P2 AFTER E1492.SK))
		(!W5 (?G1 CAUSE-OF E1492.SK))
		(!W6 (E1492.SK (BEFORE ?X_D)))
		(!W7 (E1492.SK (BEFORE NOW421)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (6.1953125 5)
("Tom wanted to start a farm." "Tom saved up money to buy a farm."
 "He went to the auction." "He bought some goats."
 "He started the farm with his new goats.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (WITH.P OBJECT1500.SK))
               (OUT.ADV
                ((ADV-A (TO.P AUCTION1491.SK))
                 ((ADV-A (FROM.P FARM1488.SK)) GO.1468.V))))
              AUCTION1491.SK)
             ** E1492.SK)
	(:ROLES
		(!R1 (FARM1488.SK LOCATION.N))
		(!R2 (AUCTION1491.SK LOCATION.N))
		(!R3 (NOT (FARM1488.SK = AUCTION1491.SK)))
		(!R4 (OBJECT1500.SK (PLUR FRIEND.N)))
		(!R5 (?X_C (PERTAIN-TO HE.PRO)))
		(!R6 (?X_C BIRTHDAY.N))
		(!R7 (OBJECT1487.SK (FOR.P ?X_C)))
		(!R8 (AUCTION1491.SK AUCTION.N))
		(!R9 (OBJECT1500.SK (PERTAIN-TO HE.PRO)))
		(!R10 (HE.PRO MALE.A))
		(!R11 (HE.PRO AGENT.N))
		(!R12 (FARM1488.SK FARM.N))
		(!R13 (OBJECT1487.SK (= (K MONEY.N))))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P AUCTION1491.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P FARM1488.SK)))
		(?I2 (NOT (HE.PRO (AT.P AUCTION1491.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P FARM1488.SK))))
		(?P2 (HE.PRO (AT.P AUCTION1491.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1492.SK))
		(!W2 (?I2 BEFORE E1492.SK))
		(!W3 (?P1 AFTER E1492.SK))
		(!W4 (?P2 AFTER E1492.SK))
		(!W5 (?G1 CAUSE-OF E1492.SK))
		(!W6 (E1492.SK (BEFORE ?X_F)))
		(!W7 (E1492.SK (BEFORE NOW421)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.1953125 4)
("Tom wanted to start a farm." "Tom saved up money to buy a farm."
 "He went to the auction." "He bought some goats."
 "He started the farm with his new goats.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A HOME.ADV EARLY.A (FROM.P (K WORK.N)))
               ((ADV-A (TO.P AUCTION1491.SK))
                ((ADV-A (FROM.P FARM1488.SK)) GO.1470.V)))
              AUCTION1491.SK)
             ** E1492.SK)
	(:ROLES
		(!R1 (FARM1488.SK LOCATION.N))
		(!R2 (AUCTION1491.SK LOCATION.N))
		(!R3 (NOT (FARM1488.SK = AUCTION1491.SK)))
		(!R4 (HE.PRO MALE.A))
		(!R5 (HE.PRO AGENT.N))
		(!R6 (AUCTION1491.SK AUCTION.N))
		(!R7 (OBJECT1500.SK (PERTAIN-TO HE.PRO)))
		(!R8 (FARM1488.SK FARM.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P AUCTION1491.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P FARM1488.SK)))
		(?I2 (NOT (HE.PRO (AT.P AUCTION1491.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P FARM1488.SK))))
		(?P2 (HE.PRO (AT.P AUCTION1491.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1492.SK))
		(!W2 (?I2 BEFORE E1492.SK))
		(!W3 (?P1 AFTER E1492.SK))
		(!W4 (?P2 AFTER E1492.SK))
		(!W5 (?G1 CAUSE-OF E1492.SK))
		(!W6 (E1492.SK (BEFORE ?X_C)))
		(!W7 (E1492.SK (BEFORE NOW421)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.1953125 8)
("Tom wanted to start a farm." "Tom saved up money to buy a farm."
 "He went to the auction." "He bought some goats."
 "He started the farm with his new goats.")
(EPI-SCHEMA ((HE.PRO BUY.1472.V
              (KA ((ADV-A (WITH.P HE.PRO)) (BE.PASV FED_UP.V)))
              (AT.P-ARG FARM1488.SK))
             ** E1497.SK)
	(:ROLES
		(!R1 ((KA ((ADV-A (WITH.P HE.PRO)) (BE.PASV FED_UP.V))) INANIMATE_OBJECT.N))
		(!R2 (FARM1488.SK LOCATION.N))
		(!R3 (NOT (HE.PRO = (KA ((ADV-A (WITH.P HE.PRO)) (BE.PASV FED_UP.V))))))
		(!R4 (HE.PRO (PERTAIN-TO HE.PRO)))
		(!R5 (HE.PRO BANK.N))
		(!R6 (HE.PRO MONEY.N))
		(!R7 (HE.PRO (PERTAIN-TO ?X_A)))
		(!R8 (?X_A MALE.A))
		(!R9 (?X_A AGENT.N))
		(!R10 (HE.PRO MALE.A))
		(!R11 (HE.PRO AGENT.N))
		(!R12 (GOAT1496.SK (PLUR GOAT.N)))
		(!R13 (OBJECT1500.SK (PERTAIN-TO HE.PRO)))
		(!R14 (FARM1488.SK FARM.N))
	)
	(:GOALS
		(?G1
   (HE.PRO
    (WANT.V
     (THAT
      (HE.PRO (HAVE.V (KA ((ADV-A (WITH.P HE.PRO)) (BE.PASV FED_UP.V)))))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V (KA ((ADV-A (WITH.P HE.PRO)) (BE.PASV FED_UP.V))))))
		(?I2 (HE.PRO (AT.P FARM1488.SK)))
		(?I3 ((KA ((ADV-A (WITH.P HE.PRO)) (BE.PASV FED_UP.V))) (AT.P FARM1488.SK)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V (KA ((ADV-A (WITH.P HE.PRO)) (BE.PASV FED_UP.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1497.SK))
		(!W2 (?I1 PRECOND-OF E1497.SK))
		(!W3 (?I2 PRECOND-OF E1497.SK))
		(!W4 (?I3 PRECOND-OF E1497.SK))
		(!W5 (?P1 POSTCOND-OF E1497.SK))
		(!W6 (E1497.SK (BEFORE ?X_D)))
		(!W7 (E1497.SK (BEFORE NOW422)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 85:
	; "Mary and Lucy were playing in the park."
	; "Some little boy came to them."
	; "He took the ball from Lucy."
	; "He kicked it far away from them."
	; "Lucy started to cry."
; best schemas are:
; GO.658.V
; TAKE.656.V
; TAKE.1391.V
; COME.126.V
; TAKE.1039.V
; GO.340.V

; story 86:
	; "Larry found a hurt bird."
	; "He put it in a shoe box."
	; "He fed the bird."
	; "The bird survived."
	; "Larry kept it in a cage in his room."
discarding schema FIND.1167.V learned from this story
; best schemas are:
; SIT.274.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; SIT.211.V
; SIT.505.V
; SIT.49.V

; story 87:
	; "Lucy had a lot of split ends."
	; "She had to do something about it."
	; "She got some scissors."
	; "She then cut them off."
	; "She then looked great."
discarding schema GET.1182.V learned from this story
; best schemas are:
; RECEIVING_VERB.?
; GET.143.V
; GET.1669.V
; GET.346.V
; GET.671.V
(setf matches (append matches '(( (5.0 4)
("Lucy had a lot of split ends." "She had to do something about it."
 "She got some scissors." "She then cut them off." "She then looked great.")
(EPI-SCHEMA ((LUCY.NAME ((ADV-A (TO.P ?X_A)) GET.1516.V) LOT1539.SK
              (AT.P-ARG ?L))
             ** E1546.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (LOT1539.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (LUCY.NAME = LOT1539.SK)))
		(!R5 (LUCY.NAME RAT.N))
		(!R6 (?X_A (ALL.ADV SAFE.A)))
		(!R7 (?X_A HOLE.N))
		(!R8 (E1546.SK (RIGHT-AFTER ?X_B)))
		(!R9
   (LOT1539.SK
    (OF.P
     (K (L #:G3083783 (AND (#:G3083783 SPLIT.A) (#:G3083783 (PLUR END.N))))))))
		(!R10 (LOT1539.SK LOT.N))
		(!R11 (SCISSOR1545.SK (PLUR SCISSOR.N)))
	)
	(:GOALS
		(?G1 (LUCY.NAME (WANT.V (THAT (LUCY.NAME (HAVE.V LOT1539.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (LUCY.NAME HAVE.V LOT1539.SK)))
		(?I2 (LUCY.NAME (AT.P ?L)))
		(?I3 (LOT1539.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E1540.SK (LUCY.NAME HAVE.V LOT1539.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1546.SK))
		(!W2 (?I1 PRECOND-OF E1546.SK))
		(!W3 (?I2 PRECOND-OF E1546.SK))
		(!W4 (?I3 PRECOND-OF E1546.SK))
		(!W5 (E1540.SK POSTCOND-OF E1546.SK))
		(!W6 (E1546.SK (SAME-TIME ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1540.SK (BEFORE NOW434)))
		(!W9 (E1546.SK (BEFORE NOW436)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0 5)
("Lucy had a lot of split ends." "She had to do something about it."
 "She got some scissors." "She then cut them off." "She then looked great.")
(EPI-SCHEMA ((LUCY.NAME GET.1518.V LOT1539.SK (AT.P-ARG ?L)) ** E1546.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (LOT1539.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (LUCY.NAME = LOT1539.SK)))
		(!R5 (LUCY.NAME MONKEY.N))
		(!R6 (LOT1539.SK COCOANUT.N))
		(!R7 (?X_A GROUND.N))
		(!R8 (LOT1539.SK (TO.P ?X_A)))
		(!R9
   (LOT1539.SK
    (OF.P
     (K (L #:G3083783 (AND (#:G3083783 SPLIT.A) (#:G3083783 (PLUR END.N))))))))
		(!R10 (LOT1539.SK LOT.N))
		(!R11 (SCISSOR1545.SK (PLUR SCISSOR.N)))
	)
	(:GOALS
		(?G1 (LUCY.NAME (WANT.V (THAT (LUCY.NAME (HAVE.V LOT1539.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (LUCY.NAME HAVE.V LOT1539.SK)))
		(?I2 (LUCY.NAME (AT.P ?L)))
		(?I3 (LOT1539.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E1540.SK (LUCY.NAME HAVE.V LOT1539.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1546.SK))
		(!W2 (?I1 PRECOND-OF E1546.SK))
		(!W3 (?I2 PRECOND-OF E1546.SK))
		(!W4 (?I3 PRECOND-OF E1546.SK))
		(!W5 (E1540.SK POSTCOND-OF E1546.SK))
		(!W6 (?X_E (CONSEC E1546.SK)))
		(!W7 (E1546.SK (AT-ABOUT ?X_F)))
		(!W8 (?X_E (AT-ABOUT ?X_F)))
		(!W9 (E1540.SK (BEFORE NOW434)))
		(!W10 (E1546.SK (BEFORE NOW436)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.0 4)
("Lucy had a lot of split ends." "She had to do something about it."
 "She got some scissors." "She then cut them off." "She then looked great.")
(EPI-SCHEMA ((LUCY.NAME GET.1519.V LOT1539.SK (AT.P-ARG ?L)) ** E1546.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (LOT1539.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (LUCY.NAME = LOT1539.SK)))
		(!R5 (LOT1539.SK (PLUR COCOANUT.N)))
		(!R6 (?X_A MOTHER.N))
		(!R7 (?X_A (PERTAIN-TO LUCY.NAME)))
		(!R8
   (LOT1539.SK
    (OF.P
     (K (L #:G3083783 (AND (#:G3083783 SPLIT.A) (#:G3083783 (PLUR END.N))))))))
		(!R9 (LOT1539.SK LOT.N))
		(!R10 (SCISSOR1545.SK (PLUR SCISSOR.N)))
	)
	(:GOALS
		(?G1 (LUCY.NAME (WANT.V (THAT (LUCY.NAME (HAVE.V LOT1539.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (LUCY.NAME HAVE.V LOT1539.SK)))
		(?I2 (LUCY.NAME (AT.P ?L)))
		(?I3 (LOT1539.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E1540.SK (LUCY.NAME HAVE.V LOT1539.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1546.SK))
		(!W2 (?I1 PRECOND-OF E1546.SK))
		(!W3 (?I2 PRECOND-OF E1546.SK))
		(!W4 (?I3 PRECOND-OF E1546.SK))
		(!W5 (E1540.SK POSTCOND-OF E1546.SK))
		(!W6 (E1546.SK (AT-ABOUT ?X_E)))
		(!W7 (E1540.SK (BEFORE NOW434)))
		(!W8 (E1546.SK (BEFORE NOW436)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 88:
	; "It was raining all day yesterday."
	; "We were stuck in the house."
	; "We started to get very bored."
	; "We played some games."
	; "It was a long day."
; best schemas are:
; PLAY.669.V
; PLAY.670.V
; PLAY.402.V
; PLAY.V
; GO.671.V
; TAKE.1270.V

; story 89:
	; "Aaron had a slight cold."
	; "His mother told him not to swim."
	; "Aaron's mother went to the store."
	; "He went and swam anyway."
	; "Aaron got sick."
; best schemas are:
; TAKE.946.V
; GIVE.947.V
; GET.671.V
; GIVE.1297.V
; GO.90.V
; GO.658.V
(setf matches (append matches '(( (3.905 3)
("Aaron had a slight cold." "His mother told him not to swim."
 "Aaron's mother went to the store." "He went and swam anyway."
 "Aaron got sick.")
(EPI-SCHEMA ((AARON.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE1576.SK)) ((ADV-A (FROM.P ?L1)) GO.1557.V)))
              STORE1576.SK)
             ** E1573.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE1576.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE1576.SK)))
		(!R4 (AARON.NAME AGENT.N))
		(!R5 (AARON.NAME MOTHER.N))
		(!R6 (AARON.NAME (PERTAIN-TO AARON.NAME)))
		(!R7 (STORE1576.SK STORE.N))
		(!R8 (MOTHER1572.SK (PERTAIN-TO AARON.NAME)))
		(!R9 (MOTHER1572.SK MOTHER.N))
		(!R10 (E1573.SK (RIGHT-AFTER U445)))
	)
	(:GOALS
		(?G1 (AARON.NAME (WANT.V (KA ((ADV-A (AT.P STORE1576.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (AARON.NAME (AT.P ?L1)))
		(?I2 (NOT (AARON.NAME (AT.P STORE1576.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (AARON.NAME (AT.P ?L1))))
		(?P2 (AARON.NAME (AT.P STORE1576.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1573.SK))
		(!W2 (?I2 BEFORE E1573.SK))
		(!W3 (?P1 AFTER E1573.SK))
		(!W4 (?P2 AFTER E1573.SK))
		(!W5 (?G1 CAUSE-OF E1573.SK))
		(!W6 (E1573.SK (BEFORE ?X_D)))
		(!W7 (E1573.SK (SAME-TIME NOW446)))
		(!W8 (E1577.SK (BEFORE NOW446)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.9049997 6)
("Aaron had a slight cold." "His mother told him not to swim."
 "Aaron's mother went to the store." "He went and swam anyway."
 "Aaron got sick.")
(EPI-SCHEMA ((AARON.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE1576.SK)) ((ADV-A (FROM.P ?L1)) GO.1558.V)))
              STORE1576.SK)
             ** E1573.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE1576.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE1576.SK)))
		(!R4 (AARON.NAME AGENT.N))
		(!R5 (STORE1576.SK ((NN SHOE.N) STORE.N)))
		(!R6 (AARON.NAME LITTLE.A))
		(!R7 (AARON.NAME BOY.N))
		(!R8 (MOTHER1572.SK ((NN MOM.N) (PLUR SHOE.N))))
		(!R9 (STORE1576.SK STORE.N))
		(!R10 (E1573.SK (RIGHT-AFTER U445)))
		(!R11 (AARON.NAME MOTHER.N))
		(!R12 (AARON.NAME (PERTAIN-TO AARON.NAME)))
		(!R13 (MOTHER1572.SK (PERTAIN-TO AARON.NAME)))
		(!R14 (MOTHER1572.SK MOTHER.N))
	)
	(:GOALS
		(?G1 (AARON.NAME (WANT.V (KA ((ADV-A (AT.P STORE1576.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (AARON.NAME (AT.P ?L1)))
		(?I2 (NOT (AARON.NAME (AT.P STORE1576.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (AARON.NAME (AT.P ?L1))))
		(?P2 (AARON.NAME (AT.P STORE1576.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1573.SK))
		(!W2 (?I2 BEFORE E1573.SK))
		(!W3 (?P1 AFTER E1573.SK))
		(!W4 (?P2 AFTER E1573.SK))
		(!W5 (?G1 CAUSE-OF E1573.SK))
		(!W6 (E1573.SK (BEFORE ?X_D)))
		(!W7 (E1573.SK (BEFORE ?X_F)))
		(!W8 (?G1 (BEFORE ?X_H)))
		(!W9 (E1573.SK (SAME-TIME NOW446)))
		(!W10 (E1577.SK (BEFORE NOW446)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 90:
	; "Sue had a puppy she loved."
	; "One day it ran away."
	; "Sue was so sad."
	; "One day her dad said Sue I have something for you."
	; "It was a new puppy."
; best schemas are:
; TAKE.1391.V
; GET.826.V
; TAKE.1039.V
; TAKE.135.V
; BUMP.400.V
; TAKE.302.V

; story 91:
	; "Tom liked Tina."
	; "He wanted to ask her to court her."
	; "She said yes."
	; "He was so excited."
	; "They made it official."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
(setf matches (append matches '(( (1.5 1)
("Tom liked Tina." "He wanted to ask her to court her." "She said yes."
 "He was so excited." "They made it official.")
(EPI-SCHEMA ((TOM.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.1603.V
              (KA (LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))))
             ** ?E)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 ((KA (LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (TOM.NAME BIRD.N))
		(!R5 (?X_B CAGE.N))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (NOT (TOM.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (TOM.NAME LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))) CAUSE-OF
    (KE (TOM.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1601.SK (TOM.NAME LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1601.SK))
		(!W2 (E1601.SK (BEFORE ?X_D)))
		(!W3 (E1601.SK (BEFORE NOW454)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.53125 4)
("Tom liked Tina." "He wanted to ask her to court her." "She said yes."
 "He was so excited." "They made it official.")
(EPI-SCHEMA ((TOM.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.1604.V
              (KA (LIKE.V TINA.NAME)))
             ** ?E)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 ((KA (LIKE.V TINA.NAME)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (?X_A ((NN HAIR.N) CUT.N)))
		(!R5 (?X_A NEW.A))
		(!R6 (TINA.NAME ((NN HAIR.N) STYLIST.N)))
		(!R7 (TINA.NAME HAIR.N))
		(!R8 (TINA.NAME (PERTAIN-TO TOM.NAME)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (NOT (TOM.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (TOM.NAME LIKE.V TINA.NAME)) CAUSE-OF
    (KE (TOM.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1601.SK (TOM.NAME LIKE.V TINA.NAME))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1601.SK))
		(!W2 (?G1 (BEFORE ?X_E)))
		(!W3 (E1601.SK (BEFORE ?X_G)))
		(!W4 (E1601.SK (BEFORE NOW454)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 92:
	; "The boy found glue."
	; "He poured it out."
	; "It covered the carpet."
	; "It dried in one hour."
	; "His mom was very upset."
; best schemas are:
; GO.658.V
; SEARCH.V
; FIND.V
; COME.917.V
; COME.917.V
; COME.917.V

; story 93:
	; "The man dug a grave."
	; "He put his dead dog in it."
	; "He filled it in with dirt."
	; "He planted a tree on top of it."
	; "He thought of the dog when he saw the tree."
; best schemas are:
; TAKE.1391.V
; GO.866.V
; TAKE.1.V
; TAKE.10.V
; TAKE.135.V
; TAKE.885.V
(setf matches (append matches '(( (4.4049997 12)
("The man dug a grave." "He put his dead dog in it."
 "He filled it in with dirt." "He planted a tree on top of it."
 "He thought of the dog when he saw the tree.")
(EPI-SCHEMA ((MAN1624.SK (HOME.ADV DIG.1609.V) GRAVE1626.SK (AT.P-ARG ?X_B)) **
             E1623.SK)
	(:ROLES
		(!R1 (GRAVE1626.SK INANIMATE_OBJECT.N))
		(!R2 (?X_B LOCATION.N))
		(!R3 (NOT (MAN1624.SK = GRAVE1626.SK)))
		(!R4 (MAN1624.SK (PLUR GIRL.N)))
		(!R5 (GRAVE1626.SK GIANT.A))
		(!R6 (GRAVE1626.SK FROG.N))
		(!R7 (OBJECT1629.SK (PLUR FRIEND.N)))
		(!R8 (OBJECT1629.SK SON.N))
		(!R9 (GRAVE1626.SK (PLUR PEACH.N)))
		(!R10 (MAN1624.SK AGENT.N))
		(!R11 (OBJECT1629.SK (PLUR BIKE.N)))
		(!R12 (GRAVE1626.SK GIRL.N))
		(!R13 (GRAVE1626.SK PERSON.N))
		(!R14 (?X_B TOWN.N))
		(!R15 (GRAVE1626.SK GRAVE.N))
		(!R16 (E1623.SK (RIGHT-AFTER U463)))
		(!R17 (MAN1624.SK MAN.N))
		(!R18 (OBJECT1629.SK (PERTAIN-TO MAN1624.SK)))
	)
	(:GOALS
		(?G1 (MAN1624.SK (WANT.V (THAT (MAN1624.SK (HAVE.V GRAVE1626.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN1624.SK HAVE.V GRAVE1626.SK)))
		(?I2 (MAN1624.SK (AT.P ?X_B)))
		(?I3 (GRAVE1626.SK (AT.P ?X_B)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1624.SK HAVE.V GRAVE1626.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1623.SK))
		(!W2 (?I1 PRECOND-OF E1623.SK))
		(!W3 (?I2 PRECOND-OF E1623.SK))
		(!W4 (?I3 PRECOND-OF E1623.SK))
		(!W5 (?P1 POSTCOND-OF E1623.SK))
		(!W6 (E1623.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1623.SK (SAME-TIME NOW464)))
		(!W9 (E1627.SK (BEFORE NOW464)))
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
(setf matches (append matches '(( (4.4049997 5)
("The man dug a grave." "He put his dead dog in it."
 "He filled it in with dirt." "He planted a tree on top of it."
 "He thought of the dog when he saw the tree.")
(EPI-SCHEMA ((MAN1624.SK DIG.1611.V GRAVE1626.SK (AT.P-ARG ?L)) ** E1623.SK)
	(:ROLES
		(!R1 (MAN1624.SK AGENT.N))
		(!R2 (GRAVE1626.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAN1624.SK = GRAVE1626.SK)))
		(!R5 (GRAVE1626.SK WATCH.N))
		(!R6 (GRAVE1626.SK (PERTAIN-TO MAN1624.SK)))
		(!R7 (GRAVE1626.SK GRAVE.N))
		(!R8 (MAN1624.SK MAN.N))
		(!R9 (E1623.SK (RIGHT-AFTER U463)))
		(!R10 (OBJECT1629.SK (PERTAIN-TO MAN1624.SK)))
	)
	(:GOALS
		(?G1 (MAN1624.SK (WANT.V (THAT (MAN1624.SK (HAVE.V GRAVE1626.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN1624.SK HAVE.V GRAVE1626.SK)))
		(?I2 (MAN1624.SK (AT.P ?L)))
		(?I3 (GRAVE1626.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1624.SK HAVE.V GRAVE1626.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1623.SK))
		(!W2 (?I1 PRECOND-OF E1623.SK))
		(!W3 (?I2 PRECOND-OF E1623.SK))
		(!W4 (?I3 PRECOND-OF E1623.SK))
		(!W5 (?P1 POSTCOND-OF E1623.SK))
		(!W6 (E1623.SK (BEFORE ?X_D)))
		(!W7 (E1623.SK (SAME-TIME NOW464)))
		(!W8 (E1627.SK (BEFORE NOW464)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 5)
("The man dug a grave." "He put his dead dog in it."
 "He filled it in with dirt." "He planted a tree on top of it."
 "He thought of the dog when he saw the tree.")
(EPI-SCHEMA ((MAN1624.SK DIG.1613.V GRAVE1626.SK (AT.P-ARG ?X_C)) ** E1623.SK)
	(:ROLES
		(!R1 (MAN1624.SK AGENT.N))
		(!R2 (GRAVE1626.SK INANIMATE_OBJECT.N))
		(!R3 (?X_C LOCATION.N))
		(!R4 (NOT (MAN1624.SK = GRAVE1626.SK)))
		(!R5 (OBJECT1629.SK (PERTAIN-TO GRAVE1626.SK)))
		(!R6 (OBJECT1629.SK BROTHER.N))
		(!R7 (?X_B (= MAN1624.SK)))
		(!R8 (?X_B DAY.N))
		(!R9 (?X_C FARM.N))
		(!R10 (GRAVE1626.SK GRAVE.N))
		(!R11 (E1623.SK (RIGHT-AFTER U463)))
		(!R12 (MAN1624.SK MAN.N))
		(!R13 (OBJECT1629.SK (PERTAIN-TO MAN1624.SK)))
	)
	(:GOALS
		(?G1 (MAN1624.SK (WANT.V (THAT (MAN1624.SK (HAVE.V GRAVE1626.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN1624.SK HAVE.V GRAVE1626.SK)))
		(?I2 (MAN1624.SK (AT.P ?X_C)))
		(?I3 (GRAVE1626.SK (AT.P ?X_C)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1624.SK HAVE.V GRAVE1626.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1623.SK))
		(!W2 (?I1 PRECOND-OF E1623.SK))
		(!W3 (?I2 PRECOND-OF E1623.SK))
		(!W4 (?I3 PRECOND-OF E1623.SK))
		(!W5 (?P1 POSTCOND-OF E1623.SK))
		(!W6 (E1623.SK (BEFORE ?X_G)))
		(!W7 (E1623.SK (SAME-TIME NOW464)))
		(!W8 (E1627.SK (BEFORE NOW464)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 4)
("The man dug a grave." "He put his dead dog in it."
 "He filled it in with dirt." "He planted a tree on top of it."
 "He thought of the dog when he saw the tree.")
(EPI-SCHEMA ((MAN1624.SK ((ADV-A (TO.P ?X_A)) DIG.1614.V) GRAVE1626.SK
              (AT.P-ARG ?L))
             ** E1623.SK)
	(:ROLES
		(!R1 (MAN1624.SK AGENT.N))
		(!R2 (GRAVE1626.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAN1624.SK = GRAVE1626.SK)))
		(!R5 (?X_A VET.N))
		(!R6 (GRAVE1626.SK CAT.N))
		(!R7 (GRAVE1626.SK GRAVE.N))
		(!R8 (MAN1624.SK MAN.N))
		(!R9 (E1623.SK (RIGHT-AFTER U463)))
		(!R10 (OBJECT1629.SK (PERTAIN-TO MAN1624.SK)))
	)
	(:GOALS
		(?G1 (MAN1624.SK (WANT.V (THAT (MAN1624.SK (HAVE.V GRAVE1626.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN1624.SK HAVE.V GRAVE1626.SK)))
		(?I2 (MAN1624.SK (AT.P ?L)))
		(?I3 (GRAVE1626.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1624.SK HAVE.V GRAVE1626.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1623.SK))
		(!W2 (?I1 PRECOND-OF E1623.SK))
		(!W3 (?I2 PRECOND-OF E1623.SK))
		(!W4 (?I3 PRECOND-OF E1623.SK))
		(!W5 (?P1 POSTCOND-OF E1623.SK))
		(!W6 (E1623.SK (BEFORE ?X_E)))
		(!W7 (E1623.SK (SAME-TIME NOW464)))
		(!W8 (E1627.SK (BEFORE NOW464)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 94:
	; "Bob wanted to buy a new book."
	; "He didn't have the money."
	; "Bob found a ten dollar bill on the ground."
	; "He picked it up."
	; "He used the money to buy the book."
; best schemas are:
; GIVE.947.V
; GO.742.V
; FIND.129.V
; GET.346.V
; GET.37.V
; GET.104.V
(setf matches (append matches '(( (3.0 6)
("Bob wanted to buy a new book." "He didn't have the money."
 "Bob found a ten dollar bill on the ground." "He picked it up."
 "He used the money to buy the book.")
(EPI-SCHEMA ((BOB.NAME ((ADV-A (ON.P GROUND1648.SK)) FIND.1619.V) BILL1650.SK)
             ** E1651.SK)
	(:ROLES
		(!R1 (?L LOCATION.N))
		(!R2 (BOB.NAME MALE.A))
		(!R3 (BOB.NAME AGENT.N))
		(!R4 (BILL1650.SK BANK.N))
		(!R5 (BILL1650.SK NEW.A))
		(!R6 (MONEY1645.SK (PERTAIN-TO MONEY1645.SK)))
		(!R7 (MONEY1645.SK BANK.N))
		(!R8 (MONEY1645.SK (PERTAIN-TO BOB.NAME)))
		(!R9 (GROUND1648.SK GROUND.N))
		(!R10 (MONEY1645.SK MONEY.N))
	)
	(:PRECONDS
		(?I1 (BOB.NAME (AT.P ?L)))
		(?I2 (BILL1650.SK (AT.P ?L)))
		(?I3 (BOB.NAME ((ADV-A (FOR.P BILL1650.SK)) SEARCH.V)))
		(?I4 (NOT (BOB.NAME (KNOW.V (THAT (BILL1650.SK (AT.P ?L)))))))
		(?I5 (NOT (BOB.NAME (HAVE.V BILL1650.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (BOB.NAME (KNOW.V (THAT (BILL1650.SK (AT.P ?L))))))
		(?P2 (BOB.NAME (HAVE.V BILL1650.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1651.SK (BEFORE ?X_E)))
		(!W2 (E1651.SK (BEFORE NOW471)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 95:
	; "The man looked into the window of the house."
	; "He saw a woman inside."
	; "He watched the woman."
	; "The woman noticed him watching."
	; "She called the police."
; best schemas are:
; GO.866.V
; GO.1083.V
; TAKE.1391.V
; SIT.49.V
; SIT.65.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V

; story 96:
	; "I had a pony."
	; "I took it for a ride one day."
	; "I rode over the hills near my house."
	; "My pony stumbled on a large rock."
	; "My pony hurt its leg."
discarding schema TAKE.1270.V learned from this story
; best schemas are:
; TAKE.1391.V
; TAKE.1039.V
; TAKE.135.V
; TAKE.302.V
; TAKE.413.V
(setf matches (append matches '(( (5.727813 11)
("I had a pony." "I took it for a ride one day."
 "I rode over the hills near my house." "My pony stumbled on a large rock."
 "My pony hurt its leg.")
(EPI-SCHEMA ((ME1705.SK ((ADV-A (FOR.P RIDE1681.SK)) (HOME.ADV TAKE.1645.V))
              PONY1676.SK (AT.P-ARG ?X_B))
             ** E1683.SK)
	(:ROLES
		(!R1 (PONY1676.SK INANIMATE_OBJECT.N))
		(!R2 (?X_B LOCATION.N))
		(!R3 (NOT (ME1705.SK = PONY1676.SK)))
		(!R4 (ME1705.SK (PLUR GIRL.N)))
		(!R5 (PONY1676.SK GIANT.A))
		(!R6 (PONY1676.SK FROG.N))
		(!R7 (HOUSE1689.SK (PLUR FRIEND.N)))
		(!R8 (HOUSE1689.SK SON.N))
		(!R9 (PONY1676.SK (PLUR PEACH.N)))
		(!R10 (HOUSE1689.SK (PLUR BIKE.N)))
		(!R11 (PONY1676.SK GIRL.N))
		(!R12 (PONY1676.SK PERSON.N))
		(!R13 (?X_B TOWN.N))
		(!R14 (RIDE1681.SK RIDE.N))
		(!R15 (DAY1682.SK DAY.N))
		(!R16 (RIDE1681.SK (= DAY1682.SK)))
		(!R17 (ME1705.SK AGENT.N))
		(!R18 (HOUSE1689.SK (PERTAIN-TO ME1705.SK)))
		(!R19 (HOUSE1689.SK HOUSE.N))
		(!R20 (PONY1676.SK PONY.N))
		(!R21 (PONY1676.SK VERTEBRATE.N))
		(!R22 (PONY1676.SK (PERTAIN-TO ME1705.SK)))
		(!R23 (LEG1703.SK (PERTAIN-TO PONY1676.SK)))
		(!R24 (LEG1703.SK LEG.N))
	)
	(:GOALS
		(?G1 (ME1705.SK (WANT.V (THAT (ME1705.SK (HAVE.V PONY1676.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1705.SK HAVE.V PONY1676.SK)))
		(?I2 (ME1705.SK (AT.P ?X_B)))
		(?I3 (PONY1676.SK (AT.P ?X_B)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E1677.SK (ME1705.SK HAVE.V PONY1676.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1683.SK))
		(!W2 (?I1 PRECOND-OF E1683.SK))
		(!W3 (?I2 PRECOND-OF E1683.SK))
		(!W4 (?I3 PRECOND-OF E1683.SK))
		(!W5 (E1677.SK POSTCOND-OF E1683.SK))
		(!W6 (E1683.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1677.SK (BEFORE NOW479)))
		(!W9 (E1683.SK (BEFORE NOW480)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 5)))
		(!C3 (!R11 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R21 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R20 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R21 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C7 (!R20 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C8 (!R21 CERTAIN-TO-DEGREE (/ 2 5)))
		(!C9 (!R20 CERTAIN-TO-DEGREE (/ 1 5)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.727813 8)
("I had a pony." "I took it for a ride one day."
 "I rode over the hills near my house." "My pony stumbled on a large rock."
 "My pony hurt its leg.")
(EPI-SCHEMA ((ME1705.SK ((ADV-A (FOR.P RIDE1681.SK)) (HOME.ADV TAKE.1646.V))
              PONY1676.SK (AT.P-ARG ?L))
             ** E1683.SK)
	(:ROLES
		(!R1 (PONY1676.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1705.SK = PONY1676.SK)))
		(!R4 (ME1705.SK (PLUR GIRL.N)))
		(!R5 (PONY1676.SK GIANT.A))
		(!R6 (PONY1676.SK FROG.N))
		(!R7 (HOUSE1689.SK (PLUR FRIEND.N)))
		(!R8 (HOUSE1689.SK SON.N))
		(!R9 (PONY1676.SK (PLUR PEACH.N)))
		(!R10 (RIDE1681.SK RIDE.N))
		(!R11 (DAY1682.SK DAY.N))
		(!R12 (RIDE1681.SK (= DAY1682.SK)))
		(!R13 (ME1705.SK AGENT.N))
		(!R14 (HOUSE1689.SK (PERTAIN-TO ME1705.SK)))
		(!R15 (HOUSE1689.SK HOUSE.N))
		(!R16 (PONY1676.SK PONY.N))
		(!R17 (PONY1676.SK VERTEBRATE.N))
		(!R18 (PONY1676.SK (PERTAIN-TO ME1705.SK)))
		(!R19 (LEG1703.SK (PERTAIN-TO PONY1676.SK)))
		(!R20 (LEG1703.SK LEG.N))
	)
	(:GOALS
		(?G1 (ME1705.SK (WANT.V (THAT (ME1705.SK (HAVE.V PONY1676.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1705.SK HAVE.V PONY1676.SK)))
		(?I2 (ME1705.SK (AT.P ?L)))
		(?I3 (PONY1676.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E1677.SK (ME1705.SK HAVE.V PONY1676.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1683.SK))
		(!W2 (?I1 PRECOND-OF E1683.SK))
		(!W3 (?I2 PRECOND-OF E1683.SK))
		(!W4 (?I3 PRECOND-OF E1683.SK))
		(!W5 (E1677.SK POSTCOND-OF E1683.SK))
		(!W6 (E1683.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1677.SK (BEFORE NOW479)))
		(!W9 (E1683.SK (BEFORE NOW480)))
	)
	(:CERTAINTIES
		(!C1 (!R17 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R16 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R17 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R16 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R17 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C7 (!R16 CERTAIN-TO-DEGREE (/ 1 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.727813 6)
("I had a pony." "I took it for a ride one day."
 "I rode over the hills near my house." "My pony stumbled on a large rock."
 "My pony hurt its leg.")
(EPI-SCHEMA ((ME1705.SK ((ADV-A (FOR.P RIDE1681.SK)) TAKE.1647.V) PONY1676.SK
              (AT.P-ARG ?X_C))
             ** E1683.SK)
	(:ROLES
		(!R1 (PONY1676.SK INANIMATE_OBJECT.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (ME1705.SK = PONY1676.SK)))
		(!R4 (ME1705.SK MAN.N))
		(!R5 (HOUSE1689.SK (PERTAIN-TO PONY1676.SK)))
		(!R6 (HOUSE1689.SK BROTHER.N))
		(!R7 (DAY1682.SK (= ME1705.SK)))
		(!R8 (?X_C FARM.N))
		(!R9 (DAY1682.SK DAY.N))
		(!R10 (RIDE1681.SK RIDE.N))
		(!R11 (RIDE1681.SK (= DAY1682.SK)))
		(!R12 (ME1705.SK AGENT.N))
		(!R13 (HOUSE1689.SK (PERTAIN-TO ME1705.SK)))
		(!R14 (HOUSE1689.SK HOUSE.N))
		(!R15 (PONY1676.SK PONY.N))
		(!R16 (PONY1676.SK (PERTAIN-TO ME1705.SK)))
		(!R17 (LEG1703.SK (PERTAIN-TO PONY1676.SK)))
		(!R18 (LEG1703.SK LEG.N))
	)
	(:GOALS
		(?G1 (ME1705.SK (WANT.V (THAT (ME1705.SK (HAVE.V PONY1676.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1705.SK HAVE.V PONY1676.SK)))
		(?I2 (ME1705.SK (AT.P ?X_C)))
		(?I3 (PONY1676.SK (AT.P ?X_C)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E1677.SK (ME1705.SK HAVE.V PONY1676.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1683.SK))
		(!W2 (?I1 PRECOND-OF E1683.SK))
		(!W3 (?I2 PRECOND-OF E1683.SK))
		(!W4 (?I3 PRECOND-OF E1683.SK))
		(!W5 (E1677.SK POSTCOND-OF E1683.SK))
		(!W6 (E1683.SK (BEFORE ?X_G)))
		(!W7 (E1677.SK (BEFORE NOW479)))
		(!W8 (E1683.SK (BEFORE NOW480)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.727813 6)
("I had a pony." "I took it for a ride one day."
 "I rode over the hills near my house." "My pony stumbled on a large rock."
 "My pony hurt its leg.")
(EPI-SCHEMA ((ME1705.SK ((ADV-A (FOR.P RIDE1681.SK)) TAKE.1648.V) PONY1676.SK
              (AT.P-ARG ?X_C))
             ** E1683.SK)
	(:ROLES
		(!R1 (PONY1676.SK INANIMATE_OBJECT.N))
		(!R2 (?X_C LOCATION.N))
		(!R3 (NOT (ME1705.SK = PONY1676.SK)))
		(!R4 (ME1705.SK MAN.N))
		(!R5 (HOUSE1689.SK (PERTAIN-TO PONY1676.SK)))
		(!R6 (HOUSE1689.SK BROTHER.N))
		(!R7 (?X_C FARM.N))
		(!R8 (DAY1682.SK (= ME1705.SK)))
		(!R9 (DAY1682.SK DAY.N))
		(!R10 (RIDE1681.SK RIDE.N))
		(!R11 (RIDE1681.SK (= DAY1682.SK)))
		(!R12 (ME1705.SK AGENT.N))
		(!R13 (HOUSE1689.SK (PERTAIN-TO ME1705.SK)))
		(!R14 (HOUSE1689.SK HOUSE.N))
		(!R15 (PONY1676.SK PONY.N))
		(!R16 (PONY1676.SK (PERTAIN-TO ME1705.SK)))
		(!R17 (LEG1703.SK (PERTAIN-TO PONY1676.SK)))
		(!R18 (LEG1703.SK LEG.N))
	)
	(:GOALS
		(?G1 (ME1705.SK (WANT.V (THAT (ME1705.SK (HAVE.V PONY1676.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1705.SK HAVE.V PONY1676.SK)))
		(?I2 (ME1705.SK (AT.P ?X_C)))
		(?I3 (PONY1676.SK (AT.P ?X_C)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E1677.SK (ME1705.SK HAVE.V PONY1676.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1683.SK))
		(!W2 (?I1 PRECOND-OF E1683.SK))
		(!W3 (?I2 PRECOND-OF E1683.SK))
		(!W4 (?I3 PRECOND-OF E1683.SK))
		(!W5 (E1677.SK POSTCOND-OF E1683.SK))
		(!W6 (E1683.SK (BEFORE ?X_G)))
		(!W7 (E1677.SK (BEFORE NOW479)))
		(!W8 (E1683.SK (BEFORE NOW480)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.727813 6)
("I had a pony." "I took it for a ride one day."
 "I rode over the hills near my house." "My pony stumbled on a large rock."
 "My pony hurt its leg.")
(EPI-SCHEMA ((ME1705.SK ((ADV-A (FOR.P RIDE1681.SK)) (HOME.ADV TAKE.1649.V))
              PONY1676.SK (AT.P-ARG ?L))
             ** E1683.SK)
	(:ROLES
		(!R1 (PONY1676.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1705.SK = PONY1676.SK)))
		(!R4 (ME1705.SK (PLUR GIRL.N)))
		(!R5 (PONY1676.SK GIANT.A))
		(!R6 (PONY1676.SK FROG.N))
		(!R7 (HOUSE1689.SK (PLUR FRIEND.N)))
		(!R8 (RIDE1681.SK RIDE.N))
		(!R9 (DAY1682.SK DAY.N))
		(!R10 (RIDE1681.SK (= DAY1682.SK)))
		(!R11 (ME1705.SK AGENT.N))
		(!R12 (HOUSE1689.SK (PERTAIN-TO ME1705.SK)))
		(!R13 (HOUSE1689.SK HOUSE.N))
		(!R14 (PONY1676.SK PONY.N))
		(!R15 (PONY1676.SK VERTEBRATE.N))
		(!R16 (PONY1676.SK (PERTAIN-TO ME1705.SK)))
		(!R17 (LEG1703.SK (PERTAIN-TO PONY1676.SK)))
		(!R18 (LEG1703.SK LEG.N))
	)
	(:GOALS
		(?G1 (ME1705.SK (WANT.V (THAT (ME1705.SK (HAVE.V PONY1676.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1705.SK HAVE.V PONY1676.SK)))
		(?I2 (ME1705.SK (AT.P ?L)))
		(?I3 (PONY1676.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(E1677.SK (ME1705.SK HAVE.V PONY1676.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1683.SK))
		(!W2 (?I1 PRECOND-OF E1683.SK))
		(!W3 (?I2 PRECOND-OF E1683.SK))
		(!W4 (?I3 PRECOND-OF E1683.SK))
		(!W5 (E1677.SK POSTCOND-OF E1683.SK))
		(!W6 (E1683.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1677.SK (BEFORE NOW479)))
		(!W9 (E1683.SK (BEFORE NOW480)))
	)
	(:CERTAINTIES
		(!C1 (!R15 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 4)))
		(!C3 (!R14 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R15 CERTAIN-TO-DEGREE (/ 2 3)))
		(!C5 (!R14 CERTAIN-TO-DEGREE (/ 1 3)))
		(!C6 (!R15 CERTAIN-TO-DEGREE (/ 2 4)))
		(!C7 (!R14 CERTAIN-TO-DEGREE (/ 1 4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 97:
	; "I took my dog to get a bath."
	; "My dog loves to take a bath."
	; "I got the bath water ready for him."
	; "My dog jumped into the bath."
	; "He splashed me with water."
discarding schema TAKE.1290.V learned from this story
; best schemas are:
; TAKE.1391.V
; TAKE.1039.V
; TAKE.413.V
; FOLLOW.69.V
; TAKE.946.V
(setf matches (append matches '(( (4.727813 11)
("I took my dog to get a bath." "My dog loves to take a bath."
 "I got the bath water ready for him." "My dog jumped into the bath."
 "He splashed me with water.")
(EPI-SCHEMA ((ME1727.SK (HOME.ADV TAKE.1650.V) OBJECT1707.SK (AT.P-ARG ?X_B))
             ** E1712.SK)
	(:ROLES
		(!R1 (OBJECT1707.SK INANIMATE_OBJECT.N))
		(!R2 (?X_B LOCATION.N))
		(!R3 (NOT (ME1727.SK = OBJECT1707.SK)))
		(!R4 (ME1727.SK (PLUR GIRL.N)))
		(!R5 (OBJECT1707.SK GIANT.A))
		(!R6 (OBJECT1707.SK FROG.N))
		(!R7 (DOG1711.SK (PLUR FRIEND.N)))
		(!R8 (DOG1711.SK SON.N))
		(!R9 (OBJECT1707.SK (PLUR PEACH.N)))
		(!R10 (DOG1711.SK (PLUR BIKE.N)))
		(!R11 (OBJECT1707.SK GIRL.N))
		(!R12 (OBJECT1707.SK PERSON.N))
		(!R13 (?X_B TOWN.N))
		(!R14 (DOG1711.SK DOG.N))
		(!R15 (DOG1711.SK (PERTAIN-TO ME1727.SK)))
		(!R16 (ME1727.SK AGENT.N))
		(!R17 (OBJECT1707.SK (= DOG1711.SK)))
	)
	(:GOALS
		(?G1 (ME1727.SK (WANT.V (THAT (ME1727.SK (HAVE.V OBJECT1707.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1727.SK HAVE.V OBJECT1707.SK)))
		(?I2 (ME1727.SK (AT.P ?X_B)))
		(?I3 (OBJECT1707.SK (AT.P ?X_B)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME1727.SK HAVE.V OBJECT1707.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1712.SK))
		(!W2 (?I1 PRECOND-OF E1712.SK))
		(!W3 (?I2 PRECOND-OF E1712.SK))
		(!W4 (?I3 PRECOND-OF E1712.SK))
		(!W5 (?P1 POSTCOND-OF E1712.SK))
		(!W6 (E1712.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1712.SK (BEFORE NOW484)))
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
(setf matches (append matches '(( (4.727813 8)
("I took my dog to get a bath." "My dog loves to take a bath."
 "I got the bath water ready for him." "My dog jumped into the bath."
 "He splashed me with water.")
(EPI-SCHEMA ((ME1727.SK (HOME.ADV TAKE.1651.V) OBJECT1707.SK (AT.P-ARG ?L)) **
             E1712.SK)
	(:ROLES
		(!R1 (OBJECT1707.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1727.SK = OBJECT1707.SK)))
		(!R4 (ME1727.SK (PLUR GIRL.N)))
		(!R5 (OBJECT1707.SK GIANT.A))
		(!R6 (OBJECT1707.SK FROG.N))
		(!R7 (DOG1711.SK (PLUR FRIEND.N)))
		(!R8 (DOG1711.SK SON.N))
		(!R9 (OBJECT1707.SK (PLUR PEACH.N)))
		(!R10 (DOG1711.SK DOG.N))
		(!R11 (DOG1711.SK (PERTAIN-TO ME1727.SK)))
		(!R12 (ME1727.SK AGENT.N))
		(!R13 (OBJECT1707.SK (= DOG1711.SK)))
	)
	(:GOALS
		(?G1 (ME1727.SK (WANT.V (THAT (ME1727.SK (HAVE.V OBJECT1707.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1727.SK HAVE.V OBJECT1707.SK)))
		(?I2 (ME1727.SK (AT.P ?L)))
		(?I3 (OBJECT1707.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME1727.SK HAVE.V OBJECT1707.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1712.SK))
		(!W2 (?I1 PRECOND-OF E1712.SK))
		(!W3 (?I2 PRECOND-OF E1712.SK))
		(!W4 (?I3 PRECOND-OF E1712.SK))
		(!W5 (?P1 POSTCOND-OF E1712.SK))
		(!W6 (E1712.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1712.SK (BEFORE NOW484)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.727813 6)
("I took my dog to get a bath." "My dog loves to take a bath."
 "I got the bath water ready for him." "My dog jumped into the bath."
 "He splashed me with water.")
(EPI-SCHEMA ((ME1727.SK (HOME.ADV TAKE.1652.V) OBJECT1707.SK (AT.P-ARG ?L)) **
             E1712.SK)
	(:ROLES
		(!R1 (OBJECT1707.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1727.SK = OBJECT1707.SK)))
		(!R4 (ME1727.SK (PLUR GIRL.N)))
		(!R5 (OBJECT1707.SK GIANT.A))
		(!R6 (OBJECT1707.SK FROG.N))
		(!R7 (DOG1711.SK (PLUR FRIEND.N)))
		(!R8 (DOG1711.SK DOG.N))
		(!R9 (DOG1711.SK (PERTAIN-TO ME1727.SK)))
		(!R10 (ME1727.SK AGENT.N))
		(!R11 (OBJECT1707.SK (= DOG1711.SK)))
	)
	(:GOALS
		(?G1 (ME1727.SK (WANT.V (THAT (ME1727.SK (HAVE.V OBJECT1707.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1727.SK HAVE.V OBJECT1707.SK)))
		(?I2 (ME1727.SK (AT.P ?L)))
		(?I3 (OBJECT1707.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (ME1727.SK HAVE.V OBJECT1707.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1712.SK))
		(!W2 (?I1 PRECOND-OF E1712.SK))
		(!W3 (?I2 PRECOND-OF E1712.SK))
		(!W4 (?I3 PRECOND-OF E1712.SK))
		(!W5 (?P1 POSTCOND-OF E1712.SK))
		(!W6 (E1712.SK (BEFORE ?X_F)))
		(!W7 (?X_E (BEFORE ?X_F)))
		(!W8 (E1712.SK (BEFORE NOW484)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 98:
	; "We just got a new rug."
	; "It was very plush."
	; "Our cat started playing with the edge."
	; "My wife yelled at the cat."
	; "She ran away."
discarding schema GET.1322.V learned from this story
; best schemas are:
; TAKE.1391.V
; GET.88.V
; TAKE.1039.V
; GIVE.194.V
; GO.866.V
(setf matches (append matches '(( (5.6533546 5)
("We just got a new rug." "It was very plush."
 "Our cat started playing with the edge." "My wife yelled at the cat."
 "She ran away.")
(EPI-SCHEMA ((WE1747.SK GET.1667.V RUG1733.SK (AT.P-ARG EDGE1739.SK)) **
             E1734.SK)
	(:ROLES
		(!R1 (RUG1733.SK INANIMATE_OBJECT.N))
		(!R2 (EDGE1739.SK LOCATION.N))
		(!R3 (NOT (WE1747.SK = RUG1733.SK)))
		(!R4 (RUG1733.SK CAT.N))
		(!R5 (WE1747.SK WIFE.N))
		(!R6 (WE1747.SK (PERTAIN-TO ?X_C)))
		(!R7 (?G1 (RIGHT-AFTER ?X_D)))
		(!R8 (RUG1733.SK RUG.N))
		(!R9 (RUG1733.SK NEW.A))
		(!R10 (EDGE1739.SK EDGE.N))
		(!R11 (E1736.SK (RIGHT-AFTER U490)))
		(!R12 (CAT1737.SK CAT.N))
		(!R13 (CAT1737.SK (PERTAIN-TO WE1747.SK)))
		(!R14 (WE1747.SK AGENT.N))
	)
	(:GOALS
		(?G1 (WE1747.SK (WANT.V (THAT (WE1747.SK (HAVE.V RUG1733.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (WE1747.SK HAVE.V RUG1733.SK)))
		(?I2 (WE1747.SK (AT.P EDGE1739.SK)))
		(?I3 (RUG1733.SK (AT.P EDGE1739.SK)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (WE1747.SK HAVE.V RUG1733.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1734.SK))
		(!W2 (?I1 PRECOND-OF E1734.SK))
		(!W3 (?I2 PRECOND-OF E1734.SK))
		(!W4 (?I3 PRECOND-OF E1734.SK))
		(!W5 (?P1 POSTCOND-OF E1734.SK))
		(!W6 (E1734.SK (BEFORE ?X_I)))
		(!W7 (E1736.SK (SAME-TIME ?X_I)))
		(!W8 (?G1 (SAME-TIME ?X_L)))
		(!W9 (?X_K (AT-ABOUT ?X_L)))
		(!W10 (E1734.SK (BEFORE NOW489)))
		(!W11 (E1736.SK (SAME-TIME NOW491)))
		(!W12 (E1740.SK (BEFORE NOW491)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 99:
	; "The man went to prison."
	; "He was innocent."
	; "He asked for another trial."
	; "It took five years to get one."
	; "He was found to be innocent."
discarding schema FIND.1366.V learned from this story
discarding schema GO.1367.V learned from this story
; best schemas are:
; GO.866.V
; SHOP.797.V
; GO.423.V
; FIND.773.V
(setf matches (append matches '(( (3.905 5)
("The man went to prison." "He was innocent." "He asked for another trial."
 "It took five years to get one." "He was found to be innocent.")
(EPI-SCHEMA ((MAN1750.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K PRISON.N))) GO.1714.V))
              (K PRISON.N))
             ** E1749.SK)
	(:ROLES
		(!R1 (MAN1750.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K PRISON.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K PRISON.N))))
		(!R5 (?X_A (PLUR PERSON.N)))
		(!R6 (MAN1750.SK FRIEND.N))
		(!R7 (MAN1750.SK (PERTAIN-TO MAN1750.SK)))
		(!R8 (?X_F (PERTAIN-TO MAN1750.SK)))
		(!R9 (?X_F EYE.N))
		(!R10 (E1749.SK (RIGHT-AFTER U493)))
		(!R11 (MAN1750.SK MAN.N))
		(!R12 (MAN1750.SK PERSON.N))
	)
	(:GOALS
		(?G1 (MAN1750.SK (WANT.V (KA ((ADV-A (AT.P (K PRISON.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1750.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1750.SK (AT.P (K PRISON.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1750.SK (AT.P ?L1))))
		(?P2 (MAN1750.SK (AT.P (K PRISON.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1749.SK))
		(!W2 (?I2 BEFORE E1749.SK))
		(!W3 (?P1 AFTER E1749.SK))
		(!W4 (?P2 AFTER E1749.SK))
		(!W5 (?G1 CAUSE-OF E1749.SK))
		(!W6 (E1749.SK (BEFORE ?X_E)))
		(!W7 (?G1 (BEFORE ?X_G)))
		(!W8 (E1749.SK (SAME-TIME NOW494)))
		(!W9 (E1752.SK (BEFORE NOW494)))
	)
	(:CERTAINTIES
		(!C1 (!R12 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 3)))
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
(setf matches (append matches '(( (4.4049997 5)
("The man went to prison." "He was innocent." "He asked for another trial."
 "It took five years to get one." "He was found to be innocent.")
(EPI-SCHEMA ((MAN1750.SK
              (OUT.ADV
               ((ADV-A (TO.P (K PRISON.N))) ((ADV-A (FROM.P ?L1)) GO.1716.V)))
              (K PRISON.N))
             ** E1749.SK)
	(:ROLES
		(!R1 (MAN1750.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K PRISON.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K PRISON.N))))
		(!R5 ((K PRISON.N) MAILBOX.N))
		(!R6 ((K PRISON.N) (PERTAIN-TO MAN1750.SK)))
		(!R7 (?X_B PAPER.N))
		(!R8 (?X_B (PERTAIN-TO MAN1750.SK)))
		(!R9 (?X_C ((NN PAPER.N) BOY.N)))
		(!R10 (?X_C (PERTAIN-TO MAN1750.SK)))
		(!R11 (MAN1750.SK MAN.N))
		(!R12 (E1749.SK (RIGHT-AFTER U493)))
	)
	(:GOALS
		(?G1 (MAN1750.SK (WANT.V (KA ((ADV-A (AT.P (K PRISON.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1750.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1750.SK (AT.P (K PRISON.N)))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1750.SK (AT.P ?L1))))
		(?P2 (MAN1750.SK (AT.P (K PRISON.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1749.SK))
		(!W2 (?I2 BEFORE E1749.SK))
		(!W3 (?P1 AFTER E1749.SK))
		(!W4 (?P2 AFTER E1749.SK))
		(!W5 (?G1 CAUSE-OF E1749.SK))
		(!W6 (E1749.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E1749.SK (SAME-TIME NOW494)))
		(!W9 (E1752.SK (BEFORE NOW494)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.905 0)
("The man went to prison." "He was innocent." "He asked for another trial."
 "It took five years to get one." "He was found to be innocent.")
(EPI-SCHEMA ((MAN1750.SK
              ((ADV-A (FOR.P (KA INNOCENT.A)))
               ((ADV-A (ON.P ?X_A)) FIND.1717.V))
              ?X_E)
             ** E1756.SK)
	(:ROLES
		(!R1 (MAN1750.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (?X_A GROUND.N))
		(!R4 (?X_E BAG.N))
		(!R5 (E1756.SK (RIGHT-AFTER ?X_B)))
		(!R6 (?X_C (PERTAIN-TO MAN1750.SK)))
		(!R7 (?X_C WIFE.N))
		(!R8 (MAN1750.SK MAN.N))
	)
	(:PRECONDS
		(?I1 (MAN1750.SK (AT.P ?L)))
		(?I2 (?X_E (AT.P ?L)))
		(?I3 (MAN1750.SK ((ADV-A (FOR.P ?X_E)) SEARCH.V)))
		(?I4 (NOT (MAN1750.SK (KNOW.V (THAT (?X_E (AT.P ?L)))))))
		(?I5 (NOT (MAN1750.SK (HAVE.V ?X_E))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (MAN1750.SK (KNOW.V (THAT (?X_E (AT.P ?L))))))
		(?P2 (MAN1750.SK (HAVE.V ?X_E)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1756.SK (SAME-TIME ?X_H)))
		(!W2 (?X_G (BEFORE ?X_H)))
		(!W3 (E1756.SK (BEFORE NOW498)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

