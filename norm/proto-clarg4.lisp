(setf matches (list))
(setf chain-matches (list))
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

