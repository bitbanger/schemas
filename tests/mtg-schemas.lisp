(defparameter *LEARNED-SCHEMAS* '(
(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-1.PR (KA (STOP.V WORK.V)) (KA WORK.V) ?X_F)
	             ** ?E)
		(:ROLES
			(!R1 (?X_C LOT.N))
			(!R2 (?X_C (OF.P (K MONEY.N))))
			(!R3 (?X_F MAN.N))
			(!R4 (?X_I TIRED.A))
		)
		(:STEPS
			(?X_A (?X_I (WANT.V (KA (STOP.V WORK.V)))))
			(?X_B (?X_I (OF.P (KA WORK.V))))
			(?X_E (?X_I (((ADV-A (WITH.P ?X_C)) MEET.V) ?X_F)))
			(?X_H (?X_I (MARRY.V ?X_F)))
			(?X_K (?X_I ((ADV-A (FOR.P (KA (AGAIN.ADV WORK.V)))) (NEVER.ADV HAVE.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_B)))
			(!W2 (?X_A (BEFORE ?X_E)))
			(!W3 (?X_A (BEFORE ?X_H)))
			(!W4 (?X_A (BEFORE ?X_K)))
			(!W5 (?X_B (BEFORE ?X_E)))
			(!W6 (?X_B (BEFORE ?X_H)))
			(!W7 (?X_B (BEFORE ?X_K)))
			(!W8 (?X_E (BEFORE ?X_H)))
			(!W9 (?X_E (BEFORE ?X_K)))
			(!W10 (?X_H (BEFORE ?X_K)))
		)
	)
	(
			"A tired wants stopping work."
			"A tired is of."
			"A tired meets a man with a lot of money."
			"A tired marries a man."
			"A tired has for again work never."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-2.PR (SET-OF ?X_B (TWO.D (PLUR CAT.N)))) **
	             ?E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B DOG.N))
		)
		(:STEPS
			(E21.SK (?X_A (SEE.V (SET-OF ?X_B (TWO.D (PLUR CAT.N))))))
		)
	)
	(
			"A agent sees a dog and two cats."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (WITH.P ?T)) PLAY.1.V) (K BALL.N)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B GIRL.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 ((K BALL.N) GAME.N))
			(!R5 (NOT ((K BALL.N) AGENT.N)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_B HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_B EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_C (BEFORE ?X_E)))
			(!W3 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R5 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA (((K SUSIE.N) COMPOSITE-SCHEMA-3.PR (KE (?X_S (PLAY.V (K BALL.N))))
	              (KA ((ADV-A (WITH.P ?X_N)) PLAY.V)) ?X_A (K BALL.N))
	             ** ?E)
		(:ROLES
			(!R1 (?X_L (RIGHT-AFTER ?X_M)))
			(!R2 (?X_N (PERTAIN-TO (K SUSIE.N))))
			(!R3 (?X_S GIRL.N))
		)
		(:STEPS
			(?X_L ((K SUSIE.N) (WANT.V (KA ((ADV-A (WITH.P ?X_N)) PLAY.V)))))
			(?X_K ((K SUSIE.N) (WANT.V (KA ((ADV-A (WITH.P ?X_N)) PLAY.V)))))
			(?X_I ((K SUSIE.N) (AHEAD.ADV GO.V)))
			(?X_G ((K SUSIE.N) ((ADV-A (FOR.P (K PERMISSION.N))) ASK.V)))
			(?X_E (?X_S (SAY.V ?X_A)))
			(?X_C ((K SUSIE.N) ((ADV-A (FOR.P (KA CRY.V))) (THEN.ADV START.V))))
			(?X_R (?X_S ((ADV-A (WITH.P ?T)) PLAY.1.V) (K BALL.N)))
			(?X_P ((K SUSIE.N) (SAY.V (KE (?X_S (PLAY.V (K BALL.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_K)))
			(!W2 (?X_L (BEFORE ?X_I)))
			(!W3 (?X_L (BEFORE ?X_G)))
			(!W4 (?X_L (BEFORE ?X_E)))
			(!W5 (?X_L (BEFORE ?X_C)))
			(!W6 (?X_K (BEFORE ?X_I)))
			(!W7 (?X_K (BEFORE ?X_G)))
			(!W8 (?X_K (BEFORE ?X_E)))
			(!W9 (?X_K (BEFORE ?X_C)))
			(!W10 (?X_I (BEFORE ?X_G)))
			(!W11 (?X_I (BEFORE ?X_E)))
			(!W12 (?X_I (BEFORE ?X_C)))
			(!W13 (?X_G (BEFORE ?X_E)))
			(!W14 (?X_G (BEFORE ?X_C)))
			(!W15 (?X_E (BEFORE ?X_C)))
			(!W16 (?X_R BEFORE ?X_P))
		)
	)
	(
			"Susie wants with a of susie playing."
			"Susie wants with a of susie playing."
			"Susie goes ahead."
			"Susie asks for permission."
			"A girl says X_A."
			"Susie starts for crying then."
			"A girl play.12s ball with T."
			"Susie says a girl plays ball."
	)
)



(
	(EPI-SCHEMA ((?X_O COMPOSITE-SCHEMA-4.PR
	              (K (L X (AND (X GOOD.A) (X (TO.P ?X_O))))) ?X_L ?X_N)
	             ** ?E)
		(:ROLES
			(!R1 (?X_H (RIGHT-AFTER ?X_I)))
			(!R2 (?X_O WOMAN.N))
			(!R3 (?X_L MAN.N))
			(!R4 (?X_M WAY.N))
			(!R5 (?X_M HOME.N))
			(!R6 (?X_N NUMBER.N))
			(!R7 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_E (?X_O (KISS.V ?X_L)))
			(?X_G (?X_A (FEEL.V (K (L X (AND (X GOOD.A) (X (TO.P ?X_O))))))))
			(?X_H (?X_O (GIVE.V ?X_L ?X_N)))
			(?X_K (?X_O (GIVE.V ?X_L ?X_N)))
			(?X_Q (?X_L (((ADV-A (ON.P ?X_M)) LOSE.V) ?X_N)))
			(?X_S (?X_C (AGAIN.ADV MEET.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_G)))
			(!W2 (?X_E (BEFORE ?X_H)))
			(!W3 (?X_E (BEFORE ?X_K)))
			(!W4 (?X_E (BEFORE ?X_Q)))
			(!W5 (?X_E (BEFORE ?X_S)))
			(!W6 (?X_G (BEFORE ?X_H)))
			(!W7 (?X_G (BEFORE ?X_K)))
			(!W8 (?X_G (BEFORE ?X_Q)))
			(!W9 (?X_G (BEFORE ?X_S)))
			(!W10 (?X_H (BEFORE ?X_K)))
			(!W11 (?X_H (BEFORE ?X_Q)))
			(!W12 (?X_H (BEFORE ?X_S)))
			(!W13 (?X_K (BEFORE ?X_Q)))
			(!W14 (?X_K (BEFORE ?X_S)))
			(!W15 (?X_Q (BEFORE ?X_S)))
		)
	)
	(
			"A woman kisses a man."
			"X_A feels good to."
			"A woman gives a man a number of a woman."
			"A woman gives a man a number of a woman."
			"A man loses a number of a woman on a way home."
			"X_C meets again."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (WITH.P ?X_A))
	               (DOWN.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.1.V)))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (NOT (?S AGENT.N)))
			(!R3 (?S FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_A WOMAN.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L)))
			(?I2 (?S (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (WITH.P ?X_B))
	               (DOWN.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.2.V)))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (NOT (?S AGENT.N)))
			(!R3 (?S FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_B WOMAN.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L)))
			(?I2 (?S (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J COMPOSITE-SCHEMA-5.PR (K DIZZY.A) (K SICK.A)) ** ?E)
		(:ROLES
			(!R1 (?X_G MAN.N))
			(!R2 (?X_J WOMAN.N))
			(!R3 (?X_M COUPLE.N))
		)
		(:STEPS
			(?X_L (?X_M (OUT.PRT WORK.V)))
			(?X_I (?X_J (FEEL.V (K DIZZY.A))))
			(?X_D (?X_J (FEEL.V (K SICK.A))))
			(?X_B (?X_J (UP.PRT ((ADV-A (ON.P ?X_G)) THROW.V))))
			(?X_F
	   (?X_G
	    ((ADV-A (WITH.P ?X_J))
	     (DOWN.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.1.V))))))
			(?X_F
	   (?X_G
	    ((ADV-A (WITH.P ?X_J))
	     (DOWN.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.2.V))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_I)))
			(!W2 (?X_L (BEFORE ?X_D)))
			(!W3 (?X_L (BEFORE ?X_B)))
			(!W4 (?X_I (BEFORE ?X_D)))
			(!W5 (?X_I (BEFORE ?X_B)))
			(!W6 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A couple works out."
			"A woman feels dizzy."
			"A woman feels sick."
			"A woman throws up on a man."
			"A man sit.51s with a woman down in S on S."
			"A man sit.52s with a woman down in S on S."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (IN.P ?X_A)) PLAY.2.V) ?O) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?X_A SNOW.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?O EXIST.V)))))
			(?G2 (?X_C (WANT.V (KA (HAVE.V ?O)))))
		)
		(:PRECONDS
			(?I1 (NOT (?O EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?O EXIST.V))
			(?P2 (?X_C (HAVE.V ?O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B MAKE.1.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?X_C SNOWMAN.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C EXIST.V)))))
			(?G2 (?X_B (WANT.V (KA (HAVE.V ?X_C)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C EXIST.V))
			(?P2 (?X_B (HAVE.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (IN.P ?X_B)) PLAY.3.V) ?O) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?X_B SNOW.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?O EXIST.V)))))
			(?G2 (?X_C (WANT.V (KA (HAVE.V ?O)))))
		)
		(:PRECONDS
			(?I1 (NOT (?O EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?O EXIST.V))
			(?P2 (?X_C (HAVE.V ?O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (IN.P ?X_A)) ((ADV-A (WITH.P ?T)) PLAY.4.V)) ?G) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A SNOW.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_C EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R5 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (WITH.P ?T)) PLAY.5.V) ?X_B) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 (?X_B GAME.N))
			(!R5 (NOT (?X_B AGENT.N)))
			(!R6 (?X_B SNOWMAN.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_C EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R5 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (WITH.P ?T)) PLAY.6.V) ?X_A) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 (?X_A GAME.N))
			(!R5 (NOT (?X_A AGENT.N)))
			(!R6 (?X_A SNOWMAN.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_C EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R5 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-6.PR (KA ((ADV-A (IN.P ?X_K)) PLAY.V)) ?O ?G
	              ?X_D)
	             ** ?E)
		(:ROLES
			(!R1 (?X_D SNOWMAN.N))
			(!R2 (?X_K SNOW.N))
		)
		(:STEPS
			(?X_J (?X_A (LIKE.V (KA ((ADV-A (IN.P ?X_K)) PLAY.V)))))
			(?X_H (?X_A (OUTSIDE.ADV GO.V)))
			(?X_F (?X_A ((ADV-A (IN.P ?X_K)) PLAY.2.V) ?O))
			(?X_F (?X_A ((ADV-A (IN.P ?X_K)) PLAY.3.V) ?O))
			(?X_F (?X_A ((ADV-A (IN.P ?X_K)) ((ADV-A (WITH.P ?T)) PLAY.4.V)) ?G))
			(?X_C (?X_A MAKE.1.V ?X_D))
			(?X_C (?X_A ((ADV-A (WITH.P ?T)) PLAY.5.V) ?X_D))
			(?X_C (?X_A ((ADV-A (WITH.P ?T)) PLAY.6.V) ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_C)))
			(!W2 (?X_J BEFORE ?X_H))
		)
	)
	(
			"X_A likes in a snow playing."
			"X_A goes outside."
			"X_A play.62s O in a snow."
			"X_A play.64s O in a snow."
			"X_A play.58s G in a snow with T."
			"X_A make.63s a snowman."
			"X_A play.59s a snowman with T."
			"X_A play.60s a snowman with T."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-7.PR ?X_B) ** ?E)
		(:ROLES
			(!R1 (?X_A CAT.N))
			(!R2 (?X_B RAT.N))
		)
		(:STEPS
			(?X_D (?X_A (SEE.V ?X_B)))
		)
	)
	(
			"A cat sees a rat."
	)
)



(
	(EPI-SCHEMA ((?X_B MAKE.2.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B ANIMAL.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?X_C FUNNY.A))
			(!R4 (?X_C SOUND.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C EXIST.V)))))
			(?G2 (?X_B (WANT.V (KA (HAVE.V ?X_C)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C EXIST.V))
			(?P2 (?X_B (HAVE.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (THROUGH.P ?X_A))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) WALK.1.V))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PLUR WOOD.N)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (THROUGH.P ?X_B))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) WALK.2.V))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B (PLUR WOOD.N)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O COMPOSITE-SCHEMA-8.PR ?X_K (K CLOSER.A) ?X_H ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_C FOX.N))
			(!R2 (?X_H FUNNY.A))
			(!R3 (?X_H SOUND.N))
			(!R4 (?X_K ANIMAL.N))
			(!R5 (?X_N (PLUR WOOD.N)))
			(!R6 (?X_O AGENT.N))
		)
		(:STEPS
			(?X_J (?X_O (HEAR.V ?X_K)))
			(?X_E (?X_O (GET.V (K CLOSER.A))))
			(?X_B (?X_K ((ADV-A (FOR.P (KA (BE.V ?X_C)))) (OUT.PRT TURN.V))))
			(?X_M
	   (?X_O
	    ((ADV-A (THROUGH.P ?X_N))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) WALK.1.V))))
	    ?L2))
			(?X_M
	   (?X_O
	    ((ADV-A (THROUGH.P ?X_N))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) WALK.2.V))))
	    ?L2))
			(?X_G (?X_K MAKE.2.V ?X_H))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_G)))
			(!W2 (?X_J BEFORE ?X_E))
			(!W3 (?X_E BEFORE ?X_B))
		)
	)
	(
			"A agent hears a animal."
			"A agent gets closer."
			"A animal turns for being a fox out."
			"A agent walk.72s L2 through a woods to L2 from L1 for L2."
			"A agent walk.73s L2 through a woods to L2 from L1 for L2."
			"A animal make.74s a funny sound."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.1.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C NEW.A))
			(!R6 (?X_C (TOO.ADV BIG.A)))
			(!R7 (?X_C SWEATSHIRT.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-9.PR (KA (AWAY.PRT GIVE.V) ?X_F) ?X_F) ** ?E)
		(:ROLES
			(!R1 (?X_F NEW.A))
			(!R2 (?X_F SWEATSHIRT.N))
			(!R3 (?X_F (TOO.ADV BIG.A)))
		)
		(:STEPS
			(?X_C (?X_A (WANT.V (KA (AWAY.PRT GIVE.V) ?X_F))))
			(?X_E (?X_A GET.1.V ?X_F))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C BEFORE ?X_E))
		)
	)
	(
			"X_A wants away give a new sweatshirt too big."
			"X_A get.79s a new sweatshirt too big."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.2.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C CANDY.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA (((K YESTERDAY.N) COMPOSITE-SCHEMA-10.PR ?X_C) ** ?E)
		(:ROLES
			(!R1 (?X_C CANDY.N))
			(!R2 (?X_F AGENT.N))
		)
		(:STEPS
			(?X_E ((K YESTERDAY.N) ?X_F ((ADV-A (TO.P (K (PLUR CV.N)))) GO.V)))
			(?X_B (?X_F GET.2.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E BEFORE ?X_B))
		)
	)
	(
			"Yesterday goes to cvs."
			"A agent get.84s a candy."
	)
)



(
	(EPI-SCHEMA ((?X_N COMPOSITE-SCHEMA-11.PR (K LOST.A) ?X_M ?X_N) ** ?E)
		(:ROLES
			(!R1 (?X_E (RIGHT-AFTER ?X_F)))
			(!R2 (?X_K MAN.N))
			(!R3 (?X_M MOM.N))
			(!R4 (?X_M (PERTAIN-TO ?X_L)))
			(!R5 (?X_N BOY.N))
			(!R6 (?X_M (PERTAIN-TO ?X_N)))
			(!R7 (?X_O (RIGHT-AFTER ?X_P)))
		)
		(:STEPS
			(?X_B (?X_N (GET.V (K LOST.A))))
			(?X_D (?X_N (TO.P ?X_M)))
			(?X_E (?X_N ((ADV-A (TO.P ?X_M)) CALL.V)))
			(?X_H (?X_N ((ADV-A (INTO.P ?X_K)) RUN.V)))
			(?X_J (?X_K ?X_N (TO.P ?X_M)))
			(?X_O (?X_K (((ADV-A (TO.P ?X_M)) BRING.V) ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_D)))
			(!W2 (?X_B (BEFORE ?X_E)))
			(!W3 (?X_B (BEFORE ?X_H)))
			(!W4 (?X_B (BEFORE ?X_J)))
			(!W5 (?X_B (BEFORE ?X_O)))
			(!W6 (?X_D (BEFORE ?X_E)))
			(!W7 (?X_D (BEFORE ?X_H)))
			(!W8 (?X_D (BEFORE ?X_J)))
			(!W9 (?X_D (BEFORE ?X_O)))
			(!W10 (?X_E (BEFORE ?X_H)))
			(!W11 (?X_E (BEFORE ?X_J)))
			(!W12 (?X_E (BEFORE ?X_O)))
			(!W13 (?X_H (BEFORE ?X_J)))
			(!W14 (?X_H (BEFORE ?X_O)))
			(!W15 (?X_J (BEFORE ?X_O)))
		)
	)
	(
			"A boy gets lost."
			"A boy is to."
			"A boy calls to a mom of X_L of a boy."
			"A boy runs into a man."
			"A man is to."
			"A man brings a boy to a mom of X_L of a boy."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-12.PR (K (SO.ADV SAD.A)) ?X_J) ** ?E)
		(:ROLES
			(!R1 (?X_H THING.N))
			(!R2 (?X_H (FOR.P ?X_I)))
			(!R3 (?X_J NEW.A))
			(!R4 (?X_J PUPPY.N))
		)
		(:STEPS
			(?X_C (?X_A PUPPY.N))
			(?X_E (?X_B ((ADV-A (FOR.P (KA (HAVE.V ?X_A)))) SUE.V)))
			(?X_G (?X_B (SUE.V (K (SO.ADV SAD.A)))))
			(?X_L (?X_H (BE.V ?X_J)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_G)))
			(!W3 (?X_C (BEFORE ?X_L)))
			(!W4 (?X_E (BEFORE ?X_G)))
			(!W5 (?X_E (BEFORE ?X_L)))
			(!W6 (?X_G (BEFORE ?X_L)))
		)
	)
	(
			"X_A is puppy."
			"X_B sues for having X_A."
			"X_B sues so sad."
			"A thing for X_I is a new puppy."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_B)) SKIP.V)))) TAKE.1.V)
	              ?O)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?O)))
			(!R5 (?X_B VET.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?O)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?O (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_A)) SKIP.V)))) TAKE.2.V)
	              ?O)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?O)))
			(!R5 (?X_A VET.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?O)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?O (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-13.PR (K SICK.A) ?O) ** ?E)
		(:ROLES
			(!R1 (?X_D VET.N))
			(!R2 (?X_G DAY.N))
			(!R3 (?X_G SKIP.V))
		)
		(:STEPS
			(?X_F (?X_G (GET.V (K SICK.A))))
			(?X_C
	   (?X_A ((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_D)) SKIP.V)))) TAKE.1.V) ?O))
			(?X_C
	   (?X_A ((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_D)) SKIP.V)))) TAKE.2.V) ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F BEFORE ?X_C))
		)
	)
	(
			"A day skipping gets sick."
			"X_A take.133s O for to a vet skipping."
			"X_A take.134s O for to a vet skipping."
	)
)



(
	(EPI-SCHEMA ((?X_B (NEVER.ADV FIND.1.V) ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_C KITTEN.N))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_B ((ADV-A (FOR.P ?X_C)) SEARCH.V)))
			(?I4 (NOT (?X_B (KNOW.V (THAT (?X_C (AT.P ?L)))))))
			(?I5 (NOT (?X_B (HAVE.V ?X_C))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V (THAT (?X_C (AT.P ?L))))))
			(?P2 (?X_B (HAVE.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I3 BEFORE ?X_E))
			(!W2 (?X_E (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?I3) = ?X_E))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B GET.3.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C KITTEN.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B GET.4.V (ANOTHER.D CAT.N)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((ANOTHER.D CAT.N) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (ANOTHER.D CAT.N))))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V (ANOTHER.D CAT.N)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (ANOTHER.D CAT.N))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((ANOTHER.D CAT.N) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (ANOTHER.D CAT.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
			(!W6 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (FROM.P ?X_B))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?X_B)) ((ADV-A (FOR.P ?L2)) RUN.1.V))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C HARE.N))
			(!R2 (?X_B LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_B = ?L2)))
			(!R5 (?X_B DOG.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?X_B)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?X_B))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D COMPOSITE-SCHEMA-14.PR ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?X_D HARE.N))
		)
		(:STEPS
			(?X_B
	   (?X_D
	    ((ADV-A (FROM.P ?X_C))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?X_C)) ((ADV-A (FOR.P ?L2)) RUN.1.V))))
	    ?L2))
		)
	)
	(
			"A hare run.150s L2 from a dog to L2 from a dog for L2."
	)
)



(
	(EPI-SCHEMA ((?X_C TELL_INFORMATION.1.V (K BLUE.A) ?I) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 ((K BLUE.A) AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?X_C (PLUR FRIEND.N)))
			(!R5 (?X_B MAN.N))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT ((K BLUE.A) (KNOW.V ?I))))))
		)
		(:STEPS
			(?X_D (?X_C (TELL.V (K BLUE.A) ?I)))
		)
		(:POSTCONDS
			(?P1 ((K BLUE.A) (KNOW.V ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (TO.P ?X_A)) TAKE.3.V) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_A SHOP.N))
			(!R6 (?X_C (PERTAIN-TO ?X_D)))
			(!R7 (?X_C (PLUR FRIEND.N)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (TO.P ?X_B)) TAKE.4.V) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_B SHOP.N))
			(!R6 (?X_C (PERTAIN-TO ?X_D)))
			(!R7 (?X_C (PLUR FRIEND.N)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_M COMPOSITE-SCHEMA-15.PR ?X_L
	              (K (L X (AND (X (PASV PAINT.V)) (X BLUE.A)))) (K BLUE.A) ?I ?X_B)
	             ** ?E)
		(:ROLES
			(!R1 (?X_G SHOP.N))
			(!R2 (?X_L NEW.A))
			(!R3 (?X_L CAR.N))
			(!R4 (?X_L COLOR.N))
			(!R5 (?X_M MAN.N))
			(!R6 (?X_N (PERTAIN-TO ?X_M)))
			(!R7 ((K BLUE.A) AGENT.N))
			(!R8 (?X_N (PLUR FRIEND.N)))
			(!R9 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_K (?X_M (WANT.V ?X_L)))
			(?X_D (?X_B (GET.V (K (L X (AND (X (PASV PAINT.V)) (X BLUE.A)))))))
			(?E_1 (?X_N TELL_INFORMATION.1.V (K BLUE.A) ?I))
			(?X_F (?X_M ((ADV-A (TO.P ?X_G)) TAKE.3.V) ?X_B))
			(?X_F (?X_M ((ADV-A (TO.P ?X_G)) TAKE.4.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K BEFORE ?X_D))
			(!W2 (?X_D BEFORE ?E_1))
			(!W3 (?E_1 BEFORE ?X_F))
		)
	)
	(
			"A man wants a new car color."
			"X_B gets PASV paints blue."
			"A friends of a man tell information.158 blue a information."
			"A man take.155s X_B to a shop."
			"A man take.156s X_B to a shop."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (FOR.P (K (UP.ADV (TO.P ?X_C)))))
	               ((ADV-A (FROM.P ?L1))
	                ((ADV-A (TO.P (K (UP.ADV (TO.P ?X_C))))) GO.1.V)))
	              (K (UP.ADV (TO.P ?X_C))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (UP.ADV (TO.P ?X_C))) LOCATION.N))
			(!R4 (NOT (?L1 = (K (UP.ADV (TO.P ?X_C))))))
			(!R5 (?X_C COW.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (K (UP.ADV (TO.P ?X_C))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K (UP.ADV (TO.P ?X_C)))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K (UP.ADV (TO.P ?X_C))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              (OVER.PRT
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) FALL.1.V))))
	              ?L2)
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B COW.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (FOR.P ?L2))
	               ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) DIE.1.V)))
	              ?L2)
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B COW.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_L COMPOSITE-SCHEMA-16.PR (K ASLEEP.A) ?X_L
	              (K (UP.ADV (TO.P ?X_L))) ?L2)
	             ** ?E)
		(:ROLES
			(!R1 (?X_I MAN.N))
			(!R2 (?X_L COW.N))
		)
		(:STEPS
			(?X_K (?X_L (FALL.V (K ASLEEP.A))))
			(?X_F (?X_I (PUSH.V ?X_L)))
			(?X_H
	   (?X_I
	    ((ADV-A (FOR.P (K (UP.ADV (TO.P ?X_L)))))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K (UP.ADV (TO.P ?X_L))))) GO.1.V)))
	    (K (UP.ADV (TO.P ?X_L)))))
			(?X_D
	   (?X_L
	    (OVER.PRT
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) FALL.1.V))))
	    ?L2))
			(?X_B
	   (?X_L
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) DIE.1.V)))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_D)))
			(!W2 (?X_H (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
			(!W4 (?X_K BEFORE ?X_F))
		)
	)
	(
			"A cow falls asleep."
			"A man pushes a cow."
			"A man go.172s up to a cow for up to a cow from L1 to up to a cow."
			"A cow fall.173s L2 over to L2 from L1 for L2."
			"A cow die.175s L2 for L2 from L1 to L2."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
	               ((ADV-A (TO.P (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
	                  GO.2.V))))
	              (KA ((ADV-A (FOR.P ?X_D)) LOOK.V)))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA ((ADV-A (FOR.P ?X_D)) LOOK.V)) LOCATION.N))
			(!R4 (NOT (?L1 = (KA ((ADV-A (FOR.P ?X_D)) LOOK.V)))))
			(!R5 (?X_D (PLUR CLOTHE.N)))
			(!R6 (?X_B WIFE.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1
	   (?X_C
	    (WANT.V (KA ((ADV-A (AT.P (KA ((ADV-A (FOR.P ?X_D)) LOOK.V)))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P (KA ((ADV-A (FOR.P ?X_D)) LOOK.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_P COMPOSITE-SCHEMA-17.PR (K GONE.A) ?X_N
	              (KA ((ADV-A (FOR.P ?X_N)) LOOK.V)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_A (RIGHT-AFTER ?X_B)))
			(!R2 (?X_O WIFE.N))
			(!R3 (?X_I NEXT.A))
			(!R4 (?X_I DAY.N))
			(!R5 (?X_N (PLUR CLOTHE.N)))
			(!R6 (?X_P MAN.N))
			(!R7 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_M (?X_P (FOLD.V ?X_N)))
			(?X_K (?X_P ((AWAY.ADV PUT.V) ?X_N)))
			(?X_H (?X_I ?X_N (BE.V (K GONE.A))))
			(?X_D (?X_O (REFOLD.V ?X_N)))
			(?X_A (?X_O (REFOLD.V ?X_N)))
			(?X_F
	   (?X_P
	    ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_N)) LOOK.V))))
	     ((ADV-A (TO.P (KA ((ADV-A (FOR.P ?X_N)) LOOK.V))))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_N)) LOOK.V)))) GO.2.V))))
	    (KA ((ADV-A (FOR.P ?X_N)) LOOK.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M BEFORE ?X_K))
			(!W2 (?X_K BEFORE ?X_H))
			(!W3 (?X_H BEFORE ?X_D))
			(!W4 (?X_D BEFORE ?X_A))
			(!W5 (?X_A BEFORE ?X_F))
		)
	)
	(
			"A man folds a clothes."
			"A man puts a clothes away."
			"A next day is gone."
			"A wife of a man refolds a clothes."
			"A wife of a man refolds a clothes."
			"A man go.180s for a clothes looking for for a clothes looking to for a clothes looking from L1 for for a clothes looking."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-18.PR ?X_B) ** ?E)
		(:ROLES
			(!R1 (?X_A LITTLE.A))
			(!R2 (?X_A DOG.N))
			(!R3 (?X_B BALL.N))
		)
		(:STEPS
			(?X_D (?X_A (MAY.AUX (HAVE.V ?X_B))))
		)
	)
	(
			"A little dog has a ball may."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-19.PR ?X_B) ** ?E)
		(:ROLES
			(!R1 (?X_A ((ADV-A (FOR.P (K (PLUR YEAR.N)))) SAD.A)))
			(!R2 (?X_B CABIN.N))
			(!R3 (?X_B (NEAR.P ?X_C)))
		)
		(:STEPS
			(?X_E (?X_A (HAVE.V ?X_B)))
		)
	)
	(
			"A for years sad has a cabin near X_C."
	)
)



(
	(EPI-SCHEMA ((?X_B (HOME.ADV TAKE.5.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C GIANT.A))
			(!R6 (?X_C FROG.N))
			(!R7 (?X_B (PLUR GIRL.N)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_F)))
			(!W7 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (TO.P ?X_C))
	               ((ADV-A (TO.P ?X_C))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_C)) GO.3.V))))
	              ?X_C)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C LOCATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_B (PLUR GIRL.N)))
			(!R6 (?X_C POND.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?X_C))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O COMPOSITE-SCHEMA-20.PR (K ((ADV-A (FOR.P ?X_C)) (WITH.P ?X_O)))
	              ?X_K ?X_N)
	             ** ?E)
		(:ROLES
			(!R1 (?X_C MONTH.N))
			(!R2 (?X_H BUCKET.N))
			(!R3 (?X_K GIANT.A))
			(!R4 (?X_K FROG.N))
			(!R5 (?X_N POND.N))
			(!R6 (?X_O (PLUR GIRL.N)))
		)
		(:STEPS
			(?X_J (?X_O (CATCH.V ?X_K)))
			(?X_B (?X_K (LIVE.V (K ((ADV-A (FOR.P ?X_C)) (WITH.P ?X_O))))))
			(?X_M
	   (?X_O
	    ((ADV-A (TO.P ?X_N))
	     ((ADV-A (TO.P ?X_N))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_N)) GO.3.V))))
	    ?X_N))
			(?X_G (?X_O (((ADV-A (IN.P ?X_H)) PUT.V) ?X_K)))
			(?X_E (?X_O (HOME.ADV TAKE.5.V) ?X_K))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_G)))
			(!W2 (?X_M (BEFORE ?X_E)))
			(!W3 (?X_J BEFORE ?X_B))
		)
	)
	(
			"A girls catch a giant frog."
			"A giant frog lives for a month with a girls."
			"A girls go.228 a pond to a pond to a pond from L1 for a pond."
			"A girls put a giant frog in a bucket."
	)
)



(
	(EPI-SCHEMA ((?X_B FIND.2.V (KE (?X_C (VERY.ADV UNCOMFORTABLE.A)))) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_C DRESS.N))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L)))
			(?I2 ((KE (?X_C (VERY.ADV UNCOMFORTABLE.A))) (AT.P ?L)))
			(?I3 (?X_B ((ADV-A (FOR.P (KE (?X_C (VERY.ADV UNCOMFORTABLE.A))))) SEARCH.V)))
			(?I4
	   (NOT
	    (?X_B (KNOW.V (THAT ((KE (?X_C (VERY.ADV UNCOMFORTABLE.A))) (AT.P ?L)))))))
			(?I5 (NOT (?X_B (HAVE.V (KE (?X_C (VERY.ADV UNCOMFORTABLE.A)))))))
		)
		(:POSTCONDS
			(?P1
	   (?X_B (KNOW.V (THAT ((KE (?X_C (VERY.ADV UNCOMFORTABLE.A))) (AT.P ?L))))))
			(?P2 (?X_B (HAVE.V (KE (?X_C (VERY.ADV UNCOMFORTABLE.A))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I3 BEFORE ?X_E))
			(!W2 (?X_E (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?I3) = ?X_E))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-21.PR ?X_G
	              (KE (?X_G (VERY.ADV UNCOMFORTABLE.A))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G DRESS.N))
		)
		(:STEPS
			(?X_B (?X_A ((ADV-A (ON.P ?X_G)) TRY.V)))
			(?X_D (?X_A (NEVER.ADV (AGAIN.ADV (WEAR.V ?X_G)))))
			(?X_F (?X_A FIND.2.V (KE (?X_G (VERY.ADV UNCOMFORTABLE.A)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_D)))
		)
	)
	(
			"X_A tries on a dress."
			"X_A wears a dress never again."
			"X_A find.2s a dress very uncomfortable."
	)
)



(
	(EPI-SCHEMA ((?X_B WATCH.1.V (KE (?X_C BURN.V))) ** ?X_D)
		(:ROLES
			(!R1 (?X_B GIRL.N))
			(!R2 ((KE (?X_C BURN.V)) ENTITY.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?I PERTAIN-TO (KE (?X_C BURN.V))))
			(!R5 (?X_C (ON.P (K FIRE.N))))
			(!R6 (?X_C DOLL.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (KNOW.V ?I))))))
		)
		(:PRECONDS
			(?I1 (?X_B (CAN.MD (SEE.V (KE (?X_C BURN.V))))))
		)
		(:POSTCONDS
			(?P1 ((KE (?X_C BURN.V)) (KNOW.V ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 0.5))
			(!N3 (!G1 NECESSARY-TO-DEGREE 0.5))
			(!N4 (!P1 NECESSARY-TO-DEGREE 0.5))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J COMPOSITE-SCHEMA-22.PR (KE (?X_I FUNNY.A)) ?X_C
	              (KE (?X_F BURN.V)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C WHOLE.A))
			(!R2 (?X_C HOUSE.N))
			(!R3 (?X_F DOLL.N))
			(!R4 (?X_F (ON.P (K FIRE.N))))
			(!R5 (?X_I FUNNY.A))
			(!R6 (?X_J GIRL.N))
		)
		(:STEPS
			(?X_H (?X_J (THINK.V (KE (?X_I FUNNY.A)))))
			(?X_B (?X_F (((ADV-A (ON.P (K FIRE.N))) CATCH.V) ?X_C)))
			(?X_E (?X_J WATCH.1.V (KE (?X_F BURN.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_B)))
		)
	)
	(
			"A girl thinks a funny funny."
			"A doll on fire catches a whole house on fire."
			"A girl watch.6s a doll on fire burns."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-23.PR (KE (?X_C (PLAY.V (K BALL.N))))) ** ?E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_C BIG.A))
			(!R3 (?X_C DOG.N))
			(!R4 (?X_B (HAS.V ?X_C)))
		)
		(:STEPS
			(?X_E (?X_A (MAY.AUX (SEE.V (KE (?X_C (PLAY.V (K BALL.N))))))))
		)
	)
	(
			"A agent sees a big dog plays ball may."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              ((ADV-A (AROUND.P ?X_A))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RIDE.1.V))))
	              ?L2)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A TOWN.N))
			(!R6 (?X_C (PERTAIN-TO ?X_D)))
			(!R7 (?X_C (PLUR BIKE.N)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D
	              ((ADV-A (AROUND.P ?X_B))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RIDE.2.V))))
	              ?L2)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B TOWN.N))
			(!R6 (?X_C (PLUR BIKE.N)))
			(!R7 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D (TOGETHER.ADV GET.5.V) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?X_C TOWN.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E (PERTAIN-TO ?X_D)))
			(!R6 (?X_E (PLUR BIKE.N)))
			(!R7 (?X_G (RIGHT-AFTER ?X_B)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?X_C)))
			(?I3 (?X_E (AT.P ?X_C)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (BEFORE ?X_H)))
			(!W7 (?X_G (SAME-TIME ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D (TOGETHER.ADV GET.6.V) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?X_C TOWN.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E (PLUR BIKE.N)))
			(!R6 (?X_E (PERTAIN-TO ?X_D)))
			(!R7 (?X_F (RIGHT-AFTER ?X_A)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?X_C)))
			(?I3 (?X_E (AT.P ?X_C)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (SAME-TIME ?X_H)))
			(!W7 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-24.PR ?X_C (K (VERY.ADV HIGH.A))
	              (K (L X (AND (X MUCH.A) (X FUN.N)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C (PLUR SWING.N)))
		)
		(:STEPS
			(?X_E (?X_A (LOVE.V ?X_C)))
			(?X_G (?X_A (GO.V (K (VERY.ADV HIGH.A)))))
			(?X_I (?X_A (HAVE.V (K (L X (AND (X MUCH.A) (X FUN.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_G)))
			(!W2 (?X_E (BEFORE ?X_I)))
			(!W3 (?X_G (BEFORE ?X_I)))
		)
	)
	(
			"X_A loves a swings."
			"X_A goes very high."
			"X_A has much fun."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-25.PR ?X_E) ** ?E)
		(:ROLES
			(!R1 (?X_A SUN.N))
			(!R2 (?X_D MAN.N))
			(!R3 (?X_D (STILL.ADV LOST.A)))
			(!R4 (?X_E PANIC.N))
		)
		(:STEPS
			(?X_C (?X_A SET.V))
			(?X_G (?X_D (CONTROL.V ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_G)))
		)
	)
	(
			"A sun sets."
			"A man still lost controls a panic."
	)
)



(
	(EPI-SCHEMA ((?X_B (OUT.PRT GET.7.V) ?O) ** ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?O)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?O)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?O (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
			(!W6 (?X_D (AFTER ?X_C)))
			(!W7 (?X_D (AT-ABOUT ?X_E)))
			(!W8 (?X_F (AT-ABOUT ?X_E)))
			(!W9 (?X_F (AFTER ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B (OUT.PRT GET.7.V) ?O) ** ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?O)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?O)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?O (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
			(!W6 (?X_D (AFTER ?X_C)))
			(!W7 (?X_D (AT-ABOUT ?X_E)))
			(!W8 (?X_F (AT-ABOUT ?X_E)))
			(!W9 (?X_F (AFTER ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B TAKE.6.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C WARM.A))
			(!R6 (?X_C SHOWER.V))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J COMPOSITE-SCHEMA-26.PR (K COLD.A)
	              (K ((ADV-A (IN.P ?X_G)) BETTER.A)) (K (BACK.ADV (IN.P ?X_G))) ?O
	              ?X_G)
	             ** ?E)
		(:ROLES
			(!R1 (?X_G WARM.A))
			(!R2 (?X_G SHOWER.V))
			(!R3 (?X_J MAN.N))
		)
		(:STEPS
			(?X_I (?X_J (FEEL.V (K COLD.A))))
			(?X_D (?X_J (FEEL.V (K ((ADV-A (IN.P ?X_G)) BETTER.A)))))
			(?X_B (?X_J (GET.V (K (BACK.ADV (IN.P ?X_G))))))
			(E138.SK (?X_J (OUT.PRT GET.7.V) ?O))
			(E137.SK (?X_J (OUT.PRT GET.7.V) ?O))
			(?X_F (?X_J TAKE.6.V ?X_G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I BEFORE ?X_D))
			(!W2 (?X_D BEFORE ?X_B))
			(!W3 (?X_B BEFORE E138.SK))
			(!W4 (E138.SK BEFORE E137.SK))
			(!W5 (E137.SK BEFORE ?X_F))
		)
	)
	(
			"A man feels cold."
			"A man feels in a warm showering better."
			"A man gets back in a warm showering."
			"A man get.46s O out."
			"A man get.46s O out."
			"A man take.47s a warm showering."
	)
)



(
	(EPI-SCHEMA ((?X_K COMPOSITE-SCHEMA-27.PR ?X_L) ** ?E)
		(:ROLES
			(!R1 (?X_A APPLE.N))
			(!R2 (?X_A TREE.N))
			(!R3 (?X_J INTEREST.N))
			(!R4 (?X_H (RIGHT-AFTER ?X_I)))
			(!R5 (?X_K LITTLE.A))
			(!R6 (?X_K BOY.N))
			(!R7 (?X_J (PERTAIN-TO ?X_K)))
			(!R8 (?X_L APPLE.N))
			(!R9 (?X_L FALL.N))
		)
		(:STEPS
			(?X_C (?X_K ((ADV-A (UNDER.P ?X_A)) SIT.V)))
			(?X_E (?X_K (SEE.V ?X_L)))
			(?X_G (?X_J SOAR.V))
			(?X_H (?X_J SOAR.V))
			(?X_N (?X_K (((ADV-A (FOR.P (K (PLUR YEAR.N)))) STUDY.V) ?X_L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_G)))
			(!W3 (?X_C (BEFORE ?X_H)))
			(!W4 (?X_C (BEFORE ?X_N)))
			(!W5 (?X_E (BEFORE ?X_G)))
			(!W6 (?X_E (BEFORE ?X_H)))
			(!W7 (?X_E (BEFORE ?X_N)))
			(!W8 (?X_G (BEFORE ?X_H)))
			(!W9 (?X_G (BEFORE ?X_N)))
			(!W10 (?X_H (BEFORE ?X_N)))
		)
	)
	(
			"A little boy sits under a apple tree."
			"A little boy sees a apple fall."
			"A interest of a little boy soars."
			"A interest of a little boy soars."
			"A little boy studies a apple fall for years."
	)
)



(
	(EPI-SCHEMA ((?X_B WATCH.2.V ?X_C) ** ?X_F)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?X_C WOMAN.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?I PERTAIN-TO ?X_C))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (KNOW.V ?I))))))
		)
		(:PRECONDS
			(?X_D (?X_B (INSIDE.ADV (CAN.MD SEE.V)) ?X_C))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
			(!W2 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 0.5))
			(!N3 (!G1 NECESSARY-TO-DEGREE 0.5))
			(!N4 (!P1 NECESSARY-TO-DEGREE 0.5))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B WATCH.3.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?X_C WOMAN.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?I PERTAIN-TO ?X_C))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (KNOW.V ?I))))))
		)
		(:PRECONDS
			(?X_F (?X_B (INSIDE.ADV (CAN.MD SEE.V)) ?X_C))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
			(!W2 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 0.5))
			(!N3 (!G1 NECESSARY-TO-DEGREE 0.5))
			(!N4 (!P1 NECESSARY-TO-DEGREE 0.5))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O COMPOSITE-SCHEMA-28.PR ?X_O ?X_C ?X_J) ** ?E)
		(:ROLES
			(!R1 (?X_C POLICE.N))
			(!R2 (?X_J WOMAN.N))
			(!R3 (?X_M WINDOW.N))
			(!R4 (?X_M (OF.P ?X_N)))
			(!R5 (?X_O MAN.N))
		)
		(:STEPS
			(?X_L (?X_O ((ADV-A (INTO.P ?X_M)) LOOK.V)))
			(?X_I (?X_O ((INSIDE.ADV SEE.V) ?X_J)))
			(?X_E (?X_J (((ADV-A (FOR.P (KA WATCH.V))) NOTICE.V) ?X_O)))
			(?X_B (?X_J (CALL.V ?X_C)))
			(?X_G (?X_O WATCH.2.V ?X_J))
			(?X_G (?X_O WATCH.3.V ?X_J))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_E)))
			(!W2 (?X_L (BEFORE ?X_B)))
			(!W3 (?X_I (BEFORE ?X_G)))
			(!W4 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A man looks into a window of X_N."
			"A man sees a woman inside."
			"A woman notices a man for watching."
			"A woman calls a police."
			"A man watch.59s a woman."
			"A man watch.60s a woman."
	)
)



(
	(EPI-SCHEMA ((?X_B MAKE.3.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?X_C BET.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C EXIST.V)))))
			(?G2 (?X_B (WANT.V (KA (HAVE.V ?X_C)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C EXIST.V))
			(?P2 (?X_B (HAVE.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (WITH.P ?T)) PLAY.7.V) ?X_A) ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 (?X_A GAME.N))
			(!R5 (NOT (?X_A AGENT.N)))
			(!R6 (?X_A BET.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_C EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R5 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (WITH.P ?T)) PLAY.8.V) ?X_B) ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 (?X_B GAME.N))
			(!R5 (NOT (?X_B AGENT.N)))
			(!R6 (?X_B BET.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_C EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R5 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N COMPOSITE-SCHEMA-29.PR (KE ((K MONEY.N) (FOR.P (?X_H BET.N))))
	              (ALL.D
	               (L X
	                (AND (X {REF}.N)
	                     (?X_A ?X_C (AND (?X_C MONEY.N) (?X_C (PERTAIN-TO ?X_N)))
	                      (X (OF.P ?X_C))))))
	              ?X_M)
	             ** ?E)
		(:ROLES
			(!R1 (?X_H MORE.A))
			(!R2 (?X_M BET.N))
			(!R3 (?X_N MAN.N))
		)
		(:STEPS
			(?X_J (?X_N (LOSE.V ?X_M)))
			(?X_G (?X_N (ONLY.ADV (HAVE.V (KE ((K MONEY.N) (FOR.P (?X_H BET.N))))))))
			(?X_E
	   (?X_N
	    (LOSE.V
	     (ALL.D
	      (L X
	       (AND (X {REF}.N)
	            (?X_A ?X_C (AND (?X_C MONEY.N) (?X_C (PERTAIN-TO ?X_N)))
	             (X (OF.P ?X_C)))))))))
			(?X_L (?X_N MAKE.3.V ?X_M))
			(?X_L (?X_N ((ADV-A (WITH.P ?T)) PLAY.7.V) ?X_M))
			(?X_L (?X_N ((ADV-A (WITH.P ?T)) PLAY.8.V) ?X_M))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J BEFORE ?X_G))
			(!W2 (?X_G BEFORE ?X_E))
			(!W3 (?X_E BEFORE ?X_L))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA (((K BILL.N) COMPOSITE-SCHEMA-30.PR ?X_G (K (|4.2.2.V| GREEN.A))) **
	             ?E)
		(:ROLES
			(!R1 (?X_G HORN.N))
			(!R2 (?X_G (BEHIND.P (K BILL.N))))
			(!R3 (?X_J STOP.N))
			(!R4 (?X_J LIGHT.N))
			(!R5 (?X_K (IMPINGES-ON ?X_L)))
		)
		(:STEPS
			(?X_B ((K BILL.N) ((ADV-A (AT.P ?X_J)) BE.V)))
			(?X_D (?X_J ((ADV-A (ON.P (K RED.N))) BE.V)))
			(?X_F
	   ((K BILL.N)
	    ((ADV-A (FOR.P (KA (AROUND.ADV ((ADV-A (WHILE.P (KA WAIT.V))) LOOK.V)))))
	     BEGIN.V)))
			(?X_I ((K BILL.N) (SUDDENLY.ADV (HEAR.V ?X_G))))
			(?X_K (?X_J (HAVE.V (K (|4.2.2.V| GREEN.A)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_D)))
			(!W2 (?X_B (BEFORE ?X_F)))
			(!W3 (?X_B (BEFORE ?X_I)))
			(!W4 (?X_B (BEFORE ?X_K)))
			(!W5 (?X_D (BEFORE ?X_F)))
			(!W6 (?X_D (BEFORE ?X_I)))
			(!W7 (?X_D (BEFORE ?X_K)))
			(!W8 (?X_F (BEFORE ?X_I)))
			(!W9 (?X_F (BEFORE ?X_K)))
			(!W10 (?X_I (BEFORE ?X_K)))
		)
	)
	(
			"Bill is at a stop light."
			"A stop light is on red."
			"Bill begins for around while waiting look."
			"Bill hears a horn behind bill suddenly."
			"A stop light has 4.2.2inging green."
	)
)



(
	(EPI-SCHEMA ((?X_H ((ADV-A (IN.P ?X_A)) GET.8.V)
	              (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))))
	             ** ?X_J)
		(:ROLES
			(!R1 (?X_H AGENT.N))
			(!R2 ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))) INANIMATE_OBJECT.N))
			(!R3 (?X_G HOME.N))
			(!R4 (NOT (?X_H = (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))))))
			(!R5 (?X_I WATER.N))
			(!R6 (?X_H (PLUR CHILD.N)))
			(!R7 (?X_A ROW.N))
			(!R8 (?X_A BOAT.N))
			(!R9 (?X_G HOUSE.N))
			(!R10 (?X_G (PERTAIN-TO ?X_E)))
			(!R11 (?X_C NEW.A))
			(!R12 (?X_C BOAT.N))
			(!R13 (?X_E (HAS.V ?X_C)))
			(!R14 (?X_D (PERTAIN-TO ?X_E)))
			(!R15 (?X_D FATHER.N))
			(!R16 (?X_E (HAS.V ?X_F)))
			(!R17 (?X_F HOOK.N))
		)
		(:GOALS
			(?G1
	   (?X_H
	    (WANT.V (THAT (?X_H (HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I)))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_H HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))))))
			(?I2 (?X_H (AT.P ?X_G)))
			(?I3 ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))) (AT.P ?X_G)))
		)
		(:POSTCONDS
			(?P1 (?X_H HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_J))
			(!W2 (?I1 PRECOND-OF ?X_J))
			(!W3 (?I2 PRECOND-OF ?X_J))
			(!W4 (?I3 PRECOND-OF ?X_J))
			(!W5 (?P1 POSTCOND-OF ?X_J))
			(!W6 (?X_J (AFTER ?X_K)))
			(!W7 (?X_K (AT-ABOUT ?X_L)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_H ((ADV-A (IN.P ?X_A)) GET.9.V)
	              (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))))
	             ** ?X_J)
		(:ROLES
			(!R1 (?X_H AGENT.N))
			(!R2 ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))) INANIMATE_OBJECT.N))
			(!R3 (?X_G HOME.N))
			(!R4 (NOT (?X_H = (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))))))
			(!R5 (?X_I WATER.N))
			(!R6 (?X_H (PLUR CHILD.N)))
			(!R7 (?X_A BOAT.N))
			(!R8 (?X_A ROW.N))
			(!R9 (?X_G HOUSE.N))
			(!R10 (?X_G (PERTAIN-TO ?X_E)))
			(!R11 (?X_C FATHER.N))
			(!R12 (?X_C (PERTAIN-TO ?X_E)))
			(!R13 (?X_D NEW.A))
			(!R14 (?X_E (HAS.V ?X_D)))
			(!R15 (?X_D BOAT.N))
			(!R16 (?X_F HOOK.N))
			(!R17 (?X_E (HAS.V ?X_F)))
		)
		(:GOALS
			(?G1
	   (?X_H
	    (WANT.V (THAT (?X_H (HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I)))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_H HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))))))
			(?I2 (?X_H (AT.P ?X_G)))
			(?I3 ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))) (AT.P ?X_G)))
		)
		(:POSTCONDS
			(?P1 (?X_H HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_J))
			(!W2 (?I1 PRECOND-OF ?X_J))
			(!W3 (?I2 PRECOND-OF ?X_J))
			(!W4 (?I3 PRECOND-OF ?X_J))
			(!W5 (?P1 POSTCOND-OF ?X_J))
			(!W6 (?X_J (AFTER ?X_K)))
			(!W7 (?X_K (AT-ABOUT ?X_L)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_H ((ADV-A (IN.P ?X_A)) GET.10.V)
	              (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))))
	             ** ?X_J)
		(:ROLES
			(!R1 (?X_H AGENT.N))
			(!R2 ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))) INANIMATE_OBJECT.N))
			(!R3 (?X_G HOME.N))
			(!R4 (NOT (?X_H = (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))))))
			(!R5 (?X_A ROW.N))
			(!R6 (?X_A BOAT.N))
			(!R7 (?X_I WATER.N))
			(!R8 (?X_H (PLUR CHILD.N)))
			(!R9 (?X_G HOUSE.N))
			(!R10 (?X_G (PERTAIN-TO ?X_E)))
			(!R11 (?X_C (PERTAIN-TO ?X_E)))
			(!R12 (?X_C FATHER.N))
			(!R13 (?X_D HOOK.N))
			(!R14 (?X_E (HAS.V ?X_D)))
			(!R15 (?X_F NEW.A))
			(!R16 (?X_E (HAS.V ?X_F)))
			(!R17 (?X_F BOAT.N))
		)
		(:GOALS
			(?G1
	   (?X_H
	    (WANT.V (THAT (?X_H (HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I)))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_H HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))))))
			(?I2 (?X_H (AT.P ?X_G)))
			(?I3 ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))) (AT.P ?X_G)))
		)
		(:POSTCONDS
			(?P1 (?X_H HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_J))
			(!W2 (?I1 PRECOND-OF ?X_J))
			(!W3 (?I2 PRECOND-OF ?X_J))
			(!W4 (?I3 PRECOND-OF ?X_J))
			(!W5 (?P1 POSTCOND-OF ?X_J))
			(!W6 (?X_J (AFTER ?X_K)))
			(!W7 (?X_K (AT-ABOUT ?X_L)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D COMPOSITE-SCHEMA-31.PR ?X_R ?X_P ?X_J ?X_G
	              (K (L X (AND (X OUT.P) (X (OF.P (THE.D BOAT.N))))))
	              (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_B))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_B WATER.N))
			(!R2 (?X_C BOAT.N))
			(!R3 (?X_C ROW.N))
			(!R4 (?X_D (PLUR CHILD.N)))
			(!R5 (?X_E (RIGHT-AFTER ?X_F)))
			(!R6 (?X_G RIVER.N))
			(!R7 (?X_J GOOD.A))
			(!R8 (?X_J (PLUR OAR.N)))
			(!R9 (?X_O HOUSE.N))
			(!R10 (?X_O HOME.N))
			(!R11 (?X_K (RIGHT-AFTER ?X_L)))
			(!R12 (?X_O (PERTAIN-TO ?X_R)))
			(!R13 (?X_P NEW.A))
			(!R14 (?X_P BOAT.N))
			(!R15 (?X_R (HAS.V ?X_P)))
			(!R16 (?X_Q FATHER.N))
			(!R17 (?X_Q (PERTAIN-TO ?X_R)))
			(!R18 (?X_S HOOK.N))
			(!R19 (?X_R (HAS.V ?X_S)))
		)
		(:STEPS
			(?X_N (?X_Q (GIVE.V ?X_P ?X_R)))
			(?X_K (?X_Q (((ADV-A (TO.P ?X_R)) GIVE.V) ?X_P)))
			(?X_I (?X_R (((ADV-A (AT.P ?X_O)) KEEP.V) ?X_J)))
			(?X_E (?X_O (NEAR.P ?X_G)))
			(E246.SK
	   (NOT (?X_D (FALL.V (K (L X (AND (X OUT.P) (X (OF.P (THE.D BOAT.N))))))))))
			(E247.SK
	   (?X_D ((ADV-A (IN.P ?X_C)) GET.8.V)
	    (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_B)))))
			(E247.SK
	   (?X_D ((ADV-A (IN.P ?X_C)) GET.9.V)
	    (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_B)))))
			(E247.SK
	   (?X_D ((ADV-A (IN.P ?X_C)) GET.10.V)
	    (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_B)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N BEFORE ?X_K))
			(!W2 (?X_K BEFORE ?X_I))
			(!W3 (?X_I BEFORE ?X_E))
			(!W4 (?X_E BEFORE E246.SK))
			(!W5 (E246.SK BEFORE E247.SK))
		)
	)
	(
			"A father of a has a new boat has a hook gives a new boat a has a new boat has a hook."
			"A father of a has a new boat has a hook gives a new boat to a has a new boat has a hook."
			"A has a new boat has a hook keeps a good oars at a house home of a has X_P has X_S."
			"A house home of a has X_P has X_S is near."
			"A childs fall out of not."
			"A childs get.88 ADV far out on a water in a boat row."
			"A childs get.89 ADV far out on a water in a boat row."
			"A childs get.90 ADV far out on a water in a boat row."
	)
)



(
	(EPI-SCHEMA ((?X_D MAKE.4.V ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?X_E LOUD.A))
			(!R4 (?X_E NOISE.N))
			(!R5 (?X_B (PERTAIN-TO ?X_D)))
			(!R6 (?X_B (PLUR EAR.N)))
			(!R7 (?X_C (PERTAIN-TO ?X_D)))
			(!R8 (?X_C (PLUR HAND.N)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_E EXIST.V)))))
			(?G2 (?X_D (WANT.V (KA (HAVE.V ?X_E)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_E EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_E EXIST.V))
			(?P2 (?X_D (HAVE.V ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D MAKE.5.V ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?X_E LOUD.A))
			(!R4 (?X_E NOISE.N))
			(!R5 (?X_B (PLUR HAND.N)))
			(!R6 (?X_B (PERTAIN-TO ?X_D)))
			(!R7 (?X_C (PLUR EAR.N)))
			(!R8 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_E EXIST.V)))))
			(?G2 (?X_D (WANT.V (KA (HAVE.V ?X_E)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_E EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_E EXIST.V))
			(?P2 (?X_D (HAVE.V ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D REQUEST_ACTION.1.V ?X_D (KA (MAKE.V ?X_E))) ** ?E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 ((KA (MAKE.V ?X_E)) ACTION.N))
			(!R3 (?X_E LOUD.A))
			(!R4 (?X_E NOISE.N))
			(!R5 (?X_B (PERTAIN-TO ?X_D)))
			(!R6 (?X_B (PLUR EAR.N)))
			(!R7 (?X_C (PERTAIN-TO ?X_D)))
			(!R8 (?X_C (PLUR HAND.N)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V ?X_D (KA (MAKE.V ?X_E)))))
			(?G2 (?X_D (WANT.V (THAT (?X_D MAKE.V ?X_E)))))
		)
		(:STEPS
			(?E1 (?X_D (ASK.V ?X_D (KA (MAKE.V ?X_E)))))
			(?X_F (?X_D MAKE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?X_F))
			(!W3 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D REQUEST_ACTION.2.V ?X_E (KA (MAKE.V ?X_F))) ** ?E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E AGENT.N))
			(!R3 ((KA (MAKE.V ?X_F)) ACTION.N))
			(!R4 (?X_F LOUD.A))
			(!R5 (?X_F NOISE.N))
			(!R6 (?X_B (PERTAIN-TO ?X_E)))
			(!R7 (?X_B (PLUR EAR.N)))
			(!R8 (?X_C (PLUR HAND.N)))
			(!R9 (?X_C (PERTAIN-TO ?X_E)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V ?X_E (KA (MAKE.V ?X_F)))))
			(?G2 (?X_D (WANT.V (THAT (?X_D MAKE.V ?X_F)))))
		)
		(:STEPS
			(?E1 (?X_D (ASK.V ?X_E (KA (MAKE.V ?X_F)))))
			(?X_G (?X_E MAKE.V ?X_F))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?X_G))
			(!W3 (?X_G (AT-ABOUT ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D REQUEST_ACTION.3.V ?X_D (KA (MAKE.V ?X_E))) ** ?E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 ((KA (MAKE.V ?X_E)) ACTION.N))
			(!R3 (?X_E NOISE.N))
			(!R4 (?X_E LOUD.A))
			(!R5 (?X_B (PERTAIN-TO ?X_D)))
			(!R6 (?X_B (PLUR HAND.N)))
			(!R7 (?X_C (PLUR EAR.N)))
			(!R8 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V ?X_D (KA (MAKE.V ?X_E)))))
			(?G2 (?X_D (WANT.V (THAT (?X_D MAKE.V ?X_E)))))
		)
		(:STEPS
			(?E1 (?X_D (ASK.V ?X_D (KA (MAKE.V ?X_E)))))
			(?X_F (?X_D MAKE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?X_F))
			(!W3 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_K COMPOSITE-SCHEMA-32.PR ?X_H ?X_G ?X_J ?X_K (KA (MAKE.V ?X_J)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C (RIGHT-AFTER ?X_D)))
			(!R2 (?X_H (PLUR HAND.N)))
			(!R3 (?X_G (PLUR EAR.N)))
			(!R4 (?X_G (PERTAIN-TO ?X_K)))
			(!R5 (?X_H (PERTAIN-TO ?X_K)))
			(!R6 (?X_I AGENT.N))
			(!R7 ((KA (MAKE.V ?X_J)) ACTION.N))
			(!R8 (?X_J NOISE.N))
			(!R9 (?X_J LOUD.A))
			(!R10 (?X_K AGENT.N))
		)
		(:STEPS
			(?X_F (?X_K (COVER.V ?X_G ?X_H)))
			(?X_C (?X_K (((ADV-A (WITH.P ?X_H)) COVER.V) ?X_G)))
			(?X_B (?X_K MAKE.4.V ?X_J))
			(?X_B (?X_K MAKE.5.V ?X_J))
			(?E_1 (?X_K REQUEST_ACTION.1.V ?X_K (KA (MAKE.V ?X_J))))
			(?E_2 (?X_I REQUEST_ACTION.2.V ?X_K (KA (MAKE.V ?X_J))))
			(?E_3 (?X_K REQUEST_ACTION.3.V ?X_K (KA (MAKE.V ?X_J))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F BEFORE ?X_C))
			(!W2 (?X_C BEFORE ?X_B))
			(!W3 (?X_B BEFORE ?E_1))
			(!W4 (?E_1 BEFORE ?E_2))
			(!W5 (?E_2 BEFORE ?E_3))
		)
	)
	(
			"A agent covers a ears of a agent a hands of a agent."
			"A agent covers a ears of a agent with a hands of a agent."
			"A agent make.108s a noise loud."
			"A agent make.109s a noise loud."
			"A agent request action.119s a agent making a noise loud."
			"A agent request action.120s a agent making a noise loud."
			"A agent request action.122s a agent making a noise loud."
	)
)



(
	(EPI-SCHEMA ((?X_E COMPOSITE-SCHEMA-33.PR
	              (K (L X (AND (X GOLD.A) (X (PLUR EARRING.N)))))
	              (KE (?X_B EVERYDAY.A)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E AGENT.N))
		)
		(:STEPS
			(?X_D (?X_E (HAVE.V (K (L X (AND (X GOLD.A) (X (PLUR EARRING.N))))))))
			(?X_G (?X_E (WEAR.V (KE (?X_B EVERYDAY.A)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_G)))
		)
	)
	(
			"A agent has gold earring."
			"A agent wears X_B everyday."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              (AWAY.PRT
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.2.V))))
	              ?L2)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_D NEW.A))
			(!R6 (?X_B EVENING.N))
			(!R7 (?X_B (WALK.V ?X_D)))
			(!R8 (?X_C (CANNOT.ADV (CATCH.V ?X_D))))
			(!R9 (?X_C ((OUT.ADV IS.V) ?X_B)))
			(!R10 (?X_D (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D
	              (AWAY.PRT
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.3.V))))
	              ?L2)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_D NEW.A))
			(!R6 (?X_B (CANNOT.ADV (CATCH.V ?X_D))))
			(!R7 (?X_D (PERTAIN-TO ?X_B)))
			(!R8 (?X_C EVENING.N))
			(!R9 (?X_B ((OUT.ADV IS.V) ?X_C)))
			(!R10 (?X_C (WALK.V ?X_D)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C GET.11.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_C (CANNOT.ADV (CATCH.V ?X_D))))
			(!R6 (?X_D NEW.A))
			(!R7 (?X_D (PERTAIN-TO ?X_C)))
			(!R8 (?X_D DOG.N))
			(!R9 (?X_B (WALK.V ?X_D)))
			(!R10 (?X_C ((OUT.ADV IS.V) ?X_B)))
			(!R11 (?X_B EVENING.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?X_D)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_D (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-34.PR ?L2 ?X_K) ** ?E)
		(:ROLES
			(!R1 (?X_E (RIGHT-AFTER ?X_F)))
			(!R2 (?X_K NEW.A))
			(!R3 (?X_K DOG.N))
			(!R4 (?X_K (PERTAIN-TO ?X_I)))
			(!R5 (?X_I (CANNOT.ADV (CATCH.V ?X_K))))
			(!R6 (?X_J EVENING.N))
			(!R7 (?X_I ((OUT.ADV IS.V) ?X_J)))
			(!R8 (?X_J (WALK.V ?X_K)))
		)
		(:STEPS
			(?X_E (?X_I (LOVE.V ?X_K)))
			(?X_D (?X_I (LOVE.V ?X_K)))
			(?X_H (?X_I GET.11.V ?X_K))
			(?X_B
	   (?X_K
	    (AWAY.PRT
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.2.V))))
	    ?L2))
			(?X_B
	   (?X_K
	    (AWAY.PRT
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.3.V))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_B)))
			(!W2 (?X_E BEFORE ?X_D))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_D
	              ((ADV-A (FOR.P ?X_B))
	               (DOWN.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.3.V)))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (NOT (?S AGENT.N)))
			(!R3 (?S FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_D (MORE.ADV TIRED.A)))
			(!R6 (?X_B BREAK.N))
			(!R7 (?X_C (PERTAIN-TO ?X_D)))
			(!R8 (?X_C BREATH.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L)))
			(?I2 (?S (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D
	              ((ADV-A (FOR.P ?X_A))
	               (DOWN.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.4.V)))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (NOT (?S AGENT.N)))
			(!R3 (?S FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_A BREAK.N))
			(!R6 (?X_D (MORE.ADV TIRED.A)))
			(!R7 (?X_C (PERTAIN-TO ?X_D)))
			(!R8 (?X_C BREATH.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L)))
			(?I2 (?S (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_L COMPOSITE-SCHEMA-35.PR (KE (?X_L THINK.V))) ** ?E)
		(:ROLES
			(!R1 (?X_F BREAK.N))
			(!R2 (?X_I (RIGHT-AFTER ?X_J)))
			(!R3 (?X_K BREATH.N))
			(!R4 (?X_L MAN.N))
			(!R5 (?X_L (MORE.ADV TIRED.A)))
			(!R6 (?X_K (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(?X_A (?X_L ((ADV (VERY.ADV FAST.A)) RUN.V)))
			(?X_I (?X_L ((ADV-A (FOR.P (KA (CATCH.V ?X_K)))) STOP.V)))
			(?X_H (?X_L ((ADV-A (FOR.P (KA (CATCH.V ?X_K)))) STOP.V)))
			(?X_B (?X_L (THAN.P (KE (?X_L THINK.V)))))
			(?X_C (?X_L (THAN.P (KE (?X_L THINK.V)))))
			(?X_E
	   (?X_L
	    ((ADV-A (FOR.P ?X_F))
	     (DOWN.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.3.V))))))
			(?X_E
	   (?X_L
	    ((ADV-A (FOR.P ?X_F))
	     (DOWN.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.4.V))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_I)))
			(!W2 (?X_A (BEFORE ?X_H)))
			(!W3 (?X_A (BEFORE ?X_B)))
			(!W4 (?X_A (BEFORE ?X_C)))
			(!W5 (?X_I (BEFORE ?X_H)))
			(!W6 (?X_I (BEFORE ?X_B)))
			(!W7 (?X_I (BEFORE ?X_C)))
			(!W8 (?X_H (BEFORE ?X_B)))
			(!W9 (?X_H (BEFORE ?X_C)))
			(!W10 (?X_B (BEFORE ?X_C)))
		)
	)
	(
			"A man more tired runs ADV very fast."
			"A man more tired stops for catching a breath of a man more tired."
			"A man more tired stops for catching a breath of a man more tired."
			"A man more tired is than."
			"A man more tired is than."
			"A man more tired sit.1s for a break down in S on S."
			"A man more tired sit.5s for a break down in S on S."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (IN.P (K (L X (AND (X LAST.A) (X PLACE.N))))))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) COME.1.V))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B (PERTAIN-TO ?X_C)))
			(!R6 (?X_B (PLUR FRIEND.N)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J COMPOSITE-SCHEMA-36.PR ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_F GROUP.N))
			(!R2 (?X_J AGENT.N))
			(!R3 (?X_I (PLUR FRIEND.N)))
			(!R4 (?X_I (PERTAIN-TO ?X_J)))
		)
		(:STEPS
			(?X_H ((SET-OF ?X_I ?X_J) RUN.V))
			(?X_E (?X_J ((ADV-A (BEHIND.P ?X_F)) BE.V)))
			(?X_C
	   (?X_J
	    ((ADV-A (IN.P (K (L X (AND (X LAST.A) (X PLACE.N))))))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) COME.1.V))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H BEFORE ?X_E))
			(!W2 (?X_E BEFORE ?X_C))
		)
	)
	(
			"A friends of a agent and a agent run."
			"A agent is behind a group."
			"A agent come.22s L2 in last place to L2 from L1 for L2."
	)
)



(
	(EPI-SCHEMA ((?X_D COMPOSITE-SCHEMA-37.PR (KA SKATE.V)
	              (KA (TAKE.V (K (PLUR LESSON.N)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:STEPS
			(?X_B (?X_D (WANT.V (KA SKATE.V))))
			(?X_F (?X_D (DECIDE.V (KA (TAKE.V (K (PLUR LESSON.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_F)))
		)
	)
	(
			"X_D wants skating."
			"X_D decides taking lessons."
	)
)



(
	(EPI-SCHEMA ((?X_C COMPOSITE-SCHEMA-38.PR ?X_D) ** ?E)
		(:ROLES
			(!R1 (?X_B BAY.N))
			(!R2 (?X_C AGENT.N))
			(!R3 (?X_D (K DARK.A) SHADOW.N))
			(!R4 (?X_D (IN.P ?X_E)))
		)
		(:STEPS
			(?X_A (?X_C ((ADV-A (ON.P ?X_B)) LIVE.V)))
			(?X_G (?X_C (SEE.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_G)))
		)
	)
	(
			"A agent lives on a bay."
			"A agent sees a in X_E."
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (IN.P ?X_A)) FIND.3.V)
	              (K (L X (AND (X SWEET.A) (X NECTAR.N)))))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C LOCATION.N))
			(!R3 (?X_A CLOVER.N))
			(!R4 (?X_A (PLUR FLOWER.N)))
			(!R5 (?X_D (PLUR BEE.N)))
			(!R6 (?X_C (PLUR FIELD.N)))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?X_C)))
			(?I2 ((K (L X (AND (X SWEET.A) (X NECTAR.N)))) (AT.P ?X_C)))
			(?I3
	   (?X_D ((ADV-A (FOR.P (K (L X (AND (X SWEET.A) (X NECTAR.N)))))) SEARCH.V)))
			(?I4
	   (NOT
	    (?X_D
	     (KNOW.V (THAT ((K (L X (AND (X SWEET.A) (X NECTAR.N)))) (AT.P ?X_C)))))))
			(?I5 (NOT (?X_D (HAVE.V (K (L X (AND (X SWEET.A) (X NECTAR.N))))))))
		)
		(:POSTCONDS
			(?P1
	   (?X_D
	    (KNOW.V (THAT ((K (L X (AND (X SWEET.A) (X NECTAR.N)))) (AT.P ?X_C))))))
			(?P2 (?X_D (HAVE.V (K (L X (AND (X SWEET.A) (X NECTAR.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I3 BEFORE ?X_G))
			(!W2 (?X_G (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?I3) = ?X_G))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (IN.P ?X_B)) FIND.4.V)
	              (K (L X (AND (X SWEET.A) (X NECTAR.N)))))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C LOCATION.N))
			(!R3 (?X_D (PLUR BEE.N)))
			(!R4 (?X_B (PLUR FLOWER.N)))
			(!R5 (?X_B CLOVER.N))
			(!R6 (?X_C (PLUR FIELD.N)))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?X_C)))
			(?I2 ((K (L X (AND (X SWEET.A) (X NECTAR.N)))) (AT.P ?X_C)))
			(?I3
	   (?X_D ((ADV-A (FOR.P (K (L X (AND (X SWEET.A) (X NECTAR.N)))))) SEARCH.V)))
			(?I4
	   (NOT
	    (?X_D
	     (KNOW.V (THAT ((K (L X (AND (X SWEET.A) (X NECTAR.N)))) (AT.P ?X_C)))))))
			(?I5 (NOT (?X_D (HAVE.V (K (L X (AND (X SWEET.A) (X NECTAR.N))))))))
		)
		(:POSTCONDS
			(?P1
	   (?X_D
	    (KNOW.V (THAT ((K (L X (AND (X SWEET.A) (X NECTAR.N)))) (AT.P ?X_C))))))
			(?P2 (?X_D (HAVE.V (K (L X (AND (X SWEET.A) (X NECTAR.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I3 BEFORE ?X_G))
			(!W2 (?X_G (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?I3) = ?X_G))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (IN.P ?X_A)) FIND.5.V)
	              (K (L X (AND (X SWEET.A) (X NECTAR.N)))))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C HOME.N))
			(!R3 (?X_A (PLUR FLOWER.N)))
			(!R4 (?X_A CLOVER.N))
			(!R5 (?X_D (PLUR BEE.N)))
			(!R6 (?X_C NECTAR.A))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?X_C)))
			(?I2 ((K (L X (AND (X SWEET.A) (X NECTAR.N)))) (AT.P ?X_C)))
			(?I3
	   (?X_D ((ADV-A (FOR.P (K (L X (AND (X SWEET.A) (X NECTAR.N)))))) SEARCH.V)))
			(?I4
	   (NOT
	    (?X_D
	     (KNOW.V (THAT ((K (L X (AND (X SWEET.A) (X NECTAR.N)))) (AT.P ?X_C)))))))
			(?I5 (NOT (?X_D (HAVE.V (K (L X (AND (X SWEET.A) (X NECTAR.N))))))))
		)
		(:POSTCONDS
			(?P1
	   (?X_D
	    (KNOW.V (THAT ((K (L X (AND (X SWEET.A) (X NECTAR.N)))) (AT.P ?X_C))))))
			(?P2 (?X_D (HAVE.V (K (L X (AND (X SWEET.A) (X NECTAR.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I3 BEFORE ?X_G))
			(!W2 (?X_G (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?I3) = ?X_G))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FOR.P (KA (MAKE.V (K HONEY.N))))) TAKE.7.V) ?X_D)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?X_B LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_C (PLUR BEE.N)))
			(!R6 (?X_D HOME.N))
			(!R7 (?X_D NECTAR.A))
			(!R8 (?X_B (PLUR FIELD.N)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?X_D)))
			(?I2 (?X_C (AT.P ?X_B)))
			(?I3 (?X_D (AT.P ?X_B)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_T COMPOSITE-SCHEMA-39.PR ?X_A ?X_K ?X_B (K CLOVER.N)
	              (K (L X (AND (X SWEET.A) (X NECTAR.N)))) ?X_N)
	             ** ?E)
		(:ROLES
			(!R1 (?X_H (PLUR FIELD.N)))
			(!R2 (?X_K SWEET.A))
			(!R3 (?X_N NECTAR.A))
			(!R4 (?X_N HOME.N))
			(!R5 (?X_Q CLOVER.N))
			(!R6 (?X_Q (PLUR FLOWER.N)))
			(!R7 (?X_T (PLUR BEE.N)))
		)
		(:STEPS
			(?X_S (?X_T (LIKE.V ?X_A)))
			(?X_J ((K (PLUR BEE.N)) ((TOO.ADV LIKE.V) ?X_K ?X_B)))
			(?X_G
	   (?X_K
	    ((ADV-A
	      (WITH.P
	       (SET-OF (K (L X (AND (X RED.A) (X CLOVER.N))))
	        (K (L X (AND (X YELLOW.A) (X (PLUR BUTTERCUP.N))))))))
	     ((ADV-A (IN.P ?X_H)) GROW.V))))
			(?X_E
	   ((K (L X ((X (PLUR HORSE.N)) AND (X AND) (X (PLUR COW.N)))))
	    (EAT.V (K CLOVER.N))))
			(?X_P
	   (?X_T ((ADV-A (IN.P ?X_Q)) FIND.3.V)
	    (K (L X (AND (X SWEET.A) (X NECTAR.N))))))
			(?X_P
	   (?X_T ((ADV-A (IN.P ?X_Q)) FIND.4.V)
	    (K (L X (AND (X SWEET.A) (X NECTAR.N))))))
			(?X_P
	   (?X_T ((ADV-A (IN.P ?X_Q)) FIND.5.V)
	    (K (L X (AND (X SWEET.A) (X NECTAR.N))))))
			(?X_M (?X_T ((ADV-A (FOR.P (KA (MAKE.V (K HONEY.N))))) TAKE.7.V) ?X_N))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_P (BEFORE ?X_M)))
			(!W2 (?X_S BEFORE ?X_J))
			(!W3 (?X_J BEFORE ?X_G))
			(!W4 (?X_G BEFORE ?X_E))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_C COMPOSITE-SCHEMA-40.PR) ** ?E)
		(:ROLES
			(!R1 (?X_C (PLUR SLED.N)))
			(!R2 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:STEPS
			(?X_A (?X_C (WELL.ADV RUN.V)))
			(?X_B (?X_C (WELL.ADV RUN.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_B)))
		)
	)
	(
			"A sleds of X_D run well."
			"A sleds of X_D run well."
	)
)



(
	(EPI-SCHEMA ((?X_M COMPOSITE-SCHEMA-41.PR (KA (BUY.V ?X_E)) ?X_H ?X_N) ** ?E)
		(:ROLES
			(!R1 (?X_B JEWELRY.N))
			(!R2 (?X_B STORE.N))
			(!R3 (?X_E NEW.A))
			(!R4 (?X_E WATCH.N))
			(!R5 (?X_H MOST.A))
			(!R6 (?X_M AGENT.N))
			(!R7 (?X_N ROSE.N))
			(!R8 (?X_N GOLD.N))
			(!R9 (?X_N WATCH.N))
		)
		(:STEPS
			(?X_D (?X_A ((ADV-A (AT.P ?X_B)) BE.V)))
			(?X_G (?X_M (WANT.V (KA (BUY.V ?X_E)))))
			(?X_J (?X_M (LIKE.V ?X_N ?X_H)))
			(?X_L (?X_M ((HOME.ADV WEAR.V) ?X_N)))
			(?X_P (?X_M (BUY.V ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_G)))
			(!W2 (?X_D (BEFORE ?X_J)))
			(!W3 (?X_D (BEFORE ?X_L)))
			(!W4 (?X_D (BEFORE ?X_P)))
			(!W5 (?X_G (BEFORE ?X_J)))
			(!W6 (?X_G (BEFORE ?X_L)))
			(!W7 (?X_G (BEFORE ?X_P)))
			(!W8 (?X_J (BEFORE ?X_L)))
			(!W9 (?X_J (BEFORE ?X_P)))
			(!W10 (?X_L (BEFORE ?X_P)))
		)
	)
	(
			"X_A is at a jewelry store."
			"A agent wants buying a new watch."
			"A agent likes a rose gold watch a most."
			"A agent wears a rose gold watch home."
			"A agent buys a rose gold watch."
	)
)



(
	(EPI-SCHEMA ((?X_G COMPOSITE-SCHEMA-42.PR ?X_A ?X_D (KA SIT.V) ?X_H (KA HELP.V))
	             ** ?E)
		(:ROLES
			(!R1 (?X_A DAY.N))
			(!R2 (NOT (?X_D (DID.AUX SIT.V))))
			(!R3 (?X_G NEW.A))
			(!R4 (?X_G TEACHER.N))
			(!R5 (?X_H PRINCIPAL.N))
		)
		(:STEPS
			(?X_C (?X_G (START.V ?X_A)))
			(?X_F (?X_G (ASK.V ?X_D (KA SIT.V))))
			(?X_J (?X_G (ASK.V ?X_H (KA HELP.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_F)))
			(!W2 (?X_C (BEFORE ?X_J)))
			(!W3 (?X_F (BEFORE ?X_J)))
		)
	)
	(
			"A new teacher starts a day."
			"A new teacher asks X_D sitting."
			"A new teacher asks a principal helping."
	)
)



(
	(EPI-SCHEMA ((?X_C GET.12.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_B PLACE.N))
			(!R6 (?X_B HOUSE.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?X_D)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_D (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_W COMPOSITE-SCHEMA-43.PR
	              (KA (OVER.PRT ((ADV-A (IN.P (THREE.D (PLUR HOUR.N)))) COME.V)))
	              ?X_P ?X_V ?X_B)
	             ** ?E)
		(:ROLES
			(!R1 (?X_E (RIGHT-AFTER ?X_F)))
			(!R2 (?X_G GOOD.A))
			(!R3 (?X_G TIME.N))
			(!R4 (?X_J (RIGHT-AFTER ?X_K)))
			(!R5 (?X_N (RIGHT-AFTER ?X_O)))
			(!R6 (?X_P MESS.N))
			(!R7 (?X_V PLACE.N))
			(!R8 (?X_V HOUSE.N))
			(!R9 (?X_S AGENT.N))
			(!R10 (?X_V (PERTAIN-TO ?X_W)))
		)
		(:STEPS
			(?X_R
	   (?X_S
	    (WANT.V (KA (OVER.PRT ((ADV-A (IN.P (THREE.D (PLUR HOUR.N)))) COME.V))))))
			(?X_N (?X_V (BE.V ?X_P)))
			(?X_M (?X_V (BE.V ?X_P)))
			(?X_J (?X_W (CLEAN.V ?X_V)))
			(?X_I (?X_W (CLEAN.V ?X_V)))
			(?X_E (?X_A ?X_G ((ADV-A (AT.P ?X_V)) HAVE.V)))
			(?X_D (?X_A ?X_G ((ADV-A (AT.P ?X_V)) HAVE.V)))
			(?X_U (?X_W GET.12.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_R BEFORE ?X_N))
			(!W2 (?X_N BEFORE ?X_M))
			(!W3 (?X_M BEFORE ?X_J))
			(!W4 (?X_J BEFORE ?X_I))
			(!W5 (?X_I BEFORE ?X_E))
			(!W6 (?X_E BEFORE ?X_D))
			(!W7 (?X_D BEFORE ?X_U))
		)
	)
	(
			"A agent wants over in three hours coming."
			"A place house of X_W is a mess."
			"A place house of X_W is a mess."
			"X_W cleans a place house of X_W."
			"X_W cleans a place house of X_W."
			"X_A has at a place house of X_W."
			"X_A has at a place house of X_W."
			"X_W get.95s X_B."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (TO.P (K CHURCH.N)))
	               ((ADV-A (TO.P (K CHURCH.N)))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (FOR.P (K CHURCH.N))) GO.4.V))))
	              (K CHURCH.N))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K CHURCH.N) LOCATION.N))
			(!R4 (NOT (?L1 = (K CHURCH.N))))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (K CHURCH.N))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K CHURCH.N)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K CHURCH.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_D (AFTER ?X_C)))
			(!W7 (?X_D (AT-ABOUT ?X_E)))
			(!W8 (?X_F (AT-ABOUT ?X_E)))
			(!W9 (?X_F (AFTER ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (TO.P (K CHURCH.N)))
	               ((ADV-A (TO.P (K CHURCH.N)))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (FOR.P (K CHURCH.N))) GO.4.V))))
	              (K CHURCH.N))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K CHURCH.N) LOCATION.N))
			(!R4 (NOT (?L1 = (K CHURCH.N))))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (K CHURCH.N))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K CHURCH.N)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K CHURCH.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_D (AFTER ?X_C)))
			(!W7 (?X_D (AT-ABOUT ?X_E)))
			(!W8 (?X_F (AT-ABOUT ?X_E)))
			(!W9 (?X_F (AFTER ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C COMPOSITE-SCHEMA-44.PR ?X_Q ?X_K (K CHURCH.N)) ** ?E)
		(:ROLES
			(!R1 (?X_K UMBRELLA.N))
			(!R2 (?X_K (OF.P (K PAPER.N))))
			(!R3 (?X_J (OF.P ?X_K)))
			(!R4 (?X_K (IS.V ?X_L)))
			(!R5 (?X_Q PARASOL.N))
			(!R6 (?X_Q BLACK.A))
			(!R7 (?X_Q SMALL.A))
			(!R8 (?X_Q (OF.P (K SILK.N))))
		)
		(:STEPS
			(?X_I (?X_A (CARRY.V ?X_K)))
			(?X_G (?X_K ((ADV-A (FROM.P ?X_B)) COME.V)))
			(?X_D
	   (?X_C
	    ((ADV-A (TO.P (K CHURCH.N)))
	     ((ADV-A (TO.P (K CHURCH.N)))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P (K CHURCH.N))) GO.4.V))))
	    (K CHURCH.N)))
			(?X_N (?X_C (CARRY.V ?X_Q)))
			(?X_E
	   (?X_C
	    ((ADV-A (TO.P (K CHURCH.N)))
	     ((ADV-A (TO.P (K CHURCH.N)))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P (K CHURCH.N))) GO.4.V))))
	    (K CHURCH.N)))
			(?X_P (?X_C (CARRY.V ?X_Q)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_N)))
			(!W2 (?X_E (BEFORE ?X_P)))
			(!W3 (?X_I BEFORE ?X_G))
		)
	)
	(
			"X_A carries a umbrella of paper is X_L."
			"A umbrella of paper is X_L comes from X_B."
			"X_C go.105s church to church to church from L1 for church."
			"X_C carries a parasol black small of silk."
			"X_C go.105s church to church to church from L1 for church."
			"X_C carries a parasol black small of silk."
	)
)



(
	(EPI-SCHEMA ((?X_E TAKE.8.V ?X_F) ** ?X_G)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_F INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_E = ?X_F)))
			(!R5 (?X_A (PLUR FIELD.N)))
			(!R6 (?X_C RED.A))
			(!R7 (?X_C (PERTAIN-TO ?X_E)))
			(!R8 (?X_C WAGON.N))
			(!R9 (?X_D LITTLE.A))
			(!R10 (?X_D (HAS.V ?X_C)))
			(!R11 (?X_D BOY.N))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (?X_E (HAVE.V ?X_F))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_E HAVE.V ?X_F)))
			(?I2 (?X_E (AT.P ?L)))
			(?I3 (?X_F (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_E HAVE.V ?X_F))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_G))
			(!W2 (?I1 PRECOND-OF ?X_G))
			(!W3 (?I2 PRECOND-OF ?X_G))
			(!W4 (?I3 PRECOND-OF ?X_G))
			(!W5 (?P1 POSTCOND-OF ?X_G))
			(!W6 (?X_G (AFTER ?X_H)))
			(!W7 (?X_H (AT-ABOUT ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E TAKE.9.V ?X_F) ** ?X_G)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_F INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_E = ?X_F)))
			(!R5 (?X_A (PLUR FIELD.N)))
			(!R6 (?X_D (PERTAIN-TO ?X_E)))
			(!R7 (?X_D RED.A))
			(!R8 (?X_D WAGON.N))
			(!R9 (?X_C LITTLE.A))
			(!R10 (?X_C BOY.N))
			(!R11 (?X_C (HAS.V ?X_D)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (?X_E (HAVE.V ?X_F))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_E HAVE.V ?X_F)))
			(?I2 (?X_E (AT.P ?L)))
			(?I3 (?X_F (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_E HAVE.V ?X_F))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_G))
			(!W2 (?I1 PRECOND-OF ?X_G))
			(!W3 (?I2 PRECOND-OF ?X_G))
			(!W4 (?I3 PRECOND-OF ?X_G))
			(!W5 (?P1 POSTCOND-OF ?X_G))
			(!W6 (?X_G (AFTER ?X_H)))
			(!W7 (?X_H (AT-ABOUT ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_G COMPOSITE-SCHEMA-45.PR
	              (K
	               (L X
	                (AND (X LITTLE.A) (X MAY.N) (X ((ADV-A (IN.P ?X_I)) RIDE.V)))))
	              ?X_E ?X_B)
	             ** ?E)
		(:ROLES
			(!R1 (?X_E GOOD.A))
			(!R2 (?X_E RIDE.N))
			(!R3 (?X_F (PLUR FIELD.N)))
			(!R4 (?X_G AGENT.N))
			(!R5 (?X_I RED.A))
			(!R6 (?X_I WAGON.N))
			(!R7 (?X_I (PERTAIN-TO ?X_G)))
			(!R8 (?X_H LITTLE.A))
			(!R9 (?X_H BOY.N))
			(!R10 (?X_H (HAS.V ?X_I)))
		)
		(:STEPS
			(E202.SK
	   (?X_H
	    (LET.V
	     (K (L X (AND (X LITTLE.A) (X MAY.N) (X ((ADV-A (IN.P ?X_I)) RIDE.V))))))))
			(?X_D (?X_B (MAY.AUX (HAVE.V ?X_E))))
			(E203.SK (?X_G TAKE.8.V ?X_B))
			(E203.SK (?X_G TAKE.9.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (E202.SK BEFORE ?X_D))
			(!W2 (?X_D BEFORE E203.SK))
		)
	)
	(
			"A little boy has a red wagon of a agent lets little may riding."
			"X_B has a good ride may."
			"A agent take.114s X_B."
			"A agent take.117s X_B."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (INTO.P ?X_A))
	               (ALMOST.ADV
	                ((ADV-A (TO.P ?L2))
	                 ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.4.V)))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PERTAIN-TO ?X_C)))
			(!R6 (?X_A FRIEND.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (INTO.P ?X_B))
	               (ALMOST.ADV
	                ((ADV-A (TO.P ?L2))
	                 ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.5.V)))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B FRIEND.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D
	              ((ADV-A (THROUGH.P ?X_A))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) COME.2.V))))
	              ?L2)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (AT.P (K WORK.N))))
			(!R6 (?X_A DOOR.N))
			(!R7 (?X_C FRIEND.N))
			(!R8 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J COMPOSITE-SCHEMA-46.PR ?X_C ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_C PIECE.N))
			(!R2 (?X_C TWO.N))
			(!R3 (?X_C PURPLE.A))
			(!R4 (?X_I FRIEND.N))
			(!R5 (?X_H DOOR.N))
			(!R6 (?X_H (AT.P (K WORK.N))))
			(!R7 (?X_J AGENT.N))
			(!R8 (?X_I (PERTAIN-TO ?X_J)))
		)
		(:STEPS
			(?X_B (?X_I (WEAR.V ?X_C)))
			(?X_G
	   (?X_J
	    ((ADV-A (THROUGH.P ?X_H))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) COME.2.V))))
	    ?L2))
			(?X_E
	   (?X_J
	    ((ADV-A (INTO.P ?X_I))
	     (ALMOST.ADV
	      ((ADV-A (TO.P ?L2))
	       ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.4.V)))))
	    ?L2))
			(?X_E
	   (?X_J
	    ((ADV-A (INTO.P ?X_I))
	     (ALMOST.ADV
	      ((ADV-A (TO.P ?L2))
	       ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.5.V)))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
		)
	)
	(
			"A friend of a agent wears a piece two purple."
			"A agent come.142s L2 through a door at work to L2 from L1 for L2."
			"A agent run.140s L2 into a friend of a agent almost to L2 from L1 for L2."
			"A agent run.141s L2 into a friend of a agent almost to L2 from L1 for L2."
	)
)



(
	(EPI-SCHEMA ((?X_F COMPOSITE-SCHEMA-47.PR ?X_A ?X_G) ** ?E)
		(:ROLES
			(!R1 (?X_A PHONE.N))
			(!R2 (?X_F WOMAN.N))
			(!R3 (NOT (?X_G (DID.AUX ANSWER.V))))
			(!R4 (?X_G MAN.N))
		)
		(:STEPS
			(?X_C (?X_G ((UP.PRT HANG.V) ?X_A)))
			(?X_E (?X_F (WHY.ADV WONDER.V)))
			(?X_I (?X_F ((BACK.ADV CALL.V) ?X_G)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_I)))
			(!W3 (?X_E (BEFORE ?X_I)))
		)
	)
	(
			"A man hangs a phone up."
			"A woman wonders why."
			"A woman calls a man back."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (TO.P ?X_C))
	               ((ADV-A (TO.P ?X_C))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_C)) GO.5.V))))
	              ?X_C)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C LOCATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C TODAY.N))
			(!R6 (?X_C STORE.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?X_C))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-48.PR ?X_E (SIX.D (PLUR DOLLAR.N)) ?X_H) ** ?E)
		(:ROLES
			(!R1 (?X_E (PLUR CHIP.N)))
			(!R2 (?X_H STORE.N))
			(!R3 (?X_H TODAY.N))
			(!R4 (?X_I AGENT.N))
		)
		(:STEPS
			(?X_D (?X_I (SEE.V ?X_E)))
			(?X_B (?X_E (BE.V (SIX.D (PLUR DOLLAR.N)))))
			(?X_G
	   (?X_I
	    ((ADV-A (TO.P ?X_H))
	     ((ADV-A (TO.P ?X_H))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_H)) GO.5.V))))
	    ?X_H))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D BEFORE ?X_B))
			(!W2 (?X_B BEFORE ?X_G))
		)
	)
	(
			"A agent sees a chips."
			"A chips are six dollars."
			"A agent go.178s a store today to a store today to a store today from L1 for a store today."
	)
)



(
	(EPI-SCHEMA ((?X_B FIND.6.V ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_C BIRD.N))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_B ((ADV-A (FOR.P ?X_C)) SEARCH.V)))
			(?I4 (NOT (?X_B (KNOW.V (THAT (?X_C (AT.P ?L)))))))
			(?I5 (NOT (?X_B (HAVE.V ?X_C))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V (THAT (?X_C (AT.P ?L))))))
			(?P2 (?X_B (HAVE.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I3 BEFORE ?X_E))
			(!W2 (?X_E (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?I3) = ?X_E))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (FOR.P ?L2))
	               ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) SURVIVE.1.V)))
	              ?L2)
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B BIRD.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-49.PR ?X_N ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_K SHOE.N))
			(!R2 (?X_K BOX.N))
			(!R3 (?X_N BIRD.N))
		)
		(:STEPS
			(?X_J (?X_B (((ADV-A (IN.P ?X_K)) PUT.V) ?X_N)))
			(?X_H (?X_B (FED.V ?X_N)))
			(?X_D (?X_B (((ADV-A (IN.P ?X_A)) KEEP.V) ?X_N)))
			(?X_M (?X_B FIND.6.V ?X_N))
			(?X_F
	   (?X_N
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) SURVIVE.1.V)))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_F)))
			(!W2 (?X_J BEFORE ?X_H))
			(!W3 (?X_H BEFORE ?X_D))
		)
	)
	(
			"X_B puts a bird in a shoe box."
			"X_B fed a bird."
			"X_B keeps a bird in X_A."
			"X_B find.182s a bird."
			"A bird survive.183s L2 for L2 from L1 to L2."
	)
)



(
	(EPI-SCHEMA ((?X_C MAKE.6.V
	              (KE (?X_D ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2
	   ((KE (?X_D ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N)))
	    INANIMATE_OBJECT.N))
			(!R3 (?X_D WIFE.N))
			(!R4 (?X_D (PERTAIN-TO ?X_C)))
			(!R5 (?X_E (RIGHT-AFTER ?X_A)))
		)
		(:GOALS
			(?G1
	   (?X_C
	    (WANT.V
	     (THAT
	      ((KE (?X_D ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))) EXIST.V)))))
			(?G2
	   (?X_C
	    (WANT.V
	     (KA
	      (HAVE.V (KE (?X_D ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))))))))
		)
		(:PRECONDS
			(?I1
	   (NOT ((KE (?X_D ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))) EXIST.V)))
		)
		(:POSTCONDS
			(?P1 ((KE (?X_D ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))) EXIST.V))
			(?P2
	   (?X_C (HAVE.V (KE (?X_D ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (SAME-TIME ?X_G)))
			(!W2 (?X_F (BEFORE ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N COMPOSITE-SCHEMA-50.PR ?X_K (K (PLUR GROCERY.N))
	              (KE (?X_M ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M WIFE.N))
			(!R2 (?X_K BAG.N))
			(!R3 (?X_L GROUND.N))
			(!R4 (?X_N MAN.N))
			(!R5 (?X_M (PERTAIN-TO ?X_N)))
			(!R6 (?X_O (RIGHT-AFTER ?X_P)))
		)
		(:STEPS
			(?X_J (?X_N (((ADV-A (ON.P ?X_L)) FIND.V) ?X_K)))
			(?X_H (?X_N (INSIDE.ADV LOOK.V)))
			(?X_F (?X_K (BE.V (K (PLUR GROCERY.N)))))
			(?X_D (?X_N ((HOME.ADV BRING.V) (K (PLUR GROCERY.N)))))
			(?X_B (?X_M ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N)))
			(?X_O
	   (?X_N MAKE.6.V
	    (KE (?X_M ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_F)))
			(!W3 (?X_J (BEFORE ?X_D)))
			(!W4 (?X_H (BEFORE ?X_F)))
			(!W5 (?X_H (BEFORE ?X_D)))
			(!W6 (?X_F (BEFORE ?X_D)))
			(!W7 (?X_B (BEFORE ?X_O)))
		)
	)
	(
			"A man finds a bag on a ground."
			"A man looks inside."
			"A bag is grocerys."
			"A man brings grocerys home."
			"A wife of a man is with grocerys dinner."
			"A man make.184s a wife of a man with grocerys dinner."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-51.PR (K BRIGHT.A) ?X_G) ** ?E)
		(:ROLES
			(!R1 (?X_A SUN.N))
			(!R2 (?X_K AGENT.N))
			(!R3 (?X_F (PERTAIN-TO ?X_K)))
			(!R4 (?X_G KITE.N))
			(!R5 (?X_G (PERTAIN-TO ?X_K)))
			(!R6 (?X_J DOG.N))
			(!R7 (?X_J (PERTAIN-TO ?X_K)))
			(!R8 (?X_L CART.N))
		)
		(:STEPS
			(?X_C (?X_A (SHINE.V (K BRIGHT.A))))
			(?X_E (?X_G (HIGH.ADV FLY.V)))
			(?X_I (?X_K (CAN.AUX (JUST.ADV (SEE.V ?X_G)))))
			(?X_N (?X_J ((ADV-A (UNDER.P ?X_L)) BE.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_I)))
			(!W3 (?X_C (BEFORE ?X_N)))
			(!W4 (?X_E (BEFORE ?X_I)))
			(!W5 (?X_E (BEFORE ?X_N)))
			(!W6 (?X_I (BEFORE ?X_N)))
		)
	)
	(
			"A sun shines bright."
			"A kite of a agent flies high."
			"A agent sees a kite of a agent can just."
			"A dog of a agent is under a cart."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-52.PR (TWO.D (PLUR DOG.N))) ** ?E)
		(:STEPS
			(?X_C (?X_A (HAVE.V (TWO.D (PLUR DOG.N)))))
		)
	)
	(
			"X_A has two dogs."
	)
)



(
	(EPI-SCHEMA ((YESTERDAY.ADV-E
	              (?X_C
	               ((ADV-A (TO.P ?X_D))
	                ((ADV-A (TO.P ?X_D))
	                 ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_D)) GO.6.V))))
	               ?X_D))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D LOCATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D POND.N))
			(!R6 (?X_D LOCAL.A))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
			(!R8 (?X_B (PLUR FRIEND.N)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?X_D)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?X_D))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D
	              ((ADV-A (WITH.P ?X_B))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.7.V))))
	              ?L2)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B (PERTAIN-TO ?X_D)))
			(!R6 (?X_B (PLUR FRIEND.N)))
			(!R7 (?X_F (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (BEFORE ?X_G)))
			(!W7 (?X_F (SAME-TIME ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D
	              ((ADV-A (WITH.P ?X_A))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.8.V))))
	              ?L2)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PLUR FRIEND.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_D)))
			(!R7 (?X_F (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (BEFORE ?X_G)))
			(!W7 (?X_F (SAME-TIME ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N COMPOSITE-SCHEMA-53.PR (K FISHING.N)
	              (KA ((ADV-A (WITH.P ?X_M)) GO.V)) ?X_E ?X_H ?L2)
	             ** ?E)
		(:ROLES
			(!R1 (?X_E LARGE.A))
			(!R2 (?X_E FISH.N))
			(!R3 (?X_H POND.N))
			(!R4 (?X_H LOCAL.A))
			(!R5 (?X_M (PLUR FRIEND.N)))
			(!R6 (?X_M (PERTAIN-TO ?X_N)))
			(!R7 (?X_O (RIGHT-AFTER ?X_P)))
		)
		(:STEPS
			(?X_L (?X_N (LOVE.V (K FISHING.N))))
			(?X_D (?X_N (CATCH.V ?X_E)))
			(?X_B (?X_N (((ADV-A (FOR.P (KA (EAT.V ?X_E)))) (BACK.PRT BRING.V)) ?X_E)))
			(?X_J
	   (?X_N
	    ((ADV-A (WITH.P ?X_M))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.7.V))))
	    ?L2))
			(?X_J
	   (?X_N
	    ((ADV-A (WITH.P ?X_M))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.8.V))))
	    ?L2))
			(?X_O (?X_N (LOVE.V (KA ((ADV-A (WITH.P ?X_M)) GO.V)))))
			(?X_G
	   (YESTERDAY.ADV-E
	    (?X_N
	     ((ADV-A (TO.P ?X_H))
	      ((ADV-A (TO.P ?X_H))
	       ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_H)) GO.6.V))))
	     ?X_H)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_O)))
			(!W2 (?X_J (BEFORE ?X_G)))
			(!W3 (?X_O (BEFORE ?X_G)))
			(!W4 (?X_L BEFORE ?X_D))
			(!W5 (?X_D BEFORE ?X_B))
		)
	)
	(
			"X_N loves fishing."
			"X_N catches a large fish."
			"X_N brings a large fish for eating a large fish back."
			"X_N go.253s L2 with a friends of X_N to L2 from L1 for L2."
			"X_N go.255s L2 with a friends of X_N to L2 from L1 for L2."
			"X_N loves with a friends of X_N going."
			"X_N go.250s a pond local yesterday to a pond local to a pond local from L1 for a pond local."
	)
)



(
	(EPI-SCHEMA ((?X_R COMPOSITE-SCHEMA-54.PR ?X_D (KE (?X_R (HEAR.V ?X_D))) ?X_Q ?X_R
	              (KA (UP.PRT LOCK.V) ?X_N) (KE (?X_R (MORE.ADV AFRAID.A))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D NOISE.N))
			(!R2 (?X_G (RIGHT-AFTER ?X_H)))
			(!R3 (?X_K (RIGHT-AFTER ?X_L)))
			(!R4 (?X_Q MOM.N))
			(!R5 (?X_Q (PERTAIN-TO ?X_M)))
			(!R6 (?X_N HOUSE.N))
			(!R7 (?X_R BOY.N))
			(!R8 (?X_Q (PERTAIN-TO ?X_R)))
		)
		(:STEPS
			(?X_C (?X_R (HEAR.V ?X_D)))
			(?X_F (?X_R (THINK.V (KE (?X_R (HEAR.V ?X_D))))))
			(?X_G (?X_R (CALL.V ?X_Q)))
			(?X_J (?X_R (CALL.V ?X_Q)))
			(?X_K (?X_Q (TELL.V ?X_R (KA (UP.PRT LOCK.V) ?X_N))))
			(?X_P (?X_Q (TELL.V ?X_R (KA (UP.PRT LOCK.V) ?X_N))))
			(?X_T (?X_A (MAKE.V (KE (?X_R (MORE.ADV AFRAID.A))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_F)))
			(!W2 (?X_C (BEFORE ?X_G)))
			(!W3 (?X_C (BEFORE ?X_J)))
			(!W4 (?X_C (BEFORE ?X_K)))
			(!W5 (?X_C (BEFORE ?X_P)))
			(!W6 (?X_C (BEFORE ?X_T)))
			(!W7 (?X_F (BEFORE ?X_G)))
			(!W8 (?X_F (BEFORE ?X_J)))
			(!W9 (?X_F (BEFORE ?X_K)))
			(!W10 (?X_F (BEFORE ?X_P)))
			(!W11 (?X_F (BEFORE ?X_T)))
			(!W12 (?X_G (BEFORE ?X_J)))
			(!W13 (?X_G (BEFORE ?X_K)))
			(!W14 (?X_G (BEFORE ?X_P)))
			(!W15 (?X_G (BEFORE ?X_T)))
			(!W16 (?X_J (BEFORE ?X_K)))
			(!W17 (?X_J (BEFORE ?X_P)))
			(!W18 (?X_J (BEFORE ?X_T)))
			(!W19 (?X_K (BEFORE ?X_P)))
			(!W20 (?X_K (BEFORE ?X_T)))
			(!W21 (?X_P (BEFORE ?X_T)))
		)
	)
	(
			"A boy hears a noise."
			"A boy thinks a boy hears a noise."
			"A boy calls a mom of X_M of a boy."
			"A boy calls a mom of X_M of a boy."
			"A mom of X_M of a boy tells a boy up lock a house."
			"A mom of X_M of a boy tells a boy up lock a house."
			"X_A makes a boy more afraid."
	)
)



(
	(EPI-SCHEMA ((?X_B FIND.7.V (KE (?X_C TURTLE.V))) ** ?X_F)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_C BABY.N))
			(!R4 (?X_C COUPLE.N))
			(!R5 (?X_C (SO.ADV TINY.A)))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L)))
			(?I2 ((KE (?X_C TURTLE.V)) (AT.P ?L)))
			(?I3 (?X_B ((ADV-A (FOR.P (KE (?X_C TURTLE.V)))) SEARCH.V)))
			(?I4 (NOT (?X_B (KNOW.V (THAT ((KE (?X_C TURTLE.V)) (AT.P ?L)))))))
			(?I5 (NOT (?X_B (HAVE.V (KE (?X_C TURTLE.V))))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V (THAT ((KE (?X_C TURTLE.V)) (AT.P ?L))))))
			(?P2 (?X_B (HAVE.V (KE (?X_C TURTLE.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I3 BEFORE ?X_F))
			(!W2 (?X_F (BEFORE ?X_E)))
			(!W3 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?I3) = ?X_F))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-55.PR ?X_L (KE (?X_L TURTLE.V))) ** ?E)
		(:ROLES
			(!R1 (?X_C HOUR.N))
			(!R2 (?X_F BOX.N))
			(!R3 (?X_I AGENT.N))
			(!R4 (?X_L COUPLE.N))
			(!R5 (?X_L BABY.N))
			(!R6 (?X_L (SO.ADV TINY.A)))
		)
		(:STEPS
			(?X_E (?X_I (((ADV-A (IN.P ?X_F)) PUT.V) ?X_L)))
			(?X_B (?X_I (((ADV-A (FOR.P ?X_C)) KEEP.V) ?X_L)))
			(?X_H (?X_I FIND.7.V (KE (?X_L TURTLE.V))))
			(?X_K (?X_L TURTLE.V))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_B)))
			(!W2 (?X_H BEFORE ?X_K))
		)
	)
	(
			"A agent puts a couple baby so tiny in a box."
			"A agent keeps a couple baby so tiny for a hour."
			"A agent find.270s a couple baby so tiny turtles."
			"A couple baby so tiny turtles."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-56.PR (KA LEAVE.V)) ** ?E)
		(:ROLES
			(!R1 (?X_A COUPLE.N))
			(!R2 (?X_B SHOW.N))
			(!R3 (?X_E GIRL.N))
			(!R4 (?X_H BOY.N))
		)
		(:STEPS
			(?X_D (?X_A ((ADV-A (TO.P ?X_B)) GO.V)))
			(?X_G (?X_E (ASK.V (KA LEAVE.V))))
			(?X_J (?X_H REFUSE.V))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_G)))
			(!W2 (?X_D (BEFORE ?X_J)))
			(!W3 (?X_G (BEFORE ?X_J)))
		)
	)
	(
			"A couple goes to a show."
			"A girl asks leaving."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (OF.P IT89.SK)) (OFF.PRT BUILD.1.V)) ?O) ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?X_B GUITAR.N))
			(!R4 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?O EXIST.V)))))
			(?G2 (?X_C (WANT.V (KA (HAVE.V ?O)))))
		)
		(:PRECONDS
			(?I1 (NOT (?O EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?O EXIST.V))
			(?P2 (?X_C (HAVE.V ?O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C WRITE.1.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?X_D SONG.N))
			(!R4 (?X_D (PRETTY.ADV GOOD.A)))
			(!R5 (?X_B GUITAR.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D EXIST.V)))))
			(?G2 (?X_C (WANT.V (KA (HAVE.V ?X_D)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_D EXIST.V))
			(?P2 (?X_C (HAVE.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C PLAY.9.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?X_D (PERTAIN-TO ?X_C)))
			(!R4 (?X_D GUITAR.N))
			(!R5 (?X_F (RIGHT-AFTER ?X_B)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D EXIST.V)))))
			(?G2 (?X_C (WANT.V (KA (HAVE.V ?X_D)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_D EXIST.V))
			(?P2 (?X_C (HAVE.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_G)))
			(!W2 (?X_F (SAME-TIME ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (WITH.P ?T)) PLAY.10.V) ?X_B) ** ?X_E)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 (?X_B GAME.N))
			(!R5 (NOT (?X_B AGENT.N)))
			(!R6 (?X_B (PERTAIN-TO ?X_D)))
			(!R7 (?X_B GUITAR.N))
			(!R8 (?X_F (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_D HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_D EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_E (BEFORE ?X_G)))
			(!W3 (?X_F (SAME-TIME ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R5 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D (DOWN.PRT ((ADV-A (WITH.P ?T)) PLAY.11.V)) ?X_A) ** ?X_E)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 (?X_A GAME.N))
			(!R5 (NOT (?X_A AGENT.N)))
			(!R6 (?X_C (PERTAIN-TO ?X_D)))
			(!R7 (?X_C GUITAR.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_D HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_D EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R5 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (WITH.P ?T)) PLAY.12.V) ?X_A) ** ?X_E)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 (?X_A GAME.N))
			(!R5 (NOT (?X_A AGENT.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_D)))
			(!R7 (?X_A GUITAR.N))
			(!R8 (?X_E (RIGHT-AFTER ?X_B)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_D HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_D EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_E (SAME-TIME ?X_G)))
			(!W3 (?X_F (BEFORE ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R5 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O COMPOSITE-SCHEMA-57.PR ?X_A ?O ?X_E ?X_B ?X_N) ** ?E)
		(:ROLES
			(!R1 (?X_E (PRETTY.ADV GOOD.A)))
			(!R2 (?X_E SONG.N))
			(!R3 (?X_N GUITAR.N))
			(!R4 (?X_O MAN.N))
			(!R5 (?X_N (PERTAIN-TO ?X_O)))
			(!R6 (?X_P (RIGHT-AFTER ?X_Q)))
		)
		(:STEPS
			(?X_K (?X_O (FIND.V ?X_A)))
			(E79.SK (?X_A THING.N))
			(?X_M (?X_O PLAY.9.V ?X_N))
			(?X_M (?X_O ((ADV-A (WITH.P ?T)) PLAY.10.V) ?X_N))
			(?X_P (?X_O ((ADV-A (WITH.P ?T)) PLAY.12.V) ?X_N))
			(?X_I (?X_O (DOWN.PRT ((ADV-A (WITH.P ?T)) PLAY.11.V)) ?X_B))
			(?X_G (?X_O ((ADV-A (OF.P ?X_B)) (OFF.PRT BUILD.1.V)) ?O))
			(?X_D (?X_O WRITE.1.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_P)))
			(!W2 (?X_M (BEFORE ?X_I)))
			(!W3 (?X_M (BEFORE ?X_G)))
			(!W4 (?X_M (BEFORE ?X_D)))
			(!W5 (?X_P (BEFORE ?X_I)))
			(!W6 (?X_P (BEFORE ?X_G)))
			(!W7 (?X_P (BEFORE ?X_D)))
			(!W8 (?X_I (BEFORE ?X_G)))
			(!W9 (?X_I (BEFORE ?X_D)))
			(!W10 (?X_G (BEFORE ?X_D)))
			(!W11 (?X_K BEFORE E79.SK))
		)
	)
	(
			"A man finds X_A."
			"X_A is thing."
			"A man play.4s a guitar of a man."
			"A man play.8s a guitar of a man with T."
			"A man play.10s a guitar of a man with T."
			"A man play.9s X_B down with T."
			"A man build.1s O of X_B off."
			"A man write.2s a pretty good song."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (TO.P ?X_B)) TAKE.10.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D CAT.N))
			(!R6 (?X_B VET.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?X_D)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_D (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B TAKE.11.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B CAT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C MEDICINE.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B GET.13.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C MEDICINE.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-58.PR) ** ?E)
		(:ROLES
			(!R1 (?X_A (PLUR GIRL.N)))
			(!R2 (?X_B (GLAD.A (KA (SEE.V ?X_A)))))
			(!R3 (?X_B BABY.N))
			(!R4 (?X_C (IMPINGES-ON ?X_D)))
		)
		(:STEPS
			(?X_C
	   (?X_A (KA HAVE.V)
	    ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_B)) PLAY.V)))) |4.2.2.V|)))
		)
	)
	(
			"A girls 4.2.2 for with a glad seeing a girls baby playing."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A
	                (ON.P (K (L X (AND (X TOP.N) (X (OF.P (THE.D BOAT.N))))))))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) CLIMB.1.V))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B BOAT.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D
	              ((ADV-A (DOWN.P ?X_A))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) FLOAT.1.V))))
	              ?L2)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A RIVER.N))
			(!R6 (?X_C (PERTAIN-TO ?X_D)))
			(!R7 (?X_C BOAT.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_P COMPOSITE-SCHEMA-59.PR ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_J (RIGHT-AFTER ?X_K)))
			(!R2 (?X_O BOAT.N))
			(!R3 (?X_N RIVER.N))
			(!R4 (?X_P MAN.N))
			(!R5 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_J (?X_O (OVER.PRT TIP.V)))
			(?X_I (?X_O (OVER.PRT TIP.V)))
			(?X_E (?X_P RESCUE.V))
			(?X_C (?X_P RESCUE.V))
			(?X_M
	   (?X_P
	    ((ADV-A (DOWN.P ?X_N))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) FLOAT.1.V))))
	    ?L2))
			(?X_G
	   (?X_P
	    ((ADV-A (ON.P (K (L X (AND (X TOP.N) (X (OF.P (THE.D BOAT.N))))))))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) CLIMB.1.V))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_G)))
			(!W2 (?X_J BEFORE ?X_I))
			(!W3 (?X_I BEFORE ?X_E))
			(!W4 (?X_E BEFORE ?X_C))
		)
	)
	(
			"A boat of a man tips over."
			"A boat of a man tips over."
			"A man rescues."
			"A man rescues."
			"A man float.54s L2 down a river to L2 from L1 for L2."
			"A man climb.52s L2 on top of to L2 from L1 for L2."
	)
)



(
	(EPI-SCHEMA ((?X_K COMPOSITE-SCHEMA-60.PR ?X_M ?X_K (KA (UP.PRT CLEAN.V) ?X_M)) **
	             ?E)
		(:ROLES
			(!R1 (?X_A BAD.A))
			(!R2 (?X_A MOOD.N))
			(!R3 (?X_F GROUND.N))
			(!R4 (?X_L AGENT.N))
			(!R5 (?X_K BROTHER.N))
			(!R6 (?X_K (PERTAIN-TO ?X_L)))
			(!R7 (?X_M CAN.N))
			(!R8 (?X_M (OF.P (K PAINT.N))))
		)
		(:STEPS
			(?X_C (?X_K ((ADV-A (IN.P ?X_A)) BE.V)))
			(?X_E (?X_K (OPEN.V ?X_M)))
			(?X_H (?X_K (((ADV-A (ON.P ?X_F)) SPLASH.V) ?X_M)))
			(?X_J (?X_L (TELL.V ?X_K (KA (UP.PRT CLEAN.V) ?X_M))))
			(?X_O (?X_K ((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_M))) REFUSE.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_H)))
			(!W3 (?X_C (BEFORE ?X_J)))
			(!W4 (?X_C (BEFORE ?X_O)))
			(!W5 (?X_E (BEFORE ?X_H)))
			(!W6 (?X_E (BEFORE ?X_J)))
			(!W7 (?X_E (BEFORE ?X_O)))
			(!W8 (?X_H (BEFORE ?X_J)))
			(!W9 (?X_H (BEFORE ?X_O)))
			(!W10 (?X_J (BEFORE ?X_O)))
		)
	)
	(
			"A brother of a agent is in a bad mood."
			"A brother of a agent opens a can of paint."
			"A brother of a agent splashes a can of paint on a ground."
			"A agent tells a brother of a agent up clean a can of paint."
			"A brother of a agent refuses for up clean a can of paint."
	)
)



(
	(EPI-SCHEMA ((?X_G COMPOSITE-SCHEMA-61.PR (KA (PLAY.V (K BASEBALL.N))) ?X_J ?X_K)
	             ** ?E)
		(:ROLES
			(!R1 (?X_J BIG.A))
			(!R2 (?X_J GAME.N))
			(!R3 (?X_G (ABLE.A (KA (L X (AND (X (MAKE.V ?X_H)) (X (WIN.V ?X_J))))))))
			(!R4 (?X_K LONG.A))
			(!R5 (?X_K DRIVE.N))
		)
		(:STEPS
			(?X_B (?X_G (LOVE.V (KA (PLAY.V (K BASEBALL.N))))))
			(?X_D (?X_G (HAVE.V ?X_J)))
			(?X_F (?X_G ((ADV-A (FOR.P (KA HIT.V))) (UP.ADV BE.V))))
			(?X_M (?X_G (HIT.V ?X_K)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_D)))
			(!W2 (?X_B (BEFORE ?X_F)))
			(!W3 (?X_B (BEFORE ?X_M)))
			(!W4 (?X_D (BEFORE ?X_F)))
			(!W5 (?X_D (BEFORE ?X_M)))
			(!W6 (?X_F (BEFORE ?X_M)))
		)
	)
	(
			"A able make winning loves playing baseball."
			"A able make winning has a big game."
			"A able make winning is for hitting up."
			"A able make winning hits a long drive."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (OVER.PRT
	               (ALMOST.ADV
	                ((ADV-A (TO.P ?X_D))
	                 ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_D)) RUN.6.V)))))
	              ?X_D)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D LOCATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D FRIEND.N))
			(!R6 (?X_D (PERTAIN-TO ?X_C)))
			(!R7 (?X_B WAY.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?X_D)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?X_D))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_L COMPOSITE-SCHEMA-62.PR ?X_G ?X_K) ** ?E)
		(:ROLES
			(!R1 (?X_J WAY.N))
			(!R2 (?X_K FRIEND.N))
			(!R3 (?X_G WALKING.N))
			(!R4 (?X_G STACKER.N))
			(!R5 (?X_L AGENT.N))
			(!R6 (?X_J (PERTAIN-TO ?X_L)))
			(!R7 (?X_K (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(?X_I (?X_L ((ADV-A (AT.P (K WORK.N))) BE.V)))
			(?X_F (?X_L (USE.V ?X_G)))
			(?X_D (?X_K ((ADV-A (IN.P ?X_J)) STAND.V)))
			(?X_B
	   (?X_L
	    (OVER.PRT
	     (ALMOST.ADV
	      ((ADV-A (TO.P ?X_K))
	       ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_K)) RUN.6.V)))))
	    ?X_K))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I BEFORE ?X_F))
			(!W2 (?X_F BEFORE ?X_D))
			(!W3 (?X_D BEFORE ?X_B))
		)
	)
	(
			"A agent is at work."
			"A agent uses a walking stacker."
			"A friend of a agent stands in a way of a agent."
			"A agent run.90s a friend of a agent over almost to a friend of a agent from L1 for a friend of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_B (CAN.AUX MAKE.5.V)
	              (K (L X (AND (X GREEN.A) (X PAINT.N)))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((K (L X (AND (X GREEN.A) (X PAINT.N)))) INANIMATE_OBJECT.N))
			(!R3 (?X_B (HAS.V (NO.D (PLUR FLOWER.N)))))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT ((K (L X (AND (X GREEN.A) (X PAINT.N)))) EXIST.V)))))
			(?G2 (?X_B (WANT.V (KA (HAVE.V (K (L X (AND (X GREEN.A) (X PAINT.N)))))))))
		)
		(:PRECONDS
			(?I1 (NOT ((K (L X (AND (X GREEN.A) (X PAINT.N)))) EXIST.V)))
		)
		(:POSTCONDS
			(?P1 ((K (L X (AND (X GREEN.A) (X PAINT.N)))) EXIST.V))
			(?P2 (?X_B (HAVE.V (K (L X (AND (X GREEN.A) (X PAINT.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.4.V ?X_C
	              (KA ((CAN.AUX MAKE.V) (K (L X (AND (X GREEN.A) (X PAINT.N)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C AGENT.N))
			(!R3
	   ((KA ((CAN.AUX MAKE.V) (K (L X (AND (X GREEN.A) (X PAINT.N)))))) ACTION.N))
			(!R4 (?X_C (HAS.V (NO.D (PLUR FLOWER.N)))))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V ?X_C
	     (KA ((CAN.AUX MAKE.V) (K (L X (AND (X GREEN.A) (X PAINT.N)))))))))
			(?G2
	   (?X_B
	    (WANT.V
	     (THAT (?X_B (CAN.AUX MAKE.V) (K (L X (AND (X GREEN.A) (X PAINT.N)))))))))
		)
		(:STEPS
			(?E1
	   (?X_B
	    (ASK.V ?X_C
	     (KA ((CAN.AUX MAKE.V) (K (L X (AND (X GREEN.A) (X PAINT.N)))))))))
			(?X_E
	   (?X_C (CAN.AUX (CAN.AUX MAKE.V)) (K (L X (AND (X GREEN.A) (X PAINT.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?X_E))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-63.PR
	              (K
	               (L X
	                (AND (X BLUE.A)
	                     ((X PAINT.N) AND (X AND) (X YELLOW.A) (X PAINT.N)))))
	              (K (L X (AND (X GREEN.A) (X PAINT.N)))) ?X_J
	              (KA ((CAN.AUX MAKE.V) (K (L X (AND (X GREEN.A) (X PAINT.N)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D (PLUR LEAF.N)))
			(!R2 (?X_D GREEN.A))
			(!R3
	   ((KA ((CAN.AUX MAKE.V) (K (L X (AND (X GREEN.A) (X PAINT.N)))))) ACTION.N))
			(!R4 (?X_J AGENT.N))
			(!R5 (?X_J (HAS.V (NO.D (PLUR FLOWER.N)))))
			(!R6 (?X_K AGENT.N))
		)
		(:STEPS
			(?X_H (?X_A STEM.V))
			(?X_C
	   (?X_D
	    (CAN.AUX
	     (MIX.V
	      (K
	       (L X
	        (AND (X BLUE.A)
	             ((X PAINT.N) AND (X AND) (X YELLOW.A) (X PAINT.N)))))))))
			(?X_F (?X_J (CAN.AUX MAKE.5.V) (K (L X (AND (X GREEN.A) (X PAINT.N))))))
			(?E_1
	   (?X_K REQUEST_ACTION.4.V ?X_J
	    (KA ((CAN.AUX MAKE.V) (K (L X (AND (X GREEN.A) (X PAINT.N))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_C)))
			(!W2 (?X_H (BEFORE ?E_1)))
			(!W3 (?X_C (BEFORE ?E_1)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_B GET.14.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))) **
	             ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 ((KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N)))) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N)))))))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V
	     (THAT (?X_B (HAVE.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N)))))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N)))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
			(!W6 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N COMPOSITE-SCHEMA-64.PR ?X_B ?X_M
	              (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M GLASS.N))
			(!R2 (?X_M (OF.P (K WATER.N))))
			(!R3 (?X_M WATER.N))
			(!R4 (?X_N MAN.N))
		)
		(:STEPS
			(?X_L (?X_N (POUR.V ?X_M)))
			(?X_J (?X_N ((ADV-A (IN.P ?X_M)) LOOK.V)))
			(?X_H (?X_A (BE.V ?X_B)))
			(?X_F (?X_N ((OUT.PRT POUR.V) ?X_M)))
			(?X_D (?X_N GET.14.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L BEFORE ?X_J))
			(!W2 (?X_J BEFORE ?X_H))
			(!W3 (?X_H BEFORE ?X_F))
			(!W4 (?X_F BEFORE ?X_D))
		)
	)
	(
			"A man pours a glass of water water."
			"A man looks in a glass of water water."
			"X_A is X_B."
			"A man pours a glass of water water out."
			"A man get.113s water in another glass."
	)
)



(
	(EPI-SCHEMA ((?X_D COMPOSITE-SCHEMA-65.PR (KE (?X_A (CAN.AUX BE.V))) ?X_G ?X_J) **
	             ?E)
		(:ROLES
			(!R1 (?X_D SKY.N))
			(!R2 (?X_D (AS.ADV BLUE.A)))
			(!R3 (?X_F SING.V))
			(!R4 (?X_E MAMMA.N))
			(!R5 (?X_E (PERTAIN-TO ?X_F)))
			(!R6 (?X_G (PLUR WOOD.N)))
			(!R7 (?X_H (RIGHT-AFTER ?X_I)))
			(!R8 (?X_J GOOD.A))
			(!R9 (?X_J SHADE.N))
		)
		(:STEPS
			(?X_C (?X_D (AS.P (KE (?X_A (CAN.AUX BE.V))))))
			(?X_H ((SET-OF ?X_F ?X_E) (IN.P ?X_G)))
			(?X_L (?X_B (MAKE.V ?X_J)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_H)))
			(!W2 (?X_C (BEFORE ?X_L)))
			(!W3 (?X_H (BEFORE ?X_L)))
		)
	)
	(
			"A sky as blue is as."
			"A sing and a mamma of a sing are in."
			"X_B makes a good shade."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (TO.P ?X_B)) TAKE.12.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C JANITOR.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D (PERTAIN-TO ?X_C)))
			(!R6 (?X_D MOP.V))
			(!R7 (?X_B SINK.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?X_D)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_D (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B (OUT.ADV GET.15.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B JANITOR.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C MOP.V))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (TO.P ?X_A)) TAKE.13.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C JANITOR.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D (PERTAIN-TO ?X_C)))
			(!R6 (?X_D MOP.V))
			(!R7 (?X_A SINK.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?X_D)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_D (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (FOR.P (K BLIND.A)))
	               ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K BLIND.A))) GO.9.V)))
	              (K BLIND.A))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K BLIND.A) LOCATION.N))
			(!R4 (NOT (?L1 = (K BLIND.A))))
			(!R5 (?X_B OLD.A))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (K BLIND.A))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K BLIND.A)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K BLIND.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (DURING ?X_E)))
			(!W7 (?X_C (DURING ?X_E)))
			(!W8 (?X_C (CONSEC ?X_D)))
			(!W9 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (FOR.P (K BLIND.A)))
	               ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K BLIND.A))) GO.10.V)))
	              (K BLIND.A))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K BLIND.A) LOCATION.N))
			(!R4 (NOT (?L1 = (K BLIND.A))))
			(!R5 (?X_B OLD.A))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (K BLIND.A))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K BLIND.A)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K BLIND.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_D (CONSEC ?X_C)))
			(!W7 (?X_C (DURING ?X_E)))
			(!W8 (?X_D (DURING ?X_E)))
			(!W9 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-66.PR
	              (K ((ADV-A (FOR.P (K (PLUR YEAR.N)))) (FOR.P ?X_J))) ?X_B
	              (K BLIND.A))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I TIME.N))
			(!R2 (?X_I LONG.A))
			(!R3 (?X_J OLD.A))
			(!R4 (?X_J AGENT.N))
		)
		(:STEPS
			(?X_H (?X_B ?X_J ((ADV-A (FOR.P ?X_I)) HAVE.V)))
			(?X_F (?X_B (LOOK.V (K ((ADV-A (FOR.P (K (PLUR YEAR.N)))) (FOR.P ?X_J))))))
			(?X_D
	   (?X_A
	    (((ADV-A (FOR.P (KA ((ADV-A (OVER.P ?X_A)) GET.V))))
	      (MUCH.ADV (LONGER.ADV TAKE.V)))
	     ?X_B)))
			(E319.SK
	   (?X_J
	    ((ADV-A (FOR.P (K BLIND.A)))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K BLIND.A))) GO.9.V)))
	    (K BLIND.A)))
			(E319.SK
	   (?X_J
	    ((ADV-A (FOR.P (K BLIND.A)))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K BLIND.A))) GO.10.V)))
	    (K BLIND.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H BEFORE ?X_F))
			(!W2 (?X_F BEFORE ?X_D))
			(!W3 (?X_D BEFORE E319.SK))
		)
	)
	(
			"X_B has for a time long."
			"X_B looks for years for a old agent."
			"X_A takes X_B for over X_A getting much longer."
			"A old agent go.135s blind for blind from L1 to blind."
			"A old agent go.137s blind for blind from L1 to blind."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-67.PR (KE (AND (?X_B RED.A) (?X_B YELLOW.A)))
	              (K PURPLE.A))
	             ** ?E)
		(:STEPS
			(?X_D (?X_A (GIVE.V (KE (AND (?X_B RED.A) (?X_B YELLOW.A))))))
			(?X_F ((SET-OF (K RED.N) (K BLUE.N)) (MAKE.V (K PURPLE.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
		)
	)
	(
			"X_A gives and X_B red X_B yellow."
			"Red and blue make purple."
	)
)



(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-68.PR ?X_F ?X_J) ** ?E)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?X_F TREE.N))
			(!R3 (?X_I BRANCH.N))
			(!R4 (?X_J WINDOW.N))
			(!R5 (?X_J (OF.P (KE (?X_K HOUSE.N)))))
		)
		(:STEPS
			(?X_C (?X_A (PLANT.V ?X_F)))
			(?X_E (?X_F ((ADV-A (FOR.P (KA (VERY.ADV TALL.A)))) GROW.V)))
			(?X_H (?X_I ((ADV-A (FROM.P ?X_F)) FALL.V)))
			(?X_M (?X_I (BREAK.V ?X_J)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_H)))
			(!W3 (?X_C (BEFORE ?X_M)))
			(!W4 (?X_E (BEFORE ?X_H)))
			(!W5 (?X_E (BEFORE ?X_M)))
			(!W6 (?X_H (BEFORE ?X_M)))
		)
	)
	(
			"A man plants a tree."
			"A tree grows for very tall."
			"A branch falls from a tree."
			"A branch breaks a window of X_K house."
	)
)



(
	(EPI-SCHEMA ((?X_F GET.16.V
	              (K
	               (L X
	                (AND (X (MORE.ADV (ON.P ?X_F))) (X THAN.P) (X (IN.P ?X_F))))))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_F SON.N))
			(!R2
	   ((K (L X (AND (X (MORE.ADV (ON.P ?X_F))) (X THAN.P) (X (IN.P ?X_F)))))
	    INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4
	   (NOT
	    (?X_F =
	     (K (L X (AND (X (MORE.ADV (ON.P ?X_F))) (X THAN.P) (X (IN.P ?X_F))))))))
			(!R5 (?X_F (PERTAIN-TO ?X_A)))
			(!R6 (?X_A AGENT.N))
			(!R7 (?X_C (IMPINGES-ON ?X_D)))
		)
		(:GOALS
			(?G1
	   (?X_F
	    (WANT.V
	     (THAT
	      (?X_F
	       (HAVE.V
	        (K
	         (L X
	          (AND (X (MORE.ADV (ON.P ?X_F))) (X THAN.P) (X (IN.P ?X_F)))))))))))
		)
		(:PRECONDS
			(?I1
	   (NOT
	    (?X_F HAVE.V
	     (K (L X (AND (X (MORE.ADV (ON.P ?X_F))) (X THAN.P) (X (IN.P ?X_F))))))))
			(?I2 (?X_F (AT.P ?L)))
			(?I3
	   ((K (L X (AND (X (MORE.ADV (ON.P ?X_F))) (X THAN.P) (X (IN.P ?X_F)))))
	    (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1
	   (?X_F HAVE.V
	    (K (L X (AND (X (MORE.ADV (ON.P ?X_F))) (X THAN.P) (X (IN.P ?X_F)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_G))
			(!W2 (?I1 PRECOND-OF ?X_G))
			(!W3 (?I2 PRECOND-OF ?X_G))
			(!W4 (?I3 PRECOND-OF ?X_G))
			(!W5 (?P1 POSTCOND-OF ?X_G))
			(!W6 (?X_G (BEFORE ?X_I)))
			(!W7 (?X_H (AT-ABOUT ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_F GET.17.V
	              (K
	               (L X
	                (AND (X (MORE.ADV (ON.P ?X_F))) (X THAN.P) (X (IN.P ?X_F))))))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_F SON.N))
			(!R2
	   ((K (L X (AND (X (MORE.ADV (ON.P ?X_F))) (X THAN.P) (X (IN.P ?X_F)))))
	    INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4
	   (NOT
	    (?X_F =
	     (K (L X (AND (X (MORE.ADV (ON.P ?X_F))) (X THAN.P) (X (IN.P ?X_F))))))))
			(!R5 (?X_A AGENT.N))
			(!R6 (?X_F (PERTAIN-TO ?X_A)))
			(!R7 (?X_C (IMPINGES-ON ?X_B)))
		)
		(:GOALS
			(?G1
	   (?X_F
	    (WANT.V
	     (THAT
	      (?X_F
	       (HAVE.V
	        (K
	         (L X
	          (AND (X (MORE.ADV (ON.P ?X_F))) (X THAN.P) (X (IN.P ?X_F)))))))))))
		)
		(:PRECONDS
			(?I1
	   (NOT
	    (?X_F HAVE.V
	     (K (L X (AND (X (MORE.ADV (ON.P ?X_F))) (X THAN.P) (X (IN.P ?X_F))))))))
			(?I2 (?X_F (AT.P ?L)))
			(?I3
	   ((K (L X (AND (X (MORE.ADV (ON.P ?X_F))) (X THAN.P) (X (IN.P ?X_F)))))
	    (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1
	   (?X_F HAVE.V
	    (K (L X (AND (X (MORE.ADV (ON.P ?X_F))) (X THAN.P) (X (IN.P ?X_F)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_G))
			(!W2 (?I1 PRECOND-OF ?X_G))
			(!W3 (?I2 PRECOND-OF ?X_G))
			(!W4 (?I3 PRECOND-OF ?X_G))
			(!W5 (?P1 POSTCOND-OF ?X_G))
			(!W6 (?X_G (BEFORE ?X_I)))
			(!W7 (?X_H (AT-ABOUT ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_H COMPOSITE-SCHEMA-69.PR
	              (K (|5.2.2.V| (EAT.V (K (PLUR FOOD.N))))) ?X_F
	              (KE
	               (?X_H
	                (GET.V
	                 (L X
	                  (AND (X (MORE.ADV (ON.P ?X_H))) (X THAN.P)
	                       (X (IN.P ?X_H)))))))
	              (K
	               (L X
	                (AND (X (MORE.ADV (ON.P ?X_H))) (X THAN.P) (X (IN.P ?X_H))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I AGENT.N))
			(!R2 (?X_F (PLUR PEACH.N)))
			(!R3 (?X_H SON.N))
			(!R4 (?X_H (PERTAIN-TO ?X_I)))
			(!R5 (?X_J (IMPINGES-ON ?X_K)))
		)
		(:STEPS
			(?X_J (?X_H (JUST.ADV (HAVE.V (K (|5.2.2.V| (EAT.V (K (PLUR FOOD.N)))))))))
			(?X_E (?X_H (LOVE.V ?X_F)))
			(?X_C
	   (?X_H GET.16.V
	    (K (L X (AND (X (MORE.ADV (ON.P ?X_H))) (X THAN.P) (X (IN.P ?X_H)))))))
			(?X_C
	   (?X_H GET.17.V
	    (K (L X (AND (X (MORE.ADV (ON.P ?X_H))) (X THAN.P) (X (IN.P ?X_H)))))))
			(?X_L
	   (?X_I
	    (THINK.V
	     (KE
	      (?X_H
	       (GET.V
	        (L X (AND (X (MORE.ADV (ON.P ?X_H))) (X THAN.P) (X (IN.P ?X_H))))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J BEFORE ?X_E))
			(!W2 (?X_E BEFORE ?X_C))
			(!W3 (?X_C BEFORE ?X_L))
		)
	)
	(
			"A son of a agent has 5.2.2 eats foods just."
			"A son of a agent loves a peachs."
			"A son of a agent get.185s on than in."
			"A son of a agent get.186s on than in."
			"A agent thinks a son of a agent gets on than in."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-70.PR ?X_A) ** ?E)
		(:ROLES
			(!R1 (?X_A BIRD.N))
			(!R2 (?X_A BABY.N))
		)
		(:STEPS
			(?X_C (NOT (?X_A (CAN.AUX (HAVE.V ?X_A)))))
		)
	)
	(
			"A bird baby has a bird baby not can."
	)
)



(
	(EPI-SCHEMA ((?X_B TELL_INFORMATION.2.V ?X_C (KA STOP.V)) ** ?E)
		(:ROLES
			(!R1 (?X_B GIRL.N))
			(!R2 (?X_C AGENT.N))
			(!R3 ((KA STOP.V) INFORMATION.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (KNOW.V (KA STOP.V)))))))
		)
		(:STEPS
			(?X_D (?X_B (TELL.V ?X_C (KA STOP.V))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V (KA STOP.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_D)))))))
	               ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_D)))))))
	                ((ADV-A (ON.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_D)))))))
	                 SIT.5.V))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_B GIRL.N))
			(!R2 (NOT ((K (L X (AND (X FRONT.N) (X (OF.P ?X_D))))) AGENT.N)))
			(!R3 ((K (L X (AND (X FRONT.N) (X (OF.P ?X_D))))) FURNITURE.N))
			(!R4 (?L LOCATION.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L)))
			(?I2 ((K (L X (AND (X FRONT.N) (X (OF.P ?X_D))))) (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E ((ADV-A (WITH.P ?X_D)) ((ADV-A (WITH.P ?X_D)) PLAY.13.V))
	              ?G)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_D TOY.N))
			(!R3 (?X_D INANIMATE_OBJECT.N))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_D HAIR.N))
			(!R7 (?X_F (RIGHT-AFTER ?X_A)))
			(!R8 (?X_D (PERTAIN-TO ?X_B)))
			(!R9 (?X_B FEMALE.A))
			(!R10 (?X_B AGENT.N))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_E HAVE.V ?X_D))
		)
		(:POSTCONDS
			(?P1 (?X_E EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_F (SAME-TIME ?X_H)))
			(!W3 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R5 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E ((ADV-A (WITH.P ?X_D)) ((ADV-A (WITH.P ?X_D)) PLAY.14.V))
	              ?G)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_D TOY.N))
			(!R3 (?X_D INANIMATE_OBJECT.N))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_D HAIR.N))
			(!R7 (?X_D (PERTAIN-TO ?X_A)))
			(!R8 (?X_A FEMALE.A))
			(!R9 (?X_A AGENT.N))
			(!R10 (?X_F (RIGHT-AFTER ?X_B)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_E HAVE.V ?X_D))
		)
		(:POSTCONDS
			(?P1 (?X_E EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_F (SAME-TIME ?X_H)))
			(!W3 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R5 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_R COMPOSITE-SCHEMA-71.PR ?X_Q ?X_M ?X_A ?X_R (KA STOP.V) ?G) **
	             ?E)
		(:ROLES
			(!R1 (?X_M HAIR.N))
			(!R2 (?X_N FEMALE.A))
			(!R3 (?X_N AGENT.N))
			(!R4 (?X_M (PERTAIN-TO ?X_N)))
			(!R5 (?X_O (RIGHT-AFTER ?X_P)))
			(!R6 ((KA STOP.V) INFORMATION.N))
			(!R7 (?X_Q GIRL.N))
			(!R8 (?X_R AGENT.N))
		)
		(:STEPS
			(?X_L (?X_R (LIKE.V ?X_Q)))
			(?X_H (?X_R (WITH.P ?X_M)))
			(?X_D (?X_R (STOP.V ?X_A)))
			(?E_1 (?X_Q TELL_INFORMATION.2.V ?X_R (KA STOP.V)))
			(?X_J
	   (?X_Q
	    ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_R)))))))
	     ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_R)))))))
	      ((ADV-A (ON.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_R))))))) SIT.5.V)))))
			(?X_O (?X_R ((ADV-A (WITH.P ?X_M)) ((ADV-A (WITH.P ?X_M)) PLAY.13.V)) ?G))
			(?X_O (?X_R ((ADV-A (WITH.P ?X_M)) ((ADV-A (WITH.P ?X_M)) PLAY.14.V)) ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_O)))
			(!W2 (?X_J (BEFORE ?X_O)))
			(!W3 (?X_L BEFORE ?X_D))
			(!W4 (?X_D BEFORE ?E_1))
		)
	)
	(
			"A agent likes a girl."
			"A agent is with."
			"A agent stops X_A."
			"A girl tell information.200s a agent stopping."
			"A girl sit.197s in front of in front of on front of."
			"A agent play.198s G with a hair of a female agent with a hair of a female agent."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (FOR.P (K (OVER.PRT (TO.P ?X_D)))))
	               ((ADV-A (FROM.P ?L1))
	                ((ADV-A (TO.P (K (OVER.PRT (TO.P ?X_D))))) RUN.7.V)))
	              (K (OVER.PRT (TO.P ?X_D))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (OVER.PRT (TO.P ?X_D))) LOCATION.N))
			(!R4 (NOT (?L1 = (K (OVER.PRT (TO.P ?X_D))))))
			(!R5 (?X_C BIG.A))
			(!R6 (?X_D (PLUR KID.N)))
			(!R7 (?X_B (PERTAIN-TO ?X_D)))
			(!R8 (?X_B (PERTAIN-TO ?X_B)))
			(!R9 (?X_B FRIEND.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P (K (OVER.PRT (TO.P ?X_D))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P (K (OVER.PRT (TO.P ?X_D)))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P (K (OVER.PRT (TO.P ?X_D))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_K COMPOSITE-SCHEMA-72.PR (KE (?X_K HOUSE.N)) (K HOME.N)
	              (K (OVER.PRT (TO.P ?X_L))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_L (PLUR KID.N)))
			(!R2 (?X_E YARD.N))
			(!R3 (?X_F BIG.A))
			(!R4 (?X_F DOG.N))
			(!R5 (?X_I (RIGHT-AFTER ?X_J)))
			(!R6 (?X_K FRIEND.N))
			(!R7 (?X_K (PERTAIN-TO ?X_K)))
			(!R8 (?X_K (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(E6.SK (?X_K HOUSE.N))
			(U1.SK ((TWO.D (PLUR KID.N)) (VISIT.V (KE (?X_K HOUSE.N)))))
			(?X_I (NOT (?X_K (BE.V (K HOME.N)))))
			(?X_H (NOT (?X_K (BE.V (K HOME.N)))))
			(?X_D (?X_F ((ADV-A (IN.P ?X_E)) BE.V)))
			(?X_B
	   (?X_F
	    ((ADV-A (FOR.P (K (OVER.PRT (TO.P ?X_L)))))
	     ((ADV-A (FROM.P ?L1))
	      ((ADV-A (TO.P (K (OVER.PRT (TO.P ?X_L))))) RUN.7.V)))
	    (K (OVER.PRT (TO.P ?X_L)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (E6.SK BEFORE U1.SK))
			(!W2 (U1.SK BEFORE ?X_I))
			(!W3 (?X_I BEFORE ?X_H))
			(!W4 (?X_H BEFORE ?X_D))
			(!W5 (?X_D BEFORE ?X_B))
		)
	)
	(
			"A friend of a friend of X_K of a kids of a kids is house."
			"Two kids visit a friend of a friend of X_K of a kids of a kids house."
			"A friend of a friend of X_K of a kids of a kids is home not."
			"A friend of a friend of X_K of a kids of a kids is home not."
			"A big dog is in a yard."
			"A big dog run.1s over to a kids for over to a kids from L1 to over to a kids."
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (WITH.P ?X_B)) PLAY.15.V) ?X_E) ** ?X_H)
		(:ROLES
			(!R1 (?X_D CAT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?X_B BALL.N))
			(!R4 (?X_B (ON.P ?X_C)))
			(!R5 (?X_C FLOOR.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_E EXIST.V)))))
			(?G2 (?X_D (WANT.V (KA (HAVE.V ?X_E)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_E EXIST.V)))
		)
		(:POSTCONDS
			(?X_F (?X_E EXIST.V))
			(?P2 (?X_D (HAVE.V ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AT-ABOUT ?X_G)))
			(!W2 (?X_H (AT-ABOUT ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (WITH.P ?X_B)) PLAY.16.V) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D CAT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?X_B BALL.N))
			(!R4 (?X_C FLOOR.N))
			(!R5 (?X_B (ON.P ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_E EXIST.V)))))
			(?G2 (?X_D (WANT.V (KA (HAVE.V ?X_E)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_E EXIST.V)))
		)
		(:POSTCONDS
			(?X_H (?X_E EXIST.V))
			(?P2 (?X_D (HAVE.V ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AT-ABOUT ?X_G)))
			(!W2 (?X_H (AT-ABOUT ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (INTO.P ?X_A))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) WALK.3.V))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C CAT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A ROOM.N))
			(!R6 (?X_A LIVING.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (INTO.P ?X_B))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) WALK.4.V))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C CAT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B ROOM.N))
			(!R6 (?X_B LIVING.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (WITH.P ?X_C)) ((ADV-A (WITH.P ?X_C)) PLAY.17.V))
	              ?G)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D CAT.N))
			(!R2 (?X_C TOY.N))
			(!R3 (?X_C INANIMATE_OBJECT.N))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_C BALL.N))
			(!R7 (?X_C (ON.P ?X_B)))
			(!R8 (?X_B FLOOR.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_D HAVE.V ?X_C))
		)
		(:POSTCONDS
			(?P1 (?X_D EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R5 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_M COMPOSITE-SCHEMA-73.PR ?X_N ?X_A ?L2 ?G) ** ?E)
		(:ROLES
			(!R1 (?X_N BALL.N))
			(!R2 (?X_L LIVING.N))
			(!R3 (?X_L ROOM.N))
			(!R4 (?X_M CAT.N))
			(!R5 (?X_O FLOOR.N))
			(!R6 (?X_N (ON.P ?X_O)))
		)
		(:STEPS
			(?X_G (?X_M ((AROUND.ADV SWAT.V) ?X_N)))
			(?X_C (?X_M (LIKE.V ?X_N)))
			(?X_K
	   (?X_M
	    ((ADV-A (INTO.P ?X_L))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) WALK.3.V))))
	    ?L2))
			(?X_K
	   (?X_M
	    ((ADV-A (INTO.P ?X_L))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) WALK.4.V))))
	    ?L2))
			(?X_I (?X_A (BE.V ?X_N)))
			(?X_E (?X_M ((ADV-A (WITH.P ?X_N)) PLAY.15.V) ?X_A))
			(?X_E (?X_M ((ADV-A (WITH.P ?X_N)) PLAY.16.V) ?X_A))
			(?X_E (?X_M ((ADV-A (WITH.P ?X_N)) ((ADV-A (WITH.P ?X_N)) PLAY.17.V)) ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_E)))
			(!W3 (?X_I (BEFORE ?X_E)))
			(!W4 (?X_G BEFORE ?X_C))
		)
	)
	(
			"A cat swats a ball on a floor around."
			"A cat likes a ball on a floor."
			"A cat walk.25s L2 into a living room to L2 from L1 for L2."
			"A cat walk.26s L2 into a living room to L2 from L1 for L2."
			"X_A is a ball on a floor."
			"A cat play.31s X_A with a ball on a floor."
			"A cat play.33s X_A with a ball on a floor."
			"A cat play.36s G with a ball on a floor with a ball on a floor."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (DOWN.ADV
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) FALL.2.V))))
	              ?L2)
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_C (AT-ABOUT ?X_E)))
			(!W7 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.5.V ?Y ?A) ** ?E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?Y AGENT.N))
			(!R3 (?A ACTION.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V ?Y ?A)))
			(?G2 (?X_B (WANT.V (THAT (?X_B (DO.V ?A))))))
		)
		(:STEPS
			(?X_C (?X_B (ASK.V ?Y ?A)))
			(?E2 (?Y (DO.V ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?X_C))
			(!W2 (?X_C CAUSE-OF ?E2))
			(!W3 (?X_C (AT-ABOUT ?X_E)))
			(!W4 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.6.V ?Y ?A) ** ?E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?Y AGENT.N))
			(!R3 (?A ACTION.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V ?Y ?A)))
			(?G2 (?X_B (WANT.V (THAT (?X_B (DO.V ?A))))))
		)
		(:STEPS
			(?X_C (?X_B (DOWN.ADV ASK.V) ?Y ?A))
			(?E2 (?Y (DO.V ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?X_C))
			(!W2 (?X_C CAUSE-OF ?E2))
			(!W3 (?X_C (AT-ABOUT ?X_E)))
			(!W4 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_L COMPOSITE-SCHEMA-74.PR (K ROPE.N) ?X_L (KA (IN.PRT JUMP.V)) ?L2
	              ?Y ?A)
	             ** ?E)
		(:ROLES
			(!R1 (?X_J {REF}.N))
			(!R2 (?X_J (OF.P ?X_K)))
			(!R3 (?X_L AGENT.N))
			(!R4 (?A ACTION.N))
			(!R5 (?Y AGENT.N))
		)
		(:STEPS
			(?X_I (?X_J (JUMP.V (K ROPE.N))))
			(?X_G (?X_A (ASK.V ?X_L (KA (IN.PRT JUMP.V)))))
			(?X_C
	   (?X_L
	    (DOWN.ADV
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) FALL.2.V))))
	    ?L2))
			(?E_1 (?X_L REQUEST_ACTION.5.V ?Y ?A))
			(?E_2 (?X_L REQUEST_ACTION.6.V ?Y ?A))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I BEFORE ?X_G))
			(!W2 (?X_G BEFORE ?X_C))
			(!W3 (?X_C BEFORE ?E_1))
			(!W4 (?E_1 BEFORE ?E_2))
		)
	)
	(
			"A of X_K jumps rope."
			"X_A asks a agent in jumping."
			"A agent fall.42s L2 down to L2 from L1 for L2."
			"A agent request action.40s a agent a action."
			"A agent request action.41s a agent a action."
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (TO.P ?X_B)) TAKE.14.V) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_B WAGON.N))
			(!R6 (?X_D (GLAD.A (KA (GET.V ?X_E)))))
			(!R7 (?X_E (PLUR FLOWER.N)))
			(!R8 (?X_E PRETTY.A))
			(!R9 (?X_A FIELD.N))
			(!R10 (?X_A (WITH.P ?X_B)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (AFTER ?X_G)))
			(!W7 (?X_G (AT-ABOUT ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (TO.P ?X_A)) TAKE.15.V) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_A WAGON.N))
			(!R6 (?X_D (GLAD.A (KA (GET.V ?X_E)))))
			(!R7 (?X_E PRETTY.A))
			(!R8 (?X_E (PLUR FLOWER.N)))
			(!R9 (?X_B (WITH.P ?X_A)))
			(!R10 (?X_B FIELD.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (AFTER ?X_G)))
			(!W7 (?X_G (AT-ABOUT ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (TO.P ?X_C)) TAKE.16.V) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_D (GLAD.A (KA (GET.V ?X_E)))))
			(!R6 (?X_E (PLUR FLOWER.N)))
			(!R7 (?X_E PRETTY.A))
			(!R8 (?X_C WAGON.N))
			(!R9 (?X_B FIELD.N))
			(!R10 (?X_B (WITH.P ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (AFTER ?X_G)))
			(!W7 (?X_G (AT-ABOUT ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-75.PR (KE (?X_C (HAVE.V ?X_B))) ?X_B) ** ?E)
		(:ROLES
			(!R1 (?X_J WAGON.N))
			(!R2 (?X_A (GLAD.A (KA (GET.V ?X_B)))))
			(!R3 (?X_A AGENT.N))
			(!R4 (?X_B PRETTY.A))
			(!R5 (?X_B (PLUR FLOWER.N)))
			(!R6 (?X_C (HAS.V ?X_D)))
			(!R7 (?X_E (HAS.V (THREE.D (L X (AND (X YELLOW.A) (X (PLUR FLOWER.N))))))))
			(!R8 (?X_F (IMPINGES-ON ?X_G)))
			(!R9 (?X_H AGENT.N))
			(!R10 (?X_I FIELD.N))
			(!R11 (?X_I (WITH.P ?X_J)))
		)
		(:STEPS
			(?X_F
	   (?X_H (KA HAVE.V)
	    ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N)))))) |4.2.2.V|)))
			(E84.SK (?X_E (LET.V (KE (?X_C (HAVE.V ?X_B))))))
			(E85.SK (?X_A ((ADV-A (TO.P ?X_J)) TAKE.14.V) ?X_B))
			(E85.SK (?X_A ((ADV-A (TO.P ?X_J)) TAKE.15.V) ?X_B))
			(E85.SK (?X_A ((ADV-A (TO.P ?X_J)) TAKE.16.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F BEFORE E84.SK))
			(!W2 (E84.SK BEFORE E85.SK))
		)
	)
	(
			"A agent 4.2.2s for finding flowers."
			"A has three yellow flower lets a has X_D has a pretty flowers."
			"A glad getting a pretty flowers agent take.44s a pretty flowers to a wagon."
			"A glad getting a pretty flowers agent take.45s a pretty flowers to a wagon."
			"A glad getting a pretty flowers agent take.46s a pretty flowers to a wagon."
	)
)



(
	(EPI-SCHEMA ((?X_C FIND.8.V ?X_D) ** ?X_H)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_D GREAT.A))
			(!R4 (?X_D SONG.N))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L)))
			(?I2 (?X_D (AT.P ?L)))
			(?X_G (?X_C ((ADV-A (ON.P ?X_B)) ((ADV-A (FOR.P ?X_D)) SEARCH.V))))
			(?I4 (NOT (?X_C (KNOW.V (THAT (?X_D (AT.P ?L)))))))
			(?I5 (NOT (?X_C (HAVE.V ?X_D))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V (THAT (?X_D (AT.P ?L))))))
			(?P2 (?X_C (HAVE.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G BEFORE ?X_H))
			(!W2 (?X_H (AT-ABOUT ?X_E)))
			(!W3 (?X_G (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?X_G) = ?X_H))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C FIND.9.V ?X_D) ** ?X_H)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_D SONG.N))
			(!R4 (?X_D GREAT.A))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L)))
			(?I2 (?X_D (AT.P ?L)))
			(?X_G (?X_C ((ADV-A (ON.P ?X_B)) ((ADV-A (FOR.P ?X_D)) SEARCH.V))))
			(?I4 (NOT (?X_C (KNOW.V (THAT (?X_D (AT.P ?L)))))))
			(?I5 (NOT (?X_C (HAVE.V ?X_D))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V (THAT (?X_D (AT.P ?L))))))
			(?P2 (?X_C (HAVE.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G BEFORE ?X_H))
			(!W2 (?X_G (AT-ABOUT ?X_E)))
			(!W3 (?X_H (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?X_G) = ?X_H))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-76.PR (ALL.D DAY.N) (KA (BUY.V ?X_E)) ?X_L) **
	             ?E)
		(:ROLES
			(!R1 (?X_E ALBUM.N))
			(!R2 (?X_L GREAT.A))
			(!R3 (?X_L SONG.N))
		)
		(:STEPS
			(?X_N (?X_B ((ADV-A (ON.P ?X_A)) SEARCH.V)))
			(?X_I (?X_B (((ADV-A (TO.P ?X_L)) LISTEN.V) (ALL.D DAY.N))))
			(?X_G (?X_B (LOVE.V ?X_L)))
			(?X_D (?X_B (WANT.V (KA (BUY.V ?X_E)))))
			(?X_K (?X_B FIND.8.V ?X_L))
			(?X_K (?X_B FIND.9.V ?X_L))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_K)))
			(!W2 (?X_I BEFORE ?X_G))
			(!W3 (?X_G BEFORE ?X_D))
		)
	)
	(
			"X_B searches on X_A."
			"X_B listens all day to a great song."
			"X_B loves a great song."
			"X_B wants buying a album."
			"X_B find.69s a great song."
			"X_B find.70s a great song."
	)
)



(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-77.PR (K SWIMMING.N) (KA SWIM.V) ?X_H) ** ?E)
		(:ROLES
			(!R1 (?X_I AGENT.N))
			(!R2 (?X_G (VERY.ADV COLD.A)))
			(!R3 (?X_G WATER.N))
			(!R4 (?X_H (PLUR TOOTH.N)))
			(!R5 (?X_H CHATTER.N))
			(!R6 (?X_H (PERTAIN-TO ?X_I)))
		)
		(:STEPS
			(?X_B ((K TODAY.N) ?X_I (GO.V (K SWIMMING.N))))
			(?X_D (?X_I (TO.P (KA SWIM.V))))
			(?X_F (?X_I ((ADV-A (TO.P (KA SWIM.V))) LOVE.V)))
			(?X_K (?X_G (MAKE.V ?X_H)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_D)))
			(!W2 (?X_B (BEFORE ?X_F)))
			(!W3 (?X_B (BEFORE ?X_K)))
			(!W4 (?X_D (BEFORE ?X_F)))
			(!W5 (?X_D (BEFORE ?X_K)))
			(!W6 (?X_F (BEFORE ?X_K)))
		)
	)
	(
			"Today goes swimming."
			"A agent is to."
			"A agent loves to swimming."
			"A very cold water makes a tooths chatter of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-78.PR ?X_A (K (AWAY.ADV (FROM.P ?X_B)))) ** ?E)
		(:ROLES
			(!R1 (?X_E HOOP.N))
		)
		(:STEPS
			(?X_D (NOT (?X_B (CAN.AUX (CATCH.V ?X_A)))))
			(?X_G (?X_E (ROLL.V (K (AWAY.ADV (FROM.P ?X_B))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_G)))
		)
	)
	(
			"X_B catches X_A not can."
			"A hoop rolls away from X_B."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-79.PR ?X_D (K ORANGE.N)) ** ?E)
		(:ROLES
			(!R1 (?X_B (SET-OF AGENT.N)))
			(!R2 (?X_D COLOR.N))
			(!R3 (?X_D ORANGE.N))
			(!R4 (?X_C (OF.P ?X_D)))
			(!R5 (?X_G AGENT.N))
		)
		(:STEPS
			(?X_F (?X_B (CALL.V ?X_D)))
			(?X_I (?X_G (CAN.AUX (MAKE.V (K ORANGE.N)))))
			(?X_K ((K (L X ((X RED.N) AND (X AND) (X YELLOW.A)))) (MAKE.V (K ORANGE.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_I)))
			(!W2 (?X_F (BEFORE ?X_K)))
			(!W3 (?X_I (BEFORE ?X_K)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (HOME.ADV
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.8.V))))
	              ?L2)
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_K COMPOSITE-SCHEMA-80.PR (KA ((ADV-A (FOR.P ?X_H)) GO.V)) ?L2) **
	             ?E)
		(:ROLES
			(!R1 (?X_E SUNNY.A))
			(!R2 (?X_H JOB.N))
			(!R3 (?X_K MAN.N))
		)
		(:STEPS
			(?X_J (?X_K (OUTSIDE.ADV LOOK.V)))
			(?X_G (?X_K (DECIDE.V (KA ((ADV-A (FOR.P ?X_H)) GO.V)))))
			(?X_D (?X_E ((ADV-A (FOR.P (KA RAIN.V))) START.V)))
			(?X_B
	   (?X_K
	    (HOME.ADV
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.8.V))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J BEFORE ?X_G))
			(!W2 (?X_G BEFORE ?X_D))
			(!W3 (?X_D BEFORE ?X_B))
		)
	)
	(
			"A man looks outside."
			"A man decides for a job going."
			"A sunny starts for raining."
			"A man run.116s L2 home to L2 from L1 for L2."
	)
)



(
	(EPI-SCHEMA ((?X_D (JUST.ADV GET.18.V) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?X_C EDGE.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E RUG.N))
			(!R6 (?X_E NEW.A))
			(!R7 (?X_E (VERY.ADV PLUSH.A)))
			(!R8 (?X_B (PERTAIN-TO ?X_D)))
			(!R9 (?X_B CAT.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?X_C)))
			(?I3 (?X_E (AT.P ?X_C)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D
	              (AWAY.PRT
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?X_C)) ((ADV-A (FOR.P ?L2)) RUN.9.V))))
	              ?L2)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D CAT.N))
			(!R2 (?X_C EDGE.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_C = ?L2)))
			(!R5 (?X_D (PERTAIN-TO ?X_B)))
			(!R6 (?X_B AGENT.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?X_C)))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?X_C))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E ((ADV-A (WITH.P ?X_D)) ((ADV-A (WITH.P ?X_D)) PLAY.18.V))
	              ?G)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E CAT.N))
			(!R2 (?X_D TOY.N))
			(!R3 (?X_D INANIMATE_OBJECT.N))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_D EDGE.N))
			(!R7 (?X_E (PERTAIN-TO ?X_B)))
			(!R8 (?X_B AGENT.N))
			(!R9 (?X_G (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_E HAVE.V ?X_D))
		)
		(:POSTCONDS
			(?P1 (?X_E EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_F (BEFORE ?X_H)))
			(!W3 (?X_G (SAME-TIME ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R5 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_M COMPOSITE-SCHEMA-81.PR ?X_L ?L2 ?G) ** ?E)
		(:ROLES
			(!R1 (?X_E WIFE.N))
			(!R2 (?X_E (PERTAIN-TO ?X_F)))
			(!R3 (?X_I EDGE.N))
			(!R4 (?X_M CAT.N))
			(!R5 (?X_L NEW.A))
			(!R6 (?X_L RUG.N))
			(!R7 (?X_L (VERY.ADV PLUSH.A)))
			(!R8 (?X_N AGENT.N))
			(!R9 (?X_M (PERTAIN-TO ?X_N)))
			(!R10 (?X_O (RIGHT-AFTER ?X_P)))
		)
		(:STEPS
			(?X_D (?X_E ((ADV-A (AT.P ?X_M)) YELL.V)))
			(?X_K (?X_N (JUST.ADV GET.18.V) ?X_L))
			(?X_H (?X_M ((ADV-A (WITH.P ?X_I)) ((ADV-A (WITH.P ?X_I)) PLAY.18.V)) ?G))
			(?X_O (?X_M ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_I)) PLAY.V)))) START.V)))
			(?X_B
	   (?X_M
	    (AWAY.PRT
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?X_I)) ((ADV-A (FOR.P ?L2)) RUN.9.V))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_O)))
			(!W2 (?X_K (BEFORE ?X_B)))
			(!W3 (?X_H (BEFORE ?X_O)))
			(!W4 (?X_H (BEFORE ?X_B)))
			(!W5 (?X_O (BEFORE ?X_B)))
		)
	)
	(
			"A wife of X_F yells at a cat of a agent."
			"A agent get.119s a new rug very plush just."
			"A cat of a agent play.128s G with a edge with a edge."
			"A cat of a agent starts for with a edge playing."
			"A cat of a agent run.126s L2 away to L2 from a edge for L2."
	)
)



(
	(EPI-SCHEMA ((?X_C (OUT.PRT GET.19.V) (KA ((ADV-A (ON.P ?X_D)) CHECK.V))) **
	             ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 ((KA ((ADV-A (ON.P ?X_D)) CHECK.V)) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = (KA ((ADV-A (ON.P ?X_D)) CHECK.V)))))
			(!R5 (?X_C (HOME.ADV DRIVE.V)))
			(!R6 (?X_D RABBIT.N))
			(!R7 (?X_D ROAD.N))
			(!R8 (?X_D DEAD.A))
			(!R9 (?X_B RABBIT.N))
			(!R10 (?X_B (ON.P ?X_D)))
		)
		(:GOALS
			(?G1
	   (?X_C (WANT.V (THAT (?X_C (HAVE.V (KA ((ADV-A (ON.P ?X_D)) CHECK.V))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V (KA ((ADV-A (ON.P ?X_D)) CHECK.V)))))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 ((KA ((ADV-A (ON.P ?X_D)) CHECK.V)) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V (KA ((ADV-A (ON.P ?X_D)) CHECK.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-82.PR ?X_G (K HOME.N)
	              (KA ((ADV-A (ON.P ?X_H)) CHECK.V)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H ROAD.N))
			(!R2 (?X_H DEAD.A))
			(!R3 (?X_H RABBIT.N))
			(!R4 (?X_G RABBIT.N))
			(!R5 (?X_G (ON.P ?X_H)))
			(!R6 (?X_I (HOME.ADV DRIVE.V)))
		)
		(:STEPS
			(?X_F (?X_I (HIT.V ?X_G)))
			(?X_B (?X_I (DRIVE.V (K HOME.N))))
			(?X_D (?X_I (OUT.PRT GET.19.V) (KA ((ADV-A (ON.P ?X_H)) CHECK.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F BEFORE ?X_B))
			(!W2 (?X_B BEFORE ?X_D))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_C COMPOSITE-SCHEMA-83.PR (K GLUE.N) ?X_F ?X_I) ** ?E)
		(:ROLES
			(!R1 (?X_C BOY.N))
			(!R2 (?X_B (PERTAIN-TO ?X_C)))
			(!R3 (?X_F CARPET.N))
			(!R4 (?X_I HOUR.N))
		)
		(:STEPS
			(?X_A (?X_C (FIND.V (K GLUE.N))))
			(?X_E (?X_C ((OUT.PRT POUR.V) (K GLUE.N))))
			(?X_H ((K GLUE.N) (COVER.V ?X_F)))
			(?X_K ((K GLUE.N) ((IN.PRT DRY.V) ?X_I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_E)))
			(!W2 (?X_A (BEFORE ?X_H)))
			(!W3 (?X_A (BEFORE ?X_K)))
			(!W4 (?X_E (BEFORE ?X_H)))
			(!W5 (?X_E (BEFORE ?X_K)))
			(!W6 (?X_H (BEFORE ?X_K)))
		)
	)
	(
			"A boy finds glue."
			"A boy pours glue out."
			"Glue covers a carpet."
			"Glue dries a hour in."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (WITH.P ?X_B)) ((ADV-A (WITH.P ?T)) PLAY.19.V)) ?G)
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B MOUSE.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_B HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_B EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_C (AFTER ?X_D)))
			(!W3 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R3 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R5 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J COMPOSITE-SCHEMA-84.PR ?X_G ?X_A ?G) ** ?E)
		(:ROLES
			(!R1 (?X_D MOUSE.N))
			(!R2 (?X_G MOUSE.N))
			(!R3 (?X_J OLD.A))
			(!R4 (?X_J CAT.N))
			(!R5 (?X_J (HAS.V ?X_H)))
			(!R6 (?X_I ?X_J (PLUR KITTEN.N)))
			(!R7 (?X_I (PERTAIN-TO ?X_J)))
		)
		(:STEPS
			(?X_F (?X_J (CAN.AUX (CATCH.V ?X_G))))
			(?X_B (?X_J (((ADV-A (TO.P ?X_I)) GIVE.V) ?X_A)))
			(?X_C (?X_J (((ADV-A (TO.P ?X_I)) GIVE.V) ?X_A)))
			(E56.SK (?X_D ((ADV-A (WITH.P ?X_D)) ((ADV-A (WITH.P ?T)) PLAY.19.V)) ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_B)))
			(!W2 (?X_F (BEFORE ?X_C)))
			(!W3 (?X_B (BEFORE ?X_C)))
		)
	)
	(
			"A old cat has X_H catches a mouse can."
			"A old cat has X_H gives X_A to a of a old cat has X_H."
			"A old cat has X_H gives X_A to a of a old cat has X_H."
			"A mouse play.18s G with a mouse with T."
	)
)



(
	(EPI-SCHEMA ((?X_C TAKE.17.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D SHOWER.V))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B HAIR.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?X_D)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_D (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_P COMPOSITE-SCHEMA-85.PR (K COLD.A) (KE ((K SOAP.N) (IN.P ?X_O)))
	              ?X_O ?X_N)
	             ** ?E)
		(:ROLES
			(!R1 (?X_C (RIGHT-AFTER ?X_D)))
			(!R2 (?X_E (RIGHT-AFTER ?X_F)))
			(!R3 (?X_O HAIR.N))
			(!R4 (?X_K HOT.A))
			(!R5 (?X_K WATER.N))
			(!R6 (?X_N SHOWER.V))
			(!R7 (?X_P MAN.N))
			(!R8 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_J (?X_K (GO.V (K COLD.A))))
			(?X_H (?X_P (STILL.ADV (HAVE.V (KE ((K SOAP.N) (IN.P ?X_O)))))))
			(?X_E (?X_P (STILL.ADV (HAVE.V (KE ((K SOAP.N) (IN.P ?X_O)))))))
			(?X_C (?X_P ((QUICKLY.ADV WASH.V) ?X_O)))
			(?X_B (?X_P ((QUICKLY.ADV WASH.V) ?X_O)))
			(?X_M (?X_P TAKE.17.V ?X_N))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J BEFORE ?X_H))
			(!W2 (?X_H BEFORE ?X_E))
			(!W3 (?X_E BEFORE ?X_C))
			(!W4 (?X_C BEFORE ?X_B))
			(!W5 (?X_B BEFORE ?X_M))
		)
	)
	(
			"A hot water goes cold."
			"A man has soap in a hair of a man still."
			"A man has soap in a hair of a man still."
			"A man washes a hair of a man quickly."
			"A man washes a hair of a man quickly."
			"A man take.29s a shower."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.20.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_B (GET.20.V (K (SO.ADV BIG.A)))))
			(!R6 (?X_C (FOR.P ?X_B)))
			(!R7 (?X_C (K SMASH.N) CAKE.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_F COMPOSITE-SCHEMA-86.PR (K SMASH.N) ?X_E) ** ?E)
		(:ROLES
			(!R1 (?X_E (K SMASH.N) CAKE.N))
			(!R2 (?X_F (GET.V (K (SO.ADV BIG.A)))))
			(!R3 (?X_F AGENT.N))
			(!R4 (?X_E (FOR.P ?X_F)))
		)
		(:STEPS
			(?X_B (?X_F (LOVE.V (K SMASH.N))))
			(?X_D (?X_F GET.20.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B BEFORE ?X_D))
		)
	)
	(
			"A get so big agent loves smash."
			"A get so big agent get.41s a for a get so big agent."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (FOR.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_D))))
	               ((ADV-A (TO.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_D))))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (FOR.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_D))))
	                  GO.11.V))))
	              (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_D)))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_D)) LOCATION.N))
			(!R4 (NOT (?L1 = (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_D)))))
			(!R5 (?X_D FARM.N))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V
	     (KA ((ADV-A (AT.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_D)))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_D))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_D)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-87.PR ?X_A ?X_I ?X_F
	              (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_N)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F VERY.A))
			(!R2 (?X_F FUN.N))
			(!R3 (?X_F DAY.N))
			(!R4 (?X_I LOT.N))
			(!R5 (?X_I (OF.P (K (PLUR ANIMAL.N)))))
			(!R6 (?X_N FARM.N))
			(!R7 (?X_O AGENT.N))
		)
		(:STEPS
			(?X_K (?X_B (BE.V ?X_A)))
			(?X_H (?X_N (HAVE.V ?X_I)))
			(?X_E (?X_B (BE.V ?X_F)))
			(?X_M
	   (?X_O
	    ((ADV-A (FOR.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_N))))
	     ((ADV-A (TO.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_N))))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (FOR.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_N)))) GO.11.V))))
	    (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K BEFORE ?X_H))
			(!W2 (?X_H BEFORE ?X_E))
			(!W3 (?X_E BEFORE ?X_M))
		)
	)
	(
			"X_B is X_A."
			"A farm has a lot of animals."
			"X_B is a very fun day."
			"A agent go.52s on X_C visiting a farm for on X_C visiting a farm to on X_C visiting a farm from L1 for on X_C visiting a farm."
	)
)



(
	(EPI-SCHEMA ((?X_K COMPOSITE-SCHEMA-88.PR (SET-OF ?X_L ?X_E ?X_K) ?X_F) ** ?E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_E DOG.N))
			(!R3 (?X_E (IS.V ?X_D)))
			(!R4 (?X_L GOOD.A))
			(!R5 (?X_L MAN.N))
			(!R6 (?X_L (TO.P ?X_E)))
			(!R7 (?X_F BIG.A))
			(!R8 (?X_F HAT.N))
			(!R9 (?X_E (HAS.V ?X_F)))
			(!R10 (?X_K COW.N))
			(!R11 (?X_K (WITH.P ?X_L)))
		)
		(:STEPS
			(?X_C (?X_A (SEE.V (SET-OF ?X_L ?X_E ?X_K))))
			(?X_H (?X_E (MAY.AUX (((ADV-A (TO.P ?X_L)) TAKE.V) ?X_F))))
			(?X_J (?X_K (CAN.AUX RUN.V)))
			(?X_N (NOT (?X_K (CAN.AUX PLAY.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_H)))
			(!W2 (?X_C (BEFORE ?X_J)))
			(!W3 (?X_C (BEFORE ?X_N)))
			(!W4 (?X_H (BEFORE ?X_J)))
			(!W5 (?X_H (BEFORE ?X_N)))
			(!W6 (?X_J (BEFORE ?X_N)))
		)
	)
	(
			"A agent sees a good man to a dog is X_D has a big hat a dog is X_D has a big hat and a cow with a good man to X_E."
			"A dog is X_D has a big hat takes a big hat may to a good man to a dog is X_D has a big hat."
			"A cow with a good man to X_E runs can."
			"A cow with a good man to X_E plays not can."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-89.PR ?X_A ?X_G) ** ?E)
		(:ROLES
			(!R1 (?X_G BED.N))
			(!R2 (?X_F (PERTAIN-TO ?X_G)))
			(!R3 (?X_G (PERTAIN-TO ?X_H)))
			(!R4 (?X_I (RIGHT-AFTER ?X_J)))
		)
		(:STEPS
			(?X_C (?X_G ((AWAY.ADV SWAT.V) ?X_A)))
			(?X_E (?X_A (UNDER.P ?X_G)))
			(?X_I (?X_A ((ADV-A (UNDER.P ?X_G)) RUN.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_I)))
			(!W3 (?X_E (BEFORE ?X_I)))
		)
	)
	(
			"A bed of X_H swats X_A away."
			"X_A is under."
			"X_A runs under a bed of X_H."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (HOME.ADV
	               (INSTEAD.ADV
	                ((ADV-A (TO.P ?L2))
	                 ((ADV-A (FROM.P ?X_B)) ((ADV-A (FOR.P ?L2)) GO.4.V)))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_B CORNER.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_B = ?L2)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?X_B)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?X_B))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-90.PR ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_F CORNER.N))
			(!R3 (?X_I LINE.N))
		)
		(:STEPS
			(?X_H (?X_I (LONG.ADV (TOO.ADV (FAR.ADV BE.V)))))
			(?X_E (?X_I ((ADV-A (AROUND.P ?X_F)) BE.V)))
			(?X_B
	   (?X_C
	    (HOME.ADV
	     (INSTEAD.ADV
	      ((ADV-A (TO.P ?L2))
	       ((ADV-A (FROM.P ?X_F)) ((ADV-A (FOR.P ?L2)) GO.4.V)))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H BEFORE ?X_E))
			(!W2 (?X_E BEFORE ?X_B))
		)
	)
	(
			"A line is long too far."
			"A line is around a corner."
			"A agent go.105s L2 home instead to L2 from a corner for L2."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-91.PR (K BAD.A) ?X_C ?X_I) ** ?E)
		(:ROLES
			(!R1 (?X_F FRIEND.N))
			(!R2 (?X_I TRY.N))
		)
		(:STEPS
			(?X_E (?X_B (FEEL.V (K BAD.A))))
			(?X_H
	   (?X_F
	    ((ADV-A (FOR.P (KA (DRINK.V (K (L X (AND (X MORE.A) (X WATER.N))))))))
	     SUGGEST.V)))
			(?X_K (?X_B (GIVE.V ?X_C ?X_I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_H)))
			(!W2 (?X_E (BEFORE ?X_K)))
			(!W3 (?X_H (BEFORE ?X_K)))
		)
	)
	(
			"X_B feels bad."
			"A friend suggests for drinking more water."
			"X_B gives X_C a try."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (IN.P ?X_A))
	               ((ADV-A (TO.P ?X_F))
	                ((ADV-A (FROM.P ?X_D)) ((ADV-A (FOR.P ?X_F)) SWIM.1.V))))
	              ?X_F)
	             ** ?X_H)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_D PARK.N))
			(!R3 (?X_F END.N))
			(!R4 (NOT (?X_D = ?X_F)))
			(!R5 (?X_A LAKE.N))
			(!R6 (?X_B DOG.N))
			(!R7 (?X_B (PERTAIN-TO ?X_E)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?X_F)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?X_D)))
			(?I2 (NOT (?X_E (AT.P ?X_F))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P ?X_D))))
			(?P2 (?X_E (AT.P ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_H))
			(!W2 (?I2 BEFORE ?X_H))
			(!W3 (?P1 AFTER ?X_H))
			(!W4 (?P2 AFTER ?X_H))
			(!W5 (?G1 CAUSE-OF ?X_H))
			(!W6 (?X_H (DURING ?X_I)))
			(!W7 (?X_G (DURING ?X_I)))
			(!W8 (?X_G (CONSEC ?X_H)))
			(!W9 (?X_I (AT-ABOUT ?X_K)))
			(!W10 (?X_J (BEFORE ?X_K)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (IN.P ?X_A))
	               ((ADV-A (TO.P ?X_F))
	                ((ADV-A (FROM.P ?X_D)) ((ADV-A (FOR.P ?X_F)) SWIM.2.V))))
	              ?X_F)
	             ** ?X_H)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_D END.N))
			(!R3 (?X_F PARK.N))
			(!R4 (NOT (?X_D = ?X_F)))
			(!R5 (?X_A LAKE.N))
			(!R6 (?X_B (PERTAIN-TO ?X_E)))
			(!R7 (?X_B DOG.N))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?X_F)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?X_D)))
			(?I2 (NOT (?X_E (AT.P ?X_F))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P ?X_D))))
			(?P2 (?X_E (AT.P ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_H))
			(!W2 (?I2 BEFORE ?X_H))
			(!W3 (?P1 AFTER ?X_H))
			(!W4 (?P2 AFTER ?X_H))
			(!W5 (?G1 CAUSE-OF ?X_H))
			(!W6 (?X_H (DURING ?X_I)))
			(!W7 (?X_G (DURING ?X_I)))
			(!W8 (?X_G (CONSEC ?X_H)))
			(!W9 (?X_I (AT-ABOUT ?X_K)))
			(!W10 (?X_J (BEFORE ?X_K)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (THROUGH.P ?X_A))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?X_D)) ((ADV-A (FOR.P ?L2)) RUN.10.V))))
	              ?L2)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_D END.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_D = ?L2)))
			(!R5 (?X_A PARK.N))
			(!R6 (?X_C (PERTAIN-TO ?X_E)))
			(!R7 (?X_C DOG.N))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?X_D)))
			(?I2 (NOT (?X_E (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P ?X_D))))
			(?P2 (?X_E (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_R COMPOSITE-SCHEMA-92.PR (KA ((ADV-A (WITH.P ?X_Q)) PLAY.V))
	              (K CATCH.N)
	              (K (L X (AND (X TO.P) (X ((ADV-A (IN.P ?X_G)) SWIM.V))))) ?X_U
	              ?X_P ?L2)
	             ** ?E)
		(:ROLES
			(!R1 (?X_G LAKE.N))
			(!R2 (?X_J (RIGHT-AFTER ?X_K)))
			(!R3 (?X_Q DOG.N))
			(!R4 (?X_P PARK.N))
			(!R5 (?X_Q (PERTAIN-TO ?X_R)))
			(!R6 (?X_U END.N))
		)
		(:STEPS
			(?X_M (?X_R ((ADV-A (WITH.P ?X_Q)) PLAY.V)))
			(?X_J (?X_R (LOVE.V (KA ((ADV-A (WITH.P ?X_Q)) PLAY.V)))))
			(?X_I (?X_A (PLAY.V (K CATCH.N))))
			(?X_F
	   (?X_R (LOVE.V (K (L X (AND (X TO.P) (X ((ADV-A (IN.P ?X_G)) SWIM.V))))))))
			(?X_O
	   (?X_R
	    ((ADV-A (THROUGH.P ?X_P))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?X_U)) ((ADV-A (FOR.P ?L2)) RUN.10.V))))
	    ?L2))
			(?X_C (?X_R TO.P))
			(?X_D
	   (?X_R
	    ((ADV-A (IN.P ?X_G))
	     ((ADV-A (TO.P ?X_U))
	      ((ADV-A (FROM.P ?X_P)) ((ADV-A (FOR.P ?X_U)) SWIM.1.V))))
	    ?X_U))
			(?X_D
	   (?X_R
	    ((ADV-A (IN.P ?X_G))
	     ((ADV-A (TO.P ?X_P))
	      ((ADV-A (FROM.P ?X_U)) ((ADV-A (FOR.P ?X_P)) SWIM.2.V))))
	    ?X_P))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_C)))
			(!W2 (?X_O (BEFORE ?X_D)))
			(!W3 (?X_C (BEFORE ?X_D)))
			(!W4 (?X_M BEFORE ?X_J))
			(!W5 (?X_J BEFORE ?X_I))
			(!W6 (?X_I BEFORE ?X_F))
		)
	)
	(
			"X_R plays with a dog of X_R."
			"X_R loves with a dog of X_R playing."
			"X_A plays catch."
			"X_R loves to swimming."
			"X_R run.114s L2 through a park to L2 from a end for L2."
			"X_R is to."
			"X_R swim.112s a end in a lake to a end from a park for a end."
			"X_R swim.113s a park in a lake to a park from a end for a park."
	)
)



(
	(EPI-SCHEMA (((K SUSIE.N) COMPOSITE-SCHEMA-93.PR ?X_C) ** ?E)
		(:ROLES
			(!R1 (?X_C CD.N))
			(!R2 (?X_C (PERTAIN-TO (K SUSIE.N))))
			(!R3 (?X_D (RIGHT-AFTER ?X_E)))
		)
		(:STEPS
			(?X_B ((K SUSIE.N) (AT.P ?X_C)))
			(?X_D ((K SUSIE.N) ((ADV-A (AT.P ?X_C)) LOOK.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_D)))
		)
	)
	(
			"Susie is at."
			"Susie looks at a cd of susie."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (AT.P ?X_B))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.9.V))))
	              ?L2)
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B HEN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B CAT.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_C (AFTER ?X_D)))
			(!W7 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-94.PR ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_A CAT.N))
			(!R2 (?X_A HEN.N))
		)
		(:STEPS
			(E219.SK
	   (?X_A
	    ((ADV-A (AT.P ?X_A))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.9.V))))
	    ?L2))
		)
	)
	(
			"A cat hen run.126s L2 at a cat hen to L2 from L1 for L2."
	)
)



(
	(EPI-SCHEMA (((EVERY.D PERSON.N) COMPOSITE-SCHEMA-95.PR (KA |5.2.2.V|)) ** ?E)
		(:ROLES
			(!R1 (?X_C WIND.N))
			(!R2 (?X_F STORM.N))
			(!R3 (?X_I (IMPINGES-ON ?X_G)))
			(!R4 (?X_L POWER.N))
		)
		(:STEPS
			(?X_E (?X_C HOWL.V))
			(?X_I (?X_F (JUST.ADV (HAVE.V (KA |5.2.2.V|)))))
			(?X_K
	   ((EVERY.D PERSON.N)
	    ((ADV-A (FOR.P (KA (GET.V (L X (AND (X OUT.P) (X (OF.P ?X_B))))))))
	     (INSIDE.ADV RUN.V))))
			(?X_N (?X_L (OUT.PRT GO.V)))
			(?X_P ((EVERY.D PERSON.N) ((ADV-A (FOR.P (KA HIDE.V))) (DOWN.PRT HUNKER.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_I)))
			(!W2 (?X_E (BEFORE ?X_K)))
			(!W3 (?X_E (BEFORE ?X_N)))
			(!W4 (?X_E (BEFORE ?X_P)))
			(!W5 (?X_I (BEFORE ?X_K)))
			(!W6 (?X_I (BEFORE ?X_N)))
			(!W7 (?X_I (BEFORE ?X_P)))
			(!W8 (?X_K (BEFORE ?X_N)))
			(!W9 (?X_K (BEFORE ?X_P)))
			(!W10 (?X_N (BEFORE ?X_P)))
		)
	)
	(
			"A wind howls."
			"A storm has 5.2.2inging just."
			"Every person runs for getting out of inside."
			"A power goes out."
			"Every person hunkers for hiding down."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-96.PR (KA ((ADV-A (ON.P ?X_E)) RIDE.V))
	              (KA ((ADV-A (IN.P ?X_H)) PLAY.V)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E SLED.A))
			(!R2 (?X_E NEW.A))
			(!R3 (?X_E SLED.N))
			(!R4 (?X_D (HAS.V ?X_E)))
			(!R5 (?X_H WHITE.A))
			(!R6 (?X_H SNOW.N))
		)
		(:STEPS
			(?X_G (?X_A (LIKE.V (KA ((ADV-A (ON.P ?X_E)) RIDE.V)))))
			(?X_J
	   ((K (L X (AND (X BABY.N) (X ?X_C))))
	    (LIKE.V (KA ((ADV-A (IN.P ?X_H)) PLAY.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_J)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (FROM.P (K OUTSIDE.N)))
	               (IN.PRT
	                ((ADV-A (TO.P ?L2))
	                 ((ADV-A (FROM.P (K OUTSIDE.N)))
	                  ((ADV-A (FOR.P ?L2)) COME.3.V)))))
	              ?L2)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E SON.N))
			(!R2 ((K OUTSIDE.N) LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT ((K OUTSIDE.N) = ?L2)))
			(!R5 (?X_B CHILD.N))
			(!R6 (?X_B LITTLE.A))
			(!R7 (?X_E (IS.V ?X_B)))
			(!R8 (?X_E (PERTAIN-TO ?X_C)))
			(!R9 (?X_C AGENT.N))
			(!R10 (?X_D (PERTAIN-TO ?X_E)))
			(!R11 (?X_D FRIEND.N))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P (K OUTSIDE.N))))
			(?I2 (NOT (?X_E (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P (K OUTSIDE.N)))))
			(?P2 (?X_E (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (FROM.P (K OUTSIDE.N)))
	               (IN.PRT
	                ((ADV-A (TO.P ?L2))
	                 ((ADV-A (FROM.P (K OUTSIDE.N)))
	                  ((ADV-A (FOR.P ?L2)) COME.4.V)))))
	              ?L2)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E SON.N))
			(!R2 ((K OUTSIDE.N) LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT ((K OUTSIDE.N) = ?L2)))
			(!R5 (?X_B LITTLE.A))
			(!R6 (?X_B CHILD.N))
			(!R7 (?X_E (IS.V ?X_B)))
			(!R8 (?X_C FRIEND.N))
			(!R9 (?X_C (PERTAIN-TO ?X_E)))
			(!R10 (?X_D AGENT.N))
			(!R11 (?X_E (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P (K OUTSIDE.N))))
			(?I2 (NOT (?X_E (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P (K OUTSIDE.N)))))
			(?P2 (?X_E (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (FROM.P (K OUTSIDE.N)))
	               (IN.PRT
	                ((ADV-A (TO.P ?L2))
	                 ((ADV-A (FROM.P (K OUTSIDE.N)))
	                  ((ADV-A (FOR.P ?L2)) COME.5.V)))))
	              ?L2)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E SON.N))
			(!R2 ((K OUTSIDE.N) LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT ((K OUTSIDE.N) = ?L2)))
			(!R5 (?X_B AGENT.N))
			(!R6 (?X_E (PERTAIN-TO ?X_B)))
			(!R7 (?X_C LITTLE.A))
			(!R8 (?X_C CHILD.N))
			(!R9 (?X_E (IS.V ?X_C)))
			(!R10 (?X_D FRIEND.N))
			(!R11 (?X_D (PERTAIN-TO ?X_E)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P (K OUTSIDE.N))))
			(?I2 (NOT (?X_E (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P (K OUTSIDE.N)))))
			(?P2 (?X_E (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_K COMPOSITE-SCHEMA-97.PR ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_K SON.N))
			(!R2 (?X_H AGENT.N))
			(!R3 (?X_K (PERTAIN-TO ?X_H)))
			(!R4 (?X_I LITTLE.A))
			(!R5 (?X_I CHILD.N))
			(!R6 (?X_K (IS.V ?X_I)))
			(!R7 (?X_J FRIEND.N))
			(!R8 (?X_J (PERTAIN-TO ?X_K)))
		)
		(:STEPS
			(?X_G (?X_K ((ADV-A (FOR.P (KA PLAY.V))) (OUTSIDE.ADV RUN.V))))
			(?X_E (?X_A (TOGETHER.ADV ((ADV-A (WITH.P (K (PLUR STICK.N)))) PLAY.V))))
			(?X_C
	   (?X_K
	    ((ADV-A (FROM.P (K OUTSIDE.N)))
	     (IN.PRT
	      ((ADV-A (TO.P ?L2))
	       ((ADV-A (FROM.P (K OUTSIDE.N))) ((ADV-A (FOR.P ?L2)) COME.3.V)))))
	    ?L2))
			(?X_C
	   (?X_K
	    ((ADV-A (FROM.P (K OUTSIDE.N)))
	     (IN.PRT
	      ((ADV-A (TO.P ?L2))
	       ((ADV-A (FROM.P (K OUTSIDE.N))) ((ADV-A (FOR.P ?L2)) COME.4.V)))))
	    ?L2))
			(?X_C
	   (?X_K
	    ((ADV-A (FROM.P (K OUTSIDE.N)))
	     (IN.PRT
	      ((ADV-A (TO.P ?L2))
	       ((ADV-A (FROM.P (K OUTSIDE.N))) ((ADV-A (FOR.P ?L2)) COME.5.V)))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G BEFORE ?X_E))
			(!W2 (?X_E BEFORE ?X_C))
		)
	)
	(
			"A son of a agent is a little child runs for playing outside."
			"X_A plays together with sticks."
			"A son of a agent is a little child come.143s L2 from outside in to L2 from outside for L2."
			"A son of a agent is a little child come.145s L2 from outside in to L2 from outside for L2."
			"A son of a agent is a little child come.146s L2 from outside in to L2 from outside for L2."
	)
)



(
	(EPI-SCHEMA ((?X_B MAKE.7.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B SINGER.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?X_C ALBUM.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C EXIST.V)))))
			(?G2 (?X_B (WANT.V (KA (HAVE.V ?X_C)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C EXIST.V))
			(?P2 (?X_B (HAVE.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B GET.21.V (K BETTER.A)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B SINGER.N))
			(!R2 ((K BETTER.A) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K BETTER.A))))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V (K BETTER.A)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (K BETTER.A))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((K BETTER.A) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (K BETTER.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
			(!W6 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_M COMPOSITE-SCHEMA-98.PR ?X_M ?X_F (K BETTER.A)) ** ?E)
		(:ROLES
			(!R1 (?X_C (PLUR PERSON.N)))
			(!R2 (?X_F ALBUM.N))
			(!R3 (?X_M SINGER.N))
		)
		(:STEPS
			(?X_L (?X_M (HARD.ADV WORK.V)))
			(?X_H ((K (PLUR PERSON.N)) (NOTICE.V ?X_M)))
			(?X_B (?X_C (BUY.V ?X_F)))
			(?X_J (?X_M GET.21.V (K BETTER.A)))
			(?X_E (?X_M MAKE.7.V ?X_F))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_E)))
			(!W2 (?X_L BEFORE ?X_H))
			(!W3 (?X_H BEFORE ?X_B))
		)
	)
	(
			"A singer works hard."
			"Persons notice a singer."
			"A persons buy a album."
			"A singer get.178s better."
			"A singer make.174s a album."
	)
)



(
	(EPI-SCHEMA ((?X_E FIND.10.V ?X_F) ** ?X_I)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_E (PLUR PARENT.N)))
			(!R4 (?X_F LOST.A))
			(!R5 (?X_F GIRL.N))
			(!R6 (?X_A (PERTAIN-TO ?X_E)))
			(!R7 (?X_A HOME.N))
			(!R8 (?X_C (PLUR FRIEND.N)))
			(!R9 (?X_C (PERTAIN-TO ?X_F)))
			(!R10 (?X_G (RIGHT-AFTER ?X_D)))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?L)))
			(?I2 (?X_F (AT.P ?L)))
			(?I3 (?X_E ((ADV-A (FOR.P ?X_F)) SEARCH.V)))
			(?I4 (NOT (?X_E (KNOW.V (THAT (?X_F (AT.P ?L)))))))
			(?I5 (NOT (?X_E (HAVE.V ?X_F))))
		)
		(:POSTCONDS
			(?P1 (?X_E (KNOW.V (THAT (?X_F (AT.P ?L))))))
			(?P2 (?X_E (HAVE.V ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I3 BEFORE ?X_I))
			(!W2 (?X_I (BEFORE ?X_H)))
			(!W3 (?X_G (SAME-TIME ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?I3) = ?X_I))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E ((ADV-A (IN.P ?X_A)) FIND.11.V) ?X_F) ** ?X_I)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_E (PLUR PARENT.N)))
			(!R4 (?X_F LOST.A))
			(!R5 (?X_F GIRL.N))
			(!R6 (?X_A (PERTAIN-TO ?X_E)))
			(!R7 (?X_A HOME.N))
			(!R8 (?X_B (PERTAIN-TO ?X_F)))
			(!R9 (?X_B (PLUR FRIEND.N)))
			(!R10 (?X_I (RIGHT-AFTER ?X_C)))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?L)))
			(?I2 (?X_F (AT.P ?L)))
			(?I3 (?X_E ((ADV-A (FOR.P ?X_F)) SEARCH.V)))
			(?I4 (NOT (?X_E (KNOW.V (THAT (?X_F (AT.P ?L)))))))
			(?I5 (NOT (?X_E (HAVE.V ?X_F))))
		)
		(:POSTCONDS
			(?P1 (?X_E (KNOW.V (THAT (?X_F (AT.P ?L))))))
			(?P2 (?X_E (HAVE.V ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I3 BEFORE ?X_I))
			(!W2 (?X_I (SAME-TIME ?X_H)))
			(!W3 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?I3) = ?X_I))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E ((ADV-A (IN.P ?X_A)) FIND.12.V) ?X_F) ** ?X_I)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_E (PLUR PARENT.N)))
			(!R4 (?X_F LOST.A))
			(!R5 (?X_F GIRL.N))
			(!R6 (?X_A (PERTAIN-TO ?X_E)))
			(!R7 (?X_A HOME.N))
			(!R8 (?X_I (RIGHT-AFTER ?X_B)))
			(!R9 (?X_C (PLUR FRIEND.N)))
			(!R10 (?X_C (PERTAIN-TO ?X_F)))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?L)))
			(?I2 (?X_F (AT.P ?L)))
			(?I3 (?X_E ((ADV-A (FOR.P ?X_F)) SEARCH.V)))
			(?I4 (NOT (?X_E (KNOW.V (THAT (?X_F (AT.P ?L)))))))
			(?I5 (NOT (?X_E (HAVE.V ?X_F))))
		)
		(:POSTCONDS
			(?P1 (?X_E (KNOW.V (THAT (?X_F (AT.P ?L))))))
			(?P2 (?X_E (HAVE.V ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I3 BEFORE ?X_I))
			(!W2 (?X_I (SAME-TIME ?X_H)))
			(!W3 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?I3) = ?X_I))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_F COMPOSITE-SCHEMA-99.PR ?X_O) ** ?E)
		(:ROLES
			(!R1 (?X_E HOME.N))
			(!R2 (?X_F (PLUR PARENT.N)))
			(!R3 (?X_E (PERTAIN-TO ?X_F)))
			(!R4 (?X_I STREET.N))
			(!R5 (?X_L (RIGHT-AFTER ?X_M)))
			(!R6 (?X_N (PLUR FRIEND.N)))
			(!R7 (?X_O GIRL.N))
			(!R8 (?X_O LOST.A))
			(!R9 (?X_N (PERTAIN-TO ?X_O)))
			(!R10 (?X_P (RIGHT-AFTER ?X_Q)))
		)
		(:STEPS
			(?X_L (?X_O ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_N)) PLAY.V)))) GO.V)))
			(?X_K (?X_O ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_N)) PLAY.V)))) GO.V)))
			(?X_H (?X_O ((ADV-A (ACROSS.P ?X_I)) GO.V)))
			(?X_D (?X_F ((ADV-A (FOR.P (KA (GET.V ?X_O)))) (OVER.PRT GO.V))))
			(?X_B (?X_F FIND.10.V ?X_O))
			(?X_P (?X_F ((ADV-A (IN.P ?X_E)) FIND.11.V) ?X_O))
			(?X_P (?X_F ((ADV-A (IN.P ?X_E)) FIND.12.V) ?X_O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_P)))
			(!W2 (?X_L BEFORE ?X_K))
			(!W3 (?X_K BEFORE ?X_H))
			(!W4 (?X_H BEFORE ?X_D))
		)
	)
	(
			"A girl lost goes for with a friends of a girl lost playing."
			"A girl lost goes for with a friends of a girl lost playing."
			"A girl lost goes across a street."
			"A parents go for getting a girl lost over."
			"A parents find.189 a girl lost."
			"A parents find.192 a girl lost in a home of a parents."
			"A parents find.195 a girl lost in a home of a parents."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.22.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C (PLUR SCISSOR.N)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-100.PR ?X_I (K GREAT.A) ?X_H) ** ?E)
		(:ROLES
			(!R1 (?X_H (PLUR SCISSOR.N)))
			(!R2 (?X_I LOT.N))
			(!R3 (?X_I (OF.P (K (L X (AND (X SPLIT.A) (X (PLUR END.N))))))))
		)
		(:STEPS
			(E5.SK (?X_A (HAVE.V ?X_I)))
			(?X_E (?X_A (THEN.ADV (OFF.ADV (CUT.V ?X_I)))))
			(?X_C (?X_A (THEN.ADV (LOOK.V (K GREAT.A)))))
			(?X_G (?X_A GET.22.V ?X_H))
		)
		(:EPISODE-RELATIONS
			(!W1 (E5.SK BEFORE ?X_E))
			(!W2 (?X_E BEFORE ?X_C))
			(!W3 (?X_C BEFORE ?X_G))
		)
	)
	(
			"X_A has a lot of split end."
			"X_A cuts a lot of split end then off."
			"X_A looks great then."
			"X_A get.2s a scissors."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (UP.PRT
	               ((ADV-A (TO.P ?X_D))
	                ((ADV-A (FROM.P ?X_B)) ((ADV-A (FOR.P ?X_D)) WALK.5.V))))
	              ?X_D)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C PERSON.N))
			(!R2 (?X_B SIDE.N))
			(!R3 (?X_D LOCATION.N))
			(!R4 (NOT (?X_B = ?X_D)))
			(!R5 (?X_D HILL.N))
			(!R6 (?X_B HILL.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?X_D)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?X_B)))
			(?I2 (NOT (?X_C (AT.P ?X_D))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?X_B))))
			(?P2 (?X_C (AT.P ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_L COMPOSITE-SCHEMA-101.PR ?X_L ?X_A ?X_F) ** ?E)
		(:ROLES
			(!R1 (?X_F HILL.N))
			(!R2 (?X_G PERSON.N))
			(!R3 (?X_L ROCK.N))
			(!R4 (?X_M BOY.N))
			(!R5 (?X_N HILL.N))
			(!R6 (?X_N SIDE.N))
		)
		(:STEPS
			(?X_K (?X_M (KICK.V ?X_L)))
			(?X_I (?X_L (LOOSE.ADV COME.V)))
			(?X_C (?X_L (ALMOST.ADV (HIT.V ?X_A))))
			(?X_E
	   (?X_G
	    (UP.PRT
	     ((ADV-A (TO.P ?X_F))
	      ((ADV-A (FROM.P ?X_N)) ((ADV-A (FOR.P ?X_F)) WALK.5.V))))
	    ?X_F))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K BEFORE ?X_I))
			(!W2 (?X_I BEFORE ?X_C))
			(!W3 (?X_C BEFORE ?X_E))
		)
	)
	(
			"A boy kicks a rock."
			"A rock comes loose."
			"A rock hits X_A almost."
			"A person walk.22s a hill up to a hill from a hill side for a hill."
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (AS.P ?X_A)) (HOME.ADV TAKE.18.V)) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E SAD.A))
			(!R6 (?X_E PUPPY.N))
			(!R7 (?X_A (K NEW.A) PET.N))
			(!R8 (?X_A (PERTAIN-TO ?X_D)))
			(!R9 (?X_F (RIGHT-AFTER ?X_B)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (SAME-TIME ?X_H)))
			(!W7 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (AS.P ?X_A)) (HOME.ADV TAKE.19.V)) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E SAD.A))
			(!R6 (?X_E PUPPY.N))
			(!R7 (?X_A (PERTAIN-TO ?X_D)))
			(!R8 (?X_A (K NEW.A) PET.N))
			(!R9 (?X_G (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (BEFORE ?X_H)))
			(!W7 (?X_G (SAME-TIME ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (AS.P ?X_B)) (HOME.ADV TAKE.20.V)) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E SAD.A))
			(!R6 (?X_E PUPPY.N))
			(!R7 (?X_B (PERTAIN-TO ?X_D)))
			(!R8 (?X_B (K NEW.A) PET.N))
			(!R9 (?X_G (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (BEFORE ?X_H)))
			(!W7 (?X_G (SAME-TIME ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-102.PR ?X_C
	              (KA ((ADV-A (TO.P (K SCHOOL.N))) GO.V)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C MORNING.N))
		)
		(:STEPS
			(?X_E (?X_A (((ADV-A (TO.P (K SCHOOL.N))) GO.V) ?X_C)))
			(?X_G (?X_B (LIKE.V (KA ((ADV-A (TO.P (K SCHOOL.N))) GO.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_G)))
		)
	)
	(
			"X_A goes a morning to school."
			"X_B likes to school going."
	)
)



(
	(EPI-SCHEMA ((?X_C FIND.13.V ?X_D) ** ?X_F)
		(:ROLES
			(!R1 (?X_C COW.N))
			(!R2 (?X_B FIELD.N))
			(!R3 (?X_D (OF.P (K GRASS.N))))
			(!R4 (?X_D GRASS.N))
			(!R5 (?X_D SPOT.N))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?X_B)))
			(?I2 (?X_D (AT.P ?X_B)))
			(?I3 (?X_C ((ADV-A (FOR.P ?X_D)) SEARCH.V)))
			(?I4 (NOT (?X_C (KNOW.V (THAT (?X_D (AT.P ?X_B)))))))
			(?I5 (NOT (?X_C (HAVE.V ?X_D))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V (THAT (?X_D (AT.P ?X_B))))))
			(?P2 (?X_C (HAVE.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I3 BEFORE ?X_F))
			(!W2 (?X_F (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?I3) = ?X_F))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (FOR.P ?X_D))
	               ((ADV-A (FROM.P ?X_B)) ((ADV-A (TO.P ?X_D)) LEAVE.1.V)))
	              ?X_D)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C COW.N))
			(!R2 (?X_B FIELD.N))
			(!R3 (?X_D LOCATION.N))
			(!R4 (NOT (?X_B = ?X_D)))
			(!R5 (?X_D BARN.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?X_D)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?X_B)))
			(?I2 (NOT (?X_C (AT.P ?X_D))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?X_B))))
			(?P2 (?X_C (AT.P ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (TO.P ?X_C))
	               (OUT.ADV
	                ((ADV-A (TO.P ?X_C))
	                 ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_C)) GO.12.V)))))
	              ?X_C)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B COW.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C FIELD.N))
			(!R4 (NOT (?L1 = ?X_C)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?X_C))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_M COMPOSITE-SCHEMA-103.PR ?X_E ?X_L ?X_I) ** ?E)
		(:ROLES
			(!R1 (?X_E SPOT.N))
			(!R2 (?X_E (OF.P (K GRASS.N))))
			(!R3 (?X_E GRASS.N))
			(!R4 (?X_F OTHER.A))
			(!R5 (?X_F (PLUR COW.N)))
			(!R6 (?X_I FIELD.N))
			(!R7 (?X_L BARN.N))
			(!R8 (?X_M COW.N))
		)
		(:STEPS
			(E91.SK (?X_F OUT.P))
			(E92.SK (?X_F (IN.P ?X_I)))
			(?X_B (?X_M (EAT.V ?X_E)))
			(?X_K
	   (?X_M
	    ((ADV-A (FOR.P ?X_L))
	     ((ADV-A (FROM.P ?X_I)) ((ADV-A (TO.P ?X_L)) LEAVE.1.V)))
	    ?X_L))
			(?X_H
	   (?X_M
	    ((ADV-A (TO.P ?X_I))
	     (OUT.ADV
	      ((ADV-A (TO.P ?X_I))
	       ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_I)) GO.12.V)))))
	    ?X_I))
			(?X_D (?X_M FIND.13.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_H)))
			(!W2 (?X_K (BEFORE ?X_D)))
			(!W3 (?X_H (BEFORE ?X_D)))
			(!W4 (E91.SK BEFORE E92.SK))
			(!W5 (E92.SK BEFORE ?X_B))
		)
	)
	(
			"A other cows is out."
			"A other cows is in."
			"A cow eats a spot of grass grass."
			"A cow leave.57s a barn for a barn from a field to a barn."
			"A cow go.58s a field to a field out to a field from L1 for a field."
			"A cow find.67s a spot of grass grass."
	)
)



(
	(EPI-SCHEMA (((K TODAY.N) COMPOSITE-SCHEMA-104.PR ?X_C) ** ?E)
		(:ROLES
			(!R1 (?X_B (SET-OF AGENT.N)))
			(!R2 (?X_C STORM.N))
			(!R3 (?X_F LONG.A))
			(!R4 (?X_F TIME.N))
			(!R5 (?X_I WIND.N))
		)
		(:STEPS
			(?X_E ((K TODAY.N) ?X_B (HAVE.V ?X_C)))
			(?X_H (?X_A ((ADV (VERY.ADV HARD.A)) ((ADV-A (FOR.P ?X_F)) RAIN.V))))
			(?X_K (?X_I (LOUDLY.ADV BLOW.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_H)))
			(!W2 (?X_E (BEFORE ?X_K)))
			(!W3 (?X_H (BEFORE ?X_K)))
		)
	)
	(
			"Today has a storm."
			"X_A rains ADV very hard for a long time."
			"A wind blows loudly."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-105.PR
	              (KA ((ADV-A (WITH.P (ALL.D (PLUR CHILD.N)))) PLAY.V)))
	             ** ?E)
		(:STEPS
			(?X_C (?X_A (LIKE.V (KA ((ADV-A (WITH.P (ALL.D (PLUR CHILD.N)))) PLAY.V)))))
		)
	)
	(
			"X_A likes with all childs playing."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.23.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_E (CONSEC ?X_D)))
			(!W7 (?X_D (AT-ABOUT ?X_F)))
			(!W8 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B GET.24.V ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_D (CONSEC ?X_E)))
			(!W7 (?X_D (AT-ABOUT ?X_F)))
			(!W8 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C COMPOSITE-SCHEMA-106.PR ?X_G ?X_D) ** ?E)
		(:ROLES
			(!R1 (?X_G TREE.N))
		)
		(:STEPS
			(?X_K (?X_A (K (PLUR EGG.N)) ((ADV-A (IN.P ?X_B)) HAVE.V)))
			(?X_F (?X_C ((UP.PRT GO.V) ?X_G)))
			(?X_I (?X_C GET.23.V ?X_D))
			(?X_I (?X_C GET.24.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_I)))
		)
	)
	(
			"X_A has in X_B."
			"X_C goes a tree up."
			"X_C get.98s X_D."
			"X_C get.99s X_D."
	)
)



(
	(EPI-SCHEMA ((?X_M COMPOSITE-SCHEMA-107.PR ?X_N ?X_K ?X_L ?X_O) ** ?E)
		(:ROLES
			(!R1 (?X_N HAND.N))
			(!R2 (?X_A (RIGHT-AFTER ?X_B)))
			(!R3 (?X_K BAT.N))
			(!R4 (?X_C (RIGHT-AFTER ?X_D)))
			(!R5 (?X_L BLACK.A))
			(!R6 (?X_L HAT.N))
			(!R7 (?X_G AGENT.N))
			(!R8 (?X_P (PERTAIN-TO ?X_G)))
			(!R9 (?X_M BOY.N))
			(!R10 (?X_M (HAS.V ?X_J)))
			(!R11 (?X_J (PERTAIN-TO ?X_M)))
			(!R12 (?X_K (PERTAIN-TO ?X_M)))
			(!R13 (?X_N (PERTAIN-TO ?X_M)))
			(!R14 (?X_L (IS.V ?X_M)))
			(!R15 (?X_O BLACK.A))
			(!R16 (?X_O BAT.N))
			(!R17 (?X_O (PERTAIN-TO ?X_M)))
			(!R18 (?X_O (IN.P ?X_N)))
			(!R19 (?X_O (IS.V ?X_P)))
			(!R20 (?X_Q (RIGHT-AFTER ?X_R)))
		)
		(:STEPS
			(?X_A (?X_K (IN.P ?X_N)))
			(?X_C (?X_M (HAS.V ?X_K)))
			(?X_F (?X_M (HAVE.V ?X_L)))
			(?X_I (?X_G (HAVE.V ?X_O)))
			(?X_Q (?X_M (HAS.V ?X_O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_C)))
			(!W2 (?X_A (BEFORE ?X_F)))
			(!W3 (?X_A (BEFORE ?X_I)))
			(!W4 (?X_A (BEFORE ?X_Q)))
			(!W5 (?X_C (BEFORE ?X_F)))
			(!W6 (?X_C (BEFORE ?X_I)))
			(!W7 (?X_C (BEFORE ?X_Q)))
			(!W8 (?X_F (BEFORE ?X_I)))
			(!W9 (?X_F (BEFORE ?X_Q)))
			(!W10 (?X_I (BEFORE ?X_Q)))
		)
	)
	(
			"A bat of a boy has a of a boy has X_J is in."
			"A boy has a of a boy has X_J has a bat of a boy has a of a boy has X_J."
			"A boy has a of a boy has X_J has a black hat is a boy has a of a boy has X_J."
			"A agent has a black bat is a of a agent of a boy has X_J in a hand of a boy has X_J."
			"A boy has a of a boy has X_J has a black bat is a of a agent of a boy has X_J in a hand of a boy has X_J."
	)
)



(
	(EPI-SCHEMA ((?X_F COMPOSITE-SCHEMA-108.PR (K (VERY.ADV WET.A))) ** ?E)
		(:ROLES
			(!R1 (?X_A RAIN.N))
			(!R2 (?X_F (PLUR KID.N)))
		)
		(:STEPS
			(?X_C (?X_F (OUT.ADV ((ADV-A (IN.P ?X_A)) GO.V))))
			(?X_E (?X_F (BECOME.V (K (VERY.ADV WET.A)))))
			(?X_H (?X_F ((ADV (BACK.ADV INSIDE.A)) GO.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_H)))
			(!W3 (?X_E (BEFORE ?X_H)))
		)
	)
	(
			"A kids go out in a rain."
			"A kids become very wet."
			"A kids goes ADV back inside."
	)
)



(
	(EPI-SCHEMA ((?X_C (OUT.PRT GET.25.V) (KA (SEE.V ?X_D))) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 ((KA (SEE.V ?X_D)) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = (KA (SEE.V ?X_D)))))
			(!R5 (?X_D DEAD.A))
			(!R6 (?X_D DOG.N))
			(!R7 (?X_C (HOME.ADV DRIVE.V)))
			(!R8 (?X_C (SAD.A (KE (?X_C (KILL.V ?X_D))))))
			(!R9 (?X_B ROAD.N))
			(!R10 (?X_D (IN.P ?X_B)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V (KA (SEE.V ?X_D))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V (KA (SEE.V ?X_D)))))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 ((KA (SEE.V ?X_D)) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V (KA (SEE.V ?X_D))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E COMPOSITE-SCHEMA-109.PR ?X_F (KA (SEE.V ?X_F))) ** ?E)
		(:ROLES
			(!R1 (?X_F DEAD.A))
			(!R2 (?X_F DOG.N))
			(!R3 (?X_E (HOME.ADV DRIVE.V)))
			(!R4 (?X_E (SAD.A (KE (?X_E (KILL.V ?X_F))))))
			(!R5 (?X_G ROAD.N))
			(!R6 (?X_F (IN.P ?X_G)))
		)
		(:STEPS
			(?X_D (?X_E (HIT.V ?X_F)))
			(?X_B (?X_E (OUT.PRT GET.25.V) (KA (SEE.V ?X_F))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D BEFORE ?X_B))
		)
	)
	(
			"A home drive sad a home drive sad X_E kills a dead dog in X_G kills a dead dog in a road hits a dead dog in a road."
			"A home drive sad a home drive sad X_E kills a dead dog in X_G kills a dead dog in a road get.145s seeing a dead dog in a road out."
	)
)



(
	(EPI-SCHEMA ((?X_C DREAM.1.V ?O) ** ?X_D)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?X_C (PERTAIN-TO ?X_B)))
			(!R4 (?X_B AGENT.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?O EXIST.V)))))
			(?G2 (?X_C (WANT.V (KA (HAVE.V ?O)))))
		)
		(:PRECONDS
			(?I1 (NOT (?O EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?O EXIST.V))
			(?P2 (?X_C (HAVE.V ?O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-110.PR ?X_C ?O) ** ?E)
		(:ROLES
			(!R1 (?X_C BARK.N))
			(!R2 (?X_F FLOOR.N))
			(!R3 (?X_I DOG.N))
			(!R4 (?X_J AGENT.N))
			(!R5 (?X_I (PERTAIN-TO ?X_J)))
		)
		(:STEPS
			(?X_E (?X_I ((ADV-A (ON.P ?X_F)) LIE.V)))
			(?X_B (?X_I ((OUT.PRT LET.V) ?X_C)))
			(?X_H (?X_I DREAM.1.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A dog of a agent lies on a floor."
			"A dog of a agent lets a bark out."
			"A dog of a agent dream.163s O."
	)
)



(
	(EPI-SCHEMA ((?X_B (OUTSIDE.ADV TAKE.21.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B WATCH.4.V (K (PLUR BIRD.N))) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((K (PLUR BIRD.N)) ENTITY.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?I PERTAIN-TO (K (PLUR BIRD.N))))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (KNOW.V ?I))))))
		)
		(:PRECONDS
			(?X_C (?X_B (CAN.MD (SEE.V (K (PLUR BIRD.N))))))
		)
		(:POSTCONDS
			(?P1 ((K (PLUR BIRD.N)) (KNOW.V ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
			(!W2 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 0.5))
			(!N3 (!G1 NECESSARY-TO-DEGREE 0.5))
			(!N4 (!P1 NECESSARY-TO-DEGREE 0.5))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B WATCH.5.V (K (PLUR BIRD.N))) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((K (PLUR BIRD.N)) ENTITY.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?I PERTAIN-TO (K (PLUR BIRD.N))))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (KNOW.V ?I))))))
		)
		(:PRECONDS
			(?X_E (?X_B (CAN.MD (SEE.V (K (PLUR BIRD.N))))))
		)
		(:POSTCONDS
			(?P1 ((K (PLUR BIRD.N)) (KNOW.V ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
			(!W2 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 0.5))
			(!N3 (!G1 NECESSARY-TO-DEGREE 0.5))
			(!N4 (!P1 NECESSARY-TO-DEGREE 0.5))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-111.PR (K (PLUR BINOCULAR.N)) ?X_G ?X_A
	              (K (PLUR BIRD.N)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E (RIGHT-AFTER ?X_F)))
			(!R2 (?X_G (PLUR FRIEND.N)))
			(!R3 (?X_G (PERTAIN-TO ?X_H)))
		)
		(:STEPS
			(?X_P (?X_B (BUY.V (K (PLUR BINOCULAR.N)))))
			(?X_E ((K (PLUR BIRD.N)) (BECOME.V ?X_G)))
			(?X_D ((K (PLUR BIRD.N)) (BECOME.V ?X_G)))
			(?X_N (?X_B (OUTSIDE.ADV TAKE.21.V) ?X_A))
			(?X_L (?X_B (SEE.V (K (PLUR BIRD.N)))))
			(?X_J (?X_B WATCH.4.V (K (PLUR BIRD.N))))
			(?X_J (?X_B WATCH.5.V (K (PLUR BIRD.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_L)))
			(!W2 (?X_N (BEFORE ?X_J)))
			(!W3 (?X_L (BEFORE ?X_J)))
			(!W4 (?X_P BEFORE ?X_E))
			(!W5 (?X_E BEFORE ?X_D))
		)
	)
	(
			"X_B buys binoculars."
			"Birds become a friends of X_H."
			"Birds become a friends of X_H."
			"X_B take.168s X_A outside."
			"X_B sees birds."
			"X_B watch.165s birds."
			"X_B watch.166s birds."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-112.PR) ** ?E)
		(:ROLES
			(!R1 (?X_A (K HIND.A) (PLUR FOOT.N)))
			(!R2 (?X_A (PERTAIN-TO ?X_B)))
			(!R3 (?X_C (RIGHT-AFTER ?X_D)))
		)
		(:STEPS
			(?X_C (?X_B ((ADV-A (ON.P ?X_A)) STAND.V)))
		)
	)
	(
			"X_B stands on a of X_B."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (TO.P ?X_C))
	               ((ADV-A (TO.P ?X_C))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_C)) GO.13.V))))
	              ?X_C)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C LOCATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C STORE.N))
			(!R6 (?X_C PET.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?X_C))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-113.PR ?X_M ?X_A ?X_E ?X_J) ** ?E)
		(:ROLES
			(!R1 (?X_E LIZARD.N))
			(!R2 (?X_J PET.N))
			(!R3 (?X_J STORE.N))
			(!R4 (?X_M PET.N))
		)
		(:STEPS
			(?X_L (?X_B (WANT.V ?X_M)))
			(?X_G (?X_B (FIND.V ?X_A)))
			(E262.SK (?X_A LIZARD.N))
			(?X_D (?X_B (BUY.V ?X_E)))
			(?X_I
	   (?X_B
	    ((ADV-A (TO.P ?X_J))
	     ((ADV-A (TO.P ?X_J))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_J)) GO.13.V))))
	    ?X_J))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L BEFORE ?X_G))
			(!W2 (?X_G BEFORE E262.SK))
			(!W3 (E262.SK BEFORE ?X_D))
			(!W4 (?X_D BEFORE ?X_I))
		)
	)
	(
			"X_B wants a pet."
			"X_B finds X_A."
			"X_A is lizard."
			"X_B buys a lizard."
			"X_B go.204s a pet store to a pet store to a pet store from L1 for a pet store."
	)
)



(
	(EPI-SCHEMA ((?X_C EAT.1.V ?X_B) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_B FOOD.N))
			(!R3 (?X_B MUFFIN.N))
			(!R4 (?X_B BIG.A))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (NOT (?X_C HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?X_B))
			(?I2 (?X_C HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (HAVE.V ?X_B))))
			(?P2 (NOT (?X_C HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_D))
			(!W2 (?I1 BEFORE ?X_D))
			(!W3 (?X_D CAUSE-OF ?P1))
			(!W4 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X FEED.1.V ?X_C ?X_B) ** ?E)
		(:ROLES
			(!R1 (?X AGENT.N))
			(!R2 (?X_C AGENT.N))
			(!R3 (?X_B FOOD.N))
			(!R4 (NOT (?X = ?X_C)))
			(!R5 (NOT (?X_C = ?X_B)))
			(!R6 (NOT (?X = ?X_B)))
			(!R7 (?X_B BIG.A))
			(!R8 (?X_B MUFFIN.N))
		)
		(:GOALS
			(?G1 (?X (WANT.V (THAT (NOT (?X_C HUNGRY.A))))))
			(?G2 (?X (WANT.V (THAT (?X_C EAT.V ?X_B)))))
		)
		(:PRECONDS
			(?I1 (?X HAVE.V ?X_B))
			(?I2 (?X_C HUNGRY.A))
		)
		(:STEPS
			(?X_D (?X_C EAT.V ?X_B))
		)
		(:POSTCONDS
			(?P1 (NOT (?X (HAVE.V ?X_B))))
			(?P2 (NOT (?X_C HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D AFTER ?E))
			(!W2 (?X_D (AT-ABOUT ?X_E)))
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
	nil
)



(
	(EPI-SCHEMA ((?X_C COMPOSITE-SCHEMA-114.PR ?X_C ?X_D) ** ?E)
		(:ROLES
			(!R1 (?X_D FOOD.N))
			(!R2 (?X_D BIG.A))
			(!R3 (?X_D MUFFIN.N))
			(!R4 (?X_C AGENT.N))
			(!R5 (NOT (?X = ?X_C)))
			(!R6 (NOT (?X_C = ?X_D)))
			(!R7 (NOT (?X = ?X_D)))
			(!R8 (?X AGENT.N))
		)
		(:STEPS
			(?E_1 (?X FEED.1.V ?X_C ?X_D))
			(?X_B (?X_C EAT.1.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E_1 (BEFORE ?X_B)))
		)
	)
	(
			"A agent feed.214s a agent a food big muffin."
			"A agent eat.212s a food big muffin."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (FOR.P (KA (((ADV-A (FOR.P ?X_C)) BUY.V) (K GAS.N)))))
	               ((ADV-A (TO.P (KA (((ADV-A (FOR.P ?X_C)) BUY.V) (K GAS.N)))))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (FOR.P (KA (((ADV-A (FOR.P ?X_C)) BUY.V) (K GAS.N)))))
	                  GO.14.V))))
	              (KA (((ADV-A (FOR.P ?X_C)) BUY.V) (K GAS.N))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA (((ADV-A (FOR.P ?X_C)) BUY.V) (K GAS.N))) LOCATION.N))
			(!R4 (NOT (?L1 = (KA (((ADV-A (FOR.P ?X_C)) BUY.V) (K GAS.N))))))
			(!R5 (?X_C AGENT.N))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V
	     (KA ((ADV-A (AT.P (KA (((ADV-A (FOR.P ?X_C)) BUY.V) (K GAS.N))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (KA (((ADV-A (FOR.P ?X_C)) BUY.V) (K GAS.N)))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (KA (((ADV-A (FOR.P ?X_C)) BUY.V) (K GAS.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_G COMPOSITE-SCHEMA-115.PR
	              (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N)))))) ?X_M
	              (KA (FORWARD.ADV PAY.V) ?X_B)
	              (KA (((ADV-A (FOR.P ?X_M)) BUY.V) (K GAS.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2 (?X_J PERSON.N))
			(!R3 (?X_M AGENT.N))
			(!R4 (?X_N TIME.N))
		)
		(:STEPS
			(?X_L (?X_N ?X_M (RUN.V (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N)))))))))
			(?X_I (?X_J (SEE.V ?X_M)))
			(?X_D (?X_G (TELL.V ?X_M (KA (FORWARD.ADV PAY.V) ?X_B))))
			(?X_F
	   (?X_G
	    ((ADV-A (FOR.P (KA (((ADV-A (FOR.P ?X_M)) BUY.V) (K GAS.N)))))
	     ((ADV-A (TO.P (KA (((ADV-A (FOR.P ?X_M)) BUY.V) (K GAS.N)))))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (FOR.P (KA (((ADV-A (FOR.P ?X_M)) BUY.V) (K GAS.N)))))
	        GO.14.V))))
	    (KA (((ADV-A (FOR.P ?X_M)) BUY.V) (K GAS.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L BEFORE ?X_I))
			(!W2 (?X_I BEFORE ?X_D))
			(!W3 (?X_D BEFORE ?X_F))
		)
	)
	(
			"A time runs out of."
			"A person sees a agent."
			"A agent tells a agent forward pay X_B."
			"A agent go.220s for a agent buying gas for for a agent buying gas to for a agent buying gas from L1 for for a agent buying gas."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (INTO.P (K WORK.N))) GET.26.V) ?O) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?O)))
			(!R5 (?X_B WORK.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?O)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?O (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_H COMPOSITE-SCHEMA-116.PR (K VACATION.N) (KA (WORK.V (K TODAY.N)))
	              ?O)
	             ** ?E)
		(:ROLES
			(!R1 (?X_G WORK.N))
			(!R2 (?X_G (PERTAIN-TO ?X_H)))
		)
		(:STEPS
			(?X_F (?X_H (BACK.ADV (FROM.P (K VACATION.N)))))
			(?X_D (?X_H (HAVE.V (KA (WORK.V (K TODAY.N))))))
			(?X_B (?X_H ((ADV-A (INTO.P (K WORK.N))) GET.26.V) ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F BEFORE ?X_D))
			(!W2 (?X_D BEFORE ?X_B))
		)
	)
	(
			"X_H is back from."
			"X_H has working today."
			"X_H get.223s O into work."
	)
)



(
	(EPI-SCHEMA ((?X_B (NEVER.ADV FIND.14.V) ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_C DOG.N))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_B ((ADV-A (FOR.P ?X_C)) SEARCH.V)))
			(?I4 (NOT (?X_B (KNOW.V (THAT (?X_C (AT.P ?L)))))))
			(?I5 (NOT (?X_B (HAVE.V ?X_C))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V (THAT (?X_C (AT.P ?L))))))
			(?P2 (?X_B (HAVE.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I3 BEFORE ?X_E))
			(!W2 (?X_E (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?I3) = ?X_E))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.7.V ?X_D (KA (HELP.V (FIND.V ?X_E)))) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D FRIEND.N))
			(!R3 ((KA (HELP.V (FIND.V ?X_E))) ACTION.N))
			(!R4 (?X_C (VERY.ADV UPSET.A)))
			(!R5 (?X_D (PERTAIN-TO ?X_C)))
			(!R6 (?X_E DOG.N))
			(!R7 (?X_F (RIGHT-AFTER ?X_A)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V ?X_D (KA (HELP.V (FIND.V ?X_E))))))
			(?G2 (?X_C (WANT.V (THAT (?X_C (HELP.V (FIND.V ?X_E)) (FIND.V ?X_E))))))
		)
		(:STEPS
			(?X_F (?X_C (ASK.V ?X_D (KA (HELP.V (FIND.V ?X_E))))))
			(?E2 (?X_D (HELP.V (FIND.V ?X_E)) (FIND.V ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?X_F))
			(!W2 (?X_F CAUSE-OF ?E2))
			(!W3 (?X_F (SAME-TIME ?X_H)))
			(!W4 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.8.V ?X_D (KA (HELP.V (FIND.V ?X_E)))) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D FRIEND.N))
			(!R3 ((KA (HELP.V (FIND.V ?X_E))) ACTION.N))
			(!R4 (?X_D (PERTAIN-TO ?X_C)))
			(!R5 (?X_C (VERY.ADV UPSET.A)))
			(!R6 (?X_E DOG.N))
			(!R7 (?X_G (RIGHT-AFTER ?X_B)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V ?X_D (KA (HELP.V (FIND.V ?X_E))))))
			(?G2 (?X_C (WANT.V (THAT (?X_C (HELP.V (FIND.V ?X_E)) (FIND.V ?X_E))))))
		)
		(:STEPS
			(?X_F (?X_C (ASK.V ?X_D (KA (HELP.V (FIND.V ?X_E))))))
			(?E2 (?X_D (HELP.V (FIND.V ?X_E)) (FIND.V ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?X_F))
			(!W2 (?X_F CAUSE-OF ?E2))
			(!W3 (?X_F (BEFORE ?X_H)))
			(!W4 (?X_G (SAME-TIME ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_F COMPOSITE-SCHEMA-117.PR ?X_E ?X_I ?X_J
	              (KA (HELP.V (FIND.V ?X_I))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E LOT.N))
			(!R2 (?X_E (OF.P (K GROUND.N))))
			(!R3 (?X_F AGENT.N))
			(!R4 (?X_I DOG.N))
			(!R5 (?X_J FRIEND.N))
			(!R6 (?X_K (VERY.ADV UPSET.A)))
			(!R7 (?X_J (PERTAIN-TO ?X_K)))
			(!R8 (?X_L (RIGHT-AFTER ?X_M)))
		)
		(:STEPS
			(?X_D (?X_F (((ADV-A (FOR.P (KA LOOK.V))) COVER.V) ?X_E)))
			(?X_B (?X_F (NEVER.ADV FIND.14.V) ?X_I))
			(?E_1 (?X_K REQUEST_ACTION.7.V ?X_J (KA (HELP.V (FIND.V ?X_I)))))
			(?E_2 (?X_K REQUEST_ACTION.8.V ?X_J (KA (HELP.V (FIND.V ?X_I)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D BEFORE ?X_B))
			(!W2 (?X_B BEFORE ?E_1))
			(!W3 (?E_1 BEFORE ?E_2))
		)
	)
	(
			"A agent covers a lot of ground for looking."
			"A agent find.249s a dog never."
			"A very upset request action.250s a friend of a very upset helping find a dog."
			"A very upset request action.251s a friend of a very upset helping find a dog."
	)
)



(
	(EPI-SCHEMA ((?X_B MAKE.8.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B GIRL.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?X_C PRETTY.A))
			(!R4 (?X_C DRESS.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C EXIST.V)))))
			(?G2 (?X_B (WANT.V (KA (HAVE.V ?X_C)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C EXIST.V))
			(?P2 (?X_B (HAVE.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.9.V ?X_C (KA (MAKE.V ?X_D))) ** ?E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C GIRL.N))
			(!R3 ((KA (MAKE.V ?X_D)) ACTION.N))
			(!R4 (?X_D PRETTY.A))
			(!R5 (?X_D DRESS.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V ?X_C (KA (MAKE.V ?X_D)))))
			(?G2 (?X_B (WANT.V (THAT (?X_B MAKE.V ?X_D)))))
		)
		(:STEPS
			(?E1 (?X_B (ASK.V ?X_C (KA (MAKE.V ?X_D)))))
			(?X_E (?X_C MAKE.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?X_E))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.10.V ?X_B (KA (MAKE.V ?X_C))) ** ?E)
		(:ROLES
			(!R1 (?X_B GIRL.N))
			(!R2 ((KA (MAKE.V ?X_C)) ACTION.N))
			(!R3 (?X_C PRETTY.A))
			(!R4 (?X_C DRESS.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V ?X_B (KA (MAKE.V ?X_C)))))
			(?G2 (?X_B (WANT.V (THAT (?X_B MAKE.V ?X_C)))))
		)
		(:STEPS
			(?E1 (?X_B (ASK.V ?X_B (KA (MAKE.V ?X_C)))))
			(?X_D (?X_B MAKE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?X_D))
			(!W3 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D COMPOSITE-SCHEMA-118.PR ?X_E ?X_D (KA (MAKE.V ?X_E))) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D GIRL.N))
			(!R3 ((KA (MAKE.V ?X_E)) ACTION.N))
			(!R4 (?X_E PRETTY.A))
			(!R5 (?X_E DRESS.N))
		)
		(:STEPS
			(?X_B (?X_D MAKE.8.V ?X_E))
			(?E_1 (?X_C REQUEST_ACTION.9.V ?X_D (KA (MAKE.V ?X_E))))
			(?E_2 (?X_D REQUEST_ACTION.10.V ?X_D (KA (MAKE.V ?X_E))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B BEFORE ?E_1))
			(!W2 (?E_1 BEFORE ?E_2))
		)
	)
	(
			"A girl make.258s a pretty dress."
			"A agent request action.264s a girl making a pretty dress."
			"A girl request action.265s a girl making a pretty dress."
	)
)



(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-119.PR (K (PLUR RAINBOW.N)) ?X_D ?X_J) ** ?E)
		(:ROLES
			(!R1 (?X_D DAY.N))
			(!R2 (?X_I FAMILY.N))
			(!R3 (?X_J RAINBOW.N))
		)
		(:STEPS
			(?X_C (?X_I (REALLY.ADV (LOVE.V (K (PLUR RAINBOW.N))))))
			(?X_F (?X_A (RAIN.V ?X_D)))
			(?X_H (?X_I (OUTSIDE.ADV LOOK.V)))
			(?X_L (?X_I (SEE.V ?X_J)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_F)))
			(!W2 (?X_C (BEFORE ?X_H)))
			(!W3 (?X_C (BEFORE ?X_L)))
			(!W4 (?X_F (BEFORE ?X_H)))
			(!W5 (?X_F (BEFORE ?X_L)))
			(!W6 (?X_H (BEFORE ?X_L)))
		)
	)
	(
			"A family loves rainbows really."
			"X_A rains a day."
			"A family looks outside."
			"A family sees a rainbow."
	)
)



(
	(EPI-SCHEMA ((?X_B FIND.15.V ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_C LETTER.N))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_B ((ADV-A (FOR.P ?X_C)) SEARCH.V)))
			(?I4 (NOT (?X_B (KNOW.V (THAT (?X_C (AT.P ?L)))))))
			(?I5 (NOT (?X_B (HAVE.V ?X_C))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V (THAT (?X_C (AT.P ?L))))))
			(?P2 (?X_B (HAVE.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I3 BEFORE ?X_E))
			(!W2 (?X_E (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?P1<- ?I3) = ?X_E))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-120.PR ?X_F ?X_K) ** ?E)
		(:ROLES
			(!R1 (?X_F SMALL.A))
			(!R2 (?X_F NOTE.N))
			(!R3 (?X_K LETTER.N))
		)
		(:STEPS
			(?X_H (?X_A ((UP.PRT OPEN.V) ?X_K)))
			(?X_E ((K INSIDE.N) (BE.V ?X_F)))
			(?X_C (?X_A ((AWAY.ADV THROW.V) ?X_F)))
			(?X_J (?X_A FIND.15.V ?X_K))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_E)))
			(!W2 (?X_H (BEFORE ?X_C)))
			(!W3 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"X_A opens a letter up."
			"Inside is a small note."
			"X_A throws a small note away."
			"X_A find.275s a letter."
	)
)



(
	(EPI-SCHEMA ((?X_F COMPOSITE-SCHEMA-121.PR (KA (SEE.V ?X_C)) (KA LEAVE.V)) ** ?E)
		(:ROLES
			(!R1 (?X_C BASEBALL.N))
			(!R2 (?X_F (SO.ADV BORED.A)))
			(!R3 (?X_F AGENT.N))
		)
		(:STEPS
			(?X_E (?X_F (KA BE.V) ((PASV INVITE.V) (KA (SEE.V ?X_C)))))
			(?X_A (?X_F (DOWN.ADV SIT.V)))
			(?X_B (?X_F (DOWN.ADV SIT.V)))
			(?X_H (?X_F (JUST.ADV (WANT.V (KA LEAVE.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_A)))
			(!W2 (?X_E (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_H)))
			(!W4 (?X_A (BEFORE ?X_B)))
			(!W5 (?X_A (BEFORE ?X_H)))
			(!W6 (?X_B (BEFORE ?X_H)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (TO.P ?X_D))
	               ((ADV-A (TO.P ?X_D))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_D)) GO.15.V))))
	              ?X_D)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D LOCATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D POND.N))
			(!R6 (?X_B ROD.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?X_D)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?X_D))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_Q COMPOSITE-SCHEMA-122.PR ?X_H ?X_P ?X_C ?X_O) ** ?E)
		(:ROLES
			(!R1 (?X_C BOOT.N))
			(!R2 (?X_H FISH.N))
			(!R3 (?X_I (RIGHT-AFTER ?X_J)))
			(!R4 (?X_P ROD.N))
			(!R5 (?X_O POND.N))
			(!R6 (?X_P (PERTAIN-TO ?X_Q)))
		)
		(:STEPS
			(?X_L (?X_Q (CAST.V ?X_P ?X_O)))
			(?X_I (?X_Q (((ADV-A (IN.P ?X_O)) CAST.V) ?X_P)))
			(?X_G (?X_Q (CATCH.V ?X_H)))
			(?X_E (?X_Q ((UP.ADV PULL.V) ?X_P)))
			(?X_B (?X_P ((ACTUALLY.ADV BE.V) ?X_C)))
			(?X_N
	   (?X_Q
	    ((ADV-A (TO.P ?X_O))
	     ((ADV-A (TO.P ?X_O))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_O)) GO.15.V))))
	    ?X_O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L BEFORE ?X_I))
			(!W2 (?X_I BEFORE ?X_G))
			(!W3 (?X_G BEFORE ?X_E))
			(!W4 (?X_E BEFORE ?X_B))
			(!W5 (?X_B BEFORE ?X_N))
		)
	)
	(
			"X_Q casts a rod of X_Q a pond."
			"X_Q casts a rod of X_Q in a pond."
			"X_Q catches a fish."
			"X_Q pulls a rod of X_Q up."
			"A rod of X_Q is a boot actually."
			"X_Q go.8s a pond to a pond to a pond from L1 for a pond."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (AFTER.P ?X_A))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.11.V))))
	              ?L2)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E BROTHER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A BASKET.N))
			(!R6 (?X_E (PERTAIN-TO ?X_B)))
			(!R7 (?X_B BOY.N))
			(!R8 (?X_F (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?L1)))
			(?I2 (NOT (?X_E (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P ?L1))))
			(?P2 (?X_E (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_F (SAME-TIME ?X_H)))
			(!W7 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (AFTER.P ?X_A))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.12.V))))
	              ?L2)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E BROTHER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A BASKET.N))
			(!R6 (?X_F (RIGHT-AFTER ?X_B)))
			(!R7 (?X_C BOY.N))
			(!R8 (?X_E (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?L1)))
			(?I2 (NOT (?X_E (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P ?L1))))
			(?P2 (?X_E (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_F (SAME-TIME ?X_H)))
			(!W7 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N COMPOSITE-SCHEMA-123.PR ?X_M ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_N BROTHER.N))
			(!R2 (?X_G STREET.N))
			(!R3 (?X_J RIM.N))
			(!R4 (?X_M BASKET.N))
			(!R5 (?X_O BOY.N))
			(!R6 (?X_N (PERTAIN-TO ?X_O)))
			(!R7 (?X_P (RIGHT-AFTER ?X_Q)))
		)
		(:STEPS
			(?X_L (?X_O (SHOOT.V ?X_M)))
			(?X_I (?X_M (HARD.ADV ((ADV-A (OFF.P ?X_J)) BOUNCE.V))))
			(?X_F (?X_M ((ADV-A (INTO.P ?X_G)) GO.V)))
			(?X_D (?X_N (AFTER.P ?X_M)))
			(?X_B (?X_N (((ADV-A (IN.P ?X_G)) CATCH.V) ?X_M)))
			(?X_P
	   (?X_N
	    ((ADV-A (AFTER.P ?X_M))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.11.V))))
	    ?L2))
			(?X_P
	   (?X_N
	    ((ADV-A (AFTER.P ?X_M))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.12.V))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_P)))
			(!W2 (?X_L BEFORE ?X_I))
			(!W3 (?X_I BEFORE ?X_F))
			(!W4 (?X_F BEFORE ?X_B))
		)
	)
	(
			"A boy shoots a basket."
			"A basket bounces hard off a rim."
			"A basket goes into a street."
			"A brother of a boy is after."
			"A brother of a boy catches a basket in a street."
			"A brother of a boy run.22s L2 after a basket to L2 from L1 for L2."
			"A brother of a boy run.24s L2 after a basket to L2 from L1 for L2."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.27.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C IPAD.N))
			(!R6 (?X_C NICE.A))
			(!R7 (?X_C NEW.A))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J COMPOSITE-SCHEMA-124.PR ?X_D ?X_I) ** ?E)
		(:ROLES
			(!R1 (?X_D BOX.N))
			(!R2 (?X_D (VERY.ADV AMAZING.A)))
			(!R3 (?X_I NEW.A))
			(!R4 (?X_I IPAD.N))
			(!R5 (?X_I NICE.A))
			(!R6 (?X_J AGENT.N))
		)
		(:STEPS
			(?X_F (?X_A ?X_J ((ADV (VERY.ADV MUCH.A)) LIKE.V) ?X_I))
			(?X_C (?X_J (SAVE.V ?X_D)))
			(?X_H (?X_J GET.27.V ?X_I))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F BEFORE ?X_C))
			(!W2 (?X_C BEFORE ?X_H))
		)
	)
	(
			"X_A likes a new ipad nice ADV very much."
			"A agent saves a box very amazing."
			"A agent get.37s a new ipad nice."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-125.PR
	              (KA (SEE.V (?X_B ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B (PLUR PUPPY.N)))
			(!R3 (?X_B FULL.A))
			(!R4 (?X_B (OF.P (K FUN.N))))
		)
		(:STEPS
			(E109.SK
	   (?X_A
	    (LIKE.V (KA (SEE.V (?X_B ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V)))))))
		)
	)
	(
			"A agent likes seeing a puppys full of fun with each other play."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-126.PR) ** ?E)
		(:ROLES
			(!R1 (?X_B (HAS.V (SET-OF ?X_B ?X_A))))
			(!R2 (?X_B LITTLE.A))
			(!R3 (?X_B BAT.N))
			(!R4 (?X_C BALL.N))
			(!R5 (?X_D (IMPINGES-ON ?X_E)))
		)
		(:STEPS
			(?X_D (?X_B ((ADV-A (FOR.P (KA (|4.2.2.V| ?X_C)))) HAS.V)))
		)
	)
	(
			"A has a has X_B and X_A little bat and X_A little bat has for 4.2.2inging a ball."
	)
)



(
	(EPI-SCHEMA ((?X_D EAT.2.V ?X_C) ** ?X_F)
		(:ROLES
			(!R1 (?X_D MONKEY.N))
			(!R2 (?X_C FOOD.N))
			(!R3 (?X_C COCOANUT.N))
			(!R4 (?X_A GROUND.N))
			(!R5 (?X_C (TO.P ?X_A)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (NOT (?X_D HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_D HAVE.V ?X_C))
			(?I2 (?X_D HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (HAVE.V ?X_C))))
			(?P2 (NOT (?X_D HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_F))
			(!W2 (?I1 BEFORE ?X_F))
			(!W3 (?X_F CAUSE-OF ?P1))
			(!W4 (?X_E (CONSEC ?X_F)))
			(!W5 (?X_E (AT-ABOUT ?X_G)))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D EAT.3.V ?X_C) ** ?X_F)
		(:ROLES
			(!R1 (?X_D MONKEY.N))
			(!R2 (?X_C FOOD.N))
			(!R3 (?X_C COCOANUT.N))
			(!R4 (?X_C (TO.P ?X_B)))
			(!R5 (?X_B GROUND.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (NOT (?X_D HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_D HAVE.V ?X_C))
			(?I2 (?X_D HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (HAVE.V ?X_C))))
			(?P2 (NOT (?X_D HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_F))
			(!W2 (?I1 BEFORE ?X_F))
			(!W3 (?X_F CAUSE-OF ?P1))
			(!W4 (?X_E (CONSEC ?X_F)))
			(!W5 (?X_E (AT-ABOUT ?X_G)))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D EAT.4.V ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_D MONKEY.N))
			(!R2 (?X_C FOOD.N))
			(!R3 (?X_C COCOANUT.N))
			(!R4 (?X_C (TO.P ?X_A)))
			(!R5 (?X_A GROUND.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (NOT (?X_D HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_D HAVE.V ?X_C))
			(?I2 (?X_D HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (HAVE.V ?X_C))))
			(?P2 (NOT (?X_D HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_E))
			(!W2 (?I1 BEFORE ?X_E))
			(!W3 (?X_E CAUSE-OF ?P1))
			(!W4 (?X_F (CONSEC ?X_E)))
			(!W5 (?X_E (AT-ABOUT ?X_G)))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              (DOWN.ADV
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) COME.6.V))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B MONKEY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_C)))
			(!W7 (?X_E (AT-ABOUT ?X_C)))
			(!W8 (?X_D (CONSEC ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              (DOWN.ADV
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) COME.7.V))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B MONKEY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (CONSEC ?X_C)))
			(!W7 (?X_C (AT-ABOUT ?X_E)))
			(!W8 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              (CAN.AUX
	               ((ADV-A (TO.P ?X_C))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_C)) CLIMB.2.V))))
	              ?X_C)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B MONKEY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C LOCATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C TREE.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?X_C))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X FEED.2.V ?X_D ?X_C) ** ?E)
		(:ROLES
			(!R1 (?X AGENT.N))
			(!R2 (?X_D MONKEY.N))
			(!R3 (?X_C FOOD.N))
			(!R4 (NOT (?X = ?X_D)))
			(!R5 (NOT (?X_D = ?X_C)))
			(!R6 (NOT (?X = ?X_C)))
			(!R7 (?X_C COCOANUT.N))
			(!R8 (?X_C (TO.P ?X_A)))
			(!R9 (?X_A GROUND.N))
		)
		(:GOALS
			(?G1 (?X (WANT.V (THAT (NOT (?X_D HUNGRY.A))))))
			(?G2 (?X (WANT.V (THAT (?X_D EAT.V ?X_C)))))
		)
		(:PRECONDS
			(?I1 (?X HAVE.V ?X_C))
			(?I2 (?X_D HUNGRY.A))
		)
		(:STEPS
			(?X_F (?X_D EAT.V ?X_C))
		)
		(:POSTCONDS
			(?P1 (NOT (?X (HAVE.V ?X_C))))
			(?P2 (NOT (?X_D HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F AFTER ?E))
			(!W2 (?X_E (CONSEC ?X_F)))
			(!W3 (?X_E (AT-ABOUT ?X_G)))
			(!W4 (?X_F (AT-ABOUT ?X_G)))
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
	nil
)



(
	(EPI-SCHEMA ((?X FEED.3.V ?X_D ?X_C) ** ?E)
		(:ROLES
			(!R1 (?X AGENT.N))
			(!R2 (?X_D MONKEY.N))
			(!R3 (?X_C FOOD.N))
			(!R4 (NOT (?X = ?X_D)))
			(!R5 (NOT (?X_D = ?X_C)))
			(!R6 (NOT (?X = ?X_C)))
			(!R7 (?X_C COCOANUT.N))
			(!R8 (?X_B GROUND.N))
			(!R9 (?X_C (TO.P ?X_B)))
		)
		(:GOALS
			(?G1 (?X (WANT.V (THAT (NOT (?X_D HUNGRY.A))))))
			(?G2 (?X (WANT.V (THAT (?X_D EAT.V ?X_C)))))
		)
		(:PRECONDS
			(?I1 (?X HAVE.V ?X_C))
			(?I2 (?X_D HUNGRY.A))
		)
		(:STEPS
			(?X_F (?X_D EAT.V ?X_C))
		)
		(:POSTCONDS
			(?P1 (NOT (?X (HAVE.V ?X_C))))
			(?P2 (NOT (?X_D HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F AFTER ?E))
			(!W2 (?X_E (CONSEC ?X_F)))
			(!W3 (?X_E (AT-ABOUT ?X_G)))
			(!W4 (?X_F (AT-ABOUT ?X_G)))
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
	nil
)



(
	(EPI-SCHEMA ((?X FEED.4.V ?X_D ?X_C) ** ?E)
		(:ROLES
			(!R1 (?X AGENT.N))
			(!R2 (?X_D MONKEY.N))
			(!R3 (?X_C FOOD.N))
			(!R4 (NOT (?X = ?X_D)))
			(!R5 (NOT (?X_D = ?X_C)))
			(!R6 (NOT (?X = ?X_C)))
			(!R7 (?X_C COCOANUT.N))
			(!R8 (?X_A GROUND.N))
			(!R9 (?X_C (TO.P ?X_A)))
		)
		(:GOALS
			(?G1 (?X (WANT.V (THAT (NOT (?X_D HUNGRY.A))))))
			(?G2 (?X (WANT.V (THAT (?X_D EAT.V ?X_C)))))
		)
		(:PRECONDS
			(?I1 (?X HAVE.V ?X_C))
			(?I2 (?X_D HUNGRY.A))
		)
		(:STEPS
			(?X_G (?X_D EAT.V ?X_C))
		)
		(:POSTCONDS
			(?P1 (NOT (?X (HAVE.V ?X_C))))
			(?P2 (NOT (?X_D HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G AFTER ?E))
			(!W2 (?X_G (AT-ABOUT ?X_E)))
			(!W3 (?X_F (AT-ABOUT ?X_E)))
			(!W4 (?X_F (CONSEC ?X_G)))
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
	nil
)



(
	(EPI-SCHEMA ((?X_R COMPOSITE-SCHEMA-127.PR (KA (L X (AND (X RUN.V) (X PLAY.V))))
	              ?L2 ?X_P ?X_R ?X_S)
	             ** ?E)
		(:ROLES
			(!R1 (?X_P TREE.N))
			(!R2 (?X_Q GROUND.N))
			(!R3 (?X_S (TO.P ?X_Q)))
			(!R4 (?X_S FOOD.N))
			(!R5 (?X_S COCOANUT.N))
			(!R6 (?X_R MONKEY.N))
			(!R7 (NOT (?X = ?X_R)))
			(!R8 (NOT (?X_R = ?X_S)))
			(!R9 (NOT (?X = ?X_S)))
			(!R10 (?X AGENT.N))
		)
		(:STEPS
			(?X_M (?X_R (CLIMB.V ?X_P)))
			(?X_K (?X_R (GET.V ?X_S)))
			(?X_I (?X_R (DROP.V ?X_S)))
			(?X_C (?X_R (LIKE.V (KA (L X (AND (X RUN.V) (X PLAY.V)))))))
			(?X_O
	   (?X_R
	    (CAN.AUX
	     ((ADV-A (TO.P ?X_P))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_P)) CLIMB.2.V))))
	    ?X_P))
			(?X_G
	   (?X_R
	    (DOWN.ADV
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) COME.6.V))))
	    ?L2))
			(?X_G
	   (?X_R
	    (DOWN.ADV
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) COME.7.V))))
	    ?L2))
			(?E_1 (?X FEED.2.V ?X_R ?X_S))
			(?E_2 (?X FEED.3.V ?X_R ?X_S))
			(?E_3 (?X FEED.4.V ?X_R ?X_S))
			(?X_E (?X_R EAT.2.V ?X_S))
			(?X_E (?X_R EAT.3.V ?X_S))
			(?X_E (?X_R EAT.4.V ?X_S))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_G)))
			(!W2 (?X_O (BEFORE ?X_E)))
			(!W3 (?X_G (BEFORE ?X_E)))
			(!W4 (?E_1 (BEFORE ?X_E)))
			(!W5 (?E_2 (BEFORE ?X_E)))
			(!W6 (?E_3 (BEFORE ?X_E)))
			(!W7 (?X_M BEFORE ?X_K))
			(!W8 (?X_K BEFORE ?X_I))
			(!W9 (?X_I BEFORE ?X_C))
		)
	)
	(
			"A monkey climbs a tree."
			"A monkey gets a food cocoanut to a ground."
			"A monkey drops a food cocoanut to a ground."
			"A monkey likes run playing."
			"A monkey climb.85s a tree can to a tree from L1 for a tree."
			"A monkey come.83s L2 down to L2 from L1 for L2."
			"A monkey come.84s L2 down to L2 from L1 for L2."
			"A agent feed.97s a monkey a food cocoanut to a ground."
			"A agent feed.98s a monkey a food cocoanut to a ground."
			"A agent feed.100s a monkey a food cocoanut to a ground."
			"A monkey eat.89s a food cocoanut to a ground."
			"A monkey eat.90s a food cocoanut to a ground."
			"A monkey eat.91s a food cocoanut to a ground."
	)
)



(
	(EPI-SCHEMA ((?X_D GET.28.V ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D SON.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E FLY.N))
			(!R6 (?X_B MAN.N))
			(!R7 (?X_D (PERTAIN-TO ?X_B)))
			(!R8 (?X_G (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (BEFORE ?X_H)))
			(!W7 (?X_G (SAME-TIME ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B (AWAY.ADV GET.29.V) ?O) ** ?X_C)
		(:ROLES
			(!R1 (?X_B FLY.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?O)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?O)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?O (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
			(!W6 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D GET.30.V ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D SON.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E FLY.N))
			(!R6 (?X_D (PERTAIN-TO ?X_A)))
			(!R7 (?X_A MAN.N))
			(!R8 (?X_F (RIGHT-AFTER ?X_B)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (SAME-TIME ?X_H)))
			(!W7 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C GET.31.V (K SICK.A)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 ((K SICK.A) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = (K SICK.A))))
			(!R5 (?X_B (PERTAIN-TO ?X_C)))
			(!R6 (?X_B MOTHER.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V (K SICK.A)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V (K SICK.A))))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 ((K SICK.A) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V (K SICK.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_K COMPOSITE-SCHEMA-128.PR ?X_I (K SICK.A)) ** ?E)
		(:ROLES
			(!R1 (?X_I SLIGHT.A))
			(!R2 (?X_I COLD.N))
			(!R3 (?X_J MOTHER.N))
			(!R4 (?X_J (PERTAIN-TO ?X_K)))
		)
		(:STEPS
			(?X_H (?X_K (HAVE.V ?X_I)))
			(?X_F (?X_K GO.V))
			(?X_D (?X_K (ANYWAY.ADV SWAM.V)))
			(?X_B (?X_K GET.31.V (K SICK.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H BEFORE ?X_F))
			(!W2 (?X_F BEFORE ?X_D))
			(!W3 (?X_D BEFORE ?X_B))
		)
	)
	(
			"X_K has a slight cold."
			"X_K goes."
			"X_K swims anyway."
			"X_K get.124s sick."
	)
)



(
	(EPI-SCHEMA ((?X_G COMPOSITE-SCHEMA-129.PR ?X_G ?X_F ?X_J (K YOUNG.A) ?X_M ?X_Q) **
	             ?E)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_G FRIEND.N))
			(!R3 (?X_G (PERTAIN-TO ?X_E)))
			(!R4 (?X_F (K YOUNG.A) SON.N))
			(!R5 (?X_F (PERTAIN-TO ?X_G)))
			(!R6 (?X_H (RIGHT-AFTER ?X_I)))
			(!R7 (?X_J CUTE.A))
			(!R8 (?X_J LITTLE.A))
			(!R9 (?X_J BOY.N))
			(!R10 (?X_M (PLUR TOY.N)))
			(!R11 (?X_P AGENT.N))
			(!R12 (?X_Q GREAT.A))
			(!R13 (?X_Q VISIT.N))
		)
		(:STEPS
			(?X_B (?X_G ((ADV-A (FOR.P (KA (VISIT.V ?X_E)))) COME.V)))
			(?X_D (?X_G (BRING.V ?X_F ?X_G)))
			(?X_H (?X_G (((ADV-A (WITH.P ?X_G)) BRING.V) ?X_F)))
			(?X_L ((K YOUNG.A) (BE.V ?X_J)))
			(?X_O (?X_P (((ADV-A (FOR.P (KA (PLAY.V WITH.P)))) GIVE.V) (K YOUNG.A) ?X_M)))
			(?X_S (?X_P (HAVE.V ?X_Q)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_D)))
			(!W2 (?X_B (BEFORE ?X_H)))
			(!W3 (?X_B (BEFORE ?X_L)))
			(!W4 (?X_B (BEFORE ?X_O)))
			(!W5 (?X_B (BEFORE ?X_S)))
			(!W6 (?X_D (BEFORE ?X_H)))
			(!W7 (?X_D (BEFORE ?X_L)))
			(!W8 (?X_D (BEFORE ?X_O)))
			(!W9 (?X_D (BEFORE ?X_S)))
			(!W10 (?X_H (BEFORE ?X_L)))
			(!W11 (?X_H (BEFORE ?X_O)))
			(!W12 (?X_H (BEFORE ?X_S)))
			(!W13 (?X_L (BEFORE ?X_O)))
			(!W14 (?X_L (BEFORE ?X_S)))
			(!W15 (?X_O (BEFORE ?X_S)))
		)
	)
	(
			"A friend of a agent comes for visiting a agent."
			"A friend of a agent brings a of a friend of X_E a friend of a agent."
			"A friend of a agent brings a of a friend of X_E with a friend of a agent."
			"Young is a cute little boy."
			"A agent gives young a toys for playing with."
			"A agent has a great visit."
	)
)



(
	(EPI-SCHEMA ((?X_C (SHALL.AUX GET.32.V)
	              (K (L X (AND (X MANY.A) (X (PLUR NUT.N))))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 ((K (L X (AND (X MANY.A) (X (PLUR NUT.N))))) INANIMATE_OBJECT.N))
			(!R3 (?X_B SEAT.N))
			(!R4 (NOT (?X_C = (K (L X (AND (X MANY.A) (X (PLUR NUT.N))))))))
		)
		(:GOALS
			(?G1
	   (?X_C
	    (WANT.V
	     (THAT (?X_C (HAVE.V (K (L X (AND (X MANY.A) (X (PLUR NUT.N)))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V (K (L X (AND (X MANY.A) (X (PLUR NUT.N))))))))
			(?I2 (?X_C (AT.P ?X_B)))
			(?I3 ((K (L X (AND (X MANY.A) (X (PLUR NUT.N))))) (AT.P ?X_B)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V (K (L X (AND (X MANY.A) (X (PLUR NUT.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-130.PR (KA (HOLD.V ?X_E))
	              (K (L X (AND (X MANY.A) (X (PLUR NUT.N))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E HORSE.N))
			(!R2 (?X_H AGENT.N))
			(!R3 (?X_I SEAT.N))
		)
		(:STEPS
			(?X_D (?X_A (LIKE.V (KA (HOLD.V ?X_E)))))
			(?X_G
	   (?X_H (SHALL.AUX GET.32.V) (K (L X (AND (X MANY.A) (X (PLUR NUT.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D BEFORE ?X_G))
		)
	)
	(
			"X_A likes holding a horse."
			"A agent get.156s many nut shalls."
	)
)



(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-131.PR (KA (TRY.V ?X_C))
	              (KA (BACK.PRT GO.V) ?X_J))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C NEW.A))
			(!R2 (?X_C PIZZA.N))
			(!R3 (?X_C PLACE.N))
			(!R4 (?X_C GREAT.A))
			(!R5 (?X_H PIZZA.N))
			(!R6 (?X_I AGENT.N))
			(!R7 (?X_H (PERTAIN-TO ?X_I)))
			(!R8 (?X_J NEXT.A))
			(!R9 (?X_J DAY.N))
		)
		(:STEPS
			(?X_B (?X_C (UP.PRT OPEN.V)))
			(?X_E (?X_I (DECIDE.V (KA (TRY.V ?X_C)))))
			(?X_G (?X_I ((ADV-A (FOR.P (KA (CUSTOMIZE.V ?X_H)))) GOT.V)))
			(?X_L (?X_I (DECIDE.V (KA (BACK.PRT GO.V) ?X_J))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_E)))
			(!W2 (?X_B (BEFORE ?X_G)))
			(!W3 (?X_B (BEFORE ?X_L)))
			(!W4 (?X_E (BEFORE ?X_G)))
			(!W5 (?X_E (BEFORE ?X_L)))
			(!W6 (?X_G (BEFORE ?X_L)))
		)
	)
	(
			"A new pizza place great opens up."
			"A agent decides trying a new pizza place great."
			"A agent gets for customizing a pizza of a agent."
			"A agent decides back go a next day."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-132.PR (K CHOCOLATE.N)
	              (KA (L X (AND (X GO.V) (X (EAT.V (K CHOCOLATE.N)))))) (K BAD.A))
	             ** ?E)
		(:STEPS
			(?X_D (?X_A (LOVE.V (K CHOCOLATE.N))))
			(?X_F
	   (?X_A
	    (THEN.ADV
	     (DECIDE.V (KA (L X (AND (X GO.V) (X (EAT.V (K CHOCOLATE.N))))))))))
			(?X_H ((K CHOCOLATE.N) (TASTE.V (K BAD.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_H)))
			(!W3 (?X_F (BEFORE ?X_H)))
		)
	)
	(
			"X_A loves chocolate."
			"X_A decides go eating then."
			"Chocolate tastes bad."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (AT.P ?X_A))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.13.V))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A CAT.N))
			(!R6 (?X_C (PLUR HEN.N)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (AT.P ?X_B))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.14.V))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C (PLUR HEN.N)))
			(!R6 (?X_B CAT.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D COMPOSITE-SCHEMA-133.PR ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_C CAT.N))
			(!R2 (?X_D DOG.N))
			(!R3 (?X_D (PLUR HEN.N)))
		)
		(:STEPS
			(?X_B
	   (?X_D
	    ((ADV-A (AT.P ?X_C))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.13.V))))
	    ?L2))
			(?X_B
	   (?X_D
	    ((ADV-A (AT.P ?X_C))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.14.V))))
	    ?L2))
		)
	)
	(
			"A dog hens run.198s L2 at a cat to L2 from L1 for L2."
			"A dog hens run.200s L2 at a cat to L2 from L1 for L2."
	)
)



(
	(EPI-SCHEMA ((?X_J COMPOSITE-SCHEMA-134.PR ?X_K) ** ?E)
		(:ROLES
			(!R1 (?X_A BUSH.N))
			(!R2 (?X_J MAN.N))
			(!R3 (?X_K CAT.N))
		)
		(:STEPS
			(?X_C (?X_K ((ADV-A (IN.P ?X_A)) HIDE.V)))
			(?X_E (?X_J (SEE.V ?X_K)))
			(?X_G (?X_J ((ADV-A (TO.P ?X_K)) CALL.V)))
			(?X_I (?X_K ((ADV-A (FOR.P (KA BUDGE.V))) REFUSE.V)))
			(?X_M (?X_J ((INSIDE.ADV BRING.V) ?X_K)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_G)))
			(!W3 (?X_C (BEFORE ?X_I)))
			(!W4 (?X_C (BEFORE ?X_M)))
			(!W5 (?X_E (BEFORE ?X_G)))
			(!W6 (?X_E (BEFORE ?X_I)))
			(!W7 (?X_E (BEFORE ?X_M)))
			(!W8 (?X_G (BEFORE ?X_I)))
			(!W9 (?X_G (BEFORE ?X_M)))
			(!W10 (?X_I (BEFORE ?X_M)))
		)
	)
	(
			"A cat hides in a bush."
			"A man sees a cat."
			"A man calls to a cat."
			"A cat refuses for budging."
			"A man brings a cat inside."
	)
)



(
	(EPI-SCHEMA ((?X_R COMPOSITE-SCHEMA-135.PR ?X_P (KE ((K MONEY.N) (FOR.P ?X_P)))
	              ?X_B (K (PLUR CLOTHE.N)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_P BIRTHDAY.N))
			(!R2 (?X_F (RIGHT-AFTER ?X_G)))
			(!R3 (?X_Q (PLUR FRIEND.N)))
			(!R4 (?X_L (RIGHT-AFTER ?X_M)))
			(!R5 (?X_R AGENT.N))
			(!R6 (?X_P (PERTAIN-TO ?X_R)))
			(!R7 (?X_Q (PERTAIN-TO ?X_R)))
		)
		(:STEPS
			(?X_E ((K MONEY.N) (FOR.P ?X_P)))
			(?X_F (?X_A (GET.V (KE ((K MONEY.N) (FOR.P ?X_P))))))
			(?X_I (?X_R (HAVE.V ?X_B)))
			(?X_K (?X_R (OUT.ADV ((ADV-A (WITH.P ?X_Q)) GO.V))))
			(?X_L (?X_R (OUT.ADV ((ADV-A (WITH.P ?X_Q)) GO.V))))
			(?X_O (?X_C (BUY.V (K (PLUR CLOTHE.N)))))
			(?X_T (?X_R (HOME.ADV GO.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_F)))
			(!W2 (?X_E (BEFORE ?X_I)))
			(!W3 (?X_E (BEFORE ?X_K)))
			(!W4 (?X_E (BEFORE ?X_L)))
			(!W5 (?X_E (BEFORE ?X_O)))
			(!W6 (?X_E (BEFORE ?X_T)))
			(!W7 (?X_F (BEFORE ?X_I)))
			(!W8 (?X_F (BEFORE ?X_K)))
			(!W9 (?X_F (BEFORE ?X_L)))
			(!W10 (?X_F (BEFORE ?X_O)))
			(!W11 (?X_F (BEFORE ?X_T)))
			(!W12 (?X_I (BEFORE ?X_K)))
			(!W13 (?X_I (BEFORE ?X_L)))
			(!W14 (?X_I (BEFORE ?X_O)))
			(!W15 (?X_I (BEFORE ?X_T)))
			(!W16 (?X_K (BEFORE ?X_L)))
			(!W17 (?X_K (BEFORE ?X_O)))
			(!W18 (?X_K (BEFORE ?X_T)))
			(!W19 (?X_L (BEFORE ?X_O)))
			(!W20 (?X_L (BEFORE ?X_T)))
			(!W21 (?X_O (BEFORE ?X_T)))
		)
	)
	(
			"Money is for."
			"X_A gets money for a birthday of a agent."
			"A agent has X_B."
			"A agent goes out with a friends of a agent."
			"A agent goes out with a friends of a agent."
			"X_C buys clothes."
			"A agent goes home."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-136.PR (KA (FIND.V ?X_F)) ?X_K) ** ?E)
		(:ROLES
			(!R1 (?X_F OWNER.N))
			(!R2 (?X_K WALLET.N))
		)
		(:STEPS
			(?X_C (?X_A WALK.V))
			(?X_E (?X_A (SUDDENLY.ADV (SEE.V ?X_K))))
			(?X_H (?X_A (TRY.V (KA (FIND.V ?X_F)))))
			(?X_J (?X_A ((UP.PRT PICK.V) ?X_K)))
			(?X_M (?X_A (KEEP.V ?X_K)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_H)))
			(!W3 (?X_C (BEFORE ?X_J)))
			(!W4 (?X_C (BEFORE ?X_M)))
			(!W5 (?X_E (BEFORE ?X_H)))
			(!W6 (?X_E (BEFORE ?X_J)))
			(!W7 (?X_E (BEFORE ?X_M)))
			(!W8 (?X_H (BEFORE ?X_J)))
			(!W9 (?X_H (BEFORE ?X_M)))
			(!W10 (?X_J (BEFORE ?X_M)))
		)
	)
	(
			"X_A walks."
			"X_A sees a wallet suddenly."
			"X_A tries finding a owner."
			"X_A picks a wallet up."
			"X_A keeps a wallet."
	)
)



(
	(EPI-SCHEMA ((?X_B (OFF.ADV TAKE.22.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C BACKPACK.N))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D TAKE.23.V ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E {REF}.N))
			(!R6 (?X_B BACKPACK.N))
			(!R7 (?X_B (PERTAIN-TO ?X_D)))
			(!R8 (?X_E (OF.P ?X_C)))
			(!R9 (?X_C STUFF.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D TAKE.24.V ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E {REF}.N))
			(!R6 (?X_E (OF.P ?X_B)))
			(!R7 (?X_B STUFF.N))
			(!R8 (?X_C BACKPACK.N))
			(!R9 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C GET.33.V (K (L X (AND (X HAIR.N) (X STUFF.N))))) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 ((K (L X (AND (X HAIR.N) (X STUFF.N)))) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = (K (L X (AND (X HAIR.N) (X STUFF.N)))))))
			(!R5 (?X_A HAIR.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1
	   (?X_C
	    (WANT.V (THAT (?X_C (HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N)))))))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 ((K (L X (AND (X HAIR.N) (X STUFF.N)))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_G)))
			(!W7 (?X_E (AFTER ?X_F)))
			(!W8 (?X_H (AT-ABOUT ?X_G)))
			(!W9 (?X_H (AFTER ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C GET.33.V (K (L X (AND (X HAIR.N) (X STUFF.N))))) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 ((K (L X (AND (X HAIR.N) (X STUFF.N)))) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = (K (L X (AND (X HAIR.N) (X STUFF.N)))))))
			(!R5 (?X_A HAIR.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1
	   (?X_C
	    (WANT.V (THAT (?X_C (HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N)))))))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 ((K (L X (AND (X HAIR.N) (X STUFF.N)))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_G)))
			(!W7 (?X_E (AFTER ?X_F)))
			(!W8 (?X_H (AT-ABOUT ?X_G)))
			(!W9 (?X_H (AFTER ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C GET.34.V (K (L X (AND (X HAIR.N) (X STUFF.N))))) ** ?X_F)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 ((K (L X (AND (X HAIR.N) (X STUFF.N)))) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = (K (L X (AND (X HAIR.N) (X STUFF.N)))))))
			(!R5 (?X_A (PERTAIN-TO ?X_C)))
			(!R6 (?X_A HAIR.N))
		)
		(:GOALS
			(?G1
	   (?X_C
	    (WANT.V (THAT (?X_C (HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N)))))))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 ((K (L X (AND (X HAIR.N) (X STUFF.N)))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (AFTER ?X_E)))
			(!W7 (?X_F (AT-ABOUT ?X_G)))
			(!W8 (?X_H (AT-ABOUT ?X_G)))
			(!W9 (?X_H (AFTER ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_L COMPOSITE-SCHEMA-137.PR ?X_J
	              (K (L X (AND (X HAIR.N) (X STUFF.N)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_L AGENT.N))
			(!R2 (?X_J MESS.N))
			(!R3 (?X_K HAIR.N))
			(!R4 (?X_K (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(?X_I (?X_K (BE.V ?X_J)))
			(?X_B (?X_L (THERE.ADV BE.V)))
			(?X_C (?X_L (THERE.ADV BE.V)))
			(?X_G (?X_L GET.33.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
			(?X_G (?X_L GET.34.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
			(?X_E (?X_L GET.33.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_G)))
			(!W2 (?X_B (BEFORE ?X_E)))
			(!W3 (?X_C (BEFORE ?X_G)))
			(!W4 (?X_C (BEFORE ?X_E)))
		)
	)
	(
			"A hair of a agent is a mess."
			"A agent is there."
			"A agent is there."
			"A agent get.250s hair stuff."
			"A agent get.252s hair stuff."
			"A agent get.250s hair stuff."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-138.PR ?X_B ?X_J) ** ?E)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?X_B SAIL.N))
			(!R3 (?X_E SAIL-BOAT.N))
			(!R4 (?X_E BOAT.N))
			(!R5 (?X_E (ON.P ?X_F)))
			(!R6 (?X_I AGENT.N))
			(!R7 (?X_J ROW-BOAT.N))
		)
		(:STEPS
			(?X_D (?X_A (HOLD.V ?X_B)))
			(?X_H (?X_E (FAST.ADV MOVE.V)))
			(?X_L (?X_I (LIKE.V ?X_J)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_H)))
			(!W2 (?X_D (BEFORE ?X_L)))
			(!W3 (?X_H (BEFORE ?X_L)))
		)
	)
	(
			"A man holds a sail."
			"A sail boat boat on X_F moves fast."
			"A agent likes a row boat."
	)
)



(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-139.PR ?X_F (ANOTHER.D EGG.N)) ** ?E)
		(:ROLES
			(!R1 (?X_C PAN.N))
			(!R2 (?X_F EGG.N))
			(!R3 (?X_I MAN.N))
		)
		(:STEPS
			(?X_B (?X_I (CRACK.V ?X_F)))
			(?X_E (?X_I (((ADV-A (IN.P ?X_C)) PUT.V) ?X_F)))
			(?X_H (?X_I ((OUT.PRT THROW.V) ?X_F)))
			(?X_K (?X_I (CRACK.V (ANOTHER.D EGG.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_E)))
			(!W2 (?X_B (BEFORE ?X_H)))
			(!W3 (?X_B (BEFORE ?X_K)))
			(!W4 (?X_E (BEFORE ?X_H)))
			(!W5 (?X_E (BEFORE ?X_K)))
			(!W6 (?X_H (BEFORE ?X_K)))
		)
	)
	(
			"A man cracks a egg."
			"A man puts a egg in a pan."
			"A man throws a egg out."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (OFF.P ?X_B))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.16.V))))
	              ?L2)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B ROAD.N))
			(!R6 (?X_C FRIEND.N))
			(!R7 (?X_C (PERTAIN-TO ?X_E)))
			(!R8 (?X_D (PERTAIN-TO ?X_E)))
			(!R9 (?X_D CAR.N))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?L1)))
			(?I2 (NOT (?X_E (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P ?L1))))
			(?P2 (?X_E (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (OFF.P ?X_B))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.17.V))))
	              ?L2)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B ROAD.N))
			(!R6 (?X_C CAR.N))
			(!R7 (?X_C (PERTAIN-TO ?X_E)))
			(!R8 (?X_D (PERTAIN-TO ?X_E)))
			(!R9 (?X_D FRIEND.N))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?L1)))
			(?I2 (NOT (?X_E (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P ?L1))))
			(?P2 (?X_E (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (OFF.P ?X_A))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.18.V))))
	              ?L2)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A ROAD.N))
			(!R6 (?X_C FRIEND.N))
			(!R7 (?X_C (PERTAIN-TO ?X_E)))
			(!R8 (?X_D (PERTAIN-TO ?X_E)))
			(!R9 (?X_D CAR.N))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?L1)))
			(?I2 (NOT (?X_E (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P ?L1))))
			(?P2 (?X_E (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J COMPOSITE-SCHEMA-140.PR ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_D ROAD.N))
			(!R2 (?X_I CAR.N))
			(!R3 (?X_G MALE.A))
			(!R4 (?X_G AGENT.N))
			(!R5 (?X_H FRIEND.N))
			(!R6 (?X_J AGENT.N))
			(!R7 (?X_H (PERTAIN-TO ?X_J)))
			(!R8 (?X_I (PERTAIN-TO ?X_J)))
		)
		(:STEPS
			(E5.SK (?X_J (OUT.PRT ((ADV-A (WITH.P ?X_H)) HANG.V))))
			(?X_F
	   (?X_G ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_I))))))) PULL.V)))
			(?X_C
	   (?X_J
	    ((ADV-A (OFF.P ?X_D))
	     ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.16.V))))
	    ?L2))
			(?X_C
	   (?X_J
	    ((ADV-A (OFF.P ?X_D))
	     ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.17.V))))
	    ?L2))
			(?X_C
	   (?X_J
	    ((ADV-A (OFF.P ?X_D))
	     ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.18.V))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (E5.SK BEFORE ?X_F))
			(!W2 (?X_F BEFORE ?X_C))
		)
	)
	(
			"A agent hangs out with a friend of a agent."
			"A male agent pulls in front of."
			"A agent go.1s L2 off a road to L2 from L1 for L2."
			"A agent go.2s L2 off a road to L2 from L1 for L2."
			"A agent go.3s L2 off a road to L2 from L1 for L2."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (AROUND.P ?X_A))
	               (MOSTLY.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.6.V)))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?S AGENT.N)))
			(!R3 (?S FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_A HOUSE.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L)))
			(?I2 (?S (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (AROUND.P ?X_B))
	               (MOSTLY.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.7.V)))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?S AGENT.N)))
			(!R3 (?S FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_B HOUSE.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L)))
			(?I2 (?S (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_L COMPOSITE-SCHEMA-141.PR (KA (MORE.ADV ACTIVE.A))
	              (KA (BE.V (K (L X (AND (X MORE.A) (X FIT.N)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E HOUR.N))
			(!R2 (?X_F DAY.N))
			(!R3 (?X_K HOUSE.N))
			(!R4 (?X_L AGENT.N))
		)
		(:STEPS
			(?X_N (?X_A (WANT.V (KA (MORE.ADV ACTIVE.A)))))
			(?X_H (?X_L (WANT.V (KA (BE.V (K (L X (AND (X MORE.A) (X FIT.N)))))))))
			(?X_D
	   (?X_L
	    ((ADV-A (FOR.P (KA (((ADV-A (OUTSIDE.P ?X_F)) PLAY.V) ?X_E)))) START.V)))
			(?X_J
	   (?X_L
	    ((ADV-A (AROUND.P ?X_K))
	     (MOSTLY.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.6.V))))))
			(?X_J
	   (?X_L
	    ((ADV-A (AROUND.P ?X_K))
	     (MOSTLY.ADV ((ADV-A (IN.P ?S)) ((ADV-A (ON.P ?S)) SIT.7.V))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_H)))
			(!W2 (?X_N (BEFORE ?X_D)))
			(!W3 (?X_H (BEFORE ?X_D)))
		)
	)
	(
			"X_A wants more active."
			"A agent wants being more fit."
			"A agent starts for outside a day playing a hour."
			"A agent sit.22s around a house mostly in S on S."
			"A agent sit.23s around a house mostly in S on S."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (BEFORE.P (K DARK.N)))
	               (HOME.ADV
	                ((ADV-A (TO.P ?L2))
	                 ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) COME.8.V)))))
	              ?L2)
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (ON.P ?X_B))
	               (OFF.ADV
	                ((ADV-A (TO.P ?L2))
	                 ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.19.V)))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B ADVENTURE.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O COMPOSITE-SCHEMA-142.PR ?X_K ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_E ADVENTURE.N))
			(!R2 (?X_F AGENT.N))
			(!R3 (?X_G (RIGHT-AFTER ?X_H)))
			(!R4 (?X_K HOUSE.N))
			(!R5 (?X_O (K BEST.A) FRIEND.N))
			(!R6 (?X_P SON.N))
			(!R7 (?X_P (PERTAIN-TO ?X_N)))
			(!R8 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_M (?X_P ((ADV-A (OUTSIDE.P (KA PLAY.V))) BE.V)))
			(?X_J (?X_O (BY.P ?X_K)))
			(?X_G (?X_O ((ADV-A (BY.P ?X_K)) COME.V)))
			(?X_D
	   (?X_F
	    ((ADV-A (ON.P ?X_E))
	     (OFF.ADV
	      ((ADV-A (TO.P ?L2))
	       ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.19.V)))))
	    ?L2))
			(?X_B
	   (?X_F
	    ((ADV-A (BEFORE.P (K DARK.N)))
	     (HOME.ADV
	      ((ADV-A (TO.P ?L2))
	       ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) COME.8.V)))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
			(!W2 (?X_M BEFORE ?X_J))
			(!W3 (?X_J BEFORE ?X_G))
		)
	)
	(
			"A son of X_N is outside playing."
			"A of a son of X_N is by."
			"A of a son of X_N comes by a house."
			"A agent go.27s L2 on a adventure off to L2 from L1 for L2."
			"A agent come.26s L2 before dark home to L2 from L1 for L2."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              (OVER.PRT
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?X_C)) ((ADV-A (FOR.P ?L2)) COME.9.V))))
	              ?L2)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D FRIEND.N))
			(!R2 (?X_C OUTSIDE.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_C = ?L2)))
			(!R5 (?X_C NOISE.N))
			(!R6 (?X_C LOUD.A))
			(!R7 (?X_B (OF.P ?X_C)))
			(!R8 (?X_B SOURCE.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?X_C)))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?X_C))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-143.PR ?X_M (K SCARED.A) ?X_F ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_F FRIEND.N))
			(!R2 (?X_I WOMAN.N))
			(!R3 (?X_M LOUD.A))
			(!R4 (?X_M OUTSIDE.N))
			(!R5 (?X_M NOISE.N))
			(!R6 (?X_L SOURCE.N))
			(!R7 (?X_L (OF.P ?X_M)))
		)
		(:STEPS
			(?X_K (?X_A (BE.V ?X_M)))
			(?X_H (?X_I (FEEL.V (K SCARED.A))))
			(?X_E (?X_I (CALL.V ?X_F)))
			(?X_C
	   (?X_F
	    (OVER.PRT
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?X_M)) ((ADV-A (FOR.P ?L2)) COME.9.V))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K BEFORE ?X_H))
			(!W2 (?X_H BEFORE ?X_E))
			(!W3 (?X_E BEFORE ?X_C))
		)
	)
	(
			"X_A is a loud outside noise."
			"A woman feels scared."
			"A woman calls a friend."
			"A friend come.42s L2 over to L2 from a loud outside noise for L2."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-144.PR (KA ((ADV-A (AROUND.P ?X_E)) RUN.V))
	              ?X_F (SET-OF (K NOTHING.N) (K DIRT.N)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_B SURPRISED.A))
			(!R2 (?X_B AGENT.N))
			(!R3 (?X_E POND.N))
			(!R4 (?X_F FALL.N))
		)
		(:STEPS
			(?X_D (?X_B (USED_TO.V (KA ((ADV-A (AROUND.P ?X_E)) RUN.V)))))
			(?X_H (?X_E ((THERE.ADV BE.V) ?X_F)))
			(?X_J (?X_A (BE.V (SET-OF (K NOTHING.N) (K DIRT.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_H)))
			(!W2 (?X_D (BEFORE ?X_J)))
			(!W3 (?X_H (BEFORE ?X_J)))
		)
	)
	(
			"A surprised agent used tos around a pond running."
			"A pond is a fall there."
			"X_A is nothing and dirt."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (FOR.P (K ((ADV-A (WITH.P ?X_D)) (TO.P ?X_E)))))
	               ((ADV-A (FROM.P ?L1))
	                ((ADV-A (TO.P (K ((ADV-A (WITH.P ?X_D)) (TO.P ?X_E)))))
	                 GO.20.V)))
	              (K ((ADV-A (WITH.P ?X_D)) (TO.P ?X_E))))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K ((ADV-A (WITH.P ?X_D)) (TO.P ?X_E))) LOCATION.N))
			(!R4 (NOT (?L1 = (K ((ADV-A (WITH.P ?X_D)) (TO.P ?X_E))))))
			(!R5 (?X_D FRIEND.N))
			(!R6 (?X_D (PERTAIN-TO ?X_C)))
			(!R7 (?X_C LATE.A))
			(!R8 (?X_E PARK.N))
			(!R9 (?X_B CURFEW.N))
			(!R10 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1
	   (?X_C
	    (WANT.V
	     (KA ((ADV-A (AT.P (K ((ADV-A (WITH.P ?X_D)) (TO.P ?X_E))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P (K ((ADV-A (WITH.P ?X_D)) (TO.P ?X_E)))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P (K ((ADV-A (WITH.P ?X_D)) (TO.P ?X_E))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E ((ADV-A (IN.P (K TROUBLE.N))) GET.35.V) ?O) ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?X_D PARK.N))
			(!R4 (NOT (?X_E = ?O)))
			(!R5 (?X_E LATE.A))
			(!R6 (?X_B (PERTAIN-TO ?X_E)))
			(!R7 (?X_B FRIEND.N))
			(!R8 (?X_C (PERTAIN-TO ?X_E)))
			(!R9 (?X_C CURFEW.N))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (?X_E (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_E HAVE.V ?O)))
			(?I2 (?X_E (AT.P ?X_D)))
			(?I3 (?O (AT.P ?X_D)))
		)
		(:POSTCONDS
			(?P1 (?X_E HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E ((ADV-A (IN.P (K TROUBLE.N))) GET.36.V) ?O) ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?X_D PARK.N))
			(!R4 (NOT (?X_E = ?O)))
			(!R5 (?X_E LATE.A))
			(!R6 (?X_B CURFEW.N))
			(!R7 (?X_B (PERTAIN-TO ?X_E)))
			(!R8 (?X_C (PERTAIN-TO ?X_E)))
			(!R9 (?X_C FRIEND.N))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (?X_E (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_E HAVE.V ?O)))
			(?I2 (?X_E (AT.P ?X_D)))
			(?I3 (?O (AT.P ?X_D)))
		)
		(:POSTCONDS
			(?P1 (?X_E HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_M COMPOSITE-SCHEMA-145.PR ?X_K ?X_L
	              (K ((ADV-A (WITH.P ?X_K)) (TO.P ?X_H))) ?O)
	             ** ?E)
		(:ROLES
			(!R1 (?X_L CURFEW.N))
			(!R2 (?X_H PARK.N))
			(!R3 (?X_K FRIEND.N))
			(!R4 (?X_M LATE.A))
			(!R5 (?X_M AGENT.N))
			(!R6 (?X_K (PERTAIN-TO ?X_M)))
			(!R7 (?X_L (PERTAIN-TO ?X_M)))
		)
		(:STEPS
			(?X_J (?X_M ((ADV-A (IN.P (K (L X (AND (X HIGH.A) (X SCHOOL.N)))))) BE.V)))
			(?X_E (?X_M (LOSE.V ?X_K)))
			(E87.SK (?X_M (FOR.P ?X_L)))
			(?X_G
	   (?X_M
	    ((ADV-A (FOR.P (K ((ADV-A (WITH.P ?X_K)) (TO.P ?X_H)))))
	     ((ADV-A (FROM.P ?L1))
	      ((ADV-A (TO.P (K ((ADV-A (WITH.P ?X_K)) (TO.P ?X_H))))) GO.20.V)))
	    (K ((ADV-A (WITH.P ?X_K)) (TO.P ?X_H)))))
			(?X_C (?X_M ((ADV-A (IN.P (K TROUBLE.N))) GET.35.V) ?O))
			(?X_C (?X_M ((ADV-A (IN.P (K TROUBLE.N))) GET.36.V) ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_C)))
			(!W2 (?X_J BEFORE ?X_E))
			(!W3 (?X_E BEFORE E87.SK))
		)
	)
	(
			"A late agent is in high school."
			"A late agent loses a friend of a late agent."
			"A late agent is for."
			"A late agent go.77s with a friend of a late agent to a park for with a friend of a late agent to a park from L1 to with a friend of a late agent to a park."
			"A late agent get.83s O in trouble."
			"A late agent get.87s O in trouble."
	)
)



(
	(EPI-SCHEMA ((?X_G COMPOSITE-SCHEMA-146.PR ?X_D) ** ?E)
		(:ROLES
			(!R1 (?X_D BEACH.N))
			(!R2 (?X_D DAY.N))
			(!R3 (?X_D GREAT.A))
			(!R4 (?X_G AGENT.N))
			(!R5 (?X_H AGENT.N))
		)
		(:STEPS
			(?X_F ((K (L X (AND (X LAST.A) (X WEEK.N)))) ?X_G (HAVE.V ?X_D)))
			(?X_B (?X_G GO.V))
			(?X_C (?X_G GO.V))
			(?X_J (?X_H ((ADV (RIGHT.ADV AWAY.A)) (IN.PRT JUMP.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_B)))
			(!W2 (?X_F (BEFORE ?X_C)))
			(!W3 (?X_F (BEFORE ?X_J)))
			(!W4 (?X_B (BEFORE ?X_C)))
			(!W5 (?X_B (BEFORE ?X_J)))
			(!W6 (?X_C (BEFORE ?X_J)))
		)
	)
	(
			"Last week has a beach day great."
			"A agent goes."
			"A agent goes."
			"A agent jumps ADV right away in."
	)
)



(
	(EPI-SCHEMA ((?X_Q COMPOSITE-SCHEMA-147.PR ?X_S (SET-OF ?X_S ?X_T)) ** ?E)
		(:ROLES
			(!R1 (?X_Q AGENT.N))
			(!R2 (?X_R (PERTAIN-TO ?X_Q)))
			(!R3 (?X_S CAT.N))
			(!R4 (?X_S (PERTAIN-TO ?X_Q)))
			(!R5 (?X_R ?X_S CAT.N))
			(!R6 (?X_T BLACK.A))
			(!R7 (?X_T RAT.N))
			(!R8 (?X_S (HAS.V ?X_T)))
		)
		(:STEPS
			(?X_B (?X_Q (HAVE.V ?X_S)))
			(?X_D (?X_Q (CAN.AUX SEE.V)))
			(?X_F (?X_Q (CAN.AUX (SEE.V ?X_S))))
			(?X_H (?X_T (CAN.AUX SEE.V)))
			(?X_J (?X_S (CAN.AUX SEE.V)))
			(?X_L (?X_T (CAN.AUX (SEE.V ?X_S))))
			(?X_N (?X_T RUN.V))
			(?X_P (?X_R RUN.V))
			(?X_V (?X_Q (CAN.AUX (SEE.V (SET-OF ?X_S ?X_T)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_D)))
			(!W2 (?X_B (BEFORE ?X_F)))
			(!W3 (?X_B (BEFORE ?X_H)))
			(!W4 (?X_B (BEFORE ?X_J)))
			(!W5 (?X_B (BEFORE ?X_L)))
			(!W6 (?X_B (BEFORE ?X_N)))
			(!W7 (?X_B (BEFORE ?X_P)))
			(!W8 (?X_B (BEFORE ?X_V)))
			(!W9 (?X_D (BEFORE ?X_F)))
			(!W10 (?X_D (BEFORE ?X_H)))
			(!W11 (?X_D (BEFORE ?X_J)))
			(!W12 (?X_D (BEFORE ?X_L)))
			(!W13 (?X_D (BEFORE ?X_N)))
			(!W14 (?X_D (BEFORE ?X_P)))
			(!W15 (?X_D (BEFORE ?X_V)))
			(!W16 (?X_F (BEFORE ?X_H)))
			(!W17 (?X_F (BEFORE ?X_J)))
			(!W18 (?X_F (BEFORE ?X_L)))
			(!W19 (?X_F (BEFORE ?X_N)))
			(!W20 (?X_F (BEFORE ?X_P)))
			(!W21 (?X_F (BEFORE ?X_V)))
			(!W22 (?X_H (BEFORE ?X_J)))
			(!W23 (?X_H (BEFORE ?X_L)))
			(!W24 (?X_H (BEFORE ?X_N)))
			(!W25 (?X_H (BEFORE ?X_P)))
			(!W26 (?X_H (BEFORE ?X_V)))
			(!W27 (?X_J (BEFORE ?X_L)))
			(!W28 (?X_J (BEFORE ?X_N)))
			(!W29 (?X_J (BEFORE ?X_P)))
			(!W30 (?X_J (BEFORE ?X_V)))
			(!W31 (?X_L (BEFORE ?X_N)))
			(!W32 (?X_L (BEFORE ?X_P)))
			(!W33 (?X_L (BEFORE ?X_V)))
			(!W34 (?X_N (BEFORE ?X_P)))
			(!W35 (?X_N (BEFORE ?X_V)))
			(!W36 (?X_P (BEFORE ?X_V)))
		)
	)
	(
			"A agent has a cat has a black rat of a agent."
			"A agent sees can."
			"A agent sees a cat has a black rat of a agent can."
			"A black rat sees can."
			"A cat has a black rat of a agent sees can."
			"A black rat sees a cat has a black rat of a agent can."
			"A black rat runs."
			"A of a agent runs."
			"A agent sees a cat has a black rat of a agent and a black rat can."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-148.PR) ** ?E)
		(:ROLES
			(!R1 (?X_A (PLUR GIRL.N)))
			(!R2 (?X_B (GLAD.A (KA (SEE.V ?X_A)))))
			(!R3 (?X_B BABY.N))
			(!R4 (?X_D (IMPINGES-ON ?X_E)))
		)
		(:STEPS
			(?X_D
	   (?X_A (KA HAVE.V)
	    ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_B)) PLAY.V)))) |4.2.2.V|)))
		)
	)
	(
			"A girls 4.2.2 for with a glad seeing a girls baby playing."
	)
)



(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-149.PR (KE (?X_J (HAVE.V ?X_F))) ?X_J ?X_K) **
	             ?E)
		(:ROLES
			(!R1 (?X_A STREET.N))
			(!R2 (?X_F WATCH.N))
			(!R3 (?X_I AGENT.N))
			(!R4 (?X_J GUY.N))
			(!R5 (?X_K TIME.N))
		)
		(:STEPS
			(?X_C (?X_I ((ADV-A (DOWN.P ?X_A)) WALK.V)))
			(?X_E (?X_I (NOTICE.V (KE (?X_J (HAVE.V ?X_F))))))
			(?X_H (?X_I (NOTICE.V (KE (?X_J (HAVE.V ?X_F))))))
			(?X_M (?X_I (ASK.V ?X_J ?X_K)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_H)))
			(!W3 (?X_C (BEFORE ?X_M)))
			(!W4 (?X_E (BEFORE ?X_H)))
			(!W5 (?X_E (BEFORE ?X_M)))
			(!W6 (?X_H (BEFORE ?X_M)))
		)
	)
	(
			"A agent walks down a street."
			"A agent notices a guy has a watch."
			"A agent notices a guy has a watch."
			"A agent asks a guy a time."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-150.PR ?X_B
	              (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_A DAY.N))
			(!R2 (?X_B (VERY.ADV SHY.A)))
			(!R3 (?X_B (IS.V ?X_C)))
			(!R4 (?X_D AGENT.N))
			(!R5 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:STEPS
			(?X_F (?X_A ?X_D (ASK.V ?X_B (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_O COMPOSITE-SCHEMA-151.PR ?X_A ?X_N ?X_H
	              (KE ((K (PLUR PET.N)) (IN.P ?X_K))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F (RIGHT-AFTER ?X_G)))
			(!R2 (?X_H PET.N))
			(!R3 (?X_N (PLUR PARENT.N)))
			(!R4 (?X_K HOUSE.N))
			(!R5 (?X_L (RIGHT-AFTER ?X_M)))
			(!R6 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_C (?X_O (BE.V ?X_A)))
			(?X_E (?X_O (WITH.P ?X_N)))
			(?X_F (?X_O ((ADV-A (WITH.P ?X_N)) LIVE.V)))
			(?X_J (?X_O (WANT.V ?X_H)))
			(?X_L (NOT (?X_N (DID.AUX (ALLOW.V (KE ((K (PLUR PET.N)) (IN.P ?X_K))))))))
			(?X_Q (?X_O CRY.V))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_F)))
			(!W3 (?X_C (BEFORE ?X_J)))
			(!W4 (?X_C (BEFORE ?X_L)))
			(!W5 (?X_C (BEFORE ?X_Q)))
			(!W6 (?X_E (BEFORE ?X_F)))
			(!W7 (?X_E (BEFORE ?X_J)))
			(!W8 (?X_E (BEFORE ?X_L)))
			(!W9 (?X_E (BEFORE ?X_Q)))
			(!W10 (?X_F (BEFORE ?X_J)))
			(!W11 (?X_F (BEFORE ?X_L)))
			(!W12 (?X_F (BEFORE ?X_Q)))
			(!W13 (?X_J (BEFORE ?X_L)))
			(!W14 (?X_J (BEFORE ?X_Q)))
			(!W15 (?X_L (BEFORE ?X_Q)))
		)
	)
	(
			"A day asks a very shy is a of a agent with a agent playing."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              ((ADV-A (TO.P ?X_E))
	               ((ADV-A (TO.P ?X_E))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_E)) GO.21.V))))
	              ?X_E)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_E LOCATION.N))
			(!R4 (NOT (?L1 = ?X_E)))
			(!R5 (?X_E BEST.A))
			(!R6 (?X_E BUY.N))
			(!R7 (?X_B (PERTAIN-TO ?X_D)))
			(!R8 (?X_C GOOD.A))
			(!R9 (?X_B ?X_C TV.N))
			(!R10 (?X_C TV.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?X_E)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P ?X_E))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_H)))
			(!W7 (?X_G (AT-ABOUT ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D
	              ((ADV-A (TO.P ?X_E))
	               ((ADV-A (TO.P ?X_E))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_E)) GO.22.V))))
	              ?X_E)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_E LOCATION.N))
			(!R4 (NOT (?L1 = ?X_E)))
			(!R5 (?X_E BEST.A))
			(!R6 (?X_E BUY.N))
			(!R7 (?X_A (PERTAIN-TO ?X_D)))
			(!R8 (?X_A ?X_B TV.N))
			(!R9 (?X_B TV.N))
			(!R10 (?X_B GOOD.A))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?X_E)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P ?X_E))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_H)))
			(!W7 (?X_G (AT-ABOUT ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N COMPOSITE-SCHEMA-152.PR ?X_M ?X_O ?X_J) ** ?E)
		(:ROLES
			(!R1 (?X_C (RIGHT-AFTER ?X_D)))
			(!R2 (?X_G TV.N))
			(!R3 (?X_J BEST.A))
			(!R4 (?X_J BUY.N))
			(!R5 (?X_M NEW.A))
			(!R6 (?X_M TV.N))
			(!R7 (?X_O (PERTAIN-TO ?X_N)))
			(!R8 (?X_P GOOD.A))
			(!R9 (?X_P TV.N))
			(!R10 (?X_O ?X_P TV.N))
		)
		(:STEPS
			(?X_L (?X_N (WANT.V ?X_M)))
			(?X_F (?X_N ((ADV-A (AT.P ?X_G)) LOOK.V)))
			(?X_C (?X_N (LOVE.V ?X_O)))
			(?X_B (?X_N (LOVE.V ?X_O)))
			(?X_I
	   (?X_N
	    ((ADV-A (TO.P ?X_J))
	     ((ADV-A (TO.P ?X_J))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_J)) GO.21.V))))
	    ?X_J))
			(?X_I
	   (?X_N
	    ((ADV-A (TO.P ?X_J))
	     ((ADV-A (TO.P ?X_J))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_J)) GO.22.V))))
	    ?X_J))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L BEFORE ?X_F))
			(!W2 (?X_F BEFORE ?X_C))
			(!W3 (?X_C BEFORE ?X_B))
			(!W4 (?X_B BEFORE ?X_I))
		)
	)
	(
			"X_O is X_A."
			"X_O is with."
			"X_O lives with a parents of X_O."
			"X_O wants a pet."
			"A parents of X_O allows pets in a house not did."
			"X_O cries."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-153.PR ?X_E) ** ?E)
		(:ROLES
			(!R1 (?X_A (PLUR FLOWER.N)))
			(!R2 (?X_D RAIN.N))
			(!R3 (?X_E GRASS.N))
		)
		(:STEPS
			(?X_C (?X_A GROW.V))
			(?X_G (?X_D (MAKE.V ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_G)))
		)
	)
	(
			"X_N wants a new tv."
			"X_N looks at a tv."
			"X_N loves a of X_N."
			"X_N loves a of X_N."
			"X_N go.24s a best buy to a best buy to a best buy from L1 for a best buy."
			"X_N go.25s a best buy to a best buy to a best buy from L1 for a best buy."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              ((ADV-A (IN.P ?X_A))
	               (OUTSIDE.ADV
	                ((ADV-A (TO.P ?L2))
	                 ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.23.V)))))
	              ?L2)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A YARD.N))
			(!R6 (?X_C (PERTAIN-TO ?X_D)))
			(!R7 (?X_C DOG.N))
			(!R8 (?X_C HOUSE.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D
	              ((ADV-A (INSIDE.P ?X_A))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.24.V))))
	              ?L2)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A THING.N))
			(!R6 (?X_A NEW.A))
			(!R7 (?X_B (PERTAIN-TO ?X_D)))
			(!R8 (?X_B HOUSE.N))
			(!R9 (?X_B DOG.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_G)))
			(!W7 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D
	              ((ADV-A (IN.P ?X_B))
	               (OUTSIDE.ADV
	                ((ADV-A (TO.P ?L2))
	                 ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.11.V)))))
	              ?L2)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B YARD.N))
			(!R6 (?X_C (PERTAIN-TO ?X_D)))
			(!R7 (?X_C HOUSE.N))
			(!R8 (?X_C DOG.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_S COMPOSITE-SCHEMA-154.PR ?X_N ?X_R ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_B (RIGHT-AFTER ?X_C)))
			(!R2 (?X_R HOUSE.N))
			(!R3 (?X_R DOG.N))
			(!R4 (?X_N THING.N))
			(!R5 (?X_N NEW.A))
			(!R6 (?X_Q YARD.N))
			(!R7 (?X_S DOG.N))
			(!R8 (?X_R (PERTAIN-TO ?X_S)))
		)
		(:STEPS
			(?X_M (?X_A (((ADV-A (IN.P ?X_Q)) BE.V) ?X_N)))
			(?X_K (?X_S (SNIFF.V ?X_N)))
			(?X_E (?X_R (LIKE.V ?X_R)))
			(?X_B (?X_R (LIKE.V ?X_R)))
			(?X_P
	   (?X_S
	    ((ADV-A (IN.P ?X_Q))
	     (OUTSIDE.ADV
	      ((ADV-A (TO.P ?L2))
	       ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.23.V)))))
	    ?L2))
			(?X_P
	   (?X_S
	    ((ADV-A (IN.P ?X_Q))
	     (OUTSIDE.ADV
	      ((ADV-A (TO.P ?L2))
	       ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.11.V)))))
	    ?L2))
			(?X_G (?X_S SLEEP.V))
			(?X_I
	   (?X_S
	    ((ADV-A (INSIDE.P ?X_N))
	     ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) GO.24.V))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_P (BEFORE ?X_G)))
			(!W2 (?X_P (BEFORE ?X_I)))
			(!W3 (?X_M BEFORE ?X_K))
			(!W4 (?X_K BEFORE ?X_E))
			(!W5 (?X_E BEFORE ?X_B))
		)
	)
	(
			"A flowers grow."
			"A rain makes a grass."
	)
)



(
	(EPI-SCHEMA ((?X_B (NEVER.ADV GET.37.V)
	              (K (L X (AND (X ALONG.P) (X (WITH.P ?X_D))))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((K (L X (AND (X ALONG.P) (X (WITH.P ?X_D))))) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K (L X (AND (X ALONG.P) (X (WITH.P ?X_D))))))))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V
	     (THAT (?X_B (HAVE.V (K (L X (AND (X ALONG.P) (X (WITH.P ?X_D)))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (K (L X (AND (X ALONG.P) (X (WITH.P ?X_D))))))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((K (L X (AND (X ALONG.P) (X (WITH.P ?X_D))))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (K (L X (AND (X ALONG.P) (X (WITH.P ?X_D)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B (INSTEAD.ADV GET.38.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C NEW.A))
			(!R6 (?X_C CAT.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_F COMPOSITE-SCHEMA-155.PR ?X_C ?X_G) ** ?E)
		(:ROLES
			(!R1 (?X_C LOT.N))
			(!R2 (?X_F AGENT.N))
			(!R3 (?X_G KINDLE.A))
			(!R4 (?X_G GREAT.A))
			(!R5 (?X_G BOOK.N))
			(!R6 (?X_G IMPRESSIVE.A))
		)
		(:STEPS
			(?X_B ((K YESTERDAY.N) ?X_F (GET.V ?X_G)))
			(?X_E (?X_F (LIKE.V ?X_G ?X_C)))
			(?X_I (?X_F (((ADV-A (IN.P (TWO.D (PLUR DAY.N)))) READ.V) ?X_G)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_E)))
			(!W2 (?X_B (BEFORE ?X_I)))
			(!W3 (?X_E (BEFORE ?X_I)))
		)
	)
	(
			"X_A is a thing new in a yard."
			"A dog sniffs a thing new."
			"A house dog of a dog likes a house dog of a dog."
			"A house dog of a dog likes a house dog of a dog."
			"A dog go.50s L2 in a yard outside to L2 from L1 for L2."
			"A dog go.52s L2 in a yard outside to L2 from L1 for L2."
			"A dog sleeps."
			"A dog go.51s L2 inside a thing new to L2 from L1 for L2."
	)
)



(
	(EPI-SCHEMA ((?X_C GET.39.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D INTERVIEW.N))
			(!R6 (?X_B JOB.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?X_D)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_D (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O COMPOSITE-SCHEMA-156.PR ?X_N (K SAD.A)
	              (K (L X (AND (X AT.P) (X FIRST.A)))) ?X_D)
	             ** ?E)
		(:ROLES
			(!R1 (?X_D INTERVIEW.N))
			(!R2 (?X_G NEW.A))
			(!R3 (?X_G JOB.N))
			(!R4 (?X_L (RIGHT-AFTER ?X_M)))
			(!R5 (?X_N JOB.N))
			(!R6 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_L (?X_O (LOSE.V ?X_N)))
			(?X_K (?X_O (LOSE.V ?X_N)))
			(?X_I (?X_O (BE.V (K SAD.A) (K (L X (AND (X AT.P) (X FIRST.A)))))))
			(?X_F (?X_O ((ADV-A (FOR.P ?X_G)) LOOK.V)))
			(?X_C (?X_O GET.39.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L BEFORE ?X_K))
			(!W2 (?X_K BEFORE ?X_I))
			(!W3 (?X_I BEFORE ?X_F))
			(!W4 (?X_F BEFORE ?X_C))
		)
	)
	(
			"Yesterday gets a kindle great book impressive."
			"A agent likes a kindle great book impressive a lot."
			"A agent reads a kindle great book impressive in two days."
	)
)



(
	(EPI-SCHEMA ((?X_C GET.40.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D GREAT.A))
			(!R6 (?X_D DOG.N))
			(!R7 (?X_D FAMILY.N))
			(!R8 (?X_C (SO.ADV HAPPY.A)))
			(!R9 (?X_C HAPPY.A))
			(!R10 (?X_A (PERTAIN-TO ?X_C)))
			(!R11 (?X_A MOTHER.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?X_D)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_D (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_G)))
			(!W7 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.11.V ?X_D ?A) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D MOTHER.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_C (SO.ADV HAPPY.A)))
			(!R5 (?X_C HAPPY.A))
			(!R6 (?X_D (PERTAIN-TO ?X_C)))
			(!R7 (?X_F (RIGHT-AFTER ?X_B)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V ?X_D ?A)))
			(?G2 (?X_C (WANT.V (THAT (?X_C (DO.V ?A))))))
		)
		(:STEPS
			(?X_E (?X_C (ASK.V ?X_D ?A)))
			(?E2 (?X_D (DO.V ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?X_E))
			(!W2 (?X_E CAUSE-OF ?E2))
			(!W3 (?X_E (BEFORE ?X_G)))
			(!W4 (?X_F (SAME-TIME ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.12.V ?X_D ?A) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D MOTHER.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_C (SO.ADV HAPPY.A)))
			(!R5 (?X_C HAPPY.A))
			(!R6 (?X_D (PERTAIN-TO ?X_C)))
			(!R7 (?X_E (RIGHT-AFTER ?X_A)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V ?X_D ?A)))
			(?G2 (?X_C (WANT.V (THAT (?X_C (DO.V ?A))))))
		)
		(:STEPS
			(?X_E (?X_C (ASK.V ?X_D ?A)))
			(?E2 (?X_D (DO.V ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?X_E))
			(!W2 (?X_E CAUSE-OF ?E2))
			(!W3 (?X_E (SAME-TIME ?X_G)))
			(!W4 (?X_F (BEFORE ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_R COMPOSITE-SCHEMA-157.PR ?X_A ?X_L ?X_Q ?A) ** ?E)
		(:ROLES
			(!R1 (?X_F (RIGHT-AFTER ?X_G)))
			(!R2 (?X_L GREAT.A))
			(!R3 (?X_L FAMILY.N))
			(!R4 (?X_L DOG.N))
			(!R5 (?X_O (RIGHT-AFTER ?X_P)))
			(!R6 (?X_Q MOTHER.N))
			(!R7 (?X_Q (PERTAIN-TO ?X_R)))
			(!R8 (?X_R AGENT.N))
			(!R9 (?A ACTION.N))
		)
		(:STEPS
			(?X_K (?X_R (WANT.V ?X_L)))
			(?X_F (?X_Q (SAY.V ?X_A)))
			(?X_E (?X_Q (SAY.V ?X_A)))
			(?X_C (?X_R GET.40.V ?X_L))
			(?E_1 (?X_R REQUEST_ACTION.11.V ?X_Q ?A))
			(?E_2 (?X_R REQUEST_ACTION.12.V ?X_Q ?A))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K BEFORE ?X_F))
			(!W2 (?X_F BEFORE ?X_E))
			(!W3 (?X_E BEFORE ?X_C))
			(!W4 (?X_C BEFORE ?E_1))
			(!W5 (?E_1 BEFORE ?E_2))
		)
	)
	(
			"X_O loses a job of X_O."
			"X_O loses a job of X_O."
			"X_O is sad at first."
			"X_O looks for a new job."
			"X_O get.122s a interview."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (IN.P ?X_C))
	               ((ADV-A (IN.P ?X_C)) ((ADV-A (ON.P ?X_C)) SIT.8.V))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_C FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_C HOUSE.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L)))
			(?I2 (?X_C (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C COMPOSITE-SCHEMA-158.PR) ** ?E)
		(:ROLES
			(!R1 (?X_C GARBAGE.N))
			(!R2 (?X_C (VERY.ADV BAD.A)))
			(!R3 (?X_F HOUSE.N))
			(!R4 (?X_G AGENT.N))
		)
		(:STEPS
			(?X_B (?X_C ((ADV-A (FOR.P (KA SMELL.N))) START.V)))
			(?X_E
	   (?X_G
	    ((ADV-A (IN.P ?X_F))
	     ((ADV-A (IN.P ?X_F)) ((ADV-A (ON.P ?X_F)) SIT.8.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B BEFORE ?X_E))
		)
	)
	(
			"A agent wants a great family dog."
			"A mother of a agent says X_A."
			"A mother of a agent says X_A."
			"A agent get.143s a great family dog."
			"A agent request action.133s a mother of a agent a action."
			"A agent request action.137s a mother of a agent a action."
	)
)



(
	(EPI-SCHEMA ((?X_D TELL_INFORMATION.3.V ?X_E (KA (AWAY.ADV STAY.V))) ** ?E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E AGENT.N))
			(!R3 ((KA (AWAY.ADV STAY.V)) INFORMATION.N))
			(!R4 (?X_B (PERTAIN-TO ?X_E)))
			(!R5 (?X_B CANDY.N))
			(!R6 (?X_C (PERTAIN-TO ?X_E)))
			(!R7 (?X_C HOUSE.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_E (KNOW.V (KA (AWAY.ADV STAY.V))))))))
		)
		(:STEPS
			(?X_F (?X_D (TELL.V ?X_E (KA (AWAY.ADV STAY.V)))))
		)
		(:POSTCONDS
			(?P1 (?X_E (KNOW.V (KA (AWAY.ADV STAY.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AT-ABOUT ?X_G)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D TELL_INFORMATION.4.V ?X_E (KA (AWAY.ADV STAY.V))) ** ?E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E AGENT.N))
			(!R3 ((KA (AWAY.ADV STAY.V)) INFORMATION.N))
			(!R4 (?X_B HOUSE.N))
			(!R5 (?X_B (PERTAIN-TO ?X_E)))
			(!R6 (?X_C (PERTAIN-TO ?X_E)))
			(!R7 (?X_C CANDY.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_E (KNOW.V (KA (AWAY.ADV STAY.V))))))))
		)
		(:STEPS
			(?X_F (?X_D (TELL.V ?X_E (KA (AWAY.ADV STAY.V)))))
		)
		(:POSTCONDS
			(?P1 (?X_E (KNOW.V (KA (AWAY.ADV STAY.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AT-ABOUT ?X_G)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_K COMPOSITE-SCHEMA-159.PR ?X_N ?X_O (K (UP.ADV (TO.P ?X_O))) ?X_P
	              ?X_Q (KA (AWAY.ADV STAY.V)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E (RIGHT-AFTER ?X_F)))
			(!R2 (?X_P CANDY.N))
			(!R3 (?X_G (RIGHT-AFTER ?X_H)))
			(!R4 (?X_O HOUSE.N))
			(!R5 (?X_K MAN.N))
			(!R6 (?X_N LITTLE.A))
			(!R7 (?X_N GIRL.N))
			(!R8 (?X_O (PERTAIN-TO ?X_Q)))
			(!R9 (?X_P (PERTAIN-TO ?X_Q)))
			(!R10 (?X_Q AGENT.N))
			(!R11 (?X_R AGENT.N))
			(!R12 ((KA (AWAY.ADV STAY.V)) INFORMATION.N))
		)
		(:STEPS
			(?X_M (?X_Q (BE.V ?X_N)))
			(?X_J (?X_K (UP.ADV (TO.P ?X_O))))
			(?X_G (?X_K (PULL.V (K (UP.ADV (TO.P ?X_O))))))
			(?X_E (?X_K (OFFER.V ?X_P)))
			(?X_D (?X_K (OFFER.V ?X_P)))
			(?E_1 (?X_R TELL_INFORMATION.3.V ?X_Q (KA (AWAY.ADV STAY.V))))
			(?E_2 (?X_R TELL_INFORMATION.4.V ?X_Q (KA (AWAY.ADV STAY.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_J)))
			(!W2 (?X_M (BEFORE ?X_G)))
			(!W3 (?X_M (BEFORE ?X_E)))
			(!W4 (?X_M (BEFORE ?X_D)))
			(!W5 (?X_M (BEFORE ?E_1)))
			(!W6 (?X_M (BEFORE ?E_2)))
			(!W7 (?X_J (BEFORE ?X_G)))
			(!W8 (?X_J (BEFORE ?X_E)))
			(!W9 (?X_J (BEFORE ?X_D)))
			(!W10 (?X_J (BEFORE ?E_1)))
			(!W11 (?X_J (BEFORE ?E_2)))
			(!W12 (?X_G (BEFORE ?X_E)))
			(!W13 (?X_G (BEFORE ?X_D)))
			(!W14 (?X_G (BEFORE ?E_1)))
			(!W15 (?X_G (BEFORE ?E_2)))
			(!W16 (?X_E (BEFORE ?X_D)))
			(!W17 (?X_E (BEFORE ?E_1)))
			(!W18 (?X_E (BEFORE ?E_2)))
			(!W19 (?X_D (BEFORE ?E_1)))
			(!W20 (?X_D (BEFORE ?E_2)))
			(!W21 (?E_1 (BEFORE ?E_2)))
		)
	)
	(
			"A garbage very bad starts for smell."
			"A agent sit.159s in a house in a house on a house."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (AWAY.PRT
	               (QUICKLY.ADV
	                ((ADV-A (TO.P ?L2))
	                 ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.15.V)))))
	              ?L2)
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_H COMPOSITE-SCHEMA-160.PR ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_F FENCE.N))
			(!R3 (?X_G (PERTAIN-TO ?X_H)))
		)
		(:STEPS
			(?X_E (?X_H ((ADV-A (BEHIND.P ?X_F)) BE.V)))
			(?X_B
	   (?X_C
	    (AWAY.PRT
	     (QUICKLY.ADV
	      ((ADV-A (TO.P ?L2))
	       ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) RUN.15.V)))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E BEFORE ?X_B))
		)
	)
	(
			"A agent is a little girl."
			"A man is up to."
			"A man pulls up to a house of a agent."
			"A man offers a candy of a agent."
			"A man offers a candy of a agent."
			"A agent tell information.192s a agent away stay."
			"A agent tell information.193s a agent away stay."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (TO.P (K PRISON.N)))
	               ((ADV-A (TO.P (K PRISON.N)))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (FOR.P (K PRISON.N))) GO.25.V))))
	              (K PRISON.N))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K PRISON.N) LOCATION.N))
			(!R4 (NOT (?L1 = (K PRISON.N))))
			(!R5 (?X_B INNOCENT.A))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (K PRISON.N))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K PRISON.N)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K PRISON.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J COMPOSITE-SCHEMA-161.PR (FIVE.D (PLUR YEAR.N)) (KA INNOCENT.A)
	              (K PRISON.N))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J MAN.N))
			(!R2 (?X_J INNOCENT.A))
		)
		(:STEPS
			(?X_G (?X_J ((ADV-A (FOR.P (ANOTHER.D TRIAL.N))) ASK.V)))
			(?X_E
	   (?X_A
	    (((ADV-A (FOR.P (KA (GET.V (K ONE.N))))) TAKE.V) (FIVE.D (PLUR YEAR.N)))))
			(?X_C (?X_J (KA BE.V) ((PASV FIND.V) (KA INNOCENT.A))))
			(?X_I
	   (?X_J
	    ((ADV-A (TO.P (K PRISON.N)))
	     ((ADV-A (TO.P (K PRISON.N)))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P (K PRISON.N))) GO.25.V))))
	    (K PRISON.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G BEFORE ?X_E))
			(!W2 (?X_E BEFORE ?X_C))
			(!W3 (?X_C BEFORE ?X_I))
		)
	)
	(
			"X_H is behind a fence."
			"A agent run.206s L2 away quickly to L2 from L1 for L2."
	)
)



(
	(EPI-SCHEMA ((?X_K COMPOSITE-SCHEMA-162.PR (ALL.D DAY.N)
	              (K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N))))))
	              (KE (?X_K OUTSIDE.A)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_B CAGE.N))
			(!R2 (?X_G FAMILY.N))
			(!R3 (?X_J NEXT.A))
			(!R4 (?X_J FAMILY.N))
			(!R5 (?X_K DOG.N))
		)
		(:STEPS
			(?X_D (?X_K ((ADV-A (IN.P ?X_B)) BE.V)))
			(?X_F (?X_K (HOWL.V (ALL.D DAY.N))))
			(?X_I (?X_G (GET.V (K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N)))))))))
			(?X_M (?X_J (LET.V (KE (?X_K OUTSIDE.A)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_I)))
			(!W3 (?X_D (BEFORE ?X_M)))
			(!W4 (?X_F (BEFORE ?X_I)))
			(!W5 (?X_F (BEFORE ?X_M)))
			(!W6 (?X_I (BEFORE ?X_M)))
		)
	)
	(
			"A dog is in a cage."
			"A dog howls all day."
			"A family gets rid of."
			"A next family lets a dog outside."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P (K HOME.N))) TAKE.25.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C (PLUR BOOK.N)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (IN.P ?X_C))
	               ((ADV-A (IN.P ?X_C)) ((ADV-A (ON.P ?X_C)) SIT.9.V))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_C FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_C BAG.N))
			(!R6 (?X_C BEAN.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L)))
			(?I2 (?X_C (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_K COMPOSITE-SCHEMA-163.PR ?X_D ?X_J) ** ?E)
		(:ROLES
			(!R1 (?X_D (MOST.ADV RELAXING.A)))
			(!R2 (?X_D DAY.N))
			(!R3 (?X_G BEAN.N))
			(!R4 (?X_G BAG.N))
			(!R5 (?X_J (PLUR BOOK.N)))
			(!R6 (?X_K AGENT.N))
			(!R7 (?X_N READ.N))
			(!R8 (?X_N (IN.P ?X_O)))
			(!R9 (?X_P AGENT.N))
		)
		(:STEPS
			(?X_M (?X_P ?X_N ((ADV-A (AT.P (K SCHOOL.N))) HAVE.V)))
			(?X_C (?X_A ((EVER.ADV BE.V) ?X_D)))
			(?X_I (?X_K ((ADV-A (FROM.P (K HOME.N))) TAKE.25.V) ?X_J))
			(?X_F
	   (?X_K
	    ((ADV-A (IN.P ?X_G))
	     ((ADV-A (IN.P ?X_G)) ((ADV-A (ON.P ?X_G)) SIT.9.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_F)))
			(!W2 (?X_M BEFORE ?X_C))
		)
	)
	(
			"A agent has at school."
			"X_A is a most relaxing day ever."
			"A agent take.221s a books from home."
			"A agent sit.226s in a bean bag in a bean bag on a bean bag."
	)
)



(
	(EPI-SCHEMA ((?X_O COMPOSITE-SCHEMA-164.PR ?X_N ?X_I ?X_B) ** ?E)
		(:ROLES
			(!R1 (?X_N WAY.N))
			(!R2 (?X_N (TO.P (K BED.N))))
			(!R3 (?X_G (RIGHT-AFTER ?X_H)))
			(!R4 (?X_I LATE.A))
			(!R5 (?X_I NIGHT.N))
			(!R6 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_F (?X_O (ON.P ?X_N)))
			(?X_G (?X_O ((ADV-A (ON.P ?X_N)) BE.V)))
			(?X_K (?X_O (HAVE.V ?X_I)))
			(?X_M (?X_O ((ADV-A (FOR.P (EIGHT.D (PLUR HOUR.N)))) SLEEP.V)))
			(?X_C (?X_O (UP.PRT WAKE.V)))
			(?X_D (?X_O (UP.PRT WAKE.V)))
			(?X_Q (?X_A (BE.V ?X_B)))
			(?X_S (?X_A (BE.V ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_G)))
			(!W2 (?X_F (BEFORE ?X_K)))
			(!W3 (?X_F (BEFORE ?X_M)))
			(!W4 (?X_F (BEFORE ?X_C)))
			(!W5 (?X_F (BEFORE ?X_D)))
			(!W6 (?X_F (BEFORE ?X_Q)))
			(!W7 (?X_F (BEFORE ?X_S)))
			(!W8 (?X_G (BEFORE ?X_K)))
			(!W9 (?X_G (BEFORE ?X_M)))
			(!W10 (?X_G (BEFORE ?X_C)))
			(!W11 (?X_G (BEFORE ?X_D)))
			(!W12 (?X_G (BEFORE ?X_Q)))
			(!W13 (?X_G (BEFORE ?X_S)))
			(!W14 (?X_K (BEFORE ?X_M)))
			(!W15 (?X_K (BEFORE ?X_C)))
			(!W16 (?X_K (BEFORE ?X_D)))
			(!W17 (?X_K (BEFORE ?X_Q)))
			(!W18 (?X_K (BEFORE ?X_S)))
			(!W19 (?X_M (BEFORE ?X_C)))
			(!W20 (?X_M (BEFORE ?X_D)))
			(!W21 (?X_M (BEFORE ?X_Q)))
			(!W22 (?X_M (BEFORE ?X_S)))
			(!W23 (?X_C (BEFORE ?X_D)))
			(!W24 (?X_C (BEFORE ?X_Q)))
			(!W25 (?X_C (BEFORE ?X_S)))
			(!W26 (?X_D (BEFORE ?X_Q)))
			(!W27 (?X_D (BEFORE ?X_S)))
			(!W28 (?X_Q (BEFORE ?X_S)))
		)
	)
	(
			"X_O is on."
			"X_O is on a way to bed of X_O."
			"X_O has a late night."
			"X_O sleeps for eight hours."
			"X_O wakes up."
			"X_O wakes up."
			"X_A is X_B."
			"X_A is X_B."
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (ON.P ?X_E)) ((ADV-A (IN.P ?X_E)) SIT.10.V))) **
	             ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?X_E FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_D (VERY.ADV NERVOUS.A)))
			(!R6 (?X_D NEXT.A))
			(!R7 (?X_A FRIEND.N))
			(!R8 (?X_A (PERTAIN-TO ?X_D)))
			(!R9 (?X_F (RIGHT-AFTER ?X_B)))
			(!R10 (?X_E CLASSROOM.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L)))
			(?I2 (?X_E (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (SAME-TIME ?X_G)))
			(!W2 (?X_J (BEFORE ?X_G)))
			(!W3 (?X_H (DURING ?X_J)))
			(!W4 (?X_I (CONSEC ?X_H)))
			(!W5 (?X_I (DURING ?X_J)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (ON.P ?X_E)) ((ADV-A (IN.P ?X_E)) SIT.11.V))) **
	             ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?X_E FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_D NEXT.A))
			(!R6 (?X_D (VERY.ADV NERVOUS.A)))
			(!R7 (?X_A FRIEND.N))
			(!R8 (?X_A (PERTAIN-TO ?X_D)))
			(!R9 (?X_F (RIGHT-AFTER ?X_B)))
			(!R10 (?X_E CLASSROOM.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L)))
			(?I2 (?X_E (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (SAME-TIME ?X_G)))
			(!W2 (?X_H (BEFORE ?X_G)))
			(!W3 (?X_J (DURING ?X_H)))
			(!W4 (?X_I (DURING ?X_H)))
			(!W5 (?X_I (CONSEC ?X_J)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (ON.P ?X_E)) ((ADV-A (IN.P ?X_E)) SIT.12.V))) **
	             ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?X_E FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_D NEXT.A))
			(!R6 (?X_D (VERY.ADV NERVOUS.A)))
			(!R7 (?X_A FRIEND.N))
			(!R8 (?X_A (PERTAIN-TO ?X_D)))
			(!R9 (?X_F (RIGHT-AFTER ?X_B)))
			(!R10 (?X_E CLASSROOM.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L)))
			(?I2 (?X_E (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (SAME-TIME ?X_G)))
			(!W2 (?X_J (BEFORE ?X_G)))
			(!W3 (?X_H (DURING ?X_J)))
			(!W4 (?X_H (CONSEC ?X_I)))
			(!W5 (?X_I (DURING ?X_J)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_I COMPOSITE-SCHEMA-165.PR ?X_H) ** ?E)
		(:ROLES
			(!R1 (?X_C (RIGHT-AFTER ?X_D)))
			(!R2 (?X_H FRIEND.N))
			(!R3 (?X_G CLASSROOM.N))
			(!R4 (?X_I (VERY.ADV NERVOUS.A)))
			(!R5 (?X_I NEXT.A))
			(!R6 (?X_I AGENT.N))
			(!R7 (?X_H (PERTAIN-TO ?X_I)))
			(!R8 (?X_J (RIGHT-AFTER ?X_K)))
		)
		(:STEPS
			(?X_F (?X_I ((ADV-A (INTO.P ?X_G)) GO.V)))
			(?X_C (?X_I (SEE.V ?X_H)))
			(?X_B (?X_I (SEE.V ?X_H)))
			(E464.SK (?X_I (TO.P ?X_H)))
			(?X_J (?X_I ((ADV-A (ON.P ?X_G)) ((ADV-A (IN.P ?X_G)) SIT.10.V))))
			(?X_J (?X_I ((ADV-A (ON.P ?X_G)) ((ADV-A (IN.P ?X_G)) SIT.11.V))))
			(?X_J (?X_I ((ADV-A (ON.P ?X_G)) ((ADV-A (IN.P ?X_G)) SIT.12.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F BEFORE ?X_C))
			(!W2 (?X_C BEFORE ?X_B))
			(!W3 (?X_B BEFORE E464.SK))
			(!W4 (E464.SK BEFORE ?X_J))
		)
	)
	(
			"A very nervous next agent goes into a classroom."
			"A very nervous next agent sees a friend of a very nervous next agent."
			"A very nervous next agent sees a friend of a very nervous next agent."
			"A very nervous next agent is to."
			"A very nervous next agent sit.248s on a classroom in a classroom."
			"A very nervous next agent sit.249s on a classroom in a classroom."
			"A very nervous next agent sit.250s on a classroom in a classroom."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (FOR.P ?X_C))
	               ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_C)) BECOME.1.V)))
	              ?X_C)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B WOMAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C LOCATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C NEW.A))
			(!R6 (?X_C FRIEND.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?X_C))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (TO.P ?X_D))
	               ((ADV-A (TO.P ?X_D))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_D)) GO.26.V))))
	              ?X_D)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D LOCATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D CAFETERIA.N))
			(!R6 (?X_B LUNCH.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?X_D)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?X_D))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (BY.P ?X_C))
	               (DOWN.ADV
	                ((ADV-A (IN.P ?X_D)) ((ADV-A (ON.P ?X_D)) SIT.13.V)))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_D FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_B (PERTAIN-TO ?X_C)))
			(!R6 (?X_B LUNCH.N))
			(!R7 (?X_D CAFETERIA.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L)))
			(?I2 (?X_D (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C GET.41.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D LUNCH.N))
			(!R6 (?X_D (PERTAIN-TO ?X_C)))
			(!R7 (?X_E (RIGHT-AFTER ?X_A)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?X_D)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_D (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (SAME-TIME ?X_G)))
			(!W7 (?X_F (BEFORE ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C GET.42.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D LUNCH.N))
			(!R6 (?X_D (PERTAIN-TO ?X_C)))
			(!R7 (?X_F (RIGHT-AFTER ?X_B)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?X_D)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_D (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (BEFORE ?X_G)))
			(!W7 (?X_F (SAME-TIME ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (FOR.P ?L2))
	               ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.7.V)))
	              ?L2)
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_E BLACK.A))
			(!R6 (?X_E (IS.V ?X_C)))
			(!R7 (?X_C (K BLACK.A) DOG.N))
			(!R8 (?X_B BLACK.A))
			(!R9 (?X_E (IS.V ?X_B)))
			(!R10 (?X_B DOG.N))
			(!R11 (?X_B LARGE.A))
			(!R12 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?L1)))
			(?I2 (NOT (?X_E (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P ?L1))))
			(?P2 (?X_E (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-166.PR ?L2) ** ?E)
		(:ROLES
			(!R1 (?X_B BLACK.A))
			(!R2 (?X_B DOG.N))
			(!R3 (?X_A DOG.N))
			(!R4 (?X_A LARGE.A))
			(!R5 (?X_A BLACK.A))
			(!R6 (?X_B (IS.V ?X_A)))
			(!R7 (?X_C (K BLACK.A) DOG.N))
			(!R8 (?X_B (IS.V ?X_C)))
			(!R9 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:STEPS
			(E3.SK
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.7.V)))
	    ?L2))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (FOR.P (K (TO.P (?X_D PLACE.N)))))
	               ((ADV-A (FROM.P ?L1))
	                ((ADV-A (TO.P (K (TO.P (?X_D PLACE.N))))) GO.27.V)))
	              (K (TO.P (?X_D PLACE.N))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (TO.P (?X_D PLACE.N))) LOCATION.N))
			(!R4 (NOT (?L1 = (K (TO.P (?X_D PLACE.N))))))
			(!R5 (?X_D FRIEND.N))
			(!R6 (?X_D (PERTAIN-TO ?X_C)))
			(!R7 (?X_E (RIGHT-AFTER ?X_A)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P (K (TO.P (?X_D PLACE.N))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P (K (TO.P (?X_D PLACE.N)))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P (K (TO.P (?X_D PLACE.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (SAME-TIME ?X_G)))
			(!W7 (?X_F (BEFORE ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              (EARLY.ADV
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) LEAVE.2.V))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B FRIEND.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J COMPOSITE-SCHEMA-167.PR (KE (?X_I PLACE.N))
	              (KE (?X_J FEEL.V POOR.A)) (K (TO.P (?X_I PLACE.N))) ?L2)
	             ** ?E)
		(:ROLES
			(!R1 (?X_H HOUSE.N))
			(!R2 (?X_H HUGE.A))
			(!R3 (?X_I FRIEND.N))
			(!R4 (?X_I (PERTAIN-TO ?X_J)))
			(!R5 (?X_K (RIGHT-AFTER ?X_L)))
		)
		(:STEPS
			(?X_A (?X_J (TO.P (KE (?X_I PLACE.N)))))
			(?X_G (?X_H (MAKE.V (KE (?X_J FEEL.V POOR.A)))))
			(?X_C (?X_J ((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_I)) TALK.V)))) STOP.V)))
			(?X_K
	   (?X_J
	    ((ADV-A (FOR.P (K (TO.P (?X_I PLACE.N)))))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K (TO.P (?X_I PLACE.N))))) GO.27.V)))
	    (K (TO.P (?X_I PLACE.N)))))
			(?X_E
	   (?X_J
	    (EARLY.ADV
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) LEAVE.2.V))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_K)))
			(!W2 (?X_A (BEFORE ?X_E)))
			(!W3 (?X_K (BEFORE ?X_E)))
			(!W4 (?X_G BEFORE ?X_C))
		)
	)
	(
			"A black dog is a of X_D is a dog large black run.1s L2 for L2 from L1 to L2."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV (ASLEEP.ADV QUICKLY.A))
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) FALL.3.V))))
	              ?L2)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C (VERY.ADV TIRED.A)))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B BED.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (TO.P (KA WORK.V)))
	               ((ADV-A (TO.P (KA WORK.V)))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P (KA WORK.V))) GO.28.V))))
	              (KA WORK.V))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA WORK.V) LOCATION.N))
			(!R4 (NOT (?L1 = (KA WORK.V))))
			(!R5 (?X_C (VERY.ADV TIRED.A)))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B BED.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P (KA WORK.V))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P (KA WORK.V)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P (KA WORK.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J COMPOSITE-SCHEMA-168.PR ?L2 (KA WORK.V)) ** ?E)
		(:ROLES
			(!R1 (?X_C (RIGHT-AFTER ?X_D)))
			(!R2 (?X_I BED.N))
			(!R3 (?X_J (VERY.ADV TIRED.A)))
			(!R4 (?X_I (PERTAIN-TO ?X_J)))
		)
		(:STEPS
			(?X_F (?X_J (DOWN.PRT ((ADV-A (IN.P ?X_I)) LAY.V))))
			(?X_C (?X_J (DOWN.PRT ((ADV-A (IN.P ?X_I)) LAY.V))))
			(?X_H
	   (?X_J
	    ((ADV-A (TO.P (KA WORK.V)))
	     ((ADV-A (TO.P (KA WORK.V)))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P (KA WORK.V))) GO.28.V))))
	    (KA WORK.V)))
			(?X_B
	   (?X_J
	    ((ADV (ASLEEP.ADV QUICKLY.A))
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) FALL.3.V))))
	    ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_B)))
			(!W2 (?X_F BEFORE ?X_C))
		)
	)
	(
			"X_J is to."
			"A house huge makes X_J feels poor."
			"X_J stops for to a friend of X_J talking."
			"X_J go.32s to a friend of X_J place for to a friend of X_J place from L1 to to a friend of X_J place."
			"X_J leave.33s L2 early to L2 from L1 for L2."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (AWAY.PRT
	               ((ADV-A (TO.P ?L2))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) WALK.6.V))))
	              ?L2)
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B WOMAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.13.V ?X_B ?A) ** ?E)
		(:ROLES
			(!R1 (?X_B WOMAN.N))
			(!R2 (?A ACTION.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V ?X_B ?A)))
			(?G2 (?X_B (WANT.V (THAT (?X_B (DO.V ?A))))))
		)
		(:STEPS
			(?X_C (?X_B (WHY.ADV ASK.V) ?X_B ?A))
			(?E2 (?X_B (DO.V ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?X_C))
			(!W2 (?X_C CAUSE-OF ?E2))
			(!W3 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.14.V ?X_D ?A) ** ?E)
		(:ROLES
			(!R1 (?X_C WOMAN.N))
			(!R2 (?X_D MAN.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_B (PERTAIN-TO ?X_D)))
			(!R5 (?X_B HEAD.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V ?X_D ?A)))
			(?G2 (?X_C (WANT.V (THAT (?X_C (DO.V ?A))))))
		)
		(:STEPS
			(?X_E (?X_C (AWAY.PRT ASK.V) ?X_D ?A))
			(?E2 (?X_D (DO.V ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?X_E))
			(!W2 (?X_E CAUSE-OF ?E2))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.15.V ?X_D ?A) ** ?E)
		(:ROLES
			(!R1 (?X_C WOMAN.N))
			(!R2 (?X_D MAN.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_B HEAD.N))
			(!R5 (?X_B (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V ?X_D ?A)))
			(?G2 (?X_C (WANT.V (THAT (?X_C (DO.V ?A))))))
		)
		(:STEPS
			(?X_E (?X_C (WHY.ADV ASK.V) ?X_D ?A))
			(?E2 (?X_D (DO.V ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?X_E))
			(!W2 (?X_E CAUSE-OF ?E2))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
			(!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_L COMPOSITE-SCHEMA-169.PR ?X_K (K DEJECTED.A) ?L2 ?X_L ?X_M ?A) **
	             ?E)
		(:ROLES
			(!R1 (?X_I (RIGHT-AFTER ?X_J)))
			(!R2 (?X_K HEAD.N))
			(!R3 (?X_K (PERTAIN-TO ?X_M)))
			(!R4 (?X_L WOMAN.N))
			(!R5 (?X_M MAN.N))
			(!R6 (?A ACTION.N))
		)
		(:STEPS
			(?X_I (?X_M (SHAKE.V ?X_K)))
			(?X_H (?X_M (SHAKE.V ?X_K)))
			(?X_B (?X_M (LOOK.V (K DEJECTED.A))))
			(?X_D
	   (?X_L
	    (AWAY.PRT
	     ((ADV-A (TO.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?L2)) WALK.6.V))))
	    ?L2))
			(?E_1 (?X_L REQUEST_ACTION.13.V ?X_L ?A))
			(?E_2 (?X_L REQUEST_ACTION.14.V ?X_M ?A))
			(?E_3 (?X_L REQUEST_ACTION.15.V ?X_M ?A))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I BEFORE ?X_H))
			(!W2 (?X_H BEFORE ?X_B))
			(!W3 (?X_B BEFORE ?X_D))
			(!W4 (?X_D BEFORE ?E_1))
			(!W5 (?E_1 BEFORE ?E_2))
			(!W6 (?E_2 BEFORE ?E_3))
		)
	)
	(
			"A very tired lays down in a bed of a very tired."
			"A very tired lays down in a bed of a very tired."
			"A very tired go.37s working to working to working from L1 for working."
			"A very tired fall.36s L2 ADV asleep quickly to L2 from L1 for L2."
	)
)



(
	(EPI-SCHEMA ((?X_C COMPOSITE-SCHEMA-170.PR ?X_F ?X_I) ** ?E)
		(:ROLES
			(!R1 (?X_C DAY.N))
			(!R2 (?X_F SLATE.N))
			(!R3 (?X_D (RIGHT-AFTER ?X_E)))
			(!R4 (?X_G (HAS.V (TWO.D (L X (AND (X PET.A) (X (PLUR RABBIT.N))))))))
			(!R5 (?X_F (PERTAIN-TO ?X_G)))
			(!R6
	   (?X_I
	    (HAVE.V
	     (SET-OF (K (L X (AND (X BIG.A) (X LONG.A) (X (PLUR EAR.N)))))
	      (K (L X (AND (X LITTLE.A) (X SHORT.A) (X (PLUR TAIL.N)))))))))
			(!R7 (?X_I (PLUR RABBIT.N)))
		)
		(:STEPS
			(?X_B (?X_C ?X_G ?X_I (ON.P ?X_F)))
			(?X_D (?X_C ?X_G (((ADV-A (ON.P ?X_F)) DRAW.V) ?X_I)))
			(?X_K
	   (?X_G
	    (((ADV-A (ON.P (K (L X (AND (X PAPER.N) (X TOO.ADV)))))) DRAW.V) ?X_I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_D)))
			(!W2 (?X_B (BEFORE ?X_K)))
			(!W3 (?X_D (BEFORE ?X_K)))
		)
	)
	(
			"A man shakes a head of a man."
			"A man shakes a head of a man."
			"A man looks dejected."
			"A woman walk.46s L2 away to L2 from L1 for L2."
			"A woman request action.47s a woman a action."
			"A woman request action.48s a man a action."
			"A woman request action.49s a man a action."
	)
)



(
	(EPI-SCHEMA ((?X_C GET.43.V (K UPSET.A)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 ((K UPSET.A) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = (K UPSET.A))))
			(!R5 (?X_B (PERTAIN-TO ?X_C)))
			(!R6 (?X_B PHONE.N))
			(!R7 (?X_B NEW.A))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V (K UPSET.A)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V (K UPSET.A))))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 ((K UPSET.A) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V (K UPSET.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N COMPOSITE-SCHEMA-171.PR ?X_I ?X_M (K UPSET.A)) ** ?E)
		(:ROLES
			(!R1 (?X_E (RIGHT-AFTER ?X_F)))
			(!R2 (?X_I DAY.N))
			(!R3 (?X_J (PLUR WOOD.N)))
			(!R4 (?X_M NEW.A))
			(!R5 (?X_M PHONE.N))
			(!R6 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_L (?X_N (HAVE.V ?X_M)))
			(?X_H (?X_N (((ADV-A (IN.P ?X_J)) WALK.V) ?X_I)))
			(?X_E (?X_N (LOSE.V ?X_M)))
			(?X_D (?X_N (LOSE.V ?X_M)))
			(?X_B (?X_N GET.43.V (K UPSET.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L BEFORE ?X_H))
			(!W2 (?X_H BEFORE ?X_E))
			(!W3 (?X_E BEFORE ?X_D))
			(!W4 (?X_D BEFORE ?X_B))
		)
	)
	(
			"X_N has a new phone of X_N."
			"X_N walks a day in a woods."
			"X_N loses a new phone of X_N."
			"X_N loses a new phone of X_N."
			"X_N get.64s upset."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (WITH.P ?X_A))
	               ((ADV-A (TO.P ?X_F))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_F)) CHASE.1.V))))
	              ?X_F)
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_F LOCATION.N))
			(!R4 (NOT (?L1 = ?X_F)))
			(!R5 (?X_A FRIEND.N))
			(!R6 (?X_A (HAS.V ?X_F)))
			(!R7 (?X_F HAT.N))
			(!R8 (?X_A (PERTAIN-TO ?X_E)))
			(!R9 (?X_F (PERTAIN-TO ?X_B)))
			(!R10 (?X_B MALE.A))
			(!R11 (?X_B AGENT.N))
			(!R12 (?X_G (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?X_F)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?L1)))
			(?I2 (NOT (?X_E (AT.P ?X_F))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P ?L1))))
			(?P2 (?X_E (AT.P ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_G))
			(!W2 (?I2 BEFORE ?X_G))
			(!W3 (?P1 AFTER ?X_G))
			(!W4 (?P2 AFTER ?X_G))
			(!W5 (?G1 CAUSE-OF ?X_G))
			(!W6 (?X_G (SAME-TIME ?X_I)))
			(!W7 (?X_H (BEFORE ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (WITH.P ?X_A))
	               ((ADV-A (TO.P ?X_F))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_F)) CHASE.2.V))))
	              ?X_F)
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_F LOCATION.N))
			(!R4 (NOT (?L1 = ?X_F)))
			(!R5 (?X_F HAT.N))
			(!R6 (?X_A FRIEND.N))
			(!R7 (?X_A (HAS.V ?X_F)))
			(!R8 (?X_A (PERTAIN-TO ?X_E)))
			(!R9 (?X_G (RIGHT-AFTER ?X_B)))
			(!R10 (?X_F (PERTAIN-TO ?X_C)))
			(!R11 (?X_C MALE.A))
			(!R12 (?X_C AGENT.N))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?X_F)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?L1)))
			(?I2 (NOT (?X_E (AT.P ?X_F))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P ?L1))))
			(?P2 (?X_E (AT.P ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_G))
			(!W2 (?I2 BEFORE ?X_G))
			(!W3 (?P1 AFTER ?X_G))
			(!W4 (?P2 AFTER ?X_G))
			(!W5 (?G1 CAUSE-OF ?X_G))
			(!W6 (?X_G (SAME-TIME ?X_I)))
			(!W7 (?X_H (BEFORE ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E
	              ((ADV-A (FOR.P ?X_F))
	               ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_F)) CHASE.3.V)))
	              ?X_F)
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_F LOCATION.N))
			(!R4 (NOT (?L1 = ?X_F)))
			(!R5 (?X_A FRIEND.N))
			(!R6 (?X_A (PERTAIN-TO ?X_E)))
			(!R7 (?X_F HAT.N))
			(!R8 (?X_A (HAS.V ?X_F)))
			(!R9 (?X_F (PERTAIN-TO ?X_C)))
			(!R10 (?X_C MALE.A))
			(!R11 (?X_C AGENT.N))
			(!R12 (?X_H (RIGHT-AFTER ?X_D)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P ?X_F)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?L1)))
			(?I2 (NOT (?X_E (AT.P ?X_F))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P ?L1))))
			(?P2 (?X_E (AT.P ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_G))
			(!W2 (?I2 BEFORE ?X_G))
			(!W3 (?P1 AFTER ?X_G))
			(!W4 (?P2 AFTER ?X_G))
			(!W5 (?G1 CAUSE-OF ?X_G))
			(!W6 (?X_G (BEFORE ?X_I)))
			(!W7 (?X_H (SAME-TIME ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_H COMPOSITE-SCHEMA-172.PR ?X_C ?X_O) ** ?E)
		(:ROLES
			(!R1 (?X_C (PLUR FRIEND.N)))
			(!R2 (?X_C HAT.N))
			(!R3 (?X_C (PERTAIN-TO ?X_D)))
			(!R4 (?X_E (SET-OF AGENT.N)))
			(!R5 (?X_M FRIEND.N))
			(!R6 (?X_H AGENT.N))
			(!R7 (?X_M (PERTAIN-TO ?X_H)))
			(!R8 (?X_K (RIGHT-AFTER ?X_L)))
			(!R9 (?X_O HAT.N))
			(!R10 (?X_M (HAS.V ?X_O)))
			(!R11 (?X_N WIND.N))
			(!R12 (?X_P MALE.A))
			(!R13 (?X_P AGENT.N))
			(!R14 (?X_O (PERTAIN-TO ?X_P)))
			(!R15 (?X_Q (RIGHT-AFTER ?X_R)))
		)
		(:STEPS
			(?X_K (?X_N ((AWAY.ADV BLOW.V) ?X_O)))
			(?X_J (?X_N ((AWAY.ADV BLOW.V) ?X_O)))
			(?X_B (?X_E (CATCH.V ?X_C)))
			(?X_G
	   (?X_H
	    ((ADV-A (FOR.P ?X_O))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_O)) CHASE.3.V)))
	    ?X_O))
			(?X_Q
	   (?X_H
	    ((ADV-A (WITH.P ?X_M))
	     ((ADV-A (TO.P ?X_O))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_O)) CHASE.1.V))))
	    ?X_O))
			(?X_Q
	   (?X_H
	    ((ADV-A (WITH.P ?X_M))
	     ((ADV-A (TO.P ?X_O))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_O)) CHASE.2.V))))
	    ?X_O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_Q)))
			(!W2 (?X_K BEFORE ?X_J))
			(!W3 (?X_J BEFORE ?X_B))
		)
	)
	(
			"A wind blows a hat of a male agent away."
			"A wind blows a hat of a male agent away."
			"A agent catches a friends hat of X_D."
			"A agent chase.79s a hat of a male agent for a hat of a male agent from L1 to a hat of a male agent."
			"A agent chase.77s a hat of a male agent with a friend of a agent has a hat of a male agent to a hat of a male agent from L1 for a hat of a male agent."
			"A agent chase.78s a hat of a male agent with a friend of a agent has a hat of a male agent to a hat of a male agent from L1 for a hat of a male agent."
	)
)



(
	(EPI-SCHEMA ((?X_C GET.37.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_B (PERTAIN-TO ?X_C)))
			(!R6 (?X_B MOTHER.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V ?X_D)))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 (?X_D (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              (CAN.AUX
	               ((ADV-A (TO.P ?X_D))
	                ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_D)) CLIMB.3.V))))
	              ?X_D)
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D LOCATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D (VERY.ADV PRETTY.A)))
			(!R6 (?X_D TREE.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
			(!R8 (?X_B MOTHER.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P ?X_D)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?X_D))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O COMPOSITE-SCHEMA-173.PR (K (PLUR COCOANUT.N))
	              (KA ((ADV-A (WITH.P ?X_P)) PLAY.V)) ?X_B ?X_S)
	             ** ?E)
		(:ROLES
			(!R1 (?X_I (RIGHT-AFTER ?X_J)))
			(!R2 (?X_O MOTHER.N))
			(!R3 (?X_O (PERTAIN-TO ?X_P)))
			(!R4 (?X_S (VERY.ADV PRETTY.A)))
			(!R5 (?X_S TREE.N))
		)
		(:STEPS
			(?X_R
	   ((K (L X (AND (X MANY.A) (X (PLUR COCOANUT.N)))))
	    ((ADV-A (ON.P ?X_S)) GROW.V)))
			(?X_I (?X_O (LIKE.V (K (PLUR COCOANUT.N)))))
			(?X_H (?X_O (LIKE.V (K (PLUR COCOANUT.N)))))
			(?X_F (?X_O ((ADV-A (FOR.P (KA (CLIMB.V ?X_S)))) CANNOT.V)))
			(?X_D (?X_O (LIKE.V (KA ((ADV-A (WITH.P ?X_P)) PLAY.V)))))
			(?X_N
	   (?X_P
	    (CAN.AUX
	     ((ADV-A (TO.P ?X_S))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P ?X_S)) CLIMB.3.V))))
	    ?X_S))
			(?X_L (?X_P GET.37.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_L)))
			(!W2 (?X_R BEFORE ?X_I))
			(!W3 (?X_I BEFORE ?X_H))
			(!W4 (?X_H BEFORE ?X_F))
			(!W5 (?X_F BEFORE ?X_D))
		)
	)
	(
			"Many cocoanut grows on a very pretty tree."
			"A mother of X_P likes cocoanuts."
			"A mother of X_P likes cocoanuts."
			"A mother of X_P cannots for climbing a very pretty tree."
			"A mother of X_P likes with X_P playing."
			"X_P climb.105s a very pretty tree can to a very pretty tree from L1 for a very pretty tree."
			"X_P get.103s X_B."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-174.PR) ** ?E)
		(:ROLES
			(!R1 (?X_A SUN.N))
			(!R2 (?X_B (IMPINGES-ON ?X_C)))
		)
		(:STEPS
			(?X_B (?X_A (JUST.ADV (HAS.AUX |5.2.2.V|))))
		)
	)
	(
			"A sun 5.2.2s just has."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (TO.P ?X_A))
	               ((ADV-A (TO.P (K (L X (AND (X LAST.A) (X NIGHT.N))))))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (FOR.P (K (L X (AND (X LAST.A) (X NIGHT.N))))))
	                  GO.29.V))))
	              (K (L X (AND (X LAST.A) (X NIGHT.N)))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (L X (AND (X LAST.A) (X NIGHT.N)))) LOCATION.N))
			(!R4 (NOT (?L1 = (K (L X (AND (X LAST.A) (X NIGHT.N)))))))
			(!R5 (?X_A CASINO.N))
		)
		(:GOALS
			(?G1
	   (?X_C
	    (WANT.V (KA ((ADV-A (AT.P (K (L X (AND (X LAST.A) (X NIGHT.N)))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P (K (L X (AND (X LAST.A) (X NIGHT.N))))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P (K (L X (AND (X LAST.A) (X NIGHT.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (TO.P ?X_B))
	               ((ADV-A (TO.P (K (L X (AND (X LAST.A) (X NIGHT.N))))))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (FOR.P (K (L X (AND (X LAST.A) (X NIGHT.N))))))
	                  GO.30.V))))
	              (K (L X (AND (X LAST.A) (X NIGHT.N)))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (L X (AND (X LAST.A) (X NIGHT.N)))) LOCATION.N))
			(!R4 (NOT (?L1 = (K (L X (AND (X LAST.A) (X NIGHT.N)))))))
			(!R5 (?X_B CASINO.N))
		)
		(:GOALS
			(?G1
	   (?X_C
	    (WANT.V (KA ((ADV-A (AT.P (K (L X (AND (X LAST.A) (X NIGHT.N)))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P (K (L X (AND (X LAST.A) (X NIGHT.N))))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P (K (L X (AND (X LAST.A) (X NIGHT.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-175.PR (KE (?X_K JEALOUS.A)) ?X_H ?X_E
	              (K (L X (AND (X LAST.A) (X NIGHT.N)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E LITTLE.A))
			(!R2 (?X_E MONEY.N))
			(!R3 (?X_H FUN.N))
			(!R4 (?X_H NIGHT.N))
			(!R5 (?X_K LITTLE.A))
			(!R6 (?X_L AGENT.N))
			(!R7 (?X_O CASINO.N))
		)
		(:STEPS
			(?X_J (?X_L (BE.V (KE (?X_K JEALOUS.A)))))
			(?X_G (?X_A (HAVE.V ?X_H)))
			(?X_D (?X_A ((TOO.ADV WIN.V) ?X_E)))
			(?X_N
	   (?X_A
	    ((ADV-A (TO.P ?X_O))
	     ((ADV-A (TO.P (K (L X (AND (X LAST.A) (X NIGHT.N))))))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (FOR.P (K (L X (AND (X LAST.A) (X NIGHT.N)))))) GO.29.V))))
	    (K (L X (AND (X LAST.A) (X NIGHT.N))))))
			(?X_N
	   (?X_A
	    ((ADV-A (TO.P ?X_O))
	     ((ADV-A (TO.P (K (L X (AND (X LAST.A) (X NIGHT.N))))))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (FOR.P (K (L X (AND (X LAST.A) (X NIGHT.N)))))) GO.30.V))))
	    (K (L X (AND (X LAST.A) (X NIGHT.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J BEFORE ?X_G))
			(!W2 (?X_G BEFORE ?X_D))
			(!W3 (?X_D BEFORE ?X_N))
		)
	)
	(
			"A agent is a little jealous."
			"X_A has a fun night."
			"X_A wins a little money too."
			"X_A go.115s last night to a casino to last night from L1 for last night."
			"X_A go.116s last night to a casino to last night from L1 for last night."
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (TO.P ?X_A)) TAKE.26.V) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E (PLUR FLOWER.N)))
			(!R6 (?X_E PRETTY.A))
			(!R7 (?X_A WAGON.N))
			(!R8 (?X_D (GLAD.A (KA (GET.V ?X_E)))))
			(!R9 (?X_B (WITH.P ?X_A)))
			(!R10 (?X_B FIELD.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (AFTER ?X_G)))
			(!W7 (?X_G (AT-ABOUT ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (TO.P ?X_B)) TAKE.27.V) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_B WAGON.N))
			(!R6 (?X_D (GLAD.A (KA (GET.V ?X_E)))))
			(!R7 (?X_E PRETTY.A))
			(!R8 (?X_E (PLUR FLOWER.N)))
			(!R9 (?X_C (WITH.P ?X_B)))
			(!R10 (?X_C FIELD.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (AFTER ?X_G)))
			(!W7 (?X_G (AT-ABOUT ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (TO.P ?X_C)) TAKE.28.V) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_C WAGON.N))
			(!R6 (?X_D (GLAD.A (KA (GET.V ?X_E)))))
			(!R7 (?X_E (PLUR FLOWER.N)))
			(!R8 (?X_E PRETTY.A))
			(!R9 (?X_B FIELD.N))
			(!R10 (?X_B (WITH.P ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?X_E)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?X_E (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (AFTER ?X_G)))
			(!W7 (?X_G (AT-ABOUT ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-176.PR (KE (?X_C (HAVE.V ?X_B))) ?X_B) ** ?E)
		(:ROLES
			(!R1 (?X_L WAGON.N))
			(!R2 (?X_A (GLAD.A (KA (GET.V ?X_B)))))
			(!R3 (?X_A AGENT.N))
			(!R4 (?X_B PRETTY.A))
			(!R5 (?X_B (PLUR FLOWER.N)))
			(!R6 (?X_C (HAS.V ?X_D)))
			(!R7 (?X_E (HAS.V (THREE.D (L X (AND (X YELLOW.A) (X (PLUR FLOWER.N))))))))
			(!R8 (?X_H (IMPINGES-ON ?X_I)))
			(!R9 (?X_J AGENT.N))
			(!R10 (?X_K FIELD.N))
			(!R11 (?X_K (WITH.P ?X_L)))
		)
		(:STEPS
			(?X_H
	   (?X_J (KA HAVE.V)
	    ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N)))))) |4.2.2.V|)))
			(E234.SK (?X_E (LET.V (KE (?X_C (HAVE.V ?X_B))))))
			(E235.SK (?X_A ((ADV-A (TO.P ?X_L)) TAKE.26.V) ?X_B))
			(E235.SK (?X_A ((ADV-A (TO.P ?X_L)) TAKE.27.V) ?X_B))
			(E235.SK (?X_A ((ADV-A (TO.P ?X_L)) TAKE.28.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H BEFORE E234.SK))
			(!W2 (E234.SK BEFORE E235.SK))
		)
	)
	(
			"A agent 4.2.2s for finding flowers."
			"A has three yellow flower lets a has X_D has a pretty flowers."
			"A glad getting a pretty flowers agent take.119s a pretty flowers to a wagon."
			"A glad getting a pretty flowers agent take.120s a pretty flowers to a wagon."
			"A glad getting a pretty flowers agent take.122s a pretty flowers to a wagon."
	)
)



(
	(EPI-SCHEMA ((?X_F ((ADV-A (TO.P ?X_A)) TAKE.29.V) ?X_G) ** ?X_H)
		(:ROLES
			(!R1 (?X_F AGENT.N))
			(!R2 (?X_G INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_F = ?X_G)))
			(!R5 (?X_G FAMILY.N))
			(!R6 (?X_G (PERTAIN-TO ?X_F)))
			(!R7 (?X_A FARM.N))
			(!R8 (?X_B (PERTAIN-TO ?X_F)))
			(!R9 (?X_B (PLUR KID.N)))
			(!R10 (?X_C (PERTAIN-TO ?X_F)))
			(!R11 (?X_C DAUGHTER.N))
			(!R12 (?X_H (RIGHT-AFTER ?X_D)))
		)
		(:GOALS
			(?G1 (?X_F (WANT.V (THAT (?X_F (HAVE.V ?X_G))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_F HAVE.V ?X_G)))
			(?I2 (?X_F (AT.P ?L)))
			(?I3 (?X_G (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_F HAVE.V ?X_G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_H))
			(!W2 (?I1 PRECOND-OF ?X_H))
			(!W3 (?I2 PRECOND-OF ?X_H))
			(!W4 (?I3 PRECOND-OF ?X_H))
			(!W5 (?P1 POSTCOND-OF ?X_H))
			(!W6 (?X_H (SAME-TIME ?X_J)))
			(!W7 (?X_I (BEFORE ?X_J)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_F TAKE.30.V ?X_G) ** ?X_H)
		(:ROLES
			(!R1 (?X_F AGENT.N))
			(!R2 (?X_G INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_F = ?X_G)))
			(!R5 (?X_G FAMILY.N))
			(!R6 (?X_G (PERTAIN-TO ?X_F)))
			(!R7 (?X_A FARM.N))
			(!R8 (?X_C (PERTAIN-TO ?X_F)))
			(!R9 (?X_C DAUGHTER.N))
			(!R10 (?X_D (PLUR KID.N)))
			(!R11 (?X_D (PERTAIN-TO ?X_F)))
			(!R12 (?X_I (RIGHT-AFTER ?X_E)))
		)
		(:GOALS
			(?G1 (?X_F (WANT.V (THAT (?X_F (HAVE.V ?X_G))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_F HAVE.V ?X_G)))
			(?I2 (?X_F (AT.P ?L)))
			(?I3 (?X_G (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_F HAVE.V ?X_G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_H))
			(!W2 (?I1 PRECOND-OF ?X_H))
			(!W3 (?I2 PRECOND-OF ?X_H))
			(!W4 (?I3 PRECOND-OF ?X_H))
			(!W5 (?P1 POSTCOND-OF ?X_H))
			(!W6 (?X_H (BEFORE ?X_J)))
			(!W7 (?X_I (SAME-TIME ?X_J)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_F TAKE.31.V ?X_G) ** ?X_H)
		(:ROLES
			(!R1 (?X_F AGENT.N))
			(!R2 (?X_G INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_F = ?X_G)))
			(!R5 (?X_G FAMILY.N))
			(!R6 (?X_B FARM.N))
			(!R7 (?X_G (PERTAIN-TO ?X_F)))
			(!R8 (?X_C (PERTAIN-TO ?X_F)))
			(!R9 (?X_C DAUGHTER.N))
			(!R10 (?X_D (PERTAIN-TO ?X_F)))
			(!R11 (?X_D (PLUR KID.N)))
			(!R12 (?X_I (RIGHT-AFTER ?X_E)))
		)
		(:GOALS
			(?G1 (?X_F (WANT.V (THAT (?X_F (HAVE.V ?X_G))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_F HAVE.V ?X_G)))
			(?I2 (?X_F (AT.P ?L)))
			(?I3 (?X_G (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_F HAVE.V ?X_G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_H))
			(!W2 (?I1 PRECOND-OF ?X_H))
			(!W3 (?I2 PRECOND-OF ?X_H))
			(!W4 (?I3 PRECOND-OF ?X_H))
			(!W5 (?P1 POSTCOND-OF ?X_H))
			(!W6 (?X_H (BEFORE ?X_J)))
			(!W7 (?X_I (SAME-TIME ?X_J)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



))
; got 428 schemas (252 protoschema matches, 176 stories)
