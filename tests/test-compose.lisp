(declaim (sb-ext:muffle-conditions cl:warning))

(setf *random-state* (make-random-state t))

(load "../ll-load.lisp")

(load "../stories/roc-mcguffey-stories.lisp")

(ll-load-superdir "new-ulf-parser.lisp")
(ll-load-superdir "el-to-ulf.lisp")
(ll-load-superdir "schema-matcher.lisp")
(ll-load-superdir "schema-link.lisp")
(ll-load-superdir "schema-util.lisp")
(ll-load-superdir "ll-util.lisp")

; 400 total ROCstories in set so far
(defparameter *NUM-DEV-STORIES* (length *ROC-MCGUFFEY*))

; (dbg-tag 'match)
; (dbg-tag 'unify)

; Optionally only process the story with this
; start line.
(setf story-start-line
	; "Billy liked this girl."
	; "The man made a bet."
	; "A little girl was born."
	; "It was snowing outside Tom's house one day."
	; "Allie was watching a show yesterday."
	; "Susie say a girl was playing ball."
	"The girls went to the pond."
	; nil
)
(setf stories-processed 0)

; (let (el-story events schemas headers inds rcs)
(ldefun compose-schemas-from-stories ()
(block process-all-stories
(loop for roc-story in (shuffle *ROC-MCGUFFEY*)
	if (or
			(null story-start-line)
			(equal story-start-line (car roc-story)))
		; then
		do (process-one-story roc-story)
)))

(ldefun process-one-story (roc-story)
	(block process-story
		(if (>= stories-processed *NUM-DEV-STORIES*)
			; then
			(return-from process-story)
			; else
			(setf stories-processed (+ stories-processed 1))
		)

		(if (and
				(not (null story-start-line))
				(not (equal (car roc-story) story-start-line))
			)
			; then
			(return-from process-story)
		)
			

		(setf el-story nil)
		(setf events nil)
		(setf schema-match-tuples nil)

		; (handler-case
		(block parse-story
			(setf el-story (len-parse-sents roc-story))

			(setf el-story-invalid
				(loop for sent in el-story
					collect (loop for wff in sent if (not (canon-prop? wff)) collect wff)))

			(setf el-story
				(loop for sent in el-story
					collect (loop for wff in sent if (canon-prop? wff) collect wff)))

			(format t "story: ~%")
			(loop for eng-sent in roc-story
					for el-sent in el-story
					for invalid-sent in el-story-invalid
						do (format t "	~s~%" eng-sent)

						do (if nil (block print-story-el
						(format t "	VALID:~%")
						(loop for wff in el-sent
							do (format t "		~s~%" wff))

						(if (> (length invalid-sent) 0)
							(progn
								(format t "	INVALID:~%")
								(loop for wff in invalid-sent
									do (format t "		~s~%" wff))
							))
						))

						; Some padding between this and the next
						; story's output block
						do (format t "~%")
			)

			(setf events (loop for sent in el-story append (loop for wff in sent if (canon-charstar? wff) collect wff)))

			(setf schema-match-tuples (top-story-matches-easy-el el-story))
			)
			;(error ()
				;(progn
					;(format t "story processing error~%")
					;(return-from process-story)
				;)))

		(setf schemas (mapcar #'car schema-match-tuples))
		(setf bound-schemas (loop for tuple in schema-match-tuples
			collect (apply-bindings (car tuple) (third tuple))
		))

		; (setf headers (loop for schema in schemas collect (schema-header schema)))
		(setf headers (loop for schema in bound-schemas collect (schema-header schema)))

		; (format t "steps: ~%")
		; (loop for ev in events do (format t "	~s~%" ev))
		(format t "schemas: ~%")
		; (loop for header in headers do (format t "	~s~%" header))
		; (loop for schema in schemas do (print-schema (fully-clean-schema schema)))
		(loop for tuple in schema-match-tuples do (block get-bound-eps
			(setf bound-match (apply-bindings (car tuple) (third tuple)))

			; if any story eps are bound to the header, they can be excused
			; from the steps section
			(setf used-eps (list (third (second bound-match))))

			; also, if any story eps are bound to step IDs, they can be
			; excused as well
			(setf used-eps (remove-duplicates (append used-eps (mapcar #'car (section-formulas (get-section bound-match ':Steps)))) :test #'equal))

			; (format t "using episodes ~s: ~%" used-eps)
			(setf final-learned-schema (fully-clean-schema (car tuple)))

			(print-schema final-learned-schema)

			; We should also register the schema, so it can
			; be expanded as a nested step in the composed
			; schema, and just so it can be used later as
			; a learned schema on its own.
			(register-schema final-learned-schema)

			; (format t "~%")
		))

		(setf inds (dedupe (intersection
						(union
							(get-elements-pred events #'canon-small-individual?)
							(get-elements-pred schemas #'canon-small-individual?)
							:test #'equal
						)
						(get-elements-pred el-story #'canon-small-individual?) :test #'equal)))
		(setf rcs (list))
		; (format t "individuals: ~%")
		(loop for ind in inds
			; do (format t "	~s~%" ind)
			do (block print-cnstrs
				(setf constrs (story-select-term-constraints (linearize-story el-story) (list ind)))
				(setf constrs
					(loop for c in constrs
						if (and
								(canon-prop? c)
								(has-element c ind)
								(not (has-element c 'HAS-DET.PR))
								(not (time-prop? c)))
							collect c
					)
				)
				(setf constrs (dedupe constrs))
				(setf rcs (append rcs constrs))
				(loop for constr in constrs
					; do (format t "		~s~%" constr)
				)
			)
		)

		(setf rcs (dedupe rcs))



		; (format t "all constraints being added: ~%")
		; (loop for constr in rcs
			; do (format t "	~s~%" constr)
		; )

		; Collect all story event episodes that are either
		; bound to header episodes or step episodes in
		; matched schemas; these don't need to be steps in
		; the composite schema.
		(setf used-eps (list))
		(loop for schema in bound-schemas
			do (block get-eps
				; add the header episode
				(setf used-eps (append used-eps (list (third (second schema)))))

				; add all step episodes
				(setf used-eps (append used-eps (mapcar #'car (section-formulas (get-section schema ':Steps)))))

				; deduplicate
				(setf used-eps (dedupe used-eps))
			)
		)

		; Remove the matched episodes from the events list.
		(setf events
			(loop for event in events
				if (not (contains used-eps (third event)))
					collect event
			)
		)

		; Collect episode relations from the story,
		; and inferred ones from the schemas, and
		; provide them to the composer to order the
		; steps correctly.
		(setf story-ep-rels (loop for phi in (linearize-story el-story) if (time-prop? phi) collect phi))

		(setf matched-schema-ep-rels (loop for bound-schema in bound-schemas
			append (mapcar #'second (section-formulas (get-section bound-schema ':Episode-relations)))))

		(setf ep-rels (dedupe (append story-ep-rels matched-schema-ep-rels)))
		; (setf ep-rels (append ep-rels (list '(NOW1 (BEFORE E6.SK)))))

		; Compose a schema from the matched schemas,
		; story events, and story constraints
		(setf new-schema (compose-schema rcs (append events headers) ep-rels))
		(print-schema new-schema)

		; At this point, we're going to compile all of the role constraints and events into a set of EL formulas, then let the EL-to-English code work its magic.

		(setf els-for-eng (append
			; Get all role constraints
			(mapcar #'second (section-formulas (get-section new-schema ':Roles)))

			; Get all steps
			(loop for st in (section-formulas (get-section new-schema ':Steps))
				collect (list (second st) '** (car st))
			)
		))

		(setf ulfs-for-eng (el-to-ulf els-for-eng))

		(format t "Schema in English (prototype): ~%")
		(loop for eng in (el-to-eng els-for-eng)
			do (format t "	~s~%" eng)
		)

	)
)

(compose-schemas-from-stories)
