(setf matches (list))
(setf chain-matches (list))
; story 0:
	; "Three birds are in the tree."
	; "One is a pretty red bird."
	; "You can not catch it."
	; "It is high in the tree."
	; "The red bird can see the boys with the drum."
	; "It can see the little girl with the red dress."
	; "It can see the good baby and the pretty doll."
	; "It can see the man in the field."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; PLAY.301.V
; PLAY.402.V
; PLAY.431.V
; PLAY.195.V
; TAKE.928.V

; story 1:
	; "I see a man and a dog and a cow."
	; "The cow is with the man."
	; "The dog has a big hat."
	; "He is a good little dog."
	; "He may take the hat to the man."
	; "The man is good to the dog."
	; "The cow can run."
	; "She can not play."
; best schemas are:
; PLAY.402.V
; PLAY.431.V
; PLAY.V
; TAKE.928.V
; TAKE.946.V
; TAKE.1.V

; story 2:
	; "Koy is teaching Carlo to beg."
	; "He stands and says, Beg, Carlo, beg."
	; "It is a bun."
	; "Beg, and you may have it."
	; "Carlo stands on his hind feet."
	; "He looks at the bun which Roy has in his hand and says, Bowwow, bow-wow."
	; "Ned sits and looks at Carlo."
	; "Roy will give the bun to Carlo."
discarding schema SIT.118.V learned from this story
; best schemas are:
; GO.1083.V
; SIT.V
; SIT.211.V
; SIT.1381.V
; SIT.505.V
(setf matches (append matches '(( (2.5 1)
("Koy is teaching Carlo to beg." "He stands and says, Beg, Carlo, beg."
 "It is a bun." "Beg, and you may have it." "Carlo stands on his hind feet."
 "He looks at the bun which Roy has in his hand and says, Bowwow, bow-wow."
 "Ned sits and looks at Carlo." "Roy will give the bun to Carlo.")
(EPI-SCHEMA ((NED.NAME
              (SOMETIMES.ADV
               ((ADV-A (IN.P ?X_B)) ((ADV-A (ON.P ?X_B)) SIT.146.V))))
             ** E120.SK)
	(:ROLES
		(!R1 (?X_B INANIMATE_OBJECT.N))
		(!R2 (?X_B FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NED.NAME AGENT.N))
		(!R5 (?X_B BRIDGE.N))
		(!R6 (?X_B ARTIFACT.N))
	)
	(:GOALS
		(?G1 (NED.NAME (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (NED.NAME (AT.P ?L)))
		(?I2 (?X_B (AT.P ?L)))
	)
	(:STEPS
	)
	(:EPISODE-RELATIONS
		(!W1 (E120.SK (AT-ABOUT ?X_D)))
		(!W2 (E120.SK (AT-ABOUT NOW22)))
		(!W3 (E119.SK (AT-ABOUT NOW22)))
	)
	(:CERTAINTIES
		(!C1 (!R6 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R2 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 3:
	; "The man is showing the horse."
	; "He holds the horse's foot."
	; "The shoes are made of iron."
	; "The man nails them on to the horse's hoofs."
	; "It does not hurt the horse."
	; "His hoofs are hard."
; best schemas are:
; TAKE.135.V
; PLAY.920.V
; PLAY.402.V
; PLAY.431.V
; PLAY.437.V
; MAKE.V

; story 4:
	; "Hal has a red drum."
	; "The drum is yellow."
	; "Ned has a gun."
	; "Max has a big flag."
	; "It is red white and blue."
	; "All three boys have caps."
; best schemas are:
; TAKE.135.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 5:
	; "I can see a bird on the tree."
	; "It has two legs."
	; "It has a small bill, and a long tail."
	; "It has wings, and can fly."
	; "It can fly over a tall tree."
	; "It can fly so high that we can not see it."
	; "It's nest is up in the tree."
	; "It will sing."
; best schemas are:
; TAKE.1391.V
; FIND.1167.V
; CLIMB_GET_EAT.349.PR
; PLAY.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
; PLAY.920.V

; story 6:
	; "The boys like to go to the woods."
	; "Here they are now."
	; "Here are the horse and the wagon."
	; "And here is the boy with the drum."
	; "They like to play in the woods."
	; "They like to find pretty flowers."
	; "If they find little birds in a nest, they will not take them."
	; "By and by they will go home."
	; "They will ride home in the wagon."
; best schemas are:
; GO.658.V
; FIND.518.V
; TAKE.946.V
; TAKE.413.V
; PLAY.920.V
; GO.423.V

; story 7:
	; "The boys like to go to the woods."
	; "Here they are now."
	; "Here are the horse and the wagon."
	; "And here is the boy with the drum."
	; "They like to play in the woods."
	; "They like to find pretty flowers."
	; "If they find little birds in a nest, they will not take them."
	; "By and by they will go home."
	; "They will ride home in the wagon."
; best schemas are:
; GO.658.V
; FIND.518.V
; TAKE.946.V
; TAKE.413.V
; PLAY.920.V
; GO.423.V

; story 8:
	; "My horse is strong and kind."
	; "He will let me ride on his back."
	; "He draws me in a wagon."
	; "He can trot, and run."
	; "He can run as fast as Tom's horse."
	; "I call him Dan."
	; "He will come if I call him."
	; "He will eat from my hand."
discarding schema FEED.196.V learned from this story
discarding schema EAT.195.V learned from this story
; best schemas are:
; FEED.343.V
; FEED.351.V
; PLAY.920.V
; FEED.288.V
(setf matches (append matches '(( (2.7278125 6)
("My horse is strong and kind." "He will let me ride on his back."
 "He draws me in a wagon." "He can trot, and run."
 "He can run as fast as Tom's horse." "I call him Dan."
 "He will come if I call him." "He will eat from my hand.")
(EPI-SCHEMA ((TOM.NAME FEED.245.V HE.PRO ?F) ** ?E)
	(:ROLES
		(!R1 (?F FOOD.N))
		(!R2 (NOT (TOM.NAME = HE.PRO)))
		(!R3 (NOT (HE.PRO = ?F)))
		(!R4 (NOT (TOM.NAME = ?F)))
		(!R5 (E335.SK (RIGHT-AFTER ?X_A)))
		(!R6 (TOM.NAME AGENT.N))
		(!R7 (HORSE322.SK PAPA.N))
		(!R8 (HORSE322.SK (DEAR.ADV PAPA.N)))
		(!R9 (HAND333.SK (PERTAIN-TO TOM.NAME)))
		(!R10 (HE.PRO (PLUR RABBIT.N)))
		(!R11 (HE.PRO (PERTAIN-TO TOM.NAME)))
		(!R12 (HAND333.SK HAND.N))
		(!R13 (HE.PRO MALE.A))
		(!R14 (HE.PRO AGENT.N))
		(!R15 (HORSE301.SK HORSE.N))
		(!R16 (HORSE301.SK (PERTAIN-TO HAND333.SK)))
		(!R17 (HAND333.SK (PERTAIN-TO ME.PRO)))
		(!R18 (BACK314.SK BACK.N))
		(!R19 (BACK314.SK (PERTAIN-TO HORSE301.SK)))
		(!R20 (HORSE322.SK HORSE.N))
		(!R21 (HORSE322.SK (PERTAIN-TO TOM.NAME)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (NOT (HE.PRO HUNGRY.A))))))
		(?G2
   (TOM.NAME (WANT.V (THAT (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) ?F)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME HAVE.V ?F))
		(?I2 (HE.PRO HUNGRY.A))
	)
	(:STEPS
		(E335.SK (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (HAVE.V ?F))))
		(?P2 (NOT (HE.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E335.SK AFTER ?E))
		(!W2 (E335.SK (SAME-TIME ?X_H)))
		(!W3 (?X_G (AT-ABOUT ?X_H)))
		(!W4 (E335.SK (AFTER E331.SK)))
		(!W5 (E331.SK (AT-ABOUT NOW69)))
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
(setf matches (append matches '(( (2.6328125 6)
("My horse is strong and kind." "He will let me ride on his back."
 "He draws me in a wagon." "He can trot, and run."
 "He can run as fast as Tom's horse." "I call him Dan."
 "He will come if I call him." "He will eat from my hand.")
(EPI-SCHEMA ((HORSE301.SK FEED.240.V HE.PRO ?F) ** ?E)
	(:ROLES
		(!R1 (?F FOOD.N))
		(!R2 (NOT (HORSE301.SK = HE.PRO)))
		(!R3 (NOT (HE.PRO = ?F)))
		(!R4 (NOT (HORSE301.SK = ?F)))
		(!R5 (E335.SK (RIGHT-AFTER ?X_A)))
		(!R6 (HORSE301.SK AGENT.N))
		(!R7 (BACK314.SK PAPA.N))
		(!R8 (BACK314.SK (DEAR.ADV PAPA.N)))
		(!R9 (HAND333.SK (PERTAIN-TO HORSE301.SK)))
		(!R10 (HE.PRO (PLUR RABBIT.N)))
		(!R11 (HE.PRO (PERTAIN-TO HORSE301.SK)))
		(!R12 (HE.PRO MALE.A))
		(!R13 (HE.PRO AGENT.N))
		(!R14 (BACK314.SK BACK.N))
		(!R15 (BACK314.SK (PERTAIN-TO HORSE301.SK)))
		(!R16 (HORSE301.SK HORSE.N))
		(!R17 (HORSE301.SK (PERTAIN-TO HAND333.SK)))
		(!R18 (HAND333.SK HAND.N))
		(!R19 (HAND333.SK (PERTAIN-TO ME.PRO)))
	)
	(:GOALS
		(?G1 (HORSE301.SK (WANT.V (THAT (NOT (HE.PRO HUNGRY.A))))))
		(?G2
   (HORSE301.SK
    (WANT.V (THAT (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) ?F)))))
	)
	(:PRECONDS
		(?I1 (HORSE301.SK HAVE.V ?F))
		(?I2 (HE.PRO HUNGRY.A))
	)
	(:STEPS
		(E335.SK (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (HORSE301.SK (HAVE.V ?F))))
		(?P2 (NOT (HE.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E335.SK AFTER ?E))
		(!W2 (E335.SK (SAME-TIME ?X_H)))
		(!W3 (?X_G (AT-ABOUT ?X_H)))
		(!W4 (E335.SK (AFTER E331.SK)))
		(!W5 (E331.SK (AT-ABOUT NOW69)))
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
(setf matches (append matches '(( (2.2278125 6)
("My horse is strong and kind." "He will let me ride on his back."
 "He draws me in a wagon." "He can trot, and run."
 "He can run as fast as Tom's horse." "I call him Dan."
 "He will come if I call him." "He will eat from my hand.")
(EPI-SCHEMA ((ME.PRO FEED.241.V HE.PRO ?F) ** ?E)
	(:ROLES
		(!R1 (?F FOOD.N))
		(!R2 (NOT (ME.PRO = HE.PRO)))
		(!R3 (NOT (HE.PRO = ?F)))
		(!R4 (NOT (ME.PRO = ?F)))
		(!R5 (E335.SK (RIGHT-AFTER ?X_A)))
		(!R6 (ME.PRO AGENT.N))
		(!R7 (HAND333.SK PAPA.N))
		(!R8 (HAND333.SK (DEAR.ADV PAPA.N)))
		(!R9 (HE.PRO (PLUR RABBIT.N)))
		(!R10 (HE.PRO (PERTAIN-TO ME.PRO)))
		(!R11 (HE.PRO MALE.A))
		(!R12 (HE.PRO AGENT.N))
		(!R13 (HAND333.SK HAND.N))
		(!R14 (HAND333.SK (PERTAIN-TO ME.PRO)))
		(!R15 (HORSE301.SK (PERTAIN-TO HAND333.SK)))
		(!R16 (HORSE301.SK HORSE.N))
		(!R17 (BACK314.SK (PERTAIN-TO HORSE301.SK)))
		(!R18 (BACK314.SK BACK.N))
	)
	(:GOALS
		(?G1 (ME.PRO (WANT.V (THAT (NOT (HE.PRO HUNGRY.A))))))
		(?G2 (ME.PRO (WANT.V (THAT (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) ?F)))))
	)
	(:PRECONDS
		(?I1 (ME.PRO HAVE.V ?F))
		(?I2 (HE.PRO HUNGRY.A))
	)
	(:STEPS
		(E335.SK (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (ME.PRO (HAVE.V ?F))))
		(?P2 (NOT (HE.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E335.SK AFTER ?E))
		(!W2 (E335.SK (SAME-TIME ?X_H)))
		(!W3 (?X_G (AT-ABOUT ?X_H)))
		(!W4 (E335.SK (AFTER E331.SK)))
		(!W5 (E331.SK (AT-ABOUT NOW69)))
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
(setf matches (append matches '(( (2.7278125 6)
("My horse is strong and kind." "He will let me ride on his back."
 "He draws me in a wagon." "He can trot, and run."
 "He can run as fast as Tom's horse." "I call him Dan."
 "He will come if I call him." "He will eat from my hand.")
(EPI-SCHEMA ((TOM.NAME FEED.264.V HE.PRO ?F) ** ?E)
	(:ROLES
		(!R1 (?F FOOD.N))
		(!R2 (NOT (TOM.NAME = HE.PRO)))
		(!R3 (NOT (HE.PRO = ?F)))
		(!R4 (NOT (TOM.NAME = ?F)))
		(!R5 (?X_G (RIGHT-AFTER ?X_A)))
		(!R6 (TOM.NAME AGENT.N))
		(!R7 (HE.PRO (PLUR RABBIT.N)))
		(!R8 (HE.PRO (PERTAIN-TO TOM.NAME)))
		(!R9 (HAND333.SK (PERTAIN-TO TOM.NAME)))
		(!R10 (HORSE322.SK PAPA.N))
		(!R11 (HORSE322.SK (DEAR.ADV PAPA.N)))
		(!R12 (HE.PRO MALE.A))
		(!R13 (HE.PRO AGENT.N))
		(!R14 (HAND333.SK HAND.N))
		(!R15 (HORSE301.SK (PERTAIN-TO HAND333.SK)))
		(!R16 (HORSE301.SK HORSE.N))
		(!R17 (HAND333.SK (PERTAIN-TO ME.PRO)))
		(!R18 (BACK314.SK (PERTAIN-TO HORSE301.SK)))
		(!R19 (BACK314.SK BACK.N))
		(!R20 (HORSE322.SK HORSE.N))
		(!R21 (HORSE322.SK (PERTAIN-TO TOM.NAME)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (NOT (HE.PRO HUNGRY.A))))))
		(?G2
   (TOM.NAME (WANT.V (THAT (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) ?F)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME HAVE.V ?F))
		(?I2 (HE.PRO HUNGRY.A))
	)
	(:STEPS
		(E335.SK (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (TOM.NAME (HAVE.V ?F))))
		(?P2 (NOT (HE.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E335.SK AFTER ?E))
		(!W2 (E335.SK (AT-ABOUT ?X_H)))
		(!W3 (?X_G (SAME-TIME ?X_H)))
		(!W4 (E335.SK (AFTER E331.SK)))
		(!W5 (E331.SK (AT-ABOUT NOW69)))
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
(setf matches (append matches '(( (2.6328125 6)
("My horse is strong and kind." "He will let me ride on his back."
 "He draws me in a wagon." "He can trot, and run."
 "He can run as fast as Tom's horse." "I call him Dan."
 "He will come if I call him." "He will eat from my hand.")
(EPI-SCHEMA ((HORSE301.SK FEED.268.V HE.PRO ?F) ** ?E)
	(:ROLES
		(!R1 (?F FOOD.N))
		(!R2 (NOT (HORSE301.SK = HE.PRO)))
		(!R3 (NOT (HE.PRO = ?F)))
		(!R4 (NOT (HORSE301.SK = ?F)))
		(!R5 (?X_G (RIGHT-AFTER ?X_A)))
		(!R6 (HORSE301.SK AGENT.N))
		(!R7 (HE.PRO (PLUR RABBIT.N)))
		(!R8 (HE.PRO (PERTAIN-TO HORSE301.SK)))
		(!R9 (HAND333.SK (PERTAIN-TO HORSE301.SK)))
		(!R10 (BACK314.SK PAPA.N))
		(!R11 (BACK314.SK (DEAR.ADV PAPA.N)))
		(!R12 (HE.PRO MALE.A))
		(!R13 (HE.PRO AGENT.N))
		(!R14 (BACK314.SK BACK.N))
		(!R15 (BACK314.SK (PERTAIN-TO HORSE301.SK)))
		(!R16 (HORSE301.SK HORSE.N))
		(!R17 (HORSE301.SK (PERTAIN-TO HAND333.SK)))
		(!R18 (HAND333.SK HAND.N))
		(!R19 (HAND333.SK (PERTAIN-TO ME.PRO)))
	)
	(:GOALS
		(?G1 (HORSE301.SK (WANT.V (THAT (NOT (HE.PRO HUNGRY.A))))))
		(?G2
   (HORSE301.SK
    (WANT.V (THAT (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) ?F)))))
	)
	(:PRECONDS
		(?I1 (HORSE301.SK HAVE.V ?F))
		(?I2 (HE.PRO HUNGRY.A))
	)
	(:STEPS
		(E335.SK (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (HORSE301.SK (HAVE.V ?F))))
		(?P2 (NOT (HE.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E335.SK AFTER ?E))
		(!W2 (E335.SK (AT-ABOUT ?X_H)))
		(!W3 (?X_G (SAME-TIME ?X_H)))
		(!W4 (E335.SK (AFTER E331.SK)))
		(!W5 (E331.SK (AT-ABOUT NOW69)))
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
(setf matches (append matches '(( (2.2278125 6)
("My horse is strong and kind." "He will let me ride on his back."
 "He draws me in a wagon." "He can trot, and run."
 "He can run as fast as Tom's horse." "I call him Dan."
 "He will come if I call him." "He will eat from my hand.")
(EPI-SCHEMA ((ME.PRO FEED.263.V HE.PRO ?F) ** ?E)
	(:ROLES
		(!R1 (?F FOOD.N))
		(!R2 (NOT (ME.PRO = HE.PRO)))
		(!R3 (NOT (HE.PRO = ?F)))
		(!R4 (NOT (ME.PRO = ?F)))
		(!R5 (?X_G (RIGHT-AFTER ?X_A)))
		(!R6 (ME.PRO AGENT.N))
		(!R7 (HE.PRO (PLUR RABBIT.N)))
		(!R8 (HE.PRO (PERTAIN-TO ME.PRO)))
		(!R9 (HAND333.SK PAPA.N))
		(!R10 (HAND333.SK (DEAR.ADV PAPA.N)))
		(!R11 (HE.PRO MALE.A))
		(!R12 (HE.PRO AGENT.N))
		(!R13 (HAND333.SK HAND.N))
		(!R14 (HAND333.SK (PERTAIN-TO ME.PRO)))
		(!R15 (HORSE301.SK HORSE.N))
		(!R16 (HORSE301.SK (PERTAIN-TO HAND333.SK)))
		(!R17 (BACK314.SK (PERTAIN-TO HORSE301.SK)))
		(!R18 (BACK314.SK BACK.N))
	)
	(:GOALS
		(?G1 (ME.PRO (WANT.V (THAT (NOT (HE.PRO HUNGRY.A))))))
		(?G2 (ME.PRO (WANT.V (THAT (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) ?F)))))
	)
	(:PRECONDS
		(?I1 (ME.PRO HAVE.V ?F))
		(?I2 (HE.PRO HUNGRY.A))
	)
	(:STEPS
		(E335.SK (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (ME.PRO (HAVE.V ?F))))
		(?P2 (NOT (HE.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E335.SK AFTER ?E))
		(!W2 (E335.SK (AT-ABOUT ?X_H)))
		(!W3 (?X_G (SAME-TIME ?X_H)))
		(!W4 (E335.SK (AFTER E331.SK)))
		(!W5 (E331.SK (AT-ABOUT NOW69)))
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
(setf matches (append matches '(( (4.1328125 8)
("My horse is strong and kind." "He will let me ride on his back."
 "He draws me in a wagon." "He can trot, and run."
 "He can run as fast as Tom's horse." "I call him Dan."
 "He will come if I call him." "He will eat from my hand.")
(EPI-SCHEMA ((HORSE322.SK FEED.286.V HE.PRO HAND333.SK) ** ?X_D)
	(:ROLES
		(!R1 (HORSE322.SK AGENT.N))
		(!R2 (HAND333.SK FOOD.N))
		(!R3 (NOT (HORSE322.SK = HE.PRO)))
		(!R4 (NOT (HE.PRO = HAND333.SK)))
		(!R5 (NOT (HORSE322.SK = HAND333.SK)))
		(!R6 (HE.PRO MAN.N))
		(!R7 (HE.PRO HOMELESS.A))
		(!R8 (HAND333.SK HELPING.A))
		(!R9 (HE.PRO MALE.A))
		(!R10 (HE.PRO AGENT.N))
		(!R11 (HORSE322.SK HORSE.N))
		(!R12 (HORSE322.SK (PERTAIN-TO TOM.NAME)))
		(!R13 (HAND333.SK HAND.N))
		(!R14 (HORSE301.SK (PERTAIN-TO HAND333.SK)))
		(!R15 (HORSE301.SK HORSE.N))
		(!R16 (HAND333.SK (PERTAIN-TO ME.PRO)))
		(!R17 (BACK314.SK BACK.N))
		(!R18 (BACK314.SK (PERTAIN-TO HORSE301.SK)))
	)
	(:GOALS
		(?G1 (HORSE322.SK (WANT.V (THAT (NOT (HE.PRO HUNGRY.A))))))
		(?G2
   (HORSE322.SK
    (WANT.V (THAT (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) HAND333.SK)))))
	)
	(:PRECONDS
		(?I1 (HORSE322.SK HAVE.V HAND333.SK))
		(?I2 (HE.PRO HUNGRY.A))
	)
	(:STEPS
		(E335.SK (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) HAND333.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (HORSE322.SK (HAVE.V HAND333.SK))))
		(?P2 (NOT (HE.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E335.SK AFTER ?X_D))
		(!W2 (?X_D (BEFORE ?X_E)))
		(!W3 (E335.SK (AFTER E331.SK)))
		(!W4 (E331.SK (AT-ABOUT NOW69)))
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

; story 9:
	; "An old hen sat on eight eggs."
	; "Soon she had in her nest six little chickens and two ducks."
	; "Every day the hen took them into the yard."
	; "She was very proud of them."
	; "She scratched the ground and found worms for them to eat."
	; "Every night she took them back to the nest.They slept all night under her wings."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
; FLY.235.V
; TAKE.1391.V
; TAKE.189.V
; FIND.1167.V
; RUN.28.V

; story 10:
	; "This is little Lucy."
	; "Her home is far away."
	; "She has come to see  Frank and May."
	; "All the little girls love Lucy."
	; "They are kind and good to her, and she loves them."
	; "Frank will let her ride with him in the big wagon."
	; "He will give her the whip, and the horse will go fast."
	; "The horse will go fast and far, but he will not run away."
discarding schema COME.280.V learned from this story
; best schemas are:
; GO.658.V
; COME.605.V
; TAKE.413.V
; TAKE.135.V
; PLAY.920.V
(setf matches (append matches '(( (3.7278125 1)
("This is little Lucy." "Her home is far away."
 "She has come to see  Frank and May." "All the little girls love Lucy."
 "They are kind and good to her, and she loves them."
 "Frank will let her ride with him in the big wagon."
 "He will give her the whip, and the horse will go fast."
 "The horse will go fast and far, but he will not run away.")
(EPI-SCHEMA ((SHE383.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P HOME350.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.379.V)))
              ?L2)
             ** E354.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (HOME350.SK (PLUR FRIEND.N)))
		(!R5 (SHE383.SK GIRL.N))
		(!R6 (E357.SK (IMPINGES-ON E354.SK)))
		(!R7 (HOME350.SK HOME.N))
		(!R8 (HOME350.SK (PERTAIN-TO SHE383.SK)))
		(!R9 (SHE383.SK AGENT.N))
	)
	(:GOALS
		(?G1 (SHE383.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SHE383.SK (AT.P ?L1)))
		(?I2 (NOT (SHE383.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SHE383.SK (AT.P ?L1))))
		(?P2 (SHE383.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E354.SK))
		(!W2 (?I2 BEFORE E354.SK))
		(!W3 (?P1 AFTER E354.SK))
		(!W4 (?P2 AFTER E354.SK))
		(!W5 (?G1 CAUSE-OF E354.SK))
		(!W6 (E354.SK (BEFORE ?X_E)))
		(!W7 (E354.SK (AT-ABOUT NOW78)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.2278125 2)
("This is little Lucy." "Her home is far away."
 "She has come to see  Frank and May." "All the little girls love Lucy."
 "They are kind and good to her, and she loves them."
 "Frank will let her ride with him in the big wagon."
 "He will give her the whip, and the horse will go fast."
 "The horse will go fast and far, but he will not run away.")
(EPI-SCHEMA ((SHE383.SK
              ((ADV-A (FOR.P (KA VISIT.V)))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.380.V)))
              ?L2)
             ** E354.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (E354.SK (RIGHT-AFTER ?X_A)))
		(!R5 (SHE383.SK FRIEND.N))
		(!R6 (SHE383.SK (PERTAIN-TO SHE383.SK)))
		(!R7 (HOME350.SK (PLUR BROTHER.N)))
		(!R8 (E357.SK (IMPINGES-ON E354.SK)))
		(!R9 (HOME350.SK HOME.N))
		(!R10 (HOME350.SK (PERTAIN-TO SHE383.SK)))
		(!R11 (SHE383.SK AGENT.N))
	)
	(:GOALS
		(?G1 (SHE383.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SHE383.SK (AT.P ?L1)))
		(?I2 (NOT (SHE383.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SHE383.SK (AT.P ?L1))))
		(?P2 (SHE383.SK (AT.P ?L2)))
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
		(!W9 (E354.SK (AT-ABOUT NOW78)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 11:
	; "What is in this monkey's hands?"
	; "The monkey has a cocoanut."
	; "He likes the cocoanut."
	; "He will eat it."
	; "The monkey is brown."
	; "It has a large tail."
	; "His eyes are large."
; best schemas are:
; FEED.324.V
; FEED.325.V
; EAT.323.V
; CLIMB_GET_EAT.349.PR
; FEED.343.V
; FEED.351.V
(setf matches (append matches '(( (4.727813 5)
("What is in this monkey's hands?" "The monkey has a cocoanut."
 "He likes the cocoanut." "He will eat it." "The monkey is brown."
 "It has a large tail." "His eyes are large.")
(EPI-SCHEMA ((HE.PRO EAT.461.V IT.PRO) ** E399.SK)
	(:ROLES
		(!R1 (IT.PRO FOOD.N))
		(!R2 (HE.PRO MONKEY.N))
		(!R3 (IT.PRO COCOANUT.N))
		(!R4 (?X_A GROUND.N))
		(!R5 (IT.PRO (TO.P ?X_A)))
		(!R6 (HE.PRO MALE.A))
		(!R7 (HE.PRO AGENT.N))
		(!R8 (EYE422.SK (PERTAIN-TO HE.PRO)))
		(!R9 (EYE422.SK (PLUR EYE.N)))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (NOT (HE.PRO HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 (HE.PRO HAVE.V IT.PRO))
		(?I2 (HE.PRO HUNGRY.A))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (HAVE.V IT.PRO))))
		(?P2 (NOT (HE.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E399.SK))
		(!W2 (?I1 BEFORE E399.SK))
		(!W3 (E399.SK CAUSE-OF ?P1))
		(!W4 (?X_E (CONSEC E399.SK)))
		(!W5 (E399.SK (DURING ?X_G)))
		(!W6 (?X_E (DURING ?X_G)))
		(!W7 (?X_F (AT-ABOUT ?X_H)))
		(!W8 (?X_G (AT-ABOUT ?X_H)))
		(!W9 (E399.SK (AFTER E398.SK)))
		(!W10 (E398.SK (AT-ABOUT NOW87)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.7278125 6)
("What is in this monkey's hands?" "The monkey has a cocoanut."
 "He likes the cocoanut." "He will eat it." "The monkey is brown."
 "It has a large tail." "His eyes are large.")
(EPI-SCHEMA ((HE.PRO CLIMB_GET_EAT.462.PR HAND389.SK IT.PRO) ** ?E)
	(:ROLES
		(!R1 (HAND389.SK TREE.N))
		(!R2 (IT.PRO INANIMATE_OBJECT.N))
		(!R3 (NOT (HE.PRO = IT.PRO)))
		(!R4 (HAND389.SK LOCATION.N))
		(!R5 (IT.PRO FOOD.N))
		(!R6 (IT.PRO COCOANUT.N))
		(!R7 (HE.PRO MONKEY.N))
		(!R8 (HE.PRO MALE.A))
		(!R9 (HE.PRO AGENT.N))
		(!R10 (EYE422.SK (PLUR EYE.N)))
		(!R11 (EYE422.SK (PERTAIN-TO HE.PRO)))
		(!R12 (HAND389.SK (PLUR HAND.N)))
		(!R13 (HAND389.SK MONKEY.N))
		(!R14 (HAND389.SK ORGANISM.N))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P ?L1_2)))
		(?I2 (NOT (HE.PRO (AT.P HAND389.SK))))
	)
	(:STEPS
		(?E1
   (HE.PRO ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P HAND389.SK)) CLIMB.347.V))
    HAND389.SK))
		(?E2 (HE.PRO GET.346.V IT.PRO (AT.P-ARG HAND389.SK)))
		(E399.SK (HE.PRO EAT.323.V IT.PRO))
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (HAVE.V IT.PRO))))
		(?P2 (NOT (HE.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE ?E2))
		(!W2 (?E2 BEFORE E399.SK))
		(!W3 (E399.SK (AFTER E398.SK)))
		(!W4 (E398.SK (AT-ABOUT NOW87)))
	)
	(:CERTAINTIES
		(!C1 (!R14 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R1 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R13 CERTAIN-TO-DEGREE (/ 1 2)))
	)
)
))))

; story 12:
	; "The monkey can climb a tree."
	; "He climbs the tree and gets a cocoanut."
	; "He drops the cocoanut to the ground."
	; "He comes down and eats it."
	; "The monkey likes to run and play."
	; "Is Simeon afraid of the monkey?"
	; "Luisa is afraid of large monkeys."
	; "She is not afraid of this little monkey."
discarding schema GET.346.V learned from this story
discarding schema FEED.324.V learned from this story
discarding schema FEED.325.V learned from this story
discarding schema EAT.323.V learned from this story
discarding schema CLIMB.347.V learned from this story
; best schemas are:
; CLIMB_GET_EAT.349.PR
(setf matches (append matches '(( (5.0 4)
("The monkey can climb a tree." "He climbs the tree and gets a cocoanut."
 "He drops the cocoanut to the ground." "He comes down and eats it."
 "The monkey likes to run and play." "Is Simeon afraid of the monkey?"
 "Luisa is afraid of large monkeys." "She is not afraid of this little monkey.")
(EPI-SCHEMA ((MONKEY425.SK CLIMB_GET_EAT.469.PR TREE426.SK COCOANUT430.SK) **
             ?E)
	(:ROLES
		(!R1 (COCOANUT430.SK INANIMATE_OBJECT.N))
		(!R2 (NOT (MONKEY425.SK = COCOANUT430.SK)))
		(!R3 (TREE426.SK LOCATION.N))
		(!R4 (COCOANUT430.SK FOOD.N))
		(!R5 (TREE426.SK TREE.N))
		(!R6 (MONKEY425.SK MONKEY.N))
		(!R7 (COCOANUT430.SK COCOANUT.N))
		(!R8 (GROUND438.SK GROUND.N))
		(!R9 (COCOANUT430.SK (TO.P GROUND438.SK)))
	)
	(:PRECONDS
		(?I1 (MONKEY425.SK (AT.P ?L1_2)))
		(?I2 (NOT (MONKEY425.SK (AT.P TREE426.SK))))
	)
	(:STEPS
		(E432.SK
   (MONKEY425.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TREE426.SK)) CLIMB.347.V))
    TREE426.SK))
		(E431.SK (MONKEY425.SK GET.346.V COCOANUT430.SK (AT.P-ARG TREE426.SK)))
		(E443.SK (MONKEY425.SK EAT.323.V COCOANUT430.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (MONKEY425.SK (HAVE.V COCOANUT430.SK))))
		(?P2 (NOT (MONKEY425.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E432.SK BEFORE E431.SK))
		(!W2 (E431.SK BEFORE E443.SK))
		(!W3 (E432.SK (CONSEC E431.SK)))
		(!W4 (E431.SK (AT-ABOUT NOW92)))
		(!W5 (E432.SK (AT-ABOUT NOW92)))
		(!W6 (E442.SK (CONSEC E443.SK)))
		(!W7 (E443.SK (DURING E440.SK)))
		(!W8 (E442.SK (DURING E440.SK)))
		(!W9 (E444.SK (AT-ABOUT NOW94)))
		(!W10 (E440.SK (AT-ABOUT NOW94)))
	)
)
))))
(setf matches (append matches '(( (5.0 4)
("The monkey can climb a tree." "He climbs the tree and gets a cocoanut."
 "He drops the cocoanut to the ground." "He comes down and eats it."
 "The monkey likes to run and play." "Is Simeon afraid of the monkey?"
 "Luisa is afraid of large monkeys." "She is not afraid of this little monkey.")
(EPI-SCHEMA ((MONKEY425.SK CLIMB_GET_EAT.470.PR TREE426.SK COCOANUT430.SK) **
             ?E)
	(:ROLES
		(!R1 (COCOANUT430.SK INANIMATE_OBJECT.N))
		(!R2 (NOT (MONKEY425.SK = COCOANUT430.SK)))
		(!R3 (TREE426.SK LOCATION.N))
		(!R4 (COCOANUT430.SK FOOD.N))
		(!R5 (TREE426.SK TREE.N))
		(!R6 (COCOANUT430.SK COCOANUT.N))
		(!R7 (MONKEY425.SK MONKEY.N))
		(!R8 (COCOANUT430.SK (TO.P GROUND438.SK)))
		(!R9 (GROUND438.SK GROUND.N))
	)
	(:PRECONDS
		(?I1 (MONKEY425.SK (AT.P ?L1_2)))
		(?I2 (NOT (MONKEY425.SK (AT.P TREE426.SK))))
	)
	(:STEPS
		(E432.SK
   (MONKEY425.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TREE426.SK)) CLIMB.347.V))
    TREE426.SK))
		(E439.SK (MONKEY425.SK GET.346.V COCOANUT430.SK (AT.P-ARG TREE426.SK)))
		(E444.SK (MONKEY425.SK EAT.323.V COCOANUT430.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (MONKEY425.SK (HAVE.V COCOANUT430.SK))))
		(?P2 (NOT (MONKEY425.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E432.SK BEFORE E439.SK))
		(!W2 (E439.SK BEFORE E444.SK))
		(!W3 (E432.SK (CONSEC E431.SK)))
		(!W4 (E431.SK (AT-ABOUT NOW92)))
		(!W5 (E432.SK (AT-ABOUT NOW92)))
		(!W6 (E444.SK (AT-ABOUT NOW94)))
		(!W7 (E440.SK (AT-ABOUT NOW94)))
		(!W8 (E443.SK (DURING E440.SK)))
		(!W9 (E442.SK (DURING E440.SK)))
		(!W10 (E442.SK (CONSEC E443.SK)))
		(!W11 (E439.SK (AT-ABOUT NOW93)))
	)
)
))))
(setf matches (append matches '(( (5.0 4)
("The monkey can climb a tree." "He climbs the tree and gets a cocoanut."
 "He drops the cocoanut to the ground." "He comes down and eats it."
 "The monkey likes to run and play." "Is Simeon afraid of the monkey?"
 "Luisa is afraid of large monkeys." "She is not afraid of this little monkey.")
(EPI-SCHEMA ((MONKEY425.SK CLIMB_GET_EAT.478.PR TREE426.SK COCOANUT430.SK) **
             ?E)
	(:ROLES
		(!R1 (COCOANUT430.SK INANIMATE_OBJECT.N))
		(!R2 (NOT (MONKEY425.SK = COCOANUT430.SK)))
		(!R3 (TREE426.SK LOCATION.N))
		(!R4 (COCOANUT430.SK FOOD.N))
		(!R5 (TREE426.SK TREE.N))
		(!R6 (MONKEY425.SK MONKEY.N))
		(!R7 (COCOANUT430.SK COCOANUT.N))
		(!R8 (COCOANUT430.SK (TO.P GROUND438.SK)))
		(!R9 (GROUND438.SK GROUND.N))
	)
	(:PRECONDS
		(?I1 (MONKEY425.SK (AT.P ?L1_2)))
		(?I2 (NOT (MONKEY425.SK (AT.P TREE426.SK))))
	)
	(:STEPS
		(E432.SK
   (MONKEY425.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TREE426.SK)) CLIMB.347.V))
    TREE426.SK))
		(E431.SK (MONKEY425.SK GET.346.V COCOANUT430.SK (AT.P-ARG TREE426.SK)))
		(E444.SK (MONKEY425.SK EAT.323.V COCOANUT430.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (MONKEY425.SK (HAVE.V COCOANUT430.SK))))
		(?P2 (NOT (MONKEY425.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E432.SK BEFORE E431.SK))
		(!W2 (E431.SK BEFORE E444.SK))
		(!W3 (E432.SK (CONSEC E431.SK)))
		(!W4 (E432.SK (AT-ABOUT NOW92)))
		(!W5 (E431.SK (AT-ABOUT NOW92)))
		(!W6 (E440.SK (AT-ABOUT NOW94)))
		(!W7 (E444.SK (AT-ABOUT NOW94)))
		(!W8 (E443.SK (DURING E440.SK)))
		(!W9 (E442.SK (CONSEC E443.SK)))
		(!W10 (E442.SK (DURING E440.SK)))
	)
)
))))

; story 13:
	; "The sun is up."
	; "The man has fed the black hen and the fat duck."
	; "Now the duck will swim in the pond."
	; "The hen has run to her nest."
	; "Let us not stop at the pond now, for it is hot."
	; "See how still it is!"
	; "We will go to see Tom and his top."
discarding schema RUN.350.V learned from this story
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; FLY.235.V
; TAKE.1391.V
; TAKE.189.V
; RUN.28.V
(setf matches (append matches '(( (3.1834376 0)
("The sun is up." "The man has fed the black hen and the fat duck."
 "Now the duck will swim in the pond." "The hen has run to her nest."
 "Let us not stop at the pond now, for it is hot." "See how still it is!"
 "We will go to see Tom and his top.")
(EPI-SCHEMA ((WE485.SK
              ((ADV-A (FOR.P (KA (SEE.V (SET-OF TOM.NAME TOP483.SK)))))
               ((ADV-A (FROM.P ?L1))
                ((ADV-A (TO.P ?L2)) (AWAY.ADV FLY.507.V))))
              ?L2)
             ** E484.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (WE485.SK ((NN MOTHER.N) BIRD.N)))
		(!R5 (WE485.SK BIRD.N))
		(!R6 (WE485.SK ((NN BABY.N) BIRD.N)))
		(!R7 (TOP483.SK TOP.N))
		(!R8 (TOP483.SK (PERTAIN-TO TOM.NAME)))
		(!R9 (WE485.SK AGENT.N))
	)
	(:GOALS
		(?G1 (WE485.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (WE485.SK (AT.P ?L1)))
		(?I2 (NOT (WE485.SK (AT.P ?L2))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (WE485.SK (AT.P ?L1))))
		(?P2 (WE485.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E484.SK))
		(!W2 (?I2 BEFORE E484.SK))
		(!W3 (?P1 AFTER E484.SK))
		(!W4 (?P2 AFTER E484.SK))
		(!W5 (?G1 CAUSE-OF E484.SK))
		(!W6 (E484.SK (BEFORE ?X_C)))
		(!W7 (E484.SK (AFTER E481.SK)))
		(!W8 (E481.SK (AT-ABOUT NOW105)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.6862497 5)
("The sun is up." "The man has fed the black hen and the fat duck."
 "Now the duck will swim in the pond." "The hen has run to her nest."
 "Let us not stop at the pond now, for it is hot." "See how still it is!"
 "We will go to see Tom and his top.")
(EPI-SCHEMA ((HEN466.SK
              ((ADV-A (AT.P FAT468.SK))
               ((ADV-A (TO.P NEST478.SK))
                ((ADV-A (FROM.P TOP483.SK)) RUN.563.V)))
              NEST478.SK)
             ** E475.SK)
	(:ROLES
		(!R1 (HEN466.SK AGENT.N))
		(!R2 (TOP483.SK LOCATION.N))
		(!R3 (NEST478.SK LOCATION.N))
		(!R4 (NOT (TOP483.SK = NEST478.SK)))
		(!R5 (FAT468.SK CAT.N))
		(!R6 (HEN466.SK BLACK.A))
		(!R7 (HEN466.SK HEN.N))
		(!R8 (NEST478.SK (PERTAIN-TO HEN466.SK)))
		(!R9 (NEST478.SK NEST.N))
		(!R10 (E475.SK (IMPINGES-ON E474.SK)))
		(!R11 (FAT468.SK FAT.A))
		(!R12 (FAT468.SK DUCK.N))
		(!R13 (FAT468.SK VERTEBRATE.N))
		(!R14 (TOP483.SK TOP.N))
		(!R15 (TOP483.SK (PERTAIN-TO TOM.NAME)))
	)
	(:GOALS
		(?G1 (HEN466.SK (WANT.V (KA ((ADV-A (AT.P NEST478.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HEN466.SK (AT.P TOP483.SK)))
		(?I2 (NOT (HEN466.SK (AT.P NEST478.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HEN466.SK (AT.P TOP483.SK))))
		(?P2 (HEN466.SK (AT.P NEST478.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E475.SK))
		(!W2 (?I2 BEFORE E475.SK))
		(!W3 (?P1 AFTER E475.SK))
		(!W4 (?P2 AFTER E475.SK))
		(!W5 (?G1 CAUSE-OF E475.SK))
		(!W6 (E475.SK (AFTER ?X_D)))
		(!W7 (?X_D (AT-ABOUT ?X_E)))
		(!W8 (E474.SK (AT-ABOUT NOW102)))
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

; story 14:
	; "Three birds are in the tree."
	; "One is a pretty red bird."
	; "You can not catch it."
	; "It is high in the tree."
	; "The red bird can see the boys with the drum."
	; "It can see the little girl with the red dress."
	; "It can see the good baby and the pretty doll."
	; "It can see the man in the field."
	; "Pretty birds, will you fly to me?"
; best schemas are:
; TAKE.542.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
; PLAY.301.V
; PLAY.402.V
; PLAY.431.V
; PLAY.195.V

; story 15:
	; "O John!"
	; "the sun has just set."
	; "It is not hot, now."
	; "Let us run and jump."
	; "I think it is fun to run, and skip, and jump."
	; "See the duck on the pond!"
	; "Her nest is up on the bank, under the rock."
	; "We must not touch the nest, but we may look at it"
; best schemas are:
; RUN.350.V
; GET.104.V
; FIND.129.V
; TAKE.542.V
; TAKE.1391.V
; TAKE.189.V

; story 16:
	; "Hall and Ann have come to the brook."
	; "Dash is with them."
	; "The brook is wide, but the water is not deep."
	; "Dash has Ann on his back."
	; "He will take her to the other side."
	; "She will not wet her feet."
	; "He holds her on her."
	; "She will not fall off."
; best schemas are:
; TAKE.928.V
; GET.338.V
; GET.73.V
; RECEIVING_VERB.?
; TAKE.656.V
; TAKE.946.V

; story 17:
	; "The sun is hot and the carabao likes to stand in the water."
	; "Simeon rode him here."
	; "Soo Simeon will ride him home."
	; "Where is Simeon?"
	; "He likes to sit under a tree."
	; "Simeon's father has five carabaos."
	; "Three of them are old, and two of them are young."
discarding schema RIDE.437.V learned from this story
discarding schema RIDE.438.V learned from this story
; best schemas are:
; TAKE.542.V
; GO.658.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; FLY.235.V
(setf matches (append matches '(( (3.905 6)
("The sun is hot and the carabao likes to stand in the water."
 "Simeon rode him here." "Soo Simeon will ride him home." "Where is Simeon?"
 "He likes to sit under a tree." "Simeon's father has five carabaos."
 "Three of them are old, and two of them are young.")
(EPI-SCHEMA ((SIMEON.NAME
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P SIMEON.NAME)) PLAY.V))))
               ((ADV-A (TO.P HE590.SK)) ((ADV-A (FROM.P ?L1)) RIDE.685.V)))
              HE590.SK)
             ** E575.SK)
	(:ROLES
		(!R1 (SIMEON.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (HE590.SK LOCATION.N))
		(!R4 (NOT (?L1 = HE590.SK)))
		(!R5 (SIMEON.NAME (PLUR FRIEND.N)))
		(!R6 (SIMEON.NAME HOME.N))
		(!R7 (SIMEON.NAME GIRL.N))
		(!R8 (HE590.SK AGENT.N))
		(!R9 (SIMEON.NAME FATHER.N))
		(!R10 (SIMEON.NAME PERSON.N))
		(!R11 (SIMEON.NAME (PERTAIN-TO SIMEON.NAME)))
	)
	(:GOALS
		(?G1 (SIMEON.NAME (WANT.V (KA ((ADV-A (AT.P HE590.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SIMEON.NAME (AT.P ?L1)))
		(?I2 (NOT (SIMEON.NAME (AT.P HE590.SK))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (SIMEON.NAME (AT.P ?L1))))
		(?P2 (SIMEON.NAME (AT.P HE590.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E575.SK))
		(!W2 (?I2 BEFORE E575.SK))
		(!W3 (?P1 AFTER E575.SK))
		(!W4 (?P2 AFTER E575.SK))
		(!W5 (?G1 CAUSE-OF E575.SK))
		(!W6 (E575.SK (BEFORE ?X_E)))
		(!W7 (E575.SK (BEFORE NOW132)))
	)
	(:CERTAINTIES
		(!C1 (!R10 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R7 CERTAIN-TO-DEGREE (/ 1 3)))
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
(setf matches (append matches '(( (1.9556249 2)
("The sun is hot and the carabao likes to stand in the water."
 "Simeon rode him here." "Soo Simeon will ride him home." "Where is Simeon?"
 "He likes to sit under a tree." "Simeon's father has five carabaos."
 "Three of them are old, and two of them are young.")
(EPI-SCHEMA ((HE.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.687.V
              (KA (LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))))
             ** ?E)
	(:ROLES
		(!R1 ((KA (LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (HE.PRO BIRD.N))
		(!R4 (?X_B CAGE.N))
		(!R5 (HE.PRO (BE.PASV SCRATCH.V)))
		(!R6 (HE.PRO HEN.N))
		(!R7 (HE.PRO OLD.A))
		(!R8 (HE.PRO MALE.A))
		(!R9 (HE.PRO AGENT.N))
		(!R10 (TREE581.SK TREE.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (NOT (HE.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (HE.PRO LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))) CAUSE-OF
    (KE (HE.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E582.SK (HE.PRO LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E582.SK))
		(!W2 (E582.SK (BEFORE ?X_D)))
		(!W3 (E582.SK (AT-ABOUT NOW135)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.405 4)
("The sun is hot and the carabao likes to stand in the water."
 "Simeon rode him here." "Soo Simeon will ride him home." "Where is Simeon?"
 "He likes to sit under a tree." "Simeon's father has five carabaos."
 "Three of them are old, and two of them are young.")
(EPI-SCHEMA ((CARABAO568.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.686.V
              (KA (LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))))
             ** ?E)
	(:ROLES
		(!R1 (CARABAO568.SK AGENT.N))
		(!R2 ((KA (LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (CARABAO568.SK BIRD.N))
		(!R5 (?X_B CAGE.N))
		(!R6 (CARABAO568.SK (BE.PASV SCRATCH.V)))
		(!R7 (CARABAO568.SK HEN.N))
		(!R8 (CARABAO568.SK OLD.A))
		(!R9 (WATER572.SK WATER.N))
		(!R10 (CARABAO568.SK CARABAO.N))
		(!R11 (CARABAO568.SK VERTEBRATE.N))
	)
	(:GOALS
		(?G1 (CARABAO568.SK (WANT.V (THAT (NOT (CARABAO568.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (CARABAO568.SK LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V)))) CAUSE-OF
    (KE (CARABAO568.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E573.SK (CARABAO568.SK LIKE.V (KA ((ADV-A (IN.P ?X_B)) LIVE.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E573.SK))
		(!W2 (E573.SK (BEFORE ?X_D)))
		(!W3 (E573.SK (AT-ABOUT NOW131)))
		(!W4 (E593.SK (AT-ABOUT NOW131)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C4 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C5 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 18:
	; "I see a nest."
	; "Little birds are in it."
	; "The little birds can not fly."
	; "They are not pretty."
	; "They will get pretty by and by."
	; "The big bird is not here now."
	; "She is high in the apple tree."
	; "She will come to them by and by."
	; "She will come and feed them."
; best schemas are:
; TAKE.542.V
; TAKE.189.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; TAKE.656.V
; TAKE.1391.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
(setf matches (append matches '(( (1.03125 2)
("I see a nest." "Little birds are in it." "The little birds can not fly."
 "They are not pretty." "They will get pretty by and by."
 "The big bird is not here now." "She is high in the apple tree."
 "She will come to them by and by." "She will come and feed them.")
(EPI-SCHEMA ((ME.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.780.V
              (KA ((THERE.ADV SEE.V) NEST598.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) NEST598.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ME.PRO AGENT.N))
		(!R4 (NEST598.SK NEST.N))
	)
	(:GOALS
		(?G1 (ME.PRO (WANT.V (THAT (NOT (ME.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME.PRO (THERE.ADV SEE.V) NEST598.SK)) CAUSE-OF
    (KE (ME.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E599.SK (ME.PRO (THERE.ADV (THERE.ADV SEE.V)) NEST598.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E599.SK))
		(!W2 (E599.SK (BEFORE ?X_D)))
		(!W3 (E599.SK (AT-ABOUT NOW138)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 19:
	; "Grace is running after the butterfly."
	; "Can she catch it?"
	; "I think not."
	; "It can fly faster than Grace can run."
	; "Grace has many flowers in her garden."
	; "The butterflies come there because they like the flowers."
	; "They fly among them all day."
discarding schema RUN.472.V learned from this story
; best schemas are:
; COME.917.V
; COME.917.V
; COME.917.V
; FIND.518.V
; GIVE.902.V

; story 20:
	; "When Gracia goes to church she carries a black parasol."
	; "It is small and is made of silk."
	; "Pepita carries an umbrella."
	; "This is a picture of it."
	; "It comes from Japan."
	; "It is made of paper but it is a good umbrella."
	; "Do you like a black parasol better than a Japanese umbrella?"
	; "Petita likes the Japanese umbrella because it is so gay and pretty."
; best schemas are:
; TAKE.542.V
; SIT.211.V
; SIT.505.V
; TAKE.135.V
; SIT.49.V
; SIT.65.V

; story 21:
	; "Nan has two black hens."
	; "They lay nice white eggs."
	; "You can find them in the hay."
	; "My hen lays eggs, too."
	; "She has her nest up on the beam."
	; "She will fly off, and say “cluck, cluck!”"
; best schemas are:
; TAKE.542.V
; TAKE.656.V
; TAKE.1391.V
; TAKE.189.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; FLY.235.V

; story 22:
	; "Simeon and Pedro like to fish."
	; "Sometimes they sit on the bridge."
	; "Sometimes they sit on the bank of the river."
	; "They have poles, long lines, and little iron hooks."
	; "This morning Simeon caught a large fish."
	; "Pedro caught many small ones."
	; "The boys caught some crabs, too."
	; "They use a net to catch the crabs."
; best schemas are:
; TAKE.542.V
; RUN.229.V
; RUN.254.V
; GET.1260.V
; FLY.235.V
; COME.126.V

; story 23:
	; "This is red clover."
	; "The bees like it."
	; "They find sweet nectar in the clover flowers."
	; "They take the nectar home to make honey."
	; "Here is white clover."
	; "It is sweet."
	; "It has nectar, and bees like it, too."
	; "It grows in the fields with red clover and yellow buttercups."
	; "Horses and cows eat clover."
discarding schema FIND.518.V learned from this story
; best schemas are:
; GO_FIND_EAT.566.PR
; COME.917.V
; COME.917.V
; COME.917.V
; FIND.562.V
(setf matches (append matches '(( (2.5 3)
("This is red clover." "The bees like it."
 "They find sweet nectar in the clover flowers."
 "They take the nectar home to make honey." "Here is white clover."
 "It is sweet." "It has nectar, and bees like it, too."
 "It grows in the fields with red clover and yellow buttercups."
 "Horses and cows eat clover.")
(EPI-SCHEMA ((BEES715.SK GO_FIND_EAT.861.PR FIELD738.SK
              (K
               (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N))))
              ?X_D)
             ** ?E)
	(:ROLES
		(!R1 (FIELD738.SK FIELD.N))
		(!R2
   ((K (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N))))
    (OF.P (K GRASS.N))))
		(!R3
   ((K (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N)))) SPOT.N))
		(!R4 (BEES715.SK COW.N))
		(!R5 (?X_D FOOD.N))
		(!R6 (?X_D GRASS.N))
		(!R7 (BEES715.SK (PLUR BEE.N)))
		(!R8 (FLOWERS721.SK ((NN CLOVER.N) (PLUR FLOWER.N))))
		(!R9 (FIELD738.SK (PLUR FIELD.N)))
	)
	(:PRECONDS
		(?I1 (BEES715.SK (AT.P ?L1_2)))
		(?I2 (NOT (BEES715.SK (AT.P FIELD738.SK))))
	)
	(:STEPS
		(?E1
   (BEES715.SK
    (OUT.ADV
     ((ADV-A (TO.P FIELD738.SK)) ((ADV-A (FROM.P HOME724.SK)) GO.860.V)))
    FIELD738.SK))
		(E722.SK
   (BEES715.SK ((ADV-A (IN.P FLOWERS721.SK)) FIND.562.V)
    (K (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N))))))
		(?E3 (BEES715.SK EAT.564.V ?X_D))
	)
	(:POSTCONDS
		(?P1 (NOT (BEES715.SK (HAVE.V ?X_D))))
		(?P2 (NOT (BEES715.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE E722.SK))
		(!W2 (E722.SK BEFORE ?E3))
		(!W3 (E722.SK (AT-ABOUT NOW178)))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_A<- ?E1) = HOME724.SK))
		(!S2 ((?X_B<- ?E1) = BEES715.SK))
		(!S3 ((?X_C<- ?E1) = FIELD738.SK))
		(!S4 ((?E1<- ?E1) = ?E1))
	)
)
))))
(setf matches (append matches '(( (2.0 4)
("This is red clover." "The bees like it."
 "They find sweet nectar in the clover flowers."
 "They take the nectar home to make honey." "Here is white clover."
 "It is sweet." "It has nectar, and bees like it, too."
 "It grows in the fields with red clover and yellow buttercups."
 "Horses and cows eat clover.")
(EPI-SCHEMA ((BEES715.SK GO_FIND_EAT.858.PR BEES715.SK
              (K
               (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N))))
              ?X_D)
             ** ?E)
	(:ROLES
		(!R1 (BEES715.SK FIELD.N))
		(!R2
   ((K (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N))))
    (OF.P (K GRASS.N))))
		(!R3
   ((K (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N)))) SPOT.N))
		(!R4 (BEES715.SK COW.N))
		(!R5 (?X_D FOOD.N))
		(!R6 (?X_D GRASS.N))
		(!R7 (BEES715.SK (PLUR BEE.N)))
		(!R8 (FLOWERS721.SK ((NN CLOVER.N) (PLUR FLOWER.N))))
	)
	(:PRECONDS
		(?I1 (BEES715.SK (AT.P ?L1_2)))
		(?I2 (NOT (BEES715.SK (AT.P BEES715.SK))))
	)
	(:STEPS
		(?E1
   (BEES715.SK
    (OUT.ADV
     ((ADV-A (TO.P BEES715.SK)) ((ADV-A (FROM.P HOME724.SK)) GO.857.V)))
    BEES715.SK))
		(E722.SK
   (BEES715.SK ((ADV-A (IN.P FLOWERS721.SK)) FIND.562.V)
    (K (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N))))))
		(?E3 (BEES715.SK EAT.564.V ?X_D))
	)
	(:POSTCONDS
		(?P1 (NOT (BEES715.SK (HAVE.V ?X_D))))
		(?P2 (NOT (BEES715.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE E722.SK))
		(!W2 (E722.SK BEFORE ?E3))
		(!W3 (E722.SK (AT-ABOUT NOW178)))
	)
	(:SUBORDINATE-CONSTRAINTS
		(!S1 ((?X_A<- ?E1) = HOME724.SK))
		(!S2 ((?X_B<- ?E1) = BEES715.SK))
		(!S3 ((?E1<- ?E1) = ?E1))
	)
)
))))
(setf matches (append matches '(( (3.6003125 7)
("This is red clover." "The bees like it."
 "They find sweet nectar in the clover flowers."
 "They take the nectar home to make honey." "Here is white clover."
 "It is sweet." "It has nectar, and bees like it, too."
 "It grows in the fields with red clover and yellow buttercups."
 "Horses and cows eat clover.")
(EPI-SCHEMA ((BEES715.SK ((ADV-A (IN.P FLOWERS721.SK)) FIND.877.V)
              (K
               (L #:G1386148
                (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N)))))
             ** E722.SK)
	(:ROLES
		(!R1 (BEES715.SK AGENT.N))
		(!R2 (BEES715.SK COW.N))
		(!R3
   ((K (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N))))
    (OF.P (K GRASS.N))))
		(!R4
   ((K (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N)))) SPOT.N))
		(!R5 (E722.SK (RIGHT-AFTER ?X_A)))
		(!R6 (HOME724.SK FIELD.N))
		(!R7 (BEES715.SK (PLUR BEE.N)))
		(!R8 (FLOWERS721.SK ((NN CLOVER.N) (PLUR FLOWER.N))))
		(!R9 (HOME724.SK NECTAR.A))
		(!R10 (HOME724.SK HOME.N))
		(!R11 (HOME724.SK LOCATION.N))
	)
	(:PRECONDS
		(?I1 (BEES715.SK (AT.P HOME724.SK)))
		(?I2
   ((K (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N))))
    (AT.P HOME724.SK)))
		(?I3
   (BEES715.SK
    ((ADV-A
      (FOR.P
       (K (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N))))))
     SEARCH.V)))
		(?I4
   (NOT
    (BEES715.SK
     (KNOW.V
      (THAT
       ((K (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N))))
        (AT.P HOME724.SK)))))))
		(?I5
   (NOT
    (BEES715.SK
     (HAVE.V
      (K (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N))))))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1
   (BEES715.SK
    (KNOW.V
     (THAT
      ((K (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N))))
       (AT.P HOME724.SK))))))
		(?P2
   (BEES715.SK
    (HAVE.V
     (K (L #:G1386148 (AND (#:G1386148 SWEET.A) (#:G1386148 NECTAR.N)))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E722.SK (SAME-TIME ?X_G)))
		(!W2 (?X_F (BEFORE ?X_G)))
		(!W3 (E722.SK (AT-ABOUT NOW178)))
	)
	(:CERTAINTIES
		(!C1 (!R11 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R6 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R10 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 24:
	; "I can get into bed, and then you can not get me."
	; "I am not in bed."
	; "I have my dress on yet."
	; "This is my red dress."
	; "I am Nell."
	; "I see you, Nell."
	; "I can not get you."
	; "You can get into bed."
	; "Nell, you have a pretty dress."
	; "I have a black dress."
	; "My black dress is not pretty."
	; "I shall get me a red dress."
	; "Then I shall have a pretty dress."
; best schemas are:
; TAKE.542.V
; TAKE.413.V
; GIVE.1297.V
; GET.1260.V
; GET.88.V
; GIVE.194.V

; story 25:
	; "This large animal is an elephant."
	; "His ears look like fans."
	; "The two long teeth are called tusks."
	; "The elephant eats grass and green corn."
	; "He likes oranges bananas and peanuts."
	; "Elephants live in India."
discarding schema EAT.586.V learned from this story
; best schemas are:
; GO_FIND_EAT.566.PR
; EAT.564.V
; TAKE.542.V
; TAKE.895.V
; TAKE.885.V
(setf matches (append matches '(( (0 3)
("This large animal is an elephant." "His ears look like fans."
 "The two long teeth are called tusks."
 "The elephant eats grass and green corn."
 "He likes oranges bananas and peanuts." "Elephants live in India.")
(EPI-SCHEMA ((ELEPHANT808.SK GO_FIND_EAT.1009.PR ?X_A ?X_B
              (SET-OF (K GRASS.N)
               (K
                (L #:G1567513
                 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N))))))
             ** ?E)
	(:ROLES
		(!R1 (?X_A FIELD.N))
		(!R2 (?X_B (OF.P (K GRASS.N))))
		(!R3 (?X_B SPOT.N))
		(!R4 (ELEPHANT808.SK COW.N))
		(!R5
   ((SET-OF (K GRASS.N)
     (K (L #:G1567513 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N)))))
    FOOD.N))
		(!R6
   ((SET-OF (K GRASS.N)
     (K (L #:G1567513 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N)))))
    GRASS.N))
		(!R7 (ELEPHANT808.SK ELEPHANT.N))
		(!R8 (ELEPHANT808.SK PLACENTAL.N))
		(!R9 (E807.SK (RIGHT-AFTER U200)))
	)
	(:PRECONDS
		(?I1 (ELEPHANT808.SK (AT.P ?L1_2)))
		(?I2 (NOT (ELEPHANT808.SK (AT.P ?X_A))))
	)
	(:STEPS
		(?E1
   (ELEPHANT808.SK
    (OUT.ADV ((ADV-A (TO.P ?X_A)) ((ADV-A (FROM.P ?L1)) GO.563.V))) ?X_A))
		(?E2 (ELEPHANT808.SK FIND.562.V ?X_B))
		(E807.SK
   (ELEPHANT808.SK EAT.564.V
    (SET-OF (K GRASS.N)
     (K (L #:G1567513 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N)))))))
	)
	(:POSTCONDS
		(?P1
   (NOT
    (ELEPHANT808.SK
     (HAVE.V
      (SET-OF (K GRASS.N)
       (K (L #:G1567513 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N)))))))))
		(?P2 (NOT (ELEPHANT808.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE ?E2))
		(!W2 (?E2 BEFORE E807.SK))
		(!W3 (E807.SK (SAME-TIME NOW201)))
		(!W4 (E810.SK (AT-ABOUT NOW201)))
	)
	(:CERTAINTIES
		(!C1 (!R8 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
	)
)
))))
(setf matches (append matches '(( (0 3)
("This large animal is an elephant." "His ears look like fans."
 "The two long teeth are called tusks."
 "The elephant eats grass and green corn."
 "He likes oranges bananas and peanuts." "Elephants live in India.")
(EPI-SCHEMA ((ELEPHANT808.SK GO_FIND_EAT.1010.PR ?X_A ?X_B
              (SET-OF (K GRASS.N)
               (K
                (L #:G1567513
                 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N))))))
             ** ?E)
	(:ROLES
		(!R1 (?X_A FIELD.N))
		(!R2 (?X_B (OF.P (K GRASS.N))))
		(!R3 (?X_B SPOT.N))
		(!R4 (ELEPHANT808.SK COW.N))
		(!R5
   ((SET-OF (K GRASS.N)
     (K (L #:G1567513 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N)))))
    FOOD.N))
		(!R6
   ((SET-OF (K GRASS.N)
     (K (L #:G1567513 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N)))))
    GRASS.N))
		(!R7 (ELEPHANT808.SK ELEPHANT.N))
		(!R8 (ELEPHANT808.SK PLACENTAL.N))
		(!R9 (E807.SK (RIGHT-AFTER U200)))
	)
	(:PRECONDS
		(?I1 (ELEPHANT808.SK (AT.P ?L1_2)))
		(?I2 (NOT (ELEPHANT808.SK (AT.P ?X_A))))
	)
	(:STEPS
		(?E1
   (ELEPHANT808.SK
    (OUT.ADV ((ADV-A (TO.P ?X_A)) ((ADV-A (FROM.P ?L1)) GO.563.V))) ?X_A))
		(?E2 (ELEPHANT808.SK FIND.562.V ?X_B))
		(E810.SK
   (ELEPHANT808.SK EAT.564.V
    (SET-OF (K GRASS.N)
     (K (L #:G1567513 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N)))))))
	)
	(:POSTCONDS
		(?P1
   (NOT
    (ELEPHANT808.SK
     (HAVE.V
      (SET-OF (K GRASS.N)
       (K (L #:G1567513 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N)))))))))
		(?P2 (NOT (ELEPHANT808.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE ?E2))
		(!W2 (?E2 BEFORE E810.SK))
		(!W3 (E810.SK (AT-ABOUT NOW201)))
		(!W4 (E807.SK (SAME-TIME NOW201)))
	)
	(:CERTAINTIES
		(!C1 (!R8 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R7 CERTAIN-TO-DEGREE (/ 1 2)))
	)
)
))))
(setf matches (append matches '(( (4.9049997 6)
("This large animal is an elephant." "His ears look like fans."
 "The two long teeth are called tusks."
 "The elephant eats grass and green corn."
 "He likes oranges bananas and peanuts." "Elephants live in India.")
(EPI-SCHEMA ((ELEPHANT808.SK EAT.1011.V
              (SET-OF (K GRASS.N)
               (K
                (L #:G1567513
                 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N))))))
             ** E807.SK)
	(:ROLES
		(!R1 (ELEPHANT808.SK AGENT.N))
		(!R2
   ((SET-OF (K GRASS.N)
     (K (L #:G1567513 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N)))))
    FOOD.N))
		(!R3 (ELEPHANT808.SK COW.N))
		(!R4
   ((SET-OF (K GRASS.N)
     (K (L #:G1567513 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N)))))
    GRASS.N))
		(!R5 (ELEPHANT808.SK ELEPHANT.N))
		(!R6 (ELEPHANT808.SK PLACENTAL.N))
		(!R7 (E807.SK (RIGHT-AFTER U200)))
	)
	(:GOALS
		(?G1 (ELEPHANT808.SK (WANT.V (THAT (NOT (ELEPHANT808.SK HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1
   (ELEPHANT808.SK HAVE.V
    (SET-OF (K GRASS.N)
     (K (L #:G1567513 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N)))))))
		(?I2 (ELEPHANT808.SK HUNGRY.A))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1
   (NOT
    (ELEPHANT808.SK
     (HAVE.V
      (SET-OF (K GRASS.N)
       (K (L #:G1567513 (AND (#:G1567513 GREEN.A) (#:G1567513 CORN.N)))))))))
		(?P2 (NOT (ELEPHANT808.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E807.SK))
		(!W2 (?I1 BEFORE E807.SK))
		(!W3 (E807.SK CAUSE-OF ?P1))
		(!W4 (E807.SK (SAME-TIME ?X_F)))
		(!W5 (?X_E (BEFORE ?X_F)))
		(!W6 (E807.SK (SAME-TIME NOW201)))
		(!W7 (E810.SK (AT-ABOUT NOW201)))
	)
	(:CERTAINTIES
		(!C1 (!R6 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R3 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 26:
	; "Here are five pretty blue flowers."
	; "They look like little bells, and so we can call them blue bells."
	; "The stems and the leaves are green."
	; "Ned has no flowers."
	; "Tom says, “Here is my box of paints.” Ned paints the flowers blue."
	; "But he has no green paint for the stems and leaves."
	; "He can make green paint."
	; "He can mix blue paint and yellow paint."
	; "Blue and yellow make green."
; best schemas are:
; TAKE.928.V
; TAKE.413.V
; GO_GET_NIL.677.PR
; GO.423.V
; SIT.211.V
; SIT.505.V
(setf matches (append matches '(( (1.5 2)
("Here are five pretty blue flowers."
 "They look like little bells, and so we can call them blue bells."
 "The stems and the leaves are green." "Ned has no flowers."
 "Tom says, “Here is my box of paints.” Ned paints the flowers blue."
 "But he has no green paint for the stems and leaves."
 "He can make green paint." "He can mix blue paint and yellow paint."
 "Blue and yellow make green.")
(EPI-SCHEMA ((HE.PRO GO_GET_NIL.1078.PR ?L PRED?824.SK) ** ?E)
	(:ROLES
		(!R1 (PRED?824.SK INANIMATE_OBJECT.N))
		(!R2 (NOT (HE.PRO = PRED?824.SK)))
		(!R3 (HE.PRO MALE.A))
		(!R4 (HE.PRO AGENT.N))
		(!R5 (PRED?824.SK PRED?.N))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P ?L1_2)))
		(?I2 (NOT (HE.PRO (AT.P ?L))))
	)
	(:STEPS
		(E837.SK (HE.PRO ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L)) GO.673.V)) ?L))
		(?E2 (HE.PRO GET.672.V PRED?824.SK (AT.P-ARG ?L2)))
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V PRED?824.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E837.SK BEFORE ?E2))
		(!W2 (E836.SK (CONSEC E837.SK)))
		(!W3 (E837.SK (DURING E833.SK)))
		(!W4 (E836.SK (DURING E833.SK)))
		(!W5 (E833.SK (AT-ABOUT NOW209)))
		(!W6 (E834.SK (AT-ABOUT NOW209)))
		(!W7 (E840.SK (DURING E834.SK)))
		(!W8 (E840.SK (CONSEC E841.SK)))
		(!W9 (E841.SK (DURING E834.SK)))
		(!W10 (E835.SK (AT-ABOUT NOW209)))
		(!W11 (E838.SK (DURING E835.SK)))
		(!W12 (E838.SK (CONSEC E839.SK)))
		(!W13 (E839.SK (DURING E835.SK)))
	)
)
))))
(setf matches (append matches '(( (1.5 2)
("Here are five pretty blue flowers."
 "They look like little bells, and so we can call them blue bells."
 "The stems and the leaves are green." "Ned has no flowers."
 "Tom says, “Here is my box of paints.” Ned paints the flowers blue."
 "But he has no green paint for the stems and leaves."
 "He can make green paint." "He can mix blue paint and yellow paint."
 "Blue and yellow make green.")
(EPI-SCHEMA ((HE.PRO GO_GET_NIL.1079.PR ?L PRED?824.SK) ** ?E)
	(:ROLES
		(!R1 (PRED?824.SK INANIMATE_OBJECT.N))
		(!R2 (NOT (HE.PRO = PRED?824.SK)))
		(!R3 (HE.PRO MALE.A))
		(!R4 (HE.PRO AGENT.N))
		(!R5 (PRED?824.SK PRED?.N))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P ?L1_2)))
		(?I2 (NOT (HE.PRO (AT.P ?L))))
	)
	(:STEPS
		(E839.SK (HE.PRO ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L)) GO.673.V)) ?L))
		(?E2 (HE.PRO GET.672.V PRED?824.SK (AT.P-ARG ?L2)))
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V PRED?824.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E839.SK BEFORE ?E2))
		(!W2 (E838.SK (CONSEC E839.SK)))
		(!W3 (E839.SK (DURING E835.SK)))
		(!W4 (E838.SK (DURING E835.SK)))
		(!W5 (E835.SK (AT-ABOUT NOW209)))
		(!W6 (E834.SK (AT-ABOUT NOW209)))
		(!W7 (E833.SK (AT-ABOUT NOW209)))
		(!W8 (E840.SK (DURING E834.SK)))
		(!W9 (E840.SK (CONSEC E841.SK)))
		(!W10 (E841.SK (DURING E834.SK)))
		(!W11 (E836.SK (DURING E833.SK)))
		(!W12 (E836.SK (CONSEC E837.SK)))
		(!W13 (E837.SK (DURING E833.SK)))
	)
)
))))
(setf matches (append matches '(( (1.5 2)
("Here are five pretty blue flowers."
 "They look like little bells, and so we can call them blue bells."
 "The stems and the leaves are green." "Ned has no flowers."
 "Tom says, “Here is my box of paints.” Ned paints the flowers blue."
 "But he has no green paint for the stems and leaves."
 "He can make green paint." "He can mix blue paint and yellow paint."
 "Blue and yellow make green.")
(EPI-SCHEMA ((HE.PRO GO_GET_NIL.1081.PR ?L PRED?824.SK) ** ?E)
	(:ROLES
		(!R1 (PRED?824.SK INANIMATE_OBJECT.N))
		(!R2 (NOT (HE.PRO = PRED?824.SK)))
		(!R3 (HE.PRO MALE.A))
		(!R4 (HE.PRO AGENT.N))
		(!R5 (PRED?824.SK PRED?.N))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P ?L1_2)))
		(?I2 (NOT (HE.PRO (AT.P ?L))))
	)
	(:STEPS
		(E841.SK (HE.PRO ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L)) GO.673.V)) ?L))
		(?E2 (HE.PRO GET.672.V PRED?824.SK (AT.P-ARG ?L2)))
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V PRED?824.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E841.SK BEFORE ?E2))
		(!W2 (E841.SK (DURING E834.SK)))
		(!W3 (E840.SK (DURING E834.SK)))
		(!W4 (E840.SK (CONSEC E841.SK)))
		(!W5 (E834.SK (AT-ABOUT NOW209)))
		(!W6 (E833.SK (AT-ABOUT NOW209)))
		(!W7 (E835.SK (AT-ABOUT NOW209)))
		(!W8 (E839.SK (DURING E835.SK)))
		(!W9 (E836.SK (DURING E833.SK)))
		(!W10 (E838.SK (DURING E835.SK)))
		(!W11 (E838.SK (CONSEC E839.SK)))
		(!W12 (E836.SK (CONSEC E837.SK)))
		(!W13 (E837.SK (DURING E833.SK)))
	)
)
))))
(setf matches (append matches '(( (3.9588 5)
("Here are five pretty blue flowers."
 "They look like little bells, and so we can call them blue bells."
 "The stems and the leaves are green." "Ned has no flowers."
 "Tom says, “Here is my box of paints.” Ned paints the flowers blue."
 "But he has no green paint for the stems and leaves."
 "He can make green paint." "He can mix blue paint and yellow paint."
 "Blue and yellow make green.")
(EPI-SCHEMA ((HE.PRO
              (OUT.ADV
               ((ADV-A (TO.P TOM.NAME)) ((ADV-A (FROM.P ?L1)) GO.1107.V)))
              TOM.NAME)
             ** E837.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (TOM.NAME LOCATION.N))
		(!R3 (NOT (?L1 = TOM.NAME)))
		(!R4 (TOM.NAME MAILBOX.N))
		(!R5 (HE.PRO MAN.N))
		(!R6 (E837.SK (RIGHT-AFTER ?X_A)))
		(!R7 (TOM.NAME PAPER.N))
		(!R8 (TOM.NAME (PERTAIN-TO HE.PRO)))
		(!R9 (?X_C ((NN PAPER.N) BOY.N)))
		(!R10 (?X_C (PERTAIN-TO HE.PRO)))
		(!R11 (HE.PRO MALE.A))
		(!R12 (HE.PRO AGENT.N))
		(!R13 (TOM.NAME BOX.N))
		(!R14 (TOM.NAME (PERTAIN-TO ME.PRO)))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P TOM.NAME)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P ?L1)))
		(?I2 (NOT (HE.PRO (AT.P TOM.NAME))))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P ?L1))))
		(?P2 (HE.PRO (AT.P TOM.NAME)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E837.SK))
		(!W2 (?I2 BEFORE E837.SK))
		(!W3 (?P1 AFTER E837.SK))
		(!W4 (?P2 AFTER E837.SK))
		(!W5 (?G1 CAUSE-OF E837.SK))
		(!W6 (E837.SK (SAME-TIME ?X_H)))
		(!W7 (?X_G (BEFORE ?X_H)))
		(!W8 (E836.SK (CONSEC E837.SK)))
		(!W9 (E837.SK (DURING E833.SK)))
		(!W10 (E836.SK (DURING E833.SK)))
		(!W11 (E833.SK (AT-ABOUT NOW209)))
		(!W12 (E834.SK (AT-ABOUT NOW209)))
		(!W13 (E840.SK (DURING E834.SK)))
		(!W14 (E840.SK (CONSEC E841.SK)))
		(!W15 (E841.SK (DURING E834.SK)))
		(!W16 (E835.SK (AT-ABOUT NOW209)))
		(!W17 (E838.SK (DURING E835.SK)))
		(!W18 (E838.SK (CONSEC E839.SK)))
		(!W19 (E839.SK (DURING E835.SK)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 27:
	; "Ellen opened the door of the cage to give her bird some water."
	; "The little bird flew out."
	; "It flew into a tree in the yard."
	; "Can you see it sitting in the tree?"
	; "Ellen sees it, but she cannot get it."
	; "The bird did not like to live in the cage."
	; "It likes to fly among the trees.Now it is singing and very happy."
discarding schema AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V learned from this story
; best schemas are:
; TAKE.1039.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; TAKE.542.V
; TAKE.895.V
; TAKE.885.V

; story 28:
	; "Jane, Joe and Harry will have a fine time today."
	; "There is no school, they have a play-day."
	; "They have come to the fields and woods."
	; "They see the birds fly from tree to tree."
	; "They hear their sweet songs."
	; "They are down by the pond."
	; "They have had a long walk."
	; "They can sit down now and rest."
; best schemas are:
; TAKE.1039.V
; TAKE.542.V
; TAKE.895.V
; TAKE.885.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
; TAKE.189.V

; story 29:
	; "One, two, three mice!"
	; "One mouse is on a table."
	; "Two mice are near the table."
	; "The mouse on the table is eating a bun."
	; "The mice near the table hear a cat, I think."
	; "Run, mice, run; a cat is near."
	; "Do you hear her?"
	; "She wants a mouse."
	; "A mouse has a long body, and a long tail."
	; "A mouse has two round ears."
; best schemas are:
; TAKE.1039.V
; TAKE.895.V
; TAKE.885.V
; TAKE.542.V
; GIVE.194.V
; FEED.660.V

; story 30:
	; "The cocoanut tree is tall."
	; "It is very pretty."
	; "Many cocoanuts grow on the tree."
	; "Simeon can climb the tree."
	; "He gets the cocoanuts for his mother."
	; "His mother likes cocoanuts."
	; "Luisa likes cocoanuts, too."
	; "She cannot climb the tree."
	; "She is too little to climb a tall tree."
	; "She likes to play with Simeon."
discarding schema GET.671.V learned from this story
; best schemas are:
; CLIMB_GET_EAT.349.PR
; TAKE.885.V
; GIVE.1297.V
; GET.346.V
; CLIMB.347.V
(setf matches (append matches '(( (2.5 5)
("The cocoanut tree is tall." "It is very pretty."
 "Many cocoanuts grow on the tree." "Simeon can climb the tree."
 "He gets the cocoanuts for his mother." "His mother likes cocoanuts."
 "Luisa likes cocoanuts, too." "She cannot climb the tree."
 "She is too little to climb a tall tree." "She likes to play with Simeon.")
(EPI-SCHEMA ((SIMEON.NAME CLIMB_GET_EAT.1328.PR TREE951.SK COCOANUT982.SK) **
             ?E)
	(:ROLES
		(!R1 (COCOANUT982.SK INANIMATE_OBJECT.N))
		(!R2 (NOT (SIMEON.NAME = COCOANUT982.SK)))
		(!R3 (TREE951.SK LOCATION.N))
		(!R4 (COCOANUT982.SK FOOD.N))
		(!R5 (COCOANUT982.SK COCOANUT.N))
		(!R6 (SIMEON.NAME MONKEY.N))
		(!R7 (COCOANUT982.SK (PLUR COCOANUT.N)))
		(!R8 (MOTHER968.SK MOTHER.N))
		(!R9 (MOTHER968.SK (PERTAIN-TO SIMEON.NAME)))
		(!R10 (TREE951.SK ((NN COCOANUT.N) TREE.N)))
		(!R11 (TREE951.SK TREE.N))
	)
	(:PRECONDS
		(?I1 (SIMEON.NAME (AT.P ?L1_2)))
		(?I2 (NOT (SIMEON.NAME (AT.P TREE951.SK))))
	)
	(:STEPS
		(?E1
   (SIMEON.NAME ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TREE951.SK)) CLIMB.347.V))
    TREE951.SK))
		(E966.SK (SIMEON.NAME GET.346.V COCOANUT982.SK (AT.P-ARG TREE951.SK)))
		(?E3 (SIMEON.NAME EAT.323.V COCOANUT982.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (SIMEON.NAME (HAVE.V COCOANUT982.SK))))
		(?P2 (NOT (SIMEON.NAME HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE E966.SK))
		(!W2 (E966.SK BEFORE ?E3))
		(!W3 (E966.SK (AT-ABOUT NOW242)))
	)
)
))))
(setf matches (append matches '(( (2.5 5)
("The cocoanut tree is tall." "It is very pretty."
 "Many cocoanuts grow on the tree." "Simeon can climb the tree."
 "He gets the cocoanuts for his mother." "His mother likes cocoanuts."
 "Luisa likes cocoanuts, too." "She cannot climb the tree."
 "She is too little to climb a tall tree." "She likes to play with Simeon.")
(EPI-SCHEMA ((SIMEON.NAME CLIMB_GET_EAT.1332.PR TREE977.SK COCOANUT982.SK) **
             ?E)
	(:ROLES
		(!R1 (COCOANUT982.SK INANIMATE_OBJECT.N))
		(!R2 (NOT (SIMEON.NAME = COCOANUT982.SK)))
		(!R3 (TREE977.SK LOCATION.N))
		(!R4 (COCOANUT982.SK FOOD.N))
		(!R5 (COCOANUT982.SK COCOANUT.N))
		(!R6 (SIMEON.NAME MONKEY.N))
		(!R7 (COCOANUT982.SK (PLUR COCOANUT.N)))
		(!R8 (MOTHER968.SK MOTHER.N))
		(!R9 (MOTHER968.SK (PERTAIN-TO SIMEON.NAME)))
		(!R10 (TREE977.SK TREE.N))
		(!R11 (TREE977.SK TALL.A))
	)
	(:PRECONDS
		(?I1 (SIMEON.NAME (AT.P ?L1_2)))
		(?I2 (NOT (SIMEON.NAME (AT.P TREE977.SK))))
	)
	(:STEPS
		(?E1
   (SIMEON.NAME ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TREE977.SK)) CLIMB.347.V))
    TREE977.SK))
		(E966.SK (SIMEON.NAME GET.346.V COCOANUT982.SK (AT.P-ARG TREE977.SK)))
		(?E3 (SIMEON.NAME EAT.323.V COCOANUT982.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (SIMEON.NAME (HAVE.V COCOANUT982.SK))))
		(?P2 (NOT (SIMEON.NAME HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE E966.SK))
		(!W2 (E966.SK BEFORE ?E3))
		(!W3 (E966.SK (AT-ABOUT NOW242)))
	)
)
))))
(setf matches (append matches '(( (4.5 4)
("The cocoanut tree is tall." "It is very pretty."
 "Many cocoanuts grow on the tree." "Simeon can climb the tree."
 "He gets the cocoanuts for his mother." "His mother likes cocoanuts."
 "Luisa likes cocoanuts, too." "She cannot climb the tree."
 "She is too little to climb a tall tree." "She likes to play with Simeon.")
(EPI-SCHEMA ((SIMEON.NAME GET.1338.V COCOANUT982.SK (AT.P-ARG ?L)) ** E966.SK)
	(:ROLES
		(!R1 (SIMEON.NAME AGENT.N))
		(!R2 (COCOANUT982.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (SIMEON.NAME = COCOANUT982.SK)))
		(!R5 (SIMEON.NAME MONKEY.N))
		(!R6 (COCOANUT982.SK COCOANUT.N))
		(!R7 (?X_A GROUND.N))
		(!R8 (COCOANUT982.SK (TO.P ?X_A)))
		(!R9 (COCOANUT982.SK (PLUR COCOANUT.N)))
		(!R10 (MOTHER968.SK MOTHER.N))
		(!R11 (MOTHER968.SK (PERTAIN-TO SIMEON.NAME)))
	)
	(:GOALS
		(?G1 (SIMEON.NAME (WANT.V (THAT (SIMEON.NAME (HAVE.V COCOANUT982.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SIMEON.NAME HAVE.V COCOANUT982.SK)))
		(?I2 (SIMEON.NAME (AT.P ?L)))
		(?I3 (COCOANUT982.SK (AT.P ?L)))
	)
	(:STEPS
	)
	(:POSTCONDS
		(?P1 (SIMEON.NAME HAVE.V COCOANUT982.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E966.SK))
		(!W2 (?I1 PRECOND-OF E966.SK))
		(!W3 (?I2 PRECOND-OF E966.SK))
		(!W4 (?I3 PRECOND-OF E966.SK))
		(!W5 (?P1 POSTCOND-OF E966.SK))
		(!W6 (?X_E (CONSEC E966.SK)))
		(!W7 (E966.SK (AT-ABOUT ?X_F)))
		(!W8 (?X_E (AT-ABOUT ?X_F)))
		(!W9 (E966.SK (AT-ABOUT NOW242)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 31:
	; "This man is not a Filipino."
	; "He comes from China."
	; "His hair is long and black."
	; "What is in his large basket?"
	; "There are many things in it."
	; "There are handkerchiefs and slippers for the girls, and hats and coats  for the boys."
	; "He has also knives, pencils, paper, and combs."
	; "He is called a peddler."
