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

(ldefun mk-index-prop (prop constrs)
(block outer
	(setf args (prop-all-args prop))
	(setf argrcs (loop for arg in args
		collect (take-best-rc
			(loop for constr in constrs
				if (and (equal (length constr) 2) (equal (car constr) arg))
					collect (second constr)))))
	
	(setf argrcs (loop for a in argrcs
		if (and (listp a) (equal (car a) 'PLUR))
			collect (second a)
		else
			collect a))

	(setf index-prop (append (list (car argrcs) (prop-pred prop)) (cdr argrcs)))

	(if (loop for a in index-prop always (symbolp a))
		; then
		(setf index-prop (mapcar #'strip-dot-tag index-prop)))

	(return-from outer index-prop)
)
)

(ldefun extract-index-steps (schemas &optional keep-unindexed-steps)
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
						; then
						; (format t "~s~%" (mapcar #'strip-dot-tag index-prop)))
						(setf steps (append steps (list (mapcar #'strip-dot-tag index-prop))))
						; else
						(if keep-unindexed-steps
							(setf steps (append steps (list nil)))))
				))

		(setf step-lists (append step-lists (list (list sch steps))))
	))

	(return-from outer step-lists)
))


; (format t "~s~%" (max-all (mapcar #'length step-lists)))

(ldefun extract-ngrams (schemas &optional min-length min-freq schema-protos hashtable)
(block outer

(setf step-lists (extract-index-steps schemas))

(setf ngrams (make-hash-table :test #'equal))
(setf ngram-protos (make-hash-table :test #'equal))

(setf max-n (length (max-all (mapcar #'second step-lists) #'length)))

(loop for n from min-length to max-n do
	(loop for step-list-pair in step-lists for i from 0 do (block get-ngrams
		(setf schema (car step-list-pair))
		(setf step-list (second step-list-pair))
		(setf protos (if (not (null schema-protos)) (nth i schema-protos) nil))

		(if (< (length step-list) n)
			(return-from get-ngrams))

		(loop for i from 0 to (- (length step-list) n)
			do (block idx-ngram
				(setf new-ngram (subseq-safe step-list i (+ i n)))
				(setf (gethash new-ngram ngrams) (dedupe (append (gethash new-ngram ngrams) (list schema))))
				(if (not (null schema-protos))
					(setf (gethash new-ngram ngram-protos) (dedupe (append (gethash new-ngram ngram-protos) (list protos)))))
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

(if hashtable
	(return-from outer ngrams))

	; if (> (length (gethash k schemas-to-ngrams)) 1)
		; do (format t "n-grams that share schemas: ~s~%" (gethash k schemas-to-ngrams))
	; if (> (length (gethash k schemas-to-ngrams)) 1)
		; do (format t "	choosing ~s~%" (max-all (gethash k schemas-to-ngrams) #'length)))

(setf counts nil)
(if (null schema-protos)
	; then
	(setf counts (loop for k being the hash-keys of ngrams
		collect (list k (gethash k ngrams))))
	; else
	(setf counts (loop for k being the hash-keys of ngrams
		collect (list k (gethash k ngrams) (gethash k ngram-protos))))
)

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

(ldefun gen-ngram-schemas (n-gram schema-proto-pairs)
(block outer
	(setf schemas (mapcar #'car schema-proto-pairs))
	(setf all-protos (mapcar #'second schema-proto-pairs))

	; (format t "~s~%" n-gram)
	(setf all-ngram-steps (list))
	(loop for schema in schemas do (block proc-schema
		(setf ngram-steps (list))
		(loop for idx-step in (second (car (extract-index-steps (list schema) t)))
				for st in (mapcar #'second (section-formulas (get-section schema ':Steps)))
			if (contains n-gram idx-step)
				do (setf ngram-steps (append ngram-steps (list st)))
		)

		(setf all-ngram-steps (append all-ngram-steps (list ngram-steps)))
	))
	; loop over each step, across all schemas in parallel
	(loop for i from 0 to (- (length n-gram) 1) do (block unify-steps
		; a list of the step i instances for each schema
		(setf all-steps
			(loop for ngram-steps in all-ngram-steps
				collect (nth i ngram-steps)))

		(format t "	step: ~s~%" (nth i n-gram))

		; A list of list of lists.
		; Dimension 1: for each schema instance
		; Dimension 2: for each arg in step i
		; Dimension 3: for each constraint on the arg
		(setf each-schema-arg-constraints (list))

		; a loop over the step i instances for each schema
		(loop for stp in all-steps for schema in schemas for protos in all-protos do (block proc-step
			; Register the protos for expansion/flattening, so we can
			; get at their constraints
			(loop for proto in protos do (register-schema proto))

			; Build a list of constraint lists, one
			; for each arg in the step
			(setf step-i-arg-constraints (list))
			(loop for arg in (prop-all-args stp)
				do (setf step-i-arg-constraints (append step-i-arg-constraints (list
					(loop for c in (flatten-schema schema)
						if (equal (car c) arg)
							collect c)))))

			; Add our arg constraints to the list for each schema
			(setf each-schema-arg-constraints (append each-schema-arg-constraints
				(list step-i-arg-constraints)))

			; Clear out the protos we registered
			(clear-registered-schemas)
		))

		; Swap the dimensions of each-schema-arg-constraints to be:
		; Dimension 1: for each arg in step i
		; Dimension 2: for each schema instance
		; Dimension 3: for each constraint on the arg
		(setf each-schema-arg-constraints
			(loop for j from 0 to (- (length (car each-schema-arg-constraints)) 1)
				collect (loop for schema-inst in each-schema-arg-constraints
					collect (nth j schema-inst))))

		;(loop for arg in each-schema-arg-constraints for ii from 0
			;do (format t "arg ~d~%" ii)
			;do (loop for schema in arg for ij from 0
				;do (format t "	schema ~d~%" ij)
				;do (loop for constr in schema
					;do (format t "		~s~%" constr))))

		(loop for arg in each-schema-arg-constraints for ii from 0
			do (format t "		arg ~d~%" ii)
			do (loop for constr in
				(reduce (lambda (x y) (intersection x y :test (lambda (a b) (equal (second a) (second b))))) arg)
					do (format t "			~s~%" constr)))
	))
)
)
