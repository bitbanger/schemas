(declaim (sb-ext:muffle-conditions cl:warning))

(load "apr-30-schemas.lisp")
(load "all-stories.lisp")
(load "../ll-load.lisp")

(ll-load-superdir "protoschemas.lisp")
(ll-load-superdir "schema-el.lisp")
(ll-load-superdir "schema-util.lisp")
(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "schema-el-parser.lisp")
(ll-load-superdir "el-to-ulf.lisp")
(ll-load-superdir "schema-matcher.lisp")
(ll-load-superdir "schema-expansion.lisp")
(ll-load "diana.lisp")


(defparameter *cherrypicked-stories* '(
	(
		"Lane liked the song."
	)
	(
		"Lane fell asleep."
	)
	(
		"Lane went to the water."
	)
	(
		"She ate some chocolate."
		"Lane took her to the vet."
	)
))

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


(defparameter *NEST-SPEC-SUBSUMPTIONS* t)
(defparameter *NEST-BASIC-SUBSUMPTIONS* t)

(loop for protoschema in *PROTOSCHEMAS*
	do (register-schema (eval protoschema)))


; (defparameter *TRAIN-FRAC* '(5 5))


; (setf *ALL-LEARNED-SCHEMAS* (shuffle *LEARNED-SCHEMAS* 3))

;(setf *LEARNED-SCHEMAS* (subseq *ALL-LEARNED-SCHEMAS*
	;0 (* (car *TRAIN-FRAC*) (floor (length *ALL-LEARNED-SCHEMAS*) (second *TRAIN-FRAC*)))))

;(setf *UNSEEN-SCHEMAS* (subseq *ALL-LEARNED-SCHEMAS*
	; (floor (length *ALL-LEARNED-SCHEMAS*) 2)
	;(* (car *TRAIN-FRAC*) (floor (length *ALL-LEARNED-SCHEMAS*) (second *TRAIN-FRAC*)))
	;(length *ALL-LEARNED-SCHEMAS*)))

;(setf *SEEN-SCHEMA-NAMES* (loop for sch in *LEARNED-SCHEMAS*
	;collect (prop-pred (car (schema-header (car sch))))))

;(setf *UNSEEN-STORIES* (subseq *ALL-STORIES*
	;(floor (length *ALL-STORIES*) 2)
	;(length *ALL-STORIES*)))
;(setf *UNSEEN-STORIES* (loop for story in *ALL-STORIES*
	;if (loop for sch in (second story)
		;never (contains *SEEN-SCHEMA-NAMES* sch))
			;collect story))





(setf proto-matches (loop for sp in *LEARNED-SCHEMAS*
						if (and (not (null (car sp))) (null (second sp))) collect (car sp)))


(setf matches-for-protos (make-hash-table :test #'equal))
(setf parents-for-matches (mkht))

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
	(setf orig-nouns (loop for br in better-res if (lex-noun? br) collect br))

	(loop for remove-pred in '(ENTITY.N OBJECT.N INANIMATE_OBJECT.N AGENT.N LOCATION.N DESTINATION.N)
		do (block b
			(setf tmp-better-res (remove remove-pred better-res :test #'equal))
			(setf tmp-nouns (loop for tbr in tmp-better-res if (lex-noun? tbr) collect tbr))

			(if (or
					(> (length tmp-nouns) 0)
					(and
						(equal 0 (length tmp-nouns))
						(equal 0 (length orig-nouns))))
				; then
				(setf better-res tmp-better-res))))

	(return-from outer better-res)
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

		(setf (gethash (schema-name pm) parents-for-matches)
			proto-parent)

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

							; Leave RCs in if it's the same set
							; as the parent, to avoid throwing
							; away information.
							(if (loop for ncrc in novel-child-rcs
									never (lex-noun? ncrc))
								(progn
									(setf novel-child-rcs child-rcs)
									(setf covering-child-rcs nil)
								))


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

(ldefun basic-step (st comp basic-map rcs steps &optional orig-child-name no-basic)
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

		(if (not no-basic)
			(setf basic-flat-prop (replace-vals noun (basic-level noun) basic-flat-prop)))

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
	(if (has-element flat-prop 'POND.N)
		(format t "adding ~s with index ~s~%" flat-prop index-flat-prop))
	(setf (gethash index-flat-prop basic-map) (append (gethash index-flat-prop basic-map) (list flat-prop)))

	(return-from outer index-flat-prop)


	;(format t "~s~%" flat-prop)
	;(format t "	~s~%" basic-flat-prop)
)
)

(ldefun basic-proto-header (proto basic-map &optional orig-child-name no-basic)
(block outer
	(setf rcs (mapcar #'second (section-formulas (get-section proto ':Roles))))
	(setf steps (mapcar #'second (section-formulas (get-section proto ':Steps))))

	(return-from outer (basic-step (car (schema-header proto)) proto basic-map rcs steps orig-child-name no-basic))
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
	(and (listp m) (contains '(ADV-A ADV ADV-E ADV-S) (car m)))
	(lex-adv? m)
)
)

(ldefun basic-mod-subsumes (m1 m2 &optional strict)
(block outer
	(setf m1-nouns (get-elements-pred m1 #'lex-noun?))
	(setf m2-nouns (get-elements-pred m2 #'lex-noun?))

	; Should have the same number of nouns
	(if (not (equal (length m1-nouns) (length m2-nouns)))
		(return-from outer nil))

	; If all nouns are blanked out, the structures
	; should be equal
	(setf blanked-m1 (copy-item m1))
	(loop for n in m1-nouns
		do (setf blanked-m1 (replace-vals
			n 'NOUN.N blanked-m1)))
	(setf blanked-m2 (copy-item m2))
	(loop for n in m2-nouns
		do (setf blanked-m2 (replace-vals
			n 'NOUN.N blanked-m2)))

	(if (not (equal
		blanked-m1 blanked-m2))
		; then
		(return-from outer nil))

	; All nouns in m1 should subsume
	; parallel nouns in m2.
	(loop for n1 in m1-nouns do
		(loop for n2 in m2-nouns do (block check
			; NOTE: this assumes one noun per mod,
			; i.e. I gave up on generalizing that,
			; because it'll basically never happen
			; and I'm on a deadline and missing that
			; isn't so bad.
			(if (strictly-subsumes n1 n2)
				(return-from outer t))
			(if (and (subsumes n1 n2) (not strict))
				(return-from outer t))
		)))

	(return-from outer nil)
)
)

(ldefun basic-subsumes (b1 b2)
(block outer
	(setf b1 (clean-spec b1))
	(setf b2 (clean-spec b2))

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

	; b1 mods should all be present in,
	; or subsume, mods in b2
	(if (and (not (null b1-mods))
			; (not (loop for m in b1-mods always (contains b2-mods m))))
			(not (loop for m1 in b1-mods always
				(loop for m2 in b2-mods thereis
					(basic-mod-subsumes m1 m2)))))
		(return-from outer nil))

	(setf strict-mod-subsume
		(loop for m1 in b1-mods always
			(loop for m2 in b2-mods thereis
				(basic-mod-subsumes m1 m2 t))))

	; b1 is b2 with fewer mods
	(if (equal b1-no-mods b2-no-mods)
		(return-from outer t))

	; verbs don't nest
	;(if (not (subsumes (second b1-no-mods) (second b2-no-mods)))
		;(return-from outer nil))

	(if (and (equal (length b1-no-mods) (length b2-no-mods))
			(loop for elem1 in b1-no-mods for elem2 in b2-no-mods
				thereis (or strict-mod-subsume (strictly-subsumes elem1 elem2)))
			(loop for elem1 in b1-no-mods for elem2 in b2-no-mods
				always (subsumes elem1 elem2))
			(loop for elem1 in b1-no-mods for elem2 in b2-no-mods
				never (strictly-subsumes elem2 elem1)))
		(return-from outer t)
	)

	(return-from outer nil)
)
)

(ldefun fill-vars (phi schema)
(block outer
	(setf phi-vars (dedupe (get-elements-pred phi #'varp)))

	(setf rcs (mapcar #'car (get-args-rcs phi-vars schema)))

	(loop for var in phi-vars for rc in rcs
		do (setf phi (replace-vals var rc phi)))

	(setf phi (loop for form in phi
		if (not (and (listp form)
			(equal 2 (length form))
			(equal (car form) (second form))))
			; then
			collect form))

	(return-from outer phi)
)
)

(ldefun clean-match-nums (spec)
(block outer
	(setf spec-match-verbs (dedupe (get-elements-pred spec
		(lambda (x) (and (lex-verb? x) (not (null (get-schema-match-num x))))))))
	(loop for smv in spec-match-verbs
		do (setf spec (replace-vals smv (get-schema-match-name smv) spec)))

	(return-from outer spec)
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

					; (setf spec (flatten spec))

				;(if (not (contains arrows (list basic unclean-spec)))
					;(setf arrows (append arrows
						;(list (list basic unclean-spec))))
				;)
				(setf arrows (remove-duplicates (append arrows
					(list (list basic unclean-spec)))
					:test (lambda (x y) (equal (clean-spec (second x)) (clean-spec (second y))))))

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

		(format t "before min: ~s~%" (loop for arr in all-arrows if (equal (car arr) '(AGENT.N TRAVEL.V WATER.N)) collect (second arr)))
		(setf all-arrows (min-graph all-arrows))
		(format t "after min: ~s~%" (loop for arr in all-arrows if (equal (car arr) '(AGENT.N TRAVEL.V WATER.N)) collect (second arr)))
		; Correct prefix arguments
		(setf all-arrows (loop for arrow in all-arrows
			collect (loop for el in arrow
				if (and (listp el) (equal 'ENTITY.N (car el)))
					collect (append (list 'AGENT.N) (cdr el))
				else
					collect el)))

		(setf graph-map (mk-hashtable all-arrows t))
		(setf all-nodes (dedupe (loop for arr in all-arrows append arr)))
		(setf roots (loop for node in all-nodes
			if (loop for arr in all-arrows
					never (equal node (second arr)))
						collect node))

		(block basic-level-tree
			(loop for root-sch in roots do (block print-tree
				;(if (<= (length (get-descendants root-sch all-arrows)) 1)
					;(return-from print-tree))

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
		)

		(setf specs (dedupe
			(loop for k being the hash-keys of basic-map
				append (loop for spec in (gethash k basic-map)
				collect (loop for s in (clean-spec spec)
						if (or (lex-noun? s) (lex-verb? s)) collect s
					)))))

		; (format t "~s~%" specs)
		; (setf graph-map (mk-hashtable all-arrows))

		(return-from outer all-arrows)
)
)

(ldefun comp-formulas (comp)
(block outer
	(setf rcs (mapcar #'second (section-formulas (get-section comp ':Roles))))
	(setf step-eps (mapcar #'car (section-formulas (get-section comp ':Steps))))
	(setf steps (mapcar #'second (section-formulas (get-section comp ':Steps))))
	(setf new-steps (copy-item steps))
	(loop for st in steps
			for ep in step-eps
		if (and nil (not (null (get-schema-match-num (prop-pred st)))))
		do (block expand
			(setf expanded (expand-nested-schema
				(list ep st) comp))
			(if (null expanded)
				(return-from expand))

			(setf expanded (apply-bindings (car expanded) (second expanded)))

			(setf sub-eps (append
				(mapcar #'car (section-formulas (get-section expanded ':Goals)))
				;(mapcar #'car (section-formulas (get-section expanded ':Preconds)))
				(mapcar #'car (section-formulas (get-section expanded ':Steps)))
				;(mapcar #'car (section-formulas (get-section expanded ':Postconds)))
			))
				

			(setf sub-steps (append
				(mapcar #'second (section-formulas (get-section expanded ':Goals)))
				;(mapcar #'second (section-formulas (get-section expanded ':Preconds)))
				(mapcar #'second (section-formulas (get-section expanded ':Steps)))
				;(mapcar #'second (section-formulas (get-section expanded ':Postconds)))
			))

			;(setf sub-steps (loop for st in sub-steps
				;collect (basic-step st expanded (mkht) (mapcar #'second (section-formulas (get-section expanded ':Roles))) sub-steps nil t)))

			(setf new-steps (append new-steps sub-steps))
			(setf step-eps (append step-eps sub-eps))
		)
	)

	(setf new-steps
		(loop for st in new-steps
			for ep in step-eps
				collect (list st '** ep)))

	(return-from outer (list new-steps rcs))
))

(ldefun new-analyze-composites ()
(block outer
	(loop for match in proto-matches
		do (register-schema match))

	(setf schemas-by-pairs (mkht))

	(setf comps (loop for sch in *LEARNED-SCHEMAS*
		if (has-prefix? (string (schema-name (car sch))) "COMPOSITE")
			collect (car sch)))

	(loop for comp in comps
	do (block print-comp
		(setf comp-name (prop-pred (car (schema-header comp))))
		(setf rcs (mapcar #'second (section-formulas (get-section comp ':Roles))))
		(setf step-eps (mapcar #'car (section-formulas (get-section comp ':Steps))))
		(setf steps (mapcar #'second (section-formulas (get-section comp ':Steps))))
		(setf new-steps (copy-item steps))
		(loop for st in steps
				for ep in step-eps
			if (not (null (get-schema-match-num (prop-pred st))))
			do (block expand
				(setf expanded (expand-nested-schema
					(list st '** ep) comp))
				(if (null expanded)
					(return-from expand))

				(setf sub-steps (append
					(mapcar #'second (section-formulas (get-section expanded ':Goals)))
					(mapcar #'second (section-formulas (get-section expanded ':Preconds)))
					(mapcar #'second (section-formulas (get-section expanded ':Steps)))
					(mapcar #'second (section-formulas (get-section expanded ':Postconds)))
				))

				(setf sub-steps (loop for st in sub-steps
					collect (basic-step st expanded (mkht) (mapcar #'second (section-formulas (get-section expanded ':Roles))) sub-steps nil t)))
					; collect st))

				(setf new-steps (append new-steps sub-steps))
			)
		)

		(setf steps (dedupe new-steps))

		(setf all-steps (list))
		(setf all-basic-steps (list))
		(loop for st in steps do (block print-step
			(if (not (null (get-schema-match-num (prop-pred st))))
			; then
			(block proto-step
				(setf proto-name (prop-pred st))
				(setf proto (eval proto-name))

				(setf proto-parent-name
					(gethash proto-name parents-for-matches))

				(setf basic-st (basic-proto-header
					proto (mkht)))

				(setf st (basic-proto-header
					proto (mkht) nil t))
				(setf st (car (schema-header proto)))
				(setf all-steps (append all-steps (list st)))

				(if (not (null proto-parent-name))
					(setf basic-st (replace-vals proto-name
						proto-parent-name basic-st)))
				(setf all-basic-steps (append all-basic-steps (list basic-st)))
			)
			; else
			(block prop-step
				(setf basic-st (basic-step
					st comp (mkht) rcs steps))
				(setf all-basic-steps (append all-basic-steps (list basic-st)))

				(setf st (basic-step
					st comp (mkht) rcs steps nil t))
				(setf all-steps (append all-steps (list st)))
			)
			))
		)
		; Get all length-2 subsequences and index
		; the story by them.

		; (setf all-basic-steps (mapcar #'second all-basic-steps))

		; (setf clean-rcs (dedupe (fill-vars rcs comp)))
		(setf clean-rcs rcs)

		(loop for st1 in (remove-last all-basic-steps) for i from 0
		do (loop for st2 in (remove-last (subseq-safe all-basic-steps
			(+ i 1) (length all-basic-steps)))
			do (block index-pair
				(setf pair (list st1 st2))
				(if (not (equal pair (dedupe pair)))
					(return-from index-pair))
				; (setf pair (list st1))
				(setf pair-hash (rechash pair))
				(setf (gethash pair-hash schemas-by-pairs)
					(dedupe (append (gethash pair-hash schemas-by-pairs)
						(list (list pair (append all-steps clean-rcs) comp-name)))))
		)))
	))

	(setf composite-matches 0)
	(loop for kh being the hash-keys of schemas-by-pairs
		if (> (length (gethash kh schemas-by-pairs)) 1)
		do (block print-schemas
			(setf composite-matches
				(+ composite-matches 1))
			(format t "~s~%"
				(car (car (gethash kh schemas-by-pairs))))
			(loop for ps in (gethash kh schemas-by-pairs)
				;do (loop for st in (second ps)
					;do (format t "	~s~%" st))
				do (print-schema (eval (third ps)))
			)

			(format t "~%")
		)
	)

	(format t "~d composite matches found~%" composite-matches)
)
)

(ldefun prop-match-num (prop)
(block outer
	(setf pred (car (get-elements-pred prop
		(lambda (x) (not (null (get-schema-match-num x)))))))

	(return-from outer (get-schema-match-num pred))
)
)

(run-proto-match-collector)
(new-analyze-composites)
(setf schema-arrows (analyze-protos))

(ldefun get-matches (schema graph-map)
(block outer
	(setf index-header (clean-spec (basic-proto-header schema (mkht))))

	(if (equal 0 (length (gethash index-header graph-map)))
		(return-from outer nil))

	(setf matches (gethash index-header graph-map))
	(setf matches (loop for m in matches
		if (not (null (prop-match-num m)))
			collect m))
	(setf matches (remove-duplicates matches :test
		(lambda (x y)
			(< (abs (-
				(prop-match-num x)
				(prop-match-num y))) 3)
		)))

	(return-from outer matches)
))

(ldefun analyze-unseen ()
(block outer
; (loop for unseen in (shuffle *ALL-STORIES* 5) do (block see
(format t "~%~%~%")
(setf headers (loop for k being the hash-keys of basic-map
	append (gethash k basic-map)))

(setf diana-clusters (diana headers #'wn-metric))
(setf diana-tree (unflatten-tree diana-clusters))

(setf diams (loop for cl in diana-clusters
	if (> (length (car cl)) 1)
		collect (diameter (car cl) #'wn-metric)))
; (format t "~s~%" (sort diams #'<))

(loop for cl in diana-clusters
	; if (or (equal (length (car cl)) 8)
		; (equal (length (car cl)) 9))
	if (and (> (length (car cl)) 1) (<= (diameter (car cl) #'wn-metric) 8))
			do (format t "~s~%" cl))


; Register composites

(format t "~s~%" (get-descendants '(AGENT.N TRAVEL.V WATER.N) schema-arrows))
(format t "~s~%" (gethash '(AGENT.N TRAVEL.V WATER.N) graph-map))
(format t "~s~%" (gethash '(AGENT.N TRAVEL.V WATER.N) basic-map))

(setf comps (loop for sch in *LEARNED-SCHEMAS*
	if (has-prefix? (string (schema-name (car sch))) "COMPOSITE")
		collect (car sch)))

(loop for story in *cherrypicked-stories* do (block cherry
	(format t "~%~%~%==========================~%")

	; Parse the story
	(setf parsed (loop for sent in (len-parse-sents story)
		collect (loop for wff in sent
			if (canon-prop? wff) collect wff)))

	(loop for sent in story
			for el-sent in parsed
				do (format t "~s~%" sent)
				do (loop for wff in el-sent
					do (format t "	~s~%" wff)))

	; Match the story to protoschemas
	(setf initial-matches (top-story-matches-easy-el parsed))

	(setf predictions (mkht))
	(setf collected-rcs (list))
	(setf collected-steps (list))

	(setf all-amcs (list))

	; For each match...
	(loop for im in initial-matches do (block im
		; Compute the index into the generalization tree
		(setf matched-proto (replace-vals
			(schema-name (car im))
			(schema-name (invoked-proto (car (schema-header (car im)))))
			(car im)))
		; (setf index-form (clean-spec (basic-proto-header matched-proto (mkht))))
		(setf index-form (clean-match-nums (basic-proto-header matched-proto (mkht))))

		(format t "~s~%" (car (schema-header (car im))))
		(format t "	-> ~s~%" index-form)

		; Find all its siblings in the generalization tree
		; (format t "~s~%" (car (schema-header (apply-bindings (car im) (third im)))))
		;(setf sibs (loop for sib in (gethash index-form graph-map)
		(setf sibs (loop for sib in (get-descendants index-form schema-arrows)
			collect (car (get-elements-pred sib (lambda (x) (not (null (get-schema-match-num x))))))))
		(setf sibs (loop for sib in sibs
			if (not (null sib)) collect sib))


		; (print-schema matched-proto)
		(format t "spec: ~s~%" (schema-header matched-proto))
		(format t "index form: ~s~%" index-form)
		(format t "sibs: ~s~%" sibs)

		(setf actually-matched sibs)
		(setf bound-init-header (car (schema-header (apply-bindings (car im) (third im)))))
		(setf result-headers (loop for sib in sibs
			collect (replace-vals
				(prop-pred bound-init-header)
				sib bound-init-header)))


		; Find the composites
		(setf actually-matching-comps
			(loop for comp in comps
				if (loop for am in actually-matched
					thereis (has-element comp am))
						collect comp))

		; Fill result headers in to unify with composite steps
		;(setf result-headers (loop for res in results
			;collect (car (schema-header (apply-bindings (car res) (third res))))))

		(setf all-amcs (dedupe (append all-amcs
			(loop for amc in actually-matching-comps
				collect (prop-pred (car (schema-header amc)))))))

		; Predict!
		(loop for amc in actually-matching-comps do (block predict
			(setf comp-steps (mapcar #'second (section-formulas (get-section amc ':Steps))))

			(setf bindings (mkht))
			(setf new-amc nil)
			(block outer-uni (loop for cs in comp-steps do
				; do (format t "cs ~s~%" cs)
				(loop for rh in result-headers do (block uni
					(if (not (equal (prop-pred cs) (prop-pred rh)))
						(return-from uni))
					; (format t "rh ~s~%" rh)
					; (dbg-tag 'unify)
					; (format t "unifying ~s and ~s%" cs rh)
					(setf *DEBUG-UNIFY-INEXACT-MODS* t)
					(setf tmp-bindings (unify-no-schema cs rh bindings))
					(setf *DEBUG-UNIFY-INEXACT-MODS* nil)

					(if (not (null tmp-bindings)) (block predict-inner
						(setf new-amc (apply-bindings amc tmp-bindings))
						(setf bindings (ht-copy tmp-bindings))
						; get all inner formulas, now
						;(return-from outer-uni)
					))
				))
			))

			(if (null new-amc)
				(return-from predict))

				

			; (setf new-amc (basic-schema new-amc))

			(setf steps-and-rcs (apply-bindings (comp-formulas new-amc) bindings))
			(setf steps (car steps-and-rcs))
			(setf rcs (second steps-and-rcs))
			;(loop for form in (dedupe (append steps rcs))
				; if (null (get-elements-pred form #'varp))
					; do (format t "~s~%" form))

			(setf all-forms (append steps rcs))
			(setf all-forms (loop for f in all-forms
				if (contains f '**) collect (car f)
				else collect f))
			(setf all-forms (dedupe all-forms))

			(loop for rc in (dedupe rcs)
				do (format t "~s~%" rc))
			(loop for st in (dedupe steps)
				do (format t "~s~%" st))


			;(handler-case 
				;(schema-to-eng new-amc)
				;(error () (format nil "~%")))
			(format t "======~%")

			(setf collected-steps (append collected-steps steps))
			(setf collected-rcs (append collected-rcs rcs))

		))




	))


))
))
