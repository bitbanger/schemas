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
(block outer
	; first, check whether phi unifies with the schema's header
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
				(return-from outer (list (car (second schema)) phi new-bindings))
			)
			)
		)
	)

	; (loop for sec in (nonmeta-sections schema)
	(loop for sec in (fluent-sections schema)
		do (dbg 'match "	schema sec ~s~%" (section-name sec))
		do (loop for formula in (section-formulas sec) do
			(block uni
				(dbg 'match "		schema ~s~%" (second formula))
				(setf new-bindings (unify (second formula) phi nil schema story))
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
					(return-from outer (list (second formula) phi new-bindings))
				)
			)
		)
	)

	(return-from outer nil)
	)
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

	(setf all-bindings (make-hash-table :test #'equal))
	(setf total-matches 0)

	; (setf story-formulas (linearize-story story))

	(loop for phi in story-formulas do (block uni-loop
		(setf fm-res (match-formula-to-schema phi test-schema all-bindings total-matches bound-header story-formulas))
		(if (null fm-res) (return-from uni-loop))

		(setf test-schema (car fm-res))
		(setf all-bindings (second fm-res))
		(setf total-matches (third fm-res))
		(setf bound-header (fourth fm-res))
		
	))




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

(defun match-formula-to-schema (phi test-schema all-bindings total-matches bound-header story-formulas)
	(ll-partial-cache
		'uncached-match-formula-to-schema
		(list phi test-schema all-bindings total-matches bound-header)
		(list phi test-schema all-bindings total-matches bound-header story-formulas)
		128
	)
)

(defun uncached-match-formula-to-schema (phi test-schema all-bindings total-matches bound-header story-formulas)
(block outer
			(if (not (canon-charstar? phi))
				(return-from outer nil)
			)

			(setf small-inds (extract-small-individuals phi))
			(setf constraints (story-select-term-constraints story-formulas small-inds))
	
			(dbg 'match "trying:~%")
			(dbg 'match "	formula ~s~%" phi)
			(setf go-match-triple (unify-with-schema phi test-schema story-formulas))
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
						do (setf (gethash key all-bindings) (gethash key go-match))
					)
	
					(setf go-match-schema (apply-bindings test-schema go-match))
					; (format t "applied bindings ~s~%" (ht-to-str go-match))

					; Make sure the full matched sentence 
					(setf new-steps (list ':Steps))
					(loop for s in (cdr (get-section go-match-schema ':Steps)) do (block fix-steps
						(if (and (canon-charstar? phi) (equal (third phi) (car s)))
							; then
							(setf new-steps (append new-steps (list (list (car s) (car phi)))))
							; else
							(setf new-steps (append new-steps (list s)))
					)))
					(setf go-match-schema (set-section go-match-schema ':Steps new-steps))

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

		(return-from outer (list test-schema all-bindings total-matches bound-header))

		)
)

(defun check-constraints (schema story)
	; (uncached-check-constraints schema story)
	(ll-cache 'uncached-check-constraints (list schema story) 5)
)

(defun uncached-check-constraints (schema story)
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

				(if (and (boundp (prop-pred phi))
					(schema? (eval (prop-pred phi)))
					; TODO: break this down for booleans
					(canon-atomic-prop? phi)
					)
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
						(setf nest-score (check-constraints nested-schema-bound story))
						; (format t "score of ~s for nested schema ~s~%" nest-score nested-schema-name)
						(setf true-count (+ true-count (car nest-score)))
						(setf untrue-count (+ untrue-count (second nest-score)))
					)
				)

				(if (eval-prop phi story-kb)
					; then
					(progn
						(setf true-count (+ true-count 1))
						; (format t "	true: ~s~%" phi)
					)
					; else
					(progn
						; (format t "time model: ~s~%" *TIME-MODEL*)
						(setf untrue-count (+ untrue-count 1))
						; (format t "	untrue: ~s~%" phi)
					)
				)
			)
		)
	)

	(return-from outer (list true-count untrue-count))
)
)

(defun best-story-schema-match (story schema num_shuffles generalize)
(block outer
	; (dbg 'match "matching to schema ~s~%" schema)
	(setf best-score '(0 0))
	(setf best-match nil)
	(setf best-bindings nil)

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
		; (format t "score pair is ~s~%" score-pair)

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
			)
		)
	
		(setf linear-story (shuffle linear-story))
	))

	; print all small inds in schema
	(if generalize
		; then
		(block gen-block
			(setf story-formulas (linearize-story story))
			(setf all-small-inds (list))
			(loop for sec in (nonmeta-sections best-match)
				do (block ll1
					(loop for phi in (mapcar #'second (section-formulas sec))
						do (block ll2
							(setf small-inds (extract-small-individuals phi))
							(setf all-small-inds (remove-duplicates (union small-inds all-small-inds)))
						)
					)
				)
			)

			(setf gen-cursor "?A")
			(loop for si in all-small-inds do (block gen-block-2
				; (format t "small ind: ~s~%" si)
				; Advance the cursor until it's no longer in the schema.
				; We'll assume all underscore-prefixed variable names will
				; be added here and only here, and thus in order.
				(loop while (has-element best-match (intern gen-cursor))
					do (setf gen-cursor (next-str gen-cursor))
				)

				(setf best-match (replace-vals si (intern gen-cursor) best-match))
				(setf gen-cursor (next-str gen-cursor))
			))
		)
	)

	(return-from outer (list best-score best-match best-bindings))
)
)
