(declaim (sb-ext:muffle-conditions cl:warning))

(setf *random-state* (make-random-state t))

(load "norm-schema-util.lisp")
(load "norm-protoschemas.lisp")
(load "norm-stories.lisp")
(load "norm-unify.lisp")
(load "norm-match.lisp")
(load "real_util.lisp")
(load "norm-time.lisp")

;(setf kite-gen-schema (match-story-to-schema *KITE-STORY* go_somewhere.v t))
;(print-schema (car kite-gen-schema))

(setf story *MONKEY-STORY*)

(format t "story:~%")
(loop for sent in story
	do (format t "	~s~%~%" sent))


(setf story-time-props
	(loop for phi in (linearize-story story)
		if (time-prop? phi)
			collect phi))

; TODO: make these implicit somehow in AIA solver?
(setf now-time-props '(
	(NOW0 STRICTLY-BEFORE.PR NOW1)
	(NOW1 STRICTLY-BEFORE.PR NOW2)
	(NOW2 STRICTLY-BEFORE.PR NOW3)
	(NOW3 STRICTLY-BEFORE.PR NOW4)
	(NOW4 STRICTLY-BEFORE.PR NOW5)
	(NOW5 STRICTLY-BEFORE.PR NOW6)
	(NOW6 STRICTLY-BEFORE.PR NOW7)
	(NOW7 STRICTLY-BEFORE.PR NOW8)
))

(load-time-model (append story-time-props now-time-props))

(defparameter *NUM-SHUFFLES* 20)
(defparameter *GENERALIZE* nil)
(defparameter *RUN-MATCHER* nil)


;(format t "scores:~%")
;(loop for sc in scores do (format t "	~s~%" (- (car sc) (second sc))))
(if *RUN-MATCHER*
(loop for protoschema in *PROTOSCHEMAS* do (block match-proto
	(setf best-match-res-pair (best-story-schema-match story (eval protoschema) *NUM-SHUFFLES* *GENERALIZE*))
	(setf best-match-res (car best-match-res-pair))
	(setf best-score (car best-match-res-pair))
	(setf best-match (second best-match-res-pair))
	(setf best-bindings (third best-match-res-pair))
	(format t "best match for protoschema ~s (score ~s):~%~%" protoschema best-score)
	; (print-schema best-match)
	; (format t "deduped:~%")
	(print-schema (dedupe-sections best-match))
	(format t "~%~%~%")

	; (format t "bindings: ~s~%" (ht-to-str best-bindings))

	;(loop for var being the hash-keys of best-bindings do (block binding-loop
	;	(format 
	;))
))
)

; (ahow)
;(format t "~s~%" (eval-time-prop '(E1.SK BEFORE.PR E3.SK)))
;(format t "~s~%" (eval-time-prop '(E3.SK BEFORE.PR E2.SK)))




(setf enable-match '(EPI-SCHEMA ((MONKEY1.SK DO_ACTION_TO_ENABLE_ACTION.V
              (KA ((ADV-A DOWN.A) COME.V)) (KA (EAT.V COCOANUT1.SK)))
             ** ?E)
	(:ROLES
		(!R1 (MONKEY1.SK AGENT1.N))
		(!R2 ((KA ((ADV-A DOWN.A) COME.V)) ACTION1.N))
		(!R3 ((KA (EAT.V COCOANUT1.SK)) ACTION1.N))
		(!R4 (MONKEY1.SK INDEF.A))
		(!R5 (MONKEY1.SK MONKEY_1.N))
	)
	(:GOALS
		(?G1 (MONKEY1.SK (WANT.V (KA (DO.V (KA (EAT.V COCOANUT1.SK)))))))
	)
	(:PRECONDS
		(!PRE1 (NOT (MONKEY1.SK (CAN.MD (KA (DO.V (KA (EAT.V COCOANUT1.SK))))))))
	)
	(:STEPS
		(E5.SK (MONKEY1.SK ((ADV-A DOWN.A) COME.V)))
		(?E2 (MONKEY1.SK (CAN.MD (KA (DO.V (KA (EAT.V COCOANUT1.SK)))))))
		(E6.SK (MONKEY1.SK (DO.V (KA (EAT.V COCOANUT1.SK)))))
	)
	(:EPISODE-RELATIONS
		(!W1 (E5.SK CAUSE.V ?E2))
		(!W2 (E5.SK CONSEC.PR ?E2))
		(!W3 (E5.SK BEFORE.PR ?E2))
		(!W4 (E5.SK BEFORE.PR E6.SK))
		(!W5 (?E2 SAME-TIME.PR E6.SK))
		(!W6 (?G1 CAUSE.V E5.SK))
		(!W7 (E5.SK SAME-TIME.PR ?E))
		(!W8 (E5.SK CONSEC.PR E6.SK))
		(!W9 (E5.SK AT-ABOUT.PR NOW3))
	)
))

(setf go-match '(EPI-SCHEMA ((MONKEY1.SK GO_SOMEWHERE.V ?L1 ?L2) ** ?E)
	(:ROLES
		(!R1 (MONKEY1.SK AGENT_1.N))
		(!R2 (?O LOCATION_1.N))
		(!R3 (MONKEY1.SK MONKEY_1.N))
		(!R4 (MONKEY1.SK INDEF.A))
	)
	(:GOALS
		(?G1 (MONKEY1.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V)))))
	)
	(:PRECONDS
		(!PRE1 (MONKEY1.SK ((ADV-A (AT.P ?L1)) BE.V)))
		(!PRE2 (NOT (MONKEY1.SK ((ADV-A (AT.P ?L2)) BE.V))))
	)
	(:STEPS
		(E5.SK (MONKEY1.SK ((ADV-A DOWN.A) COME.V)))
		(?E2 (MONKEY1.SK (MOVEMENT_VERB.V (FROM.P-ARG ?L1) (TO.P-ARG ?L2))))
		(?E3 (MONKEY1.SK (MOVEMENT_VERB.V (TO.P-ARG ?L2) (FROM.P-ARG ?L1))))
		(?E4 (MONKEY1.SK (MOVEMENT_VERB.V (FROM.P-ARG ?L1))))
	)
	(:POSTCONDS
		(!POST1 (NOT (MONKEY1.SK ((ADV-A (AT.P ?L1)) BE.V))))
		(!POST2 (MONKEY1.SK ((ADV-A (AT.P ?L2)) BE.V)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E5.SK SAME-TIME.PR ?E2))
		(!W2 (E5.SK SAME-TIME.PR ?E3))
		(!W3 (E5.SK SAME-TIME.PR ?E4))
		(!W4 (E5.SK AT-ABOUT.PR NOW3))
		(!W5 (E5.SK CONSEC.PR E6.SK))
	)
))


; (print-schema (merge-schemas do_action_to_enable_action.v take_object.v))
(print-schema (dedupe-sections (merge-schemas enable-match go-match)))
