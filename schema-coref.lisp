(load "ll-load.lisp")

(ll-load "ll-util.lisp")
(ll-load "schema-util.lisp")

(defun coref-pairs (text)
(block outer
	; (this file is being run from the parent directory, so we prepend the PWD to the call)
	(let ((strm (sb-ext:process-output (sb-ext:run-program (concat-strs (format nil "~a" *ROOT-PATH*) "/allen-coref/allen_coref.sh") (list text) :output :stream :wait nil))))
		(loop for line = (read-line strm nil)
			while line
			do (return-from outer (read-from-string line))
		)
	)
)
)

(defun max-word-tag (el)
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
(defun one-coref-clusters (txt-sents el-sents tagged-one)
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

(defun resolve-coreference (txt-sents el-sents)
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
	; (format t "got initial parse ~s~%" el-sents)
	(setf needs-res-numbers (loop for e in needs-res collect (parse-integer (second (split-str (format nil "~s" e) "$")))))
	(setf needs-res-pairs (loop for e1 in needs-res for e2 in needs-res-numbers collect (list e1 e2)))
	; (format t "individuals that need resolving: ~s~%" needs-res-pairs)


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
			; do (format t "considering ind ~s for pair ~s~%" ind-pair acp)
			do (if (and (in-span (second ind-pair) acp) (null (member (car ind-pair) claimed-inds :test #'equal)))
				; then
				(progn
					(setf (gethash acp coref-pair-to-ind) (car ind-pair))
					(setf claimed-inds (append claimed-inds (list (car ind-pair))))
				)
			)
		)
	)

	; Find all "one"s, as in "a new ones", in the parse,
	; and resolve the individuals to whose predicates
	; they're referring.
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
			)
		)
	)
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

	(loop for orig-cluster in clusters
		for i from 0
		do (block alias-block
			; We may end up with spans not mapped to individuals if
			; some coreference resolution is done by pre-existing
			; parser rules.
			(setf cluster (loop for e in orig-cluster if (member e claimed-inds :test #'equal) collect e))

			(setf pronouns (loop for e in cluster if (lex-pronoun? e) collect e))
			(setf non-pronouns (loop for e in cluster if (not (lex-pronoun? e)) collect e))
			; (format t "cluster ~d, pronouns ~s, others ~s~%" i pronouns non-pronouns)
			; (format t "cluster was ~s~%" cluster)
			(setf rep-name (car (append non-pronouns pronouns)))
			(setf agent-constrs (list))
			(if (lex-pronoun? rep-name)
				; then
				(progn
				(setf old-rep-name (intern (concat-strs (car (split-str (string rep-name) ".")) ".PRO")))
				(setf rep-name (new-skolem! (intern (car (split-str (format nil "~s" rep-name) ".")))))
				; (format t "picking new rep name ~s for pronoun ~s~%" rep-name old-rep-name)
				(if (personal-pronoun? old-rep-name)
					; then
					(setf agent-constrs (append agent-constrs (list (list rep-name 'AGENT.N))))
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
			(loop for e in cluster
				if (not (equal e rep-name))
					do (setf el-sents (replace-vals e rep-name el-sents))
			)
		)
	)

	; Get story constraints for all "one"s
	(loop for one being the hash-keys of ones-to-coref-clusters
		do (block handle-one
			(setf one-inds (dedupe (loop for cluster in (gethash one ones-to-coref-clusters) append cluster)))
			; (format t "one ~s has individuals ~s~%" one one-inds)

			(setf one-constraints (mapcar #'prop-pred (loop for ind in one-inds
				; append (story-select-term-constraints (linearize-story el-sents (list one))
				append (story-select-term-constraints (filter-invalid-wffs (clean-idx-tags (linearize-story el-sents))) (list (remove-idx-tag ind)))
			)))

			(format t "~s has constraints ~s~%" one one-constraints)

		)
	)

	(return-from outer el-sents)
)
)
