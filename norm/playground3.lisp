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

;(setf kite-gen-schema (match-story-to-schema *KITE-STORY* go_somewhere.v t))
;(print-schema (car kite-gen-schema))

; (setf story *PARSED-MONKEY-STORY*)
(setf *STORY* (car *DEV-FRS*))
; (setf story *MONKEY-STORY*)
;(setf story *PARSED-STORY-1*)



(defparameter *enable-template*
'(epi-schema (() ** ?e)
)
)



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


(setf best-schemas (mapcar (lambda (x) (second (car (second x)))) (top-k-schemas (get-word-preds story) (mapcar #'eval *PROTOSCHEMAS*) *TOP-K*)))

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

	(return-from outer (loop for k being the hash-keys of matches collect (gethash k matches)))

)
)

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
				))
		)
		; (setf all-matches (append all-matches (run-matcher story *PROTOSCHEMAS*)))
		(setf story-matches (list))
		(loop for m in (run-matcher story *PROTOSCHEMAS*)
			do (block vet-matches
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
					)
				)
			)
		)

		(loop for match in story-matches do (progn
			; (format t "match: ~s~%" (car (second match)))
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
						(if (equal match1 match2)
							; then
							(return-from link-block)
						)
	
						(if (link-schemas-onedir match1 match2)
							(progn
							; (format t "~s to enable ~s~%" (car (second match1)) (car (second match2)))
							;(format t "~s~%" match1)
							;(format t "~s~%" match2)
							(print-schema match1)
							(print-schema match2)
							(format t "match1 schema name is ~s~%" (second (car (second match1))))
							(format t "match1 schema is ~s~%" (eval (second (car (second match1)))))
							(format t "match2 schema name is ~s~%" (second (car (second match2))))
							(format t "match2 schema is ~s~%" (eval (second (car (second match2)))))
							; (format t "~s schema_name ~s~%" (car (car (second match1))) (remove-duplicates (append (cddr (car (second match1))) (cddr (car (second match2)))) :test #'equal))

							(setf new-schema-header (append (list (car (car (second match1))) 'act_on.v) (remove-duplicates (append (cddr (car (second match1))) (cddr (car (second match2)))) :test #'equal)))

							(setf new-schema (list 'epi-schema (list new-schema-header '** '?e) (list ':Steps)))

							(setf new-schema (add-constraint new-schema ':Steps (list 'not (list (car (car (second match2))) (list 'can.md (cdr (car (second match2))))))))
							(setf new-schema (add-constraint new-schema ':Steps (car (second match1))))
							(setf new-schema (add-constraint new-schema ':Steps (list (car (car (second match2))) (list 'can.md (cdr (car (second match2)))))))
							(setf new-schema (add-constraint new-schema ':Steps (car (second match2))))

							(setf new-schema (add-constraint new-schema ':Episode-relations '(?E1 before ?E2)))
							(setf new-schema (add-constraint new-schema ':Episode-relations '(?E2 cause.v ?E3)))
							(setf new-schema (add-constraint new-schema ':Episode-relations '(?E4 during ?E3)))

							(print-schema (generalize-schema-constants new-schema))


							(setf flat-schema (merge-schemas new-schema match1))
							(setf flat-schema (clean-do-kas (rename-constraints (sort-steps (dedupe-sections flat-schema)))))
							(setf flat-schema (merge-schemas flat-schema match2))
							(setf flat-schema (clean-do-kas (rename-constraints (sort-steps (dedupe-sections flat-schema)))))
							(setf flat-schema (generalize-schema-constants flat-schema))


							(print-schema flat-schema)

							)
						)
					)
				)
			)
		)

		(format t "~%~%")
	)
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
