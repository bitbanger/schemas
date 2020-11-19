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
; PLAY.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; TRAVEL.V
; SIT.V

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
; PLAY.V
; RECEIVING_VERB.?
; MAKE.V
; GIVE.V
; EAT.V

; story 2:
	; "Koy is teaching Carlo to beg."
	; "He stands and says, Beg, Carlo, beg."
	; "It is a bun."
	; "Beg, and you may have it."
	; "Carlo stands on his hind feet."
	; "He looks at the bun which Roy has in his hand and says, Bowwow, bow-wow."
	; "Ned sits and looks at Carlo."
	; "Roy will give the bun to Carlo."
; best schemas are:
; SIT.V
; GIVE.V
; TRAVEL.V
; FEED.V
(setf matches (append matches '(( (2.5 1)
("Koy is teaching Carlo to beg." "He stands and says, Beg, Carlo, beg."
 "It is a bun." "Beg, and you may have it." "Carlo stands on his hind feet."
 "He looks at the bun which Roy has in his hand and says, Bowwow, bow-wow."
 "Ned sits and looks at Carlo." "Roy will give the bun to Carlo.")
(EPI-SCHEMA ((NED.NAME ((ADV-A (ON.P ?S)) ((ADV-A (IN.P ?S)) SIT.118.V))) **
             E120.SK)
	(:ROLES
		(!R1 (NED.NAME AGENT.N))
		(!R2 (?S INANIMATE_OBJECT.N))
		(!R3 (?S FURNITURE.N))
		(!R4 (?L LOCATION.N))
	)
	(:GOALS
		(?G1 (NED.NAME (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (NED.NAME (AT.P ?L)))
		(?I2 (?S (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E120.SK (AT-ABOUT NOW22)))
		(!W2 (E119.SK (AT-ABOUT NOW22)))
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
; MAKE.V
; PLAY.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?

; story 4:
	; "Hal has a red drum."
	; "The drum is yellow."
	; "Ned has a gun."
	; "Max has a big flag."
	; "It is red white and blue."
	; "All three boys have caps."
; best schemas are:
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
; PLAY.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

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
; TRAVEL.V
; SEARCH.V
; FIND.V
; RECEIVING_VERB.?
; SIT.V

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
; TRAVEL.V
; SEARCH.V
; FIND.V
; RECEIVING_VERB.?
; SIT.V

; story 8:
	; "My horse is strong and kind."
	; "He will let me ride on his back."
	; "He draws me in a wagon."
	; "He can trot, and run."
	; "He can run as fast as Tom's horse."
	; "I call him Dan."
	; "He will come if I call him."
	; "He will eat from my hand."
; best schemas are:
; EAT.V
; FEED.V
; PUT_IN_CONTAINER.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
(setf matches (append matches '(( (3.5 2)
("My horse is strong and kind." "He will let me ride on his back."
 "He draws me in a wagon." "He can trot, and run."
 "He can run as fast as Tom's horse." "I call him Dan."
 "He will come if I call him." "He will eat from my hand.")
(EPI-SCHEMA ((HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.195.V) ?F) ** E335.SK)
	(:ROLES
		(!R1 (?F FOOD.N))
		(!R2 (HAND333.SK HAND.N))
		(!R3 (HE.PRO MALE.A))
		(!R4 (HE.PRO AGENT.N))
		(!R5 (HORSE301.SK (PERTAIN-TO HAND333.SK)))
		(!R6 (HORSE301.SK HORSE.N))
		(!R7 (HAND333.SK (PERTAIN-TO ME.PRO)))
		(!R8 (BACK314.SK BACK.N))
		(!R9 (BACK314.SK (PERTAIN-TO HORSE301.SK)))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (NOT (HE.PRO HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 (HE.PRO HAVE.V ?F))
		(?I2 (HE.PRO HUNGRY.A))
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (HAVE.V ?F))))
		(?P2 (NOT (HE.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E335.SK))
		(!W2 (?I1 BEFORE E335.SK))
		(!W3 (E335.SK CAUSE-OF ?P1))
		(!W4 (E335.SK (AFTER E331.SK)))
		(!W5 (E331.SK (AT-ABOUT NOW69)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.405 2)
("My horse is strong and kind." "He will let me ride on his back."
 "He draws me in a wagon." "He can trot, and run."
 "He can run as fast as Tom's horse." "I call him Dan."
 "He will come if I call him." "He will eat from my hand.")
(EPI-SCHEMA ((HORSE322.SK FEED.196.V HE.PRO ?F) ** ?E)
	(:ROLES
		(!R1 (HORSE322.SK AGENT.N))
		(!R2 (?F FOOD.N))
		(!R3 (NOT (HORSE322.SK = HE.PRO)))
		(!R4 (NOT (HE.PRO = ?F)))
		(!R5 (NOT (HORSE322.SK = ?F)))
		(!R6 (HAND333.SK HAND.N))
		(!R7 (HE.PRO MALE.A))
		(!R8 (HE.PRO AGENT.N))
		(!R9 (HORSE301.SK (PERTAIN-TO HAND333.SK)))
		(!R10 (HORSE301.SK HORSE.N))
		(!R11 (HAND333.SK (PERTAIN-TO ME.PRO)))
		(!R12 (BACK314.SK BACK.N))
		(!R13 (BACK314.SK (PERTAIN-TO HORSE301.SK)))
		(!R14 (HORSE322.SK HORSE.N))
		(!R15 (HORSE322.SK (PERTAIN-TO TOM.NAME)))
	)
	(:GOALS
		(?G1 (HORSE322.SK (WANT.V (THAT (NOT (HE.PRO HUNGRY.A))))))
		(?G2
   (HORSE322.SK
    (WANT.V (THAT (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) ?F)))))
	)
	(:PRECONDS
		(?I1 (HORSE322.SK HAVE.V ?F))
		(?I2 (HE.PRO HUNGRY.A))
	)
	(:STEPS
		(E335.SK (HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.V) ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (HORSE322.SK (HAVE.V ?F))))
		(?P2 (NOT (HE.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E335.SK AFTER ?E))
		(!W2 (E335.SK (AFTER E331.SK)))
		(!W3 (E331.SK (AT-ABOUT NOW69)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 10:
	; "This is little Lucy."
	; "Her home is far away."
	; "She has come to see  Frank and May."
	; "All the little girls love Lucy."
	; "They are kind and good to her, and she loves them."
	; "Frank will let her ride with him in the big wagon."
	; "He will give her the whip, and the horse will go fast."
	; "The horse will go fast and far, but he will not run away."
; best schemas are:
; TRAVEL.V
; GIVE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; PUT_IN_CONTAINER.V
(setf matches (append matches '(( (2.5 0)
("This is little Lucy." "Her home is far away."
 "She has come to see  Frank and May." "All the little girls love Lucy."
 "They are kind and good to her, and she loves them."
 "Frank will let her ride with him in the big wagon."
 "He will give her the whip, and the horse will go fast."
 "The horse will go fast and far, but he will not run away.")
(EPI-SCHEMA ((SHE383.SK
              ((ADV-A (FOR.P (KA (SEE.V (SET-OF FRANK.NAME MAY.NAME)))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.280.V)))
              ?L2)
             ** E354.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (SHE383.SK AGENT.N))
		(!R5 (HOME350.SK HOME.N))
		(!R6 (HOME350.SK (PERTAIN-TO SHE383.SK)))
		(!R7 (E357.SK (IMPINGES-ON E354.SK)))
	)
	(:GOALS
		(?G1 (SHE383.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SHE383.SK (AT.P ?L1)))
		(?I2 (NOT (SHE383.SK (AT.P ?L2))))
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
		(!W6 (E354.SK (AT-ABOUT NOW78)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.1411133 3)
("This is little Lucy." "Her home is far away."
 "She has come to see  Frank and May." "All the little girls love Lucy."
 "They are kind and good to her, and she loves them."
 "Frank will let her ride with him in the big wagon."
 "He will give her the whip, and the horse will go fast."
 "The horse will go fast and far, but he will not run away.")
(EPI-SCHEMA ((FRANK.NAME ((ADV-A (TO.P SHE383.SK)) GIVE.281.V) SHE383.SK
              WHIP376.SK)
             ** E378.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (WHIP376.SK INANIMATE_OBJECT.N))
		(!R3 (SHE383.SK AGENT.N))
		(!R4 (WHIP376.SK WHIP.N))
		(!R5 (HOME350.SK HOME.N))
		(!R6 (HOME350.SK (PERTAIN-TO SHE383.SK)))
	)
	(:GOALS
		(?G1 (FRANK.NAME (WANT.V (THAT (SHE383.SK (HAVE.V WHIP376.SK))))))
	)
	(:PRECONDS
		(?I1 (FRANK.NAME HAVE.V WHIP376.SK))
		(?I2 (NOT (SHE383.SK HAVE.V WHIP376.SK)))
	)
	(:POSTCONDS
		(?P1 (NOT (FRANK.NAME HAVE.V WHIP376.SK)))
		(?P2 (SHE383.SK HAVE.V WHIP376.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E378.SK (AFTER E375.SK)))
		(!W2 (E375.SK (AT-ABOUT NOW82)))
		(!W3 (E374.SK (AT-ABOUT NOW82)))
		(!W4 (E379.SK (AFTER E374.SK)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
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
; EAT.V
; FEED.V
; GIVE.V
; RECEIVING_VERB.?
; PLAY.V

; story 12:
	; "The monkey can climb a tree."
	; "He climbs the tree and gets a cocoanut."
	; "He drops the cocoanut to the ground."
	; "He comes down and eats it."
	; "The monkey likes to run and play."
	; "Is Simeon afraid of the monkey?"
	; "Luisa is afraid of large monkeys."
	; "She is not afraid of this little monkey."
; best schemas are:
; EAT.V
; FEED.V
; RECEIVING_VERB.?
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
(setf matches (append matches '(( (4.4049997 4)
("The monkey can climb a tree." "He climbs the tree and gets a cocoanut."
 "He drops the cocoanut to the ground." "He comes down and eats it."
 "The monkey likes to run and play." "Is Simeon afraid of the monkey?"
 "Luisa is afraid of large monkeys." "She is not afraid of this little monkey.")
(EPI-SCHEMA ((MONKEY425.SK EAT.323.V COCOANUT430.SK) ** E443.SK)
	(:ROLES
		(!R1 (MONKEY425.SK AGENT.N))
		(!R2 (COCOANUT430.SK FOOD.N))
		(!R3 (MONKEY425.SK MONKEY.N))
		(!R4 (COCOANUT430.SK COCOANUT.N))
		(!R5 (GROUND438.SK GROUND.N))
		(!R6 (COCOANUT430.SK (TO.P GROUND438.SK)))
	)
	(:GOALS
		(?G1 (MONKEY425.SK (WANT.V (THAT (NOT (MONKEY425.SK HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 (MONKEY425.SK HAVE.V COCOANUT430.SK))
		(?I2 (MONKEY425.SK HUNGRY.A))
	)
	(:POSTCONDS
		(?P1 (NOT (MONKEY425.SK (HAVE.V COCOANUT430.SK))))
		(?P2 (NOT (MONKEY425.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E443.SK))
		(!W2 (?I1 BEFORE E443.SK))
		(!W3 (E443.SK CAUSE-OF ?P1))
		(!W4 (E442.SK (CONSEC E443.SK)))
		(!W5 (E443.SK (DURING E440.SK)))
		(!W6 (E442.SK (DURING E440.SK)))
		(!W7 (E444.SK (AT-ABOUT NOW94)))
		(!W8 (E440.SK (AT-ABOUT NOW94)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (0.905 2)
("The monkey can climb a tree." "He climbs the tree and gets a cocoanut."
 "He drops the cocoanut to the ground." "He comes down and eats it."
 "The monkey likes to run and play." "Is Simeon afraid of the monkey?"
 "Luisa is afraid of large monkeys." "She is not afraid of this little monkey.")
(EPI-SCHEMA ((?X FEED.324.V MONKEY425.SK COCOANUT430.SK) ** ?E)
	(:ROLES
		(!R1 (?X AGENT.N))
		(!R2 (MONKEY425.SK AGENT.N))
		(!R3 (COCOANUT430.SK FOOD.N))
		(!R4 (NOT (?X = MONKEY425.SK)))
		(!R5 (NOT (MONKEY425.SK = COCOANUT430.SK)))
		(!R6 (NOT (?X = COCOANUT430.SK)))
		(!R7 (MONKEY425.SK MONKEY.N))
		(!R8 (COCOANUT430.SK COCOANUT.N))
		(!R9 (GROUND438.SK GROUND.N))
		(!R10 (COCOANUT430.SK (TO.P GROUND438.SK)))
	)
	(:GOALS
		(?G1 (?X (WANT.V (THAT (NOT (MONKEY425.SK HUNGRY.A))))))
		(?G2 (?X (WANT.V (THAT (MONKEY425.SK EAT.V COCOANUT430.SK)))))
	)
	(:PRECONDS
		(?I1 (?X HAVE.V COCOANUT430.SK))
		(?I2 (MONKEY425.SK HUNGRY.A))
	)
	(:STEPS
		(E443.SK (MONKEY425.SK EAT.V COCOANUT430.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (?X (HAVE.V COCOANUT430.SK))))
		(?P2 (NOT (MONKEY425.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E443.SK AFTER ?E))
		(!W2 (E442.SK (CONSEC E443.SK)))
		(!W3 (E443.SK (DURING E440.SK)))
		(!W4 (E442.SK (DURING E440.SK)))
		(!W5 (E444.SK (AT-ABOUT NOW94)))
		(!W6 (E440.SK (AT-ABOUT NOW94)))
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
(setf matches (append matches '(( (0.905 2)
("The monkey can climb a tree." "He climbs the tree and gets a cocoanut."
 "He drops the cocoanut to the ground." "He comes down and eats it."
 "The monkey likes to run and play." "Is Simeon afraid of the monkey?"
 "Luisa is afraid of large monkeys." "She is not afraid of this little monkey.")
(EPI-SCHEMA ((?X FEED.325.V MONKEY425.SK COCOANUT430.SK) ** ?E)
	(:ROLES
		(!R1 (?X AGENT.N))
		(!R2 (MONKEY425.SK AGENT.N))
		(!R3 (COCOANUT430.SK FOOD.N))
		(!R4 (NOT (?X = MONKEY425.SK)))
		(!R5 (NOT (MONKEY425.SK = COCOANUT430.SK)))
		(!R6 (NOT (?X = COCOANUT430.SK)))
		(!R7 (MONKEY425.SK MONKEY.N))
		(!R8 (COCOANUT430.SK COCOANUT.N))
		(!R9 (GROUND438.SK GROUND.N))
		(!R10 (COCOANUT430.SK (TO.P GROUND438.SK)))
	)
	(:GOALS
		(?G1 (?X (WANT.V (THAT (NOT (MONKEY425.SK HUNGRY.A))))))
		(?G2 (?X (WANT.V (THAT (MONKEY425.SK EAT.V COCOANUT430.SK)))))
	)
	(:PRECONDS
		(?I1 (?X HAVE.V COCOANUT430.SK))
		(?I2 (MONKEY425.SK HUNGRY.A))
	)
	(:STEPS
		(E444.SK (MONKEY425.SK EAT.V COCOANUT430.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (?X (HAVE.V COCOANUT430.SK))))
		(?P2 (NOT (MONKEY425.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E444.SK AFTER ?E))
		(!W2 (E444.SK (AT-ABOUT NOW94)))
		(!W3 (E440.SK (AT-ABOUT NOW94)))
		(!W4 (E442.SK (DURING E440.SK)))
		(!W5 (E442.SK (CONSEC E443.SK)))
		(!W6 (E443.SK (DURING E440.SK)))
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
(setf matches (append matches '(( (3.905 3)
("The monkey can climb a tree." "He climbs the tree and gets a cocoanut."
 "He drops the cocoanut to the ground." "He comes down and eats it."
 "The monkey likes to run and play." "Is Simeon afraid of the monkey?"
 "Luisa is afraid of large monkeys." "She is not afraid of this little monkey.")
(EPI-SCHEMA ((MONKEY425.SK GET.346.V COCOANUT430.SK (AT.P-ARG ?L)) ** E431.SK)
	(:ROLES
		(!R1 (MONKEY425.SK AGENT.N))
		(!R2 (COCOANUT430.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MONKEY425.SK = COCOANUT430.SK)))
		(!R5 (MONKEY425.SK MONKEY.N))
		(!R6 (COCOANUT430.SK COCOANUT.N))
		(!R7 (GROUND438.SK GROUND.N))
		(!R8 (COCOANUT430.SK (TO.P GROUND438.SK)))
	)
	(:GOALS
		(?G1 (MONKEY425.SK (WANT.V (THAT (MONKEY425.SK (HAVE.V COCOANUT430.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MONKEY425.SK HAVE.V COCOANUT430.SK)))
		(?I2 (MONKEY425.SK (AT.P ?L)))
		(?I3 (COCOANUT430.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (MONKEY425.SK HAVE.V COCOANUT430.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E431.SK))
		(!W2 (?I1 PRECOND-OF E431.SK))
		(!W3 (?I2 PRECOND-OF E431.SK))
		(!W4 (?I3 PRECOND-OF E431.SK))
		(!W5 (?P1 POSTCOND-OF E431.SK))
		(!W6 (E432.SK (CONSEC E431.SK)))
		(!W7 (E431.SK (AT-ABOUT NOW92)))
		(!W8 (E432.SK (AT-ABOUT NOW92)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.405 3)
("The monkey can climb a tree." "He climbs the tree and gets a cocoanut."
 "He drops the cocoanut to the ground." "He comes down and eats it."
 "The monkey likes to run and play." "Is Simeon afraid of the monkey?"
 "Luisa is afraid of large monkeys." "She is not afraid of this little monkey.")
(EPI-SCHEMA ((MONKEY425.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TREE426.SK)) CLIMB.347.V))
              TREE426.SK)
             ** E432.SK)
	(:ROLES
		(!R1 (MONKEY425.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (TREE426.SK LOCATION.N))
		(!R4 (NOT (?L1 = TREE426.SK)))
		(!R5 (TREE426.SK TREE.N))
		(!R6 (MONKEY425.SK MONKEY.N))
	)
	(:GOALS
		(?G1 (MONKEY425.SK (WANT.V (KA ((ADV-A (AT.P TREE426.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MONKEY425.SK (AT.P ?L1)))
		(?I2 (NOT (MONKEY425.SK (AT.P TREE426.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT (MONKEY425.SK (AT.P ?L1))))
		(?P2 (MONKEY425.SK (AT.P TREE426.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E432.SK))
		(!W2 (?I2 BEFORE E432.SK))
		(!W3 (?P1 AFTER E432.SK))
		(!W4 (?P2 AFTER E432.SK))
		(!W5 (?G1 CAUSE-OF E432.SK))
		(!W6 (E432.SK (CONSEC E431.SK)))
		(!W7 (E431.SK (AT-ABOUT NOW92)))
		(!W8 (E432.SK (AT-ABOUT NOW92)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; found chains:
; 	chain 2:
;		((MONKEY425.SK
     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TREE426.SK)) CLIMB.347.V)) TREE426.SK)
    ** E432.SK)
;		((MONKEY425.SK GET.346.V COCOANUT430.SK (AT.P-ARG TREE426.SK)) ** E431.SK)
;		((MONKEY425.SK EAT.323.V COCOANUT430.SK) ** E443.SK)
;learned chain schema:
(setf chain-matches (append chain-matches (list '(EPI-SCHEMA ((?X_B
                                                               CLIMB_GET_EAT.349.PR
                                                               ?X_A ?X_C)
                                                              ** ?E)
	(:ROLES
		(!R1 (?X_A TREE.N))
		(!R2 (?X_C INANIMATE_OBJECT.N))
		(!R3 (NOT (?X_B = ?X_C)))
		(!R4 (?X_A LOCATION.N))
		(!R5 (?X_C FOOD.N))
		(!R6 (?X_C COCOANUT.N))
		(!R7 (?X_B MONKEY.N))
	)
	(:PRECONDS
		(?I1 (?X_B (AT.P ?L1_2)))
		(?I2 (NOT (?X_B (AT.P ?X_A))))
	)
	(:STEPS
		(?E1 (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) CLIMB.347.V)) ?X_A))
		(?E2 (?X_B GET.346.V ?X_C (AT.P-ARG ?X_A)))
		(?E3 (?X_B EAT.323.V ?X_C))
	)
	(:POSTCONDS
		(?P1 (NOT (?X_B (HAVE.V ?X_C))))
		(?P2 (NOT (?X_B HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE ?E2))
		(!W2 (?E2 BEFORE ?E3))
	)
)
)))
; story 13:
	; "The sun is up."
	; "The man has fed the black hen and the fat duck."
	; "Now the duck will swim in the pond."
	; "The hen has run to her nest."
	; "Let us not stop at the pond now, for it is hot."
	; "See how still it is!"
	; "We will go to see Tom and his top."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; RECEIVING_VERB.?
; SIT.V
(setf matches (append matches '(( (5.1862497 4)
("The sun is up." "The man has fed the black hen and the fat duck."
 "Now the duck will swim in the pond." "The hen has run to her nest."
 "Let us not stop at the pond now, for it is hot." "See how still it is!"
 "We will go to see Tom and his top.")
(EPI-SCHEMA ((HEN466.SK
              ((ADV-A (FROM.P TOP483.SK))
               ((ADV-A (TO.P NEST478.SK)) RUN.350.V))
              NEST478.SK)
             ** E475.SK)
	(:ROLES
		(!R1 (HEN466.SK AGENT.N))
		(!R2 (TOP483.SK LOCATION.N))
		(!R3 (NEST478.SK LOCATION.N))
		(!R4 (NOT (TOP483.SK = NEST478.SK)))
		(!R5 (HEN466.SK BLACK.A))
		(!R6 (HEN466.SK HEN.N))
		(!R7 (NEST478.SK (PERTAIN-TO HEN466.SK)))
		(!R8 (NEST478.SK NEST.N))
		(!R9 (E475.SK (IMPINGES-ON E474.SK)))
		(!R10 (TOP483.SK TOP.N))
		(!R11 (TOP483.SK (PERTAIN-TO TOM.NAME)))
	)
	(:GOALS
		(?G1 (HEN466.SK (WANT.V (KA ((ADV-A (AT.P NEST478.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HEN466.SK (AT.P TOP483.SK)))
		(?I2 (NOT (HEN466.SK (AT.P NEST478.SK))))
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
		(!W6 (E474.SK (AT-ABOUT NOW102)))
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
; PLAY.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; TRAVEL.V
; SIT.V

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
; RECEIVING_VERB.?
; SEARCH.V
; FIND.V
; GIVE.V
; EAT.V

; story 17:
	; "The sun is hot and the carabao likes to stand in the water."
	; "Simeon rode him here."
	; "Soo Simeon will ride him home."
	; "Where is Simeon?"
	; "He likes to sit under a tree."
	; "Simeon's father has five carabaos."
	; "Three of them are old, and two of them are young."
; best schemas are:
; SIT.V
; TRAVEL.V
; RECEIVING_VERB.?
; SEARCH.V
; FIND.V
(setf matches (append matches '(( (2.405 1)
("The sun is hot and the carabao likes to stand in the water."
 "Simeon rode him here." "Soo Simeon will ride him home." "Where is Simeon?"
 "He likes to sit under a tree." "Simeon's father has five carabaos."
 "Three of them are old, and two of them are young.")
(EPI-SCHEMA ((SIMEON.NAME ((ADV-A (ON.P ?S)) ((ADV-A (IN.P ?S)) RIDE.437.V)))
             ** E575.SK)
	(:ROLES
		(!R1 (SIMEON.NAME AGENT.N))
		(!R2 (?S INANIMATE_OBJECT.N))
		(!R3 (?S FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (SIMEON.NAME FATHER.N))
		(!R6 (SIMEON.NAME (PERTAIN-TO SIMEON.NAME)))
		(!R7 (HE590.SK AGENT.N))
	)
	(:GOALS
		(?G1 (SIMEON.NAME (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (SIMEON.NAME (AT.P ?L)))
		(?I2 (?S (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E575.SK (BEFORE NOW132)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.405 3)
("The sun is hot and the carabao likes to stand in the water."
 "Simeon rode him here." "Soo Simeon will ride him home." "Where is Simeon?"
 "He likes to sit under a tree." "Simeon's father has five carabaos."
 "Three of them are old, and two of them are young.")
(EPI-SCHEMA ((SIMEON.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P HE590.SK)) RIDE.438.V))
              HE590.SK)
             ** E575.SK)
	(:ROLES
		(!R1 (SIMEON.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (HE590.SK LOCATION.N))
		(!R4 (NOT (?L1 = HE590.SK)))
		(!R5 (SIMEON.NAME FATHER.N))
		(!R6 (SIMEON.NAME (PERTAIN-TO SIMEON.NAME)))
		(!R7 (HE590.SK AGENT.N))
	)
	(:GOALS
		(?G1 (SIMEON.NAME (WANT.V (KA ((ADV-A (AT.P HE590.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SIMEON.NAME (AT.P ?L1)))
		(?I2 (NOT (SIMEON.NAME (AT.P HE590.SK))))
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
		(!W6 (E575.SK (BEFORE NOW132)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; EAT.V
; FEED.V
; PLAY.V
; TRAVEL.V

; story 19:
	; "Grace is running after the butterfly."
	; "Can she catch it?"
	; "I think not."
	; "It can fly faster than Grace can run."
	; "Grace has many flowers in her garden."
	; "The butterflies come there because they like the flowers."
	; "They fly among them all day."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.5 0)
("Grace is running after the butterfly." "Can she catch it?" "I think not."
 "It can fly faster than Grace can run."
 "Grace has many flowers in her garden."
 "The butterflies come there because they like the flowers."
 "They fly among them all day.")
(EPI-SCHEMA ((GRACE.NAME
              ((ADV-A (AFTER.P BUTTERFLY621.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.472.V)))
              ?L2)
             ** E620.SK)
	(:ROLES
		(!R1 (GRACE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (BUTTERFLY621.SK BUTTERFLY.N))
	)
	(:GOALS
		(?G1 (GRACE.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GRACE.NAME (AT.P ?L1)))
		(?I2 (NOT (GRACE.NAME (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (GRACE.NAME (AT.P ?L1))))
		(?P2 (GRACE.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E620.SK))
		(!W2 (?I2 BEFORE E620.SK))
		(!W3 (?P1 AFTER E620.SK))
		(!W4 (?P2 AFTER E620.SK))
		(!W5 (?G1 CAUSE-OF E620.SK))
		(!W6 (E620.SK (AT-ABOUT NOW147)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

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
; TRAVEL.V

; story 21:
	; "Nan has two black hens."
	; "They lay nice white eggs."
	; "You can find them in the hay."
	; "My hen lays eggs, too."
	; "She has her nest up on the beam."
	; "She will fly off, and say “cluck, cluck!”"
; best schemas are:
; SEARCH.V
; FIND.V
; EAT.V
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V

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
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
(setf matches (append matches '(( (2.6953125 2)
("Simeon and Pedro like to fish." "Sometimes they sit on the bridge."
 "Sometimes they sit on the bank of the river."
 "They have poles, long lines, and little iron hooks."
 "This morning Simeon caught a large fish." "Pedro caught many small ones."
 "The boys caught some crabs, too." "They use a net to catch the crabs.")
(EPI-SCHEMA ((THEY709.SK
              (SOMETIMES.ADV
               ((ADV-A (IN.P BRIDGE690.SK))
                ((ADV-A (ON.P BRIDGE690.SK)) SIT.505.V))))
             ** E691.SK)
	(:ROLES
		(!R1 (BRIDGE690.SK INANIMATE_OBJECT.N))
		(!R2 (BRIDGE690.SK FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (THEY709.SK AGENT.N))
		(!R5 (BRIDGE690.SK BRIDGE.N))
		(!R6 (BRIDGE690.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (THEY709.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (THEY709.SK (AT.P ?L)))
		(?I2 (BRIDGE690.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E691.SK (AT-ABOUT NOW169)))
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
; best schemas are:
; SEARCH.V
; FIND.V
; EAT.V
; FEED.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (3.6003125 3)
("This is red clover." "The bees like it."
 "They find sweet nectar in the clover flowers."
 "They take the nectar home to make honey." "Here is white clover."
 "It is sweet." "It has nectar, and bees like it, too."
 "It grows in the fields with red clover and yellow buttercups."
 "Horses and cows eat clover.")
(EPI-SCHEMA ((BEES715.SK ((ADV-A (IN.P FLOWERS721.SK)) FIND.518.V)
              (K (L #:G737381 (AND (#:G737381 SWEET.A) (#:G737381 NECTAR.N)))))
             ** E722.SK)
	(:ROLES
		(!R1 (BEES715.SK AGENT.N))
		(!R2 (HOME724.SK LOCATION.N))
		(!R3 (BEES715.SK (PLUR BEE.N)))
		(!R4 (FLOWERS721.SK ((NN CLOVER.N) (PLUR FLOWER.N))))
		(!R5 (HOME724.SK NECTAR.A))
		(!R6 (HOME724.SK HOME.N))
	)
	(:PRECONDS
		(?I1 (BEES715.SK (AT.P HOME724.SK)))
		(?I2
   ((K (L #:G737381 (AND (#:G737381 SWEET.A) (#:G737381 NECTAR.N))))
    (AT.P HOME724.SK)))
		(?I3
   (BEES715.SK
    ((ADV-A
      (FOR.P (K (L #:G737381 (AND (#:G737381 SWEET.A) (#:G737381 NECTAR.N))))))
     SEARCH.V)))
		(?I4
   (NOT
    (BEES715.SK
     (KNOW.V
      (THAT
       ((K (L #:G737381 (AND (#:G737381 SWEET.A) (#:G737381 NECTAR.N))))
        (AT.P HOME724.SK)))))))
		(?I5
   (NOT
    (BEES715.SK
     (HAVE.V
      (K (L #:G737381 (AND (#:G737381 SWEET.A) (#:G737381 NECTAR.N))))))))
	)
	(:POSTCONDS
		(?P1
   (BEES715.SK
    (KNOW.V
     (THAT
      ((K (L #:G737381 (AND (#:G737381 SWEET.A) (#:G737381 NECTAR.N))))
       (AT.P HOME724.SK))))))
		(?P2
   (BEES715.SK
    (HAVE.V (K (L #:G737381 (AND (#:G737381 SWEET.A) (#:G737381 NECTAR.N)))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E722.SK (AT-ABOUT NOW178)))
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
; RECEIVING_VERB.?
; GIVE.V
; EAT.V
; FEED.V
; PLAY.V

; story 25:
	; "This large animal is an elephant."
	; "His ears look like fans."
	; "The two long teeth are called tusks."
	; "The elephant eats grass and green corn."
	; "He likes oranges bananas and peanuts."
	; "Elephants live in India."
; best schemas are:
; EAT.V
; FEED.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (4.4049997 4)
("This large animal is an elephant." "His ears look like fans."
 "The two long teeth are called tusks."
 "The elephant eats grass and green corn."
 "He likes oranges bananas and peanuts." "Elephants live in India.")
(EPI-SCHEMA ((ELEPHANT808.SK EAT.586.V
              (SET-OF (K GRASS.N)
               (K (L #:G844693 (AND (#:G844693 GREEN.A) (#:G844693 CORN.N))))))
             ** E807.SK)
	(:ROLES
		(!R1 (ELEPHANT808.SK AGENT.N))
		(!R2
   ((SET-OF (K GRASS.N)
     (K (L #:G844693 (AND (#:G844693 GREEN.A) (#:G844693 CORN.N)))))
    FOOD.N))
		(!R3 (ELEPHANT808.SK ELEPHANT.N))
		(!R4 (E807.SK (RIGHT-AFTER U200)))
	)
	(:GOALS
		(?G1 (ELEPHANT808.SK (WANT.V (THAT (NOT (ELEPHANT808.SK HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1
   (ELEPHANT808.SK HAVE.V
    (SET-OF (K GRASS.N)
     (K (L #:G844693 (AND (#:G844693 GREEN.A) (#:G844693 CORN.N)))))))
		(?I2 (ELEPHANT808.SK HUNGRY.A))
	)
	(:POSTCONDS
		(?P1
   (NOT
    (ELEPHANT808.SK
     (HAVE.V
      (SET-OF (K GRASS.N)
       (K (L #:G844693 (AND (#:G844693 GREEN.A) (#:G844693 CORN.N)))))))))
		(?P2 (NOT (ELEPHANT808.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E807.SK))
		(!W2 (?I1 BEFORE E807.SK))
		(!W3 (E807.SK CAUSE-OF ?P1))
		(!W4 (E807.SK (SAME-TIME NOW201)))
		(!W5 (E810.SK (AT-ABOUT NOW201)))
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
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PUT_IN_CONTAINER.V
; PLAY.V

; story 27:
	; "Ellen opened the door of the cage to give her bird some water."
	; "The little bird flew out."
	; "It flew into a tree in the yard."
	; "Can you see it sitting in the tree?"
	; "Ellen sees it, but she cannot get it."
	; "The bird did not like to live in the cage."
	; "It likes to fly among the trees.Now it is singing and very happy."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (1.43625 1)
("Ellen opened the door of the cage to give her bird some water."
 "The little bird flew out." "It flew into a tree in the yard."
 "Can you see it sitting in the tree?" "Ellen sees it, but she cannot get it."
 "The bird did not like to live in the cage."
 "It likes to fly among the trees.Now it is singing and very happy.")
(EPI-SCHEMA ((BIRD865.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.619.V
              (KA (LIKE.V (KA ((ADV-A (IN.P CAGE866.SK)) LIVE.V)))))
             ** ?E)
	(:ROLES
		(!R1 (BIRD865.SK AGENT.N))
		(!R2 ((KA (LIKE.V (KA ((ADV-A (IN.P CAGE866.SK)) LIVE.V)))) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (BIRD865.SK BIRD.N))
		(!R5 (CAGE866.SK CAGE.N))
	)
	(:GOALS
		(?G1 (BIRD865.SK (WANT.V (THAT (NOT (BIRD865.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE
     (BIRD865.SK (DO.V (KA (LIKE.V (KA ((ADV-A (IN.P CAGE866.SK)) LIVE.V)))))))
    CAUSE-OF (KE (BIRD865.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E870.SK
   (NOT
    (BIRD865.SK (DO.V (KA (LIKE.V (KA ((ADV-A (IN.P CAGE866.SK)) LIVE.V))))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E870.SK))
		(!W2 (E870.SK (BEFORE NOW218)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

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
; best schemas are:
; PLAY.V
; RECEIVING_VERB.?
; TRAVEL.V
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
(setf matches (append matches '(( (4.0 3)
("The cocoanut tree is tall." "It is very pretty."
 "Many cocoanuts grow on the tree." "Simeon can climb the tree."
 "He gets the cocoanuts for his mother." "His mother likes cocoanuts."
 "Luisa likes cocoanuts, too." "She cannot climb the tree."
 "She is too little to climb a tall tree." "She likes to play with Simeon.")
(EPI-SCHEMA ((SIMEON.NAME GET.671.V COCOANUT982.SK (AT.P-ARG ?L)) ** E966.SK)
	(:ROLES
		(!R1 (SIMEON.NAME AGENT.N))
		(!R2 (COCOANUT982.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (SIMEON.NAME = COCOANUT982.SK)))
		(!R5 (COCOANUT982.SK (PLUR COCOANUT.N)))
		(!R6 (MOTHER968.SK MOTHER.N))
		(!R7 (MOTHER968.SK (PERTAIN-TO SIMEON.NAME)))
	)
	(:GOALS
		(?G1 (SIMEON.NAME (WANT.V (THAT (SIMEON.NAME (HAVE.V COCOANUT982.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SIMEON.NAME HAVE.V COCOANUT982.SK)))
		(?I2 (SIMEON.NAME (AT.P ?L)))
		(?I3 (COCOANUT982.SK (AT.P ?L)))
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
		(!W6 (E966.SK (AT-ABOUT NOW242)))
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
