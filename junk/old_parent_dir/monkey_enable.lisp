;bindings: "?X: HE.PRO
;?A1: (KA (CLIMB.V TREE2.SK))
;?E1: E2.SK
;?A2: (KA (GET.V COCOANUT1.SK))
;?E2: E3.SK"
(defparameter monkeygen
'(epi-schema ((HE.PRO DO_TO_ENABLE_ACTION.V (KA (CLIMB.V TREE2.SK))
              (KA (GET.V COCOANUT1.SK)))
             ** ?E)
	(:NONFLUENT-CONDS
		!R1	((KA (CLIMB.V TREE2.SK)) ACTION1.N)
		!R2	((KA (GET.V COCOANUT1.SK)) ACTION1.N)
		!R3	(HE.PRO AGENT6.N)
	)
	(:GOALS
		?G1	(HE.PRO WANT1.V (THAT (HE.PRO CAN.MD (DO2.V (KA (GET.V COCOANUT1.SK))))))
	)
	(:INTENDED-EPISODES
		E2.SK	(HE.PRO DO2.V (KA (CLIMB.V TREE2.SK)))
		E3.SK	(HE.PRO (CAN.MD (DO2.V (KA (GET.V COCOANUT1.SK)))))
	)
	(:EPISODE-RELATIONS
		!W1	(E2.SK CONSEC E3.SK)
		!W2	(E2.SK CAUSE-OF E3.SK)
	)
)
)