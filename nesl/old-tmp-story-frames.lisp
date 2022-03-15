(defparameter *ALL-STORY-FRAMES* '(
(
; story sentence text for lookup
("The family went to a restaurant." "They ordered food." "They ate their meals." "They drank coffee.")
; events
(
(0 Motion (2 2)
	(
		(Goal (5 5) (2))
		(Theme (1 1) (1))
	)
)
(1 Kinship (1 1)
	(
		(Relatives (1 1) ())
	)
)
(2 Buildings (5 5)
	(
		(Place (5 5) ())
	)
)
(3 Request_entity (8 8)
	(
		(Customer (7 7) ())
		(Entity (9 9) (4))
	)
)
(4 Food (9 9)
	(
	)
)
(5 Ingestion (12 12)
	(
		(Ingestor (7 7) ())
		(Ingestibles (14 14) (6))
	)
)
(6 Food (14 14)
	(
	)
)
(7 Food (18 18)
	(
	)
)
(8 Ingestion (17 17)
	(
		(Ingestor (7 7) ())
		(Ingestibles (9 9) (4))
	)
)
)
)
))