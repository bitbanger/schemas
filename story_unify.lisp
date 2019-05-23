(load "stories.lisp")
(load "parse.lisp")
(load "real_util.lisp")
(load "ontology/wordnet-ontology.lisp")

(defun generalizable-term? (x)
(and
	(term? x)
	(not (lex-ep-ref? x))
	(not (kind-of-action? x))
)
)

; If possible, make a term constraint from a WFF, and
; return a pair with elements (term, term constraint).
; If impossible, return nil.
(defun mk-term-constraint (wff)
(block outer
	(if (mp wff (list 'term? (lambda (x) (or (noun? x) (adj? x)))))
		(return-from outer (list (car wff) wff))
	)

	(if (mp wff (list 'no-ep-sent? (id? '**) 'lex-ep-ref?))
		(return-from outer (mk-term-constraint (car wff)))
	)

	(if (and (no-ep-sent? wff) (equal 'be.v (get-sent-verb wff)))
		(return-from outer (list (get-sent-subj wff) wff))
	)
)
)

(defun unique-terms (sexpr)
	(remove-duplicates (get-elements-pred sexpr #'generalizable-term?) :test #'equal)
)

(defun const-var-constraints (sexpr)
(block outer
	; OPT: don't have to call mk-term-constraint twice
	(remove-duplicates (mapcar #'mk-term-constraint (get-elements-pred sexpr #'mk-term-constraint)) :test #'equal)
)
)

(defun term-const-var-constraints (term sexpr)
(block outer
	(setf ret-val nil)

	; Try to identify agents using the existence of a name/gender pronoun for them
	(if (or (lex-name? term) (equal term 'he.pro) (equal term 'she.pro))
		(setf ret-val (list (list term 'AGENT.N)))
	)

	; TODO: figure out the singular "they"
	(if (equal term 'they.pro)
		(setf ret-val (list (list term '(PLUR ENTITY.N))))
	)

	; Get propositional constraints as well
	(setf ret-val 
		(append ret-val
			(loop for vc in (const-var-constraints sexpr)
				if (equal (car vc) term)
				collect (second vc)
			)
		)
	)

	(return-from outer (list term ret-val))
)
)


(defun term-nonconst-var-constraints (term)
(list term
(block inner

	(if (kind-of-noun? term)
		(return-from inner (list (list term (second term))))
	)

	; TODO: ask Len how to handle generalized quantifiers-as-determiners like "many.d", etc.
	; for now, "most", "few", etc. can probably be discarded, as their
	; determined terms will be plural anyway from the parse (e.g. "many.d (plur fish.n)")
	(if (mp term (list 'det? 'noun?))
		(return-from inner (list (list term (second term))))
	)

)
)
)

(defun term-var-constraints (term sexpr)
(block outer
	(setf constrs (append
		(second (term-nonconst-var-constraints term))
		(second (term-const-var-constraints term sexpr)))
	)

	(if (null constrs)
		(setf constrs (list (list term 'ENTITY.N)))
	)

	(return-from outer (list term constrs))
)
)

(defparameter term-var "?A")

(defun extract-story-roles (story)
(block outer
	(setf uts (make-hash-table :test #'equal))
	(setf term-constrs (make-hash-table :test #'equal))

	(loop for ut in (unique-terms story)
		do (progn
			;(format t "	~s " ut)
			;(if (lex-const? ut) (format t "(const)"))
			;(format t "~%")

			(setf (gethash ut uts) (intern term-var))
			(setf term-var (next-str term-var))
			(setf this-term-var (gethash ut uts))

			; TODO: make kinds & determined things UNIQUE FOR EACH MENTION
			; (that is, skolemize them)
			;(format t "	~s:~%" (gethash ut uts))
			(setf (gethash this-term-var term-constrs)
				(loop for vc in (second (term-var-constraints ut story))
					;do (format t "		~s~%" (list (gethash ut uts) (second vc)))
					collect (list this-term-var (second vc))
			))
		)
	)

	(return-from outer term-constrs)
)
)

(defun plur? (term)
(and
	(listp term)
	(equal 2 (length term))
	(equal (car term) 'PLUR)
)
)

(defun norm-singletons (x)
	(if (listp x)
		x
		; else
		(list x)
	)
)

(defun last-of (x)
	(car (last (norm-singletons x)))
)

(defun safe-length (x)
	(if (listp x)
		(length x)
		; else
		1
	)
)

(defun resolve-as (phi) phi)

(defun resolve-as-plur (phi)
	(list 'PLUR phi)
)

(defun with-certainty (cert resolver st1 st2)
	(loop for pair in (resolve-terms st1 st2)
		collect (list
				(* cert (car pair))
				(funcall resolver (second pair))
			)
	)
)

(defun resolve-terms (t1 t2)
(cond
	; Plurals are certain if both terms are plural
	((and (plur? t1) (plur? t2))
		; conservative
		(append
			(with-certainty 1.0 #'resolve-as-plur (second t1) (second t2))
		)
	)

	; Remove plurals & add the plural unifier as an uncertain term
	((plur? t1)
		; conservative
		(append
			(with-certainty 1.0 #'resolve-as (second t1) t2)

			; OPT: cache this second call, here & elsehwre
			(with-certainty 0.5 #'resolve-as-plur (second t1) t2)
		)
	)

	((plur? t2)
		; conservative
		(append
			(with-certainty 1.0 #'resolve-as t1 (second t2))

			; OPT: cache this second call, here & elsehwre
			(with-certainty 0.5 #'resolve-as-plur t1 (second t2))
		)
	)

	; Unify the last terms in compound predicates (bc they'll be nouns?)
	((or (> (safe-length t1) 1) (> (safe-length t2) 1))
		(append
			; conservative
			(with-certainty 1.0 #'resolve-as (last-of t1) (last-of t2))
		)
	)

	; LCH for symbols
	((and (symbolp t1) (symbolp t2))
		; conservative
		(append
			(list (list 1.0 (wordnet-common-hypernym t1 t2)))
		)
	)

	(t nil)
)
)

(defun interesting? (term)
	(not (or
		(equal 'ENTITY.N term)
		(equal '(PLUR ENTITY.N) term)
	))
)




(defparameter gsr (extract-story-roles fishing_green))
(defparameter bsr (extract-story-roles fishing_blue))


(format t "~%GREEN:~%")
(print-ht gsr)

(format t "~%BLUE:~%")
(print-ht bsr)

(loop for gkey being the hash-keys of gsr do
(loop for gp in (gethash gkey gsr) do
(loop for bkey being the hash-keys of bsr do
(loop for bp in (gethash bkey bsr) do (block inner
	(setf gprop (second gp))
	(setf bprop (second bp))
	(setf resprop (resolve-terms gprop bprop))

	(block check_interestingness
		(loop for rp in resprop do
			(if (interesting? (second rp))
				(return-from check_interestingness))
		)

		; If we only saw "entity", forget this unification
		(return-from inner)
	)

	(format t "(~s, ~s) ~s & ~s =~%" gkey bkey gprop bprop)
	(loop for rp in resprop do (block innermost
		(if (not (interesting? (second rp))) (return-from innermost))

		(format t "	~s~%" rp)
	))
	(format t "~%")
)))))




#|
(format t "~%OLD:~%")
(defparameter blue-uts (make-hash-table :test #'equal))
(loop for ut in (unique-terms fishing_blue)
	do (progn
		;(format t "	~s " ut)
		;(if (lex-const? ut) (format t "(const)"))
		;(format t "~%")

		(setf (gethash ut blue-uts) (intern term-var))
		(setf term-var (next-str term-var))

		; TODO: make kinds, pronouns, & determined things UNIQUE FOR EACH MENTION
		; (that is, skolemize them)
		(format t "	~s:~%" (gethash ut blue-uts))
		(loop for vc in (second (term-var-constraints ut fishing_blue))
			do (format t "		~s~%" (list (gethash ut blue-uts) (second vc)))
		)
	)
)
|#
