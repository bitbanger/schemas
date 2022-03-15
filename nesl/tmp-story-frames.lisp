(defparameter *ALL-STORY-FRAMES* '(
(
; story sentence text for lookup
("Emily went to school." "She went to the bathroom." "She ate breakfast." "She ate lunch." "She went to class." "She ate dinner.")
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
		(Locale (3 3) ())
	)
)
(2 Motion (6 6)
	(
		(Theme (0 0) ())
		(Goal (9 9) (3))
	)
)
(3 Building_subparts (9 9)
	(
	)
)
(4 Ingestion (12 12)
	(
		(Ingestor (0 0) ())
		(Ingestibles (13 13) (5))
	)
)
(5 Food (13 13)
	(
	)
)
(6 Ingestion (16 16)
	(
		(Ingestor (0 0) ())
		(Ingestibles (13 13) (5))
	)
)
(7 Food (17 17)
	(
	)
)
(8 Motion (20 20)
	(
		(Goal (3 3) (1))
		(Theme (0 0) ())
	)
)
(9 Ingestion (25 25)
	(
		(Ingestor (0 0) ())
		(Ingestibles (13 13) (5))
	)
)
(10 Food (26 26)
	(
	)
)
)
)
(
; story sentence text for lookup
("The man walked to school." "He wore a hat." "He carried his books." "He wore sneakers." "He wore shorts." "He wore a shirt." "He wore a coat." "He wore pants.")
; events
(
(0 Self_motion (2 2)
	(
		(Goal (4 4) (2))
		(Self_mover (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
	)
)
(3 Wearing (7 7)
	(
		(Wearer (6 6) ())
		(Clothing (9 9) (4))
	)
)
(4 Accoutrements (9 9)
	(
		(Accoutrement (9 9) ())
	)
)
(5 Bringing (12 12)
	(
		(Theme (9 9) (4))
		(Agent (6 6) ())
	)
)
(6 Text (14 14)
	(
		(Author (13 13) ())
		(Text (9 9) (4))
	)
)
(7 Wearing (17 17)
	(
		(Wearer (6 6) ())
		(Clothing (13 13) ())
	)
)
(8 Clothing (18 18)
	(
		(Garment (13 13) ())
	)
)
(9 Wearing (21 21)
	(
		(Wearer (6 6) ())
		(Clothing (13 13) ())
	)
)
(10 Clothing (22 22)
	(
		(Garment (13 13) ())
	)
)
(11 Wearing (25 25)
	(
		(Wearer (6 6) ())
		(Clothing (9 9) (4))
	)
)
(12 Clothing (27 27)
	(
		(Garment (9 9) (4))
	)
)
(13 Wearing (30 30)
	(
		(Wearer (6 6) ())
		(Clothing (9 9) (4))
	)
)
(14 Clothing (32 32)
	(
		(Garment (9 9) (4))
	)
)
(15 Wearing (35 35)
	(
		(Wearer (6 6) ())
		(Clothing (13 13) ())
	)
)
(16 Clothing (36 36)
	(
		(Garment (13 13) ())
	)
)
)
)
(
; story sentence text for lookup
("A boy named Tom went to school." "He walked to school." "He rode the bus." "He carried books." "He sat next to a girl named Jenny." "He liked school.")
; events
(
(0 Being_named (2 2)
	(
		(Name (3 3) ())
		(Entity (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
		(Descriptor (2 3) (0))
	)
)
(2 Motion (4 4)
	(
		(Goal (6 6) (3))
		(Theme (1 1) (1))
	)
)
(3 Locale_by_use (6 6)
	(
		(Locale (6 6) ())
		(Descriptor (1 1) (1))
	)
)
(4 Self_motion (9 9)
	(
		(Goal (2 3) (0))
		(Self_mover (8 8) ())
	)
)
(5 Locale_by_use (11 11)
	(
		(Locale (3 3) ())
	)
)
(6 Operate_vehicle (14 14)
	(
		(Vehicle (2 3) (0))
		(Driver (8 8) ())
	)
)
(7 Vehicle (16 16)
	(
		(Vehicle (3 3) ())
	)
)
(8 Text (20 20)
	(
		(Text (20 20) ())
	)
)
(9 Bringing (19 19)
	(
		(Agent (8 8) ())
		(Theme (20 20) (8))
	)
)
(10 Adjacency (24 25)
	(
		(Figure (8 8) ())
		(Ground (27 27) (12))
	)
)
(11 Posture (23 23)
	(
		(Agent (8 8) ())
		(Location (24 24) ())
		(Point_of_contact (1 1) (1))
	)
)
(12 People (27 27)
	(
		(Descriptor (28 29) (13))
		(Person (27 27) ())
	)
)
(13 Being_named (28 28)
	(
		(Entity (27 27) (12))
		(Name (29 29) ())
	)
)
(14 Experiencer_focus (32 32)
	(
		(Experiencer (8 8) ())
		(Content (20 20) (8))
	)
)
(15 Education_teaching (33 33)
	(
	)
)
)
)
(
; story sentence text for lookup
("Karen went to school." "She studied English." "She ate lunch." "Her teacher gave her lots of homework." "Later, Karen went home.")
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
		(Descriptor (0 0) ())
		(Locale (3 3) ())
	)
)
(2 Education_teaching (6 6)
	(
		(Student (0 0) ())
		(Subject (7 7) ())
	)
)
(3 Ingestion (10 10)
	(
		(Ingestor (0 0) ())
		(Ingestibles (7 7) ())
	)
)
(4 Food (11 11)
	(
	)
)
(5 Education_teaching (14 14)
	(
		(Student (0 0) ())
		(Teacher (14 14) ())
	)
)
(6 Quantified_mass (17 17)
	(
		(Quantity (17 17) ())
		(Mass (19 19) ())
	)
)
(7 Time_vector (21 21)
	(
		(Event (23 23) ())
	)
)
(8 Motion (24 24)
	(
		(Time (0 0) ())
		(Goal (17 17) (6))
		(Theme (7 7) ())
	)
)
)
)
(
; story sentence text for lookup
("The man went to school." "He walked to the bus stop." "He waited for the bus." "The bus came." "He rode on the bus.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
		(Descriptor (1 1) (0))
	)
)
(2 Self_motion (7 7)
	(
		(Self_mover (6 6) ())
		(Goal (11 11) ())
	)
)
(3 Vehicle (10 10)
	(
		(Vehicle (4 4) (1))
	)
)
(4 Waiting (14 14)
	(
		(Protagonist (6 6) ())
		(Salient_entity (17 17) (5))
	)
)
(5 Vehicle (17 17)
	(
		(Vehicle (4 4) (1))
	)
)
(6 Arriving (21 21)
	(
		(Theme (1 1) (0))
	)
)
(7 Vehicle (20 20)
	(
		(Vehicle (1 1) (0))
	)
)
(8 Operate_vehicle (24 24)
	(
		(Driver (6 6) ())
		(Vehicle (17 17) (5))
	)
)
(9 Vehicle (27 27)
	(
		(Vehicle (4 4) (1))
	)
)
)
)
(
; story sentence text for lookup
("Sammy liked to go to school." "He played sports." "He learned how to play basketball." "He played on the playground." "He went home after school.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Content (5 5) (2))
		(Experiencer (0 0) ())
	)
)
(1 Motion (3 3)
	(
		(Goal (5 5) (2))
		(Theme (0 0) ())
	)
)
(2 Locale_by_use (5 5)
	(
		(Locale (5 5) ())
	)
)
(3 Competition (8 8)
	(
		(Participants (0 0) ())
		(Competition (9 9) ())
	)
)
(4 Education_teaching (12 12)
	(
		(Student (0 0) ())
		(Skill (5 5) (2))
	)
)
(5 Competition (15 15)
	(
		(Participants (0 0) ())
		(Competition (5 5) (2))
	)
)
(6 Locale_by_use (22 22)
	(
		(Locale (22 22) ())
	)
)
(7 Perception_experience (19 19)
	(
		(Perceiver_passive (0 0) ())
		(Ground (22 22) (6))
	)
)
(8 Motion (25 25)
	(
		(Theme (0 0) ())
		(Goal (9 9) ())
		(Time (28 28) (9))
	)
)
(9 Locale_by_use (28 28)
	(
		(Locale (22 22) (6))
	)
)
(10 Relative_time (27 27)
	(
		(Focal_occasion (24 24) ())
		(Landmark_occasion (22 22) (6))
	)
)
)
)
(
; story sentence text for lookup
("Sue went to school." "She walked to school." "She rode the bus to school." "She walked to the bus stop." "She waited for the bus." "When the bus came, she got on." "She rode the bus to school.")
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
(2 Self_motion (6 6)
	(
		(Goal (3 3) (1))
		(Self_mover (0 0) ())
	)
)
(3 Locale_by_use (8 8)
	(
		(Locale (3 3) (1))
	)
)
(4 Operate_vehicle (40 40)
	(
		(Vehicle (3 3) (1))
		(Driver (0 0) ())
		(Goal (44 44) (5 14))
	)
)
(5 Locale_by_use (44 44)
	(
		(Locale (44 44) (14))
	)
)
(6 Vehicle (42 42)
	(
		(Vehicle (3 3) (1))
	)
)
(7 Self_motion (18 18)
	(
		(Self_mover (0 0) ())
		(Goal (22 22) ())
	)
)
(8 Vehicle (21 21)
	(
		(Vehicle (21 21) ())
	)
)
(9 Waiting (25 25)
	(
		(Protagonist (0 0) ())
		(Salient_entity (28 28) (10))
	)
)
(10 Vehicle (28 28)
	(
		(Vehicle (21 21) (8))
	)
)
(11 Vehicle (32 32)
	(
		(Vehicle (32 32) ())
	)
)
(12 Arriving (33 33)
	(
		(Theme (32 32) (11))
	)
)
(13 Operate_vehicle (40 40)
	(
		(Vehicle (3 3) (1))
		(Driver (0 0) ())
		(Goal (44 44) (5 14))
	)
)
(14 Locale_by_use (44 44)
	(
		(Locale (44 44) (5))
	)
)
(15 Vehicle (42 42)
	(
		(Vehicle (3 3) (1))
	)
)
)
)
(
; story sentence text for lookup
("Sammy went to school." "He played sports." "He learned how to play basketball." "He played on a team." "He played on a soccer team.")
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
		(Locale (3 3) ())
		(Formational_cause (0 0) ())
	)
)
(2 Competition (6 6)
	(
		(Participants (0 0) ())
		(Competition (7 7) ())
	)
)
(3 Education_teaching (10 10)
	(
		(Student (0 0) ())
		(Skill (11 11) ())
	)
)
(4 Competition (13 13)
	(
		(Participants (0 0) ())
		(Competition (14 14) ())
	)
)
(5 Competition (17 17)
	(
		(Participants (0 0) ())
		(Participant_1 (20 20) (6))
	)
)
(6 Aggregate (20 20)
	(
		(Aggregate (20 20) ())
	)
)
(7 Competition (23 23)
	(
		(Participants (0 0) ())
		(Competition (11 11) ())
	)
)
(8 Aggregate (27 27)
	(
		(Aggregate_property (20 20) (6))
		(Aggregate (14 14) ())
	)
)
)
)
(
; story sentence text for lookup
("A boy named Tom went to school." "He walked to school." "He waited for the bus." "He rode the bus to school." "He went inside the school.")
; events
(
(0 Being_named (2 2)
	(
		(Name (3 3) ())
		(Entity (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
		(Descriptor (2 3) (0))
	)
)
(2 Motion (4 4)
	(
		(Goal (6 6) (3))
		(Theme (1 1) (1))
	)
)
(3 Locale_by_use (6 6)
	(
		(Locale (6 6) ())
		(Descriptor (1 1) (1))
	)
)
(4 Self_motion (9 9)
	(
		(Goal (2 3) (0))
		(Self_mover (8 8) ())
	)
)
(5 Locale_by_use (11 11)
	(
		(Locale (3 3) ())
	)
)
(6 Waiting (14 14)
	(
		(Protagonist (8 8) ())
		(Salient_entity (17 17) (7))
	)
)
(7 Vehicle (17 17)
	(
		(Vehicle (17 17) ())
	)
)
(8 Operate_vehicle (20 20)
	(
		(Vehicle (2 3) (0))
		(Driver (8 8) ())
		(Goal (24 24) (9))
	)
)
(9 Locale_by_use (24 24)
	(
		(Locale (24 24) ())
	)
)
(10 Vehicle (22 22)
	(
		(Vehicle (3 3) ())
	)
)
(11 Interior_profile_relation (28 28)
	(
		(Figure (8 8) ())
		(Ground (30 30) (13))
	)
)
(12 Motion (27 27)
	(
		(Theme (8 8) ())
		(Goal (17 17) (7))
	)
)
(13 Locale_by_use (30 30)
	(
		(Locale (17 17) (7))
	)
)
)
)
(
; story sentence text for lookup
("Samantha went to school." "She studied English." "She ate lunch." "Her teacher gave her some homework." "When Samantha came home from school, she ate dinner.")
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
		(Subject (7 7) ())
	)
)
(3 Ingestion (10 10)
	(
		(Ingestor (0 0) ())
		(Ingestibles (7 7) ())
	)
)
(4 Food (11 11)
	(
	)
)
(5 Education_teaching (14 14)
	(
		(Student (0 0) ())
		(Teacher (14 14) ())
	)
)
(6 Locale_by_use (25 25)
	(
		(Formational_cause (14 14) (5))
		(Locale (25 25) ())
	)
)
(7 Arriving (22 22)
	(
		(Source (25 25) (6))
		(Theme (14 14) (5))
		(Goal (3 3) (1))
	)
)
(8 Ingestion (28 28)
	(
		(Ingestor (27 27) ())
		(Ingestibles (29 29) (9))
	)
)
(9 Food (29 29)
	(
	)
)
(10 Temporal_collocation (20 20)
	(
		(Trajector_event (27 27) ())
		(Landmark_event (21 21) ())
	)
)
)
)
))