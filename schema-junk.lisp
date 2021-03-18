; A file of junk code that's never really called, but might be useful to look through.


; TODO: safe multi-level expansion. How to prevent loops? Just stop at duplicates, maybe?
(ldefun expand-nested-schemas (parent-schema story)
(block outer
	(setf invoked-schemas (list))

	(loop for st in (section-formulas (get-section parent-schema ':Steps))
		do (block get-invokers
			(if (not (invokes-schema? (second st)))
				; then
				(progn
				; (format t "~s doesn't invoke~%" (second st))
				(return-from get-invokers)
				)
			)

			(setf invoked-pair (expand-nested-schema st parent-schema))
			(setf invoked-schema (apply-bindings (car invoked-pair) (second invoked-pair)))
			; (format t "invoked ~s~%" (prop-pred (second st)))
			; (print-schema invoked-schema)
			(setf except-parent-vars (loop for k being the hash-keys of (second invoked-pair) if (varp (gethash k (second invoked-pair))) collect (gethash k (second invoked-pair))))
			; (format t "rename shared vars except ~s~%" except-parent-vars)

			(setf invoked-schema (second (uniquify-shared-vars-except parent-schema invoked-schema except-parent-vars)))

			(setf invoked-schemas (append invoked-schemas (list (list (car st) invoked-schema))))

			(format t "; invoked ~s~%" invoked-schema)

			;(setf invoked-schema (eval (prop-pred (second st))))
			;(setf invoked-schema (second (uniquify-shared-vars parent-schema invoked-schema)))

			;(setf header-bindings (third (unify-with-schema (list (second st) '** (car st)) invoked-schema nil)))
			;(setf invoked-schema-bound (apply-bindings invoked-schema header-bindings))


			;(setf invoked-schemas (append invoked-schemas (list (list (car st) invoked-schema-bound))))
		)
	)

	(format t "; parent: ~s~%" parent-schema)

	; Give each invoked schema a unique variable name, except for any variables shared
	; with the parent schema; the initial pairwise uniquification above between each
	; subschema and the parent will have already ensured that any new shared variables
	; with the parent were the result of a unification, and thus truly cross the scope.
	(setf invoked-schemas (uniquify-shared-vars-chain invoked-schemas parent-schema))

	; (return-from outer invoked-schemas)

	 ; (format t "invoked subordinate schemas are:~%")
	 ; (loop for is in invoked-schemas
		; do (print-schema (second is))
	; )

	(setf all-schemas (append (list parent-schema) (mapcar #'second invoked-schemas)))

	(setf sorted-ep-ids (topsort-fluents all-schemas))

	(setf sorted-eps
		(loop for ep-id in sorted-ep-ids
			collect (get-char-form ep-id all-schemas)))



	(setf all-role-consts
		(remove-duplicates (loop for schema in all-schemas
			append (loop for form in (section-formulas (get-section schema ':Roles))
				collect (second form)
			)
		) :test #'equal)
	)

	;(setf all-role-vars (loop for rc in all-role-consts collect (car form)))
	;(setf all-role-consts (append all-role-consts
	;	(loop for wff in (linearize-story story)
	;		if (and
	;				(member (car wff) all-role-vars :test #'equal)
	;				(not (canon-charstar? wff))
	;				(equal 1 (length (prop-all-args wff)))
	;			)
	;			collect wff)))


	(setf all-role-consts
		(sort all-role-consts
			(lambda (a b)
				(< (rechash (car a)) (rechash (car b)))
			)
		))


	; (format t "sorted eps: ~s~%" sorted-eps)
	; (format t "all role consts: ~s~%" all-role-consts)

	(setf all-vars (get-elements-pred all-role-consts 'varp))
	(setf var-renames (make-hash-table :test #'equal))
	(loop for v in all-vars
		do (block rename
			(setf const-types (loop for const in all-role-consts if (and (symbolp (second const)) (equal (car const) v)) collect (second const)))
			; (format t "types for ~s: ~s~%" v const-types)
			(setf chosen-type (car const-types))
			(setf new-name (intern (car (split-str (string (new-skolem! (intern (car (split-str (string chosen-type) "."))))) "."))))
			; (setf new-name (intern (concat-strs (car (split-str (string chosen-type) ".")) ".SK")))
			; (format t "new name is ~s~%" new-name)
			(if (has-element sorted-eps v)
				; then
				(progn
					(setf (gethash v var-renames) new-name)
					; (setf sorted-eps (replace-vals v new-name sorted-eps))
					; (setf all-role-consts (replace-vals v new-name sorted-eps))
				)
			)
		)
	)
	(loop for v being the hash-keys of var-renames
		do (progn
			(setf new-name (gethash v var-renames))
			(setf sorted-eps (replace-vals v new-name sorted-eps))
			(setf all-role-consts (replace-vals v new-name all-role-consts))
		)
	)

	(format t "predicted entity types:~%")
	(loop for role-const in all-role-consts
		if (and
				(or
					(not (has-element-pred role-const 'varp))
					; (has-element sorted-eps (car role-const))
					(loop for p in (get-elements-pred role-const 'varp)
						always (has-element sorted-eps p))
				)
				; (not (member role-const (linearize-story story) :test #'equal))
			)
			do (format t "	~s~%" (el-to-english role-const))
	)

	(format t "I predict these steps in the story (in order):~%")
	(loop for ep in sorted-eps
			for ep-id in sorted-ep-ids
		do (format t "	~a ~a~%" (if (not (varp ep-id)) "(known from story) " "(schema prediction)") (el-to-english ep))
	)
)
)
