(load "ll-load.lisp")

(ll-load "ll-util.lisp")
(ll-load "schema-el.lisp")
(ll-load "schema-util.lisp")
(ll-load "schema-subsumption.lisp")

(defparameter *SCHEMA-POSTPROC-RULES* '(
	process-adverbs-of-place
))

(ldefun postprocess-schema (schema)
(block outer
	(setf old-schema nil)
	(setf new-schema (copy-item schema))
	(loop while (not (equal new-schema old-schema))
		do (block apply-rules
			(loop for rule in *SCHEMA-POSTPROC-RULES*
				do (block apply-rule
					(setf old-schema new-schema)
					(setf new-schema (funcall rule new-schema))
					(if (not (equal old-schema new-schema))
						(dbg 'schema-postproc "rule ~s changed schema to ~s~%" rule new-schema))
				)
			)
		)
	)

	(return-from outer new-schema)
)
)

(ldefun process-adverbs-of-place (schema)
(block outer
	(if (not (schema? schema))
		(return-from outer schema))

	(setf headers (append (list (car (schema-header schema)))
		(mapcar #'second (section-formulas (get-section
			schema ':Paraphrases)))))
	
	(setf place-mods (list))
	(loop for header in headers do (block check-header
		(setf mods (prop-mods header))
		(setf place-mods (append place-mods (loop for m in mods
			if (and (lex-adv? m)
					(subsumes 'LOCATION.N
						(retag-as m 'N)))
				; then
				collect m)))
	))
	(setf place-mods (dedupe place-mods))

	(if (null place-mods)
		(return-from outer schema))

	(setf place-mod-nouns (mapcar (lambda (x) (retag-as x 'N)) place-mods))

	; We'll only take one for now.
	(setf place-mod (car place-mods))
	(setf place-mod-noun (car place-mod-nouns))
	(dbg 'bug-warning "got multiple place mods: ~s~%" place-mods)

	;(loop for place-mod-noun in place-mod-nouns do (block add
		;(setf new-schema (copy-item schema))
		;(setf new-schema (add-role-constraint new-schema
			;(list (next-safe-cursor new-schema) place-mod-noun)))
	;))

	(setf new-schema (copy-item schema))

	(setf new-cursor (next-safe-cursor new-schema))

	(setf dest nil)
	(setf new-adv nil)
	(loop for rc in (section-formulas (get-section new-schema ':Roles))
		if (equal (second (second rc)) 'DESTINATION.N)
			do (setf dest (car (second rc))))
	(if (null dest)
		; then
		; (setf new-adv (list 'at.p place-mod-noun))
		(progn
			; Add a slot for the place and make a new
			; modifier for it.
			(setf new-schema (add-role-constraint new-schema
				(list new-cursor place-mod-noun)))
			(setf new-schema (replace-vals place-mod
				(list 'adv-a (list 'at.p new-cursor)) new-schema))
		)
		; else
		(progn
			; We have a dest slot, so we'll just add this
			; new noun constraint to it and remove the modifier.
			(setf new-schema (add-role-constraint new-schema
				(list dest place-mod-noun)))
			; Find all the preds with the place mod in them
			; and remove it.
			(setf modded-preds (get-elements-pred new-schema (lambda (x) (and (listp x) (canon-pred? x) (has-element x place-mod)))))
			(loop for mp in modded-preds
				do (setf new-schema (replace-vals mp
					(unwrap-singletons
						(mapcar #'unwrap-singletons (rec-remove mp place-mod)))
					new-schema))
			)
		)
	)

	(register-schema new-schema)

	(return-from outer new-schema)
)
)
