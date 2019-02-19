; This file specifies a context-free grammar for limited EL formulas
; in the form of recursive descent rules.

; OPT: a cache for all preds, similar to the cache in (defun mp)

(load "real_util.lisp")

(defun has-ext? (x e)
	(and
		(symbolp x)
		(stringp e)
		(>= (length (string x)) (length e))
		(equal
			e
			(subseq
				(string x)
				(- (length (string x)) (length e))
				(length (string x))
			)
		)
	)
)

(defun remove-ext (x e)
	(if (not (has-ext? x e))
		x

		;else
		(intern (subseq
			(string x)
			0
			(- (length (string x)) (length e))
		))
	)
)

(defun lex-verb? (x)
	(has-ext? x ".V")
)

(defun lex-var? (x)
	(varp x)
)

(defun lex-number? (x)
	(numberp x)
)

(defun lex-noun? (x)
	(has-ext? x ".N")
)

(defun lex-p? (x)
	(has-ext? x ".P")
)

(defun lex-p-arg? (x)
	(has-ext? x ".P-ARG")
)

(defun lex-pronoun? (x)
	(has-ext? x ".PRO")
)

(defun lex-name? (x)
	(has-ext? x ".NAME")
)

(defun lex-skolem? (x)
	(has-ext? x ".SK")
)

(defun lex-modal? (x)
(or
	(has-ext? x ".AUX-V")
	(has-ext? x ".MD")
)
)

(defun lex-adj? (x)
	(has-ext? x ".A")
)

(defun lex-sentprep? (x)
	(has-ext? x ".PS")
)

(defun lex-det? (x)
	(has-ext? x ".D")
)

(defun lex-adv-a? (x)
	(has-ext? x ".ADV-A")
)

(defun lex-adv-s? (x)
	(has-ext? x ".ADV-S")
)

(defun lex-adv-e? (x)
	(has-ext? x ".ADV-E")
)

(defun lex-coord? (x)
	(has-ext? x ".CC")
)

(defun lex-adv-f? (x)
	(has-ext? x ".ADV-F")
)

(defun lex-ent? (x)
	(and
		(symbolp x)
		(alphanum-str? (string x))
	)
)

(defun lex-ep-var? (x)
(and
	(has-prefix? (string x) "E")
	(> (length (string x)) 2)
	(is-num-str? (subseq (string x) 1 (length (string x))))
)
)

(defun lex-ep-ref? (x)
(or
	(lex-ep-var? x)
	(and
		(has-suffix? (string x) ".SK")
		(lex-ep-var? (intern (remove-suffix (string x) ".SK")))
	)
)
)

; Equal-to-value predicate generator
(setf id-pred-counter 0)
(setf id-pred-map (make-hash-table :test #'equal))
(setf id-pred-rev-map (make-hash-table :test #'equal))
(defun id? (e)
(progn
	(if (null (gethash e id-pred-map))
		(progn
		(setf (gethash e id-pred-map) (+ 1 id-pred-counter))
		(setf (gethash (+ 1 id-pred-counter) id-pred-rev-map) e)
		(setf id-pred-counter (+ 1 id-pred-counter))
		)
	)

	(setf (fdefinition (intern (format nil "ID-PRED-~d" (gethash e id-pred-map))))
		(lambda (x) (equal x e))
	)

	(intern (format nil "ID-PRED-~d" (gethash e id-pred-map)))
)
)

; Use to short-circuit evaluation
(defun any? (x)
	t
)

(defun plus (pred)
	(if (plussed? pred)
		nil

		; else
		(intern (format nil "~s+" pred))
	)
)

(defun star (pred)
	(if (starred? pred)
		nil

		; else
		(intern (format nil "~s*" pred))
	)
)

(defun plussed? (pred)
	(and
		(has-ext? pred "+")
	)
)

(defun starred? (pred)
	(and
		(has-ext? pred "*")
	)
)

(defun unplus (pluspred)
	(if (not (plussed? pluspred))
		nil

		;else
		(remove-ext pluspred "+")
	)
)

(defun unstar (starpred)
	(if (not (starred? starpred))
		nil

		;else
		(remove-ext starpred "*")
	)
)



; Phrasal parse rules

(setf pred-cache (make-hash-table :test #'equal))

(defun cached-funcall (cache func args)
(block outer
	(if (null (gethash (list func args) cache))
		(setf (gethash (list func args) cache)
			(funcall func args))
	)

	(return-from outer (gethash (list func args) cache))
)
)

; recursive multi-predicate application
(defun mp (x preds)
(block outer
	(if (and (null x) (null preds))
		(return-from outer t)
	)

	(if (null preds)
		; no preds left to consume values
		(return-from outer nil)
	)

	; even if we're out of tokens, we can still remove a starred
	; pred and recurse
	(if (and (null x) (starred? (car preds)))
		(return-from outer
			(mp x (cdr preds))
		)
	)

	(if (not (listp x))
		; someone passed a naked atom into an MP in a desperate
		; attempt to find a match; nothing to see here
		(return-from outer nil)
	)

	(if (not (listp preds))
		; this really shouldn't happen; it's probably the programmer's fault
		; haha, never mind, it can happen legitimately now that there's tree recursion
		(progn
		; (format t "why did you pass non-list pred ~s with pattern ~s into mp?~%" preds x)
		(return-from outer nil)
		)
	)

	; check to see if we have a nested list of predicates; if we do, we'll try to tree-recurse
	(if (listp (car preds))
		; tree-recurse with the head token.
		; if it's not also a list, the recursive case will handle that
		; (as well as consuming any stars from this list, on the offchance)
		(return-from outer (mp (car x) (car preds)))
	)

	; (format t "checking tok list ~s~%against pred list ~s~%" x preds)

	; if the first pred is plussed, test the head token as always
	(if (plussed? (car preds))
		(if (cached-funcall pred-cache (unplus (car preds)) (car x))
			; the head token passes, so star the pred and recurse
			(progn ;(format t "passes~%")
			(return-from outer
				(mp
					(cdr x)
					(append
						(list (star (unplus (car preds))))
						(cdr preds)
					)
				)
			)
			)

			; the head token didn't pass; no match
			(progn ;(format t "didn't pass~%")
			(return-from outer nil)
			)
		)
	)

	; if the first pred is starred, test the head token as always
	(if (starred? (car preds))
		(if (cached-funcall pred-cache (unstar (car preds)) (car x))
			; the head token passes, so leave the star pred and recurse
			(return-from outer (mp (cdr x) preds))

			; the head token didn't pass; remove the star, but continue on
			(return-from outer (mp x (cdr preds)))
		)
	)

	; if the first pred isn't plussed or starred, just do what comes naturally
	(if (cached-funcall pred-cache (car preds) (car x))
		; the head token passes; recurse
		(return-from outer (mp (cdr x) (cdr preds)))

		; the head token didn't pass; no match
		(return-from outer nil)
	)
)
)

(defun base? (x)
(handler-case
(or
	
)
(error (x) nil)
)
)

(defun not-sent? (x)
	(not (sent? x))
)

(defun sent-punct? (x)
(or
	(id? '?)
	(id? '!)
)
)

(defun sent-reifier? (x)
(or
	(id? 'that)
	(id? 'tht)
	(id? 'whether)
	(id? 'ans-to)
	(id? 'KE)
)
)

(defun no-ep-sent? (x)
(or
	(mp x (list 'term? 'verb?)) ; subject verb
	(mp x (list 'term? 'lex-verb? 'term?)) ; special case for flatter sentences
	(mp x (list 'adv-a? 'term? 'verb?)) ; action adverb, subject, verb
	(mp x (list 'lex-modal? 'no-ep-sent?)) ; a modal elevated to the sentence level

	;(mp x (list 'term? (id? '=) 'term?)) ; equality
	; (mp x (list 'sent? 'lex-coord? 'sent?+))
)
)

; parse-normalized-sent moves all adverbials into the verb clause, re-curries flattened term<->verb predicate chains, and rejects modal sentences (for now)
; the first element is the subject
; the second element is the verb clause
; no exceptions
(defun normalize-no-ep-sent (x)
(block outer
	(if (mp x (list 'term? 'verb?))
		(return-from outer (list (first x) (second x)))
	)
	(if (mp x (list 'term? 'lex-verb? 'term?))
		(return-from outer (list (first x) (list (second x) (third x))))
	)
	(if (mp x (list 'adv-a? 'term? 'verb?))
		(return-from outer (list (second x)
			(append (list (first x))
				(if (listp (third x)) (third x) (list (third x))))))
	)
	(if (mp x (list 'lex-modal? 'no-ep-sent?))
		(return-from outer nil)
	)

	;(mp x (list 'term? (id? '=) 'term?)) ; equality
	; (mp x (list 'sent? 'lex-coord? 'sent?+))
)
)

; TODO: recursive normalization? might just be able to normalize extracted sub-sentences as an inference step once they get added to KB
; TODO: named groups and general transductions would be good, instead of just this hardcoded normalization nonsense
; TODO: honestly, just integrate TTT
(defun normalize-sent (x)
(let ((noep nil))
(block outer
	(setf noep (normalize-no-ep-sent x))
	(if (not (null noep))
		(return-from outer noep)
	)

	; TODO: optimize this so it doesn't parse twice
	; TODO: or, instead, just figure out how to get mp to do transductions
	(if (mp x (list 'no-ep-sent? (id? '**) 'ep?))
		(return-from outer (normalize-sent (first x)))
	)

	(if (mp x (list 'sent? 'sent-punct?))
		(return-from outer (normalize-sent 'sent?))
	)

	; just return the input here; if it wasn't
	; a sentence, it doesn't need normalizing
	(return-from outer x)
)
)
)

(defun char-wff? (x)
(or
	(mp x (list 'unchar-wff? (id? '**) 'lex-ep-ref?))
)
)

(defun uncharred-ep? (x)
(or
	(lex-ep-ref? x)

	(and
		(listp x)
		; OPT: the double loop
		(loop for e in x always (wff? e))
		(loop for wff in x never (char-wff? wff))
	)
)
)

(defun ep? (x)
(or
	(uncharred-ep? x)
	(charred-ep? x)
)
)

(defun charred-ep? (x)
(or
	; An episode can be a single WFF with a ** operator.
	(char-wff? x)

	; An episode can be a list of WFFs with one
	; characterizing it.
	(and
		; OPT: the double loop
		(listp x)
		(loop for e in x always (wff? e))
		(loop for wff in x thereis (char-wff? wff))
	)
)
)

(defun ep-rel? (x)
(or
	(equal 'BEFORE.P x)
	(equal 'AFTER.P x)
	(equal 'AT-ABOUT.P x)
	(equal 'DURING.P x)
	(equal 'SAME-TIME.P x)
	(equal 'CAUSE-OF.N x)
	(equal '= x)
)
)

; TODO: ask Len whether PERTAIN-TO, etc. are special, or, if not, what types they are
(defun ent-rel? (x)
(or
	(equal 'PERTAIN-TO x)
	(noun? x)
)
)

(defun unchar-wff? (x)
(or
	; any sentence is a WFF
	(sent? x)

	; e.g. (E1.SK AT-ABOUT NOW0)
	(mp x (list 'ep? 'ep-rel? 'ep?)

	; e.g. (KITTEN9.SK (PRETTY.A KITTEN.N))
	(mp x (list 'ent? 'pred?)) ; TODO: should this be "term pred"?

	; e.g. (KITTEN3.SK PERTAIN-TO MAY.NAME), (MOTHER5.SK MOTHER-OF.N SHE.PRO)
	(mp x (list 'ent? 'ent-rel? 'ent?))
)
)
)

(defun wff? (x)
(or
	(unchar-wff? x)
	(char-wff? x)
)
)

(defun sent? (x)
(or
	(no-ep-sent? x)
	(mp x (list 'no-ep-sent? (id? '**) 'any?)) ; allow characterization of a variable
	(mp x (list 'sent? 'sent-punct?))
)
)

(defun pred? (x)
(or
	(verb? x)
	(noun? x)
	(adj? x)
	(pp? x)
)
)

(defun p-arg? (x)
(or
	(mp x (list 'lex-p-arg? 'term?))
	(mp x (list 'lex-p-arg? 'pred?))
)
)

(defun adv-a? (x)
(or
	(lex-adv-a? x)
	(mp x (list (id? 'adv-a) 'pred?))
	(mp x (list 'adv-a? 'lex-coord? 'adv-a?+))
)
)

(defun adv-s? (x)
(or
	(lex-adv-s? x)
	(mp x (list (id? 'adv-s) 'pred?))
	(mp x (list 'adv-s? 'lex-coord? 'adv-s?+))
)
)

(defun adv-e? (x)
(or
	(lex-adv-e? x)
	(mp x (list (id? 'adv-e) 'pred?))
	(mp x (list 'adv-e? 'lex-coord? 'adv-e?+))
)
)

(defun adv-f? (x)
(or
	(lex-adv-f? x)
	(mp x (list (id? 'adv-f) 'pred?))
	(mp x (list 'adv-f? 'lex-coord? 'adv-f?+))
)
)

(defun verb-arg? (x)
(or
	(term? x)
	(pred? x)
	(adv-a? x)
	(p-arg? x)
)
)

(defun pp? (x)
(or
	(lambda? x)
	(mp x (list 'lex-p? 'term?))
	(mp x (list 'pp? 'lex-coord? 'pp?+))
	(mp x (list 'adv-a? 'pp?))
	(mp x (list 'pp? 'adv-a?))
)
)

(defun ent-list? (x)
(or
	(lex-ent? x)

	(and
		(listp x)
		(loop for e in x always (lex-ent? x))
	)
)
)

(defun lambda? (x)
(or
	(mp x (list (id? 'L) 'ent-list? 'pred?))
)
)

(defun verb? (x)
(or
	(lex-verb? x)
	(lambda? x)
	(mp x (list 'lex-modal? 'verb?))
	(mp x (list 'verb? 'verb-arg?+))
	(mp x (list 'adv-a? 'verb?))
	(mp x (list 'verb? 'lex-coord? 'verb?+))
)
)

(defun noun? (x)
(or
	(lex-noun? x)
	(lambda? x)
	(mp x (list (id? 'plur) 'noun?))
	(mp x (list 'adj? 'noun?))
	(mp x (list 'noun? 'lex-coord? 'noun?+))
	(mp x (list 'noun? 'noun?))
	(mp x (list 'noun? 'p-arg?))
)
)

(defun adj? (x)
(or
	(lambda? x)
	(lex-adj? x)
)
)

(defun det? (x)
(or
	(lex-det? x)
)
)

(defun term? (x)
(or
	(lex-pronoun? x)
	(lex-name? x)
	(lex-number? x)
	(lex-skolem? x)
	(lex-var? x)
	(mp x (list 'det? 'noun?))
	(mp x (list (id? 'K) 'noun?))
	(mp x (list (id? 'KA) 'verb?))
	(mp x (list 'sent-reifier? 'sent?))
	(lex-ent? x) ; TODO: not sure about this, but we need to handle e.g. quantified variables
)
)








