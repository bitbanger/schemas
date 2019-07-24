(load "norm-el.lisp")

(defun bind-if-unbound (key val bindings)
	(if (not (null (gethash key bindings)))
		; then
		(if (equal (gethash key bindings) val)
			; then
			t
			; else
			nil
		)
		; else
		(progn
			(setf (gethash key bindings) val)
			t
		)
	)
)

(defun unify-props (schema story old-bindings)
	(check (canon-prop? schema))
	(check (canon-prop? story))
(let
	(
		(bindings (ht-copy old-bindings))

		schema-pre-args schema-pred schema-post-args schema-mods
		story-pre-args story-pred story-post-args story-mods
	)
(block outer
	; step 1: strip * and **
	(if (canon-charstar? story)
		(return-from outer (unify-props schema (car story)))
	)
	(if (canon-charstar? schema)
		(return-from outer (unify-props (car schema) story))
	)

	; step 2: break the props down into their component parts
	(setf story-pre-args (prop-pre-args story))
	(setf story-pred (prop-pred story))
	(setf story-post-args (prop-post-args story))
	(setf story-mods (prop-mods story))
	(setf schema-pre-args (prop-pre-args schema))
	(setf schema-pred (prop-pred schema))
	(setf schema-post-args (prop-post-args schema))
	(setf schema-mods (prop-mods schema))

	; step 3: compare the bare preds.
	; TODO: actual subsumption check w/ ontology? Synonyms? etc.

	; We need to "package" the preds up to curry all postfix args
	; in, in case they were serialized into the proposition.
	(setf packaged-schema-pred (append (apply-mods schema-mods schema-pred) schema-post-args))
	(setf packaged-story-pred (append (apply-mods story-mods story-pred) story-post-args))
	(if (not (unify-preds packaged-schema-pred packaged-story-pred))
		(progn
		(format t "props ~s and ~s: could not unify preds ~s and ~s~%" packaged-schema-pred packaged-story-pred)
		(return-from outer nil)
		)
	)

	; if the schema has do.v with a single variable argument, we'll just call
	; it a match and bind the variable to a ka of the story pred
)
)
)


(defun unify-mods (schema story old-bindings)
	(check (canon-mod? schema))
	(check (canon-mod? story))
(let ((bindings (ht-copy old-bindings)))
(block outer
	(if (equal schema story)
		; then
		(return-from outer bindings)
	)

	(if (or (not (listp schema)) (not (listp story)))
		; then
		(if (and (not (listp schema)) (not (listp story)))
			; then
			(if (equal schema story)
				; then
				(return-from outer bindings)
				; else
				(progn
				(format t "predicate modifiers ~s and ~s cannot be unified~%" schema story)
				(return-from outer nil)
				)
			)
		)
		; else
		(progn
		(format t "predicate modifiers ~s and ~s cannot be unified~%" schema story)
		(return-from outer nil)
		)
	)

	; At this point in the function, both mods are pairs of
	; a modifier type-shifting operator and a predicate.
	; Compare the type-shifting operators for equality, then
	; try to unify the predicates.
	(if (equal (car schema) (car story))
		; then
		(return-from outer (unify-preds (second schema) (second story)))
		; else
		(progn
		(format t "predicate modifiers ~s and ~s cannot be unified~%" schema story)
		(return-from outer nil)
		)
	)

)
)
)


(defun unify-individuals (schema story old-bindings)
	(check (canon-individual? schema))
	(check (canon-individual? story))
(let ((bindings (ht-copy old-bindings)))
(block outer
	(if (equal schema story)
		; then
		(return-from outer bindings)
	)

	(if (or (and (null schema) (not (null story)))
			(and (not (null schema)) (null story)))
		; then
		(progn
		(format t "individuals ~s and ~s cannot be unified~%" schema story)
		(return-from outer nil)
		)
	)

	(if (varp schema)
		; then
		(block schema-var
			; NOTE: We're skipping the "occurs" check
			; and story-side variable substitution because
			; the story won't have any variables in it, for
			; now.
			; TODO: implement these when the story gets
			; universally quantified variables/Skolem functions.

			; Try to bind the variable to the story
			; formula
			(if (bind-if-unbound schema story bindings)
				; then
				(return-from outer bindings)
				; else
				(if (equal (gethash schema bindings) story)
					; then
					(return-from outer bindings)
					; else
					(progn
					(format t "cannot bind var ~s to formula ~s; already bound to ~s~%" schema story (gethash schema bindings))
					(return-from outer nil)
					)
				)
			)
		)
	)

	; Individuals can now both be kinds, Skolem constants,
	; pronouns, names, p-args, reified propositions, and random
	; alphanumeric symbols (although these should be avoided in
	; practice). If they aren't lists, they should only be checked
	; for equality.
	(if (not (and (listp schema) (listp story)))
		; then
		(if (or (listp schema) (listp story))
			; then
			(progn
			(format t "individuals ~s and ~s cannot be unified~%" schema story)
			(return-from outer nil)
			)
			; else
			(if (not (equal schema story))
				; then
				(progn
				(format t "individuals ~s and ~s cannot be unified~%" schema story)
				(return-from outer nil)
				)
				; else
				; (we've now unified two constants)
				(return-from outer bindings)
			)
		)
	)


	; At this point in the function, the individuals are each
	; a kind, a reified proposition, or a p-arg. All of these
	; start with unique symbol, so check that the heads of the
	; lists are equal.

	(cond
		((and (equal 'K (car schema)) (equal 'K (car story)))
			; K
			(return-from outer (unify-preds (second schema) (second story)))
		)
		((and (equal 'KA (car schema)) (equal 'KA (car story)))
			; KA
			(return-from outer (unify-preds (second schema) (second story)))
		)
		((and (equal 'KE (car schema)) (equal 'KE (car story)))
			; KE
			(return-from outer (unify-props (second schema) (second story)))
		)
		((and (equal 'THAT (car schema)) (equal 'THAT (car story)))
			; THAT 
			(return-from outer (unify-props (second schema) (second story)))
		)
		((and (lex-p-arg? (car schema)) (lex-p-arg? (car story)))
			; P-ARG 
			(return-from outer (unify-individuals (second schema) (second story)))
		)
		(t
			(progn
			(format t "individuals ~s and ~s cannot be unified~%" schema story)
			(return-from outer nil)
			)
		)
	)
)
)
)



(defun unify-preds (schema story old-bindings)
	(check (canon-pred? schema))
	(check (canon-pred? story))
(let ((bindings (ht-copy old-bindings)))
(block outer
	(setf schema-pred (pred-base (pred-without-post-args schema)))
	(setf schema-mods (pred-mods schema))
	(setf schema-args (pred-args schema))
	(setf story-pred (pred-base (pred-without-post-args story)))
	(setf story-mods (pred-mods story))
	(setf story-args (pred-args story))

	; First off: if the schema is do.v ?a, we'll try to bind ?a to a kind
	; of action of the story pred. But first, we'll need to unify any do.v
	; modifiers with modifiers in the story pred.
	(if (and
			(equal 1 (length schema-args))
			(varp (car schema-args))
		)
		; then
		(block bind-do-ka
			(setf bind-mods (append schema-mods story-mods))
			(setf bind-pred (apply-mods bind-mods story-pred))
			(setf bind-ka (list 'KA (append (list bind-pred) story-args)))
			(if (bind-if-unbound (car schema-args) bind-ka 
		)
	)
)
)
)
