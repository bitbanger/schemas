; episodic logic truth evaluation

(load "parse.lisp")
(load "real_util.lisp")

; model has:
;	preds, a hash table where:
;		key is a pred symbol
;		val is a function from term tuples to truth values
; 	tup-preds, a hash table where:
;		key is pred symbol
;		val is HT of term tuples to bools

(defun preds-of (model)
	(car model)
)

(defun tup-preds-of (model)
	(second model)
)

(defun add-tup-pred-fn (model pred-symb)
(block outer
	; Make an empty HT for the pred symbol in the tup
	; pred lookup table
	(setf (gethash pred-symb (tup-preds-of model))
		(make-hash-table :test #'equal))

	; Add a tup pred lookup table accessor lambda to
	; the pred function lookup table
	(setf (gethash pred-symb (preds-of model)
		(lambda (term-tup)
			(gethash term-tup
				(gethash pred-symb (tup-preds-of model)))
		)))
)
)

(defun add-pred-fn (model pred-symb pred-fn)
	(setf (gethash pred-symb (preds-of model)) pred-fn)
)

(defun mk-nary-pred-fn (n pred-fn)
	(lambda (term-tup) (block outer
		(if (not (equal (length term-tup) n)) (block err
			(format t "got ~d args for ~d-ary pred fn~%" (length term-tup))
			(return-from outer nil)
		))

		(pred-fn term-tup)
	))
)


; Some special pred functions we probably want in general:
(defparameter *SPEC-PREDS* (list
	; Actions are KA-reified verb phrases
	(list 'action1.n
		(mk-nary-pred-fn 1 (lambda (term-tup)
			(and
			(equal (length (car term-tup) 2))
			(equal (car (car term-tup)) 'KA)
			(verb? (second (car term-tup)))
			)
		))
	)

	; Define agents here
	(list 'agent6.n
		(mk-nary-pred-fn 1 (lambda (term-tup)
			(or
			(lex-name? (car term-tup))
			(lex-pronoun? (car term-tup)) ; Need to refine this to identify animate "it" vs. inanimate "it"? Maybe disambiguate w/ presence as subj. vs. obj.
			)
		))
	)
))

(defun add-spec-pred-fns (model)
	(loop for spec-pred-fn in *SPEC-PREDS*
		do (setf (gethash (car spec-pred-fn) (preds-of model))
			(second spec-pred-fn)))
)



; Evaluate an atomic predication w/
; a pos/neg polarity given a model
(defun pred-eval (model atm pol)
(block outer
	; atm is of form (<pred> <term1> <term2>)

	; check no var terms
	(if (not (loop for term in (cdr atm) always (lex-const? term)))
		(block err
			(format t "non-constant term ~s in ground predication~%" term)
			(return-from outer nil)
		)
	)

	; kinds satisfy the predicates they're kinds of
	(if (and
		(equal (length (cdr atm) 1))
		(equal (length (car (cdr atm)) 2))
		(equal (car (car (cdr atm))) 'K)
		(equal (second (car (cdr atm))) (car atm)))

		(return-from outer t))

	; check truth of atom, return pol XOR that
	(return-from outer (xor pol
		(let ((pred-func (gethash (car atm) (preds-of model))))
			(pred-func (cdr atm))
		)
	))
)
)
