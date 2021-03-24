; schema-expansion.lisp contains functions for the
; semantic expansion of schema headers nested as
; steps within other schemas, and for the "flattening"
; of nested schema hierarchies.

(load "ll-load.lisp")

(ll-load "schema-match.lisp")

; Given a schema header (invoker) nested in a parent schema,
; retrieve the invoked schema, unify the header arguments
; with the invoked schema header's variables, and apply
; additional subordinate variable bindings from the parent
; schema.
(ldefun expand-nested-schema (invoker parent-schema)
(block outer
	; (setf invoked-schema (eval (prop-pred (second invoker))))
	(setf invoked-schema (invoked-schema (second invoker) t))

	; (format t "trying to unify ~s with ~s~%" (list (second invoker) '** (car invoker)) invoked-schema)
	(setf old-uscc *UNIFY-SHOULD-CHECK-CONSTRAINTS*)
	(setf *UNIFY-SHOULD-CHECK-CONSTRAINTS* nil)
	(setf header-bindings (third (unify-with-schema (list (second invoker) '** (car invoker)) invoked-schema nil)))
	(setf *UNIFY-SHOULD-CHECK-CONSTRAINTS* old-uscc)
	; NOTE: the following "WEIRD BUG" can happen because wordnet, especially without
	; sense numbers, gives weird invoke relations for words that fit different schemas
	; w/ different argument structures.
	; (if (null header-bindings)
		; (format t "WEIRD BUG: invoker ~s can't unify with header ~s~%" invoker (second parent-schema))
	; )
	(if (null header-bindings)
		(return-from outer nil)
	)
	; (setf identical-header-vars (shared-vars (list (second invoker) '** (car invoker)) (second invoked-schema)))
	; (loop for id in identical-header-vars
		; do (setf (gethash id header-bindings) id)
	; )

	(loop for sc in (section-formulas (get-section parent-schema ':Subordinate-constraints))
			do (format t "got sc ~s~%" sc)
			if (equal (car invoker) (second (car (second sc))))
				do (block apply-subord
					(setf key (remove-ext (car (car (second sc))) "<-"))
					(setf val (third (second sc)))
					; (setf (gethash key header-bindings) val)
					(if (not (bind-if-unbound key val header-bindings))
						; then
						(progn
						; (format t "WEIRD EXPANSION BUG: subordinate constraint ~s can't bind over existing bound value ~s~%" sc (gethash key header-bindings))
						; (format t "invoker is ~s~%" invoker)
						; (print-schema parent-schema)
						; We're going to just cause an error here and make
						; the whole story fail, because I don't want to fix
						; this right now and it also makes the story take
						; forever for some reason.
						; TODO: fix it.
						(error "Weird subordinate constraint expansion bug (see TODO)")
						(return-from outer nil)
						)
						; else
						(format t "bound key ~s to val ~s~%" key val)
					)
				)
	)

	; (setf invoked-schema-bound (apply-bindings invoked-schema header-bindings))

	(return-from outer (list invoked-schema header-bindings))
)
)

; Convert a schema, along with the tree of nested
; schemas it may root, into a flat list of EL
; formulas, with fluent steps characterizing their
; relevant episode IDs.
(ldefun flatten-schema-unsorted (schema &optional only-roles-and-steps)
(let (
		(fluent-secs
			(if only-roles-and-steps
				; then
				(list (get-section schema ':Steps))
				; else
				(fluent-sections schema)))
		(nonfluent-secs
			(if only-roles-and-steps
				; then
				(list (get-section schema ':Roles))
				; else
				(nonfluent-sections schema))))
	(append
		; Collect nonfluent formulas as they are
		(loop for sec in nonfluent-secs
			append (loop for form in (section-formulas sec)
				collect (second form)))

		; Collect fluent formulas as characterizations
		(loop for sec in fluent-secs
			append (loop for form in (section-formulas sec)
				; Take the formula no matter what...
				collect (list (second form) '** (car form))
				
				; ...but if it's a schema header, expand
				; and flatten that schema recursively...
				if (invokes-schema? (second form) t)
					append
						(let ((exp-pair (expand-nested-schema form schema)))
							(progn
							(if (null (car exp-pair))
								(progn
									(format t "why the HECK didn't invoked schema ~s bind to ~s~%" (invoked-schema (second form) t) form)
									(dbg-tag 'unify)
									(expand-nested-schema form schema)
								)
							)

							(flatten-schema
								(apply-bindings (car exp-pair) (second exp-pair))
								only-roles-and-steps)
							)
						)
			)
		)
	)
))

(ldefun flatten-schema-unreduced (schema &optional only-roles-and-steps)
	(sort
		(copy-list (dedupe
			(flatten-schema-unsorted schema only-roles-and-steps)))
		(lambda (x y)
			(and
				(not (equal (canon-charstar? x) (canon-charstar? y)))
				(canon-charstar? y))))
)

(ldefun flatten-schema (schema &optional only-roles-and-steps)
(block outer
	(setf unreduced-list (flatten-schema-unreduced schema only-roles-and-steps))

	; imperative enough for ya? ;)
	(setf simple-rcs (list))
	(setf other-formulas (list))
	(loop for form in unreduced-list
		if (and (not (canon-charstar? form)) (equal (length form) 2))
			do (setf simple-rcs (append simple-rcs (list form)))
		else
			do (setf other-formulas (append other-formulas (list form))))

	(return-from outer
		(dedupe (append (remove-subsuming-rcs-list simple-rcs) other-formulas)))
)
)
