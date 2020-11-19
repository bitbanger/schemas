(setf matches (list))
(setf chain-matches (list))
; story 0:
	; "I see a girl."
	; "I see a boy."
	; "I see a boy and a girl."
	; "The boy can see the girl."
	; "I can see the girl and the boy."
	; "I can see the girl."

; story 1:
	; "A parrot can talk."

; story 2:
	; "The boy and the dog run."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA (((SET-OF BOY31.SK DOG32.SK)
              (BE.PASV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.301.V)))
              ?L2)
             ** E30.SK)
	(:ROLES
		(!R1 ((SET-OF BOY31.SK DOG32.SK) AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (DOG32.SK DOG.N))
		(!R6 (BOY31.SK BOY.N))
		(!R7 (E30.SK (RIGHT-AFTER U6)))
	)
	(:GOALS
		(?G1 ((SET-OF BOY31.SK DOG32.SK) (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 ((SET-OF BOY31.SK DOG32.SK) (AT.P ?L1)))
		(?I2 (NOT ((SET-OF BOY31.SK DOG32.SK) (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT ((SET-OF BOY31.SK DOG32.SK) (AT.P ?L1))))
		(?P2 ((SET-OF BOY31.SK DOG32.SK) (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E30.SK))
		(!W2 (?I2 BEFORE E30.SK))
		(!W3 (?P1 AFTER E30.SK))
		(!W4 (?P2 AFTER E30.SK))
		(!W5 (?G1 CAUSE.V E30.SK))
		(!W6 (E30.SK (SAME-TIME NOW7)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 3:
	; "The hen will run at the cat."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((HEN35.SK
              ((ADV-A (AT.P CAT36.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.451.V)))
              ?L2)
             ** E38.SK)
	(:ROLES
		(!R1 (HEN35.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (CAT36.SK CAT.N))
		(!R6 (HEN35.SK HEN.N))
		(!R7 (E6 (ORIENTS E34.SK)))
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
		(!W5 (?G1 CAUSE.V E38.SK))
		(!W6 (E38.SK (AFTER E34.SK)))
		(!W7 (E34.SK (AT-ABOUT NOW8)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 4:
	; "The dog and hen run at the cat."

; story 5:
	; "I see one dog and two cats."

; story 6:
	; "She saw Rover run off with the hat."

; story 7:
	; "Here come Jack and Jill on a red sled."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((OBJECT51.SK
              (HERE.ADV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.901.V)))
              ?L2)
             ** E63.SK)
	(:ROLES
		(!R1 (OBJECT51.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (OBJECT51.SK (= (SET-OF JACK.NAME JILL.NAME))))
		(!R6 (OBJECT51.SK (ON.P SLED61.SK)))
		(!R7 (SLED61.SK SLED.N))
		(!R8 (SLED61.SK RED.A))
		(!R9 (E12 (ORIENTS E63.SK)))
	)
	(:GOALS
		(?G1 (OBJECT51.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (OBJECT51.SK (AT.P ?L1)))
		(?I2 (NOT (OBJECT51.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (OBJECT51.SK (AT.P ?L1))))
		(?P2 (OBJECT51.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E63.SK))
		(!W2 (?I2 BEFORE E63.SK))
		(!W3 (?P1 AFTER E63.SK))
		(!W4 (?P2 AFTER E63.SK))
		(!W5 (?G1 CAUSE.V E63.SK))
		(!W6 (E63.SK (BEFORE NOW12)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 8:
	; "The Hare runs from the Dog."

; story 9:
	; "The Fox will eat the Hen."

; story 10:
	; "The Man breaks the Ice."

; story 11:
	; "That man is shooting partridges."

; story 12:
	; "The rat ran from the box."
(setf matches (append matches '( (10.0 0.1)
(EPI-SCHEMA ((RAT75.SK
              ((ADV-A (FROM.P BOX77.SK)) ((ADV-A (TO.P ?L2)) RUN.1261.V)) ?L2)
             ** E74.SK)
	(:ROLES
		(!R1 (RAT75.SK AGENT.N))
		(!R2 (BOX77.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (BOX77.SK = ?L2)))
		(!R5 (BOX77.SK BOX.N))
		(!R6 (RAT75.SK RAT.N))
		(!R7 (E74.SK (RIGHT-AFTER U16)))
		(!R8 (E13 (ORIENTS E78.SK)))
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
		(!W5 (?G1 CAUSE.V E74.SK))
		(!W6 (E74.SK (SAME-TIME NOW17)))
		(!W7 (E78.SK (BEFORE NOW17)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 13:
	; "The man with the big hat has a cow."

; story 14:
	; "The baby can not have the bird."
	; "She can not fly and catch it."

; story 15:
	; "I have four apples on this plate."
	; "If I put two apples on the box, I shall leave two apples on the plate."
	; "Four apples are two apples and two apples."
	; "If I put three apples on the box, I shall leave one apple on the plate."
	; "Four apples are three apples and one apple."
	; "If I put one on the box, I shall leave on the plate."

; story 16:
	; "The bear was small then, so he was not afraid of him."
	; "He cut the tree down, and as soon as it fell, the dogs caught the bear."

; story 17:
	; "The cat saw the rat."
	; "Off ran the rat, and off ran the cat."
	; "But the rat got to the hole all safe."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((RAT124.SK ((ADV-A (TO.P HOLE134.SK)) GET.2071.V) ?O
              (AT.P-ARG ?L))
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
		(!R9 (E35 (ORIENTS E136.SK)))
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
)))

; story 18:
	; "It is not a dog, but it has legs."
	; "It is not a bird, but it has wings."
	; "It says buz, buz, buz."
	; "It is busy all the day."

; story 19:
	; "I like to see John run with his kite."
	; "He can run as fast as the other boys, but he can not jump far."
	; "He does not like to look at books and pictures, but he can play on a drum."

; story 20:
	; "Ada has a fan in her hand."
	; "These fans are May's."
	; "Ada has May's white fan."

; story 21:
	; "The boy has a big dog."
	; "You may see the dog play ball."

; story 22:
	; "I have a doll."
	; "I can see my doll."
	; "My doll has a hat."
	; "The girl has a doll and a hat."

; story 23:
	; "A dog runs."
	; "The dog is black."
	; "It is a large, black dog."
	; "Is it Tom's black dog?"
	; "It is my black dog."
	; "My large, black dog runs."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((DOG211.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.2881.V))
              ?L2)
             ** E210.SK)
	(:ROLES
		(!R1 (DOG211.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (DOG211.SK DOG.N))
		(!R6 (E57 (ORIENTS E210.SK)))
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
		(!W5 (?G1 CAUSE.V E210.SK))
		(!W6 (E210.SK (AT-ABOUT NOW48)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 24:
	; "One day Ned went out to walk."
	; "He looked up and saw a green bird."

; story 25:
	; "Baby sits on the soft mat."
	; "You may play near her a while."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA (((K BABY.N)
              ((ADV-A (ON.P MAT247.SK)) ((ADV-A (IN.P MAT247.SK)) SIT.3181.V)))
             ** E248.SK)
	(:ROLES
		(!R1 ((K BABY.N) AGENT.N))
		(!R2 (MAT247.SK INANIMATE_OBJECT.N))
		(!R3 (MAT247.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (MAT247.SK MAT.N))
		(!R6 (MAT247.SK SOFT.A))
		(!R7 (E63 (ORIENTS E248.SK)))
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
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 26:
	; "Little Jack has a funny horse."
	; "He rides the spade."

; story 27:
	; "The puppies are full of fun."
	; "I like to see them play with each other."

; story 28:
	; "This cat was in a nest."
	; "A hen ran at her."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((HEN274.SK
              ((ADV-A (AT.P CAT271.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.3661.V)))
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
		(!R8 (E72 (ORIENTS E278.SK)))
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
		(!W5 (?G1 CAUSE.V E278.SK))
		(!W6 (E278.SK (BEFORE NOW63)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 29:
	; "The cat is on the box."
	; "She saw a big rat and ran to catch it."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((CAT281.SK
              ((ADV-A (FOR.P (KA (CATCH.V RAT288.SK))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.3901.V)))
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
		(!R8 (E75 (ORIENTS E290.SK)))
		(!R9 (E73 (ORIENTS E294.SK)))
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
		(!W5 (?G1 CAUSE.V E290.SK))
		(!W6 (E294.SK (CONSEC E290.SK)))
		(!W7 (E290.SK (BEFORE NOW65)))
		(!W8 (E294.SK (BEFORE NOW65)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 30:
	; "I love little Lucy."
	; "But now she has gone far away to her home."

; story 31:
	; "Here is Jean with her hoop."
	; "Jean can roll the hoop very fast."
	; "The hoop has bells on it."
	; "The bells tinkle, tinkle, tinkle."

; story 32:
	; "I see a nest, Rosy!"
	; "Can you see it?"
	; "It is in this big green tree."

; story 33:
	; "Did Cora go to the hill?"
	; "We did not see her there."
	; "When we saw Cora this morning, she was dressing her doll."
	; "She said she was going to see Elsie."
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((WE347.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.4351.V
              (KA ((THERE.ADV SEE.V) CORA.NAME)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((THERE.ADV SEE.V) CORA.NAME)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (WE347.SK AGENT.N))
		(!R4 (E86 (ORIENTS E340.SK)))
	)
	(:GOALS
		(?G1 (WE347.SK (WANT.V (THAT (NOT (WE347.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (WE347.SK (DO.V (KA ((THERE.ADV SEE.V) CORA.NAME))))) CAUSE.V
    (KE (WE347.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E340.SK (WE347.SK (THERE.ADV DO.V) (KA ((THERE.ADV SEE.V) CORA.NAME))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E340.SK))
		(!W2 (E340.SK (BEFORE NOW76)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 34:
	; "The bird can fly."
	; "The baby can not have the bird."
	; "She can not fly."
	; "She may play with my doll."
	; "She may have my big hat."

; story 35:
	; "The cats are on the steps."
	; "One cat is sitting on the steps."
	; "One cat is lying on the steps."
	; "Is the black cat lying on the mat?"
	; "No; it is the white one."
	; "The black one is sitting near the white one."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((CAT376.SK
              ((ADV-A (ON.P STEP374.SK))
               ((ADV-A (IN.P STEP374.SK)) SIT.4651.V)))
             ** E375.SK)
	(:ROLES
		(!R1 (CAT376.SK AGENT.N))
		(!R2 (STEP374.SK INANIMATE_OBJECT.N))
		(!R3 (STEP374.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (STEP374.SK (PLUR STEP.N)))
		(!R6 (CAT376.SK CAT.N))
		(!R7 (E99 (ORIENTS E375.SK)))
	)
	(:GOALS
		(?G1 (CAT376.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (CAT376.SK (AT.P ?L)))
		(?I2 (STEP374.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E375.SK (AT-ABOUT NOW85)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 36:
	; "Kate has left her doll in its little bed, and has gone to play with Mary and James."
	; "They are all in the shade, now, by the brook."
	; "James digs in the soft sand with his spade, and Mary picks up little stones and puts them in her lap."
	; "James and Mary are glad to see Kate."
	; "She will help them pick up stones and dig, by the little brook."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((KATE.NAME
              ((ADV-A
                (FOR.P
                 (KA ((ADV-A (WITH.P (SET-OF MARY.NAME JAMES.NAME))) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.4831.V)))
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
		(!R8 (E105 (ORIENTS E400.SK)))
		(!R9 (OBJECT408.SK (PERTAIN-TO KATE.NAME)))
		(!R10 (DOLL409.SK DOLL.N))
		(!R11 (DOLL409.SK (PERTAIN-TO KATE.NAME)))
		(!R12 (SPADE430.SK SPADE.N))
		(!R13 (SPADE430.SK (PERTAIN-TO JAMES.NAME)))
		(!R14 (E106 (ORIENTS E405.SK)))
		(!R15 (E406.SK (IMPINGES-ON E401.SK)))
		(!R16 (E104 (ORIENTS E401.SK)))
		(!R17 (E98 (ORIENTS E406.SK)))
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
		(!W5 (?G1 CAUSE.V E400.SK))
		(!W6 (E400.SK (AT-ABOUT NOW90)))
		(!W7 (E401.SK (AT-ABOUT NOW90)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 37:
	; "My papa gave me two pretty rabbits."
	; "My rabbits eat from my hand."
	; "I shall keep them in a little house."
	; "I love my dear papa."
(setf matches (append matches '( (7.0 0.2)
(EPI-SCHEMA ((RABBITS440.SK ((ADV-A (FROM.P HAND443.SK)) EAT.4891.V) ?F) **
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
		(!R12 (E114 (ORIENTS E444.SK)))
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
		(!W3 (E439.SK CAUSE.V ?P1))
		(!W4 (E439.SK (SAME-TIME NOW96)))
		(!W5 (E444.SK (AT-ABOUT NOW96)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (4.0 0.2)
(EPI-SCHEMA ((ME454.SK FEED.4921.V RABBITS440.SK ?F) ** ?E)
	(:ROLES
		(!R1 (RABBITS440.SK AGENT.N))
		(!R2 (?F FOOD.N))
		(!R3 (NOT (ME454.SK = RABBITS440.SK)))
		(!R4 (NOT (RABBITS440.SK = ?F)))
		(!R5 (NOT (ME454.SK = ?F)))
		(!R6 (E439.SK (RIGHT-AFTER U95)))
		(!R7 (E114 (ORIENTS E444.SK)))
		(!R8 (ME454.SK AGENT.N))
		(!R9 (PAPA437.SK PAPA.N))
		(!R10 (PAPA437.SK (PERTAIN-TO ME454.SK)))
		(!R11 (PAPA437.SK (DEAR.ADV PAPA.N)))
		(!R12 (HAND443.SK (PERTAIN-TO ME454.SK)))
		(!R13 (HAND443.SK HAND.N))
		(!R14 (RABBITS440.SK (PLUR RABBIT.N)))
		(!R15 (RABBITS440.SK (PERTAIN-TO ME454.SK)))
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
)))
(setf matches (append matches '( (4.0 0.2)
(EPI-SCHEMA ((ME454.SK FEED.4922.V RABBITS440.SK ?F) ** ?E)
	(:ROLES
		(!R1 (RABBITS440.SK AGENT.N))
		(!R2 (?F FOOD.N))
		(!R3 (NOT (ME454.SK = RABBITS440.SK)))
		(!R4 (NOT (RABBITS440.SK = ?F)))
		(!R5 (NOT (ME454.SK = ?F)))
		(!R6 (E114 (ORIENTS E444.SK)))
		(!R7 (E439.SK (RIGHT-AFTER U95)))
		(!R8 (ME454.SK AGENT.N))
		(!R9 (PAPA437.SK (PERTAIN-TO ME454.SK)))
		(!R10 (PAPA437.SK (DEAR.ADV PAPA.N)))
		(!R11 (PAPA437.SK PAPA.N))
		(!R12 (RABBITS440.SK (PERTAIN-TO ME454.SK)))
		(!R13 (RABBITS440.SK (PLUR RABBIT.N)))
		(!R14 (HAND443.SK HAND.N))
		(!R15 (HAND443.SK (PERTAIN-TO ME454.SK)))
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
)))

; story 38:
	; "I have three good apples."
	; "One is red, and two are yellow."
	; "I will give you the red one."
	; "I see a big red apple in the tree."
(setf matches (append matches '( (5.5 0.3)
(EPI-SCHEMA ((ME473.SK ((ADV-A (TO.P YOU.PRO)) GIVE.5041.V) YOU.PRO ONE463.SK)
             ** E466.SK)
	(:ROLES
		(!R1 (ONE463.SK INANIMATE_OBJECT.N))
		(!R2 (ONE463.SK ONE.N))
		(!R3 (ONE463.SK RED.A))
		(!R4 (ME473.SK AGENT.N))
		(!R5 (YOU.PRO AGENT.N))
		(!R6 (E121 (ORIENTS E460.SK)))
	)
	(:GOALS
		(?G1 (ME473.SK (WANT.V (THAT (YOU.PRO (HAVE.V ONE463.SK))))))
	)
	(:PRECONDS
		(?I1 (ME473.SK HAVE.V ONE463.SK))
		(?I2 (NOT (YOU.PRO HAVE.V ONE463.SK)))
	)
	(:POSTCONDS
		(?P1 (NOT (ME473.SK HAVE.V ONE463.SK)))
		(?P2 (YOU.PRO HAVE.V ONE463.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E466.SK (AFTER E460.SK)))
		(!W2 (E460.SK (AT-ABOUT NOW101)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (7.0 0.4)
(EPI-SCHEMA ((ME473.SK FEED.5131.V YOU.PRO ONE463.SK) ** E466.SK)
	(:ROLES
		(!R1 (ONE463.SK FOOD.N))
		(!R2 (NOT (ME473.SK = YOU.PRO)))
		(!R3 (NOT (YOU.PRO = ONE463.SK)))
		(!R4 (NOT (ME473.SK = ONE463.SK)))
		(!R5 (ONE463.SK ONE.N))
		(!R6 (ONE463.SK RED.A))
		(!R7 (ME473.SK AGENT.N))
		(!R8 (YOU.PRO AGENT.N))
		(!R9 (E121 (ORIENTS E460.SK)))
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
)))

; story 39:
	; "I have three good apples."
	; "One is red, and two are yellow."
	; "I will give you the red one."
	; "I see a big red apple in the tree."
(setf matches (append matches '( (5.5 0.3)
(EPI-SCHEMA ((ME492.SK ((ADV-A (TO.P YOU.PRO)) GIVE.5191.V) YOU.PRO ONE484.SK)
             ** E485.SK)
	(:ROLES
		(!R1 (ONE484.SK INANIMATE_OBJECT.N))
		(!R2 (ONE484.SK ONE.N))
		(!R3 (ONE484.SK RED.A))
		(!R4 (ME492.SK AGENT.N))
		(!R5 (YOU.PRO AGENT.N))
		(!R6 (E126 (ORIENTS E481.SK)))
	)
	(:GOALS
		(?G1 (ME492.SK (WANT.V (THAT (YOU.PRO (HAVE.V ONE484.SK))))))
	)
	(:PRECONDS
		(?I1 (ME492.SK HAVE.V ONE484.SK))
		(?I2 (NOT (YOU.PRO HAVE.V ONE484.SK)))
	)
	(:POSTCONDS
		(?P1 (NOT (ME492.SK HAVE.V ONE484.SK)))
		(?P2 (YOU.PRO HAVE.V ONE484.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E485.SK (AFTER E481.SK)))
		(!W2 (E481.SK (AT-ABOUT NOW105)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (7.0 0.4)
(EPI-SCHEMA ((ME492.SK FEED.5281.V YOU.PRO ONE484.SK) ** E485.SK)
	(:ROLES
		(!R1 (ONE484.SK FOOD.N))
		(!R2 (NOT (ME492.SK = YOU.PRO)))
		(!R3 (NOT (YOU.PRO = ONE484.SK)))
		(!R4 (NOT (ME492.SK = ONE484.SK)))
		(!R5 (ONE484.SK ONE.N))
		(!R6 (ONE484.SK RED.A))
		(!R7 (ME492.SK AGENT.N))
		(!R8 (YOU.PRO AGENT.N))
		(!R9 (E126 (ORIENTS E481.SK)))
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
)))

; story 40:
	; "Come with me, and see the boys."
	; "One little boy has a drum."
	; "Two boys have big hats."
	; "One boy has a ball."

; story 41:
	; "A top spins."
	; "The tops spin."
	; "Tom spins the tops."
	; "He spins the tops on a box."
	; "Tom spins my large top."
	; "He spins my small top."
	; "Spin, tops, spin."

; story 42:
	; "Here are two dogs."
	; "One dog is black."
	; "One dog is white."
	; "A dog runs."
	; "The dogs run."
	; "Run, dogs, run."
	; "One dog and one dog are two dogs."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((DOG542.SK ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.5671.V))
              ?L2)
             ** E541.SK)
	(:ROLES
		(!R1 (DOG542.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (DOG542.SK DOG.N))
		(!R6 (E139 (ORIENTS E541.SK)))
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
		(!W5 (?G1 CAUSE.V E541.SK))
		(!W6 (E541.SK (AT-ABOUT NOW121)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 43:
	; "Do you see the man and the woman in this large boat?"
	; "They have no house; they live in the boat."
	; "What have they in the boat?"
	; "They have corn and cocoanuts."
	; "They are taking them to Manila."

; story 44:
	; "The girl is good to the little baby."
	; "The baby may have my big doll."
	; "She can not catch the bird."
	; "She may come with me and see the bird fly."

; story 45:
	; "It is raining."
	; "It rains on the cows and the calf."
	; "It rains on the man and the horses."
	; "One of the horses is drinking from the brook."
	; "The rain makes the grass and the flowers grow."
;WEIRD BUG: invoker (?E1 ((SET-OF COWS589.SK PRED?590.SK) EAT.6273.V ?F)) can't unify with header ((?X
;                                                                                                   FEED.V
;                                                                                                   (SET-OF
;                                                                                                    COWS589.SK
;                                                                                                    PRED?590.SK)
;                                                                                                   ?F)
;                                                                                                  **
;                                                                                                  ?E)
; error parsing story
; story 46:
	; "The little boy has a red wagon."
	; "The boy will let little May ride in it."
	; "Come, May, come and see my wagon."
	; "You may get in it, and have a ride."
	; "I will take you with me to the fields."
	; "You may have a good ride."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME636.SK
              ((ADV-A (WITH.P ME636.SK))
               ((ADV-A (TO.P FIELD632.SK)) TAKE.6276.V))
              YOU637.SK (AT.P-ARG ?L))
             ** E633.SK)
	(:ROLES
		(!R1 (YOU637.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME636.SK = YOU637.SK)))
		(!R4 (ME636.SK AGENT.N))
		(!R5 (FIELD632.SK (PLUR FIELD.N)))
		(!R6 (WAGON613.SK (PERTAIN-TO ME636.SK)))
		(!R7 (WAGON613.SK RED.A))
		(!R8 (WAGON613.SK WAGON.N))
		(!R9 (E162 (ORIENTS E630.SK)))
	)
	(:GOALS
		(?G1 (ME636.SK (WANT.V (THAT (ME636.SK (HAVE.V YOU637.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME636.SK HAVE.V YOU637.SK)))
		(?I2 (ME636.SK (AT.P ?L)))
		(?I3 (YOU637.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (ME636.SK HAVE.V YOU637.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E633.SK))
		(!W2 (?I1 PRECOND-OF E633.SK))
		(!W3 (?I2 PRECOND-OF E633.SK))
		(!W4 (?I3 PRECOND-OF E633.SK))
		(!W5 (?P1 POSTCOND-OF E633.SK))
		(!W6 (E633.SK (AFTER E630.SK)))
		(!W7 (E630.SK (AT-ABOUT NOW143)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 47:
	; "Here is John with his ball."
	; "He and Tyke are playing ball."
	; "John likes to play ball with Tyke."
	; "John can catch the ball."
	; "Tyke can catch it, too."
	; "John rolls the ball to Tyke."
	; "Tyke takes the ball to John."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA (((K TYKE.N) TAKE.6454.V BALL651.SK (AT.P-ARG ?L)) ** E672.SK)
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
		(!R10 (E172 (ORIENTS E672.SK)))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((JOHN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P BALL651.SK)) ROLL.6484.V))
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
		(!R10 (E171 (ORIENTS E662.SK)))
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
		(!W5 (?G1 CAUSE.V E662.SK))
		(!W6 (E662.SK (AT-ABOUT NOW150)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 48:
	; "The old cat can catch a mouse."
	; "She has a mouse in her mouth."
	; "What will she do with it?"
	; "She will give it to her little kittens."
	; "They will play with the mouse."
	; "They are not afraid of it; but the mouse is afraid of the kittens."
(setf matches (append matches '( (6.5 0.2)
(EPI-SCHEMA ((CAT677.SK ((ADV-A (TO.P MOUSE675.SK)) GIVE.6574.V) MOUSE675.SK
              MOUSE682.SK)
             ** E690.SK)
	(:ROLES
		(!R1 (CAT677.SK AGENT.N))
		(!R2 (MOUSE682.SK INANIMATE_OBJECT.N))
		(!R3 (MOUSE675.SK AGENT.N))
		(!R4 (MOUSE682.SK MOUSE.N))
		(!R5 (E174 (ORIENTS E683.SK)))
		(!R6 (CAT677.SK CAT.N))
		(!R7 (CAT677.SK OLD.A))
		(!R8 (MOUSE675.SK MOUSE.N))
		(!R9 (OBJECT687.SK (PERTAIN-TO CAT677.SK)))
		(!R10 (E176 (ORIENTS E686.SK)))
	)
	(:GOALS
		(?G1 (CAT677.SK (WANT.V (THAT (MOUSE675.SK (HAVE.V MOUSE682.SK))))))
	)
	(:PRECONDS
		(E683.SK (CAT677.SK HAVE.V MOUSE682.SK))
		(?I2 (NOT (MOUSE675.SK HAVE.V MOUSE682.SK)))
	)
	(:POSTCONDS
		(?P1 (NOT (CAT677.SK HAVE.V MOUSE682.SK)))
		(?P2 (MOUSE675.SK HAVE.V MOUSE682.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E683.SK (AT-ABOUT NOW153)))
		(!W2 (E690.SK (AFTER E686.SK)))
		(!W3 (E686.SK (AT-ABOUT NOW155)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (5.0 0.3)
(EPI-SCHEMA ((THEY699.SK ((ADV-A (WITH.P MOUSE675.SK)) PLAY.6605.V) ?G) **
             E693.SK)
	(:ROLES
		(!R1 (MOUSE675.SK TOY.N))
		(!R2 (MOUSE675.SK INANIMATE_OBJECT.N))
		(!R3 (?G GAME.N))
		(!R4 (MOUSE675.SK MOUSE.N))
		(!R5 (THEY699.SK AGENT.N))
		(!R6 (E177 (ORIENTS E691.SK)))
	)
	(:GOALS
		(?G1 (THEY699.SK (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (THEY699.SK HAVE.V MOUSE675.SK))
	)
	(:POSTCONDS
		(?P1 (THEY699.SK EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E693.SK (AFTER E691.SK)))
		(!W3 (E691.SK (AT-ABOUT NOW156)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (8.0 0.3)
(EPI-SCHEMA ((CAT677.SK ((ADV-A (TO.P OBJECT687.SK)) FEED.6634.V) MOUSE675.SK
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
		(!R8 (E174 (ORIENTS E683.SK)))
		(!R9 (CAT677.SK CAT.N))
		(!R10 (CAT677.SK OLD.A))
		(!R11 (MOUSE675.SK MOUSE.N))
		(!R12 (OBJECT687.SK (PERTAIN-TO CAT677.SK)))
		(!R13 (E176 (ORIENTS E686.SK)))
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
)))
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((THEY699.SK ((ADV-A (WITH.P MOUSE675.SK)) PLAY.6665.V) ?O) **
             E693.SK)
	(:ROLES
		(!R1 (?O INANIMATE_OBJECT.N))
		(!R2 (THEY699.SK AGENT.N))
		(!R3 (MOUSE675.SK MOUSE.N))
		(!R4 (E177 (ORIENTS E691.SK)))
	)
	(:GOALS
		(?G1 (THEY699.SK (WANT.V (THAT (?O EXIST.V)))))
		(?G2 (THEY699.SK (WANT.V (KA (HAVE.V ?O)))))
	)
	(:PRECONDS
		(?I1 (NOT (?O EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (?O EXIST.V))
		(?P2 (THEY699.SK (HAVE.V ?O)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E693.SK (AFTER E691.SK)))
		(!W2 (E691.SK (AT-ABOUT NOW156)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 49:
	; "Ann gave Ned three cakes of paint."
	; "She told him to paint just what you see here."
	; "She gave him red and yellow."
	; "Here is a new color: It is purple."
	; "Red and blue make purple."
(setf matches (append matches '( (3.5 0)
(EPI-SCHEMA ((ANN.NAME ((ADV-A (TO.P OBJECT704.SK)) GIVE.6724.V) OBJECT704.SK
              ?O)
             ** E706.SK)
	(:ROLES
		(!R1 (ANN.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (OBJECT704.SK AGENT.N))
		(!R4 (OBJECT704.SK (OF.P (K PAINT.N))))
		(!R5 (E115 (ORIENTS E706.SK)))
	)
	(:GOALS
		(?G1 (ANN.NAME (WANT.V (THAT (OBJECT704.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (ANN.NAME HAVE.V ?O))
		(?I2 (NOT (OBJECT704.SK HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (ANN.NAME HAVE.V ?O)))
		(?P2 (OBJECT704.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E706.SK (BEFORE NOW158)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (7.0 0.2)
(EPI-SCHEMA ((ANN.NAME FEED.6754.V OBJECT704.SK ?F) ** E706.SK)
	(:ROLES
		(!R1 (ANN.NAME AGENT.N))
		(!R2 (OBJECT704.SK AGENT.N))
		(!R3 (?F FOOD.N))
		(!R4 (NOT (ANN.NAME = OBJECT704.SK)))
		(!R5 (NOT (OBJECT704.SK = ?F)))
		(!R6 (NOT (ANN.NAME = ?F)))
		(!R7 (OBJECT704.SK (OF.P (K PAINT.N))))
		(!R8 (E115 (ORIENTS E706.SK)))
	)
	(:GOALS
		(?G1 (ANN.NAME (WANT.V (THAT (NOT (OBJECT704.SK HUNGRY.A))))))
		(?G2 (ANN.NAME (WANT.V (THAT (OBJECT704.SK EAT.V ?F)))))
	)
	(:PRECONDS
		(?I1 (ANN.NAME HAVE.V ?F))
		(?I2 (OBJECT704.SK HUNGRY.A))
	)
	(:STEPS
		(?E1 (OBJECT704.SK EAT.V ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (ANN.NAME (HAVE.V ?F))))
		(?P2 (NOT (OBJECT704.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E706.SK))
		(!W2 (E706.SK (BEFORE NOW158)))
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
)))

; story 50:
	; "A little bird can not eat nuts."
	; "He likes crumbs."
	; "Squirrels have sharp teeth."
	; "It is easy for them to eat nuts."

; story 51:
	; "Little Henry went to school this morning."
	; "All the children were glad to see him as he came down the street."
	; "He is a funny little boy, and I am sure you would like him."
	; "He says he will grow very fast and soon be a man."
	; "He likes to go to school."

; story 52:
	; "Frank has gone to the field with his kite."
	; "He likes to play with it."
	; "It is the kite his father gave him."
	; "He will run and the kite will fly."
	; "He can run very fast, and the kite can fly very high."
	; "John does not like to run with a kite."
	; "He likes to play on his drum."
	; "He will play on his drum, and Frank will run with his kite."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((FRANK.NAME
              ((ADV-A (WITH.P KITE765.SK))
               ((ADV-A (TO.P FIELD763.SK)) ((ADV-A (FROM.P ?L1)) GO.7114.V)))
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
		(!R9 (E166 (ORIENTS E762.SK)))
		(!R10 (KITE792.SK (PERTAIN-TO FRANK.NAME)))
		(!R11 (KITE792.SK KITE.N))
		(!R12 (E198 (ORIENTS E757.SK)))
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
		(!W5 (?G1 CAUSE.V E762.SK))
		(!W6 (E757.SK (AT-ABOUT NOW172)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 53:
	; "I have a large mango."
	; "This mango is larger than mine."
	; "That is the largest mango in the basket."
	; "This tree is tall."
	; "That tree is taller than this one."
	; "The cocoanut tree is the tallest tree in the yard."

; story 54:
	; "I can see a swan."
	; "A swan can swim well."
	; "A swan can not walk well, but she can swim very fast."
	; "The swan has a nest by the side of the pond."
	; "She lays eggs in her nest."
	; "She is a white swan."

; story 55:
	; "We live on the round earth."
	; "There is land and water on all sides of it."
	; "Men have sailed all around it in ships."
	; "All sails are set."
	; "Men can sail it over the wide, wide sea."

; story 56:
	; "I see a fox on a box, and a fox in front of a box."
	; "Frank has two foxes and two boxes."
	; "He gave each fox a box in which to sleep."
	; "He put hay in the boxes."
	; "The boxes are good houses for them."
	; "Frank feeds his foxes and gives them water."
(setf matches (append matches '( (7.0 0.2)
(EPI-SCHEMA ((FRANK.NAME FEED.7744.V FOX906.SK ?F) ** E908.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (FOX906.SK AGENT.N))
		(!R3 (?F FOOD.N))
		(!R4 (NOT (FRANK.NAME = FOX906.SK)))
		(!R5 (NOT (FOX906.SK = ?F)))
		(!R6 (NOT (FRANK.NAME = ?F)))
		(!R7 (FOX906.SK (PERTAIN-TO FRANK.NAME)))
		(!R8 (FOX906.SK (PLUR FOX.N)))
		(!R9 (E237 (ORIENTS E908.SK)))
		(!R10 (E238 (ORIENTS E907.SK)))
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
)))
(setf matches (append matches '( (3.5 0)
(EPI-SCHEMA ((FRANK.NAME ((ADV-A (TO.P FOX906.SK)) FEED.7774.V) FOX906.SK ?O)
             ** E908.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (FOX906.SK AGENT.N))
		(!R4 (FOX906.SK (PERTAIN-TO FRANK.NAME)))
		(!R5 (FOX906.SK (PLUR FOX.N)))
		(!R6 (E237 (ORIENTS E908.SK)))
		(!R7 (E238 (ORIENTS E907.SK)))
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
)))

; story 57:
	; "The girls have come to play with the baby."
	; "Two girls have little dolls."
	; "One girl has a red dress."
	; "The baby is glad to see the girls."
	; "The girl with the red dress is May."
	; "May is glad to see the good baby."
	; "She will take the baby to see the bird."

; story 58:
	; "The girls have come to play with the baby."
	; "Two girls have little dolls."
	; "One girl has a red dress."
	; "The baby is glad to see the girls."
	; "The girl with the red dress is May."
	; "May is glad to see the good baby."
	; "She will take the baby to see the bird."

; story 59:
	; "I have a pet hen."
	; "She has a nest in a box."
	; "Two eggs are in the nest."
	; "One day when she went away to get her dinner, a big rat came to get an egg; but he did not get the egg."
	; "My hen saw him and did not let him get the egg."
	; "A rat will eat an egg if he can get it."

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

; story 61:
	; "Frank and little May are in the field with the wagon."
	; "They have come to find flowers."
	; "May has a red flower."
	; "Frank has three yellow flowers."
	; "He will let May have them."
	; "She will take them to the wagon She is glad to get the pretty flowers."
(setf matches (append matches '( (10.0 0.4)
(EPI-SCHEMA (((SET-OF FRANK.NAME X) ((ADV-A (TO.P WAGON1070.SK)) TAKE.8614.V)
              MAY.NAME (AT.P-ARG FIELD1058.SK))
             ** E1072.SK)
	(:ROLES
		(!R1 ((SET-OF FRANK.NAME X) AGENT.N))
		(!R2 (MAY.NAME INANIMATE_OBJECT.N))
		(!R3 (FIELD1058.SK LOCATION.N))
		(!R4 (NOT ((SET-OF FRANK.NAME X) = MAY.NAME)))
		(!R5 (WAGON1070.SK WAGON.N))
		(!R6 (E281 (ORIENTS E1068.SK)))
		(!R7 (E1068.SK (ORIENTS OBJECT1073.SK)))
		(!R8 (FIELD1058.SK FIELD.N))
	)
	(:GOALS
		(?G1
   ((SET-OF FRANK.NAME X)
    (WANT.V (THAT ((SET-OF FRANK.NAME X) (HAVE.V MAY.NAME))))))
	)
	(:PRECONDS
		(?I1 (NOT ((SET-OF FRANK.NAME X) HAVE.V MAY.NAME)))
		(?I2 ((SET-OF FRANK.NAME X) (AT.P FIELD1058.SK)))
		(?I3 (MAY.NAME (AT.P FIELD1058.SK)))
	)
	(:POSTCONDS
		(?P1 ((SET-OF FRANK.NAME X) HAVE.V MAY.NAME))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1072.SK))
		(!W2 (?I1 PRECOND-OF E1072.SK))
		(!W3 (?I2 PRECOND-OF E1072.SK))
		(!W4 (?I3 PRECOND-OF E1072.SK))
		(!W5 (?P1 POSTCOND-OF E1072.SK))
		(!W6 (E1072.SK (AFTER E1068.SK)))
		(!W7 (E1068.SK (AT-ABOUT NOW239)))
		(!W8 (OBJECT1073.SK (AT-ABOUT NOW239)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (10.0 0.1)
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N))))))
               ((ADV-A (TO.P ?L2))
                ((ADV-A (FROM.P FIELD1058.SK)) COME.8644.V)))
              ?L2)
             ** E1060.SK)
	(:ROLES
		(!R1 (MAY.NAME AGENT.N))
		(!R2 (FIELD1058.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (FIELD1058.SK = ?L2)))
		(!R5 (E247 (ORIENTS E1060.SK)))
		(!R6 (E1060.SK (IMPINGES-ON E276)))
		(!R7 (E276 (ORIENTS OBJECT1061.SK)))
		(!R8 (FIELD1058.SK FIELD.N))
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
		(!W5 (?G1 CAUSE.V E1060.SK))
		(!W6 (OBJECT1061.SK (AT-ABOUT NOW236)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 62:
	; "James is kind to Fanny."
	; "She is his little sister."
	; "He has a nice wagon."
	; "He plays horse, and gives her a ride."
(setf matches (append matches '( (5.0 0.1)
(EPI-SCHEMA ((JAMES.NAME ((ADV-A (TO.P JAMES.NAME)) GIVE.8704.V) JAMES.NAME
              WAGON1082.SK)
             ** E1087.SK)
	(:ROLES
		(!R1 (WAGON1082.SK INANIMATE_OBJECT.N))
		(!R2 (JAMES.NAME AGENT.N))
		(!R3 (WAGON1082.SK WAGON.N))
		(!R4 (WAGON1082.SK NICE.A))
		(!R5 (E285 (ORIENTS E1083.SK)))
		(!R6 (RIDE1086.SK RIDE.N))
		(!R7 (OBJECT1077.SK (PERTAIN-TO JAMES.NAME)))
		(!R8 (E287 (ORIENTS E1087.SK)))
		(!R9 (E286 (ORIENTS E1088.SK)))
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
)))
(setf matches (append matches '( (6.0 0.2)
(EPI-SCHEMA ((JAMES.NAME ((ADV-A (WITH.P WAGON1082.SK)) PLAY.8734.V)
              (K HORSE.N))
             ** E1088.SK)
	(:ROLES
		(!R1 (JAMES.NAME AGENT.N))
		(!R2 (WAGON1082.SK TOY.N))
		(!R3 (WAGON1082.SK INANIMATE_OBJECT.N))
		(!R4 ((K HORSE.N) GAME.N))
		(!R5 (WAGON1082.SK WAGON.N))
		(!R6 (WAGON1082.SK NICE.A))
		(!R7 (E285 (ORIENTS E1083.SK)))
		(!R8 (OBJECT1077.SK (PERTAIN-TO JAMES.NAME)))
		(!R9 (E286 (ORIENTS E1088.SK)))
		(!R10 (E287 (ORIENTS E1087.SK)))
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
)))
(setf matches (append matches '( (6.0 0.3)
(EPI-SCHEMA ((JAMES.NAME FEED.8764.V JAMES.NAME WAGON1082.SK) ** E1087.SK)
	(:ROLES
		(!R1 (JAMES.NAME AGENT.N))
		(!R2 (WAGON1082.SK FOOD.N))
		(!R3 (NOT (JAMES.NAME = JAMES.NAME)))
		(!R4 (NOT (JAMES.NAME = WAGON1082.SK)))
		(!R5 (WAGON1082.SK WAGON.N))
		(!R6 (WAGON1082.SK NICE.A))
		(!R7 (E285 (ORIENTS E1083.SK)))
		(!R8 (RIDE1086.SK RIDE.N))
		(!R9 (OBJECT1077.SK (PERTAIN-TO JAMES.NAME)))
		(!R10 (E287 (ORIENTS E1087.SK)))
		(!R11 (E286 (ORIENTS E1088.SK)))
	)
	(:GOALS
		(?G1 (JAMES.NAME (WANT.V (THAT (NOT (JAMES.NAME HUNGRY.A))))))
		(?G2 (JAMES.NAME (WANT.V (THAT (JAMES.NAME EAT.V WAGON1082.SK)))))
	)
	(:PRECONDS
		(E1083.SK (JAMES.NAME HAVE.V WAGON1082.SK))
		(?I2 (JAMES.NAME HUNGRY.A))
	)
	(:STEPS
		(?E1 (JAMES.NAME EAT.V WAGON1082.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (JAMES.NAME (HAVE.V WAGON1082.SK))))
		(?P2 (NOT (JAMES.NAME HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E1087.SK))
		(!W2 (E1083.SK (AT-ABOUT NOW242)))
		(!W3 (E1088.SK (CONSEC E1087.SK)))
		(!W4 (E1087.SK (AT-ABOUT NOW243)))
		(!W5 (E1088.SK (AT-ABOUT NOW243)))
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
)))
(setf matches (append matches '( (5.0 0.3)
(EPI-SCHEMA ((JAMES.NAME PLAY.8794.V WAGON1082.SK) ** E1088.SK)
	(:ROLES
		(!R1 (JAMES.NAME AGENT.N))
		(!R2 (WAGON1082.SK INANIMATE_OBJECT.N))
		(!R3 (WAGON1082.SK WAGON.N))
		(!R4 (WAGON1082.SK NICE.A))
		(!R5 (E285 (ORIENTS E1083.SK)))
		(!R6 (OBJECT1077.SK (PERTAIN-TO JAMES.NAME)))
		(!R7 (E286 (ORIENTS E1088.SK)))
		(!R8 (E287 (ORIENTS E1087.SK)))
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
)))

; found chains:
; 	chain 1:
;		((JAMES.NAME PLAY.8794.V WAGON1082.SK) ** E1088.SK)
;		((JAMES.NAME ((ADV-A (TO.P JAMES.NAME)) GIVE.8704.V) JAMES.NAME
     ;WAGON1082.SK)
    ;** E1087.SK)
;learned chain schema:
(setf chain-matches (append chain-matches (list '(EPI-SCHEMA ((?X_A
                                                               PLAY_GIVE_NIL.8854.PR
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
		(?E1 (?X_A PLAY.8794.V ?X_B))
		(?E2 (?X_A ((ADV-A (TO.P ?X_A)) GIVE.8704.V) ?X_A ?X_B))
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
; 	chain 2:
;		((JAMES.NAME PLAY.8794.V WAGON1082.SK) ** E1088.SK)
;		((JAMES.NAME FEED.8764.V JAMES.NAME WAGON1082.SK) ** E1087.SK)
;learned chain schema:
(setf chain-matches (append chain-matches (list '(EPI-SCHEMA ((?X_A
                                                               PLAY_FEED_NIL.8855.PR
                                                               ?X_A ?X_B)
                                                              ** ?E)
	(:ROLES
		(!R1 (?X_B INANIMATE_OBJECT.N))
		(!R2 (?X_B FOOD.N))
		(!R3 (?X_B WAGON.N))
		(!R4 (?X_B NICE.A))
		(!R5 (?X_A AGENT.N))
	)
	(:PRECONDS
		(?I1 (NOT (?X_B EXIST.V)))
	)
	(:STEPS
		(?E1 (?X_A PLAY.8794.V ?X_B))
		(?E2 (?X_A FEED.8764.V ?X_A ?X_B))
	)
	(:POSTCONDS
		(?P1 (NOT (?X_A (HAVE.V ?X_B))))
		(?P2 (NOT (?X_A HUNGRY.A)))
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
(setf matches (append matches '( (12.0 0.2)
(EPI-SCHEMA ((FRANK.NAME TAKE.8856.V BOAT1095.SK (AT.P-ARG (K WORK.N))) **
             E1111.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (BOAT1095.SK INANIMATE_OBJECT.N))
		(!R3 ((K WORK.N) LOCATION.N))
		(!R4 (NOT (FRANK.NAME = BOAT1095.SK)))
		(!R5 (BOAT1095.SK BOAT.N))
		(!R6 (BOAT1095.SK PRETTY.A))
		(!R7 (E288 (ORIENTS E1096.SK)))
		(!R8
   (OBJECT1110.SK
    (= (K (L #:G1490868 (AND (#:G1490868 GOOD.A) (#:G1490868 CARE.N)))))))
		(!R9 (WATER1099.SK WATER.N))
		(!R10 (OBJECT1110.SK (OF.P WATER1099.SK)))
		(!R11 (E291 (ORIENTS E1111.SK)))
		(!R12 (E1113.SK (IMPINGES-ON E1112.SK)))
		(!R13 (E292 (ORIENTS E1112.SK)))
		(!R14 (E277 (ORIENTS E1113.SK)))
		(!R15 (E293 (ORIENTS OBJECT1115.SK)))
	)
	(:GOALS
		(?G1 (FRANK.NAME (WANT.V (THAT (FRANK.NAME (HAVE.V BOAT1095.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (FRANK.NAME HAVE.V BOAT1095.SK)))
		(E1112.SK (FRANK.NAME (AT.P (K WORK.N))))
		(?I3 (BOAT1095.SK (AT.P (K WORK.N))))
	)
	(:POSTCONDS
		(E1096.SK (FRANK.NAME HAVE.V BOAT1095.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1111.SK))
		(!W2 (?I1 PRECOND-OF E1111.SK))
		(!W3 (E1112.SK PRECOND-OF E1111.SK))
		(!W4 (?I3 PRECOND-OF E1111.SK))
		(!W5 (E1096.SK POSTCOND-OF E1111.SK))
		(!W6 (E1096.SK (AT-ABOUT NOW244)))
		(!W7 (E1111.SK (AT-ABOUT NOW247)))
		(!W8 (E1112.SK (AT-ABOUT NOW248)))
		(!W9 (OBJECT1115.SK (AT-ABOUT NOW248)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 64:
	; "My mother gave me a new book."
	; "I took it to school one morning, to let the girls see the pictures."
	; "Soon after this I found my pet kitten and took her home with me."
	; "I like to play with my pet kitten."
	; "I will do as mother says."
	; "I will take good care of the kitten."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME1150.SK TAKE.9006.V OBJECT1145.SK (AT.P-ARG ?L)) ** E1149.SK)
	(:ROLES
		(!R1 (OBJECT1145.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1150.SK = OBJECT1145.SK)))
		(!R4 (ME1150.SK AGENT.N))
		(!R5
   (OBJECT1145.SK
    (= (K (L #:G1537467 (AND (#:G1537467 GOOD.A) (#:G1537467 CARE.N)))))))
		(!R6 (MOTHER1119.SK MOTHER.N))
		(!R7 (MOTHER1119.SK (PERTAIN-TO ME1150.SK)))
		(!R8 (OBJECT1145.SK (OF.P KITTEN1147.SK)))
		(!R9 (KITTEN1147.SK (PLUR KITTEN.N)))
		(!R10 (OBJECT1134.SK (PERTAIN-TO ME1150.SK)))
		(!R11 (OBJECT1139.SK (PERTAIN-TO ME1150.SK)))
		(!R12 (HOME1137.SK HOME.N))
		(!R13 (HOME1137.SK (PERTAIN-TO KITTEN1147.SK)))
		(!R14 (E301 (ORIENTS E1144.SK)))
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
)))
(setf matches (append matches '( (5.5 0.3)
(EPI-SCHEMA ((MOTHER1119.SK ((ADV-A (TO.P ME1150.SK)) GIVE.9036.V) ME1150.SK
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
		(!R11 (E273 (ORIENTS E1124.SK)))
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
)))

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

; story 66:
	; "Has Charley seen the nest in the big apple tree?"
	; "Oh, yes!"
	; "and he has seen the sweet apples, too."
	; "A big apple is on the green grass."
	; "Charley will get it for Rosy."

; story 67:
	; "This is a schoolhouse in America."
	; "We can see some boys and girls in the street."
	; "The boys and girls are going to school."
	; "Last night they studied their lessons."
	; "This is a large, fine schoolhouse; it is made of stone."

; story 68:
	; "A sail-boat is on the pond."
	; "The man holds the sail."
	; "The wind blows on the sail, and the boat moves fast."
	; "There is a row-boat too."
	; "I like a row-boat."
	; "It is fun to row."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((BOAT1262.SK
              (FAST.ADV
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) MOVE.9606.V)))
              ?L2)
             ** E1260.SK)
	(:ROLES
		(!R1 (BOAT1262.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (BOAT1262.SK BOAT.N))
		(!R6 (E326 (ORIENTS E1260.SK)))
	)
	(:GOALS
		(?G1 (BOAT1262.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BOAT1262.SK (AT.P ?L1)))
		(?I2 (NOT (BOAT1262.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (BOAT1262.SK (AT.P ?L1))))
		(?P2 (BOAT1262.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1260.SK))
		(!W2 (?I2 BEFORE E1260.SK))
		(!W3 (?P1 AFTER E1260.SK))
		(!W4 (?P2 AFTER E1260.SK))
		(!W5 (?G1 CAUSE.V E1260.SK))
		(!W6 (E1260.SK (AT-ABOUT NOW277)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 69:
	; "Here is our fine new tent."
	; "There is room for all of us."
	; "Here is a fine flag for you, boys."
	; "It is red, white and blue."
	; "We have made it for the top of your tent."
	; "We will take our flag and drum."
(setf matches (append matches '( (5.0 0.3)
(EPI-SCHEMA ((WE1289.SK ((ADV-A (FOR.P TOP1285.SK)) MAKE.9756.V) OBJECT1278.SK)
             ** E1283.SK)
	(:ROLES
		(!R1 (OBJECT1278.SK INANIMATE_OBJECT.N))
		(!R2 (OBJECT1278.SK (= (K ROOM.N))))
		(!R3 (E331 (ORIENTS E1291.SK)))
		(!R4 (WE1289.SK AGENT.N))
		(!R5 (TOP1285.SK TOP.N))
		(!R6 (OBJECT1276.SK (PERTAIN-TO WE1289.SK)))
		(!R7 (E1283.SK (IMPINGES-ON E334)))
		(!R8 (E316 (ORIENTS E1283.SK)))
		(!R9 (FLAG1288.SK FLAG.N))
		(!R10 (FLAG1288.SK (PERTAIN-TO WE1289.SK)))
		(!R11 (E334 (ORIENTS E1286.SK)))
	)
	(:GOALS
		(?G1 (WE1289.SK (WANT.V (THAT (OBJECT1278.SK EXIST.V)))))
		(?G2 (WE1289.SK (WANT.V (KA (HAVE.V OBJECT1278.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (OBJECT1278.SK EXIST.V)))
	)
	(:POSTCONDS
		(E1291.SK (OBJECT1278.SK EXIST.V))
		(?P2 (WE1289.SK (HAVE.V OBJECT1278.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1291.SK (AT-ABOUT NOW282)))
		(!W2 (E1286.SK (AT-ABOUT NOW286)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 70:
	; "This is my dog Jip."
	; "Jip is a black-and-white dog."
	; "He sits and looks at me."
	; "He has a hat on his head."
	; "Has Jip a hat?"
	; "No; he has my hat."
	; "Jip, Jip, that is my hat."
	; "Jip, give me my hat."

; story 71:
	; "Mother gave them to me."
	; "She gave them to me this morning."
	; "My father gave me two red ones."
	; "I will keep the red flower."
	; "I will give all my yellow flowers to Lucy."
	; "She will like them."
	; "She will take them home with her."
(setf matches (append matches '( (3.5 0)
(EPI-SCHEMA ((MOTHER.NAME ((ADV-A (TO.P THEY1350.SK)) GIVE.10056.V) THEY1350.SK
              ?O)
             ** E1329.SK)
	(:ROLES
		(!R1 (MOTHER.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (THEY1350.SK AGENT.N))
		(!R4 (ME1351.SK AGENT.N))
		(!R5 (E322 (ORIENTS E1329.SK)))
		(!R6 (FATHER1336.SK FATHER.N))
		(!R7 (FATHER1336.SK (PERTAIN-TO ME1351.SK)))
		(!R8 (OBJECT1344.SK (PERTAIN-TO ME1351.SK)))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MOTHER.NAME
              ((ADV-A (WITH.P MOTHER.NAME)) (HOME.ADV TAKE.10086.V))
              THEY1352.SK (AT.P-ARG ?L))
             ** E1349.SK)
	(:ROLES
		(!R1 (MOTHER.NAME AGENT.N))
		(!R2 (THEY1352.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MOTHER.NAME = THEY1352.SK)))
		(!R5 (THEY1352.SK AGENT.N))
		(!R6 (E353 (ORIENTS E1348.SK)))
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
)))
(setf matches (append matches '( (7.0 0.2)
(EPI-SCHEMA ((MOTHER.NAME ((ADV-A (TO.P ME1351.SK)) FEED.10116.V) THEY1350.SK
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
		(!R8 (E322 (ORIENTS E1329.SK)))
		(!R9 (FATHER1336.SK FATHER.N))
		(!R10 (FATHER1336.SK (PERTAIN-TO ME1351.SK)))
		(!R11 (OBJECT1344.SK (PERTAIN-TO ME1351.SK)))
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
)))

; found chains:
; 	chain 0:
;		((MOTHER.NAME ((ADV-A (TO.P THEY1350.SK)) GIVE.10056.V) THEY1350.SK
     ;THEY1352.SK)
    ;** E1329.SK)
;		((MOTHER.NAME ((ADV-A (WITH.P MOTHER.NAME)) (HOME.ADV TAKE.10086.V))
     ;THEY1352.SK (AT.P-ARG ?L))
    ;** E1349.SK)
;learned chain schema:
(setf chain-matches (append chain-matches (list '(EPI-SCHEMA ((?X_B
                                                               GIVE_TAKE_NIL.10206.PR
                                                               ?X_A ?X_C)
                                                              ** ?E)
	(:ROLES
		(!R1 (?X_C INANIMATE_OBJECT.N))
		(!R2 (NOT (?X_B = ?X_C)))
		(!R3 (?L LOCATION.N))
	)
	(:PRECONDS
		(?I1 (?X_B HAVE.V ?X_C))
		(?I2 (NOT (?X_A HAVE.V ?X_C)))
	)
	(:STEPS
		(?E1 (?X_B ((ADV-A (TO.P ?X_A)) GIVE.10056.V) ?X_A ?X_C))
		(?E2
   (?X_B ((ADV-A (WITH.P ?X_B)) (HOME.ADV TAKE.10086.V)) ?X_C (AT.P-ARG ?L)))
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
;		((MOTHER.NAME ((ADV-A (TO.P ME1351.SK)) FEED.10116.V) THEY1350.SK
    ; THEY1352.SK)
   ; ** E1329.SK)
;		((MOTHER.NAME ((ADV-A (WITH.P MOTHER.NAME)) (HOME.ADV TAKE.10086.V))
    ; THEY1352.SK (AT.P-ARG ?L))
   ; ** E1349.SK)
;learned chain schema:
(setf chain-matches (append chain-matches (list '(EPI-SCHEMA ((?X_C
                                                               FEED_TAKE_NIL.10207.PR
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
		(?E1 (?X_C ((ADV-A (TO.P ?X_A)) FEED.10116.V) ?X_B ?X_D))
		(?E2
   (?X_C ((ADV-A (WITH.P ?X_C)) (HOME.ADV TAKE.10086.V)) ?X_D (AT.P-ARG ?L)))
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

; story 73:
	; "The sun has set, and the pond is still."
	; "John, Ned, Ben, Tom, and Nell stand on the bank, and look at the duck."
	; "The dog with a black spot on his back, is with Tom."
	; "See!"
	; "Tom has his hat in his hand."
	; "He has left his big top on the box."

; story 74:
	; "Here is May with her kitten."
	; "Her mother gave the kitten to her."
	; "She is kind to the pretty kitten."
	; "She likes to see it jump and play."
	; "See it run with May's ball!"
	; "It does not run far with it."
	; "If May can get the ball she will not take it."
	; "She will give it to the kitten to play with."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((KITTENS1402.SK ((ADV-A (TO.P KITTENS1402.SK)) GIVE.10538.V)
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
		(!R14 (E357 (ORIENTS E1407.SK)))
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
)))
(setf matches (append matches '( (6.0 0.2)
(EPI-SCHEMA ((KITTENS1402.SK ((ADV-A (TO.P MAY.NAME)) FEED.10598.V)
              KITTENS1402.SK ?F)
             ** E1403.SK)
	(:ROLES
		(!R1 (KITTENS1402.SK AGENT.N))
		(!R2 (?F FOOD.N))
		(!R3 (NOT (KITTENS1402.SK = KITTENS1402.SK)))
		(!R4 (NOT (KITTENS1402.SK = ?F)))
		(!R5 (KITTENS1402.SK (PLUR KITTEN.N)))
		(!R6 (KITTENS1402.SK MOTHER.N))
		(!R7 (KITTENS1402.SK PRETTY.A))
		(!R8 (KITTENS1402.SK KITTEN.N))
		(!R9 (KITTENS1402.SK (PERTAIN-TO MAY.NAME)))
		(!R10 (MAY.NAME BALL.N))
		(!R11 (MAY.NAME (PERTAIN-TO MAY.NAME)))
		(!R12 (E1403.SK (RIGHT-AFTER U315)))
		(!R13 (OBJECT1409.SK (= (K KIND.N))))
		(!R14 (OBJECT1409.SK (TO.P KITTENS1402.SK)))
		(!R15 (OBJECT1421.SK (= KITTENS1402.SK)))
		(!R16 (E357 (ORIENTS E1407.SK)))
	)
	(:GOALS
		(?G1 (KITTENS1402.SK (WANT.V (THAT (NOT (KITTENS1402.SK HUNGRY.A))))))
		(?G2 (KITTENS1402.SK (WANT.V (THAT (KITTENS1402.SK EAT.V ?F)))))
	)
	(:PRECONDS
		(?I1 (KITTENS1402.SK HAVE.V ?F))
		(?I2 (KITTENS1402.SK HUNGRY.A))
	)
	(:STEPS
		(?E1 (KITTENS1402.SK EAT.V ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (KITTENS1402.SK (HAVE.V ?F))))
		(?P2 (NOT (KITTENS1402.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E1403.SK))
		(!W2 (E1403.SK (SAME-TIME NOW316)))
		(!W3 (E1407.SK (BEFORE NOW316)))
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
)))
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((SHE.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.10628.V
              (KA (TAKE.V IT.PRO)))
             ** ?E)
	(:ROLES
		(!R1 ((KA (TAKE.V IT.PRO)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (SHE.PRO FEMALE.A))
		(!R4 (SHE.PRO AGENT.N))
		(!R5 (E372 (ORIENTS E1418.SK)))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (NOT (SHE.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (SHE.PRO (DO.V (KA (TAKE.V IT.PRO))))) CAUSE.V
    (KE (SHE.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1419.SK (NOT (SHE.PRO (DO.V (KA (TAKE.V IT.PRO))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E1419.SK))
		(!W2 (E1419.SK (AFTER E1418.SK)))
		(!W3 (E1418.SK (AT-ABOUT NOW321)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 75:
	; "Will you let me ride home with you, Frank?"
	; "Yes, May, you may sit by me in the wagon if you like."
	; "Get in, and give me the whip."
	; "I will not whip the good horse."
	; "Now, here we go!"
	; "Here is the apple tree, but we can not see the nest in it."

; story 76:
	; "See Baby try to catch the hoop!"
	; "Baby can not catch it."
	; "The hoop rolls away from Baby."
	; "Look, Baby!"
	; "See the hoop roll!"
	; "Hear the bells, Baby!"
	; "The bells say, Tinkle, tinkle, tinkle."

; story 77:
	; "Is this May?"
	; "No; this is Ada."
	; "May is not here."
	; "Ada is sitting in May's chair."
	; "She is looking at a fan which lies on a box."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((ADA.NAME
              ((ADV-A (ON.P CHAIR1464.SK))
               ((ADV-A (IN.P CHAIR1464.SK)) SIT.10868.V)))
             ** E1462.SK)
	(:ROLES
		(!R1 (ADA.NAME AGENT.N))
		(!R2 (CHAIR1464.SK INANIMATE_OBJECT.N))
		(!R3 (CHAIR1464.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (CHAIR1464.SK CHAIR.N))
		(!R6 (CHAIR1464.SK (PERTAIN-TO MAY.NAME)))
		(!R7 (E389 (ORIENTS E1462.SK)))
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
)))

; story 78:
	; "Here is a fisherman."
	; "He is ready to put his net into the water."
	; "He stands on two long poles over the water."
	; "He has a basket for his fish."
	; "His net is larger than Simeon's net."
	; "The men in the boats use a larger net than this."

; story 79:
	; "These boys are Ned and Roy."
	; "The large boy is Roy."
	; "The boy who has a bun is Ned."
	; "The boys are sitting on the floor."
	; "Roy's dog, Carlo, lies near Ned."
	; "Is he lying near Roy?"
	; "Ned and Roy are good boys."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((BOYS1504.SK
              ((ADV-A (ON.P FLOOR1515.SK))
               ((ADV-A (IN.P FLOOR1515.SK)) SIT.11198.V)))
             ** E1513.SK)
	(:ROLES
		(!R1 (BOYS1504.SK AGENT.N))
		(!R2 (FLOOR1515.SK INANIMATE_OBJECT.N))
		(!R3 (FLOOR1515.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (BOYS1504.SK (PLUR BOY.N)))
		(!R6 (FLOOR1515.SK FLOOR.N))
		(!R7 (BOYS1504.SK (ATTENDED-TO-BY*.A SPEAKER)))
		(!R8 (E403 (ORIENTS E1513.SK)))
	)
	(:GOALS
		(?G1 (BOYS1504.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (BOYS1504.SK (AT.P ?L)))
		(?I2 (FLOOR1515.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1513.SK (AT-ABOUT NOW350)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 80:
	; "Did the boys swing their hats and cheer?"
	; "This morning there were many boys and girls on the hill."
	; "They had their sleds with them."
	; "The snow on the hill was just right, and they had fine sport."
	; "How the boys did swing their hats and cheer!"
	; "They did this when the little girls were ahead."
	; "When the boys were ahead, the girls said,— Ho, ho!"
	; "There they go; Over the ice and over the snow."

; story 81:
	; "The man has a little dog."
	; "The boy has a big dog."
	; "See the little dog run!"
	; "He has my ball."
	; "The little dog may have the ball."
	; "He may run and play with it."
	; "She can not take it."

; story 82:
	; "These men fish in the sea."
	; "They have a large net."
	; "They carry the net in a boat and drip it into the water."
	; "Soon they pull it to the shore."
	; "Sometimes they find many fish in it."
	; "The women put the fish in the basket and take them home."
	; "Pedro and Simeon like to watch the men in the boats and help pull in the net."

; story 83:
	; "The boy can run and play."
	; "The boy can play ball."
	; "The man may see the boy play."
	; "The boy may take the ball."
	; "The baby has a big doll."
	; "The little girl has a ball."
	; "I can see the baby."
	; "The baby may have my ball."

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
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((FRANK.NAME
              ((ADV-A (INTO.P SNOW1660.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.12038.V)))
              ?L2)
             ** E1662.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (SNOW1660.SK SNOW.N))
		(!R6 (OBJECT1658.SK (PERTAIN-TO FRANK.NAME)))
		(!R7 (E415 (ORIENTS E1657.SK)))
		(!R8 (E1663.SK (AT-OR-BEFORE NOW387)))
		(!R9 (E416 (ORIENTS E1663.SK)))
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
		(!W5 (?G1 CAUSE.V E1662.SK))
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
)))

; story 85:
	; "Ned has a nice boat on the pond."
	; "He can row the boat."
	; "Ned has an oar in his right hand, and an oar in his left hand."
	; "He can row with two oars."
	; "I can row a boat."
	; "I can row with two oars."
	; "No one is in the boat with Ned."
	; "He must take care not to fall out."

; story 86:
	; "Yes, Fred, I see it."
	; "Can you see eggs in the nest?"
	; "Yes, Rosy, I can."
	; "Oh, Fred, can I get a peep at them?"
	; "I will get the nest, Rosy, and let you see it."
	; "No!"
	; "no!"
	; "I beg you not to get it."

; story 87:
	; "The cherry is red."
	; "The buttercup is yellow."
	; "I can paint a buttercup or a cherry."
	; "The buttercup is a flower, but the cherry is a fruit."
	; "The color of the orange is not red and it is not yellow."
	; "We call this color orange."
	; "I can make orange."
	; "Red and yellow make orange."

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
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((SHE.PRO GET.12762.V BALL1776.SK (AT.P-ARG ?L)) ** E1777.SK)
	(:ROLES
		(!R1 (BALL1776.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (SHE.PRO = BALL1776.SK)))
		(!R4 (SHE.PRO FEMALE.A))
		(!R5 (SHE.PRO AGENT.N))
		(!R6 (BALL1776.SK BALL.N))
		(!R7 (E483 (ORIENTS E1775.SK)))
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
)))

; story 89:
	; "There are fish in their pond."
	; "They are very nice fish."
	; "We will come and catch them."
	; "We will take the long rod, and the hook and line."
	; "We must have a bag, too."
	; "It must be strong, to keep the fish safe."

; story 90:
	; "I see May and her dolls."
	; "May is in her little chair."
	; "She has a doll in her lap."
	; "One doll is sitting on a bed."
	; "The doll on the bed is wax."
	; "The doll in her lap is not wax."
	; "May's dolls have blue eyes."
	; "Has May blue eyes?"
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((DOLL1806.SK
              ((ADV-A (ON.P BED1807.SK))
               ((ADV-A (IN.P BED1807.SK)) SIT.13058.V)))
             ** E1805.SK)
	(:ROLES
		(!R1 (DOLL1806.SK AGENT.N))
		(!R2 (BED1807.SK INANIMATE_OBJECT.N))
		(!R3 (BED1807.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (BED1807.SK BED.N))
		(!R6 (DOLL1806.SK DOLL.N))
		(!R7 (E492 (ORIENTS E1805.SK)))
		(!R8 (T1809.SK DOLL.N))
		(!R9 (T1809.SK (ON.P BED1807.SK)))
	)
	(:GOALS
		(?G1 (DOLL1806.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (DOLL1806.SK (AT.P ?L)))
		(?I2 (BED1807.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1805.SK (AT-ABOUT NOW436)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 91:
	; "It is night."
	; "The moon and stars are shining."
	; "I see many stars."
	; "At night the boys and girls are asleep."
	; "In the day they play or work."
	; "When night comes they are very tired."

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

; story 93:
	; "Do you see that tree on the hill?"
	; "Well, a nest is in that tree."
	; "Charley, Fred and I went to see the nest."
	; "It had eggs in it."
	; "Charley went up the tree and got the nest for us to see."
	; "As he held it in his hand, an egg fell on the grass."
	; "Was not that too bad?"

; story 94:
	; "Nell has a new sled."
	; "Nell says, I must take baby May for a ride, then I must go to school."
	; "Here you can see Nell with baby May on the sled."
	; "Baby likes to ride on the new sled."
	; "She likes to play in the white snow."
	; "If Nell runs too fast, May calls, Stop, stop!"
	; "Baby can not tell Nell that she is going too fast."
	; "Soon baby May can say, too fast!"

; story 95:
	; "See!"
	; "John is rolling the ball to Tyke."
	; "Run!"
	; "Tyke!"
	; "Get the ball."
	; "Good dog!"
	; "Take the ball to John."

; story 96:
	; "Frank and little May are in the field with the wagon."
	; "They have come to find flowers."
	; "May has a red flower."
	; "Frank has three yellow flowers."
	; "He will let May have them."
	; "She will take them to the wagon."
	; "She is glad to get the pretty flowers."
(setf matches (append matches '( (10.0 0.4)
(EPI-SCHEMA (((SET-OF FRANK.NAME X) ((ADV-A (TO.P WAGON1941.SK)) TAKE.14048.V)
              THEY1957.SK (AT.P-ARG FIELD1940.SK))
             ** E1952.SK)
	(:ROLES
		(!R1 ((SET-OF FRANK.NAME X) AGENT.N))
		(!R2 (THEY1957.SK INANIMATE_OBJECT.N))
		(!R3 (FIELD1940.SK LOCATION.N))
		(!R4 (NOT ((SET-OF FRANK.NAME X) = THEY1957.SK)))
		(!R5 (WAGON1941.SK WAGON.N))
		(!R6 (THEY1957.SK AGENT.N))
		(!R7 (E544 (ORIENTS E1950.SK)))
		(!R8 (FIELD1940.SK FIELD.N))
	)
	(:GOALS
		(?G1
   ((SET-OF FRANK.NAME X)
    (WANT.V (THAT ((SET-OF FRANK.NAME X) (HAVE.V THEY1957.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT ((SET-OF FRANK.NAME X) HAVE.V THEY1957.SK)))
		(?I2 ((SET-OF FRANK.NAME X) (AT.P FIELD1940.SK)))
		(?I3 (THEY1957.SK (AT.P FIELD1940.SK)))
	)
	(:POSTCONDS
		(?P1 ((SET-OF FRANK.NAME X) HAVE.V THEY1957.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1952.SK))
		(!W2 (?I1 PRECOND-OF E1952.SK))
		(!W3 (?I2 PRECOND-OF E1952.SK))
		(!W4 (?I3 PRECOND-OF E1952.SK))
		(!W5 (?P1 POSTCOND-OF E1952.SK))
		(!W6 (E1952.SK (AFTER E1950.SK)))
		(!W7 (E1950.SK (AT-ABOUT NOW485)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (10.0 0.1)
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N))))))
               ((ADV-A (TO.P ?L2))
                ((ADV-A (FROM.P FIELD1940.SK)) COME.14078.V)))
              ?L2)
             ** E1942.SK)
	(:ROLES
		(!R1 (MAY.NAME AGENT.N))
		(!R2 (FIELD1940.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (FIELD1940.SK = ?L2)))
		(!R5 (E514 (ORIENTS E1942.SK)))
		(!R6 (E1942.SK (IMPINGES-ON E539)))
		(!R7 (E539 (ORIENTS OBJECT1943.SK)))
		(!R8 (FIELD1940.SK FIELD.N))
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
		(!W5 (?G1 CAUSE.V E1942.SK))
		(!W6 (OBJECT1943.SK (AT-ABOUT NOW482)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 97:
	; "Frank and little May are in the field with the wagon."
	; "They have come to find flowers."
	; "May has a red flower."
	; "Frank has three yellow flowers."
	; "He will let May have them."
	; "She will take them to the wagon."
	; "She is glad to get the pretty flowers."
(setf matches (append matches '( (10.0 0.4)
(EPI-SCHEMA (((SET-OF FRANK.NAME X) ((ADV-A (TO.P WAGON1960.SK)) TAKE.14198.V)
              THEY1976.SK (AT.P-ARG FIELD1959.SK))
             ** E1971.SK)
	(:ROLES
		(!R1 ((SET-OF FRANK.NAME X) AGENT.N))
		(!R2 (THEY1976.SK INANIMATE_OBJECT.N))
		(!R3 (FIELD1959.SK LOCATION.N))
		(!R4 (NOT ((SET-OF FRANK.NAME X) = THEY1976.SK)))
		(!R5 (WAGON1960.SK WAGON.N))
		(!R6 (THEY1976.SK AGENT.N))
		(!R7 (E552 (ORIENTS E1969.SK)))
		(!R8 (FIELD1959.SK FIELD.N))
	)
	(:GOALS
		(?G1
   ((SET-OF FRANK.NAME X)
    (WANT.V (THAT ((SET-OF FRANK.NAME X) (HAVE.V THEY1976.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT ((SET-OF FRANK.NAME X) HAVE.V THEY1976.SK)))
		(?I2 ((SET-OF FRANK.NAME X) (AT.P FIELD1959.SK)))
		(?I3 (THEY1976.SK (AT.P FIELD1959.SK)))
	)
	(:POSTCONDS
		(?P1 ((SET-OF FRANK.NAME X) HAVE.V THEY1976.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1971.SK))
		(!W2 (?I1 PRECOND-OF E1971.SK))
		(!W3 (?I2 PRECOND-OF E1971.SK))
		(!W4 (?I3 PRECOND-OF E1971.SK))
		(!W5 (?P1 POSTCOND-OF E1971.SK))
		(!W6 (E1971.SK (AFTER E1969.SK)))
		(!W7 (E1969.SK (AT-ABOUT NOW492)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (10.0 0.1)
(EPI-SCHEMA ((MAY.NAME
              ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N))))))
               ((ADV-A (TO.P ?L2))
                ((ADV-A (FROM.P FIELD1959.SK)) COME.14228.V)))
              ?L2)
             ** E1961.SK)
	(:ROLES
		(!R1 (MAY.NAME AGENT.N))
		(!R2 (FIELD1959.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (FIELD1959.SK = ?L2)))
		(!R5 (E540 (ORIENTS E1961.SK)))
		(!R6 (E1961.SK (IMPINGES-ON E547)))
		(!R7 (E547 (ORIENTS OBJECT1962.SK)))
		(!R8 (FIELD1959.SK FIELD.N))
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
		(!W5 (?G1 CAUSE.V E1961.SK))
		(!W6 (OBJECT1962.SK (AT-ABOUT NOW489)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 98:
	; "Here is a large tree."
	; "The leaves grow on the branches of the tree."
	; "The branches grow from the trunk of the tree."
	; "What is the trunk of the tree?"
	; "The large part of the tree is called the trunk."
	; "Do you know what the roots are?"
	; "The roots grow in the ground."
	; "They get water and food for the tree from the ground."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((BRANCH1983.SK GET.14348.V (SET-OF (K WATER.N) OBJECT2011.SK)
              (AT.P-ARG ?L))
             ** E2014.SK)
	(:ROLES
		(!R1 (BRANCH1983.SK AGENT.N))
		(!R2 ((SET-OF (K WATER.N) OBJECT2011.SK) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (BRANCH1983.SK = (SET-OF (K WATER.N) OBJECT2011.SK))))
		(!R5 (BRANCH1983.SK (PLUR BRANCH.N)))
		(!R6 (BRANCH1983.SK TRUNK.N))
		(!R7 (OBJECT2011.SK (= (K FOOD.N))))
		(!R8 (TREE1978.SK LARGE.A))
		(!R9 (BRANCH1983.SK (OF.P TREE1978.SK)))
		(!R10 (TREE1978.SK TREE.N))
		(!R11 (E561 (ORIENTS E2014.SK)))
		(!R12 (T1999.SK (OF.P TREE1978.SK)))
		(!R13 (T1999.SK LARGE.A))
		(!R14 (T1999.SK PART.N))
	)
	(:GOALS
		(?G1
   (BRANCH1983.SK
    (WANT.V
     (THAT (BRANCH1983.SK (HAVE.V (SET-OF (K WATER.N) OBJECT2011.SK)))))))
	)
	(:PRECONDS
		(?I1 (NOT (BRANCH1983.SK HAVE.V (SET-OF (K WATER.N) OBJECT2011.SK))))
		(?I2 (BRANCH1983.SK (AT.P ?L)))
		(?I3 ((SET-OF (K WATER.N) OBJECT2011.SK) (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (BRANCH1983.SK HAVE.V (SET-OF (K WATER.N) OBJECT2011.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E2014.SK))
		(!W2 (?I1 PRECOND-OF E2014.SK))
		(!W3 (?I2 PRECOND-OF E2014.SK))
		(!W4 (?I3 PRECOND-OF E2014.SK))
		(!W5 (?P1 POSTCOND-OF E2014.SK))
		(!W6 (E2014.SK (AT-ABOUT NOW501)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 99:
	; "The boys and girls are having fine sport."
	; "The snow on the hill is just right, and their sleds run well."
	; "O, look at them!"
	; "Elsie and Roy are ahead."
	; "Ho, ho!"
	; "There they go; Over the ice and over the snow."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((SLEDS2021.SK
              (WELL.ADV
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.14408.V)))
              ?L2)
             ** E2019.SK)
	(:ROLES
		(!R1 (SLEDS2021.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (SLEDS2021.SK (PLUR SLED.N)))
		(!R6 (E569 (ORIENTS E2019.SK)))
		(!R7 (SLEDS2021.SK (PERTAIN-TO THEY2028.SK)))
		(!R8 (THEY2028.SK AGENT.N))
		(!R9 (E567 (ORIENTS E2029.SK)))
	)
	(:GOALS
		(?G1 (SLEDS2021.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (SLEDS2021.SK (AT.P ?L1)))
		(?I2 (NOT (SLEDS2021.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (SLEDS2021.SK (AT.P ?L1))))
		(?P2 (SLEDS2021.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E2019.SK))
		(!W2 (?I2 BEFORE E2019.SK))
		(!W3 (?P1 AFTER E2019.SK))
		(!W4 (?P2 AFTER E2019.SK))
		(!W5 (?G1 CAUSE.V E2019.SK))
		(!W6 (E2019.SK (AT-ABOUT NOW503)))
		(!W7 (E2029.SK (AT-ABOUT NOW503)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; (setf matches (list))
; (setf chain-matches (list))
; story 0:
	; "Three birds are in the tree."
	; "One is a pretty red bird."
	; "You can not catch it."
	; "It is high in the tree."
	; "The red bird can see the boys with the drum."
	; "It can see the little girl with the red dress."
	; "It can see the good baby and the pretty doll."
	; "It can see the man in the field."

; story 1:
	; "I see a man and a dog and a cow."
	; "The cow is with the man."
	; "The dog has a big hat."
	; "He is a good little dog."
	; "He may take the hat to the man."
	; "The man is good to the dog."
	; "The cow can run."
	; "She can not play."

; story 2:
	; "Koy is teaching Carlo to beg."
	; "He stands and says, Beg, Carlo, beg."
	; "It is a bun."
	; "Beg, and you may have it."
	; "Carlo stands on his hind feet."
	; "He looks at the bun which Roy has in his hand and says, Bowwow, bow-wow."
	; "Ned sits and looks at Carlo."
	; "Roy will give the bun to Carlo."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((NED.NAME ((ADV-A (ON.P ?S)) ((ADV-A (IN.P ?S)) SIT.301.V))) **
             E120.SK)
	(:ROLES
		(!R1 (NED.NAME AGENT.N))
		(!R2 (?S INANIMATE_OBJECT.N))
		(!R3 (?S FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (E26 (ORIENTS E120.SK)))
		(!R6 (E27 (ORIENTS E119.SK)))
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
)))
(setf matches (append matches '( (3.5 0)
(EPI-SCHEMA ((ROY.NAME ((ADV-A (TO.P BUN122.SK)) GIVE.331.V) BUN122.SK ?O) **
             E123.SK)
	(:ROLES
		(!R1 (ROY.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (BUN122.SK AGENT.N))
		(!R4 (BUN122.SK BUN.N))
		(!R5 (E28 (ORIENTS E121.SK)))
	)
	(:GOALS
		(?G1 (ROY.NAME (WANT.V (THAT (BUN122.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (ROY.NAME HAVE.V ?O))
		(?I2 (NOT (BUN122.SK HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (ROY.NAME HAVE.V ?O)))
		(?P2 (BUN122.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E123.SK (AFTER E121.SK)))
		(!W2 (E121.SK (AT-ABOUT NOW23)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (7.0 0.2)
(EPI-SCHEMA ((ROY.NAME ((ADV-A (TO.P KOY.NAME)) FEED.391.V) BUN122.SK ?F) **
             E123.SK)
	(:ROLES
		(!R1 (ROY.NAME AGENT.N))
		(!R2 (BUN122.SK AGENT.N))
		(!R3 (?F FOOD.N))
		(!R4 (NOT (ROY.NAME = BUN122.SK)))
		(!R5 (NOT (BUN122.SK = ?F)))
		(!R6 (NOT (ROY.NAME = ?F)))
		(!R7 (BUN122.SK BUN.N))
		(!R8 (E28 (ORIENTS E121.SK)))
	)
	(:GOALS
		(?G1 (ROY.NAME (WANT.V (THAT (NOT (BUN122.SK HUNGRY.A))))))
		(?G2 (ROY.NAME (WANT.V (THAT (BUN122.SK EAT.V ?F)))))
	)
	(:PRECONDS
		(?I1 (ROY.NAME HAVE.V ?F))
		(?I2 (BUN122.SK HUNGRY.A))
	)
	(:STEPS
		(?E1 (BUN122.SK EAT.V ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (ROY.NAME (HAVE.V ?F))))
		(?P2 (NOT (BUN122.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E123.SK))
		(!W2 (E123.SK (AFTER E121.SK)))
		(!W3 (E121.SK (AT-ABOUT NOW23)))
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
)))

; story 3:
	; "The man is showing the horse."
	; "He holds the horse's foot."
	; "The shoes are made of iron."
	; "The man nails them on to the horse's hoofs."
	; "It does not hurt the horse."
	; "His hoofs are hard."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((SHOE143.SK (BE.PASV ((ADV-A (OF.P (K IRON.N))) MAKE.422.V)) ?O)
             ** E141.SK)
	(:ROLES
		(!R1 (SHOE143.SK AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (SHOE143.SK (PLUR SHOE.N)))
		(!R4 (E31 (ORIENTS E141.SK)))
	)
	(:GOALS
		(?G1 (SHOE143.SK (WANT.V (THAT (?O EXIST.V)))))
		(?G2 (SHOE143.SK (WANT.V (KA (HAVE.V ?O)))))
	)
	(:PRECONDS
		(?I1 (NOT (?O EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (?O EXIST.V))
		(?P2 (SHOE143.SK (HAVE.V ?O)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E141.SK (AT-ABOUT NOW26)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((IT156.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.451.V
              (KA (HURT.V HORSE151.SK)))
             ** ?E)
	(:ROLES
		(!R1 (IT156.SK AGENT.N))
		(!R2 ((KA (HURT.V HORSE151.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (HORSE151.SK HORSE.N))
		(!R5 (E33 (ORIENTS E152.SK)))
	)
	(:GOALS
		(?G1 (IT156.SK (WANT.V (THAT (NOT (IT156.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (IT156.SK (DO.V (KA (HURT.V HORSE151.SK))))) CAUSE.V
    (KE (IT156.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E152.SK (NOT (IT156.SK (DO.V (KA (HURT.V HORSE151.SK))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E152.SK))
		(!W2 (E152.SK (AT-ABOUT NOW28)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 4:
	; "Hal has a red drum."
	; "The drum is yellow."
	; "Ned has a gun."
	; "Max has a big flag."
	; "It is red white and blue."
	; "All three boys have caps."

; story 5:
	; "I can see a bird on the tree."
	; "It has two legs."
	; "It has a small bill, and a long tail."
	; "It has wings, and can fly."
	; "It can fly over a tall tree."
	; "It can fly so high that we can not see it."
	; "It's nest is up in the tree."
	; "It will sing."

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
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((BOY233.SK
              ((ADV-A (IN.P WAGON231.SK))
               ((ADV-A HOME.N)
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RIDE.931.V))))
              ?L2)
             ** E256.SK)
	(:ROLES
		(!R1 (BOY233.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (WAGON231.SK WAGON.N))
		(!R6 (BOY233.SK BOY.N))
		(!R7 (E61 (ORIENTS E252.SK)))
	)
	(:GOALS
		(?G1 (BOY233.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BOY233.SK (AT.P ?L1)))
		(?I2 (NOT (BOY233.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (BOY233.SK (AT.P ?L1))))
		(?P2 (BOY233.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E256.SK))
		(!W2 (?I2 BEFORE E256.SK))
		(!W3 (?P1 AFTER E256.SK))
		(!W4 (?P2 AFTER E256.SK))
		(!W5 (?G1 CAUSE.V E256.SK))
		(!W6 (E256.SK (AFTER E252.SK)))
		(!W7 (E252.SK (AT-ABOUT NOW52)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((BOY233.SK
              ((ADV-A HOME.N)
               ((ADV-A (IN.P WAGON231.SK))
                ((ADV-A (ON.P WAGON231.SK)) RIDE.1051.V))))
             ** E256.SK)
	(:ROLES
		(!R1 (BOY233.SK AGENT.N))
		(!R2 (WAGON231.SK INANIMATE_OBJECT.N))
		(!R3 (WAGON231.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (WAGON231.SK WAGON.N))
		(!R6 (BOY233.SK BOY.N))
		(!R7 (E61 (ORIENTS E252.SK)))
	)
	(:GOALS
		(?G1 (BOY233.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (BOY233.SK (AT.P ?L)))
		(?I2 (WAGON231.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E256.SK (AFTER E252.SK)))
		(!W2 (E252.SK (AT-ABOUT NOW52)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

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
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((BOY270.SK
              ((ADV-A (IN.P WAGON268.SK))
               ((ADV-A HOME.N)
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RIDE.1081.V))))
              ?L2)
             ** E296.SK)
	(:ROLES
		(!R1 (BOY270.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (WAGON268.SK WAGON.N))
		(!R6 (BOY270.SK BOY.N))
		(!R7 (E70 (ORIENTS E294.SK)))
	)
	(:GOALS
		(?G1 (BOY270.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BOY270.SK (AT.P ?L1)))
		(?I2 (NOT (BOY270.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (BOY270.SK (AT.P ?L1))))
		(?P2 (BOY270.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E296.SK))
		(!W2 (?I2 BEFORE E296.SK))
		(!W3 (?P1 AFTER E296.SK))
		(!W4 (?P2 AFTER E296.SK))
		(!W5 (?G1 CAUSE.V E296.SK))
		(!W6 (E296.SK (AFTER E294.SK)))
		(!W7 (E294.SK (AT-ABOUT NOW61)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((BOY270.SK
              ((ADV-A HOME.N)
               ((ADV-A (IN.P WAGON268.SK))
                ((ADV-A (ON.P WAGON268.SK)) RIDE.1201.V))))
             ** E296.SK)
	(:ROLES
		(!R1 (BOY270.SK AGENT.N))
		(!R2 (WAGON268.SK INANIMATE_OBJECT.N))
		(!R3 (WAGON268.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (WAGON268.SK WAGON.N))
		(!R6 (BOY270.SK BOY.N))
		(!R7 (E70 (ORIENTS E294.SK)))
	)
	(:GOALS
		(?G1 (BOY270.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (BOY270.SK (AT.P ?L)))
		(?I2 (WAGON268.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E296.SK (AFTER E294.SK)))
		(!W2 (E294.SK (AT-ABOUT NOW61)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 8:
	; "My horse is strong and kind."
	; "He will let me ride on his back."
	; "He draws me in a wagon."
	; "He can trot, and run."
	; "He can run as fast as Tom's horse."
	; "I call him Dan."
	; "He will come if I call him."
	; "He will eat from my hand."
(setf matches (append matches '( (7.0 0.2)
(EPI-SCHEMA ((HE.PRO ((ADV-A (FROM.P HAND333.SK)) EAT.1231.V) ?F) ** E335.SK)
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
		(!R10 (E80 (ORIENTS E331.SK)))
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
		(!W3 (E335.SK CAUSE.V ?P1))
		(!W4 (E335.SK (AFTER E331.SK)))
		(!W5 (E331.SK (AT-ABOUT NOW69)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (4.0 0.2)
(EPI-SCHEMA ((HORSE322.SK FEED.1261.V HE.PRO ?F) ** ?E)
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
		(!R14 (E80 (ORIENTS E331.SK)))
		(!R15 (HORSE322.SK HORSE.N))
		(!R16 (HORSE322.SK (PERTAIN-TO TOM.NAME)))
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
)))

; story 9:
	; "An old hen sat on eight eggs."
	; "Soon she had in her nest six little chickens and two ducks."
	; "Every day the hen took them into the yard."
	; "She was very proud of them."
	; "She scratched the ground and found worms for them to eat."
	; "Every night she took them back to the nest.They slept all night under her wings."

; story 10:
	; "This is little Lucy."
	; "Her home is far away."
	; "She has come to see  Frank and May."
	; "All the little girls love Lucy."
	; "They are kind and good to her, and she loves them."
	; "Frank will let her ride with him in the big wagon."
	; "He will give her the whip, and the horse will go fast."
	; "The horse will go fast and far, but he will not run away."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((SHE383.SK
              ((ADV-A (FOR.P (KA (SEE.V (SET-OF FRANK.NAME MAY.NAME)))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.1531.V)))
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
		(!R8 (E91 (ORIENTS E354.SK)))
		(!R9 (E46 (ORIENTS E357.SK)))
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
		(!W5 (?G1 CAUSE.V E354.SK))
		(!W6 (E354.SK (AT-ABOUT NOW78)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (5.5 0.3)
(EPI-SCHEMA ((FRANK.NAME ((ADV-A (TO.P SHE383.SK)) GIVE.1561.V) SHE383.SK
              WHIP376.SK)
             ** E378.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (WHIP376.SK INANIMATE_OBJECT.N))
		(!R3 (SHE383.SK AGENT.N))
		(!R4 (WHIP376.SK WHIP.N))
		(!R5 (HOME350.SK HOME.N))
		(!R6 (HOME350.SK (PERTAIN-TO SHE383.SK)))
		(!R7 (E97 (ORIENTS E375.SK)))
		(!R8 (E98 (ORIENTS E374.SK)))
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
)))

; story 11:
	; "What is in this monkey's hands?"
	; "The monkey has a cocoanut."
	; "He likes the cocoanut."
	; "He will eat it."
	; "The monkey is brown."
	; "It has a large tail."
	; "His eyes are large."
(setf matches (append matches '( (8.0 0.3)
(EPI-SCHEMA ((HE.PRO EAT.1682.V IT.PRO) ** E399.SK)
	(:ROLES
		(!R1 (IT.PRO FOOD.N))
		(!R2 (HE.PRO MALE.A))
		(!R3 (HE.PRO AGENT.N))
		(!R4 (EYE422.SK (PLUR EYE.N)))
		(!R5 (EYE422.SK (PERTAIN-TO HE.PRO)))
		(!R6 (E104 (ORIENTS E398.SK)))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (NOT (HE.PRO HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 (HE.PRO HAVE.V IT.PRO))
		(?I2 (HE.PRO HUNGRY.A))
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (HAVE.V IT.PRO))))
		(?P2 (NOT (HE.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E399.SK))
		(!W2 (?I1 BEFORE E399.SK))
		(!W3 (E399.SK CAUSE.V ?P1))
		(!W4 (E399.SK (AFTER E398.SK)))
		(!W5 (E398.SK (AT-ABOUT NOW87)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 12:
	; "The monkey can climb a tree."
	; "He climbs the tree and gets a cocoanut."
	; "He drops the cocoanut to the ground."
	; "He comes down and eats it."
	; "The monkey likes to run and play."
	; "Is Simeon afraid of the monkey?"
	; "Luisa is afraid of large monkeys."
	; "She is not afraid of this little monkey."
(setf matches (append matches '( (8.0 0.3)
(EPI-SCHEMA ((MONKEY425.SK EAT.1861.V COCOANUT430.SK) ** E443.SK)
	(:ROLES
		(!R1 (MONKEY425.SK AGENT.N))
		(!R2 (COCOANUT430.SK FOOD.N))
		(!R3 (MONKEY425.SK MONKEY.N))
		(!R4 (COCOANUT430.SK COCOANUT.N))
		(!R5 (GROUND438.SK GROUND.N))
		(!R6 (COCOANUT430.SK (TO.P GROUND438.SK)))
		(!R7 (E440.SK (ORIENTS E444.SK)))
		(!R8 (E112 (ORIENTS E440.SK)))
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
		(!W3 (E443.SK CAUSE.V ?P1))
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
)))
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((?X FEED.1891.V MONKEY425.SK COCOANUT430.SK) ** ?E)
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
		(!R11 (E440.SK (ORIENTS E444.SK)))
		(!R12 (E112 (ORIENTS E440.SK)))
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
)))
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((?X FEED.1892.V MONKEY425.SK COCOANUT430.SK) ** ?E)
	(:ROLES
		(!R1 (?X AGENT.N))
		(!R2 (MONKEY425.SK AGENT.N))
		(!R3 (COCOANUT430.SK FOOD.N))
		(!R4 (NOT (?X = MONKEY425.SK)))
		(!R5 (NOT (MONKEY425.SK = COCOANUT430.SK)))
		(!R6 (NOT (?X = COCOANUT430.SK)))
		(!R7 (COCOANUT430.SK COCOANUT.N))
		(!R8 (MONKEY425.SK MONKEY.N))
		(!R9 (COCOANUT430.SK (TO.P GROUND438.SK)))
		(!R10 (GROUND438.SK GROUND.N))
		(!R11 (E440.SK (ORIENTS E444.SK)))
		(!R12 (E112 (ORIENTS E440.SK)))
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
		(!W2 (E440.SK (AT-ABOUT NOW94)))
		(!W3 (E444.SK (AT-ABOUT NOW94)))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MONKEY425.SK GET.1921.V COCOANUT430.SK (AT.P-ARG ?L)) ** E431.SK)
	(:ROLES
		(!R1 (MONKEY425.SK AGENT.N))
		(!R2 (COCOANUT430.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MONKEY425.SK = COCOANUT430.SK)))
		(!R5 (MONKEY425.SK MONKEY.N))
		(!R6 (COCOANUT430.SK COCOANUT.N))
		(!R7 (E110 (ORIENTS E431.SK)))
		(!R8 (GROUND438.SK GROUND.N))
		(!R9 (COCOANUT430.SK (TO.P GROUND438.SK)))
		(!R10 (E109 (ORIENTS E432.SK)))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MONKEY425.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TREE426.SK)) CLIMB.1951.V))
              TREE426.SK)
             ** E432.SK)
	(:ROLES
		(!R1 (MONKEY425.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (TREE426.SK LOCATION.N))
		(!R4 (NOT (?L1 = TREE426.SK)))
		(!R5 (TREE426.SK TREE.N))
		(!R6 (MONKEY425.SK MONKEY.N))
		(!R7 (E109 (ORIENTS E432.SK)))
		(!R8 (E110 (ORIENTS E431.SK)))
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
		(!W5 (?G1 CAUSE.V E432.SK))
		(!W6 (E432.SK (CONSEC E431.SK)))
		(!W7 (E431.SK (AT-ABOUT NOW92)))
		(!W8 (E432.SK (AT-ABOUT NOW92)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; found chains:
; 	chain 2:
;		((MONKEY425.SK
     ;((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TREE426.SK)) CLIMB.1951.V))
     ;TREE426.SK)
    ;** E432.SK)
;		((MONKEY425.SK GET.1921.V COCOANUT430.SK (AT.P-ARG TREE426.SK)) ** E431.SK)
;		((MONKEY425.SK EAT.1861.V COCOANUT430.SK) ** E443.SK)
;learned chain schema:
(setf chain-matches (append chain-matches (list '(EPI-SCHEMA ((?X_B
                                                               CLIMB_GET_EAT.2011.PR
                                                               ?X_A ?X_C)
                                                              ** ?E)
	(:ROLES
		(!R1 (?X_A TREE.N))
		(!R2 (?X_A LOCATION.N))
		(!R3 (?X_C INANIMATE_OBJECT.N))
		(!R4 (NOT (?X_B = ?X_C)))
		(!R5 (?X_B MONKEY.N))
		(!R6 (?X_C FOOD.N))
		(!R7 (?X_C COCOANUT.N))
	)
	(:PRECONDS
		(?I1 (?X_B (AT.P ?L1_2)))
		(?I2 (NOT (?X_B (AT.P ?X_A))))
	)
	(:STEPS
		(?E1 (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) CLIMB.1951.V)) ?X_A))
		(?E2 (?X_B GET.1921.V ?X_C (AT.P-ARG ?X_A)))
		(?E3 (?X_B EAT.1861.V ?X_C))
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
(setf matches (append matches '( (11.0 0.3)
(EPI-SCHEMA ((HEN466.SK
              ((ADV-A (FROM.P TOP483.SK))
               ((ADV-A (TO.P NEST478.SK)) RUN.2012.V))
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
		(!R10 (E121 (ORIENTS E475.SK)))
		(!R11 (E123 (ORIENTS E474.SK)))
		(!R12 (TOP483.SK TOP.N))
		(!R13 (TOP483.SK (PERTAIN-TO TOM.NAME)))
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
		(!W5 (?G1 CAUSE.V E475.SK))
		(!W6 (E474.SK (AT-ABOUT NOW102)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

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

; story 15:
	; "O John!"
	; "the sun has just set."
	; "It is not hot, now."
	; "Let us run and jump."
	; "I think it is fun to run, and skip, and jump."
	; "See the duck on the pond!"
	; "Her nest is up on the bank, under the rock."
	; "We must not touch the nest, but we may look at it"

; story 16:
	; "Hall and Ann have come to the brook."
	; "Dash is with them."
	; "The brook is wide, but the water is not deep."
	; "Dash has Ann on his back."
	; "He will take her to the other side."
	; "She will not wet her feet."
	; "He holds her on her."
	; "She will not fall off."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA (((K DASH.N) ((ADV-A (TO.P SIDE553.SK)) TAKE.2312.V) (K DASH.N)
              (AT.P-ARG ?L))
             ** E556.SK)
	(:ROLES
		(!R1 ((K DASH.N) AGENT.N))
		(!R2 ((K DASH.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT ((K DASH.N) = (K DASH.N))))
		(!R5 (SIDE553.SK SIDE.N))
		(!R6 (SIDE553.SK OTHER.A))
		(!R7 (E148 (ORIENTS E550.SK)))
		(!R8 (E151 (ORIENTS E563.SK)))
	)
	(:GOALS
		(?G1 ((K DASH.N) (WANT.V (THAT ((K DASH.N) (HAVE.V (K DASH.N)))))))
	)
	(:PRECONDS
		(?I1 (NOT ((K DASH.N) ((ADV-A (ON.P (K DASH.N))) HAVE.V) (K DASH.N))))
		(?I2 ((K DASH.N) (AT.P ?L)))
		(?I3 ((K DASH.N) (AT.P ?L)))
	)
	(:POSTCONDS
		(E563.SK ((K DASH.N) ((ADV-A (ON.P (K DASH.N))) HAVE.V) (K DASH.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E556.SK))
		(!W2 (?I1 PRECOND-OF E556.SK))
		(!W3 (?I2 PRECOND-OF E556.SK))
		(!W4 (?I3 PRECOND-OF E556.SK))
		(!W5 (E563.SK POSTCOND-OF E556.SK))
		(!W6 (E556.SK (AFTER E550.SK)))
		(!W7 (E550.SK (AT-ABOUT NOW127)))
		(!W8 (E563.SK (AT-ABOUT NOW129)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 17:
	; "The sun is hot and the carabao likes to stand in the water."
	; "Simeon rode him here."
	; "Soo Simeon will ride him home."
	; "Where is Simeon?"
	; "He likes to sit under a tree."
	; "Simeon's father has five carabaos."
	; "Three of them are old, and two of them are young."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((SIMEON.NAME ((ADV-A (ON.P ?S)) ((ADV-A (IN.P ?S)) RIDE.2462.V)))
             ** E575.SK)
	(:ROLES
		(!R1 (SIMEON.NAME AGENT.N))
		(!R2 (?S INANIMATE_OBJECT.N))
		(!R3 (?S FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (SIMEON.NAME FATHER.N))
		(!R6 (SIMEON.NAME (PERTAIN-TO SIMEON.NAME)))
		(!R7 (HE590.SK AGENT.N))
		(!R8 (E89 (ORIENTS E575.SK)))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((SIMEON.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P HE590.SK)) RIDE.2492.V))
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
		(!R8 (E89 (ORIENTS E575.SK)))
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
		(!W5 (?G1 CAUSE.V E575.SK))
		(!W6 (E575.SK (BEFORE NOW132)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

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

; story 19:
	; "Grace is running after the butterfly."
	; "Can she catch it?"
	; "I think not."
	; "It can fly faster than Grace can run."
	; "Grace has many flowers in her garden."
	; "The butterflies come there because they like the flowers."
	; "They fly among them all day."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((GRACE.NAME
              ((ADV-A (AFTER.P BUTTERFLY621.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.2792.V)))
              ?L2)
             ** E620.SK)
	(:ROLES
		(!R1 (GRACE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (BUTTERFLY621.SK BUTTERFLY.N))
		(!R6 (E171 (ORIENTS E620.SK)))
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
		(!W5 (?G1 CAUSE.V E620.SK))
		(!W6 (E620.SK (AT-ABOUT NOW147)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((ME.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.2822.V (KA THINK.V)) **
             ?E)
	(:ROLES
		(!R1 (ME.PRO AGENT.N))
		(!R2 ((KA THINK.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (E173 (ORIENTS E625.SK)))
	)
	(:GOALS
		(?G1 (ME.PRO (WANT.V (THAT (NOT (ME.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME.PRO (DO.V (KA THINK.V)))) CAUSE.V (KE (ME.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E625.SK (NOT (ME.PRO (DO.V (KA THINK.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E625.SK))
		(!W2 (E625.SK (AT-ABOUT NOW149)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 20:
	; "When Gracia goes to church she carries a black parasol."
	; "It is small and is made of silk."
	; "Pepita carries an umbrella."
	; "This is a picture of it."
	; "It comes from Japan."
	; "It is made of paper but it is a good umbrella."
	; "Do you like a black parasol better than a Japanese umbrella?"
	; "Petita likes the Japanese umbrella because it is so gay and pretty."
(setf matches (append matches '( (10.0 0.1)
(EPI-SCHEMA ((IT671.SK
              ((ADV-A (FROM.P JAPAN.NAME)) ((ADV-A (TO.P ?L2)) COME.2942.V))
              ?L2)
             ** E657.SK)
	(:ROLES
		(!R1 (IT671.SK AGENT.N))
		(!R2 (JAPAN.NAME LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (JAPAN.NAME = ?L2)))
		(!R5 (E186 (ORIENTS E657.SK)))
	)
	(:GOALS
		(?G1 (IT671.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (IT671.SK (AT.P JAPAN.NAME)))
		(?I2 (NOT (IT671.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (IT671.SK (AT.P JAPAN.NAME))))
		(?P2 (IT671.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E657.SK))
		(!W2 (?I2 BEFORE E657.SK))
		(!W3 (?P1 AFTER E657.SK))
		(!W4 (?P2 AFTER E657.SK))
		(!W5 (?G1 CAUSE.V E657.SK))
		(!W6 (E657.SK (AT-ABOUT NOW158)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 21:
	; "Nan has two black hens."
	; "They lay nice white eggs."
	; "You can find them in the hay."
	; "My hen lays eggs, too."
	; "She has her nest up on the beam."
	; "She will fly off, and say “cluck, cluck!”"

; story 22:
	; "Simeon and Pedro like to fish."
	; "Sometimes they sit on the bridge."
	; "Sometimes they sit on the bank of the river."
	; "They have poles, long lines, and little iron hooks."
	; "This morning Simeon caught a large fish."
	; "Pedro caught many small ones."
	; "The boys caught some crabs, too."
	; "They use a net to catch the crabs."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((THEY709.SK
              (SOMETIMES.ADV
               ((ADV-A (IN.P BRIDGE690.SK))
                ((ADV-A (ON.P BRIDGE690.SK)) SIT.3152.V))))
             ** E691.SK)
	(:ROLES
		(!R1 (BRIDGE690.SK INANIMATE_OBJECT.N))
		(!R2 (BRIDGE690.SK FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (THEY709.SK AGENT.N))
		(!R5 (BRIDGE690.SK BRIDGE.N))
		(!R6 (E198 (ORIENTS E691.SK)))
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
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

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
(setf matches (append matches '( (4.0 0.3)
(EPI-SCHEMA ((BEES715.SK ((ADV-A (IN.P FLOWERS721.SK)) FIND.3332.V)
              (K (L #:G748216 (AND (#:G748216 SWEET.A) (#:G748216 NECTAR.N)))))
             ** E722.SK)
	(:ROLES
		(!R1 (BEES715.SK AGENT.N))
		(!R2 (HOME724.SK LOCATION.N))
		(!R3 (BEES715.SK (PLUR BEE.N)))
		(!R4 (FLOWERS721.SK ((NN CLOVER.N) (PLUR FLOWER.N))))
		(!R5 (E206 (ORIENTS E722.SK)))
		(!R6 (HOME724.SK NECTAR.A))
		(!R7 (HOME724.SK HOME.N))
	)
	(:PRECONDS
		(?I1 (BEES715.SK (AT.P HOME724.SK)))
		(?I2
   ((K (L #:G748216 (AND (#:G748216 SWEET.A) (#:G748216 NECTAR.N))))
    (AT.P HOME724.SK)))
		(?I3
   (BEES715.SK
    ((ADV-A
      (FOR.P (K (L #:G748216 (AND (#:G748216 SWEET.A) (#:G748216 NECTAR.N))))))
     SEARCH.V)))
		(?I4
   (NOT
    (BEES715.SK
     (KNOW.V
      (THAT
       ((K (L #:G748216 (AND (#:G748216 SWEET.A) (#:G748216 NECTAR.N))))
        (AT.P HOME724.SK)))))))
		(?I5
   (NOT
    (BEES715.SK
     (HAVE.V
      (K (L #:G748216 (AND (#:G748216 SWEET.A) (#:G748216 NECTAR.N))))))))
	)
	(:POSTCONDS
		(?P1
   (BEES715.SK
    (KNOW.V
     (THAT
      ((K (L #:G748216 (AND (#:G748216 SWEET.A) (#:G748216 NECTAR.N))))
       (AT.P HOME724.SK))))))
		(?P2
   (BEES715.SK
    (HAVE.V (K (L #:G748216 (AND (#:G748216 SWEET.A) (#:G748216 NECTAR.N)))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E722.SK (AT-ABOUT NOW178)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (8.0 0.3)
(EPI-SCHEMA (((SET-OF (K (PLUR HORSE.N)) (K (PLUR COW.N))) EAT.3362.V
              (K CLOVER.N))
             ** E744.SK)
	(:ROLES
		(!R1 ((SET-OF (K (PLUR HORSE.N)) (K (PLUR COW.N))) AGENT.N))
		(!R2 ((K CLOVER.N) FOOD.N))
		(!R3 (E213 (ORIENTS E744.SK)))
	)
	(:GOALS
		(?G1
   ((SET-OF (K (PLUR HORSE.N)) (K (PLUR COW.N)))
    (WANT.V
     (THAT (NOT ((SET-OF (K (PLUR HORSE.N)) (K (PLUR COW.N))) HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 ((SET-OF (K (PLUR HORSE.N)) (K (PLUR COW.N))) HAVE.V (K CLOVER.N)))
		(?I2 ((SET-OF (K (PLUR HORSE.N)) (K (PLUR COW.N))) HUNGRY.A))
	)
	(:POSTCONDS
		(?P1
   (NOT ((SET-OF (K (PLUR HORSE.N)) (K (PLUR COW.N))) (HAVE.V (K CLOVER.N)))))
		(?P2 (NOT ((SET-OF (K (PLUR HORSE.N)) (K (PLUR COW.N))) HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E744.SK))
		(!W2 (?I1 BEFORE E744.SK))
		(!W3 (E744.SK CAUSE.V ?P1))
		(!W4 (E744.SK (AT-ABOUT NOW184)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

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

; story 25:
	; "This large animal is an elephant."
	; "His ears look like fans."
	; "The two long teeth are called tusks."
	; "The elephant eats grass and green corn."
	; "He likes oranges bananas and peanuts."
	; "Elephants live in India."
(setf matches (append matches '( (8.0 0.3)
(EPI-SCHEMA ((ELEPHANT808.SK EAT.3632.V
              (SET-OF (K GRASS.N)
               (K (L #:G857659 (AND (#:G857659 GREEN.A) (#:G857659 CORN.N))))))
             ** E807.SK)
	(:ROLES
		(!R1 (ELEPHANT808.SK AGENT.N))
		(!R2
   ((SET-OF (K GRASS.N)
     (K (L #:G857659 (AND (#:G857659 GREEN.A) (#:G857659 CORN.N)))))
    FOOD.N))
		(!R3 (ELEPHANT808.SK ELEPHANT.N))
		(!R4 (E807.SK (RIGHT-AFTER U200)))
		(!R5 (E232 (ORIENTS E810.SK)))
	)
	(:GOALS
		(?G1 (ELEPHANT808.SK (WANT.V (THAT (NOT (ELEPHANT808.SK HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1
   (ELEPHANT808.SK HAVE.V
    (SET-OF (K GRASS.N)
     (K (L #:G857659 (AND (#:G857659 GREEN.A) (#:G857659 CORN.N)))))))
		(?I2 (ELEPHANT808.SK HUNGRY.A))
	)
	(:POSTCONDS
		(?P1
   (NOT
    (ELEPHANT808.SK
     (HAVE.V
      (SET-OF (K GRASS.N)
       (K (L #:G857659 (AND (#:G857659 GREEN.A) (#:G857659 CORN.N)))))))))
		(?P2 (NOT (ELEPHANT808.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E807.SK))
		(!W2 (?I1 BEFORE E807.SK))
		(!W3 (E807.SK CAUSE.V ?P1))
		(!W4 (E807.SK (SAME-TIME NOW201)))
		(!W5 (E810.SK (AT-ABOUT NOW201)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

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

; story 27:
	; "Ellen opened the door of the cage to give her bird some water."
	; "The little bird flew out."
	; "It flew into a tree in the yard."
	; "Can you see it sitting in the tree?"
	; "Ellen sees it, but she cannot get it."
	; "The bird did not like to live in the cage."
	; "It likes to fly among the trees.Now it is singing and very happy."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((IT.PRO
              ((ADV-A (INTO.P TREE856.SK))
               ((ADV-A (IN.P YARD857.SK))
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FLY.3932.V))))
              ?L2)
             ** E858.SK)
	(:ROLES
		(!R1 (IT.PRO AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (TREE856.SK TREE.N))
		(!R6 (YARD857.SK YARD.N))
		(!R7 (E251 (ORIENTS E858.SK)))
	)
	(:GOALS
		(?G1 (IT.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (IT.PRO (AT.P ?L1)))
		(?I2 (NOT (IT.PRO (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (IT.PRO (AT.P ?L1))))
		(?P2 (IT.PRO (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E858.SK))
		(!W2 (?I2 BEFORE E858.SK))
		(!W3 (?P1 AFTER E858.SK))
		(!W4 (?P2 AFTER E858.SK))
		(!W5 (?G1 CAUSE.V E858.SK))
		(!W6 (E858.SK (BEFORE NOW215)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((BIRD865.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.3962.V
              (KA (LIKE.V (KA ((ADV-A (IN.P CAGE866.SK)) LIVE.V)))))
             ** ?E)
	(:ROLES
		(!R1 (BIRD865.SK AGENT.N))
		(!R2 ((KA (LIKE.V (KA ((ADV-A (IN.P CAGE866.SK)) LIVE.V)))) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (BIRD865.SK BIRD.N))
		(!R5 (CAGE866.SK CAGE.N))
		(!R6 (E252 (ORIENTS E870.SK)))
	)
	(:GOALS
		(?G1 (BIRD865.SK (WANT.V (THAT (NOT (BIRD865.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE
     (BIRD865.SK (DO.V (KA (LIKE.V (KA ((ADV-A (IN.P CAGE866.SK)) LIVE.V)))))))
    CAUSE.V (KE (BIRD865.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E870.SK
   (NOT
    (BIRD865.SK (DO.V (KA (LIKE.V (KA ((ADV-A (IN.P CAGE866.SK)) LIVE.V))))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E870.SK))
		(!W2 (E870.SK (BEFORE NOW218)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 28:
	; "Jane, Joe and Harry will have a fine time today."
	; "There is no school, they have a play-day."
	; "They have come to the fields and woods."
	; "They see the birds fly from tree to tree."
	; "They hear their sweet songs."
	; "They are down by the pond."
	; "They have had a long walk."
	; "They can sit down now and rest."

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
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((SIMEON.NAME GET.4442.V COCOANUT982.SK (AT.P-ARG ?L)) ** E966.SK)
	(:ROLES
		(!R1 (SIMEON.NAME AGENT.N))
		(!R2 (COCOANUT982.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (SIMEON.NAME = COCOANUT982.SK)))
		(!R5 (COCOANUT982.SK (PLUR COCOANUT.N)))
		(!R6 (E284 (ORIENTS E966.SK)))
		(!R7 (MOTHER968.SK MOTHER.N))
		(!R8 (MOTHER968.SK (PERTAIN-TO SIMEON.NAME)))
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
)))

; story 31:
	; "This man is not a Filipino."
	; "He comes from China."
	; "His hair is long and black."
	; "What is in his large basket?"
	; "There are many things in it."
	; "There are handkerchiefs and slippers for the girls, and hats and coats  for the boys."
	; "He has also knives, pencils, paper, and combs."
	; "He is called a peddler."
; (setf matches (list))
; (setf chain-matches (list))
; story 0:
	; "The man put on his watch."
	; "His watch was not running."
	; "He took his watch off."
	; "He shook the watch."
	; "The watch started running again."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MAN2.SK TAKE.1.V WATCH5.SK (AT.P-ARG ?L)) ** E18.SK)
	(:ROLES
		(!R1 (MAN2.SK AGENT.N))
		(!R2 (WATCH5.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAN2.SK = WATCH5.SK)))
		(!R5 (WATCH5.SK WATCH.N))
		(!R6 (MAN2.SK MAN.N))
		(!R7 (WATCH5.SK (PERTAIN-TO MAN2.SK)))
		(!R8 (E1 (ORIENTS E18.SK)))
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
)))

; story 1:
	; "The man put on his jacket."
	; "He soon became too hot."
	; "He took his jacket off."
	; "He became cold again."
	; "He put on a coat that was not as warm."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((HE.PRO TAKE.151.V MAN27.SK (AT.P-ARG ?L)) ** E40.SK)
	(:ROLES
		(!R1 (MAN27.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = MAN27.SK)))
		(!R4 (MAN27.SK MAN.N))
		(!R5 (MAN27.SK JACKET.N))
		(!R6 (MAN27.SK (PERTAIN-TO HE.PRO)))
		(!R7 (HE.PRO MALE.A))
		(!R8 (HE.PRO AGENT.N))
		(!R9 (E6 (ORIENTS E40.SK)))
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
)))

; story 2:
	; "I went on a plane yesterday."
	; "As I got on it something happened."
	; "We had to turn back."
	; "A fire came about."
	; "It was scary."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((ME69.SK
              ((ADV-A (ON.P PLANE51.SK))
               ((ADV-A (IN.P (K YESTERDAY.N)))
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.301.V))))
              ?L2)
             ** E59.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (ME69.SK AGENT.N))
		(!R5 (PLANE51.SK PLANE.N))
		(!R6 (E10 (ORIENTS E59.SK)))
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
		(!W5 (?G1 CAUSE.V E59.SK))
		(!W6 (E59.SK (BEFORE NOW10)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 3:
	; "Ethan sat in a chair."
	; "The chair was old."
	; "The chair broke."
	; "Ethan fell on the ground."
	; "He decided to buy a new one."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((ETHAN.NAME
              ((ADV-A (ON.P CHAIR74.SK))
               ((ADV-A (IN.P CHAIR74.SK)) SIT.451.V)))
             ** E76.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (CHAIR74.SK INANIMATE_OBJECT.N))
		(!R3 (CHAIR74.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (CHAIR74.SK CHAIR.N))
		(!R6 (E17 (ORIENTS E76.SK)))
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
)))
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((ETHAN.NAME
              ((ADV-A (ON.P GROUND85.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.481.V)))
              ?L2)
             ** E87.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (GROUND85.SK GROUND.N))
		(!R6 (E20 (ORIENTS E87.SK)))
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
		(!W5 (?G1 CAUSE.V E87.SK))
		(!W6 (E87.SK (BEFORE NOW18)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 4:
	; "Lucy went for a walk."
	; "She saw a squirrel."
	; "Then she looked again."
	; "It wasn't a squirrel."
	; "It was a chipmunk."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-A (FOR.P WALK96.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.541.V)))
              ?L2)
             ** E98.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (WALK96.SK WALK.N))
		(!R6 (E22 (ORIENTS E98.SK)))
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
		(!W5 (?G1 CAUSE.V E98.SK))
		(!W6 (E98.SK (BEFORE NOW20)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 5:
	; "Yesterday I got a kindle book."
	; "It was great."
	; "I liked the book a lot."
	; "I read it in two days."
	; "It was impressive."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME124.SK GET.661.V BOOK115.SK (AT.P-ARG ?L)) ** E116.SK)
	(:ROLES
		(!R1 (BOOK115.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME124.SK = BOOK115.SK)))
		(!R4 (BOOK115.SK KINDLE.A))
		(!R5 (BOOK115.SK BOOK.N))
		(!R6 (ME124.SK AGENT.N))
		(!R7 (E27 (ORIENTS E116.SK)))
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
)))

; story 6:
	; "The orange fell from the tree."
	; "It hit a girl on the head."
	; "The girl looked up at the tree."
	; "Another orange fell from the tree."
	; "That orange broke her nose."
(setf matches (append matches '( (10.0 0.1)
(EPI-SCHEMA ((ORANGE129.SK
              ((ADV-A (FROM.P TREE131.SK)) ((ADV-A (TO.P ?L2)) FALL.901.V))
              ?L2)
             ** E128.SK)
	(:ROLES
		(!R1 (ORANGE129.SK AGENT.N))
		(!R2 (TREE131.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (TREE131.SK = ?L2)))
		(!R5 (TREE131.SK TREE.N))
		(!R6 (ORANGE129.SK ORANGE.N))
		(!R7 (ORANGE129.SK NEW-SALIENT-ENTITY*.N))
		(!R8 (E128.SK (RIGHT-AFTER U29)))
		(!R9 (E32 (ORIENTS E136.SK)))
	)
	(:GOALS
		(?G1 (ORANGE129.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ORANGE129.SK (AT.P TREE131.SK)))
		(?I2 (NOT (ORANGE129.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (ORANGE129.SK (AT.P TREE131.SK))))
		(?P2 (ORANGE129.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E128.SK))
		(!W2 (?I2 BEFORE E128.SK))
		(!W3 (?P1 AFTER E128.SK))
		(!W4 (?P2 AFTER E128.SK))
		(!W5 (?G1 CAUSE.V E128.SK))
		(!W6 (E128.SK (SAME-TIME NOW30)))
		(!W7 (E136.SK (BEFORE NOW30)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 7:
	; "I needed a to write a song."
	; "I had nothing to write with."
	; "I looked in my desk for a pen."
	; "I only saw a pen cap."
	; "I threw the pen cap away."

; story 8:
	; "The hedge started to grow."
	; "Spring came around."
	; "The hedge started to bud flowers."
	; "The flowers grew."
	; "The roses were very beautiful."

; story 9:
	; "I went to the store yesterday."
	; "I tried some things on."
	; "I liked them but they were too expensive."
	; "I couldn't buy them."
	; "So I put them back."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME213.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P STORE204.SK)) ((ADV-A (FROM.P ?L1)) GO.1171.V)))
              STORE204.SK)
             ** E205.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STORE204.SK LOCATION.N))
		(!R3 (NOT (?L1 = STORE204.SK)))
		(!R4 (ME213.SK AGENT.N))
		(!R5 (STORE204.SK STORE.N))
		(!R6 (E46 (ORIENTS E205.SK)))
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
		(!W5 (?G1 CAUSE.V E205.SK))
		(!W6 (E205.SK (BEFORE NOW45)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 10:
	; "The man told a story."
	; "The boy liked it."
	; "The boy asked to hear it again."
	; "The man refused."
	; "The boy tried to read the story by himself."

; story 11:
	; "I went to visit a farm on Friday."
	; "It was a long drive to get there."
	; "They had a lot of animals."
	; "I got to pet the cow."
	; "It was a very fun day."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((ME257.SK
              ((ADV-A
                (FOR.P (KA ((ADV-A (ON.P FRIDAY.NAME)) VISIT.V) FARM240.SK)))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.1561.V)))
              ?L2)
             ** E241.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (ME257.SK AGENT.N))
		(!R5 (FARM240.SK FARM.N))
		(!R6 (E56 (ORIENTS E241.SK)))
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
		(!W5 (?G1 CAUSE.V E241.SK))
		(!W6 (E241.SK (BEFORE NOW55)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 12:
	; "Kate felt something run across her foot."
	; "It was a giant spider!"
	; "She swatted it away."
	; "It ran under her bed."
	; "She could not sleep that night."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((IT.PRO
              ((ADV-A (UNDER.P KATE.NAME))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.1651.V)))
              ?L2)
             ** E272.SK)
	(:ROLES
		(!R1 (IT.PRO AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (KATE.NAME (PERTAIN-TO KATE.NAME)))
		(!R6 (KATE.NAME FOOT.N))
		(!R7 (KATE.NAME BED.N))
		(!R8 (KATE.NAME (PERTAIN-TO SHE.PRO)))
		(!R9 (SHE.PRO FEMALE.A))
		(!R10 (SHE.PRO AGENT.N))
		(!R11 (E64 (ORIENTS E272.SK)))
	)
	(:GOALS
		(?G1 (IT.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (IT.PRO (AT.P ?L1)))
		(?I2 (NOT (IT.PRO (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (IT.PRO (AT.P ?L1))))
		(?P2 (IT.PRO (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E272.SK))
		(!W2 (?I2 BEFORE E272.SK))
		(!W3 (?P1 AFTER E272.SK))
		(!W4 (?P2 AFTER E272.SK))
		(!W5 (?G1 CAUSE.V E272.SK))
		(!W6 (E272.SK (BEFORE NOW63)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 13:
	; "Devin got fed up with his bank."
	; "He called them for help."
	; "They didn't respond."
	; "He took his money out."
	; "He found a new bank."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((DEVIN.NAME GET.1681.V
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
		(!R8 (E65 (ORIENTS E283.SK)))
		(!R9 (DEVIN.NAME (PERTAIN-TO HE.PRO)))
		(!R10 (HE.PRO MALE.A))
		(!R11 (HE.PRO AGENT.N))
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
)))
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((HE.PRO FIND.1741.V BANK299.SK) ** E300.SK)
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
		(!R10 (E69 (ORIENTS E300.SK)))
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
)))

; story 14:
	; "The rose bush bloomed."
	; "The man cut a rose."
	; "He gave it to the woman."
	; "The woman got mad."
	; "She did not like her roses cut."
(setf matches (append matches '( (3.5 0)
(EPI-SCHEMA ((HE.PRO ((ADV-A (TO.P IT.PRO)) GIVE.1771.V) IT.PRO ?O) ** E320.SK)
	(:ROLES
		(!R1 (?O INANIMATE_OBJECT.N))
		(!R2 (IT.PRO AGENT.N))
		(!R3 (WOMAN319.SK WOMAN.N))
		(!R4 (HE.PRO MALE.A))
		(!R5 (HE.PRO AGENT.N))
		(!R6 (E72 (ORIENTS E320.SK)))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (IT.PRO (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (HE.PRO HAVE.V ?O))
		(?I2 (NOT (IT.PRO HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO HAVE.V ?O)))
		(?P2 (IT.PRO HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E320.SK (BEFORE NOW72)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (7.0 0.2)
(EPI-SCHEMA ((HE.PRO ((ADV-A (TO.P WOMAN319.SK)) FEED.1801.V) IT.PRO ?F) **
             E320.SK)
	(:ROLES
		(!R1 (IT.PRO AGENT.N))
		(!R2 (?F FOOD.N))
		(!R3 (NOT (HE.PRO = IT.PRO)))
		(!R4 (NOT (IT.PRO = ?F)))
		(!R5 (NOT (HE.PRO = ?F)))
		(!R6 (WOMAN319.SK WOMAN.N))
		(!R7 (HE.PRO MALE.A))
		(!R8 (HE.PRO AGENT.N))
		(!R9 (E72 (ORIENTS E320.SK)))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (NOT (IT.PRO HUNGRY.A))))))
		(?G2 (HE.PRO (WANT.V (THAT (IT.PRO EAT.V ?F)))))
	)
	(:PRECONDS
		(?I1 (HE.PRO HAVE.V ?F))
		(?I2 (IT.PRO HUNGRY.A))
	)
	(:STEPS
		(?E1 (IT.PRO EAT.V ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO (HAVE.V ?F))))
		(?P2 (NOT (IT.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E320.SK))
		(!W2 (E320.SK (BEFORE NOW72)))
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
)))

; story 15:
	; "Emmy lived on a farm."
	; "She stayed in a pen with her brother."
	; "One day a man came and saw Emmy."
	; "He took her home."
	; "They are very happy together."
(setf matches (append matches '( (10.0 0.4)
(EPI-SCHEMA ((MAN341.SK TAKE.1921.V EMMY.NAME (AT.P-ARG FARM329.SK)) ** E344.SK)
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
		(!R10 (E79 (ORIENTS E344.SK)))
		(!R11 (FARM329.SK FARM.N))
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
)))

; story 16:
	; "I was in high school."
	; "I went to a park with a friend."
	; "I lost my friend."
	; "I was late for my curfew."
	; "I got in trouble."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME364.SK
              ((ADV-A (WITH.P FRIEND350.SK))
               ((ADV-A (TO.P PARK349.SK)) ((ADV-A (FROM.P ?L1)) GO.2071.V)))
              PARK349.SK)
             ** E354.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (PARK349.SK LOCATION.N))
		(!R3 (NOT (?L1 = PARK349.SK)))
		(!R4 (ME364.SK AGENT.N))
		(!R5 (PARK349.SK PARK.N))
		(!R6 (FRIEND350.SK FRIEND.N))
		(!R7 (E82 (ORIENTS E354.SK)))
		(!R8 (FRIEND358.SK (PERTAIN-TO ME364.SK)))
		(!R9 (FRIEND358.SK FRIEND.N))
		(!R10 (CURFEW362.SK (PERTAIN-TO ME364.SK)))
		(!R11 (CURFEW362.SK CURFEW.N))
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
		(!W5 (?G1 CAUSE.V E354.SK))
		(!W6 (E354.SK (BEFORE NOW81)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 17:
	; "Today I saw a baby bird."
	; "The bird was in a tree."
	; "The mother bird was teaching the baby bird."
	; "She dropped the bird out of the nest."
	; "The baby bird flew away."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((BIRD371.SK
              (AWAY.ADV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FLY.2281.V)))
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
		(!R8 (E90 (ORIENTS E386.SK)))
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
		(!W5 (?G1 CAUSE.V E386.SK))
		(!W6 (E386.SK (BEFORE NOW89)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 18:
	; "Yesterday I went out to eat."
	; "I ate a lot."
	; "Too much to the point where I was full."
	; "I then fell sick."
	; "It was just too much."
(setf matches (append matches '( (8.0 0.3)
(EPI-SCHEMA ((ME.PRO EAT.2371.V LOT392.SK) ** E393.SK)
	(:ROLES
		(!R1 (ME.PRO AGENT.N))
		(!R2 (LOT392.SK FOOD.N))
		(!R3 (LOT392.SK LOT.N))
		(!R4 (E92 (ORIENTS E393.SK)))
	)
	(:GOALS
		(?G1 (ME.PRO (WANT.V (THAT (NOT (ME.PRO HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 (ME.PRO HAVE.V LOT392.SK))
		(?I2 (ME.PRO HUNGRY.A))
	)
	(:POSTCONDS
		(?P1 (NOT (ME.PRO (HAVE.V LOT392.SK))))
		(?P2 (NOT (ME.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER E393.SK))
		(!W2 (?I1 BEFORE E393.SK))
		(!W3 (E393.SK CAUSE.V ?P1))
		(!W4 (E393.SK (BEFORE NOW91)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 19:
	; "The man felt cold."
	; "He took a warm shower."
	; "He felt better in the shower."
	; "When he got out he felt cold again."
	; "He got back in the shower."

; story 20:
	; "Today I went swimming."
	; "I love to swim."
	; "The water was very cold."
	; "The water made my teeth chatter."
	; "The water was so cold, I had to get out."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME435.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K SWIMMING.N))) GO.2701.V))
              (K SWIMMING.N))
             ** E414.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K SWIMMING.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K SWIMMING.N))))
		(!R4 (ME435.SK AGENT.N))
		(!R5 (E102 (ORIENTS E414.SK)))
		(!R6 (CHATTER430.SK (PERTAIN-TO ME435.SK)))
		(!R7 (CHATTER430.SK ((NN (PLUR TOOTH.N)) CHATTER.N)))
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
		(!W5 (?G1 CAUSE.V E414.SK))
		(!W6 (E414.SK (BEFORE NOW100)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (4.0 0.4)
(EPI-SCHEMA ((WATER424.SK MAKE.2731.V CHATTER430.SK) ** E426.SK)
	(:ROLES
		(!R1 (WATER424.SK AGENT.N))
		(!R2 (CHATTER430.SK INANIMATE_OBJECT.N))
		(!R3 (WATER424.SK WATER.N))
		(!R4 (CHATTER430.SK ((NN (PLUR TOOTH.N)) CHATTER.N)))
		(!R5 (CHATTER430.SK (PERTAIN-TO ME435.SK)))
		(!R6 (ME435.SK AGENT.N))
		(!R7 (E426.SK (RIGHT-AFTER U102)))
		(!R8 (E106 (ORIENTS E431.SK)))
	)
	(:GOALS
		(?G1 (WATER424.SK (WANT.V (THAT (CHATTER430.SK EXIST.V)))))
		(?G2 (WATER424.SK (WANT.V (KA (HAVE.V CHATTER430.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (CHATTER430.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (CHATTER430.SK EXIST.V))
		(?P2 (WATER424.SK (HAVE.V CHATTER430.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E426.SK (SAME-TIME NOW103)))
		(!W2 (E431.SK (BEFORE NOW103)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 21:
	; "Julia loved flowers."
	; "She thought they were so pretty."
	; "One day she was walking."
	; "She saw a field of flowers."
	; "She had fun playing the flowers."

; story 22:
	; "Toni had a cat."
	; "She loved the cat."
	; "One day it got caught in the tree."
	; "Toni got mad."
	; "She looked for it and tried to get it."

; story 23:
	; "Susie was so hungry."
	; "She filled her plate to the top."
	; "She needed to eat."
	; "All the sudden she got full."
	; "She put on too much."

; story 24:
	; "It was a raining night."
	; "It was too bad to go out."
	; "So Tina had to stay home."
	; "Tina had to cook."
	; "She wasn't happy about that."

; story 25:
	; "It was a hot day."
	; "Fred wanted water balloons."
	; "So he filled some up."
	; "Then he threw them at his friends."
	; "They had a large fight."

; story 26:
	; "I was on my way to get ice cream."
	; "Then I saw the line."
	; "It was far too long."
	; "It was around the corner."
	; "So I went home instead."
(setf matches (append matches '( (10.0 0.1)
(EPI-SCHEMA ((ME535.SK
              (INSTEAD.ADV
               ((ADV-A HOME.N)
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FROM.P CORNER533.SK)) GO.3541.V))))
              ?L2)
             ** E534.SK)
	(:ROLES
		(!R1 (CORNER533.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (CORNER533.SK = ?L2)))
		(!R4 (ME535.SK AGENT.N))
		(!R5 (WAY527.SK (PERTAIN-TO ME535.SK)))
		(!R6 (WAY527.SK WAY.N))
		(!R7 (E143 (ORIENTS E534.SK)))
		(!R8 (CORNER533.SK CORNER.N))
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
		(!W5 (?G1 CAUSE.V E534.SK))
		(!W6 (E534.SK (BEFORE NOW134)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 27:
	; "The man turned on the light."
	; "A mouse got startled."
	; "The mouse ran across the living room."
	; "The man got startled."
	; "The man hid in his room."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MOUSE551.SK GET.3691.V (KA (BE.PASV STARTLE.V)) (AT.P-ARG ?L)) **
             E553.SK)
	(:ROLES
		(!R1 (MOUSE551.SK AGENT.N))
		(!R2 ((KA (BE.PASV STARTLE.V)) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MOUSE551.SK = (KA (BE.PASV STARTLE.V)))))
		(!R5 (MOUSE551.SK MOUSE.N))
		(!R6 (E145 (ORIENTS E553.SK)))
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
)))
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((MOUSE551.SK
              ((ADV-A (ACROSS.P ROOM560.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.3721.V)))
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
		(!R11 (E146 (ORIENTS E563.SK)))
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
		(!W5 (?G1 CAUSE.V E556.SK))
		(!W6 (E556.SK (SAME-TIME NOW137)))
		(!W7 (E563.SK (BEFORE NOW137)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 28:
	; "Tom moved to a new city."
	; "He couldn't find a church he liked."
	; "He tried going to a black church."
	; "Tom had a lot of fun there."
	; "He returned often."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P CITY579.SK)) MOVE.3841.V))
              CITY579.SK)
             ** E580.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (CITY579.SK LOCATION.N))
		(!R4 (NOT (?L1 = CITY579.SK)))
		(!R5 (CITY579.SK CITY.N))
		(!R6 (CITY579.SK NEW.A))
		(!R7 (E149 (ORIENTS E580.SK)))
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
		(!W5 (?G1 CAUSE.V E580.SK))
		(!W6 (E580.SK (BEFORE NOW140)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 29:
	; "Tina liked Fred."
	; "She wanted to ask him out."
	; "When Tina and Fred saw each other she asked."
	; "Fred said no."
	; "Tina was crushed."

; story 30:
	; "The girl stood up."
	; "She bumped her head on something."
	; "She sat back down."
	; "Her head was bleeding."
	; "Her friend ran to get help."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((SHE.PRO ((ADV-A (ON.P (K SOMETHING.N))) BUMP.4201.V) GIRL608.SK)
             ** E613.SK)
	(:ROLES
		(!R1 (?L LOCATION.N))
		(!R2 (GIRL608.SK GIRL.N))
		(!R3 (GIRL608.SK HEAD.N))
		(!R4 (GIRL608.SK (PERTAIN-TO SHE.PRO)))
		(!R5 (SHE.PRO FEMALE.A))
		(!R6 (SHE.PRO AGENT.N))
		(!R7 (E161 (ORIENTS E613.SK)))
		(!R8 (HEAD620.SK HEAD.N))
		(!R9 (HEAD620.SK (PERTAIN-TO SHE.PRO)))
		(!R10 (FRIEND624.SK FRIEND.N))
		(!R11 (FRIEND624.SK (PERTAIN-TO SHE.PRO)))
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
)))
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((FRIEND624.SK
              ((ADV-A (FOR.P (KA (GET.V (K HELP.N)))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.4231.V)))
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
		(!R15 (E164 (ORIENTS E626.SK)))
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
		(!W5 (?G1 CAUSE.V E623.SK))
		(!W6 (E623.SK (SAME-TIME NOW154)))
		(!W7 (E626.SK (BEFORE NOW154)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 31:
	; "The man went out to his mailbox."
	; "He looked for his paper."
	; "His paper was not there."
	; "He called his paper boy."
	; "His paper boy was running late."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MAN628.SK
              (OUT.ADV
               ((ADV-A (TO.P MAILBOX631.SK)) ((ADV-A (FROM.P ?L1)) GO.4291.V)))
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
		(!R13 (E165 (ORIENTS E632.SK)))
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
		(!W5 (?G1 CAUSE.V E627.SK))
		(!W6 (E627.SK (SAME-TIME NOW155)))
		(!W7 (E632.SK (BEFORE NOW155)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 32:
	; "I got a new kitten."
	; "The kitten was bad."
	; "It ate my shoes."
	; "I then trained it to be good."
	; "It was a good kitten from then on."
(setf matches (append matches '( (8.0 0.3)
(EPI-SCHEMA ((KITTEN660.SK EAT.4441.V SHOE669.SK) ** E672.SK)
	(:ROLES
		(!R1 (KITTEN660.SK AGENT.N))
		(!R2 (SHOE669.SK FOOD.N))
		(!R3 (KITTEN660.SK NEW.A))
		(!R4 (KITTEN660.SK KITTEN.N))
		(!R5 (SHOE669.SK (PLUR SHOE.N)))
		(!R6 (SHOE669.SK (PERTAIN-TO ME675.SK)))
		(!R7 (ME675.SK AGENT.N))
		(!R8 (E172 (ORIENTS E672.SK)))
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
		(!W3 (E672.SK CAUSE.V ?P1))
		(!W4 (E672.SK (BEFORE NOW162)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME675.SK GET.4501.V KITTEN660.SK (AT.P-ARG ?L)) ** E661.SK)
	(:ROLES
		(!R1 (KITTEN660.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME675.SK = KITTEN660.SK)))
		(!R4 (KITTEN660.SK NEW.A))
		(!R5 (KITTEN660.SK KITTEN.N))
		(!R6 (ME675.SK AGENT.N))
		(!R7 (E170 (ORIENTS E661.SK)))
		(!R8 (SHOE669.SK (PERTAIN-TO ME675.SK)))
		(!R9 (SHOE669.SK (PLUR SHOE.N)))
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
)))

; story 33:
	; "Fred wanted to go to the movies."
	; "So off he went."
	; "He went with his friend."
	; "Fred saw two different movies."
	; "They were great."
(setf matches (append matches '( (10.0 0)
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A SO.ADV OFF.P)
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.4591.V)))
              ?L2)
             ** E684.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (MOVIE682.SK (PLUR MOVIE.N)))
		(!R6 (E174 (ORIENTS E683.SK)))
		(!R7 (E175 (ORIENTS E684.SK)))
		(!R8 (FRIEND691.SK (PERTAIN-TO FRED.NAME)))
		(!R9 (FRIEND691.SK FRIEND.N))
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
		(!W5 (E683.SK CAUSE.V E684.SK))
		(!W6 (E683.SK (BEFORE NOW165)))
		(!W7 (E684.SK (BEFORE NOW166)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 34:
	; "Ethan loved the snow."
	; "He saw it snow outside."
	; "He asked his mom if he could play."
	; "He took his sled."
	; "He went down the hill."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ETHAN.NAME TAKE.4741.V SLED708.SK (AT.P-ARG ?L)) ** E709.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (SLED708.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (ETHAN.NAME = SLED708.SK)))
		(!R5 (SLED708.SK (PERTAIN-TO ETHAN.NAME)))
		(!R6 (SLED708.SK SLED.N))
		(!R7 (MOM704.SK (PERTAIN-TO ETHAN.NAME)))
		(!R8 (MOM704.SK MOM.N))
		(!R9 (E182 (ORIENTS E709.SK)))
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
)))

; story 35:
	; "The cow left the barn."
	; "It went out to the field."
	; "The other cows were out in the field."
	; "The cow found a spot of grass."
	; "The cow ate the grass."
(setf matches (append matches '( (4.0 0.3)
(EPI-SCHEMA ((COW714.SK FIND.4921.V SPOT728.SK) ** E724.SK)
	(:ROLES
		(!R1 (COW714.SK AGENT.N))
		(!R2 (FIELD719.SK LOCATION.N))
		(!R3 (COW714.SK COW.N))
		(!R4 (SPOT728.SK (OF.P (K GRASS.N))))
		(!R5 (SPOT728.SK SPOT.N))
		(!R6 (E724.SK (RIGHT-AFTER U177)))
		(!R7 (E187 (ORIENTS E731.SK)))
		(!R8 (FIELD719.SK FIELD.N))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((COW714.SK
              (OUT.ADV
               ((ADV-A (TO.P FIELD719.SK)) ((ADV-A (FROM.P ?L1)) GO.4951.V)))
              FIELD719.SK)
             ** E720.SK)
	(:ROLES
		(!R1 (COW714.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (FIELD719.SK LOCATION.N))
		(!R4 (NOT (?L1 = FIELD719.SK)))
		(!R5 (COW714.SK COW.N))
		(!R6 (FIELD719.SK FIELD.N))
		(!R7 (E185 (ORIENTS E720.SK)))
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
		(!W5 (?G1 CAUSE.V E720.SK))
		(!W6 (E720.SK (BEFORE NOW176)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (8.0 0.3)
(EPI-SCHEMA ((COW714.SK EAT.4981.V GRASS735.SK) ** E732.SK)
	(:ROLES
		(!R1 (COW714.SK AGENT.N))
		(!R2 (GRASS735.SK FOOD.N))
		(!R3 (COW714.SK COW.N))
		(!R4 (GRASS735.SK GRASS.N))
		(!R5 (E732.SK (RIGHT-AFTER U178)))
		(!R6 (E188 (ORIENTS E736.SK)))
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
		(!W3 (E732.SK CAUSE.V ?P1))
		(!W4 (E732.SK (SAME-TIME NOW179)))
		(!W5 (E736.SK (BEFORE NOW179)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; found chains:
; 	chain 0:
;		((COW714.SK
     ;(OUT.ADV ((ADV-A (TO.P FIELD719.SK)) ((ADV-A (FROM.P ?L1)) GO.4951.V)))
     ;FIELD719.SK)
    ;** E720.SK)
;		((COW714.SK FIND.4921.V SPOT728.SK) ** E724.SK)
;		((COW714.SK EAT.4981.V GRASS735.SK) ** E732.SK)
;learned chain schema:
(setf chain-matches (append chain-matches (list '(EPI-SCHEMA ((?X_C
                                                               GO_FIND_EAT.5041.PR
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
   (?X_C (OUT.ADV ((ADV-A (TO.P ?X_A)) ((ADV-A (FROM.P ?L1)) GO.4951.V))) ?X_A))
		(?E2 (?X_C FIND.4921.V ?X_B))
		(?E3 (?X_C EAT.4981.V ?X_D))
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
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((CAT742.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE748.SK)) GO.5073.V))
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
		(!R8 (CAT755.SK (PERTAIN-TO CAT742.SK)))
		(!R9 (CAT755.SK CAT.N))
		(!R10 (CAT755.SK NICE.A))
		(!R11 (E190 (ORIENTS E749.SK)))
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
		(!W5 (?G1 CAUSE.V E749.SK))
		(!W6 (E749.SK (BEFORE NOW181)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 37:
	; "A girl went to play with her friends."
	; "She went across the street."
	; "The parents went over to get her."
	; "She was lost."
	; "They found her in their home."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((THEY.PRO ((ADV-A (IN.P FRIEND769.SK)) FIND.5222.V) SHE.PRO) **
             E783.SK)
	(:ROLES
		(!R1 (THEY.PRO AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (FRIEND769.SK (PLUR FRIEND.N)))
		(!R4 (FRIEND769.SK HOME.N))
		(!R5 (SHE.PRO FEMALE.A))
		(!R6 (SHE.PRO AGENT.N))
		(!R7 (FRIEND769.SK (PERTAIN-TO THEY.PRO)))
		(!R8 (FRIEND769.SK (PERTAIN-TO GIRL765.SK)))
		(!R9 (GIRL765.SK GIRL.N))
		(!R10 (E198 (ORIENTS E783.SK)))
	)
	(:PRECONDS
		(?I1 (THEY.PRO (AT.P ?L)))
		(?I2 (SHE.PRO (AT.P ?L)))
		(?I3 (THEY.PRO ((ADV-A (FOR.P SHE.PRO)) SEARCH.V)))
		(?I4 (NOT (THEY.PRO (KNOW.V (THAT (SHE.PRO (AT.P ?L)))))))
		(?I5 (NOT (THEY.PRO (HAVE.V SHE.PRO))))
	)
	(:POSTCONDS
		(?P1 (THEY.PRO (KNOW.V (THAT (SHE.PRO (AT.P ?L))))))
		(?P2 (THEY.PRO (HAVE.V SHE.PRO)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E783.SK (BEFORE NOW189)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((GIRL765.SK
              ((ADV-A (FOR.P (KA ((ADV-A (WITH.P FRIEND769.SK)) PLAY.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.5282.V)))
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
		(!R9 (E194 (ORIENTS E770.SK)))
		(!R10 (FRIEND769.SK (PERTAIN-TO THEY.PRO)))
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
		(!W5 (?G1 CAUSE.V E770.SK))
		(!W6 (E770.SK (BEFORE NOW185)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 38:
	; "Fred wanted a phone."
	; "He never had had one before."
	; "So he went and got one."
	; "But when he turned it on it didn't work."
	; "He was duped."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((FRED.NAME GET.5342.V PRED?797.SK (AT.P-ARG ?L)) ** E799.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (PRED?797.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (FRED.NAME = PRED?797.SK)))
		(!R5 (PHONE787.SK PHONE.N))
		(!R6 (E199 (ORIENTS E790.SK)))
		(!R7 (PRED?797.SK PRED?.N))
		(!R8 (E201 (ORIENTS E795.SK)))
		(!R9 (E800.SK (AT-OR-BEFORE NOW192)))
		(!R10 (E202 (ORIENTS E800.SK)))
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
)))
(setf matches (append matches '( (10.0 0)
(EPI-SCHEMA ((FRED.NAME ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.5372.V))
              ?L2)
             ** E798.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (PHONE787.SK PHONE.N))
		(!R6 (E199 (ORIENTS E790.SK)))
		(!R7 (E201 (ORIENTS E795.SK)))
		(!R8 (E800.SK (AT-OR-BEFORE NOW192)))
		(!R9 (E202 (ORIENTS E800.SK)))
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
		(!W5 (E790.SK CAUSE.V E798.SK))
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
)))

; found chains:
; 	chain 0:
;		((FRED.NAME ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L)) GO.5372.V)) ?L) **
   ; E798.SK)
;		((FRED.NAME GET.5342.V PRED?797.SK (AT.P-ARG ?L2)) ** E799.SK)
;learned chain schema:
(setf chain-matches (append chain-matches (list '(EPI-SCHEMA ((?X_A
                                                               GO_GET_NIL.5492.PR
                                                               ?L ?X_B)
                                                              ** ?E)
	(:ROLES
		(!R1 (?X_B INANIMATE_OBJECT.N))
		(!R2 (?X_B PRED?.N))
		(!R3 (?X_A AGENT.N))
		(!R4 (NOT (?X_A = ?X_B)))
	)
	(:PRECONDS
		(?I1 (?X_A (AT.P ?L1_2)))
		(?I2 (NOT (?X_A (AT.P ?L))))
	)
	(:STEPS
		(?E1 (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L)) GO.5372.V)) ?L))
		(?E2 (?X_A GET.5342.V ?X_B (AT.P-ARG ?L2)))
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
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((LOGAN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P PARK806.SK)) GO.5493.V))
              PARK806.SK)
             ** E805.SK)
	(:ROLES
		(!R1 (LOGAN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (PARK806.SK LOCATION.N))
		(!R4 (NOT (?L1 = PARK806.SK)))
		(!R5 (PARK806.SK PARK.N))
		(!R6 (E105 (ORIENTS E805.SK)))
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
		(!W5 (?G1 CAUSE.V E805.SK))
		(!W6 (E805.SK (AT-ABOUT NOW195)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (5.0 0.2)
(EPI-SCHEMA ((LOGAN.NAME
              ((ADV-A (IN.P SAND808.SK)) ((ADV-A (WITH.P ?T)) PLAY.5523.V)) ?G)
             ** E809.SK)
	(:ROLES
		(!R1 (LOGAN.NAME AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (?G GAME.N))
		(!R5 (SAND808.SK SAND.N))
		(!R6 (E210 (ORIENTS E809.SK)))
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
)))

; story 40:
	; "The boy walked the dog."
	; "The dog saw a cat."
	; "The dog chased after the cat."
	; "The boy had to let go of the dog."
	; "The dog ran away after the cat."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((BOY816.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P DOG818.SK)) WALK.5703.V))
              DOG818.SK)
             ** E815.SK)
	(:ROLES
		(!R1 (BOY816.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (DOG818.SK LOCATION.N))
		(!R4 (NOT (?L1 = DOG818.SK)))
		(!R5 (DOG818.SK DOG.N))
		(!R6 (BOY816.SK BOY.N))
		(!R7 (E815.SK (RIGHT-AFTER U199)))
		(!R8 (E209 (ORIENTS E823.SK)))
	)
	(:GOALS
		(?G1 (BOY816.SK (WANT.V (KA ((ADV-A (AT.P DOG818.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BOY816.SK (AT.P ?L1)))
		(?I2 (NOT (BOY816.SK (AT.P DOG818.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT (BOY816.SK (AT.P ?L1))))
		(?P2 (BOY816.SK (AT.P DOG818.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E815.SK))
		(!W2 (?I2 BEFORE E815.SK))
		(!W3 (?P1 AFTER E815.SK))
		(!W4 (?P2 AFTER E815.SK))
		(!W5 (?G1 CAUSE.V E815.SK))
		(!W6 (E815.SK (SAME-TIME NOW200)))
		(!W7 (E823.SK (BEFORE NOW200)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 41:
	; "The boy got ready for church."
	; "He did not want to go."
	; "He hid in his closet."
	; "His mom found him."
	; "His mom made him go to church."
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((BOY843.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.5853.V
              (KA (WANT.V (KA GO.V))))
             ** ?E)
	(:ROLES
		(!R1 (BOY843.SK AGENT.N))
		(!R2 ((KA (WANT.V (KA GO.V))) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (BOY843.SK BOY.N))
		(!R5 (E222 (ORIENTS E845.SK)))
		(!R6 (CLOSET849.SK (PERTAIN-TO BOY843.SK)))
		(!R7 (CLOSET849.SK CLOSET.N))
		(!R8 (MOM852.SK (PERTAIN-TO BOY843.SK)))
		(!R9 (MOM852.SK MOM.N))
	)
	(:GOALS
		(?G1 (BOY843.SK (WANT.V (THAT (NOT (BOY843.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (BOY843.SK (DO.V (KA (WANT.V (KA GO.V)))))) CAUSE.V
    (KE (BOY843.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E845.SK (NOT (BOY843.SK (DO.V (KA (WANT.V (KA GO.V)))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E845.SK))
		(!W2 (E845.SK (BEFORE NOW206)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 42:
	; "The fly landed on the wall."
	; "The man tried to hit it."
	; "The fly got away."
	; "The man woke up his son."
	; "His son got the fly."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((FLY858.SK (AWAY.ADV GET.5943.V) ?O (AT.P-ARG ?L)) ** E876.SK)
	(:ROLES
		(!R1 (FLY858.SK AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (FLY858.SK = ?O)))
		(!R5 (FLY858.SK FLY.N))
		(!R6 (E228 (ORIENTS E876.SK)))
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
)))

; story 43:
	; "My friend came to visit me."
	; "She brought her young son with her."
	; "He was a cute little boy."
	; "We gave him some toys to play with."
	; "We had a great visit."

; story 44:
	; "There was a penny on the ground."
	; "My son went to pick it up."
	; "I told him not to get it."
	; "The penny was lying tails up."
	; "We left the penny right there."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((SON913.SK
              ((ADV-A (FOR.P (KA (PICK_UP.V PENNY910.SK))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.6273.V)))
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
		(!R12 (E237 (ORIENTS E915.SK)))
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
		(!W5 (?G1 CAUSE.V E912.SK))
		(!W6 (E912.SK (SAME-TIME NOW221)))
		(!W7 (E915.SK (BEFORE NOW221)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 45:
	; "The man found a bag on the ground."
	; "He looked inside."
	; "It was groceries."
	; "He brought them home."
	; "He made his wife dinner with them."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((MAN930.SK ((ADV-A (ON.P GROUND933.SK)) FIND.6453.V) BAG932.SK) **
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
		(!R9 (E241 (ORIENTS E935.SK)))
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
)))

; story 46:
	; "I have a cat."
	; "My cat is very mean."
	; "It does not like my other cats."
	; "It fights with my other cats."
	; "I might have to get rid of it."

; story 47:
	; "I went to the store today."
	; "I saw some chips."
	; "They were six dollars."
	; "It was too expensive."
	; "So I did not buy them."
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((ME980.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.6753.V
              (KA (BUY.V CHIP974.SK)))
             ** ?E)
	(:ROLES
		(!R1 ((KA (BUY.V CHIP974.SK)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (ME980.SK AGENT.N))
		(!R4 (CHIP974.SK (PLUR CHIP.N)))
		(!R5 (E255 (ORIENTS E979.SK)))
	)
	(:GOALS
		(?G1 (ME980.SK (WANT.V (THAT (NOT (ME980.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME980.SK (DO.V (KA (BUY.V CHIP974.SK))))) CAUSE.V
    (KE (ME980.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E979.SK (NOT (ME980.SK (DO.V (KA (BUY.V CHIP974.SK))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E979.SK))
		(!W2 (E979.SK (BEFORE NOW239)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME980.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TODAY969.SK)) GO.6783.V))
              TODAY969.SK)
             ** E970.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (TODAY969.SK LOCATION.N))
		(!R3 (NOT (?L1 = TODAY969.SK)))
		(!R4 (TODAY969.SK ((NN STORE.N) TODAY.N)))
		(!R5 (ME980.SK AGENT.N))
		(!R6 (E246 (ORIENTS E970.SK)))
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
		(!W5 (?G1 CAUSE.V E970.SK))
		(!W6 (E970.SK (BEFORE NOW235)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 48:
	; "The family was going on a cruise."
	; "They were excited."
	; "It was ten days long."
	; "They went on the cruise."
	; "They had a great time."

; story 49:
	; "Jacob has long hair."
	; "He wants to get it cut."
	; "He heads down to the barber."
	; "He has his hair cut."
	; "Jacob loves his new hair."

; story 50:
	; "I wanted to run twenty miles after work."
	; "I had to hurry."
	; "It was about to be dark."
	; "I made it to 12 miles."
	; "Then I had to stop."

; story 51:
	; "Lynn gets a new dog."
	; "She loves her dog."
	; "She is out one evening walking him."
	; "Her dog runs off away from her."
	; "She cannot catch him and he runs away."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((LYNN.NAME GET.7383.V DOG1025.SK (AT.P-ARG ?L)) ** E1026.SK)
	(:ROLES
		(!R1 (LYNN.NAME AGENT.N))
		(!R2 (DOG1025.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (LYNN.NAME = DOG1025.SK)))
		(!R5 (DOG1025.SK DOG.N))
		(!R6 (DOG1025.SK NEW.A))
		(!R7 (E266 (ORIENTS E1026.SK)))
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
)))

; story 52:
	; "Michael was very shy."
	; "He would only play by himself."
	; "One day I asked him to play with me."
	; "We have been friends ever since."
	; "Michael is my best friend."

; story 53:
	; "Susie tried on the dress."
	; "She found it very uncomfortable."
	; "She wasn't sure she wanted to even wear it."
	; "Susie put it away."
	; "She never wore it again."

; story 54:
	; "It was very hot outside."
	; "So we wanted to go where it was cool."
	; "We walked into the building."
	; "But then we walked out."
	; "The building was far too cold."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((WE1071.SK
              ((ADV-A (INTO.P BUILDING1065.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) WALK.7533.V)))
              ?L2)
             ** E1066.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (WE1071.SK AGENT.N))
		(!R5 (BUILDING1065.SK BUILDING.N))
		(!R6 (E290 (ORIENTS E1066.SK)))
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
		(!W5 (?G1 CAUSE.V E1066.SK))
		(!W6 (E1066.SK (BEFORE NOW272)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 55:
	; "Sam's cat ran away one day."
	; "Sam never got along with it."
	; "He tried to look for a day or two."
	; "Sam quickly gave up the search."
	; "He got a new cat instead."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((HE.PRO GET.7683.V CAT1090.SK (AT.P-ARG ?L)) ** E1091.SK)
	(:ROLES
		(!R1 (CAT1090.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = CAT1090.SK)))
		(!R4 (CAT1090.SK CAT.N))
		(!R5 (CAT1090.SK NEW.A))
		(!R6 (HE.PRO MALE.A))
		(!R7 (HE.PRO AGENT.N))
		(!R8 (E297 (ORIENTS E1091.SK)))
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
)))

; story 56:
	; "Tom was out for a walk."
	; "It started to rain."
	; "His socks got wet."
	; "Tom felt gross about it."
	; "He went home and changed."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A HOME.N)
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.7833.V)))
              ?L2)
             ** E1100.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (SOCKS1097.SK (PLUR SOCK.N)))
		(!R6 (SOCKS1097.SK (PERTAIN-TO TOM.NAME)))
		(!R7 (E302 (ORIENTS E1100.SK)))
		(!R8 (E1101.SK (AT-OR-BEFORE NOW284)))
		(!R9 (E285 (ORIENTS E1101.SK)))
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
		(!W5 (?G1 CAUSE.V E1100.SK))
		(!W6 (E1100.SK (BEFORE NOW284)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 57:
	; "Tim got in the car."
	; "He started the car."
	; "He turned out of his street."
	; "He saw a red light."
	; "He stopped."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((TIM.NAME ((ADV-A (IN.P CAR1104.SK)) GET.8013.V) ?O (AT.P-ARG ?L))
             ** E1106.SK)
	(:ROLES
		(!R1 (TIM.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TIM.NAME = ?O)))
		(!R5 (CAR1104.SK CAR.N))
		(!R6 (E303 (ORIENTS E1106.SK)))
		(!R7 (STREET1111.SK (PERTAIN-TO TIM.NAME)))
		(!R8 (STREET1111.SK STREET.N))
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
)))

; story 58:
	; "The man found the answer."
	; "He told everyone he could."
	; "People did not like the answer."
	; "They got angry at the man."
	; "They hung the man in the street."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((MAN1120.SK FIND.8133.V ANSWER1122.SK) ** E1119.SK)
	(:ROLES
		(!R1 (MAN1120.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (ANSWER1122.SK ANSWER.N))
		(!R4 (MAN1120.SK MAN.N))
		(!R5 (E1119.SK (RIGHT-AFTER U289)))
		(!R6 (STREET1134.SK STREET.N))
		(!R7 (MAN1120.SK (IN.P STREET1134.SK)))
		(!R8 (E309 (ORIENTS E1124.SK)))
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
)))

; story 59:
	; "I took it the harness off the cat."
	; "The cat did not want to go back inside."
	; "I took the cat outside."
	; "We bought the cat a harness."
	; "The cat always liked to go outside."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME1159.SK ((ADV-A (OFF.P CAT1139.SK)) TAKE.8253.V) IT.PRO
              (AT.P-ARG ?L))
             ** E1140.SK)
	(:ROLES
		(!R1 (IT.PRO INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1159.SK = IT.PRO)))
		(!R4 (CAT1139.SK CAT.N))
		(!R5 (HARNESS1138.SK HARNESS.N))
		(!R6 (ME1159.SK AGENT.N))
		(!R7 (E314 (ORIENTS E1140.SK)))
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
)))
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((CAT1139.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.8313.V
              (KA (WANT.V (KA (INSIDE.ADV (BACK.ADV GO.V))))))
             ** ?E)
	(:ROLES
		(!R1 (CAT1139.SK AGENT.N))
		(!R2 ((KA (WANT.V (KA (INSIDE.ADV (BACK.ADV GO.V))))) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (CAT1139.SK CAT.N))
		(!R5 (E315 (ORIENTS E1144.SK)))
	)
	(:GOALS
		(?G1 (CAT1139.SK (WANT.V (THAT (NOT (CAT1139.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (CAT1139.SK (DO.V (KA (WANT.V (KA (INSIDE.ADV (BACK.ADV GO.V))))))))
    CAUSE.V (KE (CAT1139.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1144.SK
   (NOT (CAT1139.SK (DO.V (KA (WANT.V (KA (INSIDE.ADV (BACK.ADV GO.V)))))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E1144.SK))
		(!W2 (E1144.SK (BEFORE NOW296)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 60:
	; "I used to run around a pond."
	; "It was there one fall."
	; "The next fall it had vanished."
	; "There was nothing but dirt."
	; "I was surprised."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((ME1172.SK
              ((ADV-A (FOR.P (KA ((ADV-A (AROUND.P OBJECT1161.SK)) RUN.V))))
               ((ADV-A (TO.P ME1172.SK)) GIVE.8403.V))
              ME1172.SK ?O)
             ** E1162.SK)
	(:ROLES
		(!R1 (?O INANIMATE_OBJECT.N))
		(!R2 (E319 (ORIENTS E1162.SK)))
		(!R3 (ME1172.SK AGENT.N))
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
)))

; story 61:
	; "My dog was dreaming."
	; "It was lying on the floor."
	; "Then it jumped up quickly."
	; "My dog let out a bark."
	; "I had never seen her do that before."

; story 62:
	; "My brother had a goldfish."
	; "The fish let him pet it."
	; "He put his finger in the water."
	; "The fish swam up to him."
	; "And he pet the fish."

; story 63:
	; "Bob loves to fish."
	; "He got up early one morning."
	; "He got his fishing pole ready."
	; "Next he walked to the lake."
	; "Bob caught a big fish."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P LAKE1216.SK)) WALK.8883.V))
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
		(!R9 (E338 (ORIENTS E1217.SK)))
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
		(!W5 (?G1 CAUSE.V E1217.SK))
		(!W6 (E1217.SK (BEFORE NOW318)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 64:
	; "Martha wanted to go to the fair."
	; "So off she went."
	; "When she got there she met her friends."
	; "They had fun."
	; "They stayed for three hours."

; story 65:
	; "I was hanging out with my friend."
	; "He pulled in front of my car."
	; "I went off the road."
	; "There was mud flying."
	; "Then I got back in front."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((FRIEND1237.SK
              ((ADV-A (OFF.P ROAD1244.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.9213.V)))
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
		(!R8 (E348 (ORIENTS E1245.SK)))
		(!R9 (CAR1241.SK (PERTAIN-TO ME.PRO)))
		(!R10 (CAR1241.SK CAR.N))
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
		(!W5 (?G1 CAUSE.V E1245.SK))
		(!W6 (E1245.SK (BEFORE NOW327)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 66:
	; "I turned on the fan."
	; "It would not work."
	; "I saw that it was unplugged."
	; "I plugged the fan back in."
	; "The fan blew wind in the room."

; story 67:
	; "Tom used to have his own boat."
	; "He had to sell it."
	; "Now he just comes out on my boat."
	; "We have such a great time together."
	; "Now I have someone to help me clean my boat."

; story 68:
	; "The man was crying."
	; "His friend asked why."
	; "The man would not answer."
	; "The friend asked again."
	; "The man lashed out in anger."

; story 69:
	; "The man smiled."
	; "The woman noticed."
	; "The woman smiled back."
	; "The man did not notice."
	; "The woman felt silly."
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((MAN1291.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.9813.V
              (KA NOTICE.V))
             ** ?E)
	(:ROLES
		(!R1 (MAN1291.SK AGENT.N))
		(!R2 ((KA NOTICE.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (MAN1291.SK MAN.N))
		(!R5 (E369 (ORIENTS E1298.SK)))
	)
	(:GOALS
		(?G1 (MAN1291.SK (WANT.V (THAT (NOT (MAN1291.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN1291.SK (DO.V (KA NOTICE.V)))) CAUSE.V
    (KE (MAN1291.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1298.SK (NOT (MAN1291.SK (DO.V (KA NOTICE.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E1298.SK))
		(!W2 (E1298.SK (BEFORE NOW348)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 70:
	; "The man shook his head."
	; "The woman asked why."
	; "The man would not answer."
	; "The woman walked away."
	; "The man looked dejected."

; story 71:
	; "Last week we had a beach day."
	; "It was great."
	; "I was really looking forward to it."
	; "When we went it was very hot."
	; "I jumped in right away."

; story 72:
	; "The girl blinked her eyes."
	; "The boy blinked back at her."
	; "This was a game they had."
	; "The game could not stay tied."
	; "The girl blinked back at the boy."

; story 73:
	; "The kids went out in the rain."
	; "They become very wet."
	; "One of the kids got too cold."
	; "The kids went back inside."
	; "They all dried off."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((KIDS1349.SK
              ((ADV-A (IN.P RAIN1351.SK))
               (OUT.ADV
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.10413.V))))
              ?L2)
             ** E1348.SK)
	(:ROLES
		(!R1 (KIDS1349.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (RAIN1351.SK RAIN.N))
		(!R6 (KIDS1349.SK (PLUR KID.N)))
		(!R7 (E1348.SK (RIGHT-AFTER U364)))
		(!R8 (E1359.SK (= KIDS1349.SK)))
		(!R9 (E388 (ORIENTS E1352.SK)))
	)
	(:GOALS
		(?G1 (KIDS1349.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (KIDS1349.SK (AT.P ?L1)))
		(?I2 (NOT (KIDS1349.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (KIDS1349.SK (AT.P ?L1))))
		(?P2 (KIDS1349.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1348.SK))
		(!W2 (?I2 BEFORE E1348.SK))
		(!W3 (?P1 AFTER E1348.SK))
		(!W4 (?P2 AFTER E1348.SK))
		(!W5 (?G1 CAUSE.V E1348.SK))
		(!W6 (E1348.SK (SAME-TIME NOW365)))
		(!W7 (E1352.SK (BEFORE NOW365)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 74:
	; "My friends and I were running."
	; "I was behind the group."
	; "I sprinted to try to catch up."
	; "They all ran faster than me."
	; "I came in last place."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((ME1371.SK
              ((ADV-A (FOR.P (KA (TRY.V (KA CATCH_UP.V)))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) SPRINT.10443.V)))
              ?L2)
             ** E1366.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (ME1371.SK AGENT.N))
		(!R5 (FRIEND1362.SK (PLUR FRIEND.N)))
		(!R6 (FRIEND1362.SK (PERTAIN-TO ME1371.SK)))
		(!R7 (E395 (ORIENTS E1366.SK)))
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
		(!W5 (?G1 CAUSE.V E1366.SK))
		(!W6 (E1366.SK (BEFORE NOW372)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 75:
	; "I was eating with my friends."
	; "We were about to go to someone's house."
	; "I was out of gas."
	; "And I did not know the way."
	; "They had to wait on me."
(setf matches (append matches '( (7.0 0.2)
(EPI-SCHEMA ((ME1383.SK ((ADV-A (WITH.P FRIEND1375.SK)) EAT.10593.V) ?F) **
             E1373.SK)
	(:ROLES
		(!R1 (?F FOOD.N))
		(!R2 (FRIEND1375.SK (PLUR FRIEND.N)))
		(!R3 (FRIEND1375.SK (PERTAIN-TO ME1383.SK)))
		(!R4 (ME1383.SK AGENT.N))
		(!R5 (E398 (ORIENTS E1373.SK)))
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
		(!W3 (E1373.SK CAUSE.V ?P1))
		(!W4 (E1373.SK (BEFORE NOW375)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.0 0.2)
(EPI-SCHEMA ((ME1383.SK FEED.10623.V ME1383.SK ?F) ** ?E)
	(:ROLES
		(!R1 (?F FOOD.N))
		(!R2 (NOT (ME1383.SK = ME1383.SK)))
		(!R3 (NOT (ME1383.SK = ?F)))
		(!R4 (E398 (ORIENTS E1373.SK)))
		(!R5 (ME1383.SK AGENT.N))
		(!R6 (FRIEND1375.SK (PERTAIN-TO ME1383.SK)))
		(!R7 (FRIEND1375.SK (PLUR FRIEND.N)))
	)
	(:GOALS
		(?G1 (ME1383.SK (WANT.V (THAT (NOT (ME1383.SK HUNGRY.A))))))
		(?G2
   (ME1383.SK
    (WANT.V (THAT (ME1383.SK ((ADV-A (WITH.P FRIEND1375.SK)) EAT.V) ?F)))))
	)
	(:PRECONDS
		(?I1 (ME1383.SK HAVE.V ?F))
		(?I2 (ME1383.SK HUNGRY.A))
	)
	(:STEPS
		(E1373.SK (ME1383.SK ((ADV-A (WITH.P FRIEND1375.SK)) EAT.V) ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (ME1383.SK (HAVE.V ?F))))
		(?P2 (NOT (ME1383.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1373.SK AFTER ?E))
		(!W2 (E1373.SK (BEFORE NOW375)))
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
)))
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((ME.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.10713.V
              (KA (KNOW.V WAY1380.SK)))
             ** ?E)
	(:ROLES
		(!R1 (ME.PRO AGENT.N))
		(!R2 ((KA (KNOW.V WAY1380.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (WAY1380.SK WAY.N))
		(!R5 (E401 (ORIENTS E1381.SK)))
	)
	(:GOALS
		(?G1 (ME.PRO (WANT.V (THAT (NOT (ME.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (ME.PRO (DO.V (KA (KNOW.V WAY1380.SK))))) CAUSE.V
    (KE (ME.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1381.SK (NOT (ME.PRO (DO.V (KA (KNOW.V WAY1380.SK))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E1381.SK))
		(!W2 (E1381.SK (BEFORE NOW378)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 76:
	; "Tom was dogsitting for a friend."
	; "He accidentally let it out."
	; "The dog ran away."
	; "It was never seen again."
	; "Tom had to buy them a new dog."

; story 77:
	; "Allie went to the store."
	; "She saw candy on sale."
	; "It looked great."
	; "She got sour candy."
	; "She got five bags."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ALLIE.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE1396.SK)) GO.10923.V))
              STORE1396.SK)
             ** E1397.SK)
	(:ROLES
		(!R1 (ALLIE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE1396.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE1396.SK)))
		(!R5 (STORE1396.SK STORE.N))
		(!R6 (E408 (ORIENTS E1397.SK)))
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
		(!W5 (?G1 CAUSE.V E1397.SK))
		(!W6 (E1397.SK (BEFORE NOW385)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 78:
	; "Suzy got a new sweatshirt."
	; "She was not sure she liked it."
	; "Sure enough, she did not."
	; "It was too big."
	; "Suzy wanted to give it away."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((SUZY.NAME GET.11043.V SWEATSHIRT1407.SK (AT.P-ARG ?L)) **
             E1408.SK)
	(:ROLES
		(!R1 (SUZY.NAME AGENT.N))
		(!R2 (SWEATSHIRT1407.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (SUZY.NAME = SWEATSHIRT1407.SK)))
		(!R5 (E414 (ORIENTS E1408.SK)))
		(!R6 (SWEATSHIRT1407.SK SWEATSHIRT.N))
		(!R7 (SWEATSHIRT1407.SK NEW.A))
		(!R8 (E419 (ORIENTS E1414.SK)))
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
)))

; story 79:
	; "I once saw a wolf."
	; "I was walking in the woods when I saw him."
	; "He was patrolling the woods."
	; "He was so big."
	; "I ran home very quickly."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((ME1428.SK
              (VERY.ADV
               (QUICKLY.ADV
                (HOME.ADV
                 ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.11253.V)))))
              ?L2)
             ** E1427.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (ME1428.SK AGENT.N))
		(!R5 (E425 (ORIENTS E1427.SK)))
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
		(!W5 (?G1 CAUSE.V E1427.SK))
		(!W6 (E1427.SK (BEFORE NOW399)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 80:
	; "Last night I was super tired."
	; "I really wanted to sleep."
	; "But I could not."
	; "So i stayed awake."
	; "It was torture."

; story 81:
	; "The man planted a tree."
	; "The tree grew to be very tall."
	; "One day their was a big storm."
	; "A branch fell from the tree."
	; "It broke a window of the man's house."
(setf matches (append matches '( (10.0 0.1)
(EPI-SCHEMA ((BRANCH1450.SK
              ((ADV-A (FROM.P TREE1440.SK)) ((ADV-A (TO.P ?L2)) FALL.11493.V))
              ?L2)
             ** E1453.SK)
	(:ROLES
		(!R1 (BRANCH1450.SK AGENT.N))
		(!R2 (TREE1440.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (TREE1440.SK = ?L2)))
		(!R5 (TREE1440.SK TREE.N))
		(!R6 (BRANCH1450.SK BRANCH.N))
		(!R7 (E433 (ORIENTS E1453.SK)))
	)
	(:GOALS
		(?G1 (BRANCH1450.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BRANCH1450.SK (AT.P TREE1440.SK)))
		(?I2 (NOT (BRANCH1450.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (BRANCH1450.SK (AT.P TREE1440.SK))))
		(?P2 (BRANCH1450.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1453.SK))
		(!W2 (?I2 BEFORE E1453.SK))
		(!W3 (?P1 AFTER E1453.SK))
		(!W4 (?P2 AFTER E1453.SK))
		(!W5 (?G1 CAUSE.V E1453.SK))
		(!W6 (E1453.SK (BEFORE NOW408)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 82:
	; "I went to the beach yesterday."
	; "I laid in a hammock."
	; "It was very relaxing."
	; "I fell asleep."
	; "I never wanted to go."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME1472.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P BEACH1463.SK)) ((ADV-A (FROM.P ?L1)) GO.11643.V)))
              BEACH1463.SK)
             ** E1464.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (BEACH1463.SK LOCATION.N))
		(!R3 (NOT (?L1 = BEACH1463.SK)))
		(!R4 (ME1472.SK AGENT.N))
		(!R5 (BEACH1463.SK BEACH.N))
		(!R6 (E435 (ORIENTS E1464.SK)))
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
		(!W5 (?G1 CAUSE.V E1464.SK))
		(!W6 (E1464.SK (BEFORE NOW410)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 83:
	; "The man heard about a tragedy."
	; "He wanted to help."
	; "He called the cops."
	; "He asked if he could help."
	; "They told him to stay out of the way."

; story 84:
	; "John found a kid crying on a bench."
	; "John wanted to cheer him up."
	; "John bought him ice cream."
	; "The kid smiled."
	; "John made a new friend."
(setf matches (append matches '( (5.0 0.3)
(EPI-SCHEMA ((JOHN.NAME MAKE.11973.V FRIEND1505.SK) ** E1506.SK)
	(:ROLES
		(!R1 (JOHN.NAME AGENT.N))
		(!R2 (FRIEND1505.SK INANIMATE_OBJECT.N))
		(!R3 (E445 (ORIENTS E1496.SK)))
		(!R4 (FRIEND1505.SK FRIEND.N))
		(!R5 (FRIEND1505.SK NEW.A))
		(!R6 (E448 (ORIENTS E1506.SK)))
	)
	(:GOALS
		(E1496.SK (JOHN.NAME (WANT.V (THAT (FRIEND1505.SK EXIST.V)))))
		(?G2 (JOHN.NAME (WANT.V (KA (HAVE.V FRIEND1505.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (FRIEND1505.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (FRIEND1505.SK EXIST.V))
		(?P2 (JOHN.NAME (HAVE.V FRIEND1505.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1496.SK (BEFORE NOW421)))
		(!W2 (E1506.SK (BEFORE NOW424)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 85:
	; "The couple worked out."
	; "The woman felt dizzy."
	; "The man sat down with her."
	; "The woman felt sick."
	; "The woman threw up on the man."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((MAN1513.SK
              ((ADV-A (WITH.P SHE.PRO))
               (DOWN.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.12093.V)))))
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
		(!R9 (E451 (ORIENTS E1515.SK)))
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
)))

; story 86:
	; "The man went fishing."
	; "He caught more than his limit."
	; "He kept all of the fish."
	; "He got caught with too many fish."
	; "He had to pay a big fine."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MAN1525.SK GET.12243.V
              (KA
               ((ADV-A
                 (WITH.P
                  (K
                   (L #:G1797347
                    (AND (#:G1797347 (TOO.ADV MANY.A)) (#:G1797347 FISH.N))))))
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
         (L #:G1797347
          (AND (#:G1797347 (TOO.ADV MANY.A)) (#:G1797347 FISH.N))))))
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
          (L #:G1797347
           (AND (#:G1797347 (TOO.ADV MANY.A)) (#:G1797347 FISH.N))))))
       (BE.PASV CATCH.V))))))
		(!R5 (MAN1525.SK MAN.N))
		(!R6 (LIMIT1530.SK LIMIT.N))
		(!R7 (LIMIT1530.SK (PERTAIN-TO MAN1525.SK)))
		(!R8 (E457 (ORIENTS E1534.SK)))
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
             (L #:G1797347
              (AND (#:G1797347 (TOO.ADV MANY.A)) (#:G1797347 FISH.N))))))
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
          (L #:G1797347
           (AND (#:G1797347 (TOO.ADV MANY.A)) (#:G1797347 FISH.N))))))
       (BE.PASV CATCH.V))))))
		(?I2 (MAN1525.SK (AT.P ?L)))
		(?I3
   ((KA
     ((ADV-A
       (WITH.P
        (K
         (L #:G1797347
          (AND (#:G1797347 (TOO.ADV MANY.A)) (#:G1797347 FISH.N))))))
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
         (L #:G1797347
          (AND (#:G1797347 (TOO.ADV MANY.A)) (#:G1797347 FISH.N))))))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MAN1525.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K FISHING.N))) GO.12273.V))
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
		(!R9 (E454 (ORIENTS E1527.SK)))
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
		(!W5 (?G1 CAUSE.V E1524.SK))
		(!W6 (E1524.SK (SAME-TIME NOW430)))
		(!W7 (E1527.SK (BEFORE NOW430)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 87:
	; "We went in a hike in the woods by my house."
	; "The trees were very high."
	; "My brother climbed one of the trees."
	; "We told him to get down."
	; "He fell from the tree."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((WE1562.SK
              ((ADV-A (IN.P HIKE1542.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.12393.V)))
              ?L2)
             ** E1546.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (WE1562.SK AGENT.N))
		(!R5 (HIKE1542.SK HIKE.N))
		(!R6 (E459 (ORIENTS E1546.SK)))
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
		(!W5 (?G1 CAUSE.V E1546.SK))
		(!W6 (E1546.SK (BEFORE NOW435)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 88:
	; "Mark is driving home."
	; "Mark hits a dog in the road."
	; "Mark gets out to see the dog."
	; "The dog is dead."
	; "Mark is sad he killed the dog."

; story 89:
	; "I was sitting in my chair."
	; "I leaned back a little too far."
	; "I heard a tiny crack."
	; "I looked down at my chair."
	; "One of the legs had a crack."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((CHAIR1599.SK
              ((ADV-A (ON.P CHAIR1583.SK))
               ((ADV-A (IN.P CHAIR1583.SK)) SIT.12693.V)))
             ** E1581.SK)
	(:ROLES
		(!R1 (CHAIR1599.SK AGENT.N))
		(!R2 (CHAIR1583.SK INANIMATE_OBJECT.N))
		(!R3 (CHAIR1583.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (CHAIR1583.SK CHAIR.N))
		(!R6 (CHAIR1583.SK (PERTAIN-TO CHAIR1599.SK)))
		(!R7 (CHAIR1599.SK CHAIR.N))
		(!R8 (E470 (ORIENTS E1581.SK)))
		(!R9 (CHAIR1599.SK (PERTAIN-TO ME.PRO)))
	)
	(:GOALS
		(?G1 (CHAIR1599.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (CHAIR1599.SK (AT.P ?L)))
		(?I2 (CHAIR1583.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1581.SK (BEFORE NOW445)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 90:
	; "The boy kicked the rock."
	; "The rock came loose."
	; "It fell down a hill side."
	; "Someone was walking up the hill."
	; "The rock almost hit them."
(setf matches (append matches '( (10.0 0.1)
(EPI-SCHEMA ((ROCK1608.SK
              (LOOSE.ADV
               ((ADV-A (TO.P ?L2))
                ((ADV-A (FROM.P SIDE1613.SK)) COME.12843.V)))
              ?L2)
             ** E1610.SK)
	(:ROLES
		(!R1 (ROCK1608.SK AGENT.N))
		(!R2 (SIDE1613.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (SIDE1613.SK = ?L2)))
		(!R5 (ROCK1608.SK ROCK.N))
		(!R6 (E476 (ORIENTS E1610.SK)))
		(!R7 (SIDE1613.SK ((NN HILL.N) SIDE.N)))
	)
	(:GOALS
		(?G1 (ROCK1608.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ROCK1608.SK (AT.P SIDE1613.SK)))
		(?I2 (NOT (ROCK1608.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (ROCK1608.SK (AT.P SIDE1613.SK))))
		(?P2 (ROCK1608.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1610.SK))
		(!W2 (?I2 BEFORE E1610.SK))
		(!W3 (?P1 AFTER E1610.SK))
		(!W4 (?P2 AFTER E1610.SK))
		(!W5 (?G1 CAUSE.V E1610.SK))
		(!W6 (E1610.SK (BEFORE NOW451)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 91:
	; "A new teacher had a bad class."
	; "The children threw paper."
	; "The paper hit the teacher."
	; "She turned back at the class."
	; "She told them to shut up and sit down."

; story 92:
	; "The baby started to cry."
	; "The mother walked over to the baby."
	; "She saw that the baby was hungry."
	; "She breastfed the baby."
	; "The baby went back to sleep."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((BABY1640.SK
              ((ADV-A (FOR.P (KA SLEEP.V)))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.13173.V)))
              ?L2)
             ** E1654.SK)
	(:ROLES
		(!R1 (BABY1640.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (BABY1640.SK BABY.N))
		(!R6 (E1654.SK (RIGHT-AFTER U463)))
		(!R7 (E489 (ORIENTS E1657.SK)))
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
		(!W5 (?G1 CAUSE.V E1654.SK))
		(!W6 (E1654.SK (SAME-TIME NOW464)))
		(!W7 (E1657.SK (BEFORE NOW464)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 93:
	; "I was driving my grandmother's truck."
	; "She was holding coffee."
	; "I took a sharp turn."
	; "Coffee was all over her lap."
	; "She was nice about it."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME.PRO TAKE.13323.V TURN1666.SK (AT.P-ARG ?L)) ** E1667.SK)
	(:ROLES
		(!R1 (ME.PRO AGENT.N))
		(!R2 (TURN1666.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (ME.PRO = TURN1666.SK)))
		(!R5 (TURN1666.SK TURN.N))
		(!R6 (TURN1666.SK SHARP.A))
		(!R7 (E492 (ORIENTS E1667.SK)))
	)
	(:GOALS
		(?G1 (ME.PRO (WANT.V (THAT (ME.PRO (HAVE.V TURN1666.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME.PRO HAVE.V TURN1666.SK)))
		(?I2 (ME.PRO (AT.P ?L)))
		(?I3 (TURN1666.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (ME.PRO HAVE.V TURN1666.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1667.SK))
		(!W2 (?I1 PRECOND-OF E1667.SK))
		(!W3 (?I2 PRECOND-OF E1667.SK))
		(!W4 (?I3 PRECOND-OF E1667.SK))
		(!W5 (?P1 POSTCOND-OF E1667.SK))
		(!W6 (E1667.SK (BEFORE NOW467)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 94:
	; "The man ran out of gas."
	; "He tried to call for help."
	; "His phone would not work."
	; "He walked ten miles."
	; "He found a gas station."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((MAN1676.SK FIND.13503.V STATION1685.SK) ** E1686.SK)
	(:ROLES
		(!R1 (MAN1676.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (MAN1676.SK MAN.N))
		(!R4 (STATION1685.SK ((NN GAS.N) STATION.N)))
		(!R5 (PHONE1680.SK PHONE.N))
		(!R6 (PHONE1680.SK (PERTAIN-TO MAN1676.SK)))
		(!R7 (E498 (ORIENTS E1686.SK)))
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
)))

; story 95:
	; "Susie got a puppy."
	; "One day she lost it."
	; "She looked everywhere."
	; "Finally she found it."
	; "It was under her bed."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA (((K SUSIE.N) FIND.13653.V PUPPY1688.SK) ** E1697.SK)
	(:ROLES
		(!R1 ((K SUSIE.N) AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (PUPPY1688.SK PUPPY.N))
		(!R4 (E502 (ORIENTS E1697.SK)))
	)
	(:PRECONDS
		(?I1 ((K SUSIE.N) (AT.P ?L)))
		(?I2 (PUPPY1688.SK (AT.P ?L)))
		(?I3 ((K SUSIE.N) ((ADV-A (FOR.P PUPPY1688.SK)) SEARCH.V)))
		(?I4 (NOT ((K SUSIE.N) (KNOW.V (THAT (PUPPY1688.SK (AT.P ?L)))))))
		(?I5 (NOT ((K SUSIE.N) (HAVE.V PUPPY1688.SK))))
	)
	(:POSTCONDS
		(?P1 ((K SUSIE.N) (KNOW.V (THAT (PUPPY1688.SK (AT.P ?L))))))
		(?P2 ((K SUSIE.N) (HAVE.V PUPPY1688.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1697.SK (BEFORE NOW478)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA (((K SUSIE.N) GET.13683.V PUPPY1688.SK (AT.P-ARG ?L)) ** E1689.SK)
	(:ROLES
		(!R1 ((K SUSIE.N) AGENT.N))
		(!R2 (PUPPY1688.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT ((K SUSIE.N) = PUPPY1688.SK)))
		(!R5 (PUPPY1688.SK PUPPY.N))
		(!R6 (E499 (ORIENTS E1689.SK)))
	)
	(:GOALS
		(?G1 ((K SUSIE.N) (WANT.V (THAT ((K SUSIE.N) (HAVE.V PUPPY1688.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT ((K SUSIE.N) HAVE.V PUPPY1688.SK)))
		(?I2 ((K SUSIE.N) (AT.P ?L)))
		(?I3 (PUPPY1688.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 ((K SUSIE.N) HAVE.V PUPPY1688.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1689.SK))
		(!W2 (?I1 PRECOND-OF E1689.SK))
		(!W3 (?I2 PRECOND-OF E1689.SK))
		(!W4 (?I3 PRECOND-OF E1689.SK))
		(!W5 (?P1 POSTCOND-OF E1689.SK))
		(!W6 (E1689.SK (BEFORE NOW475)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 96:
	; "The bird caught a worm."
	; "It took the worm to its nest."
	; "It fed the worm to a baby bird."
	; "The baby bird was still hungry."
	; "The bird caught another worm."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((BIRD1703.SK ((ADV-A (TO.P NEST1711.SK)) TAKE.13863.V) WORM1705.SK
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
		(!R9 (E505 (ORIENTS E1712.SK)))
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
)))

; story 97:
	; "Today I went to school."
	; "It was the first day of school."
	; "I met all my new teachers."
	; "I got all of my homework."
	; "I went home from school."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME1736.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K SCHOOL.N))) GO.13953.V))
              (K SCHOOL.N))
             ** E1727.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K SCHOOL.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K SCHOOL.N))))
		(!R4 (ME1736.SK AGENT.N))
		(!R5 (E509 (ORIENTS E1727.SK)))
		(!R6 (OBJECT1731.SK (PERTAIN-TO ME1736.SK)))
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
		(!W5 (?G1 CAUSE.V E1727.SK))
		(!W6 (E1727.SK (BEFORE NOW485)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 98:
	; "I was in Chicago."
	; "I was singing with a few people."
	; "A man listened to us sing."
	; "He gave us tips."
	; "It was very helpful."
(setf matches (append matches '( (5.5 0.3)
(EPI-SCHEMA ((HE.PRO ((ADV-A (TO.P WE.PRO)) GIVE.14103.V) WE.PRO
              (K (PLUR TIP.N)))
             ** E1743.SK)
	(:ROLES
		(!R1 ((K (PLUR TIP.N)) INANIMATE_OBJECT.N))
		(!R2 (WE.PRO AGENT.N))
		(!R3 (HE.PRO MALE.A))
		(!R4 (HE.PRO AGENT.N))
		(!R5 (E517 (ORIENTS E1743.SK)))
	)
	(:GOALS
		(?G1 (HE.PRO (WANT.V (THAT (WE.PRO (HAVE.V (K (PLUR TIP.N))))))))
	)
	(:PRECONDS
		(?I1 (HE.PRO HAVE.V (K (PLUR TIP.N))))
		(?I2 (NOT (WE.PRO HAVE.V (K (PLUR TIP.N)))))
	)
	(:POSTCONDS
		(?P1 (NOT (HE.PRO HAVE.V (K (PLUR TIP.N)))))
		(?P2 (WE.PRO HAVE.V (K (PLUR TIP.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1743.SK (BEFORE NOW493)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 99:
	; "The tree started to grow."
	; "It was in another tree's shadow."
	; "It needed more sun."
	; "One day the other tree fell."
	; "The tree grew quickly then."

; (setf matches (list))
; (setf chain-matches (list))
; story 0:
	; "Mary wanted to stop working."
	; "She was tired of working."
	; "She met a man with a lot of money."
	; "She married him."
	; "She never had to work again."

; story 1:
	; "Susie say a girl was playing ball."
	; "She wanted to play with her too."
	; "So she went ahead and asked for permission."
	; "The girl said no."
	; "Susie then started to cry."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((GIRL26.SK
              (AHEAD.ADV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.151.V)))
              ?L2)
             ** E30.SK)
	(:ROLES
		(!R1 (GIRL26.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (GIRL26.SK GIRL.N))
		(!R6 (E8 (ORIENTS E28.SK)))
		(!R7 (E35.SK (AT-OR-BEFORE NOW7)))
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
		(!W5 (?G1 CAUSE.V E30.SK))
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
)))

; story 2:
	; "The boy locked the cage."
	; "He left for school."
	; "He returned home."
	; "The cage was unlocked."
	; "He caught his brother playing with his bird."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((BOY43.SK
              (HOME.ADV
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RETURN.301.V)))
              ?L2)
             ** E59.SK)
	(:ROLES
		(!R1 (BOY43.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (BOY43.SK BOY.N))
		(!R6 (E14 (ORIENTS E59.SK)))
		(!R7 (BROTHER71.SK (PERTAIN-TO BOY43.SK)))
		(!R8 (BROTHER71.SK BROTHER.N))
		(!R9 (BIRD72.SK (PERTAIN-TO BOY43.SK)))
		(!R10 (BIRD72.SK BIRD.N))
	)
	(:GOALS
		(?G1 (BOY43.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BOY43.SK (AT.P ?L1)))
		(?I2 (NOT (BOY43.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (BOY43.SK (AT.P ?L1))))
		(?P2 (BOY43.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E59.SK))
		(!W2 (?I2 BEFORE E59.SK))
		(!W3 (?P1 AFTER E59.SK))
		(!W4 (?P2 AFTER E59.SK))
		(!W5 (?G1 CAUSE.V E59.SK))
		(!W6 (E59.SK (BEFORE NOW12)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 3:
	; "The man went to a cafeteria."
	; "He got his lunch."
	; "He sat down by himself."
	; "A woman asked if she could sit down."
	; "The woman became a new friend."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((MAN75.SK
              ((ADV-A (BY.P MAN75.SK))
               (DOWN.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.451.V)))))
             ** E87.SK)
	(:ROLES
		(!R1 (MAN75.SK AGENT.N))
		(!R2 (?S INANIMATE_OBJECT.N))
		(!R3 (?S FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (MAN75.SK MAN.N))
		(!R6 (LUNCH83.SK (PERTAIN-TO MAN75.SK)))
		(!R7 (LUNCH83.SK LUNCH.N))
		(!R8 (E20 (ORIENTS E87.SK)))
	)
	(:GOALS
		(?G1 (MAN75.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (MAN75.SK (AT.P ?L)))
		(?I2 (?S (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E87.SK (BEFORE NOW17)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MAN75.SK GET.481.V LUNCH83.SK (AT.P-ARG ?L)) ** E84.SK)
	(:ROLES
		(!R1 (MAN75.SK AGENT.N))
		(!R2 (LUNCH83.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAN75.SK = LUNCH83.SK)))
		(!R5 (MAN75.SK MAN.N))
		(!R6 (LUNCH83.SK (PERTAIN-TO MAN75.SK)))
		(!R7 (LUNCH83.SK LUNCH.N))
		(!R8 (E19 (ORIENTS E84.SK)))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MAN75.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P CAFETERIA77.SK)) GO.511.V))
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
		(!R10 (E18 (ORIENTS E78.SK)))
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
		(!W5 (?G1 CAUSE.V E74.SK))
		(!W6 (E74.SK (SAME-TIME NOW15)))
		(!W7 (E78.SK (BEFORE NOW15)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 4:
	; "I was sitting in the house."
	; "The garbage started to smell."
	; "It was very bad."
	; "So I had to take it out."
	; "It still did not get rid of the smell."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((ME113.SK
              ((ADV-A (ON.P HOUSE105.SK))
               ((ADV-A (IN.P HOUSE105.SK)) SIT.631.V)))
             ** E104.SK)
	(:ROLES
		(!R1 (HOUSE105.SK INANIMATE_OBJECT.N))
		(!R2 (HOUSE105.SK FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (HOUSE105.SK HOUSE.N))
		(!R5 (ME113.SK AGENT.N))
		(!R6 (E23 (ORIENTS E104.SK)))
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
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 5:
	; "Susie got lost."
	; "She needed a map."
	; "So she looked through her pocket."
	; "She found an old map."
	; "She was relieved."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA (((K SUSIE.N) FIND.811.V MAP129.SK) ** E130.SK)
	(:ROLES
		(!R1 ((K SUSIE.N) AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (MAP129.SK MAP.N))
		(!R4 (MAP129.SK OLD.A))
		(!R5 (E32 (ORIENTS E130.SK)))
	)
	(:PRECONDS
		(?I1 ((K SUSIE.N) (AT.P ?L)))
		(?I2 (MAP129.SK (AT.P ?L)))
		(?I3 ((K SUSIE.N) ((ADV-A (FOR.P MAP129.SK)) SEARCH.V)))
		(?I4 (NOT ((K SUSIE.N) (KNOW.V (THAT (MAP129.SK (AT.P ?L)))))))
		(?I5 (NOT ((K SUSIE.N) (HAVE.V MAP129.SK))))
	)
	(:POSTCONDS
		(?P1 ((K SUSIE.N) (KNOW.V (THAT (MAP129.SK (AT.P ?L))))))
		(?P2 ((K SUSIE.N) (HAVE.V MAP129.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E130.SK (BEFORE NOW28)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 6:
	; "Susie loved chocolate."
	; "So she got a box."
	; "She then decided to go and eat it."
	; "It tasted bad."
	; "She was not happy about it."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((SUSIE.NAME GET.901.V BOX143.SK (AT.P-ARG ?L)) ** E144.SK)
	(:ROLES
		(!R1 (SUSIE.NAME AGENT.N))
		(!R2 (BOX143.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (SUSIE.NAME = BOX143.SK)))
		(!R5 (BOX143.SK BOX.N))
		(!R6 (E35 (ORIENTS E144.SK)))
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
)))

; story 7:
	; "The man was in the dark."
	; "He looked for a flashlight."
	; "He could not find one."
	; "He became frightened."
	; "The power came back on in five minutes."

; story 8:
	; "Jerry has a mouse."
	; "His wife wants to get a cat."
	; "Jerry said no."
	; "His wife got a cat behind his back."
	; "The cat and mouse are best friends."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((WIFE182.SK GET.1112.V CAT191.SK (AT.P-ARG ?L)) ** E192.SK)
	(:ROLES
		(!R1 (WIFE182.SK AGENT.N))
		(!R2 (CAT191.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (WIFE182.SK = CAT191.SK)))
		(!R5 (CAT191.SK CAT.N))
		(!R6 (E46 (ORIENTS E192.SK)))
		(!R7 (E187.SK (RIGHT-AFTER U42)))
		(!R8 (WIFE182.SK WIFE.N))
		(!R9 (CAT184.SK CAT.N))
		(!R10 (WIFE182.SK (PERTAIN-TO JERRY.NAME)))
		(!R11 (E181.SK (RIGHT-AFTER U40)))
		(!R12 (E44 (ORIENTS E185.SK)))
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
)))

; story 9:
	; "The singer worked hard."
	; "She got better."
	; "People noticed her."
	; "She made an album."
	; "The people bought it."
(setf matches (append matches '( (4.0 0.4)
(EPI-SCHEMA ((SINGER195.SK MAKE.1321.V ALBUM200.SK) ** E201.SK)
	(:ROLES
		(!R1 (SINGER195.SK AGENT.N))
		(!R2 (ALBUM200.SK INANIMATE_OBJECT.N))
		(!R3 (SINGER195.SK SINGER.N))
		(!R4 (ALBUM200.SK ALBUM.N))
		(!R5 (E53 (ORIENTS E201.SK)))
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
)))

; story 10:
	; "Travis had a rough life."
	; "He didn't like to talk about it."
	; "He often hid himself."
	; "He stayed in the corner of rooms."
	; "Then someone approached him."
(setf matches (append matches '( (11.0 0.3)
(EPI-SCHEMA (((K SOMEONE.N)
              ((ADV-A (FROM.P CORNER223.SK))
               ((ADV-A (TO.P TRAVIS.NAME)) APPROACH.1561.V))
              TRAVIS.NAME)
             ** E229.SK)
	(:ROLES
		(!R1 ((K SOMEONE.N) AGENT.N))
		(!R2 (CORNER223.SK LOCATION.N))
		(!R3 (TRAVIS.NAME LOCATION.N))
		(!R4 (NOT (CORNER223.SK = TRAVIS.NAME)))
		(!R5 (E59 (ORIENTS E229.SK)))
		(!R6 (CORNER223.SK (OF.P (K (PLUR ROOM.N)))))
		(!R7 (CORNER223.SK CORNER.N))
	)
	(:GOALS
		(?G1 ((K SOMEONE.N) (WANT.V (KA ((ADV-A (AT.P TRAVIS.NAME)) BE.V)))))
	)
	(:PRECONDS
		(?I1 ((K SOMEONE.N) (AT.P CORNER223.SK)))
		(?I2 (NOT ((K SOMEONE.N) (AT.P TRAVIS.NAME))))
	)
	(:POSTCONDS
		(?P1 (NOT ((K SOMEONE.N) (AT.P CORNER223.SK))))
		(?P2 ((K SOMEONE.N) (AT.P TRAVIS.NAME)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E229.SK))
		(!W2 (?I2 BEFORE E229.SK))
		(!W3 (?P1 AFTER E229.SK))
		(!W4 (?P2 AFTER E229.SK))
		(!W5 (?G1 CAUSE.V E229.SK))
		(!W6 (E229.SK (BEFORE NOW54)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 11:
	; "Tom was in a band."
	; "They had very few fans."
	; "They tried to hold a show."
	; "Half a dozen people showed up."
	; "Tom's band still played their heart out."

; story 12:
	; "My son was outside playing."
	; "His best friend came by the house."
	; "They went off on an adventure."
	; "They were gone for quite some time."
	; "They came home before dark."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((FRIEND250.SK
              ((ADV-A (BY.P HOUSE252.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.1801.V)))
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
		(!R13 (E66 (ORIENTS E256.SK)))
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
		(!W5 (?G1 CAUSE.V E249.SK))
		(!W6 (E249.SK (SAME-TIME NOW61)))
		(!W7 (E256.SK (BEFORE NOW61)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 13:
	; "Rose was at the jewelry store."
	; "She wanted to buy a new watch."
	; "She tried on each one."
	; "She liked the rose gold watch the most."
	; "She bought it and wore it home."

; story 14:
	; "Jill bought a new dress."
	; "She tried it on when she got home."
	; "The dress didn't fit."
	; "Jill couldn't find the receipt."
	; "Jill gave the dress to one of her friends."
(setf matches (append matches '( (3.5 0)
(EPI-SCHEMA ((JILL.NAME ((ADV-A (TO.P DRESS299.SK)) GIVE.2101.V) DRESS299.SK
              ?O)
             ** E319.SK)
	(:ROLES
		(!R1 (JILL.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (DRESS299.SK AGENT.N))
		(!R4 (DRESS299.SK NEW.A))
		(!R5 (DRESS299.SK DRESS.N))
		(!R6 (PRED?318.SK PRED?.N))
		(!R7 (E80 (ORIENTS E319.SK)))
	)
	(:GOALS
		(?G1 (JILL.NAME (WANT.V (THAT (DRESS299.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (JILL.NAME HAVE.V ?O))
		(?I2 (NOT (DRESS299.SK HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (JILL.NAME HAVE.V ?O)))
		(?P2 (DRESS299.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E319.SK (BEFORE NOW74)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (7.0 0.2)
(EPI-SCHEMA ((JILL.NAME ((ADV-A (TO.P PRED?318.SK)) FEED.2131.V) DRESS299.SK
              ?F)
             ** E319.SK)
	(:ROLES
		(!R1 (JILL.NAME AGENT.N))
		(!R2 (DRESS299.SK AGENT.N))
		(!R3 (?F FOOD.N))
		(!R4 (NOT (JILL.NAME = DRESS299.SK)))
		(!R5 (NOT (DRESS299.SK = ?F)))
		(!R6 (NOT (JILL.NAME = ?F)))
		(!R7 (DRESS299.SK NEW.A))
		(!R8 (DRESS299.SK DRESS.N))
		(!R9 (PRED?318.SK PRED?.N))
		(!R10 (E80 (ORIENTS E319.SK)))
	)
	(:GOALS
		(?G1 (JILL.NAME (WANT.V (THAT (NOT (DRESS299.SK HUNGRY.A))))))
		(?G2 (JILL.NAME (WANT.V (THAT (DRESS299.SK EAT.V ?F)))))
	)
	(:PRECONDS
		(?I1 (JILL.NAME HAVE.V ?F))
		(?I2 (DRESS299.SK HUNGRY.A))
	)
	(:STEPS
		(?E1 (DRESS299.SK EAT.V ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (JILL.NAME (HAVE.V ?F))))
		(?P2 (NOT (DRESS299.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E319.SK))
		(!W2 (E319.SK (BEFORE NOW74)))
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
)))

; story 15:
	; "I was walking my dog."
	; "I let go of the leash."
	; "I ran after her."
	; "I got a cut on my thigh from a branch."
	; "I still have the scar."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((ME337.SK ((ADV-A (FROM.P BRANCH330.SK)) GET.2161.V) CUT332.SK
              (AT.P-ARG ?L))
             ** E333.SK)
	(:ROLES
		(!R1 (CUT332.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME337.SK = CUT332.SK)))
		(!R4 (CUT332.SK CUT.N))
		(!R5 (BRANCH330.SK BRANCH.N))
		(!R6 (E83 (ORIENTS E333.SK)))
		(!R7 (ME337.SK AGENT.N))
		(!R8 (SCAR335.SK SCAR.N))
		(!R9 (DOG322.SK (PERTAIN-TO ME337.SK)))
		(!R10 (DOG322.SK DOG.N))
		(!R11 (E50 (ORIENTS E336.SK)))
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
)))

; story 16:
	; "The man looked outside."
	; "It was sunny."
	; "The man decided to go for a job."
	; "It started raining."
	; "The man ran home."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((MAN339.SK
              (HOME.ADV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.2341.V)))
              ?L2)
             ** E350.SK)
	(:ROLES
		(!R1 (MAN339.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (MAN339.SK MAN.N))
		(!R6 (E89 (ORIENTS E350.SK)))
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
		(!W5 (?G1 CAUSE.V E350.SK))
		(!W6 (E350.SK (BEFORE NOW84)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 17:
	; "The couple went to a show."
	; "It was too loud for the girl."
	; "She asked to leave."
	; "The boy refused."
	; "The girl left alone."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((COUPLE358.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P SHOW360.SK)) GO.2491.V))
              SHOW360.SK)
             ** E357.SK)
	(:ROLES
		(!R1 (COUPLE358.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (SHOW360.SK LOCATION.N))
		(!R4 (NOT (?L1 = SHOW360.SK)))
		(!R5 (SHOW360.SK SHOW.N))
		(!R6 (COUPLE358.SK COUPLE.N))
		(!R7 (E357.SK (RIGHT-AFTER U84)))
		(!R8 (E90 (ORIENTS E366.SK)))
	)
	(:GOALS
		(?G1 (COUPLE358.SK (WANT.V (KA ((ADV-A (AT.P SHOW360.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (COUPLE358.SK (AT.P ?L1)))
		(?I2 (NOT (COUPLE358.SK (AT.P SHOW360.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT (COUPLE358.SK (AT.P ?L1))))
		(?P2 (COUPLE358.SK (AT.P SHOW360.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E357.SK))
		(!W2 (?I2 BEFORE E357.SK))
		(!W3 (?P1 AFTER E357.SK))
		(!W4 (?P2 AFTER E357.SK))
		(!W5 (?G1 CAUSE.V E357.SK))
		(!W6 (E357.SK (SAME-TIME NOW85)))
		(!W7 (E366.SK (BEFORE NOW85)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 18:
	; "One time I ran out of gas."
	; "Someone saw me."
	; "He went to buy gas for me."
	; "He told me to pay it forward."
	; "I appreciated that."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA (((K SOMEONE.N)
              ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ME389.SK)) BUY.V) (K GAS.N))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.2671.V)))
              ?L2)
             ** E381.SK)
	(:ROLES
		(!R1 ((K SOMEONE.N) AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (ME389.SK AGENT.N))
		(!R6 (E96 (ORIENTS E381.SK)))
	)
	(:GOALS
		(?G1 ((K SOMEONE.N) (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 ((K SOMEONE.N) (AT.P ?L1)))
		(?I2 (NOT ((K SOMEONE.N) (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT ((K SOMEONE.N) (AT.P ?L1))))
		(?P2 ((K SOMEONE.N) (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E381.SK))
		(!W2 (?I2 BEFORE E381.SK))
		(!W3 (?P1 AFTER E381.SK))
		(!W4 (?P2 AFTER E381.SK))
		(!W5 (?G1 CAUSE.V E381.SK))
		(!W6 (E381.SK (BEFORE NOW92)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.5 0)
(EPI-SCHEMA ((ME389.SK ((ADV-A (TO.P (K GAS.N))) APPRECIATE.2731.V) (K GAS.N)
              ?O)
             ** E388.SK)
	(:ROLES
		(!R1 (?O INANIMATE_OBJECT.N))
		(!R2 ((K GAS.N) AGENT.N))
		(!R3 (ME389.SK AGENT.N))
		(!R4 (E97 (ORIENTS E388.SK)))
	)
	(:GOALS
		(?G1 (ME389.SK (WANT.V (THAT ((K GAS.N) (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (ME389.SK HAVE.V ?O))
		(?I2 (NOT ((K GAS.N) HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (ME389.SK HAVE.V ?O)))
		(?P2 ((K GAS.N) HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E388.SK (BEFORE NOW94)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 19:
	; "Sam was feeling bad."
	; "He wasn't sure what it was."
	; "A friend suggested drinking more water."
	; "Sam gave it a try."
	; "It made him feel a bit better."
(setf matches (append matches '( (5.5 0.3)
(EPI-SCHEMA ((SAM.NAME ((ADV-A (TO.P IT399.SK)) GIVE.2791.V) IT399.SK
              TRY395.SK)
             ** E396.SK)
	(:ROLES
		(!R1 (SAM.NAME AGENT.N))
		(!R2 (TRY395.SK INANIMATE_OBJECT.N))
		(!R3 (IT399.SK AGENT.N))
		(!R4 (TRY395.SK TRY.N))
		(!R5 (E102 (ORIENTS E396.SK)))
	)
	(:GOALS
		(?G1 (SAM.NAME (WANT.V (THAT (IT399.SK (HAVE.V TRY395.SK))))))
	)
	(:PRECONDS
		(?I1 (SAM.NAME HAVE.V TRY395.SK))
		(?I2 (NOT (IT399.SK HAVE.V TRY395.SK)))
	)
	(:POSTCONDS
		(?P1 (NOT (SAM.NAME HAVE.V TRY395.SK)))
		(?P2 (IT399.SK HAVE.V TRY395.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E396.SK (BEFORE NOW98)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (7.0 0.4)
(EPI-SCHEMA ((SAM.NAME FEED.2821.V IT399.SK TRY395.SK) ** E396.SK)
	(:ROLES
		(!R1 (SAM.NAME AGENT.N))
		(!R2 (IT399.SK AGENT.N))
		(!R3 (TRY395.SK FOOD.N))
		(!R4 (NOT (SAM.NAME = IT399.SK)))
		(!R5 (NOT (IT399.SK = TRY395.SK)))
		(!R6 (NOT (SAM.NAME = TRY395.SK)))
		(!R7 (TRY395.SK TRY.N))
		(!R8 (E102 (ORIENTS E396.SK)))
	)
	(:GOALS
		(?G1 (SAM.NAME (WANT.V (THAT (NOT (IT399.SK HUNGRY.A))))))
		(?G2 (SAM.NAME (WANT.V (THAT (IT399.SK EAT.V TRY395.SK)))))
	)
	(:PRECONDS
		(?I1 (SAM.NAME HAVE.V TRY395.SK))
		(?I2 (IT399.SK HUNGRY.A))
	)
	(:STEPS
		(?E1 (IT399.SK EAT.V TRY395.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (SAM.NAME (HAVE.V TRY395.SK))))
		(?P2 (NOT (IT399.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E396.SK))
		(!W2 (E396.SK (BEFORE NOW98)))
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
)))

; story 20:
	; "We ordered some food."
	; "It was kind of gross."
	; "It was not what I expected."
	; "I had to throw it away."
	; "I never got it again."

; story 21:
	; "Kelsi was engaged."
	; "She just got a new ring."
	; "She was happy about it."
	; "But it was too small."
	; "She had to get another one."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((KELSI.NAME GET.3121.V RING427.SK (AT.P-ARG ?L)) ** E428.SK)
	(:ROLES
		(!R1 (KELSI.NAME AGENT.N))
		(!R2 (RING427.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (KELSI.NAME = RING427.SK)))
		(!R5 (RING427.SK RING.N))
		(!R6 (RING427.SK NEW.A))
		(!R7 (E112 (ORIENTS E428.SK)))
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
)))

; story 22:
	; "The janitor needed to clean his mop."
	; "He took it to the sink."
	; "He got it out."
	; "He washed it."
	; "He put it away."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((JANITOR437.SK ((ADV-A (TO.P SINK442.SK)) TAKE.3151.V) IT450.SK
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
		(!R9 (E118 (ORIENTS E443.SK)))
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
)))

; story 23:
	; "I had gold earrings."
	; "I wore them everyday."
	; "Then they broke."
	; "I was heartbroken."
	; "Now I had nothing to wear."

; story 24:
	; "It was the girl's first day at school."
	; "She was very nervous."
	; "She went into the classroom."
	; "She saw her friend."
	; "She sat next to her friend."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((SHE.PRO
              ((ADV-A NEXT.A (TO.P FRIEND470.SK))
               ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.3481.V))))
             ** E472.SK)
	(:ROLES
		(!R1 (?S INANIMATE_OBJECT.N))
		(!R2 (?S FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (SHE.PRO FEMALE.A))
		(!R5 (SHE.PRO AGENT.N))
		(!R6 (FRIEND470.SK (PERTAIN-TO SHE.PRO)))
		(!R7 (FRIEND470.SK FRIEND.N))
		(!R8 (E131 (ORIENTS E472.SK)))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (SHE.PRO (AT.P ?L)))
		(?I2 (?S (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E472.SK (BEFORE NOW124)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((SHE.PRO
              ((ADV-A (INTO.P CLASSROOM464.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.3541.V)))
              ?L2)
             ** E466.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (SHE.PRO FEMALE.A))
		(!R5 (SHE.PRO AGENT.N))
		(!R6 (CLASSROOM464.SK CLASSROOM.N))
		(!R7 (E129 (ORIENTS E466.SK)))
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
	(:POSTCONDS
		(?P1 (NOT (SHE.PRO (AT.P ?L1))))
		(?P2 (SHE.PRO (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E466.SK))
		(!W2 (?I2 BEFORE E466.SK))
		(!W3 (?P1 AFTER E466.SK))
		(!W4 (?P2 AFTER E466.SK))
		(!W5 (?G1 CAUSE.V E466.SK))
		(!W6 (E466.SK (BEFORE NOW122)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 25:
	; "Tina was on her way to bed."
	; "She had a late night."
	; "She slept for eight hours."
	; "When she woke up it was ten."
	; "She was two hours late for school."

; story 26:
	; "Susan had a new phone."
	; "She was walking in the woods one day."
	; "She lost her phone."
	; "She got upset."
	; "Then she found it later."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((SUSAN.NAME (LATER.ADV FIND.3811.V) PHONE494.SK) ** E508.SK)
	(:ROLES
		(!R1 (SUSAN.NAME AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (E138 (ORIENTS E495.SK)))
		(!R4 (PHONE494.SK NEW.A))
		(!R5 (PHONE494.SK PHONE.N))
		(!R6 (PHONE494.SK (PERTAIN-TO SUSAN.NAME)))
		(!R7 (E142 (ORIENTS E508.SK)))
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
)))

; story 27:
	; "Susie had the flu."
	; "It made her feel groggy."
	; "So she had to call in sick."
	; "Thankfully work let her off."
	; "But she only got one day."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((SHE.PRO GET.3932.V DAY515.SK (AT.P-ARG ?L)) ** E516.SK)
	(:ROLES
		(!R1 (DAY515.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (SHE.PRO = DAY515.SK)))
		(!R4 (DAY515.SK DAY.N))
		(!R5 (SHE.PRO FEMALE.A))
		(!R6 (SHE.PRO AGENT.N))
		(!R7 (E146 (ORIENTS E516.SK)))
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
)))

; story 28:
	; "The man poured a glass of water."
	; "He looked in the water."
	; "There was something floating in there."
	; "He poured the water out."
	; "He got water in another glass."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((HE.PRO GET.4111.V OBJECT533.SK (AT.P-ARG ?L)) ** E534.SK)
	(:ROLES
		(!R1 (OBJECT533.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = OBJECT533.SK)))
		(!R4 (OBJECT533.SK (= (K WATER.N))))
		(!R5 (HE.PRO MALE.A))
		(!R6 (HE.PRO AGENT.N))
		(!R7 (E152 (ORIENTS E534.SK)))
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
)))

; story 29:
	; "Tom bought a new car."
	; "It was a very fast car."
	; "He thought the car was made to be driven fast."
	; "He drove the car fast."
	; "He had a great time."

; story 30:
	; "The cat was purring."
	; "The cat put its head back down."
	; "The cat had a funny look."
	; "The cat started eating."
	; "I had bought it a different food."

; story 31:
	; "Helen went to a hair stylist."
	; "She wanted a new hair cut."
	; "Stylist has cut her hair too short."
	; "Helen did not like it."
	; "She did not tip him."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((HELEN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STYLIST596.SK)) GO.4561.V))
              STYLIST596.SK)
             ** E597.SK)
	(:ROLES
		(!R1 (HELEN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STYLIST596.SK LOCATION.N))
		(!R4 (NOT (?L1 = STYLIST596.SK)))
		(!R5 (E164 (ORIENTS E597.SK)))
		(!R6 (CUT602.SK ((NN HAIR.N) CUT.N)))
		(!R7 (CUT602.SK NEW.A))
		(!R8 (STYLIST596.SK ((NN HAIR.N) STYLIST.N)))
		(!R9 (STYLIST596.SK HAIR.N))
		(!R10 (STYLIST596.SK (PERTAIN-TO HELEN.NAME)))
		(!R11 (E166 (ORIENTS E603.SK)))
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
		(!W5 (E603.SK CAUSE.V E597.SK))
		(!W6 (E597.SK (BEFORE NOW155)))
		(!W7 (E603.SK (BEFORE NOW156)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (4.5 0.1)
(EPI-SCHEMA ((HELEN.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.4591.V
              (KA (LIKE.V STYLIST596.SK)))
             ** ?E)
	(:ROLES
		(!R1 (HELEN.NAME AGENT.N))
		(!R2 ((KA (LIKE.V STYLIST596.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (CUT602.SK ((NN HAIR.N) CUT.N)))
		(!R5 (CUT602.SK NEW.A))
		(!R6 (E166 (ORIENTS E603.SK)))
		(!R7 (STYLIST596.SK ((NN HAIR.N) STYLIST.N)))
		(!R8 (STYLIST596.SK HAIR.N))
		(!R9 (STYLIST596.SK (PERTAIN-TO HELEN.NAME)))
		(!R10 (E167 (ORIENTS E609.SK)))
	)
	(:GOALS
		(E603.SK (HELEN.NAME (WANT.V (THAT (NOT (HELEN.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (HELEN.NAME (DO.V (KA (LIKE.V STYLIST596.SK))))) CAUSE.V
    (KE (HELEN.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E609.SK (NOT (HELEN.NAME (DO.V (KA (LIKE.V STYLIST596.SK))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E603.SK CAUSE.V E609.SK))
		(!W2 (E603.SK (BEFORE NOW156)))
		(!W3 (E609.SK (BEFORE NOW158)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 32:
	; "John needed clothes."
	; "So he separated his clothes."
	; "He began to wash them."
	; "After washing them he dried them."
	; "John now has clothes."

; story 33:
	; "I had the stairs near me."
	; "They were very loud."
	; "It bothered me."
	; "Thankfully the sound went down."
	; "I was happy about that."

; story 34:
	; "Tom had a day off."
	; "It was warm and nice out."
	; "He invited a bunch of people to the lake."
	; "Everyone turned him down."
	; "Tom went by himself and had fun."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (BY.P HIMSELF.PRO))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.5071.V)))
              ?L2)
             ** E668.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (E184 (ORIENTS E668.SK)))
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
		(!W5 (?G1 CAUSE.V E668.SK))
		(!W6 (E668.SK (BEFORE NOW174)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (4.0 0.4)
(EPI-SCHEMA ((TOM.NAME ((ADV-A (TO.P LAKE658.SK)) INVITE.5101.V) BUNCH660.SK)
             ** E661.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (BUNCH660.SK INANIMATE_OBJECT.N))
		(!R3 (BUNCH660.SK (OF.P (K (PLUR PERSON.N)))))
		(!R4 (BUNCH660.SK BUNCH.N))
		(!R5 (LAKE658.SK LAKE.N))
		(!R6 (E182 (ORIENTS E661.SK)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (BUNCH660.SK EXIST.V)))))
		(?G2 (TOM.NAME (WANT.V (KA (HAVE.V BUNCH660.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (BUNCH660.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (BUNCH660.SK EXIST.V))
		(?P2 (TOM.NAME (HAVE.V BUNCH660.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E661.SK (BEFORE NOW172)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 35:
	; "Tom got home from work."
	; "The cats seemed quite hungry."
	; "He decided to feed them."
	; "His wife told Tom she had just fed them."
	; "Tom took the food back."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((TOM.NAME ((ADV-A (FROM.P (K WORK.N))) GET.5221.V) (K HOME.N)
              (AT.P-ARG ?L))
             ** E672.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 ((K HOME.N) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = (K HOME.N))))
		(!R5 (E186 (ORIENTS E672.SK)))
		(!R6 (WIFE679.SK WIFE.N))
		(!R7 (WIFE679.SK (PERTAIN-TO TOM.NAME)))
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
)))

; story 36:
	; "The dog was in a cage."
	; "He howled all day."
	; "The family got rid of the dog."
	; "The next family let the dog outside."
	; "The dog did not howl at all."

; story 37:
	; "Billy was playing outside."
	; "He tripped over a rock."
	; "Both of his shoes came off."
	; "He picked up both shoes."
	; "He put his shoes back on his feet."
(setf matches (append matches '( (7.0 0.2)
(EPI-SCHEMA ((HE715.SK EAT.5611.V ?F) ** BILLY.NAME)
	(:ROLES
		(!R1 (?F FOOD.N))
		(!R2 (BILLY.NAME ((ADV-A (OVER.P ROCK704.SK)) (BE.PASV TRIP.V))))
		(!R3 (ROCK704.SK ROCK.N))
		(!R4 (SHOE712.SK (PLUR SHOE.N)))
		(!R5 (SHOE712.SK (PERTAIN-TO BILLY.NAME)))
		(!R6 (HE715.SK AGENT.N))
		(!R7 (FOOT713.SK (PLUR FOOT.N)))
		(!R8 (FOOT713.SK (PERTAIN-TO HE715.SK)))
	)
	(:GOALS
		(?G1 (HE715.SK (WANT.V (THAT (NOT (HE715.SK HUNGRY.A))))))
	)
	(:PRECONDS
		(?I1 (HE715.SK HAVE.V ?F))
		(?I2 (HE715.SK HUNGRY.A))
	)
	(:POSTCONDS
		(?P1 (NOT (HE715.SK (HAVE.V ?F))))
		(?P2 (NOT (HE715.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?P1 AFTER BILLY.NAME))
		(!W2 (?I1 BEFORE BILLY.NAME))
		(!W3 (BILLY.NAME CAUSE.V ?P1))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (4.0 0)
(EPI-SCHEMA ((HE715.SK FEED.5642.V ?Y ?F) ** ?E)
	(:ROLES
		(!R1 (?Y AGENT.N))
		(!R2 (?F FOOD.N))
		(!R3 (NOT (HE715.SK = ?Y)))
		(!R4 (NOT (?Y = ?F)))
		(!R5 (NOT (HE715.SK = ?F)))
		(!R6 (HE715.SK AGENT.N))
		(!R7 (FOOT713.SK (PLUR FOOT.N)))
		(!R8 (FOOT713.SK (PERTAIN-TO HE715.SK)))
	)
	(:GOALS
		(?G1 (HE715.SK (WANT.V (THAT (NOT (?Y HUNGRY.A))))))
		(?G2 (HE715.SK (WANT.V (THAT (?Y EAT.V ?F)))))
	)
	(:PRECONDS
		(?I1 (HE715.SK HAVE.V ?F))
		(?I2 (?Y HUNGRY.A))
	)
	(:STEPS
		(BILLY.NAME (?Y EAT.V ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (HE715.SK (HAVE.V ?F))))
		(?P2 (NOT (?Y HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (BILLY.NAME AFTER ?E))
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
		(!S1 ((?X_A<- BILLY.NAME) = ROCK704.SK))
		(!S2 ((?X_B<- BILLY.NAME) = SHOE712.SK))
		(!S3 ((?X_C<- BILLY.NAME) = BILLY.NAME))
		(!S4 ((?Y<- BILLY.NAME) = ?Y))
	)
)
)))

; story 38:
	; "We were sitting at home tonight."
	; "It was quiet."
	; "My wife heard a buzzing sound."
	; "I went and sat near where she heard the sound."
	; "We heard nothing."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((WE736.SK
              ((ADV-A (AT.P (K HOME.N)))
               ((ADV-A (IN.P (K TONIGHT.N)))
                ((ADV-A (ON.P (K TONIGHT.N))) SIT.5731.V))))
             ** E716.SK)
	(:ROLES
		(!R1 ((K TONIGHT.N) INANIMATE_OBJECT.N))
		(!R2 ((K TONIGHT.N) FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (WE736.SK AGENT.N))
		(!R5 (E203 (ORIENTS E716.SK)))
	)
	(:GOALS
		(?G1 (WE736.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (WE736.SK (AT.P ?L)))
		(?I2 ((K TONIGHT.N) (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E716.SK (BEFORE NOW190)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((ME.PRO ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.5761.V)) ?L2)
             ** E731.SK)
	(:ROLES
		(!R1 (ME.PRO AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (E206 (ORIENTS E725.SK)))
		(!R6 (OBJECT726.SK (AT-OR-BEFORE NOW193)))
		(!R7 (OBJECT727.SK (AT-OR-BEFORE NOW193)))
		(!R8 (E192 (ORIENTS OBJECT726.SK)))
		(!R9 (E208 (ORIENTS OBJECT727.SK)))
	)
	(:GOALS
		(?G1 (ME.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (ME.PRO (AT.P ?L1)))
		(?I2 (NOT (ME.PRO (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (ME.PRO (AT.P ?L1))))
		(?P2 (ME.PRO (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E731.SK))
		(!W2 (?I2 BEFORE E731.SK))
		(!W3 (?P1 AFTER E731.SK))
		(!W4 (?P2 AFTER E731.SK))
		(!W5 (?G1 CAUSE.V E731.SK))
		(!W6 (E731.SK (DURING E725.SK)))
		(!W7 (E732.SK (DURING E725.SK)))
		(!W8 (E731.SK (CONSEC E732.SK)))
		(!W9 (E725.SK (BEFORE NOW193)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 39:
	; "We went to the water park yesterday."
	; "It was a wild day."
	; "When we got there the lies were very long."
	; "They were too long."
	; "So we decided to leave."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((WE758.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P PARK741.SK)) ((ADV-A (FROM.P ?L1)) GO.5881.V)))
              PARK741.SK)
             ** E744.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (PARK741.SK LOCATION.N))
		(!R3 (NOT (?L1 = PARK741.SK)))
		(!R4 (PARK741.SK ((NN WATER.N) PARK.N)))
		(!R5 (WE758.SK AGENT.N))
		(!R6 (E210 (ORIENTS E744.SK)))
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
		(!W5 (?G1 CAUSE.V E744.SK))
		(!W6 (E744.SK (BEFORE NOW195)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 40:
	; "I wanted a new rain coat."
	; "I went to the store to find one."
	; "There was a very small selection."
	; "I found a bright pink one."
	; "It was perfect for me."

; story 41:
	; "My dog had puppies."
	; "It was cold outside."
	; "She came into the garage."
	; "She had one puppy outside."
	; "It did not survive."

; story 42:
	; "The man floated down the river."
	; "His boat tipped over."
	; "He swam to the tipped over boat."
	; "He climbed on top of the boat."
	; "He was rescued."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((MAN801.SK
              ((ADV-A (DOWN.P RIVER803.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FLOAT.6331.V)))
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
		(!R10 (E226 (ORIENTS E804.SK)))
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
		(!W5 (?G1 CAUSE.V E800.SK))
		(!W6 (E800.SK (SAME-TIME NOW210)))
		(!W7 (E804.SK (BEFORE NOW210)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 43:
	; "We just bought a new house."
	; "It is so big compared to our other house."
	; "We did need a bigger place."
	; "The kids love the yard."
	; "It is a nice place."

; story 44:
	; "The boy was home alone."
	; "He thought he heard a noise."
	; "He called his mom."
	; "His mom told him to lock up the house."
	; "That made the boy more afraid."

; story 45:
	; "Joseph likes pets."
	; "He has two dogs and three cats."
	; "One day one of the dogs got lost."
	; "Joseph tried to find him very hard."
	; "He finally find him."

; story 46:
	; "Susie got some bad ice cream."
	; "It looked good at first."
	; "Then it melted."
	; "Susie was not pleased."
	; "She didn't want it anymore."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA (((K SUSIE.N) GET.6781.V CREAM872.SK (AT.P-ARG ?L)) ** E876.SK)
	(:ROLES
		(!R1 ((K SUSIE.N) AGENT.N))
		(!R2 (CREAM872.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT ((K SUSIE.N) = CREAM872.SK)))
		(!R5 (CREAM872.SK ((NN ICE.N) CREAM.N)))
		(!R6 (CREAM872.SK BAD.A))
		(!R7 (E246 (ORIENTS E876.SK)))
	)
	(:GOALS
		(?G1 ((K SUSIE.N) (WANT.V (THAT ((K SUSIE.N) (HAVE.V CREAM872.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT ((K SUSIE.N) HAVE.V CREAM872.SK)))
		(?I2 ((K SUSIE.N) (AT.P ?L)))
		(?I3 (CREAM872.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 ((K SUSIE.N) HAVE.V CREAM872.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E876.SK))
		(!W2 (?I1 PRECOND-OF E876.SK))
		(!W3 (?I2 PRECOND-OF E876.SK))
		(!W4 (?I3 PRECOND-OF E876.SK))
		(!W5 (?P1 POSTCOND-OF E876.SK))
		(!W6 (E876.SK (BEFORE NOW230)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((SHE.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.6811.V
              (KA ((ANYMORE.ADV WANT.V) IT.PRO)))
             ** ?E)
	(:ROLES
		(!R1 ((KA ((ANYMORE.ADV WANT.V) IT.PRO)) ACTION.N))
		(!R2 (?D DISPLEASURE.N))
		(!R3 (SHE.PRO FEMALE.A))
		(!R4 (SHE.PRO AGENT.N))
		(!R5 (E250 (ORIENTS E881.SK)))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (NOT (SHE.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (SHE.PRO (DO.V (KA ((ANYMORE.ADV WANT.V) IT.PRO))))) CAUSE.V
    (KE (SHE.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E881.SK (SHE.PRO (ANYMORE.ADV DO.V) (KA ((ANYMORE.ADV WANT.V) IT.PRO))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E881.SK))
		(!W2 (E881.SK (BEFORE NOW234)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 47:
	; "Bill was driving down the road."
	; "He saw his friend Amy walking."
	; "He stopped his car."
	; "He gave her a ride."
	; "Then he went home."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA (((K BILL.N)
              ((ADV-A HOME.N)
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.6931.V)))
              ?L2)
             ** E898.SK)
	(:ROLES
		(!R1 ((K BILL.N) AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (E255 (ORIENTS E898.SK)))
	)
	(:GOALS
		(?G1 ((K BILL.N) (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 ((K BILL.N) (AT.P ?L1)))
		(?I2 (NOT ((K BILL.N) (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT ((K BILL.N) (AT.P ?L1))))
		(?P2 ((K BILL.N) (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E898.SK))
		(!W2 (?I2 BEFORE E898.SK))
		(!W3 (?P1 AFTER E898.SK))
		(!W4 (?P2 AFTER E898.SK))
		(!W5 (?G1 CAUSE.V E898.SK))
		(!W6 (E898.SK (BEFORE NOW239)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (5.5 0.3)
(EPI-SCHEMA (((K BILL.N) ((ADV-A (TO.P CAR893.SK)) GIVE.6961.V) CAR893.SK
              RIDE896.SK)
             ** E897.SK)
	(:ROLES
		(!R1 ((K BILL.N) AGENT.N))
		(!R2 (RIDE896.SK INANIMATE_OBJECT.N))
		(!R3 (CAR893.SK AGENT.N))
		(!R4 (CAR893.SK (PERTAIN-TO (K BILL.N))))
		(!R5 (CAR893.SK CAR.N))
		(!R6 (RIDE896.SK RIDE.N))
		(!R7 (E254 (ORIENTS E897.SK)))
	)
	(:GOALS
		(?G1 ((K BILL.N) (WANT.V (THAT (CAR893.SK (HAVE.V RIDE896.SK))))))
	)
	(:PRECONDS
		(?I1 ((K BILL.N) HAVE.V RIDE896.SK))
		(?I2 (NOT (CAR893.SK HAVE.V RIDE896.SK)))
	)
	(:POSTCONDS
		(?P1 (NOT ((K BILL.N) HAVE.V RIDE896.SK)))
		(?P2 (CAR893.SK HAVE.V RIDE896.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E897.SK (BEFORE NOW238)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 48:
	; "Reese wanted to be more active."
	; "He mostly sat around the house."
	; "He wanted to be more fit."
	; "He started playing one hour outside a day."
	; "He is much more fit now."
(setf matches (append matches '( (5.0 0)
(EPI-SCHEMA ((REESE.NAME
              ((ADV-A (AROUND.P HOUSE901.SK))
               (MOSTLY.ADV
                ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.7111.V)))))
             ** E902.SK)
	(:ROLES
		(!R1 (REESE.NAME AGENT.N))
		(!R2 (?S INANIMATE_OBJECT.N))
		(!R3 (?S FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (E256 (ORIENTS E909.SK)))
		(!R6 (HOUSE901.SK HOUSE.N))
		(!R7 (E257 (ORIENTS E902.SK)))
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
)))

; story 49:
	; "The tree lost its leaves."
	; "That winter it became very cold."
	; "The branches froze."
	; "The tree lost its branches."
	; "The next spring the leaves could not grow back."

; story 50:
	; "Kevin needed some bananas."
	; "He went too the store."
	; "Got some bananas."
	; "He took them home."
	; "Enjoyed himself one."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((HE.PRO TAKE.7231.V THEY.PRO (AT.P-ARG ?L)) ** E953.SK)
	(:ROLES
		(!R1 (THEY.PRO INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = THEY.PRO)))
		(!R4 (HE.PRO MALE.A))
		(!R5 (HE.PRO AGENT.N))
		(!R6 (E267 (ORIENTS E953.SK)))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((KEVIN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE947.SK)) GO.7261.V))
              STORE947.SK)
             ** E949.SK)
	(:ROLES
		(!R1 (KEVIN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE947.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE947.SK)))
		(!R5 (STORE947.SK STORE.N))
		(!R6 (E266 (ORIENTS E949.SK)))
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
		(!W5 (?G1 CAUSE.V E949.SK))
		(!W6 (E949.SK (BEFORE NOW251)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 51:
	; "I was walking back from the store."
	; "It was a hot day."
	; "A man gave me a ride the rest of the way."
	; "He was a little rude to me."
	; "I thanked him anyway."
(setf matches (append matches '( (3.5 0)
(EPI-SCHEMA ((ME973.SK ((ADV-A (TO.P MAN963.SK)) THANK.7321.V) MAN963.SK ?O) **
             E972.SK)
	(:ROLES
		(!R1 (?O INANIMATE_OBJECT.N))
		(!R2 (MAN963.SK AGENT.N))
		(!R3 (MAN963.SK MAN.N))
		(!R4 (ME973.SK AGENT.N))
		(!R5 (E273 (ORIENTS E972.SK)))
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
)))

; story 52:
	; "My friend came to visit."
	; "She wanted to go out."
	; "I asked if she wanted to meet my brothers."
	; "I was in trouble that night."
	; "I didn't find out why until the next day."
(setf matches (append matches '( (10.0 0)
(EPI-SCHEMA ((FRIEND976.SK
              ((ADV-A (FOR.P (KA VISIT.V)))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.7441.V)))
              ?L2)
             ** E975.SK)
	(:ROLES
		(!R1 (FRIEND976.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (E975.SK (RIGHT-AFTER U259)))
		(!R6 (E274 (ORIENTS E978.SK)))
		(!R7 (FRIEND976.SK FRIEND.N))
		(!R8 (FRIEND976.SK (PERTAIN-TO ME989.SK)))
		(!R9 (ME989.SK AGENT.N))
		(!R10 (E275 (ORIENTS E980.SK)))
		(!R11 (BROTHER984.SK (PERTAIN-TO ME989.SK)))
		(!R12 (BROTHER984.SK (PLUR BROTHER.N)))
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
		(!W5 (E980.SK CAUSE.V E975.SK))
		(!W6 (E975.SK (SAME-TIME NOW260)))
		(!W7 (E978.SK (BEFORE NOW260)))
		(!W8 (E980.SK (BEFORE NOW261)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 53:
	; "Dan decided to go to his pond."
	; "He picked up a rock."
	; "It skipped three times."
	; "One rock was too big."
	; "It just made a big splash."
(setf matches (append matches '( (4.0 0.4)
(EPI-SCHEMA ((IT.PRO MAKE.7621.V SPLASH1002.SK) ** E1004.SK)
	(:ROLES
		(!R1 (IT.PRO AGENT.N))
		(!R2 (SPLASH1002.SK INANIMATE_OBJECT.N))
		(!R3 (SPLASH1002.SK SPLASH.N))
		(!R4 (SPLASH1002.SK BIG.A))
		(!R5 (E284 (ORIENTS E1004.SK)))
	)
	(:GOALS
		(?G1 (IT.PRO (WANT.V (THAT (SPLASH1002.SK EXIST.V)))))
		(?G2 (IT.PRO (WANT.V (KA (HAVE.V SPLASH1002.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (SPLASH1002.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (SPLASH1002.SK EXIST.V))
		(?P2 (IT.PRO (HAVE.V SPLASH1002.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1004.SK (BEFORE NOW269)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 54:
	; "The man turned on the light."
	; "The bulb made a noise."
	; "The light went out."
	; "The man replaced the bulb."
	; "Light filled the man's room."
(setf matches (append matches '( (4.0 0.4)
(EPI-SCHEMA ((BULB1012.SK MAKE.7771.V NOISE1014.SK) ** E1011.SK)
	(:ROLES
		(!R1 (BULB1012.SK AGENT.N))
		(!R2 (NOISE1014.SK INANIMATE_OBJECT.N))
		(!R3 (NOISE1014.SK NOISE.N))
		(!R4 (BULB1012.SK BULB.N))
		(!R5 (E1011.SK (RIGHT-AFTER U270)))
		(!R6 (E286 (ORIENTS E1016.SK)))
	)
	(:GOALS
		(?G1 (BULB1012.SK (WANT.V (THAT (NOISE1014.SK EXIST.V)))))
		(?G2 (BULB1012.SK (WANT.V (KA (HAVE.V NOISE1014.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (NOISE1014.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (NOISE1014.SK EXIST.V))
		(?P2 (BULB1012.SK (HAVE.V NOISE1014.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1011.SK (SAME-TIME NOW271)))
		(!W2 (E1016.SK (BEFORE NOW271)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 55:
	; "Ernesto is a cat."
	; "He likes to hunt bugs."
	; "Yesterday there was a fly on top of the desk."
	; "He jumped and caught the fly."
	; "Then Ernesto ate the fly."
(setf matches (append matches '( (8.0 0.3)
(EPI-SCHEMA ((ERNESTO.NAME EAT.7981.V FLY1041.SK) ** E1044.SK)
	(:ROLES
		(!R1 (ERNESTO.NAME AGENT.N))
		(!R2 (FLY1041.SK FOOD.N))
		(!R3 (FLY1041.SK FLY.N))
		(!R4 (E295 (ORIENTS E1044.SK)))
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
		(!W3 (E1044.SK CAUSE.V ?P1))
		(!W4 (E1044.SK (BEFORE NOW279)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 56:
	; "The man hung up the phone."
	; "The woman wondered why."
	; "The woman called him back."
	; "The man didn't answer."
	; "The woman thought she knew why."
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((MAN1049.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.8071.V
              (KA ANSWER.V))
             ** ?E)
	(:ROLES
		(!R1 (MAN1049.SK AGENT.N))
		(!R2 ((KA ANSWER.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (MAN1049.SK MAN.N))
		(!R5 (E299 (ORIENTS E1061.SK)))
	)
	(:GOALS
		(?G1 (MAN1049.SK (WANT.V (THAT (NOT (MAN1049.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN1049.SK (DO.V (KA ANSWER.V)))) CAUSE.V
    (KE (MAN1049.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1061.SK (NOT (MAN1049.SK (DO.V (KA ANSWER.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E1061.SK))
		(!W2 (E1061.SK (BEFORE NOW283)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 57:
	; "It was snowing outside Tom's house one day."
	; "Tom liked playing in the snow."
	; "Tom went outside."
	; "Tom played in the snow."
	; "Tom made a snowman."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((TOM.NAME
              (OUTSIDE.ADV
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.8251.V)))
              ?L2)
             ** E1073.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (HOUSE1067.SK HOUSE.N))
		(!R6 (HOUSE1067.SK (PERTAIN-TO TOM.NAME)))
		(!R7 (E304 (ORIENTS E1073.SK)))
		(!R8 (DAY1068.SK DAY.N))
		(!R9 (HOUSE1067.SK (= DAY1068.SK)))
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
		(!W5 (?G1 CAUSE.V E1073.SK))
		(!W6 (E1073.SK (BEFORE NOW287)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (5.0 0.2)
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (IN.P SNOW1070.SK)) ((ADV-A (WITH.P ?T)) PLAY.8281.V))
              ?G)
             ** E1076.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (?G GAME.N))
		(!R5 (SNOW1070.SK SNOW.N))
		(!R6 (HOUSE1067.SK HOUSE.N))
		(!R7 (HOUSE1067.SK (PERTAIN-TO TOM.NAME)))
		(!R8 (E305 (ORIENTS E1076.SK)))
		(!R9 (DAY1068.SK DAY.N))
		(!R10 (HOUSE1067.SK (= DAY1068.SK)))
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
)))
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((TOM.NAME ((ADV-A (IN.P SNOW1070.SK)) PLAY.8311.V) ?O) ** E1076.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (SNOW1070.SK SNOW.N))
		(!R4 (HOUSE1067.SK HOUSE.N))
		(!R5 (HOUSE1067.SK (PERTAIN-TO TOM.NAME)))
		(!R6 (E305 (ORIENTS E1076.SK)))
		(!R7 (DAY1068.SK DAY.N))
		(!R8 (HOUSE1067.SK (= DAY1068.SK)))
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
)))

; story 58:
	; "Tom was walking."
	; "He suddenly saw a wallet."
	; "He picked it up and tried to find the owner."
	; "He could not find him."
	; "He kept it."

; story 59:
	; "Susie was very hungry."
	; "She didn't get food yet."
	; "Hours went by."
	; "She still hadn't eaten."
	; "She needed something in her system."

; story 60:
	; "John went to the casino last night."
	; "I was a little jealous."
	; "I could not go."
	; "He had a fun night."
	; "He won a little money too."

; story 61:
	; "I wanted to make a cake."
	; "But I didn't want it to be too easy."
	; "So I made a tiramisu."
	; "It was delicious."
	; "But it took forever."
(setf matches (append matches '( (5.0 0.3)
(EPI-SCHEMA ((ME1131.SK MAKE.8941.V TIRAMISU1127.SK) ** E1128.SK)
	(:ROLES
		(!R1 (TIRAMISU1127.SK INANIMATE_OBJECT.N))
		(!R2 (CAKE1123.SK CAKE.N))
		(!R3 (E322 (ORIENTS E1124.SK)))
		(!R4 (ME1131.SK AGENT.N))
		(!R5 (TIRAMISU1127.SK TIRAMISU.N))
		(!R6 (E324 (ORIENTS E1128.SK)))
	)
	(:GOALS
		(E1124.SK (ME1131.SK (WANT.V (THAT (TIRAMISU1127.SK EXIST.V)))))
		(?G2 (ME1131.SK (WANT.V (KA (HAVE.V TIRAMISU1127.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (TIRAMISU1127.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (TIRAMISU1127.SK EXIST.V))
		(?P2 (ME1131.SK (HAVE.V TIRAMISU1127.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1124.SK (BEFORE NOW305)))
		(!W2 (E1128.SK (BEFORE NOW307)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((TIRAMISU1127.SK (FOREVER.ADV TAKE.8973.V) ?O (AT.P-ARG ?L)) **
             E1130.SK)
	(:ROLES
		(!R1 (TIRAMISU1127.SK AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TIRAMISU1127.SK = ?O)))
		(!R5 (TIRAMISU1127.SK TIRAMISU.N))
		(!R6 (E326 (ORIENTS E1130.SK)))
	)
	(:GOALS
		(?G1 (TIRAMISU1127.SK (WANT.V (THAT (TIRAMISU1127.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (NOT (TIRAMISU1127.SK HAVE.V ?O)))
		(?I2 (TIRAMISU1127.SK (AT.P ?L)))
		(?I3 (?O (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (TIRAMISU1127.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1130.SK))
		(!W2 (?I1 PRECOND-OF E1130.SK))
		(!W3 (?I2 PRECOND-OF E1130.SK))
		(!W4 (?I3 PRECOND-OF E1130.SK))
		(!W5 (?P1 POSTCOND-OF E1130.SK))
		(!W6 (E1130.SK (BEFORE NOW309)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 62:
	; "A little Mary was jumping on a couch."
	; "Her mom told her to stop."
	; "Mary did not listen."
	; "She jumped and fell down."
	; "Mary cried."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((MARY.NAME
              (DOWN.ADV
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.9001.V)))
              ?L2)
             ** E1144.SK)
	(:ROLES
		(!R1 (MARY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (MOM1137.SK (PERTAIN-TO MARY.NAME)))
		(!R6 (MOM1137.SK MOM.N))
		(!R7 (E302 (ORIENTS E1144.SK)))
		(!R8 (E1144.SK (AT-OR-BEFORE NOW313)))
		(!R9 (E329 (ORIENTS E1142.SK)))
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
		(!W5 (?G1 CAUSE.V E1144.SK))
		(!W6 (E1142.SK (BEFORE NOW313)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 63:
	; "Jennifer was a little girl."
	; "A man pulled up to her house."
	; "He offered her candy."
	; "Jennifer's brother was with her."
	; "He told her to stay away."
(setf matches (append matches '( (3.5 0)
(EPI-SCHEMA ((MAN1155.SK ((ADV-A (TO.P CANDY1160.SK)) OFFER.9121.V)
              CANDY1160.SK ?O)
             ** E1162.SK)
	(:ROLES
		(!R1 (MAN1155.SK AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (CANDY1160.SK AGENT.N))
		(!R4 (MAN1155.SK MAN.N))
		(!R5 (CANDY1160.SK CANDY.N))
		(!R6 (CANDY1160.SK (PERTAIN-TO JENNIFER.NAME)))
		(!R7 (E334 (ORIENTS E1162.SK)))
		(!R8 (HOUSE1156.SK (PERTAIN-TO JENNIFER.NAME)))
		(!R9 (HOUSE1156.SK HOUSE.N))
		(!R10 (BROTHER1164.SK BROTHER.N))
		(!R11 (BROTHER1164.SK (PERTAIN-TO JENNIFER.NAME)))
	)
	(:GOALS
		(?G1 (MAN1155.SK (WANT.V (THAT (CANDY1160.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (MAN1155.SK HAVE.V ?O))
		(?I2 (NOT (CANDY1160.SK HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1155.SK HAVE.V ?O)))
		(?P2 (CANDY1160.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1162.SK (BEFORE NOW317)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 64:
	; "I went to work yesterday."
	; "I began to cough."
	; "I went into the bathroom to clean up."
	; "I saw that I was very sick."
	; "I went home early from work."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((ME1176.SK
              ((ADV-A HOME.ADV EARLY.A (FROM.P (K WORK.N)))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.9211.V)))
              ?L2)
             ** E1175.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (ME1176.SK AGENT.N))
		(!R5 (E341 (ORIENTS E1175.SK)))
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
		(!W5 (?G1 CAUSE.V E1175.SK))
		(!W6 (E1175.SK (BEFORE NOW324)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 65:
	; "Kris lost her job."
	; "She was sad at first."
	; "She looked for a new job."
	; "She got an interview."
	; "Kris got a new job!"
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((SHE.PRO GET.9361.V INTERVIEW1186.SK (AT.P-ARG ?L)) ** E1187.SK)
	(:ROLES
		(!R1 (INTERVIEW1186.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (SHE.PRO = INTERVIEW1186.SK)))
		(!R4 (SHE.PRO FEMALE.A))
		(!R5 (SHE.PRO AGENT.N))
		(!R6 (INTERVIEW1186.SK INTERVIEW.N))
		(!R7 (E345 (ORIENTS E1187.SK)))
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
)))

; story 66:
	; "Two kids visited their friend's house."
	; "His friend wasn't home."
	; "A big dog was in the yard."
	; "It ran over to the kids."
	; "It bit them right on the hands."

; story 67:
	; "John wanted to get a new pet."
	; "He went to the pound to look for one."
	; "He saw a sad puppy."
	; "John felt deeply for it."
	; "He took him home as his new pet."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((JOHN.NAME ((ADV-A (AS.P OBJECT1230.SK)) TAKE.9601.V) JOHN.NAME
              (AT.P-ARG ?L))
             ** E1231.SK)
	(:ROLES
		(!R1 (JOHN.NAME AGENT.N))
		(!R2 (JOHN.NAME INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (JOHN.NAME = JOHN.NAME)))
		(!R5 (PET1216.SK PET.N))
		(!R6 (PET1216.SK NEW.A))
		(!R7 (E351 (ORIENTS E1217.SK)))
		(!R8 (OBJECT1230.SK (PERTAIN-TO JOHN.NAME)))
		(!R9 (E355 (ORIENTS E1231.SK)))
	)
	(:GOALS
		(E1217.SK (JOHN.NAME (WANT.V (THAT (JOHN.NAME (HAVE.V JOHN.NAME))))))
	)
	(:PRECONDS
		(?I1 (NOT (JOHN.NAME HAVE.V JOHN.NAME)))
		(?I2 (JOHN.NAME (AT.P ?L)))
		(?I3 (JOHN.NAME (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (JOHN.NAME HAVE.V JOHN.NAME))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1231.SK))
		(!W2 (?I1 PRECOND-OF E1231.SK))
		(!W3 (?I2 PRECOND-OF E1231.SK))
		(!W4 (?I3 PRECOND-OF E1231.SK))
		(!W5 (?P1 POSTCOND-OF E1231.SK))
		(!W6 (E1217.SK (BEFORE NOW335)))
		(!W7 (E1231.SK (BEFORE NOW339)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 68:
	; "It didn't matter what he said."
	; "She wasn't going to listen."
	; "She covered her ears with her hands."
	; "She made a loud noise."
	; "He gave up trying to talk."
(setf matches (append matches '( (4.0 0.4)
(EPI-SCHEMA ((SHE1250.SK MAKE.9751.V NOISE1246.SK) ** E1247.SK)
	(:ROLES
		(!R1 (NOISE1246.SK INANIMATE_OBJECT.N))
		(!R2 (SHE1250.SK AGENT.N))
		(!R3 (NOISE1246.SK NOISE.N))
		(!R4 (NOISE1246.SK LOUD.A))
		(!R5 (EAR1239.SK (PERTAIN-TO SHE1250.SK)))
		(!R6 (EAR1239.SK (PLUR EAR.N)))
		(!R7 (HAND1240.SK (PERTAIN-TO SHE1250.SK)))
		(!R8 (HAND1240.SK (PLUR HAND.N)))
		(!R9 (E360 (ORIENTS E1247.SK)))
	)
	(:GOALS
		(?G1 (SHE1250.SK (WANT.V (THAT (NOISE1246.SK EXIST.V)))))
		(?G2 (SHE1250.SK (WANT.V (KA (HAVE.V NOISE1246.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (NOISE1246.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (NOISE1246.SK EXIST.V))
		(?P2 (SHE1250.SK (HAVE.V NOISE1246.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1247.SK (BEFORE NOW343)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 69:
	; "John had his day off."
	; "John wanted to go to the beach."
	; "He got on his car and drove to the beach."
	; "John swam in the water."
	; "John had a good day."
(setf matches (append matches '( (12.0 0)
(EPI-SCHEMA ((JOHN.NAME ((ADV-A (ON.P CAR1262.SK)) GET.9901.V) DAY1272.SK
              (AT.P-ARG ?L))
             ** E1263.SK)
	(:ROLES
		(!R1 (JOHN.NAME AGENT.N))
		(!R2 (DAY1272.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (JOHN.NAME = DAY1272.SK)))
		(!R5 (BEACH1256.SK BEACH.N))
		(!R6 (E363 (ORIENTS E1257.SK)))
		(!R7 (E364 (ORIENTS E1263.SK)))
		(!R8 (E365 (ORIENTS E1264.SK)))
		(!R9 (DAY1272.SK DAY.N))
		(!R10 (DAY1272.SK GOOD.A))
		(!R11 (DAY1254.SK DAY.N))
		(!R12 (DAY1254.SK (PERTAIN-TO JOHN.NAME)))
		(!R13 (CAR1262.SK (PERTAIN-TO JOHN.NAME)))
		(!R14 (CAR1262.SK CAR.N))
		(!R15 (E366 (ORIENTS E1273.SK)))
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
)))

; story 70:
	; "Blake wanted to catch a chick."
	; "There were chicks near a hen."
	; "The chicks could get through the fence."
	; "The hen could not."
	; "He never caught one."

; story 71:
	; "Lucy wanted to skate."
	; "She hadn't done it before."
	; "She decided to take lessons."
	; "On her first lesson she fell."
	; "It would be away until she got good."
(setf matches (append matches '( (10.0 0)
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-S (ON.P LESSON1296.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.10261.V)))
              ?L2)
             ** E1295.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (E371 (ORIENTS E1290.SK)))
		(!R6 (LESSON1296.SK (PERTAIN-TO LUCY.NAME)))
		(!R7 (LESSON1296.SK FIRST.A))
		(!R8 (LESSON1296.SK LESSON.N))
		(!R9 (E1295.SK (RIGHT-AFTER U357)))
		(!R10 (E375 (ORIENTS E1298.SK)))
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
		(!W5 (E1290.SK CAUSE.V E1295.SK))
		(!W6 (E1290.SK (BEFORE NOW355)))
		(!W7 (E1295.SK (SAME-TIME NOW358)))
		(!W8 (E1298.SK (BEFORE NOW358)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 72:
	; "The cat hid in the bush."
	; "The man saw it."
	; "The man called to the cat."
	; "The cat refused to budge."
	; "The man brought the cat inside."

; story 73:
	; "He took the cat to the vet."
	; "The vet called it sick."
	; "The man got some medicine."
	; "The cat took the medicine."
	; "The cat got better."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MAN1329.SK ((ADV-A (TO.P VET1323.SK)) TAKE.10531.V) CAT1322.SK
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
		(!R8 (E382 (ORIENTS E1324.SK)))
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
)))

; story 74:
	; "Susie was new at school."
	; "She was nervous."
	; "She was afraid she would make no friends."
	; "Thankfully she did."
	; "Susie was happy she did."

; story 75:
	; "The cat ran out of food."
	; "I had no more in my house."
	; "I bought some more from the store."
	; "I filled up my cat's bowl of food."
	; "The cat ate his food."
(setf matches (append matches '( (8.0 0.3)
(EPI-SCHEMA ((CAT1364.SK EAT.10681.V FOOD1367.SK) ** E1363.SK)
	(:ROLES
		(!R1 (CAT1364.SK AGENT.N))
		(!R2 (FOOD1367.SK FOOD.N))
		(!R3 (CAT1364.SK CAT.N))
		(!R4 (CAT1349.SK CAT.N))
		(!R5 (FOOD1367.SK (PERTAIN-TO CAT1349.SK)))
		(!R6 (E1363.SK (RIGHT-AFTER U378)))
		(!R7 (E397 (ORIENTS E1368.SK)))
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
		(!W3 (E1363.SK CAUSE.V ?P1))
		(!W4 (E1363.SK (SAME-TIME NOW379)))
		(!W5 (E1368.SK (BEFORE NOW379)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 76:
	; "Lisa was running through the park."
	; "She loved playing with her dog."
	; "They played catch."
	; "At the end she went in the lake."
	; "She loved to swim in it."
(setf matches (append matches '( (10.0 0.1)
(EPI-SCHEMA ((LISA.NAME
              ((ADV-A (THROUGH.P PARK1371.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P END1380.SK)) RUN.10831.V)))
              ?L2)
             ** E1370.SK)
	(:ROLES
		(!R1 (LISA.NAME AGENT.N))
		(!R2 (END1380.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (END1380.SK = ?L2)))
		(!R5 (PARK1371.SK PARK.N))
		(!R6 (E398 (ORIENTS E1370.SK)))
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
	(:POSTCONDS
		(?P1 (NOT (LISA.NAME (AT.P END1380.SK))))
		(?P2 (LISA.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1370.SK))
		(!W2 (?I2 BEFORE E1370.SK))
		(!W3 (?P1 AFTER E1370.SK))
		(!W4 (?P2 AFTER E1370.SK))
		(!W5 (?G1 CAUSE.V E1370.SK))
		(!W6 (E1370.SK (BEFORE NOW380)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 77:
	; "Allie wanted a tattoo."
	; "She really wanted one."
	; "All her friends had one."
	; "So she went to get it done."
	; "But it was very painful."

; story 78:
	; "A man wanted a new car color."
	; "He asked his friends what color."
	; "They said blue."
	; "He took it to the shop."
	; "It got painted blue."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((MAN1398.SK ((ADV-A (TO.P SHOP1409.SK)) TAKE.11131.V) COLOR1403.SK
              (AT.P-ARG ?L))
             ** E1410.SK)
	(:ROLES
		(!R1 (MAN1398.SK AGENT.N))
		(!R2 (COLOR1403.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAN1398.SK = COLOR1403.SK)))
		(!R5 (E409 (ORIENTS E1404.SK)))
		(!R6 (COLOR1403.SK ((NN CAR.N) COLOR.N)))
		(!R7 (COLOR1403.SK NEW.A))
		(!R8 (MAN1398.SK MAN.N))
		(!R9 (SHOP1409.SK SHOP.N))
		(!R10 (E412 (ORIENTS E1410.SK)))
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
)))

; story 79:
	; "Carlton liked to play with all children."
	; "One child was sick however."
	; "His mother told him not to play with him."
	; "And so Carlton listened."
	; "So he did not get sick."

; story 80:
	; "The cat walked into the living room."
	; "There was a ball on the floor."
	; "The cat swatted the ball around."
	; "The cat played with the ball."
	; "The cat liked the ball."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((CAT1422.SK
              ((ADV-A (INTO.P ROOM1425.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) WALK.11431.V)))
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
		(!R8 (E419 (ORIENTS E1426.SK)))
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
		(!W5 (?G1 CAUSE.V E1421.SK))
		(!W6 (E1421.SK (SAME-TIME NOW400)))
		(!W7 (E1426.SK (BEFORE NOW400)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (5.0 0.3)
(EPI-SCHEMA ((CAT1422.SK ((ADV-A (WITH.P BALL1429.SK)) PLAY.11461.V)
              BALL1429.SK)
             ** E1436.SK)
	(:ROLES
		(!R1 (CAT1422.SK AGENT.N))
		(!R2 (BALL1429.SK INANIMATE_OBJECT.N))
		(!R3 (E420 (ORIENTS E1446.SK)))
		(!R4 (CAT1422.SK CAT.N))
		(!R5 (BALL1429.SK BALL.N))
		(!R6 (BALL1429.SK (ON.P FLOOR1430.SK)))
		(!R7 (FLOOR1430.SK FLOOR.N))
		(!R8 (E1436.SK (RIGHT-AFTER U402)))
		(!R9 (E422 (ORIENTS E1440.SK)))
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
)))
(setf matches (append matches '( (5.0 0.3)
(EPI-SCHEMA ((CAT1422.SK ((ADV-A (WITH.P BALL1429.SK)) PLAY.11491.V) ?G) **
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
		(!R10 (E422 (ORIENTS E1440.SK)))
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
)))

; story 81:
	; "The man found a crate."
	; "He couldn't get it open."
	; "He looked for a hammer at home."
	; "He went back to the crate with the hammer."
	; "The crate was gone."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((MAN1448.SK FIND.11611.V CRATE1450.SK) ** E1447.SK)
	(:ROLES
		(!R1 (MAN1448.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (CRATE1450.SK CRATE.N))
		(!R4 (MAN1448.SK MAN.N))
		(!R5 (E1447.SK (RIGHT-AFTER U404)))
		(!R6 (E424 (ORIENTS E1451.SK)))
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
)))

; story 82:
	; "Tom went on a vacation."
	; "He went on a cruise."
	; "It was a ten day trip."
	; "Tom had fun."
	; "Tom wanted to go on another cruise."

; story 83:
	; "The sun set."
	; "The man was still lost."
	; "He felt himself panic."
	; "He controlled the panic."
	; "He waited for help to find him."

; story 84:
	; "Helen bought a nice plant in the store."
	; "She put it into the window at home."
	; "Next morning she wanted to water it."
	; "She found it broken on the floor."
	; "It was her cat."

; story 85:
	; "Kelley stayed up very late."
	; "She wanted to get more work done."
	; "So she loaded up on caffeine."
	; "It worked."
	; "But then she felt sick."

; story 86:
	; "Charles was playing football."
	; "He went out for a pass."
	; "He caught the ball."
	; "But he landed on a window."
	; "He had to let his arm heal."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((CHARLES.NAME
              ((ADV-A (FOR.P PASS1507.SK))
               (OUT.ADV
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.12181.V))))
              ?L2)
             ** E1508.SK)
	(:ROLES
		(!R1 (CHARLES.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (PASS1507.SK PASS.N))
		(!R6 (PASS1507.SK BALL.N))
		(!R7 (E449 (ORIENTS E1508.SK)))
		(!R8 (ARM1517.SK ARM.N))
		(!R9 (ARM1517.SK (PERTAIN-TO CHARLES.NAME)))
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
		(!W5 (?G1 CAUSE.V E1508.SK))
		(!W6 (E1508.SK (BEFORE NOW431)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 87:
	; "The man filled the pool with water."
	; "He jumped in the pool."
	; "The water was cold."
	; "He got out of the pool."
	; "He bought a heater for the water."

; story 88:
	; "Allie was watching a show yesterday."
	; "It was very funny."
	; "Allie laughed out loud."
	; "She didn't know how to keep it in."
	; "She wanted to watch it again."

; story 89:
	; "The doll caught on fire."
	; "The girl thought it was funny."
	; "She watched it burn."
	; "It caught the house on fire."
	; "The whole house burned down."

; story 90:
	; "The dog went outside."
	; "It walked over by the tree."
	; "The dog trotted around the tree."
	; "The dog found a spot."
	; "The dog laid down and took a nap."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((DOG1570.SK FIND.12691.V SPOT1572.SK) ** E1569.SK)
	(:ROLES
		(!R1 (DOG1570.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (SPOT1572.SK SPOT.N))
		(!R4 (DOG1570.SK DOG.N))
		(!R5 (E1569.SK (RIGHT-AFTER U452)))
		(!R6 (E471 (ORIENTS E1573.SK)))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((DOG1575.SK TAKE.12721.V NAP1577.SK (AT.P-ARG ?L)) ** E1579.SK)
	(:ROLES
		(!R1 (DOG1575.SK AGENT.N))
		(!R2 (NAP1577.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (DOG1575.SK = NAP1577.SK)))
		(!R5 (NAP1577.SK NAP.N))
		(!R6 (DOG1575.SK DOG.N))
		(!R7 (E472 (ORIENTS E1574.SK)))
		(!R8 (E1580.SK (AT-OR-BEFORE NOW454)))
		(!R9 (E466 (ORIENTS E1580.SK)))
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
)))
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((DOG1560.SK
              (OUTSIDE.ADV
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.12751.V)))
              ?L2)
             ** E1559.SK)
	(:ROLES
		(!R1 (DOG1560.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (DOG1560.SK DOG.N))
		(!R6 (E468 (ORIENTS E1559.SK)))
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
		(!W5 (?G1 CAUSE.V E1559.SK))
		(!W6 (E1559.SK (BEFORE NOW450)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((DOG1575.SK LAY_DOWN.12781.V ?O) ** E1578.SK)
	(:ROLES
		(!R1 (DOG1575.SK AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (DOG1575.SK DOG.N))
		(!R4 (E472 (ORIENTS E1574.SK)))
		(!R5 (E1580.SK (AT-OR-BEFORE NOW454)))
		(!R6 (E466 (ORIENTS E1580.SK)))
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
)))

; story 91:
	; "Bill got some surprise money."
	; "He didn't know what to do with it."
	; "He asked his dad."
	; "His dad told him to invest it."
	; "He did so."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA (((K BILL.N) GET.12841.V MONEY1584.SK (AT.P-ARG ?L)) ** E1585.SK)
	(:ROLES
		(!R1 ((K BILL.N) AGENT.N))
		(!R2 (MONEY1584.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT ((K BILL.N) = MONEY1584.SK)))
		(!R5 (MONEY1584.SK ((NN SURPRISE.N) MONEY.N)))
		(!R6 (E473 (ORIENTS E1585.SK)))
	)
	(:GOALS
		(?G1 ((K BILL.N) (WANT.V (THAT ((K BILL.N) (HAVE.V MONEY1584.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT ((K BILL.N) HAVE.V MONEY1584.SK)))
		(?I2 ((K BILL.N) (AT.P ?L)))
		(?I3 (MONEY1584.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 ((K BILL.N) HAVE.V MONEY1584.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1585.SK))
		(!W2 (?I1 PRECOND-OF E1585.SK))
		(!W3 (?I2 PRECOND-OF E1585.SK))
		(!W4 (?I3 PRECOND-OF E1585.SK))
		(!W5 (?P1 POSTCOND-OF E1585.SK))
		(!W6 (E1585.SK (BEFORE NOW455)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 92:
	; "There was a knock on the door."
	; "The man inside was busy."
	; "He did not open the door."
	; "There was a louder knock on the door."
	; "The man answered the louder knock."
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((MAN1602.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.13081.V
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
		(!R8 (E480 (ORIENTS E1606.SK)))
		(!R9 (OBJECT1608.SK (ON.P DOOR1600.SK)))
	)
	(:GOALS
		(?G1 (MAN1602.SK (WANT.V (THAT (NOT (MAN1602.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN1602.SK (DO.V (KA (OPEN.V DOOR1600.SK))))) CAUSE.V
    (KE (MAN1602.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1606.SK (NOT (MAN1602.SK (DO.V (KA (OPEN.V DOOR1600.SK))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E1606.SK))
		(!W2 (E1606.SK (BEFORE NOW462)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 93:
	; "Tom got a kitten."
	; "It ran away within days."
	; "Tom never found it."
	; "He got another cat."
	; "By the time Tom's kitten returned he had forgotten about it."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((TOM.NAME (NEVER.ADV FIND.13171.V) IT.PRO) ** E1626.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (TOM.NAME (PERTAIN-TO TOM.NAME)))
		(!R4 (TOM.NAME KITTEN.N))
		(!R5 (E485 (ORIENTS E1626.SK)))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((TOM.NAME GET.13201.V KITTEN1621.SK (AT.P-ARG ?L)) ** E1622.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (KITTEN1621.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = KITTEN1621.SK)))
		(!R5 (KITTEN1621.SK KITTEN.N))
		(!R6 (TOM.NAME (PERTAIN-TO TOM.NAME)))
		(!R7 (TOM.NAME KITTEN.N))
		(!R8 (E483 (ORIENTS E1622.SK)))
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
)))

; story 94:
	; "The man sat down on the ground."
	; "He was tired of walking."
	; "He took out his water bottle."
	; "It was empty."
	; "The man had to keep walking to find water."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((MAN1634.SK
              (DOWN.ADV
               ((ADV-A (IN.P GROUND1636.SK))
                ((ADV-A (ON.P GROUND1636.SK)) SIT.13291.V))))
             ** E1633.SK)
	(:ROLES
		(!R1 (MAN1634.SK AGENT.N))
		(!R2 (GROUND1636.SK INANIMATE_OBJECT.N))
		(!R3 (GROUND1636.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (GROUND1636.SK GROUND.N))
		(!R6 (MAN1634.SK MAN.N))
		(!R7 (E1633.SK (RIGHT-AFTER U469)))
		(!R8 (BOTTLE1642.SK (PERTAIN-TO MAN1634.SK)))
		(!R9 (BOTTLE1642.SK ((NN WATER.N) BOTTLE.N)))
		(!R10 (E488 (ORIENTS E1637.SK)))
	)
	(:GOALS
		(?G1 (MAN1634.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (MAN1634.SK (AT.P ?L)))
		(?I2 (GROUND1636.SK (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1633.SK (SAME-TIME NOW470)))
		(!W2 (E1637.SK (BEFORE NOW470)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 95:
	; "It was cold in my house."
	; "I looked for a blanket."
	; "The one I found was too small."
	; "I found a bigger blanket."
	; "I covered myself with the blanket."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((ME1669.SK FIND.13471.V BLANKET1664.SK) ** E1665.SK)
	(:ROLES
		(!R1 (?L LOCATION.N))
		(!R2 (ME1669.SK AGENT.N))
		(!R3 (BLANKET1664.SK BIGGER.A))
		(!R4 (BLANKET1664.SK BLANKET.N))
		(!R5 (HOUSE1651.SK (PERTAIN-TO ME1669.SK)))
		(!R6 (HOUSE1651.SK HOUSE.N))
		(!R7 (E500 (ORIENTS E1665.SK)))
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
)))

; story 96:
	; "Magee was only good at running."
	; "He loved to run all the time."
	; "One day he ran far away from home."
	; "Magee was never seen again."
	; "Some say Magee is still running today."

; story 97:
	; "Mitchell couldn't get to sleep."
	; "He tried to watch tv."
	; "That didn't help."
	; "He then decided to lay down."
	; "He fell right asleep."

; story 98:
	; "Simon called his dog."
	; "The dog did not come."
	; "He yelled his dogs name."
	; "His mom heard him."
	; "His mom found his dog."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((MOM1708.SK FIND.13801.V DOG1697.SK) ** E1711.SK)
	(:ROLES
		(!R1 (MOM1708.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (DOG1697.SK DOG.N))
		(!R4 (MOM1708.SK MOM.N))
		(!R5 (DOG1697.SK (PERTAIN-TO SIMON.NAME)))
		(!R6 (DOG1697.SK (PERTAIN-TO HE1717.SK)))
		(!R7 (MOM1708.SK (PERTAIN-TO HE1717.SK)))
		(!R8 (HE1717.SK AGENT.N))
		(!R9 (E1711.SK (RIGHT-AFTER U493)))
		(!R10 (NAME1705.SK (PERTAIN-TO HE1717.SK)))
		(!R11 (NAME1705.SK ((NN (PLUR DOG.N)) NAME.N)))
		(!R12 (E516 (ORIENTS E1716.SK)))
	)
	(:PRECONDS
		(?I1 (MOM1708.SK (AT.P ?L)))
		(?I2 (DOG1697.SK (AT.P ?L)))
		(?I3 (MOM1708.SK ((ADV-A (FOR.P DOG1697.SK)) SEARCH.V)))
		(?I4 (NOT (MOM1708.SK (KNOW.V (THAT (DOG1697.SK (AT.P ?L)))))))
		(?I5 (NOT (MOM1708.SK (HAVE.V DOG1697.SK))))
	)
	(:POSTCONDS
		(?P1 (MOM1708.SK (KNOW.V (THAT (DOG1697.SK (AT.P ?L))))))
		(?P2 (MOM1708.SK (HAVE.V DOG1697.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1711.SK (SAME-TIME NOW494)))
		(!W2 (E1716.SK (BEFORE NOW494)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((DOG1700.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.13861.V (KA COME.V))
             ** ?E)
	(:ROLES
		(!R1 (DOG1700.SK AGENT.N))
		(!R2 ((KA COME.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (DOG1700.SK DOG.N))
		(!R5 (E513 (ORIENTS E1701.SK)))
	)
	(:GOALS
		(?G1 (DOG1700.SK (WANT.V (THAT (NOT (DOG1700.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (DOG1700.SK (DO.V (KA COME.V)))) CAUSE.V
    (KE (DOG1700.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1701.SK (NOT (DOG1700.SK (DO.V (KA COME.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E1701.SK))
		(!W2 (E1701.SK (BEFORE NOW491)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 99:
	; "There was a loud noise outside."
	; "The woman felt scared."
	; "She called a friend."
	; "The friend came over."
	; "They could not find the source of the noise."

; (setf matches (list))
; (setf chain-matches (list))
; story 0:
	; "I was jogging down the road."
	; "My dad lives out of town."
	; "He saw me."
	; "He picked me up."
	; "We went for some Chinese food."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((WE.PRO
              ((ADV-A (FOR.P FOOD20.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.121.V)))
              ?L2)
             ** E21.SK)
	(:ROLES
		(!R1 (WE.PRO AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FOOD20.SK FOOD.N))
		(!R6 (FOOD20.SK CHINESE.A))
		(!R7 (E3 (ORIENTS E21.SK)))
	)
	(:GOALS
		(?G1 (WE.PRO (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (WE.PRO (AT.P ?L1)))
		(?I2 (NOT (WE.PRO (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (WE.PRO (AT.P ?L1))))
		(?P2 (WE.PRO (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E21.SK))
		(!W2 (?I2 BEFORE E21.SK))
		(!W3 (?P1 AFTER E21.SK))
		(!W4 (?P2 AFTER E21.SK))
		(!W5 (?G1 CAUSE.V E21.SK))
		(!W6 (E21.SK (BEFORE NOW4)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 1:
	; "My brother was wearing a hat."
	; "He took it off his head."
	; "He threw it on the floor."
	; "I picked the hat up."
	; "I put it on our hat rack."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((BROTHER27.SK ((ADV-A (OFF.P HEAD31.SK)) TAKE.181.V) IT50.SK
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
		(!R10 (E5 (ORIENTS E34.SK)))
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
)))

; story 2:
	; "The dog was thirsty."
	; "The man brought him water."
	; "The dog followed the man home."
	; "The man fed him."
	; "The dog never left the man's side."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((DOG60.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P MAN64.SK)) FOLLOW.361.V))
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
		(!R10 (E11 (ORIENTS E72.SK)))
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
		(!W5 (?G1 CAUSE.V E67.SK))
		(!W6 (E67.SK (SAME-TIME NOW12)))
		(!W7 (E72.SK (BEFORE NOW12)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 3:
	; "Tom's dog escaped."
	; "Tom asked his friend to help find the dog."
	; "They covered a lot of ground looking."
	; "They never found the dog."
	; "Tom was very upset."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((THEY.PRO (NEVER.ADV FIND.511.V) DOG93.SK) ** E104.SK)
	(:ROLES
		(!R1 (THEY.PRO AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (DOG93.SK DOG.N))
		(!R4 (E16 (ORIENTS E104.SK)))
	)
	(:PRECONDS
		(?I1 (THEY.PRO (AT.P ?L)))
		(?I2 (DOG93.SK (AT.P ?L)))
		(?I3 (THEY.PRO ((ADV-A (FOR.P DOG93.SK)) SEARCH.V)))
		(?I4 (NOT (THEY.PRO (KNOW.V (THAT (DOG93.SK (AT.P ?L)))))))
		(?I5 (NOT (THEY.PRO (HAVE.V DOG93.SK))))
	)
	(:POSTCONDS
		(?P1 (THEY.PRO (KNOW.V (THAT (DOG93.SK (AT.P ?L))))))
		(?P2 (THEY.PRO (HAVE.V DOG93.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E104.SK (BEFORE NOW18)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 4:
	; "Lucy wanted to play accordion."
	; "She came for her first lesson."
	; "Lucy was very tiny."
	; "She put accordion on her lap."
	; "She felt a big pain in her knees."
(setf matches (append matches '( (10.0 0)
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-A (FOR.P OBJECT110.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.691.V)))
              ?L2)
             ** E111.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (E18 (ORIENTS E108.SK)))
		(!R6 (OBJECT110.SK (PERTAIN-TO LUCY.NAME)))
		(!R7 (E19 (ORIENTS E111.SK)))
		(!R8 (LAP116.SK (PERTAIN-TO LUCY.NAME)))
		(!R9 (LAP116.SK LAP.N))
		(!R10 (KNEE125.SK (PERTAIN-TO LUCY.NAME)))
		(!R11 (KNEE125.SK (PLUR KNEE.N)))
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
		(!W5 (E108.SK CAUSE.V E111.SK))
		(!W6 (E108.SK (BEFORE NOW20)))
		(!W7 (E111.SK (BEFORE NOW21)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 5:
	; "Joe had run out of dish soap."
	; "So Joe went to the store."
	; "He found the best soap."
	; "Bought the best soap and took it home."
	; "Joe no longer needed soap."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((JOE.NAME
              ((ADV-A OUT.P (OF.P (K ((NN DISH.N) SOAP.N))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.781.V)))
              ?L2)
             ** E130.SK)
	(:ROLES
		(!R1 (JOE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (E136.SK (IMPINGES-ON E130.SK)))
		(!R6 (E23 (ORIENTS E130.SK)))
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
		(!W5 (?G1 CAUSE.V E130.SK))
		(!W6 (E130.SK (BEFORE NOW25)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((JOE.NAME FIND.841.V SOAP146.SK) ** E147.SK)
	(:ROLES
		(!R1 (JOE.NAME AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (SOAP146.SK SOAP.N))
		(!R4 (SOAP146.SK BEST.A))
		(!R5 (E26 (ORIENTS E147.SK)))
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
)))

; story 6:
	; "The man turned it on."
	; "It did not respond."
	; "The man unplugged it."
	; "He took it apart."
	; "He could never get that thing to work."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((HE.PRO TAKE.901.V IT.PRO (AT.P-ARG ?L)) ** E181.SK)
	(:ROLES
		(!R1 (IT.PRO INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = IT.PRO)))
		(!R4 (HE.PRO MALE.A))
		(!R5 (HE.PRO AGENT.N))
		(!R6 (E33 (ORIENTS E181.SK)))
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
)))
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((IT.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.931.V (KA RESPOND.V)) **
             ?E)
	(:ROLES
		(!R1 (IT.PRO AGENT.N))
		(!R2 ((KA RESPOND.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (E31 (ORIENTS E166.SK)))
	)
	(:GOALS
		(?G1 (IT.PRO (WANT.V (THAT (NOT (IT.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (IT.PRO (DO.V (KA RESPOND.V)))) CAUSE.V
    (KE (IT.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E166.SK (NOT (IT.PRO (DO.V (KA RESPOND.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E166.SK))
		(!W2 (E166.SK (BEFORE NOW31)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 7:
	; "The dog went outside in the yard."
	; "There was something new in the yard."
	; "The dog sniffed it."
	; "The dog went inside it and slept."
	; "The dog liked its new dog house."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((DOG185.SK
              ((ADV-A (IN.P YARD187.SK))
               (OUTSIDE.ADV
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.1051.V))))
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
		(!R9 (E34 (ORIENTS E188.SK)))
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
		(!W5 (?G1 CAUSE.V E184.SK))
		(!W6 (E184.SK (SAME-TIME NOW35)))
		(!W7 (E188.SK (BEFORE NOW35)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 8:
	; "The man filled up his backpack."
	; "He tried it on."
	; "It felt too heavy."
	; "He took the backpack off."
	; "He took some of the stuff out of the backpack."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((HE.PRO TAKE.1201.V BACKPACK219.SK (AT.P-ARG ?L)) ** E220.SK)
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
		(!R10 (E43 (ORIENTS E220.SK)))
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
)))

; story 9:
	; "I live on a bay."
	; "One day I went swimming."
	; "I saw a dark shadow in the water."
	; "It was a few feet long."
	; "I hope it was not an alligator."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((DAY231.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K SWIMMING.N))) GO.1381.V))
              (K SWIMMING.N))
             ** E232.SK)
	(:ROLES
		(!R1 (DAY231.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K SWIMMING.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K SWIMMING.N))))
		(!R5 (DAY231.SK DAY.N))
		(!R6 (DAY231.SK (= ME241.SK)))
		(!R7 (ME241.SK AGENT.N))
		(!R8 (E45 (ORIENTS E232.SK)))
	)
	(:GOALS
		(?G1 (DAY231.SK (WANT.V (KA ((ADV-A (AT.P (K SWIMMING.N))) BE.V)))))
	)
	(:PRECONDS
		(?I1 (DAY231.SK (AT.P ?L1)))
		(?I2 (NOT (DAY231.SK (AT.P (K SWIMMING.N)))))
	)
	(:POSTCONDS
		(?P1 (NOT (DAY231.SK (AT.P ?L1))))
		(?P2 (DAY231.SK (AT.P (K SWIMMING.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E232.SK))
		(!W2 (?I2 BEFORE E232.SK))
		(!W3 (?P1 AFTER E232.SK))
		(!W4 (?P2 AFTER E232.SK))
		(!W5 (?G1 CAUSE.V E232.SK))
		(!W6 (E232.SK (BEFORE NOW46)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 10:
	; "I had a great time."
	; "There were plenty of people there."
	; "I had to find skates that fit."
	; "It was cold inside."
	; "This was at the ice rink."

; story 11:
	; "Ben's dog Skip was very old."
	; "One day Skip got sick."
	; "Ben took Skip to the vet."
	; "The vet told ben that it was Skip's time."
	; "Ben sadly put Skip down."

; story 12:
	; "Tom loved fast boats."
	; "He got into racing."
	; "It was pretty dangerous."
	; "Tom flipped his boat once."
	; "He gave up racing after that."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((TOM.NAME ((ADV-A (INTO.P (K (PLUR RACING.N)))) GET.1651.V) ?O
              (AT.P-ARG ?L))
             ** E278.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = ?O)))
		(!R5 (E65 (ORIENTS E278.SK)))
		(!R6 (BOAT283.SK (PERTAIN-TO TOM.NAME)))
		(!R7 (BOAT283.SK BOAT.N))
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
)))

; story 13:
	; "Allie felt not so good last night."
	; "She ate too much."
	; "So she had to sleep it off."
	; "Then she woke up."
	; "She felt so much better."

; story 14:
	; "John asked Tom to be his best man."
	; "They met in grade school."
	; "They spent the rest of their school years together."
	; "They were always together."
	; "They are best friends."

; story 15:
	; "I had to take graduation pictures."
	; "I went to a studio."
	; "They gave me a jacket."
	; "They took two pictures."
	; "One of them is on my wall."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME338.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STUDIO326.SK)) GO.1831.V))
              STUDIO326.SK)
             ** E327.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (STUDIO326.SK LOCATION.N))
		(!R3 (NOT (?L1 = STUDIO326.SK)))
		(!R4 (ME338.SK AGENT.N))
		(!R5 (STUDIO326.SK STUDIO.N))
		(!R6 (E80 (ORIENTS E327.SK)))
		(!R7 (WALL337.SK WALL.N))
		(!R8 (WALL337.SK (PERTAIN-TO ME338.SK)))
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
		(!W5 (?G1 CAUSE.V E327.SK))
		(!W6 (E327.SK (BEFORE NOW76)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (5.5 0.3)
(EPI-SCHEMA ((THEY339.SK ((ADV-A (TO.P ME338.SK)) GIVE.1861.V) ME338.SK
              JACKET329.SK)
             ** E330.SK)
	(:ROLES
		(!R1 (JACKET329.SK INANIMATE_OBJECT.N))
		(!R2 (ME338.SK AGENT.N))
		(!R3 (JACKET329.SK JACKET.N))
		(!R4 (THEY339.SK AGENT.N))
		(!R5 (E82 (ORIENTS E330.SK)))
		(!R6 (PRED?336.SK PRED?.N))
		(!R7 (PRED?336.SK (OF.P THEY339.SK)))
		(!R8 (WALL337.SK WALL.N))
		(!R9 (WALL337.SK (PERTAIN-TO ME338.SK)))
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
)))

; story 16:
	; "I was walking down the street."
	; "I saw this guy hanging out."
	; "I noticed he had a watch."
	; "I asked him the time."
	; "He told me it was 5:11."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((ME359.SK
              ((ADV-A (DOWN.P STREET342.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) WALK.1981.V)))
              ?L2)
             ** E341.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (STREET342.SK STREET.N))
		(!R5 (ME359.SK AGENT.N))
		(!R6 (E84 (ORIENTS E341.SK)))
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
		(!W5 (?G1 CAUSE.V E341.SK))
		(!W6 (E341.SK (BEFORE NOW80)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 17:
	; "A homeless man was on the street."
	; "He asked for help."
	; "Tina gave him a helping hand."
	; "He was so thankful."
	; "They both felt really good."
(setf matches (append matches '( (5.5 0.3)
(EPI-SCHEMA ((TINA.NAME ((ADV-A (TO.P MAN360.SK)) GIVE.2131.V) MAN360.SK
              HAND371.SK)
             ** E372.SK)
	(:ROLES
		(!R1 (TINA.NAME AGENT.N))
		(!R2 (HAND371.SK INANIMATE_OBJECT.N))
		(!R3 (MAN360.SK AGENT.N))
		(!R4 (MAN360.SK MAN.N))
		(!R5 (MAN360.SK HOMELESS.A))
		(!R6 (HAND371.SK HAND.N))
		(!R7 (HAND371.SK HELPING.A))
		(!R8 (E94 (ORIENTS E372.SK)))
	)
	(:GOALS
		(?G1 (TINA.NAME (WANT.V (THAT (MAN360.SK (HAVE.V HAND371.SK))))))
	)
	(:PRECONDS
		(?I1 (TINA.NAME HAVE.V HAND371.SK))
		(?I2 (NOT (MAN360.SK HAVE.V HAND371.SK)))
	)
	(:POSTCONDS
		(?P1 (NOT (TINA.NAME HAVE.V HAND371.SK)))
		(?P2 (MAN360.SK HAVE.V HAND371.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E372.SK (BEFORE NOW87)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (7.0 0.4)
(EPI-SCHEMA ((TINA.NAME FEED.2161.V MAN360.SK HAND371.SK) ** E372.SK)
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
		(!R11 (E94 (ORIENTS E372.SK)))
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
)))

; story 18:
	; "I went to Texas last week."
	; "It was very fun."
	; "We had bbq food."
	; "It tasted very good."
	; "I wanted to go back."

; story 19:
	; "Lucy was playing with her doll."
	; "All of the sudden her brother took it."
	; "Lucy started to cry."
	; "She asked for it back."
	; "Lucy needed it back right away."
(setf matches (append matches '( (5.0 0.3)
(EPI-SCHEMA ((LUCY.NAME ((ADV-A (WITH.P DOLL387.SK)) PLAY.2461.V) ?G) **
             E385.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (DOLL387.SK TOY.N))
		(!R3 (DOLL387.SK INANIMATE_OBJECT.N))
		(!R4 (?G GAME.N))
		(!R5 (DOLL387.SK DOLL.N))
		(!R6 (DOLL387.SK (PERTAIN-TO LUCY.NAME)))
		(!R7 (E103 (ORIENTS E385.SK)))
		(!R8 (BROTHER389.SK BROTHER.N))
		(!R9 (BROTHER389.SK (PERTAIN-TO LUCY.NAME)))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((BROTHER389.SK TAKE.2491.V DOLL387.SK (AT.P-ARG ?L)) ** E388.SK)
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
		(!R10 (E104 (ORIENTS E391.SK)))
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
)))
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((LUCY.NAME ((ADV-A (WITH.P DOLL387.SK)) PLAY.2521.V) ?O) **
             E385.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (DOLL387.SK DOLL.N))
		(!R4 (DOLL387.SK (PERTAIN-TO LUCY.NAME)))
		(!R5 (E103 (ORIENTS E385.SK)))
		(!R6 (BROTHER389.SK BROTHER.N))
		(!R7 (BROTHER389.SK (PERTAIN-TO LUCY.NAME)))
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
)))

; story 20:
	; "Lewis didn't do his homework."
	; "He had to go to summer school."
	; "He liked the teacher."
	; "They became good friends."
	; "Lewis learned a lot at summer school."
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((LEWIS.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.2611.V
              (KA (DO.V HOMEWORK399.SK)))
             ** ?E)
	(:ROLES
		(!R1 (LEWIS.NAME AGENT.N))
		(!R2 ((KA (DO.V HOMEWORK399.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (HOMEWORK399.SK (PERTAIN-TO LEWIS.NAME)))
		(!R5 (HOMEWORK399.SK HOMEWORK.N))
		(!R6 (E108 (ORIENTS E398.SK)))
	)
	(:GOALS
		(?G1 (LEWIS.NAME (WANT.V (THAT (NOT (LEWIS.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (LEWIS.NAME (DO.V (KA (DO.V HOMEWORK399.SK))))) CAUSE.V
    (KE (LEWIS.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E398.SK (NOT (LEWIS.NAME (DO.V (KA (DO.V HOMEWORK399.SK))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E398.SK))
		(!W2 (E398.SK (BEFORE NOW100)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 21:
	; "I had some wine a while ago."
	; "I wanted to like it."
	; "But it tasted so bad."
	; "I wanted to vomit."
	; "I never wanted to drink again."

; story 22:
	; "Clare found the letter."
	; "She opened it up."
	; "Inside was a small note."
	; "She threw the note away."
	; "She kept the envelope to use."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((CLARE.NAME FIND.3001.V LETTER429.SK) ** E430.SK)
	(:ROLES
		(!R1 (CLARE.NAME AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (LETTER429.SK LETTER.N))
		(!R4 (E119 (ORIENTS E430.SK)))
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
)))

; story 23:
	; "The cat strolled through the house."
	; "It found something funny."
	; "There was a pink ball on the floor."
	; "The cat swatted the ball."
	; "The cat liked playing with the ball."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((CAT444.SK
              ((ADV-A (THROUGH.P HOUSE446.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) STROLL.3121.V)))
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
		(!R8 (E124 (ORIENTS E447.SK)))
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
		(!W5 (?G1 CAUSE.V E443.SK))
		(!W6 (E443.SK (SAME-TIME NOW115)))
		(!W7 (E447.SK (BEFORE NOW115)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 24:
	; "Fred loved fishing."
	; "He loved going with his friends."
	; "Fred went to the local pond yesterday."
	; "He caught a large fish."
	; "He brought it back to eat it."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P OBJECT474.SK)) ((ADV-A (FROM.P ?L1)) GO.3271.V)))
              OBJECT474.SK)
             ** E475.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (OBJECT474.SK LOCATION.N))
		(!R4 (NOT (?L1 = OBJECT474.SK)))
		(!R5 (E131 (ORIENTS E475.SK)))
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
		(!W5 (?G1 CAUSE.V E475.SK))
		(!W6 (E475.SK (BEFORE NOW122)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 25:
	; "We were out all day yesterday."
	; "The heat made me tired."
	; "I could barely function."
	; "So when we got to the house I slept."
	; "I had a long nap."

; story 26:
	; "The man made a date."
	; "He was excited to go."
	; "He got ready for the date."
	; "He went to the meeting spot."
	; "His date never showed up."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MAN498.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P SPOT508.SK)) GO.3631.V))
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
		(!R9 (E140 (ORIENTS E509.SK)))
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
		(!W5 (?G1 CAUSE.V E509.SK))
		(!W6 (E509.SK (BEFORE NOW133)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (4.0 0.4)
(EPI-SCHEMA ((MAN498.SK MAKE.3661.V DATE500.SK) ** E497.SK)
	(:ROLES
		(!R1 (MAN498.SK AGENT.N))
		(!R2 (DATE500.SK INANIMATE_OBJECT.N))
		(!R3 (DATE500.SK DATE.N))
		(!R4 (MAN498.SK MAN.N))
		(!R5 (DATE500.SK (PERTAIN-TO MAN498.SK)))
		(!R6 (E497.SK (RIGHT-AFTER U129)))
		(!R7 (E137 (ORIENTS E501.SK)))
	)
	(:GOALS
		(?G1 (MAN498.SK (WANT.V (THAT (DATE500.SK EXIST.V)))))
		(?G2 (MAN498.SK (WANT.V (KA (HAVE.V DATE500.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (DATE500.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (DATE500.SK EXIST.V))
		(?P2 (MAN498.SK (HAVE.V DATE500.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E497.SK (SAME-TIME NOW130)))
		(!W2 (E501.SK (BEFORE NOW130)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 27:
	; "John wanted to start a family."
	; "He thought highly of family values."
	; "He met a great girl."
	; "They fell in love."
	; "They got married."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((THEY.PRO GET.3782.V (KA (BE.PASV MARRY.V)) (AT.P-ARG ?L)) **
             E528.SK)
	(:ROLES
		(!R1 (THEY.PRO AGENT.N))
		(!R2 ((KA (BE.PASV MARRY.V)) INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (THEY.PRO = (KA (BE.PASV MARRY.V)))))
		(!R5 (E146 (ORIENTS E528.SK)))
	)
	(:GOALS
		(?G1 (THEY.PRO (WANT.V (THAT (THEY.PRO (HAVE.V (KA (BE.PASV MARRY.V))))))))
	)
	(:PRECONDS
		(?I1 (NOT (THEY.PRO HAVE.V (KA (BE.PASV MARRY.V)))))
		(?I2 (THEY.PRO (AT.P ?L)))
		(?I3 ((KA (BE.PASV MARRY.V)) (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (THEY.PRO HAVE.V (KA (BE.PASV MARRY.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E528.SK))
		(!W2 (?I1 PRECOND-OF E528.SK))
		(!W3 (?I2 PRECOND-OF E528.SK))
		(!W4 (?I3 PRECOND-OF E528.SK))
		(!W5 (?P1 POSTCOND-OF E528.SK))
		(!W6 (E528.SK (BEFORE NOW139)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 28:
	; "Tom got a call from his sister."
	; "She wanted to come over in three hours."
	; "His place was a mess."
	; "He cleaned his house."
	; "They had a good time at his house."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((TOM.NAME GET.3931.V CALL533.SK (AT.P-ARG ?L)) ** E534.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (CALL533.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (TOM.NAME = CALL533.SK)))
		(!R5 (CALL533.SK CALL.N))
		(!R6 (TOM.NAME PLACE.N))
		(!R7 (TOM.NAME HOUSE.N))
		(!R8 (E147 (ORIENTS E534.SK)))
		(!R9 (TOM.NAME (PERTAIN-TO HE.PRO)))
		(!R10 (HE.PRO MALE.A))
		(!R11 (HE.PRO AGENT.N))
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
)))

; story 29:
	; "Judy is driving home."
	; "She hits a rabbit on the road."
	; "She gets out to check on it."
	; "The rabbit is dead."
	; "Judy drives home."

; story 30:
	; "I am pretty weak."
	; "I could not do one pull-up."
	; "I tried every day for a month."
	; "I started getting stronger."
	; "I can now do 5 pull-ups."

; story 31:
	; "Tom was tired of work."
	; "He decided to go on vacation."
	; "Tom was having a great time."
	; "He didn't want it to end."
	; "He extended it by days."

; story 32:
	; "The man played his guitar."
	; "He found something he liked."
	; "He wrote it down."
	; "He built off of it."
	; "He wrote a pretty good song."
(setf matches (append matches '( (5.0 0.2)
(EPI-SCHEMA ((MAN598.SK ((ADV-A (WITH.P ?T)) PLAY.4441.V) GUITAR601.SK) **
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
		(!R9 (E167 (ORIENTS E602.SK)))
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
)))
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((MAN598.SK FIND.4501.V OBJECT604.SK) ** E606.SK)
	(:ROLES
		(!R1 (MAN598.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (MAN598.SK MAN.N))
		(!R4 (OBJECT604.SK (= (K SOMETHING.N))))
		(!R5 (GUITAR601.SK (PERTAIN-TO MAN598.SK)))
		(!R6 (GUITAR601.SK GUITAR.N))
		(!R7 (E168 (ORIENTS E606.SK)))
		(!R8 (E169 (ORIENTS OBJECT605.SK)))
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
)))
(setf matches (append matches '( (4.0 0.4)
(EPI-SCHEMA ((MAN598.SK PLAY.4531.V GUITAR601.SK) ** E597.SK)
	(:ROLES
		(!R1 (MAN598.SK AGENT.N))
		(!R2 (GUITAR601.SK INANIMATE_OBJECT.N))
		(!R3 (GUITAR601.SK GUITAR.N))
		(!R4 (GUITAR601.SK (PERTAIN-TO MAN598.SK)))
		(!R5 (MAN598.SK MAN.N))
		(!R6 (E597.SK (RIGHT-AFTER U159)))
		(!R7 (E167 (ORIENTS E602.SK)))
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
)))

; story 33:
	; "I like to play fire."
	; "One day I create a fire in my room."
	; "My bed was on fire."
	; "I burn my hand."
	; "I had a burn mark in my hand."

; story 34:
	; "Susan loved to feed her cat."
	; "She bought the best food for it."
	; "She got the food out for the cat."
	; "She put it in the bowl."
	; "The cat ate the food."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((?X FEED.4741.V CAT655.SK FOOD679.SK) ** ?E)
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
		(!R12 (E182 (ORIENTS E681.SK)))
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
)))
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((?X FEED.4743.V CAT655.SK FOOD679.SK) ** ?E)
	(:ROLES
		(!R1 (?X AGENT.N))
		(!R2 (CAT655.SK AGENT.N))
		(!R3 (NOT (?X = CAT655.SK)))
		(!R4 (NOT (CAT655.SK = FOOD679.SK)))
		(!R5 (NOT (?X = FOOD679.SK)))
		(!R6 (CAT655.SK CAT.N))
		(!R7 (FOOD679.SK FOOD.N))
		(!R8 (E182 (ORIENTS E681.SK)))
		(!R9 (CAT655.SK (PERTAIN-TO SUSAN.NAME)))
		(!R10 (OUT669.SK ((NN FOOD.N) OUT.N)))
		(!R11 (OUT669.SK (FOR.P CAT655.SK)))
		(!R12 (E676.SK (RIGHT-AFTER U173)))
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
)))
(setf matches (append matches '( (8.0 0.3)
(EPI-SCHEMA ((CAT655.SK EAT.4771.V FOOD679.SK) ** E676.SK)
	(:ROLES
		(!R1 (CAT655.SK AGENT.N))
		(!R2 (CAT655.SK CAT.N))
		(!R3 (FOOD679.SK FOOD.N))
		(!R4 (CAT655.SK (PERTAIN-TO SUSAN.NAME)))
		(!R5 (OUT669.SK ((NN FOOD.N) OUT.N)))
		(!R6 (OUT669.SK (FOR.P CAT655.SK)))
		(!R7 (E676.SK (RIGHT-AFTER U173)))
		(!R8 (E182 (ORIENTS E681.SK)))
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
		(!W3 (E676.SK CAUSE.V ?P1))
		(!W4 (E676.SK (SAME-TIME NOW174)))
		(!W5 (E681.SK (BEFORE NOW174)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((SUSAN.NAME GET.4801.V OUT669.SK (AT.P-ARG ?L)) ** E672.SK)
	(:ROLES
		(!R1 (SUSAN.NAME AGENT.N))
		(!R2 (OUT669.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (SUSAN.NAME = OUT669.SK)))
		(!R5 (OUT669.SK ((NN FOOD.N) OUT.N)))
		(!R6 (CAT655.SK (PERTAIN-TO SUSAN.NAME)))
		(!R7 (OUT669.SK (FOR.P CAT655.SK)))
		(!R8 (CAT655.SK CAT.N))
		(!R9 (E180 (ORIENTS E672.SK)))
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
)))

; story 35:
	; "A new pizza place opened up."
	; "I decided to try it."
	; "It was great."
	; "I got to customize my pizza."
	; "I decided to go back the next day."

; story 36:
	; "The man saw a rabbit."
	; "He was hungry."
	; "He chased the rabbit."
	; "The rabbit outran him."
	; "The man sat down in defeat."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((MAN703.SK
              (DOWN.ADV
               ((ADV-A (IN.P (K DEFEAT.N)))
                ((ADV-A (ON.P (K DEFEAT.N))) SIT.5071.V))))
             ** E714.SK)
	(:ROLES
		(!R1 (MAN703.SK AGENT.N))
		(!R2 ((K DEFEAT.N) INANIMATE_OBJECT.N))
		(!R3 ((K DEFEAT.N) FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (MAN703.SK MAN.N))
		(!R6 (E714.SK (RIGHT-AFTER U183)))
		(!R7 (E191 (ORIENTS E717.SK)))
	)
	(:GOALS
		(?G1 (MAN703.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (MAN703.SK (AT.P ?L)))
		(?I2 ((K DEFEAT.N) (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E714.SK (SAME-TIME NOW184)))
		(!W2 (E717.SK (BEFORE NOW184)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 37:
	; "Spencer went outside in the rain."
	; "He put on his boots."
	; "He stepped in his yard."
	; "The mud made him stick."
	; "He eventually got out."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((SPENCER.NAME
              ((ADV-A (IN.P RAIN720.SK))
               (OUTSIDE.ADV
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.5161.V))))
              ?L2)
             ** E721.SK)
	(:ROLES
		(!R1 (SPENCER.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (RAIN720.SK RAIN.N))
		(!R6 (E192 (ORIENTS E721.SK)))
		(!R7 (BOOT725.SK (PERTAIN-TO SPENCER.NAME)))
		(!R8 (BOOT725.SK (PLUR BOOT.N)))
		(!R9 (YARD732.SK (PERTAIN-TO SPENCER.NAME)))
		(!R10 (YARD732.SK YARD.N))
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
		(!W5 (?G1 CAUSE.V E721.SK))
		(!W6 (E721.SK (BEFORE NOW185)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 38:
	; "I went out to eat yesterday."
	; "I later had leftovers."
	; "I didn't like the leftovers."
	; "They did not taste good,
;I threw them out."

; story 39:
	; "Brenda was a nurse."
	; "She had two kids."
	; "She moved to a new town."
	; "Then they grew up."
	; "So she went back to work."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((BRENDA.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P TOWN755.SK)) MOVE.5371.V))
              TOWN755.SK)
             ** E757.SK)
	(:ROLES
		(!R1 (BRENDA.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (TOWN755.SK LOCATION.N))
		(!R4 (NOT (?L1 = TOWN755.SK)))
		(!R5 (TOWN755.SK TOWN.N))
		(!R6 (TOWN755.SK NEW.A))
		(!R7 (E203 (ORIENTS E757.SK)))
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
		(!W5 (?G1 CAUSE.V E757.SK))
		(!W6 (E757.SK (BEFORE NOW196)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 40:
	; "The man liked a drug."
	; "He tried to find some."
	; "It was illegal."
	; "The cops saw him."
	; "The man went to jail."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MAN767.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K JAIL.N))) GO.5611.V))
              (K JAIL.N))
             ** E779.SK)
	(:ROLES
		(!R1 (MAN767.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K JAIL.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K JAIL.N))))
		(!R5 (MAN767.SK MAN.N))
		(!R6 (E779.SK (RIGHT-AFTER U202)))
		(!R7 (E210 (ORIENTS E782.SK)))
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
		(!W5 (?G1 CAUSE.V E779.SK))
		(!W6 (E779.SK (SAME-TIME NOW203)))
		(!W7 (E782.SK (BEFORE NOW203)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 41:
	; "A little boy went to a shoe store."
	; "He wanted to buy his mom shoes."
	; "He didn't have enough money."
	; "A man paid for him."
	; "The boy was so happy!"
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((BOY784.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE791.SK)) GO.5671.V))
              STORE791.SK)
             ** E792.SK)
	(:ROLES
		(!R1 (BOY784.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE791.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE791.SK)))
		(!R5 (STORE791.SK ((NN SHOE.N) STORE.N)))
		(!R6 (E211 (ORIENTS E792.SK)))
		(!R7 (BOY784.SK LITTLE.A))
		(!R8 (BOY784.SK BOY.N))
		(!R9 (SHOES796.SK (PERTAIN-TO BOY784.SK)))
		(!R10 (SHOES796.SK ((NN MOM.N) (PLUR SHOE.N))))
		(!R11 (E212 (ORIENTS E797.SK)))
	)
	(:GOALS
		(E797.SK (BOY784.SK (WANT.V (KA ((ADV-A (AT.P STORE791.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BOY784.SK (AT.P ?L1)))
		(?I2 (NOT (BOY784.SK (AT.P STORE791.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT (BOY784.SK (AT.P ?L1))))
		(?P2 (BOY784.SK (AT.P STORE791.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E792.SK))
		(!W2 (?I2 BEFORE E792.SK))
		(!W3 (?P1 AFTER E792.SK))
		(!W4 (?P2 AFTER E792.SK))
		(!W5 (E797.SK CAUSE.V E792.SK))
		(!W6 (E792.SK (BEFORE NOW204)))
		(!W7 (E797.SK (BEFORE NOW205)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((MAN799.SK
              ((ADV-A (FOR.P BOY784.SK)) ((ADV-A (TO.P MAN799.SK)) PAY.5712.V))
              MAN799.SK ?O)
             ** E801.SK)
	(:ROLES
		(!R1 (?O INANIMATE_OBJECT.N))
		(!R2 (MAN799.SK AGENT.N))
		(!R3 (BOY784.SK LITTLE.A))
		(!R4 (BOY784.SK BOY.N))
		(!R5 (E214 (ORIENTS E801.SK)))
		(!R6 (SHOES796.SK ((NN MOM.N) (PLUR SHOE.N))))
		(!R7 (SHOES796.SK (PERTAIN-TO BOY784.SK)))
		(!R8 (MAN799.SK MAN.N))
	)
	(:GOALS
		(?G1 (MAN799.SK (WANT.V (THAT (MAN799.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (MAN799.SK HAVE.V ?O))
		(?I2 (NOT (MAN799.SK HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (MAN799.SK HAVE.V ?O)))
		(?P2 (MAN799.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E801.SK (BEFORE NOW207)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 42:
	; "Susie looked at her cd."
	; "It was all scratched."
	; "She wondered if it would work."
	; "Unfortunately it did not."
	; "She had to buy another one."

; story 43:
	; "Chad was going out for a pass."
	; "He was on in the parking lot."
	; "Someone was guarding him."
	; "He hit the ground hard."
	; "His arm was broken."

; story 44:
	; "Allie loved her device."
	; "She used it all the time."
	; "Then she found out she had ten percent left."
	; "It was not good."
	; "She was near done."
(setf matches (append matches '( (5.5 0.3)
(EPI-SCHEMA ((ALLIE.NAME ((ADV-A (TO.P DEVICE834.SK)) GIVE.5851.V) DEVICE834.SK
              TIME837.SK)
             ** E838.SK)
	(:ROLES
		(!R1 (ALLIE.NAME AGENT.N))
		(!R2 (TIME837.SK INANIMATE_OBJECT.N))
		(!R3 (DEVICE834.SK AGENT.N))
		(!R4 (DEVICE834.SK DEVICE.N))
		(!R5 (DEVICE834.SK (PERTAIN-TO ALLIE.NAME)))
		(!R6 (TIME837.SK TIME.N))
		(!R7 (E229 (ORIENTS E838.SK)))
	)
	(:GOALS
		(?G1 (ALLIE.NAME (WANT.V (THAT (DEVICE834.SK (HAVE.V TIME837.SK))))))
	)
	(:PRECONDS
		(?I1 (ALLIE.NAME HAVE.V TIME837.SK))
		(?I2 (NOT (DEVICE834.SK HAVE.V TIME837.SK)))
	)
	(:POSTCONDS
		(?P1 (NOT (ALLIE.NAME HAVE.V TIME837.SK)))
		(?P2 (DEVICE834.SK HAVE.V TIME837.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E838.SK (BEFORE NOW220)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 45:
	; "Gary went to the pond."
	; "He cast his rod in it."
	; "He caught a fish."
	; "He pulled it up."
	; "It was actually a boot."

; story 46:
	; "Susie went to her sister's house."
	; "She heard too much yelling though."
	; "So she decided to leave."
	; "She couldn't take the yelling."
	; "It was to much for her."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA (((K SUSIE.N)
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P HOUSE858.SK)) GO.6031.V))
              HOUSE858.SK)
             ** E859.SK)
	(:ROLES
		(!R1 ((K SUSIE.N) AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (HOUSE858.SK LOCATION.N))
		(!R4 (NOT (?L1 = HOUSE858.SK)))
		(!R5 (HOUSE858.SK HOUSE.N))
		(!R6 (E240 (ORIENTS E859.SK)))
	)
	(:GOALS
		(?G1 ((K SUSIE.N) (WANT.V (KA ((ADV-A (AT.P HOUSE858.SK)) BE.V)))))
	)
	(:PRECONDS
		(?I1 ((K SUSIE.N) (AT.P ?L1)))
		(?I2 (NOT ((K SUSIE.N) (AT.P HOUSE858.SK))))
	)
	(:POSTCONDS
		(?P1 (NOT ((K SUSIE.N) (AT.P ?L1))))
		(?P2 ((K SUSIE.N) (AT.P HOUSE858.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E859.SK))
		(!W2 (?I2 BEFORE E859.SK))
		(!W3 (?P1 AFTER E859.SK))
		(!W4 (?P2 AFTER E859.SK))
		(!W5 (?G1 CAUSE.V E859.SK))
		(!W6 (E859.SK (BEFORE NOW229)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 47:
	; "The boy sat at the table."
	; "He was expecting food."
	; "His mom saw him sitting there."
	; "She ignored him."
	; "The boy made his own food."
(setf matches (append matches '( (5.0 0.2)
(EPI-SCHEMA ((BOY879.SK ((ADV-A (WITH.P ?T)) PLAY.6092.V) OBJECT894.SK) **
             E891.SK)
	(:ROLES
		(!R1 (BOY879.SK AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (OBJECT894.SK GAME.N))
		(!R5 (OBJECT894.SK (PERTAIN-TO BOY879.SK)))
		(!R6 (BOY879.SK BOY.N))
		(!R7 (MOM885.SK (PERTAIN-TO BOY879.SK)))
		(!R8 (MOM885.SK MOM.N))
		(!R9 (OBJECT887.SK (THERE.ADV SIT.V)))
		(!R10 (OBJECT887.SK (= BOY879.SK)))
		(!R11 (E891.SK (RIGHT-AFTER U237)))
		(!R12 (E248 (ORIENTS E895.SK)))
	)
	(:GOALS
		(?G1 (BOY879.SK (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (BOY879.SK HAVE.V ?T))
	)
	(:POSTCONDS
		(?P1 (BOY879.SK EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E891.SK (SAME-TIME NOW238)))
		(!W3 (E895.SK (BEFORE NOW238)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (4.0 0.4)
(EPI-SCHEMA ((BOY879.SK MAKE.6121.V OBJECT894.SK) ** E891.SK)
	(:ROLES
		(!R1 (BOY879.SK AGENT.N))
		(!R2 (OBJECT894.SK INANIMATE_OBJECT.N))
		(!R3 (BOY879.SK BOY.N))
		(!R4 (OBJECT894.SK (PERTAIN-TO BOY879.SK)))
		(!R5 (OBJECT887.SK (= BOY879.SK)))
		(!R6 (OBJECT887.SK (THERE.ADV SIT.V)))
		(!R7 (MOM885.SK MOM.N))
		(!R8 (MOM885.SK (PERTAIN-TO BOY879.SK)))
		(!R9 (E891.SK (RIGHT-AFTER U237)))
		(!R10 (E248 (ORIENTS E895.SK)))
	)
	(:GOALS
		(?G1 (BOY879.SK (WANT.V (THAT (OBJECT894.SK EXIST.V)))))
		(?G2 (BOY879.SK (WANT.V (KA (HAVE.V OBJECT894.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (OBJECT894.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (OBJECT894.SK EXIST.V))
		(?P2 (BOY879.SK (HAVE.V OBJECT894.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E891.SK (SAME-TIME NOW238)))
		(!W2 (E895.SK (BEFORE NOW238)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((BOY879.SK
              ((ADV-A (AT.P TABLE881.SK))
               ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.6151.V))))
             ** E878.SK)
	(:ROLES
		(!R1 (BOY879.SK AGENT.N))
		(!R2 (?S INANIMATE_OBJECT.N))
		(!R3 (?S FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (TABLE881.SK TABLE.N))
		(!R6 (BOY879.SK BOY.N))
		(!R7 (E878.SK (RIGHT-AFTER U233)))
		(!R8 (OBJECT887.SK (= BOY879.SK)))
		(!R9 (OBJECT887.SK (THERE.ADV SIT.V)))
		(!R10 (MOM885.SK MOM.N))
		(!R11 (MOM885.SK (PERTAIN-TO BOY879.SK)))
		(!R12 (OBJECT894.SK (PERTAIN-TO BOY879.SK)))
		(!R13 (E244 (ORIENTS E882.SK)))
	)
	(:GOALS
		(?G1 (BOY879.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (BOY879.SK (AT.P ?L)))
		(?I2 (?S (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E878.SK (SAME-TIME NOW234)))
		(!W2 (E882.SK (BEFORE NOW234)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 48:
	; "Susie loved Cheerios."
	; "But they weren't gluten free."
	; "So she couldn't eat them."
	; "Then she got a gluten free box."
	; "She loved it."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((SUSIE.NAME GET.6211.V GLUTEN902.SK (AT.P-ARG ?L)) ** E903.SK)
	(:ROLES
		(!R1 (SUSIE.NAME AGENT.N))
		(!R2 (GLUTEN902.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (SUSIE.NAME = GLUTEN902.SK)))
		(!R5 (GLUTEN902.SK GLUTEN.A))
		(!R6 (E251 (ORIENTS E903.SK)))
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
)))

; story 49:
	; "The man cracked an egg."
	; "He put the egg in the pan."
	; "The yoke broke when it dropped."
	; "The man threw out the egg."
	; "The man cracked another egg."

; story 50:
	; "I was at work."
	; "I was using the walking stacker."
	; "My friend stood in my way."
	; "He wanted me to get certified first."
	; "I almost ran him over."

; story 51:
	; "Fred wanted to go on a ride."
	; "But the park wouldn't let him."
	; "He was too short."
	; "He begged but they said no."
	; "So he had to find something else."

; story 52:
	; "A song played on the radio."
	; "The man had not heard the song before."
	; "He liked the song."
	; "He called the radio."
	; "They told him the name of the artist."
(setf matches (append matches '( (5.0 0.2)
(EPI-SCHEMA ((SONG964.SK
              ((ADV-A (ON.P RADIO966.SK)) ((ADV-A (WITH.P ?T)) PLAY.6811.V))
              ?G)
             ** E967.SK)
	(:ROLES
		(!R1 (SONG964.SK AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (?G GAME.N))
		(!R5 (SONG964.SK SONG.N))
		(!R6 (RADIO966.SK RADIO.N))
		(!R7 (E268 (ORIENTS E967.SK)))
	)
	(:GOALS
		(?G1 (SONG964.SK (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (SONG964.SK HAVE.V ?T))
	)
	(:POSTCONDS
		(?P1 (SONG964.SK EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E967.SK (BEFORE NOW259)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((SONG964.SK ((ADV-A (ON.P RADIO966.SK)) PLAY.6841.V) ?O) **
             E967.SK)
	(:ROLES
		(!R1 (SONG964.SK AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (SONG964.SK SONG.N))
		(!R4 (RADIO966.SK RADIO.N))
		(!R5 (E268 (ORIENTS E967.SK)))
	)
	(:GOALS
		(?G1 (SONG964.SK (WANT.V (THAT (?O EXIST.V)))))
		(?G2 (SONG964.SK (WANT.V (KA (HAVE.V ?O)))))
	)
	(:PRECONDS
		(?I1 (NOT (?O EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (?O EXIST.V))
		(?P2 (SONG964.SK (HAVE.V ?O)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E967.SK (BEFORE NOW259)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((MAN970.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.6871.V
              (KA ((BEFORE.ADV HEAR.V) SONG964.SK)))
             ** ?E)
	(:ROLES
		(!R1 (MAN970.SK AGENT.N))
		(!R2 ((KA ((BEFORE.ADV HEAR.V) SONG964.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (SONG964.SK SONG.N))
		(!R5 (MAN970.SK MAN.N))
		(!R6 (E973.SK (IMPINGES-ON E972.SK)))
		(!R7 (E270 (ORIENTS E972.SK)))
		(!R8 (E269 (ORIENTS E973.SK)))
	)
	(:GOALS
		(?G1 (MAN970.SK (WANT.V (THAT (NOT (MAN970.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN970.SK (DO.V (KA ((BEFORE.ADV HEAR.V) SONG964.SK))))) CAUSE.V
    (KE (MAN970.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E972.SK (MAN970.SK (BEFORE.ADV DO.V) (KA ((BEFORE.ADV HEAR.V) SONG964.SK))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E972.SK))
		(!W2 (E972.SK (BEFORE NOW260)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((MAN970.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.6876.V
              (KA ((BEFORE.ADV HEAR.V) SONG964.SK)))
             ** ?E)
	(:ROLES
		(!R1 (MAN970.SK AGENT.N))
		(!R2 ((KA ((BEFORE.ADV HEAR.V) SONG964.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (SONG964.SK SONG.N))
		(!R5 (MAN970.SK MAN.N))
		(!R6 (E973.SK (IMPINGES-ON E972.SK)))
		(!R7 (E269 (ORIENTS E973.SK)))
		(!R8 (E270 (ORIENTS E972.SK)))
	)
	(:GOALS
		(?G1 (MAN970.SK (WANT.V (THAT (NOT (MAN970.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN970.SK (DO.V (KA ((BEFORE.ADV HEAR.V) SONG964.SK))))) CAUSE.V
    (KE (MAN970.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E973.SK (MAN970.SK (BEFORE.ADV DO.V) (KA ((BEFORE.ADV HEAR.V) SONG964.SK))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E973.SK))
		(!W2 (E972.SK (BEFORE NOW260)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 53:
	; "The man was wearing glasses."
	; "A rock hit the glasses."
	; "The glasses broke."
	; "He showed his friend."
	; "His friend said the glasses saved his eye."

; story 54:
	; "I ate a big muffin."
	; "But it wouldn't go away!"
	; "There always seemed to be more!"
	; "So I ate more!"
	; "Now I'm sick to my stomach."
(setf matches (append matches '( (8.0 0.3)
(EPI-SCHEMA ((ME1017.SK EAT.7111.V OBJECT1010.SK) ** E1011.SK)
	(:ROLES
		(!R1 (OBJECT1010.SK FOOD.N))
		(!R2 (ME1017.SK AGENT.N))
		(!R3 (E280 (ORIENTS E1011.SK)))
		(!R4 (STOMACH1016.SK STOMACH.N))
		(!R5 (STOMACH1016.SK (PERTAIN-TO ME1017.SK)))
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
		(!W3 (E1011.SK CAUSE.V ?P1))
		(!W4 (E1011.SK (BEFORE NOW269)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 55:
	; "Lucy was searching on YouTube."
	; "She found a great song."
	; "She listened to it all day."
	; "Lucy loved it."
	; "She wanted to buy the album."
(setf matches (append matches '( (4.5 0.1)
(EPI-SCHEMA ((LUCY.NAME
              ((ADV-A (ON.P YOUTUBE.NAME))
               ((ADV-A (FOR.P SONG1027.SK)) SEARCH.7261.V)))
             ** E1022.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?LX LOCATION.N))
		(!R3 (?LO LOCATION.N))
		(!R4 (E284 (ORIENTS E1022.SK)))
		(!R5 (E286 (ORIENTS E1028.SK)))
		(!R6 (SONG1027.SK SONG.N))
		(!R7 (SONG1027.SK GREAT.A))
		(!R8 (SONG1027.SK ALBUM.N))
		(!R9 (E289 (ORIENTS E1038.SK)))
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
)))
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((LUCY.NAME FIND.7291.V SONG1027.SK) ** E1028.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (E284 (ORIENTS E1022.SK)))
		(!R4 (SONG1027.SK SONG.N))
		(!R5 (SONG1027.SK GREAT.A))
		(!R6 (SONG1027.SK ALBUM.N))
		(!R7 (E286 (ORIENTS E1028.SK)))
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
)))

; story 56:
	; "There was a box in the garage."
	; "I didn't know what was inside."
	; "I asked my father to open it."
	; "He opened the box for me."
	; "There was blank paper in the box."

; story 57:
	; "Kara wanted to go swimming."
	; "She went to the lake."
	; "There, she dove into the water."
	; "She swam for almost an hour!"
	; "After, she felt refreshed and happy."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((KARA.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P LAKE1062.SK)) GO.7561.V))
              LAKE1062.SK)
             ** E1063.SK)
	(:ROLES
		(!R1 (KARA.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (LAKE1062.SK LOCATION.N))
		(!R4 (NOT (?L1 = LAKE1062.SK)))
		(!R5 (E296 (ORIENTS E1060.SK)))
		(!R6 (LAKE1062.SK LAKE.N))
		(!R7 (E297 (ORIENTS E1063.SK)))
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
		(!W5 (E1060.SK CAUSE.V E1063.SK))
		(!W6 (E1060.SK (BEFORE NOW284)))
		(!W7 (E1063.SK (BEFORE NOW285)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 58:
	; "The man ran very fast."
	; "He stopped to catch his breath."
	; "He was more tired than he thought."
	; "He sat down for a break."
	; "He didn't feel like running after that."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((MAN1070.SK
              ((ADV-A (FOR.P BREAK1079.SK))
               (DOWN.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.7711.V)))))
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
		(!R9 (E304 (ORIENTS E1080.SK)))
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
)))
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((MAN1070.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.7741.V
              (KA
               ((ADV-A
                 (L #:G1104036
                  (AND (#:G1104036 LIKE.P)
                       (#:G1104036
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
       (L #:G1104036
        (AND (#:G1104036 LIKE.P)
             (#:G1104036
              (= (KA ((ADV-A (AFTER.P NEW-SALIENT-ENTITY*1084.SK)) RUN.V)))))))
      FEEL.V))
    ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (MAN1070.SK MAN.N))
		(!R5 (NEW-SALIENT-ENTITY*1084.SK NEW-SALIENT-ENTITY*.N))
		(!R6 (NEW-SALIENT-ENTITY*1084.SK PRED?.N))
		(!R7 (BREATH1074.SK (PERTAIN-TO MAN1070.SK)))
		(!R8 (BREATH1074.SK BREATH.N))
		(!R9 (E306 (ORIENTS E1085.SK)))
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
          (L #:G1104036
           (AND (#:G1104036 LIKE.P)
                (#:G1104036
                 (=
                  (KA
                   ((ADV-A (AFTER.P NEW-SALIENT-ENTITY*1084.SK)) RUN.V)))))))
         FEEL.V)))))
    CAUSE.V (KE (MAN1070.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1085.SK
   (MAN1070.SK
    ((ADV-A
      (L #:G1104036
       (AND (#:G1104036 LIKE.P)
            (#:G1104036
             (= (KA ((ADV-A (AFTER.P NEW-SALIENT-ENTITY*1084.SK)) RUN.V)))))))
     DO.V)
    (KA
     ((ADV-A
       (L #:G1104036
        (AND (#:G1104036 LIKE.P)
             (#:G1104036
              (= (KA ((ADV-A (AFTER.P NEW-SALIENT-ENTITY*1084.SK)) RUN.V)))))))
      FEEL.V))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E1085.SK))
		(!W2 (E1085.SK (BEFORE NOW293)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((MAN1070.SK
              (VERY.ADV
               (FAST.ADV
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.7801.V))))
              ?L2)
             ** E1069.SK)
	(:ROLES
		(!R1 (MAN1070.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (MAN1070.SK MAN.N))
		(!R6 (E301 (ORIENTS E1069.SK)))
		(!R7 (BREATH1074.SK (PERTAIN-TO MAN1070.SK)))
		(!R8 (BREATH1074.SK BREATH.N))
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
		(!W5 (?G1 CAUSE.V E1069.SK))
		(!W6 (E1069.SK (BEFORE NOW289)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 59:
	; "The man shopped for pants."
	; "He couldn't find any that fit."
	; "He found a big and tall store."
	; "He found some pants that fit."
	; "He bought some pants there."
(setf matches (append matches '( (3.5 0.2)
(EPI-SCHEMA ((MAN1087.SK
              (BE.PASV ((ADV-A (FOR.P (K (PLUR PANT.N)))) SHOP.7861.V)))
             ** E1086.SK)
	(:ROLES
		(!R1 (MAN1087.SK AGENT.N))
		(!R2 (?LX LOCATION.N))
		(!R3 (?LO LOCATION.N))
		(!R4 (E1086.SK (RIGHT-AFTER U293)))
		(!R5 (MAN1087.SK MAN.N))
		(!R6 (E307 (ORIENTS E1092.SK)))
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
)))
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((MAN1087.SK FIND.7891.V (K (PLUR PANT.N))) ** E1092.SK)
	(:ROLES
		(!R1 (MAN1087.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (E1086.SK (RIGHT-AFTER U293)))
		(!R4 (MAN1087.SK MAN.N))
		(!R5 (E307 (ORIENTS E1092.SK)))
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
)))

; story 60:
	; "Julie's dog was always cold."
	; "She gave her a dog sweater."
	; "The dog loved it!"
	; "She could run around outside in the cold."
	; "Julie liked to see her dog happy."
(setf matches (append matches '( (4.0 0.2)
(EPI-SCHEMA ((SHE.PRO ((ADV-A (TO.P SHE.PRO)) GIVE.8011.V) SHE.PRO
              SWEATER1110.SK)
             ** E1111.SK)
	(:ROLES
		(!R1 (SWEATER1110.SK INANIMATE_OBJECT.N))
		(!R2 (SWEATER1110.SK ((NN DOG.N) SWEATER.N)))
		(!R3 (SHE.PRO FEMALE.A))
		(!R4 (SHE.PRO AGENT.N))
		(!R5 (E313 (ORIENTS E1111.SK)))
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
)))
(setf matches (append matches '( (5.0 0.4)
(EPI-SCHEMA ((SHE.PRO FEED.8041.V SHE.PRO SWEATER1110.SK) ** E1111.SK)
	(:ROLES
		(!R1 (SWEATER1110.SK FOOD.N))
		(!R2 (NOT (SHE.PRO = SHE.PRO)))
		(!R3 (NOT (SHE.PRO = SWEATER1110.SK)))
		(!R4 (SWEATER1110.SK ((NN DOG.N) SWEATER.N)))
		(!R5 (SHE.PRO FEMALE.A))
		(!R6 (SHE.PRO AGENT.N))
		(!R7 (E313 (ORIENTS E1111.SK)))
	)
	(:GOALS
		(?G1 (SHE.PRO (WANT.V (THAT (NOT (SHE.PRO HUNGRY.A))))))
		(?G2 (SHE.PRO (WANT.V (THAT (SHE.PRO EAT.V SWEATER1110.SK)))))
	)
	(:PRECONDS
		(?I1 (SHE.PRO HAVE.V SWEATER1110.SK))
		(?I2 (SHE.PRO HUNGRY.A))
	)
	(:STEPS
		(?E1 (SHE.PRO EAT.V SWEATER1110.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (SHE.PRO (HAVE.V SWEATER1110.SK))))
		(?P2 (NOT (SHE.PRO HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E1111.SK))
		(!W2 (E1111.SK (BEFORE NOW300)))
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
)))

; story 61:
	; "My son had just started eating foods."
	; "We gave him some peaches to start out on."
	; "He loved them."
	; "I think he got more on him than in him."
	; "It was really funny."

; story 62:
	; "I went to the mall yesterday."
	; "I thought there was a sale."
	; "So I showed up at the store."
	; "There was no sale."
	; "I was so upset."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME1152.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P MALL1135.SK)) ((ADV-A (FROM.P ?L1)) GO.8311.V)))
              MALL1135.SK)
             ** E1136.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (MALL1135.SK LOCATION.N))
		(!R3 (NOT (?L1 = MALL1135.SK)))
		(!R4 (ME1152.SK AGENT.N))
		(!R5 (MALL1135.SK MALL.N))
		(!R6 (MALL1135.SK STORE.N))
		(!R7 (E323 (ORIENTS E1136.SK)))
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
		(!W5 (?G1 CAUSE.V E1136.SK))
		(!W6 (E1136.SK (BEFORE NOW309)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 63:
	; "Tom noticed a stray cat."
	; "He thought it might be friendly."
	; "Tom tried to go up and pet it."
	; "The cat scratched at him."
	; "Tom left it alone."

; story 64:
	; "Kim needed some new chairs."
	; "She threw away her old ones."
	; "Kim went to the store and got more."
	; "She set up her chairs."
	; "They looked nice."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((KIM.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE1176.SK)) GO.8611.V))
              STORE1176.SK)
             ** E1178.SK)
	(:ROLES
		(!R1 (KIM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE1176.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE1176.SK)))
		(!R5 (STORE1176.SK STORE.N))
		(!R6 (OBJECT1173.SK (PERTAIN-TO KIM.NAME)))
		(!R7 (E334 (ORIENTS E1178.SK)))
		(!R8 (E335 (ORIENTS OBJECT1177.SK)))
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
		(!W5 (?G1 CAUSE.V E1178.SK))
		(!W6 (E1178.SK (BEFORE NOW321)))
		(!W7 (OBJECT1177.SK (BEFORE NOW321)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 65:
	; "A new restaurant opened in town."
	; "I was eager to try it."
	; "It looked good."
	; "So I went to it."
	; "But the line was so long I ended up leaving."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME1194.SK
              ((ADV-A (FROM.P ?L1))
               ((ADV-A (TO.P RESTAURANT1185.SK)) GO.8671.V))
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
		(!R8 (E340 (ORIENTS E1189.SK)))
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
		(!W5 (?G1 CAUSE.V E1189.SK))
		(!W6 (E1189.SK (BEFORE NOW327)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 66:
	; "It was my son's first birthday."
	; "I cannot believe how fast it has gone by."
	; "He is getting so big."
	; "He got a smash cake for himself."
	; "He loved it."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((HE.PRO GET.8821.V CAKE1202.SK (AT.P-ARG ?L)) ** E1203.SK)
	(:ROLES
		(!R1 (CAKE1202.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (HE.PRO = CAKE1202.SK)))
		(!R4 (CAKE1202.SK ((NN SMASH.N) CAKE.N)))
		(!R5 (HE.PRO MALE.A))
		(!R6 (HE.PRO AGENT.N))
		(!R7 (CAKE1202.SK (FOR.P HIMSELF1207.SK)))
		(!R8 (E344 (ORIENTS E1203.SK)))
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
)))

; story 67:
	; "The man was playing poker."
	; "He had a flush."
	; "He went all in."
	; "He got called with two pairs."
	; "He won the hand."

; story 68:
	; "Tyra is a poor."
	; "Tyra is a homeless."
	; "Tyra has to beg on the street for money."
	; "Tyra catches a break one day."
	; "A man gives her money and a place to live."
(setf matches (append matches '( (3.5 0)
(EPI-SCHEMA ((MAN1237.SK ((ADV-A (TO.P OBJECT1239.SK)) GIVE.9151.V)
              OBJECT1239.SK ?O)
             ** E1240.SK)
	(:ROLES
		(!R1 (MAN1237.SK AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (OBJECT1239.SK AGENT.N))
		(!R4 (MAN1237.SK MAN.N))
		(!R5 (E358 (ORIENTS E1240.SK)))
	)
	(:GOALS
		(?G1 (MAN1237.SK (WANT.V (THAT (OBJECT1239.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (MAN1237.SK HAVE.V ?O))
		(?I2 (NOT (OBJECT1239.SK HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1237.SK HAVE.V ?O)))
		(?P2 (OBJECT1239.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1240.SK (AT-ABOUT NOW343)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (7.0 0.2)
(EPI-SCHEMA ((MAN1237.SK FEED.9181.V OBJECT1239.SK ?F) ** E1240.SK)
	(:ROLES
		(!R1 (MAN1237.SK AGENT.N))
		(!R2 (OBJECT1239.SK AGENT.N))
		(!R3 (?F FOOD.N))
		(!R4 (NOT (MAN1237.SK = OBJECT1239.SK)))
		(!R5 (NOT (OBJECT1239.SK = ?F)))
		(!R6 (NOT (MAN1237.SK = ?F)))
		(!R7 (MAN1237.SK MAN.N))
		(!R8 (E358 (ORIENTS E1240.SK)))
	)
	(:GOALS
		(?G1 (MAN1237.SK (WANT.V (THAT (NOT (OBJECT1239.SK HUNGRY.A))))))
		(?G2 (MAN1237.SK (WANT.V (THAT (OBJECT1239.SK EAT.V ?F)))))
	)
	(:PRECONDS
		(?I1 (MAN1237.SK HAVE.V ?F))
		(?I2 (OBJECT1239.SK HUNGRY.A))
	)
	(:STEPS
		(?E1 (OBJECT1239.SK EAT.V ?F))
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1237.SK (HAVE.V ?F))))
		(?P2 (NOT (OBJECT1239.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E1240.SK))
		(!W2 (E1240.SK (AT-ABOUT NOW343)))
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
)))

; story 69:
	; "The boy ran into the kitchen."
	; "His hand hit the cup on the table."
	; "It hit the ground with a bounce."
	; "The cup did not break."
	; "The cup was made of plastic."
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((CUP1252.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.9301.V (KA BREAK.V))
             ** ?E)
	(:ROLES
		(!R1 (CUP1252.SK AGENT.N))
		(!R2 ((KA BREAK.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (CUP1252.SK CUP.N))
		(!R5 (TABLE1253.SK TABLE.N))
		(!R6 (CUP1252.SK (ON.P TABLE1253.SK)))
		(!R7 (E362 (ORIENTS E1261.SK)))
	)
	(:GOALS
		(?G1 (CUP1252.SK (WANT.V (THAT (NOT (CUP1252.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (CUP1252.SK (DO.V (KA BREAK.V)))) CAUSE.V
    (KE (CUP1252.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1261.SK (NOT (CUP1252.SK (DO.V (KA BREAK.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E1261.SK))
		(!W2 (E1261.SK (BEFORE NOW347)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((BOY1244.SK
              ((ADV-A (INTO.P KITCHEN1246.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.9331.V)))
              ?L2)
             ** E1243.SK)
	(:ROLES
		(!R1 (BOY1244.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (KITCHEN1246.SK KITCHEN.N))
		(!R6 (BOY1244.SK BOY.N))
		(!R7 (E1243.SK (RIGHT-AFTER U343)))
		(!R8 (HAND1249.SK (PERTAIN-TO BOY1244.SK)))
		(!R9 (HAND1249.SK HAND.N))
		(!R10 (E353 (ORIENTS E1247.SK)))
	)
	(:GOALS
		(?G1 (BOY1244.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BOY1244.SK (AT.P ?L1)))
		(?I2 (NOT (BOY1244.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (BOY1244.SK (AT.P ?L1))))
		(?P2 (BOY1244.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1243.SK))
		(!W2 (?I2 BEFORE E1243.SK))
		(!W3 (?P1 AFTER E1243.SK))
		(!W4 (?P2 AFTER E1243.SK))
		(!W5 (?G1 CAUSE.V E1243.SK))
		(!W6 (E1243.SK (SAME-TIME NOW344)))
		(!W7 (E1247.SK (BEFORE NOW344)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((CUP1252.SK
              (BE.PASV
               ((ADV-A
                 (L #:G1288246
                  (AND (#:G1288246 OF.P)
                       (AND ((#:G1288246) PLASTIC.A) ((#:G1288246) PRED?.N)))))
                MAKE.9361.V))
              ?O)
             ** E1262.SK)
	(:ROLES
		(!R1 (CUP1252.SK AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (CUP1252.SK CUP.N))
		(!R4 (TABLE1253.SK TABLE.N))
		(!R5 (CUP1252.SK (ON.P TABLE1253.SK)))
		(!R6 (E363 (ORIENTS E1262.SK)))
	)
	(:GOALS
		(?G1 (CUP1252.SK (WANT.V (THAT (?O EXIST.V)))))
		(?G2 (CUP1252.SK (WANT.V (KA (HAVE.V ?O)))))
	)
	(:PRECONDS
		(?I1 (NOT (?O EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (?O EXIST.V))
		(?P2 (CUP1252.SK (HAVE.V ?O)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1262.SK (BEFORE NOW348)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 70:
	; "Matt left his window open."
	; "His cat got out of the house."
	; "Matt looked for his cat."
	; "He put posters up to find his cat."
	; "Someone called him with his cat."

; story 71:
	; "A family really loved rainbows."
	; "They would always look for them."
	; "It rained one day."
	; "They looked outside."
	; "They saw a rainbow."

; story 72:
	; "The man mixed a drink."
	; "It tasted very good."
	; "His friend asked for one."
	; "The man made his friend a drink."
	; "His friend gave the drink it's own name."
(setf matches (append matches '( (7.0 0.4)
(EPI-SCHEMA ((FRIEND1296.SK FEED.9751.V DRINK1304.SK OBJECT1311.SK) ** E1307.SK)
	(:ROLES
		(!R1 (FRIEND1296.SK AGENT.N))
		(!R2 (DRINK1304.SK AGENT.N))
		(!R3 (OBJECT1311.SK FOOD.N))
		(!R4 (NOT (FRIEND1296.SK = DRINK1304.SK)))
		(!R5 (NOT (DRINK1304.SK = OBJECT1311.SK)))
		(!R6 (NOT (FRIEND1296.SK = OBJECT1311.SK)))
		(!R7 (FRIEND1296.SK FRIEND.N))
		(!R8 (DRINK1304.SK DRINK.N))
		(!R9 (OBJECT1311.SK (PERTAIN-TO DRINK1304.SK)))
		(!R10 (MAN1293.SK MAN.N))
		(!R11 (FRIEND1296.SK (PERTAIN-TO MAN1293.SK)))
		(!R12 (E1307.SK (RIGHT-AFTER U362)))
		(!R13 (FRIEND1305.SK (PERTAIN-TO MAN1293.SK)))
		(!R14 (FRIEND1305.SK FRIEND.N))
		(!R15 (E375 (ORIENTS E1312.SK)))
	)
	(:GOALS
		(?G1 (FRIEND1296.SK (WANT.V (THAT (NOT (DRINK1304.SK HUNGRY.A))))))
		(?G2 (FRIEND1296.SK (WANT.V (THAT (DRINK1304.SK EAT.V OBJECT1311.SK)))))
	)
	(:PRECONDS
		(?I1 (FRIEND1296.SK HAVE.V OBJECT1311.SK))
		(?I2 (DRINK1304.SK HUNGRY.A))
	)
	(:STEPS
		(?E1 (DRINK1304.SK EAT.V OBJECT1311.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND1296.SK (HAVE.V OBJECT1311.SK))))
		(?P2 (NOT (DRINK1304.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E1307.SK))
		(!W2 (E1307.SK (SAME-TIME NOW363)))
		(!W3 (E1312.SK (BEFORE NOW363)))
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
)))
(setf matches (append matches '( (5.5 0.3)
(EPI-SCHEMA ((FRIEND1296.SK ((ADV-A (TO.P DRINK1304.SK)) GIVE.9781.V)
              DRINK1304.SK OBJECT1311.SK)
             ** E1307.SK)
	(:ROLES
		(!R1 (FRIEND1296.SK AGENT.N))
		(!R2 (OBJECT1311.SK INANIMATE_OBJECT.N))
		(!R3 (DRINK1304.SK AGENT.N))
		(!R4 (FRIEND1296.SK FRIEND.N))
		(!R5 (DRINK1304.SK DRINK.N))
		(!R6 (OBJECT1311.SK (PERTAIN-TO DRINK1304.SK)))
		(!R7 (MAN1293.SK MAN.N))
		(!R8 (FRIEND1296.SK (PERTAIN-TO MAN1293.SK)))
		(!R9 (E1307.SK (RIGHT-AFTER U362)))
		(!R10 (FRIEND1305.SK (PERTAIN-TO MAN1293.SK)))
		(!R11 (FRIEND1305.SK FRIEND.N))
		(!R12 (E375 (ORIENTS E1312.SK)))
	)
	(:GOALS
		(?G1 (FRIEND1296.SK (WANT.V (THAT (DRINK1304.SK (HAVE.V OBJECT1311.SK))))))
	)
	(:PRECONDS
		(?I1 (FRIEND1296.SK HAVE.V OBJECT1311.SK))
		(?I2 (NOT (DRINK1304.SK HAVE.V OBJECT1311.SK)))
	)
	(:POSTCONDS
		(?P1 (NOT (FRIEND1296.SK HAVE.V OBJECT1311.SK)))
		(?P2 (DRINK1304.SK HAVE.V OBJECT1311.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1307.SK (SAME-TIME NOW363)))
		(!W2 (E1312.SK (BEFORE NOW363)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (4.0 0.4)
(EPI-SCHEMA ((MAN1293.SK MAKE.9811.V FRIEND1305.SK) ** E1300.SK)
	(:ROLES
		(!R1 (MAN1293.SK AGENT.N))
		(!R2 (FRIEND1305.SK INANIMATE_OBJECT.N))
		(!R3 (MAN1293.SK MAN.N))
		(!R4 (FRIEND1305.SK (PERTAIN-TO MAN1293.SK)))
		(!R5 (FRIEND1305.SK FRIEND.N))
		(!R6 (DRINK1304.SK DRINK.N))
		(!R7 (FRIEND1296.SK FRIEND.N))
		(!R8 (FRIEND1296.SK (PERTAIN-TO MAN1293.SK)))
		(!R9 (E1300.SK (RIGHT-AFTER U361)))
		(!R10 (OBJECT1311.SK (PERTAIN-TO DRINK1304.SK)))
		(!R11 (E374 (ORIENTS E1306.SK)))
	)
	(:GOALS
		(?G1 (MAN1293.SK (WANT.V (THAT (FRIEND1305.SK EXIST.V)))))
		(?G2 (MAN1293.SK (WANT.V (KA (HAVE.V FRIEND1305.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (FRIEND1305.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (FRIEND1305.SK EXIST.V))
		(?P2 (MAN1293.SK (HAVE.V FRIEND1305.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1300.SK (SAME-TIME NOW362)))
		(!W2 (E1306.SK (BEFORE NOW362)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 73:
	; "Tom was a ten year old boy."
	; "Tom lived with his parents."
	; "Tom wanted a pet."
	; "His parents did not allow pets in the house."
	; "Tom cried."
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((PARENT1320.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.9873.V
              (KA (ALLOW.V OBJECT1327.SK)))
             ** ?E)
	(:ROLES
		(!R1 (PARENT1320.SK AGENT.N))
		(!R2 ((KA (ALLOW.V OBJECT1327.SK)) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (PARENT1320.SK (PLUR PARENT.N)))
		(!R5 (OBJECT1327.SK (= (K (PLUR PET.N)))))
		(!R6 (PARENT1320.SK (PERTAIN-TO TOM.NAME)))
		(!R7 (HOUSE1328.SK HOUSE.N))
		(!R8 (OBJECT1327.SK (IN.P HOUSE1328.SK)))
		(!R9 (E379 (ORIENTS E1331.SK)))
	)
	(:GOALS
		(?G1 (PARENT1320.SK (WANT.V (THAT (NOT (PARENT1320.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (PARENT1320.SK (DO.V (KA (ALLOW.V OBJECT1327.SK))))) CAUSE.V
    (KE (PARENT1320.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1331.SK (NOT (PARENT1320.SK (DO.V (KA (ALLOW.V OBJECT1327.SK))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E1331.SK))
		(!W2 (E1331.SK (BEFORE NOW367)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 74:
	; "Tom loved playing baseball."
	; "He had a big game."
	; "He was up to hit."
	; "He hit a long drive."
	; "He was able to make a run and win the game."
(setf matches (append matches '( (5.0 0.3)
(EPI-SCHEMA ((TOM.NAME (UP.ADV ((ADV-A (FOR.P (KA HIT.V))) DO.10051.V))
              GAME1340.SK)
             ** E1342.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (GAME1340.SK INANIMATE_OBJECT.N))
		(!R3 (GAME1340.SK BIG.A))
		(!R4 (GAME1340.SK GAME.N))
		(!R5 (E382 (ORIENTS E1341.SK)))
		(!R6 (E383 (ORIENTS E1342.SK)))
	)
	(:GOALS
		(?G1 (TOM.NAME (WANT.V (THAT (GAME1340.SK EXIST.V)))))
		(?G2 (TOM.NAME (WANT.V (KA (HAVE.V GAME1340.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (GAME1340.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (GAME1340.SK EXIST.V))
		(E1341.SK (TOM.NAME (HAVE.V GAME1340.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1341.SK (BEFORE NOW370)))
		(!W2 (E1342.SK (BEFORE NOW371)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 75:
	; "Tom had a cabin near a river."
	; "He would visit often."
	; "ONe day the river flooded."
	; "Tom's cabin was swept away."
	; "Tom was sad for years."

; story 76:
	; "The man folded the clothes."
	; "He put them away."
	; "The next day they were gone."
	; "He went to look for them."
	; "His wife was refolding them."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((MAN1366.SK
              ((ADV-A (FOR.P (KA ((ADV-A (FOR.P CLOTHE1369.SK)) LOOK.V))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.10291.V)))
              ?L2)
             ** E1377.SK)
	(:ROLES
		(!R1 (MAN1366.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (CLOTHE1369.SK (PLUR CLOTHE.N)))
		(!R6 (MAN1366.SK MAN.N))
		(!R7 (E393 (ORIENTS E1377.SK)))
		(!R8 (WIFE1380.SK (PERTAIN-TO MAN1366.SK)))
		(!R9 (WIFE1380.SK WIFE.N))
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
		(!W5 (?G1 CAUSE.V E1377.SK))
		(!W6 (E1377.SK (BEFORE NOW382)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 77:
	; "Tom had an old stove."
	; "It went out one night."
	; "Tom didn't smell the gas."
	; "It made him feel sick."
	; "Tom had to fix it."

; story 78:
	; "Gary loved to ride bikes."
	; "He met a girl who did, too."
	; "He asked her on a date."
	; "They got their bikes together."
	; "They rode around the town."
(setf matches (append matches '( (10.0 0.4)
(EPI-SCHEMA ((THEY1413.SK GET.10591.V BIKE1408.SK (AT.P-ARG TOWN1411.SK)) **
             E1409.SK)
	(:ROLES
		(!R1 (BIKE1408.SK INANIMATE_OBJECT.N))
		(!R2 (TOWN1411.SK LOCATION.N))
		(!R3 (NOT (THEY1413.SK = BIKE1408.SK)))
		(!R4 (BIKE1408.SK (PLUR BIKE.N)))
		(!R5 (BIKE1408.SK (PERTAIN-TO THEY1413.SK)))
		(!R6 (THEY1413.SK AGENT.N))
		(!R7 (E405 (ORIENTS E1409.SK)))
		(!R8 (TOWN1411.SK TOWN.N))
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
)))
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((THEY1413.SK
              ((ADV-A (AROUND.P TOWN1411.SK))
               ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) RIDE.10621.V))))
             ** E1412.SK)
	(:ROLES
		(!R1 (?S INANIMATE_OBJECT.N))
		(!R2 (?S FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (THEY1413.SK AGENT.N))
		(!R5 (TOWN1411.SK TOWN.N))
		(!R6 (BIKE1408.SK (PERTAIN-TO THEY1413.SK)))
		(!R7 (BIKE1408.SK (PLUR BIKE.N)))
		(!R8 (E406 (ORIENTS E1412.SK)))
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
)))
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((THEY1413.SK
              ((ADV-A (AROUND.P TOWN1411.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RIDE.10651.V)))
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
		(!R8 (E406 (ORIENTS E1412.SK)))
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
		(!W5 (?G1 CAUSE.V E1412.SK))
		(!W6 (E1412.SK (BEFORE NOW393)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 79:
	; "The man was cooking."
	; "He knocked over some oil."
	; "The oil fell on the floor."
	; "He did not notice."
	; "He slipped on the oil."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((OIL1417.SK
              ((ADV-A (ON.P FLOOR1422.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.10741.V)))
              ?L2)
             ** E1419.SK)
	(:ROLES
		(!R1 (OIL1417.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (OIL1417.SK OIL.N))
		(!R6 (FLOOR1422.SK FLOOR.N))
		(!R7 (E1419.SK (RIGHT-AFTER U395)))
		(!R8 (E409 (ORIENTS E1423.SK)))
	)
	(:GOALS
		(?G1 (OIL1417.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (OIL1417.SK (AT.P ?L1)))
		(?I2 (NOT (OIL1417.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (OIL1417.SK (AT.P ?L1))))
		(?P2 (OIL1417.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1419.SK))
		(!W2 (?I2 BEFORE E1419.SK))
		(!W3 (?P1 AFTER E1419.SK))
		(!W4 (?P2 AFTER E1419.SK))
		(!W5 (?G1 CAUSE.V E1419.SK))
		(!W6 (E1419.SK (SAME-TIME NOW396)))
		(!W7 (E1423.SK (BEFORE NOW396)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((MAN1415.SK AVOID_ACTION_TO_AVOID_DISPLEASURE.10771.V
              (KA NOTICE.V))
             ** ?E)
	(:ROLES
		(!R1 (MAN1415.SK AGENT.N))
		(!R2 ((KA NOTICE.V) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (MAN1415.SK MAN.N))
		(!R5 (E410 (ORIENTS E1425.SK)))
	)
	(:GOALS
		(?G1 (MAN1415.SK (WANT.V (THAT (NOT (MAN1415.SK (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (MAN1415.SK (DO.V (KA NOTICE.V)))) CAUSE.V
    (KE (MAN1415.SK (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E1425.SK (NOT (MAN1415.SK (DO.V (KA NOTICE.V)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E1425.SK))
		(!W2 (E1425.SK (BEFORE NOW397)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 80:
	; "Tony was out playing with friends."
	; "Some of them were jumping rope."
	; "They asked Tony to jump in."
	; "Tony tried and fell down."
	; "All his friends made fun of him."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((TONY.NAME
              (DOWN.ADV
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.10891.V)))
              ?L2)
             ** E1434.SK)
	(:ROLES
		(!R1 (TONY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (E343 (ORIENTS E1434.SK)))
		(!R6 (E1434.SK (AT-OR-BEFORE NOW402)))
		(!R7 (E414 (ORIENTS E1433.SK)))
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
		(!W5 (?G1 CAUSE.V E1434.SK))
		(!W6 (E1433.SK (BEFORE NOW402)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 81:
	; "A new movie just came out."
	; "I was very excited."
	; "I took all my friends with me."
	; "When we got there though, we were sad."
	; "It only lasted one hour."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME.PRO ((ADV-A (WITH.P ME.PRO)) TAKE.11041.V) FRIEND1444.SK
              (AT.P-ARG ?L))
             ** E1445.SK)
	(:ROLES
		(!R1 (ME.PRO AGENT.N))
		(!R2 (FRIEND1444.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (ME.PRO = FRIEND1444.SK)))
		(!R5 (FRIEND1444.SK (PERTAIN-TO ME.PRO)))
		(!R6 (FRIEND1444.SK (PLUR FRIEND.N)))
		(!R7 (E419 (ORIENTS E1445.SK)))
	)
	(:GOALS
		(?G1 (ME.PRO (WANT.V (THAT (ME.PRO (HAVE.V FRIEND1444.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (ME.PRO HAVE.V FRIEND1444.SK)))
		(?I2 (ME.PRO (AT.P ?L)))
		(?I3 (FRIEND1444.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (ME.PRO HAVE.V FRIEND1444.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1445.SK))
		(!W2 (?I1 PRECOND-OF E1445.SK))
		(!W3 (?I2 PRECOND-OF E1445.SK))
		(!W4 (?I3 PRECOND-OF E1445.SK))
		(!W5 (?P1 POSTCOND-OF E1445.SK))
		(!W6 (E1445.SK (BEFORE NOW406)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 82:
	; "The man had a craving."
	; "He ignored it."
	; "The craving grew."
	; "He gave into the craving."
	; "The man felt guilty."
(setf matches (append matches '( (5.0 0.1)
(EPI-SCHEMA ((MAN1453.SK
              ((ADV-A (INTO.P CRAVING1455.SK))
               ((ADV-A (TO.P MAN1453.SK)) GIVE.11191.V))
              MAN1453.SK CRAVING1455.SK)
             ** E1463.SK)
	(:ROLES
		(!R1 (CRAVING1455.SK INANIMATE_OBJECT.N))
		(!R2 (MAN1453.SK AGENT.N))
		(!R3 (E423 (ORIENTS E1456.SK)))
		(!R4 (E1452.SK (RIGHT-AFTER U408)))
		(!R5 (CRAVING1455.SK CRAVING.N))
		(!R6 (MAN1453.SK MAN.N))
		(!R7 (E426 (ORIENTS E1463.SK)))
	)
	(:GOALS
		(?G1 (MAN1453.SK (WANT.V (THAT (MAN1453.SK (HAVE.V CRAVING1455.SK))))))
	)
	(:PRECONDS
		(E1452.SK (MAN1453.SK HAVE.V CRAVING1455.SK))
		(?I2 (NOT (MAN1453.SK HAVE.V CRAVING1455.SK)))
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1453.SK HAVE.V CRAVING1455.SK)))
		(E1456.SK (MAN1453.SK HAVE.V CRAVING1455.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1456.SK (BEFORE NOW409)))
		(!W2 (E1452.SK (SAME-TIME NOW409)))
		(!W3 (E1463.SK (BEFORE NOW412)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (6.0 0.3)
(EPI-SCHEMA ((MAN1453.SK ((ADV-A (INTO.P CRAVING1455.SK)) FEED.11222.V)
              MAN1453.SK CRAVING1455.SK)
             ** E1463.SK)
	(:ROLES
		(!R1 (MAN1453.SK AGENT.N))
		(!R2 (CRAVING1455.SK FOOD.N))
		(!R3 (NOT (MAN1453.SK = MAN1453.SK)))
		(!R4 (NOT (MAN1453.SK = CRAVING1455.SK)))
		(!R5 (E1452.SK (RIGHT-AFTER U408)))
		(!R6 (E423 (ORIENTS E1456.SK)))
		(!R7 (CRAVING1455.SK CRAVING.N))
		(!R8 (MAN1453.SK MAN.N))
		(!R9 (E426 (ORIENTS E1463.SK)))
	)
	(:GOALS
		(?G1 (MAN1453.SK (WANT.V (THAT (NOT (MAN1453.SK HUNGRY.A))))))
		(?G2 (MAN1453.SK (WANT.V (THAT (MAN1453.SK EAT.V CRAVING1455.SK)))))
	)
	(:PRECONDS
		(E1452.SK (MAN1453.SK HAVE.V CRAVING1455.SK))
		(?I2 (MAN1453.SK HUNGRY.A))
	)
	(:STEPS
		(?E1 (MAN1453.SK EAT.11221.V CRAVING1455.SK))
	)
	(:POSTCONDS
		(?P1 (NOT (MAN1453.SK (HAVE.V CRAVING1455.SK))))
		(?P2 (NOT (MAN1453.SK HUNGRY.A)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 AFTER E1463.SK))
		(!W2 (E1452.SK (SAME-TIME NOW409)))
		(!W3 (E1456.SK (BEFORE NOW409)))
		(!W4 (E1463.SK (BEFORE NOW412)))
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
		(!S1 ((?X_A<- ?E1) = E423))
		(!S2 ((?X_B<- ?E1) = U408))
		(!S3 ((?X_C<- ?E1) = CRAVING1455.SK))
		(!S4 ((?X_D<- ?E1) = MAN1453.SK))
		(!S5 ((?X_E<- ?E1) = E1456.SK))
		(!S6 ((?X_F<- ?E1) = E1452.SK))
		(!S7 ((?X_G<- ?E1) = NOW409))
		(!S8 ((?E1<- ?E1) = ?E1))
	)
)
)))

; story 83:
	; "Little Alice had a doll."
	; "It was her favorite."
	; "Once Mark came to visit."
	; "He broke the doll."
	; "Alice cried."

; story 84:
	; "Tom wanted to start a farm."
	; "Tom saved up money to buy a farm."
	; "He went to the auction."
	; "He bought some goats."
	; "He started the farm with his new goats."
(setf matches (append matches '( (11.0 0.3)
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (FROM.P FARM1484.SK))
               ((ADV-A (TO.P AUCTION1487.SK)) GO.11523.V))
              AUCTION1487.SK)
             ** E1488.SK)
	(:ROLES
		(!R1 (FARM1484.SK LOCATION.N))
		(!R2 (AUCTION1487.SK LOCATION.N))
		(!R3 (NOT (FARM1484.SK = AUCTION1487.SK)))
		(!R4 (HE.PRO MALE.A))
		(!R5 (HE.PRO AGENT.N))
		(!R6 (AUCTION1487.SK AUCTION.N))
		(!R7 (E435 (ORIENTS E1488.SK)))
		(!R8 (OBJECT1496.SK (PERTAIN-TO HE.PRO)))
		(!R9 (FARM1484.SK FARM.N))
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
		(!W5 (?G1 CAUSE.V E1488.SK))
		(!W6 (E1488.SK (BEFORE NOW421)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 85:
	; "Mary and Lucy were playing in the park."
	; "Some little boy came to them."
	; "He took the ball from Lucy."
	; "He kicked it far away from them."
	; "Lucy started to cry."
(setf matches (append matches '( (10.0 0.4)
(EPI-SCHEMA ((BOY1500.SK ((ADV-A (FROM.P LUCY.NAME)) TAKE.11671.V) BALL1504.SK
              (AT.P-ARG PARK1499.SK))
             ** E1505.SK)
	(:ROLES
		(!R1 (BOY1500.SK AGENT.N))
		(!R2 (BALL1504.SK INANIMATE_OBJECT.N))
		(!R3 (PARK1499.SK LOCATION.N))
		(!R4 (NOT (BOY1500.SK = BALL1504.SK)))
		(!R5 (BOY1500.SK LITTLE.A))
		(!R6 (BOY1500.SK BOY.N))
		(!R7 (BALL1504.SK BALL.N))
		(!R8 (E440 (ORIENTS E1505.SK)))
		(!R9 (PARK1499.SK PARK.N))
	)
	(:GOALS
		(?G1 (BOY1500.SK (WANT.V (THAT (BOY1500.SK (HAVE.V BALL1504.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (BOY1500.SK HAVE.V BALL1504.SK)))
		(?I2 (BOY1500.SK (AT.P PARK1499.SK)))
		(?I3 (BALL1504.SK (AT.P PARK1499.SK)))
	)
	(:POSTCONDS
		(?P1 (BOY1500.SK HAVE.V BALL1504.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E1505.SK))
		(!W2 (?I1 PRECOND-OF E1505.SK))
		(!W3 (?I2 PRECOND-OF E1505.SK))
		(!W4 (?I3 PRECOND-OF E1505.SK))
		(!W5 (?P1 POSTCOND-OF E1505.SK))
		(!W6 (E1505.SK (BEFORE NOW426)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (5.0 0.2)
(EPI-SCHEMA (((SET-OF MARY.NAME LUCY.NAME)
              ((ADV-A (IN.P PARK1499.SK)) ((ADV-A (WITH.P ?T)) PLAY.11701.V))
              ?G)
             ** E1498.SK)
	(:ROLES
		(!R1 ((SET-OF MARY.NAME LUCY.NAME) AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (?G GAME.N))
		(!R5 (PARK1499.SK PARK.N))
		(!R6 (E438 (ORIENTS E1498.SK)))
	)
	(:GOALS
		(?G1
   ((SET-OF MARY.NAME LUCY.NAME) (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 ((SET-OF MARY.NAME LUCY.NAME) HAVE.V ?T))
	)
	(:POSTCONDS
		(?P1 ((SET-OF MARY.NAME LUCY.NAME) EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E1498.SK (BEFORE NOW424)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (11.0 0.3)
(EPI-SCHEMA ((BOY1500.SK
              ((ADV-A (FROM.P PARK1499.SK))
               ((ADV-A (TO.P MARY.NAME)) COME.11731.V))
              MARY.NAME)
             ** E1502.SK)
	(:ROLES
		(!R1 (BOY1500.SK AGENT.N))
		(!R2 (PARK1499.SK LOCATION.N))
		(!R3 (MARY.NAME LOCATION.N))
		(!R4 (NOT (PARK1499.SK = MARY.NAME)))
		(!R5 (BOY1500.SK LITTLE.A))
		(!R6 (BOY1500.SK BOY.N))
		(!R7 (E439 (ORIENTS E1502.SK)))
		(!R8 (PARK1499.SK PARK.N))
	)
	(:GOALS
		(?G1 (BOY1500.SK (WANT.V (KA ((ADV-A (AT.P MARY.NAME)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BOY1500.SK (AT.P PARK1499.SK)))
		(?I2 (NOT (BOY1500.SK (AT.P MARY.NAME))))
	)
	(:POSTCONDS
		(?P1 (NOT (BOY1500.SK (AT.P PARK1499.SK))))
		(?P2 (BOY1500.SK (AT.P MARY.NAME)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E1502.SK))
		(!W2 (?I2 BEFORE E1502.SK))
		(!W3 (?P1 AFTER E1502.SK))
		(!W4 (?P2 AFTER E1502.SK))
		(!W5 (?G1 CAUSE.V E1502.SK))
		(!W6 (E1502.SK (BEFORE NOW425)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 86:
	; "Larry found a hurt bird."
	; "He put it in a shoe box."
	; "He fed the bird."
	; "The bird survived."
	; "Larry kept it in a cage in his room."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((LARRY.NAME FIND.11851.V BIRD1514.SK) ** E1515.SK)
	(:ROLES
		(!R1 (LARRY.NAME AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (BIRD1514.SK HURT.A))
		(!R4 (BIRD1514.SK BIRD.N))
		(!R5 (E443 (ORIENTS E1515.SK)))
		(!R6 (ROOM1530.SK (PERTAIN-TO LARRY.NAME)))
		(!R7 (ROOM1530.SK ROOM.N))
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
)))

; story 87:
	; "Lucy had a lot of split ends."
	; "She had to do something about it."
	; "She got some scissors."
	; "She then cut them off."
	; "She then looked great."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((LUCY.NAME GET.11971.V LOT1535.SK (AT.P-ARG ?L)) ** E1542.SK)
	(:ROLES
		(!R1 (LUCY.NAME AGENT.N))
		(!R2 (LOT1535.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (LUCY.NAME = LOT1535.SK)))
		(!R5
   (LOT1535.SK
    (OF.P
     (K (L #:G1722248 (AND (#:G1722248 SPLIT.A) (#:G1722248 (PLUR END.N))))))))
		(!R6 (LOT1535.SK LOT.N))
		(!R7 (E448 (ORIENTS E1536.SK)))
		(!R8 (SCISSOR1541.SK (PLUR SCISSOR.N)))
		(!R9 (E450 (ORIENTS E1542.SK)))
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
)))

; story 88:
	; "It was raining all day yesterday."
	; "We were stuck in the house."
	; "We started to get very bored."
	; "We played some games."
	; "It was a long day."
(setf matches (append matches '( (5.0 0.2)
(EPI-SCHEMA ((WE.PRO ((ADV-A (WITH.P ?T)) PLAY.12121.V) GAME1553.SK) **
             E1554.SK)
	(:ROLES
		(!R1 (WE.PRO AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (GAME1553.SK GAME.N))
		(!R5 (GAME1553.SK (PLUR GAME.N)))
		(!R6 (E457 (ORIENTS E1554.SK)))
	)
	(:GOALS
		(?G1 (WE.PRO (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(?I1 (WE.PRO HAVE.V ?T))
	)
	(:POSTCONDS
		(?P1 (WE.PRO EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E1554.SK (BEFORE NOW442)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (4.0 0.4)
(EPI-SCHEMA ((WE.PRO PLAY.12151.V GAME1553.SK) ** E1554.SK)
	(:ROLES
		(!R1 (WE.PRO AGENT.N))
		(!R2 (GAME1553.SK INANIMATE_OBJECT.N))
		(!R3 (GAME1553.SK (PLUR GAME.N)))
		(!R4 (E457 (ORIENTS E1554.SK)))
	)
	(:GOALS
		(?G1 (WE.PRO (WANT.V (THAT (GAME1553.SK EXIST.V)))))
		(?G2 (WE.PRO (WANT.V (KA (HAVE.V GAME1553.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (GAME1553.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (GAME1553.SK EXIST.V))
		(?P2 (WE.PRO (HAVE.V GAME1553.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1554.SK (BEFORE NOW442)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 89:
	; "Aaron had a slight cold."
	; "His mother told him not to swim."
	; "Aaron's mother went to the store."
	; "He went and swam anyway."
	; "Aaron got sick."

; story 90:
	; "Sue had a puppy she loved."
	; "One day it ran away."
	; "Sue was so sad."
	; "One day her dad said Sue I have something for you."
	; "It was a new puppy."

; story 91:
	; "Tom liked Tina."
	; "He wanted to ask her to court her."
	; "She said yes."
	; "He was so excited."
	; "They made it official."

; story 92:
	; "The boy found glue."
	; "He poured it out."
	; "It covered the carpet."
	; "It dried in one hour."
	; "His mom was very upset."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((BOY1604.SK FIND.12541.V (K GLUE.N)) ** E1603.SK)
	(:ROLES
		(!R1 (BOY1604.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (BOY1604.SK BOY.N))
		(!R4 (E1603.SK (RIGHT-AFTER U458)))
		(!R5 (E478 (ORIENTS E1606.SK)))
	)
	(:PRECONDS
		(?I1 (BOY1604.SK (AT.P ?L)))
		(?I2 ((K GLUE.N) (AT.P ?L)))
		(?I3 (BOY1604.SK ((ADV-A (FOR.P (K GLUE.N))) SEARCH.V)))
		(?I4 (NOT (BOY1604.SK (KNOW.V (THAT ((K GLUE.N) (AT.P ?L)))))))
		(?I5 (NOT (BOY1604.SK (HAVE.V (K GLUE.N)))))
	)
	(:POSTCONDS
		(?P1 (BOY1604.SK (KNOW.V (THAT ((K GLUE.N) (AT.P ?L))))))
		(?P2 (BOY1604.SK (HAVE.V (K GLUE.N))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1603.SK (SAME-TIME NOW459)))
		(!W2 (E1606.SK (BEFORE NOW459)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 93:
	; "The man dug a grave."
	; "He put his dead dog in it."
	; "He filled it in with dirt."
	; "He planted a tree on top of it."
	; "He thought of the dog when he saw the tree."

; story 94:
	; "Bob wanted to buy a new book."
	; "He didn't have the money."
	; "Bob found a ten dollar bill on the ground."
	; "He picked it up."
	; "He used the money to buy the book."

; story 95:
	; "The man looked into the window of the house."
	; "He saw a woman inside."
	; "He watched the woman."
	; "The woman noticed him watching."
	; "She called the police."

; story 96:
	; "I had a pony."
	; "I took it for a ride one day."
	; "I rode over the hills near my house."
	; "My pony stumbled on a large rock."
	; "My pony hurt its leg."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((ME1701.SK ((ADV-A (FOR.P RIDE1677.SK)) TAKE.13021.V) PONY1672.SK
              (AT.P-ARG ?L))
             ** E1679.SK)
	(:ROLES
		(!R1 (PONY1672.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1701.SK = PONY1672.SK)))
		(!R4 (E499 (ORIENTS E1673.SK)))
		(!R5 (PONY1672.SK PONY.N))
		(!R6 (PONY1672.SK (PERTAIN-TO ME1701.SK)))
		(!R7 (ME1701.SK AGENT.N))
		(!R8 (RIDE1677.SK RIDE.N))
		(!R9 (DAY1678.SK DAY.N))
		(!R10 (RIDE1677.SK (= DAY1678.SK)))
		(!R11 (E500 (ORIENTS E1679.SK)))
		(!R12 (HOUSE1685.SK (PERTAIN-TO ME1701.SK)))
		(!R13 (HOUSE1685.SK HOUSE.N))
		(!R14 (LEG1699.SK (PERTAIN-TO PONY1672.SK)))
		(!R15 (LEG1699.SK LEG.N))
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
)))

; story 97:
	; "I took my dog to get a bath."
	; "My dog loves to take a bath."
	; "I got the bath water ready for him."
	; "My dog jumped into the bath."
	; "He splashed me with water."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME1723.SK TAKE.13201.V OBJECT1703.SK (AT.P-ARG ?L)) ** E1708.SK)
	(:ROLES
		(!R1 (OBJECT1703.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME1723.SK = OBJECT1703.SK)))
		(!R4 (ME1723.SK AGENT.N))
		(!R5 (OBJECT1703.SK (= DOG1707.SK)))
		(!R6 (DOG1707.SK DOG.N))
		(!R7 (DOG1707.SK (PERTAIN-TO ME1723.SK)))
		(!R8 (E504 (ORIENTS E1708.SK)))
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
)))

; story 98:
	; "We just got a new rug."
	; "It was very plush."
	; "Our cat started playing with the edge."
	; "My wife yelled at the cat."
	; "She ran away."
(setf matches (append matches '( (10.0 0.4)
(EPI-SCHEMA ((WE1743.SK GET.13351.V RUG1729.SK (AT.P-ARG EDGE1735.SK)) **
             E1730.SK)
	(:ROLES
		(!R1 (RUG1729.SK INANIMATE_OBJECT.N))
		(!R2 (EDGE1735.SK LOCATION.N))
		(!R3 (NOT (WE1743.SK = RUG1729.SK)))
		(!R4 (RUG1729.SK RUG.N))
		(!R5 (RUG1729.SK NEW.A))
		(!R6 (WE1743.SK AGENT.N))
		(!R7 (E509 (ORIENTS E1730.SK)))
		(!R8 (CAT1733.SK (PERTAIN-TO WE1743.SK)))
		(!R9 (CAT1733.SK CAT.N))
		(!R10 (EDGE1735.SK EDGE.N))
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
)))

; story 99:
	; "The man went to prison."
	; "He was innocent."
	; "He asked for another trial."
	; "It took five years to get one."
	; "He was found to be innocent."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((MAN1746.SK ((ADV-A (FOR.P (KA INNOCENT.A))) FIND.13531.V) ?O) **
             E1752.SK)
	(:ROLES
		(!R1 (MAN1746.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (MAN1746.SK MAN.N))
		(!R4 (E517 (ORIENTS E1752.SK)))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MAN1746.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K PRISON.N))) GO.13561.V))
              (K PRISON.N))
             ** E1745.SK)
	(:ROLES
		(!R1 (MAN1746.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 ((K PRISON.N) LOCATION.N))
		(!R4 (NOT (?L1 = (K PRISON.N))))
		(!R5 (MAN1746.SK MAN.N))
		(!R6 (E1745.SK (RIGHT-AFTER U493)))
		(!R7 (E514 (ORIENTS E1748.SK)))
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
		(!W5 (?G1 CAUSE.V E1745.SK))
		(!W6 (E1745.SK (SAME-TIME NOW494)))
		(!W7 (E1748.SK (BEFORE NOW494)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; (setf matches (list))
; (setf chain-matches (list))
; story 0:
	; "Frank wanted to get buff."
	; "So he got some weights."
	; "He started to work out."
	; "He worked out for months ."
	; "Frank got buff."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((FRANK.NAME GET.1.V WEIGHT14.SK (AT.P-ARG ?L)) ** E15.SK)
	(:ROLES
		(!R1 (FRANK.NAME AGENT.N))
		(!R2 (WEIGHT14.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (FRANK.NAME = WEIGHT14.SK)))
		(!R5 (WEIGHT14.SK (PLUR WEIGHT.N)))
		(!R6 (E0 (ORIENTS E15.SK)))
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
)))

; story 1:
	; "We had a read in one day at school."
	; "All we did the whole day was read."
	; "I took some books from home."
	; "I sat in a bean bag."
	; "It was the most relaxing day ever."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME48.SK ((ADV-A (FROM.P (K HOME.N))) TAKE.153.V) BOOK35.SK
              (AT.P-ARG ?L))
             ** E38.SK)
	(:ROLES
		(!R1 (BOOK35.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME48.SK = BOOK35.SK)))
		(!R4 (BOOK35.SK (PLUR BOOK.N)))
		(!R5 (ME48.SK AGENT.N))
		(!R6 (E6 (ORIENTS E38.SK)))
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
)))
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((ME48.SK
              ((ADV-A (ON.P BAG42.SK)) ((ADV-A (IN.P BAG42.SK)) SIT.181.V)))
             ** E43.SK)
	(:ROLES
		(!R1 (BAG42.SK INANIMATE_OBJECT.N))
		(!R2 (BAG42.SK FURNITURE.N))
		(!R3 (?L LOCATION.N))
		(!R4 (ME48.SK AGENT.N))
		(!R5 (BAG42.SK ((NN BEAN.N) BAG.N)))
		(!R6 (E8 (ORIENTS E43.SK)))
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
)))

; story 2:
	; "I loved swimming at the beach."
	; "One day I saw a big shark."
	; "The shark suddenly attacked me."
	; "I lost my left hand."
	; "I never went back to the beach ever since."

; story 3:
	; "Shannon saw a bird in the tree in her backyard."
	; "It was making a nest!"
	; "It took the bird hours."
	; "Finally, she was done."
	; "She sat down in the nest to rest."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((SHANNON.NAME
              (DOWN.ADV
               ((ADV-A (IN.P NEST89.SK))
                ((ADV-A (ON.P NEST89.SK)) SIT.451.V))))
             ** E106.SK)
	(:ROLES
		(!R1 (SHANNON.NAME AGENT.N))
		(!R2 (NEST89.SK INANIMATE_OBJECT.N))
		(!R3 (NEST89.SK FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (NEST89.SK NEST.N))
		(!R6 (BACKYARD86.SK BACKYARD.N))
		(!R7 (BACKYARD86.SK (PERTAIN-TO SHANNON.NAME)))
		(!R8 (E19 (ORIENTS E106.SK)))
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
)))
(setf matches (append matches '( (10.0 0.4)
(EPI-SCHEMA ((TREE85.SK TAKE.481.V HOURS93.SK (AT.P-ARG BACKYARD86.SK)) **
             E94.SK)
	(:ROLES
		(!R1 (TREE85.SK AGENT.N))
		(!R2 (HOURS93.SK INANIMATE_OBJECT.N))
		(!R3 (BACKYARD86.SK LOCATION.N))
		(!R4 (NOT (TREE85.SK = HOURS93.SK)))
		(!R5 (TREE85.SK TREE.N))
		(!R6 (HOURS93.SK ((NN BIRD.N) (PLUR HOUR.N))))
		(!R7 (BIRD84.SK BIRD.N))
		(!R8 (BIRD84.SK (IN.P TREE85.SK)))
		(!R9 (E17 (ORIENTS E94.SK)))
		(!R10 (BACKYARD86.SK BACKYARD.N))
		(!R11 (BACKYARD86.SK (PERTAIN-TO SHANNON.NAME)))
	)
	(:GOALS
		(?G1 (TREE85.SK (WANT.V (THAT (TREE85.SK (HAVE.V HOURS93.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (TREE85.SK HAVE.V HOURS93.SK)))
		(?I2 (TREE85.SK (AT.P BACKYARD86.SK)))
		(?I3 (HOURS93.SK (AT.P BACKYARD86.SK)))
	)
	(:POSTCONDS
		(?P1 (TREE85.SK HAVE.V HOURS93.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E94.SK))
		(!W2 (?I1 PRECOND-OF E94.SK))
		(!W3 (?I2 PRECOND-OF E94.SK))
		(!W4 (?I3 PRECOND-OF E94.SK))
		(!W5 (?P1 POSTCOND-OF E94.SK))
		(!W6 (E94.SK (BEFORE NOW17)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 4:
	; "I went on a run at the park one day."
	; "It was early morning."
	; "I saw my friend's car."
	; "She was running with my other friend."
	; "They were shirtless."
(setf matches (append matches '( (10.0 0.1)
(EPI-SCHEMA ((SHE.PRO
              ((ADV-A (WITH.P OBJECT117.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P PARK109.SK)) RUN.661.V)))
              ?L2)
             ** E116.SK)
	(:ROLES
		(!R1 (PARK109.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (PARK109.SK = ?L2)))
		(!R4 (SHE.PRO FEMALE.A))
		(!R5 (SHE.PRO AGENT.N))
		(!R6 (OBJECT117.SK (PERTAIN-TO ME.PRO)))
		(!R7 (E23 (ORIENTS E116.SK)))
		(!R8 (PARK109.SK PARK.N))
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
		(!W5 (?G1 CAUSE.V E116.SK))
		(!W6 (E116.SK (BEFORE NOW23)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 5:
	; "The wind was howling."
	; "A storm had just hit."
	; "Everyone ran inside to get out of it."
	; "The power went out."
	; "Everyone hunkered down to hide."

; story 6:
	; "The man put on a hat."
	; "It made his head itch."
	; "He looked at the label."
	; "The label said it was wool."
	; "The man decided he didn't like wool."
(setf matches (append matches '( (4.0 0.4)
(EPI-SCHEMA ((IT.PRO MAKE.811.V ITCH145.SK) ** E146.SK)
	(:ROLES
		(!R1 (IT.PRO AGENT.N))
		(!R2 (ITCH145.SK INANIMATE_OBJECT.N))
		(!R3 (ITCH145.SK ((NN HEAD.N) ITCH.N)))
		(!R4 (ITCH145.SK (PERTAIN-TO MAN137.SK)))
		(!R5 (MAN137.SK MAN.N))
		(!R6 (E32 (ORIENTS E146.SK)))
	)
	(:GOALS
		(?G1 (IT.PRO (WANT.V (THAT (ITCH145.SK EXIST.V)))))
		(?G2 (IT.PRO (WANT.V (KA (HAVE.V ITCH145.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (ITCH145.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (ITCH145.SK EXIST.V))
		(?P2 (IT.PRO (HAVE.V ITCH145.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E146.SK (BEFORE NOW31)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 7:
	; "Maeva got money for her birthday."
	; "She had a list of things to buy."
	; "She went out with her friends."
	; "They bought clothes."
	; "She went home."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((MAEVA.NAME GET.931.V OBJECT162.SK (AT.P-ARG ?L)) ** E166.SK)
	(:ROLES
		(!R1 (MAEVA.NAME AGENT.N))
		(!R2 (OBJECT162.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (MAEVA.NAME = OBJECT162.SK)))
		(!R5 (E37 (ORIENTS E166.SK)))
		(!R6 (LIST171.SK LIST.N))
		(!R7 (BIRTHDAY165.SK (PERTAIN-TO MAEVA.NAME)))
		(!R8 (BIRTHDAY165.SK BIRTHDAY.N))
		(!R9 (OBJECT172.SK (= (K (PLUR THING.N)))))
		(!R10 (LIST171.SK (OF.P OBJECT172.SK)))
		(!R11 (E39 (ORIENTS E181.SK)))
		(!R12 (FRIEND185.SK (PERTAIN-TO MAEVA.NAME)))
		(!R13 (FRIEND185.SK (PLUR FRIEND.N)))
		(!R14 (OBJECT162.SK (= (K MONEY.N))))
		(!R15 (OBJECT162.SK (FOR.P BIRTHDAY165.SK)))
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
)))
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((MAEVA.NAME
              ((ADV-A (WITH.P FRIEND185.SK))
               (OUT.ADV ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.1021.V))))
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
		(!R9 (E40 (ORIENTS E186.SK)))
		(!R10 (OBJECT162.SK (= (K MONEY.N))))
		(!R11 (OBJECT162.SK (FOR.P BIRTHDAY165.SK)))
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
		(!W5 (?G1 CAUSE.V E186.SK))
		(!W6 (E186.SK (BEFORE NOW37)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 8:
	; "I went to this new pizza place yesterday."
	; "It was absolutely amazing."
	; "I could not stop eating."
	; "I wanted more."
	; "I knew I had to go back."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME197.SK
              ((ADV-A (IN.P (K YESTERDAY.N)))
               ((ADV-A (TO.P OBJECT191.SK)) ((ADV-A (FROM.P ?L1)) GO.1081.V)))
              OBJECT191.SK)
             ** E192.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (OBJECT191.SK LOCATION.N))
		(!R3 (NOT (?L1 = OBJECT191.SK)))
		(!R4 (ME197.SK AGENT.N))
		(!R5 (E43 (ORIENTS E192.SK)))
		(!R6 (OBJECT191.SK (ATTENDED-TO-BY*.A SPEAKER)))
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
		(!W5 (?G1 CAUSE.V E192.SK))
		(!W6 (E192.SK (BEFORE NOW40)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 9:
	; "Ellen moved to a new city."
	; "She didn't know where anything was."
	; "It was hard."
	; "Living in her hometown was easier."
	; "Ellen moved back home."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ELLEN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P CITY203.SK)) MOVE.1231.V))
              CITY203.SK)
             ** E204.SK)
	(:ROLES
		(!R1 (ELLEN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (CITY203.SK LOCATION.N))
		(!R4 (NOT (?L1 = CITY203.SK)))
		(!R5 (CITY203.SK CITY.N))
		(!R6 (CITY203.SK NEW.A))
		(!R7 (E47 (ORIENTS E204.SK)))
		(!R8 (HOMETOWN211.SK HOMETOWN.N))
		(!R9 (HOMETOWN211.SK (PERTAIN-TO ELLEN.NAME)))
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
		(!W5 (?G1 CAUSE.V E204.SK))
		(!W6 (E204.SK (BEFORE NOW45)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 10:
	; "Allie wanted an iPad."
	; "She really liked it."
	; "But she wanted a new one."
	; "So she went to the store."
	; "When she got back she had a newer one."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((ALLIE.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE231.SK)) GO.1381.V))
              STORE231.SK)
             ** E232.SK)
	(:ROLES
		(!R1 (ALLIE.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE231.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE231.SK)))
		(!R5 (E55 (ORIENTS E219.SK)))
		(!R6 (ALLIE.NAME IPAD.N))
		(!R7 (STORE231.SK STORE.N))
		(!R8 (E58 (ORIENTS E232.SK)))
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
		(!W5 (E219.SK CAUSE.V E232.SK))
		(!W6 (E219.SK (BEFORE NOW50)))
		(!W7 (E232.SK (BEFORE NOW53)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 11:
	; "A little boy sat under the apple tree."
	; "He saw an apple fall."
	; "He wondered why it did that."
	; "His interest soared."
	; "He studied it for years."
(setf matches (append matches '( (4.0 0.1)
(EPI-SCHEMA ((BOY240.SK
              ((ADV-A (UNDER.P TREE244.SK))
               ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.1531.V))))
             ** E245.SK)
	(:ROLES
		(!R1 (BOY240.SK AGENT.N))
		(!R2 (?S INANIMATE_OBJECT.N))
		(!R3 (?S FURNITURE.N))
		(!R4 (?L LOCATION.N))
		(!R5 (BOY240.SK BOY.N))
		(!R6 (BOY240.SK LITTLE.A))
		(!R7 (TREE244.SK ((NN APPLE.N) TREE.N)))
		(!R8 (E60 (ORIENTS E245.SK)))
		(!R9 (INTEREST253.SK (PERTAIN-TO BOY240.SK)))
		(!R10 (INTEREST253.SK INTEREST.N))
	)
	(:GOALS
		(?G1 (BOY240.SK (WANT.V (KA REST.V))))
	)
	(:PRECONDS
		(?I1 (BOY240.SK (AT.P ?L)))
		(?I2 (?S (AT.P ?L)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E245.SK (BEFORE NOW55)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 12:
	; "Dad let me plant a flower."
	; "It grew very quickly."
	; "I made sure to water it every day."
	; "Now there is a bunch of them."
	; "He says I have a green thumb."

; story 13:
	; "It was a very long day."
	; "It was also very hot outside."
	; "Fred was about to walk out the door."
	; "Then he remembered the sunscreen."
	; "He had to go back outside."

; story 14:
	; "A little baby was sleeping."
	; "Her siblings tried to wake her up."
	; "She didn't wake up."
	; "She slept all day."
	; "She stayed up all night."

; story 15:
	; "A New Mexican restaurant opened up."
	; "It looked good."
	; "Nance wanted to go."
	; "When she went she loved it."
	; "She was happy it was good."

; story 16:
	; "The cat meowed at the door."
	; "The owner let the cat out."
	; "The cat played in a field."
	; "He came back with a mouse."
	; "The cat gave the mouse to the owner."
(setf matches (append matches '( (3.5 0)
(EPI-SCHEMA ((CAT313.SK ((ADV-A (TO.P MOUSE329.SK)) GIVE.2131.V) MOUSE329.SK
              ?O)
             ** E331.SK)
	(:ROLES
		(!R1 (CAT313.SK AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (MOUSE329.SK AGENT.N))
		(!R4 (CAT313.SK CAT.N))
		(!R5 (OWNER320.SK OWNER.N))
		(!R6 (MOUSE329.SK MOUSE.N))
		(!R7 (E331.SK (RIGHT-AFTER U83)))
		(!R8 (E94 (ORIENTS E336.SK)))
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
)))
(setf matches (append matches '( (5.0 0.2)
(EPI-SCHEMA ((CAT313.SK
              ((ADV-A (IN.P FIELD326.SK)) ((ADV-A (WITH.P ?T)) PLAY.2161.V))
              ?G)
             ** E323.SK)
	(:ROLES
		(!R1 (CAT313.SK AGENT.N))
		(!R2 (?T TOY.N))
		(!R3 (?T INANIMATE_OBJECT.N))
		(!R4 (?G GAME.N))
		(!R5 (CAT313.SK CAT.N))
		(!R6 (FIELD326.SK FIELD.N))
		(!R7 (E323.SK (RIGHT-AFTER U81)))
		(!R8 (E92 (ORIENTS E327.SK)))
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
)))
(setf matches (append matches '( (10.0 0.1)
(EPI-SCHEMA ((HE.PRO
              ((ADV-A (WITH.P MOUSE329.SK))
               (BACK.ADV
                ((ADV-A (TO.P ?L2))
                 ((ADV-A (FROM.P FIELD326.SK)) COME.2191.V))))
              ?L2)
             ** E330.SK)
	(:ROLES
		(!R1 (FIELD326.SK LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (FIELD326.SK = ?L2)))
		(!R4 (HE.PRO MALE.A))
		(!R5 (HE.PRO AGENT.N))
		(!R6 (MOUSE329.SK MOUSE.N))
		(!R7 (E93 (ORIENTS E330.SK)))
		(!R8 (FIELD326.SK FIELD.N))
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
		(!W5 (?G1 CAUSE.V E330.SK))
		(!W6 (E330.SK (BEFORE NOW83)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 17:
	; "I was having a bad day."
	; "My hair was a mess."
	; "Then I went to cvs."
	; "When I was there I got hair stuff."
	; "Then I used it and it was great."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME350.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K (PLUR CV.N)))) GO.2281.V))
              (K (PLUR CV.N)))
             ** E344.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K (PLUR CV.N)) LOCATION.N))
		(!R3 (NOT (?L1 = (K (PLUR CV.N)))))
		(!R4 (ME350.SK AGENT.N))
		(!R5 (HAIR340.SK HAIR.N))
		(!R6 (HAIR340.SK (PERTAIN-TO ME350.SK)))
		(!R7 (E98 (ORIENTS E344.SK)))
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
		(!W5 (?G1 CAUSE.V E344.SK))
		(!W6 (E344.SK (BEFORE NOW87)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.5 0)
(EPI-SCHEMA ((ME350.SK ((ADV-A (TO.P IT351.SK)) GIVE.2311.V) IT351.SK ?O) **
             E349.SK)
	(:ROLES
		(!R1 (?O INANIMATE_OBJECT.N))
		(!R2 (IT351.SK AGENT.N))
		(!R3 (ME350.SK AGENT.N))
		(!R4 (HAIR340.SK HAIR.N))
		(!R5 (HAIR340.SK (PERTAIN-TO ME350.SK)))
		(!R6 (E101 (ORIENTS E349.SK)))
		(!R7 (E102 (ORIENTS E357.SK)))
	)
	(:GOALS
		(?G1 (ME350.SK (WANT.V (THAT (IT351.SK (HAVE.V ?O))))))
	)
	(:PRECONDS
		(?I1 (ME350.SK HAVE.V ?O))
		(?I2 (NOT (IT351.SK HAVE.V ?O)))
	)
	(:POSTCONDS
		(?P1 (NOT (ME350.SK HAVE.V ?O)))
		(?P2 (IT351.SK HAVE.V ?O))
	)
	(:EPISODE-RELATIONS
		(!W1 (E349.SK (BEFORE NOW89)))
		(!W2 (E357.SK (BEFORE NOW89)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 18:
	; "Jay went into the woods by himself."
	; "He suddenly got lost."
	; "He did not know where to go."
	; "He was wandering for an hour."
	; "He finally went out."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((JAY.NAME
              ((ADV-A (INTO.P WOOD367.SK))
               ((ADV-A (BY.P JAY.NAME))
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.2431.V))))
              ?L2)
             ** E368.SK)
	(:ROLES
		(!R1 (JAY.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (WOOD367.SK (PLUR WOOD.N)))
		(!R6 (E103 (ORIENTS E368.SK)))
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
		(!W5 (?G1 CAUSE.V E368.SK))
		(!W6 (E368.SK (BEFORE NOW90)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 19:
	; "I was afraid of my granddad's horse."
	; "It was behind a fence."
	; "I went in there by myself once."
	; "It reared up on its hind legs."
	; "I ran away quickly."

; story 20:
	; "Fred always wanted to know how he would look like in a cap."
	; "He decides to buy one."
	; "Fred loves how he looks in a cap."
	; "His friends love it too."
	; "He is glad he bought a cap."

; story 21:
	; "The boy went off a jump."
	; "He came down hard."
	; "His wheel got bent."
	; "He took it to a shop."
	; "They said the wheel was ruined."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((BOY401.SK ((ADV-A (TO.P SHOP410.SK)) TAKE.2761.V) WHEEL407.SK
              (AT.P-ARG ?L))
             ** E412.SK)
	(:ROLES
		(!R1 (BOY401.SK AGENT.N))
		(!R2 (WHEEL407.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (BOY401.SK = WHEEL407.SK)))
		(!R5 (BOY401.SK BOY.N))
		(!R6 (WHEEL407.SK (PERTAIN-TO BOY401.SK)))
		(!R7 (WHEEL407.SK WHEEL.N))
		(!R8 (SHOP410.SK SHOP.N))
		(!R9 (E121 (ORIENTS E412.SK)))
	)
	(:GOALS
		(?G1 (BOY401.SK (WANT.V (THAT (BOY401.SK (HAVE.V WHEEL407.SK))))))
	)
	(:PRECONDS
		(?I1 (NOT (BOY401.SK HAVE.V WHEEL407.SK)))
		(?I2 (BOY401.SK (AT.P ?L)))
		(?I3 (WHEEL407.SK (AT.P ?L)))
	)
	(:POSTCONDS
		(?P1 (BOY401.SK HAVE.V WHEEL407.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME E412.SK))
		(!W2 (?I1 PRECOND-OF E412.SK))
		(!W3 (?I2 PRECOND-OF E412.SK))
		(!W4 (?I3 PRECOND-OF E412.SK))
		(!W5 (?P1 POSTCOND-OF E412.SK))
		(!W6 (E412.SK (BEFORE NOW108)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((BOY401.SK
              (HARD.ADV
               (DOWN.ADV
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.2791.V))))
              ?L2)
             ** E405.SK)
	(:ROLES
		(!R1 (BOY401.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (BOY401.SK BOY.N))
		(!R6 (E119 (ORIENTS E405.SK)))
		(!R7 (WHEEL407.SK (PERTAIN-TO BOY401.SK)))
		(!R8 (WHEEL407.SK WHEEL.N))
	)
	(:GOALS
		(?G1 (BOY401.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BOY401.SK (AT.P ?L1)))
		(?I2 (NOT (BOY401.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (BOY401.SK (AT.P ?L1))))
		(?P2 (BOY401.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E405.SK))
		(!W2 (?I2 BEFORE E405.SK))
		(!W3 (?P1 AFTER E405.SK))
		(!W4 (?P2 AFTER E405.SK))
		(!W5 (?G1 CAUSE.V E405.SK))
		(!W6 (E405.SK (BEFORE NOW106)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 22:
	; "Bill was at a stop light."
	; "The light was on red."
	; "Billy began to look around while waiting."
	; "He suddenly heard a horn behind him."
	; "The light had turned green."

; story 23:
	; "I was coming through a door at work."
	; "I saw my friend Amy."
	; "I almost ran into her."
	; "She was wearing a purple two piece."
	; "We did not say anything."
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((WE.PRO AVOID_ACTION_TO_AVOID_DISPLEASURE.2821.V
              (KA (SAY.V (K ANYTHING.N))))
             ** ?E)
	(:ROLES
		(!R1 (WE.PRO AGENT.N))
		(!R2 ((KA (SAY.V (K ANYTHING.N))) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (E134 (ORIENTS E449.SK)))
	)
	(:GOALS
		(?G1 (WE.PRO (WANT.V (THAT (NOT (WE.PRO (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (WE.PRO (DO.V (KA (SAY.V (K ANYTHING.N)))))) CAUSE.V
    (KE (WE.PRO (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E449.SK (NOT (WE.PRO (DO.V (KA (SAY.V (K ANYTHING.N)))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E449.SK))
		(!W2 (E449.SK (BEFORE NOW119)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((ME450.SK
              ((ADV-A (THROUGH.P DOOR437.SK))
               ((ADV-A (AT.P (K WORK.N)))
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) COME.2881.V))))
              ?L2)
             ** E436.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 (?L2 LOCATION.N))
		(!R3 (NOT (?L1 = ?L2)))
		(!R4 (DOOR437.SK DOOR.N))
		(!R5 (ME450.SK AGENT.N))
		(!R6 (E129 (ORIENTS E436.SK)))
		(!R7 (FRIEND441.SK (PERTAIN-TO ME450.SK)))
		(!R8 (FRIEND441.SK FRIEND.N))
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
		(!W5 (?G1 CAUSE.V E436.SK))
		(!W6 (E436.SK (BEFORE NOW115)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 24:
	; "Ben came home late at night."
	; "He did not want to wake up his wife."
	; "He did not turn on the light."
	; "He slipped and fell down."
	; "His leg was broken."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((HE.PRO
              (DOWN.ADV
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) FALL.2971.V)))
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
		(!R8 (E124 (ORIENTS E459.SK)))
		(!R9 (E459.SK (AT-OR-BEFORE NOW123)))
		(!R10 (WIFE454.SK WIFE.N))
		(!R11 (WIFE454.SK (PERTAIN-TO BEN.NAME)))
		(!R12 (E138 (ORIENTS E458.SK)))
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
		(!W5 (?G1 CAUSE.V E459.SK))
		(!W6 (E458.SK (BEFORE NOW123)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((BEN.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.3001.V
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
		(!R8 (E137 (ORIENTS E457.SK)))
		(!R9 (BEN.NAME (PERTAIN-TO HE.PRO)))
		(!R10 (HE.PRO MALE.A))
		(!R11 (HE.PRO AGENT.N))
	)
	(:GOALS
		(?G1 (BEN.NAME (WANT.V (THAT (NOT (BEN.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (BEN.NAME (DO.V (KA (TURN_ON.V LIGHT456.SK))))) CAUSE.V
    (KE (BEN.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E457.SK (NOT (BEN.NAME (DO.V (KA (TURN_ON.V LIGHT456.SK))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E457.SK))
		(!W2 (E457.SK (BEFORE NOW122)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 25:
	; "Susie loved clothes."
	; "She got a striped shirt yesterday."
	; "She did not like it."
	; "Finally she liked it."
	; "Susie was happy about it."

; story 26:
	; "The market was rallying."
	; "Kelley was not happy about it."
	; "She didn't want it to go up that much."
	; "She was short."
	; "So she was losing money."

; story 27:
	; "Sandy loved to hike."
	; "On her hike she ran into a bear."
	; "She wasn't sure what to do."
	; "She stayed still and quiet."
	; "The bear finally ran away."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((SANDY.NAME
              ((ADV-A (INTO.P BEAR494.SK))
               ((ADV-S (ON.P HIKE492.SK))
                ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) RUN.3151.V))))
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
		(!R9 (E152 (ORIENTS E495.SK)))
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
		(!W5 (?G1 CAUSE.V E491.SK))
		(!W6 (E491.SK (SAME-TIME NOW136)))
		(!W7 (E495.SK (BEFORE NOW136)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 28:
	; "My granddad has a pond."
	; "He has let me feed the fish."
	; "The fish know you are coming."
	; "The water starts to move."
	; "Then you throw in the food."

; story 29:
	; "Tom wanted a pet."
	; "Tom knew a dog or cat would be too much of a liability."
	; "Tom went to the pet store."
	; "Tom found a lizard he liked."
	; "Tom bought the lizard."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((TOM.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE546.SK)) GO.3481.V))
              STORE546.SK)
             ** E532.SK)
	(:ROLES
		(!R1 (TOM.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE546.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE546.SK)))
		(!R5 (PET523.SK PET.N))
		(!R6 (E156 (ORIENTS E524.SK)))
		(!R7 (STORE546.SK ((NN PET.N) STORE.N)))
		(!R8 (E165 (ORIENTS E532.SK)))
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
		(!W5 (E524.SK CAUSE.V E532.SK))
		(!W6 (E524.SK (BEFORE NOW145)))
		(!W7 (E532.SK (BEFORE NOW147)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 30:
	; "The teacher drew a shape."
	; "She asked for it's name."
	; "The boy said square."
	; "The teacher corrected the boy."
	; "It was a triangle."

; story 31:
	; "Leo is walking home."
	; "He sees a dog stuck in a tree."
	; "He frees the dog from the tree."
	; "The dog runs off."
	; "Leo saved the dog's life."

; story 32:
	; "I got one of those new drones."
	; "It is a lot of fun."
	; "I have been flying it all over town."
	; "It takes some really cool videos."
	; "You will have to come check them out."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME609.SK GET.3901.V PRED?597.SK (AT.P-ARG ?L)) ** E598.SK)
	(:ROLES
		(!R1 (PRED?597.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME609.SK = PRED?597.SK)))
		(!R4 (PRED?597.SK PRED?.N))
		(!R5 (ME609.SK AGENT.N))
		(!R6 (E179 (ORIENTS E598.SK)))
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
)))

; story 33:
	; "I was invited to see a baseball game."
	; "When I sat down I was so bored."
	; "I just wanted to leave."
	; "I had nothing to do."
	; "So I fell asleep."
(setf matches (append matches '( (6.0 0.2)
(EPI-SCHEMA ((ME625.SK ((ADV-A (FOR.P (KA (SEE.V GAME615.SK)))) INVITE.4081.V)
              OBJECT621.SK)
             ** E613.SK)
	(:ROLES
		(!R1 (OBJECT621.SK INANIMATE_OBJECT.N))
		(!R2 (GAME615.SK ((NN BASEBALL.N) GAME.N)))
		(!R3 (E180 (ORIENTS E613.SK)))
		(!R4 (E188 (ORIENTS E619.SK)))
		(!R5 (ME625.SK AGENT.N))
		(!R6 (OBJECT621.SK (= (K NOTHING.N))))
		(!R7 (E189 (ORIENTS E623.SK)))
	)
	(:GOALS
		(E619.SK (ME625.SK (WANT.V (THAT (OBJECT621.SK EXIST.V)))))
		(?G2 (ME625.SK (WANT.V (KA (HAVE.V OBJECT621.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (OBJECT621.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (OBJECT621.SK EXIST.V))
		(E623.SK (ME625.SK (HAVE.V OBJECT621.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E613.SK (BEFORE NOW165)))
		(!W2 (E619.SK (BEFORE NOW167)))
		(!W3 (E623.SK (BEFORE NOW168)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 34:
	; "Tom had a girlfriend he loved very much."
	; "He cut her with his nails one day."
	; "She asked him to cut them."
	; "He cut his nails."
	; "His girlfriend was happy that he cut his nails."

; story 35:
	; "I was afraid to try a gainer."
	; "I had to do it my own way."
	; "I got to the board."
	; "I made the board go up and down."
	; "Then I finally did a gainer."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((ME676.SK ((ADV-A (TO.P BOARD664.SK)) GET.4411.V) ?O
              (AT.P-ARG ?L))
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
		(!R9 (E199 (ORIENTS E668.SK)))
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
)))

; story 36:
	; "The girls went to the pond."
	; "They caught a giant frog."
	; "They took it home and put it in a bucket."
	; "They showed it to all their friends."
	; "The frog lived with them for a month."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((GIRLS678.SK (HOME.ADV TAKE.4561.V) FROG684.SK (AT.P-ARG ?L)) **
             E690.SK)
	(:ROLES
		(!R1 (GIRLS678.SK AGENT.N))
		(!R2 (FROG684.SK INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (GIRLS678.SK = FROG684.SK)))
		(!R5 (GIRLS678.SK (PLUR GIRL.N)))
		(!R6 (FROG684.SK GIANT.A))
		(!R7 (FROG684.SK FROG.N))
		(!R8 (E205 (ORIENTS E690.SK)))
		(!R9 (FRIEND695.SK (PERTAIN-TO GIRLS678.SK)))
		(!R10 (FRIEND695.SK (PLUR FRIEND.N)))
		(!R11 (E206 (ORIENTS E691.SK)))
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
)))

; story 37:
	; "Tom had a cat."
	; "He decided to get another one."
	; "The two cats didn't get along."
	; "Tom tried his best to get them to live together."
	; "It never worked and he had to get rid of one."

; story 38:
	; "The boy shot a basket."
	; "It bounced hard off the rim."
	; "It went into the street."
	; "His brother ran after it."
	; "He caught it in the street."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((BASKET726.SK
              ((ADV-A (INTO.P STREET733.SK))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.4891.V)))
              ?L2)
             ** E734.SK)
	(:ROLES
		(!R1 (BASKET726.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (BASKET726.SK BASKET.N))
		(!R6 (STREET733.SK STREET.N))
		(!R7 (E217 (ORIENTS E734.SK)))
	)
	(:GOALS
		(?G1 (BASKET726.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(?I1 (BASKET726.SK (AT.P ?L1)))
		(?I2 (NOT (BASKET726.SK (AT.P ?L2))))
	)
	(:POSTCONDS
		(?P1 (NOT (BASKET726.SK (AT.P ?L1))))
		(?P2 (BASKET726.SK (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?I1 BEFORE E734.SK))
		(!W2 (?I2 BEFORE E734.SK))
		(!W3 (?P1 AFTER E734.SK))
		(!W4 (?P2 AFTER E734.SK))
		(!W5 (?G1 CAUSE.V E734.SK))
		(!W6 (E734.SK (BEFORE NOW192)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 39:
	; "Jack went to his friend's place."
	; "The house was huge."
	; "It made Jack feel poor."
	; "Jack left early."
	; "Jack stopped talking to that friend."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((JACK.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P PLACE745.SK)) GO.5041.V))
              PLACE745.SK)
             ** E746.SK)
	(:ROLES
		(!R1 (JACK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (PLACE745.SK LOCATION.N))
		(!R4 (NOT (?L1 = PLACE745.SK)))
		(!R5 (PLACE745.SK PLACE.N))
		(!R6 (E220 (ORIENTS E746.SK)))
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
		(!W5 (?G1 CAUSE.V E746.SK))
		(!W6 (E746.SK (BEFORE NOW195)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 40:
	; "Today we had a storm."
	; "It rained very hard for a long time."
	; "The wind blew loudly."
	; "I was glad when the storm was over."
	; "When I went outside, I saw a rainbow!"

; story 41:
	; "Jane had never been in love before."
	; "She got her first boyfriend."
	; "It was in high school."
	; "She thought she loved him but they broke up."
	; "It took her a long time to get over it."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((SHE.PRO GET.5341.V OBJECT784.SK (AT.P-ARG ?L)) ** E785.SK)
	(:ROLES
		(!R1 (OBJECT784.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (SHE.PRO = OBJECT784.SK)))
		(!R4 (OBJECT784.SK (PERTAIN-TO SHE.PRO)))
		(!R5 (SHE.PRO FEMALE.A))
		(!R6 (SHE.PRO AGENT.N))
		(!R7 (E234 (ORIENTS E785.SK)))
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
)))

; story 42:
	; "Tina was hungry."
	; "So she decided to get ice cream."
	; "She tried a taste."
	; "It was good."
	; "Tina wanted to go back."

; story 43:
	; "The man took a shower."
	; "The hot water went cold."
	; "He still had soap in his hair."
	; "He washed his hair quickly."
	; "He was shivering when he got out of the shower."

; story 44:
	; "Joe needed a new sliding door."
	; "His old was broken."
	; "So Joe went to the store to look for another one."
	; "Joe found a very nice one,
; Joe loved his new door ."

; story 45:
	; "Today I went to lunch."
	; "I got the gumbo."
	; "It was good but salty."
	; "I drank a lot of water."
	; "I would still get it again though."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME860.SK GET.5731.V GUMBO852.SK (AT.P-ARG ?L)) ** E853.SK)
	(:ROLES
		(!R1 (GUMBO852.SK INANIMATE_OBJECT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (NOT (ME860.SK = GUMBO852.SK)))
		(!R4 (ME860.SK AGENT.N))
		(!R5 (GUMBO852.SK GUMBO.N))
		(!R6 (E258 (ORIENTS E853.SK)))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((ME860.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K LUNCH.N))) GO.5761.V))
              (K LUNCH.N))
             ** E850.SK)
	(:ROLES
		(!R1 (?L1 LOCATION.N))
		(!R2 ((K LUNCH.N) LOCATION.N))
		(!R3 (NOT (?L1 = (K LUNCH.N))))
		(!R4 (ME860.SK AGENT.N))
		(!R5 (E256 (ORIENTS E850.SK)))
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
		(!W5 (?G1 CAUSE.V E850.SK))
		(!W6 (E850.SK (BEFORE NOW224)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 46:
	; "Fred looked outside."
	; "It looked like he got new neighbors."
	; "He was excited."
	; "He went to introduce himself."
	; "He made some friends."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((FRED.NAME
              ((ADV-A (FOR.P (KA (INTRODUCE.V FRED.NAME))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) GO.5911.V)))
              ?L2)
             ** E870.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (E265 (ORIENTS E870.SK)))
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
		(!W5 (?G1 CAUSE.V E870.SK))
		(!W6 (E870.SK (BEFORE NOW232)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (4.0 0.4)
(EPI-SCHEMA ((FRED.NAME MAKE.5971.V FRIEND877.SK) ** E878.SK)
	(:ROLES
		(!R1 (FRED.NAME AGENT.N))
		(!R2 (FRIEND877.SK INANIMATE_OBJECT.N))
		(!R3 (FRIEND877.SK (PLUR FRIEND.N)))
		(!R4 (E266 (ORIENTS E878.SK)))
	)
	(:GOALS
		(?G1 (FRED.NAME (WANT.V (THAT (FRIEND877.SK EXIST.V)))))
		(?G2 (FRED.NAME (WANT.V (KA (HAVE.V FRIEND877.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (FRIEND877.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (FRIEND877.SK EXIST.V))
		(?P2 (FRED.NAME (HAVE.V FRIEND877.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E878.SK (BEFORE NOW233)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 47:
	; "Bryan was back from vacation."
	; "He had work today."
	; "He was not excited."
	; "He got into work."
	; "He found he wasn't behind on his work."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((BRYAN.NAME ((ADV-A (INTO.P (K WORK.N))) GET.6091.V) ?O
              (AT.P-ARG ?L))
             ** E884.SK)
	(:ROLES
		(!R1 (BRYAN.NAME AGENT.N))
		(!R2 (?O INANIMATE_OBJECT.N))
		(!R3 (?L LOCATION.N))
		(!R4 (NOT (BRYAN.NAME = ?O)))
		(!R5 (E271 (ORIENTS E884.SK)))
		(!R6 (WORK888.SK (PERTAIN-TO BRYAN.NAME)))
		(!R7 (WORK888.SK WORK.N))
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
)))

; story 48:
	; "A violinist liked to play."
	; "She never played acoustically."
	; "Her friend told her to try it."
	; "She loved the sound."
	; "She records it."
(setf matches (append matches '( (6.0 0.2)
(EPI-SCHEMA ((VIOLINIST889.SK
              (ACOUSTICALLY.ADV
               (NEVER.ADV ((ADV-A (WITH.P SOUND897.SK)) PLAY.6121.V)))
              ?G)
             ** E893.SK)
	(:ROLES
		(!R1 (VIOLINIST889.SK AGENT.N))
		(!R2 (SOUND897.SK TOY.N))
		(!R3 (SOUND897.SK INANIMATE_OBJECT.N))
		(!R4 (?G GAME.N))
		(!R5 (E275 (ORIENTS E893.SK)))
		(!R6 (VIOLINIST889.SK VIOLINIST.N))
		(!R7 (SOUND897.SK SOUND.N))
		(!R8 (FRIEND895.SK (PERTAIN-TO VIOLINIST889.SK)))
		(!R9 (FRIEND895.SK FRIEND.N))
		(!R10 (E261 (ORIENTS E900.SK)))
	)
	(:GOALS
		(?G1 (VIOLINIST889.SK (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
	)
	(:PRECONDS
		(E900.SK (VIOLINIST889.SK HAVE.V SOUND897.SK))
	)
	(:POSTCONDS
		(?P1 (VIOLINIST889.SK EXPERIENCE.V (K PLEASURE.N)))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME ?E2))
		(!W2 (E893.SK (BEFORE NOW240)))
		(!W3 (E900.SK (AT-ABOUT NOW243)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
	)
)
)))
(setf matches (append matches '( (5.0 0.3)
(EPI-SCHEMA ((VIOLINIST889.SK (ACOUSTICALLY.ADV (NEVER.ADV PLAY.6151.V))
              SOUND897.SK)
             ** E893.SK)
	(:ROLES
		(!R1 (VIOLINIST889.SK AGENT.N))
		(!R2 (SOUND897.SK INANIMATE_OBJECT.N))
		(!R3 (E275 (ORIENTS E893.SK)))
		(!R4 (VIOLINIST889.SK VIOLINIST.N))
		(!R5 (SOUND897.SK SOUND.N))
		(!R6 (FRIEND895.SK (PERTAIN-TO VIOLINIST889.SK)))
		(!R7 (FRIEND895.SK FRIEND.N))
		(!R8 (E261 (ORIENTS E900.SK)))
	)
	(:GOALS
		(?G1 (VIOLINIST889.SK (WANT.V (THAT (SOUND897.SK EXIST.V)))))
		(?G2 (VIOLINIST889.SK (WANT.V (KA (HAVE.V SOUND897.SK)))))
	)
	(:PRECONDS
		(?I1 (NOT (SOUND897.SK EXIST.V)))
	)
	(:POSTCONDS
		(?P1 (SOUND897.SK EXIST.V))
		(E900.SK (VIOLINIST889.SK (HAVE.V SOUND897.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E893.SK (BEFORE NOW240)))
		(!W2 (E900.SK (AT-ABOUT NOW243)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 49:
	; "It was the middle of summer."
	; "Kara didn't want to go outside."
	; "It was too hot."
	; "So she just stayed in."
	; "It wasn't worth it being in the heat."
(setf matches (append matches '( (3.5 0.1)
(EPI-SCHEMA ((KARA.NAME AVOID_ACTION_TO_AVOID_DISPLEASURE.6301.V
              (KA (WANT.V (KA (OUTSIDE.ADV GO.V)))))
             ** ?E)
	(:ROLES
		(!R1 (KARA.NAME AGENT.N))
		(!R2 ((KA (WANT.V (KA (OUTSIDE.ADV GO.V)))) ACTION.N))
		(!R3 (?D DISPLEASURE.N))
		(!R4 (E279 (ORIENTS E904.SK)))
	)
	(:GOALS
		(?G1 (KARA.NAME (WANT.V (THAT (NOT (KARA.NAME (EXPERIENCE.V ?D)))))))
	)
	(:PRECONDS
		(?I1
   ((KE (KARA.NAME (DO.V (KA (WANT.V (KA (OUTSIDE.ADV GO.V))))))) CAUSE.V
    (KE (KARA.NAME (EXPERIENCE.V ?D)))))
	)
	(:STEPS
		(E904.SK (NOT (KARA.NAME (DO.V (KA (WANT.V (KA (OUTSIDE.ADV GO.V))))))))
	)
	(:EPISODE-RELATIONS
		(!W1 (?G1 CAUSE.V E904.SK))
		(!W2 (E904.SK (BEFORE NOW245)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 50:
	; "My brother had a ball."
	; "He threw it to my son."
	; "My son could not catch it."
	; "It rolled right past my son."
	; "My son picked the ball up."

; story 51:
	; "Lisa took her family to the farm."
	; "Her kids had a great time."
	; "Her daughter then touched the pig."
	; "She laughed."
	; "She had a fun time."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((LISA.NAME ((ADV-A (TO.P FARM947.SK)) TAKE.6601.V) FAMILY950.SK
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
		(!R8 (E287 (ORIENTS E953.SK)))
		(!R9 (KID973.SK (PERTAIN-TO LISA.NAME)))
		(!R10 (KID973.SK (PLUR KID.N)))
		(!R11 (DAUGHTER963.SK DAUGHTER.N))
		(!R12 (DAUGHTER963.SK (PERTAIN-TO LISA.NAME)))
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
)))

; story 52:
	; "Ethan went to Haiti."
	; "He wanted to look like the people."
	; "He went to a market to get clothes."
	; "He saw some sandals."
	; "He bought them."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((ETHAN.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P HAITI.NAME)) GO.6751.V))
              HAITI.NAME)
             ** E975.SK)
	(:ROLES
		(!R1 (ETHAN.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (HAITI.NAME LOCATION.N))
		(!R4 (NOT (?L1 = HAITI.NAME)))
		(!R5 (E292 (ORIENTS E975.SK)))
		(!R6 (PERSON978.SK (PLUR PERSON.N)))
		(!R7 (E293 (ORIENTS E979.SK)))
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
		(!W5 (E979.SK CAUSE.V E975.SK))
		(!W6 (E975.SK (BEFORE NOW259)))
		(!W7 (E979.SK (BEFORE NOW260)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 53:
	; "Tomorrow was father's day."
	; "Jack wanted to get his father a new grill."
	; "Jack went to the store."
	; "Got a nice new grill."
	; "His father loved his new grill."
(setf matches (append matches '( (11.0 0.1)
(EPI-SCHEMA ((JACK.NAME
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P STORE996.SK)) GO.6931.V))
              STORE996.SK)
             ** E997.SK)
	(:ROLES
		(!R1 (JACK.NAME AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (STORE996.SK LOCATION.N))
		(!R4 (NOT (?L1 = STORE996.SK)))
		(!R5 (E298 (ORIENTS E994.SK)))
		(!R6 (STORE996.SK STORE.N))
		(!R7 (FATHER993.SK (PERTAIN-TO JACK.NAME)))
		(!R8 (FATHER993.SK FATHER.N))
		(!R9 (E299 (ORIENTS E997.SK)))
		(!R10 (OBJECT1003.SK (PERTAIN-TO FATHER993.SK)))
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
		(!W5 (E994.SK CAUSE.V E997.SK))
		(!W6 (E994.SK (BEFORE NOW265)))
		(!W7 (E997.SK (BEFORE NOW266)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 54:
	; "The newspaper was outside."
	; "My dad got home from work."
	; "He got out of his car."
	; "He picked the newspaper up."
	; "He took it inside the house."
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((DAD1009.SK ((ADV-A (FROM.P (K WORK.N))) GET.7051.V) (K HOME.N)
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
		(!R10 (E303 (ORIENTS E1011.SK)))
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
)))

; story 55:
	; "The man heard his phone ring."
	; "He didn't know where it was."
	; "He followed the sound."
	; "He found his phone."
	; "He could not answer it in time."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((MAN1024.SK FIND.7231.V RING1027.SK) ** E1040.SK)
	(:ROLES
		(!R1 (MAN1024.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (RING1027.SK ((NN PHONE.N) RING.N)))
		(!R4 (RING1027.SK PHONE.N))
		(!R5 (MAN1024.SK MAN.N))
		(!R6 (RING1027.SK (PERTAIN-TO MAN1024.SK)))
		(!R7 (E311 (ORIENTS E1040.SK)))
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
)))
(setf matches (append matches '( (10.0 0.2)
(EPI-SCHEMA ((MAN1024.SK
              ((ADV-A (FROM.P ?L1))
               ((ADV-A (TO.P SOUND1033.SK)) FOLLOW.7261.V))
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
		(!R10 (E309 (ORIENTS E1034.SK)))
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
		(!W5 (?G1 CAUSE.V E1034.SK))
		(!W6 (E1034.SK (BEFORE NOW276)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 56:
	; "The girl made a dress."
	; "The dress was pretty."
	; "All her friends wanted one."
	; "She made each friend a dress of their own."
	; "He friends each wore the dress at the girl's wedding."
(setf matches (append matches '( (4.0 0.4)
(EPI-SCHEMA ((GIRL1042.SK MAKE.7381.V DRESS1044.SK) ** E1041.SK)
	(:ROLES
		(!R1 (GIRL1042.SK AGENT.N))
		(!R2 (DRESS1044.SK INANIMATE_OBJECT.N))
		(!R3 (DRESS1044.SK DRESS.N))
		(!R4 (GIRL1042.SK GIRL.N))
		(!R5 (E1041.SK (RIGHT-AFTER U278)))
		(!R6 (WEDDING1058.SK WEDDING.N))
		(!R7 (WEDDING1058.SK (PERTAIN-TO GIRL1042.SK)))
		(!R8 (E312 (ORIENTS E1045.SK)))
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
)))

; story 57:
	; "Tom loved ice skating."
	; "He invited a friend to do it."
	; "The friend didn't know how."
	; "Tom pushed him too hard."
	; "The friend fell and hurt himself."
(setf matches (append matches '( (9.0 0)
(EPI-SCHEMA ((FRIEND1066.SK
              ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) FALL.7531.V)) ?L2)
             ** E1076.SK)
	(:ROLES
		(!R1 (FRIEND1066.SK AGENT.N))
		(!R2 (?L1 LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (?L1 = ?L2)))
		(!R5 (FRIEND1066.SK FRIEND.N))
		(!R6 (E320 (ORIENTS E1073.SK)))
		(!R7 (E1081.SK (AT-OR-BEFORE NOW288)))
		(!R8 (E310 (ORIENTS E1081.SK)))
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
		(!W5 (?G1 CAUSE.V E1076.SK))
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
)))

; story 58:
	; "My brother was in a bad mood."
	; "He opened a can of paint."
	; "He splashed it on the ground."
	; "I told him to clean it up."
	; "He refused to clean it up."

; story 59:
	; "Mike was at a ball game."
	; "He needed a snack."
	; "He went to buy a snack."
	; "On the way back from getting a snack."
	; "Mike fell down and broke his arm."
(setf matches (append matches '( (11.0 0)
(EPI-SCHEMA ((MIKE.NAME
              ((ADV-A (FOR.P (KA (BUY.V SNACK1108.SK))))
               ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P GAME1102.SK)) GO.7831.V)))
              ?L2)
             ** E1109.SK)
	(:ROLES
		(!R1 (MIKE.NAME AGENT.N))
		(!R2 (GAME1102.SK LOCATION.N))
		(!R3 (?L2 LOCATION.N))
		(!R4 (NOT (GAME1102.SK = ?L2)))
		(!R5 (GAME1102.SK ((NN BALL.N) GAME.N)))
		(!R6 (E326 (ORIENTS E1120.SK)))
		(!R7 (SNACK1108.SK SNACK.N))
		(!R8 (E328 (ORIENTS E1109.SK)))
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
	(:POSTCONDS
		(?P1 (NOT (MIKE.NAME (AT.P GAME1102.SK))))
		(?P2 (MIKE.NAME (AT.P ?L2)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1120.SK BEFORE E1109.SK))
		(!W2 (?I2 BEFORE E1109.SK))
		(!W3 (?P1 AFTER E1109.SK))
		(!W4 (?P2 AFTER E1109.SK))
		(!W5 (?G1 CAUSE.V E1109.SK))
		(!W6 (E1120.SK (BEFORE NOW294)))
		(!W7 (E1109.SK (BEFORE NOW296)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

; story 60:
	; "The cat went to the living room."
	; "There was something funny."
	; "It had a new pillow."
	; "The cat poked the pillow with its paw."
	; "The cat liked the new pillow."

; story 61:
	; "Andre was at a party."
	; "He then lost his phone."
	; "The whole party stopped."
	; "People are all looking for it."
	; "They found it."
(setf matches (append matches '( (3.0 0)
(EPI-SCHEMA ((PARTY1151.SK FIND.8134.V PHONE1155.SK) ** E1162.SK)
	(:ROLES
		(!R1 (PARTY1151.SK AGENT.N))
		(!R2 (?L LOCATION.N))
		(!R3 (PHONE1155.SK PHONE.N))
		(!R4 (PARTY1151.SK WHOLE.A))
		(!R5 (PARTY1151.SK PARTY.N))
		(!R6 (PHONE1155.SK (PERTAIN-TO ANDRE.NAME)))
		(!R7 (E339 (ORIENTS E1162.SK)))
	)
	(:PRECONDS
		(?I1 (PARTY1151.SK (AT.P ?L)))
		(?I2 (PHONE1155.SK (AT.P ?L)))
		(?I3 (PARTY1151.SK ((ADV-A (FOR.P PHONE1155.SK)) SEARCH.V)))
		(?I4 (NOT (PARTY1151.SK (KNOW.V (THAT (PHONE1155.SK (AT.P ?L)))))))
		(?I5 (NOT (PARTY1151.SK (HAVE.V PHONE1155.SK))))
	)
	(:POSTCONDS
		(?P1 (PARTY1151.SK (KNOW.V (THAT (PHONE1155.SK (AT.P ?L))))))
		(?P2 (PARTY1151.SK (HAVE.V PHONE1155.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E1162.SK (BEFORE NOW308)))
	)
	(:NECESSITIES
		(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
	)
)
)))

