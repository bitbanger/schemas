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
		(return-from outer (unify-props schema (car story) bindings))
	)
	(if (canon-charstar? schema)
		(return-from outer (unify-props (car schema) story bindings))
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

	; step 3: compare the prefix args.
	(if (not (equal (length schema-pre-args) (length story-pre-args)))
		; then
		(progn
		(dbg 'unify "cannot unify props ~s and ~s (mismatched #s of prefix args)~%" schema story)
		(return-from outer nil)
		)
	)
	(loop for schema-pre-arg in schema-pre-args
		for story-pre-arg in story-pre-args do (block uargs
			(setf bindings (unify-individuals schema-pre-arg story-pre-arg bindings))
			(if (null bindings)
				; then
				(progn
				(dbg 'unify "cannot unify props ~s and ~s (could not unify all prefix args)~%" schema story)
				(return-from outer nil)
				)
			)
		)
	)

	; step 4: compare the preds (w/ postfix args).
	; TODO: actual subsumption check w/ ontology? Synonyms? etc.

	; We need to "package" the preds up to curry all postfix args
	; in, in case they were serialized into the proposition.
	(setf packaged-schema-pred (append (wrap-nonlists (apply-mods schema-mods schema-pred)) schema-post-args))
	(setf packaged-story-pred (append (wrap-nonlists (apply-mods story-mods story-pred)) story-post-args))
	(setf bindings (unify-preds packaged-schema-pred packaged-story-pred bindings))
	; (if (not (unify-preds packaged-schema-pred packaged-story-pred bindings))
	(if (null bindings)
		; then
		(progn
		(dbg 'unify "props ~s and ~s cannot be unified (preds cannot be unified)~%" schema story)
		(return-from outer nil)
		)
	)


	; Success!
	(return-from outer bindings)

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
				(dbg 'unify "predicate modifiers ~s and ~s cannot be unified~%" schema story)
				(return-from outer nil)
				)
			)
		)
		; else
		(progn
		(dbg 'unify "predicate modifiers ~s and ~s cannot be unified~%" schema story)
		(return-from outer nil)
		)
	)

	; At this point in the function, both mods are pairs of
	; a modifier type-shifting operator and a predicate.
	; Compare the type-shifting operators for equality, then
	; try to unify the predicates.
	(if (equal (car schema) (car story))
		; then
		(return-from outer (unify-preds (second schema) (second story) bindings))
		; else
		(progn
		(dbg 'unify "predicate modifiers ~s and ~s cannot be unified~%" schema story)
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
		(dbg 'unify "individuals ~s and ~s cannot be unified~%" schema story)
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
					(dbg 'unify "cannot bind var ~s to formula ~s; already bound to ~s~%" schema story (gethash schema bindings))
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
			(dbg 'unify "individuals ~s and ~s cannot be unified~%" schema story)
			(return-from outer nil)
			)
			; else
			(if (not (equal schema story))
				; then
				(progn
				(dbg 'unify "individuals ~s and ~s cannot be unified~%" schema story)
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
			(return-from outer (unify-preds (second schema) (second story) bindings))
		)
		((and (equal 'KA (car schema)) (equal 'KA (car story)))
			; KA
			(return-from outer (unify-preds (second schema) (second story) bindings))
		)
		((and (equal 'KE (car schema)) (equal 'KE (car story)))
			; KE
			(return-from outer (unify-props (second schema) (second story) bindings))
		)
		((and (equal 'THAT (car schema)) (equal 'THAT (car story)))
			; THAT 
			(return-from outer (unify-props (second schema) (second story) bindings))
		)
		((and (lex-p-arg? (car schema)) (lex-p-arg? (car story)))
			; P-ARG 
			(return-from outer (unify-individuals (second schema) (second story) bindings))
		)
		(t
			(progn
			(dbg 'unify "individuals ~s and ~s cannot be unified~%" schema story)
			(return-from outer nil)
			)
		)
	)
)
)
)


(defun unify-mod-lists (schema-mods story-mods old-bindings)
(let (
	(bindings (ht-copy old-bindings))
	(unified-mods 0)

	tmp-bindings

)
(block outer
	(if (< (length story-mods) (length schema-mods))
		; then
		(progn
		(dbg 'unify "modifier lists ~s and ~s cannot be unified (not enough predicate modifiers in the latter~%" schema-mods story-mods)
		(return-from outer nil)
		)
	)

	(setf tmp-bindings (ht-copy bindings))
	(loop for schema-mod in schema-mods do (block umods-outer
		(loop for story-mod in story-mods do (block umods-inner
			(setf tmp-bindings (unify-mods schema-mod story-mod tmp-bindings))
			; If we find a unification, move on to the next
			; schema predicate modifier.
			(if (not (null tmp-bindings))
				; then
				(progn
				(setf unified-mods (+ 1 unified-mods))
				(return-from umods-outer)
				)
			)
		))
	))

	(if (< unified-mods (length schema-mods))
		; then
		(progn
		(format "modifier lists ~s and ~s cannot be unified (not all predicate modifiers in the former can be unified to any in the latter)~%" schema-mods story-mods)
		(return-from outer nil)
		)
	)

	(setf bindings tmp-bindings)
	(return-from outer bindings)
)
)
)


(defun unify-preds (schema story old-bindings)
	(check (canon-pred? schema))
	(check (canon-pred? story))
(let (

(bindings (ht-copy old-bindings))

tmp-bindings
unified-mods

)
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
			(equal schema-pred 'DO.V)
			(equal 1 (length schema-args))
			(varp (car schema-args))
		)
		; then
		(block bind-do-ka
			(setf bind-pred (apply-mods story-mods story-pred))
			(setf bind-ka (list 'KA (append (list bind-pred) story-args)))
			;(if (bind-if-unbound (car schema-args) bind-ka 
			(setf mod-bindings (unify-mod-lists schema-mods story-mods bindings))
			(if (null mod-bindings)
				; then
				(progn
				(dbg 'unify "predicates ~s and ~s cannot be unified (not all predicate modifiers in the former can be unified to any in the latter)~%" schema story)
				(return-from outer nil)
				)
			)

			(if (not (bind-if-unbound (car schema-args) bind-ka mod-bindings))
				; then
				(if (not (equal (gethash (car schema-args) mod-bindings) bind-ka))
					; then
					(progn
					(dbg 'unify "predicates ~s and ~s cannot be unified (variable ~s is already bound to ~s)~%" (car schema-args) (gethash (car schema-args) mod-bindings))
					(return-from outer nil)
					)
				)
			)

			; Success for the do.v ?a case!
			(return-from outer mod-bindings)
		)
	)

	; Otherwise, we've got two normal preds with normal arg/mod 
	; lists. First, unify the two "head" predicates, which will
	; be lexical (for now?).

	(if (not (equal schema-pred story-pred))
		; then
		(progn
		(dbg 'unify "predicates ~s and ~s cannot be unified~%" schema-pred story-pred)
		(return-from outer nil)
		)
	)


	; Next, unify all the args in order, then find some matching
	; modifier in the story pred for each one in the schema
	; pred.

	; Verify argument lists are parallel.
	(if (not (equal (length schema-args) (length story-args)))
		; then
		(progn
		(dbg 'unify "predicates ~s and ~s cannot be unified (different #s of arguments)~%" schema story)
		)
	)

	; Unify all arguments & accumulate bindings.
	(setf tmp-bindings (ht-copy bindings))
	(loop for schema-arg in schema-args
		for story-arg in story-args
			do (block uargs
				(setf tmp-bindings (unify-individuals schema-arg story-arg tmp-bindings))
				(if (null tmp-bindings)
					; then
					(progn
					(dbg 'unify "predicates ~s and ~s cannot be unified (cannot unify arguments)~%" schema story)
					(return-from outer nil)
					)
				)
			)
	)
	(setf bindings tmp-bindings)


	; Unify all schema modifiers with some modifiers from the
	; story predicate & accumulate bindings.
	(setf tmp-bindings (unify-mod-lists schema-mods story-mods bindings))
	(if (null tmp-bindings)
		(progn
		(dbg 'unify "predicates ~s and ~s cannot be unified (cannot unify all modifiers in the former with any in the latter)~%" schema story)
		(return-from outer nil)
		)
	)
	(setf bindings tmp-bindings)

	; Unified!
	(return-from outer bindings)
)
)
)
