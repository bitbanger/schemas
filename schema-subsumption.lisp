(load "ll-load.lisp")

(ll-load "schema-el-lex.lisp")
(ll-load "schema-el.lisp")
(ll-load "ll-util.lisp")
(ll-load-subdir "wordnet" "trial-wn.lisp")

(defparameter *MOVEMENT-PREDS* '(
	go.v
	come.v
	run.v
	walk.v
	crawl.v
	fly.v
	return.v
	leave.v
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

(defparameter *SUBSUMPTION-CATEGORIES* (mk-hashtable `(
	(
		receiving_verb.?
		,*RECEIVING-PREDS*
	)
	;(
	;	movement_verb.v
	;	,*MOVEMENT-PREDS*
	;)
	(
		enjoy_verb.?
		,*ENJOY-PREDS*
	)
)))

(defparameter *SPECIAL-SUBSUMPTIONS* (mk-hashtable '(
	((AGENT.N ANIMAL.N) t) ; animals are causal agents
	((AGENT.N CAUSAL_AGENT.N) t) ; causal agents are agents
	((FOOD.N FRUIT.N) t) ; fruit is food
	((TRAVEL.V RETURN.V) t) ; returning is traveling
	((TRAVEL.V GO.V) t) ; going is traveling
	((TRAVEL.V LEAVE.V) t) ; leaving is traveling
)))

(ldefun get-schema-match-num (pred)
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

(ldefun get-schema-match-name (pred)
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

(ldefun subsumes (schema-pred story-pred)
	(> (subsumption-score schema-pred story-pred) 0)
)

(ldefun subsumption-score (schema-pred story-pred)
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

	(loop for k being the hash-keys of *SUBSUMPTION-CATEGORIES* do (block cat
		(if (and (equal schema-pred k)
				(not (null (member story-pred (gethash k *SUBSUMPTION-CATEGORIES*) :test #'equal))))
			; then
			(return-from outer 0.9)
		)
	))

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
				(+ 0.25
					(* 0.75
						(/
							(length (member wn-schema-pred ladder :test (lambda (a b) (member a b :test #'equal))))
							(+ 1 (length ladder)))))))
							
		)
	)

	; Default case: no subsumption
	(return-from outer 0)
)
)

(ldefun word-sym-split (sym)
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

; Collect wordnet hypernyms and special (manually defined) hypernyms
(ldefun all-hypernyms (pred)
	(remove nil (append
		(wordnet-hypernyms pred)
		(loop for ssub being the hash-keys of *SPECIAL-SUBSUMPTIONS*
			if (equal (second ssub) pred)
				; then
				collect (list (list (car ssub)))
		)
	) :test #'equal)
)

(ldefun common-ancestor-no-check (pred1 pred2)
(let
	(l1 l2 e k)
(block outer
	(setf closest-ancestor nil)
	(setf closest-ancestor-len -1)

	; First, check whether they're in the same "class".
	(loop for k being the hash-keys of *SUBSUMPTION-CATEGORIES*
		if (let ((cat (gethash k *SUBSUMPTION-CATEGORIES*)))
			(and (contains cat pred1) (contains cat pred2)))
		; then
		do (return-from outer k)
	)

	; Next, check the WordNet hypernym ladders.
	(loop for l1 in (all-hypernyms pred1)
		do (loop for l2 in (all-hypernyms pred2)
			do (block intersect
				(loop for e in l1
					do (block mem
						(if (null e)
							; then
							(return-from mem)
						)
						(if (not (listp e))
							; then
							(setf e (listify-nonlists e))
						)
						(setf memb (member e l2 :test (lambda (a b) (not (null (intersection (listify-nonlists a) (listify-nonlists b) :test #'equal))))))
						(if (null memb)
							; then
							(return-from mem)
						)
						; (if (> (/ (length memb) (length l2)) closest-ancestor-len)
						(if (> (length memb) closest-ancestor-len)
							; then
							(progn
								(setf closest-ancestor e)
								; (setf closest-ancestor-len (/ (length memb) (length l2)))
								(setf closest-ancestor-len (length memb))
							)
						)
					)
				)
			)
		)
	)
	(if (and
			(not (null closest-ancestor))
			(or
				; The last three for nouns are usually very
				; general.
				(not (lex-noun? closest-ancestor))
				(> closest-ancestor-len 3)
			)
		)
		; then
		(progn
		(return-from outer closest-ancestor)
		; (format t "closest ancestor of ~s and ~s is ~s (dist ~s)~%" pred1 pred2 closest-ancestor closest-ancestor-len)
		)
	)
)
)
)

(ldefun common-ancestor-inner (pred1 pred2)
(block outer
	(if (equal pred1 pred2)
		; then
		(return-from outer pred1)
	)
	(if (subsumes pred1 pred2)
		(return-from outer pred1)
	)
	(if (subsumes pred2 pred1)
		(return-from outer pred2)
	)


	(return-from outer (common-ancestor-no-check pred1 pred2))
)
)

(ldefun common-ancestor (pred1 pred2)
	; (listify-nonlists (common-ancestor-inner pred1 pred2))
	(let ((res (common-ancestor-inner pred1 pred2)))
		(if (null res)
			; then
			res
			; else
			(if (canon-pred? res)
				; then
				(list res)
				; else
				res
			)
		)
	)
)
