(load "ll-load.lisp")

(ll-load "ll-util.lisp")
(ll-load "schema-el-parser.lisp")

(defparameter *KA-ARG-VERBS* '(
	WANT.V
	NEED.V
	BELIEVE.V
	HOPE.V
	GET.V
	THINK.V
	WISH.V
	TELL.V
	ASK.V
	FORCE.V
	TRY.V
	SEEM.V
	APPEAR.V
	DECIDE.V
	LIKE.V
	LOVE.V
	HATE.V
	DISLIKE.V
))

(defparameter *TEMPORAL-PREDS* '(
	DAY.N
	YESTERDAY.N
	TODAY.N
	NIGHT.N
	EVENING.N
	MORNING.N
	AFTERNOON.N
))

(ldefun clean-idx-tags (el-sents)
(block outer
	(setf needs-cleaning (remove-duplicates (get-elements-pred el-sents (lambda (x)
		(let ((spl (split-str (format nil "~s" x) "$")))
			(and
				(symbolp x)
				(and
					(equal 3 (length spl))
					(num-str? (second spl)))
			)
		)
	)) :test #'equal))
	(loop for nc in needs-cleaning
		do (block clean-nums
			(setf nc-repl (let ((spl (split-str (format nil "~s" nc) "$")))
				(intern (concat-strs (car spl) (third spl)))
			))
			(setf el-sents (replace-vals nc nc-repl el-sents))
		)
	)

	(return-from outer el-sents)
)
)

(ldefun all-duplicate-eps (phi)
	(loop for form1 in phi for i from 0
		append (loop for form2 in phi for j from 0
			if (and
				(> j i)
				(canon-charstar? form1)
				(canon-charstar? form2)
				(equal (car form1) (car form2)))
				collect (list form1 form2)
		)
	)
)

(ldefun fake-charstar? (phi)
	(and
		(listp phi)
		(equal 3 (length phi))
		(equal '** (second phi))
	)
)

(ldefun all-double-charstars (phi)
	(get-elements-pred phi
		(lambda (x) (and
			(fake-charstar? x)
			(fake-charstar? (car x)))))
)

(ldefun has-ext? (x e)
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

(ldefun lex-noun? (x)
	(has-ext? x ".N")
)

(ldefun vp-shifter? (x)
(and
	(has-suffix? (format nil "~s" x) "VP")
	(has-prefix? (format nil "~s" x) "PRED")
)
)

(ldefun modif-advp? (x)
(and
	(has-suffix? (format nil "~s" x) "ADVP")
	(has-prefix? (format nil "~s" x) "MODIF")
)
)

(ldefun eq-no-idx-tags? (x target)
	(equal (remove-idx-tag x) (remove-idx-tag target))
)

(ldefun unflatten! (x)
(let ((lst (reverse x)) (cursor nil) (modded-verbs (list)))
(block outer
	(setf nonverbs (loop for e in lst if (not (lex-verb? e)) collect e))
	(setf verbs (loop for e in lst if (lex-verb? e) collect e))

	
	(loop for verb in verbs do (block vblock
		(setf cursor verb)
		(loop for el in nonverbs
			do (setf cursor (list (list 'attr el) cursor)))
		(setf modded-verbs (append modded-verbs (list cursor)))
	))

	(return-from outer (and-chain modded-verbs))
)
)
)

(ldefun nonverb-pred? (p)
	(and (canon-pred? p) (not (lex-verb? (pred-base p))))
)

(ldefun idx-tag-num (sym)
(block outer
	(if (and
			(symbolp sym)
			(equal 3 (length (split-str (string sym) "$")))
			(is-num-str? (second (split-str (string sym) "$")))
		)
		; then
		(let ((spl (split-str (string sym) "$")))
			(return-from outer (parse-integer (second spl)))
		)
		; else
		(return-from outer nil)
	)
)
)

(ldefun remove-idx-tag (sym)
(block outer
	(if (and
			(symbolp sym)
			(equal 3 (length (split-str (string sym) "$")))
			(is-num-str? (second (split-str (string sym) "$")))
		)
		; then
		(let ((spl (split-str (string sym) "$")))
			(return-from outer (intern (format nil "~a~a" (car spl) (third spl))))
		)
		; else
		(return-from outer sym)
	)
)
)

(ldefun add-idx-tag (pred-sym tag-num)
(let ((pred-sym-spl (split-str (string pred-sym) ".")))
	(intern (format nil "~a$~d$.~a" (car pred-sym-spl) tag-num (second pred-sym-spl)))
)
)

(ldefun pred-vp? (s)
(and
	(symbolp s)
	(has-ext? s ".VP")
	(has-prefix? (string s) "PRED")
)
)

(ldefun mono-lam? (l)
(and
	(listp l)
	(equal (length l) 3)
	(equal (car l) 'L)
	(symbolp (second l))
	(equal (second l) (third l))
)
)

(ldefun is-comma? (x)
(and
	(symbolp x)
	(or
		(equal x (intern ","))
	)
)
)

(ldefun verbify! (x)
	(retag-as x "V")
)

(ldefun be-aux? (x)
(let ((be (remove-idx-tag x)))
(or
	(equal be 'BE.AUX)
	(equal be 'ARE.AUX)
	(equal be 'IS.AUX)
	(equal be 'WAS.AUX)
	(equal be 'WERE.AUX)
)))

(ldefun be-verb? (x)
(let ((be (remove-idx-tag x)))
(or
	(equal be 'BE.V)
	(equal be 'ARE.V)
	(equal be 'IS.V)
	(equal be 'WAS.V)
	(equal be 'WERE.V)
)))

(ldefun have-aux? (x)
(let ((be (remove-idx-tag x)))
(or
	(equal be 'HAVE.AUX)
	(equal be 'HAD.AUX)
	(equal be 'HAS.AUX)
)))

(ldefun equal? (x y)
	(equal x y)
)

(ldefun extract-noun-sym (form)
(block outer
	(if (not (listp form))
		(return-from outer nil)
	)

	(setf last-noun nil)
	(loop for e in form
		if (or (lex-noun? e) (mp e (list (id? 'PLUR) 'lex-noun?)))
			do (setf last-noun e))

	(if (null last-noun)
		(return-from outer nil)
	)

	(if (mp last-noun (list (id? 'PLUR) 'lex-noun?))
		; then
		(setf last-noun (concat-strs (car (split-str (format nil "~s" (second last-noun)) ".")) "S"))
		; else
		(setf last-noun (car (split-str (format nil "~s" last-noun) ".")))
	)

	(return-from outer last-noun)
)
)
