(load "ll-load.lisp")

(ll-load "real_util.lisp")

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

	(dbg 'coref "coref clusters: ~s~%" clusters)

	(dbg 'coref "coref pair to ind map: ~s~%" (ht-to-str coref-pair-to-ind))
	(loop for cp being the hash-keys of coref-pair-to-ind
		do (setf clusters (replace-vals cp (gethash cp coref-pair-to-ind) clusters ))
	)

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

	(return-from outer el-sents)
)
)
