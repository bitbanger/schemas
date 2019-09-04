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
		do (format t "	schema sec ~s~%" (section-name sec))
		do (loop for formula in (section-formulas sec) do
			(block uni
				(format t "		schema ~s~%" (second formula))
				;(format t "	~s~%" (second formula))
				(setf new-bindings (unify (second formula) phi bindings))
				; (format t "set bindings are ~s~%" (ht-to-str bindings))
				; (setf (gethash bindings (car formula)) 
				(if (null new-bindings)
					; then
					;(format t "no uni~%")
					;(return-from outer nil)
					nil
					; else
					(progn
					(format t "bound to ~s~%" (second formula))
					(format t "bindings are ~s~%" (ht-to-str new-bindings))
					(if (and (canon-charstar? phi) (equal (section-type sec) 'FLUENT))
						; then
						; (format t "temporal formula ~s <-> ~s~%" (third phi) (car formula))
						(if (bind-if-unbound (car formula) (third phi) new-bindings)
							; then
							(return-from outer new-bindings)
							; (setf bindings new-bindings)
							; else
							(format t "~s already bound; cannot bind!~%" (car formula))
						)

						; else
						(return-from outer new-bindings)
					)
					;(format t "UNIFIED~%")
					;(format t "	~s~%" formula)
					; (format t "WITH~%")
					; (format t "	~s~%" phi)
					;(format t "bindings:~%~s~%" (ht-to-str bindings))
					;(format t "small individuals:~%~s~%" (extract-small-individuals phi))
					;(format t "extra constraints:~%~s~%" (story-select-term-constraints story (extract-small-individuals phi)))
					;(format t "final schema:~%~s~%" (apply-bindings schema bindings))
					;(format t "final schema with added constraint:~%~s~%" (add-role-constraint (apply-bindings schema bindings) 'TRUE))

					(return-from outer bindings)
					)
				)
			)
		)
	)

	(return-from outer bindings)
	)
))

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
	
			(format t "trying:~%")
			(format t "	formula ~s~%" phi)
			(setf go-match (unify-with-schema phi test-schema story-formulas))
	
			(if (not (null go-match))
				; then
				(block print-go-match
					(format t "bound to story formula ~s~%" phi)
					(setf total-matches (+ total-matches 1))
					; (format t "Extra constraints: ~s~%" constraints)

					; Accumulate all bindings
					(loop for key being the hash-keys of go-match
						do (setf (gethash key all-bindings) (gethash key go-match))
					)
	
					(setf go-match-schema (apply-bindings test-schema go-match))

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
						(setf go-match-schema (add-role-constraint go-match-schema const))
					))
					; (format t "test-schema match + generalization:~%~s~%" "")
					; (print-schema go-match-schema)
					; (return-from outer go-match-schema)
					(setf test-schema go-match-schema)
				)
			)
		))


					; Now replace terms by variables
					(if generalize
						(progn
						(format t "generalizing~%")

						(setf gen-cursor "?_A")
						; Advance the cursor until it's no longer in the schema.
						; We'll assume all underscore-prefixed variable names will
						; be added here and only here, and thus in order.
						(loop while (has-element test-schema (intern gen-cursor))
							do (format t "advancing cursor (~s is present)~%" gen-cursor)
							do (setf gen-cursor (next-str gen-cursor)))

						(loop for ind in all-small-inds do (block gen-ind-loop
							(setf test-schema (replace-vals ind (intern gen-cursor) test-schema))
							(setf gen-cursor (next-str gen-cursor))
						))
						)
					)

	(format t "all bindings: ~s~%" (ht-to-str all-bindings))
	(format t "total matches: ~s~%" total-matches)

	(return-from outer test-schema)
)
)

