(load "real_util.lisp")
(load "stories.lisp")
(load "parse.lisp")

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
	(eval-prop (list term 'THE.A) kb)
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

; Get all predicates that apply to a term
(defun get-term-preds (term kb)
(append
	(loop for prop in (gethash term (kb-arg-ind kb))
		if (not (null (get-pred prop)))
			collect (get-pred prop)
	)

	(loop for pred in *IRREGULAR-PREDS*
		if (eval-prop (list term pred) kb)
			collect pred
	)
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
	; ...and the args by the pred
	(loop for prop-arg in (prop-args effective-wff) do
		(push wff (gethash prop-arg (kb-arg-ind kb)))
		(push prop-arg (gethash pred (kb-pred-ind kb)))
		
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
					if (not (equal pred 'THE.A))
						; do (format t "~s: ~s~%" pred (gethash pred (kb-pred-ind kb)))
						; do (format t "pred is ~s~%" pred)
						append (loop for term in (get-pred-terms pred kb)
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
			;do (format t "	~s -> ~s~%" elem (gethash idx corefs))


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



(eval-prop '(MAY.NAME EAT.V (K BALL.N) (ADV-A (WITH.P (K GUSTO.N)))) *KB*)
