(load "ll-load.lisp")

(ll-load "schema-el-lex.lisp")
(ll-load "schema-el.lisp")
(ll-load "ll-util.lisp")
(ll-load "ll-cache.lisp")
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

(defparameter *DEST-PREPS* '(
	toward.p
	towards.p
	to.p
	for.p
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
	(
		destination_prep.?
		,*DEST-PREPS*
	)
	;(
	;	movement_verb.v
	;	,*MOVEMENT-PREDS*
	;)
	(
		enjoy_verb.?
		,*ENJOY-PREDS*
	)
	(
		location_adv.?
		location-adv?
	)
)))

(ldefun cached-wordnet-synonyms (pred)
	(ll-cache
		#'wordnet-synonyms
		(list pred)
		100
		nil
	)
)

(ldefun cached-wordnet-hypernyms (pred)
	(ll-cache
		#'wordnet-hypernyms
		(list pred)
		100
		nil
	)
)

(ldefun get-subsumption-categories (pred)
	(loop for k being the hash-keys of *SUBSUMPTION-CATEGORIES*
		if (listp (gethash k *SUBSUMPTION-CATEGORIES*))
			if (contains (gethash k *SUBSUMPTION-CATEGORIES*) pred)
				collect k
		if (and (symbolp (gethash k *SUBSUMPTION-CATEGORIES*)) (fboundp (gethash k *SUBSUMPTION-CATEGORIES*)))
			if (funcall (gethash k *SUBSUMPTION-CATEGORIES*) pred)
				collect k
	)
)

(ldefun is-category? (pred cat-name)
(block outer
	(setf cat (gethash cat-name *SUBSUMPTION-CATEGORIES*))
	(if (null cat)
		(return-from outer nil))

	(if (listp cat)
		(return-from outer (contains cat pred)))

	(if (and (symbolp cat) (fboundp cat))
		(return-from outer (funcall cat pred)))

	(return-from outer nil)
)
)

(ldefun location-adv? (adv)
(and
	(symbolp adv)
	(subsumes 'LOCATION.N
		(retag-as adv 'N))
)
)

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
	(ll-cache
		#'u-subsumption-score
		(list schema-pred story-pred)
		100
		nil
	)
)

(ldefun u-subsumption-score (schema-pred story-pred)
(block outer
	; If they're equal, schema subsumes story
	(if (equal schema-pred story-pred)
		(return-from outer 1.0)
	)

	(if (and
		(equal schema-pred 'ACT.V)
		(lex-verb? story-pred))
		; then
		(return-from outer 0.75))

	; Strip match numbers.
	(let ((schema-pred-no-num (get-schema-match-name schema-pred)))
		(if (not (null schema-pred-no-num))
			(setf schema-pred schema-pred-no-num)))
	(let ((story-pred-no-num (get-schema-match-name story-pred)))
		(if (not (null story-pred-no-num))
			(setf story-pred story-pred-no-num)))

	; ...Or if the story pred has attrs over the schema pred.
	(if (equal schema-pred (pred-base story-pred))
		(return-from outer 0.95)
	)

	; ...Or if they're synonyms
	(if (or
			(member schema-pred (cached-wordnet-synonyms story-pred) :test #'equal)
			(member story-pred (cached-wordnet-synonyms schema-pred) :test #'equal))
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

	(loop for k being the hash-keys of *SUBSUMPTION-CATEGORIES* do (block cat
		(if (not (equal schema-pred k))
			(return-from cat))

		(setf category (gethash k *SUBSUMPTION-CATEGORIES*))

		(if (listp category)
			(if (contains category story-pred)
				(return-from outer 0.9)))

		(if (and (symbolp category) (fboundp category))
			(if (funcall category story-pred)
				(return-from outer 0.9)))

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
	(loop for ladder in (cached-wordnet-hypernyms wn-story-pred)
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
		(cached-wordnet-hypernyms pred)
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
	(setf shared-categories (intersection
		(get-subsumption-categories pred1)
		(get-subsumption-categories pred2)
		:test #'equal))
	(if (not (null shared-categories))
		(return-from outer (car shared-categories))
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
						; (setf memb (member e l2 :test (lambda (a b) (not (null (intersection (listify-nonlists a) (listify-nonlists b) :test #'equal))))))
						(setf memb (member e l2 :test #'equal))
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
			;(and nil (or ; NOTE: disabled, use interesting-common-ancestor
				; The last three for nouns are usually very
				; general.
				;(not (lex-noun? closest-ancestor))
				;(> closest-ancestor-len 3)
			;))
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

(ldefun common-ancestor (pred1 pred2)
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


	(setf retval (common-ancestor-no-check pred1 pred2))

	(if (equal retval pred1)
		(return-from outer pred1))
	(if (equal retval pred2)
		(return-from outer pred2))

	(if (or
			(not (listp retval))
			(loop for e in retval thereis (not (canon-pred? e))))
		; then
		(return-from outer retval)
	)

	(return-from outer (car retval))
)
)

(ldefun interesting-common-ancestor (pred1 pred2)
	(let ((ca (common-ancestor pred1 pred2)))
		(if (contains '(PHYSICAL_ENTITY.N ENTITY.N OBJECT.N ACT.V) ca)
			; then
			nil
			; else
			ca
		)
	)
)

(ldefun basic-level-maybe-nil (el)
	(cond
		((lex-noun? el)
			(gethash el *NOUN-BASIC-LEVELS*))
		((lex-verb? el)
			(gethash el *VERB-BASIC-LEVELS*))
		((mp el (list (list 'id? 'K) 'lex-noun?))
			(gethash (second el) *NOUN-BASIC-LEVELS*))
		((canon-ka? el)
			(list 'KA (pred-base (second el))))
			;'action.n)
		(t nil)
	)
)

(setf special-basic-levels (mk-hashtable '(
	(PERSON.N AGENT.N)
	(FOOD.N FOOD.N)
	(WATER.N WATER.N)
	(AGENT.N AGENT.N)
	(OBJECT.N OBJECT.N)
)))

(ldefun basic-level (el)
(block outer
	(setf bl (basic-level-maybe-nil el))
	(if (null bl)
		(return-from outer el))

	(if (not (null (gethash el special-basic-levels)))
		(return-from outer (gethash el special-basic-levels)))

	(if (not (null (gethash bl special-basic-levels)))
		(return-from outer (gethash bl special-basic-levels)))

	(return-from outer bl)
)
)
