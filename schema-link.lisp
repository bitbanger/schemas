(load "ll-load.lisp")

(ll-load "schema-util.lisp")
(ll-load "schema-unify.lisp")
(ll-load "schema-match.lisp")

; norm-link.lisp contains functions to link schemas together by their
; pre- and post-conditions.

(ldefun link-schemas-onedir (schema-post schema-pre story)
(block outer
	(setf schema-pre-uniq nil)
	(setf schema-post-uniq nil)
	(setf bindings nil)
	(let ((uniq-pair (uniquify-shared-vars schema-pre schema-post)))
		(progn
			(setf schema-pre-uniq (car uniq-pair))
			(setf schema-post-uniq (second uniq-pair))
		)
	)

	(setf story-time-props
		(loop for phi in (linearize-story story)
			if (time-prop? phi) collect phi))

	(setf all-ep-rels
		(loop for schema in (list schema-post schema-pre)
			append (mapcar #'second (section-formulas (get-section schema ':Episode-relations)))
		)
	)

	; (format t "time model: ~s~%" (append story-time-props all-ep-rels))
	(handler-case (load-time-model (append story-time-props all-ep-rels))
		(error () (progn (dbg 'link "error loading time model~%") (return-from outer nil)))
	)


	; (format t "trying to link ~s and ~s~%" (second schema-post) (second schema-pre))
	(setf schema-post-ep (third (second schema-post)))
	(setf schema-pre-ep (third (second schema-pre)))
	(loop for post-pair in (section-formulas (get-section schema-post ':Postconds))
		do (loop for pre-pair in (section-formulas (get-section schema-pre ':Preconds))
			do (block match-conds
				; (format t "checking post-pair ~s and pre-pair ~s (post-ep ~s and pre-ep ~s))~%" post-pair pre-pair schema-post-ep schema-pre-ep)
				(if
					; NOTE: this "precond-of" only means Allen time rel (p m),
					; and doesn't do any causation testing.
					; (not (eval-time-prop (list schema-post-ep 'after schema-pre-ep)))
					(eval-time-prop (list schema-post-ep 'precond-of schema-pre-ep))
					; then
					(block check-pre-post

						; (allen-how schema-post-ep schema-pre-ep)

						(setf post (second post-pair))
						(setf pre (second pre-pair))
						; (format t "matching pre ~s and post ~s~%" pre post)
						(setf post-bindings (unify post pre nil schema-post nil))
						(setf pre-bindings (unify pre post nil schema-pre nil))
						;(format t "post-bindings are ~s~%" (ht-to-str post-bindings))
						;(format t "pre-bindings are ~s~%" (ht-to-str pre-bindings))

						(if (or (or (not (null post-bindings)) (not (null pre-bindings))) (equal pre post))
							; then
							(progn
							; (format t "matched pre ~s and post ~s~%" pre post)
							(return-from outer (list post-bindings pre-bindings post pre))
							)
						)
					)
				)
			)
		)
	)

	(return-from outer nil)
)
)

; Find all pairs of schema matches that link up by
; pre/postconds, then find all triples, etc. up to
; k-tuples.
(ldefun link-matches (matches story k)
(let (match-chains new-match-chains)
(block outer
	(setf match-chains (loop for m in matches collect (list m)))
	(setf new-match-chains (list))

	; for all chains length 2 to k...
	(loop for i from 2 to k do (block k-loop
		; try to extend each chain in the working set
		(loop for match in matches
			; We're going to try inserting this match at the
			; beginning and end of each existing chain independently.
			; The idea is to generate all length-i chains this round.
			do (loop for chain in match-chains do (block extend-loop
				; Don't duplicate length i-1 matches
				(if (< (length chain) (- i 1))
					(return-from extend-loop)
				)
				; Check that the episode of this match isn't already
				; in the chain.
				(if (loop for e in chain thereis (equal (third (second e)) (third (second match))))
					; then
					(return-from extend-loop)
				)
				; First, try to unify the match's postconditions
				; with the chain's preconditions.
				(setf added-before-bindings (link-schemas-onedir match (car chain) story))
				(if (not (null added-before-bindings))
					; then
					; We've added the match at the beginning of this chain.
					(block added-before
						; (format t "apply-bindings call ~d~%" 1)
						(setf new-match (apply-bindings match (car added-before-bindings)))
						; (format t "apply-bindings call ~d~%" 2)
						(setf new-chain (apply-bindings chain (second added-before-bindings)))
						(setf new-match-chains
							(append new-match-chains (list (append (list new-match) new-chain))))
					)
				)
				; Next, try to unify the match's preconditions
				; with the chain's postconditions.
				(setf added-after-bindings (link-schemas-onedir (car (last chain)) match story))
				
				(if (not (null added-after-bindings))
					; then
					; We've added the match at the end of this chain.
					(block added-after
						; (format t "apply-bindings call ~d~%" 3)
						(setf new-chain (apply-bindings chain (car added-after-bindings)))
						; (format t "apply-bindings call ~d~%" 4)
						(setf new-match (apply-bindings match (second added-after-bindings)))
						(setf new-match-chains
							(append new-match-chains (list (append new-chain (list new-match)))))
					)
				)
		)))

		; all length-i chains have been generated, so we'll add all the chains we've
		; generated to the chain list and continue on
		(setf match-chains (append match-chains new-match-chains))
	))

	; Remove explicit duplicates.
	(setf match-chains (remove-duplicates match-chains
		:test (lambda (c1 c2) (equal (mapcar #'second c1) (mapcar #'second c2)))))

	; Remove subchains.
	(setf deduped-match-chains (list))
	(loop for c1 in match-chains for i from 0 do (block dd-outer
		(loop for c2 in match-chains for j from 0 do (block dd-inner
			(if (equal i j)
				(return-from dd-inner)
			)

			(if (has-subseq-pred
					(mapcar #'second c2)
					(mapcar #'second c1)
					; Two chains of schema headers are equal if, for each header
					; of each chain sharing the same index, those headers are equal
					; modulo a successful variable unification.
					(lambda (l1 l2)
						(and
							(listp l1) (listp l2) (equal (length l1) (length l2))
							(loop for e1 in l1 for e2 in l2
								always (equal-with-unification e1 e2)
							)
						)
					)
				)
				; then
				(return-from dd-outer)
			)
		))

		(setf deduped-match-chains
			(append deduped-match-chains (list c1)))

		)
	)

	(setf match-chains deduped-match-chains)

	(return-from outer match-chains)
)
)
)

; mk-chain-schema takes a chain of schemas, linked by their pre-
; and post-conditions, and creates a superordinate schema with
; the chained schemas as steps.
(ldefun mk-chain-schema (chain)
(block outer
	(setf comp-preds (loop for m in chain collect (prop-pred (car (second m)))))
	(setf comp-words (loop for cp in comp-preds collect (remove-ext (get-schema-match-name cp) ".V")))
	(setf new-schema-pred (intern (format nil "~s_~s_~s.PR" (car comp-words) (second comp-words) (third comp-words))))
	
	(setf new-schema-args (loop for arg in
		(loop for m in chain append (cddr (car (second m))))
		 if (symbolp arg) collect arg))
	(setf new-schema-args (remove-duplicates new-schema-args :test #'equal))
	(setf new-schema-header (append (list (car (car (second (car chain))))) (list new-schema-pred) new-schema-args))

	(setf new-schema (list 'epi-schema (list new-schema-header '** '?e) (list ':Steps)))

	(loop for m in chain
		do (setf new-schema (add-constraint-with-const new-schema ':Steps (car (second m)) (third (second m))))
	)

	;(setf new-es (loop for m1 in chain for m2 in (cdr chain)
	;	do (setf new-schema (add-constraint new-schema ':Episode-relations
	;		(list (third (second m1)) 'before (third (second m2)))
	;	))
	;))



	(setf new-schema (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants new-schema)))))

	(setf all-rcs (list))
	(setf new-pres (list))
	(setf new-posts (list))

	; If we have matches embedded as steps, we're going to move their role constraints
	; and pre/postconditions into the embedding schema. This is largely for clarity and
	; display purposes, and can be skipped if the embedded schemas retain their unique
	; match names.
	(loop for st in (section-formulas (get-section new-schema ':Steps))
		for i from 0
		do (block inv-loop
			(if (not (invokes-schema? (second st)))
				(format t "~s doesn't invoke a schema~%" (second st))
				(return-from inv-loop)
			)
			(setf inv-pair (expand-nested-schema st new-schema))
						; (format t "apply-bindings call ~d~%" 5)
			(setf inv-schema (apply-bindings (car inv-pair) (second inv-pair)))
			(setf except (loop for k  being the hash-keys of (second inv-pair) collect k))
			(setf deduped-schema (second (uniquify-shared-vars-except new-schema (car inv-pair) except)))
						; (format t "apply-bindings call ~d~%" 6)
			(setf deduped-schema (apply-bindings deduped-schema (second inv-pair)))

			(if (equal i 0)
				(setf new-pres (loop for pre in (section-formulas (get-section deduped-schema ':Preconds)) collect (second pre)))
			)
			(setf new-posts (loop for post in (section-formulas (get-section deduped-schema ':Postconds)) collect (second post)))

			(setf rcs (loop for rc in (section-formulas (get-section deduped-schema ':Roles))
				collect (second rc)
			))
			(setf rcs (remove-duplicates rcs :test #'equal))

			(setf rcs (loop for rc in rcs if (loop for v in (get-elements-pred rc #'varp) always (has-element new-schema v)) collect rc))
			(setf rcs (sort rcs (lambda (a b) (< (sxhash (car a)) (sxhash (car b))))))
			(setf all-rcs (append all-rcs rcs))
		)
	)

	(setf deduped-rcs (remove-duplicates all-rcs :test #'equal))
	(setf unsubsumed-rcs (list))
	(loop for rc1 in deduped-rcs do (block ddp
		(if (loop for rc2 in deduped-rcs never (and
			(not (equal rc1 rc2))
			(equal
				(append (prop-pre-args rc1) (prop-post-args rc1))
				(append (prop-pre-args rc2) (prop-post-args rc2))
			)
			(subsumes (prop-pred rc1) (prop-pred rc2))
			))
			(setf unsubsumed-rcs (append unsubsumed-rcs (list rc1)))
		)
	))

	(loop for rc in unsubsumed-rcs
		do (setf new-schema (add-constraint new-schema ':Roles rc))
	)
	(loop for pre in new-pres
		do (setf new-schema (add-constraint new-schema ':Preconds pre)))
	(loop for post in new-posts
		do (setf new-schema (add-constraint new-schema ':Postconds post)))

	(setf new-schema-name (create-from-match new-schema))
	(setf new-schema (eval new-schema-name))

	(setf new-schemas (append new-schemas (list new-schema)))
	(setf new-schema-names (append new-schema-names (list new-schema-name)))
	(return-from outer new-schema)
)
)

(ldefun compose-schema (roles events schema-event-tups story-ep-rels &optional should-add-subords avoid-gen)
(let (
	new-schema
)
(block outer
	; Create an empty new schema to populate.

	; To create the new schema, we need to make its
	; header, and to make the header, we need the header
	; arguments. We'll choose all individuals that are
	; postfix arguments of the steps as the postfix
	; arguments of the header, and the most frequent
	; prefix argument of the steps as the prefix argument
	; of the header.

	(setf schema-events (mapcar #'car schema-event-tups))
	(setf bound-schema-events
		(loop for tup in schema-event-tups
			collect (apply-bindings (car tup) (second tup))))

	(setf subord-constrs (list))
	(setf subschema-step-num 0)
	(setf steps (copy-list events))
	(loop for bs in bound-schema-events
			for tup in schema-event-tups do (block sl
		(setf true-step-name (third (schema-header bs)))
		(if (varp (third (schema-header bs)))
			; then
			(progn
				(setf subschema-step-num (+ subschema-step-num 1))
				(setf true-step-name (intern (format nil "~s_~d" (third (schema-header bs)) subschema-step-num)))
			)
		)

		; Add the schema header as a step in the list
		(if (not (varp (third (schema-header bs))))
			; then
			(setf steps (append steps (list (schema-header bs))))
			; else
			; the header ep wasn't bound,
			; and is probably just ?E, so we
			; should make sure it has a unique
			; name in the embedding schema, so
			; we can absorb its ep rels to the
			; outer level unambiguously before
			; renaming steps
			(setf steps (append steps (list (list
				(car (schema-header bs))
				'**
				true-step-name
			))))
		)

		; Pull out ep-rels
		(setf bs-ep-rels (mapcar #'second (section-formulas (get-section bs ':Episode-relations))))
		(if (varp (third (schema-header bs)))
			(setf bs-ep-rels
				(replace-vals
					(third (schema-header bs))
					true-step-name
					bs-ep-rels)))

		(setf ep-rels (append ep-rels bs-ep-rels))

		; Pull out subordinate constraints from
		; the bindings for all variables not bound
		; by the header.
		(setf subord-binding-pairs (list))
		(loop for var being the hash-keys of (second tup)
			if (and
					(not (has-element (schema-header (car tup)) var))
					(has-element (car tup) var) ; we also need to check whether
												; it's just a spurious binding
												; for a var not in the schema,
												; which happens sometimes?
					)
				do (setf subord-binding-pairs (append subord-binding-pairs
					(list (list var (gethash var (second tup))))))
		)
		(setf subord-constrs (append subord-constrs (list (list true-step-name subord-binding-pairs))))
	))

	; Find the most frequent prefix argument.
	(setf new-prefix-arg
		(most-freq (loop for st in steps
						collect (car (prop-pre-args (car st))))))

	; Compile all postfix arguments.
	(setf new-postfix-args
		(dedupe (loop for st in steps
					append (prop-post-args (car st)))))

	; We also need to name a new schema header predicate.
	; For now, we can just use a dummy name, and let the
	; generalizer add a unique number.
	; TODO: smarter composite schema naming.
	(setf new-pred 'COMPOSITE-SCHEMA.PR)

	; Form the new header.
	(setf new-header
		(render-prop
			(list new-prefix-arg)
			new-pred
			new-postfix-args
			nil ; no predicate modifiers in this header (?)
		)
	)

	; Use the new header to create a blank schema.
	(setf new-schema (list 'epi-schema (list new-header '** '?E) (list ':Steps)))

	; Add the steps to the new schema.
	(loop for st in steps
		do (setf new-schema
				(add-constraint-with-const new-schema ':Steps
					(car st)
					(third st)
				)
		)
	)

	; Add the nested schema subordinate constraints to the new schema.
	(loop for subord-constr-list in subord-constrs
		do (loop for constr in (second subord-constr-list) do (block add-subord
			(setf substep-name (car subord-constr-list))
			(setf constr-var (car constr))
			(setf constr-ind (second constr))

			(setf sk-fn-name (intern (concat-two-strs (string constr-var) "<-")))
			(setf constr-prop (list (list sk-fn-name substep-name) '= constr-ind))
			(if should-add-subords
				(setf new-schema (add-constraint new-schema ':Subordinate-constraints constr-prop))
			)
		))
	)

	; Add the story ep-rels.
	(setf ep-rels (append ep-rels story-ep-rels))

	; Add the episode relations for temporal
	; sorting.
	(loop for ep-rel in ep-rels
		do (setf new-schema
			(add-constraint new-schema ':Episode-relations ep-rel))
	)

	; Filter out subschema ep-rels with scoped variables, which
	; shouldn't be floated up to the parent.
	(setf ep-rels (loop for er in ep-rels
		if (not (has-element-pred er #'varp))
			collect er))

	(load-time-model ep-rels)

	; Sort the steps and clean up the schema.
	; Don't generalize it, though, as we'll be
	; doing more non-generalized insertions, and
	; we don't want to de-alias variables from
	; constants.
	; (setf new-schema (fully-clean-schema new-schema))
	(setf new-schema (fully-clean-schema-no-gen new-schema))
	(setf new-schema (sort-steps new-schema))

	; Forget about the "now" episodes so that
	; we can just extract the direct ep-ep
	; temporal relations.
	(setf eps-we-care-about
		(loop for ep-rel in ep-rels
			append (prop-all-args ep-rel)))
	(setf eps-we-care-about
		(loop for ep in eps-we-care-about
			if (not (is-now? ep))
				collect ep))

	; Get the direct ep-ep relations by
	; iterating over the topsort and
	; saving the first "before" relation
	; that holds true for each ep.
	; TODO: extend this to non-point step
	; times.
	; TODO: do this at the parsing stage,
	; rather than at the composition stage?
	(setf direct-step-rels (list))
	(setf step-ids
		(mapcar #'car (section-formulas
			(get-section new-schema ':Steps))))
	(loop for step1 in (subseq step-ids 0 (- (length step-ids) 1))
			for i from 0
		do (block check-against-step1
			(loop for step2 in (subseq step-ids (+ i 1) (length step-ids))
				do (block check-step2
					(setf bf-rel (list step1 (list 'BEFORE step2)))
					(if (eval-time-prop bf-rel)
						(setf direct-step-rels
							(append direct-step-rels (list bf-rel)))
					)
				)
			)
		)
	)

	; Replace the ep-rels section in the
	; new, more direct rels.
	(setf new-schema (set-section new-schema ':Episode-relations
		(list ':Episode-relations)))
	(loop for step-rel in direct-step-rels
		do (setf new-schema
			(add-constraint new-schema ':Episode-relations step-rel)))


	; If we have matches embedded as steps, we're going to move their role constraints
	; and pre/postconditions into the embedding schema. This is largely for clarity and
	; display purposes, and can be skipped if the embedded schemas retain their unique
	; match names.
	(loop for st in (section-formulas (get-section new-schema ':Steps))
		for i from 0
		do (block inv-loop
			; Some unmatched words will invoke schemas; the
			; key thing to note here is that, if they were
			; rightly matchable, they'd have been matched
			; already, before composition. So, we'll only
			; consider matches with match numbers after
			; composition time.
			(if (null (get-schema-match-num (prop-pred (second st))))
				(return-from inv-loop)
			)

			; TODO: make sure subordinate constraints are
			; considered here, if we really want to do this
			; right, as this won't bind everything in the
			; subordinate schemas (just header variables).
			; That said, this *is* currently an optional
			; step for clarity, so....

			(if (not (invokes-schema? (second st)))
				(return-from inv-loop)
			)
			(setf inv-pair (expand-nested-schema st new-schema))

			; For some reason, no exact schema was found
			; to for the word, and unification was impossible
			; without a full matching phase. See the "weird bug"
			; discussed in the invoked-schema function definition.
			(if (null inv-pair)
				(return-from inv-loop)
			)

			(setf inv-schema (apply-bindings (car inv-pair) (second inv-pair)))
			(setf except (loop for k being the hash-keys of (second inv-pair) collect k))
			(setf deduped-schema (second (uniquify-shared-vars-except new-schema (car inv-pair) except)))
			(setf deduped-schema (apply-bindings deduped-schema (second inv-pair)))

			;(if (equal i 0)
			;	(setf new-pres (loop for pre in (section-formulas (get-section deduped-schema ':Preconds)) collect (second pre)))
			;)
			;(setf new-posts (loop for post in (section-formulas (get-section deduped-schema ':Postconds)) collect (second post)))

			(setf rcs (loop for rc in (section-formulas (get-section deduped-schema ':Roles))
				collect (second rc)
			))
			(setf rcs (remove-duplicates rcs :test #'equal))
			(setf rcs (loop for rc in rcs if (loop for v in (get-elements-pred rc #'varp) always (has-element new-schema v)) collect rc))
			(setf rcs (sort rcs (lambda (a b) (< (sxhash (car a)) (sxhash (car b))))))
			(setf roles (append roles rcs))
		)
	)

	; Remove duplicate role constraints and those
	; subsumed by other role constraints.
	(setf deduped-rcs (remove-duplicates roles :test #'equal))
	(setf unsubsumed-rcs (list))
	(loop for rc1 in deduped-rcs do (block ddp
		(if (loop for rc2 in deduped-rcs never (and
			(not (equal rc1 rc2))
			(equal
				(append (prop-pre-args rc1) (prop-post-args rc1))
				(append (prop-pre-args rc2) (prop-post-args rc2))
			)
			(subsumes (prop-pred rc1) (prop-pred rc2))
			))
			(setf unsubsumed-rcs (append unsubsumed-rcs (list rc1)))
		)
	))

	; Add the roles to the schema.
	(loop for rc in unsubsumed-rcs
		do (setf new-schema (add-constraint new-schema ':Roles rc))
	)

	; Clean the schema one last time, and generalize
	; constants to variables now that no more changes
	; will be made.
	(if avoid-gen
		; then
		(setf new-schema (fully-clean-schema-no-gen new-schema))
		; else
		(setf new-schema (fully-clean-schema new-schema))
	)

	; Add the new pre- and post-conditions.
	;(loop for pre in new-pres
	;	do (setf new-schema (add-constraint new-schema ':Preconds pre)))
	;(loop for post in new-posts
	;	do (setf new-schema (add-constraint new-schema ':Postconds post)))

	(return-from outer new-schema)
)
)
)

; Get all individuals from the story that are used by the bound schemas.
(ldefun get-individuals (events bound-schemas el-story)
	(dedupe (intersection
			(union
				(get-elements-pred events #'canon-small-individual?)
				(get-elements-pred bound-schemas #'canon-small-individual?)
					:test #'equal
				)
				(get-elements-pred el-story #'canon-small-individual?) :test #'equal))
)

; Get all nonfluent role constraints from the story, for the
; individuals from the bound schemas, to add to the schemas
; in order to flesh out the nonfluent type information.
(ldefun get-rcs (inds el-story)
(block outer
	(setf rcs (list))
	(loop for ind in inds
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
		)
	)

	(return-from outer (dedupe rcs))
)
)

; Collect all story event episodes that are either
; bound to header episodes or step episodes in
; matched schemas; these don't need to be steps in
; the composite schema.
(ldefun get-used-eps (bound-schemas)
(block outer
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

	(return-from outer used-eps)
)
)

; Collect episode relations from the story,
; and inferred ones from the schemas, and
; provide them to the composer to order the
; steps correctly.
(ldefun get-ep-rels (el-story bound-schemas)
(block outer
	(setf story-ep-rels (loop for phi in (linearize-story el-story) if (time-prop? phi) collect phi))

	(setf matched-schema-ep-rels (loop for bound-schema in bound-schemas
		append (mapcar #'second (section-formulas (get-section bound-schema ':Episode-relations)))))

	(return-from outer (dedupe (append story-ep-rels matched-schema-ep-rels)))
)
)

; Construct a composite schema from a story, a set of schema/binding tuples
; matched from the story, and, optionally, for efficiency, a pre-parsed set
; of EL formulas for the story.
(ldefun make-composite-story-schema (story schema-match-tuples &optional el-story avoid-gen)
(block outer
	; Parse the story if a parse wasn't provided.
	(if (null el-story)
		(setf el-story (len-parse-sents story)))

	; Clean up the invalid formulas in the parse.
	(setf el-story (loop for sent in el-story
		collect (loop for wff in sent
			if (canon-prop? wff)
				collect wff)))

	; Extract the episodic events from the story
	(setf events (loop for sent in el-story append (loop for wff in sent if (canon-charstar? wff) collect wff)))

	; Sometimes a story just has only atemporal
	; formulas; we can't really make a schema from
	; that, and it probably indicates a serious
	; parser failure anyway, so we probably don't
	; even want to try.
	(if (null events)
		(progn
			(format t "story had no temporal formulas~%")
			(return-from outer nil)
		)
	)

	; Apply bindings to get the concrete-valued schema matches,
	; and extract the bound headers.
	(setf schemas (mapcar #'car schema-match-tuples))
	(setf bound-schemas (mapcar (lambda (x) (apply-bindings (car x) (third x))) schema-match-tuples))
	(setf schemas-with-bindings (loop for tup in schema-match-tuples collect (list (car tup) (third tup))))
	(setf headers (loop for schema in bound-schemas collect (schema-header schema)))

	; Remove story events with episodes that are already used by
	; bound schemas, to prevent double inclusion.
	(setf used-eps (get-used-eps bound-schemas))
	(setf events
		(loop for event in events
			if (not (contains used-eps (third event)))
				collect event
		)
	)

	; Collect information about individuals, constraints, and episodes
	; for use in the final composed schema.
	(setf inds (get-individuals events bound-schemas el-story))
	(setf rcs (get-rcs inds el-story))
	(setf ep-rels (get-ep-rels el-story bound-schemas))

	; Compose a schema from the matched schemas,
	; story events, and story constraints
	(setf new-schema (compose-schema rcs events schemas-with-bindings ep-rels nil avoid-gen))

	(return-from outer new-schema)
)
)
