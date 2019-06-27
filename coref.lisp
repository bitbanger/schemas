(load "real_util.lisp")
(load "stories.lisp")
(load "parse.lisp")
(load "wordnet.lisp")

(defparameter *KB-EXPLICIT* (make-hash-table :test #'equal))
(defparameter *KB-ARG-IND* (make-hash-table :test #'equal))
(defparameter *KB-PRED-IND* (make-hash-table :test #'equal))
(defparameter *KB* (list *KB-EXPLICIT* *KB-ARG-IND* *KB-PRED-IND*))

(defun kb-explicit (kb)
	(car kb)
)

(defun kb-arg-ind (kb)
	(second kb)
)

(defun kb-pred-ind (kb)
	(third kb)
)

(defparameter *STORY* flowers_el)

; Extract all arguments from a proposition
(defun prop-args (prop)
	(loop for e in prop
		if (and (term? e) (not (kind? e)))
			collect e
	)
)

(defun all-prop-args (prop)
	(loop for e in prop
		if (and (term? e) (not (adv? e)))
			collect e
	)
)

(defun prop-mods (prop)
	(loop for e in prop
		if (adv? e)
			collect e
	)
)

; Determine whether a term needs coreference
(defun coref? (term kb)
(or
	(lex-pronoun? term)
	(eval-prop (list term 'INDEF.A) kb)
)
)

; Extract the predicate from a proposition
(defun get-pred (prop)
(block gp
	(loop for e in prop
		if (el-pred? e)
			do (return-from gp e)
	)
)
)

; Curry an argument out of a proposition
; to form a monadic lambda predicate that
; holds for that argument
(defun curry (prop carg)
(block cr
	(setf args (all-prop-args prop))

	; Don't curry a predicate that's already monadic
	(if (equal 1 (length args))
		(return-from cr (get-pred prop)))

	(setf lmb (list 'LAMBDA.EL (list 'X)))
	(setf lmb-args (list (get-pred prop)))
	(loop for arg in args
		if (not (equal arg carg))
			do (setf lmb-args (append lmb-args (list arg)))
		else
			do (setf lmb-args (append lmb-args (list 'X)))
	)
	(setf lmb (append lmb (list lmb-args)))

	(return-from cr lmb)
)
)

; Transform a proposition into an equivalent
; one with a single argument curried out.
(defun curry-prop (prop carg)
(block cp
	; Don't curry a predicate that's already monadic
	(if (equal 1 (length (all-prop-args prop)))
		(return-from cp prop))

	(list carg (curry prop carg))
)
)

; Generate all possible monadic curry
; propositions from an n-adic one
(defun all-curries (prop)
	(loop for arg in (all-prop-args prop)
		collect (curry-prop prop arg)
	)
)

; Get all terms to which predicates apply that can be
; unified with a given predicate
(defun get-pred-uni-terms (pred kb)
(block gput
	(setf terms (list))
	(loop for cand-pred being the hash-keys of (kb-pred-ind kb)
		do (block unil
			(if (not (uni-preds? pred cand-pred))
				(return-from unil)
			)

			(loop for term in (gethash cand-pred (kb-pred-ind kb))
				do (push term terms)
			)
		)
	)

	(return-from gput (remove-duplicates terms :test #'equal))
)
)

; Get all predicates that apply to a term
(defun get-term-preds (term kb)
(remove-duplicates
(append
	(loop for prop in (gethash term (kb-arg-ind kb))
		if (not (null (curry prop prop)))
			collect (curry prop term)
	)

	; TODO: figure out a better way to enumerate implicitly-true preds?
	; or maybe too hard in general?
	(loop for pred in *IRREGULAR-PREDS*
		if (eval-prop (list term pred) kb)
			collect pred
	)
) :test #'equal)
)

(defun uni-preds? (p1 p2)
(block unipr
	(if (equal p1 p2)
		(return-from unipr t))

	(if (and (el-lambda? p1) (el-lambda? p2))
		(return-from unipr (uni-props? (third p1) (third p2)))
	)

	(return-from unipr nil)
)
)

(defun uni-props? (phi psi)
(block unip
	(if (equal phi psi)
		(return-from unip t))

	(if (not (equal (get-pred phi) (get-pred psi)))
		(return-from unip nil))

	(setf phi-args (all-prop-args phi))
	(setf psi-args (all-prop-args psi))
	(if (not (equal (length phi-args) (length psi-args)))
		(return-from unip nil))

	; TODO: actually rename the variables, dude ;)
	(setf unifier (make-hash-table :test #'equal))

	; Find the MGU
	; TODO: actually implement the MGU algorithm, don't depend
	; on equality
	(loop for phi-arg in phi-args for psi-arg in psi-args
		do (block uni-loop
			; Args are the same; no unification needed
			(if (equal phi-arg psi-arg)
				(return-from uni-loop)
			)

			; Two vars are easily unified
			(if (and (lex-ent? phi-arg) (lex-ent? psi-arg))
				(progn
					(setf (gethash phi-arg unifier) psi-arg)
					(return-from uni-loop)
				)
			)

			; A var can bind to anything once (skipping occurs check & subs...)
			(if (lex-ent? phi-arg)
				(if (null (gethash phi-arg unifier))
					(progn
						(setf (gethash phi-arg unifier) psi-arg)
						(return-from uni-loop)
					)
				)
			)
			(if (lex-ent? psi-arg)
				(if (null (gethash psi-arg unifier))
					(progn
						(setf (gethash psi-arg unifier) phi-arg)
						(return-from uni-loop)
					)
				)
			)


			; Check whether the terms are unifiable
			(if (uni-terms? phi-arg psi-arg)
				(return-from uni-loop))


			; Not unifiable
			(return-from unip nil)
		)
	)

	(return-from unip t)
)
)

(defun uni-terms? (sub super)
(block st
	(if (equal sub super) (return-from st t))

	(if (and (kind-of-noun? sub) (kind-of-noun? super))
		; These will technically be predicates, not terms,
		; but that's fine.
		(return-from st (uni-terms? (second sub) (second super)))
	)

	;(if (and (lex-noun? sub) (lex-noun? super))
	;	(return-from st (not (null (member super (wordnet-hypernyms sub) :test #'equal))))
	;)

	(if (and (noun? sub) (noun? super))
		; We'll assume that the final nouns just need to be subterms.
		; We'll ignore adjectives, etc. for now.
		; But it's a big....
		; TODO
		(block two-nouns
			(if (lex-noun? sub)
				(setf n1 sub)
				; else
				(setf n1 (car (last (loop for e in sub if (lex-noun? e) collect e))))
			)
			(if (lex-noun? super)
				(setf n2 super)
				; else
				(setf n2 (car (last (loop for e in super if (lex-noun? e) collect e))))
			)


			(return-from st (equal n1 n2))
		)
	)

	(return-from st nil)
)
)

; Get all terms to which a predicate applies
; TODO: do this much more efficiently for complex predicates
; (e.g. disjunctions)
(defun get-pred-terms (pred kb)
	(loop for term being the hash-keys of (kb-arg-ind kb)
		if (eval-prop (list term pred) kb)
			collect term
	)
)

; Evaluate whether a proposition is true given a knowledge base
(defun eval-prop (prop kb)
(let (arg)
(block outer
	; Only lists are propositions
	(if (not (listp prop)) (return-from outer 'ERROR))

	(setf pred (get-pred prop))
	(setf args (all-prop-args prop))
	(setf mods (prop-mods prop))

	; (format t "raw proposition: ~s~%" prop)
	; (format t "canonical proposition: ~s(" pred)
	;(loop for arg in args
	;	do (format t " ~s " arg)
	;)
	;(format t ")~%")
	;(if (> (length mods) 0) (block print-mods
	;	(format t "	prop modifiers:~%")
	;	(loop for mod in mods
	;		do (format t "		~s~%" mod)
	;	)
	;))



	; Strip negations
	(if (equal (car prop) 'NOT)
		(return-from outer (not (eval-prop (second prop) kb))))

	; Check for explicit knowledge of this or its negation.
	(if (gethash prop (kb-explicit kb))
		(return-from outer t)
	)
	(if (gethash (list 'NOT prop) (kb-explicit kb))
		(return-from outer nil)
	)

	; Special cases for implicitly evaluable monadic predicates
	(if (and (equal 2 (length prop)) (equal 1 (length args))) (block monadic-special-cases
		(setf arg (car args))

		; Names refer to agents.
		(if (and (symbolp arg) (has-suffix? (string arg) ".NAME"))
			(if (equal pred 'AGENT1.N)
				(return-from outer t))
		)

		; He and she pronouns refer to agents.
		; TODO: handle "they"
		(if (and (symbolp arg) (or (equal arg 'HE.PRO) (equal arg 'SHE.PRO)))
			(if (equal pred 'AGENT1.N)
				(return-from outer t))
		)
	))

	; Handle "OR"s
	(if (not (null (member 'OR prop))) (block handle-or
		(loop for e in prop
			if (not (equal 'OR e)) do (block handle-or-inner
				(setf ep-res (eval-prop e kb))
				(if (equal 'ERROR ep-res) (return-from outer 'ERROR))
				(if ep-res (return-from outer t))
			)
		)

		; Nothing evaluated to t
		(return-from outer nil)
	))

	; Handle "ANDs"
	(if (not (null (member 'AND prop))) (block handle-or
		(loop for e in prop
			if (not (equal 'AND e)) do (block handle-or-inner
				(setf ep-res (eval-prop e kb))
				(if (equal 'ERROR ep-res) (return-from outer 'ERROR))
				(if (null ep-res) (return-from outer nil))
			)
		)

		; Nothing evaluated to nil
		(return-from outer t)
	))

))
)

(defun safe-inc (n)
	(if (null n) 1 (+ n 1))
)

(defparameter *IRREGULAR-PREDS* '(
	AGENT1.N
))

(defun irregular-pred? (pred)
	(not (null (member pred *IRREGULAR-PREDS*)))
)

; Add a formula to the knowledge base, under all its various indices
(defun add-to-kb (wff kb) (block add
	; Normalize out episode characterizers
	(setf effective-wff wff)
	(if (char-wff? wff) (setf effective-wff (car wff)))

	; Add the entire formula to the main KB
	(setf (gethash wff (kb-explicit kb)) t)

	(setf pred (get-pred effective-wff))


	; Index the formula by its args in the indexed KB
	; ...and the args by the curried proposition predicate,
	; or just the predicate if it's monadic. Also the curried
	; propositions by their respective arguments, for symmetry.
	(setf args (all-prop-args effective-wff))
	(loop for prop-arg in args do (block pal
		(push wff (gethash prop-arg (kb-arg-ind kb)))

		;(format t "got ~s args in ~s~%" (length args) effective-wff)

		(if (equal 1 (length args))
			(progn
			;(format t "pushing ~s to gethash of pred ~s~%" prop-arg pred)
			(push prop-arg (gethash pred (kb-pred-ind kb)))
			)
			; else
			(progn
				; (format t "pushing ~s to the gethash of ~s~%" prop-arg (curry effective-wff prop-arg))
				(setf curried (curry effective-wff prop-arg))
				(push prop-arg (gethash curried (kb-pred-ind kb)))

				; duplicate-averse append prop-arg to curried in pred ind
				(if (null (member prop-arg (gethash curried (kb-pred-ind kb)) :test #'equal))
					(setf (gethash curried (kb-pred-ind kb)) (append (gethash curried (kb-pred-ind kb)) (list prop-arg))))

				; duplicate-averse append curried prop to prop-arg in arg ind
				(if (null (member (list prop-arg curried) (gethash prop-arg (kb-arg-ind kb)) :test #'equal))
					(setf (gethash prop-arg (kb-arg-ind kb)) (append (gethash prop-arg (kb-arg-ind kb)) (list (list prop-arg curried)))))

				; (format t "pushing ~s to the gethash of ~s~%" (list prop-arg curried) prop-arg)
			)
			)
	)
	)
))


; Add some "basic world knowledge"
(add-to-kb '(FRANK.NAME MALE.A) *KB*)
(add-to-kb '(MAY.NAME FEMALE.A) *KB*)
(add-to-kb '(HE.PRO MALE.A) *KB*)
(add-to-kb '(SHE.PRO FEMALE.A) *KB*)

; TODO: "they" should also admit male or female
; individuals, probably, but the subject/object
; distinction will be a little subtle to intuit
; which one is best. Also, that'll require a
; lambda predicate for the disjunction, so
; eval-prop will have to do that, and maybe even
; some lexical scoping. Boo. :(

; ALSO TODO: eval-prop needs to account for predicate
; hierarchies. So, (FLOWERS1.SK SET-OF (K FLOWER.N))
; should cause an evaluation of (FLOWERS1.SK SET-OF (K OBJECT.N))
; to return true. Also, (FLOWERS1.SK SET-OF (K (YELLOW.A FLOWER.N)))
; should return true. Tricky....
(add-to-kb '(THEY.PRO SET.N) *KB*)


; Process the story one sentence at a time, so we can do
; coreference analysis in one pass. Output the story with
; all coreferences resolved.
(defun process-story-coref (story kb) (let (corefs) (block outer

(setf new-story (list))


(loop for conj in story do (block loop_outer
		; Make a coreference map for the sentence
		(setf corefs (make-hash-table :test #'equal))


		; Add all propositions to the KB, indexed by their arguments
		(loop for wff in conj do (block loop_inner
			(add-to-kb wff kb)
		))


		; Store the indexed sentence with its old indices.
		; That way, when we replace terms in it one by one,
		; we can replace them with dummy indices and not have
		; to re-index, which could break the indices in the
		; index->referent map we'll make.
		(setf old-idx-conj (el-idcs conj))


		; Find story terms that need coreference
		;(format t "conj is ~s~%" conj)
		;(format t "idx conj is ~s~%" old-idx-conj)
		;(format t "terms are ~s~%" (get-elements-pred-pairs conj #'term?))
		(loop for e-pair in (get-elements-pred-pairs conj #'term?)
			do (setf e (car e-pair))
			do (setf e-idx (second e-pair))
			; do (format t "e is ~s~%" e)
			if (coref? e kb) do (block resolve-coref
				; For each pred, find other terms w/ that pred
				(setf share-count (make-hash-table :test #'equal))

				(loop for pred in (get-term-preds e kb)
					if (not (equal pred 'INDEF.A))
						; do (format t "~s: ~s~%" pred (gethash pred (kb-pred-ind kb)))
						; do (format t "pred is ~s~%" pred)
						append (loop for term in (get-pred-uni-terms pred kb)
							if (not (equal term e))
								; collect term
								do (setf (gethash term share-count) (safe-inc (gethash term share-count)))
						)
				)

				(setf max-count 0)
				(setf max-coref nil)
				(loop for term being the hash-keys of share-count
					if (>= (gethash term share-count) max-count)
						do (block update
							(setf max-count (gethash term share-count))
							(setf max-coref term)
						)
				)

				;(format t "best coreference for ~s: ~s (~s shared preds)~%" e max-coref max-count)
				(if (not (null max-coref))
					(setf (gethash e-idx corefs) max-coref))
			)
		)

		;(format t "~%~%")

		;(format t "old sentence: ~s~%" conj)

		;(format t "resolutions:~%")
		(setf new-sent old-idx-conj)
		;(format t "new-sent: ~s~%" new-sent)
		(loop for idx being the hash-keys of corefs
			; We're using the helpers because we've already done
			; the indexing ourselves; we want to use the old indices
			; for replacement, remember? We're also going to use a
			; dummy index (-1) for the substitutions so we don't
			; consider them during replacements. All these indices
			; get cleaned at the end, so it's fine.
			do (setf new-sent (replace-element-idx-helper new-sent idx (gethash idx corefs)))
			do (setf elem (clean-idcs (get-element-idx-helper old-idx-conj idx)))
			;do (format t "new new sent: ~s~%" new-sent)
			do (format t "	~s -> ~s~%" elem (gethash idx corefs))


			; So, up till now, we've only replaced the original instances of a term
			; that triggered coreference resolution, i.e., pronouns & "the"-determined
			; terms. But in the case of absolute names, like FLOWERS2.SK -> FLOWERS1.SK,
			; we want to make *all* substitutions, because once they map somewhere,
			; they map anywhere (unlike complex terms in general).
			if (lex-const? elem)
				do (setf new-sent (replace-vals elem (gethash idx corefs) new-sent))
		)
		(setf new-sent (clean-idcs new-sent))


		;(format t "resolved sentence: ~s~%" new-sent)
		; (push new-sent new-story)
		(setf new-story (append new-story (list new-sent)))

)
)

(return-from outer new-story)

)))


(format t "old story: ~s~%" *STORY*)
(format t "new story: ~s~%" (process-story-coref *STORY* *KB*))



;(eval-prop '(MAY.NAME EAT.V (K BALL.N) (ADV-A (WITH.P (K GUSTO.N)))) *KB*)
