(load "parse.lisp")
(load "real_util.lisp")
(load "ll-cache.lisp")

; Example canonical story
(defparameter *CANON-STORY*
'(
	; Frank and little May are in the field with the wagon.
	((E1.SK AT-ABOUT.PR NOW0)
		(MAY.NAME LITTLE.A)
		(FIELD1.SK FIELD.N)
		(WAGON1.SK WAGON.N)
		(FIELD1.SK INDEF.A)
		(WAGON1.SK INDEF.A)
		((FRANK.NAME ((ADV-E (IN.P FIELD1.SK)) ((ADV-E (WITH.P WAGON1.SK)) BE.V))) ** E1.SK)
		((MAY.NAME ((ADV-E (IN.P FIELD1.SK)) ((ADV-E (WITH.P WAGON1.SK)) BE.V))) ** E1.SK)
	)

	; They have come to find flowers.
	((E2.SK BEFORE.PR NOW1)
		((THEY.PRO ((ADV-A (FOR.P (KA (FIND.V (K (PLUR FLOWER.N)))))) COME.V)) ** E2.SK)
	)

	; May has a red flower.
	((E3.SK AT-ABOUT.PR NOW2)
		(FLOWER1.SK FLOWER.N)
		(FLOWER1.SK RED.A)
		((MAY.NAME (HAVE.V FLOWER1.SK)) ** E3.SK)
	)

	; Frank has three yellow flowers.
	((E4.SK AT-ABOUT.PR NOW3)
		(FLOWERS1.SK 3.A)
		(FLOWERS1.SK (SET_OF.PR (K ((ATTR YELLOW.A) FLOWER.N))))
		((FRANK.NAME (HAVE.V FLOWERS1.SK)) ** E4.SK)
	)

	; He will let May have them.
	((E7.SK AFTER.PR NOW4)
		((HE.PRO (LET.V MAY.NAME (KA (HAVE.V THEY.PRO)))) ** E7.SK)
	)

	; She will take them to the wagon.
	((E6.SK AFTER.PR NOW5)
		(WAGON2.SK WAGON.N)
		(WAGON2.SK INDEF.A)
		((SHE.PRO (TAKE.V THEY.PRO (TO.P-ARG WAGON2.SK))) ** E6.SK)
	)

	; She is glad to get the pretty flowers.
	((E7.SK AT-ABOUT.PR NOW6)
		(FLOWERS2.SK (SET_OF.PR (K ((ATTR PRETTY.A) FLOWER.N))))
		((SHE.PRO (BE.V (K GLAD.A) (KA (GET.V FLOWERS2.SK)))) ** E7.SK)
	)
)
)


(defparameter *TYPES*
'(
	canon-kind?
	canon-individual?
	; canon-attr?
	canon-pred?
	canon-mod?
	canon-prop?
)
)

(defun special-str (x)
	; (not (null (member x *KEYWORDS* :test #'equal)))
	(gethash x *KEYWORDS-MAP*)
)

(defun typecheck (x)
	(loop for c in *TYPES*
		if (funcall c x)
			collect c
	)
)


; TODO (CURRENT): rewrite parse functions to determine whether
; something is a pred, proposition, modifier, individual...

(defun canon-lambda? (x)
(or
	;(mp x (list (id? 'LAMBDA.EL) 'ent-list? 'canon-prop?))
	;(mp x (list (id? 'L) 'ent-list? 'canon-prop?))
	(mp x (list (id? 'LAMBDA.EL) 'ent-list? 'any?))
	(mp x (list (id? 'L) 'ent-list? 'any?))
)
)

(defun canon-kind? (x)
(or
	; TODO: restrictions on VP/non-VP preds for KA/K?
	(mp x (list (id? 'K) 'canon-pred?))
	(mp x (list (id? 'K) 'canon-pred? 'canon-individual?+))
	(mp x (list (id? 'KA) 'canon-pred?))
	(mp x (list (id? 'KA) 'canon-pred? 'canon-individual?+))
	(mp x (list (id? 'KE) 'canon-prop?))
)
)

(defun canon-small-individual? (x)
(and (symbolp x)
(or
	(lex-skolem? x)
	(lex-pronoun? x)
	(lex-name? x)
	(and (not (special-str x)) (alphanum-str? (string x)))
)
)
)

(defun canon-individual? (x)
(or
	(canon-small-individual? x)
	(canon-kind? x)
	(varp x)
	(mp x (list 'lex-fn? 'canon-individual?+)) ; can a function have
											   ; 0 args?
	(mp x (list 'lex-p-arg? 'canon-individual?))
	(mp x (list (id? 'THAT) 'canon-prop?))
	(mp x (list (id? 'SET-OF) 'canon-individual?+))
)
)

(defun canon-attr? (x)
(or
	(equal x 'PLUR)
	(mp x (list (id? 'ATTR) 'canon-pred?))
	(mp x (list (id? 'NN) 'canon-pred?))
	(lex-attr-pred? x)
)
)

(defun canon-pred? (x)
(or
	; Explicitly marked predicates are predicates
	(lex-pred? x)

	; Some special symbols are predicates
	(not (null (member x *KEYWORD-PREDS* :test #'equal)))

	; Bare verbs/modals, nouns, adjectives, and prepositions are predicates
	(lex-verb? x)
	(lex-metapred? x)
	(lex-noun? x)
	; (lex-modal? x)
	(lex-adj? x)
	(lex-p? x)

	; (mp x (list 'lex-modal? 'canon-pred?))

	; Allow attributes, like ((attr happy.a) boy.n)
	; (mp x (list 'canon-attr? 'canon-pred?))

	; Allow serialized arguments for e.g. verb phrases
	(mp x (list 'canon-pred? 'canon-individual?+))

	; Lambda functions are predicates
	(canon-lambda? x)

	; Prepositions with individual complements are predicates
	; (mp x (list 'lex-p? 'canon-individual?))

	; Modified predicates are predicates (e.g. adverbialized VPs)
	(mp x (list 'canon-mod? 'canon-pred?))
)
)

(defun canon-pred-or-mod? (x)
(or
	(canon-pred? x)
	(canon-mod? x)
)
)

(defun canon-mod? (x)
(or
	(lex-adv? x)
	(lex-attr-pred? x)
	(lex-modal? x)
	(equal x 'BE.PASV)
	(equal x 'PLUR)
	(mp x (list (id? 'ADV-A) 'canon-pred-or-mod?+))
	(mp x (list (id? 'ADV-E) 'canon-pred-or-mod?+))
	(mp x (list (id? 'ADV-S) 'canon-pred-or-mod?+))
	(mp x (list (id? 'ADV-F) 'canon-pred-or-mod?+))
	(mp x (list (id? ':R) 'canon-pred-or-mod?+))
	(mp x (list (id? 'ATTR) 'canon-pred-or-mod?))
	(mp x (list (id? 'NN) 'canon-pred-or-mod?))
)
)

(defun canon-charstar? (x)
(or
	(mp x (list 'canon-prop? (id? '*) 'canon-individual?))
	(mp x (list 'canon-prop? (id? '**) 'canon-individual?))
)
)

(defun canon-atomic-prop? (x)
(or
	(mp x (list 'canon-individual?+ 'canon-pred?))

	; Special case for * and **
	(canon-charstar? x)

	; This is like the similar serial argument rule in canon-pred?, but
	; it allows the pred to be flattened with the subject (prefixed) and "curried" args (postfixed).
	(mp x (list 'canon-individual?+ 'canon-pred? 'canon-individual?+))
)
)

(defun canon-prop? (x)
(or
	(canon-atomic-prop? x)

	; Boolean combinations
	(mp x (list (id? 'NOT) 'canon-prop?))
	(mp x (list (id? 'OR) 'canon-prop?+))
	(mp x (list (id? 'AND) 'canon-prop?+))
	(mp x (list (id? 'IF) 'canon-prop? 'canon-prop?))
)
)


; Manipulation/normalization functions

(defun pred-mods (pred)
	(progn
	;(format t "in the main way~%")
	(helper-pred-mods pred)
	)
)

(defun helper-pred-mods (pred)
(block outer
	(check #'canon-pred? pred)

	(if (mp pred (list 'canon-pred? 'canon-individual?+))
		; then
		(progn
		; (format t "here1 ~s~%" pred)
		(return-from outer (helper-pred-mods (car pred)))
		)
	)

	(if (mp pred (list 'canon-mod? 'canon-pred?))
		; then
		(progn
		;(format t "here2 ~s~%" pred)
		;(format t "car pred is ~s~%" (car pred))
		;(format t "pmsec is ~s~%" (pred-mods (second pred)))
		;(format t "append is ~s~%" (append (list (car pred)) (helper-pred-mods (second pred))))
		(return-from outer (append (list (car pred)) (helper-pred-mods (second pred))))
		)
	)

	(return-from outer nil)
)
)

(defun pred-base (pred)
	(check #'canon-pred? pred)
(block outer
	(if (canon-lambda? pred)
		(return-from outer pred)
	)

	(if (mp pred (list 'canon-pred? 'canon-individual?+))
		; then
		(return-from outer (pred-base (car pred)))
	)

	(if (mp pred (list 'canon-mod? 'canon-pred?))
		; then
		(return-from outer (pred-base (second pred)))
	)

	(return-from outer pred)
)
)

(defun apply-mods (mods pred)
	(if (null mods)
		; then
		pred
		; else
		(list (car mods) (apply-mods (cdr mods) pred))
	)
)

; for preds without modifiers (helper)
(defun naked-pred-without-post-args (naked-pred)
	; TODO: handle or, and, not, etc.
(block outer
	(if (canon-lambda? naked-pred)
		(return-from outer naked-pred)
	)

	(if (mp naked-pred (list 'lex-p? 'canon-individual?))
		(return-from outer naked-pred)
	)

	(if (not (listp naked-pred))
		; then
		(return-from outer naked-pred)
		; else
		(return-from outer (car naked-pred))
	)
)
)

; for preds with modifiers
(defun pred-without-post-args (pred)
	(check #'canon-pred? pred)
(let (mods base-pred)
(block outer
	(if (canon-lambda? pred)
		(return-from outer pred)
	)

	(setf mods (pred-mods pred))
	(setf bp (naked-pred-without-post-args (pred-base pred)))
	; (format t "bp: ~s~%" bp)
	(return-from outer (apply-mods mods bp))
)
)
)

; pred-args returns postfixed args that are "fixed"
; / "curried into" a predicate to form a new predicate;
; most commonly, these would be the objects of a verb,
; with the "prefix" argument being the subject.
(defun pred-args (pred)
	(check #'canon-pred? pred)
(block outer
	; Lambdas are atomic; ignore "args"?
	(if (canon-lambda? pred)
		(return-from outer nil)
	)

	; Strip all modifiers & recurse, if applicable
	(if (mp pred (list 'canon-mod? 'canon-pred?))
		; then
		(return-from outer (pred-args (second pred)))
	)

	; Non-lists have no postfix args
	(if (not (listp pred))
		(return-from outer nil))

	; We'll assume lambdas have none, although we could
	; tell in some cases by finding the variables of an
	; underlying predicate that are "hardcoded" in the
	; lambda body....
	; TODO?

	; Now loop to get all the args. We'll assume the base
	; pred doesn't nest another set of them, because that'd
	; be crazy.
	(return-from outer (loop for e in pred
		if (canon-individual? e)
			collect e
	))
)
)

(defun prop-args-pred-mods (prop)
	(check #'canon-prop? prop)
(let (pred-idx pre-args pred embedded-post-args flat-post-args post-args mods)
(block outer
	; special case: handle * and ** operator preds
	(if (and
			(equal 3 (length prop))
			(or (equal '* (second prop)) (equal '** (second prop))))
		; then
		(return-from outer (list
			(list 'THAT (car prop)) ; prefix args (reified prop)
			(second prop) ; predicate (* or **)
			(third prop))) ; postfix args (char'd episode)
	)

	; special case: strip nots
	(if (equal (car prop) 'NOT)
		(return-from outer (prop-args-pred-mods (second prop)))
	)

	; default case: prefix args, pred, postfix args
	(setf pred-idx (position-if #'canon-pred? prop))
	(if (null pred-idx)
		; It's a conjunction
		(return-from outer nil)
	)
	(if (> pred-idx 0)
		(setf pre-args (subseq prop 0 pred-idx))
	)
	(setf arged-pred  (nth pred-idx prop))
	(setf pred (pred-without-post-args (nth pred-idx prop)))
	; (format t "pred without: ~s~%" pred)

	; special case: if the pred has postfix args in it already, we won't allow
	; "flat" postfix args
	(if (not (null (pred-args arged-pred)))
		; then
		(progn
		(setf embedded-post-args (pred-args arged-pred))
		(setf post-args embedded-post-args)
		)
	)

	(if (< pred-idx (- (length prop) 1))
		; then
		(progn
		(setf flat-post-args (subseq prop (+ 1 pred-idx) (length prop)))
		(setf post-args flat-post-args)
		)
	)

	(if (and (not (null embedded-post-args)) (not (null flat-post-args)))
		; then
		(progn
		(format t "WEIRDNESS ERROR: prop ~s has both embedded postfix args and flat, serial ones!~%" prop)
		(return-from outer nil)
		)
	)

	(setf mods (pred-mods pred))

	(return-from outer (list pre-args (pred-base pred) post-args mods))
)
)
)

(defun prop-pre-args (prop)
	(car (prop-args-pred-mods prop))
)

(defun prop-pred (prop)
	(second (prop-args-pred-mods prop))
)

(defun prop-post-args (prop)
	(third (prop-args-pred-mods prop))
)

(defun prop-all-args (prop)
	(append (listify-nonlists (prop-pre-args prop)) (listify-nonlists (prop-post-args prop)))
)

(defun prop-mods (prop)
	(fourth (prop-args-pred-mods prop))
)
