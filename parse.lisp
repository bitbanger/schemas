; This file specifies a context-free grammar for limited EL formulas
; in the form of recursive descent rules.

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
		(progn
		(format t "why did you pass non-list pred ~s with pattern ~s into mp?~%" preds x)
		(return-from outer nil)
		)
	)

	; (format t "checking tok list ~s~%against pred list ~s~%" x preds)

	; if the first pred is plussed, test the head token as always
	(if (plussed? (car preds))
		(if (funcall (unplus (car preds)) (car x))
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
		(if (funcall (unstar (car preds)) (car x))
			; the head token passes, so leave the star pred and recurse
			(return-from outer (mp (cdr x) preds))

			; the head token didn't pass; remove the star, but continue on
			(return-from outer (mp x (cdr preds)))
		)
	)

	; if the first pred isn't plussed or starred, just do what comes naturally
	(if (funcall (car preds) (car x))
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

(defun sent? (x)
(or
	(no-ep-sent? x)
	(mp x (list 'no-ep-sent? (id? '**) 'any?)) ; allow characterization of a variable
	(mp x (list 'sent? 'sent-punct?))
)
)

(defun trim-sent (x)
(block outer
	(if (no-ep-sent? x)
		(return-from outer x)
	)

	; trim off punctuation/episode characterization
	(if (or
		(mp x (list 'no-ep-sent? (id? '**) 'any?))
		(mp x (list 'sent? 'sent-punct?)))
			(return-from outer (car x))
	)

	; it's not a valid sentence
	(return-from outer nil)
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
	(mp x (list 'lex-p? 'term?))
	(mp x (list 'pp? 'lex-coord? 'pp?+))
	(mp x (list 'adv-a? 'pp?))
	(mp x (list 'pp? 'adv-a?))
)
)

(defun verb? (x)
(or
	(lex-verb? x)
	(mp x (list 'lex-modal? 'verb?))
	(mp x (list 'verb? 'verb-arg?+))
	(mp x (list 'adv-a? 'verb?))
	(mp x (list 'verb? 'lex-coord? 'verb?+))
)
)

(defun noun? (x)
(or
	(lex-noun? x)
	(mp x (list (id? 'plur) 'noun?))
	(mp x (list 'adj? 'noun?))
	(mp x (list 'noun? 'lex-coord? 'noun?+))
	(mp x (list 'noun? 'noun?))
	(mp x (list 'noun? 'p-arg?))
)
)

(defun adj? (x)
(or
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
)
)











