(load "parse.lisp")
(load "norm-el.lisp")
(load "real_util.lisp")
; (load "norm-wordnet.lisp")
(load "trial-wn.lisp")

(defparameter *MOVEMENT-PREDS* '(
	go.v
	come.v
	run.v
	walk.v
	crawl.v
	fly.v
))

(defparameter *RECEIVING-PREDS* '(
	take.v
	get.v
	receive.v
))

(defparameter *ENJOY-PREDS* '(
	like.v
	enjoy.v
	love.v
))

(defparameter *SPECIAL-SUBSUMPTIONS* (mk-hashtable '(
	((AGENT.N ANIMAL.N) t) ; animals are agents
	((AGENT.N CAUSAL_AGENT.N) t) ; causal agents are agents
	((FOOD.N FRUIT.N) t) ; fruit is food
)))

(defun get-schema-match-num (pred)
(block outer
	(if (symbolp pred)
		(setf spl (split-str (format nil "~s" pred) "."))
	)
	(if (and (symbolp pred)
			(> (length spl) 2)
			(is-num-str? (nth (- (length spl) 2) spl)))
		; then
		(return-from outer (parse-integer (nth (- (length spl) 2) spl)))
		; else
		(return-from outer nil)
	)
)
)

(defun get-schema-match-name (pred)
(block outer
	(if (symbolp pred)
		(setf spl (split-str (format nil "~s" pred) "."))
	)
	(if (and (symbolp pred)
			(> (length spl) 2)
			(is-num-str? (nth (- (length spl) 2) spl)))
		; then
		(return-from outer
			(intern (join-str-list "." (append
				(subseq spl 0 (- (length spl) 2))
				(last spl)
			)))
		)
		; else
		(if (equal (length spl) 2)
			; then
			(return-from outer pred)
			; else
			(return-from outer nil)
		)
	)
)
)

(defun subsumes (schema-pred story-pred)
	(> (subsumption-score schema-pred story-pred) 0)
)

(defun subsumption-score (schema-pred story-pred)
(block outer
	; If they're equal, schema subsumes story
	(if (equal schema-pred story-pred)
		(return-from outer 1.0)
	)

	; ...Or if the story pred has attrs over the schema pred.
	(if (equal schema-pred (pred-base story-pred))
		(return-from outer 0.95)
	)

	; ...Or if they're synonyms
	(if (or
			(member schema-pred (wordnet-synonyms story-pred) :test #'equal)
			(member story-pred (wordnet-synonyms schema-pred) :test #'equal))
		; then
		(progn
		; (format t "~s and ~s are synonyms~%" schema-pred story-pred)
		(return-from outer 0.9)
		)
	)

	; Strip PLUR (at a cost if only from one)
	(if (plur? story-pred)
		; then
		(if (not (plur? schema-pred))
			; then
			(return-from outer (* 0.75 (subsumption-score schema-pred (second story-pred))))
			; else
			(return-from outer (subsumption-score (second schema-pred) (second story-pred)))
		)
	)
	; (or for free if both)

	; If the story pred is a specification of the schema pred,
	; then schema subsumes story
	; TODO: proper hierarchy for inheritance
	(if (and (not (null (get-schema-match-num story-pred)))
			(equal (get-schema-match-name story-pred) schema-pred))
		; then
		(return-from outer 0.9)
	)

	(if (and (equal schema-pred 'movement_verb.v)
			(not (null (member story-pred *MOVEMENT-PREDS* :test #'equal))))
		; then
		(return-from outer 0.9)
	)

	(if (and (equal (get-schema-match-name schema-pred) 'receiving_verb.?)
			(not (null (member story-pred *RECEIVING-PREDS* :test #'equal))))
		; then
		(return-from outer 0.9)
	)

	(if (and (equal schema-pred 'enjoy_verb.v)
			(not (null (member story-pred *ENJOY-PREDS* :test #'equal))))
		; then
		(return-from outer 0.9)
	)

	; Check explicit special cases
	(if (gethash (list schema-pred story-pred) *SPECIAL-SUBSUMPTIONS*)
		; then
		(return-from outer 0.9)
	)

	; We should also check to see if any of the special case
	; specific predicates subsume our specific predicate, which
	; would transitively imply the special case general predicate.
	(loop for sc being the hash-keys of *SPECIAL-SUBSUMPTIONS*
		do (block check-scs-transitive
			(if (and (equal schema-pred (car sc))
					 (subsumes (second sc) story-pred))
				; then
				(return-from outer 0.9)
			)
		)
	)

	(if (and (not (null (get-schema-match-num story-pred)))
			(equal (get-schema-match-name story-pred) schema-pred))
		; then
		(return-from outer 0.9)
	)


	(setf wn-schema-pred schema-pred)
	(setf wn-story-pred story-pred)
	(if (not (null (get-schema-match-num story-pred)))
		(setf wn-story-pred (get-schema-match-name story-pred))
	)
	(if (not (null (get-schema-match-num schema-pred)))
		(setf wn-schema-pred (get-schema-match-name schema-pred))
	)

	; TODO: confirm that stripping match numbers doesn't affect
	; subsumption at this point

	; Check WordNet hypernym hierarchy
	;(if (not (null (member wn-schema-pred (wordnet-hypernyms wn-story-pred))))
	;	(return-from outer t)
	;)
	;(if (has-element (wordnet-hypernyms wn-story-pred) wn-schema-pred)
	;	(progn
		;(format t "~s in hypernyms of ~s~%" wn-schema-pred wn-story-pred)
	;	(return-from outer t)
	;	)
	;)
	(loop for ladder in (wordnet-hypernyms wn-story-pred)
		do (block ladder-eval
			(if (and (> (length ladder) 0) (not (null (member wn-schema-pred ladder :test (lambda (a b) (member a b :test #'equal))))))
			(return-from outer
				(+ 0.5
					(* 0.5
						(/
							(length (member wn-schema-pred ladder :test (lambda (a b) (member a b :test #'equal))))
							(+ 1 (length ladder)))))))
							
		)
	)

	; Default case: no subsumption
	(return-from outer 0)
)
)

(defun word-sym-split (sym)
(let (symstr spl wspl word num pos)
(block outer
	(setf symstr (string sym))
	(setf spl (split-str symstr "."))
	(setf wspl (split-str (car spl) "#")

	(setf word (car wspl))
	(setf num (parse-integer (second wspl)))
	(setf pos (second spl))

	(return-from outer (list word num pos))
)
)
)
)

