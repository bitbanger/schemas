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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 1:
	; "A parrot can talk."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 2:
	; "The boy and the dog run."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 3:
	; "The hen will run at the cat."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.405 0)
("The hen will run at the cat.")
(EPI-SCHEMA ((HEN35.SK
              ((ADV-A (AT.P CAT36.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.28.V)))
              ?L2)
             ** E38.SK)
	(:ROLES
		(!R1 (HEN35.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (CAT36.SK CAT.N))
		(!R6 (HEN35.SK HEN.N))
	)
	(:GOALS
		(?G1 (HEN35.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HEN35.SK (AT.P ?L1)))
		(?I2 (NOT (HEN35.SK (AT.P ?L2))))
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
		(!W6 (E38.SK (AFTER E34.SK)))
		(!W7 (E34.SK (AT-ABOUT NOW8)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 5:
	; "I see one dog and two cats."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 6:
	; "She saw Rover run off with the hat."
; best schemas are:

; story 7:
	; "Here come Jack and Jill on a red sled."
; best schemas are:
; TRAVEL.V

; story 8:
	; "The Hare runs from the Dog."
; best schemas are:

; story 9:
	; "The Fox will eat the Hen."
; best schemas are:

; story 10:
	; "The Man breaks the Ice."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 11:
	; "That man is shooting partridges."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 12:
	; "The rat ran from the box."
; best schemas are:
; PUT_IN_CONTAINER.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (3.405 2)
("The rat ran from the box.")
(EPI-SCHEMA ((RAT75.SK
              ((ADV-A (FROM.P BOX77.SK)) ((ADV-A (TO.P ?L2)) RUN.58.V)) ?L2)
             ** E74.SK)
	(:ROLES
		(!R1 (RAT75.SK AGENT.N))
		(!R2 (BOX77.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (BOX77.SK = ?L2)))
		(!R5 (BOX77.SK BOX.N))
		(!R6 (RAT75.SK RAT.N))
		(!R7 (E74.SK (RIGHT-AFTER U16)))
	)
	(:GOALS
		(?G1 (RAT75.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (RAT75.SK (AT.P BOX77.SK)))
		(?I2 (NOT (RAT75.SK (AT.P ?L2))))
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
		(!W6 (E74.SK (SAME-TIME NOW17)))
		(!W7 (E78.SK (BEFORE NOW17)))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 14:
	; "The baby can not have the bird."
	; "She can not fly and catch it."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 15:
	; "I have four apples on this plate."
	; "If I put two apples on the box, I shall leave two apples on the plate."
	; "Four apples are two apples and two apples."
	; "If I put three apples on the box, I shall leave one apple on the plate."
	; "Four apples are three apples and one apple."
	; "If I put one on the box, I shall leave on the plate."
; best schemas are:
; EAT.V
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?

; story 16:
	; "The bear was small then, so he was not afraid of him."
	; "He cut the tree down, and as soon as it fell, the dogs caught the bear."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 17:
	; "The cat saw the rat."
	; "Off ran the rat, and off ran the cat."
	; "But the rat got to the hole all safe."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; PLAY.V
; GIVE.V
; TRAVEL.V
(setf matches (append matches '(( (2.405 0)
("The cat saw the rat." "Off ran the rat, and off ran the cat."
 "But the rat got to the hole all safe.")
(EPI-SCHEMA ((RAT124.SK ((ADV-A (TO.P HOLE134.SK)) GET.143.V) ?O (AT.P-ARG ?L))
             ** E130.SK)
	(:ROLES
		(!R1 (RAT124.SK AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (RAT124.SK = ?O)))
		(!R5 (RAT124.SK RAT.N))
		(!R6 (HOLE134.SK (ALL.ADV SAFE.A)))
		(!R7 (HOLE134.SK HOLE.N))
		(!R8 (E130.SK (RIGHT-AFTER U30)))
	)
	(:GOALS
		(?G1 (RAT124.SK (WANT.V (THAT (RAT124.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (NOT (RAT124.SK HAVE.V ?O)))
		(?I2 (RAT124.SK (AT.P ?L)))
		(?I3 (?O (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (RAT124.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E130.SK))
		(!W2 (?I1 PRECOND-OF E130.SK))
		(!W3 (?I2 PRECOND-OF E130.SK))
		(!W4 (?I3 PRECOND-OF E130.SK))
		(!W5 (?P1 POSTCOND-OF E130.SK))
		(!W6 (E130.SK (SAME-TIME NOW31)))
		(!W7 (E136.SK (BEFORE NOW31)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 19:
	; "I like to see John run with his kite."
	; "He can run as fast as the other boys, but he can not jump far."
	; "He does not like to look at books and pictures, but he can play on a drum."
; best schemas are:

; story 20:
	; "Ada has a fan in her hand."
	; "These fans are May's."
	; "Ada has May's white fan."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 21:
	; "The boy has a big dog."
	; "You may see the dog play ball."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 22:
	; "I have a doll."
	; "I can see my doll."
	; "My doll has a hat."
	; "The girl has a doll and a hat."
; best schemas are:
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V

; story 23:
	; "A dog runs."
	; "The dog is black."
	; "It is a large, black dog."
	; "Is it Tom's black dog?"
	; "It is my black dog."
	; "My large, black dog runs."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.405 0)
("A dog runs." "The dog is black." "It is a large, black dog."
 "Is it Tom's black dog?" "It is my black dog." "My large, black dog runs.")
(EPI-SCHEMA ((DOG211.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.179.V))
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
		(!W6 (E210.SK (AT-ABOUT NOW48)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; TRAVEL.V
; GIVE.V
; RECEIVING_VERB.?

; story 25:
	; "Baby sits on the soft mat."
	; "You may play near her a while."
; best schemas are:
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
(setf matches (append matches '(( (2.6003125 2)
("Baby sits on the soft mat." "You may play near her a while.")
(EPI-SCHEMA (((K BABY.N)
              ((ADV-A (ON.P MAT247.SK)) ((ADV-A (IN.P MAT247.SK)) SIT.211.V)))
             ** E248.SK)
	(:ROLES
		(!R1 ((K BABY.N) AGENT.N))
		(!R2 (MAT247.SK INANIMATE_OBJECT.N))
		(!R3 (MAT247.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (MAT247.SK MAT.N))
		(!R6 (MAT247.SK ARTIFACT.N))
		(!R7 (MAT247.SK SOFT.A))
	)
	(:GOALS
		(?G1 ((K BABY.N) (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 ((K BABY.N) (AT.P ?L)))
		(?I2 (MAT247.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E248.SK (AT-ABOUT NOW56)))
	)
	(:CERTAINTIES
		(!C1 (!R6 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R3 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R5 CERTAIN-TO-DEGREE (/ 1 2)))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 27:
	; "The puppies are full of fun."
	; "I like to see them play with each other."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 28:
	; "This cat was in a nest."
	; "A hen ran at her."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.405 0)
("This cat was in a nest." "A hen ran at her.")
(EPI-SCHEMA ((HEN274.SK
              ((ADV-A (AT.P CAT271.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.229.V)))
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
		(!W6 (E278.SK (BEFORE NOW63)))
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
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; PUT_IN_CONTAINER.V
; TRAVEL.V
; GIVE.V
(setf matches (append matches '(( (2.405 0)
("The cat is on the box." "She saw a big rat and ran to catch it.")
(EPI-SCHEMA ((CAT281.SK
              ((ADV-A (FOR.P (KA (CATCH.V RAT288.SK))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.254.V)))
              ?L2)
             ** E290.SK)
	(:ROLES
		(!R1 (CAT281.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (CAT281.SK CAT.N))
		(!R6 (RAT288.SK RAT.N))
		(!R7 (RAT288.SK BIG.A))
	)
	(:GOALS
		(?G1 (CAT281.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT281.SK (AT.P ?L1)))
		(?I2 (NOT (CAT281.SK (AT.P ?L2))))
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
		(!W6 (E294.SK (CONSEC E290.SK)))
		(!W7 (E290.SK (BEFORE NOW65)))
		(!W8 (E294.SK (BEFORE NOW65)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 30:
	; "I love little Lucy."
	; "But now she has gone far away to her home."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 31:
	; "Here is Jean with her hoop."
	; "Jean can roll the hoop very fast."
	; "The hoop has bells on it."
	; "The bells tinkle, tinkle, tinkle."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 32:
	; "I see a nest, Rosy!"
	; "Can you see it?"
	; "It is in this big green tree."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V

; story 33:
	; "Did Cora go to the hill?"
	; "We did not see her there."
	; "When we saw Cora this morning, she was dressing her doll."
	; "She said she was going to see Elsie."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
(setf matches (append matches '(( (1.53125 1)
("Did Cora go to the hill?" "We did not see her there."
 "When we saw Cora this morning, she was dressing her doll."
 "She said she was going to see Elsie.")
(EPI-SCHEMA ((WE347.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.266.V
              (KA ((THERE.ADV SEE.V) CORA.NAME)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) CORA.NAME)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (WE347.SK AGENT.N))
	)
	(:GOALS
		(?G1 (WE347.SK (WANT.V (THAT (NOT (WE347.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (WE347.SK (DO.V (KA ((THERE.ADV SEE.V) CORA.NAME))))) CAUSE-OF
    (KE (WE347.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E340.SK (WE347.SK (THERE.ADV DO.V) (KA ((THERE.ADV SEE.V) CORA.NAME))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E340.SK))
		(!W2 (E340.SK (BEFORE NOW76)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 34:
	; "The bird can fly."
	; "The baby can not have the bird."
	; "She can not fly."
	; "She may play with my doll."
	; "She may have my big hat."
; best schemas are:
; PLAY.V
; TRAVEL.V
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V

; story 35:
	; "The cats are on the steps."
	; "One cat is sitting on the steps."
	; "One cat is lying on the steps."
	; "Is the black cat lying on the mat?"
	; "No; it is the white one."
	; "The black one is sitting near the white one."
; best schemas are:
; SIT.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?

; story 36:
	; "Kate has left her doll in its little bed, and has gone to play with Mary and James."
	; "They are all in the shade, now, by the brook."
	; "James digs in the soft sand with his spade, and Mary picks up little stones and puts them in her lap."
	; "James and Mary are glad to see Kate."
	; "She will help them pick up stones and dig, by the little brook."
; best schemas are:
; PLAY.V
; TRAVEL.V
; MAKE.V
(setf matches (append matches '(( (2.5 0)
("Kate has left her doll in its little bed, and has gone to play with Mary and James."
 "They are all in the shade, now, by the brook."
 "James digs in the soft sand with his spade, and Mary picks up little stones and puts them in her lap."
 "James and Mary are glad to see Kate."
 "She will help them pick up stones and dig, by the little brook.")
(EPI-SCHEMA ((KATE.NAME
              ((ADV-A
                (FOR.P
                 (KA ((ADV-A (WITH.P (SET-OF MARY.NAME JAMES.NAME))) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.340.V)))
              ?L2)
             ** E400.SK)
	(:ROLES
		(!R1 (KATE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (MARY.NAME LAP.N))
		(!R6 (MARY.NAME (PERTAIN-TO MARY.NAME)))
		(!R7 (E405.SK (IMPINGES-ON E400.SK)))
		(!R8 (OBJECT408.SK (PERTAIN-TO KATE.NAME)))
		(!R9 (DOLL409.SK DOLL.N))
		(!R10 (DOLL409.SK (PERTAIN-TO KATE.NAME)))
		(!R11 (SPADE430.SK SPADE.N))
		(!R12 (SPADE430.SK (PERTAIN-TO JAMES.NAME)))
		(!R13 (E406.SK (IMPINGES-ON E401.SK)))
	)
	(:GOALS
		(?G1 (KATE.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (KATE.NAME (AT.P ?L1)))
		(?I2 (NOT (KATE.NAME (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (KATE.NAME (AT.P ?L1))))
		(?P2 (KATE.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E400.SK))
		(!W2 (?I2 BEFORE E400.SK))
		(!W3 (?P1 AFTER E400.SK))
		(!W4 (?P2 AFTER E400.SK))
		(!W5 (?G1 CAUSE-OF E400.SK))
		(!W6 (E400.SK (AT-ABOUT NOW90)))
		(!W7 (E401.SK (AT-ABOUT NOW90)))
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
; best schemas are:
; EAT.V
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (3.405 2)
("My papa gave me two pretty rabbits." "My rabbits eat from my hand."
 "I shall keep them in a little house." "I love my dear papa.")
(EPI-SCHEMA ((RABBITS440.SK ((ADV-A (FROM.P HAND443.SK)) EAT.342.V) ?F) **
             E439.SK)
	(:ROLES
		(!R1 (RABBITS440.SK AGENT.N))
		(!R2 (?F FOOD.N))
		(!R3 (HAND443.SK HAND.N))
		(!R4 (RABBITS440.SK (PLUR RABBIT.N)))
		(!R5 (HAND443.SK (PERTAIN-TO ME454.SK)))
		(!R6 (RABBITS440.SK (PERTAIN-TO ME454.SK)))
		(!R7 (ME454.SK AGENT.N))
		(!R8 (E439.SK (RIGHT-AFTER U95)))
		(!R9 (PAPA437.SK PAPA.N))
		(!R10 (PAPA437.SK (PERTAIN-TO ME454.SK)))
		(!R11 (PAPA437.SK (DEAR.ADV PAPA.N)))
	)
	(:GOALS
		(?G1 (RABBITS440.SK (WANT.V (THAT (NOT (RABBITS440.SK HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 (RABBITS440.SK HAVE.V ?F))
		(?I2 (RABBITS440.SK HUNGRY.A))
	)
	(:POSTCONDS
		(?P1 (NOT (RABBITS440.SK (HAVE.V ?F))))
		(?P2 (NOT (RABBITS440.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E439.SK))
		(!W2 (?I1 BEFORE E439.SK))
		(!W3 (E439.SK CAUSE-OF ?P1))
		(!W4 (E439.SK (SAME-TIME NOW96)))
		(!W5 (E444.SK (AT-ABOUT NOW96)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.405 2)
("My papa gave me two pretty rabbits." "My rabbits eat from my hand."
 "I shall keep them in a little house." "I love my dear papa.")
(EPI-SCHEMA ((ME454.SK FEED.343.V RABBITS440.SK ?F) ** ?E)
	(:ROLES
		(!R1 (RABBITS440.SK AGENT.N))
		(!R2 (?F FOOD.N))
		(!R3 (NOT (ME454.SK = RABBITS440.SK)))
		(!R4 (NOT (RABBITS440.SK = ?F)))
		(!R5 (NOT (ME454.SK = ?F)))
		(!R6 (E439.SK (RIGHT-AFTER U95)))
		(!R7 (ME454.SK AGENT.N))
		(!R8 (PAPA437.SK PAPA.N))
		(!R9 (PAPA437.SK (PERTAIN-TO ME454.SK)))
		(!R10 (PAPA437.SK (DEAR.ADV PAPA.N)))
		(!R11 (HAND443.SK (PERTAIN-TO ME454.SK)))
		(!R12 (HAND443.SK HAND.N))
		(!R13 (RABBITS440.SK (PLUR RABBIT.N)))
		(!R14 (RABBITS440.SK (PERTAIN-TO ME454.SK)))
	)
	(:GOALS
		(?G1 (ME454.SK (WANT.V (THAT (NOT (RABBITS440.SK HUNGRY.A))))))
		(?G2
   (ME454.SK
    (WANT.V (THAT (RABBITS440.SK ((ADV-A (FROM.P HAND443.SK)) EAT.V) ?F)))))
	)
	(:PRECONDS
		(?I1 (ME454.SK HAVE.V ?F))
		(?I2 (RABBITS440.SK HUNGRY.A))
	)
	(:STEPS
		(E439.SK (RABBITS440.SK ((ADV-A (FROM.P HAND443.SK)) EAT.V) ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (ME454.SK (HAVE.V ?F))))
		(?P2 (NOT (RABBITS440.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E439.SK AFTER ?E))
		(!W2 (E439.SK (SAME-TIME NOW96)))
		(!W3 (E444.SK (AT-ABOUT NOW96)))
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
(setf matches (append matches '(( (1.405 2)
("My papa gave me two pretty rabbits." "My rabbits eat from my hand."
 "I shall keep them in a little house." "I love my dear papa.")
(EPI-SCHEMA ((ME454.SK FEED.351.V RABBITS440.SK ?F) ** ?E)
	(:ROLES
		(!R1 (RABBITS440.SK AGENT.N))
		(!R2 (?F FOOD.N))
		(!R3 (NOT (ME454.SK = RABBITS440.SK)))
		(!R4 (NOT (RABBITS440.SK = ?F)))
		(!R5 (NOT (ME454.SK = ?F)))
		(!R6 (E439.SK (RIGHT-AFTER U95)))
		(!R7 (ME454.SK AGENT.N))
		(!R8 (RABBITS440.SK (PLUR RABBIT.N)))
		(!R9 (RABBITS440.SK (PERTAIN-TO ME454.SK)))
		(!R10 (HAND443.SK HAND.N))
		(!R11 (HAND443.SK (PERTAIN-TO ME454.SK)))
		(!R12 (PAPA437.SK PAPA.N))
		(!R13 (PAPA437.SK (DEAR.ADV PAPA.N)))
		(!R14 (PAPA437.SK (PERTAIN-TO ME454.SK)))
	)
	(:GOALS
		(?G1 (ME454.SK (WANT.V (THAT (NOT (RABBITS440.SK HUNGRY.A))))))
		(?G2
   (ME454.SK
    (WANT.V (THAT (RABBITS440.SK ((ADV-A (FROM.P HAND443.SK)) EAT.V) ?F)))))
	)
	(:PRECONDS
		(?I1 (ME454.SK HAVE.V ?F))
		(?I2 (RABBITS440.SK HUNGRY.A))
	)
	(:STEPS
		(E444.SK (RABBITS440.SK ((ADV-A (FROM.P HAND443.SK)) EAT.V) ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (ME454.SK (HAVE.V ?F))))
		(?P2 (NOT (RABBITS440.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E444.SK AFTER ?E))
		(!W2 (E444.SK (AT-ABOUT NOW96)))
		(!W3 (E439.SK (SAME-TIME NOW96)))
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

; story 38:
	; "I have three good apples."
	; "One is red, and two are yellow."
	; "I will give you the red one."
	; "I see a big red apple in the tree."
; best schemas are:
; GIVE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; FEED.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (5.5 5)
("I have three good apples." "One is red, and two are yellow."
 "I will give you the red one." "I see a big red apple in the tree.")
(EPI-SCHEMA ((ME473.SK FEED.457.V YOU.PRO ONE463.SK) ** E466.SK)
	(:ROLES
		(!R1 (ONE463.SK FOOD.N))
		(!R2 (NOT (ME473.SK = YOU.PRO)))
		(!R3 (NOT (YOU.PRO = ONE463.SK)))
		(!R4 (NOT (ME473.SK = ONE463.SK)))
		(!R5 (ONE463.SK ONE.N))
		(!R6 (ONE463.SK RED.A))
		(!R7 (ME473.SK AGENT.N))
		(!R8 (YOU.PRO AGENT.N))
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
		(?E1 (YOU.PRO EAT.V ONE463.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (ME473.SK (HAVE.V ONE463.SK))))
		(?P2 (NOT (YOU.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E466.SK))
		(!W2 (E466.SK (AFTER E460.SK)))
		(!W3 (E460.SK (AT-ABOUT NOW101)))
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

; story 39:
	; "I have three good apples."
	; "One is red, and two are yellow."
	; "I will give you the red one."
	; "I see a big red apple in the tree."
; best schemas are:
; GIVE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; FEED.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (5.5 5)
("I have three good apples." "One is red, and two are yellow."
 "I will give you the red one." "I see a big red apple in the tree.")
(EPI-SCHEMA ((ME492.SK FEED.457.V YOU.PRO ONE484.SK) ** E485.SK)
	(:ROLES
		(!R1 (ONE484.SK FOOD.N))
		(!R2 (NOT (ME492.SK = YOU.PRO)))
		(!R3 (NOT (YOU.PRO = ONE484.SK)))
		(!R4 (NOT (ME492.SK = ONE484.SK)))
		(!R5 (ONE484.SK ONE.N))
		(!R6 (ONE484.SK RED.A))
		(!R7 (ME492.SK AGENT.N))
		(!R8 (YOU.PRO AGENT.N))
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
		(?E1 (YOU.PRO EAT.V ONE484.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (ME492.SK (HAVE.V ONE484.SK))))
		(?P2 (NOT (YOU.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E485.SK))
		(!W2 (E485.SK (AFTER E481.SK)))
		(!W3 (E481.SK (AT-ABOUT NOW105)))
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

; story 40:
	; "Come with me, and see the boys."
	; "One little boy has a drum."
	; "Two boys have big hats."
	; "One boy has a ball."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 41:
	; "A top spins."
	; "The tops spin."
	; "Tom spins the tops."
	; "He spins the tops on a box."
	; "Tom spins my large top."
	; "He spins my small top."
	; "Spin, tops, spin."
; best schemas are:
; PUT_IN_CONTAINER.V
; RECEIVING_VERB.?
; TRAVEL.V
; SIT.V
; SEARCH.V

; story 42:
	; "Here are two dogs."
	; "One dog is black."
	; "One dog is white."
	; "A dog runs."
	; "The dogs run."
	; "Run, dogs, run."
	; "One dog and one dog are two dogs."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.405 0)
("Here are two dogs." "One dog is black." "One dog is white." "A dog runs."
 "The dogs run." "Run, dogs, run." "One dog and one dog are two dogs.")
(EPI-SCHEMA ((DOG542.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.179.V))
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
		(!W6 (E541.SK (AT-ABOUT NOW121)))
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
; RECEIVING_VERB.?
; GIVE.V
; EAT.V
; FEED.V
; PLAY.V

; story 44:
	; "The girl is good to the little baby."
	; "The baby may have my big doll."
	; "She can not catch the bird."
	; "She may come with me and see the bird fly."
; best schemas are:
; PLAY.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 45:
	; "It is raining."
	; "It rains on the cows and the calf."
	; "It rains on the man and the horses."
	; "One of the horses is drinking from the brook."
	; "The rain makes the grass and the flowers grow."
; best schemas are:
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?

; story 46:
	; "The little boy has a red wagon."
	; "The boy will let little May ride in it."
	; "Come, May, come and see my wagon."
	; "You may get in it, and have a ride."
	; "I will take you with me to the fields."
	; "You may have a good ride."
; best schemas are:
; RECEIVING_VERB.?
; SEARCH.V
; FIND.V
; GIVE.V
; EAT.V

; story 47:
	; "Here is John with his ball."
	; "He and Tyke are playing ball."
	; "John likes to play ball with Tyke."
	; "John can catch the ball."
	; "Tyke can catch it, too."
	; "John rolls the ball to Tyke."
	; "Tyke takes the ball to John."
; best schemas are:
; PLAY.V
; RECEIVING_VERB.?
; TRAVEL.V
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
(setf matches (append matches '(( (4.046113 2)
("Here is John with his ball." "He and Tyke are playing ball."
 "John likes to play ball with Tyke." "John can catch the ball."
 "Tyke can catch it, too." "John rolls the ball to Tyke."
 "Tyke takes the ball to John.")
(EPI-SCHEMA (((K TYKE.N) TAKE.656.V BALL651.SK (AT.P-ARG ?L)) ** E672.SK)
	(:ROLES
		(!R1 ((K TYKE.N) AGENT.N))
		(!R2 (BALL651.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT ((K TYKE.N) = BALL651.SK)))
		(!R5 (BALL651.SK (TO.P (K TYKE.N))))
		(!R6 (BALL651.SK BALL.N))
		(!R7 (JOHN.NAME (WITH.P BALL651.SK)))
		(!R8 (BALL651.SK (PERTAIN-TO JOHN.NAME)))
		(!R9 (BALL651.SK (TO.P JOHN.NAME)))
	)
	(:GOALS
		(?G1 ((K TYKE.N) (WANT.V (THAT ((K TYKE.N) (HAVE.V BALL651.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT ((K TYKE.N) HAVE.V BALL651.SK)))
		(?I2 ((K TYKE.N) (AT.P ?L)))
		(?I3 (BALL651.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 ((K TYKE.N) HAVE.V BALL651.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E672.SK))
		(!W2 (?I1 PRECOND-OF E672.SK))
		(!W3 (?I2 PRECOND-OF E672.SK))
		(!W4 (?I3 PRECOND-OF E672.SK))
		(!W5 (?P1 POSTCOND-OF E672.SK))
		(!W6 (E672.SK (AT-ABOUT NOW151)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.5 3)
("Here is John with his ball." "He and Tyke are playing ball."
 "John likes to play ball with Tyke." "John can catch the ball."
 "Tyke can catch it, too." "John rolls the ball to Tyke."
 "Tyke takes the ball to John.")
(EPI-SCHEMA ((JOHN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P BALL651.SK)) ROLL.657.V))
              BALL651.SK)
             ** E662.SK)
	(:ROLES
		(!R1 (JOHN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (BALL651.SK LOCATION.N))
		(!R4 (NOT (?L1 = BALL651.SK)))
		(!R5 (JOHN.NAME (WITH.P BALL651.SK)))
		(!R6 (BALL651.SK (PERTAIN-TO JOHN.NAME)))
		(!R7 (BALL651.SK (TO.P (K TYKE.N))))
		(!R8 (BALL651.SK (TO.P JOHN.NAME)))
		(!R9 (BALL651.SK BALL.N))
	)
	(:GOALS
		(?G1 (JOHN.NAME (WANT.V (KA ((ADV-A (AT.P BALL651.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JOHN.NAME (AT.P ?L1)))
		(?I2 (NOT (JOHN.NAME (AT.P BALL651.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT (JOHN.NAME (AT.P ?L1))))
		(?P2 (JOHN.NAME (AT.P BALL651.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E662.SK))
		(!W2 (?I2 BEFORE E662.SK))
		(!W3 (?P1 AFTER E662.SK))
		(!W4 (?P2 AFTER E662.SK))
		(!W5 (?G1 CAUSE-OF E662.SK))
		(!W6 (E662.SK (AT-ABOUT NOW150)))
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
; best schemas are:
; GIVE.V
; PLAY.V
; FEED.V
; MAKE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (6.31 4)
("The old cat can catch a mouse." "She has a mouse in her mouth."
 "What will she do with it?" "She will give it to her little kittens."
 "They will play with the mouse."
 "They are not afraid of it; but the mouse is afraid of the kittens.")
(EPI-SCHEMA ((CAT677.SK ((ADV-A (TO.P OBJECT687.SK)) FEED.660.V) MOUSE675.SK
              MOUSE682.SK)
             ** E690.SK)
	(:ROLES
		(!R1 (CAT677.SK AGENT.N))
		(!R2 (MOUSE675.SK AGENT.N))
		(!R3 (MOUSE682.SK FOOD.N))
		(!R4 (NOT (CAT677.SK = MOUSE675.SK)))
		(!R5 (NOT (MOUSE675.SK = MOUSE682.SK)))
		(!R6 (NOT (CAT677.SK = MOUSE682.SK)))
		(!R7 (MOUSE682.SK MOUSE.N))
		(!R8 (CAT677.SK CAT.N))
		(!R9 (CAT677.SK OLD.A))
		(!R10 (MOUSE675.SK MOUSE.N))
		(!R11 (OBJECT687.SK (PERTAIN-TO CAT677.SK)))
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
		(?E1 (MOUSE675.SK EAT.V MOUSE682.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (CAT677.SK (HAVE.V MOUSE682.SK))))
		(?P2 (NOT (MOUSE675.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E690.SK))
		(!W2 (E683.SK (AT-ABOUT NOW153)))
		(!W3 (E690.SK (AFTER E686.SK)))
		(!W4 (E686.SK (AT-ABOUT NOW155)))
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

; story 49:
	; "Ann gave Ned three cakes of paint."
	; "She told him to paint just what you see here."
	; "She gave him red and yellow."
	; "Here is a new color: It is purple."
	; "Red and blue make purple."
; best schemas are:
; GIVE.V
; FEED.V

; story 50:
	; "A little bird can not eat nuts."
	; "He likes crumbs."
	; "Squirrels have sharp teeth."
	; "It is easy for them to eat nuts."
; best schemas are:
; EAT.V
; FEED.V
; GIVE.V
; RECEIVING_VERB.?
; PLAY.V

; story 51:
	; "Little Henry went to school this morning."
	; "All the children were glad to see him as he came down the street."
	; "He is a funny little boy, and I am sure you would like him."
	; "He says he will grow very fast and soon be a man."
	; "He likes to go to school."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 52:
	; "Frank has gone to the field with his kite."
	; "He likes to play with it."
	; "It is the kite his father gave him."
	; "He will run and the kite will fly."
	; "He can run very fast, and the kite can fly very high."
	; "John does not like to run with a kite."
	; "He likes to play on his drum."
	; "He will play on his drum, and Frank will run with his kite."
; best schemas are:
; TRAVEL.V
; PLAY.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
(setf matches (append matches '(( (3.7302296 2)
("Frank has gone to the field with his kite." "He likes to play with it."
 "It is the kite his father gave him." "He will run and the kite will fly."
 "He can run very fast, and the kite can fly very high."
 "John does not like to run with a kite." "He likes to play on his drum."
 "He will play on his drum, and Frank will run with his kite.")
(EPI-SCHEMA ((FRANK.NAME
              ((ADV-A (WITH.P KITE765.SK))
               ((ADV-A (TO.P FIELD763.SK)) ((ADV-A (FROM.P ?L1)) GO.680.V)))
              FIELD763.SK)
             ** E762.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (FIELD763.SK LOCATION.N))
		(!R4 (NOT (?L1 = FIELD763.SK)))
		(!R5 (KITE765.SK (PERTAIN-TO FRANK.NAME)))
		(!R6 (KITE765.SK KITE.N))
		(!R7 (FIELD763.SK FIELD.N))
		(!R8 (E762.SK (IMPINGES-ON E757.SK)))
		(!R9 (KITE792.SK (PERTAIN-TO FRANK.NAME)))
		(!R10 (KITE792.SK KITE.N))
	)
	(:GOALS
		(?G1 (FRANK.NAME (WANT.V (KA ((ADV-A (AT.P FIELD763.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRANK.NAME (AT.P ?L1)))
		(?I2 (NOT (FRANK.NAME (AT.P FIELD763.SK))))
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
		(!W6 (E757.SK (AT-ABOUT NOW172)))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 54:
	; "I can see a swan."
	; "A swan can swim well."
	; "A swan can not walk well, but she can swim very fast."
	; "The swan has a nest by the side of the pond."
	; "She lays eggs in her nest."
	; "She is a white swan."
; best schemas are:
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V

; story 55:
	; "We live on the round earth."
	; "There is land and water on all sides of it."
	; "Men have sailed all around it in ships."
	; "All sails are set."
	; "Men can sail it over the wide, wide sea."
; best schemas are:
; TRAVEL.V
; MAKE.V
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V

; story 56:
	; "I see a fox on a box, and a fox in front of a box."
	; "Frank has two foxes and two boxes."
	; "He gave each fox a box in which to sleep."
	; "He put hay in the boxes."
	; "The boxes are good houses for them."
	; "Frank feeds his foxes and gives them water."
; best schemas are:
; FEED.V
; GIVE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; PUT_IN_CONTAINER.V
(setf matches (append matches '(( (4.4049997 2)
("I see a fox on a box, and a fox in front of a box."
 "Frank has two foxes and two boxes."
 "He gave each fox a box in which to sleep." "He put hay in the boxes."
 "The boxes are good houses for them."
 "Frank feeds his foxes and gives them water.")
(EPI-SCHEMA ((FRANK.NAME FEED.719.V FOX906.SK ?F) ** E908.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (FOX906.SK AGENT.N))
		(!R3 (?F FOOD.N))
		(!R4 (NOT (FRANK.NAME = FOX906.SK)))
		(!R5 (NOT (FOX906.SK = ?F)))
		(!R6 (NOT (FRANK.NAME = ?F)))
		(!R7 (FOX906.SK (PERTAIN-TO FRANK.NAME)))
		(!R8 (FOX906.SK (PLUR FOX.N)))
	)
	(:GOALS
		(?G1 (FRANK.NAME (WANT.V (THAT (NOT (FOX906.SK HUNGRY.A))))))
		(?G2 (FRANK.NAME (WANT.V (THAT (FOX906.SK EAT.V ?F)))))
	)
	(:PRECONDS
		(?I1 (FRANK.NAME HAVE.V ?F))
		(?I2 (FOX906.SK HUNGRY.A))
	)
	(:STEPS
		(?E1 (FOX906.SK EAT.V ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (FRANK.NAME (HAVE.V ?F))))
		(?P2 (NOT (FOX906.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E908.SK))
		(!W2 (E908.SK (CONSEC E907.SK)))
		(!W3 (E907.SK (AT-ABOUT NOW202)))
		(!W4 (E908.SK (AT-ABOUT NOW202)))
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
(setf matches (append matches '(( (2.905 0)
("I see a fox on a box, and a fox in front of a box."
 "Frank has two foxes and two boxes."
 "He gave each fox a box in which to sleep." "He put hay in the boxes."
 "The boxes are good houses for them."
 "Frank feeds his foxes and gives them water.")
(EPI-SCHEMA ((FRANK.NAME ((ADV-A (TO.P FOX906.SK)) FEED.720.V) FOX906.SK ?O) **
             E908.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (FOX906.SK AGENT.N))
		(!R4 (FOX906.SK (PERTAIN-TO FRANK.NAME)))
		(!R5 (FOX906.SK (PLUR FOX.N)))
	)
	(:GOALS
		(?G1 (FRANK.NAME (WANT.V (THAT (FOX906.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (FRANK.NAME HAVE.V ?O))
		(?I2 (NOT (FOX906.SK HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (FRANK.NAME HAVE.V ?O)))
		(?P2 (FOX906.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E908.SK (CONSEC E907.SK)))
		(!W2 (E907.SK (AT-ABOUT NOW202)))
		(!W3 (E908.SK (AT-ABOUT NOW202)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 57:
	; "The girls have come to play with the baby."
	; "Two girls have little dolls."
	; "One girl has a red dress."
	; "The baby is glad to see the girls."
	; "The girl with the red dress is May."
	; "May is glad to see the good baby."
	; "She will take the baby to see the bird."
; best schemas are:
; PLAY.V
; MAKE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 58:
	; "The girls have come to play with the baby."
	; "Two girls have little dolls."
	; "One girl has a red dress."
	; "The baby is glad to see the girls."
	; "The girl with the red dress is May."
	; "May is glad to see the good baby."
	; "She will take the baby to see the bird."
; best schemas are:
; PLAY.V
; MAKE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 59:
	; "I have a pet hen."
	; "She has a nest in a box."
	; "Two eggs are in the nest."
	; "One day when she went away to get her dinner, a big rat came to get an egg; but he did not get the egg."
	; "My hen saw him and did not let him get the egg."
	; "A rat will eat an egg if he can get it."
; best schemas are:
; RECEIVING_VERB.?
; GIVE.V
; EAT.V
; FEED.V
; PLAY.V

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
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V

; story 61:
	; "Frank and little May are in the field with the wagon."
	; "They have come to find flowers."
	; "May has a red flower."
	; "Frank has three yellow flowers."
	; "He will let May have them."
	; "She will take them to the wagon She is glad to get the pretty flowers."
; best schemas are:
; SEARCH.V
; FIND.V
; RECEIVING_VERB.?
; TRAVEL.V
; PUT_IN_CONTAINER.V
(setf matches (append matches '(( (3.7302296 1)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N))))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P FIELD1058.SK)) COME.917.V)))
              ?L2)
             ** E1060.SK)
	(:ROLES
		(!R1 (MAY.NAME AGENT.N))
		(!R2 (FIELD1058.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (FIELD1058.SK = ?L2)))
		(!R5 (E1060.SK (IMPINGES-ON E276)))
		(!R6 (FIELD1058.SK FIELD.N))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1058.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?L2))))
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
		(!W6 (OBJECT1061.SK (AT-ABOUT NOW236)))
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
; best schemas are:
; GIVE.V
; PLAY.V
; FEED.V
; MAKE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (4.6411133 1)
("James is kind to Fanny." "She is his little sister." "He has a nice wagon."
 "He plays horse, and gives her a ride.")
(EPI-SCHEMA ((JAMES.NAME ((ADV-A (TO.P JAMES.NAME)) GIVE.919.V) JAMES.NAME
              WAGON1082.SK)
             ** E1087.SK)
	(:ROLES
		(!R1 (WAGON1082.SK INANIMATE_OBJECT.N))
		(!R2 (JAMES.NAME AGENT.N))
		(!R3 (WAGON1082.SK WAGON.N))
		(!R4 (WAGON1082.SK NICE.A))
		(!R5 (RIDE1086.SK RIDE.N))
		(!R6 (OBJECT1077.SK (PERTAIN-TO JAMES.NAME)))
	)
	(:GOALS
		(?G1 (JAMES.NAME (WANT.V (THAT (JAMES.NAME (HAVE.V WAGON1082.SK))))))
	)
	(:PRECONDS
		(E1083.SK (JAMES.NAME HAVE.V WAGON1082.SK))
		(?I2 (NOT (JAMES.NAME HAVE.V WAGON1082.SK)))
	)
	(:POSTCONDS
		(?P1 (NOT (JAMES.NAME HAVE.V WAGON1082.SK)))
		(?P2 (JAMES.NAME HAVE.V WAGON1082.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1083.SK (AT-ABOUT NOW242)))
		(!W2 (E1088.SK (CONSEC E1087.SK)))
		(!W3 (E1087.SK (AT-ABOUT NOW243)))
		(!W4 (E1088.SK (AT-ABOUT NOW243)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.6411133 4)
("James is kind to Fanny." "She is his little sister." "He has a nice wagon."
 "He plays horse, and gives her a ride.")
(EPI-SCHEMA ((JAMES.NAME ((ADV-A (WITH.P WAGON1082.SK)) PLAY.920.V)
              (K HORSE.N))
             ** E1088.SK)
	(:ROLES
		(!R1 (JAMES.NAME AGENT.N))
		(!R2 (WAGON1082.SK TOY.N))
		(!R3 (WAGON1082.SK INANIMATE_OBJECT.N))
		(!R4 ((K HORSE.N) GAME.N))
		(!R5 (WAGON1082.SK WAGON.N))
		(!R6 (WAGON1082.SK NICE.A))
		(!R7 (OBJECT1077.SK (PERTAIN-TO JAMES.NAME)))
	)
	(:GOALS
		(?G1 (JAMES.NAME (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(E1083.SK (JAMES.NAME HAVE.V WAGON1082.SK))
	)
	(:POSTCONDS
		(?P1 (JAMES.NAME EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E1083.SK (AT-ABOUT NOW242)))
		(!W3 (E1088.SK (CONSEC E1087.SK)))
		(!W4 (E1087.SK (AT-ABOUT NOW243)))
		(!W5 (E1088.SK (AT-ABOUT NOW243)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.6411133 3)
("James is kind to Fanny." "She is his little sister." "He has a nice wagon."
 "He plays horse, and gives her a ride.")
(EPI-SCHEMA ((JAMES.NAME PLAY.922.V WAGON1082.SK) ** E1088.SK)
	(:ROLES
		(!R1 (JAMES.NAME AGENT.N))
		(!R2 (WAGON1082.SK INANIMATE_OBJECT.N))
		(!R3 (WAGON1082.SK WAGON.N))
		(!R4 (WAGON1082.SK NICE.A))
		(!R5 (OBJECT1077.SK (PERTAIN-TO JAMES.NAME)))
	)
	(:GOALS
		(?G1 (JAMES.NAME (WANT.V (THAT (WAGON1082.SK EXIST.V)))))
		(?G2 (JAMES.NAME (WANT.V (KA (HAVE.V WAGON1082.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (WAGON1082.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (WAGON1082.SK EXIST.V))
		(E1083.SK (JAMES.NAME (HAVE.V WAGON1082.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1083.SK (AT-ABOUT NOW242)))
		(!W2 (E1088.SK (CONSEC E1087.SK)))
		(!W3 (E1087.SK (AT-ABOUT NOW243)))
		(!W4 (E1088.SK (AT-ABOUT NOW243)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; found chains:
; 	chain 1:
;		((JAMES.NAME PLAY.922.V WAGON1082.SK) ** E1088.SK)
;		((JAMES.NAME ((ADV-A (TO.P JAMES.NAME)) GIVE.919.V) JAMES.NAME WAGON1082.SK)
    ; ** E1087.SK)
;learned chain schema:
(setf chain-matches (append chain-matches (list '(EPI-SCHEMA ((?X_A
                                                               PLAY_GIVE_NIL.925.PR
                                                               ?X_A ?X_B)
                                                              ** ?E)
	(:ROLES
		(!R1 (?X_B INANIMATE_OBJECT.N))
		(!R2 (?X_B WAGON.N))
		(!R3 (?X_B NICE.A))
		(!R4 (?X_A AGENT.N))
	)
	(:PRECONDS
		(?I1 (NOT (?X_B EXIST.V)))
	)
	(:STEPS
		(?E1 (?X_A PLAY.922.V ?X_B))
		(?E2 (?X_A ((ADV-A (TO.P ?X_A)) GIVE.919.V) ?X_A ?X_B))
	)
	(:POSTCONDS
		(?P1 (NOT (?X_A HAVE.V ?X_B)))
		(?P2 (?X_A HAVE.V ?X_B))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE ?E2))
	)
)
)))
; story 63:
	; "Frank has a pretty boat."
	; "It is white, with a black line near the water."
	; "He keeps it in the pond, near his home."
	; "He always takes good care of it."
	; "Frank has been at work in the garden, and will now row a while."
; best schemas are:
; RECEIVING_VERB.?
; SEARCH.V
; FIND.V
; GIVE.V
; EAT.V
(setf matches (append matches '(( (5.2302294 5)
("Frank has a pretty boat." "It is white, with a black line near the water."
 "He keeps it in the pond, near his home." "He always takes good care of it."
 "Frank has been at work in the garden, and will now row a while.")
(EPI-SCHEMA ((FRANK.NAME TAKE.928.V OBJECT1110.SK (AT.P-ARG GARDEN1114.SK)) **
             E1111.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (OBJECT1110.SK INANIMATE_OBJECT.N))
		(!R3 (GARDEN1114.SK LOCATION.N))
		(!R4 (NOT (FRANK.NAME = OBJECT1110.SK)))
		(!R5
   (OBJECT1110.SK
    (= (K (L #:G1468252 (AND (#:G1468252 GOOD.A) (#:G1468252 CARE.N)))))))
		(!R6 (WATER1099.SK WATER.N))
		(!R7 (OBJECT1110.SK (OF.P WATER1099.SK)))
		(!R8 (BOAT1095.SK PRETTY.A))
		(!R9 (BOAT1095.SK BOAT.N))
		(!R10 (GARDEN1114.SK GARDEN.N))
	)
	(:GOALS
		(?G1 (FRANK.NAME (WANT.V (THAT (FRANK.NAME (HAVE.V OBJECT1110.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (FRANK.NAME HAVE.V OBJECT1110.SK)))
		(?I2 (FRANK.NAME (AT.P GARDEN1114.SK)))
		(?I3 (OBJECT1110.SK (AT.P GARDEN1114.SK)))
	)
	(:POSTCONDS
		(E1096.SK (FRANK.NAME HAVE.V OBJECT1110.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1111.SK))
		(!W2 (?I1 PRECOND-OF E1111.SK))
		(!W3 (?I2 PRECOND-OF E1111.SK))
		(!W4 (?I3 PRECOND-OF E1111.SK))
		(!W5 (E1096.SK POSTCOND-OF E1111.SK))
		(!W6 (E1111.SK (AT-ABOUT NOW247)))
		(!W7 (E1096.SK (AT-ABOUT NOW244)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 64:
	; "My mother gave me a new book."
	; "I took it to school one morning, to let the girls see the pictures."
	; "Soon after this I found my pet kitten and took her home with me."
	; "I like to play with my pet kitten."
	; "I will do as mother says."
	; "I will take good care of the kitten."
; best schemas are:
; RECEIVING_VERB.?
; GIVE.V
; PLAY.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
(setf matches (append matches '(( (4.0 3)
("My mother gave me a new book."
 "I took it to school one morning, to let the girls see the pictures."
 "Soon after this I found my pet kitten and took her home with me."
 "I like to play with my pet kitten." "I will do as mother says."
 "I will take good care of the kitten.")
(EPI-SCHEMA ((ME1150.SK TAKE.946.V OBJECT1145.SK (AT.P-ARG ?L)) ** E1149.SK)
	(:ROLES
		(!R1 (OBJECT1145.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1150.SK = OBJECT1145.SK)))
		(!R4 (ME1150.SK AGENT.N))
		(!R5
   (OBJECT1145.SK
    (= (K (L #:G1507072 (AND (#:G1507072 GOOD.A) (#:G1507072 CARE.N)))))))
		(!R6 (MOTHER1119.SK MOTHER.N))
		(!R7 (MOTHER1119.SK (PERTAIN-TO ME1150.SK)))
		(!R8 (OBJECT1145.SK (OF.P KITTEN1147.SK)))
		(!R9 (KITTEN1147.SK (PLUR KITTEN.N)))
		(!R10 (OBJECT1134.SK (PERTAIN-TO ME1150.SK)))
		(!R11 (OBJECT1139.SK (PERTAIN-TO ME1150.SK)))
		(!R12 (HOME1137.SK HOME.N))
		(!R13 (HOME1137.SK (PERTAIN-TO KITTEN1147.SK)))
	)
	(:GOALS
		(?G1 (ME1150.SK (WANT.V (THAT (ME1150.SK (HAVE.V OBJECT1145.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1150.SK HAVE.V OBJECT1145.SK)))
		(?I2 (ME1150.SK (AT.P ?L)))
		(?I3 (OBJECT1145.SK (AT.P ?L)))
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
		(!W6 (E1149.SK (AFTER E1144.SK)))
		(!W7 (E1144.SK (AT-ABOUT NOW254)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.100312 3)
("My mother gave me a new book."
 "I took it to school one morning, to let the girls see the pictures."
 "Soon after this I found my pet kitten and took her home with me."
 "I like to play with my pet kitten." "I will do as mother says."
 "I will take good care of the kitten.")
(EPI-SCHEMA ((MOTHER1119.SK ((ADV-A (TO.P ME1150.SK)) GIVE.947.V) ME1150.SK
              BOOK1123.SK)
             ** E1118.SK)
	(:ROLES
		(!R1 (MOTHER1119.SK AGENT.N))
		(!R2 (BOOK1123.SK INANIMATE_OBJECT.N))
		(!R3 (BOOK1123.SK BOOK.N))
		(!R4 (BOOK1123.SK NEW.A))
		(!R5 (MOTHER1119.SK MOTHER.N))
		(!R6 (MOTHER1119.SK (PERTAIN-TO ME1150.SK)))
		(!R7 (ME1150.SK AGENT.N))
		(!R8 (E1118.SK (RIGHT-AFTER U248)))
		(!R9 (OBJECT1134.SK (PERTAIN-TO ME1150.SK)))
		(!R10 (OBJECT1139.SK (PERTAIN-TO ME1150.SK)))
	)
	(:GOALS
		(?G1 (MOTHER1119.SK (WANT.V (THAT (ME1150.SK (HAVE.V BOOK1123.SK))))))
	)
	(:PRECONDS
		(?I1 (MOTHER1119.SK HAVE.V BOOK1123.SK))
		(?I2 (NOT (ME1150.SK HAVE.V BOOK1123.SK)))
	)
	(:POSTCONDS
		(?P1 (NOT (MOTHER1119.SK HAVE.V BOOK1123.SK)))
		(?P2 (ME1150.SK HAVE.V BOOK1123.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1118.SK (SAME-TIME NOW249)))
		(!W2 (E1124.SK (BEFORE NOW249)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 66:
	; "Has Charley seen the nest in the big apple tree?"
	; "Oh, yes!"
	; "and he has seen the sweet apples, too."
	; "A big apple is on the green grass."
	; "Charley will get it for Rosy."
; best schemas are:
; EAT.V
; FEED.V

; story 67:
	; "This is a schoolhouse in America."
	; "We can see some boys and girls in the street."
	; "The boys and girls are going to school."
	; "Last night they studied their lessons."
	; "This is a large, fine schoolhouse; it is made of stone."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 68:
	; "A sail-boat is on the pond."
	; "The man holds the sail."
	; "The wind blows on the sail, and the boat moves fast."
	; "There is a row-boat too."
	; "I like a row-boat."
	; "It is fun to row."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V
; FEED.V

; story 69:
	; "Here is our fine new tent."
	; "There is room for all of us."
	; "Here is a fine flag for you, boys."
	; "It is red, white and blue."
	; "We have made it for the top of your tent."
	; "We will take our flag and drum."
; best schemas are:
; MAKE.V
; TRAVEL.V
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?

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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 71:
	; "Mother gave them to me."
	; "She gave them to me this morning."
	; "My father gave me two red ones."
	; "I will keep the red flower."
	; "I will give all my yellow flowers to Lucy."
	; "She will like them."
	; "She will take them home with her."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
(setf matches (append matches '(( (3.0 0)
("Mother gave them to me." "She gave them to me this morning."
 "My father gave me two red ones." "I will keep the red flower."
 "I will give all my yellow flowers to Lucy." "She will like them."
 "She will take them home with her.")
(EPI-SCHEMA ((MOTHER.NAME ((ADV-A (TO.P THEY1350.SK)) GIVE.1086.V) THEY1350.SK
              ?O)
             ** E1329.SK)
	(:ROLES
		(!R1 (MOTHER.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (THEY1350.SK AGENT.N))
		(!R4 (ME1351.SK AGENT.N))
		(!R5 (FATHER1336.SK FATHER.N))
		(!R6 (FATHER1336.SK (PERTAIN-TO ME1351.SK)))
		(!R7 (OBJECT1344.SK (PERTAIN-TO ME1351.SK)))
	)
	(:GOALS
		(?G1 (MOTHER.NAME (WANT.V (THAT (THEY1350.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (MOTHER.NAME HAVE.V ?O))
		(?I2 (NOT (THEY1350.SK HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (MOTHER.NAME HAVE.V ?O)))
		(?P2 (THEY1350.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1329.SK (BEFORE NOW295)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 3)
("Mother gave them to me." "She gave them to me this morning."
 "My father gave me two red ones." "I will keep the red flower."
 "I will give all my yellow flowers to Lucy." "She will like them."
 "She will take them home with her.")
(EPI-SCHEMA ((MOTHER.NAME ((ADV-A (WITH.P MOTHER.NAME)) (HOME.ADV TAKE.1087.V))
              THEY1352.SK (AT.P-ARG ?L))
             ** E1349.SK)
	(:ROLES
		(!R1 (MOTHER.NAME AGENT.N))
		(!R2 (THEY1352.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MOTHER.NAME = THEY1352.SK)))
		(!R5 (THEY1352.SK AGENT.N))
	)
	(:GOALS
		(?G1 (MOTHER.NAME (WANT.V (THAT (MOTHER.NAME (HAVE.V THEY1352.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MOTHER.NAME HAVE.V THEY1352.SK)))
		(?I2 (MOTHER.NAME (AT.P ?L)))
		(?I3 (THEY1352.SK (AT.P ?L)))
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
		(!W6 (E1349.SK (AFTER E1348.SK)))
		(!W7 (E1348.SK (AT-ABOUT NOW301)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.5 2)
("Mother gave them to me." "She gave them to me this morning."
 "My father gave me two red ones." "I will keep the red flower."
 "I will give all my yellow flowers to Lucy." "She will like them."
 "She will take them home with her.")
(EPI-SCHEMA ((MOTHER.NAME ((ADV-A (TO.P ME1351.SK)) FEED.1088.V) THEY1350.SK
              ?F)
             ** E1329.SK)
	(:ROLES
		(!R1 (MOTHER.NAME AGENT.N))
		(!R2 (?F FOOD.N))
		(!R3 (NOT (MOTHER.NAME = THEY1350.SK)))
		(!R4 (NOT (THEY1350.SK = ?F)))
		(!R5 (NOT (MOTHER.NAME = ?F)))
		(!R6 (THEY1350.SK AGENT.N))
		(!R7 (ME1351.SK AGENT.N))
		(!R8 (FATHER1336.SK FATHER.N))
		(!R9 (FATHER1336.SK (PERTAIN-TO ME1351.SK)))
		(!R10 (OBJECT1344.SK (PERTAIN-TO ME1351.SK)))
	)
	(:GOALS
		(?G1 (MOTHER.NAME (WANT.V (THAT (NOT (THEY1350.SK HUNGRY.A))))))
		(?G2 (MOTHER.NAME (WANT.V (THAT (THEY1350.SK EAT.V ?F)))))
	)
	(:PRECONDS
		(?I1 (MOTHER.NAME HAVE.V ?F))
		(?I2 (THEY1350.SK HUNGRY.A))
	)
	(:STEPS
		(?E1 (THEY1350.SK EAT.V ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (MOTHER.NAME (HAVE.V ?F))))
		(?P2 (NOT (THEY1350.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E1329.SK))
		(!W2 (E1329.SK (BEFORE NOW295)))
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

; found chains:
; 	chain 0:
;		((MOTHER.NAME ((ADV-A (TO.P THEY1350.SK)) GIVE.1086.V) THEY1350.SK
     ;THEY1352.SK)
    ;** E1329.SK)
;		((MOTHER.NAME ((ADV-A (WITH.P MOTHER.NAME)) (HOME.ADV TAKE.1087.V))
     ;THEY1352.SK (AT.P-ARG ?L))
    ;** E1349.SK)
;learned chain schema:
(setf chain-matches (append chain-matches (list '(EPI-SCHEMA ((?X_B
                                                               GIVE_TAKE_NIL.1099.PR
                                                               ?X_A ?X_C)
                                                              ** ?E)
	(:ROLES
		(!R1 (?X_C INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (?X_B = ?X_C)))
	)
	(:PRECONDS
		(?I1 (?X_B HAVE.V ?X_C))
		(?I2 (NOT (?X_A HAVE.V ?X_C)))
	)
	(:STEPS
		(?E1 (?X_B ((ADV-A (TO.P ?X_A)) GIVE.1086.V) ?X_A ?X_C))
		(?E2 (?X_B ((ADV-A (WITH.P ?X_B)) (HOME.ADV TAKE.1087.V)) ?X_C (AT.P-ARG ?L)))
	)
	(:POSTCONDS
		(?P1 (?X_B HAVE.V ?X_C))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE ?E2))
	)
)
)))
; 	chain 1:
;		((MOTHER.NAME ((ADV-A (TO.P ME1351.SK)) FEED.1088.V) THEY1350.SK
     ;THEY1352.SK)
    ;** E1329.SK)
;		((MOTHER.NAME ((ADV-A (WITH.P MOTHER.NAME)) (HOME.ADV TAKE.1087.V))
     ;THEY1352.SK (AT.P-ARG ?L))
    ;** E1349.SK)
;learned chain schema:
(setf chain-matches (append chain-matches (list '(EPI-SCHEMA ((?X_C
                                                               FEED_TAKE_NIL.1100.PR
                                                               ?X_B ?X_D)
                                                              ** ?E)
	(:ROLES
		(!R1 (?X_D FOOD.N))
		(!R2 (?X_D INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
	)
	(:PRECONDS
		(?I1 (?X_C HAVE.V ?X_D))
		(?I2 (?X_B HUNGRY.A))
	)
	(:STEPS
		(?E1 (?X_C ((ADV-A (TO.P ?X_A)) FEED.1088.V) ?X_B ?X_D))
		(?E2 (?X_C ((ADV-A (WITH.P ?X_C)) (HOME.ADV TAKE.1087.V)) ?X_D (AT.P-ARG ?L)))
	)
	(:POSTCONDS
		(?P1 (?X_C HAVE.V ?X_D))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE ?E2))
	)
)
)))
; story 72:
	; "These women came to the river to wash clothes."
	; "They brought them in large baskets on their heads."
	; "They dip the clothes in the water."
	; "Then they put soap on them."
	; "They lay the clothes on a large stone and pound them with a stick."
	; "Then they dip them in the water again."
	; "Now the clothes are white and clean."
; best schemas are:
; PUT_IN_CONTAINER.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 73:
	; "The sun has set, and the pond is still."
	; "John, Ned, Ben, Tom, and Nell stand on the bank, and look at the duck."
	; "The dog with a black spot on his back, is with Tom."
	; "See!"
	; "Tom has his hat in his hand."
	; "He has left his big top on the box."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 74:
	; "Here is May with her kitten."
	; "Her mother gave the kitten to her."
	; "She is kind to the pretty kitten."
	; "She likes to see it jump and play."
	; "See it run with May's ball!"
	; "It does not run far with it."
	; "If May can get the ball she will not take it."
	; "She will give it to the kitten to play with."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
(setf matches (append matches '(( (2.405 0)
("Here is May with her kitten." "Her mother gave the kitten to her."
 "She is kind to the pretty kitten." "She likes to see it jump and play."
 "See it run with May's ball!" "It does not run far with it."
 "If May can get the ball she will not take it."
 "She will give it to the kitten to play with.")
(EPI-SCHEMA ((KITTENS1402.SK ((ADV-A (TO.P KITTENS1402.SK)) GIVE.1297.V)
              KITTENS1402.SK ?O)
             ** E1403.SK)
	(:ROLES
		(!R1 (?O INANIMATE_OBJECT.N))
		(!R2 (KITTENS1402.SK AGENT.N))
		(!R3 (KITTENS1402.SK (PLUR KITTEN.N)))
		(!R4 (KITTENS1402.SK MOTHER.N))
		(!R5 (KITTENS1402.SK PRETTY.A))
		(!R6 (KITTENS1402.SK KITTEN.N))
		(!R7 (KITTENS1402.SK (PERTAIN-TO MAY.NAME)))
		(!R8 (MAY.NAME BALL.N))
		(!R9 (MAY.NAME (PERTAIN-TO MAY.NAME)))
		(!R10 (E1403.SK (RIGHT-AFTER U315)))
		(!R11 (OBJECT1409.SK (= (K KIND.N))))
		(!R12 (OBJECT1409.SK (TO.P KITTENS1402.SK)))
		(!R13 (OBJECT1421.SK (= KITTENS1402.SK)))
	)
	(:GOALS
		(?G1 (KITTENS1402.SK (WANT.V (THAT (KITTENS1402.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (KITTENS1402.SK HAVE.V ?O))
		(?I2 (NOT (KITTENS1402.SK HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (KITTENS1402.SK HAVE.V ?O)))
		(?P2 (KITTENS1402.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1403.SK (SAME-TIME NOW316)))
		(!W2 (E1407.SK (BEFORE NOW316)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.53125 1)
("Here is May with her kitten." "Her mother gave the kitten to her."
 "She is kind to the pretty kitten." "She likes to see it jump and play."
 "See it run with May's ball!" "It does not run far with it."
 "If May can get the ball she will not take it."
 "She will give it to the kitten to play with.")
(EPI-SCHEMA ((SHE.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.1328.V
              (KA (TAKE.V IT.PRO)))
             ** ?E)
	(:ROLES
		(!R1 ((KA (TAKE.V IT.PRO)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (SHE.PRO FEMALE.A))
		(!R4 (SHE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (NOT (SHE.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (SHE.PRO (DO.V (KA (TAKE.V IT.PRO))))) CAUSE-OF
    (KE (SHE.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1419.SK (NOT (SHE.PRO (DO.V (KA (TAKE.V IT.PRO))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1419.SK))
		(!W2 (E1419.SK (AFTER E1418.SK)))
		(!W3 (E1418.SK (AT-ABOUT NOW321)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
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
; EAT.V
; FEED.V
; PUT_IN_CONTAINER.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 76:
	; "See Baby try to catch the hoop!"
	; "Baby can not catch it."
	; "The hoop rolls away from Baby."
	; "Look, Baby!"
	; "See the hoop roll!"
	; "Hear the bells, Baby!"
	; "The bells say, Tinkle, tinkle, tinkle."
; best schemas are:

; story 77:
	; "Is this May?"
	; "No; this is Ada."
	; "May is not here."
	; "Ada is sitting in May's chair."
	; "She is looking at a fan which lies on a box."
; best schemas are:
; SIT.V
; PUT_IN_CONTAINER.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (3.0618622 1)
("Is this May?" "No; this is Ada." "May is not here."
 "Ada is sitting in May's chair."
 "She is looking at a fan which lies on a box.")
(EPI-SCHEMA ((ADA.NAME
              ((ADV-A (ON.P CHAIR1464.SK))
               ((ADV-A (IN.P CHAIR1464.SK)) SIT.1381.V)))
             ** E1462.SK)
	(:ROLES
		(!R1 (ADA.NAME AGENT.N))
		(!R2 (CHAIR1464.SK INANIMATE_OBJECT.N))
		(!R3 (CHAIR1464.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (CHAIR1464.SK CHAIR.N))
		(!R6 (CHAIR1464.SK (PERTAIN-TO MAY.NAME)))
	)
	(:GOALS
		(?G1 (ADA.NAME (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (ADA.NAME (AT.P ?L)))
		(?I2 (CHAIR1464.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1462.SK (AT-ABOUT NOW339)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 78:
	; "Here is a fisherman."
	; "He is ready to put his net into the water."
	; "He stands on two long poles over the water."
	; "He has a basket for his fish."
	; "His net is larger than Simeon's net."
	; "The men in the boats use a larger net than this."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 79:
	; "These boys are Ned and Roy."
	; "The large boy is Roy."
	; "The boy who has a bun is Ned."
	; "The boys are sitting on the floor."
	; "Roy's dog, Carlo, lies near Ned."
	; "Is he lying near Roy?"
	; "Ned and Roy are good boys."
; best schemas are:
; SIT.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?

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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 81:
	; "The man has a little dog."
	; "The boy has a big dog."
	; "See the little dog run!"
	; "He has my ball."
	; "The little dog may have the ball."
	; "He may run and play with it."
	; "She can not take it."
; best schemas are:
; RECEIVING_VERB.?
; GIVE.V
; EAT.V
; FEED.V
; PLAY.V

; story 82:
	; "These men fish in the sea."
	; "They have a large net."
	; "They carry the net in a boat and drip it into the water."
	; "Soon they pull it to the shore."
	; "Sometimes they find many fish in it."
	; "The women put the fish in the basket and take them home."
	; "Pedro and Simeon like to watch the men in the boats and help pull in the net."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

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
; PLAY.V
; RECEIVING_VERB.?
; MAKE.V
; GIVE.V
; EAT.V

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
; TRAVEL.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
(setf matches (append matches '(( (2.5 0)
("This is Fred and his sled." "It is a red sled."
 "It is a red sled, and it has black letters on it."
 "Fred let Frank stand on his sled, and Frank fell into the snow."
 "I am Fred and this is Frank." "This is my red sled."
 "My sled is a pretty sled."
 "I let frank have my sled, and he fell into the snow."
 "Frank can not stand on my sled." "I can stand on it.")
(EPI-SCHEMA ((FRANK.NAME
              ((ADV-A (INTO.P SNOW1660.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.1625.V)))
              ?L2)
             ** E1662.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (SNOW1660.SK SNOW.N))
		(!R6 (OBJECT1658.SK (PERTAIN-TO FRANK.NAME)))
		(!R7 (E1663.SK (AT-OR-BEFORE NOW387)))
	)
	(:GOALS
		(?G1 (FRANK.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRANK.NAME (AT.P ?L1)))
		(?I2 (NOT (FRANK.NAME (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (FRANK.NAME (AT.P ?L1))))
		(?P2 (FRANK.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1662.SK))
		(!W2 (?I2 BEFORE E1662.SK))
		(!W3 (?P1 AFTER E1662.SK))
		(!W4 (?P2 AFTER E1662.SK))
		(!W5 (?G1 CAUSE-OF E1662.SK))
		(!W6 (E1661.SK (CONSEC E1662.SK)))
		(!W7 (E1662.SK (DURING E1657.SK)))
		(!W8 (E1661.SK (DURING E1657.SK)))
		(!W9 (E1657.SK (BEFORE NOW387)))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

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
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; EAT.V
; FEED.V
; PLAY.V

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
; best schemas are:
; PLAY.V
; RECEIVING_VERB.?
; MAKE.V
; GIVE.V
; EAT.V
(setf matches (append matches '(( (4.1411133 2)
("This is Tom and May." "Tom and May can play ball."
 "Tom has a little bat and a little ball." "Tom has hit the ball."
 "See it fly!" "See May run!" "Will she get the ball?"
 "O, yes, she will get the ball." "Run, May, run, and get the ball!")
(EPI-SCHEMA ((SHE.PRO GET.1669.V BALL1776.SK (AT.P-ARG ?L)) ** E1777.SK)
	(:ROLES
		(!R1 (BALL1776.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (SHE.PRO = BALL1776.SK)))
		(!R4 (SHE.PRO FEMALE.A))
		(!R5 (SHE.PRO AGENT.N))
		(!R6 (BALL1776.SK BALL.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (SHE.PRO (HAVE.V BALL1776.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SHE.PRO HAVE.V BALL1776.SK)))
		(?I2 (SHE.PRO (AT.P ?L)))
		(?I3 (BALL1776.SK (AT.P ?L)))
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
		(!W6 (E1777.SK (AFTER E1775.SK)))
		(!W7 (E1775.SK (AT-ABOUT NOW425)))
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
; PUT_IN_CONTAINER.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V

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
; PLAY.V
; SIT.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 91:
	; "It is night."
	; "The moon and stars are shining."
	; "I see many stars."
	; "At night the boys and girls are asleep."
	; "In the day they play or work."
	; "When night comes they are very tired."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

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
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V

; story 93:
	; "Do you see that tree on the hill?"
	; "Well, a nest is in that tree."
	; "Charley, Fred and I went to see the nest."
	; "It had eggs in it."
	; "Charley went up the tree and got the nest for us to see."
	; "As he held it in his hand, an egg fell on the grass."
	; "Was not that too bad?"
; best schemas are:
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V

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
; PLAY.V
; MAKE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 95:
	; "See!"
	; "John is rolling the ball to Tyke."
	; "Run!"
	; "Tyke!"
	; "Get the ball."
	; "Good dog!"
	; "Take the ball to John."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 96:
	; "Frank and little May are in the field with the wagon."
	; "They have come to find flowers."
	; "May has a red flower."
	; "Frank has three yellow flowers."
	; "He will let May have them."
	; "She will take them to the wagon."
	; "She is glad to get the pretty flowers."
; best schemas are:
; SEARCH.V
; FIND.V
; RECEIVING_VERB.?
; TRAVEL.V
; PUT_IN_CONTAINER.V
(setf matches (append matches '(( (3.7302296 1)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon." "She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N))))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P FIELD1940.SK)) COME.917.V)))
              ?L2)
             ** E1942.SK)
	(:ROLES
		(!R1 (MAY.NAME AGENT.N))
		(!R2 (FIELD1940.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (FIELD1940.SK = ?L2)))
		(!R5 (E1942.SK (IMPINGES-ON E539)))
		(!R6 (FIELD1940.SK FIELD.N))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1940.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?L2))))
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
		(!W6 (OBJECT1943.SK (AT-ABOUT NOW482)))
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
; SEARCH.V
; FIND.V
; RECEIVING_VERB.?
; TRAVEL.V
; PUT_IN_CONTAINER.V
(setf matches (append matches '(( (3.7302296 1)
("Frank and little May are in the field with the wagon."
 "They have come to find flowers." "May has a red flower."
 "Frank has three yellow flowers." "He will let May have them."
 "She will take them to the wagon." "She is glad to get the pretty flowers.")
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N))))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P FIELD1959.SK)) COME.917.V)))
              ?L2)
             ** E1961.SK)
	(:ROLES
		(!R1 (MAY.NAME AGENT.N))
		(!R2 (FIELD1959.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (FIELD1959.SK = ?L2)))
		(!R5 (E1961.SK (IMPINGES-ON E547)))
		(!R6 (FIELD1959.SK FIELD.N))
	)
	(:GOALS
		(?G1 (MAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAY.NAME (AT.P FIELD1959.SK)))
		(?I2 (NOT (MAY.NAME (AT.P ?L2))))
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
		(!W6 (OBJECT1962.SK (AT-ABOUT NOW489)))
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
; EAT.V
; FEED.V
; RECEIVING_VERB.?
; DRINK.V

; story 99:
	; "The boys and girls are having fine sport."
	; "The snow on the hill is just right, and their sleds run well."
	; "O, look at them!"
	; "Elsie and Roy are ahead."
	; "Ho, ho!"
	; "There they go; Over the ice and over the snow."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

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
     ;((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TREE426.SK)) CLIMB.347.V)) TREE426.SK)
    ;** E432.SK)
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
; story 0:
	; "The man put on his watch."
	; "His watch was not running."
	; "He took his watch off."
	; "He shook the watch."
	; "The watch started running again."
; best schemas are:
; RECEIVING_VERB.?
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; EAT.V
(setf matches (append matches '(( (4.0178127 2)
("The man put on his watch." "His watch was not running."
 "He took his watch off." "He shook the watch."
 "The watch started running again.")
(EPI-SCHEMA ((MAN2.SK TAKE.1.V WATCH5.SK (AT.P-ARG ?L)) ** E18.SK)
	(:ROLES
		(!R1 (MAN2.SK AGENT.N))
		(!R2 (WATCH5.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAN2.SK = WATCH5.SK)))
		(!R5 (WATCH5.SK WATCH.N))
		(!R6 (MAN2.SK MAN.N))
		(!R7 (WATCH5.SK (PERTAIN-TO MAN2.SK)))
	)
	(:GOALS
		(?G1 (MAN2.SK (WANT.V (THAT (MAN2.SK (HAVE.V WATCH5.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN2.SK HAVE.V WATCH5.SK)))
		(?I2 (MAN2.SK (AT.P ?L)))
		(?I3 (WATCH5.SK (AT.P ?L)))
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
		(!W6 (E18.SK (BEFORE NOW2)))
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
; best schemas are:
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (4.0 3)
("The man put on his jacket." "He soon became too hot."
 "He took his jacket off." "He became cold again."
 "He put on a coat that was not as warm.")
(EPI-SCHEMA ((HE.PRO TAKE.10.V MAN27.SK (AT.P-ARG ?L)) ** E40.SK)
	(:ROLES
		(!R1 (MAN27.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = MAN27.SK)))
		(!R4 (MAN27.SK MAN.N))
		(!R5 (MAN27.SK JACKET.N))
		(!R6 (MAN27.SK (PERTAIN-TO HE.PRO)))
		(!R7 (HE.PRO MALE.A))
		(!R8 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V MAN27.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V MAN27.SK)))
		(?I2 (HE.PRO (AT.P ?L)))
		(?I3 (MAN27.SK (AT.P ?L)))
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
		(!W6 (E40.SK (BEFORE NOW7)))
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
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.5 0)
("I went on a plane yesterday." "As I got on it something happened."
 "We had to turn back." "A fire came about." "It was scary.")
(EPI-SCHEMA ((ME69.SK
              ((ADV-A (ON.P PLANE51.SK))
               ((ADV-A (IN.P (K YESTERDAY.N)))
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.19.V))))
              ?L2)
             ** E59.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (ME69.SK AGENT.N))
		(!R5 (PLANE51.SK PLANE.N))
	)
	(:GOALS
		(?G1 (ME69.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME69.SK (AT.P ?L1)))
		(?I2 (NOT (ME69.SK (AT.P ?L2))))
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
		(!W6 (E59.SK (BEFORE NOW10)))
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
; best schemas are:
; SIT.V
; TRAVEL.V
(setf matches (append matches '(( (3.0618622 1)
("Ethan sat in a chair." "The chair was old." "The chair broke."
 "Ethan fell on the ground." "He decided to buy a new one.")
(EPI-SCHEMA ((ETHAN.NAME
              ((ADV-A (ON.P CHAIR74.SK)) ((ADV-A (IN.P CHAIR74.SK)) SIT.24.V)))
             ** E76.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (CHAIR74.SK INANIMATE_OBJECT.N))
		(!R3 (CHAIR74.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (CHAIR74.SK CHAIR.N))
	)
	(:GOALS
		(?G1 (ETHAN.NAME (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (ETHAN.NAME (AT.P ?L)))
		(?I2 (CHAIR74.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E76.SK (BEFORE NOW15)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("Ethan sat in a chair." "The chair was old." "The chair broke."
 "Ethan fell on the ground." "He decided to buy a new one.")
(EPI-SCHEMA ((ETHAN.NAME
              ((ADV-A (ON.P GROUND85.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.25.V)))
              ?L2)
             ** E87.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (GROUND85.SK GROUND.N))
	)
	(:GOALS
		(?G1 (ETHAN.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ETHAN.NAME (AT.P ?L1)))
		(?I2 (NOT (ETHAN.NAME (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (ETHAN.NAME (AT.P ?L1))))
		(?P2 (ETHAN.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E87.SK))
		(!W2 (?I2 BEFORE E87.SK))
		(!W3 (?P1 AFTER E87.SK))
		(!W4 (?P2 AFTER E87.SK))
		(!W5 (?G1 CAUSE-OF E87.SK))
		(!W6 (E87.SK (BEFORE NOW18)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 4:
	; "Lucy went for a walk."
	; "She saw a squirrel."
	; "Then she looked again."
	; "It wasn't a squirrel."
	; "It was a chipmunk."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (2.5 0)
("Lucy went for a walk." "She saw a squirrel." "Then she looked again."
 "It wasn't a squirrel." "It was a chipmunk.")
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-A (FOR.P WALK96.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.30.V)))
              ?L2)
             ** E98.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (WALK96.SK WALK.N))
	)
	(:GOALS
		(?G1 (LUCY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LUCY.NAME (AT.P ?L1)))
		(?I2 (NOT (LUCY.NAME (AT.P ?L2))))
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
		(!W6 (E98.SK (BEFORE NOW20)))
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
; best schemas are:
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (4.1953125 2)
("Yesterday I got a kindle book." "It was great." "I liked the book a lot."
 "I read it in two days." "It was impressive.")
(EPI-SCHEMA ((ME124.SK GET.37.V BOOK115.SK (AT.P-ARG ?L)) ** E116.SK)
	(:ROLES
		(!R1 (BOOK115.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME124.SK = BOOK115.SK)))
		(!R4 (BOOK115.SK KINDLE.A))
		(!R5 (BOOK115.SK BOOK.N))
		(!R6 (ME124.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME124.SK (WANT.V (THAT (ME124.SK (HAVE.V BOOK115.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME124.SK HAVE.V BOOK115.SK)))
		(?I2 (ME124.SK (AT.P ?L)))
		(?I3 (BOOK115.SK (AT.P ?L)))
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
		(!W6 (E116.SK (BEFORE NOW25)))
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
; EAT.V
; FEED.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V

; story 7:
	; "I needed a to write a song."
	; "I had nothing to write with."
	; "I looked in my desk for a pen."
	; "I only saw a pen cap."
	; "I threw the pen cap away."
; best schemas are:
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V

; story 8:
	; "The hedge started to grow."
	; "Spring came around."
	; "The hedge started to bud flowers."
	; "The flowers grew."
	; "The roses were very beautiful."
; best schemas are:

; story 9:
	; "I went to the store yesterday."
	; "I tried some things on."
	; "I liked them but they were too expensive."
	; "I couldn't buy them."
	; "So I put them back."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (3.5 3)
("I went to the store yesterday." "I tried some things on."
 "I liked them but they were too expensive." "I couldn't buy them."
 "So I put them back.")
(EPI-SCHEMA ((ME213.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE204.SK)) ((ADV-A (FROM.P ?L1)) GO.90.V)))
              STORE204.SK)
             ** E205.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE204.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE204.SK)))
		(!R4 (ME213.SK AGENT.N))
		(!R5 (STORE204.SK STORE.N))
	)
	(:GOALS
		(?G1 (ME213.SK (WANT.V (KA ((ADV-A (AT.P STORE204.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME213.SK (AT.P ?L1)))
		(?I2 (NOT (ME213.SK (AT.P STORE204.SK))))
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
		(!W6 (E205.SK (BEFORE NOW45)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 11:
	; "I went to visit a farm on Friday."
	; "It was a long drive to get there."
	; "They had a lot of animals."
	; "I got to pet the cow."
	; "It was a very fun day."
; best schemas are:
; RECEIVING_VERB.?
; SEARCH.V
; FIND.V
; TRAVEL.V
; GIVE.V
(setf matches (append matches '(( (2.5 0)
("I went to visit a farm on Friday." "It was a long drive to get there."
 "They had a lot of animals." "I got to pet the cow." "It was a very fun day.")
(EPI-SCHEMA ((ME257.SK
              ((ADV-A
                (FOR.P (KA ((ADV-A (ON.P FRIDAY.NAME)) VISIT.V) FARM240.SK)))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.100.V)))
              ?L2)
             ** E241.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (ME257.SK AGENT.N))
		(!R5 (FARM240.SK FARM.N))
	)
	(:GOALS
		(?G1 (ME257.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME257.SK (AT.P ?L1)))
		(?I2 (NOT (ME257.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (ME257.SK (AT.P ?L1))))
		(?P2 (ME257.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E241.SK))
		(!W2 (?I2 BEFORE E241.SK))
		(!W3 (?P1 AFTER E241.SK))
		(!W4 (?P2 AFTER E241.SK))
		(!W5 (?G1 CAUSE-OF E241.SK))
		(!W6 (E241.SK (BEFORE NOW55)))
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
; SIT.V
; TRAVEL.V

; story 13:
	; "Devin got fed up with his bank."
	; "He called them for help."
	; "They didn't respond."
	; "He took his money out."
	; "He found a new bank."
; best schemas are:
; RECEIVING_VERB.?
; SEARCH.V
; FIND.V
(setf matches (append matches '(( (4.0 3)
("Devin got fed up with his bank." "He called them for help."
 "They didn't respond." "He took his money out." "He found a new bank.")
(EPI-SCHEMA ((DEVIN.NAME GET.104.V
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
		(!R5 (DEVIN.NAME (PERTAIN-TO DEVIN.NAME)))
		(!R6 (DEVIN.NAME BANK.N))
		(!R7 (DEVIN.NAME MONEY.N))
		(!R8 (DEVIN.NAME (PERTAIN-TO HE.PRO)))
		(!R9 (HE.PRO MALE.A))
		(!R10 (HE.PRO AGENT.N))
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
		(!W6 (E283.SK (BEFORE NOW65)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("Devin got fed up with his bank." "He called them for help."
 "They didn't respond." "He took his money out." "He found a new bank.")
(EPI-SCHEMA ((HE.PRO FIND.129.V BANK299.SK) ** E300.SK)
	(:ROLES
		(!R1 (?L LOCATION.N))
		(!R2 (HE.PRO MALE.A))
		(!R3 (HE.PRO AGENT.N))
		(!R4 (BANK299.SK BANK.N))
		(!R5 (BANK299.SK NEW.A))
		(!R6 (DEVIN.NAME (PERTAIN-TO DEVIN.NAME)))
		(!R7 (DEVIN.NAME BANK.N))
		(!R8 (DEVIN.NAME (PERTAIN-TO HE.PRO)))
		(!R9 (DEVIN.NAME MONEY.N))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P ?L)))
		(?I2 (BANK299.SK (AT.P ?L)))
		(?I3 (HE.PRO ((ADV-A (FOR.P BANK299.SK)) SEARCH.V)))
		(?I4 (NOT (HE.PRO (KNOW.V (THAT (BANK299.SK (AT.P ?L)))))))
		(?I5 (NOT (HE.PRO (HAVE.V BANK299.SK))))
	)
	(:POSTCONDS
		(?P1 (HE.PRO (KNOW.V (THAT (BANK299.SK (AT.P ?L))))))
		(?P2 (HE.PRO (HAVE.V BANK299.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E300.SK (BEFORE NOW69)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
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
; GIVE.V
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 15:
	; "Emmy lived on a farm."
	; "She stayed in a pen with her brother."
	; "One day a man came and saw Emmy."
	; "He took her home."
	; "They are very happy together."
; best schemas are:
; RECEIVING_VERB.?
; TRAVEL.V
; SIT.V
; SEARCH.V
; FIND.V
(setf matches (append matches '(( (4.100312 5)
("Emmy lived on a farm." "She stayed in a pen with her brother."
 "One day a man came and saw Emmy." "He took her home."
 "They are very happy together.")
(EPI-SCHEMA ((MAN341.SK TAKE.135.V EMMY.NAME (AT.P-ARG FARM329.SK)) ** E344.SK)
	(:ROLES
		(!R1 (MAN341.SK AGENT.N))
		(!R2 (EMMY.NAME INANIMATE_OBJECT.N))
		(!R3 (FARM329.SK LOCATION.N))
		(!R4 (NOT (MAN341.SK = EMMY.NAME)))
		(!R5 (MAN341.SK MAN.N))
		(!R6 (BROTHER336.SK (PERTAIN-TO EMMY.NAME)))
		(!R7 (BROTHER336.SK BROTHER.N))
		(!R8 (DAY342.SK (= MAN341.SK)))
		(!R9 (DAY342.SK DAY.N))
		(!R10 (FARM329.SK FARM.N))
	)
	(:GOALS
		(?G1 (MAN341.SK (WANT.V (THAT (MAN341.SK (HAVE.V EMMY.NAME))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN341.SK HAVE.V EMMY.NAME)))
		(?I2 (MAN341.SK (AT.P FARM329.SK)))
		(?I3 (EMMY.NAME (AT.P FARM329.SK)))
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
		(!W6 (E344.SK (BEFORE NOW78)))
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
; best schemas are:
; TRAVEL.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
; FIND.V
(setf matches (append matches '(( (3.7302296 2)
("I was in high school." "I went to a park with a friend." "I lost my friend."
 "I was late for my curfew." "I got in trouble.")
(EPI-SCHEMA ((ME364.SK
              ((ADV-A (WITH.P FRIEND350.SK))
               ((ADV-A (TO.P PARK349.SK)) ((ADV-A (FROM.P ?L1)) GO.168.V)))
              PARK349.SK)
             ** E354.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (PARK349.SK LOCATION.N))
		(!R3 (NOT (?L1 = PARK349.SK)))
		(!R4 (ME364.SK AGENT.N))
		(!R5 (PARK349.SK PARK.N))
		(!R6 (FRIEND350.SK FRIEND.N))
		(!R7 (FRIEND358.SK (PERTAIN-TO ME364.SK)))
		(!R8 (FRIEND358.SK FRIEND.N))
		(!R9 (CURFEW362.SK (PERTAIN-TO ME364.SK)))
		(!R10 (CURFEW362.SK CURFEW.N))
	)
	(:GOALS
		(?G1 (ME364.SK (WANT.V (KA ((ADV-A (AT.P PARK349.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME364.SK (AT.P ?L1)))
		(?I2 (NOT (ME364.SK (AT.P PARK349.SK))))
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
		(!W6 (E354.SK (BEFORE NOW81)))
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
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; TRAVEL.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (2.405 0)
("Today I saw a baby bird." "The bird was in a tree."
 "The mother bird was teaching the baby bird."
 "She dropped the bird out of the nest." "The baby bird flew away.")
(EPI-SCHEMA ((BIRD371.SK
              (AWAY.ADV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FLY.235.V)))
              ?L2)
             ** E386.SK)
	(:ROLES
		(!R1 (BIRD371.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (BIRD371.SK ((NN MOTHER.N) BIRD.N)))
		(!R6 (BIRD371.SK BIRD.N))
		(!R7 (BIRD371.SK ((NN BABY.N) BIRD.N)))
	)
	(:GOALS
		(?G1 (BIRD371.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BIRD371.SK (AT.P ?L1)))
		(?I2 (NOT (BIRD371.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (BIRD371.SK (AT.P ?L1))))
		(?P2 (BIRD371.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E386.SK))
		(!W2 (?I2 BEFORE E386.SK))
		(!W3 (?P1 AFTER E386.SK))
		(!W4 (?P2 AFTER E386.SK))
		(!W5 (?G1 CAUSE-OF E386.SK))
		(!W6 (E386.SK (BEFORE NOW89)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
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
; EAT.V
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?

; story 19:
	; "The man felt cold."
	; "He took a warm shower."
	; "He felt better in the shower."
	; "When he got out he felt cold again."
	; "He got back in the shower."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 20:
	; "Today I went swimming."
	; "I love to swim."
	; "The water was very cold."
	; "The water made my teeth chatter."
	; "The water was so cold, I had to get out."
; best schemas are:
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
; PLAY.V
; GIVE.V
(setf matches (append matches '(( (3.5 3)
("Today I went swimming." "I love to swim." "The water was very cold."
 "The water made my teeth chatter." "The water was so cold, I had to get out.")
(EPI-SCHEMA ((ME435.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K SWIMMING.N))) GO.253.V))
              (K SWIMMING.N))
             ** E414.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K SWIMMING.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K SWIMMING.N))))
		(!R4 (ME435.SK AGENT.N))
		(!R5 (CHATTER430.SK (PERTAIN-TO ME435.SK)))
		(!R6 (CHATTER430.SK ((NN (PLUR TOOTH.N)) CHATTER.N)))
	)
	(:GOALS
		(?G1 (ME435.SK (WANT.V (KA ((ADV-A (AT.P (K SWIMMING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME435.SK (AT.P ?L1)))
		(?I2 (NOT (ME435.SK (AT.P (K SWIMMING.N)))))
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
		(!W6 (E414.SK (BEFORE NOW100)))
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
; PLAY.V
; RECEIVING_VERB.?
; SEARCH.V
; FIND.V
; MAKE.V

; story 22:
	; "Toni had a cat."
	; "She loved the cat."
	; "One day it got caught in the tree."
	; "Toni got mad."
	; "She looked for it and tried to get it."
; best schemas are:
; RECEIVING_VERB.?
; GIVE.V
; EAT.V
; FEED.V
; PLAY.V

; story 23:
	; "Susie was so hungry."
	; "She filled her plate to the top."
	; "She needed to eat."
	; "All the sudden she got full."
	; "She put on too much."
; best schemas are:
; EAT.V
; FEED.V
; RECEIVING_VERB.?
; TRAVEL.V
; SIT.V

; story 24:
	; "It was a raining night."
	; "It was too bad to go out."
	; "So Tina had to stay home."
	; "Tina had to cook."
	; "She wasn't happy about that."
; best schemas are:

; story 25:
	; "It was a hot day."
	; "Fred wanted water balloons."
	; "So he filled some up."
	; "Then he threw them at his friends."
	; "They had a large fight."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 26:
	; "I was on my way to get ice cream."
	; "Then I saw the line."
	; "It was far too long."
	; "It was around the corner."
	; "So I went home instead."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
(setf matches (append matches '(( (3.78125 1)
("I was on my way to get ice cream." "Then I saw the line."
 "It was far too long." "It was around the corner." "So I went home instead.")
(EPI-SCHEMA ((ME535.SK
              (INSTEAD.ADV
               ((ADV-A HOME.N)
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P CORNER533.SK)) GO.292.V))))
              ?L2)
             ** E534.SK)
	(:ROLES
		(!R1 (CORNER533.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (CORNER533.SK = ?L2)))
		(!R4 (ME535.SK AGENT.N))
		(!R5 (WAY527.SK (PERTAIN-TO ME535.SK)))
		(!R6 (WAY527.SK WAY.N))
		(!R7 (CORNER533.SK CORNER.N))
	)
	(:GOALS
		(?G1 (ME535.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME535.SK (AT.P CORNER533.SK)))
		(?I2 (NOT (ME535.SK (AT.P ?L2))))
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
		(!W6 (E534.SK (BEFORE NOW134)))
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
; best schemas are:
; RECEIVING_VERB.?
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; EAT.V
(setf matches (append matches '(( (3.905 3)
("The man turned on the light." "A mouse got startled."
 "The mouse ran across the living room." "The man got startled."
 "The man hid in his room.")
(EPI-SCHEMA ((MOUSE551.SK GET.310.V (KA (BE.PASV STARTLE.V)) (AT.P-ARG ?L)) **
             E553.SK)
	(:ROLES
		(!R1 (MOUSE551.SK AGENT.N))
		(!R2 ((KA (BE.PASV STARTLE.V)) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MOUSE551.SK = (KA (BE.PASV STARTLE.V)))))
		(!R5 (MOUSE551.SK MOUSE.N))
	)
	(:GOALS
		(?G1
   (MOUSE551.SK
    (WANT.V (THAT (MOUSE551.SK (HAVE.V (KA (BE.PASV STARTLE.V))))))))
	)
	(:PRECONDS
		(?I1 (NOT (MOUSE551.SK HAVE.V (KA (BE.PASV STARTLE.V)))))
		(?I2 (MOUSE551.SK (AT.P ?L)))
		(?I3 ((KA (BE.PASV STARTLE.V)) (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (MOUSE551.SK HAVE.V (KA (BE.PASV STARTLE.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E553.SK))
		(!W2 (?I1 PRECOND-OF E553.SK))
		(!W3 (?I2 PRECOND-OF E553.SK))
		(!W4 (?I3 PRECOND-OF E553.SK))
		(!W5 (?P1 POSTCOND-OF E553.SK))
		(!W6 (E553.SK (BEFORE NOW136)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 0)
("The man turned on the light." "A mouse got startled."
 "The mouse ran across the living room." "The man got startled."
 "The man hid in his room.")
(EPI-SCHEMA ((MOUSE551.SK
              ((ADV-A (ACROSS.P ROOM560.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.311.V)))
              ?L2)
             ** E556.SK)
	(:ROLES
		(!R1 (MOUSE551.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (MOUSE551.SK MOUSE.N))
		(!R6 (ROOM560.SK ((NN LIVING.N) ROOM.N)))
		(!R7 (ROOM560.SK ROOM.N))
		(!R8 (ROOM560.SK (PERTAIN-TO MAN547.SK)))
		(!R9 (MAN547.SK MAN.N))
		(!R10 (E556.SK (RIGHT-AFTER U136)))
	)
	(:GOALS
		(?G1 (MOUSE551.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MOUSE551.SK (AT.P ?L1)))
		(?I2 (NOT (MOUSE551.SK (AT.P ?L2))))
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
		(!W6 (E556.SK (SAME-TIME NOW137)))
		(!W7 (E563.SK (BEFORE NOW137)))
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
; best schemas are:
; TRAVEL.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
; FIND.V
(setf matches (append matches '(( (3.6953125 2)
("Tom moved to a new city." "He couldn't find a church he liked."
 "He tried going to a black church." "Tom had a lot of fun there."
 "He returned often.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P CITY579.SK)) MOVE.342.V))
              CITY579.SK)
             ** E580.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (CITY579.SK LOCATION.N))
		(!R4 (NOT (?L1 = CITY579.SK)))
		(!R5 (CITY579.SK CITY.N))
		(!R6 (CITY579.SK NEW.A))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA ((ADV-A (AT.P CITY579.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P CITY579.SK))))
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
		(!W6 (E580.SK (BEFORE NOW140)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 30:
	; "The girl stood up."
	; "She bumped her head on something."
	; "She sat back down."
	; "Her head was bleeding."
	; "Her friend ran to get help."
; best schemas are:
; RECEIVING_VERB.?
; SEARCH.V
; FIND.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
(setf matches (append matches '(( (2.5 0)
("The girl stood up." "She bumped her head on something." "She sat back down."
 "Her head was bleeding." "Her friend ran to get help.")
(EPI-SCHEMA ((SHE.PRO ((ADV-A (ON.P (K SOMETHING.N))) BUMP.400.V) GIRL608.SK)
             ** E613.SK)
	(:ROLES
		(!R1 (?L LOCATION.N))
		(!R2 (GIRL608.SK GIRL.N))
		(!R3 (GIRL608.SK HEAD.N))
		(!R4 (GIRL608.SK (PERTAIN-TO SHE.PRO)))
		(!R5 (SHE.PRO FEMALE.A))
		(!R6 (SHE.PRO AGENT.N))
		(!R7 (HEAD620.SK HEAD.N))
		(!R8 (HEAD620.SK (PERTAIN-TO SHE.PRO)))
		(!R9 (FRIEND624.SK FRIEND.N))
		(!R10 (FRIEND624.SK (PERTAIN-TO SHE.PRO)))
	)
	(:PRECONDS
		(?I1 (SHE.PRO (AT.P ?L)))
		(?I2 (GIRL608.SK (AT.P ?L)))
		(?I3 (SHE.PRO ((ADV-A (FOR.P GIRL608.SK)) SEARCH.V)))
		(?I4 (NOT (SHE.PRO (KNOW.V (THAT (GIRL608.SK (AT.P ?L)))))))
		(?I5 (NOT (SHE.PRO (HAVE.V GIRL608.SK))))
	)
	(:POSTCONDS
		(?P1 (SHE.PRO (KNOW.V (THAT (GIRL608.SK (AT.P ?L))))))
		(?P2 (SHE.PRO (HAVE.V GIRL608.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E613.SK (BEFORE NOW151)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 0)
("The girl stood up." "She bumped her head on something." "She sat back down."
 "Her head was bleeding." "Her friend ran to get help.")
(EPI-SCHEMA ((FRIEND624.SK
              ((ADV-A (FOR.P (KA (GET.V (K HELP.N)))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.401.V)))
              ?L2)
             ** E623.SK)
	(:ROLES
		(!R1 (FRIEND624.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND624.SK FRIEND.N))
		(!R6 (FRIEND624.SK (PERTAIN-TO SHE.PRO)))
		(!R7 (SHE.PRO FEMALE.A))
		(!R8 (SHE.PRO AGENT.N))
		(!R9 (E623.SK (RIGHT-AFTER U153)))
		(!R10 (GIRL608.SK GIRL.N))
		(!R11 (GIRL608.SK (PERTAIN-TO SHE.PRO)))
		(!R12 (GIRL608.SK HEAD.N))
		(!R13 (HEAD620.SK HEAD.N))
		(!R14 (HEAD620.SK (PERTAIN-TO SHE.PRO)))
	)
	(:GOALS
		(?G1 (FRIEND624.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND624.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND624.SK (AT.P ?L2))))
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
		(!W6 (E623.SK (SAME-TIME NOW154)))
		(!W7 (E626.SK (BEFORE NOW154)))
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
; best schemas are:
; TRAVEL.V
; PUT_IN_CONTAINER.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (3.405 3)
("The man went out to his mailbox." "He looked for his paper."
 "His paper was not there." "He called his paper boy."
 "His paper boy was running late.")
(EPI-SCHEMA ((MAN628.SK
              (OUT.ADV
               ((ADV-A (TO.P MAILBOX631.SK)) ((ADV-A (FROM.P ?L1)) GO.423.V)))
              MAILBOX631.SK)
             ** E627.SK)
	(:ROLES
		(!R1 (MAN628.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (MAILBOX631.SK LOCATION.N))
		(!R4 (NOT (?L1 = MAILBOX631.SK)))
		(!R5 (MAILBOX631.SK MAILBOX.N))
		(!R6 (MAILBOX631.SK (PERTAIN-TO MAN628.SK)))
		(!R7 (MAN628.SK MAN.N))
		(!R8 (E627.SK (RIGHT-AFTER U154)))
		(!R9 (PAPER636.SK PAPER.N))
		(!R10 (PAPER636.SK (PERTAIN-TO MAN628.SK)))
		(!R11 (BOY651.SK ((NN PAPER.N) BOY.N)))
		(!R12 (BOY651.SK (PERTAIN-TO MAN628.SK)))
	)
	(:GOALS
		(?G1 (MAN628.SK (WANT.V (KA ((ADV-A (AT.P MAILBOX631.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN628.SK (AT.P ?L1)))
		(?I2 (NOT (MAN628.SK (AT.P MAILBOX631.SK))))
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
		(!W6 (E627.SK (SAME-TIME NOW155)))
		(!W7 (E632.SK (BEFORE NOW155)))
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
; best schemas are:
; EAT.V
; FEED.V
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (4.4049997 4)
("I got a new kitten." "The kitten was bad." "It ate my shoes."
 "I then trained it to be good." "It was a good kitten from then on.")
(EPI-SCHEMA ((KITTEN660.SK EAT.516.V SHOE669.SK) ** E672.SK)
	(:ROLES
		(!R1 (KITTEN660.SK AGENT.N))
		(!R2 (SHOE669.SK FOOD.N))
		(!R3 (KITTEN660.SK NEW.A))
		(!R4 (KITTEN660.SK KITTEN.N))
		(!R5 (SHOE669.SK (PLUR SHOE.N)))
		(!R6 (SHOE669.SK (PERTAIN-TO ME675.SK)))
		(!R7 (ME675.SK AGENT.N))
	)
	(:GOALS
		(?G1 (KITTEN660.SK (WANT.V (THAT (NOT (KITTEN660.SK HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 (KITTEN660.SK HAVE.V SHOE669.SK))
		(?I2 (KITTEN660.SK HUNGRY.A))
	)
	(:POSTCONDS
		(?P1 (NOT (KITTEN660.SK (HAVE.V SHOE669.SK))))
		(?P2 (NOT (KITTEN660.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E672.SK))
		(!W2 (?I1 BEFORE E672.SK))
		(!W3 (E672.SK CAUSE-OF ?P1))
		(!W4 (E672.SK (BEFORE NOW162)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 3)
("I got a new kitten." "The kitten was bad." "It ate my shoes."
 "I then trained it to be good." "It was a good kitten from then on.")
(EPI-SCHEMA ((ME675.SK GET.518.V KITTEN660.SK (AT.P-ARG ?L)) ** E661.SK)
	(:ROLES
		(!R1 (KITTEN660.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME675.SK = KITTEN660.SK)))
		(!R4 (KITTEN660.SK NEW.A))
		(!R5 (KITTEN660.SK KITTEN.N))
		(!R6 (ME675.SK AGENT.N))
		(!R7 (SHOE669.SK (PERTAIN-TO ME675.SK)))
		(!R8 (SHOE669.SK (PLUR SHOE.N)))
	)
	(:GOALS
		(?G1 (ME675.SK (WANT.V (THAT (ME675.SK (HAVE.V KITTEN660.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME675.SK HAVE.V KITTEN660.SK)))
		(?I2 (ME675.SK (AT.P ?L)))
		(?I3 (KITTEN660.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (ME675.SK HAVE.V KITTEN660.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E661.SK))
		(!W2 (?I1 PRECOND-OF E661.SK))
		(!W3 (?I2 PRECOND-OF E661.SK))
		(!W4 (?I3 PRECOND-OF E661.SK))
		(!W5 (?P1 POSTCOND-OF E661.SK))
		(!W6 (E661.SK (BEFORE NOW160)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 33:
	; "Fred wanted to go to the movies."
	; "So off he went."
	; "He went with his friend."
	; "Fred saw two different movies."
	; "They were great."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (3.5 1)
("Fred wanted to go to the movies." "So off he went."
 "He went with his friend." "Fred saw two different movies." "They were great.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A SO.ADV OFF.P)
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.531.V)))
              ?L2)
             ** E684.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (MOVIE682.SK (PLUR MOVIE.N)))
		(!R6 (FRIEND691.SK (PERTAIN-TO FRED.NAME)))
		(!R7 (FRIEND691.SK FRIEND.N))
	)
	(:GOALS
		(E683.SK (FRED.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P ?L2))))
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
		(!W6 (E683.SK (BEFORE NOW165)))
		(!W7 (E684.SK (BEFORE NOW166)))
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
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; TRAVEL.V
; SIT.V
(setf matches (append matches '(( (4.1411133 2)
("Ethan loved the snow." "He saw it snow outside."
 "He asked his mom if he could play." "He took his sled."
 "He went down the hill.")
(EPI-SCHEMA ((ETHAN.NAME TAKE.542.V SLED708.SK (AT.P-ARG ?L)) ** E709.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (SLED708.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (ETHAN.NAME = SLED708.SK)))
		(!R5 (SLED708.SK (PERTAIN-TO ETHAN.NAME)))
		(!R6 (SLED708.SK SLED.N))
		(!R7 (MOM704.SK (PERTAIN-TO ETHAN.NAME)))
		(!R8 (MOM704.SK MOM.N))
	)
	(:GOALS
		(?G1 (ETHAN.NAME (WANT.V (THAT (ETHAN.NAME (HAVE.V SLED708.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ETHAN.NAME HAVE.V SLED708.SK)))
		(?I2 (ETHAN.NAME (AT.P ?L)))
		(?I3 (SLED708.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (ETHAN.NAME HAVE.V SLED708.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E709.SK))
		(!W2 (?I1 PRECOND-OF E709.SK))
		(!W3 (?I2 PRECOND-OF E709.SK))
		(!W4 (?I3 PRECOND-OF E709.SK))
		(!W5 (?P1 POSTCOND-OF E709.SK))
		(!W6 (E709.SK (BEFORE NOW173)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 35:
	; "The cow left the barn."
	; "It went out to the field."
	; "The other cows were out in the field."
	; "The cow found a spot of grass."
	; "The cow ate the grass."
; best schemas are:
; SEARCH.V
; FIND.V
; TRAVEL.V
; EAT.V
; FEED.V
(setf matches (append matches '(( (3.6352296 3)
("The cow left the barn." "It went out to the field."
 "The other cows were out in the field." "The cow found a spot of grass."
 "The cow ate the grass.")
(EPI-SCHEMA ((COW714.SK FIND.562.V SPOT728.SK) ** E724.SK)
	(:ROLES
		(!R1 (COW714.SK AGENT.N))
		(!R2 (FIELD719.SK LOCATION.N))
		(!R3 (COW714.SK COW.N))
		(!R4 (SPOT728.SK (OF.P (K GRASS.N))))
		(!R5 (SPOT728.SK SPOT.N))
		(!R6 (E724.SK (RIGHT-AFTER U177)))
		(!R7 (FIELD719.SK FIELD.N))
	)
	(:PRECONDS
		(?I1 (COW714.SK (AT.P FIELD719.SK)))
		(?I2 (SPOT728.SK (AT.P FIELD719.SK)))
		(?I3 (COW714.SK ((ADV-A (FOR.P SPOT728.SK)) SEARCH.V)))
		(?I4 (NOT (COW714.SK (KNOW.V (THAT (SPOT728.SK (AT.P FIELD719.SK)))))))
		(?I5 (NOT (COW714.SK (HAVE.V SPOT728.SK))))
	)
	(:POSTCONDS
		(?P1 (COW714.SK (KNOW.V (THAT (SPOT728.SK (AT.P FIELD719.SK))))))
		(?P2 (COW714.SK (HAVE.V SPOT728.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E724.SK (SAME-TIME NOW178)))
		(!W2 (E731.SK (BEFORE NOW178)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.6352296 2)
("The cow left the barn." "It went out to the field."
 "The other cows were out in the field." "The cow found a spot of grass."
 "The cow ate the grass.")
(EPI-SCHEMA ((COW714.SK
              (OUT.ADV
               ((ADV-A (TO.P FIELD719.SK)) ((ADV-A (FROM.P ?L1)) GO.563.V)))
              FIELD719.SK)
             ** E720.SK)
	(:ROLES
		(!R1 (COW714.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (FIELD719.SK LOCATION.N))
		(!R4 (NOT (?L1 = FIELD719.SK)))
		(!R5 (COW714.SK COW.N))
		(!R6 (FIELD719.SK FIELD.N))
	)
	(:GOALS
		(?G1 (COW714.SK (WANT.V (KA ((ADV-A (AT.P FIELD719.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (COW714.SK (AT.P ?L1)))
		(?I2 (NOT (COW714.SK (AT.P FIELD719.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT (COW714.SK (AT.P ?L1))))
		(?P2 (COW714.SK (AT.P FIELD719.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E720.SK))
		(!W2 (?I2 BEFORE E720.SK))
		(!W3 (?P1 AFTER E720.SK))
		(!W4 (?P2 AFTER E720.SK))
		(!W5 (?G1 CAUSE-OF E720.SK))
		(!W6 (E720.SK (BEFORE NOW176)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.4049997 4)
("The cow left the barn." "It went out to the field."
 "The other cows were out in the field." "The cow found a spot of grass."
 "The cow ate the grass.")
(EPI-SCHEMA ((COW714.SK EAT.564.V GRASS735.SK) ** E732.SK)
	(:ROLES
		(!R1 (COW714.SK AGENT.N))
		(!R2 (GRASS735.SK FOOD.N))
		(!R3 (COW714.SK COW.N))
		(!R4 (GRASS735.SK GRASS.N))
		(!R5 (E732.SK (RIGHT-AFTER U178)))
	)
	(:GOALS
		(?G1 (COW714.SK (WANT.V (THAT (NOT (COW714.SK HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 (COW714.SK HAVE.V GRASS735.SK))
		(?I2 (COW714.SK HUNGRY.A))
	)
	(:POSTCONDS
		(?P1 (NOT (COW714.SK (HAVE.V GRASS735.SK))))
		(?P2 (NOT (COW714.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E732.SK))
		(!W2 (?I1 BEFORE E732.SK))
		(!W3 (E732.SK CAUSE-OF ?P1))
		(!W4 (E732.SK (SAME-TIME NOW179)))
		(!W5 (E736.SK (BEFORE NOW179)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; found chains:
; 	chain 0:
;		((COW714.SK
     ;(OUT.ADV ((ADV-A (TO.P FIELD719.SK)) ((ADV-A (FROM.P ?L1)) GO.563.V)))
     ;FIELD719.SK)
    ;** E720.SK)
;		((COW714.SK FIND.562.V SPOT728.SK) ** E724.SK)
;		((COW714.SK EAT.564.V GRASS735.SK) ** E732.SK)
;learned chain schema:
(setf chain-matches (append chain-matches (list '(EPI-SCHEMA ((?X_C
                                                               GO_FIND_EAT.566.PR
                                                               ?X_A ?X_B ?X_D)
                                                              ** ?E)
	(:ROLES
		(!R1 (?X_A FIELD.N))
		(!R2 (?X_B (OF.P (K GRASS.N))))
		(!R3 (?X_B SPOT.N))
		(!R4 (?X_C COW.N))
		(!R5 (?X_D FOOD.N))
		(!R6 (?X_D GRASS.N))
	)
	(:PRECONDS
		(?I1 (?X_C (AT.P ?L1_2)))
		(?I2 (NOT (?X_C (AT.P ?X_A))))
	)
	(:STEPS
		(?E1
   (?X_C (OUT.ADV ((ADV-A (TO.P ?X_A)) ((ADV-A (FROM.P ?L1)) GO.563.V))) ?X_A))
		(?E2 (?X_C FIND.562.V ?X_B))
		(?E3 (?X_C EAT.564.V ?X_D))
	)
	(:POSTCONDS
		(?P1 (NOT (?X_C (HAVE.V ?X_D))))
		(?P2 (NOT (?X_C HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE ?E2))
		(!W2 (?E2 BEFORE ?E3))
	)
)
)))
; story 36:
	; "Shelley wanted a new cat."
	; "She went to the pet store."
	; "She found a nice cat."
	; "Shelley bought the cat and things for the cat."
	; "She loved her cat."
; best schemas are:
; SEARCH.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (3.405 3)
("Shelley wanted a new cat." "She went to the pet store."
 "She found a nice cat." "Shelley bought the cat and things for the cat."
 "She loved her cat.")
(EPI-SCHEMA ((CAT742.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE748.SK)) GO.591.V))
              STORE748.SK)
             ** E749.SK)
	(:ROLES
		(!R1 (CAT742.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE748.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE748.SK)))
		(!R5 (CAT742.SK CAT.N))
		(!R6 (CAT742.SK NEW.A))
		(!R7 (STORE748.SK ((NN PET.N) STORE.N)))
		(!R8 (CAT755.SK CAT.N))
		(!R9 (CAT755.SK NICE.A))
		(!R10 (CAT755.SK (PERTAIN-TO CAT742.SK)))
	)
	(:GOALS
		(?G1 (CAT742.SK (WANT.V (KA ((ADV-A (AT.P STORE748.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT742.SK (AT.P ?L1)))
		(?I2 (NOT (CAT742.SK (AT.P STORE748.SK))))
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
		(!W6 (E749.SK (BEFORE NOW181)))
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
; best schemas are:
; SEARCH.V
; FIND.V
; RECEIVING_VERB.?
; TRAVEL.V
; PLAY.V
(setf matches (append matches '(( (2.405 0)
("A girl went to play with her friends." "She went across the street."
 "The parents went over to get her." "She was lost."
 "They found her in their home.")
(EPI-SCHEMA ((GIRL765.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FRIEND769.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.658.V)))
              ?L2)
             ** E770.SK)
	(:ROLES
		(!R1 (GIRL765.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND769.SK (PLUR FRIEND.N)))
		(!R6 (FRIEND769.SK HOME.N))
		(!R7 (FRIEND769.SK (PERTAIN-TO GIRL765.SK)))
		(!R8 (GIRL765.SK GIRL.N))
		(!R9 (FRIEND769.SK (PERTAIN-TO THEY.PRO)))
	)
	(:GOALS
		(?G1 (GIRL765.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL765.SK (AT.P ?L1)))
		(?I2 (NOT (GIRL765.SK (AT.P ?L2))))
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
		(!W6 (E770.SK (BEFORE NOW185)))
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
; best schemas are:
; RECEIVING_VERB.?
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; EAT.V
(setf matches (append matches '(( (5.0 2)
("Fred wanted a phone." "He never had had one before."
 "So he went and got one." "But when he turned it on it didn't work."
 "He was duped.")
(EPI-SCHEMA ((FRED.NAME GET.672.V PRED?797.SK (AT.P-ARG ?L)) ** E799.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (PRED?797.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (FRED.NAME = PRED?797.SK)))
		(!R5 (PHONE787.SK PHONE.N))
		(!R6 (PRED?797.SK PRED?.N))
		(!R7 (E800.SK (AT-OR-BEFORE NOW192)))
	)
	(:GOALS
		(E790.SK (FRED.NAME (WANT.V (THAT (FRED.NAME (HAVE.V PRED?797.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (FRED.NAME HAVE.V PRED?797.SK)))
		(?I2 (FRED.NAME (AT.P ?L)))
		(?I3 (PRED?797.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (FRED.NAME HAVE.V PRED?797.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E799.SK))
		(!W2 (?I1 PRECOND-OF E799.SK))
		(!W3 (?I2 PRECOND-OF E799.SK))
		(!W4 (?I3 PRECOND-OF E799.SK))
		(!W5 (?P1 POSTCOND-OF E799.SK))
		(!W6 (E790.SK (BEFORE NOW190)))
		(!W7 (E798.SK (CONSEC E799.SK)))
		(!W8 (E799.SK (DURING E795.SK)))
		(!W9 (E798.SK (DURING E795.SK)))
		(!W10 (E795.SK (BEFORE NOW192)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.5 1)
("Fred wanted a phone." "He never had had one before."
 "So he went and got one." "But when he turned it on it didn't work."
 "He was duped.")
(EPI-SCHEMA ((FRED.NAME ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.673.V))
              ?L2)
             ** E798.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (PHONE787.SK PHONE.N))
		(!R6 (E800.SK (AT-OR-BEFORE NOW192)))
	)
	(:GOALS
		(E790.SK (FRED.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P ?L2))))
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
		(!W6 (E790.SK (BEFORE NOW190)))
		(!W7 (E798.SK (CONSEC E799.SK)))
		(!W8 (E799.SK (DURING E795.SK)))
		(!W9 (E798.SK (DURING E795.SK)))
		(!W10 (E795.SK (BEFORE NOW192)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; found chains:
; 	chain 0:
;		((FRED.NAME ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L)) GO.673.V)) ?L) **
    ;E798.SK)
;		((FRED.NAME GET.672.V PRED?797.SK (AT.P-ARG ?L2)) ** E799.SK)
;learned chain schema:
(setf chain-matches (append chain-matches (list '(EPI-SCHEMA ((?X_A
                                                               GO_GET_NIL.677.PR
                                                               ?L ?X_B)
                                                              ** ?E)
	(:ROLES
		(!R1 (?X_B INANIMATE_OBJECT.N))
		(!R2 (?X_B PRED?.N))
		(!R3 (NOT (?X_A = ?X_B)))
		(!R4 (?X_A AGENT.N))
	)
	(:PRECONDS
		(?I1 (?X_A (AT.P ?L1_2)))
		(?I2 (NOT (?X_A (AT.P ?L))))
	)
	(:STEPS
		(?E1 (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L)) GO.673.V)) ?L))
		(?E2 (?X_A GET.672.V ?X_B (AT.P-ARG ?L2)))
	)
	(:POSTCONDS
		(?P1 (?X_A HAVE.V ?X_B))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 BEFORE ?E2))
	)
)
)))
; story 39:
	; "Logan is going to the park."
	; "He plays in the sand."
	; "He runs all around the grass."
	; "He climbs and climbs."
	; "He swings very high."
; best schemas are:
; TRAVEL.V
; PLAY.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
(setf matches (append matches '(( (3.7302296 2)
("Logan is going to the park." "He plays in the sand."
 "He runs all around the grass." "He climbs and climbs." "He swings very high.")
(EPI-SCHEMA ((LOGAN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P PARK806.SK)) GO.678.V))
              PARK806.SK)
             ** E805.SK)
	(:ROLES
		(!R1 (LOGAN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (PARK806.SK LOCATION.N))
		(!R4 (NOT (?L1 = PARK806.SK)))
		(!R5 (PARK806.SK PARK.N))
	)
	(:GOALS
		(?G1 (LOGAN.NAME (WANT.V (KA ((ADV-A (AT.P PARK806.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LOGAN.NAME (AT.P ?L1)))
		(?I2 (NOT (LOGAN.NAME (AT.P PARK806.SK))))
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
		(!W6 (E805.SK (AT-ABOUT NOW195)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 2)
("Logan is going to the park." "He plays in the sand."
 "He runs all around the grass." "He climbs and climbs." "He swings very high.")
(EPI-SCHEMA ((LOGAN.NAME
              ((ADV-A (IN.P SAND808.SK)) ((ADV-A (WITH.P ?T)) PLAY.679.V)) ?G)
             ** E809.SK)
	(:ROLES
		(!R1 (LOGAN.NAME AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (?G GAME.N))
		(!R5 (SAND808.SK SAND.N))
	)
	(:GOALS
		(?G1 (LOGAN.NAME (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (LOGAN.NAME HAVE.V ?T))
	)
	(:POSTCONDS
		(?P1 (LOGAN.NAME EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E809.SK (AT-ABOUT NOW196)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; TRAVEL.V
; GIVE.V
; RECEIVING_VERB.?

; story 41:
	; "The boy got ready for church."
	; "He did not want to go."
	; "He hid in his closet."
	; "His mom found him."
	; "His mom made him go to church."
; best schemas are:
; SEARCH.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?

; story 42:
	; "The fly landed on the wall."
	; "The man tried to hit it."
	; "The fly got away."
	; "The man woke up his son."
	; "His son got the fly."
; best schemas are:
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (2.405 0)
("The fly landed on the wall." "The man tried to hit it." "The fly got away."
 "The man woke up his son." "His son got the fly.")
(EPI-SCHEMA ((FLY858.SK (AWAY.ADV GET.713.V) ?O (AT.P-ARG ?L)) ** E876.SK)
	(:ROLES
		(!R1 (FLY858.SK AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (FLY858.SK = ?O)))
		(!R5 (FLY858.SK FLY.N))
	)
	(:GOALS
		(?G1 (FLY858.SK (WANT.V (THAT (FLY858.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (NOT (FLY858.SK HAVE.V ?O)))
		(?I2 (FLY858.SK (AT.P ?L)))
		(?I3 (?O (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (FLY858.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E876.SK))
		(!W2 (?I1 PRECOND-OF E876.SK))
		(!W3 (?I2 PRECOND-OF E876.SK))
		(!W4 (?I3 PRECOND-OF E876.SK))
		(!W5 (?P1 POSTCOND-OF E876.SK))
		(!W6 (E876.SK (BEFORE NOW212)))
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
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V

; story 44:
	; "There was a penny on the ground."
	; "My son went to pick it up."
	; "I told him not to get it."
	; "The penny was lying tails up."
	; "We left the penny right there."
; best schemas are:
; TRAVEL.V
; MAKE.V
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (2.405 0)
("There was a penny on the ground." "My son went to pick it up."
 "I told him not to get it." "The penny was lying tails up."
 "We left the penny right there.")
(EPI-SCHEMA ((SON913.SK
              ((ADV-A (FOR.P (KA (PICK_UP.V PENNY910.SK))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.742.V)))
              ?L2)
             ** E912.SK)
	(:ROLES
		(!R1 (SON913.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (PENNY910.SK PENNY.N))
		(!R6 (SON913.SK SON.N))
		(!R7 (PENNY910.SK (ON.P GROUND911.SK)))
		(!R8 (GROUND911.SK GROUND.N))
		(!R9 (E912.SK (RIGHT-AFTER U220)))
		(!R10 (SON913.SK (PERTAIN-TO ME921.SK)))
		(!R11 (ME921.SK AGENT.N))
	)
	(:GOALS
		(?G1 (SON913.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SON913.SK (AT.P ?L1)))
		(?I2 (NOT (SON913.SK (AT.P ?L2))))
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
		(!W6 (E912.SK (SAME-TIME NOW221)))
		(!W7 (E915.SK (BEFORE NOW221)))
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
; best schemas are:
; SEARCH.V
; FIND.V
; PUT_IN_CONTAINER.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
(setf matches (append matches '(( (2.405 0)
("The man found a bag on the ground." "He looked inside." "It was groceries."
 "He brought them home." "He made his wife dinner with them.")
(EPI-SCHEMA ((MAN930.SK ((ADV-A (ON.P GROUND933.SK)) FIND.773.V) BAG932.SK) **
             E929.SK)
	(:ROLES
		(!R1 (MAN930.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (GROUND933.SK GROUND.N))
		(!R4 (BAG932.SK BAG.N))
		(!R5 (MAN930.SK MAN.N))
		(!R6 (E929.SK (RIGHT-AFTER U224)))
		(!R7 (WIFE946.SK (PERTAIN-TO MAN930.SK)))
		(!R8 (WIFE946.SK WIFE.N))
	)
	(:PRECONDS
		(?I1 (MAN930.SK (AT.P ?L)))
		(?I2 (BAG932.SK (AT.P ?L)))
		(?I3 (MAN930.SK ((ADV-A (FOR.P BAG932.SK)) SEARCH.V)))
		(?I4 (NOT (MAN930.SK (KNOW.V (THAT (BAG932.SK (AT.P ?L)))))))
		(?I5 (NOT (MAN930.SK (HAVE.V BAG932.SK))))
	)
	(:POSTCONDS
		(?P1 (MAN930.SK (KNOW.V (THAT (BAG932.SK (AT.P ?L))))))
		(?P2 (MAN930.SK (HAVE.V BAG932.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E929.SK (SAME-TIME NOW225)))
		(!W2 (E935.SK (BEFORE NOW225)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 46:
	; "I have a cat."
	; "My cat is very mean."
	; "It does not like my other cats."
	; "It fights with my other cats."
	; "I might have to get rid of it."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 47:
	; "I went to the store today."
	; "I saw some chips."
	; "They were six dollars."
	; "It was too expensive."
	; "So I did not buy them."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (1.53125 1)
("I went to the store today." "I saw some chips." "They were six dollars."
 "It was too expensive." "So I did not buy them.")
(EPI-SCHEMA ((ME980.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.804.V
              (KA (BUY.V CHIP974.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA (BUY.V CHIP974.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ME980.SK AGENT.N))
		(!R4 (CHIP974.SK (PLUR CHIP.N)))
	)
	(:GOALS
		(?G1 (ME980.SK (WANT.V (THAT (NOT (ME980.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME980.SK (DO.V (KA (BUY.V CHIP974.SK))))) CAUSE-OF
    (KE (ME980.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E979.SK (NOT (ME980.SK (DO.V (KA (BUY.V CHIP974.SK))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E979.SK))
		(!W2 (E979.SK (BEFORE NOW239)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.5 3)
("I went to the store today." "I saw some chips." "They were six dollars."
 "It was too expensive." "So I did not buy them.")
(EPI-SCHEMA ((ME980.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TODAY969.SK)) GO.806.V))
              TODAY969.SK)
             ** E970.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (TODAY969.SK LOCATION.N))
		(!R3 (NOT (?L1 = TODAY969.SK)))
		(!R4 (TODAY969.SK ((NN STORE.N) TODAY.N)))
		(!R5 (ME980.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME980.SK (WANT.V (KA ((ADV-A (AT.P TODAY969.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME980.SK (AT.P ?L1)))
		(?I2 (NOT (ME980.SK (AT.P TODAY969.SK))))
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
		(!W6 (E970.SK (BEFORE NOW235)))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 49:
	; "Jacob has long hair."
	; "He wants to get it cut."
	; "He heads down to the barber."
	; "He has his hair cut."
	; "Jacob loves his new hair."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 50:
	; "I wanted to run twenty miles after work."
	; "I had to hurry."
	; "It was about to be dark."
	; "I made it to 12 miles."
	; "Then I had to stop."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 51:
	; "Lynn gets a new dog."
	; "She loves her dog."
	; "She is out one evening walking him."
	; "Her dog runs off away from her."
	; "She cannot catch him and he runs away."
; best schemas are:
; RECEIVING_VERB.?
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; EAT.V
(setf matches (append matches '(( (4.0 3)
("Lynn gets a new dog." "She loves her dog."
 "She is out one evening walking him." "Her dog runs off away from her."
 "She cannot catch him and he runs away.")
(EPI-SCHEMA ((LYNN.NAME GET.826.V DOG1025.SK (AT.P-ARG ?L)) ** E1026.SK)
	(:ROLES
		(!R1 (LYNN.NAME AGENT.N))
		(!R2 (DOG1025.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (LYNN.NAME = DOG1025.SK)))
		(!R5 (DOG1025.SK DOG.N))
		(!R6 (DOG1025.SK NEW.A))
		(!R7 (DOG1030.SK (PERTAIN-TO LYNN.NAME)))
		(!R8 (DOG1030.SK DOG.N))
		(!R9 (EVENING1035.SK (WALK.V LYNN.NAME)))
		(!R10 (EVENING1035.SK EVENING.N))
	)
	(:GOALS
		(?G1 (LYNN.NAME (WANT.V (THAT (LYNN.NAME (HAVE.V DOG1025.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (LYNN.NAME HAVE.V DOG1025.SK)))
		(?I2 (LYNN.NAME (AT.P ?L)))
		(?I3 (DOG1025.SK (AT.P ?L)))
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
		(!W6 (E1026.SK (AT-ABOUT NOW255)))
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

; story 53:
	; "Susie tried on the dress."
	; "She found it very uncomfortable."
	; "She wasn't sure she wanted to even wear it."
	; "Susie put it away."
	; "She never wore it again."
; best schemas are:

; story 54:
	; "It was very hot outside."
	; "So we wanted to go where it was cool."
	; "We walked into the building."
	; "But then we walked out."
	; "The building was far too cold."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.5 0)
("It was very hot outside." "So we wanted to go where it was cool."
 "We walked into the building." "But then we walked out."
 "The building was far too cold.")
(EPI-SCHEMA ((WE1071.SK
              ((ADV-A (INTO.P BUILDING1065.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) WALK.847.V)))
              ?L2)
             ** E1066.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (WE1071.SK AGENT.N))
		(!R5 (BUILDING1065.SK BUILDING.N))
	)
	(:GOALS
		(?G1 (WE1071.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (WE1071.SK (AT.P ?L1)))
		(?I2 (NOT (WE1071.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (WE1071.SK (AT.P ?L1))))
		(?P2 (WE1071.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1066.SK))
		(!W2 (?I2 BEFORE E1066.SK))
		(!W3 (?P1 AFTER E1066.SK))
		(!W4 (?P2 AFTER E1066.SK))
		(!W5 (?G1 CAUSE-OF E1066.SK))
		(!W6 (E1066.SK (BEFORE NOW272)))
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
; best schemas are:
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (4.0 3)
("Sam's cat ran away one day." "Sam never got along with it."
 "He tried to look for a day or two." "Sam quickly gave up the search."
 "He got a new cat instead.")
(EPI-SCHEMA ((HE.PRO GET.848.V CAT1090.SK (AT.P-ARG ?L)) ** E1091.SK)
	(:ROLES
		(!R1 (CAT1090.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = CAT1090.SK)))
		(!R4 (CAT1090.SK CAT.N))
		(!R5 (CAT1090.SK NEW.A))
		(!R6 (HE.PRO MALE.A))
		(!R7 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V CAT1090.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V CAT1090.SK)))
		(?I2 (HE.PRO (AT.P ?L)))
		(?I3 (CAT1090.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V CAT1090.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1091.SK))
		(!W2 (?I1 PRECOND-OF E1091.SK))
		(!W3 (?I2 PRECOND-OF E1091.SK))
		(!W4 (?I3 PRECOND-OF E1091.SK))
		(!W5 (?P1 POSTCOND-OF E1091.SK))
		(!W6 (E1091.SK (BEFORE NOW279)))
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
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
(setf matches (append matches '(( (2.5 0)
("Tom was out for a walk." "It started to rain." "His socks got wet."
 "Tom felt gross about it." "He went home and changed.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A HOME.N)
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.866.V)))
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
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P ?L2))))
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
		(!W6 (E1100.SK (BEFORE NOW284)))
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
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; PLAY.V
; PUT_IN_CONTAINER.V
(setf matches (append matches '(( (2.5 0)
("Tim got in the car." "He started the car." "He turned out of his street."
 "He saw a red light." "He stopped.")
(EPI-SCHEMA ((TIM.NAME ((ADV-A (IN.P CAR1104.SK)) GET.870.V) ?O (AT.P-ARG ?L))
             ** E1106.SK)
	(:ROLES
		(!R1 (TIM.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TIM.NAME = ?O)))
		(!R5 (CAR1104.SK CAR.N))
		(!R6 (STREET1111.SK (PERTAIN-TO TIM.NAME)))
		(!R7 (STREET1111.SK STREET.N))
	)
	(:GOALS
		(?G1 (TIM.NAME (WANT.V (THAT (TIM.NAME (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (NOT (TIM.NAME HAVE.V ?O)))
		(?I2 (TIM.NAME (AT.P ?L)))
		(?I3 (?O (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (TIM.NAME HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1106.SK))
		(!W2 (?I1 PRECOND-OF E1106.SK))
		(!W3 (?I2 PRECOND-OF E1106.SK))
		(!W4 (?I3 PRECOND-OF E1106.SK))
		(!W5 (?P1 POSTCOND-OF E1106.SK))
		(!W6 (E1106.SK (BEFORE NOW285)))
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
; best schemas are:
; SEARCH.V
; FIND.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (2.405 0)
("The man found the answer." "He told everyone he could."
 "People did not like the answer." "They got angry at the man."
 "They hung the man in the street.")
(EPI-SCHEMA ((MAN1120.SK FIND.888.V ANSWER1122.SK) ** E1119.SK)
	(:ROLES
		(!R1 (MAN1120.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (ANSWER1122.SK ANSWER.N))
		(!R4 (MAN1120.SK MAN.N))
		(!R5 (E1119.SK (RIGHT-AFTER U289)))
		(!R6 (STREET1134.SK STREET.N))
		(!R7 (MAN1120.SK (IN.P STREET1134.SK)))
	)
	(:PRECONDS
		(?I1 (MAN1120.SK (AT.P ?L)))
		(?I2 (ANSWER1122.SK (AT.P ?L)))
		(?I3 (MAN1120.SK ((ADV-A (FOR.P ANSWER1122.SK)) SEARCH.V)))
		(?I4 (NOT (MAN1120.SK (KNOW.V (THAT (ANSWER1122.SK (AT.P ?L)))))))
		(?I5 (NOT (MAN1120.SK (HAVE.V ANSWER1122.SK))))
	)
	(:POSTCONDS
		(?P1 (MAN1120.SK (KNOW.V (THAT (ANSWER1122.SK (AT.P ?L))))))
		(?P2 (MAN1120.SK (HAVE.V ANSWER1122.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1119.SK (SAME-TIME NOW290)))
		(!W2 (E1124.SK (BEFORE NOW290)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 59:
	; "I took it the harness off the cat."
	; "The cat did not want to go back inside."
	; "I took the cat outside."
	; "We bought the cat a harness."
	; "The cat always liked to go outside."
; best schemas are:
; RECEIVING_VERB.?
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; EAT.V
(setf matches (append matches '(( (4.0 3)
("I took it the harness off the cat." "The cat did not want to go back inside."
 "I took the cat outside." "We bought the cat a harness."
 "The cat always liked to go outside.")
(EPI-SCHEMA ((ME1159.SK ((ADV-A (OFF.P CAT1139.SK)) TAKE.895.V) IT.PRO
              (AT.P-ARG ?L))
             ** E1140.SK)
	(:ROLES
		(!R1 (IT.PRO INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1159.SK = IT.PRO)))
		(!R4 (CAT1139.SK CAT.N))
		(!R5 (HARNESS1138.SK HARNESS.N))
		(!R6 (ME1159.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME1159.SK (WANT.V (THAT (ME1159.SK (HAVE.V IT.PRO))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1159.SK HAVE.V IT.PRO)))
		(?I2 (ME1159.SK (AT.P ?L)))
		(?I3 (IT.PRO (AT.P ?L)))
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
		(!W6 (E1140.SK (BEFORE NOW295)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.43625 1)
("I took it the harness off the cat." "The cat did not want to go back inside."
 "I took the cat outside." "We bought the cat a harness."
 "The cat always liked to go outside.")
(EPI-SCHEMA ((CAT1139.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.897.V
              (KA (WANT.V (KA (INSIDE.ADV (BACK.ADV GO.V))))))
             ** ?E)
	(:ROLES
		(!R1 (CAT1139.SK AGENT.N))
		(!R2 ((KA (WANT.V (KA (INSIDE.ADV (BACK.ADV GO.V))))) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (CAT1139.SK CAT.N))
	)
	(:GOALS
		(?G1 (CAT1139.SK (WANT.V (THAT (NOT (CAT1139.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (CAT1139.SK (DO.V (KA (WANT.V (KA (INSIDE.ADV (BACK.ADV GO.V))))))))
    CAUSE-OF (KE (CAT1139.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1144.SK
   (NOT (CAT1139.SK (DO.V (KA (WANT.V (KA (INSIDE.ADV (BACK.ADV GO.V)))))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1144.SK))
		(!W2 (E1144.SK (BEFORE NOW296)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
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
; GIVE.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.5 0)
("I used to run around a pond." "It was there one fall."
 "The next fall it had vanished." "There was nothing but dirt."
 "I was surprised.")
(EPI-SCHEMA ((ME1172.SK
              ((ADV-A (FOR.P (KA ((ADV-A (AROUND.P OBJECT1161.SK)) RUN.V))))
               ((ADV-A (TO.P ME1172.SK)) GIVE.902.V))
              ME1172.SK ?O)
             ** E1162.SK)
	(:ROLES
		(!R1 (?O INANIMATE_OBJECT.N))
		(!R2 (ME1172.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME1172.SK (WANT.V (THAT (ME1172.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (ME1172.SK HAVE.V ?O))
		(?I2 (NOT (ME1172.SK HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (ME1172.SK HAVE.V ?O)))
		(?P2 (ME1172.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1162.SK (BEFORE NOW300)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 61:
	; "My dog was dreaming."
	; "It was lying on the floor."
	; "Then it jumped up quickly."
	; "My dog let out a bark."
	; "I had never seen her do that before."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 62:
	; "My brother had a goldfish."
	; "The fish let him pet it."
	; "He put his finger in the water."
	; "The fish swam up to him."
	; "And he pet the fish."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 63:
	; "Bob loves to fish."
	; "He got up early one morning."
	; "He got his fishing pole ready."
	; "Next he walked to the lake."
	; "Bob caught a big fish."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (3.5 3)
("Bob loves to fish." "He got up early one morning."
 "He got his fishing pole ready." "Next he walked to the lake."
 "Bob caught a big fish.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P LAKE1216.SK)) WALK.1063.V))
              LAKE1216.SK)
             ** E1217.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (LAKE1216.SK LOCATION.N))
		(!R3 (NOT (?L1 = LAKE1216.SK)))
		(!R4 (HE.PRO MALE.A))
		(!R5 (HE.PRO AGENT.N))
		(!R6 (LAKE1216.SK LAKE.N))
		(!R7 (POLE1214.SK ((NN FISHING.N) POLE.N)))
		(!R8 (POLE1214.SK (PERTAIN-TO HE.PRO)))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P LAKE1216.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P ?L1)))
		(?I2 (NOT (HE.PRO (AT.P LAKE1216.SK))))
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
		(!W6 (E1217.SK (BEFORE NOW318)))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 65:
	; "I was hanging out with my friend."
	; "He pulled in front of my car."
	; "I went off the road."
	; "There was mud flying."
	; "Then I got back in front."
; best schemas are:
; TRAVEL.V
; PUT_IN_CONTAINER.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (2.405 0)
("I was hanging out with my friend." "He pulled in front of my car."
 "I went off the road." "There was mud flying." "Then I got back in front.")
(EPI-SCHEMA ((FRIEND1237.SK
              ((ADV-A (OFF.P ROAD1244.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.1084.V)))
              ?L2)
             ** E1245.SK)
	(:ROLES
		(!R1 (FRIEND1237.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND1237.SK FRIEND.N))
		(!R6 (ROAD1244.SK ROAD.N))
		(!R7 (FRIEND1237.SK (PERTAIN-TO ME.PRO)))
		(!R8 (CAR1241.SK (PERTAIN-TO ME.PRO)))
		(!R9 (CAR1241.SK CAR.N))
	)
	(:GOALS
		(?G1 (FRIEND1237.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND1237.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND1237.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND1237.SK (AT.P ?L1))))
		(?P2 (FRIEND1237.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1245.SK))
		(!W2 (?I2 BEFORE E1245.SK))
		(!W3 (?P1 AFTER E1245.SK))
		(!W4 (?P2 AFTER E1245.SK))
		(!W5 (?G1 CAUSE-OF E1245.SK))
		(!W6 (E1245.SK (BEFORE NOW327)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 67:
	; "Tom used to have his own boat."
	; "He had to sell it."
	; "Now he just comes out on my boat."
	; "We have such a great time together."
	; "Now I have someone to help me clean my boat."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 68:
	; "The man was crying."
	; "His friend asked why."
	; "The man would not answer."
	; "The friend asked again."
	; "The man lashed out in anger."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 69:
	; "The man smiled."
	; "The woman noticed."
	; "The woman smiled back."
	; "The man did not notice."
	; "The woman felt silly."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (1.43625 1)
("The man smiled." "The woman noticed." "The woman smiled back."
 "The man did not notice." "The woman felt silly.")
(EPI-SCHEMA ((MAN1291.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1136.V
              (KA NOTICE.V))
             ** ?E)
	(:ROLES
		(!R1 (MAN1291.SK AGENT.N))
		(!R2 ((KA NOTICE.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (MAN1291.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN1291.SK (WANT.V (THAT (NOT (MAN1291.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN1291.SK (DO.V (KA NOTICE.V)))) CAUSE-OF
    (KE (MAN1291.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1298.SK (NOT (MAN1291.SK (DO.V (KA NOTICE.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1298.SK))
		(!W2 (E1298.SK (BEFORE NOW348)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 70:
	; "The man shook his head."
	; "The woman asked why."
	; "The man would not answer."
	; "The woman walked away."
	; "The man looked dejected."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 71:
	; "Last week we had a beach day."
	; "It was great."
	; "I was really looking forward to it."
	; "When we went it was very hot."
	; "I jumped in right away."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 72:
	; "The girl blinked her eyes."
	; "The boy blinked back at her."
	; "This was a game they had."
	; "The game could not stay tied."
	; "The girl blinked back at the boy."
; best schemas are:
; PLAY.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 73:
	; "The kids went out in the rain."
	; "They become very wet."
	; "One of the kids got too cold."
	; "The kids went back inside."
	; "They all dried off."
; best schemas are:
; TRAVEL.V

; story 74:
	; "My friends and I were running."
	; "I was behind the group."
	; "I sprinted to try to catch up."
	; "They all ran faster than me."
	; "I came in last place."
; best schemas are:
; TRAVEL.V
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (2.5 0)
("My friends and I were running." "I was behind the group."
 "I sprinted to try to catch up." "They all ran faster than me."
 "I came in last place.")
(EPI-SCHEMA ((ME1371.SK
              ((ADV-A (FOR.P (KA (TRY.V (KA CATCH_UP.V)))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) SPRINT.1181.V)))
              ?L2)
             ** E1366.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (ME1371.SK AGENT.N))
		(!R5 (FRIEND1362.SK (PLUR FRIEND.N)))
		(!R6 (FRIEND1362.SK (PERTAIN-TO ME1371.SK)))
	)
	(:GOALS
		(?G1 (ME1371.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1371.SK (AT.P ?L1)))
		(?I2 (NOT (ME1371.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (ME1371.SK (AT.P ?L1))))
		(?P2 (ME1371.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1366.SK))
		(!W2 (?I2 BEFORE E1366.SK))
		(!W3 (?P1 AFTER E1366.SK))
		(!W4 (?P2 AFTER E1366.SK))
		(!W5 (?G1 CAUSE-OF E1366.SK))
		(!W6 (E1366.SK (BEFORE NOW372)))
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
; EAT.V
; FEED.V
; SEARCH.V
; FIND.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
(setf matches (append matches '(( (3.5 2)
("I was eating with my friends." "We were about to go to someone's house."
 "I was out of gas." "And I did not know the way." "They had to wait on me.")
(EPI-SCHEMA ((ME1383.SK ((ADV-A (WITH.P FRIEND1375.SK)) EAT.1200.V) ?F) **
             E1373.SK)
	(:ROLES
		(!R1 (?F FOOD.N))
		(!R2 (FRIEND1375.SK (PLUR FRIEND.N)))
		(!R3 (FRIEND1375.SK (PERTAIN-TO ME1383.SK)))
		(!R4 (ME1383.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME1383.SK (WANT.V (THAT (NOT (ME1383.SK HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 (ME1383.SK HAVE.V ?F))
		(?I2 (ME1383.SK HUNGRY.A))
	)
	(:POSTCONDS
		(?P1 (NOT (ME1383.SK (HAVE.V ?F))))
		(?P2 (NOT (ME1383.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E1373.SK))
		(!W2 (?I1 BEFORE E1373.SK))
		(!W3 (E1373.SK CAUSE-OF ?P1))
		(!W4 (E1373.SK (BEFORE NOW375)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 76:
	; "Tom was dogsitting for a friend."
	; "He accidentally let it out."
	; "The dog ran away."
	; "It was never seen again."
	; "Tom had to buy them a new dog."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 77:
	; "Allie went to the store."
	; "She saw candy on sale."
	; "It looked great."
	; "She got sour candy."
	; "She got five bags."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
; PLAY.V
; EAT.V
; FEED.V
(setf matches (append matches '(( (3.5 3)
("Allie went to the store." "She saw candy on sale." "It looked great."
 "She got sour candy." "She got five bags.")
(EPI-SCHEMA ((ALLIE.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE1396.SK)) GO.1220.V))
              STORE1396.SK)
             ** E1397.SK)
	(:ROLES
		(!R1 (ALLIE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE1396.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE1396.SK)))
		(!R5 (STORE1396.SK STORE.N))
	)
	(:GOALS
		(?G1 (ALLIE.NAME (WANT.V (KA ((ADV-A (AT.P STORE1396.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ALLIE.NAME (AT.P ?L1)))
		(?I2 (NOT (ALLIE.NAME (AT.P STORE1396.SK))))
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
		(!W6 (E1397.SK (BEFORE NOW385)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 78:
	; "Suzy got a new sweatshirt."
	; "She was not sure she liked it."
	; "Sure enough, she did not."
	; "It was too big."
	; "Suzy wanted to give it away."
; best schemas are:
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (5.103306 1)
("Suzy got a new sweatshirt." "She was not sure she liked it."
 "Sure enough, she did not." "It was too big." "Suzy wanted to give it away.")
(EPI-SCHEMA ((SUZY.NAME GET.1224.V SWEATSHIRT1407.SK (AT.P-ARG ?L)) ** E1408.SK)
	(:ROLES
		(!R1 (SUZY.NAME AGENT.N))
		(!R2 (SWEATSHIRT1407.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (SUZY.NAME = SWEATSHIRT1407.SK)))
		(!R5 (SWEATSHIRT1407.SK SWEATSHIRT.N))
		(!R6 (SWEATSHIRT1407.SK NEW.A))
	)
	(:GOALS
		(E1414.SK (SUZY.NAME (WANT.V (THAT (SUZY.NAME (HAVE.V SWEATSHIRT1407.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SUZY.NAME HAVE.V SWEATSHIRT1407.SK)))
		(?I2 (SUZY.NAME (AT.P ?L)))
		(?I3 (SWEATSHIRT1407.SK (AT.P ?L)))
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
		(!W6 (E1408.SK (BEFORE NOW390)))
		(!W7 (E1414.SK (BEFORE NOW394)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; TRAVEL.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (2.5 0)
("I once saw a wolf." "I was walking in the woods when I saw him."
 "He was patrolling the woods." "He was so big." "I ran home very quickly.")
(EPI-SCHEMA ((ME1428.SK
              (VERY.ADV
               (QUICKLY.ADV
                (HOME.ADV
                 ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.1234.V)))))
              ?L2)
             ** E1427.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (ME1428.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME1428.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1428.SK (AT.P ?L1)))
		(?I2 (NOT (ME1428.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (ME1428.SK (AT.P ?L1))))
		(?P2 (ME1428.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1427.SK))
		(!W2 (?I2 BEFORE E1427.SK))
		(!W3 (?P1 AFTER E1427.SK))
		(!W4 (?P2 AFTER E1427.SK))
		(!W5 (?G1 CAUSE-OF E1427.SK))
		(!W6 (E1427.SK (BEFORE NOW399)))
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
; SIT.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?

; story 81:
	; "The man planted a tree."
	; "The tree grew to be very tall."
	; "One day their was a big storm."
	; "A branch fell from the tree."
	; "It broke a window of the man's house."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 82:
	; "I went to the beach yesterday."
	; "I laid in a hammock."
	; "It was very relaxing."
	; "I fell asleep."
	; "I never wanted to go."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (3.5 3)
("I went to the beach yesterday." "I laid in a hammock."
 "It was very relaxing." "I fell asleep." "I never wanted to go.")
(EPI-SCHEMA ((ME1472.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P BEACH1463.SK)) ((ADV-A (FROM.P ?L1)) GO.1241.V)))
              BEACH1463.SK)
             ** E1464.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (BEACH1463.SK LOCATION.N))
		(!R3 (NOT (?L1 = BEACH1463.SK)))
		(!R4 (ME1472.SK AGENT.N))
		(!R5 (BEACH1463.SK BEACH.N))
	)
	(:GOALS
		(?G1 (ME1472.SK (WANT.V (KA ((ADV-A (AT.P BEACH1463.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1472.SK (AT.P ?L1)))
		(?I2 (NOT (ME1472.SK (AT.P BEACH1463.SK))))
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
		(!W6 (E1464.SK (BEFORE NOW410)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 84:
	; "John found a kid crying on a bench."
	; "John wanted to cheer him up."
	; "John bought him ice cream."
	; "The kid smiled."
	; "John made a new friend."
; best schemas are:
; MAKE.V
; SEARCH.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; SIT.V
; PLAY.V
(setf matches (append matches '(( (3.5 2)
("John found a kid crying on a bench." "John wanted to cheer him up."
 "John bought him ice cream." "The kid smiled." "John made a new friend.")
(EPI-SCHEMA ((JOHN.NAME ((ADV-A (WITH.P ?T)) PLAY.1257.V) FRIEND1505.SK) **
             E1506.SK)
	(:ROLES
		(!R1 (JOHN.NAME AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (FRIEND1505.SK GAME.N))
		(!R5 (FRIEND1505.SK FRIEND.N))
		(!R6 (FRIEND1505.SK NEW.A))
	)
	(:GOALS
		(E1496.SK (JOHN.NAME (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (JOHN.NAME HAVE.V ?T))
	)
	(:POSTCONDS
		(?P1 (JOHN.NAME EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E1496.SK (BEFORE NOW421)))
		(!W3 (E1506.SK (BEFORE NOW424)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
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
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
(setf matches (append matches '(( (2.405 1)
("The couple worked out." "The woman felt dizzy." "The man sat down with her."
 "The woman felt sick." "The woman threw up on the man.")
(EPI-SCHEMA ((MAN1513.SK
              ((ADV-A (WITH.P SHE.PRO))
               (DOWN.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.1258.V)))))
             ** E1512.SK)
	(:ROLES
		(!R1 (MAN1513.SK AGENT.N))
		(!R2 (?S INANIMATE_OBJECT.N))
		(!R3 (?S FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (MAN1513.SK MAN.N))
		(!R6 (SHE.PRO FEMALE.A))
		(!R7 (SHE.PRO AGENT.N))
		(!R8 (E1512.SK (RIGHT-AFTER U426)))
	)
	(:GOALS
		(?G1 (MAN1513.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (MAN1513.SK (AT.P ?L)))
		(?I2 (?S (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1512.SK (SAME-TIME NOW427)))
		(!W2 (E1515.SK (BEFORE NOW427)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 86:
	; "The man went fishing."
	; "He caught more than his limit."
	; "He kept all of the fish."
	; "He got caught with too many fish."
	; "He had to pay a big fine."
; best schemas are:
; RECEIVING_VERB.?
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; EAT.V
(setf matches (append matches '(( (3.905 3)
("The man went fishing." "He caught more than his limit."
 "He kept all of the fish." "He got caught with too many fish."
 "He had to pay a big fine.")
(EPI-SCHEMA ((MAN1525.SK GET.1260.V
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
		(!R1 (MAN1525.SK AGENT.N))
		(!R2
   ((KA
     ((ADV-A
       (WITH.P
        (K
         (L #:G1792470
          (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
      (BE.PASV CATCH.V)))
    INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4
   (NOT
    (MAN1525.SK =
     (KA
      ((ADV-A
        (WITH.P
         (K
          (L #:G1792470
           (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
       (BE.PASV CATCH.V))))))
		(!R5 (MAN1525.SK MAN.N))
		(!R6 (LIMIT1530.SK LIMIT.N))
		(!R7 (LIMIT1530.SK (PERTAIN-TO MAN1525.SK)))
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
            (K
             (L #:G1792470
              (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
          (BE.PASV CATCH.V)))))))))
	)
	(:PRECONDS
		(?I1
   (NOT
    (MAN1525.SK HAVE.V
     (KA
      ((ADV-A
        (WITH.P
         (K
          (L #:G1792470
           (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
       (BE.PASV CATCH.V))))))
		(?I2 (MAN1525.SK (AT.P ?L)))
		(?I3
   ((KA
     ((ADV-A
       (WITH.P
        (K
         (L #:G1792470
          (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
      (BE.PASV CATCH.V)))
    (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1
   (MAN1525.SK HAVE.V
    (KA
     ((ADV-A
       (WITH.P
        (K
         (L #:G1792470
          (AND (#:G1792470 (TOO.ADV MANY.A)) (#:G1792470 FISH.N))))))
      (BE.PASV CATCH.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1534.SK))
		(!W2 (?I1 PRECOND-OF E1534.SK))
		(!W3 (?I2 PRECOND-OF E1534.SK))
		(!W4 (?I3 PRECOND-OF E1534.SK))
		(!W5 (?P1 POSTCOND-OF E1534.SK))
		(!W6 (E1534.SK (BEFORE NOW433)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.405 3)
("The man went fishing." "He caught more than his limit."
 "He kept all of the fish." "He got caught with too many fish."
 "He had to pay a big fine.")
(EPI-SCHEMA ((MAN1525.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K FISHING.N))) GO.1261.V))
              (K FISHING.N))
             ** E1524.SK)
	(:ROLES
		(!R1 (MAN1525.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K FISHING.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K FISHING.N))))
		(!R5 (MAN1525.SK MAN.N))
		(!R6 (E1524.SK (RIGHT-AFTER U429)))
		(!R7 (LIMIT1530.SK LIMIT.N))
		(!R8 (LIMIT1530.SK (PERTAIN-TO MAN1525.SK)))
	)
	(:GOALS
		(?G1 (MAN1525.SK (WANT.V (KA ((ADV-A (AT.P (K FISHING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1525.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1525.SK (AT.P (K FISHING.N)))))
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
		(!W6 (E1524.SK (SAME-TIME NOW430)))
		(!W7 (E1527.SK (BEFORE NOW430)))
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
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.5 0)
("We went in a hike in the woods by my house." "The trees were very high."
 "My brother climbed one of the trees." "We told him to get down."
 "He fell from the tree.")
(EPI-SCHEMA ((WE1562.SK
              ((ADV-A (IN.P HIKE1542.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.1272.V)))
              ?L2)
             ** E1546.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (WE1562.SK AGENT.N))
		(!R5 (HIKE1542.SK HIKE.N))
	)
	(:GOALS
		(?G1 (WE1562.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (WE1562.SK (AT.P ?L1)))
		(?I2 (NOT (WE1562.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (WE1562.SK (AT.P ?L1))))
		(?P2 (WE1562.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1546.SK))
		(!W2 (?I2 BEFORE E1546.SK))
		(!W3 (?P1 AFTER E1546.SK))
		(!W4 (?P2 AFTER E1546.SK))
		(!W5 (?G1 CAUSE-OF E1546.SK))
		(!W6 (E1546.SK (BEFORE NOW435)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 89:
	; "I was sitting in my chair."
	; "I leaned back a little too far."
	; "I heard a tiny crack."
	; "I looked down at my chair."
	; "One of the legs had a crack."
; best schemas are:
; SIT.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V

; story 90:
	; "The boy kicked the rock."
	; "The rock came loose."
	; "It fell down a hill side."
	; "Someone was walking up the hill."
	; "The rock almost hit them."
; best schemas are:
; TRAVEL.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
; FIND.V

; story 91:
	; "A new teacher had a bad class."
	; "The children threw paper."
	; "The paper hit the teacher."
	; "She turned back at the class."
	; "She told them to shut up and sit down."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 92:
	; "The baby started to cry."
	; "The mother walked over to the baby."
	; "She saw that the baby was hungry."
	; "She breastfed the baby."
	; "The baby went back to sleep."
; best schemas are:
; TRAVEL.V
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (2.405 0)
("The baby started to cry." "The mother walked over to the baby."
 "She saw that the baby was hungry." "She breastfed the baby."
 "The baby went back to sleep.")
(EPI-SCHEMA ((BABY1640.SK
              ((ADV-A (FOR.P (KA SLEEP.V)))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.1338.V)))
              ?L2)
             ** E1654.SK)
	(:ROLES
		(!R1 (BABY1640.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (BABY1640.SK BABY.N))
		(!R6 (E1654.SK (RIGHT-AFTER U463)))
	)
	(:GOALS
		(?G1 (BABY1640.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BABY1640.SK (AT.P ?L1)))
		(?I2 (NOT (BABY1640.SK (AT.P ?L2))))
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
		(!W6 (E1654.SK (SAME-TIME NOW464)))
		(!W7 (E1657.SK (BEFORE NOW464)))
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
; RECEIVING_VERB.?
; PUT_IN_CONTAINER.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V

; story 94:
	; "The man ran out of gas."
	; "He tried to call for help."
	; "His phone would not work."
	; "He walked ten miles."
	; "He found a gas station."
; best schemas are:
; SEARCH.V
; FIND.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (2.405 0)
("The man ran out of gas." "He tried to call for help."
 "His phone would not work." "He walked ten miles." "He found a gas station.")
(EPI-SCHEMA ((MAN1676.SK FIND.1361.V STATION1685.SK) ** E1686.SK)
	(:ROLES
		(!R1 (MAN1676.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (MAN1676.SK MAN.N))
		(!R4 (STATION1685.SK ((NN GAS.N) STATION.N)))
		(!R5 (PHONE1680.SK PHONE.N))
		(!R6 (PHONE1680.SK (PERTAIN-TO MAN1676.SK)))
	)
	(:PRECONDS
		(?I1 (MAN1676.SK (AT.P ?L)))
		(?I2 (STATION1685.SK (AT.P ?L)))
		(?I3 (MAN1676.SK ((ADV-A (FOR.P STATION1685.SK)) SEARCH.V)))
		(?I4 (NOT (MAN1676.SK (KNOW.V (THAT (STATION1685.SK (AT.P ?L)))))))
		(?I5 (NOT (MAN1676.SK (HAVE.V STATION1685.SK))))
	)
	(:POSTCONDS
		(?P1 (MAN1676.SK (KNOW.V (THAT (STATION1685.SK (AT.P ?L))))))
		(?P2 (MAN1676.SK (HAVE.V STATION1685.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1686.SK (BEFORE NOW474)))
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
; SEARCH.V
; FIND.V
; RECEIVING_VERB.?
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V

; story 96:
	; "The bird caught a worm."
	; "It took the worm to its nest."
	; "It fed the worm to a baby bird."
	; "The baby bird was still hungry."
	; "The bird caught another worm."
; best schemas are:
; EAT.V
; FEED.V
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (3.905 3)
("The bird caught a worm." "It took the worm to its nest."
 "It fed the worm to a baby bird." "The baby bird was still hungry."
 "The bird caught another worm.")
(EPI-SCHEMA ((BIRD1703.SK ((ADV-A (TO.P NEST1711.SK)) TAKE.1391.V) WORM1705.SK
              (AT.P-ARG ?L))
             ** E1712.SK)
	(:ROLES
		(!R1 (BIRD1703.SK AGENT.N))
		(!R2 (WORM1705.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (BIRD1703.SK = WORM1705.SK)))
		(!R5 (WORM1705.SK WORM.N))
		(!R6 (BIRD1703.SK BIRD.N))
		(!R7 (NEST1711.SK (PERTAIN-TO BIRD1703.SK)))
		(!R8 (NEST1711.SK NEST.N))
	)
	(:GOALS
		(?G1 (BIRD1703.SK (WANT.V (THAT (BIRD1703.SK (HAVE.V WORM1705.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (BIRD1703.SK HAVE.V WORM1705.SK)))
		(?I2 (BIRD1703.SK (AT.P ?L)))
		(?I3 (WORM1705.SK (AT.P ?L)))
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
		(!W6 (E1712.SK (BEFORE NOW481)))
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
; TRAVEL.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
; FIND.V
(setf matches (append matches '(( (3.5 3)
("Today I went to school." "It was the first day of school."
 "I met all my new teachers." "I got all of my homework."
 "I went home from school.")
(EPI-SCHEMA ((ME1736.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K SCHOOL.N))) GO.1411.V))
              (K SCHOOL.N))
             ** E1727.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K SCHOOL.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K SCHOOL.N))))
		(!R4 (ME1736.SK AGENT.N))
		(!R5 (OBJECT1731.SK (PERTAIN-TO ME1736.SK)))
	)
	(:GOALS
		(?G1 (ME1736.SK (WANT.V (KA ((ADV-A (AT.P (K SCHOOL.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1736.SK (AT.P ?L1)))
		(?I2 (NOT (ME1736.SK (AT.P (K SCHOOL.N)))))
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
		(!W6 (E1727.SK (BEFORE NOW485)))
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
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; SIT.V
; SEARCH.V

; story 99:
	; "The tree started to grow."
	; "It was in another tree's shadow."
	; "It needed more sun."
	; "One day the other tree fell."
	; "The tree grew quickly then."
; best schemas are:
; TRAVEL.V

; story 0:
	; "Mary wanted to stop working."
	; "She was tired of working."
	; "She met a man with a lot of money."
	; "She married him."
	; "She never had to work again."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 1:
	; "Susie say a girl was playing ball."
	; "She wanted to play with her too."
	; "So she went ahead and asked for permission."
	; "The girl said no."
	; "Susie then started to cry."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.405 0)
("Susie say a girl was playing ball." "She wanted to play with her too."
 "So she went ahead and asked for permission." "The girl said no."
 "Susie then started to cry.")
(EPI-SCHEMA ((GIRL26.SK
              (AHEAD.ADV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.6.V)))
              ?L2)
             ** E30.SK)
	(:ROLES
		(!R1 (GIRL26.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (GIRL26.SK GIRL.N))
		(!R6 (E35.SK (AT-OR-BEFORE NOW7)))
	)
	(:GOALS
		(?G1 (GIRL26.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (GIRL26.SK (AT.P ?L1)))
		(?I2 (NOT (GIRL26.SK (AT.P ?L2))))
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
		(!W6 (E30.SK (CONSEC E34.SK)))
		(!W7 (E34.SK (DURING E28.SK)))
		(!W8 (E30.SK (DURING E28.SK)))
		(!W9 (E28.SK (BEFORE NOW7)))
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
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 3:
	; "The man went to a cafeteria."
	; "He got his lunch."
	; "He sat down by himself."
	; "A woman asked if she could sit down."
	; "The woman became a new friend."
; best schemas are:
; SIT.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V
; FEED.V
(setf matches (append matches '(( (2.5461133 2)
("The man went to a cafeteria." "He got his lunch." "He sat down by himself."
 "A woman asked if she could sit down." "The woman became a new friend.")
(EPI-SCHEMA ((MAN75.SK
              ((ADV-A (BY.P MAN75.SK))
               (DOWN.ADV
                ((ADV-A (IN.P CAFETERIA77.SK))
                 ((ADV-A (ON.P CAFETERIA77.SK)) SIT.49.V)))))
             ** E87.SK)
	(:ROLES
		(!R1 (MAN75.SK AGENT.N))
		(!R2 (CAFETERIA77.SK INANIMATE_OBJECT.N))
		(!R3 (CAFETERIA77.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (MAN75.SK MAN.N))
		(!R6 (LUNCH83.SK (PERTAIN-TO MAN75.SK)))
		(!R7 (LUNCH83.SK LUNCH.N))
		(!R8 (CAFETERIA77.SK CAFETERIA.N))
		(!R9 (CAFETERIA77.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (MAN75.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (MAN75.SK (AT.P ?L)))
		(?I2 (CAFETERIA77.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E87.SK (BEFORE NOW17)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R3 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 3)
("The man went to a cafeteria." "He got his lunch." "He sat down by himself."
 "A woman asked if she could sit down." "The woman became a new friend.")
(EPI-SCHEMA ((MAN75.SK GET.50.V LUNCH83.SK (AT.P-ARG ?L)) ** E84.SK)
	(:ROLES
		(!R1 (MAN75.SK AGENT.N))
		(!R2 (LUNCH83.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAN75.SK = LUNCH83.SK)))
		(!R5 (MAN75.SK MAN.N))
		(!R6 (LUNCH83.SK (PERTAIN-TO MAN75.SK)))
		(!R7 (LUNCH83.SK LUNCH.N))
	)
	(:GOALS
		(?G1 (MAN75.SK (WANT.V (THAT (MAN75.SK (HAVE.V LUNCH83.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN75.SK HAVE.V LUNCH83.SK)))
		(?I2 (MAN75.SK (AT.P ?L)))
		(?I3 (LUNCH83.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (MAN75.SK HAVE.V LUNCH83.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E84.SK))
		(!W2 (?I1 PRECOND-OF E84.SK))
		(!W3 (?I2 PRECOND-OF E84.SK))
		(!W4 (?I3 PRECOND-OF E84.SK))
		(!W5 (?P1 POSTCOND-OF E84.SK))
		(!W6 (E84.SK (BEFORE NOW16)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.405 3)
("The man went to a cafeteria." "He got his lunch." "He sat down by himself."
 "A woman asked if she could sit down." "The woman became a new friend.")
(EPI-SCHEMA ((MAN75.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P CAFETERIA77.SK)) GO.51.V))
              CAFETERIA77.SK)
             ** E74.SK)
	(:ROLES
		(!R1 (MAN75.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (CAFETERIA77.SK LOCATION.N))
		(!R4 (NOT (?L1 = CAFETERIA77.SK)))
		(!R5 (CAFETERIA77.SK CAFETERIA.N))
		(!R6 (MAN75.SK MAN.N))
		(!R7 (E74.SK (RIGHT-AFTER U14)))
		(!R8 (LUNCH83.SK (PERTAIN-TO MAN75.SK)))
		(!R9 (LUNCH83.SK LUNCH.N))
	)
	(:GOALS
		(?G1 (MAN75.SK (WANT.V (KA ((ADV-A (AT.P CAFETERIA77.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN75.SK (AT.P ?L1)))
		(?I2 (NOT (MAN75.SK (AT.P CAFETERIA77.SK))))
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
		(!W6 (E74.SK (SAME-TIME NOW15)))
		(!W7 (E78.SK (BEFORE NOW15)))
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
; best schemas are:
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
(setf matches (append matches '(( (2.6632652 2)
("I was sitting in the house." "The garbage started to smell."
 "It was very bad." "So I had to take it out."
 "It still did not get rid of the smell.")
(EPI-SCHEMA ((ME113.SK
              ((ADV-A (ON.P HOUSE105.SK))
               ((ADV-A (IN.P HOUSE105.SK)) SIT.65.V)))
             ** E104.SK)
	(:ROLES
		(!R1 (HOUSE105.SK INANIMATE_OBJECT.N))
		(!R2 (HOUSE105.SK FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (HOUSE105.SK HOUSE.N))
		(!R5 (HOUSE105.SK ARTIFACT.N))
		(!R6 (ME113.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME113.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (ME113.SK (AT.P ?L)))
		(?I2 (HOUSE105.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E104.SK (BEFORE NOW20)))
	)
	(:CERTAINTIES
		(!C1 (!R5 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R2 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R4 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 5:
	; "Susie got lost."
	; "She needed a map."
	; "So she looked through her pocket."
	; "She found an old map."
	; "She was relieved."
; best schemas are:
; SEARCH.V
; FIND.V
; PUT_IN_CONTAINER.V
; TRAVEL.V

; story 6:
	; "Susie loved chocolate."
	; "So she got a box."
	; "She then decided to go and eat it."
	; "It tasted bad."
	; "She was not happy about it."
; best schemas are:
; RECEIVING_VERB.?
; PUT_IN_CONTAINER.V
(setf matches (append matches '(( (4.163265 2)
("Susie loved chocolate." "So she got a box."
 "She then decided to go and eat it." "It tasted bad."
 "She was not happy about it.")
(EPI-SCHEMA ((SUSIE.NAME GET.79.V BOX143.SK (AT.P-ARG ?L)) ** E144.SK)
	(:ROLES
		(!R1 (SUSIE.NAME AGENT.N))
		(!R2 (BOX143.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (SUSIE.NAME = BOX143.SK)))
		(!R5 (BOX143.SK BOX.N))
	)
	(:GOALS
		(?G1 (SUSIE.NAME (WANT.V (THAT (SUSIE.NAME (HAVE.V BOX143.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SUSIE.NAME HAVE.V BOX143.SK)))
		(?I2 (SUSIE.NAME (AT.P ?L)))
		(?I3 (BOX143.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (SUSIE.NAME HAVE.V BOX143.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E144.SK))
		(!W2 (?I1 PRECOND-OF E144.SK))
		(!W3 (?I2 PRECOND-OF E144.SK))
		(!W4 (?I3 PRECOND-OF E144.SK))
		(!W5 (?P1 POSTCOND-OF E144.SK))
		(!W6 (E144.SK (BEFORE NOW31)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 7:
	; "The man was in the dark."
	; "He looked for a flashlight."
	; "He could not find one."
	; "He became frightened."
	; "The power came back on in five minutes."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 8:
	; "Jerry has a mouse."
	; "His wife wants to get a cat."
	; "Jerry said no."
	; "His wife got a cat behind his back."
	; "The cat and mouse are best friends."
; best schemas are:
; RECEIVING_VERB.?
; GIVE.V
; EAT.V
; FEED.V
; PLAY.V
(setf matches (append matches '(( (4.9049997 2)
("Jerry has a mouse." "His wife wants to get a cat." "Jerry said no."
 "His wife got a cat behind his back." "The cat and mouse are best friends.")
(EPI-SCHEMA ((WIFE182.SK GET.88.V CAT191.SK (AT.P-ARG ?L)) ** E192.SK)
	(:ROLES
		(!R1 (WIFE182.SK AGENT.N))
		(!R2 (CAT191.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (WIFE182.SK = CAT191.SK)))
		(!R5 (CAT191.SK CAT.N))
		(!R6 (E187.SK (RIGHT-AFTER U42)))
		(!R7 (WIFE182.SK WIFE.N))
		(!R8 (CAT184.SK CAT.N))
		(!R9 (WIFE182.SK (PERTAIN-TO JERRY.NAME)))
		(!R10 (E181.SK (RIGHT-AFTER U40)))
	)
	(:GOALS
		(E181.SK (WIFE182.SK (WANT.V (THAT (WIFE182.SK (HAVE.V CAT191.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (WIFE182.SK HAVE.V CAT191.SK)))
		(?I2 (WIFE182.SK (AT.P ?L)))
		(?I3 (CAT191.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (WIFE182.SK HAVE.V CAT191.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E192.SK))
		(!W2 (?I1 PRECOND-OF E192.SK))
		(!W3 (?I2 PRECOND-OF E192.SK))
		(!W4 (?I3 PRECOND-OF E192.SK))
		(!W5 (?P1 POSTCOND-OF E192.SK))
		(!W6 (E192.SK (BEFORE NOW43)))
		(!W7 (E187.SK (SAME-TIME NOW43)))
		(!W8 (E181.SK (SAME-TIME NOW41)))
		(!W9 (E185.SK (AT-ABOUT NOW41)))
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
; best schemas are:
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (3.5682652 4)
("The singer worked hard." "She got better." "People noticed her."
 "She made an album." "The people bought it.")
(EPI-SCHEMA ((SINGER195.SK MAKE.100.V ALBUM200.SK) ** E201.SK)
	(:ROLES
		(!R1 (SINGER195.SK AGENT.N))
		(!R2 (ALBUM200.SK INANIMATE_OBJECT.N))
		(!R3 (SINGER195.SK SINGER.N))
		(!R4 (ALBUM200.SK ALBUM.N))
	)
	(:GOALS
		(?G1 (SINGER195.SK (WANT.V (THAT (ALBUM200.SK EXIST.V)))))
		(?G2 (SINGER195.SK (WANT.V (KA (HAVE.V ALBUM200.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (ALBUM200.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (ALBUM200.SK EXIST.V))
		(?P2 (SINGER195.SK (HAVE.V ALBUM200.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E201.SK (BEFORE NOW48)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 3)
("The singer worked hard." "She got better." "People noticed her."
 "She made an album." "The people bought it.")
(EPI-SCHEMA ((SINGER195.SK ((ADV-A (WITH.P ?T)) PLAY.103.V) ALBUM200.SK) **
             E201.SK)
	(:ROLES
		(!R1 (SINGER195.SK AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (ALBUM200.SK GAME.N))
		(!R5 (SINGER195.SK SINGER.N))
		(!R6 (ALBUM200.SK ALBUM.N))
	)
	(:GOALS
		(?G1 (SINGER195.SK (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (SINGER195.SK HAVE.V ?T))
	)
	(:POSTCONDS
		(?P1 (SINGER195.SK EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E201.SK (BEFORE NOW48)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
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
; RECEIVING_VERB.?
; SEARCH.V
; FIND.V
; TRAVEL.V
; GIVE.V

; story 11:
	; "Tom was in a band."
	; "They had very few fans."
	; "They tried to hold a show."
	; "Half a dozen people showed up."
	; "Tom's band still played their heart out."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 12:
	; "My son was outside playing."
	; "His best friend came by the house."
	; "They went off on an adventure."
	; "They were gone for quite some time."
	; "They came home before dark."
; best schemas are:
; TRAVEL.V
; PLAY.V
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (2.405 0)
("My son was outside playing." "His best friend came by the house."
 "They went off on an adventure." "They were gone for quite some time."
 "They came home before dark.")
(EPI-SCHEMA ((FRIEND250.SK
              ((ADV-A (BY.P HOUSE252.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.126.V)))
              ?L2)
             ** E249.SK)
	(:ROLES
		(!R1 (FRIEND250.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND250.SK FRIEND.N))
		(!R6 (FRIEND250.SK BEST.A))
		(!R7 (HOUSE252.SK HOUSE.N))
		(!R8 (FRIEND250.SK (PERTAIN-TO ME263.SK)))
		(!R9 (ME263.SK AGENT.N))
		(!R10 (E249.SK (RIGHT-AFTER U60)))
		(!R11 (SON247.SK SON.N))
		(!R12 (SON247.SK (PERTAIN-TO ME263.SK)))
	)
	(:GOALS
		(?G1 (FRIEND250.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND250.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND250.SK (AT.P ?L2))))
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
		(!W6 (E249.SK (SAME-TIME NOW61)))
		(!W7 (E256.SK (BEFORE NOW61)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 14:
	; "Jill bought a new dress."
	; "She tried it on when she got home."
	; "The dress didn't fit."
	; "Jill couldn't find the receipt."
	; "Jill gave the dress to one of her friends."
; best schemas are:
; GIVE.V
; FEED.V

; story 15:
	; "I was walking my dog."
	; "I let go of the leash."
	; "I ran after her."
	; "I got a cut on my thigh from a branch."
	; "I still have the scar."
; best schemas are:
; RECEIVING_VERB.?
; GIVE.V
; EAT.V
; FEED.V
; PLAY.V
(setf matches (append matches '(( (6.0 2)
("I was walking my dog." "I let go of the leash." "I ran after her."
 "I got a cut on my thigh from a branch." "I still have the scar.")
(EPI-SCHEMA ((ME337.SK ((ADV-A (FROM.P BRANCH330.SK)) GET.218.V) CUT332.SK
              (AT.P-ARG ?L))
             ** E333.SK)
	(:ROLES
		(!R1 (CUT332.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME337.SK = CUT332.SK)))
		(!R4 (CUT332.SK CUT.N))
		(!R5 (BRANCH330.SK BRANCH.N))
		(!R6 (ME337.SK AGENT.N))
		(!R7 (SCAR335.SK SCAR.N))
		(!R8 (DOG322.SK (PERTAIN-TO ME337.SK)))
		(!R9 (DOG322.SK DOG.N))
	)
	(:GOALS
		(?G1 (ME337.SK (WANT.V (THAT (ME337.SK (HAVE.V CUT332.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME337.SK HAVE.V CUT332.SK)))
		(?I2 (ME337.SK (AT.P ?L)))
		(?I3 (CUT332.SK (AT.P ?L)))
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
		(!W6 (E333.SK (BEFORE NOW78)))
		(!W7 (E336.SK (AT-ABOUT NOW79)))
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
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.405 0)
("The man looked outside." "It was sunny." "The man decided to go for a job."
 "It started raining." "The man ran home.")
(EPI-SCHEMA ((MAN339.SK
              (HOME.ADV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.227.V)))
              ?L2)
             ** E350.SK)
	(:ROLES
		(!R1 (MAN339.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (MAN339.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN339.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN339.SK (AT.P ?L1)))
		(?I2 (NOT (MAN339.SK (AT.P ?L2))))
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
		(!W6 (E350.SK (BEFORE NOW84)))
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
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 18:
	; "One time I ran out of gas."
	; "Someone saw me."
	; "He went to buy gas for me."
	; "He told me to pay it forward."
	; "I appreciated that."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?

; story 19:
	; "Sam was feeling bad."
	; "He wasn't sure what it was."
	; "A friend suggested drinking more water."
	; "Sam gave it a try."
	; "It made him feel a bit better."
; best schemas are:
; GIVE.V
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 20:
	; "We ordered some food."
	; "It was kind of gross."
	; "It was not what I expected."
	; "I had to throw it away."
	; "I never got it again."
; best schemas are:
; EAT.V
; FEED.V
; DRINK.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V

; story 21:
	; "Kelsi was engaged."
	; "She just got a new ring."
	; "She was happy about it."
	; "But it was too small."
	; "She had to get another one."
; best schemas are:
; RECEIVING_VERB.?
(setf matches (append matches '(( (4.0 3)
("Kelsi was engaged." "She just got a new ring." "She was happy about it."
 "But it was too small." "She had to get another one.")
(EPI-SCHEMA ((KELSI.NAME GET.254.V RING427.SK (AT.P-ARG ?L)) ** E428.SK)
	(:ROLES
		(!R1 (KELSI.NAME AGENT.N))
		(!R2 (RING427.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (KELSI.NAME = RING427.SK)))
		(!R5 (RING427.SK RING.N))
		(!R6 (RING427.SK NEW.A))
	)
	(:GOALS
		(?G1 (KELSI.NAME (WANT.V (THAT (KELSI.NAME (HAVE.V RING427.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (KELSI.NAME HAVE.V RING427.SK)))
		(?I2 (KELSI.NAME (AT.P ?L)))
		(?I3 (RING427.SK (AT.P ?L)))
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
		(!W6 (E428.SK (BEFORE NOW106)))
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
; best schemas are:
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (3.905 3)
("The janitor needed to clean his mop." "He took it to the sink."
 "He got it out." "He washed it." "He put it away.")
(EPI-SCHEMA ((JANITOR437.SK ((ADV-A (TO.P SINK442.SK)) TAKE.255.V) IT450.SK
              (AT.P-ARG ?L))
             ** E443.SK)
	(:ROLES
		(!R1 (JANITOR437.SK AGENT.N))
		(!R2 (IT450.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (JANITOR437.SK = IT450.SK)))
		(!R5 (JANITOR437.SK JANITOR.N))
		(!R6 (SINK442.SK SINK.N))
		(!R7 (PRED?440.SK (PERTAIN-TO JANITOR437.SK)))
		(!R8 (PRED?440.SK PRED?.N))
	)
	(:GOALS
		(?G1 (JANITOR437.SK (WANT.V (THAT (JANITOR437.SK (HAVE.V IT450.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (JANITOR437.SK HAVE.V IT450.SK)))
		(?I2 (JANITOR437.SK (AT.P ?L)))
		(?I3 (IT450.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (JANITOR437.SK HAVE.V IT450.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E443.SK))
		(!W2 (?I1 PRECOND-OF E443.SK))
		(!W3 (?I2 PRECOND-OF E443.SK))
		(!W4 (?I3 PRECOND-OF E443.SK))
		(!W5 (?P1 POSTCOND-OF E443.SK))
		(!W6 (E443.SK (BEFORE NOW111)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 24:
	; "It was the girl's first day at school."
	; "She was very nervous."
	; "She went into the classroom."
	; "She saw her friend."
	; "She sat next to her friend."
; best schemas are:
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
; PLAY.V
; GIVE.V
(setf matches (append matches '(( (2.6632652 2)
("It was the girl's first day at school." "She was very nervous."
 "She went into the classroom." "She saw her friend."
 "She sat next to her friend.")
(EPI-SCHEMA ((SHE.PRO
              ((ADV-A NEXT.A (TO.P FRIEND470.SK))
               ((ADV-A (IN.P CLASSROOM464.SK))
                ((ADV-A (ON.P CLASSROOM464.SK)) SIT.274.V))))
             ** E472.SK)
	(:ROLES
		(!R1 (CLASSROOM464.SK INANIMATE_OBJECT.N))
		(!R2 (CLASSROOM464.SK FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (SHE.PRO FEMALE.A))
		(!R5 (SHE.PRO AGENT.N))
		(!R6 (FRIEND470.SK (PERTAIN-TO SHE.PRO)))
		(!R7 (FRIEND470.SK FRIEND.N))
		(!R8 (CLASSROOM464.SK CLASSROOM.N))
		(!R9 (CLASSROOM464.SK ARTIFACT.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (SHE.PRO (AT.P ?L)))
		(?I2 (CLASSROOM464.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E472.SK (BEFORE NOW124)))
	)
	(:CERTAINTIES
		(!C1 (!R9 CERTAIN-TO-DEGREE (/ 2 2)))
		(!C2 (!R2 CERTAIN-TO-DEGREE (/ 1 2)))
		(!C3 (!R8 CERTAIN-TO-DEGREE (/ 1 2)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("It was the girl's first day at school." "She was very nervous."
 "She went into the classroom." "She saw her friend."
 "She sat next to her friend.")
(EPI-SCHEMA ((SHE.PRO
              ((ADV-A (INTO.P CLASSROOM464.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.276.V)))
              ?L2)
             ** E466.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (SHE.PRO FEMALE.A))
		(!R5 (SHE.PRO AGENT.N))
		(!R6 (CLASSROOM464.SK CLASSROOM.N))
		(!R7 (FRIEND470.SK (PERTAIN-TO SHE.PRO)))
		(!R8 (FRIEND470.SK FRIEND.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SHE.PRO (AT.P ?L1)))
		(?I2 (NOT (SHE.PRO (AT.P ?L2))))
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
		(!W6 (E466.SK (BEFORE NOW122)))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 26:
	; "Susan had a new phone."
	; "She was walking in the woods one day."
	; "She lost her phone."
	; "She got upset."
	; "Then she found it later."
; best schemas are:
; SEARCH.V
; FIND.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.5 0)
("Susan had a new phone." "She was walking in the woods one day."
 "She lost her phone." "She got upset." "Then she found it later.")
(EPI-SCHEMA ((SUSAN.NAME (LATER.ADV FIND.319.V) PHONE494.SK) ** E508.SK)
	(:ROLES
		(!R1 (SUSAN.NAME AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (PHONE494.SK NEW.A))
		(!R4 (PHONE494.SK PHONE.N))
		(!R5 (PHONE494.SK (PERTAIN-TO SUSAN.NAME)))
	)
	(:PRECONDS
		(?I1 (SUSAN.NAME (AT.P ?L)))
		(?I2 (PHONE494.SK (AT.P ?L)))
		(?I3 (SUSAN.NAME ((ADV-A (FOR.P PHONE494.SK)) SEARCH.V)))
		(?I4 (NOT (SUSAN.NAME (KNOW.V (THAT (PHONE494.SK (AT.P ?L)))))))
		(?I5 (NOT (SUSAN.NAME (HAVE.V PHONE494.SK))))
	)
	(:POSTCONDS
		(?P1 (SUSAN.NAME (KNOW.V (THAT (PHONE494.SK (AT.P ?L))))))
		(E495.SK (SUSAN.NAME (HAVE.V PHONE494.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E495.SK (BEFORE NOW130)))
		(!W2 (E508.SK (BEFORE NOW134)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 27:
	; "Susie had the flu."
	; "It made her feel groggy."
	; "So she had to call in sick."
	; "Thankfully work let her off."
	; "But she only got one day."
; best schemas are:
; RECEIVING_VERB.?
; GIVE.V
; EAT.V
; FEED.V
; PLAY.V
(setf matches (append matches '(( (4.0 3)
("Susie had the flu." "It made her feel groggy." "So she had to call in sick."
 "Thankfully work let her off." "But she only got one day.")
(EPI-SCHEMA ((SHE.PRO GET.333.V DAY515.SK (AT.P-ARG ?L)) ** E516.SK)
	(:ROLES
		(!R1 (DAY515.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (SHE.PRO = DAY515.SK)))
		(!R4 (DAY515.SK DAY.N))
		(!R5 (SHE.PRO FEMALE.A))
		(!R6 (SHE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (SHE.PRO (HAVE.V DAY515.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SHE.PRO HAVE.V DAY515.SK)))
		(?I2 (SHE.PRO (AT.P ?L)))
		(?I3 (DAY515.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (SHE.PRO HAVE.V DAY515.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E516.SK))
		(!W2 (?I1 PRECOND-OF E516.SK))
		(!W3 (?I2 PRECOND-OF E516.SK))
		(!W4 (?I3 PRECOND-OF E516.SK))
		(!W5 (?P1 POSTCOND-OF E516.SK))
		(!W6 (E516.SK (BEFORE NOW139)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 28:
	; "The man poured a glass of water."
	; "He looked in the water."
	; "There was something floating in there."
	; "He poured the water out."
	; "He got water in another glass."
; best schemas are:
; TRAVEL.V
; RECEIVING_VERB.?
; MAKE.V
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
(setf matches (append matches '(( (4.0 3)
("The man poured a glass of water." "He looked in the water."
 "There was something floating in there." "He poured the water out."
 "He got water in another glass.")
(EPI-SCHEMA ((HE.PRO GET.338.V OBJECT533.SK (AT.P-ARG ?L)) ** E534.SK)
	(:ROLES
		(!R1 (OBJECT533.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = OBJECT533.SK)))
		(!R4 (OBJECT533.SK (= (K WATER.N))))
		(!R5 (HE.PRO MALE.A))
		(!R6 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V OBJECT533.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V OBJECT533.SK)))
		(?I2 (HE.PRO (AT.P ?L)))
		(?I3 (OBJECT533.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V OBJECT533.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E534.SK))
		(!W2 (?I1 PRECOND-OF E534.SK))
		(!W3 (?I2 PRECOND-OF E534.SK))
		(!W4 (?I3 PRECOND-OF E534.SK))
		(!W5 (?P1 POSTCOND-OF E534.SK))
		(!W6 (E534.SK (BEFORE NOW144)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 29:
	; "Tom bought a new car."
	; "It was a very fast car."
	; "He thought the car was made to be driven fast."
	; "He drove the car fast."
	; "He had a great time."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 30:
	; "The cat was purring."
	; "The cat put its head back down."
	; "The cat had a funny look."
	; "The cat started eating."
	; "I had bought it a different food."
; best schemas are:
; EAT.V
; FEED.V
; DRINK.V
; GIVE.V
; RECEIVING_VERB.?

; story 31:
	; "Helen went to a hair stylist."
	; "She wanted a new hair cut."
	; "Stylist has cut her hair too short."
	; "Helen did not like it."
	; "She did not tip him."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (4.5 3)
("Helen went to a hair stylist." "She wanted a new hair cut."
 "Stylist has cut her hair too short." "Helen did not like it."
 "She did not tip him.")
(EPI-SCHEMA ((HELEN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STYLIST596.SK)) GO.387.V))
              STYLIST596.SK)
             ** E597.SK)
	(:ROLES
		(!R1 (HELEN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STYLIST596.SK LOCATION.N))
		(!R4 (NOT (?L1 = STYLIST596.SK)))
		(!R5 (CUT602.SK ((NN HAIR.N) CUT.N)))
		(!R6 (CUT602.SK NEW.A))
		(!R7 (STYLIST596.SK ((NN HAIR.N) STYLIST.N)))
		(!R8 (STYLIST596.SK HAIR.N))
		(!R9 (STYLIST596.SK (PERTAIN-TO HELEN.NAME)))
	)
	(:GOALS
		(E603.SK (HELEN.NAME (WANT.V (KA ((ADV-A (AT.P STYLIST596.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HELEN.NAME (AT.P ?L1)))
		(?I2 (NOT (HELEN.NAME (AT.P STYLIST596.SK))))
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
		(!W6 (E597.SK (BEFORE NOW155)))
		(!W7 (E603.SK (BEFORE NOW156)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.53125 2)
("Helen went to a hair stylist." "She wanted a new hair cut."
 "Stylist has cut her hair too short." "Helen did not like it."
 "She did not tip him.")
(EPI-SCHEMA ((HELEN.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.388.V
              (KA (LIKE.V STYLIST596.SK)))
             ** ?E)
	(:ROLES
		(!R1 (HELEN.NAME AGENT.N))
		(!R2 ((KA (LIKE.V STYLIST596.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (CUT602.SK ((NN HAIR.N) CUT.N)))
		(!R5 (CUT602.SK NEW.A))
		(!R6 (STYLIST596.SK ((NN HAIR.N) STYLIST.N)))
		(!R7 (STYLIST596.SK HAIR.N))
		(!R8 (STYLIST596.SK (PERTAIN-TO HELEN.NAME)))
	)
	(:GOALS
		(E603.SK (HELEN.NAME (WANT.V (THAT (NOT (HELEN.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (HELEN.NAME (DO.V (KA (LIKE.V STYLIST596.SK))))) CAUSE-OF
    (KE (HELEN.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E609.SK (NOT (HELEN.NAME (DO.V (KA (LIKE.V STYLIST596.SK))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E603.SK CAUSE-OF E609.SK))
		(!W2 (E603.SK (BEFORE NOW156)))
		(!W3 (E609.SK (BEFORE NOW158)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 33:
	; "I had the stairs near me."
	; "They were very loud."
	; "It bothered me."
	; "Thankfully the sound went down."
	; "I was happy about that."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 34:
	; "Tom had a day off."
	; "It was warm and nice out."
	; "He invited a bunch of people to the lake."
	; "Everyone turned him down."
	; "Tom went by himself and had fun."
; best schemas are:
; TRAVEL.V
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (2.5 0)
("Tom had a day off." "It was warm and nice out."
 "He invited a bunch of people to the lake." "Everyone turned him down."
 "Tom went by himself and had fun.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (BY.P HIMSELF.PRO))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.455.V)))
              ?L2)
             ** E668.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P ?L2))))
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
		(!W6 (E668.SK (BEFORE NOW174)))
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
; best schemas are:
; RECEIVING_VERB.?
; FEED.V
; EAT.V
; DRINK.V
; TRAVEL.V
(setf matches (append matches '(( (4.1411133 2)
("Tom got home from work." "The cats seemed quite hungry."
 "He decided to feed them." "His wife told Tom she had just fed them."
 "Tom took the food back.")
(EPI-SCHEMA ((TOM.NAME ((ADV-A (FROM.P (K WORK.N))) GET.460.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E672.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = (K HOME.N))))
		(!R5 (WIFE679.SK WIFE.N))
		(!R6 (WIFE679.SK (PERTAIN-TO TOM.NAME)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V (K HOME.N))))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
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
		(!W6 (E672.SK (BEFORE NOW175)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 37:
	; "Billy was playing outside."
	; "He tripped over a rock."
	; "Both of his shoes came off."
	; "He picked up both shoes."
	; "He put his shoes back on his feet."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; MAKE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 38:
	; "We were sitting at home tonight."
	; "It was quiet."
	; "My wife heard a buzzing sound."
	; "I went and sat near where she heard the sound."
	; "We heard nothing."
; best schemas are:
; SIT.V
; TRAVEL.V
; RECEIVING_VERB.?
; SEARCH.V
; FIND.V

; story 39:
	; "We went to the water park yesterday."
	; "It was a wild day."
	; "When we got there the lies were very long."
	; "They were too long."
	; "So we decided to leave."
; best schemas are:
; TRAVEL.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
; FIND.V
(setf matches (append matches '(( (3.7302296 2)
("We went to the water park yesterday." "It was a wild day."
 "When we got there the lies were very long." "They were too long."
 "So we decided to leave.")
(EPI-SCHEMA ((WE758.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P PARK741.SK)) ((ADV-A (FROM.P ?L1)) GO.504.V)))
              PARK741.SK)
             ** E744.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (PARK741.SK LOCATION.N))
		(!R3 (NOT (?L1 = PARK741.SK)))
		(!R4 (PARK741.SK ((NN WATER.N) PARK.N)))
		(!R5 (WE758.SK AGENT.N))
	)
	(:GOALS
		(?G1 (WE758.SK (WANT.V (KA ((ADV-A (AT.P PARK741.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (WE758.SK (AT.P ?L1)))
		(?I2 (NOT (WE758.SK (AT.P PARK741.SK))))
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
		(!W6 (E744.SK (BEFORE NOW195)))
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
; TRAVEL.V
; MAKE.V
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V

; story 41:
	; "My dog had puppies."
	; "It was cold outside."
	; "She came into the garage."
	; "She had one puppy outside."
	; "It did not survive."
; best schemas are:
; RECEIVING_VERB.?
; SEARCH.V
; FIND.V
; GIVE.V
; EAT.V

; story 42:
	; "The man floated down the river."
	; "His boat tipped over."
	; "He swam to the tipped over boat."
	; "He climbed on top of the boat."
	; "He was rescued."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.405 0)
("The man floated down the river." "His boat tipped over."
 "He swam to the tipped over boat." "He climbed on top of the boat."
 "He was rescued.")
(EPI-SCHEMA ((MAN801.SK
              ((ADV-A (DOWN.P RIVER803.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FLOAT.561.V)))
              ?L2)
             ** E800.SK)
	(:ROLES
		(!R1 (MAN801.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (RIVER803.SK RIVER.N))
		(!R6 (MAN801.SK MAN.N))
		(!R7 (E800.SK (RIGHT-AFTER U209)))
		(!R8 (BOAT806.SK (PERTAIN-TO MAN801.SK)))
		(!R9 (BOAT806.SK BOAT.N))
	)
	(:GOALS
		(?G1 (MAN801.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN801.SK (AT.P ?L1)))
		(?I2 (NOT (MAN801.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (MAN801.SK (AT.P ?L1))))
		(?P2 (MAN801.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E800.SK))
		(!W2 (?I2 BEFORE E800.SK))
		(!W3 (?P1 AFTER E800.SK))
		(!W4 (?P2 AFTER E800.SK))
		(!W5 (?G1 CAUSE-OF E800.SK))
		(!W6 (E800.SK (SAME-TIME NOW210)))
		(!W7 (E804.SK (BEFORE NOW210)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 44:
	; "The boy was home alone."
	; "He thought he heard a noise."
	; "He called his mom."
	; "His mom told him to lock up the house."
	; "That made the boy more afraid."
; best schemas are:

; story 45:
	; "Joseph likes pets."
	; "He has two dogs and three cats."
	; "One day one of the dogs got lost."
	; "Joseph tried to find him very hard."
	; "He finally find him."
; best schemas are:
; SEARCH.V
; FIND.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?

; story 46:
	; "Susie got some bad ice cream."
	; "It looked good at first."
	; "Then it melted."
	; "Susie was not pleased."
	; "She didn't want it anymore."
; best schemas are:
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (1.53125 1)
("Susie got some bad ice cream." "It looked good at first." "Then it melted."
 "Susie was not pleased." "She didn't want it anymore.")
(EPI-SCHEMA ((SHE.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.581.V
              (KA ((ANYMORE.ADV WANT.V) IT.PRO)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((ANYMORE.ADV WANT.V) IT.PRO)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (SHE.PRO FEMALE.A))
		(!R4 (SHE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (NOT (SHE.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (SHE.PRO (DO.V (KA ((ANYMORE.ADV WANT.V) IT.PRO))))) CAUSE-OF
    (KE (SHE.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E881.SK (SHE.PRO (ANYMORE.ADV DO.V) (KA ((ANYMORE.ADV WANT.V) IT.PRO))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E881.SK))
		(!W2 (E881.SK (BEFORE NOW234)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 47:
	; "Bill was driving down the road."
	; "He saw his friend Amy walking."
	; "He stopped his car."
	; "He gave her a ride."
	; "Then he went home."
; best schemas are:
; TRAVEL.V
; GIVE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; PUT_IN_CONTAINER.V

; story 48:
	; "Reese wanted to be more active."
	; "He mostly sat around the house."
	; "He wanted to be more fit."
	; "He started playing one hour outside a day."
	; "He is much more fit now."
; best schemas are:
; PLAY.V
; SIT.V
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (3.5 0)
("Reese wanted to be more active." "He mostly sat around the house."
 "He wanted to be more fit." "He started playing one hour outside a day."
 "He is much more fit now.")
(EPI-SCHEMA ((REESE.NAME
              ((ADV-A (AROUND.P HOUSE901.SK))
               (MOSTLY.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.590.V)))))
             ** E902.SK)
	(:ROLES
		(!R1 (REESE.NAME AGENT.N))
		(!R2 (?S INANIMATE_OBJECT.N))
		(!R3 (?S FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (HOUSE901.SK HOUSE.N))
	)
	(:GOALS
		(E909.SK (REESE.NAME (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (REESE.NAME (AT.P ?L)))
		(?I2 (?S (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E909.SK (BEFORE NOW240)))
		(!W2 (E902.SK (BEFORE NOW241)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 49:
	; "The tree lost its leaves."
	; "That winter it became very cold."
	; "The branches froze."
	; "The tree lost its branches."
	; "The next spring the leaves could not grow back."
; best schemas are:

; story 50:
	; "Kevin needed some bananas."
	; "He went too the store."
	; "Got some bananas."
	; "He took them home."
	; "Enjoyed himself one."
; best schemas are:
; RECEIVING_VERB.?
; TRAVEL.V
(setf matches (append matches '(( (4.0 3)
("Kevin needed some bananas." "He went too the store." "Got some bananas."
 "He took them home." "Enjoyed himself one.")
(EPI-SCHEMA ((HE.PRO TAKE.593.V THEY.PRO (AT.P-ARG ?L)) ** E953.SK)
	(:ROLES
		(!R1 (THEY.PRO INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = THEY.PRO)))
		(!R4 (HE.PRO MALE.A))
		(!R5 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V THEY.PRO))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V THEY.PRO)))
		(?I2 (HE.PRO (AT.P ?L)))
		(?I3 (THEY.PRO (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V THEY.PRO))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E953.SK))
		(!W2 (?I1 PRECOND-OF E953.SK))
		(!W3 (?I2 PRECOND-OF E953.SK))
		(!W4 (?I3 PRECOND-OF E953.SK))
		(!W5 (?P1 POSTCOND-OF E953.SK))
		(!W6 (E953.SK (BEFORE NOW253)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.5 3)
("Kevin needed some bananas." "He went too the store." "Got some bananas."
 "He took them home." "Enjoyed himself one.")
(EPI-SCHEMA ((KEVIN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE947.SK)) GO.594.V))
              STORE947.SK)
             ** E949.SK)
	(:ROLES
		(!R1 (KEVIN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE947.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE947.SK)))
		(!R5 (STORE947.SK STORE.N))
	)
	(:GOALS
		(?G1 (KEVIN.NAME (WANT.V (KA ((ADV-A (AT.P STORE947.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (KEVIN.NAME (AT.P ?L1)))
		(?I2 (NOT (KEVIN.NAME (AT.P STORE947.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT (KEVIN.NAME (AT.P ?L1))))
		(?P2 (KEVIN.NAME (AT.P STORE947.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E949.SK))
		(!W2 (?I2 BEFORE E949.SK))
		(!W3 (?P1 AFTER E949.SK))
		(!W4 (?P2 AFTER E949.SK))
		(!W5 (?G1 CAUSE-OF E949.SK))
		(!W6 (E949.SK (BEFORE NOW251)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 51:
	; "I was walking back from the store."
	; "It was a hot day."
	; "A man gave me a ride the rest of the way."
	; "He was a little rude to me."
	; "I thanked him anyway."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (2.905 0)
("I was walking back from the store." "It was a hot day."
 "A man gave me a ride the rest of the way." "He was a little rude to me."
 "I thanked him anyway.")
(EPI-SCHEMA ((ME973.SK ((ADV-A (TO.P MAN963.SK)) THANK.603.V) MAN963.SK ?O) **
             E972.SK)
	(:ROLES
		(!R1 (?O INANIMATE_OBJECT.N))
		(!R2 (MAN963.SK AGENT.N))
		(!R3 (MAN963.SK MAN.N))
		(!R4 (ME973.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME973.SK (WANT.V (THAT (MAN963.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (ME973.SK HAVE.V ?O))
		(?I2 (NOT (MAN963.SK HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (ME973.SK HAVE.V ?O)))
		(?P2 (MAN963.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E972.SK (BEFORE NOW259)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 52:
	; "My friend came to visit."
	; "She wanted to go out."
	; "I asked if she wanted to meet my brothers."
	; "I was in trouble that night."
	; "I didn't find out why until the next day."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (3.405 1)
("My friend came to visit." "She wanted to go out."
 "I asked if she wanted to meet my brothers." "I was in trouble that night."
 "I didn't find out why until the next day.")
(EPI-SCHEMA ((FRIEND976.SK
              ((ADV-A (FOR.P (KA VISIT.V)))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.605.V)))
              ?L2)
             ** E975.SK)
	(:ROLES
		(!R1 (FRIEND976.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (E975.SK (RIGHT-AFTER U259)))
		(!R6 (FRIEND976.SK FRIEND.N))
		(!R7 (FRIEND976.SK (PERTAIN-TO ME989.SK)))
		(!R8 (ME989.SK AGENT.N))
		(!R9 (BROTHER984.SK (PERTAIN-TO ME989.SK)))
		(!R10 (BROTHER984.SK (PLUR BROTHER.N)))
	)
	(:GOALS
		(E980.SK (FRIEND976.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND976.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND976.SK (AT.P ?L2))))
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
		(!W6 (E975.SK (SAME-TIME NOW260)))
		(!W7 (E978.SK (BEFORE NOW260)))
		(!W8 (E980.SK (BEFORE NOW261)))
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
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V

; story 54:
	; "The man turned on the light."
	; "The bulb made a noise."
	; "The light went out."
	; "The man replaced the bulb."
	; "Light filled the man's room."
; best schemas are:
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?

; story 55:
	; "Ernesto is a cat."
	; "He likes to hunt bugs."
	; "Yesterday there was a fly on top of the desk."
	; "He jumped and caught the fly."
	; "Then Ernesto ate the fly."
; best schemas are:
; SIT.V
; TRAVEL.V
; EAT.V
; FEED.V
; MAKE.V
(setf matches (append matches '(( (4.5 4)
("Ernesto is a cat." "He likes to hunt bugs."
 "Yesterday there was a fly on top of the desk."
 "He jumped and caught the fly." "Then Ernesto ate the fly.")
(EPI-SCHEMA ((ERNESTO.NAME EAT.659.V FLY1041.SK) ** E1044.SK)
	(:ROLES
		(!R1 (ERNESTO.NAME AGENT.N))
		(!R2 (FLY1041.SK FOOD.N))
		(!R3 (FLY1041.SK FLY.N))
	)
	(:GOALS
		(?G1 (ERNESTO.NAME (WANT.V (THAT (NOT (ERNESTO.NAME HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 (ERNESTO.NAME HAVE.V FLY1041.SK))
		(?I2 (ERNESTO.NAME HUNGRY.A))
	)
	(:POSTCONDS
		(?P1 (NOT (ERNESTO.NAME (HAVE.V FLY1041.SK))))
		(?P2 (NOT (ERNESTO.NAME HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E1044.SK))
		(!W2 (?I1 BEFORE E1044.SK))
		(!W3 (E1044.SK CAUSE-OF ?P1))
		(!W4 (E1044.SK (BEFORE NOW279)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 56:
	; "The man hung up the phone."
	; "The woman wondered why."
	; "The woman called him back."
	; "The man didn't answer."
	; "The woman thought she knew why."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (1.43625 1)
("The man hung up the phone." "The woman wondered why."
 "The woman called him back." "The man didn't answer."
 "The woman thought she knew why.")
(EPI-SCHEMA ((MAN1049.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.662.V (KA ANSWER.V))
             ** ?E)
	(:ROLES
		(!R1 (MAN1049.SK AGENT.N))
		(!R2 ((KA ANSWER.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (MAN1049.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN1049.SK (WANT.V (THAT (NOT (MAN1049.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN1049.SK (DO.V (KA ANSWER.V)))) CAUSE-OF
    (KE (MAN1049.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1061.SK (NOT (MAN1049.SK (DO.V (KA ANSWER.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1061.SK))
		(!W2 (E1061.SK (BEFORE NOW283)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 57:
	; "It was snowing outside Tom's house one day."
	; "Tom liked playing in the snow."
	; "Tom went outside."
	; "Tom played in the snow."
	; "Tom made a snowman."
; best schemas are:
; PLAY.V
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
(setf matches (append matches '(( (2.5 2)
("It was snowing outside Tom's house one day." "Tom liked playing in the snow."
 "Tom went outside." "Tom played in the snow." "Tom made a snowman.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (IN.P SNOW1070.SK)) ((ADV-A (WITH.P ?T)) PLAY.669.V)) ?G)
             ** E1076.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (?G GAME.N))
		(!R5 (SNOW1070.SK SNOW.N))
		(!R6 (HOUSE1067.SK HOUSE.N))
		(!R7 (HOUSE1067.SK (PERTAIN-TO TOM.NAME)))
		(!R8 (DAY1068.SK DAY.N))
		(!R9 (HOUSE1067.SK (= DAY1068.SK)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME HAVE.V ?T))
	)
	(:POSTCONDS
		(?P1 (TOM.NAME EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E1076.SK (BEFORE NOW288)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("It was snowing outside Tom's house one day." "Tom liked playing in the snow."
 "Tom went outside." "Tom played in the snow." "Tom made a snowman.")
(EPI-SCHEMA ((TOM.NAME ((ADV-A (IN.P SNOW1070.SK)) PLAY.670.V) ?O) ** E1076.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (SNOW1070.SK SNOW.N))
		(!R4 (HOUSE1067.SK HOUSE.N))
		(!R5 (HOUSE1067.SK (PERTAIN-TO TOM.NAME)))
		(!R6 (DAY1068.SK DAY.N))
		(!R7 (HOUSE1067.SK (= DAY1068.SK)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (?O EXIST.V)))))
		(?G2 (TOM.NAME (WANT.V (KA (HAVE.V ?O)))))
	)
	(:PRECONDS
		(?I1 (NOT (?O EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (?O EXIST.V))
		(?P2 (TOM.NAME (HAVE.V ?O)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1076.SK (BEFORE NOW288)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("It was snowing outside Tom's house one day." "Tom liked playing in the snow."
 "Tom went outside." "Tom played in the snow." "Tom made a snowman.")
(EPI-SCHEMA ((TOM.NAME
              (OUTSIDE.ADV
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.671.V)))
              ?L2)
             ** E1073.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (HOUSE1067.SK HOUSE.N))
		(!R6 (HOUSE1067.SK (PERTAIN-TO TOM.NAME)))
		(!R7 (DAY1068.SK DAY.N))
		(!R8 (HOUSE1067.SK (= DAY1068.SK)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P ?L2))))
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
		(!W6 (E1073.SK (BEFORE NOW287)))
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
; SEARCH.V
; FIND.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; PUT_IN_CONTAINER.V

; story 59:
	; "Susie was very hungry."
	; "She didn't get food yet."
	; "Hours went by."
	; "She still hadn't eaten."
	; "She needed something in her system."
; best schemas are:
; EAT.V
; FEED.V
; RECEIVING_VERB.?
; DRINK.V

; story 60:
	; "John went to the casino last night."
	; "I was a little jealous."
	; "I could not go."
	; "He had a fun night."
	; "He won a little money too."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 61:
	; "I wanted to make a cake."
	; "But I didn't want it to be too easy."
	; "So I made a tiramisu."
	; "It was delicious."
	; "But it took forever."
; best schemas are:
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V

; story 62:
	; "A little Mary was jumping on a couch."
	; "Her mom told her to stop."
	; "Mary did not listen."
	; "She jumped and fell down."
	; "Mary cried."
; best schemas are:
; TRAVEL.V
(setf matches (append matches '(( (2.5 0)
("A little Mary was jumping on a couch." "Her mom told her to stop."
 "Mary did not listen." "She jumped and fell down." "Mary cried.")
(EPI-SCHEMA ((MARY.NAME
              (DOWN.ADV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.700.V)))
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
		(!W6 (E1142.SK (BEFORE NOW313)))
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
; EAT.V
; FEED.V
; GIVE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?

; story 64:
	; "I went to work yesterday."
	; "I began to cough."
	; "I went into the bathroom to clean up."
	; "I saw that I was very sick."
	; "I went home early from work."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.5 0)
("I went to work yesterday." "I began to cough."
 "I went into the bathroom to clean up." "I saw that I was very sick."
 "I went home early from work.")
(EPI-SCHEMA ((ME1176.SK
              ((ADV-A HOME.ADV EARLY.A (FROM.P (K WORK.N)))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.740.V)))
              ?L2)
             ** E1175.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (ME1176.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME1176.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1176.SK (AT.P ?L1)))
		(?I2 (NOT (ME1176.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (ME1176.SK (AT.P ?L1))))
		(?P2 (ME1176.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1175.SK))
		(!W2 (?I2 BEFORE E1175.SK))
		(!W3 (?P1 AFTER E1175.SK))
		(!W4 (?P2 AFTER E1175.SK))
		(!W5 (?G1 CAUSE-OF E1175.SK))
		(!W6 (E1175.SK (BEFORE NOW324)))
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
; best schemas are:
; RECEIVING_VERB.?
; TRAVEL.V
(setf matches (append matches '(( (4.0 3)
("Kris lost her job." "She was sad at first." "She looked for a new job."
 "She got an interview." "Kris got a new job!")
(EPI-SCHEMA ((SHE.PRO GET.741.V INTERVIEW1186.SK (AT.P-ARG ?L)) ** E1187.SK)
	(:ROLES
		(!R1 (INTERVIEW1186.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (SHE.PRO = INTERVIEW1186.SK)))
		(!R4 (SHE.PRO FEMALE.A))
		(!R5 (SHE.PRO AGENT.N))
		(!R6 (INTERVIEW1186.SK INTERVIEW.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (SHE.PRO (HAVE.V INTERVIEW1186.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SHE.PRO HAVE.V INTERVIEW1186.SK)))
		(?I2 (SHE.PRO (AT.P ?L)))
		(?I3 (INTERVIEW1186.SK (AT.P ?L)))
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
		(!W6 (E1187.SK (BEFORE NOW328)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 67:
	; "John wanted to get a new pet."
	; "He went to the pound to look for one."
	; "He saw a sad puppy."
	; "John felt deeply for it."
	; "He took him home as his new pet."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; PLAY.V
; GIVE.V
; TRAVEL.V

; story 68:
	; "It didn't matter what he said."
	; "She wasn't going to listen."
	; "She covered her ears with her hands."
	; "She made a loud noise."
	; "He gave up trying to talk."
; best schemas are:
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (2.5 3)
("It didn't matter what he said." "She wasn't going to listen."
 "She covered her ears with her hands." "She made a loud noise."
 "He gave up trying to talk.")
(EPI-SCHEMA ((SHE1250.SK ((ADV-A (WITH.P ?T)) PLAY.799.V) NOISE1246.SK) **
             E1247.SK)
	(:ROLES
		(!R1 (?T TOY.N))
		(!R2 (?T INANIMATE_OBJECT.N))
		(!R3 (NOISE1246.SK GAME.N))
		(!R4 (SHE1250.SK AGENT.N))
		(!R5 (NOISE1246.SK NOISE.N))
		(!R6 (NOISE1246.SK LOUD.A))
		(!R7 (EAR1239.SK (PERTAIN-TO SHE1250.SK)))
		(!R8 (EAR1239.SK (PLUR EAR.N)))
		(!R9 (HAND1240.SK (PERTAIN-TO SHE1250.SK)))
		(!R10 (HAND1240.SK (PLUR HAND.N)))
	)
	(:GOALS
		(?G1 (SHE1250.SK (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (SHE1250.SK HAVE.V ?T))
	)
	(:POSTCONDS
		(?P1 (SHE1250.SK EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E1247.SK (BEFORE NOW343)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 69:
	; "John had his day off."
	; "John wanted to go to the beach."
	; "He got on his car and drove to the beach."
	; "John swam in the water."
	; "John had a good day."
; best schemas are:
; RECEIVING_VERB.?
; GIVE.V
; EAT.V
; FEED.V
; PLAY.V
(setf matches (append matches '(( (6.0 2)
("John had his day off." "John wanted to go to the beach."
 "He got on his car and drove to the beach." "John swam in the water."
 "John had a good day.")
(EPI-SCHEMA ((JOHN.NAME ((ADV-A (ON.P CAR1262.SK)) GET.821.V) DAY1272.SK
              (AT.P-ARG ?L))
             ** E1263.SK)
	(:ROLES
		(!R1 (JOHN.NAME AGENT.N))
		(!R2 (DAY1272.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (JOHN.NAME = DAY1272.SK)))
		(!R5 (BEACH1256.SK BEACH.N))
		(!R6 (DAY1272.SK DAY.N))
		(!R7 (DAY1272.SK GOOD.A))
		(!R8 (DAY1254.SK DAY.N))
		(!R9 (DAY1254.SK (PERTAIN-TO JOHN.NAME)))
		(!R10 (CAR1262.SK (PERTAIN-TO JOHN.NAME)))
		(!R11 (CAR1262.SK CAR.N))
	)
	(:GOALS
		(E1257.SK (JOHN.NAME (WANT.V (THAT (JOHN.NAME (HAVE.V DAY1272.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (JOHN.NAME HAVE.V DAY1272.SK)))
		(?I2 (JOHN.NAME (AT.P ?L)))
		(?I3 (DAY1272.SK (AT.P ?L)))
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
		(!W6 (E1257.SK (BEFORE NOW346)))
		(!W7 (E1263.SK (CONSEC E1264.SK)))
		(!W8 (E1264.SK (BEFORE NOW347)))
		(!W9 (E1263.SK (BEFORE NOW347)))
		(!W10 (E1273.SK (BEFORE NOW349)))
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
; TRAVEL.V
; MAKE.V
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V

; story 71:
	; "Lucy wanted to skate."
	; "She hadn't done it before."
	; "She decided to take lessons."
	; "On her first lesson she fell."
	; "It would be away until she got good."
; best schemas are:
; RECEIVING_VERB.?
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; EAT.V
(setf matches (append matches '(( (4.5 0)
("Lucy wanted to skate." "She hadn't done it before."
 "She decided to take lessons." "On her first lesson she fell."
 "It would be away until she got good.")
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-S (ON.P LESSON1296.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.859.V)))
              ?L2)
             ** E1295.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (LESSON1296.SK (PERTAIN-TO LUCY.NAME)))
		(!R6 (LESSON1296.SK FIRST.A))
		(!R7 (LESSON1296.SK LESSON.N))
		(!R8 (E1295.SK (RIGHT-AFTER U357)))
	)
	(:GOALS
		(E1290.SK (LUCY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LUCY.NAME (AT.P ?L1)))
		(?I2 (NOT (LUCY.NAME (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (LUCY.NAME (AT.P ?L1))))
		(?P2 (LUCY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1295.SK))
		(!W2 (?I2 BEFORE E1295.SK))
		(!W3 (?P1 AFTER E1295.SK))
		(!W4 (?P2 AFTER E1295.SK))
		(!W5 (E1290.SK CAUSE-OF E1295.SK))
		(!W6 (E1290.SK (BEFORE NOW355)))
		(!W7 (E1295.SK (SAME-TIME NOW358)))
		(!W8 (E1298.SK (BEFORE NOW358)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 73:
	; "He took the cat to the vet."
	; "The vet called it sick."
	; "The man got some medicine."
	; "The cat took the medicine."
	; "The cat got better."
; best schemas are:
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (3.905 3)
("He took the cat to the vet." "The vet called it sick."
 "The man got some medicine." "The cat took the medicine."
 "The cat got better.")
(EPI-SCHEMA ((MAN1329.SK ((ADV-A (TO.P VET1323.SK)) TAKE.885.V) CAT1322.SK
              (AT.P-ARG ?L))
             ** E1324.SK)
	(:ROLES
		(!R1 (MAN1329.SK AGENT.N))
		(!R2 (CAT1322.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAN1329.SK = CAT1322.SK)))
		(!R5 (VET1323.SK VET.N))
		(!R6 (CAT1322.SK CAT.N))
		(!R7 (MAN1329.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN1329.SK (WANT.V (THAT (MAN1329.SK (HAVE.V CAT1322.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN1329.SK HAVE.V CAT1322.SK)))
		(?I2 (MAN1329.SK (AT.P ?L)))
		(?I3 (CAT1322.SK (AT.P ?L)))
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
		(!W6 (E1324.SK (BEFORE NOW365)))
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

; story 75:
	; "The cat ran out of food."
	; "I had no more in my house."
	; "I bought some more from the store."
	; "I filled up my cat's bowl of food."
	; "The cat ate his food."
; best schemas are:
; EAT.V
; FEED.V
; DRINK.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (4.9049997 3)
("The cat ran out of food." "I had no more in my house."
 "I bought some more from the store." "I filled up my cat's bowl of food."
 "The cat ate his food.")
(EPI-SCHEMA ((CAT1364.SK EAT.895.V FOOD1367.SK) ** E1363.SK)
	(:ROLES
		(!R1 (CAT1364.SK AGENT.N))
		(!R2 (FOOD1367.SK FOOD.N))
		(!R3 (CAT1364.SK CAT.N))
		(!R4 (CAT1349.SK CAT.N))
		(!R5 (FOOD1367.SK (PERTAIN-TO CAT1349.SK)))
		(!R6 (E1363.SK (RIGHT-AFTER U378)))
	)
	(:GOALS
		(?G1 (CAT1364.SK (WANT.V (THAT (NOT (CAT1364.SK HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 (CAT1364.SK HAVE.V FOOD1367.SK))
		(?I2 (CAT1364.SK HUNGRY.A))
	)
	(:POSTCONDS
		(?P1 (NOT (CAT1364.SK (HAVE.V FOOD1367.SK))))
		(?P2 (NOT (CAT1364.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E1363.SK))
		(!W2 (?I1 BEFORE E1363.SK))
		(!W3 (E1363.SK CAUSE-OF ?P1))
		(!W4 (E1363.SK (SAME-TIME NOW379)))
		(!W5 (E1368.SK (BEFORE NOW379)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 76:
	; "Lisa was running through the park."
	; "She loved playing with her dog."
	; "They played catch."
	; "At the end she went in the lake."
	; "She loved to swim in it."
; best schemas are:
; TRAVEL.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
; FIND.V
(setf matches (append matches '(( (3.78125 1)
("Lisa was running through the park." "She loved playing with her dog."
 "They played catch." "At the end she went in the lake."
 "She loved to swim in it.")
(EPI-SCHEMA ((LISA.NAME
              ((ADV-A (THROUGH.P PARK1371.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P END1380.SK)) RUN.929.V)))
              ?L2)
             ** E1370.SK)
	(:ROLES
		(!R1 (LISA.NAME AGENT.N))
		(!R2 (END1380.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (END1380.SK = ?L2)))
		(!R5 (PARK1371.SK PARK.N))
		(!R6 (DOG1375.SK (PERTAIN-TO LISA.NAME)))
		(!R7 (DOG1375.SK DOG.N))
		(!R8 (END1380.SK END.N))
	)
	(:GOALS
		(?G1 (LISA.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LISA.NAME (AT.P END1380.SK)))
		(?I2 (NOT (LISA.NAME (AT.P ?L2))))
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
		(!W6 (E1370.SK (BEFORE NOW380)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 78:
	; "A man wanted a new car color."
	; "He asked his friends what color."
	; "They said blue."
	; "He took it to the shop."
	; "It got painted blue."
; best schemas are:
; RECEIVING_VERB.?
; PUT_IN_CONTAINER.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
(setf matches (append matches '(( (4.9049997 2)
("A man wanted a new car color." "He asked his friends what color."
 "They said blue." "He took it to the shop." "It got painted blue.")
(EPI-SCHEMA ((MAN1398.SK ((ADV-A (TO.P SHOP1409.SK)) TAKE.958.V) COLOR1403.SK
              (AT.P-ARG ?L))
             ** E1410.SK)
	(:ROLES
		(!R1 (MAN1398.SK AGENT.N))
		(!R2 (COLOR1403.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAN1398.SK = COLOR1403.SK)))
		(!R5 (COLOR1403.SK ((NN CAR.N) COLOR.N)))
		(!R6 (COLOR1403.SK NEW.A))
		(!R7 (MAN1398.SK MAN.N))
		(!R8 (SHOP1409.SK SHOP.N))
	)
	(:GOALS
		(E1404.SK (MAN1398.SK (WANT.V (THAT (MAN1398.SK (HAVE.V COLOR1403.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAN1398.SK HAVE.V COLOR1403.SK)))
		(?I2 (MAN1398.SK (AT.P ?L)))
		(?I3 (COLOR1403.SK (AT.P ?L)))
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
		(!W6 (E1404.SK (BEFORE NOW390)))
		(!W7 (E1410.SK (BEFORE NOW393)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 80:
	; "The cat walked into the living room."
	; "There was a ball on the floor."
	; "The cat swatted the ball around."
	; "The cat played with the ball."
	; "The cat liked the ball."
; best schemas are:
; TRAVEL.V
; MAKE.V
; PLAY.V
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
(setf matches (append matches '(( (2.405 0)
("The cat walked into the living room." "There was a ball on the floor."
 "The cat swatted the ball around." "The cat played with the ball."
 "The cat liked the ball.")
(EPI-SCHEMA ((CAT1422.SK
              ((ADV-A (INTO.P ROOM1425.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) WALK.989.V)))
              ?L2)
             ** E1421.SK)
	(:ROLES
		(!R1 (CAT1422.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (ROOM1425.SK ((NN LIVING.N) ROOM.N)))
		(!R6 (CAT1422.SK CAT.N))
		(!R7 (E1421.SK (RIGHT-AFTER U399)))
	)
	(:GOALS
		(?G1 (CAT1422.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT1422.SK (AT.P ?L1)))
		(?I2 (NOT (CAT1422.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (CAT1422.SK (AT.P ?L1))))
		(?P2 (CAT1422.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1421.SK))
		(!W2 (?I2 BEFORE E1421.SK))
		(!W3 (?P1 AFTER E1421.SK))
		(!W4 (?P2 AFTER E1421.SK))
		(!W5 (?G1 CAUSE-OF E1421.SK))
		(!W6 (E1421.SK (SAME-TIME NOW400)))
		(!W7 (E1426.SK (BEFORE NOW400)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.546113 3)
("The cat walked into the living room." "There was a ball on the floor."
 "The cat swatted the ball around." "The cat played with the ball."
 "The cat liked the ball.")
(EPI-SCHEMA ((CAT1422.SK ((ADV-A (WITH.P BALL1429.SK)) PLAY.990.V) BALL1429.SK)
             ** E1436.SK)
	(:ROLES
		(!R1 (CAT1422.SK AGENT.N))
		(!R2 (BALL1429.SK INANIMATE_OBJECT.N))
		(!R3 (CAT1422.SK CAT.N))
		(!R4 (BALL1429.SK BALL.N))
		(!R5 (BALL1429.SK (ON.P FLOOR1430.SK)))
		(!R6 (FLOOR1430.SK FLOOR.N))
		(!R7 (E1436.SK (RIGHT-AFTER U402)))
	)
	(:GOALS
		(?G1 (CAT1422.SK (WANT.V (THAT (BALL1429.SK EXIST.V)))))
		(?G2 (CAT1422.SK (WANT.V (KA (HAVE.V BALL1429.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (BALL1429.SK EXIST.V)))
	)
	(:POSTCONDS
		(E1446.SK (BALL1429.SK EXIST.V))
		(?P2 (CAT1422.SK (HAVE.V BALL1429.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1446.SK (BEFORE NOW401)))
		(!W2 (E1436.SK (SAME-TIME NOW403)))
		(!W3 (E1440.SK (BEFORE NOW403)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5461133 4)
("The cat walked into the living room." "There was a ball on the floor."
 "The cat swatted the ball around." "The cat played with the ball."
 "The cat liked the ball.")
(EPI-SCHEMA ((CAT1422.SK ((ADV-A (WITH.P BALL1429.SK)) PLAY.991.V) ?G) **
             E1436.SK)
	(:ROLES
		(!R1 (CAT1422.SK AGENT.N))
		(!R2 (BALL1429.SK TOY.N))
		(!R3 (BALL1429.SK INANIMATE_OBJECT.N))
		(!R4 (?G GAME.N))
		(!R5 (CAT1422.SK CAT.N))
		(!R6 (BALL1429.SK BALL.N))
		(!R7 (BALL1429.SK (ON.P FLOOR1430.SK)))
		(!R8 (FLOOR1430.SK FLOOR.N))
		(!R9 (E1436.SK (RIGHT-AFTER U402)))
	)
	(:GOALS
		(?G1 (CAT1422.SK (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (CAT1422.SK HAVE.V BALL1429.SK))
	)
	(:POSTCONDS
		(?P1 (CAT1422.SK EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E1436.SK (SAME-TIME NOW403)))
		(!W3 (E1440.SK (BEFORE NOW403)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 81:
	; "The man found a crate."
	; "He couldn't get it open."
	; "He looked for a hammer at home."
	; "He went back to the crate with the hammer."
	; "The crate was gone."
; best schemas are:
; SEARCH.V
; FIND.V
; PUT_IN_CONTAINER.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (2.405 0)
("The man found a crate." "He couldn't get it open."
 "He looked for a hammer at home." "He went back to the crate with the hammer."
 "The crate was gone.")
(EPI-SCHEMA ((MAN1448.SK FIND.1005.V CRATE1450.SK) ** E1447.SK)
	(:ROLES
		(!R1 (MAN1448.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (CRATE1450.SK CRATE.N))
		(!R4 (MAN1448.SK MAN.N))
		(!R5 (E1447.SK (RIGHT-AFTER U404)))
	)
	(:PRECONDS
		(?I1 (MAN1448.SK (AT.P ?L)))
		(?I2 (CRATE1450.SK (AT.P ?L)))
		(?I3 (MAN1448.SK ((ADV-A (FOR.P CRATE1450.SK)) SEARCH.V)))
		(?I4 (NOT (MAN1448.SK (KNOW.V (THAT (CRATE1450.SK (AT.P ?L)))))))
		(?I5 (NOT (MAN1448.SK (HAVE.V CRATE1450.SK))))
	)
	(:POSTCONDS
		(?P1 (MAN1448.SK (KNOW.V (THAT (CRATE1450.SK (AT.P ?L))))))
		(?P2 (MAN1448.SK (HAVE.V CRATE1450.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1447.SK (SAME-TIME NOW405)))
		(!W2 (E1451.SK (BEFORE NOW405)))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 83:
	; "The sun set."
	; "The man was still lost."
	; "He felt himself panic."
	; "He controlled the panic."
	; "He waited for help to find him."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 84:
	; "Helen bought a nice plant in the store."
	; "She put it into the window at home."
	; "Next morning she wanted to water it."
	; "She found it broken on the floor."
	; "It was her cat."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

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
; best schemas are:
; TRAVEL.V
(setf matches (append matches '(( (2.5 0)
("Charles was playing football." "He went out for a pass."
 "He caught the ball." "But he landed on a window."
 "He had to let his arm heal.")
(EPI-SCHEMA ((CHARLES.NAME
              ((ADV-A (FOR.P PASS1507.SK))
               (OUT.ADV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.1024.V))))
              ?L2)
             ** E1508.SK)
	(:ROLES
		(!R1 (CHARLES.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (PASS1507.SK PASS.N))
		(!R6 (PASS1507.SK BALL.N))
		(!R7 (ARM1517.SK ARM.N))
		(!R8 (ARM1517.SK (PERTAIN-TO CHARLES.NAME)))
	)
	(:GOALS
		(?G1 (CHARLES.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CHARLES.NAME (AT.P ?L1)))
		(?I2 (NOT (CHARLES.NAME (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (CHARLES.NAME (AT.P ?L1))))
		(?P2 (CHARLES.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1508.SK))
		(!W2 (?I2 BEFORE E1508.SK))
		(!W3 (?P1 AFTER E1508.SK))
		(!W4 (?P2 AFTER E1508.SK))
		(!W5 (?G1 CAUSE-OF E1508.SK))
		(!W6 (E1508.SK (BEFORE NOW431)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 88:
	; "Allie was watching a show yesterday."
	; "It was very funny."
	; "Allie laughed out loud."
	; "She didn't know how to keep it in."
	; "She wanted to watch it again."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 89:
	; "The doll caught on fire."
	; "The girl thought it was funny."
	; "She watched it burn."
	; "It caught the house on fire."
	; "The whole house burned down."
; best schemas are:
; PLAY.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 90:
	; "The dog went outside."
	; "It walked over by the tree."
	; "The dog trotted around the tree."
	; "The dog found a spot."
	; "The dog laid down and took a nap."
; best schemas are:
; SEARCH.V
; FIND.V
; RECEIVING_VERB.?
; TRAVEL.V
; MAKE.V
(setf matches (append matches '(( (2.405 0)
("The dog went outside." "It walked over by the tree."
 "The dog trotted around the tree." "The dog found a spot."
 "The dog laid down and took a nap.")
(EPI-SCHEMA ((DOG1570.SK FIND.1038.V SPOT1572.SK) ** E1569.SK)
	(:ROLES
		(!R1 (DOG1570.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (SPOT1572.SK SPOT.N))
		(!R4 (DOG1570.SK DOG.N))
		(!R5 (E1569.SK (RIGHT-AFTER U452)))
	)
	(:PRECONDS
		(?I1 (DOG1570.SK (AT.P ?L)))
		(?I2 (SPOT1572.SK (AT.P ?L)))
		(?I3 (DOG1570.SK ((ADV-A (FOR.P SPOT1572.SK)) SEARCH.V)))
		(?I4 (NOT (DOG1570.SK (KNOW.V (THAT (SPOT1572.SK (AT.P ?L)))))))
		(?I5 (NOT (DOG1570.SK (HAVE.V SPOT1572.SK))))
	)
	(:POSTCONDS
		(?P1 (DOG1570.SK (KNOW.V (THAT (SPOT1572.SK (AT.P ?L))))))
		(?P2 (DOG1570.SK (HAVE.V SPOT1572.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1569.SK (SAME-TIME NOW453)))
		(!W2 (E1573.SK (BEFORE NOW453)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 3)
("The dog went outside." "It walked over by the tree."
 "The dog trotted around the tree." "The dog found a spot."
 "The dog laid down and took a nap.")
(EPI-SCHEMA ((DOG1575.SK TAKE.1039.V NAP1577.SK (AT.P-ARG ?L)) ** E1579.SK)
	(:ROLES
		(!R1 (DOG1575.SK AGENT.N))
		(!R2 (NAP1577.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (DOG1575.SK = NAP1577.SK)))
		(!R5 (NAP1577.SK NAP.N))
		(!R6 (DOG1575.SK DOG.N))
		(!R7 (E1580.SK (AT-OR-BEFORE NOW454)))
	)
	(:GOALS
		(?G1 (DOG1575.SK (WANT.V (THAT (DOG1575.SK (HAVE.V NAP1577.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (DOG1575.SK HAVE.V NAP1577.SK)))
		(?I2 (DOG1575.SK (AT.P ?L)))
		(?I3 (NAP1577.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (DOG1575.SK HAVE.V NAP1577.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1579.SK))
		(!W2 (?I1 PRECOND-OF E1579.SK))
		(!W3 (?I2 PRECOND-OF E1579.SK))
		(!W4 (?I3 PRECOND-OF E1579.SK))
		(!W5 (?P1 POSTCOND-OF E1579.SK))
		(!W6 (E1578.SK (CONSEC E1579.SK)))
		(!W7 (E1579.SK (DURING E1574.SK)))
		(!W8 (E1578.SK (DURING E1574.SK)))
		(!W9 (E1574.SK (BEFORE NOW454)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 0)
("The dog went outside." "It walked over by the tree."
 "The dog trotted around the tree." "The dog found a spot."
 "The dog laid down and took a nap.")
(EPI-SCHEMA ((DOG1560.SK
              (OUTSIDE.ADV
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.1040.V)))
              ?L2)
             ** E1559.SK)
	(:ROLES
		(!R1 (DOG1560.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (DOG1560.SK DOG.N))
	)
	(:GOALS
		(?G1 (DOG1560.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG1560.SK (AT.P ?L1)))
		(?I2 (NOT (DOG1560.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (DOG1560.SK (AT.P ?L1))))
		(?P2 (DOG1560.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1559.SK))
		(!W2 (?I2 BEFORE E1559.SK))
		(!W3 (?P1 AFTER E1559.SK))
		(!W4 (?P2 AFTER E1559.SK))
		(!W5 (?G1 CAUSE-OF E1559.SK))
		(!W6 (E1559.SK (BEFORE NOW450)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 0)
("The dog went outside." "It walked over by the tree."
 "The dog trotted around the tree." "The dog found a spot."
 "The dog laid down and took a nap.")
(EPI-SCHEMA ((DOG1575.SK LAY_DOWN.1041.V ?O) ** E1578.SK)
	(:ROLES
		(!R1 (DOG1575.SK AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (DOG1575.SK DOG.N))
		(!R4 (E1580.SK (AT-OR-BEFORE NOW454)))
	)
	(:GOALS
		(?G1 (DOG1575.SK (WANT.V (THAT (?O EXIST.V)))))
		(?G2 (DOG1575.SK (WANT.V (KA (HAVE.V ?O)))))
	)
	(:PRECONDS
		(?I1 (NOT (?O EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (?O EXIST.V))
		(?P2 (DOG1575.SK (HAVE.V ?O)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1578.SK (CONSEC E1579.SK)))
		(!W2 (E1579.SK (DURING E1574.SK)))
		(!W3 (E1578.SK (DURING E1574.SK)))
		(!W4 (E1574.SK (BEFORE NOW454)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; MAKE.V
; GIVE.V
; TRAVEL.V

; story 92:
	; "There was a knock on the door."
	; "The man inside was busy."
	; "He did not open the door."
	; "There was a louder knock on the door."
	; "The man answered the louder knock."
; best schemas are:
; TRAVEL.V
; MAKE.V
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (1.43625 1)
("There was a knock on the door." "The man inside was busy."
 "He did not open the door." "There was a louder knock on the door."
 "The man answered the louder knock.")
(EPI-SCHEMA ((MAN1602.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1059.V
              (KA (OPEN.V DOOR1600.SK)))
             ** ?E)
	(:ROLES
		(!R1 (MAN1602.SK AGENT.N))
		(!R2 ((KA (OPEN.V DOOR1600.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (DOOR1600.SK DOOR.N))
		(!R5 (MAN1602.SK MAN.N))
		(!R6 (KNOCK1599.SK (ON.P DOOR1600.SK)))
		(!R7 (KNOCK1599.SK KNOCK.N))
		(!R8 (OBJECT1608.SK (ON.P DOOR1600.SK)))
	)
	(:GOALS
		(?G1 (MAN1602.SK (WANT.V (THAT (NOT (MAN1602.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN1602.SK (DO.V (KA (OPEN.V DOOR1600.SK))))) CAUSE-OF
    (KE (MAN1602.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1606.SK (NOT (MAN1602.SK (DO.V (KA (OPEN.V DOOR1600.SK))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1606.SK))
		(!W2 (E1606.SK (BEFORE NOW462)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 93:
	; "Tom got a kitten."
	; "It ran away within days."
	; "Tom never found it."
	; "He got another cat."
	; "By the time Tom's kitten returned he had forgotten about it."
; best schemas are:
; SEARCH.V
; FIND.V
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (2.405 0)
("Tom got a kitten." "It ran away within days." "Tom never found it."
 "He got another cat."
 "By the time Tom's kitten returned he had forgotten about it.")
(EPI-SCHEMA ((TOM.NAME (NEVER.ADV FIND.1069.V) IT.PRO) ** E1626.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (TOM.NAME (PERTAIN-TO TOM.NAME)))
		(!R4 (TOM.NAME KITTEN.N))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L)))
		(?I2 (IT.PRO (AT.P ?L)))
		(?I3 (TOM.NAME ((ADV-A (FOR.P IT.PRO)) SEARCH.V)))
		(?I4 (NOT (TOM.NAME (KNOW.V (THAT (IT.PRO (AT.P ?L)))))))
		(?I5 (NOT (TOM.NAME (HAVE.V IT.PRO))))
	)
	(:POSTCONDS
		(?P1 (TOM.NAME (KNOW.V (THAT (IT.PRO (AT.P ?L))))))
		(?P2 (TOM.NAME (HAVE.V IT.PRO)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1626.SK (BEFORE NOW467)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.905 3)
("Tom got a kitten." "It ran away within days." "Tom never found it."
 "He got another cat."
 "By the time Tom's kitten returned he had forgotten about it.")
(EPI-SCHEMA ((TOM.NAME GET.1070.V KITTEN1621.SK (AT.P-ARG ?L)) ** E1622.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (KITTEN1621.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = KITTEN1621.SK)))
		(!R5 (KITTEN1621.SK KITTEN.N))
		(!R6 (TOM.NAME (PERTAIN-TO TOM.NAME)))
		(!R7 (TOM.NAME KITTEN.N))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V KITTEN1621.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V KITTEN1621.SK)))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 (KITTEN1621.SK (AT.P ?L)))
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
		(!W6 (E1622.SK (BEFORE NOW465)))
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
; SIT.V
; PUT_IN_CONTAINER.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?

; story 95:
	; "It was cold in my house."
	; "I looked for a blanket."
	; "The one I found was too small."
	; "I found a bigger blanket."
	; "I covered myself with the blanket."
; best schemas are:
; SEARCH.V
; FIND.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (2.5 0)
("It was cold in my house." "I looked for a blanket."
 "The one I found was too small." "I found a bigger blanket."
 "I covered myself with the blanket.")
(EPI-SCHEMA ((ME1669.SK FIND.1100.V BLANKET1664.SK) ** E1665.SK)
	(:ROLES
		(!R1 (?L LOCATION.N))
		(!R2 (ME1669.SK AGENT.N))
		(!R3 (BLANKET1664.SK BIGGER.A))
		(!R4 (BLANKET1664.SK BLANKET.N))
		(!R5 (HOUSE1651.SK (PERTAIN-TO ME1669.SK)))
		(!R6 (HOUSE1651.SK HOUSE.N))
	)
	(:PRECONDS
		(?I1 (ME1669.SK (AT.P ?L)))
		(?I2 (BLANKET1664.SK (AT.P ?L)))
		(?I3 (ME1669.SK ((ADV-A (FOR.P BLANKET1664.SK)) SEARCH.V)))
		(?I4 (NOT (ME1669.SK (KNOW.V (THAT (BLANKET1664.SK (AT.P ?L)))))))
		(?I5 (NOT (ME1669.SK (HAVE.V BLANKET1664.SK))))
	)
	(:POSTCONDS
		(?P1 (ME1669.SK (KNOW.V (THAT (BLANKET1664.SK (AT.P ?L))))))
		(?P2 (ME1669.SK (HAVE.V BLANKET1664.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1665.SK (BEFORE NOW478)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 96:
	; "Magee was only good at running."
	; "He loved to run all the time."
	; "One day he ran far away from home."
	; "Magee was never seen again."
	; "Some say Magee is still running today."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; TRAVEL.V
; RECEIVING_VERB.?
; SIT.V

; story 97:
	; "Mitchell couldn't get to sleep."
	; "He tried to watch tv."
	; "That didn't help."
	; "He then decided to lay down."
	; "He fell right asleep."
; best schemas are:
; MAKE.V

; story 98:
	; "Simon called his dog."
	; "The dog did not come."
	; "He yelled his dogs name."
	; "His mom heard him."
	; "His mom found his dog."
; best schemas are:
; SEARCH.V
; FIND.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (1.43625 1)
("Simon called his dog." "The dog did not come." "He yelled his dogs name."
 "His mom heard him." "His mom found his dog.")
(EPI-SCHEMA ((DOG1700.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1152.V (KA COME.V))
             ** ?E)
	(:ROLES
		(!R1 (DOG1700.SK AGENT.N))
		(!R2 ((KA COME.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (DOG1700.SK DOG.N))
	)
	(:GOALS
		(?G1 (DOG1700.SK (WANT.V (THAT (NOT (DOG1700.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (DOG1700.SK (DO.V (KA COME.V)))) CAUSE-OF
    (KE (DOG1700.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1701.SK (NOT (DOG1700.SK (DO.V (KA COME.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1701.SK))
		(!W2 (E1701.SK (BEFORE NOW491)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 99:
	; "There was a loud noise outside."
	; "The woman felt scared."
	; "She called a friend."
	; "The friend came over."
	; "They could not find the source of the noise."
; best schemas are:
; TRAVEL.V
; SIT.V
; MAKE.V
; RECEIVING_VERB.?
; SEARCH.V

; story 0:
	; "I was jogging down the road."
	; "My dad lives out of town."
	; "He saw me."
	; "He picked me up."
	; "We went for some Chinese food."
; best schemas are:
; EAT.V
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
; PLAY.V

; story 1:
	; "My brother was wearing a hat."
	; "He took it off his head."
	; "He threw it on the floor."
	; "I picked the hat up."
	; "I put it on our hat rack."
; best schemas are:
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (3.905 3)
("My brother was wearing a hat." "He took it off his head."
 "He threw it on the floor." "I picked the hat up." "I put it on our hat rack.")
(EPI-SCHEMA ((BROTHER27.SK ((ADV-A (OFF.P HEAD31.SK)) TAKE.22.V) IT50.SK
              (AT.P-ARG ?L))
             ** E34.SK)
	(:ROLES
		(!R1 (BROTHER27.SK AGENT.N))
		(!R2 (IT50.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (BROTHER27.SK = IT50.SK)))
		(!R5 (BROTHER27.SK BROTHER.N))
		(!R6 (HEAD31.SK (PERTAIN-TO BROTHER27.SK)))
		(!R7 (HEAD31.SK HEAD.N))
		(!R8 (BROTHER27.SK (PERTAIN-TO ME51.SK)))
		(!R9 (ME51.SK AGENT.N))
	)
	(:GOALS
		(?G1 (BROTHER27.SK (WANT.V (THAT (BROTHER27.SK (HAVE.V IT50.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (BROTHER27.SK HAVE.V IT50.SK)))
		(?I2 (BROTHER27.SK (AT.P ?L)))
		(?I3 (IT50.SK (AT.P ?L)))
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
		(!W6 (E34.SK (BEFORE NOW6)))
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
; best schemas are:
; DRINK.V
; TRAVEL.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
(setf matches (append matches '(( (3.405 3)
("The dog was thirsty." "The man brought him water."
 "The dog followed the man home." "The man fed him."
 "The dog never left the man's side.")
(EPI-SCHEMA ((DOG60.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P MAN64.SK)) FOLLOW.69.V))
              MAN64.SK)
             ** E67.SK)
	(:ROLES
		(!R1 (DOG60.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (MAN64.SK LOCATION.N))
		(!R4 (NOT (?L1 = MAN64.SK)))
		(!R5 (DOG60.SK DOG.N))
		(!R6 (MAN64.SK MAN.N))
		(!R7 (E67.SK (RIGHT-AFTER U11)))
		(!R8 (SIDE83.SK SIDE.N))
		(!R9 (SIDE83.SK (PERTAIN-TO MAN64.SK)))
	)
	(:GOALS
		(?G1 (DOG60.SK (WANT.V (KA ((ADV-A (AT.P MAN64.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DOG60.SK (AT.P ?L1)))
		(?I2 (NOT (DOG60.SK (AT.P MAN64.SK))))
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
		(!W6 (E67.SK (SAME-TIME NOW12)))
		(!W7 (E72.SK (BEFORE NOW12)))
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
; SEARCH.V
; FIND.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?

; story 4:
	; "Lucy wanted to play accordion."
	; "She came for her first lesson."
	; "Lucy was very tiny."
	; "She put accordion on her lap."
	; "She felt a big pain in her knees."
; best schemas are:
; PLAY.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
; MAKE.V
; GIVE.V
(setf matches (append matches '(( (3.5 1)
("Lucy wanted to play accordion." "She came for her first lesson."
 "Lucy was very tiny." "She put accordion on her lap."
 "She felt a big pain in her knees.")
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-A (FOR.P OBJECT110.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.149.V)))
              ?L2)
             ** E111.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (OBJECT110.SK (PERTAIN-TO LUCY.NAME)))
		(!R6 (LAP116.SK (PERTAIN-TO LUCY.NAME)))
		(!R7 (LAP116.SK LAP.N))
		(!R8 (KNEE125.SK (PERTAIN-TO LUCY.NAME)))
		(!R9 (KNEE125.SK (PLUR KNEE.N)))
	)
	(:GOALS
		(E108.SK (LUCY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (LUCY.NAME (AT.P ?L1)))
		(?I2 (NOT (LUCY.NAME (AT.P ?L2))))
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
		(!W6 (E108.SK (BEFORE NOW20)))
		(!W7 (E111.SK (BEFORE NOW21)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 5:
	; "Joe had run out of dish soap."
	; "So Joe went to the store."
	; "He found the best soap."
	; "Bought the best soap and took it home."
	; "Joe no longer needed soap."
; best schemas are:
; TRAVEL.V
; SEARCH.V
; FIND.V
; PUT_IN_CONTAINER.V
(setf matches (append matches '(( (2.5 0)
("Joe had run out of dish soap." "So Joe went to the store."
 "He found the best soap." "Bought the best soap and took it home."
 "Joe no longer needed soap.")
(EPI-SCHEMA ((JOE.NAME
              ((ADV-A OUT.P (OF.P (K ((NN DISH.N) SOAP.N))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.184.V)))
              ?L2)
             ** E130.SK)
	(:ROLES
		(!R1 (JOE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (E136.SK (IMPINGES-ON E130.SK)))
	)
	(:GOALS
		(?G1 (JOE.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JOE.NAME (AT.P ?L1)))
		(?I2 (NOT (JOE.NAME (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (JOE.NAME (AT.P ?L1))))
		(?P2 (JOE.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E130.SK))
		(!W2 (?I2 BEFORE E130.SK))
		(!W3 (?P1 AFTER E130.SK))
		(!W4 (?P2 AFTER E130.SK))
		(!W5 (?G1 CAUSE-OF E130.SK))
		(!W6 (E130.SK (BEFORE NOW25)))
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
(EPI-SCHEMA ((JOE.NAME FIND.187.V SOAP146.SK) ** E147.SK)
	(:ROLES
		(!R1 (JOE.NAME AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (SOAP146.SK SOAP.N))
		(!R4 (SOAP146.SK BEST.A))
	)
	(:PRECONDS
		(?I1 (JOE.NAME (AT.P ?L)))
		(?I2 (SOAP146.SK (AT.P ?L)))
		(?I3 (JOE.NAME ((ADV-A (FOR.P SOAP146.SK)) SEARCH.V)))
		(?I4 (NOT (JOE.NAME (KNOW.V (THAT (SOAP146.SK (AT.P ?L)))))))
		(?I5 (NOT (JOE.NAME (HAVE.V SOAP146.SK))))
	)
	(:POSTCONDS
		(?P1 (JOE.NAME (KNOW.V (THAT (SOAP146.SK (AT.P ?L))))))
		(?P2 (JOE.NAME (HAVE.V SOAP146.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E147.SK (BEFORE NOW27)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
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
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (4.0 3)
("The man turned it on." "It did not respond." "The man unplugged it."
 "He took it apart." "He could never get that thing to work.")
(EPI-SCHEMA ((HE.PRO TAKE.189.V IT.PRO (AT.P-ARG ?L)) ** E181.SK)
	(:ROLES
		(!R1 (IT.PRO INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = IT.PRO)))
		(!R4 (HE.PRO MALE.A))
		(!R5 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V IT.PRO))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V IT.PRO)))
		(?I2 (HE.PRO (AT.P ?L)))
		(?I3 (IT.PRO (AT.P ?L)))
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
		(!W6 (E181.SK (BEFORE NOW33)))
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
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.405 0)
("The dog went outside in the yard." "There was something new in the yard."
 "The dog sniffed it." "The dog went inside it and slept."
 "The dog liked its new dog house.")
(EPI-SCHEMA ((DOG185.SK
              ((ADV-A (IN.P YARD187.SK))
               (OUTSIDE.ADV
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.194.V))))
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
		(!W6 (E184.SK (SAME-TIME NOW35)))
		(!W7 (E188.SK (BEFORE NOW35)))
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
; best schemas are:
; RECEIVING_VERB.?
; PUT_IN_CONTAINER.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
(setf matches (append matches '(( (4.1411133 2)
("The man filled up his backpack." "He tried it on." "It felt too heavy."
 "He took the backpack off." "He took some of the stuff out of the backpack.")
(EPI-SCHEMA ((HE.PRO TAKE.199.V BACKPACK219.SK (AT.P-ARG ?L)) ** E220.SK)
	(:ROLES
		(!R1 (BACKPACK219.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = BACKPACK219.SK)))
		(!R4 (HE.PRO MALE.A))
		(!R5 (HE.PRO AGENT.N))
		(!R6 (BACKPACK219.SK BACKPACK.N))
		(!R7 (MAN209.SK (PERTAIN-TO HE.PRO)))
		(!R8 (MAN209.SK BACKPACK.N))
		(!R9 (MAN209.SK MAN.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V BACKPACK219.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V BACKPACK219.SK)))
		(?I2 (HE.PRO (AT.P ?L)))
		(?I3 (BACKPACK219.SK (AT.P ?L)))
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
		(!W6 (E220.SK (BEFORE NOW43)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?

; story 10:
	; "I had a great time."
	; "There were plenty of people there."
	; "I had to find skates that fit."
	; "It was cold inside."
	; "This was at the ice rink."
; best schemas are:
; MAKE.V
; RECEIVING_VERB.?
; TRAVEL.V
; SEARCH.V
; FIND.V

; story 11:
	; "Ben's dog Skip was very old."
	; "One day Skip got sick."
	; "Ben took Skip to the vet."
	; "The vet told ben that it was Skip's time."
	; "Ben sadly put Skip down."
; best schemas are:

; story 12:
	; "Tom loved fast boats."
	; "He got into racing."
	; "It was pretty dangerous."
	; "Tom flipped his boat once."
	; "He gave up racing after that."
; best schemas are:
; RECEIVING_VERB.?
(setf matches (append matches '(( (2.5 0)
("Tom loved fast boats." "He got into racing." "It was pretty dangerous."
 "Tom flipped his boat once." "He gave up racing after that.")
(EPI-SCHEMA ((TOM.NAME ((ADV-A (INTO.P (K (PLUR RACING.N)))) GET.234.V) ?O
              (AT.P-ARG ?L))
             ** E278.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = ?O)))
		(!R5 (BOAT283.SK (PERTAIN-TO TOM.NAME)))
		(!R6 (BOAT283.SK BOAT.N))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V ?O)))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 (?O (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (TOM.NAME HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E278.SK))
		(!W2 (?I1 PRECOND-OF E278.SK))
		(!W3 (?I2 PRECOND-OF E278.SK))
		(!W4 (?I3 PRECOND-OF E278.SK))
		(!W5 (?P1 POSTCOND-OF E278.SK))
		(!W6 (E278.SK (BEFORE NOW61)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
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
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 15:
	; "I had to take graduation pictures."
	; "I went to a studio."
	; "They gave me a jacket."
	; "They took two pictures."
	; "One of them is on my wall."
; best schemas are:
; TRAVEL.V
; GIVE.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
(setf matches (append matches '(( (3.6953125 2)
("I had to take graduation pictures." "I went to a studio."
 "They gave me a jacket." "They took two pictures."
 "One of them is on my wall.")
(EPI-SCHEMA ((ME338.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STUDIO326.SK)) GO.240.V))
              STUDIO326.SK)
             ** E327.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STUDIO326.SK LOCATION.N))
		(!R3 (NOT (?L1 = STUDIO326.SK)))
		(!R4 (ME338.SK AGENT.N))
		(!R5 (STUDIO326.SK STUDIO.N))
		(!R6 (WALL337.SK WALL.N))
		(!R7 (WALL337.SK (PERTAIN-TO ME338.SK)))
	)
	(:GOALS
		(?G1 (ME338.SK (WANT.V (KA ((ADV-A (AT.P STUDIO326.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME338.SK (AT.P ?L1)))
		(?I2 (NOT (ME338.SK (AT.P STUDIO326.SK))))
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
		(!W6 (E327.SK (BEFORE NOW76)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (5.103306 3)
("I had to take graduation pictures." "I went to a studio."
 "They gave me a jacket." "They took two pictures."
 "One of them is on my wall.")
(EPI-SCHEMA ((THEY339.SK ((ADV-A (TO.P ME338.SK)) GIVE.241.V) ME338.SK
              JACKET329.SK)
             ** E330.SK)
	(:ROLES
		(!R1 (JACKET329.SK INANIMATE_OBJECT.N))
		(!R2 (ME338.SK AGENT.N))
		(!R3 (JACKET329.SK JACKET.N))
		(!R4 (THEY339.SK AGENT.N))
		(!R5 (PRED?336.SK PRED?.N))
		(!R6 (PRED?336.SK (OF.P THEY339.SK)))
		(!R7 (WALL337.SK WALL.N))
		(!R8 (WALL337.SK (PERTAIN-TO ME338.SK)))
	)
	(:GOALS
		(?G1 (THEY339.SK (WANT.V (THAT (ME338.SK (HAVE.V JACKET329.SK))))))
	)
	(:PRECONDS
		(?I1 (THEY339.SK HAVE.V JACKET329.SK))
		(?I2 (NOT (ME338.SK HAVE.V JACKET329.SK)))
	)
	(:POSTCONDS
		(?P1 (NOT (THEY339.SK HAVE.V JACKET329.SK)))
		(?P2 (ME338.SK HAVE.V JACKET329.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E330.SK (BEFORE NOW77)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
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
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.5 0)
("I was walking down the street." "I saw this guy hanging out."
 "I noticed he had a watch." "I asked him the time." "He told me it was 5:11.")
(EPI-SCHEMA ((ME359.SK
              ((ADV-A (DOWN.P STREET342.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) WALK.281.V)))
              ?L2)
             ** E341.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (STREET342.SK STREET.N))
		(!R5 (ME359.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME359.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME359.SK (AT.P ?L1)))
		(?I2 (NOT (ME359.SK (AT.P ?L2))))
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
		(!W6 (E341.SK (BEFORE NOW80)))
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
; best schemas are:
; GIVE.V
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; TRAVEL.V
(setf matches (append matches '(( (5.4049997 5)
("A homeless man was on the street." "He asked for help."
 "Tina gave him a helping hand." "He was so thankful."
 "They both felt really good.")
(EPI-SCHEMA ((TINA.NAME FEED.288.V MAN360.SK HAND371.SK) ** E372.SK)
	(:ROLES
		(!R1 (TINA.NAME AGENT.N))
		(!R2 (MAN360.SK AGENT.N))
		(!R3 (HAND371.SK FOOD.N))
		(!R4 (NOT (TINA.NAME = MAN360.SK)))
		(!R5 (NOT (MAN360.SK = HAND371.SK)))
		(!R6 (NOT (TINA.NAME = HAND371.SK)))
		(!R7 (MAN360.SK MAN.N))
		(!R8 (MAN360.SK HOMELESS.A))
		(!R9 (HAND371.SK HAND.N))
		(!R10 (HAND371.SK HELPING.A))
	)
	(:GOALS
		(?G1 (TINA.NAME (WANT.V (THAT (NOT (MAN360.SK HUNGRY.A))))))
		(?G2 (TINA.NAME (WANT.V (THAT (MAN360.SK EAT.V HAND371.SK)))))
	)
	(:PRECONDS
		(?I1 (TINA.NAME HAVE.V HAND371.SK))
		(?I2 (MAN360.SK HUNGRY.A))
	)
	(:STEPS
		(?E1 (MAN360.SK EAT.V HAND371.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (TINA.NAME (HAVE.V HAND371.SK))))
		(?P2 (NOT (MAN360.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E372.SK))
		(!W2 (E372.SK (BEFORE NOW87)))
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

; story 18:
	; "I went to Texas last week."
	; "It was very fun."
	; "We had bbq food."
	; "It tasted very good."
	; "I wanted to go back."
; best schemas are:
; EAT.V
; FEED.V
; TRAVEL.V
; DRINK.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V

; story 19:
	; "Lucy was playing with her doll."
	; "All of the sudden her brother took it."
	; "Lucy started to cry."
	; "She asked for it back."
	; "Lucy needed it back right away."
; best schemas are:
; PLAY.V
; RECEIVING_VERB.?
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (3.078125 3)
("Lucy was playing with her doll." "All of the sudden her brother took it."
 "Lucy started to cry." "She asked for it back."
 "Lucy needed it back right away.")
(EPI-SCHEMA ((LUCY.NAME ((ADV-A (WITH.P DOLL387.SK)) PLAY.301.V) ?G) ** E385.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (DOLL387.SK TOY.N))
		(!R3 (DOLL387.SK INANIMATE_OBJECT.N))
		(!R4 (?G GAME.N))
		(!R5 (DOLL387.SK DOLL.N))
		(!R6 (DOLL387.SK (PERTAIN-TO LUCY.NAME)))
		(!R7 (BROTHER389.SK BROTHER.N))
		(!R8 (BROTHER389.SK (PERTAIN-TO LUCY.NAME)))
	)
	(:GOALS
		(?G1 (LUCY.NAME (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (LUCY.NAME HAVE.V DOLL387.SK))
	)
	(:POSTCONDS
		(?P1 (LUCY.NAME EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E385.SK (BEFORE NOW95)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.100312 2)
("Lucy was playing with her doll." "All of the sudden her brother took it."
 "Lucy started to cry." "She asked for it back."
 "Lucy needed it back right away.")
(EPI-SCHEMA ((BROTHER389.SK TAKE.302.V DOLL387.SK (AT.P-ARG ?L)) ** E388.SK)
	(:ROLES
		(!R1 (BROTHER389.SK AGENT.N))
		(!R2 (DOLL387.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (BROTHER389.SK = DOLL387.SK)))
		(!R5 (DOLL387.SK DOLL.N))
		(!R6 (BROTHER389.SK BROTHER.N))
		(!R7 (DOLL387.SK (PERTAIN-TO LUCY.NAME)))
		(!R8 (BROTHER389.SK (PERTAIN-TO LUCY.NAME)))
		(!R9 (E388.SK (RIGHT-AFTER U95)))
	)
	(:GOALS
		(?G1 (BROTHER389.SK (WANT.V (THAT (BROTHER389.SK (HAVE.V DOLL387.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (BROTHER389.SK HAVE.V DOLL387.SK)))
		(?I2 (BROTHER389.SK (AT.P ?L)))
		(?I3 (DOLL387.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (BROTHER389.SK HAVE.V DOLL387.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E388.SK))
		(!W2 (?I1 PRECOND-OF E388.SK))
		(!W3 (?I2 PRECOND-OF E388.SK))
		(!W4 (?I3 PRECOND-OF E388.SK))
		(!W5 (?P1 POSTCOND-OF E388.SK))
		(!W6 (E388.SK (SAME-TIME NOW96)))
		(!W7 (E391.SK (BEFORE NOW96)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("Lucy was playing with her doll." "All of the sudden her brother took it."
 "Lucy started to cry." "She asked for it back."
 "Lucy needed it back right away.")
(EPI-SCHEMA ((LUCY.NAME ((ADV-A (WITH.P DOLL387.SK)) PLAY.303.V) ?O) ** E385.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (DOLL387.SK DOLL.N))
		(!R4 (DOLL387.SK (PERTAIN-TO LUCY.NAME)))
		(!R5 (BROTHER389.SK BROTHER.N))
		(!R6 (BROTHER389.SK (PERTAIN-TO LUCY.NAME)))
	)
	(:GOALS
		(?G1 (LUCY.NAME (WANT.V (THAT (?O EXIST.V)))))
		(?G2 (LUCY.NAME (WANT.V (KA (HAVE.V ?O)))))
	)
	(:PRECONDS
		(?I1 (NOT (?O EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (?O EXIST.V))
		(?P2 (LUCY.NAME (HAVE.V ?O)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E385.SK (BEFORE NOW95)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 20:
	; "Lewis didn't do his homework."
	; "He had to go to summer school."
	; "He liked the teacher."
	; "They became good friends."
	; "Lewis learned a lot at summer school."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; MAKE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
(setf matches (append matches '(( (1.53125 1)
("Lewis didn't do his homework." "He had to go to summer school."
 "He liked the teacher." "They became good friends."
 "Lewis learned a lot at summer school.")
(EPI-SCHEMA ((LEWIS.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.308.V
              (KA (DO.V HOMEWORK399.SK)))
             ** ?E)
	(:ROLES
		(!R1 (LEWIS.NAME AGENT.N))
		(!R2 ((KA (DO.V HOMEWORK399.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (HOMEWORK399.SK (PERTAIN-TO LEWIS.NAME)))
		(!R5 (HOMEWORK399.SK HOMEWORK.N))
	)
	(:GOALS
		(?G1 (LEWIS.NAME (WANT.V (THAT (NOT (LEWIS.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (LEWIS.NAME (DO.V (KA (DO.V HOMEWORK399.SK))))) CAUSE-OF
    (KE (LEWIS.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E398.SK (NOT (LEWIS.NAME (DO.V (KA (DO.V HOMEWORK399.SK))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E398.SK))
		(!W2 (E398.SK (BEFORE NOW100)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 21:
	; "I had some wine a while ago."
	; "I wanted to like it."
	; "But it tasted so bad."
	; "I wanted to vomit."
	; "I never wanted to drink again."
; best schemas are:
; DRINK.V
; EAT.V
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V

; story 22:
	; "Clare found the letter."
	; "She opened it up."
	; "Inside was a small note."
	; "She threw the note away."
	; "She kept the envelope to use."
; best schemas are:
; SEARCH.V
; FIND.V
; PUT_IN_CONTAINER.V
; RECEIVING_VERB.?
; TRAVEL.V
(setf matches (append matches '(( (2.5 0)
("Clare found the letter." "She opened it up." "Inside was a small note."
 "She threw the note away." "She kept the envelope to use.")
(EPI-SCHEMA ((CLARE.NAME FIND.333.V LETTER429.SK) ** E430.SK)
	(:ROLES
		(!R1 (CLARE.NAME AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (LETTER429.SK LETTER.N))
	)
	(:PRECONDS
		(?I1 (CLARE.NAME (AT.P ?L)))
		(?I2 (LETTER429.SK (AT.P ?L)))
		(?I3 (CLARE.NAME ((ADV-A (FOR.P LETTER429.SK)) SEARCH.V)))
		(?I4 (NOT (CLARE.NAME (KNOW.V (THAT (LETTER429.SK (AT.P ?L)))))))
		(?I5 (NOT (CLARE.NAME (HAVE.V LETTER429.SK))))
	)
	(:POSTCONDS
		(?P1 (CLARE.NAME (KNOW.V (THAT (LETTER429.SK (AT.P ?L))))))
		(?P2 (CLARE.NAME (HAVE.V LETTER429.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E430.SK (BEFORE NOW110)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 23:
	; "The cat strolled through the house."
	; "It found something funny."
	; "There was a pink ball on the floor."
	; "The cat swatted the ball."
	; "The cat liked playing with the ball."
; best schemas are:
; TRAVEL.V
; MAKE.V
; PLAY.V
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
(setf matches (append matches '(( (2.405 0)
("The cat strolled through the house." "It found something funny."
 "There was a pink ball on the floor." "The cat swatted the ball."
 "The cat liked playing with the ball.")
(EPI-SCHEMA ((CAT444.SK
              ((ADV-A (THROUGH.P HOUSE446.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) STROLL.340.V)))
              ?L2)
             ** E443.SK)
	(:ROLES
		(!R1 (CAT444.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (HOUSE446.SK HOUSE.N))
		(!R6 (CAT444.SK CAT.N))
		(!R7 (E443.SK (RIGHT-AFTER U114)))
	)
	(:GOALS
		(?G1 (CAT444.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (CAT444.SK (AT.P ?L1)))
		(?I2 (NOT (CAT444.SK (AT.P ?L2))))
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
		(!W6 (E443.SK (SAME-TIME NOW115)))
		(!W7 (E447.SK (BEFORE NOW115)))
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
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (3.5 3)
("Fred loved fishing." "He loved going with his friends."
 "Fred went to the local pond yesterday." "He caught a large fish."
 "He brought it back to eat it.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P OBJECT474.SK)) ((ADV-A (FROM.P ?L1)) GO.350.V)))
              OBJECT474.SK)
             ** E475.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (OBJECT474.SK LOCATION.N))
		(!R4 (NOT (?L1 = OBJECT474.SK)))
	)
	(:GOALS
		(?G1 (FRED.NAME (WANT.V (KA ((ADV-A (AT.P OBJECT474.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P OBJECT474.SK))))
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
		(!W6 (E475.SK (BEFORE NOW122)))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 26:
	; "The man made a date."
	; "He was excited to go."
	; "He got ready for the date."
	; "He went to the meeting spot."
	; "His date never showed up."
; best schemas are:
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
; PLAY.V
; GIVE.V
(setf matches (append matches '(( (3.405 3)
("The man made a date." "He was excited to go." "He got ready for the date."
 "He went to the meeting spot." "His date never showed up.")
(EPI-SCHEMA ((MAN498.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P SPOT508.SK)) GO.401.V))
              SPOT508.SK)
             ** E509.SK)
	(:ROLES
		(!R1 (MAN498.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (SPOT508.SK LOCATION.N))
		(!R4 (NOT (?L1 = SPOT508.SK)))
		(!R5 (MAN498.SK MAN.N))
		(!R6 (SPOT508.SK ((NN MEETING.N) SPOT.N)))
		(!R7 (DATE500.SK (PERTAIN-TO MAN498.SK)))
		(!R8 (DATE500.SK DATE.N))
	)
	(:GOALS
		(?G1 (MAN498.SK (WANT.V (KA ((ADV-A (AT.P SPOT508.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN498.SK (AT.P ?L1)))
		(?I2 (NOT (MAN498.SK (AT.P SPOT508.SK))))
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
		(!W6 (E509.SK (BEFORE NOW133)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 3)
("The man made a date." "He was excited to go." "He got ready for the date."
 "He went to the meeting spot." "His date never showed up.")
(EPI-SCHEMA ((MAN498.SK ((ADV-A (WITH.P ?T)) PLAY.402.V) DATE500.SK) ** E497.SK)
	(:ROLES
		(!R1 (MAN498.SK AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (DATE500.SK GAME.N))
		(!R5 (DATE500.SK DATE.N))
		(!R6 (MAN498.SK MAN.N))
		(!R7 (DATE500.SK (PERTAIN-TO MAN498.SK)))
		(!R8 (E497.SK (RIGHT-AFTER U129)))
	)
	(:GOALS
		(?G1 (MAN498.SK (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (MAN498.SK HAVE.V ?T))
	)
	(:POSTCONDS
		(?P1 (MAN498.SK EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E497.SK (SAME-TIME NOW130)))
		(!W3 (E501.SK (BEFORE NOW130)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
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
; RECEIVING_VERB.?
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; EAT.V

; story 28:
	; "Tom got a call from his sister."
	; "She wanted to come over in three hours."
	; "His place was a mess."
	; "He cleaned his house."
	; "They had a good time at his house."
; best schemas are:
; RECEIVING_VERB.?
; GIVE.V
; EAT.V
; FEED.V
; PLAY.V
(setf matches (append matches '(( (4.1411133 2)
("Tom got a call from his sister." "She wanted to come over in three hours."
 "His place was a mess." "He cleaned his house."
 "They had a good time at his house.")
(EPI-SCHEMA ((TOM.NAME GET.413.V CALL533.SK (AT.P-ARG ?L)) ** E534.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (CALL533.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = CALL533.SK)))
		(!R5 (CALL533.SK CALL.N))
		(!R6 (TOM.NAME PLACE.N))
		(!R7 (TOM.NAME HOUSE.N))
		(!R8 (TOM.NAME (PERTAIN-TO HE.PRO)))
		(!R9 (HE.PRO MALE.A))
		(!R10 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (TOM.NAME (HAVE.V CALL533.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (TOM.NAME HAVE.V CALL533.SK)))
		(?I2 (TOM.NAME (AT.P ?L)))
		(?I3 (CALL533.SK (AT.P ?L)))
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
		(!W6 (E534.SK (BEFORE NOW140)))
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
; RECEIVING_VERB.?
; TRAVEL.V
; SIT.V
; SEARCH.V
; FIND.V

; story 30:
	; "I am pretty weak."
	; "I could not do one pull-up."
	; "I tried every day for a month."
	; "I started getting stronger."
	; "I can now do 5 pull-ups."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 31:
	; "Tom was tired of work."
	; "He decided to go on vacation."
	; "Tom was having a great time."
	; "He didn't want it to end."
	; "He extended it by days."
; best schemas are:
; TRAVEL.V

; story 32:
	; "The man played his guitar."
	; "He found something he liked."
	; "He wrote it down."
	; "He built off of it."
	; "He wrote a pretty good song."
; best schemas are:
; PLAY.V
; SEARCH.V
; FIND.V
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
(setf matches (append matches '(( (2.405 3)
("The man played his guitar." "He found something he liked."
 "He wrote it down." "He built off of it." "He wrote a pretty good song.")
(EPI-SCHEMA ((MAN598.SK ((ADV-A (WITH.P ?T)) PLAY.431.V) GUITAR601.SK) **
             E597.SK)
	(:ROLES
		(!R1 (MAN598.SK AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (GUITAR601.SK GAME.N))
		(!R5 (GUITAR601.SK GUITAR.N))
		(!R6 (GUITAR601.SK (PERTAIN-TO MAN598.SK)))
		(!R7 (MAN598.SK MAN.N))
		(!R8 (E597.SK (RIGHT-AFTER U159)))
	)
	(:GOALS
		(?G1 (MAN598.SK (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (MAN598.SK HAVE.V ?T))
	)
	(:POSTCONDS
		(?P1 (MAN598.SK EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E597.SK (SAME-TIME NOW160)))
		(!W3 (E602.SK (BEFORE NOW160)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 0)
("The man played his guitar." "He found something he liked."
 "He wrote it down." "He built off of it." "He wrote a pretty good song.")
(EPI-SCHEMA ((MAN598.SK FIND.436.V OBJECT604.SK) ** E606.SK)
	(:ROLES
		(!R1 (MAN598.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (MAN598.SK MAN.N))
		(!R4 (OBJECT604.SK (= (K SOMETHING.N))))
		(!R5 (GUITAR601.SK (PERTAIN-TO MAN598.SK)))
		(!R6 (GUITAR601.SK GUITAR.N))
	)
	(:PRECONDS
		(?I1 (MAN598.SK (AT.P ?L)))
		(?I2 (OBJECT604.SK (AT.P ?L)))
		(?I3 (MAN598.SK ((ADV-A (FOR.P OBJECT604.SK)) SEARCH.V)))
		(?I4 (NOT (MAN598.SK (KNOW.V (THAT (OBJECT604.SK (AT.P ?L)))))))
		(?I5 (NOT (MAN598.SK (HAVE.V OBJECT604.SK))))
	)
	(:POSTCONDS
		(?P1 (MAN598.SK (KNOW.V (THAT (OBJECT604.SK (AT.P ?L))))))
		(?P2 (MAN598.SK (HAVE.V OBJECT604.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E606.SK (BEFORE NOW161)))
		(!W2 (OBJECT605.SK (BEFORE NOW161)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.53 4)
("The man played his guitar." "He found something he liked."
 "He wrote it down." "He built off of it." "He wrote a pretty good song.")
(EPI-SCHEMA ((MAN598.SK PLAY.437.V GUITAR601.SK) ** E597.SK)
	(:ROLES
		(!R1 (MAN598.SK AGENT.N))
		(!R2 (GUITAR601.SK INANIMATE_OBJECT.N))
		(!R3 (GUITAR601.SK GUITAR.N))
		(!R4 (GUITAR601.SK (PERTAIN-TO MAN598.SK)))
		(!R5 (MAN598.SK MAN.N))
		(!R6 (E597.SK (RIGHT-AFTER U159)))
	)
	(:GOALS
		(?G1 (MAN598.SK (WANT.V (THAT (GUITAR601.SK EXIST.V)))))
		(?G2 (MAN598.SK (WANT.V (KA (HAVE.V GUITAR601.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (GUITAR601.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (GUITAR601.SK EXIST.V))
		(?P2 (MAN598.SK (HAVE.V GUITAR601.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E597.SK (SAME-TIME NOW160)))
		(!W2 (E602.SK (BEFORE NOW160)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 33:
	; "I like to play fire."
	; "One day I create a fire in my room."
	; "My bed was on fire."
	; "I burn my hand."
	; "I had a burn mark in my hand."
; best schemas are:
; PLAY.V
; MAKE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 34:
	; "Susan loved to feed her cat."
	; "She bought the best food for it."
	; "She got the food out for the cat."
	; "She put it in the bowl."
	; "The cat ate the food."
; best schemas are:
; FEED.V
; EAT.V
; RECEIVING_VERB.?
; PUT_IN_CONTAINER.V
; DRINK.V
(setf matches (append matches '(( (1.405 1)
("Susan loved to feed her cat." "She bought the best food for it."
 "She got the food out for the cat." "She put it in the bowl."
 "The cat ate the food.")
(EPI-SCHEMA ((?X FEED.445.V CAT655.SK FOOD679.SK) ** ?E)
	(:ROLES
		(!R1 (?X AGENT.N))
		(!R2 (CAT655.SK AGENT.N))
		(!R3 (NOT (?X = CAT655.SK)))
		(!R4 (NOT (CAT655.SK = FOOD679.SK)))
		(!R5 (NOT (?X = FOOD679.SK)))
		(!R6 (CAT655.SK CAT.N))
		(!R7 (FOOD679.SK FOOD.N))
		(!R8 (CAT655.SK (PERTAIN-TO SUSAN.NAME)))
		(!R9 (OUT669.SK ((NN FOOD.N) OUT.N)))
		(!R10 (OUT669.SK (FOR.P CAT655.SK)))
		(!R11 (E676.SK (RIGHT-AFTER U173)))
	)
	(:GOALS
		(?G1 (?X (WANT.V (THAT (NOT (CAT655.SK HUNGRY.A))))))
		(?G2 (?X (WANT.V (THAT (CAT655.SK EAT.V FOOD679.SK)))))
	)
	(:PRECONDS
		(?I1 (?X HAVE.V FOOD679.SK))
		(?I2 (CAT655.SK HUNGRY.A))
	)
	(:STEPS
		(E676.SK (CAT655.SK EAT.V FOOD679.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (?X (HAVE.V FOOD679.SK))))
		(?P2 (NOT (CAT655.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E676.SK AFTER ?E))
		(!W2 (E676.SK (SAME-TIME NOW174)))
		(!W3 (E681.SK (BEFORE NOW174)))
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
(setf matches (append matches '(( (1.405 1)
("Susan loved to feed her cat." "She bought the best food for it."
 "She got the food out for the cat." "She put it in the bowl."
 "The cat ate the food.")
(EPI-SCHEMA ((?X FEED.446.V CAT655.SK FOOD679.SK) ** ?E)
	(:ROLES
		(!R1 (?X AGENT.N))
		(!R2 (CAT655.SK AGENT.N))
		(!R3 (NOT (?X = CAT655.SK)))
		(!R4 (NOT (CAT655.SK = FOOD679.SK)))
		(!R5 (NOT (?X = FOOD679.SK)))
		(!R6 (CAT655.SK CAT.N))
		(!R7 (FOOD679.SK FOOD.N))
		(!R8 (OUT669.SK ((NN FOOD.N) OUT.N)))
		(!R9 (OUT669.SK (FOR.P CAT655.SK)))
		(!R10 (CAT655.SK (PERTAIN-TO SUSAN.NAME)))
		(!R11 (E676.SK (RIGHT-AFTER U173)))
	)
	(:GOALS
		(?G1 (?X (WANT.V (THAT (NOT (CAT655.SK HUNGRY.A))))))
		(?G2 (?X (WANT.V (THAT (CAT655.SK EAT.V FOOD679.SK)))))
	)
	(:PRECONDS
		(?I1 (?X HAVE.V FOOD679.SK))
		(?I2 (CAT655.SK HUNGRY.A))
	)
	(:STEPS
		(E681.SK (CAT655.SK EAT.V FOOD679.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (?X (HAVE.V FOOD679.SK))))
		(?P2 (NOT (CAT655.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E681.SK AFTER ?E))
		(!W2 (E681.SK (BEFORE NOW174)))
		(!W3 (E676.SK (SAME-TIME NOW174)))
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
(setf matches (append matches '(( (4.9049997 3)
("Susan loved to feed her cat." "She bought the best food for it."
 "She got the food out for the cat." "She put it in the bowl."
 "The cat ate the food.")
(EPI-SCHEMA ((CAT655.SK EAT.456.V FOOD679.SK) ** E676.SK)
	(:ROLES
		(!R1 (CAT655.SK AGENT.N))
		(!R2 (CAT655.SK CAT.N))
		(!R3 (FOOD679.SK FOOD.N))
		(!R4 (CAT655.SK (PERTAIN-TO SUSAN.NAME)))
		(!R5 (OUT669.SK ((NN FOOD.N) OUT.N)))
		(!R6 (OUT669.SK (FOR.P CAT655.SK)))
		(!R7 (E676.SK (RIGHT-AFTER U173)))
	)
	(:GOALS
		(?G1 (CAT655.SK (WANT.V (THAT (NOT (CAT655.SK HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 (CAT655.SK HAVE.V FOOD679.SK))
		(?I2 (CAT655.SK HUNGRY.A))
	)
	(:POSTCONDS
		(?P1 (NOT (CAT655.SK (HAVE.V FOOD679.SK))))
		(?P2 (NOT (CAT655.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E676.SK))
		(!W2 (?I1 BEFORE E676.SK))
		(!W3 (E676.SK CAUSE-OF ?P1))
		(!W4 (E676.SK (SAME-TIME NOW174)))
		(!W5 (E681.SK (BEFORE NOW174)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (4.0 3)
("Susan loved to feed her cat." "She bought the best food for it."
 "She got the food out for the cat." "She put it in the bowl."
 "The cat ate the food.")
(EPI-SCHEMA ((SUSAN.NAME GET.457.V OUT669.SK (AT.P-ARG ?L)) ** E672.SK)
	(:ROLES
		(!R1 (SUSAN.NAME AGENT.N))
		(!R2 (OUT669.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (SUSAN.NAME = OUT669.SK)))
		(!R5 (OUT669.SK ((NN FOOD.N) OUT.N)))
		(!R6 (CAT655.SK (PERTAIN-TO SUSAN.NAME)))
		(!R7 (OUT669.SK (FOR.P CAT655.SK)))
		(!R8 (CAT655.SK CAT.N))
	)
	(:GOALS
		(?G1 (SUSAN.NAME (WANT.V (THAT (SUSAN.NAME (HAVE.V OUT669.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SUSAN.NAME HAVE.V OUT669.SK)))
		(?I2 (SUSAN.NAME (AT.P ?L)))
		(?I3 (OUT669.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (SUSAN.NAME HAVE.V OUT669.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E672.SK))
		(!W2 (?I1 PRECOND-OF E672.SK))
		(!W3 (?I2 PRECOND-OF E672.SK))
		(!W4 (?I3 PRECOND-OF E672.SK))
		(!W5 (?P1 POSTCOND-OF E672.SK))
		(!W6 (E672.SK (BEFORE NOW172)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
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
; EAT.V
; FEED.V
; MAKE.V

; story 36:
	; "The man saw a rabbit."
	; "He was hungry."
	; "He chased the rabbit."
	; "The rabbit outran him."
	; "The man sat down in defeat."
; best schemas are:
; EAT.V
; FEED.V
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V

; story 37:
	; "Spencer went outside in the rain."
	; "He put on his boots."
	; "He stepped in his yard."
	; "The mud made him stick."
	; "He eventually got out."
; best schemas are:
; TRAVEL.V
(setf matches (append matches '(( (2.5 0)
("Spencer went outside in the rain." "He put on his boots."
 "He stepped in his yard." "The mud made him stick." "He eventually got out.")
(EPI-SCHEMA ((SPENCER.NAME
              ((ADV-A (IN.P RAIN720.SK))
               (OUTSIDE.ADV
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.495.V))))
              ?L2)
             ** E721.SK)
	(:ROLES
		(!R1 (SPENCER.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (RAIN720.SK RAIN.N))
		(!R6 (BOOT725.SK (PERTAIN-TO SPENCER.NAME)))
		(!R7 (BOOT725.SK (PLUR BOOT.N)))
		(!R8 (YARD732.SK (PERTAIN-TO SPENCER.NAME)))
		(!R9 (YARD732.SK YARD.N))
	)
	(:GOALS
		(?G1 (SPENCER.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SPENCER.NAME (AT.P ?L1)))
		(?I2 (NOT (SPENCER.NAME (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (SPENCER.NAME (AT.P ?L1))))
		(?P2 (SPENCER.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E721.SK))
		(!W2 (?I2 BEFORE E721.SK))
		(!W3 (?P1 AFTER E721.SK))
		(!W4 (?P2 AFTER E721.SK))
		(!W5 (?G1 CAUSE-OF E721.SK))
		(!W6 (E721.SK (BEFORE NOW185)))
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
;I threw them out."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 39:
	; "Brenda was a nurse."
	; "She had two kids."
	; "She moved to a new town."
	; "Then they grew up."
	; "So she went back to work."
; best schemas are:
; TRAVEL.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
; FIND.V
(setf matches (append matches '(( (3.6953125 2)
("Brenda was a nurse." "She had two kids." "She moved to a new town."
 "Then they grew up." "So she went back to work.")
(EPI-SCHEMA ((BRENDA.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TOWN755.SK)) MOVE.501.V))
              TOWN755.SK)
             ** E757.SK)
	(:ROLES
		(!R1 (BRENDA.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (TOWN755.SK LOCATION.N))
		(!R4 (NOT (?L1 = TOWN755.SK)))
		(!R5 (TOWN755.SK TOWN.N))
		(!R6 (TOWN755.SK NEW.A))
	)
	(:GOALS
		(?G1 (BRENDA.NAME (WANT.V (KA ((ADV-A (AT.P TOWN755.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BRENDA.NAME (AT.P ?L1)))
		(?I2 (NOT (BRENDA.NAME (AT.P TOWN755.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT (BRENDA.NAME (AT.P ?L1))))
		(?P2 (BRENDA.NAME (AT.P TOWN755.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E757.SK))
		(!W2 (?I2 BEFORE E757.SK))
		(!W3 (?P1 AFTER E757.SK))
		(!W4 (?P2 AFTER E757.SK))
		(!W5 (?G1 CAUSE-OF E757.SK))
		(!W6 (E757.SK (BEFORE NOW196)))
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
; SEARCH.V
; FIND.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
; PLAY.V
(setf matches (append matches '(( (3.405 3)
("The man liked a drug." "He tried to find some." "It was illegal."
 "The cops saw him." "The man went to jail.")
(EPI-SCHEMA ((MAN767.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K JAIL.N))) GO.537.V))
              (K JAIL.N))
             ** E779.SK)
	(:ROLES
		(!R1 (MAN767.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K JAIL.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K JAIL.N))))
		(!R5 (MAN767.SK MAN.N))
		(!R6 (E779.SK (RIGHT-AFTER U202)))
	)
	(:GOALS
		(?G1 (MAN767.SK (WANT.V (KA ((ADV-A (AT.P (K JAIL.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN767.SK (AT.P ?L1)))
		(?I2 (NOT (MAN767.SK (AT.P (K JAIL.N)))))
	)
	(:POSTCONDS
		(?P1 (NOT (MAN767.SK (AT.P ?L1))))
		(?P2 (MAN767.SK (AT.P (K JAIL.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E779.SK))
		(!W2 (?I2 BEFORE E779.SK))
		(!W3 (?P1 AFTER E779.SK))
		(!W4 (?P2 AFTER E779.SK))
		(!W5 (?G1 CAUSE-OF E779.SK))
		(!W6 (E779.SK (SAME-TIME NOW203)))
		(!W7 (E782.SK (BEFORE NOW203)))
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
; TRAVEL.V
; GIVE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; EAT.V

; story 42:
	; "Susie looked at her cd."
	; "It was all scratched."
	; "She wondered if it would work."
	; "Unfortunately it did not."
	; "She had to buy another one."
; best schemas are:
; TRAVEL.V

; story 43:
	; "Chad was going out for a pass."
	; "He was on in the parking lot."
	; "Someone was guarding him."
	; "He hit the ground hard."
	; "His arm was broken."
; best schemas are:

; story 44:
	; "Allie loved her device."
	; "She used it all the time."
	; "Then she found out she had ten percent left."
	; "It was not good."
	; "She was near done."
; best schemas are:
; GIVE.V

; story 45:
	; "Gary went to the pond."
	; "He cast his rod in it."
	; "He caught a fish."
	; "He pulled it up."
	; "It was actually a boot."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 46:
	; "Susie went to her sister's house."
	; "She heard too much yelling though."
	; "So she decided to leave."
	; "She couldn't take the yelling."
	; "It was to much for her."
; best schemas are:
; TRAVEL.V

; story 47:
	; "The boy sat at the table."
	; "He was expecting food."
	; "His mom saw him sitting there."
	; "She ignored him."
	; "The boy made his own food."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; MAKE.V
; SIT.V

; story 48:
	; "Susie loved Cheerios."
	; "But they weren't gluten free."
	; "So she couldn't eat them."
	; "Then she got a gluten free box."
	; "She loved it."
; best schemas are:
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (4.0 3)
("Susie loved Cheerios." "But they weren't gluten free."
 "So she couldn't eat them." "Then she got a gluten free box." "She loved it.")
(EPI-SCHEMA ((SUSIE.NAME GET.555.V GLUTEN902.SK (AT.P-ARG ?L)) ** E903.SK)
	(:ROLES
		(!R1 (SUSIE.NAME AGENT.N))
		(!R2 (GLUTEN902.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (SUSIE.NAME = GLUTEN902.SK)))
		(!R5 (GLUTEN902.SK GLUTEN.A))
	)
	(:GOALS
		(?G1 (SUSIE.NAME (WANT.V (THAT (SUSIE.NAME (HAVE.V GLUTEN902.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SUSIE.NAME HAVE.V GLUTEN902.SK)))
		(?I2 (SUSIE.NAME (AT.P ?L)))
		(?I3 (GLUTEN902.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (SUSIE.NAME HAVE.V GLUTEN902.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E903.SK))
		(!W2 (?I1 PRECOND-OF E903.SK))
		(!W3 (?I2 PRECOND-OF E903.SK))
		(!W4 (?I3 PRECOND-OF E903.SK))
		(!W5 (?P1 POSTCOND-OF E903.SK))
		(!W6 (E903.SK (BEFORE NOW242)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 50:
	; "I was at work."
	; "I was using the walking stacker."
	; "My friend stood in my way."
	; "He wanted me to get certified first."
	; "I almost ran him over."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; SIT.V
; TRAVEL.V
; GIVE.V
; RECEIVING_VERB.?

; story 51:
	; "Fred wanted to go on a ride."
	; "But the park wouldn't let him."
	; "He was too short."
	; "He begged but they said no."
	; "So he had to find something else."
; best schemas are:
; TRAVEL.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V

; story 52:
	; "A song played on the radio."
	; "The man had not heard the song before."
	; "He liked the song."
	; "He called the radio."
	; "They told him the name of the artist."
; best schemas are:
; PLAY.V
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (1.43625 1)
("A song played on the radio." "The man had not heard the song before."
 "He liked the song." "He called the radio."
 "They told him the name of the artist.")
(EPI-SCHEMA ((MAN970.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.626.V
              (KA ((BEFORE.ADV HEAR.V) SONG964.SK)))
             ** ?E)
	(:ROLES
		(!R1 (MAN970.SK AGENT.N))
		(!R2 ((KA ((BEFORE.ADV HEAR.V) SONG964.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (SONG964.SK SONG.N))
		(!R5 (MAN970.SK MAN.N))
		(!R6 (E973.SK (IMPINGES-ON E972.SK)))
	)
	(:GOALS
		(?G1 (MAN970.SK (WANT.V (THAT (NOT (MAN970.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN970.SK (DO.V (KA ((BEFORE.ADV HEAR.V) SONG964.SK))))) CAUSE-OF
    (KE (MAN970.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E972.SK (MAN970.SK (BEFORE.ADV DO.V) (KA ((BEFORE.ADV HEAR.V) SONG964.SK))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E972.SK))
		(!W2 (E972.SK (BEFORE NOW260)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.43625 1)
("A song played on the radio." "The man had not heard the song before."
 "He liked the song." "He called the radio."
 "They told him the name of the artist.")
(EPI-SCHEMA ((MAN970.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.627.V
              (KA ((BEFORE.ADV HEAR.V) SONG964.SK)))
             ** ?E)
	(:ROLES
		(!R1 (MAN970.SK AGENT.N))
		(!R2 ((KA ((BEFORE.ADV HEAR.V) SONG964.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (MAN970.SK MAN.N))
		(!R5 (SONG964.SK SONG.N))
		(!R6 (E973.SK (IMPINGES-ON E972.SK)))
	)
	(:GOALS
		(?G1 (MAN970.SK (WANT.V (THAT (NOT (MAN970.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN970.SK (DO.V (KA ((BEFORE.ADV HEAR.V) SONG964.SK))))) CAUSE-OF
    (KE (MAN970.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E973.SK (MAN970.SK (BEFORE.ADV DO.V) (KA ((BEFORE.ADV HEAR.V) SONG964.SK))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E973.SK))
		(!W2 (E972.SK (BEFORE NOW260)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 54:
	; "I ate a big muffin."
	; "But it wouldn't go away!"
	; "There always seemed to be more!"
	; "So I ate more!"
	; "Now I'm sick to my stomach."
; best schemas are:
; EAT.V
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (4.5 4)
("I ate a big muffin." "But it wouldn't go away!"
 "There always seemed to be more!" "So I ate more!"
 "Now I'm sick to my stomach.")
(EPI-SCHEMA ((ME1017.SK EAT.687.V OBJECT1010.SK) ** E1011.SK)
	(:ROLES
		(!R1 (OBJECT1010.SK FOOD.N))
		(!R2 (ME1017.SK AGENT.N))
		(!R3 (STOMACH1016.SK STOMACH.N))
		(!R4 (STOMACH1016.SK (PERTAIN-TO ME1017.SK)))
	)
	(:GOALS
		(?G1 (ME1017.SK (WANT.V (THAT (NOT (ME1017.SK HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 (ME1017.SK HAVE.V OBJECT1010.SK))
		(?I2 (ME1017.SK HUNGRY.A))
	)
	(:POSTCONDS
		(?P1 (NOT (ME1017.SK (HAVE.V OBJECT1010.SK))))
		(?P2 (NOT (ME1017.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E1011.SK))
		(!W2 (?I1 BEFORE E1011.SK))
		(!W3 (E1011.SK CAUSE-OF ?P1))
		(!W4 (E1011.SK (BEFORE NOW269)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 55:
	; "Lucy was searching on YouTube."
	; "She found a great song."
	; "She listened to it all day."
	; "Lucy loved it."
	; "She wanted to buy the album."
; best schemas are:
; SEARCH.V
; FIND.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (3.5 1)
("Lucy was searching on YouTube." "She found a great song."
 "She listened to it all day." "Lucy loved it." "She wanted to buy the album.")
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-A (ON.P YOUTUBE.NAME))
               ((ADV-A (FOR.P SONG1027.SK)) SEARCH.695.V)))
             ** E1022.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?LX LOCATION.N))
		(!R3 (?LO LOCATION.N))
		(!R4 (SONG1027.SK SONG.N))
		(!R5 (SONG1027.SK GREAT.A))
		(!R6 (SONG1027.SK ALBUM.N))
	)
	(:GOALS
		(E1038.SK (LUCY.NAME (WANT.V (KA (FIND.V SONG1027.SK)))))
		(?G2 (LUCY.NAME (WANT.V (KA (HAVE.V SONG1027.SK)))))
	)
	(:PRECONDS
		(?I1 (LUCY.NAME (AT.P ?LX)))
		(?I2 (SONG1027.SK (AT.P ?LO)))
		(?I3 (NOT (LUCY.NAME (KNOW.V (THAT (SONG1027.SK (AT.P ?LO)))))))
	)
	(:POSTCONDS
		(E1028.SK (LUCY.NAME (FIND.V SONG1027.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1022.SK (BEFORE NOW274)))
		(!W2 (E1028.SK (BEFORE NOW275)))
		(!W3 (E1038.SK (BEFORE NOW278)))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("Lucy was searching on YouTube." "She found a great song."
 "She listened to it all day." "Lucy loved it." "She wanted to buy the album.")
(EPI-SCHEMA ((LUCY.NAME FIND.696.V SONG1027.SK) ** E1028.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (SONG1027.SK SONG.N))
		(!R4 (SONG1027.SK GREAT.A))
		(!R5 (SONG1027.SK ALBUM.N))
	)
	(:PRECONDS
		(?I1 (LUCY.NAME (AT.P ?L)))
		(?I2 (SONG1027.SK (AT.P ?L)))
		(E1022.SK
   (LUCY.NAME
    ((ADV-A (ON.P YOUTUBE.NAME)) ((ADV-A (FOR.P SONG1027.SK)) SEARCH.V))))
		(?I4 (NOT (LUCY.NAME (KNOW.V (THAT (SONG1027.SK (AT.P ?L)))))))
		(?I5 (NOT (LUCY.NAME (HAVE.V SONG1027.SK))))
	)
	(:POSTCONDS
		(?P1 (LUCY.NAME (KNOW.V (THAT (SONG1027.SK (AT.P ?L))))))
		(?P2 (LUCY.NAME (HAVE.V SONG1027.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1022.SK (BEFORE NOW274)))
		(!W2 (E1028.SK (BEFORE NOW275)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
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
; TRAVEL.V
; MAKE.V
; PUT_IN_CONTAINER.V
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V

; story 57:
	; "Kara wanted to go swimming."
	; "She went to the lake."
	; "There, she dove into the water."
	; "She swam for almost an hour!"
	; "After, she felt refreshed and happy."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (4.5 3)
("Kara wanted to go swimming." "She went to the lake."
 "There, she dove into the water." "She swam for almost an hour!"
 "After, she felt refreshed and happy.")
(EPI-SCHEMA ((KARA.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P LAKE1062.SK)) GO.781.V))
              LAKE1062.SK)
             ** E1063.SK)
	(:ROLES
		(!R1 (KARA.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (LAKE1062.SK LOCATION.N))
		(!R4 (NOT (?L1 = LAKE1062.SK)))
		(!R5 (LAKE1062.SK LAKE.N))
	)
	(:GOALS
		(E1060.SK (KARA.NAME (WANT.V (KA ((ADV-A (AT.P LAKE1062.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (KARA.NAME (AT.P ?L1)))
		(?I2 (NOT (KARA.NAME (AT.P LAKE1062.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT (KARA.NAME (AT.P ?L1))))
		(?P2 (KARA.NAME (AT.P LAKE1062.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1063.SK))
		(!W2 (?I2 BEFORE E1063.SK))
		(!W3 (?P1 AFTER E1063.SK))
		(!W4 (?P2 AFTER E1063.SK))
		(!W5 (E1060.SK CAUSE-OF E1063.SK))
		(!W6 (E1060.SK (BEFORE NOW284)))
		(!W7 (E1063.SK (BEFORE NOW285)))
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
; best schemas are:
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; TRAVEL.V
; GIVE.V
(setf matches (append matches '(( (2.405 1)
("The man ran very fast." "He stopped to catch his breath."
 "He was more tired than he thought." "He sat down for a break."
 "He didn't feel like running after that.")
(EPI-SCHEMA ((MAN1070.SK
              ((ADV-A (FOR.P BREAK1079.SK))
               (DOWN.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.784.V)))))
             ** E1080.SK)
	(:ROLES
		(!R1 (MAN1070.SK AGENT.N))
		(!R2 (?S INANIMATE_OBJECT.N))
		(!R3 (?S FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (MAN1070.SK MAN.N))
		(!R6 (BREAK1079.SK BREAK.N))
		(!R7 (BREATH1074.SK (PERTAIN-TO MAN1070.SK)))
		(!R8 (BREATH1074.SK BREATH.N))
	)
	(:GOALS
		(?G1 (MAN1070.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (MAN1070.SK (AT.P ?L)))
		(?I2 (?S (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1080.SK (BEFORE NOW292)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.43625 1)
("The man ran very fast." "He stopped to catch his breath."
 "He was more tired than he thought." "He sat down for a break."
 "He didn't feel like running after that.")
(EPI-SCHEMA ((MAN1070.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.785.V
              (KA
               ((ADV-A
                 (L #:G1091718
                  (AND (#:G1091718 LIKE.P)
                       (#:G1091718
                        (=
                         (KA
                          ((ADV-A (AFTER.P NEW-SALIENT-ENTITY*1084.SK))
                           RUN.V)))))))
                FEEL.V)))
             ** ?E)
	(:ROLES
		(!R1 (MAN1070.SK AGENT.N))
		(!R2
   ((KA
     ((ADV-A
       (L #:G1091718
        (AND (#:G1091718 LIKE.P)
             (#:G1091718
              (= (KA ((ADV-A (AFTER.P NEW-SALIENT-ENTITY*1084.SK)) RUN.V)))))))
      FEEL.V))
    ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (MAN1070.SK MAN.N))
		(!R5 (NEW-SALIENT-ENTITY*1084.SK NEW-SALIENT-ENTITY*.N))
		(!R6 (NEW-SALIENT-ENTITY*1084.SK PRED?.N))
		(!R7 (BREATH1074.SK (PERTAIN-TO MAN1070.SK)))
		(!R8 (BREATH1074.SK BREATH.N))
	)
	(:GOALS
		(?G1 (MAN1070.SK (WANT.V (THAT (NOT (MAN1070.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE
     (MAN1070.SK
      (DO.V
       (KA
        ((ADV-A
          (L #:G1091718
           (AND (#:G1091718 LIKE.P)
                (#:G1091718
                 (=
                  (KA
                   ((ADV-A (AFTER.P NEW-SALIENT-ENTITY*1084.SK)) RUN.V)))))))
         FEEL.V)))))
    CAUSE-OF (KE (MAN1070.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1085.SK
   (MAN1070.SK
    ((ADV-A
      (L #:G1091718
       (AND (#:G1091718 LIKE.P)
            (#:G1091718
             (= (KA ((ADV-A (AFTER.P NEW-SALIENT-ENTITY*1084.SK)) RUN.V)))))))
     DO.V)
    (KA
     ((ADV-A
       (L #:G1091718
        (AND (#:G1091718 LIKE.P)
             (#:G1091718
              (= (KA ((ADV-A (AFTER.P NEW-SALIENT-ENTITY*1084.SK)) RUN.V)))))))
      FEEL.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1085.SK))
		(!W2 (E1085.SK (BEFORE NOW293)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 0)
("The man ran very fast." "He stopped to catch his breath."
 "He was more tired than he thought." "He sat down for a break."
 "He didn't feel like running after that.")
(EPI-SCHEMA ((MAN1070.SK
              (VERY.ADV
               (FAST.ADV
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.794.V))))
              ?L2)
             ** E1069.SK)
	(:ROLES
		(!R1 (MAN1070.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (MAN1070.SK MAN.N))
		(!R6 (BREATH1074.SK (PERTAIN-TO MAN1070.SK)))
		(!R7 (BREATH1074.SK BREATH.N))
	)
	(:GOALS
		(?G1 (MAN1070.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1070.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1070.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1070.SK (AT.P ?L1))))
		(?P2 (MAN1070.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1069.SK))
		(!W2 (?I2 BEFORE E1069.SK))
		(!W3 (?P1 AFTER E1069.SK))
		(!W4 (?P2 AFTER E1069.SK))
		(!W5 (?G1 CAUSE-OF E1069.SK))
		(!W6 (E1069.SK (BEFORE NOW289)))
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
; best schemas are:
; SEARCH.V
; FIND.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (2.405 2)
("The man shopped for pants." "He couldn't find any that fit."
 "He found a big and tall store." "He found some pants that fit."
 "He bought some pants there.")
(EPI-SCHEMA ((MAN1087.SK
              (BE.PASV ((ADV-A (FOR.P (K (PLUR PANT.N)))) SHOP.797.V)))
             ** E1086.SK)
	(:ROLES
		(!R1 (MAN1087.SK AGENT.N))
		(!R2 (?LX LOCATION.N))
		(!R3 (?LO LOCATION.N))
		(!R4 (E1086.SK (RIGHT-AFTER U293)))
		(!R5 (MAN1087.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN1087.SK (WANT.V (KA (FIND.V (K (PLUR PANT.N)))))))
		(?G2 (MAN1087.SK (WANT.V (KA (HAVE.V (K (PLUR PANT.N)))))))
	)
	(:PRECONDS
		(?I1 (MAN1087.SK (AT.P ?LX)))
		(?I2 ((K (PLUR PANT.N)) (AT.P ?LO)))
		(?I3 (NOT (MAN1087.SK (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?LO)))))))
	)
	(:POSTCONDS
		(E1092.SK (MAN1087.SK (FIND.V (K (PLUR PANT.N)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1086.SK (SAME-TIME NOW294)))
		(!W2 (E1092.SK (BEFORE NOW296)))
	)
)
))))
(setf matches (append matches '(( (2.405 0)
("The man shopped for pants." "He couldn't find any that fit."
 "He found a big and tall store." "He found some pants that fit."
 "He bought some pants there.")
(EPI-SCHEMA ((MAN1087.SK FIND.798.V (K (PLUR PANT.N))) ** E1092.SK)
	(:ROLES
		(!R1 (MAN1087.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (E1086.SK (RIGHT-AFTER U293)))
		(!R4 (MAN1087.SK MAN.N))
	)
	(:PRECONDS
		(?I1 (MAN1087.SK (AT.P ?L)))
		(?I2 ((K (PLUR PANT.N)) (AT.P ?L)))
		(E1086.SK (MAN1087.SK (BE.PASV ((ADV-A (FOR.P (K (PLUR PANT.N)))) SEARCH.V))))
		(?I4 (NOT (MAN1087.SK (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?L)))))))
		(?I5 (NOT (MAN1087.SK (HAVE.V (K (PLUR PANT.N))))))
	)
	(:POSTCONDS
		(?P1 (MAN1087.SK (KNOW.V (THAT ((K (PLUR PANT.N)) (AT.P ?L))))))
		(?P2 (MAN1087.SK (HAVE.V (K (PLUR PANT.N)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1086.SK (SAME-TIME NOW294)))
		(!W2 (E1092.SK (BEFORE NOW296)))
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
; best schemas are:
; GIVE.V
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; TRAVEL.V
(setf matches (append matches '(( (3.625 2)
("Julie's dog was always cold." "She gave her a dog sweater."
 "The dog loved it!" "She could run around outside in the cold."
 "Julie liked to see her dog happy.")
(EPI-SCHEMA ((SHE.PRO ((ADV-A (TO.P SHE.PRO)) GIVE.800.V) SHE.PRO
              SWEATER1110.SK)
             ** E1111.SK)
	(:ROLES
		(!R1 (SWEATER1110.SK INANIMATE_OBJECT.N))
		(!R2 (SWEATER1110.SK ((NN DOG.N) SWEATER.N)))
		(!R3 (SHE.PRO FEMALE.A))
		(!R4 (SHE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (SHE.PRO (HAVE.V SWEATER1110.SK))))))
	)
	(:PRECONDS
		(?I1 (SHE.PRO HAVE.V SWEATER1110.SK))
		(?I2 (NOT (SHE.PRO HAVE.V SWEATER1110.SK)))
	)
	(:POSTCONDS
		(?P1 (NOT (SHE.PRO HAVE.V SWEATER1110.SK)))
		(?P2 (SHE.PRO HAVE.V SWEATER1110.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1111.SK (BEFORE NOW300)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 61:
	; "My son had just started eating foods."
	; "We gave him some peaches to start out on."
	; "He loved them."
	; "I think he got more on him than in him."
	; "It was really funny."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 62:
	; "I went to the mall yesterday."
	; "I thought there was a sale."
	; "So I showed up at the store."
	; "There was no sale."
	; "I was so upset."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (3.5 3)
("I went to the mall yesterday." "I thought there was a sale."
 "So I showed up at the store." "There was no sale." "I was so upset.")
(EPI-SCHEMA ((ME1152.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P MALL1135.SK)) ((ADV-A (FROM.P ?L1)) GO.828.V)))
              MALL1135.SK)
             ** E1136.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (MALL1135.SK LOCATION.N))
		(!R3 (NOT (?L1 = MALL1135.SK)))
		(!R4 (ME1152.SK AGENT.N))
		(!R5 (MALL1135.SK MALL.N))
		(!R6 (MALL1135.SK STORE.N))
	)
	(:GOALS
		(?G1 (ME1152.SK (WANT.V (KA ((ADV-A (AT.P MALL1135.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1152.SK (AT.P ?L1)))
		(?I2 (NOT (ME1152.SK (AT.P MALL1135.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT (ME1152.SK (AT.P ?L1))))
		(?P2 (ME1152.SK (AT.P MALL1135.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1136.SK))
		(!W2 (?I2 BEFORE E1136.SK))
		(!W3 (?P1 AFTER E1136.SK))
		(!W4 (?P2 AFTER E1136.SK))
		(!W5 (?G1 CAUSE-OF E1136.SK))
		(!W6 (E1136.SK (BEFORE NOW309)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 64:
	; "Kim needed some new chairs."
	; "She threw away her old ones."
	; "Kim went to the store and got more."
	; "She set up her chairs."
	; "They looked nice."
; best schemas are:
; TRAVEL.V
; SIT.V
(setf matches (append matches '(( (3.5 3)
("Kim needed some new chairs." "She threw away her old ones."
 "Kim went to the store and got more." "She set up her chairs."
 "They looked nice.")
(EPI-SCHEMA ((KIM.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE1176.SK)) GO.839.V))
              STORE1176.SK)
             ** E1178.SK)
	(:ROLES
		(!R1 (KIM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE1176.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE1176.SK)))
		(!R5 (STORE1176.SK STORE.N))
		(!R6 (OBJECT1173.SK (PERTAIN-TO KIM.NAME)))
	)
	(:GOALS
		(?G1 (KIM.NAME (WANT.V (KA ((ADV-A (AT.P STORE1176.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (KIM.NAME (AT.P ?L1)))
		(?I2 (NOT (KIM.NAME (AT.P STORE1176.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT (KIM.NAME (AT.P ?L1))))
		(?P2 (KIM.NAME (AT.P STORE1176.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1178.SK))
		(!W2 (?I2 BEFORE E1178.SK))
		(!W3 (?P1 AFTER E1178.SK))
		(!W4 (?P2 AFTER E1178.SK))
		(!W5 (?G1 CAUSE-OF E1178.SK))
		(!W6 (E1178.SK (BEFORE NOW321)))
		(!W7 (OBJECT1177.SK (BEFORE NOW321)))
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
; best schemas are:
; TRAVEL.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
; FIND.V
(setf matches (append matches '(( (3.5 3)
("A new restaurant opened in town." "I was eager to try it." "It looked good."
 "So I went to it." "But the line was so long I ended up leaving.")
(EPI-SCHEMA ((ME1194.SK
              ((ADV-A (FROM.P ?L1))
               ((ADV-A (TO.P RESTAURANT1185.SK)) GO.843.V))
              RESTAURANT1185.SK)
             ** E1189.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (RESTAURANT1185.SK LOCATION.N))
		(!R3 (NOT (?L1 = RESTAURANT1185.SK)))
		(!R4 (RESTAURANT1185.SK ((ADV-A (IN.P (K TOWN.N))) (BE.PASV OPEN.V))))
		(!R5 (RESTAURANT1185.SK NEW.A))
		(!R6 (RESTAURANT1185.SK RESTAURANT.N))
		(!R7 (ME1194.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME1194.SK (WANT.V (KA ((ADV-A (AT.P RESTAURANT1185.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME1194.SK (AT.P ?L1)))
		(?I2 (NOT (ME1194.SK (AT.P RESTAURANT1185.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT (ME1194.SK (AT.P ?L1))))
		(?P2 (ME1194.SK (AT.P RESTAURANT1185.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1189.SK))
		(!W2 (?I2 BEFORE E1189.SK))
		(!W3 (?P1 AFTER E1189.SK))
		(!W4 (?P2 AFTER E1189.SK))
		(!W5 (?G1 CAUSE-OF E1189.SK))
		(!W6 (E1189.SK (BEFORE NOW327)))
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
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (4.1953125 2)
("It was my son's first birthday." "I cannot believe how fast it has gone by."
 "He is getting so big." "He got a smash cake for himself." "He loved it.")
(EPI-SCHEMA ((HE.PRO GET.857.V CAKE1202.SK (AT.P-ARG ?L)) ** E1203.SK)
	(:ROLES
		(!R1 (CAKE1202.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = CAKE1202.SK)))
		(!R4 (CAKE1202.SK ((NN SMASH.N) CAKE.N)))
		(!R5 (HE.PRO MALE.A))
		(!R6 (HE.PRO AGENT.N))
		(!R7 (CAKE1202.SK (FOR.P HIMSELF1207.SK)))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (HE.PRO (HAVE.V CAKE1202.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (HE.PRO HAVE.V CAKE1202.SK)))
		(?I2 (HE.PRO (AT.P ?L)))
		(?I3 (CAKE1202.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (HE.PRO HAVE.V CAKE1202.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1203.SK))
		(!W2 (?I1 PRECOND-OF E1203.SK))
		(!W3 (?I2 PRECOND-OF E1203.SK))
		(!W4 (?I3 PRECOND-OF E1203.SK))
		(!W5 (?P1 POSTCOND-OF E1203.SK))
		(!W6 (E1203.SK (BEFORE NOW332)))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 68:
	; "Tyra is a poor."
	; "Tyra is a homeless."
	; "Tyra has to beg on the street for money."
	; "Tyra catches a break one day."
	; "A man gives her money and a place to live."
; best schemas are:
; GIVE.V
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 69:
	; "The boy ran into the kitchen."
	; "His hand hit the cup on the table."
	; "It hit the ground with a bounce."
	; "The cup did not break."
	; "The cup was made of plastic."
; best schemas are:
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PUT_IN_CONTAINER.V
; TRAVEL.V
; PLAY.V

; story 70:
	; "Matt left his window open."
	; "His cat got out of the house."
	; "Matt looked for his cat."
	; "He put posters up to find his cat."
	; "Someone called him with his cat."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 71:
	; "A family really loved rainbows."
	; "They would always look for them."
	; "It rained one day."
	; "They looked outside."
	; "They saw a rainbow."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; TRAVEL.V

; story 72:
	; "The man mixed a drink."
	; "It tasted very good."
	; "His friend asked for one."
	; "The man made his friend a drink."
	; "His friend gave the drink it's own name."
; best schemas are:
; GIVE.V
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; DRINK.V
; FEED.V

; story 73:
	; "Tom was a ten year old boy."
	; "Tom lived with his parents."
	; "Tom wanted a pet."
	; "His parents did not allow pets in the house."
	; "Tom cried."
; best schemas are:
; GIVE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (1.43625 1)
("Tom was a ten year old boy." "Tom lived with his parents."
 "Tom wanted a pet." "His parents did not allow pets in the house."
 "Tom cried.")
(EPI-SCHEMA ((PARENT1320.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1029.V
              (KA (ALLOW.V OBJECT1327.SK)))
             ** ?E)
	(:ROLES
		(!R1 (PARENT1320.SK AGENT.N))
		(!R2 ((KA (ALLOW.V OBJECT1327.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (PARENT1320.SK (PLUR PARENT.N)))
		(!R5 (OBJECT1327.SK (= (K (PLUR PET.N)))))
		(!R6 (PARENT1320.SK (PERTAIN-TO TOM.NAME)))
		(!R7 (OBJECT1327.SK (IN.P HOUSE1328.SK)))
		(!R8 (HOUSE1328.SK HOUSE.N))
	)
	(:GOALS
		(?G1 (PARENT1320.SK (WANT.V (THAT (NOT (PARENT1320.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (PARENT1320.SK (DO.V (KA (ALLOW.V OBJECT1327.SK))))) CAUSE-OF
    (KE (PARENT1320.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1331.SK (NOT (PARENT1320.SK (DO.V (KA (ALLOW.V OBJECT1327.SK))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1331.SK))
		(!W2 (E1331.SK (BEFORE NOW367)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 74:
	; "Tom loved playing baseball."
	; "He had a big game."
	; "He was up to hit."
	; "He hit a long drive."
	; "He was able to make a run and win the game."
; best schemas are:
; PLAY.V
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?

; story 75:
	; "Tom had a cabin near a river."
	; "He would visit often."
	; "ONe day the river flooded."
	; "Tom's cabin was swept away."
	; "Tom was sad for years."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 76:
	; "The man folded the clothes."
	; "He put them away."
	; "The next day they were gone."
	; "He went to look for them."
	; "His wife was refolding them."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.405 0)
("The man folded the clothes." "He put them away."
 "The next day they were gone." "He went to look for them."
 "His wife was refolding them.")
(EPI-SCHEMA ((MAN1366.SK
              ((ADV-A (FOR.P (KA ((ADV-A (FOR.P CLOTHE1369.SK)) LOOK.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.1083.V)))
              ?L2)
             ** E1377.SK)
	(:ROLES
		(!R1 (MAN1366.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (CLOTHE1369.SK (PLUR CLOTHE.N)))
		(!R6 (MAN1366.SK MAN.N))
		(!R7 (WIFE1380.SK (PERTAIN-TO MAN1366.SK)))
		(!R8 (WIFE1380.SK WIFE.N))
	)
	(:GOALS
		(?G1 (MAN1366.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1366.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1366.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1366.SK (AT.P ?L1))))
		(?P2 (MAN1366.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1377.SK))
		(!W2 (?I2 BEFORE E1377.SK))
		(!W3 (?P1 AFTER E1377.SK))
		(!W4 (?P2 AFTER E1377.SK))
		(!W5 (?G1 CAUSE-OF E1377.SK))
		(!W6 (E1377.SK (BEFORE NOW382)))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 78:
	; "Gary loved to ride bikes."
	; "He met a girl who did, too."
	; "He asked her on a date."
	; "They got their bikes together."
	; "They rode around the town."
; best schemas are:
; RECEIVING_VERB.?
; SIT.V
; TRAVEL.V
; SEARCH.V
; FIND.V
(setf matches (append matches '(( (4.1953125 5)
("Gary loved to ride bikes." "He met a girl who did, too."
 "He asked her on a date." "They got their bikes together."
 "They rode around the town.")
(EPI-SCHEMA ((THEY1413.SK GET.1111.V BIKE1408.SK (AT.P-ARG TOWN1411.SK)) **
             E1409.SK)
	(:ROLES
		(!R1 (BIKE1408.SK INANIMATE_OBJECT.N))
		(!R2 (TOWN1411.SK LOCATION.N))
		(!R3 (NOT (THEY1413.SK = BIKE1408.SK)))
		(!R4 (BIKE1408.SK (PLUR BIKE.N)))
		(!R5 (BIKE1408.SK (PERTAIN-TO THEY1413.SK)))
		(!R6 (THEY1413.SK AGENT.N))
		(!R7 (TOWN1411.SK TOWN.N))
	)
	(:GOALS
		(?G1 (THEY1413.SK (WANT.V (THAT (THEY1413.SK (HAVE.V BIKE1408.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (THEY1413.SK HAVE.V BIKE1408.SK)))
		(?I2 (THEY1413.SK (AT.P TOWN1411.SK)))
		(?I3 (BIKE1408.SK (AT.P TOWN1411.SK)))
	)
	(:POSTCONDS
		(?P1 (THEY1413.SK HAVE.V BIKE1408.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1409.SK))
		(!W2 (?I1 PRECOND-OF E1409.SK))
		(!W3 (?I2 PRECOND-OF E1409.SK))
		(!W4 (?I3 PRECOND-OF E1409.SK))
		(!W5 (?P1 POSTCOND-OF E1409.SK))
		(!W6 (E1409.SK (BEFORE NOW392)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 1)
("Gary loved to ride bikes." "He met a girl who did, too."
 "He asked her on a date." "They got their bikes together."
 "They rode around the town.")
(EPI-SCHEMA ((THEY1413.SK
              ((ADV-A (AROUND.P TOWN1411.SK))
               ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) RIDE.1112.V))))
             ** E1412.SK)
	(:ROLES
		(!R1 (?S INANIMATE_OBJECT.N))
		(!R2 (?S FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (THEY1413.SK AGENT.N))
		(!R5 (TOWN1411.SK TOWN.N))
		(!R6 (BIKE1408.SK (PERTAIN-TO THEY1413.SK)))
		(!R7 (BIKE1408.SK (PLUR BIKE.N)))
	)
	(:GOALS
		(?G1 (THEY1413.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (THEY1413.SK (AT.P ?L)))
		(?I2 (?S (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1412.SK (BEFORE NOW393)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("Gary loved to ride bikes." "He met a girl who did, too."
 "He asked her on a date." "They got their bikes together."
 "They rode around the town.")
(EPI-SCHEMA ((THEY1413.SK
              ((ADV-A (AROUND.P TOWN1411.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RIDE.1113.V)))
              ?L2)
             ** E1412.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (THEY1413.SK AGENT.N))
		(!R5 (TOWN1411.SK TOWN.N))
		(!R6 (BIKE1408.SK (PERTAIN-TO THEY1413.SK)))
		(!R7 (BIKE1408.SK (PLUR BIKE.N)))
	)
	(:GOALS
		(?G1 (THEY1413.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (THEY1413.SK (AT.P ?L1)))
		(?I2 (NOT (THEY1413.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (THEY1413.SK (AT.P ?L1))))
		(?P2 (THEY1413.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1412.SK))
		(!W2 (?I2 BEFORE E1412.SK))
		(!W3 (?P1 AFTER E1412.SK))
		(!W4 (?P2 AFTER E1412.SK))
		(!W5 (?G1 CAUSE-OF E1412.SK))
		(!W6 (E1412.SK (BEFORE NOW393)))
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
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (1.43625 1)
("The man was cooking." "He knocked over some oil."
 "The oil fell on the floor." "He did not notice." "He slipped on the oil.")
(EPI-SCHEMA ((MAN1415.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.1127.V
              (KA NOTICE.V))
             ** ?E)
	(:ROLES
		(!R1 (MAN1415.SK AGENT.N))
		(!R2 ((KA NOTICE.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (MAN1415.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN1415.SK (WANT.V (THAT (NOT (MAN1415.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN1415.SK (DO.V (KA NOTICE.V)))) CAUSE-OF
    (KE (MAN1415.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1425.SK (NOT (MAN1415.SK (DO.V (KA NOTICE.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E1425.SK))
		(!W2 (E1425.SK (BEFORE NOW397)))
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
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.5 0)
("Tony was out playing with friends." "Some of them were jumping rope."
 "They asked Tony to jump in." "Tony tried and fell down."
 "All his friends made fun of him.")
(EPI-SCHEMA ((TONY.NAME
              (DOWN.ADV
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.1128.V)))
              ?L2)
             ** E1434.SK)
	(:ROLES
		(!R1 (TONY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (E1434.SK (AT-OR-BEFORE NOW402)))
	)
	(:GOALS
		(?G1 (TONY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TONY.NAME (AT.P ?L1)))
		(?I2 (NOT (TONY.NAME (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (TONY.NAME (AT.P ?L1))))
		(?P2 (TONY.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1434.SK))
		(!W2 (?I2 BEFORE E1434.SK))
		(!W3 (?P1 AFTER E1434.SK))
		(!W4 (?P2 AFTER E1434.SK))
		(!W5 (?G1 CAUSE-OF E1434.SK))
		(!W6 (E1433.SK (BEFORE NOW402)))
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
; RECEIVING_VERB.?
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; EAT.V

; story 82:
	; "The man had a craving."
	; "He ignored it."
	; "The craving grew."
	; "He gave into the craving."
	; "The man felt guilty."
; best schemas are:
; GIVE.V
; FEED.V
; RECEIVING_VERB.?
; EAT.V
; PLAY.V

; story 83:
	; "Little Alice had a doll."
	; "It was her favorite."
	; "Once Mark came to visit."
	; "He broke the doll."
	; "Alice cried."
; best schemas are:
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V

; story 84:
	; "Tom wanted to start a farm."
	; "Tom saved up money to buy a farm."
	; "He went to the auction."
	; "He bought some goats."
	; "He started the farm with his new goats."
; best schemas are:
; TRAVEL.V
; PLAY.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
(setf matches (append matches '(( (5.1953125 4)
("Tom wanted to start a farm." "Tom saved up money to buy a farm."
 "He went to the auction." "He bought some goats."
 "He started the farm with his new goats.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (FROM.P FARM1484.SK))
               ((ADV-A (TO.P AUCTION1487.SK)) GO.1152.V))
              AUCTION1487.SK)
             ** E1488.SK)
	(:ROLES
		(!R1 (FARM1484.SK LOCATION.N))
		(!R2 (AUCTION1487.SK LOCATION.N))
		(!R3 (NOT (FARM1484.SK = AUCTION1487.SK)))
		(!R4 (AUCTION1487.SK AUCTION.N))
		(!R5 (HE.PRO MALE.A))
		(!R6 (HE.PRO AGENT.N))
		(!R7 (OBJECT1496.SK (PERTAIN-TO HE.PRO)))
		(!R8 (FARM1484.SK FARM.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P AUCTION1487.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P FARM1484.SK)))
		(?I2 (NOT (HE.PRO (AT.P AUCTION1487.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (AT.P FARM1484.SK))))
		(?P2 (HE.PRO (AT.P AUCTION1487.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1488.SK))
		(!W2 (?I2 BEFORE E1488.SK))
		(!W3 (?P1 AFTER E1488.SK))
		(!W4 (?P2 AFTER E1488.SK))
		(!W5 (?G1 CAUSE-OF E1488.SK))
		(!W6 (E1488.SK (BEFORE NOW421)))
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
; RECEIVING_VERB.?
; PLAY.V
; TRAVEL.V
; SIT.V
; SEARCH.V

; story 86:
	; "Larry found a hurt bird."
	; "He put it in a shoe box."
	; "He fed the bird."
	; "The bird survived."
	; "Larry kept it in a cage in his room."
; best schemas are:
; SEARCH.V
; FIND.V
; PUT_IN_CONTAINER.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (2.5 0)
("Larry found a hurt bird." "He put it in a shoe box." "He fed the bird."
 "The bird survived." "Larry kept it in a cage in his room.")
(EPI-SCHEMA ((LARRY.NAME FIND.1167.V BIRD1514.SK) ** E1515.SK)
	(:ROLES
		(!R1 (LARRY.NAME AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (BIRD1514.SK HURT.A))
		(!R4 (BIRD1514.SK BIRD.N))
		(!R5 (ROOM1530.SK (PERTAIN-TO LARRY.NAME)))
		(!R6 (ROOM1530.SK ROOM.N))
	)
	(:PRECONDS
		(?I1 (LARRY.NAME (AT.P ?L)))
		(?I2 (BIRD1514.SK (AT.P ?L)))
		(?I3 (LARRY.NAME ((ADV-A (FOR.P BIRD1514.SK)) SEARCH.V)))
		(?I4 (NOT (LARRY.NAME (KNOW.V (THAT (BIRD1514.SK (AT.P ?L)))))))
		(?I5 (NOT (LARRY.NAME (HAVE.V BIRD1514.SK))))
	)
	(:POSTCONDS
		(?P1 (LARRY.NAME (KNOW.V (THAT (BIRD1514.SK (AT.P ?L))))))
		(?P2 (LARRY.NAME (HAVE.V BIRD1514.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1515.SK (BEFORE NOW429)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 87:
	; "Lucy had a lot of split ends."
	; "She had to do something about it."
	; "She got some scissors."
	; "She then cut them off."
	; "She then looked great."
; best schemas are:
; RECEIVING_VERB.?
; SEARCH.V
; FIND.V
; GIVE.V
; EAT.V
(setf matches (append matches '(( (5.0 3)
("Lucy had a lot of split ends." "She had to do something about it."
 "She got some scissors." "She then cut them off." "She then looked great.")
(EPI-SCHEMA ((LUCY.NAME GET.1182.V LOT1535.SK (AT.P-ARG ?L)) ** E1542.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (LOT1535.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (LUCY.NAME = LOT1535.SK)))
		(!R5
   (LOT1535.SK
    (OF.P
     (K (L #:G1700102 (AND (#:G1700102 SPLIT.A) (#:G1700102 (PLUR END.N))))))))
		(!R6 (LOT1535.SK LOT.N))
		(!R7 (SCISSOR1541.SK (PLUR SCISSOR.N)))
	)
	(:GOALS
		(?G1 (LUCY.NAME (WANT.V (THAT (LUCY.NAME (HAVE.V LOT1535.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (LUCY.NAME HAVE.V LOT1535.SK)))
		(?I2 (LUCY.NAME (AT.P ?L)))
		(?I3 (LOT1535.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(E1536.SK (LUCY.NAME HAVE.V LOT1535.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1542.SK))
		(!W2 (?I1 PRECOND-OF E1542.SK))
		(!W3 (?I2 PRECOND-OF E1542.SK))
		(!W4 (?I3 PRECOND-OF E1542.SK))
		(!W5 (E1536.SK POSTCOND-OF E1542.SK))
		(!W6 (E1536.SK (BEFORE NOW434)))
		(!W7 (E1542.SK (BEFORE NOW436)))
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
; PLAY.V
; MAKE.V

; story 89:
	; "Aaron had a slight cold."
	; "His mother told him not to swim."
	; "Aaron's mother went to the store."
	; "He went and swam anyway."
	; "Aaron got sick."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 90:
	; "Sue had a puppy she loved."
	; "One day it ran away."
	; "Sue was so sad."
	; "One day her dad said Sue I have something for you."
	; "It was a new puppy."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 91:
	; "Tom liked Tina."
	; "He wanted to ask her to court her."
	; "She said yes."
	; "He was so excited."
	; "They made it official."
; best schemas are:

; story 92:
	; "The boy found glue."
	; "He poured it out."
	; "It covered the carpet."
	; "It dried in one hour."
	; "His mom was very upset."
; best schemas are:
; SEARCH.V
; FIND.V

; story 93:
	; "The man dug a grave."
	; "He put his dead dog in it."
	; "He filled it in with dirt."
	; "He planted a tree on top of it."
	; "He thought of the dog when he saw the tree."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 94:
	; "Bob wanted to buy a new book."
	; "He didn't have the money."
	; "Bob found a ten dollar bill on the ground."
	; "He picked it up."
	; "He used the money to buy the book."
; best schemas are:
; SEARCH.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 95:
	; "The man looked into the window of the house."
	; "He saw a woman inside."
	; "He watched the woman."
	; "The woman noticed him watching."
	; "She called the police."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; TRAVEL.V
; GIVE.V
; RECEIVING_VERB.?

; story 96:
	; "I had a pony."
	; "I took it for a ride one day."
	; "I rode over the hills near my house."
	; "My pony stumbled on a large rock."
	; "My pony hurt its leg."
; best schemas are:
; RECEIVING_VERB.?
; GIVE.V
; EAT.V
; FEED.V
; PLAY.V
(setf matches (append matches '(( (5.0 3)
("I had a pony." "I took it for a ride one day."
 "I rode over the hills near my house." "My pony stumbled on a large rock."
 "My pony hurt its leg.")
(EPI-SCHEMA ((ME1701.SK ((ADV-A (FOR.P RIDE1677.SK)) TAKE.1270.V) PONY1672.SK
              (AT.P-ARG ?L))
             ** E1679.SK)
	(:ROLES
		(!R1 (PONY1672.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1701.SK = PONY1672.SK)))
		(!R4 (PONY1672.SK PONY.N))
		(!R5 (PONY1672.SK (PERTAIN-TO ME1701.SK)))
		(!R6 (ME1701.SK AGENT.N))
		(!R7 (RIDE1677.SK RIDE.N))
		(!R8 (DAY1678.SK DAY.N))
		(!R9 (RIDE1677.SK (= DAY1678.SK)))
		(!R10 (HOUSE1685.SK (PERTAIN-TO ME1701.SK)))
		(!R11 (HOUSE1685.SK HOUSE.N))
		(!R12 (LEG1699.SK (PERTAIN-TO PONY1672.SK)))
		(!R13 (LEG1699.SK LEG.N))
	)
	(:GOALS
		(?G1 (ME1701.SK (WANT.V (THAT (ME1701.SK (HAVE.V PONY1672.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1701.SK HAVE.V PONY1672.SK)))
		(?I2 (ME1701.SK (AT.P ?L)))
		(?I3 (PONY1672.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(E1673.SK (ME1701.SK HAVE.V PONY1672.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1679.SK))
		(!W2 (?I1 PRECOND-OF E1679.SK))
		(!W3 (?I2 PRECOND-OF E1679.SK))
		(!W4 (?I3 PRECOND-OF E1679.SK))
		(!W5 (E1673.SK POSTCOND-OF E1679.SK))
		(!W6 (E1673.SK (BEFORE NOW479)))
		(!W7 (E1679.SK (BEFORE NOW480)))
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
; best schemas are:
; RECEIVING_VERB.?
; PUT_IN_CONTAINER.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
(setf matches (append matches '(( (4.0 3)
("I took my dog to get a bath." "My dog loves to take a bath."
 "I got the bath water ready for him." "My dog jumped into the bath."
 "He splashed me with water.")
(EPI-SCHEMA ((ME1723.SK TAKE.1290.V OBJECT1703.SK (AT.P-ARG ?L)) ** E1708.SK)
	(:ROLES
		(!R1 (OBJECT1703.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1723.SK = OBJECT1703.SK)))
		(!R4 (ME1723.SK AGENT.N))
		(!R5 (OBJECT1703.SK (= DOG1707.SK)))
		(!R6 (DOG1707.SK DOG.N))
		(!R7 (DOG1707.SK (PERTAIN-TO ME1723.SK)))
	)
	(:GOALS
		(?G1 (ME1723.SK (WANT.V (THAT (ME1723.SK (HAVE.V OBJECT1703.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME1723.SK HAVE.V OBJECT1703.SK)))
		(?I2 (ME1723.SK (AT.P ?L)))
		(?I3 (OBJECT1703.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (ME1723.SK HAVE.V OBJECT1703.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1708.SK))
		(!W2 (?I1 PRECOND-OF E1708.SK))
		(!W3 (?I2 PRECOND-OF E1708.SK))
		(!W4 (?I3 PRECOND-OF E1708.SK))
		(!W5 (?P1 POSTCOND-OF E1708.SK))
		(!W6 (E1708.SK (BEFORE NOW484)))
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
; best schemas are:
; RECEIVING_VERB.?
; PLAY.V
; TRAVEL.V
; SIT.V
; SEARCH.V
(setf matches (append matches '(( (4.425542 4)
("We just got a new rug." "It was very plush."
 "Our cat started playing with the edge." "My wife yelled at the cat."
 "She ran away.")
(EPI-SCHEMA ((WE1743.SK GET.1322.V RUG1729.SK (AT.P-ARG EDGE1735.SK)) **
             E1730.SK)
	(:ROLES
		(!R1 (RUG1729.SK INANIMATE_OBJECT.N))
		(!R2 (EDGE1735.SK LOCATION.N))
		(!R3 (NOT (WE1743.SK = RUG1729.SK)))
		(!R4 (RUG1729.SK RUG.N))
		(!R5 (RUG1729.SK NEW.A))
		(!R6 (WE1743.SK AGENT.N))
		(!R7 (CAT1733.SK (PERTAIN-TO WE1743.SK)))
		(!R8 (CAT1733.SK CAT.N))
		(!R9 (EDGE1735.SK EDGE.N))
	)
	(:GOALS
		(?G1 (WE1743.SK (WANT.V (THAT (WE1743.SK (HAVE.V RUG1729.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (WE1743.SK HAVE.V RUG1729.SK)))
		(?I2 (WE1743.SK (AT.P EDGE1735.SK)))
		(?I3 (RUG1729.SK (AT.P EDGE1735.SK)))
	)
	(:POSTCONDS
		(?P1 (WE1743.SK HAVE.V RUG1729.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1730.SK))
		(!W2 (?I1 PRECOND-OF E1730.SK))
		(!W3 (?I2 PRECOND-OF E1730.SK))
		(!W4 (?I3 PRECOND-OF E1730.SK))
		(!W5 (?P1 POSTCOND-OF E1730.SK))
		(!W6 (E1730.SK (BEFORE NOW489)))
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
; best schemas are:
; SEARCH.V
; FIND.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (2.405 0)
("The man went to prison." "He was innocent." "He asked for another trial."
 "It took five years to get one." "He was found to be innocent.")
(EPI-SCHEMA ((MAN1746.SK ((ADV-A (FOR.P (KA INNOCENT.A))) FIND.1366.V) ?O) **
             E1752.SK)
	(:ROLES
		(!R1 (MAN1746.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (MAN1746.SK MAN.N))
	)
	(:PRECONDS
		(?I1 (MAN1746.SK (AT.P ?L)))
		(?I2 (?O (AT.P ?L)))
		(?I3 (MAN1746.SK ((ADV-A (FOR.P ?O)) SEARCH.V)))
		(?I4 (NOT (MAN1746.SK (KNOW.V (THAT (?O (AT.P ?L)))))))
		(?I5 (NOT (MAN1746.SK (HAVE.V ?O))))
	)
	(:POSTCONDS
		(?P1 (MAN1746.SK (KNOW.V (THAT (?O (AT.P ?L))))))
		(?P2 (MAN1746.SK (HAVE.V ?O)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1752.SK (BEFORE NOW498)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.405 3)
("The man went to prison." "He was innocent." "He asked for another trial."
 "It took five years to get one." "He was found to be innocent.")
(EPI-SCHEMA ((MAN1746.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K PRISON.N))) GO.1367.V))
              (K PRISON.N))
             ** E1745.SK)
	(:ROLES
		(!R1 (MAN1746.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K PRISON.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K PRISON.N))))
		(!R5 (MAN1746.SK MAN.N))
		(!R6 (E1745.SK (RIGHT-AFTER U493)))
	)
	(:GOALS
		(?G1 (MAN1746.SK (WANT.V (KA ((ADV-A (AT.P (K PRISON.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1746.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1746.SK (AT.P (K PRISON.N)))))
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1746.SK (AT.P ?L1))))
		(?P2 (MAN1746.SK (AT.P (K PRISON.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1745.SK))
		(!W2 (?I2 BEFORE E1745.SK))
		(!W3 (?P1 AFTER E1745.SK))
		(!W4 (?P2 AFTER E1745.SK))
		(!W5 (?G1 CAUSE-OF E1745.SK))
		(!W6 (E1745.SK (SAME-TIME NOW494)))
		(!W7 (E1748.SK (BEFORE NOW494)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 0:
	; "Frank wanted to get buff."
	; "So he got some weights."
	; "He started to work out."
	; "He worked out for months ."
	; "Frank got buff."
; best schemas are:
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (5.0 2)
("Frank wanted to get buff." "So he got some weights."
 "He started to work out." "He worked out for months ." "Frank got buff.")
(EPI-SCHEMA ((FRANK.NAME GET.1.V WEIGHT14.SK (AT.P-ARG ?L)) ** E15.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (WEIGHT14.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (FRANK.NAME = WEIGHT14.SK)))
		(!R5 (WEIGHT14.SK (PLUR WEIGHT.N)))
	)
	(:GOALS
		(E10.SK (FRANK.NAME (WANT.V (THAT (FRANK.NAME (HAVE.V WEIGHT14.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (FRANK.NAME HAVE.V WEIGHT14.SK)))
		(?I2 (FRANK.NAME (AT.P ?L)))
		(?I3 (WEIGHT14.SK (AT.P ?L)))
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
		(!W6 (E10.SK (BEFORE NOW0)))
		(!W7 (E15.SK (BEFORE NOW1)))
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
; best schemas are:
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
; FIND.V
; GIVE.V
(setf matches (append matches '(( (4.1953125 2)
("We had a read in one day at school." "All we did the whole day was read."
 "I took some books from home." "I sat in a bean bag."
 "It was the most relaxing day ever.")
(EPI-SCHEMA ((ME48.SK ((ADV-A (FROM.P (K HOME.N))) TAKE.8.V) BOOK35.SK
              (AT.P-ARG ?L))
             ** E38.SK)
	(:ROLES
		(!R1 (BOOK35.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME48.SK = BOOK35.SK)))
		(!R4 (ME48.SK AGENT.N))
		(!R5 (BOOK35.SK (PLUR BOOK.N)))
	)
	(:GOALS
		(?G1 (ME48.SK (WANT.V (THAT (ME48.SK (HAVE.V BOOK35.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME48.SK HAVE.V BOOK35.SK)))
		(?I2 (ME48.SK (AT.P ?L)))
		(?I3 (BOOK35.SK (AT.P ?L)))
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
		(!W6 (E38.SK (BEFORE NOW7)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.6632652 2)
("We had a read in one day at school." "All we did the whole day was read."
 "I took some books from home." "I sat in a bean bag."
 "It was the most relaxing day ever.")
(EPI-SCHEMA ((ME48.SK
              ((ADV-A (ON.P BAG42.SK)) ((ADV-A (IN.P BAG42.SK)) SIT.9.V)))
             ** E43.SK)
	(:ROLES
		(!R1 (BAG42.SK INANIMATE_OBJECT.N))
		(!R2 (BAG42.SK FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (ME48.SK AGENT.N))
		(!R5 (BAG42.SK ((NN BEAN.N) BAG.N)))
	)
	(:GOALS
		(?G1 (ME48.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (ME48.SK (AT.P ?L)))
		(?I2 (BAG42.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E43.SK (BEFORE NOW8)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 3:
	; "Shannon saw a bird in the tree in her backyard."
	; "It was making a nest!"
	; "It took the bird hours."
	; "Finally, she was done."
	; "She sat down in the nest to rest."
; best schemas are:
; SIT.V
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; TRAVEL.V
(setf matches (append matches '(( (2.7450001 2)
("Shannon saw a bird in the tree in her backyard." "It was making a nest!"
 "It took the bird hours." "Finally, she was done."
 "She sat down in the nest to rest.")
(EPI-SCHEMA ((SHANNON.NAME
              (DOWN.ADV
               ((ADV-A (IN.P NEST89.SK)) ((ADV-A (ON.P NEST89.SK)) SIT.41.V))))
             ** E106.SK)
	(:ROLES
		(!R1 (SHANNON.NAME AGENT.N))
		(!R2 (NEST89.SK INANIMATE_OBJECT.N))
		(!R3 (NEST89.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (NEST89.SK NEST.N))
		(!R6 (BACKYARD86.SK BACKYARD.N))
		(!R7 (BACKYARD86.SK (PERTAIN-TO SHANNON.NAME)))
	)
	(:GOALS
		(?G1 (SHANNON.NAME (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (SHANNON.NAME (AT.P ?L)))
		(?I2 (NEST89.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E106.SK (BEFORE NOW19)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; TRAVEL.V
; PUT_IN_CONTAINER.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (3.7302296 1)
("I went on a run at the park one day." "It was early morning."
 "I saw my friend's car." "She was running with my other friend."
 "They were shirtless.")
(EPI-SCHEMA ((SHE.PRO
              ((ADV-A (WITH.P OBJECT117.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P PARK109.SK)) RUN.60.V)))
              ?L2)
             ** E116.SK)
	(:ROLES
		(!R1 (PARK109.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (PARK109.SK = ?L2)))
		(!R4 (SHE.PRO FEMALE.A))
		(!R5 (SHE.PRO AGENT.N))
		(!R6 (OBJECT117.SK (PERTAIN-TO ME.PRO)))
		(!R7 (PARK109.SK PARK.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SHE.PRO (AT.P PARK109.SK)))
		(?I2 (NOT (SHE.PRO (AT.P ?L2))))
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
		(!W6 (E116.SK (BEFORE NOW23)))
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

; story 6:
	; "The man put on a hat."
	; "It made his head itch."
	; "He looked at the label."
	; "The label said it was wool."
	; "The man decided he didn't like wool."
; best schemas are:
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
; PLAY.V
; GIVE.V

; story 7:
	; "Maeva got money for her birthday."
	; "She had a list of things to buy."
	; "She went out with her friends."
	; "They bought clothes."
	; "She went home."
; best schemas are:
; RECEIVING_VERB.?
; SEARCH.V
; FIND.V
; TRAVEL.V
; GIVE.V
(setf matches (append matches '(( (5.0 3)
("Maeva got money for her birthday." "She had a list of things to buy."
 "She went out with her friends." "They bought clothes." "She went home.")
(EPI-SCHEMA ((MAEVA.NAME GET.73.V OBJECT162.SK (AT.P-ARG ?L)) ** E166.SK)
	(:ROLES
		(!R1 (MAEVA.NAME AGENT.N))
		(!R2 (OBJECT162.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAEVA.NAME = OBJECT162.SK)))
		(!R5 (LIST171.SK LIST.N))
		(!R6 (BIRTHDAY165.SK (PERTAIN-TO MAEVA.NAME)))
		(!R7 (BIRTHDAY165.SK BIRTHDAY.N))
		(!R8 (OBJECT172.SK (= (K (PLUR THING.N)))))
		(!R9 (LIST171.SK (OF.P OBJECT172.SK)))
		(!R10 (FRIEND185.SK (PERTAIN-TO MAEVA.NAME)))
		(!R11 (FRIEND185.SK (PLUR FRIEND.N)))
		(!R12 (OBJECT162.SK (= (K MONEY.N))))
		(!R13 (OBJECT162.SK (FOR.P BIRTHDAY165.SK)))
	)
	(:GOALS
		(?G1 (MAEVA.NAME (WANT.V (THAT (MAEVA.NAME (HAVE.V OBJECT162.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (MAEVA.NAME HAVE.V OBJECT162.SK)))
		(?I2 (MAEVA.NAME (AT.P ?L)))
		(?I3 (OBJECT162.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(E181.SK (MAEVA.NAME HAVE.V OBJECT162.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E166.SK))
		(!W2 (?I1 PRECOND-OF E166.SK))
		(!W3 (?I2 PRECOND-OF E166.SK))
		(!W4 (?I3 PRECOND-OF E166.SK))
		(!W5 (E181.SK POSTCOND-OF E166.SK))
		(!W6 (E166.SK (BEFORE NOW35)))
		(!W7 (E181.SK (BEFORE NOW36)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.5 0)
("Maeva got money for her birthday." "She had a list of things to buy."
 "She went out with her friends." "They bought clothes." "She went home.")
(EPI-SCHEMA ((MAEVA.NAME
              ((ADV-A (WITH.P FRIEND185.SK))
               (OUT.ADV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.105.V))))
              ?L2)
             ** E186.SK)
	(:ROLES
		(!R1 (MAEVA.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND185.SK (PERTAIN-TO MAEVA.NAME)))
		(!R6 (FRIEND185.SK (PLUR FRIEND.N)))
		(!R7 (BIRTHDAY165.SK (PERTAIN-TO MAEVA.NAME)))
		(!R8 (BIRTHDAY165.SK BIRTHDAY.N))
		(!R9 (OBJECT162.SK (= (K MONEY.N))))
		(!R10 (OBJECT162.SK (FOR.P BIRTHDAY165.SK)))
	)
	(:GOALS
		(?G1 (MAEVA.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAEVA.NAME (AT.P ?L1)))
		(?I2 (NOT (MAEVA.NAME (AT.P ?L2))))
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
		(!W6 (E186.SK (BEFORE NOW37)))
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
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (3.5 3)
("I went to this new pizza place yesterday." "It was absolutely amazing."
 "I could not stop eating." "I wanted more." "I knew I had to go back.")
(EPI-SCHEMA ((ME197.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P OBJECT191.SK)) ((ADV-A (FROM.P ?L1)) GO.107.V)))
              OBJECT191.SK)
             ** E192.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (OBJECT191.SK LOCATION.N))
		(!R3 (NOT (?L1 = OBJECT191.SK)))
		(!R4 (ME197.SK AGENT.N))
		(!R5 (OBJECT191.SK (ATTENDED-TO-BY*.A SPEAKER)))
	)
	(:GOALS
		(?G1 (ME197.SK (WANT.V (KA ((ADV-A (AT.P OBJECT191.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME197.SK (AT.P ?L1)))
		(?I2 (NOT (ME197.SK (AT.P OBJECT191.SK))))
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
		(!W6 (E192.SK (BEFORE NOW40)))
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
; best schemas are:
; TRAVEL.V
; RECEIVING_VERB.?
; SIT.V
; SEARCH.V
; FIND.V
(setf matches (append matches '(( (3.6953125 2)
("Ellen moved to a new city." "She didn't know where anything was."
 "It was hard." "Living in her hometown was easier." "Ellen moved back home.")
(EPI-SCHEMA ((ELLEN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P CITY203.SK)) MOVE.109.V))
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
		(!W6 (E204.SK (BEFORE NOW45)))
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
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (4.5 3)
("Allie wanted an iPad." "She really liked it." "But she wanted a new one."
 "So she went to the store." "When she got back she had a newer one.")
(EPI-SCHEMA ((ALLIE.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE231.SK)) GO.123.V))
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
		(!W6 (E219.SK (BEFORE NOW50)))
		(!W7 (E232.SK (BEFORE NOW53)))
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
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; EAT.V
; FEED.V
; PLAY.V

; story 12:
	; "Dad let me plant a flower."
	; "It grew very quickly."
	; "I made sure to water it every day."
	; "Now there is a bunch of them."
	; "He says I have a green thumb."
; best schemas are:
; TRAVEL.V
; MAKE.V
; SIT.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V

; story 13:
	; "It was a very long day."
	; "It was also very hot outside."
	; "Fred was about to walk out the door."
	; "Then he remembered the sunscreen."
	; "He had to go back outside."
; best schemas are:

; story 14:
	; "A little baby was sleeping."
	; "Her siblings tried to wake her up."
	; "She didn't wake up."
	; "She slept all day."
	; "She stayed up all night."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 15:
	; "A New Mexican restaurant opened up."
	; "It looked good."
	; "Nance wanted to go."
	; "When she went she loved it."
	; "She was happy it was good."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 16:
	; "The cat meowed at the door."
	; "The owner let the cat out."
	; "The cat played in a field."
	; "He came back with a mouse."
	; "The cat gave the mouse to the owner."
; best schemas are:
; GIVE.V
; PLAY.V
; TRAVEL.V
; RECEIVING_VERB.?
; SIT.V
(setf matches (append matches '(( (2.81 0)
("The cat meowed at the door." "The owner let the cat out."
 "The cat played in a field." "He came back with a mouse."
 "The cat gave the mouse to the owner.")
(EPI-SCHEMA ((CAT313.SK ((ADV-A (TO.P MOUSE329.SK)) GIVE.194.V) MOUSE329.SK ?O)
             ** E331.SK)
	(:ROLES
		(!R1 (CAT313.SK AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (MOUSE329.SK AGENT.N))
		(!R4 (CAT313.SK CAT.N))
		(!R5 (OWNER320.SK OWNER.N))
		(!R6 (MOUSE329.SK MOUSE.N))
		(!R7 (E331.SK (RIGHT-AFTER U83)))
	)
	(:GOALS
		(?G1 (CAT313.SK (WANT.V (THAT (MOUSE329.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (CAT313.SK HAVE.V ?O))
		(?I2 (NOT (MOUSE329.SK HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (CAT313.SK HAVE.V ?O)))
		(?P2 (MOUSE329.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E331.SK (SAME-TIME NOW84)))
		(!W2 (E336.SK (BEFORE NOW84)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 2)
("The cat meowed at the door." "The owner let the cat out."
 "The cat played in a field." "He came back with a mouse."
 "The cat gave the mouse to the owner.")
(EPI-SCHEMA ((CAT313.SK
              ((ADV-A (IN.P FIELD326.SK)) ((ADV-A (WITH.P ?T)) PLAY.195.V)) ?G)
             ** E323.SK)
	(:ROLES
		(!R1 (CAT313.SK AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (?G GAME.N))
		(!R5 (CAT313.SK CAT.N))
		(!R6 (FIELD326.SK FIELD.N))
		(!R7 (E323.SK (RIGHT-AFTER U81)))
	)
	(:GOALS
		(?G1 (CAT313.SK (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (CAT313.SK HAVE.V ?T))
	)
	(:POSTCONDS
		(?P1 (CAT313.SK EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E323.SK (SAME-TIME NOW82)))
		(!W3 (E327.SK (BEFORE NOW82)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.7302296 1)
("The cat meowed at the door." "The owner let the cat out."
 "The cat played in a field." "He came back with a mouse."
 "The cat gave the mouse to the owner.")
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (WITH.P MOUSE329.SK))
               (BACK.ADV
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FROM.P FIELD326.SK)) COME.196.V))))
              ?L2)
             ** E330.SK)
	(:ROLES
		(!R1 (FIELD326.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (FIELD326.SK = ?L2)))
		(!R4 (HE.PRO MALE.A))
		(!R5 (HE.PRO AGENT.N))
		(!R6 (MOUSE329.SK MOUSE.N))
		(!R7 (FIELD326.SK FIELD.N))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P FIELD326.SK)))
		(?I2 (NOT (HE.PRO (AT.P ?L2))))
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
		(!W6 (E330.SK (BEFORE NOW83)))
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
; best schemas are:
; TRAVEL.V
; GIVE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (3.5 3)
("I was having a bad day." "My hair was a mess." "Then I went to cvs."
 "When I was there I got hair stuff." "Then I used it and it was great.")
(EPI-SCHEMA ((ME350.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K (PLUR CV.N)))) GO.212.V))
              (K (PLUR CV.N)))
             ** E344.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K (PLUR CV.N)) LOCATION.N))
		(!R3 (NOT (?L1 = (K (PLUR CV.N)))))
		(!R4 (ME350.SK AGENT.N))
		(!R5 (HAIR340.SK HAIR.N))
		(!R6 (HAIR340.SK (PERTAIN-TO ME350.SK)))
	)
	(:GOALS
		(?G1 (ME350.SK (WANT.V (KA ((ADV-A (AT.P (K (PLUR CV.N)))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME350.SK (AT.P ?L1)))
		(?I2 (NOT (ME350.SK (AT.P (K (PLUR CV.N))))))
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
		(!W6 (E344.SK (BEFORE NOW87)))
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
; best schemas are:
; TRAVEL.V
(setf matches (append matches '(( (2.5 0)
("Jay went into the woods by himself." "He suddenly got lost."
 "He did not know where to go." "He was wandering for an hour."
 "He finally went out.")
(EPI-SCHEMA ((JAY.NAME
              ((ADV-A (INTO.P WOOD367.SK))
               ((ADV-A (BY.P JAY.NAME))
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.220.V))))
              ?L2)
             ** E368.SK)
	(:ROLES
		(!R1 (JAY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (WOOD367.SK (PLUR WOOD.N)))
	)
	(:GOALS
		(?G1 (JAY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JAY.NAME (AT.P ?L1)))
		(?I2 (NOT (JAY.NAME (AT.P ?L2))))
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
		(!W6 (E368.SK (BEFORE NOW90)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 20:
	; "Fred always wanted to know how he would look like in a cap."
	; "He decides to buy one."
	; "Fred loves how he looks in a cap."
	; "His friends love it too."
	; "He is glad he bought a cap."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 21:
	; "The boy went off a jump."
	; "He came down hard."
	; "His wheel got bent."
	; "He took it to a shop."
	; "They said the wheel was ruined."
; best schemas are:
; RECEIVING_VERB.?
; TRAVEL.V

; story 22:
	; "Bill was at a stop light."
	; "The light was on red."
	; "Billy began to look around while waiting."
	; "He suddenly heard a horn behind him."
	; "The light had turned green."
; best schemas are:

; story 23:
	; "I was coming through a door at work."
	; "I saw my friend Amy."
	; "I almost ran into her."
	; "She was wearing a purple two piece."
	; "We did not say anything."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; TRAVEL.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (2.5 0)
("I was coming through a door at work." "I saw my friend Amy."
 "I almost ran into her." "She was wearing a purple two piece."
 "We did not say anything.")
(EPI-SCHEMA ((ME450.SK
              ((ADV-A (THROUGH.P DOOR437.SK))
               ((ADV-A (AT.P (K WORK.N)))
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.239.V))))
              ?L2)
             ** E436.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (DOOR437.SK DOOR.N))
		(!R5 (ME450.SK AGENT.N))
		(!R6 (FRIEND441.SK (PERTAIN-TO ME450.SK)))
		(!R7 (FRIEND441.SK FRIEND.N))
	)
	(:GOALS
		(?G1 (ME450.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME450.SK (AT.P ?L1)))
		(?I2 (NOT (ME450.SK (AT.P ?L2))))
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
		(!W6 (E436.SK (BEFORE NOW115)))
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
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.5 0)
("Ben came home late at night." "He did not want to wake up his wife."
 "He did not turn on the light." "He slipped and fell down."
 "His leg was broken.")
(EPI-SCHEMA ((HE.PRO
              (DOWN.ADV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.250.V)))
              ?L2)
             ** E459.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (HE.PRO MALE.A))
		(!R5 (HE.PRO AGENT.N))
		(!R6 (BEN.NAME LEG.N))
		(!R7 (BEN.NAME (PERTAIN-TO HE.PRO)))
		(!R8 (E459.SK (AT-OR-BEFORE NOW123)))
		(!R9 (WIFE454.SK WIFE.N))
		(!R10 (WIFE454.SK (PERTAIN-TO BEN.NAME)))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO (AT.P ?L1)))
		(?I2 (NOT (HE.PRO (AT.P ?L2))))
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
		(!W6 (E458.SK (BEFORE NOW123)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (1.53125 1)
("Ben came home late at night." "He did not want to wake up his wife."
 "He did not turn on the light." "He slipped and fell down."
 "His leg was broken.")
(EPI-SCHEMA ((BEN.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.251.V
              (KA (TURN_ON.V LIGHT456.SK)))
             ** ?E)
	(:ROLES
		(!R1 (BEN.NAME AGENT.N))
		(!R2 ((KA (TURN_ON.V LIGHT456.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (BEN.NAME LEG.N))
		(!R5 (LIGHT456.SK LIGHT.N))
		(!R6 (WIFE454.SK WIFE.N))
		(!R7 (WIFE454.SK (PERTAIN-TO BEN.NAME)))
		(!R8 (BEN.NAME (PERTAIN-TO HE.PRO)))
		(!R9 (HE.PRO MALE.A))
		(!R10 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (BEN.NAME (WANT.V (THAT (NOT (BEN.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (BEN.NAME (DO.V (KA (TURN_ON.V LIGHT456.SK))))) CAUSE-OF
    (KE (BEN.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E457.SK (NOT (BEN.NAME (DO.V (KA (TURN_ON.V LIGHT456.SK))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E457.SK))
		(!W2 (E457.SK (BEFORE NOW122)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
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
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; TRAVEL.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.5 0)
("Sandy loved to hike." "On her hike she ran into a bear."
 "She wasn't sure what to do." "She stayed still and quiet."
 "The bear finally ran away.")
(EPI-SCHEMA ((SANDY.NAME
              ((ADV-A (INTO.P BEAR494.SK))
               ((ADV-S (ON.P HIKE492.SK))
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.266.V))))
              ?L2)
             ** E491.SK)
	(:ROLES
		(!R1 (SANDY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (BEAR494.SK BEAR.N))
		(!R6 (HIKE492.SK HIKE.N))
		(!R7 (HIKE492.SK (PERTAIN-TO SANDY.NAME)))
		(!R8 (E491.SK (RIGHT-AFTER U135)))
	)
	(:GOALS
		(?G1 (SANDY.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SANDY.NAME (AT.P ?L1)))
		(?I2 (NOT (SANDY.NAME (AT.P ?L2))))
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
		(!W6 (E491.SK (SAME-TIME NOW136)))
		(!W7 (E495.SK (BEFORE NOW136)))
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
; EAT.V
; FEED.V
; DRINK.V
; GIVE.V
; RECEIVING_VERB.?

; story 29:
	; "Tom wanted a pet."
	; "Tom knew a dog or cat would be too much of a liability."
	; "Tom went to the pet store."
	; "Tom found a lizard he liked."
	; "Tom bought the lizard."
; best schemas are:
; SEARCH.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (4.5 3)
("Tom wanted a pet." "Tom knew a dog or cat would be too much of a liability."
 "Tom went to the pet store." "Tom found a lizard he liked."
 "Tom bought the lizard.")
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE546.SK)) GO.278.V))
              STORE546.SK)
             ** E532.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE546.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE546.SK)))
		(!R5 (PET523.SK PET.N))
		(!R6 (STORE546.SK ((NN PET.N) STORE.N)))
	)
	(:GOALS
		(E524.SK (TOM.NAME (WANT.V (KA ((ADV-A (AT.P STORE546.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (TOM.NAME (AT.P ?L1)))
		(?I2 (NOT (TOM.NAME (AT.P STORE546.SK))))
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
		(!W6 (E524.SK (BEFORE NOW145)))
		(!W7 (E532.SK (BEFORE NOW147)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 31:
	; "Leo is walking home."
	; "He sees a dog stuck in a tree."
	; "He frees the dog from the tree."
	; "The dog runs off."
	; "Leo saved the dog's life."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 32:
	; "I got one of those new drones."
	; "It is a lot of fun."
	; "I have been flying it all over town."
	; "It takes some really cool videos."
	; "You will have to come check them out."
; best schemas are:
; RECEIVING_VERB.?
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
; EAT.V
(setf matches (append matches '(( (4.0 3)
("I got one of those new drones." "It is a lot of fun."
 "I have been flying it all over town." "It takes some really cool videos."
 "You will have to come check them out.")
(EPI-SCHEMA ((ME609.SK GET.324.V PRED?597.SK (AT.P-ARG ?L)) ** E598.SK)
	(:ROLES
		(!R1 (PRED?597.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME609.SK = PRED?597.SK)))
		(!R4 (PRED?597.SK PRED?.N))
		(!R5 (ME609.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME609.SK (WANT.V (THAT (ME609.SK (HAVE.V PRED?597.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME609.SK HAVE.V PRED?597.SK)))
		(?I2 (ME609.SK (AT.P ?L)))
		(?I3 (PRED?597.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (ME609.SK HAVE.V PRED?597.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E598.SK))
		(!W2 (?I1 PRECOND-OF E598.SK))
		(!W3 (?I2 PRECOND-OF E598.SK))
		(!W4 (?I3 PRECOND-OF E598.SK))
		(!W5 (?P1 POSTCOND-OF E598.SK))
		(!W6 (E598.SK (BEFORE NOW160)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 33:
	; "I was invited to see a baseball game."
	; "When I sat down I was so bored."
	; "I just wanted to leave."
	; "I had nothing to do."
	; "So I fell asleep."
; best schemas are:
; PLAY.V
; MAKE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 34:
	; "Tom had a girlfriend he loved very much."
	; "He cut her with his nails one day."
	; "She asked him to cut them."
	; "He cut his nails."
	; "His girlfriend was happy that he cut his nails."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 35:
	; "I was afraid to try a gainer."
	; "I had to do it my own way."
	; "I got to the board."
	; "I made the board go up and down."
	; "Then I finally did a gainer."
; best schemas are:
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; RECEIVING_VERB.?
; MAKE.V
; GIVE.V
; TRAVEL.V
(setf matches (append matches '(( (2.5 0)
("I was afraid to try a gainer." "I had to do it my own way."
 "I got to the board." "I made the board go up and down."
 "Then I finally did a gainer.")
(EPI-SCHEMA ((ME676.SK ((ADV-A (TO.P BOARD664.SK)) GET.395.V) ?O (AT.P-ARG ?L))
             ** E668.SK)
	(:ROLES
		(!R1 (?O INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME676.SK = ?O)))
		(!R4 (ME676.SK AGENT.N))
		(!R5 (BOARD664.SK BOARD.N))
		(!R6 (WAY662.SK (PERTAIN-TO ME676.SK)))
		(!R7 (WAY662.SK OWN.A))
		(!R8 (WAY662.SK WAY.N))
	)
	(:GOALS
		(?G1 (ME676.SK (WANT.V (THAT (ME676.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME676.SK HAVE.V ?O)))
		(?I2 (ME676.SK (AT.P ?L)))
		(?I3 (?O (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (ME676.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E668.SK))
		(!W2 (?I1 PRECOND-OF E668.SK))
		(!W3 (?I2 PRECOND-OF E668.SK))
		(!W4 (?I3 PRECOND-OF E668.SK))
		(!W5 (?P1 POSTCOND-OF E668.SK))
		(!W6 (E668.SK (BEFORE NOW177)))
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
; best schemas are:
; RECEIVING_VERB.?
; PUT_IN_CONTAINER.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; TRAVEL.V
(setf matches (append matches '(( (3.905 3)
("The girls went to the pond." "They caught a giant frog."
 "They took it home and put it in a bucket."
 "They showed it to all their friends." "The frog lived with them for a month.")
(EPI-SCHEMA ((GIRLS678.SK (HOME.ADV TAKE.413.V) FROG684.SK (AT.P-ARG ?L)) **
             E690.SK)
	(:ROLES
		(!R1 (GIRLS678.SK AGENT.N))
		(!R2 (FROG684.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (GIRLS678.SK = FROG684.SK)))
		(!R5 (GIRLS678.SK (PLUR GIRL.N)))
		(!R6 (FROG684.SK GIANT.A))
		(!R7 (FROG684.SK FROG.N))
		(!R8 (FRIEND695.SK (PERTAIN-TO GIRLS678.SK)))
		(!R9 (FRIEND695.SK (PLUR FRIEND.N)))
	)
	(:GOALS
		(?G1 (GIRLS678.SK (WANT.V (THAT (GIRLS678.SK (HAVE.V FROG684.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (GIRLS678.SK HAVE.V FROG684.SK)))
		(?I2 (GIRLS678.SK (AT.P ?L)))
		(?I3 (FROG684.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (GIRLS678.SK HAVE.V FROG684.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E690.SK))
		(!W2 (?I1 PRECOND-OF E690.SK))
		(!W3 (?I2 PRECOND-OF E690.SK))
		(!W4 (?I3 PRECOND-OF E690.SK))
		(!W5 (?P1 POSTCOND-OF E690.SK))
		(!W6 (E690.SK (BEFORE NOW182)))
		(!W7 (E691.SK (BEFORE NOW182)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 37:
	; "Tom had a cat."
	; "He decided to get another one."
	; "The two cats didn't get along."
	; "Tom tried his best to get them to live together."
	; "It never worked and he had to get rid of one."
; best schemas are:
; RECEIVING_VERB.?
; GIVE.V
; EAT.V
; FEED.V
; PLAY.V

; story 38:
	; "The boy shot a basket."
	; "It bounced hard off the rim."
	; "It went into the street."
	; "His brother ran after it."
	; "He caught it in the street."
; best schemas are:
; TRAVEL.V
; PUT_IN_CONTAINER.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?

; story 39:
	; "Jack went to his friend's place."
	; "The house was huge."
	; "It made Jack feel poor."
	; "Jack left early."
	; "Jack stopped talking to that friend."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (3.5 3)
("Jack went to his friend's place." "The house was huge."
 "It made Jack feel poor." "Jack left early."
 "Jack stopped talking to that friend.")
(EPI-SCHEMA ((JACK.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P PLACE745.SK)) GO.480.V))
              PLACE745.SK)
             ** E746.SK)
	(:ROLES
		(!R1 (JACK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (PLACE745.SK LOCATION.N))
		(!R4 (NOT (?L1 = PLACE745.SK)))
		(!R5 (PLACE745.SK PLACE.N))
	)
	(:GOALS
		(?G1 (JACK.NAME (WANT.V (KA ((ADV-A (AT.P PLACE745.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (JACK.NAME (AT.P ?L1)))
		(?I2 (NOT (JACK.NAME (AT.P PLACE745.SK))))
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
		(!W6 (E746.SK (BEFORE NOW195)))
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
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V

; story 41:
	; "Jane had never been in love before."
	; "She got her first boyfriend."
	; "It was in high school."
	; "She thought she loved him but they broke up."
	; "It took her a long time to get over it."
; best schemas are:
; RECEIVING_VERB.?
(setf matches (append matches '(( (4.0 3)
("Jane had never been in love before." "She got her first boyfriend."
 "It was in high school." "She thought she loved him but they broke up."
 "It took her a long time to get over it.")
(EPI-SCHEMA ((SHE.PRO GET.489.V OBJECT784.SK (AT.P-ARG ?L)) ** E785.SK)
	(:ROLES
		(!R1 (OBJECT784.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (SHE.PRO = OBJECT784.SK)))
		(!R4 (OBJECT784.SK (PERTAIN-TO SHE.PRO)))
		(!R5 (SHE.PRO FEMALE.A))
		(!R6 (SHE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (SHE.PRO (HAVE.V OBJECT784.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (SHE.PRO HAVE.V OBJECT784.SK)))
		(?I2 (SHE.PRO (AT.P ?L)))
		(?I3 (OBJECT784.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (SHE.PRO HAVE.V OBJECT784.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E785.SK))
		(!W2 (?I1 PRECOND-OF E785.SK))
		(!W3 (?I2 PRECOND-OF E785.SK))
		(!W4 (?I3 PRECOND-OF E785.SK))
		(!W5 (?P1 POSTCOND-OF E785.SK))
		(!W6 (E785.SK (BEFORE NOW206)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
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
; EAT.V
; FEED.V
; RECEIVING_VERB.?
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V

; story 43:
	; "The man took a shower."
	; "The hot water went cold."
	; "He still had soap in his hair."
	; "He washed his hair quickly."
	; "He was shivering when he got out of the shower."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 44:
	; "Joe needed a new sliding door."
	; "His old was broken."
	; "So Joe went to the store to look for another one."
	; "Joe found a very nice one,
;Joe loved his new door ."
; best schemas are:

; story 45:
	; "Today I went to lunch."
	; "I got the gumbo."
	; "It was good but salty."
	; "I drank a lot of water."
	; "I would still get it again though."
; best schemas are:
; RECEIVING_VERB.?
; TRAVEL.V
; EAT.V
; FEED.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
(setf matches (append matches '(( (4.0 3)
("Today I went to lunch." "I got the gumbo." "It was good but salty."
 "I drank a lot of water." "I would still get it again though.")
(EPI-SCHEMA ((ME860.SK GET.517.V GUMBO852.SK (AT.P-ARG ?L)) ** E853.SK)
	(:ROLES
		(!R1 (GUMBO852.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME860.SK = GUMBO852.SK)))
		(!R4 (ME860.SK AGENT.N))
		(!R5 (GUMBO852.SK GUMBO.N))
	)
	(:GOALS
		(?G1 (ME860.SK (WANT.V (THAT (ME860.SK (HAVE.V GUMBO852.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME860.SK HAVE.V GUMBO852.SK)))
		(?I2 (ME860.SK (AT.P ?L)))
		(?I3 (GUMBO852.SK (AT.P ?L)))
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
		(!W6 (E853.SK (BEFORE NOW225)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.5 3)
("Today I went to lunch." "I got the gumbo." "It was good but salty."
 "I drank a lot of water." "I would still get it again though.")
(EPI-SCHEMA ((ME860.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K LUNCH.N))) GO.518.V))
              (K LUNCH.N))
             ** E850.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K LUNCH.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K LUNCH.N))))
		(!R4 (ME860.SK AGENT.N))
	)
	(:GOALS
		(?G1 (ME860.SK (WANT.V (KA ((ADV-A (AT.P (K LUNCH.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME860.SK (AT.P ?L1)))
		(?I2 (NOT (ME860.SK (AT.P (K LUNCH.N)))))
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
		(!W6 (E850.SK (BEFORE NOW224)))
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
; TRAVEL.V
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; GIVE.V
(setf matches (append matches '(( (2.5 0)
("Fred looked outside." "It looked like he got new neighbors."
 "He was excited." "He went to introduce himself." "He made some friends.")
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (FOR.P (KA (INTRODUCE.V FRED.NAME))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.521.V)))
              ?L2)
             ** E870.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
	)
	(:GOALS
		(?G1 (FRED.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME (AT.P ?L1)))
		(?I2 (NOT (FRED.NAME (AT.P ?L2))))
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
		(!W6 (E870.SK (BEFORE NOW232)))
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
(EPI-SCHEMA ((FRED.NAME ((ADV-A (WITH.P ?T)) PLAY.524.V) FRIEND877.SK) **
             E878.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (FRIEND877.SK GAME.N))
		(!R5 (FRIEND877.SK (PLUR FRIEND.N)))
	)
	(:GOALS
		(?G1 (FRED.NAME (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (FRED.NAME HAVE.V ?T))
	)
	(:POSTCONDS
		(?P1 (FRED.NAME EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E878.SK (BEFORE NOW233)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
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
; RECEIVING_VERB.?
(setf matches (append matches '(( (2.5 0)
("Bryan was back from vacation." "He had work today." "He was not excited."
 "He got into work." "He found he wasn't behind on his work.")
(EPI-SCHEMA ((BRYAN.NAME ((ADV-A (INTO.P (K WORK.N))) GET.526.V) ?O
              (AT.P-ARG ?L))
             ** E884.SK)
	(:ROLES
		(!R1 (BRYAN.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (BRYAN.NAME = ?O)))
		(!R5 (WORK888.SK (PERTAIN-TO BRYAN.NAME)))
		(!R6 (WORK888.SK WORK.N))
	)
	(:GOALS
		(?G1 (BRYAN.NAME (WANT.V (THAT (BRYAN.NAME (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (NOT (BRYAN.NAME HAVE.V ?O)))
		(?I2 (BRYAN.NAME (AT.P ?L)))
		(?I3 (?O (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (BRYAN.NAME HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E884.SK))
		(!W2 (?I1 PRECOND-OF E884.SK))
		(!W3 (?I2 PRECOND-OF E884.SK))
		(!W4 (?I3 PRECOND-OF E884.SK))
		(!W5 (?P1 POSTCOND-OF E884.SK))
		(!W6 (E884.SK (BEFORE NOW237)))
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
; PLAY.V
; MAKE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V

; story 49:
	; "It was the middle of summer."
	; "Kara didn't want to go outside."
	; "It was too hot."
	; "So she just stayed in."
	; "It wasn't worth it being in the heat."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (1.53125 1)
("It was the middle of summer." "Kara didn't want to go outside."
 "It was too hot." "So she just stayed in."
 "It wasn't worth it being in the heat.")
(EPI-SCHEMA ((KARA.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.539.V
              (KA (WANT.V (KA (OUTSIDE.ADV GO.V)))))
             ** ?E)
	(:ROLES
		(!R1 (KARA.NAME AGENT.N))
		(!R2 ((KA (WANT.V (KA (OUTSIDE.ADV GO.V)))) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
	)
	(:GOALS
		(?G1 (KARA.NAME (WANT.V (THAT (NOT (KARA.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (KARA.NAME (DO.V (KA (WANT.V (KA (OUTSIDE.ADV GO.V))))))) CAUSE-OF
    (KE (KARA.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E904.SK (NOT (KARA.NAME (DO.V (KA (WANT.V (KA (OUTSIDE.ADV GO.V))))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE-OF E904.SK))
		(!W2 (E904.SK (BEFORE NOW245)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 50:
	; "My brother had a ball."
	; "He threw it to my son."
	; "My son could not catch it."
	; "It rolled right past my son."
	; "My son picked the ball up."
; best schemas are:
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 51:
	; "Lisa took her family to the farm."
	; "Her kids had a great time."
	; "Her daughter then touched the pig."
	; "She laughed."
	; "She had a fun time."
; best schemas are:
; RECEIVING_VERB.?
; SEARCH.V
; FIND.V
; GIVE.V
; EAT.V
(setf matches (append matches '(( (4.0 3)
("Lisa took her family to the farm." "Her kids had a great time."
 "Her daughter then touched the pig." "She laughed." "She had a fun time.")
(EPI-SCHEMA ((LISA.NAME ((ADV-A (TO.P FARM947.SK)) TAKE.624.V) FAMILY950.SK
              (AT.P-ARG ?L))
             ** E953.SK)
	(:ROLES
		(!R1 (LISA.NAME AGENT.N))
		(!R2 (FAMILY950.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (LISA.NAME = FAMILY950.SK)))
		(!R5 (FAMILY950.SK FAMILY.N))
		(!R6 (FAMILY950.SK (PERTAIN-TO LISA.NAME)))
		(!R7 (FARM947.SK FARM.N))
		(!R8 (KID973.SK (PERTAIN-TO LISA.NAME)))
		(!R9 (KID973.SK (PLUR KID.N)))
		(!R10 (DAUGHTER963.SK DAUGHTER.N))
		(!R11 (DAUGHTER963.SK (PERTAIN-TO LISA.NAME)))
	)
	(:GOALS
		(?G1 (LISA.NAME (WANT.V (THAT (LISA.NAME (HAVE.V FAMILY950.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (LISA.NAME HAVE.V FAMILY950.SK)))
		(?I2 (LISA.NAME (AT.P ?L)))
		(?I3 (FAMILY950.SK (AT.P ?L)))
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
		(!W6 (E953.SK (BEFORE NOW254)))
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
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (4.5 3)
("Ethan went to Haiti." "He wanted to look like the people."
 "He went to a market to get clothes." "He saw some sandals." "He bought them.")
(EPI-SCHEMA ((ETHAN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P HAITI.NAME)) GO.642.V))
              HAITI.NAME)
             ** E975.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (HAITI.NAME LOCATION.N))
		(!R4 (NOT (?L1 = HAITI.NAME)))
		(!R5 (PERSON978.SK (PLUR PERSON.N)))
	)
	(:GOALS
		(E979.SK (ETHAN.NAME (WANT.V (KA ((ADV-A (AT.P HAITI.NAME)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ETHAN.NAME (AT.P ?L1)))
		(?I2 (NOT (ETHAN.NAME (AT.P HAITI.NAME))))
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
		(!W6 (E975.SK (BEFORE NOW259)))
		(!W7 (E979.SK (BEFORE NOW260)))
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
; best schemas are:
; RECEIVING_VERB.?
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; EAT.V
(setf matches (append matches '(( (4.5 3)
("Tomorrow was father's day." "Jack wanted to get his father a new grill."
 "Jack went to the store." "Got a nice new grill."
 "His father loved his new grill.")
(EPI-SCHEMA ((JACK.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE996.SK)) GO.650.V))
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
		(!W6 (E994.SK (BEFORE NOW265)))
		(!W7 (E997.SK (BEFORE NOW266)))
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
; best schemas are:
; RECEIVING_VERB.?
; PUT_IN_CONTAINER.V
; TRAVEL.V
; SIT.V
; SEARCH.V
(setf matches (append matches '(( (4.046113 2)
("The newspaper was outside." "My dad got home from work."
 "He got out of his car." "He picked the newspaper up."
 "He took it inside the house.")
(EPI-SCHEMA ((DAD1009.SK ((ADV-A (FROM.P (K WORK.N))) GET.660.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E1008.SK)
	(:ROLES
		(!R1 (DAD1009.SK AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (DAD1009.SK = (K HOME.N))))
		(!R5 (DAD1009.SK DAD.N))
		(!R6 (E1008.SK (RIGHT-AFTER U269)))
		(!R7 (DAD1009.SK (PERTAIN-TO ME.PRO)))
		(!R8 (CAR1013.SK (PERTAIN-TO DAD1009.SK)))
		(!R9 (CAR1013.SK CAR.N))
	)
	(:GOALS
		(?G1 (DAD1009.SK (WANT.V (THAT (DAD1009.SK (HAVE.V (K HOME.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT (DAD1009.SK HAVE.V (K HOME.N))))
		(?I2 (DAD1009.SK (AT.P ?L)))
		(?I3 ((K HOME.N) (AT.P ?L)))
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
		(!W6 (E1008.SK (SAME-TIME NOW270)))
		(!W7 (E1011.SK (BEFORE NOW270)))
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
; best schemas are:
; SEARCH.V
; FIND.V
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
(setf matches (append matches '(( (2.405 0)
("The man heard his phone ring." "He didn't know where it was."
 "He followed the sound." "He found his phone."
 "He could not answer it in time.")
(EPI-SCHEMA ((MAN1024.SK FIND.708.V RING1027.SK) ** E1040.SK)
	(:ROLES
		(!R1 (MAN1024.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (RING1027.SK ((NN PHONE.N) RING.N)))
		(!R4 (RING1027.SK PHONE.N))
		(!R5 (MAN1024.SK MAN.N))
		(!R6 (RING1027.SK (PERTAIN-TO MAN1024.SK)))
	)
	(:PRECONDS
		(?I1 (MAN1024.SK (AT.P ?L)))
		(?I2 (RING1027.SK (AT.P ?L)))
		(?I3 (MAN1024.SK ((ADV-A (FOR.P RING1027.SK)) SEARCH.V)))
		(?I4 (NOT (MAN1024.SK (KNOW.V (THAT (RING1027.SK (AT.P ?L)))))))
		(?I5 (NOT (MAN1024.SK (HAVE.V RING1027.SK))))
	)
	(:POSTCONDS
		(?P1 (MAN1024.SK (KNOW.V (THAT (RING1027.SK (AT.P ?L))))))
		(?P2 (MAN1024.SK (HAVE.V RING1027.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1040.SK (BEFORE NOW277)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (3.405 3)
("The man heard his phone ring." "He didn't know where it was."
 "He followed the sound." "He found his phone."
 "He could not answer it in time.")
(EPI-SCHEMA ((MAN1024.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P SOUND1033.SK)) FOLLOW.709.V))
              SOUND1033.SK)
             ** E1034.SK)
	(:ROLES
		(!R1 (MAN1024.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (SOUND1033.SK LOCATION.N))
		(!R4 (NOT (?L1 = SOUND1033.SK)))
		(!R5 (MAN1024.SK MAN.N))
		(!R6 (SOUND1033.SK SOUND.N))
		(!R7 (RING1027.SK ((NN PHONE.N) RING.N)))
		(!R8 (RING1027.SK (PERTAIN-TO MAN1024.SK)))
		(!R9 (RING1027.SK PHONE.N))
	)
	(:GOALS
		(?G1 (MAN1024.SK (WANT.V (KA ((ADV-A (AT.P SOUND1033.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (MAN1024.SK (AT.P ?L1)))
		(?I2 (NOT (MAN1024.SK (AT.P SOUND1033.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1024.SK (AT.P ?L1))))
		(?P2 (MAN1024.SK (AT.P SOUND1033.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1034.SK))
		(!W2 (?I2 BEFORE E1034.SK))
		(!W3 (?P1 AFTER E1034.SK))
		(!W4 (?P2 AFTER E1034.SK))
		(!W5 (?G1 CAUSE-OF E1034.SK))
		(!W6 (E1034.SK (BEFORE NOW276)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 56:
	; "The girl made a dress."
	; "The dress was pretty."
	; "All her friends wanted one."
	; "She made each friend a dress of their own."
	; "He friends each wore the dress at the girl's wedding."
; best schemas are:
; MAKE.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; PLAY.V
; GIVE.V
; RECEIVING_VERB.?
(setf matches (append matches '(( (3.53 4)
("The girl made a dress." "The dress was pretty." "All her friends wanted one."
 "She made each friend a dress of their own."
 "He friends each wore the dress at the girl's wedding.")
(EPI-SCHEMA ((GIRL1042.SK MAKE.721.V DRESS1044.SK) ** E1041.SK)
	(:ROLES
		(!R1 (GIRL1042.SK AGENT.N))
		(!R2 (DRESS1044.SK INANIMATE_OBJECT.N))
		(!R3 (DRESS1044.SK DRESS.N))
		(!R4 (GIRL1042.SK GIRL.N))
		(!R5 (E1041.SK (RIGHT-AFTER U278)))
		(!R6 (WEDDING1058.SK WEDDING.N))
		(!R7 (WEDDING1058.SK (PERTAIN-TO GIRL1042.SK)))
	)
	(:GOALS
		(?G1 (GIRL1042.SK (WANT.V (THAT (DRESS1044.SK EXIST.V)))))
		(?G2 (GIRL1042.SK (WANT.V (KA (HAVE.V DRESS1044.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (DRESS1044.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (DRESS1044.SK EXIST.V))
		(?P2 (GIRL1042.SK (HAVE.V DRESS1044.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1041.SK (SAME-TIME NOW279)))
		(!W2 (E1045.SK (BEFORE NOW279)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
))))
(setf matches (append matches '(( (2.405 3)
("The girl made a dress." "The dress was pretty." "All her friends wanted one."
 "She made each friend a dress of their own."
 "He friends each wore the dress at the girl's wedding.")
(EPI-SCHEMA ((GIRL1042.SK ((ADV-A (WITH.P ?T)) PLAY.724.V) DRESS1044.SK) **
             E1041.SK)
	(:ROLES
		(!R1 (GIRL1042.SK AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (DRESS1044.SK GAME.N))
		(!R5 (DRESS1044.SK DRESS.N))
		(!R6 (GIRL1042.SK GIRL.N))
		(!R7 (E1041.SK (RIGHT-AFTER U278)))
		(!R8 (WEDDING1058.SK WEDDING.N))
		(!R9 (WEDDING1058.SK (PERTAIN-TO GIRL1042.SK)))
	)
	(:GOALS
		(?G1 (GIRL1042.SK (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (GIRL1042.SK HAVE.V ?T))
	)
	(:POSTCONDS
		(?P1 (GIRL1042.SK EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E1041.SK (SAME-TIME NOW279)))
		(!W3 (E1045.SK (BEFORE NOW279)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
))))

; story 57:
	; "Tom loved ice skating."
	; "He invited a friend to do it."
	; "The friend didn't know how."
	; "Tom pushed him too hard."
	; "The friend fell and hurt himself."
; best schemas are:
; TRAVEL.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
(setf matches (append matches '(( (2.405 0)
("Tom loved ice skating." "He invited a friend to do it."
 "The friend didn't know how." "Tom pushed him too hard."
 "The friend fell and hurt himself.")
(EPI-SCHEMA ((FRIEND1066.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) FALL.734.V)) ?L2)
             ** E1076.SK)
	(:ROLES
		(!R1 (FRIEND1066.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND1066.SK FRIEND.N))
		(!R6 (E1081.SK (AT-OR-BEFORE NOW288)))
	)
	(:GOALS
		(?G1 (FRIEND1066.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (FRIEND1066.SK (AT.P ?L1)))
		(?I2 (NOT (FRIEND1066.SK (AT.P ?L2))))
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
		(!W6 (E1076.SK (CONSEC E1080.SK)))
		(!W7 (E1080.SK (DURING E1073.SK)))
		(!W8 (E1076.SK (DURING E1073.SK)))
		(!W9 (E1073.SK (BEFORE NOW288)))
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
; PUT_IN_CONTAINER.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
; GIVE.V
; RECEIVING_VERB.?
; TRAVEL.V

; story 59:
	; "Mike was at a ball game."
	; "He needed a snack."
	; "He went to buy a snack."
	; "On the way back from getting a snack."
	; "Mike fell down and broke his arm."
; best schemas are:
; TRAVEL.V
; PLAY.V
; AVOID_ACTION_TO_AVOID_DISPLEASURE.V
(setf matches (append matches '(( (4.5 2)
("Mike was at a ball game." "He needed a snack." "He went to buy a snack."
 "On the way back from getting a snack." "Mike fell down and broke his arm.")
(EPI-SCHEMA ((MIKE.NAME
              ((ADV-A (FOR.P (KA (BUY.V SNACK1108.SK))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P GAME1102.SK)) GO.758.V)))
              ?L2)
             ** E1109.SK)
	(:ROLES
		(!R1 (MIKE.NAME AGENT.N))
		(!R2 (GAME1102.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (GAME1102.SK = ?L2)))
		(!R5 (GAME1102.SK ((NN BALL.N) GAME.N)))
		(!R6 (SNACK1108.SK SNACK.N))
		(!R7 (ARM1118.SK (PERTAIN-TO MIKE.NAME)))
		(!R8 (ARM1118.SK ARM.N))
	)
	(:GOALS
		(?G1 (MIKE.NAME (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(E1120.SK (MIKE.NAME (AT.P GAME1102.SK)))
		(?I2 (NOT (MIKE.NAME (AT.P ?L2))))
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
		(!W6 (E1120.SK (BEFORE NOW294)))
		(!W7 (E1109.SK (BEFORE NOW296)))
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
; GIVE.V
; RECEIVING_VERB.?
; EAT.V
; FEED.V
; PLAY.V

; story 61:
	; "Andre was at a party."
	; "He then lost his phone."
	; "The whole party stopped."
	; "People are all looking for it."
	; "They found it."
; best schemas are:
; SEARCH.V
; FIND.V

