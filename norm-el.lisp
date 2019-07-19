(load "parse.lisp")
(load "real_util.lisp")

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
	canon-attr?
	canon-pred?
	canon-mod?
	canon-prop?
)
)

(defun typecheck (x)
	(loop for c in *TYPES*
		if (funcall c x)
			collect c
	)
)


; TODO (CURRENT): rewrite parse functions to determine whether
; something is a pred, proposition, modifier, individual...

(defun canon-kind? (x)
(or
	; TODO: restrictions on VP/non-VP preds for KA/K?
	(mp x (list (id? 'K) 'canon-pred?))
	(mp x (list (id? 'KA) 'canon-pred?))
	(mp x (list (id? 'KE) 'canon-prop?))
)
)

(defun canon-individual? (x)
(or
	(canon-kind? x)
	(lex-skolem? x)
	(varp x)
	(lex-pronoun? x)
	(lex-name? x)
	(mp x (list 'lex-p-arg? 'canon-individual?))
	(mp x (list (id? 'THAT) 'canon-prop?))
	(alphanum-str? (format nil "~s" x))
)
)

(defun canon-attr? (x)
(or
	(equal x 'PLUR)
	(mp x (list (id? 'ATTR) 'canon-pred?))
)
)

(defun canon-pred? (x)
(or
	; Explicitly marked predicates are predicates
	(lex-pred? x)

	; Bare verbs, nouns, and adjectives are predicates
	(lex-verb? x)
	(lex-noun? x)
	(lex-adj? x)

	; Allow attributes, like ((attr happy.a) boy.n)
	(mp x (list 'canon-attr? 'canon-pred?))

	; Allow serialized arguments for e.g. verb phrases
	(mp x (list 'canon-pred? 'canon-individual?+))

	; Lambda functions are predicates
	(el-lambda? x)

	; Prepositions with individual complements are predicates
	(mp x (list 'lex-p? 'canon-individual?))

	; Modified predicates are predicates (e.g. adverbialized VPs)
	(mp x (list 'canon-mod? 'canon-pred?))
)
)

(defun canon-mod? (x)
(or
	(lex-adv? x)
	(mp x (list (id? 'ADV-A) 'canon-pred?))
	(mp x (list (id? 'ADV-E) 'canon-pred?))
	(mp x (list (id? 'ADV-S) 'canon-pred?))
	(mp x (list (id? 'ADV-F) 'canon-pred?))
)
)

(defun canon-prop? (x)
(or
	(mp x (list 'canon-individual?+ 'canon-pred?))

	; Special case for * and **
	(mp x (list 'canon-prop? (id? '*) 'canon-individual?))
	(mp x (list 'canon-prop? (id? '**) 'canon-individual?))

	; This is like the similar serial argument rule in canon-pred?, but
	; it allows the pred to be flattened with the subject (prefixed) and "curried" args (postfixed).
	(mp x (list 'canon-individual?+ 'canon-pred? 'canon-individual?+))
)
)


; Manipulation/normalization functions
(defun pred-mods (pred)
	(check (canon-pred? pred))

	(if (listp pred)
		; then
		(if (canon-mod? (car pred))
			; then
			(append (list (car pred)) (pred-mods (second pred)))
		)
	)
)





