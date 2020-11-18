; norm-matcher.lisp contains functions for matching one
; specific story to a corpus of schemas, rather than a
; specific schema.

(load "norm-match.lisp")

(defun top-k-story-matches (story num_shuffles schemas num_schemas generalize k)
(let (best-bindings best-score)
(block outer
(setf best-schemas (mapcar (lambda (x) (schema-pred x)) (top-k-schemas (get-single-word-preds story) (mapcar #'eval schemas) num_schemas)))

(load-story-time-model story)

(setf matches (make-hash-table :test #'equal))
(setf match-scores (make-hash-table :test #'equal))

;(format t "scores:~%")
;(loop for sc in scores do (format t "	~s~%" (- (car sc) (second sc))))
;(loop for i from 1 to 10 do 
(loop for protoschema in best-schemas do (block match-proto
	;(if (not (equal protoschema 'do_action_to_enable_action.v))
		; then
	;	(return-from match-proto)
	;)

	(loop for best-match-res-pair in (top-k-story-schema-matches story (eval protoschema) num_shuffles generalize k) do (block process-each

	; (setf best-match-res-pair (best-story-schema-match story (eval protoschema) *NUM-SHUFFLES* *GENERALIZE*))
	(setf best-match-res (car best-match-res-pair))
	(setf best-score (car best-match-res-pair))
	; (format t "setting best-score to res pair car ~s~%" (car best-match-res-pair))
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

	(setf unsorted-matches (loop for k being the hash-keys of matches append
		(loop for match in (gethash k matches)
				for match-score in (gethash k match-scores)
			collect (list match match-score))
		; (list (gethash k matches) (gethash k match-scores))
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

(defun top-k-story-schema-matches (story schema num_shuffles generalize k)
(let (best-bindings best-score)
(block outer
	; (dbg 'match "matching to schema ~s~%" schema)
	(setf best-score '(0 0))
	(setf best-match nil)
	(setf best-bindings nil)

	(setf all-matches (list))

	(setf linear-story (linearize-story story))

	(loop for i from 1 to num_shuffles do (block shuffle-block
		(if (equal 0 (mod i 10))
			; then
			(progn
				(dbg 'shuffle-match "~s / ~s~%" i num_shuffles)
				(dbg 'shuffle-match "	best score is ~s~%" best-score)
			)
		)
			
		(setf cur-match-triple (match-story-to-schema linear-story schema nil))
		; (format t "got triple ~s~%" cur-match-triple)
		(setf cur-match (car cur-match-triple))
		(setf cur-bindings (second cur-match-triple))
		(setf bound-header (third cur-match-triple))

		
		;(print-schema cur-match)
		
		;(setf score-pair (check-temporal-constraints cur-match))
		; (format t "score: ~s~%" score)
		; (setf score (- (car score-pair) (second score-pair)))

		; Always take one with fewer inconsistencies, but break ties with
		; number of explicit consistencies.
		;(setf invalid-score (second score-pair))
		; (format t "tick~%")
		; (format t "invalid temporal score: ~s~%" score-pair)
		; (format t "~s~%" (get-section cur-match ':Episode-relations))

		; Added constraints shouldn't count toward our score, because we know
		; they'll be satisfied.
		(setf cur-match-old-constrs (copy-list cur-match))
		(loop for sec in (nonmeta-sections cur-match)
			do (block prune
				(if (> (length sec) (length (get-section schema (car sec))))
					; then
					(progn
					(setf new-sec (copy-list sec))
					(setf new-sec (subseq new-sec 0 (length (get-section schema (car sec)))))
					; (format t "ref schema is:~%")
					; (print-schema schema)
					; (format t "cut sec ~s down to new sec ~s~%" sec new-sec)

					; If the old section was null, then we can just remove it.
					; Otherwise, replace it with the truncated version.
					(if (null (get-section schema (car sec)))
						; then
						(setf cur-match-old-constrs (remove sec cur-match-old-constrs :test #'equal))
						; else
						(setf cur-match-old-constrs (replace-vals sec new-sec cur-match-old-constrs))
					)
					)
				)
			)
		)

		; (format t "checking old constrs in cur match:~%")
		; (print-schema cur-match-old-constrs)

		(setf score-pair (check-constraints cur-match-old-constrs story))
		; A null score indicates that a constraint with necessity
		; 1 was broken, and that the match is invalid by definition.
		(if (null score-pair)
			(return-from shuffle-block)
		)
		; (format t "score pair is ~s~%" score-pair)

		
		(if (null (member (list score-pair cur-match cur-bindings bound-header) all-matches :test (lambda (a b) (ht-eq (third a) (third b)))))
			; then
			(setf all-matches (append all-matches (list (list score-pair cur-match cur-bindings bound-header))))
		)

		; (format t "made it here 0~%")


		(setf valid-score (car score-pair))
		; (format t "made it here 0.1~%")
		(setf invalid-score (second score-pair))
		; (format t "made it here 0.2~%")
		; (format t "best score is ~s~%" best-score)
		(setf better-than-best (< invalid-score (second best-score)))
		; (format t "made it here 0.3~%")
		(if (and (equal invalid-score (second best-score))
			 (> valid-score (car best-score)))
			; then
			(setf better-than-best t)
		)

		; (format t "made it here 1~%")

		; (if better-than-best (format t "BEST~%"))
	
		(if (or
				(null best-match)
				better-than-best
				bound-header
			)
			; then
			(progn
				; (format t "setting best-score to pair ~s~%" score-pair)
				(setf best-score score-pair)
				(setf best-match cur-match)
				(setf best-bindings cur-bindings)
				(if bound-header
					(return-from shuffle-block)
				)
			)
		)
	
		(setf linear-story (shuffle linear-story))
	))

	; (format t "made it here 2~%")

	(setf sorted-matches (sort all-matches
		(lambda (a b)
		(block lb
			(setf a-valid (car (car a)))
			(setf a-invalid (second (car a)))
			(setf a-bound-header (fourth a))
			(setf b-valid (car (car b)))
			(setf b-invalid (second (car b)))
			(setf b-bound-header (fourth b))

			(if (and a-bound-header (not b-bound-header)) (return-from lb t))
			(if (and b-bound-header (not a-bound-header)) (return-from lb nil))

			;(setf a-better (< a-invalid b-invalid))
			;(if (and (equal a-invalid b-invalid) (> a-valid b-valid))
			;	(setf a-better t)
			;)
			(setf a-better (> (- a-valid a-invalid) (- b-valid b-invalid)))

			(return-from lb a-better)
		)
		)
	))
	; (format t "sorted matches are ~s~%" (loop for x in sorted-matches collect (list (car x) (second x) (ht-to-str (third x)) (fourth x))))

	; (format t "return val is ~s~%" (mapcar (lambda (x) (subseq x 0 3)) (subseq-safe sorted-matches 0 k)))

	; (return-from outer (list best-score best-match best-bindings))
	(return-from outer (mapcar (lambda (x) (subseq x 0 3)) (subseq-safe sorted-matches 0 k)))
)
)
)
