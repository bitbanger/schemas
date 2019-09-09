(load "norm-schema-util.lisp")
(load "norm-el.lisp")

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
(let (bindings)
(block outer
	(loop for sec in (schema-sections schema)
		do (dbg 'match "	schema sec ~s~%" (section-name sec))
		do (loop for formula in (section-formulas sec) do
			(block uni
				(dbg 'match "		schema ~s~%" (second formula))
				;(dbg 'match "	~s~%" (second formula))
				(setf new-bindings (unify (second formula) phi bindings schema story))
				; (dbg 'match "set bindings are ~s~%" (ht-to-str bindings))
				; (setf (gethash bindings (car formula)) 
				(if (null new-bindings)
					; then
					;(dbg 'match "no uni~%")
					;(return-from outer nil)
					nil
					; else
					(progn
					(dbg 'match "bound to ~s~%" (second formula))
					(dbg 'match "bindings are ~s~%" (ht-to-str new-bindings))
					(if (and (canon-charstar? phi) (equal (section-type sec) 'FLUENT))
						; then
						; (dbg 'match "temporal formula ~s <-> ~s~%" (third phi) (car formula))
						(if (bind-if-unbound (car formula) (third phi) new-bindings)
							; then
							(return-from outer new-bindings)
							; (setf bindings new-bindings)
							; else
							(dbg 'match "~s already bound; cannot bind!~%" (car formula))
						)

						; else
						(return-from outer new-bindings)
					)
					;(dbg 'match "UNIFIED~%")
					;(dbg 'match "	~s~%" formula)
					; (dbg 'match "WITH~%")
					; (dbg 'match "	~s~%" phi)
					;(dbg 'match "bindings:~%~s~%" (ht-to-str bindings))
					;(dbg 'match "small individuals:~%~s~%" (extract-small-individuals phi))
					;(dbg 'match "extra constraints:~%~s~%" (story-select-term-constraints story (extract-small-individuals phi)))
					;(dbg 'match "final schema:~%~s~%" (apply-bindings schema bindings))
					;(dbg 'match "final schema with added constraint:~%~s~%" (add-role-constraint (apply-bindings schema bindings) 'TRUE))

					(return-from outer bindings)
					)
				)
			)
		)
	)

	(return-from outer bindings)
	)
))

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
	(setf test-schema in-schema)

	(setf all-small-inds (list))

	(setf all-bindings (make-hash-table :test #'equal))
	(setf total-matches 0)

	; (setf story-formulas (linearize-story story))

	(loop for phi in story-formulas do (block uni-loop
			(setf small-inds (extract-small-individuals phi))
			(setf all-small-inds (remove-duplicates (union small-inds all-small-inds) :test #'equal))
			(setf constraints (story-select-term-constraints story-formulas small-inds))
	
			(dbg 'match "trying:~%")
			(dbg 'match "	formula ~s~%" phi)
			(setf go-match (unify-with-schema phi test-schema story-formulas))
	
			(if (not (null go-match))
				; then
				(block print-go-match
					(dbg 'match "bound to story formula ~s~%" phi)
					(setf total-matches (+ total-matches 1))
					; (dbg 'match "Extra constraints: ~s~%" constraints)

					; Accumulate all bindings
					(loop for key being the hash-keys of go-match
						do (setf (gethash key all-bindings) (gethash key go-match))
					)
	
					(setf go-match-schema (apply-bindings-and-check test-schema go-match story-formulas))

					; Make sure the full matched sentence goes in the step slot
					(setf new-steps (list ':Steps))
					(loop for s in (cdr (get-section go-match-schema ':Steps)) do (block fix-steps
						(if (and (canon-charstar? phi) (equal (third phi) (car s)))
							; then
							(setf new-steps (append new-steps (list (list (car s) (car phi)))))
							; else
							(setf new-steps (append new-steps (list s)))
					)))
					(setf go-match-schema (set-section go-match-schema ':Steps new-steps))
	
					(loop for const in constraints do (block const-add
						(if (time-prop? const)
							; then
							(setf go-match-schema (add-constraint go-match-schema ':Episode-relations const))
							; else
							(setf go-match-schema (add-role-constraint go-match-schema const))
						)
					))
					; (dbg 'match "test-schema match + generalization:~%~s~%" "")
					; (print-schema go-match-schema)
					; (return-from outer go-match-schema)
					(setf test-schema go-match-schema)
				)
			)
		))


					; Now replace terms by variables
					(if generalize
						(progn
						(dbg 'match "generalizing~%")

						(setf gen-cursor "?_A")
						; Advance the cursor until it's no longer in the schema.
						; We'll assume all underscore-prefixed variable names will
						; be added here and only here, and thus in order.
						(loop while (has-element test-schema (intern gen-cursor))
							do (dbg 'match "advancing cursor (~s is present)~%" gen-cursor)
							do (setf gen-cursor (next-str gen-cursor)))

						(loop for ind in all-small-inds do (block gen-ind-loop
							(setf test-schema (replace-vals ind (intern gen-cursor) test-schema))
							(setf gen-cursor (next-str gen-cursor))
						))
						)
					)

	(dbg 'match "all bindings: ~s~%" (ht-to-str all-bindings))
	(dbg 'match "total matches: ~s~%" total-matches)

	(return-from outer (list test-schema all-bindings))
)
)

(defun best-story-schema-match (story schema num_shuffles generalize)
(block outer
	(setf best-score 0)
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
			
		(setf cur-match-pair (match-story-to-schema linear-story schema nil))
		(setf cur-match (car cur-match-pair))
		(setf cur-bindings (second cur-match-pair))
		
		
		;(print-schema cur-match)
		
		(setf score-pair (check-temporal-constraints cur-match))
		(setf score (- (car score-pair) (second score-pair)))
		; (format t "score: ~s~%" score)
	
		(if (or (null best-match) (> score best-score))
			(progn
				(setf best-score score)
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
			(loop for sec in (schema-sections best-match)
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
