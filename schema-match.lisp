; norm-match.lisp contains functions for matching one
; specific story to one specific schema.

(load "ll-load.lisp")

(ll-load "schema-util.lisp")
(ll-load "schema-el.lisp")
(ll-load "schema-el-eval.lisp")
(ll-load "schema-expansion.lisp")
(ll-load "ll-cache.lisp")

(defparameter *DEBUG-NO-MATCH-RENAME* nil)

; Match outline:
;	- first, modify schema syntax to have char formulas AND * formulas for ?eNs
;	- next, modify schema syntax to give certainty scores to certain formulas
;	- take a story ep, and unify its char formula w/ schema steps until match
;	- once it matches, fill in the schema and replace the matched step w/ the story ep, adding the extra modifiers, and adding all * formulas as atemporal constraints




; unify-with-schema takes a story, a formula (phi) from that story, and
; a schema. It attempts to unify phi with each formula in each section,
; fluent or nonfluent, and stops as soon as it is able to, returning the
; unifier as a map of variable bindings.
;
; Two predicates may be unified even if they are not equal; if the
; schema-side predicate "subsumes" the story-side one, i.e. if the
; schema-side predicate is a generalization of the story-side one,
; then the unification still occurs.
;
; If phi is a temporal formula and it matches to a fluent condition, the
; fluent condition's episode variable is bound to the episode that phi
; characterizes; if this binding is impossible, the unification fails.
;
; TODO: check constraints
(ldefun unify-with-schema (phi schema story)
	(unify-with-schema-maybe-header phi schema story t)
)

(ldefun unify-with-schema-maybe-header (phi schema story allow-header-match)
(let (best-bindings best-formula best-sub-score new-bindings bindings-with-ep-ids pred1 pred2)
(block outer
	; first, check whether phi unifies with the schema's header
	(if allow-header-match
	(block check-header
			(setf new-bindings (unify (car (second schema)) phi nil schema story))

			(if (and (not (null new-bindings)) (canon-charstar? phi))
				; then
				(progn
					(setf bindings-with-ep-ids (unify-individuals (third (second schema)) (third phi) new-bindings schema story))

					(if (null bindings-with-ep-ids)
						; then
						(progn
						(dbg 'match "~s already bound; cannot bind!~%" (third (second schema)))
						(return-from check-header)
						)
						; else
						(setf new-bindings bindings-with-ep-ids)
					)
				)
			)

			(if (null new-bindings)
				; then
				(return-from check-header)
				; else
				(progn
				(return-from outer (list (car (second schema)) phi new-bindings 1.0))
				)
			)
	)
	)

	(setf best-bindings nil)
	(setf best-formula nil)
	(setf best-sub-score 0)

	(setf match-sections (if (canon-charstar? phi) (fluent-sections schema) (nonfluent-sections schema)))
	; (setf match-sections (nonmeta-sections schema))

	(loop for sec in match-sections
		do (dbg 'match "	schema sec ~s~%" (section-name sec))
		do (loop for formula in (section-formulas sec) do
			(block uni
				(dbg 'match "		schema ~s~%" (second formula))

				(setf new-bindings (unify (second formula) phi nil schema story))
				(setf pred1 (prop-pred (second formula)))
				(setf pred2 (prop-pred phi))

				; Boolean conjunctions, etc. may not have extractable pred bases
				(if (or (null pred1) (null pred2))
					(return-from uni)
				)

				(if (equal '** pred2)
					(setf pred2 (prop-pred (car phi)))
				)

				(setf sub-score (max (subsumption-score pred1 pred2) (* 0.75 (subsumption-score pred2 pred1))))

				; excludes entity.n, object.n, etc.
				(setf ica (interesting-common-ancestor pred1 pred2))

				; TODO: make common-ancestor unification
				; trigger a general schema creation and
				; re-make the parent graph? We might need
				; to do two runs, one without CA unification
				; and one with it, to see whether we'd get
				; a better score by making a new schema or
				; just denying the match? I think this could
				; just be a bit tricky because the code isn't
				; really set up to handle a match to the schema
				; other than the one plugged in, so we'd need
				; to figure that out.
				(if (<= sub-score 0)
					; then
					(if (not (null ica))
						; then
						; Partial points for having a common ancestor?
						(setf sub-score (* 0.5 (+
							(* 0.5 (subsumption-score ica pred1))
							(* 0.5 (subsumption-score ica pred2))
						)))
						; else
						; We won't unify two predicates with absolutely no
						; subsumption relationship.
						(return-from uni)
					)
				)

				(setf sub-score (+ sub-score
					(/ (ht-count new-bindings) (length (remove-duplicates (get-elements-pred (eval (schema-pred schema)) #'varp) :test #'equal)))
				))

				; Bind episodes to formula IDs as well
				(if (and (not (null new-bindings)) (canon-charstar? phi) (equal (section-type sec) 'FLUENT))
					; then
					(progn
					(setf bindings-with-ep-ids (unify-individuals (car formula) (third phi) new-bindings schema story))
					(if (null bindings-with-ep-ids)
						; then
						(progn
						(dbg 'match "~s already bound to ~s; cannot bind to ~s!~%" (car formula) (gethash (car formula) new-bindings) (third phi))
						(return-from uni)
						)
						; else
						(setf new-bindings bindings-with-ep-ids)
					)
					)
				)

				(if (null new-bindings)
					; then
					nil
					; else
					(if (> sub-score best-sub-score)
						(progn
							(setf best-sub-score sub-score)
							(setf best-bindings new-bindings)
							(setf best-formula formula)
						)
					)
				)
			)
		)
	)

	(if (not (null best-formula))
		; then
		(return-from outer (list (second best-formula) phi best-bindings best-sub-score))
		; else
		(return-from outer nil)
	)
	))
)

; apply-bindings-and-check applies the given bindings map
; to a schema, but checks that the schema's constraints are
; still satisfied when the substitutions are made.
(ldefun apply-bindings-and-check (schema bindings story)
	(apply-bindings schema bindings)
)

; match-story-to-schema loops over every formula phi in a story and attempts to
; match phi to a given schema. When phi matches to any formula in the schema,
; a cumulative map of variable bindings is updated according to the unifier.
;
; The function returns a version of the schema with variables replaced by
; the individual constants from the story to which they were bound. All
; nonfluent constraints on those individual constants are also added to the
; list of nonfluent constraints in the schema.
;
; If the "generalize" argument is non-nil, all individual constants in the
; schema are replaced by variables.
(ldefun match-story-to-schema (story-formulas in-schema generalize)
(block outer
	; (dbg 'match "matching with ~s~%" in-schema)
	(setf test-schema in-schema)

	(setf bound-header nil)
	(setf bound-header-form nil)

	(setf all-bindings (make-hash-table :test #'equal))
	(setf total-matches 0)


	; Put all the charstar formulas first
	(setf story1 (list))
	(setf story2 (list))
	(loop for phi in story-formulas
		do (if (canon-charstar? phi)
			; then
			(setf story1 (append story1 (list phi)))
			; else
			(setf story2 (append story2 (list phi)))
		)
	)
	(setf sorted-formulas (append story1 story2))


	; Match each formula, one by one.
	(loop for phi in sorted-formulas
		do (block uni-loop
		; (format t "old bindings: ~s~%" (ht-to-str all-bindings))
		(setf fm-res (match-formula-to-schema phi test-schema all-bindings total-matches bound-header story-formulas))
		(if (null fm-res) (return-from uni-loop))

		; (format t "matched ~s to get new bindings ~s~%" phi (ht-to-str all-bindings))

		(setf test-schema (car fm-res))
		(setf all-bindings (second fm-res))
		(setf total-matches (third fm-res))
		(setf bound-header (fourth fm-res))
		(setf sub-score (fifth fm-res))
	))


	(setf header-bound-form nil)
	(if bound-header
		(loop for phi in story-formulas
			if (and (canon-charstar? phi) (equal (third phi) (third (second test-schema))))
				do (setf header-bound-form (car phi)))
	)

	(if (and
			(not (null header-bound-form))
			(not (equal
				(prop-pred header-bound-form)
				(prop-pred (car (second in-schema)))))
			(subsumes
				(prop-pred (car (second in-schema)))
				(prop-pred header-bound-form))
		)
		; then
		(block replace-schema-name
			; If we match a more specific predicate from the story
			; to a more general one in the schema, we'll replace the name
			; TODO: deal with paraphrases? Do we have to?
			(setf old-name (prop-pred (car (second in-schema))))
			(setf new-name (prop-pred header-bound-form))
			(setf test-schema (replace-vals old-name new-name test-schema))
		)
	)

	; Several new constraints may have been added to the schema match from the story.
	; We need to check to see if any of them can be generalized with existing
	; constraints in the input schema, and update certainties if so: the more general
	; constraint should be more certain than the more specific one. Also, if both
	; constraints generalize into a third, unique common ancestor, we need to add that
	; new, more general constraint to the final schema and give it the more certain score.
	(block generalize-new-constraints
		; Make sure to apply the match bindings to the input schema so that the
		; specific values in the constraints are shared with the matched schema.
		(setf orig-rcs (section-formulas (get-section (fully-clean-schema-no-gen (apply-bindings in-schema all-bindings)) ':Roles)))
		; Also make sure to fully clean (and dedupe) the match schema, but not
		; generalize its individuals, to ensure parity with the generalized
		; *and* clean schema we're outputting later.
		(setf match-rcs (section-formulas (get-section (fully-clean-schema-no-gen test-schema) ':Roles)))

		; The original role constraints should be a prefix of the new ones,
		; i.e., we should only have added constraints.
		(if (not (has-lst-prefix? match-rcs orig-rcs))
			; then
			(progn
				(format t "bindings are ~s~%" (ht-to-str all-bindings))
				(format t "WARNING: schema constraints ~s weren't a prefix of match constraints ~s - why did some get erased?~%" orig-rcs match-rcs)
				(return-from generalize-new-constraints)
			)
		)

		(setf added-constraints (subseq match-rcs (length orig-rcs) (length match-rcs)))
		(loop for added-rc in added-constraints
			do (loop for orig-rc in orig-rcs
				do (block try-generalize


(if (not (and (equal 2 (length added-rc)) (equal 2 (length orig-rc))))
	; We can't generalize multi-arg predicates, or those with
	; modifiers.
	(return-from try-generalize)
)

(if (not (equal (car (second added-rc)) (car (second orig-rc))))
	; These propositions are about different individuals
	; and can't be generalized.
	(return-from try-generalize)
)

(setf added-rc-pred (prop-pred (second added-rc)))
(setf orig-rc-pred (prop-pred (second orig-rc)))

(setf ancestor-pred (common-ancestor added-rc-pred orig-rc-pred))

(if (null ancestor-pred)
	(return-from try-generalize)
)

; At this point, we've generalized ancestor-pred and determined
; that these two preds do overlap.
(setf most-general-rc-id nil)
(setf most-specific-rc-ids (list))

; Check whether an existing role constraint is the most general.
(if (equal ancestor-pred orig-rc-pred)
	; then
	(progn
		(setf most-general-rc-id (car orig-rc))
	)
	; else
	(if (equal ancestor-pred added-rc-pred)
		(progn
			(setf most-general-rc-id (car added-rc))
		)
	)
)

; The existing preds generalized to a third, unique pred.

; If the general third pred is already in the schema, set
; its ID now.
(setf most-general-rc-id (get-id-by-formula test-schema (list (car (second added-rc)) ancestor-pred)))

; Otherwise, we'll have to add a new constraint.
(if (null most-general-rc-id)
	; then
	; The existing preds generalized to a third,
	; unique pred, which we must now add.
	(block add-gen-rc
		(setf test-schema (add-role-constraint test-schema (list (car (second added-rc)) ancestor-pred)))
		(setf most-general-rc-id (car (last (section-formulas (get-section test-schema ':Roles)))))
	)
)


(setf most-specific-rc-ids (set-difference (list (car added-rc) (car orig-rc)) (list most-general-rc-id) :test #'equal))




				)
			)
		)
	)

	(setf clean-pair (fully-clean-schema test-schema t))
	(setf gen-test-schema (car clean-pair))
	(setf gen-test-bindings (second clean-pair))

	(if (not *DEBUG-NO-MATCH-RENAME*)
	; then
	(progn
	(setf new-gen-name (create-from-match-maybe-gen gen-test-schema nil))
	(return-from outer (list (eval new-gen-name) gen-test-bindings bound-header))
	)
	; else
	(progn
		(return-from outer (list gen-test-schema gen-test-bindings bound-header))
	)
	)
)
)

(ldefun cached-match-formula-to-schema (phi test-schema all-bindings total-matches bound-header story-formulas)
	(ll-partial-cache
		'uncached-match-formula-to-schema
		(list phi test-schema all-bindings total-matches bound-header)
		(list phi test-schema all-bindings total-matches bound-header story-formulas)
		128
	)
)

(ldefun match-formula-to-schema (phi in-schema all-bindings total-matches bound-header story-formulas)
(let (
	matched-bindings
	best-bindings best-schema
	(test-schema (copy-list in-schema))
)
(block outer
	(setf subschemas (loop for st in (section-formulas (get-section test-schema ':Steps))
		if (invokes-schema? (second st))
			collect (expand-nested-schema st test-schema)
	))

	; TODO: consider subschemas in Goals, preconds, etc. as well
	; TODO: subschemas embedded in propositions? intensions, different polarities, etc.?

	; The parent schema has its bindings applied already, so any expanded schema
	; bindings don't need to have the parent bindings applied.
	(setf expanded-schemas (append (list (list test-schema (ht-copy all-bindings))) subschemas))

	(setf best-single-res nil)
	(setf best-schema nil)
	(setf best-bindings nil)
	(setf best-expanded-bindings nil)

	(setf matched-sub nil)

	(loop for expanded-schema-pair in expanded-schemas
			for i from 0
		do (block match-block
			(if (null expanded-schema-pair)
				(return-from match-block)
			)

			(setf expanded-schema (car expanded-schema-pair))
			(setf expanded-bindings (second expanded-schema-pair))

			(if (null expanded-bindings)
				(return-from match-block)
			)
			(setf old-expanded-bindings (ht-copy expanded-bindings))
			; don't allow header matches if i > 0, i.e. if this is a subschema
			(setf single-res (match-formula-to-single-schema phi (apply-bindings expanded-schema expanded-bindings) expanded-bindings total-matches bound-header story-formulas (= i 0)))


			(if (null single-res)
				; then
				(return-from match-block)
			)

			(if (and
					; make sure we have novel bindings
					(not (ht-eq (second single-res) old-expanded-bindings))
					; make sure we're better than the best match we've seen so far
					(or
					   (null best-single-res)
					   (> (fifth single-res) (fifth best-single-res))
					)
				)
				; then
				(progn
				(setf best-expanded-bindings old-expanded-bindings)
				(setf best-bindings (second single-res))
				(setf best-schema (car single-res))
				(setf best-single-res single-res)
				(setf matched-sub (> i 0))
				)
			)
		)
	)

	(if (or (null (fifth best-single-res)) (<= (fifth best-single-res) 0) (null best-schema))
		(return-from outer nil)
	)

	(setf matched-bindings nil)
	(if (not matched-sub)
		; then
		; We matched this schema via the header
		(progn
		(setf all-bindings best-bindings)
		(setf test-schema (car best-single-res))
		)



		; else
		; We matched a sub-schema, not this schema
		(block gen-sub-match
			(setf gen-match-pair (mapped-generalize-schema-constants (apply-bindings (car best-single-res) best-bindings)))
			(setf matched-bindings (car gen-match-pair))
			(setf gen-match (second gen-match-pair))

			; We've created a new name for our subschema match, and it has its own variables.
			; We're going to replace the subschema's step in the parent schema with a step using
			; its new name.

			(setf new-name (create-from-match-maybe-gen gen-match nil))

			(setf new-sec (list ':Steps))
			(loop for st in (section-formulas (get-section test-schema ':Steps))
				do (if (equal (car st) (third (second (car best-single-res))))
					; then
					(setf new-sec (append new-sec (list (list (car st) (replace-vals (schema-pred (car best-single-res)) new-name (car (second (car best-single-res))))))))
					; else
					(setf new-sec (append new-sec (list st)))
				)
			)


			; If the best bindings we got for the subordinate schema have bound
			; a parent-scoped variable, then rebind it here. We'll know it was
			; parent-scoped if it was a value in the corresponding expanded-bindings
			; for that subordinate schema, which came from the parent.
			(setf parent-rebindings (make-hash-table :test #'equal))
			(loop for k being the hash-keys of best-bindings
				do (block lk2 (loop for k2 being the hash-keys of best-expanded-bindings
					if (equal (gethash k2 best-expanded-bindings) k)
						do (block rebind-parent
							(setf (gethash k parent-rebindings) (gethash k best-bindings))
							(return-from lk2)
						)
				))
			)


			; If something is the value of an expanded variable (i.e. originally
			; from parent scope), and it wasn't rebound just now in the parent and
			; child, then the child will still have it, but it might not be tied to the
			; parent scope anymore. So, we'll tie it here.
			(loop for k being the hash-keys of best-expanded-bindings
				do (block lk2
					(setf v (gethash k best-expanded-bindings))
					(if (varp v)
						(if (loop for k2 being the hash-keys of best-bindings
								never (equal k2 v))
							(setf (gethash v matched-bindings) v)
						)
					)
				)
			)


			(setf test-schema (set-section test-schema ':Steps new-sec))

			(setf test-schema (apply-bindings test-schema parent-rebindings))
		)
	)

	(setf out-schema test-schema)
	(if matched-sub
	(loop for k being the hash-keys of matched-bindings
		do (block add-subord-constr
			(setf sk-fn-name (intern (concat-two-strs (string k) "<-")))
			(setf constr (list (list sk-fn-name (third (second (car best-single-res)))) '= (gethash k matched-bindings)))
			(setf out-schema (add-constraint out-schema ':Subordinate-constraints constr))
		)
	))
	(setf best-single-res (list
		out-schema
		all-bindings
		(third best-single-res)
		(fourth best-single-res)
		(fifth best-single-res)
	))

	; Any time contradictions will crash the Allen algebra solver
	; downstream, so we'll weed out any temporally unsound matches here.
	(handler-case (topsort-steps (list out-schema))
		(error () (return-from outer nil))
	)

	(return-from outer best-single-res)
))
)

(ldefun unchecked-match-formula-to-single-schema (phi test-schema all-bindings total-matches bound-header story-formulas allow-header-match)
(block outer
			(if (or
					(time-prop? phi)
					(equal (prop-pred phi) 'ORIENTS)
				)
				(return-from outer nil)
			)

			(setf small-inds (extract-small-individuals phi))
			(setf constraints (story-select-term-constraints story-formulas small-inds))
	
			(dbg 'match "trying:~%")
			(dbg 'match "	formula ~s~%" phi)
			(setf go-match-triple (unify-with-schema-maybe-header phi test-schema story-formulas allow-header-match))

			(if (null go-match-triple)
				(return-from outer nil)
			)

			(setf matched-schema (car go-match-triple))
			(setf matched-story (second go-match-triple))
			(setf go-match (third go-match-triple))

			(if (not (null go-match))
				; then
				(block print-go-match
					(if (not (null (gethash (third (second test-schema)) go-match)))
						; then
						(setf bound-header t)
					)
	
					(dbg 'match "bound to story formula ~s~%" phi)
					(setf unbound-prop-mods (list))
					(if (and (not (equal matched-schema phi)) (canon-charstar? phi))
						(loop for md in (prop-mods (car phi))
							if (loop for scmd in (prop-mods matched-schema) always (null (unify-mods md scmd go-match test-schema story-formulas)))
								do (setf unbound-prop-mods (append unbound-prop-mods (list md)))
						)
					)
					(setf total-matches (+ total-matches 1))

					; Accumulate all bindings
					(loop for key being the hash-keys of go-match
						do (if (null (bind-if-unbound key (gethash key go-match) all-bindings))
							; then
							(return-from outer nil)
						)
					)
	
					(setf go-match-schema (apply-bindings test-schema go-match))

					; Add incidental/unbound mods to the matched schema
					(if (not (null unbound-prop-mods)) (block add-prop-mods
						(setf matched-prop (apply-bindings matched-schema go-match))
						(setf prop-breakdown (prop-args-pred-mods matched-prop))
						(setf new-prop (render-prop
							(car prop-breakdown)
							(second prop-breakdown)
							(third prop-breakdown)
							(dedupe (append (fourth prop-breakdown) unbound-prop-mods))
						))

						(setf go-match-schema (replace-vals matched-prop new-prop go-match-schema))
					))

					; Make sure the full matched sentence 
					(if nil
					(block replace-with-story-sent
					(setf new-steps (list ':Steps))
					(loop for s in (cdr (get-section go-match-schema ':Steps)) do (block fix-steps
						(if (and (canon-charstar? phi) (equal (third phi) (car s)))
							; then
							(setf new-steps (append new-steps (list (list (car s) (car phi)))))
							; else
							(setf new-steps (append new-steps (list s)))
					)))
					(setf go-match-schema (set-section go-match-schema ':Steps new-steps))
					))


					(loop for const in constraints do (block const-add
						(if (time-prop? const)
							; then
							(setf go-match-schema (add-constraint go-match-schema ':Episode-relations const))
							; else
							(if (not (equal 'ORIENTS (prop-pred const)))
								; then
								(block possibly-gen-constr
									(setf gen-constrs nil)
									; If we're adding a role constraint for an individual,
									; and it shares a common ancestor with an existing role
									; constraint, we'll consider generalizing.
									(loop for rc-pair in (section-formulas (get-section go-match-schema ':Roles))
										do (block gen
											(setf rc (second rc-pair))
											(if (and
													(equal 2 (length rc))
													(equal 2 (length const))
													(equal (car rc) (car const))
													(not (null (common-ancestor (second rc) (second const)))))
												; then
												(progn
												(setf gen-constr (list (car rc) (common-ancestor (second rc) (second const))))
												(setf gen-constrs (append gen-constrs (list (list gen-constr (car rc-pair)))))
												)
											)
										)
									)

									; We'll add the story constraint regardless of whether a generalization happened.
									(setf go-match-schema (add-role-constraint go-match-schema const))
									(setf story-spec-constr-id (car (car (last (get-section go-match-schema ':Roles)))))

									; Every general constraint we're adding should be more certain. The specific
									; constraints they're replacing will become less certain.
									(loop for gen-constr-pair in gen-constrs
										do (block add-gen
											(setf gen-constr (car gen-constr-pair))
											; add the general constraint, then update its certainty with the specific
											; schema constraint's certainty (and update the latter's certainty, too)
											(setf go-match-schema (add-role-constraint go-match-schema gen-constr))

											(setf gen-constr-id (car (car (last (get-section go-match-schema ':Roles)))))
											(setf schema-spec-constr-id (second gen-constr-pair))
											(setf schema-spec-constr-cert (get-certainty schema-spec-constr-id go-match-schema))
											(setf gen-constr-cert (list '/ (+ 1 (second schema-spec-constr-cert)) (+ 1 (third schema-spec-constr-cert))))
											(setf new-schema-spec-constr-cert (list '/ (second schema-spec-constr-cert) (+ 1 (third schema-spec-constr-cert))))


											; UHHHH, actually, don't set certainties here!
											; correctly updating the denominators requires knowledge
											; of whether the added constraint is from the same story
											; or not, which we can't do this low-down in the matching
											; process, because we don't know what the schema was before
											; we matched this story to it. We can set certainties accurately
											; given just the original schema and the final match, way up the
											; call tree from here.
											; TODO: factor all of the certainty-related code out of this
											; section.

											; (format t "setting certainties for ~s, ~s, and ~s~%" gen-constr-id schema-spec-constr-id story-spec-constr-id)
											; (setf go-match-schema (set-certainty gen-constr-id (second gen-constr-cert) (third gen-constr-cert) go-match-schema))
											; (setf go-match-schema (set-certainty schema-spec-constr-id (second new-schema-spec-constr-cert) (third new-schema-spec-constr-cert) go-match-schema))
											; (setf go-match-schema (set-certainty story-spec-constr-id 1 (third new-schema-spec-constr-cert) go-match-schema))
										)
									)
								)
							)
						)
					))

					(setf test-schema go-match-schema)
				)
			)

		(return-from outer (list test-schema all-bindings total-matches bound-header (fourth go-match-triple)))

		)
)

(ldefun match-formula-to-single-schema (phi test-schema all-bindings total-matches bound-header story-formulas allow-header-match)
(block outer
	(setf res (unchecked-match-formula-to-single-schema phi test-schema all-bindings total-matches bound-header story-formulas allow-header-match))

	(return-from outer res)

	; For now, don't do the stuff below;
	; may not need it

	(if (null res)
		(return-from outer nil)
	)

	(if (schema? (car res))
		; then
		(progn
		(setf score (check-constraints (car res) (list story-formulas)))
		(if (null score)
			(return-from outer nil)
		)
		)
	)
)
)

(ldefun check-constraints (schema story &optional depth)
	(check-constraints-helper schema story (make-hash-table :test #'equal) depth)
)

(ldefun check-constraints-helper (schema story checked &optional depth)
	(uncached-check-constraints schema story checked depth)
)

(ldefun uncached-check-constraints (schema story checked &optional depth)
	(uncached-check-constraints-helper schema story checked depth)
)

(ldefun uncached-check-constraints (schema story checked &optional depth)
(block outer
	(load-story-time-model story)
	(setf story-kb (story-to-kb (linearize-story story)))

	(setf true-count 0)
	(setf untrue-count 0)

		(setf all-phi-pairs (append
			(list (list (third (second schema)) (car (second schema))))
			(loop for sec in (nonmeta-sections schema) append (section-formulas sec)))
		)

		(loop for phi-pair in all-phi-pairs
				for phi-pair-idx from 1
			do (block check-constr
				(setf phi-id (car phi-pair))
				(setf old-phi-id phi-id)
				(setf phi (second phi-pair))
				(if (and (has-element-pred phi #'varp) (or (exc-varp phi-id) (varp phi-id)))
					; then
					(return-from check-constr)
				)

				; Don't check ORIENTS (will eventually be purged from learned schemas)
				(if (equal 'ORIENTS (prop-pred phi))
					; then
					(return-from check-constr)
				)

				(if (not (null (gethash phi checked)))
					(progn
					(return-from check-constr)
					)
				)

				(setf bound-nested nil)

				(setf invoked (invoked-schema phi))
				(setf invoked nil) ; Disable nested schema checking. I just can't debug this right now. (4/29/2021)
				; Check nested invoked schemas, unless we're examining the header itself.
				; TODO: factor this and expand-nested-schema together, resolve the
				; difference with _PARENT (too exhausted to factor them right now
				; and figure out whether we need/can have the _PARENT dealiasing
				; in expand-nested-schema)
				(if (and (not (equal (third (second schema)) phi-id)) (not (null invoked)))
					; then
					(progn
						(setf nested-schema-name (schema-pred invoked))
						(setf nested-schema invoked)

						; NOTE: if we're evaluating the
						; consistency of a prop with an
						; unknown/variable episode ID, we
						; should make a unique name for it,
						; instead of e.g. ?E3, so that it
						; doesn't alias in the subordinate
						; schema. It doesn't matter what it is
						; UNTIL we decide to implement cross-
						; schema time consistency checking.
						(if (varp phi-id)
							(setf phi-id (intern (format nil "~s_PARENT" phi-id)))
						)


						(setf check-phi (list phi '** phi-id))

						; non-fluents can't match to epi-schema
						; headers they invoked
						(if (exc-varp phi-id)
							; then
							(return-from outer nil)
						)
					
						(setf old-uscc *UNIFY-SHOULD-CHECK-CONSTRAINTS*)
						(setf *UNIFY-SHOULD-CHECK-CONSTRAINTS* nil)
						(setf header-bindings (third (unify-with-schema check-phi nested-schema (linearize-story story))))
						(setf *UNIFY-SHOULD-CHECK-CONSTRAINTS* old-uscc)

						(if (null header-bindings)
							(progn
							(format t "BUG: ~s invoked ~s, but couldn't unify!~%" check-phi nested-schema-name)
							(return-from outer nil)
							)
						)

						; Now bind subordinate constraints
						(loop for sc in (section-formulas (get-section schema ':Subordinate-constraints))
								if (equal old-phi-id (second (car (second sc))))
									do (block apply-subord
										(setf key (remove-ext (car (car (second sc))) "<-"))
										(setf val (third (second sc)))

										; For the same reasoning as phi-id,
										; we'll make this value unique if it's
										; a variable scoped to this parent, so
										; that it won't interfere with any
										; identical variable names in the child
										; schema, e.g. ?E.
										(if (varp val)
											(setf val (intern (format nil "~s_PARENT" val)))
										)

										(if (not (bind-if-unbound key val header-bindings))
											; then
											(progn
											(error "Weird subordinate constraint expansion bug (see TODO)")
											(return-from outer nil)
											)
										)
									)
						)

						(setf nested-schema-bound (apply-bindings nested-schema header-bindings))
						(setf old-checked-count (hash-table-count checked))
						(setf (gethash phi checked) t)
						(setf nest-score (check-constraints-helper nested-schema-bound story checked (append depth (list 'a))))
						; If a nested schema breaks a necessity-1 constraint,
						; the whole nest is invalid.
						(if (null nest-score)
							(return-from outer nil)
						)

						(setf new-checked-count (hash-table-count checked))

						; There's a (probably cache-related) bug where the count
						; can increase for a nested call even if no new formulas
						; are checked, so we'll prevent that here by making sure
						; each point is accounted for.
						(if (equal
							(- new-checked-count old-checked-count)
							(+ (car nest-score) (second nest-score)))
							; then
							(progn
								(setf true-count (+ true-count (car nest-score)))
								(setf untrue-count (+ untrue-count (second nest-score)))
								(setf bound-nested t)
							)
						)
						
					)
				)

				; don't double-count anything, esp. in nested schemas
				(if (and (null (gethash phi checked)) (not bound-nested))
					; then
					(progn
						(setf eval-score (expt (eval-prop-score phi story-kb) 2))
						(if (and (not (exc-varp phi-id)) (not (varp phi-id)))
							(setf eval-score 1.0)
						)

						(if (equal phi-id (third (second schema)))
							; then (header match worth 2x)
							(setf eval-score (* eval-score 2))
							; else
							(if (equal (sec-name-from-id phi-id) ':Roles)
								; then (role match worth 0.5x)
								(setf eval-score (* eval-score 0.5))
							)
						)

						(if (> eval-score 0)
							; then
							(setf true-count (+ true-count eval-score))

							; else
							(if (not (has-element-pred phi #'varp))
								; then
								(progn
								(if (>= (get-necessity phi-id schema) 1.0)
									; then, invalid match
									(progn
									(dbg 'match "necessary constraint ~s was broken~%" phi-id)
									(return-from outer nil)
									)
									; else
									(progn
									(setf untrue-count (+ untrue-count 1))
									)
								)
								)
							)
						)
						(setf (gethash phi checked) t)
					)
				)
			)
		)

	(return-from outer (list true-count untrue-count))
)
)

(ldefun best-story-schema-match (story schema num_shuffles generalize)
	(car (top-k-story-schema-matches story schema num_shuffles generalize 1))
)

(ldefun top-k-story-schema-matches (story schema num_shuffles generalize k)
(let (best-bindings best-score)
(block outer
	(setf best-score '(0 0))
	(setf best-match nil)
	(setf best-bindings nil)

	(setf all-matches (list))

	(setf linear-story (linearize-story story))

	(loop for i from 1 to num_shuffles do (block shuffle-block
		(setf linear-story (shuffle linear-story))
		(if (equal 0 (mod i 10))
			; then
			(progn
				(dbg 'shuffle-match "~s / ~s~%" i num_shuffles)
				(dbg 'shuffle-match "	best score is ~s~%" best-score)
			)
		)

		(setf cur-match-triple (match-story-to-schema linear-story schema nil))
		(setf cur-match (car cur-match-triple))
		(setf cur-bindings (second cur-match-triple))
		(setf bound-header (third cur-match-triple))

		; Make sure that general constraints subsuming
		; more specific ones in the schema are removed,
		; as they're redundant.
		(setf cur-match (remove-subsuming-rcs cur-match))

		; Added constraints shouldn't count toward our score, because we know
		; they'll be satisfied.
		; TODO: original constraints may have been further
		; specified by hyponym matches, but the score we get
		; for matching it really shouldn't be based on the new,
		; more specific pred, but rather the old one; fix this
		; somehow?
		(setf cur-match-old-constrs (copy-list cur-match))
		(loop for sec in (nonmeta-sections cur-match)
			do (block prune
				(if (> (length sec) (length (get-section schema (car sec))))
					; then
					(progn
					(setf new-sec (copy-list sec))
					(setf new-sec (subseq new-sec 0 (length (get-section schema (car sec)))))
					; If the old section was null, then we can just remove it.
					; Otherwise, replace it with the truncated version.
					(if (null (get-section schema (car sec)))
						; then
						(setf cur-match-old-constrs (remove sec cur-match-old-constrs :test #'equal))
						; else
						(setf cur-match-old-constrs (replace-vals sec new-sec cur-match-old-constrs))
					)
					)
				)
			)
		)

		(if (and (schema? cur-match-old-constrs) (not (schema? (apply-bindings cur-match-old-constrs cur-bindings))))
			(progn
				(format t "bindings ~s messed up this schema: ~%" (ht-to-str cur-bindings))
				(print-schema cur-match-old-constrs)
			)
		)

		(setf score-pair (check-constraints (apply-bindings cur-match-old-constrs cur-bindings) story))
		; A null score indicates that a constraint with necessity
		; 1 was broken, and that the match is invalid by definition.
		(if (null score-pair)
			(return-from shuffle-block)
		)

		
		(if (null (member (list score-pair cur-match cur-bindings bound-header) all-matches :test (lambda (a b) (ht-eq (third a) (third b)))))
			; then
			(setf all-matches (append all-matches (list (list score-pair cur-match cur-bindings bound-header))))
		)


		(setf valid-score (car score-pair))
		(setf invalid-score (second score-pair))
		(setf better-than-best (< invalid-score (second best-score)))
		(if (and (equal invalid-score (second best-score))
			 (> valid-score (car best-score)))
			; then
			(setf better-than-best t)
		)
	
		(if (or
				(null best-match)
				better-than-best
				bound-header
			)
			; then
			(progn
				(setf best-score score-pair)
				(setf best-match cur-match)
				(setf best-bindings cur-bindings)
				(if bound-header
					(return-from shuffle-block)
				)
			)
		)
	))

	(setf sorted-matches (sort all-matches
		(lambda (a b)
		(block lb
			(setf a-valid (car (car a)))
			(setf a-invalid (second (car a)))
			(setf a-bound-header (fourth a))
			(setf b-valid (car (car b)))
			(setf b-invalid (second (car b)))
			(setf b-bound-header (fourth b))

			(if (and a-bound-header (not b-bound-header)) (return-from lb t))
			(if (and b-bound-header (not a-bound-header)) (return-from lb nil))

			(setf a-better (> (- a-valid a-invalid) (- b-valid b-invalid)))

			(return-from lb a-better)
		)
		)
	))

	(return-from outer (mapcar (lambda (x) (subseq x 0 3)) (subseq-safe sorted-matches 0 k)))
)
)
)
