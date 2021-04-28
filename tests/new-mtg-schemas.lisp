(defparameter *LEARNED-SCHEMAS* '(
(
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-1.PR (KA (STOP.V WORK.V)) (KA WORK.V) ?X_F))
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
			(?X_K (MUST.AUX-S (?X_I (AGAIN.ADV (NEVER.ADV WORK.V)))))
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
			"A tired works must again never."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-2.PR (SET-OF ?X_B (TWO.D (PLUR CAT.N))))) **
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
	(EPI-SCHEMA (((K SUSIE.N)
	              (COMPOSITE-SCHEMA-3.PR (KE (?X_S (PLAY.V (K BALL.N))))
	               (KA ((ADV-A (WITH.P ?X_N)) PLAY.V)) ?X_A (K BALL.N)))
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
			(?X_C ((K SUSIE.N) (THEN.ADV ((ADV-A (FOR.P (KA CRY.V))) START.V))))
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
			"Susie starts then for crying."
			"A girl play.12s ball with T."
			"Susie says a girl plays ball."
	)
)



(
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-4.PR (K (L X (AND (X GOOD.A) (X (TO.P ?X_O)))))
	               ?X_L ?X_N))
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
	              ((ADV-A (ON.P ?S))
	               ((ADV-A (IN.P ?S))
	                (DOWN.ADV ((ADV-A (WITH.P ?X_A)) SIT.1.V)))))
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
	              ((ADV-A (ON.P ?S))
	               ((ADV-A (IN.P ?S))
	                (DOWN.ADV ((ADV-A (WITH.P ?X_B)) SIT.2.V)))))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-5.PR (K DIZZY.A) (K SICK.A))) ** ?E)
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
	    ((ADV-A (ON.P ?S))
	     ((ADV-A (IN.P ?S)) (DOWN.ADV ((ADV-A (WITH.P ?X_J)) SIT.1.V))))))
			(?X_F
	   (?X_G
	    ((ADV-A (ON.P ?S))
	     ((ADV-A (IN.P ?S)) (DOWN.ADV ((ADV-A (WITH.P ?X_J)) SIT.2.V))))))
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
			"A man sit.51s on S in S down with a woman."
			"A man sit.52s on S in S down with a woman."
	)
)



(
	(EPI-SCHEMA ((?X_B MAKE.1.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B ANIMAL.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?X_C SOUND.N))
			(!R4 (?X_C FUNNY.A))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (THROUGH.P ?X_B)) WALK.1.V))))
	               ?L2))
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
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (THROUGH.P ?X_A)) WALK.2.V))))
	               ?L2))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-6.PR ?X_K (K CLOSER.A) ?X_H ?L2)) ** ?E)
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
			(?X_B (?X_K (OUT.PRT ((ADV-A (FOR.P (KA (BE.V ?X_C)))) TURN.V))))
			(?X_M
	   (?X_O
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (THROUGH.P ?X_N)) WALK.1.V))))
	     ?L2)))
			(?X_M
	   (?X_O
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (THROUGH.P ?X_N)) WALK.2.V))))
	     ?L2)))
			(?X_G (?X_K MAKE.1.V ?X_H))
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
			"A animal turns out for being a fox."
			"A agent walk.66s L2 for L2 from L1 to L2 through a woods."
			"A agent walk.67s L2 for L2 from L1 to L2 through a woods."
			"A animal make.68s a funny sound."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.1.V ?X_C) ** ?X_D)
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
	(EPI-SCHEMA (((ADV-E (DURING (K YESTERDAY.N)))
	              (?X_B
	               (((ADV-A (FOR.P (K (PLUR CV.N))))
	                 ((ADV-A (FROM.P ?L1))
	                  ((ADV-A (TO.P (K (PLUR CV.N))))
	                   ((ADV-A (TO.P (K (PLUR CV.N)))) GO.1.V))))
	                (K (PLUR CV.N)))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (PLUR CV.N)) LOCATION.N))
			(!R4 (NOT (?L1 = (K (PLUR CV.N)))))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (K (PLUR CV.N)))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K (PLUR CV.N))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K (PLUR CV.N)))))
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-7.PR ?X_C (K (PLUR CV.N)))) ** ?E)
		(:ROLES
			(!R1 (?X_C CANDY.N))
			(!R2 (?X_F AGENT.N))
		)
		(:STEPS
			(?X_E
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_F
	     (((ADV-A (FOR.P (K (PLUR CV.N))))
	       ((ADV-A (FROM.P ?L1))
	        ((ADV-A (TO.P (K (PLUR CV.N))))
	         ((ADV-A (TO.P (K (PLUR CV.N)))) GO.1.V))))
	      (K (PLUR CV.N))))))
			(?X_B (?X_F GET.1.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A agent go.75s cvs DURING yesterday for cvs from L1 to cvs to cvs."
			"A agent get.74s a candy."
	)
)



(
	(EPI-SCHEMA ((?X_B ((JUST.ADV GET.2.V) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_B HAPPY.A))
			(!R6 (?X_C NEW.A))
			(!R7 (?X_C RING.N))
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
	(EPI-SCHEMA ((MUST.AUX-S (?X_B (GET.3.V (ANOTHER.D ONE.N)))) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((ANOTHER.D ONE.N) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (ANOTHER.D ONE.N))))
			(!R5 (?X_B HAPPY.A))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V (ANOTHER.D ONE.N)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (ANOTHER.D ONE.N))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((ANOTHER.D ONE.N) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (ANOTHER.D ONE.N)))
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
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (INTO.P ?X_A)) RUN.1.V))))
	               ?L2))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A MAN.N))
			(!R6 (?X_E BOY.N))
			(!R7 (?X_C MOM.N))
			(!R8 (?X_C (PERTAIN-TO ?X_E)))
			(!R9 (?X_C (PERTAIN-TO ?X_D)))
			(!R10 (?X_D MALE.A))
			(!R11 (?X_D AGENT.N))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (INTO.P ?X_B)) RUN.2.V))))
	               ?L2))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_E BOY.N))
			(!R6 (?X_B MAN.N))
			(!R7 (?X_C MOM.N))
			(!R8 (?X_C (PERTAIN-TO ?X_E)))
			(!R9 (?X_C (PERTAIN-TO ?X_D)))
			(!R10 (?X_D MALE.A))
			(!R11 (?X_D AGENT.N))
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
	(EPI-SCHEMA ((?X_D GET.4.V (K LOST.A)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 ((K LOST.A) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = (K LOST.A))))
			(!R5 (?X_D BOY.N))
			(!R6 (?X_B (PERTAIN-TO ?X_D)))
			(!R7 (?X_B MOM.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
			(!R9 (?X_C MALE.A))
			(!R10 (?X_C AGENT.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V (K LOST.A)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V (K LOST.A))))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 ((K LOST.A) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V (K LOST.A)))
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-8.PR ?X_O ?X_N ?L2 (K LOST.A))) ** ?E)
		(:ROLES
			(!R1 (?X_A (RIGHT-AFTER ?X_B)))
			(!R2 (?X_G MAN.N))
			(!R3 (?X_H (RIGHT-AFTER ?X_I)))
			(!R4 (?X_O MOM.N))
			(!R5 (?X_N BOY.N))
			(!R6 (?X_O (PERTAIN-TO ?X_N)))
			(!R7 (?X_P MALE.A))
			(!R8 (?X_P AGENT.N))
			(!R9 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_K (?X_N (TO.P ?X_O)))
			(?X_H (?X_N ((ADV-A (TO.P ?X_O)) CALL.V)))
			(?X_D (?X_G ?X_N (TO.P ?X_O)))
			(?X_A (?X_G (((ADV-A (TO.P ?X_O)) BRING.V) ?X_N)))
			(?X_M (?X_N GET.4.V (K LOST.A)))
			(?X_F
	   (?X_N
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (INTO.P ?X_G)) RUN.1.V))))
	     ?L2)))
			(?X_F
	   (?X_N
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (INTO.P ?X_G)) RUN.2.V))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_F)))
			(!W2 (?X_K BEFORE ?X_H))
			(!W3 (?X_H BEFORE ?X_D))
			(!W4 (?X_D BEFORE ?X_A))
		)
	)
	(
			"A boy is to."
			"A boy calls to a mom of a male agent of a boy."
			"A man is to."
			"A man brings a boy to a mom of a male agent of a boy."
			"A boy get.84s lost."
			"A boy run.86s L2 for L2 from L1 to L2 into a man."
			"A boy run.89s L2 for L2 from L1 to L2 into a man."
	)
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-9.PR (K (SO.ADV SAD.A)) ?X_J)) ** ?E)
		(:ROLES
			(!R1 (?X_H THING.N))
			(!R2 (?X_H (FOR.P ?X_I)))
			(!R3 (?X_J NEW.A))
			(!R4 (?X_J PUPPY.N))
		)
		(:STEPS
			(?X_E (?X_B ((ADV-A (FOR.P (KA (HAVE.V ?X_A)))) SUE.V)))
			(?X_C (?X_A PUPPY.N))
			(?X_G (?X_B (SUE.V (K (SO.ADV SAD.A)))))
			(?X_L (?X_H (BE.V ?X_J)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_C)))
			(!W2 (?X_E (BEFORE ?X_G)))
			(!W3 (?X_E (BEFORE ?X_L)))
			(!W4 (?X_C (BEFORE ?X_G)))
			(!W5 (?X_C (BEFORE ?X_L)))
			(!W6 (?X_G (BEFORE ?X_L)))
		)
	)
	(
			"X_B sues for having X_A."
			"X_A is puppy."
			"X_B sues so sad."
			"A thing for X_I is a new puppy."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_A)) SKIP.V)))) TAKE.1.V)
	               ?O))
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
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_B)) SKIP.V)))) TAKE.2.V)
	               ?O))
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
	(EPI-SCHEMA ((?X_B GET.5.V (K SICK.A)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((K SICK.A) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K SICK.A))))
			(!R5 (?X_B DAY.N))
			(!R6 (?X_B SKIP.V))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V (K SICK.A)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (K SICK.A))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((K SICK.A) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (K SICK.A)))
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
	(EPI-SCHEMA ((?X_B ((NEVER.ADV FIND.1.V) ?X_C)) ** ?X_E)
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
	(EPI-SCHEMA ((?X_B GET.6.V ?X_C) ** ?X_D)
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
	(EPI-SCHEMA ((?X_B GET.7.V (ANOTHER.D CAT.N)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_D (((ADV-A (TO.P ?X_A)) TAKE.3.V) ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_A SHOP.N))
			(!R6 (?X_C (PLUR FRIEND.N)))
			(!R7 (?X_C (PERTAIN-TO ?X_D)))
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
	(EPI-SCHEMA ((?X_D (((ADV-A (TO.P ?X_B)) TAKE.4.V) ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_B SHOP.N))
			(!R6 (?X_C (PLUR FRIEND.N)))
			(!R7 (?X_C (PERTAIN-TO ?X_D)))
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
	(EPI-SCHEMA ((?X_B GET.8.V (K (L X (AND (X (PASV PAINT.V)) (X BLUE.A))))) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((K (L X (AND (X (PASV PAINT.V)) (X BLUE.A)))) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K (L X (AND (X (PASV PAINT.V)) (X BLUE.A)))))))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V
	     (THAT (?X_B (HAVE.V (K (L X (AND (X (PASV PAINT.V)) (X BLUE.A))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (K (L X (AND (X (PASV PAINT.V)) (X BLUE.A)))))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((K (L X (AND (X (PASV PAINT.V)) (X BLUE.A)))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (K (L X (AND (X (PASV PAINT.V)) (X BLUE.A))))))
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
	              (((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
	                  ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
	                   GO.2.V))))
	               (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (IN.P ?C)) (AWAY.ADV PUT.1.V)) ?X_D)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?C CONTAINER.N))
			(!R4 (?C INANIMATE_OBJECT.N))
			(!R5 (?X_D SMALLER-THAN ?C))
			(!R6 (?X_D (PLUR CLOTHE.N)))
			(!R7 (?X_B WIFE.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D (IN.P ?C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D (IN.P ?C))))
		)
		(:POSTCONDS
			(?P1 (?X_D (IN.P ?C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 0.9))
			(!N3 (!R4 NECESSARY-TO-DEGREE 0.9))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-10.PR (K GONE.A)
	               (KA ((ADV-A (FOR.P ?X_N)) LOOK.V)) ?X_N))
	             ** ?E)
		(:ROLES
			(!R1 (?X_A (RIGHT-AFTER ?X_B)))
			(!R2 (?X_O WIFE.N))
			(!R3 (?X_I DAY.N))
			(!R4 (?X_I NEXT.A))
			(!R5 (?X_N (PLUR CLOTHE.N)))
			(!R6 (?X_P MAN.N))
			(!R7 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_M (?X_P (FOLD.V ?X_N)))
			(?X_H ((ADV-E (DURING ?X_I)) (?X_N (BE.V (K GONE.A)))))
			(?X_D (?X_O (REFOLD.V ?X_N)))
			(?X_A (?X_O (REFOLD.V ?X_N)))
			(?X_K (?X_P (((ADV-A (IN.P ?C)) (AWAY.ADV PUT.1.V)) ?X_N)))
			(?X_F
	   (?X_P
	    (((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_N)) LOOK.V))))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P (KA ((ADV-A (FOR.P ?X_N)) LOOK.V))))
	        ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_N)) LOOK.V)))) GO.2.V))))
	     (KA ((ADV-A (FOR.P ?X_N)) LOOK.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_F)))
			(!W2 (?X_M BEFORE ?X_H))
			(!W3 (?X_H BEFORE ?X_D))
			(!W4 (?X_D BEFORE ?X_A))
		)
	)
	(
			"A man folds a clothes."
			"A clothes is gone DURING a day next."
			"A wife of a man refolds a clothes."
			"A wife of a man refolds a clothes."
			"A man put.173s a clothes in C away."
			"A man go.169s for a clothes looking for for a clothes looking from L1 to for a clothes looking for for a clothes looking."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-11.PR ?X_B)) ** ?E)
		(:ROLES
			(!R1 (?X_A LITTLE.A))
			(!R2 (?X_A DOG.N))
			(!R3 (?X_B BALL.N))
		)
		(:STEPS
			(?X_D (?X_A ((MAY.AUX HAVE.V) ?X_B)))
		)
	)
	(
			"A little dog has a ball may."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-12.PR ?X_B)) ** ?E)
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
	(EPI-SCHEMA ((?X_B ((HOME.ADV TAKE.5.V) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_B (PLUR GIRL.N)))
			(!R6 (?X_C FROG.N))
			(!R7 (?X_C GIANT.A))
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
	              (((ADV-A (FOR.P ?X_C))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?X_C)) ((ADV-A (TO.P ?X_C)) GO.3.V))))
	               ?X_C))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C LOCATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C POND.N))
			(!R6 (?X_B (PLUR GIRL.N)))
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
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (IN.P ?X_D)) ((ADV-A (IN.P ?X_D)) PUT.2.V)) ?X_C))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?X_D BUCKET.N))
			(!R4 (?X_D INANIMATE_OBJECT.N))
			(!R5 (?X_C SMALLER-THAN ?X_D))
			(!R6 (?X_C FROG.N))
			(!R7 (?X_C GIANT.A))
			(!R8 (?X_B (PLUR GIRL.N)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (IN.P ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C (IN.P ?X_D))))
		)
		(:POSTCONDS
			(?P1 (?X_C (IN.P ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_G)))
			(!W2 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 0.9))
			(!N3 (!R4 NECESSARY-TO-DEGREE 0.9))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-13.PR (K ((ADV-A (FOR.P ?X_C)) (WITH.P ?X_O)))
	               ?X_N ?X_K))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C MONTH.N))
			(!R2 (?X_F BUCKET.N))
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
	    (((ADV-A (FOR.P ?X_N))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?X_N)) ((ADV-A (TO.P ?X_N)) GO.3.V))))
	     ?X_N)))
			(?X_H (?X_O ((HOME.ADV TAKE.5.V) ?X_K)))
			(?X_E (?X_O (((ADV-A (IN.P ?X_F)) ((ADV-A (IN.P ?X_F)) PUT.2.V)) ?X_K)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_H)))
			(!W2 (?X_M (BEFORE ?X_E)))
			(!W3 (?X_J BEFORE ?X_B))
		)
	)
	(
			"A girls catch a giant frog."
			"A giant frog lives for a month with a girls."
			"A girls go.230 a pond for a pond from L1 to a pond to a pond."
			"A girls take.227 a giant frog home."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              (COMPOSITE-SCHEMA-14.PR (KE (?X_E (VERY.ADV UNCOMFORTABLE.A)))
	               ?X_E))
	             ** ?E)
		(:ROLES
			(!R1 (NOT (?X_D (SURE.A (KE (?X_D (WANT.V (KA (EVEN.ADV (WEAR.V ?X_E))))))))))
			(!R2 (?X_E DRESS.N))
		)
		(:STEPS
			(?X_A (?X_D ((ADV-A (ON.P ?X_E)) TRY.V)))
			(?X_C (?X_D (FIND.V (KE (?X_E (VERY.ADV UNCOMFORTABLE.A))))))
			(?X_G (?X_D ((NEVER.ADV (AGAIN.ADV WEAR.V)) ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_C)))
			(!W2 (?X_A (BEFORE ?X_G)))
			(!W3 (?X_C (BEFORE ?X_G)))
		)
	)
	(
			"X_D tries on a dress."
			"X_D finds a dress very uncomfortable."
			"X_D wears a dress never again."
	)
)



(
	(EPI-SCHEMA ((?X_B WATCH.1.V (KE (?X_C BURN.V))) ** ?X_D)
		(:ROLES
			(!R1 (?X_B GIRL.N))
			(!R2 ((KE (?X_C BURN.V)) ENTITY.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?I PERTAIN-TO (KE (?X_C BURN.V))))
			(!R5 (?X_C DOLL.N))
			(!R6 (?X_C (ON.P (K FIRE.N))))
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
	(EPI-SCHEMA ((?X_J
	              (COMPOSITE-SCHEMA-15.PR (KE (?X_I FUNNY.A)) ?X_C
	               (KE (?X_F BURN.V))))
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
	(EPI-SCHEMA ((?X_D
	              (((ADV-A (IN.P ?X_E)) ((ADV-A (IN.P ?X_E)) PUT.3.V)) (K HAY.N)))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 ((K HAY.N) INANIMATE_OBJECT.N))
			(!R3 (?X_E CONTAINER.N))
			(!R4 (?X_E INANIMATE_OBJECT.N))
			(!R5 ((K HAY.N) SMALLER-THAN ?X_E))
			(!R6 (?X_D (HAS.V (SET-OF (TWO.D (PLUR FOX.N)) (TWO.D (PLUR BOX.N))))))
			(!R7
	   (?X_E
	    (ARE.V (KE ((K (L X (AND (X GOOD.A) (X (PLUR HOUSE.N))))) (FOR.P ?X_C))))))
			(!R8 (?X_E (PLUR BOX.N)))
			(!R9 (?X_C (PERTAIN-TO ?X_D)))
			(!R10 (?X_C (PLUR FOX.N)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT ((K HAY.N) (IN.P ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT ((K HAY.N) (IN.P ?X_E))))
		)
		(:POSTCONDS
			(?P1 ((K HAY.N) (IN.P ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 0.9))
			(!N3 (!R4 NECESSARY-TO-DEGREE 0.9))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D
	              (((ADV-A (IN.P ?X_E)) ((ADV-A (IN.P ?X_E)) PUT.3.V)) (K HAY.N)))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 ((K HAY.N) INANIMATE_OBJECT.N))
			(!R3 (?X_E CONTAINER.N))
			(!R4 (?X_E INANIMATE_OBJECT.N))
			(!R5 ((K HAY.N) SMALLER-THAN ?X_E))
			(!R6 (?X_D (HAS.V (SET-OF (TWO.D (PLUR FOX.N)) (TWO.D (PLUR BOX.N))))))
			(!R7
	   (?X_E
	    (ARE.V (KE ((K (L X (AND (X GOOD.A) (X (PLUR HOUSE.N))))) (FOR.P ?X_C))))))
			(!R8 (?X_E (PLUR BOX.N)))
			(!R9 (?X_C (PERTAIN-TO ?X_D)))
			(!R10 (?X_C (PLUR FOX.N)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT ((K HAY.N) (IN.P ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT ((K HAY.N) (IN.P ?X_E))))
		)
		(:POSTCONDS
			(?P1 ((K HAY.N) (IN.P ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 0.9))
			(!N3 (!R4 NECESSARY-TO-DEGREE 0.9))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-16.PR (SET-OF ?X_K ?X_J) (EACH.D FOX.N) ?X_A
	               (K HAY.N)))
	             ** ?E)
		(:ROLES
			(!R1
	   (?X_E
	    (ARE.V (KE ((K (L X (AND (X GOOD.A) (X (PLUR HOUSE.N))))) (FOR.P ?X_N))))))
			(!R2 (?X_E (PLUR BOX.N)))
			(!R3 (?X_O (HAS.V (SET-OF (TWO.D (PLUR FOX.N)) (TWO.D (PLUR BOX.N))))))
			(!R4 (?X_J (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_I))))))))
			(!R5 (?X_J FOX.N))
			(!R6 (?X_K FOX.N))
			(!R7 (?X_K (ON.P ?X_L)))
			(!R8 (?X_M AGENT.N))
			(!R9 (?X_N (PLUR FOX.N)))
			(!R10 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_B (?X_M (SEE.V (SET-OF ?X_K ?X_J))))
			(?X_G (?X_O (GIVE.V (EACH.D FOX.N) ?X_A)))
			(?X_D (?X_O (((ADV-A (IN.P ?X_E)) ((ADV-A (IN.P ?X_E)) PUT.3.V)) (K HAY.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_G)))
		)
	)
	(
			"A agent sees a fox on X_L and a in front of fox."
			"A has two foxs and two boxs gives each fox X_A."
			"A has two foxs and two boxs put.15s hay in a are good house for a foxs of a has two foxs and two boxs boxs in a are good house for a foxs of a has two foxs and two boxs boxs."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-17.PR (KE (?X_C (PLAY.V (K BALL.N)))))) ** ?E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_C BIG.A))
			(!R3 (?X_C DOG.N))
			(!R4 (?X_B (HAS.V ?X_C)))
		)
		(:STEPS
			(?X_E (?X_A ((MAY.AUX SEE.V) (KE (?X_C (PLAY.V (K BALL.N)))))))
		)
	)
	(
			"A agent sees a big dog plays ball may."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (AROUND.P ?X_A)) RIDE.1.V))))
	               ?L2))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (AROUND.P ?X_B)) RIDE.2.V))))
	               ?L2))
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
	(EPI-SCHEMA ((?X_D ((TOGETHER.ADV GET.9.V) ?X_E)) ** ?X_F)
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
	(EPI-SCHEMA ((?X_D ((TOGETHER.ADV GET.10.V) ?X_E)) ** ?X_F)
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-18.PR (KA ((ADV-A (TO.P ?X_A)) GO.V)))) ** ?E)
		(:ROLES
			(!R1 (?X_A BEACH.N))
			(!R2 (?X_D WATER.N))
			(!R3 (?X_G DAY.N))
			(!R4 (?X_G GOOD.A))
			(!R5 (?X_H (PERTAIN-TO ?X_J)))
			(!R6 (?X_I (PERTAIN-TO ?X_J)))
		)
		(:STEPS
			(?X_C (?X_J (WANT.V (KA ((ADV-A (TO.P ?X_A)) GO.V)))))
			(?X_F (?X_J ((ADV-A (IN.P ?X_D)) SWAM.V)))
			(?X_L ((ADV-E (DURING ?X_G)) (?X_J HAVE.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_F)))
			(!W2 (?X_C (BEFORE ?X_L)))
			(!W3 (?X_F (BEFORE ?X_L)))
		)
	)
	(
			"X_J wants to a beach going."
			"X_J swims in a water."
			"X_J has DURING a day good."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-19.PR ?X_C (K (VERY.ADV HIGH.A))
	               (K (L X (AND (X MUCH.A) (X FUN.N))))))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-20.PR ?X_E)) ** ?E)
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
	(EPI-SCHEMA ((?X_B ((OUT.PRT GET.11.V) ?O)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_B GET.12.V (K (BACK.ADV (IN.P ?X_C)))) ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 ((K (BACK.ADV (IN.P ?X_C))) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K (BACK.ADV (IN.P ?X_C))))))
			(!R5 (?X_C WARM.A))
			(!R6 (?X_C SHOWER.V))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V (K (BACK.ADV (IN.P ?X_C)))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (K (BACK.ADV (IN.P ?X_C))))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((K (BACK.ADV (IN.P ?X_C))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (K (BACK.ADV (IN.P ?X_C)))))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-21.PR ?X_L)) ** ?E)
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
	(EPI-SCHEMA ((?X_B WATCH.2.V ?X_C) ** ?X_D)
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
			(?X_F (?X_B ((CAN.MD (INSIDE.ADV SEE.V)) ?X_C)))
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
	(EPI-SCHEMA ((?X_B WATCH.3.V ?X_C) ** ?X_F)
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
			(?X_D (?X_B ((CAN.MD (INSIDE.ADV SEE.V)) ?X_C)))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-22.PR ?X_O ?X_C ?X_J)) ** ?E)
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
			"A man watch.103s a woman."
			"A man watch.104s a woman."
	)
)



(
	(EPI-SCHEMA ((?X_B MAKE.2.V ?X_C) ** ?X_D)
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
	(EPI-SCHEMA ((?X_C ((ADV-A (WITH.P ?T)) PLAY.2.V) ?X_B) ** ?X_D)
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
	(EPI-SCHEMA ((?X_C ((ADV-A (WITH.P ?T)) PLAY.3.V) ?X_A) ** ?X_D)
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-23.PR (KE ((K MONEY.N) (FOR.P (?X_H BET.N))))
	               (ALL.D
	                (L X
	                 (AND (X {REF}.N)
	                      (?X_A ?X_C (AND (?X_C MONEY.N) (?X_C (PERTAIN-TO ?X_N)))
	                       (X (OF.P ?X_C))))))
	               ?X_M))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H MORE.A))
			(!R2 (?X_M BET.N))
			(!R3 (?X_N MAN.N))
		)
		(:STEPS
			(?X_J (?X_N (LOSE.V ?X_M)))
			(?X_G (?X_N ((ONLY.ADV HAVE.V) (KE ((K MONEY.N) (FOR.P (?X_H BET.N)))))))
			(?X_E
	   (?X_N
	    (LOSE.V
	     (ALL.D
	      (L X
	       (AND (X {REF}.N)
	            (?X_A ?X_C (AND (?X_C MONEY.N) (?X_C (PERTAIN-TO ?X_N)))
	             (X (OF.P ?X_C)))))))))
			(?X_L (?X_N MAKE.2.V ?X_M))
			(?X_L (?X_N ((ADV-A (WITH.P ?T)) PLAY.2.V) ?X_M))
			(?X_L (?X_N ((ADV-A (WITH.P ?T)) PLAY.3.V) ?X_M))
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
	(EPI-SCHEMA ((?X_H
	              (((ADV-A (IN.P ?X_A)) GET.13.V)
	               (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I)))))
	             ** ?X_J)
		(:ROLES
			(!R1 (?X_H AGENT.N))
			(!R2 ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))) INANIMATE_OBJECT.N))
			(!R3 (?X_G HOME.N))
			(!R4 (NOT (?X_H = (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))))))
			(!R5 (?X_I WATER.N))
			(!R6 (?X_A BOAT.N))
			(!R7 (?X_A ROW.N))
			(!R8 (?X_H (PLUR CHILD.N)))
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
	(EPI-SCHEMA ((?X_H
	              (((ADV-A (IN.P ?X_A)) GET.14.V)
	               (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I)))))
	             ** ?X_J)
		(:ROLES
			(!R1 (?X_H AGENT.N))
			(!R2 ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))) INANIMATE_OBJECT.N))
			(!R3 (?X_G HOME.N))
			(!R4 (NOT (?X_H = (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))))))
			(!R5 (?X_H (PLUR CHILD.N)))
			(!R6 (?X_A BOAT.N))
			(!R7 (?X_A ROW.N))
			(!R8 (?X_I WATER.N))
			(!R9 (?X_G HOUSE.N))
			(!R10 (?X_G (PERTAIN-TO ?X_E)))
			(!R11 (?X_C FATHER.N))
			(!R12 (?X_C (PERTAIN-TO ?X_E)))
			(!R13 (?X_D HOOK.N))
			(!R14 (?X_E (HAS.V ?X_D)))
			(!R15 (?X_F BOAT.N))
			(!R16 (?X_F NEW.A))
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
	(EPI-SCHEMA ((?X_H
	              (((ADV-A (IN.P ?X_A)) GET.15.V)
	               (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I)))))
	             ** ?X_J)
		(:ROLES
			(!R1 (?X_H AGENT.N))
			(!R2 ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))) INANIMATE_OBJECT.N))
			(!R3 (?X_G HOME.N))
			(!R4 (NOT (?X_H = (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_I))))))
			(!R5 (?X_A BOAT.N))
			(!R6 (?X_A ROW.N))
			(!R7 (?X_H (PLUR CHILD.N)))
			(!R8 (?X_I WATER.N))
			(!R9 (?X_G HOUSE.N))
			(!R10 (?X_G (PERTAIN-TO ?X_E)))
			(!R11 (?X_C HOOK.N))
			(!R12 (?X_E (HAS.V ?X_C)))
			(!R13 (?X_D FATHER.N))
			(!R14 (?X_D (PERTAIN-TO ?X_E)))
			(!R15 (?X_F BOAT.N))
			(!R16 (?X_E (HAS.V ?X_F)))
			(!R17 (?X_F NEW.A))
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
	(EPI-SCHEMA ((?X_D
	              (COMPOSITE-SCHEMA-24.PR ?X_R ?X_P ?X_J ?X_G
	               (K (L X (AND (X OUT.P) (X (OF.P (THE.D BOAT.N))))))
	               (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_B)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_B WATER.N))
			(!R2 (?X_C ROW.N))
			(!R3 (?X_C BOAT.N))
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
			(E255.SK
	   (NOT (?X_D (FALL.V (K (L X (AND (X OUT.P) (X (OF.P (THE.D BOAT.N))))))))))
			(E256.SK
	   (?X_D
	    (((ADV-A (IN.P ?X_C)) GET.13.V) (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_B))))))
			(E256.SK
	   (?X_D
	    (((ADV-A (IN.P ?X_C)) GET.14.V) (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_B))))))
			(E256.SK
	   (?X_D
	    (((ADV-A (IN.P ?X_C)) GET.15.V) (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_B))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N BEFORE ?X_K))
			(!W2 (?X_K BEFORE ?X_I))
			(!W3 (?X_I BEFORE ?X_E))
			(!W4 (?X_E BEFORE E255.SK))
			(!W5 (E255.SK BEFORE E256.SK))
		)
	)
	(
			"A father of a has a new boat has a hook gives a new boat a has a new boat has a hook."
			"A father of a has a new boat has a hook gives a new boat to a has a new boat has a hook."
			"A has a new boat has a hook keeps a good oars at a house home of a has X_P has X_S."
			"A house home of a has X_P has X_S is near."
			"A childs fall out of not."
			"A childs get.127 ADV far out on a water in a row boat."
			"A childs get.128 ADV far out on a water in a row boat."
			"A childs get.129 ADV far out on a water in a row boat."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (COMPOSITE-SCHEMA-25.PR
	               (K (L X (AND (X GOLD.A) (X (PLUR EARRING.N)))))
	               (KE (?X_B EVERYDAY.A))))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) (AWAY.PRT RUN.3.V))))
	               ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_D NEW.A))
			(!R6 (?X_B EVENING.N))
			(!R7 (?X_B (WALK.V ?X_D)))
			(!R8 (?X_C ((CANNOT.ADV CATCH.V) ?X_D)))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) (AWAY.PRT RUN.4.V))))
	               ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_D NEW.A))
			(!R6 (?X_B ((CANNOT.ADV CATCH.V) ?X_D)))
			(!R7 (?X_D (PERTAIN-TO ?X_B)))
			(!R8 (?X_C EVENING.N))
			(!R9 (?X_C (WALK.V ?X_D)))
			(!R10 (?X_B ((OUT.ADV IS.V) ?X_C)))
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
	(EPI-SCHEMA ((?X_C GET.16.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D NEW.A))
			(!R6 (?X_D DOG.N))
			(!R7 (?X_C ((CANNOT.ADV CATCH.V) ?X_D)))
			(!R8 (?X_D (PERTAIN-TO ?X_C)))
			(!R9 (?X_B EVENING.N))
			(!R10 (?X_C ((OUT.ADV IS.V) ?X_B)))
			(!R11 (?X_B (WALK.V ?X_D)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-26.PR ?L2 ?X_K)) ** ?E)
		(:ROLES
			(!R1 (?X_E (RIGHT-AFTER ?X_F)))
			(!R2 (?X_K NEW.A))
			(!R3 (?X_K DOG.N))
			(!R4 (?X_K (PERTAIN-TO ?X_I)))
			(!R5 (?X_I ((CANNOT.ADV CATCH.V) ?X_K)))
			(!R6 (?X_J EVENING.N))
			(!R7 (?X_I ((OUT.ADV IS.V) ?X_J)))
			(!R8 (?X_J (WALK.V ?X_K)))
		)
		(:STEPS
			(?X_E (?X_I (LOVE.V ?X_K)))
			(?X_D (?X_I (LOVE.V ?X_K)))
			(?X_H (?X_I GET.16.V ?X_K))
			(?X_B
	   (?X_K
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) (AWAY.PRT RUN.3.V))))
	     ?L2)))
			(?X_B
	   (?X_K
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) (AWAY.PRT RUN.4.V))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_B)))
			(!W2 (?X_E BEFORE ?X_D))
		)
	)
	(
			"A out is a evening walking a new dog of X_I cannot catch a new dog of a out is X_J cannot catch a new dog of X_I loves a new dog of a out is X_J cannot catch a new dog of X_I."
			"A out is a evening walking a new dog of X_I cannot catch a new dog of a out is X_J cannot catch a new dog of X_I loves a new dog of a out is X_J cannot catch a new dog of X_I."
			"A out is a evening walking a new dog of X_I cannot catch a new dog of a out is X_J cannot catch a new dog of X_I get.165s a new dog of a out is X_J cannot catch a new dog of X_I."
			"A new dog of a out is X_J cannot catch a new dog of X_I run.156s L2 for L2 from L1 to L2 away."
			"A new dog of a out is X_J cannot catch a new dog of X_I run.158s L2 for L2 from L1 to L2 away."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (TO.P ?X_D)) ((ADV-A (TO.P ?X_A)) GIVE.1.V)) ?X_D ?O))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?X_D AGENT.N))
			(!R4 (?X_C MALE.A))
			(!R5 (?X_A WOMAN.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?O))
			(?I2 (NOT (?X_D HAVE.V ?O)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C HAVE.V ?O)))
			(?P2 (?X_D HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
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
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (TO.P ?X_D)) ((ADV-A (TO.P ?X_B)) GIVE.2.V)) ?X_D ?O))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?X_D AGENT.N))
			(!R4 (?X_B WOMAN.N))
			(!R5 (?X_C MALE.A))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?O))
			(?I2 (NOT (?X_D HAVE.V ?O)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C HAVE.V ?O)))
			(?P2 (?X_D HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
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
	(EPI-SCHEMA ((?X_B GET.17.V (K MAD.A)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B WOMAN.N))
			(!R2 ((K MAD.A) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K MAD.A))))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V (K MAD.A)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (K MAD.A))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((K MAD.A) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (K MAD.A)))
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
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-27.PR ?X_P ?X_L ?X_A ?O (K MAD.A))) ** ?E)
		(:ROLES
			(!R1 (?X_B (RIGHT-AFTER ?X_C)))
			(!R2 (?X_G FEMALE.A))
			(!R3 (?X_G AGENT.N))
			(!R4 (?X_F (PERTAIN-TO ?X_G)))
			(!R5 (?X_L WOMAN.N))
			(!R6 (?X_M MALE.A))
			(!R7 (?X_M AGENT.N))
			(!R8 (?X_P ROSE.N))
			(!R9 (?X_Q MAN.N))
			(!R10 (?X_T ROSEBUSH.N))
		)
		(:STEPS
			(?X_S (?X_T BLOOM.V))
			(?X_O (?X_Q (CUT.V ?X_P)))
			(?X_E (NOT (?X_G ((DID.AUX LIKE.V) ?X_L))))
			(?X_B (NOT (?X_G ((DID.AUX LIKE.V) ?X_L))))
			(?X_K (?X_M (((ADV-A (TO.P ?X_A)) ((ADV-A (TO.P ?X_L)) GIVE.1.V)) ?X_A ?O)))
			(?X_K (?X_M (((ADV-A (TO.P ?X_A)) ((ADV-A (TO.P ?X_L)) GIVE.2.V)) ?X_A ?O)))
			(?X_I (?X_L GET.17.V (K MAD.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_S BEFORE ?X_O))
			(!W3 (?X_O BEFORE ?X_E))
			(!W4 (?X_E BEFORE ?X_B))
		)
	)
	(
			"A rosebush blooms."
			"A man cuts a rose."
			"A female agent likes a woman not did."
			"A female agent likes a woman not did."
			"A male agent give.192s X_A.SK O to X_A to a woman."
			"A male agent give.194s X_A.SK O to X_A to a woman."
			"A woman get.195s mad."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (COMPOSITE-SCHEMA-28.PR (K (PLUR PET.N))
	               (KA (FIND.V (?X_D (VERY.ADV HARD.A))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C ((FINALLY.ADV FIND.V) ?X_D)))
		)
		(:STEPS
			(?X_B (?X_C (LIKE.V (K (PLUR PET.N)))))
			(?X_F (?X_C (TRY.V (KA (FIND.V (?X_D (VERY.ADV HARD.A)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_F)))
		)
	)
	(
			"A finally find X_D likes pets."
			"A finally find X_D tries finding X_D very hard."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?X_D))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_D)) FALL.1.V))))
	               ?L2))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E BROTHER.N))
			(!R2 (?X_D LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_D = ?L2)))
			(!R5 (?X_D TREE.N))
			(!R6 (?X_B AGENT.N))
			(!R7 (?X_E (PERTAIN-TO ?X_B)))
			(!R8 (?X_C (PERTAIN-TO ?X_B)))
			(!R9 (?X_C HOUSE.N))
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
	(EPI-SCHEMA ((?X_D
	              ((ADV-A
	                (FOR.P (K (IN.P (?X_E ((ADV-A (BY.P ?X_F)) (IN.P ?X_G)))))))
	               ((ADV-A (FROM.P ?L1))
	                ((ADV-A
	                  (TO.P (K (IN.P (?X_E ((ADV-A (BY.P ?X_F)) (IN.P ?X_G)))))))
	                 GO.4.V)))
	              (K (IN.P (?X_E ((ADV-A (BY.P ?X_F)) (IN.P ?X_G))))))
	             ** ?X_H)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (IN.P (?X_E ((ADV-A (BY.P ?X_F)) (IN.P ?X_G))))) LOCATION.N))
			(!R4 (NOT (?L1 = (K (IN.P (?X_E ((ADV-A (BY.P ?X_F)) (IN.P ?X_G))))))))
			(!R5 (?X_G (PLUR WOOD.N)))
			(!R6 (?X_E HIKE.N))
			(!R7 (?X_F HOUSE.N))
			(!R8 (?X_F (PERTAIN-TO ?X_B)))
			(!R9 (?X_B AGENT.N))
			(!R10 (?X_C (PERTAIN-TO ?X_B)))
			(!R11 (?X_C BROTHER.N))
		)
		(:GOALS
			(?G1
	   (?X_D
	    (WANT.V
	     (KA
	      ((ADV-A (AT.P (K (IN.P (?X_E ((ADV-A (BY.P ?X_F)) (IN.P ?X_G)))))))
	       BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P (K (IN.P (?X_E ((ADV-A (BY.P ?X_F)) (IN.P ?X_G)))))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P (K (IN.P (?X_E ((ADV-A (BY.P ?X_F)) (IN.P ?X_G))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_H))
			(!W2 (?I2 BEFORE ?X_H))
			(!W3 (?P1 AFTER ?X_H))
			(!W4 (?P2 AFTER ?X_H))
			(!W5 (?G1 CAUSE-OF ?X_H))
			(!W6 (?X_H (AT-ABOUT ?X_I)))
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
	              ((ADV-A (FOR.P (KE (?X_E (OF.P ?X_F)))))
	               ((ADV-A (FROM.P ?L1))
	                ((ADV-A (TO.P (KE (?X_E (OF.P ?X_F))))) CLIMB.1.V)))
	              (KE (?X_E (OF.P ?X_F))))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_D BROTHER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KE (?X_E (OF.P ?X_F))) LOCATION.N))
			(!R4 (NOT (?L1 = (KE (?X_E (OF.P ?X_F))))))
			(!R5 (?X_F (VERY.ADV HIGH.A)))
			(!R6 (?X_F (PLUR TREE.N)))
			(!R7 (?X_B AGENT.N))
			(!R8 (?X_D (PERTAIN-TO ?X_B)))
			(!R9 (?X_C HOUSE.N))
			(!R10 (?X_C (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P (KE (?X_E (OF.P ?X_F))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?L1)))
			(?I2 (NOT (?X_D (AT.P (KE (?X_E (OF.P ?X_F)))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?L1))))
			(?P2 (?X_D (AT.P (KE (?X_E (OF.P ?X_F))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_G))
			(!W2 (?I2 BEFORE ?X_G))
			(!W3 (?P1 AFTER ?X_G))
			(!W4 (?P2 AFTER ?X_G))
			(!W5 (?G1 CAUSE-OF ?X_G))
			(!W6 (?X_G (AT-ABOUT ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-29.PR ?X_P (KA (DOWN.ADV GET.V)) ?L2
	               (K (IN.P (?X_M ((ADV-A (BY.P ?X_O)) (IN.P ?X_L)))))
	               (KE (?X_A (OF.P ?X_I)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D TREE.N))
			(!R2 (?X_I (VERY.ADV HIGH.A)))
			(!R3 (?X_I (PLUR TREE.N)))
			(!R4 (?X_P BROTHER.N))
			(!R5 (?X_L (PLUR WOOD.N)))
			(!R6 (?X_O HOUSE.N))
			(!R7 (?X_M HIKE.N))
			(!R8 (?X_N AGENT.N))
			(!R9 (?X_Q AGENT.N))
			(!R10 (?X_O (PERTAIN-TO ?X_Q)))
			(!R11 (?X_P (PERTAIN-TO ?X_Q)))
		)
		(:STEPS
			(?X_F (?X_N (TELL.V ?X_P (KA (DOWN.ADV GET.V)))))
			(?X_K
	   (?X_N
	    ((ADV-A (FOR.P (K (IN.P (?X_M ((ADV-A (BY.P ?X_O)) (IN.P ?X_L)))))))
	     ((ADV-A (FROM.P ?L1))
	      ((ADV-A (TO.P (K (IN.P (?X_M ((ADV-A (BY.P ?X_O)) (IN.P ?X_L)))))))
	       GO.4.V)))
	    (K (IN.P (?X_M ((ADV-A (BY.P ?X_O)) (IN.P ?X_L)))))))
			(?X_H
	   (?X_P
	    ((ADV-A (FOR.P (KE (?X_A (OF.P ?X_I)))))
	     ((ADV-A (FROM.P ?L1))
	      ((ADV-A (TO.P (KE (?X_A (OF.P ?X_I))))) CLIMB.1.V)))
	    (KE (?X_A (OF.P ?X_I)))))
			(?X_C
	   (?X_P
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?X_D))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_D)) FALL.1.V))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_H)))
			(!W2 (?X_K (BEFORE ?X_C)))
			(!W3 (?X_H (BEFORE ?X_C)))
		)
	)
	(
			"A agent tells a brother of a agent down get."
			"A agent go.217s in a hike by a house of a agent in a woods for in a hike by a house of a agent in a woods from L1 to in a hike by a house of a agent in a woods."
			"A brother of a agent climb.220s X_A of a very high trees for X_A of a very high trees from L1 to X_A of a very high trees."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              ((ADV-A (ON.P ?S))
	               ((ADV-A (IN.P ?S)) (DOWN.ADV ((ADV-A (FOR.P ?X_B)) SIT.3.V)))))
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
	              ((ADV-A (ON.P ?S))
	               ((ADV-A (IN.P ?S)) (DOWN.ADV ((ADV-A (FOR.P ?X_A)) SIT.4.V)))))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-30.PR (KE (?X_L THINK.V)))) ** ?E)
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
	    ((ADV-A (ON.P ?S))
	     ((ADV-A (IN.P ?S)) (DOWN.ADV ((ADV-A (FOR.P ?X_F)) SIT.3.V))))))
			(?X_E
	   (?X_L
	    ((ADV-A (ON.P ?S))
	     ((ADV-A (IN.P ?S)) (DOWN.ADV ((ADV-A (FOR.P ?X_F)) SIT.4.V))))))
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
			"A man more tired sit.1s on S in S down for a break."
			"A man more tired sit.5s on S in S down for a break."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2))
	                  ((ADV-A (IN.P (K (L X (AND (X LAST.A) (X PLACE.N))))))
	                   COME.1.V))))
	               ?L2))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-31.PR ?L2)) ** ?E)
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
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2))
	        ((ADV-A (IN.P (K (L X (AND (X LAST.A) (X PLACE.N)))))) COME.1.V))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H BEFORE ?X_E))
			(!W2 (?X_E BEFORE ?X_C))
		)
	)
	(
			"A friends of a agent and a agent run."
			"A agent is behind a group."
			"A agent come.21s L2 for L2 from L1 to L2 in last place."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              (COMPOSITE-SCHEMA-32.PR (KA SKATE.V)
	               (KA (TAKE.V (K (PLUR LESSON.N))))))
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
	(EPI-SCHEMA ((?X_D
	              (((ADV-A (IN.P ?X_A)) FIND.2.V)
	               (K (L X (AND (X SWEET.A) (X NECTAR.N))))))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C LOCATION.N))
			(!R3 (?X_A (PLUR FLOWER.N)))
			(!R4 (?X_A CLOVER.N))
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
	(EPI-SCHEMA ((?X_D
	              (((ADV-A (IN.P ?X_A)) FIND.3.V)
	               (K (L X (AND (X SWEET.A) (X NECTAR.N))))))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C HOME.N))
			(!R3 (?X_A CLOVER.N))
			(!R4 (?X_A (PLUR FLOWER.N)))
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
	(EPI-SCHEMA ((?X_D
	              (((ADV-A (IN.P ?X_B)) FIND.4.V)
	               (K (L X (AND (X SWEET.A) (X NECTAR.N))))))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C HOME.N))
			(!R3 (?X_D (PLUR BEE.N)))
			(!R4 (?X_B CLOVER.N))
			(!R5 (?X_B (PLUR FLOWER.N)))
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
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P (KA (MAKE.V (K HONEY.N))))) TAKE.7.V) ?X_D))
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
	(EPI-SCHEMA ((?X_T
	              (COMPOSITE-SCHEMA-33.PR ?X_A ?X_K ?X_B (K CLOVER.N)
	               (K (L X (AND (X SWEET.A) (X NECTAR.N)))) ?X_N))
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
	   (?X_T
	    (((ADV-A (IN.P ?X_Q)) FIND.2.V) (K (L X (AND (X SWEET.A) (X NECTAR.N)))))))
			(?X_P
	   (?X_T
	    (((ADV-A (IN.P ?X_Q)) FIND.3.V) (K (L X (AND (X SWEET.A) (X NECTAR.N)))))))
			(?X_P
	   (?X_T
	    (((ADV-A (IN.P ?X_Q)) FIND.4.V) (K (L X (AND (X SWEET.A) (X NECTAR.N)))))))
			(?X_M (?X_T (((ADV-A (FOR.P (KA (MAKE.V (K HONEY.N))))) TAKE.7.V) ?X_N)))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-34.PR (KA (BUY.V ?X_E)) ?X_H ?X_N)) ** ?E)
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
			(?X_L (?X_M (BUY.V ?X_N)))
			(?X_P (?X_M ((HOME.ADV WEAR.V) ?X_N)))
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
			"A agent buys a rose gold watch."
			"A agent wears a rose gold watch home."
	)
)



(
	(EPI-SCHEMA ((?X_C GET.18.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_B PLACE.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B HOUSE.N))
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
	(EPI-SCHEMA ((?X_W
	              (COMPOSITE-SCHEMA-35.PR
	               (KA (OVER.PRT ((ADV-A (IN.P (THREE.D (PLUR HOUR.N)))) COME.V)))
	               ?X_P ?X_V ?X_B))
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
			(?X_E (?X_A ?X_G (HAVE.V ?X_V)))
			(?X_D (?X_A ?X_G (HAVE.V ?X_V)))
			(?X_U (?X_W GET.18.V ?X_B))
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
			"X_A has a place house of X_W."
			"X_A has a place house of X_W."
			"X_W get.93s X_B."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?X_D))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_D)) COME.2.V))))
	               ?L2))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_D LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_D = ?L2)))
			(!R5 (?X_E (OF.P (K PAPER.N))))
			(!R6 (?X_E UMBRELLA.N))
			(!R7 (?X_B (OF.P ?X_E)))
			(!R8 (?X_B PICTURE.N))
			(!R9 (?X_C UMBRELLA.N))
			(!R10 (?X_E (IS.V ?X_C)))
			(!R11 (?X_C GOOD.A))
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
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?X_D))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_D)) COME.3.V))))
	               ?L2))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_D LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_D = ?L2)))
			(!R5 (?X_E (OF.P (K PAPER.N))))
			(!R6 (?X_E UMBRELLA.N))
			(!R7 (?X_B UMBRELLA.N))
			(!R8 (?X_E (IS.V ?X_B)))
			(!R9 (?X_B GOOD.A))
			(!R10 (?X_C PICTURE.N))
			(!R11 (?X_C (OF.P ?X_E)))
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
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FOR.P (K CHURCH.N)))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P (K CHURCH.N)))
	                  ((ADV-A (TO.P (K CHURCH.N))) GO.5.V))))
	               (K CHURCH.N)))
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
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-36.PR ?X_N ?X_Q ?L2 (K CHURCH.N))) ** ?E)
		(:ROLES
			(!R1 (?X_Q UMBRELLA.N))
			(!R2 (?X_Q (OF.P (K PAPER.N))))
			(!R3 (?X_N PARASOL.N))
			(!R4 (?X_N BLACK.A))
			(!R5 (?X_N SMALL.A))
			(!R6 (?X_N (OF.P (K SILK.N))))
			(!R7 (?X_O GOOD.A))
			(!R8 (?X_O UMBRELLA.N))
			(!R9 (?X_Q (IS.V ?X_O)))
			(!R10 (?X_P PICTURE.N))
			(!R11 (?X_P (OF.P ?X_Q)))
		)
		(:STEPS
			(?X_D (?X_B ((ADV-A (TO.P (K CHURCH.N))) GO.V)))
			(?X_M (?X_B (CARRY.V ?X_N)))
			(?X_I (?X_A (CARRY.V ?X_Q)))
			(?X_E
	   (?X_B
	    (((ADV-A (FOR.P (K CHURCH.N)))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P (K CHURCH.N))) ((ADV-A (TO.P (K CHURCH.N))) GO.5.V))))
	     (K CHURCH.N))))
			(?X_K (?X_B (CARRY.V ?X_N)))
			(?X_G
	   (?X_Q
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?X_C))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_C)) COME.2.V))))
	     ?L2)))
			(?X_G
	   (?X_Q
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?X_C))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_C)) COME.3.V))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_M)))
			(!W2 (?X_D (BEFORE ?X_G)))
			(!W3 (?X_M (BEFORE ?X_G)))
			(!W4 (?X_E (BEFORE ?X_K)))
			(!W5 (?X_E (BEFORE ?X_G)))
			(!W6 (?X_K (BEFORE ?X_G)))
		)
	)
	(
			"X_B goes to church."
			"X_B carries a parasol black small of silk."
			"X_A carries a umbrella of paper is a good umbrella."
			"X_B go.106s church for church from L1 to church to church."
			"X_B carries a parasol black small of silk."
			"A umbrella of paper is a good umbrella come.107s L2 for L2 from X_C to L2 from X_C."
			"A umbrella of paper is a good umbrella come.108s L2 for L2 from X_C to L2 from X_C."
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
			(!R9 (?X_D (HAS.V ?X_C)))
			(!R10 (?X_D BOY.N))
			(!R11 (?X_D LITTLE.A))
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
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-37.PR
	               (K
	                (L X
	                 (AND (X LITTLE.A) (X MAY.N)
	                      (X ((ADV-A (IN.P ?X_I)) RIDE.V)))))
	               ?X_E ?X_B))
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
			(E204.SK
	   (?X_H
	    (LET.V
	     (K (L X (AND (X LITTLE.A) (X MAY.N) (X ((ADV-A (IN.P ?X_I)) RIDE.V))))))))
			(?X_D (?X_B ((MAY.AUX HAVE.V) ?X_E)))
			(E205.SK (?X_G TAKE.8.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (E204.SK BEFORE ?X_D))
			(!W2 (?X_D BEFORE E205.SK))
		)
	)
	(
			"A little boy has a red wagon of a agent lets little may riding."
			"X_B has a good ride may."
			"A agent take.120s X_B."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2))
	                  (ALMOST.ADV ((ADV-A (INTO.P ?X_A)) RUN.5.V)))))
	               ?L2))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2))
	                  (ALMOST.ADV ((ADV-A (INTO.P ?X_B)) RUN.6.V)))))
	               ?L2))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (THROUGH.P ?X_B)) COME.4.V))))
	               ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B DOOR.N))
			(!R6 (?X_B (AT.P (K WORK.N))))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-38.PR ?X_C ?L2)) ** ?E)
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
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (THROUGH.P ?X_H)) COME.4.V))))
	     ?L2)))
			(?X_E
	   (?X_J
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) (ALMOST.ADV ((ADV-A (INTO.P ?X_I)) RUN.5.V)))))
	     ?L2)))
			(?X_E
	   (?X_J
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) (ALMOST.ADV ((ADV-A (INTO.P ?X_I)) RUN.6.V)))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
		)
	)
	(
			"A friend of a agent wears a piece two purple."
			"A agent come.139s L2 for L2 from L1 to L2 through a door at work."
			"A agent run.137s L2 for L2 from L1 to L2 almost into a friend of a agent."
			"A agent run.138s L2 for L2 from L1 to L2 almost into a friend of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (ON.P ?X_D))
	               ((ADV-A (IN.P ?X_D))
	                (DOWN.ADV ((ADV-A (ON.P ?X_D)) SIT.5.V)))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_D FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_C TIRED.A))
			(!R6 (?X_D GROUND.N))
			(!R7 (?X_B (K WATER.N) BOTTLE.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-39.PR (KA WALK.V) ?X_K
	               (KA (WALK.V (KA (FIND.V (K WATER.N)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F (RIGHT-AFTER ?X_G)))
			(!R2 (?X_K (K WATER.N) BOTTLE.N))
			(!R3 (?X_J GROUND.N))
			(!R4 (?X_L TIRED.A))
			(!R5 (?X_L MAN.N))
			(!R6 (?X_K (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(?X_A (?X_L (OF.P (KA WALK.V))))
			(?X_F (?X_L ((OUT.PRT TAKE.V) ?X_K)))
			(?X_E (?X_L ((OUT.PRT TAKE.V) ?X_K)))
			(?X_C (MUST.AUX-S (?X_L (KEEP.V (KA (WALK.V (KA (FIND.V (K WATER.N)))))))))
			(?X_I
	   (?X_L
	    ((ADV-A (ON.P ?X_J))
	     ((ADV-A (IN.P ?X_J)) (DOWN.ADV ((ADV-A (ON.P ?X_J)) SIT.5.V))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_F)))
			(!W2 (?X_A (BEFORE ?X_E)))
			(!W3 (?X_A (BEFORE ?X_C)))
			(!W4 (?X_F (BEFORE ?X_E)))
			(!W5 (?X_F (BEFORE ?X_C)))
			(!W6 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A tired man is of."
			"A tired man takes a of a tired man out."
			"A tired man takes a of a tired man out."
			"A tired man keeps walking finding water must."
			"A tired man sit.164s on a ground in a ground down on a ground."
	)
)



(
	(EPI-SCHEMA ((?X_B FIND.5.V ?X_C) ** ?X_E)
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
	              (((ADV-A (IN.P ?X_D)) ((ADV-A (IN.P ?X_D)) PUT.4.V)) ?X_C))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?X_D BOX.N))
			(!R4 (?X_D INANIMATE_OBJECT.N))
			(!R5 (?X_C SMALLER-THAN ?X_D))
			(!R6 (?X_C BIRD.N))
			(!R7 (?X_D SHOE.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (IN.P ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C (IN.P ?X_D))))
		)
		(:POSTCONDS
			(?P1 (?X_C (IN.P ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 0.9))
			(!N3 (!R4 NECESSARY-TO-DEGREE 0.9))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-40.PR ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_K SHOE.N))
			(!R2 (?X_K BOX.N))
			(!R3 (?X_N BIRD.N))
		)
		(:STEPS
			(?X_H (?X_B (FED.V ?X_N)))
			(?X_F (?X_N SURVIVE.V))
			(?X_D (?X_B (((ADV-A (IN.P ?X_A)) KEEP.V) ?X_N)))
			(?X_M (?X_B FIND.5.V ?X_N))
			(?X_J (?X_B (((ADV-A (IN.P ?X_K)) ((ADV-A (IN.P ?X_K)) PUT.4.V)) ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_D)))
			(!W3 (?X_F (BEFORE ?X_D)))
			(!W4 (?X_M (BEFORE ?X_J)))
		)
	)
	(
			"X_B fed a bird."
			"A bird survives."
			"X_B keeps a bird in X_A."
			"X_B find.184s a bird."
			"X_B put.180s a bird in a shoe box in a shoe box."
	)
)



(
	(EPI-SCHEMA ((?X_C MAKE.3.V
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-41.PR ?X_K (K (PLUR GROCERY.N))
	               (KE (?X_M ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N)))))
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
	   (?X_N MAKE.3.V
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
			"A man make.186s a wife of a man with grocerys dinner."
	)
)



(
	(EPI-SCHEMA ((?X_E TAKE.9.V ?X_F) ** ?X_G)
		(:ROLES
			(!R1 (?X_E BROTHER.N))
			(!R2 (?X_F INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_E = ?X_F)))
			(!R5 (?X_F HAT.N))
			(!R6 (?X_B HEAD.N))
			(!R7 (?X_B (PERTAIN-TO ?X_E)))
			(!R8 (?X_E (PERTAIN-TO ?X_C)))
			(!R9 (?X_C AGENT.N))
			(!R10 (?X_H (RIGHT-AFTER ?X_D)))
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
	(EPI-SCHEMA ((?X_E (((ADV-A (OFF.P ?X_A)) TAKE.10.V) ?X_F)) ** ?X_G)
		(:ROLES
			(!R1 (?X_E BROTHER.N))
			(!R2 (?X_F INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_E = ?X_F)))
			(!R5 (?X_F HAT.N))
			(!R6 (?X_A HEAD.N))
			(!R7 (?X_A (PERTAIN-TO ?X_E)))
			(!R8 (?X_B AGENT.N))
			(!R9 (?X_E (PERTAIN-TO ?X_B)))
			(!R10 (?X_G (RIGHT-AFTER ?X_C)))
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
	(EPI-SCHEMA ((?X_E TAKE.11.V ?X_F) ** ?X_G)
		(:ROLES
			(!R1 (?X_E BROTHER.N))
			(!R2 (?X_F INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_E = ?X_F)))
			(!R5 (?X_F HAT.N))
			(!R6 (?X_A HEAD.N))
			(!R7 (?X_A (PERTAIN-TO ?X_E)))
			(!R8 (?X_C AGENT.N))
			(!R9 (?X_E (PERTAIN-TO ?X_C)))
			(!R10 (?X_H (RIGHT-AFTER ?X_D)))
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
	(EPI-SCHEMA ((?X_G
	              (((ADV-A (IN.P ?X_I)) ((ADV-A (ON.P ?X_A)) PUT.5.V)) ?X_H))
	             ** ?X_J)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2 (?X_H INANIMATE_OBJECT.N))
			(!R3 (?X_I CONTAINER.N))
			(!R4 (?X_I INANIMATE_OBJECT.N))
			(!R5 (?X_H SMALLER-THAN ?X_I))
			(!R6 (?X_H HAT.N))
			(!R7 (?X_A (K HAT.N) RACK.N))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
			(!R9 (?X_B (SET-OF AGENT.N)))
			(!R10 (?X_E (PERTAIN-TO ?X_G)))
			(!R11 (?X_E BROTHER.N))
			(!R12 (?X_J (RIGHT-AFTER ?X_C)))
			(!R13 (?X_F (PERTAIN-TO ?X_E)))
			(!R14 (?X_F HEAD.N))
			(!R15 (?X_I FLOOR.N))
		)
		(:GOALS
			(?G1 (?X_G (WANT.V (THAT (?X_H (IN.P ?X_I))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_H (IN.P ?X_I))))
		)
		(:POSTCONDS
			(?P1 (?X_H (IN.P ?X_I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (SAME-TIME ?X_L)))
			(!W2 (?X_K (BEFORE ?X_L)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 0.9))
			(!N3 (!R4 NECESSARY-TO-DEGREE 0.9))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_G
	              (((ADV-A (IN.P ?X_I)) ((ADV-A (ON.P ?X_B)) PUT.6.V)) ?X_H))
	             ** ?X_J)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2 (?X_H INANIMATE_OBJECT.N))
			(!R3 (?X_I CONTAINER.N))
			(!R4 (?X_I INANIMATE_OBJECT.N))
			(!R5 (?X_H SMALLER-THAN ?X_I))
			(!R6 (?X_B (K HAT.N) RACK.N))
			(!R7 (?X_H HAT.N))
			(!R8 (?X_J (RIGHT-AFTER ?X_A)))
			(!R9 (?X_D BROTHER.N))
			(!R10 (?X_D (PERTAIN-TO ?X_G)))
			(!R11 (?X_B (PERTAIN-TO ?X_C)))
			(!R12 (?X_C (SET-OF AGENT.N)))
			(!R13 (?X_E (PERTAIN-TO ?X_D)))
			(!R14 (?X_E HEAD.N))
			(!R15 (?X_I FLOOR.N))
		)
		(:GOALS
			(?G1 (?X_G (WANT.V (THAT (?X_H (IN.P ?X_I))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_H (IN.P ?X_I))))
		)
		(:POSTCONDS
			(?P1 (?X_H (IN.P ?X_I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (SAME-TIME ?X_L)))
			(!W2 (?X_K (BEFORE ?X_L)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 0.9))
			(!N3 (!R4 NECESSARY-TO-DEGREE 0.9))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_G ((ADV-A (IN.P ?X_I)) PUT.7.V) ?X_H) ** ?X_J)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2 (?X_H INANIMATE_OBJECT.N))
			(!R3 (?X_I CONTAINER.N))
			(!R4 (?X_I INANIMATE_OBJECT.N))
			(!R5 (?X_H SMALLER-THAN ?X_I))
			(!R6 (?X_H HAT.N))
			(!R7 (?X_B (K HAT.N) RACK.N))
			(!R8 (?X_E BROTHER.N))
			(!R9 (?X_E (PERTAIN-TO ?X_G)))
			(!R10 (?X_B (PERTAIN-TO ?X_C)))
			(!R11 (?X_C (SET-OF AGENT.N)))
			(!R12 (?X_D HEAD.N))
			(!R13 (?X_D (PERTAIN-TO ?X_E)))
			(!R14 (?X_K (RIGHT-AFTER ?X_F)))
			(!R15 (?X_I FLOOR.N))
		)
		(:GOALS
			(?G1 (?X_G (WANT.V (THAT (?X_H (IN.P ?X_I))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_H (IN.P ?X_I))))
		)
		(:POSTCONDS
			(?P1 (?X_H (IN.P ?X_I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_L)))
			(!W2 (?X_K (SAME-TIME ?X_L)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 0.9))
			(!N3 (!R4 NECESSARY-TO-DEGREE 0.9))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-42.PR (TWO.D (PLUR DOG.N)))) ** ?E)
		(:STEPS
			(?X_C (?X_A (HAVE.V (TWO.D (PLUR DOG.N)))))
		)
	)
	(
			"X_A has two dogs."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (WITH.P ?X_B)) GO.6.V))))
	               ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B (PLUR FRIEND.N)))
			(!R6 (?X_B (PERTAIN-TO ?X_D)))
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
	(EPI-SCHEMA (((ADV-E (DURING (K YESTERDAY.N)))
	              (?X_C
	               (((ADV-A (FOR.P ?X_D))
	                 ((ADV-A (FROM.P ?L1))
	                  ((ADV-A (TO.P ?X_D)) ((ADV-A (TO.P ?X_D)) GO.7.V))))
	                ?X_D)))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (WITH.P ?X_A)) GO.8.V))))
	               ?L2))
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-43.PR (K FISHING.N)
	               (KA ((ADV-A (WITH.P ?X_M)) GO.V)) ?X_E ?X_H ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E LARGE.A))
			(!R2 (?X_E FISH.N))
			(!R3 (?X_H LOCAL.A))
			(!R4 (?X_H POND.N))
			(!R5 (?X_M (PLUR FRIEND.N)))
			(!R6 (?X_M (PERTAIN-TO ?X_N)))
			(!R7 (?X_O (RIGHT-AFTER ?X_P)))
		)
		(:STEPS
			(?X_L (?X_N (LOVE.V (K FISHING.N))))
			(?X_D (?X_N (CATCH.V ?X_E)))
			(?X_B (?X_N ((BACK.PRT ((ADV-A (FOR.P (KA (EAT.V ?X_E)))) BRING.V)) ?X_E)))
			(?X_J
	   (?X_N
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (WITH.P ?X_M)) GO.6.V))))
	     ?L2)))
			(?X_J
	   (?X_N
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (WITH.P ?X_M)) GO.8.V))))
	     ?L2)))
			(?X_O (?X_N (LOVE.V (KA ((ADV-A (WITH.P ?X_M)) GO.V)))))
			(?X_G
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_N
	     (((ADV-A (FOR.P ?X_H))
	       ((ADV-A (FROM.P ?L1))
	        ((ADV-A (TO.P ?X_H)) ((ADV-A (TO.P ?X_H)) GO.7.V))))
	      ?X_H))))
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
			"X_N brings a large fish back for eating a large fish."
			"X_N go.263s L2 for L2 from L1 to L2 with a friends of X_N."
			"X_N go.268s L2 for L2 from L1 to L2 with a friends of X_N."
			"X_N loves with a friends of X_N going."
			"X_N go.264s a local pond DURING yesterday for a local pond from L1 to a local pond to a local pond."
	)
)



(
	(EPI-SCHEMA ((?X_B FIND.6.V (KE (?X_C TURTLE.V))) ** ?X_F)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_C COUPLE.N))
			(!R4 (?X_C BABY.N))
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
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (IN.P ?X_D)) ((ADV-A (IN.P ?X_D)) PUT.8.V)) ?X_C))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?X_D BOX.N))
			(!R4 (?X_D INANIMATE_OBJECT.N))
			(!R5 (?X_C SMALLER-THAN ?X_D))
			(!R6 (?X_C (SO.ADV TINY.A)))
			(!R7 (?X_C BABY.N))
			(!R8 (?X_C COUPLE.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (IN.P ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C (IN.P ?X_D))))
		)
		(:POSTCONDS
			(?P1 (?X_C (IN.P ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 0.9))
			(!N3 (!R4 NECESSARY-TO-DEGREE 0.9))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-44.PR (KE (?X_L TURTLE.V)) ?X_L)) ** ?E)
		(:ROLES
			(!R1 (?X_C HOUR.N))
			(!R2 (?X_F BOX.N))
			(!R3 (?X_I AGENT.N))
			(!R4 (?X_L COUPLE.N))
			(!R5 (?X_L BABY.N))
			(!R6 (?X_L (SO.ADV TINY.A)))
		)
		(:STEPS
			(?X_B (?X_I (((ADV-A (FOR.P ?X_C)) KEEP.V) ?X_L)))
			(?X_H (?X_I FIND.6.V (KE (?X_L TURTLE.V))))
			(?X_K (?X_L TURTLE.V))
			(?X_E (?X_I (((ADV-A (IN.P ?X_F)) ((ADV-A (IN.P ?X_F)) PUT.8.V)) ?X_L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_E)))
			(!W2 (?X_K (BEFORE ?X_E)))
		)
	)
	(
			"A agent keeps a couple baby so tiny for a hour."
			"A agent find.281s a couple baby so tiny turtles."
			"A couple baby so tiny turtles."
			"A agent put.269s a couple baby so tiny in a box in a box."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P ?X_D))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?X_D))
	                  (OUT.ADV ((ADV-A (FOR.P ?X_D)) GO.9.V)))))
	               ?X_D))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D LOCATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D BALL.N))
			(!R6 (?X_D PASS.N))
			(!R7 (?X_B ARM.N))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (WITH.P ?T)) PLAY.4.V) (K FOOTBALL.N)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 ((K FOOTBALL.N) GAME.N))
			(!R5 (NOT ((K FOOTBALL.N) AGENT.N)))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B ARM.N))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-45.PR ?X_L (KA HEAL.V) ?X_I (K FOOTBALL.N)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_A (RIGHT-AFTER ?X_B)))
			(!R2 (?X_L ARM.N))
			(!R3 (?X_I PASS.N))
			(!R4 (?X_I BALL.N))
			(!R5 (?X_L (PERTAIN-TO ?X_M)))
		)
		(:STEPS
			(?X_F (?X_M (CATCH.V ?X_I)))
			(?X_D (MUST.AUX-S (?X_M (LET.V ?X_L (KA HEAL.V)))))
			(?X_A (MUST.AUX-S (?X_M (LET.V ?X_L (KA HEAL.V)))))
			(?X_K (?X_M ((ADV-A (WITH.P ?T)) PLAY.4.V) (K FOOTBALL.N)))
			(?X_H
	   (?X_M
	    (((ADV-A (FOR.P ?X_I))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?X_I)) (OUT.ADV ((ADV-A (FOR.P ?X_I)) GO.9.V)))))
	     ?X_I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_H)))
			(!W2 (?X_F BEFORE ?X_D))
			(!W3 (?X_D BEFORE ?X_A))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_C PLAY.5.V ?X_D) ** ?X_E)
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
	(EPI-SCHEMA ((?X_C ((DOWN.PRT WRITE.2.V) ?X_D)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?X_B (PERTAIN-TO ?X_C)))
			(!R4 (?X_B GUITAR.N))
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
	(EPI-SCHEMA ((?X_D (((ADV-A (WITH.P ?T)) (DOWN.PRT PLAY.6.V)) ?X_A)) ** ?X_E)
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
	(EPI-SCHEMA ((?X_D ((ADV-A (WITH.P ?T)) PLAY.7.V) ?X_A) ** ?X_E)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 (?X_A GAME.N))
			(!R5 (NOT (?X_A AGENT.N)))
			(!R6 (?X_A GUITAR.N))
			(!R7 (?X_A (PERTAIN-TO ?X_D)))
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
	(EPI-SCHEMA ((?X_D ((ADV-A (WITH.P ?T)) PLAY.8.V) ?X_A) ** ?X_E)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 (?X_A GAME.N))
			(!R5 (NOT (?X_A AGENT.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_D)))
			(!R7 (?X_A GUITAR.N))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-46.PR ?X_A ?X_E ?X_B ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_E (PRETTY.ADV GOOD.A)))
			(!R2 (?X_E SONG.N))
			(!R3 (?X_N GUITAR.N))
			(!R4 (?X_O MAN.N))
			(!R5 (?X_N (PERTAIN-TO ?X_O)))
			(!R6 (?X_P (RIGHT-AFTER ?X_Q)))
		)
		(:STEPS
			(E76.SK (?X_A THING.N))
			(?X_K (?X_O (FIND.V ?X_A)))
			(?X_G (?X_O (OFF.PRT ((ADV-A (OF.P ?X_B)) BUILD.V))))
			(?X_M (?X_O PLAY.5.V ?X_N))
			(?X_M (?X_O ((ADV-A (WITH.P ?T)) PLAY.8.V) ?X_N))
			(?X_P (?X_O ((ADV-A (WITH.P ?T)) PLAY.7.V) ?X_N))
			(?X_I (?X_O ((DOWN.PRT WRITE.2.V) ?X_B)))
			(?X_I (?X_O (((ADV-A (WITH.P ?T)) (DOWN.PRT PLAY.6.V)) ?X_B)))
			(?X_D (?X_O WRITE.1.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_P)))
			(!W2 (?X_M (BEFORE ?X_I)))
			(!W3 (?X_M (BEFORE ?X_D)))
			(!W4 (?X_P (BEFORE ?X_I)))
			(!W5 (?X_P (BEFORE ?X_D)))
			(!W6 (?X_I (BEFORE ?X_D)))
			(!W7 (E76.SK BEFORE ?X_K))
			(!W8 (?X_K BEFORE ?X_G))
		)
	)
	(
			"X_M catches a pass ball."
			"X_M lets a arm of X_M healing must."
			"X_M lets a arm of X_M healing must."
			"X_M play.1s football with T."
			"X_M go.3s a pass ball for a pass ball from L1 to a pass ball out for a pass ball."
	)
)



(
	(EPI-SCHEMA ((?X_B TAKE.12.V ?X_C) ** ?X_D)
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
	(EPI-SCHEMA ((?X_B GET.19.V ?X_C) ** ?X_D)
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
	(EPI-SCHEMA ((?X_C (((ADV-A (TO.P ?X_B)) TAKE.13.V) ?X_D)) ** ?X_E)
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
	(EPI-SCHEMA ((?X_B ((HOME.ADV ((ADV-A (WITH.P ?X_B)) TAKE.14.V)) ?X_C)) ** ?X_D)
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
			(!W6 (?X_D (AFTER ?X_E)))
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
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-47.PR ?X_B ?X_M
	               (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N))))) ?X_G ?X_E))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F FEMALE.A))
			(!R2 (?X_F AGENT.N))
			(!R3 (?X_G FLOWER.N))
			(!R4 (?X_G RED.A))
			(!R5 (?X_L FATHER.N))
			(!R6 (?X_M AGENT.N))
			(!R7 (?X_L (PERTAIN-TO ?X_M)))
		)
		(:STEPS
			(?X_K (?X_A (((ADV-A (TO.P ?X_M)) GIVE.V) ?X_B)))
			(?X_I (?X_L (GIVE.V ?X_M (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N))))))))
			(E133.SK (?X_M (KEEP.V ?X_G)))
			(E134.SK (?X_F (LIKE.V ?X_E)))
			(E135.SK (?X_D ((HOME.ADV ((ADV-A (WITH.P ?X_D)) TAKE.14.V)) ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K BEFORE ?X_I))
			(!W2 (?X_I BEFORE E133.SK))
			(!W3 (E133.SK BEFORE E134.SK))
			(!W4 (E134.SK BEFORE E135.SK))
		)
	)
	(
			"X_A is thing."
			"A man finds X_A."
			"A man builds off of X_B."
			"A man play.10s a guitar of a man."
			"A man play.20s a guitar of a man with T."
			"A man play.19s a guitar of a man with T."
			"A man write.13s X_B down."
			"A man play.18s X_B with T down."
			"A man write.11s a pretty good song."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2))
	                  ((ADV-A
	                    (ON.P (K (L X (AND (X TOP.N) (X (OF.P (THE.D BOAT.N))))))))
	                   CLIMB.2.V))))
	               ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B (PERTAIN-TO ?X_C)))
			(!R6 (?X_B BOAT.N))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (DOWN.P ?X_B)) FLOAT.1.V))))
	               ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B RIVER.N))
			(!R6 (?X_C BOAT.N))
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
	(EPI-SCHEMA ((?X_P (COMPOSITE-SCHEMA-48.PR ?L2)) ** ?E)
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
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (DOWN.P ?X_N)) FLOAT.1.V))))
	     ?L2)))
			(?X_G
	   (?X_P
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2))
	        ((ADV-A (ON.P (K (L X (AND (X TOP.N) (X (OF.P (THE.D BOAT.N))))))))
	         CLIMB.2.V))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_G)))
			(!W2 (?X_J BEFORE ?X_I))
			(!W3 (?X_I BEFORE ?X_E))
			(!W4 (?X_E BEFORE ?X_C))
		)
	)
	(
			"X_A gives X_B to a agent."
			"A father of a agent gives a agent two red one."
			"A agent keeps a flower red."
			"A female agent likes X_E."
			"X_D take.48s X_E home with X_D."
	)
)



(
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-49.PR ?X_M ?X_K (KA (UP.PRT CLEAN.V) ?X_M)))
	             ** ?E)
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
			"A boat of a man tips over."
			"A boat of a man tips over."
			"A man rescues."
			"A man rescues."
			"A man float.60s L2 for L2 from L1 to L2 down a river."
			"A man climb.58s L2 for L2 from L1 to L2 on top of."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P ?X_D))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?X_D)) (ALMOST.ADV (OVER.PRT RUN.7.V)))))
	               ?X_D))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D LOCATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D (PERTAIN-TO ?X_C)))
			(!R6 (?X_D FRIEND.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
			(!R8 (?X_B WAY.N))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-50.PR ?X_G ?X_K)) ** ?E)
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
	    (((ADV-A (FOR.P ?X_K))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?X_K)) (ALMOST.ADV (OVER.PRT RUN.7.V)))))
	     ?X_K)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I BEFORE ?X_F))
			(!W2 (?X_F BEFORE ?X_D))
			(!W3 (?X_D BEFORE ?X_B))
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
	(EPI-SCHEMA ((?X_B GET.20.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))) **
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-51.PR ?X_B ?X_M
	               (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))))
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
			(?X_D (?X_N GET.20.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L BEFORE ?X_J))
			(!W2 (?X_J BEFORE ?X_H))
			(!W3 (?X_H BEFORE ?X_F))
			(!W4 (?X_F BEFORE ?X_D))
		)
	)
	(
			"A agent is at work."
			"A agent uses a walking stacker."
			"A friend of a agent stands in a way of a agent."
			"A agent run.100s a friend of a agent for a friend of a agent from L1 to a friend of a agent almost over."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P ?X_D))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?X_D)) ((ADV-A (TO.P ?X_D)) GO.10.V))))
	               ?X_D))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D STUDIO.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_B WALL.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((MUST.AUX-S
	              (?X_D
	               (TAKE.15.V
	                (K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N))))))))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2
	   ((K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N))))) INANIMATE_OBJECT.N))
			(!R3 (?X_C STUDIO.N))
			(!R4 (NOT (?X_D = (K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N))))))))
			(!R5 (?X_B (PERTAIN-TO ?X_D)))
			(!R6 (?X_B WALL.N))
		)
		(:GOALS
			(?G1
	   (?X_D
	    (WANT.V
	     (THAT
	      (?X_D (HAVE.V (K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N)))))))))))
		)
		(:PRECONDS
			(?I1
	   (NOT (?X_D HAVE.V (K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N))))))))
			(?I2 (?X_D (AT.P ?X_C)))
			(?I3 ((K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N))))) (AT.P ?X_C)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V (K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N)))))))
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
	(EPI-SCHEMA ((?X_C TAKE.16.V (TWO.D (PLUR PICTURE.N))) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 ((TWO.D (PLUR PICTURE.N)) INANIMATE_OBJECT.N))
			(!R3 (?X_B STUDIO.N))
			(!R4 (NOT (?X_C = (TWO.D (PLUR PICTURE.N)))))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V (TWO.D (PLUR PICTURE.N))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V (TWO.D (PLUR PICTURE.N)))))
			(?I2 (?X_C (AT.P ?X_B)))
			(?I3 ((TWO.D (PLUR PICTURE.N)) (AT.P ?X_B)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V (TWO.D (PLUR PICTURE.N))))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (TO.P ?X_D)) GIVE.3.V) ?X_D ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?X_D AGENT.N))
			(!R4 (?X_E JACKET.N))
			(!R5 (?X_B (PERTAIN-TO ?X_D)))
			(!R6 (?X_B WALL.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D (HAVE.V ?X_E))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?X_E))
			(?I2 (NOT (?X_D HAVE.V ?X_E)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C HAVE.V ?X_E)))
			(?P2 (?X_D HAVE.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AT-ABOUT ?X_G)))
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
	(EPI-SCHEMA ((?X_B
	              ((LONGER.ADV
	                (MUCH.ADV
	                 ((ADV-A (FOR.P (KA ((ADV-A (OVER.P ?X_B)) GET.V))))
	                  TAKE.3.V)))
	               ?X_C))
	             ** ?X_D)
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
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (FOR.P (K BLIND.A)))
	               ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K BLIND.A))) GO.11.V)))
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
	               ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K BLIND.A))) GO.12.V)))
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
			(!W6 (?X_C (DURING ?X_E)))
			(!W7 (?X_D (CONSEC ?X_C)))
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
	(EPI-SCHEMA ((?X_B
	              (COMPOSITE-SCHEMA-52.PR ?X_J
	               (K ((ADV-A (FOR.P (K (PLUR YEAR.N)))) (FOR.P ?X_K))) ?X_B
	               (K BLIND.A)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J TIME.N))
			(!R2 (?X_J LONG.A))
			(!R3 (?X_K OLD.A))
			(!R4 (?X_K AGENT.N))
		)
		(:STEPS
			(?X_I (?X_B ?X_K (HAVE.V ?X_J)))
			(?X_G (?X_B (LOOK.V (K ((ADV-A (FOR.P (K (PLUR YEAR.N)))) (FOR.P ?X_K))))))
			(?X_C
	   (?X_K
	    ((ADV-A (FOR.P (K BLIND.A)))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K BLIND.A))) GO.11.V)))
	    (K BLIND.A)))
			(?X_C
	   (?X_K
	    ((ADV-A (FOR.P (K BLIND.A)))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K BLIND.A))) GO.12.V)))
	    (K BLIND.A)))
			(?X_E
	   (?X_A
	    ((LONGER.ADV
	      (MUCH.ADV
	       ((ADV-A (FOR.P (KA ((ADV-A (OVER.P ?X_A)) GET.V)))) TAKE.3.V)))
	     ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_I BEFORE ?X_G))
		)
	)
	(
			"A man pours a glass of water water."
			"A man looks in a glass of water water."
			"X_A is X_B."
			"A man pours a glass of water water out."
			"A man get.124s water in another glass."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?X_B))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_B)) FALL.2.V))))
	               ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_B LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_B = ?L2)))
			(!R5 (?X_B TREE.N))
			(!R6 (?X_C BRANCH.N))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (IN.P ?X_E)) PLANT.1.V) ?X_D) ** ?X_F)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?X_E CONTAINER.N))
			(!R4 (?X_E INANIMATE_OBJECT.N))
			(!R5 (?X_D SMALLER-THAN ?X_E))
			(!R6 (?X_D TREE.N))
			(!R7 (?X_E WINDOW.N))
			(!R8 (?X_E (OF.P (KE (?X_B HOUSE.N)))))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D (IN.P ?X_E))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D (IN.P ?X_E))))
		)
		(:POSTCONDS
			(?P1 (?X_D (IN.P ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 0.9))
			(!N3 (!R4 NECESSARY-TO-DEGREE 0.9))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-53.PR ?X_D ?L2 ?X_L)) ** ?E)
		(:ROLES
			(!R1 (?X_D (OF.P (KE (?X_C HOUSE.N)))))
			(!R2 (?X_D WINDOW.N))
			(!R3 (?X_G BRANCH.N))
			(!R4 (?X_L TREE.N))
			(!R5 (?X_M MAN.N))
		)
		(:STEPS
			(?X_I (?X_L ((ADV-A (FOR.P (KA (VERY.ADV TALL.A)))) GROW.V)))
			(?X_B (?X_G (BREAK.V ?X_D)))
			(?X_K (?X_M ((ADV-A (IN.P ?X_D)) PLANT.1.V) ?X_L))
			(?X_F
	   (?X_G
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?X_L))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (FROM.P ?X_L)) FALL.2.V))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_F)))
			(!W2 (?X_I BEFORE ?X_B))
		)
	)
	(
			"X_B has a time long."
			"X_B looks for years for a old agent."
			"A old agent go.145s blind for blind from L1 to blind."
			"A old agent go.147s blind for blind from L1 to blind."
			"X_A take.144s X_B longer much for over X_A getting."
	)
)



(
	(EPI-SCHEMA ((MUST.AUX-S (?X_D ((JUST.ADV EAT.1.V) (K (PLUR FOOD.N))))) **
	             ?X_E)
		(:ROLES
			(!R1 (?X_D SON.N))
			(!R2 ((K (PLUR FOOD.N)) FOOD.N))
			(!R3 (?X_E (IMPINGES-ON ?X_A)))
			(!R4 (?X_B AGENT.N))
			(!R5 (?X_D (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (NOT (?X_D HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_D HAVE.V (K (PLUR FOOD.N))))
			(?I2 (?X_D HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (HAVE.V (K (PLUR FOOD.N))))))
			(?P2 (NOT (?X_D HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_E))
			(!W2 (?I1 BEFORE ?X_E))
			(!W3 (?X_E CAUSE-OF ?P1))
			(!W4 (?X_F (AT-ABOUT ?X_H)))
			(!W5 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((MUST.AUX-S (?X_D ((JUST.ADV EAT.2.V) (K (PLUR FOOD.N))))) **
	             ?X_E)
		(:ROLES
			(!R1 (?X_D SON.N))
			(!R2 ((K (PLUR FOOD.N)) FOOD.N))
			(!R3 (?X_D (PERTAIN-TO ?X_A)))
			(!R4 (?X_A AGENT.N))
			(!R5 (?X_E (IMPINGES-ON ?X_B)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (NOT (?X_D HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_D HAVE.V (K (PLUR FOOD.N))))
			(?I2 (?X_D HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (HAVE.V (K (PLUR FOOD.N))))))
			(?P2 (NOT (?X_D HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_E))
			(!W2 (?I1 BEFORE ?X_E))
			(!W3 (?X_E CAUSE-OF ?P1))
			(!W4 (?X_F (AT-ABOUT ?X_H)))
			(!W5 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C FEED.1.V ?X_D (K (PLUR FOOD.N))) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D SON.N))
			(!R3 ((K (PLUR FOOD.N)) FOOD.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (NOT (?X_D = (K (PLUR FOOD.N)))))
			(!R6 (NOT (?X_C = (K (PLUR FOOD.N)))))
			(!R7 (?X_E (IMPINGES-ON ?X_A)))
			(!R8 (?X_D (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (NOT (?X_D HUNGRY.A))))))
			(?G2
	   (?X_C
	    (WANT.V (THAT (MUST.AUX-S (?X_D ((JUST.ADV EAT.V) (K (PLUR FOOD.N)))))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V (K (PLUR FOOD.N))))
			(?I2 (?X_D HUNGRY.A))
		)
		(:STEPS
			(?X_E (MUST.AUX-S (?X_D ((JUST.ADV EAT.V) (K (PLUR FOOD.N))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (HAVE.V (K (PLUR FOOD.N))))))
			(?P2 (NOT (?X_D HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E AFTER ?E))
			(!W2 (?X_F (AT-ABOUT ?X_H)))
			(!W3 (?X_G (BEFORE ?X_H)))
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
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-54.PR ?X_F
	               (K
	                (L X
	                 (AND (X (MORE.ADV (ON.P ?X_K))) (X THAN.P) (X (IN.P ?X_K)))))
	               (KE
	                (?X_K
	                 (GET.V
	                  (L X
	                   (AND (X (MORE.ADV (ON.P ?X_K))) (X THAN.P)
	                        (X (IN.P ?X_K)))))))
	               ?X_K (K (PLUR FOOD.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F (PLUR PEACH.N)))
			(!R2 (?X_H (IMPINGES-ON ?X_I)))
			(!R3 (?X_L AGENT.N))
			(!R4 ((K (PLUR FOOD.N)) FOOD.N))
			(!R5 (?X_K SON.N))
			(!R6 (?X_K (PERTAIN-TO ?X_L)))
			(!R7 (NOT (?X_L = ?X_K)))
			(!R8 (NOT (?X_K = (K (PLUR FOOD.N)))))
			(!R9 (NOT (?X_L = (K (PLUR FOOD.N)))))
		)
		(:STEPS
			(?X_E (?X_K (LOVE.V ?X_F)))
			(?X_C
	   (?X_K
	    (GET.V
	     (K (L X (AND (X (MORE.ADV (ON.P ?X_K))) (X THAN.P) (X (IN.P ?X_K))))))))
			(?X_J
	   (?X_L
	    (THINK.V
	     (KE
	      (?X_K
	       (GET.V
	        (L X (AND (X (MORE.ADV (ON.P ?X_K))) (X THAN.P) (X (IN.P ?X_K))))))))))
			(?E_1 (?X_L FEED.1.V ?X_K (K (PLUR FOOD.N))))
			(?X_H (MUST.AUX-S (?X_K ((JUST.ADV EAT.1.V) (K (PLUR FOOD.N))))))
			(?X_H (MUST.AUX-S (?X_K ((JUST.ADV EAT.2.V) (K (PLUR FOOD.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E_1 (BEFORE ?X_H)))
			(!W2 (?X_E BEFORE ?X_C))
			(!W3 (?X_C BEFORE ?X_J))
		)
	)
	(
			"A tree grows for very tall."
			"A branch breaks a of X_C house window."
			"A man plant.177s a tree in a of X_C house window."
			"A branch fall.175s L2 for L2 from a tree to L2 from a tree."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-55.PR ?X_A)) ** ?E)
		(:ROLES
			(!R1 (?X_A BIRD.N))
			(!R2 (?X_A BABY.N))
		)
		(:STEPS
			(?X_C (NOT (?X_A ((CAN.AUX HAVE.V) ?X_A))))
		)
	)
	(
			"A son of a agent loves a peachs."
			"A son of a agent gets on than in."
			"A agent thinks a son of a agent gets on than in."
			"A agent feed.183s a son of a agent foods."
			"A son of a agent eat.179s foods must just."
			"A son of a agent eat.180s foods must just."
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
	              ((ADV-A (ON.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_D)))))))
	               ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_D)))))))
	                ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_D)))))))
	                 SIT.6.V))))
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
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (WITH.P ?X_D)) ((ADV-A (WITH.P ?X_D)) PLAY.9.V)) ?G))
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
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (WITH.P ?X_D)) ((ADV-A (WITH.P ?X_D)) PLAY.10.V)) ?G))
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
	(EPI-SCHEMA ((?X_R (COMPOSITE-SCHEMA-56.PR ?X_Q ?X_M ?X_A ?X_R (KA STOP.V) ?G)) **
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
	    ((ADV-A (ON.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_R)))))))
	     ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_R)))))))
	      ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_R))))))) SIT.6.V)))))
			(?X_O (?X_R (((ADV-A (WITH.P ?X_M)) ((ADV-A (WITH.P ?X_M)) PLAY.9.V)) ?G)))
			(?X_O (?X_R (((ADV-A (WITH.P ?X_M)) ((ADV-A (WITH.P ?X_M)) PLAY.10.V)) ?G)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_O)))
			(!W2 (?X_J (BEFORE ?X_O)))
			(!W3 (?X_L BEFORE ?X_D))
			(!W4 (?X_D BEFORE ?E_1))
		)
	)
	(
			"A bird baby has a bird baby not can."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (FOR.P (K (OVER.PRT (TO.P ?X_D)))))
	               ((ADV-A (FROM.P ?L1))
	                ((ADV-A (TO.P (K (OVER.PRT (TO.P ?X_D))))) RUN.8.V)))
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
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-57.PR (KE (?X_K HOUSE.N)) (K HOME.N)
	               (K (OVER.PRT (TO.P ?X_L)))))
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
	      ((ADV-A (TO.P (K (OVER.PRT (TO.P ?X_L))))) RUN.8.V)))
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
			"A agent likes a girl."
			"A agent is with."
			"A agent stops X_A."
			"A girl tell information.198s a agent stopping."
			"A girl sit.195s on front of in front of in front of."
			"A agent play.196s G with a hair of a female agent with a hair of a female agent."
	)
)



(
	(EPI-SCHEMA ((?X_D (((ADV-A (WITH.P ?X_B)) PLAY.11.V) ?X_E)) ** ?X_H)
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
	(EPI-SCHEMA ((?X_D (((ADV-A (WITH.P ?X_B)) PLAY.12.V) ?X_E)) ** ?X_F)
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (INTO.P ?X_A)) WALK.3.V))))
	               ?L2))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (INTO.P ?X_B)) WALK.4.V))))
	               ?L2))
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
	(EPI-SCHEMA ((?X_D
	              (((ADV-A (WITH.P ?X_C)) ((ADV-A (WITH.P ?X_C)) PLAY.13.V)) ?G))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-58.PR ?X_N ?X_A ?L2 ?G)) ** ?E)
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
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (INTO.P ?X_L)) WALK.3.V))))
	     ?L2)))
			(?X_K
	   (?X_M
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (INTO.P ?X_L)) WALK.4.V))))
	     ?L2)))
			(?X_I (?X_A (BE.V ?X_N)))
			(?X_E (?X_M (((ADV-A (WITH.P ?X_N)) PLAY.11.V) ?X_A)))
			(?X_E (?X_M (((ADV-A (WITH.P ?X_N)) PLAY.12.V) ?X_A)))
			(?X_E (?X_M (((ADV-A (WITH.P ?X_N)) ((ADV-A (WITH.P ?X_N)) PLAY.13.V)) ?G)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_E)))
			(!W3 (?X_I (BEFORE ?X_E)))
			(!W4 (?X_G BEFORE ?X_C))
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
	(EPI-SCHEMA ((?X_C FIND.7.V ?X_D) ** ?X_H)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_D GREAT.A))
			(!R4 (?X_D SONG.N))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L)))
			(?I2 (?X_D (AT.P ?L)))
			(?X_G (?X_C ((ADV-A (FOR.P ?X_D)) ((ADV-A (ON.P ?X_B)) SEARCH.V))))
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
			(?X_G (?X_C ((ADV-A (FOR.P ?X_D)) ((ADV-A (ON.P ?X_B)) SEARCH.V))))
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
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-59.PR (ALL.D DAY.N) (KA (BUY.V ?X_E)) ?X_L))
	             ** ?E)
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
			(?X_K (?X_B FIND.7.V ?X_L))
			(?X_K (?X_B FIND.8.V ?X_L))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_K)))
			(!W2 (?X_I BEFORE ?X_G))
			(!W3 (?X_G BEFORE ?X_D))
		)
	)
	(
			"A cat swats a ball on a floor around."
			"A cat likes a ball on a floor."
			"A cat walk.25s L2 for L2 from L1 to L2 into a living room."
			"A cat walk.26s L2 for L2 from L1 to L2 into a living room."
			"X_A is a ball on a floor."
			"A cat play.30s X_A with a ball on a floor."
			"A cat play.32s X_A with a ball on a floor."
			"A cat play.35s G with a ball on a floor with a ball on a floor."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (FOR.P (K (AWAY.ADV (FROM.P ?X_C)))))
	               ((ADV-A (FROM.P ?L1))
	                ((ADV-A (TO.P (K (AWAY.ADV (FROM.P ?X_C))))) ROLL.1.V)))
	              (K (AWAY.ADV (FROM.P ?X_C))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (AWAY.ADV (FROM.P ?X_C))) LOCATION.N))
			(!R4 (NOT (?L1 = (K (AWAY.ADV (FROM.P ?X_C))))))
			(!R5 (?X_B HOOP.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (K (AWAY.ADV (FROM.P ?X_C))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K (AWAY.ADV (FROM.P ?X_C)))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K (AWAY.ADV (FROM.P ?X_C))))))
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
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-60.PR ?X_A (K (AWAY.ADV (FROM.P ?X_B))))) **
	             ?E)
		(:ROLES
			(!R1 (?X_E HOOP.N))
		)
		(:STEPS
			(?X_G (NOT (?X_B ((CAN.AUX CATCH.V) ?X_A))))
			(?X_D
	   (?X_E
	    ((ADV-A (FOR.P (K (AWAY.ADV (FROM.P ?X_B)))))
	     ((ADV-A (FROM.P ?L1))
	      ((ADV-A (TO.P (K (AWAY.ADV (FROM.P ?X_B))))) ROLL.1.V)))
	    (K (AWAY.ADV (FROM.P ?X_B)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G BEFORE ?X_D))
		)
	)
	(
			"X_B searches on X_A."
			"X_B listens all day to a great song."
			"X_B loves a great song."
			"X_B wants buying a album."
			"X_B find.43s a great song."
			"X_B find.44s a great song."
	)
)



(
	(EPI-SCHEMA ((?X_D ((JUST.ADV GET.21.V) ?X_E)) ** ?X_F)
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?X_C))
	                 ((ADV-A (TO.P ?L2)) (AWAY.PRT RUN.1.V))))
	               ?L2))
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
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (WITH.P ?X_D)) ((ADV-A (WITH.P ?X_D)) PLAY.14.V)) ?G))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E CAT.N))
			(!R2 (?X_D TOY.N))
			(!R3 (?X_D INANIMATE_OBJECT.N))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_D EDGE.N))
			(!R7 (?X_B AGENT.N))
			(!R8 (?X_E (PERTAIN-TO ?X_B)))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-61.PR ?X_L ?L2 ?G)) ** ?E)
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
			(?X_K (?X_N ((JUST.ADV GET.21.V) ?X_L)))
			(?X_H (?X_M (((ADV-A (WITH.P ?X_I)) ((ADV-A (WITH.P ?X_I)) PLAY.14.V)) ?G)))
			(?X_O (?X_M ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_I)) PLAY.V)))) START.V)))
			(?X_B
	   (?X_M
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?X_I)) ((ADV-A (TO.P ?L2)) (AWAY.PRT RUN.1.V))))
	     ?L2)))
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
			"X_B catches X_A not can."
			"A hoop roll.74s away from X_B for away from X_B from L1 to away from X_B."
	)
)



(
	(EPI-SCHEMA ((?X_C ((OUT.PRT GET.12.V) (KA ((ADV-A (ON.P ?X_D)) CHECK.V)))) **
	             ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 ((KA ((ADV-A (ON.P ?X_D)) CHECK.V)) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = (KA ((ADV-A (ON.P ?X_D)) CHECK.V)))))
			(!R5 (?X_D DEAD.A))
			(!R6 (?X_D ROAD.N))
			(!R7 (?X_D RABBIT.N))
			(!R8 (?X_C (HOME.ADV DRIVE.V)))
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
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-62.PR ?X_G (K HOME.N)
	               (KA ((ADV-A (ON.P ?X_H)) CHECK.V))))
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
			(?X_D (?X_I ((OUT.PRT GET.12.V) (KA ((ADV-A (ON.P ?X_H)) CHECK.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F BEFORE ?X_B))
			(!W2 (?X_B BEFORE ?X_D))
		)
	)
	(
			"A wife of X_F yells at a cat of a agent."
			"A agent get.80s a new rug very plush just."
			"A cat of a agent play.88s G with a edge with a edge."
			"A cat of a agent starts for with a edge playing."
			"A cat of a agent run.86s L2 for L2 from a edge to L2 away."
	)
)



(
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-63.PR ?X_D (KA (HAVE.V ?X_H)))) ** ?E)
		(:ROLES
			(!R1 (?X_A (PLUR ALMOND.N)))
			(!R2 (?X_A (SO.ADV GOOD.A)))
			(!R3 (?X_D LARGE.A))
			(!R4 (?X_D BOX.N))
			(!R5 (?X_G AGENT.N))
			(!R6 (?X_H MORE.A))
		)
		(:STEPS
			(?X_C
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_G ((ADV-A (FOR.P (KA (BUY.V ?X_A)))) GO.V))))
			(?X_F (?X_G (BUY.V ?X_D)))
			(?X_J (?X_G (WANT.V (KA (HAVE.V ?X_H)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_F)))
			(!W2 (?X_C (BEFORE ?X_J)))
			(!W3 (?X_F (BEFORE ?X_J)))
		)
	)
	(
			"A home drive hits a rabbit on a road dead rabbit."
			"A home drive drives home."
			"A home drive get.92s on a road dead rabbit checking out."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-64.PR (K (PLUR NUT.N)) (K (PLUR CRUMB.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C LITTLE.A))
			(!R2 (?X_C BIRD.N))
		)
		(:STEPS
			(?X_B (NOT (?X_C ((CAN.AUX EAT.V) (K (PLUR NUT.N))))))
			(?X_E (?X_C (LIKE.V (K (PLUR CRUMB.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_E)))
		)
	)
	(
			"A agent goes DURING yesterday for buying a almonds so good."
			"A agent buys a large box."
			"A agent wants having a more."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (TO.P ?X_C)) GIVE.4.V) ?X_C (K (PLUR TIP.N))) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 ((K (PLUR TIP.N)) INANIMATE_OBJECT.N))
			(!R3 (?X_C AGENT.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (HAVE.V (K (PLUR TIP.N))))))))
		)
		(:PRECONDS
			(?I1 (?X_B HAVE.V (K (PLUR TIP.N))))
			(?I2 (NOT (?X_C HAVE.V (K (PLUR TIP.N)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B HAVE.V (K (PLUR TIP.N)))))
			(?P2 (?X_C HAVE.V (K (PLUR TIP.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-65.PR (K (TO.P (?X_B SING.V))) ?X_B
	               (K (PLUR TIP.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G MAN.N))
			(!R2 (?X_J FEW.A))
			(!R3 (?X_J (PLUR PERSON.N)))
			(!R4 (?X_M AGENT.N))
		)
		(:STEPS
			(?X_L (?X_M ((ADV-A (IN.P ?X_A)) BE.V)))
			(?X_I (?X_M ((ADV-A (WITH.P ?X_J)) SING.V)))
			(?X_F (?X_G (LISTEN.V (K (TO.P (?X_B SING.V))))))
			(?X_D (?X_G ((ADV-A (TO.P ?X_B)) GIVE.4.V) ?X_B (K (PLUR TIP.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_I)))
			(!W2 (?X_L (BEFORE ?X_F)))
			(!W3 (?X_I (BEFORE ?X_F)))
		)
	)
	(
			"A little bird eats nuts not can."
			"A little bird likes crumbs."
	)
)



(
	(EPI-SCHEMA ((?X_C (((ADV-A (WITH.P ?X_B)) EAT.3.V) ?F)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?F FOOD.N))
			(!R3 (?X_B (PLUR FRIEND.N)))
			(!R4 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (NOT (?X_C HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?F))
			(?I2 (?X_C HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (HAVE.V ?F))))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (WITH.P ?X_A)) EAT.4.V) ?F)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?F FOOD.N))
			(!R3 (?X_A (PERTAIN-TO ?X_C)))
			(!R4 (?X_A (PLUR FRIEND.N)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (NOT (?X_C HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?F))
			(?I2 (?X_C HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (HAVE.V ?F))))
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
	(EPI-SCHEMA ((?X_C FEED.2.V ?X_C ?F) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?F FOOD.N))
			(!R3 (NOT (?X_C = ?X_C)))
			(!R4 (NOT (?X_C = ?F)))
			(!R5 (?X_B (PLUR FRIEND.N)))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (NOT (?X_C HUNGRY.A))))))
			(?G2 (?X_C (WANT.V (THAT (?X_C (((ADV-A (WITH.P ?X_B)) EAT.V) ?F))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?F))
			(?I2 (?X_C HUNGRY.A))
		)
		(:STEPS
			(?X_D (?X_C (((ADV-A (WITH.P ?X_B)) EAT.V) ?F)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (HAVE.V ?F))))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-66.PR (K GAS.N) ?X_J ?F)) ** ?E)
		(:ROLES
			(!R1 (?X_F (SET-OF AGENT.N)))
			(!R2 (?X_I (PLUR FRIEND.N)))
			(!R3 (?X_I (PERTAIN-TO ?X_J)))
			(!R4 (?X_J AGENT.N))
			(!R5 (NOT (?X_J = ?X_J)))
			(!R6 (NOT (?X_J = ?F)))
			(!R7 (?F FOOD.N))
		)
		(:STEPS
			(?X_E (?X_F ((ADV-A (ABOUT.P (KA (GO.V (TO.P (?X_A HOUSE.N)))))) BE.V)))
			(E312.SK (?X_J (OF.P (K GAS.N))))
			(E311.SK (?X_J OUT.P))
			(?X_C (MUST.AUX-S (?X_I ((ADV-A (ON.P ?X_J)) WAIT.V))))
			(?E_1 (?X_J FEED.2.V ?X_J ?F))
			(?X_H (?X_J (((ADV-A (WITH.P ?X_I)) EAT.3.V) ?F)))
			(?X_H (?X_J (((ADV-A (WITH.P ?X_I)) EAT.4.V) ?F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E_1 (BEFORE ?X_H)))
			(!W2 (?X_E BEFORE E312.SK))
			(!W3 (E312.SK BEFORE E311.SK))
			(!W4 (E311.SK BEFORE ?X_C))
		)
	)
	(
			"A agent is in X_A."
			"A agent sings with a few persons."
			"A man listens to X_B sings."
			"A man give.139s X_B tips to X_B."
	)
)



(
	(EPI-SCHEMA ((?X_F
	              (COMPOSITE-SCHEMA-67.PR (KA (LIKE.V ?X_A)) (KA VOMIT.V)
	               (KA (AGAIN.ADV DRINK.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_A WINE.N))
			(!R2 (?X_F AGENT.N))
		)
		(:STEPS
			(?X_C (?X_F (WANT.V (KA (LIKE.V ?X_A)))))
			(?X_E (?X_F (WANT.V (KA VOMIT.V))))
			(?X_H (?X_F ((NEVER.ADV WANT.V) (KA (AGAIN.ADV DRINK.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_H)))
			(!W3 (?X_E (BEFORE ?X_H)))
		)
	)
	(
			"A agent is about going to X_A house."
			"A agent is of."
			"A agent is out."
			"A friends of a agent waits must on a agent."
			"A agent feed.153s a agent a food."
			"A agent eat.149s a food with a friends of a agent."
			"A agent eat.150s a food with a friends of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_B TAKE.17.V (SET-OF ?X_C ?X_D)) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((SET-OF ?X_C ?X_D) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (SET-OF ?X_C ?X_D))))
			(!R5 (?X_D HOOK.N))
			(!R6 (?X_C LONG.A))
			(!R7 (?X_C ROD.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V (SET-OF ?X_C ?X_D)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (SET-OF ?X_C ?X_D))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((SET-OF ?X_C ?X_D) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (SET-OF ?X_C ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AFTER ?X_F)))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-68.PR ?X_G (SET-OF ?X_C ?X_B))) ** ?E)
		(:ROLES
			(!R1 (?X_B HOOK.N))
			(!R2 (?X_C ROD.N))
			(!R3 (?X_C LONG.A))
			(!R4 (?X_D AGENT.N))
			(!R5 (?X_E (RIGHT-AFTER ?X_F)))
			(!R6 (?X_G POND.N))
			(!R7 (?X_G FISH.N))
			(!R8 (?X_G (PERTAIN-TO ?X_H)))
		)
		(:STEPS
			(?X_E (?X_A ((FISH.ADV IN.P) ?X_G)))
			(E354.SK (?X_D TAKE.17.V (SET-OF ?X_C ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E BEFORE E354.SK))
		)
	)
	(
			"A agent wants liking a wine."
			"A agent wants vomiting."
			"A agent wants again drink never."
	)
)



(
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-69.PR
	               (K (L X (AND (X (VERY.ADV FEW.A)) (X (PLUR FAN.N)))))
	               (KA (HOLD.V ?X_I))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H BAND.N))
			(!R2 (?X_G (PERTAIN-TO ?X_H)))
			(!R3 (?X_I SHOW.N))
		)
		(:STEPS
			(?X_D (?X_A ((ADV-A (IN.P ?X_H)) BE.V)))
			(?X_F (?X_H (HAVE.V (K (L X (AND (X (VERY.ADV FEW.A)) (X (PLUR FAN.N))))))))
			(?X_K (?X_H (TRY.V (KA (HOLD.V ?X_I)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_K)))
			(!W3 (?X_F (BEFORE ?X_K)))
		)
	)
	(
			"X_A is fish in."
			"A agent take.171s a rod long and a hook."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-70.PR (K GLUE.N) ?X_F ?X_I)) ** ?E)
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
			"X_A is in a band."
			"A band has few fan."
			"A band tries holding a show."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (WITH.P ?T)) ((ADV-A (WITH.P ?X_B)) PLAY.15.V)) ?G))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-71.PR ?X_G ?X_A ?G)) ** ?E)
		(:ROLES
			(!R1 (?X_D MOUSE.N))
			(!R2 (?X_G MOUSE.N))
			(!R3 (?X_J OLD.A))
			(!R4 (?X_J CAT.N))
			(!R5 (?X_J (HAS.V ?X_H)))
			(!R6 (?X_I (PERTAIN-TO ?X_J)))
			(!R7 (?X_I ?X_J (PLUR KITTEN.N)))
		)
		(:STEPS
			(?X_F (?X_J ((CAN.AUX CATCH.V) ?X_G)))
			(?X_B (?X_J (((ADV-A (TO.P ?X_I)) GIVE.V) ?X_A)))
			(?X_C (?X_J (((ADV-A (TO.P ?X_I)) GIVE.V) ?X_A)))
			(E56.SK (?X_D (((ADV-A (WITH.P ?T)) ((ADV-A (WITH.P ?X_D)) PLAY.15.V)) ?G)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_B)))
			(!W2 (?X_F (BEFORE ?X_C)))
			(!W3 (?X_B (BEFORE ?X_C)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_C TAKE.18.V ?X_D) ** ?X_E)
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
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-72.PR (K COLD.A) (KE ((K SOAP.N) (IN.P ?X_O)))
	               ?X_O ?X_N))
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
			(?X_H (?X_P ((STILL.ADV HAVE.V) (KE ((K SOAP.N) (IN.P ?X_O))))))
			(?X_E (?X_P ((STILL.ADV HAVE.V) (KE ((K SOAP.N) (IN.P ?X_O))))))
			(?X_C (?X_P ((QUICKLY.ADV WASH.V) ?X_O)))
			(?X_B (?X_P ((QUICKLY.ADV WASH.V) ?X_O)))
			(?X_M (?X_P TAKE.18.V ?X_N))
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
			"A boy finds glue."
			"A boy pours glue out."
			"Glue covers a carpet."
			"Glue dries a hour in."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.22.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_B (GET.22.V (K (SO.ADV BIG.A)))))
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-73.PR (K SMASH.N) ?X_E)) ** ?E)
		(:ROLES
			(!R1 (?X_E (K SMASH.N) CAKE.N))
			(!R2 (?X_F (GET.V (K (SO.ADV BIG.A)))))
			(!R3 (?X_F AGENT.N))
			(!R4 (?X_E (FOR.P ?X_F)))
		)
		(:STEPS
			(?X_B (?X_F (LOVE.V (K SMASH.N))))
			(?X_D (?X_F GET.22.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B BEFORE ?X_D))
		)
	)
	(
			"A old cat has X_H catches a mouse can."
			"A old cat has X_H gives X_A to a of a old cat has X_H."
			"A old cat has X_H gives X_A to a of a old cat has X_H."
			"A mouse play.17s G with T with a mouse."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FOR.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_D))))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_D))))
	                  ((ADV-A (FOR.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_D))))
	                   GO.13.V))))
	               (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_D))))
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
	(EPI-SCHEMA ((?X_B
	              (COMPOSITE-SCHEMA-74.PR ?X_A ?X_I
	               (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F DAY.N))
			(!R2 (?X_F FUN.N))
			(!R3 (?X_F VERY.A))
			(!R4 (?X_I LOT.N))
			(!R5 (?X_I (OF.P (K (PLUR ANIMAL.N)))))
			(!R6 (?X_N FARM.N))
			(!R7 (?X_O AGENT.N))
		)
		(:STEPS
			(?X_K (?X_B (BE.V ?X_A)))
			(?X_H (?X_N (HAVE.V ?X_I)))
			(?X_E ((ADV-E (DURING ?X_F)) (?X_B BE.V)))
			(?X_M
	   (?X_O
	    (((ADV-A (FOR.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_N))))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_N))))
	        ((ADV-A (FOR.P (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_N)))) GO.13.V))))
	     (KA (((ADV-A (ON.P ?X_C)) VISIT.V) ?X_N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K BEFORE ?X_H))
			(!W2 (?X_H BEFORE ?X_E))
			(!W3 (?X_E BEFORE ?X_M))
		)
	)
	(
			"A hot water goes cold."
			"A man has soap in a hair of a man still."
			"A man has soap in a hair of a man still."
			"A man washes a hair of a man quickly."
			"A man washes a hair of a man quickly."
			"A man take.28s a shower."
	)
)



(
	(EPI-SCHEMA ((?X_F
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (UNDER.P ?X_C)) RUN.9.V))))
	               ?L2))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_F AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C BED.N))
			(!R6 (?X_C (PERTAIN-TO ?X_A)))
			(!R7 (?X_A FEMALE.A))
			(!R8 (?X_A AGENT.N))
			(!R9 (?X_G (RIGHT-AFTER ?X_B)))
			(!R10 (?X_D (PERTAIN-TO ?X_C)))
			(!R11 (?X_D FOOT.N))
		)
		(:GOALS
			(?G1 (?X_F (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_F (AT.P ?L1)))
			(?I2 (NOT (?X_F (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_F (AT.P ?L1))))
			(?P2 (?X_F (AT.P ?L2)))
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
	(EPI-SCHEMA ((?X_F
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (UNDER.P ?X_C)) RUN.10.V))))
	               ?L2))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_F AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C BED.N))
			(!R6 (?X_G (RIGHT-AFTER ?X_A)))
			(!R7 (?X_B FOOT.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
			(!R9 (?X_C (PERTAIN-TO ?X_D)))
			(!R10 (?X_D FEMALE.A))
			(!R11 (?X_D AGENT.N))
		)
		(:GOALS
			(?G1 (?X_F (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_F (AT.P ?L1)))
			(?I2 (NOT (?X_F (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_F (AT.P ?L1))))
			(?P2 (?X_F (AT.P ?L2)))
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
	(EPI-SCHEMA ((?X_F
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (UNDER.P ?X_B)) RUN.11.V))))
	               ?L2))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_F AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B BED.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A FOOT.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
			(!R9 (?X_C FEMALE.A))
			(!R10 (?X_C AGENT.N))
			(!R11 (?X_G (RIGHT-AFTER ?X_D)))
		)
		(:GOALS
			(?G1 (?X_F (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_F (AT.P ?L1)))
			(?I2 (NOT (?X_F (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_F (AT.P ?L1))))
			(?P2 (?X_F (AT.P ?L2)))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-75.PR ?X_A ?X_G ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_G BED.N))
			(!R2 (?X_F FOOT.N))
			(!R3 (?X_F (PERTAIN-TO ?X_G)))
			(!R4 (?X_H FEMALE.A))
			(!R5 (?X_H AGENT.N))
			(!R6 (?X_G (PERTAIN-TO ?X_H)))
			(!R7 (?X_I (RIGHT-AFTER ?X_J)))
		)
		(:STEPS
			(?X_E (?X_G ((AWAY.ADV SWAT.V) ?X_A)))
			(?X_C (?X_A (UNDER.P ?X_G)))
			(?X_I
	   (?X_A
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (UNDER.P ?X_G)) RUN.9.V))))
	     ?L2)))
			(?X_I
	   (?X_A
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (UNDER.P ?X_G)) RUN.10.V))))
	     ?L2)))
			(?X_I
	   (?X_A
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (UNDER.P ?X_G)) RUN.11.V))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_I)))
		)
	)
	(
			"A get so big agent loves smash."
			"A get so big agent get.40s a for a get so big agent."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?X_B))
	                 ((ADV-A (TO.P ?L2)) (INSTEAD.ADV (HOME.ADV GO.14.V)))))
	               ?L2))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-76.PR ?L2)) ** ?E)
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
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?X_F))
	       ((ADV-A (TO.P ?L2)) (INSTEAD.ADV (HOME.ADV GO.14.V)))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H BEFORE ?X_E))
			(!W2 (?X_E BEFORE ?X_B))
		)
	)
	(
			"X_B is X_A."
			"A farm has a lot of animals."
			"X_B is DURING a day fun very."
			"A agent go.51s on X_C visiting a farm for on X_C visiting a farm from L1 to on X_C visiting a farm for on X_C visiting a farm."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?X_D))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (THROUGH.P ?X_B)) RUN.12.V))))
	               ?L2))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_D END.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_D = ?L2)))
			(!R5 (?X_B PARK.N))
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
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (FOR.P ?X_F))
	                ((ADV-A (FROM.P ?X_D))
	                 ((ADV-A (TO.P ?X_F)) ((ADV-A (IN.P ?X_A)) SWIM.1.V))))
	               ?X_F))
	             ** ?X_H)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_D END.N))
			(!R3 (?X_F PARK.N))
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
			(!W6 (?X_G (CONSEC ?X_H)))
			(!W7 (?X_G (DURING ?X_I)))
			(!W8 (?X_H (DURING ?X_I)))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?X_D))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (THROUGH.P ?X_A)) RUN.13.V))))
	               ?L2))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_D END.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_D = ?L2)))
			(!R5 (?X_A PARK.N))
			(!R6 (?X_C DOG.N))
			(!R7 (?X_C (PERTAIN-TO ?X_E)))
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
	(EPI-SCHEMA ((?X_R
	              (COMPOSITE-SCHEMA-77.PR (KA ((ADV-A (WITH.P ?X_Q)) PLAY.V))
	               (K CATCH.N)
	               (K (L X (AND (X TO.P) (X ((ADV-A (IN.P ?X_G)) SWIM.V))))) ?X_P
	               ?L2))
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
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?X_U))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (THROUGH.P ?X_P)) RUN.12.V))))
	     ?L2)))
			(?X_O
	   (?X_R
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?X_U))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (THROUGH.P ?X_P)) RUN.13.V))))
	     ?L2)))
			(?X_C (?X_R TO.P))
			(?X_D
	   (?X_R
	    (((ADV-A (FOR.P ?X_P))
	      ((ADV-A (FROM.P ?X_U))
	       ((ADV-A (TO.P ?X_P)) ((ADV-A (IN.P ?X_G)) SWIM.1.V))))
	     ?X_P)))
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
			"A bed of a female agent swats X_A away."
			"X_A is under."
			"X_A run.82s L2 for L2 from L1 to L2 under a bed of a female agent."
			"X_A run.83s L2 for L2 from L1 to L2 under a bed of a female agent."
			"X_A run.84s L2 for L2 from L1 to L2 under a bed of a female agent."
	)
)



(
	(EPI-SCHEMA (((K SUSIE.N) (COMPOSITE-SCHEMA-78.PR ?X_C)) ** ?E)
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
			"A line is long too far."
			"A line is around a corner."
			"A agent go.105s L2 for L2 from a corner to L2 instead home."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-79.PR (KA ((ADV-A (ON.P ?X_E)) RIDE.V))
	               (KA ((ADV-A (IN.P ?X_H)) PLAY.V))))
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
			"X_R plays with a dog of X_R."
			"X_R loves with a dog of X_R playing."
			"X_A plays catch."
			"X_R loves to swimming."
			"X_R run.112s L2 for L2 from a end to L2 through a park."
			"X_R run.116s L2 for L2 from a end to L2 through a park."
			"X_R is to."
			"X_R swim.114s a park for a park from a end to a park in a lake."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P (K OUTSIDE.N)))
	                 ((ADV-A (TO.P ?L2))
	                  (IN.PRT ((ADV-A (FROM.P (K OUTSIDE.N))) COME.5.V)))))
	               ?L2))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E SON.N))
			(!R2 ((K OUTSIDE.N) LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT ((K OUTSIDE.N) = ?L2)))
			(!R5 (?X_B CHILD.N))
			(!R6 (?X_B LITTLE.A))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P (K OUTSIDE.N)))
	                 ((ADV-A (TO.P ?L2))
	                  (IN.PRT ((ADV-A (FROM.P (K OUTSIDE.N))) COME.6.V)))))
	               ?L2))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E SON.N))
			(!R2 ((K OUTSIDE.N) LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT ((K OUTSIDE.N) = ?L2)))
			(!R5 (?X_B (PERTAIN-TO ?X_E)))
			(!R6 (?X_B FRIEND.N))
			(!R7 (?X_E (PERTAIN-TO ?X_C)))
			(!R8 (?X_C AGENT.N))
			(!R9 (?X_D LITTLE.A))
			(!R10 (?X_E (IS.V ?X_D)))
			(!R11 (?X_D CHILD.N))
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
	              (((ADV-A (FOR.P (KA PLAY.V)))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P (KA PLAY.V)))
	                  (OUTSIDE.ADV ((ADV-A (FOR.P (KA PLAY.V))) RUN.14.V)))))
	               (KA PLAY.V)))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E SON.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA PLAY.V) LOCATION.N))
			(!R4 (NOT (?L1 = (KA PLAY.V))))
			(!R5 (?X_B AGENT.N))
			(!R6 (?X_E (PERTAIN-TO ?X_B)))
			(!R7 (?X_E (IS.V ?X_C)))
			(!R8 (?X_C LITTLE.A))
			(!R9 (?X_C CHILD.N))
			(!R10 (?X_D FRIEND.N))
			(!R11 (?X_D (PERTAIN-TO ?X_E)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA ((ADV-A (AT.P (KA PLAY.V))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_E (AT.P ?L1)))
			(?I2 (NOT (?X_E (AT.P (KA PLAY.V)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (AT.P ?L1))))
			(?P2 (?X_E (AT.P (KA PLAY.V))))
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
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (WITH.P (K (PLUR STICK.N))))
	                (TOGETHER.ADV
	                 ((ADV-A (WITH.P (K (PLUR STICK.N)))) PLAY.16.V)))
	               ?G))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((K (PLUR STICK.N)) TOY.N))
			(!R3 ((K (PLUR STICK.N)) INANIMATE_OBJECT.N))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_B HAVE.V (K (PLUR STICK.N))))
		)
		(:POSTCONDS
			(?P1 (?X_B EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_C (AT-ABOUT ?X_D)))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-80.PR ?L2 (KA PLAY.V) ?G)) ** ?E)
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
			(?X_G
	   (?X_K
	    (((ADV-A (FOR.P (KA PLAY.V)))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P (KA PLAY.V)))
	        (OUTSIDE.ADV ((ADV-A (FOR.P (KA PLAY.V))) RUN.14.V)))))
	     (KA PLAY.V))))
			(?X_E
	   (?X_A
	    (((ADV-A (WITH.P (K (PLUR STICK.N))))
	      (TOGETHER.ADV ((ADV-A (WITH.P (K (PLUR STICK.N)))) PLAY.16.V)))
	     ?G)))
			(?X_C
	   (?X_K
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P (K OUTSIDE.N)))
	       ((ADV-A (TO.P ?L2))
	        (IN.PRT ((ADV-A (FROM.P (K OUTSIDE.N))) COME.5.V)))))
	     ?L2)))
			(?X_C
	   (?X_K
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P (K OUTSIDE.N)))
	       ((ADV-A (TO.P ?L2))
	        (IN.PRT ((ADV-A (FROM.P (K OUTSIDE.N))) COME.6.V)))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
			(!W2 (?X_G (BEFORE ?X_C)))
			(!W3 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"Susie is at."
			"Susie looks at a cd of susie."
	)
)



(
	(EPI-SCHEMA ((?X_E FIND.9.V ?X_F) ** ?X_I)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_F LOST.A))
			(!R4 (?X_F GIRL.N))
			(!R5 (?X_B HOME.N))
			(!R6 (?X_B (PERTAIN-TO ?X_E)))
			(!R7 (?X_E (PLUR PARENT.N)))
			(!R8 (?X_C (PERTAIN-TO ?X_F)))
			(!R9 (?X_C (PLUR FRIEND.N)))
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
	(EPI-SCHEMA ((?X_E (((ADV-A (IN.P ?X_A)) FIND.10.V) ?X_F)) ** ?X_I)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_F LOST.A))
			(!R4 (?X_F GIRL.N))
			(!R5 (?X_A HOME.N))
			(!R6 (?X_A (PERTAIN-TO ?X_E)))
			(!R7 (?X_E (PLUR PARENT.N)))
			(!R8 (?X_I (RIGHT-AFTER ?X_B)))
			(!R9 (?X_C (PERTAIN-TO ?X_F)))
			(!R10 (?X_C (PLUR FRIEND.N)))
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
	(EPI-SCHEMA ((?X_E FIND.11.V ?X_F) ** ?X_I)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L LOCATION.N))
			(!R3 (?X_F GIRL.N))
			(!R4 (?X_F LOST.A))
			(!R5 (?X_A HOME.N))
			(!R6 (?X_E (PLUR PARENT.N)))
			(!R7 (?X_A (PERTAIN-TO ?X_E)))
			(!R8 (?X_C (PERTAIN-TO ?X_F)))
			(!R9 (?X_C (PLUR FRIEND.N)))
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-81.PR ?X_O)) ** ?E)
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
			(?X_D (?X_F (OVER.PRT ((ADV-A (FOR.P (KA (GET.V ?X_O)))) GO.V))))
			(?X_B (?X_F FIND.9.V ?X_O))
			(?X_B (?X_F FIND.11.V ?X_O))
			(?X_P (?X_F (((ADV-A (IN.P ?X_E)) FIND.10.V) ?X_O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_P)))
			(!W2 (?X_L BEFORE ?X_K))
			(!W3 (?X_K BEFORE ?X_H))
			(!W4 (?X_H BEFORE ?X_D))
		)
	)
	(
			"A son of a agent is a little child run.139s playing for playing from L1 to playing outside for playing."
			"X_A play.148s G with sticks together with sticks."
			"A son of a agent is a little child come.142s L2 for L2 from outside to L2 in from outside."
			"A son of a agent is a little child come.146s L2 for L2 from outside to L2 in from outside."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-82.PR) ** ?E)
		(:ROLES
			(!R1 (?X_B (PLUR CHICKEN.N)))
		)
		(:STEPS
			(?X_D (?X_B ((ADV-A (TO.P ?X_A)) RUN.V)))
		)
	)
	(
			"A girl lost goes for with a friends of a girl lost playing."
			"A girl lost goes for with a friends of a girl lost playing."
			"A girl lost goes across a street."
			"A parents go over for getting a girl lost."
			"A parents find.177 a girl lost."
			"A parents find.181 a girl lost."
			"A parents find.178 a girl lost in a home of a parents."
	)
)



(
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-83.PR (K MORE.A)
	               (KE (?X_H (HAVE.V (KA (BACK.ADV GO.V)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_A PLACE.N))
			(!R2 (?X_A PIZZA.N))
			(!R3 (?X_A NEW.A))
			(!R4 (?X_A (ABSOLUTELY.ADV AMAZING.A)))
			(!R5 (?X_H AGENT.N))
		)
		(:STEPS
			(?X_C ((ADV-E (DURING (K YESTERDAY.N))) (?X_H ((ADV-A (TO.P ?X_A)) GO.V))))
			(?X_E (?X_H (WANT.V (K MORE.A))))
			(?X_G (?X_H (KNOW.V (KE (?X_H (HAVE.V (KA (BACK.ADV GO.V))))))))
			(?X_J (?X_H (KNOW.V (KE (?X_H (HAVE.V (KA (BACK.ADV GO.V))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_G)))
			(!W3 (?X_C (BEFORE ?X_J)))
			(!W4 (?X_E (BEFORE ?X_G)))
			(!W5 (?X_E (BEFORE ?X_J)))
			(!W6 (?X_G (BEFORE ?X_J)))
		)
	)
	(
			"A chickens run to X_A."
	)
)



(
	(EPI-SCHEMA (((K BABY.N)
	              ((ADV-A (ON.P ?X_B))
	               ((ADV-A (IN.P ?X_B)) ((ADV-A (ON.P ?X_B)) SIT.7.V))))
	             ** ?X_C)
		(:ROLES
			(!R1 ((K BABY.N) AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_B FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_B SOFT.A))
			(!R6 (?X_B MAT.N))
		)
		(:GOALS
			(?G1 ((K BABY.N) (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 ((K BABY.N) (AT.P ?L)))
			(?I2 (?X_B (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (WITH.P ?T))
	                (MAY.AUX ((ADV-A (NEAR.P ?X_B)) PLAY.17.V)))
	               ?G))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_B WHILE.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
			(!R8 (?X_C FEMALE.A))
			(!R9 (?X_C AGENT.N))
			(!R10 (?X_G (RIGHT-AFTER ?X_D)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_E HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_E EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_F (AT-ABOUT ?X_H)))
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
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (WITH.P ?T))
	                (MAY.AUX ((ADV-A (NEAR.P ?X_B)) PLAY.18.V)))
	               ?G))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_B WHILE.N))
			(!R7 (?X_F (RIGHT-AFTER ?X_A)))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
			(!R9 (?X_C FEMALE.A))
			(!R10 (?X_C AGENT.N))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_E HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_E EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_F (SAME-TIME ?X_H)))
			(!W3 (?X_G (AT-ABOUT ?X_H)))
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
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (WITH.P ?T))
	                (MAY.AUX ((ADV-A (NEAR.P ?X_A)) PLAY.19.V)))
	               ?G))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (?T INANIMATE_OBJECT.N))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A WHILE.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_B FEMALE.A))
			(!R9 (?X_B AGENT.N))
			(!R10 (?X_F (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_E HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_E EXPERIENCE.V (K PLEASURE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_F (SAME-TIME ?X_H)))
			(!W3 (?X_G (AT-ABOUT ?X_H)))
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-84.PR ?G)) ** ?E)
		(:ROLES
			(!R1 (?X_G WHILE.N))
			(!R2 (?X_C AGENT.N))
			(!R3 (?X_F SOFT.A))
			(!R4 (?X_F MAT.N))
			(!R5 (?X_H FEMALE.A))
			(!R6 (?X_H AGENT.N))
			(!R7 (?X_G (PERTAIN-TO ?X_H)))
			(!R8 (?X_I (RIGHT-AFTER ?X_J)))
		)
		(:STEPS
			(?X_E
	   ((K BABY.N)
	    ((ADV-A (ON.P ?X_F))
	     ((ADV-A (IN.P ?X_F)) ((ADV-A (ON.P ?X_F)) SIT.7.V)))))
			(?X_B
	   (?X_C
	    (((ADV-A (WITH.P ?T)) (MAY.AUX ((ADV-A (NEAR.P ?X_G)) PLAY.17.V))) ?G)))
			(?X_I
	   (?X_C
	    (((ADV-A (WITH.P ?T)) (MAY.AUX ((ADV-A (NEAR.P ?X_G)) PLAY.18.V))) ?G)))
			(?X_I
	   (?X_C
	    (((ADV-A (WITH.P ?T)) (MAY.AUX ((ADV-A (NEAR.P ?X_G)) PLAY.19.V))) ?G)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_B)))
			(!W2 (?X_E (BEFORE ?X_I)))
		)
	)
	(
			"A agent goes DURING yesterday to a place pizza new absolutely amazing."
			"A agent wants more."
			"A agent knows a agent has back go."
			"A agent knows a agent has back go."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?X_D))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (INTO.P ?X_A)) COME.7.V))))
	               ?L2))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E DOG.N))
			(!R2 (?X_D OUTSIDE.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_D = ?L2)))
			(!R5 (?X_A GARAGE.N))
			(!R6 (?X_E (PERTAIN-TO ?X_C)))
			(!R7 (?X_D PUPPY.A))
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
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?X_D))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (INTO.P ?X_B)) COME.8.V))))
	               ?L2))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E DOG.N))
			(!R2 (?X_D OUTSIDE.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_D = ?L2)))
			(!R5 (?X_B GARAGE.N))
			(!R6 (?X_E (PERTAIN-TO ?X_C)))
			(!R7 (?X_D PUPPY.A))
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-85.PR (K (PLUR PUPPY.N))
	               (K (L X (AND (X COLD.A) (X OUTSIDE.N)))) ?X_E ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E PUPPY.A))
			(!R2 (?X_E OUTSIDE.N))
			(!R3 (?X_H GARAGE.N))
			(!R4 (?X_M DOG.N))
			(!R5 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_L (?X_M (HAVE.V (K (PLUR PUPPY.N)))))
			(?X_J (?X_A (BE.V (K (L X (AND (X COLD.A) (X OUTSIDE.N)))))))
			(?X_D (?X_M (HAVE.V ?X_E)))
			(?X_G
	   (?X_M
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?X_E))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (INTO.P ?X_H)) COME.7.V))))
	     ?L2)))
			(?X_G
	   (?X_M
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?X_E))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (INTO.P ?X_H)) COME.8.V))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L BEFORE ?X_J))
			(!W2 (?X_J BEFORE ?X_D))
			(!W3 (?X_D BEFORE ?X_G))
		)
	)
	(
			"Baby sit.211s on a soft mat in a soft mat on a soft mat."
			"A agent play.208s G with T may near a while of a female agent."
			"A agent play.209s G with T may near a while of a female agent."
			"A agent play.210s G with T may near a while of a female agent."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (TO.P ?X_B)) ((ADV-A (INTO.P ?X_C)) GIVE.5.V)) ?X_B
	               ?X_C))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?X_C CRAVING.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?X_D (?X_B HAVE.V ?X_C))
			(?I2 (NOT (?X_B HAVE.V ?X_C)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B HAVE.V ?X_C)))
			(?P2 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
			(!W2 (?X_F (AT-ABOUT ?X_G)))
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
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (TO.P ?X_B)) ((ADV-A (INTO.P ?X_C)) GIVE.6.V)) ?X_B
	               ?X_C))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?X_C CRAVING.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (?X_B HAVE.V ?X_C))
			(?I2 (NOT (?X_B HAVE.V ?X_C)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B HAVE.V ?X_C)))
			(?X_F (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
			(!W2 (?X_F (AT-ABOUT ?X_G)))
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
	(EPI-SCHEMA ((?X_G (((ADV-A (INTO.P ?X_F)) FEED.3.V) ?X_G ?X_F)) ** ?X_D)
		(:ROLES
			(!R1 (?X_G MAN.N))
			(!R2 (?X_F FOOD.N))
			(!R3 (NOT (?X_G = ?X_G)))
			(!R4 (NOT (?X_G = ?X_F)))
			(!R5 (?X_F CRAVING.N))
		)
		(:GOALS
			(?G1 (?X_G (WANT.V (THAT (NOT (?X_G HUNGRY.A))))))
			(?G2 (?X_G (WANT.V (THAT (?X_G EAT.V ?X_F)))))
		)
		(:PRECONDS
			(?X_B (?X_G HAVE.V ?X_F))
			(?I2 (?X_G HUNGRY.A))
		)
		(:STEPS
			(?E1 (?X_G EAT.5.V ?X_F))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_G (HAVE.V ?X_F))))
			(?P2 (NOT (?X_G HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 AFTER ?X_D))
			(!W2 (?X_B (AT-ABOUT ?X_C)))
			(!W3 (?X_D (AT-ABOUT ?X_E)))
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
			(!S1 ((?X_A<- ?E1) = ?X_F))
			(!S2 ((?X_B<- ?E1) = ?X_G))
			(!S3 ((?E1<- ?E1) = ?E1))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_G (((ADV-A (INTO.P ?X_F)) FEED.4.V) ?X_G ?X_F)) ** ?X_B)
		(:ROLES
			(!R1 (?X_G MAN.N))
			(!R2 (?X_F FOOD.N))
			(!R3 (NOT (?X_G = ?X_G)))
			(!R4 (NOT (?X_G = ?X_F)))
			(!R5 (?X_F CRAVING.N))
		)
		(:GOALS
			(?G1 (?X_G (WANT.V (THAT (NOT (?X_G HUNGRY.A))))))
			(?G2 (?X_G (WANT.V (THAT (?X_G EAT.V ?X_F)))))
		)
		(:PRECONDS
			(?X_D (?X_G HAVE.V ?X_F))
			(?I2 (?X_G HUNGRY.A))
		)
		(:STEPS
			(?E1 (?X_G EAT.6.V ?X_F))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_G (HAVE.V ?X_F))))
			(?P2 (NOT (?X_G HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 AFTER ?X_B))
			(!W2 (?X_B (AT-ABOUT ?X_C)))
			(!W3 (?X_D (AT-ABOUT ?X_E)))
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
			(!S1 ((?X_A<- ?E1) = ?X_F))
			(!S2 ((?X_B<- ?E1) = ?X_G))
			(!S3 ((?E1<- ?E1) = ?E1))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-86.PR (K GUILTY.A) ?X_L ?X_K)) ** ?E)
		(:ROLES
			(!R1 (?X_K CRAVING.N))
			(!R2 (?X_L MAN.N))
		)
		(:STEPS
			(?X_J (?X_L (HAVE.V ?X_K)))
			(?X_H (?X_L (IGNORE.V ?X_K)))
			(?X_F (?X_K GROW.V))
			(?X_B (?X_L (FEEL.V (K GUILTY.A))))
			(?X_D
	   (?X_L (((ADV-A (TO.P ?X_L)) ((ADV-A (INTO.P ?X_K)) GIVE.5.V)) ?X_L ?X_K)))
			(?X_D
	   (?X_L (((ADV-A (TO.P ?X_L)) ((ADV-A (INTO.P ?X_K)) GIVE.6.V)) ?X_L ?X_K)))
			(?X_D (?X_L (((ADV-A (INTO.P ?X_K)) FEED.3.V) ?X_L ?X_K)))
			(?X_D (?X_L (((ADV-A (INTO.P ?X_K)) FEED.4.V) ?X_L ?X_K)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_D)))
			(!W2 (?X_H BEFORE ?X_F))
			(!W3 (?X_F BEFORE ?X_B))
		)
	)
	(
			"A dog of X_N has puppys."
			"X_A is cold outside."
			"A dog of X_N has a puppy outside."
			"A dog of X_N come.224s L2 for L2 from a puppy outside to L2 into a garage."
			"A dog of X_N come.225s L2 for L2 from a puppy outside to L2 into a garage."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.23.V ?X_C) ** ?X_D)
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-87.PR ?X_I (K GREAT.A) ?X_H)) ** ?E)
		(:ROLES
			(!R1 (?X_H (PLUR SCISSOR.N)))
			(!R2 (?X_I LOT.N))
			(!R3 (?X_I (OF.P (K (L X (AND (X SPLIT.A) (X (PLUR END.N))))))))
		)
		(:STEPS
			(E5.SK (?X_A (HAVE.V ?X_I)))
			(?X_E (?X_A ((THEN.ADV (OFF.ADV CUT.V)) ?X_I)))
			(?X_C (?X_A ((THEN.ADV LOOK.V) (K GREAT.A))))
			(?X_G (?X_A GET.23.V ?X_H))
		)
		(:EPISODE-RELATIONS
			(!W1 (E5.SK BEFORE ?X_E))
			(!W2 (?X_E BEFORE ?X_C))
			(!W3 (?X_C BEFORE ?X_G))
		)
	)
	(
			"A man has a craving."
			"A man ignores a craving."
			"A craving grows."
			"A man feels guilty."
			"A man give.236s a man a craving to a man into a craving."
			"A man give.237s a man a craving to a man into a craving."
			"A man feed.243s a man a craving into a craving."
			"A man feed.245s a man a craving into a craving."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P ?X_D))
	                ((ADV-A (FROM.P ?X_B))
	                 ((ADV-A (TO.P ?X_D)) (UP.PRT WALK.5.V))))
	               ?X_D))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-88.PR ?X_L ?X_A ?X_F)) ** ?E)
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
			(?X_C (?X_L ((ALMOST.ADV HIT.V) ?X_A)))
			(?X_E
	   (?X_G
	    (((ADV-A (FOR.P ?X_F))
	      ((ADV-A (FROM.P ?X_N)) ((ADV-A (TO.P ?X_F)) (UP.PRT WALK.5.V))))
	     ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K BEFORE ?X_I))
			(!W2 (?X_I BEFORE ?X_C))
			(!W3 (?X_C BEFORE ?X_E))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_D ((HOME.ADV ((ADV-A (AS.P ?X_A)) TAKE.19.V)) ?X_E)) ** ?X_F)
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
	(EPI-SCHEMA ((?X_D ((HOME.ADV ((ADV-A (AS.P ?X_B)) TAKE.20.V)) ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E SAD.A))
			(!R6 (?X_E PUPPY.N))
			(!R7 (?X_B (K NEW.A) PET.N))
			(!R8 (?X_B (PERTAIN-TO ?X_D)))
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
	(EPI-SCHEMA ((?X_D ((HOME.ADV ((ADV-A (AS.P ?X_A)) TAKE.21.V)) ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_A (K NEW.A) PET.N))
			(!R6 (?X_A (PERTAIN-TO ?X_D)))
			(!R7 (?X_E PUPPY.N))
			(!R8 (?X_E SAD.A))
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
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-89.PR ?X_C
	               (KA ((ADV-A (TO.P (K SCHOOL.N))) GO.V))))
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
			"X_A has a lot of split end."
			"X_A cuts a lot of split end then off."
			"X_A looks great then."
			"X_A get.2s a scissors."
	)
)



(
	(EPI-SCHEMA ((?X_C FIND.12.V ?X_D) ** ?X_F)
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
	              (((ADV-A (FOR.P ?X_C))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?X_C))
	                  (OUT.ADV ((ADV-A (TO.P ?X_C)) GO.15.V)))))
	               ?X_C))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-90.PR ?X_E ?X_L ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_E SPOT.N))
			(!R2 (?X_E (OF.P (K GRASS.N))))
			(!R3 (?X_E GRASS.N))
			(!R4 (?X_F (PLUR COW.N)))
			(!R5 (?X_F OTHER.A))
			(!R6 (?X_I FIELD.N))
			(!R7 (?X_L BARN.N))
			(!R8 (?X_M COW.N))
		)
		(:STEPS
			(E92.SK (?X_F (IN.P ?X_I)))
			(E91.SK (?X_F OUT.P))
			(?X_B (?X_M (EAT.V ?X_E)))
			(?X_K
	   (?X_M
	    ((ADV-A (FOR.P ?X_L))
	     ((ADV-A (FROM.P ?X_I)) ((ADV-A (TO.P ?X_L)) LEAVE.1.V)))
	    ?X_L))
			(?X_H
	   (?X_M
	    (((ADV-A (FOR.P ?X_I))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?X_I)) (OUT.ADV ((ADV-A (TO.P ?X_I)) GO.15.V)))))
	     ?X_I)))
			(?X_D (?X_M FIND.12.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_H)))
			(!W2 (?X_K (BEFORE ?X_D)))
			(!W3 (?X_H (BEFORE ?X_D)))
			(!W4 (E92.SK BEFORE E91.SK))
			(!W5 (E91.SK BEFORE ?X_B))
		)
	)
	(
			"A boy kicks a rock."
			"A rock comes loose."
			"A rock hits X_A almost."
			"A person walk.22s a hill for a hill from a hill side to a hill up."
	)
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-91.PR ?X_C)) ** ?E)
		(:ROLES
			(!R1 (?X_B (SET-OF AGENT.N)))
			(!R2 (?X_C STORM.N))
			(!R3 (?X_F LONG.A))
			(!R4 (?X_F TIME.N))
			(!R5 (?X_I WIND.N))
		)
		(:STEPS
			(?X_E ((ADV-E (DURING (K TODAY.N))) (?X_B (HAVE.V ?X_C))))
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
			"X_A goes a morning to school."
			"X_B likes to school going."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-92.PR
	               (KA ((ADV-A (WITH.P (ALL.D (PLUR CHILD.N)))) PLAY.V))))
	             ** ?E)
		(:STEPS
			(?X_C (?X_A (LIKE.V (KA ((ADV-A (WITH.P (ALL.D (PLUR CHILD.N)))) PLAY.V)))))
		)
	)
	(
			"A cows other are in."
			"A cows other are out."
			"A cow eats a spot of grass grass."
			"A cow leave.57s a barn for a barn from a field to a barn."
			"A cow go.58s a field for a field from L1 to a field out to a field."
			"A cow find.67s a spot of grass grass."
	)
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
	(EPI-SCHEMA ((?X_B GET.25.V ?X_C) ** ?X_D)
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-93.PR ?X_B ?X_I ?X_D)) ** ?E)
		(:ROLES
			(!R1 (?X_I TREE.N))
		)
		(:STEPS
			(?X_K (?X_A (K (PLUR EGG.N)) (HAVE.V ?X_B)))
			(?X_H (?X_C ((UP.PRT GO.V) ?X_I)))
			(?X_F (?X_C GET.24.V ?X_D))
			(?X_F (?X_C GET.25.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
		)
	)
	(
			"A agent has a storm DURING today."
			"X_A rains ADV very hard for a long time."
			"A wind blows loudly."
	)
)



(
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-94.PR ?X_N ?X_K ?X_L ?X_O)) ** ?E)
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
			"X_A likes with all childs playing."
	)
)



(
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-95.PR (K (VERY.ADV WET.A)))) ** ?E)
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
			"X_A has X_B."
			"X_C goes a tree up."
			"X_C get.98s X_D."
			"X_C get.99s X_D."
	)
)



(
	(EPI-SCHEMA ((?X_C DREAM.1.V ?O) ** ?X_D)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?X_B AGENT.N))
			(!R4 (?X_C (PERTAIN-TO ?X_B)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-96.PR ?X_C ?O)) ** ?E)
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
			"A bat of a boy has a of a boy has X_J is in."
			"A boy has a of a boy has X_J has a bat of a boy has a of a boy has X_J."
			"A boy has a of a boy has X_J has a black hat is a boy has a of a boy has X_J."
			"A agent has a black bat is a of a agent of a boy has X_J in a hand of a boy has X_J."
			"A boy has a of a boy has X_J has a black bat is a of a agent of a boy has X_J in a hand of a boy has X_J."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-97.PR) ** ?E)
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
			"A kids go out in a rain."
			"A kids become very wet."
			"A kids goes ADV back inside."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FOR.P ?X_C))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?X_C)) ((ADV-A (TO.P ?X_C)) GO.16.V))))
	               ?X_C))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C LOCATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C PET.N))
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
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-98.PR ?X_M ?X_A ?X_E ?X_J)) ** ?E)
		(:ROLES
			(!R1 (?X_E LIZARD.N))
			(!R2 (?X_J PET.N))
			(!R3 (?X_J STORE.N))
			(!R4 (?X_M PET.N))
		)
		(:STEPS
			(?X_L (?X_B (WANT.V ?X_M)))
			(E262.SK (?X_A LIZARD.N))
			(?X_G (?X_B (FIND.V ?X_A)))
			(?X_D (?X_B (BUY.V ?X_E)))
			(?X_I
	   (?X_B
	    (((ADV-A (FOR.P ?X_J))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?X_J)) ((ADV-A (TO.P ?X_J)) GO.16.V))))
	     ?X_J)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L BEFORE E262.SK))
			(!W2 (E262.SK BEFORE ?X_G))
			(!W3 (?X_G BEFORE ?X_D))
			(!W4 (?X_D BEFORE ?X_I))
		)
	)
	(
			"A dog of a agent lies on a floor."
			"A dog of a agent lets a bark out."
			"A dog of a agent dream.152s O."
	)
)



(
	(EPI-SCHEMA ((?X_C EAT.7.V ?X_B) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_B FOOD.N))
			(!R3 (?X_B BIG.A))
			(!R4 (?X_B MUFFIN.N))
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
	(EPI-SCHEMA ((?X_C FEED.1.V ?X_C ?X_B) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_B FOOD.N))
			(!R3 (NOT (?X_C = ?X_C)))
			(!R4 (NOT (?X_C = ?X_B)))
			(!R5 (?X_B BIG.A))
			(!R6 (?X_B MUFFIN.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (NOT (?X_C HUNGRY.A))))))
			(?G2 (?X_C (WANT.V (THAT (?X_C EAT.V ?X_B)))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?X_B))
			(?I2 (?X_C HUNGRY.A))
		)
		(:STEPS
			(?X_D (?X_C EAT.V ?X_B))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (HAVE.V ?X_B))))
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-99.PR ?X_C ?X_D)) ** ?E)
		(:ROLES
			(!R1 (?X_D FOOD.N))
			(!R2 (?X_D BIG.A))
			(!R3 (?X_D MUFFIN.N))
			(!R4 (?X_C AGENT.N))
			(!R5 (NOT (?X_C = ?X_C)))
			(!R6 (NOT (?X_C = ?X_D)))
		)
		(:STEPS
			(?E_1 (?X_C FEED.1.V ?X_C ?X_D))
			(?X_B (?X_C EAT.7.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E_1 (BEFORE ?X_B)))
		)
	)
	(
			"X_B stands on a of X_B."
	)
)



(
	(EPI-SCHEMA ((?X_B FIND.13.V ?X_C) ** ?X_E)
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-100.PR ?X_F ?X_K)) ** ?E)
		(:ROLES
			(!R1 (?X_F SMALL.A))
			(!R2 (?X_F NOTE.N))
			(!R3 (?X_K LETTER.N))
		)
		(:STEPS
			(?X_H (?X_A ((UP.PRT OPEN.V) ?X_K)))
			(?X_E ((K INSIDE.N) (BE.V ?X_F)))
			(?X_C (?X_A ((AWAY.ADV THROW.V) ?X_F)))
			(?X_J (?X_A FIND.13.V ?X_K))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_E)))
			(!W2 (?X_H (BEFORE ?X_C)))
			(!W3 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"X_B wants a pet."
			"X_A is lizard."
			"X_B finds X_A."
			"X_B buys a lizard."
			"X_B go.173s a pet store for a pet store from L1 to a pet store to a pet store."
	)
)



(
	(EPI-SCHEMA ((MUST.AUX-S (?X_C (COOK.1.V ?X_D))) ** ?X_G)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?X_B RAINING.A))
			(!R4 (?X_B NIGHT.N))
			(!R5 (?X_D ((TOO.ADV BAD.A) (KA (OUT.ADV GO.V)))))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT ((ADV-E (DURING ?X_B)) (?X_D EXIST.V))))))
			(?G2 (?X_C (WANT.V (KA (HAVE.V ?X_D)))))
		)
		(:PRECONDS
			(?I1 (NOT ((ADV-E (DURING ?X_B)) (?X_D EXIST.V))))
		)
		(:POSTCONDS
			(?X_E ((ADV-E (DURING ?X_B)) (?X_D EXIST.V)))
			(?P2 (?X_C (HAVE.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
			(!W2 (?X_G (AT-ABOUT ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((MUST.AUX-S (?X_C (COOK.2.V ?X_D))) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?X_D ((TOO.ADV BAD.A) (KA (OUT.ADV GO.V)))))
			(!R4 (?X_B NIGHT.N))
			(!R5 (?X_B RAINING.A))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT ((ADV-E (DURING ?X_B)) (?X_D EXIST.V))))))
			(?G2 (?X_C (WANT.V (KA (HAVE.V ?X_D)))))
		)
		(:PRECONDS
			(?I1 (NOT ((ADV-E (DURING ?X_B)) (?X_D EXIST.V))))
		)
		(:POSTCONDS
			(?X_G ((ADV-E (DURING ?X_B)) (?X_D EXIST.V)))
			(?P2 (?X_C (HAVE.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
			(!W2 (?X_G (AT-ABOUT ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-101.PR ?X_E)) ** ?E)
		(:ROLES
			(!R1 (?X_E ((TOO.ADV BAD.A) (KA (OUT.ADV GO.V)))))
			(!R2 (?X_F NIGHT.N))
			(!R3 (?X_F RAINING.A))
		)
		(:STEPS
			(?X_B ((ADV-E (DURING ?X_F)) (?X_E BE.V)))
			(?X_D (MUST.AUX-S (?X_A (COOK.1.V ?X_E))))
			(?X_D (MUST.AUX-S (?X_A (COOK.2.V ?X_E))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_D)))
		)
	)
	(
			"A agent feed.183s a agent a food big muffin."
			"A agent eat.181s a food big muffin."
	)
)



(
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-102.PR (KA (SEE.V ?X_C)) (KA LEAVE.V))) ** ?E)
		(:ROLES
			(!R1 (?X_C BASEBALL.N))
			(!R2 (?X_F (SO.ADV BORED.A)))
			(!R3 (?X_F AGENT.N))
		)
		(:STEPS
			(?X_E (?X_F ((PASV INVITE.V) (KA (SEE.V ?X_C)))))
			(?X_A (?X_F (DOWN.ADV SIT.V)))
			(?X_B (?X_F (DOWN.ADV SIT.V)))
			(?X_H (?X_F ((JUST.ADV WANT.V) (KA LEAVE.V))))
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
			"X_A opens a letter up."
			"Inside is a small note."
			"X_A throws a small note away."
			"X_A find.216s a letter."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P ?X_D))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?X_D)) ((ADV-A (TO.P ?X_D)) GO.17.V))))
	               ?X_D))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D LOCATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D POND.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B ROD.N))
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
	(EPI-SCHEMA ((?X_Q (COMPOSITE-SCHEMA-103.PR ?X_H ?X_P ?X_C ?X_O)) ** ?E)
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
	    (((ADV-A (FOR.P ?X_O))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?X_O)) ((ADV-A (TO.P ?X_O)) GO.17.V))))
	     ?X_O)))
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
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (AFTER.P ?X_A)) RUN.15.V))))
	               ?L2))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (AFTER.P ?X_A)) RUN.16.V))))
	               ?L2))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_E BROTHER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A BASKET.N))
			(!R6 (?X_F (RIGHT-AFTER ?X_B)))
			(!R7 (?X_E (PERTAIN-TO ?X_C)))
			(!R8 (?X_C BOY.N))
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-104.PR ?X_M ?L2)) ** ?E)
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
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (AFTER.P ?X_M)) RUN.15.V))))
	     ?L2)))
			(?X_P
	   (?X_N
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (AFTER.P ?X_M)) RUN.16.V))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_P)))
			(!W2 (?X_L BEFORE ?X_I))
			(!W3 (?X_I BEFORE ?X_F))
			(!W4 (?X_F BEFORE ?X_B))
		)
	)
	(
			"A too bad out go is DURING a night raining."
			"X_A cook.2s a too bad out go must."
			"X_A cook.3s a too bad out go must."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.26.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C IPAD.N))
			(!R6 (?X_C NEW.A))
			(!R7 (?X_C NICE.A))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-105.PR ?X_D ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_D BOX.N))
			(!R2 (?X_D (VERY.ADV AMAZING.A)))
			(!R3 (?X_I NEW.A))
			(!R4 (?X_I IPAD.N))
			(!R5 (?X_I NICE.A))
			(!R6 (?X_J AGENT.N))
		)
		(:STEPS
			(?X_F (?X_A ?X_J (((ADV (VERY.ADV MUCH.A)) LIKE.V) ?X_I)))
			(?X_C (?X_J (SAVE.V ?X_D)))
			(?X_H (?X_J GET.26.V ?X_I))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F BEFORE ?X_C))
			(!W2 (?X_C BEFORE ?X_H))
		)
	)
	(
			"X_Q casts a rod of X_Q a pond."
			"X_Q casts a rod of X_Q in a pond."
			"X_Q catches a fish."
			"X_Q pulls a rod of X_Q up."
			"A rod of X_Q is a boot actually."
			"X_Q go.17s a pond for a pond from L1 to a pond to a pond."
	)
)



(
	(EPI-SCHEMA ((?X_D EAT.8.V ?X_C) ** ?X_F)
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
	(EPI-SCHEMA ((?X_D EAT.9.V ?X_C) ** ?X_F)
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
	(EPI-SCHEMA ((?X_D EAT.10.V ?X_C) ** ?X_E)
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) (DOWN.ADV COME.9.V))))
	               ?L2))
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
	              (((ADV-A (FOR.P ?X_C))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?X_C)) (CAN.AUX CLIMB.3.V))))
	               ?X_C))
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
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) (DOWN.ADV COME.10.V))))
	               ?L2))
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
	(EPI-SCHEMA ((?X FEED.5.V ?X_D ?X_C) ** ?E)
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
			(?X_E (?X_D EAT.V ?X_C))
		)
		(:POSTCONDS
			(?P1 (NOT (?X (HAVE.V ?X_C))))
			(?P2 (NOT (?X_D HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E AFTER ?E))
			(!W2 (?X_F (CONSEC ?X_E)))
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
	(EPI-SCHEMA ((?X FEED.6.V ?X_D ?X_C) ** ?E)
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
	(EPI-SCHEMA ((?X FEED.7.V ?X_D ?X_C) ** ?E)
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
	(EPI-SCHEMA ((?X_R
	              (COMPOSITE-SCHEMA-106.PR (KA (L X (AND (X RUN.V) (X PLAY.V)))) ?X_P
	               ?L2 ?X_R ?X_S))
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
			(?X_M (?X_R (GET.V ?X_S)))
			(?X_K (?X_R (CLIMB.V ?X_P)))
			(?X_I (?X_R (DROP.V ?X_S)))
			(?X_C (?X_R (LIKE.V (KA (L X (AND (X RUN.V) (X PLAY.V)))))))
			(?X_O
	   (?X_R
	    (((ADV-A (FOR.P ?X_P))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_P)) (CAN.AUX CLIMB.3.V))))
	     ?X_P)))
			(?X_G
	   (?X_R
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) (DOWN.ADV COME.9.V))))
	     ?L2)))
			(?X_G
	   (?X_R
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) (DOWN.ADV COME.10.V))))
	     ?L2)))
			(?E_1 (?X FEED.5.V ?X_R ?X_S))
			(?E_2 (?X FEED.6.V ?X_R ?X_S))
			(?E_3 (?X FEED.7.V ?X_R ?X_S))
			(?X_E (?X_R EAT.8.V ?X_S))
			(?X_E (?X_R EAT.9.V ?X_S))
			(?X_E (?X_R EAT.10.V ?X_S))
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
			"A boy shoots a basket."
			"A basket bounces hard off a rim."
			"A basket goes into a street."
			"A brother of a boy is after."
			"A brother of a boy catches a basket in a street."
			"A brother of a boy run.28s L2 for L2 from L1 to L2 after a basket."
			"A brother of a boy run.31s L2 for L2 from L1 to L2 after a basket."
	)
)



(
	(EPI-SCHEMA ((?X_C GET.27.V (K SICK.A)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 ((K SICK.A) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = (K SICK.A))))
			(!R5 (?X_B MOTHER.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-107.PR ?X_I (K SICK.A))) ** ?E)
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
			(?X_B (?X_K GET.27.V (K SICK.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H BEFORE ?X_F))
			(!W2 (?X_F BEFORE ?X_D))
			(!W3 (?X_D BEFORE ?X_B))
		)
	)
	(
			"X_A likes a new ipad nice ADV very much."
			"A agent saves a box very amazing."
			"A agent get.45s a new ipad nice."
	)
)



(
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-108.PR ?X_G ?X_F ?X_J (K YOUNG.A) ?X_M ?X_Q))
	             ** ?E)
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
			"A monkey gets a food cocoanut to a ground."
			"A monkey climbs a tree."
			"A monkey drops a food cocoanut to a ground."
			"A monkey likes run playing."
			"A monkey climb.66s a tree for a tree from L1 to a tree can."
			"A monkey come.65s L2 for L2 from L1 to L2 down."
			"A monkey come.67s L2 for L2 from L1 to L2 down."
			"A agent feed.80s a monkey a food cocoanut to a ground."
			"A agent feed.81s a monkey a food cocoanut to a ground."
			"A agent feed.82s a monkey a food cocoanut to a ground."
			"A monkey eat.71s a food cocoanut to a ground."
			"A monkey eat.72s a food cocoanut to a ground."
			"A monkey eat.75s a food cocoanut to a ground."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              ((SHALL.AUX GET.28.V)
	               (K (L X (AND (X MANY.A) (X (PLUR NUT.N)))))))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 ((K (L X (AND (X MANY.A) (X (PLUR NUT.N))))) INANIMATE_OBJECT.N))
			(!R3 (?X_C SEAT.N))
			(!R4 (NOT (?X_D = (K (L X (AND (X MANY.A) (X (PLUR NUT.N))))))))
			(!R5 (?X_B (TWO.D (L X (AND (X BIG.A) (X (PLUR BAG.N))))) (HAVE.V ?X_C)))
			(!R6 (?X_B (SET-OF AGENT.N)))
		)
		(:GOALS
			(?G1
	   (?X_D
	    (WANT.V
	     (THAT (?X_D (HAVE.V (K (L X (AND (X MANY.A) (X (PLUR NUT.N)))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V (K (L X (AND (X MANY.A) (X (PLUR NUT.N))))))))
			(?I2 (?X_D (AT.P ?X_C)))
			(?I3 ((K (L X (AND (X MANY.A) (X (PLUR NUT.N))))) (AT.P ?X_C)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V (K (L X (AND (X MANY.A) (X (PLUR NUT.N)))))))
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
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-109.PR (KA (HOLD.V ?X_D))
	               (K (L X (AND (X MANY.A) (X (PLUR NUT.N)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D HORSE.N))
			(!R2 (?X_G AGENT.N))
			(!R3 (?X_H (SET-OF AGENT.N)))
			(!R4 (?X_J SEAT.N))
			(!R5 (?X_H (TWO.D (L X (AND (X BIG.A) (X (PLUR BAG.N))))) (HAVE.V ?X_J)))
		)
		(:STEPS
			(?X_C (?X_A (LIKE.V (KA (HOLD.V ?X_D)))))
			(?X_F
	   (?X_G ((SHALL.AUX GET.28.V) (K (L X (AND (X MANY.A) (X (PLUR NUT.N))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C BEFORE ?X_F))
		)
	)
	(
			"X_K has a slight cold."
			"X_K goes."
			"X_K swims anyway."
			"X_K get.102s sick."
	)
)



(
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-110.PR (KA (TRY.V ?X_C))
	               (KA (BACK.PRT GO.V) ?X_J)))
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
			"A friend of a agent comes for visiting a agent."
			"A friend of a agent brings a of a friend of X_E a friend of a agent."
			"A friend of a agent brings a of a friend of X_E with a friend of a agent."
			"Young is a cute little boy."
			"A agent gives young a toys for playing with."
			"A agent has a great visit."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-111.PR (K CHOCOLATE.N)
	               (KA (L X (AND (X GO.V) (X (EAT.V (K CHOCOLATE.N))))))
	               (K BAD.A)))
	             ** ?E)
		(:STEPS
			(?X_D (?X_A (LOVE.V (K CHOCOLATE.N))))
			(?X_F
	   (?X_A
	    ((THEN.ADV DECIDE.V)
	     (KA (L X (AND (X GO.V) (X (EAT.V (K CHOCOLATE.N)))))))))
			(?X_H ((K CHOCOLATE.N) (TASTE.V (K BAD.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_H)))
			(!W3 (?X_F (BEFORE ?X_H)))
		)
	)
	(
			"X_A likes holding a horse."
			"A agent get.125s many nut shalls."
	)
)



(
	(EPI-SCHEMA ((?X_C (((ADV-A (INTO.P (KA RACE.V))) GET.29.V) ?O)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?O)))
			(!R5 (?X_B (PERTAIN-TO ?X_C)))
			(!R6 (?X_B BOAT.N))
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
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-112.PR (K (L X (AND (X FAST.A) (X (PLUR BOAT.N)))))
	               ?X_J ?O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D (RIGHT-AFTER ?X_E)))
			(!R2 (?X_J BOAT.N))
			(!R3 (?X_J (PERTAIN-TO ?X_K)))
		)
		(:STEPS
			(?X_I (?X_K (LOVE.V (K (L X (AND (X FAST.A) (X (PLUR BOAT.N))))))))
			(?X_D (?X_K ((ONCE.ADV FLIP.V) ?X_J)))
			(?X_C (?X_K ((ONCE.ADV FLIP.V) ?X_J)))
			(?X_G (?X_K (((ADV-A (INTO.P (KA RACE.V))) GET.29.V) ?O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I BEFORE ?X_D))
			(!W2 (?X_D BEFORE ?X_C))
			(!W3 (?X_C BEFORE ?X_G))
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
	(EPI-SCHEMA ((?X_E GET.30.V (KE ((K MONEY.N) (FOR.P ?X_F)))) ** ?X_G)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 ((KE ((K MONEY.N) (FOR.P ?X_F))) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_E = (KE ((K MONEY.N) (FOR.P ?X_F))))))
			(!R5 (?X_F BIRTHDAY.N))
			(!R6 (?X_F (PERTAIN-TO ?X_C)))
			(!R7 (?X_C AGENT.N))
			(!R8 (?X_G (RIGHT-AFTER ?X_A)))
			(!R9 (?X_D (PERTAIN-TO ?X_C)))
			(!R10 (?X_D (PLUR FRIEND.N)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (?X_E (HAVE.V (KE ((K MONEY.N) (FOR.P ?X_F)))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_E HAVE.V (KE ((K MONEY.N) (FOR.P ?X_F))))))
			(?I2 (?X_E (AT.P ?L)))
			(?I3 ((KE ((K MONEY.N) (FOR.P ?X_F))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_E HAVE.V (KE ((K MONEY.N) (FOR.P ?X_F)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_G))
			(!W2 (?I1 PRECOND-OF ?X_G))
			(!W3 (?I2 PRECOND-OF ?X_G))
			(!W4 (?I3 PRECOND-OF ?X_G))
			(!W5 (?P1 POSTCOND-OF ?X_G))
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
	(EPI-SCHEMA ((?X_E GET.31.V (KE ((K MONEY.N) (FOR.P ?X_F)))) ** ?X_G)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 ((KE ((K MONEY.N) (FOR.P ?X_F))) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_E = (KE ((K MONEY.N) (FOR.P ?X_F))))))
			(!R5 (?X_F BIRTHDAY.N))
			(!R6 (?X_G (RIGHT-AFTER ?X_A)))
			(!R7 (?X_C AGENT.N))
			(!R8 (?X_F (PERTAIN-TO ?X_C)))
			(!R9 (?X_B (PLUR FRIEND.N)))
			(!R10 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (?X_E (HAVE.V (KE ((K MONEY.N) (FOR.P ?X_F)))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_E HAVE.V (KE ((K MONEY.N) (FOR.P ?X_F))))))
			(?I2 (?X_E (AT.P ?L)))
			(?I3 ((KE ((K MONEY.N) (FOR.P ?X_F))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_E HAVE.V (KE ((K MONEY.N) (FOR.P ?X_F)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_G))
			(!W2 (?I1 PRECOND-OF ?X_G))
			(!W3 (?I2 PRECOND-OF ?X_G))
			(!W4 (?I3 PRECOND-OF ?X_G))
			(!W5 (?P1 POSTCOND-OF ?X_G))
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
	(EPI-SCHEMA ((?X_E GET.32.V (KE ((K MONEY.N) (FOR.P ?X_F)))) ** ?X_G)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 ((KE ((K MONEY.N) (FOR.P ?X_F))) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_E = (KE ((K MONEY.N) (FOR.P ?X_F))))))
			(!R5 (?X_F BIRTHDAY.N))
			(!R6 (?X_F (PERTAIN-TO ?X_D)))
			(!R7 (?X_D AGENT.N))
			(!R8 (?X_G (RIGHT-AFTER ?X_A)))
			(!R9 (?X_C (PLUR FRIEND.N)))
			(!R10 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (?X_E (HAVE.V (KE ((K MONEY.N) (FOR.P ?X_F)))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_E HAVE.V (KE ((K MONEY.N) (FOR.P ?X_F))))))
			(?I2 (?X_E (AT.P ?L)))
			(?I3 ((KE ((K MONEY.N) (FOR.P ?X_F))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_E HAVE.V (KE ((K MONEY.N) (FOR.P ?X_F)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_G))
			(!W2 (?I1 PRECOND-OF ?X_G))
			(!W3 (?I2 PRECOND-OF ?X_G))
			(!W4 (?I3 PRECOND-OF ?X_G))
			(!W5 (?P1 POSTCOND-OF ?X_G))
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
	(EPI-SCHEMA ((?X_R
	              (COMPOSITE-SCHEMA-113.PR ?X_Q ?X_A (K (PLUR CLOTHE.N))
	               (KE ((K MONEY.N) (FOR.P ?X_Q)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H (RIGHT-AFTER ?X_I)))
			(!R2 (?X_N (PLUR FRIEND.N)))
			(!R3 (?X_R AGENT.N))
			(!R4 (?X_N (PERTAIN-TO ?X_R)))
			(!R5 (?X_Q BIRTHDAY.N))
			(!R6 (?X_Q (PERTAIN-TO ?X_R)))
			(!R7 (?X_S (RIGHT-AFTER ?X_T)))
		)
		(:STEPS
			(?X_P ((K MONEY.N) (FOR.P ?X_Q)))
			(?X_M (?X_R (HAVE.V ?X_A)))
			(?X_K (?X_R (OUT.ADV ((ADV-A (WITH.P ?X_N)) GO.V))))
			(?X_H (?X_R (OUT.ADV ((ADV-A (WITH.P ?X_N)) GO.V))))
			(?X_G (?X_B (BUY.V (K (PLUR CLOTHE.N)))))
			(?X_E (?X_R (HOME.ADV GO.V)))
			(?X_S (?X_C GET.30.V (KE ((K MONEY.N) (FOR.P ?X_Q)))))
			(?X_S (?X_C GET.31.V (KE ((K MONEY.N) (FOR.P ?X_Q)))))
			(?X_S (?X_C GET.32.V (KE ((K MONEY.N) (FOR.P ?X_Q)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_P (BEFORE ?X_S)))
			(!W2 (?X_M BEFORE ?X_K))
			(!W3 (?X_K BEFORE ?X_H))
			(!W4 (?X_H BEFORE ?X_G))
			(!W5 (?X_G BEFORE ?X_E))
		)
	)
	(
			"X_A loves chocolate."
			"X_A decides go eating then."
			"Chocolate tastes bad."
	)
)



(
	(EPI-SCHEMA ((?X_C GET.33.V (K (L X (AND (X HAIR.N) (X STUFF.N))))) ** ?X_E)
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
	(EPI-SCHEMA ((?X_C GET.35.V (K (L X (AND (X HAIR.N) (X STUFF.N))))) ** ?X_F)
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-114.PR ?X_J
	               (K (L X (AND (X HAIR.N) (X STUFF.N))))))
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
			(?X_G (?X_L GET.35.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
			(?X_E (?X_L GET.34.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_G)))
			(!W2 (?X_B (BEFORE ?X_E)))
			(!W3 (?X_C (BEFORE ?X_G)))
			(!W4 (?X_C (BEFORE ?X_E)))
		)
	)
	(
			"X_K loves fast boat."
			"X_K flips a boat of X_K once."
			"X_K flips a boat of X_K once."
			"X_K get.178s O into racing."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) (FAST.ADV MOVE.1.V))))
	               ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C BOAT.N))
			(!R6 (?X_C SAIL-BOAT.N))
			(!R7 (?X_C (ON.P ?X_B)))
			(!R8 (?X_B POND.N))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-115.PR ?X_I ?X_C ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_C ROW-BOAT.N))
			(!R2 (?X_D AGENT.N))
			(!R3 (?X_K SAIL-BOAT.N))
			(!R4 (?X_K BOAT.N))
			(!R5 (?X_I SAIL.N))
			(!R6 (?X_J MAN.N))
			(!R7 (?X_L POND.N))
			(!R8 (?X_K (ON.P ?X_L)))
		)
		(:STEPS
			(?X_H (?X_J (HOLD.V ?X_I)))
			(?X_B (?X_D (LIKE.V ?X_C)))
			(?X_F
	   (?X_K
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) (FAST.ADV MOVE.1.V))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H BEFORE ?X_B))
			(!W2 (?X_B BEFORE ?X_F))
		)
	)
	(
			"Money is for."
			"A agent has X_A."
			"A agent goes out with a friends of a agent."
			"A agent goes out with a friends of a agent."
			"X_B buys clothes."
			"A agent goes home."
			"X_C get.185s money for a birthday of a agent."
			"X_C get.186s money for a birthday of a agent."
			"X_C get.191s money for a birthday of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (OFF.P ?X_B)) GO.18.V))))
	               ?L2))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (OFF.P ?X_B)) GO.19.V))))
	               ?L2))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (OFF.P ?X_A)) GO.9.V))))
	               ?L2))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-116.PR ?L2)) ** ?E)
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
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (OFF.P ?X_D)) GO.18.V))))
	     ?L2)))
			(?X_C
	   (?X_J
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (OFF.P ?X_D)) GO.19.V))))
	     ?L2)))
			(?X_C
	   (?X_J
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (OFF.P ?X_D)) GO.9.V))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (E5.SK BEFORE ?X_F))
			(!W2 (?X_F BEFORE ?X_C))
		)
	)
	(
			"A hair of a agent is a mess."
			"A agent is there."
			"A agent is there."
			"A agent get.209s hair stuff."
			"A agent get.212s hair stuff."
			"A agent get.210s hair stuff."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (ON.P ?S))
	               ((ADV-A (IN.P ?S))
	                (MOSTLY.ADV ((ADV-A (AROUND.P ?X_A)) SIT.8.V)))))
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
	              ((ADV-A (ON.P ?S))
	               ((ADV-A (IN.P ?S))
	                (MOSTLY.ADV ((ADV-A (AROUND.P ?X_B)) SIT.9.V)))))
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-117.PR (KA (MORE.ADV ACTIVE.A))
	               (KA (BE.V (K (L X (AND (X MORE.A) (X FIT.N))))))))
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
	    ((ADV-A (ON.P ?S))
	     ((ADV-A (IN.P ?S)) (MOSTLY.ADV ((ADV-A (AROUND.P ?X_K)) SIT.8.V))))))
			(?X_J
	   (?X_L
	    ((ADV-A (ON.P ?S))
	     ((ADV-A (IN.P ?S)) (MOSTLY.ADV ((ADV-A (AROUND.P ?X_K)) SIT.9.V))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_H)))
			(!W2 (?X_N (BEFORE ?X_D)))
			(!W3 (?X_H (BEFORE ?X_D)))
		)
	)
	(
			"A man holds a sail."
			"A agent likes a row boat."
			"A sail boat boat on a pond move.221s L2 for L2 from L1 to L2 fast."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2))
	                  (HOME.ADV ((ADV-A (BEFORE.P (K DARK.N))) COME.11.V)))))
	               ?L2))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) (OFF.ADV ((ADV-A (ON.P ?X_B)) GO.20.V)))))
	               ?L2))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-118.PR ?X_K ?L2)) ** ?E)
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
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) (OFF.ADV ((ADV-A (ON.P ?X_E)) GO.20.V)))))
	     ?L2)))
			(?X_B
	   (?X_F
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2))
	        (HOME.ADV ((ADV-A (BEFORE.P (K DARK.N))) COME.11.V)))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
			(!W2 (?X_M BEFORE ?X_J))
			(!W3 (?X_J BEFORE ?X_G))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (FOR.P (K ((ADV-A (WITH.P ?X_D)) (TO.P ?X_E)))))
	               ((ADV-A (FROM.P ?L1))
	                ((ADV-A (TO.P (K ((ADV-A (WITH.P ?X_D)) (TO.P ?X_E)))))
	                 GO.21.V)))
	              (K ((ADV-A (WITH.P ?X_D)) (TO.P ?X_E))))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K ((ADV-A (WITH.P ?X_D)) (TO.P ?X_E))) LOCATION.N))
			(!R4 (NOT (?L1 = (K ((ADV-A (WITH.P ?X_D)) (TO.P ?X_E))))))
			(!R5 (?X_D FRIEND.N))
			(!R6 (?X_C LATE.A))
			(!R7 (?X_D (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((?X_E (((ADV-A (IN.P (K TROUBLE.N))) GET.36.V) ?O)) ** ?X_F)
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
	(EPI-SCHEMA ((?X_E (((ADV-A (IN.P (K TROUBLE.N))) GET.37.V) ?O)) ** ?X_F)
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-119.PR ?X_K ?X_L
	               (K ((ADV-A (WITH.P ?X_K)) (TO.P ?X_H))) ?O))
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
	      ((ADV-A (TO.P (K ((ADV-A (WITH.P ?X_K)) (TO.P ?X_H))))) GO.21.V)))
	    (K ((ADV-A (WITH.P ?X_K)) (TO.P ?X_H)))))
			(?X_C (?X_M (((ADV-A (IN.P (K TROUBLE.N))) GET.36.V) ?O)))
			(?X_C (?X_M (((ADV-A (IN.P (K TROUBLE.N))) GET.37.V) ?O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_C)))
			(!W2 (?X_J BEFORE ?X_E))
			(!W3 (?X_E BEFORE E87.SK))
		)
	)
	(
			"A agent hangs out with a friend of a agent."
			"A male agent pulls in front of."
			"A agent go.1s L2 for L2 from L1 to L2 off a road."
			"A agent go.2s L2 for L2 from L1 to L2 off a road."
			"A agent go.3s L2 for L2 from L1 to L2 off a road."
	)
)



(
	(EPI-SCHEMA ((?X_G COMPOSITE-SCHEMA-120.PR) ** ?E)
		(:ROLES
			(!R1 (?X_D DAY.N))
			(!R2 (?X_D BEACH.N))
			(!R3 (?X_D GREAT.A))
			(!R4 (?X_G AGENT.N))
			(!R5 (?X_H AGENT.N))
		)
		(:STEPS
			(?X_F
	   ((ADV-E (DURING ?X_D)) ((K (L X (AND (X LAST.A) (X WEEK.N)))) ?X_G HAVE.V)))
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
			"X_A wants more active."
			"A agent wants being more fit."
			"A agent starts for outside a day playing a hour."
			"A agent sit.22s on S in S mostly around a house."
			"A agent sit.23s on S in S mostly around a house."
	)
)



(
	(EPI-SCHEMA (((K TYKE.N) TAKE.22.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 ((K TYKE.N) AGENT.N))
			(!R2 (?X_C INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT ((K TYKE.N) = ?X_C)))
			(!R5 (?X_C BALL.N))
			(!R6 (?X_C (TO.P (K TYKE.N))))
			(!R7 (?X_C (TO.P ?X_B)))
			(!R8 (?X_C (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 ((K TYKE.N) (WANT.V (THAT ((K TYKE.N) (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT ((K TYKE.N) HAVE.V ?X_C)))
			(?I2 ((K TYKE.N) (AT.P ?L)))
			(?I3 (?X_C (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 ((K TYKE.N) HAVE.V ?X_C))
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
	              ((ADV-A (FOR.P ?X_C))
	               ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_C)) ROLL.2.V)))
	              ?X_C)
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C LOCATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C BALL.N))
			(!R6 (?X_C (TO.P (K TYKE.N))))
			(!R7 (?X_C (PERTAIN-TO ?X_B)))
			(!R8 (?X_C (TO.P ?X_B)))
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
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-121.PR
	               (KA (((ADV-A (WITH.P (K TYKE.N))) PLAY.V) (K BALL.N))) ?X_G
	               ?X_H))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H (TO.P (K TYKE.N))))
			(!R2 (?X_H BALL.N))
			(!R3 (?X_G BALL.N))
			(!R4 (?X_H (PERTAIN-TO ?X_I)))
			(!R5 (?X_H (TO.P ?X_I)))
		)
		(:STEPS
			(E119.SK
	   (?X_I (LIKE.V (KA (((ADV-A (WITH.P (K TYKE.N))) PLAY.V) (K BALL.N))))))
			(?X_F (?X_I ((CAN.AUX CATCH.V) ?X_G)))
			(?X_D
	   (?X_I
	    ((ADV-A (FOR.P ?X_H))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_H)) ROLL.2.V)))
	    ?X_H))
			(?X_B ((K TYKE.N) TAKE.22.V ?X_H))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
			(!W2 (E119.SK BEFORE ?X_F))
		)
	)
	(
			"A son of X_N is outside playing."
			"A of a son of X_N is by."
			"A of a son of X_N comes by a house."
			"A agent go.27s L2 for L2 from L1 to L2 off on a adventure."
			"A agent come.26s L2 for L2 from L1 to L2 home before dark."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (COMPOSITE-SCHEMA-122.PR (KA (CATCH.V ?X_D))
	               (KE ((K (PLUR CHICK.N)) (NEAR.P ?X_G))) ?X_C))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D CHICK.N))
			(!R2 (?X_G HEN.N))
		)
		(:STEPS
			(?X_F (?X_B (WANT.V (KA (CATCH.V ?X_D)))))
			(?X_I (?X_A (BE.V (KE ((K (PLUR CHICK.N)) (NEAR.P ?X_G))))))
			(?X_K (?X_B ((NEVER.ADV CATCH.V) ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_I)))
			(!W2 (?X_F (BEFORE ?X_K)))
			(!W3 (?X_I (BEFORE ?X_K)))
		)
	)
	(
			"A late agent is in high school."
			"A late agent loses a friend of a late agent."
			"A late agent is for."
			"A late agent go.57s with a friend of a late agent to a park for with a friend of a late agent to a park from L1 to with a friend of a late agent to a park."
			"A late agent get.64s O in trouble."
			"A late agent get.65s O in trouble."
	)
)



(
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-123.PR (KE (?X_J (HAVE.V ?X_F))) ?X_J ?X_K))
	             ** ?E)
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
			"Last week has DURING a day beach great."
			"A agent goes."
			"A agent goes."
			"A agent jumps ADV right away in."
	)
)



(
	(EPI-SCHEMA ((?X_J
	              (COMPOSITE-SCHEMA-124.PR
	               (K (L X (AND (X LARGE.A) (X (PLUR BASKET.N)) (X (ON.P ?X_I)))))
	               (K (PLUR CLOTHE.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_B RIVER.N))
			(!R2 (?X_J (DIP.V (K (PLUR CLOTHE.N)))))
			(!R3 (?X_J (((ADV-A (ON.P ?X_G)) LAY.V) (K (PLUR CLOTHE.N)))))
			(!R4 (?X_J (((ADV-A (WITH.P ?X_H)) POUND.V) (K (PLUR CLOTHE.N)))))
			(!R5 (?X_J AGENT.N))
			(!R6 (?X_I (PLUR HEAD.N)))
			(!R7 (?X_I (PERTAIN-TO ?X_J)))
			(!R8 (?X_K (RIGHT-AFTER ?X_L)))
		)
		(:STEPS
			(?X_D
	   ((THESE.D (PLUR WOMAN.N))
	    ((ADV-A (TO.P ?X_B))
	     ((ADV-A (FOR.P (KA (WASH.V (K (PLUR CLOTHE.N)))))) COME.V))))
			(?X_F
	   (?X_J
	    (BRING.V (K (PLUR CLOTHE.N))
	     (K (L X (AND (X LARGE.A) (X (PLUR BASKET.N)) (X (ON.P ?X_I))))))))
			(?X_K
	   (?X_J
	    (((ADV-A
	       (IN.P (K (L X (AND (X LARGE.A) (X (PLUR BASKET.N)) (X (ON.P ?X_I)))))))
	      BRING.V)
	     (K (PLUR CLOTHE.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_K)))
			(!W3 (?X_F (BEFORE ?X_K)))
		)
	)
	(
			"X_I likes with tyke playing ball."
			"X_I catches a ball can."
			"X_I roll.87s a to tyke ball of X_I to X_I for a to tyke ball of X_I to X_I from L1 to a to tyke ball of X_I to X_I."
			"Tyke take.83s a to tyke ball of X_I to X_I."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (IN.P ?X_G)) ((ADV-A (IN.P ?X_G)) PUT.9.V)) ?X_F))
	             ** ?X_H)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_F INANIMATE_OBJECT.N))
			(!R3 (?X_G CONTAINER.N))
			(!R4 (?X_G INANIMATE_OBJECT.N))
			(!R5 (?X_F SMALLER-THAN ?X_G))
			(!R6 (?X_G (AT.P (K SCHOOL.N))))
			(!R7 (?X_G DESK.N))
			(!R8 (?X_G (PERTAIN-TO ?X_E)))
			(!R9 (?X_F (VERY.ADV MUCH.A)))
			(!R10 (?X_F (PERTAIN-TO ?X_E)))
			(!R11 (?X_F FAN.N))
			(!R12 (?X_A HAND.N))
			(!R13 (?X_A (PERTAIN-TO ?X_E)))
			(!R14 (?X_B FAN.N))
			(!R15 (?X_F (IS.V ?X_B)))
			(!R16 (?X_B PRETTY.A))
			(!R17 (?X_H (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (?X_F (IN.P ?X_G))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_F (IN.P ?X_G))))
		)
		(:POSTCONDS
			(?P1 (?X_F (IN.P ?X_G)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (SAME-TIME ?X_J)))
			(!W2 (?X_I (AT-ABOUT ?X_J)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 0.9))
			(!N3 (!R4 NECESSARY-TO-DEGREE 0.9))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_F ((ADV-A (IN.P ?C)) PUT.10.V) ?X_G) ** ?X_H)
		(:ROLES
			(!R1 (?X_F AGENT.N))
			(!R2 (?X_G INANIMATE_OBJECT.N))
			(!R3 (?C CONTAINER.N))
			(!R4 (?C INANIMATE_OBJECT.N))
			(!R5 (?X_G SMALLER-THAN ?C))
			(!R6 (?X_G FAN.N))
			(!R7 (?X_G (VERY.ADV MUCH.A)))
			(!R8 (?X_G (PERTAIN-TO ?X_F)))
			(!R9 (?X_A (PERTAIN-TO ?X_F)))
			(!R10 (?X_A (AT.P (K SCHOOL.N))))
			(!R11 (?X_A DESK.N))
			(!R12 (?X_C HAND.N))
			(!R13 (?X_C (PERTAIN-TO ?X_F)))
			(!R14 (?X_D FAN.N))
			(!R15 (?X_G (IS.V ?X_D)))
			(!R16 (?X_D PRETTY.A))
			(!R17 (?X_I (RIGHT-AFTER ?X_E)))
		)
		(:GOALS
			(?G1 (?X_F (WANT.V (THAT (?X_G (IN.P ?C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_G (IN.P ?C))))
		)
		(:POSTCONDS
			(?P1 (?X_G (IN.P ?C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (AT-ABOUT ?X_J)))
			(!W2 (?X_I (SAME-TIME ?X_J)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 0.9))
			(!N3 (!R4 NECESSARY-TO-DEGREE 0.9))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (IN.P ?X_G)) ((ADV-A (IN.P ?X_G)) PUT.11.V)) ?X_F))
	             ** ?X_H)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_F INANIMATE_OBJECT.N))
			(!R3 (?X_G CONTAINER.N))
			(!R4 (?X_G INANIMATE_OBJECT.N))
			(!R5 (?X_F SMALLER-THAN ?X_G))
			(!R6 (?X_F (VERY.ADV MUCH.A)))
			(!R7 (?X_F (PERTAIN-TO ?X_E)))
			(!R8 (?X_F FAN.N))
			(!R9 (?X_G (PERTAIN-TO ?X_E)))
			(!R10 (?X_G (AT.P (K SCHOOL.N))))
			(!R11 (?X_G DESK.N))
			(!R12 (?X_A FAN.N))
			(!R13 (?X_F (IS.V ?X_A)))
			(!R14 (?X_A PRETTY.A))
			(!R15 (?X_B HAND.N))
			(!R16 (?X_B (PERTAIN-TO ?X_E)))
			(!R17 (?X_H (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (?X_F (IN.P ?X_G))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_F (IN.P ?X_G))))
		)
		(:POSTCONDS
			(?P1 (?X_F (IN.P ?X_G)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (SAME-TIME ?X_J)))
			(!W2 (?X_I (AT-ABOUT ?X_J)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 0.9))
			(!N3 (!R4 NECESSARY-TO-DEGREE 0.9))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-125.PR ?X_W ?X_U ?X_A ?X_L ?X_X)) ** ?E)
		(:ROLES
			(!R1 (?X_M DESK.N))
			(!R2 (?X_M (AT.P (K SCHOOL.N))))
			(!R3 (?X_D (RIGHT-AFTER ?X_E)))
			(!R4 (?X_L HAND.N))
			(!R5 (?X_J (RIGHT-AFTER ?X_K)))
			(!R6 (?X_X FAN.N))
			(!R7 (?X_X (VERY.ADV MUCH.A)))
			(!R8 (?X_X (PERTAIN-TO ?X_N)))
			(!R9 (?X_L (PERTAIN-TO ?X_N)))
			(!R10 (?X_M (PERTAIN-TO ?X_N)))
			(!R11 (?X_Q (RIGHT-AFTER ?X_R)))
			(!R12 (?X_U (HAS.V (TWO.D (PLUR BLADE.N)))))
			(!R13 (?X_V FATHER.N))
			(!R14 (?X_V (PERTAIN-TO ?X_W)))
			(!R15 (?X_Y PRETTY.A))
			(!R16 (?X_Y FAN.N))
			(!R17 (?X_X (IS.V ?X_Y)))
			(!R18 (?X_Z (RIGHT-AFTER ?X_ZA)))
		)
		(:STEPS
			(?X_T (?X_V (BUY.V ?X_U ?X_W)))
			(?X_Q (?X_V (((ADV-A (FOR.P ?X_W)) BUY.V) ?X_U)))
			(?X_P (?X_W (CARRY.V ?X_A)))
			(?X_J (?X_N (LIKE.V ?X_X)))
			(?X_I (?X_N (LIKE.V ?X_X)))
			(?X_G (?X_N (CARRY.V ?X_X ?X_L)))
			(?X_D (?X_N (((ADV-A (IN.P ?X_L)) CARRY.V) ?X_X)))
			(?X_Z (?X_N (((ADV-A (IN.P ?X_M)) ((ADV-A (IN.P ?X_M)) PUT.9.V)) ?X_X)))
			(?X_Z (?X_N (((ADV-A (IN.P ?X_M)) ((ADV-A (IN.P ?X_M)) PUT.11.V)) ?X_X)))
			(?X_C (?X_N ((ADV-A (IN.P ?C)) PUT.10.V) ?X_X))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_T BEFORE ?X_Q))
			(!W2 (?X_Q BEFORE ?X_P))
			(!W3 (?X_P BEFORE ?X_J))
			(!W4 (?X_J BEFORE ?X_I))
			(!W5 (?X_I BEFORE ?X_G))
			(!W6 (?X_G BEFORE ?X_D))
			(!W7 (?X_D BEFORE ?X_Z))
			(!W8 (?X_Z BEFORE ?X_C))
		)
	)
	(
			"X_B wants catching a chick."
			"X_A is chicks near a hen."
			"X_B catches X_C never."
	)
)



(
	(EPI-SCHEMA ((?X_D ((THERE.ADV GET.38.V) ?O)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?O)))
			(!R5 (?X_A (PERTAIN-TO ?X_D)))
			(!R6 (?X_A (PLUR FRIEND.N)))
			(!R7 (?X_J (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?O)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?O (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_F (AFTER ?X_E)))
			(!W7 (?X_F (BEFORE ?X_G)))
			(!W8 (?X_H (BEFORE ?X_G)))
			(!W9 (?X_J (SAME-TIME ?X_G)))
			(!W10 (?X_H (AFTER ?X_I)))
			(!W11 (?X_J (AFTER ?X_K)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((THERE.ADV GET.39.V) ?O)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?O)))
			(!R5 (?X_A (PLUR FRIEND.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_D)))
			(!R7 (?X_J (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?O)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?O (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_F (AFTER ?X_E)))
			(!W7 (?X_F (BEFORE ?X_G)))
			(!W8 (?X_H (BEFORE ?X_G)))
			(!W9 (?X_J (SAME-TIME ?X_G)))
			(!W10 (?X_H (AFTER ?X_I)))
			(!W11 (?X_J (AFTER ?X_K)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D ((THERE.ADV GET.33.V) ?O)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?O)))
			(!R5 (?X_A (PLUR FRIEND.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_D)))
			(!R7 (?X_H (RIGHT-AFTER ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?O)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?O (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_F (AFTER ?X_E)))
			(!W7 (?X_F (BEFORE ?X_G)))
			(!W8 (?X_H (SAME-TIME ?X_G)))
			(!W9 (?X_J (BEFORE ?X_G)))
			(!W10 (?X_H (AFTER ?X_I)))
			(!W11 (?X_J (AFTER ?X_K)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_Q
	              (COMPOSITE-SCHEMA-126.PR (KA ((ADV-A (TO.P ?X_O)) GO.V)) ?X_P
	               (K FUN.N) ?O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H AGENT.N))
			(!R2 (?X_P (PLUR FRIEND.N)))
			(!R3 (?X_O FAIR.N))
			(!R4 (?X_P (PERTAIN-TO ?X_Q)))
			(!R5 (?X_R (RIGHT-AFTER ?X_S)))
		)
		(:STEPS
			(?X_N (?X_Q (WANT.V (KA ((ADV-A (TO.P ?X_O)) GO.V)))))
			(?X_A (?X_Q (THERE.ADV GET.V)))
			(?X_G (?X_H (HAVE.V (K FUN.N))))
			(?X_E (?X_H ((ADV-A (FOR.P (THREE.D (PLUR HOUR.N)))) STAY.V)))
			(?X_B (?X_Q ((THERE.ADV GET.38.V) ?O)))
			(?X_B (?X_Q ((THERE.ADV GET.33.V) ?O)))
			(?X_C (?X_Q ((THERE.ADV GET.39.V) ?O)))
			(?X_L (?X_Q (MEET.V ?X_P)))
			(?X_J (?X_Q (MEET.V ?X_P)))
			(?X_R (?X_Q (MEET.V ?X_P)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_R)))
			(!W2 (?X_B (BEFORE ?X_L)))
			(!W3 (?X_B (BEFORE ?X_J)))
			(!W4 (?X_B (BEFORE ?X_R)))
			(!W5 (?X_C (BEFORE ?X_L)))
			(!W6 (?X_C (BEFORE ?X_J)))
			(!W7 (?X_C (BEFORE ?X_R)))
			(!W8 (?X_L (BEFORE ?X_R)))
			(!W9 (?X_J (BEFORE ?X_R)))
			(!W10 (?X_N BEFORE ?X_G))
			(!W11 (?X_G BEFORE ?X_E))
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
	(EPI-SCHEMA ((?X_C EAT.11.V ?X_B) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_B FOOD.N))
			(!R3 (?X_B LOT.N))
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
	(EPI-SCHEMA (((ADV-E (DURING (K YESTERDAY.N)))
	              (?X_B
	               (((ADV-A (FOR.P (KA EAT.V)))
	                 ((ADV-A (FROM.P ?L1))
	                  ((ADV-A (TO.P (KA EAT.V)))
	                   (OUT.PRT ((ADV-A (FOR.P (KA EAT.V))) GO.3.V)))))
	                (KA EAT.V))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA EAT.V) LOCATION.N))
			(!R4 (NOT (?L1 = (KA EAT.V))))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (KA EAT.V))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (KA EAT.V)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (KA EAT.V))))
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
	              (((ADV-A (FOR.P (K SICK.A)))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P (K SICK.A))) (THEN.ADV FALL.3.V))))
	               (K SICK.A)))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K SICK.A) LOCATION.N))
			(!R4 (NOT (?L1 = (K SICK.A))))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (K SICK.A))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K SICK.A)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K SICK.A))))
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
	(EPI-SCHEMA ((?X_C FEED.8.V ?X_C ?X_B) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_B FOOD.N))
			(!R3 (NOT (?X_C = ?X_C)))
			(!R4 (NOT (?X_C = ?X_B)))
			(!R5 (?X_B LOT.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (NOT (?X_C HUNGRY.A))))))
			(?G2 (?X_C (WANT.V (THAT (?X_C EAT.V ?X_B)))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?X_B))
			(?I2 (?X_C HUNGRY.A))
		)
		(:STEPS
			(?X_D (?X_C EAT.V ?X_B))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (HAVE.V ?X_B))))
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
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-127.PR (KA EAT.V) (K SICK.A) ?X_H ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_I FOOD.N))
			(!R2 (?X_I LOT.N))
			(!R3 (?X_H AGENT.N))
			(!R4 (NOT (?X_H = ?X_H)))
			(!R5 (NOT (?X_H = ?X_I)))
		)
		(:STEPS
			(E423.SK (?X_A POINT.N))
			(?X_G
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_H
	     (((ADV-A (FOR.P (KA EAT.V)))
	       ((ADV-A (FROM.P ?L1))
	        ((ADV-A (TO.P (KA EAT.V)))
	         (OUT.PRT ((ADV-A (FOR.P (KA EAT.V))) GO.3.V)))))
	      (KA EAT.V)))))
			(?E_1 (?X_H FEED.8.V ?X_H ?X_I))
			(?X_E (?X_H EAT.11.V ?X_I))
			(?X_C
	   (?X_H
	    (((ADV-A (FOR.P (K SICK.A)))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K SICK.A))) (THEN.ADV FALL.3.V))))
	     (K SICK.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
			(!W2 (?X_G (BEFORE ?X_C)))
			(!W3 (?E_1 (BEFORE ?X_E)))
			(!W4 (?E_1 (BEFORE ?X_C)))
			(!W5 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"These womans come to a river for washing clothes."
			"A dip clothes on X_G lay clothes with X_H pounding clothes agent brings clothes large basket on."
			"A dip clothes on X_G lay clothes with X_H pounding clothes agent brings clothes in large basket on."
	)
)



(
	(EPI-SCHEMA ((?X_D (((ADV-A (FOR.P ?X_A)) TAKE.23.V) ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_A RIDE.N))
			(!R6 (?X_B LITTLE.A))
			(!R7 (?X_B WAGON.N))
			(!R8 (?X_D (HAS.V ?X_B)))
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
	(EPI-SCHEMA ((?X_D (((ADV-A (FOR.P ?X_A)) TAKE.24.V) ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_A RIDE.N))
			(!R6 (?X_D (HAS.V ?X_C)))
			(!R7 (?X_C WAGON.N))
			(!R8 (?X_C LITTLE.A))
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
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-128.PR (KA ((ADV-A (IN.P ?X_H)) RIDE.V))
	               (KA (RIDE.V (IN.P (AND (?X_G LITTLE.A) (?X_G WAGON.N))))) ?X_A))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D RIDE.N))
			(!R2 (?X_H LITTLE.A))
			(!R3 (?X_H WAGON.N))
			(!R4 (?X_G (HAS.V ?X_H)))
		)
		(:STEPS
			(?X_F (?X_A (LIKE.V (KA ((ADV-A (IN.P ?X_H)) RIDE.V)))))
			(?X_C
	   (?X_A (LIKE.V (KA (RIDE.V (IN.P (AND (?X_G LITTLE.A) (?X_G WAGON.N))))))))
			(E446.SK (?X_G (((ADV-A (FOR.P ?X_D)) TAKE.23.V) ?X_A)))
			(E446.SK (?X_G (((ADV-A (FOR.P ?X_D)) TAKE.24.V) ?X_A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F BEFORE ?X_C))
			(!W2 (?X_C BEFORE E446.SK))
		)
	)
	(
			"A father of X_W buys a has two blades X_W."
			"A father of X_W buys a has two blades for X_W."
			"X_W carries X_A."
			"X_N likes a fan very much is a pretty fan of X_N."
			"X_N likes a fan very much is a pretty fan of X_N."
			"X_N carries a fan very much is a pretty fan of X_N a hand of X_N."
			"X_N carries a fan very much is a pretty fan of X_N in a hand of X_N."
			"X_N put.177s a fan very much is a pretty fan of X_N in a desk at school of X_N in a desk at school of X_N."
			"X_N put.179s a fan very much is a pretty fan of X_N in a desk at school of X_N in a desk at school of X_N."
			"X_N put.178s a fan very much is a pretty fan of X_N in C."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (ON.P ?S)) ((ADV-A (IN.P ?S)) SIT.10.V))) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?S AGENT.N)))
			(!R3 (?S FURNITURE.N))
			(!R4 (?L LOCATION.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L)))
			(?I2 (?S (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (DURING ?X_E)))
			(!W2 (?X_C (CONSEC ?X_D)))
			(!W3 (?X_D (DURING ?X_E)))
			(!W4 (?X_E (AT-ABOUT ?X_F)))
			(!W5 (?X_G (AT-ABOUT ?X_F)))
			(!W6 (?X_H (DURING ?X_G)))
			(!W7 (?X_I (DURING ?X_G)))
			(!W8 (?X_H (CONSEC ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (ON.P ?S)) ((ADV-A (IN.P ?S)) SIT.11.V))) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?S AGENT.N)))
			(!R3 (?S FURNITURE.N))
			(!R4 (?L LOCATION.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L)))
			(?I2 (?S (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (DURING ?X_E)))
			(!W2 (?X_D (DURING ?X_E)))
			(!W3 (?X_C (CONSEC ?X_D)))
			(!W4 (?X_E (AT-ABOUT ?X_F)))
			(!W5 (?X_I (AT-ABOUT ?X_F)))
			(!W6 (?X_G (DURING ?X_I)))
			(!W7 (?X_G (CONSEC ?X_H)))
			(!W8 (?X_H (DURING ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (ON.P ?S)) ((ADV-A (IN.P ?S)) SIT.12.V))) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?S AGENT.N)))
			(!R3 (?S FURNITURE.N))
			(!R4 (?L LOCATION.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L)))
			(?I2 (?S (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (CONSEC ?X_C)))
			(!W2 (?X_C (DURING ?X_E)))
			(!W3 (?X_D (DURING ?X_E)))
			(!W4 (?X_E (AT-ABOUT ?X_F)))
			(!W5 (?X_I (AT-ABOUT ?X_F)))
			(!W6 (?X_G (DURING ?X_I)))
			(!W7 (?X_G (CONSEC ?X_H)))
			(!W8 (?X_H (DURING ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (TO.P ?X_F)) ((ADV-A (TO.P ?X_C)) GIVE.7.V)) ?X_F ?O))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?X_F AGENT.N))
			(!R4 (?X_F BUN.N))
			(!R5 (?X_C (IS.V ?X_B)))
			(!R6 (?X_B BUN.N))
			(!R7 (?X_D (PERTAIN-TO ?X_C)))
			(!R8 (?X_D (K HIND.A) (PLUR FOOT.N)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (?X_F (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (?X_E HAVE.V ?O))
			(?I2 (NOT (?X_F HAVE.V ?O)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E HAVE.V ?O)))
			(?P2 (?X_F HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (AFTER ?X_H)))
			(!W2 (?X_H (AT-ABOUT ?X_I)))
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
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (TO.P ?X_F)) ((ADV-A (TO.P ?X_B)) GIVE.8.V)) ?X_F ?O))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?X_F AGENT.N))
			(!R4 (?X_F BUN.N))
			(!R5 (?X_A BUN.N))
			(!R6 (?X_B (IS.V ?X_A)))
			(!R7 (?X_C (PERTAIN-TO ?X_B)))
			(!R8 (?X_C (K HIND.A) (PLUR FOOT.N)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (?X_F (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (?X_E HAVE.V ?O))
			(?I2 (NOT (?X_F HAVE.V ?O)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E HAVE.V ?O)))
			(?P2 (?X_F HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (AFTER ?X_H)))
			(!W2 (?X_H (AT-ABOUT ?X_I)))
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
	(EPI-SCHEMA ((?X_E
	              (((ADV-A (TO.P ?X_F)) ((ADV-A (TO.P ?X_D)) GIVE.9.V)) ?X_F ?O))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?X_F AGENT.N))
			(!R4 (?X_F BUN.N))
			(!R5 (?X_B BUN.N))
			(!R6 (?X_D (IS.V ?X_B)))
			(!R7 (?X_C (K HIND.A) (PLUR FOOT.N)))
			(!R8 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (?X_F (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (?X_E HAVE.V ?O))
			(?I2 (NOT (?X_F HAVE.V ?O)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E HAVE.V ?O)))
			(?P2 (?X_F HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (AFTER ?X_H)))
			(!W2 (?X_H (AT-ABOUT ?X_I)))
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
	(EPI-SCHEMA ((?X_E (((ADV-A (TO.P ?X_C)) FEED.9.V) ?X_F ?F)) ** ?X_G)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_F AGENT.N))
			(!R3 (?F FOOD.N))
			(!R4 (NOT (?X_E = ?X_F)))
			(!R5 (NOT (?X_F = ?F)))
			(!R6 (NOT (?X_E = ?F)))
			(!R7 (?X_F BUN.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
			(!R9 (?X_B (K HIND.A) (PLUR FOOT.N)))
			(!R10 (?X_C (IS.V ?X_D)))
			(!R11 (?X_D BUN.N))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (NOT (?X_F HUNGRY.A))))))
			(?G2 (?X_E (WANT.V (THAT (?X_F EAT.V ?F)))))
		)
		(:PRECONDS
			(?I1 (?X_E HAVE.V ?F))
			(?I2 (?X_F HUNGRY.A))
		)
		(:STEPS
			(?E1 (?X_F EAT.V ?F))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (HAVE.V ?F))))
			(?P2 (NOT (?X_F HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 AFTER ?X_G))
			(!W2 (?X_G (AFTER ?X_H)))
			(!W3 (?X_H (AT-ABOUT ?X_I)))
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
	(EPI-SCHEMA ((?X_E (((ADV-A (TO.P ?X_B)) FEED.10.V) ?X_F ?F)) ** ?X_G)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_F AGENT.N))
			(!R3 (?F FOOD.N))
			(!R4 (NOT (?X_E = ?X_F)))
			(!R5 (NOT (?X_F = ?F)))
			(!R6 (NOT (?X_E = ?F)))
			(!R7 (?X_F BUN.N))
			(!R8 (?X_B (IS.V ?X_A)))
			(!R9 (?X_A BUN.N))
			(!R10 (?X_C (PERTAIN-TO ?X_B)))
			(!R11 (?X_C (K HIND.A) (PLUR FOOT.N)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (NOT (?X_F HUNGRY.A))))))
			(?G2 (?X_E (WANT.V (THAT (?X_F EAT.V ?F)))))
		)
		(:PRECONDS
			(?I1 (?X_E HAVE.V ?F))
			(?I2 (?X_F HUNGRY.A))
		)
		(:STEPS
			(?E1 (?X_F EAT.V ?F))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (HAVE.V ?F))))
			(?P2 (NOT (?X_F HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 AFTER ?X_G))
			(!W2 (?X_G (AFTER ?X_H)))
			(!W3 (?X_H (AT-ABOUT ?X_I)))
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
	(EPI-SCHEMA ((?X_E (((ADV-A (TO.P ?X_C)) FEED.11.V) ?X_F ?F)) ** ?X_G)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_F AGENT.N))
			(!R3 (?F FOOD.N))
			(!R4 (NOT (?X_E = ?X_F)))
			(!R5 (NOT (?X_F = ?F)))
			(!R6 (NOT (?X_E = ?F)))
			(!R7 (?X_F BUN.N))
			(!R8 (?X_A (PERTAIN-TO ?X_C)))
			(!R9 (?X_A (K HIND.A) (PLUR FOOT.N)))
			(!R10 (?X_D BUN.N))
			(!R11 (?X_C (IS.V ?X_D)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (NOT (?X_F HUNGRY.A))))))
			(?G2 (?X_E (WANT.V (THAT (?X_F EAT.V ?F)))))
		)
		(:PRECONDS
			(?I1 (?X_E HAVE.V ?F))
			(?I2 (?X_F HUNGRY.A))
		)
		(:STEPS
			(?E1 (?X_F EAT.V ?F))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (HAVE.V ?F))))
			(?P2 (NOT (?X_F HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 AFTER ?X_G))
			(!W2 (?X_G (AFTER ?X_H)))
			(!W3 (?X_H (AT-ABOUT ?X_I)))
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-129.PR ?X_W ?X_R ?O ?X_I ?F)) ** ?E)
		(:ROLES
			(!R1 (?X_I BUN.N))
			(!R2 (?X_L (RIGHT-AFTER ?X_M)))
			(!R3 (?X_R (K HIND.A) (PLUR FOOT.N)))
			(!R4 (?X_R (PERTAIN-TO ?X_W)))
			(!R5 (?X_X BUN.N))
			(!R6 (?X_W (IS.V ?X_X)))
		)
		(:STEPS
			(?X_Q (?X_W ((MAY.AUX HAVE.V) ?X_W)))
			(?X_O (?X_W (ON.P ?X_R)))
			(?X_L (?X_W ((ADV-A (ON.P ?X_R)) STAND.V)))
			(?X_K (?X_W ((ADV-A (AT.P ?X_A)) LOOK.V)))
			(?X_D (?X_B ((ADV-A (ON.P ?S)) ((ADV-A (IN.P ?S)) SIT.10.V))))
			(?X_D (?X_B ((ADV-A (ON.P ?S)) ((ADV-A (IN.P ?S)) SIT.12.V))))
			(?X_E (?X_B ((ADV-A (AT.P ?X_W)) LOOK.V)))
			(?X_F (?X_B ((ADV-A (ON.P ?S)) ((ADV-A (IN.P ?S)) SIT.11.V))))
			(?X_G (?X_B ((ADV-A (AT.P ?X_W)) LOOK.V)))
			(?X_H (?X_C (((ADV-A (TO.P ?X_I)) ((ADV-A (TO.P ?X_W)) GIVE.7.V)) ?X_I ?O)))
			(?X_H (?X_C (((ADV-A (TO.P ?X_I)) ((ADV-A (TO.P ?X_W)) GIVE.8.V)) ?X_I ?O)))
			(?X_H (?X_C (((ADV-A (TO.P ?X_I)) ((ADV-A (TO.P ?X_W)) GIVE.9.V)) ?X_I ?O)))
			(?X_H (?X_C (((ADV-A (TO.P ?X_W)) FEED.9.V) ?X_I ?F)))
			(?X_H (?X_C (((ADV-A (TO.P ?X_W)) FEED.10.V) ?X_I ?F)))
			(?X_H (?X_C (((ADV-A (TO.P ?X_W)) FEED.11.V) ?X_I ?F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_E)))
			(!W2 (?X_D (BEFORE ?X_H)))
			(!W3 (?X_E (BEFORE ?X_H)))
			(!W4 (?X_F (BEFORE ?X_G)))
			(!W5 (?X_F (BEFORE ?X_H)))
			(!W6 (?X_G (BEFORE ?X_H)))
			(!W7 (?X_Q BEFORE ?X_O))
			(!W8 (?X_O BEFORE ?X_L))
			(!W9 (?X_L BEFORE ?X_K))
		)
	)
	(
			"X_Q wants to a fair going."
			"X_Q gets there."
			"A agent has fun."
			"A agent stays for three hours."
			"X_Q get.207s O there."
			"X_Q get.209s O there."
			"X_Q get.208s O there."
			"X_Q meets a friends of X_Q."
			"X_Q meets a friends of X_Q."
			"X_Q meets a friends of X_Q."
	)
)



(
	(EPI-SCHEMA ((?X_D ((UP.PRT ((ADV-A (IN.P ?X_A)) GET.40.V)) ?O)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D FARMER.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?O)))
			(!R5 (?X_A MORNING.N))
			(!R6 (?X_C (PLUR BOOT.N)))
			(!R7 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?O)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?O (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?O))
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
	(EPI-SCHEMA ((?X_D ((UP.PRT ((ADV-A (IN.P ?X_B)) GET.41.V)) ?O)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D FARMER.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?O)))
			(!R5 (?X_B MORNING.N))
			(!R6 (?X_C (PLUR BOOT.N)))
			(!R7 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?O)))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 (?O (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V ?O))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) (OUTSIDE.ADV GO.22.V))))
	               ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C FARMER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B (PERTAIN-TO ?X_C)))
			(!R6 (?X_B (PLUR BOOT.N)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (IN.P ?C)) PUT.12.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C FARMER.N))
			(!R2 (?X_D INANIMATE_OBJECT.N))
			(!R3 (?C CONTAINER.N))
			(!R4 (?C INANIMATE_OBJECT.N))
			(!R5 (?X_D SMALLER-THAN ?C))
			(!R6 (?X_D (PERTAIN-TO ?X_C)))
			(!R7 (?X_D (PLUR BOOT.N)))
			(!R8 (?X_F (RIGHT-AFTER ?X_B)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D (IN.P ?C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D (IN.P ?C))))
		)
		(:POSTCONDS
			(?P1 (?X_D (IN.P ?C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_G)))
			(!W2 (?X_F (SAME-TIME ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 0.9))
			(!N3 (!R4 NECESSARY-TO-DEGREE 0.9))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (FOR.P (K (BACK.ADV (TO.P (K BED.N))))))
	               ((ADV-A (FROM.P ?L1))
	                ((ADV-A (TO.P (K (BACK.ADV (TO.P (K BED.N)))))) GO.23.V)))
	              (K (BACK.ADV (TO.P (K BED.N)))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C FARMER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (BACK.ADV (TO.P (K BED.N)))) LOCATION.N))
			(!R4 (NOT (?L1 = (K (BACK.ADV (TO.P (K BED.N)))))))
			(!R5 (?X_B (PERTAIN-TO ?X_C)))
			(!R6 (?X_B (PLUR BOOT.N)))
		)
		(:GOALS
			(?G1
	   (?X_C (WANT.V (KA ((ADV-A (AT.P (K (BACK.ADV (TO.P (K BED.N)))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P (K (BACK.ADV (TO.P (K BED.N))))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P (K (BACK.ADV (TO.P (K BED.N)))))))
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-130.PR ?X_E ?O ?L2 ?X_M
	               (K (BACK.ADV (TO.P (K BED.N))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E COW.N))
			(!R2 (?X_M (PLUR BOOT.N)))
			(!R3 (?X_L MORNING.N))
			(!R4 (?X_N FARMER.N))
			(!R5 (?X_M (PERTAIN-TO ?X_N)))
			(!R6 (?X_O (RIGHT-AFTER ?X_P)))
		)
		(:STEPS
			(?X_D (?X_N (MILK.V ?X_E)))
			(?X_K (?X_N ((UP.PRT ((ADV-A (IN.P ?X_L)) GET.40.V)) ?O)))
			(?X_K (?X_N ((UP.PRT ((ADV-A (IN.P ?X_L)) GET.41.V)) ?O)))
			(?X_I (?X_N ((ADV-A (IN.P ?C)) PUT.12.V) ?X_M))
			(?X_O (?X_N (KA PUT.V) ?X_M ON.P))
			(?X_G
	   (?X_N
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) (OUTSIDE.ADV GO.22.V))))
	     ?L2)))
			(?X_B
	   (?X_N
	    ((ADV-A (FOR.P (K (BACK.ADV (TO.P (K BED.N))))))
	     ((ADV-A (FROM.P ?L1))
	      ((ADV-A (TO.P (K (BACK.ADV (TO.P (K BED.N)))))) GO.23.V)))
	    (K (BACK.ADV (TO.P (K BED.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_O)))
			(!W2 (?X_K (BEFORE ?X_G)))
			(!W3 (?X_K (BEFORE ?X_B)))
			(!W4 (?X_I (BEFORE ?X_O)))
			(!W5 (?X_I (BEFORE ?X_G)))
			(!W6 (?X_I (BEFORE ?X_B)))
			(!W7 (?X_O (BEFORE ?X_G)))
			(!W8 (?X_O (BEFORE ?X_B)))
			(!W9 (?X_G (BEFORE ?X_B)))
		)
	)
	(
			"X_A is point."
			"A agent go.230s eating DURING yesterday for eating from L1 to eating out for eating."
			"A agent feed.233s a agent a food lot."
			"A agent eat.232s a food lot."
			"A agent fall.231s sick for sick from L1 to sick then."
	)
)



(
	(EPI-SCHEMA ((MUST.AUX-S
	              (?X_B
	               (((ADV-A (FOR.P ?L2))
	                 ((ADV-A (FROM.P ?L1))
	                  ((ADV-A (TO.P ?L2)) (BACK.ADV (OUTSIDE.ADV GO.18.V)))))
	                ?L2)))
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
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-131.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_G DOOR.N))
			(!R2 (?X_H DAY.N))
			(!R3 (?X_H (VERY.ADV LONG.A)))
		)
		(:STEPS
			(E5.SK ((ADV-E (DURING ?X_H)) (?X_A BE.V)))
			(?X_F (?X_B ((ADV-A (ABOUT.P (KA ((ADV-A (OUT.P ?X_G)) WALK.V)))) BE.V)))
			(?X_D
	   (MUST.AUX-S
	    (?X_B
	     (((ADV-A (FOR.P ?L2))
	       ((ADV-A (FROM.P ?L1))
	        ((ADV-A (TO.P ?L2)) (BACK.ADV (OUTSIDE.ADV GO.18.V)))))
	      ?L2))))
		)
		(:EPISODE-RELATIONS
			(!W1 (E5.SK BEFORE ?X_F))
			(!W2 (?X_F BEFORE ?X_D))
		)
	)
	(
			"X_A likes in a little wagon riding."
			"X_A likes riding in and a has a little wagon little a has a little wagon wagon."
			"A has a little wagon take.234s X_A for a ride."
			"A has a little wagon take.236s X_A for a ride."
	)
)



(
	(EPI-SCHEMA ((?X_D GET.42.V (KE ((K HONEY.N) (FROM.P ?X_E)))) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 ((KE ((K HONEY.N) (FROM.P ?X_E))) INANIMATE_OBJECT.N))
			(!R3 (?X_C GARDEN.N))
			(!R4 (NOT (?X_D = (KE ((K HONEY.N) (FROM.P ?X_E))))))
			(!R5 (?X_E (PLUR FLOWER.N)))
			(!R6 (?X_E HIVE.N))
			(!R7 (?X_D (PLUR BEE.N)))
			(!R8 (?X_C (PERTAIN-TO ?X_B)))
			(!R9 (?X_B AGENT.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V (KE ((K HONEY.N) (FROM.P ?X_E)))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V (KE ((K HONEY.N) (FROM.P ?X_E))))))
			(?I2 (?X_D (AT.P ?X_C)))
			(?I3 ((KE ((K HONEY.N) (FROM.P ?X_E))) (AT.P ?X_C)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V (KE ((K HONEY.N) (FROM.P ?X_E)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
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
	(EPI-SCHEMA ((?X_G
	              (COMPOSITE-SCHEMA-132.PR (KE ((K (PLUR BEE.N)) (IN.P ?X_O))) ?X_A
	               (KE ((K HONEY.N) (FROM.P ?X_F)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F HIVE.N))
			(!R2 (?X_F (PLUR FLOWER.N)))
			(!R3 (?X_G (PLUR BEE.N)))
			(!R4 (?X_K LITTLE.A))
			(!R5 (?X_K HOUSE.N))
			(!R6 (?X_K HIVE.N))
			(!R7 (?X_K ((PASV CALL.V) ?X_J)))
			(!R8 (?X_K (IN.P ?X_L)))
			(!R9 (?X_M (RIGHT-AFTER ?X_N)))
			(!R10 (?X_O GARDEN.N))
			(!R11 (?X_P AGENT.N))
			(!R12 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_M (?X_P (HAVE.V (KE ((K (PLUR BEE.N)) (IN.P ?X_O))))))
			(?X_I ((K (PLUR BEE.N)) ((ADV-A (IN.P ?X_K)) LIVE.V)))
			(?X_E (?X_G (((ADV-A (TO.P ?X_F)) CARRY.V) ?X_A)))
			(?X_C (?X_G GET.42.V (KE ((K HONEY.N) (FROM.P ?X_F)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M BEFORE ?X_I))
			(!W2 (?X_I BEFORE ?X_E))
			(!W3 (?X_E BEFORE ?X_C))
		)
	)
	(
			"A is a bun has a is a bun may."
			"A is a bun is on."
			"A is a bun stands on a of a is a bun."
			"A is a bun looks at X_A."
			"X_B sit.253s on S in S."
			"X_B sit.257s on S in S."
			"X_B looks at a is a bun."
			"X_B sit.254s on S in S."
			"X_B looks at a is a bun."
			"X_C give.244s a bun O to a bun to a is a bun."
			"X_C give.248s a bun O to a bun to a is a bun."
			"X_C give.251s a bun O to a bun to a is a bun."
			"X_C feed.261s a bun F to a is a bun."
			"X_C feed.265s a bun F to a is a bun."
			"X_C feed.266s a bun F to a is a bun."
	)
)



(
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-133.PR ?X_A ?X_N ?X_H
	               (KE ((K (PLUR PET.N)) (IN.P ?X_K)))))
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
			(?X_L (NOT (?X_N ((DID.AUX ALLOW.V) (KE ((K (PLUR PET.N)) (IN.P ?X_K)))))))
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
			"A farmer milks a cow."
			"A farmer get.272s O up in a morning."
			"A farmer get.273s O up in a morning."
			"A farmer put.268s a boots of a farmer in C."
			"A farmer is on."
			"A farmer go.279s L2 for L2 from L1 to L2 outside."
			"A farmer go.277s back to bed for back to bed from L1 to back to bed."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (INSIDE.P ?X_A)) GO.24.V))))
	               ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A THING.N))
			(!R6 (?X_A NEW.A))
			(!R7 (?X_B DOG.N))
			(!R8 (?X_B HOUSE.N))
			(!R9 (?X_B (PERTAIN-TO ?X_D)))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2))
	                  (OUTSIDE.ADV ((ADV-A (IN.P ?X_B)) GO.25.V)))))
	               ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B YARD.N))
			(!R6 (?X_C HOUSE.N))
			(!R7 (?X_C (PERTAIN-TO ?X_D)))
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
	(EPI-SCHEMA ((?X_D
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2))
	                  (OUTSIDE.ADV ((ADV-A (IN.P ?X_A)) GO.15.V)))))
	               ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A YARD.N))
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
	(EPI-SCHEMA ((?X_S (COMPOSITE-SCHEMA-134.PR ?X_N ?X_R ?L2)) ** ?E)
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
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) (OUTSIDE.ADV ((ADV-A (IN.P ?X_Q)) GO.25.V)))))
	     ?L2)))
			(?X_P
	   (?X_S
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) (OUTSIDE.ADV ((ADV-A (IN.P ?X_Q)) GO.15.V)))))
	     ?L2)))
			(?X_G (?X_S SLEEP.V))
			(?X_I
	   (?X_S
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (INSIDE.P ?X_N)) GO.24.V))))
	     ?L2)))
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
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((NEVER.ADV GET.43.V)
	               (K (L X (AND (X ALONG.P) (X (WITH.P ?X_D)))))))
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
	(EPI-SCHEMA ((?X_B ((INSTEAD.ADV GET.44.V) ?X_C)) ** ?X_D)
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
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (TO.P ?X_C)) (QUICKLY.ADV (UP.PRT GIVE.10.V))) ?X_C ?O))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?O INANIMATE_OBJECT.N))
			(!R3 (?X_C AGENT.N))
			(!R4 (?X_C SEARCH.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (?X_B HAVE.V ?O))
			(?I2 (NOT (?X_C HAVE.V ?O)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B HAVE.V ?O)))
			(?P2 (?X_C HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_C GET.45.V ?X_D) ** ?X_E)
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
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-135.PR ?X_N (K SAD.A)
	               (K (L X (AND (X AT.P) (X FIRST.A)))) ?X_D))
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
			(?X_C (?X_O GET.45.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L BEFORE ?X_K))
			(!W2 (?X_K BEFORE ?X_I))
			(!W3 (?X_I BEFORE ?X_F))
			(!W4 (?X_F BEFORE ?X_C))
		)
	)
	(
			"X_A is DURING a day very long."
			"X_B is about out a door walking."
			"X_B go.1s L2 must for L2 from L1 to L2 back outside."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (LIKE.P ?X_B)) ROLL.3.V))))
	               ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C APPLE.N))
			(!R6 (?X_B BALL.N))
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
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) ((ADV-A (LIKE.P ?X_A)) ROLL.4.V))))
	               ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C APPLE.N))
			(!R6 (?X_A BALL.N))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-136.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_K TREE.N))
			(!R2 (?X_N BALL.N))
			(!R3 (?X_O APPLE.N))
		)
		(:STEPS
			(?X_J (?X_O ((ADV-A (ON.P ?X_K)) GROW.V)))
			(?X_H
	   ((K (L X (AND (X MANY.A) (X (PLUR SPHERE.N)))))
	    ((ADV-A (ON.P (K (PLUR TREE.N)))) GROW.V)))
			(?X_F ((K (PLUR PEA.N)) ((ADV-A (ON.P (K (PLUR VINE.N)))) GROW.V)))
			(?X_D (?X_B ((ADV-A (ON.P (K (PLUR VINE.N)))) GROW.V)))
			(?X_M
	   (?X_O
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (LIKE.P ?X_N)) ROLL.3.V))))
	     ?L2)))
			(?X_M
	   (?X_O
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) ((ADV-A (LIKE.P ?X_N)) ROLL.4.V))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J BEFORE ?X_H))
			(!W2 (?X_H BEFORE ?X_F))
			(!W3 (?X_F BEFORE ?X_D))
			(!W4 (?X_D BEFORE ?X_M))
		)
	)
	(
			"A agent has bees in a garden of a agent."
			"Bees live in a little house hive PASV calls X_J in X_L."
			"A bees carry X_A to a hive flowers."
			"A bees get.12 honey from a hive flowers."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (ON.P ?X_C))
	               ((ADV-A (IN.P ?X_C)) ((ADV-A (IN.P ?X_C)) SIT.13.V))))
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
	(EPI-SCHEMA ((?X_C COMPOSITE-SCHEMA-137.PR) ** ?E)
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
	    ((ADV-A (ON.P ?X_F))
	     ((ADV-A (IN.P ?X_F)) ((ADV-A (IN.P ?X_F)) SIT.13.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B BEFORE ?X_E))
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
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FOR.P ?X_C))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?X_C)) (CAN.AUX ROLL.5.V))))
	               ?X_C))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C LOCATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C (VERY.ADV FAST.A)))
			(!R6 (?X_C (HAS.V (KE ((K (PLUR BELL.N)) (ON.P ?X_C))))))
			(!R7 (?X_C HOOP.N))
			(!R8 (?X_C (PERTAIN-TO ?X_B)))
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
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-138.PR ?X_C)) ** ?E)
		(:ROLES
			(!R1 (?X_C (VERY.ADV FAST.A)))
			(!R2 (?X_C (HAS.V (KE ((K (PLUR BELL.N)) (ON.P ?X_C))))))
			(!R3 (?X_C HOOP.N))
			(!R4 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:STEPS
			(?X_B
	   (?X_D
	    (((ADV-A (FOR.P ?X_C))
	      ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_C)) (CAN.AUX ROLL.5.V))))
	     ?X_C)))
		)
	)
	(
			"X_A is a thing new in a yard."
			"A dog sniffs a thing new."
			"A house dog of a dog likes a house dog of a dog."
			"A house dog of a dog likes a house dog of a dog."
			"A dog go.55s L2 for L2 from L1 to L2 outside in a yard."
			"A dog go.58s L2 for L2 from L1 to L2 outside in a yard."
			"A dog sleeps."
			"A dog go.53s L2 for L2 from L1 to L2 inside a thing new."
	)
)



(
	(EPI-SCHEMA ((?X_D TELL_INFORMATION.3.V ?X_E (KA (AWAY.ADV STAY.V))) ** ?E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E AGENT.N))
			(!R3 ((KA (AWAY.ADV STAY.V)) INFORMATION.N))
			(!R4 (?X_B CANDY.N))
			(!R5 (?X_B (PERTAIN-TO ?X_E)))
			(!R6 (?X_C HOUSE.N))
			(!R7 (?X_C (PERTAIN-TO ?X_E)))
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
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-139.PR ?X_N ?X_O (K (UP.ADV (TO.P ?X_O))) ?X_P ?X_Q
	               (KA (AWAY.ADV STAY.V))))
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
			(?X_J (?X_K ((UP.ADV TO.P) ?X_O)))
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
			"X_O loses a job of X_O."
			"X_O loses a job of X_O."
			"X_O is sad at first."
			"X_O looks for a new job."
			"X_O get.112s a interview."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FOR.P ?L2))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?L2)) (QUICKLY.ADV (AWAY.PRT RUN.17.V)))))
	               ?L2))
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
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-140.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_F FENCE.N))
			(!R3 (?X_G (PERTAIN-TO ?X_H)))
		)
		(:STEPS
			(?X_E (?X_H ((ADV-A (BEHIND.P ?X_F)) BE.V)))
			(?X_B
	   (?X_C
	    (((ADV-A (FOR.P ?L2))
	      ((ADV-A (FROM.P ?L1))
	       ((ADV-A (TO.P ?L2)) (QUICKLY.ADV (AWAY.PRT RUN.17.V)))))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E BEFORE ?X_B))
		)
	)
	(
			"A apple grows on a tree."
			"Many sphere grows on trees."
			"Peas grow on vines."
			"X_B grows on vines."
			"A apple roll.121s L2 for L2 from L1 to L2 like a ball."
			"A apple roll.122s L2 for L2 from L1 to L2 like a ball."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FOR.P (KA (GET.V (K ONE.N))))) TAKE.25.V)
	               (FIVE.D (PLUR YEAR.N))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((FIVE.D (PLUR YEAR.N)) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (FIVE.D (PLUR YEAR.N)))))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V (FIVE.D (PLUR YEAR.N))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (FIVE.D (PLUR YEAR.N)))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((FIVE.D (PLUR YEAR.N)) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (FIVE.D (PLUR YEAR.N))))
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
	(EPI-SCHEMA ((?X_J
	              (COMPOSITE-SCHEMA-141.PR (KA INNOCENT.A) (FIVE.D (PLUR YEAR.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J MAN.N))
			(!R2 (?X_J INNOCENT.A))
		)
		(:STEPS
			(?X_I (?X_J ((ADV-A (TO.P (K PRISON.N))) GO.V)))
			(?X_G (?X_J ((ADV-A (FOR.P (ANOTHER.D TRIAL.N))) ASK.V)))
			(?X_C (?X_J ((PASV FIND.V) (KA INNOCENT.A))))
			(?X_E
	   (?X_A
	    (((ADV-A (FOR.P (KA (GET.V (K ONE.N))))) TAKE.25.V)
	     (FIVE.D (PLUR YEAR.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I BEFORE ?X_G))
			(!W2 (?X_G BEFORE ?X_C))
			(!W3 (?X_C BEFORE ?X_E))
		)
	)
	(
			"A garbage very bad starts for smell."
			"A agent sit.126s on a house in a house in a house."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.46.V
	              (K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N)))))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N)))))) INANIMATE_OBJECT.N))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N)))))))))
			(!R5 (?X_B FAMILY.N))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V
	     (THAT
	      (?X_B (HAVE.V (K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N))))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N)))))))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N)))))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N))))))))
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-142.PR (ALL.D DAY.N) (KE (?X_M OUTSIDE.A))
	               (K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N))))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D NEXT.A))
			(!R2 (?X_D FAMILY.N))
			(!R3 (?X_G FAMILY.N))
			(!R4 (?X_L CAGE.N))
			(!R5 (?X_M DOG.N))
		)
		(:STEPS
			(?X_K (?X_M ((ADV-A (IN.P ?X_L)) BE.V)))
			(?X_I (?X_M (HOWL.V (ALL.D DAY.N))))
			(?X_C (?X_D (LET.V (KE (?X_M OUTSIDE.A)))))
			(?X_F (?X_G GET.46.V (K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K BEFORE ?X_I))
			(!W2 (?X_I BEFORE ?X_C))
			(!W3 (?X_C BEFORE ?X_F))
		)
	)
	(
			"X_D roll.131s a very fast has bells on a very fast has bells on X_C hoop of X_D hoop of X_D for a very fast has bells on a very fast has bells on X_C hoop of X_D hoop of X_D from L1 to a very fast has bells on a very fast has bells on X_C hoop of X_D hoop of X_D can."
	)
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (FROM.P (K HOME.N))) TAKE.26.V) ?X_C)) ** ?X_D)
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
	              ((ADV-A (ON.P ?X_C))
	               ((ADV-A (IN.P ?X_C)) ((ADV-A (IN.P ?X_C)) SIT.7.V))))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-143.PR (K SCHOOL.N) ?X_J)) ** ?E)
		(:ROLES
			(!R1 (?X_D DAY.N))
			(!R2 (?X_D (MOST.ADV RELAXING.A)))
			(!R3 (?X_G BEAN.N))
			(!R4 (?X_G BAG.N))
			(!R5 (?X_J (PLUR BOOK.N)))
			(!R6 (?X_K AGENT.N))
			(!R7 ((ADV-E (DURING ?X_N)) (?X_O IN.P)))
			(!R8 (?X_O READ.N))
			(!R9 (?X_P AGENT.N))
		)
		(:STEPS
			(?X_M (?X_P ?X_O (HAVE.V (K SCHOOL.N))))
			(?X_C ((ADV-E (DURING ?X_D)) (?X_A (EVER.ADV BE.V))))
			(?X_I (?X_K (((ADV-A (FROM.P (K HOME.N))) TAKE.26.V) ?X_J)))
			(?X_F
	   (?X_K
	    ((ADV-A (ON.P ?X_G))
	     ((ADV-A (IN.P ?X_G)) ((ADV-A (IN.P ?X_G)) SIT.7.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_F)))
			(!W2 (?X_M BEFORE ?X_C))
		)
	)
	(
			"A agent is a little girl."
			"A man is up to."
			"A man pulls up to a house of a agent."
			"A man offers a candy of a agent."
			"A man offers a candy of a agent."
			"A agent tell information.175s a agent away stay."
			"A agent tell information.176s a agent away stay."
	)
)



(
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-144.PR ?X_N ?X_B)) ** ?E)
		(:ROLES
			(!R1 (?X_N WAY.N))
			(!R2 (?X_N (TO.P (K BED.N))))
			(!R3 (?X_G (RIGHT-AFTER ?X_H)))
			(!R4 (?X_I NIGHT.N))
			(!R5 (?X_I LATE.A))
			(!R6 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_F (?X_O (ON.P ?X_N)))
			(?X_G (?X_O ((ADV-A (ON.P ?X_N)) BE.V)))
			(?X_K ((ADV-E (DURING ?X_I)) (?X_O HAVE.V)))
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
			"X_H is behind a fence."
			"A agent run.191s L2 for L2 from L1 to L2 quickly away."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P ?X_D))
	                ((ADV-A (FROM.P ?L1))
	                 ((ADV-A (TO.P ?X_D)) ((ADV-A (TO.P ?X_D)) GO.26.V))))
	               ?X_D))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D LOCATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D CAFETERIA.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B LUNCH.N))
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
			(!R5 (?X_C FRIEND.N))
			(!R6 (?X_C NEW.A))
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
	              ((ADV-A (ON.P ?X_D))
	               ((ADV-A (IN.P ?X_D))
	                (DOWN.ADV ((ADV-A (BY.P ?X_C)) SIT.14.V)))))
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
	(EPI-SCHEMA ((?X_C GET.47.V ?X_D) ** ?X_E)
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
	(EPI-SCHEMA ((?X_C GET.48.V ?X_D) ** ?X_E)
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



))
; got 410 schemas (266 protoschema matches, 144 stories)
