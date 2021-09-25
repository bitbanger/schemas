(defparameter *ALL-STORY-FRAMES* '(
(
; story sentence text for lookup
("Tom had two dogs." "One dog was black." "One dog was white." "Tom's dogs were black and white." "The large dog was black." "The small one was white." "Did Tom see the dogs run?" "Did the cats run?" "No; the cats were on the steps." "The white cat was lying on the steps." "Did a black cat sit on a mat?" "No; that was my white one.")
; events
(
(0 Cardinal_numbers (2 2)
	(
		(Number (2 2) ())
		(Entity (3 3) (1))
	)
)
(1 Animals (3 3)
	(
		(Animal (0 0) ())
		(Animal (3 3) ())
	)
)
(2 Cardinal_numbers (5 5)
	(
		(Number (0 0) ())
		(Entity (6 6) ())
	)
)
(3 Color (8 8)
	(
		(Color (3 3) (1))
		(Entity (6 6) ())
	)
)
(4 Cardinal_numbers (10 10)
	(
		(Number (0 0) ())
		(Entity (6 6) ())
	)
)
(5 Color (13 13)
	(
		(Entity (6 6) ())
	)
)
(6 Color (21 21)
	(
		(Entity (17 17) ())
	)
)
(7 Color (19 19)
	(
		(Entity (17 17) ())
	)
)
(8 Size (24 24)
	(
		(Entity (2 2) (0))
	)
)
(9 Color (27 27)
	(
		(Entity (17 17) ())
	)
)
(10 Size (30 30)
	(
		(Entity (2 2) (0))
	)
)
(11 Color (33 33)
	(
		(Entity (17 17) ())
	)
)
(12 Perception_experience (37 37)
	(
		(Perceiver_passive (6 6) ())
		(Depictive (40 40) (13))
		(Phenomenon (39 39) ())
	)
)
(13 Self_motion (40 40)
	(
		(Self_mover (39 39) ())
	)
)
(14 Self_motion (45 45)
	(
		(Self_mover (44 44) ())
	)
)
(15 Connecting_architecture (54 54)
	(
		(Part (54 54) ())
	)
)
(16 Posture (60 60)
	(
		(Point_of_contact (60 60) ())
		(Location (63 63) (18))
		(Agent (17 17) ())
	)
)
(17 Color (57 57)
	(
		(Entity (2 2) (0))
		(Color (6 6) ())
	)
)
(18 Connecting_architecture (63 63)
	(
		(Part (54 54) (15))
	)
)
(19 Color (67 67)
	(
		(Color (2 2) (0))
		(Entity (3 3) (1))
	)
)
(20 Posture (69 69)
	(
		(Point_of_contact (60 60) (16))
		(Location (63 63) (18))
		(Agent (68 68) (21))
	)
)
(21 Animals (68 68)
	(
		(Descriptor (2 2) (0))
		(Animal (3 3) (1))
	)
)
(22 Color (79 79)
	(
		(Color (40 40) (13))
		(Entity (80 80) ())
	)
)
)
)
(
; story sentence text for lookup
("It was my son's first birthday." "I cannot believe how fast it has gone by." "He is getting so big." "He got a smash cake for himself." "He loved it.")
; events
(
(0 Commemorative (6 6)
	(
		(Dedicated_entity (2 4) (2))
	)
)
(1 Ordinal_numbers (5 5)
	(
		(Type (6 6) (0))
	)
)
(2 Kinship (3 3)
	(
		(Ego (2 2) ())
		(Alter (3 3) ())
	)
)
(3 Motion (16 16)
	(
		(Speed (13 13) (4))
		(Theme (6 6) (0))
		(Path (17 17) ())
	)
)
(4 Speed_description (13 13)
	(
		(Speed (13 13) ())
		(Degree (12 12) ())
		(Entity (6 6) (0))
	)
)
(5 Awareness (11 11)
	(
		(Cognizer (8 8) ())
		(Content (13 13) (4))
	)
)
(6 Transition_to_state (21 21)
	(
		(Entity (8 8) ())
		(Final_quality (22 23) (7))
	)
)
(7 Size (23 23)
	(
		(Entity (8 8) ())
		(Degree (3 3) (2))
	)
)
(8 Commerce_buy (26 26)
	(
		(Recipient (8 8) ())
		(Goods (29 29) (9))
	)
)
(9 Food (29 29)
	(
		(Descriptor (3 3) (2))
	)
)
(10 Experiencer_focus (34 34)
	(
		(Experiencer (8 8) ())
		(Content (2 2) ())
	)
)
)
)
(
; story sentence text for lookup
("The boy ran into the kitchen." "His hand hit the cup on the table." "It hit the ground with a bounce." "The cup did not break." "The cup was made of plastic.")
; events
(
(0 Self_motion (2 2)
	(
		(Goal (5 5) (2))
		(Self_mover (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Building_subparts (5 5)
	(
		(Building_part (5 5) ())
	)
)
(3 Cause_impact (9 9)
	(
		(Impactee (11 11) (5))
		(Impactor (1 1) (1))
	)
)
(4 Body_parts (8 8)
	(
		(Possessor (7 7) ())
		(Body_part (1 1) (1))
	)
)
(5 Containers (11 11)
	(
		(Container (11 11) ())
		(Relative_location (14 14) ())
	)
)
(6 Impact (17 17)
	(
		(Impactee (19 19) ())
		(Impactor (7 7) ())
		(Manner (22 22) (7))
	)
)
(7 Motion_noise (22 22)
	(
	)
)
(8 Containers (25 25)
	(
		(Container (1 1) (1))
	)
)
(9 Containers (31 31)
	(
		(Container (1 1) (1))
	)
)
(10 Process_start (33 33)
	(
		(Place (35 35) ())
		(Place (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("The monkey can climb a tree." "He climbs the tree and gets a cocoanut." "He drops the cocoanut to the ground." "He comes down and eats it." "The monkey likes to run and play." "Is Simeon afraid of the monkey?" "Luisa is afraid of large monkeys." "She is not afraid of this little monkey.")
; events
(
(0 Self_motion (3 3)
	(
		(Path (5 5) ())
		(Self_mover (1 1) ())
	)
)
(1 Capability (2 2)
	(
		(Entity (1 1) ())
		(Event (5 5) ())
	)
)
(2 Self_motion (8 8)
	(
		(Self_mover (7 7) ())
		(Path (10 10) (4))
	)
)
(3 Food (14 14)
	(
	)
)
(4 Biological_area (10 10)
	(
		(Locale (10 10) ())
	)
)
(5 Getting (12 12)
	(
		(Recipient (7 7) ())
		(Theme (14 14) (3))
	)
)
(6 Cause_motion (17 17)
	(
		(Result (22 22) ())
		(Agent (7 7) ())
		(Theme (10 10) (4))
	)
)
(7 Food (19 19)
	(
	)
)
(8 Ingestion (28 28)
	(
		(Ingestor (7 7) ())
		(Ingestibles (29 29) ())
	)
)
(9 Experiencer_focus (33 33)
	(
		(Experiencer (1 1) ())
		(Content (34 37) (10))
	)
)
(10 Self_motion (35 35)
	(
		(Self_mover (1 1) ())
	)
)
(11 Experiencer_focus (41 41)
	(
		(Experiencer (40 40) ())
		(Content (5 5) ())
	)
)
(12 Size (50 50)
	(
		(Entity (29 29) ())
	)
)
(13 Experiencer_focus (48 48)
	(
		(Content (5 5) ())
		(Experiencer (7 7) ())
	)
)
(14 Experiencer_focus (56 56)
	(
		(Experiencer (7 7) ())
		(Content (60 60) ())
	)
)
)
)
(
; story sentence text for lookup
("Susie loved clothes." "She got a striped shirt yesterday." "She did not like it." "Finally she liked it." "Susie was happy about it.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Content (2 2) (1))
		(Experiencer (0 0) ())
	)
)
(1 Clothing (2 2)
	(
		(Garment (2 2) ())
	)
)
(2 Clothing (8 8)
	(
		(Garment (8 8) ())
		(Descriptor (7 7) (4))
	)
)
(3 Getting (5 5)
	(
		(Recipient (0 0) ())
		(Time (9 9) ())
		(Theme (8 8) (2))
	)
)
(4 Color (7 7)
	(
		(Entity (8 8) (2))
		(Color (7 7) ())
	)
)
(5 Experiencer_focus (14 14)
	(
		(Experiencer (0 0) ())
		(Content (8 8) (2))
	)
)
(6 Experiencer_focus (19 19)
	(
		(Experiencer (18 18) ())
		(Content (7 7) (4))
	)
)
(7 Time_vector (17 17)
	(
		(Event (18 18) ())
	)
)
(8 Emotion_directed (24 24)
	(
		(Topic (26 26) ())
		(Experiencer (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("I was sitting in my chair." "I leaned back a little too far." "I heard a tiny crack." "I looked down at my chair." "One of the legs had a crack.")
; events
(
(0 Posture (2 2)
	(
		(Agent (0 0) ())
		(Point_of_contact (2 2) ())
		(Location (5 5) ())
	)
)
(1 Gradable_proximity (13 13)
	(
		(Directness (10 11) ())
		(Figure (0 0) ())
		(Directness (12 12) ())
	)
)
(2 Change_posture (8 9)
	(
		(Protagonist (0 0) ())
		(Result (10 13) (1))
		(Direction (2 2) (0))
	)
)
(3 Sounds (19 19)
	(
		(Manner (18 18) (5))
	)
)
(4 Perception_experience (16 16)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (19 19) (3))
	)
)
(5 Size (18 18)
	(
		(Entity (19 19) (3))
	)
)
(6 Perception_active (22 22)
	(
		(Perceiver_agentive (0 0) ())
		(Direction (2 2) (0))
		(Phenomenon (5 5) ())
	)
)
(7 Body_parts (31 31)
	(
		(Body_part (18 18) (5))
	)
)
)
)
(
; story sentence text for lookup
("I was in high school." "I went to a park with a friend." "I lost my friend." "I was late for my curfew." "I got in trouble.")
; events
(
(0 Motion (7 7)
	(
		(Theme (6 6) ())
		(Depictive (13 13) (2))
		(Goal (10 10) (1))
	)
)
(1 Locale_by_use (10 10)
	(
		(Locale (10 10) ())
	)
)
(2 Personal_relationship (13 13)
	(
		(Partner_1 (13 13) ())
	)
)
(3 Personal_relationship (18 18)
	(
		(Partner_2 (17 17) ())
		(Partner_1 (18 18) ())
	)
)
(4 Relative_time (22 22)
	(
		(Focal_participant (6 6) ())
		(Landmark_occasion (25 25) ())
	)
)
(5 Predicament (30 30)
	(
		(Experiencer (6 6) ())
		(Situation (18 18) (3))
	)
)
)
)
(
; story sentence text for lookup
("The man filled up his backpack." "He tried it on." "It felt too heavy." "He took the backpack off." "He took some of the stuff out of the backpack.")
; events
(
(0 Filling (2 3)
	(
		(Goal (5 5) (1))
		(Agent (1 1) (2))
	)
)
(1 Containers (5 5)
	(
		(Container (5 5) ())
		(Owner (4 4) ())
	)
)
(2 People (1 1)
	(
		(Person (1 1) ())
	)
)
(3 Attempt (8 10)
	(
		(Agent (7 7) ())
		(Goal (9 9) ())
	)
)
(4 Give_impression (13 13)
	(
		(Characterization (14 15) (5))
		(Phenomenon (7 7) ())
	)
)
(5 Measurable_attributes (15 15)
	(
		(Entity (7 7) ())
		(Degree (9 9) ())
	)
)
(6 Removing (18 18)
	(
		(Agent (7 7) ())
		(Source (4 4) ())
		(Theme (14 15) (5))
	)
)
(7 Undressing (20 21)
	(
		(Wearer (7 7) ())
		(Clothing (14 15) (5))
	)
)
(8 Removing (24 24)
	(
		(Agent (7 7) ())
		(Source (32 32) (9))
		(Theme (25 25) ())
	)
)
(9 Containers (32 32)
	(
		(Container (32 32) ())
	)
)
)
)
(
; story sentence text for lookup
("Andre was at a party." "He then lost his phone." "The whole party stopped." "People are all looking for it." "They found it.")
; events
(
(0 Spatial_co-location (2 2)
	(
		(Figure (0 0) ())
		(Ground (4 4) (1))
	)
)
(1 Social_event (4 4)
	(
		(Attendee (0 0) ())
		(Social_event (4 4) ())
	)
)
(2 Losing (8 8)
	(
		(Owner (0 0) ())
		(Possession (10 10) (3))
	)
)
(3 Accoutrements (10 10)
	(
		(Accoutrement (4 4) (1))
		(Wearer (9 9) ())
	)
)
(4 Social_event (14 14)
	(
		(Social_event (14 14) ())
	)
)
(5 Ranked_expectation (13 13)
	(
		(Entity (14 14) (4))
	)
)
(6 Process_stop (15 15)
	(
		(Process (14 14) (4))
	)
)
(7 People (17 17)
	(
		(Person (0 0) ())
	)
)
(8 Seeking (20 20)
	(
		(Cognizer_agent (0 0) ())
		(Sought_entity (22 22) ())
	)
)
(9 Locating (25 25)
	(
		(Perceiver (0 0) ())
		(Sought_entity (14 14) (4))
	)
)
)
)
(
; story sentence text for lookup
("John had his day off." "John wanted to go to the beach." "He got on his car and drove to the beach." "John swam in the water." "John had a good day.")
; events
(
(0 Exclude_member (1 4)
	(
		(Time (3 3) ())
		(Member (0 0) ())
	)
)
(1 Desiring (7 7)
	(
		(Experiencer (0 0) ())
		(Event (12 12) (2))
	)
)
(2 Natural_features (12 12)
	(
		(Locale (12 12) ())
	)
)
(3 Motion (9 9)
	(
		(Theme (0 0) ())
		(Goal (12 12) (2))
	)
)
(4 Natural_features (23 23)
	(
		(Locale (23 23) ())
	)
)
(5 Self_motion (15 15)
	(
		(Self_mover (0 0) ())
		(Goal (18 18) (6))
	)
)
(6 Vehicle (18 18)
	(
		(Vehicle (18 18) ())
		(Possessor (17 17) ())
	)
)
(7 Operate_vehicle (20 20)
	(
		(Driver (0 0) ())
		(Goal (23 23) (4))
	)
)
(8 Self_motion (26 26)
	(
		(Self_mover (0 0) ())
		(Place (18 18) (6))
	)
)
(9 Calendric_unit (35 35)
	(
		(Unit (18 18) (6))
	)
)
(10 Desirability (34 34)
	(
		(Evaluee (18 18) (6))
	)
)
)
)
(
; story sentence text for lookup
("Aaron had a slight cold." "His mother told him not to swim." "Aaron's mother went to the store." "He went and swam anyway." "Aaron got sick.")
; events
(
(0 Perception_body (4 4)
	(
		(Experiencer (0 0) ())
		(Body_part (4 4) ())
	)
)
(1 Telling (8 8)
	(
		(Message (10 12) (3))
		(Addressee (9 9) ())
		(Speaker (7 7) (2))
	)
)
(2 Kinship (7 7)
	(
		(Ego (0 0) ())
		(Alter (7 7) ())
	)
)
(3 Self_motion (12 12)
	(
		(Self_mover (9 9) ())
	)
)
(4 Motion (17 17)
	(
		(Theme (16 16) (5))
		(Goal (10 12) (3))
	)
)
(5 Kinship (16 16)
	(
		(Ego (7 7) (2))
		(Alter (16 16) ())
	)
)
(6 Businesses (20 20)
	(
		(Business (20 20) ())
	)
)
(7 Motion (23 23)
	(
		(Theme (0 0) ())
	)
)
(8 Self_motion (25 25)
	(
		(Self_mover (0 0) ())
	)
)
(9 Biological_urge (30 30)
	(
		(Experiencer (0 0) ())
	)
)
(10 Transition_to_state (29 29)
	(
		(Entity (0 0) ())
		(Final_quality (16 16) (5))
	)
)
)
)
(
; story sentence text for lookup
("Kitty and Berty are sisters." "They have been to the woods." "It is the month of May." "They have found some May flowers." "May flowers grow in the woods." "Here they come." "Little lucy is with them." "Their baskets are full." "Some flowers are pink and some are white." "These are apple blossoms." "Three blossoms are on one twig and four on the other." "There are eight bees.")
; events
(
(0 Kinship (4 4)
	(
		(Relatives (0 0) ())
	)
)
(1 Calendric_unit (16 16)
	(
		(Unit (18 18) ())
		(Unit (16 16) ())
	)
)
(2 Locating (21 21)
	(
		(Perceiver (19 19) ())
		(Sought_entity (24 24) ())
	)
)
(3 Biological_area (31 31)
	(
		(Locale (31 31) ())
	)
)
(4 Ontogeny (28 28)
	(
		(Place (24 24) ())
		(Entity (27 27) ())
	)
)
(5 Arriving (35 35)
	(
		(Goal (19 19) ())
		(Theme (34 34) ())
	)
)
(6 Size (37 37)
	(
		(Entity (34 34) ())
	)
)
(7 Hair_configuration (40 40)
	(
		(Hair (27 27) ())
		(Possessor (41 41) ())
	)
)
(8 Containers (44 44)
	(
		(Container (34 34) ())
		(Owner (19 19) ())
	)
)
(9 Abounding_with (46 46)
	(
		(Location (27 27) ())
	)
)
(10 Proportional_quantity (48 48)
	(
		(Denoted_quantity (19 19) ())
		(Individuals (34 34) ())
	)
)
(11 Color (55 55)
	(
		(Entity (31 31) (3))
	)
)
(12 Color (51 51)
	(
		(Color (16 16) (1))
		(Entity (27 27) ())
	)
)
(13 Cardinal_numbers (69 69)
	(
		(Number (69 69) ())
	)
)
(14 Cardinal_numbers (62 62)
	(
		(Number (19 19) ())
		(Entity (34 34) ())
	)
)
(15 Cardinal_numbers (66 66)
	(
		(Number (41 41) ())
		(Entity (31 31) (3))
	)
)
(16 Spatial_contact (65 65)
	(
		(Ground (18 18) ())
		(Figure (27 27) ())
	)
)
(17 Cardinal_numbers (76 76)
	(
		(Number (76 76) ())
		(Entity (16 16) (1))
	)
)
(18 Existence (74 75)
	(
		(Entity (76 77) (17))
	)
)
)
)
(
; story sentence text for lookup
("A little baby was sleeping." "Her siblings tried to wake her up." "She didn't wake up." "She slept all day." "She stayed up all night.")
; events
(
(0 People_by_age (2 2)
	(
		(Person (2 2) ())
		(Descriptor (1 1) (1))
	)
)
(1 Size (1 1)
	(
		(Entity (2 2) (0))
	)
)
(2 Sleep (4 4)
	(
		(Sleeper (2 2) (0))
	)
)
(3 Cause_to_wake (10 12)
	(
		(Agent (7 7) (5))
		(Sleeper (11 11) ())
	)
)
(4 Attempt (8 8)
	(
		(Agent (7 7) (5))
		(Goal (11 11) ())
	)
)
(5 Kinship (7 7)
	(
		(Ego (6 6) ())
		(Alter (1 1) (1))
	)
)
(6 Waking_up (17 18)
	(
		(Sleeper (6 6) ())
	)
)
(7 Sleep (21 21)
	(
		(Sleeper (6 6) ())
		(Duration (22 23) (8))
	)
)
(8 Calendric_unit (23 23)
	(
		(Unit (23 23) ())
	)
)
(9 Temporary_stay (26 26)
	(
		(Guest (6 6) ())
	)
)
(10 Calendric_unit (29 29)
	(
		(Unit (29 29) ())
	)
)
)
)
(
; story sentence text for lookup
("This man is John's father." "The horse is Billy." "Billy is a good old horse." "He is a fine black horse." "Where do you see John?" "John likes to ride on Billy." "Billy will not go too fast with John." "John will not fall off." "Did you ever ride on a horse?" "Did you ever play horse?")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Kinship (5 5)
	(
		(Ego (3 4) ())
	)
)
(2 Animals (17 17)
	(
		(Animal (17 17) ())
		(Animal (12 12) ())
		(Descriptor (3 4) ())
	)
)
(3 Age (16 16)
	(
		(Entity (17 17) (2))
	)
)
(4 Desirability (15 15)
	(
		(Evaluee (16 17) (2 3))
	)
)
(5 Color (23 23)
	(
		(Entity (17 17) (2))
		(Color (23 23) ())
	)
)
(6 Desirability (22 22)
	(
		(Evaluee (16 17) (2 3))
	)
)
(7 Spatial_co-location (26 26)
	(
	)
)
(8 Perception_experience (29 29)
	(
		(State (12 12) ())
		(Perceiver_passive (28 28) ())
		(Phenomenon (23 23) (5))
	)
)
(9 Experiencer_focus (33 33)
	(
		(Experiencer (12 12) ())
		(Content (37 37) ())
	)
)
(10 Operate_vehicle (35 35)
	(
		(Driver (12 12) ())
		(Vehicle (16 17) (2 3))
	)
)
(11 Speed_description (44 44)
	(
		(Entity (12 12) ())
		(Entity (46 46) ())
		(Degree (23 23) (5))
	)
)
(12 Motion (42 42)
	(
		(Manner (16 17) (2 3))
		(Theme (12 12) ())
		(Theme (46 46) ())
	)
)
(13 Animals (60 60)
	(
		(Animal (60 60) ())
	)
)
(14 Operate_vehicle (57 57)
	(
		(Driver (1 1) (0))
		(Vehicle (60 60) (13))
	)
)
(15 Frequency (64 64)
	(
		(Event (1 1) (0))
		(Event (3 4) ())
	)
)
(16 Hearsay (65 65)
	(
		(Speaker (1 1) (0))
		(Topic (23 23) (5))
	)
)
)
)
(
; story sentence text for lookup
("Tom was a ten year old boy." "Tom lived with his parents." "Tom wanted a pet." "His parents did not allow pets in the house." "Tom cried.")
; events
(
(0 Age (5 5)
	(
		(Age (3 4) ())
		(Entity (6 6) (1))
	)
)
(1 People_by_age (6 6)
	(
		(Person (0 0) ())
		(Person (6 6) ())
		(Age (3 5) (0))
	)
)
(2 Residence (9 9)
	(
		(Resident (0 0) ())
		(Co_resident (12 12) (3))
	)
)
(3 Kinship (12 12)
	(
		(Alter (12 12) ())
		(Ego (11 11) ())
	)
)
(4 Desiring (15 15)
	(
		(Focal_participant (17 17) ())
		(Experiencer (0 0) ())
	)
)
(5 Kinship (20 20)
	(
		(Ego (0 0) ())
		(Alter (20 20) ())
	)
)
(6 Preventing_or_letting (23 23)
	(
		(Event (27 27) (7))
		(Event (24 24) ())
		(Agent (20 20) (5))
	)
)
(7 Buildings (27 27)
	(
		(Building (27 27) ())
	)
)
(8 Communication_noise (30 30)
	(
		(Speaker (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Mitchell couldn't get to sleep." "He tried to watch tv." "That didn't help." "He then decided to lay down." "He fell right asleep.")
; events
(
(0 Sleep (5 5)
	(
		(Sleeper (0 0) ())
	)
)
(1 Attempt (8 8)
	(
		(Agent (0 0) ())
		(Goal (11 11) ())
	)
)
(2 Perception_active (10 10)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (11 11) ())
	)
)
(3 Assistance (16 16)
	(
		(Helper (0 0) ())
	)
)
(4 Negation (15 15)
	(
		(Negated_proposition (16 16) (3))
		(Negated_proposition (13 13) ())
	)
)
(5 Deciding (20 20)
	(
		(Cognizer (0 0) ())
		(Time (19 19) ())
		(Decision (21 23) (6))
	)
)
(6 Change_posture (22 23)
	(
		(Protagonist (0 0) ())
	)
)
(7 Fall_asleep (26 28)
	(
		(Sleeper (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The man heard about a tragedy." "He wanted to help." "He called the cops." "He asked if he could help." "They told him to stay out of the way.")
; events
(
(0 Catastrophe (5 5)
	(
		(Undesirable_event (5 5) ())
	)
)
(1 Hearsay (2 2)
	(
		(Topic (5 5) (0))
		(Hearer (1 1) (2))
	)
)
(2 People (1 1)
	(
		(Person (1 1) ())
	)
)
(3 Desiring (8 8)
	(
		(Event (9 10) (4))
		(Experiencer (7 7) ())
	)
)
(4 Assistance (10 10)
	(
		(Helper (7 7) ())
	)
)
(5 Contacting (13 13)
	(
		(Communicator (7 7) ())
		(Addressee (9 10) (4))
	)
)
(6 Assistance (22 22)
	(
		(Helper (20 20) ())
	)
)
(7 Questioning (18 18)
	(
		(Speaker (7 7) ())
		(Message (20 20) ())
	)
)
(8 Possibility (21 21)
	(
		(Possible_event (5 5) (0))
		(Possible_event (20 20) ())
	)
)
(9 Telling (25 25)
	(
		(Speaker (7 7) ())
		(Addressee (26 26) ())
		(Message (32 32) ())
	)
)
(10 Cause_to_continue (28 28)
	(
		(Agent (26 26) ())
		(State (32 32) ())
	)
)
)
)
(
; story sentence text for lookup
("Sam was feeling bad." "He wasn't sure what it was." "A friend suggested drinking more water." "Sam gave it a try." "It made him feel a bit better.")
; events
(
(0 Feeling (2 2)
	(
		(Experiencer (0 0) ())
		(Emotional_state (3 3) ())
	)
)
(1 Certainty (8 8)
	(
		(Cognizer (0 0) ())
		(Content (10 10) ())
	)
)
(2 Increment (17 17)
	(
		(Class (18 18) (6))
	)
)
(3 Ingestion (16 16)
	(
		(Ingestibles (18 18) (6))
		(Ingestor (14 14) (5))
	)
)
(4 Attempt_suasion (15 15)
	(
		(Content (18 18) (6))
		(Speaker (14 14) (5))
	)
)
(5 Personal_relationship (14 14)
	(
		(Partner_1 (14 14) ())
	)
)
(6 Food (18 18)
	(
		(Food (18 18) ())
	)
)
(7 Attempt (24 24)
	(
		(Agent (0 0) ())
		(Goal (22 22) ())
	)
)
(8 Quantified_mass (30 31)
	(
		(Q_prop (18 18) (6))
		(Mass (32 32) (10))
	)
)
(9 Causation (27 27)
	(
		(Cause (0 0) ())
		(Affected (22 22) ())
		(Effect (29 32) (8 10 11))
	)
)
(10 Desirability (32 32)
	(
		(Degree (18 18) (6))
		(Evaluee (22 22) ())
		(Degree (32 32) ())
	)
)
(11 Feeling (29 29)
	(
		(Experiencer (22 22) ())
		(Evaluation (10 10) ())
	)
)
)
)
(
; story sentence text for lookup
("A song played on the radio." "The man had not heard the song before." "He liked the song." "He called the radio." "They told him the name of the artist.")
; events
(
(0 Performers_and_roles (2 2)
	(
		(Medium (5 5) ())
		(Type (0 1) (1))
	)
)
(1 Text (1 1)
	(
		(Text (1 1) ())
	)
)
(2 People (8 8)
	(
		(Person (1 1) (1))
	)
)
(3 Perception_experience (11 11)
	(
		(Phenomenon (13 13) ())
		(Perceiver_passive (0 1) (1))
	)
)
(4 Experiencer_focus (17 17)
	(
		(Experiencer (16 16) ())
		(Content (19 19) (5))
	)
)
(5 Text (19 19)
	(
		(Text (19 19) ())
	)
)
(6 Contacting (22 22)
	(
		(Means (19 19) (5))
		(Communicator (16 16) ())
	)
)
(7 Telling (27 27)
	(
		(Speaker (16 16) ())
		(Addressee (28 28) ())
		(Message (30 30) (8))
	)
)
(8 Being_named (30 30)
	(
		(Name (30 30) ())
		(Entity (33 33) (9))
	)
)
(9 Create_physical_artwork (33 33)
	(
		(Creator (33 33) ())
	)
)
)
)
(
; story sentence text for lookup
("The dog was in a cage." "He howled all day." "The family got rid of the dog." "The next family let the dog outside." "The dog did not howl at all.")
; events
(
(0 Containers (5 5)
	(
		(Container (5 5) ())
	)
)
(1 Interior_profile_relation (3 3)
	(
		(Ground (5 5) (0))
		(Figure (1 1) ())
	)
)
(2 Make_noise (8 8)
	(
		(Sound (8 8) ())
		(Sound_source (7 7) ())
	)
)
(3 Calendric_unit (10 10)
	(
		(Unit (10 10) ())
	)
)
(4 Kinship (13 13)
	(
		(Relatives (8 8) (2))
	)
)
(5 Animals (18 18)
	(
		(Animal (18 18) ())
	)
)
(6 Kinship (22 22)
	(
		(Relatives (22 22) ())
	)
)
(7 Visiting (21 21)
	(
		(Entity (22 22) (6))
	)
)
(8 Make_noise (32 32)
	(
		(Sound (32 32) ())
		(Sound_source (1 1) ())
	)
)
)
)
(
; story sentence text for lookup
("The boy got ready for church." "He did not want to go." "He hid in his closet." "His mom found him." "His mom made him go to church.")
; events
(
(0 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Buildings (5 5)
	(
		(Building (5 5) ())
	)
)
(2 Motion (12 12)
	(
		(Theme (7 7) ())
	)
)
(3 Desiring (10 10)
	(
		(Event (11 12) (2))
		(Experiencer (7 7) ())
	)
)
(4 Hiding_objects (15 15)
	(
		(Agent (7 7) ())
		(Hiding_place (18 18) ())
	)
)
(5 Locating (22 22)
	(
		(Sought_entity (23 23) ())
		(Perceiver (21 21) (6))
	)
)
(6 Kinship (21 21)
	(
		(Ego (7 7) ())
		(Alter (1 1) (0))
	)
)
(7 Causation (27 27)
	(
		(Effect (31 31) (10))
		(Affected (23 23) ())
		(Actor (21 21) (6))
	)
)
(8 Kinship (26 26)
	(
		(Ego (7 7) ())
		(Alter (1 1) (0))
	)
)
(9 Motion (29 29)
	(
		(Goal (31 31) (10))
		(Theme (23 23) ())
	)
)
(10 Buildings (31 31)
	(
		(Building (31 31) ())
	)
)
)
)
(
; story sentence text for lookup
("Emmy lived on a farm." "She stayed in a pen with her brother." "One day a man came and saw Emmy." "He took her home." "They are very happy together.")
; events
(
(0 Residence (1 1)
	(
		(Location (4 4) (1))
		(Resident (0 0) ())
	)
)
(1 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
	)
)
(2 Residence (7 7)
	(
		(Resident (0 0) ())
		(Location (4 4) (1))
	)
)
(3 Kinship (13 13)
	(
		(Alter (13 13) ())
		(Ego (12 12) ())
	)
)
(4 Calendric_unit (16 16)
	(
		(Count (0 0) ())
		(Unit (16 16) ())
	)
)
(5 Arriving (19 19)
	(
		(Theme (18 18) (7))
		(Time (15 16) (4))
	)
)
(6 Perception_experience (21 21)
	(
		(Perceiver_passive (18 18) (7))
		(Phenomenon (13 13) (3))
	)
)
(7 People (18 18)
	(
		(Person (18 18) ())
	)
)
(8 Bringing (25 25)
	(
		(Agent (0 0) ())
		(Theme (26 26) ())
		(Goal (18 18) (7))
	)
)
(9 Emotion_directed (32 32)
	(
		(Experiencer (0 0) ())
		(Degree (26 26) ())
	)
)
)
)
(
; story sentence text for lookup
("Three birds are in the tree." "One is a pretty red bird." "You can not catch it." "It is high in the tree." "The red bird can see the boys with the drum." "It can see the little girl with the red dress." "It can see the good baby and the pretty doll." "It can see the man in the field." "Pretty birds, will you fly to me?")
; events
(
(0 Cardinal_numbers (0 0)
	(
		(Entity (1 1) ())
		(Number (0 0) ())
	)
)
(1 Interior_profile_relation (3 3)
	(
		(Ground (5 5) (2))
		(Figure (1 1) ())
	)
)
(2 Natural_features (5 5)
	(
		(Locale (5 5) ())
	)
)
(3 Cardinal_numbers (7 7)
	(
		(Number (0 0) (0))
	)
)
(4 Color (11 11)
	(
		(Entity (5 5) (2))
		(Color (11 11) ())
	)
)
(5 Aesthetics (10 10)
	(
		(Entity (5 5) (2))
	)
)
(6 Perception_experience (31 31)
	(
		(Perceiver_passive (29 29) ())
		(Phenomenon (33 33) (9))
	)
)
(7 Color (28 28)
	(
		(Entity (29 29) ())
		(Color (1 1) ())
	)
)
(8 Possibility (30 30)
	(
		(Possible_event (29 29) ())
		(Possible_event (33 33) (9))
	)
)
(9 People_by_age (33 33)
	(
		(Descriptor (36 36) ())
		(Person (33 33) ())
	)
)
(10 People (43 43)
	(
		(Person (5 5) (2))
		(Persistent_characteristic (11 11) (4))
		(Descriptor (47 47) (11))
	)
)
(11 Clothing (47 47)
	(
		(Descriptor (46 46) (14))
		(Garment (47 47) ())
	)
)
(12 Perception_experience (40 40)
	(
		(Perceiver_passive (0 0) (0))
		(Phenomenon (43 43) (10))
	)
)
(13 Wearing (44 44)
	(
		(Clothing (36 36) ())
		(Wearer (43 43) (10))
	)
)
(14 Color (46 46)
	(
		(Color (46 46) ())
		(Entity (47 47) (11))
	)
)
(15 Gizmo (39 39)
	(
		(Use (43 43) (10))
		(User (0 0) (0))
	)
)
(16 Size (42 42)
	(
		(Entity (5 5) (2))
	)
)
(17 People_by_age (54 54)
	(
		(Person (5 5) (2))
		(Persistent_characteristic (11 11) (4))
	)
)
(18 Perception_experience (51 51)
	(
		(Perceiver_passive (0 0) (0))
		(Phenomenon (43 43) (10))
	)
)
(19 Aesthetics (57 57)
	(
		(Entity (47 47) (11))
	)
)
(20 Gizmo (50 50)
	(
		(User (0 0) (0))
		(Use (43 43) (10))
	)
)
(21 Desirability (53 53)
	(
		(Evaluee (5 5) (2))
	)
)
(22 Perception_experience (62 62)
	(
		(Perceiver_passive (0 0) (0))
		(Phenomenon (64 64) (24))
	)
)
(23 Possibility (61 61)
	(
		(Possible_event (0 0) (0))
		(Possible_event (64 64) (24))
	)
)
(24 People (64 64)
	(
		(Person (11 11) (4))
	)
)
(25 Locale_by_use (67 67)
	(
		(Locale (67 67) ())
	)
)
(26 Self_motion (74 74)
	(
		(Self_mover (11 11) (4))
		(Goal (76 76) ())
	)
)
)
)
(
; story sentence text for lookup
("The hedge started to grow." "Spring came around." "The hedge started to bud flowers." "The flowers grew." "The roses were very beautiful.")
; events
(
(0 Ontogeny (4 4)
	(
		(Entity (1 1) ())
	)
)
(1 Activity_start (2 2)
	(
		(Activity (3 4) (0))
		(Agent (1 1) ())
	)
)
(2 Calendric_unit (6 6)
	(
		(Unit (6 6) ())
	)
)
(3 Abounding_with (14 14)
	(
		(Location (1 1) ())
		(Location (15 15) (4))
	)
)
(4 Food (15 15)
	(
	)
)
(5 Activity_start (12 12)
	(
		(Agent (1 1) ())
		(Activity (15 15) (4))
	)
)
(6 Ontogeny (19 19)
	(
		(Entity (1 1) ())
	)
)
(7 Aesthetics (25 25)
	(
		(Entity (1 1) ())
		(Degree (24 24) ())
	)
)
)
)
(
; story sentence text for lookup
("The boy got lost." "He called to his mom." "His mom could not hear him." "He ran into a man." "The man brought the boy to his mom.")
; events
(
(0 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Contacting (6 6)
	(
		(Communicator (5 5) ())
		(Addressee (9 9) (2))
	)
)
(2 Kinship (9 9)
	(
		(Alter (9 9) ())
		(Ego (8 8) ())
	)
)
(3 Kinship (12 12)
	(
		(Ego (5 5) ())
		(Alter (1 1) (0))
	)
)
(4 Perception_experience (15 15)
	(
		(Phenomenon (16 16) ())
		(Perceiver_passive (12 12) (3))
	)
)
(5 Self_motion (19 19)
	(
		(Self_mover (5 5) ())
		(Goal (9 9) (2))
	)
)
(6 People (22 22)
	(
		(Person (9 9) (2))
	)
)
(7 Bringing (26 26)
	(
		(Theme (28 28) (9))
		(Goal (31 31) (10))
		(Agent (12 12) (3))
	)
)
(8 People (25 25)
	(
		(Person (1 1) (0))
	)
)
(9 People_by_age (28 28)
	(
		(Person (9 9) (2))
	)
)
(10 Kinship (31 31)
	(
		(Alter (31 31) ())
		(Ego (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("Susan had a new phone." "She was walking in the woods one day." "She lost her phone." "She got upset." "Then she found it later.")
; events
(
(0 Possession (1 1)
	(
		(Owner (0 0) ())
		(Possession (4 4) (1))
	)
)
(1 Gizmo (4 4)
	(
		(Gizmo (4 4) ())
	)
)
(2 Age (3 3)
	(
		(Entity (4 4) (1))
		(Age (3 3) ())
	)
)
(3 Calendric_unit (13 13)
	(
		(Unit (13 13) ())
		(Count (12 12) ())
	)
)
(4 Self_motion (8 8)
	(
		(Self_mover (0 0) ())
		(Area (11 11) ())
	)
)
(5 Accoutrements (18 18)
	(
		(Wearer (17 17) ())
		(Accoutrement (3 3) (2))
	)
)
(6 Emotion_directed (22 22)
	(
		(Experiencer (0 0) ())
	)
)
(7 Transition_to_state (21 21)
	(
		(Final_quality (17 17) ())
		(Entity (0 0) ())
	)
)
(8 Becoming_aware (26 26)
	(
		(Cognizer (25 25) ())
		(Time (4 4) (1))
		(Phenomenon (3 3) (2))
	)
)
)
)
(
; story sentence text for lookup
("My horse is strong and kind." "He will let me ride on his back." "He draws me in a wagon." "He can trot, and run." "He can run as fast as Tom's horse." "I call him Dan." "He will come if I call him." "He will eat from my hand.")
; events
(
(0 Social_interaction_evaluation (5 5)
	(
		(Evaluee (1 1) ())
	)
)
(1 Level_of_force_exertion (3 3)
	(
		(Exerter (1 1) ())
	)
)
(2 Preventing_or_letting (9 9)
	(
		(Potential_hindrance (7 7) ())
		(Event (14 14) (4))
		(Event (10 10) ())
	)
)
(3 Operate_vehicle (11 11)
	(
		(Result (14 14) (4))
		(Driver (10 10) ())
	)
)
(4 Body_parts (14 14)
	(
		(Body_part (14 14) ())
		(Possessor (13 13) ())
	)
)
(5 Containers (21 21)
	(
		(Container (21 21) ())
	)
)
(6 Cause_motion (17 17)
	(
		(Agent (7 7) ())
		(Theme (18 18) ())
		(Goal (21 21) (5))
	)
)
(7 Self_motion (25 25)
	(
		(Self_mover (7 7) ())
	)
)
(8 Capability (24 24)
	(
		(Entity (7 7) ())
		(Event (25 28) (7 9))
	)
)
(9 Self_motion (28 28)
	(
		(Self_mover (7 7) ())
	)
)
(10 Self_motion (32 32)
	(
		(Self_mover (7 7) ())
		(Manner (38 38) ())
	)
)
(11 Capability (31 31)
	(
		(Event (38 38) ())
		(Entity (7 7) ())
	)
)
(12 Speed_description (34 34)
	(
		(Degree (38 38) ())
		(Entity (7 7) ())
	)
)
(13 Referring_by_name (41 41)
	(
		(Speaker (7 7) ())
		(Entity (18 18) ())
		(Name (10 10) ())
	)
)
(14 Arriving (47 47)
	(
		(Theme (7 7) ())
	)
)
(15 Contacting (50 50)
	(
		(Communicator (49 49) ())
		(Addressee (13 13) ())
	)
)
(16 Ingestion (55 55)
	(
		(Ingestor (7 7) ())
		(Source (21 21) (5))
	)
)
(17 Body_parts (58 58)
	(
		(Body_part (21 21) (5))
		(Possessor (49 49) ())
	)
)
)
)
(
; story sentence text for lookup
("The boy walked the dog." "The dog saw a cat." "The dog chased after the cat." "The boy had to let go of the dog." "The dog ran away after the cat.")
; events
(
(0 Self_motion (2 2)
	(
		(Result (4 4) ())
		(Self_mover (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Perception_experience (8 8)
	(
		(Phenomenon (4 4) ())
		(Perceiver_passive (1 1) (1))
	)
)
(3 Animals (10 10)
	(
		(Animal (10 10) ())
	)
)
(4 Cotheme (14 14)
	(
		(Cotheme (17 17) ())
		(Theme (1 1) (1))
	)
)
(5 People_by_age (20 20)
	(
		(Person (1 1) (1))
	)
)
(6 Self_motion (31 31)
	(
		(Cotheme (35 35) ())
		(Source (32 32) ())
		(Self_mover (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("The man went out to his mailbox." "He looked for his paper." "His paper was not there." "He called his paper boy." "His paper boy was running late.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Containers (6 6)
	(
		(Container (6 6) ())
		(Owner (5 5) ())
	)
)
(2 Scrutiny (9 9)
	(
		(Cognizer (8 8) ())
		(Phenomenon (12 12) (3))
	)
)
(3 Text (12 12)
	(
		(Text (12 12) ())
		(Author (11 11) ())
	)
)
(4 Referring_by_name (21 21)
	(
		(Speaker (8 8) ())
		(Entity (22 22) ())
		(Name (24 24) (5))
	)
)
(5 People_by_age (24 24)
	(
		(Person (22 22) ())
		(Person (12 12) (3))
		(Descriptor (11 11) ())
	)
)
)
)
(
; story sentence text for lookup
("The girl made a dress." "The dress was pretty." "All her friends wanted one." "She made each friend a dress of their own." "He friends each wore the dress at the girl's wedding.")
; events
(
(0 Cooking_creation (2 2)
	(
		(Produced_food (4 4) (2))
		(Cook (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Clothing (4 4)
	(
		(Garment (4 4) ())
	)
)
(3 Clothing (7 7)
	(
		(Garment (1 1) (1))
	)
)
(4 Aesthetics (9 9)
	(
		(Entity (1 1) (1))
	)
)
(5 Quantified_mass (11 11)
	(
		(Individuals (13 13) (6))
		(Quantity (11 11) ())
	)
)
(6 Personal_relationship (13 13)
	(
		(Partner_1 (13 13) ())
		(Partner_2 (1 1) (1))
	)
)
(7 Desiring (14 14)
	(
		(Experiencer (13 13) (6))
		(Focal_participant (4 4) (2))
	)
)
(8 Filling (18 18)
	(
		(Goal (20 20) (10))
		(Agent (11 11) (5))
		(Goal (25 25) ())
	)
)
(9 Clothing (22 22)
	(
		(Wearer (25 25) ())
		(Garment (22 22) ())
	)
)
(10 Personal_relationship (20 20)
	(
	)
)
(11 Forming_relationships (37 37)
	(
		(Partner_1 (34 36) (12))
	)
)
(12 People (35 35)
	(
		(Person (35 35) ())
	)
)
(13 Clothing (32 32)
	(
		(Garment (22 22) (9))
	)
)
(14 Wearing (30 30)
	(
		(Clothing (32 32) (13))
		(Wearer (13 13) (6))
		(Time (37 37) (11))
	)
)
(15 Personal_relationship (28 28)
	(
		(Partner_2 (11 11) (5))
		(Partner_1 (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("Michael was very shy." "He would only play by himself." "One day I asked him to play with me." "We have been friends ever since." "Michael is my best friend.")
; events
(
(0 Sociability (3 3)
	(
		(Protagonist (0 0) ())
		(Degree (2 2) ())
	)
)
(1 Calendric_unit (13 13)
	(
		(Count (0 0) ())
		(Unit (13 13) ())
	)
)
(2 Request (15 15)
	(
		(Speaker (2 2) ())
		(Message (20 20) ())
		(Addressee (16 16) ())
	)
)
(3 Personal_relationship (25 25)
	(
		(Partners (0 0) ())
	)
)
(4 Personal_relationship (33 33)
	(
		(Partner_1 (0 0) ())
		(Partner_2 (2 2) ())
	)
)
(5 Desirability (32 32)
	(
	)
)
)
)
(
; story sentence text for lookup
("I went on a run at the park one day." "It was early morning." "I saw my friend's car." "She was running with my other friend." "They were shirtless.")
; events
(
(0 Spatial_co-location (5 5)
	(
		(Ground (7 7) (4))
		(Figure (0 0) ())
	)
)
(1 Calendric_unit (9 9)
	(
		(Unit (9 9) ())
	)
)
(2 Motion (1 1)
	(
		(Theme (0 0) ())
		(Place (7 7) (4))
		(Goal (4 4) (3))
		(Time (8 9) (1))
	)
)
(3 Bungling (4 4)
	(
		(Agent (0 0) ())
		(Place (7 7) (4))
	)
)
(4 Locale_by_use (7 7)
	(
		(Locale (7 7) ())
	)
)
(5 Temporal_subregion (13 13)
	(
		(Time_period (14 14) (6))
	)
)
(6 Calendric_unit (14 14)
	(
		(Relative_time (13 13) (5))
		(Unit (14 14) ())
	)
)
(7 Perception_experience (17 17)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (21 21) (8))
	)
)
(8 Vehicle (21 21)
	(
		(Possessor (4 4) (3))
		(Vehicle (21 21) ())
	)
)
(9 Personal_relationship (19 19)
	(
		(Partner_2 (13 13) (5))
		(Partner_1 (14 14) (6))
	)
)
(10 Self_motion (25 25)
	(
		(Self_mover (0 0) ())
		(Cotheme (29 29) (12))
	)
)
(11 Increment (28 28)
	(
		(Class (29 29) (12))
	)
)
(12 Personal_relationship (29 29)
	(
		(Partner_2 (27 27) ())
		(Partner_1 (29 29) ())
	)
)
(13 Wearing (33 33)
	(
		(Wearer (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The man liked a drug." "He tried to find some." "It was illegal." "The cops saw him." "The man went to jail.")
; events
(
(0 Experiencer_focus (2 2)
	(
		(Content (4 4) (2))
		(Experiencer (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Intoxicants (4 4)
	(
		(Intoxicant (4 4) ())
	)
)
(3 Attempt (7 7)
	(
		(Agent (6 6) ())
		(Goal (10 10) ())
	)
)
(4 Locating (9 9)
	(
		(Perceiver (6 6) ())
		(Sought_entity (4 4) (2))
	)
)
(5 Legality (14 14)
	(
		(Action (6 6) ())
	)
)
(6 Perception_experience (18 18)
	(
		(Perceiver_passive (1 1) (1))
		(Phenomenon (19 19) ())
	)
)
(7 Prison (25 25)
	(
		(Penal_institution (4 4) (2))
	)
)
(8 People (22 22)
	(
		(Person (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("My dog was dreaming." "It was lying on the floor." "Then it jumped up quickly." "My dog let out a bark." "I had never seen her do that before.")
; events
(
(0 Posture (7 7)
	(
		(Point_of_contact (7 7) ())
		(Agent (5 5) ())
		(Location (10 10) (1))
	)
)
(1 Architectural_part (10 10)
	(
		(Part (10 10) ())
	)
)
(2 Self_motion (14 14)
	(
		(Manner (16 16) (3))
		(Time (5 5) ())
		(Self_mover (13 13) ())
		(Path (15 15) ())
	)
)
(3 Rate_description (16 16)
	(
		(Event (13 13) ())
	)
)
(4 Sounds (23 23)
	(
		(Sound_source (19 19) ())
	)
)
(5 Creating (20 20)
	(
		(Purpose (23 23) (4))
		(Depictive (15 15) ())
		(Creator (19 19) ())
	)
)
(6 Negation (27 27)
	(
		(Negated_proposition (29 29) ())
		(Negated_proposition (19 19) ())
	)
)
(7 Intentionally_act (30 30)
	(
		(Agent (16 16) (3))
		(Act (31 31) ())
		(Time (32 32) ())
	)
)
(8 Perception_experience (28 28)
	(
		(Perceiver_passive (5 5) ())
		(Phenomenon (16 16) (3))
		(State (31 31) ())
		(Time (32 32) ())
	)
)
)
)
(
; story sentence text for lookup
("I had to take graduation pictures." "I went to a studio." "They gave me a jacket." "They took two pictures." "One of them is on my wall.")
; events
(
(0 Required_event (1 2)
	(
		(Required_situation (0 0) ())
		(Required_situation (5 5) (1))
	)
)
(1 Physical_artworks (5 5)
	(
		(Place (4 4) (3))
		(Artifact (5 5) ())
	)
)
(2 Create_representation (3 3)
	(
		(Creator (0 0) ())
		(Purpose (5 5) (1))
	)
)
(3 Sensation (4 4)
	(
	)
)
(4 Motion (8 8)
	(
		(Theme (0 0) ())
		(Goal (11 11) (5))
	)
)
(5 Building_subparts (11 11)
	(
	)
)
(6 Clothing (17 17)
	(
		(Garment (4 4) (3))
	)
)
(7 Giving (14 14)
	(
		(Donor (0 0) ())
		(Recipient (15 15) ())
		(Theme (17 17) (6))
	)
)
(8 Create_representation (20 20)
	(
		(Representation (22 22) (9))
		(Creator (0 0) ())
	)
)
(9 Physical_artworks (22 22)
	(
		(Creator (0 0) ())
		(Artifact (22 22) ())
	)
)
(10 Spatial_contact (28 28)
	(
		(Ground (30 30) (11))
		(Figure (24 24) ())
	)
)
(11 Architectural_part (30 30)
	(
		(Whole (5 5) (1))
		(Part (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("One day Ned went out to walk." "He looked up and saw a green bird.")
; events
(
(0 Calendric_unit (1 1)
	(
		(Count (0 0) ())
		(Unit (1 1) ())
	)
)
(1 Self_motion (6 6)
	(
		(Self_mover (2 2) ())
	)
)
(2 Motion (3 3)
	(
		(Purpose (5 6) (1))
		(Theme (2 2) ())
		(Goal (4 4) ())
	)
)
(3 Perception_active (9 9)
	(
		(Perceiver_agentive (0 0) ())
		(Direction (2 2) ())
	)
)
(4 Perception_experience (12 12)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (15 15) ())
	)
)
(5 Color (14 14)
	(
		(Entity (15 15) ())
		(Color (14 14) ())
	)
)
)
)
(
; story sentence text for lookup
("It is not a dog, but it has legs." "It is not a bird, but it has wings." "It says buz, buz, buz." "It is busy all the day.")
; events
(
(0 Animals (4 4)
	(
		(Animal (0 0) ())
		(Animal (4 4) ())
	)
)
(1 Body_parts (9 9)
	(
		(Possessor (7 7) ())
		(Body_part (9 9) ())
	)
)
(2 Possession (8 8)
	(
		(Owner (7 7) ())
		(Possession (9 9) (1))
	)
)
(3 Possession (19 19)
	(
		(Possession (9 9) (1))
		(Owner (7 7) ())
	)
)
(4 Body_parts (20 20)
	(
		(Body_part (9 9) (1))
		(Possessor (7 7) ())
	)
)
(5 Sounds (28 28)
	(
	)
)
(6 Sounds (24 24)
	(
	)
)
(7 Text_creation (23 23)
	(
		(Text (0 0) ())
		(Text (28 28) (5))
	)
)
(8 Lively_place (32 32)
	(
		(Location (0 0) ())
		(Time (33 35) (9))
	)
)
(9 Calendric_unit (35 35)
	(
		(Unit (35 35) ())
	)
)
)
)
(
; story sentence text for lookup
("The man heard his phone ring." "He didn't know where it was." "He followed the sound." "He found his phone." "He could not answer it in time.")
; events
(
(0 Perception_experience (2 2)
	(
		(Phenomenon (5 5) (2))
		(Perceiver_passive (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Make_noise (5 5)
	(
		(Sound_source (3 4) ())
	)
)
(3 Awareness (10 10)
	(
		(Cognizer (7 7) ())
		(Content (12 12) ())
	)
)
(4 Cotheme (16 16)
	(
		(Cotheme (18 18) (5))
		(Theme (7 7) ())
	)
)
(5 Sensation (18 18)
	(
		(Perceiver_passive (7 7) ())
		(Percept (18 18) ())
	)
)
(6 Locating (21 21)
	(
		(Perceiver (7 7) ())
		(Sought_entity (23 23) (7))
	)
)
(7 Accoutrements (23 23)
	(
		(Wearer (22 22) ())
		(Accoutrement (18 18) (5))
	)
)
(8 Communication_response (28 28)
	(
		(Speaker (7 7) ())
		(Trigger (29 29) ())
	)
)
)
)
(
; story sentence text for lookup
("Boys like to catch fish." "It is a good sport." "Here is Tom with his rod and line." "A hook is on the end of the line." "He has a bag, too." "The bag is to put the fish in." "Here is the fish for Tom to catch." "It swims with its tail." "It can swim very fast.")
; events
(
(0 People_by_age (0 0)
	(
		(Person (0 0) ())
	)
)
(1 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) (0))
		(Content (4 4) (2))
	)
)
(2 Food (4 4)
	(
	)
)
(3 Hunting (3 3)
	(
		(Hunter (0 0) (0))
		(Food (4 4) (2))
	)
)
(4 Desirability (9 9)
	(
		(Evaluee (4 4) (2))
	)
)
(5 Spatial_co-location (12 12)
	(
		(Figure (14 14) ())
	)
)
(6 Connectors (19 19)
	(
		(Connected_item (4 4) (2))
		(Connector (19 19) ())
	)
)
(7 Shapes (29 29)
	(
		(Shape (29 29) ())
	)
)
(8 Connectors (22 22)
	(
		(Connector (22 22) ())
	)
)
(9 Part_orientational (26 26)
	(
		(Whole (29 29) (7))
		(Part (26 26) ())
	)
)
(10 Spatial_contact (24 24)
	(
		(Ground (26 26) (9))
		(Figure (22 22) (8))
	)
)
(11 Possession (32 32)
	(
		(Possession (34 34) (12))
		(Owner (0 0) (0))
	)
)
(12 Containers (34 34)
	(
		(Owner (0 0) (0))
		(Container (34 34) ())
	)
)
(13 Containers (39 39)
	(
		(Container (22 22) (8))
	)
)
(14 Placing (42 42)
	(
		(Theme (44 44) (15))
		(Goal (19 19) (6))
	)
)
(15 Food (44 44)
	(
	)
)
(16 Hunting (54 54)
	(
		(Hunter (26 26) (9))
	)
)
(17 Food (50 50)
	(
	)
)
(18 Self_motion (57 57)
	(
		(Self_mover (0 0) (0))
		(Depictive (4 4) (2))
	)
)
(19 Body_parts (60 60)
	(
		(Body_part (4 4) (2))
		(Possessor (34 34) (12))
	)
)
(20 Self_motion (64 64)
	(
		(Self_mover (0 0) (0))
		(Manner (65 66) (22))
	)
)
(21 Capability (63 63)
	(
		(Entity (0 0) (0))
		(Event (4 4) (2))
	)
)
(22 Speed_description (66 66)
	(
		(Entity (0 0) (0))
		(Degree (34 34) (12))
	)
)
)
)
(
; story sentence text for lookup
("John wanted to get a new pet." "He went to the pound to look for one." "He saw a sad puppy." "John felt deeply for it." "He took him home as his new pet.")
; events
(
(0 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (6 6) ())
	)
)
(1 Age (5 5)
	(
		(Age (5 5) ())
		(Entity (6 6) ())
	)
)
(2 Getting (3 3)
	(
		(Recipient (0 0) ())
		(Theme (6 6) ())
	)
)
(3 Motion (9 9)
	(
		(Theme (0 0) ())
		(Goal (12 12) ())
		(Purpose (16 16) ())
	)
)
(4 Seeking (14 14)
	(
		(Cognizer_agent (0 0) ())
		(Sought_entity (16 16) ())
	)
)
(5 Perception_experience (19 19)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (12 12) ())
	)
)
(6 Animals (22 22)
	(
		(Animal (22 22) ())
		(Descriptor (21 21) (7))
	)
)
(7 Emotion_directed (21 21)
	(
		(Experiencer (22 22) (6))
	)
)
(8 Perception_active (25 25)
	(
		(Manner (26 26) ())
		(Perceiver_agentive (0 0) ())
		(Phenomenon (28 28) ())
	)
)
(9 Bringing (31 31)
	(
		(Agent (0 0) ())
		(Theme (26 26) ())
		(Purpose (37 37) ())
		(Goal (21 21) (7))
	)
)
(10 Age (36 36)
	(
		(Entity (37 37) ())
		(Age (6 6) ())
	)
)
)
)
(
; story sentence text for lookup
("I like to see John run with his kite." "He can run as fast as the other boys, but he can not jump far." "He does not like to look at books and pictures, but he can play on a drum.")
; events
(
(0 Dead_or_alive (8 8)
	(
		(Protagonist (8 8) ())
		(Protagonist (7 7) ())
	)
)
(1 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (4 4) ())
	)
)
(2 Self_motion (5 5)
	(
		(Depictive (8 8) (0))
		(Self_mover (4 4) ())
	)
)
(3 Perception_experience (3 3)
	(
		(Perceiver_passive (0 0) ())
		(Depictive (8 8) (0))
		(Phenomenon (4 4) ())
	)
)
(4 Self_motion (24 24)
	(
		(Self_mover (21 21) ())
		(Distance (25 25) ())
	)
)
(5 Self_motion (12 12)
	(
		(Self_mover (0 0) ())
		(Manner (18 18) (7))
	)
)
(6 Capability (22 22)
	(
		(Event (24 25) (4))
		(Entity (21 21) ())
	)
)
(7 People_by_age (18 18)
	(
		(Person (8 8) (0))
	)
)
(8 Capability (11 11)
	(
		(Entity (0 0) ())
		(Event (4 4) ())
	)
)
(9 Speed_description (14 14)
	(
		(Entity (0 0) ())
		(Degree (8 8) (0))
		(Degree (13 13) ())
	)
)
(10 Increment (17 17)
	(
		(Class (8 8) (0))
	)
)
(11 Perception_active (32 32)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (34 34) (17))
	)
)
(12 Experiencer_focus (30 30)
	(
		(Experiencer (0 0) ())
		(Content (34 34) (17))
	)
)
(13 Physical_artworks (36 36)
	(
		(Artifact (36 36) ())
	)
)
(14 Noise_makers (44 44)
	(
		(Noise_maker (44 44) ())
	)
)
(15 Capability (40 40)
	(
		(Entity (39 39) ())
		(Event (44 44) (14))
	)
)
(16 Cause_to_make_noise (41 41)
	(
		(Agent (39 39) ())
		(Sound_maker (44 44) (14))
	)
)
(17 Text (34 34)
	(
		(Text (7 7) ())
	)
)
)
)
(
; story sentence text for lookup
("The man looked outside." "It was sunny." "The man decided to go for a job." "It started raining." "The man ran home.")
; events
(
(0 Perception_active (2 2)
	(
		(Direction (3 3) (2))
		(Perceiver_agentive (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Part_inner_outer (3 3)
	(
		(Part (1 1) (1))
	)
)
(3 Weather (7 7)
	(
	)
)
(4 Deciding (11 11)
	(
		(Decision (16 16) (6))
		(Cognizer (1 1) (1))
	)
)
(5 People (10 10)
	(
		(Person (1 1) (1))
	)
)
(6 Being_employed (16 16)
	(
	)
)
(7 Precipitation (20 20)
	(
		(Precipitation (20 20) ())
	)
)
(8 Activity_start (19 19)
	(
		(Activity (20 20) (7))
		(Agent (18 18) ())
	)
)
(9 Self_motion (24 24)
	(
		(Goal (3 3) (2))
		(Self_mover (1 1) (1))
	)
)
(10 People (23 23)
	(
		(Person (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("The girl is good to the little baby." "The baby may have my big doll." "She can not catch the bird." "She may come with me and see the bird fly.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 People_by_age (7 7)
	(
		(Person (7 7) ())
		(Descriptor (6 6) ())
	)
)
(2 Social_interaction_evaluation (3 3)
	(
		(Affected_party (7 7) (1))
		(Evaluee (1 1) (0))
	)
)
(3 Likelihood (11 11)
	(
		(Hypothetical_event (15 15) ())
		(Hypothetical_event (1 1) (0))
	)
)
(4 People_by_age (10 10)
	(
		(Person (1 1) (0))
	)
)
(5 Possession (12 12)
	(
		(Possession (15 15) ())
		(Owner (1 1) (0))
	)
)
(6 Possibility (18 18)
	(
		(Possible_event (17 17) ())
		(Possible_event (22 22) ())
	)
)
(7 Goal (20 20)
	(
		(Time (17 17) ())
		(Time (22 22) ())
	)
)
(8 Level_of_force_exertion (33 33)
	(
		(Exerter (32 32) ())
	)
)
(9 Arriving (26 26)
	(
		(Theme (17 17) ())
		(Cotheme (28 28) ())
	)
)
(10 Perception_experience (30 30)
	(
		(Perceiver_passive (17 17) ())
		(Phenomenon (32 32) ())
	)
)
)
)
(
; story sentence text for lookup
("My mother gave me a new book." "I took it to school one morning, to let the girls see the pictures." "Soon after this I found my pet kitten and took her home with me." "I like to play with my pet kitten." "I will do as mother says." "I will take good care of the kitten.")
; events
(
(0 Giving (2 2)
	(
		(Theme (6 6) (3))
		(Recipient (3 3) ())
		(Donor (1 1) (1))
	)
)
(1 Kinship (1 1)
	(
		(Ego (0 0) ())
		(Alter (1 1) ())
	)
)
(2 Age (5 5)
	(
		(Entity (6 6) (3))
	)
)
(3 Text (6 6)
	(
		(Text (6 6) ())
	)
)
(4 People (19 19)
	(
		(Person (19 19) ())
	)
)
(5 Physical_artworks (22 22)
	(
		(Artifact (22 22) ())
	)
)
(6 Perception_experience (20 20)
	(
		(Perceiver_passive (19 19) (4))
		(Phenomenon (22 22) (5))
	)
)
(7 Calendric_unit (14 14)
	(
		(Unit (6 6) (3))
	)
)
(8 Bringing (9 9)
	(
		(Agent (0 0) ())
		(Theme (10 10) ())
		(Goal (12 12) (9))
		(Purpose (19 19) (4))
	)
)
(9 Locale_by_use (12 12)
	(
		(Locale (12 12) ())
	)
)
(10 Bringing (33 33)
	(
		(Theme (34 34) ())
		(Goal (19 19) (4))
		(Agent (3 3) ())
		(Constant_location (37 37) ())
	)
)
(11 Time_vector (25 25)
	(
		(Direction (1 1) (1))
		(Event (27 27) ())
		(Landmark_event (10 10) ())
		(Distance (0 0) ())
	)
)
(12 Locating (28 28)
	(
		(Perceiver (3 3) ())
		(Sought_entity (31 31) ())
	)
)
(13 Experiencer_focus (40 40)
	(
		(Experiencer (0 0) ())
		(Content (46 46) ())
	)
)
(14 Competition (42 42)
	(
		(Participant_1 (0 0) ())
		(Purpose (46 46) ())
	)
)
(15 Statement (53 53)
	(
		(Speaker (12 12) (9))
		(Message (3 3) ())
	)
)
(16 Intentionally_act (50 50)
	(
		(Agent (0 0) ())
		(Act (52 52) (17))
	)
)
(17 Kinship (52 52)
	(
		(Alter (12 12) (9))
	)
)
)
)
(
; story sentence text for lookup
("Kelsi was engaged." "She just got a new ring." "She was happy about it." "But it was too small." "She had to get another one.")
; events
(
(0 Personal_relationship (2 2)
	(
		(Partner_1 (0 0) ())
	)
)
(1 Accoutrements (9 9)
	(
		(Accoutrement (9 9) ())
		(Descriptor (8 8) (3))
	)
)
(2 Have_associated (6 6)
	(
		(Topical_entity (0 0) ())
		(Entity (9 9) (1))
	)
)
(3 Age (8 8)
	(
		(Entity (9 9) (1))
		(Age (8 8) ())
	)
)
(4 Emotion_directed (13 13)
	(
		(Experiencer (0 0) ())
		(Topic (15 15) ())
	)
)
(5 Size (21 21)
	(
		(Entity (18 18) ())
		(Degree (20 20) ())
	)
)
(6 Required_event (24 25)
	(
		(Required_situation (0 0) ())
		(Required_situation (9 9) (1))
	)
)
(7 Increment (27 27)
	(
		(Class (9 9) (1))
	)
)
(8 Getting (26 26)
	(
		(Theme (28 28) ())
		(Recipient (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("John wanted to start a family." "He thought highly of family values." "He met a great girl." "They fell in love." "They got married.")
; events
(
(0 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (5 5) (1))
	)
)
(1 Kinship (5 5)
	(
		(Relatives (0 0) ())
		(Relatives (5 5) ())
	)
)
(2 Intentionally_create (3 3)
	(
		(Created_entity (5 5) (1))
		(Creator (0 0) ())
	)
)
(3 Awareness (8 8)
	(
		(Cognizer (0 0) ())
		(Degree (9 9) ())
		(Content (12 12) ())
	)
)
(4 Kinship (11 11)
	(
		(Relatives (11 11) ())
	)
)
(5 Make_acquaintance (15 15)
	(
		(Individual_1 (0 0) ())
		(Individual_2 (18 18) (6))
	)
)
(6 People (18 18)
	(
		(Person (11 11) (4))
		(Descriptor (17 17) (7))
	)
)
(7 Desirability (17 17)
	(
		(Evaluee (11 11) (4))
	)
)
(8 Personal_relationship (21 23)
	(
		(Partners (0 0) ())
	)
)
(9 Personal_relationship (27 27)
	(
		(Partners (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("I have a doll." "I can see my doll." "My doll has a hat." "The girl has a doll and a hat.")
; events
(
(0 Possession (1 1)
	(
		(Owner (0 0) ())
		(Possession (3 3) ())
	)
)
(1 Perception_experience (7 7)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (9 9) ())
	)
)
(2 Possibility (6 6)
	(
		(Possible_event (0 0) ())
		(Possible_event (9 9) ())
	)
)
(3 Accoutrements (15 15)
	(
		(Accoutrement (15 15) ())
	)
)
(4 Wearing (13 13)
	(
		(Clothing (9 9) ())
		(Wearer (12 12) ())
	)
)
(5 Accoutrements (24 24)
	(
		(Accoutrement (24 24) ())
	)
)
(6 Possession (19 19)
	(
		(Possession (21 21) ())
		(Owner (12 12) ())
	)
)
(7 People (18 18)
	(
		(Person (18 18) ())
	)
)
)
)
(
; story sentence text for lookup
("The man found a crate." "He couldn't get it open." "He looked for a hammer at home." "He went back to the crate with the hammer." "The crate was gone.")
; events
(
(0 Containers (4 4)
	(
		(Container (4 4) ())
	)
)
(1 Locating (2 2)
	(
		(Sought_entity (4 4) (0))
		(Perceiver (1 1) (2))
	)
)
(2 People (1 1)
	(
		(Person (1 1) ())
	)
)
(3 Medical_instruments (17 17)
	(
		(Instrument (4 4) (0))
	)
)
(4 Seeking (14 14)
	(
		(Cognizer_agent (13 13) ())
		(Sought_entity (17 17) (3))
		(Ground (19 19) (5))
	)
)
(5 Buildings (19 19)
	(
		(Building (19 19) ())
	)
)
(6 Locative_relation (18 18)
	(
		(Ground (19 19) (5))
		(Figure (17 17) (3))
	)
)
(7 Containers (26 26)
	(
		(Container (26 26) ())
	)
)
(8 Motion (22 22)
	(
		(Theme (13 13) ())
		(Direction (23 23) ())
		(Goal (4 4) (0))
		(Depictive (29 29) (9))
	)
)
(9 Medical_instruments (29 29)
	(
		(Instrument (29 29) ())
	)
)
(10 Containers (32 32)
	(
		(Container (1 1) (2))
	)
)
)
)
(
; story sentence text for lookup
("Allie went to the store." "She saw candy on sale." "It looked great." "She got sour candy." "She got five bags.")
; events
(
(0 Motion (1 1)
	(
		(Goal (4 4) (1))
		(Theme (0 0) ())
	)
)
(1 Businesses (4 4)
	(
		(Business (4 4) ())
	)
)
(2 Food (8 8)
	(
	)
)
(3 Perception_experience (7 7)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (4 4) (1))
	)
)
(4 Commerce_sell (10 10)
	(
		(Goods (8 8) (2))
	)
)
(5 Desirability (14 14)
	(
		(Evaluee (0 0) ())
	)
)
(6 Give_impression (13 13)
	(
		(Phenomenon (0 0) ())
		(Appraisal (8 8) (2))
	)
)
(7 Chemical-sense_description (18 18)
	(
		(Perceptual_source (19 19) (9))
	)
)
(8 Have_associated (17 17)
	(
		(Topical_entity (0 0) ())
		(Entity (19 19) (9))
	)
)
(9 Food (19 19)
	(
		(Type (8 8) (2))
	)
)
(10 Cardinal_numbers (23 23)
	(
		(Number (8 8) (2))
		(Unit (19 19) (9))
	)
)
(11 Possession (22 22)
	(
		(Possession (19 19) (9))
		(Owner (0 0) ())
	)
)
(12 Measure_volume (24 24)
	(
		(Count (8 8) (2))
		(Unit (19 19) (9))
	)
)
)
)
(
; story sentence text for lookup
("Rene loved the swings." "She didn't think she was too old to use them." "Rene went very high." "At the end she jumped off." "She had much fun.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (3 3) ())
	)
)
(1 Awareness (8 8)
	(
		(Cognizer (0 0) ())
		(Content (9 9) ())
	)
)
(2 Age (12 12)
	(
		(Degree (11 11) (5))
		(Degree (15 15) ())
		(Entity (9 9) ())
	)
)
(3 Negation (7 7)
	(
		(Negated_proposition (9 9) ())
		(Negated_proposition (5 5) ())
	)
)
(4 Using (14 14)
	(
		(Instrument (15 15) ())
		(Agent (9 9) ())
	)
)
(5 Sufficiency (11 11)
	(
		(Enabled_situation (15 15) ())
		(Item (9 9) ())
		(Scale (12 12) (2))
	)
)
(6 Transition_to_a_quality (18 18)
	(
		(Final_quality (3 3) ())
		(Entity (0 0) ())
	)
)
(7 Self_motion (26 26)
	(
		(Time (24 24) (8))
		(Source (27 27) ())
		(Self_mover (25 25) ())
	)
)
(8 Temporal_subregion (24 24)
	(
		(Subpart (24 24) ())
	)
)
(9 Emotion_directed (32 32)
	(
		(Experiencer (0 0) ())
		(Degree (24 24) (8))
	)
)
)
)
(
; story sentence text for lookup
("James is kind to Fanny." "She is his little sister." "He has a nice wagon." "He plays horse, and gives her a ride.")
; events
(
(0 Social_interaction_evaluation (2 2)
	(
		(Evaluee (0 0) ())
		(Affected_party (4 4) ())
	)
)
(1 Kinship (10 10)
	(
		(Alter (0 0) ())
		(Ego (8 8) ())
	)
)
(2 Containers (16 16)
	(
		(Container (16 16) ())
		(Descriptor (15 15) (4))
	)
)
(3 Possession (13 13)
	(
		(Owner (0 0) ())
		(Possession (16 16) (2))
	)
)
(4 Stimulus_focus (15 15)
	(
		(Stimulus (16 16) (2))
	)
)
)
)
(
; story sentence text for lookup
("Kate felt something run across her foot." "It was a giant spider!" "She swatted it away." "It ran under her bed." "She could not sleep that night.")
; events
(
(0 Perception_experience (1 1)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (2 2) ())
	)
)
(1 Body_parts (6 6)
	(
		(Possessor (5 5) ())
		(Body_part (6 6) ())
	)
)
(2 Fluidic_motion (3 3)
	(
		(Fluid (2 2) ())
		(Path (6 6) (1))
	)
)
(3 Reveal_secret (15 17)
	(
		(Speaker (0 0) ())
		(Information (2 2) ())
	)
)
(4 Non-gradable_proximity (21 21)
	(
		(Figure (0 0) ())
		(Ground (23 23) ())
	)
)
(5 Fluidic_motion (20 20)
	(
		(Fluid (0 0) ())
		(Path (23 23) ())
	)
)
(6 Calendric_unit (30 30)
	(
		(Unit (5 5) ())
		(Relative_time (29 29) ())
	)
)
(7 Sleep (28 28)
	(
		(Time (29 30) (6))
		(Sleeper (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The cat is on the box." "She saw a big rat and ran to catch it.")
; events
(
(0 Perception_experience (8 8)
	(
		(Perceiver_passive (7 7) ())
		(Phenomenon (11 11) ())
	)
)
(1 Self_motion (13 13)
	(
		(Purpose (16 16) ())
		(Self_mover (7 7) ())
	)
)
(2 Size (10 10)
	(
		(Entity (11 11) ())
	)
)
)
)
(
; story sentence text for lookup
("Ann gave Ned three cakes of paint." "She told him to paint just what you see here." "She gave him red and yellow." "Here is a new color: It is purple." "Red and blue make purple.")
; events
(
(0 Measure_volume (4 4)
	(
		(Unit (4 4) ())
		(Stuff (2 2) ())
		(Stuff (6 6) (2))
		(Count (3 3) ())
	)
)
(1 Giving (1 1)
	(
		(Donor (0 0) ())
		(Recipient (2 2) ())
		(Theme (4 4) (0))
	)
)
(2 Substance (6 6)
	(
		(Substance (6 6) ())
	)
)
(3 Perception_experience (16 16)
	(
		(Perceiver_passive (15 15) ())
		(Phenomenon (6 6) (2))
		(State (17 17) ())
	)
)
(4 Request (9 9)
	(
		(Speaker (0 0) ())
		(Addressee (2 2) ())
		(Message (14 14) ())
	)
)
(5 Breathing (12 12)
	(
		(Purpose (14 14) ())
		(Agent (2 2) ())
	)
)
(6 Giving (20 20)
	(
		(Donor (0 0) ())
		(Recipient (2 2) ())
		(Theme (22 22) (8))
	)
)
(7 Color (24 24)
	(
		(Entity (2 2) ())
		(Color (24 24) ())
	)
)
(8 Color (22 22)
	(
		(Entity (2 2) ())
		(Color (3 3) ())
	)
)
(9 Color (30 30)
	(
		(Entity (0 0) ())
		(Color (4 4) (0))
		(Descriptor (3 3) ())
	)
)
(10 Age (29 29)
	(
		(Entity (4 4) (0))
	)
)
(11 Color (36 36)
	(
		(Color (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Today I went swimming." "I love to swim." "The water was very cold." "The water made my teeth chatter." "The water was so cold, I had to get out.")
; events
(
(0 Calendric_unit (0 0)
	(
		(Unit (0 0) ())
	)
)
(1 Motion (2 2)
	(
		(Time (0 0) (0))
		(Theme (1 1) ())
		(Goal (3 3) (2))
	)
)
(2 Self_motion (3 3)
	(
		(Time (0 0) (0))
		(Self_mover (1 1) ())
	)
)
(3 Experiencer_focus (6 6)
	(
		(Content (7 8) (4))
		(Experiencer (0 0) (0))
	)
)
(4 Self_motion (8 8)
	(
		(Self_mover (0 0) (0))
	)
)
(5 Temperature (14 14)
	(
		(Degree (3 3) (2))
		(Entity (11 11) ())
	)
)
(6 Body_parts (20 20)
	(
		(Body_part (20 20) ())
		(Possessor (3 3) (2))
	)
)
(7 Causation (18 18)
	(
		(Effect (19 21) (6 8))
		(Cause (11 11) ())
	)
)
(8 Friction (21 21)
	(
		(Themes (19 20) (6))
	)
)
(9 Ambient_temperature (27 27)
	(
		(Degree (3 3) (2))
		(Circumstances (11 11) ())
	)
)
(10 Required_event (30 33)
	(
		(Required_situation (29 29) ())
		(Required_situation (32 33) ())
	)
)
)
)
(
; story sentence text for lookup
("The baby started to cry." "The mother walked over to the baby." "She saw that the baby was hungry." "She breastfed the baby." "The baby went back to sleep.")
; events
(
(0 Activity_start (2 2)
	(
		(Activity (3 4) (2))
		(Agent (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Make_noise (4 4)
	(
		(Sound_source (1 1) (1))
	)
)
(3 Self_motion (8 8)
	(
		(Goal (12 12) (5))
		(Self_mover (1 1) (1))
	)
)
(4 Kinship (7 7)
	(
		(Alter (1 1) (1))
	)
)
(5 People_by_age (12 12)
	(
		(Person (12 12) ())
	)
)
(6 Perception_experience (15 15)
	(
		(Perceiver_passive (14 14) ())
		(Phenomenon (18 18) (7))
	)
)
(7 People_by_age (18 18)
	(
		(Person (18 18) ())
	)
)
(8 Biological_urge (20 20)
	(
		(Experiencer (3 4) (2))
	)
)
(9 Manipulation (23 23)
	(
		(Agent (14 14) ())
		(Entity (25 25) (10))
	)
)
(10 People_by_age (25 25)
	(
		(Person (25 25) ())
	)
)
(11 People_by_age (28 28)
	(
		(Person (1 1) (1))
	)
)
(12 Sleep (32 32)
	(
		(Sleeper (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("When Gracia goes to church she carries a black parasol." "It is small and is made of silk." "Pepita carries an umbrella." "This is a picture of it." "It comes from Japan." "It is made of paper but it is a good umbrella." "Do you like a black parasol better than a Japanese umbrella?" "Petita likes the Japanese umbrella because it is so gay and pretty.")
; events
(
(0 Buildings (4 4)
	(
		(Building (4 4) ())
	)
)
(1 Motion (2 2)
	(
		(Theme (1 1) ())
		(Goal (4 4) (0))
	)
)
(2 Bringing (6 6)
	(
		(Time (1 1) ())
		(Agent (5 5) ())
		(Theme (9 9) ())
	)
)
(3 Color (8 8)
	(
		(Color (8 8) ())
		(Entity (9 9) ())
	)
)
(4 Temporal_collocation (0 0)
	(
		(Trajector_event (5 5) ())
		(Landmark_event (1 1) ())
	)
)
(5 Size (13 13)
	(
		(Entity (11 11) ())
	)
)
(6 Process_start (16 16)
	(
		(Event (11 11) ())
		(Place (18 18) ())
	)
)
(7 Bringing (21 21)
	(
		(Theme (23 23) (8))
		(Agent (11 11) ())
	)
)
(8 Accoutrements (23 23)
	(
		(Accoutrement (23 23) ())
	)
)
(9 Physical_artworks (28 28)
	(
		(Represented (30 30) ())
		(Artifact (23 23) (8))
	)
)
(10 Arriving (33 33)
	(
		(Source (23 23) (8))
		(Theme (11 11) ())
	)
)
(11 Process_start (39 39)
	(
		(Event (11 11) ())
		(Place (4 4) (0))
	)
)
(12 Accoutrements (47 47)
	(
		(Accoutrement (47 47) ())
		(Descriptor (9 9) ())
	)
)
(13 Desirability (46 46)
	(
		(Evaluee (47 47) (12))
	)
)
(14 Experiencer_focus (51 51)
	(
		(Degree (59 59) (17))
		(Experiencer (1 1) ())
		(Content (54 54) (16))
	)
)
(15 Origin (58 58)
	(
		(Origin (9 9) ())
		(Entity (47 47) (12))
	)
)
(16 Accoutrements (54 54)
	(
		(Accoutrement (5 5) ())
		(Descriptor (4 4) (0))
	)
)
(17 Accoutrements (59 59)
	(
		(Descriptor (9 9) ())
		(Accoutrement (47 47) (12))
	)
)
(18 Color (53 53)
	(
		(Entity (5 5) ())
		(Color (4 4) (0))
	)
)
(19 Degree (69 69)
	(
		(Gradable_attribute (67 67) ())
		(Gradable_attribute (9 9) ())
	)
)
(20 Origin (64 64)
	(
		(Entity (4 4) (0))
		(Origin (23 23) (8))
	)
)
(21 Causation (66 66)
	(
		(Effect (1 1) ())
		(Cause (67 67) ())
	)
)
(22 Accoutrements (65 65)
	(
		(Accoutrement (4 4) (0))
		(Descriptor (23 23) (8))
	)
)
(23 Manner (70 70)
	(
		(Salient_entity (67 67) ())
		(Manner (8 8) (3))
	)
)
(24 Experiencer_focus (62 62)
	(
		(Content (65 65) (22))
		(Explanation (67 67) ())
		(Experiencer (11 11) ())
	)
)
(25 Aesthetics (72 72)
	(
		(Entity (67 67) ())
		(Degree (8 8) (3))
	)
)
)
)
(
; story sentence text for lookup
("A sail-boat is on the pond." "The man holds the sail." "The wind blows on the sail, and the boat moves fast." "There is a row-boat too." "I like a row-boat." "It is fun to row.")
; events
(
(0 Vehicle (1 3)
	(
		(Vehicle (3 3) ())
	)
)
(1 Spatial_contact (5 5)
	(
		(Ground (7 7) (2))
		(Figure (3 3) ())
	)
)
(2 Natural_features (7 7)
	(
		(Locale (7 7) ())
	)
)
(3 People (10 10)
	(
		(Person (10 10) ())
	)
)
(4 Motion (17 17)
	(
		(Area (20 20) ())
		(Theme (16 16) ())
	)
)
(5 Vehicle (24 24)
	(
		(Vehicle (24 24) ())
	)
)
(6 Speed_description (26 26)
	(
		(Entity (24 24) (5))
	)
)
(7 Motion (25 25)
	(
		(Speed (26 26) (6))
		(Theme (24 24) (5))
	)
)
(8 Vehicle (31 33)
	(
		(Vehicle (20 20) ())
	)
)
(9 Existence (28 29)
	(
		(Entity (30 33) (8))
	)
)
(10 Experiencer_focus (37 37)
	(
		(Experiencer (36 36) ())
		(Content (30 33) (8))
	)
)
(11 Vehicle (39 41)
	(
		(Vehicle (20 20) ())
	)
)
(12 Operate_vehicle (47 47)
	(
		(Vehicle (47 47) ())
	)
)
(13 Stimulus_focus (45 45)
	(
		(Stimulus (46 47) (12))
	)
)
)
)
(
; story sentence text for lookup
("My brother was wearing a hat." "He took it off his head." "He threw it on the floor." "I picked the hat up." "I put it on our hat rack.")
; events
(
(0 Kinship (1 1)
	(
		(Ego (0 0) ())
		(Alter (1 1) ())
	)
)
(1 Accoutrements (5 5)
	(
		(Accoutrement (5 5) ())
	)
)
(2 Wearing (3 3)
	(
		(Clothing (5 5) (1))
		(Wearer (1 1) (0))
	)
)
(3 Body_parts (12 12)
	(
		(Body_part (5 5) (1))
		(Possessor (11 11) ())
	)
)
(4 Undressing (8 10)
	(
		(Body_location (5 5) (1))
		(Wearer (0 0) ())
		(Clothing (9 9) ())
	)
)
(5 Cause_motion (15 15)
	(
		(Agent (0 0) ())
		(Goal (19 19) (6))
		(Theme (9 9) ())
	)
)
(6 Architectural_part (19 19)
	(
		(Part (5 5) (1))
	)
)
(7 Food_gathering (22 22)
	(
		(Crop (24 24) (8))
		(Gatherer (0 0) ())
		(Particular_iteration (11 11) ())
	)
)
(8 Accoutrements (24 24)
	(
		(Accoutrement (24 24) ())
	)
)
(9 Placing (28 28)
	(
		(Agent (0 0) ())
		(Theme (9 9) ())
		(Goal (33 33) (10))
	)
)
(10 Containers (33 33)
	(
		(Use (5 5) (1))
		(Container (33 33) ())
		(Owner (11 11) ())
	)
)
)
)
(
; story sentence text for lookup
("Jane and John walked up a hill." "They wanted to see the view." "John fell down." "He hit his head really hard." "Jane carried him back down.")
; events
(
(0 Natural_features (6 6)
	(
		(Locale (6 6) ())
	)
)
(1 Self_motion (3 3)
	(
		(Self_mover (0 0) ())
		(Path (6 6) (0))
	)
)
(2 Desiring (9 9)
	(
		(Experiencer (8 8) ())
		(Event (13 13) ())
	)
)
(3 Perception_experience (11 11)
	(
		(Phenomenon (13 13) ())
		(Perceiver_passive (8 8) ())
	)
)
(4 Motion_directional (16 16)
	(
		(Theme (8 8) ())
		(Path (17 17) ())
		(Direction (16 16) ())
	)
)
(5 Experience_bodily_harm (20 20)
	(
		(Body_part (22 22) (6))
		(Experiencer (8 8) ())
		(Severity (13 13) ())
	)
)
(6 Body_parts (22 22)
	(
		(Possessor (17 17) ())
		(Body_part (22 22) ())
	)
)
(7 Bringing (27 27)
	(
		(Agent (8 8) ())
		(Theme (17 17) ())
		(Goal (29 31) ())
	)
)
)
)
(
; story sentence text for lookup
("The doll caught on fire." "The girl thought it was funny." "She watched it burn." "It caught the house on fire." "The whole house burned down.")
; events
(
(0 Setting_fire (4 4)
	(
		(Flammables (0 1) ())
	)
)
(1 Opinion (8 8)
	(
		(Opinion (9 9) ())
		(Cognizer (0 1) ())
	)
)
(2 People (7 7)
	(
		(Person (7 7) ())
	)
)
(3 Stimulus_focus (11 11)
	(
		(Stimulus (9 9) ())
	)
)
(4 Perception_active (14 14)
	(
		(Phenomenon (15 15) ())
		(Perceiver_agentive (13 13) ())
	)
)
(5 Fire_burning (16 16)
	(
		(Fire (15 15) ())
	)
)
(6 Fire_burning (23 23)
	(
		(Fire (23 23) ())
	)
)
(7 Buildings (21 21)
	(
		(Building (9 9) ())
	)
)
(8 Buildings (27 27)
	(
		(Building (15 15) ())
	)
)
(9 Ranked_expectation (26 26)
	(
		(Entity (15 15) ())
	)
)
(10 Destroying (28 29)
	(
		(Patient (27 27) (8))
	)
)
)
)
(
; story sentence text for lookup
("The cocoanut tree is tall." "It is very pretty." "Many cocoanuts grow on the tree." "Simeon can climb the tree." "He gets the cocoanuts for his mother." "His mother likes cocoanuts." "Luisa likes cocoanuts, too." "She cannot climb the tree." "She is too little to climb a tall tree." "She likes to play with Simeon.")
; events
(
(0 Measurable_attributes (4 4)
	(
		(Attribute (4 4) ())
		(Entity (2 2) ())
	)
)
(1 Aesthetics (9 9)
	(
		(Entity (6 6) ())
		(Degree (8 8) ())
	)
)
(2 Spatial_contact (14 14)
	(
		(Figure (12 12) ())
		(Ground (16 16) (5))
	)
)
(3 Quantified_mass (11 11)
	(
		(Quantity (6 6) ())
		(Mass (12 12) ())
	)
)
(4 Ontogeny (13 13)
	(
		(Entity (12 12) ())
		(Place (16 16) (5))
	)
)
(5 Natural_features (16 16)
	(
		(Locale (16 16) ())
	)
)
(6 Self_motion (20 20)
	(
		(Self_mover (6 6) ())
		(Path (22 22) (8))
	)
)
(7 Capability (19 19)
	(
		(Entity (6 6) ())
		(Event (22 22) (8))
	)
)
(8 Biological_area (22 22)
	(
		(Locale (4 4) (0))
	)
)
(9 Kinship (30 30)
	(
		(Alter (30 30) ())
		(Ego (16 16) (5))
	)
)
(10 Getting (25 25)
	(
		(Recipient (6 6) ())
		(Purpose (30 30) (9))
		(Theme (27 27) (11))
	)
)
(11 Food (27 27)
	(
	)
)
(12 Experiencer_focus (34 34)
	(
		(Content (35 35) (14))
		(Experiencer (12 12) ())
	)
)
(13 Kinship (33 33)
	(
		(Ego (6 6) ())
		(Alter (12 12) ())
	)
)
(14 Food (35 35)
	(
	)
)
(15 Experiencer_focus (38 38)
	(
		(Content (8 8) ())
		(Experiencer (6 6) ())
	)
)
(16 Food (39 39)
	(
	)
)
(17 Capability (44 44)
	(
		(Entity (6 6) ())
		(Event (16 16) (5))
	)
)
(18 Self_motion (46 46)
	(
		(Path (16 16) (5))
		(Self_mover (6 6) ())
	)
)
(19 Self_motion (55 55)
	(
		(Self_mover (6 6) ())
		(Path (58 58) ())
	)
)
(20 Size (53 53)
	(
		(Entity (6 6) ())
		(Degree (8 8) ())
		(Degree (58 58) ())
	)
)
(21 Sufficiency (52 52)
	(
		(Item (6 6) ())
		(Enabled_situation (58 58) ())
		(Scale (35 35) (14))
	)
)
(22 Capability (54 54)
	(
		(Degree (27 27) (11))
		(Entity (6 6) ())
		(Event (58 58) ())
	)
)
(23 Measurable_attributes (57 57)
	(
		(Entity (58 58) ())
		(Attribute (57 57) ())
	)
)
(24 Experiencer_focus (61 61)
	(
		(Experiencer (6 6) ())
		(Content (65 65) ())
	)
)
(25 Competition (63 63)
	(
		(Participant_1 (6 6) ())
		(Participant_2 (16 16) (5))
	)
)
)
)
(
; story sentence text for lookup
("I got a new kitten." "The kitten was bad." "It ate my shoes." "I then trained it to be good." "It was a good kitten from then on.")
; events
(
(0 Have_associated (1 1)
	(
		(Topical_entity (0 0) ())
		(Entity (4 4) ())
	)
)
(1 Age (3 3)
	(
		(Entity (4 4) ())
	)
)
(2 Desirability (9 9)
	(
		(Evaluee (7 7) ())
	)
)
(3 Ingestion (12 12)
	(
		(Ingestor (0 0) ())
		(Ingestibles (14 14) (4))
	)
)
(4 Clothing (14 14)
	(
		(Garment (14 14) ())
		(Wearer (13 13) ())
	)
)
(5 Education_teaching (18 18)
	(
		(Teacher (0 0) ())
		(Time (17 17) ())
		(Student (14 14) (4))
		(Skill (20 22) (6))
	)
)
(6 Desirability (22 22)
	(
		(Evaluee (14 14) (4))
	)
)
(7 Desirability (27 27)
	(
		(Evaluee (4 4) ())
	)
)
)
)
(
; story sentence text for lookup
("Frank has gone to the field with his kite." "He likes to play with it." "It is the kite his father gave him." "He will run and the kite will fly." "He can run very fast, and the kite can fly very high." "John does not like to run with a kite." "He likes to play on his drum." "He will play on his drum, and Frank will run with his kite.")
; events
(
(0 Dead_or_alive (8 8)
	(
		(Protagonist (8 8) ())
		(Protagonist (7 7) ())
	)
)
(1 Motion (2 2)
	(
		(Theme (0 0) ())
		(Depictive (8 8) (0))
		(Goal (5 5) (2))
	)
)
(2 Locale_by_use (5 5)
	(
		(Locale (5 5) ())
	)
)
(3 Experiencer_focus (11 11)
	(
		(Experiencer (0 0) ())
		(Content (15 15) ())
	)
)
(4 Perception_experience (13 13)
	(
		(Perceiver_passive (0 0) ())
		(Body_part (15 15) ())
	)
)
(5 Kinship (22 22)
	(
		(Alter (5 5) (2))
		(Ego (21 21) ())
	)
)
(6 Giving (23 23)
	(
		(Theme (19 20) ())
		(Recipient (7 7) ())
		(Donor (15 15) ())
	)
)
(7 Self_motion (28 28)
	(
		(Self_mover (0 0) ())
	)
)
(8 Self_motion (33 33)
	(
		(Self_mover (15 15) ())
	)
)
(9 Self_motion (37 37)
	(
		(Self_mover (0 0) ())
		(Manner (38 39) (14))
	)
)
(10 Measurable_attributes (47 47)
	(
		(Degree (46 46) ())
		(Entity (43 43) ())
	)
)
(11 Capability (44 44)
	(
		(Event (45 47) (10 12))
		(Entity (43 43) ())
	)
)
(12 Self_motion (45 45)
	(
		(Depictive (46 47) (10))
		(Self_mover (43 43) ())
	)
)
(13 Capability (36 36)
	(
		(Entity (0 0) ())
		(Event (37 39) (9 14))
	)
)
(14 Speed_description (39 39)
	(
		(Entity (0 0) ())
		(Degree (38 38) ())
	)
)
(15 Self_motion (54 54)
	(
		(Self_mover (0 0) ())
		(Depictive (8 8) (0))
	)
)
(16 Experiencer_focus (52 52)
	(
		(Experiencer (0 0) ())
		(Content (57 57) ())
	)
)
(17 Experiencer_focus (60 60)
	(
		(Experiencer (0 0) ())
		(Content (65 65) ())
	)
)
(18 Cause_to_make_noise (62 62)
	(
		(Agent (0 0) ())
		(Explanation (65 65) ())
	)
)
(19 Self_motion (77 77)
	(
		(Depictive (80 80) ())
		(Self_mover (8 8) (0))
	)
)
(20 Cause_to_make_noise (69 69)
	(
		(Agent (0 0) ())
		(Sound_maker (5 5) (2))
	)
)
)
)
(
; story sentence text for lookup
("I see May and her dolls." "May is in her little chair." "She has a doll in her lap." "One doll is sitting on a bed." "The doll on the bed is wax." "The doll in her lap is not wax." "May's dolls have blue eyes." "Has May blue eyes?")
; events
(
(0 Perception_experience (1 1)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (2 2) ())
		(Phenomenon (3 5) ())
	)
)
(1 Interior_profile_relation (9 9)
	(
		(Figure (0 0) ())
		(Ground (3 5) ())
	)
)
(2 Beyond_compare (15 15)
	(
		(Standard (0 0) ())
		(Domain (20 20) (3))
		(Standard (17 17) ())
	)
)
(3 Body_parts (20 20)
	(
		(Body_part (20 20) ())
		(Possessor (19 19) ())
	)
)
(4 Posture (25 25)
	(
		(Agent (23 23) ())
		(Point_of_contact (25 25) ())
		(Location (20 20) (3))
	)
)
(5 Isolated_places (34 34)
	(
		(Place (34 34) ())
	)
)
(6 Body_parts (42 42)
	(
		(Body_part (34 34) (5))
		(Possessor (25 25) (4))
	)
)
(7 Body_parts (52 52)
	(
		(Body_part (19 19) ())
		(Descriptor (34 34) (5))
		(Possessor (49 49) ())
	)
)
(8 Color (51 51)
	(
		(Entity (19 19) ())
	)
)
(9 Color (56 56)
	(
		(Entity (25 25) (4))
	)
)
(10 Body_parts (57 57)
	(
		(Descriptor (55 55) ())
		(Body_part (25 25) (4))
	)
)
)
)
(
; story sentence text for lookup
("Leo is walking home." "He sees a dog stuck in a tree." "He frees the dog from the tree." "The dog runs off." "Leo saved the dog's life.")
; events
(
(0 Self_motion (2 2)
	(
		(Self_mover (0 0) ())
		(Goal (3 3) ())
	)
)
(1 Perception_experience (6 6)
	(
		(Perceiver_passive (0 0) ())
		(Depictive (12 12) ())
		(Phenomenon (8 8) ())
	)
)
(2 Removing (15 15)
	(
		(Agent (0 0) ())
		(Theme (8 8) ())
		(Source (20 20) ())
	)
)
(3 Animals (17 17)
	(
		(Animal (3 3) ())
	)
)
(4 Self_motion (24 24)
	(
		(Source (3 3) ())
		(Self_mover (23 23) ())
	)
)
(5 Rescuing (28 28)
	(
		(Agent (0 0) ())
		(Asset (32 32) ())
	)
)
(6 Animals (30 30)
	(
		(Animal (3 3) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom got home from work." "The cats seemed quite hungry." "He decided to feed them." "His wife told Tom she had just fed them." "Tom took the food back.")
; events
(
(0 Arriving (1 1)
	(
		(Theme (0 0) ())
		(Goal (2 2) ())
		(Source (4 4) (1))
	)
)
(1 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
	)
)
(2 Biological_urge (10 10)
	(
		(Experiencer (7 7) ())
		(Degree (9 9) ())
	)
)
(3 Give_impression (8 8)
	(
		(Phenomenon (7 7) ())
		(Inference (4 4) (1))
	)
)
(4 Deciding (13 13)
	(
		(Cognizer (0 0) ())
		(Decision (16 16) ())
	)
)
(5 Telling (20 20)
	(
		(Message (21 21) ())
		(Speaker (7 7) ())
	)
)
(6 Personal_relationship (19 19)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (19 19) ())
	)
)
(7 Bringing (29 29)
	(
		(Theme (31 31) (8))
		(Agent (0 0) ())
		(Purpose (4 4) (1))
	)
)
(8 Food (31 31)
	(
	)
)
)
)
(
; story sentence text for lookup
("I have a pet hen." "She has a nest in a box." "Two eggs are in the nest." "One day when she went away to get her dinner, a big rat came to get an egg; but he did not get the egg." "My hen saw him and did not let him get the egg." "A rat will eat an egg if he can get it.")
; events
(
(0 Have_associated (1 1)
	(
		(Topical_entity (0 0) ())
		(Entity (4 4) ())
	)
)
(1 Possession (7 7)
	(
		(Owner (0 0) ())
		(Possession (9 9) ())
	)
)
(2 Cardinal_numbers (14 14)
	(
		(Entity (15 15) ())
		(Number (0 0) ())
	)
)
(3 Interior_profile_relation (17 17)
	(
		(Ground (19 19) ())
		(Figure (15 15) ())
	)
)
(4 Arriving (35 35)
	(
		(Theme (34 34) ())
		(Goal (39 39) (7))
	)
)
(5 Temporal_collocation (23 23)
	(
		(Landmark_event (24 24) ())
		(Trajector_event (34 34) ())
		(Landmark_period (15 15) ())
	)
)
(6 Size (33 33)
	(
		(Entity (34 34) ())
	)
)
(7 Food (39 39)
	(
	)
)
(8 Getting (37 37)
	(
		(Theme (39 39) (7))
		(Recipient (34 34) ())
	)
)
(9 Food (47 47)
	(
	)
)
(10 Calendric_unit (22 22)
	(
		(Count (0 0) ())
		(Unit (15 15) ())
	)
)
(11 Motion (25 25)
	(
		(Source (26 26) ())
		(Theme (24 24) ())
		(Purpose (30 30) ())
	)
)
(12 Getting (45 45)
	(
		(Recipient (42 42) ())
		(Theme (47 47) (9))
	)
)
(13 Bringing (28 28)
	(
		(Agent (34 34) ())
		(Theme (30 30) ())
		(Agent (24 24) ())
	)
)
(14 Perception_experience (51 51)
	(
		(Phenomenon (24 24) ())
		(Perceiver_passive (15 15) ())
	)
)
(15 Preventing_or_letting (56 56)
	(
		(Event (57 57) ())
		(Event (60 60) ())
		(Potential_hindrance (15 15) ())
	)
)
(16 Commerce_buy (58 58)
	(
		(Buyer (57 57) ())
		(Goods (60 60) ())
	)
)
(17 Food (67 67)
	(
	)
)
(18 Ingestion (65 65)
	(
		(Ingestibles (19 19) ())
		(Ingestor (15 15) ())
	)
)
(19 Getting (71 71)
	(
		(Theme (72 72) ())
		(Recipient (69 69) ())
	)
)
)
)
(
; story sentence text for lookup
("All the boys and girls are going to school this morning." "You can see them as they go." "Little Lucy is not with them." "She has gone to her home, far away." "But I see May and some other girls." "John has his new book." "Some of the other boys have books, too." "I do not see Frank, but I think he will come soon.")
; events
(
(0 People_by_age (2 2)
	(
		(Person (2 2) ())
	)
)
(1 Motion (6 6)
	(
		(Goal (8 8) (3))
		(Time (9 10) (2))
		(Theme (2 2) (0))
	)
)
(2 Calendric_unit (10 10)
	(
		(Unit (10 10) ())
		(Relative_time (9 9) ())
	)
)
(3 Locale_by_use (8 8)
	(
		(Locale (8 8) ())
	)
)
(4 Quantified_mass (0 0)
	(
		(Quantity (0 0) ())
		(Individuals (2 2) (0))
	)
)
(5 People (4 4)
	(
		(Person (4 4) ())
	)
)
(6 Perception_experience (14 14)
	(
		(Perceiver_passive (0 0) (4))
		(Time (17 17) ())
		(Phenomenon (15 15) ())
	)
)
(7 Possibility (13 13)
	(
		(Possible_event (0 0) (4))
		(Possible_event (15 15) ())
	)
)
(8 Size (20 20)
	(
		(Entity (21 21) ())
	)
)
(9 Motion (29 29)
	(
		(Theme (0 0) (4))
		(Goal (32 32) (10))
	)
)
(10 Buildings (32 32)
	(
		(Building (32 32) ())
		(Place (34 36) ())
	)
)
(11 Perception_experience (39 39)
	(
		(Phenomenon (41 44) (12 13))
		(Perceiver_passive (21 21) ())
		(Phenomenon (15 15) ())
	)
)
(12 People (44 44)
	(
		(Person (44 44) ())
	)
)
(13 Increment (43 43)
	(
		(Class (44 44) (12))
	)
)
(14 Possession (47 47)
	(
		(Owner (0 0) (4))
		(Possession (50 50) (15))
	)
)
(15 Text (50 50)
	(
		(Author (2 2) (0))
		(Text (4 4) (5))
	)
)
(16 Age (49 49)
	(
		(Entity (4 4) (5))
	)
)
(17 Possession (57 57)
	(
		(Possession (58 58) (19))
		(Owner (2 2) (0))
	)
)
(18 People_by_age (56 56)
	(
		(Person (4 4) (5))
	)
)
(19 Text (58 58)
	(
		(Text (58 58) ())
		(Author (2 2) (0))
	)
)
(20 Increment (55 55)
	(
		(Class (4 4) (5))
	)
)
(21 Arriving (73 73)
	(
		(Theme (9 9) ())
		(Time (74 74) ())
	)
)
(22 Perception_experience (65 65)
	(
		(Perceiver_passive (0 0) (4))
		(Phenomenon (4 4) (5))
	)
)
(23 Awareness (70 70)
	(
		(Cognizer (44 44) (12))
		(Content (71 71) ())
	)
)
)
)
(
; story sentence text for lookup
("Allie wanted an iPad." "She really liked it." "But she wanted a new one." "So she went to the store." "When she got back she had a newer one.")
; events
(
(0 Desiring (1 1)
	(
		(Focal_participant (3 3) ())
		(Experiencer (0 0) ())
	)
)
(1 Experiencer_focus (7 7)
	(
		(Experiencer (0 0) ())
		(Degree (6 6) ())
		(Content (8 8) ())
	)
)
(2 Desiring (12 12)
	(
		(Experiencer (6 6) ())
		(Focal_participant (15 15) ())
	)
)
(3 Age (14 14)
	(
		(Entity (15 15) ())
		(Age (14 14) ())
	)
)
(4 Motion (19 19)
	(
		(Theme (6 6) ())
		(Goal (15 15) ())
	)
)
(5 Businesses (22 22)
	(
		(Business (15 15) ())
	)
)
(6 Arriving (26 26)
	(
		(Theme (6 6) ())
		(Goal (8 8) ())
	)
)
(7 Have_associated (29 29)
	(
		(Topical_entity (14 14) (3))
		(Entity (32 32) ())
	)
)
(8 Age (31 31)
	(
		(Degree (31 31) ())
		(Entity (32 32) ())
	)
)
)
)
(
; story sentence text for lookup
("The dog went outside in the yard." "There was something new in the yard." "The dog sniffed it." "The dog went inside it and slept." "The dog liked its new dog house.")
; events
(
(0 Motion (2 2)
	(
		(Place (6 6) (1))
		(Goal (3 3) ())
		(Theme (1 1) ())
	)
)
(1 Building_subparts (6 6)
	(
		(Building_part (6 6) ())
	)
)
(2 Interior_profile_relation (12 12)
	(
		(Figure (10 11) (4))
		(Ground (14 14) (3))
	)
)
(3 Locale_by_use (14 14)
	(
		(Locale (6 6) (1))
	)
)
(4 Age (11 11)
	(
		(Entity (10 10) ())
	)
)
(5 Perception_active (18 18)
	(
		(Phenomenon (3 3) ())
		(Perceiver_agentive (1 1) ())
	)
)
(6 Animals (17 17)
	(
		(Animal (17 17) ())
	)
)
(7 Motion (23 23)
	(
		(Goal (25 25) ())
		(Theme (1 1) ())
	)
)
(8 Sleep (27 27)
	(
		(Sleeper (1 1) ())
	)
)
(9 Interior_profile_relation (24 24)
	(
		(Ground (25 25) ())
		(Figure (1 1) ())
	)
)
(10 Experiencer_focus (31 31)
	(
		(Content (35 35) (12))
		(Experiencer (1 1) ())
	)
)
(11 Age (33 33)
	(
		(Entity (14 14) (3))
	)
)
(12 Buildings (35 35)
	(
		(Descriptor (3 3) ())
		(Building (6 6) (1))
	)
)
)
)
(
; story sentence text for lookup
("Tom had a cat." "He decided to get another one." "The two cats didn't get along." "Tom tried his best to get them to live together." "It never worked and he had to get rid of one.")
; events
(
(0 Animals (3 3)
	(
		(Descriptor (0 0) ())
		(Animal (3 3) ())
	)
)
(1 Deciding (6 6)
	(
		(Cognizer (0 0) ())
		(Decision (10 10) ())
	)
)
(2 Increment (9 9)
	(
		(Class (10 10) ())
	)
)
(3 Commerce_buy (8 8)
	(
		(Goods (10 10) ())
		(Buyer (0 0) ())
	)
)
(4 Familiarity (16 18)
	(
		(Entity (14 14) ())
	)
)
(5 Cardinal_numbers (13 13)
	(
		(Entity (14 14) ())
		(Number (13 13) ())
	)
)
(6 Attempt (21 21)
	(
		(Outcome (23 23) (9))
		(Agent (0 0) ())
		(Goal (26 26) ())
	)
)
(7 Getting (25 25)
	(
		(Theme (27 29) (8))
		(Recipient (0 0) ())
		(Theme (26 26) ())
	)
)
(8 Personal_relationship (28 29)
	(
		(Partners (26 26) ())
	)
)
(9 Desirability (23 23)
	(
		(Evaluee (14 14) ())
	)
)
(10 Usefulness (33 33)
	(
		(Entity (0 0) ())
	)
)
(11 Negation (32 32)
	(
		(Negated_proposition (0 0) ())
		(Negated_proposition (14 14) ())
	)
)
)
)
(
; story sentence text for lookup
("The man hung up the phone." "The woman wondered why." "The woman called him back." "The man didn't answer." "The woman thought she knew why.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Cogitation (9 9)
	(
		(Topic (10 10) ())
		(Cognizer (8 8) (2))
	)
)
(2 People (8 8)
	(
		(Person (1 1) (0))
	)
)
(3 Contacting (14 14)
	(
		(Addressee (16 16) ())
		(Addressee (10 10) ())
		(Communicator (8 8) (2))
	)
)
(4 People (13 13)
	(
		(Person (1 1) (0))
	)
)
(5 People (19 19)
	(
		(Person (1 1) (0))
	)
)
(6 Communication_response (22 22)
	(
		(Speaker (8 8) (2))
	)
)
(7 Opinion (26 26)
	(
		(Opinion (27 27) ())
		(Cognizer (8 8) (2))
	)
)
(8 People (25 25)
	(
		(Person (1 1) (0))
	)
)
(9 Awareness (28 28)
	(
		(Content (29 29) ())
		(Cognizer (10 10) ())
	)
)
)
)
(
; story sentence text for lookup
("The man put on his watch." "His watch was not running." "He took his watch off." "He shook the watch." "The watch started running again.")
; events
(
(0 Attaching (2 3)
	(
		(Item (5 5) (2))
		(Agent (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Accoutrements (5 5)
	(
		(Accoutrement (5 5) ())
		(Wearer (4 4) ())
	)
)
(3 Accoutrements (8 8)
	(
		(Wearer (7 7) ())
		(Accoutrement (1 1) (1))
	)
)
(4 Being_in_operation (11 11)
	(
		(Device (1 1) (1))
	)
)
(5 Undressing (14 17)
	(
		(Clothing (16 16) ())
		(Wearer (7 7) ())
	)
)
(6 Cause_motion (20 20)
	(
		(Agent (7 7) ())
		(Theme (16 16) ())
	)
)
(7 Accoutrements (22 22)
	(
		(Accoutrement (22 22) ())
	)
)
(8 Activity_start (26 26)
	(
		(Particular_iteration (4 4) ())
		(Activity (22 22) (7))
		(Agent (1 1) (1))
	)
)
(9 Accoutrements (25 25)
	(
		(Accoutrement (1 1) (1))
	)
)
(10 Make_noise (27 27)
	(
		(Sound_source (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("Tom used to have his own boat." "He had to sell it." "Now he just comes out on my boat." "We have such a great time together." "Now I have someone to help me clean my boat.")
; events
(
(0 Vehicle (6 6)
	(
		(Vehicle (6 6) ())
	)
)
(1 Possession (3 3)
	(
		(Owner (0 0) ())
		(Possession (6 6) (0))
	)
)
(2 Required_event (9 9)
	(
		(Required_situation (0 0) ())
		(Required_situation (12 12) ())
	)
)
(3 Commerce_sell (11 11)
	(
		(Seller (0 0) ())
		(Goods (12 12) ())
	)
)
(4 Vehicle (21 21)
	(
		(Vehicle (21 21) ())
		(Descriptor (6 6) (0))
	)
)
(5 Arriving (17 17)
	(
		(Theme (15 15) ())
		(Source (12 12) ())
		(Mode_of_transportation (21 21) (4))
	)
)
(6 Desirability (27 27)
	(
		(Evaluee (28 28) ())
	)
)
(7 Vehicle (40 40)
	(
		(Vehicle (40 40) ())
	)
)
(8 Possession (33 33)
	(
		(Owner (15 15) ())
		(Possession (34 34) ())
	)
)
(9 Assistance (36 36)
	(
		(Goal (40 40) (7))
		(Benefited_party (6 6) (0))
		(Helper (34 34) ())
	)
)
(10 Emptying (38 38)
	(
		(Agent (6 6) (0))
		(Source (40 40) (7))
	)
)
)
)
(
; story sentence text for lookup
("I went to buy some almonds yesterday." "I bought a large box." "I tried some." "They were so good." "I wanted to have some more.")
; events
(
(0 Commerce_buy (3 3)
	(
		(Time (6 6) (2))
		(Buyer (0 0) ())
		(Goods (5 5) (1))
	)
)
(1 Food (5 5)
	(
	)
)
(2 Calendric_unit (6 6)
	(
		(Unit (6 6) ())
	)
)
(3 Motion (1 1)
	(
		(Time (6 6) (2))
		(Theme (0 0) ())
		(Purpose (5 5) (1))
	)
)
(4 Proportional_quantity (4 4)
	(
		(Denoted_quantity (4 4) ())
		(Mass (5 5) (1))
	)
)
(5 Commerce_buy (9 9)
	(
		(Buyer (0 0) ())
		(Goods (12 12) (6))
	)
)
(6 Containers (12 12)
	(
		(Container (4 4) (4))
		(Descriptor (11 11) (7))
	)
)
(7 Size (11 11)
	(
		(Entity (4 4) (4))
	)
)
(8 Attempt_means (15 15)
	(
		(Agent (0 0) ())
		(Goal (16 16) ())
	)
)
(9 Desirability (21 21)
	(
		(Evaluee (0 0) ())
		(Degree (16 16) ())
	)
)
(10 Desiring (24 24)
	(
		(Experiencer (0 0) ())
		(Event (5 5) (1))
	)
)
(11 Increment (28 28)
	(
		(Increment (4 4) (4))
	)
)
(12 Possession (26 26)
	(
		(Possession (5 5) (1))
		(Owner (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The sun is hot and the carabao likes to stand in the water." "Simeon rode him here." "Soo Simeon will ride him home." "Where is Simeon?" "He likes to sit under a tree." "Simeon's father has five carabaos." "Three of them are old, and two of them are young.")
; events
(
(0 Posture (9 9)
	(
		(Agent (6 6) (3))
		(Location (12 12) (1))
	)
)
(1 Natural_features (12 12)
	(
		(Locale (12 12) ())
	)
)
(2 Temperature (3 3)
	(
		(Entity (1 1) (5))
	)
)
(3 Containers (6 6)
	(
		(Container (6 6) ())
	)
)
(4 Likelihood (7 7)
	(
		(Hypothetical_event (6 6) (3))
		(Hypothetical_event (12 12) (1))
	)
)
(5 Location_of_light (1 1)
	(
	)
)
(6 Bringing (15 15)
	(
		(Agent (14 14) ())
		(Theme (16 16) ())
		(Place (17 17) ())
	)
)
(7 Bringing (22 24)
	(
		(Goal (24 24) ())
		(Theme (23 23) ())
	)
)
(8 Spatial_co-location (26 26)
	(
		(Ground (14 14) ())
		(Figure (16 16) ())
	)
)
(9 Experiencer_focus (31 31)
	(
		(Experiencer (14 14) ())
		(Content (36 36) ())
	)
)
(10 Posture (33 33)
	(
		(Agent (14 14) ())
		(Point_of_contact (17 17) ())
		(Location (36 36) ())
	)
)
(11 Cardinal_numbers (42 42)
	(
		(Entity (24 24) ())
		(Number (23 23) ())
	)
)
(12 Containers (43 43)
	(
		(Container (24 24) ())
	)
)
(13 Possession (41 41)
	(
		(Owner (40 40) (14))
		(Possession (43 43) (12))
	)
)
(14 Kinship (40 40)
	(
		(Ego (1 1) (5))
		(Alter (16 16) ())
	)
)
(15 Age (56 56)
	(
		(Entity (52 52) ())
		(Age (56 56) ())
	)
)
(16 Age (49 49)
	(
		(Entity (40 40) (14))
	)
)
)
)
(
; story sentence text for lookup
("I ate a big muffin." "But it wouldn't go away!" "There always seemed to be more!" "So I ate more!" "Now I'm sick to my stomach.")
; events
(
(0 Ingestion (1 1)
	(
		(Ingestor (0 0) ())
		(Ingestibles (4 4) (2))
	)
)
(1 Size (3 3)
	(
		(Entity (4 4) (2))
	)
)
(2 Food (4 4)
	(
		(Descriptor (3 3) (1))
	)
)
(3 Increment (18 18)
	(
		(Added_set (18 18) ())
	)
)
(4 Give_impression (15 15)
	(
		(Inference (0 0) ())
		(Inference (16 19) (3 7))
	)
)
(5 Existence (13 13)
	(
	)
)
(6 Frequency (14 14)
	(
		(Event (0 0) ())
		(Event (15 18) (3 4 7))
	)
)
(7 Existence (17 17)
	(
		(Entity (18 18) (3))
	)
)
(8 Ingestion (22 22)
	(
		(Ingestor (21 21) ())
		(Ingestibles (3 3) (1))
	)
)
(9 Increment (23 23)
	(
		(Increment (3 3) (1))
	)
)
(10 Temporal_collocation (25 25)
	(
		(Trajector_event (26 26) ())
	)
)
(11 Biological_urge (28 28)
	(
		(Experiencer (21 21) ())
		(Expressor (29 31) (12))
	)
)
(12 Body_parts (31 31)
	(
		(Body_part (31 31) ())
		(Possessor (18 18) (3))
	)
)
)
)
(
; story sentence text for lookup
("See Baby try to catch the hoop!" "Baby can not catch it." "The hoop rolls away from Baby." "Look, Baby!" "See the hoop roll!" "Hear the bells, Baby!" "The bells say, Tinkle, tinkle, tinkle.")
; events
(
(0 Perception_experience (0 0)
	(
		(Phenomenon (1 1) ())
	)
)
(1 Attempt (2 2)
	(
		(Agent (1 1) ())
		(Goal (6 6) ())
	)
)
(2 Cause_motion (16 16)
	(
		(Source (19 19) ())
		(Source (17 17) ())
		(Theme (15 15) (3))
	)
)
(3 Connectors (15 15)
	(
		(Connector (1 1) ())
	)
)
(4 Perception_active (21 21)
	(
		(Perceiver_agentive (23 23) ())
	)
)
(5 Perception_experience (25 25)
	(
		(Phenomenon (28 28) (6))
	)
)
(6 Food (28 28)
	(
		(Type (23 23) ())
	)
)
(7 Noise_makers (32 32)
	(
		(Noise_maker (23 23) ())
	)
)
(8 Perception_experience (30 30)
	(
		(Perceiver_passive (34 34) ())
		(Phenomenon (32 32) (7))
	)
)
(9 Noise_makers (37 37)
	(
		(Noise_maker (1 1) ())
	)
)
(10 Sounds (42 42)
	(
	)
)
(11 Statement (38 38)
	(
		(Medium (15 15) (3))
		(Depictive (40 44) (10))
	)
)
)
)
(
; story sentence text for lookup
("Mary wanted to stop working." "She was tired of working." "She met a man with a lot of money." "She married him." "She never had to work again.")
; events
(
(0 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (2 4) (1 2))
	)
)
(1 Being_employed (4 4)
	(
		(Employee (0 0) ())
	)
)
(2 Activity_stop (3 3)
	(
		(Agent (0 0) ())
		(Activity (4 4) (1))
	)
)
(3 Biological_urge (8 8)
	(
		(Experiencer (0 0) ())
		(Explanation (9 10) (4))
	)
)
(4 Work (10 10)
	(
		(Agent (0 0) ())
	)
)
(5 Money (20 20)
	(
		(Money (20 20) ())
	)
)
(6 Quantified_mass (17 18)
	(
		(Quantity (18 18) ())
		(Mass (20 20) (5))
	)
)
(7 Make_acquaintance (13 13)
	(
		(Individual_1 (0 0) ())
		(Individual_2 (15 15) (8))
	)
)
(8 People (15 15)
	(
		(Descriptor (18 18) ())
		(Person (15 15) ())
	)
)
(9 Forming_relationships (23 23)
	(
		(Partner_1 (0 0) ())
		(Partner_2 (24 24) ())
	)
)
(10 Work (30 30)
	(
		(Agent (0 0) ())
		(Particular_iteration (31 31) ())
	)
)
)
)
(
; story sentence text for lookup
("Susie say a girl was playing ball." "She wanted to play with her too." "So she went ahead and asked for permission." "The girl said no." "Susie then started to cry.")
; events
(
(0 Statement (1 1)
	(
		(Message (3 3) (1))
		(Speaker (0 0) ())
	)
)
(1 People (3 3)
	(
		(Person (3 3) ())
	)
)
(2 Competition (5 5)
	(
		(Participants (3 3) (1))
		(Competition (6 6) (3))
	)
)
(3 Social_event (6 6)
	(
		(Attendee (3 3) (1))
		(Name (6 6) ())
	)
)
(4 Desiring (9 9)
	(
		(Experiencer (0 0) ())
		(Event (13 13) ())
	)
)
(5 Competition (11 11)
	(
		(Participant_2 (13 13) ())
		(Participant_1 (0 0) ())
	)
)
(6 Motion (18 18)
	(
		(Theme (17 17) ())
		(Goal (3 3) (1))
	)
)
(7 Request (21 21)
	(
		(Speaker (17 17) ())
		(Message (23 23) (8))
	)
)
(8 Deny_or_grant_permission (23 23)
	(
		(Authority (17 17) ())
	)
)
(9 Text_creation (27 27)
	(
		(Text (3 3) (1))
		(Author (26 26) (10))
	)
)
(10 People (26 26)
	(
		(Person (17 17) ())
	)
)
(11 Communication_noise (34 34)
	(
		(Speaker (0 0) ())
	)
)
(12 Activity_start (32 32)
	(
		(Activity (33 34) (11))
		(Time (17 17) ())
		(Agent (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Allie loved her device." "She used it all the time." "Then she found out she had ten percent left." "It was not good." "She was near done.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Content (3 3) (1))
		(Experiencer (0 0) ())
	)
)
(1 Gizmo (3 3)
	(
		(Gizmo (3 3) ())
		(User (2 2) ())
	)
)
(2 Using (6 6)
	(
		(Agent (0 0) ())
		(Instrument (2 2) ())
		(Time (8 10) ())
	)
)
(3 Becoming_aware (14 15)
	(
		(Phenomenon (16 16) ())
		(Cognizer (13 13) ())
	)
)
(4 Possession (17 17)
	(
		(Possession (19 19) ())
		(Owner (16 16) ())
	)
)
(5 Desirability (25 25)
	(
		(Evaluee (0 0) ())
	)
)
(6 Success_or_failure (30 30)
	(
		(Agent (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("I live on a bay." "One day I went swimming." "I saw a dark shadow in the water." "It was a few feet long." "I hope it was not an alligator.")
; events
(
(0 Residence (1 1)
	(
		(Resident (0 0) ())
		(Location (4 4) (1))
	)
)
(1 Natural_features (4 4)
	(
		(Locale (4 4) ())
	)
)
(2 Calendric_unit (7 7)
	(
		(Count (0 0) ())
		(Unit (7 7) ())
	)
)
(3 Self_motion (10 10)
	(
		(Self_mover (8 8) ())
		(Time (6 7) (2))
	)
)
(4 Existence (9 9)
	(
		(Entity (8 8) ())
		(Depictive (4 4) (1))
		(Time (6 7) (2))
	)
)
(5 Perception_experience (13 13)
	(
		(Perceiver_passive (0 0) ())
		(Ground (19 19) (6))
		(Phenomenon (4 4) (1))
	)
)
(6 Natural_features (19 19)
	(
		(Locale (19 19) ())
	)
)
(7 Color_qualities (15 15)
	(
		(Described_entity (4 4) (1))
	)
)
(8 Dimension (26 26)
	(
		(Object (0 0) ())
		(Dimension (26 26) ())
		(Measurement (4 4) (1))
	)
)
(9 Measure_linear_extent (25 25)
	(
		(Count (23 24) (10))
		(Stuff (0 0) ())
		(Unit (4 4) (1))
	)
)
(10 Quantified_mass (24 24)
	(
		(Quantity (26 26) (8))
		(Individuals (4 4) (1))
		(Quantity (24 24) ())
	)
)
(11 Desiring (29 29)
	(
		(Experiencer (0 0) ())
		(Event (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("I can get into bed, and then you can not get me." "I am not in bed." "I have my dress on yet." "This is my red dress." "I am Nell." "I see you, Nell." "I can not get you." "You can get into bed." "Nell, you have a pretty dress." "I have a black dress." "My black dress is not pretty." "I shall get me a red dress." "Then I shall have a pretty dress.")
; events
(
(0 Arriving (2 2)
	(
		(Theme (0 0) ())
		(Goal (4 4) ())
	)
)
(1 Wearing (21 24)
	(
		(Clothing (23 23) ())
		(Wearer (0 0) ())
	)
)
(2 Clothing (31 31)
	(
		(Wearer (29 29) ())
		(Garment (31 31) ())
		(Descriptor (30 30) (3))
	)
)
(3 Color (30 30)
	(
		(Entity (31 31) (2))
		(Color (30 30) ())
	)
)
(4 Surrendering_possession (46 46)
	(
		(Recipient (0 0) ())
		(Theme (31 31) (2))
	)
)
(5 Possibility (50 50)
	(
		(Possible_event (0 0) ())
		(Possible_event (53 53) ())
	)
)
(6 Possession (58 58)
	(
		(Possession (61 61) (8))
		(Owner (29 29) ())
	)
)
(7 Aesthetics (60 60)
	(
		(Entity (61 61) (8))
	)
)
(8 Clothing (61 61)
	(
		(Garment (61 61) ())
		(Descriptor (60 60) (7))
	)
)
(9 Possession (64 64)
	(
		(Owner (0 0) ())
		(Possession (53 53) ())
	)
)
(10 Clothing (67 67)
	(
		(Garment (31 31) (2))
		(Descriptor (30 30) (3))
	)
)
(11 Color (66 66)
	(
		(Entity (31 31) (2))
		(Color (30 30) (3))
	)
)
(12 Clothing (71 71)
	(
		(Wearer (0 0) ())
		(Garment (29 29) ())
		(Descriptor (70 70) (13))
	)
)
(13 Color (70 70)
	(
		(Entity (29 29) ())
		(Color (70 70) ())
	)
)
(14 Aesthetics (74 74)
	(
		(Entity (71 71) (12))
	)
)
(15 Commerce_buy (78 78)
	(
		(Buyer (0 0) ())
		(Goods (61 61) (8))
		(Recipient (30 30) (3))
	)
)
(16 Color (81 81)
	(
		(Color (60 60) (7))
		(Entity (61 61) (8))
	)
)
(17 Clothing (82 82)
	(
		(Descriptor (60 60) (7))
		(Garment (61 61) (8))
	)
)
(18 Aesthetics (89 89)
	(
		(Entity (61 61) (8))
	)
)
(19 Clothing (90 90)
	(
		(Descriptor (60 60) (7))
		(Garment (61 61) (8))
	)
)
(20 Possession (87 87)
	(
		(Possession (90 90) (19))
		(Owner (70 70) (13))
	)
)
)
)
(
; story sentence text for lookup
("Bob loves to fish." "He got up early one morning." "He got his fishing pole ready." "Next he walked to the lake." "Bob caught a big fish.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (2 3) (1))
	)
)
(1 Cause_to_make_noise (3 3)
	(
		(Agent (0 0) ())
	)
)
(2 Waking_up (6 7)
	(
		(Time (9 10) (3))
		(Sleeper (0 0) ())
		(Time (8 8) ())
	)
)
(3 Calendric_unit (10 10)
	(
		(Unit (10 10) ())
		(Count (9 9) ())
	)
)
(4 Opinion (13 13)
	(
		(Cognizer (0 0) ())
		(Domain (16 16) ())
		(Opinion (10 10) (3))
	)
)
(5 Activity_ready_state (17 17)
	(
		(Salient_entity (16 16) ())
	)
)
(6 Self_motion (21 21)
	(
		(Time (0 0) ())
		(Self_mover (20 20) ())
		(Goal (24 24) (7))
	)
)
(7 Natural_features (24 24)
	(
		(Locale (10 10) (3))
	)
)
(8 Goal (27 27)
	(
		(Trajector (0 0) ())
		(Landmark (16 16) ())
	)
)
(9 Food (30 30)
	(
		(Descriptor (8 8) ())
	)
)
(10 Size (29 29)
	(
		(Entity (9 9) ())
	)
)
)
)
(
; story sentence text for lookup
("Has Charley seen the nest in the big apple tree?" "Oh, yes!" "and he has seen the sweet apples, too." "A big apple is on the green grass." "Charley will get it for Rosy.")
; events
(
(0 Size (7 7)
	(
		(Entity (9 9) (1))
	)
)
(1 Natural_features (9 9)
	(
		(Descriptor (7 7) (0))
		(Locale (9 9) ())
		(Constituent_parts (8 8) (3))
	)
)
(2 Perception_experience (2 2)
	(
		(Perceiver_passive (1 1) ())
		(Ground (9 9) (1))
		(Phenomenon (4 4) ())
	)
)
(3 Food (8 8)
	(
		(Food (8 8) ())
	)
)
(4 Food (21 21)
	(
		(Type (20 20) (5))
	)
)
(5 Chemical-sense_description (20 20)
	(
		(Perceptual_source (21 21) (4))
	)
)
(6 Perception_experience (18 18)
	(
		(Phenomenon (21 21) (4))
		(Perceiver_passive (1 1) ())
	)
)
(7 Food (27 27)
	(
		(Descriptor (1 1) ())
	)
)
(8 Size (26 26)
	(
		(Entity (27 27) (7))
	)
)
(9 Spatial_contact (29 29)
	(
		(Figure (27 27) (7))
		(Ground (32 32) ())
	)
)
(10 Color (31 31)
	(
		(Entity (7 7) (0))
	)
)
(11 Commerce_buy (36 36)
	(
		(Goods (37 37) ())
		(Purpose (39 39) ())
		(Buyer (34 34) ())
	)
)
)
)
(
; story sentence text for lookup
("Tyra is a poor." "Tyra is a homeless." "Tyra has to beg on the street for money." "Tyra catches a break one day." "A man gives her money and a place to live.")
; events
(
(0 Wealthiness (3 3)
	(
		(Person (0 0) ())
	)
)
(1 Money (18 18)
	(
		(Money (18 18) ())
	)
)
(2 Communication_noise (13 13)
	(
		(Message (18 18) (1))
		(Speaker (0 0) ())
	)
)
(3 Roadways (16 16)
	(
		(Roadway (16 16) ())
	)
)
(4 Calendric_unit (25 25)
	(
		(Unit (25 25) ())
		(Count (24 24) ())
	)
)
(5 Residence (36 36)
	(
		(Location (33 34) (9))
	)
)
(6 Giving (29 29)
	(
		(Theme (31 31) (8))
		(Recipient (30 30) ())
		(Donor (28 28) (7))
	)
)
(7 People (28 28)
	(
		(Person (28 28) ())
	)
)
(8 Money (31 31)
	(
		(Money (24 24) ())
		(Possessor (30 30) ())
	)
)
(9 Locale (34 34)
	(
		(Locale (34 34) ())
	)
)
)
)
(
; story sentence text for lookup
("Today I went to lunch." "I got the gumbo." "It was good but salty." "I drank a lot of water." "I would still get it again though.")
; events
(
(0 Calendric_unit (0 0)
	(
		(Unit (0 0) ())
	)
)
(1 Motion (2 2)
	(
		(Time (0 0) (0))
		(Theme (1 1) ())
		(Goal (4 4) (2))
	)
)
(2 Ingestion (4 4)
	(
		(Ingestor (1 1) ())
	)
)
(3 Possession (7 7)
	(
		(Owner (0 0) (0))
		(Possession (9 9) ())
	)
)
(4 Chemical-sense_description (15 15)
	(
		(Perceptual_source (0 0) (0))
	)
)
(5 Desirability (13 13)
	(
		(Evaluee (0 0) (0))
	)
)
(6 Quantified_mass (19 20)
	(
		(Quantity (9 9) ())
		(Mass (22 22) (8))
	)
)
(7 Ingestion (18 18)
	(
		(Ingestor (0 0) (0))
		(Ingestibles (20 20) ())
	)
)
(8 Food (22 22)
	(
		(Food (22 22) ())
	)
)
)
)
(
; story sentence text for lookup
("Tim got in the car." "He started the car." "He turned out of his street." "He saw a red light." "He stopped.")
; events
(
(0 Vehicle (4 4)
	(
		(Vehicle (4 4) ())
	)
)
(1 Setting_fire (7 7)
	(
		(Flammables (9 9) (2))
		(Kindler (6 6) ())
	)
)
(2 Vehicle (9 9)
	(
		(Vehicle (9 9) ())
	)
)
(3 Roadways (16 16)
	(
		(Roadway (16 16) ())
		(Relative_location (4 4) (0))
	)
)
(4 Perception_experience (19 19)
	(
		(Perceiver_passive (6 6) ())
		(Phenomenon (22 22) ())
	)
)
(5 Color (21 21)
	(
		(Entity (4 4) (0))
		(Color (9 9) (2))
	)
)
(6 Halt (25 25)
	(
		(Theme (6 6) ())
	)
)
)
)
(
; story sentence text for lookup
("Susie got some bad ice cream." "It looked good at first." "Then it melted." "Susie was not pleased." "She didn't want it anymore.")
; events
(
(0 Proportional_quantity (2 2)
	(
		(Reference_quantity (3 3) (3))
		(Mass (5 5) (4))
		(Denoted_quantity (2 2) ())
	)
)
(1 Have_associated (1 1)
	(
		(Entity (5 5) (4))
		(Topical_entity (0 0) ())
	)
)
(2 Food (4 4)
	(
	)
)
(3 Desirability (3 3)
	(
		(Evaluee (5 5) (4))
		(Evaluee (2 2) (0))
	)
)
(4 Food (5 5)
	(
		(Type (3 4) (2 3))
	)
)
(5 Desirability (9 9)
	(
		(Evaluee (0 0) ())
	)
)
(6 Give_impression (8 8)
	(
		(Phenomenon (0 0) ())
		(Appraisal (2 2) (0))
	)
)
(7 Change_of_phase (15 15)
	(
		(Patient (14 14) ())
	)
)
(8 Emotion_directed (20 20)
	(
		(Experiencer (0 0) ())
	)
)
(9 Desiring (25 25)
	(
		(Experiencer (0 0) ())
		(Time (27 27) ())
		(Focal_participant (26 26) ())
	)
)
(10 Negation (24 24)
	(
		(Negated_proposition (26 26) ())
		(Negated_proposition (22 22) ())
	)
)
)
)
(
; story sentence text for lookup
("My brother was in a bad mood." "He opened a can of paint." "He splashed it on the ground." "I told him to clean it up." "He refused to clean it up.")
; events
(
(0 Emotion_directed (5 6)
	(
		(Experiencer (1 1) (1))
	)
)
(1 Kinship (1 1)
	(
		(Ego (0 0) ())
		(Alter (1 1) ())
	)
)
(2 Closure (9 9)
	(
		(Agent (0 0) ())
		(Containing_object (11 11) (3))
	)
)
(3 Containers (11 11)
	(
		(Contents (13 13) ())
		(Container (11 11) ())
	)
)
(4 Cause_fluidic_motion (16 16)
	(
		(Agent (0 0) ())
		(Fluid (17 17) ())
		(Goal (20 20) ())
	)
)
(5 Request (23 23)
	(
		(Speaker (0 0) ())
		(Addressee (17 17) ())
		(Message (27 27) ())
	)
)
(6 Agree_or_refuse_to_act (31 31)
	(
		(Speaker (0 0) ())
		(Proposed_action (11 11) (3))
	)
)
(7 Grooming (33 35)
	(
		(Agent (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The cat strolled through the house." "It found something funny." "There was a pink ball on the floor." "The cat swatted the ball." "The cat liked playing with the ball.")
; events
(
(0 Buildings (5 5)
	(
		(Building (5 5) ())
	)
)
(1 Self_motion (2 2)
	(
		(Path (5 5) (0))
		(Self_mover (1 1) ())
	)
)
(2 Becoming_aware (8 8)
	(
		(Phenomenon (9 9) ())
		(Cognizer (7 7) ())
	)
)
(3 Stimulus_focus (10 10)
	(
		(Stimulus (9 9) ())
	)
)
(4 Architectural_part (19 19)
	(
		(Part (19 19) ())
	)
)
(5 Color (15 15)
	(
		(Entity (16 16) ())
		(Color (15 15) ())
	)
)
(6 Existence (12 13)
	(
		(Place (19 19) (4))
		(Entity (14 16) (5))
	)
)
(7 Containers (25 25)
	(
		(Container (16 16) ())
	)
)
(8 Level_of_force_resistance (23 23)
	(
		(Descriptor (25 25) (7))
		(Place (1 1) ())
	)
)
(9 Experiencer_focus (29 29)
	(
		(Content (33 33) ())
		(Experiencer (1 1) ())
	)
)
(10 Bragging (30 30)
	(
		(Manner (33 33) ())
		(Speaker (1 1) ())
	)
)
)
)
(
; story sentence text for lookup
("I have a pet cat, and a pet dog." "The cat is Tab, and the dog is Tip." "Tip is on the rug." "He sleeps on the rug at night." "Tab sleeps on a mat." "A good dog, and a good cat." "Tab sits up and rubs her ear." "She puts her paw up to her ear." "She rubs her eye, too." "Tab and Tip are on the rug now." "Tab pats Tip with her paw." "Tab mews, and runs to her own mat.")
; events
(
(0 Animals (9 9)
	(
		(Animal (9 9) ())
		(Descriptor (8 8) ())
	)
)
(1 Possession (1 1)
	(
		(Owner (0 0) ())
		(Possession (4 4) (2))
	)
)
(2 Animals (4 4)
	(
		(Origin (0 0) ())
		(Animal (4 4) ())
		(Descriptor (3 3) ())
	)
)
(3 Part_orientational (22 22)
	(
		(Part (0 0) ())
	)
)
(4 Sleep (29 29)
	(
		(Sleeper (0 0) ())
		(Place (32 32) ())
	)
)
(5 Calendric_unit (34 34)
	(
		(Unit (34 34) ())
	)
)
(6 Sleep (37 37)
	(
		(Sleeper (0 0) ())
		(Place (32 32) ())
	)
)
(7 Animals (44 44)
	(
		(Animal (44 44) ())
		(Descriptor (43 43) (8))
	)
)
(8 Desirability (43 43)
	(
		(Evaluee (44 44) (7))
	)
)
(9 Desirability (48 48)
	(
		(Evaluee (49 49) ())
	)
)
(10 Body_parts (57 57)
	(
		(Body_part (34 34) (5))
		(Possessor (56 56) ())
	)
)
(11 Manipulation (55 55)
	(
		(Agent (0 0) ())
		(Entity (57 57) (10))
	)
)
(12 Change_posture (52 53)
	(
		(Protagonist (0 0) ())
	)
)
(13 Cause_motion (60 60)
	(
		(Agent (0 0) ())
		(Goal (66 66) (15))
		(Theme (62 62) (14))
	)
)
(14 Body_parts (62 62)
	(
		(Body_part (3 3) ())
		(Possessor (44 44) (7))
	)
)
(15 Body_parts (66 66)
	(
		(Possessor (34 34) (5))
		(Body_part (49 49) ())
	)
)
(16 Manipulation (69 69)
	(
		(Agent (0 0) ())
		(Entity (62 62) (14))
	)
)
(17 Body_parts (71 71)
	(
		(Body_part (3 3) ())
		(Possessor (44 44) (7))
	)
)
(18 Temporal_collocation (82 82)
	(
		(Trajector_event (75 75) ())
	)
)
(19 Body_parts (89 89)
	(
		(Body_part (56 56) ())
		(Possessor (4 4) (2))
	)
)
(20 Manipulation (84 85)
	(
		(Entity (44 44) (7))
		(Bodypart_of_agent (89 89) (19))
	)
)
(21 Make_noise (92 92)
	(
		(Sound (43 43) (8))
		(Sound_source (0 0) ())
	)
)
(22 Self_motion (95 95)
	(
		(Self_mover (0 0) ())
		(Goal (99 99) ())
	)
)
)
)
(
; story sentence text for lookup
("I went out to eat today." "The food was standard." "Then I took it home," "I got the wrong food." "I was bummed.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Motion (1 1)
	(
		(Time (5 5) (0))
		(Theme (0 0) ())
		(Goal (2 2) ())
		(Purpose (3 4) (2))
	)
)
(2 Ingestion (4 4)
	(
		(Ingestor (0 0) ())
	)
)
(3 Food (8 8)
	(
		(Food (8 8) ())
	)
)
(4 Bringing (14 16)
	(
		(Agent (8 8) (3))
		(Goal (16 16) ())
		(Theme (15 15) ())
	)
)
(5 Possession (19 19)
	(
		(Owner (0 0) ())
		(Possession (22 22) (6))
	)
)
(6 Food (22 22)
	(
	)
)
(7 Make_noise (26 26)
	(
		(Sound_source (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The dog was thirsty." "The man brought him water." "The dog followed the man home." "The man fed him." "The dog never left the man's side.")
; events
(
(0 Biological_urge (3 3)
	(
		(Experiencer (1 1) ())
	)
)
(1 Bringing (7 7)
	(
		(Theme (9 9) ())
		(Goal (8 8) ())
		(Agent (1 1) ())
	)
)
(2 People (6 6)
	(
		(Person (6 6) ())
	)
)
(3 Cotheme (13 13)
	(
		(Goal (16 16) ())
		(Cotheme (15 15) (4))
		(Theme (1 1) ())
	)
)
(4 People (15 15)
	(
		(Person (9 9) ())
	)
)
(5 People (19 19)
	(
		(Person (6 6) (2))
	)
)
(6 Non-gradable_proximity (30 30)
	(
		(Figure (27 29) (8))
	)
)
(7 Negation (25 25)
	(
		(Negated_proposition (30 30) (6))
		(Negated_proposition (1 1) ())
	)
)
(8 People (28 28)
	(
		(Person (16 16) ())
	)
)
(9 Departing (26 26)
	(
		(Journey (30 30) (6))
		(Frequency (25 25) (7))
		(Theme (1 1) ())
	)
)
)
)
(
; story sentence text for lookup
("I took it the harness off the cat." "The cat did not want to go back inside." "I took the cat outside." "We bought the cat a harness." "The cat always liked to go outside.")
; events
(
(0 Connectors (4 4)
	(
		(Connector (4 4) ())
	)
)
(1 Removing (1 1)
	(
		(Agent (0 0) ())
		(Source (2 2) ())
		(Source (7 7) (3))
		(Theme (4 4) (0))
	)
)
(2 Spatial_contact (5 5)
	(
		(Ground (7 7) (3))
		(Figure (4 4) (0))
	)
)
(3 Animals (7 7)
	(
		(Animal (7 7) ())
	)
)
(4 Interior_profile_relation (17 17)
	(
		(Figure (10 10) ())
	)
)
(5 Desiring (13 13)
	(
		(Event (14 17) (4 6))
		(Experiencer (10 10) ())
	)
)
(6 Motion (15 15)
	(
		(Goal (17 17) (4))
		(Direction (7 7) (3))
		(Theme (10 10) ())
	)
)
(7 Bringing (20 20)
	(
		(Theme (22 22) ())
		(Agent (0 0) ())
		(Goal (4 4) (0))
	)
)
(8 Accoutrements (30 30)
	(
		(Accoutrement (30 30) ())
	)
)
(9 Commerce_buy (26 26)
	(
		(Recipient (22 22) ())
		(Buyer (0 0) ())
		(Goods (30 30) (8))
	)
)
(10 Animals (28 28)
	(
		(Animal (28 28) ())
	)
)
(11 Frequency (34 34)
	(
		(Event (35 38) (12 13 14))
		(Event (10 10) ())
	)
)
(12 Experiencer_focus (35 35)
	(
		(Content (36 38) (13 14))
		(Experiencer (10 10) ())
	)
)
(13 Motion (37 37)
	(
		(Goal (38 38) (14))
		(Theme (10 10) ())
	)
)
(14 Part_inner_outer (38 38)
	(
	)
)
)
)
(
; story sentence text for lookup
("Here comes the band!" "Shall we call mamma and Fanny to see it?" "Let us stand still, and hear the men play as they pass." "I hope they will stop here and play for us." "See the large man in front of the band, with his big hat." "What has he in his hand?" "How fine he looks!" "Look, too, at the man on that fine horse." "If the men do not stop, let us go with them and see where they go.")
; events
(
(0 Spatial_co-location (0 0)
	(
		(Figure (3 3) (2))
	)
)
(1 Arriving (1 1)
	(
		(Theme (3 3) (2))
		(Goal (0 0) (0))
	)
)
(2 Aggregate (3 3)
	(
		(Aggregate (3 3) ())
	)
)
(3 Kinship (8 8)
	(
		(Alter (3 3) (2))
	)
)
(4 Contacting (7 7)
	(
		(Purpose (13 13) ())
		(Communicator (6 6) ())
		(Addressee (8 8) (3))
	)
)
(5 Visiting (12 12)
	(
		(Entity (13 13) ())
		(Agent (8 8) (3))
	)
)
(6 People (23 23)
	(
		(Person (13 13) ())
	)
)
(7 Posture (17 17)
	(
		(Point_of_contact (17 17) ())
		(Agent (6 6) ())
		(Dependent_state (3 3) (2))
	)
)
(8 Traversing (27 27)
	(
		(Theme (26 26) ())
	)
)
(9 Perception_active (24 24)
	(
		(Perceiver_agentive (23 23) (6))
	)
)
(10 Perception_experience (21 21)
	(
		(Depictive (24 24) (9))
		(Perceiver_passive (6 6) ())
		(Phenomenon (23 23) (6))
	)
)
(11 Desiring (30 30)
	(
		(Event (31 31) ())
		(Experiencer (0 0) (0))
	)
)
(12 Halt (33 33)
	(
		(Theme (17 17) (7))
		(Place (34 34) ())
	)
)
(13 Competition (36 36)
	(
		(Participant_1 (17 17) (7))
		(Competition (38 38) ())
	)
)
(14 People (43 43)
	(
		(Descriptor (45 45) ())
		(Descriptor (17 17) (7))
		(Person (3 3) (2))
	)
)
(15 Body_description_holistic (42 42)
	(
		(Individual (3 3) (2))
	)
)
(16 Non-gradable_proximity (44 45)
	(
		(Ground (13 13) ())
		(Figure (3 3) (2))
	)
)
(17 Aggregate (48 48)
	(
		(Aggregate (13 13) ())
	)
)
(18 Perception_experience (40 40)
	(
		(Phenomenon (43 43) (14))
		(Depictive (53 53) (19))
	)
)
(19 Accoutrements (53 53)
	(
		(Wearer (26 26) ())
		(Descriptor (52 52) ())
		(Accoutrement (53 53) ())
	)
)
(20 Possession (56 56)
	(
		(Possession (0 0) (0))
		(Owner (17 17) (7))
		(Depictive (8 8) (3))
	)
)
(21 Body_parts (60 60)
	(
		(Body_part (34 34) ())
		(Possessor (59 59) ())
	)
)
(22 Desirability (63 63)
	(
		(Degree (0 0) (0))
		(Evaluee (17 17) (7))
	)
)
(23 Give_impression (65 65)
	(
		(Phenomenon (17 17) (7))
		(Appraisal (62 63) (22))
	)
)
(24 People (73 73)
	(
		(Person (73 73) ())
		(Descriptor (77 77) ())
	)
)
(25 Perception_active (67 67)
	(
		(Phenomenon (73 73) (24))
	)
)
(26 People (81 81)
	(
		(Person (17 17) (7))
	)
)
(27 Cotheme (88 90)
	(
		(Cotheme (90 90) ())
		(Theme (13 13) ())
	)
)
(28 Halt (84 84)
	(
		(Theme (81 81) (26))
	)
)
)
)
(
; story sentence text for lookup
("Yesterday I got a kindle book." "It was great." "I liked the book a lot." "I read it in two days." "It was impressive.")
; events
(
(0 Text (5 5)
	(
		(Text (5 5) ())
		(Genre (4 4) ())
	)
)
(1 Calendric_unit (0 0)
	(
		(Unit (0 0) ())
	)
)
(2 Getting (2 2)
	(
		(Theme (5 5) (0))
		(Recipient (1 1) ())
	)
)
(3 Desirability (9 9)
	(
		(Evaluee (0 0) (1))
	)
)
(4 Experiencer_focus (12 12)
	(
		(Experiencer (0 0) (1))
		(Content (14 14) (5))
		(Degree (15 16) ())
	)
)
(5 Text (14 14)
	(
		(Text (14 14) ())
	)
)
(6 Reading_activity (19 19)
	(
		(Reader (0 0) (1))
		(Text (20 20) ())
		(Time (5 5) (0))
	)
)
(7 Calendric_unit (23 23)
	(
		(Unit (5 5) (0))
		(Count (4 4) ())
	)
)
(8 Stimulus_focus (27 27)
	(
		(Stimulus (0 0) (1))
	)
)
)
)
(
; story sentence text for lookup
("The man was cooking." "He knocked over some oil." "The oil fell on the floor." "He did not notice." "He slipped on the oil.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Cooking_creation (3 3)
	(
		(Cook (1 1) (0))
	)
)
(2 Cause_impact (6 6)
	(
		(Impactors (9 9) (3))
		(Agent (5 5) ())
		(Result (7 7) ())
	)
)
(3 Food (9 9)
	(
	)
)
(4 Motion_directional (13 13)
	(
		(Direction (7 7) ())
		(Goal (16 16) (6))
		(Theme (1 1) (0))
	)
)
(5 Substance (12 12)
	(
		(Substance (1 1) (0))
	)
)
(6 Architectural_part (16 16)
	(
		(Part (16 16) ())
	)
)
(7 Becoming_aware (21 21)
	(
		(Cognizer (5 5) ())
	)
)
(8 Cause_motion (24 24)
	(
		(Agent (5 5) ())
		(Goal (27 27) (9))
	)
)
(9 Food (27 27)
	(
	)
)
)
)
(
; story sentence text for lookup
("These boys are Ned and Roy." "The large boy is Roy." "The boy who has a bun is Ned." "The boys are sitting on the floor." "Roy's dog, Carlo, lies near Ned." "Is he lying near Roy?" "Ned and Roy are good boys.")
; events
(
(0 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(1 People_by_age (9 9)
	(
		(Person (9 9) ())
		(Descriptor (1 1) (0))
	)
)
(2 Size (8 8)
	(
		(Entity (9 9) (1))
	)
)
(3 People_by_age (14 14)
	(
		(Person (1 1) (0))
	)
)
(4 Body_parts (18 18)
	(
		(Possessor (9 9) (1))
		(Body_part (18 18) ())
		(Possessor (14 14) (3))
	)
)
(5 People_by_age (23 23)
	(
		(Person (1 1) (0))
	)
)
(6 Architectural_part (28 28)
	(
		(Part (28 28) ())
	)
)
(7 Posture (25 25)
	(
		(Location (28 28) (6))
		(Point_of_contact (25 25) ())
		(Agent (14 14) (3))
	)
)
(8 Locative_relation (37 37)
	(
		(Ground (38 38) ())
		(Figure (32 32) ())
	)
)
(9 Posture (36 36)
	(
		(Location (38 38) ())
		(Agent (32 32) ())
		(Point_of_contact (28 28) (6))
	)
)
(10 Posture (42 42)
	(
		(Point_of_contact (9 9) (1))
		(Agent (1 1) (0))
		(Location (44 44) ())
	)
)
(11 Gradable_proximity (43 43)
	(
		(Figure (1 1) (0))
		(Ground (44 44) ())
	)
)
(12 People_by_age (51 51)
	(
		(Person (18 18) (4))
		(Persistent_characteristic (44 44) ())
	)
)
(13 Desirability (50 50)
	(
		(Evaluee (18 18) (4))
	)
)
)
)
(
; story sentence text for lookup
("I took my dog to get a bath." "My dog loves to take a bath." "I got the bath water ready for him." "My dog jumped into the bath." "He splashed me with water.")
; events
(
(0 Bringing (1 1)
	(
		(Theme (3 3) (2))
		(Agent (0 0) ())
		(Purpose (7 7) (1))
	)
)
(1 Grooming (7 7)
	(
		(Agent (0 0) ())
	)
)
(2 Animals (3 3)
	(
		(Animal (3 3) ())
	)
)
(3 Experiencer_focus (11 11)
	(
		(Content (15 15) (4))
		(Experiencer (10 10) ())
	)
)
(4 Grooming (15 15)
	(
		(Agent (10 10) ())
	)
)
(5 Possession (18 18)
	(
		(Owner (0 0) ())
		(Possession (21 21) ())
	)
)
(6 Activity_ready_state (22 22)
	(
		(Protagonist (24 24) ())
		(Salient_entity (21 21) ())
	)
)
(7 Self_motion (28 28)
	(
		(Goal (31 31) (8))
		(Self_mover (10 10) ())
	)
)
(8 Building_subparts (31 31)
	(
	)
)
(9 Filling (34 34)
	(
		(Agent (0 0) ())
		(Goal (35 35) ())
		(Theme (37 37) ())
	)
)
)
)
(
; story sentence text for lookup
("It was the middle of summer." "Kara didn't want to go outside." "It was too hot." "So she just stayed in." "It wasn't worth it being in the heat.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Temporal_subregion (3 3)
	(
		(Time_period (5 5) (0))
		(Subpart (3 3) ())
	)
)
(2 Desiring (10 10)
	(
		(Experiencer (7 7) ())
		(Event (11 13) (4))
	)
)
(3 Negation (9 9)
	(
		(Negated_proposition (10 13) (2 4))
		(Negated_proposition (7 7) ())
	)
)
(4 Motion (12 12)
	(
		(Goal (13 13) ())
		(Theme (7 7) ())
	)
)
(5 Ambient_temperature (18 18)
	(
		(Degree (17 17) ())
	)
)
(6 Setting_fire (23 24)
	(
		(Kindler (21 21) ())
	)
)
(7 Ambient_temperature (34 34)
	(
		(Temperature (34 34) ())
	)
)
(8 Deserving (29 29)
	(
		(State_of_affairs (7 7) ())
		(State_of_affairs (30 30) ())
		(State_of_affairs (34 34) (7))
	)
)
)
)
(
; story sentence text for lookup
("I went to Texas last week." "It was very fun." "We had bbq food." "It tasted very good." "I wanted to go back.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
		(Relative_time (4 4) (2))
	)
)
(1 Motion (1 1)
	(
		(Goal (3 3) ())
		(Theme (0 0) ())
		(Time (4 5) (0 2))
	)
)
(2 Relative_time (4 4)
	(
		(Focal_occasion (0 0) ())
		(Focal_occasion (5 5) (0))
	)
)
(3 Stimulus_focus (10 10)
	(
		(Stimulus (0 0) ())
		(Degree (9 9) ())
	)
)
(4 Ingestion (13 13)
	(
		(Ingestor (0 0) ())
		(Ingestibles (3 3) ())
	)
)
(5 Food (15 15)
	(
		(Type (9 9) ())
	)
)
(6 Give_impression (18 18)
	(
		(Phenomenon (0 0) ())
		(Characterization (3 3) ())
	)
)
(7 Desirability (20 20)
	(
		(Evaluee (0 0) ())
		(Degree (9 9) ())
	)
)
(8 Desiring (23 23)
	(
		(Experiencer (0 0) ())
		(Event (24 26) (9))
	)
)
(9 Motion (25 25)
	(
		(Theme (0 0) ())
		(Goal (4 4) (2))
	)
)
)
)
(
; story sentence text for lookup
("Jane had never been in love before." "She got her first boyfriend." "It was in high school." "She thought she loved him but they broke up." "It took her a long time to get over it.")
; events
(
(0 Personal_relationship (5 5)
	(
		(Partner_1 (0 0) ())
	)
)
(1 Personal_relationship (12 12)
	(
		(Partner_2 (0 0) ())
		(Partner_2 (10 10) ())
		(Partner_1 (12 12) ())
	)
)
(2 Ordinal_numbers (11 11)
	(
		(Item (12 12) (1))
	)
)
(3 Interior_profile_relation (16 16)
	(
		(Figure (0 0) ())
		(Ground (18 18) ())
	)
)
(4 Personal_relationship (27 28)
	(
		(Partners (26 26) ())
	)
)
(5 Awareness (21 21)
	(
		(Cognizer (0 0) ())
		(Content (22 22) ())
	)
)
(6 Experiencer_focus (23 23)
	(
		(Experiencer (0 0) ())
		(Experiencer (10 10) ())
		(Content (12 12) (1))
	)
)
(7 Measure_duration (35 35)
	(
		(Process (10 10) ())
		(Unit (12 12) (1))
		(Count (33 33) ())
	)
)
(8 Taking_time (31 31)
	(
		(Agent (10 10) ())
		(Activity (39 39) ())
		(Time_length (35 35) (7))
	)
)
(9 Duration_description (34 34)
	(
		(Period (35 35) (7))
	)
)
)
)
(
; story sentence text for lookup
("Susie had the flu." "It made her feel groggy." "So she had to call in sick." "Thankfully work let her off." "But she only got one day.")
; events
(
(0 Medical_conditions (3 3)
	(
		(Ailment (3 3) ())
		(Patient (0 0) ())
	)
)
(1 Biological_urge (9 9)
	(
		(Experiencer (7 7) ())
	)
)
(2 Causation (6 6)
	(
		(Cause (0 0) ())
		(Affected (7 7) ())
		(Effect (9 9) (1))
	)
)
(3 Feeling (8 8)
	(
		(Emotional_state (9 9) (1))
		(Experiencer (7 7) ())
	)
)
(4 Required_event (13 13)
	(
		(Required_situation (12 12) ())
		(Required_situation (14 17) (5 6))
	)
)
(5 Contacting (15 15)
	(
		(Address (16 17) (6))
		(Communicator (12 12) ())
	)
)
(6 Remembering_to_do (17 17)
	(
		(Cognizer (12 12) ())
	)
)
(7 Calendric_unit (30 30)
	(
		(Unit (30 30) ())
		(Count (9 9) (1))
	)
)
(8 Cardinal_numbers (29 29)
	(
		(Entity (30 30) (7))
		(Number (9 9) (1))
	)
)
(9 Have_associated (28 28)
	(
		(Duration (29 30) (7 8))
		(Topical_entity (12 12) ())
	)
)
)
)
(
; story sentence text for lookup
("Today I went to school." "It was the first day of school." "I met all my new teachers." "I got all of my homework." "I went home from school.")
; events
(
(0 Calendric_unit (0 0)
	(
		(Unit (0 0) ())
	)
)
(1 Motion (2 2)
	(
		(Time (0 0) (0))
		(Theme (1 1) ())
		(Goal (4 4) (2))
	)
)
(2 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
	)
)
(3 Calendric_unit (10 10)
	(
		(Whole (12 12) (4))
		(Unit (4 4) (2))
	)
)
(4 Locale_by_use (12 12)
	(
		(Locale (12 12) ())
	)
)
(5 Ordinal_numbers (9 9)
	(
		(Comparison_set (12 12) (4))
		(Item (4 4) (2))
	)
)
(6 Education_teaching (19 19)
	(
		(Teacher (19 19) ())
		(Student (17 17) ())
	)
)
(7 Make_acquaintance (15 15)
	(
		(Individual_1 (0 0) (0))
		(Intermediary (19 19) (6))
	)
)
(8 Age (18 18)
	(
		(Entity (19 19) (6))
	)
)
(9 Commerce_buy (22 22)
	(
		(Recipient (0 0) (0))
		(Explanation (19 19) (6))
	)
)
(10 Motion (29 29)
	(
		(Theme (0 0) (0))
		(Goal (30 30) ())
		(Source (4 4) (2))
	)
)
(11 Locale_by_use (32 32)
	(
		(Locale (4 4) (2))
	)
)
)
)
(
; story sentence text for lookup
("The man planted a tree." "The tree grew to be very tall." "One day their was a big storm." "A branch fell from the tree." "It broke a window of the man's house.")
; events
(
(0 Placing (2 2)
	(
		(Theme (4 4) ())
		(Agent (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Ontogeny (8 8)
	(
		(Post_state (9 12) (3))
		(Entity (1 1) (1))
	)
)
(3 Measurable_attributes (12 12)
	(
		(Attribute (12 12) ())
		(Degree (11 11) ())
		(Entity (1 1) (1))
	)
)
(4 Calendric_unit (15 15)
	(
		(Count (14 14) ())
		(Unit (1 1) (1))
	)
)
(5 Size (19 19)
	(
		(Entity (12 12) (3))
	)
)
(6 Weather (20 20)
	(
		(Specification (11 11) ())
	)
)
(7 Natural_features (27 27)
	(
		(Locale (11 11) ())
	)
)
(8 Motion_directional (24 24)
	(
		(Theme (1 1) (1))
		(Source (27 27) (7))
		(Direction (24 24) ())
	)
)
(9 Buildings (37 37)
	(
		(Building (37 37) ())
	)
)
(10 Connecting_architecture (32 32)
	(
		(Part (32 32) ())
		(Whole (37 37) (9))
	)
)
(11 People (35 35)
	(
		(Person (12 12) (3))
	)
)
)
)
(
; story sentence text for lookup
("The boy cried." "A woman saw the boy crying." "She wanted to help." "The boy did not want her help." "The boy's mother came running over.")
; events
(
(0 Communication_noise (2 2)
	(
		(Speaker (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Make_noise (9 9)
	(
		(Sound_source (8 8) (5))
	)
)
(3 Perception_experience (6 6)
	(
		(Phenomenon (8 8) (5))
		(Perceiver_passive (1 1) (1))
	)
)
(4 People (5 5)
	(
		(Person (1 1) (1))
	)
)
(5 People_by_age (8 8)
	(
		(Person (8 8) ())
	)
)
(6 Desiring (12 12)
	(
		(Event (13 14) (7))
		(Experiencer (11 11) ())
	)
)
(7 Assistance (14 14)
	(
		(Helper (11 11) ())
	)
)
(8 People_by_age (17 17)
	(
		(Person (1 1) (1))
	)
)
(9 Desiring (20 20)
	(
		(Purpose_of_event (22 22) (10))
		(Experiencer (1 1) (1))
	)
)
(10 Assistance (22 22)
	(
		(Helper (21 21) ())
	)
)
(11 People_by_age (25 25)
	(
		(Person (1 1) (1))
	)
)
(12 Kinship (27 27)
	(
		(Ego (24 26) (11))
		(Alter (27 27) ())
	)
)
(13 Self_motion (29 29)
	(
		(Goal (30 30) ())
		(Self_mover (27 27) (12))
	)
)
)
)
(
; story sentence text for lookup
("Yesterday I went out to eat." "I ate a lot." "Too much to the point where I was full." "I then fell sick." "It was just too much.")
; events
(
(0 Calendric_unit (0 0)
	(
		(Unit (0 0) ())
	)
)
(1 Motion (2 2)
	(
		(Time (0 0) (0))
		(Purpose (4 5) (2))
		(Goal (3 3) ())
		(Theme (1 1) ())
	)
)
(2 Ingestion (5 5)
	(
		(Time (0 0) (0))
		(Ingestor (1 1) ())
	)
)
(3 Ingestion (8 8)
	(
		(Ingestor (0 0) (0))
		(Ingestibles (10 10) ())
	)
)
(4 Intoxication (20 20)
	(
		(Cognizer (18 18) ())
	)
)
(5 Biological_urge (25 25)
	(
		(Experiencer (0 0) (0))
	)
)
(6 Sufficiency (30 30)
	(
		(Item (0 0) (0))
		(Item (31 31) ())
	)
)
)
)
(
; story sentence text for lookup
("It was very hot outside." "So we wanted to go where it was cool." "We walked into the building." "But then we walked out." "The building was far too cold.")
; events
(
(0 Temporal_collocation (4 4)
	(
		(Trajector_event (2 3) (1))
	)
)
(1 Ambient_temperature (3 3)
	(
		(Degree (2 2) ())
		(Place (4 4) (0))
	)
)
(2 Popularity (14 14)
	(
		(Place (11 11) ())
		(Evaluee (12 12) ())
	)
)
(3 Desiring (8 8)
	(
		(Event (12 12) ())
		(Experiencer (7 7) ())
	)
)
(4 Motion (10 10)
	(
		(Theme (7 7) ())
		(Goal (12 12) ())
	)
)
(5 Self_motion (17 17)
	(
		(Self_mover (16 16) ())
		(Goal (20 20) (6))
	)
)
(6 Buildings (20 20)
	(
		(Building (4 4) (0))
	)
)
(7 Self_motion (25 25)
	(
		(Self_mover (2 2) ())
		(Time (7 7) ())
		(Goal (4 4) (0))
	)
)
(8 Buildings (29 29)
	(
		(Building (7 7) ())
	)
)
(9 Ambient_temperature (33 33)
	(
		(Degree (31 32) ())
		(Circumstances (29 29) (8))
	)
)
)
)
(
; story sentence text for lookup
("Tom wanted a pet." "Tom knew a dog or cat would be too much of a liability." "Tom went to the pet store." "Tom found a lizard he liked." "Tom bought the lizard.")
; events
(
(0 Desiring (1 1)
	(
		(Focal_participant (3 3) ())
		(Experiencer (0 0) ())
	)
)
(1 Awareness (6 6)
	(
		(Cognizer (0 0) ())
		(Content (8 8) (2))
	)
)
(2 Animals (8 8)
	(
		(Animal (8 8) ())
	)
)
(3 Motion (20 20)
	(
		(Theme (0 0) ())
		(Goal (24 24) (4))
	)
)
(4 Businesses (24 24)
	(
		(Business (24 24) ())
		(Product (23 23) ())
	)
)
(5 Experiencer_focus (31 31)
	(
		(Content (3 3) ())
		(Experiencer (23 23) ())
	)
)
(6 Locating (27 27)
	(
		(Perceiver (0 0) ())
		(Sought_entity (24 24) (4))
	)
)
(7 Commerce_buy (34 34)
	(
		(Buyer (0 0) ())
		(Goods (3 3) ())
	)
)
)
)
(
; story sentence text for lookup
("We have bees in our garden." "They live in a little house." "This little house is called a hive." "What is in the hive?" "Honey is in the hive." "The bees get honey from the flowers and carry it to the hive." "Honey is very sweet." "Do you like it?" "All bees do not live in the hives." "Some bees live in trees." "They are wild bees.")
; events
(
(0 Have_associated (1 1)
	(
		(Entity (2 2) ())
		(Topical_entity (0 0) ())
		(Place (5 5) (2))
	)
)
(1 Interior_profile_relation (3 3)
	(
		(Figure (2 2) ())
		(Ground (5 5) (2))
	)
)
(2 Locale_by_use (5 5)
	(
		(Container_possessor (4 4) ())
		(Locale (5 5) ())
	)
)
(3 Residence (8 8)
	(
		(Resident (0 0) ())
		(Location (12 12) (4))
	)
)
(4 Buildings (12 12)
	(
		(Building (5 5) (2))
	)
)
(5 Buildings (16 16)
	(
		(Building (2 2) ())
	)
)
(6 Referring_by_name (18 18)
	(
		(Entity (14 16) (5))
		(Name (19 20) ())
	)
)
(7 Body_parts (26 26)
	(
		(Body_part (4 4) ())
	)
)
(8 Containers (32 32)
	(
		(Container (4 4) ())
	)
)
(9 Food (28 28)
	(
	)
)
(10 Interior_profile_relation (30 30)
	(
		(Figure (0 0) ())
		(Ground (32 32) (8))
	)
)
(11 Food (37 37)
	(
	)
)
(12 Commerce_buy (36 36)
	(
		(Buyer (35 35) ())
		(Goods (37 37) (11))
		(Place (40 40) ())
	)
)
(13 Bringing (42 42)
	(
		(Theme (43 43) ())
		(Goal (46 46) ())
		(Agent (35 35) ())
	)
)
(14 Food (48 48)
	(
	)
)
(15 Chemical-sense_description (51 51)
	(
		(Perceptual_source (0 0) ())
		(Degree (2 2) ())
	)
)
(16 Experiencer_focus (55 55)
	(
		(Experiencer (54 54) ())
		(Content (37 37) (11))
	)
)
(17 Quantified_mass (58 58)
	(
		(Individuals (54 54) ())
		(Quantity (0 0) ())
	)
)
(18 Residence (62 62)
	(
		(Resident (35 35) ())
		(Location (65 65) (19))
	)
)
(19 Part_orientational (65 65)
	(
		(Part (65 65) ())
	)
)
(20 Interior_profile_relation (70 70)
	(
		(Ground (4 4) ())
		(Figure (35 35) ())
	)
)
(21 Residence (69 69)
	(
		(Resident (35 35) ())
		(Location (32 32) (8))
	)
)
(22 Exemplar (75 75)
	(
		(Type (37 37) (11))
	)
)
)
)
(
; story sentence text for lookup
("A New Mexican restaurant opened up." "It looked good." "Nance wanted to go." "When she went she loved it." "She was happy it was good.")
; events
(
(0 Locale_by_use (3 3)
	(
		(Descriptor (1 2) ())
		(Locale (3 3) ())
	)
)
(1 Give_impression (8 9)
	(
		(Phenomenon (7 7) ())
		(Appraisal (9 9) ())
	)
)
(2 Desiring (12 12)
	(
		(Event (13 14) (3))
		(Experiencer (7 7) ())
	)
)
(3 Motion (14 14)
	(
		(Theme (7 7) ())
	)
)
(4 Temporal_collocation (16 16)
	(
		(Landmark_event (1 2) ())
		(Trajector_event (19 19) ())
	)
)
(5 Motion (18 18)
	(
		(Theme (17 17) ())
		(Theme (3 3) (0))
	)
)
(6 Experiencer_focus (20 20)
	(
		(Content (21 21) ())
		(Experiencer (3 3) (0))
	)
)
(7 Emotion_directed (25 25)
	(
		(Experiencer (7 7) ())
		(Stimulus (19 19) ())
	)
)
(8 Desirability (28 28)
	(
		(Evaluee (3 3) (0))
	)
)
)
)
(
; story sentence text for lookup
("The man had a craving." "He ignored it." "The craving grew." "He gave into the craving." "The man felt guilty.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Desiring (4 4)
	(
		(Experiencer (1 1) (0))
	)
)
(2 Change_position_on_a_scale (12 12)
	(
		(Item (1 1) (0))
	)
)
(3 Desiring (11 11)
	(
	)
)
(4 Desiring (18 18)
	(
	)
)
(5 Feeling (22 22)
	(
		(Emotional_state (23 23) (7))
		(Experiencer (1 1) (0))
	)
)
(6 People (21 21)
	(
		(Person (1 1) (0))
	)
)
(7 Contrition (23 23)
	(
		(Experiencer (1 1) (0))
	)
)
)
)
(
; story sentence text for lookup
("The boy and the dog run.")
; events
(
(0 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Self_motion (5 5)
	(
		(Self_mover (1 1) (0))
	)
)
)
)
(
; story sentence text for lookup
("Helen went to a hair stylist." "She wanted a new hair cut." "Stylist has cut her hair too short." "Helen did not like it." "She did not tip him.")
; events
(
(0 People_by_vocation (5 5)
	(
		(Person (5 5) ())
		(Type (4 4) (2))
	)
)
(1 Motion (1 1)
	(
		(Theme (0 0) ())
		(Goal (5 5) (0))
	)
)
(2 Hair_configuration (4 4)
	(
	)
)
(3 Hair_configuration (12 12)
	(
		(Configuration (5 5) (0))
		(Configuration (4 4) (2))
	)
)
(4 Desiring (8 8)
	(
		(Experiencer (0 0) ())
		(Focal_participant (5 5) (0))
	)
)
(5 Body_parts (11 11)
	(
		(Body_part (4 4) (2))
		(Descriptor (10 10) (6))
	)
)
(6 Age (10 10)
	(
		(Entity (12 12) (3))
	)
)
(7 Body_parts (18 18)
	(
		(Body_part (4 4) (2))
		(Possessor (10 10) (6))
	)
)
(8 Cutting (16 16)
	(
		(Item (18 18) (7))
		(Pieces (19 20) (9))
		(Agent (0 0) ())
	)
)
(9 Hair_configuration (20 20)
	(
		(Hair (18 18) (7))
		(Possessor (5 5) (0))
	)
)
(10 Experiencer_focus (25 25)
	(
		(Experiencer (0 0) ())
		(Content (4 4) (2))
	)
)
)
)
(
; story sentence text for lookup
("I can see a swan." "A swan can swim well." "A swan can not walk well, but she can swim very fast." "The swan has a nest by the side of the pond." "She lays eggs in her nest." "She is a white swan.")
; events
(
(0 Perception_experience (2 2)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (4 4) ())
	)
)
(1 Possibility (1 1)
	(
		(Possible_event (0 0) ())
		(Possible_event (4 4) ())
	)
)
(2 Self_motion (9 9)
	(
		(Self_mover (7 7) ())
		(Manner (10 10) ())
	)
)
(3 Capability (8 8)
	(
		(Event (4 4) ())
		(Entity (7 7) ())
	)
)
(4 Capability (21 21)
	(
		(Entity (20 20) ())
		(Event (22 24) (5 7))
	)
)
(5 Self_motion (22 22)
	(
		(Self_mover (20 20) ())
		(Manner (23 24) (7))
	)
)
(6 Self_motion (16 16)
	(
		(Self_mover (7 7) ())
		(Manner (17 17) ())
	)
)
(7 Speed_description (24 24)
	(
		(Entity (20 20) ())
		(Degree (23 23) ())
	)
)
(8 Part_orientational (33 33)
	(
		(Part (33 33) ())
		(Whole (36 36) (10))
	)
)
(9 Relational_political_locales (30 30)
	(
		(Locale (10 10) ())
	)
)
(10 Natural_features (36 36)
	(
		(Locale (36 36) ())
	)
)
(11 Beyond_compare (28 28)
	(
		(Variable (4 4) ())
		(Standard (7 7) ())
		(Standard (33 33) (8))
	)
)
(12 Giving_birth (39 39)
	(
		(Mother (0 0) ())
		(Egg (40 40) (13))
		(Place (43 43) ())
	)
)
(13 Food (40 40)
	(
	)
)
(14 Interior_profile_relation (41 41)
	(
		(Ground (43 43) ())
		(Figure (40 40) (13))
	)
)
(15 Color (48 48)
	(
		(Entity (10 10) ())
		(Color (48 48) ())
	)
)
)
)
(
; story sentence text for lookup
("The man cracked an egg." "He put the egg in the pan." "The yoke broke when it dropped." "The man threw out the egg." "The man cracked another egg.")
; events
(
(0 Grinding (2 2)
	(
		(Patient (4 4) (2))
		(Grinder (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Food (4 4)
	(
	)
)
(3 Placing (7 7)
	(
		(Theme (9 9) (5))
		(Agent (6 6) ())
		(Goal (12 12) (4))
	)
)
(4 Containers (12 12)
	(
		(Container (12 12) ())
	)
)
(5 Food (9 9)
	(
	)
)
(6 Body_parts (15 15)
	(
		(Body_part (1 1) (1))
	)
)
(7 Motion_directional (19 19)
	(
		(Direction (19 19) ())
		(Theme (18 18) ())
	)
)
(8 Experience_bodily_harm (16 16)
	(
		(Body_part (1 1) (1))
		(Time (18 18) ())
	)
)
(9 Cause_motion (23 23)
	(
		(Theme (26 26) (11))
		(Source (24 24) ())
		(Agent (1 1) (1))
	)
)
(10 People (22 22)
	(
		(Person (1 1) (1))
	)
)
(11 Food (26 26)
	(
	)
)
(12 Grinding (30 30)
	(
		(Patient (4 4) (2))
		(Grinder (1 1) (1))
	)
)
(13 People (29 29)
	(
		(Person (1 1) (1))
	)
)
(14 Increment (31 31)
	(
		(Class (18 18) ())
	)
)
(15 Food (32 32)
	(
	)
)
)
)
(
; story sentence text for lookup
("He took the cat to the vet." "The vet called it sick." "The man got some medicine." "The cat took the medicine." "The cat got better.")
; events
(
(0 Bringing (1 1)
	(
		(Theme (3 3) (2))
		(Agent (0 0) ())
		(Goal (6 6) (1))
	)
)
(1 Medical_professionals (6 6)
	(
		(Professional (6 6) ())
	)
)
(2 Animals (3 3)
	(
		(Animal (3 3) ())
	)
)
(3 Labeling (10 10)
	(
		(Label (12 12) (5))
		(Entity (3 3) (2))
		(Speaker (9 9) (4))
	)
)
(4 Medical_professionals (9 9)
	(
		(Professional (9 9) ())
	)
)
(5 Medical_conditions (12 12)
	(
		(Patient (3 3) (2))
	)
)
(6 Have_associated (16 16)
	(
		(Entity (18 18) ())
		(Topical_entity (9 9) (4))
	)
)
(7 People (15 15)
	(
		(Person (9 9) (4))
	)
)
(8 Ingest_substance (22 22)
	(
		(Substance (18 18) ())
		(Ingestor (9 9) (4))
	)
)
(9 Intoxicants (24 24)
	(
		(Intoxicant (12 12) (5))
	)
)
(10 Transition_to_state (28 28)
	(
		(Final_quality (3 3) (2))
		(Entity (9 9) (4))
	)
)
(11 Animals (27 27)
	(
		(Animal (9 9) (4))
	)
)
(12 Desirability (29 29)
	(
		(Degree (3 3) (2))
		(Evaluee (9 9) (4))
	)
)
)
)
(
; story sentence text for lookup
("Lucy wanted to play accordion." "She came for her first lesson." "Lucy was very tiny." "She put accordion on her lap." "She felt a big pain in her knees.")
; events
(
(0 Noise_makers (4 4)
	(
		(Noise_maker (4 4) ())
	)
)
(1 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (4 4) (0))
	)
)
(2 Hunting (3 3)
	(
		(Means (4 4) (0))
		(Instrument (0 0) ())
	)
)
(3 Arriving (7 7)
	(
		(Theme (0 0) ())
		(Purpose (11 11) ())
	)
)
(4 Ordinal_numbers (10 10)
	(
		(Type (11 11) ())
	)
)
(5 Size (16 16)
	(
		(Entity (0 0) ())
		(Degree (15 15) ())
	)
)
(6 Placing (19 19)
	(
		(Theme (15 15) ())
		(Agent (0 0) ())
		(Goal (23 23) (7))
	)
)
(7 Body_parts (23 23)
	(
		(Possessor (4 4) (0))
		(Body_part (11 11) ())
	)
)
(8 Body_parts (32 32)
	(
		(Body_part (32 32) ())
		(Possessor (31 31) ())
	)
)
(9 Perception_experience (26 26)
	(
		(Phenomenon (29 29) (10))
		(Perceiver_passive (0 0) ())
	)
)
(10 Perception_body (29 29)
	(
		(Body_part (32 32) (8))
		(Experiencer (0 0) ())
		(Degree (28 28) ())
	)
)
)
)
(
; story sentence text for lookup
("One time I ran out of gas." "Someone saw me." "He went to buy gas for me." "He told me to pay it forward." "I appreciated that.")
; events
(
(0 Substance (6 6)
	(
		(Substance (6 6) ())
	)
)
(1 Perception_experience (9 9)
	(
		(Phenomenon (10 10) ())
		(Perceiver_passive (8 8) ())
	)
)
(2 Motion (13 13)
	(
		(Theme (8 8) ())
		(Purpose (16 16) ())
	)
)
(3 Commerce_buy (15 15)
	(
		(Buyer (8 8) ())
		(Goods (16 16) ())
		(Imposed_purpose (18 18) ())
	)
)
(4 Telling (21 21)
	(
		(Speaker (8 8) ())
		(Addressee (10 10) ())
		(Message (25 25) ())
	)
)
(5 Judgment (29 29)
	(
		(Cognizer (8 8) ())
		(Evaluee (10 10) ())
	)
)
)
)
(
; story sentence text for lookup
("I am pretty weak." "I could not do one pull-up." "I tried every day for a month." "I started getting stronger." "I can now do 5 pull-ups.")
; events
(
(0 Level_of_force_exertion (3 3)
	(
		(Exerter (0 0) ())
		(Descriptor (2 2) ())
	)
)
(1 Possibility (6 6)
	(
		(Possible_event (0 0) ())
		(Possible_event (12 12) ())
	)
)
(2 Prevarication (10 12)
	(
		(Speaker (0 0) ())
	)
)
(3 Intentionally_act (8 8)
	(
		(Agent (0 0) ())
		(Act (12 12) ())
	)
)
(4 Frequency (16 16)
	(
		(Time_span (17 17) (7))
		(Event (14 14) ())
	)
)
(5 Attempt (15 15)
	(
		(Time (16 17) (4 7))
		(Agent (0 0) ())
		(Duration (20 20) (6))
	)
)
(6 Measure_duration (20 20)
	(
		(Count (19 19) ())
		(Unit (20 20) ())
	)
)
(7 Calendric_unit (17 17)
	(
		(Count (2 2) ())
		(Unit (17 17) ())
	)
)
(8 Transition_to_state (24 24)
	(
		(Entity (0 0) ())
		(Final_quality (17 17) (7))
	)
)
(9 Activity_start (23 23)
	(
		(Agent (0 0) ())
		(Activity (16 17) (4 7))
	)
)
(10 Level_of_force_resistance (25 25)
	(
		(Resisting_entity (0 0) ())
		(Degree (17 17) (7))
	)
)
(11 Temporal_collocation (29 29)
	(
		(Trajector_event (12 12) ())
		(Trajector_event (14 14) ())
	)
)
(12 Capability (28 28)
	(
		(Entity (0 0) ())
		(Event (12 12) ())
	)
)
(13 Intentionally_act (30 30)
	(
		(Agent (0 0) ())
		(Time (2 2) ())
		(Act (12 12) ())
	)
)
)
)
(
; story sentence text for lookup
("It was snowing outside Tom's house one day." "Tom liked playing in the snow." "Tom went outside." "Tom played in the snow." "Tom made a snowman.")
; events
(
(0 Precipitation (2 2)
	(
		(Precipitation (2 2) ())
		(Place (6 6) (3))
	)
)
(1 Calendric_unit (8 8)
	(
		(Unit (8 8) ())
		(Count (7 7) ())
	)
)
(2 Interior_profile_relation (3 3)
	(
		(Figure (0 0) ())
		(Ground (6 6) (3))
	)
)
(3 Buildings (6 6)
	(
		(Building (6 6) ())
	)
)
(4 Experiencer_focus (11 11)
	(
		(Experiencer (10 10) ())
		(Content (15 15) (5))
	)
)
(5 Precipitation (15 15)
	(
		(Precipitation (15 15) ())
	)
)
(6 Motion (18 18)
	(
		(Theme (10 10) ())
		(Goal (2 2) (0))
	)
)
(7 Precipitation (25 25)
	(
		(Precipitation (25 25) ())
	)
)
(8 Cooking_creation (28 28)
	(
		(Cook (10 10) ())
		(Place (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("The man smiled." "The woman noticed." "The woman smiled back." "The man did not notice." "The woman felt silly.")
; events
(
(0 Making_faces (2 2)
	(
		(Agent (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Becoming_aware (6 6)
	(
		(Cognizer (1 1) (1))
	)
)
(3 People (5 5)
	(
		(Person (1 1) (1))
	)
)
(4 Making_faces (10 10)
	(
		(Agent (1 1) (1))
	)
)
(5 People (9 9)
	(
		(Person (1 1) (1))
	)
)
(6 People (14 14)
	(
		(Person (1 1) (1))
	)
)
(7 Becoming_aware (17 17)
	(
		(Cognizer (1 1) (1))
	)
)
(8 Feeling (21 21)
	(
		(Emotional_state (22 22) ())
		(Experiencer (1 1) (1))
	)
)
(9 People (20 20)
	(
		(Person (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("I was walking back from the store." "It was a hot day." "A man gave me a ride the rest of the way." "He was a little rude to me." "I thanked him anyway.")
; events
(
(0 Self_motion (2 2)
	(
		(Self_mover (0 0) ())
		(Source (6 6) (1))
	)
)
(1 Businesses (6 6)
	(
		(Business (6 6) ())
	)
)
(2 Calendric_unit (12 12)
	(
		(Unit (12 12) ())
	)
)
(3 Ambient_temperature (11 11)
	(
		(Time (12 12) (2))
		(Attribute (11 11) ())
	)
)
(4 People (15 15)
	(
		(Person (15 15) ())
	)
)
(5 Social_interaction_evaluation (30 30)
	(
		(Degree (28 29) ())
		(Evaluee (0 0) ())
		(Affected_party (32 32) ())
	)
)
(6 Judgment_direct_address (35 35)
	(
		(Communicator (0 0) ())
		(Addressee (36 36) ())
	)
)
)
)
(
; story sentence text for lookup
("May and Nan are at play." "Nan will tell little May how to make a wall with blocks." "May's blocks are not spheres." "They have a name of their own." "This name is cube." "We call a block like May's a cube." "A cube has six sides." "It stands on one of its sides." "It cannot roll." "Cubes do not grow.")
; events
(
(0 Telling (9 9)
	(
		(Speaker (7 7) ())
		(Addressee (11 11) ())
		(Message (16 16) (3))
	)
)
(1 Building (14 14)
	(
		(Components (18 18) ())
		(Agent (11 11) ())
		(Created_entity (16 16) (3))
	)
)
(2 People_by_age (10 10)
	(
		(Person (11 11) ())
	)
)
(3 Architectural_part (16 16)
	(
		(Part (16 16) ())
	)
)
(4 Possession (28 28)
	(
		(Owner (7 7) ())
		(Possession (30 30) (5))
	)
)
(5 Being_named (30 30)
	(
		(Entity (7 7) ())
		(Name (33 33) ())
		(Name (30 30) ())
	)
)
(6 Being_named (36 36)
	(
		(Entity (7 7) ())
		(Name (30 30) (5))
	)
)
(7 Referring_by_name (41 41)
	(
		(Entity (43 43) ())
		(Speaker (7 7) ())
		(Name (48 48) (8))
	)
)
(8 Shapes (48 48)
	(
		(Shape (48 48) ())
	)
)
(9 Shapes (51 51)
	(
		(Shape (51 51) ())
	)
)
(10 Part_orientational (54 54)
	(
		(Part (11 11) ())
	)
)
(11 Cardinal_numbers (53 53)
	(
		(Entity (11 11) ())
		(Number (30 30) (5))
	)
)
(12 Body_movement (57 57)
	(
		(Agent (7 7) ())
		(Body_part (30 30) (5))
	)
)
(13 Part_orientational (62 62)
	(
		(Part (62 62) ())
		(Whole (61 61) ())
	)
)
(14 Capability (65 65)
	(
		(Entity (7 7) ())
		(Event (30 30) (5))
	)
)
(15 Moving_in_place (67 67)
	(
		(Theme (7 7) ())
	)
)
(16 Ontogeny (72 72)
	(
		(Entity (7 7) ())
	)
)
)
)
(
; story sentence text for lookup
("We were sitting at home tonight." "It was quiet." "My wife heard a buzzing sound." "I went and sat near where she heard the sound." "We heard nothing.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Posture (2 2)
	(
		(Time (5 5) (0))
		(Agent (0 0) ())
		(Point_of_contact (2 2) ())
		(Location (4 4) (2))
	)
)
(2 Buildings (4 4)
	(
		(Building (4 4) ())
	)
)
(3 Sound_level (9 9)
	(
		(Entity (0 0) ())
	)
)
(4 Location_of_light (15 15)
	(
		(Figure (5 5) (0))
	)
)
(5 Perception_experience (13 13)
	(
		(Phenomenon (16 16) (7))
		(Perceiver_passive (12 12) (6))
	)
)
(6 Personal_relationship (12 12)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (12 12) ())
	)
)
(7 Sensation (16 16)
	(
		(Descriptor (4 4) (2))
	)
)
(8 Posture (21 21)
	(
		(Agent (0 0) ())
		(Point_of_contact (21 21) ())
		(Location (24 24) ())
	)
)
(9 Sensation (27 27)
	(
		(Perceiver_passive (24 24) ())
		(Percept (27 27) ())
	)
)
(10 Motion (19 19)
	(
		(Theme (0 0) ())
		(Goal (24 24) ())
	)
)
(11 Gradable_proximity (22 22)
	(
		(Ground (24 24) ())
		(Figure (0 0) ())
	)
)
(12 Perception_experience (25 25)
	(
		(Perceiver_passive (24 24) ())
		(Phenomenon (27 27) (9))
	)
)
(13 Hearsay (30 30)
	(
		(Hearer (0 0) ())
		(Message (2 2) (1))
	)
)
)
)
(
; story sentence text for lookup
("The old cat can catch a mouse." "She has a mouse in her mouth." "What will she do with it?" "She will give it to her little kittens." "They will play with the mouse." "They are not afraid of it; but the mouse is afraid of the kittens.")
; events
(
(0 Age (1 1)
	(
		(Entity (2 2) ())
	)
)
(1 Subsisting (4 4)
	(
		(Entity (6 6) ())
		(Degree (2 2) ())
	)
)
(2 Capability (3 3)
	(
		(Entity (2 2) ())
		(Event (6 6) ())
	)
)
(3 Beyond_compare (9 9)
	(
		(Standard (11 11) ())
		(Standard (8 8) ())
		(Domain (6 6) ())
	)
)
(4 Body_parts (14 14)
	(
		(Possessor (13 13) ())
		(Body_part (14 14) ())
	)
)
(5 Intentionally_act (19 19)
	(
		(Means (21 21) ())
		(Act (8 8) ())
		(Agent (2 2) ())
	)
)
(6 Buildings (30 30)
	(
		(Name (30 30) ())
		(Creator (13 13) ())
	)
)
(7 Giving (25 25)
	(
		(Donor (8 8) ())
		(Theme (26 26) ())
		(Recipient (30 30) (6))
	)
)
(8 Size (29 29)
	(
		(Entity (30 30) (6))
	)
)
(9 Experiencer_focus (50 50)
	(
		(Content (53 53) ())
		(Experiencer (48 48) ())
	)
)
(10 Experiencer_focus (42 42)
	(
		(Content (21 21) ())
		(Experiencer (8 8) ())
	)
)
)
)
(
; story sentence text for lookup
("I was eating with my friends." "We were about to go to someone's house." "I was out of gas." "And I did not know the way." "They had to wait on me.")
; events
(
(0 Ingestion (2 2)
	(
		(Ingestor (0 0) ())
		(Manner (5 5) (1))
	)
)
(1 Personal_relationship (5 5)
	(
		(Partner_1 (5 5) ())
		(Partner_2 (4 4) ())
	)
)
(2 Motion (11 11)
	(
		(Goal (15 15) (3))
		(Theme (0 0) ())
	)
)
(3 Buildings (15 15)
	(
		(Building (15 15) ())
	)
)
(4 Substance (21 21)
	(
		(Substance (4 4) ())
	)
)
(5 Awareness (27 27)
	(
		(Content (29 29) (6))
		(Cognizer (24 24) ())
	)
)
(6 Means (29 29)
	(
		(Agent (24 24) ())
		(Means (29 29) ())
	)
)
(7 Required_event (32 33)
	(
		(Required_situation (0 0) ())
		(Required_situation (5 5) (1))
	)
)
(8 Waiting (34 34)
	(
		(Salient_entity (36 36) ())
		(Protagonist (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("I had gold earrings." "I wore them everyday." "Then they broke." "I was heartbroken." "Now I had nothing to wear.")
; events
(
(0 Substance (2 2)
	(
		(Substance (2 2) ())
	)
)
(1 Possession (1 1)
	(
		(Owner (0 0) ())
		(Possession (3 3) (2))
	)
)
(2 Accoutrements (3 3)
	(
		(Material (2 2) (0))
		(Accoutrement (3 3) ())
	)
)
(3 Wearing (6 6)
	(
		(Wearer (0 0) ())
		(Time (3 3) (2))
		(Clothing (2 2) (0))
	)
)
(4 Frequency (8 8)
	(
		(Event (5 5) ())
	)
)
(5 Emotion_directed (16 16)
	(
		(Experiencer (0 0) ())
	)
)
(6 Temporal_collocation (18 18)
	(
		(Trajector_event (19 19) ())
	)
)
(7 Possession (20 20)
	(
		(Owner (19 19) ())
		(Possession (21 21) ())
	)
)
(8 Wearing (23 23)
	(
		(Wearer (19 19) ())
		(Clothing (3 3) (2))
	)
)
)
)
(
; story sentence text for lookup
("The boy was home alone." "He thought he heard a noise." "He called his mom." "His mom told him to lock up the house." "That made the boy more afraid.")
; events
(
(0 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Buildings (3 3)
	(
		(Place (3 3) ())
		(Possessor (1 1) (0))
	)
)
(2 Awareness (7 7)
	(
		(Cognizer (6 6) ())
		(Content (8 8) ())
	)
)
(3 Perception_experience (9 9)
	(
		(Perceiver_passive (8 8) ())
		(Phenomenon (11 11) ())
	)
)
(4 Contacting (14 14)
	(
		(Addressee (16 16) (5))
		(Communicator (6 6) ())
	)
)
(5 Kinship (16 16)
	(
		(Ego (8 8) ())
		(Alter (3 3) (1))
	)
)
(6 Buildings (26 26)
	(
		(Building (26 26) ())
	)
)
(7 Request (20 20)
	(
		(Message (26 26) (6))
		(Addressee (3 3) (1))
		(Speaker (1 1) (0))
	)
)
(8 Kinship (19 19)
	(
		(Ego (6 6) ())
		(Alter (1 1) (0))
	)
)
(9 Causation (29 29)
	(
		(Affected (16 16) (5))
		(Cause (6 6) ())
		(Effect (11 11) ())
	)
)
(10 Experiencer_focus (33 33)
	(
		(Experiencer (16 16) (5))
		(Degree (32 32) ())
	)
)
(11 People_by_age (31 31)
	(
		(Person (3 3) (1))
	)
)
)
)
(
; story sentence text for lookup
("The man was playing poker." "He had a flush." "He went all in." "He got called with two pairs." "He won the hand.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Being_attached (21 21)
	(
		(Items (21 21) ())
	)
)
(2 Contacting (18 18)
	(
		(Addressee (16 16) ())
		(Depictive (21 21) (1))
	)
)
(3 Body_parts (26 26)
	(
		(Body_part (26 26) ())
	)
)
)
)
(
; story sentence text for lookup
("A little bird can not eat nuts." "He likes crumbs." "Squirrels have sharp teeth." "It is easy for them to eat nuts.")
; events
(
(0 Food (6 6)
	(
	)
)
(1 Size (1 1)
	(
		(Entity (2 2) ())
	)
)
(2 Capability (3 3)
	(
		(Entity (2 2) ())
		(Event (6 6) (0))
	)
)
(3 Ingestion (5 5)
	(
		(Ingestor (2 2) ())
		(Ingestibles (6 6) (0))
	)
)
(4 Experiencer_focus (9 9)
	(
		(Experiencer (8 8) ())
		(Content (2 2) ())
	)
)
(5 Part_piece (10 10)
	(
		(Piece (2 2) ())
	)
)
(6 Sharpness (14 14)
	(
		(Entity (15 15) (7))
	)
)
(7 Body_parts (15 15)
	(
		(Possessor (8 8) ())
		(Body_part (15 15) ())
		(Descriptor (2 2) ())
	)
)
(8 Possession (13 13)
	(
		(Owner (8 8) ())
		(Possession (15 15) (7))
	)
)
(9 Difficulty (19 19)
	(
		(Activity (24 24) (11))
		(Experiencer (21 21) ())
	)
)
(10 Ingestion (23 23)
	(
		(Ingestibles (24 24) (11))
		(Ingestor (21 21) ())
	)
)
(11 Food (24 24)
	(
	)
)
)
)
(
; story sentence text for lookup
("It is spring." "I am going to the field with papa." "My papa has two nice horses." "They can run fast." "I like to ride in the wagon with my papa." "I like the horses." "Jack will let me ride him." "I feed the horses every day." "We plant wheat and corn." "Wheat gives us flour and bread." "In the spring we plant the grain.")
; events
(
(0 Calendric_unit (2 2)
	(
		(Unit (2 2) ())
	)
)
(1 Motion (6 6)
	(
		(Theme (4 4) ())
		(Depictive (11 11) (3))
		(Goal (9 9) (2))
	)
)
(2 Locale_by_use (9 9)
	(
		(Locale (9 9) ())
	)
)
(3 Kinship (11 11)
	(
		(Alter (11 11) ())
	)
)
(4 Have_associated (15 15)
	(
		(Entity (9 9) (2))
		(Topical_entity (14 14) (5))
	)
)
(5 Kinship (14 14)
	(
		(Ego (4 4) ())
		(Alter (14 14) ())
	)
)
(6 Stimulus_focus (17 17)
	(
		(Stimulus (9 9) (2))
	)
)
(7 Self_motion (22 22)
	(
		(Self_mover (4 4) ())
		(Speed (23 23) (9))
	)
)
(8 Capability (21 21)
	(
		(Event (22 23) (7 9))
		(Entity (4 4) ())
	)
)
(9 Speed_description (23 23)
	(
		(Entity (4 4) ())
	)
)
(10 Kinship (34 34)
	(
		(Alter (34 34) ())
		(Ego (33 33) ())
	)
)
(11 Experiencer_focus (26 26)
	(
		(Experiencer (4 4) ())
		(Content (31 31) (13))
	)
)
(12 Operate_vehicle (28 28)
	(
		(Driver (4 4) ())
		(Depictive (34 34) (10))
		(Vehicle (31 31) (13))
	)
)
(13 Vehicle (31 31)
	(
		(Vehicle (31 31) ())
	)
)
(14 Experiencer_focus (37 37)
	(
		(Experiencer (4 4) ())
		(Content (22 23) (7 9))
	)
)
(15 Preventing_or_letting (43 43)
	(
		(Potential_hindrance (4 4) ())
		(Event (9 9) (2))
	)
)
(16 Operate_vehicle (45 45)
	(
		(Vehicle (9 9) (2))
		(Driver (23 23) (9))
	)
)
(17 Ingestion (49 49)
	(
		(Ingestor (4 4) ())
		(Ingestibles (22 23) (7 9))
	)
)
(18 Frequency (52 52)
	(
		(Time_span (9 9) (2))
		(Event (48 48) ())
	)
)
(19 Calendric_unit (53 53)
	(
		(Unit (9 9) (2))
	)
)
(20 Food (57 57)
	(
		(Food (2 2) (0))
	)
)
(21 Placing (56 56)
	(
		(Agent (4 4) ())
		(Theme (57 57) (20))
	)
)
(22 Food (59 59)
	(
	)
)
(23 Giving (62 62)
	(
		(Theme (9 9) (2))
		(Recipient (2 2) (0))
		(Donor (4 4) ())
	)
)
(24 Food (66 66)
	(
	)
)
(25 Temporal_collocation (68 68)
	(
		(Landmark_period (70 70) (26))
		(Trajector_event (71 71) ())
	)
)
(26 Calendric_unit (70 70)
	(
		(Unit (2 2) (0))
	)
)
(27 Planting (72 72)
	(
		(Theme (74 74) ())
		(Time (70 70) (26))
		(Agent (23 23) (9))
	)
)
)
)
(
; story sentence text for lookup
("Oran bought binoculars." "He took them outside." "He saw birds." "He watched them." "They became his friends.")
; events
(
(0 Commerce_buy (1 1)
	(
		(Goods (2 2) ())
		(Buyer (0 0) ())
	)
)
(1 Bringing (5 5)
	(
		(Agent (0 0) ())
		(Theme (2 2) ())
		(Goal (7 7) ())
	)
)
(2 Perception_experience (10 10)
	(
		(Phenomenon (2 2) ())
		(Perceiver_passive (0 0) ())
	)
)
(3 Perception_active (14 14)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (2 2) ())
	)
)
(4 Becoming (18 18)
	(
		(Final_category (19 20) (5))
		(Entity (0 0) ())
	)
)
(5 Personal_relationship (20 20)
	(
		(Partner_1 (0 0) ())
		(Partner_2 (2 2) ())
	)
)
)
)
(
; story sentence text for lookup
("The cat walked into the living room." "There was a ball on the floor." "The cat swatted the ball around." "The cat played with the ball." "The cat liked the ball.")
; events
(
(0 Building_subparts (5 6)
	(
		(Building_part (6 6) ())
	)
)
(1 Self_motion (2 2)
	(
		(Goal (6 6) ())
		(Self_mover (1 1) ())
	)
)
(2 Spatial_contact (12 12)
	(
		(Figure (10 11) ())
		(Ground (6 6) ())
	)
)
(3 Architectural_part (14 14)
	(
		(Part (14 14) ())
	)
)
(4 Existence (8 9)
	(
		(Entity (10 11) ())
		(Place (14 14) (3))
	)
)
(5 Cause_motion (18 18)
	(
		(Theme (20 20) ())
		(Goal (21 21) ())
		(Agent (1 1) ())
	)
)
(6 Perception_experience (25 25)
	(
		(Body_part (28 28) (7))
		(Perceiver_passive (1 1) ())
	)
)
(7 Containers (28 28)
	(
		(Container (21 21) ())
	)
)
(8 Experiencer_focus (32 32)
	(
		(Content (20 20) ())
		(Experiencer (1 1) ())
	)
)
(9 Shapes (34 34)
	(
		(Shape (34 34) ())
	)
)
)
)
(
; story sentence text for lookup
("This is my dog Jip." "Jip is a black-and-white dog." "He sits and looks at me." "He has a hat on his head." "Has Jip a hat?" "No; he has my hat." "Jip, Jip, that is my hat." "Jip, give me my hat.")
; events
(
(0 Animals (3 3)
	(
		(Animal (4 4) ())
		(Descriptor (2 2) ())
	)
)
(1 Color (13 13)
	(
		(Color (13 13) ())
		(Color (9 9) (2))
		(Entity (14 14) (3))
	)
)
(2 Color (9 9)
	(
		(Color (9 9) ())
		(Entity (14 14) (3))
	)
)
(3 Animals (14 14)
	(
		(Animal (14 14) ())
		(Descriptor (9 13) (1 2))
		(Animal (6 6) ())
	)
)
(4 Posture (17 17)
	(
		(Point_of_contact (17 17) ())
		(Agent (6 6) ())
	)
)
(5 Perception_active (19 19)
	(
		(Perceiver_agentive (6 6) ())
		(Phenomenon (21 21) ())
	)
)
(6 Wearing (24 24)
	(
		(Clothing (26 26) (8))
		(Wearer (6 6) ())
		(Body_part (21 21) ())
	)
)
(7 Body_parts (29 29)
	(
		(Possessor (28 28) ())
		(Body_part (29 29) ())
	)
)
(8 Accoutrements (26 26)
	(
		(Body_location (21 21) ())
		(Accoutrement (9 9) (2))
	)
)
(9 Possession (31 31)
	(
		(Possession (34 34) (10))
	)
)
(10 Accoutrements (34 34)
	(
		(Accoutrement (9 9) (2))
	)
)
(11 Accoutrements (41 41)
	(
		(Accoutrement (28 28) ())
		(Wearer (4 4) ())
	)
)
(12 Possession (39 39)
	(
		(Possession (41 41) (11))
		(Owner (2 2) ())
	)
)
(13 Accoutrements (50 50)
	(
		(Wearer (29 29) (7))
		(Accoutrement (13 13) (1))
	)
)
(14 Giving (54 54)
	(
		(Theme (41 41) (11))
		(Recipient (9 9) (2))
	)
)
(15 Accoutrements (57 57)
	(
		(Accoutrement (28 28) ())
		(Wearer (4 4) ())
	)
)
)
)
(
; story sentence text for lookup
("The man was in the dark." "He looked for a flashlight." "He could not find one." "He became frightened." "The power came back on in five minutes.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Scrutiny (8 8)
	(
		(Cognizer (7 7) ())
		(Phenomenon (11 11) ())
	)
)
(2 Locating (16 16)
	(
		(Perceiver (7 7) ())
		(Sought_entity (17 17) ())
	)
)
(3 Becoming (20 20)
	(
		(Entity (7 7) ())
		(Final_quality (21 21) (4))
	)
)
(4 Emotion_directed (21 21)
	(
		(Experiencer (7 7) ())
	)
)
(5 Electricity (24 24)
	(
		(Electricity (1 1) (0))
	)
)
(6 Calendric_unit (30 30)
	(
		(Unit (30 30) ())
		(Count (29 29) ())
	)
)
)
)
(
; story sentence text for lookup
("Ann was at home sick." "Her friend Sally came to visit." "They played together." "Sally got sick from Ann." "Now Ann comes to visit Sally.")
; events
(
(0 Locative_relation (2 3)
	(
		(Figure (0 0) ())
		(Figure (4 4) (1))
		(Ground (3 3) ())
	)
)
(1 Biological_urge (4 4)
	(
		(Experiencer (0 0) ())
	)
)
(2 Personal_relationship (7 7)
	(
		(Partner_1 (8 8) ())
		(Partner_2 (0 0) ())
	)
)
(3 Arriving (9 9)
	(
		(Theme (7 7) (2))
		(Goal (10 11) (4))
	)
)
(4 Visiting (11 11)
	(
		(Agent (7 7) (2))
	)
)
(5 Participation (14 15)
	(
		(Participants (0 0) ())
	)
)
(6 Transition_to_state (18 18)
	(
		(Final_quality (21 21) ())
		(Final_quality (8 8) ())
		(Entity (0 0) ())
	)
)
(7 Medical_conditions (19 19)
	(
		(Cause (21 21) ())
		(Patient (0 0) ())
	)
)
(8 Arriving (25 25)
	(
		(Time (0 0) ())
		(Theme (24 24) ())
		(Goal (28 28) ())
	)
)
(9 Visiting (27 27)
	(
		(Entity (28 28) ())
		(Agent (24 24) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom bought a new car." "It was a very fast car." "He thought the car was made to be driven fast." "He drove the car fast." "He had a great time.")
; events
(
(0 Commerce_buy (1 1)
	(
		(Buyer (0 0) ())
		(Goods (4 4) (1))
	)
)
(1 Vehicle (4 4)
	(
		(Vehicle (4 4) ())
		(Descriptor (3 3) (2))
	)
)
(2 Age (3 3)
	(
		(Entity (4 4) (1))
		(Age (3 3) ())
	)
)
(3 Vehicle (11 11)
	(
		(Vehicle (11 11) ())
		(Descriptor (9 10) (4))
	)
)
(4 Speed_description (10 10)
	(
		(Entity (11 11) (3))
		(Degree (3 3) (2))
	)
)
(5 Building (18 18)
	(
		(Created_entity (15 16) (7))
		(Purpose (19 22) (6 8))
	)
)
(6 Operate_vehicle (21 21)
	(
		(Vehicle (15 16) (7))
		(Speed (22 22) (8))
	)
)
(7 Vehicle (16 16)
	(
		(Vehicle (3 3) (2))
	)
)
(8 Level_of_force_resistance (22 22)
	(
		(Resisting_entity (15 21) (5 6 7))
	)
)
(9 Awareness (14 14)
	(
		(Cognizer (0 0) ())
		(Content (15 22) (5 6 7 8))
	)
)
(10 Operate_vehicle (25 25)
	(
		(Speed (4 4) (1))
		(Driver (0 0) ())
		(Vehicle (15 16) (7))
	)
)
(11 Vehicle (27 27)
	(
		(Vehicle (3 3) (2))
	)
)
(12 Desirability (33 33)
	(
		(Evaluee (4 4) (1))
	)
)
)
)
(
; story sentence text for lookup
("Come here, girls!" "I see a nest." "Little birds are in it." "One, two, three." "The little birds cannot fly." "They are not pretty." "They will get pretty by and by." "The big bird is not here now." "She is high in the apple tree." "She will come to them by and by." "She will come and feed them.")
; events
(
(0 People (3 3)
	(
		(Person (3 3) ())
	)
)
(1 Perception_experience (6 6)
	(
		(Phenomenon (8 8) ())
		(Perceiver_passive (5 5) ())
	)
)
(2 Size (10 10)
	(
		(Entity (11 11) ())
	)
)
(3 Interior_profile_relation (13 13)
	(
		(Figure (11 11) ())
		(Ground (14 14) ())
	)
)
(4 Capability (25 25)
	(
		(Entity (24 24) ())
		(Event (26 27) (5))
	)
)
(5 Self_motion (27 27)
	(
		(Self_mover (24 24) ())
	)
)
(6 Aesthetics (32 32)
	(
		(Entity (5 5) ())
	)
)
(7 Transition_to_state (36 36)
	(
		(Entity (5 5) ())
		(Transitional_period (38 40) ())
		(Final_quality (3 3) (0))
	)
)
(8 Size (43 43)
	(
		(Entity (44 44) ())
	)
)
(9 Temporal_collocation (48 48)
	(
		(Trajector_event (44 44) ())
	)
)
(10 Locative_relation (47 47)
	(
		(Figure (24 24) ())
	)
)
(11 Measurable_attributes (52 52)
	(
		(Entity (5 5) ())
		(Degree (44 44) ())
		(Circumstances (56 56) ())
	)
)
(12 Arriving (60 60)
	(
		(Theme (5 5) ())
		(Goal (62 62) ())
		(Manner (63 65) ())
	)
)
(13 Arriving (69 69)
	(
		(Theme (5 5) ())
	)
)
)
)
(
; story sentence text for lookup
("It was the girl's first day at school." "She was very nervous." "She went into the classroom." "She saw her friend." "She sat next to her friend.")
; events
(
(0 Calendric_unit (6 6)
	(
		(Unit (6 6) ())
	)
)
(1 Ordinal_numbers (5 5)
	(
		(Item (6 6) (0))
	)
)
(2 People (3 3)
	(
		(Person (3 3) ())
	)
)
(3 Locale_by_use (8 8)
	(
		(Locale (8 8) ())
	)
)
(4 Experiencer_focus (13 13)
	(
		(Experiencer (10 10) ())
		(Degree (12 12) ())
	)
)
(5 Motion (16 16)
	(
		(Theme (10 10) ())
		(Goal (19 19) (6))
	)
)
(6 Building_subparts (19 19)
	(
	)
)
(7 Personal_relationship (24 24)
	(
		(Partner_2 (12 12) ())
		(Partner_1 (3 3) (2))
	)
)
(8 Adjacency (28 29)
	(
		(Ground (31 31) (10))
		(Figure (10 10) ())
	)
)
(9 Posture (27 27)
	(
		(Agent (10 10) ())
		(Location (31 31) (10))
		(Point_of_contact (27 27) ())
	)
)
(10 Personal_relationship (31 31)
	(
		(Partner_1 (31 31) ())
		(Partner_2 (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("The cats are on the steps." "One cat is sitting on the steps." "One cat is lying on the steps." "Is the black cat lying on the mat?" "No; it is the white one." "The black one is sitting near the white one.")
; events
(
(0 Spatial_contact (3 3)
	(
		(Ground (5 5) (1))
		(Figure (1 1) ())
	)
)
(1 Self_motion (5 5)
	(
		(Self_mover (1 1) ())
	)
)
(2 Cardinal_numbers (7 7)
	(
		(Number (7 7) ())
		(Entity (8 8) ())
	)
)
(3 Connecting_architecture (13 13)
	(
		(Part (13 13) ())
	)
)
(4 Posture (10 10)
	(
		(Location (13 13) (3))
		(Point_of_contact (10 10) ())
		(Agent (1 1) ())
	)
)
(5 Spatial_contact (19 19)
	(
		(Ground (21 21) (7))
		(Figure (1 1) ())
	)
)
(6 Posture (18 18)
	(
		(Point_of_contact (10 10) (4))
		(Location (13 13) (3))
		(Agent (1 1) ())
	)
)
(7 Connecting_architecture (21 21)
	(
		(Part (13 13) (3))
	)
)
(8 Posture (27 27)
	(
		(Point_of_contact (27 27) ())
		(Location (30 30) ())
		(Agent (26 26) ())
	)
)
(9 Color (25 25)
	(
		(Color (25 25) ())
		(Entity (10 10) (4))
	)
)
(10 Color (37 37)
	(
		(Color (37 37) ())
		(Entity (13 13) (3))
	)
)
(11 Color (41 41)
	(
		(Entity (25 25) (9))
		(Color (8 8) ())
	)
)
(12 Posture (44 44)
	(
		(Agent (42 42) ())
		(Location (48 48) ())
		(Point_of_contact (27 27) (8))
	)
)
(13 Color (47 47)
	(
		(Entity (48 48) ())
		(Color (47 47) ())
	)
)
)
)
(
; story sentence text for lookup
("The cow fell asleep." "A man went up to the cow." "He pushed the cow." "The cow fell over." "The cow died.")
; events
(
(0 Sleep (3 3)
	(
		(Sleeper (1 1) ())
	)
)
(1 Motion_directional (2 2)
	(
		(Depictive (3 3) (0))
		(Theme (1 1) ())
	)
)
(2 Motion (7 7)
	(
		(Goal (11 11) ())
		(Direction (3 3) (0))
		(Theme (1 1) ())
	)
)
(3 People (6 6)
	(
		(Person (6 6) ())
	)
)
(4 Cause_motion (14 14)
	(
		(Agent (13 13) ())
		(Theme (16 16) ())
	)
)
(5 Motion_directional (20 20)
	(
		(Theme (1 1) ())
		(Goal (3 3) (0))
		(Direction (20 20) ())
	)
)
(6 Death (25 25)
	(
		(Protagonist (1 1) ())
	)
)
)
)
(
; story sentence text for lookup
("Charles was playing football." "He went out for a pass." "He caught the ball." "But he landed on a window." "He had to let his arm heal.")
; events
(
(0 Competition (2 2)
	(
		(Participants (0 0) ())
		(Competition (3 3) (1))
	)
)
(1 Dynamism (3 3)
	(
		(Action (3 3) ())
	)
)
(2 Impact (19 19)
	(
		(Impactor (18 18) ())
		(Impactee (22 22) (3))
	)
)
(3 Connecting_architecture (22 22)
	(
		(Part (22 22) ())
	)
)
(4 Required_event (25 25)
	(
		(Required_situation (0 0) ())
		(Required_situation (29 29) (5))
	)
)
(5 Body_parts (29 29)
	(
		(Body_part (22 22) (3))
		(Possessor (28 28) ())
	)
)
(6 Recovery (30 30)
	(
		(Body_part (29 29) (5))
	)
)
)
)
(
; story sentence text for lookup
("This is Fred and Nell." "Fred has a little wagon." "Nell likes to ride in the wagon." "Fred says, Come, Nell, and I will take you for a ride." "Nell says, Thank yon, Fred, I will come." "I like to ride in your little wagon." "Away they go!" "See how fast Fred can run!" "Nell says, O, Fred, stop!" "stop!" "Do not run so fast." "I do not like to ride so fast.")
; events
(
(0 Containers (10 10)
	(
		(Container (10 10) ())
	)
)
(1 Possession (7 7)
	(
		(Owner (6 6) ())
		(Possession (10 10) (0))
	)
)
(2 Experiencer_focus (13 13)
	(
		(Experiencer (6 6) ())
		(Content (18 18) (3))
	)
)
(3 Containers (18 18)
	(
		(Container (18 18) ())
	)
)
(4 Operate_vehicle (15 15)
	(
		(Driver (6 6) ())
		(Vehicle (18 18) (3))
	)
)
(5 Bringing (30 30)
	(
		(Agent (28 28) ())
		(Theme (31 31) ())
		(Explanation (34 34) (7))
	)
)
(6 Statement (21 21)
	(
		(Message (28 28) ())
		(Speaker (6 6) ())
	)
)
(7 Ride_vehicle (34 34)
	(
		(Theme (31 31) ())
	)
)
(8 Arriving (46 46)
	(
		(Theme (28 28) ())
	)
)
(9 Statement (37 37)
	(
		(Speaker (6 6) ())
		(Message (40 40) ())
	)
)
(10 Judgment_direct_address (39 39)
	(
		(Addressee (10 10) (0))
	)
)
(11 Containers (55 55)
	(
		(Container (55 55) ())
		(Owner (53 53) ())
	)
)
(12 Experiencer_focus (49 49)
	(
		(Experiencer (6 6) ())
		(Content (55 55) (11))
	)
)
(13 Operate_vehicle (51 51)
	(
		(Driver (6 6) ())
		(Vehicle (55 55) (11))
	)
)
(14 Motion (59 59)
	(
		(Theme (58 58) ())
		(Goal (6 6) ())
	)
)
(15 Self_motion (66 66)
	(
		(Speed (62 63) (17))
		(Self_mover (64 64) ())
	)
)
(16 Perception_experience (61 61)
	(
		(Phenomenon (64 64) ())
	)
)
(17 Speed_description (63 63)
	(
		(Degree (58 58) ())
		(Entity (64 64) ())
	)
)
(18 Capability (65 65)
	(
		(Event (62 63) (17))
		(Event (53 53) ())
		(Entity (64 64) ())
	)
)
(19 Activity_stop (75 75)
	(
		(Agent (71 73) ())
	)
)
(20 Statement (69 69)
	(
		(Message (71 76) (19))
		(Speaker (6 6) ())
	)
)
(21 Activity_stop (77 77)
	(
	)
)
(22 Self_motion (81 81)
	(
		(Manner (82 83) (23))
	)
)
(23 Speed_description (83 83)
	(
		(Entity (81 81) (22))
		(Degree (64 64) ())
	)
)
(24 Operate_vehicle (90 90)
	(
		(Driver (6 6) ())
		(Manner (91 92) (26))
	)
)
(25 Experiencer_focus (88 88)
	(
		(Experiencer (6 6) ())
		(Content (55 55) (11))
	)
)
(26 Speed_description (92 92)
	(
		(Entity (6 6) ())
		(Degree (18 18) (3))
	)
)
)
)
(
; story sentence text for lookup
("Did the boys swing their hats and cheer?" "This morning there were many boys and girls on the hill." "They had their sleds with them." "The snow on the hill was just right, and they had fine sport." "How the boys did swing their hats and cheer!" "They did this when the little girls were ahead." "When the boys were ahead, the girls said,— Ho, ho!" "There they go; Over the ice and over the snow.")
; events
(
(0 Accoutrements (5 5)
	(
		(Accoutrement (5 5) ())
		(Wearer (4 4) ())
	)
)
(1 People_by_age (2 2)
	(
		(Person (2 2) ())
	)
)
(2 Desirability (7 7)
	(
		(Evaluee (2 2) (1))
	)
)
(3 Body_movement (3 3)
	(
		(Agent (2 2) (1))
		(Body_part (5 5) (0))
	)
)
(4 People_by_age (14 14)
	(
		(Person (5 5) (0))
	)
)
(5 Quantified_mass (13 13)
	(
		(Quantity (4 4) ())
		(Individuals (14 16) (4 10))
	)
)
(6 Spatial_contact (17 17)
	(
		(Figure (13 16) (4 5 10))
		(Ground (19 19) (7))
	)
)
(7 Natural_features (19 19)
	(
		(Locale (19 19) ())
	)
)
(8 Existence (11 12)
	(
		(Place (19 19) (7))
		(Entity (13 16) (4 5 10))
		(Time (9 10) (9))
	)
)
(9 Calendric_unit (10 10)
	(
		(Relative_time (9 9) ())
		(Unit (10 10) ())
	)
)
(10 People (16 16)
	(
		(Person (16 16) ())
	)
)
(11 Animals (24 24)
	(
		(Descriptor (2 2) (1))
		(Animal (24 24) ())
	)
)
(12 Spatial_contact (30 30)
	(
		(Ground (32 32) (14))
		(Figure (9 10) (9))
	)
)
(13 Precipitation (29 29)
	(
		(Precipitation (10 10) (9))
		(Place (32 32) (14))
	)
)
(14 Natural_features (32 32)
	(
		(Locale (4 4) ())
	)
)
(15 Desirability (40 40)
	(
		(Evaluee (41 41) ())
	)
)
(16 People_by_age (45 45)
	(
		(Person (2 2) (1))
	)
)
(17 Accoutrements (49 49)
	(
		(Accoutrement (49 49) ())
		(Wearer (5 5) (0))
	)
)
(18 Cause_motion (47 47)
	(
		(Agent (2 2) (1))
		(Theme (49 49) (17))
	)
)
(19 Stimulus_focus (51 51)
	(
		(Stimulus (2 2) (1))
	)
)
(20 Intentionally_act (54 54)
	(
		(Agent (9 9) ())
		(Act (2 2) (1))
		(Time (59 59) (22))
	)
)
(21 Size (58 58)
	(
		(Entity (49 49) (17))
	)
)
(22 People (59 59)
	(
		(Persistent_characteristic (5 5) (0))
		(Person (49 49) (17))
	)
)
(23 People (70 70)
	(
		(Person (16 16) (10))
	)
)
(24 People_by_age (65 65)
	(
		(Person (2 2) (1))
	)
)
(25 Non-gradable_proximity (67 67)
	(
		(Figure (2 2) (1))
	)
)
(26 Statement (71 71)
	(
		(Speaker (70 70) (23))
		(Message (73 77) ())
		(Time (65 65) (24))
	)
)
(27 Precipitation (88 88)
	(
		(Precipitation (19 19) (7))
	)
)
(28 Substance (84 84)
	(
		(Substance (49 49) (17))
	)
)
)
)
(
; story sentence text for lookup
("Come with me, and see the boys." "One little boy has a drum." "Two boys have big hats." "One boy has a ball.")
; events
(
(0 People_by_age (7 7)
	(
		(Person (7 7) ())
	)
)
(1 Touring (5 5)
	(
		(Attraction (7 7) (0))
	)
)
(2 Cardinal_numbers (9 9)
	(
		(Number (9 9) ())
		(Entity (11 11) (3))
	)
)
(3 People_by_age (11 11)
	(
		(Person (11 11) ())
		(Persistent_characteristic (10 10) (4))
	)
)
(4 Size (10 10)
	(
		(Entity (11 11) (3))
	)
)
(5 Possession (12 12)
	(
		(Possession (14 14) ())
		(Owner (11 11) (3))
	)
)
(6 Accoutrements (20 20)
	(
		(Accoutrement (20 20) ())
		(Descriptor (19 19) (9))
	)
)
(7 Possession (18 18)
	(
		(Possession (20 20) (6))
		(Owner (17 17) (8))
	)
)
(8 People_by_age (17 17)
	(
		(Person (10 10) (4))
	)
)
(9 Size (19 19)
	(
		(Entity (20 20) (6))
	)
)
(10 People_by_age (23 23)
	(
		(Person (10 10) (4))
	)
)
(11 Body_parts (26 26)
	(
		(Body_part (20 20) (6))
		(Possessor (17 17) (8))
	)
)
)
)
(
; story sentence text for lookup
("The hen will run at the cat.")
; events
(
(0 Animals (6 6)
	(
		(Animal (6 6) ())
	)
)
(1 Self_motion (3 3)
	(
		(Path (6 6) (0))
		(Self_mover (1 1) ())
	)
)
)
)
(
; story sentence text for lookup
("The man played his guitar." "He found something he liked." "He wrote it down." "He built off of it." "He wrote a pretty good song.")
; events
(
(0 Cause_to_make_noise (2 2)
	(
		(Sound_maker (4 4) (2))
		(Agent (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Noise_makers (4 4)
	(
		(Noise_maker (4 4) ())
		(Type (3 3) ())
	)
)
(3 Experiencer_focus (10 10)
	(
		(Content (8 8) ())
		(Experiencer (3 3) ())
	)
)
(4 Locating (7 7)
	(
		(Perceiver (6 6) ())
		(Sought_entity (8 8) ())
	)
)
(5 Text_creation (13 15)
	(
		(Author (6 6) ())
		(Text (8 8) ())
	)
)
(6 Building (18 18)
	(
		(Agent (6 6) ())
		(Components (8 8) ())
	)
)
(7 Text (28 28)
	(
		(Text (28 28) ())
		(Descriptor (4 4) (2))
	)
)
(8 Text_creation (24 24)
	(
		(Author (6 6) ())
		(Text (28 28) (7))
	)
)
(9 Desirability (27 27)
	(
		(Evaluee (28 28) (7))
		(Degree (3 3) ())
	)
)
)
)
(
; story sentence text for lookup
("Kris lost her job." "She was sad at first." "She looked for a new job." "She got an interview." "Kris got a new job!")
; events
(
(0 Earnings_and_losses (1 1)
	(
		(Earnings (3 3) (1))
		(Earner (0 0) ())
	)
)
(1 Being_employed (3 3)
	(
		(Employee (2 2) ())
	)
)
(2 Emotion_directed (7 7)
	(
		(Experiencer (0 0) ())
	)
)
(3 Being_employed (16 16)
	(
		(Type (15 15) (5))
	)
)
(4 Seeking (12 12)
	(
		(Cognizer_agent (0 0) ())
		(Sought_entity (16 16) (3))
	)
)
(5 Age (15 15)
	(
		(Entity (16 16) (3))
		(Age (15 15) ())
	)
)
(6 Have_associated (24 24)
	(
		(Topical_entity (0 0) ())
		(Entity (27 27) (7))
	)
)
(7 Being_employed (27 27)
	(
		(Employee (0 0) ())
	)
)
(8 Age (26 26)
	(
		(Entity (15 15) (5))
		(Age (26 26) ())
	)
)
)
)
(
; story sentence text for lookup
("Last night I was super tired." "I really wanted to sleep." "But I could not." "So i stayed awake." "It was torture.")
; events
(
(0 Calendric_unit (1 1)
	(
		(Relative_time (0 0) ())
		(Unit (1 1) ())
	)
)
(1 Biological_urge (5 5)
	(
		(Experiencer (2 2) ())
		(Degree (4 4) ())
	)
)
(2 Desiring (9 9)
	(
		(Experiencer (0 0) ())
		(Degree (1 1) (0))
		(Event (10 11) (3))
	)
)
(3 Sleep (11 11)
	(
		(Sleeper (0 0) ())
	)
)
(4 State_continue (20 20)
	(
		(State (21 21) ())
		(Entity (1 1) (0))
	)
)
(5 Cause_harm (25 25)
	(
	)
)
)
)
(
; story sentence text for lookup
("The man looked into the window of the house." "He saw a woman inside." "He watched the woman." "The woman noticed him watching." "She called the police.")
; events
(
(0 Buildings (8 8)
	(
		(Building (8 8) ())
	)
)
(1 Perception_active (2 2)
	(
		(Direction (5 5) (3))
		(Perceiver_agentive (1 1) (2))
	)
)
(2 People (1 1)
	(
		(Person (1 1) ())
	)
)
(3 Connecting_architecture (5 5)
	(
		(Whole (8 8) (0))
		(Part (5 5) ())
	)
)
(4 Perception_experience (11 11)
	(
		(Phenomenon (13 13) (6))
		(Perceiver_passive (10 10) ())
		(State (14 14) (5))
	)
)
(5 Interior_profile_relation (14 14)
	(
		(Figure (13 13) (6))
	)
)
(6 People (13 13)
	(
		(Person (13 13) ())
	)
)
(7 Perception_active (17 17)
	(
		(Phenomenon (13 13) (6))
		(Perceiver_agentive (10 10) ())
	)
)
(8 People (19 19)
	(
		(Person (13 13) (6))
	)
)
(9 Becoming_aware (23 23)
	(
		(Phenomenon (14 14) (5))
		(Phenomenon (13 13) (6))
		(Cognizer (1 1) (2))
	)
)
(10 People (22 22)
	(
		(Person (1 1) (2))
	)
)
(11 Perception_active (25 25)
	(
		(Perceiver_agentive (13 13) (6))
		(Perceiver_agentive (1 1) (2))
	)
)
(12 Contacting (28 28)
	(
		(Addressee (13 13) (6))
		(Communicator (10 10) ())
	)
)
(13 Law_enforcement_agency (30 30)
	(
		(Agency (13 13) (6))
	)
)
)
)
(
; story sentence text for lookup
("Toni had a cat." "She loved the cat." "One day it got caught in the tree." "Toni got mad." "She looked for it and tried to get it.")
; events
(
(0 Animals (3 3)
	(
		(Descriptor (0 0) ())
		(Animal (3 3) ())
	)
)
(1 Experiencer_focus (6 6)
	(
		(Content (8 8) (2))
		(Experiencer (0 0) ())
	)
)
(2 Animals (8 8)
	(
		(Animal (3 3) (0))
	)
)
(3 Calendric_unit (11 11)
	(
		(Count (0 0) ())
		(Unit (11 11) ())
	)
)
(4 Emotion_directed (21 21)
	(
		(Experiencer (0 0) ())
	)
)
(5 Transition_to_state (20 20)
	(
		(Entity (0 0) ())
		(Final_quality (21 21) (4))
	)
)
(6 Seeking (24 24)
	(
		(Sought_entity (8 8) (2))
		(Cognizer_agent (0 0) ())
	)
)
(7 Attempt (28 28)
	(
		(Agent (0 0) ())
		(Goal (31 31) ())
	)
)
(8 Getting (30 30)
	(
		(Theme (31 31) ())
		(Recipient (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Frank and little May are in the field with the wagon." "They have come to find flowers." "May has a red flower." "Frank has three yellow flowers." "He will let May have them." "She will take them to the wagon." "She is glad to get the pretty flowers.")
; events
(
(0 Size (2 2)
	(
		(Entity (3 3) ())
	)
)
(1 Interior_profile_relation (5 5)
	(
		(Figure (0 0) ())
		(Ground (7 7) (3))
		(Direction (10 10) (2))
	)
)
(2 Containers (10 10)
	(
		(Container (10 10) ())
	)
)
(3 Locale_by_use (7 7)
	(
		(Locale (7 7) ())
	)
)
(4 Arriving (14 14)
	(
		(Theme (12 12) ())
		(Goal (17 17) ())
	)
)
(5 Becoming_aware (16 16)
	(
		(Cognizer (12 12) ())
		(Phenomenon (17 17) ())
	)
)
(6 Part_piece (23 23)
	(
		(Piece (23 23) ())
		(Piece_prop (3 3) ())
	)
)
(7 Color (22 22)
	(
		(Entity (23 23) (6))
		(Color (3 3) ())
	)
)
(8 Cardinal_numbers (27 27)
	(
		(Number (27 27) ())
		(Entity (29 29) ())
	)
)
(9 Possession (26 26)
	(
		(Owner (12 12) ())
		(Possession (29 29) ())
	)
)
(10 Color (28 28)
	(
		(Entity (23 23) (6))
		(Color (3 3) ())
	)
)
(11 Dominate_competitor (33 35)
	(
		(Manner (36 36) ())
		(Agent (12 12) ())
		(Agent (3 3) ())
	)
)
(12 Bringing (40 40)
	(
		(Agent (12 12) ())
		(Goal (44 44) (13))
		(Theme (3 3) ())
	)
)
(13 Containers (44 44)
	(
		(Container (44 44) ())
	)
)
(14 Emotions_by_stimulus (48 48)
	(
		(Experiencer (12 12) ())
		(Stimulus (53 53) ())
	)
)
(15 Getting (50 50)
	(
		(Recipient (12 12) ())
		(Theme (53 53) ())
	)
)
(16 Aesthetics (52 52)
	(
		(Entity (7 7) (3))
	)
)
)
)
(
; story sentence text for lookup
("John asked Tom to be his best man." "They met in grade school." "They spent the rest of their school years together." "They were always together." "They are best friends.")
; events
(
(0 Request (1 1)
	(
		(Speaker (0 0) ())
		(Addressee (2 2) ())
		(Message (3 7) (1 2))
	)
)
(1 People (7 7)
	(
		(Descriptor (5 5) ())
		(Descriptor (6 6) (2))
		(Person (7 7) ())
	)
)
(2 Desirability (6 6)
	(
		(Evaluee (7 7) (1))
	)
)
(3 Make_acquaintance (10 10)
	(
		(Individuals (0 0) ())
		(Place (13 13) (4))
	)
)
(4 Locale_by_use (13 13)
	(
		(Locale (13 13) ())
		(Descriptor (12 12) ())
	)
)
(5 Calendric_unit (22 22)
	(
		(Unit (7 7) (1))
		(Salient_event (6 6) (2))
	)
)
(6 Locale_by_use (21 21)
	(
		(Use (6 6) (2))
	)
)
(7 Rest (18 18)
	(
		(Whole (22 22) (5))
		(Rest (12 12) ())
	)
)
(8 Frequency (27 27)
	(
		(Event (12 12) ())
		(Event (25 25) ())
	)
)
(9 Come_together (28 28)
	(
		(Individuals (0 0) ())
	)
)
(10 Expertise (32 32)
	(
		(Protagonist (0 0) ())
	)
)
(11 Personal_relationship (33 33)
	(
		(Partners (0 0) ())
		(Degree (2 2) ())
	)
)
)
)
(
; story sentence text for lookup
("The man turned it on." "It did not respond." "The man unplugged it." "He took it apart." "He could never get that thing to work.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Response (9 9)
	(
		(Agent (6 6) ())
	)
)
(2 People (12 12)
	(
		(Person (1 1) (0))
	)
)
(3 Closure (13 13)
	(
		(Containing_object (14 14) ())
		(Agent (12 12) (2))
	)
)
(4 Removing (17 17)
	(
		(Agent (6 6) ())
		(Theme (18 18) ())
		(Result (14 14) ())
	)
)
(5 Possibility (22 22)
	(
		(Possible_event (6 6) ())
		(Possible_event (26 26) ())
	)
)
(6 Being_operational (28 28)
	(
		(Object (26 26) ())
	)
)
)
)
(
; story sentence text for lookup
("Frank has a pretty boat." "It is white, with a black line near the water." "He keeps it in the pond, near his home." "He always takes good care of it." "Frank has been at work in the garden, and will now row a while.")
; events
(
(0 Possession (1 1)
	(
		(Owner (0 0) ())
		(Possession (4 4) (1))
	)
)
(1 Vehicle (4 4)
	(
		(Vehicle (4 4) ())
		(Descriptor (3 3) (2))
	)
)
(2 Aesthetics (3 3)
	(
		(Entity (4 4) (1))
	)
)
(3 Natural_features (16 16)
	(
		(Locale (16 16) ())
	)
)
(4 Color (8 8)
	(
		(Entity (0 0) ())
		(Color (8 8) ())
	)
)
(5 Color (12 12)
	(
		(Entity (13 13) ())
		(Color (12 12) ())
	)
)
(6 Buildings (27 27)
	(
		(Building (27 27) ())
	)
)
(7 Storing (19 19)
	(
		(Agent (0 0) ())
		(Location (23 23) (9))
		(Theme (8 8) (4))
	)
)
(8 Locative_relation (25 25)
	(
		(Ground (27 27) (6))
	)
)
(9 Natural_features (23 23)
	(
		(Locale (23 23) ())
	)
)
(10 Interior_profile_relation (21 21)
	(
		(Ground (23 23) (9))
		(Figure (8 8) (4))
	)
)
(11 Measure_duration (51 51)
	(
		(Unit (51 51) ())
	)
)
(12 Locale_by_use (44 44)
	(
		(Locale (13 13) ())
	)
)
(13 Operate_vehicle (49 49)
	(
		(Time (51 51) (11))
		(Driver (0 0) ())
		(Vehicle (49 49) ())
	)
)
)
)
(
; story sentence text for lookup
("This is Gracia." "She is at home now." "When she is ready for church she will have on her white veil." "Gracia goes to church early in the morning." "Then it is cool." "She does not go alone." "Her mother and her sister Pepita go with her." "Pepita is a very little girl." "She does not wear a veil." "Sometimes she wears a large white handkerchief on her head.")
; events
(
(0 Locative_relation (6 6)
	(
		(Figure (4 4) ())
		(Time (8 8) (1))
		(Ground (7 7) ())
	)
)
(1 Temporal_collocation (8 8)
	(
		(Trajector_event (4 4) ())
	)
)
(2 Color (21 21)
	(
		(Color (21 21) ())
		(Entity (22 22) (4))
	)
)
(3 Buildings (15 15)
	(
		(Building (15 15) ())
	)
)
(4 Accoutrements (22 22)
	(
		(Wearer (20 20) ())
		(Descriptor (21 21) (2))
		(Accoutrement (22 22) ())
	)
)
(5 Wearing (18 19)
	(
		(Clothing (22 22) (4))
		(Time (11 11) ())
		(Wearer (16 16) ())
	)
)
(6 Calendric_unit (31 31)
	(
		(Unit (31 31) ())
	)
)
(7 Motion (25 25)
	(
		(Time (31 31) (6))
		(Goal (27 27) (8))
		(Theme (4 4) ())
	)
)
(8 Buildings (27 27)
	(
		(Building (7 7) ())
	)
)
(9 Desirability (36 36)
	(
		(Evaluee (34 34) ())
	)
)
(10 Motion (41 41)
	(
		(Theme (4 4) ())
		(Depictive (8 8) (1))
	)
)
(11 Kinship (45 45)
	(
		(Ego (4 4) ())
		(Alter (34 34) ())
	)
)
(12 Kinship (48 48)
	(
		(Alter (15 15) (3))
		(Ego (7 7) ())
	)
)
(13 Size (58 58)
	(
		(Degree (7 7) ())
		(Entity (15 15) (3))
	)
)
(14 People (59 59)
	(
		(Persistent_characteristic (57 58) (13))
		(Person (15 15) (3))
		(Person (4 4) ())
	)
)
(15 Accoutrements (66 66)
	(
		(Accoutrement (15 15) (3))
	)
)
(16 Wearing (64 64)
	(
		(Wearer (4 4) ())
		(Clothing (66 66) (15))
	)
)
(17 Size (72 72)
	(
		(Entity (74 74) (18))
	)
)
(18 Accoutrements (74 74)
	(
		(Descriptor (8 8) (1))
		(Descriptor (15 15) (3))
		(Accoutrement (16 16) ())
	)
)
(19 Body_parts (77 77)
	(
		(Possessor (76 76) ())
		(Body_part (77 77) ())
	)
)
(20 Color (73 73)
	(
		(Color (15 15) (3))
		(Entity (16 16) ())
	)
)
(21 Spatial_contact (75 75)
	(
		(Figure (74 74) (18))
		(Ground (77 77) (19))
	)
)
(22 Wearing (70 70)
	(
		(Clothing (74 74) (18))
		(Wearer (34 34) ())
		(Body_part (77 77) (19))
	)
)
)
)
(
; story sentence text for lookup
("My son is a little child." "He ran outside to play." "His friend was out there with him." "They played together with sticks." "My son came in from outside.")
; events
(
(0 Kinship (1 1)
	(
		(Ego (0 0) ())
		(Alter (1 1) ())
	)
)
(1 People_by_age (5 5)
	(
		(Descriptor (4 4) ())
		(Person (1 1) (0))
	)
)
(2 Self_motion (8 8)
	(
		(Self_mover (0 0) ())
		(Goal (9 9) ())
		(Purpose (10 11) (3))
	)
)
(3 Competition (11 11)
	(
		(Participants (0 0) ())
	)
)
(4 Personal_relationship (14 14)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (1 1) (0))
	)
)
(5 Participation (22 23)
	(
		(Participants (0 0) ())
		(Manner (10 11) (3))
	)
)
(6 Kinship (28 28)
	(
		(Ego (0 0) ())
		(Alter (1 1) (0))
	)
)
)
)
(
; story sentence text for lookup
("I found a couple baby turtles." "I put them in a box." "I kept them for an hour." "Then I let them go." "They were so tiny.")
; events
(
(0 Locating (1 1)
	(
		(Sought_entity (5 5) ())
		(Perceiver (0 0) ())
	)
)
(1 Aesthetics (4 4)
	(
		(Entity (5 5) ())
	)
)
(2 Personal_relationship (3 3)
	(
		(Partners (5 5) ())
		(Partners (3 3) ())
	)
)
(3 Placing (8 8)
	(
		(Agent (0 0) ())
		(Theme (9 9) ())
		(Goal (12 12) (4))
	)
)
(4 Containers (12 12)
	(
		(Container (5 5) ())
	)
)
(5 Retaining (15 15)
	(
		(Agent (0 0) ())
		(Theme (9 9) ())
		(Duration (12 12) (4))
	)
)
(6 Measure_duration (19 19)
	(
		(Unit (5 5) ())
		(Count (18 18) ())
	)
)
(7 Size (30 30)
	(
		(Entity (0 0) ())
		(Degree (9 9) ())
	)
)
)
)
(
; story sentence text for lookup
("I was on my way to get ice cream." "Then I saw the line." "It was far too long." "It was around the corner." "So I went home instead.")
; events
(
(0 Food (7 7)
	(
	)
)
(1 Getting (6 6)
	(
		(Theme (8 8) (2))
		(Recipient (0 0) ())
	)
)
(2 Food (8 8)
	(
		(Type (7 7) (0))
	)
)
(3 Perception_experience (12 12)
	(
		(Perceiver_passive (11 11) ())
		(Phenomenon (14 14) ())
	)
)
(4 Duration_description (20 20)
	(
		(Degree (18 19) ())
		(Period (0 0) ())
	)
)
(5 Motion (30 30)
	(
		(Theme (11 11) ())
		(Goal (31 31) ())
	)
)
)
)
(
; story sentence text for lookup
("There was a penny on the ground." "My son went to pick it up." "I told him not to get it." "The penny was lying tails up." "We left the penny right there.")
; events
(
(0 Existence (0 0)
	(
		(Place (6 6) ())
		(Entity (2 3) ())
	)
)
(1 Motion (10 10)
	(
		(Purpose (13 13) ())
		(Theme (9 9) (2))
	)
)
(2 Kinship (9 9)
	(
		(Ego (8 8) ())
		(Alter (9 9) ())
	)
)
(3 Request (17 17)
	(
		(Speaker (8 8) ())
		(Addressee (18 18) ())
		(Message (13 13) ())
	)
)
(4 Posture (27 27)
	(
		(Depictive (28 28) (5))
		(Agent (9 9) (2))
	)
)
(5 Body_parts (28 28)
	(
	)
)
(6 Abandonment (32 32)
	(
		(Agent (8 8) ())
		(Theme (2 3) ())
		(Place (28 28) (5))
	)
)
)
)
(
; story sentence text for lookup
("A little Mary was jumping on a couch." "Her mom told her to stop." "Mary did not listen." "She jumped and fell down." "Mary cried.")
; events
(
(0 Self_motion (4 4)
	(
		(Self_mover (2 2) ())
		(Place (7 7) ())
	)
)
(1 Request (11 11)
	(
		(Message (13 14) (3))
		(Addressee (12 12) ())
		(Speaker (10 10) (2))
	)
)
(2 Kinship (10 10)
	(
		(Ego (9 9) ())
		(Alter (10 10) ())
	)
)
(3 Activity_stop (14 14)
	(
		(Agent (12 12) ())
	)
)
(4 Perception_active (19 19)
	(
		(Perceiver_agentive (9 9) ())
	)
)
(5 Self_motion (22 22)
	(
		(Self_mover (9 9) ())
	)
)
(6 Motion_directional (24 24)
	(
		(Path (25 25) ())
		(Theme (9 9) ())
		(Direction (12 12) ())
	)
)
(7 Communication_noise (28 28)
	(
		(Speaker (9 9) ())
	)
)
)
)
(
; story sentence text for lookup
("Fred loved trees." "He decided to climb one." "When he did he got stuck." "Then he fell out." "He broke his arm.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Content (2 2) ())
		(Experiencer (0 0) ())
	)
)
(1 Deciding (5 5)
	(
		(Cognizer (0 0) ())
		(Decision (8 8) ())
	)
)
(2 Self_motion (7 7)
	(
		(Self_mover (0 0) ())
		(Path (8 8) ())
	)
)
(3 Experience_bodily_harm (23 23)
	(
		(Experiencer (0 0) ())
		(Body_part (25 25) (4))
	)
)
(4 Body_parts (25 25)
	(
		(Body_part (25 25) ())
		(Possessor (2 2) ())
	)
)
)
)
(
; story sentence text for lookup
("Bill was driving down the road." "He saw his friend Amy walking." "He stopped his car." "He gave her a ride." "Then he went home.")
; events
(
(0 Operate_vehicle (2 2)
	(
		(Driver (0 0) ())
		(Path (5 5) (1))
	)
)
(1 Roadways (5 5)
	(
		(Roadway (5 5) ())
	)
)
(2 Perception_experience (8 8)
	(
		(Perceiver_passive (0 0) ())
		(Depictive (5 5) (1))
		(Phenomenon (10 10) (4))
	)
)
(3 Self_motion (12 12)
	(
		(Self_mover (10 10) (4))
	)
)
(4 Personal_relationship (10 10)
	(
		(Partner_2 (9 9) ())
		(Partner_1 (11 11) ())
	)
)
(5 Halt (15 15)
	(
		(Theme (17 17) (6))
		(Theme (0 0) ())
	)
)
(6 Vehicle (17 17)
	(
		(Possessor (9 9) ())
		(Vehicle (17 17) ())
	)
)
(7 Motion (27 27)
	(
		(Theme (26 26) ())
		(Goal (17 17) (6))
	)
)
)
)
(
; story sentence text for lookup
("I went to work yesterday." "I began to cough." "I went into the bathroom to clean up." "I saw that I was very sick." "I went home early from work.")
; events
(
(0 Motion (1 1)
	(
		(Goal (3 3) (2))
		(Theme (0 0) ())
		(Time (4 4) (1))
	)
)
(1 Calendric_unit (4 4)
	(
		(Unit (4 4) ())
	)
)
(2 Being_employed (3 3)
	(
		(Employee (0 0) ())
		(Time (4 4) (1))
		(Type (3 3) ())
	)
)
(3 Activity_start (7 7)
	(
		(Agent (0 0) ())
		(Activity (3 3) (2))
	)
)
(4 Make_noise (9 9)
	(
		(Sound_source (0 0) ())
		(Sound (3 3) (2))
	)
)
(5 Motion (12 12)
	(
		(Theme (0 0) ())
		(Purpose (16 18) ())
		(Goal (15 15) (6))
	)
)
(6 Building_subparts (15 15)
	(
	)
)
(7 Hearsay (21 21)
	(
		(Hearer (0 0) ())
		(Message (23 23) ())
	)
)
(8 Biological_urge (26 26)
	(
		(Degree (25 25) ())
		(Experiencer (3 3) (2))
	)
)
(9 Motion (29 29)
	(
		(Source (33 33) (10))
		(Theme (0 0) ())
		(Goal (30 30) ())
		(Time (3 3) (2))
	)
)
(10 Locale_by_use (33 33)
	(
		(Locale (25 25) ())
	)
)
)
)
(
; story sentence text for lookup
("I see one dog and two cats.")
; events
(
(0 Cardinal_numbers (2 2)
	(
		(Number (2 2) ())
		(Entity (3 3) ())
	)
)
(1 Perception_experience (1 1)
	(
		(Phenomenon (3 3) ())
		(Perceiver_passive (0 0) ())
	)
)
(2 Cardinal_numbers (5 5)
	(
		(Entity (6 6) ())
		(Number (5 5) ())
	)
)
)
)
(
; story sentence text for lookup
("Tina tried out for the swim team." "She made it." "Tina was happy." "She told her friends." "They were happy for her.")
; events
(
(0 Success_or_failure (1 2)
	(
		(Agent (0 0) ())
		(Circumstances (6 6) (2))
	)
)
(1 Self_motion (5 5)
	(
		(Self_mover (6 6) (2))
	)
)
(2 Aggregate (6 6)
	(
		(Aggregate_property (5 5) (1))
		(Aggregate (6 6) ())
	)
)
(3 Arriving (9 10)
	(
		(Theme (0 0) ())
	)
)
(4 Emotion_directed (14 14)
	(
		(Experiencer (0 0) ())
	)
)
(5 Telling (17 17)
	(
		(Addressee (19 19) (6))
		(Speaker (0 0) ())
	)
)
(6 Personal_relationship (19 19)
	(
		(Partner_2 (18 18) ())
		(Partner_1 (19 19) ())
	)
)
(7 Emotion_directed (23 23)
	(
		(Experiencer (0 0) ())
		(Stimulus (25 25) ())
	)
)
)
)
(
; story sentence text for lookup
("The man shook his head." "The woman asked why." "The man would not answer." "The woman walked away." "The man looked dejected.")
; events
(
(0 Body_movement (2 2)
	(
		(Body_part (4 4) (2))
		(Agent (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Body_parts (4 4)
	(
		(Body_part (4 4) ())
		(Possessor (3 3) ())
	)
)
(3 Questioning (8 8)
	(
		(Message (3 3) ())
		(Speaker (1 1) (1))
	)
)
(4 People (7 7)
	(
		(Person (1 1) (1))
	)
)
(5 People (12 12)
	(
		(Person (1 1) (1))
	)
)
(6 Communication_response (15 15)
	(
		(Speaker (1 1) (1))
	)
)
(7 Self_motion (19 19)
	(
		(Source (3 3) ())
		(Self_mover (1 1) (1))
	)
)
(8 People (18 18)
	(
		(Person (1 1) (1))
	)
)
(9 Give_impression (24 24)
	(
		(Inference (3 3) ())
		(Phenomenon (1 1) (1))
	)
)
(10 People (23 23)
	(
		(Person (1 1) (1))
	)
)
(11 Emotion_directed (25 25)
	(
		(Experiencer (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("That man is shooting partridges.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Use_firearm (3 3)
	(
		(Firearm (4 4) ())
		(Agent (1 1) (0))
	)
)
)
)
(
; story sentence text for lookup
("I have a cat." "My cat is very mean." "It does not like my other cats." "It fights with my other cats." "I might have to get rid of it.")
; events
(
(0 Have_associated (1 1)
	(
		(Entity (3 3) (1))
		(Topical_entity (0 0) ())
	)
)
(1 Animals (3 3)
	(
		(Animal (0 0) ())
		(Animal (3 3) ())
	)
)
(2 Social_interaction_evaluation (9 9)
	(
		(Degree (3 3) (1))
		(Evaluee (6 6) ())
	)
)
(3 Negation (13 13)
	(
		(Negated_proposition (17 17) ())
		(Negated_proposition (6 6) ())
	)
)
(4 Increment (16 16)
	(
		(Class (17 17) ())
	)
)
(5 Experiencer_focus (14 14)
	(
		(Experiencer (0 0) ())
		(Content (17 17) ())
	)
)
(6 Hostile_encounter (20 20)
	(
		(Side_1 (0 0) ())
		(Side_2 (24 24) ())
	)
)
(7 Increment (23 23)
	(
		(Class (24 24) ())
	)
)
(8 Required_event (28 29)
	(
		(Required_situation (0 0) ())
		(Required_situation (33 33) ())
	)
)
(9 Likelihood (27 27)
	(
		(Hypothetical_event (0 0) ())
		(Hypothetical_event (33 33) ())
	)
)
(10 Removing (30 30)
	(
		(Agent (0 0) ())
		(Theme (33 33) ())
	)
)
)
)
(
; story sentence text for lookup
("This is red clover." "The bees like it." "They find sweet nectar in the clover flowers." "They take the nectar home to make honey." "Here is white clover." "It is sweet." "It has nectar, and bees like it, too." "It grows in the fields with red clover and yellow buttercups." "Horses and cows eat clover.")
; events
(
(0 Color (2 2)
	(
		(Color (2 2) ())
		(Entity (3 3) ())
	)
)
(1 Experiencer_focus (7 7)
	(
		(Experiencer (5 6) ())
		(Content (3 3) ())
	)
)
(2 Chemical-sense_description (12 12)
	(
		(Perceptual_source (3 3) ())
	)
)
(3 Locating (11 11)
	(
		(Ground (17 17) ())
		(Perceiver (10 10) ())
		(Sought_entity (13 13) ())
	)
)
(4 Interior_profile_relation (14 14)
	(
		(Figure (13 13) ())
		(Ground (17 17) ())
	)
)
(5 Food (26 26)
	(
	)
)
(6 Bringing (20 20)
	(
		(Agent (10 10) ())
		(Purpose (17 17) ())
		(Goal (23 23) ())
		(Theme (13 13) ())
	)
)
(7 Cooking_creation (25 25)
	(
		(Produced_food (26 26) (5))
		(Cook (10 10) ())
	)
)
(8 Spatial_co-location (28 28)
	(
		(Figure (13 13) ())
	)
)
(9 Color (30 30)
	(
		(Color (2 2) (0))
		(Entity (3 3) ())
	)
)
(10 Chemical-sense_description (35 35)
	(
		(Perceptual_source (10 10) ())
	)
)
(11 Chemical-sense_description (39 39)
	(
		(Perceptual_source (10 10) ())
	)
)
(12 Have_associated (38 38)
	(
		(Entity (2 2) (0))
		(Topical_entity (10 10) ())
	)
)
(13 Experiencer_focus (43 43)
	(
		(Content (26 26) (5))
		(Experiencer (42 42) ())
	)
)
(14 Color (57 57)
	(
		(Color (57 57) ())
		(Entity (58 58) ())
	)
)
(15 Interior_profile_relation (50 50)
	(
		(Figure (5 6) ())
		(Ground (52 52) (18))
	)
)
(16 Ontogeny (49 49)
	(
		(Entity (10 10) ())
		(Place (52 52) (18))
	)
)
(17 Color (54 54)
	(
		(Entity (26 26) (5))
	)
)
(18 Locale_by_use (52 52)
	(
		(Constituent_parts (55 55) ())
		(Locale (23 23) ())
	)
)
(19 Food (64 64)
	(
	)
)
(20 Ingestion (63 63)
	(
		(Ingestibles (23 23) ())
		(Ingestor (60 60) ())
	)
)
)
)
(
; story sentence text for lookup
("The girls went to the pond." "They caught a giant frog." "They took it home and put it in a bucket." "They showed it to all their friends." "The frog lived with them for a month.")
; events
(
(0 Natural_features (5 5)
	(
		(Locale (5 5) ())
	)
)
(1 Motion (2 2)
	(
		(Goal (5 5) (0))
		(Theme (1 1) (2))
	)
)
(2 People (1 1)
	(
		(Person (1 1) ())
	)
)
(3 Natural_features (11 11)
	(
		(Locale (11 11) ())
		(Descriptor (10 10) (5))
	)
)
(4 Personal_relationship (8 8)
	(
		(Partner_1 (7 7) ())
		(Depictive (11 11) (3))
	)
)
(5 Size (10 10)
	(
		(Entity (11 11) (3))
	)
)
(6 Bringing (14 14)
	(
		(Agent (7 7) ())
		(Theme (15 15) ())
		(Goal (10 10) (5))
	)
)
(7 Placing (18 18)
	(
		(Agent (7 7) ())
		(Theme (19 19) ())
		(Goal (22 22) (8))
	)
)
(8 Containers (22 22)
	(
		(Container (22 22) ())
	)
)
(9 Cause_to_perceive (25 25)
	(
		(Actor (7 7) ())
		(Phenomenon (15 15) ())
		(Perceiver (30 30) (10))
	)
)
(10 Personal_relationship (30 30)
	(
		(Partner_2 (5 5) (0))
		(Partner_1 (19 19) ())
	)
)
(11 Measure_duration (39 39)
	(
		(Unit (39 39) ())
		(Count (19 19) ())
	)
)
(12 Residence (34 34)
	(
		(Co_resident (36 36) ())
		(Resident (1 1) (2))
	)
)
)
)
(
; story sentence text for lookup
("Lucy had a lot of split ends." "She had to do something about it." "She got some scissors." "She then cut them off." "She then looked great.")
; events
(
(0 Quantified_mass (2 3)
	(
		(Quantity (3 3) ())
		(Individuals (6 6) ())
	)
)
(1 Required_event (9 10)
	(
		(Required_situation (8 8) ())
		(Required_situation (12 12) ())
	)
)
(2 Intentionally_act (11 11)
	(
		(Agent (8 8) ())
		(Act (12 12) ())
		(Act (14 14) ())
	)
)
(3 Proportional_quantity (18 18)
	(
		(Denoted_quantity (18 18) ())
		(Individuals (19 19) ())
	)
)
(4 Possession (17 17)
	(
		(Owner (8 8) ())
		(Possession (3 3) ())
	)
)
(5 Corporal_punishment (23 25)
	(
		(Agent (8 8) ())
		(Evaluee (19 19) ())
	)
)
(6 Give_impression (29 29)
	(
		(Phenomenon (8 8) ())
		(Frequency (28 28) ())
		(Appraisal (19 19) ())
	)
)
(7 Desirability (30 30)
	(
		(Evaluee (8 8) ())
	)
)
)
)
(
; story sentence text for lookup
("A little girl was born." "She grew up." "She had a family." "She got old." "She passed away at the end.")
; events
(
(0 People (2 2)
	(
		(Person (2 2) ())
		(Descriptor (1 1) ())
	)
)
(1 Being_born (4 4)
	(
		(Child (0 2) (0))
	)
)
(2 Ontogeny (7 8)
	(
		(Entity (6 6) ())
	)
)
(3 Kinship (13 13)
	(
		(Ego (6 6) ())
		(Alter (13 13) ())
	)
)
(4 Age (17 17)
	(
		(Entity (6 6) ())
		(Age (2 2) (0))
	)
)
(5 Transition_to_state (16 16)
	(
		(Entity (6 6) ())
		(Final_quality (2 2) (0))
	)
)
(6 Death (20 20)
	(
		(Protagonist (6 6) ())
	)
)
(7 Temporal_subregion (24 24)
	(
		(Subpart (24 24) ())
	)
)
)
)
(
; story sentence text for lookup
("Lynn gets a new dog." "She loves her dog." "She is out one evening walking him." "Her dog runs off away from her." "She cannot catch him and he runs away.")
; events
(
(0 Animals (4 4)
	(
		(Animal (4 4) ())
		(Descriptor (3 3) (2))
	)
)
(1 Getting (1 1)
	(
		(Theme (4 4) (0))
		(Recipient (0 0) ())
	)
)
(2 Age (3 3)
	(
		(Entity (4 4) (0))
		(Age (3 3) ())
	)
)
(3 Experiencer_focus (7 7)
	(
		(Experiencer (0 0) ())
		(Content (9 9) (4))
	)
)
(4 Animals (9 9)
	(
		(Animal (3 3) (2))
		(Descriptor (8 8) ())
	)
)
(5 Self_motion (16 16)
	(
		(Self_mover (0 0) ())
		(Cotheme (17 17) ())
	)
)
(6 Calendric_unit (15 15)
	(
		(Unit (4 4) (0))
	)
)
(7 Self_motion (21 21)
	(
		(Source (25 25) ())
		(Source (3 3) (2))
		(Self_mover (20 20) ())
	)
)
(8 Self_motion (34 34)
	(
		(Source (35 35) ())
		(Self_mover (17 17) ())
	)
)
)
)
(
; story sentence text for lookup
("My friends and I were running." "I was behind the group." "I sprinted to try to catch up." "They all ran faster than me." "I came in last place.")
; events
(
(0 Personal_relationship (1 1)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (1 1) ())
	)
)
(1 Self_motion (5 5)
	(
		(Self_mover (1 1) (0))
	)
)
(2 Non-gradable_proximity (9 9)
	(
		(Figure (0 0) ())
		(Ground (11 11) (3))
	)
)
(3 Aggregate (11 11)
	(
		(Aggregate (11 11) ())
	)
)
(4 Self_motion (14 14)
	(
		(Self_mover (0 0) ())
	)
)
(5 Attempt (16 16)
	(
		(Agent (0 0) ())
		(Goal (17 19) ())
	)
)
(6 Self_motion (23 23)
	(
		(Path (26 26) ())
		(Manner (24 24) (7))
		(Self_mover (21 21) ())
	)
)
(7 Speed_description (24 24)
	(
		(Degree (26 26) ())
		(Entity (21 21) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom was in a band." "They had very few fans." "They tried to hold a show." "Half a dozen people showed up." "Tom's band still played their heart out.")
; events
(
(0 Interior_profile_relation (2 2)
	(
		(Figure (0 0) ())
		(Ground (4 4) (1))
	)
)
(1 Aggregate (4 4)
	(
		(Aggregate (4 4) ())
	)
)
(2 Possession (7 7)
	(
		(Owner (0 0) ())
		(Possession (10 10) ())
	)
)
(3 Attempt (13 13)
	(
		(Agent (0 0) ())
		(Goal (17 17) ())
	)
)
(4 Part_whole (19 19)
	(
		(Part (0 0) ())
		(Whole (20 21) ())
	)
)
(5 People (22 22)
	(
		(Person (22 22) ())
	)
)
(6 Attending (23 24)
	(
		(Agent (22 22) (5))
	)
)
(7 Aggregate (28 28)
	(
		(Aggregate_property (26 27) ())
		(Aggregate (28 28) ())
	)
)
)
)
(
; story sentence text for lookup
("The man made a bet." "He lost the bet." "He only had money for one more bet." "He bet it all." "He lost all of his money.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Possession (13 13)
	(
		(Owner (11 11) ())
		(Possession (14 14) ())
	)
)
(2 Increment (17 17)
	(
		(Class (18 18) ())
	)
)
(3 Wagering (21 21)
	(
		(Outcome (22 22) ())
		(Gambler (11 11) ())
	)
)
(4 Earnings_and_losses (26 26)
	(
		(Earner (11 11) ())
		(Earnings (27 27) ())
	)
)
(5 Money (30 30)
	(
		(Money (30 30) ())
		(Possessor (29 29) ())
	)
)
)
)
(
; story sentence text for lookup
("The man felt cold." "He took a warm shower." "He felt better in the shower." "When he got out he felt cold again." "He got back in the shower.")
; events
(
(0 Give_impression (2 2)
	(
		(Inference (3 3) (2))
		(Perceiver_passive (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Ambient_temperature (3 3)
	(
		(Time (1 1) (1))
	)
)
(3 Being_wet (9 9)
	(
		(Item (5 5) ())
		(Liquid (3 3) (2))
	)
)
(4 Temperature (8 8)
	(
		(Entity (9 9) (3))
	)
)
(5 Feeling (12 12)
	(
		(Experiencer (5 5) ())
		(Emotional_state (13 13) ())
		(Experiencer (16 16) (6))
	)
)
(6 Preliminaries (16 16)
	(
		(Place (16 16) ())
	)
)
(7 Arriving (20 20)
	(
		(Theme (1 1) (1))
		(Source (3 3) (2))
	)
)
(8 Perception_experience (23 23)
	(
		(Perceiver_passive (9 9) (3))
		(Phenomenon (24 24) (9))
	)
)
(9 Ambient_temperature (24 24)
	(
		(Circumstances (9 9) (3))
	)
)
(10 Building_subparts (32 32)
	(
	)
)
)
)
(
; story sentence text for lookup
("The dog and hen run at the cat.")
; events
(
(0 Self_motion (4 4)
	(
		(Self_mover (1 1) ())
		(Path (7 7) (1))
	)
)
(1 Animals (7 7)
	(
		(Animal (7 7) ())
	)
)
)
)
(
; story sentence text for lookup
("The sun is up." "The man has fed the black hen and the fat duck." "Now the duck will swim in the pond." "The hen has run to her nest." "Let us not stop at the pond now, for it is hot." "See how still it is!" "We will go to see Tom and his top.")
; events
(
(0 Location_of_light (1 1)
	(
		(Figure (1 1) ())
	)
)
(1 People (6 6)
	(
		(Person (1 1) (0))
	)
)
(2 Color (10 10)
	(
		(Color (10 10) ())
		(Entity (11 11) ())
	)
)
(3 Filling (8 8)
	(
		(Goal (11 11) ())
		(Agent (6 6) (1))
	)
)
(4 Body_description_holistic (14 14)
	(
		(Individual (15 15) ())
	)
)
(5 Self_motion (21 21)
	(
		(Self_mover (19 19) ())
		(Area (24 24) (6))
	)
)
(6 Natural_features (24 24)
	(
		(Locale (24 24) ())
	)
)
(7 Self_motion (29 29)
	(
		(Goal (32 32) ())
		(Self_mover (6 6) (1))
	)
)
(8 Temporal_collocation (41 41)
	(
		(Trajector_event (35 35) ())
	)
)
(9 Ambient_temperature (46 46)
	(
		(Circumstances (15 15) ())
	)
)
(10 Natural_features (40 40)
	(
		(Locale (11 11) ())
	)
)
(11 Halt (37 37)
	(
		(Time (24 24) (6))
		(Place (32 32) ())
		(Theme (1 1) (0))
	)
)
(12 Grasp (48 48)
	(
		(Phenomenon (51 51) ())
	)
)
(13 Continued_state_of_affairs (50 50)
	(
		(State_of_affairs (1 1) (0))
		(State_of_affairs (51 51) ())
	)
)
(14 Body_parts (62 62)
	(
		(Body_part (62 62) ())
		(Possessor (24 24) (6))
	)
)
(15 Motion (56 56)
	(
		(Theme (54 54) ())
		(Goal (59 59) ())
	)
)
(16 Visiting (58 58)
	(
		(Agent (54 54) ())
		(Entity (59 59) ())
	)
)
)
)
(
; story sentence text for lookup
("The man saw a rabbit." "He was hungry." "He chased the rabbit." "The rabbit outran him." "The man sat down in defeat.")
; events
(
(0 Perception_experience (2 2)
	(
		(Phenomenon (4 4) ())
		(Perceiver_passive (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Biological_urge (8 8)
	(
		(Experiencer (6 6) ())
	)
)
(3 Cotheme (11 11)
	(
		(Theme (6 6) ())
		(Cotheme (13 13) ())
	)
)
(4 Dodging (17 17)
	(
		(Dodger (1 1) (1))
		(Bad_entity (18 18) ())
	)
)
(5 Change_posture (22 22)
	(
		(Depictive (25 25) ())
		(Direction (18 18) ())
		(Protagonist (1 1) (1))
	)
)
(6 People (21 21)
	(
		(Person (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("The boy kicked the rock." "The rock came loose." "It fell down a hill side." "Someone was walking up the hill." "The rock almost hit them.")
; events
(
(0 Cause_impact (2 2)
	(
		(Impactor (4 4) ())
		(Agent (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Part_orientational (16 16)
	(
		(Part (16 16) ())
		(Whole (15 15) (4))
	)
)
(3 Motion_directional (12 12)
	(
		(Theme (11 11) ())
		(Path (16 16) (2))
	)
)
(4 Natural_features (15 15)
	(
		(Locale (15 15) ())
	)
)
(5 Natural_features (23 23)
	(
		(Locale (16 16) (2))
	)
)
(6 Self_motion (20 20)
	(
		(Path (23 23) (5))
		(Self_mover (11 11) ())
	)
)
(7 Impact (28 28)
	(
		(Impactee (15 15) (4))
		(Impactor (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("Koy is teaching Carlo to beg." "He stands and says, Beg, Carlo, beg." "It is a bun." "Beg, and you may have it." "Carlo stands on his hind feet." "He looks at the bun which Roy has in his hand and says, Bowwow, bow-wow." "Ned sits and looks at Carlo." "Roy will give the bun to Carlo.")
; events
(
(0 Attempt_suasion (5 5)
	(
		(Addressee (3 3) ())
	)
)
(1 Education_teaching (2 2)
	(
		(Skill (4 5) (0))
		(Student (3 3) ())
		(Teacher (0 0) ())
	)
)
(2 Change_posture (8 8)
	(
		(Protagonist (0 0) ())
	)
)
(3 Attempt_suasion (16 16)
	(
		(Medium (14 14) ())
	)
)
(4 Statement (10 10)
	(
		(Speaker (0 0) ())
		(Message (12 16) (3 5))
	)
)
(5 Request (12 12)
	(
	)
)
(6 Request (23 23)
	(
	)
)
(7 Posture (32 32)
	(
		(Agent (0 0) ())
		(Manner (36 36) (9))
	)
)
(8 Part_orientational (35 35)
	(
		(Whole (3 3) ())
		(Part (36 36) (9))
	)
)
(9 Body_parts (36 36)
	(
		(Orientational_location (35 35) (8))
		(Possessor (3 3) ())
		(Body_part (36 36) ())
	)
)
(10 Statement (50 50)
	(
		(Speaker (0 0) ())
		(Message (52 56) ())
	)
)
(11 Body_parts (48 48)
	(
		(Body_part (48 48) ())
		(Possessor (47 47) ())
	)
)
(12 Interior_profile_relation (46 46)
	(
		(Ground (48 48) (11))
		(Figure (44 44) ())
	)
)
(13 Perception_active (39 39)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (42 42) (14))
	)
)
(14 Hair_configuration (42 42)
	(
		(Configuration (35 35) (8))
	)
)
(15 Possession (45 45)
	(
		(Possession (36 36) (9))
		(Depictive (48 48) (11))
		(Possession (42 42) (14))
		(Owner (44 44) ())
	)
)
(16 Posture (59 59)
	(
		(Point_of_contact (59 59) ())
		(Agent (0 0) ())
	)
)
(17 Perception_active (61 61)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (4 5) (0))
	)
)
(18 Giving (67 67)
	(
		(Donor (0 0) ())
		(Theme (42 42) (14))
		(Recipient (71 71) ())
	)
)
(19 Hair_configuration (69 69)
	(
		(Configuration (35 35) (8))
	)
)
)
)
(
; story sentence text for lookup
("Sam wanted a new tv." "So he went to the best buy and looked at a tv." "Found a good tv." "Bought the tv." "Sam loved his new tv.")
; events
(
(0 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Focal_participant (4 4) ())
	)
)
(1 Age (3 3)
	(
		(Entity (4 4) ())
		(Age (3 3) ())
	)
)
(2 Perception_active (14 14)
	(
		(Phenomenon (17 17) ())
		(Perceiver_agentive (7 7) ())
	)
)
(3 Motion (8 8)
	(
		(Theme (7 7) ())
		(Goal (12 12) (5))
	)
)
(4 Desirability (11 11)
	(
		(Degree (11 11) ())
		(Evaluee (12 12) (5))
	)
)
(5 Commerce_buy (12 12)
	(
		(Buyer (7 7) ())
	)
)
(6 Locating (19 19)
	(
		(Sought_entity (22 22) ())
	)
)
(7 Desirability (21 21)
	(
		(Evaluee (3 3) (1))
	)
)
(8 Commerce_buy (24 24)
	(
		(Goods (26 26) ())
	)
)
(9 Experiencer_focus (29 29)
	(
		(Experiencer (0 0) ())
		(Content (4 4) ())
	)
)
(10 Age (31 31)
	(
		(Entity (4 4) ())
		(Age (3 3) (1))
	)
)
)
)
(
; story sentence text for lookup
("Nell has a new sled." "Nell says, I must take baby May for a ride, then I must go to school." "Here you can see Nell with baby May on the sled." "Baby likes to ride on the new sled." "She likes to play in the white snow." "If Nell runs too fast, May calls, Stop, stop!" "Baby can not tell Nell that she is going too fast." "Soon baby May can say, too fast!")
; events
(
(0 Possession (1 1)
	(
		(Owner (0 0) ())
		(Possession (4 4) (1))
	)
)
(1 Buildings (4 4)
	(
		(Possessor (0 0) ())
		(Building (4 4) ())
		(Descriptor (3 3) (2))
	)
)
(2 Age (3 3)
	(
		(Entity (4 4) (1))
		(Age (3 3) ())
	)
)
(3 Required_event (10 10)
	(
		(Required_situation (13 13) ())
		(Required_situation (3 3) (2))
	)
)
(4 Required_event (20 20)
	(
		(Required_situation (19 19) ())
		(Required_situation (23 23) (5))
	)
)
(5 Locale_by_use (23 23)
	(
		(Locale (23 23) ())
		(Formational_cause (19 19) ())
	)
)
(6 Bringing (11 11)
	(
		(Explanation (16 16) (7))
		(Theme (13 13) ())
		(Agent (3 3) (2))
	)
)
(7 Ride_vehicle (16 16)
	(
	)
)
(8 Statement (7 7)
	(
		(Speaker (0 0) ())
		(Message (9 9) ())
	)
)
(9 Appellations (12 12)
	(
		(Name (13 13) ())
	)
)
(10 Accoutrements (35 35)
	(
		(Accoutrement (35 35) ())
	)
)
(11 Possibility (27 27)
	(
		(Possible_event (29 29) ())
		(Possible_event (26 26) ())
	)
)
(12 Perception_experience (28 28)
	(
		(Ground (0 0) ())
		(Perceiver_passive (26 26) ())
		(Phenomenon (4 4) (1))
		(Depictive (13 13) ())
	)
)
(13 Experiencer_focus (38 38)
	(
		(Experiencer (0 0) ())
		(Content (44 44) (15))
	)
)
(14 Operate_vehicle (40 40)
	(
		(Driver (0 0) ())
		(Vehicle (44 44) (15))
	)
)
(15 Noise_makers (44 44)
	(
		(Type (13 13) ())
	)
)
(16 Age (43 43)
	(
		(Entity (13 13) ())
		(Age (43 43) ())
	)
)
(17 Experiencer_focus (47 47)
	(
		(Experiencer (0 0) ())
		(Content (44 44) (15))
	)
)
(18 Hearsay (49 49)
	(
		(Speaker (0 0) ())
		(Medium (44 44) (15))
	)
)
(19 Precipitation (53 53)
	(
		(Precipitation (13 13) ())
		(Temperature (43 43) (16))
	)
)
(20 Color (52 52)
	(
		(Entity (13 13) ())
		(Color (43 43) (16))
	)
)
(21 Activity_stop (64 66)
	(
		(Agent (43 43) (16))
	)
)
(22 Self_motion (57 57)
	(
		(Self_mover (26 26) ())
		(Manner (58 59) (23))
	)
)
(23 Speed_description (59 59)
	(
		(Entity (26 26) ())
		(Degree (3 3) (2))
	)
)
(24 Contacting (62 62)
	(
		(Communicator (43 43) (16))
		(Purpose (56 56) ())
	)
)
(25 Motion (76 76)
	(
		(Speed (77 78) (26))
		(Theme (43 43) (16))
	)
)
(26 Speed_description (78 78)
	(
		(Entity (43 43) (16))
		(Degree (77 77) ())
	)
)
(27 Possibility (69 69)
	(
		(Possible_event (0 0) ())
		(Possible_event (72 72) ())
	)
)
(28 Becoming_aware (71 71)
	(
		(Cognizer (0 0) ())
		(Phenomenon (4 4) (1))
		(Phenomenon (13 13) ())
	)
)
(29 Statement (84 84)
	(
		(Speaker (82 82) ())
		(Message (13 13) ())
		(Time (0 0) ())
	)
)
(30 Speed_description (87 87)
	(
		(Entity (82 82) ())
		(Degree (43 43) (16))
	)
)
)
)
(
; story sentence text for lookup
("We went to the water park yesterday." "It was a wild day." "When we got there the lies were very long." "They were too long." "So we decided to leave.")
; events
(
(0 Motion (1 1)
	(
		(Theme (0 0) ())
		(Goal (5 5) (1))
		(Time (6 6) (2))
	)
)
(1 Locale_by_use (5 5)
	(
		(Locale (5 5) ())
		(Constituent_parts (4 4) ())
	)
)
(2 Calendric_unit (6 6)
	(
		(Unit (6 6) ())
	)
)
(3 Calendric_unit (12 12)
	(
		(Unit (4 4) ())
	)
)
(4 Desirability (11 11)
	(
		(Evaluee (4 4) ())
	)
)
(5 Arriving (16 16)
	(
		(Theme (15 15) ())
		(Goal (17 17) ())
	)
)
(6 Duration_description (22 22)
	(
		(Degree (21 21) ())
		(Eventuality (19 19) ())
	)
)
(7 Duration_description (27 27)
	(
		(Eventuality (0 0) ())
		(Degree (26 26) ())
	)
)
(8 Deciding (31 31)
	(
		(Cognizer (15 15) ())
		(Decision (32 33) (9))
	)
)
(9 Departing (33 33)
	(
		(Theme (15 15) ())
	)
)
)
)
(
; story sentence text for lookup
("The dog went outside." "It walked over by the tree." "The dog trotted around the tree." "The dog found a spot." "The dog laid down and took a nap.")
; events
(
(0 Motion (2 2)
	(
		(Goal (3 3) ())
		(Theme (1 1) ())
	)
)
(1 Self_motion (6 6)
	(
		(Self_mover (5 5) ())
		(Goal (7 7) ())
		(Area (10 10) ())
	)
)
(2 Self_motion (14 14)
	(
		(Path (10 10) ())
		(Self_mover (1 1) ())
	)
)
(3 Locating (21 21)
	(
		(Sought_entity (23 23) (4))
		(Perceiver (1 1) ())
	)
)
(4 Locale (23 23)
	(
		(Locale (23 23) ())
	)
)
(5 Sleep (32 32)
	(
		(Sleeper (1 1) ())
	)
)
(6 Change_posture (27 28)
	(
		(Protagonist (1 1) ())
	)
)
)
)
(
; story sentence text for lookup
("This is Tom and May." "Tom and May can play ball." "Tom has a little bat and a little ball." "Tom has hit the ball." "See it fly!" "See May run!" "Will she get the ball?" "O, yes, she will get the ball." "Run, May, run, and get the ball!")
; events
(
(0 Competition (9 9)
	(
		(Participants (5 5) ())
		(Competition (10 10) ())
	)
)
(1 Capability (8 8)
	(
		(Event (10 10) ())
		(Entity (5 5) ())
	)
)
(2 Quantity (20 20)
	(
		(Quantity (20 20) ())
		(Descriptor (19 19) ())
	)
)
(3 Possession (13 13)
	(
		(Owner (12 12) ())
		(Possession (16 16) ())
	)
)
(4 Size (15 15)
	(
		(Entity (16 16) ())
	)
)
(5 Perception_experience (28 28)
	(
		(Depictive (30 30) (6))
		(Phenomenon (29 29) ())
	)
)
(6 Self_motion (30 30)
	(
		(Self_mover (29 29) ())
	)
)
(7 Visiting (32 32)
	(
		(Entity (33 34) (8))
	)
)
(8 Self_motion (34 34)
	(
		(Self_mover (29 29) ())
	)
)
(9 Getting (59 59)
	(
		(Theme (61 61) ())
	)
)
(10 Self_motion (52 52)
	(
	)
)
(11 Self_motion (56 56)
	(
	)
)
)
)
(
; story sentence text for lookup
("Simon called his dog." "The dog did not come." "He yelled his dogs name." "His mom heard him." "His mom found his dog.")
; events
(
(0 Referring_by_name (1 1)
	(
		(Name (3 3) (1))
		(Speaker (0 0) ())
	)
)
(1 Animals (3 3)
	(
		(Animal (2 2) ())
		(Animal (3 3) ())
	)
)
(2 Arriving (9 9)
	(
		(Theme (6 6) ())
	)
)
(3 Being_named (15 15)
	(
	)
)
(4 Communication_noise (12 12)
	(
		(Speaker (0 0) ())
		(Message (15 15) (3))
	)
)
(5 Perception_experience (19 19)
	(
		(Phenomenon (3 3) (1))
		(Perceiver_passive (6 6) ())
	)
)
(6 Kinship (18 18)
	(
		(Ego (0 0) ())
		(Alter (18 18) ())
	)
)
(7 Locating (24 24)
	(
		(Sought_entity (26 26) (9))
		(Perceiver (6 6) ())
	)
)
(8 Kinship (23 23)
	(
		(Ego (0 0) ())
		(Alter (18 18) (6))
	)
)
(9 Animals (26 26)
	(
		(Animal (26 26) ())
		(Animal (3 3) (1))
	)
)
)
)
(
; story sentence text for lookup
("Tony was out playing with friends." "Some of them were jumping rope." "They asked Tony to jump in." "Tony tried and fell down." "All his friends made fun of him.")
; events
(
(0 Personal_relationship (5 5)
	(
		(Partner_1 (0 0) ())
		(Partner_1 (5 5) ())
	)
)
(1 Self_motion (11 11)
	(
		(Self_mover (7 7) ())
		(Path (5 5) (0))
	)
)
(2 Request (15 15)
	(
		(Speaker (0 0) ())
		(Addressee (16 16) ())
		(Message (17 19) (3))
	)
)
(3 Self_motion (18 18)
	(
		(Self_mover (16 16) ())
		(Goal (5 5) (0))
	)
)
(4 Attempt (22 22)
	(
		(Agent (0 0) ())
	)
)
(5 Motion_directional (24 24)
	(
		(Theme (0 0) ())
		(Path (25 25) ())
		(Direction (24 24) ())
	)
)
(6 Personal_relationship (29 29)
	(
		(Partner_1 (16 16) ())
		(Partner_2 (28 28) ())
	)
)
(7 Judgment_communication (31 31)
	(
		(Evaluee (33 33) ())
		(Communicator (7 7) ())
	)
)
(8 Statement (30 30)
	(
		(Topic (33 33) ())
		(Speaker (7 7) ())
	)
)
)
)
(
; story sentence text for lookup
("Susie was new at school." "She was nervous." "She was afraid she would make no friends." "Thankfully she did." "Susie was happy she did.")
; events
(
(0 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
	)
)
(1 Spatial_co-location (3 3)
	(
		(Figure (0 0) ())
		(Ground (4 4) (0))
	)
)
(2 Age (2 2)
	(
		(Circumstances (4 4) (0))
		(Entity (0 0) ())
	)
)
(3 Experiencer_focus (8 8)
	(
		(Experiencer (0 0) ())
	)
)
(4 Experiencer_focus (12 12)
	(
		(Experiencer (0 0) ())
		(Content (13 13) ())
	)
)
(5 Intentionally_create (15 15)
	(
		(Created_entity (17 17) (6))
		(Creator (13 13) ())
	)
)
(6 Personal_relationship (17 17)
	(
		(Partner_1 (17 17) ())
		(Partner_2 (13 13) ())
	)
)
(7 Emotion_directed (25 25)
	(
		(Stimulus (4 4) (0))
		(Experiencer (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Lucy went for a walk." "She saw a squirrel." "Then she looked again." "It wasn't a squirrel." "It was a chipmunk.")
; events
(
(0 Motion (1 1)
	(
		(Theme (0 0) ())
		(Goal (4 4) (1))
	)
)
(1 Self_motion (4 4)
	(
		(Self_mover (0 0) ())
	)
)
(2 Perception_experience (7 7)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (9 9) ())
	)
)
(3 Perception_active (13 13)
	(
		(Time (0 0) ())
		(Perceiver_agentive (12 12) ())
	)
)
)
)

(
; story sentence text for lookup
("Do you see that tree on the hill?" "Well, a nest is in that tree." "Charley, Fred and I went to see the nest." "It had eggs in it." "Charley went up the tree and got the nest for us to see." "As he held it in his hand, an egg fell on the grass." "Was not that too bad?")
; events
(
(0 Perception_experience (2 2)
	(
		(Perceiver_passive (1 1) ())
		(Phenomenon (4 4) ())
		(State (7 7) (2))
	)
)
(1 Spatial_contact (5 5)
	(
		(Ground (7 7) (2))
		(Figure (4 4) ())
	)
)
(2 Natural_features (7 7)
	(
		(Locale (7 7) ())
	)
)
(3 Interior_profile_relation (14 14)
	(
		(Ground (7 7) (2))
		(Figure (12 12) ())
	)
)
(4 Motion (23 23)
	(
		(Goal (27 27) ())
		(Theme (18 18) ())
	)
)
(5 Touring (25 25)
	(
		(Attraction (27 27) ())
		(Tourist (18 18) ())
	)
)
(6 Food (31 31)
	(
	)
)
(7 Motion (36 36)
	(
		(Path (39 39) ())
		(Theme (35 35) ())
	)
)
(8 Getting (41 41)
	(
		(Purpose (45 45) ())
		(Theme (43 43) ())
		(Recipient (35 35) ())
	)
)
(9 Perception_experience (47 47)
	(
		(Perceiver_passive (45 45) ())
	)
)
(10 Spatial_contact (60 60)
	(
		(Ground (62 62) ())
		(Figure (27 27) ())
	)
)
(11 Manipulation (51 51)
	(
		(Agent (1 1) ())
		(Bodypart_of_agent (55 55) (12))
		(Entity (52 52) ())
	)
)
(12 Body_parts (55 55)
	(
		(Possessor (54 54) ())
		(Body_part (55 55) ())
	)
)
(13 Food (58 58)
	(
	)
)
(14 Motion_directional (59 59)
	(
		(Goal (62 62) ())
		(Theme (27 27) ())
	)
)
(15 Interior_profile_relation (53 53)
	(
		(Ground (55 55) (12))
		(Figure (50 50) ())
	)
)
(16 Desirability (68 68)
	(
		(Evaluee (66 66) ())
		(Degree (52 52) ())
	)
)
)
)
(
; story sentence text for lookup
("Susan loved to feed her cat." "She bought the best food for it." "She got the food out for the cat." "She put it in the bowl." "The cat ate the food.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (5 5) (1))
	)
)
(1 Animals (5 5)
	(
		(Animal (5 5) ())
		(Animal (4 4) ())
	)
)
(2 Ingestion (3 3)
	(
		(Ingestibles (5 5) (1))
		(Ingestor (0 0) ())
	)
)
(3 Commerce_buy (8 8)
	(
		(Buyer (0 0) ())
		(Goods (11 11) (4))
		(Recipient (13 13) ())
	)
)
(4 Food (11 11)
	(
	)
)
(5 Desirability (10 10)
	(
		(Evaluee (4 4) ())
		(Degree (10 10) ())
	)
)
(6 Getting (16 16)
	(
		(Theme (18 18) (8))
		(Recipient (0 0) ())
		(Source (22 22) (7))
	)
)
(7 Animals (22 22)
	(
		(Animal (22 22) ())
	)
)
(8 Food (18 18)
	(
		(Food (10 10) (5))
	)
)
(9 Placing (25 25)
	(
		(Agent (0 0) ())
		(Theme (26 26) ())
		(Goal (29 29) (10))
	)
)
(10 Containers (29 29)
	(
		(Container (5 5) (1))
	)
)
(11 Ingestion (33 33)
	(
		(Ingestibles (35 35) (12))
		(Ingestor (32 32) ())
	)
)
(12 Food (35 35)
	(
	)
)
)
)
(
; story sentence text for lookup
("These women came to the river to wash clothes." "They brought them in large baskets on their heads." "They dip the clothes in the water." "Then they put soap on them." "They lay the clothes on a large stone and pound them with a stick." "Then they dip them in the water again." "Now the clothes are white and clean.")
; events
(
(0 Natural_features (5 5)
	(
		(Locale (5 5) ())
	)
)
(1 Clothing (8 8)
	(
		(Garment (8 8) ())
	)
)
(2 Arriving (2 2)
	(
		(Purpose (8 8) (1))
		(Goal (5 5) (0))
		(Theme (1 1) (4))
	)
)
(3 Grooming (7 7)
	(
		(Patient (8 8) (1))
		(Agent (1 1) (4))
	)
)
(4 People (1 1)
	(
		(Person (1 1) ())
	)
)
(5 Containers (15 15)
	(
		(Container (5 5) (0))
		(Descriptor (14 14) (7))
	)
)
(6 Bringing (11 11)
	(
		(Agent (10 10) ())
		(Theme (12 12) ())
		(Depictive (5 5) (0))
		(Goal (8 8) (1))
	)
)
(7 Size (14 14)
	(
		(Entity (5 5) (0))
	)
)
(8 Body_parts (18 18)
	(
		(Possessor (17 17) ())
		(Body_part (8 8) (1))
	)
)
(9 Dunking (21 21)
	(
		(Agent (10 10) ())
		(Theme (23 23) (10))
		(Substance (26 26) ())
	)
)
(10 Clothing (23 23)
	(
		(Garment (23 23) ())
	)
)
(11 Spatial_contact (32 32)
	(
		(Figure (23 23) (10))
		(Ground (5 5) (0))
	)
)
(12 Placing (30 30)
	(
		(Goal (33 33) ())
		(Agent (1 1) (4))
		(Theme (23 23) (10))
	)
)
(13 Substance (31 31)
	(
		(Substance (23 23) (10))
	)
)
(14 Connectors (48 48)
	(
		(Connector (48 48) ())
	)
)
(15 Body_movement (44 44)
	(
		(Agent (10 10) ())
		(Body_part (45 45) ())
		(Body_part (48 48) (14))
	)
)
(16 Placing (36 36)
	(
		(Goal (42 42) ())
		(Agent (10 10) ())
		(Theme (23 23) (10))
	)
)
(17 Clothing (38 38)
	(
		(Garment (23 23) (10))
	)
)
(18 Size (41 41)
	(
		(Entity (17 17) ())
	)
)
(19 Dunking (52 52)
	(
		(Agent (1 1) (4))
		(Theme (23 23) (10))
		(Substance (26 26) ())
	)
)
(20 Temporal_collocation (59 59)
	(
		(Trajector_event (61 61) (21))
	)
)
(21 Clothing (61 61)
	(
		(Garment (12 12) ())
	)
)
(22 Color (63 63)
	(
		(Entity (61 61) (21))
	)
)
(23 Chemical-sense_description (65 65)
	(
		(Perceptual_source (61 61) (21))
	)
)
)
)
(
; story sentence text for lookup
("This boy has a hat." "His hat is black." "The bat is in his hand." "He has his bat." "This is a black hat." "The boy had a black hat." "This black hat is his." "I had a black bat." "The black bat is my bat." "The boy has his bat in his hand.")
; events
(
(0 Wearing (2 2)
	(
		(Clothing (4 4) (2))
		(Wearer (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Accoutrements (4 4)
	(
		(Accoutrement (4 4) ())
	)
)
(3 Accoutrements (7 7)
	(
		(Wearer (6 6) ())
		(Accoutrement (1 1) (1))
	)
)
(4 Color (9 9)
	(
		(Entity (1 1) (1))
	)
)
(5 Body_parts (16 16)
	(
		(Body_part (16 16) ())
		(Possessor (4 4) (2))
	)
)
(6 Interior_profile_relation (14 14)
	(
		(Ground (16 16) (5))
		(Figure (1 1) (1))
	)
)
(7 Possession (19 19)
	(
		(Possession (21 21) ())
		(Owner (6 6) ())
	)
)
(8 Accoutrements (27 27)
	(
		(Accoutrement (4 4) (2))
		(Descriptor (26 26) (9))
	)
)
(9 Color (26 26)
	(
		(Entity (4 4) (2))
		(Color (26 26) ())
	)
)
(10 Accoutrements (34 34)
	(
		(Accoutrement (16 16) (5))
		(Descriptor (4 4) (2))
	)
)
(11 Wearing (31 31)
	(
		(Clothing (34 34) (10))
		(Wearer (1 1) (1))
	)
)
(12 People_by_age (30 30)
	(
		(Person (1 1) (1))
	)
)
(13 Color (33 33)
	(
		(Entity (16 16) (5))
		(Color (4 4) (2))
	)
)
(14 Accoutrements (38 38)
	(
		(Accoutrement (38 38) ())
		(Descriptor (1 1) (1))
	)
)
(15 Color (37 37)
	(
		(Entity (38 38) (14))
		(Color (1 1) (1))
	)
)
(16 Color (45 45)
	(
		(Entity (4 4) (2))
		(Color (26 26) (9))
	)
)
(17 Color (49 49)
	(
		(Entity (38 38) (14))
		(Color (1 1) (1))
	)
)
(18 Have_associated (57 57)
	(
		(Entity (4 4) (2))
		(Place (62 62) (20))
		(Topical_entity (1 1) (1))
	)
)
(19 People_by_age (56 56)
	(
		(Person (1 1) (1))
	)
)
(20 Body_parts (62 62)
	(
		(Body_part (62 62) ())
		(Possessor (61 61) ())
	)
)
)
)
(
; story sentence text for lookup
("The boys and girls are having fine sport." "The snow on the hill is just right, and their sleds run well." "O, look at them!" "Elsie and Roy are ahead." "Ho, ho!" "There they go; Over the ice and over the snow.")
; events
(
(0 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Have_associated (5 5)
	(
		(Topical_entity (1 1) (0))
		(Entity (7 7) ())
	)
)
(2 Desirability (6 6)
	(
		(Evaluee (7 7) ())
	)
)
(3 People (3 3)
	(
		(Person (3 3) ())
	)
)
(4 Spatial_contact (11 11)
	(
		(Ground (13 13) (8))
		(Figure (10 10) (7))
	)
)
(5 Vehicle (20 20)
	(
		(Possessor (19 19) ())
		(Vehicle (20 20) ())
	)
)
(6 Self_motion (21 21)
	(
		(Manner (22 22) ())
		(Self_mover (20 20) (5))
	)
)
(7 Precipitation (10 10)
	(
		(Precipitation (1 1) (0))
		(Place (13 13) (8))
	)
)
(8 Natural_features (13 13)
	(
		(Locale (13 13) ())
	)
)
(9 Perception_active (26 26)
	(
		(Phenomenon (13 13) (8))
	)
)
(10 Non-gradable_proximity (34 34)
	(
		(Figure (30 30) ())
	)
)
(11 Precipitation (50 50)
	(
		(Precipitation (19 19) ())
	)
)
(12 Substance (46 46)
	(
		(Substance (46 46) ())
	)
)
)
)
(
; story sentence text for lookup
("Susie got a puppy." "One day she lost it." "She looked everywhere." "Finally she found it." "It was under her bed.")
; events
(
(0 Have_associated (1 1)
	(
		(Entity (3 3) (1))
		(Topical_entity (0 0) ())
	)
)
(1 Animals (3 3)
	(
		(Animal (3 3) ())
		(Animal (0 0) ())
	)
)
(2 Calendric_unit (6 6)
	(
		(Unit (6 6) ())
		(Salient_event (7 7) ())
	)
)
(3 Perception_active (12 12)
	(
		(Perceiver_agentive (0 0) ())
		(Ground (13 13) ())
	)
)
(4 Locating (17 17)
	(
		(Perceiver (6 6) (2))
		(Sought_entity (3 3) (1))
	)
)
(5 Non-gradable_proximity (22 22)
	(
		(Figure (0 0) ())
		(Ground (24 24) ())
	)
)
)
)
(
; story sentence text for lookup
("Lucy was searching on YouTube." "She found a great song." "She listened to it all day." "Lucy loved it." "She wanted to buy the album.")
; events
(
(0 Scrutiny (2 2)
	(
		(Cognizer (0 0) ())
		(Ground (4 4) ())
	)
)
(1 Becoming_aware (7 7)
	(
		(Cognizer (0 0) ())
		(Phenomenon (10 10) (2))
	)
)
(2 Text (10 10)
	(
		(Text (10 10) ())
		(Descriptor (9 9) (3))
	)
)
(3 Desirability (9 9)
	(
		(Evaluee (10 10) (2))
	)
)
(4 Perception_active (13 13)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (15 15) ())
	)
)
(5 Calendric_unit (17 17)
	(
		(Unit (17 17) ())
	)
)
(6 Experiencer_focus (20 20)
	(
		(Experiencer (0 0) ())
		(Content (21 21) ())
	)
)
(7 Desiring (24 24)
	(
		(Experiencer (0 0) ())
		(Event (28 28) (8))
	)
)
(8 Text (28 28)
	(
		(Text (17 17) (5))
	)
)
(9 Commerce_buy (26 26)
	(
		(Goods (28 28) (8))
		(Buyer (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Here is our fine new tent." "There is room for all of us." "Here is a fine flag for you, boys." "It is red, white and blue." "We have made it for the top of your tent." "We will take our flag and drum.")
; events
(
(0 Spatial_co-location (0 0)
	(
		(Figure (5 5) (2))
	)
)
(1 Age (4 4)
	(
		(Entity (5 5) (2))
	)
)
(2 Buildings (5 5)
	(
	)
)
(3 Desirability (3 3)
	(
		(Evaluee (5 5) (2))
	)
)
(4 Building_subparts (9 9)
	(
		(Building_part (9 9) ())
	)
)
(5 Quantified_mass (11 11)
	(
		(Mass (13 13) ())
		(Quantity (11 11) ())
	)
)
(6 Existence (7 8)
	(
		(Entity (11 11) (5))
	)
)
(7 Buildings (19 19)
	(
		(Type (11 11) (5))
		(Descriptor (18 18) (8))
	)
)
(8 Desirability (18 18)
	(
		(Evaluee (11 11) (5))
	)
)
(9 People_by_age (23 23)
	(
		(Person (23 23) ())
	)
)
(10 Color (27 27)
	(
		(Entity (25 25) ())
		(Color (9 9) (4))
	)
)
(11 Color (29 29)
	(
		(Entity (25 25) ())
	)
)
(12 Buildings (42 42)
	(
	)
)
(13 Part_orientational (39 39)
	(
		(Part (39 39) ())
		(Whole (42 42) (12))
	)
)
(14 Removing (46 46)
	(
		(Agent (25 25) ())
		(Theme (48 48) ())
	)
)
)
)
(
; story sentence text for lookup
("I was walking down the street." "I saw this guy hanging out." "I noticed he had a watch." "I asked him the time." "He told me it was 5:11.")
; events
(
(0 Self_motion (2 2)
	(
		(Self_mover (0 0) ())
		(Path (5 5) (1))
	)
)
(1 Roadways (5 5)
	(
		(Roadway (5 5) ())
	)
)
(2 Perception_experience (8 8)
	(
		(Phenomenon (10 10) (4))
		(Perceiver_passive (0 0) ())
		(Depictive (11 12) (3))
	)
)
(3 Personal_relationship (11 12)
	(
		(Partner_1 (10 10) (4))
	)
)
(4 People (10 10)
	(
		(Person (10 10) ())
	)
)
(5 Becoming_aware (15 15)
	(
		(Cognizer (0 0) ())
		(Phenomenon (16 16) ())
	)
)
(6 Accoutrements (19 19)
	(
		(Accoutrement (5 5) (1))
	)
)
(7 Possession (17 17)
	(
		(Possession (11 12) (3))
		(Owner (16 16) ())
	)
)
(8 Questioning (22 22)
	(
		(Speaker (0 0) ())
		(Addressee (16 16) ())
		(Message (24 25) ())
	)
)
(9 Telling (28 28)
	(
		(Speaker (0 0) ())
		(Addressee (16 16) ())
		(Message (5 5) (1))
	)
)
)
)
(
; story sentence text for lookup
("Here is May with her kitten." "Her mother gave the kitten to her." "She is kind to the pretty kitten." "She likes to see it jump and play." "See it run with May's ball!" "It does not run far with it." "If May can get the ball she will not take it." "She will give it to the kitten to play with.")
; events
(
(0 Spatial_co-location (0 0)
	(
		(Figure (2 2) ())
	)
)
(1 Appellations (5 5)
	(
		(Name (5 5) ())
		(Context (4 4) ())
	)
)
(2 Giving (9 9)
	(
		(Recipient (13 13) ())
		(Theme (11 11) ())
		(Donor (8 8) (3))
	)
)
(3 Representative (8 8)
	(
		(Context_of_acquaintance (7 7) ())
		(Representative (8 8) ())
	)
)
(4 Social_interaction_evaluation (17 17)
	(
		(Evaluee (7 7) ())
		(Affected_party (21 21) ())
	)
)
(5 Experiencer_focus (24 24)
	(
		(Experiencer (7 7) ())
		(Content (27 27) ())
	)
)
(6 Perception_experience (26 26)
	(
		(Perceiver_passive (7 7) ())
		(Depictive (28 30) (7 8))
		(Phenomenon (4 4) ())
	)
)
(7 Self_motion (28 28)
	(
		(Self_mover (4 4) ())
	)
)
(8 Competition (30 30)
	(
		(Participant_1 (4 4) ())
	)
)
(9 Perception_experience (32 32)
	(
		(Phenomenon (33 33) ())
	)
)
(10 Motion_noise (34 34)
	(
		(Manner (21 21) ())
		(Theme (8 8) (3))
	)
)
(11 Getting (51 51)
	(
		(Theme (53 53) ())
		(Recipient (8 8) (3))
	)
)
(12 Giving (62 62)
	(
		(Donor (7 7) ())
		(Purpose (67 69) (13))
		(Recipient (66 66) ())
		(Theme (63 63) ())
	)
)
(13 Competition (68 68)
	(
		(Manner (69 69) ())
		(Participant_1 (13 13) ())
	)
)
)
)
(
; story sentence text for lookup
("Two kids visited their friend's house." "His friend wasn't home." "A big dog was in the yard." "It ran over to the kids." "It bit them right on the hands.")
; events
(
(0 Visiting (2 2)
	(
		(Purpose (6 6) (3))
		(Agent (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Personal_relationship (4 4)
	(
		(Partner_2 (3 3) ())
	)
)
(3 Buildings (6 6)
	(
		(Building (6 6) ())
	)
)
(4 Personal_relationship (9 9)
	(
		(Partner_2 (8 8) ())
		(Partner_1 (1 1) (1))
	)
)
(5 Buildings (12 12)
	(
		(Place (1 1) (1))
	)
)
(6 Size (15 15)
	(
		(Entity (16 16) ())
	)
)
(7 Interior_profile_relation (18 18)
	(
		(Ground (20 20) (8))
		(Figure (16 16) ())
	)
)
(8 Locale_by_use (20 20)
	(
		(Locale (6 6) (3))
	)
)
(9 Self_motion (23 23)
	(
		(Self_mover (8 8) ())
		(Path (16 16) ())
		(Goal (27 27) (10))
	)
)
(10 People_by_age (27 27)
	(
		(Person (27 27) ())
	)
)
(11 Cause_harm (30 30)
	(
		(Cause (8 8) ())
		(Victim (16 16) ())
		(Body_part (6 6) (3))
	)
)
(12 Body_parts (35 35)
	(
		(Body_part (6 6) (3))
	)
)
)
)
(
; story sentence text for lookup
("We went in a hike in the woods by my house." "The trees were very high." "My brother climbed one of the trees." "We told him to get down." "He fell from the tree.")
; events
(
(0 Buildings (10 10)
	(
		(Building (10 10) ())
	)
)
(1 Natural_features (7 7)
	(
		(Relative_location (10 10) (0))
		(Locale (7 7) ())
	)
)
(2 Self_motion (4 4)
	(
		(Self_mover (0 0) ())
		(Place (10 10) (0))
		(Area (7 7) (1))
	)
)
(3 Non-gradable_proximity (8 8)
	(
		(Figure (7 7) (1))
		(Ground (10 10) (0))
	)
)
(4 Motion (1 1)
	(
		(Theme (0 0) ())
		(Goal (4 4) (2))
		(Goal (7 7) (1))
	)
)
(5 Measurable_attributes (16 16)
	(
		(Entity (13 13) ())
		(Degree (15 15) ())
	)
)
(6 Self_motion (20 20)
	(
		(Area (21 21) ())
		(Self_mover (13 13) ())
	)
)
(7 Kinship (19 19)
	(
		(Ego (0 0) ())
		(Alter (19 19) ())
	)
)
(8 Request (27 27)
	(
		(Speaker (0 0) ())
		(Addressee (28 28) ())
		(Message (29 31) ())
	)
)
(9 Motion_directional (34 34)
	(
		(Theme (0 0) ())
		(Direction (19 19) (7))
		(Source (4 4) (2))
	)
)
)
)
(
; story sentence text for lookup
("It was cold in my house." "I looked for a blanket." "The one I found was too small." "I found a bigger blanket." "I covered myself with the blanket.")
; events
(
(0 Ambient_temperature (2 2)
	(
		(Attribute (2 2) ())
		(Place (5 5) (1))
	)
)
(1 Buildings (5 5)
	(
		(Building (5 5) ())
	)
)
(2 Accoutrements (11 11)
	(
		(Accoutrement (11 11) ())
	)
)
(3 Scrutiny (8 8)
	(
		(Cognizer (7 7) ())
		(Phenomenon (11 11) (2))
	)
)
(4 Size (19 19)
	(
		(Entity (14 14) ())
		(Degree (5 5) (1))
	)
)
(5 Locating (16 16)
	(
		(Perceiver (2 2) (0))
		(Sought_entity (14 14) ())
	)
)
(6 Accoutrements (25 25)
	(
		(Accoutrement (11 11) (2))
		(Descriptor (24 24) (8))
	)
)
(7 Locating (22 22)
	(
		(Perceiver (7 7) ())
		(Sought_entity (25 25) (6))
	)
)
(8 Size (24 24)
	(
		(Entity (11 11) (2))
		(Degree (24 24) ())
	)
)
(9 Accoutrements (32 32)
	(
		(Accoutrement (5 5) (1))
	)
)
(10 Filling (28 28)
	(
		(Agent (7 7) ())
		(Goal (2 2) (0))
		(Theme (5 5) (1))
	)
)
)
)
(
; story sentence text for lookup
("I was driving my grandmother's truck." "She was holding coffee." "I took a sharp turn." "Coffee was all over her lap." "She was nice about it.")
; events
(
(0 Operate_vehicle (2 2)
	(
		(Driver (0 0) ())
		(Vehicle (6 6) (2))
	)
)
(1 Kinship (4 4)
	(
		(Alter (4 4) ())
		(Ego (3 3) ())
	)
)
(2 Vehicle (6 6)
	(
		(Possessor (3 5) (1))
		(Vehicle (6 6) ())
	)
)
(3 Manipulation (10 10)
	(
		(Agent (0 0) ())
		(Entity (3 3) ())
	)
)
(4 Food (11 11)
	(
		(Food (3 3) ())
	)
)
(5 Locative_relation (21 22)
	(
		(Figure (0 0) ())
		(Ground (24 24) (7))
	)
)
(6 Food (19 19)
	(
		(Food (0 0) ())
	)
)
(7 Body_parts (24 24)
	(
		(Body_part (24 24) ())
		(Possessor (4 4) (1))
	)
)
(8 Sociability (28 28)
	(
		(Protagonist (0 0) ())
		(Content (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("Shannon saw a bird in the tree in her backyard." "It was making a nest!" "It took the bird hours." "Finally, she was done." "She sat down in the nest to rest.")
; events
(
(0 Perception_experience (1 1)
	(
		(Ground (6 6) ())
		(Phenomenon (3 3) ())
		(Perceiver_passive (0 0) ())
	)
)
(1 Building_subparts (9 9)
	(
		(Whole (8 8) ())
		(Building_part (9 9) ())
	)
)
(2 Interior_profile_relation (4 4)
	(
		(Ground (6 6) ())
		(Figure (3 3) ())
	)
)
(3 Building (13 13)
	(
		(Agent (0 0) ())
		(Created_entity (15 15) ())
	)
)
(4 Calendric_unit (21 21)
	(
		(Unit (21 21) ())
		(Salient_event (20 20) ())
	)
)
(5 Time_vector (23 23)
	(
		(Event (25 27) (6))
	)
)
(6 Activity_finish (27 27)
	(
		(Agent (25 25) ())
	)
)
(7 Change_posture (30 31)
	(
		(Protagonist (0 0) ())
		(Purpose (35 36) (8))
		(Location (34 34) ())
	)
)
(8 Exercising (36 36)
	(
		(Agent (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Ada has a fan in her hand." "These fans are May's." "Ada has May's white fan.")
; events
(
(0 Possession (1 1)
	(
		(Possession (3 3) ())
		(Owner (0 0) ())
		(Depictive (6 6) (1))
	)
)
(1 Body_parts (6 6)
	(
		(Possessor (5 5) ())
		(Body_part (6 6) ())
	)
)
(2 Color (18 18)
	(
		(Color (18 18) ())
		(Entity (5 5) ())
	)
)
)
)
(
; story sentence text for lookup
("My granddad has a pond." "He has let me feed the fish." "The fish know you are coming." "The water starts to move." "Then you throw in the food.")
; events
(
(0 Kinship (1 1)
	(
		(Alter (1 1) ())
		(Ego (0 0) ())
	)
)
(1 Natural_features (4 4)
	(
		(Locale (4 4) ())
	)
)
(2 Preventing_or_letting (8 8)
	(
		(Potential_hindrance (0 0) ())
		(Event (9 9) ())
	)
)
(3 Ingestion (10 10)
	(
		(Ingestor (0 0) ())
		(Ingestibles (12 12) (4))
		(Ingestor (9 9) ())
	)
)
(4 Food (12 12)
	(
	)
)
(5 Awareness (16 16)
	(
		(Content (17 17) ())
		(Cognizer (15 15) ())
	)
)
(6 Arriving (19 19)
	(
		(Theme (9 9) ())
	)
)
(7 Activity_start (23 23)
	(
		(Activity (24 25) (8))
		(Agent (15 15) ())
	)
)
(8 Motion (25 25)
	(
		(Theme (15 15) ())
	)
)
(9 Cause_motion (29 30)
	(
		(Theme (32 32) (10))
		(Agent (1 1) (0))
	)
)
(10 Food (32 32)
	(
	)
)
)
)
(
; story sentence text for lookup
("It is raining." "It rains on the cows and the calf." "It rains on the man and the horses." "One of the horses is drinking from the brook." "The rain makes the grass and the flowers grow.")
; events
(
(0 Precipitation (2 2)
	(
		(Precipitation (2 2) ())
	)
)
(1 Precipitation (5 5)
	(
		(Precipitation (5 5) ())
		(Precipitation (4 4) ())
		(Place (8 8) ())
	)
)
(2 Precipitation (14 14)
	(
		(Precipitation (5 5) (1))
		(Precipitation (4 4) ())
		(Place (8 8) ())
	)
)
(3 People (17 17)
	(
		(Person (17 17) ())
	)
)
(4 Ingestion (27 27)
	(
		(Ingestor (22 22) ())
		(Source (30 30) (5))
	)
)
(5 Natural_features (30 30)
	(
		(Locale (30 30) ())
	)
)
(6 Causation (34 34)
	(
		(Effect (30 30) (5))
		(Effect (36 36) ())
		(Cause (33 33) (7))
	)
)
(7 Precipitation (33 33)
	(
		(Precipitation (5 5) (1))
	)
)
(8 Ontogeny (40 40)
	(
		(Entity (36 36) ())
	)
)
)
)
(
; story sentence text for lookup
("Billy was playing outside." "He tripped over a rock." "Both of his shoes came off." "He picked up both shoes." "He put his shoes back on his feet.")
; events
(
(0 Hearsay (2 2)
	(
		(Speaker (0 0) ())
		(Time (3 3) (1))
	)
)
(1 Part_inner_outer (3 3)
	(
	)
)
(2 Self_motion (6 6)
	(
		(Self_mover (0 0) ())
		(Path (9 9) ())
	)
)
(3 Undressing (15 16)
	(
		(Clothing (11 11) ())
	)
)
(4 Clothing (14 14)
	(
		(Wearer (13 13) ())
		(Garment (3 3) (1))
	)
)
(5 Clothing (22 22)
	(
		(Garment (22 22) ())
	)
)
(6 Placing (25 25)
	(
		(Theme (27 27) (8))
		(Agent (0 0) ())
		(Time (22 22) (5))
		(Goal (31 31) (7))
	)
)
(7 Body_parts (31 31)
	(
		(Body_part (31 31) ())
		(Possessor (30 30) ())
	)
)
(8 Clothing (27 27)
	(
		(Wearer (13 13) ())
		(Garment (3 3) (1))
	)
)
)
)
(
; story sentence text for lookup
("Ellen opened the door of the cage to give her bird some water." "The little bird flew out." "It flew into a tree in the yard." "Can you see it sitting in the tree?" "Ellen sees it, but she cannot get it." "The bird did not like to live in the cage." "It likes to fly among the trees.Now it is singing and very happy.")
; events
(
(0 Connecting_architecture (3 3)
	(
		(Whole (6 6) (2))
		(Part (3 3) ())
	)
)
(1 Giving (8 8)
	(
		(Donor (0 0) ())
		(Recipient (9 10) ())
		(Theme (12 12) (3))
	)
)
(2 Containers (6 6)
	(
		(Container (6 6) ())
	)
)
(3 Food (12 12)
	(
	)
)
(4 Closure (1 1)
	(
		(Result (12 12) (3))
		(Agent (0 0) ())
		(Container_portal (3 3) (0))
	)
)
(5 Self_motion (17 17)
	(
		(Self_mover (16 16) ())
		(Source (18 18) ())
	)
)
(6 Size (15 15)
	(
		(Entity (16 16) ())
	)
)
(7 Motion_noise (21 21)
	(
		(Theme (0 0) ())
		(Goal (24 24) ())
	)
)
(8 Locale_by_use (27 27)
	(
		(Locale (27 27) ())
	)
)
(9 Perception_experience (31 31)
	(
		(State (36 36) ())
		(Perceiver_passive (30 30) ())
		(Phenomenon (3 3) (0))
	)
)
(10 Posture (33 33)
	(
		(Point_of_contact (18 18) ())
		(Location (36 36) ())
		(Agent (3 3) (0))
	)
)
(11 Perception_experience (39 39)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (16 16) ())
	)
)
(12 Experiencer_focus (53 53)
	(
		(Content (58 58) (13))
		(Experiencer (50 50) ())
	)
)
(13 Containers (58 58)
	(
		(Container (58 58) ())
	)
)
(14 Residence (55 55)
	(
		(Resident (50 50) ())
		(Location (58 58) (13))
	)
)
(15 Communication_noise (71 71)
	(
		(Speaker (58 58) (13))
	)
)
(16 Self_motion (63 63)
	(
		(Self_mover (0 0) ())
		(Area (6 6) (2))
	)
)
(17 Experiencer_focus (61 61)
	(
		(Experiencer (0 0) ())
		(Content (3 3) (0))
	)
)
(18 Temporal_collocation (68 68)
	(
		(Trajector_event (69 69) ())
	)
)
(19 Emotion_directed (74 74)
	(
		(Experiencer (58 58) (13))
		(Degree (73 73) ())
	)
)
)
)
(
; story sentence text for lookup
("Here is a fisherman." "He is ready to put his net into the water." "He stands on two long poles over the water." "He has a basket for his fish." "His net is larger than Simeon's net." "The men in the boats use a larger net than this.")
; events
(
(0 Activity_ready_state (7 7)
	(
		(Protagonist (5 5) ())
		(Activity (11 11) ())
	)
)
(1 Placing (9 9)
	(
		(Goal (14 14) ())
		(Agent (5 5) ())
		(Theme (11 11) ())
	)
)
(2 Posture (17 17)
	(
		(Point_of_contact (17 17) ())
		(Agent (5 5) ())
		(Location (21 21) ())
		(Location (24 24) (3))
	)
)
(3 Natural_features (24 24)
	(
		(Locale (24 24) ())
	)
)
(4 Measurable_attributes (20 20)
	(
		(Entity (21 21) ())
		(Attribute (20 20) ())
	)
)
(5 Possession (27 27)
	(
		(Owner (5 5) ())
		(Possession (29 29) (7))
	)
)
(6 Food (32 32)
	(
	)
)
(7 Containers (29 29)
	(
		(Use (32 32) (6))
		(Container (29 29) ())
	)
)
(8 Size (37 37)
	(
		(Standard (41 41) ())
		(Entity (35 35) ())
	)
)
(9 Vehicle (47 47)
	(
		(Vehicle (20 20) (4))
	)
)
(10 People (44 44)
	(
		(Descriptor (47 47) (9))
		(Person (17 17) (2))
	)
)
(11 Using (48 48)
	(
		(Instrument (51 51) ())
		(Agent (44 44) (10))
	)
)
(12 Size (50 50)
	(
		(Degree (50 50) ())
		(Standard (53 53) ())
		(Entity (24 24) (3))
	)
)
)
)
(
; story sentence text for lookup
("Ethan went to Haiti." "He wanted to look like the people." "He went to a market to get clothes." "He saw some sandals." "He bought them.")
; events
(
(0 Motion (1 1)
	(
		(Goal (3 3) ())
		(Theme (0 0) ())
	)
)
(1 Desiring (6 6)
	(
		(Experiencer (0 0) ())
		(Event (11 11) (3))
	)
)
(2 Similarity (9 9)
	(
		(Entity_1 (0 0) ())
		(Entity_2 (11 11) (3))
	)
)
(3 People (11 11)
	(
		(Person (11 11) ())
	)
)
(4 Give_impression (8 8)
	(
		(Phenomenon (0 0) ())
		(Characterization (11 11) (3))
	)
)
(5 Motion (14 14)
	(
		(Theme (0 0) ())
		(Purpose (20 20) (6))
		(Goal (17 17) ())
	)
)
(6 Clothing (20 20)
	(
		(Garment (20 20) ())
	)
)
(7 Getting (19 19)
	(
		(Recipient (0 0) ())
		(Theme (20 20) (6))
	)
)
(8 Perception_experience (23 23)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (17 17) ())
	)
)
(9 Clothing (25 25)
	(
		(Garment (25 25) ())
	)
)
(10 Commerce_buy (28 28)
	(
		(Buyer (0 0) ())
		(Goods (29 29) ())
	)
)
)
)
(
; story sentence text for lookup
("The man put on a hat." "It made his head itch." "He looked at the label." "The label said it was wool." "The man decided he didn't like wool.")
; events
(
(0 Dressing (2 3)
	(
		(Clothing (5 5) (2))
		(Wearer (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Accoutrements (5 5)
	(
		(Accoutrement (5 5) ())
	)
)
(3 Perception_body (11 11)
	(
		(Body_part (10 10) (4))
	)
)
(4 Body_parts (10 10)
	(
		(Possessor (9 9) ())
		(Body_part (10 10) ())
	)
)
(5 Perception_active (14 14)
	(
		(Perceiver_agentive (13 13) ())
		(Phenomenon (17 17) ())
	)
)
(6 Statement (21 21)
	(
		(Message (22 22) ())
		(Speaker (1 1) (1))
	)
)
(7 Rest (20 20)
	(
		(Whole (1 1) (1))
	)
)
(8 Experiencer_focus (32 32)
	(
		(Content (33 33) ())
		(Experiencer (10 10) (4))
	)
)
(9 Deciding (28 28)
	(
		(Decision (29 29) ())
		(Cognizer (1 1) (1))
	)
)
(10 People (27 27)
	(
		(Person (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("Julie's dog was always cold." "She gave her a dog sweater." "The dog loved it!" "She could run around outside in the cold." "Julie liked to see her dog happy.")
; events
(
(0 Frequency (4 4)
	(
		(Event (5 5) (1))
		(Event (2 2) ())
	)
)
(1 Temperature (5 5)
	(
		(Entity (2 2) ())
	)
)
(2 Clothing (12 12)
	(
		(Garment (5 5) (1))
		(Use (11 11) ())
	)
)
(3 Giving (8 8)
	(
		(Donor (7 7) ())
		(Recipient (9 9) ())
		(Theme (12 12) (2))
	)
)
(4 Experiencer_focus (16 16)
	(
		(Content (17 17) ())
		(Experiencer (15 15) ())
	)
)
(5 Self_motion (21 21)
	(
		(Self_mover (7 7) ())
		(Area (11 11) ())
		(Depictive (26 26) (8))
		(Area (17 17) ())
	)
)
(6 Possibility (20 20)
	(
		(Possible_event (7 7) ())
		(Possible_event (26 26) (8))
	)
)
(7 Interior_profile_relation (23 23)
	(
		(Figure (7 7) ())
	)
)
(8 Ambient_temperature (26 26)
	(
		(Temperature (26 26) ())
	)
)
(9 Experiencer_focus (29 29)
	(
		(Experiencer (7 7) ())
		(Content (33 33) ())
	)
)
(10 Perception_experience (31 31)
	(
		(Perceiver_passive (7 7) ())
		(Phenomenon (34 34) (11))
		(Phenomenon (33 33) ())
	)
)
(11 Emotion_directed (34 34)
	(
		(Experiencer (33 33) ())
	)
)
)
)
(
; story sentence text for lookup
("I went to the pond behind my house." "We used crickets." "I caught a brim." "I let it go." "My friend didn't catch anything.")
; events
(
(0 Natural_features (4 4)
	(
		(Locale (4 4) ())
		(Relative_location (7 7) (3))
	)
)
(1 Motion (1 1)
	(
		(Theme (0 0) ())
		(Goal (4 4) (0))
	)
)
(2 Non-gradable_proximity (5 5)
	(
		(Ground (7 7) (3))
		(Figure (4 4) (0))
	)
)
(3 Buildings (7 7)
	(
		(Building (7 7) ())
	)
)
(4 Using (10 10)
	(
		(Agent (0 0) ())
		(Instrument (11 11) (5))
	)
)
(5 Dead_or_alive (11 11)
	(
		(Protagonist (11 11) ())
	)
)
(6 Degree (14 14)
	(
		(Gradable_attribute (0 0) ())
		(Gradable_attribute (16 16) (7))
	)
)
(7 Clothing_parts (16 16)
	(
		(Material (16 16) ())
	)
)
(8 Personal_relationship (24 24)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (24 24) ())
	)
)
)
)
(
; story sentence text for lookup
("The tree started to grow." "It was in another tree's shadow." "It needed more sun." "One day the other tree fell." "The tree grew quickly then.")
; events
(
(0 Activity_start (2 2)
	(
		(Activity (3 4) (1))
		(Agent (1 1) ())
	)
)
(1 Ontogeny (4 4)
	(
		(Entity (1 1) ())
	)
)
(2 Interior_profile_relation (8 8)
	(
		(Figure (6 6) ())
		(Ground (12 12) ())
	)
)
(3 Increment (9 9)
	(
		(Class (12 12) ())
	)
)
(4 Increment (16 16)
	(
		(Class (17 17) ())
	)
)
(5 Needing (15 15)
	(
		(Requirement (17 17) ())
		(Cognizer (6 6) ())
	)
)
(6 Calendric_unit (20 20)
	(
		(Count (6 6) ())
		(Unit (20 20) ())
	)
)
(7 Motion_directional (24 24)
	(
		(Direction (24 24) ())
		(Theme (23 23) ())
		(Time (1 1) ())
	)
)
(8 Increment (22 22)
	(
		(Class (23 23) ())
	)
)
(9 Ontogeny (28 28)
	(
		(Time (23 23) ())
		(Manner (17 17) ())
		(Entity (1 1) ())
	)
)
(10 Speed_description (29 29)
	(
		(Entity (27 27) ())
	)
)
(11 Temporal_collocation (30 30)
	(
		(Trajector_event (27 27) ())
	)
)
)
)
(
; story sentence text for lookup
("I went to this new pizza place yesterday." "It was absolutely amazing." "I could not stop eating." "I wanted more." "I knew I had to go back.")
; events
(
(0 Motion (1 1)
	(
		(Theme (0 0) ())
		(Time (7 7) (3))
		(Goal (6 6) (2))
	)
)
(1 Age (4 4)
	(
		(Entity (6 6) (2))
	)
)
(2 Locale (6 6)
	(
		(Constituent_parts (5 5) ())
		(Locale (6 6) ())
	)
)
(3 Calendric_unit (7 7)
	(
		(Unit (7 7) ())
	)
)
(4 Desirability (12 12)
	(
		(Evaluee (0 0) ())
		(Degree (11 11) ())
	)
)
(5 Ingestion (18 18)
	(
		(Ingestor (0 0) ())
	)
)
(6 Activity_stop (17 17)
	(
		(Agent (0 0) ())
		(Activity (18 18) (5))
	)
)
(7 Increment (22 22)
	(
		(Added_set (11 11) ())
	)
)
(8 Desiring (21 21)
	(
		(Experiencer (0 0) ())
		(Focal_participant (11 11) ())
	)
)
(9 Motion (29 29)
	(
		(Theme (11 11) ())
		(Goal (6 6) (2))
	)
)
(10 Awareness (25 25)
	(
		(Cognizer (0 0) ())
		(Content (6 6) (2))
	)
)
(11 Required_event (27 28)
	(
		(Required_situation (6 6) (2))
		(Required_situation (11 11) ())
	)
)
)
)
(
; story sentence text for lookup
("Lisa was running through the park." "She loved playing with her dog." "They played catch." "At the end she went in the lake." "She loved to swim in it.")
; events
(
(0 Self_motion (2 2)
	(
		(Self_mover (0 0) ())
		(Path (5 5) (1))
	)
)
(1 Locale_by_use (5 5)
	(
		(Locale (5 5) ())
	)
)
(2 Bragging (9 9)
	(
		(Speaker (0 0) ())
		(Means (5 5) (1))
	)
)
(3 Experiencer_focus (8 8)
	(
		(Experiencer (0 0) ())
		(Content (12 12) (4))
	)
)
(4 Animals (12 12)
	(
		(Animal (5 5) (1))
	)
)
(5 Temporal_subregion (20 20)
	(
		(Subpart (20 20) ())
	)
)
(6 Motion (22 22)
	(
		(Time (20 20) (5))
		(Goal (25 25) (7))
		(Theme (21 21) ())
	)
)
(7 Natural_features (25 25)
	(
		(Locale (25 25) ())
	)
)
(8 Experiencer_focus (28 28)
	(
		(Experiencer (0 0) ())
		(Content (12 12) (4))
	)
)
(9 Self_motion (30 30)
	(
		(Area (32 32) ())
		(Self_mover (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The sun set." "The man was still lost." "He felt himself panic." "He controlled the panic." "He waited for help to find him.")
; events
(
(0 Sidereal_appearance (2 2)
	(
		(Astronomical_entity (1 1) (1))
	)
)
(1 Location_of_light (1 1)
	(
	)
)
(2 People (5 5)
	(
		(Person (5 5) ())
	)
)
(3 Perception_experience (11 11)
	(
		(Perceiver_passive (10 10) ())
		(Phenomenon (12 12) ())
	)
)
(4 Experiencer_focus (13 13)
	(
		(Experiencer (10 10) ())
		(Content (12 12) ())
	)
)
(5 Experiencer_focus (18 18)
	(
	)
)
(6 Expectation (21 21)
	(
		(Cognizer (10 10) ())
		(Phenomenon (23 23) (7))
	)
)
(7 Assistance (23 23)
	(
		(Goal (26 26) ())
	)
)
(8 Locating (25 25)
	(
		(Perceiver (10 10) ())
		(Sought_entity (26 26) ())
	)
)
)
)
(
; story sentence text for lookup
("The boy shot a basket." "It bounced hard off the rim." "It went into the street." "His brother ran after it." "He caught it in the street.")
; events
(
(0 Use_firearm (2 2)
	(
		(Place (4 4) ())
		(Agent (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Self_motion (7 7)
	(
		(Self_mover (6 6) ())
		(Manner (8 8) ())
		(Source (11 11) ())
	)
)
(3 Roadways (17 17)
	(
		(Roadway (17 17) ())
	)
)
(4 Self_motion (21 21)
	(
		(Path (4 4) ())
		(Self_mover (1 1) (1))
	)
)
(5 Kinship (20 20)
	(
		(Ego (6 6) ())
		(Alter (1 1) (1))
	)
)
(6 Roadways (30 30)
	(
		(Roadway (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("I wanted a new rain coat." "I went to the store to find one." "There was a very small selection." "I found a bright pink one." "It was perfect for me.")
; events
(
(0 Clothing (5 5)
	(
		(Garment (5 5) ())
		(Use (4 4) ())
		(Descriptor (3 3) (2))
	)
)
(1 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Focal_participant (5 5) (0))
	)
)
(2 Age (3 3)
	(
		(Entity (5 5) (0))
		(Age (3 3) ())
	)
)
(3 Motion (8 8)
	(
		(Theme (0 0) ())
		(Purpose (14 14) ())
		(Goal (11 11) (4))
	)
)
(4 Businesses (11 11)
	(
		(Business (4 4) ())
	)
)
(5 Locating (13 13)
	(
		(Perceiver (0 0) ())
		(Sought_entity (14 14) ())
	)
)
(6 Choosing (21 21)
	(
		(Chosen (19 20) ())
	)
)
(7 Locating (24 24)
	(
		(Perceiver (0 0) ())
		(Sought_entity (28 28) ())
	)
)
(8 Color (27 27)
	(
		(Entity (5 5) (0))
		(Color (4 4) ())
		(Color_qualifier (3 3) (2))
	)
)
(9 Location_of_light (26 26)
	(
		(Figure (5 5) (0))
	)
)
(10 Suitability (32 32)
	(
		(Evaluee (0 0) ())
		(Purpose (19 20) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom moved to a new city." "He couldn't find a church he liked." "He tried going to a black church." "Tom had a lot of fun there." "He returned often.")
; events
(
(0 Political_locales (5 5)
	(
		(Locale (5 5) ())
		(Descriptor (4 4) (1))
	)
)
(1 Age (4 4)
	(
		(Entity (5 5) (0))
		(Age (4 4) ())
	)
)
(2 Locating (10 10)
	(
		(Perceiver (7 7) ())
		(Sought_entity (12 12) (4))
	)
)
(3 Experiencer_focus (14 14)
	(
		(Experiencer (13 13) ())
		(Content (12 12) (4))
	)
)
(4 Buildings (12 12)
	(
		(Building (5 5) (0))
	)
)
(5 Motion (18 18)
	(
		(Theme (7 7) ())
		(Goal (22 22) (7))
	)
)
(6 Attempt (17 17)
	(
		(Agent (7 7) ())
		(Goal (22 22) (7))
	)
)
(7 Buildings (22 22)
	(
		(Building (13 13) ())
	)
)
(8 Quantified_mass (26 27)
	(
		(Quantity (27 27) ())
		(Mass (12 12) (4))
	)
)
(9 Stimulus_focus (29 29)
	(
		(Stimulus (7 7) ())
		(Stimulus (27 27) ())
	)
)
(10 Frequency (34 34)
	(
		(Event (32 32) ())
	)
)
(11 Arriving (33 33)
	(
		(Theme (7 7) ())
	)
)
)
)
(
; story sentence text for lookup
("The man with the big hat has a cow.")
; events
(
(0 Accoutrements (5 5)
	(
		(Accoutrement (5 5) ())
		(Descriptor (4 4) (2))
	)
)
(1 People (1 1)
	(
		(Descriptor (5 5) (0))
		(Person (1 1) ())
	)
)
(2 Size (4 4)
	(
		(Entity (5 5) (0))
	)
)
)
)
(
; story sentence text for lookup
("Ellen moved to a new city." "She didn't know where anything was." "It was hard." "Living in her hometown was easier." "Ellen moved back home.")
; events
(
(0 Political_locales (5 5)
	(
		(Locale (5 5) ())
		(Descriptor (4 4) (1))
	)
)
(1 Age (4 4)
	(
		(Entity (5 5) (0))
		(Age (4 4) ())
	)
)
(2 Awareness (10 10)
	(
		(Cognizer (7 7) ())
		(Content (12 12) ())
	)
)
(3 Difficulty (17 17)
	(
		(Activity (7 7) ())
	)
)
(4 Residence (19 19)
	(
		(Location (22 22) (5))
	)
)
(5 Foreign_or_domestic_country (22 22)
	(
		(Population (21 21) ())
		(Current_country (22 22) ())
	)
)
(6 Difficulty (24 24)
	(
		(Activity (22 22) (5))
	)
)
)
)
(
; story sentence text for lookup
("Brenda was a nurse." "She had two kids." "She moved to a new town." "Then they grew up." "So she went back to work.")
; events
(
(0 Medical_professionals (3 3)
	(
		(Professional (0 0) ())
		(Professional (3 3) ())
	)
)
(1 Cardinal_numbers (7 7)
	(
		(Number (7 7) ())
		(Entity (3 3) (0))
	)
)
(2 Giving_birth (6 6)
	(
		(Child (8 8) (3))
		(Mother (0 0) ())
	)
)
(3 Kinship (8 8)
	(
		(Ego (0 0) ())
		(Alter (3 3) (0))
	)
)
(4 Political_locales (15 15)
	(
		(Locale (15 15) ())
		(Descriptor (14 14) (5))
	)
)
(5 Age (14 14)
	(
		(Entity (15 15) (4))
		(Age (14 14) ())
	)
)
(6 Ontogeny (19 20)
	(
		(Time (0 0) ())
		(Entity (18 18) ())
	)
)
(7 Motion (24 24)
	(
		(Goal (27 27) (8))
		(Theme (18 18) ())
		(Direction (3 3) (0))
	)
)
(8 Being_employed (27 27)
	(
		(Employee (18 18) ())
	)
)
)
)
(
; story sentence text for lookup
("Here come Jack and Jill on a red sled.")
; events
(
(0 Color (7 7)
	(
		(Color (7 7) ())
		(Entity (8 8) (3))
	)
)
(1 Locative_relation (0 0)
	(
		(Figure (2 2) ())
	)
)
(2 Arriving (1 1)
	(
		(Goal (0 0) (1))
		(Theme (2 2) ())
		(Mode_of_transportation (8 8) (3))
	)
)
(3 Accoutrements (8 8)
	(
		(Descriptor (7 7) (0))
		(Accoutrement (8 8) ())
	)
)
)
)
(
; story sentence text for lookup
("The sun has set, and the pond is still." "John, Ned, Ben, Tom, and Nell stand on the bank, and look at the duck." "The dog with a black spot on his back, is with Tom." "See!" "Tom has his hat in his hand." "He has left his big top on the box.")
; events
(
(0 Continued_state_of_affairs (9 9)
	(
		(Reference_occasion (9 9) ())
		(State_of_affairs (7 7) (2))
	)
)
(1 Subordinates_and_superiors (1 1)
	(
		(Subordinate (1 1) ())
	)
)
(2 Natural_features (7 7)
	(
		(Locale (7 7) ())
	)
)
(3 Sidereal_appearance (3 3)
	(
		(Astronomical_entity (1 1) (1))
	)
)
(4 Posture (21 21)
	(
		(Point_of_contact (21 21) ())
		(Agent (11 11) ())
		(Location (24 24) ())
	)
)
(5 Perception_active (27 27)
	(
		(Perceiver_agentive (11 11) ())
		(Phenomenon (30 30) ())
	)
)
(6 Body_parts (40 40)
	(
		(Body_part (40 40) ())
		(Possessor (7 7) (2))
	)
)
(7 Hair_configuration (43 43)
	(
		(Possessor (44 44) ())
		(Possessor (33 33) ())
	)
)
(8 Color (36 36)
	(
		(Entity (37 37) ())
		(Color (36 36) ())
	)
)
(9 Visiting (46 46)
	(
	)
)
(10 Manipulation (49 49)
	(
		(Entity (51 51) (12))
		(Agent (48 48) ())
		(Locus (54 54) (11))
	)
)
(11 Body_parts (54 54)
	(
		(Possessor (37 37) ())
		(Body_part (54 54) ())
	)
)
(12 Accoutrements (51 51)
	(
		(Wearer (50 50) ())
		(Accoutrement (51 51) ())
	)
)
(13 Containers (64 64)
	(
		(Container (40 40) (6))
	)
)
(14 Abandonment (58 58)
	(
		(Agent (48 48) ())
		(Place (7 7) (2))
		(Theme (61 61) (15))
	)
)
(15 Clothing_parts (61 61)
	(
		(Subpart (37 37) ())
		(Descriptor (36 36) (8))
		(Wearer (51 51) (12))
	)
)
)
)
(
; story sentence text for lookup
("Three birds are in the tree." "One is a pretty red bird." "You can not catch it." "It is high in the tree." "The red bird can see the boys with the drum." "It can see the little girl with the red dress." "It can see the good baby and the pretty doll." "It can see the man in the field.")
; events
(
(0 Cardinal_numbers (0 0)
	(
		(Entity (1 1) ())
		(Number (0 0) ())
	)
)
(1 Interior_profile_relation (3 3)
	(
		(Ground (5 5) (2))
		(Figure (1 1) ())
	)
)
(2 Natural_features (5 5)
	(
		(Locale (5 5) ())
	)
)
(3 Cardinal_numbers (7 7)
	(
		(Number (0 0) (0))
	)
)
(4 Color (11 11)
	(
		(Entity (5 5) (2))
		(Color (11 11) ())
	)
)
(5 Aesthetics (10 10)
	(
		(Entity (5 5) (2))
	)
)
(6 Perception_experience (31 31)
	(
		(Perceiver_passive (29 29) ())
		(Phenomenon (33 33) (9))
	)
)
(7 Color (28 28)
	(
		(Entity (29 29) ())
		(Color (1 1) ())
	)
)
(8 Possibility (30 30)
	(
		(Possible_event (29 29) ())
		(Possible_event (33 33) (9))
	)
)
(9 People_by_age (33 33)
	(
		(Descriptor (36 36) ())
		(Person (33 33) ())
	)
)
(10 People (43 43)
	(
		(Person (5 5) (2))
		(Persistent_characteristic (11 11) (4))
		(Descriptor (47 47) (11))
	)
)
(11 Clothing (47 47)
	(
		(Descriptor (46 46) (14))
		(Garment (47 47) ())
	)
)
(12 Perception_experience (40 40)
	(
		(Perceiver_passive (0 0) (0))
		(Phenomenon (43 43) (10))
	)
)
(13 Wearing (44 44)
	(
		(Clothing (36 36) ())
		(Wearer (43 43) (10))
	)
)
(14 Color (46 46)
	(
		(Color (46 46) ())
		(Entity (47 47) (11))
	)
)
(15 Gizmo (39 39)
	(
		(Use (43 43) (10))
		(User (0 0) (0))
	)
)
(16 Size (42 42)
	(
		(Entity (5 5) (2))
	)
)
(17 People_by_age (54 54)
	(
		(Person (5 5) (2))
		(Persistent_characteristic (11 11) (4))
	)
)
(18 Perception_experience (51 51)
	(
		(Perceiver_passive (0 0) (0))
		(Phenomenon (43 43) (10))
	)
)
(19 Aesthetics (57 57)
	(
		(Entity (47 47) (11))
	)
)
(20 Gizmo (50 50)
	(
		(User (0 0) (0))
		(Use (43 43) (10))
	)
)
(21 Desirability (53 53)
	(
		(Evaluee (5 5) (2))
	)
)
(22 Perception_experience (62 62)
	(
		(Perceiver_passive (0 0) (0))
		(Phenomenon (64 64) (24))
	)
)
(23 Possibility (61 61)
	(
		(Possible_event (0 0) (0))
		(Possible_event (64 64) (24))
	)
)
(24 People (64 64)
	(
		(Person (11 11) (4))
	)
)
(25 Locale_by_use (67 67)
	(
		(Locale (67 67) ())
	)
)
)
)
(
; story sentence text for lookup
("My friend has a hat." "The wind blew his hat away." "My friend chased his hat." "I chased his hat with him." "We caught my friends hat.")
; events
(
(0 Possession (2 2)
	(
		(Possession (4 4) (2))
		(Owner (1 1) (1))
	)
)
(1 Personal_relationship (1 1)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (1 1) ())
	)
)
(2 Accoutrements (4 4)
	(
		(Accoutrement (4 4) ())
	)
)
(3 Cause_motion (8 8)
	(
		(Theme (4 4) (2))
		(Result (11 11) ())
		(Agent (1 1) (1))
	)
)
(4 Accoutrements (10 10)
	(
		(Accoutrement (4 4) (2))
		(Wearer (9 9) ())
	)
)
(5 Cotheme (15 15)
	(
		(Cotheme (4 4) (2))
		(Theme (1 1) (1))
	)
)
(6 Personal_relationship (14 14)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (1 1) (1))
	)
)
(7 Accoutrements (17 17)
	(
		(Accoutrement (4 4) (2))
		(Wearer (9 9) ())
	)
)
(8 Cotheme (20 20)
	(
		(Theme (0 0) ())
		(Cotheme (22 22) (9))
		(Manner (24 24) ())
	)
)
(9 Accoutrements (22 22)
	(
		(Accoutrement (9 9) ())
		(Wearer (21 21) ())
	)
)
(10 Accoutrements (30 30)
	(
		(Wearer (21 21) ())
		(Accoutrement (4 4) (2))
		(Style (9 9) ())
	)
)
)
)
(
; story sentence text for lookup
("A new pizza place opened up." "I decided to try it." "It was great." "I got to customize my pizza." "I decided to go back the next day.")
; events
(
(0 Food (2 2)
	(
	)
)
(1 Age (1 1)
	(
		(Entity (3 3) (2))
	)
)
(2 Locale (3 3)
	(
		(Descriptor (2 2) (0))
		(Descriptor (1 1) (1))
		(Locale (3 3) ())
	)
)
(3 Deciding (8 8)
	(
		(Cognizer (7 7) ())
		(Decision (11 11) ())
	)
)
(4 Attempt_means (10 10)
	(
		(Agent (7 7) ())
		(Means (11 11) ())
	)
)
(5 Desirability (15 15)
	(
		(Evaluee (7 7) ())
	)
)
(6 Required_event (18 19)
	(
		(Required_situation (7 7) ())
		(Required_situation (22 22) (8))
	)
)
(7 Word_relations (20 20)
	(
		(Circumstances (7 7) ())
		(Circumstances (22 22) (8))
	)
)
(8 Food (22 22)
	(
	)
)
(9 Deciding (25 25)
	(
		(Cognizer (7 7) ())
		(Decision (26 31) (10 11))
	)
)
(10 Calendric_unit (31 31)
	(
		(Unit (31 31) ())
		(Relative_time (30 30) ())
	)
)
(11 Motion (27 27)
	(
		(Theme (7 7) ())
		(Goal (11 11) ())
		(Time (29 31) (10))
	)
)
)
)
(
; story sentence text for lookup
("The man dug a grave." "He put his dead dog in it." "He filled it in with dirt." "He planted a tree on top of it." "He thought of the dog when he saw the tree.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Natural_features (4 4)
	(
		(Locale (4 4) ())
	)
)
(2 Placing (7 7)
	(
		(Agent (6 6) ())
		(Goal (12 12) ())
		(Theme (10 10) ())
	)
)
(3 Dead_or_alive (9 9)
	(
		(Protagonist (4 4) (1))
	)
)
(4 Filling (15 15)
	(
		(Agent (6 6) ())
		(Goal (16 16) ())
		(Theme (19 19) ())
		(Goal (17 17) ())
	)
)
(5 Placing (22 22)
	(
		(Agent (6 6) ())
		(Goal (26 26) ())
		(Theme (24 24) ())
	)
)
(6 Awareness (31 31)
	(
		(Time (36 36) ())
		(Cognizer (6 6) ())
		(Content (10 10) ())
	)
)
(7 Perception_experience (37 37)
	(
		(Perceiver_passive (36 36) ())
		(Phenomenon (39 39) ())
	)
)
)
)
(
; story sentence text for lookup
("The man ran very fast." "He stopped to catch his breath." "He was more tired than he thought." "He sat down for a break." "He didn't feel like running after that.")
; events
(
(0 Self_motion (2 2)
	(
		(Manner (3 4) (2))
		(Self_mover (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Speed_description (4 4)
	(
		(Degree (3 3) ())
		(Entity (1 1) (1))
	)
)
(3 Halt (7 7)
	(
		(Theme (6 6) ())
		(Purpose (11 11) (4))
	)
)
(4 Breathing (11 11)
	(
		(Air (11 11) ())
		(Agent (6 6) ())
		(Agent (10 10) ())
	)
)
(5 Awareness (19 19)
	(
		(Cognizer (11 11) (4))
	)
)
(6 Biological_urge (16 16)
	(
		(Experiencer (6 6) ())
		(Degree (15 15) ())
		(Degree (18 18) ())
	)
)
(7 Change_posture (22 22)
	(
		(Protagonist (6 6) ())
		(Direction (15 15) ())
		(Purpose (26 26) ())
	)
)
(8 Desiring (31 32)
	(
		(Experiencer (6 6) ())
		(Event (11 11) (4))
	)
)
(9 Self_motion (33 33)
	(
		(Self_mover (6 6) ())
		(Time (35 35) ())
	)
)
(10 Negation (30 30)
	(
		(Negated_proposition (35 35) ())
		(Negated_proposition (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("Fred wanted to go to the movies." "So off he went." "He went with his friend." "Fred saw two different movies." "They were great.")
; events
(
(0 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (6 6) (1))
	)
)
(1 Locale_by_event (6 6)
	(
		(Locale (6 6) ())
	)
)
(2 Motion (3 3)
	(
		(Theme (0 0) ())
		(Goal (6 6) (1))
	)
)
(3 Motion (11 11)
	(
		(Theme (10 10) ())
		(Source (9 9) ())
	)
)
(4 Motion (14 14)
	(
		(Theme (0 0) ())
		(Goal (17 17) (5))
	)
)
(5 Personal_relationship (17 17)
	(
		(Partner_1 (17 17) ())
		(Partner_2 (16 16) ())
	)
)
(6 Cardinal_numbers (21 21)
	(
		(Number (10 10) ())
		(Entity (17 17) (5))
	)
)
(7 Perception_active (20 20)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (17 17) (5))
	)
)
(8 Text (23 23)
	(
		(Text (17 17) (5))
	)
)
(9 Identicality (22 22)
	(
		(Type (17 17) (5))
	)
)
(10 Desirability (27 27)
	(
		(Evaluee (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The janitor needed to clean his mop." "He took it to the sink." "He got it out." "He washed it." "He put it away.")
; events
(
(0 People_by_vocation (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Grooming (4 4)
	(
		(Body_part (6 6) ())
		(Agent (1 1) (0))
	)
)
(2 Required_event (2 2)
	(
		(Required_situation (6 6) ())
		(Required_situation (1 1) (0))
	)
)
(3 Bringing (9 9)
	(
		(Agent (8 8) ())
		(Theme (10 10) ())
		(Goal (13 13) ())
	)
)
(4 Grooming (21 21)
	(
		(Agent (8 8) ())
		(Body_part (10 10) ())
	)
)
(5 Placing (25 25)
	(
		(Agent (8 8) ())
		(Theme (10 10) ())
		(Source (27 27) ())
	)
)
)
)
(
; story sentence text for lookup
("The man ran out of gas." "He tried to call for help." "His phone would not work." "He walked ten miles." "He found a gas station.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Substance (5 5)
	(
		(Substance (5 5) ())
	)
)
(2 Attempt (8 8)
	(
		(Agent (7 7) ())
		(Goal (12 12) (3))
	)
)
(3 Assistance (12 12)
	(
	)
)
(4 Contacting (10 10)
	(
		(Purpose (12 12) (3))
		(Communicator (7 7) ())
	)
)
(5 Being_operational (18 18)
	(
		(Object (15 15) ())
	)
)
(6 Cardinal_numbers (22 22)
	(
		(Number (22 22) ())
		(Unit (23 23) (8))
	)
)
(7 Self_motion (21 21)
	(
		(Distance (22 23) (6 8))
		(Self_mover (7 7) ())
	)
)
(8 Measure_linear_extent (23 23)
	(
		(Count (22 22) (6))
		(Unit (23 23) ())
	)
)
(9 Locating (26 26)
	(
		(Perceiver (7 7) ())
		(Sought_entity (29 29) (10))
	)
)
(10 Locale_by_use (29 29)
	(
		(Locale (29 29) ())
		(Use (23 23) (8))
	)
)
(11 Substance (28 28)
	(
		(Substance (23 23) (8))
	)
)
)
)
(
; story sentence text for lookup
("There was a loud noise outside." "The woman felt scared." "She called a friend." "The friend came over." "They could not find the source of the noise.")
; events
(
(0 Sensation (4 4)
	(
		(Descriptor (3 3) (2))
	)
)
(1 Interior_profile_relation (5 5)
	(
		(Figure (2 4) (0 2))
	)
)
(2 Sound_level (3 3)
	(
		(Entity (4 4) (0))
	)
)
(3 Existence (0 1)
	(
		(Place (5 5) (1))
		(Entity (2 4) (0 2))
	)
)
(4 Feeling (9 9)
	(
		(Emotional_state (3 3) (2))
		(Experiencer (8 8) (5))
	)
)
(5 People (8 8)
	(
		(Person (8 8) ())
	)
)
(6 Emotion_directed (10 10)
	(
		(Experiencer (8 8) (5))
	)
)
(7 Contacting (13 13)
	(
		(Addressee (15 15) (8))
		(Communicator (12 12) ())
	)
)
(8 Personal_relationship (15 15)
	(
		(Partner_1 (3 3) (2))
	)
)
(9 Personal_relationship (18 18)
	(
		(Partner_1 (8 8) (5))
	)
)
(10 Source_of_getting (27 27)
	(
		(Source (5 5) (1))
		(Theme (30 30) ())
	)
)
(11 Becoming_aware (25 25)
	(
		(Cognizer (12 12) ())
		(Phenomenon (27 27) (10))
	)
)
)
)
(
; story sentence text for lookup
("Lewis didn't do his homework." "He had to go to summer school." "He liked the teacher." "They became good friends." "Lewis learned a lot at summer school.")
; events
(
(0 Intentionally_act (3 3)
	(
		(Agent (0 0) ())
		(Act (5 5) ())
	)
)
(1 Negation (2 2)
	(
		(Negated_proposition (5 5) ())
		(Negated_proposition (0 0) ())
	)
)
(2 Required_event (8 9)
	(
		(Required_situation (0 0) ())
		(Required_situation (13 13) (3))
	)
)
(3 Locale_by_use (13 13)
	(
		(Descriptor (12 12) ())
		(Locale (13 13) ())
	)
)
(4 Motion (10 10)
	(
		(Theme (0 0) ())
		(Goal (13 13) (3))
	)
)
(5 Experiencer_focus (16 16)
	(
		(Experiencer (0 0) ())
		(Content (18 18) (6))
	)
)
(6 Education_teaching (18 18)
	(
		(Teacher (18 18) ())
	)
)
(7 Expertise (22 22)
	(
		(Protagonist (0 0) ())
		(Protagonist (18 18) (6))
	)
)
(8 Becoming (21 21)
	(
		(Final_category (18 18) (6))
		(Entity (0 0) ())
	)
)
(9 Personal_relationship (23 23)
	(
		(Partners (0 0) ())
	)
)
(10 Quantified_mass (27 28)
	(
		(Quantity (18 18) (6))
	)
)
(11 Coming_to_believe (26 26)
	(
		(Content (18 18) (6))
		(Cognizer (0 0) ())
		(Evidence (13 13) (3))
	)
)
(12 Locale_by_use (31 31)
	(
		(Descriptor (12 12) ())
		(Locale (13 13) (3))
	)
)
)
)
(
; story sentence text for lookup
("The boy found glue." "He poured it out." "It covered the carpet." "It dried in one hour." "His mom was very upset.")
; events
(
(0 Becoming_aware (2 2)
	(
		(Phenomenon (3 3) (2))
		(Cognizer (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Connectors (3 3)
	(
		(Connector (3 3) ())
	)
)
(3 Cause_fluidic_motion (6 8)
	(
		(Agent (5 5) ())
		(Fluid (7 7) ())
	)
)
(4 Distributed_position (11 11)
	(
		(Location (13 13) ())
		(Theme (5 5) ())
	)
)
(5 Becoming_dry (16 16)
	(
		(Entity (5 5) ())
		(Time (19 19) (6))
	)
)
(6 Calendric_unit (19 19)
	(
		(Unit (19 19) ())
		(Count (3 3) (2))
	)
)
(7 Emotion_directed (25 25)
	(
		(Degree (3 3) (2))
		(Experiencer (1 1) (1))
	)
)
(8 Kinship (22 22)
	(
		(Ego (5 5) ())
		(Alter (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("Bryan was back from vacation." "He had work today." "He was not excited." "He got into work." "He found he wasn't behind on his work.")
; events
(
(0 Intoxication (4 4)
	(
		(Cognizer (0 0) ())
	)
)
(1 Being_employed (8 8)
	(
		(Employee (0 0) ())
		(Task (8 8) ())
		(Time (9 9) (2))
	)
)
(2 Calendric_unit (9 9)
	(
		(Unit (9 9) ())
	)
)
(3 Emotion_directed (14 14)
	(
		(Experiencer (0 0) ())
	)
)
(4 Being_employed (19 19)
	(
		(Employee (0 0) ())
	)
)
(5 Becoming_aware (22 22)
	(
		(Cognizer (0 0) ())
		(Phenomenon (23 23) ())
	)
)
)
)
(
; story sentence text for lookup
("Little Henry went to school this morning." "All the children were glad to see him as he came down the street." "He is a funny little boy, and I am sure you would like him." "He says he will grow very fast and soon be a man." "He likes to go to school.")
; events
(
(0 Temporal_collocation (5 5)
	(
		(Trajector_event (6 6) (3))
		(Trajector_event (1 1) ())
	)
)
(1 Motion (2 2)
	(
		(Time (5 6) (0 3))
		(Goal (4 4) (2))
		(Theme (1 1) ())
	)
)
(2 Locale_by_use (4 4)
	(
		(Locale (4 4) ())
	)
)
(3 Calendric_unit (6 6)
	(
		(Relative_time (5 5) (0))
		(Unit (6 6) ())
	)
)
(4 People_by_age (10 10)
	(
		(Person (10 10) ())
	)
)
(5 Roadways (21 21)
	(
		(Roadway (21 21) ())
	)
)
(6 Perception_experience (14 14)
	(
		(Perceiver_passive (10 10) (4))
		(Phenomenon (15 15) ())
	)
)
(7 Arriving (18 18)
	(
		(Path (21 21) (5))
		(Theme (17 17) ())
	)
)
(8 Quantified_mass (8 8)
	(
		(Individuals (10 10) (4))
		(Quantity (8 8) ())
	)
)
(9 Emotions_by_stimulus (12 12)
	(
		(Experiencer (10 10) (4))
		(Circumstances (17 17) ())
		(Stimulus (15 15) ())
	)
)
(10 Certainty (33 33)
	(
		(Content (34 34) ())
		(Cognizer (31 31) ())
	)
)
(11 Experiencer_focus (36 36)
	(
		(Experiencer (34 34) ())
		(Content (37 37) ())
	)
)
(12 People_by_age (28 28)
	(
		(Person (5 5) (0))
		(Person (8 8) (8))
		(Descriptor (4 4) (2))
		(Descriptor (26 26) (13))
	)
)
(13 Stimulus_focus (26 26)
	(
		(Stimulus (5 5) (0))
	)
)
(14 People (50 50)
	(
	)
)
(15 Statement (40 40)
	(
		(Speaker (8 8) (8))
		(Message (41 41) ())
	)
)
(16 Change_position_on_a_scale (43 43)
	(
		(Manner (5 6) (0 3))
		(Item (10 10) (4))
	)
)
(17 Rate_description (45 45)
	(
		(Event (10 10) (4))
		(Degree (5 5) (0))
	)
)
(18 Experiencer_focus (53 53)
	(
		(Experiencer (8 8) (8))
		(Content (57 57) (20))
	)
)
(19 Motion (55 55)
	(
		(Theme (8 8) (8))
		(Goal (57 57) (20))
	)
)
(20 Locale_by_use (57 57)
	(
		(Locale (5 5) (0))
	)
)
)
)
(
; story sentence text for lookup
("The teacher drew a shape." "She asked for it's name." "The boy said square." "The teacher corrected the boy." "It was a triangle.")
; events
(
(0 Reshaping (2 2)
	(
		(Result (4 4) (2))
		(Deformer (1 1) (1))
	)
)
(1 Education_teaching (1 1)
	(
		(Teacher (1 1) ())
	)
)
(2 Shapes (4 4)
	(
		(Shape (4 4) ())
	)
)
(3 Request (7 7)
	(
		(Speaker (6 6) ())
		(Message (9 9) ())
	)
)
(4 Being_named (11 11)
	(
		(Entity (4 4) (2))
	)
)
(5 Text_creation (15 15)
	(
		(Text (16 16) ())
		(Author (1 1) (1))
	)
)
(6 People_by_age (14 14)
	(
		(Person (1 1) (1))
	)
)
(7 Assessing (20 20)
	(
		(Phenomenon (4 4) (2))
		(Assessor (1 1) (1))
	)
)
(8 Education_teaching (19 19)
	(
		(Teacher (1 1) (1))
	)
)
(9 People_by_age (22 22)
	(
		(Person (4 4) (2))
	)
)
(10 Shapes (27 27)
	(
		(Shape (16 16) ())
	)
)
)
)
(
; story sentence text for lookup
("Fred wanted to go on a ride." "But the park wouldn't let him." "He was too short." "He begged but they said no." "So he had to find something else.")
; events
(
(0 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (6 6) (1))
	)
)
(1 Ride_vehicle (6 6)
	(
		(Theme (0 0) ())
	)
)
(2 Locale_by_use (10 10)
	(
		(Locale (10 10) ())
	)
)
(3 Body_description_holistic (19 19)
	(
		(Individual (0 0) ())
		(Degree (10 10) (2))
	)
)
(4 Attempt_suasion (22 22)
	(
		(Speaker (0 0) ())
	)
)
(5 Text_creation (25 25)
	(
		(Author (24 24) ())
		(Text (26 26) ())
	)
)
(6 Required_event (30 31)
	(
		(Required_situation (29 29) ())
		(Required_situation (33 33) ())
	)
)
(7 Becoming_aware (32 32)
	(
		(Phenomenon (33 33) ())
		(Cognizer (29 29) ())
	)
)
(8 Increment (34 34)
	(
		(Added_set (26 26) ())
		(Added_set (34 34) ())
	)
)
)
)
(
; story sentence text for lookup
("We just got a new rug." "It was very plush." "Our cat started playing with the edge." "My wife yelled at the cat." "She ran away.")
; events
(
(0 Have_associated (2 2)
	(
		(Topical_entity (0 0) ())
		(Entity (5 5) ())
	)
)
(1 Age (4 4)
	(
		(Entity (5 5) ())
		(Age (4 4) ())
	)
)
(2 Degree (9 9)
	(
		(Gradable_attribute (10 10) (3))
	)
)
(3 Stimulus_focus (10 10)
	(
		(Stimulus (0 0) ())
		(Degree (9 9) (2))
	)
)
(4 Activity_start (14 14)
	(
		(Activity (18 18) (5))
		(Agent (13 13) ())
	)
)
(5 Part_edge (18 18)
	(
		(Part (18 18) ())
	)
)
(6 Perception_experience (15 15)
	(
		(Body_part (18 18) (5))
		(Perceiver_passive (13 13) ())
	)
)
(7 Personal_relationship (21 21)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (21 21) ())
	)
)
(8 Animals (25 25)
	(
		(Animal (5 5) ())
	)
)
(9 Communication_noise (22 22)
	(
		(Addressee (5 5) ())
		(Speaker (13 13) ())
	)
)
(10 Self_motion (28 28)
	(
		(Self_mover (0 0) ())
		(Source (9 9) (2))
	)
)
)
)
(
; story sentence text for lookup
("We just bought a new house." "It is so big compared to our other house." "We did need a bigger place." "The kids love the yard." "It is a nice place.")
; events
(
(0 Buildings (5 5)
	(
	)
)
(1 Commerce_buy (2 2)
	(
		(Buyer (0 0) ())
		(Goods (5 5) (0))
	)
)
(2 Age (4 4)
	(
		(Entity (5 5) (0))
	)
)
(3 Buildings (15 15)
	(
		(Building (15 15) ())
	)
)
(4 Evaluative_comparison (11 11)
	(
		(Profiled_item (9 10) ())
		(Profiled_item (0 0) ())
		(Standard_item (15 15) (3))
	)
)
(5 Increment (14 14)
	(
		(Class (15 15) (3))
	)
)
(6 Locale (22 22)
	(
		(Locale (5 5) (0))
		(Descriptor (21 21) (8))
	)
)
(7 Needing (19 19)
	(
		(Cognizer (0 0) ())
		(Requirement (5 5) (0))
	)
)
(8 Size (21 21)
	(
		(Entity (5 5) (0))
		(Degree (21 21) ())
	)
)
(9 Experiencer_focus (26 26)
	(
		(Content (28 28) (11))
		(Experiencer (25 25) (10))
	)
)
(10 People_by_age (25 25)
	(
		(Person (25 25) ())
	)
)
(11 Locale_by_use (28 28)
	(
		(Locale (21 21) (8))
	)
)
(12 Locale (34 34)
	(
		(Locale (21 21) (8))
		(Descriptor (33 33) (13))
	)
)
(13 Stimulus_focus (33 33)
	(
		(Stimulus (21 21) (8))
	)
)
)
)
(
; story sentence text for lookup
("Tom wanted to start a farm." "Tom saved up money to buy a farm." "He went to the auction." "He bought some goats." "He started the farm with his new goats.")
; events
(
(0 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (5 5) (1))
	)
)
(1 Locale_by_use (5 5)
	(
		(Locale (5 5) ())
	)
)
(2 Activity_start (3 3)
	(
		(Activity (5 5) (1))
		(Agent (0 0) ())
	)
)
(3 Locale_by_use (14 14)
	(
		(Locale (14 14) ())
	)
)
(4 Money (10 10)
	(
		(Money (10 10) ())
	)
)
(5 Commerce_buy (12 12)
	(
		(Buyer (0 0) ())
		(Goods (14 14) (3))
	)
)
(6 Commerce_pay (8 9)
	(
		(Buyer (0 0) ())
		(Purpose (14 14) (3))
		(Money (10 10) (4))
	)
)
(7 Motion (17 17)
	(
		(Theme (0 0) ())
		(Goal (20 20) ())
	)
)
(8 Proportional_quantity (24 24)
	(
		(Denoted_quantity (24 24) ())
		(Individuals (10 10) (4))
	)
)
(9 Commerce_buy (23 23)
	(
		(Buyer (0 0) ())
		(Goods (25 25) ())
	)
)
(10 Activity_start (28 28)
	(
		(Activity (25 25) ())
		(Agent (0 0) ())
		(Depictive (14 14) (3))
	)
)
(11 Age (33 33)
	(
		(Entity (14 14) (3))
		(Age (33 33) ())
	)
)
(12 Locale_by_use (30 30)
	(
		(Locale (10 10) (4))
	)
)
)
)
(
; story sentence text for lookup
("Simeon and Pedro like to fish." "Sometimes they sit on the bridge." "Sometimes they sit on the bank of the river." "They have poles, long lines, and little iron hooks." "This morning Simeon caught a large fish." "Pedro caught many small ones." "The boys caught some crabs, too." "They use a net to catch the crabs.")
; events
(
(0 Hunting (5 5)
	(
		(Hunter (0 0) ())
	)
)
(1 Experiencer_focus (3 3)
	(
		(Content (4 5) (0))
		(Experiencer (0 0) ())
	)
)
(2 Frequency (7 7)
	(
		(Event (8 8) ())
	)
)
(3 Posture (9 9)
	(
		(Point_of_contact (9 9) ())
		(Agent (8 8) ())
		(Location (12 12) (4))
	)
)
(4 Roadways (12 12)
	(
		(Roadway (12 12) ())
	)
)
(5 Natural_features (22 22)
	(
		(Locale (22 22) ())
	)
)
(6 Frequency (14 14)
	(
		(Event (15 15) ())
	)
)
(7 Posture (16 16)
	(
		(Location (19 19) (8))
		(Point_of_contact (9 9) (3))
		(Agent (8 8) ())
	)
)
(8 Natural_features (19 19)
	(
		(Container_possessor (22 22) (5))
		(Locale (12 12) (4))
	)
)
(9 Possession (25 25)
	(
		(Owner (24 24) ())
		(Possession (26 26) ())
	)
)
(10 Measurable_attributes (28 28)
	(
		(Entity (12 12) (4))
	)
)
(11 Calendric_unit (37 37)
	(
		(Relative_time (24 24) ())
		(Unit (8 8) ())
	)
)
(12 Size (41 41)
	(
		(Entity (42 42) (13))
	)
)
(13 Food (42 42)
	(
		(Descriptor (12 12) (4))
	)
)
(14 Hunting (39 39)
	(
		(Hunter (9 9) (3))
		(Food (42 42) (13))
		(Time (36 37) (11))
	)
)
(15 Arrest (45 45)
	(
		(Authorities (24 24) ())
		(Type (48 48) ())
	)
)
(16 Size (47 47)
	(
		(Entity (48 48) ())
	)
)
(17 Locating (52 52)
	(
		(Sought_entity (54 54) ())
		(Perceiver (36 37) (11))
	)
)
(18 People_by_age (51 51)
	(
		(Person (8 8) ())
	)
)
(19 Using (59 59)
	(
		(Instrument (61 61) (21))
		(Agent (24 24) ())
		(Purpose (65 65) ())
	)
)
(20 Cause_to_make_noise (63 63)
	(
		(Agent (24 24) ())
		(Sound_maker (65 65) ())
	)
)
(21 Artifact (61 61)
	(
		(Artifact (61 61) ())
	)
)
)
)
(
; story sentence text for lookup
("See!" "John is rolling the ball to Tyke." "Run!" "Tyke!" "Get the ball." "Good dog!" "Take the ball to John.")
; events
(
(0 Visiting (0 0)
	(
	)
)
(1 Cause_impact (4 4)
	(
		(Impactor (6 6) (2))
		(Agent (2 2) ())
		(Result (8 8) ())
	)
)
(2 Containers (6 6)
	(
		(Container (6 6) ())
	)
)
(3 Self_motion (10 10)
	(
	)
)
(4 Getting (14 14)
	(
		(Theme (16 16) ())
	)
)
(5 Desirability (18 18)
	(
		(Evaluee (19 19) ())
	)
)
(6 Bringing (21 21)
	(
		(Theme (16 16) ())
		(Goal (6 6) (2))
	)
)
(7 Containers (23 23)
	(
		(Container (23 23) ())
	)
)
)
)
(
; story sentence text for lookup
("The boy went off a jump." "He came down hard." "His wheel got bent." "He took it to a shop." "They said the wheel was ruined.")
; events
(
(0 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Self_motion (5 5)
	(
		(Self_mover (1 1) (0))
	)
)
(2 Bringing (18 18)
	(
		(Agent (17 17) ())
		(Theme (19 19) ())
		(Goal (22 22) (3))
	)
)
(3 Businesses (22 22)
	(
		(Business (22 22) ())
	)
)
(4 Statement (25 25)
	(
		(Speaker (17 17) ())
		(Message (26 29) ())
	)
)
)
)
(
; story sentence text for lookup
("The cat saw the rat." "Off ran the rat, and off ran the cat." "But the rat got to the hole all safe.")
; events
(
(0 Perception_experience (2 2)
	(
		(Phenomenon (4 4) ())
		(Perceiver_passive (1 1) ())
	)
)
(1 Self_motion (13 13)
	(
		(Source (6 6) ())
		(Source (12 12) ())
		(Self_mover (15 15) ())
	)
)
(2 Self_motion (7 7)
	(
		(Self_mover (9 9) ())
		(Source (6 6) ())
	)
)
(3 Process_completed_state (25 25)
	(
		(Process (19 19) ())
	)
)
(4 Natural_features (23 23)
	(
		(Locale (12 12) ())
	)
)
(5 Arriving (20 20)
	(
		(Theme (19 19) ())
		(Depictive (24 25) (3))
		(Goal (23 23) (4))
	)
)
)
)
(
; story sentence text for lookup
("The girls have come to play with the baby." "Two girls have little dolls." "One girl has a red dress." "The baby is glad to see the girls." "The girl with the red dress is May." "May is glad to see the good baby." "She will take the baby to see the bird.")
; events
(
(0 People_by_age (8 8)
	(
		(Person (8 8) ())
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Arriving (3 3)
	(
		(Purpose (8 8) (0))
		(Theme (1 1) (1))
	)
)
(3 Have_associated (12 12)
	(
		(Entity (14 14) ())
		(Topical_entity (1 1) (1))
	)
)
(4 People (11 11)
	(
		(Person (1 1) (1))
	)
)
(5 Size (13 13)
	(
		(Entity (14 14) ())
	)
)
(6 Clothing (21 21)
	(
		(Garment (21 21) ())
		(Descriptor (14 14) ())
	)
)
(7 Wearing (18 18)
	(
		(Clothing (21 21) (6))
		(Wearer (1 1) (1))
	)
)
(8 Cardinal_numbers (16 16)
	(
		(Number (16 16) ())
		(Entity (1 1) (1))
	)
)
(9 People (17 17)
	(
		(Person (1 1) (1))
	)
)
(10 Color (20 20)
	(
		(Entity (21 21) (6))
		(Color (14 14) ())
	)
)
(11 Perception_experience (28 28)
	(
		(Phenomenon (30 30) (13))
		(Perceiver_passive (1 1) (1))
	)
)
(12 Emotions_by_stimulus (26 26)
	(
		(Stimulus (30 30) (13))
		(Experiencer (1 1) (1))
	)
)
(13 People (30 30)
	(
		(Person (30 30) ())
	)
)
(14 Clothing (37 37)
	(
		(Garment (21 21) (6))
		(Descriptor (14 14) ())
	)
)
(15 People (33 33)
	(
		(Descriptor (37 37) (14))
		(Person (1 1) (1))
	)
)
(16 Color (36 36)
	(
		(Entity (21 21) (6))
		(Color (14 14) ())
	)
)
(17 Emotions_by_stimulus (42 42)
	(
		(Experiencer (16 16) (8))
		(Stimulus (47 47) (20))
	)
)
(18 Perception_experience (44 44)
	(
		(Perceiver_passive (16 16) (8))
		(Phenomenon (47 47) (20))
	)
)
(19 Desirability (46 46)
	(
		(Evaluee (30 30) (13))
	)
)
(20 People_by_age (47 47)
	(
		(Person (30 30) (13))
		(Persistent_characteristic (46 46) (19))
	)
)
(21 Bringing (51 51)
	(
		(Purpose (57 57) ())
		(Agent (16 16) (8))
		(Theme (14 14) ())
	)
)
(22 People_by_age (53 53)
	(
		(Person (14 14) ())
	)
)
(23 Perception_experience (55 55)
	(
		(Phenomenon (57 57) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom had a day off." "It was warm and nice out." "He invited a bunch of people to the lake." "Everyone turned him down." "Tom went by himself and had fun.")
; events
(
(0 Quitting_a_place (3 4)
	(
		(Self_mover (0 0) ())
		(Time (3 3) ())
	)
)
(1 Locative_relation (11 11)
	(
	)
)
(2 Ambient_temperature (8 8)
	(
	)
)
(3 Ambient_temperature (10 10)
	(
		(Place (11 11) (1))
	)
)
(4 Request (14 14)
	(
		(Message (21 21) (7))
		(Speaker (0 0) ())
		(Addressee (16 16) (5))
	)
)
(5 Aggregate (16 16)
	(
		(Individuals (18 18) (6))
		(Aggregate (3 3) ())
	)
)
(6 People (18 18)
	(
		(Person (11 11) (1))
	)
)
(7 Natural_features (21 21)
	(
		(Locale (21 21) ())
	)
)
(8 Motion (29 29)
	(
		(Depictive (31 31) ())
		(Theme (0 0) ())
	)
)
(9 Stimulus_focus (34 34)
	(
		(Stimulus (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Susie went to her sister's house." "She heard too much yelling though." "So she decided to leave." "She couldn't take the yelling." "It was to much for her.")
; events
(
(0 Buildings (6 6)
	(
		(Building (6 6) ())
	)
)
(1 Motion (1 1)
	(
		(Goal (6 6) (0))
		(Theme (0 0) ())
	)
)
(2 Kinship (4 4)
	(
		(Alter (4 4) ())
		(Ego (3 3) ())
	)
)
(3 Make_noise (12 12)
	(
		(Manner (10 11) ())
		(Sound (4 4) (2))
	)
)
(4 Perception_experience (9 9)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (10 12) (3))
	)
)
(5 Deciding (17 17)
	(
		(Cognizer (16 16) ())
		(Decision (18 19) (6))
	)
)
(6 Departing (19 19)
	(
		(Theme (16 16) ())
	)
)
(7 Sounds (26 26)
	(
		(Sound_source (0 0) ())
	)
)
(8 Possibility (22 22)
	(
		(Possible_event (0 0) ())
		(Possible_event (26 26) (7))
	)
)
)
)
(
; story sentence text for lookup
("I loved swimming at the beach." "One day I saw a big shark." "The shark suddenly attacked me." "I lost my left hand." "I never went back to the beach ever since.")
; events
(
(0 Self_motion (2 2)
	(
		(Self_mover (0 0) ())
		(Area (5 5) (2))
	)
)
(1 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (2 2) (0))
		(Content (5 5) (2))
	)
)
(2 Natural_features (5 5)
	(
		(Locale (5 5) ())
	)
)
(3 Calendric_unit (8 8)
	(
		(Count (0 0) ())
		(Unit (8 8) ())
	)
)
(4 Size (12 12)
	(
		(Entity (13 13) ())
	)
)
(5 Perception_experience (10 10)
	(
		(Perceiver_passive (2 2) (0))
		(Phenomenon (13 13) ())
	)
)
(6 Attack (18 18)
	(
		(Assailant (16 16) ())
		(Victim (19 19) ())
		(Manner (2 2) (0))
	)
)
(7 Body_parts (25 25)
	(
		(Possessor (2 2) (0))
		(Body_part (19 19) ())
		(Orientational_location (24 24) (8))
	)
)
(8 Part_orientational (24 24)
	(
		(Whole (2 2) (0))
		(Part (19 19) ())
	)
)
(9 Motion (29 29)
	(
		(Theme (0 0) ())
		(Goal (13 13) ())
		(Direction (24 24) (8))
	)
)
(10 Negation (28 28)
	(
		(Negated_proposition (0 0) ())
		(Negated_proposition (33 33) (11))
	)
)
(11 Natural_features (33 33)
	(
		(Locale (13 13) ())
	)
)
)
)
(
; story sentence text for lookup
("A new movie just came out." "I was very excited." "I took all my friends with me." "When we got there though, we were sad." "It only lasted one hour.")
; events
(
(0 Text (2 2)
	(
		(Text (2 2) ())
		(Time_of_creation (1 1) (1))
	)
)
(1 Age (1 1)
	(
		(Entity (2 2) (0))
		(Age (1 1) ())
	)
)
(2 Emotion_directed (10 10)
	(
		(Experiencer (7 7) ())
		(Degree (2 2) (0))
	)
)
(3 Quantified_mass (14 14)
	(
		(Quantity (2 2) (0))
		(Individuals (16 16) (5))
	)
)
(4 Bringing (13 13)
	(
		(Agent (7 7) ())
		(Theme (16 16) (5))
		(Constant_location (18 18) ())
	)
)
(5 Personal_relationship (16 16)
	(
		(Partner_1 (16 16) ())
		(Partner_2 (15 15) ())
	)
)
(6 Arriving (22 22)
	(
		(Theme (1 1) (1))
		(Goal (15 15) ())
	)
)
(7 Emotion_directed (28 28)
	(
		(Experiencer (26 26) ())
	)
)
(8 Calendric_unit (34 34)
	(
		(Unit (16 16) (5))
		(Count (15 15) ())
	)
)
)
)
(
; story sentence text for lookup
("Six birds are on this tree." "Birds sing in the trees." "Birds make their nests in the trees." "They lay pretty eggs in them." "The old birds feel sad to lose their eggs." "The swans have come." "I see them on the pond." "They will be nice pets for us." "They swim as fast as we walk.")
; events
(
(0 Spatial_contact (3 3)
	(
		(Ground (5 5) ())
		(Figure (1 1) ())
	)
)
(1 Make_noise (8 8)
	(
		(Sound_source (7 7) ())
	)
)
(2 Giving_birth (16 16)
	(
		(Child (16 16) ())
		(Depictive (15 15) ())
	)
)
(3 Intentionally_create (14 14)
	(
		(Place (19 19) ())
		(Created_entity (16 16) (2))
		(Creator (7 7) ())
	)
)
(4 Interior_profile_relation (17 17)
	(
		(Ground (19 19) ())
		(Figure (16 16) (2))
	)
)
(5 Giving_birth (22 22)
	(
		(Mother (7 7) ())
		(Place (5 5) ())
		(Egg (16 16) (2))
	)
)
(6 Aesthetics (23 23)
	(
		(Entity (16 16) (2))
	)
)
(7 Food (24 24)
	(
		(Descriptor (15 15) ())
	)
)
(8 Emotion_directed (32 32)
	(
		(Experiencer (30 30) ())
		(Stimulus (36 36) ())
	)
)
(9 Age (29 29)
	(
		(Entity (15 15) ())
	)
)
(10 Feeling (31 31)
	(
		(Experiencer (30 30) ())
		(Emotional_state (36 36) ())
	)
)
(11 Arriving (41 41)
	(
		(Theme (1 1) ())
	)
)
(12 Natural_features (48 48)
	(
		(Locale (48 48) ())
	)
)
(13 Perception_experience (44 44)
	(
		(Perceiver_passive (7 7) ())
		(Phenomenon (15 15) ())
		(State (48 48) (12))
	)
)
(14 Stimulus_focus (53 53)
	(
		(Stimulus (54 54) ())
	)
)
(15 Self_motion (59 59)
	(
		(Self_mover (7 7) ())
		(Manner (63 63) ())
	)
)
(16 Self_motion (64 64)
	(
		(Self_mover (48 48) (12))
	)
)
(17 Speed_description (61 61)
	(
		(Entity (7 7) ())
		(Degree (15 15) ())
		(Degree (19 19) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom loved ice skating." "He invited a friend to do it." "The friend didn't know how." "Tom pushed him too hard." "The friend fell and hurt himself.")
; events
(
(0 Operate_vehicle (3 3)
	(
		(Area (2 2) ())
		(Driver (0 0) ())
		(Vehicle (3 3) ())
	)
)
(1 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (3 3) (0))
	)
)
(2 Request (6 6)
	(
		(Speaker (0 0) ())
		(Addressee (3 3) (0))
		(Message (11 11) ())
	)
)
(3 Personal_relationship (8 8)
	(
		(Partner_1 (3 3) (0))
	)
)
(4 Intentionally_act (10 10)
	(
		(Agent (3 3) (0))
		(Act (11 11) ())
	)
)
(5 Personal_relationship (14 14)
	(
		(Partner_1 (14 14) ())
	)
)
(6 Awareness (17 17)
	(
		(Content (18 18) ())
		(Cognizer (14 14) (5))
	)
)
(7 Cause_motion (21 21)
	(
		(Distance (23 24) ())
		(Agent (0 0) ())
		(Theme (2 2) ())
	)
)
(8 Motion_directional (28 28)
	(
		(Direction (2 2) ())
		(Theme (14 14) (5))
	)
)
(9 Personal_relationship (27 27)
	(
		(Partner_1 (14 14) (5))
	)
)
(10 Experience_bodily_harm (30 30)
	(
		(Experiencer (18 18) ())
		(Experiencer (14 14) (5))
	)
)
)
)
(
; story sentence text for lookup
("Yesterday I went to cvs." "I got some candy." "I said I was not going to." "But I did anyway." "It was not good.")
; events
(
(0 Calendric_unit (0 0)
	(
		(Unit (0 0) ())
	)
)
(1 Motion (2 2)
	(
		(Time (0 0) (0))
		(Goal (4 4) ())
		(Theme (1 1) ())
	)
)
(2 Proportional_quantity (8 8)
	(
		(Denoted_quantity (8 8) ())
		(Mass (9 9) (4))
	)
)
(3 Have_associated (7 7)
	(
		(Topical_entity (0 0) (0))
		(Entity (9 9) (4))
	)
)
(4 Food (9 9)
	(
	)
)
(5 Statement (12 12)
	(
		(Speaker (0 0) (0))
		(Message (13 13) ())
	)
)
(6 Intentionally_act (21 21)
	(
		(Agent (1 1) ())
	)
)
(7 Desirability (27 27)
	(
		(Evaluee (0 0) (0))
	)
)
)
)
(
; story sentence text for lookup
("I went to the store today." "I saw some chips." "They were six dollars." "It was too expensive." "So I did not buy them.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Motion (1 1)
	(
		(Theme (0 0) ())
		(Time (5 5) (0))
		(Goal (4 4) (2))
	)
)
(2 Businesses (4 4)
	(
		(Business (4 4) ())
	)
)
(3 Perception_experience (8 8)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (4 4) (2))
	)
)
(4 Food (10 10)
	(
	)
)
(5 Expensiveness (20 20)
	(
		(Goods (0 0) ())
		(Degree (19 19) ())
	)
)
(6 Commerce_buy (26 26)
	(
		(Buyer (23 23) ())
		(Goods (5 5) (0))
	)
)
)
)
(
; story sentence text for lookup
("I had a great time." "There were plenty of people there." "I had to find skates that fit." "It was cold inside." "This was at the ice rink.")
; events
(
(0 Desirability (3 3)
	(
		(Evaluee (4 4) ())
	)
)
(1 Locative_relation (11 11)
	(
		(Ground (11 11) ())
		(Figure (10 10) (3))
	)
)
(2 Sufficiency (8 8)
	(
		(Item (11 11) (1))
		(Item (10 10) (3))
	)
)
(3 People (10 10)
	(
		(Person (4 4) ())
	)
)
(4 Existence (6 7)
	(
		(Place (11 11) (1))
		(Entity (10 10) (3))
	)
)
(5 Required_event (14 15)
	(
		(Required_situation (13 13) ())
		(Required_situation (17 17) (8))
	)
)
(6 Compatibility (19 19)
	(
		(Item_1 (4 4) ())
		(Item_1 (11 11) (1))
	)
)
(7 Locating (16 16)
	(
		(Perceiver (13 13) ())
		(Sought_entity (17 17) (8))
	)
)
(8 Noise_makers (17 17)
	(
		(Use (4 4) ())
	)
)
(9 Temperature (23 23)
	(
		(Time (24 24) (10))
	)
)
(10 Interior_profile_relation (24 24)
	(
		(Figure (21 21) ())
	)
)
(11 Locative_relation (28 28)
	(
		(Figure (13 13) ())
		(Ground (31 31) ())
	)
)
)
)
(
; story sentence text for lookup
("The man filled the pool with water." "He jumped in the pool." "The water was cold." "He got out of the pool." "He bought a heater for the water.")
; events
(
(0 Filling (2 2)
	(
		(Theme (6 6) ())
		(Goal (4 4) (2))
		(Agent (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Natural_features (4 4)
	(
		(Locale (4 4) ())
	)
)
(3 Self_motion (9 9)
	(
		(Self_mover (8 8) ())
		(Place (12 12) (4))
	)
)
(4 Natural_features (12 12)
	(
		(Locale (4 4) (2))
	)
)
(5 Temperature (17 17)
	(
		(Entity (1 1) (1))
	)
)
(6 Natural_features (24 24)
	(
		(Locale (24 24) ())
	)
)
(7 Commerce_buy (27 27)
	(
		(Buyer (8 8) ())
		(Goods (29 29) ())
	)
)
)
)
(
; story sentence text for lookup
("The man was crying." "His friend asked why." "The man would not answer." "The friend asked again." "The man lashed out in anger.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Communication_noise (3 3)
	(
		(Speaker (1 1) (0))
	)
)
(2 Questioning (7 7)
	(
		(Message (8 8) ())
		(Speaker (1 1) (0))
	)
)
(3 Personal_relationship (6 6)
	(
		(Partner_2 (5 5) ())
		(Partner_1 (1 1) (0))
	)
)
(4 People (11 11)
	(
		(Person (1 1) (0))
	)
)
(5 Communication_response (14 14)
	(
		(Speaker (1 1) (0))
	)
)
(6 Questioning (18 18)
	(
		(Speaker (1 1) (0))
	)
)
(7 Personal_relationship (17 17)
	(
		(Partner_1 (1 1) (0))
	)
)
(8 People (22 22)
	(
		(Person (1 1) (0))
	)
)
(9 Emotion_directed (26 26)
	(
		(Experiencer (1 1) (0))
	)
)
)
)
(
; story sentence text for lookup
("There was a knock on the door." "The man inside was busy." "He did not open the door." "There was a louder knock on the door." "The man answered the louder knock.")
; events
(
(0 Connecting_architecture (6 6)
	(
		(Part (6 6) ())
	)
)
(1 Part_inner_outer (10 10)
	(
		(Part (10 10) ())
	)
)
(2 People (9 9)
	(
		(Person (9 9) ())
	)
)
(3 Lively_place (12 12)
	(
		(Location (9 9) (2))
	)
)
(4 Connecting_architecture (19 19)
	(
		(Part (19 19) ())
	)
)
(5 Sounds (25 25)
	(
		(Ground (28 28) (6))
		(Manner (24 24) ())
	)
)
(6 Connecting_architecture (28 28)
	(
		(Part (28 28) ())
	)
)
(7 Communication_response (32 32)
	(
		(Trigger (35 35) (9))
		(Speaker (31 31) (8))
	)
)
(8 People (31 31)
	(
		(Person (9 9) (2))
	)
)
(9 Sounds (35 35)
	(
		(Manner (34 34) ())
	)
)
)
)
(
; story sentence text for lookup
("Yesterday Ramon found this nest." "Do you see it?" "The mother bird sits on the nest." "She has five blue eggs." "You cannot see the eggs." "The bird is sitting on them." "The mother and father birds made the nest." "It is made of grass and sticks." "It is a good home for them." "Soon there will be little birds in it.")
; events
(
(0 Calendric_unit (0 0)
	(
		(Unit (0 0) ())
	)
)
(1 Locating (2 2)
	(
		(Time (0 0) (0))
		(Sought_entity (4 4) ())
		(Perceiver (1 1) ())
	)
)
(2 Perception_experience (8 8)
	(
		(Perceiver_passive (1 1) ())
		(Phenomenon (9 9) ())
	)
)
(3 Posture (14 14)
	(
		(Agent (13 13) ())
		(Location (17 17) ())
		(Point_of_contact (9 9) ())
	)
)
(4 Kinship (12 12)
	(
		(Alter (13 13) ())
	)
)
(5 Spatial_contact (15 15)
	(
		(Figure (13 13) ())
		(Ground (17 17) ())
	)
)
(6 Food (23 23)
	(
		(Descriptor (9 9) ())
	)
)
(7 Beyond_compare (20 20)
	(
		(Standard (0 0) (0))
		(Standard (23 23) (6))
	)
)
(8 Possibility (26 26)
	(
		(Possible_event (0 0) (0))
		(Possible_event (30 30) ())
	)
)
(9 Perception_experience (28 28)
	(
		(Perceiver_passive (0 0) (0))
		(Phenomenon (30 30) ())
	)
)
(10 Posture (35 35)
	(
		(Location (30 30) ())
		(Agent (33 33) ())
		(Point_of_contact (9 9) ())
	)
)
(11 Buildings (46 46)
	(
	)
)
(12 Kinship (40 40)
	(
		(Alter (1 1) ())
	)
)
(13 Building (44 44)
	(
		(Created_entity (46 46) (11))
		(Agent (40 40) (12))
	)
)
(14 Kinship (42 42)
	(
		(Alter (43 43) ())
	)
)
(15 Building (50 50)
	(
		(Created_entity (0 0) (0))
		(Components (52 52) ())
	)
)
(16 Desirability (59 59)
	(
		(Evaluee (43 43) ())
	)
)
(17 Interior_profile_relation (70 70)
	(
		(Figure (30 30) ())
		(Ground (71 71) ())
	)
)
(18 Existence (65 65)
	(
		(Entity (30 30) ())
		(Place (71 71) ())
	)
)
(19 Size (68 68)
	(
		(Entity (69 69) ())
	)
)
)
)
(
; story sentence text for lookup
("The family was going on a cruise." "They were excited." "It was ten days long." "They went on the cruise." "They had a great time.")
; events
(
(0 Kinship (1 1)
	(
		(Relatives (1 1) ())
	)
)
(1 Travel (6 6)
	(
		(Traveler (1 1) (0))
	)
)
(2 Motion (3 3)
	(
		(Goal (6 6) (1))
		(Theme (1 1) (0))
	)
)
(3 Emotion_directed (10 10)
	(
		(Experiencer (8 8) ())
	)
)
(4 Duration_description (16 16)
	(
		(Period (14 15) (5))
		(Period (8 8) ())
	)
)
(5 Measure_duration (15 15)
	(
		(Count (14 14) ())
		(Unit (15 15) ())
	)
)
(6 Motion (19 19)
	(
		(Theme (8 8) ())
		(Carrier (22 22) (7))
	)
)
(7 Vehicle (22 22)
	(
		(Vehicle (22 22) ())
	)
)
(8 Desirability (27 27)
	(
		(Evaluee (22 22) (7))
	)
)
)
)
(
; story sentence text for lookup
("I have three good apples." "One is red, and two are yellow." "I will give you the red one." "I see a big red apple in the tree.")
; events
(
(0 Food (4 4)
	(
		(Descriptor (3 3) (3))
	)
)
(1 Cardinal_numbers (2 2)
	(
		(Number (2 2) ())
		(Entity (4 4) (0))
	)
)
(2 Possession (1 1)
	(
		(Owner (0 0) ())
		(Possession (4 4) (0))
	)
)
(3 Desirability (3 3)
	(
		(Evaluee (4 4) (0))
	)
)
(4 Color (13 13)
	(
		(Color (13 13) ())
		(Entity (11 11) (6))
	)
)
(5 Color (8 8)
	(
		(Entity (0 0) ())
		(Color (2 2) (1))
	)
)
(6 Cardinal_numbers (11 11)
	(
		(Number (11 11) ())
	)
)
(7 Giving (17 17)
	(
		(Donor (0 0) ())
		(Theme (21 21) ())
		(Recipient (3 3) (3))
	)
)
(8 Color (20 20)
	(
		(Color (11 11) (6))
		(Entity (21 21) ())
	)
)
(9 Food (28 28)
	(
		(Descriptor (4 4) (0))
	)
)
(10 Perception_experience (24 24)
	(
		(Perceiver_passive (0 0) ())
		(Ground (31 31) ())
		(Phenomenon (28 28) (9))
	)
)
(11 Color (27 27)
	(
		(Entity (11 11) (6))
		(Color (4 4) (0))
	)
)
(12 Size (26 26)
	(
		(Entity (28 28) (9))
	)
)
)
)
(
; story sentence text for lookup
("I can see a bird on the tree." "It has two legs." "It has a small bill, and a long tail." "It has wings, and can fly." "It can fly over a tall tree." "It can fly so high that we can not see it." "It's nest is up in the tree." "It will sing.")
; events
(
(0 Perception_experience (2 2)
	(
		(Perceiver_passive (0 0) ())
		(State (7 7) ())
		(Phenomenon (4 4) ())
	)
)
(1 Possibility (1 1)
	(
		(Possible_event (0 0) ())
		(Possible_event (4 4) ())
	)
)
(2 Cardinal_numbers (11 11)
	(
		(Number (11 11) ())
		(Entity (12 12) (3))
	)
)
(3 Body_parts (12 12)
	(
		(Possessor (0 0) ())
		(Body_part (12 12) ())
	)
)
(4 Body_parts (23 23)
	(
		(Possessor (0 0) ())
		(Body_part (23 23) ())
		(Descriptor (22 22) (7))
	)
)
(5 Body_parts (18 18)
	(
		(Possessor (0 0) ())
		(Body_part (18 18) ())
		(Descriptor (12 12) (3))
	)
)
(6 Size (17 17)
	(
		(Entity (18 18) (5))
	)
)
(7 Measurable_attributes (22 22)
	(
		(Entity (23 23) (4))
	)
)
(8 Body_parts (27 27)
	(
		(Body_part (11 11) (2))
		(Possessor (0 0) ())
	)
)
(9 Possession (26 26)
	(
		(Possession (11 11) (2))
		(Owner (0 0) ())
	)
)
(10 Capability (30 30)
	(
		(Event (31 31) (11))
		(Entity (0 0) ())
	)
)
(11 Self_motion (31 31)
	(
		(Self_mover (0 0) ())
	)
)
(12 Self_motion (35 35)
	(
		(Self_mover (0 0) ())
		(Path (39 39) ())
	)
)
(13 Capability (34 34)
	(
		(Entity (0 0) ())
		(Event (39 39) ())
	)
)
(14 Measurable_attributes (38 38)
	(
		(Attribute (38 38) ())
		(Entity (31 31) (11))
	)
)
(15 Perception_experience (50 50)
	(
		(Phenomenon (51 51) ())
		(Perceiver_passive (31 31) (11))
	)
)
(16 Self_motion (43 43)
	(
		(Self_mover (0 0) ())
		(Result (47 47) ())
	)
)
(17 Capability (42 42)
	(
		(Entity (0 0) ())
		(Event (47 47) ())
	)
)
(18 Measurable_attributes (45 45)
	(
		(Entity (0 0) ())
		(Degree (47 47) ())
		(Degree (12 12) (3))
	)
)
(19 Capability (48 48)
	(
		(Event (51 51) ())
		(Entity (31 31) (11))
	)
)
(20 Biological_area (60 60)
	(
		(Locale (60 60) ())
	)
)
(21 Relational_political_locales (55 55)
	(
		(Container_possessor (53 53) ())
	)
)
(22 Make_noise (64 64)
	(
		(Sound_source (0 0) ())
		(Sound (11 11) (2))
	)
)
)
)
(
; story sentence text for lookup
("The man went to prison." "He was innocent." "He asked for another trial." "It took five years to get one." "He was found to be innocent.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Prison (4 4)
	(
		(Penal_institution (4 4) ())
	)
)
(2 Guilt_or_innocence (8 8)
	(
		(Accused (6 6) ())
	)
)
(3 Request (11 11)
	(
		(Speaker (6 6) ())
		(Message (14 14) (4))
	)
)
(4 Trial (14 14)
	(
		(Case (4 4) (1))
	)
)
(5 Increment (13 13)
	(
		(Class (4 4) (1))
	)
)
(6 Cardinal_numbers (18 18)
	(
		(Number (18 18) ())
		(Unit (19 19) (9))
	)
)
(7 Taking_time (17 17)
	(
		(Time_length (19 19) (9))
		(Activity (22 22) ())
	)
)
(8 Getting (21 21)
	(
		(Theme (22 22) ())
	)
)
(9 Measure_duration (19 19)
	(
		(Count (18 18) (6))
		(Process (22 22) ())
		(Unit (19 19) ())
	)
)
(10 Coming_to_believe (26 26)
	(
		(Content (6 6) ())
		(Content (27 29) (11))
	)
)
(11 Guilt_or_innocence (29 29)
	(
		(Accused (6 6) ())
	)
)
)
)
(
; story sentence text for lookup
("The man floated down the river." "His boat tipped over." "He swam to the tipped over boat." "He climbed on top of the boat." "He was rescued.")
; events
(
(0 Motion (2 2)
	(
		(Path (5 5) (2))
		(Theme (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Natural_features (5 5)
	(
		(Locale (5 5) ())
	)
)
(3 Motion_noise (9 9)
	(
		(Path (10 10) ())
		(Theme (1 1) (1))
	)
)
(4 Vehicle (8 8)
	(
		(Possessor (7 7) ())
		(Vehicle (1 1) (1))
	)
)
(5 Self_motion (13 13)
	(
		(Self_mover (7 7) ())
		(Goal (18 18) (6))
	)
)
(6 Vehicle (18 18)
	(
		(Vehicle (18 18) ())
	)
)
(7 Self_motion (21 21)
	(
		(Self_mover (7 7) ())
		(Goal (18 18) (6))
	)
)
(8 Part_orientational (23 23)
	(
		(Part (10 10) ())
		(Whole (26 26) (9))
	)
)
(9 Vehicle (26 26)
	(
		(Vehicle (18 18) (6))
	)
)
(10 Rescuing (30 30)
	(
		(Patient (7 7) ())
	)
)
)
)
(
; story sentence text for lookup
("These are the little birds." "How many are there?" "Their mouths are open." "They are hungry." "The mother bird will feed them." "She has a grasshopper in her mouth." "Can the little birds fly?" "No they are too young." "If they try to fly, they will fall." "Soon they will be stronger." "Then their mother will teach them to fly." "She will teach them to sing, too.")
; events
(
(0 Size (3 3)
	(
		(Entity (4 4) ())
	)
)
(1 Quantified_mass (7 7)
	(
		(Q_prop (6 6) ())
		(Quantity (7 7) ())
	)
)
(2 Locative_relation (9 9)
	(
		(Ground (9 9) ())
		(Figure (6 7) (1))
	)
)
(3 Body_parts (12 12)
	(
		(Body_part (7 7) (1))
		(Possessor (6 6) ())
	)
)
(4 Obviousness (14 14)
	(
		(Phenomenon (6 7) (1))
	)
)
(5 Biological_urge (18 18)
	(
		(Experiencer (6 6) ())
	)
)
(6 Kinship (21 21)
	(
		(Alter (22 22) ())
		(Alter (7 7) (1))
	)
)
(7 Ingestion (24 24)
	(
		(Ingestor (22 22) ())
		(Ingestibles (25 25) ())
	)
)
(8 Body_parts (33 33)
	(
		(Body_part (33 33) ())
		(Possessor (25 25) ())
	)
)
(9 Beyond_compare (28 28)
	(
		(Standard (6 6) ())
		(Domain (33 33) (8))
		(Standard (30 30) ())
	)
)
(10 Capability (35 35)
	(
		(Event (38 38) ())
	)
)
(11 Size (37 37)
	(
		(Entity (9 9) (2))
	)
)
(12 Self_motion (39 39)
	(
		(Self_mover (38 38) ())
	)
)
(13 Age (45 45)
	(
		(Entity (7 7) (1))
		(Degree (9 9) (2))
	)
)
(14 Attempt (49 49)
	(
		(Agent (7 7) (1))
		(Goal (50 51) (15))
	)
)
(15 Taking_time (51 51)
	(
		(Agent (7 7) (1))
	)
)
(16 Motion_directional (55 55)
	(
		(Theme (33 33) (8))
	)
)
(17 Level_of_force_resistance (61 61)
	(
		(Resisting_entity (7 7) (1))
		(Time (6 6) ())
	)
)
(18 Education_teaching (67 67)
	(
		(Teacher (65 65) ())
		(Skill (69 70) (19))
		(Student (25 25) ())
	)
)
(19 Operate_vehicle (70 70)
	(
		(Driver (25 25) ())
	)
)
(20 Education_teaching (74 74)
	(
		(Skill (76 77) (21))
		(Teacher (6 6) ())
		(Student (9 9) (2))
	)
)
(21 Communication_manner (77 77)
	(
		(Speaker (9 9) (2))
	)
)
)
)
(
; story sentence text for lookup
("The cat meowed at the door." "The owner let the cat out." "The cat played in a field." "He came back with a mouse." "The cat gave the mouse to the owner.")
; events
(
(0 Connecting_architecture (5 5)
	(
		(Part (5 5) ())
	)
)
(1 Make_noise (2 2)
	(
		(Sound (2 2) ())
		(Sound_source (1 1) ())
	)
)
(2 Possession (8 8)
	(
		(Owner (8 8) ())
	)
)
(3 Perception_experience (16 16)
	(
		(Ground (19 19) (4))
		(Perceiver_passive (1 1) ())
	)
)
(4 Locale_by_use (19 19)
	(
		(Locale (5 5) (0))
	)
)
(5 Arriving (22 22)
	(
		(Theme (21 21) ())
		(Goal (2 2) (1))
		(Depictive (19 19) (4))
	)
)
(6 Giving (30 30)
	(
		(Theme (32 32) ())
		(Recipient (35 35) (7))
		(Donor (1 1) ())
	)
)
(7 Have_associated (35 35)
	(
		(Topical_entity (35 35) ())
	)
)
)
)
(
; story sentence text for lookup
("Joseph likes pets." "He has two dogs and three cats." "One day one of the dogs got lost." "Joseph tried to find him very hard." "He finally find him.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (2 2) ())
	)
)
(1 Cardinal_numbers (6 6)
	(
		(Number (2 2) ())
		(Entity (7 7) ())
	)
)
(2 Have_associated (5 5)
	(
		(Topical_entity (0 0) ())
		(Entity (7 7) ())
	)
)
(3 Cardinal_numbers (9 9)
	(
		(Entity (10 10) ())
		(Number (9 9) ())
	)
)
(4 Animals (17 17)
	(
		(Animal (9 9) (3))
	)
)
(5 Calendric_unit (13 13)
	(
		(Count (0 0) ())
		(Unit (13 13) ())
	)
)
(6 Transition_to_state (18 18)
	(
		(Final_quality (19 19) ())
		(Entity (17 17) (4))
		(Time (12 13) (5))
	)
)
(7 Attempt (22 22)
	(
		(Agent (0 0) ())
		(Goal (7 7) ())
	)
)
(8 Remembering_experience (24 24)
	(
		(Cognizer (0 0) ())
		(State (25 25) ())
		(Manner (26 27) ())
	)
)
(9 Locating (31 31)
	(
		(Perceiver (0 0) ())
		(Sought_entity (7 7) ())
	)
)
)
)
(
; story sentence text for lookup
("Bluejays do not sing well." "A little quail has a sweet song." "He is a shy bird." "He runs away and hides in the grass." "I see an owl in the tree." "But he can not see me." "In the night he says ”Whoo, whoo, whoo!” This is all the song he sings.")
; events
(
(0 Communication_manner (3 3)
	(
		(Speaker (0 0) ())
		(Message (4 4) ())
	)
)
(1 Size (7 7)
	(
		(Entity (8 8) ())
	)
)
(2 Text (12 12)
	(
		(Genre (8 8) ())
		(Descriptor (11 11) (3))
	)
)
(3 Desirability (11 11)
	(
		(Evaluee (12 12) (2))
	)
)
(4 Sociability (17 17)
	(
		(Protagonist (4 4) ())
	)
)
(5 Hiding_objects (24 24)
	(
		(Agent (0 0) ())
		(Hiding_place (27 27) ())
	)
)
(6 Self_motion (21 21)
	(
		(Self_mover (0 0) ())
		(Source (8 8) ())
	)
)
(7 Perception_experience (30 30)
	(
		(Perceiver_passive (0 0) ())
		(Ground (35 35) ())
		(Phenomenon (32 32) ())
	)
)
(8 Interior_profile_relation (33 33)
	(
		(Ground (35 35) ())
		(Figure (32 32) ())
	)
)
(9 Perception_experience (41 41)
	(
		(Perceiver_passive (38 38) ())
		(Phenomenon (11 11) (3))
	)
)
(10 Calendric_unit (46 46)
	(
		(Unit (8 8) ())
	)
)
(11 Text (61 61)
	(
		(Text (61 61) ())
	)
)
(12 Temporal_collocation (44 44)
	(
		(Landmark_period (46 46) (10))
		(Trajector_event (47 47) ())
	)
)
(13 Text_creation (48 48)
	(
		(Text (50 50) ())
		(Author (47 47) ())
	)
)
(14 Communication_manner (63 63)
	(
		(Message (60 61) (11))
		(Speaker (62 62) ())
	)
)
)
)
(
; story sentence text for lookup
("I went to the beach yesterday." "I laid in a hammock." "It was very relaxing." "I fell asleep." "I never wanted to go.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Motion (1 1)
	(
		(Theme (0 0) ())
		(Time (5 5) (0))
		(Goal (4 4) (2))
	)
)
(2 Natural_features (4 4)
	(
		(Locale (4 4) ())
	)
)
(3 Posture (8 8)
	(
		(Point_of_contact (8 8) ())
		(Agent (0 0) ())
		(Location (4 4) (2))
	)
)
(4 Building_subparts (11 11)
	(
	)
)
(5 Stimulus_focus (16 16)
	(
		(Stimulus (0 0) ())
		(Degree (15 15) ())
	)
)
(6 Sleep (19 20)
	(
		(Sleeper (0 0) ())
	)
)
(7 Desiring (24 24)
	(
		(Experiencer (0 0) ())
		(Event (25 26) (9))
	)
)
(8 Negation (23 23)
	(
		(Negated_proposition (0 0) ())
		(Negated_proposition (4 4) (2))
	)
)
(9 Motion (26 26)
	(
		(Theme (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Here is an apple." "It rolls like a ball." "We call it a sphere." "It grows on a tree." "Many spheres grow on trees." "Five green peas are in this pod." "Peas are little spheres." "They grow on vines." "Here are six little red spheres." "We call them curants." "They do not grow on a big tree, but on a bush." "A bush is a little tree." "These spheres are green." "They grow on vines.")
; events
(
(0 Spatial_co-location (0 0)
	(
		(Figure (3 3) (1))
	)
)
(1 Food (3 3)
	(
	)
)
(2 Moving_in_place (6 6)
	(
		(Theme (5 5) ())
		(Manner (9 9) ())
	)
)
(3 Referring_by_name (12 12)
	(
		(Speaker (5 5) ())
		(Entity (13 13) ())
		(Name (14 15) ())
	)
)
(4 Ontogeny (18 18)
	(
		(Entity (5 5) ())
		(Place (9 9) ())
	)
)
(5 Spatial_contact (19 19)
	(
		(Ground (14 15) ())
		(Figure (17 17) ())
	)
)
(6 Spatial_contact (26 26)
	(
		(Ground (27 27) ())
		(Figure (24 24) ())
	)
)
(7 Quantified_mass (23 23)
	(
		(Quantity (5 5) ())
		(Individuals (24 24) ())
	)
)
(8 Ontogeny (25 25)
	(
		(Entity (17 17) ())
		(Place (14 15) ())
	)
)
(9 Interior_profile_relation (33 33)
	(
		(Figure (24 24) ())
		(Ground (35 35) ())
	)
)
(10 Size (39 39)
	(
		(Entity (40 40) ())
		(Entity (5 5) ())
	)
)
(11 Food (37 37)
	(
	)
)
(12 Spatial_contact (87 87)
	(
		(Ground (40 40) ())
		(Figure (17 17) ())
	)
)
(13 Ontogeny (86 86)
	(
		(Entity (5 5) ())
		(Place (3 3) (1))
	)
)
(14 Cardinal_numbers (49 49)
	(
		(Number (13 13) ())
		(Entity (52 52) ())
	)
)
(15 Color (51 51)
	(
		(Color (27 27) ())
		(Entity (52 52) ())
	)
)
(16 Size (50 50)
	(
		(Entity (52 52) ())
	)
)
(17 Referring_by_name (55 55)
	(
		(Speaker (5 5) ())
		(Entity (13 13) ())
		(Name (40 40) ())
	)
)
(18 Ontogeny (62 62)
	(
		(Entity (5 5) ())
		(Place (66 66) (22))
	)
)
(19 Size (65 65)
	(
		(Entity (66 66) (22))
	)
)
(20 Spatial_contact (69 69)
	(
		(Figure (5 5) ())
		(Ground (71 71) ())
	)
)
(21 Spatial_contact (63 63)
	(
		(Figure (59 59) ())
		(Ground (66 66) (22))
	)
)
(22 Food (66 66)
	(
		(Food (66 66) ())
		(Descriptor (65 65) (19))
	)
)
(23 Color (83 83)
	(
		(Entity (17 17) ())
	)
)
(24 Spatial_contact (87 87)
	(
		(Ground (40 40) ())
		(Figure (17 17) ())
	)
)
(25 Ontogeny (86 86)
	(
		(Entity (5 5) ())
		(Place (3 3) (1))
	)
)
)
)
(
; story sentence text for lookup
("There are pretty butterflies and flowers in Grace's garden." "There are spiders there, too." "She is afraid of them." "Yesterday when Grace was running after the butterfly she saw a big spider." "She called her mother." "Come here!" "come here!" "she said; I see a big spider!" "The spider will not hurt you, her mother said." "It likes to stay in the garden." "It catches ants.")
; events
(
(0 Interior_profile_relation (6 6)
	(
		(Figure (2 5) (2))
		(Ground (9 9) (1))
	)
)
(1 Locale_by_use (9 9)
	(
		(Descriptor (7 8) ())
		(Locale (9 9) ())
	)
)
(2 Aesthetics (2 2)
	(
		(Entity (3 5) ())
	)
)
(3 Existence (0 1)
	(
		(Entity (2 5) (2))
		(Place (9 9) (1))
	)
)
(4 Spatial_co-location (14 14)
	(
		(Figure (13 13) ())
	)
)
(5 Existence (11 12)
	(
		(Entity (13 13) ())
		(Place (14 14) (4))
	)
)
(6 Experiencer_focus (20 20)
	(
		(Experiencer (18 18) ())
		(Content (22 22) ())
	)
)
(7 Perception_experience (33 33)
	(
		(Perceiver_passive (32 32) ())
		(Phenomenon (36 36) ())
	)
)
(8 Calendric_unit (24 24)
	(
		(Unit (18 18) ())
	)
)
(9 Temporal_collocation (25 25)
	(
		(Landmark_period (18 18) ())
		(Trajector_event (32 32) ())
		(Landmark_event (26 26) ())
	)
)
(10 Self_motion (28 28)
	(
		(Self_mover (13 13) ())
		(Cotheme (31 31) ())
	)
)
(11 Size (35 35)
	(
		(Entity (36 36) ())
	)
)
(12 Contacting (39 39)
	(
		(Addressee (41 41) (13))
		(Communicator (18 18) ())
	)
)
(13 Kinship (41 41)
	(
		(Ego (13 13) ())
		(Alter (14 14) (4))
	)
)
(14 Arriving (46 46)
	(
		(Goal (47 47) ())
	)
)
(15 Statement (50 50)
	(
		(Speaker (18 18) ())
		(Message (26 26) ())
	)
)
(16 Perception_experience (53 53)
	(
		(Phenomenon (31 31) ())
		(Perceiver_passive (14 14) (4))
	)
)
(17 Size (55 55)
	(
		(Entity (56 56) ())
	)
)
(18 Kinship (66 66)
	(
		(Alter (32 32) ())
		(Ego (56 56) ())
	)
)
(19 Cause_harm (62 62)
	(
		(Agent (59 59) ())
		(Victim (63 63) ())
	)
)
(20 Statement (67 67)
	(
		(Speaker (7 8) ())
		(Message (59 59) ())
	)
)
(21 Experiencer_focus (70 70)
	(
		(Experiencer (18 18) ())
		(Content (75 75) (23))
	)
)
(22 Temporary_stay (72 72)
	(
		(Guest (18 18) ())
		(Location (75 75) (23))
	)
)
(23 Locale_by_use (75 75)
	(
		(Locale (75 75) ())
	)
)
(24 Dead_or_alive (78 78)
	(
		(Protagonist (18 18) ())
		(Protagonist (13 13) ())
	)
)
(25 Food (79 79)
	(
		(Food (13 13) ())
	)
)
)
)
(
; story sentence text for lookup
("What a bright June day!" "The air is pure." "The sky is as blue as it can be." "Lucy and her mamma are in the woods." "They have found a nice spot, where there is some grass." "They sit in the shade of the trees, and Lucy is singing." "The trees are not large, but they make a good shade." "Lucy's kind mamma says that they will have a picnic when her papa can get a tent.")
; events
(
(0 Location_of_light (2 2)
	(
		(Time (3 4) (1 2))
	)
)
(1 Calendric_unit (4 4)
	(
		(Unit (4 4) ())
		(Name (3 3) (2))
	)
)
(2 Calendric_unit (3 3)
	(
		(Unit (3 3) ())
	)
)
(3 Level_of_light (15 15)
	(
		(Degree (3 3) (2))
		(Location (12 12) ())
	)
)
(4 Biological_area (28 28)
	(
		(Locale (28 28) ())
	)
)
(5 Interior_profile_relation (26 26)
	(
		(Figure (21 21) ())
		(Ground (28 28) (4))
	)
)
(6 Kinship (24 24)
	(
		(Ego (23 23) ())
		(Alter (3 3) (2))
	)
)
(7 Locale (35 35)
	(
		(Locale (35 35) ())
		(Descriptor (4 4) (1))
	)
)
(8 Locating (32 32)
	(
		(Perceiver (30 30) ())
		(Location (35 35) (7))
	)
)
(9 Existence (38 39)
	(
		(Entity (40 41) (10))
		(Entity (35 35) (7))
	)
)
(10 Proportional_quantity (40 40)
	(
		(Denoted_quantity (40 40) ())
		(Mass (41 41) ())
	)
)
(11 Locative_relation (37 37)
	(
		(Figure (40 41) (10))
		(Ground (35 35) (7))
	)
)
(12 Stimulus_focus (34 34)
	(
		(Stimulus (35 35) (7))
	)
)
(13 Communication_manner (55 55)
	(
		(Speaker (40 40) (10))
	)
)
(14 Posture (44 44)
	(
		(Location (47 47) ())
		(Agent (30 30) ())
		(Point_of_contact (44 44) ())
	)
)
(15 Desirability (67 67)
	(
		(Evaluee (41 41) ())
	)
)
(16 Size (61 61)
	(
		(Entity (12 12) ())
	)
)
(17 Statement (74 74)
	(
		(Speaker (21 21) ())
		(Message (76 76) ())
	)
)
(18 Possibility (84 84)
	(
		(Possible_event (87 87) (24))
		(Possible_event (83 83) (25))
	)
)
(19 Social_interaction_evaluation (72 72)
	(
		(Evaluee (12 12) ())
		(Evaluee (3 3) (2))
	)
)
(20 Giving_birth (78 78)
	(
		(Means (80 80) (22))
		(Depictive (76 76) ())
		(Time (83 83) (25))
	)
)
(21 Temporal_collocation (81 81)
	(
		(Landmark_event (83 83) (25))
		(Trajector_event (76 76) ())
	)
)
(22 Social_event (80 80)
	(
		(Attendee (76 76) ())
		(Social_event (40 40) (10))
		(Time (83 83) (25))
	)
)
(23 Getting (85 85)
	(
		(Theme (87 87) (24))
		(Recipient (83 83) (25))
	)
)
(24 Buildings (87 87)
	(
	)
)
(25 Kinship (83 83)
	(
		(Ego (82 82) ())
		(Alter (83 83) ())
	)
)
(26 Kinship (73 73)
	(
		(Ego (12 12) ())
		(Alter (3 3) (2))
	)
)
)
)
(
; story sentence text for lookup
("I went to visit a farm on Friday." "It was a long drive to get there." "They had a lot of animals." "I got to pet the cow." "It was a very fun day.")
; events
(
(0 Motion (1 1)
	(
		(Theme (0 0) ())
		(Goal (5 5) (1))
		(Time (7 7) ())
	)
)
(1 Locale_by_use (5 5)
	(
		(Locale (5 5) ())
	)
)
(2 Visiting (3 3)
	(
		(Entity (5 5) (1))
		(Agent (0 0) ())
		(Time (7 7) ())
	)
)
(3 Self_motion (13 13)
	(
		(Purpose (14 16) (4))
		(Duration (12 12) (5))
	)
)
(4 Arriving (15 15)
	(
		(Goal (16 16) ())
	)
)
(5 Duration_description (12 12)
	(
		(Eventuality (13 13) (3))
	)
)
(6 Quantified_mass (20 21)
	(
		(Quantity (21 21) ())
		(Individuals (5 5) (1))
	)
)
(7 Animals (23 23)
	(
		(Animal (5 5) (1))
	)
)
(8 Required_event (26 27)
	(
		(Required_situation (0 0) ())
		(Required_situation (30 30) ())
	)
)
(9 Manipulation (28 28)
	(
		(Agent (0 0) ())
		(Entity (5 5) (1))
	)
)
(10 Calendric_unit (37 37)
	(
		(Unit (5 5) (1))
	)
)
(11 Stimulus_focus (36 36)
	(
		(Stimulus (5 5) (1))
		(Degree (12 12) (5))
	)
)
)
)
(
; story sentence text for lookup
("This is Fred and his sled." "It is a red sled." "It is a red sled, and it has black letters on it." "Fred let Frank stand on his sled, and Frank fell into the snow." "I am Fred and this is Frank." "This is my red sled." "My sled is a pretty sled." "I let frank have my sled, and he fell into the snow." "Frank can not stand on my sled." "I can stand on it.")
; events
(
(0 Vehicle (5 5)
	(
		(Vehicle (5 5) ())
		(Possessor (4 4) ())
	)
)
(1 Buildings (11 11)
	(
		(Building (4 4) ())
		(Descriptor (10 10) (2))
	)
)
(2 Color (10 10)
	(
		(Entity (4 4) ())
		(Color (10 10) ())
	)
)
(3 Color (22 22)
	(
		(Color (22 22) ())
		(Entity (23 23) ())
	)
)
(4 Color (16 16)
	(
		(Entity (4 4) ())
		(Color (10 10) (2))
	)
)
(5 Posture (30 30)
	(
		(Agent (29 29) ())
		(Location (33 33) (6))
		(Point_of_contact (10 10) (2))
	)
)
(6 Leadership (33 33)
	(
		(Leader (5 5) (0))
		(Type (33 33) ())
	)
)
(7 Motion_directional (37 37)
	(
		(Theme (22 22) (3))
		(Goal (40 40) (8))
	)
)
(8 Precipitation (40 40)
	(
		(Precipitation (40 40) ())
	)
)
(9 Preventing_or_letting (28 28)
	(
		(Potential_hindrance (27 27) ())
		(Event (29 29) ())
		(Event (33 33) (6))
	)
)
(10 Buildings (54 54)
	(
		(Possessor (29 29) ())
		(Building (4 4) ())
		(Descriptor (10 10) (2))
	)
)
(11 Color (53 53)
	(
		(Entity (4 4) ())
		(Color (10 10) (2))
	)
)
(12 Buildings (61 61)
	(
		(Building (5 5) (0))
		(Descriptor (4 4) ())
	)
)
(13 Aesthetics (60 60)
	(
		(Entity (5 5) (0))
	)
)
(14 Motion_directional (72 72)
	(
		(Goal (75 75) (15))
		(Theme (71 71) ())
	)
)
(15 Precipitation (75 75)
	(
		(Precipitation (75 75) ())
	)
)
(16 Vehicle (68 68)
	(
		(Vehicle (5 5) (0))
		(Descriptor (4 4) ())
	)
)
(17 Noise_makers (83 83)
	(
		(Type (5 5) (0))
		(Type (33 33) (6))
	)
)
(18 Posture (80 80)
	(
		(Agent (27 27) ())
		(Location (33 33) (6))
		(Point_of_contact (10 10) (2))
	)
)
(19 Posture (87 87)
	(
		(Agent (27 27) ())
		(Point_of_contact (29 29) ())
		(Location (89 89) ())
	)
)
(20 Capability (86 86)
	(
		(Entity (27 27) ())
		(Event (89 89) ())
	)
)
)
)
(
; story sentence text for lookup
("Jacob has long hair." "He wants to get it cut." "He heads down to the barber." "He has his hair cut." "Jacob loves his new hair.")
; events
(
(0 Hair_configuration (2 2)
	(
		(Hair (3 3) (1))
	)
)
(1 Body_parts (3 3)
	(
		(Possessor (0 0) ())
		(Descriptor (2 2) (0))
		(Body_part (3 3) ())
	)
)
(2 Desiring (6 6)
	(
		(Experiencer (0 0) ())
		(Event (9 9) ())
	)
)
(3 Self_motion (13 13)
	(
		(Self_mover (0 0) ())
		(Goal (17 17) (4))
		(Path (2 2) (0))
	)
)
(4 Medical_professionals (17 17)
	(
		(Professional (17 17) ())
	)
)
(5 Hair_configuration (23 23)
	(
		(Hair (22 22) (6))
	)
)
(6 Body_parts (22 22)
	(
		(Possessor (2 2) (0))
		(Body_part (3 3) (1))
	)
)
(7 Experiencer_focus (26 26)
	(
		(Experiencer (0 0) ())
		(Content (29 29) (9))
	)
)
(8 Age (28 28)
	(
		(Entity (29 29) (9))
		(Age (3 3) (1))
	)
)
(9 Body_parts (29 29)
	(
		(Body_part (29 29) ())
		(Descriptor (3 3) (1))
		(Possessor (2 2) (0))
	)
)
)
)
(
; story sentence text for lookup
("The baby can not have the bird." "She can not fly and catch it.")
; events
(
(0 Possibility (2 2)
	(
		(Possible_event (6 6) ())
		(Possible_event (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Capability (9 9)
	(
		(Entity (8 8) ())
	)
)
(3 Self_motion (11 11)
	(
		(Self_mover (8 8) ())
	)
)
)
)
(
; story sentence text for lookup
("Ned has a nice boat on the pond." "He can row the boat." "Ned has an oar in his right hand, and an oar in his left hand." "He can row with two oars." "I can row a boat." "I can row with two oars." "No one is in the boat with Ned." "He must take care not to fall out.")
; events
(
(0 Natural_features (7 7)
	(
		(Locale (7 7) ())
	)
)
(1 Vehicle (4 4)
	(
		(Vehicle (4 4) ())
		(Descriptor (3 3) (2))
	)
)
(2 Stimulus_focus (3 3)
	(
		(Stimulus (4 4) (1))
	)
)
(3 Operate_vehicle (11 11)
	(
		(Vehicle (13 13) (5))
		(Driver (9 9) ())
	)
)
(4 Capability (10 10)
	(
		(Entity (9 9) ())
		(Event (13 13) (5))
	)
)
(5 Vehicle (13 13)
	(
		(Vehicle (4 4) (1))
	)
)
(6 Interior_profile_relation (19 19)
	(
		(Ground (22 22) (10))
		(Figure (18 18) (9))
	)
)
(7 Body_parts (30 30)
	(
		(Body_part (30 30) ())
		(Possessor (28 28) ())
		(Orientational_location (29 29) (8))
	)
)
(8 Part_orientational (29 29)
	(
		(Part (30 30) (7))
		(Whole (28 28) ())
	)
)
(9 Body_parts (18 18)
	(
		(Possessor (9 9) ())
		(Attachment (22 22) (10))
		(Body_part (3 3) (2))
	)
)
(10 Body_parts (22 22)
	(
		(Body_part (7 7) (0))
		(Orientational_location (21 21) (12))
		(Possessor (20 20) ())
	)
)
(11 Possession (16 16)
	(
		(Owner (9 9) ())
		(Explanation (22 22) (10))
		(Possession (18 18) (9))
	)
)
(12 Part_orientational (21 21)
	(
		(Part (7 7) (0))
		(Whole (20 20) ())
	)
)
(13 Body_parts (26 26)
	(
		(Attachment (30 30) (7))
		(Body_part (26 26) ())
	)
)
(14 Quarreling (34 34)
	(
		(Arguer1 (9 9) ())
		(Arguer2 (37 37) ())
	)
)
(15 Cardinal_numbers (36 36)
	(
		(Entity (20 20) ())
		(Number (4 4) (1))
	)
)
(16 Operate_vehicle (41 41)
	(
		(Vehicle (13 13) (5))
		(Driver (9 9) ())
	)
)
(17 Capability (40 40)
	(
		(Entity (9 9) ())
		(Event (13 13) (5))
	)
)
(18 Vehicle (43 43)
	(
		(Vehicle (4 4) (1))
	)
)
(19 Quarreling (47 47)
	(
		(Arguer1 (9 9) ())
		(Arguer2 (37 37) ())
	)
)
(20 Cardinal_numbers (49 49)
	(
		(Entity (20 20) ())
		(Number (4 4) (1))
	)
)
(21 Vehicle (57 57)
	(
		(Vehicle (20 20) ())
	)
)
(22 Interior_profile_relation (55 55)
	(
		(Ground (57 57) (21))
		(Figure (53 53) ())
	)
)
(23 Required_event (62 62)
	(
		(Required_situation (9 9) ())
		(Required_situation (64 64) ())
	)
)
)
)
(
; story sentence text for lookup
("Mary and Lucy were playing in the park." "Some little boy came to them." "He took the ball from Lucy." "He kicked it far away from them." "Lucy started to cry.")
; events
(
(0 Competition (4 4)
	(
		(Participants (0 0) ())
		(Place (7 7) (1))
	)
)
(1 Locale_by_use (7 7)
	(
		(Locale (7 7) ())
	)
)
(2 People_by_age (11 11)
	(
		(Person (11 11) ())
		(Descriptor (10 10) ())
	)
)
(3 Removing (17 17)
	(
		(Theme (19 19) ())
		(Agent (16 16) ())
		(Source (21 21) ())
	)
)
(4 Manipulation (24 24)
	(
		(Agent (16 16) ())
		(Place (29 29) ())
		(Entity (11 11) (2))
	)
)
(5 Activity_start (32 32)
	(
		(Activity (19 19) ())
		(Agent (16 16) ())
	)
)
(6 Communication_noise (34 34)
	(
		(Speaker (16 16) ())
	)
)
)
)
(
; story sentence text for lookup
("Sam's dog ran away." "He was old and going blind." "Sam had him for a long time." "He looked for him for years." "It took Sam much longer to get over it.")
; events
(
(0 Self_motion (3 3)
	(
		(Self_mover (2 2) ())
		(Source (4 4) ())
	)
)
(1 Age (8 8)
	(
		(Entity (6 6) ())
	)
)
(2 Transition_to_a_quality (10 10)
	(
		(Entity (6 6) ())
		(Final_quality (11 11) ())
	)
)
(3 Possession (14 14)
	(
		(Owner (6 6) ())
		(Possession (15 15) ())
		(Duration (19 19) (5))
	)
)
(4 Duration_description (18 18)
	(
		(Degree (11 11) ())
		(Period (19 19) (5))
	)
)
(5 Measure_duration (19 19)
	(
		(Process (2 2) ())
		(Unit (11 11) ())
		(Unit (19 19) ())
	)
)
(6 Seeking (22 22)
	(
		(Sought_entity (24 24) ())
		(Cognizer_agent (6 6) ())
		(Time (26 26) (7))
	)
)
(7 Measure_duration (26 26)
	(
		(Unit (11 11) ())
	)
)
(8 Taking_time (29 29)
	(
		(Activity (36 36) ())
		(Time_length (30 30) ())
	)
)
(9 Duration_description (32 32)
	(
		(Eventuality (15 15) ())
		(Degree (31 31) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom had an old stove." "It went out one night." "Tom didn't smell the gas." "It made him feel sick." "Tom had to fix it.")
; events
(
(0 Age (3 3)
	(
		(Entity (4 4) ())
	)
)
(1 Calendric_unit (10 10)
	(
		(Unit (4 4) ())
		(Count (9 9) ())
	)
)
(2 Perception_experience (15 15)
	(
		(Perceiver_passive (12 12) ())
		(Phenomenon (17 17) (3))
	)
)
(3 Substance (17 17)
	(
		(Substance (17 17) ())
	)
)
(4 Causation (20 20)
	(
		(Cause (12 12) ())
		(Affected (21 21) ())
		(Effect (22 24) (5 6))
	)
)
(5 Biological_urge (23 23)
	(
		(Experiencer (21 21) ())
	)
)
(6 Feeling (22 22)
	(
		(Experiencer (21 21) ())
		(Emotional_state (4 4) ())
	)
)
(7 Required_event (26 29)
	(
		(Required_situation (12 12) ())
		(Required_situation (29 29) ())
	)
)
)
)
(
; story sentence text for lookup
("The man went to a park." "He saw a woman there." "The woman was beautiful." "He took a picture of her." "The woman saw him do it.")
; events
(
(0 Motion (2 2)
	(
		(Goal (5 5) (2))
		(Theme (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Locale_by_use (5 5)
	(
		(Locale (5 5) ())
	)
)
(3 Perception_experience (8 8)
	(
		(Phenomenon (10 10) (4))
		(Perceiver_passive (7 7) ())
		(State (11 11) ())
	)
)
(4 People (10 10)
	(
		(Person (10 10) ())
	)
)
(5 People (14 14)
	(
		(Person (1 1) (1))
	)
)
(6 Aesthetics (16 16)
	(
		(Entity (1 1) (1))
	)
)
(7 Create_representation (19 19)
	(
		(Creator (7 7) ())
		(Represented (21 21) (8))
	)
)
(8 Physical_artworks (21 21)
	(
		(Represented (23 23) ())
		(Artifact (10 10) (4))
	)
)
(9 People (26 26)
	(
		(Person (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("These men fish in the sea." "They have a large net." "They carry the net in a boat and drip it into the water." "Soon they pull it to the shore." "Sometimes they find many fish in it." "The women put the fish in the basket and take them home." "Pedro and Simeon like to watch the men in the boats and help pull in the net.")
; events
(
(0 Hunting (2 2)
	(
		(Ground (5 5) (2))
		(Hunter (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Natural_features (5 5)
	(
		(Locale (5 5) ())
	)
)
(3 Possession (8 8)
	(
		(Owner (7 7) ())
		(Possession (11 11) ())
	)
)
(4 Size (10 10)
	(
		(Entity (11 11) ())
	)
)
(5 Natural_features (25 25)
	(
		(Locale (25 25) ())
	)
)
(6 Bringing (14 14)
	(
		(Theme (16 16) ())
		(Agent (7 7) ())
		(Constant_location (19 19) (7))
	)
)
(7 Vehicle (19 19)
	(
		(Vehicle (19 19) ())
	)
)
(8 Cause_fluidic_motion (21 21)
	(
		(Fluid (22 22) ())
		(Agent (7 7) ())
		(Goal (25 25) (5))
	)
)
(9 Relational_natural_features (33 33)
	(
		(Focal_feature (19 19) (7))
	)
)
(10 Cause_motion (29 31)
	(
		(Goal (33 33) (9))
		(Agent (1 1) (1))
	)
)
(11 Locating (37 37)
	(
		(Perceiver (1 1) (1))
		(Sought_entity (39 39) (12))
		(Ground (41 41) ())
	)
)
(12 Food (39 39)
	(
	)
)
(13 Quantified_mass (38 38)
	(
		(Individuals (11 11) ())
		(Quantity (38 38) ())
	)
)
(14 Bringing (52 52)
	(
		(Theme (53 53) ())
		(Goal (54 54) ())
		(Agent (1 1) (1))
	)
)
(15 Placing (45 45)
	(
		(Theme (39 39) (12))
		(Goal (41 41) ())
		(Agent (1 1) (1))
	)
)
(16 People (44 44)
	(
		(Person (1 1) (1))
	)
)
(17 Food (47 47)
	(
	)
)
(18 Containers (50 50)
	(
		(Container (50 50) ())
	)
)
(19 Perception_active (61 61)
	(
		(Phenomenon (63 63) (22))
		(Perceiver_agentive (56 56) ())
	)
)
(20 Experiencer_focus (59 59)
	(
		(Content (63 63) (22))
		(Experiencer (56 56) ())
	)
)
(21 Assistance (68 68)
	(
		(Goal (72 72) ())
		(Helper (56 56) ())
	)
)
(22 People (63 63)
	(
		(Person (50 50) (18))
		(Descriptor (66 66) (23))
	)
)
(23 Vehicle (66 66)
	(
		(Vehicle (53 53) ())
	)
)
)
)
(
; story sentence text for lookup
("The girls have come to play with the baby." "Two girls have little dolls." "One girl has a red dress." "The baby is glad to see the girls." "The girl with the red dress is May." "May is glad to see the good baby." "She will take the baby to see the bird.")
; events
(
(0 People_by_age (8 8)
	(
		(Person (8 8) ())
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Arriving (3 3)
	(
		(Purpose (8 8) (0))
		(Theme (1 1) (1))
	)
)
(3 Have_associated (12 12)
	(
		(Entity (14 14) ())
		(Topical_entity (1 1) (1))
	)
)
(4 People (11 11)
	(
		(Person (1 1) (1))
	)
)
(5 Size (13 13)
	(
		(Entity (14 14) ())
	)
)
(6 Clothing (21 21)
	(
		(Garment (21 21) ())
		(Descriptor (14 14) ())
	)
)
(7 Wearing (18 18)
	(
		(Clothing (21 21) (6))
		(Wearer (1 1) (1))
	)
)
(8 Cardinal_numbers (16 16)
	(
		(Number (16 16) ())
		(Entity (1 1) (1))
	)
)
(9 People (17 17)
	(
		(Person (1 1) (1))
	)
)
(10 Color (20 20)
	(
		(Entity (21 21) (6))
		(Color (14 14) ())
	)
)
(11 Perception_experience (28 28)
	(
		(Phenomenon (30 30) (13))
		(Perceiver_passive (1 1) (1))
	)
)
(12 Emotions_by_stimulus (26 26)
	(
		(Stimulus (30 30) (13))
		(Experiencer (1 1) (1))
	)
)
(13 People (30 30)
	(
		(Person (30 30) ())
	)
)
(14 Clothing (37 37)
	(
		(Garment (21 21) (6))
		(Descriptor (14 14) ())
	)
)
(15 People (33 33)
	(
		(Descriptor (37 37) (14))
		(Person (1 1) (1))
	)
)
(16 Color (36 36)
	(
		(Entity (21 21) (6))
		(Color (14 14) ())
	)
)
(17 Emotions_by_stimulus (42 42)
	(
		(Experiencer (16 16) (8))
		(Stimulus (47 47) (20))
	)
)
(18 Perception_experience (44 44)
	(
		(Perceiver_passive (16 16) (8))
		(Phenomenon (47 47) (20))
	)
)
(19 Desirability (46 46)
	(
		(Evaluee (30 30) (13))
	)
)
(20 People_by_age (47 47)
	(
		(Person (30 30) (13))
		(Persistent_characteristic (46 46) (19))
	)
)
(21 Bringing (51 51)
	(
		(Purpose (57 57) ())
		(Agent (16 16) (8))
		(Theme (14 14) ())
	)
)
(22 People_by_age (53 53)
	(
		(Person (14 14) ())
	)
)
(23 Perception_experience (55 55)
	(
		(Phenomenon (57 57) ())
	)
)
)
)
(
; story sentence text for lookup
("My friend came to visit me." "She brought her young son with her." "He was a cute little boy." "We gave him some toys to play with." "We had a great visit.")
; events
(
(0 Arriving (2 2)
	(
		(Goal (5 5) ())
		(Theme (1 1) (1))
	)
)
(1 Personal_relationship (1 1)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (1 1) ())
	)
)
(2 Bringing (8 8)
	(
		(Agent (0 0) ())
		(Constant_location (13 13) ())
		(Theme (11 11) (3))
	)
)
(3 Kinship (11 11)
	(
		(Ego (9 9) ())
		(Alter (11 11) ())
	)
)
(4 Age (10 10)
	(
		(Entity (11 11) (3))
	)
)
(5 People_by_age (20 20)
	(
		(Person (20 20) ())
		(Person (0 0) ())
		(Descriptor (11 11) (3))
		(Persistent_characteristic (18 18) (6))
	)
)
(6 Social_interaction_evaluation (18 18)
	(
		(Evaluee (20 20) (5))
	)
)
(7 Giving (23 23)
	(
		(Donor (0 0) ())
		(Recipient (9 9) ())
		(Theme (26 26) ())
	)
)
(8 Competition (28 28)
	(
		(Competition (29 29) ())
		(Participants (9 9) ())
	)
)
(9 Visiting (35 35)
	(
		(Agent (0 0) ())
	)
)
(10 Desirability (34 34)
	(
		(Evaluee (11 11) (3))
	)
)
)
)
(
; story sentence text for lookup
("Allie was watching a show yesterday." "It was very funny." "Allie laughed out loud." "She didn't know how to keep it in." "She wanted to watch it again.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Perception_active (2 2)
	(
		(Phenomenon (4 4) ())
		(Time (5 5) (0))
		(Perceiver_agentive (0 0) ())
	)
)
(2 Stimulus_focus (10 10)
	(
		(Stimulus (0 0) ())
		(Degree (9 9) ())
	)
)
(3 Make_noise (13 13)
	(
		(Manner (14 15) ())
		(Sound_source (0 0) ())
	)
)
(4 Retaining (23 25)
	(
		(Agent (0 0) ())
		(Theme (24 24) ())
	)
)
(5 Awareness (20 20)
	(
		(Cognizer (0 0) ())
		(Content (24 24) ())
	)
)
(6 Desiring (28 28)
	(
		(Experiencer (0 0) ())
		(Event (31 31) ())
	)
)
(7 Perception_active (30 30)
	(
		(Depictive (5 5) (0))
		(Perceiver_agentive (0 0) ())
		(Phenomenon (31 31) ())
	)
)
)
)
(
; story sentence text for lookup
("I once saw a wolf." "I was walking in the woods when I saw him." "He was patrolling the woods." "He was so big." "I ran home very quickly.")
; events
(
(0 Perception_experience (2 2)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (4 4) ())
	)
)
(1 Biological_area (11 11)
	(
		(Locale (11 11) ())
	)
)
(2 Self_motion (8 8)
	(
		(Self_mover (0 0) ())
		(Area (4 4) ())
	)
)
(3 Temporal_collocation (12 12)
	(
		(Landmark_event (13 13) ())
		(Trajector_event (6 6) ())
	)
)
(4 Perception_experience (14 14)
	(
		(Perceiver_passive (13 13) ())
		(Phenomenon (15 15) ())
	)
)
(5 Patrolling (19 19)
	(
		(Patrol (0 0) ())
		(Ground (21 21) (6))
	)
)
(6 Biological_area (21 21)
	(
		(Locale (21 21) ())
	)
)
(7 Size (26 26)
	(
		(Entity (0 0) ())
		(Degree (25 25) ())
	)
)
(8 Self_motion (29 29)
	(
		(Self_mover (0 0) ())
		(Goal (25 25) ())
		(Manner (21 21) (6))
	)
)
(9 Rate_description (32 32)
	(
		(Event (25 25) ())
		(Degree (31 31) ())
	)
)
)
)
(
; story sentence text for lookup
("Magee was only good at running." "He loved to run all the time." "One day he ran far away from home." "Magee was never seen again." "Some say Magee is still running today.")
; events
(
(0 Expertise (3 3)
	(
		(Skill (4 5) (1))
		(Protagonist (0 0) ())
	)
)
(1 Operate_vehicle (5 5)
	(
		(Driver (0 0) ())
	)
)
(2 Experiencer_focus (8 8)
	(
		(Content (9 10) (4))
		(Experiencer (0 0) ())
		(Content (11 13) (3))
	)
)
(3 Frequency (11 13)
	(
		(Event (7 7) ())
	)
)
(4 Self_motion (10 10)
	(
		(Self_mover (0 0) ())
		(Time (11 13) (3))
	)
)
(5 Calendric_unit (16 16)
	(
		(Unit (16 16) ())
	)
)
(6 Self_motion (18 18)
	(
		(Self_mover (17 17) ())
		(Source (22 22) ())
		(Time (15 16) (5))
	)
)
(7 Perception_experience (27 27)
	(
		(Phenomenon (0 0) ())
	)
)
(8 Statement (31 31)
	(
		(Speaker (0 0) ())
		(Message (32 32) ())
	)
)
(9 Calendric_unit (36 36)
	(
		(Unit (36 36) ())
	)
)
(10 Operate_vehicle (35 35)
	(
		(Driver (17 17) ())
		(Time (36 36) (9))
	)
)
)
)
(
; story sentence text for lookup
("John has a new boat." "His father gave it to him." "It is blue, with a bright red line near the water." "He keeps it in the river, not far from the road." "He has some good oars, too." "He keeps the oars at the house." "His home is near the river." "The water is not deep, and the children will not fall out of the boat." "John has a hook and line." "They will get in the boat and row far out on the water.")
; events
(
(0 Possession (1 1)
	(
		(Owner (0 0) ())
		(Possession (4 4) (1))
	)
)
(1 Vehicle (4 4)
	(
		(Vehicle (4 4) ())
		(Descriptor (3 3) (2))
	)
)
(2 Age (3 3)
	(
		(Entity (4 4) (1))
		(Age (3 3) ())
	)
)
(3 Giving (8 8)
	(
		(Recipient (11 11) ())
		(Theme (3 3) (2))
		(Donor (7 7) (4))
	)
)
(4 Kinship (7 7)
	(
		(Ego (0 0) ())
		(Alter (7 7) ())
	)
)
(5 Color (20 20)
	(
		(Color (20 20) ())
		(Color_qualifier (19 19) (8))
		(Entity (21 21) ())
	)
)
(6 Natural_features (24 24)
	(
		(Locale (24 24) ())
	)
)
(7 Color (15 15)
	(
		(Entity (0 0) ())
		(Color (15 15) ())
	)
)
(8 Color_qualities (19 19)
	(
		(Described_entity (21 21) ())
	)
)
(9 Roadways (37 37)
	(
		(Roadway (24 24) (6))
	)
)
(10 Natural_features (31 31)
	(
		(Locale (31 31) ())
	)
)
(11 Storing (27 27)
	(
		(Agent (0 0) ())
		(Location (31 31) (10))
		(Theme (15 15) (7))
	)
)
(12 Gradable_proximity (34 34)
	(
		(Figure (11 11) ())
		(Ground (37 37) (9))
	)
)
(13 Interior_profile_relation (29 29)
	(
		(Figure (0 0) ())
		(Ground (11 11) ())
		(Figure (15 15) (7))
	)
)
(14 Body_parts (43 43)
	(
		(Body_part (4 4) (1))
		(Possessor (0 0) ())
		(Descriptor (3 3) (2))
	)
)
(15 Possession (40 40)
	(
		(Owner (0 0) ())
		(Possession (4 4) (1))
	)
)
(16 Desirability (42 42)
	(
		(Evaluee (4 4) (1))
	)
)
(17 Storing (48 48)
	(
		(Agent (0 0) ())
		(Location (53 53) (19))
		(Theme (50 50) ())
	)
)
(18 Spatial_co-location (51 51)
	(
		(Ground (53 53) (19))
		(Figure (50 50) ())
	)
)
(19 Buildings (53 53)
	(
		(Building (19 19) (8))
	)
)
(20 Buildings (56 56)
	(
		(Building (7 7) (4))
	)
)
(21 Natural_features (60 60)
	(
		(Locale (31 31) (10))
	)
)
(22 Locative_relation (58 58)
	(
		(Ground (11 11) ())
		(Figure (7 7) (4))
	)
)
(23 Vehicle (77 77)
	(
		(Vehicle (77 77) ())
	)
)
(24 Measurable_attributes (66 66)
	(
		(Attribute (4 4) (1))
		(Entity (7 7) (4))
	)
)
(25 People_by_age (70 70)
	(
		(Person (21 21) ())
	)
)
(26 Possession (80 80)
	(
		(Owner (0 0) ())
		(Possession (82 82) ())
	)
)
(27 Transition_to_state (88 88)
	(
		(Entity (0 0) ())
		(Final_situation (91 91) (28))
	)
)
(28 Vehicle (91 91)
	(
		(Vehicle (31 31) (10))
	)
)
(29 Natural_features (98 98)
	(
		(Locale (98 98) ())
	)
)
(30 Operate_vehicle (93 93)
	(
		(Driver (0 0) ())
		(Place (98 98) (29))
	)
)
)
)
(
; story sentence text for lookup
("My friend came to visit." "She wanted to go out." "I asked if she wanted to meet my brothers." "I was in trouble that night." "I didn't find out why until the next day.")
; events
(
(0 Personal_relationship (1 1)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (1 1) ())
	)
)
(1 Visiting (4 4)
	(
		(Agent (1 1) (0))
	)
)
(2 Desiring (7 7)
	(
		(Experiencer (0 0) ())
		(Event (8 10) ())
	)
)
(3 Questioning (13 13)
	(
		(Message (15 15) ())
		(Speaker (0 0) ())
	)
)
(4 Desiring (16 16)
	(
		(Event (20 20) (6))
		(Experiencer (15 15) ())
	)
)
(5 Make_acquaintance (18 18)
	(
		(Individual_2 (20 20) (6))
		(Individual_1 (15 15) ())
	)
)
(6 Kinship (20 20)
	(
		(Ego (19 19) ())
		(Alter (20 20) ())
	)
)
(7 Calendric_unit (27 27)
	(
		(Unit (27 27) ())
		(Relative_time (26 26) ())
	)
)
(8 Predicament (25 25)
	(
		(Experiencer (0 0) ())
	)
)
(9 Calendric_unit (38 38)
	(
		(Relative_time (20 20) (6))
		(Unit (38 38) ())
	)
)
(10 Becoming_aware (32 33)
	(
		(Cognizer (0 0) ())
		(Phenomenon (27 27) (7))
		(Time (38 38) (9))
	)
)
)
)
(
; story sentence text for lookup
("Lucy wanted to skate." "She hadn't done it before." "She decided to take lessons." "On her first lesson she fell." "It would be away until she got good.")
; events
(
(0 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (2 3) (1))
	)
)
(1 Operate_vehicle (3 3)
	(
		(Driver (0 0) ())
		(Vehicle (3 3) ())
	)
)
(2 Intentionally_act (8 8)
	(
		(Agent (0 0) ())
		(Act (9 9) ())
	)
)
(3 Negation (7 7)
	(
		(Negated_proposition (9 9) ())
		(Negated_proposition (5 5) ())
	)
)
(4 Deciding (13 13)
	(
		(Cognizer (0 0) ())
		(Decision (16 16) (5))
	)
)
(5 Education_teaching (16 16)
	(
		(Student (0 0) ())
	)
)
(6 Ordinal_numbers (20 20)
	(
		(Type (3 3) (1))
	)
)
(7 Education_teaching (21 21)
	(
		(Teacher (19 19) ())
	)
)
(8 Motion_directional (23 23)
	(
		(Theme (9 9) ())
	)
)
)
)
(
; story sentence text for lookup
("Fred looked outside." "It looked like he got new neighbors." "He was excited." "He went to introduce himself." "He made some friends.")
; events
(
(0 Perception_active (1 1)
	(
		(Perceiver_agentive (0 0) ())
		(Direction (2 2) ())
	)
)
(1 Age (9 9)
	(
		(Entity (10 10) (4))
	)
)
(2 Give_impression (5 5)
	(
		(Phenomenon (0 0) ())
		(Characterization (7 7) ())
	)
)
(3 Have_associated (8 8)
	(
		(Entity (10 10) (4))
		(Topical_entity (7 7) ())
	)
)
(4 People_by_residence (10 10)
	(
		(Known_resident (7 7) ())
	)
)
(5 Emotion_directed (14 14)
	(
		(Experiencer (0 0) ())
	)
)
(6 Intentionally_create (23 23)
	(
		(Created_entity (25 25) (7))
		(Creator (0 0) ())
	)
)
(7 Personal_relationship (25 25)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (7 7) ())
	)
)
)
)
(
; story sentence text for lookup
("My son had just started eating foods." "We gave him some peaches to start out on." "He loved them." "I think he got more on him than in him." "It was really funny.")
; events
(
(0 Ingestion (5 5)
	(
		(Ingestibles (6 6) (3))
		(Ingestor (1 1) (1))
	)
)
(1 Kinship (1 1)
	(
		(Ego (0 0) ())
		(Alter (1 1) ())
	)
)
(2 Activity_start (4 4)
	(
		(Activity (6 6) (3))
		(Time (3 3) ())
		(Agent (1 1) (1))
	)
)
(3 Food (6 6)
	(
	)
)
(4 Food (12 12)
	(
	)
)
(5 Activity_start (14 15)
	(
		(Co-timed_event (16 16) ())
	)
)
(6 Giving (9 9)
	(
		(Donor (0 0) ())
		(Recipient (10 10) ())
		(Theme (12 12) (4))
	)
)
(7 Experiencer_focus (19 19)
	(
		(Experiencer (0 0) ())
		(Content (10 10) ())
	)
)
(8 Opinion (23 23)
	(
		(Opinion (24 24) ())
		(Cognizer (0 0) ())
	)
)
(9 Increment (26 26)
	(
		(Added_set (26 26) ())
	)
)
(10 Have_associated (25 25)
	(
		(Topical_entity (10 10) ())
		(Entity (26 26) (9))
	)
)
(11 Stimulus_focus (36 36)
	(
		(Stimulus (0 0) ())
		(Degree (10 10) ())
	)
)
)
)
(
; story sentence text for lookup
("O John!" "the sun has just set." "It is not hot, now." "Let us run and jump." "I think it is fun to run, and skip, and jump." "See the duck on the pond!" "Her nest is up on the bank, under the rock." "We must not touch the nest, but we may look at it")
; events
(
(0 Sidereal_appearance (7 7)
	(
		(Astronomical_entity (4 4) ())
	)
)
(1 Temporal_collocation (14 14)
	(
		(Trajector_event (9 9) ())
	)
)
(2 Ambient_temperature (12 12)
	(
		(Circumstances (9 9) ())
		(Time (14 14) (1))
	)
)
(3 Self_motion (18 18)
	(
		(Self_mover (17 17) ())
	)
)
(4 Self_motion (20 20)
	(
		(Self_mover (17 17) ())
	)
)
(5 Self_motion (28 28)
	(
	)
)
(6 Self_motion (31 31)
	(
		(Self_mover (9 9) ())
	)
)
(7 Self_motion (34 34)
	(
		(Self_mover (9 9) ())
	)
)
(8 Opinion (23 23)
	(
		(Opinion (24 24) ())
		(Cognizer (9 9) ())
	)
)
(9 Stimulus_focus (26 26)
	(
		(Stimulus (27 34) (5 6 7))
	)
)
(10 Perception_experience (36 36)
	(
		(Ground (41 41) (11))
		(Phenomenon (38 38) ())
	)
)
(11 Natural_features (41 41)
	(
		(Locale (14 14) (1))
	)
)
(12 Spatial_contact (47 47)
	(
		(Ground (49 49) (13))
		(Direction (46 46) ())
		(Figure (4 4) ())
	)
)
(13 Natural_features (49 49)
	(
		(Locale (49 49) ())
	)
)
(14 Perception_active (65 65)
	(
		(Phenomenon (67 67) ())
		(Perceiver_agentive (63 63) ())
	)
)
(15 Required_event (56 56)
	(
		(Required_situation (9 9) ())
		(Required_situation (41 41) (11))
	)
)
(16 Manipulation (58 58)
	(
		(Entity (60 60) ())
		(Agent (9 9) ())
	)
)
)
)
(
; story sentence text for lookup
("The boy locked the cage." "He left for school." "He returned home." "The cage was unlocked." "He caught his brother playing with his bird.")
; events
(
(0 Closure (2 2)
	(
		(Place (4 4) (1))
		(Agent (1 1) (2))
	)
)
(1 Containers (4 4)
	(
		(Container (4 4) ())
	)
)
(2 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(3 Departing (7 7)
	(
		(Journey (9 9) (4))
		(Theme (6 6) ())
	)
)
(4 Locale_by_use (9 9)
	(
		(Locale (9 9) ())
	)
)
(5 Arriving (12 12)
	(
		(Theme (6 6) ())
		(Goal (13 13) ())
	)
)
(6 Containers (16 16)
	(
		(Container (1 1) (2))
	)
)
(7 Becoming_aware (21 21)
	(
		(Cognizer (6 6) ())
		(Phenomenon (23 23) (9))
	)
)
(8 Economy (24 24)
	(
		(Descriptor (9 9) (4))
		(Descriptor (27 27) ())
	)
)
(9 Kinship (23 23)
	(
		(Ego (13 13) ())
		(Alter (9 9) (4))
	)
)
)
)
(
; story sentence text for lookup
("The cat has the rat." "I had the cat." "I can see." "I can see a cat." "And I see a black rat." "The cat can see and the rat can see." "A rat can see my cat." "The black rat ran." "My black cat ran." "My cat has the rat." "I can see a cat and a rat.")
; events
(
(0 Animals (9 9)
	(
		(Animal (6 6) ())
		(Animal (9 9) ())
	)
)
(1 Perception_experience (13 13)
	(
		(Perceiver_passive (6 6) ())
	)
)
(2 Possibility (12 12)
	(
		(Possible_event (6 6) ())
		(Possible_event (13 13) (1))
	)
)
(3 Perception_experience (17 17)
	(
		(Perceiver_passive (6 6) ())
		(Phenomenon (19 19) ())
	)
)
(4 Possibility (16 16)
	(
		(Possible_event (6 6) ())
		(Possible_event (19 19) ())
	)
)
(5 Perception_experience (23 23)
	(
		(Phenomenon (26 26) ())
		(Perceiver_passive (22 22) ())
	)
)
(6 Color (25 25)
	(
		(Entity (26 26) ())
		(Color (25 25) ())
	)
)
(7 Perception_experience (36 36)
	(
		(Perceiver_passive (34 34) ())
	)
)
(8 Capability (30 30)
	(
		(Event (9 9) (0))
		(Entity (29 29) ())
	)
)
(9 Capability (35 35)
	(
		(Event (36 36) (7))
		(Entity (34 34) ())
	)
)
(10 Perception_experience (31 31)
	(
		(Perceiver_passive (29 29) ())
	)
)
(11 Possibility (40 40)
	(
		(Possible_event (43 43) (12))
		(Possible_event (29 29) ())
	)
)
(12 Animals (43 43)
	(
		(Animal (26 26) ())
		(Animal (25 25) (6))
	)
)
(13 Perception_experience (41 41)
	(
		(Phenomenon (43 43) (12))
		(Perceiver_passive (29 29) ())
	)
)
(14 Color (46 46)
	(
		(Entity (13 13) (1))
		(Color (22 22) ())
	)
)
(15 Self_motion (48 48)
	(
		(Self_mover (47 47) ())
	)
)
(16 Color (51 51)
	(
		(Entity (13 13) (1))
		(Color (22 22) ())
	)
)
(17 Self_motion (53 53)
	(
		(Self_mover (47 47) ())
	)
)
(18 Perception_experience (63 63)
	(
		(Perceiver_passive (6 6) ())
		(Phenomenon (65 65) ())
	)
)
(19 Possibility (62 62)
	(
		(Possible_event (6 6) ())
		(Possible_event (65 65) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom got a kitten." "It ran away within days." "Tom never found it." "He got another cat." "By the time Tom's kitten returned he had forgotten about it.")
; events
(
(0 Have_associated (1 1)
	(
		(Topical_entity (0 0) ())
		(Entity (3 3) ())
	)
)
(1 Self_motion (6 6)
	(
		(Self_mover (0 0) ())
		(Source (7 7) ())
	)
)
(2 Calendric_unit (9 9)
	(
		(Unit (9 9) ())
	)
)
(3 Locating (13 13)
	(
		(Perceiver (0 0) ())
		(Sought_entity (14 14) ())
	)
)
(4 Increment (18 18)
	(
		(Class (14 14) ())
	)
)
(5 Have_associated (17 17)
	(
		(Entity (3 3) ())
		(Topical_entity (0 0) ())
	)
)
(6 Arriving (27 27)
	(
		(Theme (26 26) ())
	)
)
(7 Remembering_information (30 30)
	(
		(Mental_content (32 32) ())
		(Cognizer (28 28) ())
	)
)
)
)
(
; story sentence text for lookup
("Jennifer was a little girl." "A man pulled up to her house." "He offered her candy." "Jennifer's brother was with her." "He told her to stay away.")
; events
(
(0 People (4 4)
	(
		(Person (0 0) ())
		(Persistent_characteristic (3 3) (1))
	)
)
(1 Size (3 3)
	(
		(Entity (4 4) (0))
	)
)
(2 People (7 7)
	(
		(Person (7 7) ())
	)
)
(3 Buildings (12 12)
	(
		(Building (12 12) ())
	)
)
(4 Food (17 17)
	(
	)
)
(5 Kinship (21 21)
	(
		(Ego (19 20) ())
		(Alter (21 21) ())
	)
)
(6 Telling (27 27)
	(
		(Speaker (0 0) ())
		(Addressee (21 21) (5))
		(Message (29 31) (7))
	)
)
(7 Buildings (30 30)
	(
		(Possessor (21 21) (5))
		(Place (31 31) ())
	)
)
)
)
(
; story sentence text for lookup
("I went to my door yesterday." "I saw there was a new book." "It came right to me." "I was pretty happy about that." "I couldn't wait to read it.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Motion (1 1)
	(
		(Theme (0 0) ())
		(Time (5 5) (0))
		(Goal (4 4) (2))
	)
)
(2 Connecting_architecture (4 4)
	(
		(Part (4 4) ())
		(Whole (3 3) ())
	)
)
(3 Existence (9 9)
	(
		(Entity (11 14) (5 6))
	)
)
(4 Becoming_aware (8 8)
	(
		(Cognizer (0 0) ())
		(Phenomenon (9 13) (3 5 6))
	)
)
(5 Age (12 12)
	(
		(Entity (13 13) (6))
	)
)
(6 Text (13 13)
	(
		(Text (13 13) ())
	)
)
(7 Emotion_directed (24 24)
	(
		(Topic (26 26) ())
		(Experiencer (0 0) ())
		(Degree (23 23) ())
	)
)
(8 Holding_off_on (31 31)
	(
		(Agent (0 0) ())
		(Desirable_action (34 34) ())
	)
)
(9 Reading_activity (33 33)
	(
		(Text (13 13) (6))
		(Reader (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Today Manuela and Carmen cannot walk on the seashore." "They must stay at home." "There is a great storm." "The sun does not shine." "The clouds hide it." "The wind blows very hard." "See the big waves coming up on the shore." "The fishermen cannot go out in their boats." "They must stay at home, too.")
; events
(
(0 Calendric_unit (0 0)
	(
	)
)
(1 Self_motion (6 6)
	(
		(Time (0 0) (0))
		(Self_mover (1 1) ())
		(Place (9 9) (2))
	)
)
(2 Natural_features (9 9)
	(
		(Locale (9 9) ())
	)
)
(3 Temporary_stay (13 13)
	(
		(Guest (0 0) (0))
		(Location (15 15) (5))
	)
)
(4 Required_event (12 12)
	(
		(Required_situation (0 0) (0))
		(Required_situation (15 15) (5))
	)
)
(5 Buildings (15 15)
	(
		(Building (15 15) ())
	)
)
(6 Existence (17 17)
	(
		(Entity (15 15) (5))
	)
)
(7 Weather (21 21)
	(
		(Specification (20 20) (8))
	)
)
(8 Size (20 20)
	(
		(Entity (15 15) (5))
	)
)
(9 Location_of_light (27 27)
	(
		(Figure (24 24) ())
	)
)
(10 Eclipse (31 31)
	(
		(Obstruction (24 24) ())
		(Eclipsed (20 20) (8))
	)
)
(11 Moving_in_place (36 36)
	(
		(Manner (15 15) (5))
		(Theme (24 24) ())
	)
)
(12 Arriving (44 44)
	(
		(Theme (1 1) ())
		(Source (45 45) ())
		(Goal (48 48) (15))
	)
)
(13 Size (42 42)
	(
		(Entity (20 20) (8))
	)
)
(14 Weather (43 43)
	(
		(Specification (42 42) (13))
	)
)
(15 Relational_natural_features (48 48)
	(
		(Focal_feature (48 48) ())
	)
)
(16 Perception_experience (40 40)
	(
		(Phenomenon (1 1) ())
		(State (48 48) (15))
	)
)
(17 Spatial_contact (46 46)
	(
		(Figure (44 45) (12))
		(Ground (48 48) (15))
		(Figure (1 1) ())
	)
)
(18 Motion (54 54)
	(
		(Theme (24 24) ())
		(Goal (45 45) ())
		(Carrier (48 48) (15))
	)
)
(19 Vehicle (58 58)
	(
		(Vehicle (48 48) (15))
		(Possessor (57 57) ())
	)
)
(20 Temporary_stay (62 62)
	(
		(Guest (0 0) (0))
		(Location (15 15) (5))
	)
)
(21 Required_event (61 61)
	(
		(Required_situation (0 0) (0))
		(Required_situation (15 15) (5))
	)
)
(22 Buildings (64 64)
	(
		(Building (15 15) (5))
	)
)
)
)
(
; story sentence text for lookup
("The man turned on the light." "A mouse got startled." "The mouse ran across the living room." "The man got startled." "The man hid in his room.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Transition_to_state (9 9)
	(
		(Final_quality (10 10) (2))
		(Entity (7 8) ())
	)
)
(2 Emotion_directed (10 10)
	(
		(Experiencer (7 8) ())
	)
)
(3 Building_subparts (17 18)
	(
		(Building_part (18 18) ())
	)
)
(4 Self_motion (14 14)
	(
		(Path (18 18) ())
		(Self_mover (7 8) ())
	)
)
(5 People (21 21)
	(
		(Person (1 1) (0))
	)
)
(6 Emotion_directed (23 23)
	(
		(Experiencer (7 8) ())
	)
)
(7 People (26 26)
	(
		(Person (1 1) (0))
	)
)
(8 Building_subparts (30 30)
	(
		(Building_part (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("My son was outside playing." "His best friend came by the house." "They went off on an adventure." "They were gone for quite some time." "They came home before dark.")
; events
(
(0 Kinship (1 1)
	(
		(Ego (0 0) ())
		(Alter (1 1) ())
	)
)
(1 Competition (4 4)
	(
		(Place (3 3) (2))
		(Participants (1 1) (0))
	)
)
(2 Interior_profile_relation (3 3)
	(
		(Ground (4 4) (1))
		(Figure (1 1) (0))
	)
)
(3 Personal_relationship (8 8)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (8 8) ())
	)
)
(4 Desirability (7 7)
	(
		(Affected_party (0 0) ())
		(Evaluee (8 8) (3))
	)
)
(5 Buildings (12 12)
	(
		(Building (12 12) ())
	)
)
(6 Travel (19 19)
	(
		(Traveler (0 0) ())
	)
)
(7 Buildings (31 31)
	(
		(Building (8 8) (3))
	)
)
(8 Arriving (30 30)
	(
		(Theme (0 0) ())
		(Goal (8 8) (3))
		(Time (33 33) (9))
	)
)
(9 Earnings_and_losses (33 33)
	(
		(Time (4 4) (1))
	)
)
(10 Time_vector (32 32)
	(
		(Event (29 29) ())
		(Landmark_event (4 4) (1))
	)
)
)
)
(
; story sentence text for lookup
("I have four apples on this plate." "If I put two apples on the box, I shall leave two apples on the plate." "Four apples are two apples and two apples." "If I put three apples on the box, I shall leave one apple on the plate." "Four apples are three apples and one apple." "If I put one on the box, I shall leave on the plate.")
; events
(
(0 Cardinal_numbers (2 2)
	(
		(Number (2 2) ())
		(Entity (3 3) (2))
	)
)
(1 Possession (1 1)
	(
		(Owner (0 0) ())
		(Depictive (6 6) ())
		(Possession (3 3) (2))
	)
)
(2 Food (3 3)
	(
	)
)
(3 Cardinal_numbers (11 11)
	(
		(Entity (12 12) (7))
		(Number (3 3) (2))
	)
)
(4 Placing (10 10)
	(
		(Goal (15 15) (9))
		(Agent (9 9) ())
		(Theme (12 12) (7))
	)
)
(5 Abandonment (19 19)
	(
		(Agent (17 17) ())
		(Theme (21 21) (8))
		(Place (24 24) ())
	)
)
(6 Spatial_contact (13 13)
	(
		(Ground (15 15) (9))
		(Figure (12 12) (7))
	)
)
(7 Food (12 12)
	(
	)
)
(8 Food (21 21)
	(
	)
)
(9 Containers (15 15)
	(
		(Container (15 15) ())
	)
)
(10 Cardinal_numbers (20 20)
	(
		(Entity (21 21) (8))
		(Number (20 20) ())
	)
)
(11 Food (33 33)
	(
	)
)
(12 Cardinal_numbers (32 32)
	(
		(Number (32 32) ())
		(Entity (15 15) (9))
	)
)
(13 Cardinal_numbers (26 26)
	(
		(Entity (9 9) ())
		(Number (0 0) ())
	)
)
(14 Cardinal_numbers (29 29)
	(
		(Entity (12 12) (7))
		(Number (3 3) (2))
	)
)
(15 Food (30 30)
	(
	)
)
(16 Cardinal_numbers (38 38)
	(
		(Entity (12 12) (7))
		(Number (3 3) (2))
	)
)
(17 Placing (37 37)
	(
		(Goal (15 15) (9))
		(Agent (9 9) ())
		(Theme (12 12) (7))
	)
)
(18 Abandonment (46 46)
	(
		(Agent (17 17) ())
		(Place (24 24) ())
		(Theme (21 21) (8))
	)
)
(19 Spatial_contact (40 40)
	(
		(Ground (15 15) (9))
		(Figure (12 12) (7))
	)
)
(20 Food (39 39)
	(
	)
)
(21 Containers (42 42)
	(
		(Container (15 15) (9))
	)
)
(22 Cardinal_numbers (47 47)
	(
		(Number (20 20) (10))
		(Entity (21 21) (8))
	)
)
(23 Food (48 48)
	(
	)
)
(24 Food (60 60)
	(
	)
)
(25 Cardinal_numbers (59 59)
	(
		(Number (32 32) (12))
		(Entity (15 15) (9))
	)
)
(26 Cardinal_numbers (53 53)
	(
		(Entity (9 9) ())
		(Number (0 0) ())
	)
)
(27 Cardinal_numbers (56 56)
	(
		(Entity (12 12) (7))
		(Number (3 3) (2))
	)
)
(28 Food (57 57)
	(
	)
)
(29 Perception_active (64 65)
	(
		(Perceiver_agentive (9 9) ())
		(Place (6 6) ())
		(Phenomenon (3 3) (2))
	)
)
(30 Abandonment (72 72)
	(
		(Place (75 75) ())
		(Agent (70 70) ())
	)
)
(31 Spatial_contact (66 66)
	(
		(Ground (68 68) (32))
		(Figure (3 3) (2))
	)
)
(32 Containers (68 68)
	(
		(Container (32 32) (12))
	)
)
)
)
(
; story sentence text for lookup
("This is a schoolhouse in America." "We can see some boys and girls in the street." "The boys and girls are going to school." "Last night they studied their lessons." "This is a large, fine schoolhouse; it is made of stone.")
; events
(
(0 Interior_profile_relation (4 4)
	(
		(Ground (5 5) ())
		(Figure (2 3) (1))
	)
)
(1 Buildings (3 3)
	(
		(Building (3 3) ())
	)
)
(2 Proportional_quantity (10 10)
	(
		(Individuals (11 11) (7))
		(Denoted_quantity (3 3) (1))
	)
)
(3 Roadways (16 16)
	(
		(Roadway (16 16) ())
	)
)
(4 Perception_experience (9 9)
	(
		(Ground (16 16) (3))
		(Perceiver_passive (7 7) ())
		(Phenomenon (11 11) (7))
	)
)
(5 People (13 13)
	(
		(Person (13 13) ())
	)
)
(6 Possibility (8 8)
	(
		(Possible_event (11 11) (7))
		(Possible_event (7 7) ())
	)
)
(7 People_by_age (11 11)
	(
		(Person (11 11) ())
	)
)
(8 People_by_age (19 19)
	(
		(Person (19 19) ())
	)
)
(9 Motion (23 23)
	(
		(Theme (19 19) (8))
		(Goal (25 25) (11))
	)
)
(10 People (21 21)
	(
		(Person (3 3) (1))
	)
)
(11 Locale_by_use (25 25)
	(
		(Locale (25 25) ())
	)
)
(12 Calendric_unit (28 28)
	(
		(Relative_time (7 7) ())
		(Unit (19 19) (8))
	)
)
(13 Education_teaching (30 30)
	(
		(Subject (32 32) (14))
		(Student (29 29) ())
		(Time (27 28) (12))
	)
)
(14 Education_teaching (32 32)
	(
		(Student (11 11) (7))
	)
)
(15 Building (44 44)
	(
		(Created_entity (42 42) ())
		(Components (46 46) ())
	)
)
(16 Buildings (40 40)
	(
	)
)
(17 Desirability (39 39)
	(
		(Evaluee (13 13) (5))
	)
)
(18 Size (37 37)
	(
		(Entity (13 13) (5))
	)
)
)
)
(
; story sentence text for lookup
("I needed a to write a song." "I had nothing to write with." "I looked in my desk for a pen." "I only saw a pen cap." "I threw the pen cap away.")
; events
(
(0 Needing (1 1)
	(
		(Cognizer (0 0) ())
		(Cognizer (2 2) ())
		(Dependent (6 6) (2))
	)
)
(1 Text_creation (4 4)
	(
		(Text (6 6) (2))
		(Author (2 2) ())
	)
)
(2 Text (6 6)
	(
		(Text (6 6) ())
	)
)
(3 Possession (9 9)
	(
		(Owner (0 0) ())
		(Possession (10 10) ())
	)
)
(4 Text_creation (12 12)
	(
		(Author (0 0) ())
		(Medium (13 13) ())
	)
)
(5 Scrutiny (16 16)
	(
		(Cognizer (0 0) ())
		(Phenomenon (22 22) ())
		(Ground (19 19) ())
	)
)
(6 Perception_experience (26 26)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (29 29) (7))
	)
)
(7 Accoutrements (29 29)
	(
		(Accoutrement (13 13) ())
		(Use (28 28) ())
	)
)
(8 Cause_motion (32 32)
	(
		(Agent (0 0) ())
		(Source (13 13) ())
		(Theme (19 19) ())
	)
)
(9 Accoutrements (35 35)
	(
		(Accoutrement (28 28) ())
		(Use (34 34) ())
	)
)
)
)
(
; story sentence text for lookup
("Mother gave them to me." "She gave them to me this morning." "My father gave me two red ones." "I will keep the red flower." "I will give all my yellow flowers to Lucy." "She will like them." "She will take them home with her.")
; events
(
(0 Kinship (0 0)
	(
		(Alter (0 0) ())
	)
)
(1 Giving (1 1)
	(
		(Donor (0 0) (0))
		(Theme (2 2) ())
		(Recipient (4 4) ())
	)
)
(2 Giving (7 7)
	(
		(Donor (0 0) (0))
		(Theme (2 2) ())
		(Recipient (4 4) ())
		(Time (11 12) (3))
	)
)
(3 Calendric_unit (12 12)
	(
		(Relative_time (11 11) ())
		(Unit (12 12) ())
	)
)
(4 Color (19 19)
	(
		(Color (11 11) ())
		(Entity (12 12) (3))
	)
)
(5 Kinship (15 15)
	(
		(Ego (0 0) (0))
		(Alter (15 15) ())
	)
)
(6 Cardinal_numbers (18 18)
	(
		(Entity (11 12) (3))
		(Number (18 18) ())
	)
)
(7 Retaining (24 24)
	(
		(Agent (0 0) (0))
		(Theme (27 27) ())
	)
)
(8 Color (26 26)
	(
		(Entity (11 11) ())
		(Color (18 18) (6))
	)
)
(9 Giving (31 31)
	(
		(Donor (0 0) (0))
		(Recipient (37 37) ())
		(Theme (35 35) ())
	)
)
(10 Color (34 34)
	(
		(Color (11 11) ())
		(Entity (12 12) (3))
	)
)
(11 Experiencer_focus (41 41)
	(
		(Experiencer (0 0) (0))
		(Content (42 42) ())
	)
)
(12 Bringing (46 46)
	(
		(Agent (0 0) (0))
		(Goal (18 18) (6))
		(Constant_location (11 12) (3))
		(Theme (42 42) ())
	)
)
)
)
(
; story sentence text for lookup
("Tina was on her way to bed." "She had a late night." "She slept for eight hours." "When she woke up it was ten." "She was two hours late for school.")
; events
(
(0 Building_subparts (6 6)
	(
	)
)
(1 Calendric_unit (12 12)
	(
		(Unit (12 12) ())
		(Relative_time (11 11) (2))
	)
)
(2 Desirability (11 11)
	(
		(Evaluee (12 12) (1))
	)
)
(3 Sleep (15 15)
	(
		(Sleeper (14 14) ())
		(Duration (18 18) (5))
	)
)
(4 Cardinal_numbers (17 17)
	(
		(Unit (12 12) (1))
		(Number (11 11) (2))
	)
)
(5 Calendric_unit (18 18)
	(
		(Unit (12 12) (1))
		(Count (11 11) (2))
	)
)
(6 Temporal_collocation (20 20)
	(
		(Landmark_event (21 21) ())
		(Landmark_period (24 24) ())
	)
)
(7 Waking_up (22 23)
	(
		(Sleeper (21 21) ())
	)
)
(8 Relative_time (32 32)
	(
		(Interval (30 31) ())
		(Focal_participant (14 14) ())
		(Landmark_occasion (34 34) (9))
	)
)
(9 Locale_by_use (34 34)
	(
		(Locale (34 34) ())
	)
)
)
)
(
; story sentence text for lookup
("This is a fine day." "The sun shines bright." "There is a good wind, and my kite flies high." "I can just see it." "The sun shines in my eyes; I will stand in the shade of this high fence." "Why, here comes my dog!" "He was under the cart." "Did you see him there?" "What a good time we have had!" "Are you not glad that we did not go to the woods with John?")
; events
(
(0 Calendric_unit (4 4)
	(
		(Unit (4 4) ())
	)
)
(1 Desirability (3 3)
	(
		(Evaluee (4 4) (0))
	)
)
(2 Location_of_light (8 8)
	(
		(Manner (9 9) ())
		(Figure (7 7) (3))
	)
)
(3 Location_of_light (7 7)
	(
		(Figure (7 7) ())
	)
)
(4 Self_motion (20 20)
	(
		(Depictive (21 21) ())
		(Self_mover (19 19) ())
	)
)
(5 Desirability (14 14)
	(
		(Evaluee (4 4) (0))
	)
)
(6 Existence (11 12)
	(
		(Entity (13 15) (5))
	)
)
(7 Perception_experience (26 26)
	(
		(Perceiver_passive (23 23) ())
		(Phenomenon (4 4) (0))
	)
)
(8 Body_parts (34 34)
	(
		(Possessor (4 4) (0))
		(Body_part (34 34) ())
	)
)
(9 Measurable_attributes (44 44)
	(
		(Entity (45 45) ())
	)
)
(10 Posture (38 38)
	(
		(Agent (36 36) ())
		(Location (41 41) (13))
	)
)
(11 Light_movement (31 31)
	(
		(Goal (34 34) (8))
		(Beam (7 7) (3))
	)
)
(12 Location_of_light (30 30)
	(
		(Figure (7 7) (3))
	)
)
(13 Level_of_light (41 41)
	(
		(Location (45 45) ())
	)
)
(14 Non-gradable_proximity (56 56)
	(
		(Figure (23 23) ())
		(Ground (58 58) (15))
	)
)
(15 Containers (58 58)
	(
		(Container (4 4) (0))
	)
)
(16 Perception_experience (62 62)
	(
		(Perceiver_passive (7 7) (3))
		(State (4 4) (0))
		(Phenomenon (9 9) ())
	)
)
(17 Desirability (68 68)
	(
		(Evaluee (9 9) ())
	)
)
(18 Have_associated (72 72)
	(
		(Entity (69 69) ())
		(Entity (4 4) (0))
	)
)
(19 Motion (82 82)
	(
		(Theme (34 34) (8))
		(Goal (85 85) (20))
		(Depictive (87 87) ())
	)
)
(20 Biological_area (85 85)
	(
		(Locale (85 85) ())
	)
)
(21 Emotions_by_stimulus (77 77)
	(
		(Experiencer (7 7) (3))
		(Stimulus (79 79) ())
	)
)
)
)
(
; story sentence text for lookup
("I see a nest." "Little birds are in it." "The little birds can not fly." "They are not pretty." "They will get pretty by and by." "The big bird is not here now." "She is high in the apple tree." "She will come to them by and by." "She will come and feed them.")
; events
(
(0 Perception_experience (1 1)
	(
		(Phenomenon (3 3) ())
		(Perceiver_passive (0 0) ())
	)
)
(1 Size (5 5)
	(
		(Entity (6 6) ())
	)
)
(2 Interior_profile_relation (8 8)
	(
		(Figure (6 6) ())
		(Ground (9 9) ())
	)
)
(3 Capability (14 14)
	(
		(Entity (13 13) ())
		(Event (15 16) (4))
	)
)
(4 Self_motion (16 16)
	(
		(Self_mover (13 13) ())
	)
)
(5 Aesthetics (21 21)
	(
		(Entity (0 0) ())
	)
)
(6 Transition_to_state (25 25)
	(
		(Entity (0 0) ())
		(Transitional_period (27 29) ())
		(Final_quality (26 26) ())
	)
)
(7 Size (32 32)
	(
		(Entity (33 33) ())
	)
)
(8 Temporal_collocation (37 37)
	(
		(Trajector_event (33 33) ())
	)
)
(9 Locative_relation (36 36)
	(
		(Figure (13 13) ())
	)
)
(10 Measurable_attributes (41 41)
	(
		(Entity (0 0) ())
		(Degree (33 33) ())
		(Circumstances (45 45) ())
	)
)
(11 Arriving (49 49)
	(
		(Theme (0 0) ())
		(Goal (51 51) ())
		(Manner (52 54) ())
	)
)
(12 Arriving (58 58)
	(
		(Theme (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The man put on his jacket." "He soon became too hot." "He took his jacket off." "He became cold again." "He put on a coat that was not as warm.")
; events
(
(0 Dressing (2 3)
	(
		(Clothing (5 5) (1))
		(Wearer (1 1) (2))
	)
)
(1 Clothing (5 5)
	(
		(Garment (5 5) ())
		(Wearer (4 4) ())
	)
)
(2 People (1 1)
	(
		(Person (1 1) ())
	)
)
(3 Becoming (9 9)
	(
		(Entity (7 7) ())
		(Time (1 1) (2))
		(Final_quality (10 11) (4))
	)
)
(4 Temperature (11 11)
	(
		(Entity (7 7) ())
		(Degree (10 10) ())
	)
)
(5 Undressing (14 17)
	(
		(Wearer (7 7) ())
		(Clothing (16 16) ())
	)
)
(6 Ambient_temperature (21 21)
	(
		(Circumstances (7 7) ())
	)
)
(7 Becoming (20 20)
	(
		(Entity (7 7) ())
		(Final_quality (21 21) (6))
		(Explanation (10 10) ())
	)
)
(8 Dressing (25 26)
	(
		(Wearer (7 7) ())
		(Clothing (28 28) (10))
	)
)
(9 Temperature (33 33)
	(
		(Entity (5 5) (1))
		(Entity (10 11) (4))
	)
)
(10 Clothing (28 28)
	(
		(Garment (4 4) ())
	)
)
)
)
(
; story sentence text for lookup
("Billy liked this girl." "The girl sat in front of him." "He played with her hair." "She told him to stop." "He stopped it.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (3 3) (1))
	)
)
(1 People (3 3)
	(
		(Person (3 3) ())
	)
)
(2 Posture (7 7)
	(
		(Point_of_contact (7 7) ())
		(Location (9 9) ())
		(Agent (6 6) (3))
	)
)
(3 People (6 6)
	(
		(Person (6 6) ())
	)
)
(4 Non-gradable_proximity (8 10)
	(
		(Ground (11 11) ())
		(Figure (6 6) (3))
	)
)
(5 Body_parts (17 17)
	(
		(Body_part (17 17) ())
		(Possessor (3 3) (1))
	)
)
(6 Request (20 20)
	(
		(Speaker (0 0) ())
		(Addressee (7 7) (2))
		(Message (22 23) (7))
	)
)
(7 Halt (23 23)
	(
		(Theme (7 7) (2))
	)
)
(8 Activity_stop (26 26)
	(
		(Agent (0 0) ())
		(Activity (7 7) (2))
	)
)
)
)
(
; story sentence text for lookup
("Gary went to the pond." "He cast his rod in it." "He caught a fish." "He pulled it up." "It was actually a boot.")
; events
(
(0 Natural_features (4 4)
	(
		(Locale (4 4) ())
	)
)
(1 Motion (1 1)
	(
		(Theme (0 0) ())
		(Goal (4 4) (0))
	)
)
(2 Cause_motion (7 7)
	(
		(Theme (9 9) ())
		(Agent (0 0) ())
		(Goal (11 11) ())
	)
)
(3 Cause_to_make_noise (14 14)
	(
		(Purpose (9 9) ())
		(Agent (0 0) ())
	)
)
(4 Food (16 16)
	(
	)
)
)
)
(
; story sentence text for lookup
("Here is Jean with her hoop." "Jean can roll the hoop very fast." "The hoop has bells on it." "The bells tinkle, tinkle, tinkle.")
; events
(
(0 Spatial_co-location (0 0)
	(
		(Figure (2 2) ())
	)
)
(1 Connectors (5 5)
	(
		(Connector (5 5) ())
		(Connected_item (4 4) ())
	)
)
(2 Cause_impact (9 9)
	(
		(Agent (7 7) ())
		(Impactor (11 11) (4))
		(Manner (12 13) (5))
	)
)
(3 Capability (8 8)
	(
		(Entity (7 7) ())
		(Event (11 11) (4))
	)
)
(4 Accoutrements (11 11)
	(
		(Accoutrement (4 4) ())
	)
)
(5 Rate_description (13 13)
	(
		(Degree (5 5) (1))
		(Event (11 11) (4))
	)
)
(6 Noise_makers (18 18)
	(
		(Noise_maker (18 18) ())
	)
)
(7 Noise_makers (23 23)
	(
		(Noise_maker (23 23) ())
	)
)
(8 Sounds (26 26)
	(
		(Sound_source (23 23) (7))
	)
)
(9 Make_noise (24 24)
	(
		(Sound_source (23 23) (7))
		(Sound (24 24) ())
	)
)
(10 Sounds (28 28)
	(
		(Sound_source (23 23) (7))
	)
)
)
)
(
; story sentence text for lookup
("Bob wanted to buy a new book." "He didn't have the money." "Bob found a ten dollar bill on the ground." "He picked it up." "He used the money to buy the book.")
; events
(
(0 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (6 6) (2))
	)
)
(1 Age (5 5)
	(
		(Entity (6 6) (2))
	)
)
(2 Text (6 6)
	(
		(Text (6 6) ())
	)
)
(3 Commerce_buy (3 3)
	(
		(Buyer (0 0) ())
		(Goods (6 6) (2))
	)
)
(4 Possession (11 11)
	(
		(Owner (0 0) ())
		(Possession (13 13) (6))
	)
)
(5 Negation (10 10)
	(
		(Negated_proposition (13 13) (6))
		(Negated_proposition (8 8) ())
	)
)
(6 Money (13 13)
	(
		(Money (13 13) ())
	)
)
(7 Natural_features (23 23)
	(
		(Locale (23 23) ())
	)
)
(8 Locating (16 16)
	(
		(Perceiver (0 0) ())
		(Ground (23 23) (7))
		(Sought_entity (20 20) (9))
	)
)
(9 Containers (20 20)
	(
		(Container (13 13) (6))
		(Type (18 19) ())
	)
)
(10 Frugality (31 31)
	(
		(Resource (33 33) (12))
		(Resource_controller (0 0) ())
		(Behavior (37 37) (13))
	)
)
(11 Commerce_buy (35 35)
	(
		(Buyer (0 0) ())
		(Goods (37 37) (13))
	)
)
(12 Money (33 33)
	(
		(Money (33 33) ())
	)
)
(13 Text (37 37)
	(
		(Text (37 37) ())
	)
)
)
)
(
; story sentence text for lookup
("Where do you think we are going?" "We are going to the woods." "Father and Mother are going with us." "It is the autumn time now." "The nuts are ripe in the woods." "We shall get many nuts." "We have two big bags under the seat." "John likes to hold the horse." "Stand still, Billy!" "Good horse!" "Father and Mother will soon be here.")
; events
(
(0 Awareness (3 3)
	(
		(Content (0 0) ())
		(Cognizer (2 2) ())
		(Content (4 4) ())
	)
)
(1 Motion (10 10)
	(
		(Theme (0 0) ())
		(Goal (13 13) ())
	)
)
(2 Kinship (15 15)
	(
		(Alter (0 0) ())
	)
)
(3 Kinship (17 17)
	(
		(Alter (2 2) ())
	)
)
(4 Motion (19 19)
	(
		(Goal (21 21) ())
		(Theme (15 15) (2))
	)
)
(5 Temporal_collocation (28 28)
	(
		(Landmark_period (28 28) ())
		(Trajector_event (23 23) ())
	)
)
(6 Food (31 31)
	(
	)
)
(7 Biological_area (36 36)
	(
		(Locale (36 36) ())
	)
)
(8 Desirability (33 33)
	(
		(Evaluee (31 31) (6))
		(Circumstances (4 4) ())
	)
)
(9 Food (42 42)
	(
	)
)
(10 Getting (40 40)
	(
		(Recipient (0 0) ())
		(Theme (42 42) (9))
	)
)
(11 Quantified_mass (41 41)
	(
		(Mass (42 42) (9))
		(Quantity (41 41) ())
	)
)
(12 Cardinal_numbers (46 46)
	(
		(Number (2 2) ())
		(Entity (42 42) (9))
	)
)
(13 Possession (45 45)
	(
		(Owner (0 0) ())
		(Possession (48 48) (14))
	)
)
(14 Containers (48 48)
	(
		(Container (42 42) (9))
	)
)
(15 Size (47 47)
	(
		(Entity (42 42) (9))
	)
)
(16 Experiencer_focus (54 54)
	(
		(Experiencer (0 0) ())
		(Content (58 58) ())
	)
)
(17 Manipulation (56 56)
	(
		(Agent (0 0) ())
		(Entity (58 58) ())
	)
)
(18 Change_posture (60 60)
	(
		(Result (61 61) ())
		(Protagonist (41 41) (11))
	)
)
(19 Desirability (65 65)
	(
		(Evaluee (61 61) ())
	)
)
(20 Kinship (68 68)
	(
		(Alter (0 0) ())
	)
)
(21 Kinship (70 70)
	(
		(Alter (2 2) ())
	)
)
(22 Locative_relation (74 74)
	(
		(Figure (15 15) (2))
		(Time (42 42) (9))
		(Ground (36 36) (7))
	)
)
)
)
(
; story sentence text for lookup
("An old hen sat on eight eggs." "Soon she had in her nest six little chickens and two ducks." "Every day the hen took them into the yard." "She was very proud of them." "She scratched the ground and found worms for them to eat." "Every night she took them back to the nest.They slept all night under her wings.")
; events
(
(0 Age (1 1)
	(
		(Entity (2 2) ())
	)
)
(1 Cardinal_numbers (5 5)
	(
		(Entity (6 6) (3))
		(Number (5 5) ())
	)
)
(2 Posture (3 3)
	(
		(Agent (2 2) ())
		(Location (6 6) (3))
	)
)
(3 Food (6 6)
	(
	)
)
(4 Cardinal_numbers (18 18)
	(
		(Number (18 18) ())
		(Entity (19 19) ())
	)
)
(5 Interior_profile_relation (11 11)
	(
		(Ground (13 13) ())
		(Figure (9 9) ())
		(Figure (16 16) ())
	)
)
(6 Possession (10 10)
	(
		(Owner (9 9) ())
		(Explanation (13 13) ())
		(Possession (16 16) ())
	)
)
(7 Locale_by_use (29 29)
	(
		(Locale (29 29) ())
	)
)
(8 Frequency (21 21)
	(
		(Attribute (21 21) ())
		(Event (24 24) ())
		(Time_span (9 9) ())
	)
)
(9 Calendric_unit (22 22)
	(
		(Count (21 21) (8))
		(Unit (9 9) ())
	)
)
(10 Bringing (25 25)
	(
		(Agent (24 24) ())
		(Goal (29 29) (7))
		(Theme (5 5) (1))
	)
)
(11 Emotion_directed (34 34)
	(
		(Stimulus (13 13) ())
		(Experiencer (21 21) (8))
		(Degree (2 2) ())
	)
)
(12 Manipulation (39 39)
	(
		(Agent (21 21) (8))
		(Locus (24 24) ())
	)
)
(13 Ingestion (48 48)
	(
		(Ingestor (29 29) (7))
	)
)
(14 Natural_features (41 41)
	(
		(Locale (41 41) ())
	)
)
(15 Becoming_aware (43 43)
	(
		(Cognizer (21 21) (8))
		(Phenomenon (6 6) (3))
		(Purpose (46 46) ())
	)
)
(16 Calendric_unit (51 51)
	(
		(Unit (21 21) (8))
		(Unit (9 9) ())
	)
)
(17 Bringing (53 53)
	(
		(Goal (5 5) (1))
		(Goal (29 29) (7))
		(Agent (2 2) ())
		(Theme (54 54) ())
	)
)
(18 Body_parts (66 66)
	(
		(Body_part (66 66) ())
		(Possessor (65 65) ())
	)
)
(19 Sleep (61 61)
	(
		(Sleeper (18 18) (4))
		(Place (66 66) (18))
		(Duration (62 63) (21))
	)
)
(20 Frequency (50 50)
	(
		(Event (24 24) ())
		(Time_span (9 9) ())
	)
)
(21 Calendric_unit (63 63)
	(
		(Unit (63 63) ())
	)
)
)
)
(
; story sentence text for lookup
("My brother had a goldfish." "The fish let him pet it." "He put his finger in the water." "The fish swam up to him." "And he pet the fish.")
; events
(
(0 Kinship (1 1)
	(
		(Ego (0 0) ())
		(Alter (1 1) ())
	)
)
(1 Placing (14 14)
	(
		(Theme (16 16) (2))
		(Agent (0 0) ())
		(Goal (19 19) ())
	)
)
(2 Body_parts (16 16)
	(
		(Possessor (15 15) ())
		(Body_part (16 16) ())
	)
)
(3 Self_motion (23 23)
	(
		(Goal (26 26) ())
		(Self_mover (22 22) ())
	)
)
(4 Manipulation (30 30)
	(
		(Agent (1 1) (0))
		(Entity (32 32) (5))
	)
)
(5 Food (32 32)
	(
	)
)
)
)
(
; story sentence text for lookup
("It didn't matter what he said." "She wasn't going to listen." "She covered her ears with her hands." "She made a loud noise." "He gave up trying to talk.")
; events
(
(0 Statement (6 6)
	(
		(Speaker (5 5) ())
		(Message (4 4) ())
	)
)
(1 Perception_active (13 13)
	(
		(Perceiver_agentive (8 8) ())
	)
)
(2 Placing (16 16)
	(
		(Agent (8 8) ())
		(Theme (21 21) (4))
		(Theme (18 18) (3))
	)
)
(3 Body_parts (18 18)
	(
		(Possessor (17 17) ())
		(Body_part (18 18) ())
	)
)
(4 Body_parts (21 21)
	(
		(Body_part (21 21) ())
		(Possessor (5 5) ())
	)
)
(5 Sensation (27 27)
	(
		(Source (8 8) ())
		(Descriptor (18 18) (3))
	)
)
(6 Creating (24 24)
	(
		(Creator (8 8) ())
		(Created_entity (27 27) (5))
	)
)
(7 Sound_level (26 26)
	(
		(Entity (4 4) ())
	)
)
(8 Chatting (34 34)
	(
		(Interlocutor_1 (8 8) ())
	)
)
(9 Attempt (32 32)
	(
		(Goal (33 34) (8))
		(Agent (8 8) ())
	)
)
)
)
(
; story sentence text for lookup
("Kate has left her doll in its little bed, and has gone to play with Mary and James." "They are all in the shade, now, by the brook." "James digs in the soft sand with his spade, and Mary picks up little stones and puts them in her lap." "James and Mary are glad to see Kate." "She will help them pick up stones and dig, by the little brook.")
; events
(
(0 Competition (14 14)
	(
		(Participant_1 (0 0) ())
		(Participants (16 16) ())
	)
)
(1 Building_subparts (8 8)
	(
	)
)
(2 Abandonment (2 2)
	(
		(Agent (0 0) ())
		(Place (8 8) (1))
		(Theme (4 4) (4))
	)
)
(3 Interior_profile_relation (5 5)
	(
		(Ground (8 8) (1))
		(Figure (4 4) (4))
	)
)
(4 Accoutrements (4 4)
	(
		(Accoutrement (4 4) ())
		(Wearer (3 3) ())
	)
)
(5 Motion (12 12)
	(
		(Theme (0 0) ())
		(Goal (16 16) ())
	)
)
(6 Natural_features (31 31)
	(
		(Locale (31 31) ())
	)
)
(7 Temporal_collocation (27 27)
	(
		(Trajector_event (31 31) (6))
		(Trajector_event (20 20) ())
	)
)
(8 Being_wet (37 37)
	(
		(Item (38 38) (10))
	)
)
(9 Body_parts (54 54)
	(
		(Body_part (54 54) ())
		(Possessor (53 53) ())
	)
)
(10 Food (38 38)
	(
		(Descriptor (4 4) (4))
		(Food (38 38) ())
	)
)
(11 Placing (50 50)
	(
		(Theme (51 51) ())
		(Agent (31 31) (6))
		(Goal (54 54) (9))
	)
)
(12 Seeking (34 34)
	(
		(Cognizer_agent (0 0) ())
		(Ground (38 38) (10))
		(Ground (8 8) (1))
	)
)
(13 Substance (48 48)
	(
	)
)
(14 Size (47 47)
	(
		(Entity (48 48) (13))
	)
)
(15 Food_gathering (45 46)
	(
		(Gatherer (31 31) (6))
		(Crop (48 48) (13))
	)
)
(16 Emotions_by_stimulus (60 60)
	(
		(Experiencer (56 56) ())
		(Stimulus (63 63) ())
	)
)
(17 Perception_experience (62 62)
	(
		(Perceiver_passive (56 56) ())
		(Phenomenon (63 63) ())
	)
)
(18 Cause_to_make_noise (73 73)
	(
		(Place (78 78) (21))
		(Agent (3 3) ())
	)
)
(19 Assistance (67 67)
	(
		(Helper (0 0) ())
		(Goal (71 71) (22))
		(Benefited_party (3 3) ())
	)
)
(20 Food_gathering (69 70)
	(
		(Crop (71 71) (22))
		(Gatherer (3 3) ())
	)
)
(21 Natural_features (78 78)
	(
		(Locale (78 78) ())
	)
)
(22 Substance (71 71)
	(
		(Substance (71 71) ())
	)
)
)
)
(
; story sentence text for lookup
("Fred liked Susie." "He really wanted to ask her to the ball." "But he was nervous." "She said yes however." "So fred was very happy.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (2 2) ())
	)
)
(1 Social_event (12 12)
	(
		(Social_event (12 12) ())
	)
)
(2 Desiring (6 6)
	(
		(Experiencer (0 0) ())
		(Degree (5 5) ())
		(Event (9 9) ())
	)
)
(3 Request (8 8)
	(
		(Speaker (0 0) ())
		(Message (12 12) (1))
		(Addressee (9 9) ())
	)
)
(4 Experiencer_focus (17 17)
	(
		(Experiencer (5 5) ())
	)
)
(5 Statement (20 20)
	(
		(Speaker (0 0) ())
		(Message (2 2) ())
		(Message (22 22) ())
	)
)
(6 Emotion_directed (28 28)
	(
		(Experiencer (5 5) ())
		(Degree (22 22) ())
	)
)
)
)
(
; story sentence text for lookup
("The man told a story." "The boy liked it." "The boy asked to hear it again." "The man refused." "The boy tried to read the story by himself.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Experiencer_focus (8 8)
	(
		(Content (9 9) ())
		(Experiencer (7 7) (2))
	)
)
(2 People_by_age (7 7)
	(
		(Person (1 1) (0))
	)
)
(3 Request (13 13)
	(
		(Message (16 16) ())
		(Speaker (7 7) (2))
	)
)
(4 People_by_age (12 12)
	(
		(Person (1 1) (0))
	)
)
(5 Perception_experience (15 15)
	(
		(Phenomenon (16 16) ())
		(Perceiver_passive (7 7) (2))
	)
)
(6 Agree_or_refuse_to_act (21 21)
	(
		(Speaker (7 7) (2))
	)
)
(7 People (20 20)
	(
		(Person (1 1) (0))
	)
)
(8 Attempt (25 25)
	(
		(Goal (29 29) ())
		(Agent (7 7) (2))
	)
)
(9 People_by_age (24 24)
	(
		(Person (1 1) (0))
	)
)
(10 Reading_activity (27 27)
	(
		(Text (29 29) ())
		(Manner (31 31) ())
		(Reader (7 7) (2))
	)
)
)
)
(
; story sentence text for lookup
("I went to the store yesterday." "I saw some almonds." "They were so good." "I ate the whole can." "Then I was very full.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Motion (1 1)
	(
		(Theme (0 0) ())
		(Time (5 5) (0))
		(Goal (4 4) (2))
	)
)
(2 Businesses (4 4)
	(
		(Business (4 4) ())
	)
)
(3 Proportional_quantity (9 9)
	(
		(Denoted_quantity (9 9) ())
		(Mass (10 10) (5))
	)
)
(4 Perception_experience (8 8)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (10 10) (5))
	)
)
(5 Food (10 10)
	(
		(Descriptor (9 9) (3))
	)
)
(6 Desirability (15 15)
	(
		(Evaluee (0 0) ())
		(Degree (9 9) (3))
	)
)
(7 Ingestion (18 18)
	(
		(Ingestor (0 0) ())
		(Ingestibles (4 4) (2))
	)
)
(8 Ranked_expectation (20 20)
	(
		(Entity (4 4) (2))
	)
)
(9 Containers (21 21)
	(
		(Container (4 4) (2))
	)
)
(10 Temporal_collocation (23 23)
	(
		(Trajector_event (24 24) ())
	)
)
(11 Biological_urge (27 27)
	(
		(Experiencer (24 24) ())
		(Degree (10 10) (5))
	)
)
)
)
(
; story sentence text for lookup
("Kevin needed some bananas." "He went too the store." "Got some bananas." "He took them home." "Enjoyed himself one.")
; events
(
(0 Proportional_quantity (2 2)
	(
		(Denoted_quantity (2 2) ())
		(Mass (3 3) (2))
	)
)
(1 Needing (1 1)
	(
		(Cognizer (0 0) ())
		(Requirement (3 3) (2))
	)
)
(2 Food (3 3)
	(
	)
)
(3 Motion (6 6)
	(
		(Theme (0 0) ())
		(Goal (7 10) (4))
	)
)
(4 Businesses (9 9)
	(
		(Business (9 9) ())
	)
)
(5 Food (13 13)
	(
	)
)
(6 Have_associated (11 11)
	(
		(Entity (13 13) (5))
	)
)
(7 Proportional_quantity (12 12)
	(
		(Mass (2 2) (0))
		(Denoted_quantity (12 12) ())
	)
)
(8 Bringing (16 16)
	(
		(Agent (0 0) ())
		(Theme (2 2) (0))
		(Goal (3 3) (2))
	)
)
(9 Remembering_experience (20 20)
	(
		(Experience (12 12) (7))
		(Manner (2 2) (0))
	)
)
)
)
(
; story sentence text for lookup
("Clare found the letter." "She opened it up." "Inside was a small note." "She threw the note away." "She kept the envelope to use.")
; events
(
(0 Locating (1 1)
	(
		(Perceiver (0 0) ())
		(Sought_entity (3 3) (1))
	)
)
(1 Text (3 3)
	(
		(Text (3 3) ())
	)
)
(2 Part_inner_outer (10 10)
	(
		(Part (3 3) (1))
	)
)
(3 Cause_motion (17 17)
	(
		(Source (20 20) ())
		(Agent (0 0) ())
		(Theme (19 19) ())
	)
)
(4 Storing (23 23)
	(
		(Agent (0 0) ())
		(Theme (19 19) ())
		(Purpose (26 27) (6))
	)
)
(5 Containers (25 25)
	(
		(Container (3 3) (1))
	)
)
(6 Using (27 27)
	(
	)
)
)
)
(
; story sentence text for lookup
("A man wanted a new car color." "He asked his friends what color." "They said blue." "He took it to the shop." "It got painted blue.")
; events
(
(0 Vehicle (5 5)
	(
		(Vehicle (5 5) ())
		(Descriptor (4 4) (4))
	)
)
(1 Desiring (2 2)
	(
		(Focal_participant (6 6) (2))
		(Experiencer (1 1) (3))
	)
)
(2 Color (6 6)
	(
		(Entity (5 5) (0))
		(Descriptor (4 4) (4))
	)
)
(3 People (1 1)
	(
		(Person (1 1) ())
	)
)
(4 Age (4 4)
	(
		(Entity (6 6) (2))
	)
)
(5 Questioning (9 9)
	(
		(Addressee (11 11) (7))
		(Speaker (8 8) ())
		(Message (12 13) (6))
	)
)
(6 Color (13 13)
	(
		(Color (5 5) (0))
	)
)
(7 Personal_relationship (11 11)
	(
		(Partner_2 (10 10) ())
		(Partner_1 (11 11) ())
	)
)
(8 Text_creation (16 16)
	(
		(Author (8 8) ())
		(Depictive (10 10) ())
	)
)
(9 Bringing (20 20)
	(
		(Agent (8 8) ())
		(Theme (10 10) ())
		(Goal (24 24) (10))
	)
)
(10 Businesses (24 24)
	(
		(Business (5 5) (0))
	)
)
(11 Abounding_with (28 28)
	(
		(Location (8 8) ())
		(Depictive (11 11) (7))
	)
)
(12 Color_qualities (29 29)
	(
		(Described_entity (8 8) ())
	)
)
)
)
(
; story sentence text for lookup
("Here are two dogs." "One dog is black." "One dog is white." "A dog runs." "The dogs run." "Run, dogs, run." "One dog and one dog are two dogs.")
; events
(
(0 Spatial_co-location (0 0)
	(
		(Figure (3 3) ())
	)
)
(1 Cardinal_numbers (2 2)
	(
		(Number (2 2) ())
		(Entity (3 3) ())
	)
)
(2 Color (8 8)
	(
		(Color (3 3) ())
		(Entity (6 6) ())
	)
)
(3 Color (13 13)
	(
		(Color (3 3) ())
		(Entity (6 6) ())
	)
)
(4 Self_motion (17 17)
	(
		(Self_mover (6 6) ())
	)
)
(5 Self_motion (21 21)
	(
		(Self_mover (6 6) ())
	)
)
(6 Self_motion (23 23)
	(
		(Self_mover (2 2) (1))
	)
)
(7 Fleeing (27 27)
	(
		(Self_mover (2 2) (1))
	)
)
(8 Cardinal_numbers (29 29)
	(
		(Number (29 29) ())
		(Entity (30 30) ())
	)
)
(9 Animals (33 33)
	(
	)
)
(10 Cardinal_numbers (32 32)
	(
		(Entity (33 33) (9))
		(Number (3 3) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom was tired of work." "He decided to go on vacation." "Tom was having a great time." "He didn't want it to end." "He extended it by days.")
; events
(
(0 Biological_urge (2 2)
	(
		(Experiencer (0 0) ())
		(Explanation (4 4) (1))
	)
)
(1 Work (4 4)
	(
		(Agent (0 0) ())
	)
)
(2 Deciding (7 7)
	(
		(Cognizer (0 0) ())
		(Decision (11 11) ())
	)
)
(3 Motion (9 9)
	(
		(Goal (11 11) ())
		(Theme (0 0) ())
	)
)
(4 Have_associated (15 15)
	(
		(Topical_entity (0 0) ())
		(Entity (18 18) ())
	)
)
(5 Desirability (17 17)
	(
		(Evaluee (18 18) ())
	)
)
(6 Process_end (26 26)
	(
		(Process (24 24) ())
	)
)
(7 Desiring (23 23)
	(
		(Experiencer (0 0) ())
		(Event (25 26) (6))
		(Event (24 24) ())
	)
)
(8 Cause_expansion (29 29)
	(
		(Size_change (4 4) (1))
		(Agent (0 0) ())
		(Item (30 30) ())
	)
)
(9 Measure_duration (32 32)
	(
		(Unit (24 24) ())
	)
)
)
)
(
; story sentence text for lookup
("Judy is driving home." "She hits a rabbit on the road." "She gets out to check on it." "The rabbit is dead." "Judy drives home.")
; events
(
(0 Operate_vehicle (2 2)
	(
		(Goal (3 3) ())
		(Driver (0 0) ())
	)
)
(1 Cause_impact (6 6)
	(
		(Agent (0 0) ())
		(Place (11 11) (2))
		(Impactee (8 8) ())
	)
)
(2 Event_instance (11 11)
	(
		(Event (11 11) ())
	)
)
(3 Inspecting (17 17)
	(
		(Inspector (0 0) ())
		(Ground (19 19) ())
	)
)
(4 Dead_or_alive (24 24)
	(
		(Protagonist (22 22) ())
	)
)
(5 Operate_vehicle (27 27)
	(
		(Goal (28 28) ())
		(Driver (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("A little boy went to a shoe store." "He wanted to buy his mom shoes." "He didn't have enough money." "A man paid for him." "The boy was so happy!")
; events
(
(0 Businesses (7 7)
	(
		(Business (7 7) ())
		(Product (6 6) ())
	)
)
(1 People_by_age (2 2)
	(
		(Person (2 2) ())
		(Descriptor (1 1) (2))
	)
)
(2 Size (1 1)
	(
		(Entity (2 2) (1))
	)
)
(3 Motion (3 3)
	(
		(Goal (7 7) (0))
		(Theme (2 2) (1))
	)
)
(4 Desiring (10 10)
	(
		(Experiencer (9 9) ())
		(Event (15 15) (6))
	)
)
(5 Kinship (14 14)
	(
		(Alter (14 14) ())
		(Ego (13 13) ())
	)
)
(6 Clothing (15 15)
	(
		(Style (14 14) (5))
		(Wearer (13 13) ())
		(Garment (6 6) ())
	)
)
(7 Commerce_buy (12 12)
	(
		(Buyer (9 9) ())
		(Goods (15 15) (6))
	)
)
(8 Sufficiency (21 21)
	(
		(Item (14 14) (5))
	)
)
(9 Possession (20 20)
	(
		(Owner (9 9) ())
		(Possession (22 22) (11))
	)
)
(10 Negation (19 19)
	(
		(Negated_proposition (22 22) (11))
		(Negated_proposition (17 17) ())
	)
)
(11 Money (22 22)
	(
		(Money (14 14) (5))
		(Type (13 13) ())
	)
)
(12 Commerce_pay (26 26)
	(
		(Goods (28 28) ())
		(Buyer (17 17) ())
	)
)
(13 People (25 25)
	(
		(Person (1 1) (2))
	)
)
(14 People_by_age (31 31)
	(
		(Person (1 1) (2))
	)
)
(15 Emotion_directed (34 34)
	(
		(Degree (33 33) ())
		(Experiencer (17 17) ())
	)
)
)
)
(
; story sentence text for lookup
("The kids went out in the rain." "They become very wet." "One of the kids got too cold." "The kids went back inside." "They all dried off.")
; events
(
(0 Motion (2 2)
	(
		(Result (6 6) (2))
		(Source (3 3) ())
		(Theme (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Precipitation (6 6)
	(
		(Precipitation (6 6) ())
	)
)
(3 Becoming (9 9)
	(
		(Final_quality (10 11) (4))
		(Entity (8 8) ())
	)
)
(4 Being_wet (11 11)
	(
		(Item (8 8) ())
		(Degree (10 10) ())
	)
)
(5 Cardinal_numbers (13 13)
	(
		(Number (8 8) ())
		(Entity (16 16) (7))
	)
)
(6 Ambient_temperature (19 19)
	(
		(Circumstances (13 13) (5))
		(Degree (18 18) ())
		(Attribute (6 6) (2))
	)
)
(7 People_by_age (16 16)
	(
		(Person (3 3) ())
	)
)
(8 Motion (23 23)
	(
		(Goal (25 25) (10))
		(Goal (3 3) ())
		(Theme (1 1) (1))
	)
)
(9 People_by_age (22 22)
	(
		(Person (1 1) (1))
	)
)
(10 Interior_profile_relation (25 25)
	(
		(Direction (3 3) ())
		(Figure (1 1) (1))
	)
)
(11 Cause_to_be_dry (29 30)
	(
		(Dryee (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("Today I saw a baby bird." "The bird was in a tree." "The mother bird was teaching the baby bird." "She dropped the bird out of the nest." "The baby bird flew away.")
; events
(
(0 Calendric_unit (0 0)
	(
		(Unit (0 0) ())
	)
)
(1 Perception_experience (2 2)
	(
		(Time (0 0) (0))
		(Perceiver_passive (1 1) ())
		(Phenomenon (5 5) ())
	)
)
(2 People_by_age (4 4)
	(
		(Person (5 5) ())
	)
)
(3 Interior_profile_relation (10 10)
	(
		(Ground (12 12) ())
		(Figure (8 8) ())
	)
)
(4 Kinship (15 15)
	(
		(Alter (16 16) ())
		(Alter (1 1) ())
	)
)
(5 Education_teaching (18 18)
	(
		(Teacher (16 16) ())
		(Student (21 21) ())
	)
)
(6 People_by_age (20 20)
	(
		(Person (21 21) ())
	)
)
(7 Cause_motion (24 24)
	(
		(Agent (0 0) (0))
		(Source (30 30) ())
		(Theme (26 26) ())
	)
)
(8 Self_motion (35 35)
	(
		(Self_mover (16 16) ())
		(Source (36 36) ())
	)
)
(9 People_by_age (33 33)
	(
		(Person (16 16) ())
	)
)
)
)
(
; story sentence text for lookup
("John has two pet rabbits." "One day he drew them on his slate." "Here they are as he drew them on his slate." "He drew them on paper too." "See their big, long ears." "They have big, long ears and little, short tails." "What are the rabbits playing?" "Did you ever play seesaw?" "They are white rabbits, and they have pink eyes." "What do you think John feeds his rabbits?" "Can you draw the rabbits?")
; events
(
(0 Have_associated (1 1)
	(
		(Topical_entity (0 0) ())
		(Entity (4 4) ())
	)
)
(1 Calendric_unit (7 7)
	(
		(Count (0 0) ())
		(Unit (7 7) ())
	)
)
(2 Reshaping (9 9)
	(
		(Deformer (8 8) ())
		(Place (13 13) ())
		(Patient (10 10) ())
	)
)
(3 Spatial_co-location (15 15)
	(
		(Figure (7 7) (1))
	)
)
(4 Reshaping (20 20)
	(
		(Deformer (10 10) ())
		(Patient (21 21) ())
		(Place (24 24) ())
	)
)
(5 Create_representation (27 27)
	(
		(Creator (0 0) ())
		(Represented (8 8) ())
		(Material (30 30) ())
	)
)
(6 Perception_experience (33 33)
	(
		(Phenomenon (38 38) (8))
	)
)
(7 Size (35 35)
	(
		(Entity (38 38) (8))
	)
)
(8 Body_parts (38 38)
	(
		(Descriptor (8 8) ())
		(Possessor (7 7) (1))
		(Descriptor (10 10) ())
		(Body_part (38 38) ())
	)
)
(9 Measurable_attributes (37 37)
	(
		(Entity (38 38) (8))
	)
)
(10 Measurable_attributes (49 49)
	(
		(Entity (50 50) (15))
	)
)
(11 Measurable_attributes (44 44)
	(
		(Entity (38 38) (8))
		(Attribute (10 10) ())
	)
)
(12 Size (47 47)
	(
		(Entity (50 50) (15))
	)
)
(13 Size (42 42)
	(
		(Entity (38 38) (8))
	)
)
(14 Body_parts (45 45)
	(
		(Possessor (0 0) ())
		(Descriptor (8 8) ())
		(Body_part (38 38) (8))
		(Descriptor (10 10) ())
	)
)
(15 Body_parts (50 50)
	(
		(Possessor (0 0) ())
		(Body_part (50 50) ())
		(Descriptor (49 49) (10))
		(Descriptor (47 47) (12))
	)
)
(16 Negation (60 60)
	(
		(Negated_proposition (7 7) (1))
		(Negated_proposition (30 30) ())
	)
)
(17 Perception_experience (61 61)
	(
		(Perceiver_passive (7 7) (1))
		(Phenomenon (10 10) ())
	)
)
(18 Color (72 72)
	(
		(Color (72 72) ())
		(Entity (49 49) (10))
	)
)
(19 Color (66 66)
	(
		(Color (8 8) ())
		(Entity (67 67) ())
	)
)
(20 Body_parts (73 73)
	(
		(Possessor (21 21) ())
		(Descriptor (72 72) (18))
		(Body_part (49 49) (10))
	)
)
(21 Ingestion (80 80)
	(
		(Place (82 82) ())
		(Ingestor (10 10) ())
	)
)
(22 Opinion (78 78)
	(
		(Opinion (0 0) ())
		(Cognizer (8 8) ())
		(Opinion (79 79) ())
	)
)
(23 Capability (84 84)
	(
		(Entity (85 85) ())
	)
)
(24 Attaching (86 86)
	(
		(Agent (7 7) (1))
		(Items (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("A family really loved rainbows." "They would always look for them." "It rained one day." "They looked outside." "They saw a rainbow.")
; events
(
(0 Kinship (1 1)
	(
		(Relatives (1 1) ())
	)
)
(1 Experiencer_focus (3 3)
	(
		(Degree (2 2) ())
		(Content (4 4) ())
		(Experiencer (1 1) (0))
	)
)
(2 Frequency (8 8)
	(
		(Event (11 11) ())
		(Event (1 1) (0))
	)
)
(3 Seeking (9 9)
	(
		(Cognizer_agent (6 6) ())
		(Sought_entity (11 11) ())
	)
)
(4 Precipitation (14 14)
	(
		(Precipitation (1 1) (0))
	)
)
(5 Calendric_unit (16 16)
	(
		(Unit (16 16) ())
		(Count (2 2) ())
	)
)
(6 Locative_relation (20 20)
	(
		(Figure (6 6) ())
	)
)
(7 Perception_active (19 19)
	(
		(Perceiver_agentive (6 6) ())
		(Direction (2 2) ())
	)
)
(8 Perception_experience (23 23)
	(
		(Perceiver_passive (6 6) ())
		(Phenomenon (25 25) ())
	)
)
)
)
(
; story sentence text for lookup
("Susie loved Cheerios." "But they weren't gluten free." "So she couldn't eat them." "Then she got a gluten free box." "She loved it.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Content (2 2) (1))
		(Experiencer (0 0) ())
	)
)
(1 Food (2 2)
	(
	)
)
(2 Concessive (4 4)
	(
		(Main_assertion (5 9) (3 4 5))
	)
)
(3 Capital_stock (9 9)
	(
		(Type (5 5) ())
		(Type (8 8) (4))
	)
)
(4 Food (8 8)
	(
		(Food (5 5) ())
	)
)
(5 Negation (7 7)
	(
		(Negated_proposition (5 6) ())
		(Negated_proposition (8 9) (3 4))
	)
)
(6 Possibility (13 13)
	(
		(Possible_event (5 5) ())
		(Possible_event (8 9) (3 4))
	)
)
(7 Ingestion (15 15)
	(
		(Ingestor (5 5) ())
		(Ingestibles (16 16) ())
	)
)
(8 Have_associated (20 20)
	(
		(Topical_entity (5 5) ())
		(Entity (24 24) (9))
	)
)
(9 Containers (24 24)
	(
		(Use (8 9) (3 4))
		(Container (24 24) ())
	)
)
(10 Experiencer_focus (27 27)
	(
		(Experiencer (0 0) ())
		(Content (2 2) (1))
	)
)
)
)
(
; story sentence text for lookup
("Frank wanted to get buff." "So he got some weights." "He started to work out." "He worked out for months ." "Frank got buff.")
; events
(
(0 Bungling (4 4)
	(
		(Agent (0 0) ())
	)
)
(1 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (2 4) (0 2))
	)
)
(2 Getting (3 3)
	(
		(Theme (4 4) (0))
		(Recipient (0 0) ())
	)
)
(3 Quantified_mass (10 10)
	(
		(Mass (4 4) (0))
		(Individuals (7 7) ())
	)
)
(4 Have_associated (8 8)
	(
		(Topical_entity (7 7) ())
		(Entity (10 10) (3))
	)
)
(5 Proportional_quantity (9 9)
	(
		(Mass (4 4) (0))
		(Denoted_quantity (9 9) ())
	)
)
(6 Activity_start (13 13)
	(
		(Agent (0 0) ())
		(Activity (14 17) ())
	)
)
(7 Measure_duration (22 22)
	(
		(Unit (4 4) (0))
	)
)
(8 Expertise (26 26)
	(
		(Protagonist (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom was out for a walk." "It started to rain." "His socks got wet." "Tom felt gross about it." "He went home and changed.")
; events
(
(0 Self_motion (5 5)
	(
		(Self_mover (0 0) ())
	)
)
(1 Activity_start (8 8)
	(
		(Activity (9 10) (2))
		(Agent (0 0) ())
	)
)
(2 Precipitation (10 10)
	(
		(Precipitation (10 10) ())
	)
)
(3 Clothing (13 13)
	(
		(Garment (13 13) ())
		(Wearer (0 0) ())
	)
)
(4 Being_wet (15 15)
	(
		(Item (13 13) (3))
	)
)
(5 Social_interaction_evaluation (19 19)
	(
		(Evaluee (0 0) ())
		(Topic (21 21) ())
	)
)
(6 Feeling (18 18)
	(
		(Experiencer (0 0) ())
		(Emotional_state (19 19) (5))
		(Emotional_state (21 21) ())
	)
)
(7 Motion (24 24)
	(
		(Theme (0 0) ())
		(Goal (19 19) (5))
	)
)
(8 Exemplar (27 27)
	(
		(Domain (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The fly landed on the wall." "The man tried to hit it." "The fly got away." "The man woke up his son." "His son got the fly.")
; events
(
(0 Impact (2 2)
	(
		(Impactee (5 5) (1))
		(Impactor (1 1) ())
	)
)
(1 Architectural_part (5 5)
	(
		(Part (5 5) ())
	)
)
(2 Attempt (9 9)
	(
		(Goal (5 5) (1))
		(Agent (1 1) ())
	)
)
(3 People (8 8)
	(
		(Person (8 8) ())
	)
)
(4 Evading (16 17)
	(
		(Evader (1 1) ())
	)
)
(5 Kinship (24 24)
	(
		(Ego (23 23) ())
		(Alter (5 5) (1))
	)
)
(6 People (20 20)
	(
		(Person (8 8) (3))
	)
)
(7 Cause_to_wake (21 22)
	(
		(Sleeper (24 24) (5))
		(Agent (1 1) ())
	)
)
(8 Kinship (27 27)
	(
		(Ego (26 26) ())
		(Alter (8 8) (3))
	)
)
)
)
(
; story sentence text for lookup
("Bill got some surprise money." "He didn't know what to do with it." "He asked his dad." "His dad told him to invest it." "He did so.")
; events
(
(0 Proportional_quantity (2 2)
	(
		(Denoted_quantity (2 2) ())
		(Mass (4 4) (2))
	)
)
(1 Have_associated (1 1)
	(
		(Topical_entity (0 0) ())
		(Entity (4 4) (2))
	)
)
(2 Money (4 4)
	(
		(Money (4 4) ())
		(Time_of_creation (3 3) (3))
	)
)
(3 Stimulus_focus (3 3)
	(
		(Stimulus (4 4) (2))
	)
)
(4 Intentionally_act (12 12)
	(
		(Agent (0 0) ())
		(Act (14 14) ())
		(Act (4 4) (2))
	)
)
(5 Awareness (9 9)
	(
		(Cognizer (0 0) ())
		(Content (10 10) ())
	)
)
(6 Questioning (17 17)
	(
		(Addressee (19 19) (7))
		(Speaker (0 0) ())
	)
)
(7 Kinship (19 19)
	(
		(Ego (2 2) (0))
		(Alter (3 3) (3))
	)
)
(8 Telling (23 23)
	(
		(Message (27 27) ())
		(Addressee (3 3) (3))
		(Speaker (22 22) (9))
	)
)
(9 Kinship (22 22)
	(
		(Ego (0 0) ())
		(Alter (22 22) ())
	)
)
)
)
(
; story sentence text for lookup
("The cherry is red." "The buttercup is yellow." "I can paint a buttercup or a cherry." "The buttercup is a flower, but the cherry is a fruit." "The color of the orange is not red and it is not yellow." "We call this color orange." "I can make orange." "Red and yellow make orange.")
; events
(
(0 Color (3 3)
	(
		(Entity (1 1) ())
	)
)
(1 Containers (6 6)
	(
		(Container (6 6) ())
	)
)
(2 Color (8 8)
	(
		(Entity (1 1) ())
	)
)
(3 Containers (14 14)
	(
		(Container (14 14) ())
	)
)
(4 Filling (12 12)
	(
		(Agent (10 10) ())
		(Goal (14 14) (3))
	)
)
(5 Capability (11 11)
	(
		(Event (14 14) (3))
		(Entity (10 10) ())
	)
)
(6 Food (30 30)
	(
	)
)
(7 Concessive (25 25)
	(
		(Conceded_state_of_affairs (27 27) ())
		(Main_assertion (20 20) ())
	)
)
(8 Color (39 39)
	(
		(Color (39 39) ())
		(Color (20 20) ())
	)
)
(9 Color (44 44)
	(
		(Entity (41 41) ())
		(Color (44 44) ())
	)
)
(10 Color (33 33)
	(
		(Entity (36 36) ())
		(Color (6 6) (1))
	)
)
(11 Simple_naming (47 47)
	(
		(Entity (48 49) (12))
		(Speaker (10 10) ())
		(Term (14 14) (3))
	)
)
(12 Color (49 49)
	(
		(Color (49 49) ())
	)
)
(13 Cooking_creation (54 54)
	(
		(Cook (10 10) ())
		(Produced_food (49 49) (12))
	)
)
(14 Capability (53 53)
	(
		(Entity (10 10) ())
		(Event (48 49) (12))
	)
)
(15 Color_qualities (61 61)
	(
		(Color (57 57) (16))
	)
)
(16 Color (57 57)
	(
		(Color (10 10) ())
	)
)
(17 Color (59 59)
	(
		(Color (10 10) ())
		(Color (59 59) ())
	)
)
(18 Causation (60 60)
	(
		(Effect (14 14) (3))
		(Cause (57 57) (16))
	)
)
)
)
(
; story sentence text for lookup
("Lisa took her family to the farm." "Her kids had a great time." "Her daughter then touched the pig." "She laughed." "She had a fun time.")
; events
(
(0 Bringing (1 1)
	(
		(Theme (3 3) (2))
		(Agent (0 0) ())
		(Goal (6 6) (1))
	)
)
(1 Locale_by_use (6 6)
	(
		(Locale (6 6) ())
	)
)
(2 Kinship (3 3)
	(
		(Ego (2 2) ())
		(Alter (3 3) ())
	)
)
(3 Kinship (9 9)
	(
		(Ego (0 0) ())
		(Alter (9 9) ())
	)
)
(4 Desirability (12 12)
	(
		(Evaluee (13 13) ())
	)
)
(5 Kinship (16 16)
	(
		(Ego (0 0) ())
		(Alter (9 9) (3))
	)
)
(6 Manipulation (18 18)
	(
		(Entity (20 20) ())
		(Agent (16 16) (5))
	)
)
(7 Making_faces (23 23)
	(
		(Agent (0 0) ())
	)
)
(8 Stimulus_focus (28 28)
	(
		(Stimulus (29 29) ())
	)
)
)
)
(
; story sentence text for lookup
("Susie got a new hair oil." "She thought it was great." "When she tried it, it worked good." "Susie wanted to buy more." "She loved it.")
; events
(
(0 Body_parts (4 4)
	(
	)
)
(1 Have_associated (1 1)
	(
		(Entity (5 5) (3))
		(Topical_entity (0 0) ())
	)
)
(2 Age (3 3)
	(
		(Entity (5 5) (3))
	)
)
(3 Substance (5 5)
	(
		(Descriptor (4 4) (0))
		(Descriptor (3 3) (2))
		(Substance (5 5) ())
	)
)
(4 Opinion (8 8)
	(
		(Cognizer (0 0) ())
		(Opinion (9 9) ())
	)
)
(5 Desirability (11 11)
	(
		(Evaluee (9 9) ())
	)
)
(6 Temporal_collocation (13 13)
	(
		(Trajector_event (18 18) ())
		(Landmark_event (14 14) ())
	)
)
(7 Attempt_means (15 15)
	(
		(Agent (14 14) ())
		(Means (3 3) (2))
	)
)
(8 Being_operational (19 19)
	(
		(Degree (20 20) ())
		(Object (5 5) (3))
	)
)
(9 Increment (26 26)
	(
		(Increment (4 4) (0))
	)
)
(10 Desiring (23 23)
	(
		(Event (9 9) ())
		(Experiencer (0 0) ())
	)
)
(11 Commerce_buy (25 25)
	(
		(Goods (4 4) (0))
		(Buyer (0 0) ())
	)
)
(12 Experiencer_focus (29 29)
	(
		(Experiencer (0 0) ())
		(Content (9 9) ())
	)
)
)
)
(
; story sentence text for lookup
("The cat went to the living room." "There was something funny." "It had a new pillow." "The cat poked the pillow with its paw." "The cat liked the new pillow.")
; events
(
(0 Building_subparts (5 6)
	(
		(Building_part (6 6) ())
	)
)
(1 Motion (2 2)
	(
		(Goal (6 6) ())
		(Theme (1 1) ())
	)
)
(2 Existence (8 8)
	(
		(Entity (10 12) (3))
	)
)
(3 Stimulus_focus (11 11)
	(
		(Stimulus (10 10) ())
	)
)
(4 Possession (14 14)
	(
		(Owner (13 13) ())
		(Possession (10 12) (3))
	)
)
(5 Age (16 16)
	(
		(Entity (17 17) ())
	)
)
(6 Manipulation (21 21)
	(
		(Locus (23 23) ())
		(Bodypart_of_agent (26 26) (7))
		(Agent (1 1) ())
	)
)
(7 Body_parts (26 26)
	(
		(Possessor (25 25) ())
		(Body_part (26 26) ())
	)
)
(8 Experiencer_focus (30 30)
	(
		(Content (33 33) ())
		(Experiencer (1 1) ())
	)
)
(9 Age (32 32)
	(
		(Entity (33 33) ())
	)
)
)
)
(
; story sentence text for lookup
("Susie looked at her cd." "It was all scratched." "She wondered if it would work." "Unfortunately it did not." "She had to buy another one.")
; events
(
(0 Perception_active (1 1)
	(
		(Phenomenon (4 4) (1))
		(Perceiver_agentive (0 0) ())
	)
)
(1 Text (4 4)
	(
		(Text (4 4) ())
		(Author (3 3) ())
	)
)
(2 Desirability (9 9)
	(
		(Evaluee (0 0) ())
	)
)
(3 Cogitation (12 12)
	(
		(Cognizer (0 0) ())
		(Topic (14 14) ())
	)
)
(4 Usefulness (16 16)
	(
		(Entity (3 3) ())
	)
)
(5 Required_event (24 24)
	(
		(Required_situation (0 0) ())
		(Required_situation (28 28) ())
	)
)
(6 Increment (27 27)
	(
		(Class (28 28) ())
	)
)
(7 Commerce_buy (26 26)
	(
		(Goods (28 28) ())
		(Buyer (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The tree lost its leaves." "That winter it became very cold." "The branches froze." "The tree lost its branches." "The next spring the leaves could not grow back.")
; events
(
(0 Body_parts (4 4)
	(
		(Body_part (4 4) ())
		(Possessor (3 3) ())
	)
)
(1 Calendric_unit (7 7)
	(
		(Relative_time (6 6) ())
		(Unit (7 7) ())
	)
)
(2 Ambient_temperature (11 11)
	(
		(Place (8 8) ())
		(Degree (4 4) (0))
		(Time (6 7) (1))
	)
)
(3 Becoming (9 9)
	(
		(Final_quality (10 11) (2))
		(Entity (8 8) ())
	)
)
(4 Change_of_phase (15 15)
	(
		(Patient (6 7) (1))
	)
)
(5 Ontogeny (30 30)
	(
		(Place (31 31) ())
		(Time (23 25) (6))
		(Entity (27 27) ())
	)
)
(6 Calendric_unit (25 25)
	(
		(Unit (8 8) ())
		(Relative_time (7 7) (1))
	)
)
)
)
(
; story sentence text for lookup
("There was a box in the garage." "I didn't know what was inside." "I asked my father to open it." "He opened the box for me." "There was blank paper in the box.")
; events
(
(0 Buildings (6 6)
	(
		(Building (6 6) ())
	)
)
(1 Containers (3 3)
	(
		(Relative_location (6 6) (0))
		(Container (3 3) ())
	)
)
(2 Interior_profile_relation (14 14)
	(
		(Figure (12 12) ())
	)
)
(3 Awareness (11 11)
	(
		(Cognizer (8 8) ())
		(Content (6 6) (0))
	)
)
(4 Request (17 17)
	(
		(Addressee (19 19) (5))
		(Speaker (8 8) ())
		(Message (6 6) (0))
	)
)
(5 Kinship (19 19)
	(
		(Ego (18 18) ())
		(Alter (3 3) (1))
	)
)
(6 Closure (25 25)
	(
		(Containing_object (19 19) (5))
		(Agent (8 8) ())
		(Beneficiary (29 29) ())
	)
)
(7 Containers (27 27)
	(
		(Container (3 3) (1))
	)
)
(8 Abounding_with (33 33)
	(
		(Location (3 3) (1))
	)
)
(9 Containers (37 37)
	(
		(Container (6 6) (0))
	)
)
(10 Existence (31 32)
	(
		(Entity (19 19) (5))
		(Place (6 6) (0))
	)
)
)
)
(
; story sentence text for lookup
("Susie got lost." "She needed a map." "So she looked through her pocket." "She found an old map." "She was relieved.")
; events
(
(0 Transition_to_state (1 1)
	(
		(Final_quality (2 2) ())
		(Entity (0 0) ())
	)
)
(1 Needing (5 5)
	(
		(Requirement (7 7) (2))
		(Cognizer (0 0) ())
	)
)
(2 Physical_artworks (7 7)
	(
		(Artifact (7 7) ())
	)
)
(3 Perception_active (11 11)
	(
		(Perceiver_agentive (10 10) ())
		(Direction (14 14) (4))
	)
)
(4 Clothing_parts (14 14)
	(
		(Clothing (14 14) ())
		(Wearer (13 13) ())
	)
)
(5 Locating (17 17)
	(
		(Perceiver (0 0) ())
		(Sought_entity (20 20) (6))
	)
)
(6 Text (20 20)
	(
		(Text (13 13) ())
	)
)
(7 Age (19 19)
	(
		(Entity (13 13) ())
	)
)
(8 Emotion_directed (24 24)
	(
		(Experiencer (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The orange fell from the tree." "It hit a girl on the head." "The girl looked up at the tree." "Another orange fell from the tree." "That orange broke her nose.")
; events
(
(0 Food (1 1)
	(
	)
)
(1 Part_orientational (5 5)
	(
		(Part (5 5) ())
	)
)
(2 Motion_directional (2 2)
	(
		(Theme (1 1) (0))
		(Source (5 5) (1))
		(Direction (2 2) ())
	)
)
(3 Impact (8 8)
	(
		(Impactee (10 10) (5))
		(Impactor (7 7) ())
		(Subregion (13 13) (4))
	)
)
(4 Body_parts (13 13)
	(
		(Possessor (10 10) (5))
		(Body_part (13 13) ())
	)
)
(5 People (10 10)
	(
		(Person (10 10) ())
	)
)
(6 Perception_active (17 17)
	(
		(Phenomenon (13 13) (4))
		(Direction (10 10) (5))
		(Perceiver_agentive (1 1) (0))
	)
)
(7 People (16 16)
	(
		(Person (16 16) ())
	)
)
(8 Increment (23 23)
	(
		(Class (16 16) (7))
	)
)
(9 Motion_directional (25 25)
	(
		(Theme (1 1) (0))
		(Source (5 5) (1))
		(Direction (2 2) (2))
	)
)
(10 Body_parts (34 34)
	(
		(Body_part (34 34) ())
		(Possessor (10 10) (5))
	)
)
(11 Experience_bodily_harm (32 32)
	(
		(Experiencer (1 1) (0))
		(Body_part (34 34) (10))
	)
)
)
)
(
; story sentence text for lookup
("The cat hid in the bush." "The man saw it." "The man called to the cat." "The cat refused to budge." "The man brought the cat inside.")
; events
(
(0 Dodging (2 2)
	(
		(Place (5 5) ())
		(Dodger (1 1) ())
	)
)
(1 Perception_experience (9 9)
	(
		(Phenomenon (10 10) ())
		(Perceiver_passive (1 1) ())
	)
)
(2 People (8 8)
	(
		(Person (8 8) ())
	)
)
(3 Contacting (14 14)
	(
		(Addressee (5 5) ())
		(Communicator (1 1) ())
	)
)
(4 People (13 13)
	(
		(Person (8 8) (2))
	)
)
(5 Agree_or_refuse_to_act (21 21)
	(
		(Proposed_action (22 23) (6))
		(Speaker (1 1) ())
	)
)
(6 Body_movement (23 23)
	(
		(Agent (1 1) ())
	)
)
(7 Bringing (27 27)
	(
		(Goal (30 30) ())
		(Theme (22 23) (6))
		(Agent (1 1) ())
	)
)
(8 People (26 26)
	(
		(Person (8 8) (2))
	)
)
)
)
(
; story sentence text for lookup
("Ernesto is a cat." "He likes to hunt bugs." "Yesterday there was a fly on top of the desk." "He jumped and caught the fly." "Then Ernesto ate the fly.")
; events
(
(0 Animals (3 3)
	(
		(Animal (3 3) ())
		(Animal (0 0) ())
	)
)
(1 Experiencer_focus (6 6)
	(
		(Experiencer (0 0) ())
		(Content (9 9) ())
	)
)
(2 Hunting (8 8)
	(
		(Hunter (0 0) ())
		(Food (9 9) ())
	)
)
(3 Calendric_unit (11 11)
	(
		(Unit (0 0) ())
	)
)
(4 Existence (12 13)
	(
		(Entity (14 15) ())
		(Time (0 0) ())
		(Place (17 17) ())
	)
)
(5 Self_motion (23 23)
	(
		(Self_mover (0 0) ())
	)
)
(6 Removing (25 25)
	(
		(Agent (0 0) ())
		(Theme (27 27) ())
	)
)
(7 Ingestion (31 31)
	(
		(Ingestor (30 30) ())
		(Ingestibles (14 15) ())
	)
)
(8 Food (33 33)
	(
	)
)
)
)
(
; story sentence text for lookup
("Sue had a puppy she loved." "One day it ran away." "Sue was so sad." "One day her dad said Sue I have something for you." "It was a new puppy.")
; events
(
(0 Have_associated (1 1)
	(
		(Topical_entity (0 0) ())
		(Entity (3 3) ())
	)
)
(1 Experiencer_focus (5 5)
	(
		(Content (3 3) ())
		(Experiencer (4 4) ())
	)
)
(2 Calendric_unit (8 8)
	(
		(Count (0 0) ())
		(Unit (8 8) ())
	)
)
(3 Self_motion (10 10)
	(
		(Self_mover (9 9) ())
		(Source (4 4) ())
		(Time (7 8) (2))
	)
)
(4 Emotion_directed (16 16)
	(
		(Experiencer (0 0) ())
		(Degree (9 9) ())
	)
)
(5 Calendric_unit (19 19)
	(
		(Count (0 0) ())
		(Unit (8 8) (2))
	)
)
(6 Statement (22 22)
	(
		(Speaker (3 3) ())
		(Message (24 24) ())
	)
)
(7 Kinship (21 21)
	(
		(Ego (9 9) ())
		(Alter (21 21) ())
	)
)
(8 Possession (25 25)
	(
		(Possession (26 26) ())
		(Owner (24 24) ())
	)
)
(9 Age (33 33)
	(
		(Entity (4 4) ())
		(Age (21 21) (7))
	)
)
)
)
(
; story sentence text for lookup
("It is night." "The moon and stars are shining." "I see many stars." "At night the boys and girls are asleep." "In the day they play or work." "When night comes they are very tired.")
; events
(
(0 Calendric_unit (2 2)
	(
		(Unit (2 2) ())
	)
)
(1 Location_of_light (9 9)
	(
		(Figure (5 5) ())
	)
)
(2 Quantified_mass (13 13)
	(
		(Quantity (2 2) (0))
		(Individuals (14 14) ())
	)
)
(3 Perception_experience (12 12)
	(
		(Perceiver_passive (11 11) ())
		(Phenomenon (14 14) ())
	)
)
(4 Sleep (23 23)
	(
		(Sleeper (19 19) (7))
		(Time (17 17) (5))
	)
)
(5 Calendric_unit (17 17)
	(
		(Unit (17 17) ())
	)
)
(6 People (21 21)
	(
		(Person (21 21) ())
	)
)
(7 People_by_age (19 19)
	(
		(Person (14 14) ())
	)
)
(8 Calendric_unit (27 27)
	(
		(Unit (2 2) (0))
	)
)
(9 Competition (29 29)
	(
		(Participants (14 14) ())
	)
)
(10 Work (31 31)
	(
		(Time (27 27) (8))
		(Agent (14 14) ())
	)
)
(11 Temporal_collocation (33 33)
	(
		(Landmark_event (34 34) (13))
		(Trajector_event (36 36) ())
	)
)
(12 Arriving (35 35)
	(
		(Theme (17 17) (5))
	)
)
(13 Calendric_unit (34 34)
	(
		(Unit (17 17) (5))
	)
)
(14 Biological_urge (39 39)
	(
		(Degree (21 21) (6))
		(Experiencer (14 14) ())
	)
)
)
)
(
; story sentence text for lookup
("Chad was going out for a pass." "He was on in the parking lot." "Someone was guarding him." "He hit the ground hard." "His arm was broken.")
; events
(
(0 Natural_features (6 6)
	(
		(Locale (6 6) ())
	)
)
(1 Motion (2 2)
	(
		(Source (3 3) ())
		(Goal (6 6) (0))
		(Theme (0 0) ())
	)
)
(2 Locale_by_use (13 14)
	(
		(Locale (14 14) ())
	)
)
(3 Protecting (18 18)
	(
		(Asset (3 3) ())
		(Protection (0 0) ())
	)
)
(4 Impact (22 24)
	(
		(Impactee (24 24) ())
		(Impactor (0 0) ())
		(Manner (25 25) ())
	)
)
(5 Body_parts (28 28)
	(
		(Possessor (0 0) ())
		(Body_part (28 28) ())
	)
)
(6 Cause_to_fragment (30 30)
	(
		(Whole_patient (27 28) (5))
	)
)
)
)
(
; story sentence text for lookup
("Tom was walking." "He suddenly saw a wallet." "He picked it up and tried to find the owner." "He could not find him." "He kept it.")
; events
(
(0 Self_motion (2 2)
	(
		(Self_mover (0 0) ())
	)
)
(1 Containers (8 8)
	(
		(Container (8 8) ())
	)
)
(2 Perception_experience (6 6)
	(
		(Perceiver_passive (0 0) ())
		(Manner (5 5) ())
		(Phenomenon (8 8) (1))
	)
)
(3 Possession (19 19)
	(
		(Owner (19 19) ())
	)
)
(4 Attempt (15 15)
	(
		(Agent (0 0) ())
		(Goal (19 19) (3))
	)
)
(5 Remembering_experience (17 17)
	(
		(Cognizer (0 0) ())
		(Salient_entity (19 19) (3))
	)
)
(6 Remembering_experience (24 24)
	(
		(Cognizer (0 0) ())
		(Salient_entity (8 8) (1))
	)
)
)
)
(
; story sentence text for lookup
("Here is a large tree." "The leaves grow on the branches of the tree." "The branches grow from the trunk of the tree." "What is the trunk of the tree?" "The large part of the tree is called the trunk." "Do you know what the roots are?" "The roots grow in the ground." "They get water and food for the tree from the ground.")
; events
(
(0 Spatial_co-location (0 0)
	(
		(Figure (4 4) (1))
	)
)
(1 Food (4 4)
	(
		(Food (4 4) ())
		(Descriptor (3 3) (2))
	)
)
(2 Size (3 3)
	(
		(Entity (4 4) (1))
	)
)
(3 Food (14 14)
	(
		(Food (14 14) ())
	)
)
(4 Part_orientational (11 11)
	(
		(Whole (14 14) (3))
		(Part (11 11) ())
	)
)
(5 Spatial_contact (9 9)
	(
		(Figure (7 7) ())
		(Ground (11 11) (4))
	)
)
(6 Ontogeny (8 8)
	(
		(Entity (7 7) ())
		(Place (11 11) (4))
	)
)
(7 Body_parts (21 21)
	(
		(Possessor (14 14) (3))
		(Body_part (11 11) (4))
	)
)
(8 Ontogeny (18 18)
	(
		(Entity (7 7) ())
		(Prior_state (11 11) (4))
	)
)
(9 Part_whole (36 36)
	(
		(Part (36 36) ())
		(Part_prop (35 35) (10))
		(Whole (39 39) ())
	)
)
(10 Size (35 35)
	(
		(Entity (39 39) ())
	)
)
(11 Referring_by_name (41 41)
	(
		(Entity (39 39) ())
		(Name (42 43) ())
	)
)
(12 Awareness (47 47)
	(
		(Content (50 50) ())
		(Cognizer (35 35) (10))
	)
)
(13 Ontogeny (55 55)
	(
		(Entity (7 7) ())
		(Place (39 39) ())
	)
)
(14 Natural_features (70 70)
	(
		(Locale (70 70) ())
	)
)
(15 Getting (61 61)
	(
		(Recipient (60 60) ())
		(Source (70 70) (14))
		(Theme (62 62) ())
	)
)
(16 Food (64 64)
	(
	)
)
)
)
(
; story sentence text for lookup
("Do you see the man and the woman in this large boat?" "They have no house; they live in the boat." "What have they in the boat?" "They have corn and cocoanuts." "They are taking them to Manila.")
; events
(
(0 Perception_experience (2 2)
	(
		(Perceiver_passive (1 1) ())
		(Phenomenon (4 4) (4))
	)
)
(1 Size (10 10)
	(
		(Entity (11 11) (2))
	)
)
(2 Vehicle (11 11)
	(
		(Descriptor (10 10) (1))
		(Vehicle (11 11) ())
	)
)
(3 Interior_profile_relation (8 8)
	(
		(Ground (11 11) (2))
		(Figure (4 4) (4))
	)
)
(4 People (4 4)
	(
		(Person (4 4) ())
	)
)
(5 People (7 7)
	(
		(Person (7 7) ())
	)
)
(6 Possession (14 14)
	(
		(Possession (16 16) (8))
		(Owner (13 13) ())
	)
)
(7 Residence (19 19)
	(
		(Location (22 22) (9))
		(Resident (18 18) ())
	)
)
(8 Buildings (16 16)
	(
		(Building (16 16) ())
	)
)
(9 Vehicle (22 22)
	(
		(Vehicle (22 22) ())
	)
)
(10 Vehicle (29 29)
	(
		(Vehicle (18 18) ())
	)
)
(11 Food (33 33)
	(
	)
)
(12 Expensiveness (32 32)
	(
		(Origin (13 13) ())
		(Asset (33 33) (11))
	)
)
(13 Food (35 35)
	(
	)
)
(14 Bringing (39 39)
	(
		(Goal (42 42) ())
		(Agent (13 13) ())
		(Theme (16 16) (8))
	)
)
)
)
(
; story sentence text for lookup
("Allie felt not so good last night." "She ate too much." "So she had to sleep it off." "Then she woke up." "She felt so much better.")
; events
(
(0 Desirability (4 4)
	(
		(Degree (3 3) ())
		(Evaluee (0 0) ())
	)
)
(1 Feeling (1 1)
	(
		(Experiencer (0 0) ())
	)
)
(2 Negation (2 3)
	(
		(Negated_proposition (3 4) (0))
		(Negated_proposition (0 0) ())
	)
)
(3 Calendric_unit (6 6)
	(
		(Unit (6 6) ())
		(Relative_time (5 5) ())
	)
)
(4 Ingestion (9 9)
	(
		(Ingestor (0 0) ())
		(Ingestibles (10 11) (5))
	)
)
(5 Containers (11 11)
	(
	)
)
(6 Required_event (15 15)
	(
		(Required_situation (14 14) ())
		(Required_situation (18 18) ())
	)
)
(7 Sleep (17 19)
	(
		(Sleeper (14 14) ())
	)
)
(8 Waking_up (23 24)
	(
		(Time (0 0) ())
		(Sleeper (14 14) ())
	)
)
(9 Feeling (27 27)
	(
		(Experiencer (0 0) ())
		(Evaluation (28 30) (10))
	)
)
(10 Desirability (30 30)
	(
		(Degree (10 11) (5))
		(Evaluee (0 0) ())
		(Degree (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("Carlton liked to play with all children." "One child was sick however." "His mother told him not to play with him." "And so Carlton listened." "So he did not get sick.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Content (6 6) (2))
		(Experiencer (0 0) ())
	)
)
(1 Competition (3 3)
	(
		(Participant_2 (6 6) (2))
		(Participant_1 (0 0) ())
	)
)
(2 People_by_age (6 6)
	(
		(Person (6 6) ())
	)
)
(3 Cardinal_numbers (8 8)
	(
		(Number (0 0) ())
		(Entity (9 9) (4))
	)
)
(4 People_by_age (9 9)
	(
		(Person (9 9) ())
	)
)
(5 Biological_urge (11 11)
	(
		(Experiencer (9 9) (4))
	)
)
(6 Telling (16 16)
	(
		(Message (22 22) ())
		(Addressee (17 17) ())
		(Speaker (9 9) (4))
	)
)
(7 Kinship (15 15)
	(
		(Ego (0 0) ())
		(Alter (9 9) (4))
	)
)
(8 Perception_active (27 27)
	(
		(Perceiver_agentive (26 26) ())
	)
)
(9 Biological_urge (34 34)
	(
		(Experiencer (9 9) (4))
	)
)
(10 Transition_to_state (33 33)
	(
		(Entity (9 9) (4))
	)
)
)
)
(
; story sentence text for lookup
("Joe had run out of dish soap." "So Joe went to the store." "He found the best soap." "Bought the best soap and took it home." "Joe no longer needed soap.")
; events
(
(0 Theft (2 2)
	(
		(Perpetrator (0 0) ())
		(Victim (6 6) (1))
	)
)
(1 Food (6 6)
	(
		(Type (5 5) ())
	)
)
(2 Motion (10 10)
	(
		(Theme (9 9) ())
		(Goal (13 13) (3))
	)
)
(3 Businesses (13 13)
	(
		(Business (5 5) ())
	)
)
(4 Education_teaching (19 19)
	(
		(Depictive (18 18) (6))
	)
)
(5 Locating (16 16)
	(
		(Perceiver (0 0) ())
		(Sought_entity (19 19) (4))
	)
)
(6 Desirability (18 18)
	(
		(Evaluee (19 19) (4))
		(Degree (18 18) ())
	)
)
(7 Bringing (26 28)
	(
		(Theme (27 27) ())
		(Goal (28 28) ())
	)
)
(8 Desirability (23 23)
	(
		(Evaluee (18 18) (6))
		(Degree (23 23) ())
	)
)
(9 Commerce_buy (21 21)
	(
		(Goods (24 24) ())
	)
)
(10 Temporal_collocation (31 32)
	(
		(Trajector_event (0 0) ())
		(Trajector_event (33 34) (11 12))
	)
)
(11 Needing (33 33)
	(
		(Time (31 32) (10))
		(Cognizer (0 0) ())
		(Requirement (19 19) (4))
	)
)
(12 Education_teaching (34 34)
	(
	)
)
)
)
(
; story sentence text for lookup
("I see a nest, Rosy!" "Can you see it?" "It is in this big green tree.")
; events
(
(0 Perception_experience (1 1)
	(
		(Phenomenon (3 3) ())
		(Perceiver_passive (0 0) ())
	)
)
(1 Perception_experience (9 9)
	(
		(Perceiver_passive (8 8) ())
		(Phenomenon (10 10) ())
	)
)
(2 Color (17 17)
	(
		(Color (17 17) ())
		(Entity (18 18) ())
	)
)
(3 Interior_profile_relation (14 14)
	(
		(Figure (0 0) ())
		(Ground (18 18) ())
	)
)
(4 Size (16 16)
	(
		(Entity (18 18) ())
	)
)
)
)
(
; story sentence text for lookup
("I got a new iPad." "It was nice." "What I liked it very much." "I saved the box." "The box was very amazing.")
; events
(
(0 Possession (1 1)
	(
		(Owner (0 0) ())
		(Possession (4 4) ())
	)
)
(1 Age (3 3)
	(
		(Entity (4 4) ())
		(Age (3 3) ())
	)
)
(2 Stimulus_focus (8 8)
	(
		(Stimulus (0 0) ())
	)
)
(3 Experiencer_focus (12 12)
	(
		(Content (0 0) ())
		(Experiencer (11 11) ())
		(Content (3 3) (1))
		(Degree (14 15) ())
	)
)
(4 Retaining (18 18)
	(
		(Agent (0 0) ())
		(Theme (20 20) (5))
	)
)
(5 Containers (20 20)
	(
		(Container (3 3) (1))
	)
)
(6 Desirability (26 26)
	(
		(Degree (3 3) (1))
		(Evaluee (23 23) ())
	)
)
)
)
(
; story sentence text for lookup
("The man has a little dog." "The boy has a big dog." "See the little dog run!" "He has my ball." "The little dog may have the ball." "He may run and play with it." "She can not take it.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Animals (5 5)
	(
		(Animal (5 5) ())
		(Descriptor (4 4) ())
		(Animal (1 1) (0))
	)
)
(2 Animals (12 12)
	(
		(Animal (5 5) (1))
		(Descriptor (4 4) ())
		(Animal (1 1) (0))
	)
)
(3 People_by_age (8 8)
	(
		(Person (1 1) (0))
	)
)
(4 Size (11 11)
	(
		(Entity (5 5) (1))
	)
)
(5 Perception_experience (14 14)
	(
		(Phenomenon (17 17) ())
	)
)
(6 Self_motion (18 18)
	(
		(Self_mover (17 17) ())
	)
)
(7 Self_motion (35 35)
	(
		(Self_mover (33 33) ())
	)
)
(8 Capability (42 42)
	(
		(Entity (33 33) ())
		(Event (45 45) ())
	)
)
)
)
(
; story sentence text for lookup
("Baby sits on the soft mat." "You may play near her a while.")
; events
(
(0 Posture (1 1)
	(
		(Point_of_contact (1 1) ())
		(Agent (0 0) ())
		(Location (5 5) ())
	)
)
(1 Frequency (12 13)
	(
		(Event (7 7) ())
	)
)
(2 Competition (9 9)
	(
		(Participants (0 0) ())
		(Place (11 11) ())
	)
)
(3 Likelihood (8 8)
	(
		(Hypothetical_event (0 0) ())
		(Hypothetical_event (11 11) ())
		(Time (12 13) (1))
	)
)
)
)
(
; story sentence text for lookup
("The couple worked out." "The woman felt dizzy." "The man sat down with her." "The woman felt sick." "The woman threw up on the man.")
; events
(
(0 Personal_relationship (1 1)
	(
		(Partners (1 1) ())
	)
)
(1 Feeling (7 7)
	(
		(Emotional_state (8 8) (3))
		(Experiencer (6 6) (2))
	)
)
(2 People (6 6)
	(
		(Person (1 1) (0))
	)
)
(3 Biological_urge (8 8)
	(
		(Experiencer (6 6) (2))
	)
)
(4 Change_posture (12 12)
	(
		(Result (15 15) ())
		(Protagonist (6 6) (2))
	)
)
(5 People (11 11)
	(
		(Person (1 1) (0))
	)
)
(6 Give_impression (19 19)
	(
		(Characterization (8 8) (3))
		(Perceiver_passive (6 6) (2))
	)
)
(7 People (18 18)
	(
		(Person (1 1) (0))
	)
)
(8 Biological_urge (20 20)
	(
		(Experiencer (6 6) (2))
	)
)
(9 People (23 23)
	(
		(Person (1 1) (0))
	)
)
(10 People (28 28)
	(
		(Person (28 28) ())
	)
)
)
)
(
; story sentence text for lookup
("My papa gave me two pretty rabbits." "My rabbits eat from my hand." "I shall keep them in a little house." "I love my dear papa.")
; events
(
(0 Giving (2 2)
	(
		(Theme (6 6) ())
		(Recipient (3 3) ())
		(Donor (1 1) (1))
	)
)
(1 Kinship (1 1)
	(
		(Ego (0 0) ())
		(Alter (1 1) ())
	)
)
(2 Body_parts (13 13)
	(
		(Possessor (12 12) ())
		(Body_part (13 13) ())
	)
)
(3 Ingestion (10 10)
	(
		(Ingestor (1 1) (1))
		(Source (13 13) (2))
	)
)
(4 Storing (17 17)
	(
		(Agent (0 0) ())
		(Location (22 22) (5))
		(Theme (3 3) ())
	)
)
(5 Buildings (22 22)
	(
		(Building (22 22) ())
		(Descriptor (21 21) ())
	)
)
(6 Experiencer_focus (25 25)
	(
		(Experiencer (0 0) ())
		(Content (28 28) (7))
	)
)
(7 Kinship (28 28)
	(
		(Ego (26 26) ())
		(Alter (12 12) ())
	)
)
)
)
(
; story sentence text for lookup
("Lucy was playing with her doll." "All of the sudden her brother took it." "Lucy started to cry." "She asked for it back." "Lucy needed it back right away.")
; events
(
(0 Perception_experience (2 2)
	(
		(Perceiver_passive (0 0) ())
		(Body_part (5 5) ())
	)
)
(1 Kinship (12 12)
	(
		(Ego (11 11) ())
		(Alter (12 12) ())
	)
)
(2 Activity_start (17 17)
	(
		(Activity (18 19) (3))
		(Agent (0 0) ())
	)
)
(3 Communication_noise (19 19)
	(
		(Speaker (0 0) ())
	)
)
(4 Request (22 22)
	(
		(Message (18 19) (3))
		(Speaker (0 0) ())
		(Message (11 11) ())
	)
)
(5 Needing (28 28)
	(
		(Time (31 32) ())
		(Cognizer (0 0) ())
		(Requirement (29 29) ())
		(Dependent (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("I wanted to run twenty miles after work." "I had to hurry." "It was about to be dark." "I made it to 12 miles." "Then I had to stop.")
; events
(
(0 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (5 5) (1))
	)
)
(1 Measure_linear_extent (5 5)
	(
		(Unit (5 5) ())
		(Count (4 4) ())
	)
)
(2 Self_motion (3 3)
	(
		(Distance (5 5) (1))
		(Self_mover (0 0) ())
		(Time (7 7) ())
	)
)
(3 Required_event (10 11)
	(
		(Required_situation (0 0) ())
		(Required_situation (12 12) (4))
	)
)
(4 Self_motion (12 12)
	(
		(Self_mover (0 0) ())
	)
)
(5 Level_of_light (19 19)
	(
	)
)
(6 Measure_linear_extent (26 26)
	(
		(Unit (5 5) (1))
		(Count (4 4) ())
	)
)
(7 Required_event (30 31)
	(
		(Time (0 0) ())
		(Required_situation (29 29) ())
		(Required_situation (4 4) ())
	)
)
(8 Halt (32 32)
	(
		(Theme (29 29) ())
	)
)
)
)
(
; story sentence text for lookup
("The bird can fly." "The baby can not have the bird." "She can not fly." "She may play with my doll." "She may have my big hat.")
; events
(
(0 Self_motion (3 3)
	(
		(Self_mover (1 1) ())
	)
)
(1 Capability (2 2)
	(
		(Entity (1 1) ())
		(Event (3 3) (0))
	)
)
(2 Possibility (7 7)
	(
		(Possible_event (11 11) ())
		(Possible_event (1 1) ())
	)
)
(3 People_by_age (6 6)
	(
		(Person (6 6) ())
	)
)
(4 Capability (14 14)
	(
		(Entity (13 13) ())
		(Event (3 3) (0))
	)
)
(5 Self_motion (16 16)
	(
		(Self_mover (13 13) ())
	)
)
(6 Bragging (20 20)
	(
		(Speaker (13 13) ())
		(Topic (23 23) ())
	)
)
(7 Likelihood (19 19)
	(
		(Hypothetical_event (13 13) ())
		(Hypothetical_event (23 23) ())
	)
)
(8 Accoutrements (30 30)
	(
		(Accoutrement (30 30) ())
		(Descriptor (29 29) (11))
		(Wearer (3 3) (0))
	)
)
(9 Possession (27 27)
	(
		(Owner (13 13) ())
		(Possession (23 23) ())
	)
)
(10 Likelihood (26 26)
	(
		(Hypothetical_event (13 13) ())
		(Hypothetical_event (23 23) ())
	)
)
(11 Size (29 29)
	(
		(Entity (30 30) (8))
	)
)
)
)
(
; story sentence text for lookup
("Logan is going to the park." "He plays in the sand." "He runs all around the grass." "He climbs and climbs." "He swings very high.")
; events
(
(0 Locale_by_use (5 5)
	(
		(Locale (5 5) ())
	)
)
(1 Motion (2 2)
	(
		(Goal (5 5) (0))
		(Theme (0 0) ())
	)
)
(2 Self_motion (14 14)
	(
		(Self_mover (0 0) ())
		(Area (18 18) ())
	)
)
(3 Self_motion (21 21)
	(
		(Self_mover (0 0) ())
	)
)
(4 Self_motion (23 23)
	(
		(Self_mover (0 0) ())
	)
)
(5 Body_movement (26 26)
	(
		(Agent (0 0) ())
		(Result (28 28) (6))
		(Degree (27 27) ())
	)
)
(6 Stimulus_focus (28 28)
	(
		(Stimulus (0 0) ())
		(Degree (27 27) ())
	)
)
)
)
(
; story sentence text for lookup
("I was walking through the woods." "I heard an animal." "It made a funny sound." "I got closer." "It turned out to be a fox.")
; events
(
(0 Biological_area (5 5)
	(
		(Locale (5 5) ())
	)
)
(1 Self_motion (2 2)
	(
		(Self_mover (0 0) ())
		(Path (5 5) (0))
	)
)
(2 Perception_experience (8 8)
	(
		(Phenomenon (10 10) (3))
		(Perceiver_passive (0 0) ())
	)
)
(3 Animals (10 10)
	(
		(Animal (10 10) ())
	)
)
(4 Sensation (16 16)
	(
		(Source (0 0) ())
		(Descriptor (10 10) (3))
	)
)
(5 Stimulus_focus (15 15)
	(
		(Stimulus (16 16) (4))
	)
)
(6 Gradable_proximity (20 20)
	(
		(Figure (0 0) ())
	)
)
(7 Transition_to_state (19 19)
	(
		(Final_quality (20 20) (6))
		(Entity (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("I see a fox on a box, and a fox in front of a box." "Frank has two foxes and two boxes." "He gave each fox a box in which to sleep." "He put hay in the boxes." "The boxes are good houses for them." "Frank feeds his foxes and gives them water.")
; events
(
(0 Containers (15 15)
	(
		(Container (15 15) ())
	)
)
(1 Perception_experience (1 1)
	(
		(Perceiver_passive (0 0) ())
		(Ground (6 6) (2))
		(Phenomenon (3 3) ())
	)
)
(2 Containers (6 6)
	(
		(Container (6 6) ())
	)
)
(3 Cardinal_numbers (19 19)
	(
		(Number (19 19) ())
		(Entity (20 20) ())
	)
)
(4 Possession (18 18)
	(
		(Owner (0 0) ())
		(Possession (20 20) ())
	)
)
(5 Containers (23 23)
	(
		(Container (6 6) (2))
	)
)
(6 Sleep (34 34)
	(
		(Place (30 30) ())
		(Place (32 32) ())
	)
)
(7 Giving (26 26)
	(
		(Donor (0 0) ())
		(Recipient (3 3) ())
		(Theme (30 30) ())
	)
)
(8 Containers (41 41)
	(
		(Container (41 41) ())
	)
)
(9 Placing (37 37)
	(
		(Agent (0 0) ())
		(Theme (19 19) (3))
		(Goal (41 41) (8))
	)
)
(10 Containers (44 44)
	(
		(Container (44 44) ())
	)
)
(11 Usefulness (46 46)
	(
		(Entity (47 47) ())
		(Entity (44 44) (10))
		(Purpose (49 49) ())
	)
)
(12 Ingestion (52 52)
	(
		(Ingestor (0 0) ())
		(Ingestibles (3 3) ())
	)
)
(13 Giving (56 56)
	(
		(Recipient (6 6) (2))
		(Donor (0 0) ())
		(Theme (58 58) (14))
	)
)
(14 Food (58 58)
	(
	)
)
)
)
(
; story sentence text for lookup
("Hall and Ann have come to the brook." "Dash is with them." "The brook is wide, but the water is not deep." "Dash has Ann on his back." "He will take her to the other side." "She will not wet her feet." "He holds her on her." "She will not fall off.")
; events
(
(0 Natural_features (7 7)
	(
		(Locale (7 7) ())
	)
)
(1 Arriving (4 4)
	(
		(Theme (0 0) ())
		(Goal (7 7) (0))
	)
)
(2 Natural_features (15 15)
	(
		(Locale (15 15) ())
	)
)
(3 Measurable_attributes (24 24)
	(
		(Attribute (24 24) ())
		(Entity (21 21) ())
	)
)
(4 Measurable_attributes (17 17)
	(
		(Entity (15 15) (2))
		(Attribute (17 17) ())
	)
)
(5 Concessive (19 19)
	(
		(Conceded_state_of_affairs (21 21) ())
		(Main_assertion (15 15) (2))
	)
)
(6 Body_parts (31 31)
	(
		(Possessor (30 30) ())
		(Body_part (31 31) ())
	)
)
(7 Bringing (35 35)
	(
		(Agent (33 33) ())
		(Goal (40 40) ())
		(Theme (17 17) (4))
	)
)
(8 Increment (39 39)
	(
		(Class (7 7) (0))
	)
)
(9 Body_parts (47 47)
	(
		(Body_part (31 31) (6))
		(Possessor (30 30) ())
	)
)
(10 Cause_to_be_wet (45 45)
	(
		(Patient (47 47) (9))
		(Agent (33 33) ())
	)
)
(11 Manipulation (50 50)
	(
		(Locus (53 53) ())
		(Agent (33 33) ())
		(Entity (51 51) ())
	)
)
(12 Motion_directional (58 58)
	(
		(Theme (33 33) ())
		(Source (30 30) ())
		(Direction (17 17) (4))
	)
)
)
)
(
; story sentence text for lookup
("My dog had puppies." "It was cold outside." "She came into the garage." "She had one puppy outside." "It did not survive.")
; events
(
(0 Food (3 3)
	(
		(Food (3 3) ())
		(Descriptor (1 1) ())
	)
)
(1 Ambient_temperature (7 7)
	(
		(Place (3 3) (0))
	)
)
(2 Temporal_collocation (8 8)
	(
		(Trajector_event (5 5) ())
	)
)
(3 Arriving (11 11)
	(
		(Theme (10 10) ())
		(Goal (14 14) (4))
	)
)
(4 Buildings (14 14)
	(
	)
)
(5 Interior_profile_relation (20 20)
	(
		(Figure (19 19) ())
	)
)
(6 Surviving (25 25)
	(
		(Survivor (10 10) ())
	)
)
)
)
(
; story sentence text for lookup
("The woman kissed a man." "It felt good to her." "She gave him her number." "He lost it on the way home." "The never met again.")
; events
(
(0 Manipulation (2 2)
	(
		(Entity (4 4) (2))
		(Agent (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 People (4 4)
	(
		(Person (4 4) ())
	)
)
(3 Desirability (8 8)
	(
		(Evaluee (6 6) ())
		(Affected_party (4 4) (2))
	)
)
(4 Give_impression (7 7)
	(
		(Phenomenon (6 6) ())
		(Characterization (8 8) (3))
		(Body_part (4 4) (2))
	)
)
(5 Being_named (16 16)
	(
		(Entity (8 8) (3))
		(Name (4 4) (2))
		(Entity (15 15) ())
	)
)
(6 Come_together (28 28)
	(
		(Configuration (6 6) ())
	)
)
)
)
(
; story sentence text for lookup
("Barry lost his dog." "He felt a hole in his heart." "He went to the pet store." "The dog he found was great." "They are best friends now.")
; events
(
(0 Animals (3 3)
	(
		(Animal (2 2) ())
		(Animal (3 3) ())
	)
)
(1 Perception_experience (6 6)
	(
		(Phenomenon (8 8) ())
		(Perceiver_passive (5 5) ())
		(Body_part (11 11) (2))
	)
)
(2 Body_parts (11 11)
	(
		(Possessor (10 10) ())
		(Body_part (11 11) ())
	)
)
(3 Motion (14 14)
	(
		(Theme (5 5) ())
		(Goal (18 18) (4))
	)
)
(4 Businesses (18 18)
	(
		(Business (10 10) ())
		(Product (17 17) ())
	)
)
(5 Desirability (25 25)
	(
		(Evaluee (21 21) ())
	)
)
(6 Locating (23 23)
	(
		(Perceiver (2 2) ())
		(Sought_entity (21 21) ())
	)
)
(7 Expertise (29 29)
	(
		(Protagonist (5 5) ())
	)
)
(8 Personal_relationship (30 30)
	(
		(Partners (5 5) ())
		(Degree (2 2) ())
	)
)
)
)
(
; story sentence text for lookup
("Jane, Joe and Harry will have a fine time today." "There is no school, they have a play-day." "They have come to the fields and woods." "They see the birds fly from tree to tree." "They hear their sweet songs." "They are down by the pond." "They have had a long walk." "They can sit down now and rest.")
; events
(
(0 Calendric_unit (10 10)
	(
		(Unit (10 10) ())
	)
)
(1 Desirability (8 8)
	(
		(Evaluee (9 9) ())
	)
)
(2 Negation (14 14)
	(
		(Negated_proposition (15 15) (3))
		(Negated_proposition (12 13) (4))
	)
)
(3 Locale_by_use (15 15)
	(
		(Locale (15 15) ())
	)
)
(4 Existence (12 13)
	(
		(Entity (14 15) (2 3))
	)
)
(5 Locale_by_use (29 29)
	(
		(Locale (29 29) ())
	)
)
(6 Arriving (26 26)
	(
		(Theme (24 24) ())
		(Goal (29 29) (5))
	)
)
(7 Biological_area (31 31)
	(
		(Locale (31 31) ())
	)
)
(8 Perception_experience (34 34)
	(
		(Phenomenon (36 36) ())
		(Perceiver_passive (24 24) ())
	)
)
(9 Self_motion (37 37)
	(
		(Self_mover (14 15) (2 3))
		(Path (39 39) ())
	)
)
(10 Perception_experience (44 44)
	(
		(Perceiver_passive (24 24) ())
		(Phenomenon (47 47) (11))
	)
)
(11 Text (47 47)
	(
		(Author (45 45) ())
		(Text (47 47) ())
		(Descriptor (15 15) (3))
	)
)
(12 Creating (46 46)
	(
		(Created_entity (47 47) (11))
	)
)
(13 Natural_features (54 54)
	(
		(Locale (29 29) (5))
	)
)
(14 Self_motion (61 61)
	(
		(Self_mover (24 24) ())
		(Duration (47 47) (11))
	)
)
(15 Duration_description (60 60)
	(
		(Eventuality (29 29) (5))
	)
)
(16 Change_posture (65 66)
	(
		(Protagonist (24 24) ())
	)
)
(17 Temporal_collocation (67 67)
	(
		(Trajector_event (63 63) ())
		(Trajector_event (68 69) (18))
	)
)
(18 Exercising (69 69)
	(
		(Agent (24 24) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom loved playing baseball." "He had a big game." "He was up to hit." "He hit a long drive." "He was able to make a run and win the game.")
; events
(
(0 Competition (2 2)
	(
		(Participants (0 0) ())
		(Competition (3 3) ())
	)
)
(1 Experiencer_focus (1 1)
	(
		(Content (3 3) ())
		(Experiencer (0 0) ())
	)
)
(2 Attack (15 15)
	(
		(Assailant (0 0) ())
	)
)
(3 Motion_noise (21 21)
	(
		(Theme (0 0) ())
		(Duration (3 3) ())
	)
)
(4 Duration_description (20 20)
	(
		(Eventuality (21 21) (3))
	)
)
(5 Finish_competition (31 31)
	(
		(Competitor (0 0) ())
		(Competition (33 33) ())
	)
)
(6 Capability (25 25)
	(
		(Entity (0 0) ())
		(Event (29 29) (7))
	)
)
(7 Beat_opponent (29 29)
	(
		(Winner (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("I was hanging out with my friend." "He pulled in front of my car." "I went off the road." "There was mud flying." "Then I got back in front.")
; events
(
(0 Personal_relationship (6 6)
	(
		(Partner_1 (6 6) ())
		(Partner_2 (5 5) ())
	)
)
(1 Personal_relationship (2 3)
	(
		(Partner_1 (0 0) ())
		(Partner_2 (6 6) (0))
	)
)
(2 Cause_harm (9 9)
	(
		(Agent (0 0) ())
		(Place (11 11) ())
	)
)
(3 Vehicle (14 14)
	(
		(Possessor (5 5) ())
		(Vehicle (6 6) (0))
	)
)
(4 Motion (17 17)
	(
		(Theme (0 0) ())
		(Source (20 20) (5))
	)
)
(5 Roadways (20 20)
	(
		(Material (0 0) ())
	)
)
(6 Motion (25 25)
	(
		(Theme (24 24) ())
	)
)
(7 Existence (22 23)
	(
		(Entity (24 24) ())
		(Entity (25 25) (6))
	)
)
(8 Non-gradable_proximity (31 32)
	(
		(Figure (28 28) ())
		(Temporal_profile (25 25) (6))
	)
)
)
)
(
; story sentence text for lookup
("Fred wanted a phone." "He never had had one before." "So he went and got one." "But when he turned it on it didn't work." "He was duped.")
; events
(
(0 Desiring (1 1)
	(
		(Focal_participant (3 3) ())
		(Experiencer (0 0) ())
	)
)
(1 Possession (8 8)
	(
		(Owner (0 0) ())
		(Possession (9 9) ())
	)
)
(2 Motion (14 14)
	(
		(Theme (13 13) ())
	)
)
(3 Getting (16 16)
	(
		(Recipient (13 13) ())
		(Theme (17 17) ())
	)
)
(4 Usefulness (28 28)
	(
		(Entity (25 25) ())
	)
)
(5 Closure (22 24)
	(
		(Agent (21 21) ())
		(Containing_object (9 9) ())
	)
)
(6 Manipulate_into_doing (32 32)
	(
		(Victim (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Devin got fed up with his bank." "He called them for help." "They didn't respond." "He took his money out." "He found a new bank.")
; events
(
(0 Transition_to_state (1 1)
	(
		(Final_quality (6 6) ())
		(Entity (0 0) ())
	)
)
(1 Emotion_directed (2 3)
	(
		(Stimulus (6 6) ())
		(Experiencer (0 0) ())
	)
)
(2 Contacting (9 9)
	(
		(Communicator (0 0) ())
		(Addressee (10 10) ())
		(Purpose (12 12) (3))
	)
)
(3 Assistance (12 12)
	(
	)
)
(4 Communication_response (17 17)
	(
		(Speaker (0 0) ())
	)
)
(5 Removing (20 20)
	(
		(Theme (22 22) (6))
		(Agent (0 0) ())
		(Source (23 23) ())
	)
)
(6 Money (22 22)
	(
		(Possessor (10 10) ())
		(Money (22 22) ())
	)
)
(7 Locating (26 26)
	(
		(Perceiver (0 0) ())
		(Sought_entity (29 29) ())
	)
)
(8 Age (28 28)
	(
		(Entity (23 23) ())
		(Age (22 22) (6))
	)
)
)
)
(
; story sentence text for lookup
("I was jogging down the road." "My dad lives out of town." "He saw me." "He picked me up." "We went for some Chinese food.")
; events
(
(0 Self_motion (2 2)
	(
		(Self_mover (0 0) ())
		(Path (5 5) (1))
	)
)
(1 Roadways (5 5)
	(
		(Roadway (5 5) ())
	)
)
(2 Residence (9 9)
	(
		(Location (5 5) (1))
		(Resident (8 8) (3))
	)
)
(3 Kinship (8 8)
	(
		(Ego (0 0) ())
		(Alter (8 8) ())
	)
)
(4 Political_locales (12 12)
	(
		(Locale (5 5) (1))
	)
)
(5 Perception_experience (15 15)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (16 16) ())
	)
)
(6 Food (28 28)
	(
		(Food (5 5) (1))
		(Type (27 27) (8))
	)
)
(7 Motion (24 24)
	(
		(Theme (0 0) ())
		(Purpose (28 28) (6))
	)
)
(8 Origin (27 27)
	(
		(Entity (5 5) (1))
		(Origin (27 27) ())
	)
)
)
)
(
; story sentence text for lookup
("I had some wine a while ago." "I wanted to like it." "But it tasted so bad." "I wanted to vomit." "I never wanted to drink again.")
; events
(
(0 Quantified_mass (4 5)
	(
		(Mass (5 5) ())
	)
)
(1 Ingestion (1 1)
	(
		(Ingestibles (3 3) (3))
		(Ingestor (0 0) ())
		(Time (4 6) (0 2))
	)
)
(2 Time_vector (6 6)
	(
		(Event (0 0) ())
		(Distance (4 5) (0))
	)
)
(3 Food (3 3)
	(
	)
)
(4 Desiring (9 9)
	(
		(Experiencer (0 0) ())
		(Event (12 12) ())
	)
)
(5 Experiencer_focus (11 11)
	(
		(Experiencer (0 0) ())
		(Content (12 12) ())
	)
)
(6 Give_impression (16 16)
	(
		(Appraisal (17 18) ())
		(Phenomenon (15 15) ())
	)
)
(7 Desiring (21 21)
	(
		(Experiencer (0 0) ())
		(Event (3 3) (3))
	)
)
(8 Excreting (23 23)
	(
		(Excreter (0 0) ())
	)
)
(9 Desiring (27 27)
	(
		(Experiencer (0 0) ())
		(Purpose_of_event (28 30) (11))
	)
)
(10 Negation (26 26)
	(
		(Negated_proposition (0 0) ())
		(Negated_proposition (27 30) (9 11))
	)
)
(11 Ingestion (29 29)
	(
		(Ingestor (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Jack went to his friend's place." "The house was huge." "It made Jack feel poor." "Jack left early." "Jack stopped talking to that friend.")
; events
(
(0 Motion (1 1)
	(
		(Theme (0 0) ())
		(Goal (6 6) (2))
	)
)
(1 Personal_relationship (4 4)
	(
		(Partner_1 (4 4) ())
		(Partner_2 (3 3) ())
	)
)
(2 Locale (6 6)
	(
		(Locale (6 6) ())
		(Container_possessor (3 5) (1))
	)
)
(3 Buildings (9 9)
	(
		(Building (9 9) ())
	)
)
(4 Size (11 11)
	(
		(Entity (9 9) (3))
	)
)
(5 Causation (14 14)
	(
		(Cause (0 0) ())
		(Affected (15 15) ())
		(Effect (16 17) (6 7))
	)
)
(6 Wealthiness (17 17)
	(
		(Person (15 15) ())
	)
)
(7 Feeling (16 16)
	(
		(Experiencer (15 15) ())
		(Emotional_state (4 4) (1))
	)
)
(8 Departing (20 20)
	(
		(Theme (0 0) ())
		(Time (15 15) ())
	)
)
(9 Chatting (25 25)
	(
		(Interlocutor_1 (0 0) ())
		(Interlocutor_2 (3 5) (1))
	)
)
(10 Activity_stop (24 24)
	(
		(Agent (0 0) ())
		(Activity (28 28) (11))
	)
)
(11 Personal_relationship (28 28)
	(
		(Partner_1 (28 28) ())
	)
)
)
)
(
; story sentence text for lookup
("I was afraid of my granddad's horse." "It was behind a fence." "I went in there by myself once." "It reared up on its hind legs." "I ran away quickly.")
; events
(
(0 Kinship (5 5)
	(
		(Alter (5 5) ())
		(Ego (4 4) ())
	)
)
(1 Experiencer_focus (2 2)
	(
		(Experiencer (0 0) ())
		(Content (7 7) (2))
	)
)
(2 Animals (7 7)
	(
		(Descriptor (4 6) (0))
		(Animal (7 7) ())
	)
)
(3 Non-gradable_proximity (11 11)
	(
		(Figure (0 0) ())
		(Ground (13 13) ())
	)
)
(4 Motion (16 16)
	(
		(Goal (17 18) ())
		(Theme (0 0) ())
		(Depictive (20 20) ())
	)
)
(5 Body_parts (29 29)
	(
		(Body_part (29 29) ())
		(Possessor (4 4) ())
		(Orientational_location (5 5) (0))
	)
)
(6 Part_orientational (28 28)
	(
		(Part (29 29) (5))
		(Whole (4 4) ())
	)
)
(7 Motion_noise (24 25)
	(
		(Theme (0 0) ())
		(Depictive (29 29) (5))
	)
)
(8 Self_motion (32 32)
	(
		(Self_mover (0 0) ())
		(Source (33 33) ())
		(Speed (34 34) ())
	)
)
)
)
(
; story sentence text for lookup
("I have three good apples." "One is red, and two are yellow." "I will give you the red one." "I see a big red apple in the tree.")
; events
(
(0 Food (4 4)
	(
		(Descriptor (3 3) (3))
	)
)
(1 Cardinal_numbers (2 2)
	(
		(Number (2 2) ())
		(Entity (4 4) (0))
	)
)
(2 Possession (1 1)
	(
		(Owner (0 0) ())
		(Possession (4 4) (0))
	)
)
(3 Desirability (3 3)
	(
		(Evaluee (4 4) (0))
	)
)
(4 Color (13 13)
	(
		(Color (13 13) ())
		(Entity (11 11) (6))
	)
)
(5 Color (8 8)
	(
		(Entity (0 0) ())
		(Color (2 2) (1))
	)
)
(6 Cardinal_numbers (11 11)
	(
		(Number (11 11) ())
	)
)
(7 Giving (17 17)
	(
		(Donor (0 0) ())
		(Theme (21 21) ())
		(Recipient (3 3) (3))
	)
)
(8 Color (20 20)
	(
		(Color (11 11) (6))
		(Entity (21 21) ())
	)
)
(9 Food (28 28)
	(
		(Descriptor (4 4) (0))
	)
)
(10 Perception_experience (24 24)
	(
		(Perceiver_passive (0 0) ())
		(Ground (31 31) ())
		(Phenomenon (28 28) (9))
	)
)
(11 Color (27 27)
	(
		(Entity (11 11) (6))
		(Color (4 4) (0))
	)
)
(12 Size (26 26)
	(
		(Entity (28 28) (9))
	)
)
)
)
(
; story sentence text for lookup
("Martha wanted to go to the fair." "So off she went." "When she got there she met her friends." "They had fun." "They stayed for three hours.")
; events
(
(0 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (6 6) (1))
	)
)
(1 Social_event (6 6)
	(
		(Host (0 0) ())
		(Social_event (6 6) ())
	)
)
(2 Motion (3 3)
	(
		(Theme (0 0) ())
		(Goal (6 6) (1))
	)
)
(3 Motion (11 11)
	(
		(Theme (10 10) ())
		(Source (9 9) ())
	)
)
(4 Arriving (15 15)
	(
		(Theme (9 9) ())
		(Goal (16 16) ())
	)
)
(5 Make_acquaintance (18 18)
	(
		(Individual_2 (20 20) (6))
		(Individual_1 (17 17) ())
	)
)
(6 Personal_relationship (20 20)
	(
		(Partner_1 (20 20) ())
		(Partner_2 (6 6) (1))
	)
)
(7 Stimulus_focus (24 24)
	(
		(Stimulus (0 0) ())
	)
)
(8 Temporary_stay (27 27)
	(
		(Guest (0 0) ())
		(Duration (30 30) (10))
	)
)
(9 Cardinal_numbers (29 29)
	(
		(Unit (17 17) ())
		(Number (16 16) ())
	)
)
(10 Calendric_unit (30 30)
	(
		(Unit (17 17) ())
		(Count (16 16) ())
	)
)
)
)
(
; story sentence text for lookup
("One, two, three mice!" "One mouse is on a table." "Two mice are near the table." "The mouse on the table is eating a bun." "The mice near the table hear a cat, I think." "Run, mice, run; a cat is near." "Do you hear her?" "She wants a mouse." "A mouse has a long body, and a long tail." "A mouse has two round ears.")
; events
(
(0 Cardinal_numbers (4 4)
	(
		(Entity (5 5) ())
		(Number (4 4) ())
	)
)
(1 Locative_relation (17 17)
	(
		(Ground (19 19) ())
		(Figure (15 15) ())
	)
)
(2 Food (29 29)
	(
	)
)
(3 Ingestion (27 27)
	(
		(Ingestibles (29 29) (2))
		(Ingestor (22 22) ())
	)
)
(4 Animals (38 38)
	(
		(Animal (38 38) ())
	)
)
(5 Awareness (41 41)
	(
		(Cognizer (40 40) ())
		(Content (32 32) ())
	)
)
(6 Part_orientational (35 35)
	(
		(Part (4 4) (0))
	)
)
(7 Perception_experience (36 36)
	(
		(Phenomenon (38 38) (4))
		(Perceiver_passive (22 22) ())
	)
)
(8 Self_motion (43 43)
	(
	)
)
(9 Fleeing (47 47)
	(
		(Self_mover (45 45) ())
	)
)
(10 Gradable_proximity (52 52)
	(
		(Figure (38 38) (4))
	)
)
(11 Perception_experience (56 56)
	(
		(Perceiver_passive (55 55) ())
		(Phenomenon (57 57) ())
	)
)
(12 Desiring (60 60)
	(
		(Focal_participant (62 62) ())
		(Experiencer (59 59) ())
	)
)
(13 Body_parts (69 69)
	(
		(Body_part (5 5) ())
		(Descriptor (4 4) (0))
		(Possessor (15 15) ())
	)
)
(14 Measurable_attributes (73 73)
	(
		(Entity (74 74) (16))
	)
)
(15 Measurable_attributes (68 68)
	(
		(Entity (5 5) ())
		(Attribute (4 4) (0))
	)
)
(16 Body_parts (74 74)
	(
		(Descriptor (40 40) ())
		(Body_part (74 74) ())
		(Possessor (15 15) ())
	)
)
(17 Body_parts (81 81)
	(
		(Body_part (5 5) ())
		(Descriptor (4 4) (0))
		(Possessor (15 15) ())
	)
)
(18 Possession (78 78)
	(
		(Possession (81 81) (17))
		(Owner (15 15) ())
	)
)
(19 Shapes (80 80)
	(
		(Substance (5 5) ())
		(Shape (4 4) (0))
	)
)
(20 Cardinal_numbers (79 79)
	(
		(Entity (19 19) ())
		(Number (57 57) ())
	)
)
)
)
(
; story sentence text for lookup
("The cat ran out of food." "I had no more in my house." "I bought some more from the store." "I filled up my cat's bowl of food." "The cat ate his food.")
; events
(
(0 Food (5 5)
	(
	)
)
(1 Possession (8 8)
	(
		(Owner (7 7) ())
		(Possession (10 10) ())
	)
)
(2 Buildings (13 13)
	(
		(Building (13 13) ())
	)
)
(3 Commerce_buy (16 16)
	(
		(Goods (18 18) (5))
		(Buyer (7 7) ())
		(Seller (21 21) (4))
	)
)
(4 Businesses (21 21)
	(
		(Business (13 13) (2))
	)
)
(5 Increment (18 18)
	(
		(Increment (17 17) ())
		(Added_set (18 18) ())
	)
)
(6 Filling (24 25)
	(
		(Agent (7 7) ())
		(Goal (29 29) (7))
		(Theme (31 31) (8))
	)
)
(7 Containers (29 29)
	(
		(Container (13 13) (2))
		(Owner (26 28) ())
		(Contents (31 31) (8))
	)
)
(8 Food (31 31)
	(
		(Food (31 31) ())
	)
)
(9 Ingestion (35 35)
	(
		(Ingestibles (37 37) (10))
		(Ingestor (34 34) ())
	)
)
(10 Food (37 37)
	(
	)
)
)
)
(
; story sentence text for lookup
("A dog runs." "The dog is black." "It is a large, black dog." "Is it Tom's black dog?" "It is my black dog." "My large, black dog runs.")
; events
(
(0 Self_motion (2 2)
	(
		(Self_mover (1 1) ())
	)
)
(1 Color (7 7)
	(
		(Color (7 7) ())
		(Entity (1 1) ())
	)
)
(2 Animals (15 15)
	(
		(Animal (9 9) ())
		(Animal (15 15) ())
		(Descriptor (14 14) (3))
		(Descriptor (7 7) (1))
	)
)
(3 Color (14 14)
	(
		(Entity (15 15) (2))
		(Color (14 14) ())
	)
)
(4 Size (12 12)
	(
		(Entity (15 15) (2))
	)
)
(5 Color (21 21)
	(
		(Entity (14 14) (3))
		(Color (21 21) ())
		(Entity (19 20) ())
	)
)
(6 Animals (22 22)
	(
		(Animal (14 14) (3))
		(Descriptor (21 21) (5))
		(Animal (19 20) ())
	)
)
(7 Color (27 27)
	(
		(Entity (21 21) (5))
		(Color (7 7) (1))
	)
)
(8 Size (31 31)
	(
		(Entity (21 21) (5))
	)
)
(9 Color (33 33)
	(
		(Entity (21 21) (5))
		(Color (7 7) (1))
	)
)
(10 Self_motion (35 35)
	(
		(Self_mover (30 34) (8 9))
	)
)
)
)
(
; story sentence text for lookup
("The man went to a cafeteria." "He got his lunch." "He sat down by himself." "A woman asked if she could sit down." "The woman became a new friend.")
; events
(
(0 Buildings (5 5)
	(
	)
)
(1 Motion (2 2)
	(
		(Goal (5 5) (0))
		(Theme (1 1) (2))
	)
)
(2 People (1 1)
	(
		(Person (1 1) ())
	)
)
(3 Change_posture (13 13)
	(
		(Protagonist (12 12) ())
		(Direction (14 14) ())
		(Depictive (16 16) ())
	)
)
(4 Questioning (20 20)
	(
		(Message (22 22) ())
		(Speaker (1 1) (2))
	)
)
(5 People (19 19)
	(
		(Person (1 1) (2))
	)
)
(6 Change_posture (24 25)
	(
		(Protagonist (22 22) ())
	)
)
(7 Personal_relationship (32 32)
	(
		(Partner_1 (1 1) (2))
	)
)
(8 Becoming (29 29)
	(
		(Final_category (5 5) (0))
		(Entity (1 1) (2))
	)
)
(9 People (28 28)
	(
		(Person (1 1) (2))
	)
)
(10 Age (31 31)
	(
		(Entity (32 32) (7))
	)
)
)
)
(
; story sentence text for lookup
("The man made a date." "He was excited to go." "He got ready for the date." "He went to the meeting spot." "His date never showed up.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Emotion_directed (8 8)
	(
		(Experiencer (6 6) ())
		(Stimulus (9 10) (2))
	)
)
(2 Motion (10 10)
	(
		(Theme (6 6) ())
	)
)
(3 Locale (24 24)
	(
		(Locale (24 24) ())
		(Descriptor (23 23) (5))
	)
)
(4 Motion (20 20)
	(
		(Theme (6 6) ())
		(Goal (24 24) (3))
	)
)
(5 Discussion (23 23)
	(
	)
)
(6 Personal_relationship (27 27)
	(
		(Partner_2 (6 6) ())
		(Partner_1 (1 1) (0))
	)
)
(7 Attending (29 30)
	(
		(Agent (27 27) (6))
	)
)
)
)
(
; story sentence text for lookup
("Spencer went outside in the rain." "He put on his boots." "He stepped in his yard." "The mud made him stick." "He eventually got out.")
; events
(
(0 Motion (1 1)
	(
		(Theme (0 0) ())
		(Goal (2 2) ())
		(Result (5 5) (1))
	)
)
(1 Precipitation (5 5)
	(
		(Precipitation (5 5) ())
	)
)
(2 Dressing (8 9)
	(
		(Wearer (0 0) ())
		(Clothing (11 11) (3))
	)
)
(3 Clothing (11 11)
	(
		(Garment (11 11) ())
		(Wearer (10 10) ())
	)
)
(4 Self_motion (14 14)
	(
		(Self_mover (0 0) ())
		(Goal (17 17) ())
	)
)
)
)
(
; story sentence text for lookup
("We live on the round earth." "There is land and water on all sides of it." "Men have sailed all around it in ships." "All sails are set." "Men can sail it over the wide, wide sea.")
; events
(
(0 Spatial_contact (2 2)
	(
		(Ground (5 5) ())
		(Figure (0 0) ())
	)
)
(1 Residence (1 1)
	(
		(Resident (0 0) ())
		(Location (5 5) ())
	)
)
(2 Part_orientational (14 14)
	(
		(Part (14 14) ())
		(Whole (16 16) ())
	)
)
(3 Spatial_contact (12 12)
	(
		(Ground (14 14) (2))
		(Figure (9 11) ())
	)
)
(4 Existence (7 8)
	(
		(Entity (9 11) ())
		(Place (14 14) (2))
	)
)
(5 Self_motion (20 20)
	(
		(Depictive (25 25) (7))
		(Self_mover (0 0) ())
		(Area (5 5) ())
	)
)
(6 People (18 18)
	(
		(Person (0 0) ())
	)
)
(7 Vehicle (25 25)
	(
		(Vehicle (14 14) (2))
	)
)
(8 Quantified_mass (27 27)
	(
		(Mass (28 28) ())
		(Quantity (0 0) ())
	)
)
(9 Dimension (40 40)
	(
		(Dimension (40 40) ())
		(Object (41 41) (10))
	)
)
(10 Natural_features (41 41)
	(
		(Locale (41 41) ())
	)
)
(11 Operate_vehicle (34 34)
	(
		(Driver (0 0) ())
		(Path (41 41) (10))
		(Vehicle (35 35) ())
	)
)
(12 People (32 32)
	(
		(Person (0 0) ())
	)
)
(13 Capability (33 33)
	(
		(Entity (0 0) ())
		(Event (35 35) ())
	)
)
(14 Measurable_attributes (38 38)
	(
		(Entity (41 41) (10))
		(Attribute (38 38) ())
	)
)
)
)
(
; story sentence text for lookup
("Joe needed a new sliding door." "His old was broken." "So Joe went to the store to look for another one." "Joe found a very nice one." "Joe loved his new door.")
; events
(
(0 Completeness (4 4)
	(
		(Whole (5 5) (2))
	)
)
(1 Needing (1 1)
	(
		(Cognizer (0 0) ())
		(Dependent (5 5) (2))
	)
)
(2 Connecting_architecture (5 5)
	(
		(Descriptor (4 4) (0))
		(Part (5 5) ())
		(Descriptor (3 3) (3))
	)
)
(3 Age (3 3)
	(
		(Entity (5 5) (2))
	)
)
(4 Age (8 8)
	(
		(Entity (0 0) ())
		(Entity (8 8) ())
	)
)
(5 Increment (21 21)
	(
		(Class (22 22) ())
	)
)
(6 Motion (14 14)
	(
		(Theme (8 8) (4))
		(Goal (17 17) (7))
	)
)
(7 Businesses (17 17)
	(
		(Business (5 5) (2))
	)
)
(8 Seeking (19 19)
	(
		(Sought_entity (22 22) ())
		(Cognizer_agent (8 8) (4))
	)
)
(9 Locating (25 25)
	(
		(Perceiver (0 0) ())
		(Sought_entity (29 29) ())
	)
)
(10 Stimulus_focus (28 28)
	(
		(Stimulus (5 5) (2))
		(Degree (3 3) (3))
	)
)
(11 Experiencer_focus (32 32)
	(
		(Experiencer (0 0) ())
		(Content (35 35) (12))
	)
)
(12 Connecting_architecture (35 35)
	(
		(Whole (33 33) ())
		(Part (4 4) (0))
		(Descriptor (3 3) (3))
	)
)
(13 Age (34 34)
	(
		(Entity (4 4) (0))
	)
)
)
)
(
; story sentence text for lookup
("Hal has a red drum." "The drum is yellow." "Ned has a gun." "Max has a big flag." "It is red white and blue." "All three boys have caps.")
; events
(
(0 Possession (1 1)
	(
		(Owner (0 0) ())
		(Possession (4 4) (1))
	)
)
(1 Containers (4 4)
	(
		(Container (4 4) ())
	)
)
(2 Color (3 3)
	(
		(Entity (4 4) (1))
		(Color (3 3) ())
	)
)
(3 Containers (7 7)
	(
		(Container (7 7) ())
	)
)
(4 Color (9 9)
	(
		(Entity (7 7) (3))
	)
)
(5 Possession (12 12)
	(
		(Possession (14 14) (6))
		(Owner (0 0) ())
	)
)
(6 Weapon (14 14)
	(
		(Weapon (3 3) (2))
	)
)
(7 Possession (17 17)
	(
		(Owner (0 0) ())
		(Possession (4 4) (1))
	)
)
(8 Color (24 24)
	(
		(Entity (0 0) ())
		(Color (3 3) (2))
	)
)
(9 Color (27 27)
	(
		(Entity (0 0) ())
		(Color (27 27) ())
	)
)
(10 Color (25 25)
	(
		(Entity (0 0) ())
		(Color (24 24) (8))
	)
)
(11 Wearing (32 32)
	(
		(Clothing (4 4) (1))
		(Wearer (31 31) (12))
	)
)
(12 People_by_age (31 31)
	(
		(Person (24 24) (8))
	)
)
(13 Accoutrements (33 33)
	(
		(Accoutrement (4 4) (1))
		(Wearer (31 31) (12))
	)
)
(14 Quantified_mass (29 29)
	(
		(Individuals (31 31) (12))
	)
)
(15 Cardinal_numbers (30 30)
	(
		(Entity (24 24) (8))
		(Number (7 7) (3))
	)
)
)
)
(
; story sentence text for lookup
("A homeless man was on the street." "He asked for help." "Tina gave him a helping hand." "He was so thankful." "They both felt really good.")
; events
(
(0 Roadways (6 6)
	(
		(Roadway (6 6) ())
	)
)
(1 People (2 2)
	(
		(Descriptor (1 1) ())
		(Person (2 2) ())
	)
)
(2 Request (9 9)
	(
		(Message (11 11) (3))
		(Speaker (8 8) ())
	)
)
(3 Assistance (11 11)
	(
	)
)
(4 Body_parts (18 18)
	(
		(Body_part (18 18) ())
		(Possessor (2 2) (1))
		(Descriptor (17 17) (5))
	)
)
(5 Assistance (17 17)
	(
		(Focal_entity (18 18) (4))
	)
)
(6 Precipitation (23 23)
	(
		(Manner (8 8) ())
		(Manner (2 2) (1))
	)
)
(7 Feeling (27 27)
	(
		(Emotional_state (28 29) (8))
		(Experiencer (25 25) ())
	)
)
(8 Desirability (29 29)
	(
		(Degree (28 28) ())
		(Evaluee (25 25) ())
	)
)
)
)
(
; story sentence text for lookup
("The man found a bag on the ground." "He looked inside." "It was groceries." "He brought them home." "He made his wife dinner with them.")
; events
(
(0 Locating (2 2)
	(
		(Location (7 7) ())
		(Sought_entity (4 4) (2))
		(Perceiver (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Containers (4 4)
	(
		(Container (4 4) ())
	)
)
(3 Part_inner_outer (11 11)
	(
	)
)
(4 Perception_active (10 10)
	(
		(Perceiver_agentive (9 9) ())
		(Direction (11 11) (3))
	)
)
(5 Bringing (18 18)
	(
		(Agent (9 9) ())
		(Theme (11 11) (3))
		(Goal (20 20) ())
	)
)
(6 Cooking_creation (23 23)
	(
		(Recipient (24 25) (7))
		(Cook (9 9) ())
		(Produced_food (4 4) (2))
	)
)
(7 Personal_relationship (25 25)
	(
		(Partner_2 (11 11) (3))
		(Partner_1 (20 20) ())
	)
)
)
)
(
; story sentence text for lookup
("The boy sat at the table." "He was expecting food." "His mom saw him sitting there." "She ignored him." "The boy made his own food.")
; events
(
(0 Posture (2 2)
	(
		(Point_of_contact (2 2) ())
		(Location (5 5) ())
		(Agent (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Expectation (9 9)
	(
		(Cognizer (7 7) ())
		(Phenomenon (10 10) ())
	)
)
(3 Perception_experience (14 14)
	(
		(Depictive (16 17) (5))
		(Phenomenon (10 10) ())
		(Perceiver_passive (1 1) (1))
	)
)
(4 Kinship (13 13)
	(
		(Ego (7 7) ())
		(Alter (1 1) (1))
	)
)
(5 Posture (16 16)
	(
		(Location (17 17) ())
		(Point_of_contact (16 16) ())
		(Agent (10 10) ())
	)
)
(6 Cooking_creation (25 25)
	(
		(Produced_food (5 5) ())
		(Cook (1 1) (1))
	)
)
(7 People_by_age (24 24)
	(
		(Person (1 1) (1))
	)
)
(8 Food (28 28)
	(
	)
)
)
)
(
; story sentence text for lookup
("Bill was at a stop light." "The light was on red." "Billy began to look around while waiting." "He suddenly heard a horn behind him." "The light had turned green.")
; events
(
(0 Activity_start (14 14)
	(
		(Agent (13 13) ())
		(Activity (15 17) (2))
		(Time (18 19) (1))
	)
)
(1 Waiting (19 19)
	(
		(Protagonist (13 13) ())
	)
)
(2 Perception_active (16 16)
	(
		(Perceiver_agentive (13 13) ())
		(Direction (17 17) ())
	)
)
(3 Perception_experience (23 23)
	(
		(Perceiver_passive (13 13) ())
		(Manner (22 22) ())
		(State (18 19) (1))
		(Phenomenon (25 25) ())
	)
)
(4 Color (33 33)
	(
		(Color (17 17) ())
		(Entity (30 30) ())
	)
)
(5 Becoming (32 32)
	(
		(Final_quality (17 17) ())
		(Entity (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("Here is John with his ball." "He and Tyke are playing ball." "John likes to play ball with Tyke." "John can catch the ball." "Tyke can catch it, too." "John rolls the ball to Tyke." "Tyke takes the ball to John.")
; events
(
(0 Spatial_co-location (0 0)
	(
		(Figure (2 2) ())
	)
)
(1 Accoutrements (5 5)
	(
		(Accoutrement (5 5) ())
		(Wearer (4 4) ())
	)
)
(2 Competition (11 11)
	(
		(Participants (7 7) ())
		(Competition (5 5) (1))
	)
)
(3 Experiencer_focus (15 15)
	(
		(Experiencer (14 14) ())
		(Content (18 18) ())
	)
)
(4 Competition (17 17)
	(
		(Participants (14 14) ())
		(Participants (20 20) ())
		(Competition (4 4) ())
	)
)
(5 Capability (29 29)
	(
		(Event (31 31) ())
		(Entity (14 14) ())
	)
)
(6 Body_movement (36 36)
	(
		(Agent (14 14) ())
		(Body_part (31 31) ())
		(Goal (40 40) ())
	)
)
(7 Containers (38 38)
	(
		(Container (38 38) ())
	)
)
)
)
(
; story sentence text for lookup
("I see a girl." "I see a boy." "I see a boy and a girl." "The boy can see the girl." "I can see the girl and the boy." "I can see the girl.")
; events
(
(0 Perception_experience (1 1)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (3 3) (1))
	)
)
(1 People (3 3)
	(
		(Person (3 3) ())
	)
)
(2 Perception_experience (6 6)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (3 3) (1))
	)
)
(3 People_by_age (8 8)
	(
		(Person (3 3) (1))
	)
)
(4 Perception_experience (11 11)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (13 13) (6))
	)
)
(5 People (16 16)
	(
		(Person (16 16) ())
	)
)
(6 People_by_age (13 13)
	(
		(Person (3 3) (1))
	)
)
(7 Possibility (20 20)
	(
		(Possible_event (23 23) (9))
		(Possible_event (19 19) (8))
	)
)
(8 People_by_age (19 19)
	(
		(Person (19 19) ())
	)
)
(9 People (23 23)
	(
		(Person (23 23) ())
	)
)
(10 Perception_experience (21 21)
	(
		(Phenomenon (23 23) (9))
		(Perceiver_passive (19 19) (8))
	)
)
(11 Perception_experience (27 27)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (29 29) (13))
	)
)
(12 Possibility (26 26)
	(
		(Possible_event (0 0) ())
		(Possible_event (29 29) (13))
	)
)
(13 People (29 29)
	(
		(Person (29 29) ())
	)
)
(14 People_by_age (32 32)
	(
		(Person (32 32) ())
	)
)
(15 Perception_experience (36 36)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (38 38) (17))
	)
)
(16 Possibility (35 35)
	(
		(Possible_event (0 0) ())
		(Possible_event (3 3) (1))
	)
)
(17 People (38 38)
	(
		(Person (29 29) (13))
	)
)
)
)
(
; story sentence text for lookup
("The man found the answer." "He told everyone he could." "People did not like the answer." "They got angry at the man." "They hung the man in the street.")
; events
(
(0 Locating (2 2)
	(
		(Sought_entity (4 4) (2))
		(Perceiver (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Communication_response (4 4)
	(
		(Speaker (1 1) (1))
	)
)
(3 Telling (7 7)
	(
		(Speaker (6 6) ())
		(Addressee (8 8) ())
		(Message (4 4) (2))
	)
)
(4 Possibility (10 10)
	(
		(Possible_event (8 8) ())
		(Possible_event (9 9) ())
	)
)
(5 People (12 12)
	(
		(Person (6 6) ())
	)
)
(6 Communication_response (17 17)
	(
	)
)
(7 Experiencer_focus (15 15)
	(
		(Content (17 17) (6))
		(Experiencer (6 6) ())
	)
)
(8 Emotion_directed (21 21)
	(
		(Experiencer (6 6) ())
		(Stimulus (24 24) (10))
	)
)
(9 Transition_to_state (20 20)
	(
		(Entity (6 6) ())
		(Final_quality (24 24) (10))
	)
)
(10 People (24 24)
	(
		(Person (24 24) ())
	)
)
(11 Placing (27 27)
	(
		(Theme (29 29) (13))
		(Agent (6 6) ())
		(Goal (32 32) (12))
	)
)
(12 Roadways (32 32)
	(
		(Roadway (32 32) ())
	)
)
(13 People (29 29)
	(
		(Person (9 9) ())
	)
)
)
)
(
; story sentence text for lookup
("Jill bought a new dress." "She tried it on when she got home." "The dress didn't fit." "Jill couldn't find the receipt." "Jill gave the dress to one of her friends.")
; events
(
(0 Clothing (4 4)
	(
		(Garment (4 4) ())
		(Descriptor (3 3) (2))
	)
)
(1 Commerce_buy (1 1)
	(
		(Goods (4 4) (0))
		(Buyer (0 0) ())
	)
)
(2 Age (3 3)
	(
		(Entity (4 4) (0))
	)
)
(3 Foreign_or_domestic_country (13 13)
	(
		(Current_country (13 13) ())
	)
)
(4 Arriving (12 12)
	(
		(Theme (11 11) ())
		(Goal (13 13) (3))
	)
)
(5 Trying_out (7 9)
	(
		(Evaluator (0 0) ())
		(Entity (8 8) ())
		(Time (11 11) ())
	)
)
(6 Clothing (16 16)
	(
		(Garment (16 16) ())
	)
)
(7 Compatibility (19 19)
	(
		(Item_1 (16 16) (6))
	)
)
(8 Possibility (22 22)
	(
		(Possible_event (26 26) ())
		(Possible_event (0 0) ())
	)
)
(9 Remembering_experience (24 24)
	(
		(State (26 26) ())
		(Cognizer (0 0) ())
	)
)
(10 Negation (23 23)
	(
		(Negated_proposition (26 26) ())
		(Negated_proposition (16 16) (6))
	)
)
(11 Giving (29 29)
	(
		(Recipient (33 33) ())
		(Theme (31 31) (12))
		(Donor (0 0) ())
	)
)
(12 Clothing (31 31)
	(
		(Garment (3 3) (2))
	)
)
(13 Personal_relationship (36 36)
	(
		(Partner_2 (13 13) (3))
		(Partner_1 (36 36) ())
	)
)
)
)
(
; story sentence text for lookup
("I went out to eat yesterday." "I later had leftovers." "I didn't like the leftovers." "They did not taste good," "I threw them out.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Motion (1 1)
	(
		(Time (5 5) (0))
		(Theme (0 0) ())
		(Goal (2 2) ())
		(Purpose (3 4) (2))
	)
)
(2 Ingestion (4 4)
	(
		(Ingestor (0 0) ())
	)
)
(3 Ingestion (9 9)
	(
		(Ingestor (0 0) ())
		(Ingestibles (10 10) (5))
	)
)
(4 Time_vector (8 8)
	(
		(Event (0 0) ())
		(Event (10 10) (5))
		(Direction (8 8) ())
	)
)
(5 Location_of_light (10 10)
	(
	)
)
(6 Location_of_light (17 17)
	(
		(Figure (5 5) (0))
	)
)
(7 Experiencer_focus (15 15)
	(
		(Experiencer (0 0) ())
		(Content (17 17) (6))
	)
)
(8 Negation (14 14)
	(
		(Negated_proposition (17 17) (6))
		(Negated_proposition (12 12) ())
	)
)
(9 Give_impression (22 22)
	(
		(Phenomenon (0 0) ())
		(Appraisal (23 23) ())
	)
)
(10 Cause_motion (26 26)
	(
		(Agent (0 0) ())
		(Source (10 10) (5))
		(Theme (2 2) ())
	)
)
)
)
(
; story sentence text for lookup
("I was coming through a door at work." "I saw my friend Amy." "I almost ran into her." "She was wearing a purple two piece." "We did not say anything.")
; events
(
(0 Arriving (2 2)
	(
		(Theme (0 0) ())
		(Goal (7 7) (3))
		(Path (5 5) (1))
	)
)
(1 Connecting_architecture (5 5)
	(
		(Source (7 7) (3))
		(Part (5 5) ())
	)
)
(2 Locative_relation (6 6)
	(
		(Figure (5 5) (1))
		(Ground (7 7) (3))
	)
)
(3 Locale_by_use (7 7)
	(
		(Locale (7 7) ())
	)
)
(4 Perception_experience (10 10)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (12 12) (5))
	)
)
(5 Personal_relationship (12 12)
	(
		(Partner_2 (11 11) ())
		(Partner_1 (13 13) ())
	)
)
(6 Self_motion (17 17)
	(
		(Self_mover (0 0) ())
		(Goal (19 19) ())
	)
)
(7 Level_of_light (25 25)
	(
		(Location (27 27) ())
	)
)
(8 Wearing (23 23)
	(
		(Wearer (0 0) ())
		(Clothing (27 27) ())
	)
)
(9 Clothing (26 27)
	(
		(Descriptor (13 13) ())
		(Garment (27 27) ())
	)
)
(10 Text_creation (32 32)
	(
		(Author (0 0) ())
		(Text (13 13) ())
	)
)
)
)
(
; story sentence text for lookup
("Mike was at a ball game." "He needed a snack." "He went to buy a snack." "On the way back from getting a snack." "Mike fell down and broke his arm.")
; events
(
(0 Needing (8 8)
	(
		(Requirement (10 10) (1))
		(Cognizer (7 7) ())
	)
)
(1 Food (10 10)
	(
	)
)
(2 Motion (13 13)
	(
		(Theme (7 7) ())
		(Purpose (17 17) (3))
	)
)
(3 Food (17 17)
	(
	)
)
(4 Commerce_buy (15 15)
	(
		(Goods (17 17) (3))
		(Buyer (7 7) ())
	)
)
(5 Getting (24 24)
	(
		(Theme (26 26) ())
	)
)
(6 Experience_bodily_harm (32 32)
	(
		(Experiencer (7 7) ())
		(Body_part (34 34) (8))
	)
)
(7 Motion_directional (29 29)
	(
		(Theme (7 7) ())
		(Path (30 30) ())
		(Direction (29 29) ())
	)
)
(8 Body_parts (34 34)
	(
		(Body_part (34 34) ())
		(Possessor (33 33) ())
	)
)
)
)
(
; story sentence text for lookup
("Reese wanted to be more active." "He mostly sat around the house." "He wanted to be more fit." "He started playing one hour outside a day." "He is much more fit now.")
; events
(
(0 Desiring (1 1)
	(
		(Event (2 5) (1))
		(Experiencer (0 0) ())
	)
)
(1 Being_active (5 5)
	(
		(Degree (4 4) ())
		(Agent (0 0) ())
	)
)
(2 Posture (9 9)
	(
		(Agent (0 0) ())
		(Point_of_contact (9 9) ())
		(Duration (8 8) ())
		(Location (12 12) (3))
	)
)
(3 Buildings (12 12)
	(
		(Building (12 12) ())
	)
)
(4 Desiring (15 15)
	(
		(Experiencer (0 0) ())
		(Event (2 5) (1))
	)
)
(5 Body_description_holistic (19 19)
	(
		(Individual (0 0) ())
		(Degree (4 4) ())
	)
)
(6 Perception_experience (23 23)
	(
		(Perceiver_passive (0 0) ())
	)
)
(7 Activity_start (22 22)
	(
		(Agent (0 0) ())
		(Activity (9 9) (2))
		(Time (25 25) (8))
	)
)
(8 Calendric_unit (25 25)
	(
		(Unit (4 4) ())
		(Count (24 24) ())
	)
)
(9 Calendric_unit (28 28)
	(
		(Unit (28 28) ())
	)
)
(10 Temporal_collocation (35 35)
	(
		(Trajector_event (30 30) ())
	)
)
(11 Proportional_quantity (32 32)
	(
		(Denoted_quantity (9 9) (2))
		(Mass (33 34) (12))
	)
)
(12 Body_description_holistic (34 34)
	(
		(Degree (32 33) (11))
		(Individual (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom liked Tina." "He wanted to ask her to court her." "She said yes." "He was so excited." "They made it official.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (2 2) ())
	)
)
(1 Desiring (5 5)
	(
		(Experiencer (0 0) ())
		(Event (8 8) ())
	)
)
(2 Personal_relationship (10 10)
	(
		(Partner_1 (8 8) ())
		(Partner_2 (11 11) ())
	)
)
(3 Request (7 7)
	(
		(Speaker (0 0) ())
		(Addressee (8 8) ())
		(Message (11 11) ())
	)
)
(4 Statement (14 14)
	(
		(Speaker (0 0) ())
		(Message (2 2) ())
	)
)
(5 Emotion_directed (20 20)
	(
		(Experiencer (0 0) ())
		(Degree (2 2) ())
	)
)
(6 Cause_change (23 23)
	(
		(Agent (0 0) ())
		(Entity (2 2) ())
		(Final_category (25 25) ())
	)
)
)
)
(
; story sentence text for lookup
("A violinist liked to play." "She never played acoustically." "Her friend told her to try it." "She loved the sound." "She records it.")
; events
(
(0 Experiencer_focus (2 2)
	(
		(Experiencer (1 1) ())
		(Content (3 4) (1))
	)
)
(1 Hunting (4 4)
	(
		(Hunter (1 1) ())
	)
)
(2 Cause_to_make_noise (8 8)
	(
		(Agent (6 6) ())
		(Depictive (9 9) ())
	)
)
(3 Negation (7 7)
	(
		(Negated_proposition (6 6) ())
		(Negated_proposition (8 9) (2))
	)
)
(4 Request (13 13)
	(
		(Message (17 17) ())
		(Addressee (9 9) ())
		(Speaker (1 1) ())
	)
)
(5 Personal_relationship (12 12)
	(
		(Partner_2 (6 6) ())
		(Partner_1 (12 12) ())
	)
)
(6 Attempt_means (16 16)
	(
		(Means (17 17) ())
		(Agent (9 9) ())
	)
)
(7 Experiencer_focus (20 20)
	(
		(Content (8 9) (2))
		(Experiencer (6 6) ())
	)
)
(8 Sensation (22 22)
	(
		(Perceiver_passive (6 6) ())
	)
)
)
)
(
; story sentence text for lookup
("A farmer got up in the morning." "He put his boots on." "He went outside." "He milked the cow." "He went back to bed.")
; events
(
(0 People_by_vocation (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Calendric_unit (6 6)
	(
		(Unit (6 6) ())
	)
)
(2 Dressing (9 12)
	(
		(Wearer (8 8) ())
		(Clothing (11 11) ())
	)
)
(3 Motion (15 15)
	(
		(Theme (8 8) ())
		(Goal (16 16) ())
	)
)
(4 Ingestion (19 19)
	(
		(Ingestor (8 8) ())
		(Ingestibles (11 11) ())
	)
)
(5 Food (21 21)
	(
	)
)
(6 Motion (24 24)
	(
		(Theme (8 8) ())
		(Direction (16 16) ())
		(Goal (27 27) (7))
	)
)
(7 Building_subparts (27 27)
	(
	)
)
)
)
(
; story sentence text for lookup
("The man shopped for pants." "He couldn't find any that fit." "He found a big and tall store." "He found some pants that fit." "He bought some pants there.")
; events
(
(0 Shopping (2 2)
	(
		(Goods (4 4) (1))
		(Shopper (1 1) (2))
	)
)
(1 Clothing (4 4)
	(
		(Garment (4 4) ())
	)
)
(2 People (1 1)
	(
		(Person (1 1) ())
	)
)
(3 Suitability (12 12)
	(
		(Evaluee (11 11) ())
		(Evaluee (4 4) (1))
	)
)
(4 Locating (9 9)
	(
		(Perceiver (6 6) ())
		(Sought_entity (12 12) (3))
	)
)
(5 Locating (15 15)
	(
		(Perceiver (6 6) ())
		(Sought_entity (20 20) (7))
	)
)
(6 Measurable_attributes (19 19)
	(
		(Entity (20 20) (7))
	)
)
(7 Businesses (20 20)
	(
		(Business (20 20) ())
		(Descriptor (17 19) (6 8))
	)
)
(8 Size (17 17)
	(
		(Entity (20 20) (7))
	)
)
(9 Locating (23 23)
	(
		(Perceiver (6 6) ())
		(Sought_entity (25 25) (10))
	)
)
(10 Clothing (25 25)
	(
		(Garment (25 25) ())
	)
)
(11 Compatibility (27 27)
	(
		(Item_1 (4 4) (1))
		(Item_1 (25 25) (10))
	)
)
(12 Commerce_buy (30 30)
	(
		(Buyer (6 6) ())
		(Place (4 4) (1))
		(Goods (25 25) (10))
	)
)
(13 Clothing (32 32)
	(
		(Garment (25 25) (10))
	)
)
)
)
(
; story sentence text for lookup
("What is in this monkey's hands?" "The monkey has a cocoanut." "He likes the cocoanut." "He will eat it." "The monkey is brown." "It has a large tail." "His eyes are large.")
; events
(
(0 Body_parts (6 6)
	(
		(Body_part (6 6) ())
		(Possessor (3 5) ())
	)
)
(1 Food (12 12)
	(
	)
)
(2 Have_associated (10 10)
	(
		(Topical_entity (9 9) ())
		(Entity (12 12) (1))
	)
)
(3 Experiencer_focus (15 15)
	(
		(Experiencer (14 14) ())
		(Content (17 17) (4))
	)
)
(4 Food (17 17)
	(
	)
)
(5 Ingestion (21 21)
	(
		(Ingestor (14 14) ())
		(Ingestibles (22 22) ())
	)
)
(6 Color (27 27)
	(
		(Entity (9 9) ())
	)
)
(7 Body_parts (33 33)
	(
		(Body_part (33 33) ())
		(Possessor (14 14) ())
		(Descriptor (22 22) ())
	)
)
(8 Size (32 32)
	(
		(Entity (33 33) (7))
	)
)
(9 Body_parts (36 36)
	(
		(Possessor (14 14) ())
		(Body_part (36 36) ())
	)
)
(10 Size (38 38)
	(
		(Entity (9 9) ())
	)
)
)
)
(
; story sentence text for lookup
("Here is Roy's dog, Carlo." "Carlo is standing on his hind feet." "Roy has a bun for his dog." "Beg for it!" "Beg, Carlo, beg." "See!" "It is a bun." "Will you beg for it?" "Stand, Carlo!" "That is good." "Beg, and you may have it." "Carlo, you are a good dog." "Is it fun to beg?" "It is fun for boys." "It is not fun for dogs.")
; events
(
(0 Spatial_co-location (0 0)
	(
		(Figure (4 4) (1))
	)
)
(1 Animals (4 4)
	(
		(Animal (6 6) ())
		(Descriptor (2 3) ())
	)
)
(2 Posture (10 10)
	(
		(Agent (8 8) ())
		(Point_of_contact (10 10) ())
		(Manner (14 14) (4))
	)
)
(3 Part_orientational (13 13)
	(
		(Whole (12 12) ())
		(Part (6 6) ())
	)
)
(4 Body_parts (14 14)
	(
		(Orientational_location (13 13) (3))
		(Possessor (12 12) ())
		(Body_part (6 6) ())
	)
)
(5 Possession (17 17)
	(
		(Owner (8 8) ())
		(Possession (4 4) (1))
	)
)
(6 Animals (22 22)
	(
		(Descriptor (13 13) (3))
		(Animal (6 6) ())
	)
)
(7 Body_parts (19 19)
	(
		(Possessor (8 8) ())
		(Possessor (22 22) (6))
		(Body_part (19 19) ())
	)
)
(8 Desiring (24 24)
	(
		(Focal_participant (26 26) ())
	)
)
(9 Memory (28 28)
	(
	)
)
(10 Attempt_suasion (32 32)
	(
		(Speaker (10 10) (2))
	)
)
(11 Visiting (34 34)
	(
	)
)
(12 Request (43 43)
	(
		(Speaker (42 42) ())
		(Message (45 45) ())
	)
)
(13 Change_posture (47 47)
	(
		(Protagonist (10 10) (2))
	)
)
(14 Desirability (53 53)
	(
		(Evaluee (8 8) ())
	)
)
(15 Request (55 55)
	(
	)
)
(16 Animals (69 69)
	(
		(Descriptor (13 13) (3))
		(Animal (10 10) (2))
	)
)
(17 Desirability (68 68)
	(
		(Evaluee (6 6) ())
	)
)
(18 Stimulus_focus (73 73)
	(
		(Stimulus (45 45) ())
	)
)
(19 Request (75 75)
	(
	)
)
(20 Stimulus_focus (79 79)
	(
		(Stimulus (8 8) ())
		(Experiencer (45 45) ())
	)
)
(21 People_by_age (81 81)
	(
		(Person (12 12) ())
	)
)
(22 Stimulus_focus (86 86)
	(
		(Stimulus (8 8) ())
		(Experiencer (88 88) ())
	)
)
)
)
(
; story sentence text for lookup
("Susie tried on the dress." "She found it very uncomfortable." "She wasn't sure she wanted to even wear it." "Susie put it away." "She never wore it again.")
; events
(
(0 Dressing (1 2)
	(
		(Clothing (4 4) (1))
		(Wearer (0 0) ())
	)
)
(1 Clothing (4 4)
	(
		(Garment (4 4) ())
	)
)
(2 Stimulus_focus (10 10)
	(
		(Stimulus (8 8) ())
		(Degree (9 9) ())
	)
)
(3 Coming_to_believe (7 7)
	(
		(Cognizer (0 0) ())
		(Content (8 8) ())
		(Content (4 4) (1))
	)
)
(4 Wearing (20 20)
	(
		(Clothing (21 21) ())
		(Wearer (4 4) (1))
	)
)
(5 Certainty (15 15)
	(
		(Content (16 16) ())
		(Cognizer (0 0) ())
	)
)
(6 Negation (14 14)
	(
		(Negated_proposition (16 16) ())
		(Negated_proposition (12 12) ())
	)
)
(7 Desiring (17 17)
	(
		(Experiencer (4 4) (1))
		(Event (21 21) ())
	)
)
(8 Placing (24 26)
	(
		(Theme (8 8) ())
		(Agent (0 0) ())
	)
)
(9 Wearing (30 31)
	(
		(Wearer (0 0) ())
		(Clothing (9 9) ())
	)
)
)
)
(
; story sentence text for lookup
("Mark is driving home." "Mark hits a dog in the road." "Mark gets out to see the dog." "The dog is dead." "Mark is sad he killed the dog.")
; events
(
(0 Operate_vehicle (2 2)
	(
		(Driver (0 0) ())
		(Goal (3 3) ())
	)
)
(1 Cause_impact (6 6)
	(
		(Agent (0 0) ())
		(Impactee (8 8) (2))
		(Place (11 11) (3))
	)
)
(2 Animals (8 8)
	(
		(Animal (3 3) ())
	)
)
(3 Roadways (11 11)
	(
		(Roadway (11 11) ())
	)
)
(4 Perception_active (17 17)
	(
		(Perceiver_agentive (0 0) ())
		(Phenomenon (19 19) (5))
	)
)
(5 Animals (19 19)
	(
		(Animal (11 11) (3))
	)
)
(6 Dead_or_alive (24 24)
	(
		(Protagonist (22 22) ())
	)
)
(7 Emotion_directed (28 28)
	(
		(Experiencer (0 0) ())
		(Stimulus (29 29) ())
	)
)
(8 Killing (30 30)
	(
		(Victim (19 19) (5))
		(Killer (3 3) ())
	)
)
(9 Animals (32 32)
	(
		(Animal (11 11) (3))
	)
)
)
)
(
; story sentence text for lookup
("Is this May?" "No; this is Ada." "May is not here." "Ada is sitting in May's chair." "She is looking at a fan which lies on a box.")
; events
(
(0 Calendric_unit (2 2)
	(
		(Unit (2 2) ())
	)
)
(1 Locative_relation (13 13)
	(
		(Figure (10 10) ())
		(Ground (13 13) ())
	)
)
(2 Posture (17 17)
	(
		(Agent (10 10) ())
		(Point_of_contact (2 2) (0))
		(Location (21 21) ())
	)
)
(3 Containers (33 33)
	(
		(Container (33 33) ())
	)
)
(4 Perception_active (25 25)
	(
		(Perceiver_agentive (10 10) ())
		(Phenomenon (28 28) ())
	)
)
(5 Posture (30 30)
	(
		(Agent (28 28) ())
		(Point_of_contact (30 30) ())
		(Agent (29 29) ())
		(Location (33 33) (3))
	)
)
)
)
(
; story sentence text for lookup
("I went to the mall yesterday." "I thought there was a sale." "So I showed up at the store." "There was no sale." "I was so upset.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Motion (1 1)
	(
		(Theme (0 0) ())
		(Time (5 5) (0))
		(Goal (4 4) (2))
	)
)
(2 Buildings (4 4)
	(
		(Building (4 4) ())
	)
)
(3 Awareness (8 8)
	(
		(Cognizer (0 0) ())
		(Content (9 12) (4))
	)
)
(4 Commerce_sell (12 12)
	(
	)
)
(5 Businesses (20 20)
	(
		(Business (20 20) ())
	)
)
(6 Negation (24 24)
	(
		(Negated_proposition (25 25) (7))
		(Negated_proposition (22 23) (8))
	)
)
(7 Commerce_sell (25 25)
	(
	)
)
(8 Existence (22 23)
	(
		(Entity (24 25) (6 7))
	)
)
(9 Emotion_directed (30 30)
	(
		(Experiencer (0 0) ())
		(Degree (29 29) ())
	)
)
)
)
(
; story sentence text for lookup
("The couple went to a show." "It was too loud for the girl." "She asked to leave." "The boy refused." "The girl left alone.")
; events
(
(0 Personal_relationship (1 1)
	(
		(Partners (1 1) ())
	)
)
(1 Sufficiency (9 9)
	(
		(Item (7 7) ())
		(Scale (10 10) (2))
		(Enabled_situation (13 13) (3))
	)
)
(2 Sound_level (10 10)
	(
		(Entity (7 7) ())
		(Degree (9 9) (1))
		(Attribute (10 10) ())
		(Degree (13 13) (3))
	)
)
(3 People (13 13)
	(
		(Person (13 13) ())
	)
)
(4 Request (16 16)
	(
		(Message (17 18) (5))
		(Speaker (7 7) ())
	)
)
(5 Departing (18 18)
	(
		(Theme (7 7) ())
	)
)
(6 Agree_or_refuse_to_act (22 22)
	(
		(Speaker (21 21) (7))
	)
)
(7 People_by_age (21 21)
	(
		(Person (1 1) (0))
	)
)
(8 People (25 25)
	(
		(Person (1 1) (0))
	)
)
)
)
(
; story sentence text for lookup
("Tom noticed a stray cat." "He thought it might be friendly." "Tom tried to go up and pet it." "The cat scratched at him." "Tom left it alone.")
; events
(
(0 Becoming_aware (1 1)
	(
		(Cognizer (0 0) ())
		(Phenomenon (4 4) ())
	)
)
(1 Awareness (7 7)
	(
		(Cognizer (0 0) ())
		(Content (8 8) ())
	)
)
(2 Social_interaction_evaluation (11 11)
	(
		(Behavior (8 8) ())
	)
)
(3 Likelihood (9 9)
	(
		(Hypothetical_event (10 11) (2))
		(Hypothetical_event (8 8) ())
	)
)
(4 Attempt (14 14)
	(
		(Agent (0 0) ())
		(Goal (20 20) ())
	)
)
(5 Locative_relation (17 17)
	(
		(Figure (0 0) ())
	)
)
(6 Manipulation (19 19)
	(
		(Agent (0 0) ())
		(Entity (20 20) ())
	)
)
(7 Motion (16 16)
	(
		(Theme (0 0) ())
		(Goal (17 17) (5))
	)
)
(8 Self_motion (24 24)
	(
		(Goal (26 26) ())
		(Self_mover (23 23) ())
	)
)
)
)
(
; story sentence text for lookup
("Tina was hungry." "So she decided to get ice cream." "She tried a taste." "It was good." "Tina wanted to go back.")
; events
(
(0 Biological_urge (2 2)
	(
		(Experiencer (0 0) ())
	)
)
(1 Food (9 9)
	(
	)
)
(2 Deciding (6 6)
	(
		(Decision (10 10) (4))
		(Cognizer (5 5) ())
	)
)
(3 Getting (8 8)
	(
		(Recipient (5 5) ())
		(Theme (10 10) (4))
	)
)
(4 Food (10 10)
	(
		(Type (9 9) (1))
	)
)
(5 Degree (13 13)
	(
		(Gradable_attribute (15 15) (6))
		(Gradable_attribute (0 0) ())
	)
)
(6 Sensation (15 15)
	(
		(Perceiver_passive (0 0) ())
	)
)
(7 Desirability (19 19)
	(
		(Evaluee (0 0) ())
	)
)
(8 Desiring (22 22)
	(
		(Experiencer (0 0) ())
		(Event (23 25) (9))
	)
)
(9 Motion (24 24)
	(
		(Theme (0 0) ())
		(Goal (25 25) ())
	)
)
)
)
(
; story sentence text for lookup
("Rose was at the jewelry store." "She wanted to buy a new watch." "She tried on each one." "She liked the rose gold watch the most." "She bought it and wore it home.")
; events
(
(0 Clothing (4 4)
	(
		(Garment (4 4) ())
	)
)
(1 Spatial_co-location (2 2)
	(
		(Figure (0 0) ())
		(Ground (5 5) (2))
	)
)
(2 Businesses (5 5)
	(
		(Product (4 4) (0))
		(Business (5 5) ())
	)
)
(3 Desiring (8 8)
	(
		(Experiencer (0 0) ())
		(Event (13 13) (5))
	)
)
(4 Age (12 12)
	(
		(Age (5 5) (2))
		(Entity (13 13) (5))
	)
)
(5 Accoutrements (13 13)
	(
		(Descriptor (5 5) (2))
		(Accoutrement (13 13) ())
	)
)
(6 Commerce_buy (10 10)
	(
		(Buyer (0 0) ())
		(Goods (13 13) (5))
	)
)
(7 Attempt (16 16)
	(
		(Agent (0 0) ())
		(Goal (19 19) ())
	)
)
(8 Experiencer_focus (22 22)
	(
		(Experiencer (0 0) ())
		(Degree (27 28) ())
		(Content (26 26) ())
	)
)
(9 Bringing (34 34)
	(
		(Agent (0 0) ())
		(Goal (13 13) (5))
		(Theme (5 5) (2))
	)
)
(10 Commerce_buy (31 31)
	(
		(Buyer (0 0) ())
		(Goods (32 32) ())
	)
)
)
)
(
; story sentence text for lookup
("It was a raining night." "It was too bad to go out." "So Tina had to stay home." "Tina had to cook." "She wasn't happy about that.")
; events
(
(0 Calendric_unit (4 4)
	(
		(Unit (4 4) ())
	)
)
(1 Precipitation (3 3)
	(
		(Time (4 4) (0))
	)
)
(2 Sufficiency (8 8)
	(
		(Item (6 6) ())
		(Scale (9 9) (4))
	)
)
(3 Motion (11 11)
	(
		(Goal (12 12) ())
	)
)
(4 Desirability (9 9)
	(
		(Evaluee (6 6) ())
		(Degree (8 8) (2))
		(Evaluee (10 12) (3))
	)
)
(5 Required_event (16 17)
	(
		(Required_situation (18 19) (6 7))
		(Required_situation (15 15) ())
	)
)
(6 Temporary_stay (18 18)
	(
		(Guest (15 15) ())
		(Location (19 19) (7))
	)
)
(7 Buildings (19 19)
	(
		(Building (15 15) ())
	)
)
(8 Cooking_creation (24 24)
	(
		(Cook (6 6) ())
	)
)
(9 Emotion_directed (29 29)
	(
		(Experiencer (6 6) ())
		(Topic (18 19) (6 7))
	)
)
)
)
(
; story sentence text for lookup
("A parrot can talk.")
; events
(
(0 Communication_manner (3 3)
	(
		(Speaker (1 1) ())
	)
)
(1 Capability (2 2)
	(
		(Entity (1 1) ())
		(Event (3 3) (0))
	)
)
)
)
(
; story sentence text for lookup
("Tom had a cabin near a river." "He would visit often." "ONe day the river flooded." "Tom's cabin was swept away." "Tom was sad for years.")
; events
(
(0 Locative_relation (4 4)
	(
		(Ground (6 6) (3))
		(Figure (3 3) (2))
	)
)
(1 Possession (1 1)
	(
		(Owner (0 0) ())
		(Time (6 6) (3))
		(Possession (3 3) (2))
	)
)
(2 Buildings (3 3)
	(
	)
)
(3 Natural_features (6 6)
	(
		(Locale (6 6) ())
	)
)
(4 Visiting (10 10)
	(
		(Agent (0 0) ())
		(Frequency (11 11) (5))
	)
)
(5 Frequency (11 11)
	(
		(Event (8 8) ())
		(Interval (11 11) ())
	)
)
(6 Fluidic_motion (17 17)
	(
		(Fluid (3 3) (2))
	)
)
(7 Calendric_unit (14 14)
	(
		(Unit (14 14) ())
	)
)
(8 Natural_features (16 16)
	(
		(Locale (11 11) (5))
	)
)
(9 Removing (23 23)
	(
		(Source (24 24) ())
		(Theme (8 8) ())
	)
)
(10 Buildings (21 21)
	(
	)
)
(11 Emotion_directed (28 28)
	(
		(Experiencer (0 0) ())
	)
)
(12 Measure_duration (30 30)
	(
		(Unit (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("I went to the store yesterday." "I tried some things on." "I liked them but they were too expensive." "I couldn't buy them." "So I put them back.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Motion (1 1)
	(
		(Theme (0 0) ())
		(Time (5 5) (0))
		(Goal (4 4) (2))
	)
)
(2 Businesses (4 4)
	(
		(Business (4 4) ())
	)
)
(3 Sole_instance (8 8)
	(
		(Type (10 10) ())
		(Type (0 0) ())
		(Item (4 4) (2))
	)
)
(4 Location_of_light (9 11)
	(
		(Figure (10 10) ())
	)
)
(5 Experiencer_focus (14 14)
	(
		(Experiencer (0 0) ())
		(Content (15 15) ())
	)
)
(6 Expensiveness (20 20)
	(
		(Goods (4 4) (2))
		(Degree (19 19) ())
	)
)
(7 Possibility (23 23)
	(
		(Possible_event (0 0) ())
		(Possible_event (26 26) ())
	)
)
(8 Commerce_buy (25 25)
	(
		(Buyer (0 0) ())
		(Goods (4 4) (2))
	)
)
(9 Placing (30 30)
	(
		(Agent (29 29) ())
		(Time (4 4) (2))
		(Theme (31 31) ())
	)
)
)
)
(
; story sentence text for lookup
("It was raining all day yesterday." "We were stuck in the house." "We started to get very bored." "We played some games." "It was a long day.")
; events
(
(0 Precipitation (2 2)
	(
		(Precipitation (2 2) ())
		(Time (3 5) (1 2))
	)
)
(1 Calendric_unit (4 4)
	(
		(Unit (4 4) ())
		(Whole (5 5) (2))
	)
)
(2 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(3 Buildings (12 12)
	(
		(Building (5 5) (2))
	)
)
(4 Emotion_directed (19 19)
	(
		(Experiencer (14 14) ())
		(Degree (4 4) (1))
	)
)
(5 Activity_start (15 15)
	(
		(Agent (14 14) ())
		(Activity (16 20) (4 6))
	)
)
(6 Transition_to_state (17 17)
	(
		(Entity (14 14) ())
		(Final_quality (18 19) (4))
	)
)
(7 Competition (22 22)
	(
		(Competition (24 24) ())
		(Participants (14 14) ())
	)
)
(8 Calendric_unit (30 30)
	(
		(Unit (4 4) (1))
	)
)
(9 Duration_description (29 29)
	(
		(Period (4 4) (1))
	)
)
)
)
(
; story sentence text for lookup
("Frank and little May are in the field with the wagon." "They have come to find flowers." "May has a red flower." "Frank has three yellow flowers." "He will let May have them." "She will take them to the wagon." "She is glad to get the pretty flowers.")
; events
(
(0 Size (2 2)
	(
		(Entity (3 3) ())
	)
)
(1 Interior_profile_relation (5 5)
	(
		(Figure (0 0) ())
		(Ground (7 7) (3))
		(Direction (10 10) (2))
	)
)
(2 Containers (10 10)
	(
		(Container (10 10) ())
	)
)
(3 Locale_by_use (7 7)
	(
		(Locale (7 7) ())
	)
)
(4 Arriving (14 14)
	(
		(Theme (12 12) ())
		(Goal (17 17) ())
	)
)
(5 Becoming_aware (16 16)
	(
		(Cognizer (12 12) ())
		(Phenomenon (17 17) ())
	)
)
(6 Part_piece (23 23)
	(
		(Piece (23 23) ())
		(Piece_prop (3 3) ())
	)
)
(7 Color (22 22)
	(
		(Entity (23 23) (6))
		(Color (3 3) ())
	)
)
(8 Cardinal_numbers (27 27)
	(
		(Number (27 27) ())
		(Entity (29 29) ())
	)
)
(9 Possession (26 26)
	(
		(Owner (12 12) ())
		(Possession (29 29) ())
	)
)
(10 Color (28 28)
	(
		(Entity (23 23) (6))
		(Color (3 3) ())
	)
)
(11 Dominate_competitor (33 35)
	(
		(Manner (36 36) ())
		(Agent (12 12) ())
		(Agent (3 3) ())
	)
)
(12 Bringing (40 40)
	(
		(Agent (12 12) ())
		(Goal (44 44) (13))
		(Theme (3 3) ())
	)
)
(13 Containers (44 44)
	(
		(Container (44 44) ())
	)
)
(14 Emotions_by_stimulus (48 48)
	(
		(Experiencer (12 12) ())
		(Stimulus (53 53) ())
	)
)
(15 Getting (50 50)
	(
		(Recipient (12 12) ())
		(Theme (53 53) ())
	)
)
(16 Aesthetics (52 52)
	(
		(Entity (7 7) (3))
	)
)
)
)
(
; story sentence text for lookup
("Helen bought a nice plant in the store." "She put it into the window at home." "Next morning she wanted to water it." "She found it broken on the floor." "It was her cat.")
; events
(
(0 Commerce_buy (1 1)
	(
		(Buyer (0 0) ())
		(Place (7 7) (1))
		(Goods (4 4) ())
	)
)
(1 Businesses (7 7)
	(
		(Business (7 7) ())
	)
)
(2 Stimulus_focus (3 3)
	(
		(Stimulus (4 4) ())
	)
)
(3 Placing (10 10)
	(
		(Agent (0 0) ())
		(Theme (11 11) ())
		(Source (16 16) ())
		(Goal (14 14) (4))
	)
)
(4 Connecting_architecture (14 14)
	(
		(Part (14 14) ())
	)
)
(5 Calendric_unit (19 19)
	(
		(Relative_time (0 0) ())
		(Unit (19 19) ())
	)
)
(6 Desiring (21 21)
	(
		(Experiencer (11 11) ())
		(Event (24 24) ())
		(Purpose_of_event (18 19) (5))
	)
)
(7 Becoming_aware (27 27)
	(
		(Cognizer (0 0) ())
		(Phenomenon (11 11) ())
		(Ground (24 24) ())
		(State (29 29) (9))
	)
)
(8 Architectural_part (32 32)
	(
		(Part (32 32) ())
	)
)
(9 Being_operational (29 29)
	(
		(Object (11 11) ())
	)
)
)
)
(
; story sentence text for lookup
("It was very hot outside." "So Tina went to the beach." "She thought it would be good." "But then it was not." "It was too hard.")
; events
(
(0 Temporal_collocation (4 4)
	(
		(Trajector_event (2 3) (1))
	)
)
(1 Ambient_temperature (3 3)
	(
		(Degree (2 2) ())
		(Place (4 4) (0))
	)
)
(2 Motion (8 8)
	(
		(Theme (7 7) ())
		(Goal (11 11) (3))
	)
)
(3 Natural_features (11 11)
	(
		(Locale (11 11) ())
	)
)
(4 Awareness (14 14)
	(
		(Cognizer (13 13) ())
		(Content (15 15) ())
	)
)
(5 Desirability (18 18)
	(
		(Evaluee (2 2) ())
	)
)
(6 Difficulty (29 29)
	(
		(Activity (13 13) ())
		(Degree (2 2) ())
	)
)
)
)
(
; story sentence text for lookup
("The man took a shower." "The hot water went cold." "He still had soap in his hair." "He washed his hair quickly." "He was shivering when he got out of the shower.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Grooming (4 4)
	(
		(Agent (1 1) (0))
	)
)
(2 Substance (8 8)
	(
		(Substance (8 8) ())
		(Descriptor (1 1) (0))
	)
)
(3 Temperature (7 7)
	(
		(Entity (8 8) (2))
	)
)
(4 Temperature (10 10)
	(
		(Entity (8 8) (2))
	)
)
(5 Transition_to_a_quality (9 9)
	(
		(Entity (8 8) (2))
		(Final_quality (10 10) (4))
	)
)
(6 Body_decoration (15 15)
	(
		(Decorated_individual (12 12) ())
		(Use (15 15) ())
	)
)
(7 Body_parts (18 18)
	(
		(Body_part (18 18) ())
		(Possessor (17 17) ())
	)
)
(8 Grooming (21 21)
	(
		(Manner (10 10) (4))
		(Agent (12 12) ())
		(Body_part (23 23) (9))
	)
)
(9 Body_parts (23 23)
	(
		(Body_part (15 15) (6))
		(Possessor (8 8) (2))
	)
)
(10 Building_subparts (35 35)
	(
	)
)
(11 Arriving (31 31)
	(
		(Source (18 18) (7))
		(Theme (10 10) (4))
		(Source (35 35) (10))
	)
)
(12 Body_movement (28 28)
	(
		(Agent (12 12) ())
		(Time (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("Julia loved flowers." "She thought they were so pretty." "One day she was walking." "She saw a field of flowers." "She had fun playing the flowers.")
; events
(
(0 Food (2 2)
	(
		(Food (2 2) ())
	)
)
(1 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (2 2) (0))
	)
)
(2 Opinion (5 5)
	(
		(Cognizer (0 0) ())
		(Opinion (6 6) ())
	)
)
(3 Aesthetics (9 9)
	(
		(Entity (2 2) (0))
		(Degree (8 8) ())
	)
)
(4 Calendric_unit (12 12)
	(
		(Count (0 0) ())
		(Unit (12 12) ())
	)
)
(5 Self_motion (15 15)
	(
		(Self_mover (2 2) (0))
		(Time (11 12) (4))
	)
)
(6 Perception_experience (18 18)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (6 6) ())
	)
)
(7 Locale_by_use (20 20)
	(
		(Constituent_parts (22 22) ())
		(Locale (20 20) ())
	)
)
(8 Emotions_of_mental_activity (26 26)
	(
		(Experiencer (0 0) ())
		(Stimulus (29 29) ())
	)
)
)
)
(
; story sentence text for lookup
("Kelley stayed up very late." "She wanted to get more work done." "So she loaded up on caffeine." "It worked." "But then she felt sick.")
; events
(
(0 Temporary_stay (1 1)
	(
		(Guest (0 0) ())
	)
)
(1 Work (11 11)
	(
		(Agent (0 0) ())
	)
)
(2 Getting (9 9)
	(
		(Recipient (0 0) ())
		(Theme (11 11) (1))
	)
)
(3 Intentionally_act (12 12)
	(
		(Act (11 11) (1))
		(Agent (0 0) ())
	)
)
(4 Desiring (7 7)
	(
		(Experiencer (0 0) ())
		(Event (11 11) (1))
	)
)
(5 Increment (10 10)
	(
		(Class (11 11) (1))
	)
)
(6 Intoxicants (19 19)
	(
		(Intoxicant (11 11) (1))
	)
)
(7 Filling (16 17)
	(
		(Agent (15 15) ())
		(Goal (17 17) ())
		(Goal (11 11) (1))
	)
)
(8 Usefulness (22 22)
	(
		(Entity (0 0) ())
	)
)
(9 Biological_urge (28 28)
	(
		(Experiencer (26 26) ())
	)
)
(10 Feeling (27 27)
	(
		(Experiencer (26 26) ())
		(Emotional_state (28 28) (9))
	)
)
)
)
(
; story sentence text for lookup
("Maeva got money for her birthday." "She had a list of things to buy." "She went out with her friends." "They bought clothes." "She went home.")
; events
(
(0 Getting (1 1)
	(
		(Purpose (5 5) (1))
		(Theme (2 2) (2))
		(Recipient (0 0) ())
	)
)
(1 Commemorative (5 5)
	(
		(Dedicated_entity (4 4) ())
	)
)
(2 Money (2 2)
	(
		(Money (2 2) ())
		(Possessor (0 0) ())
	)
)
(3 Possession (8 8)
	(
		(Owner (0 0) ())
		(Possession (10 10) (5))
	)
)
(4 Commerce_buy (14 14)
	(
		(Goods (12 12) ())
	)
)
(5 Text (10 10)
	(
		(Author (0 0) ())
		(Topic (12 12) ())
		(Text (10 10) ())
	)
)
(6 Motion (17 17)
	(
		(Theme (0 0) ())
		(Goal (2 2) (2))
		(Goal (5 5) (1))
	)
)
(7 Personal_relationship (21 21)
	(
		(Partner_1 (12 12) ())
		(Partner_2 (4 4) ())
	)
)
(8 Clothing (25 25)
	(
		(Garment (2 2) (2))
	)
)
(9 Commerce_buy (24 24)
	(
		(Buyer (0 0) ())
		(Goods (2 2) (2))
	)
)
(10 Motion (28 28)
	(
		(Theme (0 0) ())
		(Goal (2 2) (2))
	)
)
)
)
(
; story sentence text for lookup
("Tom got a call from his sister." "She wanted to come over in three hours." "His place was a mess." "He cleaned his house." "They had a good time at his house.")
; events
(
(0 Getting (1 1)
	(
		(Theme (3 3) (2))
		(Recipient (0 0) ())
		(Recipient (6 6) (1))
	)
)
(1 Kinship (6 6)
	(
		(Ego (5 5) ())
		(Alter (6 6) ())
	)
)
(2 Contacting (3 3)
	(
		(Addressee (0 0) ())
		(Communicator (6 6) (1))
		(Communication (3 3) ())
	)
)
(3 Desiring (9 9)
	(
		(Experiencer (0 0) ())
		(Event (15 15) (4))
	)
)
(4 Calendric_unit (15 15)
	(
		(Unit (15 15) ())
		(Count (6 6) (1))
	)
)
(5 Cardinal_numbers (14 14)
	(
		(Unit (15 15) (4))
		(Number (6 6) (1))
	)
)
(6 Arriving (11 11)
	(
		(Theme (0 0) ())
		(Goal (12 12) ())
		(Time (15 15) (4))
	)
)
(7 Locale (18 18)
	(
		(Container_possessor (0 0) ())
		(Locale (18 18) ())
	)
)
(8 Grooming (24 24)
	(
		(Agent (0 0) ())
		(Patient (3 3) (2))
	)
)
(9 Buildings (26 26)
	(
		(Building (3 3) (2))
	)
)
(10 Locative_relation (33 33)
	(
		(Figure (0 0) ())
		(Ground (35 35) (12))
	)
)
(11 Desirability (31 31)
	(
		(Evaluee (12 12) ())
	)
)
(12 Buildings (35 35)
	(
		(Building (15 15) (4))
	)
)
)
)
(
; story sentence text for lookup
("Little Alice had a doll." "It was her favorite." "Once Mark came to visit." "He broke the doll." "Alice cried.")
; events
(
(0 Size (0 0)
	(
		(Entity (1 1) ())
	)
)
(1 Possession (2 2)
	(
		(Possession (4 4) ())
		(Owner (1 1) ())
	)
)
(2 Arriving (13 13)
	(
		(Frequency (11 11) ())
		(Theme (1 1) ())
		(Goal (4 4) ())
	)
)
(3 Visiting (15 15)
	(
		(Agent (1 1) ())
	)
)
(4 Cause_to_fragment (18 18)
	(
		(Agent (11 11) ())
		(Whole_patient (20 20) ())
	)
)
(5 Make_noise (23 23)
	(
		(Sound_source (11 11) ())
	)
)
)
)
(
; story sentence text for lookup
("John needed clothes." "So he separated his clothes." "He began to wash them." "After washing them he dried them." "John now has clothes.")
; events
(
(0 Clothing (2 2)
	(
		(Garment (2 2) ())
	)
)
(1 Needing (1 1)
	(
		(Cognizer (0 0) ())
		(Requirement (2 2) (0))
	)
)
(2 Separating (6 6)
	(
		(Whole (8 8) (3))
		(Agent (5 5) ())
	)
)
(3 Clothing (8 8)
	(
		(Garment (8 8) ())
		(Wearer (7 7) ())
	)
)
(4 Activity_start (11 11)
	(
		(Agent (0 0) ())
		(Activity (14 14) ())
	)
)
(5 Grooming (13 13)
	(
		(Agent (0 0) ())
		(Body_part (8 8) (3))
	)
)
(6 Grooming (17 17)
	(
		(Result (2 2) (0))
	)
)
(7 Time_vector (16 16)
	(
		(Direction (0 0) ())
		(Event (19 19) ())
		(Landmark_event (18 18) ())
	)
)
(8 Cause_to_be_dry (20 20)
	(
		(Time (18 18) ())
		(Agent (7 7) ())
		(Dryee (21 21) ())
	)
)
(9 Wearing (25 25)
	(
		(Wearer (0 0) ())
		(Time (5 5) ())
		(Clothing (7 7) ())
	)
)
(10 Temporal_collocation (24 24)
	(
		(Trajector_event (26 26) (11))
		(Trajector_event (0 0) ())
		(Landmark_period (5 5) ())
	)
)
(11 Clothing (26 26)
	(
		(Garment (7 7) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom had a girlfriend he loved very much." "He cut her with his nails one day." "She asked him to cut them." "He cut his nails." "His girlfriend was happy that he cut his nails.")
; events
(
(0 Experiencer_focus (5 5)
	(
		(Content (3 3) (1))
		(Degree (6 7) ())
		(Experiencer (4 4) ())
	)
)
(1 Personal_relationship (3 3)
	(
		(Partner_2 (0 0) ())
	)
)
(2 Calendric_unit (16 16)
	(
		(Unit (16 16) ())
		(Count (15 15) ())
	)
)
(3 Body_parts (14 14)
	(
		(Body_part (14 14) ())
		(Possessor (4 4) ())
	)
)
(4 Experience_bodily_harm (10 10)
	(
		(Experiencer (0 0) ())
		(Experiencer (11 11) ())
		(Body_part (14 14) (3))
	)
)
(5 Request (19 19)
	(
		(Speaker (0 0) ())
		(Addressee (11 11) ())
		(Message (14 14) (3))
	)
)
(6 Experience_bodily_harm (22 22)
	(
		(Experiencer (11 11) ())
		(Experiencer (14 14) (3))
	)
)
(7 Experience_bodily_harm (26 26)
	(
		(Experiencer (0 0) ())
		(Body_part (3 3) (1))
	)
)
(8 Body_parts (28 28)
	(
		(Possessor (11 11) ())
		(Body_part (28 28) ())
	)
)
(9 Personal_relationship (31 31)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (31 31) ())
	)
)
(10 Body_parts (38 38)
	(
		(Possessor (16 16) (2))
		(Body_part (38 38) ())
	)
)
(11 Emotion_directed (33 33)
	(
		(Stimulus (35 35) ())
		(Experiencer (31 31) (9))
	)
)
)
)
(
; story sentence text for lookup
("The man is showing the horse." "He holds the horse's foot." "The shoes are made of iron." "The man nails them on to the horse's hoofs." "It does not hurt the horse." "His hoofs are hard.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Cause_to_perceive (3 3)
	(
		(Phenomenon (5 5) ())
		(Actor (1 1) (0))
	)
)
(2 Manipulation (8 8)
	(
		(Agent (7 7) ())
		(Entity (12 12) (3))
	)
)
(3 Body_parts (12 12)
	(
		(Body_part (12 12) ())
		(Possessor (9 11) ())
	)
)
(4 Clothing (15 15)
	(
		(Garment (1 1) (0))
	)
)
(5 Process_start (17 17)
	(
		(Place (5 5) ())
		(Place (1 1) (0))
	)
)
(6 Attaching (23 23)
	(
		(Connector (24 24) ())
		(Goal (30 30) (8))
		(Agent (1 1) (0))
	)
)
(7 People (22 22)
	(
		(Person (1 1) (0))
	)
)
(8 Body_parts (30 30)
	(
		(Body_part (30 30) ())
		(Possessor (27 29) ())
	)
)
(9 Animals (37 37)
	(
		(Animal (12 12) (3))
	)
)
(10 Experience_bodily_harm (35 35)
	(
		(Experiencer (5 5) ())
		(Injuring_entity (7 7) ())
	)
)
(11 Body_parts (40 40)
	(
		(Body_part (1 1) (0))
		(Possessor (7 7) ())
	)
)
(12 Level_of_force_resistance (42 42)
	(
		(Resisting_entity (1 1) (0))
	)
)
)
)
(
; story sentence text for lookup
("The market was rallying." "Kelley was not happy about it." "She didn't want it to go up that much." "She was short." "So she was losing money.")
; events
(
(0 Emotion_directed (8 8)
	(
		(Topic (10 10) ())
		(Experiencer (5 5) ())
	)
)
(1 Desiring (15 15)
	(
		(Event (16 16) ())
		(Experiencer (5 5) ())
	)
)
(2 Negation (14 14)
	(
		(Negated_proposition (16 16) ())
		(Negated_proposition (12 12) ())
	)
)
(3 Body_description_holistic (25 25)
	(
		(Individual (5 5) ())
	)
)
(4 Money (31 31)
	(
		(Possessor (28 28) ())
		(Money (31 31) ())
	)
)
(5 Earnings_and_losses (30 30)
	(
		(Earner (28 28) ())
		(Earnings (31 31) (4))
	)
)
)
)
(
; story sentence text for lookup
("Ben's dog Skip was very old." "One day Skip got sick." "Ben took Skip to the vet." "The vet told ben that it was Skip's time." "Ben sadly put Skip down.")
; events
(
(0 Age (6 6)
	(
		(Degree (5 5) ())
		(Entity (3 3) ())
	)
)
(1 Animals (2 2)
	(
		(Descriptor (0 1) ())
		(Animal (3 3) ())
		(Animal (2 2) ())
	)
)
(2 Calendric_unit (9 9)
	(
		(Count (8 8) ())
		(Unit (9 9) ())
	)
)
(3 Biological_urge (12 12)
	(
		(Experiencer (2 2) (1))
	)
)
(4 Transition_to_state (11 11)
	(
		(Entity (2 2) (1))
		(Final_quality (12 12) (3))
		(Time (0 1) ())
	)
)
(5 Vehicle (16 16)
	(
		(Possessor (8 8) ())
		(Itinerary (19 19) (7))
	)
)
(6 Ride_vehicle (15 15)
	(
		(Theme (8 8) ())
		(Vehicle (2 2) (1))
		(Goal (19 19) (7))
	)
)
(7 Medical_professionals (19 19)
	(
		(Professional (5 5) ())
	)
)
(8 Telling (23 23)
	(
		(Message (26 26) ())
		(Addressee (3 3) ())
		(Speaker (0 1) ())
	)
)
(9 Medical_professionals (22 22)
	(
		(Professional (9 9) (2))
	)
)
(10 Placing (34 36)
	(
		(Agent (8 8) ())
		(Theme (3 3) ())
	)
)
)
)
(
; story sentence text for lookup
("This cat was in a nest." "A hen ran at her.")
; events
(
(0 Interior_profile_relation (3 3)
	(
		(Ground (5 5) ())
		(Figure (1 1) ())
	)
)
(1 Self_motion (9 9)
	(
		(Goal (11 11) ())
		(Self_mover (1 1) ())
	)
)
)
)
(
; story sentence text for lookup
("Little Jack has a funny horse." "He rides the spade.")
; events
(
(0 Have_associated (2 2)
	(
		(Entity (5 5) ())
		(Topical_entity (1 1) ())
	)
)
(1 Stimulus_focus (4 4)
	(
		(Stimulus (5 5) ())
	)
)
(2 Operate_vehicle (8 8)
	(
		(Driver (7 7) ())
		(Vehicle (10 10) (3))
	)
)
(3 Medical_instruments (10 10)
	(
		(Instrument (10 10) ())
	)
)
)
)
(
; story sentence text for lookup
("Yes, Fred, I see it." "Can you see eggs in the nest?" "Yes, Rosy, I can." "Oh, Fred, can I get a peep at them?" "I will get the nest, Rosy, and let you see it." "No!" "no!" "I beg you not to get it.")
; events
(
(0 Perception_experience (5 5)
	(
		(Phenomenon (6 6) ())
		(Perceiver_passive (4 4) ())
	)
)
(1 Perception_experience (10 10)
	(
		(Perceiver_passive (9 9) ())
		(Phenomenon (11 11) ())
		(State (14 14) ())
	)
)
(2 Capability (21 21)
	(
		(Entity (4 4) ())
	)
)
(3 Perception_active (31 31)
	(
		(Perceiver_agentive (28 28) ())
		(Phenomenon (33 33) ())
	)
)
(4 Perception_experience (46 46)
	(
		(Perceiver_passive (45 45) ())
		(Phenomenon (47 47) ())
	)
)
(5 Getting (37 37)
	(
		(Recipient (35 35) ())
		(Theme (39 39) ())
	)
)
(6 Attempt_suasion (54 54)
	(
		(Speaker (35 35) ())
		(Addressee (55 55) ())
		(Content (59 59) ())
	)
)
)
)
(
; story sentence text for lookup
("Allie wanted a tattoo." "She really wanted one." "All her friends had one." "So she went to get it done." "But it was very painful.")
; events
(
(0 Desiring (1 1)
	(
		(Focal_participant (3 3) (1))
		(Experiencer (0 0) ())
	)
)
(1 Body_decoration (3 3)
	(
		(Decoration (3 3) ())
	)
)
(2 Desiring (7 7)
	(
		(Experiencer (0 0) ())
		(Degree (6 6) ())
		(Focal_participant (3 3) (1))
	)
)
(3 Personal_relationship (12 12)
	(
		(Partner_1 (12 12) ())
		(Partner_2 (6 6) ())
	)
)
(4 Possession (13 13)
	(
		(Owner (12 12) (3))
		(Possession (14 14) ())
	)
)
(5 Motion (18 18)
	(
		(Theme (6 6) ())
		(Purpose (21 21) ())
	)
)
(6 Activity_finish (20 22)
	(
		(Agent (6 6) ())
		(Activity (21 21) ())
	)
)
(7 Stimulus_focus (28 28)
	(
		(Stimulus (6 6) ())
		(Degree (3 3) (1))
	)
)
)
)
(
; story sentence text for lookup
("The man poured a glass of water." "He looked in the water." "There was something floating in there." "He poured the water out." "He got water in another glass.")
; events
(
(0 Placing (2 2)
	(
		(Theme (4 4) (2))
		(Agent (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Measure_volume (4 4)
	(
		(Unit (4 4) ())
		(Stuff (6 6) ())
		(Count (3 3) ())
	)
)
(3 Perception_active (9 9)
	(
		(Perceiver_agentive (8 8) ())
		(Ground (12 12) ())
	)
)
(4 Motion (17 17)
	(
		(Area (18 19) ())
		(Theme (16 16) ())
	)
)
(5 Cause_motion (22 22)
	(
		(Source (4 4) (2))
		(Agent (8 8) ())
		(Theme (24 24) ())
	)
)
(6 Containers (32 32)
	(
		(Container (32 32) ())
	)
)
(7 Interior_profile_relation (30 30)
	(
		(Ground (18 19) ())
		(Figure (16 16) ())
	)
)
(8 Substance (29 29)
	(
		(Substance (16 16) ())
	)
)
(9 Getting (28 28)
	(
		(Recipient (8 8) ())
		(Theme (16 16) ())
		(Place (32 32) (6))
	)
)
(10 Increment (31 31)
	(
		(Class (32 32) (6))
	)
)
)
)
(
; story sentence text for lookup
("I went on a plane yesterday." "As I got on it something happened." "We had to turn back." "A fire came about." "It was scary.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Motion (1 1)
	(
		(Theme (0 0) ())
		(Time (5 5) (0))
		(Carrier (4 4) (2))
	)
)
(2 Vehicle (4 4)
	(
		(Vehicle (4 4) ())
	)
)
(3 Event (13 13)
	(
		(Event (5 5) (0))
		(Time (8 8) ())
	)
)
(4 Required_event (16 17)
	(
		(Required_situation (0 0) ())
		(Required_situation (18 19) ())
	)
)
(5 Fire_burning (22 22)
	(
		(Fire (22 22) ())
	)
)
(6 Stimulus_focus (28 28)
	(
		(Stimulus (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The bird caught a worm." "It took the worm to its nest." "It fed the worm to a baby bird." "The baby bird was still hungry." "The bird caught another worm.")
; events
(
(0 Bringing (7 7)
	(
		(Theme (9 9) ())
		(Agent (6 6) ())
		(Goal (12 12) ())
	)
)
(1 Giving_birth (15 15)
	(
		(Egg (9 9) ())
		(Mother (6 6) ())
		(Place (21 21) ())
	)
)
(2 Age (20 20)
	(
		(Entity (21 21) ())
	)
)
(3 Biological_urge (28 28)
	(
		(Experiencer (25 25) ())
	)
)
(4 Continued_state_of_affairs (27 27)
	(
		(State_of_affairs (28 28) (3))
		(Reference_occasion (27 27) ())
		(State_of_affairs (25 25) ())
	)
)
(5 Increment (33 33)
	(
		(Class (27 27) (4))
	)
)
(6 Personal_relationship (32 32)
	(
		(Depictive (34 34) ())
		(Partner_1 (31 31) ())
	)
)
)
)
(
; story sentence text for lookup
("I wanted to make a cake." "But I didn't want it to be too easy." "So I made a tiramisu." "It was delicious." "But it took forever.")
; events
(
(0 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (5 5) (1))
	)
)
(1 Food (5 5)
	(
	)
)
(2 Cooking_creation (3 3)
	(
		(Produced_food (5 5) (1))
		(Cook (0 0) ())
	)
)
(3 Difficulty (16 16)
	(
		(Degree (15 15) ())
		(Activity (12 12) ())
	)
)
(4 Desiring (11 11)
	(
		(Experiencer (8 8) ())
		(Event (12 12) ())
		(Event (13 16) (3))
	)
)
(5 Cooking_creation (20 20)
	(
		(Cook (8 8) ())
		(Produced_food (22 22) (6))
	)
)
(6 Food (22 22)
	(
	)
)
(7 Chemical-sense_description (26 26)
	(
		(Perceptual_source (0 0) ())
	)
)
(8 Taking_time (30 30)
	(
		(Activity (8 8) ())
		(Time_length (31 31) (9))
	)
)
(9 Duration_description (31 31)
	(
	)
)
)
)
(
; story sentence text for lookup
("I was walking my dog." "I let go of the leash." "I ran after her." "I got a cut on my thigh from a branch." "I still have the scar.")
; events
(
(0 Cotheme (2 2)
	(
		(Theme (0 0) ())
		(Cotheme (4 4) (1))
	)
)
(1 Animals (4 4)
	(
		(Animal (4 4) ())
	)
)
(2 Connectors (11 11)
	(
		(Connector (11 11) ())
	)
)
(3 Self_motion (14 14)
	(
		(Cotheme (16 16) ())
		(Self_mover (0 0) ())
	)
)
(4 Body_parts (24 24)
	(
		(Body_part (24 24) ())
		(Possessor (11 11) (2))
	)
)
(5 Experience_bodily_harm (21 21)
	(
		(Experiencer (0 0) ())
		(Body_part (24 24) (4))
		(Containing_event (27 27) ())
	)
)
(6 Continued_state_of_affairs (30 30)
	(
		(State_of_affairs (0 0) ())
		(Reference_occasion (30 30) ())
		(State_of_affairs (33 33) (7))
	)
)
(7 Body_mark (33 33)
	(
		(Possessor (0 0) ())
		(Body_mark (4 4) (1))
	)
)
)
)
(
; story sentence text for lookup
("The man was wearing glasses." "A rock hit the glasses." "The glasses broke." "He showed his friend." "His friend said the glasses saved his eye.")
; events
(
(0 Accoutrements (4 4)
	(
		(Accoutrement (4 4) ())
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Wearing (3 3)
	(
		(Clothing (4 4) (0))
		(Wearer (1 1) (1))
	)
)
(3 Containers (10 10)
	(
		(Container (4 4) (0))
	)
)
(4 Impact (8 8)
	(
		(Impactee (10 10) (3))
		(Impactor (1 1) (1))
	)
)
(5 Containers (13 13)
	(
		(Container (1 1) (1))
	)
)
(6 Damaging (14 14)
	(
		(Patient (1 1) (1))
	)
)
(7 Personal_relationship (19 19)
	(
		(Partner_2 (18 18) ())
		(Partner_1 (19 19) ())
	)
)
(8 Body_parts (28 28)
	(
		(Possessor (27 27) ())
		(Body_part (28 28) ())
	)
)
(9 Statement (23 23)
	(
		(Message (25 25) (10))
		(Speaker (1 1) (1))
	)
)
(10 Accoutrements (25 25)
	(
		(Accoutrement (4 4) (0))
	)
)
(11 Activity_ongoing (26 26)
	(
		(Place (28 28) (8))
		(Agent (10 10) (3))
	)
)
(12 Personal_relationship (22 22)
	(
		(Partner_2 (21 21) ())
		(Partner_1 (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("John was at work." "Suddenly it got dark outside." "He looked out the window." "There was some very dark rain clouds." "It started to rain very hard.")
; events
(
(0 Spatial_co-location (2 2)
	(
		(Figure (0 0) ())
		(Ground (3 3) (1))
	)
)
(1 Locale_by_use (3 3)
	(
		(Constituent_parts (0 0) ())
		(Use (3 3) ())
	)
)
(2 Transition_to_state (7 7)
	(
		(Manner (0 0) ())
		(Final_quality (3 3) (1))
		(Place (9 9) (3))
		(Entity (6 6) ())
	)
)
(3 Part_inner_outer (9 9)
	(
		(Part (9 9) ())
	)
)
(4 Perception_active (12 12)
	(
		(Perceiver_agentive (0 0) ())
		(Direction (15 15) (5))
	)
)
(5 Connecting_architecture (15 15)
	(
		(Part (9 9) (3))
	)
)
(6 Proportional_quantity (19 19)
	(
		(Denoted_quantity (19 19) ())
		(Mass (20 23) (7 8))
	)
)
(7 Color_qualities (21 21)
	(
		(Described_entity (22 23) ())
		(Degree (3 3) (1))
	)
)
(8 Degree (20 20)
	(
		(Gradable_attribute (9 9) (3))
	)
)
(9 Existence (17 18)
	(
		(Entity (19 23) (6 7 8))
	)
)
(10 Activity_start (26 26)
	(
		(Agent (0 0) ())
		(Activity (27 30) (11))
	)
)
(11 Precipitation (28 28)
	(
		(Manner (29 30) ())
		(Precipitation (3 3) (1))
	)
)
)
)
(
; story sentence text for lookup
("Last week we had a beach day." "It was great." "I was really looking forward to it." "When we went it was very hot." "I jumped in right away.")
; events
(
(0 Relative_time (0 0)
	(
		(Focal_occasion (1 1) (1))
	)
)
(1 Calendric_unit (1 1)
	(
		(Relative_time (0 0) (0))
		(Unit (1 1) ())
	)
)
(2 Natural_features (5 5)
	(
		(Locale (5 5) ())
	)
)
(3 Calendric_unit (6 6)
	(
		(Unit (6 6) ())
	)
)
(4 Desirability (10 10)
	(
		(Evaluee (0 0) (0))
	)
)
(5 Expectation (15 15)
	(
		(Cognizer (0 0) (0))
		(Cognizer (14 14) ())
		(Phenomenon (18 18) ())
	)
)
(6 Temporal_collocation (20 20)
	(
		(Landmark_event (21 21) ())
	)
)
(7 Motion (22 22)
	(
		(Theme (1 1) (1))
	)
)
(8 Ambient_temperature (26 26)
	(
		(Degree (5 5) (2))
	)
)
(9 Self_motion (29 29)
	(
		(Self_mover (0 0) (0))
		(Goal (14 14) ())
	)
)
)
)
(
; story sentence text for lookup
("This large animal is an elephant." "His ears look like fans." "The two long teeth are called tusks." "The elephant eats grass and green corn." "He likes oranges bananas and peanuts." "Elephants live in India.")
; events
(
(0 Size (1 1)
	(
		(Entity (2 2) ())
	)
)
(1 Body_parts (8 8)
	(
		(Body_part (8 8) ())
		(Possessor (7 7) ())
	)
)
(2 Give_impression (9 9)
	(
		(Characterization (11 11) ())
		(Phenomenon (8 8) (1))
	)
)
(3 Measurable_attributes (15 15)
	(
		(Entity (16 16) (4))
	)
)
(4 Body_parts (16 16)
	(
		(Descriptor (2 2) ())
		(Body_part (16 16) ())
	)
)
(5 Referring_by_name (18 18)
	(
		(Name (19 19) ())
		(Entity (13 16) (3 4))
	)
)
(6 Ingestion (23 23)
	(
		(Ingestor (8 8) (1))
		(Ingestibles (24 24) (8))
	)
)
(7 Food (27 27)
	(
		(Type (26 26) (9))
	)
)
(8 Food (24 24)
	(
	)
)
(9 Color (26 26)
	(
		(Entity (19 19) ())
	)
)
(10 Experiencer_focus (30 30)
	(
		(Experiencer (7 7) ())
		(Content (32 32) (11))
	)
)
(11 Food (32 32)
	(
		(Type (2 2) ())
	)
)
(12 Food (34 34)
	(
	)
)
(13 Residence (37 37)
	(
		(Location (39 39) ())
		(Resident (7 7) ())
	)
)
)
)
(
; story sentence text for lookup
("The man caught a fish." "The fish looked sad to him." "The man felt bad." "He let the fish go." "The fish went belly up in the water.")
; events
(
(0 Residence (2 2)
	(
		(Location (4 4) ())
		(Resident (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Give_impression (8 8)
	(
		(Perceiver_passive (11 11) ())
		(Characterization (9 9) (4))
		(Phenomenon (1 1) (1))
	)
)
(3 Food (7 7)
	(
		(Food (1 1) (1))
	)
)
(4 Emotion_directed (9 9)
	(
		(Experiencer (11 11) ())
		(Experiencer (1 1) (1))
	)
)
(5 Feeling (15 15)
	(
		(Explanation (9 9) (4))
		(Experiencer (1 1) (1))
	)
)
(6 People (14 14)
	(
		(Person (1 1) (1))
	)
)
(7 Preventing_or_letting (19 19)
	(
		(Event (21 21) ())
		(Potential_hindrance (18 18) ())
		(Event (22 22) ())
	)
)
(8 Motion (26 26)
	(
		(Place (31 31) ())
		(Depictive (4 4) ())
		(Theme (1 1) (1))
	)
)
(9 Food (25 25)
	(
		(Food (1 1) (1))
	)
)
(10 Body_parts (27 27)
	(
		(Descriptor (31 31) ())
		(Body_part (4 4) ())
		(Possessor (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("Shelley wanted a new cat." "She went to the pet store." "She found a nice cat." "Shelley bought the cat and things for the cat." "She loved her cat.")
; events
(
(0 Desiring (1 1)
	(
		(Focal_participant (4 4) ())
		(Experiencer (0 0) ())
	)
)
(1 Age (3 3)
	(
		(Entity (4 4) ())
		(Age (3 3) ())
	)
)
(2 Motion (7 7)
	(
		(Theme (0 0) ())
		(Goal (11 11) (3))
	)
)
(3 Businesses (11 11)
	(
		(Business (11 11) ())
		(Product (4 4) ())
	)
)
(4 Locating (14 14)
	(
		(Perceiver (0 0) ())
		(Sought_entity (11 11) (3))
	)
)
(5 Animals (17 17)
	(
		(Animal (4 4) ())
		(Descriptor (3 3) (1))
	)
)
(6 Stimulus_focus (16 16)
	(
		(Stimulus (4 4) ())
	)
)
(7 Commerce_buy (20 20)
	(
		(Goods (22 22) (8))
		(Buyer (0 0) ())
	)
)
(8 Animals (22 22)
	(
		(Animal (3 3) (1))
	)
)
(9 Animals (27 27)
	(
		(Animal (27 27) ())
	)
)
(10 Experiencer_focus (30 30)
	(
		(Content (22 22) (8))
		(Experiencer (0 0) ())
	)
)
(11 Animals (32 32)
	(
		(Animal (3 3) (1))
	)
)
)
)
(
; story sentence text for lookup
("I turned on the fan." "It would not work." "I saw that it was unplugged." "I plugged the fan back in." "The fan blew wind in the room.")
; events
(
(0 Change_operational_state (1 2)
	(
		(Agent (0 0) ())
		(Device (4 4) ())
	)
)
(1 Usefulness (9 9)
	(
		(Entity (0 0) ())
	)
)
(2 Becoming_aware (12 12)
	(
		(Cognizer (0 0) ())
		(Phenomenon (13 16) (3))
	)
)
(3 Change_operational_state (16 16)
	(
		(Device (14 14) ())
	)
)
(4 Attaching (19 19)
	(
		(Agent (0 0) ())
		(Goal (21 21) ())
		(Goal (22 23) ())
	)
)
(5 Cause_motion (27 27)
	(
		(Theme (14 14) ())
		(Place (31 31) (7))
		(Agent (26 26) ())
	)
)
(6 Interior_profile_relation (29 29)
	(
		(Ground (31 31) (7))
		(Figure (26 26) ())
	)
)
(7 Building_subparts (31 31)
	(
		(Building_part (31 31) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom was dogsitting for a friend." "He accidentally let it out." "The dog ran away." "It was never seen again." "Tom had to buy them a new dog.")
; events
(
(0 Personal_relationship (5 5)
	(
		(Partner_1 (5 5) ())
	)
)
(1 Theft (2 2)
	(
		(Perpetrator (0 0) ())
		(Victim (5 5) (0))
	)
)
(2 Self_motion (15 15)
	(
		(Source (16 16) ())
		(Self_mover (14 14) ())
	)
)
(3 Perception_experience (21 21)
	(
		(Phenomenon (0 0) ())
	)
)
(4 Required_event (25 25)
	(
		(Required_situation (0 0) ())
		(Required_situation (31 31) (5))
	)
)
(5 Animals (31 31)
	(
		(Animal (31 31) ())
		(Descriptor (30 30) (6))
	)
)
(6 Age (30 30)
	(
		(Entity (31 31) (5))
		(Age (30 30) ())
	)
)
(7 Commerce_buy (27 27)
	(
		(Buyer (0 0) ())
		(Recipient (28 28) ())
		(Goods (31 31) (5))
	)
)
)
)
(
; story sentence text for lookup
("Jay went into the woods by himself." "He suddenly got lost." "He did not know where to go." "He was wandering for an hour." "He finally went out.")
; events
(
(0 Biological_area (4 4)
	(
		(Locale (4 4) ())
	)
)
(1 Motion (1 1)
	(
		(Theme (0 0) ())
		(Goal (4 4) (0))
		(Depictive (6 6) ())
	)
)
(2 Transition_to_state (10 10)
	(
		(Entity (0 0) ())
		(Manner (9 9) ())
		(Final_quality (11 11) ())
	)
)
(3 Awareness (16 16)
	(
		(Cognizer (0 0) ())
		(Content (17 19) ())
	)
)
(4 Self_motion (23 23)
	(
		(Self_mover (0 0) ())
		(Duration (26 26) (5))
	)
)
(5 Measure_duration (26 26)
	(
		(Count (4 4) (0))
		(Unit (26 26) ())
	)
)
(6 Motion (30 30)
	(
		(Theme (0 0) ())
		(Goal (11 11) ())
	)
)
)
)
(
; story sentence text for lookup
("There are fish in their pond." "They are very nice fish." "We will come and catch them." "We will take the long rod, and the hook and line." "We must have a bag, too." "It must be strong, to keep the fish safe.")
; events
(
(0 Natural_features (5 5)
	(
		(Locale (5 5) ())
	)
)
(1 Food (2 2)
	(
		(Descriptor (5 5) (0))
	)
)
(2 Interior_profile_relation (3 3)
	(
		(Figure (2 2) (1))
		(Ground (5 5) (0))
	)
)
(3 Existence (0 1)
	(
		(Entity (2 2) (1))
		(Place (5 5) (0))
	)
)
(4 Food (11 11)
	(
		(Descriptor (9 10) (5))
		(Type (7 7) ())
	)
)
(5 Stimulus_focus (10 10)
	(
		(Degree (2 2) (1))
		(Stimulus (11 11) (4))
	)
)
(6 Arriving (15 15)
	(
		(Theme (7 7) ())
	)
)
(7 Connectors (25 25)
	(
		(Connector (5 5) (0))
		(Type (11 11) (4))
	)
)
(8 Connectors (31 31)
	(
		(Connector (31 31) ())
	)
)
(9 Bringing (22 22)
	(
		(Agent (7 7) ())
		(Theme (25 25) (7))
	)
)
(10 Measurable_attributes (24 24)
	(
		(Entity (5 5) (0))
		(Attribute (11 11) (4))
	)
)
(11 Possession (35 35)
	(
		(Owner (7 7) ())
		(Possession (37 37) (13))
	)
)
(12 Required_event (34 34)
	(
		(Required_situation (7 7) ())
		(Required_situation (37 37) (13))
	)
)
(13 Containers (37 37)
	(
		(Container (11 11) (4))
	)
)
(14 Level_of_force_exertion (44 44)
	(
		(Exerter (7 7) ())
	)
)
(15 Food (49 49)
	(
	)
)
(16 Being_at_risk (50 50)
	(
		(Asset (49 49) (15))
	)
)
(17 Required_event (42 42)
	(
		(Required_situation (9 10) (5))
		(Required_situation (7 7) ())
		(Purpose (49 49) (15))
	)
)
(18 Cause_to_continue (47 47)
	(
		(State (50 50) (16))
		(Cause (7 7) ())
		(State (49 49) (15))
	)
)
)
)
(
; story sentence text for lookup
("The newspaper was outside." "My dad got home from work." "He got out of his car." "He picked the newspaper up." "He took it inside the house.")
; events
(
(0 Text (1 1)
	(
		(Text (1 1) ())
	)
)
(1 Interior_profile_relation (3 3)
	(
		(Figure (1 1) (0))
	)
)
(2 Arriving (7 7)
	(
		(Source (10 10) (4))
		(Goal (8 8) ())
		(Theme (1 1) (0))
	)
)
(3 Kinship (6 6)
	(
		(Ego (5 5) ())
		(Alter (1 1) (0))
	)
)
(4 Locale_by_use (10 10)
	(
		(Locale (10 10) ())
	)
)
(5 Arriving (13 13)
	(
		(Theme (5 5) ())
		(Source (17 17) (6))
	)
)
(6 Vehicle (17 17)
	(
		(Vehicle (10 10) (4))
		(Possessor (16 16) ())
	)
)
(7 Food_gathering (20 20)
	(
		(Crop (22 22) (8))
		(Gatherer (5 5) ())
		(Particular_iteration (16 16) ())
	)
)
(8 Text (22 22)
	(
		(Text (8 8) ())
	)
)
(9 Bringing (26 26)
	(
		(Agent (5 5) ())
		(Theme (27 27) ())
		(Place (30 30) (10))
	)
)
(10 Buildings (30 30)
	(
		(Building (10 10) (4))
	)
)
(11 Interior_profile_relation (28 28)
	(
		(Ground (10 10) (4))
		(Figure (25 25) ())
	)
)
)
)
(
; story sentence text for lookup
("Dan decided to go to his pond." "He picked up a rock." "It skipped three times." "One rock was too big." "It just made a big splash.")
; events
(
(0 Deciding (1 1)
	(
		(Cognizer (0 0) ())
		(Decision (6 6) (2))
	)
)
(1 Motion (3 3)
	(
		(Theme (0 0) ())
		(Goal (6 6) (2))
	)
)
(2 Natural_features (6 6)
	(
		(Locale (6 6) ())
	)
)
(3 Self_motion (15 15)
	(
		(Self_mover (0 0) ())
		(Duration (16 17) ())
	)
)
(4 Cardinal_numbers (19 19)
	(
		(Number (0 0) ())
		(Entity (20 20) ())
	)
)
(5 Size (23 23)
	(
		(Degree (22 22) (6))
		(Entity (20 20) ())
	)
)
(6 Sufficiency (22 22)
	(
		(Scale (23 23) (5))
		(Item (20 20) ())
	)
)
(7 Sounds (30 30)
	(
		(Sound_source (0 0) ())
		(Manner (23 23) (5))
	)
)
(8 Size (29 29)
	(
		(Entity (30 30) (7))
	)
)
)
)
(
; story sentence text for lookup
("My brother had a ball." "He threw it to my son." "My son could not catch it." "It rolled right past my son." "My son picked the ball up.")
; events
(
(0 Kinship (1 1)
	(
		(Ego (0 0) ())
		(Alter (1 1) ())
	)
)
(1 Cause_motion (7 7)
	(
		(Agent (0 0) ())
		(Goal (11 11) (2))
		(Theme (8 8) ())
	)
)
(2 Kinship (11 11)
	(
		(Ego (10 10) ())
		(Alter (11 11) ())
	)
)
(3 Kinship (14 14)
	(
		(Ego (0 0) ())
		(Alter (1 1) (0))
	)
)
(4 Motion (21 21)
	(
		(Theme (0 0) ())
		(Path (25 25) (5))
	)
)
(5 Kinship (25 25)
	(
		(Ego (10 10) ())
		(Alter (11 11) (2))
	)
)
(6 Kinship (28 28)
	(
		(Ego (0 0) ())
		(Alter (1 1) (0))
	)
)
)
)
(
; story sentence text for lookup
("The cat was purring." "The cat put its head back down." "The cat had a funny look." "The cat started eating." "I had bought it a different food.")
; events
(
(0 Make_noise (3 3)
	(
		(Sound (3 3) ())
		(Sound_source (1 1) ())
	)
)
(1 Cause_motion (7 7)
	(
		(Time (10 11) ())
		(Theme (9 9) (2))
		(Agent (1 1) ())
	)
)
(2 Body_parts (9 9)
	(
		(Body_part (9 9) ())
		(Possessor (3 3) (0))
	)
)
(3 Facial_expression (18 18)
	(
		(Expression (18 18) ())
		(Manner (9 9) (2))
		(Possessor (1 1) ())
	)
)
(4 Stimulus_focus (17 17)
	(
		(Stimulus (18 18) (3))
	)
)
(5 Activity_start (22 22)
	(
		(Activity (3 3) (0))
		(Agent (1 1) ())
	)
)
(6 Ingestion (23 23)
	(
		(Ingestor (1 1) ())
	)
)
(7 Commerce_buy (27 27)
	(
		(Buyer (25 25) ())
		(Goods (31 31) (9))
		(Recipient (3 3) (0))
	)
)
(8 Similarity (30 30)
	(
		(Entity_1 (31 31) (9))
	)
)
(9 Food (31 31)
	(
		(Descriptor (18 18) (3))
	)
)
)
)
(
; story sentence text for lookup
("I was invited to see a baseball game." "When I sat down I was so bored." "I just wanted to leave." "I had nothing to do." "So I fell asleep.")
; events
(
(0 Request (2 2)
	(
		(Addressee (0 0) ())
		(Message (7 7) ())
	)
)
(1 Visiting (4 4)
	(
		(Agent (0 0) ())
		(Entity (7 7) ())
	)
)
(2 Change_posture (11 12)
	(
		(Protagonist (10 10) ())
	)
)
(3 Emotion_directed (16 16)
	(
		(Experiencer (13 13) ())
		(Degree (15 15) ())
	)
)
(4 Desiring (20 20)
	(
		(Experiencer (0 0) ())
		(Event (21 22) (5))
	)
)
(5 Departing (22 22)
	(
		(Theme (0 0) ())
	)
)
(6 Intentionally_act (28 28)
	(
		(Agent (0 0) ())
	)
)
(7 Fall_asleep (32 33)
	(
		(Sleeper (10 10) ())
	)
)
)
)
(
; story sentence text for lookup
("The girl stood up." "She bumped her head on something." "She sat back down." "Her head was bleeding." "Her friend ran to get help.")
; events
(
(0 Body_movement (2 2)
	(
		(Result (3 3) ())
		(Agent (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Body_parts (8 8)
	(
		(Body_part (3 3) ())
		(Possessor (7 7) ())
	)
)
(3 Cause_impact (6 6)
	(
		(Impactor (8 8) (2))
		(Agent (5 5) ())
		(Impactee (10 10) ())
	)
)
(4 Change_posture (13 13)
	(
		(Direction (8 8) (2))
		(Protagonist (5 5) ())
	)
)
(5 Body_parts (18 18)
	(
		(Possessor (5 5) ())
		(Body_part (1 1) (1))
	)
)
(6 Fluidic_motion (20 20)
	(
		(Goal (1 1) (1))
	)
)
(7 Assistance (27 27)
	(
		(Helper (1 1) (1))
	)
)
(8 Self_motion (24 24)
	(
		(Purpose (27 27) (7))
		(Self_mover (1 1) (1))
	)
)
(9 Personal_relationship (23 23)
	(
		(Partner_2 (5 5) ())
	)
)
(10 Getting (26 26)
	(
		(Theme (27 27) (7))
		(Recipient (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("Frank and Mary live on a farm." "They have many pets." "Here are their pretty white chickens." "They feed the chickens three times a day." "Water is in the pan." "The chickens must have water to drink." "When Mary says, Come, come!" "the chickens run to her." "How many chickens have they?" "Count them and see.")
; events
(
(0 Locale_by_use (6 6)
	(
		(Locale (6 6) ())
	)
)
(1 Residence (3 3)
	(
		(Resident (0 0) ())
		(Location (6 6) (0))
	)
)
(2 Quantified_mass (10 10)
	(
		(Quantity (10 10) ())
		(Individuals (11 11) ())
	)
)
(3 Possession (9 9)
	(
		(Owner (8 8) ())
		(Possession (11 11) ())
	)
)
(4 Spatial_co-location (13 13)
	(
		(Figure (18 18) (6))
	)
)
(5 Color (17 17)
	(
		(Entity (18 18) (6))
		(Color (17 17) ())
		(Color_qualifier (11 11) ())
	)
)
(6 Food (18 18)
	(
		(Descriptor (17 17) (5))
		(Descriptor (11 11) ())
	)
)
(7 Aesthetics (16 16)
	(
		(Entity (18 18) (6))
	)
)
(8 Calendric_unit (27 27)
	(
		(Unit (27 27) ())
	)
)
(9 Ingestion (21 21)
	(
		(Ingestor (8 8) ())
		(Ingestibles (11 11) ())
	)
)
(10 Interior_profile_relation (31 31)
	(
		(Figure (8 8) ())
		(Ground (33 33) (11))
	)
)
(11 Containers (33 33)
	(
		(Container (17 17) (5))
	)
)
(12 Food (39 39)
	(
		(Food (17 17) (5))
	)
)
(13 Possession (38 38)
	(
		(Owner (36 36) ())
		(Possession (6 6) (0))
	)
)
(14 Required_event (37 37)
	(
		(Required_situation (36 36) ())
		(Required_situation (39 39) (12))
	)
)
(15 Ingestion (41 41)
	(
		(Ingestor (36 36) ())
		(Ingestibles (17 17) (5))
	)
)
(16 Arriving (49 49)
	(
		(Theme (44 44) ())
	)
)
(17 Statement (45 45)
	(
		(Speaker (44 44) ())
		(Message (6 6) (0))
	)
)
(18 Self_motion (53 53)
	(
		(Goal (33 33) (11))
		(Self_mover (36 36) ())
	)
)
(19 Possession (60 60)
	(
		(Possession (0 0) ())
		(Owner (17 17) (5))
	)
)
(20 Perception_experience (66 66)
	(
	)
)
(21 Adding_up (63 63)
	(
		(Place (44 44) ())
	)
)
)
)
(
; story sentence text for lookup
("The rat ran from the box.")
; events
(
(0 Self_motion (2 2)
	(
		(Source (5 5) (1))
		(Self_mover (1 1) ())
	)
)
(1 Containers (5 5)
	(
		(Container (5 5) ())
	)
)
)
)
(
; story sentence text for lookup
("The man mixed a drink." "It tasted very good." "His friend asked for one." "The man made his friend a drink." "His friend gave the drink it's own name.")
; events
(
(0 Cause_to_amalgamate (2 2)
	(
		(Parts (4 4) (2))
		(Agent (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Food (4 4)
	(
		(Food (4 4) ())
	)
)
(3 Give_impression (7 7)
	(
		(Phenomenon (6 6) ())
		(Characterization (8 9) (4))
	)
)
(4 Desirability (9 9)
	(
		(Evaluee (6 6) ())
		(Degree (8 8) ())
	)
)
(5 Request (13 13)
	(
		(Message (4 4) (2))
		(Speaker (1 1) (1))
	)
)
(6 Personal_relationship (12 12)
	(
		(Partner_2 (6 6) ())
		(Partner_1 (1 1) (1))
	)
)
(7 Cooking_creation (19 19)
	(
		(Produced_food (23 23) ())
		(Recipient (4 4) (2))
		(Cook (1 1) (1))
	)
)
(8 People (18 18)
	(
		(Person (1 1) (1))
	)
)
(9 Personal_relationship (21 21)
	(
		(Partner_1 (4 4) (2))
		(Partner_2 (20 20) ())
	)
)
(10 Personal_relationship (26 26)
	(
		(Partner_2 (6 6) ())
		(Partner_1 (1 1) (1))
	)
)
(11 Food (29 29)
	(
		(Food (4 4) (2))
	)
)
(12 Being_named (33 33)
	(
		(Entity (29 29) (11))
	)
)
)
)
(
; story sentence text for lookup
("Did Cora go to the hill?" "We did not see her there." "When we saw Cora this morning, she was dressing her doll." "She said she was going to see Elsie.")
; events
(
(0 Natural_features (5 5)
	(
		(Locale (5 5) ())
	)
)
(1 Motion (2 2)
	(
		(Theme (1 1) ())
		(Goal (5 5) (0))
	)
)
(2 Perception_experience (10 10)
	(
		(State (5 5) (0))
		(Perceiver_passive (7 7) ())
		(Phenomenon (11 11) ())
	)
)
(3 Processing_materials (23 23)
	(
		(Material (25 25) ())
		(Agent (21 21) ())
	)
)
(4 Temporal_collocation (14 14)
	(
		(Trajector_event (21 21) ())
		(Landmark_event (15 15) ())
	)
)
(5 Wearing (16 16)
	(
		(Time (18 19) (6))
		(Manner (1 1) ())
		(Clothing (17 17) ())
	)
)
(6 Calendric_unit (19 19)
	(
		(Relative_time (11 11) ())
		(Unit (5 5) (0))
	)
)
(7 Statement (28 28)
	(
		(Speaker (7 7) ())
		(Message (29 29) ())
	)
)
)
)
(
; story sentence text for lookup
("This is Simeon's knife." "His father bought it for him." "It has two blades." "They are sharp." "Simeon carries a knife in his pocket." "Luisa likes her fan very much." "It is a pretty fan." "She carries it in her hand." "She puts it in her desk at school.")
; events
(
(0 Medical_instruments (4 4)
	(
		(Instrument (4 4) ())
		(Instrument (2 3) ())
	)
)
(1 Commerce_buy (8 8)
	(
		(Recipient (11 11) ())
		(Goods (9 9) ())
		(Buyer (7 7) (2))
	)
)
(2 Kinship (7 7)
	(
		(Ego (6 6) ())
		(Alter (7 7) ())
	)
)
(3 Cardinal_numbers (15 15)
	(
		(Number (15 15) ())
		(Entity (9 9) ())
	)
)
(4 Body_parts (16 16)
	(
		(Possessor (6 6) ())
		(Body_part (9 9) ())
	)
)
(5 Sharpness (20 20)
	(
		(Entity (6 6) ())
	)
)
(6 Bringing (23 23)
	(
		(Agent (6 6) ())
		(Area (28 28) (7))
		(Theme (2 3) ())
	)
)
(7 Clothing_parts (28 28)
	(
		(Clothing (28 28) ())
		(Wearer (27 27) ())
	)
)
(8 Interior_profile_relation (26 26)
	(
		(Ground (28 28) (7))
		(Figure (2 3) ())
	)
)
(9 Medical_instruments (25 25)
	(
		(Instrument (9 9) ())
	)
)
(10 Experiencer_focus (31 31)
	(
		(Content (2 3) ())
		(Degree (11 11) ())
		(Experiencer (6 6) ())
	)
)
(11 Personal_relationship (33 33)
	(
		(Partner_1 (9 9) ())
		(Partner_2 (15 15) (3))
	)
)
(12 Bringing (44 44)
	(
		(Agent (6 6) ())
		(Agent (48 48) (14))
		(Theme (15 15) (3))
	)
)
(13 Interior_profile_relation (46 46)
	(
		(Figure (6 6) ())
		(Ground (28 28) (7))
	)
)
(14 Body_parts (48 48)
	(
		(Possessor (4 4) (0))
		(Body_part (27 27) ())
	)
)
(15 Placing (51 51)
	(
		(Agent (6 6) ())
		(Theme (15 15) (3))
		(Goal (55 55) ())
	)
)
(16 Locale_by_use (57 57)
	(
		(Locale (57 57) ())
	)
)
)
)
(
; story sentence text for lookup
("The wind was howling." "A storm had just hit." "Everyone ran inside to get out of it." "The power went out." "Everyone hunkered down to hide.")
; events
(
(0 Make_noise (3 3)
	(
		(Sound (3 3) ())
		(Sound_source (1 1) ())
	)
)
(1 Weather (6 6)
	(
	)
)
(2 Impact (9 9)
	(
		(Time (3 3) (0))
		(Impactor (1 1) ())
	)
)
(3 Self_motion (12 12)
	(
		(Self_mover (11 11) ())
		(Goal (13 13) ())
		(Purpose (18 18) ())
	)
)
(4 Process_completed_state (22 23)
	(
		(Process (1 1) ())
	)
)
(5 Electricity (21 21)
	(
		(Electricity (21 21) ())
	)
)
(6 Hiding_objects (29 29)
	(
		(Agent (11 11) ())
	)
)
(7 Change_posture (26 27)
	(
		(Protagonist (11 11) ())
		(Purpose (28 29) (6))
	)
)
)
)
(
; story sentence text for lookup
("Will you let me ride home with you, Frank?" "Yes, May, you may sit by me in the wagon if you like." "Get in, and give me the whip." "I will not whip the good horse." "Now, here we go!" "Here is the apple tree, but we can not see the nest in it.")
; events
(
(0 Operate_vehicle (4 4)
	(
		(Depictive (7 7) ())
		(Goal (5 5) ())
		(Driver (3 3) ())
	)
)
(1 Posture (17 17)
	(
		(Point_of_contact (17 17) ())
		(Location (22 22) (3))
		(Location (19 19) ())
		(Agent (15 15) ())
	)
)
(2 Experiencer_focus (25 25)
	(
		(Experiencer (24 24) ())
	)
)
(3 Containers (22 22)
	(
		(Container (22 22) ())
	)
)
(4 Giving (31 31)
	(
		(Theme (7 7) ())
		(Recipient (5 5) ())
	)
)
(5 Cause_harm (39 39)
	(
		(Agent (36 36) ())
		(Victim (42 42) ())
	)
)
(6 Desirability (41 41)
	(
		(Evaluee (17 17) (1))
	)
)
(7 Perception_experience (60 60)
	(
		(Perceiver_passive (57 57) ())
		(Phenomenon (62 62) ())
		(Ground (64 64) ())
	)
)
(8 Spatial_co-location (50 50)
	(
		(Figure (54 54) (9))
	)
)
(9 Biological_area (54 54)
	(
		(Locale (15 15) ())
		(Constituent_parts (3 3) ())
	)
)
(10 Food (53 53)
	(
		(Food (3 3) ())
	)
)
)
)
(
; story sentence text for lookup
("I was in Chicago." "I was singing with a few people." "A man listened to us sing." "He gave us tips." "It was very helpful.")
; events
(
(0 Interior_profile_relation (2 2)
	(
		(Figure (0 0) ())
		(Ground (3 3) ())
	)
)
(1 Communication_manner (7 7)
	(
		(Speaker (0 0) ())
		(Addressee (11 11) (3))
	)
)
(2 Quantified_mass (9 10)
	(
		(Quantity (9 10) ())
		(Individuals (11 11) (3))
	)
)
(3 People (11 11)
	(
		(Person (11 11) ())
	)
)
(4 Perception_active (15 15)
	(
		(Phenomenon (17 17) ())
		(Perceiver_agentive (14 14) (5))
	)
)
(5 People (14 14)
	(
		(Person (14 14) ())
	)
)
(6 Communication_manner (18 18)
	(
		(Speaker (17 17) ())
	)
)
(7 Assistance (28 28)
	(
		(Helper (0 0) ())
		(Degree (27 27) ())
	)
)
)
)
(
; story sentence text for lookup
("A new restaurant opened in town." "I was eager to try it." "It looked good." "So I went to it." "But the line was so long I ended up leaving.")
; events
(
(0 Locale_by_use (2 2)
	(
		(Locale (2 2) ())
		(Descriptor (1 1) (1))
	)
)
(1 Age (1 1)
	(
		(Entity (2 2) (0))
		(Age (1 1) ())
	)
)
(2 Political_locales (5 5)
	(
		(Locale (5 5) ())
	)
)
(3 Desiring (9 9)
	(
		(Experiencer (7 7) ())
		(Event (12 12) ())
	)
)
(4 Attempt_means (11 11)
	(
		(Agent (7 7) ())
		(Means (5 5) (2))
	)
)
(5 Give_impression (15 16)
	(
		(Phenomenon (7 7) ())
		(Appraisal (2 2) (0))
	)
)
(6 Measurable_attributes (29 29)
	(
		(Entity (26 26) ())
		(Degree (28 28) ())
		(Attribute (5 5) (2))
	)
)
(7 Departing (33 33)
	(
		(Theme (30 30) ())
	)
)
)
)
(
; story sentence text for lookup
("The Hare runs from the Dog.")
; events
(
(0 Self_motion (2 2)
	(
		(Self_mover (1 1) ())
		(Source (5 5) ())
	)
)
)
)
(
; story sentence text for lookup
("Today we had a storm." "It rained very hard for a long time." "The wind blew loudly." "I was glad when the storm was over." "When I went outside, I saw a rainbow!")
; events
(
(0 Calendric_unit (0 0)
	(
		(Unit (0 0) ())
	)
)
(1 Weather (4 4)
	(
		(Time (0 0) (0))
	)
)
(2 Precipitation (7 7)
	(
		(Precipitation (7 7) ())
		(Duration (13 13) (4))
		(Manner (8 9) (3))
	)
)
(3 Level_of_force_resistance (9 9)
	(
		(Resisting_entity (7 7) (2))
		(Degree (8 8) ())
	)
)
(4 Measure_duration (13 13)
	(
		(Unit (13 13) ())
		(Unit (12 12) (5))
		(Process (6 6) ())
	)
)
(5 Duration_description (12 12)
	(
		(Period (13 13) (4))
		(Degree (12 12) ())
	)
)
(6 Moving_in_place (17 17)
	(
		(Manner (18 18) ())
		(Theme (16 16) ())
	)
)
(7 Emotions_by_stimulus (22 22)
	(
		(Experiencer (0 0) (0))
		(Circumstances (25 25) ())
	)
)
(8 Process_completed_state (27 27)
	(
		(Process (25 25) ())
	)
)
(9 Temporal_collocation (29 29)
	(
		(Trajector_event (34 34) ())
		(Landmark_event (30 30) ())
	)
)
(10 Motion (31 31)
	(
		(Theme (7 7) (2))
		(Goal (18 18) ())
	)
)
(11 Perception_experience (35 35)
	(
		(Phenomenon (37 37) ())
		(Perceiver_passive (34 34) ())
	)
)
(12 Part_inner_outer (32 32)
	(
		(Part (7 7) (2))
		(Part (18 18) ())
	)
)
)
)
(
; story sentence text for lookup
("Ben came home late at night." "He did not want to wake up his wife." "He did not turn on the light." "He slipped and fell down." "His leg was broken.")
; events
(
(0 Buildings (2 2)
	(
		(Building (2 2) ())
	)
)
(1 Arriving (1 1)
	(
		(Theme (0 0) ())
		(Goal (2 2) (0))
		(Time (5 5) (2))
	)
)
(2 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(3 Personal_relationship (15 15)
	(
		(Partner_1 (15 15) ())
		(Partner_2 (14 14) ())
	)
)
(4 Cause_to_wake (12 13)
	(
		(Agent (0 0) ())
		(Sleeper (15 15) (3))
	)
)
(5 Desiring (10 10)
	(
		(Experiencer (0 0) ())
		(Event (15 15) (3))
	)
)
(6 Fastener (20 21)
	(
		(Name (0 0) ())
		(Type (23 23) (7))
	)
)
(7 Location_of_light (23 23)
	(
		(Light (23 23) ())
	)
)
(8 Self_motion (26 26)
	(
		(Self_mover (0 0) ())
	)
)
(9 Motion_directional (28 28)
	(
		(Path (29 29) ())
		(Theme (0 0) ())
		(Direction (28 28) ())
	)
)
(10 Body_parts (32 32)
	(
		(Possessor (0 0) ())
		(Body_part (32 32) ())
	)
)
(11 Cause_to_fragment (34 34)
	(
		(Whole_patient (31 32) (10))
	)
)
)
)
(
; story sentence text for lookup
("I see a man and a dog and a cow." "The cow is with the man." "The dog has a big hat." "He is a good little dog." "He may take the hat to the man." "The man is good to the dog." "The cow can run." "She can not play.")
; events
(
(0 Perception_experience (1 1)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (3 3) (1))
	)
)
(1 People (3 3)
	(
		(Person (3 3) ())
	)
)
(2 People (16 16)
	(
		(Person (16 16) ())
	)
)
(3 Accoutrements (23 23)
	(
		(Accoutrement (16 16) (2))
		(Descriptor (22 22) (5))
	)
)
(4 Wearing (20 20)
	(
		(Clothing (23 23) (3))
		(Wearer (19 19) ())
	)
)
(5 Size (22 22)
	(
		(Entity (16 16) (2))
	)
)
(6 Desirability (28 28)
	(
		(Evaluee (16 16) (2))
	)
)
(7 Cause_motion (34 34)
	(
		(Agent (0 0) ())
		(Theme (36 36) (8))
		(Goal (39 39) (9))
	)
)
(8 Accoutrements (36 36)
	(
		(Accoutrement (22 22) (5))
	)
)
(9 People (39 39)
	(
		(Person (39 39) ())
	)
)
(10 People (42 42)
	(
		(Person (42 42) ())
	)
)
(11 Animals (47 47)
	(
		(Animal (47 47) ())
	)
)
(12 Social_interaction_evaluation (44 44)
	(
		(Affected_party (47 47) (11))
		(Evaluee (19 19) ())
	)
)
(13 Self_motion (52 52)
	(
		(Self_mover (19 19) ())
	)
)
(14 Capability (51 51)
	(
		(Entity (19 19) ())
		(Event (3 3) (1))
	)
)
(15 Capability (55 55)
	(
		(Entity (0 0) ())
		(Event (3 3) (1))
	)
)
)
)
(
; story sentence text for lookup
("The bear was small then, so he was not afraid of him." "He cut the tree down, and as soon as it fell, the dogs caught the bear.")
; events
(
(0 Experiencer_focus (10 10)
	(
		(Experiencer (7 7) ())
		(Content (12 12) ())
	)
)
(1 Temporal_collocation (4 4)
	(
		(Trajector_event (1 1) ())
	)
)
(2 Size (3 3)
	(
		(Entity (1 1) ())
	)
)
(3 Motion_directional (25 25)
	(
		(Theme (24 24) ())
	)
)
(4 Cause_harm (15 15)
	(
		(Body_part (17 17) ())
		(Agent (14 14) ())
		(Result (18 18) ())
	)
)
(5 Releasing (29 29)
	(
		(Theme (31 31) ())
		(Theme (28 28) ())
	)
)
)
)
(
; story sentence text for lookup
("Here are five pretty blue flowers." "They look like little bells, and so we can call them blue bells." "The stems and the leaves are green." "Ned has no flowers." "Tom says, “Here is my box of paints.” Ned paints the flowers blue." "But he has no green paint for the stems and leaves." "He can make green paint." "He can mix blue paint and yellow paint." "Blue and yellow make green.")
; events
(
(0 Cardinal_numbers (2 2)
	(
		(Number (2 2) ())
		(Entity (5 5) ())
	)
)
(1 Color (4 4)
	(
		(Entity (5 5) ())
		(Color (4 4) ())
	)
)
(2 Level_of_light (3 3)
	(
		(Location (5 5) ())
	)
)
(3 Referring_by_name (17 17)
	(
		(Speaker (15 15) ())
		(Entity (18 18) ())
		(Name (19 20) (6 7))
	)
)
(4 Size (10 10)
	(
		(Entity (4 4) (1))
	)
)
(5 Noise_makers (11 11)
	(
		(Noise_maker (4 4) (1))
		(Type (10 10) (4))
	)
)
(6 Noise_makers (20 20)
	(
		(Noise_maker (20 20) ())
		(Type (19 19) (7))
	)
)
(7 Color (19 19)
	(
		(Color (19 19) ())
	)
)
(8 Give_impression (8 8)
	(
		(Phenomenon (7 7) ())
		(Characterization (11 11) (5))
	)
)
(9 Color (28 28)
	(
		(Color (28 28) ())
		(Entity (23 23) ())
	)
)
(10 Possession (31 31)
	(
		(Possession (33 33) ())
		(Owner (7 7) ())
	)
)
(11 Measure_volume (42 42)
	(
		(Unit (42 42) ())
		(Count (28 28) (9))
		(Stuff (44 44) ())
	)
)
(12 Statement (36 36)
	(
		(Speaker (7 7) ())
		(Message (42 42) (11))
	)
)
(13 Color (51 51)
	(
		(Entity (50 50) ())
	)
)
(14 Processing_materials (48 48)
	(
		(Material (50 50) ())
		(Agent (19 19) (7))
		(Result (51 51) (13))
	)
)
(15 Possession (55 55)
	(
		(Owner (54 54) ())
		(Possession (58 58) ())
	)
)
(16 Color (57 57)
	(
		(Entity (5 5) ())
	)
)
(17 Negation (56 56)
	(
		(Negated_proposition (54 54) ())
		(Negated_proposition (58 58) ())
	)
)
(18 Manufacturing (67 67)
	(
		(Producer (7 7) ())
		(Product (69 69) ())
	)
)
(19 Capability (66 66)
	(
		(Entity (7 7) ())
		(Event (11 11) (5))
	)
)
(20 Color (68 68)
	(
		(Entity (4 4) (1))
	)
)
(21 Cause_to_amalgamate (73 73)
	(
		(Agent (7 7) ())
		(Parts (75 75) ())
	)
)
(22 Color (77 77)
	(
		(Entity (42 42) (11))
		(Color (28 28) (9))
	)
)
(23 Color (74 74)
	(
		(Entity (4 4) (1))
	)
)
(24 Color (80 80)
	(
		(Color (7 7) ())
	)
)
(25 Color (84 84)
	(
		(Color (80 80) (24))
		(Color (4 4) (1))
	)
)
)
)
(
; story sentence text for lookup
("Frank and little May are in the field with the wagon." "They have come to find flowers." "May has a red flower." "Frank has three yellow flowers." "He will let May have them." "She will take them to the wagon She is glad to get the pretty flowers.")
; events
(
(0 Size (2 2)
	(
		(Entity (3 3) ())
	)
)
(1 Interior_profile_relation (5 5)
	(
		(Figure (0 0) ())
		(Ground (7 7) (3))
		(Direction (10 10) (2))
	)
)
(2 Containers (10 10)
	(
		(Container (10 10) ())
	)
)
(3 Locale_by_use (7 7)
	(
		(Locale (7 7) ())
	)
)
(4 Arriving (14 14)
	(
		(Theme (12 12) ())
		(Goal (17 17) ())
	)
)
(5 Becoming_aware (16 16)
	(
		(Cognizer (12 12) ())
		(Phenomenon (17 17) ())
	)
)
(6 Part_piece (23 23)
	(
		(Piece (23 23) ())
		(Piece_prop (3 3) ())
	)
)
(7 Color (22 22)
	(
		(Entity (23 23) (6))
		(Color (3 3) ())
	)
)
(8 Cardinal_numbers (27 27)
	(
		(Number (27 27) ())
		(Entity (29 29) ())
	)
)
(9 Possession (26 26)
	(
		(Owner (12 12) ())
		(Possession (29 29) ())
	)
)
(10 Color (28 28)
	(
		(Entity (23 23) (6))
		(Color (3 3) ())
	)
)
(11 Dominate_competitor (33 35)
	(
		(Manner (36 36) ())
		(Agent (12 12) ())
		(Agent (3 3) ())
	)
)
(12 Getting (49 49)
	(
		(Recipient (7 7) (3))
		(Theme (52 52) (13))
	)
)
(13 Food (52 52)
	(
		(Descriptor (51 51) (16))
		(Food (52 52) ())
	)
)
(14 Bringing (40 40)
	(
		(Agent (12 12) ())
		(Goal (44 44) (17))
		(Theme (3 3) ())
	)
)
(15 Emotions_by_stimulus (47 47)
	(
		(Experiencer (7 7) (3))
		(Stimulus (52 52) (13))
	)
)
(16 Aesthetics (51 51)
	(
		(Entity (52 52) (13))
	)
)
(17 Containers (44 44)
	(
		(Container (44 44) ())
	)
)
)
)
(
; story sentence text for lookup
("I was at work." "I was using the walking stacker." "My friend stood in my way." "He wanted me to get certified first." "I almost ran him over.")
; events
(
(0 Spatial_co-location (2 2)
	(
		(Figure (0 0) ())
		(Ground (3 3) (1))
	)
)
(1 Locale_by_use (3 3)
	(
		(Constituent_parts (0 0) ())
		(Use (3 3) ())
	)
)
(2 Using (7 7)
	(
		(Agent (0 0) ())
		(Instrument (10 10) ())
	)
)
(3 Self_motion (9 9)
	(
		(Self_mover (10 10) ())
	)
)
(4 Personal_relationship (13 13)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (13 13) ())
	)
)
(5 Verdict (24 24)
	(
		(Defendant (21 21) ())
	)
)
(6 Desiring (20 20)
	(
		(Experiencer (0 0) ())
		(Focal_participant (21 21) ())
		(Event (22 25) (5 7))
	)
)
(7 Transition_to_state (23 23)
	(
		(Final_quality (10 10) ())
		(Entity (21 21) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom's dog escaped." "Tom asked his friend to help find the dog." "They covered a lot of ground looking." "They never found the dog." "Tom was very upset.")
; events
(
(0 Escaping (3 3)
	(
		(Escapee (2 2) ())
	)
)
(1 Assistance (10 10)
	(
		(Helper (8 8) (2))
		(Goal (13 13) (4))
	)
)
(2 Personal_relationship (8 8)
	(
		(Partner_2 (7 7) ())
		(Partner_1 (8 8) ())
	)
)
(3 Locating (11 11)
	(
		(Perceiver (8 8) (2))
		(Sought_entity (13 13) (4))
	)
)
(4 Animals (13 13)
	(
		(Animal (13 13) ())
	)
)
(5 Request (6 6)
	(
		(Addressee (8 8) (2))
		(Speaker (5 5) ())
		(Message (13 13) (4))
	)
)
(6 Quantified_mass (17 18)
	(
		(Quantity (8 8) (2))
		(Mass (20 20) (8))
	)
)
(7 Distributed_position (16 16)
	(
		(Theme (5 5) ())
		(Location (18 18) ())
	)
)
(8 Natural_features (20 20)
	(
		(Locale (20 20) ())
	)
)
(9 Perception_active (21 21)
	(
		(Perceiver_agentive (5 5) ())
	)
)
(10 Locating (25 25)
	(
		(Perceiver (5 5) ())
		(Sought_entity (27 27) (12))
	)
)
(11 Negation (24 24)
	(
		(Negated_proposition (5 5) ())
		(Negated_proposition (27 27) (12))
	)
)
(12 Animals (27 27)
	(
		(Animal (27 27) ())
	)
)
(13 Emotion_directed (32 32)
	(
		(Experiencer (5 5) ())
		(Degree (7 7) ())
	)
)
)
)
(
; story sentence text for lookup
("The man turned on the light." "The bulb made a noise." "The light went out." "The man replaced the bulb." "Light filled the man's room.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Sensation (11 11)
	(
		(Source (8 8) ())
	)
)
(2 Replacing (20 20)
	(
		(New (22 22) ())
		(Agent (8 8) ())
	)
)
(3 People (19 19)
	(
		(Person (1 1) (0))
	)
)
(4 Location_of_light (24 24)
	(
	)
)
(5 Distributed_position (25 25)
	(
		(Theme (24 24) (4))
		(Location (29 29) (6))
	)
)
(6 Building_subparts (29 29)
	(
	)
)
(7 People (27 27)
	(
		(Person (27 27) ())
	)
)
)
)
(
; story sentence text for lookup
("Tomorrow was father's day." "Jack wanted to get his father a new grill." "Jack went to the store." "Got a nice new grill." "His father loved his new grill.")
; events
(
(0 Calendric_unit (0 0)
	(
		(Unit (0 0) ())
	)
)
(1 Kinship (2 2)
	(
	)
)
(2 Calendric_unit (4 4)
	(
		(Unit (4 4) ())
		(Name (2 3) (1))
	)
)
(3 Desiring (7 7)
	(
		(Experiencer (0 0) (0))
		(Event (14 14) ())
	)
)
(4 Kinship (11 11)
	(
		(Alter (11 11) ())
		(Ego (4 4) (2))
	)
)
(5 Commerce_buy (9 9)
	(
		(Recipient (10 11) (4))
		(Buyer (0 0) (0))
		(Goods (14 14) ())
	)
)
(6 Age (13 13)
	(
		(Entity (14 14) ())
		(Age (13 13) ())
	)
)
(7 Motion (17 17)
	(
		(Theme (0 0) (0))
		(Goal (20 20) (8))
	)
)
(8 Businesses (20 20)
	(
		(Business (4 4) (2))
	)
)
(9 Possession (22 22)
	(
		(Possession (26 26) ())
	)
)
(10 Stimulus_focus (24 24)
	(
		(Stimulus (4 4) (2))
	)
)
(11 Age (25 25)
	(
		(Entity (4 4) (2))
		(Age (25 25) ())
	)
)
(12 Experiencer_focus (30 30)
	(
		(Content (33 33) ())
		(Experiencer (29 29) (13))
	)
)
(13 Kinship (29 29)
	(
		(Ego (0 0) (0))
		(Alter (29 29) ())
	)
)
(14 Age (32 32)
	(
		(Entity (11 11) (4))
		(Age (4 4) (2))
	)
)
)
)
(
; story sentence text for lookup
("A girl went to play with her friends." "She went across the street." "The parents went over to get her." "She was lost." "They found her in their home.")
; events
(
(0 Motion (2 2)
	(
		(Purpose (7 7) (2))
		(Theme (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Personal_relationship (7 7)
	(
		(Partner_1 (7 7) ())
		(Partner_2 (6 6) ())
	)
)
(3 Motion (10 10)
	(
		(Theme (9 9) ())
		(Path (13 13) (4))
	)
)
(4 Roadways (13 13)
	(
		(Roadway (13 13) ())
	)
)
(5 Kinship (16 16)
	(
		(Alter (1 1) (1))
	)
)
(6 Becoming_aware (28 28)
	(
		(Cognizer (9 9) ())
		(Phenomenon (29 29) ())
		(Ground (32 32) (7))
	)
)
(7 Buildings (32 32)
	(
		(Building (32 32) ())
	)
)
)
)
(
; story sentence text for lookup
("We had a read in one day at school." "All we did the whole day was read." "I took some books from home." "I sat in a bean bag." "It was the most relaxing day ever.")
; events
(
(0 Locale_by_use (8 8)
	(
		(Locale (8 8) ())
	)
)
(1 Calendric_unit (6 6)
	(
		(Count (5 5) ())
		(Unit (6 6) ())
	)
)
(2 Reading_activity (3 3)
	(
		(Reader (0 0) ())
	)
)
(3 Intentionally_act (12 12)
	(
		(Act (0 0) ())
		(Agent (11 11) ())
		(Time (15 15) (4))
	)
)
(4 Calendric_unit (15 15)
	(
		(Unit (5 5) ())
	)
)
(5 Reading_activity (17 17)
	(
		(Text (11 11) ())
	)
)
(6 Removing (20 20)
	(
		(Theme (22 22) (8))
		(Agent (0 0) ())
		(Source (24 24) (7))
	)
)
(7 Buildings (24 24)
	(
		(Building (5 5) ())
	)
)
(8 Text (22 22)
	(
		(Text (22 22) ())
	)
)
(9 Posture (27 27)
	(
		(Agent (0 0) ())
		(Point_of_contact (11 11) ())
		(Location (31 31) (10))
	)
)
(10 Containers (31 31)
	(
		(Use (30 30) ())
		(Container (5 5) ())
	)
)
(11 Stimulus_focus (37 37)
	(
		(Stimulus (5 5) ())
		(Degree (22 22) (8))
	)
)
(12 Calendric_unit (38 38)
	(
		(Unit (5 5) ())
	)
)
)
)
(
; story sentence text for lookup
("The little boy has a red wagon." "The boy will let little May ride in it." "Come, May, come and see my wagon." "You may get in it, and have a ride." "I will take you with me to the fields." "You may have a good ride.")
; events
(
(0 Color (5 5)
	(
		(Entity (6 6) (3))
		(Color (5 5) ())
	)
)
(1 Possession (3 3)
	(
		(Owner (2 2) (2))
		(Possession (6 6) (3))
	)
)
(2 People_by_age (2 2)
	(
		(Person (2 2) ())
		(Descriptor (1 1) (4))
	)
)
(3 Containers (6 6)
	(
		(Container (6 6) ())
		(Descriptor (5 5) (0))
	)
)
(4 Size (1 1)
	(
		(Entity (2 2) (2))
	)
)
(5 People_by_age (9 9)
	(
		(Person (1 1) (4))
	)
)
(6 Operate_vehicle (14 14)
	(
		(Driver (13 13) ())
		(Vehicle (16 16) ())
	)
)
(7 Perception_experience (24 24)
	(
		(Phenomenon (16 16) ())
	)
)
(8 Arriving (22 22)
	(
	)
)
(9 Ride_vehicle (37 37)
	(
		(Theme (28 28) ())
	)
)
(10 Bringing (41 41)
	(
		(Goal (13 13) ())
		(Agent (28 28) ())
		(Theme (42 42) ())
		(Goal (47 47) ())
	)
)
(11 Likelihood (50 50)
	(
		(Hypothetical_event (28 28) ())
		(Hypothetical_event (54 54) ())
	)
)
(12 Desirability (53 53)
	(
		(Evaluee (5 5) (0))
	)
)
)
)
(
; story sentence text for lookup
("Sandy loved to hike." "On her hike she ran into a bear." "She wasn't sure what to do." "She stayed still and quiet." "The bear finally ran away.")
; events
(
(0 Self_motion (3 3)
	(
		(Self_mover (0 0) ())
	)
)
(1 Experiencer_focus (1 1)
	(
		(Content (2 3) (0))
		(Experiencer (0 0) ())
	)
)
(2 Self_motion (7 7)
	(
		(Self_mover (6 6) ())
	)
)
(3 Self_motion (9 9)
	(
		(Depictive (7 7) (2))
		(Goal (12 12) ())
		(Self_mover (8 8) ())
	)
)
(4 Intentionally_act (20 20)
	(
		(Agent (0 0) ())
		(Act (18 18) ())
	)
)
(5 Certainty (17 17)
	(
		(Cognizer (0 0) ())
		(Content (18 18) ())
	)
)
(6 State_continue (23 23)
	(
		(Entity (0 0) ())
		(State (24 24) ())
	)
)
(7 Volubility (26 26)
	(
		(Speaker (0 0) ())
	)
)
(8 Self_motion (31 31)
	(
		(Time (24 24) ())
		(Source (18 18) ())
		(Self_mover (29 29) ())
	)
)
)
)
(
; story sentence text for lookup
("Kara wanted to go swimming." "She went to the lake." "There, she dove into the water." "She swam for almost an hour!" "After, she felt refreshed and happy.")
; events
(
(0 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (2 4) (1 2))
	)
)
(1 Self_motion (4 4)
	(
		(Self_mover (0 0) ())
	)
)
(2 Dimension (3 3)
	(
		(Measurement (0 0) ())
		(Measurement (4 4) (1))
	)
)
(3 Motion (7 7)
	(
		(Theme (0 0) ())
		(Goal (10 10) (4))
	)
)
(4 Natural_features (10 10)
	(
		(Locale (4 4) (1))
	)
)
(5 Self_motion (15 15)
	(
		(Place (0 0) ())
		(Goal (18 18) (6))
		(Self_mover (14 14) ())
	)
)
(6 Natural_features (18 18)
	(
		(Locale (18 18) ())
	)
)
(7 Self_motion (21 21)
	(
		(Self_mover (0 0) ())
		(Duration (10 10) (4))
	)
)
(8 Calendric_unit (25 25)
	(
		(Count (4 4) (1))
		(Unit (25 25) ())
	)
)
(9 Emotion_directed (33 33)
	(
		(Experiencer (14 14) ())
	)
)
(10 Time_vector (27 27)
	(
		(Event (29 29) ())
	)
)
(11 Feeling (30 30)
	(
		(Experiencer (14 14) ())
	)
)
(12 Emotion_directed (31 31)
	(
		(Experiencer (14 14) ())
	)
)
)
)
(
; story sentence text for lookup
("We were out all day yesterday." "The heat made me tired." "I could barely function." "So when we got to the house I slept." "I had a long nap.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Causation (9 9)
	(
		(Effect (11 11) (2))
		(Affected (10 10) ())
		(Cause (8 8) ())
	)
)
(2 Biological_urge (11 11)
	(
		(Experiencer (10 10) ())
	)
)
(3 Possibility (14 14)
	(
		(Possible_event (13 13) ())
		(Possible_event (15 16) ())
	)
)
(4 Sleep (26 26)
	(
		(Sleeper (25 25) ())
		(Time (20 20) ())
	)
)
(5 Buildings (24 24)
	(
		(Building (24 24) ())
	)
)
(6 Arriving (21 21)
	(
		(Theme (20 20) ())
		(Goal (24 24) (5))
	)
)
(7 Sleep (32 32)
	(
		(Sleeper (13 13) ())
		(Duration (10 10) ())
	)
)
(8 Duration_description (31 31)
	(
		(Eventuality (11 11) (2))
	)
)
)
)
(
; story sentence text for lookup
("Tom loved fast boats." "He got into racing." "It was pretty dangerous." "Tom flipped his boat once." "He gave up racing after that.")
; events
(
(0 Speed_description (2 2)
	(
		(Entity (3 3) (2))
	)
)
(1 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (3 3) (2))
	)
)
(2 Vehicle (3 3)
	(
		(Descriptor (2 2) (0))
		(Vehicle (3 3) ())
	)
)
(3 Operate_vehicle (8 8)
	(
		(Driver (0 0) ())
		(Event (3 3) (2))
	)
)
(4 Risky_situation (13 13)
	(
		(Dangerous_entity (0 0) ())
		(Degree (2 2) (0))
	)
)
(5 Cause_motion (16 16)
	(
		(Duration (19 19) ())
		(Agent (0 0) ())
		(Theme (3 3) (2))
	)
)
(6 Vehicle (18 18)
	(
		(Vehicle (3 3) (2))
	)
)
(7 Activity_stop (22 23)
	(
		(Agent (0 0) ())
		(Activity (3 3) (2))
		(Time (26 26) ())
	)
)
(8 Operate_vehicle (24 24)
	(
		(Driver (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The rose bush bloomed." "The man cut a rose." "He gave it to the woman." "The woman got mad." "She did not like her roses cut.")
; events
(
(0 Grinding (7 7)
	(
		(Patient (9 9) ())
		(Grinder (6 6) (1))
	)
)
(1 People (6 6)
	(
		(Person (6 6) ())
	)
)
(2 Giving (12 12)
	(
		(Donor (11 11) ())
		(Theme (13 13) ())
		(Recipient (16 16) (3))
	)
)
(3 People (16 16)
	(
		(Person (16 16) ())
	)
)
(4 People (19 19)
	(
		(Person (6 6) (1))
	)
)
(5 Emotion_directed (21 21)
	(
		(Experiencer (6 6) (1))
	)
)
(6 Cutting (29 29)
	(
		(Item (28 28) ())
	)
)
(7 Experiencer_focus (26 26)
	(
		(Experiencer (11 11) ())
		(Content (29 29) (6))
		(Content (28 28) ())
	)
)
)
)
(
; story sentence text for lookup
("What a bright day this is!" "The sky is as blue as it can be." "Lucy and her mother are in the woods." "They have found a good place under a green tree." "They sit in the shade of the tree and listen to the birds that are singing above them." "Robin Redbreast is in the tree." "Lucy sees him as he jumps about among the leaves." "By and by he will fly away to his nest." "Lucy wonders where it is.")
; events
(
(0 Level_of_light (2 2)
	(
		(Location (3 3) (1))
	)
)
(1 Calendric_unit (3 3)
	(
		(Unit (3 3) ())
	)
)
(2 Level_of_light (11 11)
	(
		(Degree (3 3) (1))
		(Location (8 8) ())
	)
)
(3 Biological_area (24 24)
	(
		(Locale (24 24) ())
	)
)
(4 Interior_profile_relation (22 22)
	(
		(Figure (17 17) ())
		(Ground (24 24) (3))
	)
)
(5 Kinship (20 20)
	(
		(Ego (19 19) ())
		(Alter (3 3) (1))
	)
)
(6 Locale (31 31)
	(
		(Locale (31 31) ())
	)
)
(7 Locating (28 28)
	(
		(Perceiver (26 26) ())
		(Sought_entity (31 31) (6))
	)
)
(8 Non-gradable_proximity (32 32)
	(
		(Ground (35 35) ())
		(Figure (31 31) (6))
	)
)
(9 Color (34 34)
	(
		(Color (34 34) ())
		(Entity (35 35) ())
	)
)
(10 Usefulness (30 30)
	(
		(Entity (31 31) (6))
	)
)
(11 Perception_active (46 46)
	(
		(Perceiver_agentive (26 26) ())
		(Phenomenon (49 49) ())
	)
)
(12 Make_noise (52 52)
	(
		(Sound (52 52) ())
		(Sound_source (49 49) ())
		(Sound_source (50 50) ())
	)
)
(13 Posture (38 38)
	(
		(Agent (26 26) ())
		(Location (41 41) ())
		(Point_of_contact (38 38) ())
	)
)
(14 Interior_profile_relation (59 59)
	(
		(Figure (8 8) ())
		(Ground (61 61) ())
	)
)
(15 Perception_experience (64 64)
	(
		(Perceiver_passive (26 26) ())
		(Depictive (31 31) (6))
		(Phenomenon (19 19) ())
	)
)
(16 Self_motion (68 68)
	(
		(Area (69 69) ())
		(Self_mover (67 67) ())
		(Area (35 35) ())
	)
)
(17 Self_motion (79 79)
	(
		(Goal (35 35) ())
		(Source (69 69) ())
		(Self_mover (3 3) (1))
	)
)
(18 Cogitation (86 86)
	(
		(Cognizer (26 26) ())
		(Topic (88 88) ())
	)
)
(19 Spatial_co-location (87 87)
	(
		(Figure (3 3) (1))
		(Ground (19 19) ())
	)
)
)
)
(
; story sentence text for lookup
("I used to run around a pond." "It was there one fall." "The next fall it had vanished." "There was nothing but dirt." "I was surprised.")
; events
(
(0 Negation (1 1)
	(
		(Negated_proposition (0 0) ())
		(Negated_proposition (6 6) (2))
	)
)
(1 Self_motion (3 3)
	(
		(Self_mover (0 0) ())
		(Area (6 6) (2))
	)
)
(2 Natural_features (6 6)
	(
		(Locale (6 6) ())
	)
)
(3 Locative_relation (10 10)
	(
		(Figure (0 0) ())
		(Ground (10 10) ())
		(Time (11 12) (4))
	)
)
(4 Calendric_unit (12 12)
	(
		(Unit (12 12) ())
		(Count (11 11) ())
	)
)
(5 Calendric_unit (16 16)
	(
		(Unit (10 10) (3))
		(Relative_time (15 15) ())
	)
)
(6 Departing (19 19)
	(
		(Theme (11 11) ())
	)
)
(7 Existence (21 22)
	(
		(Entity (25 25) ())
	)
)
(8 Just_found_out (29 29)
	(
		(Experiencer (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The man folded the clothes." "He put them away." "The next day they were gone." "He went to look for them." "His wife was refolding them.")
; events
(
(0 Reshaping (2 2)
	(
		(Patient (4 4) (2))
		(Deformer (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Clothing (4 4)
	(
		(Garment (4 4) ())
	)
)
(3 Placing (7 7)
	(
		(Agent (6 6) ())
		(Theme (8 8) ())
		(Source (9 9) ())
	)
)
(4 Calendric_unit (13 13)
	(
		(Unit (8 8) ())
		(Relative_time (1 1) (1))
	)
)
(5 Relative_time (12 12)
	(
		(Focal_occasion (8 8) ())
	)
)
(6 Motion (19 19)
	(
		(Theme (6 6) ())
		(Purpose (23 23) ())
	)
)
(7 Seeking (21 21)
	(
		(Sought_entity (23 23) ())
		(Cognizer_agent (6 6) ())
	)
)
(8 Personal_relationship (26 26)
	(
		(Partner_2 (6 6) ())
		(Partner_1 (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("I love little Lucy." "But now she has gone far away to her home.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Content (3 3) ())
		(Experiencer (0 0) ())
	)
)
(1 Motion (9 9)
	(
		(Goal (14 14) (2))
		(Area (10 11) ())
		(Theme (7 7) ())
	)
)
(2 Buildings (14 14)
	(
		(Building (14 14) ())
	)
)
)
)
(
; story sentence text for lookup
("Larry found a hurt bird." "He put it in a shoe box." "He fed the bird." "The bird survived." "Larry kept it in a cage in his room.")
; events
(
(0 Locating (1 1)
	(
		(Perceiver (0 0) ())
		(Sought_entity (4 4) ())
	)
)
(1 Emotion_directed (3 3)
	(
		(Experiencer (4 4) ())
	)
)
(2 Placing (7 7)
	(
		(Agent (0 0) ())
		(Theme (8 8) ())
		(Goal (12 12) (3))
	)
)
(3 Containers (12 12)
	(
		(Use (11 11) ())
		(Container (12 12) ())
	)
)
(4 Cooking_creation (15 15)
	(
		(Cook (0 0) ())
		(Recipient (17 17) ())
	)
)
(5 Surviving (21 21)
	(
		(Survivor (20 20) ())
	)
)
(6 Containers (28 28)
	(
		(Relative_location (31 31) (8))
		(Container (11 11) ())
	)
)
(7 Storing (24 24)
	(
		(Location (31 31) (8))
		(Agent (0 0) ())
		(Theme (8 8) ())
		(Location (28 28) (6))
	)
)
(8 Building_subparts (31 31)
	(
		(Building_part (31 31) ())
	)
)
)
)
(
; story sentence text for lookup
("Blake wanted to catch a chick." "There were chicks near a hen." "The chicks could get through the fence." "The hen could not." "He never caught one.")
; events
(
(0 Animals (5 5)
	(
		(Animal (5 5) ())
	)
)
(1 Desiring (1 1)
	(
		(Experiencer (0 0) ())
		(Event (5 5) (0))
	)
)
(2 Subsisting (3 3)
	(
		(Degree (0 0) ())
		(Entity (5 5) (0))
	)
)
(3 People (9 9)
	(
		(Person (9 9) ())
	)
)
(4 Gradable_proximity (10 10)
	(
		(Figure (9 9) (3))
		(Ground (5 5) (0))
	)
)
(5 Existence (7 8)
	(
		(Entity (9 9) (3))
		(Place (12 12) ())
	)
)
(6 People (15 15)
	(
		(Person (15 15) ())
	)
)
(7 Arriving (17 17)
	(
		(Theme (15 15) (6))
		(Path (20 20) ())
	)
)
(8 Possibility (16 16)
	(
		(Possible_event (20 20) ())
		(Possible_event (15 15) (6))
	)
)
(9 Possibility (24 24)
	(
		(Possible_event (15 15) (6))
	)
)
)
)
(
; story sentence text for lookup
("Kim needed some new chairs." "She threw away her old ones." "Kim went to the store and got more." "She set up her chairs." "They looked nice.")
; events
(
(0 Needing (1 1)
	(
		(Cognizer (0 0) ())
		(Dependent (4 4) ())
	)
)
(1 Age (3 3)
	(
		(Entity (4 4) ())
	)
)
(2 Age (10 10)
	(
		(Entity (11 11) (3))
	)
)
(3 Food (11 11)
	(
		(Descriptor (4 4) ())
		(Food (11 11) ())
	)
)
(4 Cause_motion (7 8)
	(
		(Agent (0 0) ())
		(Theme (11 11) (3))
		(Source (8 8) ())
	)
)
(5 Motion (14 14)
	(
		(Theme (0 0) ())
		(Goal (4 4) ())
	)
)
(6 Businesses (17 17)
	(
		(Business (4 4) ())
	)
)
(7 Commerce_buy (19 19)
	(
		(Buyer (0 0) ())
		(Goods (20 20) (8))
	)
)
(8 Increment (20 20)
	(
		(Added_set (20 20) ())
	)
)
(9 Placing (23 24)
	(
		(Agent (0 0) ())
		(Theme (26 26) ())
	)
)
(10 Stimulus_focus (30 30)
	(
		(Stimulus (0 0) ())
	)
)
(11 Give_impression (29 29)
	(
		(Phenomenon (0 0) ())
		(Characterization (8 8) ())
	)
)
)
)
(
; story sentence text for lookup
("I was afraid to try a gainer." "I had to do it my own way." "I got to the board." "I made the board go up and down." "Then I finally did a gainer.")
; events
(
(0 Experiencer_focus (2 2)
	(
		(Experiencer (0 0) ())
		(Content (6 6) ())
	)
)
(1 Attempt_means (4 4)
	(
		(Agent (0 0) ())
		(Means (6 6) ())
	)
)
(2 Required_event (9 10)
	(
		(Required_situation (0 0) ())
		(Required_situation (12 12) ())
	)
)
(3 Means (15 15)
	(
		(Means (15 15) ())
	)
)
(4 Intentionally_act (11 11)
	(
		(Agent (0 0) ())
		(Act (12 12) ())
		(Manner (13 15) (3))
	)
)
)
)
(
; story sentence text for lookup
("Susie was so hungry." "She filled her plate to the top." "She needed to eat." "All the sudden she got full." "She put on too much.")
; events
(
(0 Biological_urge (3 3)
	(
		(Degree (2 2) ())
		(Experiencer (0 0) ())
	)
)
(1 Filling (6 6)
	(
		(Goal (8 8) (3))
		(Agent (0 0) ())
		(Result (11 11) (2))
	)
)
(2 Part_orientational (11 11)
	(
		(Part (11 11) ())
	)
)
(3 Containers (8 8)
	(
		(Owner (2 2) ())
		(Container (8 8) ())
	)
)
(4 Needing (14 14)
	(
		(Requirement (8 8) (3))
		(Cognizer (0 0) ())
	)
)
(5 Ingestion (16 16)
	(
		(Ingestor (0 0) ())
	)
)
(6 Transition_to_state (22 22)
	(
		(Entity (8 8) (3))
		(Final_quality (23 23) (7))
	)
)
(7 Biological_urge (23 23)
	(
		(Experiencer (8 8) (3))
	)
)
(8 Remembering_information (26 29)
	(
		(Cognizer (0 0) ())
		(Time (28 29) ())
	)
)
)
)
(
; story sentence text for lookup
("Grace is running after the butterfly." "Can she catch it?" "I think not." "It can fly faster than Grace can run." "Grace has many flowers in her garden." "The butterflies come there because they like the flowers." "They fly among them all day.")
; events
(
(0 Self_motion (2 2)
	(
		(Self_mover (0 0) ())
		(Cotheme (5 5) ())
	)
)
(1 Awareness (13 13)
	(
		(Cognizer (0 0) ())
	)
)
(2 Self_motion (18 18)
	(
		(Self_mover (0 0) ())
		(Speed (21 21) ())
	)
)
(3 Speed_description (19 19)
	(
		(Entity (0 0) ())
		(Degree (21 21) ())
	)
)
(4 Self_motion (23 23)
	(
		(Self_mover (21 21) ())
	)
)
(5 Capability (17 17)
	(
		(Entity (0 0) ())
		(Event (21 21) ())
	)
)
(6 Capability (22 22)
	(
		(Event (23 23) (4))
		(Entity (21 21) ())
	)
)
(7 Quantified_mass (27 27)
	(
		(Quantity (27 27) ())
		(Individuals (28 28) ())
	)
)
(8 Have_associated (26 26)
	(
		(Entity (28 28) ())
		(Topical_entity (0 0) ())
		(Place (31 31) (10))
	)
)
(9 Interior_profile_relation (29 29)
	(
		(Figure (28 28) ())
		(Ground (31 31) (10))
	)
)
(10 Locale_by_use (31 31)
	(
		(Locale (31 31) ())
	)
)
(11 Experiencer_focus (39 39)
	(
		(Experiencer (21 21) ())
		(Content (41 41) ())
	)
)
(12 Arriving (35 35)
	(
		(Theme (34 34) ())
		(Purpose (38 38) ())
		(Goal (28 28) ())
	)
)
(13 Purpose (37 37)
	(
		(Means (34 34) ())
		(Means (38 38) ())
	)
)
(14 Self_motion (44 44)
	(
		(Area (28 28) ())
		(Self_mover (0 0) ())
	)
)
(15 Calendric_unit (48 48)
	(
		(Unit (21 21) ())
	)
)
)
)
(
; story sentence text for lookup
("It was a very long day." "It was also very hot outside." "Fred was about to walk out the door." "Then he remembered the sunscreen." "He had to go back outside.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
		(Count (3 3) ())
	)
)
(1 Duration_description (4 4)
	(
		(Period (5 5) (0))
		(Degree (3 3) ())
	)
)
(2 Temporal_collocation (12 12)
	(
		(Trajector_event (10 11) (3))
	)
)
(3 Ambient_temperature (11 11)
	(
		(Place (5 5) (0))
		(Degree (3 3) ())
	)
)
(4 Self_motion (18 18)
	(
		(Self_mover (14 14) ())
		(Path (21 21) (5))
	)
)
(5 Connecting_architecture (21 21)
	(
		(Part (21 21) ())
	)
)
(6 Memory (25 25)
	(
		(Time (14 14) ())
		(Cognizer (24 24) ())
		(Content (10 11) (3))
	)
)
(7 Accoutrements (27 27)
	(
		(Accoutrement (27 27) ())
	)
)
(8 Required_event (30 31)
	(
		(Required_situation (14 14) ())
		(Required_situation (32 34) (9 10))
	)
)
(9 Interior_profile_relation (34 34)
	(
	)
)
(10 Motion (32 32)
	(
		(Goal (5 5) (0))
		(Theme (14 14) ())
		(Goal (27 27) (7))
	)
)
)
)
(
; story sentence text for lookup
("A new teacher had a bad class." "The children threw paper." "The paper hit the teacher." "She turned back at the class." "She told them to shut up and sit down.")
; events
(
(0 Education_teaching (2 2)
	(
		(Teacher (2 2) ())
	)
)
(1 Age (1 1)
	(
		(Entity (2 2) (0))
		(Age (1 1) ())
	)
)
(2 Desirability (5 5)
	(
		(Evaluee (6 6) ())
	)
)
(3 Cause_motion (10 10)
	(
		(Theme (11 11) ())
		(Agent (9 9) (4))
	)
)
(4 People_by_age (9 9)
	(
		(Person (1 1) (1))
	)
)
(5 Impact (15 15)
	(
		(Impactee (17 17) (6))
		(Impactor (9 9) (4))
	)
)
(6 Education_teaching (17 17)
	(
		(Teacher (17 17) ())
	)
)
(7 Change_posture (33 33)
	(
		(Protagonist (2 2) (0))
	)
)
(8 Request (27 27)
	(
		(Speaker (26 26) ())
		(Addressee (2 2) (0))
		(Message (29 34) (7 9))
	)
)
(9 Becoming_silent (30 31)
	(
		(Speaker (2 2) (0))
	)
)
)
)
(
; story sentence text for lookup
("A new teacher started the day." "She asked them to sit." "They didn't sit." "She didn't know what to do." "She asked the principal to help.")
; events
(
(0 Education_teaching (2 2)
	(
		(Teacher (2 2) ())
	)
)
(1 Age (1 1)
	(
		(Entity (2 2) (0))
		(Age (1 1) ())
	)
)
(2 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(3 Activity_start (3 3)
	(
		(Activity (4 5) (2))
		(Agent (2 2) (0))
	)
)
(4 Request (8 8)
	(
		(Speaker (7 7) ())
		(Addressee (2 2) (0))
		(Message (10 11) (5))
	)
)
(5 Change_posture (11 11)
	(
		(Protagonist (2 2) (0))
	)
)
(6 Posture (16 16)
	(
		(Agent (7 7) ())
	)
)
(7 Intentionally_act (24 24)
	(
		(Agent (7 7) ())
		(Act (22 22) ())
	)
)
(8 Awareness (21 21)
	(
		(Cognizer (7 7) ())
		(Content (22 22) ())
	)
)
(9 Request (27 27)
	(
		(Addressee (29 29) (11))
		(Speaker (7 7) ())
		(Message (4 5) (2))
	)
)
(10 Assistance (31 31)
	(
		(Helper (29 29) (11))
	)
)
(11 Leadership (29 29)
	(
		(Leader (29 29) ())
	)
)
)
)
(
; story sentence text for lookup
("I was having a bad day." "My hair was a mess." "Then I went to cvs." "When I was there I got hair stuff." "Then I used it and it was great.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Desirability (4 4)
	(
		(Evaluee (5 5) (0))
	)
)
(2 Body_parts (8 8)
	(
		(Possessor (7 7) ())
		(Body_part (8 8) ())
	)
)
(3 Possession (24 24)
	(
		(Possession (26 26) (5))
		(Owner (23 23) ())
	)
)
(4 Body_parts (25 25)
	(
		(Body_part (26 26) (5))
	)
)
(5 Ingredients (26 26)
	(
		(Material (26 26) ())
		(Use (25 25) (4))
	)
)
(6 Calendric_unit (28 28)
	(
		(Unit (7 7) ())
		(Trajector_event (29 29) ())
	)
)
(7 Using (30 30)
	(
		(Time (7 7) ())
		(Agent (8 8) (2))
		(Instrument (31 31) ())
	)
)
(8 Desirability (35 35)
	(
		(Evaluee (5 5) (0))
	)
)
)
)
(
; story sentence text for lookup
("We ordered some food." "It was kind of gross." "It was not what I expected." "I had to throw it away." "I never got it again.")
; events
(
(0 Request_entity (1 1)
	(
		(Customer (0 0) ())
		(Entity (3 3) (1))
	)
)
(1 Food (3 3)
	(
		(Food (3 3) ())
	)
)
(2 Desirability (9 9)
	(
		(Degree (3 3) (1))
		(Evaluee (0 0) ())
	)
)
(3 Expectation (16 16)
	(
		(Cognizer (15 15) ())
		(Phenomenon (3 3) (1))
	)
)
(4 Required_event (19 20)
	(
		(Required_situation (0 0) ())
		(Required_situation (22 22) ())
	)
)
(5 Cause_motion (21 21)
	(
		(Source (23 23) ())
		(Agent (0 0) ())
		(Theme (15 15) ())
	)
)
(6 Negation (26 26)
	(
		(Negated_proposition (0 0) ())
		(Negated_proposition (28 28) ())
	)
)
)
)
(
; story sentence text for lookup
("Susie loved chocolate." "So she got a box." "She then decided to go and eat it." "It tasted bad." "She was not happy about it.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Content (2 2) (1))
		(Experiencer (0 0) ())
	)
)
(1 Food (2 2)
	(
	)
)
(2 Measure_volume (8 8)
	(
		(Unit (8 8) ())
		(Count (7 7) ())
	)
)
(3 Deciding (12 12)
	(
		(Cognizer (0 0) ())
		(Decision (17 17) ())
		(Time (11 11) ())
	)
)
(4 Motion (14 14)
	(
		(Theme (0 0) ())
	)
)
(5 Ingestion (16 16)
	(
		(Ingestor (0 0) ())
		(Ingestibles (17 17) ())
	)
)
(6 Give_impression (20 20)
	(
		(Phenomenon (0 0) ())
		(Characterization (2 2) (1))
	)
)
(7 Emotion_directed (26 26)
	(
		(Topic (28 28) ())
		(Experiencer (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The boy can run and play." "The boy can play ball." "The man may see the boy play." "The boy may take the ball." "The baby has a big doll." "The little girl has a ball." "I can see the baby." "The baby may have my ball.")
; events
(
(0 Capability (2 2)
	(
		(Event (3 5) (2))
		(Entity (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Self_motion (3 3)
	(
		(Self_mover (1 1) (1))
	)
)
(3 Capability (9 9)
	(
		(Event (11 11) ())
		(Entity (1 1) (1))
	)
)
(4 People_by_age (8 8)
	(
		(Person (1 1) (1))
	)
)
(5 Competition (10 10)
	(
		(Competition (11 11) ())
		(Participants (1 1) (1))
	)
)
(6 People (14 14)
	(
		(Person (1 1) (1))
	)
)
(7 People_by_age (18 18)
	(
		(Person (18 18) ())
	)
)
(8 Competition (19 19)
	(
		(Participants (18 18) (7))
	)
)
(9 Perception_experience (16 16)
	(
		(Phenomenon (18 18) (7))
		(Phenomenon (19 19) (8))
		(Perceiver_passive (1 1) (1))
	)
)
(10 People_by_age (22 22)
	(
		(Person (1 1) (1))
	)
)
(11 Have_associated (30 30)
	(
		(Entity (3 5) (2))
		(Topical_entity (1 1) (1))
	)
)
(12 People_by_age (29 29)
	(
		(Person (1 1) (1))
	)
)
(13 Size (32 32)
	(
		(Entity (18 18) (7))
	)
)
(14 People (37 37)
	(
		(Person (37 37) ())
		(Persistent_characteristic (1 1) (1))
	)
)
(15 Size (36 36)
	(
		(Entity (37 37) (14))
	)
)
(16 Perception_experience (44 44)
	(
		(Perceiver_passive (42 42) ())
		(Phenomenon (11 11) ())
	)
)
(17 Possibility (43 43)
	(
		(Possible_event (42 42) ())
		(Possible_event (46 46) (18))
	)
)
(18 People_by_age (46 46)
	(
		(Person (11 11) ())
	)
)
(19 Likelihood (50 50)
	(
		(Hypothetical_event (3 5) (2))
		(Hypothetical_event (1 1) (1))
	)
)
(20 People_by_age (49 49)
	(
		(Person (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("The man went fishing." "He caught more than his limit." "He kept all of the fish." "He got caught with too many fish." "He had to pay a big fine.")
; events
(
(0 Existence (2 2)
	(
		(Depictive (3 3) (2))
		(Entity (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Hunting (3 3)
	(
		(Hunter (1 1) (1))
	)
)
(3 Extreme_value (10 10)
	(
		(Value (10 10) ())
		(Entity (9 9) ())
	)
)
(4 Retaining (13 13)
	(
		(Agent (12 12) ())
		(Theme (14 14) ())
	)
)
(5 Food (17 17)
	(
	)
)
(6 Success_or_failure (21 21)
	(
		(Agent (12 12) ())
		(Explanation (25 25) (7))
	)
)
(7 Food (25 25)
	(
	)
)
(8 Required_event (28 29)
	(
		(Required_situation (12 12) ())
		(Required_situation (25 25) (7))
	)
)
(9 Commerce_pay (30 30)
	(
		(Buyer (12 12) ())
		(Money (33 33) ())
	)
)
)
)
(
; story sentence text for lookup
("The boys like to go to the woods." "Here they are now." "Here are the horse and the wagon." "And here is the boy with the drum." "They like to play in the woods." "They like to find pretty flowers." "If they find little birds in a nest, they will not take them." "By and by they will go home." "They will ride home in the wagon.")
; events
(
(0 Experiencer_focus (2 2)
	(
		(Content (7 7) (3))
		(Experiencer (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Motion (4 4)
	(
		(Goal (7 7) (3))
		(Theme (1 1) (1))
	)
)
(3 Biological_area (7 7)
	(
		(Locale (7 7) ())
	)
)
(4 Locative_relation (9 9)
	(
		(Ground (9 9) ())
		(Figure (1 1) (1))
		(Time (12 12) (5))
	)
)
(5 Temporal_collocation (12 12)
	(
		(Trajector_event (10 10) ())
	)
)
(6 Spatial_co-location (14 14)
	(
		(Figure (17 17) ())
	)
)
(7 Containers (20 20)
	(
		(Container (20 20) ())
	)
)
(8 People_by_age (26 26)
	(
		(Person (26 26) ())
		(Descriptor (7 7) (3))
	)
)
(9 Containers (29 29)
	(
		(Container (7 7) (3))
	)
)
(10 Experiencer_focus (32 32)
	(
		(Experiencer (9 9) (4))
		(Content (17 17) ())
	)
)
(11 Competition (34 34)
	(
		(Participants (9 9) (4))
		(Place (37 37) (12))
	)
)
(12 Biological_area (37 37)
	(
		(Locale (20 20) (7))
	)
)
(13 Experiencer_focus (40 40)
	(
		(Experiencer (9 9) (4))
		(Content (44 44) ())
	)
)
(14 Aesthetics (43 43)
	(
		(Entity (44 44) ())
	)
)
(15 Locating (42 42)
	(
		(Sought_entity (44 44) ())
		(Perceiver (9 9) (4))
	)
)
(16 Food (53 53)
	(
		(Descriptor (7 7) (3))
	)
)
(17 Being_named (58 58)
	(
		(Descriptor (55 55) ())
		(Name (59 59) ())
	)
)
(18 Locating (48 48)
	(
		(Location (7 7) (3))
		(Perceiver (1 1) (1))
		(Sought_entity (50 50) ())
	)
)
(19 Interior_profile_relation (51 51)
	(
		(Ground (53 53) (16))
		(Figure (50 50) ())
	)
)
(20 Motion (66 66)
	(
		(Goal (20 20) (7))
		(Theme (12 12) (5))
	)
)
(21 Operate_vehicle (71 71)
	(
		(Driver (9 9) (4))
		(Vehicle (37 37) (12))
		(Goal (12 12) (5))
	)
)
(22 Containers (75 75)
	(
		(Container (20 20) (7))
	)
)
)
)
(
; story sentence text for lookup
("We went to the town today." "It was too hot." "It felt like a sauna." "I couldn't stand it." "I had to sit down.")
; events
(
(0 Calendric_unit (5 5)
	(
		(Unit (5 5) ())
	)
)
(1 Motion (1 1)
	(
		(Theme (0 0) ())
		(Time (5 5) (0))
		(Goal (4 4) (2))
	)
)
(2 Political_locales (4 4)
	(
		(Locale (4 4) ())
	)
)
(3 Ambient_temperature (10 10)
	(
		(Degree (9 9) ())
	)
)
(4 Give_impression (13 13)
	(
		(Phenomenon (0 0) ())
		(Characterization (4 4) (2))
	)
)
(5 Possibility (19 19)
	(
		(Possible_event (0 0) ())
		(Possible_event (22 22) ())
	)
)
(6 Self_motion (21 21)
	(
		(Self_mover (0 0) ())
		(Time (4 4) (2))
	)
)
(7 Required_event (25 26)
	(
		(Required_situation (0 0) ())
		(Required_situation (22 22) ())
	)
)
(8 Change_posture (27 28)
	(
		(Protagonist (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Tom went on a vacation." "He went on a cruise." "It was a ten day trip." "Tom had fun." "Tom wanted to go on another cruise.")
; events
(
(0 Motion (1 1)
	(
		(Theme (0 0) ())
		(Goal (4 4) (1))
	)
)
(1 Intoxication (4 4)
	(
		(Cognizer (0 0) ())
	)
)
(2 Motion (7 7)
	(
		(Theme (0 0) ())
		(Goal (4 4) (1))
	)
)
(3 Vehicle (10 10)
	(
		(Possessor (0 0) ())
		(Vehicle (10 10) ())
	)
)
(4 Travel (17 17)
	(
		(Duration (15 16) (5))
	)
)
(5 Measure_duration (16 16)
	(
		(Unit (10 10) (3))
		(Count (15 15) ())
	)
)
(6 Stimulus_focus (21 21)
	(
		(Stimulus (0 0) ())
	)
)
(7 Increment (28 28)
	(
		(Class (29 29) (9))
	)
)
(8 Motion (26 26)
	(
		(Theme (0 0) ())
		(Goal (29 29) (9))
	)
)
(9 Vehicle (29 29)
	(
		(Possessor (0 0) ())
		(Vehicle (29 29) ())
	)
)
(10 Desiring (24 24)
	(
		(Experiencer (0 0) ())
		(Event (29 29) (9))
	)
)
(11 Spatial_contact (27 27)
	(
		(Figure (0 0) ())
		(Ground (29 29) (9))
	)
)
)
)
(
; story sentence text for lookup
("Nan has two black hens." "They lay nice white eggs." "You can find them in the hay." "My hen lays eggs, too." "She has her nest up on the beam." "She will fly off, and say “cluck, cluck!”")
; events
(
(0 Have_associated (1 1)
	(
		(Topical_entity (0 0) ())
		(Entity (4 4) ())
	)
)
(1 Color (3 3)
	(
		(Entity (4 4) ())
		(Color (3 3) ())
	)
)
(2 Giving_birth (7 7)
	(
		(Mother (0 0) ())
		(Egg (4 4) ())
	)
)
(3 Food (10 10)
	(
		(Descriptor (3 3) (1))
		(Descriptor (8 8) (5))
	)
)
(4 Color (9 9)
	(
		(Entity (4 4) ())
		(Color (3 3) (1))
	)
)
(5 Stimulus_focus (8 8)
	(
		(Stimulus (10 10) (3))
	)
)
(6 Locating (14 14)
	(
		(Perceiver (0 0) ())
		(Location (18 18) ())
		(Sought_entity (3 3) (1))
	)
)
(7 Possibility (13 13)
	(
		(Possible_event (0 0) ())
		(Possible_event (15 15) ())
	)
)
(8 Giving_birth (22 22)
	(
		(Egg (3 3) (1))
		(Mother (21 21) ())
	)
)
(9 Food (23 23)
	(
	)
)
(10 Wearing (28 28)
	(
		(Clothing (30 30) ())
		(Wearer (0 0) ())
		(Relative_location (34 34) ())
	)
)
(11 Self_motion (38 38)
	(
		(Self_mover (0 0) ())
		(Source (3 3) (1))
	)
)
(12 Text_creation (42 42)
	(
		(Author (0 0) ())
		(Text (44 44) (13))
	)
)
(13 Sounds (44 44)
	(
	)
)
(14 Sounds (46 46)
	(
		(Sound_source (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("The Man breaks the Ice.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
)
)

(
; story sentence text for lookup
("I have a large mango." "This mango is larger than mine." "That is the largest mango in the basket." "This tree is tall." "That tree is taller than this one." "The cocoanut tree is the tallest tree in the yard.")
; events
(
(0 Food (4 4)
	(
		(Descriptor (3 3) (2))
	)
)
(1 Possession (1 1)
	(
		(Owner (0 0) ())
		(Possession (4 4) (0))
	)
)
(2 Size (3 3)
	(
		(Entity (4 4) (0))
	)
)
(3 Food (7 7)
	(
	)
)
(4 Size (9 9)
	(
		(Standard (11 11) ())
		(Entity (7 7) (3))
	)
)
(5 Food (17 17)
	(
		(Descriptor (3 3) (2))
	)
)
(6 Containers (20 20)
	(
		(Container (20 20) ())
	)
)
(7 Size (16 16)
	(
		(Entity (4 4) (0))
		(Degree (20 20) (6))
		(Degree (3 3) (2))
	)
)
(8 Measurable_attributes (25 25)
	(
		(Attribute (3 3) (2))
		(Entity (7 7) (3))
	)
)
(9 Measurable_attributes (30 30)
	(
		(Degree (33 33) ())
		(Degree (3 3) (2))
		(Entity (7 7) (3))
	)
)
(10 Locale_by_use (44 44)
	(
		(Locale (44 44) ())
	)
)
(11 Dimension (40 40)
	(
		(Dimension (40 40) ())
		(Object (41 41) ())
	)
)
)
)
(
; story sentence text for lookup
("The Fox will eat the Hen.")
; events
(
(0 Ingestion (3 3)
	(
		(Ingestibles (5 5) ())
		(Ingestor (1 1) ())
	)
)
)
)
(
; story sentence text for lookup
("Ethan loved the snow." "He saw it snow outside." "He asked his mom if he could play." "He took his sled." "He went down the hill.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Content (3 3) (1))
		(Experiencer (0 0) ())
	)
)
(1 Precipitation (3 3)
	(
		(Precipitation (3 3) ())
	)
)
(2 Perception_experience (6 6)
	(
		(Phenomenon (3 3) (1))
		(Perceiver_passive (0 0) ())
		(State (9 9) (3))
	)
)
(3 Spatial_co-location (9 9)
	(
		(Figure (3 3) (1))
	)
)
(4 Precipitation (8 8)
	(
		(Place (9 9) (3))
	)
)
(5 Questioning (12 12)
	(
		(Addressee (3 3) (1))
		(Speaker (0 0) ())
		(Message (16 16) ())
	)
)
(6 Competition (18 18)
	(
		(Participants (16 16) ())
	)
)
(7 Capability (17 17)
	(
		(Entity (16 16) ())
		(Event (18 18) (6))
	)
)
(8 Kinship (14 14)
	(
		(Ego (13 13) ())
		(Alter (3 3) (1))
	)
)
(9 Bringing (21 21)
	(
		(Theme (3 3) (1))
		(Agent (0 0) ())
	)
)
(10 Vehicle (23 23)
	(
		(Possessor (13 13) ())
		(Vehicle (3 3) (1))
	)
)
(11 Motion (26 26)
	(
		(Theme (0 0) ())
		(Path (29 29) (12))
	)
)
(12 Natural_features (29 29)
	(
		(Locale (9 9) (3))
	)
)
)
)
(
; story sentence text for lookup
("The boy has a big dog." "You may see the dog play ball.")
; events
(
(0 Animals (5 5)
	(
		(Animal (5 5) ())
		(Descriptor (4 4) (2))
		(Animal (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Size (4 4)
	(
		(Entity (5 5) (0))
	)
)
(3 Perception_experience (9 9)
	(
		(Perceiver_passive (7 7) ())
		(Phenomenon (11 11) ())
	)
)
(4 Likelihood (8 8)
	(
		(Hypothetical_event (7 7) ())
		(Hypothetical_event (11 11) ())
	)
)
(5 Competition (12 12)
	(
		(Participant_1 (11 11) ())
		(Competition (13 13) (6))
	)
)
(6 Social_event (13 13)
	(
		(Attendee (11 11) ())
		(Name (13 13) ())
	)
)
)
)
(
; story sentence text for lookup
("John went to the casino last night." "I was a little jealous." "I could not go." "He had a fun night." "He won a little money too.")
; events
(
(0 Motion (1 1)
	(
		(Theme (0 0) ())
		(Goal (4 4) ())
		(Time (5 6) (1))
	)
)
(1 Calendric_unit (6 6)
	(
		(Relative_time (5 5) ())
		(Unit (6 6) ())
	)
)
(2 Experiencer_focus (12 12)
	(
		(Degree (10 11) ())
		(Experiencer (0 0) ())
	)
)
(3 Possibility (15 15)
	(
		(Possible_event (0 0) ())
		(Possible_event (17 17) (4))
	)
)
(4 Motion (17 17)
	(
		(Theme (0 0) ())
	)
)
(5 Calendric_unit (23 23)
	(
		(Unit (23 23) ())
	)
)
(6 Stimulus_focus (22 22)
	(
		(Stimulus (23 23) (5))
	)
)
(7 Win_prize (26 26)
	(
		(Competitor (0 0) ())
		(Prize (4 4) ())
	)
)
(8 Money (29 29)
	(
		(Money (23 23) (5))
	)
)
)
)
(
; story sentence text for lookup
("The cow left the barn." "It went out to the field." "The other cows were out in the field." "The cow found a spot of grass." "The cow ate the grass.")
; events
(
(0 Buildings (4 4)
	(
	)
)
(1 Departing (2 2)
	(
		(Source (4 4) (0))
		(Theme (1 1) ())
	)
)
(2 Locale_by_use (11 11)
	(
		(Locale (11 11) ())
	)
)
(3 Locale_by_use (20 20)
	(
		(Locale (20 20) ())
	)
)
(4 Increment (14 14)
	(
		(Class (15 15) ())
	)
)
(5 Becoming_aware (24 24)
	(
		(Phenomenon (26 26) ())
		(Cognizer (1 1) ())
	)
)
(6 Food (34 34)
	(
	)
)
(7 Ingestion (32 32)
	(
		(Ingestor (1 1) ())
		(Ingestibles (4 4) (0))
	)
)
)
)
(
; story sentence text for lookup
("Suzy got a new sweatshirt." "She was not sure she liked it." "Sure enough, she did not." "It was too big." "Suzy wanted to give it away.")
; events
(
(0 Clothing (4 4)
	(
		(Garment (4 4) ())
		(Descriptor (3 3) (2))
	)
)
(1 Have_associated (1 1)
	(
		(Entity (4 4) (0))
		(Topical_entity (0 0) ())
	)
)
(2 Age (3 3)
	(
		(Entity (4 4) (0))
	)
)
(3 Experiencer_focus (11 11)
	(
		(Experiencer (4 4) (0))
		(Content (12 12) ())
	)
)
(4 Certainty (9 9)
	(
		(Cognizer (0 0) ())
		(Content (10 10) ())
	)
)
(5 Likelihood (14 15)
	(
		(Hypothetical_event (17 17) ())
	)
)
(6 Desiring (27 27)
	(
		(Event (30 30) ())
		(Experiencer (0 0) ())
	)
)
(7 Giving (29 31)
	(
		(Theme (4 4) (0))
		(Donor (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("A top spins." "The tops spin." "Tom spins the tops." "He spins the tops on a box." "Tom spins my large top." "He spins my small top." "Spin, tops, spin.")
; events
(
(0 Part_orientational (5 5)
	(
		(Part (5 5) ())
	)
)
(1 Moving_in_place (6 6)
	(
		(Theme (4 5) (0))
	)
)
(2 Cause_motion (9 9)
	(
		(Agent (8 8) ())
		(Theme (11 11) ())
	)
)
(3 Cause_motion (14 14)
	(
		(Agent (8 8) ())
		(Goal (19 19) (5))
		(Theme (11 11) ())
	)
)
(4 Part_orientational (16 16)
	(
		(Part (16 16) ())
		(Whole (19 19) (5))
	)
)
(5 Containers (19 19)
	(
		(Container (19 19) ())
	)
)
(6 Cause_motion (22 22)
	(
		(Agent (8 8) ())
		(Theme (25 25) (7))
	)
)
(7 Part_orientational (25 25)
	(
		(Whole (23 23) ())
		(Part (25 25) ())
		(Part_prop (16 16) (4))
	)
)
(8 Size (24 24)
	(
		(Entity (25 25) (7))
	)
)
(9 Cause_motion (28 28)
	(
		(Agent (8 8) ())
		(Theme (25 25) (7))
	)
)
(10 Body_parts (31 31)
	(
		(Possessor (23 23) ())
		(Body_part (25 25) (7))
		(Descriptor (16 16) (4))
	)
)
(11 Size (30 30)
	(
		(Entity (25 25) (7))
	)
)
(12 Moving_in_place (33 33)
	(
	)
)
)
)
(
; story sentence text for lookup
("Sam's cat ran away one day." "Sam never got along with it." "He tried to look for a day or two." "Sam quickly gave up the search." "He got a new cat instead.")
; events
(
(0 Self_motion (3 3)
	(
		(Self_mover (2 2) ())
		(Source (4 4) ())
	)
)
(1 Calendric_unit (6 6)
	(
		(Unit (6 6) ())
		(Count (5 5) ())
	)
)
(2 Calendric_unit (21 23)
	(
		(Count (21 21) ())
	)
)
(3 Attempt (16 16)
	(
		(Agent (15 15) ())
		(Goal (21 21) ())
	)
)
(4 Seeking (18 18)
	(
		(Cognizer_agent (15 15) ())
		(Sought_entity (21 21) ())
	)
)
(5 Scrutiny (30 30)
	(
		(Cognizer (15 15) ())
	)
)
(6 Have_associated (33 33)
	(
		(Topical_entity (15 15) ())
		(Entity (36 36) ())
	)
)
(7 Age (35 35)
	(
		(Entity (4 4) ())
		(Age (35 35) ())
	)
)
)
)
(
; story sentence text for lookup
("A little boy sat under the apple tree." "He saw an apple fall." "He wondered why it did that." "His interest soared." "He studied it for years.")
; events
(
(0 People_by_age (2 2)
	(
		(Person (2 2) ())
		(Persistent_characteristic (1 1) (1))
	)
)
(1 Size (1 1)
	(
		(Entity (2 2) (0))
	)
)
(2 Posture (3 3)
	(
		(Agent (2 2) (0))
		(Location (7 7) ())
	)
)
(3 Perception_experience (10 10)
	(
		(Phenomenon (11 12) (5))
		(Perceiver_passive (9 9) ())
		(Direction (13 13) (4))
	)
)
(4 Motion_directional (13 13)
	(
		(Theme (11 12) (5))
		(Direction (13 13) ())
	)
)
(5 Food (12 12)
	(
	)
)
(6 Cogitation (16 16)
	(
		(Cognizer (9 9) ())
		(Topic (18 18) ())
	)
)
(7 Change_position_on_a_scale (24 24)
	(
		(Attribute (23 23) (8))
	)
)
(8 Emotion_directed (23 23)
	(
		(Experiencer (9 9) ())
	)
)
(9 Education_teaching (27 27)
	(
		(Duration (30 30) (10))
		(Student (9 9) ())
		(Subject (2 2) (0))
	)
)
(10 Measure_duration (30 30)
	(
		(Unit (13 13) (4))
	)
)
)
)
(
; story sentence text for lookup
("Ethan sat in a chair." "The chair was old." "The chair broke." "Ethan fell on the ground." "He decided to buy a new one.")
; events
(
(0 Posture (1 1)
	(
		(Point_of_contact (1 1) ())
		(Location (4 4) ())
		(Agent (0 0) ())
	)
)
(1 Age (9 9)
	(
		(Entity (7 7) ())
	)
)
(2 Damaging (13 13)
	(
		(Patient (7 7) ())
	)
)
(3 Motion_directional (16 16)
	(
		(Direction (1 1) (0))
		(Goal (4 4) ())
		(Theme (0 0) ())
	)
)
(4 Deciding (22 22)
	(
		(Cognizer (0 0) ())
		(Decision (27 27) ())
	)
)
(5 Age (26 26)
	(
		(Age (26 26) ())
		(Entity (27 27) ())
	)
)
(6 Commerce_buy (24 24)
	(
		(Buyer (0 0) ())
		(Goods (27 27) ())
	)
)
)
)
(
; story sentence text for lookup
("The girl blinked her eyes." "The boy blinked back at her." "This was a game they had." "The game could not stay tied." "The girl blinked back at the boy.")
; events
(
(0 Body_movement (2 2)
	(
		(Body_part (4 4) (2))
		(Agent (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Body_parts (4 4)
	(
		(Body_part (4 4) ())
		(Possessor (3 3) ())
	)
)
(3 Body_movement (8 8)
	(
		(Addressee (11 11) ())
		(Path (3 3) ())
		(Agent (1 1) (1))
	)
)
(4 People_by_age (7 7)
	(
		(Person (1 1) (1))
	)
)
(5 State_continue (24 24)
	(
		(State (25 25) ())
		(Entity (1 1) (1))
	)
)
(6 Body_movement (29 29)
	(
		(Path (3 3) ())
		(Addressee (33 33) (8))
		(Agent (1 1) (1))
	)
)
(7 People (28 28)
	(
		(Person (1 1) (1))
	)
)
(8 People_by_age (33 33)
	(
		(Person (33 33) ())
	)
)
)
)
(
; story sentence text for lookup
("I had a pony." "I took it for a ride one day." "I rode over the hills near my house." "My pony stumbled on a large rock." "My pony hurt its leg.")
; events
(
(0 Possession (1 1)
	(
		(Owner (0 0) ())
		(Possession (3 3) ())
	)
)
(1 Ride_vehicle (6 6)
	(
		(Theme (0 0) ())
		(Vehicle (7 7) ())
		(Time (11 12) (3))
		(Purpose (10 10) (2))
	)
)
(2 Operate_vehicle (10 10)
	(
		(Driver (0 0) ())
	)
)
(3 Calendric_unit (12 12)
	(
		(Unit (12 12) ())
		(Count (11 11) ())
	)
)
(4 Natural_features (18 18)
	(
		(Locale (18 18) ())
		(Relative_location (21 21) (7))
	)
)
(5 Operate_vehicle (15 15)
	(
		(Driver (0 0) ())
		(Path (18 18) (4))
	)
)
(6 Locative_relation (19 19)
	(
		(Ground (11 12) (3))
		(Figure (18 18) (4))
	)
)
(7 Buildings (21 21)
	(
		(Building (12 12) (3))
	)
)
(8 Clothing (24 24)
	(
		(Garment (24 24) ())
		(Wearer (0 0) ())
	)
)
(9 Natural_features (29 29)
	(
		(Locale (11 11) ())
	)
)
(10 Size (28 28)
	(
		(Entity (11 11) ())
	)
)
(11 Motion_noise (25 25)
	(
		(Theme (24 24) (8))
		(Area (29 29) (9))
	)
)
(12 Body_parts (35 35)
	(
		(Body_part (18 18) (4))
		(Possessor (34 34) ())
	)
)
(13 Experience_bodily_harm (33 33)
	(
		(Body_part (18 18) (4))
		(Injuring_entity (24 24) (8))
	)
)
)
)
(
; story sentence text for lookup
("Tina liked Fred." "She wanted to ask him out." "When Tina and Fred saw each other she asked." "Fred said no." "Tina was crushed.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (2 2) ())
	)
)
(1 Desiring (5 5)
	(
		(Experiencer (0 0) ())
		(Event (8 8) ())
	)
)
(2 Request (7 7)
	(
		(Message (9 9) ())
		(Speaker (0 0) ())
		(Addressee (8 8) ())
	)
)
(3 Questioning (19 19)
	(
		(Speaker (18 18) ())
		(Time (12 12) ())
	)
)
(4 Perception_experience (15 15)
	(
		(Phenomenon (17 17) ())
		(Perceiver_passive (12 12) ())
	)
)
(5 Statement (22 22)
	(
		(Speaker (0 0) ())
		(Message (2 2) ())
	)
)
(6 Grinding (27 27)
	(
		(Patient (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("Manuela and Carmen live near the sea." "They find many pretty things on the seashore." "Yesterday they found these shells." "A shell is the house of an animal." "Those we see on the seashore have no animals in them." "But sometimes fishermen bring up shells in their nests." "They you can see little animals in their houses." "Some shells are large and very pretty.Some have a beautiful pink color.")
; events
(
(0 Residence (3 3)
	(
		(Resident (0 0) ())
		(Location (6 6) (1))
	)
)
(1 Natural_features (6 6)
	(
		(Locale (6 6) ())
	)
)
(2 Quantified_mass (10 10)
	(
		(Quantity (10 10) ())
		(Individuals (12 12) ())
	)
)
(3 Becoming_aware (9 9)
	(
		(Cognizer (8 8) ())
		(Ground (15 15) (5))
		(Phenomenon (12 12) ())
	)
)
(4 Aesthetics (11 11)
	(
		(Entity (12 12) ())
	)
)
(5 Natural_features (15 15)
	(
		(Locale (15 15) ())
	)
)
(6 Natural_features (21 21)
	(
		(Locale (12 12) ())
	)
)
(7 Calendric_unit (17 17)
	(
		(Unit (8 8) ())
	)
)
(8 Locating (19 19)
	(
		(Sought_entity (12 12) ())
		(Perceiver (18 18) ())
	)
)
(9 Animals (30 30)
	(
		(Animal (15 15) (5))
	)
)
(10 Buildings (27 27)
	(
		(Descriptor (15 15) (5))
		(Building (12 12) ())
	)
)
(11 Natural_features (37 37)
	(
		(Locale (37 37) ())
	)
)
(12 Perception_experience (34 34)
	(
		(Phenomenon (8 8) ())
		(Perceiver_passive (18 18) ())
		(State (37 37) (11))
	)
)
(13 Frequency (45 45)
	(
		(Event (46 46) ())
	)
)
(14 Bringing (47 47)
	(
		(Theme (37 37) (11))
		(Goal (12 12) ())
		(Constant_location (52 52) ())
		(Agent (10 10) (2))
	)
)
(15 Buildings (62 62)
	(
		(Building (62 62) ())
	)
)
(16 Perception_experience (57 57)
	(
		(Phenomenon (59 59) ())
		(Perceiver_passive (18 18) ())
		(State (52 52) ())
	)
)
(17 Possibility (56 56)
	(
		(Possible_event (18 18) ())
		(Possible_event (59 59) ())
	)
)
(18 Interior_profile_relation (60 60)
	(
		(Figure (59 59) ())
		(Ground (62 62) (15))
	)
)
(19 Size (58 58)
	(
		(Entity (37 37) (11))
	)
)
(20 Color (77 77)
	(
		(Entity (62 62) (15))
		(Descriptor (75 75) (23))
		(Color (76 76) (24))
		(Color (77 77) ())
	)
)
(21 Size (67 67)
	(
		(Entity (65 65) ())
	)
)
(22 Color_qualities (70 70)
	(
		(Described_entity (65 65) ())
		(Degree (37 37) (11))
	)
)
(23 Aesthetics (75 75)
	(
		(Attribute (77 77) (20))
	)
)
(24 Color (76 76)
	(
		(Color (75 75) (23))
		(Color (77 77) (20))
	)
)
)
)
(
; story sentence text for lookup
("The man sat down on the ground." "He was tired of walking." "He took out his water bottle." "It was empty." "The man had to keep walking to find water.")
; events
(
(0 Change_posture (2 2)
	(
		(Location (6 6) ())
		(Protagonist (1 1) (1))
	)
)
(1 People (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Biological_urge (10 10)
	(
		(Experiencer (8 8) ())
		(Explanation (11 12) (3))
	)
)
(3 Self_motion (12 12)
	(
		(Self_mover (8 8) ())
	)
)
(4 Removing (15 15)
	(
		(Agent (8 8) ())
		(Source (16 16) ())
		(Theme (19 19) (5))
	)
)
(5 Containers (19 19)
	(
		(Container (19 19) ())
		(Use (18 18) ())
		(Owner (17 17) ())
	)
)
(6 Fullness (23 23)
	(
		(Container (8 8) ())
	)
)
(7 Self_motion (30 30)
	(
		(Self_mover (1 1) (1))
	)
)
(8 Activity_ongoing (29 29)
	(
		(Purpose (33 33) ())
		(Activity (19 19) (5))
		(Agent (1 1) (1))
	)
)
(9 Required_event (27 28)
	(
		(Negative_consequences (33 33) ())
		(Required_situation (1 1) (1))
	)
)
(10 People (26 26)
	(
		(Person (1 1) (1))
	)
)
(11 Locating (32 32)
	(
		(Sought_entity (33 33) ())
		(Perceiver (1 1) (1))
	)
)
)
)
(
; story sentence text for lookup
("John found a kid crying on a bench." "John wanted to cheer him up." "John bought him ice cream." "The kid smiled." "John made a new friend.")
; events
(
(0 Make_noise (4 4)
	(
		(Sound_source (3 3) (2))
	)
)
(1 Becoming_aware (1 1)
	(
		(Cognizer (0 0) ())
		(Phenomenon (3 3) (2))
	)
)
(2 People_by_age (3 3)
	(
		(Person (3 3) ())
	)
)
(3 Desiring (10 10)
	(
		(Experiencer (0 0) ())
		(Event (13 13) ())
	)
)
(4 Experiencer_obj (12 14)
	(
		(Stimulus (0 0) ())
		(Experiencer (13 13) ())
	)
)
(5 Food (20 20)
	(
		(Descriptor (3 3) (2))
	)
)
(6 Commerce_buy (17 17)
	(
		(Buyer (0 0) ())
		(Recipient (18 18) ())
		(Goods (20 20) (5))
	)
)
(7 Food (19 19)
	(
	)
)
(8 People_by_age (23 23)
	(
		(Person (23 23) ())
	)
)
(9 Making_faces (24 24)
	(
		(Agent (23 23) (8))
	)
)
(10 Personal_relationship (30 30)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (13 13) ())
	)
)
(11 Familiarity (29 29)
	(
		(Entity (13 13) ())
	)
)
)
)
(
; story sentence text for lookup
("Susie was very hungry." "She didn't get food yet." "Hours went by." "She still hadn't eaten." "She needed something in her system.")
; events
(
(0 Biological_urge (3 3)
	(
		(Degree (2 2) ())
		(Experiencer (0 0) ())
	)
)
(1 Food (9 9)
	(
		(Food (9 9) ())
	)
)
(2 Getting (8 8)
	(
		(Recipient (0 0) ())
		(Theme (9 9) (1))
	)
)
(3 Negation (7 7)
	(
		(Negated_proposition (9 9) (1))
		(Negated_proposition (5 5) ())
	)
)
(4 Motion (13 13)
	(
		(Path (2 2) ())
		(Theme (0 0) ())
	)
)
(5 Calendric_unit (12 12)
	(
		(Unit (0 0) ())
	)
)
(6 Ingestion (20 20)
	(
		(Ingestor (0 0) ())
	)
)
(7 Needing (23 23)
	(
		(Cognizer (0 0) ())
		(Requirement (2 2) ())
		(Requirement (9 9) (1))
	)
)
(8 System (27 27)
	(
		(Complex (27 27) ())
	)
)
)
)
(
; story sentence text for lookup
("I was sitting in the house." "The garbage started to smell." "It was very bad." "So I had to take it out." "It still did not get rid of the smell.")
; events
(
(0 Posture (2 2)
	(
		(Agent (0 0) ())
		(Point_of_contact (2 2) ())
		(Location (5 5) (1))
	)
)
(1 Buildings (5 5)
	(
		(Building (5 5) ())
	)
)
(2 Activity_start (9 9)
	(
		(Agent (8 8) ())
		(Activity (10 11) (3))
	)
)
(3 Give_impression (11 11)
	(
		(Phenomenon (8 8) ())
	)
)
(4 Desirability (16 16)
	(
		(Evaluee (0 0) ())
		(Degree (2 2) (0))
	)
)
(5 Required_event (20 21)
	(
		(Required_situation (19 19) ())
		(Required_situation (23 23) ())
	)
)
(6 Successful_action (22 24)
	(
		(Protagonist (19 19) ())
	)
)
(7 Sensation (34 34)
	(
	)
)
)
)
(
; story sentence text for lookup
("Fred loved fishing." "He loved going with his friends." "Fred went to the local pond yesterday." "He caught a large fish." "He brought it back to eat it.")
; events
(
(0 Hunting (2 2)
	(
		(Hunter (0 0) ())
	)
)
(1 Experiencer_focus (1 1)
	(
		(Content (2 2) (0))
		(Experiencer (0 0) ())
	)
)
(2 Experiencer_focus (5 5)
	(
		(Experiencer (0 0) ())
		(Content (9 9) (3))
	)
)
(3 Personal_relationship (9 9)
	(
		(Partner_1 (9 9) ())
		(Partner_2 (8 8) ())
	)
)
(4 Natural_features (16 16)
	(
		(Locale (9 9) (3))
		(Relative_location (8 8) ())
	)
)
(5 Motion (12 12)
	(
		(Theme (0 0) ())
		(Time (17 17) (7))
		(Goal (9 9) (3))
	)
)
(6 People_by_residence (15 15)
	(
		(Location (9 9) (3))
	)
)
(7 Calendric_unit (17 17)
	(
		(Unit (17 17) ())
	)
)
(8 Response (20 20)
	(
		(Agent (0 0) ())
		(Time (23 23) (9))
	)
)
(9 Food (23 23)
	(
		(Descriptor (22 22) (10))
	)
)
(10 Size (22 22)
	(
		(Entity (8 8) ())
	)
)
(11 Bringing (26 26)
	(
		(Agent (0 0) ())
		(Theme (2 2) (0))
		(Purpose (31 31) ())
		(Goal (22 22) (10))
	)
)
(12 Ingestion (30 30)
	(
		(Ingestor (0 0) ())
		(Ingestibles (17 17) (7))
	)
)
)
)
(
; story sentence text for lookup
("Gary loved to ride bikes." "He met a girl who did, too." "He asked her on a date." "They got their bikes together." "They rode around the town.")
; events
(
(0 Vehicle (4 4)
	(
		(Vehicle (4 4) ())
	)
)
(1 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (4 4) (0))
	)
)
(2 Operate_vehicle (3 3)
	(
		(Vehicle (4 4) (0))
		(Driver (0 0) ())
	)
)
(3 Make_acquaintance (7 7)
	(
		(Individual_1 (0 0) ())
		(Individual_2 (9 9) (4))
	)
)
(4 People (9 9)
	(
		(Person (9 9) ())
	)
)
(5 Questioning (16 16)
	(
		(Speaker (0 0) ())
		(Addressee (17 17) ())
		(Message (20 20) ())
	)
)
(6 Vehicle (25 25)
	(
		(Possessor (17 17) ())
		(Vehicle (9 9) (4))
	)
)
(7 Locative_relation (30 30)
	(
		(Figure (0 0) ())
		(Ground (32 32) (9))
	)
)
(8 Operate_vehicle (29 29)
	(
		(Driver (0 0) ())
		(Area (4 4) (0))
	)
)
(9 Political_locales (32 32)
	(
		(Locale (4 4) (0))
	)
)
)
)
(
; story sentence text for lookup
("I got one of those new drones." "It is a lot of fun." "I have been flying it all over town." "It takes some really cool videos." "You will have to come check them out.")
; events
(
(0 Possession (1 1)
	(
		(Owner (0 0) ())
		(Possession (2 2) ())
	)
)
(1 Age (5 5)
	(
		(Entity (6 6) ())
		(Age (5 5) ())
	)
)
(2 Stimulus_focus (13 13)
	(
		(Stimulus (0 0) ())
		(Stimulus (10 12) ())
	)
)
(3 Political_locales (22 22)
	(
		(Locale (22 22) ())
	)
)
(4 Cause_motion (18 18)
	(
		(Agent (0 0) ())
		(Area (22 22) (3))
		(Theme (19 19) ())
	)
)
(5 Ingredients (29 29)
	(
		(Material (5 5) (1))
		(Type (27 28) (8))
	)
)
(6 Proportional_quantity (26 26)
	(
		(Denoted_quantity (26 26) ())
		(Individuals (29 29) (5))
	)
)
(7 Have_as_requirement (25 25)
	(
		(Dependent (0 0) ())
		(Explanation (29 29) (5))
	)
)
(8 Desirability (28 28)
	(
		(Evaluee (5 5) (1))
		(Degree (27 27) ())
	)
)
(9 Required_event (33 34)
	(
		(Required_situation (0 0) ())
		(Required_situation (37 37) ())
	)
)
(10 Arriving (35 35)
	(
		(Theme (0 0) ())
		(Goal (22 22) (3))
	)
)
(11 Scrutiny (36 36)
	(
		(Cognizer (0 0) ())
		(Ground (6 6) ())
	)
)
)
)
(
; story sentence text for lookup
("Dad let me plant a flower." "It grew very quickly." "I made sure to water it every day." "Now there is a bunch of them." "He says I have a green thumb.")
; events
(
(0 Planting (3 3)
	(
		(Agent (0 0) ())
		(Agent (2 2) ())
		(Theme (5 5) ())
	)
)
(1 Cause_expansion (8 8)
	(
		(Item (0 0) ())
		(Manner (9 10) (2))
	)
)
(2 Rate_description (10 10)
	(
		(Event (7 7) ())
		(Degree (2 2) ())
	)
)
(3 Required_event (14 14)
	(
		(Required_situation (0 0) ())
		(Required_situation (17 17) ())
	)
)
(4 Cooking_creation (16 16)
	(
		(Cook (0 0) ())
		(Place (17 17) ())
	)
)
(5 Frequency (18 18)
	(
		(Time_span (19 19) (6))
	)
)
(6 Calendric_unit (19 19)
	(
		(Unit (19 19) ())
		(Count (18 18) (5))
	)
)
(7 Existence (22 23)
	(
		(Time (0 0) ())
		(Entity (27 27) ())
	)
)
(8 Temporal_collocation (21 21)
	(
		(Trajector_event (27 27) ())
	)
)
(9 Aggregate (25 25)
	(
		(Individuals (27 27) ())
		(Aggregate (25 25) ())
	)
)
(10 Statement (30 30)
	(
		(Speaker (0 0) ())
		(Message (31 31) ())
	)
)
(11 Color (34 34)
	(
		(Entity (18 18) (5))
	)
)
(12 Possession (32 32)
	(
		(Owner (2 2) ())
		(Possession (35 35) (13))
	)
)
(13 Body_parts (35 35)
	(
		(Possessor (2 2) ())
		(Body_part (18 18) (5))
		(Descriptor (17 17) ())
	)
)
)
)
(
; story sentence text for lookup
("Jerry has a mouse." "His wife wants to get a cat." "Jerry said no." "His wife got a cat behind his back." "The cat and mouse are best friends.")
; events
(
(0 Possession (1 1)
	(
		(Possession (3 3) ())
		(Owner (0 0) ())
	)
)
(1 Desiring (7 7)
	(
		(Event (11 11) (4))
		(Experiencer (6 6) (2))
	)
)
(2 Personal_relationship (6 6)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (6 6) ())
	)
)
(3 Getting (9 9)
	(
		(Theme (11 11) (4))
		(Recipient (6 6) (2))
	)
)
(4 Animals (11 11)
	(
		(Animal (11 11) ())
		(Descriptor (6 6) (2))
	)
)
(5 Statement (14 14)
	(
		(Speaker (0 0) ())
		(Message (15 15) ())
	)
)
(6 Personal_relationship (18 18)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (6 6) (2))
	)
)
(7 Body_parts (24 24)
	(
		(Body_part (24 24) ())
		(Possessor (11 11) (4))
	)
)
(8 Expertise (31 31)
	(
		(Protagonist (27 27) ())
		(Protagonist (11 11) (4))
	)
)
(9 Personal_relationship (32 32)
	(
		(Partners (27 27) ())
		(Degree (31 31) (8))
	)
)
)
)
(
; story sentence text for lookup
("The puppies are full of fun." "I like to see them play with each other.")
; events
(
(0 Feeling (3 3)
	(
		(Emotion (5 5) (1))
		(Experiencer (1 1) ())
	)
)
(1 Emotion_directed (5 5)
	(
		(Experiencer (1 1) ())
	)
)
(2 Experiencer_focus (8 8)
	(
		(Experiencer (7 7) ())
		(Content (11 11) ())
	)
)
(3 Perception_experience (10 10)
	(
		(Perceiver_passive (7 7) ())
		(Depictive (15 15) ())
		(Phenomenon (11 11) ())
	)
)
)
)
(
; story sentence text for lookup
("It was a hot day." "Fred wanted water balloons." "So he filled some up." "Then he threw them at his friends." "They had a large fight.")
; events
(
(0 Calendric_unit (4 4)
	(
		(Unit (4 4) ())
	)
)
(1 Ambient_temperature (3 3)
	(
		(Time (4 4) (0))
		(Attribute (3 3) ())
	)
)
(2 Substance (8 8)
	(
		(Substance (8 8) ())
	)
)
(3 Desiring (7 7)
	(
		(Experiencer (6 6) ())
		(Focal_participant (9 9) (4))
	)
)
(4 Containers (9 9)
	(
		(Use (8 8) (2))
		(Container (3 3) (1))
	)
)
(5 Filling (13 15)
	(
		(Agent (12 12) ())
		(Goal (3 3) (1))
	)
)
(6 Cause_motion (19 19)
	(
		(Agent (12 12) ())
		(Theme (3 3) (1))
		(Goal (23 23) (7))
	)
)
(7 Personal_relationship (23 23)
	(
		(Partner_1 (23 23) ())
		(Partner_2 (22 22) ())
	)
)
(8 Hostile_encounter (29 29)
	(
		(Depictive (3 3) (1))
	)
)
(9 Size (28 28)
	(
		(Entity (4 4) (0))
	)
)
)
)
(
; story sentence text for lookup
("The boys like to go to the woods." "Here they are now." "Here are the horse and the wagon." "And here is the boy with the drum." "They like to play in the woods." "They like to find pretty flowers." "If they find little birds in a nest, they will not take them." "By and by they will go home." "They will ride home in the wagon.")
; events
(
(0 Experiencer_focus (2 2)
	(
		(Content (7 7) (3))
		(Experiencer (1 1) (1))
	)
)
(1 People_by_age (1 1)
	(
		(Person (1 1) ())
	)
)
(2 Motion (4 4)
	(
		(Goal (7 7) (3))
		(Theme (1 1) (1))
	)
)
(3 Biological_area (7 7)
	(
		(Locale (7 7) ())
	)
)
(4 Locative_relation (9 9)
	(
		(Ground (9 9) ())
		(Figure (1 1) (1))
		(Time (12 12) (5))
	)
)
(5 Temporal_collocation (12 12)
	(
		(Trajector_event (10 10) ())
	)
)
(6 Spatial_co-location (14 14)
	(
		(Figure (17 17) ())
	)
)
(7 Containers (20 20)
	(
		(Container (20 20) ())
	)
)
(8 People_by_age (26 26)
	(
		(Person (26 26) ())
		(Descriptor (7 7) (3))
	)
)
(9 Containers (29 29)
	(
		(Container (7 7) (3))
	)
)
(10 Experiencer_focus (32 32)
	(
		(Experiencer (9 9) (4))
		(Content (17 17) ())
	)
)
(11 Competition (34 34)
	(
		(Participants (9 9) (4))
		(Place (37 37) (12))
	)
)
(12 Biological_area (37 37)
	(
		(Locale (20 20) (7))
	)
)
(13 Experiencer_focus (40 40)
	(
		(Experiencer (9 9) (4))
		(Content (44 44) ())
	)
)
(14 Aesthetics (43 43)
	(
		(Entity (44 44) ())
	)
)
(15 Locating (42 42)
	(
		(Sought_entity (44 44) ())
		(Perceiver (9 9) (4))
	)
)
(16 Food (53 53)
	(
		(Descriptor (7 7) (3))
	)
)
(17 Being_named (58 58)
	(
		(Descriptor (55 55) ())
		(Name (59 59) ())
	)
)
(18 Locating (48 48)
	(
		(Location (7 7) (3))
		(Perceiver (1 1) (1))
		(Sought_entity (50 50) ())
	)
)
(19 Interior_profile_relation (51 51)
	(
		(Ground (53 53) (16))
		(Figure (50 50) ())
	)
)
(20 Motion (66 66)
	(
		(Goal (20 20) (7))
		(Theme (12 12) (5))
	)
)
(21 Operate_vehicle (71 71)
	(
		(Driver (9 9) (4))
		(Vehicle (37 37) (12))
		(Goal (12 12) (5))
	)
)
(22 Containers (75 75)
	(
		(Container (20 20) (7))
	)
)
)
)
(
; story sentence text for lookup
("Fred always wanted to know how he would look like in a cap." "He decides to buy one." "Fred loves how he looks in a cap." "His friends love it too." "He is glad he bought a cap.")
; events
(
(0 Accoutrements (12 12)
	(
		(Accoutrement (12 12) ())
	)
)
(1 Desiring (2 2)
	(
		(Experiencer (0 0) ())
		(Manner (1 1) (3))
		(Event (6 6) ())
	)
)
(2 Give_impression (8 8)
	(
		(State (12 12) (0))
		(Characterization (5 5) ())
		(Phenomenon (6 6) ())
		(Appraisal (9 9) ())
	)
)
(3 Frequency (1 1)
	(
		(Event (0 0) ())
		(Event (6 6) ())
	)
)
(4 Awareness (4 4)
	(
		(Cognizer (0 0) ())
		(Content (6 6) ())
	)
)
(5 Deciding (15 15)
	(
		(Cognizer (0 0) ())
		(Decision (18 18) ())
	)
)
(6 Commerce_buy (17 17)
	(
		(Buyer (0 0) ())
		(Goods (18 18) ())
	)
)
(7 Experiencer_focus (21 21)
	(
		(Experiencer (0 0) ())
		(Content (23 23) ())
	)
)
(8 Give_impression (24 24)
	(
		(State (27 27) (9))
		(Phenomenon (23 23) ())
		(Inference (22 22) ())
	)
)
(9 Accoutrements (27 27)
	(
		(Accoutrement (27 27) ())
	)
)
(10 Experiencer_focus (31 31)
	(
		(Content (23 23) ())
		(Experiencer (30 30) (11))
	)
)
(11 Personal_relationship (30 30)
	(
		(Partner_2 (0 0) ())
		(Partner_1 (1 1) (3))
	)
)
(12 Emotions_by_stimulus (37 37)
	(
		(Experiencer (0 0) ())
		(Stimulus (38 38) ())
	)
)
(13 Commerce_buy (39 39)
	(
		(Goods (41 41) (14))
		(Buyer (23 23) ())
	)
)
(14 Accoutrements (41 41)
	(
		(Accoutrement (6 6) ())
	)
)
)
)
(
; story sentence text for lookup
("Matt left his window open." "His cat got out of the house." "Matt looked for his cat." "He put posters up to find his cat." "Someone called him with his cat.")
; events
(
(0 Openness (4 4)
	(
		(Barrier (2 3) (1))
	)
)
(1 Connecting_architecture (3 3)
	(
		(Whole (2 2) ())
		(Part (3 3) ())
	)
)
(2 Buildings (12 12)
	(
		(Building (12 12) ())
	)
)
(3 Seeking (15 15)
	(
		(Cognizer_agent (14 14) ())
		(Sought_entity (18 18) (4))
	)
)
(4 Animals (18 18)
	(
		(Animal (18 18) ())
	)
)
(5 Animals (27 27)
	(
		(Animal (27 27) ())
		(Animal (12 12) (2))
	)
)
(6 Locating (25 25)
	(
		(Perceiver (14 14) ())
		(Sought_entity (27 27) (5))
	)
)
(7 Placing (21 21)
	(
		(Theme (2 2) ())
		(Agent (14 14) ())
	)
)
(8 Directional_locative_relation (22 23)
	(
		(Figure (2 2) ())
		(Figure (14 14) ())
	)
)
(9 Referring_by_name (30 30)
	(
		(Name (34 34) (10))
		(Entity (2 2) ())
		(Speaker (14 14) ())
	)
)
(10 Animals (34 34)
	(
		(Descriptor (18 18) (4))
		(Animal (34 34) ())
	)
)
)
)
(
; story sentence text for lookup
("This girl has a fan." "The fan is in her hand." "She can fan the cat." "I see a girl." "And I see a cat and a fan." "This girl has the cat." "And the girl has the fan." "The fan is in her hand." "I can fan the girl." "She can fan her cat." "This is my black fan.")
; events
(
(0 People (1 1)
	(
		(Person (1 1) ())
	)
)
(1 Body_parts (51 51)
	(
		(Body_part (51 51) (12))
		(Possessor (50 50) ())
	)
)
(2 Experiencer_focus (15 15)
	(
		(Experiencer (13 13) ())
		(Content (17 17) (4))
	)
)
(3 Hearsay (14 14)
	(
		(Hearer (13 13) ())
		(Message (17 17) (4))
	)
)
(4 Animals (17 17)
	(
		(Animal (50 50) ())
	)
)
(5 Perception_experience (20 20)
	(
		(Perceiver_passive (13 13) ())
		(Phenomenon (17 17) (4))
	)
)
(6 People (22 22)
	(
		(Person (22 22) ())
	)
)
(7 Perception_experience (26 26)
	(
		(Perceiver_passive (1 1) (0))
		(Phenomenon (28 28) (8))
	)
)
(8 Animals (28 28)
	(
		(Animal (50 50) ())
	)
)
(9 People (34 34)
	(
		(Person (1 1) (0))
	)
)
(10 Animals (37 37)
	(
		(Animal (50 50) ())
		(Animal (34 34) (9))
	)
)
(11 People (41 41)
	(
		(Person (41 41) ())
	)
)
(12 Body_parts (51 51)
	(
		(Body_part (51 51) (1))
		(Possessor (50 50) ())
	)
)
(13 Experiencer_focus (55 55)
	(
		(Experiencer (13 13) ())
		(Content (17 17) (4))
	)
)
(14 Possibility (54 54)
	(
		(Possible_event (13 13) ())
		(Possible_event (17 17) (4))
	)
)
(15 People (57 57)
	(
		(Person (50 50) ())
	)
)
(16 Experiencer_focus (61 61)
	(
		(Experiencer (13 13) ())
		(Content (17 17) (4))
	)
)
(17 Animals (63 63)
	(
		(Animal (50 50) ())
	)
)
(18 Color (68 68)
	(
		(Entity (50 50) ())
		(Color (22 22) (6))
	)
)
)
)
(
; story sentence text for lookup
("She saw Rover run off with the hat.")
; events
(
(0 Perception_experience (1 1)
	(
		(Perceiver_passive (0 0) ())
		(Phenomenon (2 2) ())
	)
)
(1 Motion_noise (3 4)
	(
		(Theme (2 2) ())
		(Depictive (7 7) (2))
	)
)
(2 Accoutrements (7 7)
	(
		(Accoutrement (7 7) ())
	)
)
)
)
(
; story sentence text for lookup
("Beth wanted a dog." "She asked her mother." "Her mother said yes." "Beth was so happy." "Beth got a great family dog and was happy.")
; events
(
(0 Desiring (1 1)
	(
		(Focal_participant (3 3) (1))
		(Experiencer (0 0) ())
	)
)
(1 Animals (3 3)
	(
		(Animal (3 3) ())
	)
)
(2 Questioning (6 6)
	(
		(Addressee (3 3) (1))
		(Speaker (0 0) ())
	)
)
(3 Kinship (8 8)
	(
		(Ego (7 7) ())
		(Alter (3 3) (1))
	)
)
(4 Statement (12 12)
	(
		(Message (3 3) (1))
		(Speaker (11 11) (5))
	)
)
(5 Kinship (11 11)
	(
		(Ego (0 0) ())
		(Alter (11 11) ())
	)
)
(6 Emotion_directed (18 18)
	(
		(Experiencer (0 0) ())
		(Degree (7 7) ())
	)
)
(7 Animals (25 25)
	(
		(Animal (25 25) ())
		(Descriptor (24 24) (11))
		(Descriptor (3 3) (1))
	)
)
(8 Desirability (23 23)
	(
		(Evaluee (25 25) (7))
	)
)
(9 Emotion_directed (28 28)
	(
		(Experiencer (0 0) ())
	)
)
(10 Getting (21 21)
	(
		(Recipient (0 0) ())
		(Theme (25 25) (7))
	)
)
(11 Kinship (24 24)
	(
		(Relatives (24 24) ())
	)
)
)
)
(
; story sentence text for lookup
("Travis had a rough life." "He didn't like to talk about it." "He often hid himself." "He stayed in the corner of rooms." "Then someone approached him.")
; events
(
(0 Manner_of_life (4 4)
	(
		(Experiencer (0 0) ())
	)
)
(1 Difficulty (3 3)
	(
		(Activity (4 4) (0))
	)
)
(2 Experiencer_focus (9 9)
	(
		(Experiencer (0 0) ())
		(Content (13 13) ())
	)
)
(3 Negation (8 8)
	(
		(Negated_proposition (13 13) ())
		(Negated_proposition (6 6) ())
	)
)
(4 Statement (11 11)
	(
		(Speaker (0 0) ())
		(Topic (13 13) ())
	)
)
(5 Hiding_objects (17 17)
	(
		(Agent (0 0) ())
		(Hidden_object (18 18) ())
	)
)
(6 Temporary_stay (21 21)
	(
		(Guest (0 0) ())
		(Location (24 24) ())
	)
)
(7 Building_subparts (26 26)
	(
		(Building_part (26 26) ())
	)
)
(8 Arriving (30 30)
	(
		(Theme (29 29) ())
		(Goal (18 18) ())
	)
)
)
)
(
; story sentence text for lookup
("The singer worked hard." "She got better." "People noticed her." "She made an album." "The people bought it.")
; events
(
(0 Make_noise (1 1)
	(
		(Sound_source (1 1) ())
	)
)
(1 Work (2 2)
	(
		(Agent (1 1) (0))
		(Degree (3 3) ())
	)
)
(2 Desirability (7 7)
	(
		(Evaluee (5 5) ())
		(Degree (7 7) ())
	)
)
(3 Transition_to_state (6 6)
	(
		(Entity (5 5) ())
		(Final_quality (7 7) (2))
	)
)
(4 People (9 9)
	(
		(Person (5 5) ())
	)
)
(5 Becoming_aware (10 10)
	(
		(Cognizer (5 5) ())
		(Phenomenon (7 7) (2))
	)
)
(6 Building (14 14)
	(
		(Created_entity (16 16) (7))
		(Agent (5 5) ())
	)
)
(7 Text (16 16)
	(
		(Text (3 3) ())
	)
)
(8 Commerce_buy (20 20)
	(
		(Goods (3 3) ())
		(Buyer (1 1) (0))
	)
)
(9 People (19 19)
	(
		(Person (1 1) (0))
	)
)
)
)
(
; story sentence text for lookup
("I had the stairs near me." "They were very loud." "It bothered me." "Thankfully the sound went down." "I was happy about that.")
; events
(
(0 Connecting_architecture (3 3)
	(
		(Part (3 3) ())
	)
)
(1 Sound_level (10 10)
	(
		(Entity (7 7) ())
		(Degree (9 9) ())
	)
)
(2 Experiencer_obj (13 13)
	(
		(Stimulus (7 7) ())
		(Experiencer (9 9) ())
	)
)
(3 Locative_relation (19 20)
	(
		(Figure (18 18) (4))
	)
)
(4 Sensation (18 18)
	(
		(Source (9 9) ())
	)
)
(5 Luck (16 16)
	(
		(State_of_affairs (18 18) (4))
	)
)
(6 Emotion_directed (24 24)
	(
		(Experiencer (7 7) ())
		(Topic (26 26) ())
	)
)
)
)
(
; story sentence text for lookup
("Billy went to work." "He came home late at night." "Billy was very tired." "He laid down in his bed." "He fell asleep quickly.")
; events
(
(0 Motion (1 1)
	(
		(Goal (3 3) (1))
		(Theme (0 0) ())
	)
)
(1 Being_employed (3 3)
	(
		(Employee (0 0) ())
	)
)
(2 Buildings (7 7)
	(
		(Building (7 7) ())
	)
)
(3 Arriving (6 6)
	(
		(Theme (0 0) ())
		(Goal (7 7) (2))
		(Time (10 10) (4))
	)
)
(4 Calendric_unit (10 10)
	(
		(Unit (10 10) ())
	)
)
(5 Biological_urge (15 15)
	(
		(Experiencer (0 0) ())
		(Degree (7 7) (2))
	)
)
(6 Change_posture (18 19)
	(
		(Protagonist (0 0) ())
		(Location (10 10) (4))
	)
)
(7 Fall_asleep (25 26)
	(
		(Sleeper (0 0) ())
	)
)
)
)
(
; story sentence text for lookup
("I like to play fire." "One day I create a fire in my room." "My bed was on fire." "I burn my hand." "I had a burn mark in my hand.")
; events
(
(0 Experiencer_focus (1 1)
	(
		(Experiencer (0 0) ())
		(Content (4 4) ())
	)
)
(1 Building_subparts (14 14)
	(
		(Building_part (14 14) ())
	)
)
(2 Calendric_unit (7 7)
	(
		(Count (0 0) ())
		(Unit (7 7) ())
	)
)
(3 Fire_burning (11 11)
	(
		(Place (14 14) (1))
		(Fire (11 11) ())
	)
)
(4 Cause_to_start (9 9)
	(
		(Effect (11 11) (3))
		(Cause (8 8) ())
	)
)
(5 Fire_burning (20 20)
	(
		(Fuel (17 17) ())
	)
)
(6 Experience_bodily_harm (23 23)
	(
		(Body_part (25 25) (7))
		(Experiencer (0 0) ())
	)
)
(7 Body_parts (25 25)
	(
		(Possessor (8 8) ())
		(Body_part (25 25) ())
	)
)
(8 Body_parts (32 32)
	(
		(Body_part (4 4) ())
		(Body_part (14 14) (1))
	)
)
(9 Body_mark (31 31)
	(
		(Possessor (0 0) ())
		(Body_mark (31 31) ())
		(Attachment (34 34) (11))
		(Cause (25 25) (7))
	)
)
(10 Experience_bodily_harm (30 30)
	(
	)
)
(11 Body_parts (34 34)
	(
		(Body_part (34 34) ())
		(Possessor (33 33) ())
	)
)
)
)
))
