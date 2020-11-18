(declaim (sb-ext:muffle-conditions cl:warning))

(setf *random-state* (make-random-state t))

(load "norm-schema-util.lisp")
(load "norm-protoschemas.lisp")
(load "norm-stories.lisp")
(load "norm-unify.lisp")
(load "norm-matcher.lisp")
(load "real_util.lisp")
(load "norm-time.lisp")
(load "parsed-stories.lisp")
(load "dev-frs.lisp")
(load "monkey-processed.lisp")

;(setf kite-gen-schema (match-story-to-schema *KITE-STORY* travel.v t))
;(print-schema (car kite-gen-schema))

; (setf story *PARSED-MONKEY-STORY*)
(setf *STORY* (car *DEV-FRS*))
; (setf story *MONKEY-STORY*)
;(setf story *PARSED-STORY-1*)


(defparameter *NUM-SHUFFLES* 20)
(defparameter *TOP-K* 5)
(defparameter *GENERALIZE* nil)
(defparameter *RUN-MATCHER* t)

; (defparameter *ALL-SCHEMAS-PLAYGROUND* *PROTOSCHEMAS*)
(defparameter *ALL-SCHEMAS-PLAYGROUND* (list 'do_action_to_enable_action.v 'take_object.v 'eat.v))


(defun gen-clean (schema)
	(rename-constraints (sort-steps (generalize-schema-constants schema)))
)


(defun run-matcher (story schemas)

(block outer

;(format t "story:~%")
;(loop for sent in story
;	do (format t "	~s~%~%" sent))

;(format t "word preds: ~s~%" (get-word-preds story))


(setf best-schemas (mapcar (lambda (x) (schema-pred x)) (top-k-schemas (get-word-preds story) (mapcar #'eval *PROTOSCHEMAS*) *TOP-K*)))

(load-story-time-model story)

(setf matches (make-hash-table :test #'equal))

;(format t "scores:~%")
;(loop for sc in scores do (format t "	~s~%" (- (car sc) (second sc))))
(if *RUN-MATCHER*
;(loop for i from 1 to 10 do 
(loop for protoschema in best-schemas do (block match-proto
	;(if (not (equal protoschema 'do_action_to_enable_action.v))
		; then
	;	(return-from match-proto)
	;)

	(setf best-match-res-pair (best-story-schema-match story (eval protoschema) *NUM-SHUFFLES* *GENERALIZE*))
	(setf best-match-res (car best-match-res-pair))
	(setf best-score (car best-match-res-pair))
	(setf best-match (second best-match-res-pair))
	(setf best-bindings (third best-match-res-pair))
	; (print-schema best-match)
	; (format t "deduped:~%")
	(if (and (schema? best-match) (not (equal '(0 0) best-score)))
		(progn
			(format t "best match for protoschema ~s (score ~s):~%~%" protoschema best-score)
			(setf match (dedupe-sections best-match))
			(print-schema match)
			; (print-schema (gen-clean match))
			(format t "~%~%~%")

			(setf (gethash protoschema matches) match)
		)
	)

	; (format t "bindings: ~s~%" (ht-to-str best-bindings))

	;(loop for var being the hash-keys of best-bindings do (block binding-loop
	;	(format 
	;))
))
;)
)

)
)

; (loop for story in ((lambda (x) (list (first x) (second x) (third x))) *DEV-FRS*)
; (loop for story in *DEV-FRS*
; (loop for story in (list *MONKEY-PROC-1* *MONKEY-PROC-2*)
(loop for story in (list *MONKEY-PROC-1*)
	do (run-matcher story *PROTOSCHEMAS*)
)

; (ahow)
;(format t "~s~%" (eval-time-prop '(E1.SK BEFORE.PR E3.SK)))
;(format t "~s~%" (eval-time-prop '(E3.SK BEFORE.PR E2.SK)))


(setf enable-match (gethash 'do_action_to_enable_action.v matches))
(setf get-match (gethash 'take_object.v matches))

(if nil (block ifnil

(format t "~%MERGING do_action_to_enable_action.v AND take_object.v~%")
(format t "(do_action_to_enable_action.v as external header~%~%")
; (print-schema (merge-schemas do_action_to_enable_action.v take_object.v))
(setf merged-schema (dedupe-sections (merge-schemas enable-match get-match)))
(print-schema merged-schema)
(format t "~%generalizing constants to variables:~%")
(setf gen-merge (generalize-schema-constants merged-schema))
(print-schema gen-merge)


;(setf ep-ids (extract-section-vars gen-merge ':Episode-relations))
; (print-ht time-graph)



(format t "~%cleaning up constraint IDs:~%")
(setf cleaned-schema (rename-constraints (sort-steps gen-merge)))
(print-schema cleaned-schema)

(setf cleaner-schema (clean-do-kas cleaned-schema))

(format t "~%even cleaner schema:~%")
(print-schema cleaner-schema)

))
