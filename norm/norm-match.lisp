(load "norm-schema-util.lisp")
(load "coref.lisp")
(load "norm-el.lisp")
(load "ll-cache.lisp")

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
(defun unify-with-schema (phi schema story)
	(unify-with-schema-maybe-header phi schema story t)
)

(defun unify-with-schema-maybe-header (phi schema story allow-header-match)
(let (best-bindings)
(block outer
	; first, check whether phi unifies with the schema's header
	(if allow-header-match
	(block check-header
		(setf new-bindings (unify (car (second schema)) phi nil schema story))
		; (format t "attempting to unify ~s with header ~s~%" phi (car (second schema)))
		; Bind episodes to formula IDs as well
		(if (and (not (null new-bindings)) (canon-charstar? phi))
			; then
			; (if (not (bind-if-unbound (car formula) (third phi) new-bindings))
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

			(if (null new-bindings)
				; then
				(return-from check-header)
				; else
				(return-from outer (list (car (second schema)) phi new-bindings 1.0))
			)
			)
		)
	)
	)

	(setf best-bindings nil)
	(setf best-formula nil)
	(setf best-sub-score 0)

	(setf match-sections (if (canon-charstar? phi) (fluent-sections schema) (nonfluent-sections schema)))
	; (loop for sec in (nonmeta-sections schema)
	; (loop for sec in (fluent-sections schema)
	(loop for sec in match-sections
		do (dbg 'match "	schema sec ~s~%" (section-name sec))
		do (loop for formula in (section-formulas sec) do
			(block uni
				(dbg 'match "		schema ~s~%" (second formula))

				;(if (invokes-schema? (second formula))
				;	(format t "matching to ~s, which invokes a schema~%" formula)
				;)

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
				; (format t "subsumption score between ~s and ~s was ~s~%" pred1 pred2 sub-score)

				; (format t "unify gave bindings ~s~%" (ht-to-str new-bindings))

				; Bind episodes to formula IDs as well
				(if (and (not (null new-bindings)) (canon-charstar? phi) (equal (section-type sec) 'FLUENT))
					; then
					; (if (not (bind-if-unbound (car formula) (third phi) new-bindings))
					(progn
					(setf bindings-with-ep-ids (unify-individuals (car formula) (third phi) new-bindings schema story))
					(if (null bindings-with-ep-ids)
						; then
						(progn
						(dbg 'match "~s already bound; cannot bind!~%" (car formula))
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
					; (return-from outer (list (second formula) phi new-bindings))
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
(defun apply-bindings-and-check (schema bindings story)
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
(defun match-story-to-schema (story-formulas in-schema generalize)
(block outer
	; (dbg 'match "matching with ~s~%" in-schema)
	(setf test-schema in-schema)

	(setf bound-header nil)
	(setf bound-header-form nil)

	(setf all-bindings (make-hash-table :test #'equal))
	(setf total-matches 0)

	; (setf story-formulas (linearize-story story))


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


	(loop for phi in sorted-formulas do (block uni-loop
		(setf fm-res (match-formula-to-schema phi test-schema all-bindings total-matches bound-header story-formulas))
		(if (null fm-res) (return-from uni-loop))

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
		; (format t "bound ~s to header ~s~%" header-bound-form (car (second in-schema)))
		(block replace-schema-name
			; If we match a more specific predicate from the story
			; to a more general one in the schema, we'll replace the name
			(setf old-name (prop-pred (car (second in-schema))))
			(setf new-name (prop-pred header-bound-form))
			(setf test-schema (replace-vals old-name new-name test-schema))
		)
	)




	(dbg 'match "all bindings: ~s~%" (ht-to-str all-bindings))
	(dbg 'match "total matches: ~s~%" total-matches)

	(setf gen-match (generalize-schema-constants test-schema))

	(setf new-name (new-schema-match-name (second (car (second test-schema)))))

	(setf new-gen-header (append (list (car (car (second gen-match))) new-name) (cddr (car (second gen-match)))))
	(setf new-match-header (append (list (car (car (second test-schema))) new-name) (cddr (car (second test-schema)))))
	(setf test-schema (set-header test-schema new-match-header))
	; (format t "gen match is ~s~%" gen-match)
	(setf gen-match (set-header gen-match new-gen-header))
	(set new-name gen-match)

	(return-from outer (list test-schema all-bindings bound-header))
)
)

(defun cached-match-formula-to-schema (phi test-schema all-bindings total-matches bound-header story-formulas)
	(ll-partial-cache
		'uncached-match-formula-to-schema
		(list phi test-schema all-bindings total-matches bound-header)
		(list phi test-schema all-bindings total-matches bound-header story-formulas)
		128
	)
)

(defun match-formula-to-schema (phi in-schema all-bindings total-matches bound-header story-formulas)
(let (
	best-bindings best-schema
	(test-schema (copy-list in-schema))
)
(block outer
	(setf subschemas (loop for st in (section-formulas (get-section test-schema ':Steps))
		if (invokes-schema? (second st))
			collect (expand-nested-schema st test-schema)
	))

	; (format t "also considering subschemas ~s~%" subschemas)

	; The parent schema has its bindings applied already, so any expanded schema
	; bindings don't need to have the parent bindings applied.
	(setf expanded-schemas (append (list (list test-schema (ht-copy all-bindings))) subschemas))
	; (setf expanded-schemas (list (car expanded-schemas)))

	(setf best-single-res nil)
	(setf best-schema nil)
	(setf best-bindings nil)
	(setf best-expanded-bindings nil)
	; (setf all-scores nil)

	(setf matched-sub nil)

	(loop for expanded-schema-pair in expanded-schemas
			for i from 0
		do (block match-block
			(setf expanded-schema (car expanded-schema-pair))
			(setf expanded-bindings (second expanded-schema-pair))

			; don't allow header matches if i > 0, i.e. if this is a subschema
			(setf old-expanded-bindings (ht-copy expanded-bindings))
			(setf single-res (match-formula-to-single-schema phi (apply-bindings expanded-schema expanded-bindings) expanded-bindings total-matches bound-header story-formulas (= i 0)))


			(if (null single-res)
				; then
				(return-from match-block)
			)

			; (format t "phi ~s~%" phi)
			; (format t "exp-schema ~s~%" (second expanded-schema))
			; (format t "single res ~s~%" single-res)

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
				; (format t "our fifth (~s) was greater than best fifth (~s)~%" (fifth single-res) (fifth best-single-res))
				; (format t "setting best bindings ~s~%" (ht-to-str (second single-res)))
				; (format t "started with expanded bindings ~s~%" (ht-to-str old-expanded-bindings))
				; (format t "~%")
				; (format t "best binding for ~s was in ~s of ~s~%" phi expanded-schema test-schema)
				(setf best-expanded-bindings old-expanded-bindings)
				(setf best-bindings (second single-res))
				; (setf best-schema (apply-bindings expanded-schema best-bindings))
				(setf best-schema (car single-res))
				(setf best-single-res single-res)
				(setf matched-sub (> i 0))
				; (setf all-scores (append all-scores (list (fifth best-single-res))))
				)
			)
		)
	)

	(if matched-sub
	(progn
	; (format t "best binding for ~s was in ~s of ~s~%" phi expanded-schema test-schema)
	; (format t "bindings were ~s on schema ~s~%" (ht-to-str (second best-single-res)) (car best-single-res))
	; (format t "gen schema is ~s~%" (eval (second (car (second (car best-single-res))))))
	; (format t "best bindings are ~s~%" (ht-to-str best-bindings))
	; (format t "best expanded bindings are ~s~%" (ht-to-str best-expanded-bindings))
	)
	)

	; (format t "sub-match? ~s~%" matched-sub)

	(if (or (null (fifth best-single-res)) (<= (fifth best-single-res) 0) (null best-schema))
		(return-from outer nil)
	)

	; (print-schema (eval (second (car (second (car best-single-res))))))

	; (format t "matched ~s to ~s (score ~s)~%" phi (second (car best-single-res)) (fifth best-single-res))

	(setf matched-bindings nil)
	(if (not matched-sub)
		; then
		(progn
		(setf all-bindings best-bindings)
			; (format t "UN-generalized sub-match is:~%")
			; (print-schema (car best-single-res))
		(setf test-schema (car best-single-res))
		)
		; else
		(block gen-sub-match
			; (format t "generalizing with bindings ~s~%" (ht-to-str best-bindings))
			(setf gen-match-pair (mapped-generalize-schema-constants (apply-bindings (car best-single-res) best-bindings)))
			; (format t "generalized subschema is ~s~%" (second gen-match-pair))
			; (format t "generalized rebindings are ~s~%" (ht-to-str (car gen-match-pair)))
			(setf matched-bindings (car gen-match-pair))
			; (format t "pre-correction, got matched bindings ~s~%" (ht-to-str matched-bindings))
			; (format t "matched bindings are ~s~%" (ht-to-str matched-bindings))
			; (setf gen-match (clean-do-kas (rename-constraints (sort-steps (dedupe-sections (second gen-match-pair))))))
			(setf gen-match (second gen-match-pair))

			;(format t "UN-generalized sub-match is:~%")
			;(print-schema (car best-single-res))
			;(format t "generalized sub-match is:~%")
			;(print-schema gen-match)


			; We've created a new name for our subschema match, and it has its own variables.
			; We're going to replace the subschema's step in the parent schema with a step using
			; its new name.
			(setf new-name (new-schema-match-name (second (car (second (car best-single-res))))))
			(setf gen-match (replace-vals (second (car (second (car best-single-res)))) new-name gen-match))
			; (format t "renamed gen subschema is ~s~%" gen-match)
			(set new-name gen-match)
			(setf new-sec (list ':Steps))
			(loop for st in (section-formulas (get-section test-schema ':Steps))
				do (if (equal (car st) (third (second (car best-single-res))))
					; then
					(setf new-sec (append new-sec (list (list (car st) (replace-vals (second (car (second (car best-single-res)))) new-name (car (second (car best-single-res))))))))
					; (setf new-sec (append new-sec (list (list (car st) (car (second gen-match))))))
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

			; (format t "rebinding with parent rebindings ~s~%" (ht-to-str parent-rebindings))
			(setf test-schema (apply-bindings test-schema parent-rebindings))
			; (format t "renamed in framing schema: ~s~%" test-schema)
		)
	)

	; (format t "bindings ~s~%" (ht-to-str (second best-single-res)))
	(if (and (not (null matched-bindings)) (> (hash-table-count matched-bindings) 0))
		(progn
		; (format t "original bindings: ~s~%" (ht-to-str best-bindings))
		; (format t "matched bindings: ~s~%" (ht-to-str matched-bindings))
		; (format t "parent re-bindings: ~s~%" (ht-to-str parent-rebindings))
		; (format t "current subordinate constraints: ~s~%" (get-section test-schema ':Subordinate-constraints))
		)
	)
	(setf out-schema test-schema)
	(if matched-sub
	; (if (and nil matched-sub)
	(loop for k being the hash-keys of matched-bindings
		;do (format t "((~s<- ~s) = ~s)~%" k (third (second best-schema)) (gethash k (second best-single-res)))
		; if matched-sub
		do (block add-subord-constr
			(setf sk-fn-name (intern (concat-two-strs (string k) "<-")))
			(setf constr (list (list sk-fn-name (third (second (car best-single-res)))) '= (gethash k matched-bindings)))
			(setf out-schema (add-constraint out-schema ':Subordinate-constraints constr))
		)
	))
	; (format t "all bindings: ~s~%" (ht-to-str all-bindings))
	(setf best-single-res (list
		; (apply-bindings out-schema all-bindings)
		out-schema
		all-bindings
		(third best-single-res)
		(fourth best-single-res)
		(fifth best-single-res)
	))

	(return-from outer best-single-res)
))
)

(defun match-formula-to-single-schema (phi test-schema all-bindings total-matches bound-header story-formulas allow-header-match)
(block outer
			; (if (not (canon-charstar? phi))
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
						(progn
							; (format t "matched header for ~s with bindings ~s~%" (car (second test-schema)) (ht-to-str go-match))
							(setf bound-header t)
						)
					)
	
					(dbg 'match "bound to story formula ~s~%" phi)
					; (format t "bound schema formula ~s to story formula ~s in base schema~%~s~%" matched-schema phi test-schema)
					; (format t "produced bindings ~s~%" (ht-to-str go-match))
					(setf total-matches (+ total-matches 1))
					; (dbg 'match "Extra constraints: ~s~%" constraints)

					; Accumulate all bindings
					(loop for key being the hash-keys of go-match
						;	do (setf (gethash key all-bindings) (gethash key go-match))
						do (if (null (bind-if-unbound key (gethash key go-match) all-bindings))
							; then
							(return-from outer nil)
						)
					)
	
					(setf go-match-schema (apply-bindings test-schema go-match))
					; (format t "applied bindings ~s~%" (ht-to-str go-match))

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




					; (format t "all constraints to add: ~s~%" constraints)

	
					(loop for const in constraints do (block const-add
						(if (time-prop? const)
							; then
							(setf go-match-schema (add-constraint go-match-schema ':Episode-relations const))
							; else
							(setf go-match-schema (add-role-constraint go-match-schema const))
						)
					))

					; (format t "schema with constraints added: ~s~%" go-match-schema)
					; (dbg 'match "test-schema match + generalization:~%~s~%" "")
					; (print-schema go-match-schema)
					; (return-from outer go-match-schema)
					(setf test-schema go-match-schema)
				)
			)

		; (format t "go match triple ~s~%" go-match-triple)
		(return-from outer (list test-schema all-bindings total-matches bound-header (fourth go-match-triple)))

		)
)

(defun check-constraints (schema story)
	(check-constraints-helper schema story (make-hash-table :test #'equal))
)

(defun check-constraints-helper (schema story checked)
	(uncached-check-constraints schema story checked)
	; (ll-cache 'uncached-check-constraints (list schema story checked) 5)
)

(defun uncached-check-constraints (schema story checked)
	(uncached-check-constraints-helper schema story checked)
)

(defun uncached-check-constraints (schema story checked)
(let (bound-nested phi phi-id phi-pair sec true-count untrue-count)
(block outer
	(load-story-time-model story)
	(setf story-kb (story-to-kb (linearize-story story)))

	(setf true-count 0)
	(setf untrue-count 0)

	(loop for sec in (nonmeta-sections schema)
		; do (loop for phi in (mapcar #'second (section-formulas sec))
		do (loop for phi-pair in (section-formulas sec)
			do (block check-constr
				(setf phi-id (car phi-pair))
				(setf phi (second phi-pair))
				(if (has-element-pred phi #'varp)
					; then
					(return-from check-constr)
				)

				(setf bound-nested nil)

				(if (invokes-schema? phi)
					; then
					(progn
						; (format t "evaluating nested schema ~s~%" phi)
						(setf nested-schema-name (prop-pred phi))
						(setf nested-schema (eval (prop-pred phi)))

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


						; (format t "attempting to unify prop ~s with header ~s~%" (list phi '** phi-id) nested-schema)
						(setf header-bindings (third (unify-with-schema (list phi '** phi-id) nested-schema (linearize-story story))))
						(if (null header-bindings)
							(format t "BUG: ~s invoked ~s, but couldn't unify!~%" phi nested-schema-name)
						)
						; (format t "got result ~s~%" header-bindings)
						(setf nested-schema-bound (apply-bindings nested-schema header-bindings))
						; (format t "evaluating nested schema ~s~%" nested-schema-bound)
						(setf old-checked-count (hash-table-count checked))
						(setf nest-score (check-constraints-helper nested-schema-bound story checked))
						; If a nested schema breaks a necessity-1 constraint,
						; the whole nest is invalid.
						(if (null nest-score)
							(return-from outer nil)
						)

						(setf new-checked-count (hash-table-count checked))
						; (format t "score of ~s for nested schema ~s~%" nest-score nested-schema-name)

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
						(format t "verifying ~s~%" phi)
						(if (eval-prop phi story-kb)
							; then
							(setf true-count (+ true-count 1))
							; (format t "	true: ~s~%" phi)

							; else
							; (format t "time model: ~s~%" *TIME-MODEL*)
							(if (equal (get-necessity phi-id schema) 1.0)
								; then, invalid match
								(return-from outer nil)
								; else
								(setf untrue-count (+ untrue-count 1))
							)
							; (format t "	untrue: ~s~%" phi)
						)
						(setf (gethash phi checked) t)
					)
				)
			)
		)
	)

	(return-from outer (list true-count untrue-count))
)
)
)

(defun best-story-schema-match (story schema num_shuffles generalize)
	(car (top-k-story-schema-matches story schema num_shuffles generalize 1))
)

(defun top-k-story-matches (story num_shuffles schemas num_schemas generalize k)
(block outer
(setf best-schemas (mapcar (lambda (x) (second (car (second x)))) (top-k-schemas (get-single-word-preds story) (mapcar #'eval schemas) num_schemas)))

(load-story-time-model story)

(setf matches (make-hash-table :test #'equal))
(setf match-scores (make-hash-table :test #'equal))

;(format t "scores:~%")
;(loop for sc in scores do (format t "	~s~%" (- (car sc) (second sc))))
;(loop for i from 1 to 10 do 
(loop for protoschema in best-schemas do (block match-proto
	;(if (not (equal protoschema 'do_action_to_enable_action.v))
		; then
	;	(return-from match-proto)
	;)

	(loop for best-match-res-pair in (top-k-story-schema-matches story (eval protoschema) num_shuffles generalize k) do (block process-each

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

	(return-from outer (loop for k being the hash-keys of matches append
		(loop for match in (gethash k matches)
				for match-score in (gethash k match-scores)
			collect (list match match-score))
		; (list (gethash k matches) (gethash k match-scores))
	))
)
)

(defun top-k-story-schema-matches (story schema num_shuffles generalize k)
(block outer
	; (dbg 'match "matching to schema ~s~%" schema)
	(setf best-score '(0 0))
	(setf best-match nil)
	(setf best-bindings nil)

	(setf all-matches (list))

	(setf linear-story (linearize-story story))

	(loop for i from 1 to num_shuffles do (block shuffle-block
		(if (equal 0 (mod i 10))
			; then
			(progn
				(dbg 'shuffle-match "~s / ~s~%" i num_shuffles)
				(dbg 'shuffle-match "	best score is ~s~%" best-score)
			)
		)
			
		(setf cur-match-triple (match-story-to-schema linear-story schema nil))
		; (format t "got triple ~s~%" cur-match-triple)
		(setf cur-match (car cur-match-triple))
		(setf cur-bindings (second cur-match-triple))
		(setf bound-header (third cur-match-triple))

		
		;(print-schema cur-match)
		
		;(setf score-pair (check-temporal-constraints cur-match))
		; (format t "score: ~s~%" score)
		; (setf score (- (car score-pair) (second score-pair)))

		; Always take one with fewer inconsistencies, but break ties with
		; number of explicit consistencies.
		;(setf invalid-score (second score-pair))
		; (format t "tick~%")
		; (format t "invalid temporal score: ~s~%" score-pair)
		; (format t "~s~%" (get-section cur-match ':Episode-relations))

		(setf score-pair (check-constraints cur-match story))
		; A null score indicates that a constraint with necessity
		; 1 was broken, and that the match is invalid by definition.
		(if (null score-pair)
			(return-from shuffle-block)
		)
		; (format t "score pair is ~s~%" score-pair)

		
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

		; (if better-than-best (format t "BEST~%"))
	
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
	
		(setf linear-story (shuffle linear-story))
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

			(setf a-better (< a-invalid b-invalid))
			(if (and (equal a-invalid b-invalid) (> a-valid b-valid))
				(setf a-better t)
			)

			(return-from lb a-better)
		)
		)
	))
	; (format t "sorted matches are ~s~%" (loop for x in sorted-matches collect (list (car x) (second x) (ht-to-str (third x)) (fourth x))))

	; (format t "return val is ~s~%" (mapcar (lambda (x) (subseq x 0 3)) (subseq-safe sorted-matches 0 k)))

	; (return-from outer (list best-score best-match best-bindings))
	(return-from outer (mapcar (lambda (x) (subseq x 0 3)) (subseq-safe sorted-matches 0 k)))
)
)
