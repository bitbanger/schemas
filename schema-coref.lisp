(load "ll-load.lisp")

(ll-load "ll-util.lisp")
(ll-load "schema-util.lisp")

; "Verbs of search, desire, and expectation, exhibit all three intensionality effects."
; - encyclopedia.com
(defparameter *INTENSIONAL-TRANSITIVE-VERBS* '(
	; search
	SEEK.V
	SEARCH.V
	; TODO: "look for", i.e. only if the argument is in the "for" modifier

	; desire
	WANT.V
	NEED.V
	DESIRE.V

	; expectation
	BELIEVE.V
	THINK.V
	EXPECT.V
))

; Keep a cheap global LRU cache of size 1, since we'll
; be calling coreference twice in a row: once just for
; tokenization when generating the ULFs, and once when
; actually resolving coreference in the EL postprocessing
; stage. (TODO: just do coref in the ULF stage?)
(defparameter *COREF-CACHE* (list nil nil))

(ldefun coref-pairs-and-toks (text)
(block outer
	(if (equal (rechash text) (car *COREF-CACHE*))
		; then
		(return-from outer (second *COREF-CACHE*))
	)

	(setf retval nil)

	; (this file is being run from the parent directory, so we prepend the PWD to the call)
	(let ((strm (sb-ext:process-output (sb-ext:run-program (concat-strs (format nil "~a" (schema-root-dir)) "/allen-coref/allen_coref.sh") (list text) :output :stream :wait nil))))
		(loop for line = (read-line strm nil)
			while line
			do (progn
				(setf retval (read-from-string line))
				(setf *COREF-CACHE* (list (rechash text) retval))
				(return-from outer retval)
			)
		)
	)
)
)

(ldefun coref-pairs (text)
	(car (coref-pairs-and-toks text))
)

(ldefun coref-toks (text)
	(second (coref-pairs-and-toks text))
)

(ldefun max-word-tag (el)
	(apply #'max (mapcar #'idx-tag-num (get-elements-pred el (lambda (x) (and (symbolp x) (not (null (idx-tag-num x))))))))
)

; This replaces a given word at a sentence index with
; the same word, plus "of it"; re-runs the coreference
; analyzer on the modified istory; and then modifies
; the original coreference clusters such that the given
; noun is treated as the "it".
; So, for example, "I had a phone, but I wanted a new one"
; would become "I had a phone, I wanted a new one of it",
; the coreference resolver would link "it" to "phone",
; and then the coreference cluster for "it" would be added
; back in, with its index replaced with the index for "one".
(ldefun one-coref-clusters (txt-sents el-sents tagged-one)
(block outer
	(setf one-txt-sent nil)

	; Get the text sentence containing the "ONE" to
	; resolve.
	(setf start-tag-offset 0)
	(loop for el-sent in el-sents
			for txt-sent in txt-sents
		if (null one-txt-sent)
		do (block find-one
			; Check for the ONE.
			(if (not (null (has-element el-sent tagged-one)))
				; then
				(setf one-txt-sent txt-sent)
				; else
				; Mark the max tag of this sentence
				; block so we can adjust the
				; word index down by the cumulative
				; tag index.
				; (setf start-tag-offset (max-word-tag el-sent))
				(setf start-tag-offset (+ start-tag-offset (+ (length (split-str txt-sent " ")) 1)))
			)
		)
	)

	(if (null one-txt-sent)
		(return-from outer nil)
	)

	(setf one-tag-num (idx-tag-num tagged-one))

	; Get the text token of the "ONE" out.
	(setf one-idx (- one-tag-num start-tag-offset))

	(setf sent-spl (split-str one-txt-sent " "))

	(setf one-of-it (replace-first-substr (nth one-idx sent-spl) "one" "one of it"))

	(setf one-of-it-sent (join-str-list " " (append (subseq sent-spl 0 one-idx) (list one-of-it) (subseq sent-spl (+ 1 one-idx) (length sent-spl)))))


	(setf one-of-it-story (replace-vals one-txt-sent one-of-it-sent txt-sents))

	; Run coreference.
	(setf one-of-it-clusters (coref-pairs (join-str-list " " one-of-it-story)))

	(dbg 'coref "Reducing idx numbers for things with tags > ~d~%" one-tag-num)

	; Anything with an index greater than one-tag-num
	; needs to have its index reduced by 2. This will
	; make the "it" alias with "one", and correct any
	; tags after that point.
	(let ((big-tags (dedupe (get-elements-pred one-of-it-clusters (lambda (x) (and (numberp x) (> x one-tag-num)))))))
		(loop for big-tag in (sort big-tags #'<)
			do (setf one-of-it-clusters
				(replace-vals big-tag (- big-tag 2) one-of-it-clusters))
		)
	)

	; Return the clusters that include the "one"/"it",
	; but don't include those pairs, since we'll use
	; these to look up individuals in the original
	; sentence's cluster map later.
	(return-from outer
		(let ((one-it-pair (list one-tag-num one-tag-num)))
			(loop for cluster in one-of-it-clusters
				if (contains cluster one-it-pair)
					collect (remove one-it-pair cluster :test #'equal)
			)
		)
	)
)
)

(ldefun get-determiner-from-constraint-set (cset)
(let ((det))
(block outer
	(setf det (loop for c in cset
							if (has-element c 'HAS-DET.PR)
								collect c))

	(if (> (length det) 1)
		; then
		(format t "got ~d determiners in constraint set ~s~%" (length det) orig-one-constraints)
		; else
		(if (equal (length det) 0)
			; then
			(format t "got no determiners in constraint set ~s~%" orig-one-constraints)
			; else
			(setf det (car det))
		)
	)

	(return-from outer det)
)
)
)

(ldefun resolve-coreference-return-all (txt-sents el-sents)
(block outer
	(setf needs-res (remove-duplicates (get-elements-pred el-sents (lambda (x)
		(let ((spl (split-str (format nil "~s" x) "$")))
			(and
				(canon-individual? x)
				(and
					(equal 3 (length spl))
					(num-str? (second spl)))
			)
		)
	)) :test #'equal))
	(dbg 'coref  "got initial parse ~s~%" el-sents)
	(setf needs-res-numbers (loop for e in needs-res collect (parse-integer (second (split-str (format nil "~s" e) "$")))))
	(setf needs-res-pairs (loop for e1 in needs-res for e2 in needs-res-numbers collect (list e1 e2)))
	(dbg 'coref "individuals that need resolving: ~s~%" needs-res-pairs)


	; INTERMISSION: sometimes, multiple unique Skolem constants will have been
	; derived from the same word, due to duplication in AND-splitting rules, etc.
	; (e.g. "Dad and I sit in a room" -> "Dad sits in a room and I sit in a room" -> two "room" constants
	; So, if we have two Skolem constants from the same word index number, we can merge them.
	; (We'll assume they won't be Skolemized if they could be under a universal quantifier.)

	(setf same-skolems (make-hash-table :test #'equal))
	(loop for sk in needs-res-pairs
		if (lex-skolem? (car sk))
			; then
			do (setf (gethash (second sk) same-skolems) (append (gethash (second sk) same-skolems) (list (car sk))))
	)
	(loop for k being the hash-keys of same-skolems
		if (> (length (gethash k same-skolems)) 1)
			; then
			; do (format t "word ~s has skolems ~s~%" k (gethash k same-skolems))
			do (progn
				; pick the first one (arbitrarily)
				(setf rep-skol (car (gethash k same-skolems)))
				(loop for old-sk in (cdr (gethash k same-skolems))
					do (setf el-sents (replace-vals old-sk rep-skol el-sents))
				)
			)
	)

	; END INTERMISSION


	;(format t "EL conversion, pre-coref:~%")
	;(loop for sent in el-sents
	;	do (format t "	~s~%" sent)
	;)

	(setf clusters (coref-pairs (join-str-list " " txt-sents)))
	(setf coref-pair-to-ind (make-hash-table :test #'equal))
	(setf claimed-inds (list))
	(setf all-coref-pairs (loop for o in clusters append o))
	(setf all-coref-pairs (sort all-coref-pairs (lambda (x y) (> (- (second y) (car y)) (- (second x) (car x))))))
	(dbg 'coref "needs-res-pairs: ~s~%" needs-res-pairs)
	(dbg 'coref "all coref pairs: ~s~%" all-coref-pairs)
	(loop for acp in all-coref-pairs
		do (loop for ind-pair in needs-res-pairs
			; do (dbg 'coref "	considering ind ~s for pair ~s~%" ind-pair acp)
			do (if (and (in-span (second ind-pair) acp) (null (member (car ind-pair) claimed-inds :test #'equal)))
				; then
				(progn
					; (dbg 'coref "		ind ~s accepted~%" ind-pair)
					(setf (gethash acp coref-pair-to-ind) (car ind-pair))
					(setf claimed-inds (append claimed-inds (list (car ind-pair))))
				)
			)
		)
	)



	; Find all "one"s, as in "a new ones", in the parse,
	; and resolve the individuals to whose predicates
	; they're referring.

	; Build a map to relate the ONE predicates to their Skolemizations.
	(setf needs-res-ones-to-inds (make-hash-table :test #'equal))
	(setf needs-res-ones
		(loop for sent in el-sents
			append (loop for phi in sent
				if (and
					(equal 2 (length phi))
					(and (symbolp (car phi)) (symbolp (second phi)))
					(not (null (idx-tag-num (second phi))))
					(or
						(equal 'ONE.D (remove-idx-tag (second phi)))
						(equal 'ONE.N (remove-idx-tag (second phi)))
					)
				)
					; then
					collect (second phi)
					do (setf (gethash (second phi) needs-res-ones-to-inds) (car phi))
			)
		)
	)

	(dbg 'coref "needs res ones: ~s~%" needs-res-ones)

	; TODO: do all "one" => "one of it" replacements in same pass?
	; Or would that change results?
	(setf coref-clusters-to-ones (make-hash-table :test #'equal))
	(setf ones-to-coref-clusters (make-hash-table :test #'equal))
	(loop for one in needs-res-ones
		do (block one-loop1
			(loop for cluster in (one-coref-clusters txt-sents el-sents one)
				do (block one-loop2
					(setf clean-cluster (remove nil (loop for pair in cluster
						; replace numerical pairs with individuals, where applicable
						collect (block replace-pair-ind
							(setf ind-replaced-pair (gethash pair coref-pair-to-ind))
							(if (null ind-replaced-pair)
								(setf ind-replaced-pair pair)
							)

							(if (contains claimed-inds ind-replaced-pair)
								; then
								(return-from replace-pair-ind ind-replaced-pair)
								; else
								(return-from replace-pair-ind nil)
							)
						)
					) :test #'equal))

					; Add this "one" to the list of "one"s covered by this
					; cluster
					(setf (gethash clean-cluster coref-clusters-to-ones)
						(append
							(gethash clean-cluster coref-clusters-to-ones)
							(list one)
						)
					)
					(setf (gethash one ones-to-coref-clusters)
						(append
							(gethash one ones-to-coref-clusters)
							(list clean-cluster)
						)
					)

					; (format t "cluster ~s covers one ~s~%" clean-cluster one)
						
				)
			)
		)
	)

	(dbg 'coref "coref clusters: ~s~%" clusters)

	(dbg 'coref "coref pair to ind map: ~s~%" (ht-to-str coref-pair-to-ind))
	(loop for cp being the hash-keys of coref-pair-to-ind
		do (setf clusters (replace-vals cp (gethash cp coref-pair-to-ind) clusters ))
	)

	(setf ones-to-clusters-map (make-hash-table :test #'equal))

	(setf rep-names (list))

	(loop for orig-cluster in clusters
		for i from 0
		do (block alias-block
			; We may end up with spans not mapped to individuals if
			; some coreference resolution is done by pre-existing
			; parser rules.
			(setf cluster (loop for e in orig-cluster if (member e claimed-inds :test #'equal) collect e))

			(setf pronouns (loop for e in cluster if (lex-pronoun? e) collect e))
			(setf non-pronouns (loop for e in cluster if (not (lex-pronoun? e)) collect e))
			; (dbg 'coref "cluster ~d, pronouns ~s, others ~s~%" i pronouns non-pronouns)
			(dbg 'coref "cluster was ~s~%" cluster)
			(setf rep-name (car (append non-pronouns pronouns)))
			(setf agent-constrs (list))
			(if (lex-pronoun? rep-name)
				; then
				(progn
				(setf old-rep-name (intern (concat-strs (car (split-str (string rep-name) ".")) ".PRO")))
				(setf rep-name (new-skolem! (intern (concat-strs (car (split-str (format nil "~s" rep-name) ".")) "-PRO"))))
				(dbg 'coref "picking new rep name ~s for pronoun ~s~%" rep-name old-rep-name)
				(if (personal-pronoun? old-rep-name)
					; then
					(progn (setf agent-constrs (append agent-constrs (list (list rep-name 'AGENT.N)))) (dbg 'coref "adding constraint ~s~%" (list rep-name 'AGENT.N)))
					; else
					(if (has-prefix? old-rep-name "IT$")
						; then
						(setf agent-constrs (append agent-constrs (list (list rep-name 'OBJECT.N))))
					)
				)
				)
			)
			(if (not (null agent-constrs))
				; then
				(setf el-sents (append el-sents (list agent-constrs)))
			)

			; (format t "picking representative name ~s~%" rep-name)
			(setf rep-names (append rep-names (list rep-name)))
			(loop for e in cluster
				if (not (equal e rep-name))
					do (setf el-sents (replace-vals e rep-name el-sents))
			)
		)
	)

	; Get story constraints for all "one"s
	(loop for one being the hash-keys of ones-to-coref-clusters
		do (block handle-one
			; The original thing this was Skolemized as,
			; e.g. ONE$3$1.SK
			(setf orig-one-ind (gethash one needs-res-ones-to-inds))

			; All co-referring individuals
			(setf coref-one-inds (dedupe (loop for cluster in (gethash one ones-to-coref-clusters) append cluster)))

			; (setf one-inds (append (list orig-one-ind) coref-one-inds))

			; (format t "one ~s has individuals ~s~%" one one-inds)

			; Preprocess the story to extract constraint formulas
			; for the individuals.
			(setf clean-story (filter-invalid-wffs (clean-idx-tags (linearize-story el-sents))))

			; Collect all constraint formulas for all co-referring individuals...
			(setf coref-one-constraints (mapcar #'prop-pred-with-post-args (loop for ind in coref-one-inds
				append (story-select-term-constraints clean-story (list (remove-idx-tag ind)))
			)))

			; ...including itself...
			(setf orig-one-constraint-formulas (story-select-term-constraints clean-story (list (remove-idx-tag orig-one-ind))))
			(setf orig-one-constraints (mapcar #'prop-pred-with-post-args orig-one-constraint-formulas))
			(setf one-constraints (append coref-one-constraints orig-one-constraints))

			; ...but excluding the ONE.N constraint.
			; ...
			; And the HAS-DET constraint the original
			; sentence had with ONE.N, for rendering back
			; to English.
			; ...
			; However, we'll run this first to log the
			; constraints we can remove at the end,
			; including the ONE.N constraint.
			(setf cullable-constraints orig-one-constraints)

			; Remove the ONE.N predicate from the new combo predicate.
			(setf one-constraints (remove '(ONE.N) one-constraints :test #'equal))

			; Remove the determiner used by the original sentence for "one",
			; if it conflicts with the new determiner.
			(setf orig-one-det (get-determiner-from-constraint-set orig-one-constraints))
			(setf coref-one-det (get-determiner-from-constraint-set coref-one-constraints))

			(if (not (equal orig-one-det coref-one-det))
				; then
				(setf one-constraints (remove coref-one-det one-constraints :test #'equal))
			)

			(setf new-one-pred
				(if (equal 1 (length one-constraints))
					; then
					(car one-constraints)
					; else
					(lambdify-preds! one-constraints)
				)
			)
			
			; Remove the old constraints from the story.
			(setf el-sents
				(loop for sent in el-sents
					collect (loop for wff in sent
						if (not (contains orig-one-constraint-formulas (clean-idx-tags wff)))
							; then
							collect wff
					)
				))

			; Replace all instances of the original ONE
			; Skolem with a reification of the new
			; composite predicate.
			; If the determiner is "a" or "an" and the verb is an
			; intensional transitive verb, then we reify the predicate.
			; Otherwise, we Skolemize it.
			(setf has-a-determiner (loop for wff in orig-one-constraint-formulas
				thereis (and
							(equal 'HAS-DET.PR (prop-pred wff))
							(or
								(equal 'A.D (second (car (prop-post-args wff))))
								(equal 'AN.D (second (car (prop-post-args wff))))
							)
					)
			))

			(setf has-it-verb (loop for sent in el-sents
				thereis (loop for wff in sent
					thereis (and
							(canon-charstar? wff)
							(contains (prop-post-args (car wff)) orig-one-ind)
							(contains *INTENSIONAL-TRANSITIVE-VERBS* (remove-idx-tag (prop-pred (car wff))))
						)
					)
			))

			(if (and has-a-determiner has-it-verb)
				; then
				; reify the predicate instead of skolemizing it
				(setf el-sents (replace-vals orig-one-ind (list 'K new-one-pred) el-sents))
				; else
				(progn
				; TODO: actually Skolemize
				(format t "Individual ~s needs Skolemization~%" orig-one-ind)
				(setf el-sents (replace-vals orig-one-ind (list 'K new-one-pred) el-sents))
				)
			)

			

		)
	)

	(return-from outer (list el-sents clusters rep-names))
)
)

(ldefun resolve-coreference (txt-sents el-sents)
	(car (resolve-coreference-return-all txt-sents el-sents))
)
