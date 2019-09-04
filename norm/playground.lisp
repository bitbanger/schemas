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
;(print-schema kite-gen-schema)

(setf linear1 (linearize-story *MONKEY-STORY*))

(format t "linearized: ~s~%" linear1)

(setf linear1 (shuffle linear1))

(setf monkey-match-1 (match-story-to-schema linear1 do_action_to_enable_action.v nil))

(print-schema monkey-match-1)

(load-time-model '(
	(NOW0 STRICTLY-BEFORE.PR NOW1)
	(NOW1 STRICTLY-BEFORE.PR NOW2)
	(NOW2 STRICTLY-BEFORE.PR NOW3)
	(E1.SK AT-ABOUT.PR NOW0)
	(E2.SK AT-ABOUT.PR NOW1)
	(E2.SK CONSEC.PR E3.SK)
	(E4.SK AT-ABOUT.PR NOW2)
	(E5.SK AT-ABOUT.PR NOW3)
	(E5.SK CONSEC.PR E6.SK)
))

(loop for ep-rel in (section-formulas (get-section monkey-match-1 ':Episode-relations))
	do (block ep-rel-loop
		(setf allen-rel (convert-time-prop (second ep-rel)))

		(if (null allen-rel)
			(return-from ep-rel-loop)
		)

		(if (or (not (member (car allen-rel) DEFINED-INTERVALS :test #'equal))
				(not (member (third allen-rel) DEFINED-INTERVALS :test #'equal)))
			; then
			(return-from ep-rel-loop)
		)

		(format t "~s~%" (second ep-rel))
		(format t "	~s~%" (eval-time-prop (second ep-rel)))
	)
)

; (ahow)
;(format t "~s~%" (eval-time-prop '(E1.SK BEFORE.PR E3.SK)))
;(format t "~s~%" (eval-time-prop '(E3.SK BEFORE.PR E2.SK)))
