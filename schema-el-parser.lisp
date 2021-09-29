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

			(if (not (same-list-unordered old-phi-copy new-phi-copy))
				(progn
				 (dbg 'schema-postproc "func ~s updated~%" func)
				 (dbg 'schema-postproc "old phi: ~s~%~%" old-phi-copy)
				 (dbg 'schema-postproc "new phi: ~s~%~%" new-phi-copy)
				)
			)

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
	(setf coref-res (resolve-coreference-return-all sents cleaned-interps))

	(setf coref-map (make-hash-table :test #'equal))
	(loop for cluster in (second coref-res)
		for rep-name in (third coref-res)
		do (loop for elem in cluster
			do (setf (gethash (get-idx-tag elem) coref-map)
				(get-idx-tag rep-name))))

	; (print-ht coref-map)

	(setf resolved-interps (car coref-res))

	(setf all-tagged (get-elements-pred resolved-interps #'is-idx-tagged))

	(setf all-tagged (dedupe all-tagged))

	(setf all-tags (dedupe (mapcar #'get-idx-tag all-tagged)))

	(setf all-tags (dedupe (append all-tags
		(loop for k being the hash-keys of coref-map collect k))))

	(loop for tag in all-tags
		if (null (gethash tag coref-map))
			do (setf (gethash tag coref-map) tag))

	(setf syms-for-tok-nums (make-hash-table :test #'equal))

	(loop for tag in all-tags
		do (setf (gethash tag syms-for-tok-nums)
			(append (gethash tag syms-for-tok-nums)
				(loop for tagged in all-tagged
					if (equal (gethash tag coref-map) (get-idx-tag tagged))
						collect tagged))))

	(setf verbs-for-tok-nums (make-hash-table :test #'equal))
	(setf episodes-for-tok-nums (make-hash-table :test #'equal))
	; (format t "~s~%" resolved-interps)
	(loop for tag being the hash-keys of syms-for-tok-nums do (block get-eps
		(setf syms (gethash tag syms-for-tok-nums))
		(setf syms (loop for sym in syms if (lex-verb? sym) collect sym))
		(setf eps (mapcar #'third (get-elements-pred resolved-interps (lambda (x)
			(and (pseudo-charstar? x) (has-element x (car syms)))))))
		; (format t "tag ~s, syms ~s, eps ~s~%" tag syms eps)
		(setf (gethash tag episodes-for-tok-nums) (car eps))
		(setf (gethash tag verbs-for-tok-nums) (car syms))
	))


	(setf no-idx-interps (clean-idx-tags resolved-interps))

	; call schema-cleanup one more time, as the coref tags
	; interfere with the cleanup procedures sometimes
	; TODO: find out why & fix it
	(setf final-interps (mapcar #'schema-cleanup no-idx-interps))

	(setf final-eps-for-tok-nums (make-hash-table :test #'equal))

	; Episodes mapped to tok nums before the final cleanup may no longer
	; be canonical, that is, they may have been split. We'll take those
	; episodes and find all concurrent episodes in the final, canonical
	; ELs, then disambiguate based on predicate identity.
	(loop for tag being the hash-keys of episodes-for-tok-nums do (block disamb
		(setf ep (gethash tag episodes-for-tok-nums))
		(if (not (null (get-elements-pred final-interps (lambda (x) (and (canon-charstar? x) (equal (third x) ep))))))
			(progn
			(setf (gethash tag final-eps-for-tok-nums) ep)
			(return-from disamb)
			)
		)

		(setf during-eps (mapcar #'car (get-elements-pred final-interps (lambda (x) (and
			(listp x) (equal (length x) 2) (equal (second x) (list 'DURING ep)))))))

		(setf during-charstars (mapcar #'third (get-elements-pred final-interps (lambda (x) (and (canon-charstar? x) (contains during-eps (third x)) (equal (prop-pred (car x)) (clean-idx-tags (gethash tag verbs-for-tok-nums))))))))

		(setf (gethash tag final-eps-for-tok-nums) (car during-charstars))
	))

	(setf kas-for-tok-nums (make-hash-table :test #'equal))
	(loop for tag being the hash-keys of verbs-for-tok-nums do (block get-kas
		(setf kas (get-elements-pred resolved-interps (lambda (x)
			(and (canon-ka? x) (equal (get-idx-tag (pred-base (second x))) (gethash tag coref-map))))))
		; (format t "ka for ~s is ~s~%" tag kas)
		(setf (gethash tag kas-for-tok-nums) (clean-idx-tags kas))
	))

	(setf kes-for-tok-nums (make-hash-table :test #'equal))
	(loop for tag being the hash-keys of verbs-for-tok-nums do (block get-kes
		(setf kes (get-elements-pred resolved-interps (lambda (x)
			(and (canon-event? x) (equal (get-idx-tag (prop-pred (second x))) (gethash tag coref-map))))))
		; (format t "ke for ~s is ~s~%" tag kes)
		(setf (gethash tag kes-for-tok-nums) (clean-idx-tags kes))
	))

	; (print-ht final-eps-for-tok-nums)

	(setf inds-for-tok-nums (make-hash-table :test #'equal))
	(loop for tag in all-tags
		do (setf (gethash tag inds-for-tok-nums) (clean-idx-tags (dedupe (get-elements-pred resolved-interps (lambda (x)
			(and (canon-individual? x) (has-element-pred x (lambda (y)
				(and (is-idx-tagged y) (equal (get-idx-tag y) (gethash tag coref-map))))))))))))

	(return-from outer (list
		raw-interps cleaned-interps resolved-interps no-idx-interps final-interps final-eps-for-tok-nums kas-for-tok-nums inds-for-tok-nums coref-map kes-for-tok-nums
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

(ldefun print-story-with-els (story els)
(block outer
	(if (not (equal (length story) (length els)))
		(return-from outer nil))

	(if (not (loop for el in els always (listp el)))
		(return-from outer nil))

	(loop for sent in story
		for el-sent in els
		do (block inner
			(setf valid (list))
			(setf invalid (list))
			(loop for phi in el-sent
				if (canon-prop? phi)
					do (setf valid (append valid (list phi)))
				else
					do (setf invalid (append invalid (list phi))))
			(format t "~s~%" sent)
			(format t "VALID:~%")
			(loop for valid-el in valid
				do (format t "	~s~%" valid-el))
			(format t "INVALID:~%")
			(loop for invalid-el in invalid
				do (format t "	~s~%" invalid-el))))

		
)
)
