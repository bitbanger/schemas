(defparameter go_with_kite.v
	'(EPI-SCHEMA ((?_A GO_SOMEWHERE.V ?L1 ?_C) ** ?E)
		(:ROLES
			(!R1 (?_A AGENT_1.N))
			(!R2 (?O LOCATION_1.N))
			(!R3 (?_D BEFORE.PR NOW0))
			(!R4 (?_B KITE_1.N))
			(!R5 (?_B PERTAIN-TO.PR ?_A))
			(!R6 (?_C FIELD_1.N))
		)
		(:GOALS
			(?G1 (?_A (WANT.V (KA ((ADV-A (AT.P ?_C)) BE.V)))))
		)
		(:PRECONDS
			(!I1 (?_A ((ADV-A (AT.P ?L1)) BE.V)))
			(!I2 (NOT (?_A ((ADV-A (AT.P ?_C)) BE.V))))
		)
		(:STEPS
			(?_D (?_A (((ADV-A (WITH.P ?_B)) GO.V) (TO.P-ARG ?_C))))
			(?E2 (?_A (MOVEMENT_VERB.V (FROM.P-ARG ?L1) (TO.P-ARG ?_C))))
			(?E3 (?_A (MOVEMENT_VERB.V (TO.P-ARG ?_C) (FROM.P-ARG ?L1))))
			(?E4 (?_A (MOVEMENT_VERB.V (FROM.P-ARG ?L1))))
		)
		(:POSTCONDS
			(!P1 (NOT (?_A ((ADV-A (AT.P ?L1)) BE.V))))
			(!P2 (?_A ((ADV-A (AT.P ?_C)) BE.V)))
		)
		(:EPISODE-RELATIONS
			(!W1 (?_D SAME-TIME.A ?E2))
			(!W2 (?_D SAME-TIME.A ?E3))
			(!W3 (?_D SAME-TIME.A ?E4))
		)
	)
)
