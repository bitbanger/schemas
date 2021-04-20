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
	(EPI-SCHEMA ((?X_A PLAY.1.V) ** ?X_B)
		(:ROLES
			(!R1 (?X_A GIRL.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_A HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_A EXPERIENCE.V (K PLEASURE.N)))
		)
		(:PARAPHRASES
			(?X_B (?X_A ((ADV-A (WITH.P ?T)) PLAY.1.V)))
			(?X_B (?X_A PLAY.1.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_B (BEFORE ?X_D)))
			(!W3 (?X_C (AT-ABOUT ?X_D)))
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
	              (COMPOSITE-SCHEMA-3.PR (KE (?X_R (PLAY.V (K BALL.N))))
	               (KA ((ADV-A (WITH.P ?X_M)) PLAY.V)) ?X_A))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M (PERTAIN-TO (K SUSIE.N))))
			(!R2 (?X_R GIRL.N))
		)
		(:STEPS
			(?X_B ((K SUSIE.N) (WANT.V (KA ((ADV-A (WITH.P ?X_M)) PLAY.V)))))
			(?X_L ((K SUSIE.N) (WANT.V (KA ((ADV-A (WITH.P ?X_M)) PLAY.V)))))
			(?X_J ((K SUSIE.N) (AHEAD.ADV GO.V)))
			(?X_H ((K SUSIE.N) ((ADV-A (FOR.P (K PERMISSION.N))) ASK.V)))
			(?X_F (?X_R (SAY.V ?X_A)))
			(?X_D ((K SUSIE.N) (THEN.ADV ((ADV-A (FOR.P (KA CRY.V))) START.V))))
			(?X_Q (?X_R PLAY.1.V))
			(?X_O ((K SUSIE.N) (SAY.V (KE (?X_R (PLAY.V (K BALL.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_L)))
			(!W2 (?X_B (BEFORE ?X_J)))
			(!W3 (?X_B (BEFORE ?X_H)))
			(!W4 (?X_B (BEFORE ?X_F)))
			(!W5 (?X_B (BEFORE ?X_D)))
			(!W6 (?X_L (BEFORE ?X_J)))
			(!W7 (?X_L (BEFORE ?X_H)))
			(!W8 (?X_L (BEFORE ?X_F)))
			(!W9 (?X_L (BEFORE ?X_D)))
			(!W10 (?X_J (BEFORE ?X_H)))
			(!W11 (?X_J (BEFORE ?X_F)))
			(!W12 (?X_J (BEFORE ?X_D)))
			(!W13 (?X_H (BEFORE ?X_F)))
			(!W14 (?X_H (BEFORE ?X_D)))
			(!W15 (?X_F (BEFORE ?X_D)))
			(!W16 (?X_Q BEFORE ?X_O))
		)
	)
	(
			"Susie wants with a of susie playing."
			"Susie wants with a of susie playing."
			"Susie goes ahead."
			"Susie asks for permission."
			"A girl says X_A."
			"Susie starts then for crying."
			"A girl play.12s."
			"Susie says a girl plays ball."
	)
)



(
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-4.PR ?X_P (KE (?X_A DRUM.V)) ?X_G
	               (SET-OF ?X_K ?X_L) ?X_Q))
	             ** ?E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_G (K LITTLE.A) GIRL.N))
			(!R3 (?X_G (WITH.P ?X_H)))
			(!R4 (?X_K GOOD.A))
			(!R5 (?X_K BABY.N))
			(!R6 (?X_L PRETTY.A))
			(!R7 (?X_L DOLL.N))
			(!R8 (?X_P ((ADV-A (IN.P ?X_O)) HIGH.A)))
			(!R9 (?X_P RED.A))
			(!R10 (?X_P BIRD.N))
			(!R11 (?X_Q MAN.N))
			(!R12 (?X_Q (IN.P ?X_R)))
		)
		(:STEPS
			(?X_D (NOT (?X_B ((CAN.AUX CATCH.V) ?X_P))))
			(?X_F (?X_P ((CAN.AUX SEE.V) (KE (?X_A DRUM.V)))))
			(?X_J (?X_P ((CAN.AUX SEE.V) ?X_G)))
			(?X_N (?X_P ((CAN.AUX SEE.V) (SET-OF ?X_K ?X_L))))
			(?X_T (?X_P ((CAN.AUX SEE.V) ?X_Q)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_J)))
			(!W3 (?X_D (BEFORE ?X_N)))
			(!W4 (?X_D (BEFORE ?X_T)))
			(!W5 (?X_F (BEFORE ?X_J)))
			(!W6 (?X_F (BEFORE ?X_N)))
			(!W7 (?X_F (BEFORE ?X_T)))
			(!W8 (?X_J (BEFORE ?X_N)))
			(!W9 (?X_J (BEFORE ?X_T)))
			(!W10 (?X_N (BEFORE ?X_T)))
		)
	)
	(
			"A agent catches a in X_O high red bird not can."
			"A in X_O high red bird sees X_A drums can."
			"A in X_O high red bird sees a with X_H can."
			"A in X_O high red bird sees a good baby and a pretty doll can."
			"A in X_O high red bird sees a man in X_R can."
	)
)



(
	(EPI-SCHEMA ((?X_C (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) GO.1.V)) ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A STORE.N))
			(!R6 ((K (L X (AND (X FATHER.N) (X |'S|)))) (PERTAIN-TO ?X_C)))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.1.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.1.V)))))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_B)) GO.2.V)) ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 ((K (L X (AND (X FATHER.N) (X |'S|)))) (PERTAIN-TO ?X_C)))
			(!R6 (?X_B STORE.N))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.2.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.2.V)))))
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-5.PR
	               (KE ((K (L X (AND (X FATHER.N) (X |'S|)))) DAY.N))
	               (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_J))
	               (KE (?X_L NEW.A GRILL.N)) ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G STORE.N))
			(!R2 (?X_J GRILL.N))
			(!R3 (?X_J NEW.A))
			(!R4 (?X_J NICE.A))
			(!R5 ((K (L X (AND (X FATHER.N) (X |'S|)))) (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(?X_N
	   ((K TOMORROW.N) (BE.V (KE ((K (L X (AND (X FATHER.N) (X |'S|)))) DAY.N)))))
			(?X_I (?X_L (WANT.V (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_J)))))
			(?X_A (?X_L (WANT.V (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_J)))))
			(?X_D (?X_L ?X_J GRILL.N))
			(?X_F (?X_L (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_G)) GO.1.V)) ?L2)))
			(?X_F (?X_L (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_G)) GO.2.V)) ?L2)))
			(?X_B
	   ((K (L X (AND (X FATHER.N) (X |'S|)))) (LOVE.V (KE (?X_L NEW.A GRILL.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_A)))
			(!W2 (?X_N (BEFORE ?X_F)))
			(!W3 (?X_N (BEFORE ?X_B)))
			(!W4 (?X_I (BEFORE ?X_A)))
			(!W5 (?X_I (BEFORE ?X_F)))
			(!W6 (?X_I (BEFORE ?X_B)))
			(!W7 (?X_A (BEFORE ?X_F)))
			(!W8 (?X_A (BEFORE ?X_B)))
			(!W9 (?X_D (BEFORE ?X_B)))
			(!W10 (?X_F (BEFORE ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (TO.P ?X_B)) GIVE.1.V) ?X_B ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_A WOMAN.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_B MAN.N))
			(!R4 (?X_C (PERTAIN-TO ?X_A)))
			(!R5 (?X_C NUMBER.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (?X_A HAVE.V ?X_C))
			(?I2 (NOT (?X_B HAVE.V ?X_C)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A HAVE.V ?X_C)))
			(?P2 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (SAME-TIME ?X_G)))
			(!W2 (?X_D (RIGHT-AFTER ?X_E)))
			(!W3 (?X_F (BEFORE ?X_G)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (TO.P ?X_B)) GIVE.2.V) ?X_B ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_A WOMAN.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_B MAN.N))
			(!R4 (?X_C (PERTAIN-TO ?X_A)))
			(!R5 (?X_C NUMBER.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (?X_A HAVE.V ?X_C))
			(?I2 (NOT (?X_B HAVE.V ?X_C)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A HAVE.V ?X_C)))
			(?P2 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_E)))
			(!W2 (?X_F (SAME-TIME ?X_E)))
			(!W3 (?X_F (RIGHT-AFTER ?X_G)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (TO.P ?X_B)) GIVE.3.V) ?X_B ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_A WOMAN.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_B MAN.N))
			(!R4 (?X_C (PERTAIN-TO ?X_A)))
			(!R5 (?X_C NUMBER.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (?X_A HAVE.V ?X_C))
			(?I2 (NOT (?X_B HAVE.V ?X_C)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A HAVE.V ?X_C)))
			(?P2 (?X_B HAVE.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (RIGHT-AFTER ?X_D)))
			(!W2 (?X_E (SAME-TIME ?X_G)))
			(!W3 (?X_F (BEFORE ?X_G)))
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
	(EPI-SCHEMA ((?X_R
	              (COMPOSITE-SCHEMA-6.PR (K (L X (AND (X GOOD.A) (X (TO.P ?X_R)))))
	               ?X_P ?X_Q))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I WAY.N))
			(!R2 (?X_I HOME.N))
			(!R3 (?X_Q NUMBER.N))
			(!R4 (?X_P MAN.N))
			(!R5 (?X_R WOMAN.N))
			(!R6 (?X_Q (PERTAIN-TO ?X_R)))
		)
		(:STEPS
			(?X_O (?X_R (KISS.V ?X_P)))
			(?X_M (?X_A (FEEL.V (K (L X (AND (X GOOD.A) (X (TO.P ?X_R))))))))
			(?X_K (?X_R ((ADV-A (TO.P ?X_P)) GIVE.2.V) ?X_P ?X_Q))
			(?X_D (?X_R ((ADV-A (TO.P ?X_P)) GIVE.1.V) ?X_P ?X_Q))
			(?X_D (?X_R ((ADV-A (TO.P ?X_P)) GIVE.3.V) ?X_P ?X_Q))
			(?X_H (?X_P (((ADV-A (ON.P ?X_I)) LOSE.V) ?X_Q)))
			(?X_F (?X_C (AGAIN.ADV MEET.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_M)))
			(!W2 (?X_O (BEFORE ?X_H)))
			(!W3 (?X_O (BEFORE ?X_F)))
			(!W4 (?X_M (BEFORE ?X_H)))
			(!W5 (?X_M (BEFORE ?X_F)))
			(!W6 (?X_K (BEFORE ?X_D)))
			(!W7 (?X_H (BEFORE ?X_F)))
		)
	)
	(
			"A woman kisses a man."
			"X_A feels good to."
			"A woman give.52s a man a number of a woman to a man."
			"A woman give.51s a man a number of a woman to a man."
			"A woman give.53s a man a number of a woman to a man."
			"A man loses a number of a woman on a way home."
			"X_C meets again."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (ON.P ?S))
	               ((ADV-A (IN.P ?S))
	                (DOWN.ADV ((ADV-A (WITH.P ?X_A)) SIT.1.V)))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (NOT (?S AGENT.N)))
			(!R3 (?S FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_A WOMAN.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L)))
			(?I2 (?S (AT.P ?L)))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-7.PR (K DIZZY.A) (K SICK.A))) ** ?E)
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
			"A man sit.59s on S in S down with a woman."
	)
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (IN.P ?X_A)) PLAY.2.V) ?O)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?X_A SNOW.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?O EXIST.V)))))
			(?G2 (?X_B (WANT.V (KA (HAVE.V ?O)))))
		)
		(:PRECONDS
			(?I1 (NOT (?O EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?O EXIST.V))
			(?P2 (?X_B (HAVE.V ?O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (IN.P ?X_A)) PLAY.3.V)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A SNOW.N))
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
		(:PARAPHRASES
			(?X_C (?X_B ((ADV-A (WITH.P ?T)) PLAY.3.V)))
			(?X_C (?X_B PLAY.3.V ?G))
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
	(EPI-SCHEMA ((?X_B PLAY.4.V) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A SNOWMAN.N))
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
		(:PARAPHRASES
			(?X_C (?X_B ((ADV-A (WITH.P ?T)) PLAY.4.V)))
			(?X_C (?X_B PLAY.4.V ?G))
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
	(EPI-SCHEMA ((?X_A MAKE.1.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_B SNOWMAN.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B EXIST.V)))))
			(?G2 (?X_A (WANT.V (KA (HAVE.V ?X_B)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B EXIST.V))
			(?P2 (?X_A (HAVE.V ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-8.PR (KA ((ADV-A (IN.P ?X_K)) PLAY.V)) ?O ?X_D))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D SNOWMAN.N))
			(!R2 (?X_K SNOW.N))
		)
		(:STEPS
			(?X_J (?X_A (LIKE.V (KA ((ADV-A (IN.P ?X_K)) PLAY.V)))))
			(?X_H (?X_A (OUTSIDE.ADV GO.V)))
			(?X_F (?X_A (((ADV-A (IN.P ?X_K)) PLAY.2.V) ?O)))
			(?X_F (?X_A ((ADV-A (IN.P ?X_K)) PLAY.3.V)))
			(?X_C (?X_A PLAY.4.V))
			(?X_C (?X_A MAKE.1.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_F (BEFORE ?X_C)))
		)
	)
	(
			"X_A likes in a snow playing."
			"X_A goes outside."
			"X_A play.65s O in a snow."
			"X_A play.63s in a snow."
			"X_A play.64s."
			"X_A make.66s a snowman."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-9.PR ?X_B)) ** ?E)
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
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FROM.P ?L1)) ((ADV-A (THROUGH.P ?X_A)) WALK.1.V))
	               ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PLUR WOOD.N)))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) WALK.1.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) WALK.1.V)))))
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
	(EPI-SCHEMA ((?X_A MAKE.2.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A ANIMAL.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_B FUNNY.A))
			(!R4 (?X_B SOUND.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B EXIST.V)))))
			(?G2 (?X_A (WANT.V (KA (HAVE.V ?X_B)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B EXIST.V))
			(?P2 (?X_A (HAVE.V ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-10.PR ?X_K (K CLOSER.A) ?L2 ?X_H)) ** ?E)
		(:ROLES
			(!R1 (?X_C FOX.N))
			(!R2 (?X_H FUNNY.A))
			(!R3 (?X_H SOUND.N))
			(!R4 (?X_K ANIMAL.N))
			(!R5 (?X_N (PLUR WOOD.N)))
			(!R6 (?X_O AGENT.N))
		)
		(:STEPS
			(?X_M
	   (?X_O (((ADV-A (FROM.P ?L1)) ((ADV-A (THROUGH.P ?X_N)) WALK.1.V)) ?L2)))
			(?X_J (?X_O (HEAR.V ?X_K)))
			(?X_G (?X_K MAKE.2.V ?X_H))
			(?X_E (?X_O (GET.V (K CLOSER.A))))
			(?X_B (?X_K (OUT.PRT ((ADV-A (FOR.P (KA (BE.V ?X_C)))) TURN.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_J)))
			(!W2 (?X_M (BEFORE ?X_G)))
			(!W3 (?X_M (BEFORE ?X_E)))
			(!W4 (?X_M (BEFORE ?X_B)))
			(!W5 (?X_J (BEFORE ?X_G)))
			(!W6 (?X_J (BEFORE ?X_E)))
			(!W7 (?X_J (BEFORE ?X_B)))
			(!W8 (?X_G (BEFORE ?X_E)))
			(!W9 (?X_G (BEFORE ?X_B)))
			(!W10 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A agent walk.74s L2 from L1 through a woods."
			"A agent hears a animal."
			"A animal make.75s a funny sound."
			"A agent gets closer."
			"A animal turns out for being a fox."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.1.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B CANDY.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
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
	(EPI-SCHEMA (((ADV-E (DURING (K YESTERDAY.N)))
	              (?X_A
	               (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K (PLUR CV.N)))) GO.3.V))
	                ?L2)))
	             ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.3.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.3.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-11.PR ?X_C ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_C CANDY.N))
			(!R2 (?X_F AGENT.N))
		)
		(:STEPS
			(?X_E
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_F
	     (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K (PLUR CV.N)))) GO.3.V)) ?L2))))
			(?X_B (?X_F GET.1.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A agent go.82s L2 DURING yesterday from L1 to cvs."
			"A agent get.81s a candy."
	)
)



(
	(EPI-SCHEMA ((?X_A ((JUST.ADV GET.2.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_A HAPPY.A))
			(!R6 (?X_B RING.N))
			(!R7 (?X_B NEW.A))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
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
	(EPI-SCHEMA ((MUST.AUX-S (?X_A (GET.3.V (ANOTHER.D ONE.N)))) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT ((ANOTHER.D ONE.N) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (ANOTHER.D ONE.N))))
			(!R5 (?X_A HAPPY.A))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V (ANOTHER.D ONE.N)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V (ANOTHER.D ONE.N))))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 ((ANOTHER.D ONE.N) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V (ANOTHER.D ONE.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_B))
			(!W2 (?I1 PRECOND-OF ?X_B))
			(!W3 (?I2 PRECOND-OF ?X_B))
			(!W4 (?I3 PRECOND-OF ?X_B))
			(!W5 (?P1 POSTCOND-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-12.PR (K LOST.A) ?X_M ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_K MAN.N))
			(!R2 (?X_M MOM.N))
			(!R3 (?X_M (PERTAIN-TO ?X_L)))
			(!R4 (?X_N BOY.N))
			(!R5 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_D (?X_N (GET.V (K LOST.A))))
			(?X_F (?X_N (TO.P ?X_M)))
			(?X_A (?X_N ((ADV-A (TO.P ?X_M)) CALL.V)))
			(?X_H (?X_N ((ADV-A (INTO.P ?X_K)) RUN.V)))
			(?X_J (?X_K ?X_N (TO.P ?X_M)))
			(?X_B (?X_K (((ADV-A (TO.P ?X_M)) BRING.V) ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_A)))
			(!W3 (?X_D (BEFORE ?X_H)))
			(!W4 (?X_D (BEFORE ?X_J)))
			(!W5 (?X_D (BEFORE ?X_B)))
			(!W6 (?X_F (BEFORE ?X_A)))
			(!W7 (?X_F (BEFORE ?X_H)))
			(!W8 (?X_F (BEFORE ?X_J)))
			(!W9 (?X_F (BEFORE ?X_B)))
			(!W10 (?X_A (BEFORE ?X_H)))
			(!W11 (?X_A (BEFORE ?X_J)))
			(!W12 (?X_A (BEFORE ?X_B)))
			(!W13 (?X_H (BEFORE ?X_J)))
			(!W14 (?X_H (BEFORE ?X_B)))
			(!W15 (?X_J (BEFORE ?X_B)))
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
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-13.PR (K (SO.ADV SAD.A)) ?X_J)) ** ?E)
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
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_A)) SKIP.V)))) TAKE.1.V)
	               ?O))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?O)))
			(!R5 (?X_A VET.N))
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
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-14.PR (K SICK.A) ?O)) ** ?E)
		(:ROLES
			(!R1 (?X_D VET.N))
			(!R2 (?X_G DAY.N))
			(!R3 (?X_G SKIP.V))
		)
		(:STEPS
			(?X_F (?X_G (GET.V (K SICK.A))))
			(?X_C
	   (?X_A (((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_D)) SKIP.V)))) TAKE.1.V) ?O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_C)))
		)
	)
	(
			"A day skipping gets sick."
			"X_A take.135s O for to a vet skipping."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.4.V (ANOTHER.D CAT.N)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT ((ANOTHER.D CAT.N) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (ANOTHER.D CAT.N))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V (ANOTHER.D CAT.N)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V (ANOTHER.D CAT.N))))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 ((ANOTHER.D CAT.N) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V (ANOTHER.D CAT.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_B))
			(!W2 (?I1 PRECOND-OF ?X_B))
			(!W3 (?I2 PRECOND-OF ?X_B))
			(!W4 (?I3 PRECOND-OF ?X_B))
			(!W5 (?P1 POSTCOND-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A GET.5.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B KITTEN.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
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
	(EPI-SCHEMA (((K SUSIE.N)
	              (COMPOSITE-SCHEMA-15.PR (KE ((K OIL.N) GREAT.A)) (KA (BUY.V MORE.A))
	               (K OIL.N)))
	             ** ?E)
		(:STEPS
			(?X_B ((K SUSIE.N) (THINK.V (KE ((K OIL.N) GREAT.A)))))
			(?X_D ((K SUSIE.N) (WANT.V (KA (BUY.V MORE.A)))))
			(?X_F ((K SUSIE.N) (LOVE.V (K OIL.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_D)))
			(!W2 (?X_B (BEFORE ?X_F)))
			(!W3 (?X_D (BEFORE ?X_F)))
		)
	)
	(
			"Susie thinks oil great."
			"Susie wants buying more."
			"Susie loves oil."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FROM.P ?X_A)) ((ADV-A (FROM.P ?X_A)) RUN.1.V)) ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B HARE.N))
			(!R2 (?X_A LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_A = ?L2)))
			(!R5 (?X_A DOG.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?X_A)))
			(?I2 (NOT (?X_B (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?X_A))))
			(?P2 (?X_B (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?X_A)) ((ADV-A (TO.P ?L2)) RUN.1.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?X_A)) ((ADV-A (TO.P ?L2)) RUN.1.V)))))
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
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-16.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?X_D HARE.N))
		)
		(:STEPS
			(?X_B (?X_D (((ADV-A (FROM.P ?X_C)) ((ADV-A (FROM.P ?X_C)) RUN.1.V)) ?L2)))
		)
	)
	(
			"A hare run.145s L2 from a dog from a dog."
	)
)



(
	(EPI-SCHEMA ((?X_C (((ADV-A (TO.P ?X_A)) TAKE.2.V) ?X_D)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_A SHOP.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B (PLUR FRIEND.N)))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (TO.P ?X_A)) INFORM.1.V) ?X_D ?I)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?X_D AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?X_A SHOP.N))
			(!R5 (?X_B (PLUR FRIEND.N)))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_D (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_E ((?X_C TELL.V ?X_D ?I) ** ?X_E))
			(?X_E ((?X_C LET.V ?X_D (KA (KNOW.V ?I))) ** ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-17.PR ?X_L (K BLUE.A)
	               (K (L X (AND (X (PASV PAINT.V)) (X BLUE.A)))) ?X_A ?I))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G SHOP.N))
			(!R2 (?X_M (PLUR FRIEND.N)))
			(!R3 (?X_L NEW.A))
			(!R4 (?X_L CAR.N))
			(!R5 (?X_L COLOR.N))
			(!R6 (?X_N MAN.N))
			(!R7 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_K (?X_N (WANT.V ?X_L)))
			(?X_I (?X_M (SAY.V (K BLUE.A))))
			(?X_F (?X_N (((ADV-A (TO.P ?X_G)) TAKE.2.V) ?X_A)))
			(?X_F (?X_N (((ADV-A (TO.P ?X_G)) INFORM.1.V) ?X_A ?I)))
			(?X_D (?X_A (GET.V (K (L X (AND (X (PASV PAINT.V)) (X BLUE.A)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_F)))
			(!W3 (?X_K (BEFORE ?X_D)))
			(!W4 (?X_I (BEFORE ?X_F)))
			(!W5 (?X_I (BEFORE ?X_D)))
			(!W6 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A man wants a new car color."
			"A friends of a man say blue."
			"A man take.150s X_A to a shop."
			"A man inform.154s X_A.SK I to a shop."
			"X_A gets PASV paints blue."
		error composing story schemas
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_A (((ADV-A (FROM.P ?L1)) (OVER.PRT FALL.1.V)) ?L2)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A COW.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) FALL.1.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) FALL.1.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) DIE.1.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A COW.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) DIE.1.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) DIE.1.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) FALL.2.V) (K ASLEEP.A)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A COW.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K ASLEEP.A) LOCATION.N))
			(!R4 (NOT (?L1 = (K ASLEEP.A))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P (K ASLEEP.A))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (K ASLEEP.A)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (K ASLEEP.A))))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P (K ASLEEP.A)))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K ASLEEP.A))) FALL.2.V)))
	    (K ASLEEP.A)))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P (K ASLEEP.A)))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K ASLEEP.A))) FALL.2.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
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
	              (COMPOSITE-SCHEMA-18.PR (K (UP.ADV (TO.P ?X_L))) ?X_L ?L2
	               (K ASLEEP.A)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I MAN.N))
			(!R2 (?X_L COW.N))
		)
		(:STEPS
			(?X_K (?X_L ((ADV-A (FROM.P ?L1)) FALL.2.V) (K ASLEEP.A)))
			(?X_H (?X_I (GO.V (K (UP.ADV (TO.P ?X_L))))))
			(?X_F (?X_I (PUSH.V ?X_L)))
			(?X_D (?X_L (((ADV-A (FROM.P ?L1)) (OVER.PRT FALL.1.V)) ?L2)))
			(?X_B (?X_L ((ADV-A (FROM.P ?L1)) DIE.1.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_H)))
			(!W2 (?X_K (BEFORE ?X_F)))
			(!W3 (?X_K (BEFORE ?X_D)))
			(!W4 (?X_K (BEFORE ?X_B)))
			(!W5 (?X_H (BEFORE ?X_F)))
			(!W6 (?X_H (BEFORE ?X_D)))
			(!W7 (?X_H (BEFORE ?X_B)))
			(!W8 (?X_F (BEFORE ?X_D)))
			(!W9 (?X_F (BEFORE ?X_B)))
			(!W10 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A cow fall.166s asleep from L1."
			"A man goes up to a cow."
			"A man pushes a cow."
			"A cow fall.167s L2 from L1 over."
			"A cow die.169s L2 from L1."
	)
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (IN.P ?C)) (AWAY.ADV PUT.1.V)) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?C CONTAINER.N))
			(!R4 (NOT (?C AGENT.N)))
			(!R5 (?X_C SMALLER-THAN ?C))
			(!R6 (?X_C (PLUR CLOTHE.N)))
			(!R7 (?X_A WIFE.N))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (IN.P ?C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C (IN.P ?C))))
		)
		(:POSTCONDS
			(?P1 (?X_C (IN.P ?C)))
		)
		(:PARAPHRASES
			(?X_D (?X_B ((ADV-A (INTO.P ?C)) PUT.1.V) ?X_C))
			(?X_D (?X_B ((ADV-A (INSIDE.P ?C)) PUT.1.V) ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
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
	              (((ADV-A (FROM.P ?L1))
	                ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_A)) LOOK.V)))) GO.4.V))
	               ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PLUR CLOTHE.N)))
			(!R6 (?X_B WIFE.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.4.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.4.V)))))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-19.PR (K GONE.A) ?X_M ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_N WIFE.N))
			(!R2 (?X_H DAY.N))
			(!R3 (?X_H NEXT.A))
			(!R4 (?X_M (PLUR CLOTHE.N)))
			(!R5 (?X_O MAN.N))
			(!R6 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_L (?X_O (FOLD.V ?X_M)))
			(?X_C (?X_N (REFOLD.V ?X_M)))
			(?X_J (?X_O (((ADV-A (IN.P ?C)) (AWAY.ADV PUT.1.V)) ?X_M)))
			(?X_G ((ADV-E (DURING ?X_H)) (?X_M (BE.V (K GONE.A)))))
			(?X_E
	   (?X_O
	    (((ADV-A (FROM.P ?L1))
	      ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_M)) LOOK.V)))) GO.4.V))
	     ?L2)))
			(?X_A (?X_N (REFOLD.V ?X_M)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_J)))
			(!W2 (?X_L (BEFORE ?X_G)))
			(!W3 (?X_L (BEFORE ?X_E)))
			(!W4 (?X_L (BEFORE ?X_A)))
			(!W5 (?X_C (BEFORE ?X_A)))
			(!W6 (?X_J (BEFORE ?X_G)))
			(!W7 (?X_J (BEFORE ?X_E)))
			(!W8 (?X_J (BEFORE ?X_A)))
			(!W9 (?X_G (BEFORE ?X_E)))
			(!W10 (?X_G (BEFORE ?X_A)))
			(!W11 (?X_E (BEFORE ?X_A)))
		)
	)
	(
			"A man folds a clothes."
			"A wife of a man refolds a clothes."
			"A man put.181s a clothes in C away."
			"A clothes is gone DURING a day next."
			"A man go.174s L2 from L1 for for a clothes looking."
			"A wife of a man refolds a clothes."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-20.PR ?X_B)) ** ?E)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) RUN.2.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.2.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.2.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) RUN.3.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PLUR DOG.N)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.3.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.3.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-21.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_C (PLUR DOG.N)))
			(!R2 (?X_F DOG.N))
		)
		(:STEPS
			(?X_E (?X_F ((ADV-A (FROM.P ?L1)) RUN.2.V) ?L2))
			(?X_B (?X_C ((ADV-A (FROM.P ?L1)) RUN.3.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A dog run.202s L2 from L1."
			"A dogs run.203 L2 from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-22.PR ?X_B)) ** ?E)
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
	(EPI-SCHEMA ((?X_B (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) GO.5.V)) ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B (PLUR GIRL.N)))
			(!R6 (?X_A POND.N))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.5.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.5.V)))))
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
	(EPI-SCHEMA ((?X_A ((HOME.ADV TAKE.3.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_A (PLUR GIRL.N)))
			(!R6 (?X_B GIANT.A))
			(!R7 (?X_B FROG.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
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
	(EPI-SCHEMA ((?X_A
	              (((ADV-A (IN.P ?X_C)) ((ADV-A (IN.P ?X_C)) PUT.2.V)) ?X_B))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_C BUCKET.N))
			(!R4 (NOT (?X_C AGENT.N)))
			(!R5 (?X_B SMALLER-THAN ?X_C))
			(!R6 (?X_B GIANT.A))
			(!R7 (?X_B FROG.N))
			(!R8 (?X_A (PLUR GIRL.N)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (IN.P ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B (IN.P ?X_C))))
		)
		(:POSTCONDS
			(?P1 (?X_B (IN.P ?X_C)))
		)
		(:PARAPHRASES
			(?X_D (?X_A ((ADV-A (INTO.P ?X_C)) PUT.2.V) ?X_B))
			(?X_D (?X_A ((ADV-A (INSIDE.P ?X_C)) PUT.2.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_F)))
			(!W2 (?X_E (AT-ABOUT ?X_F)))
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
	              (COMPOSITE-SCHEMA-23.PR (K ((ADV-A (FOR.P ?X_C)) (WITH.P ?X_O))) ?L2
	               ?X_K))
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
			(?X_M (?X_O (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_N)) GO.5.V)) ?L2)))
			(?X_J (?X_O (CATCH.V ?X_K)))
			(?X_H (?X_O ((HOME.ADV TAKE.3.V) ?X_K)))
			(?X_E (?X_O (((ADV-A (IN.P ?X_F)) ((ADV-A (IN.P ?X_F)) PUT.2.V)) ?X_K)))
			(?X_B (?X_K (LIVE.V (K ((ADV-A (FOR.P ?X_C)) (WITH.P ?X_O))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_J)))
			(!W2 (?X_M (BEFORE ?X_H)))
			(!W3 (?X_M (BEFORE ?X_E)))
			(!W4 (?X_M (BEFORE ?X_B)))
			(!W5 (?X_J (BEFORE ?X_H)))
			(!W6 (?X_J (BEFORE ?X_E)))
			(!W7 (?X_J (BEFORE ?X_B)))
			(!W8 (?X_H (BEFORE ?X_B)))
			(!W9 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A girls go.235 L2 from L1 to a pond."
			"A girls catch a giant frog."
			"A girls take.232 a giant frog home."
			"A girls put.225 a giant frog in a bucket in a bucket."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              (COMPOSITE-SCHEMA-24.PR (KE (?X_E (VERY.ADV UNCOMFORTABLE.A)))
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
	(EPI-SCHEMA ((?X_A WATCH.1.V (KE (?X_B BURN.V))) ** ?X_C)
		(:ROLES
			(!R1 (?X_A GIRL.N))
			(!R2 ((KE (?X_B BURN.V)) ENTITY.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?I PERTAIN-TO (KE (?X_B BURN.V))))
			(!R5 (?X_B DOLL.N))
			(!R6 (?X_B (ON.P (K FIRE.N))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (KNOW.V ?I))))))
		)
		(:PRECONDS
			(?I1 (?X_A (CAN.MD (SEE.V (KE (?X_B BURN.V))))))
		)
		(:POSTCONDS
			(?P1 ((KE (?X_B BURN.V)) (KNOW.V ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
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
	              (COMPOSITE-SCHEMA-25.PR (KE (?X_I FUNNY.A)) ?X_C
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
			"A girl watch.5s a doll on fire burns."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (IN.P ?X_D)) ((ADV-A (IN.P ?X_D)) PUT.3.V)) (K HAY.N)))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT ((K HAY.N) AGENT.N)))
			(!R3 (?X_D CONTAINER.N))
			(!R4 (NOT (?X_D AGENT.N)))
			(!R5 ((K HAY.N) SMALLER-THAN ?X_D))
			(!R6 (?X_C (HAS.V (SET-OF (TWO.D (PLUR FOX.N)) (TWO.D (PLUR BOX.N))))))
			(!R7
	   (?X_D
	    (ARE.V (KE ((K (L X (AND (X GOOD.A) (X (PLUR HOUSE.N))))) (FOR.P ?X_B))))))
			(!R8 (?X_D (PLUR BOX.N)))
			(!R9 (?X_B (PERTAIN-TO ?X_C)))
			(!R10 (?X_B (PLUR FOX.N)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT ((K HAY.N) (IN.P ?X_D))))))
		)
		(:PRECONDS
			(?I1 (NOT ((K HAY.N) (IN.P ?X_D))))
		)
		(:POSTCONDS
			(?P1 ((K HAY.N) (IN.P ?X_D)))
		)
		(:PARAPHRASES
			(?X_E (?X_C ((ADV-A (INTO.P ?X_D)) PUT.3.V) (K HAY.N)))
			(?X_E (?X_C ((ADV-A (INSIDE.P ?X_D)) PUT.3.V) (K HAY.N)))
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
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-26.PR (SET-OF ?X_K ?X_J) (EACH.D FOX.N) ?X_A
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
			"A has two foxs and two boxs put.10s hay in a are good house for a foxs of a has two foxs and two boxs boxs in a are good house for a foxs of a has two foxs and two boxs boxs."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FROM.P ?L1)) ((ADV-A (THROUGH.P ?X_A)) STROLL.1.V))
	               ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B CAT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A HOUSE.N))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) STROLL.1.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) STROLL.1.V)))))
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
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-27.PR (KE (?X_L FUNNY.A)) ?X_H (K PINK.A)
	               (KA ((ADV-A (WITH.P (K PINK.A))) PLAY.V)) ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H (K PINK.A) BALL.N))
			(!R2 (?X_H (ON.P ?X_I)))
			(!R3 (?X_L THING.N))
			(!R4 (?X_O HOUSE.N))
			(!R5 (?X_P CAT.N))
		)
		(:STEPS
			(?X_N
	   (?X_P (((ADV-A (FROM.P ?L1)) ((ADV-A (THROUGH.P ?X_O)) STROLL.1.V)) ?L2)))
			(?X_K (?X_P (FIND.V (KE (?X_L FUNNY.A)))))
			(?X_G (?X_A (BE.V ?X_H)))
			(?X_E (?X_P (SWAT.V (K PINK.A))))
			(?X_C (?X_P (LIKE.V (KA ((ADV-A (WITH.P (K PINK.A))) PLAY.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_K)))
			(!W2 (?X_N (BEFORE ?X_G)))
			(!W3 (?X_N (BEFORE ?X_E)))
			(!W4 (?X_N (BEFORE ?X_C)))
			(!W5 (?X_K (BEFORE ?X_G)))
			(!W6 (?X_K (BEFORE ?X_E)))
			(!W7 (?X_K (BEFORE ?X_C)))
			(!W8 (?X_G (BEFORE ?X_E)))
			(!W9 (?X_G (BEFORE ?X_C)))
			(!W10 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A cat stroll.29s L2 from L1 through a house."
			"A cat finds a thing funny."
			"X_A is a on X_I."
			"A cat swats pink."
			"A cat likes with pink playing."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-28.PR (KE (?X_C (PLAY.V (K BALL.N)))))) ** ?E)
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
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FROM.P ?L1)) ((ADV-A (AROUND.P ?X_A)) RIDE.1.V)) ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A TOWN.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B (PLUR BIKE.N)))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RIDE.1.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RIDE.1.V)))))
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
	(EPI-SCHEMA ((?X_B ((TOGETHER.ADV GET.6.V) ?X_C)) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_A TOWN.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C (PERTAIN-TO ?X_B)))
			(!R6 (?X_C (PLUR BIKE.N)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?X_A)))
			(?I3 (?X_C (AT.P ?X_A)))
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
			(!W6 (?X_E (RIGHT-AFTER ?X_D)))
			(!W7 (?X_E (SAME-TIME ?X_G)))
			(!W8 (?X_F (BEFORE ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B ((TOGETHER.ADV GET.7.V) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_A TOWN.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C (PLUR BIKE.N)))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?X_A)))
			(?I3 (?X_C (AT.P ?X_A)))
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
			(!W6 (?X_D (SAME-TIME ?X_G)))
			(!W7 (?X_D (RIGHT-AFTER ?X_E)))
			(!W8 (?X_F (BEFORE ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B ((TOGETHER.ADV GET.8.V) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_A TOWN.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C (PLUR BIKE.N)))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?X_A)))
			(?I3 (?X_C (AT.P ?X_A)))
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
			(!W6 (?X_D (BEFORE ?X_E)))
			(!W7 (?X_F (SAME-TIME ?X_E)))
			(!W8 (?X_F (RIGHT-AFTER ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-29.PR (KA ((ADV-A (TO.P ?X_A)) GO.V)))) ** ?E)
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
	              (COMPOSITE-SCHEMA-30.PR ?X_C (K (VERY.ADV HIGH.A))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-31.PR ?X_E)) ** ?E)
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
	(EPI-SCHEMA ((?X_A GET.9.V (K (BACK.ADV (IN.P ?X_B)))) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT ((K (BACK.ADV (IN.P ?X_B))) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (K (BACK.ADV (IN.P ?X_B))))))
			(!R5 (?X_B SHOWER.V))
			(!R6 (?X_B WARM.A))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V (K (BACK.ADV (IN.P ?X_B)))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V (K (BACK.ADV (IN.P ?X_B))))))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 ((K (BACK.ADV (IN.P ?X_B))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V (K (BACK.ADV (IN.P ?X_B)))))
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
	(EPI-SCHEMA ((?X_A ((OUT.PRT GET.10.V) ?O)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?O)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?O)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?O (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_B))
			(!W2 (?I1 PRECOND-OF ?X_B))
			(!W3 (?I2 PRECOND-OF ?X_B))
			(!W4 (?I3 PRECOND-OF ?X_B))
			(!W5 (?P1 POSTCOND-OF ?X_B))
			(!W6 (?X_C (AFTER ?X_B)))
			(!W7 (?X_C (AT-ABOUT ?X_D)))
			(!W8 (?X_E (AT-ABOUT ?X_D)))
			(!W9 (?X_E (AFTER ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A TAKE.4.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B WARM.A))
			(!R6 (?X_B SHOWER.V))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-32.PR ?X_K)) ** ?E)
		(:ROLES
			(!R1 (?X_B APPLE.N))
			(!R2 (?X_B TREE.N))
			(!R3 (?X_I INTEREST.N))
			(!R4 (?X_J LITTLE.A))
			(!R5 (?X_J BOY.N))
			(!R6 (?X_I (PERTAIN-TO ?X_J)))
			(!R7 (?X_K APPLE.N))
			(!R8 (?X_K FALL.N))
		)
		(:STEPS
			(?X_D (?X_J ((ADV-A (UNDER.P ?X_B)) SIT.V)))
			(?X_F (?X_J (SEE.V ?X_K)))
			(?X_H (?X_I SOAR.V))
			(?X_A (?X_I SOAR.V))
			(?X_M (?X_J (((ADV-A (FOR.P (K (PLUR YEAR.N)))) STUDY.V) ?X_K)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_H)))
			(!W3 (?X_D (BEFORE ?X_A)))
			(!W4 (?X_D (BEFORE ?X_M)))
			(!W5 (?X_F (BEFORE ?X_H)))
			(!W6 (?X_F (BEFORE ?X_A)))
			(!W7 (?X_F (BEFORE ?X_M)))
			(!W8 (?X_H (BEFORE ?X_A)))
			(!W9 (?X_H (BEFORE ?X_M)))
			(!W10 (?X_A (BEFORE ?X_M)))
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
	(EPI-SCHEMA ((?X_A WATCH.2.V ?X_B) ** ?X_E)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?X_B WOMAN.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?I PERTAIN-TO ?X_B))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (KNOW.V ?I))))))
		)
		(:PRECONDS
			(?X_C (?X_A ((CAN.MD (INSIDE.ADV SEE.V)) ?X_B)))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V ?I)))
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
	(EPI-SCHEMA ((?X_A WATCH.3.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?X_B WOMAN.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?I PERTAIN-TO ?X_B))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (KNOW.V ?I))))))
		)
		(:PRECONDS
			(?X_E (?X_A ((CAN.MD (INSIDE.ADV SEE.V)) ?X_B)))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V ?I)))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-33.PR ?X_O ?X_C ?X_J)) ** ?E)
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
			(?X_G (?X_O WATCH.2.V ?X_J))
			(?X_G (?X_O WATCH.3.V ?X_J))
			(?X_E (?X_J (((ADV-A (FOR.P (KA WATCH.V))) NOTICE.V) ?X_O)))
			(?X_B (?X_J (CALL.V ?X_C)))
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
			"A man watch.100s a woman."
			"A man watch.102s a woman."
			"A woman notices a man for watching."
			"A woman calls a police."
	)
)



(
	(EPI-SCHEMA ((?X_C PLAY.5.V) ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 ((KE ((K MONEY.N) (FOR.P (?X_B BET.N)))) TOY.N))
			(!R3 (NOT ((KE ((K MONEY.N) (FOR.P (?X_B BET.N)))) AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A BET.N))
			(!R7 (?X_B MORE.A))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?X_F (?X_C ((ONLY.ADV HAVE.V) (KE ((K MONEY.N) (FOR.P (?X_B BET.N)))))))
		)
		(:POSTCONDS
			(?P1 (?X_C EXPERIENCE.V (K PLEASURE.N)))
		)
		(:PARAPHRASES
			(?X_D
	   (?X_C ((ADV-A (WITH.P (KE ((K MONEY.N) (FOR.P (?X_B BET.N)))))) PLAY.5.V)))
			(?X_D (?X_C PLAY.5.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_D (AT-ABOUT ?X_E)))
			(!W3 (?X_F (AT-ABOUT ?X_G)))
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
	(EPI-SCHEMA ((?X_C PLAY.6.V) ** ?X_F)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 ((KE ((K MONEY.N) (FOR.P (?X_B BET.N)))) TOY.N))
			(!R3 (NOT ((KE ((K MONEY.N) (FOR.P (?X_B BET.N)))) AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_B MORE.A))
			(!R7 (?X_A BET.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?X_D (?X_C ((ONLY.ADV HAVE.V) (KE ((K MONEY.N) (FOR.P (?X_B BET.N)))))))
		)
		(:POSTCONDS
			(?P1 (?X_C EXPERIENCE.V (K PLEASURE.N)))
		)
		(:PARAPHRASES
			(?X_F
	   (?X_C ((ADV-A (WITH.P (KE ((K MONEY.N) (FOR.P (?X_B BET.N)))))) PLAY.6.V)))
			(?X_F (?X_C PLAY.6.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_D (AT-ABOUT ?X_E)))
			(!W3 (?X_F (AT-ABOUT ?X_G)))
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
	(EPI-SCHEMA ((?X_A MAKE.3.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_B BET.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B EXIST.V)))))
			(?G2 (?X_A (WANT.V (KA (HAVE.V ?X_B)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B EXIST.V))
			(?P2 (?X_A (HAVE.V ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-34.PR (KE ((K MONEY.N) (FOR.P (?X_H BET.N))))
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
			(?X_L (?X_N PLAY.5.V))
			(?X_L (?X_N PLAY.6.V))
			(?X_L (?X_N MAKE.3.V ?X_M))
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
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_G)))
			(!W2 (?X_J (BEFORE ?X_E)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_G
	              (((ADV-A (IN.P ?X_A)) GET.11.V)
	               (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H)))))
	             ** ?X_I)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2 (NOT ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))) AGENT.N)))
			(!R3 (?X_F HOME.N))
			(!R4 (NOT (?X_G = (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))))))
			(!R5 (?X_G (PLUR CHILD.N)))
			(!R6 (?X_A ROW.N))
			(!R7 (?X_A BOAT.N))
			(!R8 (?X_H WATER.N))
			(!R9 (?X_F HOUSE.N))
			(!R10 (?X_F (PERTAIN-TO ?X_D)))
			(!R11 (?X_B HOOK.N))
			(!R12 (?X_D (HAS.V ?X_B)))
			(!R13 (?X_C FATHER.N))
			(!R14 (?X_C (PERTAIN-TO ?X_D)))
			(!R15 (?X_D (HAS.V ?X_E)))
			(!R16 (?X_E BOAT.N))
			(!R17 (?X_E NEW.A))
		)
		(:GOALS
			(?G1
	   (?X_G
	    (WANT.V (THAT (?X_G (HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H)))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_G HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))))))
			(?I2 (?X_G (AT.P ?X_F)))
			(?I3 ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))) (AT.P ?X_F)))
		)
		(:POSTCONDS
			(?P1 (?X_G HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_I))
			(!W2 (?I1 PRECOND-OF ?X_I))
			(!W3 (?I2 PRECOND-OF ?X_I))
			(!W4 (?I3 PRECOND-OF ?X_I))
			(!W5 (?P1 POSTCOND-OF ?X_I))
			(!W6 (?X_I (AFTER ?X_J)))
			(!W7 (?X_J (AT-ABOUT ?X_K)))
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
	              (((ADV-A (IN.P ?X_A)) GET.12.V)
	               (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H)))))
	             ** ?X_I)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2 (NOT ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))) AGENT.N)))
			(!R3 (?X_F HOME.N))
			(!R4 (NOT (?X_G = (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))))))
			(!R5 (?X_A ROW.N))
			(!R6 (?X_A BOAT.N))
			(!R7 (?X_H WATER.N))
			(!R8 (?X_G (PLUR CHILD.N)))
			(!R9 (?X_F HOUSE.N))
			(!R10 (?X_F (PERTAIN-TO ?X_D)))
			(!R11 (?X_B BOAT.N))
			(!R12 (?X_D (HAS.V ?X_B)))
			(!R13 (?X_B NEW.A))
			(!R14 (?X_C HOOK.N))
			(!R15 (?X_D (HAS.V ?X_C)))
			(!R16 (?X_E (PERTAIN-TO ?X_D)))
			(!R17 (?X_E FATHER.N))
		)
		(:GOALS
			(?G1
	   (?X_G
	    (WANT.V (THAT (?X_G (HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H)))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_G HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))))))
			(?I2 (?X_G (AT.P ?X_F)))
			(?I3 ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))) (AT.P ?X_F)))
		)
		(:POSTCONDS
			(?P1 (?X_G HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_I))
			(!W2 (?I1 PRECOND-OF ?X_I))
			(!W3 (?I2 PRECOND-OF ?X_I))
			(!W4 (?I3 PRECOND-OF ?X_I))
			(!W5 (?P1 POSTCOND-OF ?X_I))
			(!W6 (?X_I (AFTER ?X_J)))
			(!W7 (?X_J (AT-ABOUT ?X_K)))
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
	              (((ADV-A (IN.P ?X_A)) GET.13.V)
	               (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H)))))
	             ** ?X_I)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2 (NOT ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))) AGENT.N)))
			(!R3 (?X_F HOME.N))
			(!R4 (NOT (?X_G = (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))))))
			(!R5 (?X_G (PLUR CHILD.N)))
			(!R6 (?X_A BOAT.N))
			(!R7 (?X_A ROW.N))
			(!R8 (?X_H WATER.N))
			(!R9 (?X_F HOUSE.N))
			(!R10 (?X_F (PERTAIN-TO ?X_D)))
			(!R11 (?X_B NEW.A))
			(!R12 (?X_D (HAS.V ?X_B)))
			(!R13 (?X_B BOAT.N))
			(!R14 (?X_C (PERTAIN-TO ?X_D)))
			(!R15 (?X_C FATHER.N))
			(!R16 (?X_E HOOK.N))
			(!R17 (?X_D (HAS.V ?X_E)))
		)
		(:GOALS
			(?G1
	   (?X_G
	    (WANT.V (THAT (?X_G (HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H)))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_G HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))))))
			(?I2 (?X_G (AT.P ?X_F)))
			(?I3 ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))) (AT.P ?X_F)))
		)
		(:POSTCONDS
			(?P1 (?X_G HAVE.V (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_I))
			(!W2 (?I1 PRECOND-OF ?X_I))
			(!W3 (?I2 PRECOND-OF ?X_I))
			(!W4 (?I3 PRECOND-OF ?X_I))
			(!W5 (?P1 POSTCOND-OF ?X_I))
			(!W6 (?X_I (AFTER ?X_J)))
			(!W7 (?X_J (AT-ABOUT ?X_K)))
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
	              (COMPOSITE-SCHEMA-35.PR ?X_R ?X_P ?X_L ?X_I
	               (K (L X (AND (X OUT.P) (X (OF.P (THE.D BOAT.N))))))
	               (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_F)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F WATER.N))
			(!R2 (?X_G ROW.N))
			(!R3 (?X_G BOAT.N))
			(!R4 (?X_H (PLUR CHILD.N)))
			(!R5 (?X_I RIVER.N))
			(!R6 (?X_L GOOD.A))
			(!R7 (?X_L (PLUR OAR.N)))
			(!R8 (?X_O HOUSE.N))
			(!R9 (?X_O HOME.N))
			(!R10 (?X_O (PERTAIN-TO ?X_R)))
			(!R11 (?X_P NEW.A))
			(!R12 (?X_P BOAT.N))
			(!R13 (?X_R (HAS.V ?X_P)))
			(!R14 (?X_Q FATHER.N))
			(!R15 (?X_Q (PERTAIN-TO ?X_R)))
			(!R16 (?X_S HOOK.N))
			(!R17 (?X_R (HAS.V ?X_S)))
		)
		(:STEPS
			(?X_N (?X_Q (GIVE.V ?X_P ?X_R)))
			(?X_B (?X_Q (((ADV-A (TO.P ?X_R)) GIVE.V) ?X_P)))
			(?X_K (?X_R (((ADV-A (AT.P ?X_O)) KEEP.V) ?X_L)))
			(?X_D (?X_O (NEAR.P ?X_I)))
			(?X_C
	   (NOT (?X_H (FALL.V (K (L X (AND (X OUT.P) (X (OF.P (THE.D BOAT.N))))))))))
			(?X_E
	   (?X_H
	    (((ADV-A (IN.P ?X_G)) GET.11.V) (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_F))))))
			(?X_E
	   (?X_H
	    (((ADV-A (IN.P ?X_G)) GET.12.V) (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_F))))))
			(?X_E
	   (?X_H
	    (((ADV-A (IN.P ?X_G)) GET.13.V) (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_F))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_B)))
			(!W2 (?X_N (BEFORE ?X_K)))
			(!W3 (?X_N (BEFORE ?X_D)))
			(!W4 (?X_N (BEFORE ?X_C)))
			(!W5 (?X_N (BEFORE ?X_E)))
			(!W6 (?X_B (BEFORE ?X_K)))
			(!W7 (?X_B (BEFORE ?X_D)))
			(!W8 (?X_B (BEFORE ?X_C)))
			(!W9 (?X_B (BEFORE ?X_E)))
			(!W10 (?X_K (BEFORE ?X_D)))
			(!W11 (?X_K (BEFORE ?X_C)))
			(!W12 (?X_K (BEFORE ?X_E)))
			(!W13 (?X_D (BEFORE ?X_C)))
			(!W14 (?X_D (BEFORE ?X_E)))
		)
	)
	(
			"A father of a has a new boat has a hook gives a new boat a has a new boat has a hook."
			"A father of a has a new boat has a hook gives a new boat to a has a new boat has a hook."
			"A has a new boat has a hook keeps a good oars at a house home of a has X_P has X_S."
			"A house home of a has X_P has X_S is near."
			"A childs fall out of not."
			"A childs get.126 ADV far out on a water in a row boat."
			"A childs get.127 ADV far out on a water in a row boat."
			"A childs get.128 ADV far out on a water in a row boat."
	)
)



(
	(EPI-SCHEMA ((?X_C MAKE.4.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_D LOUD.A))
			(!R4 (?X_D NOISE.N))
			(!R5 (?X_A (PERTAIN-TO ?X_C)))
			(!R6 (?X_A (PLUR EAR.N)))
			(!R7 (?X_B (PLUR HAND.N)))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((?X_C MAKE.5.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_D NOISE.N))
			(!R4 (?X_D LOUD.A))
			(!R5 (?X_A (PERTAIN-TO ?X_C)))
			(!R6 (?X_A (PLUR HAND.N)))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
			(!R8 (?X_B (PLUR EAR.N)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-36.PR ?X_H ?X_G ?X_D)) ** ?E)
		(:ROLES
			(!R1 (?X_D LOUD.A))
			(!R2 (?X_D NOISE.N))
			(!R3 (?X_H (PLUR HAND.N)))
			(!R4 (?X_G (PLUR EAR.N)))
			(!R5 (?X_I AGENT.N))
			(!R6 (?X_G (PERTAIN-TO ?X_I)))
			(!R7 (?X_H (PERTAIN-TO ?X_I)))
		)
		(:STEPS
			(?X_F (?X_I (COVER.V ?X_G ?X_H)))
			(?X_A (?X_I (((ADV-A (WITH.P ?X_H)) COVER.V) ?X_G)))
			(?X_C (?X_I MAKE.4.V ?X_D))
			(?X_C (?X_I MAKE.5.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_A)))
		)
	)
	(
			"A agent covers a ears of a agent a hands of a agent."
			"A agent covers a ears of a agent with a hands of a agent."
			"A agent make.146s a loud noise."
			"A agent make.148s a loud noise."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (COMPOSITE-SCHEMA-37.PR
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
	(EPI-SCHEMA ((?X_C (((ADV-A (FROM.P ?L1)) (AWAY.PRT RUN.4.V)) ?L2)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C NEW.A))
			(!R6 (?X_C (PERTAIN-TO ?X_A)))
			(!R7 (?X_A ((CANNOT.ADV CATCH.V) ?X_C)))
			(!R8 (?X_B (WALK.V ?X_C)))
			(!R9 (?X_B EVENING.N))
			(!R10 (?X_A ((OUT.ADV IS.V) ?X_B)))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.4.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.4.V)))))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (FROM.P ?L1)) (AWAY.PRT RUN.5.V)) ?L2)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C NEW.A))
			(!R6 (?X_A EVENING.N))
			(!R7 (?X_A (WALK.V ?X_C)))
			(!R8 (?X_B ((OUT.ADV IS.V) ?X_A)))
			(!R9 (?X_B ((CANNOT.ADV CATCH.V) ?X_C)))
			(!R10 (?X_C (PERTAIN-TO ?X_B)))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.5.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.5.V)))))
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
	(EPI-SCHEMA ((?X_B GET.14.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_B ((CANNOT.ADV CATCH.V) ?X_C)))
			(!R6 (?X_C NEW.A))
			(!R7 (?X_C (PERTAIN-TO ?X_B)))
			(!R8 (?X_C DOG.N))
			(!R9 (?X_B ((OUT.ADV IS.V) ?X_A)))
			(!R10 (?X_A EVENING.N))
			(!R11 (?X_A (WALK.V ?X_C)))
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
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-38.PR ?L2 ?X_J)) ** ?E)
		(:ROLES
			(!R1 (?X_J NEW.A))
			(!R2 (?X_J DOG.N))
			(!R3 (?X_J (PERTAIN-TO ?X_H)))
			(!R4 (?X_H ((CANNOT.ADV CATCH.V) ?X_J)))
			(!R5 (?X_I EVENING.N))
			(!R6 (?X_H ((OUT.ADV IS.V) ?X_I)))
			(!R7 (?X_I (WALK.V ?X_J)))
		)
		(:STEPS
			(?X_G (?X_H GET.14.V ?X_J))
			(?X_A (?X_H (LOVE.V ?X_J)))
			(?X_E (?X_H (LOVE.V ?X_J)))
			(?X_C (?X_J (((ADV-A (FROM.P ?L1)) (AWAY.PRT RUN.4.V)) ?L2)))
			(?X_C (?X_J (((ADV-A (FROM.P ?L1)) (AWAY.PRT RUN.5.V)) ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_A)))
			(!W2 (?X_G (BEFORE ?X_E)))
			(!W3 (?X_G (BEFORE ?X_C)))
			(!W4 (?X_A (BEFORE ?X_C)))
			(!W5 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A cannot catch a new dog of a cannot catch a new dog of X_H out is X_I out is a evening walking a new dog of X_H get.177s a new dog of a cannot catch a new dog of X_H out is X_I."
			"A cannot catch a new dog of a cannot catch a new dog of X_H out is X_I out is a evening walking a new dog of X_H loves a new dog of a cannot catch a new dog of X_H out is X_I."
			"A cannot catch a new dog of a cannot catch a new dog of X_H out is X_I out is a evening walking a new dog of X_H loves a new dog of a cannot catch a new dog of X_H out is X_I."
			"A new dog of a cannot catch a new dog of X_H out is X_I run.170s L2 from L1 away."
			"A new dog of a cannot catch a new dog of X_H out is X_I run.176s L2 from L1 away."
	)
)



(
	(EPI-SCHEMA ((?X_B EAT.1.V ?X_A) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_A FOOD.N))
			(!R3 (?X_A CAN.N))
			(!R4 (?X_A WHOLE.A))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (NOT (?X_B HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_B HAVE.V ?X_A))
			(?I2 (?X_B HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (HAVE.V ?X_A))))
			(?P2 (NOT (?X_B HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_C))
			(!W2 (?I1 BEFORE ?X_C))
			(!W3 (?X_C CAUSE-OF ?P1))
			(!W4 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-39.PR ?X_F ?X_C)) ** ?E)
		(:ROLES
			(!R1 (?X_C WHOLE.A))
			(!R2 (?X_C CAN.N))
			(!R3 (?X_F (PLUR ALMOND.N)))
			(!R4 (?X_F (SO.ADV GOOD.A)))
			(!R5 (?X_I STORE.N))
			(!R6 (?X_J AGENT.N))
		)
		(:STEPS
			(?X_H ((ADV-E (DURING (K YESTERDAY.N))) (?X_J ((ADV-A (TO.P ?X_I)) GO.V))))
			(?X_E (?X_J (SEE.V ?X_F)))
			(?X_B (?X_J EAT.1.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_E)))
			(!W2 (?X_H (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A agent goes DURING yesterday to a store."
			"A agent sees a almonds so good."
			"A agent eat.198s a whole can."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-40.PR ?X_B ?X_G)) ** ?E)
		(:ROLES
			(!R1 (?X_C AFRAID.A))
			(!R2 (?X_C (OF.P (K (PLUR SPIDER.N)))))
			(!R3 (?X_B MOTHER.N))
			(!R4 (?X_B (PERTAIN-TO ?X_C)))
			(!R5 (?X_F AGENT.N))
			(!R6 (?X_G BIG.A))
			(!R7 (?X_G SPIDER.N))
		)
		(:STEPS
			(?X_A (?X_C (CALL.V ?X_B)))
			(?X_E (?X_C (CALL.V ?X_B)))
			(?X_I (?X_F (SEE.V ?X_G)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_E)))
			(!W2 (?X_A (BEFORE ?X_I)))
			(!W3 (?X_E (BEFORE ?X_I)))
		)
	)
	(
			"A afraid of spiders calls a mother of a afraid of spiders."
			"A afraid of spiders calls a mother of a afraid of spiders."
			"A agent sees a big spider."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FROM.P ?L1))
	                (OVER.PRT ((ADV-A (TO.P ?X_A)) WALK.2.V)))
	               ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B MOTHER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A BABY.N))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) WALK.2.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) WALK.2.V)))))
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
	(EPI-SCHEMA ((?X_A
	              (((ADV-A (FROM.P ?L1))
	                (BACK.ADV ((ADV-A (FOR.P (KA SLEEP.V))) GO.6.V)))
	               ?L2))
	             ** ?X_B)
		(:ROLES
			(!R1 (?X_A BABY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.6.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.6.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
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
	              (COMPOSITE-SCHEMA-41.PR (KE (?X_N HUNGRY.A))
	               (K (THAT.P (?X_N HUNGRY.A))) ?X_N ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K MOTHER.N))
			(!R2 (?X_N BABY.N))
		)
		(:STEPS
			(?X_M (?X_N ((ADV-A (FOR.P (KA CRY.V))) START.V)))
			(?X_J
	   (?X_K
	    (((ADV-A (FROM.P ?L1)) (OVER.PRT ((ADV-A (TO.P ?X_N)) WALK.2.V))) ?L2)))
			(?X_H (?X_K (THAT.P (KE (?X_N HUNGRY.A)))))
			(?X_F (?X_K (SEE.V (K (THAT.P (?X_N HUNGRY.A))))))
			(?X_D (?X_K (BREASTF.V ?X_N)))
			(?X_B
	   (?X_N
	    (((ADV-A (FROM.P ?L1)) (BACK.ADV ((ADV-A (FOR.P (KA SLEEP.V))) GO.6.V)))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_J)))
			(!W2 (?X_M (BEFORE ?X_H)))
			(!W3 (?X_M (BEFORE ?X_F)))
			(!W4 (?X_M (BEFORE ?X_D)))
			(!W5 (?X_M (BEFORE ?X_B)))
			(!W6 (?X_J (BEFORE ?X_H)))
			(!W7 (?X_J (BEFORE ?X_F)))
			(!W8 (?X_J (BEFORE ?X_D)))
			(!W9 (?X_J (BEFORE ?X_B)))
			(!W10 (?X_H (BEFORE ?X_D)))
			(!W11 (?X_H (BEFORE ?X_B)))
			(!W12 (?X_F (BEFORE ?X_D)))
			(!W13 (?X_F (BEFORE ?X_B)))
			(!W14 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A baby starts for crying."
			"A mother walk.211s L2 from L1 over to a baby."
			"A mother is that."
			"A mother sees that a baby hungry."
			"A mother breastfs a baby."
			"A baby go.213s L2 from L1 back for sleeping."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_A GET.15.V (K MAD.A)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A WOMAN.N))
			(!R2 (NOT ((K MAD.A) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (K MAD.A))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V (K MAD.A)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V (K MAD.A))))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 ((K MAD.A) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V (K MAD.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_B))
			(!W2 (?I1 PRECOND-OF ?X_B))
			(!W3 (?I2 PRECOND-OF ?X_B))
			(!W4 (?I3 PRECOND-OF ?X_B))
			(!W5 (?P1 POSTCOND-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-42.PR ?X_O ?X_A ?X_K (K MAD.A))) ** ?E)
		(:ROLES
			(!R1 (?X_F FEMALE.A))
			(!R2 (?X_F AGENT.N))
			(!R3 (?X_E (PERTAIN-TO ?X_F)))
			(!R4 (?X_K WOMAN.N))
			(!R5 (?X_L MALE.A))
			(!R6 (?X_L AGENT.N))
			(!R7 (?X_O ROSE.N))
			(!R8 (?X_P MAN.N))
			(!R9 (?X_S ROSEBUSH.N))
		)
		(:STEPS
			(?X_R (?X_S BLOOM.V))
			(?X_N (?X_P (CUT.V ?X_O)))
			(?X_J (?X_L (((ADV-A (TO.P ?X_K)) GIVE.V) ?X_A)))
			(?X_D (NOT (?X_F ((DID.AUX LIKE.V) ?X_K))))
			(?X_H (?X_K GET.15.V (K MAD.A)))
			(?X_B (NOT (?X_F ((DID.AUX LIKE.V) ?X_K))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_R (BEFORE ?X_N)))
			(!W2 (?X_R (BEFORE ?X_J)))
			(!W3 (?X_R (BEFORE ?X_H)))
			(!W4 (?X_R (BEFORE ?X_B)))
			(!W5 (?X_N (BEFORE ?X_J)))
			(!W6 (?X_N (BEFORE ?X_H)))
			(!W7 (?X_N (BEFORE ?X_B)))
			(!W8 (?X_J (BEFORE ?X_H)))
			(!W9 (?X_J (BEFORE ?X_B)))
			(!W10 (?X_D (BEFORE ?X_B)))
			(!W11 (?X_H (BEFORE ?X_B)))
		)
	)
	(
			"A rosebush blooms."
			"A man cuts a rose."
			"A male agent gives X_A to a woman."
			"A female agent likes a woman not did."
			"A woman get.223s mad."
			"A female agent likes a woman not did."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-43.PR ?X_B)) ** ?E)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?X_B ICE.N))
		)
		(:STEPS
			(?X_D (?X_A (BREAK.V ?X_B)))
		)
	)
	(
			"A man breaks a ice."
	)
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) GO.7.V)) ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A STORE.N))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.7.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.7.V)))))
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
	              (COMPOSITE-SCHEMA-44.PR (K CANDY.N) (K GREAT.A)
	               (K (L X (AND (X SOUR.A) (X CANDY.N)))) (FIVE.D (PLUR BAG.N))
	               ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M STORE.N))
		)
		(:STEPS
			(?X_L (?X_B (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_M)) GO.7.V)) ?L2)))
			(?X_J (?X_B (((ADV-A (ON.P (K SALE.N))) SEE.V) (K CANDY.N))))
			(?X_H ((K CANDY.N) (LOOK.V (K GREAT.A))))
			(?X_F (?X_B (GET.V (K (L X (AND (X SOUR.A) (X CANDY.N)))))))
			(?X_D (?X_B (GET.V (FIVE.D (PLUR BAG.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_J)))
			(!W2 (?X_L (BEFORE ?X_H)))
			(!W3 (?X_L (BEFORE ?X_F)))
			(!W4 (?X_L (BEFORE ?X_D)))
			(!W5 (?X_J (BEFORE ?X_H)))
			(!W6 (?X_J (BEFORE ?X_F)))
			(!W7 (?X_J (BEFORE ?X_D)))
			(!W8 (?X_H (BEFORE ?X_F)))
			(!W9 (?X_H (BEFORE ?X_D)))
			(!W10 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"X_B go.228s L2 from L1 to a store."
			"X_B sees candy on sale."
			"Candy looks great."
			"X_B gets sour candy."
			"X_B gets five bags."
	)
)



(
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-45.PR
	               (KE ((ANOTHER.D (L X (AND (X TREE.N) (X |'S|)))) SHADOW.N))
	               (K (L X (AND (X MORE.A) (X SUN.N))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H TREE.N))
		)
		(:STEPS
			(?X_C (?X_H ((ADV-A (FOR.P (KA GROW.V))) START.V)))
			(?X_E
	   (?X_H (IN.P (KE ((ANOTHER.D (L X (AND (X TREE.N) (X |'S|)))) SHADOW.N)))))
			(?X_G (?X_H (NEED.V (K (L X (AND (X MORE.A) (X SUN.N)))))))
			(?X_J (?X_H (THEN.ADV (QUICKLY.ADV GROW.V))))
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
	)
)



(
	(EPI-SCHEMA (((ADV-E (DURING (K YESTERDAY.N)))
	              (?X_B
	               (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) GO.8.V)) ?L2)))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A BEACH.N))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.8.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.8.V)))))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) FALL.3.V) (K ASLEEP.A)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K ASLEEP.A) LOCATION.N))
			(!R4 (NOT (?L1 = (K ASLEEP.A))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P (K ASLEEP.A))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (K ASLEEP.A)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (K ASLEEP.A))))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P (K ASLEEP.A)))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K ASLEEP.A))) FALL.3.V)))
	    (K ASLEEP.A)))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P (K ASLEEP.A)))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K ASLEEP.A))) FALL.3.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-46.PR (KA GO.V) ?L2 (K ASLEEP.A))) ** ?E)
		(:ROLES
			(!R1 (?X_G HAMMOCK.N))
			(!R2 (?X_J BEACH.N))
			(!R3 (?X_K AGENT.N))
		)
		(:STEPS
			(?X_I
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_K (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_J)) GO.8.V)) ?L2))))
			(?X_F (?X_K ((ADV-A (IN.P ?X_G)) LAY.V)))
			(?X_D (?X_K ((ADV-A (FROM.P ?L1)) FALL.3.V) (K ASLEEP.A)))
			(?X_B (?X_K ((NEVER.ADV WANT.V) (KA GO.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_F)))
			(!W2 (?X_I (BEFORE ?X_D)))
			(!W3 (?X_I (BEFORE ?X_B)))
			(!W4 (?X_F (BEFORE ?X_D)))
			(!W5 (?X_F (BEFORE ?X_B)))
			(!W6 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent go.233s L2 DURING yesterday from L1 to a beach."
			"A agent lays in a hammock."
			"A agent fall.234s asleep from L1."
			"A agent wants going never."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (((ADV-A (FROM.P ?L1))
	                ((ADV-A (FOR.P (KA (INTRODUCE.V ?X_A)))) GO.9.V))
	               ?L2))
	             ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A EXCITED.A))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.9.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.9.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A MAKE.6.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_A EXCITED.A))
			(!R4 (?X_B (PLUR FRIEND.N)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B EXIST.V)))))
			(?G2 (?X_A (WANT.V (KA (HAVE.V ?X_B)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B EXIST.V))
			(?P2 (?X_A (HAVE.V ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-47.PR
	               (KE
	                (?X_N (GET.V (K (L X (AND (X NEW.A) (X (PLUR NEIGHBOR.N))))))))
	               (K
	                (LIKE.P
	                 (?X_N
	                  (GET.V (K (L X (AND (X NEW.A) (X (PLUR NEIGHBOR.N)))))))))
	               ?L2 ?X_E))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E (PLUR FRIEND.N)))
			(!R2 (?X_N EXCITED.A))
		)
		(:STEPS
			(?X_M (?X_N (OUTSIDE.ADV LOOK.V)))
			(?X_K
	   (?X_A
	    (LIKE.P
	     (KE (?X_N (GET.V (K (L X (AND (X NEW.A) (X (PLUR NEIGHBOR.N)))))))))))
			(?X_I
	   (?X_A
	    (LOOK.V
	     (K
	      (LIKE.P
	       (?X_N (GET.V (K (L X (AND (X NEW.A) (X (PLUR NEIGHBOR.N))))))))))))
			(?X_G
	   (?X_N
	    (((ADV-A (FROM.P ?L1)) ((ADV-A (FOR.P (KA (INTRODUCE.V ?X_N)))) GO.9.V))
	     ?L2)))
			(?X_D (?X_N MAKE.6.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_K)))
			(!W2 (?X_M (BEFORE ?X_I)))
			(!W3 (?X_M (BEFORE ?X_G)))
			(!W4 (?X_M (BEFORE ?X_D)))
			(!W5 (?X_K (BEFORE ?X_G)))
			(!W6 (?X_K (BEFORE ?X_D)))
			(!W7 (?X_I (BEFORE ?X_G)))
			(!W8 (?X_I (BEFORE ?X_D)))
			(!W9 (?X_G (BEFORE ?X_D)))
		)
	)
	(
			"A excited looks outside."
			"X_A is like."
			"X_A looks like a excited gets new neighbor."
			"A excited go.236s L2 from L1 for introducing a excited."
			"A excited make.237s a friends."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (COMPOSITE-SCHEMA-48.PR (K (PLUR PET.N))
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
	(EPI-SCHEMA ((?X_D (((ADV-A (FROM.P ?X_A)) INFORM.2.V) ?X_E ?I)) ** ?X_F)
		(:ROLES
			(!R1 (?X_D BROTHER.N))
			(!R2 (?X_E AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?X_A TREE.N))
			(!R5 (?X_D (PERTAIN-TO ?X_C)))
			(!R6 (?X_C AGENT.N))
			(!R7 (?X_B HOUSE.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_E (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_E (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_F ((?X_D TELL.V ?X_E ?I) ** ?X_F))
			(?X_F ((?X_D LET.V ?X_E (KA (KNOW.V ?I))) ** ?X_F))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AT-ABOUT ?X_G)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D (((ADV-A (FROM.P ?X_A)) INFORM.3.V) ?X_D ?I)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D BROTHER.N))
			(!R2 (?I INFORMATION.N))
			(!R3 (?X_A TREE.N))
			(!R4 (?X_D (PERTAIN-TO ?X_C)))
			(!R5 (?X_C AGENT.N))
			(!R6 (?X_B HOUSE.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_D (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_E ((?X_D TELL.V ?X_D ?I) ** ?X_E))
			(?X_E ((?X_D LET.V ?X_D (KA (KNOW.V ?I))) ** ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C (((ADV-A (FROM.P ?X_A)) INFORM.4.V) ?X_D ?I)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C BROTHER.N))
			(!R2 (?X_D AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?X_A TREE.N))
			(!R5 (?X_C (PERTAIN-TO ?X_D)))
			(!R6 (?X_B HOUSE.N))
			(!R7 (?X_B (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_D (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_E ((?X_C TELL.V ?X_D ?I) ** ?X_E))
			(?X_E ((?X_C LET.V ?X_D (KA (KNOW.V ?I))) ** ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D
	              (((ADV-A (FROM.P ?X_C)) ((ADV-A (FROM.P ?X_C)) FALL.4.V)) ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D BROTHER.N))
			(!R2 (?X_C LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_C = ?L2)))
			(!R5 (?X_C TREE.N))
			(!R6 (?X_D (PERTAIN-TO ?X_A)))
			(!R7 (?X_A AGENT.N))
			(!R8 (?X_B (PERTAIN-TO ?X_A)))
			(!R9 (?X_B HOUSE.N))
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
		(:PARAPHRASES
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?X_C)) ((ADV-A (TO.P ?L2)) FALL.4.V)))
	    ?L2))
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?X_C)) ((ADV-A (TO.P ?L2)) FALL.4.V)))))
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
	              (((ADV-A (FROM.P ?X_C)) ((ADV-A (FROM.P ?X_C)) FALL.5.V)) ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D BROTHER.N))
			(!R2 (?X_C LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_C = ?L2)))
			(!R5 (?X_C TREE.N))
			(!R6 (?X_B AGENT.N))
			(!R7 (?X_D (PERTAIN-TO ?X_B)))
			(!R8 (?X_A HOUSE.N))
			(!R9 (?X_A (PERTAIN-TO ?X_B)))
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
		(:PARAPHRASES
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?X_C)) ((ADV-A (TO.P ?L2)) FALL.5.V)))
	    ?L2))
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?X_C)) ((ADV-A (TO.P ?L2)) FALL.5.V)))))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) CLIMB.1.V) (KE (?X_D (OF.P ?X_E))))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_C BROTHER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KE (?X_D (OF.P ?X_E))) LOCATION.N))
			(!R4 (NOT (?L1 = (KE (?X_D (OF.P ?X_E))))))
			(!R5 (?X_E (VERY.ADV HIGH.A)))
			(!R6 (?X_E (PLUR TREE.N)))
			(!R7 (?X_A AGENT.N))
			(!R8 (?X_C (PERTAIN-TO ?X_A)))
			(!R9 (?X_B (PERTAIN-TO ?X_A)))
			(!R10 (?X_B HOUSE.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA ((ADV-A (AT.P (KE (?X_D (OF.P ?X_E))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P (KE (?X_D (OF.P ?X_E)))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P (KE (?X_D (OF.P ?X_E))))))
		)
		(:PARAPHRASES
			(?X_F
	   (?X_C
	    ((ADV-A (FOR.P (KE (?X_D (OF.P ?X_E)))))
	     ((ADV-A (FROM.P ?L1))
	      ((ADV-A (TO.P (KE (?X_D (OF.P ?X_E))))) CLIMB.1.V)))
	    (KE (?X_D (OF.P ?X_E)))))
			(?X_F
	   (?X_C
	    ((ADV-A (FOR.P (KE (?X_D (OF.P ?X_E)))))
	     ((ADV-A (FROM.P ?L1))
	      ((ADV-A (TO.P (KE (?X_D (OF.P ?X_E))))) CLIMB.1.V)))))
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
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-49.PR
	               (K (IN.P (?X_M ((ADV-A (BY.P ?X_O)) (IN.P ?X_L)))))
	               (KA (DOWN.ADV GET.V)) ?X_N ?X_P ?X_Q ?I ?L2
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
			(?X_K (?X_N (GO.V (K (IN.P (?X_M ((ADV-A (BY.P ?X_O)) (IN.P ?X_L))))))))
			(?X_H (?X_P ((ADV-A (FROM.P ?L1)) CLIMB.1.V) (KE (?X_A (OF.P ?X_I)))))
			(?X_F (?X_N (TELL.V ?X_P (KA (DOWN.ADV GET.V)))))
			(?X_C (?X_P (((ADV-A (FROM.P ?X_D)) INFORM.2.V) ?X_N ?I)))
			(?X_C (?X_P (((ADV-A (FROM.P ?X_D)) INFORM.3.V) ?X_P ?I)))
			(?X_C (?X_P (((ADV-A (FROM.P ?X_D)) INFORM.4.V) ?X_Q ?I)))
			(?X_C (?X_P (((ADV-A (FROM.P ?X_D)) ((ADV-A (FROM.P ?X_D)) FALL.4.V)) ?L2)))
			(?X_C (?X_P (((ADV-A (FROM.P ?X_D)) ((ADV-A (FROM.P ?X_D)) FALL.5.V)) ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_C)))
		)
	)
	(
			"A agent goes in a hike by a house of a agent in a woods."
			"A brother of a agent climb.243s X_A of a very high trees from L1."
			"A agent tells a brother of a agent down get."
			"A brother of a agent inform.249s a agent I from a tree."
			"A brother of a agent inform.250s a brother of a agent I from a tree."
			"A brother of a agent inform.255s a agent I from a tree."
			"A brother of a agent fall.244s L2 from a tree from a tree."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              ((ADV-A (ON.P ?S))
	               ((ADV-A (IN.P ?S)) (DOWN.ADV ((ADV-A (FOR.P ?X_A)) SIT.2.V)))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (NOT (?S AGENT.N)))
			(!R3 (?S FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_C (MORE.ADV TIRED.A)))
			(!R6 (?X_A BREAK.N))
			(!R7 (?X_B BREATH.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-50.PR (KE (?X_K THINK.V)))) ** ?E)
		(:ROLES
			(!R1 (?X_G BREAK.N))
			(!R2 (?X_J BREATH.N))
			(!R3 (?X_K MAN.N))
			(!R4 (?X_K (MORE.ADV TIRED.A)))
			(!R5 (?X_J (PERTAIN-TO ?X_K)))
		)
		(:STEPS
			(?X_A (?X_K ((ADV (VERY.ADV FAST.A)) RUN.V)))
			(?X_B (?X_K ((ADV-A (FOR.P (KA (CATCH.V ?X_J)))) STOP.V)))
			(?X_I (?X_K ((ADV-A (FOR.P (KA (CATCH.V ?X_J)))) STOP.V)))
			(?X_C (?X_K (THAN.P (KE (?X_K THINK.V)))))
			(?X_D (?X_K (THAN.P (KE (?X_K THINK.V)))))
			(?X_F
	   (?X_K
	    ((ADV-A (ON.P ?S))
	     ((ADV-A (IN.P ?S)) (DOWN.ADV ((ADV-A (FOR.P ?X_G)) SIT.2.V))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_B)))
			(!W2 (?X_A (BEFORE ?X_I)))
			(!W3 (?X_A (BEFORE ?X_C)))
			(!W4 (?X_A (BEFORE ?X_D)))
			(!W5 (?X_B (BEFORE ?X_I)))
			(!W6 (?X_B (BEFORE ?X_C)))
			(!W7 (?X_B (BEFORE ?X_D)))
			(!W8 (?X_I (BEFORE ?X_C)))
			(!W9 (?X_I (BEFORE ?X_D)))
			(!W10 (?X_C (BEFORE ?X_D)))
		)
	)
	(
			"A man more tired runs ADV very fast."
			"A man more tired stops for catching a breath of a man more tired."
			"A man more tired stops for catching a breath of a man more tired."
			"A man more tired is than."
			"A man more tired is than."
			"A man more tired sit.1s on S in S down for a break."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FROM.P ?L1))
	                ((ADV-A (IN.P (K (L X (AND (X LAST.A) (X PLACE.N))))))
	                 COME.1.V))
	               ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A (PLUR FRIEND.N)))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) COME.1.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) COME.1.V)))))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-51.PR ?L2)) ** ?E)
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
	    (((ADV-A (FROM.P ?L1))
	      ((ADV-A (IN.P (K (L X (AND (X LAST.A) (X PLACE.N)))))) COME.1.V))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_E)))
			(!W2 (?X_H (BEFORE ?X_C)))
			(!W3 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A friends of a agent and a agent run."
			"A agent is behind a group."
			"A agent come.16s L2 from L1 in last place."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              (COMPOSITE-SCHEMA-52.PR (KA SKATE.V)
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-53.PR ?X_D)) ** ?E)
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
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FOR.P (KA (MAKE.V (K HONEY.N))))) TAKE.5.V) ?X_C))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_A LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C NECTAR.A))
			(!R6 (?X_C HOME.N))
			(!R7 (?X_B (PLUR BEE.N)))
			(!R8 (?X_A (PLUR FIELD.N)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V ?X_C)))
			(?I2 (?X_B (AT.P ?X_A)))
			(?I3 (?X_C (AT.P ?X_A)))
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
	(EPI-SCHEMA ((?X_T
	              (COMPOSITE-SCHEMA-54.PR ?X_A
	               (K (L X (AND (X SWEET.A) (X NECTAR.N)))) ?X_K ?X_B (K CLOVER.N)
	               ?X_N))
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
			(?X_P
	   (?X_T
	    (((ADV-A (IN.P ?X_Q)) FIND.V) (K (L X (AND (X SWEET.A) (X NECTAR.N)))))))
			(?X_M (?X_T (((ADV-A (FOR.P (KA (MAKE.V (K HONEY.N))))) TAKE.5.V) ?X_N)))
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
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_S (BEFORE ?X_P)))
			(!W2 (?X_S (BEFORE ?X_M)))
			(!W3 (?X_S (BEFORE ?X_J)))
			(!W4 (?X_S (BEFORE ?X_G)))
			(!W5 (?X_S (BEFORE ?X_E)))
			(!W6 (?X_P (BEFORE ?X_M)))
			(!W7 (?X_P (BEFORE ?X_J)))
			(!W8 (?X_P (BEFORE ?X_G)))
			(!W9 (?X_P (BEFORE ?X_E)))
			(!W10 (?X_M (BEFORE ?X_J)))
			(!W11 (?X_M (BEFORE ?X_G)))
			(!W12 (?X_M (BEFORE ?X_E)))
			(!W13 (?X_J (BEFORE ?X_G)))
			(!W14 (?X_J (BEFORE ?X_E)))
			(!W15 (?X_G (BEFORE ?X_E)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_C COMPOSITE-SCHEMA-55.PR) ** ?E)
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-56.PR (KA (BUY.V ?X_E)) ?X_H ?X_N)) ** ?E)
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
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-57.PR ?X_D (KA SIT.V) ?X_H (KA HELP.V))) **
	             ?E)
		(:ROLES
			(!R1 (?X_A DAY.N))
			(!R2 (NOT (?X_D (DID.AUX SIT.V))))
			(!R3 (?X_G TEACHER.N))
			(!R4 (?X_G NEW.A))
			(!R5 (?X_H PRINCIPAL.N))
		)
		(:STEPS
			(?X_C ((ADV-E (DURING ?X_A)) (?X_G START.V)))
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
			"A teacher new starts DURING a day."
			"A teacher new asks X_D sitting."
			"A teacher new asks a principal helping."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.16.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_A PLACE.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A HOUSE.N))
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
	(EPI-SCHEMA ((?X_T
	              (COMPOSITE-SCHEMA-58.PR
	               (KA (OVER.PRT ((ADV-A (IN.P (THREE.D (PLUR HOUR.N)))) COME.V)))
	               ?X_M ?X_S ?X_A))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H GOOD.A))
			(!R2 (?X_H TIME.N))
			(!R3 (?X_M MESS.N))
			(!R4 (?X_S PLACE.N))
			(!R5 (?X_S HOUSE.N))
			(!R6 (?X_P AGENT.N))
			(!R7 (?X_S (PERTAIN-TO ?X_T)))
		)
		(:STEPS
			(?X_L (?X_S (BE.V ?X_M)))
			(?X_J (?X_T (CLEAN.V ?X_S)))
			(?X_G (?X_B ?X_H (HAVE.V ?X_S)))
			(?X_R (?X_T GET.16.V ?X_A))
			(?X_O
	   (?X_P
	    (WANT.V (KA (OVER.PRT ((ADV-A (IN.P (THREE.D (PLUR HOUR.N)))) COME.V))))))
			(?X_C (?X_S (BE.V ?X_M)))
			(?X_D (?X_T (CLEAN.V ?X_S)))
			(?X_E (?X_B ?X_H (HAVE.V ?X_S)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_C)))
			(!W2 (?X_L (BEFORE ?X_D)))
			(!W3 (?X_L (BEFORE ?X_E)))
			(!W4 (?X_J (BEFORE ?X_D)))
			(!W5 (?X_J (BEFORE ?X_E)))
			(!W6 (?X_G (BEFORE ?X_E)))
			(!W7 (?X_R (BEFORE ?X_O)))
			(!W8 (?X_R (BEFORE ?X_C)))
			(!W9 (?X_R (BEFORE ?X_D)))
			(!W10 (?X_R (BEFORE ?X_E)))
			(!W11 (?X_O (BEFORE ?X_C)))
			(!W12 (?X_O (BEFORE ?X_D)))
			(!W13 (?X_O (BEFORE ?X_E)))
			(!W14 (?X_C (BEFORE ?X_D)))
			(!W15 (?X_C (BEFORE ?X_E)))
			(!W16 (?X_D (BEFORE ?X_E)))
		)
	)
	(
			"A place house of X_T is a mess."
			"X_T cleans a place house of X_T."
			"X_B has a place house of X_T."
			"X_T get.78s X_A."
			"A agent wants over in three hours coming."
			"A place house of X_T is a mess."
			"X_T cleans a place house of X_T."
			"X_B has a place house of X_T."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K CHURCH.N))) GO.10.V))
	               ?L2))
	             ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.10.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.10.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_C (AFTER ?X_B)))
			(!W7 (?X_C (AT-ABOUT ?X_D)))
			(!W8 (?X_E (AT-ABOUT ?X_D)))
			(!W9 (?X_E (AFTER ?X_F)))
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
	              (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K CHURCH.N))) GO.10.V))
	               ?L2))
	             ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.10.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.10.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_C (AFTER ?X_B)))
			(!W7 (?X_C (AT-ABOUT ?X_D)))
			(!W8 (?X_E (AT-ABOUT ?X_D)))
			(!W9 (?X_E (AFTER ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-59.PR ?X_Q ?X_K ?L2)) ** ?E)
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
			(?X_D
	   (?X_A (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K CHURCH.N))) GO.10.V)) ?L2)))
			(?X_P (?X_A (CARRY.V ?X_Q)))
			(?X_E
	   (?X_A (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K CHURCH.N))) GO.10.V)) ?L2)))
			(?X_N (?X_A (CARRY.V ?X_Q)))
			(?X_I (?X_B (CARRY.V ?X_K)))
			(?X_G (?X_K ((ADV-A (FROM.P ?X_C)) COME.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_P)))
			(!W2 (?X_D (BEFORE ?X_I)))
			(!W3 (?X_D (BEFORE ?X_G)))
			(!W4 (?X_P (BEFORE ?X_I)))
			(!W5 (?X_P (BEFORE ?X_G)))
			(!W6 (?X_E (BEFORE ?X_N)))
			(!W7 (?X_E (BEFORE ?X_I)))
			(!W8 (?X_E (BEFORE ?X_G)))
			(!W9 (?X_N (BEFORE ?X_I)))
			(!W10 (?X_N (BEFORE ?X_G)))
			(!W11 (?X_I (BEFORE ?X_G)))
		)
	)
	(
			"X_A go.89s L2 from L1 to church."
			"X_A carries a parasol black small of silk."
			"X_A go.89s L2 from L1 to church."
			"X_A carries a parasol black small of silk."
			"X_B carries a umbrella of paper is X_L."
			"A umbrella of paper is X_L comes from X_C."
	)
)



(
	(EPI-SCHEMA ((?X_D TAKE.6.V ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_A (PLUR FIELD.N)))
			(!R6 (?X_B (PERTAIN-TO ?X_D)))
			(!R7 (?X_B WAGON.N))
			(!R8 (?X_B RED.A))
			(!R9 (?X_C (HAS.V ?X_B)))
			(!R10 (?X_C BOY.N))
			(!R11 (?X_C LITTLE.A))
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
	(EPI-SCHEMA ((?X_D TAKE.7.V ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_A (PLUR FIELD.N)))
			(!R6 (?X_C WAGON.N))
			(!R7 (?X_C RED.A))
			(!R8 (?X_C (PERTAIN-TO ?X_D)))
			(!R9 (?X_B LITTLE.A))
			(!R10 (?X_B BOY.N))
			(!R11 (?X_B (HAS.V ?X_C)))
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
	(EPI-SCHEMA ((?X_G
	              (COMPOSITE-SCHEMA-60.PR
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
			(E202.SK
	   (?X_H
	    (LET.V
	     (K (L X (AND (X LITTLE.A) (X MAY.N) (X ((ADV-A (IN.P ?X_I)) RIDE.V))))))))
			(?X_D (?X_B ((MAY.AUX HAVE.V) ?X_E)))
			(E203.SK (?X_G TAKE.6.V ?X_B))
			(E203.SK (?X_G TAKE.7.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (E202.SK BEFORE ?X_D))
			(!W2 (?X_D BEFORE E203.SK))
		)
	)
	(
			"A little boy has a red wagon of a agent lets little may riding."
			"X_B has a good ride may."
			"A agent take.100s X_B."
			"A agent take.102s X_B."
	)
)



(
	(EPI-SCHEMA ((?X_C (((ADV-A (THROUGH.P ?X_A)) INFORM.5.V) ?X_C ?I)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?I INFORMATION.N))
			(!R3 (?X_A (AT.P (K WORK.N))))
			(!R4 (?X_A DOOR.N))
			(!R5 (?X_B (PERTAIN-TO ?X_C)))
			(!R6 (?X_B FRIEND.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_D ((?X_C TELL.V ?X_C ?I) ** ?X_D))
			(?X_D ((?X_C LET.V ?X_C (KA (KNOW.V ?I))) ** ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (THROUGH.P ?X_A)) INFORM.6.V) ?X_C ?I)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C FRIEND.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?X_A DOOR.N))
			(!R5 (?X_A (AT.P (K WORK.N))))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_D ((?X_B TELL.V ?X_C ?I) ** ?X_D))
			(?X_D ((?X_B LET.V ?X_C (KA (KNOW.V ?I))) ** ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((ALMOST.ADV ((ADV-A (INTO.P ?X_B)) INFORM.7.V)) ?X_B ?I))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B FRIEND.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?X_B (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_C ((?X_A TELL.V ?X_B ?I) ** ?X_C))
			(?X_C ((?X_A LET.V ?X_B (KA (KNOW.V ?I))) ** ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FROM.P ?L1))
	                (ALMOST.ADV ((ADV-A (INTO.P ?X_A)) RUN.6.V)))
	               ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A FRIEND.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.6.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.6.V)))))
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
	              (((ADV-A (FROM.P ?L1)) ((ADV-A (THROUGH.P ?X_A)) COME.2.V))
	               ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A DOOR.N))
			(!R6 (?X_A (AT.P (K WORK.N))))
			(!R7 (?X_B FRIEND.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) COME.2.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) COME.2.V)))))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-61.PR ?X_C ?X_J ?X_I ?I ?L2)) ** ?E)
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
			(?X_G (?X_J (((ADV-A (THROUGH.P ?X_H)) INFORM.5.V) ?X_J ?I)))
			(?X_G (?X_J (((ADV-A (THROUGH.P ?X_H)) INFORM.6.V) ?X_I ?I)))
			(?X_G
	   (?X_J (((ADV-A (FROM.P ?L1)) ((ADV-A (THROUGH.P ?X_H)) COME.2.V)) ?L2)))
			(?X_E (?X_J ((ALMOST.ADV ((ADV-A (INTO.P ?X_I)) INFORM.7.V)) ?X_I ?I)))
			(?X_E
	   (?X_J
	    (((ADV-A (FROM.P ?L1)) (ALMOST.ADV ((ADV-A (INTO.P ?X_I)) RUN.6.V)))
	     ?L2)))
			(?X_B (?X_I (WEAR.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
		)
	)
	(
			"A agent inform.140s a agent I through a door at work."
			"A agent inform.141s a friend of a agent I through a door at work."
			"A agent come.129s L2 from L1 through a door at work."
			"A agent inform.142s a friend of a agent I almost into a friend of a agent."
			"A agent run.127s L2 from L1 almost into a friend of a agent."
			"A friend of a agent wears a piece two purple."
	)
)



(
	(EPI-SCHEMA ((?X_A ((WHY.ADV INFORM.8.V) ?X_B ?I)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A WOMAN.N))
			(!R2 (?X_B MAN.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?X_B (DID.AUX ANSWER.V))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_C ((?X_A TELL.V ?X_B ?I) ** ?X_C))
			(?X_C ((?X_A LET.V ?X_B (KA (KNOW.V ?I))) ** ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((WHY.ADV INFORM.9.V) ?X_A ?I)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A WOMAN.N))
			(!R2 (?I INFORMATION.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_A (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_B ((?X_A TELL.V ?X_A ?I) ** ?X_B))
			(?X_B ((?X_A LET.V ?X_A (KA (KNOW.V ?I))) ** ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (AT-ABOUT ?X_C)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E (COMPOSITE-SCHEMA-62.PR ?X_H ?X_I ?X_E ?I)) ** ?E)
		(:ROLES
			(!R1 (?X_E WOMAN.N))
			(!R2 (?X_H PHONE.N))
			(!R3 (NOT (?X_I (DID.AUX ANSWER.V))))
			(!R4 (?X_I MAN.N))
		)
		(:STEPS
			(?X_G (?X_I ((UP.PRT HANG.V) ?X_H)))
			(?X_B (?X_E ((BACK.ADV CALL.V) ?X_I)))
			(?X_D (?X_E ((WHY.ADV INFORM.8.V) ?X_I ?I)))
			(?X_D (?X_E ((WHY.ADV INFORM.9.V) ?X_E ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_B)))
		)
	)
	(
			"A man hangs a phone up."
			"A woman calls a man back."
			"A woman inform.149s a man I why."
			"A woman inform.150s a woman I why."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (ON.P ?X_C))
	               ((ADV-A (IN.P ?X_C))
	                (DOWN.ADV ((ADV-A (ON.P ?X_C)) SIT.3.V)))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_C FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_B TIRED.A))
			(!R6 (?X_C GROUND.N))
			(!R7 (?X_A (K WATER.N) BOTTLE.N))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
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
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-63.PR (KA WALK.V) ?X_J
	               (KA (WALK.V (KA (FIND.V (K WATER.N)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J (K WATER.N) BOTTLE.N))
			(!R2 (?X_I GROUND.N))
			(!R3 (?X_K TIRED.A))
			(!R4 (?X_K MAN.N))
			(!R5 (?X_J (PERTAIN-TO ?X_K)))
		)
		(:STEPS
			(?X_A (?X_K (OF.P (KA WALK.V))))
			(?X_B (?X_K ((OUT.PRT TAKE.V) ?X_J)))
			(?X_F (?X_K ((OUT.PRT TAKE.V) ?X_J)))
			(?X_D (MUST.AUX-S (?X_K (KEEP.V (KA (WALK.V (KA (FIND.V (K WATER.N)))))))))
			(?X_H
	   (?X_K
	    ((ADV-A (ON.P ?X_I))
	     ((ADV-A (IN.P ?X_I)) (DOWN.ADV ((ADV-A (ON.P ?X_I)) SIT.3.V))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_B)))
			(!W2 (?X_A (BEFORE ?X_F)))
			(!W3 (?X_A (BEFORE ?X_D)))
			(!W4 (?X_B (BEFORE ?X_F)))
			(!W5 (?X_B (BEFORE ?X_D)))
			(!W6 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A tired man is of."
			"A tired man takes a of a tired man out."
			"A tired man takes a of a tired man out."
			"A tired man keeps walking finding water must."
			"A tired man sit.158s on a ground in a ground down on a ground."
	)
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) GO.11.V)) ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A TODAY.N))
			(!R6 (?X_A STORE.N))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.11.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.11.V)))))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-64.PR ?X_E (SIX.D (PLUR DOLLAR.N)) ?L2)) **
	             ?E)
		(:ROLES
			(!R1 (?X_E (PLUR CHIP.N)))
			(!R2 (?X_H STORE.N))
			(!R3 (?X_H TODAY.N))
			(!R4 (?X_I AGENT.N))
		)
		(:STEPS
			(?X_G (?X_I (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_H)) GO.11.V)) ?L2)))
			(?X_D (?X_I (SEE.V ?X_E)))
			(?X_B (?X_E (BE.V (SIX.D (PLUR DOLLAR.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_D)))
			(!W2 (?X_G (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent go.170s L2 from L1 to a store today."
			"A agent sees a chips."
			"A chips are six dollars."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (((ADV-A (IN.P ?X_C)) ((ADV-A (IN.P ?X_C)) PUT.4.V)) ?X_B))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_C BOX.N))
			(!R4 (NOT (?X_C AGENT.N)))
			(!R5 (?X_B SMALLER-THAN ?X_C))
			(!R6 (?X_B BIRD.N))
			(!R7 (?X_C SHOE.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (IN.P ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B (IN.P ?X_C))))
		)
		(:POSTCONDS
			(?P1 (?X_B (IN.P ?X_C)))
		)
		(:PARAPHRASES
			(?X_D (?X_A ((ADV-A (INTO.P ?X_C)) PUT.4.V) ?X_B))
			(?X_D (?X_A ((ADV-A (INSIDE.P ?X_C)) PUT.4.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-65.PR ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_K SHOE.N))
			(!R2 (?X_K BOX.N))
			(!R3 (?X_N BIRD.N))
		)
		(:STEPS
			(?X_M (?X_B (FIND.V ?X_N)))
			(?X_H (?X_B (FED.V ?X_N)))
			(?X_F (?X_N SURVIVE.V))
			(?X_D (?X_B (((ADV-A (IN.P ?X_A)) KEEP.V) ?X_N)))
			(?X_J (?X_B (((ADV-A (IN.P ?X_K)) ((ADV-A (IN.P ?X_K)) PUT.4.V)) ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_H)))
			(!W2 (?X_M (BEFORE ?X_F)))
			(!W3 (?X_M (BEFORE ?X_D)))
			(!W4 (?X_H (BEFORE ?X_F)))
			(!W5 (?X_H (BEFORE ?X_D)))
			(!W6 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"X_B finds a bird."
			"X_B fed a bird."
			"A bird survives."
			"X_B keeps a bird in X_A."
			"X_B put.173s a bird in a shoe box in a shoe box."
	)
)



(
	(EPI-SCHEMA ((?X_A MAKE.7.V
	              (KE (?X_B ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2
	   (NOT ((KE (?X_B ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))) AGENT.N)))
			(!R3 (?X_B (PERTAIN-TO ?X_A)))
			(!R4 (?X_B WIFE.N))
		)
		(:GOALS
			(?G1
	   (?X_A
	    (WANT.V
	     (THAT
	      ((KE (?X_B ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))) EXIST.V)))))
			(?G2
	   (?X_A
	    (WANT.V
	     (KA
	      (HAVE.V (KE (?X_B ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))))))))
		)
		(:PRECONDS
			(?I1
	   (NOT ((KE (?X_B ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))) EXIST.V)))
		)
		(:POSTCONDS
			(?P1 ((KE (?X_B ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))) EXIST.V))
			(?P2
	   (?X_A (HAVE.V (KE (?X_B ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (RIGHT-AFTER ?X_C)))
			(!W2 (?X_D (SAME-TIME ?X_F)))
			(!W3 (?X_E (BEFORE ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A MAKE.8.V
	              (KE (?X_B ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2
	   (NOT ((KE (?X_B ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))) AGENT.N)))
			(!R3 (?X_B WIFE.N))
			(!R4 (?X_B (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1
	   (?X_A
	    (WANT.V
	     (THAT
	      ((KE (?X_B ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))) EXIST.V)))))
			(?G2
	   (?X_A
	    (WANT.V
	     (KA
	      (HAVE.V (KE (?X_B ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))))))))
		)
		(:PRECONDS
			(?I1
	   (NOT ((KE (?X_B ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))) EXIST.V)))
		)
		(:POSTCONDS
			(?P1 ((KE (?X_B ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))) EXIST.V))
			(?P2
	   (?X_A (HAVE.V (KE (?X_B ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (SAME-TIME ?X_F)))
			(!W2 (?X_C (RIGHT-AFTER ?X_D)))
			(!W3 (?X_E (BEFORE ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-66.PR ?X_L (K (PLUR GROCERY.N))
	               (KE (?X_N ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_N WIFE.N))
			(!R2 (?X_L BAG.N))
			(!R3 (?X_M GROUND.N))
			(!R4 (?X_O MAN.N))
			(!R5 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_K (?X_O (((ADV-A (ON.P ?X_M)) FIND.V) ?X_L)))
			(?X_I (?X_O (INSIDE.ADV LOOK.V)))
			(?X_G (?X_L (BE.V (K (PLUR GROCERY.N)))))
			(?X_E (?X_O ((HOME.ADV BRING.V) (K (PLUR GROCERY.N)))))
			(?X_C (?X_N ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N)))
			(?X_A
	   (?X_O MAKE.7.V
	    (KE (?X_N ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N)))))
			(?X_A
	   (?X_O MAKE.8.V
	    (KE (?X_N ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_G)))
			(!W3 (?X_K (BEFORE ?X_E)))
			(!W4 (?X_I (BEFORE ?X_G)))
			(!W5 (?X_I (BEFORE ?X_E)))
			(!W6 (?X_G (BEFORE ?X_E)))
			(!W7 (?X_C (BEFORE ?X_A)))
		)
	)
	(
			"A man finds a bag on a ground."
			"A man looks inside."
			"A bag is grocerys."
			"A man brings grocerys home."
			"A wife of a man is with grocerys dinner."
			"A man make.183s a wife of a man with grocerys dinner."
			"A man make.186s a wife of a man with grocerys dinner."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-67.PR (K BRIGHT.A) ?X_G)) ** ?E)
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
			(?X_I (?X_K ((CAN.AUX (JUST.ADV SEE.V)) ?X_G)))
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
		error composing story schemas
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-68.PR (TWO.D (PLUR DOG.N)))) ** ?E)
		(:STEPS
			(?X_C (?X_A (HAVE.V (TWO.D (PLUR DOG.N)))))
		)
	)
	(
			"X_A has two dogs."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FROM.P ?L1)) ((ADV-A (WITH.P ?X_A)) GO.12.V)) ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PLUR FRIEND.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.12.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.12.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_C (BEFORE ?X_D)))
			(!W7 (?X_E (SAME-TIME ?X_D)))
			(!W8 (?X_E (RIGHT-AFTER ?X_F)))
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
	               (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) GO.13.V)) ?L2)))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A POND.N))
			(!R6 (?X_A LOCAL.A))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
			(!R8 (?X_B (PLUR FRIEND.N)))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.13.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.13.V)))))
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
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-69.PR (K FISHING.N)
	               (KA ((ADV-A (WITH.P ?X_N)) GO.V)) ?X_F ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F LARGE.A))
			(!R2 (?X_F FISH.N))
			(!R3 (?X_I LOCAL.A))
			(!R4 (?X_I POND.N))
			(!R5 (?X_N (PLUR FRIEND.N)))
			(!R6 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_M (?X_O (LOVE.V (K FISHING.N))))
			(?X_K (?X_O (((ADV-A (FROM.P ?L1)) ((ADV-A (WITH.P ?X_N)) GO.12.V)) ?L2)))
			(?X_A (?X_O (LOVE.V (KA ((ADV-A (WITH.P ?X_N)) GO.V)))))
			(?X_H
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_O (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_I)) GO.13.V)) ?L2))))
			(?X_E (?X_O (CATCH.V ?X_F)))
			(?X_C (?X_O ((BACK.PRT ((ADV-A (FOR.P (KA (EAT.V ?X_F)))) BRING.V)) ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_A)))
			(!W2 (?X_M (BEFORE ?X_H)))
			(!W3 (?X_M (BEFORE ?X_E)))
			(!W4 (?X_M (BEFORE ?X_C)))
			(!W5 (?X_K (BEFORE ?X_A)))
			(!W6 (?X_K (BEFORE ?X_H)))
			(!W7 (?X_K (BEFORE ?X_E)))
			(!W8 (?X_K (BEFORE ?X_C)))
			(!W9 (?X_A (BEFORE ?X_H)))
			(!W10 (?X_A (BEFORE ?X_E)))
			(!W11 (?X_A (BEFORE ?X_C)))
			(!W12 (?X_H (BEFORE ?X_E)))
			(!W13 (?X_H (BEFORE ?X_C)))
			(!W14 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"X_O loves fishing."
			"X_O go.225s L2 from L1 with a friends of X_O."
			"X_O loves with a friends of X_O going."
			"X_O go.226s L2 DURING yesterday from L1 to a local pond."
			"X_O catches a large fish."
			"X_O brings a large fish back for eating a large fish."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_B TELL.1.V ?X_C (KA (UP.PRT LOCK.V) ?X_D)) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C AGENT.N))
			(!R3 ((KA (UP.PRT LOCK.V) ?X_D) INFORMATION.N))
			(!R4 (?X_D HOUSE.N))
			(!R5 (?X_C BOY.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B MOM.N))
			(!R8 (?X_B (PERTAIN-TO ?X_A)))
			(!R9 (?X_A MALE.A))
			(!R10 (?X_A AGENT.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (KNOW.V (KA (UP.PRT LOCK.V) ?X_D)))))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V (KA (UP.PRT LOCK.V) ?X_D))))
		)
		(:PARAPHRASES
			(?X_E ((?X_B TELL.1.V ?X_C (KA (UP.PRT LOCK.V) ?X_D)) ** ?X_E))
			(?X_E ((?X_B LET.V ?X_C (KA (KNOW.V (KA (UP.PRT LOCK.V) ?X_D)))) ** ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_F)))
			(!W2 (?X_G (SAME-TIME ?X_F)))
			(!W3 (?X_G (RIGHT-AFTER ?X_H)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B TELL.2.V ?X_C (KA (UP.PRT LOCK.V) ?X_D)) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C AGENT.N))
			(!R3 ((KA (UP.PRT LOCK.V) ?X_D) INFORMATION.N))
			(!R4 (?X_C BOY.N))
			(!R5 (?X_B (PERTAIN-TO ?X_C)))
			(!R6 (?X_B MOM.N))
			(!R7 (?X_D HOUSE.N))
			(!R8 (?X_B (PERTAIN-TO ?X_A)))
			(!R9 (?X_A MALE.A))
			(!R10 (?X_A AGENT.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (KNOW.V (KA (UP.PRT LOCK.V) ?X_D)))))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V (KA (UP.PRT LOCK.V) ?X_D))))
		)
		(:PARAPHRASES
			(?X_E ((?X_B TELL.2.V ?X_C (KA (UP.PRT LOCK.V) ?X_D)) ** ?X_E))
			(?X_E ((?X_B LET.V ?X_C (KA (KNOW.V (KA (UP.PRT LOCK.V) ?X_D)))) ** ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (SAME-TIME ?X_H)))
			(!W2 (?X_E (RIGHT-AFTER ?X_F)))
			(!W3 (?X_G (BEFORE ?X_H)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-70.PR ?X_O (KE (?X_P (HEAR.V ?X_O))) ?X_Q
	               (KE (?X_P (MORE.ADV AFRAID.A))) ?X_P (KA (UP.PRT LOCK.V) ?X_H)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H HOUSE.N))
			(!R2 (?X_Q MOM.N))
			(!R3 (?X_O NOISE.N))
			(!R4 (?X_P BOY.N))
			(!R5 (?X_Q (PERTAIN-TO ?X_P)))
			(!R6 (?X_R MALE.A))
			(!R7 (?X_R AGENT.N))
			(!R8 (?X_Q (PERTAIN-TO ?X_R)))
		)
		(:STEPS
			(?X_N (?X_P (HEAR.V ?X_O)))
			(?X_L (?X_P (THINK.V (KE (?X_P (HEAR.V ?X_O))))))
			(?X_B (?X_P (CALL.V ?X_Q)))
			(?X_J (?X_P (CALL.V ?X_Q)))
			(?X_G (?X_Q TELL.1.V ?X_P (KA (UP.PRT LOCK.V) ?X_H)))
			(?X_C (?X_Q TELL.2.V ?X_P (KA (UP.PRT LOCK.V) ?X_H)))
			(?X_E (?X_A (MAKE.V (KE (?X_P (MORE.ADV AFRAID.A))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_L)))
			(!W2 (?X_N (BEFORE ?X_B)))
			(!W3 (?X_N (BEFORE ?X_J)))
			(!W4 (?X_N (BEFORE ?X_E)))
			(!W5 (?X_L (BEFORE ?X_B)))
			(!W6 (?X_L (BEFORE ?X_J)))
			(!W7 (?X_L (BEFORE ?X_E)))
			(!W8 (?X_B (BEFORE ?X_J)))
			(!W9 (?X_B (BEFORE ?X_E)))
			(!W10 (?X_J (BEFORE ?X_E)))
			(!W11 (?X_G (BEFORE ?X_C)))
		)
	)
	(
			"A boy hears a noise."
			"A boy thinks a boy hears a noise."
			"A boy calls a mom of a boy of a male agent."
			"A boy calls a mom of a boy of a male agent."
			"A mom of a boy of a male agent tell.231s a boy up lock a house."
			"A mom of a boy of a male agent tell.234s a boy up lock a house."
			"X_A makes a boy more afraid."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (((ADV-A (IN.P ?X_C)) ((ADV-A (IN.P ?X_C)) PUT.5.V)) ?X_B))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_C BOX.N))
			(!R4 (NOT (?X_C AGENT.N)))
			(!R5 (?X_B SMALLER-THAN ?X_C))
			(!R6 (?X_B (SO.ADV TINY.A)))
			(!R7 (?X_B BABY.N))
			(!R8 (?X_B COUPLE.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (IN.P ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B (IN.P ?X_C))))
		)
		(:POSTCONDS
			(?P1 (?X_B (IN.P ?X_C)))
		)
		(:PARAPHRASES
			(?X_D (?X_A ((ADV-A (INTO.P ?X_C)) PUT.5.V) ?X_B))
			(?X_D (?X_A ((ADV-A (INSIDE.P ?X_C)) PUT.5.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-71.PR (KE (?X_L TURTLE.V)) ?X_L)) ** ?E)
		(:ROLES
			(!R1 (?X_C HOUR.N))
			(!R2 (?X_F BOX.N))
			(!R3 (?X_I AGENT.N))
			(!R4 (?X_L COUPLE.N))
			(!R5 (?X_L BABY.N))
			(!R6 (?X_L (SO.ADV TINY.A)))
		)
		(:STEPS
			(?X_K (?X_L TURTLE.V))
			(?X_H (?X_I (FIND.V (KE (?X_L TURTLE.V)))))
			(?X_B (?X_I (((ADV-A (FOR.P ?X_C)) KEEP.V) ?X_L)))
			(?X_E (?X_I (((ADV-A (IN.P ?X_F)) ((ADV-A (IN.P ?X_F)) PUT.5.V)) ?X_L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_H)))
			(!W2 (?X_K (BEFORE ?X_B)))
			(!W3 (?X_H (BEFORE ?X_B)))
		)
	)
	(
			"A couple baby so tiny turtles."
			"A agent finds a couple baby so tiny turtles."
			"A agent keeps a couple baby so tiny for a hour."
			"A agent put.237s a couple baby so tiny in a box in a box."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-72.PR (KA LEAVE.V))) ** ?E)
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
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FROM.P ?L1)) (OUT.ADV ((ADV-A (FOR.P ?X_A)) GO.14.V)))
	               ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A BALL.N))
			(!R6 (?X_A PASS.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
			(!R8 (?X_B ARM.N))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.14.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.14.V)))))
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
	(EPI-SCHEMA ((?X_B INFORM.10.V ?X_C ?I) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?X_C BALL.N))
			(!R5 (?X_C PASS.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A ARM.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_D ((?X_B TELL.V ?X_C ?I) ** ?X_D))
			(?X_D ((?X_B LET.V ?X_C (KA (KNOW.V ?I))) ** ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C PLAY.7.V) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?X_B GAME.N))
			(!R5 (NOT (?X_B AGENT.N)))
			(!R6 (?X_A ARM.N))
			(!R7 (?X_A (PERTAIN-TO ?X_C)))
			(!R8 (?X_B PASS.N))
			(!R9 (?X_B BALL.N))
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
		(:PARAPHRASES
			(?X_D (?X_C ((ADV-A (WITH.P ?T)) PLAY.7.V)))
			(?X_D (?X_C PLAY.7.V ?X_B))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-73.PR ?X_K (KA HEAL.V) ?L2 ?X_H ?I)) ** ?E)
		(:ROLES
			(!R1 (?X_K ARM.N))
			(!R2 (?X_H PASS.N))
			(!R3 (?X_H BALL.N))
			(!R4 (?X_K (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(?X_C (MUST.AUX-S (?X_L (LET.V ?X_K (KA HEAL.V)))))
			(?X_J (?X_L PLAY.7.V))
			(?X_G
	   (?X_L (((ADV-A (FROM.P ?L1)) (OUT.ADV ((ADV-A (FOR.P ?X_H)) GO.14.V))) ?L2)))
			(?X_E (?X_L INFORM.10.V ?X_H ?I))
			(?X_A (MUST.AUX-S (?X_L (LET.V ?X_K (KA HEAL.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_A)))
			(!W2 (?X_J (BEFORE ?X_G)))
			(!W3 (?X_J (BEFORE ?X_E)))
			(!W4 (?X_J (BEFORE ?X_A)))
			(!W5 (?X_G (BEFORE ?X_E)))
			(!W6 (?X_G (BEFORE ?X_A)))
			(!W7 (?X_E (BEFORE ?X_A)))
		)
	)
	(
			"X_L lets a arm of X_L healing must."
			"X_L play.1s."
			"X_L go.9s L2 from L1 out for a pass ball."
			"X_L inform.5s a pass ball I."
			"X_L lets a arm of X_L healing must."
	)
)



(
	(EPI-SCHEMA ((?X_B ((OFF.PRT ((ADV-A (OF.P IT86.SK)) BUILD.1.V)) ?O)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?X_A (PERTAIN-TO ?X_B)))
			(!R4 (?X_A GUITAR.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?O EXIST.V)))))
			(?G2 (?X_B (WANT.V (KA (HAVE.V ?O)))))
		)
		(:PRECONDS
			(?I1 (NOT (?O EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?O EXIST.V))
			(?P2 (?X_B (HAVE.V ?O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B PLAY.8.V) ** ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A GUITAR.N))
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
		(:PARAPHRASES
			(?X_C (?X_B ((ADV-A (WITH.P ?T)) PLAY.8.V)))
			(?X_C (?X_B PLAY.8.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_C (BEFORE ?X_D)))
			(!W3 (?X_E (SAME-TIME ?X_D)))
			(!W4 (?X_E (RIGHT-AFTER ?X_F)))
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
	(EPI-SCHEMA ((?X_C PLAY.9.V) ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A SONG.N))
			(!R7 (?X_A (PRETTY.ADV GOOD.A)))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
			(!R9 (?X_B GUITAR.N))
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
		(:PARAPHRASES
			(?X_D (?X_C ((ADV-A (WITH.P ?T)) PLAY.9.V)))
			(?X_D (?X_C PLAY.9.V ?G))
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
	(EPI-SCHEMA ((?X_B (DOWN.PRT PLAY.10.V)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A GUITAR.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
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
		(:PARAPHRASES
			(?X_C (?X_B ((ADV-A (WITH.P ?T)) PLAY.10.V)))
			(?X_C (?X_B PLAY.10.V ?G))
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
	(EPI-SCHEMA ((?X_B ((DOWN.PRT WRITE.1.V) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_A GUITAR.N))
			(!R4 (?X_A (PERTAIN-TO ?X_B)))
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
	(EPI-SCHEMA ((?X_A PLAY.11.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_B GUITAR.N))
			(!R4 (?X_B (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B EXIST.V)))))
			(?G2 (?X_A (WANT.V (KA (HAVE.V ?X_B)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B EXIST.V))
			(?P2 (?X_A (HAVE.V ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (SAME-TIME ?X_F)))
			(!W2 (?X_C (RIGHT-AFTER ?X_D)))
			(!W3 (?X_E (BEFORE ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_Q (COMPOSITE-SCHEMA-74.PR ?X_A ?O ?X_B ?X_P)) ** ?E)
		(:ROLES
			(!R1 (?X_G (PRETTY.ADV GOOD.A)))
			(!R2 (?X_G SONG.N))
			(!R3 (?X_P GUITAR.N))
			(!R4 (?X_Q MAN.N))
			(!R5 (?X_P (PERTAIN-TO ?X_Q)))
		)
		(:STEPS
			(?X_O (?X_Q PLAY.8.V))
			(?X_C (?X_Q PLAY.11.V ?X_P))
			(?X_D (?X_A THING.N))
			(?X_M (?X_Q (FIND.V ?X_A)))
			(?X_K (?X_Q (DOWN.PRT PLAY.10.V)))
			(?X_K (?X_Q ((DOWN.PRT WRITE.1.V) ?X_B)))
			(?X_I (?X_Q ((OFF.PRT ((ADV-A (OF.P ?X_B)) BUILD.1.V)) ?O)))
			(?X_F (?X_Q PLAY.9.V))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_C)))
			(!W2 (?X_O (BEFORE ?X_D)))
			(!W3 (?X_O (BEFORE ?X_M)))
			(!W4 (?X_O (BEFORE ?X_K)))
			(!W5 (?X_O (BEFORE ?X_I)))
			(!W6 (?X_O (BEFORE ?X_F)))
			(!W7 (?X_C (BEFORE ?X_D)))
			(!W8 (?X_C (BEFORE ?X_M)))
			(!W9 (?X_C (BEFORE ?X_K)))
			(!W10 (?X_C (BEFORE ?X_I)))
			(!W11 (?X_C (BEFORE ?X_F)))
			(!W12 (?X_D (BEFORE ?X_K)))
			(!W13 (?X_D (BEFORE ?X_I)))
			(!W14 (?X_D (BEFORE ?X_F)))
			(!W15 (?X_M (BEFORE ?X_K)))
			(!W16 (?X_M (BEFORE ?X_I)))
			(!W17 (?X_M (BEFORE ?X_F)))
			(!W18 (?X_K (BEFORE ?X_I)))
			(!W19 (?X_K (BEFORE ?X_F)))
			(!W20 (?X_I (BEFORE ?X_F)))
		)
	)
	(
			"A man play.18s."
			"A man play.13s a guitar of a man."
			"X_A is thing."
			"A man finds X_A."
			"A man play.20s down."
			"A man write.12s X_B down."
			"A man build.14s O off of X_B."
			"A man play.19s."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_A GET.17.V (K BETTER.A)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A CAT.N))
			(!R2 (NOT ((K BETTER.A) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (K BETTER.A))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V (K BETTER.A)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V (K BETTER.A))))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 ((K BETTER.A) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V (K BETTER.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_B))
			(!W2 (?I1 PRECOND-OF ?X_B))
			(!W3 (?I2 PRECOND-OF ?X_B))
			(!W4 (?I3 PRECOND-OF ?X_B))
			(!W5 (?P1 POSTCOND-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A TAKE.8.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A CAT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B MEDICINE.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
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
	(EPI-SCHEMA ((?X_B (((ADV-A (TO.P ?X_A)) TAKE.9.V) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C CAT.N))
			(!R6 (?X_A VET.N))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (TO.P ?X_B)) GIVE.4.V) ?X_B
	              (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N))))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A FATHER.N))
			(!R2 (NOT ((TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N))))) AGENT.N)))
			(!R3 (?X_B AGENT.N))
			(!R4 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1
	   (?X_A
	    (WANT.V
	     (THAT (?X_B (HAVE.V (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N)))))))))))
		)
		(:PRECONDS
			(?I1 (?X_A HAVE.V (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N)))))))
			(?I2 (NOT (?X_B HAVE.V (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N))))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A HAVE.V (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N))))))))
			(?P2 (?X_B HAVE.V (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N)))))))
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
	(EPI-SCHEMA ((?X_A ((HOME.ADV ((ADV-A (WITH.P ?X_A)) TAKE.10.V)) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
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
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-75.PR ?X_B ?X_J ?X_P
	               (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N))))) ?X_E))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I FEMALE.A))
			(!R2 (?X_I AGENT.N))
			(!R3 (?X_J FLOWER.N))
			(!R4 (?X_J RED.A))
			(!R5 (?X_O FATHER.N))
			(!R6 (?X_P AGENT.N))
			(!R7 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_N (?X_A (((ADV-A (TO.P ?X_P)) GIVE.V) ?X_B)))
			(?X_L
	   (?X_O ((ADV-A (TO.P ?X_P)) GIVE.4.V) ?X_P
	    (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N)))))))
			(?X_F (?X_P (KEEP.V ?X_J)))
			(?X_G (?X_I (LIKE.V ?X_E)))
			(?X_H (?X_D ((HOME.ADV ((ADV-A (WITH.P ?X_D)) TAKE.10.V)) ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_L)))
			(!W2 (?X_N (BEFORE ?X_F)))
			(!W3 (?X_N (BEFORE ?X_G)))
			(!W4 (?X_N (BEFORE ?X_H)))
			(!W5 (?X_L (BEFORE ?X_F)))
			(!W6 (?X_L (BEFORE ?X_G)))
			(!W7 (?X_L (BEFORE ?X_H)))
		)
	)
	(
			"X_A gives X_B to a agent."
			"A father of a agent give.42s a agent two red one to a agent."
			"A agent keeps a flower red."
			"A female agent likes X_E."
			"X_D take.48s X_E home with X_D."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FROM.P ?L1)) ((ADV-A (DOWN.P ?X_A)) FLOAT.1.V)) ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A RIVER.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B BOAT.N))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) FLOAT.1.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) FLOAT.1.V)))))
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
	              (((ADV-A (FROM.P ?L1))
	                ((ADV-A
	                  (ON.P (K (L X (AND (X TOP.N) (X (OF.P (THE.D BOAT.N))))))))
	                 CLIMB.2.V))
	               ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A BOAT.N))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) CLIMB.2.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) CLIMB.2.V)))))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-76.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_N BOAT.N))
			(!R2 (?X_M RIVER.N))
			(!R3 (?X_O MAN.N))
			(!R4 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_J (?X_N (OVER.PRT TIP.V)))
			(?X_L (?X_O (((ADV-A (FROM.P ?L1)) ((ADV-A (DOWN.P ?X_M)) FLOAT.1.V)) ?L2)))
			(?X_B (?X_N (OVER.PRT TIP.V)))
			(?X_H
	   (?X_O
	    (((ADV-A (FROM.P ?L1))
	      ((ADV-A (ON.P (K (L X (AND (X TOP.N) (X (OF.P (THE.D BOAT.N))))))))
	       CLIMB.2.V))
	     ?L2)))
			(?X_F (?X_O RESCUE.V))
			(?X_D (?X_O RESCUE.V))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_B)))
			(!W2 (?X_J (BEFORE ?X_H)))
			(!W3 (?X_J (BEFORE ?X_F)))
			(!W4 (?X_J (BEFORE ?X_D)))
			(!W5 (?X_L (BEFORE ?X_B)))
			(!W6 (?X_L (BEFORE ?X_H)))
			(!W7 (?X_L (BEFORE ?X_F)))
			(!W8 (?X_L (BEFORE ?X_D)))
			(!W9 (?X_B (BEFORE ?X_H)))
			(!W10 (?X_B (BEFORE ?X_F)))
			(!W11 (?X_B (BEFORE ?X_D)))
			(!W12 (?X_H (BEFORE ?X_F)))
			(!W13 (?X_H (BEFORE ?X_D)))
		)
	)
	(
			"A boat of a man tips over."
			"A man float.49s L2 from L1 down a river."
			"A boat of a man tips over."
			"A man climb.50s L2 from L1 on top of."
			"A man rescues."
			"A man rescues."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_A))) INFORM.11.V) ?X_C
	               ?I))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B BROTHER.N))
			(!R2 (?X_C AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?X_A CAN.N))
			(!R5 (?X_A (OF.P (K PAINT.N))))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_D ((?X_B TELL.V ?X_C ?I) ** ?X_D))
			(?X_D ((?X_B LET.V ?X_C (KA (KNOW.V ?I))) ** ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_A))) INFORM.12.V) ?X_C
	               ?I))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C BROTHER.N))
			(!R2 (?I INFORMATION.N))
			(!R3 (?X_A CAN.N))
			(!R4 (?X_A (OF.P (K PAINT.N))))
			(!R5 (?X_B AGENT.N))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_D ((?X_C TELL.V ?X_C ?I) ** ?X_D))
			(?X_D ((?X_C LET.V ?X_C (KA (KNOW.V ?I))) ** ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A TELL.3.V ?X_B (KA (UP.PRT CLEAN.V) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B BROTHER.N))
			(!R3 ((KA (UP.PRT CLEAN.V) ?X_C) INFORMATION.N))
			(!R4 (?X_C (OF.P (K PAINT.N))))
			(!R5 (?X_C CAN.N))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (KNOW.V (KA (UP.PRT CLEAN.V) ?X_C)))))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V (KA (UP.PRT CLEAN.V) ?X_C))))
		)
		(:PARAPHRASES
			(?X_D ((?X_A TELL.3.V ?X_B (KA (UP.PRT CLEAN.V) ?X_C)) ** ?X_D))
			(?X_D ((?X_A LET.V ?X_B (KA (KNOW.V (KA (UP.PRT CLEAN.V) ?X_C)))) ** ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-77.PR ?X_J ?X_O ?I ?X_N
	               (KA (UP.PRT CLEAN.V) ?X_J)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_O AGENT.N))
			(!R2 (?X_G GROUND.N))
			(!R3 (?X_J CAN.N))
			(!R4 (?X_J (OF.P (K PAINT.N))))
			(!R5 (?X_M BAD.A))
			(!R6 (?X_M MOOD.N))
			(!R7 (?X_N BROTHER.N))
			(!R8 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_L (?X_N ((ADV-A (IN.P ?X_M)) BE.V)))
			(?X_I (?X_N (OPEN.V ?X_J)))
			(?X_F (?X_N (((ADV-A (ON.P ?X_G)) SPLASH.V) ?X_J)))
			(?X_D (?X_O TELL.3.V ?X_N (KA (UP.PRT CLEAN.V) ?X_J)))
			(?X_B
	   (?X_N (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_J))) INFORM.11.V) ?X_O ?I)))
			(?X_B
	   (?X_N (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_J))) INFORM.12.V) ?X_N ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_I)))
			(!W2 (?X_L (BEFORE ?X_F)))
			(!W3 (?X_I (BEFORE ?X_F)))
			(!W4 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A brother of a agent is in a bad mood."
			"A brother of a agent opens a can of paint."
			"A brother of a agent splashes a can of paint on a ground."
			"A agent tell.59s a brother of a agent up clean a can of paint."
			"A brother of a agent inform.60s a agent I for up clean a can of paint."
			"A brother of a agent inform.62s a brother of a agent I for up clean a can of paint."
	)
)



(
	(EPI-SCHEMA ((?X_G
	              (COMPOSITE-SCHEMA-78.PR (KA (PLAY.V (K BASEBALL.N))) ?X_J ?X_K))
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
			(?X_F (?X_G (UP.ADV ((ADV-A (FOR.P (KA HIT.V))) BE.V))))
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
			"A able make winning is up for hitting."
			"A able make winning hits a long drive."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FROM.P ?L1)) (ALMOST.ADV (OVER.PRT RUN.7.V))) ?X_C))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C LOCATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C FRIEND.N))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
			(!R7 (?X_A WAY.N))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
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
		(:PARAPHRASES
			(?X_D
	   (?X_B
	    ((ADV-A (FOR.P ?X_C))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_C)) RUN.7.V)))
	    ?X_C))
			(?X_D
	   (?X_B
	    ((ADV-A (FOR.P ?X_C))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_C)) RUN.7.V)))))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-79.PR ?X_G ?X_K)) ** ?E)
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
			(?X_B (?X_L (((ADV-A (FROM.P ?L1)) (ALMOST.ADV (OVER.PRT RUN.7.V))) ?X_K)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_F)))
			(!W2 (?X_I (BEFORE ?X_D)))
			(!W3 (?X_I (BEFORE ?X_B)))
			(!W4 (?X_F (BEFORE ?X_D)))
			(!W5 (?X_F (BEFORE ?X_B)))
			(!W6 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent is at work."
			"A agent uses a walking stacker."
			"A friend of a agent stands in a way of a agent."
			"A agent run.93s a friend of a agent from L1 almost over."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_A
	              ((CAN.AUX MAKE.9.V) (K (L X (AND (X GREEN.A) (X PAINT.N))))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT ((K (L X (AND (X GREEN.A) (X PAINT.N)))) AGENT.N)))
			(!R3 (?X_A (HAS.V (NO.D (PLUR FLOWER.N)))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT ((K (L X (AND (X GREEN.A) (X PAINT.N)))) EXIST.V)))))
			(?G2 (?X_A (WANT.V (KA (HAVE.V (K (L X (AND (X GREEN.A) (X PAINT.N)))))))))
		)
		(:PRECONDS
			(?I1 (NOT ((K (L X (AND (X GREEN.A) (X PAINT.N)))) EXIST.V)))
		)
		(:POSTCONDS
			(?P1 ((K (L X (AND (X GREEN.A) (X PAINT.N)))) EXIST.V))
			(?P2 (?X_A (HAVE.V (K (L X (AND (X GREEN.A) (X PAINT.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-80.PR
	               (K
	                (L X
	                 (AND (X BLUE.A)
	                      ((X PAINT.N) AND (X AND) (X YELLOW.A) (X PAINT.N)))))
	               (K (L X (AND (X GREEN.A) (X PAINT.N))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E (PLUR LEAF.N)))
			(!R2 (?X_E GREEN.A))
			(!R3 (?X_H (HAS.V (NO.D (PLUR FLOWER.N)))))
		)
		(:STEPS
			(?X_J (?X_A STEM.V))
			(?X_D
	   (?X_E
	    ((CAN.AUX MIX.V)
	     (K
	      (L X
	       (AND (X BLUE.A) ((X PAINT.N) AND (X AND) (X YELLOW.A) (X PAINT.N))))))))
			(?X_G (?X_H ((CAN.AUX MAKE.9.V) (K (L X (AND (X GREEN.A) (X PAINT.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_D)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A GET.18.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))) **
	             ?X_B)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT ((KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N)))) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N)))))))
		)
		(:GOALS
			(?G1
	   (?X_A
	    (WANT.V
	     (THAT (?X_A (HAVE.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N)))))))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 ((KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N)))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_B))
			(!W2 (?I1 PRECOND-OF ?X_B))
			(!W3 (?I2 PRECOND-OF ?X_B))
			(!W4 (?I3 PRECOND-OF ?X_B))
			(!W5 (?P1 POSTCOND-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
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
	              (COMPOSITE-SCHEMA-81.PR ?X_B ?X_M
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
			(?X_D (?X_N GET.18.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_J)))
			(!W2 (?X_L (BEFORE ?X_H)))
			(!W3 (?X_L (BEFORE ?X_F)))
			(!W4 (?X_L (BEFORE ?X_D)))
			(!W5 (?X_J (BEFORE ?X_H)))
			(!W6 (?X_J (BEFORE ?X_F)))
			(!W7 (?X_J (BEFORE ?X_D)))
			(!W8 (?X_H (BEFORE ?X_F)))
			(!W9 (?X_H (BEFORE ?X_D)))
			(!W10 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A man pours a glass of water water."
			"A man looks in a glass of water water."
			"X_A is X_B."
			"A man pours a glass of water water out."
			"A man get.115s water in another glass."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_E (COMPOSITE-SCHEMA-82.PR (KE (?X_A (CAN.AUX BE.V))) ?X_H ?X_I))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E (AS.ADV BLUE.A)))
			(!R2 (?X_E SKY.N))
			(!R3 (?X_G SING.V))
			(!R4 (?X_F MAMMA.N))
			(!R5 (?X_F (PERTAIN-TO ?X_G)))
			(!R6 (?X_H (PLUR WOOD.N)))
			(!R7 (?X_I GOOD.A))
			(!R8 (?X_I SHADE.N))
		)
		(:STEPS
			(?X_C (?X_E (AS.P (KE (?X_A (CAN.AUX BE.V))))))
			(?X_D ((SET-OF ?X_G ?X_F) (IN.P ?X_H)))
			(?X_K (?X_B (MAKE.V ?X_I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_D)))
			(!W2 (?X_C (BEFORE ?X_K)))
			(!W3 (?X_D (BEFORE ?X_K)))
		)
	)
	(
			"A as blue sky is as."
			"A sing and a mamma of a sing are in."
			"X_B makes a good shade."
	)
)



(
	(EPI-SCHEMA ((?X_C (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) GO.15.V)) ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A STUDIO.N))
			(!R6 (?X_B WALL.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.15.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.15.V)))))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (TO.P ?X_C)) GIVE.5.V) ?X_C ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_C AGENT.N))
			(!R4 (?X_D JACKET.N))
			(!R5 (?X_A (PERTAIN-TO ?X_C)))
			(!R6 (?X_A WALL.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (HAVE.V ?X_D))))))
		)
		(:PRECONDS
			(?I1 (?X_B HAVE.V ?X_D))
			(?I2 (NOT (?X_C HAVE.V ?X_D)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B HAVE.V ?X_D)))
			(?P2 (?X_C HAVE.V ?X_D))
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
	(EPI-SCHEMA ((?X_B TAKE.11.V (TWO.D (PLUR PICTURE.N))) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((TWO.D (PLUR PICTURE.N)) AGENT.N)))
			(!R3 (?X_A STUDIO.N))
			(!R4 (NOT (?X_B = (TWO.D (PLUR PICTURE.N)))))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V (TWO.D (PLUR PICTURE.N))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (TWO.D (PLUR PICTURE.N)))))
			(?I2 (?X_B (AT.P ?X_A)))
			(?I3 ((TWO.D (PLUR PICTURE.N)) (AT.P ?X_A)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (TWO.D (PLUR PICTURE.N))))
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
	(EPI-SCHEMA ((MUST.AUX-S
	              (?X_C
	               (TAKE.12.V
	                (K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N))))))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT ((K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N))))) AGENT.N)))
			(!R3 (?X_B STUDIO.N))
			(!R4 (NOT (?X_C = (K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N))))))))
			(!R5 (?X_A (PERTAIN-TO ?X_C)))
			(!R6 (?X_A WALL.N))
		)
		(:GOALS
			(?G1
	   (?X_C
	    (WANT.V
	     (THAT
	      (?X_C (HAVE.V (K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N)))))))))))
		)
		(:PRECONDS
			(?I1
	   (NOT (?X_C HAVE.V (K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N))))))))
			(?I2 (?X_C (AT.P ?X_B)))
			(?I3 ((K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N))))) (AT.P ?X_B)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V (K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N)))))))
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
	(EPI-SCHEMA ((?X_B (((ADV-A (TO.P ?X_A)) TAKE.13.V) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B JANITOR.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C MOP.V))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
			(!R7 (?X_A SINK.N))
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
	(EPI-SCHEMA ((?X_A ((OUT.ADV GET.12.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A JANITOR.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B (PERTAIN-TO ?X_A)))
			(!R6 (?X_B MOP.V))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (IN.P ?X_C)) (AWAY.ADV PUT.6.V)) ?X_B)) ** ?X_D)
		(:ROLES
			(!R1 (?X_A JANITOR.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_C CONTAINER.N))
			(!R4 (NOT (?X_C AGENT.N)))
			(!R5 (?X_B SMALLER-THAN ?X_C))
			(!R6 (?X_B MOP.V))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
			(!R8 (?X_C SINK.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (IN.P ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B (IN.P ?X_C))))
		)
		(:POSTCONDS
			(?P1 (?X_B (IN.P ?X_C)))
		)
		(:PARAPHRASES
			(?X_D (?X_A ((ADV-A (INTO.P ?X_C)) PUT.6.V) ?X_B))
			(?X_D (?X_A ((ADV-A (INSIDE.P ?X_C)) PUT.6.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.16.V) (K BLIND.A)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K BLIND.A) LOCATION.N))
			(!R4 (NOT (?L1 = (K BLIND.A))))
			(!R5 (?X_A OLD.A))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P (K BLIND.A))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (K BLIND.A)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (K BLIND.A))))
		)
		(:PARAPHRASES
			(?X_C
	   (?X_A
	    ((ADV-A (FOR.P (K BLIND.A)))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K BLIND.A))) GO.16.V)))
	    (K BLIND.A)))
			(?X_C
	   (?X_A
	    ((ADV-A (FOR.P (K BLIND.A)))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K BLIND.A))) GO.16.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_B (CONSEC ?X_C)))
			(!W7 (?X_B (DURING ?X_D)))
			(!W8 (?X_C (DURING ?X_D)))
			(!W9 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.17.V) (K BLIND.A)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K BLIND.A) LOCATION.N))
			(!R4 (NOT (?L1 = (K BLIND.A))))
			(!R5 (?X_A OLD.A))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P (K BLIND.A))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (K BLIND.A)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (K BLIND.A))))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P (K BLIND.A)))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K BLIND.A))) GO.17.V)))
	    (K BLIND.A)))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P (K BLIND.A)))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K BLIND.A))) GO.17.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (DURING ?X_D)))
			(!W7 (?X_C (CONSEC ?X_B)))
			(!W8 (?X_C (DURING ?X_D)))
			(!W9 (?X_D (AT-ABOUT ?X_E)))
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
	              (COMPOSITE-SCHEMA-83.PR ?X_J
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
			(?X_C (?X_K ((ADV-A (FROM.P ?L1)) GO.16.V) (K BLIND.A)))
			(?X_C (?X_K ((ADV-A (FROM.P ?L1)) GO.17.V) (K BLIND.A)))
			(?X_I (?X_B ?X_K (HAVE.V ?X_J)))
			(?X_G (?X_B (LOOK.V (K ((ADV-A (FOR.P (K (PLUR YEAR.N)))) (FOR.P ?X_K))))))
			(?X_E
	   (?X_A
	    ((LONGER.ADV
	      (MUCH.ADV ((ADV-A (FOR.P (KA ((ADV-A (OVER.P ?X_A)) GET.V)))) TAKE.V)))
	     ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_I)))
			(!W2 (?X_C (BEFORE ?X_G)))
			(!W3 (?X_C (BEFORE ?X_E)))
			(!W4 (?X_I (BEFORE ?X_G)))
			(!W5 (?X_I (BEFORE ?X_E)))
			(!W6 (?X_G (BEFORE ?X_E)))
		)
	)
	(
			"A old agent go.137s blind from L1."
			"A old agent go.138s blind from L1."
			"X_B has a time long."
			"X_B looks for years for a old agent."
			"X_A takes X_B longer much for over X_A getting."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-84.PR (KE (AND (?X_B RED.A) (?X_B YELLOW.A)))
	               (K PURPLE.A)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (IN.P ?X_D)) PLANT.1.V) ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_D CONTAINER.N))
			(!R4 (NOT (?X_D AGENT.N)))
			(!R5 (?X_C SMALLER-THAN ?X_D))
			(!R6 (?X_C TREE.N))
			(!R7 (?X_D (OF.P (KE (?X_A HOUSE.N)))))
			(!R8 (?X_D WINDOW.N))
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
		(:PARAPHRASES
			(?X_E (?X_B ((ADV-A (INTO.P ?X_D)) PLANT.1.V) ?X_C))
			(?X_E (?X_B ((ADV-A (INSIDE.P ?X_D)) PLANT.1.V) ?X_C))
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
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-85.PR ?X_D ?X_L)) ** ?E)
		(:ROLES
			(!R1 (?X_D (OF.P (KE (?X_C HOUSE.N)))))
			(!R2 (?X_D WINDOW.N))
			(!R3 (?X_G BRANCH.N))
			(!R4 (?X_L TREE.N))
			(!R5 (?X_M MAN.N))
		)
		(:STEPS
			(?X_I (?X_L ((ADV-A (FOR.P (KA (VERY.ADV TALL.A)))) GROW.V)))
			(?X_F (?X_G ((ADV-A (FROM.P ?X_L)) FALL.V)))
			(?X_B (?X_G (BREAK.V ?X_D)))
			(?X_K (?X_M ((ADV-A (IN.P ?X_D)) PLANT.1.V) ?X_L))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_F)))
			(!W2 (?X_I (BEFORE ?X_B)))
			(!W3 (?X_F (BEFORE ?X_B)))
		)
	)
	(
			"A tree grows for very tall."
			"A branch falls from a tree."
			"A branch breaks a of X_C house window."
			"A man plant.168s a tree in a of X_C house window."
	)
)



(
	(EPI-SCHEMA ((MUST.AUX-S (?X_C ((JUST.ADV EAT.2.V) (K (PLUR FOOD.N))))) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_C SON.N))
			(!R2 ((K (PLUR FOOD.N)) FOOD.N))
			(!R3 (?X_A AGENT.N))
			(!R4 (?X_C (PERTAIN-TO ?X_A)))
			(!R5 (?X_D (IMPINGES-ON ?X_B)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (NOT (?X_C HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V (K (PLUR FOOD.N))))
			(?I2 (?X_C HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (HAVE.V (K (PLUR FOOD.N))))))
			(?P2 (NOT (?X_C HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_D))
			(!W2 (?I1 BEFORE ?X_D))
			(!W3 (?X_D CAUSE-OF ?P1))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((MUST.AUX-S (?X_C ((JUST.ADV EAT.3.V) (K (PLUR FOOD.N))))) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_C SON.N))
			(!R2 ((K (PLUR FOOD.N)) FOOD.N))
			(!R3 (?X_D (IMPINGES-ON ?X_A)))
			(!R4 (?X_C (PERTAIN-TO ?X_B)))
			(!R5 (?X_B AGENT.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (NOT (?X_C HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V (K (PLUR FOOD.N))))
			(?I2 (?X_C HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (HAVE.V (K (PLUR FOOD.N))))))
			(?P2 (NOT (?X_C HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_D))
			(!W2 (?I1 BEFORE ?X_D))
			(!W3 (?X_D CAUSE-OF ?P1))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-86.PR ?X_F
	               (K
	                (L X
	                 (AND (X (MORE.ADV (ON.P ?X_H))) (X THAN.P) (X (IN.P ?X_H)))))
	               (KE
	                (?X_H
	                 (GET.V
	                  (L X
	                   (AND (X (MORE.ADV (ON.P ?X_H))) (X THAN.P)
	                        (X (IN.P ?X_H)))))))
	               (K (PLUR FOOD.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I AGENT.N))
			(!R2 (?X_F (PLUR PEACH.N)))
			(!R3 (?X_H SON.N))
			(!R4 (?X_H (PERTAIN-TO ?X_I)))
			(!R5 (?X_J (IMPINGES-ON ?X_K)))
		)
		(:STEPS
			(?X_E (?X_H (LOVE.V ?X_F)))
			(?X_C
	   (?X_H
	    (GET.V
	     (K (L X (AND (X (MORE.ADV (ON.P ?X_H))) (X THAN.P) (X (IN.P ?X_H))))))))
			(?X_L
	   (?X_I
	    (THINK.V
	     (KE
	      (?X_H
	       (GET.V
	        (L X (AND (X (MORE.ADV (ON.P ?X_H))) (X THAN.P) (X (IN.P ?X_H))))))))))
			(?X_J (MUST.AUX-S (?X_H ((JUST.ADV EAT.2.V) (K (PLUR FOOD.N))))))
			(?X_J (MUST.AUX-S (?X_H ((JUST.ADV EAT.3.V) (K (PLUR FOOD.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_C)))
			(!W2 (?X_E (BEFORE ?X_L)))
			(!W3 (?X_C (BEFORE ?X_L)))
		)
	)
	(
			"A son of a agent loves a peachs."
			"A son of a agent gets on than in."
			"A agent thinks a son of a agent gets on than in."
			"A son of a agent eat.172s foods must just."
			"A son of a agent eat.174s foods must just."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-87.PR ?X_A)) ** ?E)
		(:ROLES
			(!R1 (?X_A BIRD.N))
			(!R2 (?X_A BABY.N))
		)
		(:STEPS
			(?X_C (NOT (?X_A ((CAN.AUX HAVE.V) ?X_A))))
		)
	)
	(
			"A bird baby has a bird baby not can."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_A
	              ((ADV-A (ON.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_C)))))))
	               ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_C)))))))
	                ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_C)))))))
	                 SIT.4.V))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A GIRL.N))
			(!R2 (NOT ((K (L X (AND (X FRONT.N) (X (OF.P ?X_C))))) AGENT.N)))
			(!R3 ((K (L X (AND (X FRONT.N) (X (OF.P ?X_C))))) FURNITURE.N))
			(!R4 (?L LOCATION.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L)))
			(?I2 ((K (L X (AND (X FRONT.N) (X (OF.P ?X_C))))) (AT.P ?L)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (WITH.P ?X_A)) PLAY.12.V)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A HAIR.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_B FEMALE.A))
			(!R9 (?X_B AGENT.N))
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
		(:PARAPHRASES
			(?X_D (?X_C ((ADV-A (WITH.P ?T)) PLAY.12.V)))
			(?X_D (?X_C PLAY.12.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_D (SAME-TIME ?X_G)))
			(!W3 (?X_D (RIGHT-AFTER ?X_E)))
			(!W4 (?X_F (BEFORE ?X_G)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (WITH.P ?X_A)) PLAY.13.V)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A HAIR.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_B FEMALE.A))
			(!R9 (?X_B AGENT.N))
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
		(:PARAPHRASES
			(?X_E (?X_C ((ADV-A (WITH.P ?T)) PLAY.13.V)))
			(?X_E (?X_C PLAY.13.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_E (RIGHT-AFTER ?X_D)))
			(!W3 (?X_E (SAME-TIME ?X_G)))
			(!W4 (?X_F (BEFORE ?X_G)))
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
	(EPI-SCHEMA ((?X_A TELL.4.V ?X_B (KA STOP.V)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A GIRL.N))
			(!R2 (?X_B AGENT.N))
			(!R3 ((KA STOP.V) INFORMATION.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (KNOW.V (KA STOP.V)))))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V (KA STOP.V))))
		)
		(:PARAPHRASES
			(?X_C ((?X_A TELL.4.V ?X_B (KA STOP.V)) ** ?X_C))
			(?X_C ((?X_A LET.V ?X_B (KA (KNOW.V (KA STOP.V)))) ** ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-88.PR ?X_O ?X_P ?X_C ?X_B (KA STOP.V))) ** ?E)
		(:ROLES
			(!R1 (?X_P HAIR.N))
			(!R2 (?X_O GIRL.N))
			(!R3 (?X_Q FEMALE.A))
			(!R4 (?X_Q AGENT.N))
			(!R5 (?X_P (PERTAIN-TO ?X_Q)))
		)
		(:STEPS
			(?X_N (?X_B (LIKE.V ?X_O)))
			(?X_J (?X_B (WITH.P ?X_P)))
			(?X_L
	   (?X_O
	    ((ADV-A (ON.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_B)))))))
	     ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_B)))))))
	      ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_B))))))) SIT.4.V)))))
			(?X_D (?X_B ((ADV-A (WITH.P ?X_P)) PLAY.12.V)))
			(?X_D (?X_B ((ADV-A (WITH.P ?X_P)) PLAY.13.V)))
			(?X_H (?X_O TELL.4.V ?X_B (KA STOP.V)))
			(?X_F (?X_B (STOP.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_L)))
			(!W2 (?X_N (BEFORE ?X_D)))
			(!W3 (?X_N (BEFORE ?X_H)))
			(!W4 (?X_N (BEFORE ?X_F)))
			(!W5 (?X_J (BEFORE ?X_D)))
			(!W6 (?X_J (BEFORE ?X_H)))
			(!W7 (?X_J (BEFORE ?X_F)))
			(!W8 (?X_L (BEFORE ?X_D)))
			(!W9 (?X_L (BEFORE ?X_H)))
			(!W10 (?X_L (BEFORE ?X_F)))
			(!W11 (?X_D (BEFORE ?X_H)))
			(!W12 (?X_D (BEFORE ?X_F)))
			(!W13 (?X_H (BEFORE ?X_F)))
		)
	)
	(
			"X_B likes a girl."
			"X_B is with."
			"A girl sit.187s on front of in front of in front of."
			"X_B play.188s with a hair of a female agent."
			"X_B play.189s with a hair of a female agent."
			"A girl tell.186s X_B stopping."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) RUN.8.V) (K (OVER.PRT (TO.P ?X_C))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (OVER.PRT (TO.P ?X_C))) LOCATION.N))
			(!R4 (NOT (?L1 = (K (OVER.PRT (TO.P ?X_C))))))
			(!R5 (?X_C (PLUR KID.N)))
			(!R6 (?X_B BIG.A))
			(!R7 (?X_A (PERTAIN-TO ?X_C)))
			(!R8 (?X_A (PERTAIN-TO ?X_A)))
			(!R9 (?X_A FRIEND.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (K (OVER.PRT (TO.P ?X_C))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K (OVER.PRT (TO.P ?X_C)))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K (OVER.PRT (TO.P ?X_C))))))
		)
		(:PARAPHRASES
			(?X_D
	   (?X_B
	    ((ADV-A (FOR.P (K (OVER.PRT (TO.P ?X_C)))))
	     ((ADV-A (FROM.P ?L1))
	      ((ADV-A (TO.P (K (OVER.PRT (TO.P ?X_C))))) RUN.8.V)))
	    (K (OVER.PRT (TO.P ?X_C)))))
			(?X_D
	   (?X_B
	    ((ADV-A (FOR.P (K (OVER.PRT (TO.P ?X_C)))))
	     ((ADV-A (FROM.P ?L1))
	      ((ADV-A (TO.P (K (OVER.PRT (TO.P ?X_C))))) RUN.8.V)))))
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-89.PR (KE (?X_L HOUSE.N)) (K HOME.N)
	               (K (OVER.PRT (TO.P ?X_M)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M (PLUR KID.N)))
			(!R2 (?X_H YARD.N))
			(!R3 (?X_I BIG.A))
			(!R4 (?X_I DOG.N))
			(!R5 (?X_L FRIEND.N))
			(!R6 (?X_L (PERTAIN-TO ?X_L)))
			(!R7 (?X_L (PERTAIN-TO ?X_M)))
		)
		(:STEPS
			(?X_A (?X_L HOUSE.N))
			(?X_B ((TWO.D (PLUR KID.N)) (VISIT.V (KE (?X_L HOUSE.N)))))
			(?X_K (NOT (?X_L (BE.V (K HOME.N)))))
			(?X_C (NOT (?X_L (BE.V (K HOME.N)))))
			(?X_G (?X_I ((ADV-A (IN.P ?X_H)) BE.V)))
			(?X_E (?X_I ((ADV-A (FROM.P ?L1)) RUN.8.V) (K (OVER.PRT (TO.P ?X_M)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_B)))
			(!W2 (?X_A (BEFORE ?X_C)))
			(!W3 (?X_A (BEFORE ?X_G)))
			(!W4 (?X_A (BEFORE ?X_E)))
			(!W5 (?X_B (BEFORE ?X_C)))
			(!W6 (?X_B (BEFORE ?X_G)))
			(!W7 (?X_B (BEFORE ?X_E)))
			(!W8 (?X_K (BEFORE ?X_C)))
			(!W9 (?X_K (BEFORE ?X_G)))
			(!W10 (?X_K (BEFORE ?X_E)))
			(!W11 (?X_C (BEFORE ?X_G)))
			(!W12 (?X_C (BEFORE ?X_E)))
			(!W13 (?X_G (BEFORE ?X_E)))
		)
	)
	(
			"A friend of a friend of X_L of a kids of a kids is house."
			"Two kids visit a friend of a friend of X_L of a kids of a kids house."
			"A friend of a friend of X_L of a kids of a kids is home not."
			"A friend of a friend of X_L of a kids of a kids is home not."
			"A big dog is in a yard."
			"A big dog run.1s over to a kids from L1."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FROM.P ?L1)) ((ADV-A (INTO.P ?X_A)) WALK.3.V)) ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B CAT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A LIVING.N))
			(!R6 (?X_A ROOM.N))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) WALK.3.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) WALK.3.V)))))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (WITH.P ?X_A)) PLAY.14.V) ?X_D)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C CAT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_A BALL.N))
			(!R4 (?X_B FLOOR.N))
			(!R5 (?X_A (ON.P ?X_B)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D EXIST.V)))))
			(?G2 (?X_C (WANT.V (KA (HAVE.V ?X_D)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D EXIST.V)))
		)
		(:POSTCONDS
			(?X_G (?X_D EXIST.V))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (WITH.P ?X_A)) PLAY.15.V) ?X_D)) ** ?X_G)
		(:ROLES
			(!R1 (?X_C CAT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_A BALL.N))
			(!R4 (?X_A (ON.P ?X_B)))
			(!R5 (?X_B FLOOR.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D EXIST.V)))))
			(?G2 (?X_C (WANT.V (KA (HAVE.V ?X_D)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D EXIST.V)))
		)
		(:POSTCONDS
			(?X_E (?X_D EXIST.V))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (WITH.P ?X_A)) PLAY.16.V)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C CAT.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A BALL.N))
			(!R7 (?X_A (ON.P ?X_B)))
			(!R8 (?X_B FLOOR.N))
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
		(:PARAPHRASES
			(?X_D (?X_C ((ADV-A (WITH.P ?T)) PLAY.16.V)))
			(?X_D (?X_C PLAY.16.V ?G))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-90.PR ?X_N ?L2 ?X_A)) ** ?E)
		(:ROLES
			(!R1 (?X_N BALL.N))
			(!R2 (?X_L LIVING.N))
			(!R3 (?X_L ROOM.N))
			(!R4 (?X_M CAT.N))
			(!R5 (?X_O FLOOR.N))
			(!R6 (?X_N (ON.P ?X_O)))
		)
		(:STEPS
			(?X_K (?X_M (((ADV-A (FROM.P ?L1)) ((ADV-A (INTO.P ?X_L)) WALK.3.V)) ?L2)))
			(?X_I (?X_A (BE.V ?X_N)))
			(?X_G (?X_M ((AROUND.ADV SWAT.V) ?X_N)))
			(?X_E (?X_M (((ADV-A (WITH.P ?X_N)) PLAY.14.V) ?X_A)))
			(?X_E (?X_M (((ADV-A (WITH.P ?X_N)) PLAY.15.V) ?X_A)))
			(?X_E (?X_M ((ADV-A (WITH.P ?X_N)) PLAY.16.V)))
			(?X_C (?X_M (LIKE.V ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_G)))
			(!W3 (?X_K (BEFORE ?X_E)))
			(!W4 (?X_K (BEFORE ?X_C)))
			(!W5 (?X_I (BEFORE ?X_G)))
			(!W6 (?X_I (BEFORE ?X_E)))
			(!W7 (?X_I (BEFORE ?X_C)))
			(!W8 (?X_G (BEFORE ?X_E)))
			(!W9 (?X_G (BEFORE ?X_C)))
			(!W10 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A cat walk.26s L2 from L1 into a living room."
			"X_A is a ball on a floor."
			"A cat swats a ball on a floor around."
			"A cat play.30s X_A with a ball on a floor."
			"A cat play.32s X_A with a ball on a floor."
			"A cat play.34s with a ball on a floor."
			"A cat likes a ball on a floor."
	)
)



(
	(EPI-SCHEMA ((?X_A (((ADV-A (FROM.P ?L1)) (DOWN.ADV FALL.6.V)) ?L2)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) FALL.6.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) FALL.6.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_D)))
			(!W7 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.1.V ?Y ?A) ** ?E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?Y AGENT.N))
			(!R3 (?A ACTION.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V ?Y ?A)))
			(?G2 (?X_A (WANT.V (THAT (?X_A (DO.V ?A))))))
		)
		(:STEPS
			(?X_B (?X_A ((DOWN.ADV ASK.V) ?Y ?A)))
			(?E2 (?Y (DO.V ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?X_B))
			(!W2 (?X_B CAUSE-OF ?E2))
			(!W3 (?X_B (AT-ABOUT ?X_D)))
			(!W4 (?X_C (AT-ABOUT ?X_D)))
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.2.V ?Y ?A) ** ?E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?Y AGENT.N))
			(!R3 (?A ACTION.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V ?Y ?A)))
			(?G2 (?X_A (WANT.V (THAT (?X_A (DO.V ?A))))))
		)
		(:STEPS
			(?X_B (?X_A (ASK.V ?Y ?A)))
			(?E2 (?Y (DO.V ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?X_B))
			(!W2 (?X_B CAUSE-OF ?E2))
			(!W3 (?X_B (AT-ABOUT ?X_D)))
			(!W4 (?X_C (AT-ABOUT ?X_D)))
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
	              (COMPOSITE-SCHEMA-91.PR (K ROPE.N) ?X_B (KA (IN.PRT JUMP.V)) ?L2 ?Y
	               ?A))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K {REF}.N))
			(!R2 (?X_K (OF.P ?X_L)))
		)
		(:STEPS
			(?X_J (?X_K (JUMP.V (K ROPE.N))))
			(?X_H (?X_A (ASK.V ?X_B (KA (IN.PRT JUMP.V)))))
			(?X_D (?X_B (((ADV-A (FROM.P ?L1)) (DOWN.ADV FALL.6.V)) ?L2)))
			(?E_1 (?X_B REQUEST_ACTION.1.V ?Y ?A))
			(?E_2 (?X_B REQUEST_ACTION.2.V ?Y ?A))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_D)))
			(!W3 (?X_H (BEFORE ?X_D)))
			(!W4 (?E_1 BEFORE ?E_2))
		)
	)
	(
			"A of X_L jumps rope."
			"X_A asks X_B in jumping."
			"X_B fall.40s L2 from L1 down."
			"X_B request action.38s Y.SK A."
			"X_B request action.39s Y.SK A."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FOR.P ?O)) ((ADV-A (ON.P YOUTUBE)) SEARCH.1.V)))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?LX LOCATION.N))
			(!R3 (?LO LOCATION.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA (FIND.V ?O)))))
			(?G2 (?X_A (WANT.V (KA (HAVE.V ?O)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?LX)))
			(?I2 (?O (AT.P ?LO)))
			(?I3 (NOT (?X_A (KNOW.V (THAT (?O (AT.P ?LO)))))))
		)
		(:POSTCONDS
			(?P1 (?X_A (FIND.V ?O)))
		)
		(:PARAPHRASES
			(?X_C (?X_A ((ADV-A (FOR.P ?O)) LOOK.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_C))
			(!W2 (?X_C (AT-ABOUT ?X_B)))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?I3<- ?P1) = ?X_C))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-92.PR (ALL.D DAY.N) ?X_L (KA (BUY.V ?X_E))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E ALBUM.N))
			(!R2 (?X_L GREAT.A))
			(!R3 (?X_L SONG.N))
		)
		(:STEPS
			(?X_K (?X_A (FIND.V ?X_L)))
			(?X_I (?X_A (((ADV-A (TO.P ?X_L)) LISTEN.V) (ALL.D DAY.N))))
			(?X_G (?X_A (LOVE.V ?X_L)))
			(?X_D (?X_A (WANT.V (KA (BUY.V ?X_E)))))
			(?X_N (?X_A ((ADV-A (FOR.P ?O)) ((ADV-A (ON.P ?X_B)) SEARCH.1.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_G)))
			(!W3 (?X_K (BEFORE ?X_D)))
			(!W4 (?X_I (BEFORE ?X_G)))
			(!W5 (?X_I (BEFORE ?X_D)))
			(!W6 (?X_G (BEFORE ?X_D)))
		)
	)
	(
			"X_A finds a great song."
			"X_A listens all day to a great song."
			"X_A loves a great song."
			"X_A wants buying a album."
			"X_A search.42s for O on X_B."
	)
)



(
	(EPI-SCHEMA (((ADV-E (DURING (K TODAY.N)))
	              (?X_B (((ADV-A (FROM.P ?L1)) GO.18.V) (K SWIMMING.N))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K SWIMMING.N) LOCATION.N))
			(!R4 (NOT (?L1 = (K SWIMMING.N))))
			(!R5 (?X_A (PLUR TOOTH.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A CHATTER.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (K SWIMMING.N))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K SWIMMING.N)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K SWIMMING.N))))
		)
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P (K SWIMMING.N)))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K SWIMMING.N))) GO.18.V)))
	    (K SWIMMING.N)))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P (K SWIMMING.N)))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P (K SWIMMING.N))) GO.18.V)))))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-93.PR (KA SWIM.V) ?X_J (K SWIMMING.N))) ** ?E)
		(:ROLES
			(!R1 (?X_J (PLUR TOOTH.N)))
			(!R2 (?X_J CHATTER.N))
			(!R3 (?X_C (VERY.ADV COLD.A)))
			(!R4 (?X_C WATER.N))
			(!R5 (?X_K AGENT.N))
			(!R6 (?X_J (PERTAIN-TO ?X_K)))
		)
		(:STEPS
			(?X_I
	   ((ADV-E (DURING (K TODAY.N)))
	    (?X_K (((ADV-A (FROM.P ?L1)) GO.18.V) (K SWIMMING.N)))))
			(?X_G (?X_K (TO.P (KA SWIM.V))))
			(?X_E (?X_K ((ADV-A (TO.P (KA SWIM.V))) LOVE.V)))
			(?X_B (?X_C (MAKE.V ?X_J)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_G)))
			(!W2 (?X_I (BEFORE ?X_E)))
			(!W3 (?X_I (BEFORE ?X_B)))
			(!W4 (?X_G (BEFORE ?X_B)))
			(!W5 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A agent go.52s swimming DURING today from L1."
			"A agent is to."
			"A agent loves to swimming."
			"A very cold water makes a tooths chatter of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-94.PR ?X_A (K (AWAY.ADV (FROM.P ?X_B))))) **
	             ?E)
		(:ROLES
			(!R1 (?X_E HOOP.N))
		)
		(:STEPS
			(?X_D (NOT (?X_B ((CAN.AUX CATCH.V) ?X_A))))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (FROM.P ?L1)) (HOME.ADV RUN.9.V)) ?L2)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.9.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.9.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-95.PR (KA ((ADV-A (FOR.P ?X_H)) GO.V)) ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E SUNNY.A))
			(!R2 (?X_H JOB.N))
			(!R3 (?X_K MAN.N))
		)
		(:STEPS
			(?X_J (?X_K (OUTSIDE.ADV LOOK.V)))
			(?X_G (?X_K (DECIDE.V (KA ((ADV-A (FOR.P ?X_H)) GO.V)))))
			(?X_D (?X_E ((ADV-A (FOR.P (KA RAIN.V))) START.V)))
			(?X_B (?X_K (((ADV-A (FROM.P ?L1)) (HOME.ADV RUN.9.V)) ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_G)))
			(!W2 (?X_J (BEFORE ?X_D)))
			(!W3 (?X_J (BEFORE ?X_B)))
			(!W4 (?X_G (BEFORE ?X_D)))
			(!W5 (?X_G (BEFORE ?X_B)))
			(!W6 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A man looks outside."
			"A man decides for a job going."
			"A sunny starts for raining."
			"A man run.72s L2 from L1 home."
	)
)



(
	(EPI-SCHEMA ((?X_C (((ADV-A (FROM.P ?X_B)) (AWAY.PRT RUN.10.V)) ?L2)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C CAT.N))
			(!R2 (?X_B EDGE.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_B = ?L2)))
			(!R5 (?X_C (PERTAIN-TO ?X_A)))
			(!R6 (?X_A AGENT.N))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?X_B)) ((ADV-A (TO.P ?L2)) RUN.10.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?X_B)) ((ADV-A (TO.P ?L2)) RUN.10.V)))))
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
	(EPI-SCHEMA ((?X_C ((JUST.ADV GET.19.V) ?X_D)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_B EDGE.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D (VERY.ADV PLUSH.A)))
			(!R6 (?X_D RUG.N))
			(!R7 (?X_D NEW.A))
			(!R8 (?X_A CAT.N))
			(!R9 (?X_A (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (WITH.P ?X_A)) PLAY.17.V)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C CAT.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A EDGE.N))
			(!R7 (?X_C (PERTAIN-TO ?X_B)))
			(!R8 (?X_B AGENT.N))
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
		(:PARAPHRASES
			(?X_D (?X_C ((ADV-A (WITH.P ?T)) PLAY.17.V)))
			(?X_D (?X_C PLAY.17.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_D (BEFORE ?X_E)))
			(!W3 (?X_F (SAME-TIME ?X_E)))
			(!W4 (?X_F (RIGHT-AFTER ?X_G)))
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-96.PR ?L2 ?X_M)) ** ?E)
		(:ROLES
			(!R1 (?X_F WIFE.N))
			(!R2 (?X_F (PERTAIN-TO ?X_G)))
			(!R3 (?X_J EDGE.N))
			(!R4 (?X_N CAT.N))
			(!R5 (?X_M NEW.A))
			(!R6 (?X_M RUG.N))
			(!R7 (?X_M (VERY.ADV PLUSH.A)))
			(!R8 (?X_O AGENT.N))
			(!R9 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_L (?X_O ((JUST.ADV GET.19.V) ?X_M)))
			(?X_I (?X_N ((ADV-A (WITH.P ?X_J)) PLAY.17.V)))
			(?X_A (?X_N ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_J)) PLAY.V)))) START.V)))
			(?X_E (?X_F ((ADV-A (AT.P ?X_N)) YELL.V)))
			(?X_C (?X_N (((ADV-A (FROM.P ?X_J)) (AWAY.PRT RUN.10.V)) ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_A)))
			(!W2 (?X_L (BEFORE ?X_E)))
			(!W3 (?X_L (BEFORE ?X_C)))
			(!W4 (?X_I (BEFORE ?X_A)))
			(!W5 (?X_I (BEFORE ?X_E)))
			(!W6 (?X_I (BEFORE ?X_C)))
			(!W7 (?X_A (BEFORE ?X_E)))
			(!W8 (?X_A (BEFORE ?X_C)))
			(!W9 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A agent get.75s a new rug very plush just."
			"A cat of a agent play.84s with a edge."
			"A cat of a agent starts for with a edge playing."
			"A wife of X_G yells at a cat of a agent."
			"A cat of a agent run.82s L2 from a edge away."
	)
)



(
	(EPI-SCHEMA ((?X_B ((OUT.PRT GET.9.V) (KA ((ADV-A (ON.P ?X_C)) CHECK.V)))) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((KA ((ADV-A (ON.P ?X_C)) CHECK.V)) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (KA ((ADV-A (ON.P ?X_C)) CHECK.V)))))
			(!R5 (?X_B (HOME.ADV DRIVE.V)))
			(!R6 (?X_C DEAD.A))
			(!R7 (?X_C ROAD.N))
			(!R8 (?X_C RABBIT.N))
			(!R9 (?X_A RABBIT.N))
			(!R10 (?X_A (ON.P ?X_C)))
		)
		(:GOALS
			(?G1
	   (?X_B (WANT.V (THAT (?X_B (HAVE.V (KA ((ADV-A (ON.P ?X_C)) CHECK.V))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (KA ((ADV-A (ON.P ?X_C)) CHECK.V)))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((KA ((ADV-A (ON.P ?X_C)) CHECK.V)) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (KA ((ADV-A (ON.P ?X_C)) CHECK.V))))
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
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-97.PR ?X_G (K HOME.N)
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
			(?X_D (?X_I ((OUT.PRT GET.9.V) (KA ((ADV-A (ON.P ?X_H)) CHECK.V)))))
			(?X_B (?X_I (DRIVE.V (K HOME.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_D)))
			(!W2 (?X_F (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A home drive hits a rabbit on a road dead rabbit."
			"A home drive get.87s on a road dead rabbit checking out."
			"A home drive drives home."
	)
)



(
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-98.PR ?X_D (KA (HAVE.V ?X_H)))) ** ?E)
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
			"A agent goes DURING yesterday for buying a almonds so good."
			"A agent buys a large box."
			"A agent wants having a more."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-99.PR (K (PLUR NUT.N)) (K (PLUR CRUMB.N))))
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
			"A little bird eats nuts not can."
			"A little bird likes crumbs."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (COMPOSITE-SCHEMA-100.PR (K (TO.P (?X_B SING.V))) ?X_B
	               (K (PLUR TIP.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_F FEW.A))
			(!R3 (?X_F (PLUR PERSON.N)))
			(!R4 (?X_K MAN.N))
		)
		(:STEPS
			(?X_D (?X_E ((ADV-A (IN.P ?X_A)) BE.V)))
			(?X_H (?X_E ((ADV-A (WITH.P ?X_F)) SING.V)))
			(?X_J (?X_K (LISTEN.V (K (TO.P (?X_B SING.V))))))
			(?X_M (?X_K (GIVE.V ?X_B (K (PLUR TIP.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_H)))
			(!W2 (?X_D (BEFORE ?X_J)))
			(!W3 (?X_D (BEFORE ?X_M)))
			(!W4 (?X_H (BEFORE ?X_J)))
			(!W5 (?X_H (BEFORE ?X_M)))
			(!W6 (?X_J (BEFORE ?X_M)))
		)
	)
	(
			"A agent is in X_A."
			"A agent sings with a few persons."
			"A man listens to X_B sings."
			"A man gives X_B tips."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FROM.P ?L1))
	                ((ADV-A (TO.P ?X_A))
	                 ((ADV-A (FOR.P (KA (GET.V (K (PLUR CLOTHE.N)))))) GO.19.V)))
	               ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A MARKET.N))
			(!R6 (?X_B (PLUR PERSON.N)))
		)
		(:GOALS
			(?X_F (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.19.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.19.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?X_F CAUSE-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FROM.P ?L1))
	                ((ADV-A (TO.P ?X_B))
	                 ((ADV-A (FOR.P (KA (GET.V (K (PLUR CLOTHE.N)))))) GO.20.V)))
	               ?L2))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PLUR PERSON.N)))
			(!R6 (?X_B MARKET.N))
		)
		(:GOALS
			(?X_D (?X_C (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_F
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.20.V)))
	    ?L2))
			(?X_F
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.20.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?X_D CAUSE-OF ?X_F))
			(!W6 (?X_D (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_A
	              (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P HAITI)) GO.21.V)) ?L2))
	             ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.21.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.21.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
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
	              (COMPOSITE-SCHEMA-101.PR (KA ((ADV-A (LIKE.P ?X_M)) LOOK.V)) ?X_G
	               ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G (PLUR SANDAL.N)))
			(!R2 (?X_J MARKET.N))
			(!R3 (?X_M (PLUR PERSON.N)))
		)
		(:STEPS
			(?X_O (?X_B (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) GO.21.V)) ?L2)))
			(?X_L (?X_B (WANT.V (KA ((ADV-A (LIKE.P ?X_M)) LOOK.V)))))
			(?X_I
	   (?X_B
	    (((ADV-A (FROM.P ?L1))
	      ((ADV-A (TO.P ?X_J))
	       ((ADV-A (FOR.P (KA (GET.V (K (PLUR CLOTHE.N)))))) GO.19.V)))
	     ?L2)))
			(?X_I
	   (?X_B
	    (((ADV-A (FROM.P ?L1))
	      ((ADV-A (TO.P ?X_J))
	       ((ADV-A (FOR.P (KA (GET.V (K (PLUR CLOTHE.N)))))) GO.20.V)))
	     ?L2)))
			(?X_F (?X_B (SEE.V ?X_G)))
			(?X_D (?X_B (BUY.V ?X_G)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_L)))
			(!W2 (?X_O (BEFORE ?X_I)))
			(!W3 (?X_O (BEFORE ?X_F)))
			(!W4 (?X_O (BEFORE ?X_D)))
			(!W5 (?X_L (BEFORE ?X_I)))
			(!W6 (?X_L (BEFORE ?X_F)))
			(!W7 (?X_L (BEFORE ?X_D)))
			(!W8 (?X_I (BEFORE ?X_F)))
			(!W9 (?X_I (BEFORE ?X_D)))
			(!W10 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"X_B go.141s L2 from L1 to X_A."
			"X_B wants like a persons looking."
			"X_B go.142s L2 from L1 to a market for getting clothes."
			"X_B go.143s L2 from L1 to a market for getting clothes."
			"X_B sees a sandals."
			"X_B buys a sandals."
	)
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (WITH.P ?X_A)) EAT.4.V) ?F)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?F FOOD.N))
			(!R3 (?X_A (PLUR FRIEND.N)))
			(!R4 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (NOT (?X_B HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_B HAVE.V ?F))
			(?I2 (?X_B HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (HAVE.V ?F))))
			(?P2 (NOT (?X_B HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_C))
			(!W2 (?I1 BEFORE ?X_C))
			(!W3 (?X_C CAUSE-OF ?P1))
			(!W4 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X FEED.1.V ?X_B ?F) ** ?E)
		(:ROLES
			(!R1 (?X AGENT.N))
			(!R2 (?X_B AGENT.N))
			(!R3 (?F FOOD.N))
			(!R4 (NOT (?X = ?X_B)))
			(!R5 (NOT (?X_B = ?F)))
			(!R6 (NOT (?X = ?F)))
			(!R7 (?X_A (PLUR FRIEND.N)))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X (WANT.V (THAT (NOT (?X_B HUNGRY.A))))))
			(?G2 (?X (WANT.V (THAT (?X_B (((ADV-A (WITH.P ?X_A)) EAT.V) ?F))))))
		)
		(:PRECONDS
			(?I1 (?X HAVE.V ?F))
			(?I2 (?X_B HUNGRY.A))
		)
		(:STEPS
			(?X_C (?X_B (((ADV-A (WITH.P ?X_A)) EAT.V) ?F)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X (HAVE.V ?F))))
			(?P2 (NOT (?X_B HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C AFTER ?E))
			(!W2 (?X_C (AT-ABOUT ?X_D)))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-102.PR (K GAS.N) ?X_L ?F)) ** ?E)
		(:ROLES
			(!R1 (?X_H (SET-OF AGENT.N)))
			(!R2 (?X_K (PLUR FRIEND.N)))
			(!R3 (?X_L AGENT.N))
			(!R4 (?X_K (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(?E_1 (?X FEED.1.V ?X_L ?F))
			(?X_J (?X_L (((ADV-A (WITH.P ?X_K)) EAT.4.V) ?F)))
			(?X_G (?X_H ((ADV-A (ABOUT.P (KA (GO.V (TO.P (?X_A HOUSE.N)))))) BE.V)))
			(?X_B (?X_L OUT.P))
			(?X_C (?X_L (OF.P (K GAS.N))))
			(?X_E (MUST.AUX-S (?X_K ((ADV-A (ON.P ?X_L)) WAIT.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E_1 (BEFORE ?X_J)))
			(!W2 (?E_1 (BEFORE ?X_G)))
			(!W3 (?E_1 (BEFORE ?X_B)))
			(!W4 (?E_1 (BEFORE ?X_C)))
			(!W5 (?E_1 (BEFORE ?X_E)))
			(!W6 (?X_J (BEFORE ?X_G)))
			(!W7 (?X_J (BEFORE ?X_B)))
			(!W8 (?X_J (BEFORE ?X_C)))
			(!W9 (?X_J (BEFORE ?X_E)))
			(!W10 (?X_G (BEFORE ?X_B)))
			(!W11 (?X_G (BEFORE ?X_C)))
			(!W12 (?X_G (BEFORE ?X_E)))
			(!W13 (?X_B (BEFORE ?X_C)))
			(!W14 (?X_B (BEFORE ?X_E)))
			(!W15 (?X_C (BEFORE ?X_E)))
		)
	)
	(
			"X feed.150s a agent F."
			"A agent eat.148s F with a friends of a agent."
			"A agent is about going to X_A house."
			"A agent is out."
			"A agent is of."
			"A friends of a agent waits must on a agent."
	)
)



(
	(EPI-SCHEMA (((ADV-E (DURING (K YESTERDAY.N))) (?X_A (WATCH.4.V ?X_B))) **
	             ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B SHOW.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?I PERTAIN-TO ?X_B))
			(!R5 (?X_B (VERY.ADV FUNNY.A)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (KNOW.V ?I))))))
		)
		(:PRECONDS
			(?I1 (?X_A (CAN.MD (SEE.V ?X_B))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-103.PR (KA (AGAIN.ADV WATCH.V) ?X_H) ?X_H)) **
	             ?E)
		(:ROLES
			(!R1 (?X_H SHOW.N))
			(!R2 (?X_H (VERY.ADV FUNNY.A)))
		)
		(:STEPS
			(?X_E (?X_A ((ADV (OUT.ADV LOUD.A)) LAUGH.V)))
			(?X_C (?X_A (WANT.V (KA (AGAIN.ADV WATCH.V) ?X_H))))
			(?X_G ((ADV-E (DURING (K YESTERDAY.N))) (?X_A (WATCH.4.V ?X_H))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"X_A laughs ADV out loud."
			"X_A wants again watch a show very funny."
			"X_A watch.152s a show very funny DURING yesterday."
	)
)



(
	(EPI-SCHEMA ((?X_F
	              (COMPOSITE-SCHEMA-104.PR (KA (LIKE.V ?X_A)) (KA VOMIT.V)
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
			"A agent wants liking a wine."
			"A agent wants vomiting."
			"A agent wants again drink never."
	)
)



(
	(EPI-SCHEMA ((?X_A TAKE.14.V (SET-OF ?X_B ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT ((SET-OF ?X_B ?X_C) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (SET-OF ?X_B ?X_C))))
			(!R5 (?X_B LONG.A))
			(!R6 (?X_B ROD.N))
			(!R7 (?X_C HOOK.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V (SET-OF ?X_B ?X_C)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V (SET-OF ?X_B ?X_C))))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 ((SET-OF ?X_B ?X_C) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V (SET-OF ?X_B ?X_C)))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-105.PR ?X_G (SET-OF ?X_E ?X_D))) ** ?E)
		(:ROLES
			(!R1 (?X_D HOOK.N))
			(!R2 (?X_E ROD.N))
			(!R3 (?X_E LONG.A))
			(!R4 (?X_F AGENT.N))
			(!R5 (?X_G POND.N))
			(!R6 (?X_G FISH.N))
			(!R7 (?X_G (PERTAIN-TO ?X_H)))
		)
		(:STEPS
			(?X_B (?X_A ((FISH.ADV IN.P) ?X_G)))
			(?X_C (?X_F TAKE.14.V (SET-OF ?X_E ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_C)))
		)
	)
	(
			"X_A is fish in."
			"A agent take.168s a rod long and a hook."
	)
)



(
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-106.PR ?X_D ?X_E)) ** ?E)
		(:ROLES
			(!R1 (?X_D FLU.N))
			(!R2 (?X_E (KA FEEL.V) GROGGY.A))
			(!R3 (?X_E (PERTAIN-TO ?X_F)))
		)
		(:STEPS
			(?X_C (?X_F (HAVE.V ?X_D)))
			(?X_A (?X_D (MAKE.V ?X_E)))
			(?X_H (?X_D (MAKE.V ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_A)))
			(!W2 (?X_C (BEFORE ?X_H)))
			(!W3 (?X_A (BEFORE ?X_H)))
		)
	)
	(
			"X_F has a flu."
			"A flu makes a of X_F."
			"A flu makes a of X_F."
	)
)



(
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-107.PR
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
			"X_A is in a band."
			"A band has few fan."
			"A band tries holding a show."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FROM.P ?L1)) (OUT.PRT ((ADV-A (FOR.P ?X_A)) GO.22.V)))
	               ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A PASS.N))
			(!R6 (?X_B ARM.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.22.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.22.V)))))
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-108.PR ?X_I ?X_N ?X_E ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_E GROUND.N))
			(!R2 (?X_H PERSON.N))
			(!R3 (?X_I PARKING.N))
			(!R4 (?X_I LOT.N))
			(!R5 (?X_L PASS.N))
			(!R6 (?X_M ARM.N))
			(!R7 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_K
	   (?X_N
	    (((ADV-A (FROM.P ?L1)) (OUT.PRT ((ADV-A (FOR.P ?X_L)) GO.22.V))) ?L2)))
			(?X_A (?X_N ON.P))
			(?X_B (?X_N (IN.P ?X_I)))
			(?X_G (?X_H (GUARD.V ?X_N)))
			(?X_D (?X_N ((HARD.ADV HIT.V) ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_A)))
			(!W2 (?X_K (BEFORE ?X_B)))
			(!W3 (?X_K (BEFORE ?X_G)))
			(!W4 (?X_K (BEFORE ?X_D)))
			(!W5 (?X_A (BEFORE ?X_B)))
			(!W6 (?X_A (BEFORE ?X_G)))
			(!W7 (?X_A (BEFORE ?X_D)))
			(!W8 (?X_B (BEFORE ?X_G)))
			(!W9 (?X_B (BEFORE ?X_D)))
			(!W10 (?X_G (BEFORE ?X_D)))
		)
	)
	(
			"X_N go.187s L2 from L1 out for a pass."
			"X_N is on."
			"X_N is in."
			"A person guards X_N."
			"X_N hits a ground hard."
	)
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (FROM.P ?L1)) (DOWN.ADV FALL.7.V)) ?L2)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A HEAD.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) FALL.7.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) FALL.7.V)))))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-109.PR (KA (SEE.V ?X_M)) ?X_I ?X_J ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_I HEAD.N))
			(!R2 (?X_I (PERTAIN-TO ?X_J)))
			(!R3 (?X_M VIEW.N))
			(!R4 (?X_N AGENT.N))
		)
		(:STEPS
			(?X_L (?X_N (WANT.V (KA (SEE.V ?X_M)))))
			(?X_F (?X_J (((ADV (REALLY.ADV HARD.A)) HIT.V) ?X_I)))
			(?X_H (?X_J (((ADV-A (FROM.P ?L1)) (DOWN.ADV FALL.7.V)) ?L2)))
			(?X_B (?X_J (((ADV (REALLY.ADV HARD.A)) HIT.V) ?X_I)))
			(?X_D (?X_A (((ADV (BACK.ADV DOWN.A)) CARRY.V) ?X_J)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_H)))
			(!W2 (?X_L (BEFORE ?X_B)))
			(!W3 (?X_L (BEFORE ?X_D)))
			(!W4 (?X_F (BEFORE ?X_B)))
			(!W5 (?X_F (BEFORE ?X_D)))
			(!W6 (?X_H (BEFORE ?X_B)))
			(!W7 (?X_H (BEFORE ?X_D)))
			(!W8 (?X_B (BEFORE ?X_D)))
		)
	)
	(
			"A agent wants seeing a view."
			"X_J hits a head of X_J ADV really hard."
			"X_J fall.201s L2 from L1 down."
			"X_J hits a head of X_J ADV really hard."
			"X_A carries X_J ADV back down."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.20.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.23.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.23.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.23.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_D)))
			(!W7 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-110.PR ?X_I ?X_A ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_I PHONE.N))
		)
		(:STEPS
			(?X_H (?X_B (WANT.V ?X_I)))
			(?X_F (?X_B GET.20.V ?X_A))
			(?X_D (?X_B ((ADV-A (FROM.P ?L1)) GO.23.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_D)))
		)
	)
	(
			"X_B wants a phone."
			"X_B get.203s X_A."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-111.PR (K GLUE.N) ?X_F ?X_I)) ** ?E)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (WITH.P ?X_A)) PLAY.18.V)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A MOUSE.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_A HAVE.V ?T))
		)
		(:POSTCONDS
			(?P1 (?X_A EXPERIENCE.V (K PLEASURE.N)))
		)
		(:PARAPHRASES
			(?X_B (?X_A ((ADV-A (WITH.P ?T)) PLAY.18.V)))
			(?X_B (?X_A PLAY.18.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_B (AFTER ?X_C)))
			(!W3 (?X_C (AT-ABOUT ?X_D)))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-112.PR ?X_G ?X_A)) ** ?E)
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
			(E56.SK (?X_D ((ADV-A (WITH.P ?X_D)) PLAY.18.V)))
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
			"A mouse play.17s with a mouse."
	)
)



(
	(EPI-SCHEMA ((?X_A EAT.5.V (K FOOD.N)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A CAT.N))
			(!R2 ((K FOOD.N) FOOD.N))
			(!R3 ((K FOOD.N) (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (NOT (?X_A HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_A HAVE.V (K FOOD.N)))
			(?I2 (?X_A HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (HAVE.V (K FOOD.N)))))
			(?P2 (NOT (?X_A HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_C))
			(!W2 (?I1 BEFORE ?X_C))
			(!W3 (?X_C CAUSE-OF ?P1))
			(!W4 (?X_C (RIGHT-AFTER ?X_B)))
			(!W5 (?X_C (SAME-TIME ?X_E)))
			(!W6 (?X_D (BEFORE ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A EAT.6.V (K FOOD.N)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A CAT.N))
			(!R2 ((K FOOD.N) FOOD.N))
			(!R3 ((K FOOD.N) (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (NOT (?X_A HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_A HAVE.V (K FOOD.N)))
			(?I2 (?X_A HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (HAVE.V (K FOOD.N)))))
			(?P2 (NOT (?X_A HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_B))
			(!W2 (?I1 BEFORE ?X_B))
			(!W3 (?X_B CAUSE-OF ?P1))
			(!W4 (?X_B (BEFORE ?X_C)))
			(!W5 (?X_D (SAME-TIME ?X_C)))
			(!W6 (?X_D (RIGHT-AFTER ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A EAT.7.V (K FOOD.N)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A CAT.N))
			(!R2 ((K FOOD.N) FOOD.N))
			(!R3 ((K FOOD.N) (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (NOT (?X_A HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_A HAVE.V (K FOOD.N)))
			(?I2 (?X_A HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (HAVE.V (K FOOD.N)))))
			(?P2 (NOT (?X_A HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_B))
			(!W2 (?I1 BEFORE ?X_B))
			(!W3 (?X_B CAUSE-OF ?P1))
			(!W4 (?X_B (SAME-TIME ?X_E)))
			(!W5 (?X_B (RIGHT-AFTER ?X_C)))
			(!W6 (?X_D (BEFORE ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-113.PR
	               (K (L X (AND (X OUT.P) (X (OF.P (K FOOD.N)))))) ?X_G
	               (K FOOD.N)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G MORE.A))
			(!R2 (?X_H STORE.N))
			(!R3 (?X_J (HAVE.V (K ((ADV-A (IN.P ?X_I)) (NO.ADV MORE.A))))))
			(!R4 (?X_J AGENT.N))
			(!R5 (?X_I (PERTAIN-TO ?X_J)))
			(!R6 (?X_M CAT.N))
			(!R7 ((K FOOD.N) (PERTAIN-TO ?X_M)))
		)
		(:STEPS
			(?X_L (?X_M (RUN.V (K (L X (AND (X OUT.P) (X (OF.P (K FOOD.N)))))))))
			(?X_F (?X_J (((ADV-A (FROM.P ?X_H)) BUY.V) ?X_G)))
			(?X_D (?X_M EAT.6.V (K FOOD.N)))
			(?X_B (?X_M EAT.5.V (K FOOD.N)))
			(?X_B (?X_M EAT.7.V (K FOOD.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_F)))
			(!W2 (?X_L (BEFORE ?X_B)))
			(!W3 (?X_F (BEFORE ?X_B)))
			(!W4 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A cat runs out of."
			"A have in a of a have in X_I no more agent no more agent buys a more from a store."
			"A cat eat.26s food."
			"A cat eat.25s food."
			"A cat eat.27s food."
		error composing story schemas
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_B TAKE.15.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C SHOWER.V))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A HAIR.N))
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-114.PR (K COLD.A) (KE ((K SOAP.N) (IN.P ?X_M)))
	               ?X_M ?X_L))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M HAIR.N))
			(!R2 (?X_I HOT.A))
			(!R3 (?X_I WATER.N))
			(!R4 (?X_L SHOWER.V))
			(!R5 (?X_N MAN.N))
			(!R6 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_F (?X_N ((STILL.ADV HAVE.V) (KE ((K SOAP.N) (IN.P ?X_M))))))
			(?X_D (?X_N ((QUICKLY.ADV WASH.V) ?X_M)))
			(?X_K (?X_N TAKE.15.V ?X_L))
			(?X_H (?X_I (GO.V (K COLD.A))))
			(?X_A (?X_N ((STILL.ADV HAVE.V) (KE ((K SOAP.N) (IN.P ?X_M))))))
			(?X_B (?X_N ((QUICKLY.ADV WASH.V) ?X_M)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_A)))
			(!W2 (?X_F (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
			(!W4 (?X_K (BEFORE ?X_H)))
			(!W5 (?X_K (BEFORE ?X_A)))
			(!W6 (?X_K (BEFORE ?X_B)))
			(!W7 (?X_H (BEFORE ?X_A)))
			(!W8 (?X_H (BEFORE ?X_B)))
			(!W9 (?X_A (BEFORE ?X_B)))
		)
	)
	(
			"A man has soap in a hair of a man still."
			"A man washes a hair of a man quickly."
			"A man take.39s a shower."
			"A hot water goes cold."
			"A man has soap in a hair of a man still."
			"A man washes a hair of a man quickly."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.21.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B (K SMASH.N) CAKE.N))
			(!R6 (?X_A (GET.21.V (K (SO.ADV BIG.A)))))
			(!R7 (?X_B (FOR.P ?X_A)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-115.PR (K SMASH.N) ?X_E)) ** ?E)
		(:ROLES
			(!R1 (?X_E (K SMASH.N) CAKE.N))
			(!R2 (?X_F (GET.V (K (SO.ADV BIG.A)))))
			(!R3 (?X_F AGENT.N))
			(!R4 (?X_E (FOR.P ?X_F)))
		)
		(:STEPS
			(?X_D (?X_F GET.21.V ?X_E))
			(?X_B (?X_F (LOVE.V (K SMASH.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A get so big agent get.59s a for a get so big agent."
			"A get so big agent loves smash."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FROM.P ?L1))
	                ((ADV-A (FOR.P (KA (((ADV-A (ON.P FRIDAY)) VISIT.V) ?X_A))))
	                 GO.24.V))
	               ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A FARM.N))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.24.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.24.V)))))
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-116.PR ?X_B ?X_I ?L2)) ** ?E)
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
			(?X_M
	   (?X_O
	    (((ADV-A (FROM.P ?L1))
	      ((ADV-A (FOR.P (KA (((ADV-A (ON.P ?X_A)) VISIT.V) ?X_N)))) GO.24.V))
	     ?L2)))
			(?X_K (?X_C (BE.V ?X_B)))
			(?X_H (?X_N (HAVE.V ?X_I)))
			(?X_E ((ADV-E (DURING ?X_F)) (?X_C BE.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_K)))
			(!W2 (?X_M (BEFORE ?X_H)))
			(!W3 (?X_M (BEFORE ?X_E)))
			(!W4 (?X_K (BEFORE ?X_H)))
			(!W5 (?X_K (BEFORE ?X_E)))
			(!W6 (?X_H (BEFORE ?X_E)))
		)
	)
	(
			"A agent go.70s L2 from L1 for on X_A visiting a farm."
			"X_C is X_B."
			"A farm has a lot of animals."
			"X_C is DURING a day fun very."
	)
)



(
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-117.PR (SET-OF ?X_L ?X_E ?X_K) ?X_F)) ** ?E)
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
			(?X_H (?X_E ((MAY.AUX ((ADV-A (TO.P ?X_L)) TAKE.V)) ?X_F)))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-118.PR ?X_A ?X_H)) ** ?E)
		(:ROLES
			(!R1 (?X_H BED.N))
			(!R2 (?X_G (PERTAIN-TO ?X_H)))
			(!R3 (?X_H (PERTAIN-TO ?X_I)))
		)
		(:STEPS
			(?X_D (?X_H ((AWAY.ADV SWAT.V) ?X_A)))
			(?X_F (?X_A (UNDER.P ?X_H)))
			(?X_B (?X_A ((ADV-A (UNDER.P ?X_H)) RUN.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_B)))
			(!W3 (?X_F (BEFORE ?X_B)))
		)
	)
	(
			"A bed of X_I swats X_A away."
			"X_A is under."
			"X_A runs under a bed of X_I."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FROM.P ?X_A)) (INSTEAD.ADV (HOME.ADV GO.25.V))) ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_A CORNER.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_A = ?L2)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?X_A)))
			(?I2 (NOT (?X_B (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?X_A))))
			(?P2 (?X_B (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?X_A)) ((ADV-A (TO.P ?L2)) GO.25.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?X_A)) ((ADV-A (TO.P ?L2)) GO.25.V)))))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-119.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_F CORNER.N))
			(!R3 (?X_I LINE.N))
		)
		(:STEPS
			(?X_H (?X_I (LONG.ADV (TOO.ADV (FAR.ADV BE.V)))))
			(?X_E (?X_I ((ADV-A (AROUND.P ?X_F)) BE.V)))
			(?X_B (?X_C (((ADV-A (FROM.P ?X_F)) (INSTEAD.ADV (HOME.ADV GO.25.V))) ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_E)))
			(!W2 (?X_H (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A line is long too far."
			"A line is around a corner."
			"A agent go.117s L2 from a corner instead home."
	)
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-120.PR (K BAD.A) ?X_C ?X_I)) ** ?E)
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
	(EPI-SCHEMA ((?X_D
	              (((ADV-A (FROM.P ?X_C)) ((ADV-A (THROUGH.P ?X_A)) RUN.11.V))
	               ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C END.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_C = ?L2)))
			(!R5 (?X_A PARK.N))
			(!R6 (?X_B DOG.N))
			(!R7 (?X_B (PERTAIN-TO ?X_D)))
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
		(:PARAPHRASES
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?X_C)) ((ADV-A (TO.P ?L2)) RUN.11.V)))
	    ?L2))
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?X_C)) ((ADV-A (TO.P ?L2)) RUN.11.V)))))
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
	              (((ADV-A (FROM.P ?X_C)) ((ADV-A (IN.P ?X_A)) SWIM.1.V)) ?X_E))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C PARK.N))
			(!R3 (?X_E END.N))
			(!R4 (NOT (?X_C = ?X_E)))
			(!R5 (?X_A LAKE.N))
			(!R6 (?X_B (PERTAIN-TO ?X_D)))
			(!R7 (?X_B DOG.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?X_E)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?X_C)))
			(?I2 (NOT (?X_D (AT.P ?X_E))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?X_C))))
			(?P2 (?X_D (AT.P ?X_E)))
		)
		(:PARAPHRASES
			(?X_F
	   (?X_D
	    ((ADV-A (FOR.P ?X_E))
	     ((ADV-A (FROM.P ?X_C)) ((ADV-A (TO.P ?X_E)) SWIM.1.V)))
	    ?X_E))
			(?X_F
	   (?X_D
	    ((ADV-A (FOR.P ?X_E))
	     ((ADV-A (FROM.P ?X_C)) ((ADV-A (TO.P ?X_E)) SWIM.1.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_G (CONSEC ?X_F)))
			(!W7 (?X_F (DURING ?X_H)))
			(!W8 (?X_G (DURING ?X_H)))
			(!W9 (?X_H (AT-ABOUT ?X_J)))
			(!W10 (?X_I (BEFORE ?X_J)))
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
	              (((ADV-A (FROM.P ?X_C)) ((ADV-A (IN.P ?X_A)) SWIM.2.V)) ?X_E))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C END.N))
			(!R3 (?X_E PARK.N))
			(!R4 (NOT (?X_C = ?X_E)))
			(!R5 (?X_A LAKE.N))
			(!R6 (?X_B (PERTAIN-TO ?X_D)))
			(!R7 (?X_B DOG.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?X_E)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P ?X_C)))
			(?I2 (NOT (?X_D (AT.P ?X_E))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P ?X_C))))
			(?P2 (?X_D (AT.P ?X_E)))
		)
		(:PARAPHRASES
			(?X_G
	   (?X_D
	    ((ADV-A (FOR.P ?X_E))
	     ((ADV-A (FROM.P ?X_C)) ((ADV-A (TO.P ?X_E)) SWIM.2.V)))
	    ?X_E))
			(?X_G
	   (?X_D
	    ((ADV-A (FOR.P ?X_E))
	     ((ADV-A (FROM.P ?X_C)) ((ADV-A (TO.P ?X_E)) SWIM.2.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_G))
			(!W2 (?I2 BEFORE ?X_G))
			(!W3 (?P1 AFTER ?X_G))
			(!W4 (?P2 AFTER ?X_G))
			(!W5 (?G1 CAUSE-OF ?X_G))
			(!W6 (?X_G (DURING ?X_H)))
			(!W7 (?X_F (DURING ?X_H)))
			(!W8 (?X_F (CONSEC ?X_G)))
			(!W9 (?X_H (AT-ABOUT ?X_J)))
			(!W10 (?X_I (BEFORE ?X_J)))
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
	              (COMPOSITE-SCHEMA-121.PR (KA ((ADV-A (WITH.P ?X_P)) PLAY.V))
	               (K CATCH.N)
	               (K (L X (AND (X TO.P) (X ((ADV-A (IN.P ?X_H)) SWIM.V))))) ?L2
	               ?X_R ?X_O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H LAKE.N))
			(!R2 (?X_P DOG.N))
			(!R3 (?X_O PARK.N))
			(!R4 (?X_P (PERTAIN-TO ?X_Q)))
			(!R5 (?X_R END.N))
		)
		(:STEPS
			(?X_L (?X_Q ((ADV-A (WITH.P ?X_P)) PLAY.V)))
			(?X_G
	   (?X_Q (LOVE.V (K (L X (AND (X TO.P) (X ((ADV-A (IN.P ?X_H)) SWIM.V))))))))
			(?X_N
	   (?X_Q (((ADV-A (FROM.P ?X_R)) ((ADV-A (THROUGH.P ?X_O)) RUN.11.V)) ?L2)))
			(?X_C (?X_Q (LOVE.V (KA ((ADV-A (WITH.P ?X_P)) PLAY.V)))))
			(?X_J (?X_B (PLAY.V (K CATCH.N))))
			(?X_D (?X_Q TO.P))
			(?X_E (?X_Q (((ADV-A (FROM.P ?X_O)) ((ADV-A (IN.P ?X_H)) SWIM.1.V)) ?X_R)))
			(?X_E (?X_Q (((ADV-A (FROM.P ?X_R)) ((ADV-A (IN.P ?X_H)) SWIM.2.V)) ?X_O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_C)))
			(!W2 (?X_L (BEFORE ?X_J)))
			(!W3 (?X_L (BEFORE ?X_D)))
			(!W4 (?X_L (BEFORE ?X_E)))
			(!W5 (?X_N (BEFORE ?X_C)))
			(!W6 (?X_N (BEFORE ?X_J)))
			(!W7 (?X_N (BEFORE ?X_D)))
			(!W8 (?X_N (BEFORE ?X_E)))
			(!W9 (?X_C (BEFORE ?X_J)))
			(!W10 (?X_C (BEFORE ?X_D)))
			(!W11 (?X_C (BEFORE ?X_E)))
			(!W12 (?X_J (BEFORE ?X_D)))
			(!W13 (?X_J (BEFORE ?X_E)))
			(!W14 (?X_D (BEFORE ?X_E)))
		)
	)
	(
			"X_Q plays with a dog of X_Q."
			"X_Q loves to swimming."
			"X_Q run.123s L2 from a end through a park."
			"X_Q loves with a dog of X_Q playing."
			"X_B plays catch."
			"X_Q is to."
			"X_Q swim.125s a end from a park in a lake."
			"X_Q swim.127s a park from a end in a lake."
	)
)



(
	(EPI-SCHEMA (((K SUSIE.N) (COMPOSITE-SCHEMA-122.PR ?X_D)) ** ?E)
		(:ROLES
			(!R1 (?X_D CD.N))
			(!R2 (?X_D (PERTAIN-TO (K SUSIE.N))))
		)
		(:STEPS
			(?X_C ((K SUSIE.N) (AT.P ?X_D)))
			(?X_A ((K SUSIE.N) ((ADV-A (AT.P ?X_D)) LOOK.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_A)))
		)
	)
	(
			"Susie is at."
			"Susie looks at a cd of susie."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (((ADV-A (FROM.P ?L1)) ((ADV-A (AT.P ?X_A)) RUN.12.V)) ?L2))
	             ** ?X_B)
		(:ROLES
			(!R1 (?X_A CAT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A HEN.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.12.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.12.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AFTER ?X_C)))
			(!W7 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-123.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_A HEN.N))
			(!R2 (?X_A CAT.N))
		)
		(:STEPS
			(E219.SK (?X_A (((ADV-A (FROM.P ?L1)) ((ADV-A (AT.P ?X_A)) RUN.12.V)) ?L2)))
		)
	)
	(
			"A hen cat run.141s L2 from L1 at a hen cat."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-124.PR (KA ((ADV-A (ON.P ?X_E)) RIDE.V))
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
	)
)



(
	(EPI-SCHEMA ((?X_D
	              (((ADV-A (FROM.P (K OUTSIDE.N)))
	                (IN.PRT ((ADV-A (FROM.P (K OUTSIDE.N))) COME.3.V)))
	               ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D SON.N))
			(!R2 ((K OUTSIDE.N) LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT ((K OUTSIDE.N) = ?L2)))
			(!R5 (?X_D (PERTAIN-TO ?X_A)))
			(!R6 (?X_A AGENT.N))
			(!R7 (?X_B (PERTAIN-TO ?X_D)))
			(!R8 (?X_B FRIEND.N))
			(!R9 (?X_D (IS.V ?X_C)))
			(!R10 (?X_C CHILD.N))
			(!R11 (?X_C LITTLE.A))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P (K OUTSIDE.N))))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P (K OUTSIDE.N)))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P (K OUTSIDE.N))) ((ADV-A (TO.P ?L2)) COME.3.V)))
	    ?L2))
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P (K OUTSIDE.N))) ((ADV-A (TO.P ?L2)) COME.3.V)))))
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
	              (((ADV-A (FROM.P (K OUTSIDE.N)))
	                (IN.PRT ((ADV-A (FROM.P (K OUTSIDE.N))) COME.4.V)))
	               ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D SON.N))
			(!R2 ((K OUTSIDE.N) LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT ((K OUTSIDE.N) = ?L2)))
			(!R5 (?X_A AGENT.N))
			(!R6 (?X_D (PERTAIN-TO ?X_A)))
			(!R7 (?X_B CHILD.N))
			(!R8 (?X_D (IS.V ?X_B)))
			(!R9 (?X_B LITTLE.A))
			(!R10 (?X_C (PERTAIN-TO ?X_D)))
			(!R11 (?X_C FRIEND.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_D (AT.P (K OUTSIDE.N))))
			(?I2 (NOT (?X_D (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (AT.P (K OUTSIDE.N)))))
			(?P2 (?X_D (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P (K OUTSIDE.N))) ((ADV-A (TO.P ?L2)) COME.4.V)))
	    ?L2))
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P (K OUTSIDE.N))) ((ADV-A (TO.P ?L2)) COME.4.V)))))
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
	              (((ADV-A (FROM.P ?L1))
	                (OUTSIDE.ADV ((ADV-A (FOR.P (KA PLAY.V))) RUN.13.V)))
	               ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D SON.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A AGENT.N))
			(!R6 (?X_D (PERTAIN-TO ?X_A)))
			(!R7 (?X_B CHILD.N))
			(!R8 (?X_D (IS.V ?X_B)))
			(!R9 (?X_B LITTLE.A))
			(!R10 (?X_C FRIEND.N))
			(!R11 (?X_C (PERTAIN-TO ?X_D)))
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
		(:PARAPHRASES
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.13.V)))
	    ?L2))
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.13.V)))))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-125.PR ?L2)) ** ?E)
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
	    (((ADV-A (FROM.P ?L1))
	      (OUTSIDE.ADV ((ADV-A (FOR.P (KA PLAY.V))) RUN.13.V)))
	     ?L2)))
			(?X_E (?X_A (TOGETHER.ADV ((ADV-A (WITH.P (K (PLUR STICK.N)))) PLAY.V))))
			(?X_C
	   (?X_K
	    (((ADV-A (FROM.P (K OUTSIDE.N)))
	      (IN.PRT ((ADV-A (FROM.P (K OUTSIDE.N))) COME.3.V)))
	     ?L2)))
			(?X_C
	   (?X_K
	    (((ADV-A (FROM.P (K OUTSIDE.N)))
	      (IN.PRT ((ADV-A (FROM.P (K OUTSIDE.N))) COME.4.V)))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
			(!W2 (?X_G (BEFORE ?X_C)))
			(!W3 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A son of a agent is a little child run.149s L2 from L1 outside for playing."
			"X_A plays together with sticks."
			"A son of a agent is a little child come.150s L2 from outside in from outside."
			"A son of a agent is a little child come.155s L2 from outside in from outside."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.22.V (K BETTER.A)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A SINGER.N))
			(!R2 (NOT ((K BETTER.A) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (K BETTER.A))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V (K BETTER.A)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V (K BETTER.A))))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 ((K BETTER.A) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V (K BETTER.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_B))
			(!W2 (?I1 PRECOND-OF ?X_B))
			(!W3 (?I2 PRECOND-OF ?X_B))
			(!W4 (?I3 PRECOND-OF ?X_B))
			(!W5 (?P1 POSTCOND-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A MAKE.10.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A SINGER.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_B ALBUM.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B EXIST.V)))))
			(?G2 (?X_A (WANT.V (KA (HAVE.V ?X_B)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B EXIST.V))
			(?P2 (?X_A (HAVE.V ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-126.PR ?X_M (K BETTER.A) ?X_F)) ** ?E)
		(:ROLES
			(!R1 (?X_C (PLUR PERSON.N)))
			(!R2 (?X_F ALBUM.N))
			(!R3 (?X_M SINGER.N))
		)
		(:STEPS
			(?X_L (?X_M (HARD.ADV WORK.V)))
			(?X_J (?X_M GET.22.V (K BETTER.A)))
			(?X_H ((K (PLUR PERSON.N)) (NOTICE.V ?X_M)))
			(?X_E (?X_M MAKE.10.V ?X_F))
			(?X_B (?X_C (BUY.V ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_J)))
			(!W2 (?X_L (BEFORE ?X_H)))
			(!W3 (?X_L (BEFORE ?X_E)))
			(!W4 (?X_L (BEFORE ?X_B)))
			(!W5 (?X_J (BEFORE ?X_H)))
			(!W6 (?X_J (BEFORE ?X_E)))
			(!W7 (?X_J (BEFORE ?X_B)))
			(!W8 (?X_H (BEFORE ?X_E)))
			(!W9 (?X_H (BEFORE ?X_B)))
			(!W10 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A singer works hard."
			"A singer get.189s better."
			"Persons notice a singer."
			"A singer make.185s a album."
			"A persons buy a album."
	)
)



(
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-127.PR ?X_L ?X_O)) ** ?E)
		(:ROLES
			(!R1 (?X_N (PLUR FRIEND.N)))
			(!R2 (?X_E STREET.N))
			(!R3 (?X_M (PLUR PARENT.N)))
			(!R4 (?X_L HOME.N))
			(!R5 (?X_L (PERTAIN-TO ?X_M)))
			(!R6 (?X_O GIRL.N))
			(!R7 (?X_O LOST.A))
			(!R8 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_A (?X_O ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_N)) PLAY.V)))) GO.V)))
			(?X_D (?X_O ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_N)) PLAY.V)))) GO.V)))
			(?X_G (?X_O ((ADV-A (ACROSS.P ?X_E)) GO.V)))
			(?X_I (?X_M (OVER.PRT ((ADV-A (FOR.P (KA (GET.V ?X_O)))) GO.V))))
			(?X_K (?X_M (FIND.V ?X_O ?X_L)))
			(?X_B (?X_M (((ADV-A (IN.P ?X_L)) FIND.V) ?X_O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_D)))
			(!W2 (?X_A (BEFORE ?X_G)))
			(!W3 (?X_A (BEFORE ?X_I)))
			(!W4 (?X_A (BEFORE ?X_K)))
			(!W5 (?X_A (BEFORE ?X_B)))
			(!W6 (?X_D (BEFORE ?X_G)))
			(!W7 (?X_D (BEFORE ?X_I)))
			(!W8 (?X_D (BEFORE ?X_K)))
			(!W9 (?X_D (BEFORE ?X_B)))
			(!W10 (?X_G (BEFORE ?X_I)))
			(!W11 (?X_G (BEFORE ?X_K)))
			(!W12 (?X_G (BEFORE ?X_B)))
			(!W13 (?X_I (BEFORE ?X_K)))
			(!W14 (?X_I (BEFORE ?X_B)))
			(!W15 (?X_K (BEFORE ?X_B)))
		)
	)
	(
			"A girl lost goes for with a friends of a girl lost playing."
			"A girl lost goes for with a friends of a girl lost playing."
			"A girl lost goes across a street."
			"A parents go over for getting a girl lost."
			"A parents find a girl lost a home of a parents."
			"A parents find a girl lost in a home of a parents."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-128.PR) ** ?E)
		(:ROLES
			(!R1 (?X_B (PLUR CHICKEN.N)))
		)
		(:STEPS
			(?X_D (?X_B ((ADV-A (TO.P ?X_A)) RUN.V)))
		)
	)
	(
			"A chickens run to X_A."
	)
)



(
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-129.PR (K MORE.A)
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
			"A agent goes DURING yesterday to a place pizza new absolutely amazing."
			"A agent wants more."
			"A agent knows a agent has back go."
			"A agent knows a agent has back go."
	)
)



(
	(EPI-SCHEMA (((K BABY.N)
	              ((ADV-A (ON.P ?X_A))
	               ((ADV-A (IN.P ?X_A)) ((ADV-A (ON.P ?X_A)) SIT.5.V))))
	             ** ?X_B)
		(:ROLES
			(!R1 ((K BABY.N) AGENT.N))
			(!R2 (NOT (?X_A AGENT.N)))
			(!R3 (?X_A FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_A SOFT.A))
			(!R6 (?X_A MAT.N))
		)
		(:GOALS
			(?G1 ((K BABY.N) (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 ((K BABY.N) (AT.P ?L)))
			(?I2 (?X_A (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C (MAY.AUX ((ADV-A (NEAR.P ?X_A)) PLAY.19.V))) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A WHILE.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_B FEMALE.A))
			(!R9 (?X_B AGENT.N))
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
		(:PARAPHRASES
			(?X_D (?X_C ((ADV-A (WITH.P ?T)) PLAY.19.V)))
			(?X_D (?X_C PLAY.19.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_D (AT-ABOUT ?X_E)))
			(!W3 (?X_F (SAME-TIME ?X_E)))
			(!W4 (?X_F (RIGHT-AFTER ?X_G)))
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
	(EPI-SCHEMA ((?X_C (MAY.AUX ((ADV-A (NEAR.P ?X_A)) PLAY.20.V))) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A WHILE.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_B FEMALE.A))
			(!R9 (?X_B AGENT.N))
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
		(:PARAPHRASES
			(?X_D (?X_C ((ADV-A (WITH.P ?T)) PLAY.20.V)))
			(?X_D (?X_C PLAY.20.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_D (SAME-TIME ?X_G)))
			(!W3 (?X_D (RIGHT-AFTER ?X_E)))
			(!W4 (?X_F (AT-ABOUT ?X_G)))
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
	(EPI-SCHEMA ((?X_C (MAY.AUX ((ADV-A (NEAR.P ?X_A)) PLAY.21.V))) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A WHILE.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_B FEMALE.A))
			(!R9 (?X_B AGENT.N))
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
		(:PARAPHRASES
			(?X_E (?X_C ((ADV-A (WITH.P ?T)) PLAY.21.V)))
			(?X_E (?X_C PLAY.21.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_E (RIGHT-AFTER ?X_D)))
			(!W3 (?X_E (SAME-TIME ?X_G)))
			(!W4 (?X_F (AT-ABOUT ?X_G)))
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
	(EPI-SCHEMA ((?X_D COMPOSITE-SCHEMA-130.PR) ** ?E)
		(:ROLES
			(!R1 (?X_H WHILE.N))
			(!R2 (?X_D AGENT.N))
			(!R3 (?X_G SOFT.A))
			(!R4 (?X_G MAT.N))
			(!R5 (?X_I FEMALE.A))
			(!R6 (?X_I AGENT.N))
			(!R7 (?X_H (PERTAIN-TO ?X_I)))
		)
		(:STEPS
			(?X_F
	   ((K BABY.N)
	    ((ADV-A (ON.P ?X_G))
	     ((ADV-A (IN.P ?X_G)) ((ADV-A (ON.P ?X_G)) SIT.5.V)))))
			(?X_C (?X_D (MAY.AUX ((ADV-A (NEAR.P ?X_H)) PLAY.19.V))))
			(?X_A (?X_D (MAY.AUX ((ADV-A (NEAR.P ?X_H)) PLAY.20.V))))
			(?X_A (?X_D (MAY.AUX ((ADV-A (NEAR.P ?X_H)) PLAY.21.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_C)))
			(!W2 (?X_F (BEFORE ?X_A)))
		)
	)
	(
			"Baby sit.231s on a soft mat in a soft mat on a soft mat."
			"A agent play.228s may near a while of a female agent."
			"A agent play.229s may near a while of a female agent."
			"A agent play.230s may near a while of a female agent."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-131.PR ?X_B)) ** ?E)
		(:ROLES
			(!R1 (?X_A HAT.N))
			(!R2 (?X_A (PERTAIN-TO ?X_C)))
			(!R3 (?X_B HAND.N))
			(!R4 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:STEPS
			(E342.SK (?X_C ?X_A (HAS.V ?X_B)))
		)
	)
	(
			"X_C has a hand of X_C."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              (((ADV-A (FROM.P ?X_C)) ((ADV-A (INTO.P ?X_A)) COME.5.V)) ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (?X_C OUTSIDE.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_C = ?L2)))
			(!R5 (?X_A GARAGE.N))
			(!R6 (?X_D (PERTAIN-TO ?X_B)))
			(!R7 (?X_C PUPPY.A))
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
		(:PARAPHRASES
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?X_C)) ((ADV-A (TO.P ?L2)) COME.5.V)))
	    ?L2))
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?X_C)) ((ADV-A (TO.P ?L2)) COME.5.V)))))
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-132.PR (K (PLUR PUPPY.N))
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
			(?X_G (?X_M (((ADV-A (FROM.P ?X_E)) ((ADV-A (INTO.P ?X_H)) COME.5.V)) ?L2)))
			(?X_D (?X_M (HAVE.V ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_J)))
			(!W2 (?X_L (BEFORE ?X_G)))
			(!W3 (?X_L (BEFORE ?X_D)))
			(!W4 (?X_J (BEFORE ?X_G)))
			(!W5 (?X_J (BEFORE ?X_D)))
			(!W6 (?X_G (BEFORE ?X_D)))
		)
	)
	(
			"A dog of X_N has puppys."
			"X_A is cold outside."
			"A dog of X_N come.246s L2 from a puppy outside into a garage."
			"A dog of X_N has a puppy outside."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (((ADV-A (TO.P ?X_A)) ((ADV-A (INTO.P ?X_B)) GIVE.6.V)) ?X_A
	               ?X_B))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_B CRAVING.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?X_C (?X_A HAVE.V ?X_B))
			(?I2 (NOT (?X_A HAVE.V ?X_B)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A HAVE.V ?X_B)))
			(?P2 (?X_A HAVE.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
			(!W2 (?X_E (AT-ABOUT ?X_F)))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (INTO.P ?X_B)) FEED.2.V) ?Y ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?Y AGENT.N))
			(!R3 (?X_B FOOD.N))
			(!R4 (NOT (?X_A = ?Y)))
			(!R5 (NOT (?Y = ?X_B)))
			(!R6 (NOT (?X_A = ?X_B)))
			(!R7 (?X_B CRAVING.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (NOT (?Y HUNGRY.A))))))
			(?G2 (?X_A (WANT.V (THAT (?Y EAT.V ?X_B)))))
		)
		(:PRECONDS
			(?X_E (?X_A HAVE.V ?X_B))
			(?I2 (?Y HUNGRY.A))
		)
		(:STEPS
			(?E1 (?Y EAT.V ?X_B))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (HAVE.V ?X_B))))
			(?P2 (NOT (?Y HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 AFTER ?X_C))
			(!W2 (?X_C (AT-ABOUT ?X_D)))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (INTO.P ?X_B)) FEED.3.V) ?Y ?X_B)) ** ?X_E)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?Y AGENT.N))
			(!R3 (?X_B FOOD.N))
			(!R4 (NOT (?X_A = ?Y)))
			(!R5 (NOT (?Y = ?X_B)))
			(!R6 (NOT (?X_A = ?X_B)))
			(!R7 (?X_B CRAVING.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (NOT (?Y HUNGRY.A))))))
			(?G2 (?X_A (WANT.V (THAT (?Y EAT.V ?X_B)))))
		)
		(:PRECONDS
			(?X_C (?X_A HAVE.V ?X_B))
			(?I2 (?Y HUNGRY.A))
		)
		(:STEPS
			(?E1 (?Y EAT.V ?X_B))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (HAVE.V ?X_B))))
			(?P2 (NOT (?Y HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 AFTER ?X_E))
			(!W2 (?X_C (AT-ABOUT ?X_D)))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
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
	(EPI-SCHEMA ((?X_A
	              (((ADV-A (TO.P ?X_A)) ((ADV-A (INTO.P ?X_B)) GIVE.7.V)) ?X_A
	               ?X_B))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_B CRAVING.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (?X_A HAVE.V ?X_B))
			(?I2 (NOT (?X_A HAVE.V ?X_B)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A HAVE.V ?X_B)))
			(?X_E (?X_A HAVE.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
			(!W2 (?X_E (AT-ABOUT ?X_F)))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-133.PR (K GUILTY.A) ?Y ?X_L ?X_K)) ** ?E)
		(:ROLES
			(!R1 (?X_K CRAVING.N))
			(!R2 (?X_L MAN.N))
		)
		(:STEPS
			(?X_J (?X_L (HAVE.V ?X_K)))
			(?X_H (?X_L (IGNORE.V ?X_K)))
			(?X_F (?X_K GROW.V))
			(?X_D
	   (?X_L (((ADV-A (TO.P ?X_L)) ((ADV-A (INTO.P ?X_K)) GIVE.6.V)) ?X_L ?X_K)))
			(?X_D (?X_L (((ADV-A (INTO.P ?X_K)) FEED.2.V) ?Y ?X_K)))
			(?X_D (?X_L (((ADV-A (INTO.P ?X_K)) FEED.3.V) ?Y ?X_K)))
			(?X_D
	   (?X_L (((ADV-A (TO.P ?X_L)) ((ADV-A (INTO.P ?X_K)) GIVE.7.V)) ?X_L ?X_K)))
			(?X_B (?X_L (FEEL.V (K GUILTY.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_D)))
			(!W2 (?X_H (BEFORE ?X_F)))
			(!W3 (?X_H (BEFORE ?X_B)))
			(!W4 (?X_F (BEFORE ?X_B)))
		)
	)
	(
			"A man has a craving."
			"A man ignores a craving."
			"A craving grows."
			"A man give.256s a man a craving to a man into a craving."
			"A man feed.261s Y a craving into a craving."
			"A man feed.262s Y a craving into a craving."
			"A man give.257s a man a craving to a man into a craving."
			"A man feels guilty."
	)
)



(
	(EPI-SCHEMA ((?X_A (((ADV-A (FROM.P ?L1)) (OFF.PRT RUN.14.V)) ?L2)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.14.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.14.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
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
	              (COMPOSITE-SCHEMA-134.PR
	               (KE (AND (?X_K (PASV STICK.V)) (?X_K (IN.P ?X_J)))) ?X_K
	               (KE (?X_A LIFE.N)) ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J TREE.N))
			(!R2 (?X_K DOG.N))
			(!R3 (?X_L (HOME.ADV WALK.V)))
		)
		(:STEPS
			(?X_I (?X_L (SEE.V (KE (AND (?X_K (PASV STICK.V)) (?X_K (IN.P ?X_J)))))))
			(?X_G (?X_L (((ADV-A (FROM.P ?X_J)) FREE.V) ?X_K)))
			(?X_E (?X_K (((ADV-A (FROM.P ?L1)) (OFF.PRT RUN.14.V)) ?L2)))
			(?X_C (?X_L (SAVE.V (KE (?X_A LIFE.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_G)))
			(!W2 (?X_I (BEFORE ?X_E)))
			(!W3 (?X_I (BEFORE ?X_C)))
			(!W4 (?X_G (BEFORE ?X_E)))
			(!W5 (?X_G (BEFORE ?X_C)))
			(!W6 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A home walk sees and a dog PASV sticks a dog in a tree."
			"A home walk frees a dog from a tree."
			"A dog run.265s L2 from L1 off."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.23.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B (PLUR SCISSOR.N)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-135.PR ?X_J (K GREAT.A) ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_I (PLUR SCISSOR.N)))
			(!R2 (?X_J LOT.N))
			(!R3 (?X_J (OF.P (K (L X (AND (X SPLIT.A) (X (PLUR END.N))))))))
		)
		(:STEPS
			(?X_B (?X_A (HAVE.V ?X_J)))
			(?X_H (?X_A GET.23.V ?X_I))
			(?X_F (?X_A ((THEN.ADV (OFF.ADV CUT.V)) ?X_J)))
			(?X_D (?X_A ((THEN.ADV LOOK.V) (K GREAT.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_H)))
			(!W2 (?X_B (BEFORE ?X_F)))
			(!W3 (?X_B (BEFORE ?X_D)))
			(!W4 (?X_H (BEFORE ?X_F)))
			(!W5 (?X_H (BEFORE ?X_D)))
			(!W6 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"X_A has a lot of split end."
			"X_A get.2s a scissors."
			"X_A cuts a lot of split end then off."
			"X_A looks great then."
	)
)



(
	(EPI-SCHEMA (((K DOG.N) ((ADV-A (ON.P ?X_B)) ((ADV-A (IN.P ?X_B)) SIT.6.V))) **
	             ?X_C)
		(:ROLES
			(!R1 ((K DOG.N) AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_B FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_B HAT.N))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 ((K DOG.N) (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 ((K DOG.N) (AT.P ?L)))
			(?I2 (?X_B (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_E)))
			(!W2 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA (((K DOG.N) ((ADV-A (ON.P ?X_A)) ((ADV-A (IN.P ?X_A)) SIT.7.V))) **
	             ?X_B)
		(:ROLES
			(!R1 ((K DOG.N) AGENT.N))
			(!R2 (NOT (?X_A AGENT.N)))
			(!R3 (?X_A FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_A HAT.N))
		)
		(:GOALS
			(?G1 ((K DOG.N) (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 ((K DOG.N) (AT.P ?L)))
			(?I2 (?X_A (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (AT-ABOUT ?X_D)))
			(!W2 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA (((K DOG.N) ((ADV-A (ON.P ?X_D)) ((ADV-A (IN.P ?X_D)) SIT.8.V))) **
	             ?X_E)
		(:ROLES
			(!R1 ((K DOG.N) AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_D FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_D HAT.N))
			(!R6 (?X_A AGENT.N))
			(!R7 (?X_D (PERTAIN-TO ?X_A)))
			(!R8 (?X_C (K DOG.N) JIP.N))
			(!R9 (?X_C (PERTAIN-TO ?X_A)))
			(!R10 (?X_B (IS.V ?X_C)))
		)
		(:GOALS
			(?G1 ((K DOG.N) (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 ((K DOG.N) (AT.P ?L)))
			(?I2 (?X_D (AT.P ?L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_G)))
			(!W2 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA (((K DOG.N) COMPOSITE-SCHEMA-136.PR) ** ?E)
		(:ROLES
			(!R1 (?X_I AGENT.N))
			(!R2 (?X_C HAT.N))
			(!R3 (?X_C (PERTAIN-TO ?X_D)))
			(!R4 (?X_E HAT.N))
			(!R5 (?X_G (K DOG.N) JIP.N))
			(!R6 (?X_F (IS.V ?X_G)))
			(!R7 (?X_G (PERTAIN-TO ?X_I)))
			(!R8 (?X_H HAT.N))
			(!R9 (?X_H (PERTAIN-TO ?X_I)))
		)
		(:STEPS
			(?X_B ((K DOG.N) ((ADV-A (AT.P ?X_I)) LOOK.V)))
			(E24.SK ((K DOG.N) ((ADV-A (ON.P ?X_C)) ((ADV-A (IN.P ?X_C)) SIT.6.V))))
			(E24.SK ((K DOG.N) ((ADV-A (ON.P ?X_E)) ((ADV-A (IN.P ?X_E)) SIT.7.V))))
			(E24.SK ((K DOG.N) ((ADV-A (ON.P ?X_H)) ((ADV-A (IN.P ?X_H)) SIT.8.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B BEFORE E24.SK))
		)
	)
	(
			"Dog looks at a agent."
			"Dog sit.6s on a hat of X_D in a hat of X_D."
			"Dog sit.7s on a hat in a hat."
			"Dog sit.8s on a hat of a agent in a hat of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (FROM.P ?X_A)) (UP.PRT WALK.4.V)) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B PERSON.N))
			(!R2 (?X_A SIDE.N))
			(!R3 (?X_C LOCATION.N))
			(!R4 (NOT (?X_A = ?X_C)))
			(!R5 (?X_C HILL.N))
			(!R6 (?X_A HILL.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?X_A)))
			(?I2 (NOT (?X_B (AT.P ?X_C))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?X_A))))
			(?P2 (?X_B (AT.P ?X_C)))
		)
		(:PARAPHRASES
			(?X_D
	   (?X_B
	    ((ADV-A (FOR.P ?X_C))
	     ((ADV-A (FROM.P ?X_A)) ((ADV-A (TO.P ?X_C)) WALK.4.V)))
	    ?X_C))
			(?X_D
	   (?X_B
	    ((ADV-A (FOR.P ?X_C))
	     ((ADV-A (FROM.P ?X_A)) ((ADV-A (TO.P ?X_C)) WALK.4.V)))))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-137.PR ?X_L ?X_A ?X_F)) ** ?E)
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
			(?X_E (?X_G (((ADV-A (FROM.P ?X_N)) (UP.PRT WALK.4.V)) ?X_F)))
			(?X_C (?X_L ((ALMOST.ADV HIT.V) ?X_A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_E)))
			(!W3 (?X_K (BEFORE ?X_C)))
			(!W4 (?X_I (BEFORE ?X_E)))
			(!W5 (?X_I (BEFORE ?X_C)))
			(!W6 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A boy kicks a rock."
			"A rock comes loose."
			"A person walk.27s a hill from a hill side up."
			"A rock hits X_A almost."
	)
)



(
	(EPI-SCHEMA ((?X_B ((HOME.ADV ((ADV-A (AS.P ?X_A)) TAKE.16.V)) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_A (K NEW.A) PET.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_C SAD.A))
			(!R8 (?X_C PUPPY.N))
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
			(!W6 (?X_D (SAME-TIME ?X_G)))
			(!W7 (?X_D (RIGHT-AFTER ?X_E)))
			(!W8 (?X_F (BEFORE ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B ((HOME.ADV ((ADV-A (AS.P ?X_A)) TAKE.17.V)) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_A (K NEW.A) PET.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_C PUPPY.N))
			(!R8 (?X_C SAD.A))
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
			(!W6 (?X_D (BEFORE ?X_E)))
			(!W7 (?X_F (SAME-TIME ?X_E)))
			(!W8 (?X_F (RIGHT-AFTER ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B ((HOME.ADV ((ADV-A (AS.P ?X_A)) TAKE.5.V)) ?X_C)) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C SAD.A))
			(!R6 (?X_C PUPPY.N))
			(!R7 (?X_A (K NEW.A) PET.N))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
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
			(!W6 (?X_E (RIGHT-AFTER ?X_D)))
			(!W7 (?X_E (SAME-TIME ?X_G)))
			(!W8 (?X_F (BEFORE ?X_G)))
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
	              (COMPOSITE-SCHEMA-138.PR ?X_C
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
			"X_A goes a morning to school."
			"X_B likes to school going."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FROM.P ?L1)) (OUT.ADV ((ADV-A (TO.P ?X_A)) GO.26.V)))
	               ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B COW.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A FIELD.N))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.26.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.26.V)))))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?X_A)) LEAVE.1.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B COW.N))
			(!R2 (?X_A FIELD.N))
			(!R3 (?X_C LOCATION.N))
			(!R4 (NOT (?X_A = ?X_C)))
			(!R5 (?X_C BARN.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?X_A)))
			(?I2 (NOT (?X_B (AT.P ?X_C))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?X_A))))
			(?P2 (?X_B (AT.P ?X_C)))
		)
		(:PARAPHRASES
			(?X_D
	   (?X_B
	    ((ADV-A (FOR.P ?X_C))
	     ((ADV-A (FROM.P ?X_A)) ((ADV-A (TO.P ?X_C)) LEAVE.1.V)))
	    ?X_C))
			(?X_D
	   (?X_B
	    ((ADV-A (FOR.P ?X_C))
	     ((ADV-A (FROM.P ?X_A)) ((ADV-A (TO.P ?X_C)) LEAVE.1.V)))))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-139.PR ?X_K ?X_G ?L2 ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_G SPOT.N))
			(!R2 (?X_G (OF.P (K GRASS.N))))
			(!R3 (?X_G GRASS.N))
			(!R4 (?X_H (PLUR COW.N)))
			(!R5 (?X_H OTHER.A))
			(!R6 (?X_K FIELD.N))
			(!R7 (?X_N BARN.N))
			(!R8 (?X_O COW.N))
		)
		(:STEPS
			(?X_M (?X_O ((ADV-A (FROM.P ?X_K)) LEAVE.1.V) ?X_N))
			(?X_J
	   (?X_O (((ADV-A (FROM.P ?L1)) (OUT.ADV ((ADV-A (TO.P ?X_K)) GO.26.V))) ?L2)))
			(?X_A (?X_H OUT.P))
			(?X_B (?X_H (IN.P ?X_K)))
			(?X_F (?X_O (FIND.V ?X_G)))
			(?X_D (?X_O (EAT.V ?X_G)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_J)))
			(!W2 (?X_M (BEFORE ?X_A)))
			(!W3 (?X_M (BEFORE ?X_B)))
			(!W4 (?X_M (BEFORE ?X_F)))
			(!W5 (?X_M (BEFORE ?X_D)))
			(!W6 (?X_J (BEFORE ?X_A)))
			(!W7 (?X_J (BEFORE ?X_B)))
			(!W8 (?X_J (BEFORE ?X_F)))
			(!W9 (?X_J (BEFORE ?X_D)))
			(!W10 (?X_A (BEFORE ?X_B)))
			(!W11 (?X_A (BEFORE ?X_F)))
			(!W12 (?X_A (BEFORE ?X_D)))
			(!W13 (?X_B (BEFORE ?X_F)))
			(!W14 (?X_B (BEFORE ?X_D)))
			(!W15 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A cow leave.60s a barn from a field."
			"A cow go.62s L2 from L1 out to a field."
			"A cows other are out."
			"A cows other are in."
			"A cow finds a spot of grass grass."
			"A cow eats a spot of grass grass."
	)
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-140.PR ?X_C)) ** ?E)
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
			"A agent has a storm DURING today."
			"X_A rains ADV very hard for a long time."
			"A wind blows loudly."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-141.PR
	               (KA ((ADV-A (WITH.P (ALL.D (PLUR CHILD.N)))) PLAY.V))))
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
	(EPI-SCHEMA ((?X_A GET.24.V ?X_B) ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_C (CONSEC ?X_D)))
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
	(EPI-SCHEMA ((?X_A GET.25.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
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
	(EPI-SCHEMA ((?X_A GET.26.V ?X_B) ** ?X_E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AT-ABOUT ?X_C)))
			(!W7 (?X_D (AT-ABOUT ?X_C)))
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-142.PR ?X_B ?X_I ?X_D)) ** ?E)
		(:ROLES
			(!R1 (?X_I TREE.N))
		)
		(:STEPS
			(?X_K (?X_A (K (PLUR EGG.N)) (HAVE.V ?X_B)))
			(?X_H (?X_C ((UP.PRT GO.V) ?X_I)))
			(?X_F (?X_C GET.24.V ?X_D))
			(?X_F (?X_C GET.25.V ?X_D))
			(?X_F (?X_C GET.26.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_H)))
			(!W2 (?X_K (BEFORE ?X_F)))
			(!W3 (?X_H (BEFORE ?X_F)))
		)
	)
	(
			"X_A has X_B."
			"X_C goes a tree up."
			"X_C get.90s X_D."
			"X_C get.91s X_D."
			"X_C get.92s X_D."
	)
)



(
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-143.PR ?X_M ?X_J ?X_K ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_M HAND.N))
			(!R2 (?X_J BAT.N))
			(!R3 (?X_K BLACK.A))
			(!R4 (?X_K HAT.N))
			(!R5 (?X_F AGENT.N))
			(!R6 (?X_O (PERTAIN-TO ?X_F)))
			(!R7 (?X_L BOY.N))
			(!R8 (?X_L (HAS.V ?X_I)))
			(!R9 (?X_I (PERTAIN-TO ?X_L)))
			(!R10 (?X_J (PERTAIN-TO ?X_L)))
			(!R11 (?X_M (PERTAIN-TO ?X_L)))
			(!R12 (?X_K (IS.V ?X_L)))
			(!R13 (?X_N BLACK.A))
			(!R14 (?X_N BAT.N))
			(!R15 (?X_N (PERTAIN-TO ?X_L)))
			(!R16 (?X_N (IN.P ?X_M)))
			(!R17 (?X_N (IS.V ?X_O)))
		)
		(:STEPS
			(?X_A (?X_J (IN.P ?X_M)))
			(?X_B (?X_L (HAS.V ?X_J)))
			(?X_E (?X_L (HAVE.V ?X_K)))
			(?X_H (?X_F (HAVE.V ?X_N)))
			(?X_C (?X_L (HAS.V ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_B)))
			(!W2 (?X_A (BEFORE ?X_E)))
			(!W3 (?X_A (BEFORE ?X_H)))
			(!W4 (?X_A (BEFORE ?X_C)))
			(!W5 (?X_B (BEFORE ?X_E)))
			(!W6 (?X_B (BEFORE ?X_H)))
			(!W7 (?X_B (BEFORE ?X_C)))
			(!W8 (?X_E (BEFORE ?X_H)))
			(!W9 (?X_E (BEFORE ?X_C)))
			(!W10 (?X_H (BEFORE ?X_C)))
		)
	)
	(
			"A bat of a boy has a of a boy has X_I is in."
			"A boy has a of a boy has X_I has a bat of a boy has a of a boy has X_I."
			"A boy has a of a boy has X_I has a black hat is a boy has a of a boy has X_I."
			"A agent has a black bat of a boy has X_I in a hand of a boy has X_I is a of a agent."
			"A boy has a of a boy has X_I has a black bat of a boy has X_I in a hand of a boy has X_I is a of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-144.PR (K (VERY.ADV WET.A)))) ** ?E)
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
	(EPI-SCHEMA ((?X_B ((OUT.PRT GET.27.V) (KA (SEE.V ?X_C)))) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((KA (SEE.V ?X_C)) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (KA (SEE.V ?X_C)))))
			(!R5 (?X_C DOG.N))
			(!R6 (?X_C DEAD.A))
			(!R7 (?X_B (HOME.ADV DRIVE.V)))
			(!R8 (?X_B (SAD.A (KE (?X_B (KILL.V ?X_C))))))
			(!R9 (?X_A ROAD.N))
			(!R10 (?X_C (IN.P ?X_A)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V (KA (SEE.V ?X_C))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (KA (SEE.V ?X_C)))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((KA (SEE.V ?X_C)) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (KA (SEE.V ?X_C))))
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
	(EPI-SCHEMA ((?X_E (COMPOSITE-SCHEMA-145.PR ?X_F (KA (SEE.V ?X_F)))) ** ?E)
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
			(?X_B (?X_E ((OUT.PRT GET.27.V) (KA (SEE.V ?X_F)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A home drive sad a home drive sad X_E kills a dead dog in X_G kills a dead dog in a road hits a dead dog in a road."
			"A home drive sad a home drive sad X_E kills a dead dog in X_G kills a dead dog in a road get.137s seeing a dead dog in a road out."
	)
)



(
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-146.PR ?X_H)) ** ?E)
		(:ROLES
			(!R1 (?X_C FLOOR.N))
			(!R2 (?X_F DOG.N))
			(!R3 (?X_F (PERTAIN-TO ?X_G)))
			(!R4 (?X_H BARK.N))
		)
		(:STEPS
			(?X_B (?X_F DREAM.V))
			(?X_E (?X_F ((ADV-A (ON.P ?X_C)) LIE.V)))
			(?X_J (?X_F ((OUT.PRT LET.V) ?X_H)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_E)))
			(!W2 (?X_B (BEFORE ?X_J)))
			(!W3 (?X_E (BEFORE ?X_J)))
		)
	)
	(
			"A dog of X_G dreams."
			"A dog of X_G lies on a floor."
			"A dog of X_G lets a bark out."
	)
)



(
	(EPI-SCHEMA ((?X_A WATCH.5.V (K (PLUR BIRD.N))) ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((K (PLUR BIRD.N)) ENTITY.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?I PERTAIN-TO (K (PLUR BIRD.N))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (KNOW.V ?I))))))
		)
		(:PRECONDS
			(?X_B (?X_A (CAN.MD (SEE.V (K (PLUR BIRD.N))))))
		)
		(:POSTCONDS
			(?P1 ((K (PLUR BIRD.N)) (KNOW.V ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (AT-ABOUT ?X_C)))
			(!W2 (?X_D (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_A WATCH.6.V (K (PLUR BIRD.N))) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((K (PLUR BIRD.N)) ENTITY.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (?I PERTAIN-TO (K (PLUR BIRD.N))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (KNOW.V ?I))))))
		)
		(:PRECONDS
			(?X_D (?X_A (CAN.MD (SEE.V (K (PLUR BIRD.N))))))
		)
		(:POSTCONDS
			(?P1 ((K (PLUR BIRD.N)) (KNOW.V ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (AT-ABOUT ?X_C)))
			(!W2 (?X_D (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_A ((OUTSIDE.ADV TAKE.18.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
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
	(EPI-SCHEMA ((?X_B
	              (COMPOSITE-SCHEMA-147.PR (K (PLUR BINOCULAR.N)) ?X_F
	               (K (PLUR BIRD.N)) ?X_A))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F (PLUR FRIEND.N)))
			(!R2 (?X_F (PERTAIN-TO ?X_G)))
		)
		(:STEPS
			(?X_O (?X_B (BUY.V (K (PLUR BINOCULAR.N)))))
			(?X_M (?X_B ((OUTSIDE.ADV TAKE.18.V) ?X_A)))
			(?X_K (?X_B (SEE.V (K (PLUR BIRD.N)))))
			(?X_I (?X_B WATCH.5.V (K (PLUR BIRD.N))))
			(?X_I (?X_B WATCH.6.V (K (PLUR BIRD.N))))
			(?X_C ((K (PLUR BIRD.N)) (BECOME.V ?X_F)))
			(?X_E ((K (PLUR BIRD.N)) (BECOME.V ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_C)))
			(!W2 (?X_O (BEFORE ?X_E)))
			(!W3 (?X_M (BEFORE ?X_K)))
			(!W4 (?X_M (BEFORE ?X_I)))
			(!W5 (?X_K (BEFORE ?X_I)))
			(!W6 (?X_C (BEFORE ?X_E)))
		)
	)
	(
			"X_B buys binoculars."
			"X_B take.163s X_A outside."
			"X_B sees birds."
			"X_B watch.160s birds."
			"X_B watch.161s birds."
			"Birds become a friends of X_G."
			"Birds become a friends of X_G."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-148.PR) ** ?E)
		(:ROLES
			(!R1 (?X_A (K HIND.A) (PLUR FOOT.N)))
			(!R2 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:STEPS
			(E233.SK (?X_B ((ADV-A (ON.P ?X_A)) STAND.V)))
		)
	)
	(
			"X_B stands on a of X_B."
	)
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) GO.27.V)) ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A STORE.N))
			(!R6 (?X_A PET.N))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.27.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.27.V)))))
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
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-149.PR ?X_N ?X_A ?X_F ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_F LIZARD.N))
			(!R2 (?X_K PET.N))
			(!R3 (?X_K STORE.N))
			(!R4 (?X_N PET.N))
		)
		(:STEPS
			(?X_M (?X_B (WANT.V ?X_N)))
			(?X_J (?X_B (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_K)) GO.27.V)) ?L2)))
			(?X_C (?X_A LIZARD.N))
			(?X_H (?X_B (FIND.V ?X_A)))
			(?X_E (?X_B (BUY.V ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_J)))
			(!W2 (?X_M (BEFORE ?X_C)))
			(!W3 (?X_M (BEFORE ?X_H)))
			(!W4 (?X_M (BEFORE ?X_E)))
			(!W5 (?X_J (BEFORE ?X_C)))
			(!W6 (?X_J (BEFORE ?X_H)))
			(!W7 (?X_J (BEFORE ?X_E)))
			(!W8 (?X_C (BEFORE ?X_E)))
			(!W9 (?X_H (BEFORE ?X_E)))
		)
	)
	(
			"X_B wants a pet."
			"X_B go.199s L2 from L1 to a pet store."
			"X_A is lizard."
			"X_B finds X_A."
			"X_B buys a lizard."
	)
)



(
	(EPI-SCHEMA ((?X_B EAT.8.V ?X_A) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_A FOOD.N))
			(!R3 (?X_A BIG.A))
			(!R4 (?X_A MUFFIN.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (NOT (?X_B HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_B HAVE.V ?X_A))
			(?I2 (?X_B HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (HAVE.V ?X_A))))
			(?P2 (NOT (?X_B HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_C))
			(!W2 (?I1 BEFORE ?X_C))
			(!W3 (?X_C CAUSE-OF ?P1))
			(!W4 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-150.PR ?X_C)) ** ?E)
		(:ROLES
			(!R1 (?X_C BIG.A))
			(!R2 (?X_C MUFFIN.N))
			(!R3 (?X_D AGENT.N))
		)
		(:STEPS
			(?X_B (?X_D EAT.8.V ?X_C))
		)
	)
	(
			"A agent eat.209s a big muffin."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FROM.P ?L1))
	                ((ADV-A (FOR.P (KA (((ADV-A (FOR.P ?X_A)) BUY.V) (K GAS.N)))))
	                 GO.28.V))
	               ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A AGENT.N))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.28.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.28.V)))))
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
	(EPI-SCHEMA ((?X_A TELL.5.V ?X_B (KA (FORWARD.ADV PAY.V) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B AGENT.N))
			(!R3 ((KA (FORWARD.ADV PAY.V) ?X_C) INFORMATION.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (KNOW.V (KA (FORWARD.ADV PAY.V) ?X_C)))))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V (KA (FORWARD.ADV PAY.V) ?X_C))))
		)
		(:PARAPHRASES
			(?X_D ((?X_A TELL.5.V ?X_B (KA (FORWARD.ADV PAY.V) ?X_C)) ** ?X_D))
			(?X_D ((?X_A LET.V ?X_B (KA (KNOW.V (KA (FORWARD.ADV PAY.V) ?X_C)))) ** ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_G
	              (COMPOSITE-SCHEMA-151.PR
	               (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N)))))) ?L2 ?X_M
	               (KA (FORWARD.ADV PAY.V) ?X_B)))
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
			(?X_F
	   (?X_G
	    (((ADV-A (FROM.P ?L1))
	      ((ADV-A (FOR.P (KA (((ADV-A (FOR.P ?X_M)) BUY.V) (K GAS.N))))) GO.28.V))
	     ?L2)))
			(?X_D (?X_G TELL.5.V ?X_M (KA (FORWARD.ADV PAY.V) ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_I)))
			(!W2 (?X_L (BEFORE ?X_F)))
			(!W3 (?X_L (BEFORE ?X_D)))
			(!W4 (?X_I (BEFORE ?X_F)))
			(!W5 (?X_I (BEFORE ?X_D)))
			(!W6 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A time runs out of."
			"A person sees a agent."
			"A agent go.217s L2 from L1 for for a agent buying gas."
			"A agent tell.214s a agent forward pay X_B."
	)
)



(
	(EPI-SCHEMA ((?X_A MAKE.11.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A GIRL.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_B PRETTY.A))
			(!R4 (?X_B DRESS.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B EXIST.V)))))
			(?G2 (?X_A (WANT.V (KA (HAVE.V ?X_B)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B EXIST.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B EXIST.V))
			(?P2 (?X_A (HAVE.V ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-152.PR ?X_C)) ** ?E)
		(:ROLES
			(!R1 (?X_C PRETTY.A))
			(!R2 (?X_C DRESS.N))
			(!R3 (?X_D GIRL.N))
		)
		(:STEPS
			(?X_B (?X_D MAKE.11.V ?X_C))
		)
	)
	(
			"A girl make.225s a pretty dress."
	)
)



(
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-153.PR (K (PLUR RAINBOW.N)) ?X_J)) ** ?E)
		(:ROLES
			(!R1 (?X_D DAY.N))
			(!R2 (?X_I FAMILY.N))
			(!R3 (?X_J RAINBOW.N))
		)
		(:STEPS
			(?X_C (?X_I ((REALLY.ADV LOVE.V) (K (PLUR RAINBOW.N)))))
			(?X_F ((ADV-E (DURING ?X_D)) (?X_A RAIN.V)))
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
			"X_A rains DURING a day."
			"A family looks outside."
			"A family sees a rainbow."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-154.PR ?X_D ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_D LETTER.N))
			(!R2 (?X_I SMALL.A))
			(!R3 (?X_I NOTE.N))
		)
		(:STEPS
			(?X_C (?X_A (FIND.V ?X_D)))
			(?X_F (?X_A ((UP.PRT OPEN.V) ?X_D)))
			(?X_H ((K INSIDE.N) (BE.V ?X_I)))
			(?X_K (?X_A ((AWAY.ADV THROW.V) ?X_I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_F)))
			(!W2 (?X_C (BEFORE ?X_H)))
			(!W3 (?X_C (BEFORE ?X_K)))
			(!W4 (?X_F (BEFORE ?X_H)))
			(!W5 (?X_F (BEFORE ?X_K)))
			(!W6 (?X_H (BEFORE ?X_K)))
		)
	)
	(
			"X_A finds a letter."
			"X_A opens a letter up."
			"Inside is a small note."
			"X_A throws a small note away."
	)
)



(
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-155.PR (K (PLUR GLASS.N)) ?X_R ?X_Q
	               (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_Q)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E ROCK.N))
			(!R2 (?X_P MAN.N))
			(!R3 (?X_R FRIEND.N))
			(!R4 (?X_R (PERTAIN-TO ?X_P)))
			(!R5 (?X_Q EYE.N))
			(!R6 (?X_Q (PERTAIN-TO ?X_R)))
		)
		(:STEPS
			(?X_D (?X_P (WEAR.V (K (PLUR GLASS.N)))))
			(?X_G (?X_E (HIT.V (K (PLUR GLASS.N)))))
			(?X_I ((K (PLUR GLASS.N)) BREAK.V))
			(?X_A (?X_P (SHOW.V ?X_R)))
			(?X_K (?X_P (SHOW.V ?X_R)))
			(?X_M ((K (PLUR GLASS.N)) (SAVE.V ?X_Q)))
			(?X_O (?X_R (SAY.V (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_Q))))))
			(?X_B (?X_R (SAY.V (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_Q))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_G)))
			(!W2 (?X_D (BEFORE ?X_I)))
			(!W3 (?X_D (BEFORE ?X_A)))
			(!W4 (?X_D (BEFORE ?X_K)))
			(!W5 (?X_D (BEFORE ?X_M)))
			(!W6 (?X_D (BEFORE ?X_O)))
			(!W7 (?X_D (BEFORE ?X_B)))
			(!W8 (?X_G (BEFORE ?X_I)))
			(!W9 (?X_G (BEFORE ?X_A)))
			(!W10 (?X_G (BEFORE ?X_K)))
			(!W11 (?X_G (BEFORE ?X_M)))
			(!W12 (?X_G (BEFORE ?X_O)))
			(!W13 (?X_G (BEFORE ?X_B)))
			(!W14 (?X_I (BEFORE ?X_A)))
			(!W15 (?X_I (BEFORE ?X_K)))
			(!W16 (?X_I (BEFORE ?X_M)))
			(!W17 (?X_I (BEFORE ?X_O)))
			(!W18 (?X_I (BEFORE ?X_B)))
			(!W19 (?X_A (BEFORE ?X_K)))
			(!W20 (?X_A (BEFORE ?X_M)))
			(!W21 (?X_A (BEFORE ?X_O)))
			(!W22 (?X_A (BEFORE ?X_B)))
			(!W23 (?X_K (BEFORE ?X_M)))
			(!W24 (?X_K (BEFORE ?X_O)))
			(!W25 (?X_K (BEFORE ?X_B)))
			(!W26 (?X_M (BEFORE ?X_O)))
			(!W27 (?X_M (BEFORE ?X_B)))
			(!W28 (?X_O (BEFORE ?X_B)))
		)
	)
	(
			"A man wears glasss."
			"A rock hits glasss."
			"Glasss break."
			"A man shows a friend of a man."
			"A man shows a friend of a man."
			"Glasss save a eye of a friend of X_P."
			"A friend of a man says glasss save a eye of a friend of X_P."
	)
)



(
	(EPI-SCHEMA ((MUST.AUX-S (?X_B (COOK.1.V ?X_C))) ** ?X_F)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_C ((TOO.ADV BAD.A) (KA (OUT.ADV GO.V)))))
			(!R4 (?X_A NIGHT.N))
			(!R5 (?X_A RAINING.A))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT ((ADV-E (DURING ?X_A)) (?X_C EXIST.V))))))
			(?G2 (?X_B (WANT.V (KA (HAVE.V ?X_C)))))
		)
		(:PRECONDS
			(?I1 (NOT ((ADV-E (DURING ?X_A)) (?X_C EXIST.V))))
		)
		(:POSTCONDS
			(?X_D ((ADV-E (DURING ?X_A)) (?X_C EXIST.V)))
			(?P2 (?X_B (HAVE.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
			(!W2 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((MUST.AUX-S (?X_B (COOK.2.V ?X_C))) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_C ((TOO.ADV BAD.A) (KA (OUT.ADV GO.V)))))
			(!R4 (?X_A NIGHT.N))
			(!R5 (?X_A RAINING.A))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT ((ADV-E (DURING ?X_A)) (?X_C EXIST.V))))))
			(?G2 (?X_B (WANT.V (KA (HAVE.V ?X_C)))))
		)
		(:PRECONDS
			(?I1 (NOT ((ADV-E (DURING ?X_A)) (?X_C EXIST.V))))
		)
		(:POSTCONDS
			(?X_F ((ADV-E (DURING ?X_A)) (?X_C EXIST.V)))
			(?P2 (?X_B (HAVE.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
			(!W2 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-156.PR ?X_E)) ** ?E)
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
			"A too bad out go is DURING a night raining."
			"X_A cook.2s a too bad out go must."
			"X_A cook.3s a too bad out go must."
	)
)



(
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-157.PR (KA (SEE.V ?X_C)) (KA LEAVE.V))) ** ?E)
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
	)
)



(
	(EPI-SCHEMA ((?X_C (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_A)) GO.29.V)) ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A POND.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B ROD.N))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.29.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.29.V)))))
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
	(EPI-SCHEMA ((?X_P (COMPOSITE-SCHEMA-158.PR ?X_N ?X_I ?X_O ?X_D ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_D BOOT.N))
			(!R2 (?X_I FISH.N))
			(!R3 (?X_O ROD.N))
			(!R4 (?X_N POND.N))
			(!R5 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_K (?X_P (CAST.V ?X_O ?X_N)))
			(?X_M (?X_P (((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_N)) GO.29.V)) ?L2)))
			(?X_A (?X_P (((ADV-A (IN.P ?X_N)) CAST.V) ?X_O)))
			(?X_H (?X_P (CATCH.V ?X_I)))
			(?X_F (?X_P ((UP.ADV PULL.V) ?X_O)))
			(?X_C (?X_O ((ACTUALLY.ADV BE.V) ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_A)))
			(!W2 (?X_K (BEFORE ?X_H)))
			(!W3 (?X_K (BEFORE ?X_F)))
			(!W4 (?X_K (BEFORE ?X_C)))
			(!W5 (?X_M (BEFORE ?X_A)))
			(!W6 (?X_M (BEFORE ?X_H)))
			(!W7 (?X_M (BEFORE ?X_F)))
			(!W8 (?X_M (BEFORE ?X_C)))
			(!W9 (?X_A (BEFORE ?X_H)))
			(!W10 (?X_A (BEFORE ?X_F)))
			(!W11 (?X_A (BEFORE ?X_C)))
			(!W12 (?X_H (BEFORE ?X_F)))
			(!W13 (?X_H (BEFORE ?X_C)))
			(!W14 (?X_F (BEFORE ?X_C)))
		)
	)
	(
			"X_P casts a rod of X_P a pond."
			"X_P go.21s L2 from L1 to a pond."
			"X_P casts a rod of X_P in a pond."
			"X_P catches a fish."
			"X_P pulls a rod of X_P up."
			"A rod of X_P is a boot actually."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FROM.P ?L1)) ((ADV-A (AFTER.P ?X_A)) RUN.15.V)) ?L2))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C BROTHER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A BASKET.N))
			(!R6 (?X_B BOY.N))
			(!R7 (?X_C (PERTAIN-TO ?X_B)))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.15.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.15.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (SAME-TIME ?X_G)))
			(!W7 (?X_D (RIGHT-AFTER ?X_E)))
			(!W8 (?X_F (BEFORE ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-159.PR ?X_N ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_O BROTHER.N))
			(!R2 (?X_H STREET.N))
			(!R3 (?X_K RIM.N))
			(!R4 (?X_N BASKET.N))
			(!R5 (?X_P BOY.N))
			(!R6 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_M (?X_P (SHOOT.V ?X_N)))
			(?X_J (?X_N (HARD.ADV ((ADV-A (OFF.P ?X_K)) BOUNCE.V))))
			(?X_G (?X_N ((ADV-A (INTO.P ?X_H)) GO.V)))
			(?X_E (?X_O (AFTER.P ?X_N)))
			(?X_A (?X_O (((ADV-A (FROM.P ?L1)) ((ADV-A (AFTER.P ?X_N)) RUN.15.V)) ?L2)))
			(?X_C (?X_O (((ADV-A (IN.P ?X_H)) CATCH.V) ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_J)))
			(!W2 (?X_M (BEFORE ?X_G)))
			(!W3 (?X_M (BEFORE ?X_A)))
			(!W4 (?X_M (BEFORE ?X_C)))
			(!W5 (?X_J (BEFORE ?X_G)))
			(!W6 (?X_J (BEFORE ?X_A)))
			(!W7 (?X_J (BEFORE ?X_C)))
			(!W8 (?X_G (BEFORE ?X_A)))
			(!W9 (?X_G (BEFORE ?X_C)))
			(!W10 (?X_E (BEFORE ?X_A)))
			(!W11 (?X_E (BEFORE ?X_C)))
			(!W12 (?X_A (BEFORE ?X_C)))
		)
	)
	(
			"A boy shoots a basket."
			"A basket bounces hard off a rim."
			"A basket goes into a street."
			"A brother of a boy is after."
			"A brother of a boy run.29s L2 from L1 after a basket."
			"A brother of a boy catches a basket in a street."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.8.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B IPAD.N))
			(!R6 (?X_B NEW.A))
			(!R7 (?X_B NICE.A))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-160.PR ?X_D ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_D BOX.N))
			(!R2 (?X_D (VERY.ADV AMAZING.A)))
			(!R3 (?X_I NEW.A))
			(!R4 (?X_I IPAD.N))
			(!R5 (?X_I NICE.A))
			(!R6 (?X_J AGENT.N))
		)
		(:STEPS
			(?X_H (?X_J GET.8.V ?X_I))
			(?X_F (?X_A ?X_J (((ADV (VERY.ADV MUCH.A)) LIKE.V) ?X_I)))
			(?X_C (?X_J (SAVE.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_C)))
			(!W3 (?X_F (BEFORE ?X_C)))
		)
	)
	(
			"A agent get.49s a new ipad nice."
			"X_A likes a new ipad nice ADV very much."
			"A agent saves a box very amazing."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-161.PR
	               (KA (SEE.V (?X_B ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V))))))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (FROM.P ?L1)) (DOWN.ADV COME.6.V)) ?L2)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MONKEY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_C
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) COME.6.V)))
	    ?L2))
			(?X_C
	   (?X_A
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) COME.6.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_C (CONSEC ?X_B)))
			(!W7 (?X_B (AT-ABOUT ?X_D)))
			(!W8 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) CLIMB.3.V) ?X_B) ** ?X_D)
		(:ROLES
			(!R1 (?X_A MONKEY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B LOCATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B TREE.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?X_B)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?X_B))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?X_B)))
		)
		(:PARAPHRASES
			(?X_D
	   (?X_A
	    ((ADV-A (FOR.P ?X_B))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_B)) CLIMB.3.V)))
	    ?X_B))
			(?X_D
	   (?X_A
	    ((ADV-A (FOR.P ?X_B))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_B)) CLIMB.3.V)))))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (FROM.P ?L1)) (CAN.AUX CLIMB.4.V)) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MONKEY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B LOCATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B TREE.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?X_B)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?X_B))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?X_B)))
		)
		(:PARAPHRASES
			(?X_C
	   (?X_A
	    ((ADV-A (FOR.P ?X_B))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_B)) CLIMB.4.V)))
	    ?X_B))
			(?X_C
	   (?X_A
	    ((ADV-A (FOR.P ?X_B))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?X_B)) CLIMB.4.V)))))
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
	(EPI-SCHEMA ((?X_C EAT.9.V ?X_B) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MONKEY.N))
			(!R2 (?X_B FOOD.N))
			(!R3 (?X_B COCOANUT.N))
			(!R4 (?X_A GROUND.N))
			(!R5 (?X_B (TO.P ?X_A)))
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
			(!W1 (?P1 AFTER ?X_E))
			(!W2 (?I1 BEFORE ?X_E))
			(!W3 (?X_E CAUSE-OF ?P1))
			(!W4 (?X_D (CONSEC ?X_E)))
			(!W5 (?X_D (AT-ABOUT ?X_F)))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C EAT.10.V ?X_B) ** ?X_D)
		(:ROLES
			(!R1 (?X_C MONKEY.N))
			(!R2 (?X_B FOOD.N))
			(!R3 (?X_B COCOANUT.N))
			(!R4 (?X_B (TO.P ?X_A)))
			(!R5 (?X_A GROUND.N))
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
			(!W4 (?X_E (CONSEC ?X_D)))
			(!W5 (?X_D (AT-ABOUT ?X_F)))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_Q
	              (COMPOSITE-SCHEMA-162.PR (KA (L X (AND (X RUN.V) (X PLAY.V)))) ?L2
	               ?X_P ?X_R))
	             ** ?E)
		(:ROLES
			(!R1 (?X_R COCOANUT.N))
			(!R2 (?X_P TREE.N))
			(!R3 (?X_Q MONKEY.N))
			(!R4 (?X_S GROUND.N))
			(!R5 (?X_R (TO.P ?X_S)))
		)
		(:STEPS
			(?X_O (?X_Q (((ADV-A (FROM.P ?L1)) (CAN.AUX CLIMB.4.V)) ?X_P)))
			(?X_K (?X_Q ((ADV-A (FROM.P ?L1)) CLIMB.3.V) ?X_P))
			(?X_M (?X_Q (GET.V ?X_R)))
			(?X_I (?X_Q (DROP.V ?X_R)))
			(?X_G (?X_Q (((ADV-A (FROM.P ?L1)) (DOWN.ADV COME.6.V)) ?L2)))
			(?X_E (?X_Q EAT.9.V ?X_R))
			(?X_E (?X_Q EAT.10.V ?X_R))
			(?X_C (?X_Q (LIKE.V (KA (L X (AND (X RUN.V) (X PLAY.V)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_K)))
			(!W2 (?X_O (BEFORE ?X_M)))
			(!W3 (?X_O (BEFORE ?X_I)))
			(!W4 (?X_O (BEFORE ?X_G)))
			(!W5 (?X_O (BEFORE ?X_E)))
			(!W6 (?X_O (BEFORE ?X_C)))
			(!W7 (?X_K (BEFORE ?X_M)))
			(!W8 (?X_K (BEFORE ?X_I)))
			(!W9 (?X_K (BEFORE ?X_G)))
			(!W10 (?X_K (BEFORE ?X_E)))
			(!W11 (?X_K (BEFORE ?X_C)))
			(!W12 (?X_M (BEFORE ?X_I)))
			(!W13 (?X_M (BEFORE ?X_G)))
			(!W14 (?X_M (BEFORE ?X_E)))
			(!W15 (?X_M (BEFORE ?X_C)))
			(!W16 (?X_I (BEFORE ?X_G)))
			(!W17 (?X_I (BEFORE ?X_E)))
			(!W18 (?X_I (BEFORE ?X_C)))
			(!W19 (?X_G (BEFORE ?X_E)))
			(!W20 (?X_G (BEFORE ?X_C)))
			(!W21 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A monkey climb.74s a tree from L1 can."
			"A monkey climb.71s a tree from L1."
			"A monkey gets a cocoanut to a ground."
			"A monkey drops a cocoanut to a ground."
			"A monkey come.72s L2 from L1 down."
			"A monkey eat.76s a cocoanut to a ground."
			"A monkey eat.77s a cocoanut to a ground."
			"A monkey likes run playing."
	)
)



(
	(EPI-SCHEMA ((?X_A ((AWAY.ADV GET.3.V) ?O)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A FLY.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?O)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?O)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?O (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_B))
			(!W2 (?I1 PRECOND-OF ?X_B))
			(!W3 (?I2 PRECOND-OF ?X_B))
			(!W4 (?I3 PRECOND-OF ?X_B))
			(!W5 (?P1 POSTCOND-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B GET.2.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B SON.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C FLY.N))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
			(!R7 (?X_A MAN.N))
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
			(!W6 (?X_D (BEFORE ?X_E)))
			(!W7 (?X_F (SAME-TIME ?X_E)))
			(!W8 (?X_F (RIGHT-AFTER ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B GET.9.V ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_B SON.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C FLY.N))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
			(!R7 (?X_A MAN.N))
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
			(!W6 (?X_E (RIGHT-AFTER ?X_D)))
			(!W7 (?X_E (SAME-TIME ?X_G)))
			(!W8 (?X_F (BEFORE ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B GET.28.V (K SICK.A)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((K SICK.A) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K SICK.A))))
			(!R5 (?X_A MOTHER.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-163.PR ?X_I (K SICK.A))) ** ?E)
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
			(?X_B (?X_K GET.28.V (K SICK.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_D)))
			(!W2 (?X_H (BEFORE ?X_B)))
			(!W3 (?X_F (BEFORE ?X_B)))
			(!W4 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"X_K has a slight cold."
			"X_K goes."
			"X_K swims anyway."
			"X_K get.103s sick."
	)
)



(
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-164.PR ?X_H ?X_G ?X_I (K YOUNG.A) ?X_L ?X_P))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F AGENT.N))
			(!R2 (?X_H FRIEND.N))
			(!R3 (?X_H (PERTAIN-TO ?X_F)))
			(!R4 (?X_G (K YOUNG.A) SON.N))
			(!R5 (?X_G (PERTAIN-TO ?X_H)))
			(!R6 (?X_I CUTE.A))
			(!R7 (?X_I LITTLE.A))
			(!R8 (?X_I BOY.N))
			(!R9 (?X_L (PLUR TOY.N)))
			(!R10 (?X_O AGENT.N))
			(!R11 (?X_P GREAT.A))
			(!R12 (?X_P VISIT.N))
		)
		(:STEPS
			(?X_C (?X_H ((ADV-A (FOR.P (KA (VISIT.V ?X_F)))) COME.V)))
			(?X_E (?X_H (BRING.V ?X_G ?X_H)))
			(?X_A (?X_H (((ADV-A (WITH.P ?X_H)) BRING.V) ?X_G)))
			(?X_K ((K YOUNG.A) (BE.V ?X_I)))
			(?X_N (?X_O (((ADV-A (FOR.P (KA (PLAY.V WITH.P)))) GIVE.V) (K YOUNG.A) ?X_L)))
			(?X_R (?X_O (HAVE.V ?X_P)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_A)))
			(!W3 (?X_C (BEFORE ?X_K)))
			(!W4 (?X_C (BEFORE ?X_N)))
			(!W5 (?X_C (BEFORE ?X_R)))
			(!W6 (?X_E (BEFORE ?X_A)))
			(!W7 (?X_E (BEFORE ?X_K)))
			(!W8 (?X_E (BEFORE ?X_N)))
			(!W9 (?X_E (BEFORE ?X_R)))
			(!W10 (?X_A (BEFORE ?X_K)))
			(!W11 (?X_A (BEFORE ?X_N)))
			(!W12 (?X_A (BEFORE ?X_R)))
			(!W13 (?X_K (BEFORE ?X_N)))
			(!W14 (?X_K (BEFORE ?X_R)))
			(!W15 (?X_N (BEFORE ?X_R)))
		)
	)
	(
			"A friend of a agent comes for visiting a agent."
			"A friend of a agent brings a of a friend of X_F a friend of a agent."
			"A friend of a agent brings a of a friend of X_F with a friend of a agent."
			"Young is a cute little boy."
			"A agent gives young a toys for playing with."
			"A agent has a great visit."
	)
)



(
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-165.PR (KA (TRY.V ?X_C))
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
			"A new pizza place great opens up."
			"A agent decides trying a new pizza place great."
			"A agent gets for customizing a pizza of a agent."
			"A agent decides back go a next day."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-166.PR (K CHOCOLATE.N)
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
			"X_A loves chocolate."
			"X_A decides go eating then."
			"Chocolate tastes bad."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FROM.P ?L1)) ((ADV-A (AT.P ?X_A)) RUN.16.V)) ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B (PLUR HEN.N)))
			(!R6 (?X_A CAT.N))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.16.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) RUN.16.V)))))
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
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-167.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_C CAT.N))
			(!R2 (?X_D DOG.N))
			(!R3 (?X_D (PLUR HEN.N)))
		)
		(:STEPS
			(?X_B (?X_D (((ADV-A (FROM.P ?L1)) ((ADV-A (AT.P ?X_C)) RUN.16.V)) ?L2)))
		)
	)
	(
			"A dog hens run.150s L2 from L1 at a cat."
	)
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-168.PR ?X_K)) ** ?E)
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
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-169.PR ?X_N (KE ((K MONEY.N) (FOR.P ?X_N))) ?X_B
	               (K (PLUR CLOTHE.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_N BIRTHDAY.N))
			(!R2 (?X_O (PLUR FRIEND.N)))
			(!R3 (?X_P AGENT.N))
			(!R4 (?X_N (PERTAIN-TO ?X_P)))
			(!R5 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_G ((K MONEY.N) (FOR.P ?X_N)))
			(?X_D (?X_A (GET.V (KE ((K MONEY.N) (FOR.P ?X_N))))))
			(?X_I (?X_P (HAVE.V ?X_B)))
			(?X_K (?X_P (OUT.ADV ((ADV-A (WITH.P ?X_O)) GO.V))))
			(?X_E (?X_P (OUT.ADV ((ADV-A (WITH.P ?X_O)) GO.V))))
			(?X_M (?X_C (BUY.V (K (PLUR CLOTHE.N)))))
			(?X_R (?X_P (HOME.ADV GO.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_D)))
			(!W2 (?X_G (BEFORE ?X_I)))
			(!W3 (?X_G (BEFORE ?X_K)))
			(!W4 (?X_G (BEFORE ?X_E)))
			(!W5 (?X_G (BEFORE ?X_M)))
			(!W6 (?X_G (BEFORE ?X_R)))
			(!W7 (?X_D (BEFORE ?X_I)))
			(!W8 (?X_D (BEFORE ?X_K)))
			(!W9 (?X_D (BEFORE ?X_E)))
			(!W10 (?X_D (BEFORE ?X_M)))
			(!W11 (?X_D (BEFORE ?X_R)))
			(!W12 (?X_I (BEFORE ?X_K)))
			(!W13 (?X_I (BEFORE ?X_E)))
			(!W14 (?X_I (BEFORE ?X_M)))
			(!W15 (?X_I (BEFORE ?X_R)))
			(!W16 (?X_K (BEFORE ?X_E)))
			(!W17 (?X_K (BEFORE ?X_M)))
			(!W18 (?X_K (BEFORE ?X_R)))
			(!W19 (?X_E (BEFORE ?X_M)))
			(!W20 (?X_E (BEFORE ?X_R)))
			(!W21 (?X_M (BEFORE ?X_R)))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-170.PR (KA (FIND.V ?X_H)) ?X_K)) ** ?E)
		(:ROLES
			(!R1 (?X_H OWNER.N))
			(!R2 (?X_K WALLET.N))
		)
		(:STEPS
			(?X_C (?X_A WALK.V))
			(?X_E (?X_A ((SUDDENLY.ADV SEE.V) ?X_K)))
			(?X_G (?X_A ((UP.PRT PICK.V) ?X_K)))
			(?X_J (?X_A (TRY.V (KA (FIND.V ?X_H)))))
			(?X_M (?X_A (KEEP.V ?X_K)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_G)))
			(!W3 (?X_C (BEFORE ?X_J)))
			(!W4 (?X_C (BEFORE ?X_M)))
			(!W5 (?X_E (BEFORE ?X_G)))
			(!W6 (?X_E (BEFORE ?X_J)))
			(!W7 (?X_E (BEFORE ?X_M)))
			(!W8 (?X_G (BEFORE ?X_J)))
			(!W9 (?X_G (BEFORE ?X_M)))
			(!W10 (?X_J (BEFORE ?X_M)))
		)
	)
	(
			"X_A walks."
			"X_A sees a wallet suddenly."
			"X_A picks a wallet up."
			"X_A tries finding a owner."
			"X_A keeps a wallet."
	)
)



(
	(EPI-SCHEMA ((?X_C TAKE.19.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D {REF}.N))
			(!R6 (?X_D (OF.P ?X_A)))
			(!R7 (?X_A STUFF.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
			(!R9 (?X_B BACKPACK.N))
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
	(EPI-SCHEMA ((?X_A ((OFF.ADV TAKE.20.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B BACKPACK.N))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V ?X_B)))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V ?X_B))
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
	(EPI-SCHEMA ((?X_B GET.29.V (K (L X (AND (X HAIR.N) (X STUFF.N))))) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((K (L X (AND (X HAIR.N) (X STUFF.N)))) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K (L X (AND (X HAIR.N) (X STUFF.N)))))))
			(!R5 (?X_A HAIR.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V (THAT (?X_B (HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N)))))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((K (L X (AND (X HAIR.N) (X STUFF.N)))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_F)))
			(!W7 (?X_D (AFTER ?X_E)))
			(!W8 (?X_G (AT-ABOUT ?X_F)))
			(!W9 (?X_G (AFTER ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B GET.29.V (K (L X (AND (X HAIR.N) (X STUFF.N))))) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((K (L X (AND (X HAIR.N) (X STUFF.N)))) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K (L X (AND (X HAIR.N) (X STUFF.N)))))))
			(!R5 (?X_A HAIR.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V (THAT (?X_B (HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N)))))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((K (L X (AND (X HAIR.N) (X STUFF.N)))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
			(!W6 (?X_D (AT-ABOUT ?X_F)))
			(!W7 (?X_D (AFTER ?X_E)))
			(!W8 (?X_G (AT-ABOUT ?X_F)))
			(!W9 (?X_G (AFTER ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B GET.30.V (K (L X (AND (X HAIR.N) (X STUFF.N))))) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((K (L X (AND (X HAIR.N) (X STUFF.N)))) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K (L X (AND (X HAIR.N) (X STUFF.N)))))))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A HAIR.N))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V (THAT (?X_B (HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N)))))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((K (L X (AND (X HAIR.N) (X STUFF.N)))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?X_E))
			(!W2 (?I1 PRECOND-OF ?X_E))
			(!W3 (?I2 PRECOND-OF ?X_E))
			(!W4 (?I3 PRECOND-OF ?X_E))
			(!W5 (?P1 POSTCOND-OF ?X_E))
			(!W6 (?X_E (AFTER ?X_D)))
			(!W7 (?X_E (AT-ABOUT ?X_F)))
			(!W8 (?X_G (AT-ABOUT ?X_F)))
			(!W9 (?X_G (AFTER ?X_H)))
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
	              (COMPOSITE-SCHEMA-171.PR ?X_J
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
			(?X_G (?X_L GET.29.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
			(?X_E (?X_L GET.29.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
			(?X_E (?X_L GET.30.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_G)))
			(!W2 (?X_I (BEFORE ?X_E)))
			(!W3 (?X_B (BEFORE ?X_G)))
			(!W4 (?X_B (BEFORE ?X_E)))
			(!W5 (?X_C (BEFORE ?X_G)))
			(!W6 (?X_C (BEFORE ?X_E)))
		)
	)
	(
			"A hair of a agent is a mess."
			"A agent is there."
			"A agent is there."
			"A agent get.195s hair stuff."
			"A agent get.195s hair stuff."
			"A agent get.196s hair stuff."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-172.PR ?X_B ?X_J)) ** ?E)
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
	(EPI-SCHEMA ((?X_A
	              (((ADV-A (IN.P ?X_C)) ((ADV-A (IN.P ?X_C)) PUT.7.V)) ?X_B))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_C CONTAINER.N))
			(!R4 (NOT (?X_C AGENT.N)))
			(!R5 (?X_B SMALLER-THAN ?X_C))
			(!R6 (?X_B EGG.N))
			(!R7 (?X_C PAN.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (IN.P ?X_C))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B (IN.P ?X_C))))
		)
		(:POSTCONDS
			(?P1 (?X_B (IN.P ?X_C)))
		)
		(:PARAPHRASES
			(?X_D (?X_A ((ADV-A (INTO.P ?X_C)) PUT.7.V) ?X_B))
			(?X_D (?X_A ((ADV-A (INSIDE.P ?X_C)) PUT.7.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-173.PR (ANOTHER.D EGG.N) ?X_J)) ** ?E)
		(:ROLES
			(!R1 (?X_G PAN.N))
			(!R2 (?X_J EGG.N))
			(!R3 (?X_K MAN.N))
		)
		(:STEPS
			(?X_I (?X_K (CRACK.V ?X_J)))
			(?X_D (?X_K ((OUT.PRT THROW.V) ?X_J)))
			(?X_B (?X_K (CRACK.V (ANOTHER.D EGG.N))))
			(?X_F (?X_K (((ADV-A (IN.P ?X_G)) ((ADV-A (IN.P ?X_G)) PUT.7.V)) ?X_J)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_D)))
			(!W2 (?X_I (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A man cracks a egg."
			"A man throws a egg out."
			"A man cracks another egg."
	)
)



(
	(EPI-SCHEMA ((?X_D (((ADV-A (FROM.P ?L1)) ((ADV-A (OFF.P ?X_A)) GO.30.V)) ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A ROAD.N))
			(!R6 (?X_B CAR.N))
			(!R7 (?X_B (PERTAIN-TO ?X_D)))
			(!R8 (?X_C FRIEND.N))
			(!R9 (?X_C (PERTAIN-TO ?X_D)))
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
		(:PARAPHRASES
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.30.V)))
	    ?L2))
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.30.V)))))
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
	(EPI-SCHEMA ((?X_D (((ADV-A (FROM.P ?L1)) ((ADV-A (OFF.P ?X_A)) GO.31.V)) ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A ROAD.N))
			(!R6 (?X_B (PERTAIN-TO ?X_D)))
			(!R7 (?X_B FRIEND.N))
			(!R8 (?X_C CAR.N))
			(!R9 (?X_C (PERTAIN-TO ?X_D)))
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
		(:PARAPHRASES
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.31.V)))
	    ?L2))
			(?X_E
	   (?X_D
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.31.V)))))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-174.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_E ROAD.N))
			(!R2 (?X_J CAR.N))
			(!R3 (?X_H MALE.A))
			(!R4 (?X_H AGENT.N))
			(!R5 (?X_I FRIEND.N))
			(!R6 (?X_K AGENT.N))
			(!R7 (?X_I (PERTAIN-TO ?X_K)))
			(!R8 (?X_J (PERTAIN-TO ?X_K)))
		)
		(:STEPS
			(?X_B (?X_K (OUT.PRT ((ADV-A (WITH.P ?X_I)) HANG.V))))
			(?X_G
	   (?X_H ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_J))))))) PULL.V)))
			(?X_D (?X_K (((ADV-A (FROM.P ?L1)) ((ADV-A (OFF.P ?X_E)) GO.30.V)) ?L2)))
			(?X_D (?X_K (((ADV-A (FROM.P ?L1)) ((ADV-A (OFF.P ?X_E)) GO.31.V)) ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_G)))
			(!W2 (?X_B (BEFORE ?X_D)))
			(!W3 (?X_G (BEFORE ?X_D)))
		)
	)
	(
			"A agent hangs out with a friend of a agent."
			"A male agent pulls in front of."
			"A agent go.1s L2 from L1 off a road."
			"A agent go.3s L2 from L1 off a road."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              ((ADV-A (ON.P ?S))
	               ((ADV-A (IN.P ?S))
	                (MOSTLY.ADV ((ADV-A (AROUND.P ?X_A)) SIT.9.V)))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?S AGENT.N)))
			(!R3 (?S FURNITURE.N))
			(!R4 (?L LOCATION.N))
			(!R5 (?X_A HOUSE.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA REST.V))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L)))
			(?I2 (?S (AT.P ?L)))
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-175.PR (KA (MORE.ADV ACTIVE.A))
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
	     ((ADV-A (IN.P ?S)) (MOSTLY.ADV ((ADV-A (AROUND.P ?X_K)) SIT.9.V))))))
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
			"A agent sit.25s on S in S mostly around a house."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (((ADV-A (FROM.P ?L1))
	                (HOME.ADV ((ADV-A (BEFORE.P (K DARK.N))) COME.7.V)))
	               ?L2))
	             ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) COME.7.V)))
	    ?L2))
			(?X_B
	   (?X_A
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) COME.7.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_B (AT-ABOUT ?X_C)))
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
	              (((ADV-A (FROM.P ?L1)) (OFF.ADV ((ADV-A (ON.P ?X_A)) GO.32.V)))
	               ?L2))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A ADVENTURE.N))
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
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.32.V)))
	    ?L2))
			(?X_C
	   (?X_B
	    ((ADV-A (FOR.P ?L2)) ((ADV-A (FROM.P ?L1)) ((ADV-A (TO.P ?L2)) GO.32.V)))))
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-176.PR ?X_J ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_F ADVENTURE.N))
			(!R2 (?X_G AGENT.N))
			(!R3 (?X_J HOUSE.N))
			(!R4 (?X_N (K BEST.A) FRIEND.N))
			(!R5 (?X_O SON.N))
			(!R6 (?X_O (PERTAIN-TO ?X_M)))
			(!R7 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_L (?X_O ((ADV-A (OUTSIDE.P (KA PLAY.V))) BE.V)))
			(?X_I (?X_N (BY.P ?X_J)))
			(?X_A (?X_N ((ADV-A (BY.P ?X_J)) COME.V)))
			(?X_E
	   (?X_G (((ADV-A (FROM.P ?L1)) (OFF.ADV ((ADV-A (ON.P ?X_F)) GO.32.V))) ?L2)))
			(?X_C
	   (?X_G
	    (((ADV-A (FROM.P ?L1))
	      (HOME.ADV ((ADV-A (BEFORE.P (K DARK.N))) COME.7.V)))
	     ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_A)))
			(!W2 (?X_L (BEFORE ?X_E)))
			(!W3 (?X_L (BEFORE ?X_C)))
			(!W4 (?X_I (BEFORE ?X_A)))
			(!W5 (?X_I (BEFORE ?X_E)))
			(!W6 (?X_I (BEFORE ?X_C)))
			(!W7 (?X_A (BEFORE ?X_E)))
			(!W8 (?X_A (BEFORE ?X_C)))
			(!W9 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A son of X_M is outside playing."
			"A of a son of X_M is by."
			"A of a son of X_M comes by a house."
			"A agent go.29s L2 from L1 off on a adventure."
			"A agent come.28s L2 from L1 home before dark."
	)
)



(
	(EPI-SCHEMA ((?X_C (((ADV-A (FROM.P ?X_B)) (OVER.PRT COME.8.V)) ?L2)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C FRIEND.N))
			(!R2 (?X_B OUTSIDE.N))
			(!R3 (?L2 LOCATION.N))
			(!R4 (NOT (?X_B = ?L2)))
			(!R5 (?X_B LOUD.A))
			(!R6 (?X_B NOISE.N))
			(!R7 (?X_A SOURCE.N))
			(!R8 (?X_A (OF.P ?X_B)))
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
		(:PARAPHRASES
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?X_B)) ((ADV-A (TO.P ?L2)) COME.8.V)))
	    ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (FOR.P ?L2))
	     ((ADV-A (FROM.P ?X_B)) ((ADV-A (TO.P ?L2)) COME.8.V)))))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-177.PR ?X_M (K SCARED.A) ?X_F ?L2)) ** ?E)
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
			(?X_C (?X_F (((ADV-A (FROM.P ?X_M)) (OVER.PRT COME.8.V)) ?L2)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_H)))
			(!W2 (?X_K (BEFORE ?X_E)))
			(!W3 (?X_K (BEFORE ?X_C)))
			(!W4 (?X_H (BEFORE ?X_E)))
			(!W5 (?X_H (BEFORE ?X_C)))
			(!W6 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"X_A is a loud outside noise."
			"A woman feels scared."
			"A woman calls a friend."
			"A friend come.45s L2 from a loud outside noise over."
	)
)



(
	(EPI-SCHEMA ((?X_D (((ADV-A (IN.P (K TROUBLE.N))) GET.31.V) ?O)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?X_C PARK.N))
			(!R4 (NOT (?X_D = ?O)))
			(!R5 (?X_D LATE.A))
			(!R6 (?X_A (PERTAIN-TO ?X_D)))
			(!R7 (?X_A FRIEND.N))
			(!R8 (?X_B CURFEW.N))
			(!R9 (?X_B (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?O)))
			(?I2 (?X_D (AT.P ?X_C)))
			(?I3 (?O (AT.P ?X_C)))
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
	(EPI-SCHEMA ((?X_D (((ADV-A (IN.P (K TROUBLE.N))) GET.32.V) ?O)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?X_C PARK.N))
			(!R4 (NOT (?X_D = ?O)))
			(!R5 (?X_D LATE.A))
			(!R6 (?X_A CURFEW.N))
			(!R7 (?X_A (PERTAIN-TO ?X_D)))
			(!R8 (?X_B (PERTAIN-TO ?X_D)))
			(!R9 (?X_B FRIEND.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V ?O))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V ?O)))
			(?I2 (?X_D (AT.P ?X_C)))
			(?I3 (?O (AT.P ?X_C)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.33.V)
	              (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D))) LOCATION.N))
			(!R4 (NOT (?L1 = (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D))))))
			(!R5 (?X_B LATE.A))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
			(!R7 (?X_C FRIEND.N))
			(!R8 (?X_D PARK.N))
			(!R9 (?X_A (PERTAIN-TO ?X_B)))
			(!R10 (?X_A CURFEW.N))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V
	     (KA ((ADV-A (AT.P (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D)))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D))))))
		)
		(:PARAPHRASES
			(?X_E
	   (?X_B
	    ((ADV-A (FOR.P (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D)))))
	     ((ADV-A (FROM.P ?L1))
	      ((ADV-A (TO.P (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D))))) GO.33.V)))
	    (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D)))))
			(?X_E
	   (?X_B
	    ((ADV-A (FOR.P (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D)))))
	     ((ADV-A (FROM.P ?L1))
	      ((ADV-A (TO.P (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D))))) GO.33.V)))))
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-178.PR ?X_L ?X_M ?O
	               (K ((ADV-A (WITH.P ?X_L)) (TO.P ?X_I)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M CURFEW.N))
			(!R2 (?X_I PARK.N))
			(!R3 (?X_L FRIEND.N))
			(!R4 (?X_N LATE.A))
			(!R5 (?X_N AGENT.N))
			(!R6 (?X_L (PERTAIN-TO ?X_N)))
			(!R7 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_K (?X_N ((ADV-A (IN.P (K (L X (AND (X HIGH.A) (X SCHOOL.N)))))) BE.V)))
			(?X_H
	   (?X_N ((ADV-A (FROM.P ?L1)) GO.33.V)
	    (K ((ADV-A (WITH.P ?X_L)) (TO.P ?X_I)))))
			(?X_F (?X_N (LOSE.V ?X_L)))
			(?X_B (?X_N (FOR.P ?X_M)))
			(?X_D (?X_N (((ADV-A (IN.P (K TROUBLE.N))) GET.31.V) ?O)))
			(?X_D (?X_N (((ADV-A (IN.P (K TROUBLE.N))) GET.32.V) ?O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_H)))
			(!W2 (?X_K (BEFORE ?X_F)))
			(!W3 (?X_K (BEFORE ?X_B)))
			(!W4 (?X_K (BEFORE ?X_D)))
			(!W5 (?X_H (BEFORE ?X_F)))
			(!W6 (?X_H (BEFORE ?X_B)))
			(!W7 (?X_H (BEFORE ?X_D)))
			(!W8 (?X_F (BEFORE ?X_B)))
			(!W9 (?X_F (BEFORE ?X_D)))
			(!W10 (?X_B (BEFORE ?X_D)))
		)
	)
	(
			"A late agent is in high school."
			"A late agent go.67s with a friend of a late agent to a park from L1."
			"A late agent loses a friend of a late agent."
			"A late agent is for."
			"A late agent get.73s O in trouble."
			"A late agent get.74s O in trouble."
	)
)



(
	(EPI-SCHEMA ((?X_G COMPOSITE-SCHEMA-179.PR) ** ?E)
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
			"Last week has DURING a day beach great."
			"A agent goes."
			"A agent goes."
			"A agent jumps ADV right away in."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_Q (COMPOSITE-SCHEMA-180.PR ?X_S (SET-OF ?X_S ?X_T))) ** ?E)
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
			(?X_F (?X_Q ((CAN.AUX SEE.V) ?X_S)))
			(?X_H (?X_T (CAN.AUX SEE.V)))
			(?X_J (?X_S (CAN.AUX SEE.V)))
			(?X_L (?X_T ((CAN.AUX SEE.V) ?X_S)))
			(?X_N (?X_T RUN.V))
			(?X_P (?X_R RUN.V))
			(?X_V (?X_Q ((CAN.AUX SEE.V) (SET-OF ?X_S ?X_T))))
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
	(EPI-SCHEMA ((?X_B
	              (COMPOSITE-SCHEMA-181.PR (KA (CATCH.V ?X_D))
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
			"X_B wants catching a chick."
			"X_A is chicks near a hen."
			"X_B catches X_C never."
	)
)



(
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-182.PR (KE (?X_J (HAVE.V ?X_F))) ?X_J ?X_K))
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
			"A agent walks down a street."
			"A agent notices a guy has a watch."
			"A agent notices a guy has a watch."
			"A agent asks a guy a time."
	)
)



(
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-183.PR
	               (K (L X (AND (X LARGE.A) (X (PLUR BASKET.N)) (X (ON.P ?X_J)))))
	               (K (PLUR CLOTHE.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C RIVER.N))
			(!R2 (?X_K (DIP.V (K (PLUR CLOTHE.N)))))
			(!R3 (?X_K (((ADV-A (ON.P ?X_H)) LAY.V) (K (PLUR CLOTHE.N)))))
			(!R4 (?X_K (((ADV-A (WITH.P ?X_I)) POUND.V) (K (PLUR CLOTHE.N)))))
			(!R5 (?X_K AGENT.N))
			(!R6 (?X_J (PLUR HEAD.N)))
			(!R7 (?X_J (PERTAIN-TO ?X_K)))
		)
		(:STEPS
			(?X_E
	   ((THESE.D (PLUR WOMAN.N))
	    ((ADV-A (TO.P ?X_C))
	     ((ADV-A (FOR.P (KA (WASH.V (K (PLUR CLOTHE.N)))))) COME.V))))
			(?X_G
	   (?X_K
	    (BRING.V (K (PLUR CLOTHE.N))
	     (K (L X (AND (X LARGE.A) (X (PLUR BASKET.N)) (X (ON.P ?X_J))))))))
			(?X_B
	   (?X_K
	    (((ADV-A
	       (IN.P (K (L X (AND (X LARGE.A) (X (PLUR BASKET.N)) (X (ON.P ?X_J)))))))
	      BRING.V)
	     (K (PLUR CLOTHE.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_G)))
			(!W2 (?X_E (BEFORE ?X_B)))
			(!W3 (?X_G (BEFORE ?X_B)))
		)
	)
	(
			"These womans come to a river for washing clothes."
			"A dip clothes on X_H lay clothes with X_I pounding clothes agent brings clothes large basket on."
			"A dip clothes on X_H lay clothes with X_I pounding clothes agent brings clothes in large basket on."
	)
)



))
; got 422 schemas (239 protoschema matches, 183 stories)
