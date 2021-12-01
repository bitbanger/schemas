; (declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

; (ll-load "nesl-compos.lisp")
; (ll-load "test-generalize-matches.lisp")

(ll-load-subdir "tests" "test-generalize-matches.lisp")
; (ll-load-subdir "tests" "nesl-compos.lisp")

(ll-load "ll-util.lisp")
(ll-load "schema-util.lisp")

; (format t "~d~%" (length *NESL-COMPOS*))

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

(ldefun idx-ngram (ngram ngrams schema)
	(setf (gethash ngram ngrams)
		(dedupe (append (gethash ngram ngrams)
			(list schema))))
)

(ldefun extract-index-steps (schemas)
(block outer
	(setf step-lists (list))

	(loop for sch in schemas for i from 0 do (block index

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

		(setf step-lists (append step-lists (list (list sch steps))))
	))

	(return-from outer step-lists)
))


; (format t "~s~%" (max-all (mapcar #'length step-lists)))

(ldefun extract-ngrams (schemas &optional min-length min-freq)
(block outer

(setf step-lists (extract-index-steps schemas))

(setf ngrams (make-hash-table :test #'equal))

(setf max-n (length (max-all (mapcar #'second step-lists) #'length)))

(loop for n from min-length to max-n do
	(loop for step-list-pair in step-lists do (block get-ngrams
		(setf schema (car step-list-pair))
		(setf step-list (second step-list-pair))

		(if (< (length step-list) n)
			(return-from get-ngrams))

		(loop for i from 0 to (- (length step-list) n)
			do (block idx-ngram
				(setf new-ngram (subseq-safe step-list i (+ i n)))
				(setf (gethash new-ngram ngrams) (dedupe (append (gethash new-ngram ngrams) (list schema))))
			))
	))
)

(setf schemas-to-ngrams (make-hash-table :test #'equal))
(loop for k being the hash-keys of ngrams
	do (setf (gethash (gethash k ngrams) schemas-to-ngrams)
		(append (gethash (gethash k ngrams) schemas-to-ngrams) (list k))))

(setf get-rid-of (make-hash-table :test #'equal))

(loop for k being the hash-keys of schemas-to-ngrams
	if (> (length (gethash k schemas-to-ngrams)) 1)
		do (block prune
			(setf keep (max-all (gethash k schemas-to-ngrams) #'length))
			(loop for ng in (gethash k schemas-to-ngrams)
				if (not (equal ng keep))
					do (setf (gethash ng get-rid-of) t))
		))

	; if (> (length (gethash k schemas-to-ngrams)) 1)
		; do (format t "n-grams that share schemas: ~s~%" (gethash k schemas-to-ngrams))
	; if (> (length (gethash k schemas-to-ngrams)) 1)
		; do (format t "	choosing ~s~%" (max-all (gethash k schemas-to-ngrams) #'length)))

(setf counts (loop for k being the hash-keys of ngrams
	collect (list k (gethash k ngrams))))

(setf counts (sort counts #'< :key (lambda (x) (length (second x)))))
(setf counts (loop for c in counts
	if (not (gethash (car c) get-rid-of))
		collect c))

(if (not (null min-freq))
	(setf counts (loop for c in counts
		if (>= (length (second c)) min-freq)
			collect c)))

(return-from outer counts)

))

(ldefun old-extract-ngrams (schemas &optional min-length min-freq)
(block outer
(setf step-lists (extract-index-steps schemas))

(setf ngrams (make-hash-table :test #'equal))

(loop for steps-pair in step-lists do (block idx
	(setf schema (car steps-pair))
	(setf steps (second steps-pair))

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
		do (idx-ngram ng ngrams schema))
	(loop for ng in (dedupe bigrams)
		do (idx-ngram ng ngrams schema))
	(loop for ng in (dedupe unigrams)
		do (idx-ngram ng ngrams schema))

))

(setf counts (loop for k being the hash-keys of ngrams
	collect (list k (gethash k ngrams))))

(setf counts (sort counts #'< :key (lambda (x) (length (second x)))))

; (loop for c in counts
	; if (and (> (length (second c)) 1) (>= (length (car c)) 2))
		; do (format t "~s - ~d occurrences~%" (car c) (length (second c))))

(if (not (null min-freq))
	(setf counts (loop for c in counts
		if (>= (length (second c)) min-freq)
			collect c)))

(if (not (null min-length))
	(setf counts (loop for c in counts
		if (>= (length (car c)) min-length)
			collect c)))

(return-from outer counts)
))

; (extract-ngrams *NESL-COMPOS*)
