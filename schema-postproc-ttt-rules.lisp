(load "ll-load.lisp")

(ll-load "ll-util.lisp")

(defun implicature? (x)
	(contains '(
		BEGIN.V
		START.V
		DECIDE.V
	) x)
)

(defparameter *SCHEMA-CLEANUP-RULES* (curry-ttt-rules '(
	; The case with only one argument
	; (/ (KA (L _!1 (_!1 _!2)))
	; 	(KA _!2))

	; The case with unbracketed serial arguments
	; (/ (KA (L _!1 (_!1 _!2 _+3)))
	; 	(KA _!2 _+3))

	; NOT.ADV, with or without index tags, should
	; just be NOT.
	(/
		(ll-curry eq-no-idx-tags? NOT.ADV)
		NOT
	)

	; Get rid of monadic lambda predicates.
	(/ (_*1 (L _!.2 (_!.2 _+3)) _*4)
		(_*1 (_+3) _*4)
	)

	; Fix wrongly reified THAT.P
	(/
		(K (THAT.P _*1))
		(THAT _*1)
	)

	; Split out conjoined verb predications w/
	; the same subject, and fix their "nested"
	; episode characterizations.
	(/
		(_*6 (( ((_!. _+2) AND.CC (_!. _+3)) [**] _!4) [**] _!5) _*7)
		(_*6 ((_!. _+2) ** _!5) ((_!. _+3) ** _!4) _*7)
	)

	; Kill :O
	(/
		(:O _+)
		(_+)
	)

	; Fix weird DO.V
	(/
		(pred-vp? mono-lam? _*)
		(DO.V _*)
	)

	; s/TO/KA/g
	(/
		TO
		KA
	)

	; N'T is NOT
	(/
		|N'T.ADV|
		NOT
	)

	; N'T with explicit bars is also NOT
	; (I'm not sure why this happens)
	(/
		|\|N'T.ADV\||
		NOT
	)

	; :R can just be ADV-A
	(/
		(:R _+)
		(ADV-A _+)
	)

	; Strip narrative structures
	(/
		((SPEAKER TELL.V HEARER (THAT _!1)) [**] _!2)
		(_!1 [**] _!2)
	)

	; Flatten lists of modifiers to float,
	; so they can be unfloated by another
	; rule.
	(/
		(_*1 ((!2 canon-mod?) (+ canon-mod?)) _*3)
		(_*1 !2 + _*3)
	)

	; Turn parallel kind and PP arguments inside PP
	; phrases into a valid, conjunctive construction,
	; e.g.,
	; (in.p ((k front.n) (of.p billy.name)))
	; becomes
	; (in.p (k (l x (and (x front.n) (x (of.p billy.name))))))
	(/
		((!1 lex-p?) ((K (!2 canon-pred?)) (!3 canon-prep?)))
		(!1 (K (lambdify-preds! (!2 !3))))
	)

	; Strip unnecessary parens from predicates.
	(/
		((!1 canon-pred?))
		!1
	)

	; Un-flatten stacked predicates.
	(/
		((* ~ AND.CC) ((+ nonverb-pred?)))
		(* (lambdify-preds! (+)))
	)
	(/
		((* ~ AND) ((+ nonverb-pred?)))
		(* (lambdify-preds! (+)))
	)

	; CAN should usually be CAN.MD.
	(/
		CAN
		CAN.MD
	)

	; We prefer MDs in this family
	(/
		WILL.AUX
		WILL.MD
	)

	; Floating prepositions in verb predicates should be mods.
	(/
		(_*1 (!2 canon-pred?) _*3 (!4 canon-prep?) _*5)
		(_*1 ((adv-a !4) !2) _*3 _*5)
	)
	(/
		(_*1 (!2 canon-prep?) _*3 (!4 canon-pred?) _*5)
		(_*1 ((adv-a !2) !4) _*3 _*5)
	)

	; Naked predicates as PP objects should be
	; reified, for lack of anything else to do.
	(/
		((!1 lex-p?) (!2 verb-pred?))
		(!1 (KA !2))
	)
	(/
		((!1 lex-p?) (!2 canon-pred?))
		(!1 (K !2))
	)

	; We don't need "such", "so", etc.
	; until we can figure out what to
	; do with them. (TODO)
	;(/
		;(_*1 SUCH.D _*2)
		;(_*1 _*2)
	;)

	; Un-flatten composite predicates.
	(/
		(<> (!2 canon-pred?) (+ canon-pred?))
		(lambdify-preds! (!2 +))
	)

	; Lambdify conjunctive predicates.
	(/
		(AND (+ canon-pred?))
		(lambdify-preds! (+))
	)
	(/
		(AND.CC (+ canon-pred?))
		(lambdify-preds! (+))
	)

	; Conjunctions of individuals are
	; actually sets.
	(/
		(AND (+ canon-individual?))
		(SET-OF +)
	)

	; Unwrap singleton individual lists.
	(/
		((!1 canon-individual?))
		!1
	)

	; Stacked lex-preds can be split like conjunctions,
	; for now, BUT, TODO:
	;	1. make them proper predicate modifiers
	;	2. figure out if/when it's OK to do this with
	;	   composite, non-lexical preds?
	(/
		((!1 canon-individual?) (+ lex-pred?))
		(!1 (AND (+)))
	)

	; Auxiliary "be" can always be a copula,
	; for now (Gene says it's OK!). Change when
	; Len adds aux-identification back into parser.
	(/
		; BE.AUX
		; BE.V
		(!1 be-aux?)
		(verbify! !1)
	)

	; Auxiliary "have" without a verb predicate
	; after it can be a verb.
	(/
		(_*1 (!2 have-aux?) (!3 ~ verb-pred?))
		(_*1 (verbify! !2) !3)
	)

	; To BE.V, or not to BE.V?
	(/
		; ((!1 ~ THERE.PRO) ((!2 be-verb?) (!3 probably-pred?)))
		((!1 ~ (ll-curry equal? THERE.PRO)) ((!2 be-verb?) (!3 probably-pred?)))
		(!1 !3)
	)

	; comma-and becomes and
	(/
		(_*1 (!2 is-comma?) AND _*3)
		(_*1 AND _*3)
	)

	; "There is X" => "X is"
	(/
		(THERE.PRO ((!1 be-verb?) (= _!2)))
		(_!2 !1)
	)

	; Fix non-auxiliary HAVE.AUX
	(/
		(HAVE.AUX (!1 ~ canon-ka?))
		(HAVE.V !1)
	)

	; Fix weird type-shifters
	(/
		(!1 modif-advp?)
		ADV-A
	)

	; HAVE.V with ADV-A TO.P KA
	; should be MUST.AUX
	(/
		((ADV-A (FOR.P (KA _*1))) HAVE.V)
		(MUST.AUX-S _*1)
	)

	; Skolem-name pairs should take
	; an NP+PREDS form to be fixed
	; by a Lisp rule.
	(/
		((!1 lex-skolem?) (!2 lex-name?))
		(NP+PREDS !1 (= !2))
	)

	; Kill PRED****.VP
	;(/
	;	((!1 vp-shifter?) _+)
	;	(_+)
	;)

	; Unflatten post-args
	(/
		((!1 canon-individual?) (!2 canon-pred?) (+ canon-individual?))
		(!1 (!2 +))
	)

	; Remove progressive indicators
	(/
		((<> prog _*1 (!2 canon-pred?)))
		(_*1 !2)
	)

	; "Get <adj>" is valid, but kind-ify the adjective?
	(/
		(GET.V (!1 adj-pred?))
		(GET.V (KJ !1))
	)

	; Strip out some coordinating conjunctions.
	(/
		(_*1 (!1 (ll-curry eq-no-idx-tags? BUT.CC)) _*2)
		(AND _*1 _*2)
	)
	(/
		((!1 (ll-curry eq-no-idx-tags? SO.CC)) _*2)
		(_*2)
	)
	; Strip off "decide to"
	(/
		(_*1 (implicature? (KA _*2)))
		(_*1 _*2)
	)

	; Remove any commas left
	(/
		((<> _*1 (!2 is-comma?) _*2))
		(_*1 _*2)
	)
)))
