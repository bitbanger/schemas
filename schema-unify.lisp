(load "ll-load.lisp")

(ll-load "schema-el.lisp")
(ll-load "schema-subsumption.lisp")
(ll-load "schema-util.lisp")

; This would create a cycle, but for the magic
; of ll-load :)
(ll-load "schema-match.lisp")

; This is a global variable used to temporarily disable
; constraint checking for unification calls. Disabling
; it is necessary when an expanded schema step is being
; filled in, because it's filled in with unification but
; without the entire story + knowledge base, so the
; constraints can't be checked. However, because expanded
; schemas are valid by definition (they were checked
; during the matching process), it's OK not to validate
; the constraints here.
; ...
; So, why is it a global variable, you ask? Good question!
; Because threading an optional variable through all of the
; unify calls without breaking anything would send me into
; a complete mental breakdown tonight.
; TODO: make this non-global later.
(defparameter *UNIFY-SHOULD-CHECK-CONSTRAINTS* t)

(ldefun bind-if-unbound (key val bindings)
(block outer
	; (format t "binding ~s to ~s in ~s~%" key val (ht-to-str bindings))
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
			; (format t "bound ~s to ~s~%" key val)
			(setf (gethash key bindings) val)
			t
		)
	)
)
)

(ldefun merge-bindings (b1 b2)
(block outer
	(if (null b1) (return-from outer b2))
	(if (null b2) (return-from outer b1))

	(setf b3 (make-hash-table :test #'equal))
	(loop for k being the hash-keys of b1
		do (setf (gethash k b3) (gethash k b1))
	)
	(loop for k being the hash-keys of b2
		if (not (and
			(not (null (gethash (gethash k b2) b3)))
			(equal (gethash (gethash k b2) b3) k)))
			; then
			do (setf (gethash k b3) (gethash k b2))
	)
)
)

(ldefun unify (schema story old-bindings whole-schema whole-story)
(block outer
	(if (null old-bindings)
		; then
		(return-from outer (unify-props schema story (make-hash-table :test #'equal) whole-schema whole-story))
	)

	(return-from outer (unify-props schema story old-bindings whole-schema whole-story))
)
)

(ldefun unify-no-schema (pred1 pred2 old-bindings)
	(unify pred1 pred2 old-bindings *BLANK-SCHEMA* nil)
)

(ldefun equal-with-unification (p1 p2)
(block outer
	(setf p1-bindings (unify-no-schema p1 p2 nil))
	(if (null p1-bindings) (return-from outer nil))
	(setf p2-bindings (unify-no-schema p2 (apply-bindings p1 p1-bindings) nil))
	(if (null p2-bindings) (return-from outer nil))
	; (format t "p1-bindings are ~s~%" (ht-to-str p1-bindings))
	; (format t "p2-bindings are ~s~%" (ht-to-str p2-bindings))

	(return-from outer (equal
		(apply-bindings p1 p1-bindings)
		(apply-bindings p2 p2-bindings)
	))
)
)

(ldefun unify-props (schema story old-bindings whole-schema whole-story)
	;(check (canon-prop? schema))
	;(check (canon-prop? story))
(let
	(
		(bindings (ht-copy old-bindings))

		schema-pre-args schema-pred schema-post-args schema-mods
		story-pre-args story-pred story-post-args story-mods
	)
(block outer
	; step 1: strip * and **
	(if (canon-charstar? story)
		(return-from outer (unify-props schema (car story) bindings whole-schema whole-story))
	)
	(if (canon-charstar? schema)
		(return-from outer (unify-props (car schema) story bindings whole-schema whole-story))
	)

	; also strip nots
	(if (and (equal (car story) 'NOT) (equal (car schema) 'NOT))
		(return-from outer (unify-props (second schema) (second story) bindings whole-schema whole-story))
	)

	(if (or (equal (car story) 'NOT) (equal (car schema) 'NOT))
		(progn
		(dbg 'unify "cannot unify props ~s and ~s (mismatched polarities)~%" schema story)
		(return-from outer nil)
		)
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

	; We will actually let these unify, for now,
	; and solve any problems in a more nuanced
	; way as they present themselves.
	(if nil
		(if (not (equal
					(has-element-pred schema-mods 'lex-modal?)
					(has-element-pred story-mods 'lex-modal?)))
			; then
			(progn
			(dbg 'unify "cannot unify props ~s and ~s (different modal environments)~%" schema story)
			(return-from outer nil)
			)
		)
	)

	; step 3: compare the prefix args.
	(if (not (equal (length schema-pre-args) (length story-pre-args)))
		; then
		(progn
		(dbg 'unify "cannot unify props ~s and ~s (mismatched #s of prefix args)~%" schema story)
		(return-from outer nil)
		)
	)
	; (format t "story pre args are ~s~%" story-pre-args)
	; (format t "schema pre args are ~s~%" schema-pre-args)
	; (format t "bindings are ~s~%" (print-ht bindings))
	; (format t "schema is ~s~%" schema)
	(loop for schema-pre-arg in schema-pre-args
		for story-pre-arg in story-pre-args do (block uargs
			(setf bindings (unify-individuals schema-pre-arg story-pre-arg bindings whole-schema whole-story))
			(if (null bindings)
				; then
				(progn
				; (format t "they didn't bind~%")
				(dbg 'unify "cannot unify props ~s and ~s (could not unify all prefix args)~%" schema story)
				(return-from outer nil)
				)
				; else
				(dbg 'unify "unified prefix args ~s and ~s~%" schema-pre-arg story-pre-arg)
				; (format t "they did bind~%")
			)
		)
	)
	; (format t "~%")
	(dbg 'unify "prefix bindings are ~s~%" (ht-to-str bindings))

	; (format t "bindings are no1 ~s~%" (ht-to-str bindings))

	; step 4: compare the preds (w/ postfix args).

	; We need to "package" the preds up to curry all postfix args
	; in, in case they were serialized into the proposition.
	(setf packaged-schema-pred (unwrap-singletons (norm-singletons (append (list (apply-mods schema-mods schema-pred)) schema-post-args))))
	(setf packaged-story-pred (unwrap-singletons (norm-singletons (append (list (apply-mods story-mods story-pred)) story-post-args))))
	 (dbg 'unify "packaged schema pred: ~s~%" packaged-schema-pred)
	 ;(dbg 'unify "is pred? ~s~%" (canon-pred? packaged-schema-pred))
	 ;(dbg 'unify "packaged story pred: ~s~%" packaged-story-pred)
	 ;(dbg 'unify "is pred? ~s~%" (canon-pred? packaged-story-pred))
	(setf bindings (unify-preds packaged-schema-pred packaged-story-pred bindings whole-schema whole-story))
	; (format t "bindings are now2 ~s~%" (ht-to-str bindings))
	; (dbg 'unify "packaged schema pred: ~s~%" packaged-schema-pred)
	; (if (not (unify-preds packaged-schema-pred packaged-story-pred bindings))
	(if (equal story '(TOM.NAME (MAKE.V SNOWMAN11.SK)))
		; (dbg 'tom "trying to unify ~s with ~s~%" story schema)
		(if (equal (prop-pred schema) 'MAKE.V)
			(dbg 'tom2 "trying to unify ~s with ~s~%" story schema)
		)
	)
	(if (null bindings)
		; then
		(progn
		(dbg 'unify "props ~s and ~s cannot be unified (preds cannot be unified)~%" schema story)
		(return-from outer nil)
		)
	)

	; (format t "success!~%")


	; Success!
	(dbg 'unify "success!~%")
	(return-from outer bindings)

)
)
)


(ldefun unify-mods (schema story old-bindings whole-schema whole-story)
	;(check (canon-mod? schema))
	;(check (canon-mod? story))
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
				(dbg 'unify "predicate modifiers ~s and ~s cannot be unified (neither is a list, and they aren't equal)~%" schema story)
				(return-from outer nil)
				)
			)
			; else
			(progn
			(dbg 'unify "predicate modifiers ~s and ~s cannot be unified (one is a list and the other isn't)~%" schema story)
			(return-from outer nil)
			)
		)
	)

	; At this point in the function, both mods are pairs of
	; a modifier type-shifting operator and a predicate.
	; Compare the type-shifting operators for equality, then
	; try to unify the predicates.
	(if (or
			(equal (car schema) (car story))
			; :R comes out a lot in parses, and can match to whatever
			(equal (car story) ':R)
		)
		; then
		(if (equal (length schema) (length story))
			; then
			; TODO: unify all serial args, not just second
			(return-from outer (unify-preds (second schema) (second story) bindings whole-schema whole-story))
			; else
			(progn
		(dbg 'unify "predicate modifiers ~s and ~s cannot be unified (type-shifters have unequal #s of serial args)~%" schema story)
			(return-from outer nil)
			)
		)
		; else
		(progn
		(dbg 'unify "predicate modifiers ~s and ~s cannot be unified (type-shifters don't match)~%" schema story)
		(return-from outer nil)
		)
	)

)
)
)

; can-unify-episodes reports whether a schema episode variable, e.g.
; ?E1, can be unified with a story episode constant, e.g. E1.SK.
; It checks by finding the characterizing formulas for the story
; and schema episodes and attempting to unify them with a list of
; pre-existing bindings. If they can be unified, the new bindings
; are returned; if they can't, nil is returned.
(ldefun can-unify-episodes (schema-ep story-ep schema story bindings)
(let (cur-bindings)
(block outer

	(setf schema-form nil)
	(setf story-form nil)
	(setf cur-bindings bindings)

		(dbg 'unify "var is ~s~%" schema-ep)
		(setf schema-form (get-schema-ep-var-char schema schema-ep))
		(dbg 'unify "	and schema formula ~s characterizes it~%" schema-form)

		(dbg 'unify "story ep is ~s~%" story-ep)
		(loop for phi in story do (block story-loop
			; (dbg 'unify "phi is ~s~%" phi)
			(if (and (canon-charstar? phi) (equal (third phi) story-ep))
				; then
				(progn
					(setf story-form (car phi))
					(dbg 'unify "	and story formula ~s characterizes it~%" (car phi))
				)
			)
		))

		; Don't bind an unspecified episode from the story to one in the schema.
		; We need evidence that they can unify.
		(if (and (not (null schema-form)) (null story-form))
			(return-from outer nil)
		)

		(if (and (not (null schema-form)) (not (null story-form)))
			; then
			(progn
			(dbg 'unify "	can they unify?~%")
			(setf new-bindings (unify schema-form story-form cur-bindings schema story))
			(if (not (null new-bindings))
				; then
				(progn
				(dbg 'unify "		YES!~%")
				(setf cur-bindings new-bindings)
				)
				; else
				(progn
				(dbg 'unify "		no :(~%")
				(return-from outer nil)
				)
			)
			)
		)

	(return-from outer cur-bindings)
)
)
)

(ldefun unchecked-unify-individuals (schema story old-bindings whole-schema whole-story)
	;(check (canon-individual? schema))
	;(check (canon-individual? story))
(let ((bindings (ht-copy old-bindings)))
(block outer
	; These things have no variables to bind, so they must
	; be equal.
	(if (and (not (has-element-pred story 'varp)) (not (has-element-pred schema 'varp)))
		; then
		(progn
		; (format t "unifying ~s and ~s~%" schema story)
		(if (equal schema story)
			; then (we can continue w/ no bindings)
			(return-from outer bindings)
			; else (we can't unify at all)
			(return-from outer nil)
		)
		)
	)

	; If the two individuals are episodes, we have to unify the
	; characterizing formulas as well.
	(if (and (varp schema) (schema-ep-var? whole-schema schema) (canon-small-individual? story))
		; then
		(progn
		(dbg 'unify "unifying eps ~s and ~s~%" schema story)
		; (format t "gotta unify eps ~s and ~s~%" schema story)
		(setf bindings (can-unify-episodes schema story whole-schema whole-story bindings))
		(if (null bindings)
			; then
			(progn
			(dbg 'unify "individuals ~s and ~s cannot be unified~%" schema story)
			(return-from outer nil)
			)
		)
		)
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
				(block sub
					; (if (varp story)
						; (format t "bound schema var ~s to story var ~s~%" schema story))
					(return-from outer bindings)
				)
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
	; pronouns, names, p-args, reified propositions, and arbitrary
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
			(return-from outer (unify-preds (second schema) (second story) bindings whole-schema whole-story))
		)
		((and (equal 'KA (car schema)) (equal 'KA (car story)))
			; KA
			(return-from outer (unify-preds (second schema) (second story) bindings whole-schema whole-story))
		)
		((and (equal 'KE (car schema)) (equal 'KE (car story)))
			; KE
			(return-from outer (unify-props (second schema) (second story) bindings whole-schema whole-story))
		)
		((and (equal 'THAT (car schema)) (equal 'THAT (car story)))
			; THAT 
			(return-from outer (unify-props (second schema) (second story) bindings whole-schema whole-story))
		)
		((and (lex-p-arg? (car schema)) (lex-p-arg? (car story)))
			; P-ARG 
			(return-from outer (unify-individuals (second schema) (second story) bindings whole-schema whole-story))
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

(ldefun unify-individuals (schema story old-bindings whole-schema whole-story)
(block outer
	(setf res (unchecked-unify-individuals schema story old-bindings whole-schema whole-story))

	(if (null res)
		(return-from outer res)
	)

	; Apply the new bindings to the schema and check
	; the constraints; if they're invalid, we can't
	; do this binding.
	(if (and *UNIFY-SHOULD-CHECK-CONSTRAINTS* (schema? whole-schema))
		(progn
			(setf bound-schema (apply-bindings whole-schema res))
			(setf post-bind-score (check-constraints bound-schema (list whole-story)))
			(if (null post-bind-score)
				(progn
					; (format t "abandoning binding; unifying ~s and ~s breaks constraints of ~s~%" schema story (second whole-schema))
					(return-from outer nil)
				)
			)
		)
	)

	(return-from outer res)
)
)

(ldefun unify-mod-lists (schema-mods story-mods old-bindings whole-schema whole-story)
	(second (expl-unify-mod-lists schema-mods story-mods old-bindings whole-schema whole-story))
)

(ldefun expl-unify-mod-lists (schema-mods story-mods old-bindings whole-schema whole-story)
(let (
	(bindings (ht-copy old-bindings))
	(bound (list))

	(unified-mods 0)

	tmp-bindings

)
(block outer
	(dbg 'unify "got schema mod list ~s~%" schema-mods)
	(dbg 'unify "got story mod list ~s~%" story-mods)

	;(if (< (length story-mods) (length schema-mods))
		; then
	;	(progn
	;	(dbg 'unify "modifier lists cannot be unified (not enough predicate modifiers in the latter)~%")
	;	(return-from outer (list nil bindings))
	;	)
	;)

	(if (not (equal
		(null (member 'NOT schema-mods :test #'equal))
		(null (member 'NOT story-mods :test #'equal))))
		; then
		(progn
		(dbg 'unify "modifier lists cannot be unified (different polarities)~%")
		(return-from outer (list nil nil)) ; this one should actually return a null hash map,
										   ; to cause a failure. the others don't because this
										   ; failure is usually OK (but should lower score)
		)
	)

	; We will actually let these unify, for now,
	; and solve any problems in a more nuanced
	; way as they present themselves.
	(if nil
		(if (not (equal
			(has-element-pred schema-mods 'lex-modal?)
			(has-element-pred story-mods 'lex-modal?)))
			
			; then
			(progn
			(dbg 'unify "modifier lists cannot be unified (different modal environments)~%")
			(return-from outer (list nil nil)) ; this one should actually return a null hash map,
											   ; to cause a failure. the others don't because this
											   ; failure is usually OK (but should lower score)
			)
		)
	)

	(setf tmp-bindings (ht-copy bindings))
	(loop for schema-mod in schema-mods do (block umods-outer
		(loop for story-mod in story-mods do (block umods-inner
			(setf tmp-bindings2 (unify-mods schema-mod story-mod tmp-bindings whole-schema whole-story))
			; If we find a unification, move on to the next
			; schema predicate modifier.
			(if (not (null tmp-bindings2))
				; then
				(progn
				;(format t "comparing mods ~s and ~s~%" schema-mod story-mod)
				;(format t "bound!~%")
				(setf bound (append bound (list story-mod)))
				(setf unified-mods (+ 1 unified-mods))
				(setf tmp-bindings tmp-bindings2)
				(return-from umods-outer)
				)
			)
		))
	))

	;(if (< unified-mods (length schema-mods))
		; then
	;	(progn
	;	(dbg 'unify "modifier lists cannot be unified (not all predicate modifiers in the former can be unified to any in the latter)~%")
	;	(return-from outer (list nil bindings))
	;	)
	;)

	(setf bindings tmp-bindings)
	(return-from outer (list bound bindings))
)
)
)


(ldefun unify-preds (schema story old-bindings whole-schema whole-story)
	;(check (canon-pred? schema))
	;(check (canon-pred? story))
(let (

(bindings (ht-copy old-bindings))

tmp-bindings
unified-mods
story-pred
schema-pred
story-mods
story-args
schema-mods
schema-args
mod-bound
mod-bindings
bind-ka
bind-pred

)
(block outer
	(setf schema-pred (pred-base (pred-without-post-args schema)))
	(setf schema-mods (pred-mods schema))
	(setf schema-args (pred-args schema))
	(setf story-pred (pred-base (pred-without-post-args story)))
	(setf story-mods (pred-mods story))
	(setf story-args (pred-args story))
	; (format t "uni-preds starting off with bindings ~s~%" (ht-to-str bindings))

	; First off: if the schema is do.v ?a, we'll try to bind ?a to a kind
	; of action of the story pred. But first, we'll need to unify any do.v
	; modifiers with modifiers in the story pred.
	(dbg 'unify "schema is ~s~%" schema)
	(dbg 'unify "schema args are ~s~%" schema-args)
	(if (and
			(equal schema-pred 'DO.V)
			(and (lex-verb? story-pred) (not (lex-modal? story-pred)))
			(equal 1 (length schema-args))
			(varp (car schema-args))
		)
		; then
		(block bind-do-ka
			(dbg 'unify "schema pred is ~s and story pred is ~s~%" schema story)
			(dbg 'unify "schema mods are ~s and story mods are ~s~%" schema-mods story-mods)
			(dbg 'unify "1 binding story pred ~s~%" story-pred)
			(setf mod-bindings (expl-unify-mod-lists schema-mods story-mods bindings whole-schema whole-story))
			; (format t "~d mod bindings~%" (length mod-bindings))
			(setf mod-bound (car mod-bindings))
			(setf mod-bindings (second mod-bindings))
			(if (null mod-bindings)
				(return-from outer nil)
			)
			; (format t "working with mod bindings ~s~%" mod-bindings)

			; For now, we'll allow the modifiers to not be matched.
			(if (ht-empty? mod-bindings)
				(setf mod-bindings bindings)
			)

			;(if (ht-empty? mod-bindings)
			;	; then
			;	(progn
			;	(dbg 'unify "predicates ~s and ~s cannot be unified (not all predicate modifiers in the former can be unified to any in the latter)~%" schema story)
			;	(return-from outer nil)
			;	)
			;)
			(setf bind-pred (apply-mods (set-difference story-mods mod-bound :test #'equal) story-pred))
			(dbg 'unify "2 binding story pred ~s~%" story-pred)
			(dbg 'unify "bind-pred is ~s~%" bind-pred)
			(dbg 'unify "bound is ~s~%" mod-bound)
			(dbg 'unify "bindings is ~s~%" (ht-to-str mod-bindings))
			(setf bind-ka (list 'KA (unwrap-singletons (append (list bind-pred) story-args))))

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
			; (dbg 'unify "bound ~s to ~s~%" (car schema-args) (gethash (car schema-args) mod-bindings))
			; (format t "bound ~s to ~s~%" (car schema-args) (gethash (car schema-args) mod-bindings))
			; (format t "schema args are ~s~%" schema-args)
			; (format t "mod bindings are ~s~%" (ht-to-str mod-bindings))
			(return-from outer mod-bindings)
		)
	)

	; If the two preds are prepositions, just unify the individuals
	; inside.
	(if (and (mp schema-pred (list 'lex-p? 'canon-individual?))
			(mp story-pred (list 'lex-p? 'canon-individual?)))
		; then
		(block uniprep
			(if (not (equal (car schema-pred) (car story-pred)))
				; then
				(progn
				(dbg 'unify "predicates ~s and ~s cannot be unified (unequal prepositions)~%" schema-pred story-pred)
				(return-from outer nil)
				)
			)

			(setf bindings (unify-individuals (second schema-pred) (second story-pred) bindings whole-schema whole-story))
			(if (null bindings)
				; then
				(progn
				(dbg 'unify "predicates ~s and ~s cannot be unified (could not unify prepositional complement individuals)~%" schema-pred story-pred)
				(return-from outer nil)
				)
			)

			; Success!
			(return-from outer bindings)
		)
	)

	; Otherwise, we've got two normal preds with normal arg/mod 
	; lists. First, unify the two "head" predicates, which will
	; be lexical (for now?).


	;(if (not (equal schema-pred story-pred))
	(if (not (subsumes schema-pred story-pred))
		; then
		(if (not (subsumes story-pred schema-pred))
			; then
			(if (not (common-ancestor story-pred schema-pred))
				; then
				(progn
				(dbg 'unify "predicates ~s and ~s cannot be unified~%" schema-pred story-pred)
				(return-from outer nil)
				)
				; else
				(dbg 'match "unified schema ~s with unequal story ~s~%" schema-pred story-pred)
			)
		)
		; else
		(if (and
				nil ; NOTE: disabled for now to move this functionality
				; info norm-match, where more specific header matches
				; take priority & nest the general step
				(not (equal schema-pred story-pred))
				(lex-metapred? schema-pred)
			)
			; then
			(progn
			; (format t "unequal subsumption in ~s and ~s~%" schema-pred story-pred)
			; TODO: make this only happen for the specific
			; metapred, not all across the schema when binding
			(setf (gethash schema-pred bindings) story-pred)
			)
		)
	)

	; (format t "subsumption score between ~s and ~s is ~s~%" schema-pred story-pred (subsumption-score schema-pred story-pred))

	; Next, unify all the args in order, then find some matching
	; modifier in the story pred for each one in the schema
	; pred.

	; Verify argument lists are parallel.
	; ...actually, maybe it's OK if they aren't!
	(if nil
		(if (not (equal (length schema-args) (length story-args)))
			; then
			(progn
			(dbg 'unify "predicates ~s and ~s cannot be unified (different #s of arguments)~%" schema story)
			)
		)
	)

	; Unify all arguments & accumulate bindings.
	(setf tmp-bindings (ht-copy bindings))
	(setf bound-schema-args (list))
	(setf bound-story-args (list))
	(loop for schema-arg in schema-args
		do (loop for story-arg in story-args
			do (block uargs
				(if (or
					(member schema-arg bound-schema-args :test #'equal)
					(member story-arg bound-story-args :test #'equal))
					; then
					(return-from uargs)
				)

				(setf tmp-bindings2 (unify-individuals schema-arg story-arg tmp-bindings whole-schema whole-story))
				(if (null tmp-bindings2)
					; then
					(progn
					;(dbg 'unify "predicates ~s and ~s cannot be unified (cannot unify arguments)~%" schema story)
					;(return-from outer nil)
					)
					; else
					(progn
					(setf bound-schema-args (append bound-schema-args (list schema-arg)))
					(setf bound-story-args (append bound-story-args (list story-arg)))
					(setf tmp-bindings tmp-bindings2)
					)
				)
			)
	))
	(if (not (null tmp-bindings))
		(setf bindings tmp-bindings)
	)


	; Unify all schema modifiers with some modifiers from the
	; story predicate & accumulate bindings.
	(setf tmp-bindings (unify-mod-lists schema-mods story-mods bindings whole-schema whole-story))
	(if (null tmp-bindings)
		(progn
		(dbg 'unify "predicates ~s and ~s cannot be unified (cannot unify all modifiers in the former with any in the latter)~%" schema story)
		(return-from outer nil)
		)
	)
	(setf bindings tmp-bindings)

	(return-from outer bindings)
)
)
)
