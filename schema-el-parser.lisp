(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "old-ttt/src/load")
(ll-load-subdir "el_parse" "init1.lisp")
(ll-load "ll-util.lisp")
(ll-load "ll-cache.lisp")
(ll-load "schema-el-lex.lisp")
(ll-load "schema-el.lisp")
(ll-load "schema-coref.lisp")
(ll-load "schema-postproc-utils.lisp")
(ll-load "schema-postproc-ttt-rules.lisp")
(ll-load "schema-postproc-lisp-rules.lisp")

(ldefun schema-cleanup-ttt (phi)
(block outer
	(setf result (unhide-ttt-ops
		(old-ttt:apply-rules *SCHEMA-CLEANUP-RULES*
			(hide-ttt-ops phi)
			:rule-order :slow-forward)))
	(return-from outer result)
)
)

(ldefun schema-cleanup-lisp (phi)
(block outer
	(setf phi-copy (copy-list phi))
	(loop for func in *SCHEMA-CLEANUP-FUNCS*
		do (block inner

			(setf old-phi-copy (copy-list phi-copy))
			(setf new-phi-copy (funcall func phi-copy))
			;(setf new-phi-copy (ll-cache
				;func (list phi-copy) 100 nil))

			;(if (not (same-list-unordered old-phi-copy new-phi-copy))
				;(progn
				 ;(format t "func ~s updated~%" func)
				 ;(format t "old phi: ~s~%~%" old-phi-copy)
				 ;(format t "new phi: ~s~%~%" new-phi-copy)
				;)
			;)

			; Remove any "naked" symbols left over from any
			; processing bugs that can't be easily fixed.
			; (but still put out a warning)
			(if (and (loop for form in old-phi-copy never (symbolp form)) (loop for form in new-phi-copy thereis (symbolp form)))
				(dbg 'bug-warning "func ~s left naked symbols ~s after processing ~s~%" func (loop for form in new-phi-copy if (symbolp form) collect form) old-phi-copy)
			)

			(if (null new-phi-copy)
				(if (null phi)
					; then
					(dbg 'bug-warning "func ~s gave null phi, BUT phi was null going in~%" func)
					; else
					(dbg 'bug-warning "func ~s gave null phi~%" func)
				)
			)

			(setf new-phi-copy (loop for e in new-phi-copy if (listp e) collect e))
			(setf phi-copy new-phi-copy)
		)
	)
	(return-from outer phi-copy)
)
)

(ldefun schema-cleanup (phi)
(block outer
	(setf cleaned-phi (schema-cleanup-until-convergence phi))
	(setf reified-phi (copy-item cleaned-phi))

	(loop for form in cleaned-phi do (block reify-args
		(if (not (canon-prop? form))
			(return-from reify-args)
		)

		(setf new-form (copy-item form))

		; strip ** ep
		(setf charstar-ep nil)
		(if (canon-charstar? new-form)
			(progn
				(setf charstar-ep (third new-form))
				(setf new-form (car new-form))
			)
		)

		; reify prop/pred args
		(setf args (prop-all-args new-form))
		(loop for arg in args do (block reify-arg
			(if (canon-prop? arg)
				(setf new-form (replace-vals arg (list 'KE arg) new-form))
			)

			(if (canon-pred? arg)
				(if (lex-verb? (pred-base arg))
					(setf new-form (replace-vals arg (list 'KA arg) new-form))
					; else
					(setf new-form (replace-vals arg (list 'K arg) new-form))
				)
			)
		))

		; add back charstar (if applicable)
		(if (not (null charstar-ep))
			(setf new-form (list new-form '** charstar-ep))
		)

		(setf reified-phi (replace-vals form new-form reified-phi))
	))

	(return-from outer reified-phi)
)
)

(ldefun schema-cleanup-until-convergence (phi)
(let (last-phi-copy phi-copy)
(block outer
	; until convergence
	(setf last-phi-copy (copy-list phi))
	(setf phi-copy (copy-list phi))
	(loop while t do (block inner
		(setf phi-copy (remove-duplicates (schema-cleanup-ttt phi-copy) :test #'equal))
		(setf phi-copy (remove-duplicates (schema-cleanup-lisp phi-copy) :test #'equal))
		(if (same-list-unordered phi-copy last-phi-copy)
			; then
			(return-from outer phi-copy)
			; else
			(progn
			(setf last-phi-copy (copy-list phi-copy))
			)
		)
	))
)
)
)

(ldefun schema-parse (sent)
	(progn
	(setf *glob-idx* 0) ; for multi-sentence parser word indexing
	(setf interp (interpret sent))
	(format t "interpretation: ~s~%" interp)
	(schema-cleanup interp)
	)
)

(ldefun parse-story (sents)
	(parse-story-maybe-from-ulf sents nil)
)

(ldefun interp-story-maybe-from-ulf (sents pre-ulfs)
(block outer
	(setf *glob-idx* 0)
	(if (not (null pre-ulfs))
		; then
		(setf new-sents (loop for sent in sents
			for pre-ulf in pre-ulfs
			collect (interpret-lf pre-ulf)
		))
		; else
		(setf new-sents (loop for sent in sents
			collect (interpret sent)
		))
	)

	(return-from outer new-sents)
)
)

(ldefun parse-story-maybe-from-ulf-full-output (sents pre-ulfs)
(block outer
	(setf raw-interps (interp-story-maybe-from-ulf sents pre-ulfs))

	(setf cleaned-interps (mapcar #'schema-cleanup raw-interps))

	; PERFORM COREFERENCE
	(setf resolved-interps (resolve-coreference sents cleaned-interps))

	(setf no-idx-interps (clean-idx-tags resolved-interps))

	; call schema-cleanup one more time, as the coref tags
	; interfere with the cleanup procedures sometimes
	; TODO: find out why & fix it
	(setf final-interps (mapcar #'schema-cleanup no-idx-interps))

	(return-from outer (list
		raw-interps cleaned-interps resolved-interps no-idx-interps final-interps
	))
)
)

(ldefun parse-story-maybe-from-ulf (sents pre-ulfs)
	(fifth (parse-story-maybe-from-ulf-full-output sents pre-ulfs))
)

(ldefun filtered-parse-story (story)
	(loop for sent in (parse-story story) collect (loop for wff in sent if (canon-prop? wff) collect wff))
)

(ldefun sp (sent)
	(format t "~s~%" (schema-parse sent))
)

(ldefun process-stdin-story (story-processor-fn should-fix)
(block outer
	(let ((sentences (list)) (lines (list)) (story-count 0))
	(progn
	(loop while t do (let ((line (read-line)))
		(if (> (length line) 0)
			; then
			(progn
			(setf sentences (append sentences (list
				(if should-fix
					; then
					(schema-parse line)
					; else
					(interpret line)
				)
			)))
			(setf lines (append lines (list line)))
			)
			; else
			(progn
				(setf story-count (+ 1 story-count))
				(funcall story-processor-fn sentences lines)
				(setf sentences (list))
				(setf lines (list))
			)
		)
	))))
))
