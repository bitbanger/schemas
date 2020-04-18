(setf matches (list))
(setf chain-matches (list))
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
     (OUT.ADV ((ADV-A (TO.P FIELD719.SK)) ((ADV-A (FROM.P ?L1)) GO.563.V)))
     FIELD719.SK)
    ** E720.SK)
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
    E798.SK)
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

