(require :sb-sprof)

(declaim (sb-ext:muffle-conditions cl:warning))

(setf *random-state* (make-random-state t))

(load "norm-schema-util.lisp")
(load "norm-protoschemas.lisp")
(load "norm-stories.lisp")
(load "norm-unify.lisp")
(load "norm-match.lisp")
(load "real_util.lisp")
(load "norm-time.lisp")
(load "parsed-stories.lisp")
(load "dev-frs.lisp")
(load "monkey-processed.lisp")
(load "norm-link.lisp")
(load "dev-story-sents.lisp")
(load "simple_stories.lisp")
(load "schema-parser.lisp")

;(setf kite-gen-schema (match-story-to-schema *KITE-STORY* travel.v t))
;(print-schema (car kite-gen-schema))

; (setf story *PARSED-MONKEY-STORY*)
(setf *STORY* (car *DEV-FRS*))
; (setf story *MONKEY-STORY*)
;(setf story *PARSED-STORY-1*)



(defparameter *enable-template*
'(epi-schema (() ** ?e)
)
)



(defparameter *NUM-SHUFFLES* 30)
(defparameter *TOP-K* 5)
(defparameter *GENERALIZE* nil)
(defparameter *RUN-MATCHER* t)

; (defparameter *ALL-SCHEMAS-PLAYGROUND* *PROTOSCHEMAS*)
(defparameter *ALL-SCHEMAS-PLAYGROUND* (list 'do_action_to_enable_action.v 'receiving_verb.? 'eat.v))


(defun gen-clean (schema)
	(rename-constraints (sort-steps (generalize-schema-constants schema)))
)

(defun run-matcher (story schemas)
(block outer
	;(setf rm-result nil)
	;(sb-sprof:with-profiling (:max-samples 10000
	;						  :max-depth 3
	;						  :mode :alloc
	;						  :report :graph)
	;	(setf rm-result (uninstrumented-run-matcher story schemas)))
	;(return-from outer rm-result)
	(return-from outer (uninstrumented-run-matcher story schemas))
)
)

(defun uninstrumented-run-matcher (story schemas)

(block outer

;(format t "story:~%")
;(loop for sent in story
;	do (format t "	~s~%~%" sent))

;(format t "word preds: ~s~%" (get-word-preds story))

; (format t "protoschemas are ~s~%" *PROTOSCHEMAS*)

; Preload all Wordnet hypernym ladders for the
; story and for all schemas in two big batch
; calls
; (batch-cache-preload-wordnet-hyps (get-single-word-preds story))
; (setf all-schema-words (list))
; (loop for schema in *PROTOSCHEMAS*
	;do (setf all-schema-words (union all-schema-words (get-word-preds (eval schema)) :test #'equal))
; )
; (batch-cache-preload-wordnet-hyps all-schema-words)

(setf best-schemas (mapcar (lambda (x) (schema-pred x)) (top-k-schemas (get-single-word-preds story) (mapcar #'eval *PROTOSCHEMAS*) *TOP-K*)))
; (format t "best schemas are ~s~%" best-schemas)

(load-story-time-model story)

(setf matches (make-hash-table :test #'equal))
(setf match-scores (make-hash-table :test #'equal))

;(format t "scores:~%")
;(loop for sc in scores do (format t "	~s~%" (- (car sc) (second sc))))
(if *RUN-MATCHER*
;(loop for i from 1 to 10 do 
(loop for protoschema in best-schemas do (block match-proto
	;(if (not (equal protoschema 'do_action_to_enable_action.v))
		; then
	;	(return-from match-proto)
	;)

	(loop for best-match-res-pair in (top-k-story-schema-matches story (eval protoschema) *NUM-SHUFFLES* *GENERALIZE* 3) do (block process-each

	; (setf best-match-res-pair (best-story-schema-match story (eval protoschema) *NUM-SHUFFLES* *GENERALIZE*))
	(setf best-match-res (car best-match-res-pair))
	(setf best-score (car best-match-res-pair))
	(setf best-match (second best-match-res-pair))
	(setf best-bindings (third best-match-res-pair))
	; (print-schema best-match)
	; (format t "deduped:~%")
	(if (and (schema? best-match) (not (equal '(0 0) best-score)))
		(progn
			; (format t "best match for protoschema ~s (score ~s):~%~%" protoschema best-score)
			; (format t "best match schema is ~s~%" (schema-name best-match))
			; (format t "best match for protoschema ~s (score ~s):~%~%" protoschema best-score)

			(setf match (dedupe-sections best-match))
			; (setf match (apply-bindings (eval protoschema) best-bindings))

			; (print-schema match)
			; (format t "match: ~s~%" (car (second match)))
			; (format t "header is ~s~%" (second match))
			; (format t "additional rigid constraints:~%")
			(loop for k being the hash-keys of best-bindings
				do (if (not (member k (car (second (eval protoschema))) :test #'equal))
					; then
					; CHANGE TO FORMAT T TO RE-ENABLE
					(format nil "	~s~%" (list (list (var-to-sk-fn k) (third (second (eval protoschema)))) '= (gethash k best-bindings)))
				)
			)
			; (print-schema (gen-clean match))
			; (format t "~%~%~%")

			(setf (gethash protoschema matches) (append (gethash protoschema matches) (list match)))
			(setf (gethash protoschema match-scores) (append (gethash protoschema match-scores) (list best-score)))
		)
	)
	))

	; (format t "bindings: ~s~%" (ht-to-str best-bindings))

	;(loop for var being the hash-keys of best-bindings do (block binding-loop
	;	(format 
	;))
))
;)
)

	(return-from outer (loop for k being the hash-keys of matches append
		(loop for match in (gethash k matches)
				for match-score in (gethash k match-scores)
			collect (list match match-score))
		; (list (gethash k matches) (gethash k match-scores))
	))

)
)

(defun link-two-matches (match1 match2 story)
(let (new-match1 new-match2)
(block outer
	; don't link two things that have the same episode;
	; they don't have a causal relationship!
	(if (equal (third (second match1)) (third (second match2)))
		; then
		(return-from outer nil)
	)

	(setf link-bindings (link-schemas-onedir match1 match2 story))
	(if (null link-bindings)
		; then
		(return-from outer nil)
	)

	; (setf new-match1 (apply-bindings match1 link-bindings))
	; (setf new-match2 (apply-bindings match2 link-bindings))

	(return-from outer link-bindings)

)
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
				; (format t "considering match ~s with chain ~s~%" (second match) (mapcar (lambda (x) (second x)) chain))

				; Don't duplicate length i-1 matches
				(if (< (length chain) (- i 1))
					(return-from extend-loop)
				)

				; (format t "passed duplication check~%")

				; Check that the episode of this match isn't already
				; in the chain.
				(if (loop for e in chain thereis (equal (third (second e)) (third (second match))))
					; then
					(return-from extend-loop)
				)

				; (format t "passed thereis check~%")

				; First, try to unify the match's postconditions
				; with the chain's preconditions.
				(setf added-before-bindings (link-two-matches match (car chain) story))
				; (format t "finished before call~%")
				(if (not (null added-before-bindings))
					; then
					; We've added the match at the beginning of this chain.
					(block added-before
						; (format t "added ~s before ~s~%" (second match) (second (car chain)))
						(setf new-match (apply-bindings match (car added-before-bindings)))
						(setf new-chain (apply-bindings chain (second added-before-bindings)))
						(setf new-match-chains (append new-match-chains (list (append (list new-match) new-chain))))
					)
				)
				; (format t "finished before check~%")

				; Next, try to unify the match's preconditions
				; with the chain's postconditions.
				(setf added-after-bindings (link-two-matches (car (last chain)) match story))
				; (format t "finished after call~%")
				(if (not (null added-after-bindings))
					; then
					; We've added the match at the end of this chain.
					(block added-after
						; (format t "added ~s after ~s~%" (car (second match)) (car (second (car (last chain)))))
						(setf new-chain (apply-bindings chain (car added-after-bindings)))
						(setf new-match (apply-bindings match (second added-after-bindings)))
						; (setf new-match-chains (append new-match-chains (list (append (list new-match) new-chain))))
						(setf new-match-chains (append new-match-chains (list (append new-chain (list new-match)))))
					)
				)
				; (format t "finished after check~%")
		)))

		; all length-i chains have been generated, so we'll add all the chains we've
		; generated to the chain list and continue on
		(setf match-chains (append match-chains new-match-chains))
	))

	; Remove explicit duplicates.
	(setf match-chains (remove-duplicates match-chains :test (lambda (c1 c2) (equal (mapcar #'second c1) (mapcar #'second c2)))))

	; Remove subchains.
	(setf deduped-match-chains (list))
	(loop for c1 in match-chains for i from 0 do (block dd-outer
		; (format t "considering chain ~s~%" (mapcar #'second c1))
		(loop for c2 in match-chains for j from 0 do (block dd-inner
			(if (equal i j)
				(return-from dd-inner)
			)

			;(if (has-subseq (mapcar #'second c2) (mapcar #'second c1))
				; then
				; (format t "is ~s a subchain of ~s? ~s~%" (mapcar #'second c1) (mapcar #'second c2) (has-subseq (mapcar #'second c2) (mapcar #'second c1)))
			;)

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

		; (format t "	adding~%")
		(setf deduped-match-chains
			(append deduped-match-chains (list c1)))

		)
	)

	(setf match-chains deduped-match-chains)

	(return-from outer match-chains)
)
)
)

(defun mk-chain-schema (chain)
(block outer
	(setf comp-preds (loop for m in chain collect (prop-pred (car (second m)))))
	(setf comp-words (loop for cp in comp-preds collect (remove-ext (get-schema-match-name cp) ".V")))
	(setf new-schema-pred (intern (format nil "~s_~s_~s.PR" (car comp-words) (second comp-words) (third comp-words))))
	
	(setf new-schema-args (loop for arg in
		; (append (cddr (car (second match1))) (cddr (car (second match2))) (cddr (car (second match3))))
		(loop for m in chain append (cddr (car (second m))))
		 if (symbolp arg) collect arg))
	(setf new-schema-args (remove-duplicates new-schema-args :test #'equal))
	(setf new-schema-header (append (list (car (car (second (car chain))))) (list new-schema-pred) new-schema-args))

	(setf new-schema (list 'epi-schema (list new-schema-header '** '?e) (list ':Steps)))

	; (setf new-schema (add-constraint new-schema ':Steps (list 'not (list (car (car (second match2))) (list 'can.md (cdr (car (second match2))))))))
	; (setf new-schema (add-constraint-with-const new-schema ':Steps (car (second match1)) (third (second match1))))
	; (setf new-schema (add-constraint new-schema ':Steps (list (car (car (second match2))) (list 'can.md (cdr (car (second match2)))))))
	; (setf new-schema (add-constraint-with-const new-schema ':Steps (car (second match2)) (third (second match2))))
	; (setf new-schema (add-constraint-with-const new-schema ':Steps (car (second match3)) (third (second match3))))
	(loop for m in chain
		do (setf new-schema (add-constraint-with-const new-schema ':Steps (car (second m)) (third (second m))))
	)

	; (setf new-e1 (third (second match1)))
	; (setf new-e2 (third (second match2)))
	; (setf new-e3 (third (second match3)))
	; (setf new-es (loop for m in chain collect (third (second m))))
	(setf new-es (loop for m1 in chain for m2 in (cdr chain)
		; collect (list (third (second m1)) (third (second m2)))
		do (setf new-schema (add-constraint new-schema ':Episode-relations
			(list (third (second m1)) 'before (third (second m2)))
		))
	))



	; (setf new-schema (add-constraint new-schema ':Episode-relations (list new-e1 'before new-e2)))
	; (setf new-schema (add-constraint new-schema ':Episode-relations (list new-e2 'before new-e3)))
	; (setf new-schema (add-constraint new-schema ':Episode-relations (list new-e4 'before new-e3)))
	; (format t "new schema is ~s~%" new-schema)

	(setf new-schema-name (new-schema-match-name (schema-pred new-schema)))
	(setf new-schema (replace-vals (schema-pred new-schema) new-schema-name new-schema))

	(setf new-schemas (append new-schemas (list (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants new-schema)))))))
	(setf new-schema-names (append new-schema-names (list new-schema-name)))
	; (format t "LEARNED NEW SCHEMA (~s): ~s~%" (schema-pred new-schema) act_on.v)
	; (format t "; LEARNED NEW SCHEMA:~%")

	(setf new-schema (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants new-schema)))))

	(setf all-rcs (list))
	(setf new-pres (list))
	(setf new-posts (list))

	(loop for st in (section-formulas (get-section new-schema ':Steps))
		for i from 0
		do (block inv-loop
			(if (not (invokes-schema? (second st)))
				(return-from inv-loop)
			)
			(setf inv-pair (expand-nested-schema st new-schema))
			; (format t "unifying parent invoker ~s with header ~s~%" (second st) (car (second (car inv-pair))))
			(setf inv-schema (apply-bindings (car inv-pair) (second inv-pair)))
			; (format t "embedding: ~s~%" (car (second inv-schema)))
			; (format t "naked: ~s~%" (car (second (car inv-pair))))
			; (format t "bindings:~%")
			; (print-ht (second inv-pair))
			;(setf except (loop for k  being the hash-keys of (second inv-pair) collect (gethash k (second inv-pair))))
			(setf except (loop for k  being the hash-keys of (second inv-pair) collect k))
			; (format t "except: ~s~%" except)
			(setf deduped-schema (second (uniquify-shared-vars-except new-schema (car inv-pair) except)))
			(setf deduped-schema (apply-bindings deduped-schema (second inv-pair)))

			(if (equal i 0)
				(setf new-pres (loop for pre in (section-formulas (get-section deduped-schema ':Preconds)) collect (second pre)))
			)
			(setf new-posts (loop for post in (section-formulas (get-section deduped-schema ':Postconds)) collect (second post)))

			(setf rcs (loop for rc in (section-formulas (get-section deduped-schema ':Roles))
				; do (format t "		~s~%" (second rc))
				collect (second rc)
			))
			(setf rcs (remove-duplicates rcs :test #'equal))
			(setf rcs (loop for rc in rcs if (loop for v in (get-elements-pred rc #'varp) always (has-element new-schema v)) collect rc))
			(setf rcs (sort rcs (lambda (a b) (< (sxhash (car a)) (sxhash (car b))))))
			; (loop for rc in rcs do (format t "	~s~%" rc))
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
	; (format t "unsubsumed RCs:~%")
	; (loop for rc in unsubsumed-rcs do (format t "	~s~%" rc))

	; (setf new-display-schema (copy-list new-schema))
	(loop for rc in unsubsumed-rcs
		do (setf new-schema (add-constraint new-schema ':Roles rc))
	)
	(loop for pre in new-pres
		do (setf new-schema (add-constraint new-schema ':Preconds pre)))
	(loop for post in new-posts
		do (setf new-schema (add-constraint new-schema ':Postconds post)))

	(set (schema-pred new-schema) new-schema)
	(return-from outer new-schema)
)
)



(format t "(setf matches (list))~%")
(format t "(setf chain-matches (list))~%")





(setf new-schemas (list))
(setf new-schema-names (list))

(setf all-matches (list))
; (loop for story in ((lambda (x) (list (first x) (second x) (third x))) *DEV-FRS*)
; (loop for story in (list *MONKEY-PROC-1* *MONKEY-PROC-2*)
; (loop for story in (list *MONKEY-PROC-1*)
; (loop for story in *DEV-FRS*
; (loop for raw-story in (list (fourth *DEV-STORY-SENTS*))
; (loop for raw-story in (subseq *DEV-STORY-SENTS* 0 4)
;(loop for raw-story in '(("These are the little birds." "Their mouths are open." "They are hungry."
; "The mother bird will feed them." "She has a grasshopper in her mouth."
; "If they try to fly, they will fall."))
;(loop for raw-story in *DEV-STORY-SENTS*
(loop for raw-story in (shuffle *ALL-STORY-SENTS*)
		for story-num from 0
	do (block matchblock
		(format t "; story ~s:~%" story-num)
		(loop for line in raw-story
			do (format t "	; ~s~%" line)
		)
		; (format t "'(")
		(setf story 
			(loop for sent in (parse-story raw-story)
				collect (loop for wff in sent
					if (canon-prop? wff) collect wff
					; if (canon-prop? wff) do (format t "~s~%" wff)
				))
		)
		; (format t ")~%")


		; (setf all-matches (append all-matches (run-matcher story *PROTOSCHEMAS*)))
		(setf story-matches (list))
		(setf matchcnt 0)
		(loop for m-pair in (run-matcher story *PROTOSCHEMAS*)
			do (setf matchcnt (+ 1 matchcnt))
			do (block vet-matches
				(setf m (car m-pair))
				(setf score (second m-pair))
				(if (and
						; (or (null (get-section m ':Steps)) (null (section-formulas (get-section m ':Steps))))
						(not (varp (third (second m)))))
					; then
					(setf story-matches (append story-matches (list (list m score))))
					; else
					(if (loop for v in (mapcar #'car (section-formulas (get-section m ':Steps))) thereis (not (varp v)))
						; then
						(setf story-matches (append story-matches (list m)))
						; else
						(progn
						; (format t "ignoring match:~%")
						; (print-schema m)
						)
					)
				)
			)
		)
		; (format t "; ~s matches, ~s valid~%" matchcnt (length story-matches))

		(loop for match in story-matches do (progn
			; (format t "; match: ~s~%" (second match))
			(format t "(setf matches (append matches '( ")
			; (format t "~s~%" (check-constraints match story))
			(format t "~s~%" (second match))
			(print-schema (car match))
			(format t ")))~%")
			;(setf gen-match (generalize-schema-constants match))
			;(setf new-name (new-schema-match-name (schema-pred match)))
			;(setf new-header (list (car (car (second gen-match))) new-name (cdr (car (second gen-match)))))
			;(setf gen-match (set-header gen-match new-header))
			;(format t "gen match: ~s~%" gen-match)

			; NOTE: when we create the generalization, we need to map the constants to the new variable names to create an updated binding list for the new schema. That way, subordinate constraints not in the header can be properly specified with the new variable names. Not an issue for monkey example #1.
		))

		(format t "~%")

		(if (> (length story-matches) 1)
			; then
			(block find-chains
				(setf chains (link-matches (mapcar #'car story-matches) story 3))
				(if (loop for chain in chains thereis (> (length chain) 1))
					; then
					(format t "; found chains:~%")
				)
				(loop for chain in chains
					for i from 0
						if (> (length chain) 1)
						do (block chain-block
							(format t "; 	chain ~s:~%" i)
							(loop for e in chain
								do (format t ";		~s~%" (second e))
							)

							(setf chain-schema (mk-chain-schema chain))
							(format t ";learned chain schema:~%")
							(format t "(setf chain-matches (append chain-matches (list '")
							(print-schema chain-schema)
							(format t ")))~%")
					)
				)
			)
		)

		(if (and nil (> (length story-matches) 1))
			; then
			(loop for match1 in story-matches do
				(loop for match2 in story-matches do
					(loop for match3 in story-matches do
					(block link-block
						; don't link two things that have the same episode;
						; they don't have a causal relationship!
						(if (equal (third (second match1)) (third (second match2)))
							; then
							(return-from link-block)
						)
						(if (equal (third (second match2)) (third (second match3)))
							; then
							(return-from link-block)
						)
	
						(setf link-bindings-1 (link-schemas-onedir match1 match2 story))
						(setf link-bindings-2 (link-schemas-onedir match2 match3 story))
						(if (and (not (null link-bindings-1)) (not (null link-bindings-2)))
							(progn
							; (format t "matched ~s and ~s~%" (third link-bindings) (fourth link-bindings))
							; (format t "post bindings are ~s~%" (ht-to-str (car link-bindings)))
							; (format t "pre bindings are ~s~%" (ht-to-str (second link-bindings)))
							(if (not (null (car link-bindings-1)))
								(setf match1 (apply-bindings match1 (car link-bindings-1)))
							)
							(if (not (null (second link-bindings-1)))
								(setf match2 (apply-bindings match2 (second link-bindings-1)))
							)
							(if (not (null (car link-bindings-2)))
								(setf match2 (apply-bindings match2 (car link-bindings-2)))
							)
							(if (not (null (second link-bindings-2)))
								(setf match3 (apply-bindings match3 (second link-bindings-2)))
							)
							; (format t "~s to enable ~s~%" (car (second match1)) (car (second match2)))
							;(format t "~s~%" match1)
							;(format t "~s~%" match2)
							;(print-schema match1)
							;(print-schema match2)
							;(format t "match1 schema name is ~s~%" (schema-pred match1))
							;(format t "match1 schema is ~s~%" (eval (schema-pred match1)))
							;(format t "match2 schema name is ~s~%" (schema-pred match2))
							;(format t "match2 schema is ~s~%" (eval (schema-pred match2)))
							; (format t "~s schema_name ~s~%" (car (car (second match1))) (remove-duplicates (append (cddr (car (second match1))) (cddr (car (second match2)))) :test #'equal))

							(setf comp-preds (loop for m in (list match1 match2 match3) collect (prop-pred (car (second m)))))
							(setf comp-words (loop for cp in comp-preds collect (remove-ext (get-schema-match-name cp) ".V")))
							(setf new-schema-pred (intern (format nil "~s_~s_~s.PR" (car comp-words) (second comp-words) (third comp-words))))
							
							; (setf new-schema-header (append (list (car (car (second match1))) new-schema-pred)))
							
							; (setf new-schema-header (append (list (car (car (second match1))) new-schema-pred) (remove-duplicates (append (cddr (car (second match1))) (cddr (car (second match2)))) :test #'equal)))
							; (setf new-schema-args (loop for arg in (append (cddr (car (second match1))) (cddr (car (second match2))) (cddr (car (second match3)))) do (format t "arg: ~s~%" arg)))
							(setf new-schema-args (loop for arg in (append (cddr (car (second match1))) (cddr (car (second match2))) (cddr (car (second match3)))) if (symbolp arg) collect arg))
							(setf new-schema-args (remove-duplicates new-schema-args :test #'equal))
							(setf new-schema-header (append (list (car (car (second match1)))) (list new-schema-pred) new-schema-args))

							(setf new-schema (list 'epi-schema (list new-schema-header '** '?e) (list ':Steps)))

							; (setf new-schema (add-constraint new-schema ':Steps (list 'not (list (car (car (second match2))) (list 'can.md (cdr (car (second match2))))))))
							(setf new-schema (add-constraint-with-const new-schema ':Steps (car (second match1)) (third (second match1))))
							; (setf new-schema (add-constraint new-schema ':Steps (list (car (car (second match2))) (list 'can.md (cdr (car (second match2)))))))
							(setf new-schema (add-constraint-with-const new-schema ':Steps (car (second match2)) (third (second match2))))
							(setf new-schema (add-constraint-with-const new-schema ':Steps (car (second match3)) (third (second match3))))

							(setf new-e1 (third (second match1)))
							(setf new-e2 (third (second match2)))
							(setf new-e3 (third (second match3)))
							(setf new-schema (add-constraint new-schema ':Episode-relations (list new-e1 'before new-e2)))
							(setf new-schema (add-constraint new-schema ':Episode-relations (list new-e2 'before new-e3)))
							; (setf new-schema (add-constraint new-schema ':Episode-relations (list new-e4 'before new-e3)))
							; (format t "new schema is ~s~%" new-schema)

							(setf new-schema-name (new-schema-match-name (schema-pred new-schema)))
							(setf new-schema (replace-vals (schema-pred new-schema) new-schema-name new-schema))

							(setf new-schemas (append new-schemas (list (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants new-schema)))))))
							(setf new-schema-names (append new-schema-names (list new-schema-name)))
							(set (schema-pred new-schema) new-schema)
							; (format t "LEARNED NEW SCHEMA (~s): ~s~%" (schema-pred new-schema) act_on.v)
							; (format t "; LEARNED NEW SCHEMA:~%")

							(setf new-schema (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants new-schema)))))
							(setf all-rcs (list))
							(setf new-pres (list))
							(setf new-posts (list))

							(loop for st in (section-formulas (get-section new-schema ':Steps))
								for i from 0
								do (block inv-loop
									(if (not (invokes-schema? (second st)))
										(return-from inv-loop)
									)
									(setf inv-pair (expand-nested-schema st new-schema))
									; (format t "unifying parent invoker ~s with header ~s~%" (second st) (car (second (car inv-pair))))
									(setf inv-schema (apply-bindings (car inv-pair) (second inv-pair)))
									; (format t "embedding: ~s~%" (car (second inv-schema)))
									; (format t "naked: ~s~%" (car (second (car inv-pair))))
									; (format t "bindings:~%")
									; (print-ht (second inv-pair))
									;(setf except (loop for k  being the hash-keys of (second inv-pair) collect (gethash k (second inv-pair))))
									(setf except (loop for k  being the hash-keys of (second inv-pair) collect k))
									; (format t "except: ~s~%" except)
									(setf deduped-schema (second (uniquify-shared-vars-except new-schema (car inv-pair) except)))
									(setf deduped-schema (apply-bindings deduped-schema (second inv-pair)))

									(if (equal i 0)
										(setf new-pres (loop for pre in (section-formulas (get-section deduped-schema ':Preconds)) collect (second pre)))
									)
									(setf new-posts (loop for post in (section-formulas (get-section deduped-schema ':Postconds)) collect (second post)))

									(setf rcs (loop for rc in (section-formulas (get-section deduped-schema ':Roles))
										; do (format t "		~s~%" (second rc))
										collect (second rc)
									))
									(setf rcs (remove-duplicates rcs :test #'equal))
									(setf rcs (loop for rc in rcs if (loop for v in (get-elements-pred rc #'varp) always (has-element new-schema v)) collect rc))
									(setf rcs (sort rcs (lambda (a b) (< (sxhash (car a)) (sxhash (car b))))))
									; (loop for rc in rcs do (format t "	~s~%" rc))
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
							; (format t "unsubsumed RCs:~%")
							; (loop for rc in unsubsumed-rcs do (format t "	~s~%" rc))

							(setf new-display-schema (copy-list new-schema))
							(loop for rc in unsubsumed-rcs
								do (setf new-display-schema (add-constraint new-display-schema ':Roles rc))
							)
							(loop for pre in new-pres
								do (setf new-display-schema (add-constraint new-display-schema ':Preconds pre)))
							(loop for post in new-posts
								do (setf new-display-schema (add-constraint new-display-schema ':Postconds post)))

							(print-schema new-display-schema)
							; (print-schema (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants (eval (schema-pred match1)))))))
							; (print-schema (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants (eval (schema-pred match2)))))))
							; (print-schema (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants new-schema)))))




							(setf flat-schema (merge-schemas new-schema match1))
							(setf flat-schema (merge-schemas flat-schema match2))
							; (print-schema flat-schema)
							(setf flat-schema (clean-do-kas (rename-constraints (sort-steps (dedupe-sections flat-schema)))))
							(setf flat-schema (generalize-schema-constants flat-schema))


							; (print-schema flat-schema)

							)
						)
					))
				)
			)
		)

		; (format t "~%~%")
	)
)


(if nil (block ifnil

; (setf *DBG-TAGS* '(match))
(setf *PROTOSCHEMAS* (append *PROTOSCHEMAS* new-schema-names))
; (setf *PROTOSCHEMAS* (append *PROTOSCHEMAS* (list 'ACT_ON.V)))
; (format t "phase 2 schemas: ~s~%" *PROTOSCHEMAS*)

		(setf next-story 
			(loop for sent in (parse-story (second *DEV-STORY-SENTS*))
				collect (loop for wff in sent
					if (canon-prop? wff) collect wff
					; if (canon-prop? wff) do (format t "~s~%" wff)
				))
		)
		; (format t "story 2: ~s~%" (second *DEV-STORY-SENTS*))
		(load-story-time-model next-story)

		(setf story-matches nil)
		; (setf *PROTOSCHEMAS* (list 'ACT_ON.V))
		(loop for m-pair in (run-matcher next-story (list 'ACT_ON.V))
			do (block vet-matches
				(setf m (car m-pair))
				(setf score (second m-pair))
				(if (and
						(or (null (get-section m ':Steps)) (null (section-formulas (get-section m ':Steps))))
						(not (varp (third (second m))))
					)
					; then
					(setf story-matches (append story-matches (list (list m score))))
					; else
					(if (loop for v in (mapcar #'car (section-formulas (get-section m ':Steps))) thereis (not (varp v)))
						; then
						(setf story-matches (append story-matches (list (list m score))))
					)
				)
			)
		)
		; (format t "story matches: ~s~%" story-matches)
		(format t "story matches:~%")
		(loop for sm in story-matches
			do (format t "~s confirmed, ~s contradiction~a:~%" (car (second sm)) (second (second sm)) (if (= 1 (second (second sm))) "" "s"))
			do (print-schema (car sm))
		)

(setf act-on-match (car (car story-matches)))

;(format t "got act on match:~%")
;(print-schema act-on-match)

(expand-nested-schemas act-on-match next-story)


))


; (ahow)
;(format t "~s~%" (eval-time-prop '(E1.SK BEFORE.PR E3.SK)))
;(format t "~s~%" (eval-time-prop '(E3.SK BEFORE.PR E2.SK)))


