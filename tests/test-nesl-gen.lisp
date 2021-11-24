(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load "nesl-compos.lisp")
(ll-load "test-generalize-matches.lisp")

(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "schema-util.lisp")

(format t "~d~%" (length *NESL-COMPOS*))

(ldefun strip-dot-tag (s)
	(intern (car (split-str (string s) ".")))
)

(ldefun take-best-rc (rcs)
(block outer
	(setf nouns (loop for rc in rcs if (lex-noun? rc) collect rc))
	(if (not (null nouns))
		(return-from outer (car nouns)))

	(return-from outer (car rcs))
)
)

(setf step-lists (list))

(loop for sch in *NESL-COMPOS* for i from 0 do (block index
	(setf steps (list))

	(loop for st in (mapcar #'second
		(section-formulas (get-section sch ':Steps)))
			do (block make-index
				(setf argrcs (mapcar #'take-best-rc (get-args-rcs (prop-all-args st) sch)))
				(setf argrcs (loop for a in argrcs
					if (and (listp a) (equal (car a) 'PLUR))
						collect (second a)
					else
						collect a))
				(setf index-prop (append (list (car argrcs) (prop-pred st)) (cdr argrcs)))

				(if (loop for a in index-prop always (symbolp a))
					; (format t "~s~%" (mapcar #'strip-dot-tag index-prop)))
					(setf steps (append steps (list (mapcar #'strip-dot-tag index-prop)))))
			))

	(setf step-lists (append step-lists (list steps)))
))

; (format t "~s~%" (max-all (mapcar #'length step-lists)))

(setf ngrams (make-hash-table :test #'equal))

(ldefun idx-ngram (ngram ngrams)
	(if (null (gethash ngram ngrams))
		; then
		(setf (gethash ngram ngrams) 1)
		; else
		(setf (gethash ngram ngrams) (+ 1 (gethash ngram ngrams))))
)

(loop for steps in step-lists do (block idx
	(setf trigrams (list))
	(setf bigrams (list))
	(setf unigrams (list))

	(loop for i from 0 to (length steps)
		do (loop for j from (+ i 1) to (length steps)
			do (loop for k from (+ j 1) to (length steps)
				do (block inner

			(setf trigram (list
				(nth i steps)
				(nth j steps)
				(nth k steps)))
			(setf trigram (loop for e in trigram
				if (not (null e)) collect e))

			(setf trigrams (append trigrams (list trigram)))

			(if (>= (length trigram) 2)
				(setf bigrams (append bigrams (list (subseq trigram 0 2)))))
			(if (equal (length trigram) 3)
				(setf bigrams (append bigrams (list (subseq trigram 1 3)))))

			(setf unigrams (append unigrams (mapcar #'list trigram)))

			; (format t "~s~%" trigram)

			))))

	(loop for ng in (dedupe trigrams)
		do (idx-ngram ng ngrams))
	(loop for ng in (dedupe bigrams)
		do (idx-ngram ng ngrams))
	(loop for ng in (dedupe unigrams)
		do (idx-ngram ng ngrams))

))

(setf counts (loop for k being the hash-keys of ngrams
	collect (list k (gethash k ngrams))))

(setf counts (sort counts #'< :key #'second))

(loop for c in counts
	if (and (> (second c) 1) (>= (length (car c)) 2))
		do (format t "~s - ~d occurrences~%" (car c) (second c)))
