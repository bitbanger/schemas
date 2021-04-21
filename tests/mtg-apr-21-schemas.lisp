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
			(!R4 (?X_J TIRED.A))
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
			"A tired is of."
			"A tired meets a man with a lot of money."
			"A tired marries a man."
			"A tired works must again never."
			"A tired enjoy action.4s stopping work."
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
			"A girl play.10s."
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.2.V
	              (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)) ACTION.N))
			(!R3 ((K (L X (AND (X FATHER.N) (X |'S|)))) (PERTAIN-TO ?X_A)))
			(!R4 (?X_C GRILL.N))
			(!R5 (?X_C NEW.A))
			(!R6 (?X_C NICE.A))
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
			(!W1 (?X_D (SAME-TIME ?X_G)))
			(!W2 (?X_D (RIGHT-AFTER ?X_E)))
			(!W3 (?X_F (BEFORE ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.3.V
	              (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)) ACTION.N))
			(!R3 (?X_C NICE.A))
			(!R4 (?X_C NEW.A))
			(!R5 (?X_C GRILL.N))
			(!R6 ((K (L X (AND (X FATHER.N) (X |'S|)))) (PERTAIN-TO ?X_A)))
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.4.V
	              (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)) ACTION.N))
			(!R3 ((K (L X (AND (X FATHER.N) (X |'S|)))) (PERTAIN-TO ?X_A)))
			(!R4 (?X_C NEW.A))
			(!R5 (?X_C GRILL.N))
			(!R6 (?X_C NICE.A))
		)
		(:PRECONDS
			(?I1
	   (?X_A
	    (THINK.V
	     (THAT ((KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_E (?X_A (WANT.V (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)))))
			(?X_E (?X_A (LIKE.V (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)))))
			(?X_E (?X_A (LOVE.V (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)))))
			(?X_E
	   (?X_A (ENJOY.V (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_C)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (RIGHT-AFTER ?X_D)))
			(!W2 (?X_E (SAME-TIME ?X_G)))
			(!W3 (?X_F (BEFORE ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C STORE.N))
			(!R6 ((K (L X (AND (X FATHER.N) (X |'S|)))) (PERTAIN-TO ?X_B)))
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-5.PR
	               (KE ((K (L X (AND (X FATHER.N) (X |'S|)))) DAY.N))
	               (KE (?X_L NEW.A GRILL.N))
	               (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_J)) ?X_G))
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
			(?X_D (?X_L ?X_J GRILL.N))
			(?X_I
	   (?X_L ENJOY_ACTION.3.V
	    (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_J))))
			(?X_B
	   (?X_L ENJOY_ACTION.2.V
	    (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_J))))
			(?X_B
	   (?X_L ENJOY_ACTION.4.V
	    (KA (GET.V (K (L X (AND (X FATHER.N) (X |'S|)))) ?X_J))))
			(?X_F (?X_L ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_G))
			(?X_A
	   ((K (L X (AND (X FATHER.N) (X |'S|)))) (LOVE.V (KE (?X_L NEW.A GRILL.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_D)))
			(!W2 (?X_N (BEFORE ?X_A)))
			(!W3 (?X_D (BEFORE ?X_A)))
			(!W4 (?X_I (BEFORE ?X_B)))
			(!W5 (?X_I (BEFORE ?X_F)))
			(!W6 (?X_B (BEFORE ?X_F)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-6.PR (K (L X (AND (X GOOD.A) (X (TO.P ?X_N)))))
	               ?X_K ?X_M))
	             ** ?E)
		(:ROLES
			(!R1 (?X_N WOMAN.N))
			(!R2 (?X_K MAN.N))
			(!R3 (?X_L WAY.N))
			(!R4 (?X_L HOME.N))
			(!R5 (?X_M NUMBER.N))
			(!R6 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_F (?X_N (KISS.V ?X_K)))
			(?X_H (?X_A (FEEL.V (K (L X (AND (X GOOD.A) (X (TO.P ?X_N))))))))
			(?X_D (?X_N (GIVE.V ?X_K ?X_M)))
			(?X_J (?X_N (GIVE.V ?X_K ?X_M)))
			(?X_P (?X_K (((ADV-A (ON.P ?X_L)) LOSE.V) ?X_M)))
			(?X_R (?X_C (AGAIN.ADV MEET.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_H)))
			(!W2 (?X_F (BEFORE ?X_D)))
			(!W3 (?X_F (BEFORE ?X_J)))
			(!W4 (?X_F (BEFORE ?X_P)))
			(!W5 (?X_F (BEFORE ?X_R)))
			(!W6 (?X_H (BEFORE ?X_D)))
			(!W7 (?X_H (BEFORE ?X_J)))
			(!W8 (?X_H (BEFORE ?X_P)))
			(!W9 (?X_H (BEFORE ?X_R)))
			(!W10 (?X_D (BEFORE ?X_J)))
			(!W11 (?X_D (BEFORE ?X_P)))
			(!W12 (?X_D (BEFORE ?X_R)))
			(!W13 (?X_J (BEFORE ?X_P)))
			(!W14 (?X_J (BEFORE ?X_R)))
			(!W15 (?X_P (BEFORE ?X_R)))
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.5.V ?X_B (KA (MAKE.V ?X_C))) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((KA (MAKE.V ?X_C)) ACTION.N))
			(!R3 (?X_A SNOW.N))
			(!R4 (?X_C SNOWMAN.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V ?X_B (KA (MAKE.V ?X_C)))))
			(?G2 (?X_B (WANT.V (THAT (?X_B (MAKE.V ?X_C))))))
		)
		(:STEPS
			(?E1 (?X_B (ASK.V ?X_B (KA (MAKE.V ?X_C)))))
			(?X_F (?X_B (MAKE.V ?X_C)))
		)
		(:PARAPHRASES
			(?X_D (?X_B (ASK.V ?X_B (KA (MAKE.V ?X_C)))))
			(?X_D (?X_B (TELL.V ?X_B (KA (MAKE.V ?X_C)))))
			(?X_D (?X_B (((ADV-A (IN.P ?X_A)) MAKE.V) ?X_B (KA (MAKE.V ?X_C)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?X_F))
			(!W3 (?X_D (AT-ABOUT ?X_E)))
			(!W4 (?X_F (AT-ABOUT ?X_G)))
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.6.V ?X_B (KA (MAKE.V ?X_C))) ** ?X_F)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((KA (MAKE.V ?X_C)) ACTION.N))
			(!R3 (?X_C SNOWMAN.N))
			(!R4 (?X_A SNOW.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V ?X_B (KA (MAKE.V ?X_C)))))
			(?G2 (?X_B (WANT.V (THAT (?X_B (MAKE.V ?X_C))))))
		)
		(:STEPS
			(?E1 (?X_B (ASK.V ?X_B (KA (MAKE.V ?X_C)))))
			(?X_D (?X_B (MAKE.V ?X_C)))
		)
		(:PARAPHRASES
			(?X_F (?X_B (ASK.V ?X_B (KA (MAKE.V ?X_C)))))
			(?X_F (?X_B (TELL.V ?X_B (KA (MAKE.V ?X_C)))))
			(?X_F (?X_B (((ADV-A (IN.P ?X_A)) MAKE.V) ?X_B (KA (MAKE.V ?X_C)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?X_D))
			(!W3 (?X_D (AT-ABOUT ?X_E)))
			(!W4 (?X_F (AT-ABOUT ?X_G)))
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
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-8.PR (KA ((ADV-A (IN.P ?X_K)) PLAY.V)) ?X_A
	               (KA (MAKE.V ?X_D)) ?O ?X_D))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D SNOWMAN.N))
			(!R2 (?X_K SNOW.N))
		)
		(:STEPS
			(?X_J (?X_A (LIKE.V (KA ((ADV-A (IN.P ?X_K)) PLAY.V)))))
			(?X_H (?X_A (OUTSIDE.ADV GO.V)))
			(?X_F (?X_A REQUEST_ACTION.5.V ?X_A (KA (MAKE.V ?X_D))))
			(?X_F (?X_A REQUEST_ACTION.6.V ?X_A (KA (MAKE.V ?X_D))))
			(?X_F (?X_A ((ADV-A (IN.P ?X_K)) PLAY.3.V)))
			(?X_F (?X_A (((ADV-A (IN.P ?X_K)) PLAY.4.V) ?O)))
			(?X_C (?X_A PLAY.2.V))
			(?X_C (?X_A MAKE.1.V ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_F)))
			(!W3 (?X_J (BEFORE ?X_C)))
			(!W4 (?X_H (BEFORE ?X_F)))
			(!W5 (?X_H (BEFORE ?X_C)))
			(!W6 (?X_F (BEFORE ?X_C)))
		)
	)
	(
			"X_A likes in a snow playing."
			"X_A goes outside."
			"X_A request action.76s X_A making a snowman."
			"X_A request action.77s X_A making a snowman."
			"X_A play.78s in a snow."
			"X_A play.81s O in a snow."
			"X_A play.79s."
			"X_A make.80s a snowman."
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.7.V ?X_B ?A) ** ?X_C)
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.8.V ?X_C ?A) ** ?X_D)
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.9.V ?X_C ?A) ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_C ANIMAL.N))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-10.PR (K CLOSER.A) ?X_O ?X_C ?X_K ?A ?X_H))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C FOX.N))
			(!R2 (?X_H FUNNY.A))
			(!R3 (?X_H SOUND.N))
			(!R4 (?X_K ANIMAL.N))
			(!R5 (?X_N (PLUR WOOD.N)))
			(!R6 (?X_O AGENT.N))
		)
		(:STEPS
			(?X_M (?X_O REQUEST_ACTION.7.V ?X_O ?A))
			(?X_M (?X_O REQUEST_ACTION.8.V ?X_C ?A))
			(?X_M (?X_O REQUEST_ACTION.9.V ?X_K ?A))
			(?X_J (?X_O (HEAR.V ?X_K)))
			(?X_G (?X_K MAKE.2.V ?X_H))
			(?X_E (?X_O (GET.V (K CLOSER.A))))
			(?X_B (?X_K (OUT.PRT ((ADV-A (FOR.P (KA (BE.V ?X_C)))) TURN.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_G)))
			(!W2 (?X_J (BEFORE ?X_E)))
			(!W3 (?X_J (BEFORE ?X_B)))
			(!W4 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A agent request action.97s a agent A."
			"A agent request action.98s a fox A."
			"A agent request action.99s a animal A."
			"A agent hears a animal."
			"A animal make.93s a funny sound."
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-11.PR (K (PLUR CV.N)) ?X_C)) ** ?E)
		(:ROLES
			(!R1 (?X_C CANDY.N))
			(!R2 (?X_F AGENT.N))
		)
		(:STEPS
			(?X_E (?X_F ((ADV-A (FROM.P ?L1)) GO.2.V) (K (PLUR CV.N))))
			(?X_B (?X_F GET.1.V ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A agent go.110s cvs from L1."
			"A agent get.109s a candy."
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-12.PR ?X_M ?X_L (K LOST.A))) ** ?E)
		(:ROLES
			(!R1 (?X_G MAN.N))
			(!R2 (?X_M MOM.N))
			(!R3 (?X_L BOY.N))
			(!R4 (?X_M (PERTAIN-TO ?X_L)))
			(!R5 (?X_N MALE.A))
			(!R6 (?X_N AGENT.N))
			(!R7 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_I (?X_L (TO.P ?X_M)))
			(?X_D (?X_G ?X_L (TO.P ?X_M)))
			(?X_K (?X_L GET.4.V (K LOST.A)))
			(?X_A (?X_L ((ADV-A (TO.P ?X_M)) CALL.V)))
			(?X_F (?X_L ((ADV-A (INTO.P ?X_G)) RUN.V)))
			(?X_B (?X_G (((ADV-A (TO.P ?X_M)) BRING.V) ?X_L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_A)))
			(!W2 (?X_I (BEFORE ?X_F)))
			(!W3 (?X_I (BEFORE ?X_B)))
			(!W4 (?X_D (BEFORE ?X_B)))
			(!W5 (?X_K (BEFORE ?X_A)))
			(!W6 (?X_K (BEFORE ?X_F)))
			(!W7 (?X_K (BEFORE ?X_B)))
			(!W8 (?X_A (BEFORE ?X_F)))
			(!W9 (?X_A (BEFORE ?X_B)))
			(!W10 (?X_F (BEFORE ?X_B)))
		)
	)
	(
			"A boy is to."
			"A man is to."
			"A boy get.117s lost."
			"A boy calls to a mom of a boy of a male agent."
			"A boy runs into a man."
			"A man brings a boy to a mom of a boy of a male agent."
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
			"X_A take.166s O for to a vet skipping."
	)
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
	(EPI-SCHEMA ((?X_B (((ADV-A (FROM.P ?X_A)) RUN.1.V) ?L2)) ** ?X_C)
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.1.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?X_A)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.1.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.1.V) ?L2))
			(?X_C (?X_B (LOCATION_ADV.? RUN.1.V)))
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
			(?X_B (?X_D (((ADV-A (FROM.P ?X_C)) RUN.1.V) ?L2)))
		)
	)
	(
			"A hare run.177s L2 from a dog."
	)
)



(
	(EPI-SCHEMA ((?X_J
	              (COMPOSITE-SCHEMA-17.PR (K ASLEEP.A) (K (UP.ADV (TO.P ?X_J))) ?X_J))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E MAN.N))
			(!R2 (?X_J COW.N))
		)
		(:STEPS
			(?X_B (?X_J (FALL.V (K ASLEEP.A))))
			(?X_D (?X_E (GO.V (K (UP.ADV (TO.P ?X_J))))))
			(?X_G (?X_E (PUSH.V ?X_J)))
			(?X_I (?X_J (OVER.PRT FALL.V)))
			(?X_L (?X_J DIE.V))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_D)))
			(!W2 (?X_B (BEFORE ?X_G)))
			(!W3 (?X_B (BEFORE ?X_I)))
			(!W4 (?X_B (BEFORE ?X_L)))
			(!W5 (?X_D (BEFORE ?X_G)))
			(!W6 (?X_D (BEFORE ?X_I)))
			(!W7 (?X_D (BEFORE ?X_L)))
			(!W8 (?X_G (BEFORE ?X_I)))
			(!W9 (?X_G (BEFORE ?X_L)))
			(!W10 (?X_I (BEFORE ?X_L)))
		)
	)
	(
			"A cow falls asleep."
			"A man goes up to a cow."
			"A man pushes a cow."
			"A cow falls over."
			"A cow dies."
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
	              (COMPOSITE-SCHEMA-18.PR (K GONE.A) ?X_M
	               (KA ((ADV-A (FOR.P ?X_M)) LOOK.V))))
	             ** ?E)
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
			(?X_J (?X_O ((AWAY.ADV PUT.V) ?X_M)))
			(?X_G ((ADV-E (DURING ?X_H)) (?X_M (BE.V (K GONE.A)))))
			(?X_C (?X_N (REFOLD.V ?X_M)))
			(?X_E
	   (?X_O ((ADV-A (FROM.P ?L1)) GO.3.V) (KA ((ADV-A (FOR.P ?X_M)) LOOK.V))))
			(?X_A (?X_N (REFOLD.V ?X_M)))
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
			"A man go.190s for a clothes looking from L1."
			"A wife of a man refolds a clothes."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-19.PR ?X_B)) ** ?E)
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
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-20.PR) ** ?E)
		(:ROLES
			(!R1 (?X_A DOG.N))
			(!R2 (?X_D (PLUR DOG.N)))
		)
		(:STEPS
			(?X_C (?X_A RUN.V))
			(?X_F (?X_D RUN.V))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_F)))
		)
	)
	(
			"A dog runs."
			"A dogs run."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-21.PR ?X_B)) ** ?E)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.4.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_A (PLUR GIRL.N)))
			(!R6 (?X_B POND.N))
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
			(!R6 (?X_A (PLUR GIRL.N)))
			(!R7 (?X_B FROG.N))
			(!R8 (?X_B GIANT.A))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (AT.P ?X_F)) TAKE.2.V) ?X_B)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-22.PR (K ((ADV-A (FOR.P ?X_C)) (WITH.P ?X_P)))
	               ?X_O ?X_L))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C MONTH.N))
			(!R2 (?X_G BUCKET.N))
			(!R3 (?X_L GIANT.A))
			(!R4 (?X_L FROG.N))
			(!R5 (?X_O POND.N))
			(!R6 (?X_P (PLUR GIRL.N)))
		)
		(:STEPS
			(?X_N (?X_P ((ADV-A (FROM.P ?L1)) GO.4.V) ?X_O))
			(?X_K (?X_P (CATCH.V ?X_L)))
			(?X_E (?X_P (((ADV-A (IN.P ?X_G)) PUT.1.V) ?X_L)))
			(?X_I (?X_P (((ADV-A (AT.P ?X_F)) TAKE.2.V) ?X_L)))
			(?X_B (?X_L (LIVE.V (K ((ADV-A (FOR.P ?X_C)) (WITH.P ?X_P))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_K)))
			(!W2 (?X_N (BEFORE ?X_E)))
			(!W3 (?X_N (BEFORE ?X_I)))
			(!W4 (?X_N (BEFORE ?X_B)))
			(!W5 (?X_K (BEFORE ?X_E)))
			(!W6 (?X_K (BEFORE ?X_I)))
			(!W7 (?X_K (BEFORE ?X_B)))
			(!W8 (?X_E (BEFORE ?X_B)))
			(!W9 (?X_I (BEFORE ?X_B)))
		)
	)
	(
			"A girls go.250 a pond from L1."
			"A girls catch a giant frog."
			"A girls put.241 a giant frog in a bucket."
			"A girls take.247 a giant frog at X_F."
	)
)



(
	(EPI-SCHEMA ((?X_D
	              (COMPOSITE-SCHEMA-23.PR (KE (?X_E (VERY.ADV UNCOMFORTABLE.A)))
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
	              (COMPOSITE-SCHEMA-24.PR (KE (?X_I FUNNY.A)) ?X_C
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
			"A girl watch.4s a doll on fire burns."
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
			(!R6 (?X_D (PLUR BOX.N)))
			(!R7
	   (?X_D
	    (ARE.V (KE ((K (L X (AND (X GOOD.A) (X (PLUR HOUSE.N))))) (FOR.P ?X_B))))))
			(!R8 (?X_C (HAS.V (SET-OF (TWO.D (PLUR FOX.N)) (TWO.D (PLUR BOX.N))))))
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
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-25.PR (SET-OF ?X_K ?X_J) (EACH.D FOX.N) ?X_A
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
			(?X_D (?X_O (((ADV-A (IN.P ?X_E)) PUT.2.V) (K HAY.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_G)))
		)
	)
	(
			"A agent sees a fox on X_L and a in front of fox."
			"A has two foxs and two boxs gives each fox X_A."
			"A has two foxs and two boxs put.15s hay in a are good house for a foxs of a has two foxs and two boxs boxs."
	)
)



(
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-26.PR (KE (?X_E FUNNY.A)) ?X_H (K PINK.A)
	               (KA ((ADV-A (WITH.P (K PINK.A))) PLAY.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_B HOUSE.N))
			(!R2 (?X_E THING.N))
			(!R3 (?X_H (K PINK.A) BALL.N))
			(!R4 (?X_H (ON.P ?X_I)))
			(!R5 (?X_N CAT.N))
		)
		(:STEPS
			(?X_D (?X_N ((ADV-A (THROUGH.P ?X_B)) STROLL.V)))
			(?X_G (?X_N (FIND.V (KE (?X_E FUNNY.A)))))
			(?X_K (?X_A (BE.V ?X_H)))
			(?X_M (?X_N (SWAT.V (K PINK.A))))
			(?X_P (?X_N (LIKE.V (KA ((ADV-A (WITH.P (K PINK.A))) PLAY.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_G)))
			(!W2 (?X_D (BEFORE ?X_K)))
			(!W3 (?X_D (BEFORE ?X_M)))
			(!W4 (?X_D (BEFORE ?X_P)))
			(!W5 (?X_G (BEFORE ?X_K)))
			(!W6 (?X_G (BEFORE ?X_M)))
			(!W7 (?X_G (BEFORE ?X_P)))
			(!W8 (?X_K (BEFORE ?X_M)))
			(!W9 (?X_K (BEFORE ?X_P)))
			(!W10 (?X_M (BEFORE ?X_P)))
		)
	)
	(
			"A cat strolls through a house."
			"A cat finds a thing funny."
			"X_A is a on X_I."
			"A cat swats pink."
			"A cat likes with pink playing."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-27.PR (KE (?X_C (PLAY.V (K BALL.N)))))) ** ?E)
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
	(EPI-SCHEMA ((?X_B ((TOGETHER.ADV GET.7.V) ?X_C)) ** ?X_E)
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
	(EPI-SCHEMA ((?X_B ((TOGETHER.ADV GET.9.V) ?X_C)) ** ?X_D)
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-28.PR (KA ((ADV-A (TO.P ?X_A)) GO.V)))) ** ?E)
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
	              (COMPOSITE-SCHEMA-29.PR ?X_C (K (VERY.ADV HIGH.A))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-30.PR ?X_E)) ** ?E)
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
	(EPI-SCHEMA ((?X_A GET.10.V (K (BACK.ADV (IN.P ?X_B)))) ** ?X_C)
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
	(EPI-SCHEMA ((?X_A ((OUT.PRT GET.11.V) ?O)) ** ?X_B)
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
	(EPI-SCHEMA ((?X_A TAKE.3.V ?X_B) ** ?X_C)
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-31.PR ?X_K)) ** ?E)
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-32.PR ?X_O ?X_C ?X_J)) ** ?E)
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
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_I)))
			(!W2 (?X_L (BEFORE ?X_E)))
			(!W3 (?X_L (BEFORE ?X_B)))
			(!W4 (?X_I (BEFORE ?X_E)))
			(!W5 (?X_I (BEFORE ?X_B)))
			(!W6 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A man looks into a window of X_N."
			"A man sees a woman inside."
			"A woman notices a man for watching."
			"A woman calls a police."
			"A man watch.127s a woman."
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
	              (COMPOSITE-SCHEMA-33.PR (KE ((K MONEY.N) (FOR.P (?X_H BET.N))))
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
	              (((ADV-A (IN.P ?X_A)) GET.12.V)
	               (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H)))))
	             ** ?X_I)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2 (NOT ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))) AGENT.N)))
			(!R3 (?X_F HOME.N))
			(!R4 (NOT (?X_G = (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))))))
			(!R5 (?X_H WATER.N))
			(!R6 (?X_A BOAT.N))
			(!R7 (?X_A ROW.N))
			(!R8 (?X_G (PLUR CHILD.N)))
			(!R9 (?X_F HOUSE.N))
			(!R10 (?X_F (PERTAIN-TO ?X_D)))
			(!R11 (?X_B FATHER.N))
			(!R12 (?X_B (PERTAIN-TO ?X_D)))
			(!R13 (?X_C BOAT.N))
			(!R14 (?X_D (HAS.V ?X_C)))
			(!R15 (?X_C NEW.A))
			(!R16 (?X_D (HAS.V ?X_E)))
			(!R17 (?X_E HOOK.N))
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
			(!R5 (?X_A BOAT.N))
			(!R6 (?X_A ROW.N))
			(!R7 (?X_G (PLUR CHILD.N)))
			(!R8 (?X_H WATER.N))
			(!R9 (?X_F HOUSE.N))
			(!R10 (?X_F (PERTAIN-TO ?X_D)))
			(!R11 (?X_D (HAS.V ?X_B)))
			(!R12 (?X_B BOAT.N))
			(!R13 (?X_B NEW.A))
			(!R14 (?X_D (HAS.V ?X_C)))
			(!R15 (?X_C HOOK.N))
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
	              (((ADV-A (IN.P ?X_A)) GET.14.V)
	               (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H)))))
	             ** ?X_I)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2 (NOT ((K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))) AGENT.N)))
			(!R3 (?X_F HOME.N))
			(!R4 (NOT (?X_G = (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_H))))))
			(!R5 (?X_A ROW.N))
			(!R6 (?X_A BOAT.N))
			(!R7 (?X_G (PLUR CHILD.N)))
			(!R8 (?X_H WATER.N))
			(!R9 (?X_F HOUSE.N))
			(!R10 (?X_F (PERTAIN-TO ?X_D)))
			(!R11 (?X_D (HAS.V ?X_B)))
			(!R12 (?X_B HOOK.N))
			(!R13 (?X_C (PERTAIN-TO ?X_D)))
			(!R14 (?X_C FATHER.N))
			(!R15 (?X_E NEW.A))
			(!R16 (?X_E BOAT.N))
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
	              (COMPOSITE-SCHEMA-34.PR ?X_R ?X_P ?X_L ?X_I
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
	    (((ADV-A (IN.P ?X_G)) GET.12.V) (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_F))))))
			(?X_E
	   (?X_H
	    (((ADV-A (IN.P ?X_G)) GET.13.V) (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_F))))))
			(?X_E
	   (?X_H
	    (((ADV-A (IN.P ?X_G)) GET.14.V) (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_F))))))
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
			"A childs get.159 ADV far out on a water in a row boat."
			"A childs get.162 ADV far out on a water in a row boat."
			"A childs get.163 ADV far out on a water in a row boat."
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
			(!R3 (?X_D LOUD.A))
			(!R4 (?X_D NOISE.N))
			(!R5 (?X_A (PLUR HAND.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
			(!R7 (?X_B (PLUR EAR.N)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-35.PR ?X_H ?X_G ?X_D)) ** ?E)
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
			"A agent make.177s a loud noise."
			"A agent make.181s a loud noise."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (COMPOSITE-SCHEMA-36.PR
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
	(EPI-SCHEMA ((?X_B GET.15.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C NEW.A))
			(!R6 (?X_C DOG.N))
			(!R7 (?X_B ((CANNOT.ADV CATCH.V) ?X_C)))
			(!R8 (?X_C (PERTAIN-TO ?X_B)))
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
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-37.PR ?X_J)) ** ?E)
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
			(?X_G (?X_H GET.15.V ?X_J))
			(?X_A (?X_H (LOVE.V ?X_J)))
			(?X_E (?X_H (LOVE.V ?X_J)))
			(?X_C (?X_J (AWAY.PRT RUN.V)))
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
			"A cannot catch a new dog of a cannot catch a new dog of X_H out is X_I out is a evening walking a new dog of X_H get.207s a new dog of a cannot catch a new dog of X_H out is X_I."
			"A cannot catch a new dog of a cannot catch a new dog of X_H out is X_I out is a evening walking a new dog of X_H loves a new dog of a cannot catch a new dog of X_H out is X_I."
			"A cannot catch a new dog of a cannot catch a new dog of X_H out is X_I out is a evening walking a new dog of X_H loves a new dog of a cannot catch a new dog of X_H out is X_I."
			"A new dog of a cannot catch a new dog of X_H out is X_I runs away."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.5.V) ?X_B) ** ?X_C)
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
	    (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.5.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.5.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.5.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.5.V)))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-38.PR ?X_F ?X_C ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_C WHOLE.A))
			(!R2 (?X_C CAN.N))
			(!R3 (?X_F (PLUR ALMOND.N)))
			(!R4 (?X_F (SO.ADV GOOD.A)))
			(!R5 (?X_I STORE.N))
			(!R6 (?X_J AGENT.N))
		)
		(:STEPS
			(?X_H (?X_J ((ADV-A (FROM.P ?L1)) GO.5.V) ?X_I))
			(?X_E (?X_J (SEE.V ?X_F)))
			(?X_B (?X_J (EAT.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_E)))
			(!W2 (?X_H (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A agent go.221s a store from L1."
			"A agent sees a almonds so good."
			"A agent eats a whole can."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-39.PR ?X_B ?X_G)) ** ?E)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) WALK.1.V) ?X_B) ** ?X_C)
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
	     (OVER.PRT ((ADV-A (TO.P ?X_B)) WALK.1.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) WALK.1.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) WALK.1.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? WALK.1.V)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.6.V) (KA SLEEP.V)) ** ?X_B)
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
	     (BACK.ADV ((ADV-A (FOR.P (KA SLEEP.V))) GO.6.V)))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (KA SLEEP.V))) GO.6.V))))
			(?X_B
	   (?X_A ((ADV-A (DESTINATION_PREP.? (KA SLEEP.V))) GO.6.V) (KA SLEEP.V)))
			(?X_B (?X_A (LOCATION_ADV.? GO.6.V)))
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
	              (COMPOSITE-SCHEMA-40.PR (KE (?X_N HUNGRY.A))
	               (K (THAT.P (?X_N HUNGRY.A))) ?X_N (KA SLEEP.V)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K MOTHER.N))
			(!R2 (?X_N BABY.N))
		)
		(:STEPS
			(?X_M (?X_N ((ADV-A (FOR.P (KA CRY.V))) START.V)))
			(?X_J (?X_K ((ADV-A (FROM.P ?L1)) WALK.1.V) ?X_N))
			(?X_H (?X_K (THAT.P (KE (?X_N HUNGRY.A)))))
			(?X_F (?X_K (SEE.V (K (THAT.P (?X_N HUNGRY.A))))))
			(?X_D (?X_K (BREASTF.V ?X_N)))
			(?X_B (?X_N ((ADV-A (FROM.P ?L1)) GO.6.V) (KA SLEEP.V)))
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
			"A mother walk.241s a baby from L1."
			"A mother is that."
			"A mother sees that a baby hungry."
			"A mother breastfs a baby."
			"A baby go.243s sleeping from L1."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_A GET.16.V (K MAD.A)) ** ?X_B)
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-41.PR ?X_O ?X_A ?X_K (K MAD.A))) ** ?E)
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
			(?X_H (?X_K GET.16.V (K MAD.A)))
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
			"A woman get.253s mad."
			"A female agent likes a woman not did."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-42.PR ?X_B)) ** ?E)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_B) ** ?X_C)
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.7.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.7.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.7.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.7.V)))
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
	              (COMPOSITE-SCHEMA-43.PR (K CANDY.N) (K GREAT.A)
	               (K (L X (AND (X SOUR.A) (X CANDY.N)))) (FIVE.D (PLUR BAG.N))
	               ?X_M))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M STORE.N))
		)
		(:STEPS
			(?X_L (?X_B ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_M))
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
			"X_B go.257s a store from L1."
			"X_B sees candy on sale."
			"Candy looks great."
			"X_B gets sour candy."
			"X_B gets five bags."
	)
)



(
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-44.PR
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.10.V (KA GO.V)) ** ?X_B)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.8.V) ?X_B) ** ?X_C)
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
	    (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.8.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.8.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.8.V) ?X_B))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-45.PR (K ASLEEP.A) (KA GO.V) ?X_J)) ** ?E)
		(:ROLES
			(!R1 (?X_G HAMMOCK.N))
			(!R2 (?X_J BEACH.N))
			(!R3 (?X_K AGENT.N))
		)
		(:STEPS
			(?X_I (?X_K ((ADV-A (FROM.P ?L1)) GO.8.V) ?X_J))
			(?X_F (?X_K ((ADV-A (IN.P ?X_G)) LAY.V)))
			(?X_D (?X_K (FALL.V (K ASLEEP.A))))
			(?X_B (?X_K ENJOY_ACTION.10.V (KA GO.V)))
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
			"A agent go.264s a beach from L1."
			"A agent lays in a hammock."
			"A agent falls asleep."
			"A agent enjoy action.267s going."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.9.V) (KA (INTRODUCE.V ?X_A))) **
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
	     ((ADV-A (FOR.P (KA (INTRODUCE.V ?X_A)))) GO.9.V))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (KA (INTRODUCE.V ?X_A)))) GO.9.V))))
			(?X_B
	   (?X_A ((ADV-A (DESTINATION_PREP.? (KA (INTRODUCE.V ?X_A)))) GO.9.V)
	    (KA (INTRODUCE.V ?X_A))))
			(?X_B (?X_A (LOCATION_ADV.? GO.9.V)))
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.11.V ?X_B ?A) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B AGENT.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_B (PLUR FRIEND.N)))
			(!R5 (?X_A EXCITED.A))
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
	              (COMPOSITE-SCHEMA-46.PR
	               (KE
	                (?X_N (GET.V (K (L X (AND (X NEW.A) (X (PLUR NEIGHBOR.N))))))))
	               (K
	                (LIKE.P
	                 (?X_N
	                  (GET.V (K (L X (AND (X NEW.A) (X (PLUR NEIGHBOR.N)))))))))
	               (KA (INTRODUCE.V ?X_N)) ?A ?X_E))
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
			(?X_G (?X_N ((ADV-A (FROM.P ?L1)) GO.9.V) (KA (INTRODUCE.V ?X_N))))
			(?X_D (?X_N REQUEST_ACTION.11.V ?X_E ?A))
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
			"A excited go.270s introducing a excited from L1."
			"A excited request action.268s a friends A."
			"A excited make.271s a friends."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (COMPOSITE-SCHEMA-47.PR (K (PLUR PET.N))
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
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-48.PR (KE (?X_H THINK.V)))) ** ?E)
		(:ROLES
			(!R1 (?X_G BREATH.N))
			(!R2 (?X_H MAN.N))
			(!R3 (?X_H (MORE.ADV TIRED.A)))
			(!R4 (?X_G (PERTAIN-TO ?X_H)))
			(!R5 (?X_I BREAK.N))
		)
		(:STEPS
			(?X_A (?X_H ((ADV (VERY.ADV FAST.A)) RUN.V)))
			(?X_B (?X_H ((ADV-A (FOR.P (KA (CATCH.V ?X_G)))) STOP.V)))
			(?X_F (?X_H ((ADV-A (FOR.P (KA (CATCH.V ?X_G)))) STOP.V)))
			(?X_C (?X_H (THAN.P (KE (?X_H THINK.V)))))
			(?X_D (?X_H (THAN.P (KE (?X_H THINK.V)))))
			(?X_K (?X_H (DOWN.ADV ((ADV-A (FOR.P ?X_I)) SIT.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_B)))
			(!W2 (?X_A (BEFORE ?X_F)))
			(!W3 (?X_A (BEFORE ?X_C)))
			(!W4 (?X_A (BEFORE ?X_D)))
			(!W5 (?X_A (BEFORE ?X_K)))
			(!W6 (?X_B (BEFORE ?X_F)))
			(!W7 (?X_B (BEFORE ?X_C)))
			(!W8 (?X_B (BEFORE ?X_D)))
			(!W9 (?X_B (BEFORE ?X_K)))
			(!W10 (?X_F (BEFORE ?X_C)))
			(!W11 (?X_F (BEFORE ?X_D)))
			(!W12 (?X_F (BEFORE ?X_K)))
			(!W13 (?X_C (BEFORE ?X_D)))
			(!W14 (?X_C (BEFORE ?X_K)))
			(!W15 (?X_D (BEFORE ?X_K)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_H COMPOSITE-SCHEMA-49.PR) ** ?E)
		(:ROLES
			(!R1 (?X_G (PLUR FRIEND.N)))
			(!R2 (?X_D GROUP.N))
			(!R3 (?X_H AGENT.N))
			(!R4 (?X_G (PERTAIN-TO ?X_H)))
		)
		(:STEPS
			(?X_C ((SET-OF ?X_G ?X_H) RUN.V))
			(?X_F (?X_H ((ADV-A (BEHIND.P ?X_D)) BE.V)))
			(?X_J (?X_H ((ADV-A (IN.P (K (L X (AND (X LAST.A) (X PLACE.N)))))) COME.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_F)))
			(!W2 (?X_C (BEFORE ?X_J)))
			(!W3 (?X_F (BEFORE ?X_J)))
		)
	)
	(
			"A man more tired runs ADV very fast."
			"A man more tired stops for catching a breath of a man more tired."
			"A man more tired stops for catching a breath of a man more tired."
			"A man more tired is than."
			"A man more tired is than."
			"A man more tired sits down for a break."
	)
)



(
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.12.V (KA SKATE.V)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((KA SKATE.V) ACTION.N))
			(!R3 (?X_A (K FIRST.A) LESSON.N))
			(!R4 (?X_A (PERTAIN-TO ?X_B)))
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
	              (COMPOSITE-SCHEMA-50.PR (KA (TAKE.V (K (PLUR LESSON.N))))
	               (KA SKATE.V)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E (K FIRST.A) LESSON.N))
			(!R2 (?X_E (PERTAIN-TO ?X_F)))
		)
		(:STEPS
			(?X_B (?X_F (DECIDE.V (KA (TAKE.V (K (PLUR LESSON.N)))))))
			(?X_D (?X_F ENJOY_ACTION.12.V (KA SKATE.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B BEFORE ?X_D))
		)
	)
	(
			"A friends of a agent and a agent run."
			"A agent is behind a group."
			"A agent comes in last place."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-51.PR ?X_D)) ** ?E)
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
			"X_F decides taking lessons."
			"X_F enjoy action.33s skating."
	)
)



(
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-52.PR ?X_A
	               (K (L X (AND (X SWEET.A) (X NECTAR.N)))) ?X_J ?X_O ?X_B
	               (K CLOVER.N)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F CLOVER.N))
			(!R2 (?X_F (PLUR FLOWER.N)))
			(!R3 (?X_I (PLUR BEE.N)))
			(!R4 (?X_J NECTAR.A))
			(!R5 (?X_J HOME.N))
			(!R6 (?X_O SWEET.A))
			(!R7 (?X_P (PLUR FIELD.N)))
		)
		(:STEPS
			(?X_E (?X_I (LIKE.V ?X_A)))
			(?X_H
	   (?X_I
	    (((ADV-A (IN.P ?X_F)) FIND.V) (K (L X (AND (X SWEET.A) (X NECTAR.N)))))))
			(?X_L (?X_I (((ADV-A (FOR.P (KA (MAKE.V (K HONEY.N))))) TAKE.V) ?X_J)))
			(?X_N ((K (PLUR BEE.N)) ((TOO.ADV LIKE.V) ?X_O ?X_B)))
			(?X_R
	   (?X_O
	    ((ADV-A
	      (WITH.P
	       (SET-OF (K (L X (AND (X RED.A) (X CLOVER.N))))
	        (K (L X (AND (X YELLOW.A) (X (PLUR BUTTERCUP.N))))))))
	     ((ADV-A (IN.P ?X_P)) GROW.V))))
			(?X_T
	   ((K (L X ((X (PLUR HORSE.N)) AND (X AND) (X (PLUR COW.N)))))
	    (EAT.V (K CLOVER.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_H)))
			(!W2 (?X_E (BEFORE ?X_L)))
			(!W3 (?X_E (BEFORE ?X_N)))
			(!W4 (?X_E (BEFORE ?X_R)))
			(!W5 (?X_E (BEFORE ?X_T)))
			(!W6 (?X_H (BEFORE ?X_L)))
			(!W7 (?X_H (BEFORE ?X_N)))
			(!W8 (?X_H (BEFORE ?X_R)))
			(!W9 (?X_H (BEFORE ?X_T)))
			(!W10 (?X_L (BEFORE ?X_N)))
			(!W11 (?X_L (BEFORE ?X_R)))
			(!W12 (?X_L (BEFORE ?X_T)))
			(!W13 (?X_N (BEFORE ?X_R)))
			(!W14 (?X_N (BEFORE ?X_T)))
			(!W15 (?X_R (BEFORE ?X_T)))
		)
	)
	(
			"A agent lives on a bay."
			"A agent sees a in X_E."
	)
)



(
	(EPI-SCHEMA ((?X_C COMPOSITE-SCHEMA-53.PR) ** ?E)
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.13.V (KA (BUY.V ?X_B))) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (BUY.V ?X_B)) ACTION.N))
			(!R3 (?X_B WATCH.N))
			(!R4 (?X_B NEW.A))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-54.PR ?X_H ?X_I (KA (BUY.V ?X_L)))) ** ?E)
		(:ROLES
			(!R1 (?X_H MOST.A))
			(!R2 (?X_I ROSE.N))
			(!R3 (?X_I GOLD.N))
			(!R4 (?X_I WATCH.N))
			(!R5 (?X_L NEW.A))
			(!R6 (?X_L WATCH.N))
			(!R7 (?X_M AGENT.N))
			(!R8 (?X_P JEWELRY.N))
			(!R9 (?X_P STORE.N))
		)
		(:STEPS
			(?X_O (?X_A ((ADV-A (AT.P ?X_P)) BE.V)))
			(?X_G (?X_M (LIKE.V ?X_I ?X_H)))
			(?X_E (?X_M (BUY.V ?X_I)))
			(?X_C (?X_M ((HOME.ADV WEAR.V) ?X_I)))
			(?X_K (?X_M ENJOY_ACTION.13.V (KA (BUY.V ?X_L))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_G)))
			(!W2 (?X_O (BEFORE ?X_E)))
			(!W3 (?X_O (BEFORE ?X_C)))
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
			"A agent enjoy action.68s buying a new watch."
	)
)



(
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-55.PR ?X_D (KA SIT.V) ?X_H (KA HELP.V))) **
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
	(EPI-SCHEMA ((?X_B GET.17.V ?X_C) ** ?X_D)
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
	              (COMPOSITE-SCHEMA-56.PR
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
			(?X_R (?X_T GET.17.V ?X_A))
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
			"X_T get.81s X_A."
			"A agent wants over in three hours coming."
			"A place house of X_T is a mess."
			"X_T cleans a place house of X_T."
			"X_B has a place house of X_T."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.10.V) ?X_B) ** ?X_C)
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
	    (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.10.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.10.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.10.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.10.V)))
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
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-57.PR ?X_C)) ** ?E)
		(:ROLES
			(!R1 (?X_C STORE.N))
			(!R2 (?X_D AGENT.N))
		)
		(:STEPS
			(?X_B (?X_D ((ADV-A (FROM.P ?L1)) GO.10.V) ?X_C))
		)
	)
	(
			"A agent go.90s a store from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.11.V) (K CHURCH.N)) ** ?X_B)
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
	     ((ADV-A (TO.P (K CHURCH.N))) GO.11.V))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? (K CHURCH.N))) GO.11.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? (K CHURCH.N))) GO.11.V) (K CHURCH.N)))
			(?X_B (?X_A (LOCATION_ADV.? GO.11.V)))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-58.PR ?X_Q ?X_K (K CHURCH.N))) ** ?E)
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
			(?X_D (?X_A ((ADV-A (TO.P (K CHURCH.N))) GO.V)))
			(?X_N (?X_A (CARRY.V ?X_Q)))
			(?X_E (?X_A ((ADV-A (FROM.P ?L1)) GO.11.V) (K CHURCH.N)))
			(?X_P (?X_A (CARRY.V ?X_Q)))
			(?X_I (?X_B (CARRY.V ?X_K)))
			(?X_G (?X_K ((ADV-A (FROM.P ?X_C)) COME.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_N)))
			(!W2 (?X_D (BEFORE ?X_I)))
			(!W3 (?X_D (BEFORE ?X_G)))
			(!W4 (?X_N (BEFORE ?X_I)))
			(!W5 (?X_N (BEFORE ?X_G)))
			(!W6 (?X_E (BEFORE ?X_P)))
			(!W7 (?X_E (BEFORE ?X_I)))
			(!W8 (?X_E (BEFORE ?X_G)))
			(!W9 (?X_P (BEFORE ?X_I)))
			(!W10 (?X_P (BEFORE ?X_G)))
			(!W11 (?X_I (BEFORE ?X_G)))
		)
	)
	(
			"X_A goes to church."
			"X_A carries a parasol black small of silk."
			"X_A go.93s church from L1."
			"X_A carries a parasol black small of silk."
			"X_B carries a umbrella of paper is X_L."
			"A umbrella of paper is X_L comes from X_C."
	)
)



(
	(EPI-SCHEMA ((?X_D TAKE.4.V ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_A (PLUR FIELD.N)))
			(!R6 (?X_B (PERTAIN-TO ?X_D)))
			(!R7 (?X_B RED.A))
			(!R8 (?X_B WAGON.N))
			(!R9 (?X_C LITTLE.A))
			(!R10 (?X_C (HAS.V ?X_B)))
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
	(EPI-SCHEMA ((?X_D TAKE.5.V ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_A (PLUR FIELD.N)))
			(!R6 (?X_C (PERTAIN-TO ?X_D)))
			(!R7 (?X_C RED.A))
			(!R8 (?X_C WAGON.N))
			(!R9 (?X_B BOY.N))
			(!R10 (?X_B LITTLE.A))
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
	              (COMPOSITE-SCHEMA-59.PR
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
			(E205.SK (?X_G TAKE.4.V ?X_B))
			(E205.SK (?X_G TAKE.5.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (E204.SK BEFORE ?X_D))
			(!W2 (?X_D BEFORE E205.SK))
		)
	)
	(
			"A little boy has a red wagon of a agent lets little may riding."
			"X_B has a good ride may."
			"A agent take.104s X_B."
			"A agent take.107s X_B."
	)
)



(
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-60.PR (KA WALK.V) ?X_H
	               (KA (WALK.V (KA (FIND.V (K WATER.N)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C GROUND.N))
			(!R2 (?X_H (K WATER.N) BOTTLE.N))
			(!R3 (?X_I TIRED.A))
			(!R4 (?X_I MAN.N))
			(!R5 (?X_H (PERTAIN-TO ?X_I)))
		)
		(:STEPS
			(?X_E (?X_I (DOWN.ADV ((ADV-A (ON.P ?X_C)) SIT.V))))
			(?X_A (?X_I (OF.P (KA WALK.V))))
			(?X_B (?X_I ((OUT.PRT TAKE.V) ?X_H)))
			(?X_G (?X_I ((OUT.PRT TAKE.V) ?X_H)))
			(?X_K (MUST.AUX-S (?X_I (KEEP.V (KA (WALK.V (KA (FIND.V (K WATER.N)))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_A)))
			(!W2 (?X_E (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_G)))
			(!W4 (?X_E (BEFORE ?X_K)))
			(!W5 (?X_A (BEFORE ?X_B)))
			(!W6 (?X_A (BEFORE ?X_G)))
			(!W7 (?X_A (BEFORE ?X_K)))
			(!W8 (?X_B (BEFORE ?X_G)))
			(!W9 (?X_B (BEFORE ?X_K)))
			(!W10 (?X_G (BEFORE ?X_K)))
		)
	)
	(
			"A tired man sits down on a ground."
			"A tired man is of."
			"A tired man takes a of a tired man out."
			"A tired man takes a of a tired man out."
			"A tired man keeps walking finding water must."
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.12.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.12.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.12.V) ?X_B))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-61.PR ?X_E (SIX.D (PLUR DOLLAR.N)) ?X_H)) **
	             ?E)
		(:ROLES
			(!R1 (?X_E (PLUR CHIP.N)))
			(!R2 (?X_H STORE.N))
			(!R3 (?X_H TODAY.N))
			(!R4 (?X_I AGENT.N))
		)
		(:STEPS
			(?X_G (?X_I ((ADV-A (FROM.P ?L1)) GO.12.V) ?X_H))
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
			"A agent go.153s a store today from L1."
			"A agent sees a chips."
			"A chips are six dollars."
	)
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
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-62.PR ?X_N)) ** ?E)
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
			(?X_J (?X_B (((ADV-A (IN.P ?X_K)) PUT.3.V) ?X_N)))
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
			"X_B put.158s a bird in a shoe box."
	)
)



(
	(EPI-SCHEMA ((?X_A MAKE.7.V
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
	(EPI-SCHEMA ((?X_A MAKE.8.V
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
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-63.PR ?X_L (K (PLUR GROCERY.N))
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
			"A man make.167s a wife of a man with grocerys dinner."
			"A man make.168s a wife of a man with grocerys dinner."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-64.PR (K BRIGHT.A) ?X_G)) ** ?E)
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
	(EPI-SCHEMA ((?X_C TAKE.6.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C BROTHER.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D HAT.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
			(!R7 (?X_A HEAD.N))
			(!R8 (?X_C (PERTAIN-TO ?X_B)))
			(!R9 (?X_B AGENT.N))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (OFF.P ?X_A)) TAKE.7.V) ?X_D)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C BROTHER.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D HAT.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
			(!R7 (?X_A HEAD.N))
			(!R8 (?X_B AGENT.N))
			(!R9 (?X_C (PERTAIN-TO ?X_B)))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (OFF.P ?X_A)) TAKE.8.V) ?X_D)) ** ?X_F)
		(:ROLES
			(!R1 (?X_C BROTHER.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D HAT.N))
			(!R6 (?X_A HEAD.N))
			(!R7 (?X_A (PERTAIN-TO ?X_C)))
			(!R8 (?X_C (PERTAIN-TO ?X_B)))
			(!R9 (?X_B AGENT.N))
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
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (RIGHT-AFTER ?X_E)))
			(!W7 (?X_F (SAME-TIME ?X_H)))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-65.PR (TWO.D (PLUR DOG.N)))) ** ?E)
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.14.V (KA ((ADV-A (WITH.P ?X_B)) GO.V))) **
	             ?X_C)
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
			(?X_C (?X_A (WANT.V (KA ((ADV-A (WITH.P ?X_B)) GO.V)))))
			(?X_C (?X_A (LIKE.V (KA ((ADV-A (WITH.P ?X_B)) GO.V)))))
			(?X_C (?X_A (LOVE.V (KA ((ADV-A (WITH.P ?X_B)) GO.V)))))
			(?X_C (?X_A (ENJOY.V (KA ((ADV-A (WITH.P ?X_B)) GO.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (SAME-TIME ?X_F)))
			(!W2 (?X_C (RIGHT-AFTER ?X_D)))
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
	              (COMPOSITE-SCHEMA-66.PR (K FISHING.N) ?X_F
	               (KA ((ADV-A (WITH.P ?X_N)) GO.V))))
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
			(?X_K (?X_O ((ADV-A (WITH.P ?X_N)) GO.V)))
			(?X_A (?X_O ENJOY_ACTION.14.V (KA ((ADV-A (WITH.P ?X_N)) GO.V))))
			(?X_A (?X_O ENJOY_ACTION.15.V (KA ((ADV-A (WITH.P ?X_N)) GO.V))))
			(?X_H ((ADV-E (DURING (K YESTERDAY.N))) (?X_O ((ADV-A (TO.P ?X_I)) GO.V))))
			(?X_E (?X_O (CATCH.V ?X_F)))
			(?X_C (?X_O ((BACK.PRT ((ADV-A (FOR.P (KA (EAT.V ?X_F)))) BRING.V)) ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_H)))
			(!W2 (?X_M (BEFORE ?X_E)))
			(!W3 (?X_M (BEFORE ?X_C)))
			(!W4 (?X_K (BEFORE ?X_A)))
			(!W5 (?X_H (BEFORE ?X_E)))
			(!W6 (?X_H (BEFORE ?X_C)))
			(!W7 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"X_O loves fishing."
			"X_O goes with a friends of X_O."
			"X_O enjoy action.250s with a friends of X_O going."
			"X_O enjoy action.251s with a friends of X_O going."
			"X_O goes DURING yesterday to a local pond."
			"X_O catches a large fish."
			"X_O brings a large fish back for eating a large fish."
		error composing story schemas
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
			(!R6 (?X_B COUPLE.N))
			(!R7 (?X_B BABY.N))
			(!R8 (?X_B (SO.ADV TINY.A)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-67.PR (KE (?X_L TURTLE.V)) ?X_L)) ** ?E)
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
			(?X_E (?X_I (((ADV-A (IN.P ?X_F)) PUT.4.V) ?X_L)))
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
			"A agent put.255s a couple baby so tiny in a box."
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-68.PR (KA LEAVE.V) ?X_F ?X_C ?A)) ** ?E)
		(:ROLES
			(!R1 (?X_C BOY.N))
			(!R2 (?X_F GIRL.N))
			(!R3 (?X_I SHOW.N))
			(!R4 (?X_J COUPLE.N))
		)
		(:STEPS
			(?X_H (?X_J ((ADV-A (TO.P ?X_I)) GO.V)))
			(?X_E (?X_F (ASK.V (KA LEAVE.V))))
			(?X_B (?X_C REQUEST_ACTION.16.V ?X_F ?A))
			(?X_B (?X_C REQUEST_ACTION.17.V ?X_C ?A))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_E)))
		)
	)
	(
			"A couple goes to a show."
			"A girl asks leaving."
			"A boy request action.271s a girl A."
	)
)



(
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.18.V ?X_C ?A) ** ?X_D)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?A ACTION.N))
			(!R3 (?X_A GUITAR.N))
			(!R4 (?X_A (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((?X_B PLAY.7.V) ** ?X_C)
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
			(?X_C (?X_B ((ADV-A (WITH.P ?T)) PLAY.7.V)))
			(?X_C (?X_B PLAY.7.V ?G))
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
	(EPI-SCHEMA ((?X_B PLAY.8.V) ** ?X_C)
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
			(?X_C (?X_B ((ADV-A (WITH.P ?T)) PLAY.8.V)))
			(?X_C (?X_B PLAY.8.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_C (SAME-TIME ?X_F)))
			(!W3 (?X_C (RIGHT-AFTER ?X_D)))
			(!W4 (?X_E (BEFORE ?X_F)))
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
			(!R8 (?X_B GUITAR.N))
			(!R9 (?X_B (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((?X_A PLAY.10.V ?X_B) ** ?X_D)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_B (PERTAIN-TO ?X_A)))
			(!R4 (?X_B GUITAR.N))
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
	(EPI-SCHEMA ((?X_A GET.18.V (K BETTER.A)) ** ?X_B)
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
	(EPI-SCHEMA ((?X_A TAKE.9.V ?X_B) ** ?X_C)
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
	(EPI-SCHEMA ((?X_A GET.19.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
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
	              (COMPOSITE-SCHEMA-69.PR ?X_B ?X_Q
	               (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N))))) ?X_K ?X_E))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J FEMALE.A))
			(!R2 (?X_J AGENT.N))
			(!R3 (?X_K FLOWER.N))
			(!R4 (?X_K RED.A))
			(!R5 (?X_P FATHER.N))
			(!R6 (?X_Q AGENT.N))
			(!R7 (?X_P (PERTAIN-TO ?X_Q)))
		)
		(:STEPS
			(?X_O (?X_A (((ADV-A (TO.P ?X_Q)) GIVE.V) ?X_B)))
			(?X_M (?X_P (GIVE.V ?X_Q (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N))))))))
			(?X_G (?X_Q (KEEP.V ?X_K)))
			(?X_H (?X_J (LIKE.V ?X_E)))
			(?X_I (?X_D (((ADV-A (AT.P ?X_F)) ((ADV-A (WITH.P ?X_D)) TAKE.10.V)) ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_M)))
			(!W2 (?X_O (BEFORE ?X_G)))
			(!W3 (?X_O (BEFORE ?X_H)))
			(!W4 (?X_O (BEFORE ?X_I)))
			(!W5 (?X_M (BEFORE ?X_G)))
			(!W6 (?X_M (BEFORE ?X_H)))
			(!W7 (?X_M (BEFORE ?X_I)))
		)
	)
	(
			"X_A gives X_B to a agent."
			"A father of a agent gives a agent two red one."
			"A agent keeps a flower red."
			"A female agent likes X_E."
			"X_D take.41s X_E at X_F with X_D."
	)
)



(
	(EPI-SCHEMA ((?X_M COMPOSITE-SCHEMA-70.PR) ** ?E)
		(:ROLES
			(!R1 (?X_C RIVER.N))
			(!R2 (?X_L BOAT.N))
			(!R3 (?X_M MAN.N))
			(!R4 (?X_L (PERTAIN-TO ?X_M)))
		)
		(:STEPS
			(?X_E (?X_M ((ADV-A (DOWN.P ?X_C)) FLOAT.V)))
			(?X_B (?X_L (OVER.PRT TIP.V)))
			(?X_G (?X_L (OVER.PRT TIP.V)))
			(?X_I
	   (?X_M
	    ((ADV-A (ON.P (K (L X (AND (X TOP.N) (X (OF.P (THE.D BOAT.N))))))))
	     CLIMB.V)))
			(?X_K (?X_M RESCUE.V))
			(?X_O (?X_M RESCUE.V))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_B)))
			(!W2 (?X_E (BEFORE ?X_G)))
			(!W3 (?X_E (BEFORE ?X_I)))
			(!W4 (?X_E (BEFORE ?X_K)))
			(!W5 (?X_E (BEFORE ?X_O)))
			(!W6 (?X_B (BEFORE ?X_G)))
			(!W7 (?X_B (BEFORE ?X_I)))
			(!W8 (?X_B (BEFORE ?X_K)))
			(!W9 (?X_B (BEFORE ?X_O)))
			(!W10 (?X_G (BEFORE ?X_I)))
			(!W11 (?X_G (BEFORE ?X_K)))
			(!W12 (?X_G (BEFORE ?X_O)))
			(!W13 (?X_I (BEFORE ?X_K)))
			(!W14 (?X_I (BEFORE ?X_O)))
			(!W15 (?X_K (BEFORE ?X_O)))
		)
	)
	(
			"A man floats down a river."
			"A boat of a man tips over."
			"A boat of a man tips over."
			"A man climbs on top of."
			"A man rescues."
			"A man rescues."
	)
)



(
	(EPI-SCHEMA ((?X_G
	              (COMPOSITE-SCHEMA-71.PR (KA (PLAY.V (K BASEBALL.N))) ?X_J ?X_K))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-72.PR ?X_C ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_C WALKING.N))
			(!R2 (?X_C STACKER.N))
			(!R3 (?X_H WAY.N))
			(!R4 (?X_J AGENT.N))
			(!R5 (?X_H (PERTAIN-TO ?X_J)))
			(!R6 (?X_I FRIEND.N))
			(!R7 (?X_I (PERTAIN-TO ?X_J)))
		)
		(:STEPS
			(?X_B (?X_J ((ADV-A (AT.P (K WORK.N))) BE.V)))
			(?X_E (?X_J (USE.V ?X_C)))
			(?X_G (?X_I ((ADV-A (IN.P ?X_H)) STAND.V)))
			(?X_L (?X_J ((ALMOST.ADV (OVER.PRT RUN.V)) ?X_I)))
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
			"A agent is at work."
			"A agent uses a walking stacker."
			"A friend of a agent stands in a way of a agent."
			"A agent runs a friend of a agent almost over."
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
	              (COMPOSITE-SCHEMA-73.PR
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
	(EPI-SCHEMA ((?X_A GET.11.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))) **
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
	              (COMPOSITE-SCHEMA-74.PR ?X_B ?X_M
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
			(?X_D (?X_N GET.11.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))))
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
			"A man get.101s water in another glass."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_E (COMPOSITE-SCHEMA-75.PR (KE (?X_A (CAN.AUX BE.V))) ?X_H ?X_I))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.13.V) ?X_C) ** ?X_D)
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
	   (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) GO.13.V))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.13.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.13.V) ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? GO.13.V)))
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
	(EPI-SCHEMA ((?X_B TAKE.5.V (TWO.D (PLUR PICTURE.N))) ** ?X_C)
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
	               (TAKE.11.V
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
	(EPI-SCHEMA ((?X_B (((ADV-A (TO.P ?X_A)) TAKE.12.V) ?X_C)) ** ?X_D)
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
	(EPI-SCHEMA ((?X_A ((OUT.ADV GET.20.V) ?X_B)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_B
	              (COMPOSITE-SCHEMA-76.PR (K BLIND.A) ?X_D
	               (K ((ADV-A (FOR.P (K (PLUR YEAR.N)))) (FOR.P ?X_G))) ?X_B))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D TIME.N))
			(!R2 (?X_D LONG.A))
			(!R3 (?X_G OLD.A))
			(!R4 (?X_G AGENT.N))
		)
		(:STEPS
			(?X_C (?X_G (GO.V (K BLIND.A))))
			(?X_F (?X_B ?X_G (HAVE.V ?X_D)))
			(?X_I (?X_B (LOOK.V (K ((ADV-A (FOR.P (K (PLUR YEAR.N)))) (FOR.P ?X_G))))))
			(?X_K
	   (?X_A
	    ((LONGER.ADV
	      (MUCH.ADV ((ADV-A (FOR.P (KA ((ADV-A (OVER.P ?X_A)) GET.V)))) TAKE.V)))
	     ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_F)))
			(!W2 (?X_C (BEFORE ?X_I)))
			(!W3 (?X_C (BEFORE ?X_K)))
			(!W4 (?X_F (BEFORE ?X_I)))
			(!W5 (?X_F (BEFORE ?X_K)))
			(!W6 (?X_I (BEFORE ?X_K)))
		)
	)
	(
			"A old agent goes blind."
			"X_B has a time long."
			"X_B looks for years for a old agent."
			"X_A takes X_B longer much for over X_A getting."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-77.PR (KE (AND (?X_B RED.A) (?X_B YELLOW.A)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-78.PR ?X_F ?X_K)) ** ?E)
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
	(EPI-SCHEMA ((MUST.AUX-S (?X_C ((JUST.ADV EAT.1.V) (K (PLUR FOOD.N))))) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_C SON.N))
			(!R2 ((K (PLUR FOOD.N)) FOOD.N))
			(!R3 (?X_D (IMPINGES-ON ?X_A)))
			(!R4 (?X_B AGENT.N))
			(!R5 (?X_C (PERTAIN-TO ?X_B)))
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
	(EPI-SCHEMA ((MUST.AUX-S (?X_C ((JUST.ADV EAT.2.V) (K (PLUR FOOD.N))))) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_C SON.N))
			(!R2 ((K (PLUR FOOD.N)) FOOD.N))
			(!R3 (?X_C (PERTAIN-TO ?X_A)))
			(!R4 (?X_A AGENT.N))
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
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-79.PR ?X_F
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
			(?X_J (MUST.AUX-S (?X_H ((JUST.ADV EAT.1.V) (K (PLUR FOOD.N))))))
			(?X_J (MUST.AUX-S (?X_H ((JUST.ADV EAT.2.V) (K (PLUR FOOD.N))))))
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
			"A son of a agent eat.159s foods must just."
			"A son of a agent eat.160s foods must just."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-80.PR ?X_A)) ** ?E)
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
	(EPI-SCHEMA ((?X_J
	              (COMPOSITE-SCHEMA-81.PR (KE (?X_J HOUSE.N)) (K HOME.N)
	               (K (OVER.PRT (TO.P ?X_K)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J FRIEND.N))
			(!R2 (?X_J (PERTAIN-TO ?X_J)))
			(!R3 (?X_F YARD.N))
			(!R4 (?X_I BIG.A))
			(!R5 (?X_I DOG.N))
			(!R6 (?X_K (PLUR KID.N)))
			(!R7 (?X_J (PERTAIN-TO ?X_K)))
		)
		(:STEPS
			(?X_A (?X_J HOUSE.N))
			(?X_B ((TWO.D (PLUR KID.N)) (VISIT.V (KE (?X_J HOUSE.N)))))
			(?X_C (NOT (?X_J (BE.V (K HOME.N)))))
			(?X_E (NOT (?X_J (BE.V (K HOME.N)))))
			(?X_H (?X_I ((ADV-A (IN.P ?X_F)) BE.V)))
			(?X_M (?X_I (RUN.V (K (OVER.PRT (TO.P ?X_K))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_B)))
			(!W2 (?X_A (BEFORE ?X_C)))
			(!W3 (?X_A (BEFORE ?X_E)))
			(!W4 (?X_A (BEFORE ?X_H)))
			(!W5 (?X_A (BEFORE ?X_M)))
			(!W6 (?X_B (BEFORE ?X_C)))
			(!W7 (?X_B (BEFORE ?X_E)))
			(!W8 (?X_B (BEFORE ?X_H)))
			(!W9 (?X_B (BEFORE ?X_M)))
			(!W10 (?X_C (BEFORE ?X_E)))
			(!W11 (?X_C (BEFORE ?X_H)))
			(!W12 (?X_C (BEFORE ?X_M)))
			(!W13 (?X_E (BEFORE ?X_H)))
			(!W14 (?X_E (BEFORE ?X_M)))
			(!W15 (?X_H (BEFORE ?X_M)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (WITH.P ?X_A)) PLAY.12.V)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D CAT.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?X_C GAME.N))
			(!R5 (NOT (?X_C AGENT.N)))
			(!R6 (?X_A BALL.N))
			(!R7 (?X_A (ON.P ?X_B)))
			(!R8 (?X_B FLOOR.N))
			(!R9 (?X_C LIVING.N))
			(!R10 (?X_C ROOM.N))
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
		(:PARAPHRASES
			(?X_E (?X_D ((ADV-A (WITH.P ?T)) PLAY.12.V)))
			(?X_E (?X_D PLAY.12.V ?X_C))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (WITH.P ?X_A)) PLAY.13.V) ?X_D)) ** ?X_E)
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
	(EPI-SCHEMA ((?X_C (((ADV-A (WITH.P ?X_A)) PLAY.14.V) ?X_D)) ** ?X_G)
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-82.PR ?X_N ?X_A)) ** ?E)
		(:ROLES
			(!R1 (?X_N BALL.N))
			(!R2 (?X_L LIVING.N))
			(!R3 (?X_L ROOM.N))
			(!R4 (?X_M CAT.N))
			(!R5 (?X_O FLOOR.N))
			(!R6 (?X_N (ON.P ?X_O)))
		)
		(:STEPS
			(?X_K (?X_M ((ADV-A (INTO.P ?X_L)) WALK.V)))
			(?X_I (?X_A (BE.V ?X_N)))
			(?X_G (?X_M ((AROUND.ADV SWAT.V) ?X_N)))
			(?X_E (?X_M ((ADV-A (WITH.P ?X_N)) PLAY.12.V)))
			(?X_E (?X_M (((ADV-A (WITH.P ?X_N)) PLAY.13.V) ?X_A)))
			(?X_E (?X_M (((ADV-A (WITH.P ?X_N)) PLAY.14.V) ?X_A)))
			(?X_C (?X_M (LIKE.V ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_G)))
			(!W2 (?X_K (BEFORE ?X_C)))
			(!W3 (?X_I (BEFORE ?X_E)))
			(!W4 (?X_G (BEFORE ?X_C)))
		)
	)
	(
			"A friend of a friend of X_J of a kids of a kids is house."
			"Two kids visit a friend of a friend of X_J of a kids of a kids house."
			"A friend of a friend of X_J of a kids of a kids is home not."
			"A friend of a friend of X_J of a kids of a kids is home not."
			"A big dog is in a yard."
			"A big dog runs over to a kids."
	)
)



(
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.19.V ?Y ?A) ** ?X_B)
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
			(?E1 (?X_A ((DOWN.ADV ASK.V) ?Y ?A)))
			(?E2 (?Y (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_B (?X_A ((DOWN.ADV ASK.V) ?Y ?A)))
			(?X_B (?X_A (TELL.V ?Y ?A)))
			(?X_B (?X_A (MAKE.V ?Y ?A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?E2))
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
	              (COMPOSITE-SCHEMA-83.PR (K ROPE.N) ?X_B (KA (IN.PRT JUMP.V)) ?Y ?A))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K {REF}.N))
			(!R2 (?X_K (OF.P ?X_L)))
		)
		(:STEPS
			(?X_J (?X_K (JUMP.V (K ROPE.N))))
			(?X_H (?X_A (ASK.V ?X_B (KA (IN.PRT JUMP.V)))))
			(?X_F (?X_B TRY.V))
			(?X_D (?X_B REQUEST_ACTION.19.V ?Y ?A))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_F)))
			(!W3 (?X_J (BEFORE ?X_D)))
			(!W4 (?X_H (BEFORE ?X_F)))
			(!W5 (?X_H (BEFORE ?X_D)))
		)
	)
	(
			"A cat walks into a living room."
			"X_A is a ball on a floor."
			"A cat swats a ball on a floor around."
			"A cat play.27s with a ball on a floor."
			"A cat play.23s X_A with a ball on a floor."
			"A cat play.25s X_A with a ball on a floor."
			"A cat likes a ball on a floor."
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.20.V (KA (BUY.V ?X_B))) ** ?X_C)
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
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-84.PR (ALL.D DAY.N) ?X_L (KA (BUY.V ?X_E))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E ALBUM.N))
			(!R2 (?X_L GREAT.A))
			(!R3 (?X_L SONG.N))
		)
		(:STEPS
			(?X_N (?X_B ((ADV-A (ON.P ?X_A)) SEARCH.V)))
			(?X_K (?X_B (FIND.V ?X_L)))
			(?X_I (?X_B (((ADV-A (TO.P ?X_L)) LISTEN.V) (ALL.D DAY.N))))
			(?X_G (?X_B (LOVE.V ?X_L)))
			(?X_D (?X_B ENJOY_ACTION.20.V (KA (BUY.V ?X_E))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_K)))
			(!W2 (?X_N (BEFORE ?X_I)))
			(!W3 (?X_N (BEFORE ?X_G)))
			(!W4 (?X_K (BEFORE ?X_I)))
			(!W5 (?X_K (BEFORE ?X_G)))
			(!W6 (?X_I (BEFORE ?X_G)))
		)
	)
	(
			"A of X_L jumps rope."
			"X_A asks X_B in jumping."
			"X_B tries."
			"X_B request action.34s Y.SK A."
	)
)



(
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-85.PR (K SWIMMING.N) (KA SWIM.V) ?X_H)) ** ?E)
		(:ROLES
			(!R1 (?X_I AGENT.N))
			(!R2 (?X_G (VERY.ADV COLD.A)))
			(!R3 (?X_G WATER.N))
			(!R4 (?X_H (PLUR TOOTH.N)))
			(!R5 (?X_H CHATTER.N))
			(!R6 (?X_H (PERTAIN-TO ?X_I)))
		)
		(:STEPS
			(?X_B ((ADV-E (DURING (K TODAY.N))) (?X_I (GO.V (K SWIMMING.N)))))
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
			"X_B searches on X_A."
			"X_B finds a great song."
			"X_B listens all day to a great song."
			"X_B loves a great song."
			"X_B enjoy action.39s buying a album."
	)
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-86.PR ?X_A (K (AWAY.ADV (FROM.P ?X_B))))) **
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
			"A agent goes swimming DURING today."
			"A agent is to."
			"A agent loves to swimming."
			"A very cold water makes a tooths chatter of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) RUN.2.V) ?L2) ** ?X_B)
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.2.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.2.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.2.V) ?L2))
			(?X_B (?X_A RUN.2.V))
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-87.PR (KA ((ADV-A (FOR.P ?X_H)) GO.V)) ?L2))
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
			(?X_B (?X_K ((ADV-A (FROM.P ?L1)) RUN.2.V) ?L2))
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
			"X_B catches X_A not can."
			"A hoop rolls away from X_B."
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (WITH.P ?X_A)) PLAY.15.V)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D CAT.N))
			(!R2 (?X_C TOY.N))
			(!R3 (NOT (?X_C AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A EDGE.N))
			(!R7 (?X_B AGENT.N))
			(!R8 (?X_D (PERTAIN-TO ?X_B)))
			(!R9 (?X_C (VERY.ADV PLUSH.A)))
			(!R10 (?X_C RUG.N))
			(!R11 (?X_C NEW.A))
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
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_E (BEFORE ?X_F)))
			(!W3 (?X_G (SAME-TIME ?X_F)))
			(!W4 (?X_G (RIGHT-AFTER ?X_H)))
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
	(EPI-SCHEMA ((?X_C ((JUST.ADV GET.21.V) ?X_D)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_B EDGE.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D (VERY.ADV PLUSH.A)))
			(!R6 (?X_D NEW.A))
			(!R7 (?X_D RUG.N))
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-88.PR ?X_M)) ** ?E)
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
			(?X_I (?X_N ((ADV-A (WITH.P ?X_J)) PLAY.15.V)))
			(?X_L (?X_O ((JUST.ADV GET.21.V) ?X_M)))
			(?X_A (?X_N ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_J)) PLAY.V)))) START.V)))
			(?X_E (?X_F ((ADV-A (AT.P ?X_N)) YELL.V)))
			(?X_C (?X_N (AWAY.PRT RUN.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_A)))
			(!W2 (?X_I (BEFORE ?X_E)))
			(!W3 (?X_I (BEFORE ?X_C)))
			(!W4 (?X_L (BEFORE ?X_A)))
			(!W5 (?X_L (BEFORE ?X_E)))
			(!W6 (?X_L (BEFORE ?X_C)))
			(!W7 (?X_A (BEFORE ?X_E)))
			(!W8 (?X_A (BEFORE ?X_C)))
			(!W9 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A man looks outside."
			"A man decides for a job going."
			"A sunny starts for raining."
			"A man run.66s L2 from L1."
	)
)



(
	(EPI-SCHEMA ((?X_B ((OUT.PRT GET.22.V) (KA ((ADV-A (ON.P ?X_C)) CHECK.V)))) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((KA ((ADV-A (ON.P ?X_C)) CHECK.V)) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (KA ((ADV-A (ON.P ?X_C)) CHECK.V)))))
			(!R5 (?X_B (HOME.ADV DRIVE.V)))
			(!R6 (?X_C ROAD.N))
			(!R7 (?X_C RABBIT.N))
			(!R8 (?X_C DEAD.A))
			(!R9 (?X_A (ON.P ?X_C)))
			(!R10 (?X_A RABBIT.N))
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
	              (COMPOSITE-SCHEMA-89.PR ?X_G (K HOME.N)
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
			(?X_D (?X_I ((OUT.PRT GET.22.V) (KA ((ADV-A (ON.P ?X_H)) CHECK.V)))))
			(?X_B (?X_I (DRIVE.V (K HOME.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_D)))
			(!W2 (?X_F (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A cat of a agent play.82s with a edge."
			"A agent get.75s a new rug very plush just."
			"A cat of a agent starts for with a edge playing."
			"A wife of X_G yells at a cat of a agent."
			"A cat of a agent runs away."
	)
)



(
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-90.PR ?X_D (KA (HAVE.V ?X_H)))) ** ?E)
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
			"A home drive get.90s on a road dead rabbit checking out."
			"A home drive drives home."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-91.PR (K (PLUR NUT.N)) (K (PLUR CRUMB.N))))
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
	(EPI-SCHEMA ((?X_E
	              (COMPOSITE-SCHEMA-92.PR (K (TO.P (?X_B SING.V))) ?X_B
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
			"A little bird eats nuts not can."
			"A little bird likes crumbs."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.14.V) ?X_B) ** ?X_C)
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
	      ((ADV-A (FOR.P (KA (GET.V (K (PLUR CLOTHE.N)))))) GO.14.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.14.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.14.V) ?X_B))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.15.V) ?X_B) ** ?X_C)
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.15.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.15.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.15.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.15.V)))
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
	              (COMPOSITE-SCHEMA-93.PR (KA ((ADV-A (LIKE.P ?X_M)) LOOK.V)) ?X_G
	               ?X_J ?X_A))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G (PLUR SANDAL.N)))
			(!R2 (?X_J MARKET.N))
			(!R3 (?X_M (PLUR PERSON.N)))
		)
		(:STEPS
			(?X_O (?X_B ((ADV-A (FROM.P ?L1)) GO.15.V) ?X_A))
			(?X_L (?X_B (WANT.V (KA ((ADV-A (LIKE.P ?X_M)) LOOK.V)))))
			(?X_I (?X_B ((ADV-A (FROM.P ?L1)) GO.14.V) ?X_J))
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
			"A agent is in X_A."
			"A agent sings with a few persons."
			"A man listens to X_B sings."
			"A man gives X_B tips."
	)
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (WITH.P ?X_A)) EAT.3.V) ?F)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-94.PR (K GAS.N) ?X_L ?F)) ** ?E)
		(:ROLES
			(!R1 (?X_H (SET-OF AGENT.N)))
			(!R2 (?X_K (PLUR FRIEND.N)))
			(!R3 (?X_L AGENT.N))
			(!R4 (?X_K (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(?E_1 (?X FEED.1.V ?X_L ?F))
			(?X_J (?X_L (((ADV-A (WITH.P ?X_K)) EAT.3.V) ?F)))
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
			"X_B go.138s X_A from L1."
			"X_B wants like a persons looking."
			"X_B go.139s a market from L1."
			"X_B sees a sandals."
			"X_B buys a sandals."
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.21.V (KA (AGAIN.ADV WATCH.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (AGAIN.ADV WATCH.V) ?X_B) ACTION.N))
			(!R3 (?X_B (VERY.ADV FUNNY.A)))
			(!R4 (?X_B SHOW.N))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-95.PR (KA (AGAIN.ADV WATCH.V) ?X_H) ?X_H)) **
	             ?E)
		(:ROLES
			(!R1 (?X_H SHOW.N))
			(!R2 (?X_H (VERY.ADV FUNNY.A)))
		)
		(:STEPS
			(?X_E (?X_A ((ADV (OUT.ADV LOUD.A)) LAUGH.V)))
			(?X_G ((ADV-E (DURING (K YESTERDAY.N))) (?X_A (WATCH.3.V ?X_H))))
			(?X_C (?X_A ENJOY_ACTION.21.V (KA (AGAIN.ADV WATCH.V) ?X_H)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_C)))
		)
	)
	(
			"X feed.152s a agent F."
			"A agent eat.150s F with a friends of a agent."
			"A agent is about going to X_A house."
			"A agent is out."
			"A agent is of."
			"A friends of a agent waits must on a agent."
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.22.V (KA (AGAIN.ADV DRINK.V))) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (AGAIN.ADV DRINK.V)) ACTION.N))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA (AGAIN.ADV DRINK.V)) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_B (?X_A ((NEVER.ADV WANT.V) (KA (AGAIN.ADV DRINK.V)))))
			(?X_B (?X_A (LIKE.V (KA (AGAIN.ADV DRINK.V)))))
			(?X_B (?X_A (LOVE.V (KA (AGAIN.ADV DRINK.V)))))
			(?X_B (?X_A (ENJOY.V (KA (AGAIN.ADV DRINK.V)))))
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.23.V (KA VOMIT.V)) ** ?X_B)
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.24.V (KA (LIKE.V ?X_B))) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (LIKE.V ?X_B)) ACTION.N))
			(!R3 (?X_B WINE.N))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA (LIKE.V ?X_B)) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_C (?X_A (WANT.V (KA (LIKE.V ?X_B)))))
			(?X_C (?X_A (LIKE.V (KA (LIKE.V ?X_B)))))
			(?X_C (?X_A (LOVE.V (KA (LIKE.V ?X_B)))))
			(?X_C (?X_A (ENJOY.V (KA (LIKE.V ?X_B)))))
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
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-96.PR (KA (AGAIN.ADV DRINK.V)) (KA VOMIT.V)
	               (KA (LIKE.V ?X_G))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G WINE.N))
			(!R2 (?X_H AGENT.N))
		)
		(:STEPS
			(?X_F (?X_H ENJOY_ACTION.24.V (KA (LIKE.V ?X_G))))
			(?X_D (?X_H ENJOY_ACTION.23.V (KA VOMIT.V)))
			(?X_B (?X_H ENJOY_ACTION.22.V (KA (AGAIN.ADV DRINK.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_D)))
			(!W2 (?X_F (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"X_A laughs ADV out loud."
			"X_A watch.154s a show very funny DURING yesterday."
			"X_A enjoy action.156s again watch a show very funny."
	)
)



(
	(EPI-SCHEMA ((?X_A TAKE.13.V (SET-OF ?X_B ?X_C)) ** ?X_D)
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-97.PR ?X_G (SET-OF ?X_E ?X_D))) ** ?E)
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
			(?X_C (?X_F TAKE.13.V (SET-OF ?X_E ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_C)))
		)
	)
	(
			"A agent enjoy action.163s liking a wine."
			"A agent enjoy action.162s vomiting."
			"A agent enjoy action.161s again drink."
	)
)



(
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-98.PR ?X_D ?X_E)) ** ?E)
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
			"X_A is fish in."
			"A agent take.174s a rod long and a hook."
	)
)



(
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-99.PR
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
			"X_F has a flu."
			"A flu makes a of X_F."
			"A flu makes a of X_F."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.16.V) ?X_C) ** ?X_D)
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
	     (OUT.PRT ((ADV-A (FOR.P ?X_C)) GO.16.V)))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.16.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.16.V) ?X_C))
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-100.PR ?X_I ?X_N ?X_E ?X_L)) ** ?E)
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
			(?X_K (?X_N ((ADV-A (FROM.P ?L1)) GO.16.V) ?X_L))
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
			"X_A is in a band."
			"A band has few fan."
			"A band tries holding a show."
	)
)



(
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-101.PR (KA (SEE.V ?X_D)) ?X_K ?X_L)) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D VIEW.N))
			(!R3 (?X_K HEAD.N))
			(!R4 (?X_K (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(?X_F (?X_C (WANT.V (KA (SEE.V ?X_D)))))
			(?X_H (?X_L (DOWN.ADV FALL.V)))
			(?X_B (?X_L (((ADV (REALLY.ADV HARD.A)) HIT.V) ?X_K)))
			(?X_J (?X_L (((ADV (REALLY.ADV HARD.A)) HIT.V) ?X_K)))
			(?X_N (?X_A (((ADV (BACK.ADV DOWN.A)) CARRY.V) ?X_L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_H)))
			(!W2 (?X_F (BEFORE ?X_B)))
			(!W3 (?X_F (BEFORE ?X_J)))
			(!W4 (?X_F (BEFORE ?X_N)))
			(!W5 (?X_H (BEFORE ?X_B)))
			(!W6 (?X_H (BEFORE ?X_J)))
			(!W7 (?X_H (BEFORE ?X_N)))
			(!W8 (?X_B (BEFORE ?X_J)))
			(!W9 (?X_B (BEFORE ?X_N)))
			(!W10 (?X_J (BEFORE ?X_N)))
		)
	)
	(
			"X_N go.198s a pass from L1."
			"X_N is on."
			"X_N is in."
			"A person guards X_N."
			"X_N hits a ground hard."
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-102.PR ?X_I ?X_B)) ** ?E)
		(:ROLES
			(!R1 (?X_I PHONE.N))
		)
		(:STEPS
			(?X_H (?X_A (WANT.V ?X_I)))
			(?X_D (?X_A GO.V))
			(?X_F (?X_A GET.23.V ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_D)))
			(!W2 (?X_H (BEFORE ?X_F)))
		)
	)
	(
			"A agent wants seeing a view."
			"X_L falls down."
			"X_L hits a head of X_L ADV really hard."
			"X_L hits a head of X_L ADV really hard."
			"X_A carries X_L ADV back down."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-103.PR (K GLUE.N) ?X_F ?X_I)) ** ?E)
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
			"X_A wants a phone."
			"X_A goes."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (WITH.P ?X_A)) PLAY.16.V)) ** ?X_B)
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
			(?X_B (?X_A ((ADV-A (WITH.P ?T)) PLAY.16.V)))
			(?X_B (?X_A PLAY.16.V ?G))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-104.PR ?X_G ?X_A)) ** ?E)
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
			(E56.SK (?X_D ((ADV-A (WITH.P ?X_D)) PLAY.16.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_B)))
			(!W2 (?X_F (BEFORE ?X_C)))
			(!W3 (?X_B (BEFORE ?X_C)))
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
	(EPI-SCHEMA ((?X_A EAT.4.V (K FOOD.N)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_A EAT.5.V (K FOOD.N)) ** ?X_B)
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
	              (COMPOSITE-SCHEMA-105.PR
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
			(?X_D (?X_M EAT.5.V (K FOOD.N)))
			(?X_B (?X_M EAT.4.V (K FOOD.N)))
			(?X_B (?X_M EAT.6.V (K FOOD.N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_F)))
			(!W2 (?X_L (BEFORE ?X_B)))
			(!W3 (?X_F (BEFORE ?X_B)))
			(!W4 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A old cat has X_H catches a mouse can."
			"A old cat has X_H gives X_A to a of a old cat has X_H."
			"A old cat has X_H gives X_A to a of a old cat has X_H."
			"A mouse play.29s with a mouse."
	)
)



(
	(EPI-SCHEMA ((?X_B TAKE.14.V ?X_C) ** ?X_D)
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
	              (COMPOSITE-SCHEMA-106.PR (K COLD.A) (KE ((K SOAP.N) (IN.P ?X_M)))
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
			(?X_K (?X_N TAKE.14.V ?X_L))
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
			"A cat runs out of."
			"A have in a of a have in X_I no more agent no more agent buys a more from a store."
			"A cat eat.38s food."
			"A cat eat.37s food."
			"A cat eat.39s food."
		error composing story schemas
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_A GET.24.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_A (GET.24.V (K (SO.ADV BIG.A)))))
			(!R6 (?X_B (K SMASH.N) CAKE.N))
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-107.PR (K SMASH.N) ?X_E)) ** ?E)
		(:ROLES
			(!R1 (?X_E (K SMASH.N) CAKE.N))
			(!R2 (?X_F (GET.V (K (SO.ADV BIG.A)))))
			(!R3 (?X_F AGENT.N))
			(!R4 (?X_E (FOR.P ?X_F)))
		)
		(:STEPS
			(?X_D (?X_F GET.24.V ?X_E))
			(?X_B (?X_F (LOVE.V (K SMASH.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A man has soap in a hair of a man still."
			"A man washes a hair of a man quickly."
			"A man take.51s a shower."
			"A hot water goes cold."
			"A man has soap in a hair of a man still."
			"A man washes a hair of a man quickly."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.17.V)
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
	     ((ADV-A (FOR.P (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C)))) GO.17.V))))
			(?X_D
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C))))
	      GO.17.V))))
			(?X_D
	   (?X_A
	    ((ADV-A (DESTINATION_PREP.? (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C))))
	     GO.17.V)
	    (KA (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C))))
			(?X_D (?X_A (LOCATION_ADV.? GO.17.V)))
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
	              (COMPOSITE-SCHEMA-108.PR ?X_B ?X_I
	               (KA (((ADV-A (ON.P ?X_A)) VISIT.V) ?X_N))))
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
			(?X_M
	   (?X_O ((ADV-A (FROM.P ?L1)) GO.17.V)
	    (KA (((ADV-A (ON.P ?X_A)) VISIT.V) ?X_N))))
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
			"A get so big agent get.74s a for a get so big agent."
			"A get so big agent loves smash."
	)
)



(
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-109.PR (SET-OF ?X_L ?X_E ?X_K) ?X_F)) ** ?E)
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
			"A agent go.82s on X_A visiting a farm from L1."
			"X_C is X_B."
			"A farm has a lot of animals."
			"X_C is DURING a day fun very."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-110.PR ?X_A ?X_H)) ** ?E)
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
			"A agent sees a good man to a dog is X_D has a big hat a dog is X_D has a big hat and a cow with a good man to X_E."
			"A dog is X_D has a big hat takes a big hat may to a good man to a dog is X_D has a big hat."
			"A cow with a good man to X_E runs can."
			"A cow with a good man to X_E plays not can."
	)
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-111.PR (K BAD.A) ?X_C ?X_I)) ** ?E)
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
			"A bed of X_I swats X_A away."
			"X_A is under."
			"X_A runs under a bed of X_I."
	)
)



(
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-112.PR (KA ((ADV-A (WITH.P ?X_M)) PLAY.V))
	               (K CATCH.N)
	               (K (L X (AND (X TO.P) (X ((ADV-A (IN.P ?X_O)) SWIM.V)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F PARK.N))
			(!R2 (?X_M DOG.N))
			(!R3 (?X_M (PERTAIN-TO ?X_N)))
			(!R4 (?X_O LAKE.N))
		)
		(:STEPS
			(?X_H (?X_N ((ADV-A (THROUGH.P ?X_F)) RUN.V)))
			(?X_J (?X_N ((ADV-A (WITH.P ?X_M)) PLAY.V)))
			(?X_C (?X_N (LOVE.V (KA ((ADV-A (WITH.P ?X_M)) PLAY.V)))))
			(?X_L (?X_A (PLAY.V (K CATCH.N))))
			(?X_D (?X_N ((ADV-A (IN.P ?X_O)) SWIM.V)))
			(?X_E (?X_N TO.P))
			(?X_Q
	   (?X_N (LOVE.V (K (L X (AND (X TO.P) (X ((ADV-A (IN.P ?X_O)) SWIM.V))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_J)))
			(!W2 (?X_H (BEFORE ?X_C)))
			(!W3 (?X_H (BEFORE ?X_L)))
			(!W4 (?X_H (BEFORE ?X_D)))
			(!W5 (?X_H (BEFORE ?X_E)))
			(!W6 (?X_H (BEFORE ?X_Q)))
			(!W7 (?X_J (BEFORE ?X_C)))
			(!W8 (?X_J (BEFORE ?X_L)))
			(!W9 (?X_J (BEFORE ?X_D)))
			(!W10 (?X_J (BEFORE ?X_E)))
			(!W11 (?X_J (BEFORE ?X_Q)))
			(!W12 (?X_C (BEFORE ?X_L)))
			(!W13 (?X_C (BEFORE ?X_D)))
			(!W14 (?X_C (BEFORE ?X_E)))
			(!W15 (?X_C (BEFORE ?X_Q)))
			(!W16 (?X_L (BEFORE ?X_D)))
			(!W17 (?X_L (BEFORE ?X_E)))
			(!W18 (?X_L (BEFORE ?X_Q)))
			(!W19 (?X_D (BEFORE ?X_E)))
			(!W20 (?X_D (BEFORE ?X_Q)))
			(!W21 (?X_E (BEFORE ?X_Q)))
		)
	)
	(
			"X_B feels bad."
			"A friend suggests for drinking more water."
			"X_B gives X_C a try."
	)
)



(
	(EPI-SCHEMA (((K SUSIE.N) (COMPOSITE-SCHEMA-113.PR ?X_D)) ** ?E)
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
			"X_N runs through a park."
			"X_N plays with a dog of X_N."
			"X_N loves with a dog of X_N playing."
			"X_A plays catch."
			"X_N swims in a lake."
			"X_N is to."
			"X_N loves to swimming."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-114.PR) ** ?E)
		(:ROLES
			(!R1 (?X_A HEN.N))
			(!R2 (?X_A CAT.N))
		)
		(:STEPS
			(E219.SK (?X_A ((ADV-A (AT.P ?X_A)) RUN.V)))
		)
	)
	(
			"Susie is at."
			"Susie looks at a cd of susie."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-115.PR (KA ((ADV-A (ON.P ?X_E)) RIDE.V))
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
			"A hen cat runs at a hen cat."
	)
)



(
	(EPI-SCHEMA ((?X_D ((IN.PRT ((ADV-A (FROM.P (K OUTSIDE.N))) COME.1.V)) ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D SON.N))
			(!R2 ((K OUTSIDE.N) LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) COME.1.V)))
			(?X_E
	   (?X_D
	    ((ADV-A (FROM.P (K OUTSIDE.N)))
	     ((ADV-A (DESTINATION_PREP.? ?L2)) COME.1.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) COME.1.V) ?L2))
			(?X_E (?X_D (LOCATION_ADV.? COME.1.V)))
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
	(EPI-SCHEMA ((?X_D ((IN.PRT ((ADV-A (FROM.P (K OUTSIDE.N))) COME.2.V)) ?L2))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_D SON.N))
			(!R2 ((K OUTSIDE.N) LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) COME.2.V)))
			(?X_E
	   (?X_D
	    ((ADV-A (FROM.P (K OUTSIDE.N)))
	     ((ADV-A (DESTINATION_PREP.? ?L2)) COME.2.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) COME.2.V) ?L2))
			(?X_E (?X_D (LOCATION_ADV.? COME.2.V)))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-116.PR (K BETTER.A) ?X_M ?X_F)) ** ?E)
		(:ROLES
			(!R1 (?X_C (PLUR PERSON.N)))
			(!R2 (?X_F ALBUM.N))
			(!R3 (?X_M SINGER.N))
		)
		(:STEPS
			(?X_L (?X_M (HARD.ADV WORK.V)))
			(?X_J (?X_M (GET.V (K BETTER.A))))
			(?X_H ((K (PLUR PERSON.N)) (NOTICE.V ?X_M)))
			(?X_B (?X_C (BUY.V ?X_F)))
			(?X_E (?X_M MAKE.10.V ?X_F))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_J)))
			(!W2 (?X_L (BEFORE ?X_H)))
			(!W3 (?X_L (BEFORE ?X_B)))
			(!W4 (?X_J (BEFORE ?X_H)))
			(!W5 (?X_J (BEFORE ?X_B)))
			(!W6 (?X_H (BEFORE ?X_B)))
		)
	)
	(
			"A singer works hard."
			"A singer gets better."
			"Persons notice a singer."
			"A persons buy a album."
			"A singer make.204s a album."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?X_B)) GO.19.V)
	              (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))
	             ** ?X_F)
		(:ROLES
			(!R1 (?X_C GIRL.N))
			(!R2 (?X_B HOME.N))
			(!R3 ((KA ((ADV-A (WITH.P ?X_D)) PLAY.V)) DESTINATION.N))
			(!R4 (NOT (?X_B = (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))))
			(!R5 (?X_C LOST.A))
			(!R6 (?X_D (PLUR FRIEND.N)))
			(!R7 (?X_D (PERTAIN-TO ?X_C)))
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
			(?X_F
	   (?X_C
	    ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
	     ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))) GO.19.V))))
			(?X_F
	   (?X_C
	    ((ADV-A (FROM.P ?X_B))
	     ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
	      GO.19.V))))
			(?X_F
	   (?X_C
	    ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))) GO.19.V)
	    (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
			(?X_F (?X_C (LOCATION_ADV.? GO.19.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_F))
			(!W2 (?I2 BEFORE ?X_F))
			(!W3 (?P1 AFTER ?X_F))
			(!W4 (?P2 AFTER ?X_F))
			(!W5 (?G1 CAUSE-OF ?X_F))
			(!W6 (?X_F (RIGHT-AFTER ?X_E)))
			(!W7 (?X_F (SAME-TIME ?X_H)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?X_B)) GO.20.V)
	              (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C GIRL.N))
			(!R2 (?X_B HOME.N))
			(!R3 ((KA ((ADV-A (WITH.P ?X_D)) PLAY.V)) DESTINATION.N))
			(!R4 (NOT (?X_B = (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))))
			(!R5 (?X_C LOST.A))
			(!R6 (?X_D (PLUR FRIEND.N)))
			(!R7 (?X_D (PERTAIN-TO ?X_C)))
			(!R8 (?X_A (PLUR PARENT.N)))
			(!R9 (?X_B (PERTAIN-TO ?X_A)))
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
	     ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))) GO.20.V))))
			(?X_E
	   (?X_C
	    ((ADV-A (FROM.P ?X_B))
	     ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
	      GO.20.V))))
			(?X_E
	   (?X_C
	    ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))) GO.20.V)
	    (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
			(?X_E (?X_C (LOCATION_ADV.? GO.20.V)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?X_B)) GO.21.V)
	              (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C GIRL.N))
			(!R2 (?X_B HOME.N))
			(!R3 ((KA ((ADV-A (WITH.P ?X_D)) PLAY.V)) DESTINATION.N))
			(!R4 (NOT (?X_B = (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))))
			(!R5 (?X_C LOST.A))
			(!R6 (?X_D (PLUR FRIEND.N)))
			(!R7 (?X_D (PERTAIN-TO ?X_C)))
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
	     ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))) GO.21.V))))
			(?X_E
	   (?X_C
	    ((ADV-A (FROM.P ?X_B))
	     ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
	      GO.21.V))))
			(?X_E
	   (?X_C
	    ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))) GO.21.V)
	    (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
			(?X_E (?X_C (LOCATION_ADV.? GO.21.V)))
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
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-117.PR ?X_G ?X_O
	               (KA ((ADV-A (WITH.P ?X_N)) PLAY.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G HOME.N))
			(!R2 (?X_H (PLUR PARENT.N)))
			(!R3 (?X_G (PERTAIN-TO ?X_H)))
			(!R4 (?X_K STREET.N))
			(!R5 (?X_N (PLUR FRIEND.N)))
			(!R6 (?X_O GIRL.N))
			(!R7 (?X_O LOST.A))
			(!R8 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_D (?X_H (FIND.V ?X_O ?X_G)))
			(?X_M
	   (?X_O ((ADV-A (FROM.P ?X_G)) GO.20.V) (KA ((ADV-A (WITH.P ?X_N)) PLAY.V))))
			(?X_A
	   (?X_O ((ADV-A (FROM.P ?X_G)) GO.19.V) (KA ((ADV-A (WITH.P ?X_N)) PLAY.V))))
			(?X_A
	   (?X_O ((ADV-A (FROM.P ?X_G)) GO.21.V) (KA ((ADV-A (WITH.P ?X_N)) PLAY.V))))
			(?X_J (?X_O ((ADV-A (ACROSS.P ?X_K)) GO.V)))
			(?X_F (?X_H (OVER.PRT ((ADV-A (FOR.P (KA (GET.V ?X_O)))) GO.V))))
			(?X_B (?X_H (((ADV-A (IN.P ?X_G)) FIND.V) ?X_O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
			(!W2 (?X_M (BEFORE ?X_A)))
			(!W3 (?X_M (BEFORE ?X_J)))
			(!W4 (?X_M (BEFORE ?X_F)))
			(!W5 (?X_M (BEFORE ?X_B)))
			(!W6 (?X_A (BEFORE ?X_J)))
			(!W7 (?X_A (BEFORE ?X_F)))
			(!W8 (?X_A (BEFORE ?X_B)))
			(!W9 (?X_J (BEFORE ?X_F)))
			(!W10 (?X_J (BEFORE ?X_B)))
			(!W11 (?X_F (BEFORE ?X_B)))
		)
	)
	(
			"A parents find a girl lost a home of a parents."
			"A girl lost go.211s with a friends of a girl lost playing from a home of a parents."
			"A girl lost go.208s with a friends of a girl lost playing from a home of a parents."
			"A girl lost go.214s with a friends of a girl lost playing from a home of a parents."
			"A girl lost goes across a street."
			"A parents go over for getting a girl lost."
			"A parents find a girl lost in a home of a parents."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-118.PR) ** ?E)
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
	              (COMPOSITE-SCHEMA-119.PR (K MORE.A)
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
	(EPI-SCHEMA ((?X_D (MAY.AUX ((ADV-A (NEAR.P ?X_A)) PLAY.17.V))) ** ?X_E)
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
			(!R10 (?X_C MAT.N))
			(!R11 (?X_C SOFT.A))
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
			(?X_E (?X_D ((ADV-A (WITH.P ?X_C)) PLAY.17.V)))
			(?X_E (?X_D PLAY.17.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_E (AT-ABOUT ?X_F)))
			(!W3 (?X_G (SAME-TIME ?X_F)))
			(!W4 (?X_G (RIGHT-AFTER ?X_H)))
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
	(EPI-SCHEMA ((?X_D (MAY.AUX ((ADV-A (NEAR.P ?X_A)) PLAY.18.V))) ** ?X_E)
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
			(?X_E (?X_D ((ADV-A (WITH.P ?X_C)) PLAY.18.V)))
			(?X_E (?X_D PLAY.18.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_E (SAME-TIME ?X_H)))
			(!W3 (?X_E (RIGHT-AFTER ?X_F)))
			(!W4 (?X_G (AT-ABOUT ?X_H)))
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
	(EPI-SCHEMA ((?X_D (MAY.AUX ((ADV-A (NEAR.P ?X_A)) PLAY.19.V))) ** ?X_F)
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
			(?X_F (?X_D ((ADV-A (WITH.P ?X_C)) PLAY.19.V)))
			(?X_F (?X_D PLAY.19.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_F (RIGHT-AFTER ?X_E)))
			(!W3 (?X_F (SAME-TIME ?X_H)))
			(!W4 (?X_G (AT-ABOUT ?X_H)))
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
	(EPI-SCHEMA ((?X_C COMPOSITE-SCHEMA-120.PR) ** ?E)
		(:ROLES
			(!R1 (?X_G WHILE.N))
			(!R2 (?X_C AGENT.N))
			(!R3 (?X_F SOFT.A))
			(!R4 (?X_F MAT.N))
			(!R5 (?X_H FEMALE.A))
			(!R6 (?X_H AGENT.N))
			(!R7 (?X_G (PERTAIN-TO ?X_H)))
		)
		(:STEPS
			(?X_E ((K BABY.N) ((ADV-A (ON.P ?X_F)) SIT.V)))
			(?X_B (?X_C (MAY.AUX ((ADV-A (NEAR.P ?X_G)) PLAY.17.V))))
			(E331.SK (?X_C (MAY.AUX ((ADV-A (NEAR.P ?X_G)) PLAY.18.V))))
			(E331.SK (?X_C (MAY.AUX ((ADV-A (NEAR.P ?X_G)) PLAY.19.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E BEFORE ?X_B))
			(!W2 (?X_B BEFORE E331.SK))
		)
	)
	(
			"Baby sits on a soft mat."
			"A agent play.247s may near a while of a female agent."
			"A agent play.248s may near a while of a female agent."
			"A agent play.249s may near a while of a female agent."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-121.PR ?X_B)) ** ?E)
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
	(EPI-SCHEMA ((?X_J
	              (COMPOSITE-SCHEMA-122.PR (K (PLUR PUPPY.N))
	               (K (L X (AND (X COLD.A) (X OUTSIDE.N)))) ?X_L))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G GARAGE.N))
			(!R2 (?X_J DOG.N))
			(!R3 (?X_J (PERTAIN-TO ?X_K)))
			(!R4 (?X_L PUPPY.A))
			(!R5 (?X_L OUTSIDE.N))
		)
		(:STEPS
			(?X_D (?X_J (HAVE.V (K (PLUR PUPPY.N)))))
			(?X_F (?X_A (BE.V (K (L X (AND (X COLD.A) (X OUTSIDE.N)))))))
			(?X_I (?X_J ((ADV-A (INTO.P ?X_G)) COME.V)))
			(?X_N (?X_J (HAVE.V ?X_L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_I)))
			(!W3 (?X_D (BEFORE ?X_N)))
			(!W4 (?X_F (BEFORE ?X_I)))
			(!W5 (?X_F (BEFORE ?X_N)))
			(!W6 (?X_I (BEFORE ?X_N)))
		)
	)
	(
			"A dog of X_K has puppys."
			"X_A is cold outside."
			"A dog of X_K comes into a garage."
			"A dog of X_K has a puppy outside."
	)
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-123.PR (K GUILTY.A) ?Y ?X_K)) ** ?E)
		(:ROLES
			(!R1 (?X_K CRAVING.N))
			(!R2 (?X_L MAN.N))
		)
		(:STEPS
			(?X_J (?X_L (HAVE.V ?X_K)))
			(?X_H (?X_L (IGNORE.V ?X_K)))
			(?X_F (?X_K GROW.V))
			(?X_D (?X_L (((ADV-A (INTO.P ?X_K)) FEED.2.V) ?Y ?X_K)))
			(?X_D (?X_L (((ADV-A (INTO.P ?X_K)) FEED.3.V) ?Y ?X_K)))
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
			"A man feed.284s Y a craving into a craving."
			"A man feed.285s Y a craving into a craving."
			"A man feels guilty."
	)
)



(
	(EPI-SCHEMA ((?X_J
	              (COMPOSITE-SCHEMA-124.PR
	               (KE (AND (?X_G (PASV STICK.V)) (?X_G (IN.P ?X_D)))) ?X_G
	               (KE (?X_A LIFE.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D TREE.N))
			(!R2 (?X_G DOG.N))
			(!R3 (?X_J (HOME.ADV WALK.V)))
		)
		(:STEPS
			(?X_C (?X_J (SEE.V (KE (AND (?X_G (PASV STICK.V)) (?X_G (IN.P ?X_D)))))))
			(?X_F (?X_J (((ADV-A (FROM.P ?X_D)) FREE.V) ?X_G)))
			(?X_I (?X_G (OFF.PRT RUN.V)))
			(?X_L (?X_J (SAVE.V (KE (?X_A LIFE.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_F)))
			(!W2 (?X_C (BEFORE ?X_I)))
			(!W3 (?X_C (BEFORE ?X_L)))
			(!W4 (?X_F (BEFORE ?X_I)))
			(!W5 (?X_F (BEFORE ?X_L)))
			(!W6 (?X_I (BEFORE ?X_L)))
		)
	)
	(
			"A home walk sees and a dog PASV sticks a dog in a tree."
			"A home walk frees a dog from a tree."
			"A dog runs off."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.25.V ?X_B) ** ?X_C)
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-125.PR ?X_J (K GREAT.A) ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_I (PLUR SCISSOR.N)))
			(!R2 (?X_J LOT.N))
			(!R3 (?X_J (OF.P (K (L X (AND (X SPLIT.A) (X (PLUR END.N))))))))
		)
		(:STEPS
			(?X_B (?X_A (HAVE.V ?X_J)))
			(?X_H (?X_A GET.25.V ?X_I))
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
			"X_A get.3s a scissors."
			"X_A cuts a lot of split end then off."
			"X_A looks great then."
	)
)



(
	(EPI-SCHEMA (((K DOG.N) COMPOSITE-SCHEMA-126.PR) ** ?E)
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-127.PR ?X_K ?X_H ?X_A)) ** ?E)
		(:ROLES
			(!R1 (?X_B BOY.N))
			(!R2 (?X_G PERSON.N))
			(!R3 (?X_H HILL.N))
			(!R4 (?X_K ROCK.N))
		)
		(:STEPS
			(?X_D (?X_B (KICK.V ?X_K)))
			(?X_F (?X_K (LOOSE.ADV COME.V)))
			(?X_J (?X_G ((UP.PRT WALK.V) ?X_H)))
			(?X_M (?X_K ((ALMOST.ADV HIT.V) ?X_A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_J)))
			(!W3 (?X_D (BEFORE ?X_M)))
			(!W4 (?X_F (BEFORE ?X_J)))
			(!W5 (?X_F (BEFORE ?X_M)))
			(!W6 (?X_J (BEFORE ?X_M)))
		)
	)
	(
			"A boy kicks a rock."
			"A rock comes loose."
			"A person walks a hill up."
			"A rock hits X_A almost."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.22.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D POUND.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
			(!R7 (?X_A (K NEW.A) PET.N))
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
	      ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_B)) LOOK.V)))) GO.22.V)))))
			(?X_E
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.22.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.22.V) ?X_D))
			(?X_E (?X_C (LOCATION_ADV.? GO.22.V)))
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
	              (((ADV-A (AT.P ?X_H)) ((ADV-A (AS.P ?X_A)) TAKE.14.V)) ?X_C))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_A (K NEW.A) PET.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_C PUPPY.N))
			(!R8 (?X_C SAD.A))
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
	(EPI-SCHEMA ((?X_B
	              (((ADV-A (AT.P ?X_H)) ((ADV-A (AS.P ?X_A)) TAKE.16.V)) ?X_C))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C SAD.A))
			(!R6 (?X_C PUPPY.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_A (K NEW.A) PET.N))
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
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-128.PR ?X_C
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.23.V) ?X_B) ** ?X_C)
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
	     (OUT.ADV ((ADV-A (TO.P ?X_B)) GO.23.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.23.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.23.V) ?X_B))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-129.PR ?X_N ?X_G ?X_K)) ** ?E)
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
			(?X_M (?X_O (LEAVE.V ?X_N)))
			(?X_J (?X_O ((ADV-A (FROM.P ?L1)) GO.23.V) ?X_K))
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
			"A cow leaves a barn."
			"A cow go.66s a field from L1."
			"A cows other are out."
			"A cows other are in."
			"A cow finds a spot of grass grass."
			"A cow eats a spot of grass grass."
	)
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-130.PR ?X_C)) ** ?E)
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
	              (COMPOSITE-SCHEMA-131.PR
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
	(EPI-SCHEMA ((?X_A GET.26.V ?X_B) ** ?X_D)
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
	(EPI-SCHEMA ((?X_A GET.27.V ?X_B) ** ?X_C)
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
	(EPI-SCHEMA ((?X_A GET.28.V ?X_B) ** ?X_E)
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-132.PR ?X_B ?X_I ?X_D)) ** ?E)
		(:ROLES
			(!R1 (?X_I TREE.N))
		)
		(:STEPS
			(?X_K (?X_A (K (PLUR EGG.N)) (HAVE.V ?X_B)))
			(?X_H (?X_C ((UP.PRT GO.V) ?X_I)))
			(?X_F (?X_C GET.26.V ?X_D))
			(?X_F (?X_C GET.27.V ?X_D))
			(?X_F (?X_C GET.28.V ?X_D))
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
			"X_C get.95s X_D."
			"X_C get.96s X_D."
			"X_C get.97s X_D."
	)
)



(
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-133.PR ?X_M ?X_J ?X_K ?X_N)) ** ?E)
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-134.PR (K (VERY.ADV WET.A)))) ** ?E)
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
	(EPI-SCHEMA ((?X_B ((OUT.PRT GET.29.V) (KA (SEE.V ?X_C)))) ** ?X_D)
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
	(EPI-SCHEMA ((?X_E (COMPOSITE-SCHEMA-135.PR ?X_F (KA (SEE.V ?X_F)))) ** ?E)
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
			(?X_B (?X_E ((OUT.PRT GET.29.V) (KA (SEE.V ?X_F)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A home drive sad a home drive sad X_E kills a dead dog in X_G kills a dead dog in a road hits a dead dog in a road."
			"A home drive sad a home drive sad X_E kills a dead dog in X_G kills a dead dog in a road get.143s seeing a dead dog in a road out."
	)
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
	(EPI-SCHEMA ((?X_B
	              (COMPOSITE-SCHEMA-136.PR (K (PLUR BINOCULAR.N)) ?X_A ?X_F
	               (K (PLUR BIRD.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F (PLUR FRIEND.N)))
			(!R2 (?X_F (PERTAIN-TO ?X_G)))
		)
		(:STEPS
			(?X_O (?X_B (BUY.V (K (PLUR BINOCULAR.N)))))
			(?X_M (?X_B ((OUTSIDE.ADV TAKE.V) ?X_A)))
			(?X_K (?X_B (SEE.V (K (PLUR BIRD.N)))))
			(?X_C ((K (PLUR BIRD.N)) (BECOME.V ?X_F)))
			(?X_E ((K (PLUR BIRD.N)) (BECOME.V ?X_F)))
			(?X_I (?X_B WATCH.4.V (K (PLUR BIRD.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_M)))
			(!W2 (?X_O (BEFORE ?X_K)))
			(!W3 (?X_O (BEFORE ?X_C)))
			(!W4 (?X_O (BEFORE ?X_E)))
			(!W5 (?X_M (BEFORE ?X_K)))
			(!W6 (?X_M (BEFORE ?X_C)))
			(!W7 (?X_M (BEFORE ?X_E)))
			(!W8 (?X_K (BEFORE ?X_C)))
			(!W9 (?X_K (BEFORE ?X_E)))
			(!W10 (?X_C (BEFORE ?X_E)))
		)
	)
	(
			"X_B buys binoculars."
			"X_B takes X_A outside."
			"X_B sees birds."
			"Birds become a friends of X_G."
			"Birds become a friends of X_G."
			"X_B watch.151s birds."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-137.PR) ** ?E)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.24.V) ?X_B) ** ?X_C)
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.24.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.24.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.24.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.24.V)))
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
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-138.PR ?X_N ?X_A ?X_F ?X_K)) ** ?E)
		(:ROLES
			(!R1 (?X_F LIZARD.N))
			(!R2 (?X_K PET.N))
			(!R3 (?X_K STORE.N))
			(!R4 (?X_N PET.N))
		)
		(:STEPS
			(?X_M (?X_B (WANT.V ?X_N)))
			(?X_J (?X_B ((ADV-A (FROM.P ?L1)) GO.24.V) ?X_K))
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
			"X_B go.189s a pet store from L1."
			"X_A is lizard."
			"X_B finds X_A."
			"X_B buys a lizard."
	)
)



(
	(EPI-SCHEMA ((?X_B EAT.7.V ?X_A) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_A FOOD.N))
			(!R3 (?X_A MUFFIN.N))
			(!R4 (?X_A BIG.A))
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
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-139.PR ?X_C)) ** ?E)
		(:ROLES
			(!R1 (?X_C BIG.A))
			(!R2 (?X_C MUFFIN.N))
			(!R3 (?X_D AGENT.N))
		)
		(:STEPS
			(?X_B (?X_D EAT.7.V ?X_C))
		)
	)
	(
			"A agent eat.195s a big muffin."
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.25.V ?X_A (KA (MAKE.V ?X_B))) ** ?E)
		(:ROLES
			(!R1 (?X_A GIRL.N))
			(!R2 ((KA (MAKE.V ?X_B)) ACTION.N))
			(!R3 (?X_B PRETTY.A))
			(!R4 (?X_B DRESS.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V ?X_A (KA (MAKE.V ?X_B)))))
			(?G2 (?X_A (WANT.V (THAT (?X_A (MAKE.V ?X_B))))))
		)
		(:STEPS
			(?E1 (?X_A (ASK.V ?X_A (KA (MAKE.V ?X_B)))))
			(?X_C (?X_A (MAKE.V ?X_B)))
		)
		(:PARAPHRASES
			(?E (?X_A (ASK.V ?X_A (KA (MAKE.V ?X_B)))))
			(?E (?X_A (TELL.V ?X_A (KA (MAKE.V ?X_B)))))
			(?E (?X_A (MAKE.V ?X_A (KA (MAKE.V ?X_B)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?G1 CAUSE-OF ?E1))
			(!W2 (?E1 CAUSE-OF ?X_C))
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.26.V ?X_B (KA (MAKE.V ?X_C))) ** ?E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B GIRL.N))
			(!R3 ((KA (MAKE.V ?X_C)) ACTION.N))
			(!R4 (?X_C PRETTY.A))
			(!R5 (?X_C DRESS.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V ?X_B (KA (MAKE.V ?X_C)))))
			(?G2 (?X_A (WANT.V (THAT (?X_A (MAKE.V ?X_C))))))
		)
		(:STEPS
			(?E1 (?X_A (ASK.V ?X_B (KA (MAKE.V ?X_C)))))
			(?X_D (?X_B (MAKE.V ?X_C)))
		)
		(:PARAPHRASES
			(?E (?X_A (ASK.V ?X_B (KA (MAKE.V ?X_C)))))
			(?E (?X_A (TELL.V ?X_B (KA (MAKE.V ?X_C)))))
			(?E (?X_A (MAKE.V ?X_B (KA (MAKE.V ?X_C)))))
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
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-140.PR ?X_C ?X_D (KA (MAKE.V ?X_C)))) ** ?E)
		(:ROLES
			(!R1 (?X_C PRETTY.A))
			(!R2 (?X_C DRESS.N))
			(!R3 (?X_D GIRL.N))
			(!R4 (?X_E AGENT.N))
		)
		(:STEPS
			(?X_B (?X_D MAKE.11.V ?X_C))
			(?E_1 (?X_D REQUEST_ACTION.25.V ?X_D (KA (MAKE.V ?X_C))))
			(?E_2 (?X_E REQUEST_ACTION.26.V ?X_D (KA (MAKE.V ?X_C))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E_1 (BEFORE ?E_2)))
		)
	)
	(
			"A girl make.214s a pretty dress."
			"A girl request action.210s a girl making a pretty dress."
			"A agent request action.211s a girl making a pretty dress."
	)
)



(
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-141.PR (K (PLUR RAINBOW.N)) ?X_J)) ** ?E)
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-142.PR ?X_D ?X_I)) ** ?E)
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-143.PR ?X_E)) ** ?E)
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
	)
)



(
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-144.PR (KA (SEE.V ?X_C)) (KA LEAVE.V))) ** ?E)
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
			"A too bad out go is DURING a night raining."
			"X_A cook.2s a too bad out go must."
			"X_A cook.3s a too bad out go must."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.25.V) ?X_C) ** ?X_D)
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
	   (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) GO.25.V))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.25.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.25.V) ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? GO.25.V)))
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
	(EPI-SCHEMA ((?X_P (COMPOSITE-SCHEMA-145.PR ?X_I ?X_O ?X_D ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_D BOOT.N))
			(!R2 (?X_I FISH.N))
			(!R3 (?X_O ROD.N))
			(!R4 (?X_N POND.N))
			(!R5 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_K (?X_P (CAST.V ?X_O ?X_N)))
			(?X_M (?X_P ((ADV-A (FROM.P ?L1)) GO.25.V) ?X_N))
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
			"X_P go.18s a pond from L1."
			"X_P casts a rod of X_P in a pond."
			"X_P catches a fish."
			"X_P pulls a rod of X_P up."
			"A rod of X_P is a boot actually."
	)
)



(
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-146.PR ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_L BOY.N))
			(!R2 (?X_D RIM.N))
			(!R3 (?X_K BROTHER.N))
			(!R4 (?X_K (PERTAIN-TO ?X_L)))
			(!R5 (?X_M STREET.N))
			(!R6 (?X_N BASKET.N))
		)
		(:STEPS
			(?X_C (?X_L (SHOOT.V ?X_N)))
			(?X_F (?X_N (HARD.ADV ((ADV-A (OFF.P ?X_D)) BOUNCE.V))))
			(?X_H (?X_N ((ADV-A (INTO.P ?X_M)) GO.V)))
			(?X_J (?X_K (AFTER.P ?X_N)))
			(?X_A (?X_K ((ADV-A (AFTER.P ?X_N)) RUN.V)))
			(?X_P (?X_K (((ADV-A (IN.P ?X_M)) CATCH.V) ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_F)))
			(!W2 (?X_C (BEFORE ?X_H)))
			(!W3 (?X_C (BEFORE ?X_J)))
			(!W4 (?X_C (BEFORE ?X_A)))
			(!W5 (?X_C (BEFORE ?X_P)))
			(!W6 (?X_F (BEFORE ?X_H)))
			(!W7 (?X_F (BEFORE ?X_J)))
			(!W8 (?X_F (BEFORE ?X_A)))
			(!W9 (?X_F (BEFORE ?X_P)))
			(!W10 (?X_H (BEFORE ?X_J)))
			(!W11 (?X_H (BEFORE ?X_A)))
			(!W12 (?X_H (BEFORE ?X_P)))
			(!W13 (?X_J (BEFORE ?X_A)))
			(!W14 (?X_J (BEFORE ?X_P)))
			(!W15 (?X_A (BEFORE ?X_P)))
		)
	)
	(
			"A boy shoots a basket."
			"A basket bounces hard off a rim."
			"A basket goes into a street."
			"A brother of a boy is after."
			"A brother of a boy runs after a basket."
			"A brother of a boy catches a basket in a street."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.30.V ?X_B) ** ?X_C)
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-147.PR ?X_D ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_D BOX.N))
			(!R2 (?X_D (VERY.ADV AMAZING.A)))
			(!R3 (?X_I NEW.A))
			(!R4 (?X_I IPAD.N))
			(!R5 (?X_I NICE.A))
			(!R6 (?X_J AGENT.N))
		)
		(:STEPS
			(?X_H (?X_J GET.30.V ?X_I))
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
			"A agent get.46s a new ipad nice."
			"X_A likes a new ipad nice ADV very much."
			"A agent saves a box very amazing."
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.27.V
	              (KA (SEE.V (?X_B ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V)))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2
	   ((KA (SEE.V (?X_B ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V)))) ACTION.N))
			(!R3 (?X_B (OF.P (K FUN.N))))
			(!R4 (?X_B (PLUR PUPPY.N)))
			(!R5 (?X_B FULL.A))
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
	              (COMPOSITE-SCHEMA-148.PR
	               (KA (SEE.V (?X_A ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_A (PLUR PUPPY.N)))
			(!R2 (?X_A FULL.A))
			(!R3 (?X_A (OF.P (K FUN.N))))
			(!R4 (?X_B AGENT.N))
		)
		(:STEPS
			(E109.SK
	   (?X_B ENJOY_ACTION.27.V
	    (KA (SEE.V (?X_A ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V))))))
		)
	)
	(
			"A agent enjoy action.59s seeing a puppys full of fun with each other play."
	)
)



(
	(EPI-SCHEMA ((?X_C EAT.8.V ?X_B) ** ?X_E)
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
	(EPI-SCHEMA ((?X_C EAT.9.V ?X_B) ** ?X_D)
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
	              (COMPOSITE-SCHEMA-149.PR ?X_P (KA (L X (AND (X RUN.V) (X PLAY.V))))
	               ?X_R))
	             ** ?E)
		(:ROLES
			(!R1 (?X_R COCOANUT.N))
			(!R2 (?X_P TREE.N))
			(!R3 (?X_Q MONKEY.N))
			(!R4 (?X_S GROUND.N))
			(!R5 (?X_R (TO.P ?X_S)))
		)
		(:STEPS
			(?X_O (?X_Q ((CAN.AUX CLIMB.V) ?X_P)))
			(?X_K (?X_Q (CLIMB.V ?X_P)))
			(?X_M (?X_Q (GET.V ?X_R)))
			(?X_I (?X_Q (DROP.V ?X_R)))
			(?X_G (?X_Q (DOWN.ADV COME.V)))
			(?X_E (?X_Q EAT.8.V ?X_R))
			(?X_E (?X_Q EAT.9.V ?X_R))
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
			"A monkey climbs a tree can."
			"A monkey climbs a tree."
			"A monkey gets a cocoanut to a ground."
			"A monkey drops a cocoanut to a ground."
			"A monkey comes down."
			"A monkey eat.69s a cocoanut to a ground."
			"A monkey eat.70s a cocoanut to a ground."
			"A monkey likes run playing."
	)
)



(
	(EPI-SCHEMA ((?X_A ((AWAY.ADV GET.31.V) ?O)) ** ?X_B)
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
	(EPI-SCHEMA ((?X_B GET.32.V ?X_C) ** ?X_D)
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
	(EPI-SCHEMA ((?X_B GET.33.V ?X_C) ** ?X_E)
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
	(EPI-SCHEMA ((?X_B GET.27.V (K SICK.A)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-150.PR ?X_I (K SICK.A))) ** ?E)
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
			"X_K get.96s sick."
	)
)



(
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-151.PR ?X_H ?X_G ?X_I (K YOUNG.A) ?X_L ?X_P))
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
	              (COMPOSITE-SCHEMA-152.PR (KA (TRY.V ?X_C))
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
	              (COMPOSITE-SCHEMA-153.PR (K CHOCOLATE.N)
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
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-154.PR) ** ?E)
		(:ROLES
			(!R1 (?X_A DOG.N))
			(!R2 (?X_A (PLUR HEN.N)))
			(!R3 (?X_B CAT.N))
		)
		(:STEPS
			(?X_D (?X_A ((ADV-A (AT.P ?X_B)) RUN.V)))
		)
	)
	(
			"A dog hens runs at a cat."
	)
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-155.PR ?X_K)) ** ?E)
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
	              (COMPOSITE-SCHEMA-156.PR ?X_N (KE ((K MONEY.N) (FOR.P ?X_N))) ?X_B
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-157.PR (KA (FIND.V ?X_H)) ?X_K)) ** ?E)
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
	(EPI-SCHEMA ((?X_C TAKE.17.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D {REF}.N))
			(!R6 (?X_A BACKPACK.N))
			(!R7 (?X_A (PERTAIN-TO ?X_C)))
			(!R8 (?X_D (OF.P ?X_B)))
			(!R9 (?X_B STUFF.N))
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
	(EPI-SCHEMA ((?X_C TAKE.19.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D {REF}.N))
			(!R6 (?X_D (OF.P ?X_A)))
			(!R7 (?X_A STUFF.N))
			(!R8 (?X_B BACKPACK.N))
			(!R9 (?X_B (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((?X_B GET.34.V (K (L X (AND (X HAIR.N) (X STUFF.N))))) ** ?X_E)
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
	(EPI-SCHEMA ((?X_B GET.35.V (K (L X (AND (X HAIR.N) (X STUFF.N))))) ** ?X_D)
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
	(EPI-SCHEMA ((?X_B GET.36.V (K (L X (AND (X HAIR.N) (X STUFF.N))))) ** ?X_D)
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-158.PR ?X_J
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
			(?X_E (?X_L GET.34.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
			(?X_E (?X_L GET.36.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
			(?X_G (?X_L GET.35.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_E)))
			(!W2 (?X_I (BEFORE ?X_G)))
			(!W3 (?X_B (BEFORE ?X_E)))
			(!W4 (?X_B (BEFORE ?X_G)))
			(!W5 (?X_C (BEFORE ?X_E)))
			(!W6 (?X_C (BEFORE ?X_G)))
		)
	)
	(
			"A hair of a agent is a mess."
			"A agent is there."
			"A agent is there."
			"A agent get.204s hair stuff."
			"A agent get.206s hair stuff."
			"A agent get.205s hair stuff."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-159.PR ?X_B ?X_J)) ** ?E)
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-160.PR (ANOTHER.D EGG.N) ?X_J)) ** ?E)
		(:ROLES
			(!R1 (?X_G PAN.N))
			(!R2 (?X_J EGG.N))
			(!R3 (?X_K MAN.N))
		)
		(:STEPS
			(?X_I (?X_K (CRACK.V ?X_J)))
			(?X_D (?X_K ((OUT.PRT THROW.V) ?X_J)))
			(?X_B (?X_K (CRACK.V (ANOTHER.D EGG.N))))
			(?X_F (?X_K (((ADV-A (IN.P ?X_G)) PUT.5.V) ?X_J)))
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
	(EPI-SCHEMA ((?X_H COMPOSITE-SCHEMA-161.PR) ** ?E)
		(:ROLES
			(!R1 (?X_F FRIEND.N))
			(!R2 (?X_C MALE.A))
			(!R3 (?X_C AGENT.N))
			(!R4 (?X_G CAR.N))
			(!R5 (?X_H AGENT.N))
			(!R6 (?X_F (PERTAIN-TO ?X_H)))
			(!R7 (?X_G (PERTAIN-TO ?X_H)))
			(!R8 (?X_I ROAD.N))
		)
		(:STEPS
			(?X_B (?X_H (OUT.PRT ((ADV-A (WITH.P ?X_F)) HANG.V))))
			(?X_E
	   (?X_C ((ADV-A (IN.P (K (L X (AND (X FRONT.N) (X (OF.P ?X_G))))))) PULL.V)))
			(?X_K (?X_H ((ADV-A (OFF.P ?X_I)) GO.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_E)))
			(!W2 (?X_B (BEFORE ?X_K)))
			(!W3 (?X_E (BEFORE ?X_K)))
		)
	)
	(
			"A agent hangs out with a friend of a agent."
			"A male agent pulls in front of."
			"A agent goes off a road."
	)
)



(
	(EPI-SCHEMA ((?X_J
	              (COMPOSITE-SCHEMA-162.PR (KA (MORE.ADV ACTIVE.A))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) COME.3.V) ?L2) ** ?X_B)
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) COME.3.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) COME.3.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) COME.3.V) ?L2))
			(?X_B (?X_A ((ADV-A (BEFORE.P (K DARK.N))) COME.3.V)))
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-163.PR ?X_J ?L2)) ** ?E)
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
			(?X_E (?X_G (OFF.ADV ((ADV-A (ON.P ?X_F)) GO.V))))
			(?X_C (?X_G ((ADV-A (FROM.P ?L1)) COME.3.V) ?L2))
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
			"A agent goes off on a adventure."
			"A agent come.28s L2 from L1."
	)
)



(
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-164.PR ?X_C (K SCARED.A) ?X_K)) ** ?E)
		(:ROLES
			(!R1 (?X_C LOUD.A))
			(!R2 (?X_C OUTSIDE.N))
			(!R3 (?X_C NOISE.N))
			(!R4 (?X_B (OF.P ?X_C)))
			(!R5 (?X_H WOMAN.N))
			(!R6 (?X_K FRIEND.N))
		)
		(:STEPS
			(?X_E (?X_A (BE.V ?X_C)))
			(?X_G (?X_H (FEEL.V (K SCARED.A))))
			(?X_J (?X_H (CALL.V ?X_K)))
			(?X_M (?X_K (OVER.PRT COME.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_G)))
			(!W2 (?X_E (BEFORE ?X_J)))
			(!W3 (?X_E (BEFORE ?X_M)))
			(!W4 (?X_G (BEFORE ?X_J)))
			(!W5 (?X_G (BEFORE ?X_M)))
			(!W6 (?X_J (BEFORE ?X_M)))
		)
	)
	(
			"X_A is a loud outside noise."
			"A woman feels scared."
			"A woman calls a friend."
			"A friend comes over."
	)
)



(
	(EPI-SCHEMA ((?X_D (((ADV-A (IN.P (K TROUBLE.N))) GET.32.V) ?O)) ** ?X_E)
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-165.PR (K ((ADV-A (WITH.P ?X_L)) (TO.P ?X_I))) ?X_L
	               ?X_M ?O))
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
			(?X_H (?X_N (GO.V (K ((ADV-A (WITH.P ?X_L)) (TO.P ?X_I))))))
			(?X_F (?X_N (LOSE.V ?X_L)))
			(?X_B (?X_N (FOR.P ?X_M)))
			(?X_D (?X_N (((ADV-A (IN.P (K TROUBLE.N))) GET.32.V) ?O)))
			(?X_D (?X_N (((ADV-A (IN.P (K TROUBLE.N))) GET.31.V) ?O)))
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
			"A late agent goes with a friend of a late agent to a park."
			"A late agent loses a friend of a late agent."
			"A late agent is for."
			"A late agent get.77s O in trouble."
			"A late agent get.78s O in trouble."
	)
)



(
	(EPI-SCHEMA ((?X_G COMPOSITE-SCHEMA-166.PR) ** ?E)
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
	(EPI-SCHEMA ((?X_Q (COMPOSITE-SCHEMA-167.PR ?X_S (SET-OF ?X_S ?X_T))) ** ?E)
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
	              (COMPOSITE-SCHEMA-168.PR (KA (CATCH.V ?X_D))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-169.PR (KE (?X_J (HAVE.V ?X_F))) ?X_J ?X_K))
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
	              (COMPOSITE-SCHEMA-170.PR
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
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-171.PR ?X_H (KA HELP.V) ?X_I)) ** ?E)
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
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-172.PR (KA (PLAY.V (K ACCORDION.N))) ?X_L ?X_M
	               (K ACCORDION.N) ?X_N ?X_P))
	             ** ?E)
		(:ROLES
			(!R1 (?X_L (K FIRST.A) LESSON.N))
			(!R2 (?X_M LAP.N))
			(!R3 (?X_O (VERY.ADV TINY.A)))
			(!R4 (?X_L (PERTAIN-TO ?X_O)))
			(!R5 (?X_M (PERTAIN-TO ?X_O)))
			(!R6 (?X_N (PLUR KNEE.N)))
			(!R7 (?X_N (PERTAIN-TO ?X_O)))
			(!R8 (?X_P BIG.A))
			(!R9 (?X_P PAIN.N))
		)
		(:STEPS
			(?X_E (?X_O (WANT.V (KA (PLAY.V (K ACCORDION.N))))))
			(?X_G (?X_O (FOR.P ?X_L)))
			(?X_A (?X_O ((ADV-A (FOR.P ?X_L)) COME.V)))
			(?X_I (?X_O (PUT.V (K ACCORDION.N) ?X_M)))
			(?X_B (?X_O (((ADV-A (ON.P ?X_M)) PUT.V) (K ACCORDION.N))))
			(?X_K (?X_O ?X_P (IN.P ?X_N)))
			(?X_C (?X_O (((ADV-A (IN.P ?X_N)) FEEL.V) ?X_P)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_G)))
			(!W2 (?X_E (BEFORE ?X_A)))
			(!W3 (?X_E (BEFORE ?X_I)))
			(!W4 (?X_E (BEFORE ?X_B)))
			(!W5 (?X_E (BEFORE ?X_K)))
			(!W6 (?X_E (BEFORE ?X_C)))
			(!W7 (?X_G (BEFORE ?X_A)))
			(!W8 (?X_G (BEFORE ?X_I)))
			(!W9 (?X_G (BEFORE ?X_B)))
			(!W10 (?X_G (BEFORE ?X_K)))
			(!W11 (?X_G (BEFORE ?X_C)))
			(!W12 (?X_A (BEFORE ?X_I)))
			(!W13 (?X_A (BEFORE ?X_B)))
			(!W14 (?X_A (BEFORE ?X_K)))
			(!W15 (?X_A (BEFORE ?X_C)))
			(!W16 (?X_I (BEFORE ?X_B)))
			(!W17 (?X_I (BEFORE ?X_K)))
			(!W18 (?X_I (BEFORE ?X_C)))
			(!W19 (?X_B (BEFORE ?X_K)))
			(!W20 (?X_B (BEFORE ?X_C)))
			(!W21 (?X_K (BEFORE ?X_C)))
		)
	)
	(
			"A very tiny wants playing accordion."
			"A very tiny is for."
			"A very tiny comes for a of a very tiny."
			"A very tiny puts accordion a lap of a very tiny."
			"A very tiny puts accordion on a lap of a very tiny."
			"A very tiny is in."
			"A very tiny feels a big pain in a knees of a very tiny."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.26.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D STORE.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
			(!R7 (?X_A NEW.A))
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
	   (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) ((ADV-A (TO.P ?X_D)) GO.26.V))))
			(?X_E
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.26.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.26.V) ?X_D))
			(?X_E (?X_C (LOCATION_ADV.? GO.26.V)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.27.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D STORE.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
			(!R7 (?X_A (K OLD.A) (PLUR ONE.N)))
			(!R8 (?X_B NEW.A))
			(!R9 (?X_B (PERTAIN-TO ?X_C)))
			(!R10 (?X_B (PLUR CHAIR.N)))
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
	   (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) ((ADV-A (TO.P ?X_D)) GO.27.V))))
			(?X_E
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.27.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.27.V) ?X_D))
			(?X_E (?X_C (LOCATION_ADV.? GO.27.V)))
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
	(EPI-SCHEMA ((?X_C GET.37.V (K MORE.A)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT ((K MORE.A) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = (K MORE.A))))
			(!R5 (?X_A (K OLD.A) (PLUR ONE.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
			(!R7 (?X_B (PLUR CHAIR.N)))
			(!R8 (?X_B NEW.A))
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
	(EPI-SCHEMA ((?X_C GET.38.V (K MORE.A)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT ((K MORE.A) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = (K MORE.A))))
			(!R5 (?X_A NEW.A))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
			(!R7 (?X_A (PLUR CHAIR.N)))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
			(!R9 (?X_B (K OLD.A) (PLUR ONE.N)))
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
	(EPI-SCHEMA ((?X_R (COMPOSITE-SCHEMA-173.PR ?X_Q ?X_P (K NICE.A) ?X_K (K MORE.A)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K STORE.N))
			(!R2 (?X_Q (K OLD.A) (PLUR ONE.N)))
			(!R3 (?X_P NEW.A))
			(!R4 (?X_P (PLUR CHAIR.N)))
			(!R5 (?X_P (PERTAIN-TO ?X_R)))
			(!R6 (?X_Q (PERTAIN-TO ?X_R)))
		)
		(:STEPS
			(?X_O (?X_R (NEED.V ?X_P)))
			(?X_M (?X_R ((AWAY.PRT THROW.V) ?X_Q)))
			(?X_A (?X_R ((AWAY.PRT THROW.V) ?X_Q)))
			(?X_J (?X_R ((ADV-A (FROM.P ?L1)) GO.26.V) ?X_K))
			(?X_J (?X_R ((ADV-A (FROM.P ?L1)) GO.27.V) ?X_K))
			(?X_H (?X_R GET.37.V (K MORE.A)))
			(?X_H (?X_R GET.38.V (K MORE.A)))
			(?X_B (?X_R ((UP.PRT SET.V) ?X_P)))
			(?X_F (?X_R ((UP.PRT SET.V) ?X_P)))
			(?X_D (?X_P (LOOK.V (K NICE.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_A)))
			(!W2 (?X_O (BEFORE ?X_J)))
			(!W3 (?X_O (BEFORE ?X_H)))
			(!W4 (?X_O (BEFORE ?X_B)))
			(!W5 (?X_O (BEFORE ?X_F)))
			(!W6 (?X_O (BEFORE ?X_D)))
			(!W7 (?X_M (BEFORE ?X_A)))
			(!W8 (?X_M (BEFORE ?X_J)))
			(!W9 (?X_M (BEFORE ?X_H)))
			(!W10 (?X_M (BEFORE ?X_B)))
			(!W11 (?X_M (BEFORE ?X_F)))
			(!W12 (?X_M (BEFORE ?X_D)))
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
			"X_R needs a new chairs of X_R."
			"X_R throws a of X_R away."
			"X_R throws a of X_R away."
			"X_R go.192s a store from L1."
			"X_R go.196s a store from L1."
			"X_R get.200s more."
			"X_R get.201s more."
			"X_R sets a new chairs of X_R up."
			"X_R sets a new chairs of X_R up."
			"A new chairs of X_R looks nice."
	)
)



(
	(EPI-SCHEMA ((?X_C
	              (COMPOSITE-SCHEMA-174.PR
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
	(EPI-SCHEMA ((?X_C (((ADV-A (IN.P ?X_E)) PUT.6.V) ?X_D)) ** ?X_G)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_E CONTAINER.N))
			(!R4 (NOT (?X_E AGENT.N)))
			(!R5 (?X_D SMALLER-THAN ?X_E))
			(!R6 (?X_D FAN.N))
			(!R7 (?X_D (VERY.ADV MUCH.A)))
			(!R8 (?X_D (PERTAIN-TO ?X_C)))
			(!R9 (?X_E (AT.P (K SCHOOL.N))))
			(!R10 (?X_E (PERTAIN-TO ?X_C)))
			(!R11 (?X_E DESK.N))
			(!R12 (?X_A HAND.N))
			(!R13 (?X_A (PERTAIN-TO ?X_C)))
			(!R14 (?X_D (IS.V ?X_B)))
			(!R15 (?X_B FAN.N))
			(!R16 (?X_B PRETTY.A))
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
			(?X_G (?X_C ((ADV-A (INTO.P ?X_E)) PUT.6.V) ?X_D))
			(?X_G (?X_C ((ADV-A (INSIDE.P ?X_E)) PUT.6.V) ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (RIGHT-AFTER ?X_F)))
			(!W2 (?X_G (SAME-TIME ?X_I)))
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
			(!R6 (?X_D (VERY.ADV MUCH.A)))
			(!R7 (?X_D (PERTAIN-TO ?X_C)))
			(!R8 (?X_D FAN.N))
			(!R9 (?X_E (PERTAIN-TO ?X_C)))
			(!R10 (?X_E DESK.N))
			(!R11 (?X_E (AT.P (K SCHOOL.N))))
			(!R12 (?X_A HAND.N))
			(!R13 (?X_A (PERTAIN-TO ?X_C)))
			(!R14 (?X_B PRETTY.A))
			(!R15 (?X_B FAN.N))
			(!R16 (?X_D (IS.V ?X_B)))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (IN.P ?X_E)) PUT.8.V) ?X_D)) ** ?X_F)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_E CONTAINER.N))
			(!R4 (NOT (?X_E AGENT.N)))
			(!R5 (?X_D SMALLER-THAN ?X_E))
			(!R6 (?X_D FAN.N))
			(!R7 (?X_D (VERY.ADV MUCH.A)))
			(!R8 (?X_E DESK.N))
			(!R9 (?X_E (AT.P (K SCHOOL.N))))
			(!R10 (?X_E (PERTAIN-TO ?X_C)))
			(!R11 (?X_D (PERTAIN-TO ?X_C)))
			(!R12 (?X_A FAN.N))
			(!R13 (?X_D (IS.V ?X_A)))
			(!R14 (?X_A PRETTY.A))
			(!R15 (?X_B HAND.N))
			(!R16 (?X_B (PERTAIN-TO ?X_C)))
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
			(?X_F (?X_C ((ADV-A (INTO.P ?X_E)) PUT.8.V) ?X_D))
			(?X_F (?X_C ((ADV-A (INSIDE.P ?X_E)) PUT.8.V) ?X_D))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-175.PR ?X_T ?X_R ?X_A ?X_K ?X_L ?X_U)) ** ?E)
		(:ROLES
			(!R1 (?X_L DESK.N))
			(!R2 (?X_L (AT.P (K SCHOOL.N))))
			(!R3 (?X_K HAND.N))
			(!R4 (?X_U FAN.N))
			(!R5 (?X_U (VERY.ADV MUCH.A)))
			(!R6 (?X_U (PERTAIN-TO ?X_M)))
			(!R7 (?X_K (PERTAIN-TO ?X_M)))
			(!R8 (?X_L (PERTAIN-TO ?X_M)))
			(!R9 (?X_R (HAS.V (TWO.D (PLUR BLADE.N)))))
			(!R10 (?X_S FATHER.N))
			(!R11 (?X_S (PERTAIN-TO ?X_T)))
			(!R12 (?X_V PRETTY.A))
			(!R13 (?X_V FAN.N))
			(!R14 (?X_U (IS.V ?X_V)))
		)
		(:STEPS
			(?X_Q (?X_S (BUY.V ?X_R ?X_T)))
			(?X_B (?X_S (((ADV-A (FOR.P ?X_T)) BUY.V) ?X_R)))
			(?X_O (?X_T (CARRY.V ?X_A)))
			(?X_C (?X_M (LIKE.V ?X_U)))
			(?X_J (?X_M (LIKE.V ?X_U)))
			(?X_H (?X_M (CARRY.V ?X_U ?X_K)))
			(?X_D (?X_M (((ADV-A (IN.P ?X_K)) CARRY.V) ?X_U)))
			(?X_F (?X_M (PUT.V ?X_U ?X_L)))
			(E356.SK (?X_M (((ADV-A (IN.P ?X_L)) PUT.6.V) ?X_U)))
			(E356.SK (?X_M (((ADV-A (IN.P ?X_L)) PUT.7.V) ?X_U)))
			(E356.SK (?X_M (((ADV-A (IN.P ?X_L)) PUT.8.V) ?X_U)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_Q (BEFORE ?X_B)))
			(!W2 (?X_Q (BEFORE ?X_O)))
			(!W3 (?X_Q (BEFORE ?X_C)))
			(!W4 (?X_Q (BEFORE ?X_J)))
			(!W5 (?X_Q (BEFORE ?X_H)))
			(!W6 (?X_Q (BEFORE ?X_D)))
			(!W7 (?X_B (BEFORE ?X_O)))
			(!W8 (?X_B (BEFORE ?X_C)))
			(!W9 (?X_B (BEFORE ?X_J)))
			(!W10 (?X_B (BEFORE ?X_H)))
			(!W11 (?X_B (BEFORE ?X_D)))
			(!W12 (?X_O (BEFORE ?X_C)))
			(!W13 (?X_O (BEFORE ?X_J)))
			(!W14 (?X_O (BEFORE ?X_H)))
			(!W15 (?X_O (BEFORE ?X_D)))
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
			"A father of X_T buys a has two blades X_T."
			"A father of X_T buys a has two blades for X_T."
			"X_T carries X_A."
			"X_M likes a fan very much of X_M is a pretty fan."
			"X_M likes a fan very much of X_M is a pretty fan."
			"X_M carries a fan very much of X_M is a pretty fan a hand of X_M."
			"X_M carries a fan very much of X_M is a pretty fan in a hand of X_M."
			"X_M puts a fan very much of X_M is a pretty fan a desk at school of X_M."
			"X_M put.229s a fan very much of X_M is a pretty fan in a desk at school of X_M."
			"X_M put.230s a fan very much of X_M is a pretty fan in a desk at school of X_M."
			"X_M put.233s a fan very much of X_M is a pretty fan in a desk at school of X_M."
	)
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (AT.P ?X_K)) GET.16.V) ?O)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?O)))
			(!R5 (?X_A (PLUR FRIEND.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
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
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
			(!W6 (?X_D (AFTER ?X_C)))
			(!W7 (?X_D (BEFORE ?X_E)))
			(!W8 (?X_F (BEFORE ?X_E)))
			(!W9 (?X_I (SAME-TIME ?X_E)))
			(!W10 (?X_F (AFTER ?X_G)))
			(!W11 (?X_I (AFTER ?X_H)))
			(!W12 (?X_I (RIGHT-AFTER ?X_J)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (AT.P ?X_K)) GET.39.V) ?O)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?O)))
			(!R5 (?X_A (PLUR FRIEND.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
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
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
			(!W6 (?X_D (AFTER ?X_C)))
			(!W7 (?X_D (BEFORE ?X_E)))
			(!W8 (?X_I (SAME-TIME ?X_E)))
			(!W9 (?X_F (BEFORE ?X_E)))
			(!W10 (?X_F (AFTER ?X_G)))
			(!W11 (?X_I (AFTER ?X_H)))
			(!W12 (?X_I (RIGHT-AFTER ?X_J)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (AT.P ?X_K)) GET.40.V) ?O)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?O)))
			(!R5 (?X_A (PLUR FRIEND.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
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
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
			(!W6 (?X_D (AFTER ?X_C)))
			(!W7 (?X_D (SAME-TIME ?X_F)))
			(!W8 (?X_D (RIGHT-AFTER ?X_E)))
			(!W9 (?X_G (BEFORE ?X_F)))
			(!W10 (?X_I (BEFORE ?X_F)))
			(!W11 (?X_G (AFTER ?X_H)))
			(!W12 (?X_I (AFTER ?X_J)))
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
	              (COMPOSITE-SCHEMA-176.PR (KA ((ADV-A (TO.P ?X_Q)) GO.V)) ?X_R
	               (K FUN.N) ?O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I AGENT.N))
			(!R2 (?X_R (PLUR FRIEND.N)))
			(!R3 (?X_Q FAIR.N))
			(!R4 (?X_R (PERTAIN-TO ?X_S)))
		)
		(:STEPS
			(?X_P (?X_S (WANT.V (KA ((ADV-A (TO.P ?X_Q)) GO.V)))))
			(?X_A (?X_S (((ADV-A (AT.P ?X_K)) GET.16.V) ?O)))
			(?X_B (?X_S (((ADV-A (AT.P ?X_K)) GET.39.V) ?O)))
			(?X_C (?X_S (((ADV-A (AT.P ?X_K)) GET.40.V) ?O)))
			(?X_N (?X_S (MEET.V ?X_R)))
			(?X_L (?X_S (MEET.V ?X_R)))
			(?X_D (?X_S (MEET.V ?X_R)))
			(?X_H (?X_I (HAVE.V (K FUN.N))))
			(?X_F (?X_I ((ADV-A (FOR.P (THREE.D (PLUR HOUR.N)))) STAY.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_P (BEFORE ?X_D)))
			(!W2 (?X_P (BEFORE ?X_H)))
			(!W3 (?X_P (BEFORE ?X_F)))
			(!W4 (?X_A (BEFORE ?X_N)))
			(!W5 (?X_A (BEFORE ?X_L)))
			(!W6 (?X_A (BEFORE ?X_D)))
			(!W7 (?X_A (BEFORE ?X_H)))
			(!W8 (?X_A (BEFORE ?X_F)))
			(!W9 (?X_B (BEFORE ?X_N)))
			(!W10 (?X_B (BEFORE ?X_L)))
			(!W11 (?X_B (BEFORE ?X_D)))
			(!W12 (?X_B (BEFORE ?X_H)))
			(!W13 (?X_B (BEFORE ?X_F)))
			(!W14 (?X_C (BEFORE ?X_N)))
			(!W15 (?X_C (BEFORE ?X_L)))
			(!W16 (?X_C (BEFORE ?X_D)))
			(!W17 (?X_C (BEFORE ?X_H)))
			(!W18 (?X_C (BEFORE ?X_F)))
			(!W19 (?X_N (BEFORE ?X_D)))
			(!W20 (?X_N (BEFORE ?X_H)))
			(!W21 (?X_N (BEFORE ?X_F)))
			(!W22 (?X_L (BEFORE ?X_D)))
			(!W23 (?X_L (BEFORE ?X_H)))
			(!W24 (?X_L (BEFORE ?X_F)))
			(!W25 (?X_D (BEFORE ?X_H)))
			(!W26 (?X_D (BEFORE ?X_F)))
			(!W27 (?X_H (BEFORE ?X_F)))
		)
	)
	(
			"X_S wants to a fair going."
			"X_S get.253s O at X_K."
			"X_S get.254s O at X_K."
			"X_S get.255s O at X_K."
			"X_S meets a friends of X_S."
			"X_S meets a friends of X_S."
			"X_S meets a friends of X_S."
			"A agent has fun."
			"A agent stays for three hours."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_A GET.41.V (KE (?X_B READY.A))) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT ((KE (?X_B READY.A)) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (KE (?X_B READY.A)))))
			(!R5 (?X_B (PERTAIN-TO ?X_A)))
			(!R6 (?X_B READY.A))
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
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
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
	(EPI-SCHEMA ((?X_A GET.42.V (KE (?X_B READY.A))) ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT ((KE (?X_B READY.A)) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (KE (?X_B READY.A)))))
			(!R5 (?X_B (K FISHING.N) POLE.N))
			(!R6 (?X_B READY.A))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
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
			(!W1 (?E1 SAME-TIME ?X_D))
			(!W2 (?I1 PRECOND-OF ?X_D))
			(!W3 (?I2 PRECOND-OF ?X_D))
			(!W4 (?I3 PRECOND-OF ?X_D))
			(!W5 (?P1 POSTCOND-OF ?X_D))
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-177.PR ?X_D (KE (?X_E READY.A)))) ** ?E)
		(:ROLES
			(!R1 (?X_D BIG.A))
			(!R2 (?X_D FISH.N))
			(!R3 (?X_E (K FISHING.N) POLE.N))
			(!R4 (?X_E READY.A))
			(!R5 (?X_E (PERTAIN-TO ?X_F)))
		)
		(:STEPS
			(?X_A (?X_F GET.41.V (KE (?X_E READY.A))))
			(?X_A (?X_F GET.42.V (KE (?X_E READY.A))))
			(?X_C (?X_F (CATCH.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_C)))
		)
	)
	(
			"X_F get.270s a ready of X_F ready."
			"X_F get.272s a ready of X_F ready."
			"X_F catches a big fish."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.28.V) (KA EAT.V)) ** ?X_B)
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
	      (OUT.PRT ((ADV-A (FOR.P (KA EAT.V))) GO.28.V))))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? (KA EAT.V))) GO.28.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? (KA EAT.V))) GO.28.V) (KA EAT.V)))
			(?X_B (?X_A (LOCATION_ADV.? GO.28.V)))
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
	(EPI-SCHEMA ((?X_B EAT.10.V ?X_A) ** ?X_C)
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-178.PR (K SICK.A) (KA EAT.V) ?X_G)) ** ?E)
		(:ROLES
			(!R1 (?X_G LOT.N))
			(!R2 (?X_J AGENT.N))
		)
		(:STEPS
			(?X_I (?X_J ((ADV-A (FROM.P ?L1)) GO.28.V) (KA EAT.V)))
			(?X_F (?X_J EAT.10.V ?X_G))
			(?X_B (?X_A POINT.N))
			(?X_D (?X_J ((THEN.ADV FALL.V) (K SICK.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_F)))
			(!W2 (?X_I (BEFORE ?X_B)))
			(!W3 (?X_I (BEFORE ?X_D)))
			(!W4 (?X_F (BEFORE ?X_B)))
			(!W5 (?X_F (BEFORE ?X_D)))
			(!W6 (?X_B (BEFORE ?X_D)))
		)
	)
	(
			"A agent go.282s eating from L1."
			"A agent eat.283s a lot."
			"X_A is point."
			"A agent falls sick then."
	)
)



(
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.28.V
	              (KA (RIDE.V (IN.P (AND (?X_C LITTLE.A) (?X_C WAGON.N))))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((KA (RIDE.V (IN.P (AND (?X_C LITTLE.A) (?X_C WAGON.N))))) ACTION.N))
			(!R3 (?X_A LITTLE.A))
			(!R4 (?X_C (HAS.V ?X_A)))
			(!R5 (?X_A WAGON.N))
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
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.29.V (KA ((ADV-A (IN.P ?X_C)) RIDE.V))) **
	             ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((KA ((ADV-A (IN.P ?X_C)) RIDE.V)) ACTION.N))
			(!R3 (?X_C WAGON.N))
			(!R4 (?X_C LITTLE.A))
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
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-179.PR
	               (KA (RIDE.V (IN.P (AND (?X_H LITTLE.A) (?X_H WAGON.N)))))
	               (KA ((ADV-A (IN.P ?X_I)) RIDE.V)) ?X_A))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E RIDE.N))
			(!R2 (?X_I LITTLE.A))
			(!R3 (?X_I WAGON.N))
			(!R4 (?X_H (HAS.V ?X_I)))
		)
		(:STEPS
			(?X_G (?X_A ENJOY_ACTION.29.V (KA ((ADV-A (IN.P ?X_I)) RIDE.V))))
			(?X_D
	   (?X_A ENJOY_ACTION.28.V
	    (KA (RIDE.V (IN.P (AND (?X_H LITTLE.A) (?X_H WAGON.N)))))))
			(?X_B (?X_H (((ADV-A (FOR.P ?X_E)) TAKE.20.V) ?X_A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_D)))
			(!W2 (?X_G (BEFORE ?X_B)))
		)
	)
	(
			"X_A enjoy action.287s in a little wagon riding."
			"X_A enjoy action.285s riding in and a has a little wagon little a has a little wagon wagon."
			"A has a little wagon take.291s X_A for a ride."
	)
)



(
	(EPI-SCHEMA ((?X_R (COMPOSITE-SCHEMA-180.PR ?X_R ?X_Q ?X_S)) ** ?E)
		(:ROLES
			(!R1 (?X_Q (K HIND.A) (PLUR FOOT.N)))
			(!R2 (?X_R (IS.V ?X_P)))
			(!R3 (?X_Q (PERTAIN-TO ?X_R)))
			(!R4 (?X_S BUN.N))
		)
		(:STEPS
			(?X_K (?X_R ((MAY.AUX HAVE.V) ?X_R)))
			(?X_M (?X_R (ON.P ?X_Q)))
			(?X_D (?X_R ((ADV-A (ON.P ?X_Q)) STAND.V)))
			(?X_O (?X_R ((ADV-A (AT.P ?X_A)) LOOK.V)))
			(?X_E (?X_B ((ADV-A (AT.P ?X_R)) LOOK.V)))
			(?X_F (?X_B SIT.V))
			(?X_G (?X_B ((ADV-A (AT.P ?X_R)) LOOK.V)))
			(?X_H (?X_B SIT.V))
			(?X_I (?X_C (((ADV-A (TO.P ?X_R)) GIVE.V) ?X_S)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_M)))
			(!W2 (?X_K (BEFORE ?X_D)))
			(!W3 (?X_K (BEFORE ?X_O)))
			(!W4 (?X_K (BEFORE ?X_E)))
			(!W5 (?X_K (BEFORE ?X_F)))
			(!W6 (?X_K (BEFORE ?X_G)))
			(!W7 (?X_K (BEFORE ?X_H)))
			(!W8 (?X_K (BEFORE ?X_I)))
			(!W9 (?X_M (BEFORE ?X_D)))
			(!W10 (?X_M (BEFORE ?X_O)))
			(!W11 (?X_M (BEFORE ?X_E)))
			(!W12 (?X_M (BEFORE ?X_F)))
			(!W13 (?X_M (BEFORE ?X_G)))
			(!W14 (?X_M (BEFORE ?X_H)))
			(!W15 (?X_M (BEFORE ?X_I)))
			(!W16 (?X_D (BEFORE ?X_O)))
			(!W17 (?X_D (BEFORE ?X_E)))
			(!W18 (?X_D (BEFORE ?X_F)))
			(!W19 (?X_D (BEFORE ?X_G)))
			(!W20 (?X_D (BEFORE ?X_H)))
			(!W21 (?X_D (BEFORE ?X_I)))
			(!W22 (?X_O (BEFORE ?X_E)))
			(!W23 (?X_O (BEFORE ?X_F)))
			(!W24 (?X_O (BEFORE ?X_G)))
			(!W25 (?X_O (BEFORE ?X_H)))
			(!W26 (?X_O (BEFORE ?X_I)))
			(!W27 (?X_E (BEFORE ?X_F)))
			(!W28 (?X_E (BEFORE ?X_G)))
			(!W29 (?X_E (BEFORE ?X_H)))
			(!W30 (?X_E (BEFORE ?X_I)))
			(!W31 (?X_F (BEFORE ?X_G)))
			(!W32 (?X_F (BEFORE ?X_H)))
			(!W33 (?X_F (BEFORE ?X_I)))
			(!W34 (?X_G (BEFORE ?X_H)))
			(!W35 (?X_G (BEFORE ?X_I)))
			(!W36 (?X_H (BEFORE ?X_I)))
		)
	)
	(
			"A is X_P has a is X_P may."
			"A is X_P is on."
			"A is X_P stands on a of a is X_P."
			"A is X_P looks at X_A."
			"X_B looks at a is X_P."
			"X_B sits."
			"X_B looks at a is X_P."
			"X_B sits."
			"X_C gives a bun to a is X_P."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.29.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B FARMER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PLUR BOOT.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.29.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.29.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.29.V) ?L2))
			(?X_C (?X_B GO.29.V))
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
	(EPI-SCHEMA ((?X_C ((UP.PRT ((ADV-A (IN.P ?X_A)) GET.43.V)) ?O)) ** ?X_D)
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
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-181.PR ?X_N ?X_F (K (BACK.ADV (TO.P (K BED.N))))
	               ?L2 ?O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F COW.N))
			(!R2 (?X_N (PLUR BOOT.N)))
			(!R3 (?X_M MORNING.N))
			(!R4 (?X_O FARMER.N))
			(!R5 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_J (?X_O (PUT.V ?X_N)))
			(?X_L (?X_O ((UP.PRT ((ADV-A (IN.P ?X_M)) GET.43.V)) ?O)))
			(?X_A (?X_O (KA PUT.V) ?X_N ON.P))
			(?X_H (?X_O ((ADV-A (FROM.P ?L1)) GO.29.V) ?L2))
			(?X_E (?X_O (MILK.V ?X_F)))
			(?X_C (?X_O (GO.V (K (BACK.ADV (TO.P (K BED.N)))))))
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
			"A farmer get.307s O up in a morning."
			"A farmer is on."
			"A farmer go.310s L2 from L1."
			"A farmer milks a cow."
			"A farmer goes back to bed."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-182.PR ?X_D)) ** ?E)
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
	(EPI-SCHEMA ((?X_D
	              (COMPOSITE-SCHEMA-183.PR ?X_B (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.31.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D BEST.A))
			(!R6 (?X_D BUY.N))
			(!R7 (?X_A (PERTAIN-TO ?X_C)))
			(!R8 (?X_A ?X_B TV.N))
			(!R9 (?X_B TV.N))
			(!R10 (?X_B GOOD.A))
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
	   (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) ((ADV-A (TO.P ?X_D)) GO.31.V))))
			(?X_E
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.31.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.31.V) ?X_D))
			(?X_E (?X_C (LOCATION_ADV.? GO.31.V)))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-184.PR ?X_L ?X_N ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_F TV.N))
			(!R2 (?X_I BEST.A))
			(!R3 (?X_I BUY.N))
			(!R4 (?X_L NEW.A))
			(!R5 (?X_L TV.N))
			(!R6 (?X_N (PERTAIN-TO ?X_M)))
			(!R7 (?X_O GOOD.A))
			(!R8 (?X_O TV.N))
			(!R9 (?X_N ?X_O TV.N))
		)
		(:STEPS
			(?X_K (?X_M (WANT.V ?X_L)))
			(?X_E (?X_M ((ADV-A (AT.P ?X_F)) LOOK.V)))
			(?X_C (?X_M (LOVE.V ?X_N)))
			(?X_H (?X_M ((ADV-A (FROM.P ?L1)) GO.31.V) ?X_I))
			(?X_A (?X_M (LOVE.V ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_E)))
			(!W2 (?X_K (BEFORE ?X_H)))
			(!W3 (?X_K (BEFORE ?X_A)))
			(!W4 (?X_E (BEFORE ?X_A)))
			(!W5 (?X_C (BEFORE ?X_A)))
			(!W6 (?X_H (BEFORE ?X_A)))
		)
	)
	(
			"X_M wants a new tv."
			"X_M looks at a tv."
			"X_M loves a of X_M."
			"X_M go.28s a best buy from L1."
			"X_M loves a of X_M."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-185.PR ?X_E)) ** ?E)
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.32.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B YARD.N))
			(!R6 (?X_A DOG.N))
			(!R7 (?X_A HOUSE.N))
			(!R8 (?X_A (PERTAIN-TO ?X_C)))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) GO.32.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.32.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) GO.32.V) ?L2))
			(?X_D (?X_C ((ADV-A (IN.P ?X_B)) GO.32.V)))
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
	(EPI-SCHEMA ((?X_R (COMPOSITE-SCHEMA-186.PR ?X_M ?X_Q ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_Q HOUSE.N))
			(!R2 (?X_Q DOG.N))
			(!R3 (?X_M THING.N))
			(!R4 (?X_M NEW.A))
			(!R5 (?X_P YARD.N))
			(!R6 (?X_R DOG.N))
			(!R7 (?X_Q (PERTAIN-TO ?X_R)))
		)
		(:STEPS
			(?X_D (?X_Q (LIKE.V ?X_Q)))
			(?X_O (?X_R ((ADV-A (FROM.P ?L1)) GO.32.V) ?L2))
			(?X_L (?X_A (((ADV-A (IN.P ?X_P)) BE.V) ?X_M)))
			(?X_J (?X_R (SNIFF.V ?X_M)))
			(?X_H (?X_R ((ADV-A (INSIDE.P ?X_M)) GO.V)))
			(?X_F (?X_R SLEEP.V))
			(?X_B (?X_Q (LIKE.V ?X_Q)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
			(!W2 (?X_O (BEFORE ?X_L)))
			(!W3 (?X_O (BEFORE ?X_J)))
			(!W4 (?X_O (BEFORE ?X_H)))
			(!W5 (?X_O (BEFORE ?X_F)))
			(!W6 (?X_O (BEFORE ?X_B)))
			(!W7 (?X_L (BEFORE ?X_J)))
			(!W8 (?X_L (BEFORE ?X_H)))
			(!W9 (?X_L (BEFORE ?X_F)))
			(!W10 (?X_L (BEFORE ?X_B)))
			(!W11 (?X_J (BEFORE ?X_H)))
			(!W12 (?X_J (BEFORE ?X_F)))
			(!W13 (?X_J (BEFORE ?X_B)))
			(!W14 (?X_H (BEFORE ?X_B)))
			(!W15 (?X_F (BEFORE ?X_B)))
		)
	)
	(
			"A house dog of a dog likes a house dog of a dog."
			"A dog go.56s L2 from L1."
			"X_A is a thing new in a yard."
			"A dog sniffs a thing new."
			"A dog goes inside a thing new."
			"A dog sleeps."
			"A house dog of a dog likes a house dog of a dog."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              ((NEVER.ADV GET.44.V)
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
	(EPI-SCHEMA ((?X_A ((INSTEAD.ADV GET.45.V) ?X_B)) ** ?X_C)
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
	(EPI-SCHEMA (((ADV-E (DURING (K YESTERDAY.N))) (?X_A (GET.4.V ?X_B))) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B KINDLE.A))
			(!R6 (?X_B GREAT.A))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-187.PR ?X_E ?X_H)) ** ?E)
		(:ROLES
			(!R1 (?X_E LOT.N))
			(!R2 (?X_H KINDLE.A))
			(!R3 (?X_H GREAT.A))
			(!R4 (?X_H BOOK.N))
			(!R5 (?X_H IMPRESSIVE.A))
			(!R6 (?X_I AGENT.N))
		)
		(:STEPS
			(?X_G ((ADV-E (DURING (K YESTERDAY.N))) (?X_I (GET.4.V ?X_H))))
			(?X_D (?X_I (LIKE.V ?X_H ?X_E)))
			(?X_B (?X_I (((ADV-A (IN.P (TWO.D (PLUR DAY.N)))) READ.V) ?X_H)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_D)))
			(!W2 (?X_G (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A agent get.117s a kindle great book impressive DURING yesterday."
			"A agent likes a kindle great book impressive a lot."
			"A agent reads a kindle great book impressive in two days."
	)
)



(
	(EPI-SCHEMA ((?X_B GET.46.V ?X_C) ** ?X_D)
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
	              (COMPOSITE-SCHEMA-188.PR ?X_M (K SAD.A)
	               (K (L X (AND (X AT.P) (X FIRST.A)))) ?X_E))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E INTERVIEW.N))
			(!R2 (?X_H NEW.A))
			(!R3 (?X_H JOB.N))
			(!R4 (?X_M JOB.N))
			(!R5 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_L (?X_N (LOSE.V ?X_M)))
			(?X_B (?X_N (LOSE.V ?X_M)))
			(?X_J (?X_N (BE.V (K SAD.A) (K (L X (AND (X AT.P) (X FIRST.A)))))))
			(?X_G (?X_N ((ADV-A (FOR.P ?X_H)) LOOK.V)))
			(?X_D (?X_N GET.46.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_B)))
			(!W2 (?X_L (BEFORE ?X_J)))
			(!W3 (?X_L (BEFORE ?X_G)))
			(!W4 (?X_L (BEFORE ?X_D)))
			(!W5 (?X_B (BEFORE ?X_J)))
			(!W6 (?X_B (BEFORE ?X_G)))
			(!W7 (?X_B (BEFORE ?X_D)))
			(!W8 (?X_J (BEFORE ?X_G)))
			(!W9 (?X_J (BEFORE ?X_D)))
			(!W10 (?X_G (BEFORE ?X_D)))
		)
	)
	(
			"X_N loses a job of X_N."
			"X_N loses a job of X_N."
			"X_N is sad at first."
			"X_N looks for a new job."
			"X_N get.124s a interview."
	)
)



(
	(EPI-SCHEMA ((?X_F COMPOSITE-SCHEMA-189.PR) ** ?E)
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
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-190.PR) ** ?E)
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
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-191.PR ?X_A)) ** ?E)
		(:ROLES
			(!R1 (?X_A (VERY.ADV FAST.A)))
			(!R2 (?X_A (HAS.V (KE ((K (PLUR BELL.N)) (ON.P ?X_A))))))
			(!R3 (?X_A HOOP.N))
			(!R4 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:STEPS
			(?X_D (?X_B ((CAN.AUX ROLL.V) ?X_A)))
		)
	)
	(
			"X_B rolls a very fast has bells on a very fast has bells on X_A hoop of X_B hoop of X_B can."
	)
)



(
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-192.PR) ** ?E)
		(:ROLES
			(!R1 (?X_A (PERTAIN-TO ?X_B)))
			(!R2 (?X_C FENCE.N))
			(!R3 (?X_F AGENT.N))
		)
		(:STEPS
			(?X_E (?X_B ((ADV-A (BEHIND.P ?X_C)) BE.V)))
			(?X_H (?X_F (QUICKLY.ADV (AWAY.PRT RUN.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_H)))
		)
	)
	(
			"X_B is behind a fence."
			"A agent runs quickly away."
	)
)



(
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-193.PR (FIVE.D (PLUR YEAR.N)) (KA INNOCENT.A)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H MAN.N))
			(!R2 (?X_H INNOCENT.A))
		)
		(:STEPS
			(?X_C (?X_H ((ADV-A (TO.P (K PRISON.N))) GO.V)))
			(?X_E (?X_H ((ADV-A (FOR.P (ANOTHER.D TRIAL.N))) ASK.V)))
			(?X_G
	   (?X_A
	    (((ADV-A (FOR.P (KA (GET.V (K ONE.N))))) TAKE.V) (FIVE.D (PLUR YEAR.N)))))
			(?X_J (?X_H ((PASV FIND.V) (KA INNOCENT.A))))
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
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-194.PR ?X_A)) ** ?E)
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-195.PR (K SCHOOL.N) ?X_J)) ** ?E)
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
			(?X_I (?X_K (((ADV-A (FROM.P (K HOME.N))) TAKE.21.V) ?X_J)))
			(?X_F (?X_K ((ADV-A (IN.P ?X_G)) SIT.V)))
			(?X_C ((ADV-E (DURING ?X_D)) (?X_A (EVER.ADV BE.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_I)))
			(!W2 (?X_M (BEFORE ?X_F)))
			(!W3 (?X_M (BEFORE ?X_C)))
			(!W4 (?X_I (BEFORE ?X_F)))
			(!W5 (?X_I (BEFORE ?X_C)))
			(!W6 (?X_F (BEFORE ?X_C)))
		)
	)
	(
			"A agent has school."
			"A agent take.205s a books from home."
			"A agent sits in a bean bag."
			"X_A is DURING a day most relaxing ever."
	)
)



(
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-196.PR ?X_M ?X_B)) ** ?E)
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
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-197.PR ?X_J
	               (K (L X (AND (X NEXT.A) (X (TO.P ?X_J)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E CLASSROOM.N))
			(!R2 (?X_K (VERY.ADV NERVOUS.A)))
			(!R3 (?X_K NEXT.A))
			(!R4 (?X_K AGENT.N))
			(!R5 (?X_J FRIEND.N))
			(!R6 (?X_J (PERTAIN-TO ?X_K)))
		)
		(:STEPS
			(?X_G (?X_K ((ADV-A (INTO.P ?X_E)) GO.V)))
			(?X_B (?X_K (SEE.V ?X_J)))
			(?X_I (?X_K (SEE.V ?X_J)))
			(?X_C (?X_K (TO.P ?X_J)))
			(?X_D (?X_K (SIT.V (K (L X (AND (X NEXT.A) (X (TO.P ?X_J))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_B)))
			(!W2 (?X_G (BEFORE ?X_I)))
			(!W3 (?X_G (BEFORE ?X_C)))
			(!W4 (?X_G (BEFORE ?X_D)))
			(!W5 (?X_B (BEFORE ?X_I)))
			(!W6 (?X_B (BEFORE ?X_C)))
			(!W7 (?X_B (BEFORE ?X_D)))
			(!W8 (?X_I (BEFORE ?X_C)))
			(!W9 (?X_I (BEFORE ?X_D)))
			(!W10 (?X_C (BEFORE ?X_D)))
		)
	)
	(
			"A very nervous next agent goes into a classroom."
			"A very nervous next agent sees a friend of a very nervous next agent."
			"A very nervous next agent sees a friend of a very nervous next agent."
			"A very nervous next agent is to."
			"A very nervous next agent sits next to."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.33.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C CAFETERIA.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A LUNCH.N))
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
	   (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) GO.33.V))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.33.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.33.V) ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? GO.33.V)))
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
	(EPI-SCHEMA ((?X_A GET.47.V ?X_B) ** ?X_D)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B (PERTAIN-TO ?X_A)))
			(!R6 (?X_B LUNCH.N))
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
	(EPI-SCHEMA ((?X_A GET.39.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B (PERTAIN-TO ?X_A)))
			(!R6 (?X_B LUNCH.N))
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
	(EPI-SCHEMA ((?X_A GET.48.V ?X_B) ** ?X_C)
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
			(!W1 (?E1 SAME-TIME ?X_C))
			(!W2 (?I1 PRECOND-OF ?X_C))
			(!W3 (?I2 PRECOND-OF ?X_C))
			(!W4 (?I3 PRECOND-OF ?X_C))
			(!W5 (?P1 POSTCOND-OF ?X_C))
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
	(EPI-SCHEMA ((?X_B COMPOSITE-SCHEMA-198.PR) ** ?E)
		(:ROLES
			(!R1 (?X_B BLACK.A))
			(!R2 (?X_B DOG.N))
			(!R3 (?X_B (IS.V ?X_A)))
			(!R4 (?X_B (IS.V ?X_C)))
		)
		(:STEPS
			(E3.SK (?X_B RUN.V))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-199.PR (KE (?X_H PLACE.N))
	               (K (TO.P (?X_H PLACE.N))) (KE (?X_I FEEL.V POOR.A))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C HOUSE.N))
			(!R2 (?X_C HUGE.A))
			(!R3 (?X_H FRIEND.N))
			(!R4 (?X_H (PERTAIN-TO ?X_I)))
		)
		(:STEPS
			(?X_A (?X_I (TO.P (KE (?X_H PLACE.N)))))
			(?X_B (?X_I (GO.V (K (TO.P (?X_H PLACE.N))))))
			(?X_E (?X_C (MAKE.V (KE (?X_I FEEL.V POOR.A)))))
			(?X_G (?X_I (EARLY.ADV LEAVE.V)))
			(?X_K (?X_I ((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_H)) TALK.V)))) STOP.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_B)))
			(!W2 (?X_A (BEFORE ?X_E)))
			(!W3 (?X_A (BEFORE ?X_G)))
			(!W4 (?X_A (BEFORE ?X_K)))
			(!W5 (?X_B (BEFORE ?X_E)))
			(!W6 (?X_B (BEFORE ?X_G)))
			(!W7 (?X_B (BEFORE ?X_K)))
			(!W8 (?X_E (BEFORE ?X_G)))
			(!W9 (?X_E (BEFORE ?X_K)))
			(!W10 (?X_G (BEFORE ?X_K)))
		)
	)
	(
			"A black dog is X_A is X_C runs."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.34.V) (KA WORK.V)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA WORK.V) DESTINATION.N))
			(!R4 (NOT (?L1 = (KA WORK.V))))
			(!R5 (?X_B (VERY.ADV TIRED.A)))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A BED.N))
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
	     ((ADV-A (TO.P (KA WORK.V))) GO.34.V))))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? (KA WORK.V))) GO.34.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? (KA WORK.V))) GO.34.V) (KA WORK.V)))
			(?X_C (?X_B (LOCATION_ADV.? GO.34.V)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-200.PR (KA WORK.V))) ** ?E)
		(:ROLES
			(!R1 (?X_H BED.N))
			(!R2 (?X_I (VERY.ADV TIRED.A)))
			(!R3 (?X_H (PERTAIN-TO ?X_I)))
		)
		(:STEPS
			(?X_E (?X_I (DOWN.PRT ((ADV-A (IN.P ?X_H)) LAY.V))))
			(?X_G (?X_I ((ADV-A (FROM.P ?L1)) GO.34.V) (KA WORK.V)))
			(?X_A (?X_I (DOWN.PRT ((ADV-A (IN.P ?X_H)) LAY.V))))
			(?X_C (?X_I ((ADV (ASLEEP.ADV QUICKLY.A)) FALL.V)))
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
			"X_I is to."
			"X_I goes to a friend of X_I place."
			"A house huge makes X_I feels poor."
			"X_I leaves early."
			"X_I stops for to a friend of X_I talking."
	)
)



(
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.30.V ?X_C ?A) ** ?X_D)
		(:ROLES
			(!R1 (?X_B WOMAN.N))
			(!R2 (?X_C MAN.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_A HEAD.N))
			(!R5 (?X_A (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.31.V ?X_C ?A) ** ?X_D)
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.32.V ?X_A ?A) ** ?X_B)
		(:ROLES
			(!R1 (?X_A WOMAN.N))
			(!R2 (?A ACTION.N))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V ?X_A ?A)))
			(?G2 (?X_A (WANT.V (THAT (?X_A (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_A ((AWAY.PRT ASK.V) ?X_A ?A)))
			(?E2 (?X_A (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_B (?X_A ((AWAY.PRT ASK.V) ?X_A ?A)))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-201.PR ?X_K (K DEJECTED.A) ?X_L ?X_H ?A)) **
	             ?E)
		(:ROLES
			(!R1 (?X_H WOMAN.N))
			(!R2 (?X_K HEAD.N))
			(!R3 (?X_L MAN.N))
			(!R4 (?X_K (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(?X_A (?X_L (SHAKE.V ?X_K)))
			(?X_J (?X_L (SHAKE.V ?X_K)))
			(?X_G (?X_H REQUEST_ACTION.31.V ?X_L ?A))
			(?X_E (?X_H REQUEST_ACTION.30.V ?X_L ?A))
			(?X_E (?X_H REQUEST_ACTION.32.V ?X_H ?A))
			(?X_C (?X_L (LOOK.V (K DEJECTED.A))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_J)))
			(!W2 (?X_A (BEFORE ?X_C)))
			(!W3 (?X_J (BEFORE ?X_C)))
			(!W4 (?X_G (BEFORE ?X_E)))
		)
	)
	(
			"A very tired lays down in a bed of a very tired."
			"A very tired go.34s working from L1."
			"A very tired lays down in a bed of a very tired."
			"A very tired falls ADV asleep quickly."
	)
)



(
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-202.PR ?X_E ?X_H)) ** ?E)
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
			"A man shakes a head of a man."
			"A man shakes a head of a man."
			"A woman request action.50s a man A."
			"A woman request action.48s a man A."
			"A woman request action.49s a woman A."
			"A man looks dejected."
	)
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-203.PR ?X_A ?X_J (KA (CUT.V ?X_I)) ?X_I)) **
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
	(EPI-SCHEMA ((?X_A (((ADV-A (TO.P (|12.D| (PLUR MILE.N)))) MAKE.12.V) ?X_B)) **
	             ?X_E)
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
			(?X_C (?X_B ((ADV-A (ABOUT.P (KA DARK.A))) EXIST.V)))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (TO.P (|12.D| (PLUR MILE.N)))) MAKE.13.V) ?X_B)) **
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
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-204.PR
	               (KA
	                (RUN.V
	                 (TWENTY.D
	                  (L X (AND (X (PLUR MILE.N)) (X (AFTER.P (K WORK.N))))))))
	               ?X_B))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K AGENT.N))
		)
		(:STEPS
			(?X_J
	   (?X_K
	    (WANT.V
	     (KA
	      (RUN.V
	       (TWENTY.D (L X (AND (X (PLUR MILE.N)) (X (AFTER.P (K WORK.N)))))))))))
			(?X_H (MUST.AUX-S (?X_K HURRY.V)))
			(?X_F (?X_B ((ADV-A (ABOUT.P (KA DARK.A))) BE.V)))
			(?X_D (?X_K (((ADV-A (TO.P (|12.D| (PLUR MILE.N)))) MAKE.12.V) ?X_B)))
			(?X_D (?X_K (((ADV-A (TO.P (|12.D| (PLUR MILE.N)))) MAKE.13.V) ?X_B)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A agent wants running twenty mile after."
			"A agent hurries must."
			"X_B is about dark."
			"A agent make.87s X_B to 12 miles."
			"A agent make.88s X_B to 12 miles."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.22.V
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
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-205.PR (K FISHING.N) ?X_N
	               (K (L X (AND (X MORE.A) (X (THAN.P ?X_N)))))
	               (ALL.D (L X (AND (X {REF}.N) (X (OF.P (THE.D FISH.N)))))) ?X_F
	               (K
	                (L X
	                 (AND (X (PASV CATCH.V))
	                      (X
	                       (WITH.P
	                        (K (L X (AND (X (TOO.ADV MANY.A)) (X FISH.N)))))))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F FINE.N))
			(!R2 (?X_F BIG.A))
			(!R3 (?X_I MALE.A))
			(!R4 (?X_I AGENT.N))
			(!R5 (?X_N LIMIT.N))
			(!R6 (?X_O MAN.N))
			(!R7 (?X_O MORE.A))
			(!R8 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_M (?X_O (GO.V (K FISHING.N))))
			(?X_B (?X_O (THAN.P ?X_N)))
			(?X_C (?X_O (CATCH.V (K (L X (AND (X MORE.A) (X (THAN.P ?X_N))))))))
			(?X_K
	   (?X_O (KEEP.V (ALL.D (L X (AND (X {REF}.N) (X (OF.P (THE.D FISH.N)))))))))
			(?X_H
	   (?X_I GET.22.V
	    (K
	     (L X
	      (AND (X (PASV CATCH.V))
	           (X (WITH.P (K (L X (AND (X (TOO.ADV MANY.A)) (X FISH.N)))))))))))
			(?X_E (MUST.AUX-S (?X_I (PAY.V ?X_F))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_C)))
			(!W2 (?X_M (BEFORE ?X_K)))
			(!W3 (?X_M (BEFORE ?X_H)))
			(!W4 (?X_M (BEFORE ?X_E)))
			(!W5 (?X_B (BEFORE ?X_K)))
			(!W6 (?X_B (BEFORE ?X_H)))
			(!W7 (?X_B (BEFORE ?X_E)))
			(!W8 (?X_C (BEFORE ?X_K)))
			(!W9 (?X_C (BEFORE ?X_H)))
			(!W10 (?X_C (BEFORE ?X_E)))
			(!W11 (?X_K (BEFORE ?X_H)))
			(!W12 (?X_K (BEFORE ?X_E)))
			(!W13 (?X_H (BEFORE ?X_E)))
		)
	)
	(
			"A man more goes fishing."
			"A man more is than."
			"A man more catches more than."
			"A man more keeps all of."
			"A male agent get.90s PASV catches with."
			"A male agent pays a fine big must."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_B GET.49.V (K UPSET.A)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((K UPSET.A) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K UPSET.A))))
			(!R5 (?X_A NEW.A))
			(!R6 (?X_A PHONE.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-206.PR ?X_L (K UPSET.A))) ** ?E)
		(:ROLES
			(!R1 (?X_H (PLUR WOOD.N)))
			(!R2 (?X_I DAY.N))
			(!R3 (?X_L NEW.A))
			(!R4 (?X_L PHONE.N))
			(!R5 (?X_L (PERTAIN-TO ?X_M)))
		)
		(:STEPS
			(?X_K (?X_M (HAVE.V ?X_L)))
			(?X_G ((ADV-E (DURING ?X_I)) (?X_M ((ADV-A (IN.P ?X_H)) WALK.V))))
			(?X_E (?X_M (LOSE.V ?X_L)))
			(?X_A (?X_M (LOSE.V ?X_L)))
			(?X_C (?X_M GET.49.V (K UPSET.A)))
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
			"X_M has a new phone of X_M."
			"X_M walks DURING a day in a woods."
			"X_M loses a new phone of X_M."
			"X_M loses a new phone of X_M."
			"X_M get.102s upset."
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-207.PR ?X_I ?X_J ?X_M)) ** ?E)
		(:ROLES
			(!R1 (?X_C WIND.N))
			(!R2 (?X_H AGENT.N))
			(!R3 (?X_I FRIEND.N))
			(!R4 (?X_I (PERTAIN-TO ?X_H)))
			(!R5 (?X_J HAT.N))
			(!R6 (?X_I (HAS.V ?X_J)))
			(!R7 (?X_J (PERTAIN-TO ?X_K)))
			(!R8 (?X_L (SET-OF AGENT.N)))
			(!R9 (?X_M HAT.N))
			(!R10 (?X_M (PLUR FRIEND.N)))
			(!R11 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_A (?X_C ((AWAY.ADV BLOW.V) ?X_J)))
			(?X_E (?X_C ((AWAY.ADV BLOW.V) ?X_J)))
			(?X_G (?X_H (CHASE.V ?X_J ?X_I)))
			(?X_B (?X_H (((ADV-A (WITH.P ?X_I)) CHASE.V) ?X_J)))
			(?X_P (?X_L (CATCH.V ?X_M)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_E)))
			(!W2 (?X_A (BEFORE ?X_G)))
			(!W3 (?X_A (BEFORE ?X_B)))
			(!W4 (?X_A (BEFORE ?X_P)))
			(!W5 (?X_E (BEFORE ?X_G)))
			(!W6 (?X_E (BEFORE ?X_B)))
			(!W7 (?X_E (BEFORE ?X_P)))
			(!W8 (?X_G (BEFORE ?X_B)))
			(!W9 (?X_G (BEFORE ?X_P)))
			(!W10 (?X_B (BEFORE ?X_P)))
		)
	)
	(
			"A wind blows a hat of X_K away."
			"A wind blows a hat of X_K away."
			"A agent chases a hat of X_K a friend of a agent has a hat of X_K."
			"A agent chases a hat of X_K with a friend of a agent has a hat of X_K."
			"A agent catches a hat friends of X_N."
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.33.V (KA ((ADV-A (WITH.P ?X_B)) PLAY.V))) **
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
	(EPI-SCHEMA ((?X_B GET.29.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_A MOTHER.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
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
	              (COMPOSITE-SCHEMA-208.PR ?X_R (K (PLUR COCOANUT.N))
	               (KA ((ADV-A (WITH.P ?X_O)) PLAY.V)) ?X_B))
	             ** ?E)
		(:ROLES
			(!R1 (?X_N MOTHER.N))
			(!R2 (?X_N (PERTAIN-TO ?X_O)))
			(!R3 (?X_R (VERY.ADV PRETTY.A)))
			(!R4 (?X_R TREE.N))
		)
		(:STEPS
			(?X_Q
	   ((K (L X (AND (X MANY.A) (X (PLUR COCOANUT.N)))))
	    ((ADV-A (ON.P ?X_R)) GROW.V)))
			(?X_M (?X_O ((CAN.AUX CLIMB.V) ?X_R)))
			(?X_K (?X_O GET.29.V ?X_B))
			(?X_C (?X_N (LIKE.V (K (PLUR COCOANUT.N)))))
			(?X_I (?X_N (LIKE.V (K (PLUR COCOANUT.N)))))
			(?X_G (?X_N ((ADV-A (FOR.P (KA (CLIMB.V ?X_R)))) CANNOT.V)))
			(?X_E (?X_N ENJOY_ACTION.33.V (KA ((ADV-A (WITH.P ?X_O)) PLAY.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_Q (BEFORE ?X_M)))
			(!W2 (?X_Q (BEFORE ?X_K)))
			(!W3 (?X_Q (BEFORE ?X_C)))
			(!W4 (?X_Q (BEFORE ?X_I)))
			(!W5 (?X_Q (BEFORE ?X_G)))
			(!W6 (?X_Q (BEFORE ?X_E)))
			(!W7 (?X_M (BEFORE ?X_K)))
			(!W8 (?X_M (BEFORE ?X_C)))
			(!W9 (?X_M (BEFORE ?X_I)))
			(!W10 (?X_M (BEFORE ?X_G)))
			(!W11 (?X_M (BEFORE ?X_E)))
			(!W12 (?X_K (BEFORE ?X_C)))
			(!W13 (?X_K (BEFORE ?X_I)))
			(!W14 (?X_K (BEFORE ?X_G)))
			(!W15 (?X_K (BEFORE ?X_E)))
			(!W16 (?X_C (BEFORE ?X_G)))
			(!W17 (?X_C (BEFORE ?X_E)))
			(!W18 (?X_I (BEFORE ?X_G)))
			(!W19 (?X_I (BEFORE ?X_E)))
			(!W20 (?X_G (BEFORE ?X_E)))
		)
	)
	(
			"Many cocoanut grows on a very pretty tree."
			"X_O climbs a very pretty tree can."
			"X_O get.143s X_B."
			"A mother of X_O likes cocoanuts."
			"A mother of X_O likes cocoanuts."
			"A mother of X_O cannots for climbing a very pretty tree."
			"A mother of X_O enjoy action.141s with X_O playing."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.35.V) ?X_B) ** ?X_C)
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.35.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.35.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.35.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.35.V)))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-209.PR (KE (?X_J JEALOUS.A)) ?X_D ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_D LITTLE.A))
			(!R2 (?X_D MONEY.N))
			(!R3 (?X_G NIGHT.N))
			(!R4 (?X_G FUN.N))
			(!R5 (?X_J LITTLE.A))
			(!R6 (?X_K AGENT.N))
			(!R7 (?X_N CASINO.N))
		)
		(:STEPS
			(?X_M (?X_A ((ADV-A (FROM.P ?L1)) GO.35.V) ?X_N))
			(?X_I (?X_K (BE.V (KE (?X_J JEALOUS.A)))))
			(?X_F ((ADV-E (DURING ?X_G)) (?X_A HAVE.V)))
			(?X_C (?X_A ((TOO.ADV WIN.V) ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_I)))
			(!W2 (?X_M (BEFORE ?X_F)))
			(!W3 (?X_M (BEFORE ?X_C)))
			(!W4 (?X_I (BEFORE ?X_F)))
			(!W5 (?X_I (BEFORE ?X_C)))
			(!W6 (?X_F (BEFORE ?X_C)))
		)
	)
	(
			"X_A go.148s a casino from L1."
			"A agent is a little jealous."
			"X_A has DURING a night fun."
			"X_A wins a little money too."
	)
)



(
	(EPI-SCHEMA ((?X_D TAKE.22.V ?X_E) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E FAMILY.N))
			(!R6 (?X_E (PERTAIN-TO ?X_D)))
			(!R7 (?X_A FARM.N))
			(!R8 (?X_B (PERTAIN-TO ?X_D)))
			(!R9 (?X_B (PLUR KID.N)))
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
			(!W1 (?E1 SAME-TIME ?X_F))
			(!W2 (?I1 PRECOND-OF ?X_F))
			(!W3 (?I2 PRECOND-OF ?X_F))
			(!W4 (?I3 PRECOND-OF ?X_F))
			(!W5 (?P1 POSTCOND-OF ?X_F))
			(!W6 (?X_F (BEFORE ?X_G)))
			(!W7 (?X_H (SAME-TIME ?X_G)))
			(!W8 (?X_H (RIGHT-AFTER ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D (((ADV-A (TO.P ?X_A)) TAKE.23.V) ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E (PERTAIN-TO ?X_D)))
			(!R6 (?X_E FAMILY.N))
			(!R7 (?X_A FARM.N))
			(!R8 (?X_B (PERTAIN-TO ?X_D)))
			(!R9 (?X_B (PLUR KID.N)))
			(!R10 (?X_C (PERTAIN-TO ?X_D)))
			(!R11 (?X_C DAUGHTER.N))
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
			(!W6 (?X_F (SAME-TIME ?X_I)))
			(!W7 (?X_F (RIGHT-AFTER ?X_G)))
			(!W8 (?X_H (BEFORE ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D (((ADV-A (TO.P ?X_A)) TAKE.24.V) ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_E FAMILY.N))
			(!R6 (?X_E (PERTAIN-TO ?X_D)))
			(!R7 (?X_A FARM.N))
			(!R8 (?X_B DAUGHTER.N))
			(!R9 (?X_B (PERTAIN-TO ?X_D)))
			(!R10 (?X_C (PERTAIN-TO ?X_D)))
			(!R11 (?X_C (PLUR KID.N)))
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
			(!W6 (?X_F (SAME-TIME ?X_I)))
			(!W7 (?X_F (RIGHT-AFTER ?X_G)))
			(!W8 (?X_H (BEFORE ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-210.PR) ** ?E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B PLANE.N))
			(!R3 (?X_E (SET-OF AGENT.N)))
			(!R4 (?X_H FIRE.N))
		)
		(:STEPS
			(?X_D ((ADV-E (DURING (K YESTERDAY.N))) (?X_A ((ADV-A (ON.P ?X_B)) GO.V))))
			(?X_G (MUST.AUX-S (?X_E (BACK.ADV TURN.V))))
			(?X_J (?X_H (ABOUT.PRT COME.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_G)))
			(!W2 (?X_D (BEFORE ?X_J)))
			(!W3 (?X_G (BEFORE ?X_J)))
		)
	)
	(
			"A agent goes DURING yesterday on a plane."
			"A agent turns must back."
			"A fire comes about."
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-211.PR ?X_B)) ** ?E)
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-212.PR ?X_L)) ** ?E)
		(:ROLES
			(!R1 (?X_G SNOW.N))
			(!R2 ((K RED.A) (PERTAIN-TO ?X_L)))
			(!R3 (?X_J (PERTAIN-TO ?X_L)))
			(!R4 (?X_K (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(?X_F (?X_L ((ADV-A (INTO.P ?X_G)) FALL.V)))
			(?X_A (?X_L (((ADV-A (FOR.P (KA (HAVE.V (K RED.A))))) LET.V) ?X_L)))
			(?X_B (?X_L ((ADV-A (INTO.P ?X_G)) FALL.V)))
			(?X_C (?X_L (((ADV-A (FOR.P (KA (HAVE.V (K RED.A))))) LET.V) ?X_L)))
			(?X_D (?X_L ((ADV-A (INTO.P ?X_G)) FALL.V)))
			(?X_I (NOT (?X_L (CAN.AUX ((ADV-A (ON.P (K RED.A))) STAND.V)))))
			(?X_N (?X_L (CAN.AUX ((ADV-A (ON.P (K RED.A))) STAND.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_A)))
			(!W2 (?X_F (BEFORE ?X_B)))
			(!W3 (?X_F (BEFORE ?X_C)))
			(!W4 (?X_F (BEFORE ?X_D)))
			(!W5 (?X_F (BEFORE ?X_I)))
			(!W6 (?X_F (BEFORE ?X_N)))
			(!W7 (?X_A (BEFORE ?X_B)))
			(!W8 (?X_A (BEFORE ?X_C)))
			(!W9 (?X_A (BEFORE ?X_D)))
			(!W10 (?X_A (BEFORE ?X_I)))
			(!W11 (?X_A (BEFORE ?X_N)))
			(!W12 (?X_B (BEFORE ?X_C)))
			(!W13 (?X_B (BEFORE ?X_D)))
			(!W14 (?X_B (BEFORE ?X_I)))
			(!W15 (?X_B (BEFORE ?X_N)))
			(!W16 (?X_C (BEFORE ?X_D)))
			(!W17 (?X_C (BEFORE ?X_I)))
			(!W18 (?X_C (BEFORE ?X_N)))
			(!W19 (?X_D (BEFORE ?X_I)))
			(!W20 (?X_D (BEFORE ?X_N)))
			(!W21 (?X_I (BEFORE ?X_N)))
		)
	)
	(
			"X_L falls into a snow."
			"X_L lets X_L for having red."
			"X_L falls into a snow."
			"X_L lets X_L for having red."
			"X_L falls into a snow."
			"X_L stands not can on red."
			"X_L stands can on red."
	)
)



(
	(EPI-SCHEMA ((?X_E
	              (COMPOSITE-SCHEMA-213.PR ?X_F
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-214.PR (K (L X (AND (X EARLY.A) (X MORNING.N))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C DAY.N))
			(!R2 (?X_L AGENT.N))
			(!R3 (?X_D RUN.N))
			(!R4 (?X_D (AT.P ?X_E)))
			(!R5 (?X_J AGENT.N))
			(!R6 (?X_K (K OTHER.A) FRIEND.N))
			(!R7 (?X_K (PERTAIN-TO ?X_L)))
		)
		(:STEPS
			(?X_G ((ADV-E (DURING ?X_C)) (?X_L ((ADV-A (ON.P ?X_D)) GO.V))))
			(?X_I (?X_A (BE.V (K (L X (AND (X EARLY.A) (X MORNING.N)))))))
			(?X_N (?X_J ((ADV-A (WITH.P ?X_K)) RUN.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_I)))
			(!W2 (?X_G (BEFORE ?X_N)))
			(!W3 (?X_I (BEFORE ?X_N)))
		)
	)
	(
			"A agent goes DURING a day on a run at X_E."
			"X_A is early morning."
			"A agent runs with a of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.34.V (KA (GO.V (K SWIMMING.N)))) ** ?X_B)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.5.V) ?X_B) ** ?X_C)
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.5.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.5.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.5.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.5.V)))
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-215.PR (KA (GO.V (K SWIMMING.N))) ?X_D)) ** ?E)
		(:ROLES
			(!R1 (?X_D LAKE.N))
		)
		(:STEPS
			(?X_F (?X_A ENJOY_ACTION.34.V (KA (GO.V (K SWIMMING.N)))))
			(?X_C (?X_A ((ADV-A (FROM.P ?L1)) GO.5.V) ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_C)))
		)
	)
	(
			"X_A enjoy action.224s going swimming."
			"X_A go.221s a lake from L1."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.36.V)
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
	      ((ADV-A (TO.P (K (L X (AND (X SUMMER.N) (X SCHOOL.N)))))) GO.36.V)))))
			(?X_D
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K (L X (AND (X SUMMER.N) (X SCHOOL.N))))))
	      GO.36.V))))
			(?X_D
	   (?X_B
	    ((ADV-A (DESTINATION_PREP.? (K (L X (AND (X SUMMER.N) (X SCHOOL.N))))))
	     GO.36.V)
	    (K (L X (AND (X SUMMER.N) (X SCHOOL.N))))))
			(?X_D (?X_B (LOCATION_ADV.? GO.36.V)))
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
	              (COMPOSITE-SCHEMA-216.PR ?X_K
	               (K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N))))) ?X_E
	               (K (L X (AND (X SUMMER.N) (X SCHOOL.N))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E LOT.N))
			(!R2 (?X_E (AT.P (K (L X (AND (X SUMMER.N) (X SCHOOL.N)))))))
			(!R3 (?X_K TEACHER.N))
			(!R4 (?X_O AGENT.N))
			(!R5 (?X_N HOMEWORK.N))
			(!R6 (?X_N (PERTAIN-TO ?X_O)))
		)
		(:STEPS
			(?X_M
	   (?X_O ((ADV-A (FROM.P ?L1)) GO.36.V)
	    (K (L X (AND (X SUMMER.N) (X SCHOOL.N))))))
			(?X_J (?X_O (LIKE.V ?X_K)))
			(?X_H (?X_A (BECOME.V (K (L X (AND (X GOOD.A) (X (PLUR FRIEND.N))))))))
			(?X_D (?X_B (LEARN.V ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_J)))
			(!W2 (?X_M (BEFORE ?X_H)))
			(!W3 (?X_M (BEFORE ?X_D)))
			(!W4 (?X_J (BEFORE ?X_H)))
			(!W5 (?X_J (BEFORE ?X_D)))
			(!W6 (?X_H (BEFORE ?X_D)))
		)
	)
	(
			"A agent go.225s summer school from L1."
			"A agent likes a teacher."
			"X_A becomes good friend."
			"X_B learns a lot at summer school."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.37.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_A (EAGER.A (KA (TRY.V ?X_B)))))
			(!R6 (?X_B (IN.P (K TOWN.N))))
			(!R7 (?X_B RESTAURANT.N))
			(!R8 (?X_B NEW.A))
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.37.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.37.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.37.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.37.V)))
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-217.PR (K GOOD.A) ?X_F)) ** ?E)
		(:ROLES
			(!R1 (?X_C (EAGER.A (KA (TRY.V ?X_F)))))
			(!R2 (?X_C AGENT.N))
			(!R3 (?X_F (IN.P (K TOWN.N))))
			(!R4 (?X_F NEW.A))
			(!R5 (?X_F RESTAURANT.N))
		)
		(:STEPS
			(?X_E (?X_F (LOOK.V (K GOOD.A))))
			(?X_B (?X_C ((ADV-A (FROM.P ?L1)) GO.37.V) ?X_F))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A in town new restaurant looks good."
			"A eager trying a in town new restaurant agent go.237s a in town new restaurant from L1."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-218.PR (KA (WATCH.V (K TV.N)))
	               (KA (DOWN.PRT LAY.V)) (K (RIGHT.ADV ASLEEP.A))))
	             ** ?E)
		(:STEPS
			(?X_C (?X_A (TRY.V (KA (WATCH.V (K TV.N))))))
			(?X_E (?X_A ((THEN.ADV DECIDE.V) (KA (DOWN.PRT LAY.V)))))
			(?X_G (?X_A (FALL.V (K (RIGHT.ADV ASLEEP.A)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_G)))
			(!W3 (?X_E (BEFORE ?X_G)))
		)
	)
	(
			"X_A tries watching tv."
			"X_A decides down laying then."
			"X_A falls right asleep."
	)
)



(
	(EPI-SCHEMA ((?X_A GET.50.V (K MAD.A)) ** ?X_B)
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-219.PR ?X_L (KA (GET.V ?X_L)) (K MAD.A))) **
	             ?E)
		(:ROLES
			(!R1 (?X_L CAT.N))
		)
		(:STEPS
			(?X_K (?X_A (HAVE.V ?X_L)))
			(?X_I (?X_A (LOVE.V ?X_L)))
			(?X_G (?X_A GET.50.V (K MAD.A)))
			(?X_E (?X_A ((ADV-A (FOR.P ?X_L)) LOOK.V)))
			(?X_C (?X_A (TRY.V (KA (GET.V ?X_L)))))
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
		)
	)
	(
			"X_A has a cat."
			"X_A loves a cat."
			"X_A get.263s mad."
			"X_A looks for a cat."
			"X_A tries getting a cat."
	)
)



(
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-220.PR ?X_J (KE (?X_M (PET.N ?X_A))) ?X_I ?X_L))
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
			"A brother of X_K has a goldfish."
			"A goldfish lets a brother of X_K pet X_A."
			"A brother of X_K puts a finger of a brother of X_K a water."
			"A brother of X_K puts a finger of a brother of X_K in a water."
			"A goldfish swims up to a brother of X_K."
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (IN.P ?X_A)) PLAY.20.V)) ** ?X_C)
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
			(?X_C (?X_B ((ADV-A (WITH.P ?T)) PLAY.20.V)))
			(?X_C (?X_B PLAY.20.V ?G))
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
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-221.PR
	               (ALL.D (L X (AND (X {REF}.N) (X (AROUND.P (THE.D GRASS.N))))))
	               (K (VERY.ADV HIGH.A))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H MALE.A))
			(!R2 (?X_H AGENT.N))
			(!R3 (?X_K SAND.N))
			(!R4 (?X_L AGENT.N))
		)
		(:STEPS
			(?X_J
	   (?X_L
	    (RUN.V (ALL.D (L X (AND (X {REF}.N) (X (AROUND.P (THE.D GRASS.N)))))))))
			(?X_G (?X_H CLIMB.V))
			(?X_E (?X_H CLIMB.V))
			(?X_C (?X_H (SWING.V (K (VERY.ADV HIGH.A)))))
			(E5.SK (?X_L ((ADV-A (IN.P ?X_K)) PLAY.20.V)))
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
			"A agent runs all around."
			"A male agent climbs."
			"A male agent climbs."
			"A male agent swings very high."
			"A agent play.2s in a sand."
	)
)



(
	(EPI-SCHEMA ((?X_B PLAY.21.V) ** ?X_E)
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
			(?X_E (?X_B ((ADV-A (WITH.P ?X_A)) PLAY.21.V)))
			(?X_E (?X_B PLAY.21.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_C (AT-ABOUT ?X_D)))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
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
	(EPI-SCHEMA ((?X_B PLAY.22.V) ** ?X_C)
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
			(?X_C (?X_B ((ADV-A (WITH.P ?X_A)) PLAY.22.V)))
			(?X_C (?X_B PLAY.22.V ?G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?E1 SAME-TIME ?E2))
			(!W2 (?X_C (AT-ABOUT ?X_D)))
			(!W3 (?X_E (AT-ABOUT ?X_F)))
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
	(EPI-SCHEMA ((?X_A GET.51.V
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
	(EPI-SCHEMA ((?X_A PLAY.23.V (K POKER.N)) ** ?X_B)
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-222.PR ?X_K (ALL.D IN.P) ?X_D
	               (K
	                (L X
	                 (AND (X (PASV CALL.V)) (X (WITH.P (TWO.D (PLUR PAIR.N)))))))
	               (K POKER.N)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D HAND.N))
			(!R2 (?X_K FLUSH.A))
			(!R3 (?X_N MAN.N))
		)
		(:STEPS
			(?X_M (?X_N PLAY.21.V))
			(?X_M (?X_N PLAY.22.V))
			(?X_M (?X_N PLAY.23.V (K POKER.N)))
			(?X_J (?X_N (HAVE.V ?X_K)))
			(?X_H (?X_N (GO.V (ALL.D IN.P))))
			(?X_F
	   (?X_N GET.51.V
	    (K (L X (AND (X (PASV CALL.V)) (X (WITH.P (TWO.D (PLUR PAIR.N)))))))))
			(?X_C (?X_N (WIN.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_J)))
			(!W2 (?X_M (BEFORE ?X_F)))
			(!W3 (?X_J (BEFORE ?X_F)))
			(!W4 (?X_H (BEFORE ?X_C)))
		)
	)
	(
			"A man play.5s."
			"A man play.6s."
			"A man play.11s poker."
			"A man has a flush."
			"A man goes all in."
			"A man get.9s PASV calls with."
			"A man wins a hand."
	)
)



(
	(EPI-SCHEMA ((?X_C (CAN.AUX PLAY.24.V)) ** ?X_D)
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
			(?X_D (?X_C ((ADV-A (WITH.P ?X_B)) PLAY.24.V)))
			(?X_D (?X_C PLAY.24.V ?G))
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
	(EPI-SCHEMA ((?X_C (CAN.AUX PLAY.25.V)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C BOY.N))
			(!R2 (?X_B TOY.N))
			(!R3 (NOT (?X_B AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_C PLAY.N))
			(!R7 (?X_B BALL.N))
			(!R8 (?X_A AGENT.N))
			(!R9 (?X_B (PERTAIN-TO ?X_A)))
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
			(?X_D (?X_C ((ADV-A (WITH.P ?X_B)) PLAY.25.V)))
			(?X_D (?X_C PLAY.25.V ?G))
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
	(EPI-SCHEMA ((?X_C (CAN.AUX PLAY.7.V)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C BOY.N))
			(!R2 (?X_B TOY.N))
			(!R3 (NOT (?X_B AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_C PLAY.N))
			(!R7 (?X_B BALL.N))
			(!R8 (?X_A (HAS.V ?X_B)))
			(!R9 (?X_A LITTLE.A))
			(!R10 (?X_A GIRL.N))
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
			(?X_D (?X_C ((ADV-A (WITH.P ?X_B)) PLAY.7.V)))
			(?X_D (?X_C PLAY.7.V ?G))
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
	(EPI-SCHEMA ((?X_A ((MAY.AUX TAKE.25.V) ?X_B)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-223.PR ?X_O ?X_P ?X_E ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_E BALL.N))
			(!R2 (?X_P BABY.N))
			(!R3 (?X_F AGENT.N))
			(!R4 (?X_E (PERTAIN-TO ?X_F)))
			(!R5 (?X_I BALL.N))
			(!R6 (?X_L MAN.N))
			(!R7 (?X_O PLAY.N))
			(!R8 (?X_O BOY.N))
			(!R9 (?X_Q BIG.A))
			(!R10 (?X_Q DOLL.N))
			(!R11 (?X_P (HAS.V ?X_Q)))
			(!R12 (?X_R LITTLE.A))
			(!R13 (?X_R GIRL.N))
			(!R14 (?X_S BALL.N))
			(!R15 (?X_R (HAS.V ?X_S)))
		)
		(:STEPS
			(?X_N (?X_O (CAN.AUX PLAY.24.V)))
			(?X_N (?X_O (CAN.AUX PLAY.25.V)))
			(?X_N (?X_O (CAN.AUX PLAY.7.V)))
			(?X_K (?X_L ((MAY.AUX SEE.V) ?X_O)))
			(?X_H (?X_O ((MAY.AUX TAKE.25.V) ?X_I)))
			(?X_D (?X_F ((CAN.AUX SEE.V) ?X_P)))
			(?X_B (?X_P ((MAY.AUX HAVE.V) ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_H)))
			(!W2 (?X_K (BEFORE ?X_D)))
			(!W3 (?X_K (BEFORE ?X_B)))
			(!W4 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A play boy play.14s can."
			"A play boy play.13s can."
			"A play boy play.18s can."
			"A man sees a play boy may."
			"A play boy take.33s a ball may."
			"A agent sees a baby has a big doll can."
			"A baby has a big doll has a ball of a agent may."
	)
)



(
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.35.V (KA (HUNT.N (K (PLUR BUG.N))))) ** ?X_C)
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
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-224.PR ?X_F (KA (HUNT.N (K (PLUR BUG.N))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F (ON.P (K (L X (AND (X TOP.N) (X (OF.P ?X_E))))))))
			(!R2 (?X_F FLY.N))
			(!R3 (?X_J CAT.N))
			(!R4 (?X_I (IS.V ?X_J)))
		)
		(:STEPS
			(?X_C ((ADV-E (DURING (K YESTERDAY.N))) (?X_A (BE.V ?X_F))))
			(?X_H (?X_I ENJOY_ACTION.35.V (KA (HUNT.N (K (PLUR BUG.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C BEFORE ?X_H))
		)
	)
	(
			"X_A is a on top of fly DURING yesterday."
			"A is a cat enjoy action.44s hunt bugs."
	)
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-225.PR ?X_A)) ** ?E)
		(:ROLES
			(!R1 (?X_B BIRD.N))
			(!R2 (?X_B MOTHER.N))
		)
		(:STEPS
			(E116.SK (?X_B (FEED.V ?X_A)))
		)
	)
	(
			"A bird mother fees X_A."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-226.PR ?X_O ?X_N)) ** ?E)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.38.V) ?X_B) ** ?X_C)
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.38.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.38.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.38.V) ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.38.V)))
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
	(EPI-SCHEMA ((?X_C TAKE.26.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?X_B PARK.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D PICTURE.N))
			(!R6 (?X_D (OF.P ?X_A)))
			(!R7 (?X_A BEAUTIFUL.A))
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-227.PR ?X_E ?X_G)) ** ?E)
		(:ROLES
			(!R1 (?X_G PICTURE.N))
			(!R2 (?X_E PARK.N))
			(!R3 (?X_F MAN.N))
			(!R4 (?X_H WOMAN.N))
			(!R5 (?X_H BEAUTIFUL.A))
			(!R6 (?X_G (OF.P ?X_H)))
		)
		(:STEPS
			(?X_D (?X_F ((ADV-A (FROM.P ?L1)) GO.38.V) ?X_E))
			(?X_B (?X_F TAKE.26.V ?X_G))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A man go.70s a park from L1."
			"A man take.72s a picture of a woman beautiful."
	)
)



(
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-228.PR (KE ((K JOGGING.N) (DOWN.P ?X_B)))
	               (K (L X (AND (X OUT.P) (X (OF.P (K TOWN.N)))))) ?X_J))
	             ** ?E)
		(:ROLES
			(!R1 (?X_B ROAD.N))
			(!R2 (?X_I DAD.N))
			(!R3 (?X_J AGENT.N))
			(!R4 (?X_I (PERTAIN-TO ?X_J)))
			(!R5 (?X_M (SET-OF AGENT.N)))
			(!R6 (?X_N CHINESE.A))
			(!R7 (?X_N FOOD.N))
		)
		(:STEPS
			(?X_D (?X_J (BE.V (KE ((K JOGGING.N) (DOWN.P ?X_B))))))
			(?X_F (?X_I (LIVE.V (K (L X (AND (X OUT.P) (X (OF.P (K TOWN.N)))))))))
			(?X_H (?X_I (SEE.V ?X_J)))
			(?X_L (?X_I ((UP.PRT PICK.V) ?X_J)))
			(?X_P (?X_M ((ADV-A (FOR.P ?X_N)) GO.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_H)))
			(!W3 (?X_D (BEFORE ?X_L)))
			(!W4 (?X_D (BEFORE ?X_P)))
			(!W5 (?X_F (BEFORE ?X_H)))
			(!W6 (?X_F (BEFORE ?X_L)))
			(!W7 (?X_F (BEFORE ?X_P)))
			(!W8 (?X_H (BEFORE ?X_L)))
			(!W9 (?X_H (BEFORE ?X_P)))
			(!W10 (?X_L (BEFORE ?X_P)))
		)
	)
	(
			"A agent is jogging down a road."
			"A dad of a agent lives out of."
			"A dad of a agent sees a agent."
			"A dad of a agent picks a agent up."
			"A agent goes for a chinese food."
	)
)



(
	(EPI-SCHEMA ((?X_C PLAY.26.V) ** ?X_D)
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
			(?X_D (?X_C ((ADV-A (WITH.P ?X_B)) PLAY.26.V)))
			(?X_D (?X_C PLAY.26.V ?X_A))
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
	(EPI-SCHEMA ((?X_A PLAY.27.V ?X_B) ** ?X_C)
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-229.PR (ALL.D DAY.N) ?X_K ?X_H)) ** ?E)
		(:ROLES
			(!R1 (?X_E DAY.N))
			(!R2 (?X_E LONG.A))
			(!R3 (?X_H (PLUR GAME.N)))
			(!R4 (?X_K HOUSE.N))
			(!R5 (?X_L AGENT.N))
		)
		(:STEPS
			(?X_N ((ADV-E (DURING (K YESTERDAY.N))) (?X_A (RAIN.V (ALL.D DAY.N)))))
			(?X_B (?X_L (IN.P ?X_K)))
			(?X_J (?X_L ((ADV-A (FOR.P (KA (GET.V (KJ (VERY.ADV BORED.A)))))) START.V)))
			(?X_D ((ADV-E (DURING ?X_E)) (?X_A BE.V)))
			(?X_G (?X_L PLAY.26.V))
			(?X_G (?X_L PLAY.27.V ?X_H))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_B)))
			(!W2 (?X_N (BEFORE ?X_J)))
			(!W3 (?X_N (BEFORE ?X_D)))
			(!W4 (?X_B (BEFORE ?X_J)))
			(!W5 (?X_B (BEFORE ?X_D)))
			(!W6 (?X_J (BEFORE ?X_D)))
		)
	)
	(
			"X_A rains all day DURING yesterday."
			"A agent is in."
			"A agent starts for getting KJ very bored."
			"X_A is DURING a day long."
			"A agent play.100s."
			"A agent play.101s a games."
	)
)



(
	(EPI-SCHEMA ((?X_A TAKE.27.V ?X_B) ** ?X_C)
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-230.PR (K COFFEE.N) ?X_A ?X_E)) ** ?E)
		(:ROLES
			(!R1 (?X_E SHARP.A))
			(!R2 (?X_E TURN.N))
			(!R3 (?X_F AGENT.N))
			(!R4 (?X_J NICE.A))
			(!R5 (?X_J AGENT.N))
			(!R6 (?X_I (PERTAIN-TO ?X_J)))
		)
		(:STEPS
			(?X_H (?X_J (HOLD.V (K COFFEE.N))))
			(?X_D (?X_F TAKE.27.V ?X_E))
			(?X_B (?X_J (ABOUT.P ?X_A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_D)))
			(!W2 (?X_H (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A nice agent holds coffee."
			"A agent take.106s a sharp turn."
			"A nice agent is about."
	)
)



(
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-231.PR (KA ((ADV-A (TO.P ?X_C)) GO.V)) ?X_H
	               (TWO.D (L X (AND (X DIFFERENT.A) (X (PLUR MOVIE.N)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C (PLUR MOVIE.N)))
			(!R2 (?X_H FRIEND.N))
			(!R3 (?X_H (PERTAIN-TO ?X_I)))
		)
		(:STEPS
			(?X_E (?X_I (WANT.V (KA ((ADV-A (TO.P ?X_C)) GO.V)))))
			(?X_G (?X_I (WITH.P ?X_H)))
			(?X_B (?X_I ((ADV-A (WITH.P ?X_H)) GO.V)))
			(?X_K (?X_I (SEE.V (TWO.D (L X (AND (X DIFFERENT.A) (X (PLUR MOVIE.N))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_G)))
			(!W2 (?X_E (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_K)))
			(!W4 (?X_G (BEFORE ?X_B)))
			(!W5 (?X_G (BEFORE ?X_K)))
			(!W6 (?X_B (BEFORE ?X_K)))
		)
	)
	(
			"X_I wants to a movies going."
			"X_I is with."
			"X_I goes with a friend of X_I."
			"X_I sees two different movie."
	)
)



(
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-232.PR ?X_G)) ** ?E)
		(:ROLES
			(!R1 (?X_H AGENT.N))
			(!R2 (?X_D (PERTAIN-TO ?X_H)))
			(!R3 (?X_C (PLUR HILL.N)))
			(!R4 (?X_C (NEAR.P ?X_D)))
			(!R5 (?X_G PONY.N))
			(!R6 (?X_G (PERTAIN-TO ?X_H)))
			(!R7 (?X_I LARGE.A))
			(!R8 (?X_I ROCK.N))
		)
		(:STEPS
			(?X_B (?X_H (HAVE.V ?X_G)))
			(?X_F (?X_H ((ADV-A (OVER.P ?X_C)) RIDE.V)))
			(?X_K (?X_G ((ADV-A (ON.P ?X_I)) STUMBLE.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_F)))
			(!W2 (?X_B (BEFORE ?X_K)))
			(!W3 (?X_F (BEFORE ?X_K)))
		)
	)
	(
			"A agent has a pony of a agent."
			"A agent rides over a hills near a of a agent."
			"A pony of a agent stumbles on a large rock."
		Individual NEW$14$286.SK needs Skolemization
		Individual ONE$32$295.SK needs Skolemization
	)
)



(
	(EPI-SCHEMA ((?X_A ((BACK.ADV GET.52.V) ?O)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
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
	(EPI-SCHEMA ((?X_A ((BACK.ADV GET.52.V) ?O)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
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
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-233.PR ?X_P
	               (K
	                (L X (AND (X IPAD.N) (X (HAS-DET.PR (IND A.D))) (X NEWER.A))))
	               ?O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K STORE.N))
			(!R2 (?X_P IPAD.N))
		)
		(:STEPS
			(?X_O (?X_A (WANT.V ?X_P)))
			(?X_M (?X_A ((REALLY.ADV LIKE.V) ?X_P)))
			(?X_J (?X_A ((ADV-A (TO.P ?X_K)) GO.V)))
			(?X_C (?X_A ((BACK.ADV GET.52.V) ?O)))
			(?X_D (?X_A ((BACK.ADV GET.52.V) ?O)))
			(?X_H
	   (?X_A
	    (HAVE.V (K (L X (AND (X IPAD.N) (X (HAS-DET.PR (IND A.D))) (X NEWER.A)))))))
			(?X_F
	   (?X_A
	    (HAVE.V (K (L X (AND (X IPAD.N) (X (HAS-DET.PR (IND A.D))) (X NEWER.A)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_M)))
			(!W2 (?X_O (BEFORE ?X_J)))
			(!W3 (?X_O (BEFORE ?X_H)))
			(!W4 (?X_O (BEFORE ?X_F)))
			(!W5 (?X_M (BEFORE ?X_J)))
			(!W6 (?X_M (BEFORE ?X_H)))
			(!W7 (?X_M (BEFORE ?X_F)))
			(!W8 (?X_J (BEFORE ?X_H)))
			(!W9 (?X_J (BEFORE ?X_F)))
			(!W10 (?X_C (BEFORE ?X_H)))
			(!W11 (?X_C (BEFORE ?X_F)))
			(!W12 (?X_D (BEFORE ?X_H)))
			(!W13 (?X_D (BEFORE ?X_F)))
		)
	)
	(
			"X_A wants a ipad."
			"X_A likes a ipad really."
			"X_A goes to a store."
			"X_A get.149s O back."
			"X_A get.149s O back."
			"X_A has ipad HAS-DET newer."
			"X_A has ipad HAS-DET newer."
	)
)



(
	(EPI-SCHEMA ((?X_F (((ADV-A (FROM.P ?X_A)) GET.14.V) ?X_G)) ** ?X_H)
		(:ROLES
			(!R1 (?X_F AGENT.N))
			(!R2 (NOT (?X_G AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_F = ?X_G)))
			(!R5 (?X_F (KA LET.V) ((ADV-A (OF.P ?X_E)) GO.V)))
			(!R6 (?X_G CUT.N))
			(!R7 (?X_A BRANCH.N))
			(!R8 (?X_B (PERTAIN-TO ?X_F)))
			(!R9 (?X_B DOG.N))
			(!R10 (?X_F ((STILL.ADV HAVE.V) ?X_C)))
			(!R11 (?X_C SCAR.N))
			(!R12 (?X_G (ON.P ?X_D)))
			(!R13 (?X_D THIGH.N))
			(!R14 (?X_D (PERTAIN-TO ?X_F)))
			(!R15 (?X_E LEASH.N))
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
	(EPI-SCHEMA ((?X_F (((ADV-A (FROM.P ?X_A)) GET.53.V) ?X_G)) ** ?X_H)
		(:ROLES
			(!R1 (?X_F AGENT.N))
			(!R2 (NOT (?X_G AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_F = ?X_G)))
			(!R5 (?X_G CUT.N))
			(!R6 (?X_F (KA LET.V) ((ADV-A (OF.P ?X_E)) GO.V)))
			(!R7 (?X_A BRANCH.N))
			(!R8 (?X_G (ON.P ?X_B)))
			(!R9 (?X_B (PERTAIN-TO ?X_F)))
			(!R10 (?X_B THIGH.N))
			(!R11 (?X_C (PERTAIN-TO ?X_F)))
			(!R12 (?X_C DOG.N))
			(!R13 (?X_F ((STILL.ADV HAVE.V) ?X_D)))
			(!R14 (?X_D SCAR.N))
			(!R15 (?X_E LEASH.N))
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
	(EPI-SCHEMA ((?X_F (((ADV-A (FROM.P ?X_A)) GET.54.V) ?X_G)) ** ?X_H)
		(:ROLES
			(!R1 (?X_F AGENT.N))
			(!R2 (NOT (?X_G AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_F = ?X_G)))
			(!R5 (?X_G CUT.N))
			(!R6 (?X_F (KA LET.V) ((ADV-A (OF.P ?X_C)) GO.V)))
			(!R7 (?X_A BRANCH.N))
			(!R8 (?X_G (ON.P ?X_B)))
			(!R9 (?X_B (PERTAIN-TO ?X_F)))
			(!R10 (?X_B THIGH.N))
			(!R11 (?X_C LEASH.N))
			(!R12 (?X_D DOG.N))
			(!R13 (?X_D (PERTAIN-TO ?X_F)))
			(!R14 (?X_E SCAR.N))
			(!R15 (?X_F ((STILL.ADV HAVE.V) ?X_E)))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-234.PR ?X_H ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_I CUT.N))
			(!R2 (?X_C BRANCH.N))
			(!R3 (?X_H DOG.N))
			(!R4 (?X_L (KA LET.V) ((ADV-A (OF.P ?X_K)) GO.V)))
			(!R5 (?X_L AGENT.N))
			(!R6 (?X_H (PERTAIN-TO ?X_L)))
			(!R7 (?X_J THIGH.N))
			(!R8 (?X_J (PERTAIN-TO ?X_L)))
			(!R9 (?X_I (ON.P ?X_J)))
			(!R10 (?X_K LEASH.N))
			(!R11 (?X_M SCAR.N))
			(!R12 (?X_L ((STILL.ADV HAVE.V) ?X_M)))
		)
		(:STEPS
			(?X_G (?X_L (WALK.V ?X_H)))
			(?X_E (?X_L ((ADV-A (AFTER.P ?X_H)) RUN.V)))
			(?X_B (?X_L (((ADV-A (FROM.P ?X_C)) GET.14.V) ?X_I)))
			(?X_B (?X_L (((ADV-A (FROM.P ?X_C)) GET.53.V) ?X_I)))
			(?X_B (?X_L (((ADV-A (FROM.P ?X_C)) GET.54.V) ?X_I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
			(!W2 (?X_G (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A agent still have a scar walks a dog of a agent still have a scar."
			"A agent still have a scar runs after a dog of a agent still have a scar."
			"A agent still have a scar get.163s a cut on a thigh of a agent still have X_M from a branch."
			"A agent still have a scar get.164s a cut on a thigh of a agent still have X_M from a branch."
			"A agent still have a scar get.165s a cut on a thigh of a agent still have X_M from a branch."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) LEAVE.1.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PERTAIN-TO ?X_C)))
			(!R6 (?X_A WINDOW.N))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
			(!R8 (?X_B CAT.N))
			(!R9 (?L2 OPEN.N))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) LEAVE.1.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) LEAVE.1.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) LEAVE.1.V) ?L2))
			(?X_D (?X_C LEAVE.1.V))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_D))
			(!W2 (?I2 BEFORE ?X_D))
			(!W3 (?P1 AFTER ?X_D))
			(!W4 (?P2 AFTER ?X_D))
			(!W5 (?G1 CAUSE-OF ?X_D))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) LEAVE.2.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A WINDOW.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
			(!R8 (?X_B CAT.N))
			(!R9 (?L2 OPEN.N))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) LEAVE.2.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) LEAVE.2.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) LEAVE.2.V) ?L2))
			(?X_D (?X_C LEAVE.2.V))
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
	(EPI-SCHEMA ((?X_U
	              (COMPOSITE-SCHEMA-235.PR ?X_P
	               (K (L X (AND (X OUT.P) (X (OF.P (THE.D HOUSE.N))))))
	               (K (PLUR POSTER.N)) ?X_T ?X_U ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K PERSON.N))
			(!R2 (?X_P HOUSE.N))
			(!R3 (?X_T CAT.N))
			(!R4 (?X_S WINDOW.N))
			(!R5 (?X_S (PERTAIN-TO ?X_U)))
			(!R6 (?X_T (PERTAIN-TO ?X_U)))
		)
		(:STEPS
			(?X_B (?X_T OUT.P))
			(?X_C (?X_T (OF.P ?X_P)))
			(?X_O (?X_U (FOR.P ?X_T)))
			(?X_M
	   (?X_U
	    ((UP.PRT ((ADV-A (FOR.P (KA (FIND.V ?X_T)))) PUT.V)) (K (PLUR POSTER.N)))))
			(?X_J (?X_K ?X_U (WITH.P ?X_T)))
			(?X_R (?X_U ((ADV-A (FROM.P ?L1)) LEAVE.1.V) ?L2))
			(?X_D (?X_U ((ADV-A (FROM.P ?L1)) LEAVE.2.V) ?L2))
			(?X_E (?X_T (GET.V (K (L X (AND (X OUT.P) (X (OF.P (THE.D HOUSE.N)))))))))
			(?X_F (?X_U ((ADV-A (FOR.P ?X_T)) LOOK.V)))
			(?X_G
	   (?X_U
	    ((UP.PRT ((ADV-A (FOR.P (KA (FIND.V ?X_T)))) PUT.V)) (K (PLUR POSTER.N)))))
			(?X_H (?X_K (((ADV-A (WITH.P ?X_T)) CALL.V) ?X_U)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_C)))
			(!W2 (?X_B (BEFORE ?X_F)))
			(!W3 (?X_B (BEFORE ?X_G)))
			(!W4 (?X_B (BEFORE ?X_H)))
			(!W5 (?X_C (BEFORE ?X_F)))
			(!W6 (?X_C (BEFORE ?X_G)))
			(!W7 (?X_C (BEFORE ?X_H)))
			(!W8 (?X_O (BEFORE ?X_F)))
			(!W9 (?X_O (BEFORE ?X_G)))
			(!W10 (?X_O (BEFORE ?X_H)))
			(!W11 (?X_M (BEFORE ?X_G)))
			(!W12 (?X_M (BEFORE ?X_H)))
			(!W13 (?X_J (BEFORE ?X_H)))
			(!W14 (?X_R (BEFORE ?X_D)))
			(!W15 (?X_R (BEFORE ?X_E)))
			(!W16 (?X_R (BEFORE ?X_F)))
			(!W17 (?X_R (BEFORE ?X_G)))
			(!W18 (?X_R (BEFORE ?X_H)))
			(!W19 (?X_D (BEFORE ?X_E)))
			(!W20 (?X_D (BEFORE ?X_F)))
			(!W21 (?X_D (BEFORE ?X_G)))
			(!W22 (?X_D (BEFORE ?X_H)))
			(!W23 (?X_E (BEFORE ?X_F)))
			(!W24 (?X_E (BEFORE ?X_G)))
			(!W25 (?X_E (BEFORE ?X_H)))
			(!W26 (?X_F (BEFORE ?X_G)))
			(!W27 (?X_F (BEFORE ?X_H)))
			(!W28 (?X_G (BEFORE ?X_H)))
		)
	)
	(
			"A cat of X_U is out."
			"A cat of X_U is of."
			"X_U is for."
			"X_U puts posters up for finding a cat of X_U."
			"A person is with."
			"X_U leave.186s L2 from L1."
			"X_U leave.187s L2 from L1."
			"A cat of X_U gets out of."
			"X_U looks for a cat of X_U."
			"X_U puts posters up for finding a cat of X_U."
			"A person calls X_U with a cat of X_U."
	)
)



(
	(EPI-SCHEMA (((K SUSIE.N) (COMPOSITE-SCHEMA-236.PR ?X_H ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_H PUPPY.N))
			(!R2 (?X_I BED.N))
			(!R3 (?X_I (PERTAIN-TO (K SUSIE.N))))
		)
		(:STEPS
			(?X_C ((K SUSIE.N) (GET.V ?X_H)))
			(?X_E ((K SUSIE.N) (EVERYWHERE.ADV LOOK.V)))
			(?X_G (?X_H (UNDER.P ?X_I)))
			(?X_A (?X_H ((ADV-A (UNDER.P ?X_I)) BE.V)))
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
			"Susie gets a puppy."
			"Susie looks everywhere."
			"A puppy is under."
			"A puppy is under a bed of susie."
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-237.PR ?X_D (KA (FAST.ADV (PASV DRIVE.V)))
	               (KE (?X_K ((PASV MAKE.V) (KA (FAST.ADV (PASV DRIVE.V)))))) ?X_K
	               ?X_N))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D (VERY.ADV FAST.A)))
			(!R2 (?X_D CAR.N))
			(!R3 (?X_K NEW.A))
			(!R4 (?X_K CAR.N))
			(!R5 (?X_N GREAT.A))
			(!R6 (?X_N TIME.N))
		)
		(:STEPS
			(?X_C (?X_A (BUY.V ?X_K)))
			(?X_F (?X_K (BE.V ?X_D)))
			(?X_H (?X_K ((PASV MAKE.V) (KA (FAST.ADV (PASV DRIVE.V))))))
			(?X_J
	   (?X_A (THINK.V (KE (?X_K ((PASV MAKE.V) (KA (FAST.ADV (PASV DRIVE.V)))))))))
			(?X_M (?X_A ((FAST.ADV DRIVE.V) ?X_K)))
			(?X_P (?X_A (HAVE.V ?X_N)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_F)))
			(!W2 (?X_C (BEFORE ?X_H)))
			(!W3 (?X_C (BEFORE ?X_J)))
			(!W4 (?X_C (BEFORE ?X_M)))
			(!W5 (?X_C (BEFORE ?X_P)))
			(!W6 (?X_F (BEFORE ?X_H)))
			(!W7 (?X_F (BEFORE ?X_J)))
			(!W8 (?X_F (BEFORE ?X_M)))
			(!W9 (?X_F (BEFORE ?X_P)))
			(!W10 (?X_H (BEFORE ?X_J)))
			(!W11 (?X_H (BEFORE ?X_M)))
			(!W12 (?X_H (BEFORE ?X_P)))
			(!W13 (?X_J (BEFORE ?X_M)))
			(!W14 (?X_J (BEFORE ?X_P)))
			(!W15 (?X_M (BEFORE ?X_P)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) RETURN.1.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B BOY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A BIRD.N))
			(!R7 (?L2 HOME.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RETURN.1.V)))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RETURN.1.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RETURN.1.V) ?L2))
			(?X_C (?X_B RETURN.1.V))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) LEAVE.3.V) (K SCHOOL.N)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B BOY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K SCHOOL.N) DESTINATION.N))
			(!R4 (NOT (?L1 = (K SCHOOL.N))))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A BIRD.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (K SCHOOL.N))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K SCHOOL.N)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K SCHOOL.N))))
		)
		(:PARAPHRASES
			(?X_C
	   (?X_B
	    ((ADV-A (DESTINATION_PREP.? (K SCHOOL.N)))
	     ((ADV-A (FOR.P (K SCHOOL.N))) LEAVE.3.V))))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K SCHOOL.N))) LEAVE.3.V))))
			(?X_C
	   (?X_B ((ADV-A (DESTINATION_PREP.? (K SCHOOL.N))) LEAVE.3.V) (K SCHOOL.N)))
			(?X_C (?X_B (LOCATION_ADV.? LEAVE.3.V)))
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
	(EPI-SCHEMA ((?X_Q (COMPOSITE-SCHEMA-238.PR ?X_O ?X_D ?L2 (K SCHOOL.N))) ** ?E)
		(:ROLES
			(!R1 (?X_P BIRD.N))
			(!R2 (?X_D BROTHER.N))
			(!R3 (?X_D (PERTAIN-TO ?X_D)))
			(!R4 (?X_O CAGE.N))
			(!R5 (?X_Q BOY.N))
			(!R6 (?X_P (PERTAIN-TO ?X_Q)))
		)
		(:STEPS
			(?X_N (?X_Q (LOCK.V ?X_O)))
			(?X_C (?X_Q (CATCH.V ?X_D)))
			(?X_L (?X_Q ((ADV-A (FROM.P ?L1)) LEAVE.3.V) (K SCHOOL.N)))
			(?X_J (?X_Q ((ADV-A (FROM.P ?L1)) RETURN.1.V) ?L2))
			(?X_H (?X_O UNLOCK.V))
			(?X_F (?X_O UNLOCK.V))
			(?X_A (?X_Q (KA CATCH.V) ?X_D ((ADV-A (WITH.P ?X_P)) PLAY.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_L)))
			(!W2 (?X_N (BEFORE ?X_J)))
			(!W3 (?X_N (BEFORE ?X_H)))
			(!W4 (?X_N (BEFORE ?X_F)))
			(!W5 (?X_N (BEFORE ?X_A)))
			(!W6 (?X_C (BEFORE ?X_A)))
			(!W7 (?X_L (BEFORE ?X_J)))
			(!W8 (?X_L (BEFORE ?X_H)))
			(!W9 (?X_L (BEFORE ?X_F)))
			(!W10 (?X_L (BEFORE ?X_A)))
			(!W11 (?X_J (BEFORE ?X_H)))
			(!W12 (?X_J (BEFORE ?X_F)))
			(!W13 (?X_J (BEFORE ?X_A)))
			(!W14 (?X_H (BEFORE ?X_A)))
			(!W15 (?X_F (BEFORE ?X_A)))
		)
	)
	(
			"A boy locks a cage."
			"A boy catches a brother of a brother of X_D."
			"A boy leave.210s school from L1."
			"A boy return.209s L2 from L1."
			"A cage unlocks."
			"A cage unlocks."
			"A boy plays with a bird of a boy."
	)
)



(
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.36.V (KA (TAKE.V ?X_C))) ** ?X_D)
		(:ROLES
			(!R1 (?X_B DOG.N))
			(!R2 ((KA (TAKE.V ?X_C)) ACTION.N))
			(!R3 (?X_C BATH.N))
			(!R4 (?X_A AGENT.N))
			(!R5 (?X_B (PERTAIN-TO ?X_A)))
		)
		(:PRECONDS
			(?I1 (?X_B (THINK.V (THAT ((KA (TAKE.V ?X_C)) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_D (?X_B (WANT.V (KA (TAKE.V ?X_C)))))
			(?X_D (?X_B (LIKE.V (KA (TAKE.V ?X_C)))))
			(?X_D (?X_B (LOVE.V (KA (TAKE.V ?X_C)))))
			(?X_D (?X_B (ENJOY.V (KA (TAKE.V ?X_C)))))
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
	              (COMPOSITE-SCHEMA-239.PR
	               (KE (AND (?X_H READY.A) (?X_H (FOR.P ?X_L)))) ?X_M
	               (KA (TAKE.V ?X_K))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E BATH.N))
			(!R2 (?X_H BATH.N))
			(!R3 (?X_H WATER.N))
			(!R4 (?X_M AGENT.N))
			(!R5 (?X_K BATH.N))
			(!R6 (?X_L DOG.N))
			(!R7 (?X_L (PERTAIN-TO ?X_M)))
		)
		(:STEPS
			(?X_G (?X_M (GOT.V (KE (AND (?X_H READY.A) (?X_H (FOR.P ?X_L)))))))
			(?X_D (?X_L ((ADV-A (INTO.P ?X_E)) JUMP.V)))
			(?X_B (?X_L (((ADV-A (WITH.P (K WATER.N))) SPLASH.V) ?X_M)))
			(?X_J (?X_L ENJOY_ACTION.36.V (KA (TAKE.V ?X_K))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_D)))
			(!W2 (?X_G (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-240.PR ?X_C ?X_F)) ** ?E)
		(:ROLES
			(!R1 (?X_C LITTLE.A))
			(!R2 (?X_F TINY.A))
			(!R3 (?X_F CRACK.N))
			(!R4 (?X_J AGENT.N))
			(!R5 (?X_I CHAIR.N))
			(!R6 (?X_I (PERTAIN-TO ?X_J)))
		)
		(:STEPS
			(?X_B (?X_J ((ADV-A (IN.P ?X_I)) SIT.V)))
			(?X_E (?X_J (((ADV (TOO.ADV FAR.A)) (BACK.PRT LEAN.V)) ?X_C)))
			(?X_H (?X_J (HEAR.V ?X_F)))
			(?X_L (?X_J (DOWN.ADV ((ADV-A (AT.P ?X_I)) LOOK.V))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_E)))
			(!W2 (?X_B (BEFORE ?X_H)))
			(!W3 (?X_B (BEFORE ?X_L)))
			(!W4 (?X_E (BEFORE ?X_H)))
			(!W5 (?X_E (BEFORE ?X_L)))
			(!W6 (?X_H (BEFORE ?X_L)))
		)
	)
	(
			"A agent gets and a bath water ready a bath water for a dog of a agent."
			"A dog of a agent jumps into a bath."
			"A dog of a agent splashes a agent with water."
			"A dog of a agent enjoy action.1s taking a bath."
	)
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (TO.P ?X_A)) TAKE.28.V) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B BIRD.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C WORM.N))
			(!R6 (?X_A NEST.N))
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
	(EPI-SCHEMA ((?X_B (((ADV-A (TO.P ?X_A)) TAKE.15.V) ?X_C)) ** ?X_E)
		(:ROLES
			(!R1 (?X_B BIRD.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C WORM.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A NEST.N))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-241.PR ?X_L (ANOTHER.D WORM.N) ?X_K)) ** ?E)
		(:ROLES
			(!R1 (?X_F (STILL.ADV HUNGRY.A)))
			(!R2 (?X_F BABY.N))
			(!R3 (?X_F BIRD.N))
			(!R4 (?X_L NEST.N))
			(!R5 (?X_K WORM.N))
			(!R6 (?X_M BIRD.N))
			(!R7 (?X_L (PERTAIN-TO ?X_M)))
		)
		(:STEPS
			(?X_J (?X_M (CATCH.V ?X_K)))
			(?X_H (?X_M ?X_K (TO.P ?X_L)))
			(?X_A (?X_M (((ADV-A (TO.P ?X_L)) TAKE.28.V) ?X_K)))
			(?X_A (?X_M (((ADV-A (TO.P ?X_L)) TAKE.15.V) ?X_K)))
			(?X_E (?X_M (((ADV-A (TO.P ?X_F)) FED.V) ?X_K)))
			(?X_C (?X_M (CATCH.V (ANOTHER.D WORM.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_A)))
			(!W2 (?X_J (BEFORE ?X_E)))
			(!W3 (?X_J (BEFORE ?X_C)))
			(!W4 (?X_H (BEFORE ?X_A)))
			(!W5 (?X_H (BEFORE ?X_E)))
			(!W6 (?X_H (BEFORE ?X_C)))
			(!W7 (?X_A (BEFORE ?X_E)))
			(!W8 (?X_A (BEFORE ?X_C)))
			(!W9 (?X_E (BEFORE ?X_C)))
		)
	)
	(
			"A agent sits in a chair of a agent."
			"A agent leans a little ADV too far back."
			"A agent hears a tiny crack."
			"A agent looks down at a chair of a agent."
	)
)



(
	(EPI-SCHEMA ((?X_D EAT.11.V ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_D MONKEY.N))
			(!R2 (?X_C FOOD.N))
			(!R3 (?X_D BROWN.A))
			(!R4 (?X_C COCOANUT.N))
			(!R5 (?X_A TAIL.N))
			(!R6 (?X_D (HAS.V ?X_A)))
			(!R7 (?X_A LARGE.A))
			(!R8 (?X_B (HAS.V ?X_C)))
			(!R9 (?X_B MONKEY.N))
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
			(!W4 (?X_E (AFTER ?X_F)))
			(!W5 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D EAT.12.V ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_D MONKEY.N))
			(!R2 (?X_C FOOD.N))
			(!R3 (?X_C COCOANUT.N))
			(!R4 (?X_D BROWN.A))
			(!R5 (?X_A (HAS.V ?X_C)))
			(!R6 (?X_A MONKEY.N))
			(!R7 (?X_D (HAS.V ?X_B)))
			(!R8 (?X_B LARGE.A))
			(!R9 (?X_B TAIL.N))
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
			(!W4 (?X_E (AFTER ?X_F)))
			(!W5 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-242.PR ?X_E)) ** ?E)
		(:ROLES
			(!R1 (?X_E COCOANUT.N))
			(!R2 (?X_F BROWN.A))
			(!R3 (?X_F MONKEY.N))
			(!R4 (?X_D MONKEY.N))
			(!R5 (?X_D (HAS.V ?X_E)))
			(!R6 (?X_G LARGE.A))
			(!R7 (?X_G TAIL.N))
			(!R8 (?X_F (HAS.V ?X_G)))
		)
		(:STEPS
			(?X_C (?X_F (LIKE.V ?X_E)))
			(?X_A (?X_F EAT.11.V ?X_E))
			(?X_A (?X_F EAT.12.V ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_A)))
		)
	)
	(
			"A bird catches a worm."
			"A bird is to."
			"A bird take.50s a worm to a nest of a bird."
			"A bird take.52s a worm to a nest of a bird."
			"A bird fed a worm to a still hungry baby bird."
			"A bird catches another worm."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-243.PR ?X_F ?X_L ?X_M)) ** ?E)
		(:ROLES
			(!R1 (?X_A TOP.N))
			(!R2 (?X_F SPIN.V))
			(!R3 (?X_F (PLUR TOP.N)))
			(!R4 (?X_F (ON.P ?X_G)))
			(!R5 (?X_L (K LARGE.A) TOP.N))
			(!R6 (?X_L (PERTAIN-TO ?X_N)))
			(!R7 (?X_M (K SMALL.A) TOP.N))
			(!R8 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_C (?X_A SPIN.V))
			(?X_E (?X_N (SPIN.V ?X_F)))
			(?X_I (?X_N (SPIN.V ?X_F)))
			(?X_K (?X_N (SPIN.V ?X_L)))
			(?X_P (?X_N (SPIN.V ?X_M)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_I)))
			(!W3 (?X_C (BEFORE ?X_K)))
			(!W4 (?X_C (BEFORE ?X_P)))
			(!W5 (?X_E (BEFORE ?X_I)))
			(!W6 (?X_E (BEFORE ?X_K)))
			(!W7 (?X_E (BEFORE ?X_P)))
			(!W8 (?X_I (BEFORE ?X_K)))
			(!W9 (?X_I (BEFORE ?X_P)))
			(!W10 (?X_K (BEFORE ?X_P)))
		)
	)
	(
			"A brown monkey has a large tail likes a cocoanut."
			"A brown monkey has a large tail eat.55s a cocoanut."
			"A brown monkey has a large tail eat.57s a cocoanut."
	)
)



(
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-244.PR
	               (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N))))))
	               (KA ((ADV-A (FOR.P (K HELP.N))) CALL.V)) (TEN.D (PLUR MILE.N))
	               ?X_J))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I MAN.N))
			(!R2 (?X_H (PERTAIN-TO ?X_I)))
			(!R3 (?X_J GAS.N))
			(!R4 (?X_J STATION.N))
		)
		(:STEPS
			(?X_C (?X_I (RUN.V (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N)))))))))
			(?X_E (?X_I (TRY.V (KA ((ADV-A (FOR.P (K HELP.N))) CALL.V)))))
			(?X_G (?X_I (WALK.V (TEN.D (PLUR MILE.N)))))
			(?X_L (?X_I (FIND.V ?X_J)))
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
			"A top spins."
			"X_N spins a spin tops on X_G."
			"X_N spins a spin tops on X_G."
			"X_N spins a of X_N."
			"X_N spins a of X_N."
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.39.V) (K LUNCH.N)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K LUNCH.N) DESTINATION.N))
			(!R4 (NOT (?L1 = (K LUNCH.N))))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (KA ((ADV-A (AT.P (K LUNCH.N))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_A (AT.P ?L1)))
			(?I2 (NOT (?X_A (AT.P (K LUNCH.N)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_A (AT.P ?L1))))
			(?P2 (?X_A (AT.P (K LUNCH.N))))
		)
		(:PARAPHRASES
			(?X_B
	   ((ADV-E (DURING (K TODAY.N)))
	    (?X_A
	     ((ADV-A (DESTINATION_PREP.? (K LUNCH.N)))
	      ((ADV-A (TO.P (K LUNCH.N))) GO.39.V)))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? (K LUNCH.N))) GO.39.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? (K LUNCH.N))) GO.39.V) (K LUNCH.N)))
			(?X_B (?X_A (LOCATION_ADV.? GO.39.V)))
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
	(EPI-SCHEMA ((?X_A GET.55.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B GOOD.A))
			(!R6 (?X_B SALTY.A))
			(!R7 (?X_B GUMBO.N))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-245.PR ?X_C (K LUNCH.N) ?X_F)) ** ?E)
		(:ROLES
			(!R1 (?X_C LOT.N))
			(!R2 (?X_C (OF.P (K WATER.N))))
			(!R3 (?X_F GUMBO.N))
			(!R4 (?X_F SALTY.A))
			(!R5 (?X_F GOOD.A))
			(!R6 (?X_I AGENT.N))
		)
		(:STEPS
			(?X_H (?X_I ((ADV-A (FROM.P ?L1)) GO.39.V) (K LUNCH.N)))
			(?X_E (?X_I GET.55.V ?X_F))
			(?X_B (?X_I (DRANK.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_E)))
			(!W2 (?X_H (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_B)))
		)
	)
	(
			"A man runs out of."
			"A man tries for help calling."
			"A man walks ten miles."
			"A man finds a gas station."
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-246.PR) ** ?E)
		(:ROLES
			(!R1 (?X_A MARKET.N))
		)
		(:STEPS
			(?X_C (?X_A RALLY.V))
		)
	)
	(
			"A agent go.107s lunch from L1."
			"A agent get.103s a gumbo salty good."
			"A agent drinks a lot of water."
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.37.V (KA (ASK.V ?X_B (KA (COURT.V ?X_B))))) **
	             ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (ASK.V ?X_B (KA (COURT.V ?X_B)))) ACTION.N))
			(!R3 (?X_A (SO.ADV EXCITED.A)))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA (ASK.V ?X_B (KA (COURT.V ?X_B)))) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_C (?X_A (WANT.V (KA (ASK.V ?X_B (KA (COURT.V ?X_B)))))))
			(?X_C (?X_A (LIKE.V (KA (ASK.V ?X_B (KA (COURT.V ?X_B)))))))
			(?X_C (?X_A (LOVE.V (KA (ASK.V ?X_B (KA (COURT.V ?X_B)))))))
			(?X_C (?X_A (ENJOY.V (KA (ASK.V ?X_B (KA (COURT.V ?X_B)))))))
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-247.PR ?X_D ?X_A (KE (?X_C OFFICIAL.A))
	               (KA (ASK.V ?X_D (KA (COURT.V ?X_D))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M (SO.ADV EXCITED.A)))
		)
		(:STEPS
			(?X_L (?X_M (LIKE.V ?X_D)))
			(?X_H (?X_D (SAY.V ?X_A)))
			(?X_F (?X_B (MAKE.V (KE (?X_C OFFICIAL.A)))))
			(?X_J (?X_M ENJOY_ACTION.37.V (KA (ASK.V ?X_D (KA (COURT.V ?X_D))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_L (BEFORE ?X_H)))
			(!W2 (?X_L (BEFORE ?X_F)))
			(!W3 (?X_H (BEFORE ?X_F)))
		)
	)
	(
			"A market rallies."
		error composing story schemas
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-248.PR ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_F WINDOW.N))
			(!R2 (?X_I (VERY.ADV DARK.A)))
			(!R3 (?X_I RAIN.N))
			(!R4 (?X_I (PLUR CLOUD.N)))
		)
		(:STEPS
			(?X_E (?X_A ((ADV-A (AT.P (K WORK.N))) BE.V)))
			(?X_H (?X_A ((ADV-A (OUT.P ?X_F)) LOOK.V)))
			(?X_K (?X_B (BE.V ?X_I)))
			(?X_M (?X_C ((ADV-A (FOR.P (KA ((ADV (VERY.ADV HARD.A)) RAIN.V)))) START.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_H)))
			(!W2 (?X_E (BEFORE ?X_K)))
			(!W3 (?X_E (BEFORE ?X_M)))
			(!W4 (?X_H (BEFORE ?X_K)))
			(!W5 (?X_H (BEFORE ?X_M)))
			(!W6 (?X_K (BEFORE ?X_M)))
		)
	)
	(
			"A so excited likes X_D."
			"X_D says X_A."
			"X_B makes X_C official."
			"A so excited enjoy action.112s asking X_D courting X_D."
	)
)



(
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-249.PR ?X_L)) ** ?E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_G TALL.A))
			(!R3 (?X_G TREE.N))
			(!R4 (?X_L BIRD.N))
			(!R5 (?X_L (HAS.V (TWO.D (PLUR LEG.N)))))
			(!R6 (?X_L (HAS.V (SET-OF ?X_J ?X_K))))
			(!R7 (?X_L (HAS.V (K (PLUR WING.N)))))
			(!R8 (?X_L (ON.P ?X_M)))
		)
		(:STEPS
			(?X_D (?X_B ((CAN.AUX SEE.V) ?X_L)))
			(?X_F (?X_L (CAN.AUX FLY.V)))
			(?X_I (?X_L (CAN.AUX ((ADV-A (OVER.P ?X_G)) FLY.V))))
			(?X_A (?X_L SING.V))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_I)))
			(!W3 (?X_D (BEFORE ?X_A)))
			(!W4 (?X_F (BEFORE ?X_I)))
			(!W5 (?X_F (BEFORE ?X_A)))
			(!W6 (?X_I (BEFORE ?X_A)))
		)
	)
	(
			"X_A is at work."
			"X_A looks out a window."
			"X_B is a very dark rain clouds."
			"X_C starts for ADV very hard rain."
	)
)



(
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-250.PR ?X_A (K NOTHING.N))) ** ?E)
		(:ROLES
			(!R1 (?X_D WIFE.N))
			(!R2 (?X_A BUZZ.V))
			(!R3 (?X_A SOUND.N))
			(!R4 (?X_E AGENT.N))
			(!R5 (?X_D (PERTAIN-TO ?X_E)))
			(!R6 (?X_H AGENT.N))
		)
		(:STEPS
			(?X_C (?X_D (HEAR.V ?X_A)))
			(?X_G (?X_E GO.V))
			(?X_J (?X_H (HEAR.V (K NOTHING.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_G)))
			(!W2 (?X_C (BEFORE ?X_J)))
			(!W3 (?X_G (BEFORE ?X_J)))
		)
	)
	(
			"A agent sees a bird has two legs has X_J and X_K has wings on X_M can."
			"A bird has two legs has X_J and X_K has wings on X_M flies can."
			"A bird has two legs has X_J and X_K has wings on X_M flies can over a tall tree."
			"A bird has two legs has X_J and X_K has wings on X_M sings."
	)
)



(
	(EPI-SCHEMA (((K SUSIE.N)
	              (COMPOSITE-SCHEMA-251.PR (KE (?X_F HOUSE.N))
	               (K (TO.P (?X_F HOUSE.N))) (K SUSIE.N)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F SISTER.N))
			(!R2 (?X_F (PERTAIN-TO (K SUSIE.N))))
			(!R3 (?X_G YELL.V))
		)
		(:STEPS
			(?X_E ((K SUSIE.N) (TO.P (KE (?X_F HOUSE.N)))))
			(?X_A ((K SUSIE.N) (GO.V (K (TO.P (?X_F HOUSE.N))))))
			(?X_B (?X_G ((MUCH.ADV FOR.P) (K SUSIE.N))))
			(?X_C (?X_G TO.P))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_A)))
			(!W2 (?X_E (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_C)))
			(!W4 (?X_A (BEFORE ?X_B)))
			(!W5 (?X_A (BEFORE ?X_C)))
			(!W6 (?X_B (BEFORE ?X_C)))
		)
	)
	(
			"A wife of a agent hears a buzz sound."
			"A agent goes."
			"A agent hears nothing."
	)
)



(
	(EPI-SCHEMA ((?X_A (((ADV-A (IN.P ?X_C)) PUT.9.V) ?X_B)) ** ?X_D)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_C CONTAINER.N))
			(!R4 (NOT (?X_C AGENT.N)))
			(!R5 (?X_B SMALLER-THAN ?X_C))
			(!R6 (?X_C GRAVE.N))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
			(!R8 (?X_B (K DEAD.A) DOG.N))
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
			(?X_D (?X_A ((ADV-A (INTO.P ?X_C)) PUT.9.V) ?X_B))
			(?X_D (?X_A ((ADV-A (INSIDE.P ?X_C)) PUT.9.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (SAME-TIME ?X_G)))
			(!W2 (?X_D (RIGHT-AFTER ?X_E)))
			(!W3 (?X_F (BEFORE ?X_G)))
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-252.PR ?X_L ?X_E ?X_M)) ** ?E)
		(:ROLES
			(!R1 (?X_E TREE.N))
			(!R2 (?X_M (K DEAD.A) DOG.N))
			(!R3 (?X_L GRAVE.N))
			(!R4 (?X_N MAN.N))
			(!R5 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_K (?X_N (DIG.V ?X_L)))
			(?X_I (?X_N (PUT.V ?X_M ?X_L)))
			(?X_G (?X_N ((IN.PRT ((ADV-A (WITH.P (K DIRT.N))) FILL.V)) ?X_L)))
			(?X_D
	   (?X_N
	    (((ADV-A (ON.P (K (L X (AND (X TOP.N) (X (OF.P ?X_L))))))) PLANT.V) ?X_E)))
			(?X_B (?X_N (((ADV-A (IN.P ?X_L)) PUT.9.V) ?X_M)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_G)))
			(!W2 (?X_K (BEFORE ?X_D)))
			(!W3 (?X_I (BEFORE ?X_B)))
			(!W4 (?X_G (BEFORE ?X_D)))
		)
	)
	(
			"Susie is to."
			"Susie goes to a sister of susie house."
			"A yell is much for."
			"A yell is to."
	)
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-253.PR ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_F WHOLE.A))
			(!R2 (?X_F PARTY.N))
			(!R3 (?X_I PHONE.N))
			(!R4 (?X_I (PERTAIN-TO ?X_J)))
		)
		(:STEPS
			(?X_C (?X_J ((ADV-A (AT.P ?X_F)) BE.V)))
			(?X_E (?X_J ((THEN.ADV LOSE.V) ?X_I)))
			(?X_A (?X_J ((THEN.ADV LOSE.V) ?X_I)))
			(?X_H (?X_F STOP.V))
			(?X_L ((K (PLUR PERSON.N)) (FIND.V ?X_I)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_A)))
			(!W3 (?X_C (BEFORE ?X_H)))
			(!W4 (?X_C (BEFORE ?X_L)))
			(!W5 (?X_E (BEFORE ?X_A)))
			(!W6 (?X_E (BEFORE ?X_H)))
			(!W7 (?X_E (BEFORE ?X_L)))
			(!W8 (?X_A (BEFORE ?X_H)))
			(!W9 (?X_A (BEFORE ?X_L)))
			(!W10 (?X_H (BEFORE ?X_L)))
		)
	)
	(
			"A man digs a grave."
			"A man puts a of a man a grave."
			"A man fills a grave in with dirt."
			"A man plants a tree on top of."
			"A man put.195s a of a man in a grave."
	)
)



(
	(EPI-SCHEMA ((?X_G
	              (COMPOSITE-SCHEMA-254.PR (KE (?X_J (PASV UNPLUG.V)))
	               (K (THAT.P (?X_J (PASV UNPLUG.V)))) ?X_J
	               (KE ((K WIND.N) (IN.P ?X_K)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2 (?X_J FAN.N))
			(!R3 (?X_K ROOM.N))
		)
		(:STEPS
			(?X_B (?X_G ((ON.PRT TURN.V) ?X_J)))
			(?X_D (?X_G (THAT.P (KE (?X_J (PASV UNPLUG.V))))))
			(?X_F (?X_G (SEE.V (K (THAT.P (?X_J (PASV UNPLUG.V)))))))
			(?X_I (?X_G (((ADV (BACK.ADV IN.A)) PLUG.V) ?X_J)))
			(?X_M (?X_J (BLOW.V (KE ((K WIND.N) (IN.P ?X_K))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_D)))
			(!W2 (?X_B (BEFORE ?X_F)))
			(!W3 (?X_B (BEFORE ?X_I)))
			(!W4 (?X_B (BEFORE ?X_M)))
			(!W5 (?X_D (BEFORE ?X_F)))
			(!W6 (?X_D (BEFORE ?X_I)))
			(!W7 (?X_D (BEFORE ?X_M)))
			(!W8 (?X_F (BEFORE ?X_I)))
			(!W9 (?X_F (BEFORE ?X_M)))
			(!W10 (?X_I (BEFORE ?X_M)))
		)
	)
	(
			"X_J is at a whole party."
			"X_J loses a phone of X_J then."
			"X_J loses a phone of X_J then."
			"A whole party stops."
			"Persons find a phone of X_J."
	)
)



(
	(EPI-SCHEMA ((?X_E (((ADV-A (FROM.P ?X_A)) EAT.13.V) ?F)) ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?F FOOD.N))
			(!R3 (?X_A HAND.N))
			(!R4 (?X_E (PLUR RABBIT.N)))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_E (PERTAIN-TO ?X_B)))
			(!R7 (?X_B AGENT.N))
			(!R8 (?X_C (PERTAIN-TO ?X_B)))
			(!R9 (?X_C PAPA.N))
			(!R10 (?X_D (PERTAIN-TO ?X_C)))
			(!R11 (?X_D (K DEAR.A) PAPA.N))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (NOT (?X_E HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_E HAVE.V ?F))
			(?I2 (?X_E HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (HAVE.V ?F))))
			(?P2 (NOT (?X_E HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_F))
			(!W2 (?I1 BEFORE ?X_F))
			(!W3 (?X_F CAUSE-OF ?P1))
			(!W4 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_E (((ADV-A (FROM.P ?X_A)) EAT.14.V) ?F)) ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?F FOOD.N))
			(!R3 (?X_E (PLUR RABBIT.N)))
			(!R4 (?X_A HAND.N))
			(!R5 (?X_B AGENT.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_E (PERTAIN-TO ?X_B)))
			(!R8 (?X_D (PERTAIN-TO ?X_B)))
			(!R9 (?X_D PAPA.N))
			(!R10 (?X_C (K DEAR.A) PAPA.N))
			(!R11 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_E (WANT.V (THAT (NOT (?X_E HUNGRY.A))))))
		)
		(:PRECONDS
			(?I1 (?X_E HAVE.V ?F))
			(?I2 (?X_E HUNGRY.A))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_E (HAVE.V ?F))))
			(?P2 (NOT (?X_E HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_F))
			(!W2 (?I1 BEFORE ?X_F))
			(!W3 (?X_F CAUSE-OF ?P1))
			(!W4 (?X_F (AT-ABOUT ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D FEED.4.V ?X_E ?F) ** ?E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E AGENT.N))
			(!R3 (?F FOOD.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (NOT (?X_E = ?F)))
			(!R6 (NOT (?X_D = ?F)))
			(!R7 (?X_C HAND.N))
			(!R8 (?X_E (PLUR RABBIT.N)))
			(!R9 (?X_E (PERTAIN-TO ?X_D)))
			(!R10 (?X_C (PERTAIN-TO ?X_D)))
			(!R11 (?X_A PAPA.N))
			(!R12 (?X_A (PERTAIN-TO ?X_D)))
			(!R13 (?X_B (PERTAIN-TO ?X_A)))
			(!R14 (?X_B (K DEAR.A) PAPA.N))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (NOT (?X_E HUNGRY.A))))))
			(?G2 (?X_D (WANT.V (THAT (?X_E (((ADV-A (FROM.P ?X_C)) EAT.V) ?F))))))
		)
		(:PRECONDS
			(?I1 (?X_D HAVE.V ?F))
			(?I2 (?X_E HUNGRY.A))
		)
		(:STEPS
			(?X_F (?X_E (((ADV-A (FROM.P ?X_C)) EAT.V) ?F)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (HAVE.V ?F))))
			(?P2 (NOT (?X_E HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F AFTER ?E))
			(!W2 (?X_F (AT-ABOUT ?X_G)))
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
	(EPI-SCHEMA ((?X_D FEED.5.V ?X_E ?F) ** ?E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_E AGENT.N))
			(!R3 (?F FOOD.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (NOT (?X_E = ?F)))
			(!R6 (NOT (?X_D = ?F)))
			(!R7 (?X_E (PLUR RABBIT.N)))
			(!R8 (?X_C HAND.N))
			(!R9 (?X_E (PERTAIN-TO ?X_D)))
			(!R10 (?X_C (PERTAIN-TO ?X_D)))
			(!R11 (?X_B (PERTAIN-TO ?X_D)))
			(!R12 (?X_B PAPA.N))
			(!R13 (?X_A (K DEAR.A) PAPA.N))
			(!R14 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (NOT (?X_E HUNGRY.A))))))
			(?G2 (?X_D (WANT.V (THAT (?X_E (((ADV-A (FROM.P ?X_C)) EAT.V) ?F))))))
		)
		(:PRECONDS
			(?I1 (?X_D HAVE.V ?F))
			(?I2 (?X_E HUNGRY.A))
		)
		(:STEPS
			(?X_F (?X_E (((ADV-A (FROM.P ?X_C)) EAT.V) ?F)))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_D (HAVE.V ?F))))
			(?P2 (NOT (?X_E HUNGRY.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F AFTER ?E))
			(!W2 (?X_F (AT-ABOUT ?X_G)))
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-255.PR ?X_N
	               (TWO.D (L X (AND (X PRETTY.A) (X (PLUR RABBIT.N))))) ?X_B ?X_O
	               ?X_M ?F))
	             ** ?E)
		(:ROLES
			(!R1 (?X_O (K DEAR.A) PAPA.N))
			(!R2 (?X_G LITTLE.A))
			(!R3 (?X_G HOUSE.N))
			(!R4 (?X_L HAND.N))
			(!R5 (?X_M (PLUR RABBIT.N)))
			(!R6 (?X_N AGENT.N))
			(!R7 (?X_L (PERTAIN-TO ?X_N)))
			(!R8 (?X_M (PERTAIN-TO ?X_N)))
			(!R9 (?X_P PAPA.N))
			(!R10 (?X_P (PERTAIN-TO ?X_N)))
			(!R11 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_K
	   (?X_P (GIVE.V ?X_N (TWO.D (L X (AND (X PRETTY.A) (X (PLUR RABBIT.N))))))))
			(?E_1 (?X_N FEED.4.V ?X_M ?F))
			(?E_2 (?X_N FEED.5.V ?X_M ?F))
			(?X_I (?X_M (((ADV-A (FROM.P ?X_L)) EAT.13.V) ?F)))
			(?X_I (?X_M (((ADV-A (FROM.P ?X_L)) EAT.14.V) ?F)))
			(?X_F (?X_N ((SHALL.AUX ((ADV-A (IN.P ?X_G)) KEEP.V)) ?X_B)))
			(?X_D (?X_N (LOVE.V ?X_O)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_F)))
			(!W3 (?X_K (BEFORE ?X_D)))
			(!W4 (?E_1 (BEFORE ?X_I)))
			(!W5 (?E_1 (BEFORE ?X_F)))
			(!W6 (?E_1 (BEFORE ?X_D)))
			(!W7 (?E_2 (BEFORE ?X_I)))
			(!W8 (?E_2 (BEFORE ?X_F)))
			(!W9 (?E_2 (BEFORE ?X_D)))
			(!W10 (?X_I (BEFORE ?X_F)))
			(!W11 (?X_I (BEFORE ?X_D)))
			(!W12 (?X_F (BEFORE ?X_D)))
		)
	)
	(
			"A agent turns a fan on."
			"A agent is that."
			"A agent sees that a fan PASV unplugs."
			"A agent plugs a fan ADV back in."
			"A fan blows wind in a room."
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?X_B)) MOVE.1.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_B CITY.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?X_B = ?L2)))
			(!R5 (?X_A HOMETOWN.N))
			(!R6 (?X_A (PERTAIN-TO ?X_C)))
			(!R7 (?X_B NEW.A))
			(!R8 (?L2 HOME.N))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) MOVE.1.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?X_B)) ((ADV-A (DESTINATION_PREP.? ?L2)) MOVE.1.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) MOVE.1.V) ?L2))
			(?X_D (?X_C (BACK.ADV MOVE.1.V)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) MOVE.2.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C CITY.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C DESTINATION.N))
			(!R6 (?X_C NEW.A))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_A HOMETOWN.N))
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
	   (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) MOVE.2.V))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) MOVE.2.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) MOVE.2.V) ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? MOVE.2.V)))
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
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-256.PR ?L2 ?X_E)) ** ?E)
		(:ROLES
			(!R1 (?X_E NEW.A))
			(!R2 (?X_E CITY.N))
			(!R3 (?X_F HOMETOWN.N))
			(!R4 (?X_F (PERTAIN-TO ?X_G)))
		)
		(:STEPS
			(?X_D (?X_G ((ADV-A (FROM.P ?L1)) MOVE.2.V) ?X_E))
			(?X_B (?X_G ((ADV-A (FROM.P ?X_E)) MOVE.1.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
			"A papa of a agent gives a agent two pretty rabbit."
			"A agent feed.241s a rabbits of a agent F."
			"A agent feed.243s a rabbits of a agent F."
			"A rabbits of a agent eat.258 F from a hand of a agent."
			"A rabbits of a agent eat.259 F from a hand of a agent."
			"A agent keeps X_B shalls in a little house."
			"A agent loves a of a papa of a agent."
	)
)



))
; got 516 schemas (260 protoschema matches, 256 stories)
