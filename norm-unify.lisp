(load "norm-el.lisp")

(defun bind-if-unbound (key val bindings)
	(if (not (null (gethash key bindings)))
		; then
		nil
		; else
		(progn
			(setf (gethash key bindings) val)
			t
		)
	)
)

(defun unify-props (schema story bindings)
(let
	(
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



; This is technically O(N!), but there will likely be
; very few necessary, or possible, backtracks.
(defun unify-mod-lists (schema-mods story-mods)
	; TODO (CURRENT): this
)



(defun unify-preds (schema story bindings)
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
