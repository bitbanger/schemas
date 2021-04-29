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
	)
)



(
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.3.V (KA ((ADV-A (IN.P ?X_C)) PLAY.V))) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((KA ((ADV-A (IN.P ?X_C)) PLAY.V)) ACTION.N))
			(!R3 (?X_C SNOW.N))
			(!R4 (?X_A (PERTAIN-TO ?X_B)))
			(!R5 (?X_A HOUSE.N))
		)
		(:PRECONDS
			(?I1 (?X_B (THINK.V (THAT ((KA ((ADV-A (IN.P ?X_C)) PLAY.V)) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_D (?X_B (WANT.V (KA ((ADV-A (IN.P ?X_C)) PLAY.V)))))
			(?X_D (?X_B (LIKE.V (KA ((ADV-A (IN.P ?X_C)) PLAY.V)))))
			(?X_D (?X_B (LOVE.V (KA ((ADV-A (IN.P ?X_C)) PLAY.V)))))
			(?X_D (?X_B (ENJOY.V (KA ((ADV-A (IN.P ?X_C)) PLAY.V)))))
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
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.4.V ?Y ?A) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?Y AGENT.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_B SNOW.N))
			(!R5 (?X_A (PERTAIN-TO ?X_C)))
			(!R6 (?X_A HOUSE.N))
		)
		(:GOALS
			(?G1 (?X_C (WANT.V ?Y ?A)))
			(?G2 (?X_C (WANT.V (THAT (?X_C (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_C (ASK.V ?Y ?A)))
			(?E2 (?Y (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_D (?X_C (ASK.V ?Y ?A)))
			(?X_D (?X_C (TELL.V ?Y ?A)))
			(?X_D (?X_C (((ADV-A (IN.P ?X_B)) MAKE.V) ?Y ?A)))
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
	(EPI-SCHEMA ((?X_C PLAY.2.V) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?T TOY.N))
			(!R3 (NOT (?T AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A SNOWMAN.N))
			(!R7 (?X_B HOUSE.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
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
			(?X_D (?X_C ((ADV-A (WITH.P ?T)) PLAY.2.V)))
			(?X_D (?X_C PLAY.2.V ?G))
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
	(EPI-SCHEMA ((?X_D ((ADV-A (IN.P ?X_A)) PLAY.3.V)) ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?X_C TOY.N))
			(!R3 (NOT (?X_C AGENT.N)))
			(!R4 (?G GAME.N))
			(!R5 (NOT (?G AGENT.N)))
			(!R6 (?X_A SNOW.N))
			(!R7 (?X_B (PERTAIN-TO ?X_D)))
			(!R8 (?X_B HOUSE.N))
			(!R9 (?X_C SNOWMAN.N))
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
			(?X_E (?X_D ((ADV-A (WITH.P ?X_C)) PLAY.3.V)))
			(?X_E (?X_D PLAY.3.V ?G))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (IN.P ?X_A)) PLAY.4.V) ?O)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?X_A SNOW.N))
			(!R4 (?X_B (PERTAIN-TO ?X_C)))
			(!R5 (?X_B HOUSE.N))
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
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?X_C SNOWMAN.N))
			(!R4 (?X_A (PERTAIN-TO ?X_B)))
			(!R5 (?X_A HOUSE.N))
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
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-8.PR (KA ((ADV-A (IN.P ?X_J)) PLAY.V)) ?Y ?A ?O
	               ?X_L))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I HOUSE.N))
			(!R2 (?X_I (PERTAIN-TO ?X_K)))
			(!R3 ((KA ((ADV-A (IN.P ?X_J)) PLAY.V)) ACTION.N))
			(!R4 (?A ACTION.N))
			(!R5 (?Y AGENT.N))
			(!R6 (?X_J SNOW.N))
			(!R7 (NOT (?O AGENT.N)))
			(!R8 (?X_K AGENT.N))
			(!R9 (?X_L SNOWMAN.N))
			(!R10 (NOT (?X_L AGENT.N)))
		)
		(:STEPS
			(?X_H (?X_K ENJOY_ACTION.3.V (KA ((ADV-A (IN.P ?X_J)) PLAY.V))))
			(?X_F (?X_K (OUTSIDE.ADV GO.V)))
			(?X_D (?X_K REQUEST_ACTION.4.V ?Y ?A))
			(?X_D (?X_K ((ADV-A (IN.P ?X_J)) PLAY.3.V)))
			(?X_D (?X_K (((ADV-A (IN.P ?X_J)) PLAY.4.V) ?O)))
			(?X_B (?X_K PLAY.2.V))
			(?X_B (?X_K MAKE.1.V ?X_L))
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.5.V ?X_B ?A) ** ?X_C)
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.6.V ?X_C ?A) ** ?X_D)
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-10.PR (K CLOSER.A) ?L2 ?X_M ?X_N ?A ?X_O)) **
	             ?E)
		(:ROLES
			(!R1 (?X_C FOX.N))
			(!R2 (?X_L (PLUR WOOD.N)))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (?X_M AGENT.N))
			(!R5 (?A ACTION.N))
			(!R6 (?X_O FUNNY.A))
			(!R7 (?X_O SOUND.N))
			(!R8 (?X_N ANIMAL.N))
			(!R9 (NOT (?X_O AGENT.N)))
		)
		(:STEPS
			(?X_K (?X_M ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
			(?X_K (?X_M REQUEST_ACTION.5.V ?X_M ?A))
			(?X_K (?X_M REQUEST_ACTION.6.V ?X_N ?A))
			(?X_I (?X_M (HEAR.V ?X_N)))
			(?X_G (?X_N MAKE.2.V ?X_O))
			(?X_E (?X_M (GET.V (K CLOSER.A))))
			(?X_B (?X_N (OUT.PRT ((ADV-A (FOR.P (KA (BE.V ?X_C)))) TURN.V))))
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
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.1.V ?X_C ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?X_C BOY.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_D DESTINATION.N))
			(!R6 (?X_D MOM.N))
			(!R7 (?X_D (PERTAIN-TO ?X_C)))
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
			(?X_E (?X_B ((ADV-A (TO.P ?X_D)) TAKE.V) ?X_C))
			(?X_E (?X_B ((ADV-A (TO.P ?X_D)) CARRY.V) ?X_C))
			(?X_E (?X_B (((ADV-A (TO.P ?X_D)) BRING.V) ?X_C)))
			(?X_E (?X_B (LOCATION_ADV.? TAKE.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? CARRY.V) ?X_C))
			(?X_E (?X_B (LOCATION_ADV.? BRING.V) ?X_C))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?P1 POSTCOND-OF ?X_E))
			(!W3 (?X_E (SAME-TIME ?X_H)))
			(!W4 (?X_E (RIGHT-AFTER ?X_F)))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-13.PR ?L2 ?X_M ?X_L (K LOST.A))) ** ?E)
		(:ROLES
			(!R1 (?X_K MALE.A))
			(!R2 (?X_K AGENT.N))
			(!R3 (?X_L (PERTAIN-TO ?X_K)))
			(!R4 (NOT ((K LOST.A) AGENT.N)))
			(!R5 (NOT (?X_M = (K LOST.A))))
			(!R6 (?L2 DESTINATION.N))
			(!R7 (?X_L DESTINATION.N))
			(!R8 (?X_L MOM.N))
			(!R9 (?X_L (PERTAIN-TO ?X_M)))
			(!R10 (?X_M SMALLER-THAN.N ?X_N))
			(!R11 (?X_M BOY.N))
			(!R12 (?X_N MAN.N))
		)
		(:STEPS
			(?X_H (?X_M (TO.P ?X_L)))
			(?X_D (?X_N ?X_M (TO.P ?X_L)))
			(?X_J (?X_M GET.4.V (K LOST.A)))
			(?X_A (?X_M ((ADV-A (TO.P ?X_L)) CALL.V)))
			(?X_F (?X_M ((ADV-A (FROM.P ?L1)) RUN.1.V) ?L2))
			(?X_B (?X_N TRANSPORT_OBJECT.1.V ?X_M ?X_L))
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
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.2.V ?X_C ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C DOG.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_D DESTINATION.N))
			(!R6 (?X_D VET.N))
			(!R7 (?X_C (VERY.ADV OLD.A)))
			(!R8 (?X_C (PERTAIN-TO ?X_B)))
			(!R9 (?X_A (PERTAIN-TO ?X_C)))
			(!R10 (?X_A TIME.N))
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
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D DOG.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_A VET.N))
			(!R6 (?X_D (PERTAIN-TO ?X_C)))
			(!R7 (?X_D (VERY.ADV OLD.A)))
			(!R8 (?X_B TIME.N))
			(!R9 (?X_B (PERTAIN-TO ?X_D)))
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
	(EPI-SCHEMA (((ADV-E (DURING ?X_A)) (?X_D (GET.5.V (K SICK.A)))) ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (NOT ((K SICK.A) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = (K SICK.A))))
			(!R5 (?X_D (VERY.ADV OLD.A)))
			(!R6 (?X_A DAY.N))
			(!R7 (?X_D (PERTAIN-TO ?X_B)))
			(!R8 (?X_C TIME.N))
			(!R9 (?X_C (PERTAIN-TO ?X_D)))
		)
		(:GOALS
			(?G1 (?X_D (WANT.V (THAT (?X_D (HAVE.V (K SICK.A)))))))
		)
		(:PRECONDS
			(?I1 (NOT (?X_D HAVE.V (K SICK.A))))
			(?I2 (?X_D (AT.P ?L)))
			(?I3 ((K SICK.A) (AT.P ?L)))
		)
		(:POSTCONDS
			(?P1 (?X_D HAVE.V (K SICK.A)))
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
	(EPI-SCHEMA ((?X_B TELL.1.V ?X_C (THAT (?X_D (BE.V ?X_E)))) ** ?X_F)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C AGENT.N))
			(!R3 ((THAT (?X_D (BE.V ?X_E))) INFORMATION.N))
			(!R4 (NOT ((THAT (?X_D (BE.V ?X_E))) ACTION.N)))
			(!R5 (?X_E TIME.N))
			(!R6 (?X_B VET.N))
			(!R7 (?X_A (VERY.ADV OLD.A)))
			(!R8 (?X_A (PERTAIN-TO ?X_C)))
			(!R9 (?X_E (PERTAIN-TO ?X_A)))
			(!R10 (?X_A DOG.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_C (KNOW.V (THAT (?X_D (BE.V ?X_E)))))))))
		)
		(:POSTCONDS
			(?P1 (?X_C (KNOW.V (THAT (?X_D (BE.V ?X_E))))))
		)
		(:PARAPHRASES
			(?X_F (?X_B TELL.1.V ?X_C (THAT (?X_D (BE.V ?X_E)))))
			(?X_F (?X_B LET.V ?X_C (KA (KNOW.V (THAT (?X_D (BE.V ?X_E)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (AT-ABOUT ?X_H)))
			(!W2 (?X_G (AT-ABOUT ?X_H)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-15.PR ?X_M ?X_L ?I (K SICK.A) ?X_N
	               (THAT (?X_O (BE.V ?X_P)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_P (PERTAIN-TO ?X_L)))
			(!R2 (?X_K DAY.N))
			(!R3 (NOT ((K SICK.A) AGENT.N)))
			(!R4 (NOT (?X_L = (K SICK.A))))
			(!R5 (?X_M DESTINATION.N))
			(!R6 (?X_L SMALLER-THAN.N ?X_N))
			(!R7 (NOT (?I ACTION.N)))
			(!R8 (?X_L DOG.N))
			(!R9 (?X_L (PERTAIN-TO ?X_N)))
			(!R10 (?X_L (VERY.ADV OLD.A)))
			(!R11 (?I INFORMATION.N))
			(!R12 ((THAT (?X_O (BE.V ?X_P))) INFORMATION.N))
			(!R13 (?X_P TIME.N))
			(!R14 (?X_M AGENT.N))
			(!R15 (?X_M VET.N))
			(!R16 (?X_N AGENT.N))
			(!R17 (NOT ((THAT (?X_O (BE.V ?X_P))) ACTION.N)))
		)
		(:STEPS
			(?X_J ((ADV-E (DURING ?X_K)) (?X_L (GET.5.V (K SICK.A)))))
			(?X_H (?X_N TRANSPORT_OBJECT.2.V ?X_L ?X_M))
			(?X_H (?X_N (((ADV-A (TO.P ?X_M)) INFORM.3.V) ?X_L ?I)))
			(?X_D (?X_M (TELL.V ?X_N (THAT (?X_O (BE.V ?X_P))))))
			(?X_F (?X_M TELL.1.V ?X_N (THAT (?X_O (BE.V ?X_P)))))
			(?X_B (?X_N ((SADLY.ADV (DOWN.ADV PUT.V)) ?X_L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_D)))
			(!W3 (?X_J (BEFORE ?X_F)))
			(!W4 (?X_H (BEFORE ?X_D)))
			(!W5 (?X_H (BEFORE ?X_F)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) RUN.2.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B KITTEN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B (PERTAIN-TO ?X_A)))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.2.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.2.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.2.V) ?L2))
			(?X_C (?X_B (AWAY.PRT ((ADV-A (WITHIN.P (K (PLUR DAY.N)))) RUN.2.V))))
			(?X_C (?X_B RUN.2.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? RUN.2.V)))
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
	(EPI-SCHEMA ((?X_B GET.6.V (ANOTHER.D CAT.N)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((ANOTHER.D CAT.N) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (ANOTHER.D CAT.N))))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A KITTEN.N))
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
	(EPI-SCHEMA ((?X_A GET.7.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_B (PERTAIN-TO ?X_A)))
			(!R6 (?X_B KITTEN.N))
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
			(!R1 (?X_I (PERTAIN-TO ?X_J)))
			(!R2 (NOT (?X_J = ?X_I)))
			(!R3 (?X_I KITTEN.N))
			(!R4 (?L2 DESTINATION.N))
			(!R5 (?X_J AGENT.N))
			(!R6 (NOT ((ANOTHER.D CAT.N) AGENT.N)))
			(!R7 (NOT (?X_J = (ANOTHER.D CAT.N))))
		)
		(:STEPS
			(?X_H (?X_J GET.7.V ?X_I))
			(?X_F (?X_I ((ADV-A (FROM.P ?L1)) RUN.2.V) ?L2))
			(?X_D (?X_J ((NEVER.ADV FIND.V) ?X_I)))
			(?X_B (?X_J GET.6.V (ANOTHER.D CAT.N)))
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
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.3.V ?X_C ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?X_C ENTITY.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_D DESTINATION.N))
			(!R6 (?X_D SHOP.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_A (PLUR FRIEND.N)))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (TO.P ?X_A)) INFORM.4.V) ?X_D ?I)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?X_D AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_A SHOP.N))
			(!R6 (?X_B (PERTAIN-TO ?X_C)))
			(!R7 (?X_B (PLUR FRIEND.N)))
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
	(EPI-SCHEMA ((?X_B INFORM.5.V (K BLUE.A) ?I) ** ?X_C)
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
	(EPI-SCHEMA ((?X_C (((ADV-A (TO.P ?X_A)) TAKE.1.V) ?X_D)) ** ?X_E)
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-19.PR ?X_J
	               (K (L X (AND (X (PASV PAINT.V)) (X BLUE.A)))) ?X_L (K BLUE.A) ?I
	               ?X_M))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J NEW.A))
			(!R2 (?X_J CAR.N))
			(!R3 (?X_J COLOR.N))
			(!R4 (?X_K (PERTAIN-TO ?X_N)))
			(!R5 (?X_K (PLUR FRIEND.N)))
			(!R6 ((K BLUE.A) AGENT.N))
			(!R7 (?X_M SMALLER-THAN.N ?X_N))
			(!R8 (?X_L DESTINATION.N))
			(!R9 (NOT (?I ACTION.N)))
			(!R10 (?I INFORMATION.N))
			(!R11 (?X_L SHOP.N))
			(!R12 (NOT (?X_N = ?X_M)))
			(!R13 (?X_N MAN.N))
		)
		(:STEPS
			(?X_I (?X_N (WANT.V ?X_J)))
			(?X_G (?X_K INFORM.5.V (K BLUE.A) ?I))
			(?X_E (?X_N TRANSPORT_OBJECT.3.V ?X_M ?X_L))
			(?X_E (?X_N (((ADV-A (TO.P ?X_L)) INFORM.4.V) ?X_M ?I)))
			(?X_E (?X_N (((ADV-A (TO.P ?X_L)) TAKE.1.V) ?X_M)))
			(?X_C (?X_M (GET.V (K (L X (AND (X (PASV PAINT.V)) (X BLUE.A)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_C)))
			(!W2 (?X_G (BEFORE ?X_E)))
		)
	)
	(
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
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.3.V)
	              (KA ((ADV-A (FOR.P ?X_D)) LOOK.V)))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA ((ADV-A (FOR.P ?X_D)) LOOK.V)) DESTINATION.N))
			(!R4 (NOT (?L1 = (KA ((ADV-A (FOR.P ?X_D)) LOOK.V)))))
			(!R5 ((ADV-E (DURING ?X_A)) (?X_D GONE.A)))
			(!R6 (?X_D (PLUR CLOTHE.N)))
			(!R7 (?X_A NEXT.A))
			(!R8 (?X_A DAY.N))
			(!R9 (?X_B WIFE.N))
			(!R10 (?X_B (PERTAIN-TO ?X_C)))
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
		(:PARAPHRASES
			(?X_E
	   (?X_C
	    ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
	     ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_D)) LOOK.V)))) GO.3.V))))
			(?X_E
	   (?X_C
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
	      GO.3.V))))
			(?X_E
	   (?X_C
	    ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (FOR.P ?X_D)) LOOK.V)))) GO.3.V)
	    (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
			(?X_E (?X_C GO.3.V))
			(?X_E (?X_C GO.3.V (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
			(?X_E (?X_C (LOCATION_ADV.? GO.3.V)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.4.V)
	              (KA ((ADV-A (FOR.P ?X_D)) LOOK.V)))
	             ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA ((ADV-A (FOR.P ?X_D)) LOOK.V)) DESTINATION.N))
			(!R4 (NOT (?L1 = (KA ((ADV-A (FOR.P ?X_D)) LOOK.V)))))
			(!R5 ((ADV-E (DURING ?X_B)) (?X_D GONE.A)))
			(!R6 (?X_D (PLUR CLOTHE.N)))
			(!R7 (?X_A (PERTAIN-TO ?X_C)))
			(!R8 (?X_A WIFE.N))
			(!R9 (?X_B DAY.N))
			(!R10 (?X_B NEXT.A))
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
		(:PARAPHRASES
			(?X_E
	   (?X_C
	    ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
	     ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_D)) LOOK.V)))) GO.4.V))))
			(?X_E
	   (?X_C
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
	      GO.4.V))))
			(?X_E
	   (?X_C
	    ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (FOR.P ?X_D)) LOOK.V)))) GO.4.V)
	    (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
			(?X_E (?X_C GO.4.V))
			(?X_E (?X_C GO.4.V (KA ((ADV-A (FOR.P ?X_D)) LOOK.V))))
			(?X_E (?X_C (LOCATION_ADV.? GO.4.V)))
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-21.PR ?X_M (KA ((ADV-A (FOR.P ?X_M)) LOOK.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J WIFE.N))
			(!R2 ((ADV-E (DURING ?X_K)) (?X_M GONE.A)))
			(!R3 (?X_J (PERTAIN-TO ?X_L)))
			(!R4 (?X_K DAY.N))
			(!R5 (?X_K NEXT.A))
			(!R6 ((KA ((ADV-A (FOR.P ?X_M)) LOOK.V)) DESTINATION.N))
			(!R7 (?X_L MAN.N))
			(!R8 (?X_M (PLUR CLOTHE.N)))
		)
		(:STEPS
			(?X_I (?X_L (FOLD.V ?X_M)))
			(?X_G (?X_L ((AWAY.ADV PUT.V) ?X_M)))
			(?X_C (?X_J (REFOLD.V ?X_M)))
			(?X_E
	   (?X_L ((ADV-A (FROM.P ?L1)) GO.3.V) (KA ((ADV-A (FOR.P ?X_M)) LOOK.V))))
			(?X_E
	   (?X_L ((ADV-A (FROM.P ?L1)) GO.4.V) (KA ((ADV-A (FOR.P ?X_M)) LOOK.V))))
			(?X_A (?X_J (REFOLD.V ?X_M)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_G)))
			(!W2 (?X_I (BEFORE ?X_E)))
			(!W3 (?X_I (BEFORE ?X_A)))
			(!W4 (?X_G (BEFORE ?X_E)))
			(!W5 (?X_G (BEFORE ?X_A)))
			(!W6 (?X_C (BEFORE ?X_A)))
			(!W7 (?X_E (BEFORE ?X_A)))
		)
	)
	(
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
	)
)



(
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-24.PR ?X_B)) ** ?E)
		(:ROLES
			(!R1 (?X_C ((ADV-A (FOR.P (K (PLUR YEAR.N)))) SAD.A)))
			(!R2 (?X_B CABIN.N))
			(!R3 (?X_B (NEAR.P ?X_A)))
			(!R4 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:STEPS
			(?X_E (?X_C (HAVE.V ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.4.V ?X_B ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B FROG.N))
			(!R3 (?X_B SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_B GIANT.A))
			(!R7 (?X_A (PLUR GIRL.N)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.5.V) ?X_B) ** ?X_C)
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.5.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.5.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.5.V) ?X_B))
			(?X_C (?X_A GO.5.V))
			(?X_C (?X_A GO.5.V ?X_B))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (IN.P ?X_C)) PUT.1.V) ?X_B)) ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_C BUCKET.N))
			(!R4 (NOT (?X_C AGENT.N)))
			(!R5 (?X_B SMALLER-THAN ?X_C))
			(!R6 (?X_B FROG.N))
			(!R7 (?X_B GIANT.A))
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
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-25.PR (K ((ADV-A (FOR.P ?X_C)) (WITH.P ?X_O))) ?L2
	               ?X_M ?X_N))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C MONTH.N))
			(!R2 (?X_M DESTINATION.N))
			(!R3 (?X_M POND.N))
			(!R4 (?X_N SMALLER-THAN.N ?X_O))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?L2 HOME.N))
			(!R7 (NOT (?X_O = ?X_N)))
			(!R8 (?X_P BUCKET.N))
			(!R9 (?X_N SMALLER-THAN ?X_P))
			(!R10 (?X_N FROG.N))
			(!R11 (?X_N GIANT.A))
			(!R12 (?X_O (PLUR GIRL.N)))
			(!R13 (NOT (?X_P AGENT.N)))
		)
		(:STEPS
			(?X_L (?X_O ((ADV-A (FROM.P ?L1)) GO.5.V) ?X_M))
			(?X_J (?X_O (CATCH.V ?X_N)))
			(?X_H (?X_O TRANSPORT_OBJECT.4.V ?X_N ?L2))
			(?X_H (?X_O (((ADV-A (AT.P ?X_F)) TAKE.2.V) ?X_N)))
			(?X_E (?X_O (((ADV-A (IN.P ?X_P)) PUT.1.V) ?X_N)))
			(?X_B (?X_N (LIVE.V (K ((ADV-A (FOR.P ?X_C)) (WITH.P ?X_O))))))
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
	(EPI-SCHEMA ((?X_B ((TOGETHER.ADV GET.8.V) ?X_C)) ** ?X_D)
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
			(?X_I (?X_R ((TOGETHER.ADV GET.9.V) ?X_Q)))
			(?X_D (?X_R ((TOGETHER.ADV GET.8.V) ?X_Q)))
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
	)
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-32.PR (KA ((ADV-A (TO.P ?X_A)) GO.V)))) ** ?E)
		(:ROLES
			(!R1 (?X_A BEACH.N))
			(!R2 (?X_D WATER.N))
			(!R3 (?X_G GOOD.A))
			(!R4 (?X_G DAY.N))
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?X_A)) GO.6.V) (K (VERY.ADV HIGH.A))) **
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? (K (VERY.ADV HIGH.A)))) GO.6.V)))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?X_A))
	     ((ADV-A (DESTINATION_PREP.? (K (VERY.ADV HIGH.A)))) GO.6.V))))
			(?X_C
	   (?X_B ((ADV-A (DESTINATION_PREP.? (K (VERY.ADV HIGH.A)))) GO.6.V)
	    (K (VERY.ADV HIGH.A))))
			(?X_C (?X_B GO.6.V))
			(?X_C (?X_B GO.6.V (K (VERY.ADV HIGH.A))))
			(?X_C (?X_B (LOCATION_ADV.? GO.6.V)))
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
			(?X_E (?X_I ((ADV-A (FROM.P ?X_J)) GO.6.V) (K (VERY.ADV HIGH.A))))
			(?X_C (?X_I (HAVE.V (K (L X (AND (X MUCH.A) (X FUN.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
			(!W2 (?X_G (BEFORE ?X_C)))
			(!W3 (?X_E (BEFORE ?X_C)))
		)
	)
	(
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
	)
)



(
	(EPI-SCHEMA ((?X_A GET.10.V (K (BACK.ADV (IN.P ?X_B)))) ** ?X_C)
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
			(?X_B (?X_O ((OUT.PRT GET.11.V) ?O)))
			(?X_D (?X_O GET.10.V (K (BACK.ADV (IN.P ?X_P)))))
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
	              (((ADV-A (IN.P ?X_A)) GET.12.V)
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
	    (((ADV-A (IN.P ?X_S)) GET.12.V) (K ((ADV (FAR.ADV OUT.A)) (ON.P ?X_U))))))
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
			(!R6 ((ADV-E (DURING ?X_B)) (?X_A (OUT.ADV IS.V))))
			(!R7 (?X_A ((CANNOT.ADV CATCH.V) ?X_C)))
			(!R8 (?X_C (PERTAIN-TO ?X_A)))
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
			(!R9 ((ADV-E (DURING ?X_A)) (?X_B (OUT.ADV IS.V))))
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
	(EPI-SCHEMA ((?X_B GET.13.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C NEW.A))
			(!R6 (?X_C DOG.N))
			(!R7 ((ADV-E (DURING ?X_A)) (?X_B (OUT.ADV IS.V))))
			(!R8 (?X_B ((CANNOT.ADV CATCH.V) ?X_C)))
			(!R9 (?X_C (PERTAIN-TO ?X_B)))
			(!R10 (?X_A (WALK.V ?X_C)))
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
			(!R2 (?X_H (WALK.V ?X_J)))
			(!R3 ((ADV-E (DURING ?X_H)) (?X_I (OUT.ADV IS.V))))
			(!R4 (?X_I AGENT.N))
			(!R5 (?X_I ((CANNOT.ADV CATCH.V) ?X_J)))
			(!R6 (?X_J (PERTAIN-TO ?X_I)))
			(!R7 (NOT (?X_I = ?X_J)))
			(!R8 (?X_J NEW.A))
			(!R9 (?X_J DOG.N))
			(!R10 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_G (?X_I GET.13.V ?X_J))
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
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.7.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.7.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.7.V) ?X_B))
			(?X_C (?X_A GO.7.V))
			(?X_C (?X_A GO.7.V ?X_B))
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
			(?X_G (?X_I ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_H))
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
	)
)



(
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-44.PR ?X_C ?X_H)) ** ?E)
		(:ROLES
			(!R1 (?X_D AFRAID.A))
			(!R2 (?X_D (OF.P (K (PLUR SPIDER.N)))))
			(!R3 (?X_B (PERTAIN-TO ?X_D)))
			(!R4 (?X_C MOTHER.N))
			(!R5 (?X_C (PERTAIN-TO ?X_D)))
			(!R6 (?X_G AGENT.N))
			(!R7 (?X_H BIG.A))
			(!R8 (?X_H SPIDER.N))
		)
		(:STEPS
			(?X_A (?X_D (CALL.V ?X_C)))
			(?X_F (?X_D (CALL.V ?X_C)))
			(?X_J (?X_G (SEE.V ?X_H)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_F)))
			(!W2 (?X_A (BEFORE ?X_J)))
			(!W3 (?X_F (BEFORE ?X_J)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.5.V ?O ?X_B) ** ?X_C)
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.8.V) (KA SLEEP.V)) ** ?X_B)
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
	     (BACK.ADV ((ADV-A (FOR.P (KA SLEEP.V))) GO.8.V)))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (KA SLEEP.V))) GO.8.V))))
			(?X_B
	   (?X_A ((ADV-A (DESTINATION_PREP.? (KA SLEEP.V))) GO.8.V) (KA SLEEP.V)))
			(?X_B (?X_A GO.8.V))
			(?X_B (?X_A GO.8.V (KA SLEEP.V)))
			(?X_B (?X_A (LOCATION_ADV.? GO.8.V)))
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
	              (COMPOSITE-SCHEMA-45.PR (THAT (?X_N HUNGRY.A)) (KE (?X_N HUNGRY.A))
	               ?O ?X_N (KA SLEEP.V)))
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
			(?X_J (?X_M TRANSPORT_OBJECT.5.V ?O ?X_N))
			(?X_J (?X_M ((ADV-A (FROM.P ?L1)) WALK.2.V) ?X_N))
			(?X_H (?X_M (SEE.V (THAT (?X_N HUNGRY.A)))))
			(?X_F (?X_M (THAT.P (KE (?X_N HUNGRY.A)))))
			(?X_D (?X_M (BREASTF.V ?X_N)))
			(?X_B (?X_N ((ADV-A (FROM.P ?L1)) GO.8.V) (KA SLEEP.V)))
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
	(EPI-SCHEMA ((?X_A GET.14.V (K MAD.A)) ** ?X_B)
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
			(?X_C (NOT (?X_E (LIKE.V ?X_S))))
			(?X_I (?X_Q (GIVE.5.V ?X_S ?X_R)))
			(?X_G (?X_S GET.14.V (K MAD.A)))
			(?X_A (NOT (?X_E (LIKE.V ?X_S))))
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
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.9.V) ?X_B) ** ?X_C)
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.9.V))))
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-48.PR (K CANDY.N) (K GREAT.A)
	               (K (L X (AND (X SOUR.A) (X CANDY.N)))) (FIVE.D (PLUR BAG.N))
	               ?X_M))
	             ** ?E)
		(:ROLES
			(!R1 (?X_L AGENT.N))
			(!R2 (?X_M DESTINATION.N))
			(!R3 (?X_M STORE.N))
		)
		(:STEPS
			(?X_K (?X_L ((ADV-A (FROM.P ?L1)) GO.9.V) ?X_M))
			(?X_I (?X_L (((ADV-A (ON.P (K SALE.N))) SEE.V) (K CANDY.N))))
			(?X_G ((K CANDY.N) (LOOK.V (K GREAT.A))))
			(?X_E (?X_L (GET.V (K (L X (AND (X SOUR.A) (X CANDY.N)))))))
			(?X_C (?X_L (GET.V (FIVE.D (PLUR BAG.N)))))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.10.V) ?X_B) ** ?X_C)
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
	    (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.10.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.10.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.10.V) ?X_B))
			(?X_C (?X_A GO.10.V))
			(?X_C (?X_A GO.10.V ?X_B))
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
			(?X_I (?X_K ((ADV-A (FROM.P ?L1)) GO.10.V) ?X_J))
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
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.11.V) (KA (INTRODUCE.V ?X_A))) **
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
	     ((ADV-A (FOR.P (KA (INTRODUCE.V ?X_A)))) GO.11.V))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (KA (INTRODUCE.V ?X_A)))) GO.11.V))))
			(?X_B
	   (?X_A ((ADV-A (DESTINATION_PREP.? (KA (INTRODUCE.V ?X_A)))) GO.11.V)
	    (KA (INTRODUCE.V ?X_A))))
			(?X_B (?X_A GO.11.V))
			(?X_B (?X_A GO.11.V (KA (INTRODUCE.V ?X_A))))
			(?X_B (?X_A (LOCATION_ADV.? GO.11.V)))
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
			(?X_F (?X_N ((ADV-A (FROM.P ?L1)) GO.11.V) (KA (INTRODUCE.V ?X_N))))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.12.V)
	              (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F))))))
	             ** ?X_G)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F))))) DESTINATION.N))
			(!R4 (NOT (?L1 = (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F))))))))
			(!R5 (?X_E HOUSE.N))
			(!R6 (?X_D HIKE.N))
			(!R7 (?X_F (PLUR WOOD.N)))
			(!R8 (?X_E (PERTAIN-TO ?X_B)))
			(!R9 (?X_B AGENT.N))
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
	     GO.12.V)))
			(?X_G
	   (?X_C
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A
	       (DESTINATION_PREP.?
	        (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F)))))))
	      GO.12.V))))
			(?X_G
	   (?X_C
	    ((ADV-A
	      (DESTINATION_PREP.? (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F)))))))
	     GO.12.V)
	    (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F)))))))
			(?X_G (?X_C GO.12.V))
			(?X_G (?X_C GO.12.V (K (IN.P (?X_D ((ADV-A (BY.P ?X_E)) (IN.P ?X_F)))))))
			(?X_G (?X_C (LOCATION_ADV.? GO.12.V)))
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
			(!R5 (?X_A AGENT.N))
			(!R6 (?X_C (PERTAIN-TO ?X_A)))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
			(!R8 (?X_B HOUSE.N))
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
			(!R6 (?X_A (PERTAIN-TO ?X_D)))
			(!R7 (?X_A HOUSE.N))
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
	(EPI-SCHEMA ((?X_D (((ADV-A (FROM.P ?X_A)) INFORM.6.V) ?X_E ?I)) ** ?X_F)
		(:ROLES
			(!R1 (?X_D BROTHER.N))
			(!R2 (?X_E AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_A TREE.N))
			(!R6 (?X_C AGENT.N))
			(!R7 (?X_D (PERTAIN-TO ?X_C)))
			(!R8 (?X_B HOUSE.N))
			(!R9 (?X_B (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (FROM.P ?X_A)) INFORM.7.V) ?X_D ?I)) ** ?X_E)
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
	(EPI-SCHEMA ((?X_O
	              (COMPOSITE-SCHEMA-53.PR (KE (?X_A (OF.P ?X_H))) ?X_O
	               (KA (DOWN.ADV GET.V)) ?L2
	               (K (IN.P (?X_K ((ADV-A (BY.P ?X_L)) (IN.P ?X_M))))) ?A ?X_N ?X_P
	               ?I))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H (VERY.ADV HIGH.A)))
			(!R2 (?X_H (PLUR TREE.N)))
			(!R3 (?X_L (PERTAIN-TO ?X_P)))
			(!R4 (?X_L HOUSE.N))
			(!R5 (?X_K HIKE.N))
			(!R6 ((K (IN.P (?X_K ((ADV-A (BY.P ?X_L)) (IN.P ?X_M))))) DESTINATION.N))
			(!R7 (?X_M (PLUR WOOD.N)))
			(!R8 (?X_Q LOCATION.N))
			(!R9 (NOT (?X_Q = ?L2)))
			(!R10 (?L2 DESTINATION.N))
			(!R11 (?A ACTION.N))
			(!R12 (?X_N AGENT.N))
			(!R13 (?X_P AGENT.N))
			(!R14 (?X_O BROTHER.N))
			(!R15 (?X_O (PERTAIN-TO ?X_P)))
			(!R16 (?X_Q TREE.N))
			(!R17 (NOT (?I ACTION.N)))
			(!R18 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_J
	   (?X_N ((ADV-A (FROM.P ?L1)) GO.12.V)
	    (K (IN.P (?X_K ((ADV-A (BY.P ?X_L)) (IN.P ?X_M)))))))
			(?X_G (?X_O (CLIMB.V (KE (?X_A (OF.P ?X_H))))))
			(?X_E (?X_N (TELL.V ?X_O (KA (DOWN.ADV GET.V)))))
			(?X_C (?X_O (((ADV-A (FROM.P ?X_Q)) FALL.2.V) ?L2)))
			(?X_C (?X_O REQUEST_ACTION.9.V ?X_N ?A))
			(?X_C (?X_O REQUEST_ACTION.10.V ?X_P ?A))
			(?X_C (?X_O (((ADV-A (FROM.P ?X_Q)) INFORM.6.V) ?X_N ?I)))
			(?X_C (?X_O (((ADV-A (FROM.P ?X_Q)) INFORM.7.V) ?X_P ?I)))
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
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.6.V ?X_C (KA (MAKE.V (K HONEY.N)))) **
	             ?X_D)
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
	              (((ADV-A (FOR.P (KA (MAKE.V (K HONEY.N))))) TAKE.3.V) ?X_C))
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
	               (KA (MAKE.V (K HONEY.N))) ?X_T))
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
			(?X_M (?X_S TRANSPORT_OBJECT.6.V ?X_T (KA (MAKE.V (K HONEY.N)))))
			(?X_M (?X_S (((ADV-A (FOR.P (KA (MAKE.V (K HONEY.N))))) TAKE.3.V) ?X_T)))
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
	)
)



(
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-61.PR ?X_D (KA SIT.V) ?X_H (KA HELP.V))) **
	             ?E)
		(:ROLES
			(!R1 (?X_A DAY.N))
			(!R2 (NOT (?X_D SIT.V)))
			(!R3 (?X_G NEW.A))
			(!R4 (?X_G TEACHER.N))
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
	)
)



(
	(EPI-SCHEMA ((?X_B GET.15.V ?X_C) ** ?X_D)
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
			(?X_Q (?X_S GET.15.V ?X_T))
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
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.13.V) ?X_B) ** ?X_C)
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
	    (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.13.V)))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.13.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.13.V) ?X_B))
			(?X_C (?X_A GO.13.V))
			(?X_C (?X_A GO.13.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.13.V)))
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
			(?X_B (?X_C ((ADV-A (FROM.P ?L1)) GO.13.V) ?X_D))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.14.V) (K CHURCH.N)) ** ?X_B)
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
	     ((ADV-A (TO.P (K CHURCH.N))) GO.14.V))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K CHURCH.N))) GO.14.V))))
			(?X_B
	   (?X_A ((ADV-A (DESTINATION_PREP.? (K CHURCH.N))) GO.14.V) (K CHURCH.N)))
			(?X_B (?X_A GO.14.V))
			(?X_B (?X_A GO.14.V (K CHURCH.N)))
			(?X_B (?X_A (LOCATION_ADV.? GO.14.V)))
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.14.V) (K CHURCH.N)) ** ?X_B)
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
	     ((ADV-A (TO.P (K CHURCH.N))) GO.14.V))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K CHURCH.N))) GO.14.V))))
			(?X_B
	   (?X_A ((ADV-A (DESTINATION_PREP.? (K CHURCH.N))) GO.14.V) (K CHURCH.N)))
			(?X_B (?X_A GO.14.V))
			(?X_B (?X_A GO.14.V (K CHURCH.N)))
			(?X_B (?X_A (LOCATION_ADV.? GO.14.V)))
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
			(?X_C (?X_Q ((ADV-A (FROM.P ?L1)) GO.14.V) (K CHURCH.N)))
			(?X_O (?X_Q (CARRY.V ?X_P)))
			(?X_D (?X_Q ((ADV-A (FROM.P ?L1)) GO.14.V) (K CHURCH.N)))
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
			(E205.SK (?X_J TAKE.4.V ?X_K))
		)
		(:EPISODE-RELATIONS
			(!W1 (E204.SK BEFORE ?X_C))
			(!W2 (?X_C BEFORE E205.SK))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) COME.2.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A (AT.P (K WORK.N))))
			(!R6 (?X_A DOOR.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) COME.2.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) COME.2.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) COME.2.V) ?L2))
			(?X_C (?X_B ((ADV-A (THROUGH.P ?X_A)) COME.2.V)))
			(?X_C (?X_B COME.2.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? COME.2.V)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) RUN.9.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.13.V ?X_B ?A) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?A ACTION.N))
			(!R3 (?X_A DOOR.N))
			(!R4 (?X_A (AT.P (K WORK.N))))
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.14.V ?X_B ?A) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?A ACTION.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V ?X_B ?A)))
			(?G2 (?X_B (WANT.V (THAT (?X_B (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_B ((ALMOST.ADV ((ADV-A (INTO.P ?X_A)) ASK.V)) ?X_B ?A)))
			(?E2 (?X_B (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_C (?X_B ((ALMOST.ADV ((ADV-A (INTO.P ?X_A)) ASK.V)) ?X_B ?A)))
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
	(EPI-SCHEMA ((?X_B (((ADV-A (THROUGH.P ?X_A)) INFORM.8.V) ?X_B ?I)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?I INFORMATION.N))
			(!R3 (NOT (?I ACTION.N)))
			(!R4 (?X_A (AT.P (K WORK.N))))
			(!R5 (?X_A DOOR.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_C (?X_B TELL.V ?X_B ?I))
			(?X_C (?X_B LET.V ?X_B (KA (KNOW.V ?I))))
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
	(EPI-SCHEMA ((?X_A
	              ((ALMOST.ADV ((ADV-A (INTO.P AMY.NAME)) INFORM.9.V)) ?X_A ?I))
	             ** ?X_B)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?I INFORMATION.N))
			(!R3 (NOT (?I ACTION.N)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT (?X_A (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_A (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_B (?X_A TELL.V ?X_A ?I))
			(?X_B (?X_A LET.V ?X_A (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (AT-ABOUT ?X_C)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-66.PR ?X_D ?L2 ?A ?X_J ?I)) ** ?E)
		(:ROLES
			(!R1 (?X_D PIECE.N))
			(!R2 (?X_D TWO.N))
			(!R3 (?X_D PURPLE.A))
			(!R4 (?X_I (AT.P (K WORK.N))))
			(!R5 (?X_I DOOR.N))
			(!R6 (?L2 DESTINATION.N))
			(!R7 (?A ACTION.N))
			(!R8 (?X_J AGENT.N))
			(!R9 (NOT (?I ACTION.N)))
			(!R10 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_H (?X_J ((ADV-A (FROM.P ?L1)) COME.2.V) ?L2))
			(?X_H (?X_J REQUEST_ACTION.13.V ?X_J ?A))
			(?X_H (?X_J (((ADV-A (THROUGH.P ?X_I)) INFORM.8.V) ?X_J ?I)))
			(?X_F (?X_J ((ADV-A (FROM.P ?L1)) RUN.9.V) ?L2))
			(?X_F (?X_J REQUEST_ACTION.14.V ?X_J ?A))
			(?X_F (?X_J ((ALMOST.ADV ((ADV-A (INTO.P ?X_A)) INFORM.9.V)) ?X_J ?I)))
			(?X_C (?X_A (WEAR.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_C)))
			(!W3 (?X_F (BEFORE ?X_C)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A ((OUT.PRT TAKE.5.V) ?X_B)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_A ((OUT.PRT TAKE.6.V) ?X_B)) ** ?X_C)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_A TIRED.A))
			(!R6 (?X_B (K WATER.N) BOTTLE.N))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
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
			(!R4 (?X_J MAN.N))
			(!R5 (?X_J TIRED.A))
			(!R6 (NOT (?X_K AGENT.N)))
			(!R7 (NOT (?X_J = ?X_K)))
		)
		(:STEPS
			(?X_H (?X_J (DOWN.ADV ((ADV-A (ON.P ?X_I)) SIT.V))))
			(?X_A (?X_J (OF.P (KA WALK.V))))
			(?X_F (?X_J ((OUT.PRT TAKE.5.V) ?X_K)))
			(?X_B (?X_J ((OUT.PRT TAKE.6.V) ?X_K)))
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
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.15.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B TODAY.N))
			(!R6 (?X_B STORE.N))
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
			(?X_C (?X_A GO.15.V))
			(?X_C (?X_A GO.15.V ?X_B))
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
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-68.PR ?X_E (SIX.D (PLUR DOLLAR.N)) ?X_I)) **
	             ?E)
		(:ROLES
			(!R1 (?X_E (PLUR CHIP.N)))
			(!R2 (?X_H AGENT.N))
			(!R3 (?X_I DESTINATION.N))
			(!R4 (?X_I TODAY.N))
			(!R5 (?X_I STORE.N))
		)
		(:STEPS
			(?X_G (?X_H ((ADV-A (FROM.P ?L1)) GO.15.V) ?X_I))
			(?X_D (?X_H (SEE.V ?X_E)))
			(?X_B (?X_E (BE.V (SIX.D (PLUR DOLLAR.N)))))
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
			(!R1 (?X_M SHOE.N))
			(!R2 (?X_M BOX.N))
			(!R3 (?X_N SMALLER-THAN ?X_M))
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
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.7.V (K (PLUR GROCERY.N)) ?L2) ** ?X_C)
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
	              (COMPOSITE-SCHEMA-70.PR ?X_L (K (PLUR GROCERY.N)) ?L2
	               (KE (?X_O ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_L BAG.N))
			(!R2 (?X_M GROUND.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (?L2 HOME.N))
			(!R5 ((K (PLUR GROCERY.N)) ENTITY.N))
			(!R6 ((K (PLUR GROCERY.N)) SMALLER-THAN.N ?X_N))
			(!R7 (?X_N MAN.N))
			(!R8 (?X_O WIFE.N))
			(!R9 (?X_O (PERTAIN-TO ?X_N)))
			(!R10
	   (NOT ((KE (?X_O ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N))) AGENT.N)))
		)
		(:STEPS
			(?X_K (?X_N (((ADV-A (ON.P ?X_M)) FIND.V) ?X_L)))
			(?X_I (?X_N (INSIDE.ADV LOOK.V)))
			(?X_G (?X_L (BE.V (K (PLUR GROCERY.N)))))
			(?X_C (?X_O ((ADV-A (WITH.P (K (PLUR GROCERY.N)))) DINNER.N)))
			(?X_E (?X_N TRANSPORT_OBJECT.7.V (K (PLUR GROCERY.N)) ?L2))
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
	)
)



(
	(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA-72.PR (TWO.D (PLUR DOG.N)))) ** ?E)
		(:ROLES
			(!R1 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:STEPS
			(?X_D (?X_B (HAVE.V (TWO.D (PLUR DOG.N)))))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.16.V) ?L2) ** ?X_C)
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.16.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.16.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.16.V) ?L2))
			(?X_C (?X_B ((ADV-A (WITH.P ?X_A)) GO.16.V)))
			(?X_C (?X_B GO.16.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? GO.16.V)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.17.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C LOCAL.A))
			(!R6 (?X_C POND.N))
			(!R7 (?X_A (PLUR FRIEND.N)))
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
	   ((ADV-E (DURING (K YESTERDAY.N)))
	    (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) GO.17.V)))))
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
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.8.V ?X_C (KA (EAT.V ?X_C))) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C FISH.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 ((KA (EAT.V ?X_C)) DESTINATION.N))
			(!R6 (?X_C LARGE.A))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_A (PLUR FRIEND.N)))
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
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-73.PR (K FISHING.N) ?L2 ?X_M ?X_O
	               (KA (EAT.V ?X_O)) (KA ((ADV-A (WITH.P ?X_L)) GO.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?L2 DESTINATION.N))
			(!R2 ((KA ((ADV-A (WITH.P ?X_L)) GO.V)) ACTION.N))
			(!R3 (?X_L (PERTAIN-TO ?X_N)))
			(!R4 (?X_L (PLUR FRIEND.N)))
			(!R5 (?X_M DESTINATION.N))
			(!R6 (?X_M LOCAL.A))
			(!R7 (?X_M POND.N))
			(!R8 ((KA (EAT.V ?X_O)) DESTINATION.N))
			(!R9 (?X_N AGENT.N))
			(!R10 (?X_O SMALLER-THAN.N ?X_N))
			(!R11 (?X_O FISH.N))
			(!R12 (?X_O LARGE.A))
		)
		(:STEPS
			(?X_K (?X_N (LOVE.V (K FISHING.N))))
			(?X_I (?X_N ((ADV-A (FROM.P ?L1)) GO.16.V) ?L2))
			(?X_A (?X_N ENJOY_ACTION.15.V (KA ((ADV-A (WITH.P ?X_L)) GO.V))))
			(?X_G (?X_N ((ADV-A (FROM.P ?L1)) GO.17.V) ?X_M))
			(?X_E (?X_N (CATCH.V ?X_O)))
			(?X_C (?X_N TRANSPORT_OBJECT.8.V ?X_O (KA (EAT.V ?X_O))))
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
			(!R6 (?X_B BABY.N))
			(!R7 (?X_B (SO.ADV TINY.A)))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-75.PR (KE (?X_L TURTLE.V)) ?X_L)) ** ?E)
		(:ROLES
			(!R1 (?X_C HOUR.N))
			(!R2 (?X_K BOX.N))
			(!R3 (NOT (?X_K AGENT.N)))
			(!R4 (?X_J AGENT.N))
			(!R5 (?X_L SMALLER-THAN ?X_K))
			(!R6 (?X_L BABY.N))
			(!R7 (?X_L (SO.ADV TINY.A)))
			(!R8 (?X_L COUPLE.N))
		)
		(:STEPS
			(?X_I (?X_L TURTLE.V))
			(?X_G (?X_J (FIND.V (KE (?X_L TURTLE.V)))))
			(?X_B (?X_J (((ADV-A (FOR.P ?X_C)) KEEP.V) ?X_L)))
			(?X_E (?X_J (((ADV-A (IN.P ?X_K)) PUT.4.V) ?X_L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_G)))
			(!W2 (?X_I (BEFORE ?X_B)))
			(!W3 (?X_G (BEFORE ?X_B)))
		)
	)
	(
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.9.V ?X_A ?A) ** ?X_B)
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
			(?X_B (?X_J REQUEST_ACTION.9.V ?X_J ?A))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_D)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.18.V) ?X_C) ** ?X_D)
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
	     (OUT.ADV ((ADV-A (FOR.P ?X_C)) GO.18.V)))))
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
	(EPI-SCHEMA ((?X_B INFORM.10.V ?X_C ?I) ** ?X_D)
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
			(?X_G (?X_L ((ADV-A (FROM.P ?L1)) GO.18.V) ?X_M))
			(?X_E (?X_L INFORM.10.V ?X_M ?I))
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
	)
)



(
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.17.V ?X_C ?A) ** ?X_D)
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
			(?X_H (?X_P REQUEST_ACTION.17.V ?X_P ?A))
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
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.9.V ?X_B ?X_C) ** ?X_D)
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
	(EPI-SCHEMA ((?X_A TAKE.7.V ?X_B) ** ?X_C)
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
	(EPI-SCHEMA ((?X_B (((ADV-A (TO.P ?X_A)) TAKE.8.V) ?X_C)) ** ?X_D)
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
	              (COMPOSITE-SCHEMA-79.PR (KE (?X_M SICK.A)) (K BETTER.A) ?X_K ?X_N
	               ?X_M))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K DESTINATION.N))
			(!R2 (?X_M SMALLER-THAN.N ?X_L))
			(!R3 (?X_K VET.N))
			(!R4 (?X_L MAN.N))
			(!R5 (NOT (?X_L = ?X_M)))
			(!R6 (?X_N MEDICINE.N))
			(!R7 (?X_M CAT.N))
			(!R8 (NOT (?X_M = ?X_N)))
		)
		(:STEPS
			(?X_J (?X_L TRANSPORT_OBJECT.9.V ?X_M ?X_K))
			(?X_J (?X_L (((ADV-A (TO.P ?X_K)) TAKE.8.V) ?X_M)))
			(?X_H (?X_K (CALL.V (KE (?X_M SICK.A)))))
			(?X_F (?X_L (GET.V ?X_N)))
			(?X_D (?X_M TAKE.7.V ?X_N))
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
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.10.V ?X_B ?L2) ** ?X_C)
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
	              (((ADV-A (AT.P ?X_F)) ((ADV-A (WITH.P ?X_A)) TAKE.9.V)) ?X_B))
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
	              (COMPOSITE-SCHEMA-80.PR ?X_B ?X_H ?L2 ?X_Q
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
			(!R10 (?L2 DESTINATION.N))
			(!R11 (?L2 HOME.N))
			(!R12 (?X_R AGENT.N))
			(!R13 (NOT (?X_S AGENT.N)))
			(!R14 (NOT (?X_R = ?X_S)))
		)
		(:STEPS
			(?X_L (?X_A (((ADV-A (TO.P ?X_Q)) GIVE.V) ?X_B)))
			(?X_J (?X_P (GIVE.6.V ?X_Q (TWO.D (L X (AND (X RED.A) (X (PLUR ONE.N))))))))
			(?X_C (?X_Q (KEEP.V ?X_H)))
			(?X_D (?X_G (LIKE.V ?X_S)))
			(?X_E (?X_R TRANSPORT_OBJECT.10.V ?X_S ?L2))
			(?X_E (?X_R (((ADV-A (AT.P ?X_F)) ((ADV-A (WITH.P ?X_R)) TAKE.9.V)) ?X_S)))
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
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.11.V ?X_C (KA (UP.PRT CLEAN.V) ?X_D)) **
	             ?X_E)
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
	(EPI-SCHEMA ((?X_C REQUEST_ACTION.18.V ?X_C ?A) ** ?X_D)
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
	              (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_A))) INFORM.11.V) ?X_C
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
	              (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_A))) INFORM.12.V) ?X_C
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
	              (COMPOSITE-SCHEMA-82.PR ?X_J ?X_M (KA (UP.PRT CLEAN.V) ?X_J) ?A ?X_N
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
			(?X_B (?X_N TRANSPORT_OBJECT.11.V ?X_M (KA (UP.PRT CLEAN.V) ?X_J)))
			(?X_B (?X_N REQUEST_ACTION.18.V ?X_N ?A))
			(?X_B (?X_N REQUEST_ACTION.4.V ?X_O ?A))
			(?X_B
	   (?X_N (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_J))) INFORM.11.V) ?X_N ?I)))
			(?X_B
	   (?X_N (((ADV-A (FOR.P (KA (UP.PRT CLEAN.V) ?X_J))) INFORM.12.V) ?X_O ?I)))
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
	)
)



(
	(EPI-SCHEMA ((?X_D ENJOY_ACTION.19.V (KA (PLAY.V (K BASEBALL.N)))) ** ?X_E)
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
			(?X_I (?X_M ENJOY_ACTION.19.V (KA (PLAY.V (K BASEBALL.N)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
			(!W2 (?X_G (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_B)))
		)
	)
	(
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
	(EPI-SCHEMA ((?X_A GET.16.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))) **
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
			(?X_D (?X_N GET.16.V (KE ((K WATER.N) (IN.P (ANOTHER.D GLASS.N))))))
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.19.V) ?X_C) ** ?X_D)
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
	   (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) GO.19.V))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.19.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.19.V) ?X_C))
			(?X_D (?X_B GO.19.V))
			(?X_D (?X_B GO.19.V ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? GO.19.V)))
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
	(EPI-SCHEMA ((?X_B TAKE.10.V (TWO.D (PLUR PICTURE.N))) ** ?X_C)
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
	               (TAKE.11.V
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
	    (?X_L (TAKE.11.V (K (L X (AND (X GRADUATION.N) (X (PLUR PICTURE.N)))))))))
			(?X_F (?X_L ((ADV-A (FROM.P ?L1)) GO.19.V) ?X_K))
			(?X_D (?X_N (GIVE.7.V ?X_L ?X_M)))
			(?X_B (?X_N TAKE.10.V (TWO.D (PLUR PICTURE.N))))
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
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.12.V ?X_B ?X_C) ** ?X_D)
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
	(EPI-SCHEMA ((?X_A ((OUT.ADV GET.17.V) ?X_B)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_B (((ADV-A (TO.P ?X_A)) TAKE.12.V) ?X_C)) ** ?X_D)
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-89.PR (KA (CLEAN.V ?X_N)) ?X_L ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_L DESTINATION.N))
			(!R2 (?X_N SMALLER-THAN.N ?X_M))
			(!R3 (?X_L SINK.N))
			(!R4 (?X_M JANITOR.N))
			(!R5 (?X_N (PERTAIN-TO ?X_M)))
			(!R6 (?X_N MOP.V))
			(!R7 (NOT (?X_N AGENT.N)))
			(!R8 (NOT (?X_M = ?X_N)))
		)
		(:STEPS
			(?X_K (?X_M (NEED.V (KA (CLEAN.V ?X_N)))))
			(?X_A (?X_M (NEED.V (KA (CLEAN.V ?X_N)))))
			(?X_I (?X_M TRANSPORT_OBJECT.12.V ?X_N ?X_L))
			(?X_I (?X_M (((ADV-A (TO.P ?X_L)) TAKE.12.V) ?X_N)))
			(?X_G (?X_M ((OUT.ADV GET.17.V) ?X_N)))
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) RUN.11.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B OLD.A))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.11.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.11.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.11.V) ?L2))
			(?X_C (?X_B (AWAY.PRT RUN.11.V)))
			(?X_C (?X_B RUN.11.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? RUN.11.V)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.20.V) (K BLIND.A)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K BLIND.A) DESTINATION.N))
			(!R4 (NOT (?L1 = (K BLIND.A))))
			(!R5 (?X_B OLD.A))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
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
		(:PARAPHRASES
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? (K BLIND.A))) GO.20.V)))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? (K BLIND.A))) GO.20.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? (K BLIND.A))) GO.20.V) (K BLIND.A)))
			(?X_C (?X_B GO.20.V))
			(?X_C (?X_B GO.20.V (K BLIND.A)))
			(?X_C (?X_B (LOCATION_ADV.? GO.20.V)))
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-90.PR ?X_I
	               (K ((ADV-A (FOR.P (K (PLUR YEAR.N)))) (FOR.P ?X_O))) ?X_L ?L2
	               (K BLIND.A)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I TIME.N))
			(!R2 (?X_I LONG.A))
			(!R3 (?X_O (PERTAIN-TO ?X_L)))
			(!R4 (?L2 DESTINATION.N))
			(!R5 ((K BLIND.A) DESTINATION.N))
			(!R6 (?X_O DOG.N))
			(!R7 (?X_O OLD.A))
		)
		(:STEPS
			(?X_K (?X_O ((ADV-A (FROM.P ?L1)) RUN.11.V) ?L2))
			(?X_B (?X_O ((ADV-A (FROM.P ?L1)) GO.20.V) (K BLIND.A)))
			(?X_H (?X_L ?X_O (HAVE.V ?X_I)))
			(?X_F (?X_L (LOOK.V (K ((ADV-A (FOR.P (K (PLUR YEAR.N)))) (FOR.P ?X_O))))))
			(?X_D
	   (?X_A
	    ((LONGER.ADV
	      (MUCH.ADV ((ADV-A (FOR.P (KA ((ADV-A (OVER.P ?X_A)) GET.V)))) TAKE.V)))
	     ?X_L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_B)))
			(!W2 (?X_K (BEFORE ?X_H)))
			(!W3 (?X_K (BEFORE ?X_F)))
			(!W4 (?X_K (BEFORE ?X_D)))
			(!W5 (?X_B (BEFORE ?X_H)))
			(!W6 (?X_B (BEFORE ?X_F)))
			(!W7 (?X_B (BEFORE ?X_D)))
			(!W8 (?X_H (BEFORE ?X_F)))
			(!W9 (?X_H (BEFORE ?X_D)))
			(!W10 (?X_F (BEFORE ?X_D)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (GIVE.8.V ?X_B
	               (THREE.D (L X (AND (X (PLUR CAKE.N)) (X (OF.P (K PAINT.N))))))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2
	   (NOT
	    ((THREE.D (L X (AND (X (PLUR CAKE.N)) (X (OF.P (K PAINT.N)))))) AGENT.N)))
			(!R3 (?X_B AGENT.N))
		)
		(:GOALS
			(?G1
	   (?X_A
	    (WANT.V
	     (THAT
	      (?X_B
	       (HAVE.V
	        (THREE.D (L X (AND (X (PLUR CAKE.N)) (X (OF.P (K PAINT.N))))))))))))
		)
		(:PRECONDS
			(?I1
	   (?X_A HAVE.V (THREE.D (L X (AND (X (PLUR CAKE.N)) (X (OF.P (K PAINT.N))))))))
			(?I2
	   (NOT
	    (?X_B HAVE.V
	     (THREE.D (L X (AND (X (PLUR CAKE.N)) (X (OF.P (K PAINT.N)))))))))
		)
		(:POSTCONDS
			(?P1
	   (NOT
	    (?X_A HAVE.V
	     (THREE.D (L X (AND (X (PLUR CAKE.N)) (X (OF.P (K PAINT.N)))))))))
			(?P2
	   (?X_B HAVE.V (THREE.D (L X (AND (X (PLUR CAKE.N)) (X (OF.P (K PAINT.N))))))))
		)
		(:PARAPHRASES
			(?X_D
	   (?X_A
	    ((ADV-A (TO.P ?X_B))
	     (GIVE.8.V
	      (THREE.D (L X (AND (X (PLUR CAKE.N)) (X (OF.P (K PAINT.N))))))))))
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
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-91.PR (KE (AND (?X_G RED.A) (?X_G YELLOW.A)))
	               (K PURPLE.A) ?X_G
	               (THREE.D (L X (AND (X (PLUR CAKE.N)) (X (OF.P (K PAINT.N))))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2
	   (NOT
	    ((THREE.D (L X (AND (X (PLUR CAKE.N)) (X (OF.P (K PAINT.N)))))) AGENT.N)))
			(!R3 (?X_I AGENT.N))
		)
		(:STEPS
			(?X_D (?X_I (GIVE.V (KE (AND (?X_G RED.A) (?X_G YELLOW.A))))))
			(?X_B ((SET-OF (K RED.N) (K BLUE.N)) (MAKE.V (K PURPLE.A))))
			(?X_F
	   (?X_I
	    (GIVE.8.V ?X_G
	     (THREE.D (L X (AND (X (PLUR CAKE.N)) (X (OF.P (K PAINT.N)))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
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
	)
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) RUN.12.V) (K (OVER.PRT (TO.P ?X_C))))
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
	   (?X_B ((ADV-A (DESTINATION_PREP.? (K (OVER.PRT (TO.P ?X_C))))) RUN.12.V)))
			(?X_D
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K (OVER.PRT (TO.P ?X_C))))) RUN.12.V))))
			(?X_D
	   (?X_B ((ADV-A (DESTINATION_PREP.? (K (OVER.PRT (TO.P ?X_C))))) RUN.12.V)
	    (K (OVER.PRT (TO.P ?X_C)))))
			(?X_D (?X_B RUN.12.V))
			(?X_D (?X_B RUN.12.V (K (OVER.PRT (TO.P ?X_C)))))
			(?X_D (?X_B (LOCATION_ADV.? RUN.12.V)))
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
			(?X_E (?X_L ((ADV-A (FROM.P ?L1)) RUN.12.V) (K (OVER.PRT (TO.P ?X_M)))))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FOR.P ?O)) SEARCH.1.V)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?LX LOCATION.N))
			(!R3 (?LO LOCATION.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA (FIND.V ?O)))))
			(?G2 (?X_B (WANT.V (KA (HAVE.V ?O)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?LX)))
			(?I2 (?O (AT.P ?LO)))
			(?I3 (NOT (?X_B (KNOW.V (THAT (?O (AT.P ?LO)))))))
		)
		(:POSTCONDS
			(?P1 (?X_B (FIND.V ?O)))
		)
		(:PARAPHRASES
			(?X_D (?X_B ((ADV-A (FOR.P ?O)) LOOK.V)))
		)
		(:PARAPHRASES
			(?X_D (?X_B ((ADV-A (FOR.P ?O)) LOOK.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?P1 AFTER ?X_D))
			(!W2 (?X_D (AT-ABOUT ?X_C)))
		)
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?I3<- ?P1) = ?X_D))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-99.PR ?X_I (KA (BUY.V ?X_M)))) ** ?E)
		(:ROLES
			(!R1 (?X_I GREAT.A))
			(!R2 (?X_I SONG.N))
			(!R3 (?X_M ALBUM.N))
			(!R4 (?X_L AGENT.N))
			(!R5 ((KA (BUY.V ?X_M)) ACTION.N))
		)
		(:STEPS
			(?X_H (?X_L (FIND.V ?X_I)))
			(?X_F ((ADV-E (DURING (ALL.D DAY.N))) (?X_L ((ADV-A (TO.P ?X_I)) LISTEN.V))))
			(?X_D (?X_L (LOVE.V ?X_I)))
			(?X_K (?X_L ((ADV-A (FOR.P ?O)) SEARCH.1.V)))
			(?X_B (?X_L ENJOY_ACTION.22.V (KA (BUY.V ?X_M))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_D)))
			(!W3 (?X_F (BEFORE ?X_D)))
			(!W4 (?X_K (BEFORE ?X_B)))
		)
	)
	(
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
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) RUN.13.V) ?L2) ** ?X_B)
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.13.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.13.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.13.V) ?L2))
			(?X_B (?X_A RUN.13.V))
			(?X_B (?X_A RUN.13.V ?L2))
			(?X_B (?X_A RUN.13.V))
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
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.13.V ?X_B ?L2) ** ?X_C)
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
	              (COMPOSITE-SCHEMA-102.PR (KA ((ADV-A (FOR.P ?X_J)) GO.V)) ?X_J ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E SUNNY.A))
			(!R2 (?X_K MAN.N))
			(!R3 (?X_J JOB.N))
			(!R4 (?X_J SMALLER-THAN.N ?X_K))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?L2 HOME.N))
		)
		(:STEPS
			(?X_I (?X_K (OUTSIDE.ADV LOOK.V)))
			(?X_G (?X_K (DECIDE.V (KA ((ADV-A (FOR.P ?X_J)) GO.V)))))
			(?X_D (?X_E ((ADV-A (FOR.P (KA RAIN.V))) START.V)))
			(?X_B (?X_K ((ADV-A (FROM.P ?L1)) RUN.13.V) ?L2))
			(?X_B (?X_K TRANSPORT_OBJECT.13.V ?X_J ?L2))
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
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?X_B)) RUN.14.V) ?L2) ** ?X_D)
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.14.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?X_B)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.14.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.14.V) ?L2))
			(?X_D (?X_C (AWAY.PRT RUN.14.V)))
			(?X_D (?X_C RUN.14.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? RUN.14.V)))
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
	(EPI-SCHEMA ((?X_C ((JUST.ADV GET.18.V) ?X_D)) ** ?X_E)
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
			(?X_K (?X_M ((JUST.ADV GET.18.V) ?X_L)))
			(?X_A (?X_N ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_O)) PLAY.V)))) START.V)))
			(?X_E (?X_F ((ADV-A (AT.P ?X_N)) YELL.V)))
			(?X_C (?X_N ((ADV-A (FROM.P ?X_O)) RUN.14.V) ?L2))
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((OUT.PRT GET.19.V) (KA ((ADV-A (ON.P ?X_C)) CHECK.V)))) **
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
			(?X_D (?X_H ((OUT.PRT GET.19.V) (KA ((ADV-A (ON.P ?X_I)) CHECK.V)))))
			(?X_B (?X_H (DRIVE.V (K HOME.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_D)))
			(!W2 (?X_F (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
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
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-109.PR (KA (AGAIN.ADV WATCH.V) ?X_F))) ** ?E)
		(:ROLES
			(!R1 (?X_F SHOW.N))
			(!R2 (?X_F (VERY.ADV FUNNY.A)))
		)
		(:STEPS
			(?X_C ((ADV-E (DURING (WATCH.V ?X_F (K YESTERDAY.N)))) (?X_A BE.V)))
			(?X_E (?X_A ((ADV (OUT.ADV LOUD.A)) LAUGH.V)))
			(?X_H (?X_A (WANT.V (KA (AGAIN.ADV WATCH.V) ?X_F))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_E)))
			(!W2 (?X_C (BEFORE ?X_H)))
			(!W3 (?X_E (BEFORE ?X_H)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.24.V (KA VOMIT.V)) ** ?X_B)
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
			(?X_D (?X_H ENJOY_ACTION.24.V (KA VOMIT.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_B)))
		)
	)
	(
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
			(?X_C (?X_H TAKE.13.V (SET-OF ?X_I ?X_J)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_C)))
		)
	)
	(
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
	)
)



(
	(EPI-SCHEMA ((?X_N
	              (COMPOSITE-SCHEMA-113.PR
	               (K (L X (AND (X (VERY.ADV FEW.A)) (X (PLUR FAN.N)))))
	               (KA (HOLD.V ?X_G)) ?X_M))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G SHOW.N))
			(!R2 (?X_N BAND.N))
			(!R3 (?X_N (PERTAIN-TO ?X_L)))
			(!R4 (?X_M HEART.N))
			(!R5 (?X_M (PERTAIN-TO ?X_N)))
		)
		(:STEPS
			(?X_D (?X_L ((ADV-A (IN.P ?X_N)) BE.V)))
			(?X_F (?X_N (HAVE.V (K (L X (AND (X (VERY.ADV FEW.A)) (X (PLUR FAN.N))))))))
			(?X_I (?X_N (TRY.V (KA (HOLD.V ?X_G)))))
			(?X_K (?X_N ((STILL.ADV (OUT.PRT PLAY.V)) ?X_M)))
			(?X_B (?X_N ((STILL.ADV (OUT.PRT PLAY.V)) ?X_M)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_F)))
			(!W2 (?X_D (BEFORE ?X_I)))
			(!W3 (?X_D (BEFORE ?X_K)))
			(!W4 (?X_D (BEFORE ?X_B)))
			(!W5 (?X_F (BEFORE ?X_I)))
			(!W6 (?X_F (BEFORE ?X_K)))
			(!W7 (?X_F (BEFORE ?X_B)))
			(!W8 (?X_I (BEFORE ?X_K)))
			(!W9 (?X_I (BEFORE ?X_B)))
			(!W10 (?X_K (BEFORE ?X_B)))
		)
	)
	(
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-114.PR ?X_I ?X_M ?X_E ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_E GROUND.N))
			(!R2 (?X_H PERSON.N))
			(!R3 (?X_I PARKING.N))
			(!R4 (?X_I LOT.N))
			(!R5 (?X_L ARM.N))
			(!R6 (?X_L (PERTAIN-TO ?X_M)))
			(!R7 (?X_M AGENT.N))
			(!R8 (?X_N DESTINATION.N))
			(!R9 (?X_N PASS.N))
		)
		(:STEPS
			(?X_K (?X_M ((ADV-A (FROM.P ?L1)) GO.24.V) ?X_N))
			(?X_A (?X_M ON.P))
			(?X_B (?X_M (IN.P ?X_I)))
			(?X_G (?X_H (GUARD.V ?X_M)))
			(?X_D (?X_M ((HARD.ADV HIT.V) ?X_E)))
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
			(?X_D (?X_H GET.20.V ?X_I))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_B)))
			(!W2 (?X_F (BEFORE ?X_D)))
		)
	)
	(
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
	)
)



(
	(EPI-SCHEMA ((?X_A GET.21.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = ?X_B)))
			(!R5 (?X_A (GET.21.V (K (SO.ADV BIG.A)))))
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
			(?X_D (?X_E GET.21.V ?X_F))
			(?X_B (?X_E (LOVE.V (K SMASH.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
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
			(!R1 (?X_E VERY.A))
			(!R2 (?X_E FUN.N))
			(!R3 (?X_E DAY.N))
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
	)
)



(
	(EPI-SCHEMA ((?X_E ((ADV-A (FROM.P ?L1)) RUN.15.V) ?L2) ** ?X_F)
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
	(EPI-SCHEMA ((?X_E ((ADV-A (FROM.P ?L1)) RUN.16.V) ?L2) ** ?X_F)
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
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.16.V)))
			(?X_F
	   (?X_E ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.16.V))))
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.16.V) ?L2))
			(?X_F (?X_E (CAN.AUX RUN.16.V)))
			(?X_F (?X_E RUN.16.V ?L2))
			(?X_F (?X_E (LOCATION_ADV.? RUN.16.V)))
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
	(EPI-SCHEMA ((?X_C TRANSPORT_OBJECT.14.V ?X_D ?X_E) ** ?X_F)
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-123.PR (SET-OF ?X_K ?X_L ?X_N) ?L2 ?X_M ?X_K))
	             ** ?E)
		(:ROLES
			(!R1 (?X_N (WITH.P ?X_K)))
			(!R2 (?X_I AGENT.N))
			(!R3 (?X_J GOOD.A))
			(!R4 (?X_J LITTLE.A))
			(!R5 (?X_J DOG.N))
			(!R6 (?X_L (IS.V ?X_J)))
			(!R7 (?X_K DESTINATION.N))
			(!R8 (?X_K (TO.P ?X_L)))
			(!R9 (?X_K MAN.N))
			(!R10 (?X_K GOOD.A))
			(!R11 (?X_M SMALLER-THAN.N ?X_L))
			(!R12 (?X_M HAT.N))
			(!R13 (?X_M BIG.A))
			(!R14 (?X_L DOG.N))
			(!R15 (?X_L (HAS.V ?X_M)))
			(!R16 (?X_N COW.N))
			(!R17 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_H (?X_I (SEE.V (SET-OF ?X_K ?X_L ?X_N))))
			(?X_F (?X_L TRANSPORT_OBJECT.14.V ?X_M ?X_K))
			(?X_D (?X_N ((ADV-A (FROM.P ?L1)) RUN.15.V) ?L2))
			(?X_D (?X_N ((ADV-A (FROM.P ?L1)) RUN.16.V) ?L2))
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
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?X_C)) RUN.17.V) ?L2) ** ?X_E)
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.17.V)))
			(?X_E
	   (?X_D ((ADV-A (FROM.P ?X_C)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.17.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.17.V) ?L2))
			(?X_E (?X_D ((ADV-A (THROUGH.P ?X_B)) RUN.17.V)))
			(?X_E (?X_D RUN.17.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? RUN.17.V)))
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
			(?X_N (?X_R ((ADV-A (FROM.P ?X_T)) RUN.17.V) ?L2))
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
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) RUN.18.V) ?L2) ** ?X_B)
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.18.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.18.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.18.V) ?L2))
			(?X_B (?X_A ((ADV-A (AT.P ?X_A)) RUN.18.V)))
			(?X_B (?X_A RUN.18.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? RUN.18.V)))
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
			(E219.SK (?X_C ((ADV-A (FROM.P ?L1)) RUN.18.V) ?L2))
		)
	)
	(
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
			(?X_I (?X_L GET.22.V (K BETTER.A)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?X_B)) GO.24.V)
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
	     ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))) GO.24.V))))
			(?X_E
	   (?X_C
	    ((ADV-A (FROM.P ?X_B))
	     ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
	      GO.24.V))))
			(?X_E
	   (?X_C
	    ((ADV-A (DESTINATION_PREP.? (KA ((ADV-A (WITH.P ?X_D)) PLAY.V)))) GO.24.V)
	    (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
			(?X_E (?X_C GO.24.V))
			(?X_E (?X_C GO.24.V (KA ((ADV-A (WITH.P ?X_D)) PLAY.V))))
			(?X_E (?X_C (LOCATION_ADV.? GO.24.V)))
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
	   (?X_N ((ADV-A (FROM.P ?X_O)) GO.24.V) (KA ((ADV-A (WITH.P ?X_M)) PLAY.V))))
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
	)
)



(
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-134.PR (K MORE.A)
	               (KE (?X_H (HAVE.V (KA (BACK.ADV GO.V)))))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_A NEW.A))
			(!R2 (?X_A PIZZA.N))
			(!R3 (?X_A PLACE.N))
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
	)
)



(
	(EPI-SCHEMA ((?X_A (((ADV-A (INTO.P ?X_B)) GIVE.9.V) ?X_A ?X_B)) ** ?X_E)
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
			(?X_E (?X_A ((ADV-A (TO.P ?X_A)) (GIVE.9.V ?X_B))))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (INTO.P ?X_B)) GIVE.10.V) ?X_A ?X_B)) ** ?X_C)
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
			(?X_C (?X_A ((ADV-A (TO.P ?X_A)) (GIVE.10.V ?X_B))))
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
			(?X_D (?X_K (((ADV-A (INTO.P ?X_L)) GIVE.9.V) ?X_K ?X_L)))
			(?X_D (?X_K (((ADV-A (INTO.P ?X_L)) GIVE.10.V) ?X_K ?X_L)))
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
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) RUN.19.V) ?L2) ** ?X_B)
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.19.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.19.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.19.V) ?L2))
			(?X_B (?X_A (OFF.PRT RUN.19.V)))
			(?X_B (?X_A RUN.19.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? RUN.19.V)))
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
			(?X_E (?X_L ((ADV-A (FROM.P ?L1)) RUN.19.V) ?L2))
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
			(?X_G (?X_J GET.23.V ?X_K))
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
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.15.V ?X_C ?L2) ** ?X_D)
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.29.V) ?X_D) ** ?X_E)
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
	      ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_B)) LOOK.V)))) GO.29.V)))))
			(?X_E
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.29.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.29.V) ?X_D))
			(?X_E (?X_C GO.29.V))
			(?X_E (?X_C GO.29.V ?X_D))
			(?X_E (?X_C (LOCATION_ADV.? GO.29.V)))
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
	(EPI-SCHEMA ((?X_P (COMPOSITE-SCHEMA-143.PR (KA (GET.V ?X_M)) ?L2 ?X_N ?X_Q)) ** ?E)
		(:ROLES
			(!R1 (?X_M NEW.A))
			(!R2 (?X_M PET.N))
			(!R3 (?X_N DESTINATION.N))
			(!R4 (?X_N POUND.N))
			(!R5 (?X_Q SMALLER-THAN.N ?X_P))
			(!R6 (?L2 DESTINATION.N))
			(!R7 (?L2 HOME.N))
			(!R8 (?X_P AGENT.N))
			(!R9 (?X_Q PUPPY.N))
			(!R10 (?X_Q SAD.A))
			(!R11 (?X_O (K NEW.A) PET.N))
			(!R12 (?X_O (PERTAIN-TO ?X_P)))
			(!R13 (NOT (?X_P = ?X_Q)))
		)
		(:STEPS
			(?X_L (?X_P (WANT.V (KA (GET.V ?X_M)))))
			(?X_C (?X_P ((HOME.ADV ((ADV-A (AS.P ?X_O)) TAKE.V)) ?X_Q)))
			(?X_J (?X_P ((ADV-A (FROM.P ?L1)) GO.29.V) ?X_N))
			(?X_G (?X_P (SEE.V ?X_Q)))
			(?X_E (?X_P (DEEPLY.ADV ((ADV-A (FOR.P ?X_Q)) FEEL.V))))
			(?X_A (?X_P TRANSPORT_OBJECT.15.V ?X_Q ?L2))
			(?X_A (?X_P (((ADV-A (AT.P ?X_H)) ((ADV-A (AS.P ?X_O)) TAKE.14.V)) ?X_Q)))
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
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-144.PR (KA ((ADV-A (TO.P (K SCHOOL.N))) GO.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C MORNING.N))
		)
		(:STEPS
			(?X_E ((ADV-E (DURING ?X_C)) (?X_A ((ADV-A (TO.P (K SCHOOL.N))) GO.V))))
			(?X_G (?X_B (LIKE.V (KA ((ADV-A (TO.P (K SCHOOL.N))) GO.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_G)))
		)
	)
	(
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
	)
)



(
	(EPI-SCHEMA ((?X_A GET.24.V ?X_B) ** ?X_C)
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
			(?X_D (?X_K GET.24.V ?X_J))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_I (BEFORE ?X_F)))
			(!W2 (?X_I (BEFORE ?X_D)))
			(!W3 (?X_F (BEFORE ?X_D)))
		)
	)
	(
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
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.30.V) ?L2) ** ?X_B)
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) GO.30.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.30.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) GO.30.V) ?L2))
			(?X_B (?X_A ((ADV (BACK.ADV INSIDE.A)) GO.30.V)))
			(?X_B (?X_A GO.30.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? GO.30.V)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.27.V) ?L2) ** ?X_C)
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.27.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.27.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.27.V) ?L2))
			(?X_C (?X_B (OUT.ADV ((ADV-A (IN.P ?X_A)) GO.27.V))))
			(?X_C (?X_B GO.27.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? GO.27.V)))
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
			(?X_F (?X_H ((ADV-A (FROM.P ?L1)) GO.27.V) ?L2))
			(?X_D (?X_H (BECOME.V (K (VERY.ADV WET.A)))))
			(?X_B (?X_H ((ADV-A (FROM.P ?L1)) GO.30.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_D)))
			(!W2 (?X_F (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_B ((OUT.PRT GET.25.V) (KA (SEE.V ?X_C)))) ** ?X_D)
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
			(?X_B (?X_F ((OUT.PRT GET.25.V) (KA (SEE.V ?X_G)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
	)
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-151.PR ?X_F ?X_M ?X_A ?O)) ** ?E)
		(:ROLES
			(!R1 (?X_B (IMPINGES-ON ?X_C)))
			(!R2 (?X_L AGENT.N))
			(!R3 (?X_F BARK.N))
			(!R4 (?X_I FLOOR.N))
			(!R5 (?X_M (PERTAIN-TO ?X_L)))
			(!R6 (?X_M DOG.N))
			(!R7 (NOT (?O AGENT.N)))
		)
		(:STEPS
			(?X_H (?X_M ((ADV-A (ON.P ?X_I)) LIE.V)))
			(?X_E (?X_M ((OUT.PRT LET.V) ?X_F)))
			(?X_B (?X_L ((NEVER.ADV HAVE.V) ?X_M ?X_A)))
			(?X_K (?X_M DREAM.1.V ?O))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_E)))
			(!W2 (?X_H (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_B)))
		)
	)
	(
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
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.16.V ?X_B ?L2) ** ?X_C)
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
	(EPI-SCHEMA ((?X_A WATCH.3.V (K (PLUR BIRD.N))) ** ?X_B)
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
	(EPI-SCHEMA ((?X_A (((ADV-A (AT.P ?X_E)) TAKE.15.V) ?X_B)) ** ?X_C)
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
	              (COMPOSITE-SCHEMA-152.PR (K (PLUR BINOCULAR.N)) ?X_P ?L2
	               (K (PLUR BIRD.N)) ?X_N))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M MALE.A))
			(!R2 (?X_M AGENT.N))
			(!R3 (?X_P (PERTAIN-TO ?X_M)))
			(!R4 (?X_N SMALLER-THAN.N ?X_O))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?L2 OUTSIDE.N))
			(!R7 (NOT (?X_N AGENT.N)))
			(!R8 (NOT (?X_O = ?X_N)))
			(!R9 (?X_O AGENT.N))
			(!R10 ((K (PLUR BIRD.N)) AGENT.N))
			(!R11 (?X_P DESTINATION.N))
			(!R12 (?X_P (PLUR FRIEND.N)))
		)
		(:STEPS
			(?X_L (?X_O (BUY.V (K (PLUR BINOCULAR.N)))))
			(?X_C ((K (PLUR BIRD.N)) ((ADV-A (FROM.P ?L1)) BECOME.1.V) ?X_P))
			(?X_J (?X_O TRANSPORT_OBJECT.16.V ?X_N ?L2))
			(?X_J (?X_O (((ADV-A (AT.P ?X_E)) TAKE.15.V) ?X_N)))
			(?X_H (?X_O (SEE.V (K (PLUR BIRD.N)))))
			(?X_F (?X_O WATCH.3.V (K (PLUR BIRD.N))))
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
	)
)



(
	(EPI-SCHEMA ((?X_C COMPOSITE-SCHEMA-153.PR) ** ?E)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?X_C (PERTAIN-TO ?X_A)))
			(!R3 (?X_B (K HIND.A) (PLUR FOOT.N)))
			(!R4 (?X_B (PERTAIN-TO ?X_C)))
		)
		(:STEPS
			(E235.SK (?X_C ((ADV-A (ON.P ?X_B)) STAND.V)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.31.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B PET.N))
			(!R6 (?X_B STORE.N))
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.31.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.31.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.31.V) ?X_B))
			(?X_C (?X_A GO.31.V))
			(?X_C (?X_A GO.31.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.31.V)))
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
			(!R5 (?X_N PET.N))
			(!R6 (?X_N STORE.N))
		)
		(:STEPS
			(?X_K (?X_M (WANT.V ?X_L)))
			(?X_I (?X_M ((ADV-A (FROM.P ?L1)) GO.31.V) ?X_N))
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
	)
)



(
	(EPI-SCHEMA ((?X_B EAT.5.V ?X_A) ** ?X_C)
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
	(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA-155.PR ?X_D)) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D FOOD.N))
			(!R3 (?X_D MUFFIN.N))
			(!R4 (?X_D BIG.A))
		)
		(:STEPS
			(?X_B (?X_C EAT.5.V ?X_D))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.32.V)
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
	     ((ADV-A (FOR.P (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N))))) GO.32.V))))
			(?X_C
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A
	       (DESTINATION_PREP.? (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N)))))
	      GO.32.V))))
			(?X_C
	   (?X_A
	    ((ADV-A (DESTINATION_PREP.? (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N)))))
	     GO.32.V)
	    (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N)))))
			(?X_C (?X_A GO.32.V))
			(?X_C (?X_A GO.32.V (KA (((ADV-A (FOR.P ?X_B)) BUY.V) (K GAS.N)))))
			(?X_C (?X_A (LOCATION_ADV.? GO.32.V)))
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
	              (COMPOSITE-SCHEMA-156.PR
	               (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N)))))) ?X_N
	               (KA (FORWARD.ADV PAY.V) ?X_B)
	               (KA (((ADV-A (FOR.P ?X_N)) BUY.V) (K GAS.N)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I PERSON.N))
			(!R2 (?X_L TIME.N))
			(!R3 ((KA (((ADV-A (FOR.P ?X_N)) BUY.V) (K GAS.N))) DESTINATION.N))
			(!R4 (?X_M AGENT.N))
			(!R5 (?X_N AGENT.N))
		)
		(:STEPS
			(?X_K (?X_L ?X_N (RUN.V (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N)))))))))
			(?X_H (?X_I (SEE.V ?X_N)))
			(?X_F
	   (?X_M ((ADV-A (FROM.P ?L1)) GO.32.V)
	    (KA (((ADV-A (FOR.P ?X_N)) BUY.V) (K GAS.N)))))
			(?X_D (?X_M (TELL.V ?X_N (KA (FORWARD.ADV PAY.V) ?X_B))))
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
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) ESCAPE.1.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C (PERTAIN-TO ?X_A)))
			(!R6 (?X_A (VERY.ADV UPSET.A)))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
			(!R8 (?X_B FRIEND.N))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) ESCAPE.1.V)))
			(?X_D
	   (?X_C
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) ESCAPE.1.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) ESCAPE.1.V) ?L2))
			(?X_D (?X_C ESCAPE.1.V))
			(?X_D (?X_C ESCAPE.1.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? ESCAPE.1.V)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) ESCAPE.2.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B (VERY.ADV UPSET.A)))
			(!R6 (?X_C (PERTAIN-TO ?X_B)))
			(!R7 (?X_A FRIEND.N))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) ESCAPE.2.V)))
			(?X_D
	   (?X_C
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) ESCAPE.2.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) ESCAPE.2.V) ?L2))
			(?X_D (?X_C ESCAPE.2.V))
			(?X_D (?X_C ESCAPE.2.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? ESCAPE.2.V)))
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
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.17.V ?X_B (KA LOOK.V)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-157.PR ?X_H (KA (HELP.V (FIND.V ?X_L))) ?X_L ?L2
	               ?X_N (KA LOOK.V)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_H FRIEND.N))
			(!R2 (?X_K (VERY.ADV UPSET.A)))
			(!R3 (?X_H (PERTAIN-TO ?X_K)))
			(!R4 (?X_L (PERTAIN-TO ?X_K)))
			(!R5 (?X_L DOG.N))
			(!R6 (?L2 DESTINATION.N))
			(!R7 ((KA LOOK.V) DESTINATION.N))
			(!R8 (?X_M AGENT.N))
			(!R9 (?X_N SMALLER-THAN.N ?X_M))
			(!R10 (?X_N LOT.N))
			(!R11 (?X_N (OF.P (K GROUND.N))))
		)
		(:STEPS
			(?X_G (?X_K (ASK.V ?X_H (KA (HELP.V (FIND.V ?X_L))))))
			(?X_J (?X_L ((ADV-A (FROM.P ?L1)) ESCAPE.1.V) ?L2))
			(?X_J (?X_L ((ADV-A (FROM.P ?L1)) ESCAPE.2.V) ?L2))
			(?X_A (?X_K (ASK.V ?X_H (KA (HELP.V (FIND.V ?X_L))))))
			(?X_E (?X_M TRANSPORT_OBJECT.17.V ?X_N (KA LOOK.V)))
			(?X_C (?X_M ((NEVER.ADV FIND.V) ?X_L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_A)))
			(!W2 (?X_G (BEFORE ?X_E)))
			(!W3 (?X_G (BEFORE ?X_C)))
			(!W4 (?X_J (BEFORE ?X_A)))
			(!W5 (?X_J (BEFORE ?X_E)))
			(!W6 (?X_J (BEFORE ?X_C)))
			(!W7 (?X_A (BEFORE ?X_E)))
			(!W8 (?X_A (BEFORE ?X_C)))
			(!W9 (?X_E (BEFORE ?X_C)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A MAKE.10.V ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A GIRL.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_B DRESS.N))
			(!R4 (?X_B PRETTY.A))
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
	(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA-158.PR ?X_C)) ** ?E)
		(:ROLES
			(!R1 (?X_C DRESS.N))
			(!R2 (?X_C PRETTY.A))
			(!R3 (NOT (?X_C AGENT.N)))
			(!R4 (?X_D GIRL.N))
		)
		(:STEPS
			(?X_B (?X_D MAKE.10.V ?X_C))
		)
	)
	(
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
			(!R5 (?X_C (PERTAIN-TO ?X_B)))
			(!R6 (?X_C EYE.N))
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
			(!W1 (?X_D (SAME-TIME ?X_H)))
			(!W2 (?X_D (RIGHT-AFTER ?X_E)))
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
	(EPI-SCHEMA ((?X_B INFORM.14.V (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_C))) ?I) **
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
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-161.PR (K (PLUR GLASS.N)) ?X_R ?X_Q
	               (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_Q))) ?I))
	             ** ?E)
		(:ROLES
			(!R1 (?X_M ROCK.N))
			(!R2 (?X_P MAN.N))
			(!R3 (?X_R (PERTAIN-TO ?X_P)))
			(!R4 (?X_Q (PERTAIN-TO ?X_R)))
			(!R5 (?X_Q EYE.N))
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
			(?X_D (?X_R INFORM.14.V (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_Q))) ?I))
			(?X_B (?X_R INFORM.13.V (KE ((K (PLUR GLASS.N)) (SAVE.V ?X_Q))) ?I))
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
			(!R1 (?X_D RAINING.A))
			(!R2 (?X_D NIGHT.N))
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
	(EPI-SCHEMA ((?X_A GET.26.V
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
			(?X_E (?X_K GET.26.V (K (L X (AND (X OUT.P) (X (OF.P (THE.D POOL.N))))))))
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.33.V) ?X_C) ** ?X_D)
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
	   (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) GO.33.V))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.33.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.33.V) ?X_C))
			(?X_D (?X_B GO.33.V))
			(?X_D (?X_B GO.33.V ?X_C))
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
			(?X_M (?X_O ((ADV-A (FROM.P ?L1)) GO.33.V) ?X_P))
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
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) RUN.20.V) ?L2) ** ?X_E)
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
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.20.V)))
			(?X_E
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.20.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.20.V) ?L2))
			(?X_E (?X_C ((ADV-A (AFTER.P ?X_B)) RUN.20.V)))
			(?X_E (?X_C RUN.20.V ?L2))
			(?X_E (?X_C (LOCATION_ADV.? RUN.20.V)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) RUN.21.V) ?L2) ** ?X_D)
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.21.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.21.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.21.V) ?L2))
			(?X_D (?X_C ((ADV-A (AFTER.P ?X_B)) RUN.21.V)))
			(?X_D (?X_C RUN.21.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? RUN.21.V)))
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
			(?X_A (?X_P ((ADV-A (FROM.P ?L1)) RUN.20.V) ?L2))
			(?X_A (?X_P ((ADV-A (FROM.P ?L1)) RUN.21.V) ?L2))
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
	)
)



(
	(EPI-SCHEMA ((?X_A GET.27.V ?X_B) ** ?X_C)
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
			(?X_H (?X_I GET.27.V ?X_J))
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
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.25.V
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
			(E111.SK
	   (?X_B ENJOY_ACTION.25.V
	    (KA (SEE.V (?X_A ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V))))))
		)
	)
	(
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.26.V (KA (L X (AND (X RUN.V) (X PLAY.V))))) **
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
	(EPI-SCHEMA ((?X_R
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
			(!R8 (?X_R MONKEY.N))
			(!R9 ((KA (L X (AND (X RUN.V) (X PLAY.V)))) ACTION.N))
		)
		(:STEPS
			(?X_N (?X_R ((CAN.AUX CLIMB.V) ?X_P)))
			(?X_J (?X_R ((ADV-A (FROM.P ?L1)) CLIMB.2.V) ?X_P))
			(?X_L (?X_R (GET.V ?X_Q)))
			(?X_H (?X_R (DROP.V ?X_Q)))
			(?X_F (?X_R ((ADV-A (FROM.P ?L1)) COME.6.V) ?L2))
			(?X_D (?X_R EAT.6.V ?X_Q))
			(?X_B (?X_R ENJOY_ACTION.26.V (KA (L X (AND (X RUN.V) (X PLAY.V))))))
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
	)
)



(
	(EPI-SCHEMA ((?X_A ((AWAY.ADV GET.28.V) ?O)) ** ?X_B)
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
	(EPI-SCHEMA ((?X_B GET.29.V ?X_C) ** ?X_D)
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
			(!R6 (?X_O SON.N))
			(!R7 (NOT (?X_O = ?X_P)))
			(!R8 (?X_P FLY.N))
		)
		(:STEPS
			(?X_M (?X_P ((ADV-A (ON.P ?X_N)) LAND.V)))
			(?X_J (?X_K (TRY.V (KA (HIT.V ?X_P)))))
			(?X_F (?X_K ((UP.PRT WAKE.V) ?X_O)))
			(?X_D (?X_O (GET.V ?X_P)))
			(?X_H (?X_P ((AWAY.ADV GET.28.V) ?O)))
			(?X_A (?X_K ((UP.PRT WAKE.V) ?X_O)))
			(?X_B (?X_O GET.29.V ?X_P))
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
	)
)



(
	(EPI-SCHEMA ((?X_B GET.30.V (K SICK.A)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-171.PR ?X_L (K SICK.A))) ** ?E)
		(:ROLES
			(!R1 (?X_I STORE.N))
			(!R2 (?X_M MOTHER.N))
			(!R3 (?X_L SLIGHT.A))
			(!R4 (?X_L COLD.N))
			(!R5 (?X_M (PERTAIN-TO ?X_N)))
			(!R6 (?X_N AGENT.N))
			(!R7 (NOT ((K SICK.A) AGENT.N)))
			(!R8 (NOT (?X_N = (K SICK.A))))
		)
		(:STEPS
			(?X_K (?X_N (HAVE.V ?X_L)))
			(?X_H (?X_M ((ADV-A (TO.P ?X_I)) GO.V)))
			(?X_F (?X_N GO.V))
			(?X_D (?X_N (ANYWAY.ADV SWAM.V)))
			(?X_B (?X_N GET.30.V (K SICK.A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_H)))
			(!W2 (?X_K (BEFORE ?X_D)))
			(!W3 (?X_K (BEFORE ?X_B)))
			(!W4 (?X_H (BEFORE ?X_D)))
			(!W5 (?X_H (BEFORE ?X_B)))
			(!W6 (?X_F (BEFORE ?X_B)))
			(!W7 (?X_D (BEFORE ?X_B)))
		)
	)
	(
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
			(!R5 (?X_B (PERTAIN-TO ?X_C)))
			(!R6 (?X_C AGENT.N))
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
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.18.V ?X_C (KA (VISIT.V ?X_D))) ** ?X_E)
		(:ROLES
			(!R1 (?X_B FRIEND.N))
			(!R2 (?X_C AGENT.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 ((KA (VISIT.V ?X_D)) DESTINATION.N))
			(!R6 (?X_D AGENT.N))
			(!R7 (?X_B (PERTAIN-TO ?X_D)))
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
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.19.V ?X_C (KA (VISIT.V ?X_D))) ** ?X_E)
		(:ROLES
			(!R1 (?X_B FRIEND.N))
			(!R2 (?X_C BOY.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 ((KA (VISIT.V ?X_D)) DESTINATION.N))
			(!R6 (?X_D AGENT.N))
			(!R7 (?X_B (PERTAIN-TO ?X_D)))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
			(!R9 (?X_A (K YOUNG.A) SON.N))
			(!R10 (?X_C CUTE.A))
			(!R11 (?X_C LITTLE.A))
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
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-172.PR ?X_P ?X_N (K YOUNG.A) ?X_G ?X_D ?X_O ?X_Q
	               (KA (VISIT.V ?X_R))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_D GREAT.A))
			(!R2 (?X_D VISIT.N))
			(!R3 (?X_G (PLUR TOY.N)))
			(!R4 (?X_N (K YOUNG.A) SON.N))
			(!R5 (?X_N (PERTAIN-TO ?X_P)))
			(!R6 (?X_O SMALLER-THAN.N ?X_P))
			(!R7 (?X_O AGENT.N))
			(!R8 (?X_P FRIEND.N))
			(!R9 (?X_P (PERTAIN-TO ?X_R)))
			(!R10 ((KA (VISIT.V ?X_R)) DESTINATION.N))
			(!R11 (?X_Q SMALLER-THAN.N ?X_P))
			(!R12 (?X_Q BOY.N))
			(!R13 (?X_Q CUTE.A))
			(!R14 (?X_Q LITTLE.A))
			(!R15 (?X_R AGENT.N))
		)
		(:STEPS
			(?X_K (?X_P (BRING.V ?X_N ?X_P)))
			(?X_M (?X_P ((ADV-A (FROM.P ?L1)) COME.7.V) (KA (VISIT.V ?X_R))))
			(?X_M (?X_P TRANSPORT_OBJECT.18.V ?X_O (KA (VISIT.V ?X_R))))
			(?X_M (?X_P TRANSPORT_OBJECT.19.V ?X_Q (KA (VISIT.V ?X_R))))
			(?X_A (?X_P (((ADV-A (WITH.P ?X_P)) BRING.V) ?X_N)))
			(?X_I ((K YOUNG.A) (BE.V ?X_Q)))
			(?X_F (?X_O (((ADV-A (FOR.P (KA (PLAY.V WITH.P)))) GIVE.V) (K YOUNG.A) ?X_G)))
			(?X_C (?X_O (HAVE.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_A)))
			(!W2 (?X_K (BEFORE ?X_I)))
			(!W3 (?X_K (BEFORE ?X_F)))
			(!W4 (?X_K (BEFORE ?X_C)))
			(!W5 (?X_M (BEFORE ?X_A)))
			(!W6 (?X_M (BEFORE ?X_I)))
			(!W7 (?X_M (BEFORE ?X_F)))
			(!W8 (?X_M (BEFORE ?X_C)))
			(!W9 (?X_A (BEFORE ?X_I)))
			(!W10 (?X_A (BEFORE ?X_F)))
			(!W11 (?X_A (BEFORE ?X_C)))
			(!W12 (?X_I (BEFORE ?X_F)))
			(!W13 (?X_I (BEFORE ?X_C)))
			(!W14 (?X_F (BEFORE ?X_C)))
		)
	)
	(
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) RUN.22.V) ?L2) ** ?X_C)
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.22.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.22.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.22.V) ?L2))
			(?X_C (?X_B ((ADV-A (AT.P ?X_A)) RUN.22.V)))
			(?X_C (?X_B RUN.22.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? RUN.22.V)))
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
			(?X_B (?X_D ((ADV-A (FROM.P ?L1)) RUN.22.V) ?L2))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (INTO.P (KA RACE.V))) GET.31.V) ?O)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?O)))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A BOAT.N))
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
			(?X_F (?X_J (((ADV-A (INTO.P (KA RACE.V))) GET.31.V) ?O)))
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
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.20.V ?X_B ?L2) ** ?X_C)
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
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.21.V ?X_B (KA BUDGE.V)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-177.PR ?X_L ?L2 ?X_M (KA BUDGE.V))) ** ?E)
		(:ROLES
			(!R1 (?X_K BUSH.N))
			(!R2 (?X_M SMALLER-THAN.N ?X_L))
			(!R3 ((KA BUDGE.V) DESTINATION.N))
			(!R4 (?X_L CAT.N))
			(!R5 (?X_L SMALLER-THAN.N ?X_M))
			(!R6 (?X_M MAN.N))
			(!R7 (?L2 DESTINATION.N))
			(!R8 (?L2 INSIDE.N))
		)
		(:STEPS
			(?X_J (?X_L ((ADV-A (IN.P ?X_K)) HIDE.V)))
			(?X_H (?X_M (SEE.V ?X_L)))
			(?X_F (?X_M ((ADV-A (TO.P ?X_L)) CALL.V)))
			(?X_D (?X_L TRANSPORT_OBJECT.21.V ?X_M (KA BUDGE.V)))
			(?X_B (?X_M TRANSPORT_OBJECT.20.V ?X_L ?L2))
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
	)
)



(
	(EPI-SCHEMA ((?X_C TAKE.16.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C MAN.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_D {REF}.N))
			(!R6 (?X_A BACKPACK.N))
			(!R7 (?X_A (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((?X_A ((OFF.ADV TAKE.17.V) ?X_B)) ** ?X_C)
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
			(!R3 (?X_M BACKPACK.N))
			(!R4 (?X_M (PERTAIN-TO ?X_N)))
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
			(?X_E (?X_N ((OFF.ADV TAKE.17.V) ?X_M)))
			(?X_C (?X_N TAKE.16.V ?X_O))
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
	)
)



(
	(EPI-SCHEMA ((?X_B GET.20.V (K (L X (AND (X HAIR.N) (X STUFF.N))))) ** ?X_E)
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
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?I2 PRECOND-OF ?X_E))
			(!W3 (?I3 PRECOND-OF ?X_E))
			(!W4 (?P1 POSTCOND-OF ?X_E))
			(!W5 (?X_E (AFTER ?X_D)))
			(!W6 (?X_E (AT-ABOUT ?X_F)))
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
			(?X_F (?X_K (GET.V (K (L X (AND (X HAIR.N) (X STUFF.N)))))))
			(?X_D (?X_K GET.20.V (K (L X (AND (X HAIR.N) (X STUFF.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_D)))
			(!W3 (?X_A (BEFORE ?X_F)))
			(!W4 (?X_B (BEFORE ?X_D)))
		)
	)
	(
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
			(!R1 (?X_J SMALLER-THAN ?X_K))
			(!R2 (?X_J EGG.N))
			(!R3 (?X_I MAN.N))
			(!R4 (?X_K CONTAINER.N))
			(!R5 (?X_K PAN.N))
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
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?L1)) GO.34.V) ?L2) ** ?X_E)
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) GO.34.V)))
			(?X_E (?X_D ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.34.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) GO.34.V) ?L2))
			(?X_E (?X_D ((ADV-A (OFF.P ?X_C)) GO.34.V)))
			(?X_E (?X_D GO.34.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? GO.34.V)))
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
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?L1)) GO.35.V) ?L2) ** ?X_E)
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) GO.35.V)))
			(?X_E (?X_D ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.35.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) GO.35.V) ?L2))
			(?X_E (?X_D ((ADV-A (OFF.P ?X_C)) GO.35.V)))
			(?X_E (?X_D GO.35.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? GO.35.V)))
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
			(?X_D (?X_K ((ADV-A (FROM.P ?L1)) GO.34.V) ?L2))
			(?X_D (?X_K ((ADV-A (FROM.P ?L1)) GO.35.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_G)))
			(!W2 (?X_B (BEFORE ?X_D)))
			(!W3 (?X_G (BEFORE ?X_D)))
		)
	)
	(
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.36.V) ?L2) ** ?X_C)
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.36.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.36.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.36.V) ?L2))
			(?X_C (?X_B (OFF.ADV ((ADV-A (ON.P ?X_A)) GO.36.V))))
			(?X_C (?X_B GO.36.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? GO.36.V)))
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
	(EPI-SCHEMA ((?X_C TRANSPORT_OBJECT.22.V ?X_D ?L2) ** ?X_E)
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
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.23.V ?X_B ?L2) ** ?X_C)
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-186.PR ?X_H ?X_M ?X_N ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_H HOUSE.N))
			(!R2 (?X_K (K BEST.A) FRIEND.N))
			(!R3 (?X_K (PERTAIN-TO ?X_M)))
			(!R4 (?X_M (PERTAIN-TO ?X_L)))
			(!R5 (?X_M SON.N))
			(!R6 (?X_M SMALLER-THAN.N ?X_O))
			(!R7 (?X_N ADVENTURE.N))
			(!R8 (?X_N SMALLER-THAN.N ?X_O))
			(!R9 (?X_O AGENT.N))
			(!R10 (?L2 DESTINATION.N))
			(!R11 (?L2 HOME.N))
		)
		(:STEPS
			(?X_J (?X_M ((ADV-A (OUTSIDE.P (KA PLAY.V))) BE.V)))
			(?X_G (?X_K (BY.P ?X_H)))
			(?X_A (?X_K ((ADV-A (BY.P ?X_H)) COME.V)))
			(?X_E (?X_O ((ADV-A (FROM.P ?L1)) GO.36.V) ?L2))
			(?X_C (?X_O ((ADV-A (FROM.P ?L1)) COME.8.V) ?L2))
			(?X_C (?X_O TRANSPORT_OBJECT.22.V ?X_M ?L2))
			(?X_C (?X_O TRANSPORT_OBJECT.23.V ?X_N ?L2))
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.37.V)
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
	     GO.37.V)))
			(?X_E
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D)))))
	      GO.37.V))))
			(?X_E
	   (?X_B
	    ((ADV-A (DESTINATION_PREP.? (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D)))))
	     GO.37.V)
	    (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D)))))
			(?X_E (?X_B GO.37.V))
			(?X_E (?X_B GO.37.V (K ((ADV-A (WITH.P ?X_C)) (TO.P ?X_D)))))
			(?X_E (?X_B (LOCATION_ADV.? GO.37.V)))
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
	   (?X_N ((ADV-A (FROM.P ?L1)) GO.37.V)
	    (K ((ADV-A (WITH.P ?X_M)) (TO.P ?X_L)))))
			(?X_F (?X_N (LOSE.V ?X_M)))
			(?X_B (?X_N (FOR.P ?X_K)))
			(?X_D (?X_N (((ADV-A (IN.P (K TROUBLE.N))) GET.32.V) ?O)))
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
	)
)



(
	(EPI-SCHEMA ((?X_G COMPOSITE-SCHEMA-189.PR) ** ?E)
		(:ROLES
			(!R1 (?X_D BEACH.N))
			(!R2 (?X_D DAY.N))
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
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.27.V
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
	(EPI-SCHEMA (((K TYKE.N) TAKE.18.V ?X_B) ** ?X_C)
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
	   (?X_I ENJOY_ACTION.27.V
	    (KA (((ADV-A (WITH.P (K TYKE.N))) PLAY.V) (K BALL.N)))))
			(?X_G (?X_I ((CAN.AUX CATCH.V) ?X_H)))
			(?X_E (?X_I ((ADV-A (FROM.P ?L1)) ROLL.1.V) ?X_J))
			(?X_C ((K TYKE.N) TAKE.18.V ?X_J))
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
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?L1)) RUN.23.V) ?L2) ** ?X_E)
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.23.V)))
			(?X_E
	   (?X_D ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.23.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.23.V) ?L2))
			(?X_E (?X_D RUN.23.V))
			(?X_E (?X_D RUN.23.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? RUN.23.V)))
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
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?L1)) RUN.16.V) ?L2) ** ?X_E)
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.16.V)))
			(?X_E
	   (?X_D ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.16.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.16.V) ?L2))
			(?X_E (?X_D RUN.16.V))
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
			(?X_F (?X_V ((ADV-A (FROM.P ?L1)) RUN.23.V) ?L2))
			(?X_F (?X_V ((ADV-A (FROM.P ?L1)) RUN.16.V) ?L2))
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
			(?X_A (NOT (?X_H (WANT.V ?X_I))))
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
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.38.V) ?X_D) ** ?X_E)
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
	   (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) ((ADV-A (TO.P ?X_D)) GO.38.V))))
			(?X_E
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.38.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.38.V) ?X_D))
			(?X_E (?X_C GO.38.V))
			(?X_E (?X_C GO.38.V ?X_D))
			(?X_E (?X_C (LOCATION_ADV.? GO.38.V)))
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
	(EPI-SCHEMA ((?X_C GET.33.V (K MORE.A)) ** ?X_D)
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
			(?X_J (?X_R ((ADV-A (FROM.P ?L1)) GO.38.V) ?X_Q))
			(?X_H (?X_R GET.33.V (K MORE.A)))
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
			(!R9 (?X_D (VERY.ADV MUCH.A)))
			(!R10 (?X_D (PERTAIN-TO ?X_C)))
			(!R11 (?X_D FAN.N))
			(!R12 (?X_A PRETTY.A))
			(!R13 (?X_D (IS.V ?X_A)))
			(!R14 (?X_A FAN.N))
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
			(!R6 (?X_E DESK.N))
			(!R7 (?X_E (AT.P (K SCHOOL.N))))
			(!R8 (?X_D (VERY.ADV MUCH.A)))
			(!R9 (?X_D FAN.N))
			(!R10 (?X_D (PERTAIN-TO ?X_C)))
			(!R11 (?X_E (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((?X_V (COMPOSITE-SCHEMA-199.PR ?X_S ?X_Q ?X_A ?X_K ?X_W ?X_U)) ** ?E)
		(:ROLES
			(!R1 (?X_K HAND.N))
			(!R2 (?X_K (PERTAIN-TO ?X_V)))
			(!R3 (?X_Q KNIFE.N))
			(!R4 (?X_Q (HAS.V (TWO.D (PLUR BLADE.N)))))
			(!R5 (?X_P (IS.V ?X_Q)))
			(!R6 (?X_Q (PERTAIN-TO ?X_S)))
			(!R7 (?X_R FATHER.N))
			(!R8 (?X_R (PERTAIN-TO ?X_S)))
			(!R9 (?X_T PRETTY.A))
			(!R10 (?X_T FAN.N))
			(!R11 (?X_U (IS.V ?X_T)))
			(!R12 (?X_U SMALLER-THAN ?X_W))
			(!R13 (?X_U (VERY.ADV MUCH.A)))
			(!R14 (?X_U FAN.N))
			(!R15 (?X_U (PERTAIN-TO ?X_V)))
			(!R16 (?X_V AGENT.N))
			(!R17 (?X_W CONTAINER.N))
			(!R18 (?X_W DESK.N))
			(!R19 (?X_W (AT.P (K SCHOOL.N))))
			(!R20 (?X_W (PERTAIN-TO ?X_V)))
			(!R21 (NOT (?X_W AGENT.N)))
		)
		(:STEPS
			(?X_O (?X_R (BUY.V ?X_Q ?X_S)))
			(?X_B (?X_R (((ADV-A (FOR.P ?X_S)) BUY.V) ?X_Q)))
			(?X_M (?X_S (CARRY.V ?X_A)))
			(?X_C (?X_V (LIKE.V ?X_U)))
			(?X_J (?X_V (LIKE.V ?X_U)))
			(?X_H (?X_V (CARRY.V ?X_U ?X_K)))
			(?X_D (?X_V (((ADV-A (IN.P ?X_K)) CARRY.V) ?X_U)))
			(?X_F (?X_V (PUT.V ?X_U ?X_W)))
			(E356.SK (?X_V (((ADV-A (IN.P ?X_W)) PUT.6.V) ?X_U)))
			(E356.SK (?X_V (((ADV-A (IN.P ?X_W)) PUT.7.V) ?X_U)))
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
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.24.V ?X_C ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C FAIR.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A (PLUR FRIEND.N)))
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
			(!W5 (?X_G (BEFORE ?X_F)))
			(!W6 (?X_J (SAME-TIME ?X_F)))
			(!W7 (?X_G (AFTER ?X_H)))
			(!W8 (?X_J (RIGHT-AFTER ?X_I)))
			(!W9 (?X_J (AFTER ?X_K)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.25.V ?X_C ?L2) ** ?X_D)
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
			(!W3 (?X_E (AFTER ?X_D)))
			(!W4 (?X_E (BEFORE ?X_F)))
			(!W5 (?X_G (BEFORE ?X_F)))
			(!W6 (?X_J (SAME-TIME ?X_F)))
			(!W7 (?X_G (AFTER ?X_H)))
			(!W8 (?X_J (AFTER ?X_I)))
			(!W9 (?X_J (RIGHT-AFTER ?X_K)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (AT.P ?X_K)) GET.34.V) ?O)) ** ?X_C)
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
	(EPI-SCHEMA ((?X_B (((ADV-A (AT.P ?X_K)) GET.35.V) ?O)) ** ?X_C)
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
			(!W1 (?I1 PRECOND-OF ?X_C))
			(!W2 (?I2 PRECOND-OF ?X_C))
			(!W3 (?I3 PRECOND-OF ?X_C))
			(!W4 (?P1 POSTCOND-OF ?X_C))
			(!W5 (?X_D (AFTER ?X_C)))
			(!W6 (?X_D (BEFORE ?X_E)))
			(!W7 (?X_I (SAME-TIME ?X_E)))
			(!W8 (?X_F (BEFORE ?X_E)))
			(!W9 (?X_F (AFTER ?X_G)))
			(!W10 (?X_I (RIGHT-AFTER ?X_H)))
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
	               (K FUN.N) ?X_Q ?X_R ?L2 ?O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_P (PLUR FRIEND.N)))
			(!R2 (?X_P (PERTAIN-TO ?X_S)))
			(!R3 (?X_Q FAIR.N))
			(!R4 (?X_Q SMALLER-THAN.N ?X_S))
			(!R5 (?X_R AGENT.N))
			(!R6 (?X_R SMALLER-THAN.N ?X_S))
			(!R7 (?L2 DESTINATION.N))
			(!R8 (?L2 THERE.N))
			(!R9 (?X_S AGENT.N))
			(!R10 (NOT (?O AGENT.N)))
			(!R11 (NOT (?X_S = ?O)))
		)
		(:STEPS
			(?X_O (?X_S (WANT.V (KA ((ADV-A (TO.P ?X_Q)) GO.V)))))
			(?X_A (?X_S TRANSPORT_OBJECT.24.V ?X_Q ?L2))
			(?X_A (?X_S (((ADV-A (AT.P ?X_K)) GET.35.V) ?O)))
			(?X_J (?X_S (MEET.V ?X_P)))
			(?X_B (?X_S TRANSPORT_OBJECT.25.V ?X_R ?L2))
			(?X_M (?X_S (MEET.V ?X_P)))
			(?X_C (?X_S (((ADV-A (AT.P ?X_K)) GET.34.V) ?O)))
			(?X_D (?X_S (MEET.V ?X_P)))
			(?X_H (?X_R (HAVE.V (K FUN.N))))
			(?X_F (?X_R ((ADV-A (FOR.P (THREE.D (PLUR HOUR.N)))) STAY.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_O (BEFORE ?X_D)))
			(!W2 (?X_O (BEFORE ?X_H)))
			(!W3 (?X_O (BEFORE ?X_F)))
			(!W4 (?X_A (BEFORE ?X_J)))
			(!W5 (?X_A (BEFORE ?X_D)))
			(!W6 (?X_A (BEFORE ?X_H)))
			(!W7 (?X_A (BEFORE ?X_F)))
			(!W8 (?X_J (BEFORE ?X_D)))
			(!W9 (?X_J (BEFORE ?X_H)))
			(!W10 (?X_J (BEFORE ?X_F)))
			(!W11 (?X_B (BEFORE ?X_M)))
			(!W12 (?X_B (BEFORE ?X_D)))
			(!W13 (?X_B (BEFORE ?X_H)))
			(!W14 (?X_B (BEFORE ?X_F)))
			(!W15 (?X_M (BEFORE ?X_D)))
			(!W16 (?X_M (BEFORE ?X_H)))
			(!W17 (?X_M (BEFORE ?X_F)))
			(!W18 (?X_C (BEFORE ?X_D)))
			(!W19 (?X_C (BEFORE ?X_H)))
			(!W20 (?X_C (BEFORE ?X_F)))
			(!W21 (?X_D (BEFORE ?X_H)))
			(!W22 (?X_D (BEFORE ?X_F)))
			(!W23 (?X_H (BEFORE ?X_F)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A GET.36.V (KE (?X_B READY.A))) ** ?X_C)
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
			(?X_A (?X_G GET.36.V (KE (?X_H READY.A))))
			(?X_C (?X_G (CATCH.V ?X_D)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_C)))
		)
	)
	(
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.39.V) (KA EAT.V)) ** ?X_B)
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
	      (OUT.PRT ((ADV-A (FOR.P (KA EAT.V))) GO.39.V))))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? (KA EAT.V))) GO.39.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? (KA EAT.V))) GO.39.V) (KA EAT.V)))
			(?X_B (?X_A GO.39.V))
			(?X_B (?X_A GO.39.V (KA EAT.V)))
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
			(?X_H (?X_J ((ADV-A (FROM.P ?L1)) GO.39.V) (KA EAT.V)))
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
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.26.V ?X_C ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?X_C ENTITY.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_D DESTINATION.N))
			(!R6 (?X_D RIDE.N))
			(!R7 (?X_A WAGON.N))
			(!R8 (?X_A LITTLE.A))
			(!R9 (?X_B (HAS.V ?X_A)))
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
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.28.V
	              (KA (RIDE.V (IN.P (AND (?X_C LITTLE.A) (?X_C WAGON.N))))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((KA (RIDE.V (IN.P (AND (?X_C LITTLE.A) (?X_C WAGON.N))))) ACTION.N))
			(!R3 (?X_C (HAS.V ?X_A)))
			(!R4 (?X_A WAGON.N))
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
	(EPI-SCHEMA ((?X_C (((ADV-A (FOR.P ?X_A)) TAKE.19.V) ?X_D)) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_A RIDE.N))
			(!R6 (?X_B LITTLE.A))
			(!R7 (?X_C (HAS.V ?X_B)))
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
	              (COMPOSITE-SCHEMA-203.PR ?X_I
	               (KA (RIDE.V (IN.P (AND (?X_K LITTLE.A) (?X_K WAGON.N)))))
	               (KA ((ADV-A (IN.P ?X_H)) RIDE.V)) ?X_J))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K (HAS.V ?X_H)))
			(!R2 (?X_H LITTLE.A))
			(!R3 (?X_H WAGON.N))
			(!R4 ((KA ((ADV-A (IN.P ?X_H)) RIDE.V)) ACTION.N))
			(!R5 (?X_J SMALLER-THAN.N ?X_K))
			(!R6 (?X_I DESTINATION.N))
			(!R7 (?X_I RIDE.N))
			(!R8 (?X_K AGENT.N))
			(!R9 (NOT (?X_K = ?X_J)))
			(!R10 ((KA (RIDE.V (IN.P (AND (?X_K LITTLE.A) (?X_K WAGON.N))))) ACTION.N))
		)
		(:STEPS
			(?X_E (?X_J ENJOY_ACTION.29.V (KA ((ADV-A (IN.P ?X_H)) RIDE.V))))
			(?X_A (?X_K TRANSPORT_OBJECT.26.V ?X_J ?X_I))
			(?X_A (?X_K (((ADV-A (FOR.P ?X_I)) TAKE.19.V) ?X_J)))
			(?X_C
	   (?X_J ENJOY_ACTION.28.V
	    (KA (RIDE.V (IN.P (AND (?X_K LITTLE.A) (?X_K WAGON.N)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_A)))
			(!W2 (?X_E (BEFORE ?X_C)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_C (GIVE.11.V ?X_D ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?X_D AGENT.N))
			(!R4 (?X_E BUN.N))
			(!R5 (?X_A (K HIND.A) (PLUR FOOT.N)))
			(!R6 (?X_A (PERTAIN-TO ?X_D)))
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
	(EPI-SCHEMA ((?X_C (GIVE.12.V ?X_D ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?X_D AGENT.N))
			(!R4 (?X_E BUN.N))
			(!R5 (?X_D (IS.V ?X_A)))
			(!R6 (?X_A BUN.N))
			(!R7 (?X_B (PERTAIN-TO ?X_D)))
			(!R8 (?X_B (K HIND.A) (PLUR FOOT.N)))
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
			(?X_F (?X_C (((ADV-A (TO.P ?X_D)) GIVE.12.V) ?X_E)))
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
			(!R7 (NOT (?X_T AGENT.N)))
			(!R8 (?X_T BUN.N))
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
			(E471.SK (?X_S (GIVE.11.V ?X_R ?X_T)))
			(E471.SK (?X_S (GIVE.12.V ?X_R ?X_T)))
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.40.V) ?L2) ** ?X_C)
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.40.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.40.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.40.V) ?L2))
			(?X_C (?X_B GO.40.V))
			(?X_C (?X_B GO.40.V ?L2))
			(?X_C (?X_B GO.40.V))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.41.V)
	              (K (BACK.ADV (TO.P (K BED.N)))))
	             ** ?X_C)
		(:ROLES
			(!R1 (?X_B FARMER.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (BACK.ADV (TO.P (K BED.N)))) DESTINATION.N))
			(!R4 (NOT (?L1 = (K (BACK.ADV (TO.P (K BED.N)))))))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A (PLUR BOOT.N)))
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
	    ((ADV-A (DESTINATION_PREP.? (K (BACK.ADV (TO.P (K BED.N)))))) GO.41.V)))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K (BACK.ADV (TO.P (K BED.N)))))) GO.41.V))))
			(?X_C
	   (?X_B
	    ((ADV-A (DESTINATION_PREP.? (K (BACK.ADV (TO.P (K BED.N)))))) GO.41.V)
	    (K (BACK.ADV (TO.P (K BED.N))))))
			(?X_C (?X_B GO.41.V))
			(?X_C (?X_B GO.41.V (K (BACK.ADV (TO.P (K BED.N))))))
			(?X_C (?X_B (LOCATION_ADV.? GO.41.V)))
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
	(EPI-SCHEMA ((?X_C ((UP.PRT ((ADV-A (IN.P ?X_A)) GET.37.V)) ?O)) ** ?X_D)
		(:ROLES
			(!R1 (?X_C FARMER.N))
			(!R2 (NOT (?O AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?O)))
			(!R5 (?X_A MORNING.N))
			(!R6 (?X_B (PLUR BOOT.N)))
			(!R7 (?X_B (PERTAIN-TO ?X_C)))
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
			(!R4 (NOT (?O AGENT.N)))
			(!R5 (NOT (?X_O = ?O)))
			(!R6 (?X_N MORNING.N))
			(!R7 (?L2 DESTINATION.N))
			(!R8 (?L2 OUTSIDE.N))
			(!R9 (?X_O FARMER.N))
			(!R10 ((K (BACK.ADV (TO.P (K BED.N)))) DESTINATION.N))
		)
		(:STEPS
			(?X_J (?X_O (PUT.V ?X_M)))
			(?X_L (?X_O ((UP.PRT ((ADV-A (IN.P ?X_N)) GET.37.V)) ?O)))
			(?X_A (?X_O (KA PUT.V) ?X_M ON.P))
			(?X_H (?X_O ((ADV-A (FROM.P ?L1)) GO.40.V) ?L2))
			(?X_E (?X_O (MILK.V ?X_F)))
			(?X_C (?X_O ((ADV-A (FROM.P ?L1)) GO.41.V) (K (BACK.ADV (TO.P (K BED.N))))))
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.42.V) (KA WALK.V)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((KA WALK.V) DESTINATION.N))
			(!R4 (NOT (?L1 = (KA WALK.V))))
			(!R5 (?X_A DAY.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (KA WALK.V))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (KA WALK.V)))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (KA WALK.V))))
		)
		(:PARAPHRASES
			(?X_C
	   ((ADV-E (DURING ?X_A))
	    (?X_B
	     ((ADV-A (DESTINATION_PREP.? (KA WALK.V)))
	      (OUT.PRT ((ADV-A (FOR.P (KA WALK.V))) GO.42.V))))))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? (KA WALK.V))) GO.42.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? (KA WALK.V))) GO.42.V) (KA WALK.V)))
			(?X_C (?X_B GO.42.V))
			(?X_C (?X_B GO.42.V (KA WALK.V)))
			(?X_C (?X_B (LOCATION_ADV.? GO.42.V)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-206.PR ?X_C (KA WALK.V))) ** ?E)
		(:ROLES
			(!R1 (?X_C GREEN.A))
			(!R2 (?X_C BIRD.N))
			(!R3 (?X_H DAY.N))
			(!R4 (?X_I AGENT.N))
			(!R5 ((KA WALK.V) DESTINATION.N))
		)
		(:STEPS
			(?X_G (?X_I ((ADV-A (FROM.P ?L1)) GO.42.V) (KA WALK.V)))
			(?X_E (?X_I (UP.PRT LOOK.V)))
			(?X_B (?X_I (SEE.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
			(!W2 (?X_G (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.34.V) ?L2) ** ?X_B)
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) GO.34.V)))
			(?X_B (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.34.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) GO.34.V) ?L2))
			(?X_B (?X_A GO.34.V))
			(?X_B (?X_A GO.34.V ?L2))
			(?X_B (MUST.AUX-S (?X_A (BACK.ADV GO.34.V))))
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
			(!R2 (?X_H (VERY.ADV LONG.A)))
			(!R3 (?X_H DAY.N))
			(!R4 (?X_I AGENT.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?L2 OUTSIDE.N))
		)
		(:STEPS
			(?X_B ((ADV-E (DURING ?X_H)) (?X_A BE.V)))
			(?X_F (?X_I ((ADV-A (ABOUT.P (KA ((ADV-A (OUT.P ?X_G)) WALK.V)))) BE.V)))
			(?X_D (?X_I ((ADV-A (FROM.P ?L1)) GO.34.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_B (BEFORE ?X_F)))
			(!W2 (?X_B (BEFORE ?X_D)))
			(!W3 (?X_F (BEFORE ?X_D)))
		)
	)
	(
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
	)
)



(
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.27.V ?X_D ?X_E) ** ?X_F)
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
	(EPI-SCHEMA ((?X_C GET.38.V (KE ((K HONEY.N) (FROM.P ?X_D)))) ** ?X_E)
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
	               ?X_O (KE ((K HONEY.N) (FROM.P ?X_O)))))
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
			(!R11 (?X_O DESTINATION.N))
			(!R12 (?X_O (PLUR FLOWER.N)))
			(!R13 (?X_O HIVE.N))
			(!R14 (?X_N (PLUR BEE.N)))
			(!R15 (NOT ((KE ((K HONEY.N) (FROM.P ?X_O))) AGENT.N)))
			(!R16 (NOT (?X_N = (KE ((K HONEY.N) (FROM.P ?X_O))))))
		)
		(:STEPS
			(?X_A (?X_L (HAVE.V (KE ((K (PLUR BEE.N)) (IN.P ?X_K))))))
			(?X_G ((K (PLUR BEE.N)) ((ADV-A (IN.P ?X_I)) LIVE.V)))
			(?X_E (?X_N TRANSPORT_OBJECT.27.V ?X_M ?X_O))
			(?X_C (?X_N GET.38.V (KE ((K HONEY.N) (FROM.P ?X_O)))))
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
			(?X_C (NOT (?X_L (ALLOW.V (KE ((K (PLUR PET.N)) (IN.P ?X_K)))))))
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
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.43.V) ?X_D) ** ?X_E)
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
	   (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) ((ADV-A (TO.P ?X_D)) GO.43.V))))
			(?X_E
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.43.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) GO.43.V) ?X_D))
			(?X_E (?X_C GO.43.V))
			(?X_E (?X_C GO.43.V ?X_D))
			(?X_E (?X_C (LOCATION_ADV.? GO.43.V)))
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
			(?X_H (?X_N ((ADV-A (FROM.P ?L1)) GO.43.V) ?X_O))
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
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.44.V) ?L2) ** ?X_D)
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) GO.44.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.44.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) GO.44.V) ?L2))
			(?X_D (?X_C ((ADV-A (INSIDE.P ?X_B)) GO.44.V)))
			(?X_D (?X_C GO.44.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? GO.44.V)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.45.V) ?L2) ** ?X_D)
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) GO.45.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.45.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) GO.45.V) ?L2))
			(?X_D (?X_C GO.45.V))
			(?X_D (?X_C GO.45.V ?L2))
			(?X_D (?X_C ((ADV-A (IN.P ?X_B)) GO.45.V)))
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
			(?X_O (?X_R ((ADV-A (FROM.P ?L1)) GO.45.V) ?L2))
			(?X_L (?X_A (((ADV-A (IN.P ?X_P)) BE.V) ?X_M)))
			(?X_J (?X_R (SNIFF.V ?X_M)))
			(?X_F (?X_R SLEEP.V))
			(?X_H (?X_R ((ADV-A (FROM.P ?L1)) GO.44.V) ?L2))
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
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) RUN.24.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C CAT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_B DAY.N))
			(!R6 (?X_C (PERTAIN-TO ?X_A)))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.24.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.24.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.24.V) ?L2))
			(?X_D ((ADV-E (DURING ?X_B)) (?X_C (AWAY.PRT RUN.24.V))))
			(?X_D (?X_C RUN.24.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? RUN.24.V)))
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
	(EPI-SCHEMA ((?X_A
	              ((NEVER.ADV GET.39.V)
	               (K (L X (AND (X ALONG.P) (X (WITH.P ?X_C)))))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT ((K (L X (AND (X ALONG.P) (X (WITH.P ?X_C))))) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_A = (K (L X (AND (X ALONG.P) (X (WITH.P ?X_C))))))))
			(!R5 (?X_C CAT.N))
			(!R6 (?X_C (PERTAIN-TO ?X_A)))
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
	(EPI-SCHEMA ((?X_B ((INSTEAD.ADV GET.40.V) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C NEW.A))
			(!R6 (?X_C CAT.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_A CAT.N))
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
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-214.PR (KA ((ADV-A (FOR.P ?X_B)) LOOK.V)) ?X_G ?L2
	               (K (L X (AND (X ALONG.P) (X (WITH.P ?X_O))))) ?X_Q))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G SEARCH.N))
			(!R2 (?X_O (PERTAIN-TO ?X_P)))
			(!R3 (?X_N DAY.N))
			(!R4 (?X_O CAT.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_Q NEW.A))
			(!R7 (?X_Q CAT.N))
			(!R8 (?X_P AGENT.N))
			(!R9 (NOT (?X_P = ?X_Q)))
		)
		(:STEPS
			(?X_M (?X_O ((ADV-A (FROM.P ?L1)) RUN.24.V) ?L2))
			(?X_K
	   (?X_P ((NEVER.ADV GET.39.V) (K (L X (AND (X ALONG.P) (X (WITH.P ?X_O))))))))
			(?X_I (?X_P (TRY.V (KA ((ADV-A (FOR.P ?X_B)) LOOK.V)))))
			(?X_F (?X_P ((QUICKLY.ADV (UP.PRT GIVE.V)) ?X_G)))
			(?X_D (?X_P ((INSTEAD.ADV GET.40.V) ?X_Q)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_K)))
			(!W2 (?X_M (BEFORE ?X_I)))
			(!W3 (?X_M (BEFORE ?X_F)))
			(!W4 (?X_M (BEFORE ?X_D)))
			(!W5 (?X_K (BEFORE ?X_I)))
			(!W6 (?X_K (BEFORE ?X_F)))
			(!W7 (?X_K (BEFORE ?X_D)))
			(!W8 (?X_I (BEFORE ?X_F)))
			(!W9 (?X_I (BEFORE ?X_D)))
			(!W10 (?X_F (BEFORE ?X_D)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA (((ADV-E (DURING (K YESTERDAY.N))) (?X_A (GET.25.V ?X_B))) ** ?X_C)
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
			(!R3 (?X_I KINDLE.A))
			(!R4 (?X_I GREAT.A))
			(!R5 (?X_I IMPRESSIVE.A))
			(!R6 (?X_I BOOK.N))
			(!R7 (NOT (?X_I AGENT.N)))
			(!R8 (NOT (?X_H = ?X_I)))
		)
		(:STEPS
			(?X_G ((ADV-E (DURING (K YESTERDAY.N))) (?X_H (GET.25.V ?X_I))))
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
	)
)



(
	(EPI-SCHEMA ((?X_B GET.41.V ?X_C) ** ?X_D)
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
			(?X_D (?X_M GET.41.V ?X_N))
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
	)
)



(
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.30.V ?X_B ?A) ** ?X_E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B MOTHER.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_A (SO.ADV HAPPY.A)))
			(!R5 (?X_A HAPPY.A))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.24.V ?X_B ?A) ** ?X_E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B MOTHER.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_B (PERTAIN-TO ?X_A)))
			(!R5 (?X_A (SO.ADV HAPPY.A)))
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
	(EPI-SCHEMA ((?X_B GET.42.V ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_B HAPPY.A))
			(!R6 (?X_B (SO.ADV HAPPY.A)))
			(!R7 (?X_C FAMILY.N))
			(!R8 (?X_C DOG.N))
			(!R9 (?X_C GREAT.A))
			(!R10 (?X_A MOTHER.N))
			(!R11 (?X_A (PERTAIN-TO ?X_B)))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-218.PR ?X_A ?A ?X_N ?I ?X_P)) ** ?E)
		(:ROLES
			(!R1 (?A ACTION.N))
			(!R2 (?X_N (PERTAIN-TO ?X_O)))
			(!R3 (?X_N MOTHER.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?I INFORMATION.N))
			(!R6 (?X_P FAMILY.N))
			(!R7 (?X_P DOG.N))
			(!R8 (?X_P GREAT.A))
			(!R9 (?X_O AGENT.N))
			(!R10 (NOT (?X_O = ?X_P)))
		)
		(:STEPS
			(?X_K (?X_O (WANT.V ?X_P)))
			(?X_G (?X_N (SAY.V ?X_A)))
			(?X_I (?X_O REQUEST_ACTION.30.V ?X_N ?A))
			(?X_B (?X_O REQUEST_ACTION.24.V ?X_N ?A))
			(?X_B (?X_O INFORM.15.V ?X_N ?I))
			(?X_C (?X_N (SAY.V ?X_A)))
			(?X_E (?X_O GET.42.V ?X_P))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_B)))
			(!W2 (?X_K (BEFORE ?X_C)))
			(!W3 (?X_K (BEFORE ?X_E)))
			(!W4 (?X_G (BEFORE ?X_C)))
			(!W5 (?X_G (BEFORE ?X_E)))
			(!W6 (?X_I (BEFORE ?X_B)))
			(!W7 (?X_I (BEFORE ?X_C)))
			(!W8 (?X_I (BEFORE ?X_E)))
			(!W9 (?X_B (BEFORE ?X_C)))
			(!W10 (?X_B (BEFORE ?X_E)))
			(!W11 (?X_C (BEFORE ?X_E)))
		)
	)
	(
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
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) ROLL.2.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B (HAS.V (KE ((K (PLUR BELL.N)) (ON.P ?X_B))))))
			(!R6 (?X_B (VERY.ADV FAST.A)))
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
			(!R2 (?X_C (HAS.V (KE ((K (PLUR BELL.N)) (ON.P ?X_C))))))
			(!R3 (?X_C (VERY.ADV FAST.A)))
			(!R4 (?X_C HOOP.N))
			(!R5 (?X_C (PERTAIN-TO ?X_D)))
			(!R6 (?X_D AGENT.N))
		)
		(:STEPS
			(?X_B (?X_D ((ADV-A (FROM.P ?L1)) ROLL.2.V) ?X_C))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-221.PR ?X_C ?X_M (K (UP.ADV (TO.P ?X_M))) ?X_N ?X_P
	               (KA (AWAY.ADV STAY.V))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C LITTLE.A))
			(!R2 (?X_C GIRL.N))
			(!R3 (?X_M HOUSE.N))
			(!R4 (?X_H MAN.N))
			(!R5 (?X_N CANDY.N))
			(!R6 (?X_O BROTHER.N))
			(!R7 (?X_M (PERTAIN-TO ?X_P)))
			(!R8 (?X_N (PERTAIN-TO ?X_P)))
			(!R9 (?X_O (PERTAIN-TO ?X_P)))
		)
		(:STEPS
			(?X_E (?X_P (BE.V ?X_C)))
			(?X_G (?X_H ((UP.ADV TO.P) ?X_M)))
			(?X_A (?X_H (PULL.V (K (UP.ADV (TO.P ?X_M))))))
			(?X_B (?X_H (OFFER.V ?X_N)))
			(?X_J (?X_H (OFFER.V ?X_N)))
			(?X_L (?X_O ((ADV-A (WITH.P ?X_P)) BE.V)))
			(?X_R (?X_O (TELL.V ?X_P (KA (AWAY.ADV STAY.V)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (BEFORE ?X_G)))
			(!W2 (?X_E (BEFORE ?X_A)))
			(!W3 (?X_E (BEFORE ?X_B)))
			(!W4 (?X_E (BEFORE ?X_J)))
			(!W5 (?X_E (BEFORE ?X_L)))
			(!W6 (?X_E (BEFORE ?X_R)))
			(!W7 (?X_G (BEFORE ?X_A)))
			(!W8 (?X_G (BEFORE ?X_B)))
			(!W9 (?X_G (BEFORE ?X_J)))
			(!W10 (?X_G (BEFORE ?X_L)))
			(!W11 (?X_G (BEFORE ?X_R)))
			(!W12 (?X_A (BEFORE ?X_B)))
			(!W13 (?X_A (BEFORE ?X_J)))
			(!W14 (?X_A (BEFORE ?X_L)))
			(!W15 (?X_A (BEFORE ?X_R)))
			(!W16 (?X_B (BEFORE ?X_J)))
			(!W17 (?X_B (BEFORE ?X_L)))
			(!W18 (?X_B (BEFORE ?X_R)))
			(!W19 (?X_J (BEFORE ?X_L)))
			(!W20 (?X_J (BEFORE ?X_R)))
			(!W21 (?X_L (BEFORE ?X_R)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) RUN.25.V) ?L2) ** ?X_B)
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
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.25.V)))
			(?X_B
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.25.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.25.V) ?L2))
			(?X_B (?X_A (QUICKLY.ADV (AWAY.PRT RUN.25.V))))
			(?X_B (?X_A RUN.25.V ?L2))
			(?X_B (?X_A (LOCATION_ADV.? RUN.25.V)))
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
			(!R3 (?L2 DESTINATION.N))
			(!R4 (?X_H AGENT.N))
		)
		(:STEPS
			(?X_D (?X_G ((ADV-A (BEHIND.P ?X_E)) BE.V)))
			(?X_B (?X_H ((ADV-A (FROM.P ?L1)) RUN.25.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.28.V ?O (ANOTHER.D TRIAL.N)) ** ?X_B)
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
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.31.V ?X_A ?A) ** ?X_B)
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
	               (ANOTHER.D TRIAL.N) ?X_J ?A))
	             ** ?E)
		(:ROLES
			(!R1 ((ANOTHER.D TRIAL.N) DESTINATION.N))
			(!R2 (?O ENTITY.N))
			(!R3 (?O SMALLER-THAN.N ?X_J))
			(!R4 (?X_J INNOCENT.A))
			(!R5 (?X_J MAN.N))
			(!R6 (?A ACTION.N))
		)
		(:STEPS
			(?X_I (?X_J ((ADV-A (TO.P (K PRISON.N))) GO.V)))
			(?X_G (?X_J TRANSPORT_OBJECT.28.V ?O (ANOTHER.D TRIAL.N)))
			(?X_G (?X_J REQUEST_ACTION.31.V ?X_J ?A))
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
	)
)



(
	(EPI-SCHEMA ((?X_A INFORM.16.V (KE (?X_B OUTSIDE.A)) ?I) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KE (?X_B OUTSIDE.A)) AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_A FAMILY.N))
			(!R6 (?X_A NEXT.A))
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
	(EPI-SCHEMA ((?X_M
	              (COMPOSITE-SCHEMA-225.PR
	               (K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N))))))
	               (KE (?X_M OUTSIDE.A)) ?I))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F FAMILY.N))
			(!R2 (?X_K CAGE.N))
			(!R3 (?X_L AGENT.N))
			(!R4 (?X_L FAMILY.N))
			(!R5 (?X_L NEXT.A))
			(!R6 (?X_M DOG.N))
			(!R7 ((KE (?X_M OUTSIDE.A)) AGENT.N))
			(!R8 (NOT (?I ACTION.N)))
			(!R9 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_J (?X_M ((ADV-A (IN.P ?X_K)) BE.V)))
			(?X_H ((ADV-E (DURING (ALL.D DAY.N))) (?X_M HOWL.V)))
			(?X_E (?X_F (GET.V (K (L X (AND (X RID.A) (X (OF.P (THE.D DOG.N)))))))))
			(?X_C (?X_L INFORM.16.V (KE (?X_M OUTSIDE.A)) ?I))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_H)))
			(!W2 (?X_J (BEFORE ?X_E)))
			(!W3 (?X_H (BEFORE ?X_E)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A (((ADV-A (FROM.P (K HOME.N))) TAKE.20.V) ?X_B)) ** ?X_C)
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
			(!R1 (?X_D (MOST.ADV RELAXING.A)))
			(!R2 (?X_D DAY.N))
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
			(?X_I (?X_O (((ADV-A (FROM.P (K HOME.N))) TAKE.20.V) ?X_P)))
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
	)
)



(
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-227.PR ?X_M ?X_B)) ** ?E)
		(:ROLES
			(!R1 (?X_M WAY.N))
			(!R2 (?X_M (TO.P (K BED.N))))
			(!R3 (?X_H LATE.A))
			(!R4 (?X_H NIGHT.N))
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
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) GO.46.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C NEXT.A))
			(!R6 (?X_C (VERY.ADV NERVOUS.A)))
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
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) GO.46.V)))
			(?X_D
	   (?X_C ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.46.V))))
			(?X_D (?X_C ((ADV-A (DESTINATION_PREP.? ?L2)) GO.46.V) ?L2))
			(?X_D (?X_C ((ADV-A (INTO.P ?X_B)) GO.46.V)))
			(?X_D (?X_C GO.46.V ?L2))
			(?X_D (?X_C (LOCATION_ADV.? GO.46.V)))
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
			(!R5 (?X_J NEXT.A))
			(!R6 (?X_J (VERY.ADV NERVOUS.A)))
			(!R7 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_E (?X_J (SEE.V ?X_I)))
			(E469.SK (?X_J (TO.P ?X_I)))
			(?X_G (?X_J ((ADV-A (FROM.P ?L1)) GO.46.V) ?L2))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.47.V) ?X_C) ** ?X_D)
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
	   (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) GO.47.V))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.47.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.47.V) ?X_C))
			(?X_D (?X_B GO.47.V))
			(?X_D (?X_B GO.47.V ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? GO.47.V)))
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
	(EPI-SCHEMA ((?X_A GET.43.V ?X_B) ** ?X_C)
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
	(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA-229.PR ?X_M ?X_J ?X_L)) ** ?E)
		(:ROLES
			(!R1 (?X_J DESTINATION.N))
			(!R2 (?X_J CAFETERIA.N))
			(!R3 (?X_K MAN.N))
			(!R4 (?X_L (PERTAIN-TO ?X_K)))
			(!R5 (?X_L LUNCH.N))
			(!R6 (NOT (?X_L AGENT.N)))
			(!R7 (NOT (?X_K = ?X_L)))
			(!R8 (?X_M DESTINATION.N))
			(!R9 (?X_M NEW.A))
			(!R10 (?X_M FRIEND.N))
			(!R11 (?X_N WOMAN.N))
		)
		(:STEPS
			(?X_G (?X_K (GET.V ?X_L)))
			(?X_I (?X_K ((ADV-A (FROM.P ?L1)) GO.47.V) ?X_J))
			(?X_A (?X_K GET.43.V ?X_L))
			(?X_E (?X_K (DOWN.ADV ((ADV-A (BY.P ?X_K)) SIT.V))))
			(?X_C (?X_N ((ADV-A (FROM.P ?L1)) BECOME.3.V) ?X_M))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_A)))
			(!W2 (?X_G (BEFORE ?X_E)))
			(!W3 (?X_G (BEFORE ?X_C)))
			(!W4 (?X_I (BEFORE ?X_A)))
			(!W5 (?X_I (BEFORE ?X_E)))
			(!W6 (?X_I (BEFORE ?X_C)))
			(!W7 (?X_A (BEFORE ?X_E)))
			(!W8 (?X_A (BEFORE ?X_C)))
			(!W9 (?X_E (BEFORE ?X_C)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?L1)) RUN.26.V) ?L2) ** ?X_E)
		(:ROLES
			(!R1 (?X_D DOG.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_D BLACK.A))
			(!R6 (?X_D (IS.V ?X_B)))
			(!R7 (?X_B (K BLACK.A) DOG.N))
			(!R8 (?X_A DOG.N))
			(!R9 (?X_D (IS.V ?X_A)))
			(!R10 (?X_A LARGE.A))
			(!R11 (?X_A BLACK.A))
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.26.V)))
			(?X_E
	   (?X_D ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.26.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.26.V) ?L2))
			(?X_E (?X_D RUN.26.V))
			(?X_E (?X_D RUN.26.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? RUN.26.V)))
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
			(E3.SK (?X_D ((ADV-A (FROM.P ?L1)) RUN.26.V) ?L2))
		)
	)
	(
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
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.48.V) (K (TO.P (?X_B PLACE.N)))) **
	             ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (TO.P (?X_B PLACE.N))) DESTINATION.N))
			(!R4 (NOT (?L1 = (K (TO.P (?X_B PLACE.N))))))
			(!R5 (?X_B FRIEND.N))
			(!R6 (?X_B (PERTAIN-TO ?X_A)))
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
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? (K (TO.P (?X_B PLACE.N))))) GO.48.V)))
			(?X_C
	   (?X_A
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K (TO.P (?X_B PLACE.N))))) GO.48.V))))
			(?X_C
	   (?X_A ((ADV-A (DESTINATION_PREP.? (K (TO.P (?X_B PLACE.N))))) GO.48.V)
	    (K (TO.P (?X_B PLACE.N)))))
			(?X_C (?X_A GO.48.V))
			(?X_C (?X_A GO.48.V (K (TO.P (?X_B PLACE.N)))))
			(?X_C (?X_A (LOCATION_ADV.? GO.48.V)))
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
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-231.PR (KE (?X_J PLACE.N))
	               (KE (?X_K FEEL.V POOR.A)) ?L2 (K (TO.P (?X_J PLACE.N)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I HOUSE.N))
			(!R2 (?X_I HUGE.A))
			(!R3 (?X_J FRIEND.N))
			(!R4 (?X_J (PERTAIN-TO ?X_K)))
			(!R5 ((K (TO.P (?X_J PLACE.N))) DESTINATION.N))
			(!R6 (?L2 DESTINATION.N))
			(!R7 (?X_K AGENT.N))
		)
		(:STEPS
			(?X_A (?X_K (TO.P (KE (?X_J PLACE.N)))))
			(?X_B (?X_K ((ADV-A (FROM.P ?L1)) GO.48.V) (K (TO.P (?X_J PLACE.N)))))
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
			(!R6 (?X_A BED.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.49.V) (KA WORK.V)) ** ?X_C)
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
	     ((ADV-A (TO.P (KA WORK.V))) GO.49.V))))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? (KA WORK.V))) GO.49.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? (KA WORK.V))) GO.49.V) (KA WORK.V)))
			(?X_C (?X_B GO.49.V))
			(?X_C (?X_B GO.49.V (KA WORK.V)))
			(?X_C (?X_B (LOCATION_ADV.? GO.49.V)))
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
			(?X_G (?X_I ((ADV-A (FROM.P ?L1)) GO.49.V) (KA WORK.V)))
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.32.V ?X_C ?A) ** ?X_D)
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.2.V ?X_C ?A) ** ?X_D)
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
			(?X_G (?X_K REQUEST_ACTION.32.V ?X_L ?A))
			(?X_E (?X_K ((ADV-A (FROM.P ?L1)) WALK.6.V) ?L2))
			(?X_E (?X_K REQUEST_ACTION.2.V ?X_L ?A))
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
			(?X_D (?X_F ?X_H (ON.P ?X_E)))
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.50.V) (K FISHING.N)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K FISHING.N) DESTINATION.N))
			(!R4 (NOT (?L1 = (K FISHING.N))))
			(!R5 (?X_B MORE.A))
			(!R6 (?X_A LIMIT.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? (K FISHING.N))) GO.50.V)))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K FISHING.N))) GO.50.V))))
			(?X_C
	   (?X_B ((ADV-A (DESTINATION_PREP.? (K FISHING.N))) GO.50.V) (K FISHING.N)))
			(?X_C (?X_B GO.50.V))
			(?X_C (?X_B GO.50.V (K FISHING.N)))
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
	(EPI-SCHEMA ((?X_A GET.18.V
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
			(?X_K (?X_M ((ADV-A (FROM.P ?L1)) GO.50.V) (K FISHING.N)))
			(?X_B (?X_M (CATCH.V (K (L X (AND (X MORE.A) (X (THAN.P ?X_L))))))))
			(?X_I
	   (?X_M (KEEP.V (ALL.D (L X (AND (X {REF}.N) (X (OF.P (THE.D FISH.N)))))))))
			(?X_G
	   (?X_N GET.18.V
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
	)
)



(
	(EPI-SCHEMA ((?X_B GET.44.V (K UPSET.A)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (NOT ((K UPSET.A) AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = (K UPSET.A))))
			(!R5 (?X_A NEW.A))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
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
			(?X_C (?X_M GET.44.V (K UPSET.A)))
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
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) CHASE.1.V) ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_D HAT.N))
			(!R6 (?X_B (HAS.V ?X_D)))
			(!R7 (?X_B FRIEND.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
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
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) CHASE.1.V)))
			(?X_E
	   (?X_C
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) CHASE.1.V))))
			(?X_E (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) CHASE.1.V) ?X_D))
			(?X_E (?X_C CHASE.1.V))
			(?X_E (?X_C (((ADV-A (WITH.P ?X_B)) CHASE.1.V) ?X_D)))
			(?X_E (?X_C (LOCATION_ADV.? CHASE.1.V)))
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
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?L1)) CHASE.2.V) ?X_D) ** ?X_F)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_D DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_D)))
			(!R5 (?X_B FRIEND.N))
			(!R6 (?X_B (HAS.V ?X_D)))
			(!R7 (?X_D HAT.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
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
			(?X_F (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) CHASE.2.V)))
			(?X_F
	   (?X_C
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_D)) CHASE.2.V))))
			(?X_F (?X_C ((ADV-A (DESTINATION_PREP.? ?X_D)) CHASE.2.V) ?X_D))
			(?X_F (?X_C CHASE.2.V))
			(?X_F (?X_C (((ADV-A (WITH.P ?X_B)) CHASE.2.V) ?X_D)))
			(?X_F (?X_C (LOCATION_ADV.? CHASE.2.V)))
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
	(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-239.PR ?X_L ?X_E ?X_P)) ** ?E)
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
			(?X_I (?X_O (CHASE.V ?X_P ?X_L)))
			(?X_B (?X_O ((ADV-A (FROM.P ?L1)) CHASE.1.V) ?X_P))
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) CLIMB.3.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C (VERY.ADV PRETTY.A)))
			(!R6 (?X_C TREE.N))
			(!R7 (?X_A MOTHER.N))
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
	(EPI-SCHEMA ((?X_B GET.45.V ?X_C) ** ?X_D)
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
			(!R2 (?X_O (VERY.ADV PRETTY.A)))
			(!R3 (?X_O TREE.N))
			(!R4 (?X_R AGENT.N))
			(!R5 (NOT (?X_P AGENT.N)))
			(!R6 (NOT (?X_R = ?X_P)))
			(!R7 (?X_Q (PERTAIN-TO ?X_R)))
			(!R8 (?X_Q MOTHER.N))
			(!R9 ((KA ((ADV-A (WITH.P ?X_R)) PLAY.V)) ACTION.N))
		)
		(:STEPS
			(?X_N
	   ((K (L X (AND (X MANY.A) (X (PLUR COCOANUT.N)))))
	    ((ADV-A (ON.P ?X_O)) GROW.V)))
			(?X_L (?X_R ((ADV-A (FROM.P ?L1)) CLIMB.3.V) ?X_O))
			(?X_J (?X_R GET.45.V ?X_P))
			(?X_B (?X_Q (LIKE.V (K (PLUR COCOANUT.N)))))
			(?X_H (?X_Q (LIKE.V (K (PLUR COCOANUT.N)))))
			(?X_F (?X_Q ((ADV-A (FOR.P (KA (CLIMB.V ?X_O)))) CANNOT.V)))
			(?X_D (?X_Q ENJOY_ACTION.33.V (KA ((ADV-A (WITH.P ?X_R)) PLAY.V))))
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
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.51.V) ?X_B) ** ?X_C)
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
	   (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) ((ADV-A (TO.P ?X_B)) GO.51.V))))
			(?X_C
	   (?X_A ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.51.V))))
			(?X_C (?X_A ((ADV-A (DESTINATION_PREP.? ?X_B)) GO.51.V) ?X_B))
			(?X_C (?X_A GO.51.V))
			(?X_C (?X_A GO.51.V ?X_B))
			(?X_C (?X_A (LOCATION_ADV.? GO.51.V)))
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
			(!R3 (?X_F FUN.N))
			(!R4 (?X_F NIGHT.N))
			(!R5 (?X_I LITTLE.A))
			(!R6 (?X_J AGENT.N))
			(!R7 (?X_M AGENT.N))
			(!R8 (?X_N DESTINATION.N))
			(!R9 (?X_N CASINO.N))
		)
		(:STEPS
			(?X_L (?X_M ((ADV-A (FROM.P ?L1)) GO.51.V) ?X_N))
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
	)
)



(
	(EPI-SCHEMA ((?X_C TRANSPORT_OBJECT.29.V ?X_D ?X_E) ** ?X_G)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D FAMILY.N))
			(!R3 (?X_D SMALLER-THAN.N ?X_C))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_E FARM.N))
			(!R6 (?X_E DESTINATION.N))
			(!R7 (?X_D (PERTAIN-TO ?X_C)))
			(!R8 (?X_A (PERTAIN-TO ?X_C)))
			(!R9 (?X_A (PLUR KID.N)))
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
			(?X_G (?X_C (((ADV-A (TO.P ?X_E)) TAKE.V) ?X_D)))
			(?X_G (?X_C ((ADV-A (TO.P ?X_E)) CARRY.V) ?X_D))
			(?X_G (?X_C ((ADV-A (TO.P ?X_E)) BRING.V) ?X_D))
			(?X_G (?X_C (LOCATION_ADV.? TAKE.V) ?X_D))
			(?X_G (?X_C (LOCATION_ADV.? CARRY.V) ?X_D))
			(?X_G (?X_C (LOCATION_ADV.? BRING.V) ?X_D))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_G))
			(!W2 (?P1 POSTCOND-OF ?X_G))
			(!W3 (?X_G (RIGHT-AFTER ?X_F)))
			(!W4 (?X_G (SAME-TIME ?X_I)))
			(!W5 (?X_H (BEFORE ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_D (((ADV-A (TO.P ?X_A)) TAKE.21.V) ?X_E)) ** ?X_F)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (NOT (?X_E AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_D = ?X_E)))
			(!R5 (?X_A FARM.N))
			(!R6 (?X_E (PERTAIN-TO ?X_D)))
			(!R7 (?X_E FAMILY.N))
			(!R8 (?X_B DAUGHTER.N))
			(!R9 (?X_B (PERTAIN-TO ?X_D)))
			(!R10 (?X_C (PLUR KID.N)))
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
			(!W5 (?X_F (SAME-TIME ?X_I)))
			(!W6 (?X_F (RIGHT-AFTER ?X_G)))
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
	(EPI-SCHEMA ((?X_R (COMPOSITE-SCHEMA-242.PR ?X_N ?X_K ?X_F ?X_S ?X_U)) ** ?E)
		(:ROLES
			(!R1 (?X_F FUN.N))
			(!R2 (?X_F TIME.N))
			(!R3 (?X_K PIG.N))
			(!R4 (?X_R DAUGHTER.N))
			(!R5 (?X_N GREAT.A))
			(!R6 (?X_N TIME.N))
			(!R7 (?X_Q (PLUR KID.N)))
			(!R8 (?X_Q (PERTAIN-TO ?X_T)))
			(!R9 (?X_R (PERTAIN-TO ?X_T)))
			(!R10 (?X_S DESTINATION.N))
			(!R11 (?X_U SMALLER-THAN.N ?X_T))
			(!R12 (?X_S FARM.N))
			(!R13 (?X_U (PERTAIN-TO ?X_T)))
			(!R14 (?X_U FAMILY.N))
			(!R15 (?X_T AGENT.N))
			(!R16 (NOT (?X_U AGENT.N)))
			(!R17 (NOT (?X_T = ?X_U)))
		)
		(:STEPS
			(?X_P (?X_T (TAKE.V ?X_U ?X_S)))
			(?X_M (?X_Q (HAVE.V ?X_N)))
			(?X_J (?X_R ((THEN.ADV TOUCH.V) ?X_K)))
			(?X_A (?X_T TRANSPORT_OBJECT.29.V ?X_U ?X_S))
			(?X_A (?X_T (((ADV-A (TO.P ?X_S)) TAKE.21.V) ?X_U)))
			(?X_B (?X_Q (HAVE.V ?X_N)))
			(?X_C (?X_R ((THEN.ADV TOUCH.V) ?X_K)))
			(?X_H (?X_R LAUGH.V))
			(?X_E (?X_R (HAVE.V ?X_F)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_P (BEFORE ?X_A)))
			(!W2 (?X_P (BEFORE ?X_B)))
			(!W3 (?X_P (BEFORE ?X_C)))
			(!W4 (?X_P (BEFORE ?X_H)))
			(!W5 (?X_P (BEFORE ?X_E)))
			(!W6 (?X_M (BEFORE ?X_B)))
			(!W7 (?X_M (BEFORE ?X_C)))
			(!W8 (?X_M (BEFORE ?X_H)))
			(!W9 (?X_M (BEFORE ?X_E)))
			(!W10 (?X_J (BEFORE ?X_C)))
			(!W11 (?X_J (BEFORE ?X_H)))
			(!W12 (?X_J (BEFORE ?X_E)))
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.52.V) ?L2) ** ?X_C)
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.52.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.52.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.52.V) ?L2))
			(?X_C
	   ((ADV-E (DURING (K YESTERDAY.N))) (?X_B ((ADV-A (ON.P ?X_A)) GO.52.V))))
			(?X_C (?X_B GO.52.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? GO.52.V)))
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
			(?X_H (?X_J ((ADV-A (FROM.P ?L1)) GO.52.V) ?L2))
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
			(E311.SK (NOT (?X_A (WHIP.V ?X_B))))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_G ((ADV-A (FROM.P ?L1)) FALL.7.V) ?L2) ** ?X_H)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 ((K RED.A) (PERTAIN-TO ?X_G)))
			(!R6 (?X_F SNOW.N))
			(!R7 (?X_D (K RED.A) SLED.N))
			(!R8 (?X_D (PERTAIN-TO ?X_G)))
			(!R9 (?X_B SLED.N))
			(!R10 (?X_B (IS.V (KE (?X_E (PASV SLED.V))))))
			(!R11 (?X_B (PERTAIN-TO ?X_G)))
			(!R12
	   (?X_B
	    (HAS.V (KE ((K (L X (AND (X BLACK.A) (X (PLUR LETTER.N))))) (ON.P ?X_B))))))
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
			(?X_H (?X_G ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.7.V)))
			(?X_H
	   (?X_G ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.7.V))))
			(?X_H (?X_G ((ADV-A (DESTINATION_PREP.? ?L2)) FALL.7.V) ?L2))
			(?X_H (?X_G ((ADV-A (INTO.P ?X_F)) FALL.7.V)))
			(?X_H (?X_G FALL.7.V ?L2))
			(?X_H (?X_G (LOCATION_ADV.? FALL.7.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_H))
			(!W2 (?I2 BEFORE ?X_H))
			(!W3 (?P1 AFTER ?X_H))
			(!W4 (?P2 AFTER ?X_H))
			(!W5 (?G1 CAUSE-OF ?X_H))
			(!W6 (?X_H (DURING ?X_J)))
			(!W7 (?X_I (CONSEC ?X_H)))
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
			(!R7 (?X_B (IS.V (KE (?X_C (PASV SLED.V))))))
			(!R8 (?X_B SLED.N))
			(!R9 (?X_B (PERTAIN-TO ?X_G)))
			(!R10
	   (?X_B
	    (HAS.V (KE ((K (L X (AND (X BLACK.A) (X (PLUR LETTER.N))))) (ON.P ?X_B))))))
			(!R11 (?X_E (K RED.A) SLED.N))
			(!R12 (?X_E (PERTAIN-TO ?X_G)))
			(!R13 (?X_C RED.N))
			(!R14 (?X_D (IS.V ?X_E)))
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
			(!W6 (?X_I (DURING ?X_J)))
			(!W7 (?X_H (DURING ?X_J)))
			(!W8 (?X_H (CONSEC ?X_I)))
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
			(!R2 (?X_M SLED.N))
			(!R3 (?X_M (IS.V (KE (?X_N (PASV SLED.V))))))
			(!R4
	   (?X_M
	    (HAS.V (KE ((K (L X (AND (X BLACK.A) (X (PLUR LETTER.N))))) (ON.P ?X_M))))))
			(!R5 (?X_M (PERTAIN-TO ?X_U)))
			(!R6 (?X_N RED.N))
			(!R7 (?X_P (K RED.A) SLED.N))
			(!R8 (?X_P (PERTAIN-TO ?X_U)))
			(!R9 (?X_O (IS.V ?X_P)))
			(!R10 ((K RED.A) (PERTAIN-TO ?X_U)))
			(!R11 (?X_U AGENT.N))
			(!R12 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_J (?X_U ((ADV-A (INTO.P ?X_K)) FALL.V)))
			(?X_A (?X_U (((ADV-A (FOR.P (KA (HAVE.V (K RED.A))))) LET.V) ?X_U)))
			(?X_B (?X_U (((ADV-A (FOR.P (KA (HAVE.V (K RED.A))))) LET.V) ?X_U)))
			(?X_C (?X_U ((ADV-A (FROM.P ?L1)) FALL.7.V) ?L2))
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
	)
)



(
	(EPI-SCHEMA ((?X_E ((ADV-A (FROM.P ?X_D)) RUN.27.V) ?L2) ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?X_D PARK.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?X_D = ?L2)))
			(!R5 (?X_C (K OTHER.A) FRIEND.N))
			(!R6 (?X_C (PERTAIN-TO ?X_A)))
			(!R7 (?X_A AGENT.N))
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
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.27.V)))
			(?X_F
	   (?X_E ((ADV-A (FROM.P ?X_D)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.27.V))))
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.27.V) ?L2))
			(?X_F (?X_E ((ADV-A (WITH.P ?X_C)) RUN.27.V)))
			(?X_F (?X_E RUN.27.V ?L2))
			(?X_F (?X_E (LOCATION_ADV.? RUN.27.V)))
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
	(EPI-SCHEMA ((?X_E ((ADV-A (FROM.P ?L1)) GO.53.V) ?L2) ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_D RUN.N))
			(!R6 (?X_C DAY.N))
			(!R7 (?X_A PARK.N))
			(!R8 (?X_D (AT.P ?X_A)))
			(!R9 (?X_B (PERTAIN-TO ?X_E)))
			(!R10 (?X_B (K OTHER.A) FRIEND.N))
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
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) GO.53.V)))
			(?X_F
	   (?X_E ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.53.V))))
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) GO.53.V) ?L2))
			(?X_F ((ADV-E (DURING ?X_C)) (?X_E ((ADV-A (ON.P ?X_D)) GO.53.V))))
			(?X_F (?X_E GO.53.V ?L2))
			(?X_F (?X_E (LOCATION_ADV.? GO.53.V)))
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
			(?X_H (?X_L ((ADV-A (FROM.P ?L1)) GO.53.V) ?L2))
			(?X_F (?X_A (BE.V (K (L X (AND (X EARLY.A) (X MORNING.N)))))))
			(?X_D (?X_M ((ADV-A (FROM.P ?X_N)) RUN.27.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_D)))
			(!W3 (?X_F (BEFORE ?X_D)))
		)
	)
	(
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
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.20.V (KA (GO.V (K SWIMMING.N)))) ** ?X_B)
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
	(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA-248.PR ?X_E (KA (GO.V (K SWIMMING.N))))) ** ?E)
		(:ROLES
			(!R1 ((KA (GO.V (K SWIMMING.N))) ACTION.N))
			(!R2 (?X_E DESTINATION.N))
			(!R3 (?X_E LAKE.N))
			(!R4 (?X_F AGENT.N))
		)
		(:STEPS
			(?X_D (?X_F ENJOY_ACTION.20.V (KA (GO.V (K SWIMMING.N)))))
			(?X_B (?X_F ((ADV-A (FROM.P ?L1)) GO.54.V) ?X_E))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
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
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A HOMEWORK.N))
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
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.56.V) ?X_B) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_B DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_B)))
			(!R5 (?X_B RESTAURANT.N))
			(!R6 (?X_B NEW.A))
			(!R7 (?X_B (IN.P (K TOWN.N))))
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
			(!R4 (?X_F RESTAURANT.N))
			(!R5 (?X_F NEW.A))
			(!R6 (?X_F (IN.P (K TOWN.N))))
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
	)
)



(
	(EPI-SCHEMA ((?X_A GET.46.V (K MAD.A)) ** ?X_B)
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
			(?X_F (?X_L GET.46.V (K MAD.A)))
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
	(EPI-SCHEMA ((?X_A GET.47.V
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
	   (?X_M GET.47.V
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
	(EPI-SCHEMA ((?X_A ((MAY.AUX TAKE.22.V) ?X_B)) ** ?X_C)
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
			(?X_H (?X_P ((MAY.AUX TAKE.22.V) ?X_Q)))
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
	)
)



(
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.22.V (KA (HUNT.N (K (PLUR BUG.N))))) ** ?X_C)
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
			(?X_H (?X_J ENJOY_ACTION.22.V (KA (HUNT.N (K (PLUR BUG.N))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C BEFORE ?X_H))
		)
	)
	(
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
	(EPI-SCHEMA ((?X_C TAKE.23.V ?X_D) ** ?X_E)
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
			(?X_B (?X_G TAKE.23.V ?X_H))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-261.PR ?X_J ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_E LONG.A))
			(!R2 (?X_E DAY.N))
			(!R3 (?X_J HOUSE.N))
			(!R4 (?X_M AGENT.N))
			(!R5 (?X_N (PLUR GAME.N)))
			(!R6 (NOT (?X_N AGENT.N)))
		)
		(:STEPS
			(?X_L ((ADV-E (DURING (RAIN.V (ALL.D DAY.N) (K YESTERDAY.N)))) (?X_A BE.V)))
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
	)
)



(
	(EPI-SCHEMA ((?X_A TAKE.24.V ?X_B) ** ?X_C)
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



(
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-262.PR (K COFFEE.N) ?X_A ?X_J)) ** ?E)
		(:ROLES
			(!R1 (?X_H NICE.A))
			(!R2 (?X_H AGENT.N))
			(!R3 (?X_G (PERTAIN-TO ?X_H)))
			(!R4 (?X_I AGENT.N))
			(!R5 (?X_J TURN.N))
			(!R6 (?X_J SHARP.A))
			(!R7 (NOT (?X_J AGENT.N)))
			(!R8 (NOT (?X_I = ?X_J)))
		)
		(:STEPS
			(?X_F (?X_H (HOLD.V (K COFFEE.N))))
			(?X_D (?X_I TAKE.24.V ?X_J))
			(?X_B (?X_H (ABOUT.P ?X_A)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_D)))
			(!W2 (?X_F (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.58.V) ?L2) ** ?X_C)
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.58.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.58.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.58.V) ?L2))
			(?X_C (?X_B ((ADV-A (WITH.P ?X_A)) GO.58.V)))
			(?X_C (?X_B GO.58.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? GO.58.V)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.59.V) ?L2) ** ?X_D)
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
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.59.V)))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.59.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.59.V) ?L2))
			(?X_D (?X_B ((ADV-A (WITH.P ?X_A)) GO.59.V)))
			(?X_D (?X_B GO.59.V ?L2))
			(?X_D (?X_B (LOCATION_ADV.? GO.59.V)))
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
	              (COMPOSITE-SCHEMA-263.PR (KA ((ADV-A (TO.P ?X_I)) GO.V)) ?X_J
	               (TWO.D (L X (AND (X DIFFERENT.A) (X (PLUR MOVIE.N))))) ?L2))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J FRIEND.N))
			(!R2 (?X_I (PLUR MOVIE.N)))
			(!R3 (?X_J (PERTAIN-TO ?X_K)))
			(!R4 (?X_K AGENT.N))
			(!R5 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_H (?X_K (WANT.V (KA ((ADV-A (TO.P ?X_I)) GO.V)))))
			(?X_F (?X_K (WITH.P ?X_J)))
			(?X_B (?X_K ((ADV-A (FROM.P ?L1)) GO.58.V) ?L2))
			(?X_B (?X_K ((ADV-A (FROM.P ?L1)) GO.59.V) ?L2))
			(?X_D (?X_K (SEE.V (TWO.D (L X (AND (X DIFFERENT.A) (X (PLUR MOVIE.N))))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_B)))
			(!W2 (?X_H (BEFORE ?X_D)))
			(!W3 (?X_F (BEFORE ?X_B)))
			(!W4 (?X_F (BEFORE ?X_D)))
			(!W5 (?X_B (BEFORE ?X_D)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_E ((ADV-A (FROM.P ?L1)) STUMBLE.1.V) ?L2) ** ?X_F)
		(:ROLES
			(!R1 (?X_E PONY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_D LARGE.A))
			(!R6 (?X_D ROCK.N))
			(!R7 (?X_A AGENT.N))
			(!R8 (?X_E (PERTAIN-TO ?X_A)))
			(!R9 (?X_C HOUSE.N))
			(!R10 (?X_C (PERTAIN-TO ?X_A)))
			(!R11 (?X_B (PLUR HILL.N)))
			(!R12 (?X_B (NEAR.P ?X_C)))
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
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) STUMBLE.1.V)))
			(?X_F
	   (?X_E
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) STUMBLE.1.V))))
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) STUMBLE.1.V) ?L2))
			(?X_F (?X_E ((ADV-A (ON.P ?X_D)) STUMBLE.1.V)))
			(?X_F (?X_E STUMBLE.1.V ?L2))
			(?X_F (?X_E (LOCATION_ADV.? STUMBLE.1.V)))
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
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?L1)) RIDE.2.V) ?L2) ** ?X_E)
		(:ROLES
			(!R1 (?X_D AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_C (PLUR HILL.N)))
			(!R6 (?X_A PONY.N))
			(!R7 (?X_A (PERTAIN-TO ?X_D)))
			(!R8 (?X_B (PERTAIN-TO ?X_D)))
			(!R9 (?X_B HOUSE.N))
			(!R10 (?X_C (NEAR.P ?X_B)))
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RIDE.2.V)))
			(?X_E
	   (?X_D ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RIDE.2.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) RIDE.2.V) ?L2))
			(?X_E (?X_D ((ADV-A (OVER.P ?X_C)) RIDE.2.V)))
			(?X_E (?X_D RIDE.2.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? RIDE.2.V)))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-264.PR ?X_K ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_C LARGE.A))
			(!R2 (?X_C ROCK.N))
			(!R3 (?X_H (PLUR HILL.N)))
			(!R4 (?X_K (PERTAIN-TO ?X_J)))
			(!R5 (?X_I HOUSE.N))
			(!R6 (?X_I (PERTAIN-TO ?X_J)))
			(!R7 (?X_H (NEAR.P ?X_I)))
			(!R8 (?X_J AGENT.N))
			(!R9 (?X_K PONY.N))
			(!R10 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_G (?X_J (HAVE.V ?X_K)))
			(?X_E (?X_J ((ADV-A (FROM.P ?L1)) RIDE.2.V) ?L2))
			(?X_B (?X_K ((ADV-A (FROM.P ?L1)) STUMBLE.1.V) ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
			(!W2 (?X_G (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A ((BACK.ADV GET.48.V) ?O)) ** ?X_B)
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
	(EPI-SCHEMA ((?X_A ((BACK.ADV GET.48.V) ?O)) ** ?X_B)
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
	(EPI-SCHEMA ((?X_P
	              (COMPOSITE-SCHEMA-265.PR ?X_O
	               (K
	                (L X (AND (X IPAD.N) (X (HAS-DET.PR (IND A.D))) (X NEWER.A))))
	               ?O))
	             ** ?E)
		(:ROLES
			(!R1 (?X_J STORE.N))
			(!R2 (?X_O IPAD.N))
			(!R3 (?X_P AGENT.N))
			(!R4 (NOT (?O AGENT.N)))
			(!R5 (NOT (?X_P = ?O)))
		)
		(:STEPS
			(?X_N (?X_P (WANT.V ?X_O)))
			(?X_L (?X_P ((REALLY.ADV LIKE.V) ?X_O)))
			(?X_I (?X_P ((ADV-A (TO.P ?X_J)) GO.V)))
			(?X_B (?X_P ((BACK.ADV GET.48.V) ?O)))
			(?X_E
	   (?X_P
	    (HAVE.V (K (L X (AND (X IPAD.N) (X (HAS-DET.PR (IND A.D))) (X NEWER.A)))))))
			(?X_C (?X_P ((BACK.ADV GET.48.V) ?O)))
			(?X_G
	   (?X_P
	    (HAVE.V (K (L X (AND (X IPAD.N) (X (HAS-DET.PR (IND A.D))) (X NEWER.A)))))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_N (BEFORE ?X_L)))
			(!W2 (?X_N (BEFORE ?X_I)))
			(!W3 (?X_N (BEFORE ?X_E)))
			(!W4 (?X_N (BEFORE ?X_G)))
			(!W5 (?X_L (BEFORE ?X_I)))
			(!W6 (?X_L (BEFORE ?X_E)))
			(!W7 (?X_L (BEFORE ?X_G)))
			(!W8 (?X_I (BEFORE ?X_E)))
			(!W9 (?X_I (BEFORE ?X_G)))
			(!W10 (?X_B (BEFORE ?X_E)))
			(!W11 (?X_C (BEFORE ?X_G)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.13.V (KA HELP.V)) ** ?X_B)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 ((KA HELP.V) ACTION.N))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA HELP.V) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_B (?X_A (WANT.V (KA HELP.V))))
			(?X_B (?X_A (LIKE.V (KA HELP.V))))
			(?X_B (?X_A (LOVE.V (KA HELP.V))))
			(?X_B (?X_A (ENJOY.V (KA HELP.V))))
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-266.PR ?X_F ?X_L
	               (KA (STAY.V (L X (AND (X OUT.P) (X (OF.P (THE.D WAY.N)))))))
	               (KA HELP.V)))
	             ** ?E)
		(:ROLES
			(!R1 (?X_F (PLUR COP.N)))
			(!R2 (?X_K TRAGEDY.N))
			(!R3 (?X_L MAN.N))
			(!R4 ((KA HELP.V) ACTION.N))
		)
		(:STEPS
			(?X_J (?X_L ((ADV-A (ABOUT.P ?X_K)) HEAR.V)))
			(?X_E (?X_L (CALL.V ?X_F)))
			(?X_C
	   (?X_F
	    (TELL.V ?X_L (KA (STAY.V (L X (AND (X OUT.P) (X (OF.P (THE.D WAY.N))))))))))
			(?X_H (?X_L ENJOY_ACTION.13.V (KA HELP.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_J (BEFORE ?X_E)))
			(!W2 (?X_J (BEFORE ?X_C)))
			(!W3 (?X_E (BEFORE ?X_C)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_F ((ADV-A (FROM.P ?L1)) RUN.28.V) ?L2) ** ?X_G)
		(:ROLES
			(!R1 (?X_F AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_E DOG.N))
			(!R6 (?X_F (KA LET.V) ((ADV-A (OF.P ?X_B)) GO.V)))
			(!R7 (?X_E (PERTAIN-TO ?X_F)))
			(!R8 (?X_D (PERTAIN-TO ?X_F)))
			(!R9 (?X_D THIGH.N))
			(!R10 (?X_A SCAR.N))
			(!R11 (?X_F ((STILL.ADV HAVE.V) ?X_A)))
			(!R12 (?X_B LEASH.N))
			(!R13 (?X_C CUT.N))
			(!R14 (?X_C (ON.P ?X_D)))
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
		(:PARAPHRASES
			(?X_G (?X_F ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.28.V)))
			(?X_G
	   (?X_F ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.28.V))))
			(?X_G (?X_F ((ADV-A (DESTINATION_PREP.? ?L2)) RUN.28.V) ?L2))
			(?X_G (?X_F ((ADV-A (AFTER.P ?X_E)) RUN.28.V)))
			(?X_G (?X_F RUN.28.V ?L2))
			(?X_G (?X_F (LOCATION_ADV.? RUN.28.V)))
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
	(EPI-SCHEMA ((?X_F (((ADV-A (FROM.P ?X_A)) GET.5.V) ?X_G)) ** ?X_H)
		(:ROLES
			(!R1 (?X_F AGENT.N))
			(!R2 (NOT (?X_G AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_F = ?X_G)))
			(!R5 (?X_A BRANCH.N))
			(!R6 (?X_G CUT.N))
			(!R7 (?X_F (KA LET.V) ((ADV-A (OF.P ?X_E)) GO.V)))
			(!R8 (?X_B THIGH.N))
			(!R9 (?X_B (PERTAIN-TO ?X_F)))
			(!R10 (?X_G (ON.P ?X_B)))
			(!R11 (?X_C (PERTAIN-TO ?X_F)))
			(!R12 (?X_C DOG.N))
			(!R13 (?X_D SCAR.N))
			(!R14 (?X_F ((STILL.ADV HAVE.V) ?X_D)))
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
			(!W1 (?I1 PRECOND-OF ?X_H))
			(!W2 (?I2 PRECOND-OF ?X_H))
			(!W3 (?I3 PRECOND-OF ?X_H))
			(!W4 (?P1 POSTCOND-OF ?X_H))
			(!W5 (?X_H (AT-ABOUT ?X_I)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
			(!N2 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-267.PR ?X_G ?L2 ?X_M)) ** ?E)
		(:ROLES
			(!R1 (?X_G DOG.N))
			(!R2 (?X_L (KA LET.V) ((ADV-A (OF.P ?X_J)) GO.V)))
			(!R3 (?X_G (PERTAIN-TO ?X_L)))
			(!R4 (?X_H THIGH.N))
			(!R5 (?X_H (PERTAIN-TO ?X_L)))
			(!R6 (?X_M (ON.P ?X_H)))
			(!R7 (?X_I SCAR.N))
			(!R8 (?X_L ((STILL.ADV HAVE.V) ?X_I)))
			(!R9 (?X_J LEASH.N))
			(!R10 (?L2 DESTINATION.N))
			(!R11 (?X_M CUT.N))
			(!R12 (?X_K BRANCH.N))
			(!R13 (?X_L AGENT.N))
			(!R14 (NOT (?X_M AGENT.N)))
			(!R15 (NOT (?X_L = ?X_M)))
		)
		(:STEPS
			(?X_F (?X_L (WALK.V ?X_G)))
			(?X_D (?X_L ((ADV-A (FROM.P ?L1)) RUN.28.V) ?L2))
			(?X_B (?X_L (((ADV-A (FROM.P ?X_K)) GET.5.V) ?X_M)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_F (BEFORE ?X_D)))
			(!W2 (?X_F (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) LEAVE.3.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C (PERTAIN-TO ?X_B)))
			(!R6 (?X_C WINDOW.N))
			(!R7 (?X_A CAT.N))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
			(!R9 (?X_C OPEN.N))
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
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) LEAVE.3.V)))
			(?X_D
	   (?X_B
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) LEAVE.3.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) LEAVE.3.V) ?X_C))
			(?X_D (?X_B LEAVE.3.V))
			(?X_D (?X_B (LEAVE.3.V ?X_C)))
			(?X_D (?X_B (LOCATION_ADV.? LEAVE.3.V)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) LEAVE.4.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C (PERTAIN-TO ?X_B)))
			(!R6 (?X_C WINDOW.N))
			(!R7 (?X_A CAT.N))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
			(!R9 (?X_C OPEN.N))
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
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) LEAVE.4.V)))
			(?X_D
	   (?X_B
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) LEAVE.4.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) LEAVE.4.V) ?X_C))
			(?X_D (?X_B LEAVE.4.V))
			(?X_D (?X_B (LEAVE.4.V ?X_C)))
			(?X_D (?X_B (LOCATION_ADV.? LEAVE.4.V)))
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
	(EPI-SCHEMA ((?X_U
	              (COMPOSITE-SCHEMA-268.PR ?X_P
	               (K (L X (AND (X OUT.P) (X (OF.P (THE.D HOUSE.N))))))
	               (K (PLUR POSTER.N)) ?X_S ?X_U ?X_T))
	             ** ?E)
		(:ROLES
			(!R1 (?X_K PERSON.N))
			(!R2 (?X_P HOUSE.N))
			(!R3 (?X_S CAT.N))
			(!R4 (?X_S (PERTAIN-TO ?X_U)))
			(!R5 (?X_T DESTINATION.N))
			(!R6 (?X_T (PERTAIN-TO ?X_U)))
			(!R7 (?X_T WINDOW.N))
			(!R8 (?X_T OPEN.N))
			(!R9 (?X_U AGENT.N))
		)
		(:STEPS
			(?X_B (?X_S OUT.P))
			(?X_C (?X_S (OF.P ?X_P)))
			(?X_O (?X_U (FOR.P ?X_S)))
			(?X_M
	   (?X_U
	    ((UP.PRT ((ADV-A (FOR.P (KA (FIND.V ?X_S)))) PUT.V)) (K (PLUR POSTER.N)))))
			(?X_J (?X_K ?X_U (WITH.P ?X_S)))
			(?X_R (?X_U ((ADV-A (FROM.P ?L1)) LEAVE.4.V) ?X_T))
			(?X_D (?X_U ((ADV-A (FROM.P ?L1)) LEAVE.3.V) ?X_T))
			(?X_E (?X_S (GET.V (K (L X (AND (X OUT.P) (X (OF.P (THE.D HOUSE.N)))))))))
			(?X_F (?X_U ((ADV-A (FOR.P ?X_S)) LOOK.V)))
			(?X_G
	   (?X_U
	    ((UP.PRT ((ADV-A (FOR.P (KA (FIND.V ?X_S)))) PUT.V)) (K (PLUR POSTER.N)))))
			(?X_H (?X_K (((ADV-A (WITH.P ?X_S)) CALL.V) ?X_U)))
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
	)
)



(
	(EPI-SCHEMA (((K SUSIE.N) (COMPOSITE-SCHEMA-269.PR ?X_H ?X_I)) ** ?E)
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
	)
)



(
	(EPI-SCHEMA ((?X_A
	              (COMPOSITE-SCHEMA-270.PR ?X_D (KA (FAST.ADV (PASV DRIVE.V)))
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
			(?X_C (?X_B RETURN.1.V ?L2))
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
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.30.V ?X_C ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_B BOY.N))
			(!R2 (?X_C BROTHER.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_A BIRD.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_C (PERTAIN-TO ?X_C)))
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
			(?X_D (?X_B (TAKE.V ?X_C)))
			(?X_D (?X_B CARRY.V ?X_C))
			(?X_D (?X_B BRING.V ?X_C))
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
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.31.V ?X_C ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_B BOY.N))
			(!R2 (?X_C CAGE.N))
			(!R3 (?X_C SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A BIRD.N))
			(!R8 (?L2 HOME.N))
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
			(!W3 (?X_D (AT-ABOUT ?X_E)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) LEAVE.5.V) (K SCHOOL.N)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B BOY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K SCHOOL.N) DESTINATION.N))
			(!R4 (NOT (?L1 = (K SCHOOL.N))))
			(!R5 (?X_A BIRD.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
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
	     ((ADV-A (FOR.P (K SCHOOL.N))) LEAVE.5.V))))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (K SCHOOL.N))) LEAVE.5.V))))
			(?X_C
	   (?X_B ((ADV-A (DESTINATION_PREP.? (K SCHOOL.N))) LEAVE.5.V) (K SCHOOL.N)))
			(?X_C (?X_B LEAVE.5.V))
			(?X_C (?X_B LEAVE.5.V (K SCHOOL.N)))
			(?X_C (?X_B (LOCATION_ADV.? LEAVE.5.V)))
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
	(EPI-SCHEMA ((?X_Q (COMPOSITE-SCHEMA-271.PR ?X_O ?X_P ?L2 (K SCHOOL.N))) ** ?E)
		(:ROLES
			(!R1 (?X_N BIRD.N))
			(!R2 (?X_N (PERTAIN-TO ?X_Q)))
			(!R3 ((K SCHOOL.N) DESTINATION.N))
			(!R4 (?X_O BROTHER.N))
			(!R5 (?X_O SMALLER-THAN.N ?X_Q))
			(!R6 (?X_O (PERTAIN-TO ?X_O)))
			(!R7 (?X_P CAGE.N))
			(!R8 (?X_P SMALLER-THAN.N ?X_Q))
			(!R9 (?X_Q BOY.N))
			(!R10 (?L2 DESTINATION.N))
			(!R11 (?L2 HOME.N))
		)
		(:STEPS
			(?X_M (?X_Q (LOCK.V ?X_P)))
			(?X_C (?X_Q (CATCH.V ?X_O)))
			(?X_K (?X_Q ((ADV-A (FROM.P ?L1)) LEAVE.5.V) (K SCHOOL.N)))
			(?X_I (?X_Q ((ADV-A (FROM.P ?L1)) RETURN.1.V) ?L2))
			(?X_I (?X_Q TRANSPORT_OBJECT.30.V ?X_O ?L2))
			(?X_I (?X_Q TRANSPORT_OBJECT.31.V ?X_P ?L2))
			(?X_G (?X_P UNLOCK.V))
			(?X_E (?X_P UNLOCK.V))
			(?X_A (?X_Q (KA CATCH.V) ?X_O ((ADV-A (WITH.P ?X_N)) PLAY.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_M (BEFORE ?X_K)))
			(!W2 (?X_M (BEFORE ?X_I)))
			(!W3 (?X_M (BEFORE ?X_G)))
			(!W4 (?X_M (BEFORE ?X_E)))
			(!W5 (?X_M (BEFORE ?X_A)))
			(!W6 (?X_C (BEFORE ?X_A)))
			(!W7 (?X_K (BEFORE ?X_I)))
			(!W8 (?X_K (BEFORE ?X_G)))
			(!W9 (?X_K (BEFORE ?X_E)))
			(!W10 (?X_K (BEFORE ?X_A)))
			(!W11 (?X_I (BEFORE ?X_G)))
			(!W12 (?X_I (BEFORE ?X_E)))
			(!W13 (?X_I (BEFORE ?X_A)))
			(!W14 (?X_G (BEFORE ?X_A)))
			(!W15 (?X_E (BEFORE ?X_A)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_B ENJOY_ACTION.34.V (KA (TAKE.V ?X_C))) ** ?X_D)
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
	              (COMPOSITE-SCHEMA-272.PR
	               (KE (AND (?X_H READY.A) (?X_H (FOR.P ?X_L)))) ?X_K
	               (KA (TAKE.V ?X_M))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_E BATH.N))
			(!R2 (?X_H BATH.N))
			(!R3 (?X_H WATER.N))
			(!R4 (?X_K AGENT.N))
			(!R5 (?X_L (PERTAIN-TO ?X_K)))
			(!R6 (?X_M BATH.N))
			(!R7 (?X_L DOG.N))
			(!R8 ((KA (TAKE.V ?X_M)) ACTION.N))
		)
		(:STEPS
			(?X_G (?X_K (GOT.V (KE (AND (?X_H READY.A) (?X_H (FOR.P ?X_L)))))))
			(?X_D (?X_L ((ADV-A (INTO.P ?X_E)) JUMP.V)))
			(?X_B (?X_L (((ADV-A (WITH.P (K WATER.N))) SPLASH.V) ?X_K)))
			(?X_J (?X_L ENJOY_ACTION.34.V (KA (TAKE.V ?X_M))))
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
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-273.PR ?X_C ?X_F)) ** ?E)
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
	)
)



(
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.32.V ?X_B ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_A BIRD.N))
			(!R2 (?X_B WORM.N))
			(!R3 (?X_B SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_C DESTINATION.N))
			(!R6 (?X_C NEST.N))
			(!R7 (?X_C (PERTAIN-TO ?X_A)))
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
			(?X_E (?X_A (((ADV-A (TO.P ?X_C)) TAKE.V) ?X_B)))
			(?X_E (?X_A ((ADV-A (TO.P ?X_C)) CARRY.V) ?X_B))
			(?X_E (?X_A ((ADV-A (TO.P ?X_C)) BRING.V) ?X_B))
			(?X_E (?X_A (LOCATION_ADV.? TAKE.V) ?X_B))
			(?X_E (?X_A (LOCATION_ADV.? CARRY.V) ?X_B))
			(?X_E (?X_A (LOCATION_ADV.? BRING.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 PRECOND-OF ?X_E))
			(!W2 (?P1 POSTCOND-OF ?X_E))
			(!W3 (?X_E (RIGHT-AFTER ?X_D)))
			(!W4 (?X_E (SAME-TIME ?X_G)))
			(!W5 (?X_F (BEFORE ?X_G)))
		)
		(:NECESSITIES
			(!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (TO.P ?X_A)) TAKE.25.V) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B BIRD.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_A NEST.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_C WORM.N))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-274.PR (ANOTHER.D WORM.N) ?X_K ?X_M)) ** ?E)
		(:ROLES
			(!R1 (?X_F (STILL.ADV HUNGRY.A)))
			(!R2 (?X_F BABY.N))
			(!R3 (?X_F BIRD.N))
			(!R4 (?X_K DESTINATION.N))
			(!R5 (?X_M SMALLER-THAN.N ?X_L))
			(!R6 (?X_K NEST.N))
			(!R7 (?X_K (PERTAIN-TO ?X_L)))
			(!R8 (?X_M WORM.N))
			(!R9 (?X_L BIRD.N))
			(!R10 (NOT (?X_L = ?X_M)))
		)
		(:STEPS
			(?X_J (?X_L (CATCH.V ?X_M)))
			(?X_H (?X_L ?X_M (TO.P ?X_K)))
			(?X_A (?X_L TRANSPORT_OBJECT.32.V ?X_M ?X_K))
			(?X_A (?X_L (((ADV-A (TO.P ?X_K)) TAKE.25.V) ?X_M)))
			(?X_E (?X_L (((ADV-A (TO.P ?X_F)) FED.V) ?X_M)))
			(?X_C (?X_L (CATCH.V (ANOTHER.D WORM.N))))
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
	)
)



(
	(EPI-SCHEMA ((?X_D EAT.8.V ?X_C) ** ?X_E)
		(:ROLES
			(!R1 (?X_D MONKEY.N))
			(!R2 (?X_C FOOD.N))
			(!R3 (?X_D BROWN.A))
			(!R4 (?X_C COCOANUT.N))
			(!R5 (?X_A MONKEY.N))
			(!R6 (?X_A (HAS.V ?X_C)))
			(!R7 (?X_B LARGE.A))
			(!R8 (?X_B TAIL.N))
			(!R9 (?X_D (HAS.V ?X_B)))
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
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-275.PR ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_D MONKEY.N))
			(!R2 (?X_D (HAS.V ?X_I)))
			(!R3 (?X_E LARGE.A))
			(!R4 (?X_E TAIL.N))
			(!R5 (?X_H (HAS.V ?X_E)))
			(!R6 (?X_H MONKEY.N))
			(!R7 (?X_H BROWN.A))
			(!R8 (?X_I FOOD.N))
			(!R9 (?X_I COCOANUT.N))
		)
		(:STEPS
			(?X_C (?X_H (LIKE.V ?X_I)))
			(?X_A (?X_H EAT.8.V ?X_I))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_C (BEFORE ?X_A)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA-276.PR ?X_F ?X_L ?X_M)) ** ?E)
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) RUN.23.V)
	              (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N)))))))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((K (L X (AND (X OUT.P) (X (OF.P (K GAS.N)))))) DESTINATION.N))
			(!R4 (NOT (?L1 = (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N)))))))))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A PHONE.N))
		)
		(:GOALS
			(?G1
	   (?X_B
	    (WANT.V
	     (KA
	      ((ADV-A (AT.P (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N)))))))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N))))))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N)))))))))
		)
		(:PARAPHRASES
			(?X_D
	   (?X_B
	    ((ADV-A
	      (DESTINATION_PREP.? (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N))))))))
	     RUN.23.V)))
			(?X_D
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A
	       (DESTINATION_PREP.? (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N))))))))
	      RUN.23.V))))
			(?X_D
	   (?X_B
	    ((ADV-A
	      (DESTINATION_PREP.? (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N))))))))
	     RUN.23.V)
	    (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N))))))))
			(?X_D (?X_B RUN.23.V))
			(?X_D (?X_B RUN.23.V (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N))))))))
			(?X_D (?X_B (LOCATION_ADV.? RUN.23.V)))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) WALK.7.V) (TEN.D (PLUR MILE.N))) **
	             ?X_C)
		(:ROLES
			(!R1 (?X_B MAN.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 ((TEN.D (PLUR MILE.N)) DESTINATION.N))
			(!R4 (NOT (?L1 = (TEN.D (PLUR MILE.N)))))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
			(!R6 (?X_A PHONE.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P (TEN.D (PLUR MILE.N)))) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P (TEN.D (PLUR MILE.N))))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P (TEN.D (PLUR MILE.N)))))
		)
		(:PARAPHRASES
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? (TEN.D (PLUR MILE.N)))) WALK.7.V)))
			(?X_C
	   (?X_B
	    ((ADV-A (FROM.P ?L1))
	     ((ADV-A (DESTINATION_PREP.? (TEN.D (PLUR MILE.N)))) WALK.7.V))))
			(?X_C
	   (?X_B ((ADV-A (DESTINATION_PREP.? (TEN.D (PLUR MILE.N)))) WALK.7.V)
	    (TEN.D (PLUR MILE.N))))
			(?X_C (?X_B WALK.7.V))
			(?X_C (?X_B WALK.7.V (TEN.D (PLUR MILE.N))))
			(?X_C (?X_B (LOCATION_ADV.? WALK.7.V)))
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
	(EPI-SCHEMA ((?X_L
	              (COMPOSITE-SCHEMA-277.PR (KA ((ADV-A (FOR.P (K HELP.N))) CALL.V))
	               ?X_C (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N))))))
	               (TEN.D (PLUR MILE.N))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_C GAS.N))
			(!R2 (?X_C STATION.N))
			(!R3 (?X_J PHONE.N))
			(!R4 (?X_J (PERTAIN-TO ?X_L)))
			(!R5 ((K (L X (AND (X OUT.P) (X (OF.P (K GAS.N)))))) DESTINATION.N))
			(!R6 (?X_L MAN.N))
			(!R7 ((TEN.D (PLUR MILE.N)) DESTINATION.N))
		)
		(:STEPS
			(?X_I
	   (?X_L ((ADV-A (FROM.P ?L1)) RUN.23.V)
	    (K (L X (AND (X OUT.P) (X (OF.P (K GAS.N))))))))
			(?X_G (?X_L (TRY.V (KA ((ADV-A (FOR.P (K HELP.N))) CALL.V)))))
			(?X_E (?X_L ((ADV-A (FROM.P ?L1)) WALK.7.V) (TEN.D (PLUR MILE.N))))
			(?X_B (?X_L (FIND.V ?X_C)))
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
	)
)



(
	(EPI-SCHEMA ((?X_A ((ADV-A (FROM.P ?L1)) GO.60.V) (K LUNCH.N)) ** ?X_B)
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
	      ((ADV-A (TO.P (K LUNCH.N))) GO.60.V)))))
			(?X_B
	   (?X_A
	    ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? (K LUNCH.N))) GO.60.V))))
			(?X_B (?X_A ((ADV-A (DESTINATION_PREP.? (K LUNCH.N))) GO.60.V) (K LUNCH.N)))
			(?X_B (?X_A GO.60.V))
			(?X_B (?X_A GO.60.V (K LUNCH.N)))
			(?X_B (?X_A (LOCATION_ADV.? GO.60.V)))
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
	(EPI-SCHEMA ((?X_A GET.49.V ?X_B) ** ?X_C)
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
	(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA-278.PR ?X_C (K LUNCH.N) ?X_I)) ** ?E)
		(:ROLES
			(!R1 (?X_C LOT.N))
			(!R2 (?X_C (OF.P (K WATER.N))))
			(!R3 ((K LUNCH.N) DESTINATION.N))
			(!R4 (?X_H AGENT.N))
			(!R5 (?X_I GOOD.A))
			(!R6 (?X_I SALTY.A))
			(!R7 (?X_I GUMBO.N))
			(!R8 (NOT (?X_I AGENT.N)))
			(!R9 (NOT (?X_H = ?X_I)))
		)
		(:STEPS
			(?X_G (?X_H ((ADV-A (FROM.P ?L1)) GO.60.V) (K LUNCH.N)))
			(?X_E (?X_H GET.49.V ?X_I))
			(?X_B (?X_H (DRANK.V ?X_C)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
			(!W2 (?X_G (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A COMPOSITE-SCHEMA-279.PR) ** ?E)
		(:ROLES
			(!R1 (?X_A MARKET.N))
		)
		(:STEPS
			(?X_C (?X_A RALLY.V))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.35.V (KA (ASK.V ?X_B (KA (COURT.V ?X_B))))) **
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
	(EPI-SCHEMA ((?X_A INFORM.17.V ?X_B ?I) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
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
	(EPI-SCHEMA ((?X REQUEST_ACTION.36.V ?X_A
	              (KA (MAKE.V (KE (?X_B OFFICIAL.A)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X AGENT.N))
			(!R2 (?X_A AGENT.N))
			(!R3 ((KA (MAKE.V (KE (?X_B OFFICIAL.A)))) ACTION.N))
		)
		(:GOALS
			(?G1 (?X (WANT.V ?X_A (KA (MAKE.V (KE (?X_B OFFICIAL.A)))))))
			(?G2 (?X (WANT.V (THAT (?X (MAKE.V (KE (?X_B OFFICIAL.A))))))))
		)
		(:STEPS
			(?E1 (?X (ASK.V ?X_A (KA (MAKE.V (KE (?X_B OFFICIAL.A)))))))
			(?X_C (?X_A (MAKE.V (KE (?X_B OFFICIAL.A)))))
		)
		(:PARAPHRASES
			(?E (?X (ASK.V ?X_A (KA (MAKE.V (KE (?X_B OFFICIAL.A)))))))
			(?E (?X (TELL.V ?X_A (KA (MAKE.V (KE (?X_B OFFICIAL.A)))))))
			(?E (?X (MAKE.V ?X_A (KA (MAKE.V (KE (?X_B OFFICIAL.A)))))))
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
	(EPI-SCHEMA ((?X_A MAKE.8.V (KE (?X_B OFFICIAL.A))) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (NOT ((KE (?X_B OFFICIAL.A)) AGENT.N)))
		)
		(:GOALS
			(?G1 (?X_A (WANT.V (THAT ((KE (?X_B OFFICIAL.A)) EXIST.V)))))
			(?G2 (?X_A (WANT.V (KA (HAVE.V (KE (?X_B OFFICIAL.A)))))))
		)
		(:PRECONDS
			(?I1 (NOT ((KE (?X_B OFFICIAL.A)) EXIST.V)))
		)
		(:POSTCONDS
			(?P1 ((KE (?X_B OFFICIAL.A)) EXIST.V))
			(?P2 (?X_A (HAVE.V (KE (?X_B OFFICIAL.A)))))
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
	(EPI-SCHEMA ((?X_I
	              (COMPOSITE-SCHEMA-280.PR ?X_K (KA (ASK.V ?X_K (KA (COURT.V ?X_K))))
	               ?X_J ?I ?X_L (KA (MAKE.V (KE (?X_M OFFICIAL.A))))
	               (KE (?X_M OFFICIAL.A))))
	             ** ?E)
		(:ROLES
			(!R1 ((KA (ASK.V ?X_K (KA (COURT.V ?X_K)))) ACTION.N))
			(!R2 (?X_I AGENT.N))
			(!R3 (?X_I (SO.ADV EXCITED.A)))
			(!R4 (?X_J AGENT.N))
			(!R5 (NOT (?I ACTION.N)))
			(!R6 (?X_K AGENT.N))
			(!R7 (?I INFORMATION.N))
			(!R8 ((KA (MAKE.V (KE (?X_M OFFICIAL.A)))) ACTION.N))
			(!R9 (?X AGENT.N))
			(!R10 (?X_L AGENT.N))
			(!R11 (NOT ((KE (?X_M OFFICIAL.A)) AGENT.N)))
		)
		(:STEPS
			(?X_H (?X_I (LIKE.V ?X_K)))
			(?X_F (?X_I ENJOY_ACTION.35.V (KA (ASK.V ?X_K (KA (COURT.V ?X_K))))))
			(?X_D (?X_K INFORM.17.V ?X_J ?I))
			(?E_1 (?X REQUEST_ACTION.36.V ?X_L (KA (MAKE.V (KE (?X_M OFFICIAL.A))))))
			(?X_B (?X_L MAKE.8.V (KE (?X_M OFFICIAL.A))))
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
	)
)



(
	(EPI-SCHEMA ((?X_A REQUEST_ACTION.33.V ?X_B ?A) ** ?X_E)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B DAD.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_B (PERTAIN-TO ?X_A)))
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
	(EPI-SCHEMA ((?X_A INFORM.18.V ?X_B ?I) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B DAD.N))
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
			(!W1 (?X_C (BEFORE ?X_D)))
			(!W2 (?X_E (SAME-TIME ?X_D)))
			(!W3 (?X_E (RIGHT-AFTER ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_A INFORM.19.V ?X_B ?I) ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 (?X_B DAD.N))
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
			(?X_D (?X_A TELL.V ?X_B ?I))
			(?X_D (?X_A LET.V ?X_B (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (RIGHT-AFTER ?X_C)))
			(!W2 (?X_D (SAME-TIME ?X_F)))
			(!W3 (?X_E (BEFORE ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-281.PR ?X_I ?X_K (KA (INVEST.V ?X_I)) ?A ?X_J ?I))
	             ** ?E)
		(:ROLES
			(!R1 (?X_I SURPRISE.N))
			(!R2 (?X_I MONEY.N))
			(!R3 (?A ACTION.N))
			(!R4 (?X_J DAD.N))
			(!R5 (?X_J (PERTAIN-TO ?X_K)))
			(!R6 (?X_K AGENT.N))
			(!R7 (NOT (?I ACTION.N)))
			(!R8 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_H ((K BILL.N) (GET.V ?X_I)))
			(?X_D (?X_J (TELL.V ?X_K (KA (INVEST.V ?X_I)))))
			(?X_F (?X_K INFORM.18.V ?X_J ?I))
			(?X_A (?X_K REQUEST_ACTION.33.V ?X_J ?A))
			(?X_A (?X_K INFORM.19.V ?X_J ?I))
			(?X_B (?X_J (TELL.V ?X_K (KA (INVEST.V ?X_I)))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_A)))
			(!W2 (?X_H (BEFORE ?X_B)))
			(!W3 (?X_D (BEFORE ?X_B)))
			(!W4 (?X_F (BEFORE ?X_A)))
			(!W5 (?X_F (BEFORE ?X_B)))
			(!W6 (?X_A (BEFORE ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA-282.PR ?X_I)) ** ?E)
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
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) COME.12.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B BOY.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A BENT.A))
			(!R6 (?X_A WHEEL.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) COME.12.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) COME.12.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) COME.12.V) ?L2))
			(?X_C (?X_B (HARD.ADV (DOWN.ADV COME.12.V))))
			(?X_C (?X_B COME.12.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? COME.12.V)))
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
	(EPI-SCHEMA ((?X_A TRANSPORT_OBJECT.33.V ?X_B ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_A BOY.N))
			(!R2 (?X_B WHEEL.N))
			(!R3 (?X_B SMALLER-THAN.N ?X_A))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_C DESTINATION.N))
			(!R6 (?X_B BENT.A))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
			(!R8 (?X_C SHOP.N))
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
	(EPI-SCHEMA ((?X_B REQUEST_ACTION.37.V ?X_B ?A) ** ?X_C)
		(:ROLES
			(!R1 (?X_B BOY.N))
			(!R2 (?A ACTION.N))
			(!R3 (?X_A BENT.A))
			(!R4 (?X_A WHEEL.N))
			(!R5 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V ?X_B ?A)))
			(?G2 (?X_B (WANT.V (THAT (?X_B (DO.V ?A))))))
		)
		(:STEPS
			(?E1 (?X_B ((HARD.ADV (DOWN.ADV ASK.V)) ?X_B ?A)))
			(?E2 (?X_B (DO.V ?A)))
		)
		(:PARAPHRASES
			(?X_C (?X_B ((HARD.ADV (DOWN.ADV ASK.V)) ?X_B ?A)))
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
	(EPI-SCHEMA ((?X_B ((HARD.ADV (DOWN.ADV INFORM.20.V)) ?X_B ?I)) ** ?X_C)
		(:ROLES
			(!R1 (?X_B BOY.N))
			(!R2 (?I INFORMATION.N))
			(!R3 (NOT (?I ACTION.N)))
			(!R4 (?X_A BENT.A))
			(!R5 (?X_A WHEEL.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?X_B (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 (?X_B (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_C (?X_B TELL.V ?X_B ?I))
			(?X_C (?X_B LET.V ?X_B (KA (KNOW.V ?I))))
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
	(EPI-SCHEMA ((?X_B INFORM.21.V (KE (?X_C (PASV RUIN.V))) ?I) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 ((KE (?X_C (PASV RUIN.V))) AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_C WHEEL.N))
			(!R6 (?X_C BENT.A))
			(!R7 (?X_C (PERTAIN-TO ?X_A)))
			(!R8 (?X_A BOY.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT ((KE (?X_C (PASV RUIN.V))) (KNOW.V ?I))))))
		)
		(:POSTCONDS
			(?P1 ((KE (?X_C (PASV RUIN.V))) (KNOW.V ?I)))
		)
		(:PARAPHRASES
			(?X_D (?X_B TELL.V (KE (?X_C (PASV RUIN.V))) ?I))
			(?X_D (?X_B LET.V (KE (?X_C (PASV RUIN.V))) (KA (KNOW.V ?I))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (AT-ABOUT ?X_F)))
			(!W2 (?X_E (AT-ABOUT ?X_F)))
		)
		(:NECESSITIES
			(!N1 (!R4 NECESSARY-TO-DEGREE 1.0))
		)
	)
	nil
)



(
	(EPI-SCHEMA ((?X_B (((ADV-A (TO.P ?X_A)) TAKE.26.V) ?X_C)) ** ?X_D)
		(:ROLES
			(!R1 (?X_B BOY.N))
			(!R2 (NOT (?X_C AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_B = ?X_C)))
			(!R5 (?X_C (PERTAIN-TO ?X_B)))
			(!R6 (?X_C WHEEL.N))
			(!R7 (?X_C BENT.A))
			(!R8 (?X_A SHOP.N))
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
	(EPI-SCHEMA ((?X_K
	              (COMPOSITE-SCHEMA-283.PR (K BENT.A) ?L2 ?X_J ?A ?X_K
	               (KE (?X_M (PASV RUIN.V))) ?I ?X_M))
	             ** ?E)
		(:ROLES
			(!R1 (?L2 DESTINATION.N))
			(!R2 (?A ACTION.N))
			(!R3 (?X_J DESTINATION.N))
			(!R4 (?X_M SMALLER-THAN.N ?X_K))
			(!R5 (?X_J SHOP.N))
			(!R6 (?X_M (PERTAIN-TO ?X_K)))
			(!R7 (?X_K BOY.N))
			(!R8 (NOT (?X_M AGENT.N)))
			(!R9 (NOT (?X_K = ?X_M)))
			(!R10 (?X_L AGENT.N))
			(!R11 ((KE (?X_M (PASV RUIN.V))) AGENT.N))
			(!R12 (?X_M WHEEL.N))
			(!R13 (?X_M BENT.A))
			(!R14 (NOT (?I ACTION.N)))
			(!R15 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_G (?X_K ((ADV-A (FROM.P ?L1)) COME.12.V) ?L2))
			(?X_G (?X_K REQUEST_ACTION.37.V ?X_K ?A))
			(?X_G (?X_K ((HARD.ADV (DOWN.ADV INFORM.20.V)) ?X_K ?I)))
			(?X_A (?X_M (GET.V (K BENT.A))))
			(?X_E (?X_K TRANSPORT_OBJECT.33.V ?X_M ?X_J))
			(?X_E (?X_K (((ADV-A (TO.P ?X_J)) TAKE.26.V) ?X_M)))
			(?X_C (?X_L INFORM.21.V (KE (?X_M (PASV RUIN.V))) ?I))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_A)))
			(!W2 (?X_G (BEFORE ?X_E)))
			(!W3 (?X_G (BEFORE ?X_C)))
			(!W4 (?X_A (BEFORE ?X_E)))
			(!W5 (?X_A (BEFORE ?X_C)))
			(!W6 (?X_E (BEFORE ?X_C)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?L1)) FLY.1.V) ?L2) ** ?X_E)
		(:ROLES
			(!R1 (?X_D BIRD.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_D (HAS.V (K (PLUR WING.N)))))
			(!R6 (?X_D (HAS.V (TWO.D (PLUR LEG.N)))))
			(!R7 (?X_D (HAS.V (SET-OF ?X_C ?X_A))))
			(!R8 (?X_A LONG.A))
			(!R9 (?X_A TAIL.N))
			(!R10 (?X_D (ON.P ?X_B)))
			(!R11 (?X_B TREE.N))
			(!R12 (?X_C SMALL.A))
			(!R13 (?X_C BILL.N))
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
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) FLY.1.V)))
			(?X_E
	   (?X_D ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) FLY.1.V))))
			(?X_E (?X_D ((ADV-A (DESTINATION_PREP.? ?L2)) FLY.1.V) ?L2))
			(?X_E (?X_D (CAN.AUX FLY.1.V)))
			(?X_E (?X_D FLY.1.V ?L2))
			(?X_E (?X_D (LOCATION_ADV.? FLY.1.V)))
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
	(EPI-SCHEMA ((?X_E ((ADV-A (FROM.P ?L1)) FLY.2.V) ?L2) ** ?X_F)
		(:ROLES
			(!R1 (?X_E BIRD.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_D TALL.A))
			(!R6 (?X_D TREE.N))
			(!R7 (?X_E (HAS.V (SET-OF ?X_C ?X_B))))
			(!R8 (?X_E (HAS.V (K (PLUR WING.N)))))
			(!R9 (?X_E (HAS.V (TWO.D (PLUR LEG.N)))))
			(!R10 (?X_A TREE.N))
			(!R11 (?X_E (ON.P ?X_A)))
			(!R12 (?X_B TAIL.N))
			(!R13 (?X_B LONG.A))
			(!R14 (?X_C BILL.N))
			(!R15 (?X_C SMALL.A))
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
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) FLY.2.V)))
			(?X_F
	   (?X_E ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) FLY.2.V))))
			(?X_F (?X_E ((ADV-A (DESTINATION_PREP.? ?L2)) FLY.2.V) ?L2))
			(?X_F (?X_E (CAN.AUX ((ADV-A (OVER.P ?X_D)) FLY.2.V))))
			(?X_F (?X_E FLY.2.V ?L2))
			(?X_F (?X_E (LOCATION_ADV.? FLY.2.V)))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-284.PR ?X_M ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_D TALL.A))
			(!R2 (?X_D TREE.N))
			(!R3 (?X_M (HAS.V (SET-OF ?X_L ?X_K))))
			(!R4 (?X_I AGENT.N))
			(!R5 (?X_J TREE.N))
			(!R6 (?X_M (ON.P ?X_J)))
			(!R7 (?X_K LONG.A))
			(!R8 (?X_K TAIL.N))
			(!R9 (?X_L SMALL.A))
			(!R10 (?X_L BILL.N))
			(!R11 (?X_M (HAS.V (K (PLUR WING.N)))))
			(!R12 (?X_M BIRD.N))
			(!R13 (?X_M (HAS.V (TWO.D (PLUR LEG.N)))))
			(!R14 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_H (?X_I ((CAN.AUX SEE.V) ?X_M)))
			(?X_F (?X_M ((ADV-A (FROM.P ?L1)) FLY.1.V) ?L2))
			(?X_C (?X_M ((ADV-A (FROM.P ?L1)) FLY.2.V) ?L2))
			(?X_A (?X_M SING.V))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_H (BEFORE ?X_F)))
			(!W2 (?X_H (BEFORE ?X_C)))
			(!W3 (?X_H (BEFORE ?X_A)))
			(!W4 (?X_F (BEFORE ?X_C)))
			(!W5 (?X_F (BEFORE ?X_A)))
			(!W6 (?X_C (BEFORE ?X_A)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.61.V) ?L2) ** ?X_C)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?L1 = ?L2)))
			(!R5 (?X_A WIFE.N))
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
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.61.V)))
			(?X_C
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?L2)) GO.61.V))))
			(?X_C (?X_B ((ADV-A (DESTINATION_PREP.? ?L2)) GO.61.V) ?L2))
			(?X_C (?X_B GO.61.V))
			(?X_C (?X_B GO.61.V ?L2))
			(?X_C (?X_B (LOCATION_ADV.? GO.61.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?I1 BEFORE ?X_C))
			(!W2 (?I2 BEFORE ?X_C))
			(!W3 (?P1 AFTER ?X_C))
			(!W4 (?P2 AFTER ?X_C))
			(!W5 (?G1 CAUSE-OF ?X_C))
			(!W6 (?X_C (AT-ABOUT ?X_F)))
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
	(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA-285.PR ?X_H (K NOTHING.N) ?L2)) ** ?E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_H BUZZ.V))
			(!R3 (?X_H SOUND.N))
			(!R4 (?X_I WIFE.N))
			(!R5 (?X_I (PERTAIN-TO ?X_N)))
			(!R6 (?X_N AGENT.N))
			(!R7 (?L2 DESTINATION.N))
		)
		(:STEPS
			(?X_G (?X_I (HEAR.V ?X_H)))
			(?X_E (?X_N ((ADV-A (FROM.P ?L1)) GO.61.V) ?L2))
			(?X_B (?X_C (HEAR.V (K NOTHING.N))))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_G (BEFORE ?X_E)))
			(!W2 (?X_G (BEFORE ?X_B)))
			(!W3 (?X_E (BEFORE ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA (((K SUSIE.N)
	              (COMPOSITE-SCHEMA-286.PR (KE (?X_F HOUSE.N))
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
	)
)



(
	(EPI-SCHEMA ((?X_A (((ADV-A (IN.P ?X_C)) PUT.8.V) ?X_B)) ** ?X_E)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_C CONTAINER.N))
			(!R4 (NOT (?X_C AGENT.N)))
			(!R5 (?X_B SMALLER-THAN ?X_C))
			(!R6 (?X_B (K DEAD.A) DOG.N))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
			(!R8 (?X_C GRAVE.N))
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
			(?X_E (?X_A ((ADV-A (INTO.P ?X_C)) PUT.8.V) ?X_B))
			(?X_E (?X_A ((ADV-A (INSIDE.P ?X_C)) PUT.8.V) ?X_B))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_E (RIGHT-AFTER ?X_D)))
			(!W2 (?X_E (SAME-TIME ?X_G)))
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
	(EPI-SCHEMA ((?X_A (((ADV-A (IN.P ?X_C)) PUT.9.V) ?X_B)) ** ?X_D)
		(:ROLES
			(!R1 (?X_A MAN.N))
			(!R2 (NOT (?X_B AGENT.N)))
			(!R3 (?X_C CONTAINER.N))
			(!R4 (NOT (?X_C AGENT.N)))
			(!R5 (?X_B SMALLER-THAN ?X_C))
			(!R6 (?X_B (K DEAD.A) DOG.N))
			(!R7 (?X_B (PERTAIN-TO ?X_A)))
			(!R8 (?X_C GRAVE.N))
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
	(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA-287.PR ?X_N ?X_E ?X_M)) ** ?E)
		(:ROLES
			(!R1 (?X_E TREE.N))
			(!R2 (?X_N CONTAINER.N))
			(!R3 (?X_N GRAVE.N))
			(!R4 (?X_L MAN.N))
			(!R5 (?X_M SMALLER-THAN ?X_N))
			(!R6 (?X_M (K DEAD.A) DOG.N))
			(!R7 (?X_M (PERTAIN-TO ?X_L)))
			(!R8 (NOT (?X_M AGENT.N)))
			(!R9 (NOT (?X_N AGENT.N)))
		)
		(:STEPS
			(?X_K (?X_L (DIG.V ?X_N)))
			(?X_I (?X_L (PUT.V ?X_M ?X_N)))
			(?X_B (?X_L (((ADV-A (IN.P ?X_N)) PUT.8.V) ?X_M)))
			(?X_B (?X_L (((ADV-A (IN.P ?X_N)) PUT.9.V) ?X_M)))
			(?X_G (?X_L ((IN.PRT ((ADV-A (WITH.P (K DIRT.N))) FILL.V)) ?X_N)))
			(?X_D
	   (?X_L
	    (((ADV-A (ON.P (K (L X (AND (X TOP.N) (X (OF.P ?X_N))))))) PLANT.V) ?X_E)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_G)))
			(!W2 (?X_K (BEFORE ?X_D)))
			(!W3 (?X_I (BEFORE ?X_B)))
			(!W4 (?X_G (BEFORE ?X_D)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA-288.PR ?X_I)) ** ?E)
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
	)
)



(
	(EPI-SCHEMA ((?X_G
	              (COMPOSITE-SCHEMA-289.PR (THAT (?X_J (PASV UNPLUG.V)))
	               (KE (?X_J (PASV UNPLUG.V))) ?X_J (KE ((K WIND.N) (IN.P ?X_K)))))
	             ** ?E)
		(:ROLES
			(!R1 (?X_G AGENT.N))
			(!R2 (?X_J FAN.N))
			(!R3 (?X_K ROOM.N))
		)
		(:STEPS
			(?X_B (?X_G ((ON.PRT TURN.V) ?X_J)))
			(?X_D (?X_G (SEE.V (THAT (?X_J (PASV UNPLUG.V))))))
			(?X_F (?X_G (THAT.P (KE (?X_J (PASV UNPLUG.V))))))
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
	)
)



(
	(EPI-SCHEMA ((?X_C INFORM.22.V ?X_D ?I) ** ?X_E)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_D AGENT.N))
			(!R3 (?I INFORMATION.N))
			(!R4 (NOT (?I ACTION.N)))
			(!R5 (?X_A MOUSE.N))
			(!R6 (?X_C (HAS.V ?X_A)))
			(!R7 (?X_B WIFE.N))
			(!R8 (?X_B (PERTAIN-TO ?X_C)))
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
	(EPI-SCHEMA ((?X_C GET.50.V ?X_D) ** ?X_E)
		(:ROLES
			(!R1 (?X_C WIFE.N))
			(!R2 (NOT (?X_D AGENT.N)))
			(!R3 (?L LOCATION.N))
			(!R4 (NOT (?X_C = ?X_D)))
			(!R5 (?X_C (PERTAIN-TO ?X_A)))
			(!R6 (?X_B MOUSE.N))
			(!R7 (?X_A (HAS.V ?X_B)))
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
			(!W5 (?X_E (SAME-TIME ?X_H)))
			(!W6 (?X_E (RIGHT-AFTER ?X_F)))
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
	(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA-290.PR (KA (GET.V ?X_I)) ?X_L ?I ?X_N)) ** ?E)
		(:ROLES
			(!R1 (?X_I CAT.N))
			(!R2 (?X_M (PERTAIN-TO ?X_K)))
			(!R3 (?X_J MOUSE.N))
			(!R4 (?X_K (HAS.V ?X_J)))
			(!R5 (?X_K AGENT.N))
			(!R6 (?X_L AGENT.N))
			(!R7 (NOT (?I ACTION.N)))
			(!R8 (?I INFORMATION.N))
			(!R9 (?X_M WIFE.N))
			(!R10 (NOT (?X_N AGENT.N)))
			(!R11 (NOT (?X_M = ?X_N)))
		)
		(:STEPS
			(?X_A (?X_M (WANT.V (KA (GET.V ?X_I)))))
			(?X_H (?X_M (WANT.V (KA (GET.V ?X_I)))))
			(?X_D (?X_M (GET.V ?X_N)))
			(?X_F (?X_K INFORM.22.V ?X_L ?I))
			(?X_B (?X_M GET.50.V ?X_N))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_A (BEFORE ?X_F)))
			(!W2 (?X_A (BEFORE ?X_B)))
			(!W3 (?X_H (BEFORE ?X_F)))
			(!W4 (?X_H (BEFORE ?X_B)))
			(!W5 (?X_D (BEFORE ?X_B)))
			(!W6 (?X_F (BEFORE ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_A ENJOY_ACTION.38.V (KA (((ADV-A (TO.P ?X_B)) ASK.V) ?X_C)))
	             ** ?X_D)
		(:ROLES
			(!R1 (?X_A AGENT.N))
			(!R2 ((KA (((ADV-A (TO.P ?X_B)) ASK.V) ?X_C)) ACTION.N))
			(!R3 (?X_B BALL.N))
		)
		(:PRECONDS
			(?I1 (?X_A (THINK.V (THAT ((KA (((ADV-A (TO.P ?X_B)) ASK.V) ?X_C)) FUN.A)))))
		)
		(:PARAPHRASES
			(?X_D (?X_A ((REALLY.ADV WANT.V) (KA (((ADV-A (TO.P ?X_B)) ASK.V) ?X_C)))))
			(?X_D (?X_A (LIKE.V (KA (((ADV-A (TO.P ?X_B)) ASK.V) ?X_C)))))
			(?X_D (?X_A (LOVE.V (KA (((ADV-A (TO.P ?X_B)) ASK.V) ?X_C)))))
			(?X_D (?X_A (ENJOY.V (KA (((ADV-A (TO.P ?X_B)) ASK.V) ?X_C)))))
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
	(EPI-SCHEMA ((?X_A INFORM.23.V ?X_B ?I) ** ?X_C)
		(:ROLES
			(!R1 (?X_A AGENT.N))
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
			(?X_C (?X_A ((HOWEVER.ADV TELL.V) ?X_B ?I)))
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
	(EPI-SCHEMA ((?X_H
	              (COMPOSITE-SCHEMA-291.PR ?X_I (KA (((ADV-A (TO.P ?X_G)) ASK.V) ?X_I))
	               ?X_J ?I))
	             ** ?E)
		(:ROLES
			(!R1 ((KA (((ADV-A (TO.P ?X_G)) ASK.V) ?X_I)) ACTION.N))
			(!R2 (?X_G BALL.N))
			(!R3 (?X_H AGENT.N))
			(!R4 (?X_I AGENT.N))
			(!R5 (?X_J AGENT.N))
			(!R6 (NOT (?I ACTION.N)))
			(!R7 (?I INFORMATION.N))
		)
		(:STEPS
			(?X_F (?X_H (LIKE.V ?X_I)))
			(?X_D (?X_H ENJOY_ACTION.38.V (KA (((ADV-A (TO.P ?X_G)) ASK.V) ?X_I))))
			(?X_B (?X_I INFORM.23.V ?X_J ?I))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_E (((ADV-A (FROM.P ?X_A)) EAT.9.V) ?F)) ** ?X_F)
		(:ROLES
			(!R1 (?X_E AGENT.N))
			(!R2 (?F FOOD.N))
			(!R3 (?X_E (PLUR RABBIT.N)))
			(!R4 (?X_A HAND.N))
			(!R5 (?X_B AGENT.N))
			(!R6 (?X_E (PERTAIN-TO ?X_B)))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
			(!R8 (?X_D PAPA.N))
			(!R9 (?X_D (PERTAIN-TO ?X_B)))
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
	(EPI-SCHEMA ((?X_D FEED.2.V ?X_E ?F) ** ?E)
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
	              (COMPOSITE-SCHEMA-292.PR ?X_N
	               (TWO.D (L X (AND (X PRETTY.A) (X (PLUR RABBIT.N))))) ?X_B ?X_L
	               ?X_O ?F))
	             ** ?E)
		(:ROLES
			(!R1 (?X_L (K DEAR.A) PAPA.N))
			(!R2 (?X_G LITTLE.A))
			(!R3 (?X_G HOUSE.N))
			(!R4 (?X_P (PERTAIN-TO ?X_N)))
			(!R5 (?X_M PAPA.N))
			(!R6 (?X_M (PERTAIN-TO ?X_N)))
			(!R7 (?X_L (PERTAIN-TO ?X_M)))
			(!R8 (?X_O (PERTAIN-TO ?X_N)))
			(!R9 (?X_N AGENT.N))
			(!R10 (NOT (?X_N = ?X_O)))
			(!R11 (NOT (?X_O = ?F)))
			(!R12 (NOT (?X_N = ?F)))
			(!R13 (?X_O (PLUR RABBIT.N)))
			(!R14 (?X_P HAND.N))
			(!R15 (?F FOOD.N))
		)
		(:STEPS
			(?X_K
	   (?X_M (GIVE.V ?X_N (TWO.D (L X (AND (X PRETTY.A) (X (PLUR RABBIT.N))))))))
			(?E_1 (?X_N FEED.2.V ?X_O ?F))
			(?X_I (?X_O (((ADV-A (FROM.P ?X_P)) EAT.9.V) ?F)))
			(?X_F (?X_N ((SHALL.AUX ((ADV-A (IN.P ?X_G)) KEEP.V)) ?X_B)))
			(?X_D (?X_N (LOVE.V ?X_L)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_K (BEFORE ?X_I)))
			(!W2 (?X_K (BEFORE ?X_F)))
			(!W3 (?X_K (BEFORE ?X_D)))
			(!W4 (?E_1 (BEFORE ?X_I)))
			(!W5 (?E_1 (BEFORE ?X_F)))
			(!W6 (?E_1 (BEFORE ?X_D)))
			(!W7 (?X_I (BEFORE ?X_F)))
			(!W8 (?X_I (BEFORE ?X_D)))
			(!W9 (?X_F (BEFORE ?X_D)))
		)
	)
	(
	)
)



(
	(EPI-SCHEMA ((?X_C ((ADV-A (FROM.P ?X_B)) MOVE.1.V) ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_C AGENT.N))
			(!R2 (?X_B CITY.N))
			(!R3 (?L2 DESTINATION.N))
			(!R4 (NOT (?X_B = ?L2)))
			(!R5 (?X_A (PERTAIN-TO ?X_C)))
			(!R6 (?X_A HOMETOWN.N))
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
			(?X_D (?X_C MOVE.1.V))
			(?X_D (?X_C MOVE.1.V ?L2))
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
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.34.V ?O ?L2) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?O ENTITY.N))
			(!R3 (?O SMALLER-THAN.N ?X_B))
			(!R4 (?X_C CITY.N))
			(!R5 (?L2 DESTINATION.N))
			(!R6 (?X_A (PERTAIN-TO ?X_B)))
			(!R7 (?X_A HOMETOWN.N))
			(!R8 (?X_C NEW.A))
			(!R9 (?L2 HOME.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?O ((ADV-A (AT.P ?L2)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?O ((ADV-A (AT.P ?X_C)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?O ((ADV-A (AT.P ?L2)) BE.V)))
		)
		(:PARAPHRASES
			(?X_D (?X_B ((ADV-A (TO.P ?L2)) TAKE.V) ?O))
			(?X_D (?X_B ((ADV-A (TO.P ?L2)) CARRY.V) ?O))
			(?X_D (?X_B ((ADV-A (TO.P ?L2)) BRING.V) ?O))
			(?X_D (?X_B ((BACK.ADV TAKE.V) ?O)))
			(?X_D (?X_B CARRY.V ?O))
			(?X_D (?X_B BRING.V ?O))
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
	(EPI-SCHEMA ((?X_B TRANSPORT_OBJECT.35.V ?O ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?O ENTITY.N))
			(!R3 (?O SMALLER-THAN.N ?X_B))
			(!R4 (?L1 LOCATION.N))
			(!R5 (?X_C CITY.N))
			(!R6 (?X_C DESTINATION.N))
			(!R7 (?X_C NEW.A))
			(!R8 (?X_A (PERTAIN-TO ?X_B)))
			(!R9 (?X_A HOMETOWN.N))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (THAT (?O ((ADV-A (AT.P ?X_C)) BE.V))))))
		)
		(:PRECONDS
			(?I1 (?O ((ADV-A (AT.P ?L1)) BE.V)))
		)
		(:POSTCONDS
			(?P1 (?O ((ADV-A (AT.P ?X_C)) BE.V)))
		)
		(:PARAPHRASES
			(?X_D (?X_B (((ADV-A (TO.P ?X_C)) TAKE.V) ?O)))
			(?X_D (?X_B ((ADV-A (TO.P ?X_C)) CARRY.V) ?O))
			(?X_D (?X_B ((ADV-A (TO.P ?X_C)) BRING.V) ?O))
			(?X_D (?X_B (LOCATION_ADV.? TAKE.V) ?O))
			(?X_D (?X_B (LOCATION_ADV.? CARRY.V) ?O))
			(?X_D (?X_B (LOCATION_ADV.? BRING.V) ?O))
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
	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) MOVE.2.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C CITY.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C DESTINATION.N))
			(!R6 (?X_C NEW.A))
			(!R7 (?X_A HOMETOWN.N))
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
	   (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) MOVE.2.V))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) MOVE.2.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) MOVE.2.V) ?X_C))
			(?X_D (?X_B MOVE.2.V))
			(?X_D (?X_B MOVE.2.V ?X_C))
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
	(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA-293.PR ?L2 ?O ?X_F)) ** ?E)
		(:ROLES
			(!R1 (?X_E HOMETOWN.N))
			(!R2 (?X_E (PERTAIN-TO ?X_G)))
			(!R3 (?X_F DESTINATION.N))
			(!R4 (?X_F CITY.N))
			(!R5 (?X_F NEW.A))
			(!R6 (NOT (?X_F = ?L2)))
			(!R7 (?X_G AGENT.N))
			(!R8 (?L2 DESTINATION.N))
			(!R9 (?L2 HOME.N))
			(!R10 (?O ENTITY.N))
			(!R11 (?O SMALLER-THAN.N ?X_G))
		)
		(:STEPS
			(?X_D (?X_G TRANSPORT_OBJECT.35.V ?O ?X_F))
			(?X_D (?X_G ((ADV-A (FROM.P ?L1)) MOVE.2.V) ?X_F))
			(?X_B (?X_G ((ADV-A (FROM.P ?X_F)) MOVE.1.V) ?L2))
			(?X_B (?X_G TRANSPORT_OBJECT.34.V ?O ?L2))
		)
		(:EPISODE-RELATIONS
			(!W1 (?X_D (BEFORE ?X_B)))
		)
	)
	(
	)
)



))
; got 712 schemas (419 protoschema matches, 293 stories)
