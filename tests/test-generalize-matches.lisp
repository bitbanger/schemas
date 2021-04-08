(declaim (sb-ext:muffle-conditions cl:warning))

(load "mtg-schemas.lisp")
(load "../ll-load.lisp")

(ll-load-superdir "protoschemas.lisp")
(ll-load-superdir "schema-el.lisp")
(ll-load-superdir "schema-util.lisp")
(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "schema-el-parser.lisp")

(loop for protoschema in *PROTOSCHEMAS*
	do (register-schema (eval protoschema)))


(setf proto-matches (loop for sp in *LEARNED-SCHEMAS*
						if (and (not (null (car sp))) (null (second sp))) collect (car sp)))

(setf matches-for-protos (make-hash-table :test #'equal))

(defun get-filtered-arg-rcs (arg schema)
	(filter-arg-rcs (get-arg-rcs arg schema))
)

(defun get-arg-rcs (arg schema)
	(let ((result (loop for rc in
		(section-formulas (get-section schema ':Roles))
		if (equal (car (second rc)) arg)
			collect (unwrap-singletons (cdr (second rc))))))
		; post-let
		(progn
		; (if (null result) (format t "couldn't find RC for ~s in ~s~%" arg (loop for rc in (section-formulas (get-section schema ':Roles)) collect (car (second rc)))))
		(if (null result) nil result)
		))
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
			(format t "~s~%~%" parent-name)


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
					(format t "	~s~%" parent-rcs)

					(loop for rcs in child-rcs-to-print
							for k from 1
						if (< k 10)
							do (format t "		 ~d. " k)
						else
							do (format t "		~d. " k)
						if (not (null rcs))
							do (format t "~s~%" rcs)
						else
							do (format t "~~~%")
					)

			))

					; now print all actual headers, deduped
					(format t "~s~%" parent-name)
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
									collect (car (loop for elem in (nth i novel-child-args-rcs)
													if (lex-noun? elem)
														collect (basic-level elem)))))
						(setf rc-post-args
							(loop for post-arg in (prop-post-args child-prop)
								for i from (length rc-pre-args)
									; do (format t "considering arg ~s~%" (loop for elem in (nth i novel-child-args-rcs) if (lex-noun? elem) collect elem))
									collect (car (loop for elem in (nth i novel-child-args-rcs)
													if (lex-noun? elem)
														collect (basic-level elem)))))

						(setf prop-with-rc-args (render-prop
							rc-pre-args
							(prop-pred child-prop)
							rc-post-args
							nil
						))

						(setf all-learned-props (append all-learned-props (list (append rc-pre-args rc-post-args))))

						(format t "	~s~%" prop-with-rc-args)
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
			(format t "-------------------")
			(format t "-------------------")
			(format t "-------------------")
			(format t "-------------------~%")
			(format t "~%~%")


		)
	))

)


(ldefun filter-arg-rcs (rcs)
	(loop for rc in rcs
		if (lex-noun? rc)
			collect rc
		if (and (plur? rc) (lex-noun? (second rc)))
			collect (second rc)
	)
)


(ldefun analyze-composites ()
(block outer
	(setf comps (loop for sch in *LEARNED-SCHEMAS*
		if (has-prefix? (string (schema-name (car sch))) "COMPOSITE")
			collect (car sch)))

	(loop for comp in comps do (block print-comp
		; (print-schema comp)
		(setf rcs (mapcar #'second (section-formulas (get-section comp ':Roles))))
		(setf steps (mapcar #'second (section-formulas (get-section comp ':Steps))))
		(setf steps (schema-cleanup steps))

		(loop for rc in rcs
			do (format t "~s~%" rc))
		(format t "~%")
		;(loop for st in steps
			;do (format t "~s~%" st))

		(setf step-vars (dedupe (get-elements-pred steps #'varp)))
		(format t "step vars: ~s~%" step-vars)

		(loop for st in steps do (block print-step
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
						collect (car (loop for elem in (nth i args-rcs)
										if (lex-noun? elem)
											; collect (basic-level elem)))))
												collect (if (null elem) post-arg elem)
										if (and (plur? elem) (lex-noun? (second elem)))
												collect (if (null (second elem)) post-arg (second elem))
									))))
			(setf rc-post-args
				(loop for post-arg in (prop-post-args st)
						for collected in rc-post-args
							if (null collected) collect post-arg
							else collect collected))

			(setf arg-to-rc-map (make-hash-table :test #'equal))
			(loop for orig-arg in (prop-all-args st)
					for rc-arg in (append rc-pre-args rc-post-args)
						do (setf (gethash orig-arg arg-to-rc-map) orig-arg))

			(setf rc-mods (list (car (prop-mods st))))
			(if (equal rc-mods (list nil))
				(setf rc-mods nil))
			; (loop for orig-arg in (prop-all-args st)
					; for rc-arg in (append rc-pre-args rc-post-args)
			(loop for orig-var in step-vars
						; do (setf rc-mods (replace-vals orig-arg rc-arg rc-mods))
						; do (format t "replacing ~s with ~s in mods~%" orig-var (get-filtered-arg-rcs orig-var comp))
						do (setf rc-mods (replace-vals orig-var (get-filtered-arg-rcs orig-var comp) rc-mods))
			)

			(setf prop-with-rc-args (render-prop
				rc-pre-args
				(prop-pred st)
				rc-post-args
				rc-mods
			))

			(format t "~s~%" prop-with-rc-args)
		))

		(format t "~%----------~%~%")
	))
)
)

(analyze-composites)

; (run-proto-match-collector)
