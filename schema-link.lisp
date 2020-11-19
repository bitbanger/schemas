(load "ll-load.lisp")

(ll-load "schema-util.lisp")
(ll-load "schema-unify.lisp")

; norm-link.lisp contains functions to link schemas together by their
; pre- and post-conditions.

(defun link-schemas-onedir (schema-post schema-pre story)
(block outer
	(setf schema-pre-uniq nil)
	(setf schema-post-uniq nil)
	(setf bindings nil)
	(let ((uniq-pair (uniquify-shared-vars schema-pre schema-post)))
		(progn
			(setf schema-pre-uniq (car uniq-pair))
			(setf schema-post-uniq (second uniq-pair))
		)
	)

	(setf story-time-props
		(loop for phi in (linearize-story story)
			if (time-prop? phi) collect phi))

	(setf all-ep-rels
		(loop for schema in (list schema-post schema-pre)
			append (mapcar #'second (section-formulas (get-section schema ':Episode-relations)))
		)
	)

	; (format t "time model: ~s~%" (append story-time-props all-ep-rels))
	(handler-case (load-time-model (append story-time-props all-ep-rels))
		(error () (progn (dbg 'link "error loading time model~%") (return-from outer nil)))
	)


	; (format t "trying to link ~s and ~s~%" (second schema-post) (second schema-pre))
	(setf schema-post-ep (third (second schema-post)))
	(setf schema-pre-ep (third (second schema-pre)))
	(loop for post-pair in (section-formulas (get-section schema-post ':Postconds))
		do (loop for pre-pair in (section-formulas (get-section schema-pre ':Preconds))
			do (block match-conds
				; (format t "checking post-pair ~s and pre-pair ~s (post-ep ~s and pre-ep ~s))~%" post-pair pre-pair schema-post-ep schema-pre-ep)
				(if
					; NOTE: this "precond-of" only means Allen time rel (p m),
					; and doesn't do any causation testing.
					; (not (eval-time-prop (list schema-post-ep 'after schema-pre-ep)))
					(eval-time-prop (list schema-post-ep 'precond-of schema-pre-ep))
					; then
					(block check-pre-post

						; (allen-how schema-post-ep schema-pre-ep)

						(setf post (second post-pair))
						(setf pre (second pre-pair))
						; (format t "matching pre ~s and post ~s~%" pre post)
						(setf post-bindings (unify post pre nil schema-post nil))
						(setf pre-bindings (unify pre post nil schema-pre nil))
						;(format t "post-bindings are ~s~%" (ht-to-str post-bindings))
						;(format t "pre-bindings are ~s~%" (ht-to-str pre-bindings))

						(if (or (or (not (null post-bindings)) (not (null pre-bindings))) (equal pre post))
							; then
							(progn
							; (format t "matched pre ~s and post ~s~%" pre post)
							(return-from outer (list post-bindings pre-bindings post pre))
							)
						)
					)
				)
			)
		)
	)

	(return-from outer nil)
)
)

; Find all pairs of schema matches that link up by
; pre/postconds, then find all triples, etc. up to
; k-tuples.
(defun link-matches (matches story k)
(let (match-chains new-match-chains)
(block outer
	(setf match-chains (loop for m in matches collect (list m)))
	(setf new-match-chains (list))

	; for all chains length 2 to k...
	(loop for i from 2 to k do (block k-loop
		; try to extend each chain in the working set
		(loop for match in matches
			; We're going to try inserting this match at the
			; beginning and end of each existing chain independently.
			; The idea is to generate all length-i chains this round.
			do (loop for chain in match-chains do (block extend-loop
				; Don't duplicate length i-1 matches
				(if (< (length chain) (- i 1))
					(return-from extend-loop)
				)
				; Check that the episode of this match isn't already
				; in the chain.
				(if (loop for e in chain thereis (equal (third (second e)) (third (second match))))
					; then
					(return-from extend-loop)
				)
				; First, try to unify the match's postconditions
				; with the chain's preconditions.
				(setf added-before-bindings (link-schemas-onedir match (car chain) story))
				(if (not (null added-before-bindings))
					; then
					; We've added the match at the beginning of this chain.
					(block added-before
						(setf new-match (apply-bindings match (car added-before-bindings)))
						(setf new-chain (apply-bindings chain (second added-before-bindings)))
						(setf new-match-chains
							(append new-match-chains (list (append (list new-match) new-chain))))
					)
				)
				; Next, try to unify the match's preconditions
				; with the chain's postconditions.
				(setf added-after-bindings (link-schemas-onedir (car (last chain)) match story))
				
				(if (not (null added-after-bindings))
					; then
					; We've added the match at the end of this chain.
					(block added-after
						(setf new-chain (apply-bindings chain (car added-after-bindings)))
						(setf new-match (apply-bindings match (second added-after-bindings)))
						(setf new-match-chains
							(append new-match-chains (list (append new-chain (list new-match)))))
					)
				)
		)))

		; all length-i chains have been generated, so we'll add all the chains we've
		; generated to the chain list and continue on
		(setf match-chains (append match-chains new-match-chains))
	))

	; Remove explicit duplicates.
	(setf match-chains (remove-duplicates match-chains
		:test (lambda (c1 c2) (equal (mapcar #'second c1) (mapcar #'second c2)))))

	; Remove subchains.
	(setf deduped-match-chains (list))
	(loop for c1 in match-chains for i from 0 do (block dd-outer
		(loop for c2 in match-chains for j from 0 do (block dd-inner
			(if (equal i j)
				(return-from dd-inner)
			)

			(if (has-subseq-pred
					(mapcar #'second c2)
					(mapcar #'second c1)
					; Two chains of schema headers are equal if, for each header
					; of each chain sharing the same index, those headers are equal
					; modulo a successful variable unification.
					(lambda (l1 l2)
						(and
							(listp l1) (listp l2) (equal (length l1) (length l2))
							(loop for e1 in l1 for e2 in l2
								always (equal-with-unification e1 e2)
							)
						)
					)
				)
				; then
				(return-from dd-outer)
			)
		))

		(setf deduped-match-chains
			(append deduped-match-chains (list c1)))

		)
	)

	(setf match-chains deduped-match-chains)

	(return-from outer match-chains)
)
)
)

; mk-chain-schema takes a chain of schemas, linked by their pre-
; and post-conditions, and creates a superordinate schema with
; the chained schemas as steps.
(defun mk-chain-schema (chain)
(block outer
	(setf comp-preds (loop for m in chain collect (prop-pred (car (second m)))))
	(setf comp-words (loop for cp in comp-preds collect (remove-ext (get-schema-match-name cp) ".V")))
	(setf new-schema-pred (intern (format nil "~s_~s_~s.PR" (car comp-words) (second comp-words) (third comp-words))))
	
	(setf new-schema-args (loop for arg in
		(loop for m in chain append (cddr (car (second m))))
		 if (symbolp arg) collect arg))
	(setf new-schema-args (remove-duplicates new-schema-args :test #'equal))
	(setf new-schema-header (append (list (car (car (second (car chain))))) (list new-schema-pred) new-schema-args))

	(setf new-schema (list 'epi-schema (list new-schema-header '** '?e) (list ':Steps)))

	(loop for m in chain
		do (setf new-schema (add-constraint-with-const new-schema ':Steps (car (second m)) (third (second m))))
	)

	(setf new-es (loop for m1 in chain for m2 in (cdr chain)
		do (setf new-schema (add-constraint new-schema ':Episode-relations
			(list (third (second m1)) 'before (third (second m2)))
		))
	))



	(setf new-schema (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants new-schema)))))

	(setf all-rcs (list))
	(setf new-pres (list))
	(setf new-posts (list))

	; If we have matches embedded as steps, we're going to move their role constraints
	; and pre/postconditions into the embedding schema. This is largely for clarity and
	; display purposes, and can be skipped if the embedded schemas retain their unique
	; match names.
	(loop for st in (section-formulas (get-section new-schema ':Steps))
		for i from 0
		do (block inv-loop
			(if (not (invokes-schema? (second st)))
				(return-from inv-loop)
			)
			(setf inv-pair (expand-nested-schema st new-schema))
			(setf inv-schema (apply-bindings (car inv-pair) (second inv-pair)))
			(setf except (loop for k  being the hash-keys of (second inv-pair) collect k))
			(setf deduped-schema (second (uniquify-shared-vars-except new-schema (car inv-pair) except)))
			(setf deduped-schema (apply-bindings deduped-schema (second inv-pair)))

			(if (equal i 0)
				(setf new-pres (loop for pre in (section-formulas (get-section deduped-schema ':Preconds)) collect (second pre)))
			)
			(setf new-posts (loop for post in (section-formulas (get-section deduped-schema ':Postconds)) collect (second post)))

			(setf rcs (loop for rc in (section-formulas (get-section deduped-schema ':Roles))
				collect (second rc)
			))
			(setf rcs (remove-duplicates rcs :test #'equal))
			(setf rcs (loop for rc in rcs if (loop for v in (get-elements-pred rc #'varp) always (has-element new-schema v)) collect rc))
			(setf rcs (sort rcs (lambda (a b) (< (sxhash (car a)) (sxhash (car b))))))
			(setf all-rcs (append all-rcs rcs))
		)
	)

	(setf deduped-rcs (remove-duplicates all-rcs :test #'equal))
	(setf unsubsumed-rcs (list))
	(loop for rc1 in deduped-rcs do (block ddp
		(if (loop for rc2 in deduped-rcs never (and (not (equal rc1 rc2)) (subsumes (prop-pred rc1) (prop-pred rc2))))
			(setf unsubsumed-rcs (append unsubsumed-rcs (list rc1)))
		)
	))

	(loop for rc in unsubsumed-rcs
		do (setf new-schema (add-constraint new-schema ':Roles rc))
	)
	(loop for pre in new-pres
		do (setf new-schema (add-constraint new-schema ':Preconds pre)))
	(loop for post in new-posts
		do (setf new-schema (add-constraint new-schema ':Postconds post)))

	(setf new-schema-name (create-from-match new-schema))
	(setf new-schema (eval new-schema-name))

	(setf new-schemas (append new-schemas (list new-schema)))
	(setf new-schema-names (append new-schema-names (list new-schema-name)))
	(return-from outer new-schema)
)
)
