; norm-matcher.lisp contains functions for matching one
; specific story to a corpus of schemas, rather than a
; specific schema.

(load "ll-load.lisp")

(ll-load "schema-el-parser.lisp")
(ll-load "new-ulf-parser.lisp")
(ll-load "schema-link.lisp")
(ll-load "schema-util.lisp")
(ll-load "schema-match.lisp")
(ll-load "protoschemas.lisp")

(defparameter *DEFAULT-SHUFFLES* 10)

; top-k-el-story-matches uses a heuristic to retrieve the
; K best schema candidates for an EL story, and then returns
; the best single story-to-schema match for each of them.
(ldefun top-k-el-story-matches (story num-shuffles schemas num-schemas num-matches generalize)
	(let (best-bindings best-score best-schemas matches match-scores protoschema k) (block outer

	(setf best-schemas (mapcar (lambda (x) (schema-pred x))
		(top-k-schemas (get-single-word-preds story) (mapcar #'eval schemas) num-schemas)))


	; Remove junk propositions from the story; they slow
	; down matching.
	(setf story (copy-item story))
	(setf story (loop for sent in story collect
					(loop for wff in sent
						if (not (invisible-prop? wff))
							collect wff)))

	(load-story-time-model story)

	(setf matches (make-hash-table :test #'equal))
	(setf match-scores (make-hash-table :test #'equal))
	(setf match-bindings (make-hash-table :test #'equal))

	(loop for protoschema in best-schemas do (block match-proto
		(loop for best-match-res-pair in
			(top-k-story-schema-matches story (eval protoschema) num-shuffles generalize num-matches)
			do (block process-each
				(setf best-match-res (car best-match-res-pair))
				(setf best-score (car best-match-res-pair))
				(setf best-match (second best-match-res-pair))
				(setf best-bindings (third best-match-res-pair))

				(if (and (schema? best-match) (not (equal '(0 0) best-score)))
					(progn
						(setf match (dedupe-sections best-match))
						(loop for k being the hash-keys of best-bindings
							do (if (not (contains (car (second (eval protoschema))) k))
								; then
								(format nil "	WHATEVER IS GOING ON HERE YOU NEED TO MAKE IT NOT BE A FORMAT CALL IF IT EVER HAPPENS ~s~%" (list
									(list
										(var-to-sk-fn k)
										(third (second (eval protoschema)))
									)
									'=
									(gethash k best-bindings)
								))
							)
						)

						(setf (gethash protoschema matches)
							(append (gethash protoschema matches) (list match)))
						(setf (gethash protoschema match-scores)
							(append (gethash protoschema match-scores) (list best-score)))
						(setf (gethash protoschema match-bindings)
							(append (gethash protoschema match-bindings) (list best-bindings)))
					)
				)
			)
		)
	))

	(setf unsorted-matches (loop for k being the hash-keys of matches append
		(loop for match in (gethash k matches)
				for match-score in (gethash k match-scores)
					for match-binding in (gethash k match-bindings)
			collect (list match match-score match-binding))
	))

	(return-from outer (sort unsorted-matches
		(lambda (a b)
			(>
				(- (car (second a)) (second (second a)))
				(- (car (second b)) (second (second b)))
			)
		)
	))
)
)
)

(ldefun top-k-story-matches (story schemas num-shuffles num-schemas num-matches form-chains generalize)
	(top-k-story-matches-from-els (loop for sent in (parse-story story) collect (loop for wff in sent if (canon-prop? wff) collect wff)) schemas num-shuffles num-schemas num-matches form-chains generalize)
)

(ldefun top-k-story-matches-len (story schemas num-shuffles num-schemas num-matches form-chains generalize)
	(top-k-story-matches-from-els (loop for sent in (len-parse-sents story) collect (loop for wff in sent if (canon-prop? wff) collect wff)) schemas num-shuffles num-schemas num-matches form-chains generalize)
)

(ldefun top-k-story-matches-from-els (el-story schemas num-shuffles num-schemas num-matches form-chains generalize)
(let ()
(block outer
	; Remove junk propositions from the story; they slow
	; down matching.
	(setf story (copy-item story))
	(setf story (loop for sent in story collect
					(loop for wff in sent
						if (not (invisible-prop? wff))
							collect wff)))

	; Parse the story and filter out invalid ELFs.
	; TODO: use Len's new ULF parser, as it's used
	; in new-ulf-test1.lisp
	;(setf el-story (loop for sent in (parse-story story)
		;collect (loop for wff in sent
			;if (canon-prop? wff) collect wff)))

	; Find the best matches for the story with the given schemas.
	(setf story-matches (list))
	(setf matchcnt 0)
	(loop for m-pair in (top-k-el-story-matches el-story num-shuffles schemas num-schemas num-matches generalize)
		do (setf matchcnt (+ 1 matchcnt))
		do (block vet-matches
			(setf m (car m-pair))
			(setf score (second m-pair))
			(setf binds (third m-pair))
			(setf bound-m (apply-bindings m binds))

			; If the schema's header variable was bound...
			(if (not (varp (third (second bound-m))))
				; ...then we can just add it...
				(setf story-matches (append story-matches (list (list m score binds))))
				; ...otherwise, if any fluent episode
				; variables were bound...
				; (if (loop for fluent-sec in (fluent-sections bound-m) thereis (loop for v in (mapcar #'car (section-formulas fluent-sec)) thereis (not (varp v))))
				(if (loop for v in (mapcar #'car (section-formulas (get-section bound-m ':Steps))) thereis (not (varp v)))
					; ...then we can still add it...
					(progn
						; (setf bound-fluent-vars (loop for fluent-sec in (fluent-sections bound-m) append (loop for v in (mapcar #'car (section-formulas fluent-sec)) if (not (varp v)) collect v)))
						; (format t "bound fluent vars: ~s~%" bound-fluent-vars)
						(setf story-matches (append story-matches (list (list m score binds))))
					)
					; ...but if no header or step episode
					; variables were bound, we'll do nothing.
					(progn
						; (format t "I discriminate against vars so I'm doing nothing~%")
						; (print-schema m)
						; (print-ht binds)
						;(if (ht-contains binds (third (second m)))
							; then
							;(format t "plus the bindings show the episode is bound anyway, just to a var~%")
						;)
					)
				)
			)
		)
	)

	(return-from outer story-matches)
)
)
)

(ldefun top-story-matches-easy-el (el-story)
	(top-k-story-matches-from-els el-story *PROTOSCHEMAS* *DEFAULT-SHUFFLES* 3 3 nil nil)
)

(ldefun top-story-matches-easy (story)
	(top-k-story-matches story *PROTOSCHEMAS* *DEFAULT-SHUFFLES* 3 3 nil nil)
)

(ldefun top-story-matches-easy-len (story)
	(top-k-story-matches-len story *PROTOSCHEMAS* *DEFAULT-SHUFFLES* 3 3 nil nil)
)
