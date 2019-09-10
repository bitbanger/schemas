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

(defparameter *NUM-SHUFFLES* 10)
(defparameter *GENERALIZE* nil)
(defparameter *RUN-MATCHER* nil)


;(format t "scores:~%")
;(loop for sc in scores do (format t "	~s~%" (- (car sc) (second sc))))
(if *RUN-MATCHER*
;(loop for i from 1 to 10 do 
(loop for protoschema in *PROTOSCHEMAS* do (block match-proto
	;(if (not (equal protoschema 'do_action_to_enable_action.v))
		; then
	;	(return-from match-proto)
	;)

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
;)
)

; (ahow)
;(format t "~s~%" (eval-time-prop '(E1.SK BEFORE.PR E3.SK)))
;(format t "~s~%" (eval-time-prop '(E3.SK BEFORE.PR E2.SK)))




(setf enable-match '(EPI-SCHEMA ((MONKEY1.SK DO_ACTION_TO_ENABLE_ACTION.V (KA (CLIMB.V TREE1.SK))
              (KA (GET.V COCOANUT1.SK)))
             ** ?E)
	(:ROLES
		(!R1 (MONKEY1.SK AGENT1.N))
		(!R2 ((KA (CLIMB.V TREE1.SK)) ACTION1.N))
		(!R3 ((KA (GET.V COCOANUT1.SK)) ACTION1.N))
		(!R4 (TREE1.SK TREE_1.N))
		(!R5 (COCOANUT1.SK COCOANUT_1.N))
		(!R6 (MONKEY1.SK INDEF.A))
		(!R7 (MONKEY1.SK MONKEY_1.N))
	)
	(:GOALS
		(?G1 (MONKEY1.SK (WANT.V (KA (DO.V (KA (GET.V COCOANUT1.SK)))))))
	)
	(:PRECONDS
		(!PRE1 (NOT (MONKEY1.SK (CAN.MD (KA (DO.V (KA (GET.V COCOANUT1.SK))))))))
	)
	(:STEPS
		(E2.SK (MONKEY1.SK (CLIMB.V TREE1.SK)))
		(?E2 (MONKEY1.SK (CAN.MD (KA (DO.V (KA (GET.V COCOANUT1.SK)))))))
		(E3.SK (MONKEY1.SK (GET.V COCOANUT1.SK)))
	)
	(:EPISODE-RELATIONS
		(!W1 (E2.SK CAUSE.V ?E2))
		(!W2 (E2.SK CONSEC.PR ?E2))
		(!W3 (E2.SK BEFORE.PR ?E2))
		(!W4 (E2.SK BEFORE.PR E3.SK))
		(!W5 (?E2 SAME-TIME.PR E3.SK))
		(!W6 (?G1 CAUSE.V E2.SK))
		(!W7 (E2.SK SAME-TIME.PR ?E))
		(!W8 (E2.SK CONSEC.PR E3.SK))
		(!W9 (E2.SK AT-ABOUT.PR NOW1))
	)
))

(setf get-match '(EPI-SCHEMA ((MONKEY1.SK TAKE_OBJECT.V COCOANUT1.SK) ** ?E)
	(:ROLES
		(!R1 (MONKEY1.SK AGENT1.N))
		(!R2 (COCOANUT1.SK OBJECT1.N))
		(!R3 (MONKEY1.SK INDEF.A))
		(!R4 (MONKEY1.SK MONKEY_1.N))
		(!R5 (COCOANUT1.SK COCOANUT_1.N))
	)
	(:GOALS
		(?G1 (MONKEY1.SK (WANT.V (THAT (MONKEY1.SK (HAVE.V COCOANUT1.SK))))))
	)
	(:PRECONDS
		(!PRE1 (NOT (MONKEY1.SK HAVE.V COCOANUT1.SK)))
	)
	(:STEPS
		(?E1 (MONKEY1.SK (TAKE.V COCOANUT1.SK)))
		(E3.SK (MONKEY1.SK (GET.V COCOANUT1.SK)))
		(?E3 (MONKEY1.SK (RECEIVE.V COCOANUT1.SK)))
	)
	(:POSTCONDS
		(!POST1 (MONKEY1.SK HAVE.V COCOANUT1.SK))
	)
	(:EPISODE-RELATIONS
		(!W1 (?E1 SAME-TIME.PR E3.SK))
		(!W2 (?E1 SAME-TIME.PR ?E3))
		(!W3 (?E1 SAME-TIME.PR ?E))
		(!W4 (E2.SK CONSEC.PR E3.SK))
		(!W5 (E2.SK AT-ABOUT.PR NOW1))
	)
))


; (print-schema (merge-schemas do_action_to_enable_action.v take_object.v))
(print-schema (dedupe-sections (merge-schemas enable-match get-match)))
