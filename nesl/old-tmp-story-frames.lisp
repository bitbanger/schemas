(defparameter *ALL-STORY-FRAMES* '(
(
; story sentence text for lookup
("Sammy stayed home from school." "He read books all day." "He played games on the computer." "He watched TV." "He listened to music." "He played video games." "He ate snacks.")
; events
(
(0 Temporary_stay (1 1)
	(
		(Location (2 2) ())
		(Guest (0 0) ())
	)
)
(1 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
	)
)
(2 Text (8 8)
	(
		(Text (8 8) ())
	)
)
(3 Reading_activity (7 7)
	(
		(Reader (0 0) ())
		(Text (8 8) (2))
		(Time (9 10) ())
	)
)
(4 Competition (13 13)
	(
		(Participants (0 0) ())
		(Competition (8 8) (2))
		(Competition (17 17) ())
	)
)
(5 Perception_active (20 20)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (8 8) (2))
	)
)
(6 Perception_active (24 24)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (26 26) (7))
	)
)
(7 Temporal_pattern (26 26)
	(
		(Pattern (26 26) ())
	)
)
(8 Ingestion (34 34)
	(
		(Ingestor (0 0) ())
		(Ingestibles (8 8) (2))
	)
)
(9 Food (35 35)
	(
	)
)
)
)
(
; story sentence text for lookup
("The man stayed home from work." "He watched TV." "He played cards." "He slept all afternoon.")
; events
(
(0 Temporary_stay (2 2)
	(
		(Place (5 5) (2))
		(Location (3 3) ())
		(Guest (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Dead_or_alive (5 5)
	(
		(Protagonist (1 1) (1))
	)
)
(3 Perception_active (8 8)
	(
		(Perceiver_agentive (7 7) ())
		(Phenomenon (9 9) ())
	)
)
(4 Sleep (16 16)
	(
		(Sleeper (7 7) ())
		(Duration (17 18) (5))
	)
)
(5 Calendric_unit (18 18)
	(
		(Unit (3 3) ())
	)
)
)
)
(
; story sentence text for lookup
("Timmy stayed home from school today." "He played video games all afternoon." "He ate some snacks." "He watched TV until it was time for bed.")
; events
(
(0 Temporary_stay (1 1)
	(
		(Iterations (4 4) (2))
		(Time (5 5) (1))
		(Location (2 2) ())
		(Guest (0 0) ())
	)
)
(1 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(2 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
	)
)
(3 Competition (8 8)
	(
		(Competition (10 10) ())
		(Participants (0 0) ())
		(Time (11 12) (4))
	)
)
(4 Calendric_unit (12 12)
	(
		(Unit (5 5) (1))
	)
)
(5 Ingestion (15 15)
	(
		(Ingestor (0 0) ())
		(Ingestibles (10 10) ())
	)
)
(6 Food (17 17)
	(
	)
)
(7 Building_subparts (27 27)
	(
		(Building_part (27 27) ())
	)
)
(8 Perception_active (20 20)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (2 2) ())
		(Time (23 23) ())
	)
)
)
)
(
; story sentence text for lookup
("Molly stayed home from school." "She read books all day." "She watched TV." "She played games on her computer.")
; events
(
(0 Temporary_stay (1 1)
	(
		(Location (2 2) ())
		(Guest (0 0) ())
	)
)
(1 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
	)
)
(2 Text (8 8)
	(
		(Text (8 8) ())
	)
)
(3 Reading_activity (7 7)
	(
		(Reader (0 0) ())
		(Text (8 8) (2))
		(Time (9 10) ())
	)
)
(4 Perception_active (13 13)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (8 8) (2))
	)
)
(5 Competition (17 17)
	(
		(Participants (0 0) ())
		(Competition (8 8) (2))
		(Competition (21 21) ())
	)
)
)
)
(
; story sentence text for lookup
("Karen stayed home from school." "She read books." "She played games on the computer." "She watched TV shows." "She listened to music.")
; events
(
(0 Temporary_stay (1 1)
	(
		(Guest (0 0) ())
		(Location (2 2) ())
	)
)
(1 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
	)
)
(2 Text (8 8)
	(
		(Text (8 8) ())
	)
)
(3 Reading_activity (7 7)
	(
		(Reader (0 0) ())
		(Text (8 8) (2))
	)
)
(4 Competition (11 11)
	(
		(Participants (0 0) ())
		(Competition (8 8) (2))
		(Competition (15 15) ())
	)
)
(5 Perception_active (18 18)
	(
		(Phenomenon (20 20) ())
		(Perceiver_agentive (0 0) ())
	)
)
(6 Perception_active (23 23)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (20 20) ())
	)
)
(7 Temporal_pattern (25 25)
	(
		(Pattern (25 25) ())
	)
)
)
)
(
; story sentence text for lookup
("Mary went to school." "She learned how to read." "She liked reading books." "She stayed home from school today.")
; events
(
(0 Motion (1 1)
	(
		(Goal (3 3) (1))
		(Theme (0 0) ())
	)
)
(1 Locale_by_use (3 3)
	(
		(Formational_cause (0 0) ())
		(Locale (3 3) ())
	)
)
(2 Education_teaching (6 6)
	(
		(Student (0 0) ())
		(Skill (7 7) ())
	)
)
(3 Reading_activity (9 9)
	(
		(Reader (0 0) ())
	)
)
(4 Experiencer_focus (12 12)
	(
		(Experiencer (0 0) ())
		(Content (3 3) (1))
	)
)
(5 Text (14 14)
	(
		(Text (3 3) (1))
	)
)
(6 Reading_activity (13 13)
	(
		(Reader (0 0) ())
		(Text (3 3) (1))
	)
)
(7 Temporary_stay (17 17)
	(
		(Location (20 20) (8))
		(Guest (0 0) ())
		(Time (21 21) (9))
		(Location (18 18) ())
	)
)
(8 Locale_by_use (20 20)
	(
		(Locale (20 20) ())
	)
)
(9 Calendric_unit (21 21)
	(
		(Unit (21 21) ())
	)
)
)
)
(
; story sentence text for lookup
("Karen stayed home from school." "She read books all afternoon." "She watched TV." "She played games on her computer." "She went outside for a walk.")
; events
(
(0 Temporary_stay (1 1)
	(
		(Guest (0 0) ())
		(Location (2 2) ())
	)
)
(1 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
	)
)
(2 Text (8 8)
	(
		(Text (8 8) ())
	)
)
(3 Reading_activity (7 7)
	(
		(Reader (0 0) ())
		(Text (8 8) (2))
		(Time (9 10) (4))
	)
)
(4 Calendric_unit (10 10)
	(
		(Unit (4 4) (1))
	)
)
(5 Perception_active (13 13)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (8 8) (2))
	)
)
(6 Competition (17 17)
	(
		(Participants (0 0) ())
		(Competition (8 8) (2))
		(Competition (21 21) ())
	)
)
(7 Motion (24 24)
	(
		(Theme (0 0) ())
		(Goal (8 8) (2))
		(Purpose (21 21) ())
	)
)
(8 Self_motion (28 28)
	(
		(Self_mover (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Molly stayed home from school." "She watched TV." "She played games on her computer." "She read books." "She listened to music.")
; events
(
(0 Temporary_stay (1 1)
	(
		(Location (2 2) ())
		(Guest (0 0) ())
	)
)
(1 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
	)
)
(2 Perception_active (7 7)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (8 8) ())
	)
)
(3 Competition (11 11)
	(
		(Participants (0 0) ())
		(Competition (8 8) ())
		(Competition (15 15) ())
	)
)
(4 Text (19 19)
	(
		(Text (8 8) ())
	)
)
(5 Reading_activity (18 18)
	(
		(Reader (0 0) ())
		(Text (8 8) ())
	)
)
(6 Perception_active (22 22)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (24 24) (7))
	)
)
(7 Temporal_pattern (24 24)
	(
		(Pattern (24 24) ())
	)
)
)
)
(
; story sentence text for lookup
("Nancy stayed home from school." "She read books." "She watched TV." "She played games on her computer." "She wanted to be alone.")
; events
(
(0 Temporary_stay (1 1)
	(
		(Place (4 4) (1))
		(Guest (0 0) ())
	)
)
(1 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
	)
)
(2 Text (8 8)
	(
		(Text (8 8) ())
	)
)
(3 Reading_activity (7 7)
	(
		(Reader (0 0) ())
		(Text (8 8) (2))
	)
)
(4 Perception_active (11 11)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (8 8) (2))
	)
)
(5 Competition (15 15)
	(
		(Participants (0 0) ())
		(Competition (8 8) (2))
		(Competition (19 19) ())
	)
)
(6 Desiring (22 22)
	(
		(Experiencer (0 0) ())
		(Event (23 25) ())
	)
)
)
)
(
; story sentence text for lookup
("Dylan stayed home from school." "He played video games." "He watched TV." "He ate snacks." "He read books." "He listened to music.")
; events
(
(0 Temporary_stay (1 1)
	(
		(Place (4 4) (1))
		(Guest (0 0) ())
	)
)
(1 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
	)
)
(2 Perception_active (12 12)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (13 13) ())
	)
)
(3 Ingestion (16 16)
	(
		(Ingestor (0 0) ())
		(Ingestibles (13 13) ())
	)
)
(4 Food (17 17)
	(
	)
)
(5 Text (21 21)
	(
		(Text (13 13) ())
	)
)
(6 Reading_activity (20 20)
	(
		(Reader (0 0) ())
		(Text (13 13) ())
	)
)
(7 Perception_active (24 24)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (26 26) (8))
	)
)
(8 Temporal_pattern (26 26)
	(
		(Pattern (26 26) ())
	)
)
)
)
))