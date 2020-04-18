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
    ** E1087.SK)
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
     THEY1352.SK)
    ** E1329.SK)
;		((MOTHER.NAME ((ADV-A (WITH.P MOTHER.NAME)) (HOME.ADV TAKE.1087.V))
     THEY1352.SK (AT.P-ARG ?L))
    ** E1349.SK)
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
     THEY1352.SK)
    ** E1329.SK)
;		((MOTHER.NAME ((ADV-A (WITH.P MOTHER.NAME)) (HOME.ADV TAKE.1087.V))
     THEY1352.SK (AT.P-ARG ?L))
    ** E1349.SK)
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

