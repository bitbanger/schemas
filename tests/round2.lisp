(defparameter *LEARNED-SCHEMAS* '(
(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.1.V (KA (STOP.V WORK.V))) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (STOP.V WORK.V)) ACTION.N))
			(!R3 (?X_A TIRED.A))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA (STOP.V WORK.V)) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_B (?X_A (WANT.V (KA (STOP.V WORK.V)))))
			(?X_B (?X_A (LIKE.V (KA (STOP.V WORK.V)))))
			(?X_B (?X_A (LOVE.V (KA (STOP.V WORK.V)))))
			(?X_B (?X_A (ENJOY.V (KA (STOP.V WORK.V)))))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-1.PR (KA WORK.V) ?X_H (KA (STOP.V WORK.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H MAN.N))
			(!R2 (?X_I LOT.N))
			(!R3 (?X_I (OF.P (K MONEY.N))))
			(!R4 (?X_J AGENT.N))
			(!R5 (?X_J TIRED.A))
			(!R6 ((KA (STOP.V WORK.V)) ACTION.N))
		)
		(:STEPS
			(?X_A (?X_J (OF.P (KA WORK.V))))
			(?X_G (?X_J (((ADV-A (WITH.P ?X_I)) MEET.V) ?X_H)))
			(?X_E (?X_J (MARRY.V ?X_H)))
			(?X_C (MUST.AUX-S (?X_J (AGAIN.ADV (NEVER.ADV WORK.V)))))
			(E5.SK (?X_J ENJOY_ACTION.1.V (KA (STOP.V WORK.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_G)))
			(!W2 (?X_A (BEFORE ?X_E)))
			(!W3 (?X_A (BEFORE ?X_C)))
			(!W4 (?X_G (BEFORE ?X_E)))
			(!W5 (?X_G (BEFORE ?X_C)))
			(!W6 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A agent tired is of."
			"A agent tired meets a man with a lot of money."
			"A agent tired marries a man."
			"A agent tired works must again never."
			"A agent tired enjoy action.6s stopping work."
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
	(EPI-SCHEMA (((K SUSIE.N)
	              (((ADV-A (FOR.P (K PERMISSION.N))) INFORM.1.V) ?X_A ?I))
	             ** ?X_B)
		(:ROLES
			(!R1 ((K SUSIE.N) AGENT.N))
			(!R2 (?X_A GIRL.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
		)
		(:GOALS
			(?G1 ((K SUSIE.N) (WANT.V (THAT (?X_A (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_A (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_B ((K SUSIE.N) TELL.V ?X_A ?I))
			(?X_B ((K SUSIE.N) LET.V ?X_A (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (AT-ABOUT ?X_D)))
			(!W2 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A INFORM.2.V ?X_B ?I) ** ?X_C)
		(:ROLES
			(!R1 (?X_A GIRL.N))
			(!R2 (?X_B AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_C (?X_A TELL.V ?X_B ?I))
			(?X_C (?X_A LET.V ?X_B (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
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
			(!W1 (?X_B (BEFORE ?X_D)))
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
	(EPI-SCHEMA (((K SUSIE.N)
	              (COMPOSITE-SCHEMA-3.PR (KE (?X_Q (PLAY.V (K BALL.N))))
	               (KA ((ADV-A (WITH.P ?X_L)) PLAY.V)) ?X_Q ?X_R ?I))
	             ** ?E)
		(:ROLES
			(!R1 (?X_L (PERTAIN-TO (K SUSIE.N))))
			(!R2 ((K SUSIE.N) AGENT.N))
			(!R3 (?X_Q GIRL.N))
			(!R4 (?X_R AGENT.N))
			(!R5 (NOT (?I ACTION.N)))
			(!R6 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_K ((K SUSIE.N) (WANT.V (KA ((ADV-A (WITH.P ?X_L)) PLAY.V)))))
			(?X_P (?X_Q PLAY.1.V))
			(?X_N ((K SUSIE.N) (SAY.V (KE (?X_Q (PLAY.V (K BALL.N)))))))
			(?X_A ((K SUSIE.N) (WANT.V (KA ((ADV-A (WITH.P ?X_L)) PLAY.V)))))
			(?X_I ((K SUSIE.N) (AHEAD.ADV GO.V)))
			(?X_G ((K SUSIE.N) (((ADV-A (FOR.P (K PERMISSION.N))) INFORM.1.V) ?X_Q ?I)))
			(?X_E (?X_Q INFORM.2.V ?X_R ?I))
			(?X_C ((K SUSIE.N) (THEN.ADV ((ADV-A (FOR.P (KA CRY.V))) START.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_A)))
			(!W2 (?X_K (BEFORE ?X_I)))
			(!W3 (?X_K (BEFORE ?X_G)))
			(!W4 (?X_K (BEFORE ?X_E)))
			(!W5 (?X_K (BEFORE ?X_C)))
			(!W6 (?X_P (BEFORE ?X_A)))
			(!W7 (?X_P (BEFORE ?X_I)))
			(!W8 (?X_P (BEFORE ?X_G)))
			(!W9 (?X_P (BEFORE ?X_E)))
			(!W10 (?X_P (BEFORE ?X_C)))
			(!W11 (?X_N (BEFORE ?X_A)))
			(!W12 (?X_N (BEFORE ?X_I)))
			(!W13 (?X_N (BEFORE ?X_G)))
			(!W14 (?X_N (BEFORE ?X_E)))
			(!W15 (?X_N (BEFORE ?X_C)))
			(!W16 (?X_A (BEFORE ?X_I)))
			(!W17 (?X_A (BEFORE ?X_G)))
			(!W18 (?X_A (BEFORE ?X_E)))
			(!W19 (?X_A (BEFORE ?X_C)))
			(!W20 (?X_I (BEFORE ?X_E)))
			(!W21 (?X_I (BEFORE ?X_C)))
			(!W22 (?X_G (BEFORE ?X_E)))
			(!W23 (?X_G (BEFORE ?X_C)))
			(!W24 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"Susie wants with a of susie playing."
			"A girl play.15s."
			"Susie says a girl plays ball."
			"Susie wants with a of susie playing."
			"Susie goes ahead."
			"Susie inform.17s a girl a information for permission."
			"A girl inform.18s a agent a information."
			"Susie starts then for crying."
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 ((K (L X (AND (X FATHER.N) (X |'S|)))) (PERTAIN-TO ?X_B)))
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
		(:PARAPHRASES
			(?X_D
	   (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) GO.1.V))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.1.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.1.V) ?X_C))
			(?X_D (?X_B GO.1.V))
			(?X_D (?X_B GO.1.V ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? GO.1.V)))
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.2.V
	              (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)) ACTION.N))
			(!R3 ((K (L X (AND (X FATHER.N) (X |'S|)))) (PERTAIN-TO ?X_A)))
			(!R4 (?X_C NEW.A))
			(!R5 (?X_C NICE.A))
			(!R6 (?X_C GRILL.N))
		)
		(:PRECONDS
			(?I1
	   (?X_A
	    (THINK.V
	     (THAT ((KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_D (?X_A (WANT.V (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)))))
			(?X_D (?X_A (LIKE.V (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)))))
			(?X_D (?X_A (LOVE.V (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)))))
			(?X_D
	   (?X_A (ENJOY.V (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_E)))
			(!W2 (?X_F (SAME-TIME ?X_E)))
			(!W3 (?X_F (RIGHT-AFTER ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-5.PR
	               (KE ((K (L X (AND (X FATHER.N) (X |'S|)))) DAY.N))
	               (KE (?X_N NEW.A GRILL.N)) ?X_M
	               (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_K))))
	             ** ?E)
		(:ROLES
			(!R1 ((KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_K)) ACTION.N))
			(!R2 (?X_K NEW.A))
			(!R3 (?X_K NICE.A))
			(!R4 (?X_K GRILL.N))
			(!R5 ((K (L X (AND (X FATHER.N) (X |'S|)))) (PERTAIN-TO ?X_N)))
			(!R6 (?X_M DESTINATION.N))
			(!R7 (?X_M STORE.N))
			(!R8 (?X_N AGENT.N))
		)
		(:STEPS
			(?X_J
	   ((K TOMORROW.N) (BE.V (KE ((K (L X (AND (X FATHER.N) (X |'S|)))) DAY.N)))))
			(?X_D (?X_N ?X_K GRILL.N))
			(?X_H
	   (?X_N ENJOY_ACTION.2.V
	    (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_K))))
			(?X_A (?X_N (WANT.V (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_K)))))
			(?X_F (?X_N ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_M))
			(?X_B
	   ((K (L X (AND (X FATHER.N) (X |'S|)))) (LOVE.V (KE (?X_N NEW.A GRILL.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_A)))
			(!W2 (?X_J (BEFORE ?X_F)))
			(!W3 (?X_J (BEFORE ?X_B)))
			(!W4 (?X_D (BEFORE ?X_B)))
			(!W5 (?X_H (BEFORE ?X_A)))
			(!W6 (?X_H (BEFORE ?X_F)))
			(!W7 (?X_H (BEFORE ?X_B)))
			(!W8 (?X_A (BEFORE ?X_F)))
			(!W9 (?X_A (BEFORE ?X_B)))
			(!W10 (?X_F (BEFORE ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A (GIVE.1.V ?X_B ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_A WOMAN.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_B MAN.N))
			(!R4 (?X_C NUMBER.N))
			(!R5 (?X_C (PERTAIN-TO ?X_A)))
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
		(:PARAPHRASES
			(?X_D (?X_A ((ADV-A (TO.P ?X_B)) (GIVE.1.V ?X_C))))
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
	(EPI-SCHEMA ((?X_A (GIVE.2.V ?X_B ?X_C)) ** ?X_E)
		(:ROLES
			(!R1 (?X_A WOMAN.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_B MAN.N))
			(!R4 (?X_C NUMBER.N))
			(!R5 (?X_C (PERTAIN-TO ?X_A)))
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
		(:PARAPHRASES
			(?X_E (?X_A ((ADV-A (TO.P ?X_B)) (GIVE.2.V ?X_C))))
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
	(EPI-SCHEMA ((?X_Q
	              (COMPOSITE-SCHEMA-6.PR (K (L X (AND (X GOOD.A) (X (TO.P ?X_Q)))))
	               ?X_P ?X_R))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I WAY.N))
			(!R2 (?X_I HOME.N))
			(!R3 (?X_P MAN.N))
			(!R4 (?X_R NUMBER.N))
			(!R5 (?X_R (PERTAIN-TO ?X_Q)))
			(!R6 (?X_Q WOMAN.N))
			(!R7 (NOT (?X_R AGENT.N)))
		)
		(:STEPS
			(?X_O (?X_Q (KISS.V ?X_P)))
			(?X_M (?X_A (FEEL.V (K (L X (AND (X GOOD.A) (X (TO.P ?X_Q))))))))
			(?X_K (?X_Q (GIVE.1.V ?X_P ?X_R)))
			(?X_D (?X_Q (GIVE.2.V ?X_P ?X_R)))
			(?X_H (?X_P (((ADV-A (ON.P ?X_I)) LOSE.V) ?X_R)))
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
			"A woman give.71s a man a number of a woman."
			"A woman give.74s a man a number of a woman."
			"A man loses a number of a woman on a way home."
			"X_C meets again."
	)
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-7.PR (K DIZZY.A) (K SICK.A))) ** ?E)
		(:ROLES
			(!R1 (?X_A COUPLE.N))
			(!R2 (?X_J WOMAN.N))
			(!R3 (?X_K MAN.N))
		)
		(:STEPS
			(?X_C (?X_A (OUT.PRT WORK.V)))
			(?X_E (?X_J (FEEL.V (K DIZZY.A))))
			(?X_G (?X_K (DOWN.ADV ((ADV-A (WITH.P ?X_J)) SIT.V))))
			(?X_I (?X_J (FEEL.V (K SICK.A))))
			(?X_M (?X_J (UP.PRT ((ADV-A (ON.P ?X_K)) THROW.V))))
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
			"A couple works out."
			"A woman feels dizzy."
			"A man sits down with a woman."
			"A woman feels sick."
			"A woman throws up on a man."
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.3.V (KA ((ADV-A (IN.P ?X_B)) PLAY.V))) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA ((ADV-A (IN.P ?X_B)) PLAY.V)) ACTION.N))
			(!R3 (?X_B SNOW.N))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA ((ADV-A (IN.P ?X_B)) PLAY.V)) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_C (?X_A (WANT.V (KA ((ADV-A (IN.P ?X_B)) PLAY.V)))))
			(?X_C (?X_A (LIKE.V (KA ((ADV-A (IN.P ?X_B)) PLAY.V)))))
			(?X_C (?X_A (LOVE.V (KA ((ADV-A (IN.P ?X_B)) PLAY.V)))))
			(?X_C (?X_A (ENJOY.V (KA ((ADV-A (IN.P ?X_B)) PLAY.V)))))
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.4.V ?Y ?A) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?Y AGENT.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_A SNOW.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V ?Y ?A)))
			(?G2 (?X_B (WANT.V (THAT (?X_B (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_B (ASK.V ?Y ?A)))
			(?E2 (?Y (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_C (?X_B (ASK.V ?Y ?A)))
			(?X_C (?X_B (TELL.V ?Y ?A)))
			(?X_C (?X_B (((ADV-A (IN.P ?X_A)) MAKE.V) ?Y ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
	(EPI-SCHEMA ((?X_B PLAY.2.V) ** ?X_C)
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
			(?X_C (?X_B ((ADV-A (WITH.P ?T)) PLAY.2.V)))
			(?X_C (?X_B PLAY.2.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (IN.P ?X_A)) PLAY.3.V)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_B TOY.N))
			(!R3 (NOT (?X_B AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A SNOW.N))
			(!R7 (?X_B SNOWMAN.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?X_B))
		)
		(:POSTCONDS
			(?P1 (?X_C EXPERIENCE.V (K PLEASURE.N)))
		)
		(:PARAPHRASES
			(?X_D (?X_C ((ADV-A (WITH.P ?X_B)) PLAY.3.V)))
			(?X_D (?X_C PLAY.3.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_B (((ADV-A (IN.P ?X_A)) PLAY.4.V) ?O)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_J
	              (COMPOSITE-SCHEMA-8.PR (KA ((ADV-A (IN.P ?X_I)) PLAY.V)) ?Y ?A ?O
	               ?X_K))
	             ** ?E)
		(:ROLES
			(!R1 ((KA ((ADV-A (IN.P ?X_I)) PLAY.V)) ACTION.N))
			(!R2 (?A ACTION.N))
			(!R3 (?Y AGENT.N))
			(!R4 (?X_I SNOW.N))
			(!R5 (NOT (?O AGENT.N)))
			(!R6 (?X_J AGENT.N))
			(!R7 (?X_K SNOWMAN.N))
			(!R8 (NOT (?X_K AGENT.N)))
		)
		(:STEPS
			(?X_H (?X_J ENJOY_ACTION.3.V (KA ((ADV-A (IN.P ?X_I)) PLAY.V))))
			(?X_F (?X_J (OUTSIDE.ADV GO.V)))
			(?X_D (?X_J REQUEST_ACTION.4.V ?Y ?A))
			(?X_D (?X_J ((ADV-A (IN.P ?X_I)) PLAY.3.V)))
			(?X_D (?X_J (((ADV-A (IN.P ?X_I)) PLAY.4.V) ?O)))
			(?X_B (?X_J PLAY.2.V))
			(?X_B (?X_J MAKE.1.V ?X_K))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_D)))
			(!W3 (?X_H (BEFORE ?X_B)))
			(!W4 (?X_F (BEFORE ?X_D)))
			(!W5 (?X_F (BEFORE ?X_B)))
			(!W6 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent enjoy action.91s in a snow playing."
			"A agent goes outside."
			"A agent request action.86s a agent a action."
			"A agent play.88s in a snow."
			"A agent play.90s O in a snow."
			"A agent play.87s."
			"A agent make.89s a snowman."
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) WALK.1.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) WALK.1.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) WALK.1.V) ?L2))
			(?X_C (?X_B ((ADV-A (THROUGH.P ?X_A)) WALK.1.V)))
			(?X_C (?X_B WALK.1.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? WALK.1.V)))
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.5.V ?X_C ?A) ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_C FOX.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_B (PLUR WOOD.N)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V ?X_C ?A)))
			(?G2 (?X_A (WANT.V (THAT (?X_A (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_A (((ADV-A (THROUGH.P ?X_B)) ASK.V) ?X_C ?A)))
			(?E2 (?X_C (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_D (?X_A (((ADV-A (THROUGH.P ?X_B)) ASK.V) ?X_C ?A)))
			(?X_D (?X_A (TELL.V ?X_C ?A)))
			(?X_D (?X_A (MAKE.V ?X_C ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.6.V ?X_B ?A) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?A ACTION.N))
			(!R3 (?X_A (PLUR WOOD.N)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V ?X_B ?A)))
			(?G2 (?X_B (WANT.V (THAT (?X_B (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_B (((ADV-A (THROUGH.P ?X_A)) ASK.V) ?X_B ?A)))
			(?E2 (?X_B (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_C (?X_B (((ADV-A (THROUGH.P ?X_A)) ASK.V) ?X_B ?A)))
			(?X_C (?X_B (TELL.V ?X_B ?A)))
			(?X_C (?X_B (MAKE.V ?X_B ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-10.PR ?X_N (K CLOSER.A) ?L2 ?X_L ?X_M ?A ?X_O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K (PLUR WOOD.N)))
			(!R2 (?L2 DESTINATION.N))
			(!R3 (?X_L FOX.N))
			(!R4 (?X_M AGENT.N))
			(!R5 (?A ACTION.N))
			(!R6 (?X_N ANIMAL.N))
			(!R7 (?X_O FUNNY.A))
			(!R8 (?X_O SOUND.N))
			(!R9 (NOT (?X_O AGENT.N)))
		)
		(:STEPS
			(?X_J (?X_M ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
			(?X_J (?X_M REQUEST_ACTION.5.V ?X_L ?A))
			(?X_J (?X_M REQUEST_ACTION.6.V ?X_M ?A))
			(?X_H (?X_M (HEAR.V ?X_N)))
			(?X_F (?X_N MAKE.2.V ?X_O))
			(?X_D (?X_M (GET.V (K CLOSER.A))))
			(?X_B (?X_N (OUT.PRT ((ADV-A (FOR.P (KA (BE.V ?X_L)))) TURN.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_F)))
			(!W3 (?X_J (BEFORE ?X_D)))
			(!W4 (?X_J (BEFORE ?X_B)))
			(!W5 (?X_H (BEFORE ?X_F)))
			(!W6 (?X_H (BEFORE ?X_D)))
			(!W7 (?X_H (BEFORE ?X_B)))
			(!W8 (?X_F (BEFORE ?X_D)))
			(!W9 (?X_F (BEFORE ?X_B)))
			(!W10 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent walk.109s a destination from L1."
			"A agent request action.114s a fox a action."
			"A agent request action.115s a agent a action."
			"A agent hears a animal."
			"A animal make.110s a funny sound."
			"A agent gets closer."
			"A animal turns out for being a fox."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.2.V) (K (PLUR CV.N))) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (PLUR CV.N)) DESTINATION.N))
			(!R4 (NOT (?L1 = (K (PLUR CV.N)))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P (K (PLUR CV.N)))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (K (PLUR CV.N))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (K (PLUR CV.N)))))
		)
		(:PARAPHRASES
			(?X_B
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_A
	     ((ADV-A (DESTINATION_PREP.? (K (PLUR CV.N))))
	      ((ADV-A (TO.P (K (PLUR CV.N)))) GO.2.V)))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K (PLUR CV.N)))) GO.2.V))))
			(?X_B
	   (?X_A ((ADV-A (DESTINATION_PREP.? (K (PLUR CV.N)))) GO.2.V)
	    (K (PLUR CV.N))))
			(?X_B (?X_A GO.2.V))
			(?X_B (?X_A GO.2.V (K (PLUR CV.N))))
			(?X_B (?X_A (LOCATION_ADV.? GO.2.V)))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E (COMPOSITE-SCHEMA-11.PR (K (PLUR CV.N)) ?X_F)) ** ?E)
		(:ROLES
			(!R1 ((K (PLUR CV.N)) DESTINATION.N))
			(!R2 (?X_F CANDY.N))
			(!R3 (?X_E AGENT.N))
			(!R4 (NOT (?X_F AGENT.N)))
			(!R5 (NOT (?X_E = ?X_F)))
		)
		(:STEPS
			(?X_D (?X_E ((ADV-A (FROM.P ?L1)) GO.2.V) (K (PLUR CV.N))))
			(?X_B (?X_E GET.1.V ?X_F))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent go.128s cvs from L1."
			"A agent get.127s a candy."
	)
)



(
	(EPI-SCHEMA ((MUST.AUX-S (?X_A (GET.2.V (ANOTHER.D ONE.N)))) ** ?X_B)
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
			(!W1 (?I1 PRECOND-OF ?X_B))
			(!W2 (?I2 PRECOND-OF ?X_B))
			(!W3 (?I3 PRECOND-OF ?X_B))
			(!W4 (?P1 POSTCOND-OF ?X_B))
			(!W5 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((JUST.ADV GET.3.V) ?X_B)) ** ?X_C)
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-12.PR (ANOTHER.D ONE.N) ?X_F)) ** ?E)
		(:ROLES
			(!R1 (?X_F RING.N))
			(!R2 (?X_F NEW.A))
			(!R3 (NOT (?X_F AGENT.N)))
			(!R4 (NOT (?X_G = ?X_F)))
			(!R5 (?X_G AGENT.N))
			(!R6 (?X_G HAPPY.A))
			(!R7 (NOT ((ANOTHER.D ONE.N) AGENT.N)))
			(!R8 (NOT (?X_G = (ANOTHER.D ONE.N))))
		)
		(:STEPS
			(?X_E (?X_G ((JUST.ADV GET.3.V) ?X_F)))
			(?X_A (?X_G (ABOUT.P ?X_F)))
			(?X_C (MUST.AUX-S (?X_G (GET.2.V (ANOTHER.D ONE.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_A)))
			(!W2 (?X_E (BEFORE ?X_C)))
			(!W3 (?X_A (BEFORE ?X_C)))
		)
	)
	(
			"A agent happy get.133s a ring new just."
			"A agent happy is about."
			"A agent happy get.132s another one must."
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?L1)) RUN.1.V) ?L2) ** ?X_E)
		(:ROLES
			(!R1 (?X_D BOY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C MAN.N))
			(!R6 (?X_A (PERTAIN-TO ?X_D)))
			(!R7 (?X_A MOM.N))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
			(!R9 (?X_B MALE.A))
			(!R10 (?X_B AGENT.N))
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.1.V)))
			(?X_E
	   (?X_D ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.1.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.1.V) ?L2))
			(?X_E (?X_D ((ADV-A (INTO.P ?X_C)) RUN.1.V)))
			(?X_E (?X_D RUN.1.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? RUN.1.V)))
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
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.1.V ?X_C) ** ?X_F)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?X_C BOY.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_D DESTINATION.N))
			(!R6 (?X_D (PERTAIN-TO ?X_C)))
			(!R7 (?X_D MOM.N))
			(!R8 (?X_D (PERTAIN-TO ?X_A)))
			(!R9 (?X_A MALE.A))
			(!R10 (?X_A AGENT.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C ((ADV-A (AT.P ?X_D)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_C ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C ((ADV-A (AT.P ?X_D)) BE.V)))
		)
		(:PARAPHRASES
			(?X_F (?X_B ((ADV-A (TO.P ?X_D)) TAKE.V) ?X_C))
			(?X_F (?X_B ((ADV-A (TO.P ?X_D)) CARRY.V) ?X_C))
			(?X_F (?X_B (((ADV-A (TO.P ?X_D)) BRING.V) ?X_C)))
			(?X_F (?X_B (LOCATION_ADV.? TAKE.V) ?X_C))
			(?X_F (?X_B (LOCATION_ADV.? CARRY.V) ?X_C))
			(?X_F (?X_B (LOCATION_ADV.? BRING.V) ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_F))
			(!W2 (?P1 POSTCOND-OF ?X_F))
			(!W3 (?X_F (RIGHT-AFTER ?X_E)))
			(!W4 (?X_F (SAME-TIME ?X_H)))
			(!W5 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C GET.4.V (K LOST.A)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C BOY.N))
			(!R2 (NOT ((K LOST.A) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = (K LOST.A))))
			(!R5 (?X_A MOM.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_B MALE.A))
			(!R9 (?X_B AGENT.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V (K LOST.A)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V (K LOST.A))))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 ((K LOST.A) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V (K LOST.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-13.PR ?X_K ?L2 ?X_N (K LOST.A))) ** ?E)
		(:ROLES
			(!R1 (?X_K MOM.N))
			(!R2 (?X_K (PERTAIN-TO ?X_N)))
			(!R3 (?X_L MALE.A))
			(!R4 (?X_L AGENT.N))
			(!R5 (?X_K (PERTAIN-TO ?X_L)))
			(!R6 (NOT ((K LOST.A) AGENT.N)))
			(!R7 (NOT (?X_N = (K LOST.A))))
			(!R8 (?L2 DESTINATION.N))
			(!R9 (?X_M MAN.N))
			(!R10 (?X_N SMALLER-THAN.N ?X_M))
			(!R11 (?X_N BOY.N))
		)
		(:STEPS
			(?X_H (?X_N (TO.P ?X_K)))
			(?X_D (?X_M ?X_N (TO.P ?X_K)))
			(?X_J (?X_N GET.4.V (K LOST.A)))
			(?X_A (?X_N ((ADV-A (TO.P ?X_K)) CALL.V)))
			(?X_F (?X_N ((ADV-A (FROM.P ?L1)) RUN.1.V) ?L2))
			(?X_B (?X_M TRANSPORT_OBJECT.1.V ?X_N))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_A)))
			(!W2 (?X_H (BEFORE ?X_F)))
			(!W3 (?X_H (BEFORE ?X_B)))
			(!W4 (?X_D (BEFORE ?X_B)))
			(!W5 (?X_J (BEFORE ?X_A)))
			(!W6 (?X_J (BEFORE ?X_F)))
			(!W7 (?X_J (BEFORE ?X_B)))
			(!W8 (?X_A (BEFORE ?X_F)))
			(!W9 (?X_A (BEFORE ?X_B)))
			(!W10 (?X_F (BEFORE ?X_B)))
		)
	)
	(
			"A boy is to."
			"A man is to."
			"A boy get.143s lost."
			"A boy calls to a mom of a boy of a male agent."
			"A boy run.145s a destination from L1."
			"A man transport object.141s a boy."
	)
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-14.PR (K (SO.ADV SAD.A)) ?X_J)) ** ?E)
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
;	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.2.V ?X_B) ** ?X_D)
;		(:ROLES
;			(!R1 (?X_A AGENT.N))
;			(!R2 (?X_B DAY.N))
;			(!R3 (?X_B SMALLER-THAN.N ?X_A))
;			(!R4 (?L1 LOCATION.N))
;			(!R5 ((KA ((ADV-A (TO.P ?X_C)) SKIP.V)) DESTINATION.N))
;			(!R6 (?X_C VET.N))
;			(!R7 (?X_B SKIP.V))
;		)
;		(:GOALS
;			(?G1
;	   (?X_A
;	    (WANT.V
;	     (THAT (?X_B ((ADV-A (AT.P (KA ((ADV-A (TO.P ?X_C)) SKIP.V)))) BE.V))))))
;		)
;		(:PRECONDS
;			(?I1 (?X_B ((ADV-A (AT.P ?L1)) BE.V)))
;		)
;		(:POSTCONDS
;			(?P1 (?X_B ((ADV-A (AT.P (KA ((ADV-A (TO.P ?X_C)) SKIP.V)))) BE.V)))
;		)
;		(:PARAPHRASES
;			(?X_D
;	   (?X_A
;	    (((ADV-A (TO.P (KA ((ADV-A (TO.P ?X_C)) SKIP.V))))
;	      ((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_C)) SKIP.V)))) TAKE.V))
;	     ?X_B)))
;			(?X_D (?X_A ((ADV-A (TO.P (KA ((ADV-A (TO.P ?X_C)) SKIP.V)))) CARRY.V) ?X_B))
;			(?X_D (?X_A ((ADV-A (TO.P (KA ((ADV-A (TO.P ?X_C)) SKIP.V)))) BRING.V) ?X_B))
;			(?X_D (?X_A (LOCATION_ADV.? TAKE.V) ?X_B))
;			(?X_D (?X_A (LOCATION_ADV.? CARRY.V) ?X_B))
;			(?X_D (?X_A (LOCATION_ADV.? BRING.V) ?X_B))
;		)
;		(:EPISODE-RELATIONS
;			(!W1 (?I1 PRECOND-OF ?X_D))
;			(!W2 (?P1 POSTCOND-OF ?X_D))
;			(!W3 (?X_D (AT-ABOUT ?X_E)))
;		)
;		(:NECESSITIES
;			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
;		)
;	)
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.2.V ?X_C ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C DOG.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_D DESTINATION.N))
			(!R6 (?X_C (VERY.ADV OLD.A)))
			(!R7 (?X_D VET.N))
			(!R8 (?X_C (PERTAIN-TO ?X_B)))
			(!R9 (?X_A TIME.N))
			(!R10 (?X_A (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C ((ADV-A (AT.P ?X_D)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_C ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C ((ADV-A (AT.P ?X_D)) BE.V)))
		)
		(:PARAPHRASES
			(?X_E (?X_B (((ADV-A (TO.P ?X_D)) TAKE.V) ?X_C)))
			(?X_E (?X_B ((ADV-A (TO.P ?X_D)) CARRY.V) ?X_C))
			(?X_E (?X_B ((ADV-A (TO.P ?X_D)) BRING.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? TAKE.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? CARRY.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? BRING.V) ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?P1 POSTCOND-OF ?X_E))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-15.PR (K SICK.A) ?X_E ?O)) ** ?E)
		(:ROLES
			(!R1 (?X_E SMALLER-THAN.N ?X_G))
			(!R2 (?X_E SKIP.V))
			(!R3 (?X_E DAY.N))
			(!R4 (?X_G AGENT.N))
			(!R5 (?X_F VET.N))
			(!R6 (NOT (?O AGENT.N)))
			(!R7 (NOT (?X_G = ?O)))
		)
		(:STEPS
			(?X_D (?X_E (GET.V (K SICK.A))))
			(?X_B (?X_G TRANSPORT_OBJECT.2.V ?X_E))
			(?X_B
	   (?X_G (((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_F)) SKIP.V)))) TAKE.1.V) ?O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D BEFORE ?X_B))
		)
	)
	(
			"A skip day gets sick."
			"A agent transport object.194s a skip day."
			"A agent take.196s O for to a vet skipping."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) RUN.2.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A KITTEN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.2.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.2.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.2.V) ?L2))
			(?X_B (?X_A (AWAY.PRT ((ADV-A (WITHIN.P (K (PLUR DAY.N)))) RUN.2.V))))
			(?X_B (?X_A RUN.2.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? RUN.2.V)))
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
	(EPI-SCHEMA ((?X_A GET.5.V (ANOTHER.D CAT.N)) ** ?X_B)
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
			(!W1 (?I1 PRECOND-OF ?X_B))
			(!W2 (?I2 PRECOND-OF ?X_B))
			(!W3 (?I3 PRECOND-OF ?X_B))
			(!W4 (?P1 POSTCOND-OF ?X_B))
			(!W5 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A GET.6.V ?X_B) ** ?X_C)
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-16.PR ?L2 (ANOTHER.D CAT.N) ?X_I)) ** ?E)
		(:ROLES
			(!R1 (NOT (?X_J = ?X_I)))
			(!R2 (?X_I KITTEN.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (?X_J AGENT.N))
			(!R5 (NOT ((ANOTHER.D CAT.N) AGENT.N)))
			(!R6 (NOT (?X_J = (ANOTHER.D CAT.N))))
		)
		(:STEPS
			(?X_H (?X_J GET.6.V ?X_I))
			(?X_F (?X_I ((ADV-A (FROM.P ?L1)) RUN.2.V) ?L2))
			(?X_D (?X_J ((NEVER.ADV FIND.V) ?X_I)))
			(?X_B (?X_J GET.5.V (ANOTHER.D CAT.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_D)))
			(!W3 (?X_H (BEFORE ?X_B)))
			(!W4 (?X_F (BEFORE ?X_D)))
			(!W5 (?X_F (BEFORE ?X_B)))
			(!W6 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent get.202s a kitten."
			"A kitten run.203s a destination from L1."
			"A agent finds a kitten never."
			"A agent get.201s another cat."
	)
)



(
	(EPI-SCHEMA (((K SUSIE.N)
	              (COMPOSITE-SCHEMA-17.PR (KE ((K OIL.N) GREAT.A)) (KA (BUY.V MORE.A))
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
	(EPI-SCHEMA ((?X_B (((ADV-A (FROM.P ?X_A)) RUN.3.V) ?L2)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B HARE.N))
			(!R2 (?X_A LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.3.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?X_A)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.3.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.3.V) ?L2))
			(?X_C (?X_B RUN.3.V))
			(?X_C (?X_B RUN.3.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? RUN.3.V)))
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-18.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_C HARE.N))
			(!R2 (?X_D LOCATION.N))
			(!R3 (?X_D DOG.N))
			(!R4 (NOT (?X_D = ?L2)))
			(!R5 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_B (?X_C (((ADV-A (FROM.P ?X_D)) RUN.3.V) ?L2)))
		)
	)
	(
			"A hare run.211s a destination from a location dog."
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.3.V ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?X_C ENTITY.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_D DESTINATION.N))
			(!R6 (?X_D SHOP.N))
			(!R7 (?X_A (PLUR FRIEND.N)))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C ((ADV-A (AT.P ?X_D)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_C ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C ((ADV-A (AT.P ?X_D)) BE.V)))
		)
		(:PARAPHRASES
			(?X_E (?X_B (((ADV-A (TO.P ?X_D)) TAKE.V) ?X_C)))
			(?X_E (?X_B ((ADV-A (TO.P ?X_D)) CARRY.V) ?X_C))
			(?X_E (?X_B ((ADV-A (TO.P ?X_D)) BRING.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? TAKE.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? CARRY.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? BRING.V) ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?P1 POSTCOND-OF ?X_E))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C (((ADV-A (TO.P ?X_A)) INFORM.3.V) ?X_D ?I)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?X_D AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_A SHOP.N))
			(!R6 (?X_B (PLUR FRIEND.N)))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_D (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_E (?X_C TELL.V ?X_D ?I))
			(?X_E (?X_C LET.V ?X_D (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B INFORM.4.V (K BLUE.A) ?I) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((K BLUE.A) AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_B (PLUR FRIEND.N)))
			(!R6 (?X_A MAN.N))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT ((K BLUE.A) (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 ((K BLUE.A) (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_C (?X_B TELL.V (K BLUE.A) ?I))
			(?X_C (?X_B LET.V (K BLUE.A) (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
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
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?I2 PRECOND-OF ?X_E))
			(!W3 (?I3 PRECOND-OF ?X_E))
			(!W4 (?P1 POSTCOND-OF ?X_E))
			(!W5 (?X_E (AT-ABOUT ?X_F)))
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
	              (COMPOSITE-SCHEMA-19.PR ?X_J
	               (K (L X (AND (X (PASV PAINT.V)) (X BLUE.A)))) (K BLUE.A) ?I
	               ?X_N))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J NEW.A))
			(!R2 (?X_J CAR.N))
			(!R3 (?X_J COLOR.N))
			(!R4 (?X_K (PERTAIN-TO ?X_M)))
			(!R5 ((K BLUE.A) AGENT.N))
			(!R6 (?X_K (PLUR FRIEND.N)))
			(!R7 (?X_N SMALLER-THAN.N ?X_M))
			(!R8 (NOT (?I ACTION.N)))
			(!R9 (?I INFORMATION.N))
			(!R10 (?X_M MAN.N))
			(!R11 (?X_L SHOP.N))
			(!R12 (NOT (?X_M = ?X_N)))
		)
		(:STEPS
			(?X_I (?X_M (WANT.V ?X_J)))
			(?X_G (?X_K INFORM.4.V (K BLUE.A) ?I))
			(?X_E (?X_M TRANSPORT_OBJECT.3.V ?X_N))
			(?X_E (?X_M (((ADV-A (TO.P ?X_L)) INFORM.3.V) ?X_N ?I)))
			(?X_E (?X_M (((ADV-A (TO.P ?X_L)) TAKE.2.V) ?X_N)))
			(?X_C (?X_N (GET.V (K (L X (AND (X (PASV PAINT.V)) (X BLUE.A)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_C)))
			(!W2 (?X_G (BEFORE ?X_E)))
		)
	)
	(
			"A man wants a new car color."
			"A friends of a man inform.225 blue a information."
			"A man transport object.220s X_N."
			"A man inform.227s X_N a information to a shop."
			"A man take.223s X_N to a shop."
			"X_N gets PASV paints blue."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) FALL.1.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A COW.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.1.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.1.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.1.V) ?L2))
			(?X_B (?X_A (OVER.PRT FALL.1.V)))
			(?X_B (?X_A FALL.1.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? FALL.1.V)))
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
			(!R3 (?L2 DESTINATION.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) DIE.1.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) DIE.1.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) DIE.1.V) ?L2))
			(?X_B (?X_A DIE.1.V))
			(?X_B (?X_A DIE.1.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? DIE.1.V)))
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
	              (COMPOSITE-SCHEMA-20.PR (K ASLEEP.A) (K (UP.ADV (TO.P ?X_L))) ?X_L
	               ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I MAN.N))
			(!R2 (?X_L COW.N))
			(!R3 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_K (?X_L (FALL.V (K ASLEEP.A))))
			(?X_H (?X_I (GO.V (K (UP.ADV (TO.P ?X_L))))))
			(?X_F (?X_I (PUSH.V ?X_L)))
			(?X_D (?X_L ((ADV-A (FROM.P ?L1)) FALL.1.V) ?L2))
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
			"A cow falls asleep."
			"A man goes up to a cow."
			"A man pushes a cow."
			"A cow fall.238s a destination from L1."
			"A cow die.239s a destination from L1."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.3.V)
	              (KA ((ADV-A (FOR.P ?X_C)) LOOK.V)))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA ((ADV-A (FOR.P ?X_C)) LOOK.V)) DESTINATION.N))
			(!R4 (NOT (?L1 = (KA ((ADV-A (FOR.P ?X_C)) LOOK.V)))))
			(!R5 (?X_C (PLUR CLOTHE.N)))
			(!R6 (?X_A WIFE.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V (KA ((ADV-A (AT.P (KA ((ADV-A (FOR.P ?X_C)) LOOK.V)))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (KA ((ADV-A (FOR.P ?X_C)) LOOK.V))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (KA ((ADV-A (FOR.P ?X_C)) LOOK.V)))))
		)
		(:PARAPHRASES
			(?X_D
	   (?X_B
	    ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (FOR.P ?X_C)) LOOK.V))))
	     ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_C)) LOOK.V)))) GO.3.V))))
			(?X_D
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (FOR.P ?X_C)) LOOK.V))))
	      GO.3.V))))
			(?X_D
	   (?X_B
	    ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (FOR.P ?X_C)) LOOK.V)))) GO.3.V)
	    (KA ((ADV-A (FOR.P ?X_C)) LOOK.V))))
			(?X_D (?X_B GO.3.V))
			(?X_D (?X_B GO.3.V (KA ((ADV-A (FOR.P ?X_C)) LOOK.V))))
			(?X_D (?X_B (LOCATION_ADV.? GO.3.V)))
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
	              (COMPOSITE-SCHEMA-21.PR (K GONE.A) ?X_N
	               (KA ((ADV-A (FOR.P ?X_N)) LOOK.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M WIFE.N))
			(!R2 (?X_H DAY.N))
			(!R3 (?X_H NEXT.A))
			(!R4 (?X_M (PERTAIN-TO ?X_O)))
			(!R5 (?X_N (PLUR CLOTHE.N)))
			(!R6 ((KA ((ADV-A (FOR.P ?X_N)) LOOK.V)) DESTINATION.N))
			(!R7 (?X_O MAN.N))
		)
		(:STEPS
			(?X_L (?X_O (FOLD.V ?X_N)))
			(?X_J (?X_O ((AWAY.ADV PUT.V) ?X_N)))
			(?X_G ((ADV-E (DURING ?X_H)) (?X_N (BE.V (K GONE.A)))))
			(?X_C (?X_M (REFOLD.V ?X_N)))
			(?X_E
	   (?X_O ((ADV-A (FROM.P ?L1)) GO.3.V) (KA ((ADV-A (FOR.P ?X_N)) LOOK.V))))
			(?X_A (?X_M (REFOLD.V ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_J)))
			(!W2 (?X_L (BEFORE ?X_G)))
			(!W3 (?X_L (BEFORE ?X_E)))
			(!W4 (?X_L (BEFORE ?X_A)))
			(!W5 (?X_J (BEFORE ?X_G)))
			(!W6 (?X_J (BEFORE ?X_E)))
			(!W7 (?X_J (BEFORE ?X_A)))
			(!W8 (?X_G (BEFORE ?X_E)))
			(!W9 (?X_G (BEFORE ?X_A)))
			(!W10 (?X_C (BEFORE ?X_A)))
			(!W11 (?X_E (BEFORE ?X_A)))
		)
	)
	(
			"A man folds a clothes."
			"A man puts a clothes away."
			"A clothes is gone DURING a day next."
			"A wife of a man refolds a clothes."
			"A man go.249s for a clothes looking from L1."
			"A wife of a man refolds a clothes."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-22.PR ?X_B)) ** ?E)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) RUN.4.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.4.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.4.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.4.V) ?L2))
			(?X_B (?X_A RUN.4.V))
			(?X_B (?X_A RUN.4.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? RUN.4.V)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) RUN.5.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.5.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.5.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.5.V) ?L2))
			(?X_B (?X_A RUN.5.V))
			(?X_B (?X_A RUN.5.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? RUN.5.V)))
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-23.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_E DOG.N))
			(!R2 (?X_F (PLUR DOG.N)))
			(!R3 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_D (?X_E ((ADV-A (FROM.P ?L1)) RUN.5.V) ?L2))
			(?X_B (?X_F ((ADV-A (FROM.P ?L1)) RUN.4.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A dog run.281s a destination from L1."
			"A dogs run.280 a destination from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-24.PR ?X_B)) ** ?E)
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
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.4.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B FROG.N))
			(!R3 (?X_B SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_A (PLUR GIRL.N)))
			(!R7 (?X_B GIANT.A))
			(!R8 (?L2 HOME.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B ((ADV-A (AT.P ?L2)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_B ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B ((ADV-A (AT.P ?L2)) BE.V)))
		)
		(:PARAPHRASES
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) TAKE.V) ?X_B))
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) CARRY.V) ?X_B))
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) BRING.V) ?X_B))
			(?X_C (?X_A (TAKE.V ?X_B)))
			(?X_C (?X_A CARRY.V ?X_B))
			(?X_C (?X_A BRING.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?P1 POSTCOND-OF ?X_C))
			(!W3 (?X_C (AT-ABOUT ?X_E)))
			(!W4 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.4.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B POND.N))
			(!R6 (?X_A (PLUR GIRL.N)))
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.4.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.4.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.4.V) ?X_B))
			(?X_C (?X_A GO.4.V))
			(?X_C (?X_A GO.4.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.4.V)))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (IN.P ?X_C)) PUT.1.V) ?X_B)) ** ?X_D)
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
			(?X_D (?X_A ((ADV-A (INTO.P ?X_C)) PUT.1.V) ?X_B))
			(?X_D (?X_A ((ADV-A (INSIDE.P ?X_C)) PUT.1.V) ?X_B))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (AT.P ?X_F)) TAKE.3.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B GIANT.A))
			(!R6 (?X_B FROG.N))
			(!R7 (?X_A (PLUR GIRL.N)))
			(!R8 (?X_F HOME.N))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_E)))
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
	              (COMPOSITE-SCHEMA-25.PR (K ((ADV-A (FOR.P ?X_C)) (WITH.P ?X_N)))
	               ?X_M ?X_O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C MONTH.N))
			(!R2 (?X_M DESTINATION.N))
			(!R3 (?X_M POND.N))
			(!R4 (?X_O SMALLER-THAN.N ?X_N))
			(!R5 (NOT (?X_N = ?X_O)))
			(!R6 (?X_N (PLUR GIRL.N)))
			(!R7 (?X_P BUCKET.N))
			(!R8 (?X_O SMALLER-THAN ?X_P))
			(!R9 (?X_O GIANT.A))
			(!R10 (?X_O FROG.N))
			(!R11 (NOT (?X_P AGENT.N)))
		)
		(:STEPS
			(?X_L (?X_N ((ADV-A (FROM.P ?L1)) GO.4.V) ?X_M))
			(?X_J (?X_N (CATCH.V ?X_O)))
			(?X_H (?X_N TRANSPORT_OBJECT.4.V ?X_O))
			(?X_H (?X_N (((ADV-A (AT.P ?X_F)) TAKE.3.V) ?X_O)))
			(?X_E (?X_N (((ADV-A (IN.P ?X_P)) PUT.1.V) ?X_O)))
			(?X_B (?X_O (LIVE.V (K ((ADV-A (FOR.P ?X_C)) (WITH.P ?X_N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_J)))
			(!W2 (?X_L (BEFORE ?X_H)))
			(!W3 (?X_L (BEFORE ?X_E)))
			(!W4 (?X_L (BEFORE ?X_B)))
			(!W5 (?X_J (BEFORE ?X_H)))
			(!W6 (?X_J (BEFORE ?X_E)))
			(!W7 (?X_J (BEFORE ?X_B)))
			(!W8 (?X_H (BEFORE ?X_B)))
			(!W9 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A girls go.322 a destination pond from L1."
			"A girls catch a giant frog."
			"A girls transport object.312 a giant frog."
			"A girls take.318 a giant frog at X_F."
			"A girls put.315 a giant frog in a bucket."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              (COMPOSITE-SCHEMA-26.PR (KE (?X_E (VERY.ADV UNCOMFORTABLE.A)))
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
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-27.PR (KE (?X_H FUNNY.A)) ?X_C
	               (KE (?X_J BURN.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C WHOLE.A))
			(!R2 (?X_C HOUSE.N))
			(!R3 (?X_H FUNNY.A))
			(!R4 (?X_J DOLL.N))
			(!R5 (?X_J (ON.P (K FIRE.N))))
			(!R6 (?X_I GIRL.N))
			(!R7 ((KE (?X_J BURN.V)) ENTITY.N))
		)
		(:STEPS
			(?X_G (?X_I (THINK.V (KE (?X_H FUNNY.A)))))
			(?X_B (?X_J (((ADV-A (ON.P (K FIRE.N))) CATCH.V) ?X_C)))
			(?X_E (?X_I WATCH.1.V (KE (?X_J BURN.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_B)))
		)
	)
	(
			"A girl thinks a funny funny."
			"A doll on fire catches a whole house on fire."
			"A girl watch.6s a doll on fire burns."
	)
)



(
	(EPI-SCHEMA ((?X_C (((ADV-A (IN.P ?X_D)) PUT.2.V) (K HAY.N))) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT ((K HAY.N) AGENT.N)))
			(!R3 (?X_D CONTAINER.N))
			(!R4 (NOT (?X_D AGENT.N)))
			(!R5 ((K HAY.N) SMALLER-THAN ?X_D))
			(!R6 (?X_C (HAS.V (SET-OF (TWO.D (PLUR FOX.N)) (TWO.D (PLUR BOX.N))))))
			(!R7 (?X_D (PLUR BOX.N)))
			(!R8
	   (?X_D
	    (ARE.V (KE ((K (L X (AND (X GOOD.A) (X (PLUR HOUSE.N))))) (FOR.P ?X_B))))))
			(!R9 (?X_B (PLUR FOX.N)))
			(!R10 (?X_B (PERTAIN-TO ?X_C)))
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
			(?X_E (?X_C ((ADV-A (INTO.P ?X_D)) PUT.2.V) (K HAY.N)))
			(?X_E (?X_C ((ADV-A (INSIDE.P ?X_D)) PUT.2.V) (K HAY.N)))
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-28.PR (SET-OF ?X_J ?X_I) (EACH.D FOX.N) ?X_A
	               (K HAY.N)))
	             ** ?E)
		(:ROLES
			(!R1
	   (?X_O
	    (ARE.V (KE ((K (L X (AND (X GOOD.A) (X (PLUR HOUSE.N))))) (FOR.P ?X_M))))))
			(!R2 (?X_I (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_H))))))))
			(!R3 (?X_I FOX.N))
			(!R4 (?X_J FOX.N))
			(!R5 (?X_J (ON.P ?X_K)))
			(!R6 (?X_L AGENT.N))
			(!R7 (?X_M (PLUR FOX.N)))
			(!R8 (?X_M (PERTAIN-TO ?X_N)))
			(!R9 ((K HAY.N) SMALLER-THAN ?X_O))
			(!R10 (?X_N AGENT.N))
			(!R11 (?X_N (HAS.V (SET-OF (TWO.D (PLUR FOX.N)) (TWO.D (PLUR BOX.N))))))
			(!R12 (?X_O (PLUR BOX.N)))
			(!R13 (NOT ((K HAY.N) AGENT.N)))
			(!R14 (NOT (?X_O AGENT.N)))
		)
		(:STEPS
			(?X_B (?X_L (SEE.V (SET-OF ?X_J ?X_I))))
			(?X_F (?X_N (GIVE.V (EACH.D FOX.N) ?X_A)))
			(?X_D (?X_N (((ADV-A (IN.P ?X_O)) PUT.2.V) (K HAY.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_F)))
		)
	)
	(
			"A agent sees a fox on X_K and a in front of fox."
			"A agent has two foxs and two boxs gives each fox X_A."
			"A agent has two foxs and two boxs put.27s hay in a are good house for a foxs of a agent has two foxs and two boxs boxs."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) STROLL.1.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B CAT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) STROLL.1.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) STROLL.1.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) STROLL.1.V) ?L2))
			(?X_C (?X_B ((ADV-A (THROUGH.P ?X_A)) STROLL.1.V)))
			(?X_C (?X_B STROLL.1.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? STROLL.1.V)))
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
	              (COMPOSITE-SCHEMA-29.PR (KE (?X_L FUNNY.A)) ?X_H (K PINK.A)
	               (KA ((ADV-A (WITH.P (K PINK.A))) PLAY.V)) ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H (K PINK.A) BALL.N))
			(!R2 (?X_H (ON.P ?X_I)))
			(!R3 (?X_L THING.N))
			(!R4 (?X_O HOUSE.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_P CAT.N))
		)
		(:STEPS
			(?X_N (?X_P ((ADV-A (FROM.P ?L1)) STROLL.1.V) ?L2))
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
			"A cat stroll.40s a destination from L1."
			"A cat finds a thing funny."
			"X_A is a on X_I."
			"A cat swats pink."
			"A cat likes with pink playing."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-30.PR (KE (?X_C (PLAY.V (K BALL.N)))))) ** ?E)
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) RIDE.1.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B TOWN.N))
			(!R6 (?X_A (PLUR BIKE.N)))
			(!R7 (?X_A (PERTAIN-TO ?X_C)))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RIDE.1.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RIDE.1.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RIDE.1.V) ?L2))
			(?X_D (?X_C ((ADV-A (AROUND.P ?X_B)) RIDE.1.V)))
			(?X_D (?X_C RIDE.1.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? RIDE.1.V)))
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
	(EPI-SCHEMA ((?X_B ((TOGETHER.ADV GET.7.V) ?X_C)) ** ?X_D)
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (SAME-TIME ?X_G)))
			(!W6 (?X_D (RIGHT-AFTER ?X_E)))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (BEFORE ?X_E)))
			(!W6 (?X_F (SAME-TIME ?X_E)))
			(!W7 (?X_F (RIGHT-AFTER ?X_G)))
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
	              (COMPOSITE-SCHEMA-31.PR (KA (RIDE.V (K (PLUR BIKE.N)))) ?X_A ?X_C
	               ?L2 ?X_Q))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G TOWN.N))
			(!R2 (?X_L DATE.N))
			(!R3 (?X_Q (PERTAIN-TO ?X_R)))
			(!R4 (?X_Q (PLUR BIKE.N)))
			(!R5 (NOT (?X_Q AGENT.N)))
			(!R6 (NOT (?X_R = ?X_Q)))
			(!R7 (?X_R AGENT.N))
			(!R8 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_P (?X_B (LOVE.V (KA (RIDE.V (K (PLUR BIKE.N)))))))
			(?X_N (?X_B (MEET.V ?X_A)))
			(?X_K (?X_B (((ADV-A (ON.P ?X_L)) ASK.V) ?X_C)))
			(?X_I (?X_R ((TOGETHER.ADV GET.8.V) ?X_Q)))
			(?X_D (?X_R ((TOGETHER.ADV GET.7.V) ?X_Q)))
			(?X_F (?X_R ((ADV-A (FROM.P ?L1)) RIDE.1.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_P (BEFORE ?X_N)))
			(!W2 (?X_P (BEFORE ?X_K)))
			(!W3 (?X_P (BEFORE ?X_D)))
			(!W4 (?X_P (BEFORE ?X_F)))
			(!W5 (?X_N (BEFORE ?X_K)))
			(!W6 (?X_N (BEFORE ?X_D)))
			(!W7 (?X_N (BEFORE ?X_F)))
			(!W8 (?X_K (BEFORE ?X_D)))
			(!W9 (?X_K (BEFORE ?X_F)))
			(!W10 (?X_I (BEFORE ?X_D)))
			(!W11 (?X_I (BEFORE ?X_F)))
			(!W12 (?X_D (BEFORE ?X_F)))
		)
	)
	(
			"X_B loves riding bikes."
			"X_B meets X_A."
			"X_B asks X_C on a date."
			"A agent get.78s a bikes of a agent together."
			"A agent get.77s a bikes of a agent together."
			"A agent ride.66s a destination from L1."
	)
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-32.PR (KA ((ADV-A (TO.P ?X_A)) GO.V)))) ** ?E)
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?X_A)) GO.5.V) (K (VERY.ADV HIGH.A))) **
	             ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_A END.N))
			(!R3 ((K (VERY.ADV HIGH.A)) DESTINATION.N))
			(!R4 (NOT (?X_A = (K (VERY.ADV HIGH.A)))))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (K (VERY.ADV HIGH.A)))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?X_A)))
			(?I2 (NOT (?X_B (AT.P (K (VERY.ADV HIGH.A))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?X_A))))
			(?P2 (?X_B (AT.P (K (VERY.ADV HIGH.A)))))
		)
		(:PARAPHRASES
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? (K (VERY.ADV HIGH.A)))) GO.5.V)))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?X_A))
	     ((ADV-A (DESTINATION_PREP.? (K (VERY.ADV HIGH.A)))) GO.5.V))))
			(?X_C
	   (?X_B ((ADV-A (DESTINATION_PREP.? (K (VERY.ADV HIGH.A)))) GO.5.V)
	    (K (VERY.ADV HIGH.A))))
			(?X_C (?X_B GO.5.V))
			(?X_C (?X_B GO.5.V (K (VERY.ADV HIGH.A))))
			(?X_C (?X_B (LOCATION_ADV.? GO.5.V)))
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
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-33.PR ?X_H (K (L X (AND (X MUCH.A) (X FUN.N))))
	               (K (VERY.ADV HIGH.A))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H (PLUR SWING.N)))
			(!R2 ((K (VERY.ADV HIGH.A)) DESTINATION.N))
			(!R3 (?X_I AGENT.N))
			(!R4 (?X_J END.N))
			(!R5 (NOT (?X_J = (K (VERY.ADV HIGH.A)))))
		)
		(:STEPS
			(?X_G (?X_I (LOVE.V ?X_H)))
			(?X_E (?X_I ((ADV-A (FROM.P ?X_J)) GO.5.V) (K (VERY.ADV HIGH.A))))
			(?X_C (?X_I (HAVE.V (K (L X (AND (X MUCH.A) (X FUN.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
			(!W2 (?X_G (BEFORE ?X_C)))
			(!W3 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A agent loves a swings."
			"A agent go.108s very high from a end."
			"A agent has much fun."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-34.PR ?X_E)) ** ?E)
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
			(!R5 (?X_B WARM.A))
			(!R6 (?X_B SHOWER.V))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
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
			(!W1 (?I1 PRECOND-OF ?X_B))
			(!W2 (?I2 PRECOND-OF ?X_B))
			(!W3 (?I3 PRECOND-OF ?X_B))
			(!W4 (?P1 POSTCOND-OF ?X_B))
			(!W5 (?X_C (AFTER ?X_B)))
			(!W6 (?X_C (AT-ABOUT ?X_D)))
			(!W7 (?X_E (AT-ABOUT ?X_D)))
			(!W8 (?X_E (AFTER ?X_F)))
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
	              (COMPOSITE-SCHEMA-35.PR (K COLD.A) ?X_P
	               (K ((ADV-A (IN.P ?X_P)) BETTER.A)) (K (BACK.ADV (IN.P ?X_P)))
	               ?O))
	             ** ?E)
		(:ROLES
			(!R1 (NOT (?O AGENT.N)))
			(!R2 (NOT (?X_O = ?O)))
			(!R3 (?X_O MAN.N))
			(!R4 (?X_P WARM.A))
			(!R5 (?X_P SHOWER.V))
			(!R6 (NOT ((K (BACK.ADV (IN.P ?X_P))) AGENT.N)))
			(!R7 (NOT (?X_O = (K (BACK.ADV (IN.P ?X_P))))))
		)
		(:STEPS
			(?X_J (?X_O (FEEL.V (K COLD.A))))
			(?X_H (?X_O (TAKE.V ?X_P)))
			(?X_F (?X_O (FEEL.V (K ((ADV-A (IN.P ?X_P)) BETTER.A)))))
			(?X_A (?X_O (OUT.PRT GET.V)))
			(?X_B (?X_O ((OUT.PRT GET.10.V) ?O)))
			(?X_D (?X_O GET.9.V (K (BACK.ADV (IN.P ?X_P)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_F)))
			(!W3 (?X_J (BEFORE ?X_D)))
			(!W4 (?X_H (BEFORE ?X_F)))
			(!W5 (?X_H (BEFORE ?X_D)))
			(!W6 (?X_F (BEFORE ?X_D)))
			(!W7 (?X_A (BEFORE ?X_D)))
			(!W8 (?X_B (BEFORE ?X_D)))
		)
	)
	(
			"A man feels cold."
			"A man takes a warm showering."
			"A man feels in a warm showering better."
			"A man gets out."
			"A man get.130s O out."
			"A man get.129s back in a warm showering."
	)
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-36.PR ?X_K)) ** ?E)
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
	(EPI-SCHEMA ((?X_A WATCH.2.V ?X_B) ** ?X_C)
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-37.PR ?X_O ?X_C ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_C POLICE.N))
			(!R2 (?X_L WINDOW.N))
			(!R3 (?X_L (OF.P ?X_M)))
			(!R4 (?X_N WOMAN.N))
			(!R5 (?X_O MAN.N))
		)
		(:STEPS
			(?X_K (?X_O ((ADV-A (INTO.P ?X_L)) LOOK.V)))
			(?X_I (?X_O ((INSIDE.ADV SEE.V) ?X_N)))
			(?X_E (?X_N (((ADV-A (FOR.P (KA WATCH.V))) NOTICE.V) ?X_O)))
			(?X_B (?X_N (CALL.V ?X_C)))
			(?X_G (?X_O WATCH.2.V ?X_N))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_E)))
			(!W3 (?X_K (BEFORE ?X_B)))
			(!W4 (?X_I (BEFORE ?X_E)))
			(!W5 (?X_I (BEFORE ?X_B)))
			(!W6 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A man looks into a window of X_M."
			"A man sees a woman inside."
			"A woman notices a man for watching."
			"A woman calls a police."
			"A man watch.150s a woman."
	)
)



(
	(EPI-SCHEMA ((?X_C PLAY.5.V) ** ?X_F)
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
	   (?X_C ((ADV-A (WITH.P (KE ((K MONEY.N) (FOR.P (?X_B BET.N)))))) PLAY.5.V)))
			(?X_F (?X_C PLAY.5.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
			(!W2 (?X_F (AT-ABOUT ?X_G)))
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-38.PR (KE ((K MONEY.N) (FOR.P (?X_H BET.N))))
	               (ALL.D
	                (L X
	                 (AND (X {REF}.N)
	                      (?X_A ?X_C (AND (?X_C MONEY.N) (?X_C (PERTAIN-TO ?X_M)))
	                       (X (OF.P ?X_C))))))
	               ?X_N))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H MORE.A))
			(!R2 (?X_N BET.N))
			(!R3 (?X_M MAN.N))
			(!R4 (NOT (?X_N AGENT.N)))
		)
		(:STEPS
			(?X_J (?X_M (LOSE.V ?X_N)))
			(?X_E
	   (?X_M
	    (LOSE.V
	     (ALL.D
	      (L X
	       (AND (X {REF}.N)
	            (?X_A ?X_C (AND (?X_C MONEY.N) (?X_C (PERTAIN-TO ?X_M)))
	             (X (OF.P ?X_C)))))))))
			(?X_L (?X_M PLAY.5.V))
			(?X_L (?X_M MAKE.3.V ?X_N))
			(?X_G (?X_M ((ONLY.ADV HAVE.V) (KE ((K MONEY.N) (FOR.P (?X_H BET.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_E)))
			(!W2 (?X_L (BEFORE ?X_G)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_C (GIVE.3.V ?X_D ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_C FATHER.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?X_D AGENT.N))
			(!R4 (?X_C (PERTAIN-TO ?X_D)))
			(!R5 (?X_E NEW.A))
			(!R6 (?X_E BOAT.N))
			(!R7 (?X_D (HAS.V ?X_E)))
			(!R8 (?X_A HOME.N))
			(!R9 (?X_A (PERTAIN-TO ?X_D)))
			(!R10 (?X_A HOUSE.N))
			(!R11 (?X_D (HAS.V ?X_B)))
			(!R12 (?X_B HOOK.N))
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
		(:PARAPHRASES
			(?X_F (?X_C (((ADV-A (TO.P ?X_D)) GIVE.3.V) ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (SAME-TIME ?X_I)))
			(!W2 (?X_F (RIGHT-AFTER ?X_G)))
			(!W3 (?X_H (BEFORE ?X_I)))
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
	(EPI-SCHEMA ((?X_C (GIVE.4.V ?X_D ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_C FATHER.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?X_D AGENT.N))
			(!R4 (?X_E NEW.A))
			(!R5 (?X_E BOAT.N))
			(!R6 (?X_D (HAS.V ?X_E)))
			(!R7 (?X_C (PERTAIN-TO ?X_D)))
			(!R8 (?X_A HOOK.N))
			(!R9 (?X_D (HAS.V ?X_A)))
			(!R10 (?X_B HOME.N))
			(!R11 (?X_B (PERTAIN-TO ?X_D)))
			(!R12 (?X_B HOUSE.N))
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
		(:PARAPHRASES
			(?X_F (?X_C (((ADV-A (TO.P ?X_D)) GIVE.4.V) ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (SAME-TIME ?X_I)))
			(!W2 (?X_F (RIGHT-AFTER ?X_G)))
			(!W3 (?X_H (BEFORE ?X_I)))
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
			(!R16 (?X_E NEW.A))
			(!R17 (?X_E BOAT.N))
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
			(!W1 (?I1 PRECOND-OF ?X_I))
			(!W2 (?I2 PRECOND-OF ?X_I))
			(!W3 (?I3 PRECOND-OF ?X_I))
			(!W4 (?P1 POSTCOND-OF ?X_I))
			(!W5 (?X_I (AFTER ?X_J)))
			(!W6 (?X_J (AT-ABOUT ?X_K)))
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
	              (COMPOSITE-SCHEMA-39.PR ?X_I ?X_F
	               (K (L X (AND (X OUT.P) (X (OF.P (THE.D BOAT.N)))))) ?X_Q ?X_R
	               (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_U)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F RIVER.N))
			(!R2 (?X_I GOOD.A))
			(!R3 (?X_I (PLUR OAR.N)))
			(!R4 (?X_L HOUSE.N))
			(!R5 (?X_L HOME.N))
			(!R6 (?X_L (PERTAIN-TO ?X_Q)))
			(!R7 (?X_M HOOK.N))
			(!R8 (?X_Q (HAS.V ?X_M)))
			(!R9 (?X_Q AGENT.N))
			(!R10 (?X_Q (HAS.V ?X_R)))
			(!R11 (?X_R NEW.A))
			(!R12 (?X_R BOAT.N))
			(!R13 (?X_P FATHER.N))
			(!R14 (?X_P (PERTAIN-TO ?X_Q)))
			(!R15 (NOT (?X_R AGENT.N)))
			(!R16 (?X_S ROW.N))
			(!R17 (?X_S BOAT.N))
			(!R18 (?X_T (PLUR CHILD.N)))
			(!R19 (NOT ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_U))) AGENT.N)))
			(!R20 (NOT (?X_T = (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_U))))))
			(!R21 (?X_U WATER.N))
		)
		(:STEPS
			(?X_K (?X_P (GIVE.V ?X_R ?X_Q)))
			(?X_B (?X_P (GIVE.3.V ?X_Q ?X_R)))
			(?X_B (?X_P (GIVE.4.V ?X_Q ?X_R)))
			(?X_H (?X_Q (((ADV-A (AT.P ?X_L)) KEEP.V) ?X_I)))
			(?X_D (?X_L (NEAR.P ?X_F)))
			(?X_E
	   (NOT (?X_T (FALL.V (K (L X (AND (X OUT.P) (X (OF.P (THE.D BOAT.N))))))))))
			(?X_C
	   (?X_T
	    (((ADV-A (IN.P ?X_S)) GET.11.V) (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_U))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_B)))
			(!W2 (?X_K (BEFORE ?X_C)))
			(!W3 (?X_B (BEFORE ?X_C)))
			(!W4 (?X_H (BEFORE ?X_D)))
			(!W5 (?X_H (BEFORE ?X_E)))
			(!W6 (?X_D (BEFORE ?X_E)))
		)
	)
	(
			"A father of a agent has a hook has a new boat gives a new boat a agent has a hook has a new boat."
			"A father of a agent has a hook has a new boat give.187s a agent has a hook has a new boat a new boat."
			"A father of a agent has a hook has a new boat give.189s a agent has a hook has a new boat a new boat."
			"A agent has a hook has a new boat keeps a good oars at a house home of a agent has X_M has X_R."
			"A house home of a agent has X_M has X_R is near."
			"A childs fall out of not."
			"A childs get.183 ADV far out on a water in a row boat."
	)
)



(
	(EPI-SCHEMA ((?X_C MAKE.4.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_D NOISE.N))
			(!R4 (?X_D LOUD.A))
			(!R5 (?X_A (PLUR EAR.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
			(!R8 (?X_B (PLUR HAND.N)))
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
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-40.PR ?X_G ?X_F ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_G (PLUR HAND.N)))
			(!R2 (?X_F (PLUR EAR.N)))
			(!R3 (?X_F (PERTAIN-TO ?X_H)))
			(!R4 (?X_G (PERTAIN-TO ?X_H)))
			(!R5 (?X_I NOISE.N))
			(!R6 (?X_I LOUD.A))
			(!R7 (?X_H AGENT.N))
			(!R8 (NOT (?X_I AGENT.N)))
		)
		(:STEPS
			(?X_E (?X_H (COVER.V ?X_F ?X_G)))
			(?X_A (?X_H (((ADV-A (WITH.P ?X_G)) COVER.V) ?X_F)))
			(?X_C (?X_H MAKE.4.V ?X_I))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_A)))
		)
	)
	(
			"A agent covers a ears of a agent a hands of a agent."
			"A agent covers a ears of a agent with a hands of a agent."
			"A agent make.195s a noise loud."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (COMPOSITE-SCHEMA-41.PR
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) RUN.6.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C NEW.A))
			(!R6 (?X_A ((CANNOT.ADV CATCH.V) ?X_C)))
			(!R7 (?X_C (PERTAIN-TO ?X_A)))
			(!R8 (?X_A ((OUT.ADV IS.V) ?X_B)))
			(!R9 (?X_B (WALK.V ?X_C)))
			(!R10 (?X_B EVENING.N))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.6.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.6.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.6.V) ?L2))
			(?X_D (?X_C (AWAY.PRT RUN.6.V)))
			(?X_D (?X_C RUN.6.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? RUN.6.V)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) RUN.7.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C NEW.A))
			(!R6 (?X_A (WALK.V ?X_C)))
			(!R7 (?X_A EVENING.N))
			(!R8 (?X_C (PERTAIN-TO ?X_B)))
			(!R9 (?X_B ((OUT.ADV IS.V) ?X_A)))
			(!R10 (?X_B ((CANNOT.ADV CATCH.V) ?X_C)))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.7.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.7.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.7.V) ?L2))
			(?X_D (?X_C (AWAY.PRT RUN.7.V)))
			(?X_D (?X_C RUN.7.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? RUN.7.V)))
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
	(EPI-SCHEMA ((?X_B GET.12.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C NEW.A))
			(!R6 (?X_C DOG.N))
			(!R7 (?X_B ((CANNOT.ADV CATCH.V) ?X_C)))
			(!R8 (?X_C (PERTAIN-TO ?X_B)))
			(!R9 (?X_A (WALK.V ?X_C)))
			(!R10 (?X_B ((OUT.ADV IS.V) ?X_A)))
			(!R11 (?X_A EVENING.N))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-42.PR ?L2 ?X_J)) ** ?E)
		(:ROLES
			(!R1 (?X_H EVENING.N))
			(!R2 (?X_I ((OUT.ADV IS.V) ?X_H)))
			(!R3 (?X_H (WALK.V ?X_J)))
			(!R4 (?X_I AGENT.N))
			(!R5 (?X_I ((CANNOT.ADV CATCH.V) ?X_J)))
			(!R6 (?X_J (PERTAIN-TO ?X_I)))
			(!R7 (NOT (?X_I = ?X_J)))
			(!R8 (?X_J NEW.A))
			(!R9 (?X_J DOG.N))
			(!R10 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_G (?X_I GET.12.V ?X_J))
			(?X_A (?X_I (LOVE.V ?X_J)))
			(?X_E (?X_I (LOVE.V ?X_J)))
			(?X_C (?X_J ((ADV-A (FROM.P ?L1)) RUN.6.V) ?L2))
			(?X_C (?X_J ((ADV-A (FROM.P ?L1)) RUN.7.V) ?L2))
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
			"A agent out is a evening walking a new dog of X_I cannot catch a new dog of a agent out is X_H cannot catch a new dog of X_I get.227s a new dog of a agent out is X_H cannot catch a new dog of X_I."
			"A agent out is a evening walking a new dog of X_I cannot catch a new dog of a agent out is X_H cannot catch a new dog of X_I loves a new dog of a agent out is X_H cannot catch a new dog of X_I."
			"A agent out is a evening walking a new dog of X_I cannot catch a new dog of a agent out is X_H cannot catch a new dog of X_I loves a new dog of a agent out is X_H cannot catch a new dog of X_I."
			"A new dog of a agent out is X_H cannot catch a new dog of X_I run.219s a destination from L1."
			"A new dog of a agent out is X_H cannot catch a new dog of X_I run.221s a destination from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.6.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B STORE.N))
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
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.6.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.6.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.6.V) ?X_B))
			(?X_C (?X_A GO.6.V))
			(?X_C (?X_A GO.6.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.6.V)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-43.PR ?X_E ?X_H ?X_J)) ** ?E)
		(:ROLES
			(!R1 (?X_E (PLUR ALMOND.N)))
			(!R2 (?X_E (SO.ADV GOOD.A)))
			(!R3 (?X_H DESTINATION.N))
			(!R4 (?X_H STORE.N))
			(!R5 (?X_I AGENT.N))
			(!R6 (?X_J FOOD.N))
			(!R7 (?X_J CAN.N))
			(!R8 (?X_J WHOLE.A))
		)
		(:STEPS
			(?X_G (?X_I ((ADV-A (FROM.P ?L1)) GO.6.V) ?X_H))
			(?X_D (?X_I (SEE.V ?X_E)))
			(?X_B (?X_I EAT.1.V ?X_J))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_D)))
			(!W2 (?X_G (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent go.245s a destination store from L1."
			"A agent sees a almonds so good."
			"A agent eat.250s a food can whole."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-44.PR ?X_B ?X_G)) ** ?E)
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
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.5.V ?O) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MOTHER.N))
			(!R2 (?O ENTITY.N))
			(!R3 (?O SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_B DESTINATION.N))
			(!R6 (?X_B BABY.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?O ((ADV-A (AT.P ?X_B)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?O ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?O ((ADV-A (AT.P ?X_B)) BE.V)))
		)
		(:PARAPHRASES
			(?X_C (?X_A ((OVER.PRT ((ADV-A (TO.P ?X_B)) TAKE.V)) ?O)))
			(?X_C (?X_A ((ADV-A (TO.P ?X_B)) CARRY.V) ?O))
			(?X_C (?X_A ((ADV-A (TO.P ?X_B)) BRING.V) ?O))
			(?X_C (?X_A (LOCATION_ADV.? TAKE.V) ?O))
			(?X_C (?X_A (LOCATION_ADV.? CARRY.V) ?O))
			(?X_C (?X_A (LOCATION_ADV.? BRING.V) ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?P1 POSTCOND-OF ?X_C))
			(!W3 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) WALK.2.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MOTHER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B BABY.N))
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
	    ((ADV-A (DESTINATION_PREP.? ?X_B))
	     (OVER.PRT ((ADV-A (TO.P ?X_B)) WALK.2.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) WALK.2.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) WALK.2.V) ?X_B))
			(?X_C (?X_A WALK.2.V))
			(?X_C (?X_A WALK.2.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? WALK.2.V)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.7.V) (KA SLEEP.V)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A BABY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA SLEEP.V) DESTINATION.N))
			(!R4 (NOT (?L1 = (KA SLEEP.V))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P (KA SLEEP.V))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (KA SLEEP.V)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (KA SLEEP.V))))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (DESTINATION_PREP.? (KA SLEEP.V)))
	     (BACK.ADV ((ADV-A (FOR.P (KA SLEEP.V))) GO.7.V)))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (KA SLEEP.V))) GO.7.V))))
			(?X_B
	   (?X_A ((ADV-A (DESTINATION_PREP.? (KA SLEEP.V))) GO.7.V) (KA SLEEP.V)))
			(?X_B (?X_A GO.7.V))
			(?X_B (?X_A GO.7.V (KA SLEEP.V)))
			(?X_B (?X_A (LOCATION_ADV.? GO.7.V)))
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-45.PR (KE (?X_N HUNGRY.A))
	               (K (THAT.P (?X_N HUNGRY.A))) ?O ?X_N (KA SLEEP.V)))
	             ** ?E)
		(:ROLES
			(!R1 (?O ENTITY.N))
			(!R2 (?O SMALLER-THAN.N ?X_M))
			(!R3 (?X_M MOTHER.N))
			(!R4 (?X_N DESTINATION.N))
			(!R5 (?X_N BABY.N))
			(!R6 ((KA SLEEP.V) DESTINATION.N))
		)
		(:STEPS
			(?X_L (?X_N ((ADV-A (FOR.P (KA CRY.V))) START.V)))
			(?X_J (?X_M TRANSPORT_OBJECT.5.V ?O))
			(?X_J (?X_M ((ADV-A (FROM.P ?L1)) WALK.2.V) ?X_N))
			(?X_H (?X_M (THAT.P (KE (?X_N HUNGRY.A)))))
			(?X_F (?X_M (SEE.V (K (THAT.P (?X_N HUNGRY.A))))))
			(?X_D (?X_M (BREASTF.V ?X_N)))
			(?X_B (?X_N ((ADV-A (FROM.P ?L1)) GO.7.V) (KA SLEEP.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_J)))
			(!W2 (?X_L (BEFORE ?X_H)))
			(!W3 (?X_L (BEFORE ?X_F)))
			(!W4 (?X_L (BEFORE ?X_D)))
			(!W5 (?X_L (BEFORE ?X_B)))
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
			"A destination baby starts for crying."
			"A mother transport object.276s a entity."
			"A mother walk.270s a destination baby from L1."
			"A mother is that."
			"A mother sees that a destination baby hungry."
			"A mother breastfs a destination baby."
			"A destination baby go.269s sleeping from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A (GIVE.5.V ?X_B ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_B WOMAN.N))
			(!R4 (?X_A MALE.A))
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
		(:PARAPHRASES
			(?X_D (?X_A (((ADV-A (TO.P ?X_B)) GIVE.5.V) ?X_C)))
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
	(EPI-SCHEMA ((?X_A GET.13.V (K MAD.A)) ** ?X_B)
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
			(!W1 (?I1 PRECOND-OF ?X_B))
			(!W2 (?I2 PRECOND-OF ?X_B))
			(!W3 (?I3 PRECOND-OF ?X_B))
			(!W4 (?P1 POSTCOND-OF ?X_B))
			(!W5 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E (COMPOSITE-SCHEMA-46.PR ?X_L ?X_S ?X_R (K MAD.A))) ** ?E)
		(:ROLES
			(!R1 (?X_E FEMALE.A))
			(!R2 (?X_E AGENT.N))
			(!R3 (?X_D (PERTAIN-TO ?X_E)))
			(!R4 (?X_L ROSE.N))
			(!R5 (?X_M MAN.N))
			(!R6 (?X_P ROSEBUSH.N))
			(!R7 (?X_Q AGENT.N))
			(!R8 (?X_Q MALE.A))
			(!R9 (NOT (?X_R AGENT.N)))
			(!R10 (?X_S WOMAN.N))
			(!R11 (NOT ((K MAD.A) AGENT.N)))
			(!R12 (NOT (?X_S = (K MAD.A))))
		)
		(:STEPS
			(?X_O (?X_P BLOOM.V))
			(?X_K (?X_M (CUT.V ?X_L)))
			(?X_C (NOT (?X_E ((DID.AUX LIKE.V) ?X_S))))
			(?X_I (?X_Q (GIVE.5.V ?X_S ?X_R)))
			(?X_G (?X_S GET.13.V (K MAD.A)))
			(?X_A (NOT (?X_E ((DID.AUX LIKE.V) ?X_S))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_K)))
			(!W2 (?X_O (BEFORE ?X_I)))
			(!W3 (?X_O (BEFORE ?X_G)))
			(!W4 (?X_O (BEFORE ?X_A)))
			(!W5 (?X_K (BEFORE ?X_I)))
			(!W6 (?X_K (BEFORE ?X_G)))
			(!W7 (?X_K (BEFORE ?X_A)))
			(!W8 (?X_C (BEFORE ?X_A)))
			(!W9 (?X_I (BEFORE ?X_G)))
			(!W10 (?X_I (BEFORE ?X_A)))
			(!W11 (?X_G (BEFORE ?X_A)))
		)
	)
	(
			"A rosebush blooms."
			"A man cuts a rose."
			"A female agent likes a woman not did."
			"A agent male give.280s a woman X_R."
			"A woman get.282s mad."
			"A female agent likes a woman not did."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-47.PR ?X_B)) ** ?E)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.8.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B STORE.N))
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.8.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.8.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.8.V) ?X_B))
			(?X_C (?X_A GO.8.V))
			(?X_C (?X_A GO.8.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.8.V)))
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-48.PR (K CANDY.N) (K GREAT.A)
	               (K (L X (AND (X SOUR.A) (X CANDY.N)))) (FIVE.D (PLUR BAG.N))
	               ?X_L))
	             ** ?E)
		(:ROLES
			(!R1 (?X_L DESTINATION.N))
			(!R2 (?X_L STORE.N))
			(!R3 (?X_M AGENT.N))
		)
		(:STEPS
			(?X_K (?X_M ((ADV-A (FROM.P ?L1)) GO.8.V) ?X_L))
			(?X_I (?X_M (((ADV-A (ON.P (K SALE.N))) SEE.V) (K CANDY.N))))
			(?X_G ((K CANDY.N) (LOOK.V (K GREAT.A))))
			(?X_E (?X_M (GET.V (K (L X (AND (X SOUR.A) (X CANDY.N)))))))
			(?X_C (?X_M (GET.V (FIVE.D (PLUR BAG.N)))))
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
			"A agent go.297s a destination store from L1."
			"A agent sees candy on sale."
			"Candy looks great."
			"A agent gets sour candy."
			"A agent gets five bags."
	)
)



(
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-49.PR
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.9.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B BEACH.N))
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
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.9.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.9.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.9.V) ?X_B))
			(?X_C (?X_A GO.9.V))
			(?X_C (?X_A GO.9.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.9.V)))
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.7.V (KA GO.V)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA GO.V) ACTION.N))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA GO.V) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_B (?X_A ((NEVER.ADV WANT.V) (KA GO.V))))
			(?X_B (?X_A (LIKE.V (KA GO.V))))
			(?X_B (?X_A (LOVE.V (KA GO.V))))
			(?X_B (?X_A (ENJOY.V (KA GO.V))))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-50.PR (K ASLEEP.A) ?X_J (KA GO.V))) ** ?E)
		(:ROLES
			(!R1 (?X_G HAMMOCK.N))
			(!R2 (?X_J DESTINATION.N))
			(!R3 (?X_J BEACH.N))
			(!R4 ((KA GO.V) ACTION.N))
			(!R5 (?X_K AGENT.N))
		)
		(:STEPS
			(?X_I (?X_K ((ADV-A (FROM.P ?L1)) GO.9.V) ?X_J))
			(?X_F (?X_K ((ADV-A (IN.P ?X_G)) LAY.V)))
			(?X_D (?X_K (FALL.V (K ASLEEP.A))))
			(?X_B (?X_K ENJOY_ACTION.7.V (KA GO.V)))
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
			"A agent go.307s a destination beach from L1."
			"A agent lays in a hammock."
			"A agent falls asleep."
			"A agent enjoy action.312s going."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.10.V) (KA (INTRODUCE.V ?X_A))) **
	             ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA (INTRODUCE.V ?X_A)) DESTINATION.N))
			(!R4 (NOT (?L1 = (KA (INTRODUCE.V ?X_A)))))
			(!R5 (?X_A EXCITED.A))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P (KA (INTRODUCE.V ?X_A)))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (KA (INTRODUCE.V ?X_A))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (KA (INTRODUCE.V ?X_A)))))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (DESTINATION_PREP.? (KA (INTRODUCE.V ?X_A))))
	     ((ADV-A (FOR.P (KA (INTRODUCE.V ?X_A)))) GO.10.V))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (KA (INTRODUCE.V ?X_A)))) GO.10.V))))
			(?X_B
	   (?X_A ((ADV-A (DESTINATION_PREP.? (KA (INTRODUCE.V ?X_A)))) GO.10.V)
	    (KA (INTRODUCE.V ?X_A))))
			(?X_B (?X_A GO.10.V))
			(?X_B (?X_A GO.10.V (KA (INTRODUCE.V ?X_A))))
			(?X_B (?X_A (LOCATION_ADV.? GO.10.V)))
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.8.V ?X_B ?A) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B AGENT.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_A EXCITED.A))
			(!R5 (?X_B (PLUR FRIEND.N)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V ?X_B ?A)))
			(?G2 (?X_A (WANT.V (THAT (?X_A (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_A (ASK.V ?X_B ?A)))
			(?E2 (?X_B (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_C (?X_A (ASK.V ?X_B ?A)))
			(?X_C (?X_A (TELL.V ?X_B ?A)))
			(?X_C (?X_A (MAKE.V ?X_B ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
	(EPI-SCHEMA ((?X_A MAKE.5.V ?X_B) ** ?X_C)
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
	              (COMPOSITE-SCHEMA-51.PR
	               (KE
	                (?X_N (GET.V (K (L X (AND (X NEW.A) (X (PLUR NEIGHBOR.N))))))))
	               (K
	                (LIKE.P
	                 (?X_N
	                  (GET.V (K (L X (AND (X NEW.A) (X (PLUR NEIGHBOR.N)))))))))
	               (KA (INTRODUCE.V ?X_N)) ?A ?X_M))
	             ** ?E)
		(:ROLES
			(!R1 ((KA (INTRODUCE.V ?X_N)) DESTINATION.N))
			(!R2 (?A ACTION.N))
			(!R3 (?X_M (PLUR FRIEND.N)))
			(!R4 (?X_N AGENT.N))
			(!R5 (?X_N EXCITED.A))
		)
		(:STEPS
			(?X_L (?X_N (OUTSIDE.ADV LOOK.V)))
			(?X_J
	   (?X_A
	    (LIKE.P
	     (KE (?X_N (GET.V (K (L X (AND (X NEW.A) (X (PLUR NEIGHBOR.N)))))))))))
			(?X_H
	   (?X_A
	    (LOOK.V
	     (K
	      (LIKE.P
	       (?X_N (GET.V (K (L X (AND (X NEW.A) (X (PLUR NEIGHBOR.N))))))))))))
			(?X_F (?X_N ((ADV-A (FROM.P ?L1)) GO.10.V) (KA (INTRODUCE.V ?X_N))))
			(?X_D (?X_N REQUEST_ACTION.8.V ?X_M ?A))
			(?X_D (?X_N MAKE.5.V ?X_M))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_J)))
			(!W2 (?X_L (BEFORE ?X_H)))
			(!W3 (?X_L (BEFORE ?X_F)))
			(!W4 (?X_L (BEFORE ?X_D)))
			(!W5 (?X_J (BEFORE ?X_F)))
			(!W6 (?X_J (BEFORE ?X_D)))
			(!W7 (?X_H (BEFORE ?X_F)))
			(!W8 (?X_H (BEFORE ?X_D)))
			(!W9 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A agent excited looks outside."
			"X_A is like."
			"X_A looks like a agent excited gets new neighbor."
			"A agent excited go.315s introducing a agent excited from L1."
			"A agent excited request action.313s a friends a action."
			"A agent excited make.316s a friends."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (COMPOSITE-SCHEMA-52.PR (K (PLUR PET.N))
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
	(EPI-SCHEMA ((?X_D (((ADV-A (FROM.P ?X_C)) FALL.2.V) ?L2)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D BROTHER.N))
			(!R2 (?X_C LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?X_C = ?L2)))
			(!R5 (?X_C TREE.N))
			(!R6 (?X_A AGENT.N))
			(!R7 (?X_D (PERTAIN-TO ?X_A)))
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.2.V)))
			(?X_E
	   (?X_D ((ADV-A (FROM.P ?X_C)) ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.2.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.2.V) ?L2))
			(?X_E (?X_D FALL.2.V))
			(?X_E (?X_D FALL.2.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? FALL.2.V)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.11.V)
	              (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F))))))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F))))) DESTINATION.N))
			(!R4 (NOT (?L1 = (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F))))))))
			(!R5 (?X_D HIKE.N))
			(!R6 (?X_E HOUSE.N))
			(!R7 (?X_F (PLUR WOOD.N)))
			(!R8 (?X_B AGENT.N))
			(!R9 (?X_E (PERTAIN-TO ?X_B)))
			(!R10 (?X_A BROTHER.N))
			(!R11 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1
	   (?X_C
	    (WANT.V
	     (KA
	      ((ADV-A (AT.P (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F)))))))
	       BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?L1)))
			(?I2 (NOT (?X_C (AT.P (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F)))))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?L1))))
			(?P2 (?X_C (AT.P (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F))))))))
		)
		(:PARAPHRASES
			(?X_G
	   (?X_C
	    ((ADV-A
	      (DESTINATION_PREP.? (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F)))))))
	     GO.11.V)))
			(?X_G
	   (?X_C
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A
	       (DESTINATION_PREP.?
	        (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F)))))))
	      GO.11.V))))
			(?X_G
	   (?X_C
	    ((ADV-A
	      (DESTINATION_PREP.? (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F)))))))
	     GO.11.V)
	    (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F)))))))
			(?X_G (?X_C GO.11.V))
			(?X_G (?X_C GO.11.V (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F)))))))
			(?X_G (?X_C (LOCATION_ADV.? GO.11.V)))
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
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.9.V ?X_E ?A) ** ?X_F)
		(:ROLES
			(!R1 (?X_C BROTHER.N))
			(!R2 (?X_E AGENT.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_D TREE.N))
			(!R5 (?X_C (PERTAIN-TO ?X_B)))
			(!R6 (?X_B AGENT.N))
			(!R7 (?X_A HOUSE.N))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V ?X_E ?A)))
			(?G2 (?X_C (WANT.V (THAT (?X_C (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_C (((ADV-A (FROM.P ?X_D)) ASK.V) ?X_E ?A)))
			(?E2 (?X_E (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_F (?X_C (((ADV-A (FROM.P ?X_D)) ASK.V) ?X_E ?A)))
			(?X_F (?X_C (TELL.V ?X_E ?A)))
			(?X_F (?X_C (MAKE.V ?X_E ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.10.V ?X_D ?A) ** ?X_E)
		(:ROLES
			(!R1 (?X_B BROTHER.N))
			(!R2 (?X_D AGENT.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_C TREE.N))
			(!R5 (?X_B (PERTAIN-TO ?X_D)))
			(!R6 (?X_A HOUSE.N))
			(!R7 (?X_A (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V ?X_D ?A)))
			(?G2 (?X_B (WANT.V (THAT (?X_B (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_B (((ADV-A (FROM.P ?X_C)) ASK.V) ?X_D ?A)))
			(?E2 (?X_D (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_E (?X_B (((ADV-A (FROM.P ?X_C)) ASK.V) ?X_D ?A)))
			(?X_E (?X_B (TELL.V ?X_D ?A)))
			(?X_E (?X_B (MAKE.V ?X_D ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (FROM.P ?X_A)) INFORM.5.V) ?X_D ?I)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C BROTHER.N))
			(!R2 (?X_D AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_A TREE.N))
			(!R6 (?X_C (PERTAIN-TO ?X_D)))
			(!R7 (?X_B HOUSE.N))
			(!R8 (?X_B (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_D (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_E (?X_C TELL.V ?X_D ?I))
			(?X_E (?X_C LET.V ?X_D (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D (((ADV-A (FROM.P ?X_A)) INFORM.6.V) ?X_E ?I)) ** ?X_F)
		(:ROLES
			(!R1 (?X_D BROTHER.N))
			(!R2 (?X_E AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_A TREE.N))
			(!R6 (?X_B AGENT.N))
			(!R7 (?X_D (PERTAIN-TO ?X_B)))
			(!R8 (?X_C (PERTAIN-TO ?X_B)))
			(!R9 (?X_C HOUSE.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_E (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_E (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_F (?X_D TELL.V ?X_E ?I))
			(?X_F (?X_D LET.V ?X_E (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-53.PR (KE (?X_A (OF.P ?X_H))) ?X_P
	               (KA (DOWN.ADV GET.V)) ?L2
	               (K (IN.P (?X_K ((ADV-A (BY.P ?X_M)) (IN.P ?X_L))))) ?A ?X_N ?X_O
	               ?I))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H (VERY.ADV HIGH.A)))
			(!R2 (?X_H (PLUR TREE.N)))
			(!R3 (?X_M (PERTAIN-TO ?X_N)))
			(!R4 (?X_K HIKE.N))
			(!R5 ((K (IN.P (?X_K ((ADV-A (BY.P ?X_M)) (IN.P ?X_L))))) DESTINATION.N))
			(!R6 (?X_L (PLUR WOOD.N)))
			(!R7 (?X_M HOUSE.N))
			(!R8 (?X_Q LOCATION.N))
			(!R9 (NOT (?X_Q = ?L2)))
			(!R10 (?L2 DESTINATION.N))
			(!R11 (?A ACTION.N))
			(!R12 (?X_P (PERTAIN-TO ?X_N)))
			(!R13 (?X_N AGENT.N))
			(!R14 (?X_O AGENT.N))
			(!R15 (?X_P BROTHER.N))
			(!R16 (?X_Q TREE.N))
			(!R17 (NOT (?I ACTION.N)))
			(!R18 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_J
	   (?X_O ((ADV-A (FROM.P ?L1)) GO.11.V)
	    (K (IN.P (?X_K ((ADV-A (BY.P ?X_M)) (IN.P ?X_L)))))))
			(?X_G (?X_P (CLIMB.V (KE (?X_A (OF.P ?X_H))))))
			(?X_E (?X_O (TELL.V ?X_P (KA (DOWN.ADV GET.V)))))
			(?X_C (?X_P (((ADV-A (FROM.P ?X_Q)) FALL.2.V) ?L2)))
			(?X_C (?X_P REQUEST_ACTION.9.V ?X_O ?A))
			(?X_C (?X_P REQUEST_ACTION.10.V ?X_N ?A))
			(?X_C (?X_P (((ADV-A (FROM.P ?X_Q)) INFORM.5.V) ?X_N ?I)))
			(?X_C (?X_P (((ADV-A (FROM.P ?X_Q)) INFORM.6.V) ?X_O ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_G)))
			(!W2 (?X_J (BEFORE ?X_E)))
			(!W3 (?X_J (BEFORE ?X_C)))
			(!W4 (?X_G (BEFORE ?X_E)))
			(!W5 (?X_G (BEFORE ?X_C)))
			(!W6 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A agent go.325s in a hike by a house of a agent in a woods from L1."
			"A brother of a agent climbs X_A of a very high trees."
			"A agent tells a brother of a agent down get."
			"A brother of a agent fall.324s a destination from a location tree."
			"A brother of a agent request action.334s a agent a action."
			"A brother of a agent request action.335s a agent a action."
			"A brother of a agent inform.331s a agent a information from a location tree."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) RUN.8.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B (MORE.ADV TIRED.A)))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A BREATH.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.8.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.8.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.8.V) ?L2))
			(?X_C (?X_B ((ADV (VERY.ADV FAST.A)) RUN.8.V)))
			(?X_C (?X_B RUN.8.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? RUN.8.V)))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-54.PR (KE (?X_K THINK.V)) ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_G BREAK.N))
			(!R2 (?X_J BREATH.N))
			(!R3 (?X_J (PERTAIN-TO ?X_K)))
			(!R4 (?X_K (MORE.ADV TIRED.A)))
			(!R5 (?X_K MAN.N))
			(!R6 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_I (?X_K ((ADV-A (FOR.P (KA (CATCH.V ?X_J)))) STOP.V)))
			(?X_A (?X_K ((ADV-A (FROM.P ?L1)) RUN.8.V) ?L2))
			(?X_B (?X_K ((ADV-A (FOR.P (KA (CATCH.V ?X_J)))) STOP.V)))
			(?X_C (?X_K (THAN.P (KE (?X_K THINK.V)))))
			(?X_D (?X_K (THAN.P (KE (?X_K THINK.V)))))
			(?X_F (?X_K (DOWN.ADV ((ADV-A (FOR.P ?X_G)) SIT.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_B)))
			(!W2 (?X_I (BEFORE ?X_C)))
			(!W3 (?X_I (BEFORE ?X_D)))
			(!W4 (?X_I (BEFORE ?X_F)))
			(!W5 (?X_A (BEFORE ?X_B)))
			(!W6 (?X_A (BEFORE ?X_C)))
			(!W7 (?X_A (BEFORE ?X_D)))
			(!W8 (?X_A (BEFORE ?X_F)))
			(!W9 (?X_B (BEFORE ?X_C)))
			(!W10 (?X_B (BEFORE ?X_D)))
			(!W11 (?X_B (BEFORE ?X_F)))
			(!W12 (?X_C (BEFORE ?X_F)))
			(!W13 (?X_D (BEFORE ?X_F)))
		)
	)
	(
			"A more tired man stops for catching a breath of a more tired man."
			"A more tired man run.17s a destination from L1."
			"A more tired man stops for catching a breath of a more tired man."
			"A more tired man is than."
			"A more tired man is than."
			"A more tired man sits down for a break."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) COME.1.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PERTAIN-TO ?X_C)))
			(!R6 (?X_A (PLUR FRIEND.N)))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) COME.1.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) COME.1.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) COME.1.V) ?L2))
			(?X_D
	   (?X_C ((ADV-A (IN.P (K (L X (AND (X LAST.A) (X PLACE.N)))))) COME.1.V)))
			(?X_D (?X_C COME.1.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? COME.1.V)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-55.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_E GROUP.N))
			(!R2 (?X_H (PLUR FRIEND.N)))
			(!R3 (?X_H (PERTAIN-TO ?X_I)))
			(!R4 (?X_I AGENT.N))
			(!R5 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_G ((SET-OF ?X_H ?X_I) RUN.V))
			(?X_D (?X_I ((ADV-A (BEHIND.P ?X_E)) BE.V)))
			(?X_B (?X_I ((ADV-A (FROM.P ?L1)) COME.1.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_D)))
			(!W2 (?X_G (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A friends of a agent and a agent run."
			"A agent is behind a group."
			"A agent come.19s a destination from L1."
	)
)



(
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.11.V (KA SKATE.V)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((KA SKATE.V) ACTION.N))
			(!R3 (?X_A (PERTAIN-TO ?X_B)))
			(!R4 (?X_A (K FIRST.A) LESSON.N))
		)
		(:PRECONDS
			(?I1 (?X_B (THINK.V (THAT ((KA SKATE.V) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_C (?X_B (WANT.V (KA SKATE.V))))
			(?X_C (?X_B (LIKE.V (KA SKATE.V))))
			(?X_C (?X_B (LOVE.V (KA SKATE.V))))
			(?X_C (?X_B (ENJOY.V (KA SKATE.V))))
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
	(EPI-SCHEMA ((?X_F
	              (COMPOSITE-SCHEMA-56.PR (KA (TAKE.V (K (PLUR LESSON.N))))
	               (KA SKATE.V)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E (K FIRST.A) LESSON.N))
			(!R2 (?X_E (PERTAIN-TO ?X_F)))
			(!R3 (?X_F AGENT.N))
			(!R4 ((KA SKATE.V) ACTION.N))
		)
		(:STEPS
			(?X_B (?X_F (DECIDE.V (KA (TAKE.V (K (PLUR LESSON.N)))))))
			(?X_D (?X_F ENJOY_ACTION.11.V (KA SKATE.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B BEFORE ?X_D))
		)
	)
	(
			"A agent decides taking lessons."
			"A agent enjoy action.37s skating."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-57.PR ?X_D)) ** ?E)
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
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.6.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_C HOME.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_A))
			(!R4 (?X_B LOCATION.N))
			(!R5 ((KA (MAKE.V (K HONEY.N))) DESTINATION.N))
			(!R6 (?X_A (PLUR BEE.N)))
			(!R7 (?X_C NECTAR.A))
			(!R8 (?X_B (PLUR FIELD.N)))
		)
		(:GOALS
			(?G1
	   (?X_A
	    (WANT.V (THAT (?X_C ((ADV-A (AT.P (KA (MAKE.V (K HONEY.N))))) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_C ((ADV-A (AT.P ?X_B)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C ((ADV-A (AT.P (KA (MAKE.V (K HONEY.N))))) BE.V)))
		)
		(:PARAPHRASES
			(?X_D
	   (?X_A
	    (((ADV-A (TO.P (KA (MAKE.V (K HONEY.N)))))
	      ((ADV-A (FOR.P (KA (MAKE.V (K HONEY.N))))) TAKE.V))
	     ?X_C)))
			(?X_D (?X_A ((ADV-A (TO.P (KA (MAKE.V (K HONEY.N))))) CARRY.V) ?X_C))
			(?X_D (?X_A ((ADV-A (TO.P (KA (MAKE.V (K HONEY.N))))) BRING.V) ?X_C))
			(?X_D (?X_A (LOCATION_ADV.? TAKE.V) ?X_C))
			(?X_D (?X_A (LOCATION_ADV.? CARRY.V) ?X_C))
			(?X_D (?X_A (LOCATION_ADV.? BRING.V) ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?P1 POSTCOND-OF ?X_D))
			(!W3 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (FOR.P (KA (MAKE.V (K HONEY.N))))) TAKE.4.V) ?X_C))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_A LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_B (PLUR BEE.N)))
			(!R6 (?X_C NECTAR.A))
			(!R7 (?X_C HOME.N))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_S
	              (COMPOSITE-SCHEMA-58.PR ?X_A
	               (K (L X (AND (X SWEET.A) (X NECTAR.N)))) ?X_K ?X_B (K CLOVER.N)
	               ?X_T))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H (PLUR FIELD.N)))
			(!R2 (?X_K SWEET.A))
			(!R3 (?X_P CLOVER.N))
			(!R4 (?X_P (PLUR FLOWER.N)))
			(!R5 (?X_T SMALLER-THAN.N ?X_S))
			(!R6 ((KA (MAKE.V (K HONEY.N))) DESTINATION.N))
			(!R7 (?X_T NECTAR.A))
			(!R8 (?X_T HOME.N))
			(!R9 (?X_S (PLUR BEE.N)))
			(!R10 (NOT (?X_T AGENT.N)))
			(!R11 (NOT (?X_S = ?X_T)))
		)
		(:STEPS
			(?X_R (?X_S (LIKE.V ?X_A)))
			(?X_O
	   (?X_S
	    (((ADV-A (IN.P ?X_P)) FIND.V) (K (L X (AND (X SWEET.A) (X NECTAR.N)))))))
			(?X_M (?X_S TRANSPORT_OBJECT.6.V ?X_T))
			(?X_M (?X_S (((ADV-A (FOR.P (KA (MAKE.V (K HONEY.N))))) TAKE.4.V) ?X_T)))
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
			(!W1 (?X_R (BEFORE ?X_O)))
			(!W2 (?X_R (BEFORE ?X_J)))
			(!W3 (?X_R (BEFORE ?X_G)))
			(!W4 (?X_R (BEFORE ?X_E)))
			(!W5 (?X_O (BEFORE ?X_J)))
			(!W6 (?X_O (BEFORE ?X_G)))
			(!W7 (?X_O (BEFORE ?X_E)))
			(!W8 (?X_J (BEFORE ?X_G)))
			(!W9 (?X_J (BEFORE ?X_E)))
			(!W10 (?X_G (BEFORE ?X_E)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_C COMPOSITE-SCHEMA-59.PR) ** ?E)
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.12.V (KA (BUY.V ?X_B))) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (BUY.V ?X_B)) ACTION.N))
			(!R3 (?X_B NEW.A))
			(!R4 (?X_B WATCH.N))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA (BUY.V ?X_B)) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_C (?X_A (WANT.V (KA (BUY.V ?X_B)))))
			(?X_C (?X_A (LIKE.V (KA (BUY.V ?X_B)))))
			(?X_C (?X_A (LOVE.V (KA (BUY.V ?X_B)))))
			(?X_C (?X_A (ENJOY.V (KA (BUY.V ?X_B)))))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-60.PR ?X_H ?X_I (KA (BUY.V ?X_P)))) ** ?E)
		(:ROLES
			(!R1 (?X_H MOST.A))
			(!R2 (?X_I ROSE.N))
			(!R3 (?X_I GOLD.N))
			(!R4 (?X_I WATCH.N))
			(!R5 (?X_N JEWELRY.N))
			(!R6 (?X_N STORE.N))
			(!R7 ((KA (BUY.V ?X_P)) ACTION.N))
			(!R8 (?X_O AGENT.N))
			(!R9 (?X_P NEW.A))
			(!R10 (?X_P WATCH.N))
		)
		(:STEPS
			(?X_M (?X_A ((ADV-A (AT.P ?X_N)) BE.V)))
			(?X_G (?X_O (LIKE.V ?X_I ?X_H)))
			(?X_E (?X_O (BUY.V ?X_I)))
			(?X_C (?X_O ((HOME.ADV WEAR.V) ?X_I)))
			(?X_K (?X_O ENJOY_ACTION.12.V (KA (BUY.V ?X_P))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_G)))
			(!W2 (?X_M (BEFORE ?X_E)))
			(!W3 (?X_M (BEFORE ?X_C)))
			(!W4 (?X_G (BEFORE ?X_E)))
			(!W5 (?X_G (BEFORE ?X_C)))
			(!W6 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"X_A is at a jewelry store."
			"A agent likes a rose gold watch a most."
			"A agent buys a rose gold watch."
			"A agent wears a rose gold watch home."
			"A agent enjoy action.89s buying a new watch."
	)
)



(
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-61.PR ?X_D (KA SIT.V) ?X_H (KA HELP.V))) **
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
	(EPI-SCHEMA ((?X_B GET.14.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_A HOUSE.N))
			(!R6 (?X_A PLACE.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_S
	              (COMPOSITE-SCHEMA-62.PR
	               (KA (OVER.PRT ((ADV-A (IN.P (THREE.D (PLUR HOUR.N)))) COME.V)))
	               ?X_L ?X_R ?X_T))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G GOOD.A))
			(!R2 (?X_G TIME.N))
			(!R3 (?X_L MESS.N))
			(!R4 (?X_R PLACE.N))
			(!R5 (?X_R HOUSE.N))
			(!R6 (?X_O AGENT.N))
			(!R7 (?X_R (PERTAIN-TO ?X_S)))
			(!R8 (?X_S AGENT.N))
			(!R9 (NOT (?X_T AGENT.N)))
			(!R10 (NOT (?X_S = ?X_T)))
		)
		(:STEPS
			(?X_K (?X_R (BE.V ?X_L)))
			(?X_I (?X_S (CLEAN.V ?X_R)))
			(?X_F (?X_A ?X_G (HAVE.V ?X_R)))
			(?X_Q (?X_S GET.14.V ?X_T))
			(?X_N
	   (?X_O
	    (WANT.V (KA (OVER.PRT ((ADV-A (IN.P (THREE.D (PLUR HOUR.N)))) COME.V))))))
			(?X_B (?X_R (BE.V ?X_L)))
			(?X_C (?X_S (CLEAN.V ?X_R)))
			(?X_D (?X_A ?X_G (HAVE.V ?X_R)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_B)))
			(!W2 (?X_K (BEFORE ?X_C)))
			(!W3 (?X_K (BEFORE ?X_D)))
			(!W4 (?X_I (BEFORE ?X_C)))
			(!W5 (?X_I (BEFORE ?X_D)))
			(!W6 (?X_F (BEFORE ?X_D)))
			(!W7 (?X_Q (BEFORE ?X_N)))
			(!W8 (?X_Q (BEFORE ?X_B)))
			(!W9 (?X_Q (BEFORE ?X_C)))
			(!W10 (?X_Q (BEFORE ?X_D)))
			(!W11 (?X_N (BEFORE ?X_B)))
			(!W12 (?X_N (BEFORE ?X_C)))
			(!W13 (?X_N (BEFORE ?X_D)))
			(!W14 (?X_B (BEFORE ?X_C)))
			(!W15 (?X_B (BEFORE ?X_D)))
			(!W16 (?X_C (BEFORE ?X_D)))
		)
	)
	(
			"A place house of a agent is a mess."
			"A agent cleans a place house of a agent."
			"X_A has a place house of a agent."
			"A agent get.114s X_T."
			"A agent wants over in three hours coming."
			"A place house of a agent is a mess."
			"A agent cleans a place house of a agent."
			"X_A has a place house of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.12.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B STORE.N))
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
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.12.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.12.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.12.V) ?X_B))
			(?X_C (?X_A GO.12.V))
			(?X_C (?X_A GO.12.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.12.V)))
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-63.PR ?X_D)) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D DESTINATION.N))
			(!R3 (?X_D STORE.N))
		)
		(:STEPS
			(?X_B (?X_C ((ADV-A (FROM.P ?L1)) GO.12.V) ?X_D))
		)
	)
	(
			"A agent go.121s a destination store from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.13.V) (K CHURCH.N)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K CHURCH.N) DESTINATION.N))
			(!R4 (NOT (?L1 = (K CHURCH.N))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P (K CHURCH.N))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (K CHURCH.N)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (K CHURCH.N))))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (DESTINATION_PREP.? (K CHURCH.N)))
	     ((ADV-A (TO.P (K CHURCH.N))) GO.13.V))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K CHURCH.N))) GO.13.V))))
			(?X_B
	   (?X_A ((ADV-A (DESTINATION_PREP.? (K CHURCH.N))) GO.13.V) (K CHURCH.N)))
			(?X_B (?X_A GO.13.V))
			(?X_B (?X_A GO.13.V (K CHURCH.N)))
			(?X_B (?X_A (LOCATION_ADV.? GO.13.V)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.13.V) (K CHURCH.N)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K CHURCH.N) DESTINATION.N))
			(!R4 (NOT (?L1 = (K CHURCH.N))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P (K CHURCH.N))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (K CHURCH.N)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (K CHURCH.N))))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    ((ADV-A (DESTINATION_PREP.? (K CHURCH.N)))
	     ((ADV-A (TO.P (K CHURCH.N))) GO.13.V))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K CHURCH.N))) GO.13.V))))
			(?X_B
	   (?X_A ((ADV-A (DESTINATION_PREP.? (K CHURCH.N))) GO.13.V) (K CHURCH.N)))
			(?X_B (?X_A GO.13.V))
			(?X_B (?X_A GO.13.V (K CHURCH.N)))
			(?X_B (?X_A (LOCATION_ADV.? GO.13.V)))
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
	(EPI-SCHEMA ((?X_Q (COMPOSITE-SCHEMA-64.PR ?X_P ?X_J (K CHURCH.N))) ** ?E)
		(:ROLES
			(!R1 (?X_J UMBRELLA.N))
			(!R2 (?X_J (OF.P (K PAPER.N))))
			(!R3 (?X_I (OF.P ?X_J)))
			(!R4 (?X_J (IS.V ?X_K)))
			(!R5 (?X_P PARASOL.N))
			(!R6 (?X_P BLACK.A))
			(!R7 (?X_P SMALL.A))
			(!R8 (?X_P (OF.P (K SILK.N))))
			(!R9 (?X_Q AGENT.N))
			(!R10 ((K CHURCH.N) DESTINATION.N))
		)
		(:STEPS
			(?X_C (?X_Q ((ADV-A (FROM.P ?L1)) GO.13.V) (K CHURCH.N)))
			(?X_O (?X_Q (CARRY.V ?X_P)))
			(?X_D (?X_Q ((ADV-A (FROM.P ?L1)) GO.13.V) (K CHURCH.N)))
			(?X_M (?X_Q (CARRY.V ?X_P)))
			(?X_H (?X_A (CARRY.V ?X_J)))
			(?X_F (?X_J ((ADV-A (FROM.P ?X_B)) COME.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_O)))
			(!W2 (?X_C (BEFORE ?X_H)))
			(!W3 (?X_C (BEFORE ?X_F)))
			(!W4 (?X_O (BEFORE ?X_H)))
			(!W5 (?X_O (BEFORE ?X_F)))
			(!W6 (?X_D (BEFORE ?X_M)))
			(!W7 (?X_D (BEFORE ?X_H)))
			(!W8 (?X_D (BEFORE ?X_F)))
			(!W9 (?X_M (BEFORE ?X_H)))
			(!W10 (?X_M (BEFORE ?X_F)))
			(!W11 (?X_H (BEFORE ?X_F)))
		)
	)
	(
			"A agent go.132s church from L1."
			"A agent carries a parasol black small of silk."
			"A agent go.132s church from L1."
			"A agent carries a parasol black small of silk."
			"X_A carries a umbrella of paper is X_K."
			"A umbrella of paper is X_K comes from X_B."
	)
)



(
	(EPI-SCHEMA ((?X_D TAKE.5.V ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_A (PLUR FIELD.N)))
			(!R6 (?X_B (PERTAIN-TO ?X_D)))
			(!R7 (?X_B RED.A))
			(!R8 (?X_B WAGON.N))
			(!R9 (?X_C (HAS.V ?X_B)))
			(!R10 (?X_C LITTLE.A))
			(!R11 (?X_C BOY.N))
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
			(!W1 (?I1 PRECOND-OF ?X_F))
			(!W2 (?I2 PRECOND-OF ?X_F))
			(!W3 (?I3 PRECOND-OF ?X_F))
			(!W4 (?P1 POSTCOND-OF ?X_F))
			(!W5 (?X_F (AFTER ?X_G)))
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
	(EPI-SCHEMA ((?X_F
	              (COMPOSITE-SCHEMA-65.PR
	               (K
	                (L X
	                 (AND (X LITTLE.A) (X MAY.N)
	                      (X ((ADV-A (IN.P ?X_G)) RIDE.V)))))
	               ?X_D ?X_K))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D GOOD.A))
			(!R2 (?X_D RIDE.N))
			(!R3 (?X_E (PLUR FIELD.N)))
			(!R4 (?X_G RED.A))
			(!R5 (?X_G WAGON.N))
			(!R6 (?X_G (PERTAIN-TO ?X_J)))
			(!R7 (?X_F LITTLE.A))
			(!R8 (?X_F BOY.N))
			(!R9 (?X_F (HAS.V ?X_G)))
			(!R10 (?X_J AGENT.N))
			(!R11 (NOT (?X_K AGENT.N)))
			(!R12 (NOT (?X_J = ?X_K)))
		)
		(:STEPS
			(E204.SK
	   (?X_F
	    (LET.V
	     (K (L X (AND (X LITTLE.A) (X MAY.N) (X ((ADV-A (IN.P ?X_G)) RIDE.V))))))))
			(?X_C (?X_K ((MAY.AUX HAVE.V) ?X_D)))
			(E205.SK (?X_J TAKE.5.V ?X_K))
		)
		(:EPISODE-RELATIONS
			(!W1 (E204.SK BEFORE ?X_C))
			(!W2 (?X_C BEFORE E205.SK))
		)
	)
	(
			"A little boy has a red wagon of a agent lets little may riding."
			"X_K has a good ride may."
			"A agent take.144s X_K."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) COME.2.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B (AT.P (K WORK.N))))
			(!R6 (?X_B DOOR.N))
			(!R7 (?X_A (PERTAIN-TO ?X_C)))
			(!R8 (?X_A FRIEND.N))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) COME.2.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) COME.2.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) COME.2.V) ?L2))
			(?X_D (?X_C ((ADV-A (THROUGH.P ?X_B)) COME.2.V)))
			(?X_D (?X_C COME.2.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? COME.2.V)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) RUN.9.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.9.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.9.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.9.V) ?L2))
			(?X_C (?X_B (ALMOST.ADV ((ADV-A (INTO.P ?X_A)) RUN.9.V))))
			(?X_C (?X_B RUN.9.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? RUN.9.V)))
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
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.13.V ?X_C ?A) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?A ACTION.N))
			(!R3 (?X_B (AT.P (K WORK.N))))
			(!R4 (?X_B DOOR.N))
			(!R5 (?X_A FRIEND.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V ?X_C ?A)))
			(?G2 (?X_C (WANT.V (THAT (?X_C (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_C (((ADV-A (THROUGH.P ?X_B)) ASK.V) ?X_C ?A)))
			(?E2 (?X_C (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_D (?X_C (((ADV-A (THROUGH.P ?X_B)) ASK.V) ?X_C ?A)))
			(?X_D (?X_C (TELL.V ?X_C ?A)))
			(?X_D (?X_C (MAKE.V ?X_C ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.14.V ?X_B ?A) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B FRIEND.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_B (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V ?X_B ?A)))
			(?G2 (?X_A (WANT.V (THAT (?X_A (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_A ((ALMOST.ADV ((ADV-A (INTO.P ?X_B)) ASK.V)) ?X_B ?A)))
			(?E2 (?X_B (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_C (?X_A ((ALMOST.ADV ((ADV-A (INTO.P ?X_B)) ASK.V)) ?X_B ?A)))
			(?X_C (?X_A (TELL.V ?X_B ?A)))
			(?X_C (?X_A (MAKE.V ?X_B ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
	(EPI-SCHEMA ((?X_A ((ALMOST.ADV ((ADV-A (INTO.P ?X_B)) INFORM.7.V)) ?X_B ?I))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B FRIEND.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_B (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_C (?X_A TELL.V ?X_B ?I))
			(?X_C (?X_A LET.V ?X_B (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C (((ADV-A (THROUGH.P ?X_A)) INFORM.8.V) ?X_C ?I)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?I INFORMATION.N))
			(!R3 (NOT (?I ACTION.N)))
			(!R4 (?X_A (AT.P (K WORK.N))))
			(!R5 (?X_A DOOR.N))
			(!R6 (?X_B FRIEND.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_D (?X_C TELL.V ?X_C ?I))
			(?X_D (?X_C LET.V ?X_C (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-66.PR ?X_C ?L2 ?A ?X_I ?X_J ?I)) ** ?E)
		(:ROLES
			(!R1 (?X_C PIECE.N))
			(!R2 (?X_C TWO.N))
			(!R3 (?X_C PURPLE.A))
			(!R4 (?X_H (AT.P (K WORK.N))))
			(!R5 (?X_H DOOR.N))
			(!R6 (?L2 DESTINATION.N))
			(!R7 (?A ACTION.N))
			(!R8 (?X_J AGENT.N))
			(!R9 (?X_I FRIEND.N))
			(!R10 (?X_I (PERTAIN-TO ?X_J)))
			(!R11 (NOT (?I ACTION.N)))
			(!R12 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_G (?X_J ((ADV-A (FROM.P ?L1)) COME.2.V) ?L2))
			(?X_G (?X_J REQUEST_ACTION.13.V ?X_J ?A))
			(?X_G (?X_J (((ADV-A (THROUGH.P ?X_H)) INFORM.8.V) ?X_J ?I)))
			(?X_E (?X_J ((ADV-A (FROM.P ?L1)) RUN.9.V) ?L2))
			(?X_E (?X_J REQUEST_ACTION.14.V ?X_I ?A))
			(?X_E (?X_J ((ALMOST.ADV ((ADV-A (INTO.P ?X_I)) INFORM.7.V)) ?X_I ?I)))
			(?X_B (?X_I (WEAR.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
			(!W2 (?X_G (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A agent come.161s a destination from L1."
			"A agent request action.178s a agent a action."
			"A agent inform.176s a agent a information through a at work door."
			"A agent run.162s a destination from L1."
			"A agent request action.180s a friend of a agent a action."
			"A agent inform.175s a friend of a agent a information almost into a friend of a agent."
			"A friend of a agent wears a piece two purple."
	)
)



(
	(EPI-SCHEMA ((?X_A ((OUT.PRT TAKE.6.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_A TIRED.A))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
			(!R7 (?X_B (K WATER.N) BOTTLE.N))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (BEFORE ?X_D)))
			(!W6 (?X_E (SAME-TIME ?X_D)))
			(!W7 (?X_E (RIGHT-AFTER ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((OUT.PRT TAKE.7.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B (K WATER.N) BOTTLE.N))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
			(!R7 (?X_A TIRED.A))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (SAME-TIME ?X_F)))
			(!W6 (?X_C (RIGHT-AFTER ?X_D)))
			(!W7 (?X_E (BEFORE ?X_F)))
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
	              (COMPOSITE-SCHEMA-67.PR (KA WALK.V)
	               (KA (WALK.V (KA (FIND.V (K WATER.N))))) ?X_K))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I GROUND.N))
			(!R2 (?X_K (K WATER.N) BOTTLE.N))
			(!R3 (?X_K (PERTAIN-TO ?X_J)))
			(!R4 (?X_J TIRED.A))
			(!R5 (?X_J MAN.N))
			(!R6 (NOT (?X_K AGENT.N)))
			(!R7 (NOT (?X_J = ?X_K)))
		)
		(:STEPS
			(?X_H (?X_J (DOWN.ADV ((ADV-A (ON.P ?X_I)) SIT.V))))
			(?X_A (?X_J (OF.P (KA WALK.V))))
			(?X_F (?X_J ((OUT.PRT TAKE.6.V) ?X_K)))
			(?X_B (?X_J ((OUT.PRT TAKE.7.V) ?X_K)))
			(?X_D (MUST.AUX-S (?X_J (KEEP.V (KA (WALK.V (KA (FIND.V (K WATER.N)))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_A)))
			(!W2 (?X_H (BEFORE ?X_B)))
			(!W3 (?X_H (BEFORE ?X_D)))
			(!W4 (?X_A (BEFORE ?X_B)))
			(!W5 (?X_A (BEFORE ?X_D)))
			(!W6 (?X_F (BEFORE ?X_B)))
			(!W7 (?X_F (BEFORE ?X_D)))
			(!W8 (?X_B (BEFORE ?X_D)))
		)
	)
	(
			"A tired man sits down on a ground."
			"A tired man is of."
			"A tired man take.197s a of a tired man out."
			"A tired man take.199s a of a tired man out."
			"A tired man keeps walking finding water must."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.14.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B STORE.N))
			(!R6 (?X_B TODAY.N))
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.14.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.14.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.14.V) ?X_B))
			(?X_C (?X_A GO.14.V))
			(?X_C (?X_A GO.14.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.14.V)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-68.PR ?X_E (SIX.D (PLUR DOLLAR.N)) ?X_H)) **
	             ?E)
		(:ROLES
			(!R1 (?X_E (PLUR CHIP.N)))
			(!R2 (?X_H DESTINATION.N))
			(!R3 (?X_H STORE.N))
			(!R4 (?X_H TODAY.N))
			(!R5 (?X_I AGENT.N))
		)
		(:STEPS
			(?X_G (?X_I ((ADV-A (FROM.P ?L1)) GO.14.V) ?X_H))
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
			"A agent go.203s a destination store today from L1."
			"A agent sees a chips."
			"A chips are six dollars."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) SURVIVE.1.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A BIRD.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) SURVIVE.1.V)))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) SURVIVE.1.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) SURVIVE.1.V) ?L2))
			(?X_B (?X_A SURVIVE.1.V))
			(?X_B (?X_A SURVIVE.1.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? SURVIVE.1.V)))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (IN.P ?X_C)) PUT.3.V) ?X_B)) ** ?X_D)
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
			(?X_D (?X_A ((ADV-A (INTO.P ?X_C)) PUT.3.V) ?X_B))
			(?X_D (?X_A ((ADV-A (INSIDE.P ?X_C)) PUT.3.V) ?X_B))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-69.PR ?L2 ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_N SMALLER-THAN ?X_M))
			(!R2 (?X_M BOX.N))
			(!R3 (?X_M SHOE.N))
			(!R4 (?X_L AGENT.N))
			(!R5 (NOT (?X_M AGENT.N)))
			(!R6 (?X_N BIRD.N))
			(!R7 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_K (?X_L (FIND.V ?X_N)))
			(?X_I (?X_L (((ADV-A (IN.P ?X_M)) PUT.3.V) ?X_N)))
			(?X_G (?X_L (FED.V ?X_N)))
			(?X_E (?X_N ((ADV-A (FROM.P ?L1)) SURVIVE.1.V) ?L2))
			(?X_C (?X_L (((ADV-A (IN.P ?X_A)) KEEP.V) ?X_N)))
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
			"A agent finds a bird."
			"A agent put.210s a bird in a box shoe."
			"A agent fed a bird."
			"A bird survive.214s a destination from L1."
			"A agent keeps a bird in X_A."
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.7.V (K (PLUR GROCERY.N))) ** ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 ((K (PLUR GROCERY.N)) ENTITY.N))
			(!R3 ((K (PLUR GROCERY.N)) SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A WIFE.N))
			(!R8 (?L2 HOME.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT ((K (PLUR GROCERY.N)) ((ADV-A (AT.P ?L2)) BE.V))))))
		)
		(:PRECONDS
			(?I1 ((K (PLUR GROCERY.N)) ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 ((K (PLUR GROCERY.N)) ((ADV-A (AT.P ?L2)) BE.V)))
		)
		(:PARAPHRASES
			(?X_C (?X_B ((ADV-A (TO.P ?L2)) TAKE.V) (K (PLUR GROCERY.N))))
			(?X_C (?X_B ((ADV-A (TO.P ?L2)) CARRY.V) (K (PLUR GROCERY.N))))
			(?X_C (?X_B ((ADV-A (TO.P ?L2)) BRING.V) (K (PLUR GROCERY.N))))
			(?X_C (?X_B TAKE.V (K (PLUR GROCERY.N))))
			(?X_C (?X_B CARRY.V (K (PLUR GROCERY.N))))
			(?X_C (?X_B (BRING.V (K (PLUR GROCERY.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?P1 POSTCOND-OF ?X_C))
			(!W3 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A MAKE.6.V
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-70.PR ?X_L (K (PLUR GROCERY.N))
	               (KE (?X_O ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_L BAG.N))
			(!R2 (?X_M GROUND.N))
			(!R3 ((K (PLUR GROCERY.N)) ENTITY.N))
			(!R4 ((K (PLUR GROCERY.N)) SMALLER-THAN.N ?X_N))
			(!R5 (?X_O WIFE.N))
			(!R6 (?X_O (PERTAIN-TO ?X_N)))
			(!R7 (?X_N MAN.N))
			(!R8
	   (NOT ((KE (?X_O ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))) AGENT.N)))
		)
		(:STEPS
			(?X_K (?X_N (((ADV-A (ON.P ?X_M)) FIND.V) ?X_L)))
			(?X_I (?X_N (INSIDE.ADV LOOK.V)))
			(?X_G (?X_L (BE.V (K (PLUR GROCERY.N)))))
			(?X_C (?X_O ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N)))
			(?X_E (?X_N TRANSPORT_OBJECT.7.V (K (PLUR GROCERY.N))))
			(?X_A
	   (?X_N MAKE.6.V
	    (KE (?X_O ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_G)))
			(!W3 (?X_K (BEFORE ?X_E)))
			(!W4 (?X_K (BEFORE ?X_A)))
			(!W5 (?X_I (BEFORE ?X_G)))
			(!W6 (?X_I (BEFORE ?X_E)))
			(!W7 (?X_I (BEFORE ?X_A)))
			(!W8 (?X_G (BEFORE ?X_E)))
			(!W9 (?X_G (BEFORE ?X_A)))
			(!W10 (?X_C (BEFORE ?X_A)))
			(!W11 (?X_E (BEFORE ?X_A)))
		)
	)
	(
			"A man finds a bag on a ground."
			"A man looks inside."
			"A bag is grocerys."
			"A wife of a man is with grocerys dinner."
			"A man transport object.218s grocerys."
			"A man make.225s a wife of a man with grocerys dinner."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-71.PR (K BRIGHT.A) ?X_G)) ** ?E)
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
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-72.PR (TWO.D (PLUR DOG.N)))) ** ?E)
		(:STEPS
			(?X_C (?X_A (HAVE.V (TWO.D (PLUR DOG.N)))))
		)
	)
	(
			"X_A has two dogs."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.15.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.15.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.15.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.15.V) ?L2))
			(?X_C (?X_B ((ADV-A (WITH.P ?X_A)) GO.15.V)))
			(?X_C (?X_B GO.15.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? GO.15.V)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.16.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C LOCAL.A))
			(!R6 (?X_C POND.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_A (PLUR FRIEND.N)))
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
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) GO.16.V)))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.16.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.16.V) ?X_C))
			(?X_D (?X_B GO.16.V))
			(?X_D (?X_B GO.16.V ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? GO.16.V)))
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
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.8.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C FISH.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 ((KA (EAT.V ?X_C)) DESTINATION.N))
			(!R6 (?X_C LARGE.A))
			(!R7 (?X_A (PLUR FRIEND.N)))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C ((ADV-A (AT.P (KA (EAT.V ?X_C)))) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_C ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C ((ADV-A (AT.P (KA (EAT.V ?X_C)))) BE.V)))
		)
		(:PARAPHRASES
			(?X_D (?X_B ((ADV-A (TO.P (KA (EAT.V ?X_C)))) TAKE.V) ?X_C))
			(?X_D (?X_B ((ADV-A (TO.P (KA (EAT.V ?X_C)))) CARRY.V) ?X_C))
			(?X_D
	   (?X_B
	    (((ADV-A (TO.P (KA (EAT.V ?X_C))))
	      (BACK.PRT ((ADV-A (FOR.P (KA (EAT.V ?X_C)))) BRING.V)))
	     ?X_C)))
			(?X_D (?X_B (LOCATION_ADV.? TAKE.V) ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? CARRY.V) ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? BRING.V) ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?P1 POSTCOND-OF ?X_D))
			(!W3 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.15.V (KA ((ADV-A (WITH.P ?X_B)) GO.V))) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA ((ADV-A (WITH.P ?X_B)) GO.V)) ACTION.N))
			(!R3 (?X_B (PERTAIN-TO ?X_A)))
			(!R4 (?X_B (PLUR FRIEND.N)))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA ((ADV-A (WITH.P ?X_B)) GO.V)) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_D (?X_A (WANT.V (KA ((ADV-A (WITH.P ?X_B)) GO.V)))))
			(?X_D (?X_A (LIKE.V (KA ((ADV-A (WITH.P ?X_B)) GO.V)))))
			(?X_D (?X_A (LOVE.V (KA ((ADV-A (WITH.P ?X_B)) GO.V)))))
			(?X_D (?X_A (ENJOY.V (KA ((ADV-A (WITH.P ?X_B)) GO.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (RIGHT-AFTER ?X_C)))
			(!W2 (?X_D (SAME-TIME ?X_F)))
			(!W3 (?X_E (BEFORE ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-73.PR (K FISHING.N) ?L2 ?X_M ?X_N
	               (KA ((ADV-A (WITH.P ?X_L)) GO.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?L2 DESTINATION.N))
			(!R2 (?X_L (PERTAIN-TO ?X_O)))
			(!R3 (?X_L (PLUR FRIEND.N)))
			(!R4 ((KA ((ADV-A (WITH.P ?X_L)) GO.V)) ACTION.N))
			(!R5 (?X_M DESTINATION.N))
			(!R6 (?X_M LOCAL.A))
			(!R7 (?X_M POND.N))
			(!R8 ((KA (EAT.V ?X_N)) DESTINATION.N))
			(!R9 (?X_N SMALLER-THAN.N ?X_O))
			(!R10 (?X_N LARGE.A))
			(!R11 (?X_N FISH.N))
			(!R12 (?X_O AGENT.N))
		)
		(:STEPS
			(?X_K (?X_O (LOVE.V (K FISHING.N))))
			(?X_I (?X_O ((ADV-A (FROM.P ?L1)) GO.15.V) ?L2))
			(?X_A (?X_O ENJOY_ACTION.15.V (KA ((ADV-A (WITH.P ?X_L)) GO.V))))
			(?X_G (?X_O ((ADV-A (FROM.P ?L1)) GO.16.V) ?X_M))
			(?X_E (?X_O (CATCH.V ?X_N)))
			(?X_C (?X_O TRANSPORT_OBJECT.8.V ?X_N))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_A)))
			(!W2 (?X_K (BEFORE ?X_G)))
			(!W3 (?X_K (BEFORE ?X_E)))
			(!W4 (?X_K (BEFORE ?X_C)))
			(!W5 (?X_I (BEFORE ?X_A)))
			(!W6 (?X_I (BEFORE ?X_G)))
			(!W7 (?X_I (BEFORE ?X_E)))
			(!W8 (?X_I (BEFORE ?X_C)))
			(!W9 (?X_A (BEFORE ?X_G)))
			(!W10 (?X_A (BEFORE ?X_E)))
			(!W11 (?X_A (BEFORE ?X_C)))
			(!W12 (?X_G (BEFORE ?X_E)))
			(!W13 (?X_G (BEFORE ?X_C)))
			(!W14 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A agent loves fishing."
			"A agent go.289s a destination from L1."
			"A agent enjoy action.286s with a friends of a agent going."
			"A agent go.291s a destination local pond from L1."
			"A agent catches a large fish."
			"A agent transport object.277s a large fish."
	)
)



(
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-74.PR ?X_F (KE (?X_P (HEAR.V ?X_F))) ?X_O ?X_P
	               (KA (UP.PRT LOCK.V) ?X_L) (KE (?X_P (MORE.ADV AFRAID.A)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F NOISE.N))
			(!R2 (?X_O MOM.N))
			(!R3 (?X_O (PERTAIN-TO ?X_K)))
			(!R4 (?X_L HOUSE.N))
			(!R5 (?X_P BOY.N))
			(!R6 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_E (?X_P (HEAR.V ?X_F)))
			(?X_H (?X_P (THINK.V (KE (?X_P (HEAR.V ?X_F))))))
			(?X_B (?X_P (CALL.V ?X_O)))
			(?X_J (?X_P (CALL.V ?X_O)))
			(?X_C (?X_O (TELL.V ?X_P (KA (UP.PRT LOCK.V) ?X_L))))
			(?X_N (?X_O (TELL.V ?X_P (KA (UP.PRT LOCK.V) ?X_L))))
			(?X_R (?X_A (MAKE.V (KE (?X_P (MORE.ADV AFRAID.A))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_H)))
			(!W2 (?X_E (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_J)))
			(!W4 (?X_E (BEFORE ?X_C)))
			(!W5 (?X_E (BEFORE ?X_N)))
			(!W6 (?X_E (BEFORE ?X_R)))
			(!W7 (?X_H (BEFORE ?X_B)))
			(!W8 (?X_H (BEFORE ?X_J)))
			(!W9 (?X_H (BEFORE ?X_C)))
			(!W10 (?X_H (BEFORE ?X_N)))
			(!W11 (?X_H (BEFORE ?X_R)))
			(!W12 (?X_B (BEFORE ?X_J)))
			(!W13 (?X_B (BEFORE ?X_C)))
			(!W14 (?X_B (BEFORE ?X_N)))
			(!W15 (?X_B (BEFORE ?X_R)))
			(!W16 (?X_J (BEFORE ?X_C)))
			(!W17 (?X_J (BEFORE ?X_N)))
			(!W18 (?X_J (BEFORE ?X_R)))
			(!W19 (?X_C (BEFORE ?X_N)))
			(!W20 (?X_C (BEFORE ?X_R)))
			(!W21 (?X_N (BEFORE ?X_R)))
		)
	)
	(
			"A boy hears a noise."
			"A boy thinks a boy hears a noise."
			"A boy calls a mom of a boy of X_K."
			"A boy calls a mom of a boy of X_K."
			"A mom of a boy of X_K tells a boy up lock a house."
			"A mom of a boy of X_K tells a boy up lock a house."
			"X_A makes a boy more afraid."
	)
)



(
	(EPI-SCHEMA ((?X_A (((ADV-A (IN.P ?X_C)) PUT.4.V) ?X_B)) ** ?X_D)
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-75.PR (KE (?X_K TURTLE.V)) ?X_K)) ** ?E)
		(:ROLES
			(!R1 (?X_C HOUR.N))
			(!R2 (?X_J AGENT.N))
			(!R3 (?X_K SMALLER-THAN ?X_L))
			(!R4 (?X_K (SO.ADV TINY.A)))
			(!R5 (?X_K BABY.N))
			(!R6 (?X_K COUPLE.N))
			(!R7 (NOT (?X_L AGENT.N)))
			(!R8 (?X_L BOX.N))
		)
		(:STEPS
			(?X_I (?X_K TURTLE.V))
			(?X_G (?X_J (FIND.V (KE (?X_K TURTLE.V)))))
			(?X_B (?X_J (((ADV-A (FOR.P ?X_C)) KEEP.V) ?X_K)))
			(?X_E (?X_J (((ADV-A (IN.P ?X_L)) PUT.4.V) ?X_K)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_G)))
			(!W2 (?X_I (BEFORE ?X_B)))
			(!W3 (?X_G (BEFORE ?X_B)))
		)
	)
	(
			"A so tiny baby couple turtles."
			"A agent finds a so tiny baby couple turtles."
			"A agent keeps a so tiny baby couple for a hour."
			"A agent put.303s a so tiny baby couple in a box."
	)
)



(
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.16.V ?X_B ?A) ** ?X_C)
		(:ROLES
			(!R1 (?X_A BOY.N))
			(!R2 (?X_B GIRL.N))
			(!R3 (?A ACTION.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V ?X_B ?A)))
			(?G2 (?X_A (WANT.V (THAT (?X_A (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_A (ASK.V ?X_B ?A)))
			(?E2 (?X_B (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_C (?X_A (ASK.V ?X_B ?A)))
			(?X_C (?X_A (TELL.V ?X_B ?A)))
			(?X_C (?X_A (MAKE.V ?X_B ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.17.V ?X_A ?A) ** ?X_B)
		(:ROLES
			(!R1 (?X_A BOY.N))
			(!R2 (?A ACTION.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V ?X_A ?A)))
			(?G2 (?X_A (WANT.V (THAT (?X_A (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_A (ASK.V ?X_A ?A)))
			(?E2 (?X_A (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_B (?X_A (ASK.V ?X_A ?A)))
			(?X_B (?X_A (TELL.V ?X_A ?A)))
			(?X_B (?X_A (MAKE.V ?X_A ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
			(!W3 (?X_B (AT-ABOUT ?X_C)))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-76.PR (KA LEAVE.V) ?X_I ?X_J ?A)) ** ?E)
		(:ROLES
			(!R1 (?X_G SHOW.N))
			(!R2 (?X_H COUPLE.N))
			(!R3 (?X_I GIRL.N))
			(!R4 (?X_J BOY.N))
			(!R5 (?A ACTION.N))
		)
		(:STEPS
			(?X_F (?X_H ((ADV-A (TO.P ?X_G)) GO.V)))
			(?X_D (?X_I (ASK.V (KA LEAVE.V))))
			(?X_B (?X_J REQUEST_ACTION.16.V ?X_I ?A))
			(?X_B (?X_J REQUEST_ACTION.17.V ?X_J ?A))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A couple goes to a show."
			"A girl asks leaving."
			"A boy request action.325s a girl a action."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.17.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C BALL.N))
			(!R6 (?X_C PASS.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_A ARM.N))
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
	    ((ADV-A (DESTINATION_PREP.? ?X_C))
	     (OUT.ADV ((ADV-A (FOR.P ?X_C)) GO.17.V)))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.17.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.17.V) ?X_C))
			(?X_D (?X_B GO.17.V))
			(?X_D (?X_B GO.17.V ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? GO.17.V)))
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
	(EPI-SCHEMA ((?X_B INFORM.9.V ?X_C ?I) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_C PASS.N))
			(!R6 (?X_C BALL.N))
			(!R7 (?X_A ARM.N))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_D (?X_B TELL.V ?X_C ?I))
			(?X_D (?X_B LET.V ?X_C (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C PLAY.6.V) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_B TOY.N))
			(!R3 (NOT (?X_B AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A ARM.N))
			(!R7 (?X_A (PERTAIN-TO ?X_C)))
			(!R8 (?X_B BALL.N))
			(!R9 (?X_B PASS.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?X_B))
		)
		(:POSTCONDS
			(?P1 (?X_C EXPERIENCE.V (K PLEASURE.N)))
		)
		(:PARAPHRASES
			(?X_D (?X_C ((ADV-A (WITH.P ?X_B)) PLAY.6.V)))
			(?X_D (?X_C PLAY.6.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_D PLAY.7.V) ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C TOY.N))
			(!R3 (NOT (?X_C AGENT.N)))
			(!R4 (?X_B GAME.N))
			(!R5 (NOT (?X_B AGENT.N)))
			(!R6 (?X_A ARM.N))
			(!R7 (?X_A (PERTAIN-TO ?X_D)))
			(!R8 (?X_C WINDOW.N))
			(!R9 (?X_B PASS.N))
			(!R10 (?X_B BALL.N))
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
		(:PARAPHRASES
			(?X_E (?X_D ((ADV-A (WITH.P ?X_C)) PLAY.7.V)))
			(?X_E (?X_D PLAY.7.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-77.PR ?X_J (KA HEAL.V) ?X_M ?I)) ** ?E)
		(:ROLES
			(!R1 (?X_J ARM.N))
			(!R2 (?X_J (PERTAIN-TO ?X_L)))
			(!R3 (?X_K WINDOW.N))
			(!R4 (?X_M DESTINATION.N))
			(!R5 (?X_L AGENT.N))
			(!R6 (NOT (?I ACTION.N)))
			(!R7 (?X_M AGENT.N))
			(!R8 (?X_M PASS.N))
			(!R9 (?X_M BALL.N))
			(!R10 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_C (MUST.AUX-S (?X_L (LET.V ?X_J (KA HEAL.V)))))
			(?X_I (?X_L PLAY.6.V))
			(?X_I (?X_L PLAY.7.V))
			(?X_G (?X_L ((ADV-A (FROM.P ?L1)) GO.17.V) ?X_M))
			(?X_E (?X_L INFORM.9.V ?X_M ?I))
			(?X_A (MUST.AUX-S (?X_L (LET.V ?X_J (KA HEAL.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_A)))
			(!W2 (?X_I (BEFORE ?X_G)))
			(!W3 (?X_I (BEFORE ?X_E)))
			(!W4 (?X_I (BEFORE ?X_A)))
			(!W5 (?X_G (BEFORE ?X_E)))
			(!W6 (?X_G (BEFORE ?X_A)))
			(!W7 (?X_E (BEFORE ?X_A)))
		)
	)
	(
			"A agent lets a arm of a agent healing must."
			"A agent play.4s."
			"A agent play.1s."
			"A agent go.9s a destination agent pass ball from L1."
			"A agent inform.6s a destination agent pass ball a information."
			"A agent lets a arm of a agent healing must."
	)
)



(
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.18.V ?X_C ?A) ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?A ACTION.N))
			(!R3 (?X_A (PERTAIN-TO ?X_C)))
			(!R4 (?X_A GUITAR.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V ?X_C ?A)))
			(?G2 (?X_C (WANT.V (THAT (?X_C (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_C (ASK.V ?X_C ?A)))
			(?E2 (?X_C (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_D (?X_C (ASK.V ?X_C ?A)))
			(?X_D (?X_C (TELL.V ?X_C ?A)))
			(?X_D (?X_C ((OFF.PRT ((ADV-A (OF.P ?X_B)) MAKE.V)) ?X_C ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
			(!W1 (?X_C (SAME-TIME ?X_F)))
			(!W2 (?X_C (RIGHT-AFTER ?X_D)))
			(!W3 (?X_E (BEFORE ?X_F)))
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
	(EPI-SCHEMA ((?X_B (OFF.PRT ((ADV-A (OF.P IT86.SK)) PLAY.9.V))) ** ?X_C)
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
			(?X_C (?X_B ((ADV-A (WITH.P ?T)) PLAY.9.V)))
			(?X_C (?X_B PLAY.9.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
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
	(EPI-SCHEMA ((?X_B WRITE.1.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_C (PRETTY.ADV GOOD.A)))
			(!R4 (?X_C SONG.N))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A GUITAR.N))
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
	(EPI-SCHEMA ((?X_P (COMPOSITE-SCHEMA-78.PR ?X_O ?X_A ?X_B ?X_P ?A ?O ?X_Q)) ** ?E)
		(:ROLES
			(!R1 (?X_O GUITAR.N))
			(!R2 (?X_O (PERTAIN-TO ?X_P)))
			(!R3 (?A ACTION.N))
			(!R4 (NOT (?O AGENT.N)))
			(!R5 (?X_Q (PRETTY.ADV GOOD.A)))
			(!R6 (?X_Q SONG.N))
			(!R7 (?X_P MAN.N))
			(!R8 (NOT (?X_Q AGENT.N)))
		)
		(:STEPS
			(?X_N (?X_P (PLAY.V ?X_O)))
			(?X_C (?X_P PLAY.8.V))
			(?X_D (?X_A THING.N))
			(?X_L (?X_P (FIND.V ?X_A)))
			(?X_J (?X_P ((DOWN.PRT WRITE.V) ?X_B)))
			(?X_H (?X_P REQUEST_ACTION.18.V ?X_P ?A))
			(?X_H (?X_P (OFF.PRT ((ADV-A (OF.P ?X_B)) PLAY.9.V))))
			(?X_H (?X_P ((OFF.PRT ((ADV-A (OF.P ?X_B)) BUILD.1.V)) ?O)))
			(?X_F (?X_P WRITE.1.V ?X_Q))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_C)))
			(!W2 (?X_N (BEFORE ?X_D)))
			(!W3 (?X_N (BEFORE ?X_L)))
			(!W4 (?X_N (BEFORE ?X_J)))
			(!W5 (?X_N (BEFORE ?X_H)))
			(!W6 (?X_N (BEFORE ?X_F)))
			(!W7 (?X_C (BEFORE ?X_D)))
			(!W8 (?X_C (BEFORE ?X_L)))
			(!W9 (?X_C (BEFORE ?X_J)))
			(!W10 (?X_C (BEFORE ?X_H)))
			(!W11 (?X_C (BEFORE ?X_F)))
			(!W12 (?X_D (BEFORE ?X_J)))
			(!W13 (?X_D (BEFORE ?X_H)))
			(!W14 (?X_D (BEFORE ?X_F)))
			(!W15 (?X_L (BEFORE ?X_J)))
			(!W16 (?X_L (BEFORE ?X_H)))
			(!W17 (?X_L (BEFORE ?X_F)))
			(!W18 (?X_J (BEFORE ?X_H)))
			(!W19 (?X_J (BEFORE ?X_F)))
			(!W20 (?X_H (BEFORE ?X_F)))
		)
	)
	(
			"A man plays a guitar of a man."
			"A man play.23s."
			"X_A is thing."
			"A man finds X_A."
			"A man writes X_B down."
			"A man request action.21s a man a action."
			"A man play.24s off of X_B."
			"A man build.18s O off of X_B."
			"A man write.19s a pretty good song."
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.9.V ?X_B) ** ?X_D)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?X_B CAT.N))
			(!R3 (?X_B SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_C DESTINATION.N))
			(!R6 (?X_C VET.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B ((ADV-A (AT.P ?X_C)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_B ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B ((ADV-A (AT.P ?X_C)) BE.V)))
		)
		(:PARAPHRASES
			(?X_D (?X_A (((ADV-A (TO.P ?X_C)) TAKE.V) ?X_B)))
			(?X_D (?X_A ((ADV-A (TO.P ?X_C)) CARRY.V) ?X_B))
			(?X_D (?X_A ((ADV-A (TO.P ?X_C)) BRING.V) ?X_B))
			(?X_D (?X_A (LOCATION_ADV.? TAKE.V) ?X_B))
			(?X_D (?X_A (LOCATION_ADV.? CARRY.V) ?X_B))
			(?X_D (?X_A (LOCATION_ADV.? BRING.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?P1 POSTCOND-OF ?X_D))
			(!W3 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_E)))
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
	              (COMPOSITE-SCHEMA-79.PR (KE (?X_M SICK.A)) (K BETTER.A) ?X_N ?X_M))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M SMALLER-THAN.N ?X_L))
			(!R2 (?X_K VET.N))
			(!R3 (?X_L MAN.N))
			(!R4 (NOT (?X_L = ?X_M)))
			(!R5 (?X_N MEDICINE.N))
			(!R6 (?X_M CAT.N))
			(!R7 (NOT (?X_M = ?X_N)))
		)
		(:STEPS
			(?X_J (?X_L TRANSPORT_OBJECT.9.V ?X_M))
			(?X_J (?X_L (((ADV-A (TO.P ?X_K)) TAKE.9.V) ?X_M)))
			(?X_H (?X_K (CALL.V (KE (?X_M SICK.A)))))
			(?X_F (?X_L (GET.V ?X_N)))
			(?X_D (?X_M TAKE.8.V ?X_N))
			(?X_B (?X_M (GET.V (K BETTER.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_F)))
			(!W3 (?X_J (BEFORE ?X_D)))
			(!W4 (?X_J (BEFORE ?X_B)))
			(!W5 (?X_H (BEFORE ?X_F)))
			(!W6 (?X_H (BEFORE ?X_D)))
			(!W7 (?X_H (BEFORE ?X_B)))
			(!W8 (?X_F (BEFORE ?X_D)))
			(!W9 (?X_F (BEFORE ?X_B)))
			(!W10 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A man transport object.31s a cat."
			"A man take.36s a cat to a vet."
			"A vet calls a cat sick."
			"A man gets a medicine."
			"A cat take.35s a medicine."
			"A cat gets better."
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.10.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B ENTITY.N))
			(!R3 (?X_B SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?L2 HOME.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B ((ADV-A (AT.P ?L2)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_B ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B ((ADV-A (AT.P ?L2)) BE.V)))
		)
		(:PARAPHRASES
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) TAKE.V) ?X_B))
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) CARRY.V) ?X_B))
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) BRING.V) ?X_B))
			(?X_C (?X_A (((ADV-A (WITH.P ?X_A)) TAKE.V) ?X_B)))
			(?X_C (?X_A CARRY.V ?X_B))
			(?X_C (?X_A BRING.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?P1 POSTCOND-OF ?X_C))
			(!W3 (?X_C (AFTER ?X_D)))
			(!W4 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A
	              (GIVE.6.V ?X_B (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N)))))))
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
		(:PARAPHRASES
			(?X_D
	   (?X_A
	    ((ADV-A (TO.P ?X_B))
	     (GIVE.6.V (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N)))))))))
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
	(EPI-SCHEMA ((?X_A
	              (((ADV-A (AT.P ?X_F)) ((ADV-A (WITH.P ?X_A)) TAKE.10.V)) ?X_B))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_F HOME.N))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AFTER ?X_D)))
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
	(EPI-SCHEMA ((?X_R
	              (COMPOSITE-SCHEMA-80.PR ?X_B ?X_H ?X_Q
	               (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N))))) ?X_S))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G FEMALE.A))
			(!R2 (?X_G AGENT.N))
			(!R3 (?X_H FLOWER.N))
			(!R4 (?X_H RED.A))
			(!R5 (?X_Q AGENT.N))
			(!R6 (NOT ((TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N))))) AGENT.N)))
			(!R7 (?X_P FATHER.N))
			(!R8 (?X_P (PERTAIN-TO ?X_Q)))
			(!R9 (?X_S SMALLER-THAN.N ?X_R))
			(!R10 (?X_R AGENT.N))
			(!R11 (NOT (?X_S AGENT.N)))
			(!R12 (NOT (?X_R = ?X_S)))
		)
		(:STEPS
			(?X_L (?X_A (((ADV-A (TO.P ?X_Q)) GIVE.V) ?X_B)))
			(?X_J (?X_P (GIVE.6.V ?X_Q (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N))))))))
			(?X_C (?X_Q (KEEP.V ?X_H)))
			(?X_D (?X_G (LIKE.V ?X_S)))
			(?X_E (?X_R TRANSPORT_OBJECT.10.V ?X_S))
			(?X_E (?X_R (((ADV-A (AT.P ?X_F)) ((ADV-A (WITH.P ?X_R)) TAKE.10.V)) ?X_S)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_J)))
			(!W2 (?X_L (BEFORE ?X_C)))
			(!W3 (?X_L (BEFORE ?X_D)))
			(!W4 (?X_L (BEFORE ?X_E)))
			(!W5 (?X_J (BEFORE ?X_C)))
			(!W6 (?X_J (BEFORE ?X_D)))
			(!W7 (?X_J (BEFORE ?X_E)))
		)
	)
	(
			"X_A gives X_B to a agent."
			"A father of a agent give.48s a agent two red one."
			"A agent keeps a flower red."
			"A female agent likes X_S."
			"A agent transport object.47s X_S."
			"A agent take.54s X_S at X_F with a agent."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) FLOAT.1.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B RIVER.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
			(!R7 (?X_A BOAT.N))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) FLOAT.1.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) FLOAT.1.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) FLOAT.1.V) ?L2))
			(?X_D (?X_C ((ADV-A (DOWN.P ?X_B)) FLOAT.1.V)))
			(?X_D (?X_C FLOAT.1.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? FLOAT.1.V)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) CLIMB.1.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PERTAIN-TO ?X_C)))
			(!R6 (?X_A BOAT.N))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) CLIMB.1.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) CLIMB.1.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) CLIMB.1.V) ?L2))
			(?X_D
	   (?X_C
	    ((ADV-A (ON.P (K (L X (AND (X TOP.N) (X (OF.P (THE.D BOAT.N))))))))
	     CLIMB.1.V)))
			(?X_D (?X_C CLIMB.1.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? CLIMB.1.V)))
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-81.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_M BOAT.N))
			(!R2 (?X_L RIVER.N))
			(!R3 (?X_M (PERTAIN-TO ?X_N)))
			(!R4 (?X_N MAN.N))
			(!R5 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_I (?X_M (OVER.PRT TIP.V)))
			(?X_K (?X_N ((ADV-A (FROM.P ?L1)) FLOAT.1.V) ?L2))
			(?X_A (?X_M (OVER.PRT TIP.V)))
			(?X_G (?X_N ((ADV-A (FROM.P ?L1)) CLIMB.1.V) ?L2))
			(?X_E (?X_N RESCUE.V))
			(?X_C (?X_N RESCUE.V))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_A)))
			(!W2 (?X_I (BEFORE ?X_G)))
			(!W3 (?X_I (BEFORE ?X_E)))
			(!W4 (?X_I (BEFORE ?X_C)))
			(!W5 (?X_K (BEFORE ?X_A)))
			(!W6 (?X_K (BEFORE ?X_G)))
			(!W7 (?X_K (BEFORE ?X_E)))
			(!W8 (?X_K (BEFORE ?X_C)))
			(!W9 (?X_A (BEFORE ?X_G)))
			(!W10 (?X_A (BEFORE ?X_E)))
			(!W11 (?X_A (BEFORE ?X_C)))
			(!W12 (?X_G (BEFORE ?X_E)))
			(!W13 (?X_G (BEFORE ?X_C)))
		)
	)
	(
			"A boat of a man tips over."
			"A man float.59s a destination from L1."
			"A boat of a man tips over."
			"A man climb.60s a destination from L1."
			"A man rescues."
			"A man rescues."
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.11.V ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_B BROTHER.N))
			(!R2 (?X_C MOOD.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 ((KA (UP.PRT CLEAN.V) ?X_D) DESTINATION.N))
			(!R6 (?X_D CAN.N))
			(!R7 (?X_D (OF.P (K PAINT.N))))
			(!R8 (?X_B (PERTAIN-TO ?X_A)))
			(!R9 (?X_A AGENT.N))
			(!R10 (?X_C BAD.A))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V (THAT (?X_C ((ADV-A (AT.P (KA (UP.PRT CLEAN.V) ?X_D))) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_C ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C ((ADV-A (AT.P (KA (UP.PRT CLEAN.V) ?X_D))) BE.V)))
		)
		(:PARAPHRASES
			(?X_E
	   (?X_B
	    (((ADV-A (TO.P (KA (UP.PRT CLEAN.V) ?X_D)))
	      ((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_D))) TAKE.V))
	     ?X_C)))
			(?X_E (?X_B ((ADV-A (TO.P (KA (UP.PRT CLEAN.V) ?X_D))) CARRY.V) ?X_C))
			(?X_E (?X_B ((ADV-A (TO.P (KA (UP.PRT CLEAN.V) ?X_D))) BRING.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? TAKE.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? CARRY.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? BRING.V) ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?P1 POSTCOND-OF ?X_E))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.19.V ?X_C ?A) ** ?X_D)
		(:ROLES
			(!R1 (?X_C BROTHER.N))
			(!R2 (?A ACTION.N))
			(!R3 (?X_B (OF.P (K PAINT.N))))
			(!R4 (?X_B CAN.N))
			(!R5 (?X_C (PERTAIN-TO ?X_A)))
			(!R6 (?X_A AGENT.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V ?X_C ?A)))
			(?G2 (?X_C (WANT.V (THAT (?X_C (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_C (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_B))) ASK.V) ?X_C ?A)))
			(?E2 (?X_C (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_D (?X_C (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_B))) ASK.V) ?X_C ?A)))
			(?X_D (?X_C (TELL.V ?X_C ?A)))
			(?X_D (?X_C (MAKE.V ?X_C ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.4.V ?X_C ?A) ** ?X_D)
		(:ROLES
			(!R1 (?X_A BROTHER.N))
			(!R2 (?X_C AGENT.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_B (OF.P (K PAINT.N))))
			(!R5 (?X_B CAN.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V ?X_C ?A)))
			(?G2 (?X_A (WANT.V (THAT (?X_A (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_A (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_B))) ASK.V) ?X_C ?A)))
			(?E2 (?X_C (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_D (?X_A (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_B))) ASK.V) ?X_C ?A)))
			(?X_D (?X_A (TELL.V ?X_C ?A)))
			(?X_D (?X_A (MAKE.V ?X_C ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
	(EPI-SCHEMA ((?X_C
	              (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_A))) INFORM.10.V) ?X_C
	               ?I))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_C BROTHER.N))
			(!R2 (?I INFORMATION.N))
			(!R3 (NOT (?I ACTION.N)))
			(!R4 (?X_A (OF.P (K PAINT.N))))
			(!R5 (?X_A CAN.N))
			(!R6 (?X_B AGENT.N))
			(!R7 (?X_C (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_D (?X_C TELL.V ?X_C ?I))
			(?X_D (?X_C LET.V ?X_C (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
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
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_A CAN.N))
			(!R6 (?X_A (OF.P (K PAINT.N))))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_D (?X_B TELL.V ?X_C ?I))
			(?X_D (?X_B LET.V ?X_C (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-82.PR ?X_J (KA (UP.PRT CLEAN.V) ?X_J) ?X_M ?A ?X_N
	               ?X_O ?I))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G GROUND.N))
			(!R2 (?X_J CAN.N))
			(!R3 (?X_J (OF.P (K PAINT.N))))
			(!R4 (?X_M SMALLER-THAN.N ?X_N))
			(!R5 (?X_M MOOD.N))
			(!R6 (?X_M BAD.A))
			(!R7 (?A ACTION.N))
			(!R8 (?X_N BROTHER.N))
			(!R9 (?X_N (PERTAIN-TO ?X_O)))
			(!R10 (?X_O AGENT.N))
			(!R11 (NOT (?I ACTION.N)))
			(!R12 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_L (?X_N ((ADV-A (IN.P ?X_M)) BE.V)))
			(?X_I (?X_N (OPEN.V ?X_J)))
			(?X_F (?X_N (((ADV-A (ON.P ?X_G)) SPLASH.V) ?X_J)))
			(?X_D (?X_O (TELL.V ?X_N (KA (UP.PRT CLEAN.V) ?X_J))))
			(?X_B (?X_N TRANSPORT_OBJECT.11.V ?X_M))
			(?X_B (?X_N REQUEST_ACTION.19.V ?X_N ?A))
			(?X_B (?X_N REQUEST_ACTION.4.V ?X_O ?A))
			(?X_B
	   (?X_N (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_J))) INFORM.10.V) ?X_N ?I)))
			(?X_B
	   (?X_N (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_J))) INFORM.11.V) ?X_O ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_I)))
			(!W2 (?X_L (BEFORE ?X_F)))
			(!W3 (?X_L (BEFORE ?X_D)))
			(!W4 (?X_L (BEFORE ?X_B)))
			(!W5 (?X_I (BEFORE ?X_F)))
			(!W6 (?X_I (BEFORE ?X_D)))
			(!W7 (?X_I (BEFORE ?X_B)))
			(!W8 (?X_F (BEFORE ?X_D)))
			(!W9 (?X_F (BEFORE ?X_B)))
			(!W10 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A brother of a agent is in a mood bad."
			"A brother of a agent opens a can of paint."
			"A brother of a agent splashes a can of paint on a ground."
			"A agent tells a brother of a agent up clean a can of paint."
			"A brother of a agent transport object.71s a mood bad."
			"A brother of a agent request action.83s a brother of a agent a action."
			"A brother of a agent request action.86s a agent a action."
			"A brother of a agent inform.80s a brother of a agent a information for up clean a can of paint."
			"A brother of a agent inform.81s a agent a information for up clean a can of paint."
	)
)



(
	(EPI-SCHEMA ((?X_D ENJOY_ACTION.5.V (KA (PLAY.V (K BASEBALL.N)))) ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 ((KA (PLAY.V (K BASEBALL.N))) ACTION.N))
			(!R3 (?X_D (ABLE.A (KA (L X (AND (X (MAKE.V ?X_B)) (X (WIN.V ?X_C))))))))
			(!R4 (?X_B RUN.N))
			(!R5 (?X_C GAME.N))
			(!R6 (?X_C BIG.A))
		)
		(:PRECONDS
			(?I1 (?X_D (THINK.V (THAT ((KA (PLAY.V (K BASEBALL.N))) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_E (?X_D (WANT.V (KA (PLAY.V (K BASEBALL.N))))))
			(?X_E (?X_D (LIKE.V (KA (PLAY.V (K BASEBALL.N))))))
			(?X_E (?X_D (LOVE.V (KA (PLAY.V (K BASEBALL.N))))))
			(?X_E (?X_D (ENJOY.V (KA (PLAY.V (K BASEBALL.N))))))
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-83.PR ?X_K ?X_C (KA (PLAY.V (K BASEBALL.N)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C LONG.A))
			(!R2 (?X_C DRIVE.N))
			(!R3 (?X_K BIG.A))
			(!R4 (?X_K GAME.N))
			(!R5 (?X_M (ABLE.A (KA (L X (AND (X (MAKE.V ?X_L)) (X (WIN.V ?X_K))))))))
			(!R6 (?X_L RUN.N))
			(!R7 (?X_M AGENT.N))
			(!R8 ((KA (PLAY.V (K BASEBALL.N))) ACTION.N))
		)
		(:STEPS
			(?X_G (?X_M (HAVE.V ?X_K)))
			(?X_E (?X_M (UP.ADV ((ADV-A (FOR.P (KA HIT.V))) BE.V))))
			(?X_B (?X_M (HIT.V ?X_C)))
			(?X_I (?X_M ENJOY_ACTION.5.V (KA (PLAY.V (K BASEBALL.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
			(!W2 (?X_G (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A able make winning agent has a big game."
			"A able make winning agent is up for hitting."
			"A able make winning agent hits a long drive."
			"A able make winning agent enjoy action.114s playing baseball."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) RUN.10.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
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
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) RUN.10.V)))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) RUN.10.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) RUN.10.V) ?X_C))
			(?X_D (?X_B RUN.10.V))
			(?X_D (?X_B ((ALMOST.ADV (OVER.PRT RUN.10.V)) ?X_C)))
			(?X_D (?X_B (LOCATION_ADV.? RUN.10.V)))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-84.PR ?X_G ?X_K)) ** ?E)
		(:ROLES
			(!R1 (?X_J WAY.N))
			(!R2 (?X_G WALKING.N))
			(!R3 (?X_G STACKER.N))
			(!R4 (?X_J (PERTAIN-TO ?X_L)))
			(!R5 (?X_L AGENT.N))
			(!R6 (?X_K DESTINATION.N))
			(!R7 (?X_K FRIEND.N))
			(!R8 (?X_K (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(?X_I (?X_L ((ADV-A (AT.P (K WORK.N))) BE.V)))
			(?X_F (?X_L (USE.V ?X_G)))
			(?X_D (?X_K ((ADV-A (IN.P ?X_J)) STAND.V)))
			(?X_B (?X_L ((ADV-A (FROM.P ?L1)) RUN.10.V) ?X_K))
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
			"A destination friend of a agent stands in a way of a agent."
			"A agent run.119s a destination friend of a agent from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              ((CAN.AUX MAKE.7.V) (K (L X (AND (X GREEN.A) (X PAINT.N))))))
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
	              (COMPOSITE-SCHEMA-85.PR
	               (K
	                (L X
	                 (AND (X BLUE.A)
	                      ((X PAINT.N) AND (X AND) (X YELLOW.A) (X PAINT.N)))))
	               (K (L X (AND (X GREEN.A) (X PAINT.N))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D (PLUR LEAF.N)))
			(!R2 (?X_D GREEN.A))
			(!R3 (?X_I AGENT.N))
			(!R4 (?X_I (HAS.V (NO.D (PLUR FLOWER.N)))))
			(!R5 (NOT ((K (L X (AND (X GREEN.A) (X PAINT.N)))) AGENT.N)))
		)
		(:STEPS
			(?X_H (?X_A STEM.V))
			(?X_C
	   (?X_D
	    ((CAN.AUX MIX.V)
	     (K
	      (L X
	       (AND (X BLUE.A) ((X PAINT.N) AND (X AND) (X YELLOW.A) (X PAINT.N))))))))
			(?X_F (?X_I ((CAN.AUX MAKE.7.V) (K (L X (AND (X GREEN.A) (X PAINT.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_C)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A GET.15.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))) **
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
			(!W1 (?I1 PRECOND-OF ?X_B))
			(!W2 (?I2 PRECOND-OF ?X_B))
			(!W3 (?I3 PRECOND-OF ?X_B))
			(!W4 (?P1 POSTCOND-OF ?X_B))
			(!W5 (?X_B (AT-ABOUT ?X_C)))
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
	              (COMPOSITE-SCHEMA-86.PR ?X_B ?X_M
	               (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M GLASS.N))
			(!R2 (?X_M (OF.P (K WATER.N))))
			(!R3 (?X_M WATER.N))
			(!R4 (NOT ((KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N)))) AGENT.N)))
			(!R5 (NOT (?X_N = (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N)))))))
			(!R6 (?X_N MAN.N))
		)
		(:STEPS
			(?X_L (?X_N (POUR.V ?X_M)))
			(?X_J (?X_N ((ADV-A (IN.P ?X_M)) LOOK.V)))
			(?X_H (?X_A (BE.V ?X_B)))
			(?X_F (?X_N ((OUT.PRT POUR.V) ?X_M)))
			(?X_D (?X_N GET.15.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))))
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
			"A man get.153s water in another glass."
	)
)



(
	(EPI-SCHEMA ((?X_A MAKE.8.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_B GOOD.A))
			(!R4 (?X_B SHADE.N))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-87.PR (KE (?X_A (CAN.AUX BE.V))) ?X_F ?X_K))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F (PLUR WOOD.N)))
			(!R2 (?X_G MAMMA.N))
			(!R3 (?X_H SING.V))
			(!R4 (?X_G (PERTAIN-TO ?X_H)))
			(!R5 (?X_I (AS.ADV BLUE.A)))
			(!R6 (?X_I SKY.N))
			(!R7 (?X_J AGENT.N))
			(!R8 (?X_K GOOD.A))
			(!R9 (?X_K SHADE.N))
			(!R10 (NOT (?X_K AGENT.N)))
		)
		(:STEPS
			(?X_B (?X_I (AS.P (KE (?X_A (CAN.AUX BE.V))))))
			(?X_C ((SET-OF ?X_H ?X_G) (IN.P ?X_F)))
			(?X_E (?X_J MAKE.8.V ?X_K))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_C)))
		)
	)
	(
			"A as blue sky is as."
			"A sing and a mamma of a sing are in."
			"A agent make.161s a good shade."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.18.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C STUDIO.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C DESTINATION.N))
			(!R6 (?X_A WALL.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
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
	   (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) GO.18.V))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.18.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.18.V) ?X_C))
			(?X_D (?X_B GO.18.V))
			(?X_D (?X_B GO.18.V ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? GO.18.V)))
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
	(EPI-SCHEMA ((?X_B (GIVE.7.V ?X_C ?X_D)) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_C AGENT.N))
			(!R4 (?X_D JACKET.N))
			(!R5 (?X_A WALL.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
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
		(:PARAPHRASES
			(?X_E (?X_B ((ADV-A (TO.P ?X_C)) (GIVE.7.V ?X_D))))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
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
			(!R5 (?X_A WALL.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
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
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?I2 PRECOND-OF ?X_E))
			(!W3 (?I3 PRECOND-OF ?X_E))
			(!W4 (?P1 POSTCOND-OF ?X_E))
			(!W5 (?X_E (AT-ABOUT ?X_F)))
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
	              (COMPOSITE-SCHEMA-88.PR ?X_K ?X_L ?X_M (TWO.D (PLUR PICTURE.N))
	               (K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I WALL.N))
			(!R2 (?X_I (PERTAIN-TO ?X_L)))
			(!R3 (NOT ((K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N))))) AGENT.N)))
			(!R4 (NOT (?X_L = (K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N))))))))
			(!R5 (?X_K DESTINATION.N))
			(!R6 (?X_K STUDIO.N))
			(!R7 (?X_L AGENT.N))
			(!R8 (?X_M JACKET.N))
			(!R9 (NOT (?X_M AGENT.N)))
			(!R10 (?X_N AGENT.N))
			(!R11 (NOT ((TWO.D (PLUR PICTURE.N)) AGENT.N)))
			(!R12 (NOT (?X_N = (TWO.D (PLUR PICTURE.N)))))
		)
		(:STEPS
			(?X_H
	   (MUST.AUX-S
	    (?X_L (TAKE.12.V (K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N)))))))))
			(?X_F (?X_L ((ADV-A (FROM.P ?L1)) GO.18.V) ?X_K))
			(?X_D (?X_N (GIVE.7.V ?X_L ?X_M)))
			(?X_B (?X_N TAKE.11.V (TWO.D (PLUR PICTURE.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_D)))
			(!W3 (?X_H (BEFORE ?X_B)))
			(!W4 (?X_F (BEFORE ?X_D)))
			(!W5 (?X_F (BEFORE ?X_B)))
			(!W6 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent take.176s graduation picture must."
			"A agent go.173s a destination studio from L1."
			"A agent give.178s a agent a jacket."
			"A agent take.175s two pictures."
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.12.V ?X_B) ** ?X_D)
		(:ROLES
			(!R1 (?X_A JANITOR.N))
			(!R2 (?X_B ENTITY.N))
			(!R3 (?X_B SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_C DESTINATION.N))
			(!R6 (?X_B MOP.V))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
			(!R8 (?X_C SINK.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B ((ADV-A (AT.P ?X_C)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_B ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B ((ADV-A (AT.P ?X_C)) BE.V)))
		)
		(:PARAPHRASES
			(?X_D (?X_A (((ADV-A (TO.P ?X_C)) TAKE.V) ?X_B)))
			(?X_D (?X_A ((ADV-A (TO.P ?X_C)) CARRY.V) ?X_B))
			(?X_D (?X_A ((ADV-A (TO.P ?X_C)) BRING.V) ?X_B))
			(?X_D (?X_A (LOCATION_ADV.? TAKE.V) ?X_B))
			(?X_D (?X_A (LOCATION_ADV.? CARRY.V) ?X_B))
			(?X_D (?X_A (LOCATION_ADV.? BRING.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?P1 POSTCOND-OF ?X_D))
			(!W3 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((OUT.ADV GET.16.V) ?X_B)) ** ?X_C)
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
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
			(!R5 (?X_A SINK.N))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
			(!R7 (?X_C MOP.V))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-89.PR (KA (CLEAN.V ?X_N)) ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_N SMALLER-THAN.N ?X_M))
			(!R2 (?X_L SINK.N))
			(!R3 (?X_M JANITOR.N))
			(!R4 (?X_N (PERTAIN-TO ?X_M)))
			(!R5 (?X_N MOP.V))
			(!R6 (NOT (?X_N AGENT.N)))
			(!R7 (NOT (?X_M = ?X_N)))
		)
		(:STEPS
			(?X_K (?X_M (NEED.V (KA (CLEAN.V ?X_N)))))
			(?X_A (?X_M (NEED.V (KA (CLEAN.V ?X_N)))))
			(?X_I (?X_M TRANSPORT_OBJECT.12.V ?X_N))
			(?X_I (?X_M (((ADV-A (TO.P ?X_L)) TAKE.13.V) ?X_N)))
			(?X_G (?X_M ((OUT.ADV GET.16.V) ?X_N)))
			(?X_E (?X_M (WASH.V ?X_N)))
			(?X_C (?X_M ((AWAY.ADV PUT.V) ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_A)))
			(!W2 (?X_K (BEFORE ?X_I)))
			(!W3 (?X_K (BEFORE ?X_G)))
			(!W4 (?X_K (BEFORE ?X_E)))
			(!W5 (?X_K (BEFORE ?X_C)))
			(!W6 (?X_A (BEFORE ?X_I)))
			(!W7 (?X_A (BEFORE ?X_G)))
			(!W8 (?X_A (BEFORE ?X_E)))
			(!W9 (?X_A (BEFORE ?X_C)))
			(!W10 (?X_I (BEFORE ?X_G)))
			(!W11 (?X_I (BEFORE ?X_E)))
			(!W12 (?X_I (BEFORE ?X_C)))
			(!W13 (?X_G (BEFORE ?X_E)))
			(!W14 (?X_G (BEFORE ?X_C)))
			(!W15 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A janitor needs cleaning a mop of a janitor."
			"A janitor needs cleaning a mop of a janitor."
			"A janitor transport object.185s a mop of a janitor."
			"A janitor take.191s a mop of a janitor to a sink."
			"A janitor get.189s a mop of a janitor out."
			"A janitor washes a mop of a janitor."
			"A janitor puts a mop of a janitor away."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.19.V) (K BLIND.A)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K BLIND.A) DESTINATION.N))
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
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? (K BLIND.A))) GO.19.V)))
			(?X_C
	   (?X_A
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? (K BLIND.A))) GO.19.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? (K BLIND.A))) GO.19.V) (K BLIND.A)))
			(?X_C (?X_A GO.19.V))
			(?X_C (?X_A GO.19.V (K BLIND.A)))
			(?X_C (?X_A (LOCATION_ADV.? GO.19.V)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.20.V) (K BLIND.A)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K BLIND.A) DESTINATION.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? (K BLIND.A))) GO.20.V)))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? (K BLIND.A))) GO.20.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? (K BLIND.A))) GO.20.V) (K BLIND.A)))
			(?X_B (?X_A GO.20.V))
			(?X_B (?X_A GO.20.V (K BLIND.A)))
			(?X_B (?X_A (LOCATION_ADV.? GO.20.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_B))
			(!W2 (?I2 BEFORE ?X_B))
			(!W3 (?P1 AFTER ?X_B))
			(!W4 (?P2 AFTER ?X_B))
			(!W5 (?G1 CAUSE-OF ?X_B))
			(!W6 (?X_C (CONSEC ?X_B)))
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
	(EPI-SCHEMA ((?X_B
	              (COMPOSITE-SCHEMA-90.PR ?X_J
	               (K ((ADV-A (FOR.P (K (PLUR YEAR.N)))) (FOR.P ?X_M))) ?X_B
	               (K BLIND.A)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J TIME.N))
			(!R2 (?X_J LONG.A))
			(!R3 ((K BLIND.A) DESTINATION.N))
			(!R4 (?X_M AGENT.N))
			(!R5 (?X_M OLD.A))
		)
		(:STEPS
			(?X_C (?X_M ((ADV-A (FROM.P ?L1)) GO.19.V) (K BLIND.A)))
			(?X_C (?X_M ((ADV-A (FROM.P ?L1)) GO.20.V) (K BLIND.A)))
			(?X_I (?X_B ?X_M (HAVE.V ?X_J)))
			(?X_G (?X_B (LOOK.V (K ((ADV-A (FOR.P (K (PLUR YEAR.N)))) (FOR.P ?X_M))))))
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
			"A agent old go.207s blind from L1."
			"A agent old go.209s blind from L1."
			"X_B has a time long."
			"X_B looks for years for a agent old."
			"X_A takes X_B longer much for over X_A getting."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-91.PR (KE (AND (?X_B RED.A) (?X_B YELLOW.A)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-92.PR ?X_F ?X_K)) ** ?E)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?X_F TREE.N))
			(!R3 (?X_I BRANCH.N))
			(!R4 (?X_K (OF.P (KE (?X_J HOUSE.N)))))
			(!R5 (?X_K WINDOW.N))
		)
		(:STEPS
			(?X_C (?X_A (PLANT.V ?X_F)))
			(?X_E (?X_F ((ADV-A (FOR.P (KA (VERY.ADV TALL.A)))) GROW.V)))
			(?X_H (?X_I ((ADV-A (FROM.P ?X_F)) FALL.V)))
			(?X_M (?X_I (BREAK.V ?X_K)))
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
			"A branch breaks a of X_J house window."
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-93.PR ?X_F
	               (K
	                (L X
	                 (AND (X (MORE.ADV (ON.P ?X_L))) (X THAN.P) (X (IN.P ?X_L)))))
	               (KE
	                (?X_L
	                 (GET.V
	                  (L X
	                   (AND (X (MORE.ADV (ON.P ?X_L))) (X THAN.P)
	                        (X (IN.P ?X_L)))))))
	               (K (PLUR FOOD.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H AGENT.N))
			(!R2 (?X_F (PLUR PEACH.N)))
			(!R3 (?X_L (PERTAIN-TO ?X_H)))
			(!R4 (?X_I (IMPINGES-ON ?X_J)))
			(!R5 ((K (PLUR FOOD.N)) FOOD.N))
			(!R6 (?X_L SON.N))
		)
		(:STEPS
			(?X_E (?X_L (LOVE.V ?X_F)))
			(?X_C
	   (?X_L
	    (GET.V
	     (K (L X (AND (X (MORE.ADV (ON.P ?X_L))) (X THAN.P) (X (IN.P ?X_L))))))))
			(?X_K
	   (?X_H
	    (THINK.V
	     (KE
	      (?X_L
	       (GET.V
	        (L X (AND (X (MORE.ADV (ON.P ?X_L))) (X THAN.P) (X (IN.P ?X_L))))))))))
			(?X_I (MUST.AUX-S (?X_L ((JUST.ADV EAT.2.V) (K (PLUR FOOD.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_C)))
			(!W2 (?X_E (BEFORE ?X_K)))
			(!W3 (?X_C (BEFORE ?X_K)))
		)
	)
	(
			"A son of a agent loves a peachs."
			"A son of a agent gets on than in."
			"A agent thinks a son of a agent gets on than in."
			"A son of a agent eat.239s foods must just."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-94.PR ?X_A)) ** ?E)
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
	)
)



(
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.20.V ?X_D ?A) ** ?X_G)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D GIRL.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_B HAIR.N))
			(!R5 (?X_B (PERTAIN-TO ?X_A)))
			(!R6 (?X_A FEMALE.A))
			(!R7 (?X_A AGENT.N))
		)
		(:GOALS
			(?X_E (?X_C (WANT.V ?X_D ?A)))
			(?G2 (?X_C (WANT.V (THAT (?X_C (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_C (ASK.V ?X_D ?A)))
			(?E2 (?X_D (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_G (?X_C (ASK.V ?X_D ?A)))
			(?X_G (?X_C (TELL.V ?X_D ?A)))
			(?X_G (?X_C (((ADV-A (WITH.P ?X_B)) MAKE.V) ?X_D ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
			(!W4 (?X_G (SAME-TIME ?X_J)))
			(!W5 (?X_G (RIGHT-AFTER ?X_H)))
			(!W6 (?X_I (BEFORE ?X_J)))
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
	(EPI-SCHEMA ((?X_Q (COMPOSITE-SCHEMA-95.PR ?X_N ?X_Q (KA STOP.V) ?X_B ?X_P ?A)) **
	             ?E)
		(:ROLES
			(!R1 (?X_N HAIR.N))
			(!R2 (?X_O FEMALE.A))
			(!R3 (?X_O AGENT.N))
			(!R4 (?X_N (PERTAIN-TO ?X_O)))
			(!R5 (?X_P GIRL.N))
			(!R6 (?A ACTION.N))
			(!R7 (?X_Q AGENT.N))
		)
		(:STEPS
			(?X_M (?X_Q (LIKE.V ?X_P)))
			(?X_K
	   (?X_P ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_Q))))))) SIT.V)))
			(?X_I (?X_Q (WITH.P ?X_N)))
			(?X_C (?X_Q REQUEST_ACTION.20.V ?X_P ?A))
			(?X_G (?X_P (TELL.V ?X_Q (KA STOP.V))))
			(?X_E (?X_Q (STOP.V ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_K)))
			(!W2 (?X_M (BEFORE ?X_C)))
			(!W3 (?X_M (BEFORE ?X_G)))
			(!W4 (?X_M (BEFORE ?X_E)))
			(!W5 (?X_K (BEFORE ?X_C)))
			(!W6 (?X_K (BEFORE ?X_G)))
			(!W7 (?X_K (BEFORE ?X_E)))
			(!W8 (?X_I (BEFORE ?X_C)))
			(!W9 (?X_I (BEFORE ?X_G)))
			(!W10 (?X_I (BEFORE ?X_E)))
			(!W11 (?X_C (BEFORE ?X_G)))
			(!W12 (?X_C (BEFORE ?X_E)))
			(!W13 (?X_G (BEFORE ?X_E)))
		)
	)
	(
			"A agent likes a girl."
			"A girl sits in front of."
			"A agent is with."
			"A agent request action.269s a girl a action."
			"A girl tells a agent stopping."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) RUN.11.V) (K (OVER.PRT (TO.P ?X_C))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (OVER.PRT (TO.P ?X_C))) DESTINATION.N))
			(!R4 (NOT (?L1 = (K (OVER.PRT (TO.P ?X_C))))))
			(!R5 (?X_C (PLUR KID.N)))
			(!R6 (?X_B BIG.A))
			(!R7 (?X_A FRIEND.N))
			(!R8 (?X_A (PERTAIN-TO ?X_A)))
			(!R9 (?X_A (PERTAIN-TO ?X_C)))
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
	   (?X_B ((ADV-A (DESTINATION_PREP.? (K (OVER.PRT (TO.P ?X_C))))) RUN.11.V)))
			(?X_D
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K (OVER.PRT (TO.P ?X_C))))) RUN.11.V))))
			(?X_D
	   (?X_B ((ADV-A (DESTINATION_PREP.? (K (OVER.PRT (TO.P ?X_C))))) RUN.11.V)
	    (K (OVER.PRT (TO.P ?X_C)))))
			(?X_D (?X_B RUN.11.V))
			(?X_D (?X_B RUN.11.V (K (OVER.PRT (TO.P ?X_C)))))
			(?X_D (?X_B (LOCATION_ADV.? RUN.11.V)))
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
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-96.PR (KE (?X_K HOUSE.N)) (K HOME.N)
	               (K (OVER.PRT (TO.P ?X_M)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H YARD.N))
			(!R2 (?X_K FRIEND.N))
			(!R3 (?X_K (PERTAIN-TO ?X_K)))
			(!R4 (?X_K (PERTAIN-TO ?X_M)))
			(!R5 (?X_L DOG.N))
			(!R6 (?X_L BIG.A))
			(!R7 (?X_M (PLUR KID.N)))
			(!R8 ((K (OVER.PRT (TO.P ?X_M))) DESTINATION.N))
		)
		(:STEPS
			(?X_A (?X_K HOUSE.N))
			(?X_B ((TWO.D (PLUR KID.N)) (VISIT.V (KE (?X_K HOUSE.N)))))
			(?X_J (NOT (?X_K (BE.V (K HOME.N)))))
			(?X_C (NOT (?X_K (BE.V (K HOME.N)))))
			(?X_G (?X_L ((ADV-A (IN.P ?X_H)) BE.V)))
			(?X_E (?X_L ((ADV-A (FROM.P ?L1)) RUN.11.V) (K (OVER.PRT (TO.P ?X_M)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_B)))
			(!W2 (?X_A (BEFORE ?X_C)))
			(!W3 (?X_A (BEFORE ?X_G)))
			(!W4 (?X_A (BEFORE ?X_E)))
			(!W5 (?X_B (BEFORE ?X_C)))
			(!W6 (?X_B (BEFORE ?X_G)))
			(!W7 (?X_B (BEFORE ?X_E)))
			(!W8 (?X_J (BEFORE ?X_C)))
			(!W9 (?X_J (BEFORE ?X_G)))
			(!W10 (?X_J (BEFORE ?X_E)))
			(!W11 (?X_C (BEFORE ?X_G)))
			(!W12 (?X_C (BEFORE ?X_E)))
			(!W13 (?X_G (BEFORE ?X_E)))
		)
	)
	(
			"A friend of a friend of X_K of a kids of a kids is house."
			"Two kids visit a friend of a friend of X_K of a kids of a kids house."
			"A friend of a friend of X_K of a kids of a kids is home not."
			"A friend of a friend of X_K of a kids of a kids is home not."
			"A dog big is in a yard."
			"A dog big run.6s over to a kids from L1."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) WALK.3.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B CAT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A ROOM.N))
			(!R6 (?X_A LIVING.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) WALK.3.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) WALK.3.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) WALK.3.V) ?L2))
			(?X_C (?X_B ((ADV-A (INTO.P ?X_A)) WALK.3.V)))
			(?X_C (?X_B WALK.3.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? WALK.3.V)))
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
	(EPI-SCHEMA ((?X_D ((ADV-A (WITH.P ?X_A)) PLAY.10.V)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D CAT.N))
			(!R2 (?X_C TOY.N))
			(!R3 (NOT (?X_C AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A BALL.N))
			(!R7 (?X_B FLOOR.N))
			(!R8 (?X_A (ON.P ?X_B)))
			(!R9 (?X_C ROOM.N))
			(!R10 (?X_C LIVING.N))
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
		(:PARAPHRASES
			(?X_E (?X_D ((ADV-A (WITH.P ?X_C)) PLAY.10.V)))
			(?X_E (?X_D PLAY.10.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (WITH.P ?X_A)) PLAY.11.V) ?X_D)) ** ?X_E)
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-97.PR ?X_O ?L2 ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_K LIVING.N))
			(!R2 (?X_K ROOM.N))
			(!R3 (?X_L FLOOR.N))
			(!R4 (?X_O (ON.P ?X_L)))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_M CAT.N))
			(!R7 (NOT (?X_N AGENT.N)))
			(!R8 (?X_O BALL.N))
		)
		(:STEPS
			(?X_J (?X_M ((ADV-A (FROM.P ?L1)) WALK.3.V) ?L2))
			(?X_H (?X_N (BE.V ?X_O)))
			(?X_F (?X_M ((AROUND.ADV SWAT.V) ?X_O)))
			(?X_D (?X_M ((ADV-A (WITH.P ?X_O)) PLAY.10.V)))
			(?X_D (?X_M (((ADV-A (WITH.P ?X_O)) PLAY.11.V) ?X_N)))
			(?X_B (?X_M (LIKE.V ?X_O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_F)))
			(!W3 (?X_J (BEFORE ?X_D)))
			(!W4 (?X_J (BEFORE ?X_B)))
			(!W5 (?X_H (BEFORE ?X_F)))
			(!W6 (?X_H (BEFORE ?X_D)))
			(!W7 (?X_H (BEFORE ?X_B)))
			(!W8 (?X_F (BEFORE ?X_D)))
			(!W9 (?X_F (BEFORE ?X_B)))
			(!W10 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A cat walk.24s a destination from L1."
			"X_N is a ball on a floor."
			"A cat swats a ball on a floor around."
			"A cat play.37s with a ball on a floor."
			"A cat play.33s X_N with a ball on a floor."
			"A cat likes a ball on a floor."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) FALL.3.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.3.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.3.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.3.V) ?L2))
			(?X_B (?X_A (DOWN.ADV FALL.3.V)))
			(?X_B (?X_A FALL.3.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? FALL.3.V)))
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.21.V ?Y ?A) ** ?X_C)
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
		(:PARAPHRASES
			(?X_C (?X_A ((DOWN.ADV ASK.V) ?Y ?A)))
			(?X_C (?X_A (TELL.V ?Y ?A)))
			(?X_C (?X_A (MAKE.V ?Y ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?X_B))
			(!W2 (?X_B CAUSE-OF ?E2))
			(!W3 (?X_C (AT-ABOUT ?X_D)))
			(!W4 (?X_B (AT-ABOUT ?X_D)))
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-98.PR (K ROPE.N) ?X_L (KA (IN.PRT JUMP.V)) ?L2 ?Y
	               ?A))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J {REF}.N))
			(!R2 (?X_J (OF.P ?X_K)))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (?X_L AGENT.N))
			(!R5 (?A ACTION.N))
			(!R6 (?Y AGENT.N))
		)
		(:STEPS
			(?X_I (?X_J (JUMP.V (K ROPE.N))))
			(?X_G (?X_A (ASK.V ?X_L (KA (IN.PRT JUMP.V)))))
			(?X_C (?X_L ((ADV-A (FROM.P ?L1)) FALL.3.V) ?L2))
			(?X_E (?X_L REQUEST_ACTION.21.V ?Y ?A))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_G)))
			(!W2 (?X_I (BEFORE ?X_C)))
			(!W3 (?X_I (BEFORE ?X_E)))
			(!W4 (?X_G (BEFORE ?X_C)))
			(!W5 (?X_G (BEFORE ?X_E)))
		)
	)
	(
			"A of X_K jumps rope."
			"X_A asks a agent in jumping."
			"A agent fall.43s a destination from L1."
			"A agent request action.41s a agent a action."
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.22.V (KA (BUY.V ?X_B))) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (BUY.V ?X_B)) ACTION.N))
			(!R3 (?X_B ALBUM.N))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA (BUY.V ?X_B)) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_C (?X_A (WANT.V (KA (BUY.V ?X_B)))))
			(?X_C (?X_A (LIKE.V (KA (BUY.V ?X_B)))))
			(?X_C (?X_A (LOVE.V (KA (BUY.V ?X_B)))))
			(?X_C (?X_A (ENJOY.V (KA (BUY.V ?X_B)))))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-99.PR (ALL.D DAY.N) ?X_J (KA (BUY.V ?X_N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J GREAT.A))
			(!R2 (?X_J SONG.N))
			(!R3 (?X_N ALBUM.N))
			(!R4 (?X_M AGENT.N))
			(!R5 ((KA (BUY.V ?X_N)) ACTION.N))
		)
		(:STEPS
			(?X_L (?X_M ((ADV-A (ON.P ?X_A)) SEARCH.V)))
			(?X_I (?X_M (FIND.V ?X_J)))
			(?X_G (?X_M (((ADV-A (TO.P ?X_J)) LISTEN.V) (ALL.D DAY.N))))
			(?X_E (?X_M (LOVE.V ?X_J)))
			(?X_C (?X_M ENJOY_ACTION.22.V (KA (BUY.V ?X_N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_I)))
			(!W2 (?X_L (BEFORE ?X_G)))
			(!W3 (?X_L (BEFORE ?X_E)))
			(!W4 (?X_I (BEFORE ?X_G)))
			(!W5 (?X_I (BEFORE ?X_E)))
			(!W6 (?X_G (BEFORE ?X_E)))
		)
	)
	(
			"A agent searches on X_A."
			"A agent finds a great song."
			"A agent listens all day to a great song."
			"A agent loves a great song."
			"A agent enjoy action.52s buying a album."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.21.V) (K SWIMMING.N)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K SWIMMING.N) DESTINATION.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? (K SWIMMING.N))) GO.21.V)))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K SWIMMING.N))) GO.21.V))))
			(?X_C
	   (?X_B ((ADV-A (DESTINATION_PREP.? (K SWIMMING.N))) GO.21.V) (K SWIMMING.N)))
			(?X_C (?X_B GO.21.V))
			(?X_C ((ADV-E (DURING (K TODAY.N))) (?X_B (GO.21.V (K SWIMMING.N)))))
			(?X_C (?X_B (LOCATION_ADV.? GO.21.V)))
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
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.23.V ?A) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?A ACTION.N))
			(!R3 (?X_A (PLUR TOOTH.N)))
			(!R4 (?X_A CHATTER.N))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:PRECONDS
			(?I1 (?X_B (THINK.V (THAT (?A FUN.A)))))
		)
		(:PARAPHRASES
			(?X_C (?X_B (WANT.V ?A)))
			(?X_C (?X_B (LIKE.V ?A)))
			(?X_C (?X_B (((ADV-A (TO.P (KA SWIM.V))) LOVE.V) ?A)))
			(?X_C (?X_B (ENJOY.V ?A)))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-100.PR (KA SWIM.V) ?X_J (K SWIMMING.N) ?A)) **
	             ?E)
		(:ROLES
			(!R1 (?X_J (PLUR TOOTH.N)))
			(!R2 (?X_J CHATTER.N))
			(!R3 (?X_C (VERY.ADV COLD.A)))
			(!R4 (?X_C WATER.N))
			(!R5 (?X_J (PERTAIN-TO ?X_K)))
			(!R6 ((K SWIMMING.N) DESTINATION.N))
			(!R7 (?X_K AGENT.N))
			(!R8 (?A ACTION.N))
		)
		(:STEPS
			(?X_I (?X_K ((ADV-A (FROM.P ?L1)) GO.21.V) (K SWIMMING.N)))
			(?X_G (?X_K (TO.P (KA SWIM.V))))
			(?X_E (?X_K ENJOY_ACTION.23.V ?A))
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
			"A agent go.74s swimming from L1."
			"A agent is to."
			"A agent enjoy action.80s a action."
			"A very cold water makes a tooths chatter of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-101.PR ?X_A (K (AWAY.ADV (FROM.P ?X_B))))) **
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) RUN.12.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?L2 HOME.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.12.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.12.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.12.V) ?L2))
			(?X_B (?X_A RUN.12.V))
			(?X_B (?X_A RUN.12.V ?L2))
			(?X_B (?X_A RUN.12.V))
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
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.13.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?X_B JOB.N))
			(!R3 (?X_B SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?L2 HOME.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B ((ADV-A (AT.P ?L2)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_B ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B ((ADV-A (AT.P ?L2)) BE.V)))
		)
		(:PARAPHRASES
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) TAKE.V) ?X_B))
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) CARRY.V) ?X_B))
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) BRING.V) ?X_B))
			(?X_C (?X_A (TAKE.V ?X_B)))
			(?X_C (?X_A CARRY.V ?X_B))
			(?X_C (?X_A BRING.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?P1 POSTCOND-OF ?X_C))
			(!W3 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-102.PR (KA ((ADV-A (FOR.P ?X_J)) GO.V)) ?L2 ?X_J))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E SUNNY.A))
			(!R2 (?L2 DESTINATION.N))
			(!R3 (?L2 HOME.N))
			(!R4 (?X_K MAN.N))
			(!R5 (?X_J JOB.N))
			(!R6 (?X_J SMALLER-THAN.N ?X_K))
		)
		(:STEPS
			(?X_I (?X_K (OUTSIDE.ADV LOOK.V)))
			(?X_G (?X_K (DECIDE.V (KA ((ADV-A (FOR.P ?X_J)) GO.V)))))
			(?X_D (?X_E ((ADV-A (FOR.P (KA RAIN.V))) START.V)))
			(?X_B (?X_K ((ADV-A (FROM.P ?L1)) RUN.12.V) ?L2))
			(?X_B (?X_K TRANSPORT_OBJECT.13.V ?X_J))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_G)))
			(!W2 (?X_I (BEFORE ?X_D)))
			(!W3 (?X_I (BEFORE ?X_B)))
			(!W4 (?X_G (BEFORE ?X_D)))
			(!W5 (?X_G (BEFORE ?X_B)))
			(!W6 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A man looks outside."
			"A man decides for a job going."
			"A sunny starts for raining."
			"A man run.90s a destination home from L1."
			"A man transport object.92s a job."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?X_B)) RUN.13.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C CAT.N))
			(!R2 (?X_B EDGE.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?X_B = ?L2)))
			(!R5 (?X_A AGENT.N))
			(!R6 (?X_C (PERTAIN-TO ?X_A)))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.13.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?X_B)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.13.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.13.V) ?L2))
			(?X_D (?X_C (AWAY.PRT RUN.13.V)))
			(?X_D (?X_C RUN.13.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? RUN.13.V)))
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
	(EPI-SCHEMA ((?X_D ((ADV-A (WITH.P ?X_A)) PLAY.12.V)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D CAT.N))
			(!R2 (?X_C TOY.N))
			(!R3 (NOT (?X_C AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A EDGE.N))
			(!R7 (?X_B AGENT.N))
			(!R8 (?X_D (PERTAIN-TO ?X_B)))
			(!R9 (?X_C NEW.A))
			(!R10 (?X_C (VERY.ADV PLUSH.A)))
			(!R11 (?X_C RUG.N))
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
		(:PARAPHRASES
			(?X_E (?X_D ((ADV-A (WITH.P ?X_C)) PLAY.12.V)))
			(?X_E (?X_D PLAY.12.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_F)))
			(!W2 (?X_G (SAME-TIME ?X_F)))
			(!W3 (?X_G (RIGHT-AFTER ?X_H)))
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
	(EPI-SCHEMA ((?X_C ((JUST.ADV GET.17.V) ?X_D)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_B EDGE.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D RUG.N))
			(!R6 (?X_D NEW.A))
			(!R7 (?X_D (VERY.ADV PLUSH.A)))
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
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?I2 PRECOND-OF ?X_E))
			(!W3 (?I3 PRECOND-OF ?X_E))
			(!W4 (?P1 POSTCOND-OF ?X_E))
			(!W5 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-103.PR ?L2 ?X_L)) ** ?E)
		(:ROLES
			(!R1 (?X_F WIFE.N))
			(!R2 (?X_F (PERTAIN-TO ?X_G)))
			(!R3 (?X_N (PERTAIN-TO ?X_M)))
			(!R4 (?X_L RUG.N))
			(!R5 (?X_L NEW.A))
			(!R6 (?X_L (VERY.ADV PLUSH.A)))
			(!R7 (NOT (?X_L AGENT.N)))
			(!R8 (NOT (?X_M = ?X_L)))
			(!R9 (?X_M AGENT.N))
			(!R10 (?X_N CAT.N))
			(!R11 (?X_O EDGE.N))
			(!R12 (NOT (?X_O = ?L2)))
			(!R13 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_I (?X_N ((ADV-A (WITH.P ?X_O)) PLAY.12.V)))
			(?X_K (?X_M ((JUST.ADV GET.17.V) ?X_L)))
			(?X_A (?X_N ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_O)) PLAY.V)))) START.V)))
			(?X_E (?X_F ((ADV-A (AT.P ?X_N)) YELL.V)))
			(?X_C (?X_N ((ADV-A (FROM.P ?X_O)) RUN.13.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_A)))
			(!W2 (?X_I (BEFORE ?X_E)))
			(!W3 (?X_I (BEFORE ?X_C)))
			(!W4 (?X_K (BEFORE ?X_A)))
			(!W5 (?X_K (BEFORE ?X_E)))
			(!W6 (?X_K (BEFORE ?X_C)))
			(!W7 (?X_A (BEFORE ?X_E)))
			(!W8 (?X_A (BEFORE ?X_C)))
			(!W9 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A cat of a agent play.107s with a edge."
			"A agent get.102s a rug new very plush just."
			"A cat of a agent starts for with a edge playing."
			"A wife of X_G yells at a cat of a agent."
			"A cat of a agent run.96s a destination from a edge."
	)
)



(
	(EPI-SCHEMA ((?X_B ((OUT.PRT GET.18.V) (KA ((ADV-A (ON.P ?X_C)) CHECK.V)))) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((KA ((ADV-A (ON.P ?X_C)) CHECK.V)) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (KA ((ADV-A (ON.P ?X_C)) CHECK.V)))))
			(!R5 (?X_C ROAD.N))
			(!R6 (?X_C DEAD.A))
			(!R7 (?X_C RABBIT.N))
			(!R8 (?X_B (HOME.ADV DRIVE.V)))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_E)))
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
	              (COMPOSITE-SCHEMA-104.PR ?X_G (K HOME.N)
	               (KA ((ADV-A (ON.P ?X_I)) CHECK.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G RABBIT.N))
			(!R2 (?X_G (ON.P ?X_I)))
			(!R3 (?X_I ROAD.N))
			(!R4 (?X_I DEAD.A))
			(!R5 (?X_I RABBIT.N))
			(!R6 (?X_H AGENT.N))
			(!R7 (?X_H (HOME.ADV DRIVE.V)))
			(!R8 (NOT ((KA ((ADV-A (ON.P ?X_I)) CHECK.V)) AGENT.N)))
			(!R9 (NOT (?X_H = (KA ((ADV-A (ON.P ?X_I)) CHECK.V)))))
		)
		(:STEPS
			(?X_F (?X_H (HIT.V ?X_G)))
			(?X_D (?X_H ((OUT.PRT GET.18.V) (KA ((ADV-A (ON.P ?X_I)) CHECK.V)))))
			(?X_B (?X_H (DRIVE.V (K HOME.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_D)))
			(!W2 (?X_F (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent home drive hits a rabbit on a road dead rabbit."
			"A agent home drive get.119s on a road dead rabbit checking out."
			"A agent home drive drives home."
	)
)



(
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-105.PR ?X_D (KA (HAVE.V ?X_H)))) ** ?E)
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-106.PR (K (PLUR NUT.N)) (K (PLUR CRUMB.N))))
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
	              (COMPOSITE-SCHEMA-107.PR (K (TO.P (?X_B SING.V))) ?X_B
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.22.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B MARKET.N))
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
	    ((ADV-A (DESTINATION_PREP.? ?X_B))
	     ((ADV-A (TO.P ?X_B))
	      ((ADV-A (FOR.P (KA (GET.V (K (PLUR CLOTHE.N)))))) GO.22.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.22.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.22.V) ?X_B))
			(?X_C (?X_A GO.22.V))
			(?X_C (?X_A GO.22.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.22.V)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.23.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.23.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.23.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.23.V) ?X_B))
			(?X_C (?X_A GO.23.V))
			(?X_C (?X_A GO.23.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.23.V)))
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
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-108.PR (KA ((ADV-A (LIKE.P ?X_J)) LOOK.V)) ?X_E
	               ?X_N ?X_M))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E (PLUR SANDAL.N)))
			(!R2 (?X_J (PLUR PERSON.N)))
			(!R3 (?X_M DESTINATION.N))
			(!R4 (?X_N DESTINATION.N))
			(!R5 (?X_N MARKET.N))
			(!R6 (?X_O AGENT.N))
		)
		(:STEPS
			(?X_L (?X_O ((ADV-A (FROM.P ?L1)) GO.23.V) ?X_M))
			(?X_I (?X_O (WANT.V (KA ((ADV-A (LIKE.P ?X_J)) LOOK.V)))))
			(?X_G (?X_O ((ADV-A (FROM.P ?L1)) GO.22.V) ?X_N))
			(?X_D (?X_O (SEE.V ?X_E)))
			(?X_B (?X_O (BUY.V ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_I)))
			(!W2 (?X_L (BEFORE ?X_G)))
			(!W3 (?X_L (BEFORE ?X_D)))
			(!W4 (?X_L (BEFORE ?X_B)))
			(!W5 (?X_I (BEFORE ?X_G)))
			(!W6 (?X_I (BEFORE ?X_D)))
			(!W7 (?X_I (BEFORE ?X_B)))
			(!W8 (?X_G (BEFORE ?X_D)))
			(!W9 (?X_G (BEFORE ?X_B)))
			(!W10 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent go.170s a destination from L1."
			"A agent wants like a persons looking."
			"A agent go.169s a destination market from L1."
			"A agent sees a sandals."
			"A agent buys a sandals."
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.24.V (KA (AGAIN.ADV WATCH.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (AGAIN.ADV WATCH.V) ?X_B) ACTION.N))
			(!R3 (?X_B SHOW.N))
			(!R4 (?X_B (VERY.ADV FUNNY.A)))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA (AGAIN.ADV WATCH.V) ?X_B) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_C (?X_A (WANT.V (KA (AGAIN.ADV WATCH.V) ?X_B))))
			(?X_C (?X_A (LIKE.V (KA (AGAIN.ADV WATCH.V) ?X_B))))
			(?X_C (?X_A (LOVE.V (KA (AGAIN.ADV WATCH.V) ?X_B))))
			(?X_C (?X_A (ENJOY.V (KA (AGAIN.ADV WATCH.V) ?X_B))))
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
	(EPI-SCHEMA (((ADV-E (DURING (K YESTERDAY.N))) (?X_A (WATCH.3.V ?X_B))) **
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
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-109.PR (KA (AGAIN.ADV WATCH.V) ?X_G) ?X_G)) **
	             ?E)
		(:ROLES
			(!R1 (?X_G (VERY.ADV FUNNY.A)))
			(!R2 (?X_G SHOW.N))
			(!R3 (?X_H AGENT.N))
		)
		(:STEPS
			(?X_D (?X_H ((ADV (OUT.ADV LOUD.A)) LAUGH.V)))
			(?X_F ((ADV-E (DURING (K YESTERDAY.N))) (?X_H (WATCH.3.V ?X_G))))
			(?X_B (?X_H ENJOY_ACTION.24.V (KA (AGAIN.ADV WATCH.V) ?X_G)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_B)))
		)
	)
	(
			"A agent laughs ADV out loud."
			"A agent watch.190s a very funny show DURING yesterday."
			"A agent enjoy action.192s again watch a very funny show."
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.25.V (KA VOMIT.V)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA VOMIT.V) ACTION.N))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA VOMIT.V) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_B (?X_A (WANT.V (KA VOMIT.V))))
			(?X_B (?X_A (LIKE.V (KA VOMIT.V))))
			(?X_B (?X_A (LOVE.V (KA VOMIT.V))))
			(?X_B (?X_A (ENJOY.V (KA VOMIT.V))))
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
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-110.PR (KA (LIKE.V ?X_G)) (KA (AGAIN.ADV DRINK.V))
	               (KA VOMIT.V)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G WINE.N))
			(!R2 ((KA VOMIT.V) ACTION.N))
			(!R3 (?X_H AGENT.N))
		)
		(:STEPS
			(?X_F (?X_H (WANT.V (KA (LIKE.V ?X_G)))))
			(?X_B (?X_H ((NEVER.ADV WANT.V) (KA (AGAIN.ADV DRINK.V)))))
			(?X_D (?X_H ENJOY_ACTION.25.V (KA VOMIT.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_B)))
		)
	)
	(
			"A agent wants liking a wine."
			"A agent wants again drink never."
			"A agent enjoy action.200s vomiting."
	)
)



(
	(EPI-SCHEMA ((?X_A TAKE.14.V (SET-OF ?X_B ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT ((SET-OF ?X_B ?X_C) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (SET-OF ?X_B ?X_C))))
			(!R5 (?X_B ROD.N))
			(!R6 (?X_B LONG.A))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AFTER ?X_E)))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-111.PR ?X_D (SET-OF ?X_I ?X_J))) ** ?E)
		(:ROLES
			(!R1 (?X_D POND.N))
			(!R2 (?X_D FISH.N))
			(!R3 (?X_D (PERTAIN-TO ?X_E)))
			(!R4 (?X_I ROD.N))
			(!R5 (?X_I LONG.A))
			(!R6 (?X_H AGENT.N))
			(!R7 (?X_J HOOK.N))
			(!R8 (NOT ((SET-OF ?X_I ?X_J) AGENT.N)))
			(!R9 (NOT (?X_H = (SET-OF ?X_I ?X_J))))
		)
		(:STEPS
			(?X_B (?X_A ((FISH.ADV IN.P) ?X_D)))
			(?X_C (?X_H TAKE.14.V (SET-OF ?X_I ?X_J)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_C)))
		)
	)
	(
			"X_A is fish in."
			"A agent take.213s a rod long and a hook."
	)
)



(
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-112.PR ?X_D ?X_E)) ** ?E)
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
	              (COMPOSITE-SCHEMA-113.PR
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.24.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C PASS.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A ARM.N))
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
	    ((ADV-A (DESTINATION_PREP.? ?X_C))
	     (OUT.PRT ((ADV-A (FOR.P ?X_C)) GO.24.V)))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.24.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.24.V) ?X_C))
			(?X_D (?X_B GO.24.V))
			(?X_D (?X_B GO.24.V ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? GO.24.V)))
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-114.PR ?X_I ?X_N ?X_E ?X_M)) ** ?E)
		(:ROLES
			(!R1 (?X_E GROUND.N))
			(!R2 (?X_H PERSON.N))
			(!R3 (?X_I PARKING.N))
			(!R4 (?X_I LOT.N))
			(!R5 (?X_L ARM.N))
			(!R6 (?X_L (PERTAIN-TO ?X_N)))
			(!R7 (?X_M DESTINATION.N))
			(!R8 (?X_M PASS.N))
			(!R9 (?X_N AGENT.N))
		)
		(:STEPS
			(?X_K (?X_N ((ADV-A (FROM.P ?L1)) GO.24.V) ?X_M))
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
			"A agent go.244s a destination pass from L1."
			"A agent is on."
			"A agent is in."
			"A person guards a agent."
			"A agent hits a ground hard."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) FALL.4.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.4.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.4.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.4.V) ?L2))
			(?X_C (?X_B (DOWN.ADV FALL.4.V)))
			(?X_C (?X_B FALL.4.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? FALL.4.V)))
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-115.PR (KA (SEE.V ?X_L)) ?X_I ?X_N ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_I HEAD.N))
			(!R2 (?X_I (PERTAIN-TO ?X_N)))
			(!R3 (?X_L VIEW.N))
			(!R4 (?X_M AGENT.N))
			(!R5 (?X_N AGENT.N))
			(!R6 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_K (?X_M (WANT.V (KA (SEE.V ?X_L)))))
			(?X_F (?X_N (((ADV (REALLY.ADV HARD.A)) HIT.V) ?X_I)))
			(?X_H (?X_N ((ADV-A (FROM.P ?L1)) FALL.4.V) ?L2))
			(?X_B (?X_N (((ADV (REALLY.ADV HARD.A)) HIT.V) ?X_I)))
			(?X_D (?X_A (((ADV (BACK.ADV DOWN.A)) CARRY.V) ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_H)))
			(!W2 (?X_K (BEFORE ?X_B)))
			(!W3 (?X_K (BEFORE ?X_D)))
			(!W4 (?X_F (BEFORE ?X_B)))
			(!W5 (?X_F (BEFORE ?X_D)))
			(!W6 (?X_H (BEFORE ?X_B)))
			(!W7 (?X_H (BEFORE ?X_D)))
			(!W8 (?X_B (BEFORE ?X_D)))
		)
	)
	(
			"A agent wants seeing a view."
			"A agent hits a head of a agent ADV really hard."
			"A agent fall.251s a destination from L1."
			"A agent hits a head of a agent ADV really hard."
			"X_A carries a agent ADV back down."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.25.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) GO.25.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.25.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) GO.25.V) ?L2))
			(?X_B (?X_A GO.25.V))
			(?X_B (?X_A GO.25.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? GO.25.V)))
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
	(EPI-SCHEMA ((?X_A GET.19.V ?X_B) ** ?X_C)
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-116.PR ?X_G ?L2 ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_G PHONE.N))
			(!R2 (?L2 DESTINATION.N))
			(!R3 (?X_H AGENT.N))
			(!R4 (NOT (?X_I AGENT.N)))
			(!R5 (NOT (?X_H = ?X_I)))
		)
		(:STEPS
			(?X_F (?X_H (WANT.V ?X_G)))
			(?X_B (?X_H ((ADV-A (FROM.P ?L1)) GO.25.V) ?L2))
			(?X_D (?X_H GET.19.V ?X_I))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_B)))
			(!W2 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A agent wants a phone."
			"A agent go.259s a destination from L1."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-117.PR (K GLUE.N) ?X_F ?X_I)) ** ?E)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (WITH.P ?X_A)) PLAY.13.V)) ** ?X_B)
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
			(?X_B (?X_A ((ADV-A (WITH.P ?T)) PLAY.13.V)))
			(?X_B (?X_A PLAY.13.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (AFTER ?X_C)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-118.PR ?X_F ?X_A)) ** ?E)
		(:ROLES
			(!R1 (?X_F MOUSE.N))
			(!R2 (?X_I OLD.A))
			(!R3 (?X_I CAT.N))
			(!R4 (?X_I (HAS.V ?X_G)))
			(!R5 (?X_H (PERTAIN-TO ?X_I)))
			(!R6 (?X_H ?X_I (PLUR KITTEN.N)))
			(!R7 (?X_L MOUSE.N))
		)
		(:STEPS
			(?X_E (?X_I ((CAN.AUX CATCH.V) ?X_F)))
			(?X_B (?X_I (((ADV-A (TO.P ?X_H)) GIVE.V) ?X_A)))
			(?X_C (?X_I (((ADV-A (TO.P ?X_H)) GIVE.V) ?X_A)))
			(E56.SK (?X_L ((ADV-A (WITH.P ?X_L)) PLAY.13.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_B)))
			(!W2 (?X_E (BEFORE ?X_C)))
			(!W3 (?X_B (BEFORE ?X_C)))
		)
	)
	(
			"A old cat has X_G catches a mouse can."
			"A old cat has X_G gives X_A to a of a old cat has X_G."
			"A old cat has X_G gives X_A to a of a old cat has X_G."
			"A mouse play.26s with a mouse."
	)
)



(
	(EPI-SCHEMA ((?X_A EAT.3.V (K FOOD.N)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-119.PR
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
			(!R7 ((K FOOD.N) FOOD.N))
			(!R8 ((K FOOD.N) (PERTAIN-TO ?X_M)))
		)
		(:STEPS
			(?X_L (?X_M (RUN.V (K (L X (AND (X OUT.P) (X (OF.P (K FOOD.N)))))))))
			(?X_F (?X_J (((ADV-A (FROM.P ?X_H)) BUY.V) ?X_G)))
			(?X_D (?X_M (EAT.V (K FOOD.N))))
			(?X_B (?X_M EAT.3.V (K FOOD.N)))
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
			"A cat eats food."
			"A cat eat.43s food."
	)
)



(
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-120.PR ?X_C (K COLD.A)
	               (KE ((K SOAP.N) (IN.P ?X_K))) ?X_K))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C SHOWER.V))
			(!R2 (?X_F HOT.A))
			(!R3 (?X_F WATER.N))
			(!R4 (?X_L MAN.N))
			(!R5 (?X_K HAIR.N))
			(!R6 (?X_K (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(?X_E (?X_L (TAKE.V ?X_C)))
			(?X_H (?X_F (GO.V (K COLD.A))))
			(?X_J (?X_L ((STILL.ADV HAVE.V) (KE ((K SOAP.N) (IN.P ?X_K))))))
			(?X_A (?X_L ((STILL.ADV HAVE.V) (KE ((K SOAP.N) (IN.P ?X_K))))))
			(?X_B (?X_L ((QUICKLY.ADV WASH.V) ?X_K)))
			(?X_N (?X_L ((QUICKLY.ADV WASH.V) ?X_K)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_H)))
			(!W2 (?X_E (BEFORE ?X_J)))
			(!W3 (?X_E (BEFORE ?X_A)))
			(!W4 (?X_E (BEFORE ?X_B)))
			(!W5 (?X_E (BEFORE ?X_N)))
			(!W6 (?X_H (BEFORE ?X_J)))
			(!W7 (?X_H (BEFORE ?X_A)))
			(!W8 (?X_H (BEFORE ?X_B)))
			(!W9 (?X_H (BEFORE ?X_N)))
			(!W10 (?X_J (BEFORE ?X_A)))
			(!W11 (?X_J (BEFORE ?X_B)))
			(!W12 (?X_J (BEFORE ?X_N)))
			(!W13 (?X_A (BEFORE ?X_B)))
			(!W14 (?X_A (BEFORE ?X_N)))
			(!W15 (?X_B (BEFORE ?X_N)))
		)
	)
	(
			"A man takes a shower."
			"A hot water goes cold."
			"A man has soap in a hair of a man still."
			"A man has soap in a hair of a man still."
			"A man washes a hair of a man quickly."
			"A man washes a hair of a man quickly."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.20.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_A (GET.20.V (K (SO.ADV BIG.A)))))
			(!R6 (?X_B (FOR.P ?X_A)))
			(!R7 (?X_B (K SMASH.N) CAKE.N))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E (COMPOSITE-SCHEMA-121.PR (K SMASH.N) ?X_F)) ** ?E)
		(:ROLES
			(!R1 (?X_F (FOR.P ?X_E)))
			(!R2 (?X_F (K SMASH.N) CAKE.N))
			(!R3 (?X_E AGENT.N))
			(!R4 (NOT (?X_F AGENT.N)))
			(!R5 (NOT (?X_E = ?X_F)))
		)
		(:STEPS
			(?X_D (?X_E GET.20.V ?X_F))
			(?X_B (?X_E (LOVE.V (K SMASH.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent get.86s a for a agent."
			"A agent loves smash."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.26.V)
	              (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C)))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C)) DESTINATION.N))
			(!R4 (NOT (?L1 = (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C)))))
			(!R5 (?X_C FARM.N))
		)
		(:GOALS
			(?G1
	   (?X_A
	    (WANT.V
	     (KA ((ADV-A (AT.P (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C)))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C)))))
		)
		(:PARAPHRASES
			(?X_D
	   (?X_A
	    ((ADV-A (DESTINATION_PREP.? (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C))))
	     ((ADV-A (FOR.P (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C)))) GO.26.V))))
			(?X_D
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C))))
	      GO.26.V))))
			(?X_D
	   (?X_A
	    ((ADV-A (DESTINATION_PREP.? (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C))))
	     GO.26.V)
	    (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C))))
			(?X_D (?X_A GO.26.V))
			(?X_D (?X_A GO.26.V (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C))))
			(?X_D (?X_A (LOCATION_ADV.? GO.26.V)))
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
	              (COMPOSITE-SCHEMA-122.PR ?X_A ?X_H
	               (KA (((ADV-A (ON.P ?X_M)) VISIT.V) ?X_O))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E DAY.N))
			(!R2 (?X_E FUN.N))
			(!R3 (?X_E VERY.A))
			(!R4 (?X_H LOT.N))
			(!R5 (?X_H (OF.P (K (PLUR ANIMAL.N)))))
			(!R6 ((KA (((ADV-A (ON.P ?X_M)) VISIT.V) ?X_O)) DESTINATION.N))
			(!R7 (?X_N AGENT.N))
			(!R8 (?X_O FARM.N))
		)
		(:STEPS
			(?X_L
	   (?X_N ((ADV-A (FROM.P ?L1)) GO.26.V)
	    (KA (((ADV-A (ON.P ?X_M)) VISIT.V) ?X_O))))
			(?X_J (?X_B (BE.V ?X_A)))
			(?X_G (?X_O (HAVE.V ?X_H)))
			(?X_D ((ADV-E (DURING ?X_E)) (?X_B BE.V)))
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
			"A agent go.103s on X_M visiting a farm from L1."
			"X_B is X_A."
			"A farm has a lot of animals."
			"X_B is DURING a day fun very."
	)
)



(
	(EPI-SCHEMA ((?X_E ((ADV-A (FROM.P ?L1)) RUN.14.V) ?L2) ** ?X_F)
		(:ROLES
			(!R1 (?X_E COW.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A GOOD.A))
			(!R6 (?X_A MAN.N))
			(!R7 (?X_E (WITH.P ?X_A)))
			(!R8 (?X_A (TO.P ?X_C)))
			(!R9 (?X_C DOG.N))
			(!R10 (?X_B BIG.A))
			(!R11 (?X_B HAT.N))
			(!R12 (?X_C (HAS.V ?X_B)))
			(!R13 (?X_D LITTLE.A))
			(!R14 (?X_D GOOD.A))
			(!R15 (?X_D DOG.N))
			(!R16 (?X_C (IS.V ?X_D)))
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
		(:PARAPHRASES
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.14.V)))
			(?X_F
	   (?X_E ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.14.V))))
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.14.V) ?L2))
			(?X_F (?X_E (CAN.AUX RUN.14.V)))
			(?X_F (?X_E RUN.14.V ?L2))
			(?X_F (?X_E (LOCATION_ADV.? RUN.14.V)))
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
	(EPI-SCHEMA ((?X_E ((ADV-A (FROM.P ?L1)) RUN.15.V) ?L2) ** ?X_F)
		(:ROLES
			(!R1 (?X_E COW.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_E (WITH.P ?X_A)))
			(!R6 (?X_A GOOD.A))
			(!R7 (?X_A MAN.N))
			(!R8 (?X_C DOG.N))
			(!R9 (?X_A (TO.P ?X_C)))
			(!R10 (?X_B DOG.N))
			(!R11 (?X_B GOOD.A))
			(!R12 (?X_C (IS.V ?X_B)))
			(!R13 (?X_B LITTLE.A))
			(!R14 (?X_D BIG.A))
			(!R15 (?X_C (HAS.V ?X_D)))
			(!R16 (?X_D HAT.N))
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
		(:PARAPHRASES
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.15.V)))
			(?X_F
	   (?X_E ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.15.V))))
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.15.V) ?L2))
			(?X_F (?X_E (CAN.AUX RUN.15.V)))
			(?X_F (?X_E RUN.15.V ?L2))
			(?X_F (?X_E (LOCATION_ADV.? RUN.15.V)))
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
	(EPI-SCHEMA ((?X_C TRANSPORT_OBJECT.14.V ?X_D) ** ?X_F)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?X_D HAT.N))
			(!R3 (?X_D SMALLER-THAN.N ?X_C))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_E DESTINATION.N))
			(!R6 (?X_C (HAS.V ?X_D)))
			(!R7 (?X_D BIG.A))
			(!R8 (?X_E (TO.P ?X_C)))
			(!R9 (?X_E MAN.N))
			(!R10 (?X_E GOOD.A))
			(!R11 (?X_A (WITH.P ?X_E)))
			(!R12 (?X_A COW.N))
			(!R13 (?X_B LITTLE.A))
			(!R14 (?X_B DOG.N))
			(!R15 (?X_C (IS.V ?X_B)))
			(!R16 (?X_B GOOD.A))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D ((ADV-A (AT.P ?X_E)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_D ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_D ((ADV-A (AT.P ?X_E)) BE.V)))
		)
		(:PARAPHRASES
			(?X_F (?X_C ((MAY.AUX ((ADV-A (TO.P ?X_E)) TAKE.V)) ?X_D)))
			(?X_F (?X_C ((ADV-A (TO.P ?X_E)) CARRY.V) ?X_D))
			(?X_F (?X_C ((ADV-A (TO.P ?X_E)) BRING.V) ?X_D))
			(?X_F (?X_C (LOCATION_ADV.? TAKE.V) ?X_D))
			(?X_F (?X_C (LOCATION_ADV.? CARRY.V) ?X_D))
			(?X_F (?X_C (LOCATION_ADV.? BRING.V) ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_F))
			(!W2 (?P1 POSTCOND-OF ?X_F))
			(!W3 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-123.PR (SET-OF ?X_I ?X_L ?X_N) ?L2 ?X_M)) **
	             ?E)
		(:ROLES
			(!R1 (?X_I GOOD.A))
			(!R2 (?X_I MAN.N))
			(!R3 (?X_I (TO.P ?X_L)))
			(!R4 (?X_N (WITH.P ?X_I)))
			(!R5 (?X_J AGENT.N))
			(!R6 (?X_K GOOD.A))
			(!R7 (?X_K LITTLE.A))
			(!R8 (?X_K DOG.N))
			(!R9 (?X_L (IS.V ?X_K)))
			(!R10 (?X_M SMALLER-THAN.N ?X_L))
			(!R11 (?X_M HAT.N))
			(!R12 (?X_M BIG.A))
			(!R13 (?X_L DOG.N))
			(!R14 (?X_L (HAS.V ?X_M)))
			(!R15 (?X_N COW.N))
			(!R16 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_H (?X_J (SEE.V (SET-OF ?X_I ?X_L ?X_N))))
			(?X_F (?X_L TRANSPORT_OBJECT.14.V ?X_M))
			(?X_D (?X_N ((ADV-A (FROM.P ?L1)) RUN.14.V) ?L2))
			(?X_D (?X_N ((ADV-A (FROM.P ?L1)) RUN.15.V) ?L2))
			(?X_B (NOT (?X_N (CAN.AUX PLAY.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_D)))
			(!W3 (?X_H (BEFORE ?X_B)))
			(!W4 (?X_F (BEFORE ?X_D)))
			(!W5 (?X_F (BEFORE ?X_B)))
			(!W6 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent sees a good man to a dog is a good little dog has a hat big a dog is a good little dog has a hat big and a cow with a good man to a dog is X_K has a hat big."
			"A dog is a good little dog has a hat big transport object.115s a hat big."
			"A cow with a good man to a dog is X_K has a hat big run.122s a destination from L1."
			"A cow with a good man to a dog is X_K has a hat big run.124s a destination from L1."
			"A cow with a good man to a dog is X_K has a hat big plays not can."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-124.PR ?X_A ?X_H)) ** ?E)
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?X_A)) GO.27.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_A CORNER.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?X_A = ?L2)))
			(!R5 (?L2 HOME.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.27.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?X_A)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.27.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.27.V) ?L2))
			(?X_C (?X_B GO.27.V))
			(?X_C (?X_B GO.27.V ?L2))
			(?X_C (?X_B (INSTEAD.ADV GO.27.V)))
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
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-125.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_G LINE.N))
			(!R2 (?X_I CORNER.N))
			(!R3 (?X_H AGENT.N))
			(!R4 (NOT (?X_I = ?L2)))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?L2 HOME.N))
		)
		(:STEPS
			(?X_F (?X_G (LONG.ADV (TOO.ADV (FAR.ADV BE.V)))))
			(?X_D (?X_G ((ADV-A (AROUND.P ?X_I)) BE.V)))
			(?X_B (?X_H ((ADV-A (FROM.P ?X_I)) GO.27.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_D)))
			(!W2 (?X_F (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A line is long too far."
			"A line is around a corner."
			"A agent go.152s a destination home from a corner."
	)
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-126.PR (K BAD.A) ?X_C ?X_I)) ** ?E)
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
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?X_C)) RUN.16.V) ?L2) ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C END.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?X_C = ?L2)))
			(!R5 (?X_B PARK.N))
			(!R6 (?X_A (PERTAIN-TO ?X_D)))
			(!R7 (?X_A DOG.N))
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.16.V)))
			(?X_E
	   (?X_D ((ADV-A (FROM.P ?X_C)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.16.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.16.V) ?L2))
			(?X_E (?X_D ((ADV-A (THROUGH.P ?X_B)) RUN.16.V)))
			(?X_E (?X_D RUN.16.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? RUN.16.V)))
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
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?X_C)) SWIM.1.V) ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C PARK.N))
			(!R3 (?X_E DESTINATION.N))
			(!R4 (NOT (?X_C = ?X_E)))
			(!R5 (?X_B LAKE.N))
			(!R6 (?X_A DOG.N))
			(!R7 (?X_A (PERTAIN-TO ?X_D)))
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
			(?X_F (?X_D ((ADV-A (DESTINATION_PREP.? ?X_E)) SWIM.1.V)))
			(?X_F
	   (?X_D
	    ((ADV-A (FROM.P ?X_C)) ((ADV-A (DESTINATION_PREP.? ?X_E)) SWIM.1.V))))
			(?X_F (?X_D ((ADV-A (DESTINATION_PREP.? ?X_E)) SWIM.1.V) ?X_E))
			(?X_F (?X_D ((ADV-A (IN.P ?X_B)) SWIM.1.V)))
			(?X_F (?X_D SWIM.1.V ?X_E))
			(?X_F (?X_D (LOCATION_ADV.? SWIM.1.V)))
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
	(EPI-SCHEMA ((?X_R
	              (COMPOSITE-SCHEMA-127.PR (KA ((ADV-A (WITH.P ?X_O)) PLAY.V))
	               (K CATCH.N)
	               (K (L X (AND (X TO.P) (X ((ADV-A (IN.P ?X_H)) SWIM.V))))) ?L2
	               ?X_T))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H LAKE.N))
			(!R2 (?X_O DOG.N))
			(!R3 (?X_O (PERTAIN-TO ?X_R)))
			(!R4 (NOT (?X_T = ?L2)))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_S PARK.N))
			(!R7 (?X_T DESTINATION.N))
			(!R8 (?X_R AGENT.N))
			(!R9 (NOT (?X_S = ?X_T)))
		)
		(:STEPS
			(?X_L (?X_R ((ADV-A (WITH.P ?X_O)) PLAY.V)))
			(?X_G
	   (?X_R (LOVE.V (K (L X (AND (X TO.P) (X ((ADV-A (IN.P ?X_H)) SWIM.V))))))))
			(?X_N (?X_R ((ADV-A (FROM.P ?X_T)) RUN.16.V) ?L2))
			(?X_C (?X_R (LOVE.V (KA ((ADV-A (WITH.P ?X_O)) PLAY.V)))))
			(?X_J (?X_B (PLAY.V (K CATCH.N))))
			(?X_D (?X_R TO.P))
			(?X_E (?X_R ((ADV-A (FROM.P ?X_S)) SWIM.1.V) ?X_T))
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
			"A agent plays with a dog of a agent."
			"A agent loves to swimming."
			"A agent run.165s a destination from a destination."
			"A agent loves with a dog of a agent playing."
			"X_B plays catch."
			"A agent is to."
			"A agent swim.166s a destination from a park."
	)
)



(
	(EPI-SCHEMA (((K SUSIE.N) (COMPOSITE-SCHEMA-128.PR ?X_D)) ** ?E)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) RUN.17.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A CAT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.17.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.17.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.17.V) ?L2))
			(?X_B (?X_A ((ADV-A (AT.P ?X_A)) RUN.17.V)))
			(?X_B (?X_A RUN.17.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? RUN.17.V)))
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-129.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_C HEN.N))
			(!R2 (?X_C CAT.N))
			(!R3 (?L2 DESTINATION.N))
		)
		(:STEPS
			(E219.SK (?X_C ((ADV-A (FROM.P ?L1)) RUN.17.V) ?L2))
		)
	)
	(
			"A hen cat run.191s a destination from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-130.PR (KA ((ADV-A (ON.P ?X_E)) RIDE.V))
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
	(EPI-SCHEMA ((?X_D ((IN.PRT ((ADV-A (FROM.P (K OUTSIDE.N))) COME.3.V)) ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D SON.N))
			(!R2 ((K OUTSIDE.N) LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT ((K OUTSIDE.N) = ?L2)))
			(!R5 (?X_D (IS.V ?X_A)))
			(!R6 (?X_A LITTLE.A))
			(!R7 (?X_A CHILD.N))
			(!R8 (?X_B AGENT.N))
			(!R9 (?X_D (PERTAIN-TO ?X_B)))
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) COME.3.V)))
			(?X_E
	   (?X_D
	    ((ADV-A (FROM.P (K OUTSIDE.N)))
	     ((ADV-A (DESTINATION_PREP.? ?L2)) COME.3.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) COME.3.V) ?L2))
			(?X_E (?X_D COME.3.V))
			(?X_E (?X_D COME.3.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? COME.3.V)))
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
	(EPI-SCHEMA ((?X_D ((IN.PRT ((ADV-A (FROM.P (K OUTSIDE.N))) COME.4.V)) ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D SON.N))
			(!R2 ((K OUTSIDE.N) LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT ((K OUTSIDE.N) = ?L2)))
			(!R5 (?X_A (PERTAIN-TO ?X_D)))
			(!R6 (?X_A FRIEND.N))
			(!R7 (?X_B LITTLE.A))
			(!R8 (?X_D (IS.V ?X_B)))
			(!R9 (?X_B CHILD.N))
			(!R10 (?X_D (PERTAIN-TO ?X_C)))
			(!R11 (?X_C AGENT.N))
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) COME.4.V)))
			(?X_E
	   (?X_D
	    ((ADV-A (FROM.P (K OUTSIDE.N)))
	     ((ADV-A (DESTINATION_PREP.? ?L2)) COME.4.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) COME.4.V) ?L2))
			(?X_E (?X_D COME.4.V))
			(?X_E (?X_D COME.4.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? COME.4.V)))
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
	(EPI-SCHEMA ((?X_A GET.21.V (K BETTER.A)) ** ?X_B)
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
			(!W1 (?I1 PRECOND-OF ?X_B))
			(!W2 (?I2 PRECOND-OF ?X_B))
			(!W3 (?I3 PRECOND-OF ?X_B))
			(!W4 (?P1 POSTCOND-OF ?X_B))
			(!W5 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A MAKE.9.V ?X_B) ** ?X_C)
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-131.PR ?X_L (K BETTER.A) ?X_M)) ** ?E)
		(:ROLES
			(!R1 (?X_C (PLUR PERSON.N)))
			(!R2 (NOT ((K BETTER.A) AGENT.N)))
			(!R3 (NOT (?X_L = (K BETTER.A))))
			(!R4 (?X_L SINGER.N))
			(!R5 (?X_M ALBUM.N))
			(!R6 (NOT (?X_M AGENT.N)))
		)
		(:STEPS
			(?X_K (?X_L (HARD.ADV WORK.V)))
			(?X_I (?X_L GET.21.V (K BETTER.A)))
			(?X_G ((K (PLUR PERSON.N)) (NOTICE.V ?X_L)))
			(?X_E (?X_L MAKE.9.V ?X_M))
			(?X_B (?X_C (BUY.V ?X_M)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_G)))
			(!W3 (?X_K (BEFORE ?X_E)))
			(!W4 (?X_K (BEFORE ?X_B)))
			(!W5 (?X_I (BEFORE ?X_G)))
			(!W6 (?X_I (BEFORE ?X_E)))
			(!W7 (?X_I (BEFORE ?X_B)))
			(!W8 (?X_G (BEFORE ?X_E)))
			(!W9 (?X_G (BEFORE ?X_B)))
			(!W10 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A singer works hard."
			"A singer get.246s better."
			"Persons notice a singer."
			"A singer make.243s a album."
			"A persons buy a album."
	)
)



(
	(EPI-SCHEMA ((?X_E ((ADV-A (FROM.P ?X_D)) GO.28.V) ?L2) ** ?X_F)
		(:ROLES
			(!R1 (?X_E GIRL.N))
			(!R2 (?X_D HOME.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?X_D = ?L2)))
			(!R5 (?X_E LOST.A))
			(!R6 (?X_C STREET.N))
			(!R7 (?X_A (PLUR FRIEND.N)))
			(!R8 (?X_A (PERTAIN-TO ?X_E)))
			(!R9 (?X_D (PERTAIN-TO ?X_B)))
			(!R10 (?X_B (PLUR PARENT.N)))
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
		(:PARAPHRASES
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) GO.28.V)))
			(?X_F
	   (?X_E ((ADV-A (FROM.P ?X_D)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.28.V))))
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) GO.28.V) ?L2))
			(?X_F (?X_E ((ADV-A (ACROSS.P ?X_C)) GO.28.V)))
			(?X_F (?X_E GO.28.V ?L2))
			(?X_F (?X_E (LOCATION_ADV.? GO.28.V)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?X_B)) GO.29.V)
	              (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C GIRL.N))
			(!R2 (?X_B HOME.N))
			(!R3 ((KA ((ADV-A (WITH.P ?X_D)) PLAY.V)) DESTINATION.N))
			(!R4 (NOT (?X_B = (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))))
			(!R5 (?X_C LOST.A))
			(!R6 (?X_D (PERTAIN-TO ?X_C)))
			(!R7 (?X_D (PLUR FRIEND.N)))
			(!R8 (?X_B (PERTAIN-TO ?X_A)))
			(!R9 (?X_A (PLUR PARENT.N)))
		)
		(:GOALS
			(?G1
	   (?X_C
	    (WANT.V (KA ((ADV-A (AT.P (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_C (AT.P ?X_B)))
			(?I2 (NOT (?X_C (AT.P (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_C (AT.P ?X_B))))
			(?P2 (?X_C (AT.P (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))))
		)
		(:PARAPHRASES
			(?X_E
	   (?X_C
	    ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
	     ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))) GO.29.V))))
			(?X_E
	   (?X_C
	    ((ADV-A (FROM.P ?X_B))
	     ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
	      GO.29.V))))
			(?X_E
	   (?X_C
	    ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))) GO.29.V)
	    (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
			(?X_E (?X_C GO.29.V))
			(?X_E (?X_C GO.29.V (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
			(?X_E (?X_C (LOCATION_ADV.? GO.29.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (BEFORE ?X_F)))
			(!W7 (?X_G (SAME-TIME ?X_F)))
			(!W8 (?X_G (RIGHT-AFTER ?X_H)))
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
	              (COMPOSITE-SCHEMA-132.PR ?X_O ?X_N ?L2
	               (KA ((ADV-A (WITH.P ?X_M)) PLAY.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G (PLUR PARENT.N)))
			(!R2 (?X_O (PERTAIN-TO ?X_G)))
			(!R3 (?X_J STREET.N))
			(!R4 (?X_M (PERTAIN-TO ?X_N)))
			(!R5 (?X_M (PLUR FRIEND.N)))
			(!R6 ((KA ((ADV-A (WITH.P ?X_M)) PLAY.V)) DESTINATION.N))
			(!R7 (NOT (?X_O = (KA ((ADV-A (WITH.P ?X_M)) PLAY.V)))))
			(!R8 (?X_O HOME.N))
			(!R9 (?X_N GIRL.N))
			(!R10 (?X_N LOST.A))
			(!R11 (NOT (?X_O = ?L2)))
			(!R12 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_D (?X_G (FIND.V ?X_N ?X_O)))
			(?X_L
	   (?X_N ((ADV-A (FROM.P ?X_O)) GO.29.V) (KA ((ADV-A (WITH.P ?X_M)) PLAY.V))))
			(?X_A (?X_N ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_M)) PLAY.V)))) GO.V)))
			(?X_I (?X_N ((ADV-A (FROM.P ?X_O)) GO.28.V) ?L2))
			(?X_F (?X_G (OVER.PRT ((ADV-A (FOR.P (KA (GET.V ?X_N)))) GO.V))))
			(?X_B (?X_G (((ADV-A (IN.P ?X_O)) FIND.V) ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
			(!W2 (?X_L (BEFORE ?X_A)))
			(!W3 (?X_L (BEFORE ?X_I)))
			(!W4 (?X_L (BEFORE ?X_F)))
			(!W5 (?X_L (BEFORE ?X_B)))
			(!W6 (?X_A (BEFORE ?X_I)))
			(!W7 (?X_A (BEFORE ?X_F)))
			(!W8 (?X_A (BEFORE ?X_B)))
			(!W9 (?X_I (BEFORE ?X_F)))
			(!W10 (?X_I (BEFORE ?X_B)))
			(!W11 (?X_F (BEFORE ?X_B)))
		)
	)
	(
			"A parents find a girl lost a home of a parents."
			"A girl lost go.247s with a friends of a girl lost playing from a home of a parents."
			"A girl lost goes for with a friends of a girl lost playing."
			"A girl lost go.248s a destination from a home of a parents."
			"A parents go over for getting a girl lost."
			"A parents find a girl lost in a home of a parents."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-133.PR) ** ?E)
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
	              (COMPOSITE-SCHEMA-134.PR (K MORE.A)
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
	(EPI-SCHEMA ((?X_D (MAY.AUX ((ADV-A (NEAR.P ?X_A)) PLAY.14.V))) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C TOY.N))
			(!R3 (NOT (?X_C AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A WHILE.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_B FEMALE.A))
			(!R9 (?X_B AGENT.N))
			(!R10 (?X_C SOFT.A))
			(!R11 (?X_C MAT.N))
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
		(:PARAPHRASES
			(?X_F (?X_D ((ADV-A (WITH.P ?X_C)) PLAY.14.V)))
			(?X_F (?X_D PLAY.14.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (RIGHT-AFTER ?X_E)))
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
	(EPI-SCHEMA ((?X_D (MAY.AUX ((ADV-A (NEAR.P ?X_A)) PLAY.15.V))) ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C TOY.N))
			(!R3 (NOT (?X_C AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A WHILE.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_B FEMALE.A))
			(!R9 (?X_B AGENT.N))
			(!R10 (?X_C SOFT.A))
			(!R11 (?X_C MAT.N))
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
		(:PARAPHRASES
			(?X_E (?X_D ((ADV-A (WITH.P ?X_C)) PLAY.15.V)))
			(?X_E (?X_D PLAY.15.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (AT-ABOUT ?X_F)))
			(!W2 (?X_G (SAME-TIME ?X_F)))
			(!W3 (?X_G (RIGHT-AFTER ?X_H)))
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
	(EPI-SCHEMA ((?X_C ((MAY.AUX ((ADV-A (NEAR.P ?X_A)) PLAY.16.V)) ?O)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?X_A WHILE.N))
			(!R4 (?X_A (PERTAIN-TO ?X_B)))
			(!R5 (?X_B FEMALE.A))
			(!R6 (?X_B AGENT.N))
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
			(!W1 (?X_D (SAME-TIME ?X_G)))
			(!W2 (?X_D (RIGHT-AFTER ?X_E)))
			(!W3 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-135.PR ?O)) ** ?E)
		(:ROLES
			(!R1 (?X_E SOFT.A))
			(!R2 (?X_E MAT.N))
			(!R3 (?X_F FEMALE.A))
			(!R4 (?X_F AGENT.N))
			(!R5 (?X_H (PERTAIN-TO ?X_F)))
			(!R6 (NOT (?O AGENT.N)))
			(!R7 (?X_G AGENT.N))
			(!R8 (?X_H WHILE.N))
		)
		(:STEPS
			(?X_D ((K BABY.N) ((ADV-A (ON.P ?X_E)) SIT.V)))
			(E331.SK (?X_G (MAY.AUX ((ADV-A (NEAR.P ?X_H)) PLAY.14.V))))
			(E331.SK (?X_G ((MAY.AUX ((ADV-A (NEAR.P ?X_H)) PLAY.16.V)) ?O)))
			(?X_B (?X_G (MAY.AUX ((ADV-A (NEAR.P ?X_H)) PLAY.15.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D BEFORE E331.SK))
			(!W2 (E331.SK BEFORE ?X_B))
		)
	)
	(
			"Baby sits on a soft mat."
			"A agent play.285s may near a while of a female agent."
			"A agent play.297s O may near a while of a female agent."
			"A agent play.286s may near a while of a female agent."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-136.PR ?X_B)) ** ?E)
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
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?X_C)) COME.5.V) ?L2) ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (?X_C OUTSIDE.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?X_C = ?L2)))
			(!R5 (?X_B GARAGE.N))
			(!R6 (?X_D (PERTAIN-TO ?X_A)))
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) COME.5.V)))
			(?X_E
	   (?X_D ((ADV-A (FROM.P ?X_C)) ((ADV-A (DESTINATION_PREP.? ?L2)) COME.5.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) COME.5.V) ?L2))
			(?X_E (?X_D ((ADV-A (INTO.P ?X_B)) COME.5.V)))
			(?X_E (?X_D COME.5.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? COME.5.V)))
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
	              (COMPOSITE-SCHEMA-137.PR (K (PLUR PUPPY.N))
	               (K (L X (AND (X COLD.A) (X OUTSIDE.N)))) ?X_N ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G GARAGE.N))
			(!R2 (?X_M (PERTAIN-TO ?X_L)))
			(!R3 (?X_N OUTSIDE.N))
			(!R4 (?X_N PUPPY.A))
			(!R5 (?X_M DOG.N))
			(!R6 (NOT (?X_N = ?L2)))
			(!R7 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_K (?X_M (HAVE.V (K (PLUR PUPPY.N)))))
			(?X_I (?X_A (BE.V (K (L X (AND (X COLD.A) (X OUTSIDE.N)))))))
			(?X_F (?X_M ((ADV-A (FROM.P ?X_N)) COME.5.V) ?L2))
			(?X_D (?X_M (HAVE.V ?X_N)))
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
			"A dog of X_L has puppys."
			"X_A is cold outside."
			"A dog of X_L come.309s a destination from a outside puppy."
			"A dog of X_L has a outside puppy."
	)
)



(
	(EPI-SCHEMA ((?X_A (((ADV-A (INTO.P ?X_B)) GIVE.8.V) ?X_A ?X_B)) ** ?X_E)
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
		(:PARAPHRASES
			(?X_E (?X_A ((ADV-A (TO.P ?X_A)) (GIVE.8.V ?X_B))))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (INTO.P ?X_B)) GIVE.9.V) ?X_A ?X_B)) ** ?X_C)
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
		(:PARAPHRASES
			(?X_C (?X_A ((ADV-A (TO.P ?X_A)) (GIVE.9.V ?X_B))))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-138.PR (K GUILTY.A) ?X_K ?X_L)) ** ?E)
		(:ROLES
			(!R1 (?X_L CRAVING.N))
			(!R2 (?X_K MAN.N))
			(!R3 (NOT (?X_L AGENT.N)))
		)
		(:STEPS
			(?X_J (?X_K (HAVE.V ?X_L)))
			(?X_H (?X_K (IGNORE.V ?X_L)))
			(?X_F (?X_L GROW.V))
			(?X_D (?X_K (((ADV-A (INTO.P ?X_L)) GIVE.8.V) ?X_K ?X_L)))
			(?X_D (?X_K (((ADV-A (INTO.P ?X_L)) GIVE.9.V) ?X_K ?X_L)))
			(?X_B (?X_K (FEEL.V (K GUILTY.A))))
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
			"A man give.326s a man a craving into a craving."
			"A man give.325s a man a craving into a craving."
			"A man feels guilty."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) RUN.18.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.18.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.18.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.18.V) ?L2))
			(?X_B (?X_A (OFF.PRT RUN.18.V)))
			(?X_B (?X_A RUN.18.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? RUN.18.V)))
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
	              (COMPOSITE-SCHEMA-139.PR
	               (KE (AND (?X_L (PASV STICK.V)) (?X_L (IN.P ?X_J)))) ?X_L
	               (KE (?X_A LIFE.N)) ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J TREE.N))
			(!R2 (?X_K (HOME.ADV WALK.V)))
			(!R3 (?X_L DOG.N))
			(!R4 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_I (?X_K (SEE.V (KE (AND (?X_L (PASV STICK.V)) (?X_L (IN.P ?X_J)))))))
			(?X_G (?X_K (((ADV-A (FROM.P ?X_J)) FREE.V) ?X_L)))
			(?X_E (?X_L ((ADV-A (FROM.P ?L1)) RUN.18.V) ?L2))
			(?X_C (?X_K (SAVE.V (KE (?X_A LIFE.N)))))
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
			"A dog run.338s a destination from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.22.V ?X_B) ** ?X_C)
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-140.PR ?X_H (K GREAT.A) ?X_K)) ** ?E)
		(:ROLES
			(!R1 (?X_H LOT.N))
			(!R2 (?X_H (OF.P (K (L X (AND (X SPLIT.A) (X (PLUR END.N))))))))
			(!R3 (?X_K (PLUR SCISSOR.N)))
			(!R4 (?X_J AGENT.N))
			(!R5 (NOT (?X_K AGENT.N)))
			(!R6 (NOT (?X_J = ?X_K)))
		)
		(:STEPS
			(?X_A (?X_J (HAVE.V ?X_H)))
			(?X_G (?X_J GET.22.V ?X_K))
			(?X_E (?X_J ((THEN.ADV (OFF.ADV CUT.V)) ?X_H)))
			(?X_C (?X_J ((THEN.ADV LOOK.V) (K GREAT.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_G)))
			(!W2 (?X_A (BEFORE ?X_E)))
			(!W3 (?X_A (BEFORE ?X_C)))
			(!W4 (?X_G (BEFORE ?X_E)))
			(!W5 (?X_G (BEFORE ?X_C)))
			(!W6 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A agent has a lot of split end."
			"A agent get.5s a scissors."
			"A agent cuts a lot of split end then off."
			"A agent looks great then."
	)
)



(
	(EPI-SCHEMA (((K DOG.N) COMPOSITE-SCHEMA-141.PR) ** ?E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_B (PERTAIN-TO ?X_D)))
			(!R3 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:STEPS
			(?X_A ((K DOG.N) SIT.V))
			(?X_F ((K DOG.N) ((ADV-A (AT.P ?X_D)) LOOK.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_F)))
		)
	)
	(
			"Dog sits."
			"Dog looks at a agent."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?X_A)) WALK.4.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B PERSON.N))
			(!R2 (?X_A SIDE.N))
			(!R3 (?X_C DESTINATION.N))
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
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) WALK.4.V)))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?X_A)) ((ADV-A (DESTINATION_PREP.? ?X_C)) WALK.4.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) WALK.4.V) ?X_C))
			(?X_D (?X_B WALK.4.V))
			(?X_D (?X_B ((UP.PRT WALK.4.V) ?X_C)))
			(?X_D (?X_B (LOCATION_ADV.? WALK.4.V)))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-142.PR ?X_J ?X_A ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_J ROCK.N))
			(!R2 (?X_K BOY.N))
			(!R3 (?X_M SIDE.N))
			(!R4 (?X_M HILL.N))
			(!R5 (?X_L PERSON.N))
			(!R6 (?X_N DESTINATION.N))
			(!R7 (?X_N HILL.N))
			(!R8 (NOT (?X_M = ?X_N)))
		)
		(:STEPS
			(?X_I (?X_K (KICK.V ?X_J)))
			(?X_G (?X_J (LOOSE.ADV COME.V)))
			(?X_E (?X_L ((ADV-A (FROM.P ?X_M)) WALK.4.V) ?X_N))
			(?X_C (?X_J ((ALMOST.ADV HIT.V) ?X_A)))
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
			"A boy kicks a rock."
			"A rock comes loose."
			"A person walk.31s a destination hill from a side hill."
			"A rock hits X_A almost."
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.15.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C PUPPY.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_C SAD.A))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_A (K NEW.A) PET.N))
			(!R9 (?L2 HOME.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C ((ADV-A (AT.P ?L2)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_C ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C ((ADV-A (AT.P ?L2)) BE.V)))
		)
		(:PARAPHRASES
			(?X_D (?X_B ((ADV-A (TO.P ?L2)) TAKE.V) ?X_C))
			(?X_D (?X_B ((ADV-A (TO.P ?L2)) CARRY.V) ?X_C))
			(?X_D (?X_B ((ADV-A (TO.P ?L2)) BRING.V) ?X_C))
			(?X_D (?X_B (((ADV-A (AS.P ?X_A)) TAKE.V) ?X_C)))
			(?X_D (?X_B CARRY.V ?X_C))
			(?X_D (?X_B BRING.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?P1 POSTCOND-OF ?X_D))
			(!W3 (?X_D (SAME-TIME ?X_G)))
			(!W4 (?X_D (RIGHT-AFTER ?X_E)))
			(!W5 (?X_F (BEFORE ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.30.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D POUND.N))
			(!R6 (?X_A (K NEW.A) PET.N))
			(!R7 (?X_A (PERTAIN-TO ?X_C)))
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
		(:PARAPHRASES
			(?X_E
	   (?X_C
	    ((ADV-A (DESTINATION_PREP.? ?X_D))
	     ((ADV-A (TO.P ?X_D))
	      ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_B)) LOOK.V)))) GO.30.V)))))
			(?X_E
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.30.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.30.V) ?X_D))
			(?X_E (?X_C GO.30.V))
			(?X_E (?X_C GO.30.V ?X_D))
			(?X_E (?X_C (LOCATION_ADV.? GO.30.V)))
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
	              (((ADV-A (AT.P ?X_H)) ((ADV-A (AS.P ?X_A)) TAKE.15.V)) ?X_C))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C PUPPY.N))
			(!R6 (?X_C SAD.A))
			(!R7 (?X_A (K NEW.A) PET.N))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
			(!R9 (?X_H HOME.N))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (SAME-TIME ?X_G)))
			(!W6 (?X_D (RIGHT-AFTER ?X_E)))
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
	(EPI-SCHEMA ((?X_P (COMPOSITE-SCHEMA-143.PR (KA (GET.V ?X_M)) ?X_N ?X_Q)) ** ?E)
		(:ROLES
			(!R1 (?X_M NEW.A))
			(!R2 (?X_M PET.N))
			(!R3 (?X_N DESTINATION.N))
			(!R4 (?X_N POUND.N))
			(!R5 (?X_Q SMALLER-THAN.N ?X_P))
			(!R6 (?X_P AGENT.N))
			(!R7 (?X_Q PUPPY.N))
			(!R8 (?X_Q SAD.A))
			(!R9 (?X_O (K NEW.A) PET.N))
			(!R10 (?X_O (PERTAIN-TO ?X_P)))
			(!R11 (NOT (?X_P = ?X_Q)))
		)
		(:STEPS
			(?X_L (?X_P (WANT.V (KA (GET.V ?X_M)))))
			(?X_C (?X_P ((HOME.ADV ((ADV-A (AS.P ?X_O)) TAKE.V)) ?X_Q)))
			(?X_J (?X_P ((ADV-A (FROM.P ?L1)) GO.30.V) ?X_N))
			(?X_G (?X_P (SEE.V ?X_Q)))
			(?X_E (?X_P (DEEPLY.ADV ((ADV-A (FOR.P ?X_Q)) FEEL.V))))
			(?X_A (?X_P TRANSPORT_OBJECT.15.V ?X_Q))
			(?X_A (?X_P (((ADV-A (AT.P ?X_H)) ((ADV-A (AS.P ?X_O)) TAKE.15.V)) ?X_Q)))
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
			"A agent wants getting a new pet."
			"A agent takes a puppy sad home as a of a agent."
			"A agent go.55s a destination pound from L1."
			"A agent sees a puppy sad."
			"A agent feels deeply for a puppy sad."
			"A agent transport object.49s a puppy sad."
			"A agent take.59s a puppy sad at X_H as a of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-144.PR ?X_C
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?X_A)) LEAVE.1.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B COW.N))
			(!R2 (?X_A FIELD.N))
			(!R3 (?X_C DESTINATION.N))
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
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) LEAVE.1.V)))
			(?X_D
	   (?X_B
	    ((ADV-A (FROM.P ?X_A)) ((ADV-A (DESTINATION_PREP.? ?X_C)) LEAVE.1.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) LEAVE.1.V) ?X_C))
			(?X_D (?X_B LEAVE.1.V))
			(?X_D (?X_B LEAVE.1.V ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? LEAVE.1.V)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.21.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A COW.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B FIELD.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B DESTINATION.N))
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
	    ((ADV-A (DESTINATION_PREP.? ?X_B))
	     (OUT.ADV ((ADV-A (TO.P ?X_B)) GO.21.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.21.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.21.V) ?X_B))
			(?X_C (?X_A GO.21.V))
			(?X_C (?X_A GO.21.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.21.V)))
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
	(EPI-SCHEMA ((?X_B EAT.4.V ?X_A) ** ?X_C)
		(:ROLES
			(!R1 (?X_B COW.N))
			(!R2 (?X_A FOOD.N))
			(!R3 (?X_A GRASS.N))
			(!R4 (?X_A SPOT.N))
			(!R5 (?X_A (OF.P (K GRASS.N))))
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-145.PR ?X_L ?X_M ?X_O)) ** ?E)
		(:ROLES
			(!R1 (?X_G (PLUR COW.N)))
			(!R2 (?X_G OTHER.A))
			(!R3 (?X_L DESTINATION.N))
			(!R4 (?X_L BARN.N))
			(!R5 (NOT (?X_M = ?X_L)))
			(!R6 (?X_M DESTINATION.N))
			(!R7 (?X_M FIELD.N))
			(!R8 (?X_N COW.N))
			(!R9 (?X_O FOOD.N))
			(!R10 (?X_O GRASS.N))
			(!R11 (?X_O (OF.P (K GRASS.N))))
			(!R12 (?X_O SPOT.N))
		)
		(:STEPS
			(?X_K (?X_N ((ADV-A (FROM.P ?X_M)) LEAVE.1.V) ?X_L))
			(?X_I (?X_N ((ADV-A (FROM.P ?L1)) GO.21.V) ?X_M))
			(?X_A (?X_G OUT.P))
			(?X_B (?X_G (IN.P ?X_M)))
			(?X_F (?X_N (FIND.V ?X_O)))
			(?X_D (?X_N EAT.4.V ?X_O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_A)))
			(!W3 (?X_K (BEFORE ?X_B)))
			(!W4 (?X_K (BEFORE ?X_F)))
			(!W5 (?X_K (BEFORE ?X_D)))
			(!W6 (?X_I (BEFORE ?X_A)))
			(!W7 (?X_I (BEFORE ?X_B)))
			(!W8 (?X_I (BEFORE ?X_F)))
			(!W9 (?X_I (BEFORE ?X_D)))
			(!W10 (?X_A (BEFORE ?X_B)))
			(!W11 (?X_A (BEFORE ?X_F)))
			(!W12 (?X_A (BEFORE ?X_D)))
			(!W13 (?X_B (BEFORE ?X_F)))
			(!W14 (?X_B (BEFORE ?X_D)))
			(!W15 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A cow leave.73s a destination barn from a destination field."
			"A cow go.74s a destination field from L1."
			"A cows other are out."
			"A cows other are in."
			"A cow finds a food grass of grass spot."
			"A cow eat.85s a food grass of grass spot."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-146.PR
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
	(EPI-SCHEMA ((?X_A GET.23.V ?X_B) ** ?X_C)
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_D (CONSEC ?X_C)))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-147.PR ?X_B ?X_G ?X_J)) ** ?E)
		(:ROLES
			(!R1 (?X_G TREE.N))
			(!R2 (NOT (?X_J AGENT.N)))
			(!R3 (NOT (?X_K = ?X_J)))
			(!R4 (?X_K AGENT.N))
		)
		(:STEPS
			(?X_I (?X_A (K (PLUR EGG.N)) (HAVE.V ?X_B)))
			(?X_F (?X_K ((UP.PRT GO.V) ?X_G)))
			(?X_D (?X_K GET.23.V ?X_J))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_F)))
			(!W2 (?X_I (BEFORE ?X_D)))
			(!W3 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"X_A has X_B."
			"A agent goes a tree up."
			"A agent get.113s X_J."
	)
)



(
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-148.PR ?X_M ?X_J ?X_K ?X_N)) ** ?E)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.31.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PLUR KID.N)))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) GO.31.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.31.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) GO.31.V) ?L2))
			(?X_B (?X_A ((ADV (BACK.ADV INSIDE.A)) GO.31.V)))
			(?X_B (?X_A GO.31.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? GO.31.V)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.32.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B (PLUR KID.N)))
			(!R6 (?X_A RAIN.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.32.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.32.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.32.V) ?L2))
			(?X_C (?X_B (OUT.ADV ((ADV-A (IN.P ?X_A)) GO.32.V))))
			(?X_C (?X_B GO.32.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? GO.32.V)))
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
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-149.PR (K (VERY.ADV WET.A)) ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_G RAIN.N))
			(!R2 (?X_H (PLUR KID.N)))
			(!R3 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_F (?X_H ((ADV-A (FROM.P ?L1)) GO.32.V) ?L2))
			(?X_D (?X_H (BECOME.V (K (VERY.ADV WET.A)))))
			(?X_B (?X_H ((ADV-A (FROM.P ?L1)) GO.31.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_D)))
			(!W2 (?X_F (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A kids go.150 a destination from L1."
			"A kids become very wet."
			"A kids go.149 a destination from L1."
	)
)



(
	(EPI-SCHEMA ((?X_B ((OUT.PRT GET.24.V) (KA (SEE.V ?X_C)))) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((KA (SEE.V ?X_C)) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (KA (SEE.V ?X_C)))))
			(!R5 (?X_B (HOME.ADV DRIVE.V)))
			(!R6 (?X_B (SAD.A (KE (?X_B (KILL.V ?X_C))))))
			(!R7 (?X_C DEAD.A))
			(!R8 (?X_C DOG.N))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-150.PR ?X_G (KA (SEE.V ?X_G)))) ** ?E)
		(:ROLES
			(!R1 (?X_E ROAD.N))
			(!R2 (?X_G (IN.P ?X_E)))
			(!R3 (?X_F AGENT.N))
			(!R4 (?X_F (HOME.ADV DRIVE.V)))
			(!R5 (?X_F (SAD.A (KE (?X_F (KILL.V ?X_G))))))
			(!R6 (?X_G DEAD.A))
			(!R7 (?X_G DOG.N))
			(!R8 (NOT ((KA (SEE.V ?X_G)) AGENT.N)))
			(!R9 (NOT (?X_F = (KA (SEE.V ?X_G)))))
		)
		(:STEPS
			(?X_D (?X_F (HIT.V ?X_G)))
			(?X_B (?X_F ((OUT.PRT GET.24.V) (KA (SEE.V ?X_G)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent home drive sad a agent home drive sad X_F kills a dead dog in X_E kills a dead dog in a road hits a dead dog in a road."
			"A agent home drive sad a agent home drive sad X_F kills a dead dog in X_E kills a dead dog in a road get.166s seeing a dead dog in a road out."
	)
)



(
	(EPI-SCHEMA ((?X_B INFORM.12.V ?X_C ?I) ** ?X_D)
		(:ROLES
			(!R1 (?X_B DOG.N))
			(!R2 (?X_C AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_C BARK.N))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
			(!R7 (?X_A AGENT.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_D (?X_B TELL.V ?X_C ?I))
			(?X_D (?X_B ((OUT.PRT LET.V) ?X_C (KA (KNOW.V ?I)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B DREAM.1.V ?O) ** ?X_C)
		(:ROLES
			(!R1 (?X_B DOG.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?X_A AGENT.N))
			(!R4 (?X_B (PERTAIN-TO ?X_A)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-151.PR ?X_J ?I ?O)) ** ?E)
		(:ROLES
			(!R1 (?X_E FLOOR.N))
			(!R2 (?X_H AGENT.N))
			(!R3 (?X_I (PERTAIN-TO ?X_H)))
			(!R4 (NOT (?O AGENT.N)))
			(!R5 (?X_I DOG.N))
			(!R6 (NOT (?I ACTION.N)))
			(!R7 (?X_J AGENT.N))
			(!R8 (?X_J BARK.N))
			(!R9 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_D (?X_I ((ADV-A (ON.P ?X_E)) LIE.V)))
			(?X_G (?X_I DREAM.1.V ?O))
			(?X_B (?X_I INFORM.12.V ?X_J ?I))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_B)))
		)
	)
	(
			"A dog of a agent lies on a floor."
			"A dog of a agent dream.188s O."
			"A dog of a agent inform.172s a agent bark a information."
	)
)



(
	(EPI-SCHEMA (((K (PLUR BIRD.N)) ((ADV-A (FROM.P ?L1)) BECOME.1.V) ?X_B) **
	             ?X_C)
		(:ROLES
			(!R1 ((K (PLUR BIRD.N)) AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B (PLUR FRIEND.N)))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
			(!R7 (?X_A MALE.A))
			(!R8 (?X_A AGENT.N))
		)
		(:GOALS
			(?G1 ((K (PLUR BIRD.N)) (WANT.V (KA ((ADV-A (AT.P ?X_B)) BE.V)))))
		)
		(:PRECONDS
			(?I1 ((K (PLUR BIRD.N)) (AT.P ?L1)))
			(?I2 (NOT ((K (PLUR BIRD.N)) (AT.P ?X_B))))
		)
		(:POSTCONDS
			(?P1 (NOT ((K (PLUR BIRD.N)) (AT.P ?L1))))
			(?P2 ((K (PLUR BIRD.N)) (AT.P ?X_B)))
		)
		(:PARAPHRASES
			(?X_C ((K (PLUR BIRD.N)) ((ADV-A (DESTINATION_PREP.? ?X_B)) BECOME.1.V)))
			(?X_C
	   ((K (PLUR BIRD.N))
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) BECOME.1.V))))
			(?X_C
	   ((K (PLUR BIRD.N)) ((ADV-A (DESTINATION_PREP.? ?X_B)) BECOME.1.V) ?X_B))
			(?X_C ((K (PLUR BIRD.N)) BECOME.1.V))
			(?X_C ((K (PLUR BIRD.N)) BECOME.1.V ?X_B))
			(?X_C ((K (PLUR BIRD.N)) (LOCATION_ADV.? BECOME.1.V)))
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
	(EPI-SCHEMA (((K (PLUR BIRD.N)) ((ADV-A (FROM.P ?L1)) BECOME.2.V) ?X_B) **
	             ?X_C)
		(:ROLES
			(!R1 ((K (PLUR BIRD.N)) AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B (PLUR FRIEND.N)))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
			(!R7 (?X_A MALE.A))
			(!R8 (?X_A AGENT.N))
		)
		(:GOALS
			(?G1 ((K (PLUR BIRD.N)) (WANT.V (KA ((ADV-A (AT.P ?X_B)) BE.V)))))
		)
		(:PRECONDS
			(?I1 ((K (PLUR BIRD.N)) (AT.P ?L1)))
			(?I2 (NOT ((K (PLUR BIRD.N)) (AT.P ?X_B))))
		)
		(:POSTCONDS
			(?P1 (NOT ((K (PLUR BIRD.N)) (AT.P ?L1))))
			(?P2 ((K (PLUR BIRD.N)) (AT.P ?X_B)))
		)
		(:PARAPHRASES
			(?X_C ((K (PLUR BIRD.N)) ((ADV-A (DESTINATION_PREP.? ?X_B)) BECOME.2.V)))
			(?X_C
	   ((K (PLUR BIRD.N))
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) BECOME.2.V))))
			(?X_C
	   ((K (PLUR BIRD.N)) ((ADV-A (DESTINATION_PREP.? ?X_B)) BECOME.2.V) ?X_B))
			(?X_C ((K (PLUR BIRD.N)) BECOME.2.V))
			(?X_C ((K (PLUR BIRD.N)) BECOME.2.V ?X_B))
			(?X_C ((K (PLUR BIRD.N)) (LOCATION_ADV.? BECOME.2.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_C (SAME-TIME ?X_F)))
			(!W7 (?X_C (RIGHT-AFTER ?X_D)))
			(!W8 (?X_E (BEFORE ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.16.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B ENTITY.N))
			(!R3 (?X_B SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?L2 OUTSIDE.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B ((ADV-A (AT.P ?L2)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_B ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B ((ADV-A (AT.P ?L2)) BE.V)))
		)
		(:PARAPHRASES
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) TAKE.V) ?X_B))
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) CARRY.V) ?X_B))
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) BRING.V) ?X_B))
			(?X_C (?X_A (TAKE.V ?X_B)))
			(?X_C (?X_A CARRY.V ?X_B))
			(?X_C (?X_A BRING.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?P1 POSTCOND-OF ?X_C))
			(!W3 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A WATCH.4.V (K (PLUR BIRD.N))) ** ?X_B)
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
			(?I1 (?X_A (CAN.MD (SEE.V (K (PLUR BIRD.N))))))
		)
		(:POSTCONDS
			(?P1 ((K (PLUR BIRD.N)) (KNOW.V ?I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (AT-ABOUT ?X_C)))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (AT.P ?X_E)) TAKE.16.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_E OUTSIDE.N))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
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
	              (COMPOSITE-SCHEMA-152.PR (K (PLUR BINOCULAR.N)) ?X_P
	               (K (PLUR BIRD.N)) ?X_N))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M MALE.A))
			(!R2 (?X_M AGENT.N))
			(!R3 (?X_P (PERTAIN-TO ?X_M)))
			(!R4 (?X_N SMALLER-THAN.N ?X_O))
			(!R5 (NOT (?X_N AGENT.N)))
			(!R6 (NOT (?X_O = ?X_N)))
			(!R7 (?X_O AGENT.N))
			(!R8 ((K (PLUR BIRD.N)) AGENT.N))
			(!R9 (?X_P DESTINATION.N))
			(!R10 (?X_P (PLUR FRIEND.N)))
		)
		(:STEPS
			(?X_L (?X_O (BUY.V (K (PLUR BINOCULAR.N)))))
			(?X_C ((K (PLUR BIRD.N)) ((ADV-A (FROM.P ?L1)) BECOME.1.V) ?X_P))
			(?X_J (?X_O TRANSPORT_OBJECT.16.V ?X_N))
			(?X_J (?X_O (((ADV-A (AT.P ?X_E)) TAKE.16.V) ?X_N)))
			(?X_H (?X_O (SEE.V (K (PLUR BIRD.N)))))
			(?X_F (?X_O WATCH.4.V (K (PLUR BIRD.N))))
			(?X_A ((K (PLUR BIRD.N)) ((ADV-A (FROM.P ?L1)) BECOME.2.V) ?X_P))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_J)))
			(!W2 (?X_L (BEFORE ?X_H)))
			(!W3 (?X_L (BEFORE ?X_F)))
			(!W4 (?X_L (BEFORE ?X_A)))
			(!W5 (?X_C (BEFORE ?X_A)))
			(!W6 (?X_J (BEFORE ?X_H)))
			(!W7 (?X_J (BEFORE ?X_F)))
			(!W8 (?X_J (BEFORE ?X_A)))
			(!W9 (?X_H (BEFORE ?X_F)))
			(!W10 (?X_H (BEFORE ?X_A)))
			(!W11 (?X_F (BEFORE ?X_A)))
		)
	)
	(
			"A agent buys binoculars."
			"Birds become.192 a destination friends of a male agent from L1."
			"A agent transport object.190s X_N."
			"A agent take.195s X_N at X_E."
			"A agent sees birds."
			"A agent watch.191s birds."
			"Birds become.193 a destination friends of a male agent from L1."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-153.PR) ** ?E)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.33.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B STORE.N))
			(!R6 (?X_B PET.N))
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.33.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.33.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.33.V) ?X_B))
			(?X_C (?X_A GO.33.V))
			(?X_C (?X_A GO.33.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.33.V)))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-154.PR ?X_L ?X_A ?X_E ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_E LIZARD.N))
			(!R2 (?X_L PET.N))
			(!R3 (?X_M AGENT.N))
			(!R4 (?X_N DESTINATION.N))
			(!R5 (?X_N STORE.N))
			(!R6 (?X_N PET.N))
		)
		(:STEPS
			(?X_K (?X_M (WANT.V ?X_L)))
			(?X_I (?X_M ((ADV-A (FROM.P ?L1)) GO.33.V) ?X_N))
			(?X_B (?X_A LIZARD.N))
			(?X_G (?X_M (FIND.V ?X_A)))
			(?X_D (?X_M (BUY.V ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_B)))
			(!W3 (?X_K (BEFORE ?X_G)))
			(!W4 (?X_K (BEFORE ?X_D)))
			(!W5 (?X_I (BEFORE ?X_B)))
			(!W6 (?X_I (BEFORE ?X_G)))
			(!W7 (?X_I (BEFORE ?X_D)))
			(!W8 (?X_B (BEFORE ?X_D)))
			(!W9 (?X_G (BEFORE ?X_D)))
		)
	)
	(
			"A agent wants a pet."
			"A agent go.228s a destination store pet from L1."
			"X_A is lizard."
			"A agent finds X_A."
			"A agent buys a lizard."
	)
)



(
	(EPI-SCHEMA ((?X_B EAT.5.V ?X_A) ** ?X_C)
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
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-155.PR ?X_C)) ** ?E)
		(:ROLES
			(!R1 (?X_C FOOD.N))
			(!R2 (?X_C BIG.A))
			(!R3 (?X_C MUFFIN.N))
			(!R4 (?X_D AGENT.N))
		)
		(:STEPS
			(?X_B (?X_D EAT.5.V ?X_C))
		)
	)
	(
			"A agent eat.245s a food big muffin."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.34.V)
	              (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N))) DESTINATION.N))
			(!R4 (NOT (?L1 = (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N))))))
			(!R5 (?X_B AGENT.N))
		)
		(:GOALS
			(?G1
	   (?X_A
	    (WANT.V
	     (KA ((ADV-A (AT.P (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N)))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N))))))
		)
		(:PARAPHRASES
			(?X_C
	   (?X_A
	    ((ADV-A (DESTINATION_PREP.? (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N)))))
	     ((ADV-A (FOR.P (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N))))) GO.34.V))))
			(?X_C
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A
	       (DESTINATION_PREP.? (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N)))))
	      GO.34.V))))
			(?X_C
	   (?X_A
	    ((ADV-A (DESTINATION_PREP.? (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N)))))
	     GO.34.V)
	    (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N)))))
			(?X_C (?X_A GO.34.V))
			(?X_C (?X_A GO.34.V (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N)))))
			(?X_C (?X_A (LOCATION_ADV.? GO.34.V)))
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-156.PR
	               (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N)))))) ?X_M
	               (KA (FORWARD.ADV PAY.V) ?X_B)
	               (KA (((ADV-A (FOR.P ?X_M)) BUY.V) (K GAS.N)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I PERSON.N))
			(!R2 (?X_L TIME.N))
			(!R3 ((KA (((ADV-A (FOR.P ?X_M)) BUY.V) (K GAS.N))) DESTINATION.N))
			(!R4 (?X_M AGENT.N))
			(!R5 (?X_N AGENT.N))
		)
		(:STEPS
			(?X_K (?X_L ?X_M (RUN.V (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N)))))))))
			(?X_H (?X_I (SEE.V ?X_M)))
			(?X_F
	   (?X_N ((ADV-A (FROM.P ?L1)) GO.34.V)
	    (KA (((ADV-A (FOR.P ?X_M)) BUY.V) (K GAS.N)))))
			(?X_D (?X_N (TELL.V ?X_M (KA (FORWARD.ADV PAY.V) ?X_B))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_H)))
			(!W2 (?X_K (BEFORE ?X_F)))
			(!W3 (?X_K (BEFORE ?X_D)))
			(!W4 (?X_H (BEFORE ?X_F)))
			(!W5 (?X_H (BEFORE ?X_D)))
			(!W6 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A time runs out of."
			"A person sees a agent."
			"A agent go.254s for a agent buying gas from L1."
			"A agent tells a agent forward pay X_B."
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.17.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B LOT.N))
			(!R3 (?X_B SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 ((KA LOOK.V) DESTINATION.N))
			(!R6 (?X_B (OF.P (K GROUND.N))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B ((ADV-A (AT.P (KA LOOK.V))) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_B ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B ((ADV-A (AT.P (KA LOOK.V))) BE.V)))
		)
		(:PARAPHRASES
			(?X_C
	   (?X_A
	    (((ADV-A (TO.P (KA LOOK.V))) ((ADV-A (FOR.P (KA LOOK.V))) TAKE.V)) ?X_B)))
			(?X_C (?X_A ((ADV-A (TO.P (KA LOOK.V))) CARRY.V) ?X_B))
			(?X_C (?X_A ((ADV-A (TO.P (KA LOOK.V))) BRING.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? TAKE.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? CARRY.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? BRING.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?P1 POSTCOND-OF ?X_C))
			(!W3 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J
	              (COMPOSITE-SCHEMA-157.PR ?X_I (KA (HELP.V (FIND.V ?X_H))) ?X_H ?X_K))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H DOG.N))
			(!R2 (?X_I FRIEND.N))
			(!R3 (?X_J (VERY.ADV UPSET.A)))
			(!R4 (?X_I (PERTAIN-TO ?X_J)))
			(!R5 (?X_K SMALLER-THAN.N ?X_L))
			(!R6 (?X_K LOT.N))
			(!R7 (?X_K (OF.P (K GROUND.N))))
			(!R8 (?X_L AGENT.N))
			(!R9 ((KA LOOK.V) DESTINATION.N))
		)
		(:STEPS
			(?X_A (?X_J (ASK.V ?X_I (KA (HELP.V (FIND.V ?X_H))))))
			(?X_G (?X_J (ASK.V ?X_I (KA (HELP.V (FIND.V ?X_H))))))
			(?X_C (?X_L ((NEVER.ADV FIND.V) ?X_H)))
			(?X_E (?X_L TRANSPORT_OBJECT.17.V ?X_K))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_G)))
			(!W2 (?X_A (BEFORE ?X_C)))
			(!W3 (?X_G (BEFORE ?X_C)))
		)
	)
	(
			"A very upset asks a friend of a very upset helping find a dog."
			"A very upset asks a friend of a very upset helping find a dog."
			"A agent finds a dog never."
			"A agent transport object.272s a lot of ground."
	)
)



(
	(EPI-SCHEMA ((?X_A MAKE.10.V ?X_B) ** ?X_C)
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-158.PR ?X_D)) ** ?E)
		(:ROLES
			(!R1 (?X_D PRETTY.A))
			(!R2 (?X_D DRESS.N))
			(!R3 (?X_C GIRL.N))
			(!R4 (NOT (?X_D AGENT.N)))
		)
		(:STEPS
			(?X_B (?X_C MAKE.10.V ?X_D))
		)
	)
	(
			"A girl make.287s a pretty dress."
	)
)



(
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-159.PR (K (PLUR RAINBOW.N)) ?X_J)) ** ?E)
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-160.PR ?X_D ?X_I)) ** ?E)
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
	(EPI-SCHEMA ((?X_B INFORM.13.V (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_C))) ?I) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_B FRIEND.N))
			(!R2 ((KE ((K (PLUR GLASS.N)) (SAVE.V ?X_C))) AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_C EYE.N))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
			(!R7 (?X_A MAN.N))
			(!R8 (?X_B (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1
	   (?X_B (WANT.V (THAT ((KE ((K (PLUR GLASS.N)) (SAVE.V ?X_C))) (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 ((KE ((K (PLUR GLASS.N)) (SAVE.V ?X_C))) (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_D (?X_B TELL.V (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_C))) ?I))
			(?X_D (?X_B LET.V (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_C))) (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_G (SAME-TIME ?X_F)))
			(!W3 (?X_E (BEFORE ?X_F)))
			(!W4 (?X_G (RIGHT-AFTER ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B INFORM.14.V (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_C))) ?I) **
	             ?X_E)
		(:ROLES
			(!R1 (?X_B FRIEND.N))
			(!R2 ((KE ((K (PLUR GLASS.N)) (SAVE.V ?X_C))) AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_C EYE.N))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
			(!R8 (?X_A MAN.N))
		)
		(:GOALS
			(?G1
	   (?X_B (WANT.V (THAT ((KE ((K (PLUR GLASS.N)) (SAVE.V ?X_C))) (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 ((KE ((K (PLUR GLASS.N)) (SAVE.V ?X_C))) (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_E (?X_B TELL.V (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_C))) ?I))
			(?X_E (?X_B LET.V (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_C))) (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (RIGHT-AFTER ?X_D)))
			(!W2 (?X_E (SAME-TIME ?X_H)))
			(!W3 (?X_F (BEFORE ?X_H)))
			(!W4 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-161.PR (K (PLUR GLASS.N)) ?X_R ?X_Q
	               (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_Q))) ?I))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M ROCK.N))
			(!R2 (?X_P MAN.N))
			(!R3 (?X_R (PERTAIN-TO ?X_P)))
			(!R4 (?X_Q EYE.N))
			(!R5 (?X_Q (PERTAIN-TO ?X_R)))
			(!R6 ((KE ((K (PLUR GLASS.N)) (SAVE.V ?X_Q))) AGENT.N))
			(!R7 (?X_R FRIEND.N))
			(!R8 (NOT (?I ACTION.N)))
			(!R9 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_O (?X_P (WEAR.V (K (PLUR GLASS.N)))))
			(?X_L (?X_M (HIT.V (K (PLUR GLASS.N)))))
			(?X_J ((K (PLUR GLASS.N)) BREAK.V))
			(?X_H (?X_P (SHOW.V ?X_R)))
			(?X_A (?X_P (SHOW.V ?X_R)))
			(?X_F ((K (PLUR GLASS.N)) (SAVE.V ?X_Q)))
			(?X_D (?X_R INFORM.13.V (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_Q))) ?I))
			(?X_B (?X_R INFORM.14.V (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_Q))) ?I))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_L)))
			(!W2 (?X_O (BEFORE ?X_J)))
			(!W3 (?X_O (BEFORE ?X_A)))
			(!W4 (?X_O (BEFORE ?X_B)))
			(!W5 (?X_L (BEFORE ?X_J)))
			(!W6 (?X_L (BEFORE ?X_A)))
			(!W7 (?X_L (BEFORE ?X_B)))
			(!W8 (?X_J (BEFORE ?X_A)))
			(!W9 (?X_J (BEFORE ?X_B)))
			(!W10 (?X_H (BEFORE ?X_A)))
			(!W11 (?X_H (BEFORE ?X_B)))
			(!W12 (?X_A (BEFORE ?X_B)))
			(!W13 (?X_F (BEFORE ?X_B)))
			(!W14 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A man wears glasss."
			"A rock hits glasss."
			"Glasss break."
			"A man shows a friend of a man."
			"A man shows a friend of a man."
			"Glasss save a eye of a friend of X_P."
			"A friend of a man inform.314s glasss save a eye of a friend of X_P a information."
	)
)



(
	(EPI-SCHEMA ((MUST.AUX-S (?X_B (COOK.1.V ?X_C))) ** ?X_D)
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
	(EPI-SCHEMA ((?X_E (COMPOSITE-SCHEMA-162.PR ?X_E)) ** ?E)
		(:ROLES
			(!R1 (?X_D NIGHT.N))
			(!R2 (?X_D RAINING.A))
			(!R3 (?X_E ((TOO.ADV BAD.A) (KA (OUT.ADV GO.V)))))
			(!R4 (NOT (?X_E AGENT.N)))
			(!R5 (?X_F AGENT.N))
		)
		(:STEPS
			(?X_A ((ADV-E (DURING ?X_D)) (?X_E BE.V)))
			(?X_C (MUST.AUX-S (?X_F (COOK.1.V ?X_E))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_C)))
		)
	)
	(
			"A too bad out go is DURING a night raining."
			"A agent cook.5s a too bad out go must."
	)
)



(
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-163.PR (KA (SEE.V ?X_C)) (KA LEAVE.V))) ** ?E)
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
	(EPI-SCHEMA ((?X_A GET.25.V
	              (K (L X (AND (X OUT.P) (X (OF.P (THE.D POOL.N)))))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT ((K (L X (AND (X OUT.P) (X (OF.P (THE.D POOL.N)))))) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (K (L X (AND (X OUT.P) (X (OF.P (THE.D POOL.N)))))))))
		)
		(:GOALS
			(?G1
	   (?X_A
	    (WANT.V
	     (THAT
	      (?X_A (HAVE.V (K (L X (AND (X OUT.P) (X (OF.P (THE.D POOL.N))))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V (K (L X (AND (X OUT.P) (X (OF.P (THE.D POOL.N)))))))))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 ((K (L X (AND (X OUT.P) (X (OF.P (THE.D POOL.N)))))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V (K (L X (AND (X OUT.P) (X (OF.P (THE.D POOL.N))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
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
	              (COMPOSITE-SCHEMA-164.PR ?X_J ?X_C
	               (K (L X (AND (X OUT.P) (X (OF.P (THE.D POOL.N))))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C HEATER.N))
			(!R2 (?X_C (FOR.P (K WATER.N))))
			(!R3 (?X_J POOL.N))
			(!R4 (?X_K MAN.N))
			(!R5 (NOT ((K (L X (AND (X OUT.P) (X (OF.P (THE.D POOL.N)))))) AGENT.N)))
			(!R6 (NOT (?X_K = (K (L X (AND (X OUT.P) (X (OF.P (THE.D POOL.N)))))))))
		)
		(:STEPS
			(?X_I (?X_K (((ADV-A (WITH.P (K WATER.N))) FILL.V) ?X_J)))
			(?X_G (?X_K ((ADV-A (IN.P ?X_J)) JUMP.V)))
			(?X_E (?X_K GET.25.V (K (L X (AND (X OUT.P) (X (OF.P (THE.D POOL.N))))))))
			(?X_B (?X_K (BUY.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_G)))
			(!W2 (?X_I (BEFORE ?X_E)))
			(!W3 (?X_I (BEFORE ?X_B)))
			(!W4 (?X_G (BEFORE ?X_E)))
			(!W5 (?X_G (BEFORE ?X_B)))
			(!W6 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A man fills a pool with water."
			"A man jumps in a pool."
			"A man get.22s out of."
			"A man buys a heater for water."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.35.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C POND.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A ROD.N))
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
	   (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) GO.35.V))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.35.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.35.V) ?X_C))
			(?X_D (?X_B GO.35.V))
			(?X_D (?X_B GO.35.V ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? GO.35.V)))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-165.PR ?X_I ?X_N ?X_D ?X_P)) ** ?E)
		(:ROLES
			(!R1 (?X_D BOOT.N))
			(!R2 (?X_I FISH.N))
			(!R3 (?X_N ROD.N))
			(!R4 (?X_N (PERTAIN-TO ?X_O)))
			(!R5 (?X_O AGENT.N))
			(!R6 (?X_P DESTINATION.N))
			(!R7 (?X_P POND.N))
		)
		(:STEPS
			(?X_K (?X_O (CAST.V ?X_N ?X_P)))
			(?X_M (?X_O ((ADV-A (FROM.P ?L1)) GO.35.V) ?X_P))
			(?X_A (?X_O (((ADV-A (IN.P ?X_P)) CAST.V) ?X_N)))
			(?X_H (?X_O (CATCH.V ?X_I)))
			(?X_F (?X_O ((UP.ADV PULL.V) ?X_N)))
			(?X_C (?X_N ((ACTUALLY.ADV BE.V) ?X_D)))
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
			"A agent casts a rod of a agent a destination pond."
			"A agent go.32s a destination pond from L1."
			"A agent casts a rod of a agent in a destination pond."
			"A agent catches a fish."
			"A agent pulls a rod of a agent up."
			"A rod of a agent is a boot actually."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) RUN.19.V) ?L2) ** ?X_E)
		(:ROLES
			(!R1 (?X_C BROTHER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B BASKET.N))
			(!R6 (?X_A BOY.N))
			(!R7 (?X_C (PERTAIN-TO ?X_A)))
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
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.19.V)))
			(?X_E
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.19.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.19.V) ?L2))
			(?X_E (?X_C ((ADV-A (AFTER.P ?X_B)) RUN.19.V)))
			(?X_E (?X_C RUN.19.V ?L2))
			(?X_E (?X_C (LOCATION_ADV.? RUN.19.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) RUN.20.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C BROTHER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B BASKET.N))
			(!R6 (?X_C (PERTAIN-TO ?X_A)))
			(!R7 (?X_A BOY.N))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.20.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.20.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.20.V) ?L2))
			(?X_D (?X_C ((ADV-A (AFTER.P ?X_B)) RUN.20.V)))
			(?X_D (?X_C RUN.20.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? RUN.20.V)))
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
	(EPI-SCHEMA ((?X_P (COMPOSITE-SCHEMA-166.PR ?X_N ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_H STREET.N))
			(!R2 (?X_K RIM.N))
			(!R3 (?X_N BASKET.N))
			(!R4 (?X_O BOY.N))
			(!R5 (?X_P (PERTAIN-TO ?X_O)))
			(!R6 (?X_P BROTHER.N))
			(!R7 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_M (?X_O (SHOOT.V ?X_N)))
			(?X_J (?X_N (HARD.ADV ((ADV-A (OFF.P ?X_K)) BOUNCE.V))))
			(?X_G (?X_N ((ADV-A (INTO.P ?X_H)) GO.V)))
			(?X_E (?X_P (AFTER.P ?X_N)))
			(?X_A (?X_P ((ADV-A (FROM.P ?L1)) RUN.19.V) ?L2))
			(?X_A (?X_P ((ADV-A (FROM.P ?L1)) RUN.20.V) ?L2))
			(?X_C (?X_P (((ADV-A (IN.P ?X_H)) CATCH.V) ?X_N)))
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
			"A brother of a boy run.44s a destination from L1."
			"A brother of a boy run.47s a destination from L1."
			"A brother of a boy catches a basket in a street."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.26.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B NICE.A))
			(!R6 (?X_B NEW.A))
			(!R7 (?X_B IPAD.N))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-167.PR ?X_D ?X_J)) ** ?E)
		(:ROLES
			(!R1 (?X_D BOX.N))
			(!R2 (?X_D (VERY.ADV AMAZING.A)))
			(!R3 (?X_I AGENT.N))
			(!R4 (?X_J NICE.A))
			(!R5 (?X_J NEW.A))
			(!R6 (?X_J IPAD.N))
			(!R7 (NOT (?X_J AGENT.N)))
			(!R8 (NOT (?X_I = ?X_J)))
		)
		(:STEPS
			(?X_H (?X_I GET.26.V ?X_J))
			(?X_F (?X_A ?X_I (((ADV (VERY.ADV MUCH.A)) LIKE.V) ?X_J)))
			(?X_C (?X_I (SAVE.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_C)))
			(!W3 (?X_F (BEFORE ?X_C)))
		)
	)
	(
			"A agent get.68s a nice new ipad."
			"X_A likes a nice new ipad ADV very much."
			"A agent saves a box very amazing."
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.26.V
	              (KA (SEE.V (?X_B ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V)))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2
	   ((KA (SEE.V (?X_B ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V)))) ACTION.N))
			(!R3 (?X_B FULL.A))
			(!R4 (?X_B (PLUR PUPPY.N)))
			(!R5 (?X_B (OF.P (K FUN.N))))
		)
		(:PRECONDS
			(?I1
	   (?X_A
	    (THINK.V
	     (THAT
	      ((KA (SEE.V (?X_B ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V)))) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_C
	   (?X_A
	    (WANT.V (KA (SEE.V (?X_B ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V)))))))
			(?X_C
	   (?X_A
	    (LIKE.V (KA (SEE.V (?X_B ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V)))))))
			(?X_C
	   (?X_A
	    (LOVE.V (KA (SEE.V (?X_B ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V)))))))
			(?X_C
	   (?X_A
	    (ENJOY.V (KA (SEE.V (?X_B ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V)))))))
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
	(EPI-SCHEMA ((?X_B
	              (COMPOSITE-SCHEMA-168.PR
	               (KA (SEE.V (?X_A ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V))))))
	             ** ?E)
		(:ROLES
			(!R1
	   ((KA (SEE.V (?X_A ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V)))) ACTION.N))
			(!R2 (?X_A FULL.A))
			(!R3 (?X_A (PLUR PUPPY.N)))
			(!R4 (?X_A (OF.P (K FUN.N))))
			(!R5 (?X_B AGENT.N))
		)
		(:STEPS
			(E109.SK
	   (?X_B ENJOY_ACTION.26.V
	    (KA (SEE.V (?X_A ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V))))))
		)
	)
	(
			"A agent enjoy action.77s seeing a full puppys of fun with each other plays."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) COME.6.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MONKEY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) COME.6.V)))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) COME.6.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) COME.6.V) ?L2))
			(?X_C (?X_A (DOWN.ADV COME.6.V)))
			(?X_C (?X_A COME.6.V ?L2))
			(?X_C (?X_A (LOCATION_ADV.? COME.6.V)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) CLIMB.2.V) ?X_B) ** ?X_D)
		(:ROLES
			(!R1 (?X_A MONKEY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
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
			(?X_D (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) CLIMB.2.V)))
			(?X_D
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) CLIMB.2.V))))
			(?X_D (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) CLIMB.2.V) ?X_B))
			(?X_D (?X_A CLIMB.2.V))
			(?X_D (?X_A CLIMB.2.V ?X_B))
			(?X_D (?X_A (LOCATION_ADV.? CLIMB.2.V)))
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.27.V (KA (L X (AND (X RUN.V) (X PLAY.V))))) **
	             ?X_C)
		(:ROLES
			(!R1 (?X_A MONKEY.N))
			(!R2 ((KA (L X (AND (X RUN.V) (X PLAY.V)))) ACTION.N))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA (L X (AND (X RUN.V) (X PLAY.V)))) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_C (?X_A (WANT.V (KA (L X (AND (X RUN.V) (X PLAY.V)))))))
			(?X_C (?X_A (LIKE.V (KA (L X (AND (X RUN.V) (X PLAY.V)))))))
			(?X_C (?X_A (LOVE.V (KA (L X (AND (X RUN.V) (X PLAY.V)))))))
			(?X_C (?X_A (ENJOY.V (KA (L X (AND (X RUN.V) (X PLAY.V)))))))
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
	(EPI-SCHEMA ((?X_C EAT.6.V ?X_B) ** ?X_E)
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
	(EPI-SCHEMA ((?X_S
	              (COMPOSITE-SCHEMA-169.PR ?L2 ?X_P
	               (KA (L X (AND (X RUN.V) (X PLAY.V)))) ?X_Q))
	             ** ?E)
		(:ROLES
			(!R1 (?X_O GROUND.N))
			(!R2 (?X_Q (TO.P ?X_O)))
			(!R3 (?X_P DESTINATION.N))
			(!R4 (?X_P TREE.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_Q FOOD.N))
			(!R7 (?X_Q COCOANUT.N))
			(!R8 ((KA (L X (AND (X RUN.V) (X PLAY.V)))) ACTION.N))
			(!R9 (?X_S MONKEY.N))
		)
		(:STEPS
			(?X_N (?X_S ((CAN.AUX CLIMB.V) ?X_P)))
			(?X_J (?X_S ((ADV-A (FROM.P ?L1)) CLIMB.2.V) ?X_P))
			(?X_L (?X_S (GET.V ?X_Q)))
			(?X_H (?X_S (DROP.V ?X_Q)))
			(?X_F (?X_S ((ADV-A (FROM.P ?L1)) COME.6.V) ?L2))
			(?X_D (?X_S EAT.6.V ?X_Q))
			(?X_B (?X_S ENJOY_ACTION.27.V (KA (L X (AND (X RUN.V) (X PLAY.V))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_J)))
			(!W2 (?X_N (BEFORE ?X_L)))
			(!W3 (?X_N (BEFORE ?X_H)))
			(!W4 (?X_N (BEFORE ?X_F)))
			(!W5 (?X_N (BEFORE ?X_D)))
			(!W6 (?X_N (BEFORE ?X_B)))
			(!W7 (?X_J (BEFORE ?X_L)))
			(!W8 (?X_J (BEFORE ?X_H)))
			(!W9 (?X_J (BEFORE ?X_F)))
			(!W10 (?X_J (BEFORE ?X_D)))
			(!W11 (?X_J (BEFORE ?X_B)))
			(!W12 (?X_L (BEFORE ?X_H)))
			(!W13 (?X_L (BEFORE ?X_F)))
			(!W14 (?X_L (BEFORE ?X_D)))
			(!W15 (?X_L (BEFORE ?X_B)))
			(!W16 (?X_H (BEFORE ?X_F)))
			(!W17 (?X_H (BEFORE ?X_D)))
			(!W18 (?X_H (BEFORE ?X_B)))
			(!W19 (?X_F (BEFORE ?X_D)))
			(!W20 (?X_F (BEFORE ?X_B)))
			(!W21 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A monkey climbs a destination tree can."
			"A monkey climb.93s a destination tree from L1."
			"A monkey gets a food cocoanut to a ground."
			"A monkey drops a food cocoanut to a ground."
			"A monkey come.92s a destination from L1."
			"A monkey eat.97s a food cocoanut to a ground."
			"A monkey enjoy action.103s run playing."
	)
)



(
	(EPI-SCHEMA ((?X_A ((AWAY.ADV GET.27.V) ?O)) ** ?X_B)
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
			(!W1 (?I1 PRECOND-OF ?X_B))
			(!W2 (?I2 PRECOND-OF ?X_B))
			(!W3 (?I3 PRECOND-OF ?X_B))
			(!W4 (?P1 POSTCOND-OF ?X_B))
			(!W5 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B GET.28.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B SON.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C FLY.N))
			(!R6 (?X_A MAN.N))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (SAME-TIME ?X_G)))
			(!W6 (?X_D (RIGHT-AFTER ?X_E)))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-170.PR (KA (HIT.V ?X_P)) ?X_O ?O ?X_P)) ** ?E)
		(:ROLES
			(!R1 (?X_K MAN.N))
			(!R2 (?X_O (PERTAIN-TO ?X_K)))
			(!R3 (?X_N WALL.N))
			(!R4 (NOT (?O AGENT.N)))
			(!R5 (NOT (?X_P = ?O)))
			(!R6 (?X_P FLY.N))
			(!R7 (?X_O SON.N))
			(!R8 (NOT (?X_O = ?X_P)))
		)
		(:STEPS
			(?X_M (?X_P ((ADV-A (ON.P ?X_N)) LAND.V)))
			(?X_J (?X_K (TRY.V (KA (HIT.V ?X_P)))))
			(?X_F (?X_K ((UP.PRT WAKE.V) ?X_O)))
			(?X_D (?X_O (GET.V ?X_P)))
			(?X_H (?X_P ((AWAY.ADV GET.27.V) ?O)))
			(?X_A (?X_K ((UP.PRT WAKE.V) ?X_O)))
			(?X_B (?X_O GET.28.V ?X_P))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_J)))
			(!W2 (?X_M (BEFORE ?X_H)))
			(!W3 (?X_M (BEFORE ?X_A)))
			(!W4 (?X_M (BEFORE ?X_B)))
			(!W5 (?X_J (BEFORE ?X_H)))
			(!W6 (?X_J (BEFORE ?X_A)))
			(!W7 (?X_J (BEFORE ?X_B)))
			(!W8 (?X_F (BEFORE ?X_A)))
			(!W9 (?X_F (BEFORE ?X_B)))
			(!W10 (?X_D (BEFORE ?X_B)))
			(!W11 (?X_H (BEFORE ?X_A)))
			(!W12 (?X_H (BEFORE ?X_B)))
			(!W13 (?X_A (BEFORE ?X_B)))
		)
	)
	(
			"A fly lands on a wall."
			"A man tries hitting a fly."
			"A man wakes a son of a man up."
			"A son of a man gets a fly."
			"A fly get.105s O away."
			"A man wakes a son of a man up."
			"A son of a man get.104s a fly."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.9.V (K SICK.A)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((K SICK.A) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K SICK.A))))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A MOTHER.N))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-171.PR ?X_I (K SICK.A))) ** ?E)
		(:ROLES
			(!R1 (?X_I SLIGHT.A))
			(!R2 (?X_I COLD.N))
			(!R3 (?X_J MOTHER.N))
			(!R4 (?X_J (PERTAIN-TO ?X_K)))
			(!R5 (?X_K AGENT.N))
			(!R6 (NOT ((K SICK.A) AGENT.N)))
			(!R7 (NOT (?X_K = (K SICK.A))))
		)
		(:STEPS
			(?X_H (?X_K (HAVE.V ?X_I)))
			(?X_F (?X_K GO.V))
			(?X_D (?X_K (ANYWAY.ADV SWAM.V)))
			(?X_B (?X_K GET.9.V (K SICK.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_D)))
			(!W2 (?X_H (BEFORE ?X_B)))
			(!W3 (?X_F (BEFORE ?X_B)))
			(!W4 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent has a slight cold."
			"A agent goes."
			"A agent swims anyway."
			"A agent get.129s sick."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) COME.7.V) (KA (VISIT.V ?X_C))) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_B FRIEND.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA (VISIT.V ?X_C)) DESTINATION.N))
			(!R4 (NOT (?L1 = (KA (VISIT.V ?X_C)))))
			(!R5 (?X_C AGENT.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_A (K YOUNG.A) SON.N))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (KA (VISIT.V ?X_C)))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (KA (VISIT.V ?X_C))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (KA (VISIT.V ?X_C)))))
		)
		(:PARAPHRASES
			(?X_D
	   (?X_B
	    ((ADV-A (DESTINATION_PREP.? (KA (VISIT.V ?X_C))))
	     ((ADV-A (FOR.P (KA (VISIT.V ?X_C)))) COME.7.V))))
			(?X_D
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (KA (VISIT.V ?X_C)))) COME.7.V))))
			(?X_D
	   (?X_B ((ADV-A (DESTINATION_PREP.? (KA (VISIT.V ?X_C)))) COME.7.V)
	    (KA (VISIT.V ?X_C))))
			(?X_D (?X_B COME.7.V))
			(?X_D (?X_B COME.7.V (KA (VISIT.V ?X_C))))
			(?X_D (?X_B (LOCATION_ADV.? COME.7.V)))
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
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.18.V ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_B FRIEND.N))
			(!R2 (?X_C AGENT.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 ((KA (VISIT.V ?X_D)) DESTINATION.N))
			(!R6 (?X_B (PERTAIN-TO ?X_D)))
			(!R7 (?X_D AGENT.N))
			(!R8 (?X_A (K YOUNG.A) SON.N))
			(!R9 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C ((ADV-A (AT.P (KA (VISIT.V ?X_D)))) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_C ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C ((ADV-A (AT.P (KA (VISIT.V ?X_D)))) BE.V)))
		)
		(:PARAPHRASES
			(?X_E
	   (?X_B
	    (((ADV-A (TO.P (KA (VISIT.V ?X_D))))
	      ((ADV-A (FOR.P (KA (VISIT.V ?X_D)))) TAKE.V))
	     ?X_C)))
			(?X_E (?X_B ((ADV-A (TO.P (KA (VISIT.V ?X_D)))) CARRY.V) ?X_C))
			(?X_E (?X_B ((ADV-A (TO.P (KA (VISIT.V ?X_D)))) BRING.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? TAKE.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? CARRY.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? BRING.V) ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?P1 POSTCOND-OF ?X_E))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.19.V ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_B FRIEND.N))
			(!R2 (?X_C VISIT.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 ((KA (VISIT.V ?X_D)) DESTINATION.N))
			(!R6 (?X_B (PERTAIN-TO ?X_D)))
			(!R7 (?X_D AGENT.N))
			(!R8 (?X_A (K YOUNG.A) SON.N))
			(!R9 (?X_A (PERTAIN-TO ?X_B)))
			(!R10 (?X_C GREAT.A))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C ((ADV-A (AT.P (KA (VISIT.V ?X_D)))) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_C ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C ((ADV-A (AT.P (KA (VISIT.V ?X_D)))) BE.V)))
		)
		(:PARAPHRASES
			(?X_E
	   (?X_B
	    (((ADV-A (TO.P (KA (VISIT.V ?X_D))))
	      ((ADV-A (FOR.P (KA (VISIT.V ?X_D)))) TAKE.V))
	     ?X_C)))
			(?X_E (?X_B ((ADV-A (TO.P (KA (VISIT.V ?X_D)))) CARRY.V) ?X_C))
			(?X_E (?X_B ((ADV-A (TO.P (KA (VISIT.V ?X_D)))) BRING.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? TAKE.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? CARRY.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? BRING.V) ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?P1 POSTCOND-OF ?X_E))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_Q
	              (COMPOSITE-SCHEMA-172.PR ?X_Q ?X_N ?X_I (K YOUNG.A) ?X_F
	               (KA (VISIT.V ?X_O)) ?X_P ?X_R))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F (PLUR TOY.N)))
			(!R2 (?X_I CUTE.A))
			(!R3 (?X_I LITTLE.A))
			(!R4 (?X_I BOY.N))
			(!R5 (?X_N (K YOUNG.A) SON.N))
			(!R6 (?X_N (PERTAIN-TO ?X_Q)))
			(!R7 ((KA (VISIT.V ?X_O)) DESTINATION.N))
			(!R8 (?X_Q (PERTAIN-TO ?X_O)))
			(!R9 (?X_O AGENT.N))
			(!R10 (?X_P SMALLER-THAN.N ?X_Q))
			(!R11 (?X_P AGENT.N))
			(!R12 (?X_Q FRIEND.N))
			(!R13 (?X_R SMALLER-THAN.N ?X_Q))
			(!R14 (?X_R VISIT.N))
			(!R15 (?X_R GREAT.A))
		)
		(:STEPS
			(?X_K (?X_Q (BRING.V ?X_N ?X_Q)))
			(?X_M (?X_Q ((ADV-A (FROM.P ?L1)) COME.7.V) (KA (VISIT.V ?X_O))))
			(?X_M (?X_Q TRANSPORT_OBJECT.18.V ?X_P))
			(?X_M (?X_Q TRANSPORT_OBJECT.19.V ?X_R))
			(?X_A (?X_Q (((ADV-A (WITH.P ?X_Q)) BRING.V) ?X_N)))
			(?X_H ((K YOUNG.A) (BE.V ?X_I)))
			(?X_E (?X_P (((ADV-A (FOR.P (KA (PLAY.V WITH.P)))) GIVE.V) (K YOUNG.A) ?X_F)))
			(?X_C (?X_P (HAVE.V ?X_R)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_A)))
			(!W2 (?X_K (BEFORE ?X_H)))
			(!W3 (?X_K (BEFORE ?X_E)))
			(!W4 (?X_K (BEFORE ?X_C)))
			(!W5 (?X_M (BEFORE ?X_A)))
			(!W6 (?X_M (BEFORE ?X_H)))
			(!W7 (?X_M (BEFORE ?X_E)))
			(!W8 (?X_M (BEFORE ?X_C)))
			(!W9 (?X_A (BEFORE ?X_H)))
			(!W10 (?X_A (BEFORE ?X_E)))
			(!W11 (?X_A (BEFORE ?X_C)))
			(!W12 (?X_H (BEFORE ?X_E)))
			(!W13 (?X_H (BEFORE ?X_C)))
			(!W14 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A friend of a agent brings a of a friend of X_O a friend of a agent."
			"A friend of a agent come.160s visiting a agent from L1."
			"A friend of a agent transport object.144s a agent."
			"A friend of a agent transport object.147s a visit great."
			"A friend of a agent brings a of a friend of X_O with a friend of a agent."
			"Young is a cute little boy."
			"A agent gives young a toys for playing with."
			"A agent has a visit great."
	)
)



(
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-173.PR (KA (TRY.V ?X_C))
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
	              (COMPOSITE-SCHEMA-174.PR (K CHOCOLATE.N)
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) RUN.21.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.21.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.21.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.21.V) ?L2))
			(?X_C (?X_B ((ADV-A (AT.P ?X_A)) RUN.21.V)))
			(?X_C (?X_B RUN.21.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? RUN.21.V)))
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
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-175.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_C CAT.N))
			(!R2 (?X_D DOG.N))
			(!R3 (?X_D (PLUR HEN.N)))
			(!R4 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_B (?X_D ((ADV-A (FROM.P ?L1)) RUN.21.V) ?L2))
		)
	)
	(
			"A dog hens run.187s a destination from L1."
	)
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (INTO.P (KA RACE.V))) GET.5.V) ?O)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?O)))
			(!R5 (?X_A BOAT.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
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
	              (COMPOSITE-SCHEMA-176.PR (K (L X (AND (X FAST.A) (X (PLUR BOAT.N)))))
	               ?X_I ?O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I BOAT.N))
			(!R2 (?X_I (PERTAIN-TO ?X_J)))
			(!R3 (?X_J AGENT.N))
			(!R4 (NOT (?O AGENT.N)))
			(!R5 (NOT (?X_J = ?O)))
		)
		(:STEPS
			(?X_H (?X_J (LOVE.V (K (L X (AND (X FAST.A) (X (PLUR BOAT.N))))))))
			(?X_D (?X_J ((ONCE.ADV FLIP.V) ?X_I)))
			(?X_F (?X_J (((ADV-A (INTO.P (KA RACE.V))) GET.5.V) ?O)))
			(?X_B (?X_J ((ONCE.ADV FLIP.V) ?X_I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
			(!W4 (?X_F (BEFORE ?X_B)))
		)
	)
	(
			"A agent loves fast boat."
			"A agent flips a boat of a agent once."
			"A agent get.201s O into racing."
			"A agent flips a boat of a agent once."
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.20.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?X_B CAT.N))
			(!R3 (?X_B SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?L2 INSIDE.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B ((ADV-A (AT.P ?L2)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_B ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B ((ADV-A (AT.P ?L2)) BE.V)))
		)
		(:PARAPHRASES
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) TAKE.V) ?X_B))
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) CARRY.V) ?X_B))
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) BRING.V) ?X_B))
			(?X_C (?X_A TAKE.V ?X_B))
			(?X_C (?X_A CARRY.V ?X_B))
			(?X_C (?X_A (BRING.V ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?P1 POSTCOND-OF ?X_C))
			(!W3 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.21.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A CAT.N))
			(!R2 (?X_B MAN.N))
			(!R3 (?X_B SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 ((KA BUDGE.V) DESTINATION.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B ((ADV-A (AT.P (KA BUDGE.V))) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_B ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B ((ADV-A (AT.P (KA BUDGE.V))) BE.V)))
		)
		(:PARAPHRASES
			(?X_C
	   (?X_A
	    (((ADV-A (TO.P (KA BUDGE.V))) ((ADV-A (FOR.P (KA BUDGE.V))) TAKE.V)) ?X_B)))
			(?X_C (?X_A ((ADV-A (TO.P (KA BUDGE.V))) CARRY.V) ?X_B))
			(?X_C (?X_A ((ADV-A (TO.P (KA BUDGE.V))) BRING.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? TAKE.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? CARRY.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? BRING.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?P1 POSTCOND-OF ?X_C))
			(!W3 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-177.PR ?X_L ?X_M)) ** ?E)
		(:ROLES
			(!R1 (?X_K BUSH.N))
			(!R2 (?X_M SMALLER-THAN.N ?X_L))
			(!R3 ((KA BUDGE.V) DESTINATION.N))
			(!R4 (?X_M MAN.N))
			(!R5 (?X_L CAT.N))
			(!R6 (?X_L SMALLER-THAN.N ?X_M))
		)
		(:STEPS
			(?X_J (?X_L ((ADV-A (IN.P ?X_K)) HIDE.V)))
			(?X_H (?X_M (SEE.V ?X_L)))
			(?X_F (?X_M ((ADV-A (TO.P ?X_L)) CALL.V)))
			(?X_D (?X_L TRANSPORT_OBJECT.21.V ?X_M))
			(?X_B (?X_M TRANSPORT_OBJECT.20.V ?X_L))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_F)))
			(!W3 (?X_J (BEFORE ?X_D)))
			(!W4 (?X_J (BEFORE ?X_B)))
			(!W5 (?X_H (BEFORE ?X_F)))
			(!W6 (?X_H (BEFORE ?X_D)))
			(!W7 (?X_H (BEFORE ?X_B)))
			(!W8 (?X_F (BEFORE ?X_D)))
			(!W9 (?X_F (BEFORE ?X_B)))
			(!W10 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A cat hides in a bush."
			"A man sees a cat."
			"A man calls to a cat."
			"A cat transport object.206s a man."
			"A man transport object.207s a cat."
	)
)



(
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-178.PR ?X_N (KE ((K MONEY.N) (FOR.P ?X_N))) ?X_B
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) WALK.5.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) WALK.5.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) WALK.5.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) WALK.5.V) ?L2))
			(?X_B (?X_A WALK.5.V))
			(?X_B (?X_A WALK.5.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? WALK.5.V)))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-179.PR (KA (FIND.V ?X_E)) ?X_J ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_E OWNER.N))
			(!R2 (?X_J WALLET.N))
			(!R3 (?X_M AGENT.N))
			(!R4 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_L (?X_M ((ADV-A (FROM.P ?L1)) WALK.5.V) ?L2))
			(?X_I (?X_M ((SUDDENLY.ADV SEE.V) ?X_J)))
			(?X_G (?X_M ((UP.PRT PICK.V) ?X_J)))
			(?X_D (?X_M (TRY.V (KA (FIND.V ?X_E)))))
			(?X_B (?X_M (KEEP.V ?X_J)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_I)))
			(!W2 (?X_L (BEFORE ?X_G)))
			(!W3 (?X_L (BEFORE ?X_D)))
			(!W4 (?X_L (BEFORE ?X_B)))
			(!W5 (?X_I (BEFORE ?X_G)))
			(!W6 (?X_I (BEFORE ?X_D)))
			(!W7 (?X_I (BEFORE ?X_B)))
			(!W8 (?X_G (BEFORE ?X_D)))
			(!W9 (?X_G (BEFORE ?X_B)))
			(!W10 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent walk.236s a destination from L1."
			"A agent sees a wallet suddenly."
			"A agent picks a wallet up."
			"A agent tries finding a owner."
			"A agent keeps a wallet."
	)
)



(
	(EPI-SCHEMA ((?X_C TAKE.17.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D {REF}.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
			(!R7 (?X_A BACKPACK.N))
			(!R8 (?X_B STUFF.N))
			(!R9 (?X_D (OF.P ?X_B)))
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
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?I2 PRECOND-OF ?X_E))
			(!W3 (?I3 PRECOND-OF ?X_E))
			(!W4 (?P1 POSTCOND-OF ?X_E))
			(!W5 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((OFF.ADV TAKE.18.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B (PERTAIN-TO ?X_A)))
			(!R6 (?X_B BACKPACK.N))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-180.PR (K (TOO.ADV HEAVY.A)) ?X_O ?X_M)) ** ?E)
		(:ROLES
			(!R1 (?X_L STUFF.N))
			(!R2 (?X_O (OF.P ?X_L)))
			(!R3 (?X_M (PERTAIN-TO ?X_N)))
			(!R4 (?X_M BACKPACK.N))
			(!R5 (NOT (?X_M AGENT.N)))
			(!R6 (NOT (?X_N = ?X_M)))
			(!R7 (?X_O {REF}.N))
			(!R8 (?X_N MAN.N))
			(!R9 (NOT (?X_O AGENT.N)))
			(!R10 (NOT (?X_N = ?X_O)))
		)
		(:STEPS
			(?X_K (?X_N ((UP.PRT FILL.V) ?X_M)))
			(?X_A (?X_N ((UP.PRT FILL.V) ?X_M)))
			(?X_I (?X_N (KA TRY.V) ?X_M ON.P))
			(?X_G (?X_M (FEEL.V (K (TOO.ADV HEAVY.A)))))
			(?X_E (?X_N ((OFF.ADV TAKE.18.V) ?X_M)))
			(?X_C (?X_N TAKE.17.V ?X_O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_A)))
			(!W2 (?X_K (BEFORE ?X_I)))
			(!W3 (?X_K (BEFORE ?X_G)))
			(!W4 (?X_K (BEFORE ?X_E)))
			(!W5 (?X_K (BEFORE ?X_C)))
			(!W6 (?X_A (BEFORE ?X_I)))
			(!W7 (?X_A (BEFORE ?X_G)))
			(!W8 (?X_A (BEFORE ?X_E)))
			(!W9 (?X_A (BEFORE ?X_C)))
			(!W10 (?X_I (BEFORE ?X_G)))
			(!W11 (?X_I (BEFORE ?X_E)))
			(!W12 (?X_I (BEFORE ?X_C)))
			(!W13 (?X_G (BEFORE ?X_E)))
			(!W14 (?X_G (BEFORE ?X_C)))
			(!W15 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A man fills a backpack of a man up."
			"A man fills a backpack of a man up."
			"A man is on."
			"A backpack of a man feels too heavy."
			"A man take.250s a backpack of a man off."
			"A man take.248s a of a stuff."
	)
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_F)))
			(!W6 (?X_D (AFTER ?X_E)))
			(!W7 (?X_G (AT-ABOUT ?X_F)))
			(!W8 (?X_G (AFTER ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B GET.30.V (K (L X (AND (X HAIR.N) (X STUFF.N))))) ** ?X_D)
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_F)))
			(!W6 (?X_D (AFTER ?X_E)))
			(!W7 (?X_G (AT-ABOUT ?X_F)))
			(!W8 (?X_G (AFTER ?X_H)))
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
	              (COMPOSITE-SCHEMA-181.PR ?X_I
	               (K (L X (AND (X HAIR.N) (X STUFF.N))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I MESS.N))
			(!R2 (?X_J HAIR.N))
			(!R3 (?X_J (PERTAIN-TO ?X_K)))
			(!R4 (?X_K AGENT.N))
			(!R5 (NOT ((K (L X (AND (X HAIR.N) (X STUFF.N)))) AGENT.N)))
			(!R6 (NOT (?X_K = (K (L X (AND (X HAIR.N) (X STUFF.N)))))))
		)
		(:STEPS
			(?X_H (?X_J (BE.V ?X_I)))
			(?X_A (?X_K (THERE.ADV BE.V)))
			(?X_B (?X_K (THERE.ADV BE.V)))
			(?X_F (?X_K GET.29.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
			(?X_D (?X_K GET.30.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_D)))
			(!W3 (?X_A (BEFORE ?X_F)))
			(!W4 (?X_B (BEFORE ?X_D)))
		)
	)
	(
			"A hair of a agent is a mess."
			"A agent is there."
			"A agent is there."
			"A agent get.266s hair stuff."
			"A agent get.267s hair stuff."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-182.PR ?X_B ?X_J)) ** ?E)
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
	(EPI-SCHEMA ((?X_A (((ADV-A (IN.P ?X_C)) PUT.5.V) ?X_B)) ** ?X_D)
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-183.PR (ANOTHER.D EGG.N) ?X_J)) ** ?E)
		(:ROLES
			(!R1 (?X_K CONTAINER.N))
			(!R2 (?X_K PAN.N))
			(!R3 (?X_I MAN.N))
			(!R4 (?X_J SMALLER-THAN ?X_K))
			(!R5 (?X_J EGG.N))
			(!R6 (NOT (?X_J AGENT.N)))
			(!R7 (NOT (?X_K AGENT.N)))
		)
		(:STEPS
			(?X_H (?X_I (CRACK.V ?X_J)))
			(?X_D (?X_I ((OUT.PRT THROW.V) ?X_J)))
			(?X_B (?X_I (CRACK.V (ANOTHER.D EGG.N))))
			(?X_F (?X_I (((ADV-A (IN.P ?X_K)) PUT.5.V) ?X_J)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_D)))
			(!W2 (?X_H (BEFORE ?X_B)))
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
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?L1)) GO.36.V) ?L2) ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C ROAD.N))
			(!R6 (?X_A CAR.N))
			(!R7 (?X_A (PERTAIN-TO ?X_D)))
			(!R8 (?X_B FRIEND.N))
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
		(:PARAPHRASES
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) GO.36.V)))
			(?X_E (?X_D ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.36.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) GO.36.V) ?L2))
			(?X_E (?X_D ((ADV-A (OFF.P ?X_C)) GO.36.V)))
			(?X_E (?X_D GO.36.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? GO.36.V)))
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
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?L1)) GO.37.V) ?L2) ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C ROAD.N))
			(!R6 (?X_A (PERTAIN-TO ?X_D)))
			(!R7 (?X_A FRIEND.N))
			(!R8 (?X_B CAR.N))
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
		(:PARAPHRASES
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) GO.37.V)))
			(?X_E (?X_D ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.37.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) GO.37.V) ?L2))
			(?X_E (?X_D ((ADV-A (OFF.P ?X_C)) GO.37.V)))
			(?X_E (?X_D GO.37.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? GO.37.V)))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-184.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_E ROAD.N))
			(!R2 (?X_J CAR.N))
			(!R3 (?X_H MALE.A))
			(!R4 (?X_H AGENT.N))
			(!R5 (?X_I FRIEND.N))
			(!R6 (?X_I (PERTAIN-TO ?X_K)))
			(!R7 (?X_J (PERTAIN-TO ?X_K)))
			(!R8 (?X_K AGENT.N))
			(!R9 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_B (?X_K (OUT.PRT ((ADV-A (WITH.P ?X_I)) HANG.V))))
			(?X_G
	   (?X_H ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_J))))))) PULL.V)))
			(?X_D (?X_K ((ADV-A (FROM.P ?L1)) GO.36.V) ?L2))
			(?X_D (?X_K ((ADV-A (FROM.P ?L1)) GO.37.V) ?L2))
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
			"A agent go.1s a destination from L1."
			"A agent go.3s a destination from L1."
	)
)



(
	(EPI-SCHEMA ((?X_J
	              (COMPOSITE-SCHEMA-185.PR (KA (MORE.ADV ACTIVE.A))
	               (KA (BE.V (K (L X (AND (X MORE.A) (X FIT.N))))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E HOUSE.N))
			(!R2 (?X_J AGENT.N))
			(!R3 (?X_K DAY.N))
			(!R4 (?X_L HOUR.N))
		)
		(:STEPS
			(?X_D (?X_A (WANT.V (KA (MORE.ADV ACTIVE.A)))))
			(?X_G (?X_J (MOSTLY.ADV ((ADV-A (AROUND.P ?X_E)) SIT.V))))
			(?X_I (?X_J (WANT.V (KA (BE.V (K (L X (AND (X MORE.A) (X FIT.N)))))))))
			(?X_N
	   (?X_J
	    ((ADV-A (FOR.P (KA (((ADV-A (OUTSIDE.P ?X_K)) PLAY.V) ?X_L)))) START.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_G)))
			(!W2 (?X_D (BEFORE ?X_I)))
			(!W3 (?X_D (BEFORE ?X_N)))
			(!W4 (?X_G (BEFORE ?X_I)))
			(!W5 (?X_G (BEFORE ?X_N)))
			(!W6 (?X_I (BEFORE ?X_N)))
		)
	)
	(
			"X_A wants more active."
			"A agent sits mostly around a house."
			"A agent wants being more fit."
			"A agent starts for outside a day playing a hour."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.38.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.38.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.38.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.38.V) ?L2))
			(?X_C (?X_B (OFF.ADV ((ADV-A (ON.P ?X_A)) GO.38.V))))
			(?X_C (?X_B GO.38.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? GO.38.V)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) COME.8.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?L2 HOME.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) COME.8.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) COME.8.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) COME.8.V) ?L2))
			(?X_B (?X_A COME.8.V))
			(?X_B (?X_A COME.8.V ?L2))
			(?X_B (?X_A ((ADV-A (BEFORE.P (K DARK.N))) COME.8.V)))
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
	(EPI-SCHEMA ((?X_C TRANSPORT_OBJECT.22.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D SON.N))
			(!R3 (?X_D SMALLER-THAN.N ?X_C))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_A (K BEST.A) FRIEND.N))
			(!R7 (?X_A (PERTAIN-TO ?X_D)))
			(!R8 (?X_D (PERTAIN-TO ?X_B)))
			(!R9 (?L2 HOME.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D ((ADV-A (AT.P ?L2)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_D ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_D ((ADV-A (AT.P ?L2)) BE.V)))
		)
		(:PARAPHRASES
			(?X_E (?X_C ((ADV-A (TO.P ?L2)) TAKE.V) ?X_D))
			(?X_E (?X_C ((ADV-A (TO.P ?L2)) CARRY.V) ?X_D))
			(?X_E (?X_C ((ADV-A (TO.P ?L2)) BRING.V) ?X_D))
			(?X_E (?X_C (((ADV-A (BEFORE.P (K DARK.N))) TAKE.V) ?X_D)))
			(?X_E (?X_C CARRY.V ?X_D))
			(?X_E (?X_C BRING.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?P1 POSTCOND-OF ?X_E))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.23.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B ADVENTURE.N))
			(!R3 (?X_B SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?L2 HOME.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B ((ADV-A (AT.P ?L2)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_B ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_B ((ADV-A (AT.P ?L2)) BE.V)))
		)
		(:PARAPHRASES
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) TAKE.V) ?X_B))
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) CARRY.V) ?X_B))
			(?X_C (?X_A ((ADV-A (TO.P ?L2)) BRING.V) ?X_B))
			(?X_C (?X_A (((ADV-A (BEFORE.P (K DARK.N))) TAKE.V) ?X_B)))
			(?X_C (?X_A CARRY.V ?X_B))
			(?X_C (?X_A BRING.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?P1 POSTCOND-OF ?X_C))
			(!W3 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-186.PR ?X_H ?L2 ?X_M ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_H HOUSE.N))
			(!R2 (?X_K (K BEST.A) FRIEND.N))
			(!R3 (?X_K (PERTAIN-TO ?X_M)))
			(!R4 (?X_M (PERTAIN-TO ?X_L)))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?L2 HOME.N))
			(!R7 (?X_M SON.N))
			(!R8 (?X_M SMALLER-THAN.N ?X_O))
			(!R9 (?X_N ADVENTURE.N))
			(!R10 (?X_N SMALLER-THAN.N ?X_O))
			(!R11 (?X_O AGENT.N))
		)
		(:STEPS
			(?X_J (?X_M ((ADV-A (OUTSIDE.P (KA PLAY.V))) BE.V)))
			(?X_G (?X_K (BY.P ?X_H)))
			(?X_A (?X_K ((ADV-A (BY.P ?X_H)) COME.V)))
			(?X_E (?X_O ((ADV-A (FROM.P ?L1)) GO.38.V) ?L2))
			(?X_C (?X_O ((ADV-A (FROM.P ?L1)) COME.8.V) ?L2))
			(?X_C (?X_O TRANSPORT_OBJECT.22.V ?X_M))
			(?X_C (?X_O TRANSPORT_OBJECT.23.V ?X_N))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_A)))
			(!W2 (?X_J (BEFORE ?X_E)))
			(!W3 (?X_J (BEFORE ?X_C)))
			(!W4 (?X_G (BEFORE ?X_A)))
			(!W5 (?X_G (BEFORE ?X_E)))
			(!W6 (?X_G (BEFORE ?X_C)))
			(!W7 (?X_A (BEFORE ?X_E)))
			(!W8 (?X_A (BEFORE ?X_C)))
			(!W9 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A son of X_L is outside playing."
			"A of a son of X_L is by."
			"A of a son of X_L comes by a house."
			"A agent go.33s a destination home from L1."
			"A agent come.32s a destination home from L1."
			"A agent transport object.34s a son of X_L."
			"A agent transport object.35s a adventure."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?X_B)) COME.9.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C FRIEND.N))
			(!R2 (?X_B OUTSIDE.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) COME.9.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?X_B)) ((ADV-A (DESTINATION_PREP.? ?L2)) COME.9.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) COME.9.V) ?L2))
			(?X_D (?X_C (OVER.PRT COME.9.V)))
			(?X_D (?X_C COME.9.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? COME.9.V)))
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
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-187.PR ?X_M (K SCARED.A) ?X_L ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_H WOMAN.N))
			(!R2 (?X_K SOURCE.N))
			(!R3 (?X_K (OF.P ?X_M)))
			(!R4 (?X_L FRIEND.N))
			(!R5 (?X_M OUTSIDE.N))
			(!R6 (?X_M LOUD.A))
			(!R7 (?X_M NOISE.N))
			(!R8 (NOT (?X_M = ?L2)))
			(!R9 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_J (?X_A (BE.V ?X_M)))
			(?X_G (?X_H (FEEL.V (K SCARED.A))))
			(?X_E (?X_H (CALL.V ?X_L)))
			(?X_C (?X_L ((ADV-A (FROM.P ?X_M)) COME.9.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_G)))
			(!W2 (?X_J (BEFORE ?X_E)))
			(!W3 (?X_J (BEFORE ?X_C)))
			(!W4 (?X_G (BEFORE ?X_E)))
			(!W5 (?X_G (BEFORE ?X_C)))
			(!W6 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"X_A is a outside loud noise."
			"A woman feels scared."
			"A woman calls a friend."
			"A friend come.49s a destination from a outside loud noise."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.39.V)
	              (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D))))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D))) DESTINATION.N))
			(!R4 (NOT (?L1 = (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D))))))
			(!R5 (?X_B LATE.A))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
			(!R7 (?X_C FRIEND.N))
			(!R8 (?X_D PARK.N))
			(!R9 (?X_A CURFEW.N))
			(!R10 (?X_A (PERTAIN-TO ?X_B)))
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
	    ((ADV-A (DESTINATION_PREP.? (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D)))))
	     GO.39.V)))
			(?X_E
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D)))))
	      GO.39.V))))
			(?X_E
	   (?X_B
	    ((ADV-A (DESTINATION_PREP.? (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D)))))
	     GO.39.V)
	    (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D)))))
			(?X_E (?X_B GO.39.V))
			(?X_E (?X_B GO.39.V (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D)))))
			(?X_E (?X_B (LOCATION_ADV.? GO.39.V)))
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
	(EPI-SCHEMA ((?X_D (((ADV-A (IN.P (K TROUBLE.N))) GET.31.V) ?O)) ** ?X_E)
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
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?I2 PRECOND-OF ?X_E))
			(!W3 (?I3 PRECOND-OF ?X_E))
			(!W4 (?P1 POSTCOND-OF ?X_E))
			(!W5 (?X_E (AT-ABOUT ?X_F)))
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
	              (COMPOSITE-SCHEMA-188.PR ?X_M ?X_K
	               (K ((ADV-A (WITH.P ?X_M)) (TO.P ?X_L))) ?O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K CURFEW.N))
			(!R2 (?X_K (PERTAIN-TO ?X_N)))
			(!R3 (?X_L PARK.N))
			(!R4 ((K ((ADV-A (WITH.P ?X_M)) (TO.P ?X_L))) DESTINATION.N))
			(!R5 (?X_M (PERTAIN-TO ?X_N)))
			(!R6 (?X_M FRIEND.N))
			(!R7 (?X_N AGENT.N))
			(!R8 (?X_N LATE.A))
			(!R9 (NOT (?O AGENT.N)))
			(!R10 (NOT (?X_N = ?O)))
		)
		(:STEPS
			(?X_J (?X_N ((ADV-A (IN.P (K (L X (AND (X HIGH.A) (X SCHOOL.N)))))) BE.V)))
			(?X_H
	   (?X_N ((ADV-A (FROM.P ?L1)) GO.39.V)
	    (K ((ADV-A (WITH.P ?X_M)) (TO.P ?X_L)))))
			(?X_F (?X_N (LOSE.V ?X_M)))
			(?X_B (?X_N (FOR.P ?X_K)))
			(?X_D (?X_N (((ADV-A (IN.P (K TROUBLE.N))) GET.31.V) ?O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_F)))
			(!W3 (?X_J (BEFORE ?X_B)))
			(!W4 (?X_J (BEFORE ?X_D)))
			(!W5 (?X_H (BEFORE ?X_F)))
			(!W6 (?X_H (BEFORE ?X_B)))
			(!W7 (?X_H (BEFORE ?X_D)))
			(!W8 (?X_F (BEFORE ?X_B)))
			(!W9 (?X_F (BEFORE ?X_D)))
			(!W10 (?X_B (BEFORE ?X_D)))
		)
	)
	(
			"A agent late is in high school."
			"A agent late go.78s with a friend of a agent late to a park from L1."
			"A agent late loses a friend of a agent late."
			"A agent late is for."
			"A agent late get.83s O in trouble."
	)
)



(
	(EPI-SCHEMA ((?X_G COMPOSITE-SCHEMA-189.PR) ** ?E)
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
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) ROLL.1.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B (TO.P (K TYKE.N))))
			(!R6 (?X_B BALL.N))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
			(!R8 (?X_B (TO.P ?X_A)))
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
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ROLL.1.V)))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) ROLL.1.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ROLL.1.V) ?X_B))
			(?X_C (?X_A ROLL.1.V))
			(?X_C (?X_A ROLL.1.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? ROLL.1.V)))
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
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.28.V
	              (KA (((ADV-A (WITH.P (K TYKE.N))) PLAY.V) (K BALL.N))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((KA (((ADV-A (WITH.P (K TYKE.N))) PLAY.V) (K BALL.N))) ACTION.N))
			(!R3 (?X_A (TO.P (K TYKE.N))))
			(!R4 (?X_A (TO.P ?X_B)))
			(!R5 (?X_A BALL.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:PRECONDS
			(?I1
	   (?X_B
	    (THINK.V
	     (THAT ((KA (((ADV-A (WITH.P (K TYKE.N))) PLAY.V) (K BALL.N))) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_C (?X_B (WANT.V (KA (((ADV-A (WITH.P (K TYKE.N))) PLAY.V) (K BALL.N))))))
			(?X_C (?X_B (LIKE.V (KA (((ADV-A (WITH.P (K TYKE.N))) PLAY.V) (K BALL.N))))))
			(?X_C (?X_B (LOVE.V (KA (((ADV-A (WITH.P (K TYKE.N))) PLAY.V) (K BALL.N))))))
			(?X_C (?X_B (ENJOY.V (KA (((ADV-A (WITH.P (K TYKE.N))) PLAY.V) (K BALL.N))))))
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
	(EPI-SCHEMA (((K TYKE.N) TAKE.19.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 ((K TYKE.N) AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT ((K TYKE.N) = ?X_B)))
			(!R5 (?X_B (TO.P (K TYKE.N))))
			(!R6 (?X_B BALL.N))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
			(!R8 (?X_B (TO.P ?X_A)))
		)
		(:GOALS
			(?G1 ((K TYKE.N) (WANT.V (THAT ((K TYKE.N) (HAVE.V ?X_B))))))
		)
		(:PRECONDS
			(?I1 (NOT ((K TYKE.N) HAVE.V ?X_B)))
			(?I2 ((K TYKE.N) (AT.P ?L)))
			(?I3 (?X_B (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 ((K TYKE.N) HAVE.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
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
	              (COMPOSITE-SCHEMA-190.PR ?X_H
	               (KA (((ADV-A (WITH.P (K TYKE.N))) PLAY.V) (K BALL.N))) ?X_J))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H BALL.N))
			(!R2 ((KA (((ADV-A (WITH.P (K TYKE.N))) PLAY.V) (K BALL.N))) ACTION.N))
			(!R3 (?X_I AGENT.N))
			(!R4 (?X_J DESTINATION.N))
			(!R5 (?X_J (PERTAIN-TO ?X_I)))
			(!R6 (?X_J (TO.P ?X_I)))
			(!R7 (?X_J (TO.P (K TYKE.N))))
			(!R8 (?X_J BALL.N))
			(!R9 ((K TYKE.N) AGENT.N))
			(!R10 (NOT (?X_J AGENT.N)))
			(!R11 (NOT ((K TYKE.N) = ?X_J)))
		)
		(:STEPS
			(?X_A
	   (?X_I ENJOY_ACTION.28.V
	    (KA (((ADV-A (WITH.P (K TYKE.N))) PLAY.V) (K BALL.N)))))
			(?X_G (?X_I ((CAN.AUX CATCH.V) ?X_H)))
			(?X_E (?X_I ((ADV-A (FROM.P ?L1)) ROLL.1.V) ?X_J))
			(?X_C ((K TYKE.N) TAKE.19.V ?X_J))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_G)))
			(!W2 (?X_A (BEFORE ?X_E)))
			(!W3 (?X_A (BEFORE ?X_C)))
			(!W4 (?X_G (BEFORE ?X_E)))
			(!W5 (?X_G (BEFORE ?X_C)))
			(!W6 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A agent enjoy action.108s with tyke playing ball."
			"A agent catches a ball can."
			"A agent roll.115s a destination to tyke ball of a agent to a agent from L1."
			"Tyke take.112s a destination to tyke ball of a agent to a agent."
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?L1)) RUN.14.V) ?L2) ** ?X_E)
		(:ROLES
			(!R1 (?X_D RAT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_D BLACK.A))
			(!R6 (?X_C CAT.N))
			(!R7 (?X_C (HAS.V ?X_D)))
			(!R8 (?X_C (PERTAIN-TO ?X_A)))
			(!R9 (?X_A AGENT.N))
			(!R10 (?X_B (PERTAIN-TO ?X_A)))
			(!R11 (?X_B ?X_C CAT.N))
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.14.V)))
			(?X_E
	   (?X_D ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.14.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.14.V) ?L2))
			(?X_E (?X_D RUN.14.V))
			(?X_E (?X_D RUN.14.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? RUN.14.V)))
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
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?L1)) RUN.22.V) ?L2) ** ?X_E)
		(:ROLES
			(!R1 (?X_D RAT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_D BLACK.A))
			(!R6 (?X_A (HAS.V ?X_D)))
			(!R7 (?X_A CAT.N))
			(!R8 (?X_C AGENT.N))
			(!R9 (?X_A (PERTAIN-TO ?X_C)))
			(!R10 (?X_B ?X_A CAT.N))
			(!R11 (?X_B (PERTAIN-TO ?X_C)))
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.22.V)))
			(?X_E
	   (?X_D ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.22.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.22.V) ?L2))
			(?X_E (?X_D RUN.22.V))
			(?X_E (?X_D RUN.22.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? RUN.22.V)))
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
	(EPI-SCHEMA ((?X_U (COMPOSITE-SCHEMA-191.PR ?X_S (SET-OF ?X_S ?X_V) ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_S CAT.N))
			(!R2 (?X_S (HAS.V ?X_V)))
			(!R3 (?X_T ?X_S CAT.N))
			(!R4 (?X_U AGENT.N))
			(!R5 (?X_S (PERTAIN-TO ?X_U)))
			(!R6 (?X_T (PERTAIN-TO ?X_U)))
			(!R7 (?X_V BLACK.A))
			(!R8 (?X_V RAT.N))
			(!R9 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_R (?X_U (HAVE.V ?X_S)))
			(?X_P (?X_U (CAN.AUX SEE.V)))
			(?X_N (?X_U ((CAN.AUX SEE.V) ?X_S)))
			(?X_L (?X_V (CAN.AUX SEE.V)))
			(?X_J (?X_S (CAN.AUX SEE.V)))
			(?X_H (?X_V ((CAN.AUX SEE.V) ?X_S)))
			(?X_F (?X_V ((ADV-A (FROM.P ?L1)) RUN.14.V) ?L2))
			(?X_F (?X_V ((ADV-A (FROM.P ?L1)) RUN.22.V) ?L2))
			(?X_D (?X_T RUN.V))
			(?X_B (?X_U ((CAN.AUX SEE.V) (SET-OF ?X_S ?X_V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_R (BEFORE ?X_P)))
			(!W2 (?X_R (BEFORE ?X_N)))
			(!W3 (?X_R (BEFORE ?X_L)))
			(!W4 (?X_R (BEFORE ?X_J)))
			(!W5 (?X_R (BEFORE ?X_H)))
			(!W6 (?X_R (BEFORE ?X_F)))
			(!W7 (?X_R (BEFORE ?X_D)))
			(!W8 (?X_R (BEFORE ?X_B)))
			(!W9 (?X_P (BEFORE ?X_N)))
			(!W10 (?X_P (BEFORE ?X_L)))
			(!W11 (?X_P (BEFORE ?X_J)))
			(!W12 (?X_P (BEFORE ?X_H)))
			(!W13 (?X_P (BEFORE ?X_F)))
			(!W14 (?X_P (BEFORE ?X_D)))
			(!W15 (?X_P (BEFORE ?X_B)))
			(!W16 (?X_N (BEFORE ?X_L)))
			(!W17 (?X_N (BEFORE ?X_J)))
			(!W18 (?X_N (BEFORE ?X_H)))
			(!W19 (?X_N (BEFORE ?X_F)))
			(!W20 (?X_N (BEFORE ?X_D)))
			(!W21 (?X_N (BEFORE ?X_B)))
			(!W22 (?X_L (BEFORE ?X_H)))
			(!W23 (?X_L (BEFORE ?X_F)))
			(!W24 (?X_L (BEFORE ?X_D)))
			(!W25 (?X_L (BEFORE ?X_B)))
			(!W26 (?X_J (BEFORE ?X_H)))
			(!W27 (?X_J (BEFORE ?X_F)))
			(!W28 (?X_J (BEFORE ?X_D)))
			(!W29 (?X_J (BEFORE ?X_B)))
			(!W30 (?X_H (BEFORE ?X_F)))
			(!W31 (?X_H (BEFORE ?X_D)))
			(!W32 (?X_H (BEFORE ?X_B)))
			(!W33 (?X_F (BEFORE ?X_D)))
			(!W34 (?X_F (BEFORE ?X_B)))
			(!W35 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent has a cat of a agent has a black rat."
			"A agent sees can."
			"A agent sees a cat of a agent has a black rat can."
			"A black rat sees can."
			"A cat of a agent has a black rat sees can."
			"A black rat sees a cat of a agent has a black rat can."
			"A black rat run.122s a destination from L1."
			"A black rat run.123s a destination from L1."
			"A of a agent runs."
			"A agent sees a cat of a agent has a black rat and a black rat can."
	)
)



(
	(EPI-SCHEMA ((?X_B
	              (COMPOSITE-SCHEMA-192.PR (KA (CATCH.V ?X_D))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-193.PR (KE (?X_J (HAVE.V ?X_F))) ?X_J ?X_K))
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
	              (COMPOSITE-SCHEMA-194.PR
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



(
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-195.PR ?X_H (KA HELP.V) ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_J WOMAN.N))
			(!R2 (?X_H CRYING.N))
			(!R3 (?X_H BOY.N))
			(!R4 (?X_I HELP.N))
			(!R5 (?X_I (PERTAIN-TO ?X_J)))
		)
		(:STEPS
			(?X_C (?X_H CRY.V))
			(?X_E (?X_J (SEE.V ?X_H)))
			(?X_G (?X_J (WANT.V (KA HELP.V))))
			(?X_A (NOT (?X_H ((DID.AUX WANT.V) ?X_I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_G)))
			(!W3 (?X_C (BEFORE ?X_A)))
			(!W4 (?X_E (BEFORE ?X_G)))
			(!W5 (?X_E (BEFORE ?X_A)))
			(!W6 (?X_G (BEFORE ?X_A)))
		)
	)
	(
			"A crying boy cries."
			"A woman sees a crying boy."
			"A woman wants helping."
			"A crying boy wants a help of a woman not did."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) COME.10.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_C (VERY.ADV TINY.A)))
			(!R6 (?X_D (PERTAIN-TO ?X_C)))
			(!R7 (?X_D (K FIRST.A) LESSON.N))
			(!R8 (?X_A (PERTAIN-TO ?X_C)))
			(!R9 (?X_A LAP.N))
			(!R10 (?X_B (PLUR KNEE.N)))
			(!R11 (?X_B (PERTAIN-TO ?X_C)))
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
		(:PARAPHRASES
			(?X_E
	   (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) ((ADV-A (FOR.P ?X_D)) COME.10.V))))
			(?X_E
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) COME.10.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) COME.10.V) ?X_D))
			(?X_E (?X_C COME.10.V))
			(?X_E (?X_C COME.10.V ?X_D))
			(?X_E (?X_C (LOCATION_ADV.? COME.10.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (SAME-TIME ?X_H)))
			(!W7 (?X_E (RIGHT-AFTER ?X_F)))
			(!W8 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) COME.11.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D (K FIRST.A) LESSON.N))
			(!R6 (?X_D (PERTAIN-TO ?X_C)))
			(!R7 (?X_C (VERY.ADV TINY.A)))
			(!R8 (?X_A (PLUR KNEE.N)))
			(!R9 (?X_A (PERTAIN-TO ?X_C)))
			(!R10 (?X_B (PERTAIN-TO ?X_C)))
			(!R11 (?X_B LAP.N))
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
		(:PARAPHRASES
			(?X_E
	   (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) ((ADV-A (FOR.P ?X_D)) COME.11.V))))
			(?X_E
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) COME.11.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) COME.11.V) ?X_D))
			(?X_E (?X_C COME.11.V))
			(?X_E (?X_C COME.11.V ?X_D))
			(?X_E (?X_C (LOCATION_ADV.? COME.11.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (SAME-TIME ?X_H)))
			(!W7 (?X_E (RIGHT-AFTER ?X_F)))
			(!W8 (?X_G (BEFORE ?X_H)))
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
	              (COMPOSITE-SCHEMA-196.PR (KA (PLAY.V (K ACCORDION.N))) ?X_M
	               (K ACCORDION.N) ?X_N ?X_F ?X_O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_N (PLUR KNEE.N)))
			(!R2 (?X_F BIG.A))
			(!R3 (?X_F PAIN.N))
			(!R4 (?X_M LAP.N))
			(!R5 (?X_M (PERTAIN-TO ?X_P)))
			(!R6 (?X_N (PERTAIN-TO ?X_P)))
			(!R7 (?X_P AGENT.N))
			(!R8 (?X_P (VERY.ADV TINY.A)))
			(!R9 (?X_O DESTINATION.N))
			(!R10 (?X_O (K FIRST.A) LESSON.N))
			(!R11 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_L (?X_P (WANT.V (KA (PLAY.V (K ACCORDION.N))))))
			(?X_J (?X_P (FOR.P ?X_O)))
			(?X_H (?X_P (PUT.V (K ACCORDION.N) ?X_M)))
			(?X_E (?X_P ?X_F (IN.P ?X_N)))
			(?X_A (?X_P ((ADV-A (FROM.P ?L1)) COME.10.V) ?X_O))
			(?X_A (?X_P ((ADV-A (FROM.P ?L1)) COME.11.V) ?X_O))
			(?X_B (?X_P (((ADV-A (ON.P ?X_M)) PUT.V) (K ACCORDION.N))))
			(?X_C (?X_P (((ADV-A (IN.P ?X_N)) FEEL.V) ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_A)))
			(!W2 (?X_L (BEFORE ?X_B)))
			(!W3 (?X_L (BEFORE ?X_C)))
			(!W4 (?X_J (BEFORE ?X_A)))
			(!W5 (?X_J (BEFORE ?X_B)))
			(!W6 (?X_J (BEFORE ?X_C)))
			(!W7 (?X_H (BEFORE ?X_B)))
			(!W8 (?X_H (BEFORE ?X_C)))
			(!W9 (?X_E (BEFORE ?X_C)))
			(!W10 (?X_A (BEFORE ?X_B)))
			(!W11 (?X_A (BEFORE ?X_C)))
			(!W12 (?X_B (BEFORE ?X_C)))
		)
	)
	(
			"A agent very tiny wants playing accordion."
			"A agent very tiny is for."
			"A agent very tiny puts accordion a lap of a agent very tiny."
			"A agent very tiny is in."
			"A agent very tiny come.214s a destination of a agent very tiny from L1."
			"A agent very tiny come.215s a destination of a agent very tiny from L1."
			"A agent very tiny puts accordion on a lap of a agent very tiny."
			"A agent very tiny feels a big pain in a knees of a agent very tiny."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.40.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D STORE.N))
			(!R6 (?X_A NEW.A))
			(!R7 (?X_A (PERTAIN-TO ?X_C)))
			(!R8 (?X_A (PLUR CHAIR.N)))
			(!R9 (?X_B (PERTAIN-TO ?X_C)))
			(!R10 (?X_B (K OLD.A) (PLUR ONE.N)))
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
		(:PARAPHRASES
			(?X_E
	   (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) ((ADV-A (TO.P ?X_D)) GO.40.V))))
			(?X_E
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.40.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.40.V) ?X_D))
			(?X_E (?X_C GO.40.V))
			(?X_E (?X_C GO.40.V ?X_D))
			(?X_E (?X_C (LOCATION_ADV.? GO.40.V)))
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
	(EPI-SCHEMA ((?X_C GET.32.V (K MORE.A)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT ((K MORE.A) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = (K MORE.A))))
			(!R5 (?X_A (PERTAIN-TO ?X_C)))
			(!R6 (?X_A (K OLD.A) (PLUR ONE.N)))
			(!R7 (?X_B NEW.A))
			(!R8 (?X_B (PLUR CHAIR.N)))
			(!R9 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V (K MORE.A)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V (K MORE.A))))
			(?I2 (?X_C (AT.P ?L)))
			(?I3 ((K MORE.A) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V (K MORE.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_F)))
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
	(EPI-SCHEMA ((?X_R (COMPOSITE-SCHEMA-197.PR ?X_P ?X_O (K NICE.A) ?X_Q (K MORE.A)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_P (K OLD.A) (PLUR ONE.N)))
			(!R2 (?X_O NEW.A))
			(!R3 (?X_O (PLUR CHAIR.N)))
			(!R4 (?X_O (PERTAIN-TO ?X_R)))
			(!R5 (?X_P (PERTAIN-TO ?X_R)))
			(!R6 (?X_Q DESTINATION.N))
			(!R7 (?X_Q STORE.N))
			(!R8 (?X_R AGENT.N))
			(!R9 (NOT ((K MORE.A) AGENT.N)))
			(!R10 (NOT (?X_R = (K MORE.A))))
		)
		(:STEPS
			(?X_N (?X_R (NEED.V ?X_O)))
			(?X_L (?X_R ((AWAY.PRT THROW.V) ?X_P)))
			(?X_A (?X_R ((AWAY.PRT THROW.V) ?X_P)))
			(?X_J (?X_R ((ADV-A (FROM.P ?L1)) GO.40.V) ?X_Q))
			(?X_H (?X_R GET.32.V (K MORE.A)))
			(?X_B (?X_R ((UP.PRT SET.V) ?X_O)))
			(?X_F (?X_R ((UP.PRT SET.V) ?X_O)))
			(?X_D (?X_O (LOOK.V (K NICE.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_A)))
			(!W2 (?X_N (BEFORE ?X_J)))
			(!W3 (?X_N (BEFORE ?X_H)))
			(!W4 (?X_N (BEFORE ?X_B)))
			(!W5 (?X_N (BEFORE ?X_F)))
			(!W6 (?X_N (BEFORE ?X_D)))
			(!W7 (?X_L (BEFORE ?X_A)))
			(!W8 (?X_L (BEFORE ?X_J)))
			(!W9 (?X_L (BEFORE ?X_H)))
			(!W10 (?X_L (BEFORE ?X_B)))
			(!W11 (?X_L (BEFORE ?X_F)))
			(!W12 (?X_L (BEFORE ?X_D)))
			(!W13 (?X_A (BEFORE ?X_J)))
			(!W14 (?X_A (BEFORE ?X_H)))
			(!W15 (?X_A (BEFORE ?X_B)))
			(!W16 (?X_A (BEFORE ?X_F)))
			(!W17 (?X_A (BEFORE ?X_D)))
			(!W18 (?X_J (BEFORE ?X_B)))
			(!W19 (?X_J (BEFORE ?X_F)))
			(!W20 (?X_J (BEFORE ?X_D)))
			(!W21 (?X_H (BEFORE ?X_B)))
			(!W22 (?X_H (BEFORE ?X_F)))
			(!W23 (?X_H (BEFORE ?X_D)))
			(!W24 (?X_B (BEFORE ?X_D)))
			(!W25 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A agent needs a new chairs of a agent."
			"A agent throws a of a agent away."
			"A agent throws a of a agent away."
			"A agent go.226s a destination store from L1."
			"A agent get.235s more."
			"A agent sets a new chairs of a agent up."
			"A agent sets a new chairs of a agent up."
			"A new chairs of a agent looks nice."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (COMPOSITE-SCHEMA-198.PR
	               (K (L X (AND (X MANY.A) (X (PLUR STAR.N)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
		)
		(:STEPS
			(?X_E (?X_C (SEE.V (K (L X (AND (X MANY.A) (X (PLUR STAR.N))))))))
			(?X_B ((K NIGHT.N) COME.V))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A agent sees many star."
			"Night comes."
	)
)



(
	(EPI-SCHEMA ((?X_C (((ADV-A (IN.P ?X_E)) PUT.6.V) ?X_D)) ** ?X_F)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_E CONTAINER.N))
			(!R4 (NOT (?X_E AGENT.N)))
			(!R5 (?X_D SMALLER-THAN ?X_E))
			(!R6 (?X_E (AT.P (K SCHOOL.N))))
			(!R7 (?X_E DESK.N))
			(!R8 (?X_E (PERTAIN-TO ?X_C)))
			(!R9 (?X_D FAN.N))
			(!R10 (?X_D (VERY.ADV MUCH.A)))
			(!R11 (?X_D (PERTAIN-TO ?X_C)))
			(!R12 (?X_A HAND.N))
			(!R13 (?X_A (PERTAIN-TO ?X_C)))
			(!R14 (?X_B PRETTY.A))
			(!R15 (?X_D (IS.V ?X_B)))
			(!R16 (?X_B FAN.N))
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
		(:PARAPHRASES
			(?X_F (?X_C ((ADV-A (INTO.P ?X_E)) PUT.6.V) ?X_D))
			(?X_F (?X_C ((ADV-A (INSIDE.P ?X_E)) PUT.6.V) ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (SAME-TIME ?X_I)))
			(!W2 (?X_F (RIGHT-AFTER ?X_G)))
			(!W3 (?X_H (AT-ABOUT ?X_I)))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (IN.P ?X_E)) PUT.7.V) ?X_D)) ** ?X_F)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_E CONTAINER.N))
			(!R4 (NOT (?X_E AGENT.N)))
			(!R5 (?X_D SMALLER-THAN ?X_E))
			(!R6 (?X_E (AT.P (K SCHOOL.N))))
			(!R7 (?X_E DESK.N))
			(!R8 (?X_E (PERTAIN-TO ?X_C)))
			(!R9 (?X_D (VERY.ADV MUCH.A)))
			(!R10 (?X_D FAN.N))
			(!R11 (?X_D (PERTAIN-TO ?X_C)))
			(!R12 (?X_A PRETTY.A))
			(!R13 (?X_D (IS.V ?X_A)))
			(!R14 (?X_A FAN.N))
			(!R15 (?X_B (PERTAIN-TO ?X_C)))
			(!R16 (?X_B HAND.N))
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
		(:PARAPHRASES
			(?X_F (?X_C ((ADV-A (INTO.P ?X_E)) PUT.7.V) ?X_D))
			(?X_F (?X_C ((ADV-A (INSIDE.P ?X_E)) PUT.7.V) ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (SAME-TIME ?X_I)))
			(!W2 (?X_F (RIGHT-AFTER ?X_G)))
			(!W3 (?X_H (AT-ABOUT ?X_I)))
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
	(EPI-SCHEMA ((?X_U (COMPOSITE-SCHEMA-199.PR ?X_R ?X_P ?X_A ?X_K ?X_V ?X_T)) ** ?E)
		(:ROLES
			(!R1 (?X_K HAND.N))
			(!R2 (?X_K (PERTAIN-TO ?X_U)))
			(!R3 (?X_P (HAS.V (TWO.D (PLUR BLADE.N)))))
			(!R4 (?X_Q FATHER.N))
			(!R5 (?X_Q (PERTAIN-TO ?X_R)))
			(!R6 (?X_S PRETTY.A))
			(!R7 (?X_S FAN.N))
			(!R8 (?X_T (IS.V ?X_S)))
			(!R9 (?X_T SMALLER-THAN ?X_V))
			(!R10 (?X_T (VERY.ADV MUCH.A)))
			(!R11 (?X_T FAN.N))
			(!R12 (?X_T (PERTAIN-TO ?X_U)))
			(!R13 (?X_U AGENT.N))
			(!R14 (?X_V CONTAINER.N))
			(!R15 (?X_V (AT.P (K SCHOOL.N))))
			(!R16 (?X_V DESK.N))
			(!R17 (?X_V (PERTAIN-TO ?X_U)))
			(!R18 (NOT (?X_V AGENT.N)))
		)
		(:STEPS
			(?X_O (?X_Q (BUY.V ?X_P ?X_R)))
			(?X_B (?X_Q (((ADV-A (FOR.P ?X_R)) BUY.V) ?X_P)))
			(?X_M (?X_R (CARRY.V ?X_A)))
			(?X_C (?X_U (LIKE.V ?X_T)))
			(?X_J (?X_U (LIKE.V ?X_T)))
			(?X_H (?X_U (CARRY.V ?X_T ?X_K)))
			(?X_D (?X_U (((ADV-A (IN.P ?X_K)) CARRY.V) ?X_T)))
			(?X_F (?X_U (PUT.V ?X_T ?X_V)))
			(E356.SK (?X_U (((ADV-A (IN.P ?X_V)) PUT.6.V) ?X_T)))
			(E356.SK (?X_U (((ADV-A (IN.P ?X_V)) PUT.7.V) ?X_T)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_B)))
			(!W2 (?X_O (BEFORE ?X_M)))
			(!W3 (?X_O (BEFORE ?X_C)))
			(!W4 (?X_O (BEFORE ?X_J)))
			(!W5 (?X_O (BEFORE ?X_H)))
			(!W6 (?X_O (BEFORE ?X_D)))
			(!W7 (?X_B (BEFORE ?X_M)))
			(!W8 (?X_B (BEFORE ?X_C)))
			(!W9 (?X_B (BEFORE ?X_J)))
			(!W10 (?X_B (BEFORE ?X_H)))
			(!W11 (?X_B (BEFORE ?X_D)))
			(!W12 (?X_M (BEFORE ?X_C)))
			(!W13 (?X_M (BEFORE ?X_J)))
			(!W14 (?X_M (BEFORE ?X_H)))
			(!W15 (?X_M (BEFORE ?X_D)))
			(!W16 (?X_C (BEFORE ?X_J)))
			(!W17 (?X_C (BEFORE ?X_H)))
			(!W18 (?X_C (BEFORE ?X_D)))
			(!W19 (?X_J (BEFORE ?X_H)))
			(!W20 (?X_J (BEFORE ?X_D)))
			(!W21 (?X_H (BEFORE ?X_D)))
			(!W22 (?X_F BEFORE E356.SK))
		)
	)
	(
			"A father of X_R buys a has two blades X_R."
			"A father of X_R buys a has two blades for X_R."
			"X_R carries X_A."
			"A agent likes a very much fan is a pretty fan of a agent."
			"A agent likes a very much fan is a pretty fan of a agent."
			"A agent carries a very much fan is a pretty fan of a agent a hand of a agent."
			"A agent carries a very much fan is a pretty fan of a agent in a hand of a agent."
			"A agent puts a very much fan is a pretty fan of a agent a container at school desk of a agent."
			"A agent put.263s a very much fan is a pretty fan of a agent in a container at school desk of a agent."
			"A agent put.264s a very much fan is a pretty fan of a agent in a container at school desk of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.24.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C FAIR.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_A (PLUR FRIEND.N)))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?L2 THERE.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C ((ADV-A (AT.P ?L2)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_C ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C ((ADV-A (AT.P ?L2)) BE.V)))
		)
		(:PARAPHRASES
			(?X_D (?X_B ((ADV-A (TO.P ?L2)) TAKE.V) ?X_C))
			(?X_D (?X_B ((ADV-A (TO.P ?L2)) CARRY.V) ?X_C))
			(?X_D (?X_B ((ADV-A (TO.P ?L2)) BRING.V) ?X_C))
			(?X_D (?X_B (TAKE.V ?X_C)))
			(?X_D (?X_B CARRY.V ?X_C))
			(?X_D (?X_B BRING.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?P1 POSTCOND-OF ?X_D))
			(!W3 (?X_E (AFTER ?X_D)))
			(!W4 (?X_E (BEFORE ?X_F)))
			(!W5 (?X_H (SAME-TIME ?X_F)))
			(!W6 (?X_J (BEFORE ?X_F)))
			(!W7 (?X_H (RIGHT-AFTER ?X_G)))
			(!W8 (?X_H (AFTER ?X_I)))
			(!W9 (?X_J (AFTER ?X_K)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.25.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C AGENT.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_A (PLUR FRIEND.N)))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?L2 THERE.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C ((ADV-A (AT.P ?L2)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_C ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C ((ADV-A (AT.P ?L2)) BE.V)))
		)
		(:PARAPHRASES
			(?X_D (?X_B ((ADV-A (TO.P ?L2)) TAKE.V) ?X_C))
			(?X_D (?X_B ((ADV-A (TO.P ?L2)) CARRY.V) ?X_C))
			(?X_D (?X_B ((ADV-A (TO.P ?L2)) BRING.V) ?X_C))
			(?X_D (?X_B (TAKE.V ?X_C)))
			(?X_D (?X_B CARRY.V ?X_C))
			(?X_D (?X_B BRING.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?P1 POSTCOND-OF ?X_D))
			(!W3 (?X_F (AFTER ?X_D)))
			(!W4 (?X_F (RIGHT-AFTER ?X_E)))
			(!W5 (?X_F (SAME-TIME ?X_G)))
			(!W6 (?X_H (BEFORE ?X_G)))
			(!W7 (?X_J (BEFORE ?X_G)))
			(!W8 (?X_H (AFTER ?X_I)))
			(!W9 (?X_J (AFTER ?X_K)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (AT.P ?X_K)) GET.33.V) ?O)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?O)))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A (PLUR FRIEND.N)))
			(!R7 (?X_K THERE.N))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_D (AFTER ?X_C)))
			(!W6 (?X_D (SAME-TIME ?X_F)))
			(!W7 (?X_D (RIGHT-AFTER ?X_E)))
			(!W8 (?X_G (BEFORE ?X_F)))
			(!W9 (?X_I (BEFORE ?X_F)))
			(!W10 (?X_G (AFTER ?X_H)))
			(!W11 (?X_I (AFTER ?X_J)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_S
	              (COMPOSITE-SCHEMA-200.PR (KA ((ADV-A (TO.P ?X_Q)) GO.V)) ?X_P
	               (K FUN.N) ?X_Q ?X_R ?O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_P (PLUR FRIEND.N)))
			(!R2 (?X_P (PERTAIN-TO ?X_S)))
			(!R3 (?X_Q FAIR.N))
			(!R4 (?X_Q SMALLER-THAN.N ?X_S))
			(!R5 (?X_R AGENT.N))
			(!R6 (?X_R SMALLER-THAN.N ?X_S))
			(!R7 (?X_S AGENT.N))
			(!R8 (NOT (?O AGENT.N)))
			(!R9 (NOT (?X_S = ?O)))
		)
		(:STEPS
			(?X_O (?X_S (WANT.V (KA ((ADV-A (TO.P ?X_Q)) GO.V)))))
			(?X_A (?X_S (THERE.ADV GET.V)))
			(?X_M (?X_S (MEET.V ?X_P)))
			(?X_B (?X_S TRANSPORT_OBJECT.24.V ?X_Q))
			(?X_J (?X_S (MEET.V ?X_P)))
			(?X_C (?X_S TRANSPORT_OBJECT.25.V ?X_R))
			(?X_C (?X_S (((ADV-A (AT.P ?X_K)) GET.33.V) ?O)))
			(?X_D (?X_S (MEET.V ?X_P)))
			(?X_H (?X_R (HAVE.V (K FUN.N))))
			(?X_F (?X_R ((ADV-A (FOR.P (THREE.D (PLUR HOUR.N)))) STAY.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_D)))
			(!W2 (?X_O (BEFORE ?X_H)))
			(!W3 (?X_O (BEFORE ?X_F)))
			(!W4 (?X_A (BEFORE ?X_M)))
			(!W5 (?X_A (BEFORE ?X_D)))
			(!W6 (?X_A (BEFORE ?X_H)))
			(!W7 (?X_A (BEFORE ?X_F)))
			(!W8 (?X_M (BEFORE ?X_D)))
			(!W9 (?X_M (BEFORE ?X_H)))
			(!W10 (?X_M (BEFORE ?X_F)))
			(!W11 (?X_B (BEFORE ?X_J)))
			(!W12 (?X_B (BEFORE ?X_D)))
			(!W13 (?X_B (BEFORE ?X_H)))
			(!W14 (?X_B (BEFORE ?X_F)))
			(!W15 (?X_J (BEFORE ?X_D)))
			(!W16 (?X_J (BEFORE ?X_H)))
			(!W17 (?X_J (BEFORE ?X_F)))
			(!W18 (?X_C (BEFORE ?X_D)))
			(!W19 (?X_C (BEFORE ?X_H)))
			(!W20 (?X_C (BEFORE ?X_F)))
			(!W21 (?X_D (BEFORE ?X_H)))
			(!W22 (?X_D (BEFORE ?X_F)))
			(!W23 (?X_H (BEFORE ?X_F)))
		)
	)
	(
			"A agent wants to a fair going."
			"A agent gets there."
			"A agent meets a friends of a agent."
			"A agent transport object.291s a fair."
			"A agent meets a friends of a agent."
			"A agent transport object.292s a agent."
			"A agent get.285s O at X_K."
			"A agent meets a friends of a agent."
			"A agent has fun."
			"A agent stays for three hours."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.34.V (KE (?X_B READY.A))) ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT ((KE (?X_B READY.A)) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (KE (?X_B READY.A)))))
			(!R5 (?X_B READY.A))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
			(!R7 (?X_B (K FISHING.N) POLE.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (HAVE.V (KE (?X_B READY.A))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V (KE (?X_B READY.A)))))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 ((KE (?X_B READY.A)) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V (KE (?X_B READY.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (RIGHT-AFTER ?X_C)))
			(!W6 (?X_D (SAME-TIME ?X_F)))
			(!W7 (?X_E (BEFORE ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-201.PR ?X_D (KE (?X_H READY.A)))) ** ?E)
		(:ROLES
			(!R1 (?X_D BIG.A))
			(!R2 (?X_D FISH.N))
			(!R3 (?X_G AGENT.N))
			(!R4 (?X_H READY.A))
			(!R5 (?X_H (PERTAIN-TO ?X_G)))
			(!R6 (?X_H (K FISHING.N) POLE.N))
			(!R7 (NOT ((KE (?X_H READY.A)) AGENT.N)))
			(!R8 (NOT (?X_G = (KE (?X_H READY.A)))))
		)
		(:STEPS
			(?X_A (?X_G GET.34.V (KE (?X_H READY.A))))
			(?X_C (?X_G (CATCH.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_C)))
		)
	)
	(
			"A agent get.300s a ready of a agent ready."
			"A agent catches a big fish."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) FALL.5.V) (K SICK.A)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K SICK.A) DESTINATION.N))
			(!R4 (NOT (?L1 = (K SICK.A))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P (K SICK.A))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (K SICK.A)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (K SICK.A))))
		)
		(:PARAPHRASES
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? (K SICK.A))) FALL.5.V)))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K SICK.A))) FALL.5.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? (K SICK.A))) FALL.5.V) (K SICK.A)))
			(?X_B (?X_A FALL.5.V))
			(?X_B (?X_A ((THEN.ADV FALL.5.V) (K SICK.A))))
			(?X_B (?X_A (LOCATION_ADV.? FALL.5.V)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.41.V) (KA EAT.V)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA EAT.V) DESTINATION.N))
			(!R4 (NOT (?L1 = (KA EAT.V))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P (KA EAT.V))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (KA EAT.V)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (KA EAT.V))))
		)
		(:PARAPHRASES
			(?X_B
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_A
	     ((ADV-A (DESTINATION_PREP.? (KA EAT.V)))
	      (OUT.PRT ((ADV-A (FOR.P (KA EAT.V))) GO.41.V))))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? (KA EAT.V))) GO.41.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? (KA EAT.V))) GO.41.V) (KA EAT.V)))
			(?X_B (?X_A GO.41.V))
			(?X_B (?X_A GO.41.V (KA EAT.V)))
			(?X_B (?X_A (LOCATION_ADV.? GO.41.V)))
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
	(EPI-SCHEMA ((?X_B EAT.7.V ?X_A) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_A FOOD.N))
			(!R3 (?X_A LOT.N))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-202.PR (K SICK.A) (KA EAT.V) ?X_I)) ** ?E)
		(:ROLES
			(!R1 ((KA EAT.V) DESTINATION.N))
			(!R2 (?X_I FOOD.N))
			(!R3 (?X_I LOT.N))
			(!R4 ((K SICK.A) DESTINATION.N))
			(!R5 (?X_J AGENT.N))
		)
		(:STEPS
			(?X_H (?X_J ((ADV-A (FROM.P ?L1)) GO.41.V) (KA EAT.V)))
			(?X_F (?X_J EAT.7.V ?X_I))
			(?X_B (?X_A POINT.N))
			(?X_D (?X_J ((ADV-A (FROM.P ?L1)) FALL.5.V) (K SICK.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_B)))
			(!W3 (?X_H (BEFORE ?X_D)))
			(!W4 (?X_F (BEFORE ?X_B)))
			(!W5 (?X_F (BEFORE ?X_D)))
			(!W6 (?X_B (BEFORE ?X_D)))
		)
	)
	(
			"A agent go.318s eating from L1."
			"A agent eat.319s a food lot."
			"X_A is point."
			"A agent fall.317s sick from L1."
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.26.V ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C ENTITY.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_D DESTINATION.N))
			(!R6 (?X_D RIDE.N))
			(!R7 (?X_B (HAS.V ?X_A)))
			(!R8 (?X_A LITTLE.A))
			(!R9 (?X_A WAGON.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C ((ADV-A (AT.P ?X_D)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_C ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_C ((ADV-A (AT.P ?X_D)) BE.V)))
		)
		(:PARAPHRASES
			(?X_E (?X_B (((ADV-A (TO.P ?X_D)) ((ADV-A (FOR.P ?X_D)) TAKE.V)) ?X_C)))
			(?X_E (?X_B ((ADV-A (TO.P ?X_D)) CARRY.V) ?X_C))
			(?X_E (?X_B ((ADV-A (TO.P ?X_D)) BRING.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? TAKE.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? CARRY.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? BRING.V) ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?P1 POSTCOND-OF ?X_E))
			(!W3 (?X_E (AFTER ?X_F)))
			(!W4 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.29.V (KA ((ADV-A (IN.P ?X_C)) RIDE.V))) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((KA ((ADV-A (IN.P ?X_C)) RIDE.V)) ACTION.N))
			(!R3 (?X_C LITTLE.A))
			(!R4 (?X_C WAGON.N))
			(!R5 (?X_A (HAS.V ?X_C)))
		)
		(:PRECONDS
			(?I1 (?X_B (THINK.V (THAT ((KA ((ADV-A (IN.P ?X_C)) RIDE.V)) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_D (?X_B (WANT.V (KA ((ADV-A (IN.P ?X_C)) RIDE.V)))))
			(?X_D (?X_B (LIKE.V (KA ((ADV-A (IN.P ?X_C)) RIDE.V)))))
			(?X_D (?X_B (LOVE.V (KA ((ADV-A (IN.P ?X_C)) RIDE.V)))))
			(?X_D (?X_B (ENJOY.V (KA ((ADV-A (IN.P ?X_C)) RIDE.V)))))
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
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.30.V
	              (KA (RIDE.V (IN.P (AND (?X_C LITTLE.A) (?X_C WAGON.N))))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((KA (RIDE.V (IN.P (AND (?X_C LITTLE.A) (?X_C WAGON.N))))) ACTION.N))
			(!R3 (?X_A WAGON.N))
			(!R4 (?X_C (HAS.V ?X_A)))
			(!R5 (?X_A LITTLE.A))
		)
		(:PRECONDS
			(?I1
	   (?X_B
	    (THINK.V
	     (THAT ((KA (RIDE.V (IN.P (AND (?X_C LITTLE.A) (?X_C WAGON.N))))) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_D
	   (?X_B (WANT.V (KA (RIDE.V (IN.P (AND (?X_C LITTLE.A) (?X_C WAGON.N))))))))
			(?X_D
	   (?X_B (LIKE.V (KA (RIDE.V (IN.P (AND (?X_C LITTLE.A) (?X_C WAGON.N))))))))
			(?X_D
	   (?X_B (LOVE.V (KA (RIDE.V (IN.P (AND (?X_C LITTLE.A) (?X_C WAGON.N))))))))
			(?X_D
	   (?X_B (ENJOY.V (KA (RIDE.V (IN.P (AND (?X_C LITTLE.A) (?X_C WAGON.N))))))))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (FOR.P ?X_A)) TAKE.20.V) ?X_D)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_A RIDE.N))
			(!R6 (?X_C (HAS.V ?X_B)))
			(!R7 (?X_B LITTLE.A))
			(!R8 (?X_B WAGON.N))
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
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?I2 PRECOND-OF ?X_E))
			(!W3 (?I3 PRECOND-OF ?X_E))
			(!W4 (?P1 POSTCOND-OF ?X_E))
			(!W5 (?X_E (AFTER ?X_F)))
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
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-203.PR (KA ((ADV-A (IN.P ?X_H)) RIDE.V))
	               (KA (RIDE.V (IN.P (AND (?X_K LITTLE.A) (?X_K WAGON.N))))) ?X_J))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K (HAS.V ?X_H)))
			(!R2 (?X_H LITTLE.A))
			(!R3 (?X_H WAGON.N))
			(!R4 ((KA ((ADV-A (IN.P ?X_H)) RIDE.V)) ACTION.N))
			(!R5 (?X_J SMALLER-THAN.N ?X_K))
			(!R6 (?X_I RIDE.N))
			(!R7 (?X_K AGENT.N))
			(!R8 (NOT (?X_K = ?X_J)))
			(!R9 ((KA (RIDE.V (IN.P (AND (?X_K LITTLE.A) (?X_K WAGON.N))))) ACTION.N))
		)
		(:STEPS
			(?X_E (?X_J ENJOY_ACTION.29.V (KA ((ADV-A (IN.P ?X_H)) RIDE.V))))
			(?X_A (?X_K TRANSPORT_OBJECT.26.V ?X_J))
			(?X_A (?X_K (((ADV-A (FOR.P ?X_I)) TAKE.20.V) ?X_J)))
			(?X_C
	   (?X_J ENJOY_ACTION.30.V
	    (KA (RIDE.V (IN.P (AND (?X_K LITTLE.A) (?X_K WAGON.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_A)))
			(!W2 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"X_J enjoy action.327s in a little wagon riding."
			"A agent has a little wagon transport object.323s X_J."
			"A agent has a little wagon take.331s X_J for a ride."
			"X_J enjoy action.328s riding in and a agent has a little wagon little a agent has a little wagon wagon."
	)
)



(
	(EPI-SCHEMA ((?X_C (GIVE.10.V ?X_D ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?X_D AGENT.N))
			(!R4 (?X_E BUN.N))
			(!R5 (?X_A (PERTAIN-TO ?X_D)))
			(!R6 (?X_A (K HIND.A) (PLUR FOOT.N)))
			(!R7 (?X_D (IS.V ?X_B)))
			(!R8 (?X_B BUN.N))
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
		(:PARAPHRASES
			(?X_F (?X_C (((ADV-A (TO.P ?X_D)) GIVE.10.V) ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AFTER ?X_G)))
			(!W2 (?X_G (AT-ABOUT ?X_H)))
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
	(EPI-SCHEMA ((?X_C (GIVE.11.V ?X_D ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?X_D AGENT.N))
			(!R4 (?X_E BUN.N))
			(!R5 (?X_A BUN.N))
			(!R6 (?X_D (IS.V ?X_A)))
			(!R7 (?X_B (K HIND.A) (PLUR FOOT.N)))
			(!R8 (?X_B (PERTAIN-TO ?X_D)))
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
		(:PARAPHRASES
			(?X_F (?X_C (((ADV-A (TO.P ?X_D)) GIVE.11.V) ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AFTER ?X_G)))
			(!W2 (?X_G (AT-ABOUT ?X_H)))
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
	(EPI-SCHEMA ((?X_R (COMPOSITE-SCHEMA-204.PR ?X_N ?X_R ?X_T)) ** ?E)
		(:ROLES
			(!R1 (?X_N (K HIND.A) (PLUR FOOT.N)))
			(!R2 (?X_N (PERTAIN-TO ?X_R)))
			(!R3 (?X_O BUN.N))
			(!R4 (?X_R (IS.V ?X_O)))
			(!R5 (?X_R AGENT.N))
			(!R6 (?X_S AGENT.N))
			(!R7 (?X_T BUN.N))
			(!R8 (NOT (?X_T AGENT.N)))
		)
		(:STEPS
			(?X_M (?X_R ((MAY.AUX HAVE.V) ?X_R)))
			(?X_K (?X_R (ON.P ?X_N)))
			(?X_C (?X_R ((ADV-A (ON.P ?X_N)) STAND.V)))
			(?X_I (?X_R ((ADV-A (AT.P ?X_A)) LOOK.V)))
			(?X_D (?X_B ((ADV-A (AT.P ?X_R)) LOOK.V)))
			(?X_E (?X_B SIT.V))
			(?X_F (?X_B ((ADV-A (AT.P ?X_R)) LOOK.V)))
			(?X_G (?X_B SIT.V))
			(E470.SK (?X_S (GIVE.10.V ?X_R ?X_T)))
			(E470.SK (?X_S (GIVE.11.V ?X_R ?X_T)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_K)))
			(!W2 (?X_M (BEFORE ?X_C)))
			(!W3 (?X_M (BEFORE ?X_I)))
			(!W4 (?X_M (BEFORE ?X_D)))
			(!W5 (?X_M (BEFORE ?X_E)))
			(!W6 (?X_M (BEFORE ?X_F)))
			(!W7 (?X_M (BEFORE ?X_G)))
			(!W8 (?X_K (BEFORE ?X_C)))
			(!W9 (?X_K (BEFORE ?X_I)))
			(!W10 (?X_K (BEFORE ?X_D)))
			(!W11 (?X_K (BEFORE ?X_E)))
			(!W12 (?X_K (BEFORE ?X_F)))
			(!W13 (?X_K (BEFORE ?X_G)))
			(!W14 (?X_C (BEFORE ?X_I)))
			(!W15 (?X_C (BEFORE ?X_D)))
			(!W16 (?X_C (BEFORE ?X_E)))
			(!W17 (?X_C (BEFORE ?X_F)))
			(!W18 (?X_C (BEFORE ?X_G)))
			(!W19 (?X_I (BEFORE ?X_D)))
			(!W20 (?X_I (BEFORE ?X_E)))
			(!W21 (?X_I (BEFORE ?X_F)))
			(!W22 (?X_I (BEFORE ?X_G)))
			(!W23 (?X_D (BEFORE ?X_E)))
			(!W24 (?X_D (BEFORE ?X_F)))
			(!W25 (?X_D (BEFORE ?X_G)))
			(!W26 (?X_E (BEFORE ?X_F)))
			(!W27 (?X_E (BEFORE ?X_G)))
			(!W28 (?X_F (BEFORE ?X_G)))
		)
	)
	(
			"A agent is a bun has a agent is a bun may."
			"A agent is a bun is on."
			"A agent is a bun stands on a of a agent is a bun."
			"A agent is a bun looks at X_A."
			"X_B looks at a agent is a bun."
			"X_B sits."
			"X_B looks at a agent is a bun."
			"X_B sits."
			"A agent give.337s a agent is a bun a bun."
			"A agent give.339s a agent is a bun a bun."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.42.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B FARMER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A (PLUR BOOT.N)))
			(!R7 (?L2 OUTSIDE.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.42.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.42.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.42.V) ?L2))
			(?X_C (?X_B GO.42.V))
			(?X_C (?X_B GO.42.V ?L2))
			(?X_C (?X_B GO.42.V))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.43.V)
	              (K (BACK.ADV (TO.P (K BED.N)))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B FARMER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (BACK.ADV (TO.P (K BED.N)))) DESTINATION.N))
			(!R4 (NOT (?L1 = (K (BACK.ADV (TO.P (K BED.N)))))))
			(!R5 (?X_A (PLUR BOOT.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1
	   (?X_B (WANT.V (KA ((ADV-A (AT.P (K (BACK.ADV (TO.P (K BED.N)))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K (BACK.ADV (TO.P (K BED.N))))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K (BACK.ADV (TO.P (K BED.N)))))))
		)
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (DESTINATION_PREP.? (K (BACK.ADV (TO.P (K BED.N)))))) GO.43.V)))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K (BACK.ADV (TO.P (K BED.N)))))) GO.43.V))))
			(?X_C
	   (?X_B
	    ((ADV-A (DESTINATION_PREP.? (K (BACK.ADV (TO.P (K BED.N)))))) GO.43.V)
	    (K (BACK.ADV (TO.P (K BED.N))))))
			(?X_C (?X_B GO.43.V))
			(?X_C (?X_B GO.43.V (K (BACK.ADV (TO.P (K BED.N))))))
			(?X_C (?X_B (LOCATION_ADV.? GO.43.V)))
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
	(EPI-SCHEMA ((?X_C ((UP.PRT ((ADV-A (IN.P ?X_A)) GET.35.V)) ?O)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C FARMER.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?O)))
			(!R5 (?X_A MORNING.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B (PLUR BOOT.N)))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_E)))
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
	              (COMPOSITE-SCHEMA-205.PR ?X_M ?X_F ?L2
	               (K (BACK.ADV (TO.P (K BED.N)))) ?O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F COW.N))
			(!R2 (?X_M (PLUR BOOT.N)))
			(!R3 (?X_M (PERTAIN-TO ?X_O)))
			(!R4 (?X_N MORNING.N))
			(!R5 (NOT (?O AGENT.N)))
			(!R6 (NOT (?X_O = ?O)))
			(!R7 (?L2 DESTINATION.N))
			(!R8 (?L2 OUTSIDE.N))
			(!R9 (?X_O FARMER.N))
			(!R10 ((K (BACK.ADV (TO.P (K BED.N)))) DESTINATION.N))
		)
		(:STEPS
			(?X_J (?X_O (PUT.V ?X_M)))
			(?X_L (?X_O ((UP.PRT ((ADV-A (IN.P ?X_N)) GET.35.V)) ?O)))
			(?X_A (?X_O (KA PUT.V) ?X_M ON.P))
			(?X_H (?X_O ((ADV-A (FROM.P ?L1)) GO.42.V) ?L2))
			(?X_E (?X_O (MILK.V ?X_F)))
			(?X_C (?X_O ((ADV-A (FROM.P ?L1)) GO.43.V) (K (BACK.ADV (TO.P (K BED.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_A)))
			(!W2 (?X_J (BEFORE ?X_H)))
			(!W3 (?X_J (BEFORE ?X_E)))
			(!W4 (?X_J (BEFORE ?X_C)))
			(!W5 (?X_L (BEFORE ?X_A)))
			(!W6 (?X_L (BEFORE ?X_H)))
			(!W7 (?X_L (BEFORE ?X_E)))
			(!W8 (?X_L (BEFORE ?X_C)))
			(!W9 (?X_A (BEFORE ?X_H)))
			(!W10 (?X_A (BEFORE ?X_E)))
			(!W11 (?X_A (BEFORE ?X_C)))
			(!W12 (?X_H (BEFORE ?X_E)))
			(!W13 (?X_H (BEFORE ?X_C)))
			(!W14 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A farmer puts a boots of a farmer."
			"A farmer get.353s O up in a morning."
			"A farmer is on."
			"A farmer go.356s a destination outside from L1."
			"A farmer milks a cow."
			"A farmer go.358s back to bed from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-206.PR ?X_D)) ** ?E)
		(:ROLES
			(!R1 (?X_D GREEN.A))
			(!R2 (?X_D BIRD.N))
		)
		(:STEPS
			(?X_C (?X_A (UP.PRT LOOK.V)))
			(?X_F (?X_A (SEE.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_F)))
		)
	)
	(
			"X_A looks up."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.36.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?L2 OUTSIDE.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) GO.36.V)))
			(?X_B (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.36.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) GO.36.V) ?L2))
			(?X_B (?X_A GO.36.V))
			(?X_B (?X_A GO.36.V ?L2))
			(?X_B (MUST.AUX-S (?X_A (BACK.ADV GO.36.V))))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-207.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_G DOOR.N))
			(!R2 (?X_H DAY.N))
			(!R3 (?X_H (VERY.ADV LONG.A)))
			(!R4 (?X_I AGENT.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?L2 OUTSIDE.N))
		)
		(:STEPS
			(?X_B ((ADV-E (DURING ?X_H)) (?X_A BE.V)))
			(?X_F (?X_I ((ADV-A (ABOUT.P (KA ((ADV-A (OUT.P ?X_G)) WALK.V)))) BE.V)))
			(?X_D (?X_I ((ADV-A (FROM.P ?L1)) GO.36.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_F)))
			(!W2 (?X_B (BEFORE ?X_D)))
			(!W3 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"X_A is DURING a day very long."
			"A agent is about out a door walking."
			"A agent go.1s a destination outside from L1."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              (COMPOSITE-SCHEMA-208.PR ?X_B (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_A DAY.N))
			(!R2 (?X_B (VERY.ADV SHY.A)))
			(!R3 (?X_B (IS.V ?X_C)))
			(!R4 (?X_D AGENT.N))
			(!R5 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:STEPS
			(?X_F
	   ((ADV-E (DURING ?X_A))
	    (?X_D (ASK.V ?X_B (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))))
		)
	)
	(
			"A agent asks a very shy is a of a agent with a agent playing DURING a day."
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.27.V ?X_D) ** ?X_F)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_D ENTITY.N))
			(!R3 (?X_D SMALLER-THAN.N ?X_B))
			(!R4 (?X_C GARDEN.N))
			(!R5 (?X_E DESTINATION.N))
			(!R6 (?X_E (PLUR FLOWER.N)))
			(!R7 (?X_E HIVE.N))
			(!R8 (?X_B (PLUR BEE.N)))
			(!R9 (?X_A AGENT.N))
			(!R10 (?X_C (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_D ((ADV-A (AT.P ?X_E)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_D ((ADV-A (AT.P ?X_C)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_D ((ADV-A (AT.P ?X_E)) BE.V)))
		)
		(:PARAPHRASES
			(?X_F (?X_B ((ADV-A (TO.P ?X_E)) TAKE.V) ?X_D))
			(?X_F (?X_B (((ADV-A (TO.P ?X_E)) CARRY.V) ?X_D)))
			(?X_F (?X_B ((ADV-A (TO.P ?X_E)) BRING.V) ?X_D))
			(?X_F (?X_B (LOCATION_ADV.? TAKE.V) ?X_D))
			(?X_F (?X_B (LOCATION_ADV.? CARRY.V) ?X_D))
			(?X_F (?X_B (LOCATION_ADV.? BRING.V) ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_F))
			(!W2 (?P1 POSTCOND-OF ?X_F))
			(!W3 (?X_F (AT-ABOUT ?X_H)))
			(!W4 (?X_G (AT-ABOUT ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C GET.36.V (KE ((K HONEY.N) (FROM.P ?X_D)))) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT ((KE ((K HONEY.N) (FROM.P ?X_D))) AGENT.N)))
			(!R3 (?X_B GARDEN.N))
			(!R4 (NOT (?X_C = (KE ((K HONEY.N) (FROM.P ?X_D))))))
			(!R5 (?X_D (PLUR FLOWER.N)))
			(!R6 (?X_D HIVE.N))
			(!R7 (?X_C (PLUR BEE.N)))
			(!R8 (?X_A AGENT.N))
			(!R9 (?X_B (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_C (HAVE.V (KE ((K HONEY.N) (FROM.P ?X_D)))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_C HAVE.V (KE ((K HONEY.N) (FROM.P ?X_D))))))
			(?I2 (?X_C (AT.P ?X_B)))
			(?I3 ((KE ((K HONEY.N) (FROM.P ?X_D))) (AT.P ?X_B)))
		)
		(:POSTCONDS
			(?P1 (?X_C HAVE.V (KE ((K HONEY.N) (FROM.P ?X_D)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?I2 PRECOND-OF ?X_E))
			(!W3 (?I3 PRECOND-OF ?X_E))
			(!W4 (?P1 POSTCOND-OF ?X_E))
			(!W5 (?X_E (AT-ABOUT ?X_G)))
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-209.PR (KE ((K (PLUR BEE.N)) (IN.P ?X_K))) ?X_M
	               (KE ((K HONEY.N) (FROM.P ?X_O)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I LITTLE.A))
			(!R2 (?X_I HOUSE.N))
			(!R3 (?X_I HIVE.N))
			(!R4 (?X_I ((PASV CALL.V) ?X_H)))
			(!R5 (?X_I (IN.P ?X_J)))
			(!R6 (?X_K GARDEN.N))
			(!R7 (?X_L AGENT.N))
			(!R8 (?X_K (PERTAIN-TO ?X_L)))
			(!R9 (?X_M ENTITY.N))
			(!R10 (?X_M SMALLER-THAN.N ?X_N))
			(!R11 (?X_O (PLUR FLOWER.N)))
			(!R12 (?X_O HIVE.N))
			(!R13 (?X_N (PLUR BEE.N)))
			(!R14 (NOT ((KE ((K HONEY.N) (FROM.P ?X_O))) AGENT.N)))
			(!R15 (NOT (?X_N = (KE ((K HONEY.N) (FROM.P ?X_O))))))
		)
		(:STEPS
			(?X_A (?X_L (HAVE.V (KE ((K (PLUR BEE.N)) (IN.P ?X_K))))))
			(?X_G ((K (PLUR BEE.N)) ((ADV-A (IN.P ?X_I)) LIVE.V)))
			(?X_E (?X_N TRANSPORT_OBJECT.27.V ?X_M))
			(?X_C (?X_N GET.36.V (KE ((K HONEY.N) (FROM.P ?X_O)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_G)))
			(!W2 (?X_A (BEFORE ?X_E)))
			(!W3 (?X_A (BEFORE ?X_C)))
			(!W4 (?X_G (BEFORE ?X_E)))
			(!W5 (?X_G (BEFORE ?X_C)))
		)
	)
	(
			"A agent has bees in a garden of a agent."
			"Bees live in a little house hive PASV calls X_H in X_J."
			"A bees transport object.33 a entity."
			"A bees get.37 honey from a flowers hive."
	)
)



(
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-210.PR ?X_A ?X_L ?X_H
	               (KE ((K (PLUR PET.N)) (IN.P ?X_K)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H PET.N))
			(!R2 (?X_L (PLUR PARENT.N)))
			(!R3 (?X_K HOUSE.N))
			(!R4 (?X_L (PERTAIN-TO ?X_M)))
		)
		(:STEPS
			(?X_E (?X_M (BE.V ?X_A)))
			(?X_G (?X_M (WITH.P ?X_L)))
			(?X_B (?X_M ((ADV-A (WITH.P ?X_L)) LIVE.V)))
			(?X_J (?X_M (WANT.V ?X_H)))
			(?X_C (NOT (?X_L ((DID.AUX ALLOW.V) (KE ((K (PLUR PET.N)) (IN.P ?X_K)))))))
			(?X_O (?X_M CRY.V))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_G)))
			(!W2 (?X_E (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_J)))
			(!W4 (?X_E (BEFORE ?X_C)))
			(!W5 (?X_E (BEFORE ?X_O)))
			(!W6 (?X_G (BEFORE ?X_B)))
			(!W7 (?X_G (BEFORE ?X_J)))
			(!W8 (?X_G (BEFORE ?X_C)))
			(!W9 (?X_G (BEFORE ?X_O)))
			(!W10 (?X_B (BEFORE ?X_J)))
			(!W11 (?X_B (BEFORE ?X_C)))
			(!W12 (?X_B (BEFORE ?X_O)))
			(!W13 (?X_J (BEFORE ?X_C)))
			(!W14 (?X_J (BEFORE ?X_O)))
			(!W15 (?X_C (BEFORE ?X_O)))
		)
	)
	(
			"X_M is X_A."
			"X_M is with."
			"X_M lives with a parents of X_M."
			"X_M wants a pet."
			"A parents of X_M allows pets in a house not did."
			"X_M cries."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.44.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D BUY.N))
			(!R6 (?X_D BEST.A))
			(!R7 (?X_A (PERTAIN-TO ?X_C)))
			(!R8 (?X_A ?X_B TV.N))
			(!R9 (?X_B GOOD.A))
			(!R10 (?X_B TV.N))
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
		(:PARAPHRASES
			(?X_E
	   (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) ((ADV-A (TO.P ?X_D)) GO.44.V))))
			(?X_E
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.44.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.44.V) ?X_D))
			(?X_E (?X_C GO.44.V))
			(?X_E (?X_C GO.44.V ?X_D))
			(?X_E (?X_C (LOCATION_ADV.? GO.44.V)))
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-211.PR ?X_K ?X_L ?X_O)) ** ?E)
		(:ROLES
			(!R1 (?X_F TV.N))
			(!R2 (?X_K NEW.A))
			(!R3 (?X_K TV.N))
			(!R4 (?X_L (PERTAIN-TO ?X_N)))
			(!R5 (?X_M GOOD.A))
			(!R6 (?X_M TV.N))
			(!R7 (?X_L ?X_M TV.N))
			(!R8 (?X_N AGENT.N))
			(!R9 (?X_O DESTINATION.N))
			(!R10 (?X_O BUY.N))
			(!R11 (?X_O BEST.A))
		)
		(:STEPS
			(?X_J (?X_N (WANT.V ?X_K)))
			(?X_E (?X_N ((ADV-A (AT.P ?X_F)) LOOK.V)))
			(?X_C (?X_N (LOVE.V ?X_L)))
			(?X_H (?X_N ((ADV-A (FROM.P ?L1)) GO.44.V) ?X_O))
			(?X_A (?X_N (LOVE.V ?X_L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_E)))
			(!W2 (?X_J (BEFORE ?X_H)))
			(!W3 (?X_J (BEFORE ?X_A)))
			(!W4 (?X_E (BEFORE ?X_A)))
			(!W5 (?X_C (BEFORE ?X_A)))
			(!W6 (?X_H (BEFORE ?X_A)))
		)
	)
	(
			"A agent wants a new tv."
			"A agent looks at a tv."
			"A agent loves a of a agent."
			"A agent go.68s a destination buy best from L1."
			"A agent loves a of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-212.PR ?X_E)) ** ?E)
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
			"A flowers grow."
			"A rain makes a grass."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.45.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B NEW.A))
			(!R6 (?X_B THING.N))
			(!R7 (?X_A DOG.N))
			(!R8 (?X_A HOUSE.N))
			(!R9 (?X_A (PERTAIN-TO ?X_C)))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) GO.45.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.45.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) GO.45.V) ?L2))
			(?X_D (?X_C ((ADV-A (INSIDE.P ?X_B)) GO.45.V)))
			(?X_D (?X_C GO.45.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? GO.45.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.46.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B YARD.N))
			(!R6 (?X_A DOG.N))
			(!R7 (?X_A (PERTAIN-TO ?X_C)))
			(!R8 (?X_A HOUSE.N))
			(!R9 (?L2 OUTSIDE.N))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) GO.46.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.46.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) GO.46.V) ?L2))
			(?X_D (?X_C GO.46.V))
			(?X_D (?X_C GO.46.V ?L2))
			(?X_D (?X_C ((ADV-A (IN.P ?X_B)) GO.46.V)))
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
	(EPI-SCHEMA ((?X_R (COMPOSITE-SCHEMA-213.PR ?X_M ?X_Q ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_Q HOUSE.N))
			(!R2 (?X_Q DOG.N))
			(!R3 (?X_M THING.N))
			(!R4 (?X_M NEW.A))
			(!R5 (?X_P YARD.N))
			(!R6 (?X_Q (PERTAIN-TO ?X_R)))
			(!R7 (?L2 OUTSIDE.N))
			(!R8 (?X_R DOG.N))
			(!R9 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_D (?X_Q (LIKE.V ?X_Q)))
			(?X_O (?X_R ((ADV-A (FROM.P ?L1)) GO.46.V) ?L2))
			(?X_L (?X_A (((ADV-A (IN.P ?X_P)) BE.V) ?X_M)))
			(?X_J (?X_R (SNIFF.V ?X_M)))
			(?X_F (?X_R SLEEP.V))
			(?X_H (?X_R ((ADV-A (FROM.P ?L1)) GO.45.V) ?L2))
			(?X_B (?X_Q (LIKE.V ?X_Q)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
			(!W2 (?X_O (BEFORE ?X_L)))
			(!W3 (?X_O (BEFORE ?X_J)))
			(!W4 (?X_O (BEFORE ?X_F)))
			(!W5 (?X_O (BEFORE ?X_H)))
			(!W6 (?X_O (BEFORE ?X_B)))
			(!W7 (?X_L (BEFORE ?X_J)))
			(!W8 (?X_L (BEFORE ?X_F)))
			(!W9 (?X_L (BEFORE ?X_H)))
			(!W10 (?X_L (BEFORE ?X_B)))
			(!W11 (?X_J (BEFORE ?X_F)))
			(!W12 (?X_J (BEFORE ?X_H)))
			(!W13 (?X_J (BEFORE ?X_B)))
			(!W14 (?X_F (BEFORE ?X_B)))
			(!W15 (?X_H (BEFORE ?X_B)))
		)
	)
	(
			"A house dog of a dog likes a house dog of a dog."
			"A dog go.99s a outside destination from L1."
			"X_A is a thing new in a yard."
			"A dog sniffs a thing new."
			"A dog sleeps."
			"A dog go.98s a outside destination from L1."
			"A house dog of a dog likes a house dog of a dog."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              ((NEVER.ADV GET.37.V)
	               (K (L X (AND (X ALONG.P) (X (WITH.P ?X_C)))))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT ((K (L X (AND (X ALONG.P) (X (WITH.P ?X_C))))) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (K (L X (AND (X ALONG.P) (X (WITH.P ?X_C))))))))
		)
		(:GOALS
			(?G1
	   (?X_A
	    (WANT.V
	     (THAT (?X_A (HAVE.V (K (L X (AND (X ALONG.P) (X (WITH.P ?X_C)))))))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_A HAVE.V (K (L X (AND (X ALONG.P) (X (WITH.P ?X_C))))))))
			(?I2 (?X_A (AT.P ?L)))
			(?I3 ((K (L X (AND (X ALONG.P) (X (WITH.P ?X_C))))) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_A HAVE.V (K (L X (AND (X ALONG.P) (X (WITH.P ?X_C)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((INSTEAD.ADV GET.38.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B CAT.N))
			(!R6 (?X_B NEW.A))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
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
	              (COMPOSITE-SCHEMA-214.PR (KA ((ADV-A (FOR.P ?X_C)) LOOK.V)) ?X_H
	               (K (L X (AND (X ALONG.P) (X (WITH.P ?X_B))))) ?X_N))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H SEARCH.N))
			(!R2 (?X_M AGENT.N))
			(!R3 (?X_N CAT.N))
			(!R4 (?X_N NEW.A))
			(!R5 (NOT (?X_M = ?X_N)))
		)
		(:STEPS
			(?X_L
	   (?X_M ((NEVER.ADV GET.37.V) (K (L X (AND (X ALONG.P) (X (WITH.P ?X_B))))))))
			(?X_J (?X_M (TRY.V (KA ((ADV-A (FOR.P ?X_C)) LOOK.V)))))
			(?X_G (?X_M ((QUICKLY.ADV (UP.PRT GIVE.V)) ?X_H)))
			(?X_E (?X_M ((INSTEAD.ADV GET.38.V) ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_J)))
			(!W2 (?X_L (BEFORE ?X_G)))
			(!W3 (?X_L (BEFORE ?X_E)))
			(!W4 (?X_J (BEFORE ?X_G)))
			(!W5 (?X_J (BEFORE ?X_E)))
			(!W6 (?X_G (BEFORE ?X_E)))
		)
	)
	(
			"A agent get.148s along with never."
			"A agent tries for X_C looking."
			"A agent gives a search quickly up."
			"A agent get.146s a cat new instead."
	)
)



(
	(EPI-SCHEMA (((ADV-E (DURING (K YESTERDAY.N))) (?X_A (GET.39.V ?X_B))) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B GREAT.A))
			(!R6 (?X_B KINDLE.A))
			(!R7 (?X_B IMPRESSIVE.A))
			(!R8 (?X_B BOOK.N))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-215.PR ?X_E ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_E LOT.N))
			(!R2 (?X_H AGENT.N))
			(!R3 (?X_I GREAT.A))
			(!R4 (?X_I KINDLE.A))
			(!R5 (?X_I IMPRESSIVE.A))
			(!R6 (?X_I BOOK.N))
			(!R7 (NOT (?X_I AGENT.N)))
			(!R8 (NOT (?X_H = ?X_I)))
		)
		(:STEPS
			(?X_G ((ADV-E (DURING (K YESTERDAY.N))) (?X_H (GET.39.V ?X_I))))
			(?X_D (?X_H (LIKE.V ?X_I ?X_E)))
			(?X_B (?X_H (((ADV-A (IN.P (TWO.D (PLUR DAY.N)))) READ.V) ?X_I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_D)))
			(!W2 (?X_G (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent get.164s a great kindle impressive book DURING yesterday."
			"A agent likes a great kindle impressive book a lot."
			"A agent reads a great kindle impressive book in two days."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.40.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C INTERVIEW.N))
			(!R6 (?X_A JOB.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_E)))
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
	              (COMPOSITE-SCHEMA-216.PR ?X_L (K SAD.A)
	               (K (L X (AND (X AT.P) (X FIRST.A)))) ?X_N))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G NEW.A))
			(!R2 (?X_G JOB.N))
			(!R3 (?X_L JOB.N))
			(!R4 (?X_L (PERTAIN-TO ?X_M)))
			(!R5 (?X_N INTERVIEW.N))
			(!R6 (?X_M AGENT.N))
			(!R7 (NOT (?X_N AGENT.N)))
			(!R8 (NOT (?X_M = ?X_N)))
		)
		(:STEPS
			(?X_K (?X_M (LOSE.V ?X_L)))
			(?X_B (?X_M (LOSE.V ?X_L)))
			(?X_I (?X_M (BE.V (K SAD.A) (K (L X (AND (X AT.P) (X FIRST.A)))))))
			(?X_F (?X_M ((ADV-A (FOR.P ?X_G)) LOOK.V)))
			(?X_D (?X_M GET.40.V ?X_N))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_B)))
			(!W2 (?X_K (BEFORE ?X_I)))
			(!W3 (?X_K (BEFORE ?X_F)))
			(!W4 (?X_K (BEFORE ?X_D)))
			(!W5 (?X_B (BEFORE ?X_I)))
			(!W6 (?X_B (BEFORE ?X_F)))
			(!W7 (?X_B (BEFORE ?X_D)))
			(!W8 (?X_I (BEFORE ?X_F)))
			(!W9 (?X_I (BEFORE ?X_D)))
			(!W10 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A agent loses a job of a agent."
			"A agent loses a job of a agent."
			"A agent is sad at first."
			"A agent looks for a new job."
			"A agent get.172s a interview."
	)
)



(
	(EPI-SCHEMA ((?X_F COMPOSITE-SCHEMA-217.PR) ** ?E)
		(:ROLES
			(!R1 (?X_C BALL.N))
			(!R2 (?X_F APPLE.N))
			(!R3 (?X_G TREE.N))
		)
		(:STEPS
			(?X_E (?X_F ((ADV-A (LIKE.P ?X_C)) ROLL.V)))
			(?X_I (?X_F ((ADV-A (ON.P ?X_G)) GROW.V)))
			(?X_K
	   ((K (L X (AND (X MANY.A) (X (PLUR SPHERE.N)))))
	    ((ADV-A (ON.P (K (PLUR TREE.N)))) GROW.V)))
			(?X_M ((K (PLUR PEA.N)) ((ADV-A (ON.P (K (PLUR VINE.N)))) GROW.V)))
			(?X_O (?X_B ((ADV-A (ON.P (K (PLUR VINE.N)))) GROW.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_I)))
			(!W2 (?X_E (BEFORE ?X_K)))
			(!W3 (?X_E (BEFORE ?X_M)))
			(!W4 (?X_E (BEFORE ?X_O)))
			(!W5 (?X_I (BEFORE ?X_K)))
			(!W6 (?X_I (BEFORE ?X_M)))
			(!W7 (?X_I (BEFORE ?X_O)))
			(!W8 (?X_K (BEFORE ?X_M)))
			(!W9 (?X_K (BEFORE ?X_O)))
			(!W10 (?X_M (BEFORE ?X_O)))
		)
	)
	(
			"A apple rolls like a ball."
			"A apple grows on a tree."
			"Many sphere grows on trees."
			"Peas grow on vines."
			"X_B grows on vines."
	)
)



(
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.31.V ?X_B ?A) ** ?X_E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B MOTHER.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_A HAPPY.A))
			(!R5 (?X_B (PERTAIN-TO ?X_A)))
			(!R6 (?X_A (SO.ADV HAPPY.A)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V ?X_B ?A)))
			(?G2 (?X_A (WANT.V (THAT (?X_A (DO.V ?A))))))
		)
		(:STEPS
			(?X_C (?X_A (ASK.V ?X_B ?A)))
			(?E2 (?X_B (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_E (?X_A (ASK.V ?X_B ?A)))
			(?X_E (?X_A (TELL.V ?X_B ?A)))
			(?X_E (?X_A (MAKE.V ?X_B ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?X_C))
			(!W2 (?X_C CAUSE-OF ?E2))
			(!W3 (?X_E (SAME-TIME ?X_D)))
			(!W4 (?X_E (RIGHT-AFTER ?X_F)))
			(!W5 (?X_C (BEFORE ?X_D)))
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.24.V ?X_B ?A) ** ?X_E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B MOTHER.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_A (SO.ADV HAPPY.A)))
			(!R5 (?X_B (PERTAIN-TO ?X_A)))
			(!R6 (?X_A HAPPY.A))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V ?X_B ?A)))
			(?G2 (?X_A (WANT.V (THAT (?X_A (DO.V ?A))))))
		)
		(:STEPS
			(?X_C (?X_A (ASK.V ?X_B ?A)))
			(?E2 (?X_B (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_E (?X_A (ASK.V ?X_B ?A)))
			(?X_E (?X_A (TELL.V ?X_B ?A)))
			(?X_E (?X_A (MAKE.V ?X_B ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?X_C))
			(!W2 (?X_C CAUSE-OF ?E2))
			(!W3 (?X_E (BEFORE ?X_F)))
			(!W4 (?X_C (SAME-TIME ?X_F)))
			(!W5 (?X_C (RIGHT-AFTER ?X_D)))
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
	(EPI-SCHEMA ((?X_A INFORM.15.V ?X_B ?I) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B MOTHER.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_A (SO.ADV HAPPY.A)))
			(!R6 (?X_A HAPPY.A))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_C (?X_A TELL.V ?X_B ?I))
			(?X_C (?X_A LET.V ?X_B (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (SAME-TIME ?X_F)))
			(!W2 (?X_C (RIGHT-AFTER ?X_D)))
			(!W3 (?X_E (BEFORE ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B INFORM.16.V ?X_C ?I) ** ?X_D)
		(:ROLES
			(!R1 (?X_B MOTHER.N))
			(!R2 (?X_C AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_A HAPPY.A))
			(!R6 (?X_A (SO.ADV HAPPY.A)))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_D (?X_B TELL.V ?X_C ?I))
			(?X_D (?X_B LET.V ?X_C (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_E)))
			(!W2 (?X_F (SAME-TIME ?X_E)))
			(!W3 (?X_F (RIGHT-AFTER ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B GET.41.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_B HAPPY.A))
			(!R6 (?X_B (SO.ADV HAPPY.A)))
			(!R7 (?X_C GREAT.A))
			(!R8 (?X_C FAMILY.N))
			(!R9 (?X_C DOG.N))
			(!R10 (?X_A (PERTAIN-TO ?X_B)))
			(!R11 (?X_A MOTHER.N))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_F)))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-218.PR ?A ?X_M ?X_N ?I ?X_P)) ** ?E)
		(:ROLES
			(!R1 (?A ACTION.N))
			(!R2 (?X_M (PERTAIN-TO ?X_O)))
			(!R3 (?X_M MOTHER.N))
			(!R4 (?X_N AGENT.N))
			(!R5 (NOT (?I ACTION.N)))
			(!R6 (?I INFORMATION.N))
			(!R7 (?X_P GREAT.A))
			(!R8 (?X_P FAMILY.N))
			(!R9 (?X_P DOG.N))
			(!R10 (?X_O AGENT.N))
			(!R11 (NOT (?X_O = ?X_P)))
		)
		(:STEPS
			(?X_J (?X_O (WANT.V ?X_P)))
			(?X_H (?X_O REQUEST_ACTION.24.V ?X_M ?A))
			(?X_A (?X_O REQUEST_ACTION.31.V ?X_M ?A))
			(?X_A (?X_O INFORM.15.V ?X_M ?I))
			(?X_F (?X_M INFORM.16.V ?X_N ?I))
			(?X_B (?X_M (SAY.V ?X_N)))
			(?X_D (?X_O GET.41.V ?X_P))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_A)))
			(!W2 (?X_J (BEFORE ?X_B)))
			(!W3 (?X_J (BEFORE ?X_D)))
			(!W4 (?X_H (BEFORE ?X_A)))
			(!W5 (?X_H (BEFORE ?X_B)))
			(!W6 (?X_H (BEFORE ?X_D)))
			(!W7 (?X_A (BEFORE ?X_B)))
			(!W8 (?X_A (BEFORE ?X_D)))
			(!W9 (?X_F (BEFORE ?X_B)))
			(!W10 (?X_F (BEFORE ?X_D)))
			(!W11 (?X_B (BEFORE ?X_D)))
		)
	)
	(
			"A agent wants a great family dog."
			"A agent request action.192s a mother of a agent a action."
			"A agent request action.191s a mother of a agent a action."
			"A agent inform.203s a mother of a agent a information."
			"A mother of a agent inform.201s a agent a information."
			"A mother of a agent says a agent."
			"A agent get.196s a great family dog."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-219.PR) ** ?E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B HOUSE.N))
			(!R3 (?X_E GARBAGE.N))
			(!R4 (?X_E (VERY.ADV BAD.A)))
		)
		(:STEPS
			(?X_D (?X_A ((ADV-A (IN.P ?X_B)) SIT.V)))
			(?X_G (?X_E ((ADV-A (FOR.P (KA SMELL.N))) START.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_G)))
		)
	)
	(
			"A agent sits in a house."
			"A garbage very bad starts for smell."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) ROLL.2.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B (VERY.ADV FAST.A)))
			(!R6 (?X_B (HAS.V (KE ((K (PLUR BELL.N)) (ON.P ?X_B))))))
			(!R7 (?X_B HOOP.N))
			(!R8 (?X_B (PERTAIN-TO ?X_A)))
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
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ROLL.2.V)))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) ROLL.2.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ROLL.2.V) ?X_B))
			(?X_C (?X_A ROLL.2.V))
			(?X_C (?X_A ((CAN.AUX ROLL.2.V) ?X_B)))
			(?X_C (?X_A (LOCATION_ADV.? ROLL.2.V)))
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
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-220.PR ?X_C)) ** ?E)
		(:ROLES
			(!R1 (?X_C DESTINATION.N))
			(!R2 (?X_C (VERY.ADV FAST.A)))
			(!R3 (?X_C (HAS.V (KE ((K (PLUR BELL.N)) (ON.P ?X_C))))))
			(!R4 (?X_C HOOP.N))
			(!R5 (?X_C (PERTAIN-TO ?X_D)))
			(!R6 (?X_D AGENT.N))
		)
		(:STEPS
			(?X_B (?X_D ((ADV-A (FROM.P ?L1)) ROLL.2.V) ?X_C))
		)
	)
	(
			"A agent roll.224s a destination very fast has bells on a destination very fast has bells on X_C hoop of X_D hoop of a agent from L1."
	)
)



(
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-221.PR ?X_C ?X_L (K (UP.ADV (TO.P ?X_L))) ?X_M ?X_N
	               (KA (AWAY.ADV STAY.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C LITTLE.A))
			(!R2 (?X_C GIRL.N))
			(!R3 (?X_L HOUSE.N))
			(!R4 (?X_H MAN.N))
			(!R5 (?X_M CANDY.N))
			(!R6 (?X_K AGENT.N))
			(!R7 (?X_L (PERTAIN-TO ?X_N)))
			(!R8 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_E (?X_N (BE.V ?X_C)))
			(?X_G (?X_H ((UP.ADV TO.P) ?X_L)))
			(?X_A (?X_H (PULL.V (K (UP.ADV (TO.P ?X_L))))))
			(?X_B (?X_H (OFFER.V ?X_M)))
			(?X_J (?X_H (OFFER.V ?X_M)))
			(?X_P (?X_K (TELL.V ?X_N (KA (AWAY.ADV STAY.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_G)))
			(!W2 (?X_E (BEFORE ?X_A)))
			(!W3 (?X_E (BEFORE ?X_B)))
			(!W4 (?X_E (BEFORE ?X_J)))
			(!W5 (?X_E (BEFORE ?X_P)))
			(!W6 (?X_G (BEFORE ?X_A)))
			(!W7 (?X_G (BEFORE ?X_B)))
			(!W8 (?X_G (BEFORE ?X_J)))
			(!W9 (?X_G (BEFORE ?X_P)))
			(!W10 (?X_A (BEFORE ?X_B)))
			(!W11 (?X_A (BEFORE ?X_J)))
			(!W12 (?X_A (BEFORE ?X_P)))
			(!W13 (?X_B (BEFORE ?X_J)))
			(!W14 (?X_B (BEFORE ?X_P)))
			(!W15 (?X_J (BEFORE ?X_P)))
		)
	)
	(
			"X_N is a little girl."
			"A man is up to."
			"A man pulls up to a house of X_N."
			"A man offers a candy of X_N."
			"A man offers a candy of X_N."
			"A agent tells X_N away stay."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) RUN.23.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.23.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.23.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.23.V) ?L2))
			(?X_B (?X_A (QUICKLY.ADV (AWAY.PRT RUN.23.V))))
			(?X_B (?X_A RUN.23.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? RUN.23.V)))
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
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-222.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_E FENCE.N))
			(!R2 (?X_F (PERTAIN-TO ?X_G)))
			(!R3 (?X_H AGENT.N))
			(!R4 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_D (?X_G ((ADV-A (BEHIND.P ?X_E)) BE.V)))
			(?X_B (?X_H ((ADV-A (FROM.P ?L1)) RUN.23.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"X_G is behind a fence."
			"A agent run.277s a destination from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.28.V ?O) ** ?X_B)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?O ENTITY.N))
			(!R3 (?O SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 ((ANOTHER.D TRIAL.N) DESTINATION.N))
			(!R6 (?X_A INNOCENT.A))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?O ((ADV-A (AT.P (ANOTHER.D TRIAL.N))) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?O ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?O ((ADV-A (AT.P (ANOTHER.D TRIAL.N))) BE.V)))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A
	    (((ADV-A (TO.P (ANOTHER.D TRIAL.N)))
	      ((ADV-A (FOR.P (ANOTHER.D TRIAL.N))) TAKE.V))
	     ?O)))
			(?X_B (?X_A ((ADV-A (TO.P (ANOTHER.D TRIAL.N))) CARRY.V) ?O))
			(?X_B (?X_A ((ADV-A (TO.P (ANOTHER.D TRIAL.N))) BRING.V) ?O))
			(?X_B (?X_A (LOCATION_ADV.? TAKE.V) ?O))
			(?X_B (?X_A (LOCATION_ADV.? CARRY.V) ?O))
			(?X_B (?X_A (LOCATION_ADV.? BRING.V) ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_B))
			(!W2 (?P1 POSTCOND-OF ?X_B))
			(!W3 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.32.V ?X_A ?A) ** ?X_B)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?A ACTION.N))
			(!R3 (?X_A INNOCENT.A))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V ?X_A ?A)))
			(?G2 (?X_A (WANT.V (THAT (?X_A (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_A (((ADV-A (FOR.P (ANOTHER.D TRIAL.N))) ASK.V) ?X_A ?A)))
			(?E2 (?X_A (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_B (?X_A (((ADV-A (FOR.P (ANOTHER.D TRIAL.N))) ASK.V) ?X_A ?A)))
			(?X_B (?X_A (TELL.V ?X_A ?A)))
			(?X_B (?X_A (MAKE.V ?X_A ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
			(!W3 (?X_B (AT-ABOUT ?X_C)))
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
	(EPI-SCHEMA ((?X_J
	              (COMPOSITE-SCHEMA-223.PR (FIVE.D (PLUR YEAR.N)) (KA INNOCENT.A) ?O
	               ?X_J ?A))
	             ** ?E)
		(:ROLES
			(!R1 ((ANOTHER.D TRIAL.N) DESTINATION.N))
			(!R2 (?O ENTITY.N))
			(!R3 (?O SMALLER-THAN.N ?X_J))
			(!R4 (?X_J MAN.N))
			(!R5 (?X_J INNOCENT.A))
			(!R6 (?A ACTION.N))
		)
		(:STEPS
			(?X_I (?X_J ((ADV-A (TO.P (K PRISON.N))) GO.V)))
			(?X_G (?X_J TRANSPORT_OBJECT.28.V ?O))
			(?X_G (?X_J REQUEST_ACTION.32.V ?X_J ?A))
			(?X_E
	   (?X_A
	    (((ADV-A (FOR.P (KA (GET.V (K ONE.N))))) TAKE.V) (FIVE.D (PLUR YEAR.N)))))
			(?X_C (?X_J ((PASV FIND.V) (KA INNOCENT.A))))
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
	)
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-224.PR ?X_A)) ** ?E)
		(:ROLES
			(!R1 (?X_A STRAY.A))
			(!R2 (?X_A CAT.N))
			(!R3 (?X_A (AT.P ?X_B)))
		)
		(:STEPS
			(?X_D (?X_B (NOTICE.V ?X_A)))
		)
	)
	(
			"X_B notices a stray cat at X_B."
	)
)



(
	(EPI-SCHEMA ((?X_A INFORM.17.V (KE (?X_B OUTSIDE.A)) ?I) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KE (?X_B OUTSIDE.A)) AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_A NEXT.A))
			(!R6 (?X_A FAMILY.N))
			(!R7 (?X_B DOG.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT ((KE (?X_B OUTSIDE.A)) (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 ((KE (?X_B OUTSIDE.A)) (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_C (?X_A TELL.V (KE (?X_B OUTSIDE.A)) ?I))
			(?X_C (?X_A LET.V (KE (?X_B OUTSIDE.A)) (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-225.PR (ALL.D DAY.N)
	               (K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N))))))
	               (KE (?X_L OUTSIDE.A)) ?I))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F FAMILY.N))
			(!R2 (?X_K CAGE.N))
			(!R3 ((KE (?X_L OUTSIDE.A)) AGENT.N))
			(!R4 (?X_L DOG.N))
			(!R5 (?X_M AGENT.N))
			(!R6 (?X_M NEXT.A))
			(!R7 (?X_M FAMILY.N))
			(!R8 (NOT (?I ACTION.N)))
			(!R9 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_J (?X_L ((ADV-A (IN.P ?X_K)) BE.V)))
			(?X_H (?X_L (HOWL.V (ALL.D DAY.N))))
			(?X_E (?X_F (GET.V (K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N)))))))))
			(?X_C (?X_M INFORM.17.V (KE (?X_L OUTSIDE.A)) ?I))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_E)))
			(!W3 (?X_H (BEFORE ?X_E)))
		)
	)
	(
			"A dog is in a cage."
			"A dog howls all day."
			"A family gets rid of."
			"A agent next family inform.309s a dog outside a information."
	)
)



(
	(EPI-SCHEMA ((?X_A (((ADV-A (FROM.P (K HOME.N))) TAKE.21.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B (PLUR BOOK.N)))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-226.PR (K SCHOOL.N) ?X_P)) ** ?E)
		(:ROLES
			(!R1 (?X_D DAY.N))
			(!R2 (?X_D (MOST.ADV RELAXING.A)))
			(!R3 (?X_G BEAN.N))
			(!R4 (?X_G BAG.N))
			(!R5 ((ADV-E (DURING ?X_L)) (?X_M IN.P)))
			(!R6 (?X_M READ.N))
			(!R7 (?X_N AGENT.N))
			(!R8 (?X_P (PLUR BOOK.N)))
			(!R9 (?X_O AGENT.N))
			(!R10 (NOT (?X_P AGENT.N)))
			(!R11 (NOT (?X_O = ?X_P)))
		)
		(:STEPS
			(?X_K (?X_N ?X_M (HAVE.V (K SCHOOL.N))))
			(?X_I (?X_O (((ADV-A (FROM.P (K HOME.N))) TAKE.21.V) ?X_P)))
			(?X_F (?X_O ((ADV-A (IN.P ?X_G)) SIT.V)))
			(?X_C ((ADV-E (DURING ?X_D)) (?X_A (EVER.ADV BE.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_F)))
			(!W3 (?X_K (BEFORE ?X_C)))
			(!W4 (?X_I (BEFORE ?X_F)))
			(!W5 (?X_I (BEFORE ?X_C)))
			(!W6 (?X_F (BEFORE ?X_C)))
		)
	)
	(
			"A agent has school."
			"A agent take.317s a books from home."
			"A agent sits in a bean bag."
			"X_A is DURING a day most relaxing ever."
	)
)



(
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-227.PR ?X_M ?X_B)) ** ?E)
		(:ROLES
			(!R1 (?X_M WAY.N))
			(!R2 (?X_M (TO.P (K BED.N))))
			(!R3 (?X_H NIGHT.N))
			(!R4 (?X_H LATE.A))
			(!R5 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_G (?X_N (ON.P ?X_M)))
			(?X_C (?X_N ((ADV-A (ON.P ?X_M)) BE.V)))
			(?X_J ((ADV-E (DURING ?X_H)) (?X_N HAVE.V)))
			(?X_L (?X_N ((ADV-A (FOR.P (EIGHT.D (PLUR HOUR.N)))) SLEEP.V)))
			(?X_D (?X_N (UP.PRT WAKE.V)))
			(?X_E (?X_N (UP.PRT WAKE.V)))
			(?X_P (?X_A (BE.V ?X_B)))
			(?X_R (?X_A (BE.V ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_C)))
			(!W2 (?X_G (BEFORE ?X_J)))
			(!W3 (?X_G (BEFORE ?X_L)))
			(!W4 (?X_G (BEFORE ?X_D)))
			(!W5 (?X_G (BEFORE ?X_E)))
			(!W6 (?X_G (BEFORE ?X_P)))
			(!W7 (?X_G (BEFORE ?X_R)))
			(!W8 (?X_C (BEFORE ?X_J)))
			(!W9 (?X_C (BEFORE ?X_L)))
			(!W10 (?X_C (BEFORE ?X_D)))
			(!W11 (?X_C (BEFORE ?X_E)))
			(!W12 (?X_C (BEFORE ?X_P)))
			(!W13 (?X_C (BEFORE ?X_R)))
			(!W14 (?X_J (BEFORE ?X_L)))
			(!W15 (?X_J (BEFORE ?X_D)))
			(!W16 (?X_J (BEFORE ?X_E)))
			(!W17 (?X_J (BEFORE ?X_P)))
			(!W18 (?X_J (BEFORE ?X_R)))
			(!W19 (?X_L (BEFORE ?X_D)))
			(!W20 (?X_L (BEFORE ?X_E)))
			(!W21 (?X_L (BEFORE ?X_P)))
			(!W22 (?X_L (BEFORE ?X_R)))
			(!W23 (?X_D (BEFORE ?X_E)))
			(!W24 (?X_D (BEFORE ?X_P)))
			(!W25 (?X_D (BEFORE ?X_R)))
			(!W26 (?X_E (BEFORE ?X_P)))
			(!W27 (?X_E (BEFORE ?X_R)))
			(!W28 (?X_P (BEFORE ?X_R)))
		)
	)
	(
			"X_N is on."
			"X_N is on a way to bed of X_N."
			"X_N has DURING a night late."
			"X_N sleeps for eight hours."
			"X_N wakes up."
			"X_N wakes up."
			"X_A is X_B."
			"X_A is X_B."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.47.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C (VERY.ADV NERVOUS.A)))
			(!R6 (?X_C NEXT.A))
			(!R7 (?X_B CLASSROOM.N))
			(!R8 (?X_A (PERTAIN-TO ?X_C)))
			(!R9 (?X_A FRIEND.N))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) GO.47.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.47.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) GO.47.V) ?L2))
			(?X_D (?X_C ((ADV-A (INTO.P ?X_B)) GO.47.V)))
			(?X_D (?X_C GO.47.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? GO.47.V)))
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
	(EPI-SCHEMA ((?X_J
	              (COMPOSITE-SCHEMA-228.PR ?X_I
	               (K (L X (AND (X NEXT.A) (X (TO.P ?X_I))))) ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I FRIEND.N))
			(!R2 (?X_H CLASSROOM.N))
			(!R3 (?X_I (PERTAIN-TO ?X_J)))
			(!R4 (?X_J AGENT.N))
			(!R5 (?X_J (VERY.ADV NERVOUS.A)))
			(!R6 (?X_J NEXT.A))
			(!R7 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_E (?X_J (SEE.V ?X_I)))
			(E465.SK (?X_J (TO.P ?X_I)))
			(?X_G (?X_J ((ADV-A (FROM.P ?L1)) GO.47.V) ?L2))
			(?X_B (?X_J (SEE.V ?X_I)))
			(?X_C (?X_J (SIT.V (K (L X (AND (X NEXT.A) (X (TO.P ?X_I))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_B)))
			(!W2 (?X_E (BEFORE ?X_C)))
			(!W3 (?X_G (BEFORE ?X_B)))
			(!W4 (?X_G (BEFORE ?X_C)))
			(!W5 (?X_B (BEFORE ?X_C)))
		)
	)
	(
			"A agent very nervous next sees a friend of a agent very nervous next."
			"A agent very nervous next is to."
			"A agent very nervous next go.336s a destination from L1."
			"A agent very nervous next sees a friend of a agent very nervous next."
			"A agent very nervous next sits next to."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) BECOME.3.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A WOMAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B NEW.A))
			(!R6 (?X_B FRIEND.N))
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
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) BECOME.3.V)))
			(?X_C
	   (?X_A
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) BECOME.3.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) BECOME.3.V) ?X_B))
			(?X_C (?X_A BECOME.3.V))
			(?X_C (?X_A BECOME.3.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? BECOME.3.V)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.48.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C CAFETERIA.N))
			(!R6 (?X_A LUNCH.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
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
	   (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) GO.48.V))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.48.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.48.V) ?X_C))
			(?X_D (?X_B GO.48.V))
			(?X_D (?X_B GO.48.V ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? GO.48.V)))
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
	(EPI-SCHEMA ((?X_A GET.42.V ?X_B) ** ?X_D)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B LUNCH.N))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (RIGHT-AFTER ?X_C)))
			(!W6 (?X_D (SAME-TIME ?X_F)))
			(!W7 (?X_E (BEFORE ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A GET.43.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B LUNCH.N))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (BEFORE ?X_D)))
			(!W6 (?X_E (SAME-TIME ?X_D)))
			(!W7 (?X_E (RIGHT-AFTER ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-229.PR ?X_N ?X_J ?X_L)) ** ?E)
		(:ROLES
			(!R1 (?X_J DESTINATION.N))
			(!R2 (?X_J CAFETERIA.N))
			(!R3 (?X_L LUNCH.N))
			(!R4 (?X_L (PERTAIN-TO ?X_K)))
			(!R5 (?X_K MAN.N))
			(!R6 (NOT (?X_L AGENT.N)))
			(!R7 (NOT (?X_K = ?X_L)))
			(!R8 (?X_M WOMAN.N))
			(!R9 (?X_N DESTINATION.N))
			(!R10 (?X_N NEW.A))
			(!R11 (?X_N FRIEND.N))
		)
		(:STEPS
			(?X_I (?X_K ((ADV-A (FROM.P ?L1)) GO.48.V) ?X_J))
			(?X_G (?X_K GET.43.V ?X_L))
			(?X_A (?X_K GET.42.V ?X_L))
			(?X_E (?X_K (DOWN.ADV ((ADV-A (BY.P ?X_K)) SIT.V))))
			(?X_C (?X_M ((ADV-A (FROM.P ?L1)) BECOME.3.V) ?X_N))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_A)))
			(!W2 (?X_I (BEFORE ?X_E)))
			(!W3 (?X_I (BEFORE ?X_C)))
			(!W4 (?X_G (BEFORE ?X_A)))
			(!W5 (?X_G (BEFORE ?X_E)))
			(!W6 (?X_G (BEFORE ?X_C)))
			(!W7 (?X_A (BEFORE ?X_E)))
			(!W8 (?X_A (BEFORE ?X_C)))
			(!W9 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A man go.360s a destination cafeteria from L1."
			"A man get.368s a lunch of a man."
			"A man get.367s a lunch of a man."
			"A man sits down by a man."
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?L1)) RUN.24.V) ?L2) ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_D BLACK.A))
			(!R6 (?X_D (IS.V ?X_B)))
			(!R7 (?X_B (K BLACK.A) DOG.N))
			(!R8 (?X_A DOG.N))
			(!R9 (?X_A LARGE.A))
			(!R10 (?X_A BLACK.A))
			(!R11 (?X_D (IS.V ?X_A)))
			(!R12 (?X_B (PERTAIN-TO ?X_C)))
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.24.V)))
			(?X_E
	   (?X_D ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.24.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.24.V) ?L2))
			(?X_E (?X_D RUN.24.V))
			(?X_E (?X_D RUN.24.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? RUN.24.V)))
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
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-230.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_A DOG.N))
			(!R2 (?X_A LARGE.A))
			(!R3 (?X_A BLACK.A))
			(!R4 (?X_D (IS.V ?X_A)))
			(!R5 (?X_B (K BLACK.A) DOG.N))
			(!R6 (?X_D (IS.V ?X_B)))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
			(!R8 (?X_D BLACK.A))
			(!R9 (?X_D DOG.N))
			(!R10 (?L2 DESTINATION.N))
		)
		(:STEPS
			(E3.SK (?X_D ((ADV-A (FROM.P ?L1)) RUN.24.V) ?L2))
		)
	)
	(
			"A black dog is a dog large black is a of X_C run.1s a destination from L1."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) LEAVE.2.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A FRIEND.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) LEAVE.2.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) LEAVE.2.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) LEAVE.2.V) ?L2))
			(?X_C (?X_B (EARLY.ADV LEAVE.2.V)))
			(?X_C (?X_B LEAVE.2.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? LEAVE.2.V)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.49.V) (K (TO.P (?X_B PLACE.N)))) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (TO.P (?X_B PLACE.N))) DESTINATION.N))
			(!R4 (NOT (?L1 = (K (TO.P (?X_B PLACE.N))))))
			(!R5 (?X_B (PERTAIN-TO ?X_A)))
			(!R6 (?X_B FRIEND.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P (K (TO.P (?X_B PLACE.N))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (K (TO.P (?X_B PLACE.N)))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (K (TO.P (?X_B PLACE.N))))))
		)
		(:PARAPHRASES
			(?X_D (?X_A ((ADV-A (DESTINATION_PREP.? (K (TO.P (?X_B PLACE.N))))) GO.49.V)))
			(?X_D
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K (TO.P (?X_B PLACE.N))))) GO.49.V))))
			(?X_D
	   (?X_A ((ADV-A (DESTINATION_PREP.? (K (TO.P (?X_B PLACE.N))))) GO.49.V)
	    (K (TO.P (?X_B PLACE.N)))))
			(?X_D (?X_A GO.49.V))
			(?X_D (?X_A GO.49.V (K (TO.P (?X_B PLACE.N)))))
			(?X_D (?X_A (LOCATION_ADV.? GO.49.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
			(!W6 (?X_D (RIGHT-AFTER ?X_C)))
			(!W7 (?X_D (SAME-TIME ?X_F)))
			(!W8 (?X_E (BEFORE ?X_F)))
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
	              (COMPOSITE-SCHEMA-231.PR (KE (?X_J PLACE.N))
	               (KE (?X_K FEEL.V POOR.A)) ?L2 (K (TO.P (?X_J PLACE.N)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I HOUSE.N))
			(!R2 (?X_I HUGE.A))
			(!R3 (?X_J (PERTAIN-TO ?X_K)))
			(!R4 (?X_J FRIEND.N))
			(!R5 ((K (TO.P (?X_J PLACE.N))) DESTINATION.N))
			(!R6 (?L2 DESTINATION.N))
			(!R7 (?X_K AGENT.N))
		)
		(:STEPS
			(?X_A (?X_K (TO.P (KE (?X_J PLACE.N)))))
			(?X_B (?X_K ((ADV-A (FROM.P ?L1)) GO.49.V) (K (TO.P (?X_J PLACE.N)))))
			(?X_H (?X_I (MAKE.V (KE (?X_K FEEL.V POOR.A)))))
			(?X_F (?X_K ((ADV-A (FROM.P ?L1)) LEAVE.2.V) ?L2))
			(?X_D (?X_K ((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_J)) TALK.V)))) STOP.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_B)))
			(!W2 (?X_A (BEFORE ?X_H)))
			(!W3 (?X_A (BEFORE ?X_F)))
			(!W4 (?X_A (BEFORE ?X_D)))
			(!W5 (?X_B (BEFORE ?X_H)))
			(!W6 (?X_B (BEFORE ?X_F)))
			(!W7 (?X_B (BEFORE ?X_D)))
			(!W8 (?X_H (BEFORE ?X_F)))
			(!W9 (?X_H (BEFORE ?X_D)))
			(!W10 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A agent is to."
			"A agent go.27s to a friend of a agent place from L1."
			"A house huge makes a agent feels poor."
			"A agent leave.26s a destination from L1."
			"A agent stops for to a friend of a agent talking."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) FALL.6.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B (VERY.ADV TIRED.A)))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A BED.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.6.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.6.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.6.V) ?L2))
			(?X_C (?X_B ((ADV (ASLEEP.ADV QUICKLY.A)) FALL.6.V)))
			(?X_C (?X_B FALL.6.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? FALL.6.V)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.50.V) (KA WORK.V)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA WORK.V) DESTINATION.N))
			(!R4 (NOT (?L1 = (KA WORK.V))))
			(!R5 (?X_B (VERY.ADV TIRED.A)))
			(!R6 (?X_A BED.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (KA WORK.V))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (KA WORK.V)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (KA WORK.V))))
		)
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (DESTINATION_PREP.? (KA WORK.V)))
	     ((ADV-A (TO.P (KA WORK.V))) GO.50.V))))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? (KA WORK.V))) GO.50.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? (KA WORK.V))) GO.50.V) (KA WORK.V)))
			(?X_C (?X_B GO.50.V))
			(?X_C (?X_B GO.50.V (KA WORK.V)))
			(?X_C (?X_B (LOCATION_ADV.? GO.50.V)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-232.PR ?L2 (KA WORK.V))) ** ?E)
		(:ROLES
			(!R1 (?X_H BED.N))
			(!R2 (?X_H (PERTAIN-TO ?X_I)))
			(!R3 ((KA WORK.V) DESTINATION.N))
			(!R4 (?L2 DESTINATION.N))
			(!R5 (?X_I AGENT.N))
			(!R6 (?X_I (VERY.ADV TIRED.A)))
		)
		(:STEPS
			(?X_E (?X_I (DOWN.PRT ((ADV-A (IN.P ?X_H)) LAY.V))))
			(?X_G (?X_I ((ADV-A (FROM.P ?L1)) GO.50.V) (KA WORK.V)))
			(?X_A (?X_I (DOWN.PRT ((ADV-A (IN.P ?X_H)) LAY.V))))
			(?X_C (?X_I ((ADV-A (FROM.P ?L1)) FALL.6.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_A)))
			(!W2 (?X_E (BEFORE ?X_C)))
			(!W3 (?X_G (BEFORE ?X_A)))
			(!W4 (?X_G (BEFORE ?X_C)))
			(!W5 (?X_A (BEFORE ?X_C)))
		)
	)
	(
			"A agent very tired lays down in a bed of a agent very tired."
			"A agent very tired go.34s working from L1."
			"A agent very tired lays down in a bed of a agent very tired."
			"A agent very tired fall.33s a destination from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) WALK.6.V) ?L2) ** ?X_B)
		(:ROLES
			(!R1 (?X_A WOMAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) WALK.6.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) WALK.6.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) WALK.6.V) ?L2))
			(?X_B (?X_A (AWAY.PRT WALK.6.V)))
			(?X_B (?X_A WALK.6.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? WALK.6.V)))
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.33.V ?X_C ?A) ** ?X_D)
		(:ROLES
			(!R1 (?X_B WOMAN.N))
			(!R2 (?X_C MAN.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_A (PERTAIN-TO ?X_C)))
			(!R5 (?X_A HEAD.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V ?X_C ?A)))
			(?G2 (?X_B (WANT.V (THAT (?X_B (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_B ((AWAY.PRT ASK.V) ?X_C ?A)))
			(?E2 (?X_C (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_D (?X_B ((AWAY.PRT ASK.V) ?X_C ?A)))
			(?X_D (?X_B (TELL.V ?X_C ?A)))
			(?X_D (?X_B (MAKE.V ?X_C ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.34.V ?X_C ?A) ** ?X_D)
		(:ROLES
			(!R1 (?X_B WOMAN.N))
			(!R2 (?X_C MAN.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_A (PERTAIN-TO ?X_C)))
			(!R5 (?X_A HEAD.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V ?X_C ?A)))
			(?G2 (?X_B (WANT.V (THAT (?X_B (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_B ((WHY.ADV ASK.V) ?X_C ?A)))
			(?E2 (?X_C (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_D (?X_B ((WHY.ADV ASK.V) ?X_C ?A)))
			(?X_D (?X_B (TELL.V ?X_C ?A)))
			(?X_D (?X_B (MAKE.V ?X_C ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-233.PR ?X_J (K DEJECTED.A) ?L2 ?X_L ?A)) ** ?E)
		(:ROLES
			(!R1 (?X_J HEAD.N))
			(!R2 (?X_J (PERTAIN-TO ?X_L)))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (?X_K WOMAN.N))
			(!R5 (?X_L MAN.N))
			(!R6 (?A ACTION.N))
		)
		(:STEPS
			(?X_I (?X_L (SHAKE.V ?X_J)))
			(?X_A (?X_L (SHAKE.V ?X_J)))
			(?X_G (?X_K REQUEST_ACTION.34.V ?X_L ?A))
			(?X_E (?X_K ((ADV-A (FROM.P ?L1)) WALK.6.V) ?L2))
			(?X_E (?X_K REQUEST_ACTION.33.V ?X_L ?A))
			(?X_C (?X_L (LOOK.V (K DEJECTED.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_A)))
			(!W2 (?X_I (BEFORE ?X_G)))
			(!W3 (?X_I (BEFORE ?X_E)))
			(!W4 (?X_I (BEFORE ?X_C)))
			(!W5 (?X_A (BEFORE ?X_G)))
			(!W6 (?X_A (BEFORE ?X_E)))
			(!W7 (?X_A (BEFORE ?X_C)))
			(!W8 (?X_G (BEFORE ?X_E)))
			(!W9 (?X_G (BEFORE ?X_C)))
			(!W10 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A man shakes a head of a man."
			"A man shakes a head of a man."
			"A woman request action.47s a man a action."
			"A woman walk.42s a destination from L1."
			"A woman request action.46s a man a action."
			"A man looks dejected."
	)
)



(
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-234.PR ?X_E ?X_H)) ** ?E)
		(:ROLES
			(!R1 (?X_B DAY.N))
			(!R2 (?X_E SLATE.N))
			(!R3 (?X_F (HAS.V (TWO.D (L X (AND (X PET.A) (X (PLUR RABBIT.N))))))))
			(!R4 (?X_E (PERTAIN-TO ?X_F)))
			(!R5
	   (?X_H
	    (HAVE.V
	     (SET-OF (K (L X (AND (X BIG.A) (X LONG.A) (X (PLUR EAR.N)))))
	      (K (L X (AND (X LITTLE.A) (X SHORT.A) (X (PLUR TAIL.N)))))))))
			(!R6 (?X_H (PLUR RABBIT.N)))
		)
		(:STEPS
			(?X_A ((ADV-E (DURING ?X_B)) (?X_F (((ADV-A (ON.P ?X_E)) DRAW.V) ?X_H))))
			(?X_D ((ADV-E (DURING ?X_B)) (?X_F ?X_H (ON.P ?X_E))))
			(?X_J
	   (?X_F
	    (((ADV-A (ON.P (K (L X (AND (X PAPER.N) (X TOO.ADV)))))) DRAW.V) ?X_H)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_D)))
			(!W2 (?X_A (BEFORE ?X_J)))
			(!W3 (?X_D (BEFORE ?X_J)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-235.PR ?X_A ?X_J (KA (CUT.V ?X_I)) ?X_I)) **
	             ?E)
		(:ROLES
			(!R1 (?X_H GIRLFRIEND.N))
			(!R2 (?X_H (PERTAIN-TO ?X_J)))
			(!R3 (?X_I (PLUR NAIL.N)))
			(!R4 (?X_I (PERTAIN-TO ?X_J)))
		)
		(:STEPS
			(?X_B (?X_A GIRLFRIEND.N))
			(?X_E (?X_J (HAVE.V ?X_A)))
			(?X_G (?X_H (ASK.V ?X_J (KA (CUT.V ?X_I)))))
			(?X_C (?X_J (CUT.V ?X_I)))
			(?X_L (?X_J (CUT.V ?X_I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_E)))
			(!W2 (?X_B (BEFORE ?X_G)))
			(!W3 (?X_B (BEFORE ?X_C)))
			(!W4 (?X_B (BEFORE ?X_L)))
			(!W5 (?X_E (BEFORE ?X_G)))
			(!W6 (?X_E (BEFORE ?X_C)))
			(!W7 (?X_E (BEFORE ?X_L)))
			(!W8 (?X_G (BEFORE ?X_C)))
			(!W9 (?X_G (BEFORE ?X_L)))
			(!W10 (?X_C (BEFORE ?X_L)))
		)
	)
	(
			"X_A is girlfriend."
			"X_J has X_A."
			"A girlfriend of X_J asks X_J cutting a nails of X_J."
			"X_J cuts a nails of X_J."
			"X_J cuts a nails of X_J."
	)
)



(
	(EPI-SCHEMA ((?X_A (((ADV-A (TO.P (|12.D| (PLUR MILE.N)))) MAKE.11.V) ?X_B)) **
	             ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_B ((ADV-A (ABOUT.P (KA DARK.A))) EXIST.V))))))
			(?G2 (?X_A (WANT.V (KA (HAVE.V ?X_B)))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B ((ADV-A (ABOUT.P (KA DARK.A))) EXIST.V))))
		)
		(:POSTCONDS
			(?X_E (?X_B ((ADV-A (ABOUT.P (KA DARK.A))) EXIST.V)))
			(?P2 (?X_A (HAVE.V ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
			(!W2 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J
	              (COMPOSITE-SCHEMA-236.PR
	               (KA
	                (RUN.V
	                 (TWENTY.D
	                  (L X (AND (X (PLUR MILE.N)) (X (AFTER.P (K WORK.N))))))))
	               ?X_K))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J AGENT.N))
			(!R2 (NOT (?X_K AGENT.N)))
		)
		(:STEPS
			(?X_I
	   (?X_J
	    (WANT.V
	     (KA
	      (RUN.V
	       (TWENTY.D (L X (AND (X (PLUR MILE.N)) (X (AFTER.P (K WORK.N)))))))))))
			(?X_G (MUST.AUX-S (?X_J HURRY.V)))
			(?X_E (?X_K ((ADV-A (ABOUT.P (KA DARK.A))) BE.V)))
			(?X_C (?X_J (((ADV-A (TO.P (|12.D| (PLUR MILE.N)))) MAKE.11.V) ?X_K)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_G)))
			(!W2 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A agent wants running twenty mile after."
			"A agent hurries must."
			"X_K is about dark."
			"A agent make.97s X_K to 12 miles."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.51.V) (K FISHING.N)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K FISHING.N) DESTINATION.N))
			(!R4 (NOT (?L1 = (K FISHING.N))))
			(!R5 (?X_B MORE.A))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A LIMIT.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (K FISHING.N))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K FISHING.N)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K FISHING.N))))
		)
		(:PARAPHRASES
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? (K FISHING.N))) GO.51.V)))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K FISHING.N))) GO.51.V))))
			(?X_C
	   (?X_B ((ADV-A (DESTINATION_PREP.? (K FISHING.N))) GO.51.V) (K FISHING.N)))
			(?X_C (?X_B GO.51.V))
			(?X_C (?X_B GO.51.V (K FISHING.N)))
			(?X_C (?X_B (LOCATION_ADV.? GO.51.V)))
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
	(EPI-SCHEMA ((?X_A GET.44.V
	              (K
	               (L X
	                (AND (X (PASV CATCH.V))
	                     (X
	                      (WITH.P
	                       (K (L X (AND (X (TOO.ADV MANY.A)) (X FISH.N))))))))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2
	   (NOT
	    ((K
	      (L X
	       (AND (X (PASV CATCH.V))
	            (X (WITH.P (K (L X (AND (X (TOO.ADV MANY.A)) (X FISH.N)))))))))
	     AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4
	   (NOT
	    (?X_A =
	     (K
	      (L X
	       (AND (X (PASV CATCH.V))
	            (X (WITH.P (K (L X (AND (X (TOO.ADV MANY.A)) (X FISH.N))))))))))))
			(!R5 (?X_A MALE.A))
		)
		(:GOALS
			(?G1
	   (?X_A
	    (WANT.V
	     (THAT
	      (?X_A
	       (HAVE.V
	        (K
	         (L X
	          (AND (X (PASV CATCH.V))
	               (X
	                (WITH.P
	                 (K (L X (AND (X (TOO.ADV MANY.A)) (X FISH.N)))))))))))))))
		)
		(:PRECONDS
			(?I1
	   (NOT
	    (?X_A HAVE.V
	     (K
	      (L X
	       (AND (X (PASV CATCH.V))
	            (X (WITH.P (K (L X (AND (X (TOO.ADV MANY.A)) (X FISH.N))))))))))))
			(?I2 (?X_A (AT.P ?L)))
			(?I3
	   ((K
	     (L X
	      (AND (X (PASV CATCH.V))
	           (X (WITH.P (K (L X (AND (X (TOO.ADV MANY.A)) (X FISH.N)))))))))
	    (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1
	   (?X_A HAVE.V
	    (K
	     (L X
	      (AND (X (PASV CATCH.V))
	           (X (WITH.P (K (L X (AND (X (TOO.ADV MANY.A)) (X FISH.N)))))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
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
	              (COMPOSITE-SCHEMA-237.PR ?X_L
	               (K (L X (AND (X MORE.A) (X (THAN.P ?X_L)))))
	               (ALL.D (L X (AND (X {REF}.N) (X (OF.P (THE.D FISH.N)))))) ?X_E
	               (K FISHING.N)
	               (K
	                (L X
	                 (AND (X (PASV CATCH.V))
	                      (X
	                       (WITH.P
	                        (K (L X (AND (X (TOO.ADV MANY.A)) (X FISH.N)))))))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E FINE.N))
			(!R2 (?X_E BIG.A))
			(!R3 (?X_L LIMIT.N))
			(!R4 (?X_L (PERTAIN-TO ?X_M)))
			(!R5 (?X_M MAN.N))
			(!R6 (?X_M MORE.A))
			(!R7 ((K FISHING.N) DESTINATION.N))
			(!R8 (?X_N AGENT.N))
			(!R9 (?X_N MALE.A))
			(!R10
	   (NOT
	    ((K
	      (L X
	       (AND (X (PASV CATCH.V))
	            (X (WITH.P (K (L X (AND (X (TOO.ADV MANY.A)) (X FISH.N)))))))))
	     AGENT.N)))
			(!R11
	   (NOT
	    (?X_N =
	     (K
	      (L X
	       (AND (X (PASV CATCH.V))
	            (X (WITH.P (K (L X (AND (X (TOO.ADV MANY.A)) (X FISH.N))))))))))))
		)
		(:STEPS
			(?X_A (?X_M (THAN.P ?X_L)))
			(?X_K (?X_M ((ADV-A (FROM.P ?L1)) GO.51.V) (K FISHING.N)))
			(?X_B (?X_M (CATCH.V (K (L X (AND (X MORE.A) (X (THAN.P ?X_L))))))))
			(?X_I
	   (?X_M (KEEP.V (ALL.D (L X (AND (X {REF}.N) (X (OF.P (THE.D FISH.N)))))))))
			(?X_G
	   (?X_N GET.44.V
	    (K
	     (L X
	      (AND (X (PASV CATCH.V))
	           (X (WITH.P (K (L X (AND (X (TOO.ADV MANY.A)) (X FISH.N)))))))))))
			(?X_D (MUST.AUX-S (?X_N (PAY.V ?X_E))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_I)))
			(!W2 (?X_A (BEFORE ?X_G)))
			(!W3 (?X_A (BEFORE ?X_D)))
			(!W4 (?X_K (BEFORE ?X_B)))
			(!W5 (?X_K (BEFORE ?X_I)))
			(!W6 (?X_K (BEFORE ?X_G)))
			(!W7 (?X_K (BEFORE ?X_D)))
			(!W8 (?X_B (BEFORE ?X_I)))
			(!W9 (?X_B (BEFORE ?X_G)))
			(!W10 (?X_B (BEFORE ?X_D)))
			(!W11 (?X_I (BEFORE ?X_G)))
			(!W12 (?X_I (BEFORE ?X_D)))
			(!W13 (?X_G (BEFORE ?X_D)))
		)
	)
	(
			"A man more is than."
			"A man more go.102s fishing from L1."
			"A man more catches more than."
			"A man more keeps all of."
			"A agent male get.101s PASV catches with."
			"A agent male pays a fine big must."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.45.V (K UPSET.A)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((K UPSET.A) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K UPSET.A))))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A NEW.A))
			(!R7 (?X_A PHONE.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (HAVE.V (K UPSET.A)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_B HAVE.V (K UPSET.A))))
			(?I2 (?X_B (AT.P ?L)))
			(?I3 ((K UPSET.A) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_B HAVE.V (K UPSET.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-238.PR ?X_L (K UPSET.A))) ** ?E)
		(:ROLES
			(!R1 (?X_H (PLUR WOOD.N)))
			(!R2 (?X_I DAY.N))
			(!R3 (?X_L NEW.A))
			(!R4 (?X_L PHONE.N))
			(!R5 (?X_L (PERTAIN-TO ?X_M)))
			(!R6 (?X_M AGENT.N))
			(!R7 (NOT ((K UPSET.A) AGENT.N)))
			(!R8 (NOT (?X_M = (K UPSET.A))))
		)
		(:STEPS
			(?X_K (?X_M (HAVE.V ?X_L)))
			(?X_G ((ADV-E (DURING ?X_I)) (?X_M ((ADV-A (IN.P ?X_H)) WALK.V))))
			(?X_E (?X_M (LOSE.V ?X_L)))
			(?X_A (?X_M (LOSE.V ?X_L)))
			(?X_C (?X_M GET.45.V (K UPSET.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_G)))
			(!W2 (?X_K (BEFORE ?X_A)))
			(!W3 (?X_K (BEFORE ?X_C)))
			(!W4 (?X_G (BEFORE ?X_A)))
			(!W5 (?X_G (BEFORE ?X_C)))
			(!W6 (?X_E (BEFORE ?X_A)))
			(!W7 (?X_E (BEFORE ?X_C)))
			(!W8 (?X_A (BEFORE ?X_C)))
		)
	)
	(
			"A agent has a new phone of a agent."
			"A agent walks DURING a day in a woods."
			"A agent loses a new phone of a agent."
			"A agent loses a new phone of a agent."
			"A agent get.118s upset."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) CHASE.1.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_A FRIEND.N))
			(!R6 (?X_A (HAS.V ?X_D)))
			(!R7 (?X_D HAT.N))
			(!R8 (?X_A (PERTAIN-TO ?X_C)))
			(!R9 (?X_D (PERTAIN-TO ?X_B)))
			(!R10 (?X_B MALE.A))
			(!R11 (?X_B AGENT.N))
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
		(:PARAPHRASES
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) CHASE.1.V)))
			(?X_E
	   (?X_C
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) CHASE.1.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) CHASE.1.V) ?X_D))
			(?X_E (?X_C CHASE.1.V))
			(?X_E (?X_C CHASE.1.V ?X_D))
			(?X_E (?X_C (LOCATION_ADV.? CHASE.1.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (BEFORE ?X_F)))
			(!W7 (?X_G (SAME-TIME ?X_F)))
			(!W8 (?X_G (RIGHT-AFTER ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) CHASE.2.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_B FRIEND.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B (HAS.V ?X_D)))
			(!R8 (?X_D HAT.N))
			(!R9 (?X_D (PERTAIN-TO ?X_A)))
			(!R10 (?X_A MALE.A))
			(!R11 (?X_A AGENT.N))
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
		(:PARAPHRASES
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) CHASE.2.V)))
			(?X_E
	   (?X_C
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) CHASE.2.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) CHASE.2.V) ?X_D))
			(?X_E (?X_C CHASE.2.V))
			(?X_E (?X_C (((ADV-A (WITH.P ?X_B)) CHASE.2.V) ?X_D)))
			(?X_E (?X_C (LOCATION_ADV.? CHASE.2.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_E))
			(!W2 (?I2 BEFORE ?X_E))
			(!W3 (?P1 AFTER ?X_E))
			(!W4 (?P2 AFTER ?X_E))
			(!W5 (?G1 CAUSE-OF ?X_E))
			(!W6 (?X_E (SAME-TIME ?X_H)))
			(!W7 (?X_E (RIGHT-AFTER ?X_F)))
			(!W8 (?X_G (BEFORE ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-239.PR ?X_E ?X_P)) ** ?E)
		(:ROLES
			(!R1 (?X_E HAT.N))
			(!R2 (?X_E (PLUR FRIEND.N)))
			(!R3 (?X_E (PERTAIN-TO ?X_F)))
			(!R4 (?X_G (SET-OF AGENT.N)))
			(!R5 (?X_L FRIEND.N))
			(!R6 (?X_L (PERTAIN-TO ?X_O)))
			(!R7 (?X_L (HAS.V ?X_P)))
			(!R8 (?X_M WIND.N))
			(!R9 (?X_N MALE.A))
			(!R10 (?X_N AGENT.N))
			(!R11 (?X_P (PERTAIN-TO ?X_N)))
			(!R12 (?X_O AGENT.N))
			(!R13 (?X_P DESTINATION.N))
			(!R14 (?X_P HAT.N))
		)
		(:STEPS
			(?X_K (?X_M ((AWAY.ADV BLOW.V) ?X_P)))
			(?X_A (?X_M ((AWAY.ADV BLOW.V) ?X_P)))
			(?X_I (?X_O ((ADV-A (FROM.P ?L1)) CHASE.1.V) ?X_P))
			(?X_B (?X_O ((ADV-A (FROM.P ?L1)) CHASE.2.V) ?X_P))
			(?X_D (?X_G (CATCH.V ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_A)))
			(!W2 (?X_K (BEFORE ?X_B)))
			(!W3 (?X_K (BEFORE ?X_D)))
			(!W4 (?X_A (BEFORE ?X_B)))
			(!W5 (?X_A (BEFORE ?X_D)))
			(!W6 (?X_I (BEFORE ?X_B)))
			(!W7 (?X_I (BEFORE ?X_D)))
			(!W8 (?X_B (BEFORE ?X_D)))
		)
	)
	(
			"A wind blows a destination hat of a male agent away."
			"A wind blows a destination hat of a male agent away."
			"A agent chase.135s a destination hat of a male agent from L1."
			"A agent chase.137s a destination hat of a male agent from L1."
			"A agent catches a hat friends of X_F."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) CLIMB.3.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C TREE.N))
			(!R6 (?X_C (VERY.ADV PRETTY.A)))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_A MOTHER.N))
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
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) CLIMB.3.V)))
			(?X_D
	   (?X_B
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) CLIMB.3.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) CLIMB.3.V) ?X_C))
			(?X_D (?X_B CLIMB.3.V))
			(?X_D (?X_B ((CAN.AUX CLIMB.3.V) ?X_C)))
			(?X_D (?X_B (LOCATION_ADV.? CLIMB.3.V)))
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.35.V (KA ((ADV-A (WITH.P ?X_B)) PLAY.V))) **
	             ?X_C)
		(:ROLES
			(!R1 (?X_A MOTHER.N))
			(!R2 ((KA ((ADV-A (WITH.P ?X_B)) PLAY.V)) ACTION.N))
			(!R3 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA ((ADV-A (WITH.P ?X_B)) PLAY.V)) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_C (?X_A (WANT.V (KA ((ADV-A (WITH.P ?X_B)) PLAY.V)))))
			(?X_C (?X_A (LIKE.V (KA ((ADV-A (WITH.P ?X_B)) PLAY.V)))))
			(?X_C (?X_A (LOVE.V (KA ((ADV-A (WITH.P ?X_B)) PLAY.V)))))
			(?X_C (?X_A (ENJOY.V (KA ((ADV-A (WITH.P ?X_B)) PLAY.V)))))
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
	(EPI-SCHEMA ((?X_B GET.46.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A MOTHER.N))
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
			(!W1 (?I1 PRECOND-OF ?X_D))
			(!W2 (?I2 PRECOND-OF ?X_D))
			(!W3 (?I3 PRECOND-OF ?X_D))
			(!W4 (?P1 POSTCOND-OF ?X_D))
			(!W5 (?X_D (AT-ABOUT ?X_E)))
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
	              (COMPOSITE-SCHEMA-240.PR (K (PLUR COCOANUT.N)) ?X_O
	               (KA ((ADV-A (WITH.P ?X_R)) PLAY.V)) ?X_P))
	             ** ?E)
		(:ROLES
			(!R1 (?X_O DESTINATION.N))
			(!R2 (?X_O TREE.N))
			(!R3 (?X_O (VERY.ADV PRETTY.A)))
			(!R4 (?X_R AGENT.N))
			(!R5 (NOT (?X_P AGENT.N)))
			(!R6 (NOT (?X_R = ?X_P)))
			(!R7 (?X_Q MOTHER.N))
			(!R8 (?X_Q (PERTAIN-TO ?X_R)))
			(!R9 ((KA ((ADV-A (WITH.P ?X_R)) PLAY.V)) ACTION.N))
		)
		(:STEPS
			(?X_N
	   ((K (L X (AND (X MANY.A) (X (PLUR COCOANUT.N)))))
	    ((ADV-A (ON.P ?X_O)) GROW.V)))
			(?X_L (?X_R ((ADV-A (FROM.P ?L1)) CLIMB.3.V) ?X_O))
			(?X_J (?X_R GET.46.V ?X_P))
			(?X_B (?X_Q (LIKE.V (K (PLUR COCOANUT.N)))))
			(?X_H (?X_Q (LIKE.V (K (PLUR COCOANUT.N)))))
			(?X_F (?X_Q ((ADV-A (FOR.P (KA (CLIMB.V ?X_O)))) CANNOT.V)))
			(?X_D (?X_Q ENJOY_ACTION.35.V (KA ((ADV-A (WITH.P ?X_R)) PLAY.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_L)))
			(!W2 (?X_N (BEFORE ?X_J)))
			(!W3 (?X_N (BEFORE ?X_B)))
			(!W4 (?X_N (BEFORE ?X_H)))
			(!W5 (?X_N (BEFORE ?X_F)))
			(!W6 (?X_N (BEFORE ?X_D)))
			(!W7 (?X_L (BEFORE ?X_J)))
			(!W8 (?X_L (BEFORE ?X_B)))
			(!W9 (?X_L (BEFORE ?X_H)))
			(!W10 (?X_L (BEFORE ?X_F)))
			(!W11 (?X_L (BEFORE ?X_D)))
			(!W12 (?X_J (BEFORE ?X_B)))
			(!W13 (?X_J (BEFORE ?X_H)))
			(!W14 (?X_J (BEFORE ?X_F)))
			(!W15 (?X_J (BEFORE ?X_D)))
			(!W16 (?X_B (BEFORE ?X_F)))
			(!W17 (?X_B (BEFORE ?X_D)))
			(!W18 (?X_H (BEFORE ?X_F)))
			(!W19 (?X_H (BEFORE ?X_D)))
			(!W20 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"Many cocoanut grows on a destination tree very pretty."
			"A agent climb.162s a destination tree very pretty from L1."
			"A agent get.160s X_P."
			"A mother of a agent likes cocoanuts."
			"A mother of a agent likes cocoanuts."
			"A mother of a agent cannots for climbing a destination tree very pretty."
			"A mother of a agent enjoy action.159s with a agent playing."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.52.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B CASINO.N))
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.52.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.52.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.52.V) ?X_B))
			(?X_C (?X_A GO.52.V))
			(?X_C (?X_A GO.52.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.52.V)))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-241.PR (KE (?X_I JEALOUS.A)) ?X_C ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_C LITTLE.A))
			(!R2 (?X_C MONEY.N))
			(!R3 (?X_F NIGHT.N))
			(!R4 (?X_F FUN.N))
			(!R5 (?X_I LITTLE.A))
			(!R6 (?X_J AGENT.N))
			(!R7 (?X_M AGENT.N))
			(!R8 (?X_N DESTINATION.N))
			(!R9 (?X_N CASINO.N))
		)
		(:STEPS
			(?X_L (?X_M ((ADV-A (FROM.P ?L1)) GO.52.V) ?X_N))
			(?X_H (?X_J (BE.V (KE (?X_I JEALOUS.A)))))
			(?X_E ((ADV-E (DURING ?X_F)) (?X_M HAVE.V)))
			(?X_B (?X_M ((TOO.ADV WIN.V) ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_H)))
			(!W2 (?X_L (BEFORE ?X_E)))
			(!W3 (?X_L (BEFORE ?X_B)))
			(!W4 (?X_H (BEFORE ?X_E)))
			(!W5 (?X_H (BEFORE ?X_B)))
			(!W6 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A agent go.171s a destination casino from L1."
			"A agent is a little jealous."
			"A agent has DURING a night fun."
			"A agent wins a little money too."
	)
)



(
	(EPI-SCHEMA ((?X_C TRANSPORT_OBJECT.29.V ?X_D) ** ?X_F)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D FAMILY.N))
			(!R3 (?X_D SMALLER-THAN.N ?X_C))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_E FARM.N))
			(!R6 (?X_E DESTINATION.N))
			(!R7 (?X_D (PERTAIN-TO ?X_C)))
			(!R8 (?X_A (PLUR KID.N)))
			(!R9 (?X_A (PERTAIN-TO ?X_C)))
			(!R10 (?X_B (PERTAIN-TO ?X_C)))
			(!R11 (?X_B DAUGHTER.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (THAT (?X_D ((ADV-A (AT.P ?X_E)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?X_D ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?X_D ((ADV-A (AT.P ?X_E)) BE.V)))
		)
		(:PARAPHRASES
			(?X_F (?X_C (((ADV-A (TO.P ?X_E)) TAKE.V) ?X_D)))
			(?X_F (?X_C ((ADV-A (TO.P ?X_E)) CARRY.V) ?X_D))
			(?X_F (?X_C ((ADV-A (TO.P ?X_E)) BRING.V) ?X_D))
			(?X_F (?X_C (LOCATION_ADV.? TAKE.V) ?X_D))
			(?X_F (?X_C (LOCATION_ADV.? CARRY.V) ?X_D))
			(?X_F (?X_C (LOCATION_ADV.? BRING.V) ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_F))
			(!W2 (?P1 POSTCOND-OF ?X_F))
			(!W3 (?X_F (SAME-TIME ?X_I)))
			(!W4 (?X_F (RIGHT-AFTER ?X_G)))
			(!W5 (?X_H (BEFORE ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D TAKE.22.V ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_A FARM.N))
			(!R6 (?X_E (PERTAIN-TO ?X_D)))
			(!R7 (?X_E FAMILY.N))
			(!R8 (?X_B (PLUR KID.N)))
			(!R9 (?X_B (PERTAIN-TO ?X_D)))
			(!R10 (?X_C DAUGHTER.N))
			(!R11 (?X_C (PERTAIN-TO ?X_D)))
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
			(!W1 (?I1 PRECOND-OF ?X_F))
			(!W2 (?I2 PRECOND-OF ?X_F))
			(!W3 (?I3 PRECOND-OF ?X_F))
			(!W4 (?P1 POSTCOND-OF ?X_F))
			(!W5 (?X_F (BEFORE ?X_G)))
			(!W6 (?X_H (SAME-TIME ?X_G)))
			(!W7 (?X_H (RIGHT-AFTER ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_S (COMPOSITE-SCHEMA-242.PR ?X_N ?X_K ?X_F ?X_U)) ** ?E)
		(:ROLES
			(!R1 (?X_F FUN.N))
			(!R2 (?X_F TIME.N))
			(!R3 (?X_K PIG.N))
			(!R4 (?X_S DAUGHTER.N))
			(!R5 (?X_N GREAT.A))
			(!R6 (?X_N TIME.N))
			(!R7 (?X_R (PLUR KID.N)))
			(!R8 (?X_Q FARM.N))
			(!R9 (?X_R (PERTAIN-TO ?X_T)))
			(!R10 (?X_S (PERTAIN-TO ?X_T)))
			(!R11 (NOT (?X_U AGENT.N)))
			(!R12 (NOT (?X_T = ?X_U)))
			(!R13 (?X_T AGENT.N))
			(!R14 (?X_U SMALLER-THAN.N ?X_T))
			(!R15 (?X_U (PERTAIN-TO ?X_T)))
			(!R16 (?X_U FAMILY.N))
		)
		(:STEPS
			(?X_M (?X_R (HAVE.V ?X_N)))
			(?X_J (?X_S ((THEN.ADV TOUCH.V) ?X_K)))
			(?X_P (?X_T TAKE.22.V ?X_U))
			(?X_A (?X_T TRANSPORT_OBJECT.29.V ?X_U))
			(?X_B (?X_R (HAVE.V ?X_N)))
			(?X_C (?X_S ((THEN.ADV TOUCH.V) ?X_K)))
			(?X_H (?X_S LAUGH.V))
			(?X_E (?X_S (HAVE.V ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_B)))
			(!W2 (?X_M (BEFORE ?X_C)))
			(!W3 (?X_M (BEFORE ?X_H)))
			(!W4 (?X_M (BEFORE ?X_E)))
			(!W5 (?X_J (BEFORE ?X_C)))
			(!W6 (?X_J (BEFORE ?X_H)))
			(!W7 (?X_J (BEFORE ?X_E)))
			(!W8 (?X_P (BEFORE ?X_A)))
			(!W9 (?X_P (BEFORE ?X_B)))
			(!W10 (?X_P (BEFORE ?X_C)))
			(!W11 (?X_P (BEFORE ?X_H)))
			(!W12 (?X_P (BEFORE ?X_E)))
			(!W13 (?X_A (BEFORE ?X_B)))
			(!W14 (?X_A (BEFORE ?X_C)))
			(!W15 (?X_A (BEFORE ?X_H)))
			(!W16 (?X_A (BEFORE ?X_E)))
			(!W17 (?X_B (BEFORE ?X_C)))
			(!W18 (?X_B (BEFORE ?X_H)))
			(!W19 (?X_B (BEFORE ?X_E)))
			(!W20 (?X_C (BEFORE ?X_H)))
			(!W21 (?X_C (BEFORE ?X_E)))
			(!W22 (?X_H (BEFORE ?X_E)))
		)
	)
	(
			"A kids of a agent have a great time."
			"A daughter of a agent touches a pig then."
			"A agent take.192s a family of a agent."
			"A agent transport object.184s a family of a agent."
			"A kids of a agent have a great time."
			"A daughter of a agent touches a pig then."
			"A daughter of a agent laughs."
			"A daughter of a agent has a fun time."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.53.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A PLANE.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.53.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.53.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.53.V) ?L2))
			(?X_C
	   ((ADV-E (DURING (K YESTERDAY.N))) (?X_B ((ADV-A (ON.P ?X_A)) GO.53.V))))
			(?X_C (?X_B GO.53.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? GO.53.V)))
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-243.PR ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_C FIRE.N))
			(!R2 (?X_F (SET-OF AGENT.N)))
			(!R3 (?X_I PLANE.N))
			(!R4 (?X_J AGENT.N))
			(!R5 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_H (?X_J ((ADV-A (FROM.P ?L1)) GO.53.V) ?L2))
			(?X_E (MUST.AUX-S (?X_F (BACK.ADV TURN.V))))
			(?X_B (?X_C (ABOUT.PRT COME.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_E)))
			(!W2 (?X_H (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A agent go.208s a destination from L1."
			"A agent turns must back."
			"A fire comes about."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-244.PR ?X_B)) ** ?E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B HORSE.N))
			(!R3 (?X_B GOOD.A))
		)
		(:STEPS
			(E305.SK (NOT (?X_A (WHIP.V ?X_B))))
		)
	)
	(
			"A agent whips a horse good not."
	)
)



(
	(EPI-SCHEMA ((?X_G ((ADV-A (FROM.P ?L1)) FALL.7.V) ?L2) ** ?X_I)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 ((K RED.A) (PERTAIN-TO ?X_G)))
			(!R6 (?X_F SNOW.N))
			(!R7 (?X_D (K RED.A) SLED.N))
			(!R8 (?X_D (PERTAIN-TO ?X_G)))
			(!R9 (?X_B (PERTAIN-TO ?X_G)))
			(!R10 (?X_B (IS.V (KE (?X_E (PASV SLED.V))))))
			(!R11
	   (?X_B
	    (HAS.V (KE ((K (L X (AND (X BLACK.A) (X (PLUR LETTER.N))))) (ON.P ?X_B))))))
			(!R12 (?X_B SLED.A))
			(!R13 (?X_C (IS.V ?X_D)))
			(!R14 (?X_E RED.N))
		)
		(:GOALS
			(?G1 (?X_G (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_G (AT.P ?L1)))
			(?I2 (NOT (?X_G (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_G (AT.P ?L1))))
			(?P2 (?X_G (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_I (?X_G ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.7.V)))
			(?X_I
	   (?X_G ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.7.V))))
			(?X_I (?X_G ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.7.V) ?L2))
			(?X_I (?X_G ((ADV-A (INTO.P ?X_F)) FALL.7.V)))
			(?X_I (?X_G FALL.7.V ?L2))
			(?X_I (?X_G (LOCATION_ADV.? FALL.7.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_I))
			(!W2 (?I2 BEFORE ?X_I))
			(!W3 (?P1 AFTER ?X_I))
			(!W4 (?P2 AFTER ?X_I))
			(!W5 (?G1 CAUSE-OF ?X_I))
			(!W6 (?X_H (CONSEC ?X_I)))
			(!W7 (?X_H (DURING ?X_J)))
			(!W8 (?X_I (DURING ?X_J)))
			(!W9 (?X_J (AT-ABOUT ?X_K)))
			(!W10 (?X_N (AT-ABOUT ?X_K)))
			(!W11 (?X_L (DURING ?X_N)))
			(!W12 (?X_L (CONSEC ?X_M)))
			(!W13 (?X_M (DURING ?X_N)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_G ((ADV-A (FROM.P ?L1)) FALL.8.V) ?L2) ** ?X_I)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 ((K RED.A) (PERTAIN-TO ?X_G)))
			(!R6 (?X_F SNOW.N))
			(!R7 (?X_B (PERTAIN-TO ?X_G)))
			(!R8 (?X_B SLED.A))
			(!R9
	   (?X_B
	    (HAS.V (KE ((K (L X (AND (X BLACK.A) (X (PLUR LETTER.N))))) (ON.P ?X_B))))))
			(!R10 (?X_B (IS.V (KE (?X_E (PASV SLED.V))))))
			(!R11 (?X_D (PERTAIN-TO ?X_G)))
			(!R12 (?X_D (K RED.A) SLED.N))
			(!R13 (?X_C (IS.V ?X_D)))
			(!R14 (?X_E RED.N))
		)
		(:GOALS
			(?G1 (?X_G (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_G (AT.P ?L1)))
			(?I2 (NOT (?X_G (AT.P ?L2))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_G (AT.P ?L1))))
			(?P2 (?X_G (AT.P ?L2)))
		)
		(:PARAPHRASES
			(?X_I (?X_G ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.8.V)))
			(?X_I
	   (?X_G ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.8.V))))
			(?X_I (?X_G ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.8.V) ?L2))
			(?X_I (?X_G ((ADV-A (INTO.P ?X_F)) FALL.8.V)))
			(?X_I (?X_G FALL.8.V ?L2))
			(?X_I (?X_G (LOCATION_ADV.? FALL.8.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_I))
			(!W2 (?I2 BEFORE ?X_I))
			(!W3 (?P1 AFTER ?X_I))
			(!W4 (?P2 AFTER ?X_I))
			(!W5 (?G1 CAUSE-OF ?X_I))
			(!W6 (?X_H (CONSEC ?X_I)))
			(!W7 (?X_H (DURING ?X_J)))
			(!W8 (?X_I (DURING ?X_J)))
			(!W9 (?X_J (AT-ABOUT ?X_K)))
			(!W10 (?X_N (AT-ABOUT ?X_K)))
			(!W11 (?X_L (DURING ?X_N)))
			(!W12 (?X_M (CONSEC ?X_L)))
			(!W13 (?X_M (DURING ?X_N)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_U (COMPOSITE-SCHEMA-245.PR ?X_U ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_K SNOW.N))
			(!R2 (?X_M SLED.A))
			(!R3 (?X_M (IS.V (KE (?X_P (PASV SLED.V))))))
			(!R4
	   (?X_M
	    (HAS.V (KE ((K (L X (AND (X BLACK.A) (X (PLUR LETTER.N))))) (ON.P ?X_M))))))
			(!R5 (?X_M (PERTAIN-TO ?X_U)))
			(!R6 (?X_O (K RED.A) SLED.N))
			(!R7 (?X_O (PERTAIN-TO ?X_U)))
			(!R8 (?X_N (IS.V ?X_O)))
			(!R9 (?X_P RED.N))
			(!R10 ((K RED.A) (PERTAIN-TO ?X_U)))
			(!R11 (?X_U AGENT.N))
			(!R12 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_J (?X_U ((ADV-A (INTO.P ?X_K)) FALL.V)))
			(?X_A (?X_U (((ADV-A (FOR.P (KA (HAVE.V (K RED.A))))) LET.V) ?X_U)))
			(?X_B (?X_U (((ADV-A (FOR.P (KA (HAVE.V (K RED.A))))) LET.V) ?X_U)))
			(?X_C (?X_U ((ADV-A (INTO.P ?X_K)) FALL.V)))
			(?X_D (?X_U ((ADV-A (FROM.P ?L1)) FALL.7.V) ?L2))
			(?X_D (?X_U ((ADV-A (FROM.P ?L1)) FALL.8.V) ?L2))
			(?X_H (NOT (?X_U (CAN.AUX ((ADV-A (ON.P (K RED.A))) STAND.V)))))
			(?X_F (?X_U (CAN.AUX ((ADV-A (ON.P (K RED.A))) STAND.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_A)))
			(!W2 (?X_J (BEFORE ?X_B)))
			(!W3 (?X_J (BEFORE ?X_C)))
			(!W4 (?X_J (BEFORE ?X_D)))
			(!W5 (?X_J (BEFORE ?X_H)))
			(!W6 (?X_J (BEFORE ?X_F)))
			(!W7 (?X_A (BEFORE ?X_D)))
			(!W8 (?X_A (BEFORE ?X_H)))
			(!W9 (?X_A (BEFORE ?X_F)))
			(!W10 (?X_B (BEFORE ?X_C)))
			(!W11 (?X_B (BEFORE ?X_H)))
			(!W12 (?X_B (BEFORE ?X_F)))
			(!W13 (?X_C (BEFORE ?X_H)))
			(!W14 (?X_C (BEFORE ?X_F)))
			(!W15 (?X_D (BEFORE ?X_H)))
			(!W16 (?X_D (BEFORE ?X_F)))
			(!W17 (?X_H (BEFORE ?X_F)))
		)
	)
	(
			"A agent falls into a snow."
			"A agent lets a agent for having red."
			"A agent lets a agent for having red."
			"A agent falls into a snow."
			"A agent fall.229s a destination from L1."
			"A agent fall.230s a destination from L1."
			"A agent stands not can on red."
			"A agent stands can on red."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (COMPOSITE-SCHEMA-246.PR ?X_F
	               (K (L X (AND (X COLD.A) (X INSIDE.N))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_F GREAT.A))
			(!R3 (?X_F TIME.N))
			(!R4 (?X_M ICE.N))
			(!R5 (?X_M RINK.N))
		)
		(:STEPS
			(?X_H (?X_E (HAVE.V ?X_F)))
			(?X_J (?X_A FIT.V))
			(?X_L (?X_B (BE.V (K (L X (AND (X COLD.A) (X INSIDE.N)))))))
			(?X_O (?X_D ((ADV-A (AT.P ?X_M)) BE.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_J)))
			(!W2 (?X_H (BEFORE ?X_L)))
			(!W3 (?X_H (BEFORE ?X_O)))
			(!W4 (?X_J (BEFORE ?X_L)))
			(!W5 (?X_J (BEFORE ?X_O)))
			(!W6 (?X_L (BEFORE ?X_O)))
		)
	)
	(
			"A agent has a great time."
			"X_A fits."
			"X_B is cold inside."
			"X_D is at a ice rink."
	)
)



(
	(EPI-SCHEMA ((?X_E ((ADV-A (FROM.P ?X_D)) RUN.25.V) ?L2) ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_D PARK.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?X_D = ?L2)))
			(!R5 (?X_C (K OTHER.A) FRIEND.N))
			(!R6 (?X_A AGENT.N))
			(!R7 (?X_C (PERTAIN-TO ?X_A)))
			(!R8 (?X_B (AT.P ?X_D)))
			(!R9 (?X_B RUN.N))
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
		(:PARAPHRASES
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.25.V)))
			(?X_F
	   (?X_E ((ADV-A (FROM.P ?X_D)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.25.V))))
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.25.V) ?L2))
			(?X_F (?X_E ((ADV-A (WITH.P ?X_C)) RUN.25.V)))
			(?X_F (?X_E RUN.25.V ?L2))
			(?X_F (?X_E (LOCATION_ADV.? RUN.25.V)))
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
	(EPI-SCHEMA ((?X_E ((ADV-A (FROM.P ?L1)) GO.24.V) ?L2) ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C DAY.N))
			(!R6 (?X_D RUN.N))
			(!R7 (?X_A PARK.N))
			(!R8 (?X_D (AT.P ?X_A)))
			(!R9 (?X_B (K OTHER.A) FRIEND.N))
			(!R10 (?X_B (PERTAIN-TO ?X_E)))
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
		(:PARAPHRASES
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) GO.24.V)))
			(?X_F
	   (?X_E ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.24.V))))
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) GO.24.V) ?L2))
			(?X_F ((ADV-E (DURING ?X_C)) (?X_E ((ADV-A (ON.P ?X_D)) GO.24.V))))
			(?X_F (?X_E GO.24.V ?L2))
			(?X_F (?X_E (LOCATION_ADV.? GO.24.V)))
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
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-247.PR (K (L X (AND (X EARLY.A) (X MORNING.N))))
	               ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I (K OTHER.A) FRIEND.N))
			(!R2 (?X_K RUN.N))
			(!R3 (?X_I (PERTAIN-TO ?X_L)))
			(!R4 (?X_J DAY.N))
			(!R5 (?X_K (AT.P ?X_N)))
			(!R6 (?X_L AGENT.N))
			(!R7 (?X_M AGENT.N))
			(!R8 (?X_N PARK.N))
			(!R9 (NOT (?X_N = ?L2)))
			(!R10 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_H (?X_L ((ADV-A (FROM.P ?L1)) GO.24.V) ?L2))
			(?X_F (?X_A (BE.V (K (L X (AND (X EARLY.A) (X MORNING.N)))))))
			(?X_D (?X_M ((ADV-A (FROM.P ?X_N)) RUN.25.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_D)))
			(!W3 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A agent go.244s a destination from L1."
			"X_A is early morning."
			"A agent run.245s a destination from a park."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.54.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B LAKE.N))
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.54.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.54.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.54.V) ?X_B))
			(?X_C (?X_A GO.54.V))
			(?X_C (?X_A GO.54.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.54.V)))
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.36.V (KA (GO.V (K SWIMMING.N)))) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (GO.V (K SWIMMING.N))) ACTION.N))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA (GO.V (K SWIMMING.N))) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_B (?X_A (WANT.V (KA (GO.V (K SWIMMING.N))))))
			(?X_B (?X_A (LIKE.V (KA (GO.V (K SWIMMING.N))))))
			(?X_B (?X_A (LOVE.V (KA (GO.V (K SWIMMING.N))))))
			(?X_B (?X_A (ENJOY.V (KA (GO.V (K SWIMMING.N))))))
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
	(EPI-SCHEMA ((?X_E (COMPOSITE-SCHEMA-248.PR ?X_F (KA (GO.V (K SWIMMING.N))))) ** ?E)
		(:ROLES
			(!R1 ((KA (GO.V (K SWIMMING.N))) ACTION.N))
			(!R2 (?X_E AGENT.N))
			(!R3 (?X_F DESTINATION.N))
			(!R4 (?X_F LAKE.N))
		)
		(:STEPS
			(?X_D (?X_E ENJOY_ACTION.36.V (KA (GO.V (K SWIMMING.N)))))
			(?X_B (?X_E ((ADV-A (FROM.P ?L1)) GO.54.V) ?X_F))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent enjoy action.268s going swimming."
			"A agent go.263s a destination lake from L1."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.55.V)
	              (K (L X (AND (X SUMMER.N) (X SCHOOL.N)))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (L X (AND (X SUMMER.N) (X SCHOOL.N)))) DESTINATION.N))
			(!R4 (NOT (?L1 = (K (L X (AND (X SUMMER.N) (X SCHOOL.N)))))))
			(!R5 (?X_A HOMEWORK.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V
	     (KA ((ADV-A (AT.P (K (L X (AND (X SUMMER.N) (X SCHOOL.N)))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K (L X (AND (X SUMMER.N) (X SCHOOL.N))))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K (L X (AND (X SUMMER.N) (X SCHOOL.N)))))))
		)
		(:PARAPHRASES
			(?X_D
	   (MUST.AUX-S
	    (?X_B
	     ((ADV-A (DESTINATION_PREP.? (K (L X (AND (X SUMMER.N) (X SCHOOL.N))))))
	      ((ADV-A (TO.P (K (L X (AND (X SUMMER.N) (X SCHOOL.N)))))) GO.55.V)))))
			(?X_D
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K (L X (AND (X SUMMER.N) (X SCHOOL.N))))))
	      GO.55.V))))
			(?X_D
	   (?X_B
	    ((ADV-A (DESTINATION_PREP.? (K (L X (AND (X SUMMER.N) (X SCHOOL.N))))))
	     GO.55.V)
	    (K (L X (AND (X SUMMER.N) (X SCHOOL.N))))))
			(?X_D (?X_B GO.55.V))
			(?X_D (?X_B GO.55.V (K (L X (AND (X SUMMER.N) (X SCHOOL.N))))))
			(?X_D (?X_B (LOCATION_ADV.? GO.55.V)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) BECOME.4.V)
	              (K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N))))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N))))) DESTINATION.N))
			(!R4 (NOT (?L1 = (K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N))))))))
		)
		(:GOALS
			(?G1
	   (?X_A
	    (WANT.V
	     (KA
	      ((ADV-A (AT.P (K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N))))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N)))))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N))))))))
		)
		(:PARAPHRASES
			(?X_C
	   (?X_A
	    ((ADV-A
	      (DESTINATION_PREP.? (K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N)))))))
	     BECOME.4.V)))
			(?X_C
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A
	       (DESTINATION_PREP.? (K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N)))))))
	      BECOME.4.V))))
			(?X_C
	   (?X_A
	    ((ADV-A
	      (DESTINATION_PREP.? (K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N)))))))
	     BECOME.4.V)
	    (K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N)))))))
			(?X_C (?X_A BECOME.4.V))
			(?X_C (?X_A BECOME.4.V (K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N)))))))
			(?X_C (?X_A (LOCATION_ADV.? BECOME.4.V)))
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-249.PR ?X_I ?X_D
	               (K (L X (AND (X SUMMER.N) (X SCHOOL.N))))
	               (K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D LOT.N))
			(!R2 (?X_D (AT.P (K (L X (AND (X SUMMER.N) (X SCHOOL.N)))))))
			(!R3 (?X_I TEACHER.N))
			(!R4 (?X_L HOMEWORK.N))
			(!R5 (?X_L (PERTAIN-TO ?X_M)))
			(!R6 ((K (L X (AND (X SUMMER.N) (X SCHOOL.N)))) DESTINATION.N))
			(!R7 (?X_M AGENT.N))
			(!R8 (?X_N AGENT.N))
			(!R9 ((K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N))))) DESTINATION.N))
		)
		(:STEPS
			(?X_K
	   (?X_M ((ADV-A (FROM.P ?L1)) GO.55.V)
	    (K (L X (AND (X SUMMER.N) (X SCHOOL.N))))))
			(?X_H (?X_M (LIKE.V ?X_I)))
			(?X_F
	   (?X_N ((ADV-A (FROM.P ?L1)) BECOME.4.V)
	    (K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N)))))))
			(?X_C (?X_A (LEARN.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_H)))
			(!W2 (?X_K (BEFORE ?X_F)))
			(!W3 (?X_K (BEFORE ?X_C)))
			(!W4 (?X_H (BEFORE ?X_F)))
			(!W5 (?X_H (BEFORE ?X_C)))
			(!W6 (?X_F (BEFORE ?X_C)))
		)
	)
	(
			"A agent go.271s summer school from L1."
			"A agent likes a teacher."
			"A agent become.270s good friend from L1."
			"X_A learns a lot at summer school."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.56.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B (IN.P (K TOWN.N))))
			(!R6 (?X_B RESTAURANT.N))
			(!R7 (?X_B NEW.A))
			(!R8 (?X_A (EAGER.A (KA (TRY.V ?X_B)))))
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.56.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.56.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.56.V) ?X_B))
			(?X_C (?X_A GO.56.V))
			(?X_C (?X_A GO.56.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.56.V)))
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-250.PR (K GOOD.A) ?X_F)) ** ?E)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_E (EAGER.A (KA (TRY.V ?X_F)))))
			(!R3 (?X_F DESTINATION.N))
			(!R4 (?X_F (IN.P (K TOWN.N))))
			(!R5 (?X_F RESTAURANT.N))
			(!R6 (?X_F NEW.A))
		)
		(:STEPS
			(?X_D (?X_F (LOOK.V (K GOOD.A))))
			(?X_B (?X_E ((ADV-A (FROM.P ?L1)) GO.56.V) ?X_F))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A destination in town restaurant new looks good."
			"A agent eager trying a destination in town restaurant new go.288s a destination in town restaurant new from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) FALL.9.V) (K (RIGHT.ADV ASLEEP.A)))
	             ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (RIGHT.ADV ASLEEP.A)) DESTINATION.N))
			(!R4 (NOT (?L1 = (K (RIGHT.ADV ASLEEP.A)))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P (K (RIGHT.ADV ASLEEP.A)))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (K (RIGHT.ADV ASLEEP.A))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (K (RIGHT.ADV ASLEEP.A)))))
		)
		(:PARAPHRASES
			(?X_B
	   (?X_A ((ADV-A (DESTINATION_PREP.? (K (RIGHT.ADV ASLEEP.A)))) FALL.9.V)))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K (RIGHT.ADV ASLEEP.A)))) FALL.9.V))))
			(?X_B
	   (?X_A ((ADV-A (DESTINATION_PREP.? (K (RIGHT.ADV ASLEEP.A)))) FALL.9.V)
	    (K (RIGHT.ADV ASLEEP.A))))
			(?X_B (?X_A FALL.9.V))
			(?X_B (?X_A FALL.9.V (K (RIGHT.ADV ASLEEP.A))))
			(?X_B (?X_A (LOCATION_ADV.? FALL.9.V)))
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
	(EPI-SCHEMA ((?X_G
	              (COMPOSITE-SCHEMA-251.PR (KA (WATCH.V (K TV.N)))
	               (KA (DOWN.PRT LAY.V)) (K (RIGHT.ADV ASLEEP.A))))
	             ** ?E)
		(:ROLES
			(!R1 ((K (RIGHT.ADV ASLEEP.A)) DESTINATION.N))
			(!R2 (?X_G AGENT.N))
		)
		(:STEPS
			(?X_F (?X_G (TRY.V (KA (WATCH.V (K TV.N))))))
			(?X_D (?X_G ((THEN.ADV DECIDE.V) (KA (DOWN.PRT LAY.V)))))
			(?X_B (?X_G ((ADV-A (FROM.P ?L1)) FALL.9.V) (K (RIGHT.ADV ASLEEP.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_D)))
			(!W2 (?X_F (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent tries watching tv."
			"A agent decides down laying then."
			"A agent fall.310s right asleep from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.47.V (K MAD.A)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
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
			(!W1 (?I1 PRECOND-OF ?X_B))
			(!W2 (?I2 PRECOND-OF ?X_B))
			(!W3 (?I3 PRECOND-OF ?X_B))
			(!W4 (?P1 POSTCOND-OF ?X_B))
			(!W5 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-252.PR ?X_K (KA (GET.V ?X_K)) (K MAD.A))) **
	             ?E)
		(:ROLES
			(!R1 (?X_K CAT.N))
			(!R2 (?X_L AGENT.N))
			(!R3 (NOT ((K MAD.A) AGENT.N)))
			(!R4 (NOT (?X_L = (K MAD.A))))
		)
		(:STEPS
			(?X_J (?X_L (HAVE.V ?X_K)))
			(?X_H (?X_L (LOVE.V ?X_K)))
			(?X_F (?X_L GET.47.V (K MAD.A)))
			(?X_D (?X_L ((ADV-A (FOR.P ?X_K)) LOOK.V)))
			(?X_B (?X_L (TRY.V (KA (GET.V ?X_K)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_F)))
			(!W3 (?X_J (BEFORE ?X_D)))
			(!W4 (?X_J (BEFORE ?X_B)))
			(!W5 (?X_H (BEFORE ?X_F)))
			(!W6 (?X_H (BEFORE ?X_D)))
			(!W7 (?X_H (BEFORE ?X_B)))
			(!W8 (?X_F (BEFORE ?X_D)))
			(!W9 (?X_F (BEFORE ?X_B)))
		)
	)
	(
			"A agent has a cat."
			"A agent loves a cat."
			"A agent get.312s mad."
			"A agent looks for a cat."
			"A agent tries getting a cat."
	)
)



(
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-253.PR ?X_J (KE (?X_M (PET.N ?X_A))) ?X_I ?X_L))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I WATER.N))
			(!R2 (?X_L FINGER.N))
			(!R3 (?X_J GOLDFISH.N))
			(!R4 (?X_M BROTHER.N))
			(!R5 (?X_M (PERTAIN-TO ?X_K)))
			(!R6 (?X_L (PERTAIN-TO ?X_M)))
		)
		(:STEPS
			(?X_D (?X_M (HAVE.V ?X_J)))
			(?X_F (?X_J (LET.V (KE (?X_M (PET.N ?X_A))))))
			(?X_H (?X_M (PUT.V ?X_L ?X_I)))
			(?X_B (?X_M (((ADV-A (IN.P ?X_I)) PUT.V) ?X_L)))
			(?X_O (?X_J (UP.PRT ((ADV-A (TO.P ?X_M)) SWAM.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_H)))
			(!W3 (?X_D (BEFORE ?X_B)))
			(!W4 (?X_D (BEFORE ?X_O)))
			(!W5 (?X_F (BEFORE ?X_H)))
			(!W6 (?X_F (BEFORE ?X_B)))
			(!W7 (?X_F (BEFORE ?X_O)))
			(!W8 (?X_H (BEFORE ?X_B)))
			(!W9 (?X_H (BEFORE ?X_O)))
			(!W10 (?X_B (BEFORE ?X_O)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?X_A)) CLIMB.4.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_A PARK.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?X_A = ?L2)))
			(!R5 (?X_B MALE.A))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) CLIMB.4.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?X_A)) ((ADV-A (DESTINATION_PREP.? ?L2)) CLIMB.4.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) CLIMB.4.V) ?L2))
			(?X_C (?X_B CLIMB.4.V))
			(?X_C (?X_B CLIMB.4.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? CLIMB.4.V)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (IN.P ?X_A)) PLAY.6.V)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A SAND.N))
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
			(?X_C (?X_B ((ADV-A (WITH.P ?T)) PLAY.6.V)))
			(?X_C (?X_B PLAY.6.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-254.PR
	               (ALL.D (L X (AND (X {REF}.N) (X (AROUND.P (THE.D GRASS.N))))))
	               (K (VERY.ADV HIGH.A)) ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K SAND.N))
			(!R2 (?X_L AGENT.N))
			(!R3 (?X_M AGENT.N))
			(!R4 (?X_M MALE.A))
			(!R5 (?X_N PARK.N))
			(!R6 (NOT (?X_N = ?L2)))
			(!R7 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_B (?X_L ((ADV-A (IN.P ?X_K)) PLAY.6.V)))
			(?X_J
	   (?X_L
	    (RUN.V (ALL.D (L X (AND (X {REF}.N) (X (AROUND.P (THE.D GRASS.N)))))))))
			(?X_H (?X_M CLIMB.V))
			(?X_F (?X_M ((ADV-A (FROM.P ?X_N)) CLIMB.4.V) ?L2))
			(?X_D (?X_M (SWING.V (K (VERY.ADV HIGH.A)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_J)))
			(!W2 (?X_B (BEFORE ?X_H)))
			(!W3 (?X_B (BEFORE ?X_F)))
			(!W4 (?X_B (BEFORE ?X_D)))
			(!W5 (?X_J (BEFORE ?X_H)))
			(!W6 (?X_J (BEFORE ?X_F)))
			(!W7 (?X_J (BEFORE ?X_D)))
			(!W8 (?X_H (BEFORE ?X_D)))
			(!W9 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A agent play.4s in a sand."
			"A agent runs all around."
			"A agent male climbs."
			"A agent male climb.1s a destination from a park."
			"A agent male swings very high."
	)
)



(
	(EPI-SCHEMA ((?X_B PLAY.17.V) ** ?X_E)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?X_A TOY.N))
			(!R3 (NOT (?X_A AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A FLUSH.A))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?X_C (?X_B HAVE.V ?X_A))
		)
		(:POSTCONDS
			(?P1 (?X_B EXPERIENCE.V (K PLEASURE.N)))
		)
		(:PARAPHRASES
			(?X_E (?X_B ((ADV-A (WITH.P ?X_A)) PLAY.17.V)))
			(?X_E (?X_B PLAY.17.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
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
	(EPI-SCHEMA ((?X_B PLAY.18.V) ** ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?X_A TOY.N))
			(!R3 (NOT (?X_A AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A FLUSH.A))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?X_E (?X_B HAVE.V ?X_A))
		)
		(:POSTCONDS
			(?P1 (?X_B EXPERIENCE.V (K PLEASURE.N)))
		)
		(:PARAPHRASES
			(?X_C (?X_B ((ADV-A (WITH.P ?X_A)) PLAY.18.V)))
			(?X_C (?X_B PLAY.18.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
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
	(EPI-SCHEMA ((?X_A GET.48.V
	              (K
	               (L X
	                (AND (X (PASV CALL.V)) (X (WITH.P (TWO.D (PLUR PAIR.N))))))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2
	   (NOT
	    ((K (L X (AND (X (PASV CALL.V)) (X (WITH.P (TWO.D (PLUR PAIR.N)))))))
	     AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4
	   (NOT
	    (?X_A =
	     (K (L X (AND (X (PASV CALL.V)) (X (WITH.P (TWO.D (PLUR PAIR.N))))))))))
		)
		(:GOALS
			(?G1
	   (?X_A
	    (WANT.V
	     (THAT
	      (?X_A
	       (HAVE.V
	        (K
	         (L X (AND (X (PASV CALL.V)) (X (WITH.P (TWO.D (PLUR PAIR.N)))))))))))))
		)
		(:PRECONDS
			(?I1
	   (NOT
	    (?X_A HAVE.V
	     (K (L X (AND (X (PASV CALL.V)) (X (WITH.P (TWO.D (PLUR PAIR.N))))))))))
			(?I2 (?X_A (AT.P ?L)))
			(?I3
	   ((K (L X (AND (X (PASV CALL.V)) (X (WITH.P (TWO.D (PLUR PAIR.N)))))))
	    (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1
	   (?X_A HAVE.V
	    (K (L X (AND (X (PASV CALL.V)) (X (WITH.P (TWO.D (PLUR PAIR.N)))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A PLAY.19.V (K POKER.N)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT ((K POKER.N) AGENT.N)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT ((K POKER.N) EXIST.V)))))
			(?G2 (?X_A (WANT.V (KA (HAVE.V (K POKER.N))))))
		)
		(:PRECONDS
			(?I1 (NOT ((K POKER.N) EXIST.V)))
		)
		(:POSTCONDS
			(?P1 ((K POKER.N) EXIST.V))
			(?P2 (?X_A (HAVE.V (K POKER.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-255.PR ?X_J (ALL.D IN.P) ?X_C
	               (K
	                (L X
	                 (AND (X (PASV CALL.V)) (X (WITH.P (TWO.D (PLUR PAIR.N)))))))
	               (K POKER.N)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C HAND.N))
			(!R2 (?X_J FLUSH.A))
			(!R3 (NOT ((K POKER.N) AGENT.N)))
			(!R4 (?X_M MAN.N))
			(!R5
	   (NOT
	    ((K (L X (AND (X (PASV CALL.V)) (X (WITH.P (TWO.D (PLUR PAIR.N)))))))
	     AGENT.N)))
			(!R6
	   (NOT
	    (?X_M =
	     (K (L X (AND (X (PASV CALL.V)) (X (WITH.P (TWO.D (PLUR PAIR.N))))))))))
		)
		(:STEPS
			(?X_L (?X_M PLAY.17.V))
			(?X_L (?X_M PLAY.18.V))
			(?X_L (?X_M PLAY.19.V (K POKER.N)))
			(?X_I (?X_M (HAVE.V ?X_J)))
			(?X_G (?X_M (GO.V (ALL.D IN.P))))
			(?X_E
	   (?X_M GET.48.V
	    (K (L X (AND (X (PASV CALL.V)) (X (WITH.P (TWO.D (PLUR PAIR.N)))))))))
			(?X_B (?X_M (WIN.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_I)))
			(!W2 (?X_L (BEFORE ?X_E)))
			(!W3 (?X_I (BEFORE ?X_E)))
			(!W4 (?X_G (BEFORE ?X_B)))
		)
	)
	(
			"A man play.8s."
			"A man play.9s."
			"A man play.12s poker."
			"A man has a flush."
			"A man goes all in."
			"A man get.11s PASV calls with."
			"A man wins a hand."
	)
)



(
	(EPI-SCHEMA ((?X_C (CAN.AUX PLAY.9.V)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C BOY.N))
			(!R2 (?X_B DOLL.N))
			(!R3 (NOT (?X_B AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_C PLAY.N))
			(!R7 (?X_B BIG.A))
			(!R8 (?X_A BABY.N))
			(!R9 (?X_A (HAS.V ?X_B)))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?X_B))
		)
		(:POSTCONDS
			(?P1 (?X_C EXPERIENCE.V (K PLEASURE.N)))
		)
		(:PARAPHRASES
			(?X_D (?X_C ((ADV-A (WITH.P ?X_B)) PLAY.9.V)))
			(?X_D (?X_C PLAY.9.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_B (CAN.AUX PLAY.20.V)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B BOY.N))
			(!R2 (?X_A TOY.N))
			(!R3 (NOT (?X_A AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_B PLAY.N))
			(!R7 (?X_A BALL.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_B HAVE.V ?X_A))
		)
		(:POSTCONDS
			(?P1 (?X_B EXPERIENCE.V (K PLEASURE.N)))
		)
		(:PARAPHRASES
			(?X_C (?X_B ((ADV-A (WITH.P ?X_A)) PLAY.20.V)))
			(?X_C (?X_B PLAY.20.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (AT-ABOUT ?X_D)))
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
	(EPI-SCHEMA ((?X_A ((MAY.AUX TAKE.23.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A BOY.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_A PLAY.N))
			(!R6 (?X_B BALL.N))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ((CAN.AUX PLAY.21.V) (K BALL.N))) ** ?X_B)
		(:ROLES
			(!R1 (?X_A BOY.N))
			(!R2 (NOT ((K BALL.N) AGENT.N)))
			(!R3 (?X_A PLAY.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT ((K BALL.N) EXIST.V)))))
			(?G2 (?X_A (WANT.V (KA (HAVE.V (K BALL.N))))))
		)
		(:PRECONDS
			(?I1 (NOT ((K BALL.N) EXIST.V)))
		)
		(:POSTCONDS
			(?P1 ((K BALL.N) EXIST.V))
			(?P2 (?X_A (HAVE.V (K BALL.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_P (COMPOSITE-SCHEMA-256.PR ?X_P ?X_N ?X_E ?X_Q (K BALL.N))) ** ?E)
		(:ROLES
			(!R1 (?X_E BALL.N))
			(!R2 (?X_N BABY.N))
			(!R3 (?X_F AGENT.N))
			(!R4 (?X_E (PERTAIN-TO ?X_F)))
			(!R5 (?X_K MAN.N))
			(!R6 (?X_O BIG.A))
			(!R7 (?X_O DOLL.N))
			(!R8 (?X_N (HAS.V ?X_O)))
			(!R9 (NOT ((K BALL.N) AGENT.N)))
			(!R10 (?X_P BOY.N))
			(!R11 (?X_P PLAY.N))
			(!R12 (NOT (?X_Q AGENT.N)))
			(!R13 (NOT (?X_P = ?X_Q)))
			(!R14 (?X_Q BALL.N))
		)
		(:STEPS
			(?X_M (?X_P (CAN.AUX PLAY.9.V)))
			(?X_M (?X_P (CAN.AUX PLAY.20.V)))
			(?X_M (?X_P ((CAN.AUX PLAY.21.V) (K BALL.N))))
			(?X_J (?X_K ((MAY.AUX SEE.V) ?X_P)))
			(?X_H (?X_P ((MAY.AUX TAKE.23.V) ?X_Q)))
			(?X_D (?X_F ((CAN.AUX SEE.V) ?X_N)))
			(?X_B (?X_N ((MAY.AUX HAVE.V) ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_D)))
			(!W3 (?X_J (BEFORE ?X_B)))
			(!W4 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A boy play play.24s can."
			"A boy play play.21s can."
			"A boy play play.38s ball can."
			"A man sees a boy play may."
			"A boy play take.32s a ball may."
			"A agent sees a baby has a big doll can."
			"A baby has a big doll has a ball of a agent may."
	)
)



(
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.2.V (KA (HUNT.N (K (PLUR BUG.N))))) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((KA (HUNT.N (K (PLUR BUG.N)))) ACTION.N))
			(!R3 (?X_B (IS.V ?X_A)))
			(!R4 (?X_A CAT.N))
		)
		(:PRECONDS
			(?I1 (?X_B (THINK.V (THAT ((KA (HUNT.N (K (PLUR BUG.N)))) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_C (?X_B (WANT.V (KA (HUNT.N (K (PLUR BUG.N)))))))
			(?X_C (?X_B (LIKE.V (KA (HUNT.N (K (PLUR BUG.N)))))))
			(?X_C (?X_B (LOVE.V (KA (HUNT.N (K (PLUR BUG.N)))))))
			(?X_C (?X_B (ENJOY.V (KA (HUNT.N (K (PLUR BUG.N)))))))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-257.PR ?X_F (KA (HUNT.N (K (PLUR BUG.N))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F (ON.P (K (L X (AND (X TOP.N) (X (OF.P ?X_E))))))))
			(!R2 (?X_F FLY.N))
			(!R3 (?X_I CAT.N))
			(!R4 (?X_J (IS.V ?X_I)))
			(!R5 (?X_J AGENT.N))
			(!R6 ((KA (HUNT.N (K (PLUR BUG.N)))) ACTION.N))
		)
		(:STEPS
			(?X_C ((ADV-E (DURING (K YESTERDAY.N))) (?X_A (BE.V ?X_F))))
			(?X_H (?X_J ENJOY_ACTION.2.V (KA (HUNT.N (K (PLUR BUG.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C BEFORE ?X_H))
		)
	)
	(
			"X_A is a on top of fly DURING yesterday."
			"A agent is a cat enjoy action.49s hunt bugs."
	)
)



(
	(EPI-SCHEMA ((?X_A FEED.1.V ?X_B ?F) ** ?X_C)
		(:ROLES
			(!R1 (?X_A BIRD.N))
			(!R2 (?X_B AGENT.N))
			(!R3 (?F FOOD.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (NOT (?X_B = ?F)))
			(!R6 (NOT (?X_A = ?F)))
			(!R7 (?X_A MOTHER.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (NOT (?X_B HUNGRY.A))))))
			(?G2 (?X_A (WANT.V (THAT (?X_B EAT.V ?F)))))
		)
		(:PRECONDS
			(?I1 (?X_A HAVE.V ?F))
			(?I2 (?X_B HUNGRY.A))
		)
		(:STEPS
			(?E1 (?X_B EAT.V ?F))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (HAVE.V ?F))))
			(?P2 (NOT (?X_B HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 AFTER ?X_C))
			(!W2 (?X_C (AFTER ?X_D)))
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
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-258.PR ?X_C ?F)) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_D = ?X_C)))
			(!R3 (NOT (?X_C = ?F)))
			(!R4 (NOT (?X_D = ?F)))
			(!R5 (?F FOOD.N))
			(!R6 (?X_D MOTHER.N))
			(!R7 (?X_D BIRD.N))
		)
		(:STEPS
			(E116.SK (?X_D FEED.1.V ?X_C ?F))
		)
	)
	(
			"A mother bird feed.54s a agent a food."
	)
)



(
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-259.PR ?X_O ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_D ORANGE.N))
			(!R2 (?X_E HEAD.N))
			(!R3 (?X_O GIRL.N))
			(!R4 (?X_J TREE.N))
			(!R5 (?X_M ORANGE.N))
			(!R6 (?X_N NOSE.N))
			(!R7 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_C (?X_D ((ADV-A (FROM.P ?X_J)) FALL.V)))
			(?X_G (?X_D (((ADV-A (ON.P ?X_E)) HIT.V) ?X_O)))
			(?X_I (?X_O (UP.PRT ((ADV-A (AT.P ?X_J)) LOOK.V))))
			(?X_L ((ANOTHER.D ORANGE.N) ((ADV-A (FROM.P ?X_J)) FALL.V)))
			(?X_A (?X_M (BREAK.V ?X_N)))
			(?X_Q (?X_M (BREAK.V ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_G)))
			(!W2 (?X_C (BEFORE ?X_I)))
			(!W3 (?X_C (BEFORE ?X_L)))
			(!W4 (?X_C (BEFORE ?X_A)))
			(!W5 (?X_C (BEFORE ?X_Q)))
			(!W6 (?X_G (BEFORE ?X_I)))
			(!W7 (?X_G (BEFORE ?X_L)))
			(!W8 (?X_G (BEFORE ?X_A)))
			(!W9 (?X_G (BEFORE ?X_Q)))
			(!W10 (?X_I (BEFORE ?X_L)))
			(!W11 (?X_I (BEFORE ?X_A)))
			(!W12 (?X_I (BEFORE ?X_Q)))
			(!W13 (?X_L (BEFORE ?X_A)))
			(!W14 (?X_L (BEFORE ?X_Q)))
			(!W15 (?X_A (BEFORE ?X_Q)))
		)
	)
	(
			"A orange falls from a tree."
			"A orange hits a girl on a head."
			"A girl looks up at a tree."
			"Another orange falls from a tree."
			"A orange breaks a nose of a girl."
			"A orange breaks a nose of a girl."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.57.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B PARK.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B DESTINATION.N))
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.57.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.57.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.57.V) ?X_B))
			(?X_C (?X_A GO.57.V))
			(?X_C (?X_A GO.57.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.57.V)))
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
	(EPI-SCHEMA ((?X_C TAKE.24.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_B PARK.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D PICTURE.N))
			(!R6 (?X_A BEAUTIFUL.A))
			(!R7 (?X_D (OF.P ?X_A)))
			(!R8 (?X_A WOMAN.N))
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
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?I2 PRECOND-OF ?X_E))
			(!W3 (?I3 PRECOND-OF ?X_E))
			(!W4 (?P1 POSTCOND-OF ?X_E))
			(!W5 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-260.PR ?X_F ?X_H)) ** ?E)
		(:ROLES
			(!R1 (?X_E WOMAN.N))
			(!R2 (?X_E BEAUTIFUL.A))
			(!R3 (?X_H (OF.P ?X_E)))
			(!R4 (?X_F DESTINATION.N))
			(!R5 (?X_F PARK.N))
			(!R6 (?X_H PICTURE.N))
			(!R7 (?X_G MAN.N))
			(!R8 (NOT (?X_H AGENT.N)))
			(!R9 (NOT (?X_G = ?X_H)))
		)
		(:STEPS
			(?X_D (?X_G ((ADV-A (FROM.P ?L1)) GO.57.V) ?X_F))
			(?X_B (?X_G TAKE.24.V ?X_H))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A man go.92s a destination park from L1."
			"A man take.93s a picture of a woman beautiful."
	)
)



(
	(EPI-SCHEMA ((?X_C PLAY.22.V) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_B TOY.N))
			(!R3 (NOT (?X_B AGENT.N)))
			(!R4 (?X_A GAME.N))
			(!R5 (NOT (?X_A AGENT.N)))
			(!R6 (?X_A (PLUR GAME.N)))
			(!R7 (?X_B HOUSE.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V (KA (EXPERIENCE.V (K PLEASURE.N))))))
		)
		(:PRECONDS
			(?I1 (?X_C HAVE.V ?X_B))
		)
		(:POSTCONDS
			(?P1 (?X_C EXPERIENCE.V (K PLEASURE.N)))
		)
		(:PARAPHRASES
			(?X_D (?X_C ((ADV-A (WITH.P ?X_B)) PLAY.22.V)))
			(?X_D (?X_C PLAY.22.V ?X_A))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_E)))
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
	(EPI-SCHEMA ((?X_A PLAY.23.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_B (PLUR GAME.N)))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-261.PR (ALL.D DAY.N) ?X_J ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_E DAY.N))
			(!R2 (?X_E LONG.A))
			(!R3 (?X_J HOUSE.N))
			(!R4 (?X_M AGENT.N))
			(!R5 (NOT (?X_N AGENT.N)))
			(!R6 (?X_N (PLUR GAME.N)))
		)
		(:STEPS
			(?X_L ((ADV-E (DURING (K YESTERDAY.N))) (?X_A (RAIN.V (ALL.D DAY.N)))))
			(?X_B (?X_M (IN.P ?X_J)))
			(?X_I (?X_M ((ADV-A (FOR.P (KA (GET.V (KJ (VERY.ADV BORED.A)))))) START.V)))
			(?X_D ((ADV-E (DURING ?X_E)) (?X_A BE.V)))
			(?X_G (?X_M PLAY.22.V))
			(?X_G (?X_M PLAY.23.V ?X_N))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_B)))
			(!W2 (?X_L (BEFORE ?X_I)))
			(!W3 (?X_L (BEFORE ?X_D)))
			(!W4 (?X_B (BEFORE ?X_I)))
			(!W5 (?X_B (BEFORE ?X_D)))
			(!W6 (?X_I (BEFORE ?X_D)))
		)
	)
	(
			"X_A rains all day DURING yesterday."
			"A agent is in."
			"A agent starts for getting KJ very bored."
			"X_A is DURING a day long."
			"A agent play.112s."
			"A agent play.118s a games."
	)
)



(
	(EPI-SCHEMA ((?X_A TAKE.25.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B TURN.N))
			(!R6 (?X_B SHARP.A))
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_C (AT-ABOUT ?X_D)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



))
; got 626 schemas (364 protoschema matches, 262 stories)
