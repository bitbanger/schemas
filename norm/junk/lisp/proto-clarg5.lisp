(setf matches (list))
(setf chain-matches (list))
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
I threw them out."
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

