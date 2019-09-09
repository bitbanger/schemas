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

(format t "story:~%")
(loop for sent in *MONKEY-STORY*
	do (format t "	~s~%~%" sent))


(setf story-time-props
	(loop for phi in (linearize-story *MONKEY-STORY*)
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


;(format t "scores:~%")
;(loop for sc in scores do (format t "	~s~%" (- (car sc) (second sc))))
(loop for protoschema in *PROTOSCHEMAS* do (block match-proto
	(setf best-match-res-pair (best-story-schema-match *MONKEY-STORY* (eval protoschema) 20))
	(setf best-match-res (car best-match-res-pair))
	(setf best-score (car best-match-res-pair))
	(setf best-match (second best-match-res-pair))
	(setf best-bindings (third best-match-res-pair))
	(format t "best score for ~s: ~s~%" protoschema best-score)
	; (print-schema best-match)
	; (format t "deduped:~%")
	(print-schema (dedupe-sections best-match))
	(format t "~%")

	; (format t "bindings: ~s~%" (ht-to-str best-bindings))

	;(loop for var being the hash-keys of best-bindings do (block binding-loop
	;	(format 
	;))
))

; (ahow)
;(format t "~s~%" (eval-time-prop '(E1.SK BEFORE.PR E3.SK)))
;(format t "~s~%" (eval-time-prop '(E3.SK BEFORE.PR E2.SK)))
