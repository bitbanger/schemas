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


;(format t "scores:~%")
;(loop for sc in scores do (format t "	~s~%" (- (car sc) (second sc))))
(setf best-match-res (best-story-schema-match *MONKEY-STORY* do_action_to_enable_action.v 100))
(format t "best score: ~s~%" (car best-match-res))
(print-schema (second best-match-res))

; (ahow)
;(format t "~s~%" (eval-time-prop '(E1.SK BEFORE.PR E3.SK)))
;(format t "~s~%" (eval-time-prop '(E3.SK BEFORE.PR E2.SK)))
