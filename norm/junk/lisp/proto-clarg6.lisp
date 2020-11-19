(setf matches (list))
(setf chain-matches (list))
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
Joe loved his new door ."
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

