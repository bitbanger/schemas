(require :sb-sprof)

(declaim (sb-ext:muffle-conditions cl:warning))

; (setf *random-state* (make-random-state t))
; (setf *random-state* (make-random-state t))

(setf *SEED* 2)

(load "../ll-load.lisp")

(load "../stories/roc-mcguffey-stories.lisp")

(ll-load-superdir "new-ulf-parser.lisp")
(ll-load-superdir "el-to-ulf.lisp")
(ll-load-superdir "schema-matcher.lisp")
(ll-load-superdir "schema-link.lisp")
(ll-load-superdir "schema-util.lisp")
(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "ll-cache.lisp")
(ll-load-superdir "schema-to-english.lisp")

; (dbg-tag 'schema-postproc)

; 400 total ROCstories in set so far
(defparameter *NUM-DEV-STORIES* (length *ROC-MCGUFFEY*))

(defparameter *HANDLE-ERRORS* t)
(defparameter *PRINT-TRACES* t)

;(dbg-tag 'match)
;(dbg-tag 'unify)

; Optionally only process the story with this
; start line.
(setf story-start-line
	; "Billy liked this girl."
	; "The man made a bet."
	; "A little girl was born."
	; "It was snowing outside Tom's house one day."
	; "Allie was watching a show yesterday."
	; "Susie say a girl was playing ball."
	; "Kim needed some new chairs."
	; "Tom got a kitten."
	; "Mary wanted to stop working."
	; "I see one dog and two cats."
	; "Tom had a cabin near a river."
	; "The couple worked out."
	; "Michael was very shy."
	; "I was walking through the woods."
	; "Three birds are in the tree."
	; "The woman kissed a man."
	; "It was snowing outside Tom's house one day."
	; "The girls went to the pond."
	; "Ben's dog Skip was very old."
	; "Gary went to the pond."
	nil
)
(setf stories-processed 0)

(defparameter start-st (parse-integer (second sb-ext:*posix-argv*)))
(defparameter end-st (parse-integer (third sb-ext:*posix-argv*)))

(ldefun n-shuffles (lst seed)
	(if (equal seed 1)
		; then
		(shuffle lst)
		; else
		(shuffle (n-shuffles lst (- seed 1))))
)

; (let (el-story events schemas headers inds rcs)
(ldefun compose-schemas-from-stories ()
(block process-all-stories
(setf first-story-hit nil)
(loop for roc-story in (n-shuffles *ROC-MCGUFFEY* *SEED*)
		for story-num from 0
	if (and (or
			(null story-start-line)
			(equal story-start-line (car roc-story))
			first-story-hit
		)
		(>= story-num start-st)
		(< story-num end-st)
		)
		; then
		do
			(if *HANDLE-ERRORS*
				; then
				;(handler-case
				(handler-case (handler-bind ((error (lambda (c) (if *PRINT-TRACES* (sb-debug:backtrace) nil))))
				(progn
					(if (equal story-start-line (car roc-story))
						(setf first-story-hit t))
					(process-one-story roc-story)
				)
				) (error () (format nil "~%")))
				;) (error ()
					;(format t "error composing story schemas~%")
					;(format t "~s~%" (sb-debug:list-backtrace))
				;))
				; else
				(progn
					(if (equal story-start-line (car roc-story))
						(setf first-story-hit t))
					(process-one-story roc-story)
				)
			)
)))

(ldefun process-one-story (roc-story)
	(block process-story
		(if (>= stories-processed *NUM-DEV-STORIES*)
			; then
			(return-from process-story)
			; else
			(setf stories-processed (+ stories-processed 1))
		)

		(clear-ll-func-cache)

		;(if (and
				;(not (null story-start-line))
				;(not (equal (car roc-story) story-start-line))
			;)
			; then
			;(return-from process-story)
		;)
			

		(setf el-story nil)
		(setf events nil)
		(setf schema-match-tuples nil)

		;(handler-case
		(block parse-story
			(format t "parsing~%")
			(setf el-story (len-parse-sents roc-story))
			(format t "done parsing~%")

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

						do (if t (block print-story-el
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

		; Sometimes a story just has only atemporal
		; formulas; we can't really make a schema from
		; that, and it probably indicates a serious
		; parser failure anyway, so we probably don't
		; even want to try.
		(if (null events)
			(progn
				(format t "story had no temporal formulas~%")
				(return-from process-story)
			)
		)

		; (setf schemas (mapcar #'fully-clean-schema (mapcar #'car schema-match-tuples)))
		(setf schemas (mapcar #'car schema-match-tuples))
		(setf bound-schemas (mapcar (lambda (x) (apply-bindings (car x) (third x))) schema-match-tuples))
		(setf schemas-with-bindings (loop for tup in schema-match-tuples collect (list (car tup) (third tup))))
		; (format t "orig bound schemas:~%")
		; (loop for bs in bound-schemas
			;do (print-schema bs))

		; (setf coscoped-tup (fully-clean-coscoped-schemas bound-schemas t))
		; (setf coscoped-pairs (car coscoped-tup))
		; (setf coscoped-bindings (second coscoped-tup))
		; (setf schemas (mapcar #'car coscoped-pairs))
		; (setf bound-schemas (mapcar (lambda (x) (apply-bindings (car x) (second x))) coscoped-pairs))

		; Make sure shared vars are resolved so that all matched schemas can
		; share a scope!
		; (setf bound-schemas (uniquify-shared-vars-chain bound-schemas nil))

		; Clean and generalize constants in the schemas.
		; This procedure can rename some of the variables,
		; so we'll have to re-organize the bindings to use
		; the new variables names on the LHS.
		;(setf schema-clean-pairs
			;(loop for schema in schemas
				;collect (fully-clean-schema schema t)))

		;(setf schemas (mapcar #'car schema-clean-pairs))

		;(setf schema-post-clean-maps
			;(mapcar #'second schema-clean-pairs))

		;(setf bound-schemas
			;(loop for scp in schema-clean-pairs
				;collect
					;(apply-bindings (car scp) (second scp))))

		; (setf headers (loop for schema in schemas collect (schema-header schema)))
		(setf headers (loop for schema in bound-schemas collect (schema-header schema)))

		; (format t "steps: ~%")
		; (loop for ev in events do (format t "	~s~%" ev))
		(format t "schemas (w/ unbound vars): ~%")
		; (loop for header in headers do (format t "	~s~%" header))
		; (loop for schema in schemas do (print-schema (fully-clean-schema schema)))
		(loop for tuple in schema-match-tuples
				for schema in schemas
				for tup in schema-match-tuples
					for bound-schema in bound-schemas
			do (block get-bound-eps
			; if any story eps are bound to the header, they can be excused
			; from the steps section
			(setf used-eps (list (third (second bound-schema))))

			; also, if any story eps are bound to step IDs, they can be
			; excused as well
			(setf used-eps (remove-duplicates (append used-eps (mapcar #'car (section-formulas (get-section bound-schema ':Steps)))) :test #'equal))

			;(format t "unbound:~%")
			(print-schema schema)
			;(format t "bound:~%")
			;(print-schema bound-schema)
			; (format t "~%~%")
			; (format t "using episodes ~s: ~%" used-eps)

			; (format t "~%")
		))

		(setf inds (dedupe (intersection
						(union
							(get-elements-pred events #'canon-small-individual?)
							(get-elements-pred bound-schemas #'canon-small-individual?)
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
		; (setf new-schema (compose-schema rcs (append events headers) ep-rels))
		(setf new-schema (compose-schema rcs events schemas-with-bindings story-ep-rels))
		(print-schema new-schema)

		; (return-from process-story)

		;(format t "flattened composite schema: ~%")
		;(loop for phi in (flatten-schema new-schema t)
			;do (format t "	~s~%" phi)
		;)

		; At this point, we're going to compile all of the role constraints and events into a set of EL formulas, then let the EL-to-English code work its magic.

		(setf els-for-eng (append
			; Get all role constraints (sort by first arg)
			(sort
				(mapcar #'second (section-formulas (get-section new-schema ':Roles)))
				(lambda (x y)
					(< (rechash (prop-pre-args x)) (rechash (prop-pre-args y)))))

			; Get all steps
			(loop for st in (section-formulas (get-section new-schema ':Steps))
				collect (list (second st) '** (car st))
			)
		))

		(setf ulfs-for-eng (el-to-ulf els-for-eng))

		(format t "Schema in English (prototype): ~%")
		;(loop for eng in (el-to-eng els-for-eng)
			;do (format t "	~s~%" eng)
		;)
		(loop for eng in (schema-to-english new-schema)
			do (format t "	~a~%" eng))

	)
)

;(sb-sprof:with-profiling
;	(:max-samples 10000
;	  :max-depth 3
;	  :mode :alloc
;	  :report :graph)
(block profiled

	(compose-schemas-from-stories)

)
;)

; (print-ht *LDEFUN-CALLS*)
;(setf sorted-calls (sort (ht-pairs *LDEFUN-CALLS*) (lambda (x y) (> (second x) (second y)))))
;(loop for sc in sorted-calls
	;do (format t "~s: ~d~%" (car sc) (second sc)))
