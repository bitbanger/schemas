; This file specifies a context-free grammar for limited EL formulas
; in the form of recursive descent rules.

; OPT: a cache for all preds, similar to the cache in (defun mp)

(load "ll-load.lisp")

(ll-load "ll-util.lisp")

(defparameter *KEYWORD-PREDS* '(
	=
	BEFORE
	AT-ABOUT
	AFTER
	IMPINGES-ON
	ORIENTS
	DURING
	PERTAIN-TO
	AT-OR-BEFORE
	CONSEC
	CAUSE-OF
	POSTCOND-OF
	PRECOND-OF
	SAME-TIME
	RIGHT-AFTER
	STRICTLY-BEFORE
	CERTAIN-TO-DEGREE
	NECESSARY-TO-DEGREE
	HAS-EFFECT
))

; TODO: give these extensions
(defparameter *KEYWORDS* (append *KEYWORD-PREDS*
'(
	K
	KA
	KE
	KJ
	THAT
	NOT
	OR
	AND
	IF
	ATTR
	NN
	PLUR
	L
	SET-OF
	:R
)))

(defparameter *KEYWORDS-MAP* (make-hash-table :test #'equal))
(loop for kw in *KEYWORDS*
	do (setf (gethash kw *KEYWORDS-MAP*) t)
)

(defun has-ext? (x e)
(let (
	(strx (if (symbolp x) (string x) nil))
)
	(and
		(symbolp x)
		(stringp e)
		(>= (length strx) (length e))
		(equal
			e
			(subseq
				strx
				(- (length strx) (length e))
				(length strx)
			)
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

(defun lex-attr-pred? (x)
(or
	(has-ext? x ".NN")
	(has-ext? x ".ATTR")
)
)

(defun lex-verb? (x)
	(has-ext? x ".V")
)

(defun retag-as (x ext)
(let ((pre (car (split-str (string x) "."))))
	(intern (format nil "~a.~a" pre (string ext)))
)
)

(defun lex-metapred? (x)
	(has-ext? x ".?")
)

(defun lex-var? (x)
	(varp x)
)

(defun lex-gensym? (x)
(and
	(symbolp x)
	(has-prefix? (string x) "G")
	(is-num-str? (remove-prefix (string x) "G"))
)
)

(defun lex-naked-var? (x)
(and
	(symbolp x)
	(not (special-str x))
	(alphanum-str? (string x))
)
)

(defun lex-sk-fn? (x)
	(has-ext? x "<-")
)

(defun lex-fn? (x)
(or
	(has-ext? x ".F")
	(lex-sk-fn? x)
)
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

(defun lex-pred? (x)
	(has-ext? x ".PR")
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
	(has-ext? x ".AUX-S")
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

(defun lex-adv? (x)
(or
	(has-ext? x ".ADV")
	(lex-adv-a? x)
	(lex-adv-e? x)
	(lex-adv-s? x)
	(lex-adv-f? x)
)
)

(defun lex-const? (x)
(or
	(lex-name? x)
	(lex-pronoun? x)
	(lex-skolem? x)
	(and
		(not (member x *KEYWORDS* :test #'equal))
		(symbolp x)
		(not (keywordp x))
		(alphanum-str? (string x))
	)
)
)

(defun lex-ent? (x)
	(and
		(symbolp x)
		(alphanum-str? (string x))
	)
)

(defun lex-ep-var? (x)
(and
	(symbolp x)
	(has-prefix? (string x) "E")
	(> (length (string x)) 1)
	(is-num-str? (subseq (string x) 1 (length (string x))))
)
)

(defun lex-schema-ep-var? (x)
(and
	(has-prefix? (string x) "?E")
	(if (> (length (string x)) 2)
		; then
		(is-num-str? (subseq (string x) 2 (length (string x))))
		; else
		t)
)
)

(defun lex-goal-var? (x)
(and
	(has-prefix? (string x) "?G")
	(if (> (length (string x)) 2)
		; then
		(is-num-str? (subseq (string x) 2 (length (string x))))
		; else
		t)
)
)

(defun lex-schema-ep-ref? (x)
(or
	(lex-schema-ep-var? x)
	(and
		(symbolp x)
		(has-suffix? (string x) ".SK")
		(lex-ep-var? (intern (remove-suffix (string x) ".SK")))
	)
)
)

(defun lex-ep-ref? (x)
(or
	(lex-ep-var? x)
	(and
		(symbolp x)
		(has-suffix? (string x) ".SK")
		(lex-ep-var? (intern (remove-suffix (string x) ".SK")))
	)
)
)

(defun lex-ep-const? (x)
	(and
		(symbolp x)
		(has-suffix? (string x) ".SK")
		(lex-ep-var? (intern (remove-suffix (string x) ".SK")))
	)
)

; Equal-to-value predicate generator
(defun id? (e)
	(list 'id? e)
)

(setf id-pred-counter 0)
(setf id-pred-map (make-hash-table :test #'equal))
(setf id-pred-rev-map (make-hash-table :test #'equal))
(defun old-id? (e)
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

(defun uncached-id? (e)
(block outer
	(setf id-pred-name (intern (format nil "ID-PRED-~d" id-pred-counter)))
	(setf id-pred-counter (+ 1 id-pred-counter))

	(setf (fdefinition id-pred-name) (lambda (x) (equal x e)))
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
		; (intern (format nil "~s*" pred))
		(intern (concatenate 'string (string pred) "*"))
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

(setf pred-cache (make-hash-table :test #'equal))

(defun cached-funcall (cache func arg)
(block outer
	; special case for 'id'
	; (if (listp func) (format t "func list ~s~%" func))
	(if (and (listp func) (equal 2 (length func)) (equal 'id? (car func)))
		; then
		(progn
		; (format t "direct equality comparison for ~s and ~s~%" (second func) arg)
		(return-from outer (equal (second func) arg))
		)
	)

	(if (null (gethash (list func arg) cache))
		(setf (gethash (list func arg) cache)
			(funcall func arg))
	)

	(return-from outer (gethash (list func arg) cache))
)
)

(defun id-pred-list? (x)
(and
	(listp x)
	(equal 2 (length x))
	(equal 'id? (car x))
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

	; But if we're not out of tokens and the top pred isn't
	; starred, we're toast.
	(if (null x)
		; (return-from outer (explain-nil "~s ~s~%" x preds))
		(return-from outer nil)
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
	(if (and (listp (car preds))
		(not (id-pred-list? (car preds)))
		)
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

(defun ent-list? (x)
(or
	(lex-ent? x)
	(and
		(listp x)
		(loop for e in x always (lex-ent? e))
	)
)
)
