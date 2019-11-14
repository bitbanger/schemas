(load "real_util.lisp")
(load "norm-stories.lisp")
(load "norm-el.lisp")
(load "norm-unify.lisp")
(load "parse.lisp")
(load "norm-time.lisp")
(load "norm-kb.lisp")

(defparameter *BLANK-SCHEMA*
'(epi-schema ((?x blank.v) ** ?E)
))

(defparameter *KB-EXPLICIT* (make-hash-table :test #'equal))
(defparameter *KB-ARG-IND* (make-hash-table :test #'equal))
(defparameter *KB-PRED-IND* (make-hash-table :test #'equal))
(defparameter *KB* (list *KB-EXPLICIT* *KB-ARG-IND* *KB-PRED-IND*))

; (defparameter *STORY* *FLOWER-STORY*)
(defparameter *STORY* *MONKEY-STORY*)

; Determine whether a term needs coreference
(defun coref? (term kb)
(or
	(lex-pronoun? term)
	(eval-prop (list term 'INDEF.A) kb)
)
)

; Transform a proposition into an equivalent
; one with a single argument curried out.
(defun curry-prop (prop carg)
(block cp
	; Strip charstars
	(if (canon-charstar? prop)
		; then
		(progn
		(setf curry-res (curry (car prop) carg))
		(return-from cp (list (car curry-res) (second curry-res) (list (third curry-res) (second prop) (third prop))))
		;(return-from cr (curry (car prop) carg))
		)
	)

	; Don't curry a predicate that's already monadic
	(if (equal 1 (length (prop-all-args prop)))
		(return-from cp prop))

	(list carg (curry prop carg))
)
)

; Generate all possible monadic curry
; propositions from an n-adic one
(defun all-curries (prop)
	(loop for arg in (prop-all-args prop)
		collect (curry-prop prop arg)
	)
)

; Get all terms to which predicates apply that can be
; unified with a given predicate
(defun get-pred-uni-terms (pred kb whole-story)
(block gput
	(setf terms (list))
	(loop for cand-pred being the hash-keys of (kb-pred-ind kb)
		do (block unil
			(dbg 'coref "pred is ~s~%" pred)
			(dbg 'coref "cand-pred is ~s~%" cand-pred)
			(dbg 'coref "~%")
			(if (not (unify-preds pred cand-pred (make-hash-table :test #'equal) *BLANK-SCHEMA* whole-story))
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


; Get all terms to which a predicate applies
; TODO: do this much more efficiently for complex predicates
; (e.g. disjunctions)
(defun get-pred-terms (pred kb)
	(loop for term being the hash-keys of (kb-arg-ind kb)
		if (eval-prop (list term pred) kb)
			collect term
	)
)

(defun subsumes-prop? (gen-prop spec-prop)
(block outer
	(setf gen-papm (prop-args-pred-mods gen-prop))
	(setf gen-pre (car gen-papm))
	(setf gen-pred (second gen-papm))
	(setf gen-post (third gen-papm))
	(setf gen-mods (fourth gen-papm))
	(setf spec-papm (prop-args-pred-mods spec-prop))
	(setf spec-pre (car spec-papm))
	(setf spec-pred (second spec-papm))
	(setf spec-post (third spec-papm))
	(setf spec-mods (fourth spec-papm))

	; TODO: account for mods here. Can we ignore?
	(if (and
			(equal gen-pre spec-pre)
			(equal gen-post spec-post)
			(subsumes gen-pred spec-pred))
		; then
		(return-from outer t)
	)
)
)

; Evaluate whether a proposition is true given a knowledge base
(defun eval-prop (prop kb)
(let (arg)
(block outer
	; Only lists are propositions
	(if (not (listp prop)) (return-from outer 'ERROR))

	(setf pred (prop-pred prop))
	(setf args (prop-all-args prop))
	(setf mods (prop-mods prop))
	;(dbg 'coref "prop ~s~%" prop)
	;(dbg 'coref "pred ~s~%" pred)
	;(dbg 'coref "args ~s~%" args)
	;(dbg 'coref "mods ~s~%" mods)
	;(dbg 'coref "~%")

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


	; Handle temporal predicates.
	(if (time-prop? prop)
		; then
		(block eval-time-prop
			(setf story-time-props (loop for p being the hash-keys of (kb-explicit kb) if (time-prop? p) collect p))

			(load-time-model story-time-props)

			(return-from outer (eval-time-prop prop))
		)
	)


	; Check for subsuming predicates in the KB.
	; TODO: optimize this somehow. Use kb-arg-ind, or
	; change indexing to account for subsumptions?
	(loop for kbp being the hash-keys of (kb-explicit kb)
		; If the KB prop is more specific, the general
		; test prop is implied
		if (subsumes-prop? prop kbp)
			do (return-from outer t)
	)



	; Special cases for implicitly evaluable monadic predicates
	(if (and (equal 2 (length prop)) (equal 1 (length args))) (block monadic-special-cases
		(setf arg (car args))

		; Names refer to agents.
		(if (and (symbolp arg) (has-suffix? (string arg) ".NAME"))
			(if (equal pred 'AGENT.N)
				(return-from outer t))
		)

		; He and she pronouns refer to agents.
		; TODO: handle "they"
		(if (and (symbolp arg) (or (equal arg 'HE.PRO) (equal arg 'SHE.PRO)))
			(if (equal pred 'AGENT.N)
				(return-from outer t))
		)

		; KA-abstractions are actions.
		(if (and (equal pred 'ACTION.N)
				 (canon-kind? arg)
				 (equal (car arg) 'KA))
			; then
			(return-from outer t)
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
	AGENT.N
))

(defun irregular-pred? (pred)
	(not (null (member pred *IRREGULAR-PREDS*)))
)



; Add some "basic world knowledge"
;(add-to-kb '(FRANK.NAME MALE.A) *KB*)
;(add-to-kb '(MAY.NAME FEMALE.A) *KB*)
;(add-to-kb '(HE.PRO MALE.A) *KB*)
;(add-to-kb '(SHE.PRO FEMALE.A) *KB*)
;(add-to-kb '(HE.PRO AGENT1.N))
;(add-to-kb '(HE.PRO MALE.A))

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
;(add-to-kb '(THEY.PRO SET.N) *KB*)
(add-to-kb '(THEY.PRO SET_OF.PR (K OBJECT.N)) *KB*)


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
						append (loop for term in (get-pred-uni-terms pred kb story)
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

				; (format t "best coreference for ~s: ~s (~s shared preds)~%" e max-coref max-count)
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


;(format t "old story: ~s~%" *STORY*)
;(format t "new story: ~s~%" (process-story-coref *STORY* *KB*))



;(eval-prop '(MAY.NAME EAT.V (K BALL.N) (ADV-A (WITH.P (K GUSTO.N)))) *KB*)








