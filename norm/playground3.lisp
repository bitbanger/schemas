(require :sb-sprof)

(declaim (sb-ext:muffle-conditions cl:warning))

(setf *random-state* (make-random-state t))

(load "norm-schema-util.lisp")
(load "norm-protoschemas.lisp")
(load "norm-stories.lisp")
(load "norm-unify.lisp")
(load "norm-match.lisp")
(load "real_util.lisp")
(load "norm-time.lisp")
(load "parsed-stories.lisp")
(load "dev-frs.lisp")
(load "monkey-processed.lisp")
(load "norm-link.lisp")
(load "dev-story-sents.lisp")
(load "schema-parser.lisp")

;(setf kite-gen-schema (match-story-to-schema *KITE-STORY* travel.v t))
;(print-schema (car kite-gen-schema))

; (setf story *PARSED-MONKEY-STORY*)
(setf *STORY* (car *DEV-FRS*))
; (setf story *MONKEY-STORY*)
;(setf story *PARSED-STORY-1*)



(defparameter *enable-template*
'(epi-schema (() ** ?e)
)
)



(defparameter *NUM-SHUFFLES* 30)
(defparameter *TOP-K* 5)
(defparameter *GENERALIZE* nil)
(defparameter *RUN-MATCHER* t)

; (defparameter *ALL-SCHEMAS-PLAYGROUND* *PROTOSCHEMAS*)
(defparameter *ALL-SCHEMAS-PLAYGROUND* (list 'do_action_to_enable_action.v 'receiving_verb? 'eat.v))


(defun gen-clean (schema)
	(rename-constraints (sort-steps (generalize-schema-constants schema)))
)

(defun run-matcher (story schemas)
(block outer
	;(setf rm-result nil)
	;(sb-sprof:with-profiling (:max-samples 10000
	;						  :max-depth 3
	;						  :mode :alloc
	;						  :report :graph)
	;	(setf rm-result (uninstrumented-run-matcher story schemas)))
	;(return-from outer rm-result)
	(return-from outer (uninstrumented-run-matcher story schemas))
)
)

(defun uninstrumented-run-matcher (story schemas)

(block outer

;(format t "story:~%")
;(loop for sent in story
;	do (format t "	~s~%~%" sent))

;(format t "word preds: ~s~%" (get-word-preds story))

; (format t "protoschemas are ~s~%" *PROTOSCHEMAS*)

; Preload all Wordnet hypernym ladders for the
; story and for all schemas in two big batch
; calls
; (batch-cache-preload-wordnet-hyps (get-single-word-preds story))
(setf all-schema-words (list))
(loop for schema in *PROTOSCHEMAS*
	do (setf all-schema-words (union all-schema-words (get-word-preds (eval schema)) :test #'equal))
)
; (batch-cache-preload-wordnet-hyps all-schema-words)

(setf best-schemas (mapcar (lambda (x) (second (car (second x)))) (top-k-schemas (get-single-word-preds story) (mapcar #'eval *PROTOSCHEMAS*) *TOP-K*)))
(format t "best schemas are ~s~%" best-schemas)

(load-story-time-model story)

(setf matches (make-hash-table :test #'equal))
(setf match-scores (make-hash-table :test #'equal))

;(format t "scores:~%")
;(loop for sc in scores do (format t "	~s~%" (- (car sc) (second sc))))
(if *RUN-MATCHER*
;(loop for i from 1 to 10 do 
(loop for protoschema in best-schemas do (block match-proto
	;(if (not (equal protoschema 'do_action_to_enable_action.v))
		; then
	;	(return-from match-proto)
	;)

	(loop for best-match-res-pair in (top-k-story-schema-matches story (eval protoschema) *NUM-SHUFFLES* *GENERALIZE* 2) do (block process-each

	; (setf best-match-res-pair (best-story-schema-match story (eval protoschema) *NUM-SHUFFLES* *GENERALIZE*))
	(setf best-match-res (car best-match-res-pair))
	(setf best-score (car best-match-res-pair))
	(setf best-match (second best-match-res-pair))
	(setf best-bindings (third best-match-res-pair))
	; (print-schema best-match)
	; (format t "deduped:~%")
	(if (and (schema? best-match) (not (equal '(0 0) best-score)))
		(progn
			; (format t "best match for protoschema ~s (score ~s):~%~%" protoschema best-score)
			; (format t "best match schema is ~s~%" (schema-name best-match))
			; (format t "best match for protoschema ~s (score ~s):~%~%" protoschema best-score)

			(setf match (dedupe-sections best-match))
			; (setf match (apply-bindings (eval protoschema) best-bindings))

			; (print-schema match)
			; (format t "match: ~s~%" (car (second match)))
			; (format t "header is ~s~%" (second match))
			; (format t "additional rigid constraints:~%")
			(loop for k being the hash-keys of best-bindings
				do (if (not (member k (car (second (eval protoschema))) :test #'equal))
					; then
					; CHANGE TO FORMAT T TO RE-ENABLE
					(format nil "	~s~%" (list (list (var-to-sk-fn k) (third (second (eval protoschema)))) '= (gethash k best-bindings)))
				)
			)
			; (print-schema (gen-clean match))
			; (format t "~%~%~%")

			(setf (gethash protoschema matches) (append (gethash protoschema matches) (list match)))
			(setf (gethash protoschema match-scores) (append (gethash protoschema match-scores) (list best-score)))
		)
	)
	))

	; (format t "bindings: ~s~%" (ht-to-str best-bindings))

	;(loop for var being the hash-keys of best-bindings do (block binding-loop
	;	(format 
	;))
))
;)
)

	(return-from outer (loop for k being the hash-keys of matches append
		(loop for match in (gethash k matches)
				for match-score in (gethash k match-scores)
			collect (list match match-score))
		; (list (gethash k matches) (gethash k match-scores))
	))

)
)

(setf new-schemas (list))
(setf new-schema-names (list))

(setf all-matches (list))
; (loop for story in ((lambda (x) (list (first x) (second x) (third x))) *DEV-FRS*)
; (loop for story in (list *MONKEY-PROC-1* *MONKEY-PROC-2*)
; (loop for story in (list *MONKEY-PROC-1*)
; (loop for story in *DEV-FRS*
; (loop for raw-story in *DEV-STORY-SENTS*
(loop for raw-story in (list (fourth *DEV-STORY-SENTS*))
	do (block matchblock
		(setf story 
			(loop for sent in (parse-story raw-story)
				collect (loop for wff in sent
					if (canon-prop? wff) collect wff
					if (canon-prop? wff) do (format t "~s~%" wff)
				))
		)

		(format t "story 1: ~s~%" raw-story)

		; (setf all-matches (append all-matches (run-matcher story *PROTOSCHEMAS*)))
		(setf story-matches (list))
		(setf matchcnt 0)
		(loop for m-pair in (run-matcher story *PROTOSCHEMAS*)
			do (setf matchcnt (+ 1 matchcnt))
			do (block vet-matches
				(setf m (car m-pair))
				(setf score (second m-pair))
				(if (and
						(or (null (get-section m ':Steps)) (null (section-formulas (get-section m ':Steps))))
						(not (varp (third (second m))))
					)
					; then
					(setf story-matches (append story-matches (list m)))
					; else
					(if (loop for v in (mapcar #'car (section-formulas (get-section m ':Steps))) thereis (not (varp v)))
						; then
						(setf story-matches (append story-matches (list m)))
						; else
						(format t "ignoring match ~s~%" (second m))
					)
				)
			)
		)
		(format t "~s matches~%" matchcnt)

		(loop for match in story-matches do (progn
			(format t "match: ~s~%" (second match))
			;(setf gen-match (generalize-schema-constants match))
			;(setf new-name (new-schema-match-name (second (car (second match)))))
			;(setf new-header (list (car (car (second gen-match))) new-name (cdr (car (second gen-match)))))
			;(setf gen-match (set-header gen-match new-header))
			;(format t "gen match: ~s~%" gen-match)

			; NOTE: when we create the generalization, we need to map the constants to the new variable names to create an updated binding list for the new schema. That way, subordinate constraints not in the header can be properly specified with the new variable names. Not an issue for monkey example #1.
		))

		(format t "~%")

		(if (> (length story-matches) 1)
			; then
			(loop for match1 in story-matches do
				(loop for match2 in story-matches do
					(block link-block
						; don't link two things that have the same episode;
						; they don't have a causal relationship!
						(if (equal (third (second match1)) (third (second match2)))
							; then
							(return-from link-block)
						)
	
						(setf link-bindings (link-schemas-onedir match1 match2 story))
						(if (not (null link-bindings))
							(progn
							; (format t "matched ~s and ~s~%" (third link-bindings) (fourth link-bindings))
							; (format t "post bindings are ~s~%" (ht-to-str (car link-bindings)))
							; (format t "pre bindings are ~s~%" (ht-to-str (second link-bindings)))
							(if (not (null (car link-bindings)))
								(setf match1 (apply-bindings match1 (car link-bindings)))
							)
							(if (not (null (second link-bindings)))
								(setf match2 (apply-bindings match2 (second link-bindings)))
							)
							; (format t "~s to enable ~s~%" (car (second match1)) (car (second match2)))
							;(format t "~s~%" match1)
							;(format t "~s~%" match2)
							;(print-schema match1)
							;(print-schema match2)
							;(format t "match1 schema name is ~s~%" (second (car (second match1))))
							;(format t "match1 schema is ~s~%" (eval (second (car (second match1)))))
							;(format t "match2 schema name is ~s~%" (second (car (second match2))))
							;(format t "match2 schema is ~s~%" (eval (second (car (second match2)))))
							; (format t "~s schema_name ~s~%" (car (car (second match1))) (remove-duplicates (append (cddr (car (second match1))) (cddr (car (second match2)))) :test #'equal))

							(setf new-schema-header (append (list (car (car (second match1))) 'act_on.v) (remove-duplicates (append (cddr (car (second match1))) (cddr (car (second match2)))) :test #'equal)))

							(setf new-schema (list 'epi-schema (list new-schema-header '** '?e) (list ':Steps)))

							(setf new-schema (add-constraint new-schema ':Steps (list 'not (list (car (car (second match2))) (list 'can.md (cdr (car (second match2))))))))
							(setf new-schema (add-constraint-with-const new-schema ':Steps (car (second match1)) (third (second match1))))
							(setf new-schema (add-constraint new-schema ':Steps (list (car (car (second match2))) (list 'can.md (cdr (car (second match2)))))))
							(setf new-schema (add-constraint-with-const new-schema ':Steps (car (second match2)) (third (second match2))))

							(setf new-e2 (third (second match1)))
							(setf new-e4 (third (second match2)))
							(setf new-schema (add-constraint new-schema ':Episode-relations (list '?E1 'before new-e2)))
							(setf new-schema (add-constraint new-schema ':Episode-relations (list new-e2 'cause.v '?E3)))
							(setf new-schema (add-constraint new-schema ':Episode-relations (list new-e4 'during '?E3)))
							; (format t "new schema is ~s~%" new-schema)

							(setf new-schema-name (new-schema-match-name 'act_on.v))
							(setf new-schema (replace-vals 'act_on.v new-schema-name new-schema))

							(setf new-schemas (append new-schemas (list (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants new-schema)))))))
							(setf new-schema-names (append new-schema-names (list new-schema-name)))
							(set (second (car (second new-schema))) new-schema)
							; (format t "LEARNED NEW SCHEMA (~s): ~s~%" (second (car (second new-schema))) act_on.v)
							(format t "LEARNED NEW SCHEMA:~%")

							(print-schema (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants new-schema)))))
							; (print-schema (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants (eval (second (car (second match1)))))))))
							; (print-schema (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants (eval (second (car (second match2)))))))))
							; (print-schema (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants new-schema)))))




							(setf flat-schema (merge-schemas new-schema match1))
							(setf flat-schema (merge-schemas flat-schema match2))
							; (print-schema flat-schema)
							(setf flat-schema (clean-do-kas (rename-constraints (sort-steps (dedupe-sections flat-schema)))))
							(setf flat-schema (generalize-schema-constants flat-schema))


							; (print-schema flat-schema)

							)
						)
					)
				)
			)
		)

		(format t "~%~%")
	)
)


; (setf *DBG-TAGS* '(match))
(setf *PROTOSCHEMAS* (append *PROTOSCHEMAS* new-schema-names))
; (setf *PROTOSCHEMAS* (append *PROTOSCHEMAS* (list 'ACT_ON.V)))
; (format t "phase 2 schemas: ~s~%" *PROTOSCHEMAS*)

		(setf next-story 
			(loop for sent in (parse-story (second *DEV-STORY-SENTS*))
				collect (loop for wff in sent
					if (canon-prop? wff) collect wff
					if (canon-prop? wff) do (format t "~s~%" wff)
				))
		)
		(format t "story 2: ~s~%" (second *DEV-STORY-SENTS*))
		(load-story-time-model next-story)

		(setf story-matches nil)
		; (setf *PROTOSCHEMAS* (list 'ACT_ON.V))
		(loop for m-pair in (run-matcher next-story (list 'ACT_ON.V))
			do (block vet-matches
				(setf m (car m-pair))
				(setf score (second m-pair))
				(if (and
						(or (null (get-section m ':Steps)) (null (section-formulas (get-section m ':Steps))))
						(not (varp (third (second m))))
					)
					; then
					(setf story-matches (append story-matches (list (list m score))))
					; else
					(if (loop for v in (mapcar #'car (section-formulas (get-section m ':Steps))) thereis (not (varp v)))
						; then
						(setf story-matches (append story-matches (list (list m score))))
					)
				)
			)
		)
		; (format t "story matches: ~s~%" story-matches)
		(format t "story matches:~%")
		(loop for sm in story-matches
			do (format t "~s confirmed, ~s contradiction~a:~%" (car (second sm)) (second (second sm)) (if (= 1 (second (second sm))) "" "s"))
			do (print-schema (car sm))
		)

(setf act-on-match (car (car story-matches)))

; (format t "got act on match ~s~%" act-on-match)

(expand-nested-schemas act-on-match next-story)




; (ahow)
;(format t "~s~%" (eval-time-prop '(E1.SK BEFORE.PR E3.SK)))
;(format t "~s~%" (eval-time-prop '(E3.SK BEFORE.PR E2.SK)))


