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

(defparameter *UNINTERESTING-RCS* '(
	LOCATION.N
	DESTINATION.N
	OBJECT.N
	ENTITY.N
	AGENT.N
))

(ldefun take-best-rc (rcs)
(block outer
	(setf nouns (loop for rc in rcs if (lex-noun? rc) collect rc))

	(setf interesting-nouns (loop for noun in nouns
		if (not (contains *UNINTERESTING-RCS* noun))
			collect noun))
	(if (not (null interesting-nouns))
		(setf nouns interesting-nouns))

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

(ldefun mk-index-prop (prop constrs &optional basic-levels)
(block outer
	(setf args (prop-all-args prop))
	(setf argrcs (mapcar #'take-best-rc constrs))
	(setf argrcs (loop for a in argrcs
		if (and (listp a) (equal (car a) 'PLUR))
			collect (second a)
		else
			collect a))

	(setf pred (list (prop-pred prop)))
	(if (contains (prop-mods prop) 'NOT)
		(setf pred (list 'NOT pred)))
	(if (contains (prop-mods prop) 'CAN.MD)
		(setf pred (list 'CAN pred)))
	(setf pred (flatten pred))

	(setf index-prop (append (list (car argrcs)) pred (cdr argrcs)))

	(if basic-levels
		(setf index-prop (loop for e in index-prop
			if (lex-noun? e) collect (basic-level e)
			else collect e)))

	(setf index-prop (list (car (get-elements-pred index-prop #'lex-verb?))))

	(if (and (not (null index-prop)) (loop for a in index-prop always (symbolp a)))
		; then
		(setf index-prop (mapcar #'strip-dot-tag index-prop))
		; else
		(return-from outer nil))
		; (setf index-prop index-prop))

	(return-from outer index-prop)
)
)

(ldefun hash-table-to-counts (ngrams get-rid-of &optional ngram-protos min-freq)
(block outer
	(setf counts nil)
	(if (null ngram-protos)
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

	)
)

(ldefun counts-to-hash-table (counts)
(block outer
	(setf ngrams (make-hash-table :test #'equal))
	(loop for c in counts
		do (setf (gethash (car c) ngrams) (second c)))

	(return-from outer ngrams)
)
)

(ldefun extract-index-steps (schemas &optional keep-unindexed-steps basic-levels)
(block outer
	(setf step-lists (list))

	(loop for sch in schemas for i from 0 do (block index

		(setf steps (list))

		(loop for st in (mapcar #'second
			(section-formulas (get-section sch ':Steps)))
				do (block make-index
					(setf index-prop (mk-index-prop st (get-args-rcs (prop-all-args st) sch) basic-levels))

					(if (null index-prop)
						; then
						(if keep-unindexed-steps
							; then
							(setf steps (append steps (list nil))))
						; else
						(setf steps (append steps (list index-prop))))

					(return-from make-index)



					(setf argrcs (mapcar #'take-best-rc (get-args-rcs (prop-all-args st) sch)))
					(setf argrcs (loop for a in argrcs
						if (and (listp a) (equal (car a) 'PLUR))
							collect (second a)
						else
							collect a))

					(setf pred (list (prop-pred st)))
					(if (contains (prop-mods st) 'NOT)
						(setf pred (list 'NOT pred)))
					(if (contains (prop-mods st) 'CAN.MD)
						(setf pred (list 'CAN pred)))
					(setf pred (flatten pred))

					(setf index-prop (append (list (car argrcs)) pred (cdr argrcs)))

					(if basic-levels
						(setf index-prop (loop for e in index-prop
							if (lex-noun? e) collect (basic-level e)
							else collect e)))

					(if (loop for a in index-prop always (symbolp a))
						; then
						; (format t "~s~%" (mapcar #'strip-dot-tag index-prop)))
						(setf steps (append steps (list (mapcar #'strip-dot-tag index-prop))))
						; (setf steps (append steps (list index-prop)))
						; else
						(if keep-unindexed-steps
							(setf steps (append steps (list nil)))))
				))

		; (setf step-lists (append step-lists (list (list sch steps))))
		(setf step-lists (append step-lists (list (list sch (dedupe steps)))))
	))

	(return-from outer step-lists)
))


; (format t "~s~%" (max-all (mapcar #'length step-lists)))

(ldefun extract-ngrams (schemas &optional min-length min-freq schema-protos hashtable basic-levels)
(block outer

(setf step-lists (extract-index-steps schemas nil basic-levels))

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

(return-from outer (hash-table-to-counts ngrams get-rid-of
	(if (not (null schema-protos)) ngram-protos nil)
	min-freq))
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

; Un-abstract basic levels where more specific
; values are shared by all matched schemas.
(ldefun un-abstract-ngrams (counts)
(block outer
	(setf new-counts (list))

	(loop for pair in counts do (block inner
		(setf ngram (car pair))
		(setf schemas (second pair))

		(setf schema-basic-steps (mapcar #'second (extract-index-steps schemas nil t)))

		(setf schema-steps (loop for steps in (mapcar #'second (extract-index-steps schemas))
				for basic-steps in schema-basic-steps
			collect (loop for i from 0 to (- (length basic-steps) 1)
				if (contains ngram (nth i basic-steps))
					collect (nth i steps))))

		(setf new-ngram (list))

		(loop for i from 0 to (- (length ngram) 1) do (block ng
			(setf ng-step (nth i ngram))
			(setf sch-steps (loop for s in schema-steps
				collect (nth i s)))

			(setf new-ng-step (list))

			(loop for j from 0 to (- (length ng-step) 1) do (block el
				(setf elem (nth j ng-step))
				(setf sch-elems (dedupe (loop for sch-st in sch-steps
					collect (nth j sch-st))))

				(if (and
					(equal (length sch-elems) 1)
					(not (equal (car sch-elems) elem))
					(not (null (car sch-elems))))
						; then
						(setf new-ng-step (append new-ng-step (list (car sch-elems))))
						; else
						(setf new-ng-step (append new-ng-step (list elem))))
			))

			(setf new-ngram (append new-ngram (list new-ng-step)))
		))

		(setf new-counts (append new-counts
			(list (list new-ngram schemas))))
	))

	(return-from outer new-counts)
)
)
