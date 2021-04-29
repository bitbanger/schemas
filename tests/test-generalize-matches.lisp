(declaim (sb-ext:muffle-conditions cl:warning))

(load "apr-27-schemas.lisp")
(load "../ll-load.lisp")

(ll-load-superdir "protoschemas.lisp")
(ll-load-superdir "schema-el.lisp")
(ll-load-superdir "schema-util.lisp")
(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "schema-el-parser.lisp")
(ll-load-superdir "el-to-ulf.lisp")
(ll-load-superdir "schema-expansion.lisp")

(defparameter *NEST-SPEC-SUBSUMPTIONS* nil)
(defparameter *NEST-BASIC-SUBSUMPTIONS* nil)

(loop for protoschema in *PROTOSCHEMAS*
	do (register-schema (eval protoschema)))

; Correct the learned schemas, now, to fix duplicate
; names:
;	1. Do a pass to find the duped names
;	2. Find one new unique number for each
;		duplicate of each pred
;	3. For each definition of each duped
;		name, rename it with the unique
;		number, and replace its name in
;		all schemas up until, and including,
;		the next composite.
; TODO: figure out why there are duplicate names?
; 1
(setf all-names (loop for sch in *LEARNED-SCHEMAS*
		collect (prop-pred (car (schema-header (car sch))))))
(setf duped-names (dupes all-names))
(setf duped-names-no-nums
	(dedupe (loop for name in duped-names
		collect (get-schema-match-name name))))
; 2
(setf max-numbers (make-hash-table :test #'equal))
(loop for name in (dedupe all-names) do (block mn
	(setf match-name (get-schema-match-name name))
	(if (not (contains duped-names-no-nums match-name))
		(return-from mn))
	(setf match-num (get-schema-match-num name))

	(if (null (gethash match-name max-numbers))
		; then
		(setf (gethash match-name max-numbers) match-num)
		; else
		(if (> match-num (gethash match-name max-numbers))
			(setf (gethash match-name max-numbers) match-num))
	)
))
; 3
(setf replace-pairs nil)
(setf new-learned-schemas nil)
(loop for sch in *LEARNED-SCHEMAS* do (block repl
	(setf sch-name (prop-pred (car (schema-header (car sch)))))
	(if (contains duped-names sch-name)
		; then
		(block rename
			(setf new-num (+ 1
				(gethash (get-schema-match-name sch-name)
					max-numbers)))
			(setf (gethash
				(get-schema-match-name sch-name) max-numbers)
				new-num)
			(setf new-name
				(renumber-schema-name sch-name new-num))
			(setf replace-pairs
				(append replace-pairs (list
					(list sch-name new-name))))
		)
	)

	; Now, make all replacements in this
	; entry.
	(loop for rp in replace-pairs
		do (setf sch (replace-vals
			(car rp) (second rp) sch)))
	(setf new-learned-schemas (append
		new-learned-schemas (list sch)))

	; Clear replacement pairs if we hit a composite
	; schema.
	(if (has-prefix? (string (schema-name (car sch))) "COMPOSITE")
		(setf replace-pairs nil)
	)
))

(setf *LEARNED-SCHEMAS* new-learned-schemas)





(setf proto-matches (loop for sp in *LEARNED-SCHEMAS*
						if (and (not (null (car sp))) (null (second sp))) collect (car sp)))


(setf matches-for-protos (make-hash-table :test #'equal))

(defun get-filtered-arg-rcs (arg schema)
	(filter-arg-rcs (get-arg-rcs arg schema))
)

(defun probably-lambda? (l)
(and
	(listp l)
	(equal 3 (length l))
	(equal (car l) 'L)
)
)

(ldefun get-arg-rcs (arg schema)
(block outer
	(setf res (unfiltered-get-arg-rcs arg schema))

	(setf better-res (copy-item res))
	(setf better-res (remove 'LOCATION.N better-res :test #'equal))
	(setf better-res (remove 'DESTINATION.N better-res :test #'equal))
	(setf better-res (remove 'ENTITY.N better-res :test #'equal))
	(setf better-res (remove 'INANIMATE_OBJECT.N better-res :test #'equal))
	(setf better-res (remove 'OBJECT.N better-res :test #'equal))
	(setf better-res (remove 'AGENT.N better-res :test #'equal))

	(if (> (length better-res) 0)
		(return-from outer better-res))

	(return-from outer res)
)
)

(ldefun unfiltered-get-arg-rcs (arg schema)
(block outer
	(if (mp arg (list 'lex-det? 'any?))
		(return-from outer (unfiltered-get-arg-rcs (second arg) schema)))

	(if (canon-kind? arg)
		(if (equal 'K (car arg))
			; then
			(return-from outer (unfiltered-get-arg-rcs (second arg) schema))
			; else
			(return-from outer (list arg))
		)
	)

	(if (and (probably-lambda? arg) (not (null (get-elements-pred arg 'lex-noun?))))
		(return-from outer (list (car (last (get-elements-pred arg 'lex-noun?))))))

	(if (mp arg (list 'lex-det? 'lex-noun?))
		; then
		(return-from outer (list (second arg)))
		; else
		(return-from outer (let ((result (loop for rc in
		(section-formulas (get-section schema ':Roles))
		if (equal (car (second rc)) arg)
			collect (unwrap-singletons (cdr (second rc))))))
		; post-let
		(progn
		; (if (null result) (format t "couldn't find RC for ~s in ~s~%" arg (loop for rc in (section-formulas (get-section schema ':Roles)) collect (car (second rc)))))
		; (if (null result) nil result)
		(if (null result) (list arg) result))))
	)
)
)

(defun get-args-rcs (args schema)
	(loop for arg in args
		collect (get-arg-rcs arg schema))
)

(ldefun run-proto-match-collector ()
	(block outer

	(loop for pm in proto-matches
				do (block print-inv

		; (format t "schema match:~%")
		; (print-schema pm)
		; (format t "match name ~s~%" (get-schema-match-name (schema-name pm)))
		(setf match-name (get-schema-match-name (schema-name pm)))

		(setf proto-parent (schema-name (invoked-schema (car (schema-header pm)))))

		; No parent for this schema was known; it's its own root.
		(if (null proto-parent)
			(return-from print-inv))

		(setf (gethash proto-parent matches-for-protos)
				(append (gethash proto-parent matches-for-protos) (list pm)))

	))


	(loop for parent-name being the hash-keys of matches-for-protos
		do (block print-parent-protos

			(setf all-learned-props (list))

			(setf children
				(loop for child in (gethash parent-name matches-for-protos)
					if (not (equal
								(schema-name child)
								parent-name))
						collect child))

			(setf children (remove-duplicates children
				:test (lambda (x y)
					(loop for rcs1 in (get-args-rcs (prop-all-args (car (schema-header x))) x)
						for rcs2 in (get-args-rcs (prop-all-args (car (schema-header y))) y)
							always (same-list-unordered rcs1 rcs2)
					)
				)
			))

			(if (equal 0 (length children))
				(return-from print-parent-protos))


			(setf parent (eval parent-name))

			; get args from headers
			(setf parent-args (prop-all-args (car (schema-header parent))))

			; (format t "~s~%" (car (schema-header (eval parent-name))))
			(setf parent-args-rcs (get-args-rcs parent-args parent))
			; (format t "~s~%~%" parent-name)


			(loop for parent-rcs in parent-args-rcs
					for i from 0
				do (block print-parent-args
					(setf child-rcs-to-print (list))
					(loop for child in children
						for j from 0 do (block print-child-args
							(setf child-rcs (nth i (get-args-rcs (prop-all-args (car (schema-header child))) child)))
							(setf novel-child-rcs (set-difference child-rcs parent-rcs :test #'equal))
							;(if (null novel-child-rcs)
								;(return-from print-child-args))
							(setf covering-child-rcs (intersection child-rcs parent-rcs :test #'equal))
							; (if (not (null covering-child-rcs)) (format t "	~~ ~s~%" covering-child-rcs))
							(setf child-rcs-to-print (append child-rcs-to-print (list novel-child-rcs)))
							; (format t "	~s~%" novel-child-rcs)
							; (format t "~%")
					))

					(if (equal 0 (length child-rcs-to-print))
						(return-from print-parent-args))

					; (setf child-rcs-to-print
						; (dedupe-except child-rcs-to-print (list nil)))

					; (format t "-------------------~%")
					; (format t "	~s~%" parent-rcs)

					;(loop for rcs in child-rcs-to-print
							;for k from 1
						;if (< k 10)
							; do (format t "		 ~d. " k)
						;else
							;do (format t "		~d. " k)
						;if (not (null rcs))
							;do (format t "~s~%" rcs)
						;else
							;do (format t "~~~%")
					;)

			))

					; now print all actual headers, deduped
					;(format t "~s~%" parent-name)
					(loop for child in children do (block print-child-header-with-rcs
						(setf child-prop (car (schema-header child)))

						(setf child-args-rcs (get-args-rcs (prop-all-args child-prop) child))
						(setf novel-child-args-rcs (loop for child-rcs in child-args-rcs for parent-rcs in parent-args-rcs
							collect (set-difference child-rcs parent-rcs :test #'equal)))
						(setf covering-child-args-rcs (loop for child-rcs in novel-child-args-rcs for parent-rcs in parent-args-rcs
							collect (set-difference child-rcs parent-rcs :test #'equal)))


						; only 0-arg rcs
						(setf novel-child-args-rcs
							(loop for rcs in novel-child-args-rcs
								collect (loop for rc in rcs
									if (or (not (canon-pred? rc))
											(null (pred-args rc)))
										collect rc)))

						; replace nils with originals
						(setf novel-child-args-rcs
							(loop for rcs in novel-child-args-rcs
									for orig-rcs in child-args-rcs
								if (not (null rcs))
									collect rcs
								else
									; collect '~))
									collect orig-rcs))


						(setf rc-pre-args
							(loop for pre-arg in (prop-pre-args child-prop)
								for i from 0
									collect (car (last (loop for elem in (nth i novel-child-args-rcs)
													if (lex-noun? elem)
														; collect (basic-level elem)))))
														collect elem)))))
						(setf rc-post-args
							(loop for post-arg in (prop-post-args child-prop)
								for i from (length rc-pre-args)
									; do (format t "considering arg ~s~%" (loop for elem in (nth i novel-child-args-rcs) if (lex-noun? elem) collect elem))
									collect (car (last (loop for elem in (nth i novel-child-args-rcs)
													if (lex-noun? elem)
														; collect (basic-level elem)))))
														collect elem)))))

						(setf prop-with-rc-args (render-prop
							rc-pre-args
							(prop-pred child-prop)
							rc-post-args
							nil
						))

						(setf all-learned-props (append all-learned-props (list (append rc-pre-args rc-post-args))))
						; flatten the props

						; (format t "	~s~%" prop-with-rc-args)
						; (format t "	~s~%" prop-with-rc-args)
					)
				)


			(setf learned-prop-counts (make-hash-table :test #'equal))
			(setf duped-learned-props (list))
			(loop for lp in all-learned-props
				if (null (gethash lp learned-prop-counts))
					do (setf (gethash lp learned-prop-counts) t)
				else
					do (setf duped-learned-props (dedupe (append duped-learned-props (list lp))))
			)


			; (format t "~s~%" duped-learned-props)
			;(format t "-------------------")
			;(format t "-------------------")
			;(format t "-------------------")
			;(format t "-------------------~%")
			;(format t "~%~%")


		)
	))

)


(ldefun filter-arg-rcs (rcs)
	(dedupe (let ((res (loop for rc in rcs
		if (lex-noun? rc)
			collect rc
		if (and (plur? rc) (lex-noun? (second rc)))
			collect (second rc)
		if (canon-kind? rc)
			collect rc
	))) (if (null res) rcs res)))
)

(ldefun basic-step (st comp basic-map rcs steps &optional orig-child-name)
(block outer
	(setf step-vars (dedupe (get-elements-pred steps #'varp)))
	; (format t "step vars: ~s~%" step-vars)

	(setf args-rcs (get-args-rcs (prop-all-args st) comp))
	;(setf args-rcs (loop for arg-rcs in args-rcs
		;collect (loop for rc in arg-rcs
		;if (or (not (canon-pred? rc)) (null (pred-args rc)))
			;collect rc)))

	(setf rc-pre-args
		(loop for pre-arg in (prop-pre-args st)
			for i from 0
				collect (car (loop for elem in (nth i args-rcs)
								if (lex-noun? elem)
									; collect (basic-level elem)))))
									collect (if (null elem) post-arg elem)
								if (and (plur? elem) (lex-noun? (second elem)))
										collect (if (null (second elem)) post-arg (second elem))
		))))
	(setf rc-pre-args
		(loop for pre-arg in (prop-pre-args st)
				for collected in rc-pre-args
					if (null collected) collect pre-arg
					else collect collected))

	(setf rc-post-args
		(loop for post-arg in (prop-post-args st)
			for i from (length rc-pre-args)
				; do (format t "considering arg ~s~%" (loop for elem in (nth i novel-child-args-rcs) if (lex-noun? elem) collect elem))
				collect (car (last (loop for elem in (nth i args-rcs)
								if (lex-noun? elem)
									; collect (basic-level elem)))))
										collect (if (null elem) post-arg elem)
								if (and (plur? elem) (lex-noun? (second elem)))
										collect (if (null (second elem)) post-arg (second elem))
							)))))
	(setf rc-post-args
		(loop for post-arg in (prop-post-args st)
				for collected in rc-post-args
					if (null collected) collect post-arg
					else collect collected))

	(setf arg-to-rc-map (make-hash-table :test #'equal))
	(loop for orig-arg in (prop-all-args st)
			for rc-arg in (append rc-pre-args rc-post-args)
				do (setf (gethash orig-arg arg-to-rc-map) orig-arg))

	; (setf rc-mods (list (car (prop-mods st))))
	(setf rc-mods (prop-mods st))
	(setf mod-vars (dedupe (get-elements-pred rc-mods #'varp)))
	(setf mod-var-rcs (get-args-rcs mod-vars comp))
	(loop for mod-var in mod-vars
			for mod-var-rcs in mod-var-rcs
			do (block annotate-mod-args
				(setf mod-rcs (car (last (loop for elem in mod-var-rcs
					if (lex-noun? elem)
						collect elem
					if (and (plur? elem) (lex-noun? (second elem)))
						collect (second elem)))))

				(if (not (null mod-rcs))
					(setf rc-mods (replace-vals mod-var mod-rcs rc-mods)))
			)
	)

	(if (equal rc-mods (list nil))
		(setf rc-mods nil))
	; (loop for orig-arg in (prop-all-args st)
			; for rc-arg in (append rc-pre-args rc-post-args)
	(loop for orig-var in step-vars
				; do (setf rc-mods (replace-vals orig-arg rc-arg rc-mods))
				; do (format t "replacing ~s with ~s in mods~%" orig-var (get-filtered-arg-rcs orig-var comp))
				do (setf rc-mods (replace-vals orig-var (get-filtered-arg-rcs orig-var comp) rc-mods))
	)

	;(setf prop-with-rc-args (render-prop
		;rc-pre-args
		;(prop-pred st)
		;rc-post-args
		;rc-mods
	;))
	
	(setf prop-with-rc-args (append
		rc-pre-args
		(listify-nonlists (stack-nest (prop-pred st) rc-mods))
		rc-post-args))

	; If any vars are left, replace them with ENTITY.N
	(setf remaining-vars (dedupe (get-elements-pred prop-with-rc-args #'varp)))
	(loop for var in remaining-vars
		do (setf prop-with-rc-args (replace-vals
			var 'ENTITY.N prop-with-rc-args)))

	(setf flat-prop prop-with-rc-args)

	(if nil (block ifnil
	(setf flat-prop-no-mods prop-with-rc-args)
	(if (canon-prop? prop-with-rc-args) (progn
		(setf flat-prop
		(if (not (null (prop-mods prop-with-rc-args)))
			(append (prop-pre-args prop-with-rc-args) (list (prop-mods prop-with-rc-args) (prop-pred prop-with-rc-args)) (prop-post-args prop-with-rc-args))
		; else
			(append (prop-pre-args prop-with-rc-args) (list (prop-pred prop-with-rc-args)) (prop-post-args prop-with-rc-args))
		)
		)
		(setf flat-prop-no-mods
			(append (prop-pre-args prop-with-rc-args) (list (get-schema-match-name (pred-base (prop-pred prop-with-rc-args)))) (prop-post-args prop-with-rc-args))
		)
	))
	; also it may not (probably won't) be a canon-prop,
	; so we'll do this too
	; (format t "turning ~s into " flat-prop-no-mods)
	(setf flat-prop-no-mods (append (list (car flat-prop-no-mods)) (loop for elem in (listify-nonlists (second flat-prop-no-mods))
		if (and (listp elem) (equal 2 (length elem)) (equal 1 (length (get-elements-pred elem #'lex-verb?))))
			collect (car (get-elements-pred elem #'lex-verb?))
		else
			collect elem
	) (cddr flat-prop-no-mods)))
	; (format t "~s~%" flat-prop-no-mods)

	; (setf flat-prop-no-mods (loop for e in flat-prop-no-mods append (listify-nonlists e)))
	;(setf flat-prop-no-mods (loop for e in flat-prop-no-mods
		;if (canon-kind? e)
			;append (list e)
		;else
			;append (listify-nonlists e)))
	))

	(setf flat-prop-no-mods (append rc-pre-args (listify-nonlists (prop-pred st)) rc-post-args))
	(setf remaining-vars (dedupe (get-elements-pred flat-prop-no-mods #'varp)))
	(loop for var in remaining-vars
		do (setf flat-prop-no-mods (replace-vals
			var 'ENTITY.N flat-prop-no-mods)))
	; (format t "		~s~%" flat-prop-no-mods)

	; make a basic-level gen
	(setf basic-flat-prop (copy-item flat-prop-no-mods))
	(setf index-flat-prop (copy-item basic-flat-prop))
	(loop for noun in (dedupe (get-elements-pred flat-prop-no-mods
		(lambda (x) (or (lex-noun? x) (canon-kind? x)))))
			do (block basic-ify
		(setf basic-flat-prop (replace-vals noun (basic-level noun) basic-flat-prop))
		(setf index-flat-prop (copy-item basic-flat-prop))
		(if (and (not (null orig-child-name)) (loop for e in basic-flat-prop thereis (lex-verb? e)))
			(setf index-flat-prop (replace-vals (car (loop for e in basic-flat-prop if (lex-verb? e) collect e))
										orig-child-name index-flat-prop)))
		; (format t "using index prop ~s~%" index-flat-prop)
		; (setf (gethash index-flat-prop basic-map) (append (gethash index-flat-prop basic-map) (list flat-prop)))
	))
	;(format t "adding ~s to basic map~%" index-flat-prop)
	;(format t "	for spec ~s~%" flat-prop)
	; (setf idx-pred (get-elements-pred index-flat-prop (lambda (x) (and (lex-verb? x) (not (null (get-schema-match-num x)))))))
	; (setf stripped-idx-pred (get-schema-match-name idx-pred))
	; (setf index-flat-prop (replace-vals idx-pred stripped-idx-pred index-flat-prop))
	(setf (gethash index-flat-prop basic-map) (append (gethash index-flat-prop basic-map) (list flat-prop)))

	(return-from outer index-flat-prop)


	;(format t "~s~%" flat-prop)
	;(format t "	~s~%" basic-flat-prop)
)
)

(ldefun basic-proto-header (proto basic-map &optional orig-child-name)
(block outer
	(setf rcs (mapcar #'second (section-formulas (get-section proto ':Roles))))
	(setf steps (mapcar #'second (section-formulas (get-section proto ':Steps))))

	(return-from outer (basic-step (car (schema-header proto)) proto basic-map rcs steps orig-child-name))
)
)

(ldefun basic-schema (schema)
(block outer
	(setf new-schema (copy-item schema))

	(setf rcs (mapcar #'second (section-formulas (get-section schema ':Roles))))
	(setf steps (mapcar #'second (section-formulas (get-section schema ':Steps))))

	(loop for rc in rcs do (block basic-rc
		(if (not (lex-noun? (prop-pred rc)))
			(return-from basic-rc))

		(setf new-schema (replace-vals
			rc
			(replace-vals
				(prop-pred rc)
				(basic-level (prop-pred rc))
				rc)
			new-schema))
	))


	(return-from outer new-schema)
)
)

(ldefun clean-roles (schema)
(block outer
	(setf bad-preds '(PERTAIN-TO ORIENTS IMPINGES-ON))
	(setf new-schema (copy-item schema))
	(loop for rc in
		(mapcar #'prop-pred (mapcar #'second
			(section-formulas (get-section
				schema ':Roles))))
		if (or (time-pred? rc) (contains bad-preds rc))
			do (setf new-schema (remove rc new-schema)))

	(return-from outer new-schema)
)
)

(ldefun clean-steps (schema)
(block outer
	(setf new-schema (copy-item schema))
	(loop for st in
		(mapcar #'second (section-formulas
			(get-section schema ':Steps)))
		if (>= (length (prop-mods st)) 3)
			do (setf new-schema (replace-vals
				st
				(render-prop
					(prop-pre-args st)
					(prop-pred st)
					(prop-post-args st)
					; (list (car (prop-mods st))))
					(prop-mods st))
				new-schema)))

	(return-from outer new-schema)
)
)

(ldefun schema-to-eng (schema)
(handler-case (block outer
	(setf els-for-eng (append
		; Get all role constraints (sort by first arg)
		(sort
			(mapcar #'second (section-formulas (get-section schema ':Roles)))
			(lambda (x y)
				(< (rechash (prop-pre-args x)) (rechash (prop-pre-args y)))))

		; Get all steps
		(loop for st in (section-formulas (get-section schema ':Steps))
			collect (list (second st) '** (car st))
		)
	))

	(setf els-for-eng (loop for el in els-for-eng if (canon-prop? el) collect el))
	(setf ulfs-for-eng (el-to-ulf els-for-eng))

	(format t "Schema in English (prototype): ~%")
	(loop for eng in (el-to-eng els-for-eng)
		do (format t "  ~s~%" eng)
	)
) (error ()
	(format nil "")
))
)

(ldefun analyze-composites ()
(block outer
	(loop for match in proto-matches
		do (register-schema match))

	(setf basic-map (make-hash-table :test #'equal))

	(setf comps (loop for sch in *LEARNED-SCHEMAS*
		if (has-prefix? (string (schema-name (car sch))) "COMPOSITE")
			collect (car sch)))

	(loop for comp in comps do (block print-comp
		; (print-schema comp)
		(setf rcs (mapcar #'second (section-formulas (get-section comp ':Roles))))
		;(setf steps (mapcar #'second (section-formulas (get-section comp ':Steps))))
		; (setf steps (schema-cleanup steps))
		(setf new-comp (copy-item comp))
		(setf orig-comp (copy-item new-comp))
		(setf orig-comp-steps (section-formulas (get-section new-comp ':Steps)))

		(loop for rc in rcs do (block gen-rc
			(if (not (lex-noun? (pred-base (prop-pred rc))))
				(return-from gen-rc))

			(setf noun (pred-base (prop-pred rc)))
			(if (plur? noun)
				(setf noun (second noun)))
			(setf basic-noun (basic-level noun))
			(setf new-rc (replace-vals noun basic-noun rc))
			(setf new-comp (replace-vals rc new-rc new-comp))
		))

		(setf new-comp (remove (get-section new-comp ':Episode-relations) new-comp))
		(setf new-comp (clean-roles new-comp))
		(setf new-comp (clean-steps new-comp))

		(setf comp-steps (get-section new-comp ':Steps))
		(setf new-comp (replace-vals
			comp-steps
			(remove-duplicates comp-steps :test (lambda (x y)
				(if (or (not (list-at-least-n? x 2)) (not (list-at-least-n? x 2)))
					; then
					(equal x y)
					; else
					(or
						; equal episodes, or...
						(equal (car x) (car y))
						; ...equal formulas
						(equal (second x) (second y))))))
			new-comp))

		(setf new-comp (basic-schema new-comp))

		; (print-schema new-comp)
		; (schema-to-eng new-comp)
		(setf full-steps (section-formulas (get-section new-comp ':Steps)))
		(setf steps (mapcar #'second (section-formulas (get-section new-comp ':Steps))))
		(setf flat-steps (loop for st in steps
			collect (let ((spl (prop-args-pred-mods st)))
				(append
					(car spl)
					(list (stack-nest (second spl) (fourth spl)))
					(third spl)
				)
			)))
		(setf step-vars (dedupe (get-elements-pred flat-steps #'varp)))
		(setf var-rcs (get-args-rcs step-vars new-comp))
		; (format t "~s~%" var-rcs)
		(setf var-rcs (mapcar #'unwrap-singletons
			(mapcar #'filter-arg-rcs var-rcs)))
		(loop for var in step-vars
			for rcs in var-rcs
				do (setf flat-steps (replace-vals
					var rcs flat-steps)))

		; For each nested schema step with unresolved
		; vars, expand and check for constraints on
		; those vars inside the nested schema.
		(loop for st in orig-comp-steps
			for flat-step in flat-steps do (block fix-expand-vars
			(if (null (get-schema-match-num (prop-pred (second st))))
				(return-from fix-expand-vars))

			(setf vars (dedupe (get-elements-pred (second st) #'varp)))
			(setf nested-schema-pair
				(expand-nested-schema st orig-comp))
			(if (null nested-schema-pair)
				(format t "; couldn't expand ~s~%" st))
			(return-from fix-expand-vars)
			(setf nested-schema (apply-bindings
				(car nested-schema-pair)
				(second nested-schema-pair)))
			(setf nested-schema (basic-schema nested-schema))

			(setf nested-arg-rcs (mapcar #'unwrap-singletons
				(mapcar #'filter-arg-rcs
					(get-args-rcs vars nested-schema))))

			(setf new-flat-step (copy-item flat-step))
			(loop for var in vars
				for rcs in nested-arg-rcs
					do (setf new-flat-step (replace-vals
						var rcs new-flat-step)))
			(setf flat-steps (replace-vals
				flat-step new-flat-step flat-steps))
		))


		(loop for fs in flat-steps
			do (format t "	~s~%" fs))

		;(loop for rc in rcs
			;do (format t "~s~%" rc))
		;(format t "~%")
		;(loop for st in steps
			;do (format t "~s~%" st))

		;(loop for st in steps do (block basic-step
		;))
		;(loop for st in steps do (basic-step st comp basic-map rcs steps))

		(format t "~%----------~%~%")
	))

	;(loop for basic being the hash-keys of basic-map
		;if (> (length (gethash basic basic-map)) 1)
		;do (block print-basic
			;(format t "~s~%" basic)
			;(loop for spec in (gethash basic basic-map)
				;do (format t "	~s~%" spec))
		;)
	;)
			

)
)

(ldefun strictly-subsumes (a b)
	(and (not (equal a b)) (subsumes a b))
)

(ldefun probably-mod? (m)
(or
	(and (listp m) (contains '(ADV-A ADV ADV-E ADV-S) m))
	(lex-adv? m)
)
)

(ldefun basic-subsumes (b1 b2)
(block outer
	; not a strict subsumption
	(if (equal b1 b2)
		(return-from outer nil))

	(setf b1-mods (loop for e in b1
		if (probably-mod? e) collect e))
	(setf b1-no-mods (loop for e in b1
		if (not (probably-mod? e)) collect e))

	(setf b2-mods (loop for e in b2
		if (probably-mod? e) collect e))
	(setf uniq-b2-mods (set-difference b2-mods b1-mods :test #'equal))
	(setf b2-no-mods (loop for e in b2
		if (not (probably-mod? e)) collect e))

	; b1 mods should all be present in b2
	(if (and (not (null b1-mods))
			(not (loop for m in b1-mods always (contains b2-mods m))))
		(return-from outer nil))

	; b1 is b2 with fewer mods
	(if (equal b1-no-mods b2-no-mods)
		(return-from outer t))

	; verbs don't nest
	;(if (not (subsumes (second b1-no-mods) (second b2-no-mods)))
		;(return-from outer nil))

	(if (and (equal (length b1-no-mods) (length b2-no-mods))
			(loop for elem1 in b1-no-mods for elem2 in b2-no-mods
				thereis (strictly-subsumes elem1 elem2))
			(loop for elem1 in b1-no-mods for elem2 in b2-no-mods
				always (subsumes elem1 elem2))
			(loop for elem1 in b1-no-mods for elem2 in b2-no-mods
				never (strictly-subsumes elem2 elem1)))
		(return-from outer t)
	)

	(return-from outer nil)
)
)

(ldefun clean-spec (spec)
(block outer
	(setf spec-ks (get-elements-pred spec (lambda (x) (and (canon-kind? x) (equal (car x) 'K)))))
	(loop for spec-k in spec-ks
		do (setf spec (replace-vals spec-k (second spec-k) spec)))

	;(setf spec-kas (get-elements-pred spec #'canon-ka?))
	;(loop for spec-ka in spec-kas
		;do (setf spec (replace-vals spec-ka (list 'TO (second spec-ka)) spec)))

	(setf spec-match-verbs (dedupe (get-elements-pred spec
		(lambda (x) (and (lex-verb? x) (not (null (get-schema-match-num x))))))))
	(loop for smv in spec-match-verbs
		do (setf spec (replace-vals smv (get-schema-match-name smv) spec)))

	(return-from outer spec)
)
)

(defun analyze-protos ()
(block outer
	(setf basic-map (make-hash-table :test #'equal))

	(loop for proto being the hash-keys of matches-for-protos
		; if (not (has-prefix? (string (schema-name (car sch))) "COMPOSITE"))
			do (loop for match in (gethash proto matches-for-protos)
				; do (format t "proto pred ~s, orig name ~s~%" (schema-name match) proto)
				do (basic-proto-header match basic-map proto)
			)
	)

	; Register learned protos so we can get their
	; headers for the generalization tree display
	(loop for match in proto-matches
		do (register-schema match))

	(setf all-arrows (list))

	(loop for basic being the hash-keys of basic-map
		; if (> (length (gethash basic basic-map)) 1)
		do (block print-basic
			(setf specs (gethash basic basic-map))

			(setf specs (remove-duplicates specs :test
				(lambda (x y) (block test-lm

					(setf x-pred (car
						(get-elements-pred x
							(lambda (z) (and (lex-verb? z) (not (null (get-schema-match-num z))))))))

					(setf y-pred (car
						(get-elements-pred y
							(lambda (z) (and (lex-verb? z) (not (null (get-schema-match-num z))))))))

					(return-from test-lm (equal
						(replace-vals x-pred (get-schema-match-name x-pred) x)
						(replace-vals y-pred (get-schema-match-name y-pred) y)
					))
			))))

			;(if (<= (length specs)) 1
				; then
				;(return-from print-basic)
			;)

			; (setf gen-graph-map (make-hash-table :test #'equal))
			(setf arrows (list))
			(loop for spec in (gethash basic basic-map)
				do (progn
					(if nil (block ifnil
						(setf spec-mods (loop for e in spec
							if (and (listp e) (equal 'ADV-A (car e)))
								collect (second e)
							if (and (symbolp e) (has-suffix? (string e) "ADV-A"))
								collect e
							if (and (symbolp e) (has-suffix? (string e) "ADV"))
								collect e))
						(setf spec (loop for e in spec
						if (and
								(not (and (listp e) (equal 'ADV-A (car e))))
								(not (and (symbolp e) (has-suffix? (string e) "ADV-A")))
								(not (and (symbolp e) (has-suffix? (string e) "ADV")))) collect e))
						(setf spec (append spec spec-mods))
					))

					(setf spec-ks (get-elements-pred spec (lambda (x) (and (canon-kind? x) (equal (car x) 'K)))))
					(loop for spec-k in spec-ks
						do (setf spec (replace-vals spec-k (second spec-k) spec)))

					;(setf spec-kas (get-elements-pred spec #'canon-ka?))
					;(loop for spec-ka in spec-kas
						;do (setf spec (replace-vals spec-ka (list 'TO (second spec-ka)) spec)))

					(setf unclean-spec (copy-item spec))

					;(setf spec-match-verbs (dedupe (get-elements-pred spec
						;(lambda (x) (and (lex-verb? x) (not (null (get-schema-match-num x))))))))
					;(loop for smv in spec-match-verbs
						;do (setf spec (replace-vals smv (get-schema-match-name smv) spec)))

					(setf spec (flatten spec))

				(if (not (contains arrows (list basic unclean-spec)))
					(setf arrows (append arrows
						(list (list basic unclean-spec))))
				)

				;(if (not (contains arrows (list spec unclean-spec)))
					;(setf arrows (append arrows (list (list spec unclean-spec)))))

				)
			)

			; Let specs subsume each other, too.
			(if *NEST-SPEC-SUBSUMPTIONS* (block nest-spec
				(loop for spec1 in (mapcar #'clean-spec (gethash basic basic-map))
				do (loop for spec2 in (mapcar #'clean-spec (gethash basic basic-map))
				do (block spec-subsume
					(handler-case 
					(if (basic-subsumes spec1 spec2)
						; then
						(progn
						(setf arrows (append arrows (list (list spec1 spec2))))
						)
					)
					(error () nil))
				)))
			))

			; (format t "~s~%" basic)
			(if *NEST-BASIC-SUBSUMPTIONS* (block nest-basic
			(loop for basic2 being the hash-keys of basic-map do (block print-subsumed-basics
				(handler-case 
				(if (basic-subsumes basic basic2)
					; then
					(progn
					(setf arrows (append arrows (list (list basic basic2))))
					)
				)
				(error () nil))
			))
			))

			(loop for basic being the hash-keys of basic-map
				do (setf all-arrows (append all-arrows
					(list (list (second basic) basic)))))

			(setf all-arrows (dedupe (append all-arrows arrows)))
			; (setf arrows (min-graph arrows))

			

			(return-from print-basic)

			; Now break the specs down by predicate
			(setf specs-by-pred (make-hash-table :test #'equal))
			(loop for spec in specs do (block idx-spec
				(setf spec-pred (car (get-elements-pred spec (lambda (x) (and (lex-verb? x) (not (null (get-schema-match-num x))))))))
				(setf spec-pred (get-schema-match-name spec-pred))
				(setf (gethash spec-pred specs-by-pred)
					(append (gethash spec-pred specs-by-pred) (list spec)))
			))

			(loop for pred being the hash-keys of specs-by-pred
				do (format t "	~s~%" pred)
				do (loop for spec in (gethash pred specs-by-pred) do (block print-spec
					; (format t "		~s~%" spec)
					(setf spec-pred (car (get-elements-pred spec (lambda (x) (and (lex-verb? x) (not (null (get-schema-match-num x))))))))

					(setf spec-vars (dedupe (get-elements-pred spec #'varp)))
					(loop for sv in spec-vars
						do (setf spec (replace-vals sv (car (get-arg-rcs sv (eval spec-pred))) spec)))

					; (format t "			~s~%" (car (schema-header (eval spec-pred))))
					(format t "		~s~%" spec)
				))
				do (format t "~%~%")
			)

			;(loop for spec in specs
				;do (format t "	~s~%" spec))
		)
	)

		(setf all-arrows (min-graph all-arrows))

		(setf graph-map (mk-hashtable all-arrows t))
		(setf all-nodes (dedupe (loop for arr in all-arrows append arr)))
		(setf roots (loop for node in all-nodes
			if (loop for arr in all-arrows
					never (equal node (second arr)))
						collect node))

		(loop for root-sch in roots do (block print-tree
			(if (<= (length (get-descendants root-sch all-arrows)) 1)
				(return-from print-tree))

			(print-dfs root-sch graph-map)
			(format t "~%~%")
		))


		; Get distribution of direct children
		(setf child-dist (loop for node being the hash-keys of graph-map
			if (>= (length (gethash node graph-map)) 5)
				collect (list node (length (gethash node graph-map)))))
		(setf child-dist (sort child-dist #'< :key #'second))
		(loop for child in child-dist
			do (format t "~s (~d)~%" (car child) (second child)))
		

		; (format t "~s~%" all-arrows)
		; (setf graph-map (mk-hashtable all-arrows))
)
)

(ldefun new-analyze-composites ()
(block outer
	(loop for match in proto-matches
		do (register-schema match))

	(setf comps (loop for sch in *LEARNED-SCHEMAS*
		if (has-prefix? (string (schema-name (car sch))) "COMPOSITE")
			collect (car sch)))

	(loop for comp in comps
	do (block print-comp
		(setf steps (mapcar #'second (section-formulas (get-section comp ':Steps))))
		(setf proto-steps (loop for st in steps
			if (not (null (get-schema-match-num (prop-pred st))))
				collect (eval (prop-pred st))))
		(loop for ps in proto-steps
			do (format t "~s~%" (basic-proto-header ps (make-hash-table :test #'equal))))

		(if (> (length proto-steps) 0)
			(format t "~%~%"))
	)
	)
)
)

(run-proto-match-collector)
; (analyze-protos)
(new-analyze-composites)

