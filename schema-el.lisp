(load "ll-load.lisp")

(ll-load "schema-el-lex.lisp")
(ll-load "ll-util.lisp")
(ll-load "ll-cache.lisp")

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

(ldefun special-str (x)
	; (not (null (member x *KEYWORDS* :test #'equal)))
	(gethash x *KEYWORDS-MAP*)
)

(ldefun typecheck (x)
	(loop for c in *TYPES*
		if (funcall c x)
			collect c
	)
)


; TODO (CURRENT): rewrite parse functions to determine whether
; something is a pred, proposition, modifier, individual...

(ldefun canon-n-preds? (x)
	(mp x (list (list 'id? 'N+PREDS) 'canon-pred?+))
)

(ldefun canon-lambda? (x)
(or
	;(mp x (list (list 'id? 'LAMBDA.EL) 'ent-list? 'canon-prop?))
	;(mp x (list (list 'id? 'L) 'ent-list? 'canon-prop?))
	(mp x (list (list 'id? 'LAMBDA.EL) 'ent-list? 'any?))
	(mp x (list (list 'id? 'L) 'ent-list? 'any?))
	(canon-n-preds? x)
)
)

(ldefun canon-ka? (x)
(or
	(mp x (list (list 'id? 'KA) 'canon-pred?))
	(mp x (list (list 'id? 'KA) 'canon-pred? 'canon-individual?+))
)
)

(ldefun canon-ke? (x)
(or
	(mp x (list (list 'id? 'KE) 'canon-prop?))
)
)

(ldefun canon-that? (x)
(or
	(mp x (list (list 'id? 'THAT) 'canon-prop?))
	(mp x (list (list 'id? 'THT) 'canon-prop?))
)
)

(ldefun canon-event? (x)
(or
	(canon-ke? x)
	(canon-that? x)
)
)

(ldefun canon-kind? (x)
(or
	; TODO: restrictions on VP/non-VP preds for KA/K?
	(mp x (list (list 'id? 'K) 'canon-pred?))
	(mp x (list (list 'id? 'K) 'canon-pred? 'canon-individual?+))
	(canon-ka? x)
	(mp x (list (list 'id? 'KE) 'canon-prop?))
	(mp x (list (list 'id? 'KJ) 'adj-pred?))
)
)

(ldefun canon-small-individual? (x)
	(ll-cache #'u-canon-small-individual?
		(list x) 100 nil)
)

(ldefun u-canon-small-individual? (x)
(and
(symbolp x)
(not (equal ':R x)) ; string renders of ':R sometimes omit :
(or
	(numberp x)
	(lex-speech? x)
	(lex-skolem? x)
	(lex-pronoun? x)
	(lex-name? x)
	(lex-naked-var? x)
)
)
)

(ldefun canon-individual? (x)
(or
	(canon-small-individual? x)
	(canon-kind? x)
	(varp x)
	(mp x (list 'lex-fn? 'canon-individual?+)) ; can a function have

	(mp x (list (list 'id? 'IND) 'any?+)) ; Type-shifter
											   ; 0 args?
	(mp x (list 'lex-p-arg? 'canon-individual?))
	(mp x (list (list 'id? 'THAT) 'canon-prop?))
	(mp x (list (list 'id? 'THT) 'canon-prop?))

	(mp x (list 'lex-det? 'canon-pred?))

	; SET-OF with individual arguments is an individual.
	; SET-OF with a predicate argument is a predicate.
	(mp x (list (list 'id? 'SET-OF) 'canon-individual?+))
)
)

(ldefun canon-attr? (x)
(or
	(equal x 'PLUR)
	(equal x 'SET-OF)
	(mp x (list (list 'id? 'ATTR) 'canon-pred?))
	(mp x (list (list 'id? 'NN) 'canon-pred?))
	(lex-attr-pred? x)
)
)

(ldefun canon-prep? (x)
(or
	; (lex-p? x)
	(mp x (list 'lex-p? 'canon-individual?))
)
)

; Anything that can be returned from pred-base, i.e., no
; args or mods.
(ldefun atomic-pred? (x)
(or
	; Explicitly marked predicates are predicates
	(lex-pred? x)

	; SET-OF with individual arguments is an individual.
	; SET-OF with a predicate argument is a predicate.
	(mp x (list (list 'id? 'SET-OF) 'canon-pred?))

	; Just for right now.
	; (lex-det? x)

	; Lambda functions are predicates
	(canon-lambda? x)

	; Some special symbols are predicates
	(not (null (member x *KEYWORD-PREDS* :test #'equal)))

	; Bare verbs/modals, nouns, adjectives, and prepositions are predicates
	(lex-verb? x)
	(lex-metapred? x)
	(lex-noun? x)
	; (lex-modal? x)
	(lex-adj? x)
	(lex-p? x)

	(mp x (list (id? 'PASV) 'lex-verb?))
)
)

(ldefun canon-pred? (x)
	(ll-cache #'u-canon-pred? (list x) 100 nil)
)

(ldefun u-canon-pred? (x)
(or
	(atomic-pred? x)
	; (mp x (list 'lex-modal? 'canon-pred?))

	; Allow attributes, like ((attr happy.a) boy.n)
	; (mp x (list 'canon-attr? 'canon-pred?))

	; Allow serialized arguments for e.g. verb phrases
	(mp x (list 'canon-pred? 'canon-arg?+))


	; Prepositions with individual complements are predicates
	; (mp x (list 'lex-p? 'canon-individual?))

	; Modified predicates are predicates (e.g. adverbialized VPs)
	(mp x (list 'canon-mod? 'canon-pred?))
)
)

(ldefun canon-pred-or-mod? (x)
(or
	(canon-pred? x)
	(canon-mod? x)
)
)

(ldefun canon-sent-mod? (x)
(or
	(has-ext? x ".AUX-S")
	(has-ext? x ".ADV-S")
	(has-ext? x ".ADV-E")
	(equal x 'NOT)
	(equal x 'PROG)
	(equal x 'PERF)
	(mp x (list (list 'id? 'ADV-S) 'canon-pred-or-mod?+))
	(mp x (list (list 'id? 'ADV-E) 'canon-pred-or-mod?+))
)
)

(ldefun strip-charstar-eps (phi)
(block outer
	(setf eps (list))
	(loop while (canon-charstar? phi)
		do (progn
			(setf eps (append eps (list (third phi))))
			(setf phi (car phi))
		)
	)

	(return-from outer (list phi (reverse eps)))
)
)

(ldefun apply-charstar-eps (phi eps)
(block outer
	(setf new-phi (copy-item phi))

	(loop for ep in eps
		do (setf new-phi (list new-phi '** ep))
	)

	(return-from outer new-phi)
)
)

(ldefun canon-any-mod? (x)
(or
	(canon-sent-mod? x)
	(canon-mod? x)
)
)

(ldefun canon-adv? (x)
(or
	(lex-adv? x)

	(mp x (list (list 'id? 'ADV) 'canon-pred-or-mod?+))
	(mp x (list (list 'id? 'ADV-A) 'canon-pred-or-mod?+))
	(mp x (list (list 'id? 'ADV-F) 'canon-pred-or-mod?+))
	(mp x (list (list 'id? 'ADV-E) 'canon-pred-or-mod?+))
	(mp x (list (list 'id? 'ADV-S) 'canon-pred-or-mod?+))
)
)

(ldefun canon-mod? (x)
(or
	(lex-adv? x)
	(lex-attr-pred? x)
	(lex-modal? x)
	(lex-metapred? x)
	(equal x 'BE.PASV)
	(equal x 'PLUR)

	; Sometimes sentential modifiers
	; get caught in predicate modifier
	; nests, so we'll allow them to be
	; "valid" here, but then float them
	; upward during postprocessing.
	(canon-sent-mod? x)

	(mp x (list (list 'id? 'ADV) 'canon-pred-or-mod?+))
	(mp x (list (list 'id? 'ADV-A) 'canon-pred-or-mod?+))
	(mp x (list (list 'id? 'ADV-F) 'canon-pred-or-mod?+))
	(mp x (list (list 'id? ':R) 'canon-pred-or-mod?+))
	(mp x (list (list 'id? 'ATTR) 'canon-pred-or-mod?))
	(mp x (list (list 'id? 'NN) 'canon-pred-or-mod?))
)
)

(ldefun plur? (x)
(and
	(listp x)
	(equal 2 (length x))
	(or
		(equal 'PLUR (car x))
		(equal 'SET-OF (car x))
	)
	(canon-pred? (second x))
)
)

(ldefun pseudo-charstar? (x)
(and
	(listp x)
	(equal (length x) 3)
	(equal (second x) '**)
)
)

(ldefun canon-charstar? (x)
	(ll-cache #'u-canon-charstar?
		(list x) 100 nil)
)

(ldefun u-canon-charstar? (x)
(and
; these speed everything up by ensuring we never
; call canon-prop on things without ** operators
(listp x)
(contains x '**)

(or
	(mp x (list 'canon-prop? (list 'id? '*) 'canon-individual?))
	(mp x (list 'canon-prop? (list 'id? '**) 'canon-individual?))
)
)
)

(ldefun canon-arg? (x)
(or
	(canon-pred? x)
	(canon-prop? x)
	(canon-individual? x)
)
)

(ldefun canon-atomic-prop? (x)
(or
	(mp x (list 'canon-individual?+ 'canon-pred?))

	; Special case for * and **
	(canon-charstar? x)

	; Sentential modifiers
	(mp x (list 'canon-sent-mod? 'canon-prop?))

	; This is like the similar serial argument rule in canon-pred?, but
	; it allows the pred to be flattened with the subject (prefixed) and "curried" args (postfixed).
	(mp x (list 'canon-individual?+ 'canon-pred? 'canon-arg?+))

	; CERTAIN-TO-DEGREE and NECESSARY-TO-DEGREE don't
	; follow normal prop rules; best to add exceptions
	; for now. (I think?)
	(mp x (list 'exc-varp (id? 'CERTAIN-TO-DEGREE) (list (id? '/) #'numberp #'numberp)))
	(mp x (list 'exc-varp (id? 'NECESSARY-TO-DEGREE) #'numberp))
)
)

(ldefun canon-prop? (x)
	(ll-cache
		#'u-canon-prop?
		(list x)
		100
		nil
	)
)

(ldefun u-canon-prop? (x)
(or
	(canon-atomic-prop? x)

	; Boolean combinations
	(mp x (list (list 'id? 'NOT) 'canon-prop?))
	(mp x (list (list 'id? 'OR) 'canon-prop?+))
	(mp x (list (list 'id? 'AND) 'canon-prop?+))
	(mp x (list (list 'id? 'IF) 'canon-prop? 'canon-prop?))
)
)


; Manipulation/normalization functions

(ldefun pred-mods (pred)
	(progn
	;(format t "in the main way~%")
	(helper-pred-mods pred)
	)
)

(ldefun helper-pred-mods (pred)
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

(ldefun noun-pred? (pred)
(and
	(canon-pred? pred)
	(lex-noun? (pred-base pred))
)
)

(ldefun verb-pred? (pred)
(and
	(canon-pred? pred)
	(lex-verb? (pred-base pred))
)
)

(ldefun adj-pred? (pred)
(and
	(canon-pred? pred)
	(or
		(lex-adj? (pred-base pred))
		(mp (pred-base pred) (list (id? 'PASV) 'lex-verb?))
	)
)
)

(ldefun pred-base (pred)
	(check #'canon-pred? pred)
(block outer
	(if (atomic-pred? pred)
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

	(if (mp pred (list 'canon-attr? 'canon-pred?))
		; then
		(return-from outer (pred-base (second pred)))
	)

	(return-from outer pred)
)
)

(ldefun apply-mods (mods pred)
	(if (null mods)
		; then
		pred
		; else
		(list (car mods) (apply-mods (cdr mods) pred))
	)
)

; for preds without modifiers (helper)
(ldefun naked-pred-without-post-args (naked-pred)
	; TODO: handle or, and, not, etc.
(block outer
	(if (atomic-pred? naked-pred)
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
(ldefun pred-without-post-args (pred)
	(check #'canon-pred? pred)
(let (mods base-pred)
(block outer
	(if (atomic-pred? pred)
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
(ldefun pred-args (pred)
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
	(return-from outer (loop for e in (cdr pred)
		if (canon-arg? e)
			collect e
	))
)
)

(ldefun prop-args-pred-mods (prop)
	(ll-cache
		#'u-prop-args-pred-mods
		(list prop)
		100
		nil
	)
)

(ldefun u-prop-args-pred-mods (prop)
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
			(third prop) ; postfix args (char'd episode)
			nil)) ; no mods
	)

	; strip propositional modifiers off first
	(setf sent-mods (list))
	(loop while (canon-sent-mod? (car prop))
		do (setf sent-mods (append sent-mods (list (car prop))))
		do (setf prop (second prop))
	)

	; special case: strip nots
	(if (equal (car prop) 'NOT)
		(return-from outer (prop-args-pred-mods (second prop)))
	)

	; default case: prefix args, pred, postfix args
	(setf pred-idx (position-if #'canon-pred? prop :from-end t))
	(if (null pred-idx)
		; It's a conjunction
		(return-from outer nil)
	)
	(if (> pred-idx 0)
		(setf pre-args (subseq prop 0 pred-idx))
	)
	(setf arged-pred (nth pred-idx prop))
	(setf pred (pred-without-post-args (nth pred-idx prop)))

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
		(format t "WEIRDNESS ERROR: prop ~s (pred ~s) has both embedded postfix args and flat, serial ones!~%" prop arged-pred)
		(return-from outer nil)
		)
	)

	; group the pred and prop mods together, for now
	; they'll get sorted out later
	; TODO: sort them out explicitly and make a new
	;		breakdown field!
	(setf mods (pred-mods pred))
	(setf mods (append sent-mods mods))

	(return-from outer (list pre-args (pred-base pred) post-args mods))
)
)
)

(ldefun prop-pre-args (prop)
	(car (prop-args-pred-mods prop))
)

(ldefun prop-pred (prop)
	(second (prop-args-pred-mods prop))
)

(ldefun prop-pred-with-post-args (prop)
	(append
		(list (prop-pred prop))
		(prop-post-args prop)
	)
)

(ldefun prop-pred-strip-charstars (prop)
	(if (equal '** (prop-pred prop))
		; then
		(prop-pred (car prop))
		; else
		(prop-pred prop)
	)
)

(ldefun prop-post-args (prop)
	(third (prop-args-pred-mods prop))
)

(ldefun prop-all-args (prop)
	(append (listify-nonlists (prop-pre-args prop)) (listify-nonlists (prop-post-args prop)))
)

(ldefun prop-mods (prop)
	(fourth (prop-args-pred-mods prop))
)

(ldefun add-prop-mods (prop mods)
	(render-prop
		(prop-pre-args prop)
		(prop-pred prop)
		(prop-post-args prop)
		(append mods (prop-mods prop))
	)
)

(ldefun remove-prop-pre-args (prop pre-args)
	(render-prop
		(remove-if (lambda (x) (contains pre-args x))
			(prop-pre-args prop))
		(prop-pred prop)
		(prop-post-args prop)
		(prop-mods prop)
	)
)

(ldefun remove-prop-post-args (prop post-args)
	(render-prop
		(prop-pre-args prop)
		(prop-pred prop)
		(remove-if (lambda (x) (contains post-args x))
			(prop-post-args prop))
		(prop-mods prop)
	)
)

(ldefun render-prop (pre-args pred post-args mods)
(block outer
	(setf wrapped-pred pred)

	(setf pred-mods (loop for m in mods if (not (canon-sent-mod? m)) collect m))
	(setf prop-mods (set-difference mods pred-mods :test #'equal))

	(loop for m in (reverse pred-mods)
		do (setf wrapped-pred (list m wrapped-pred))
	)


	(setf wrapped-prop (append
		pre-args
		;(unwrap-singletons (list (append
			;(list wrapped-pred)
			;post-args
		;)))
		(if (not (null post-args))
			(list
				(append
					(list wrapped-pred)
					post-args))
			; else
			(list wrapped-pred)
		)
	))

	; (loop for m in (reverse prop-mods)
	(loop for m in prop-mods
		do (setf wrapped-prop (list m wrapped-prop))
	)

	; (format t "pred mods were ~s~%" pred-mods)
	; (format t "prop mods were ~s~%" prop-mods)
	; (format t "wrapped it up as ~s~%" wrapped-prop)
	(return-from outer wrapped-prop)
)
)

(ldefun render-pred (pred post-args mods)
(block outer
	(setf wrapped-pred pred)
	(loop for m in mods
		do (setf wrapped-pred (list m wrapped-pred))
	)

	(if (> (length post-args) 1)
		(return-from outer (append
			(list wrapped-pred)
			post-args
		))
	)

	(return-from outer wrapped-pred)
)
)
