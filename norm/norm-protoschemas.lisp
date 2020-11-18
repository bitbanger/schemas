(defparameter *PROTOSCHEMAS* '(
	; do_action_for_pleasure.v
	avoid_action_to_avoid_displeasure.v
	; do_action_to_enable_action.v
	; use_tool.v
	give.v
	receiving_verb.?
	travel.v
	eat.v
	feed.v
	play.v
	make.v
	sit.v
	search.v
	find.v
	drink.v
	put_in_container.v
))

(defparameter put_in_container.v
	'(epi-schema ((?x put_in_container.v ?o ?c) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?o inanimate_object.n))
			(!r3 (?c container.n))
			(!r4 (?c inanimate_object.n))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r2 necessary-to-degree 1.0))
			(!n3 (!r4 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (that (?o (in.p ?c))))))
		)

		(:Preconds
			(?i1 (not (?o (in.p ?c))))
			(?i2 (?o (smaller-than.n ?c)))
		)

		(:Postconds
			(?p1 (?o (in.p ?c)))
		)
	)
)

(defparameter make.v
	'(epi-schema ((?x make.v ?o) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?o inanimate_object.n))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r2 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (that (?o exist.v)))))
			(?g2 (?x (want.v (ka (have.v ?o)))))
		)

		(:Preconds
			(?i1 (not (?o exist.v)))
		)

		(:Postconds
			(?p1 (?o exist.v))
			(?p2 (?x (have.v ?o)))
		)
	)
)

(defparameter do_action_for_pleasure.v
	'(epi-schema ((?x do_action_for_pleasure.v ?a) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?a action.n))
			(!r3 (?p pleasure.n))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (ka (experience.v ?p)))))
		)

		(:Preconds
			(?i1 (?x (enjoy_verb.? ?a)))
		)

		(:Steps
			(?e1 (?x (do.v ?a)))
		)

		(:Postconds
			(?p1 (?x (experience.v ?p)))
		)

		(:Episode-relations
			(!w1 (?g1 cause-of ?e1))
			(!w2 (?e1 cause-of ?p1))
		)
	)
)

(defparameter avoid_action_to_avoid_displeasure.v
	'(epi-schema ((?x avoid_action_to_avoid_displeasure.v ?a) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?a action.n))
			(!r3 (?d displeasure.n))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (that (not (?x (experience.v ?d)))))))
		)

		(:Preconds
			; (?i1 ((ke (?x (do.v ?a))) cause.v (ke (?x (experience.v ?d)))))
			(?i1 (?x believe.v (that ((ke (?x (do.v ?a))) has-effect (ke (?x (experience.v ?d)))))))
		)

		(:Steps
			(?e1 (not (?x (do.v ?a))))
		)

		(:Episode-relations
			(!w1 (?g1 cause-of ?e1))
		)
	)
)

(defparameter do_action_to_enable_action.v
	'(epi-schema ((?x do_action_to_enable_action.v ?a1 ?a2) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?a1 action.n))
			(!r3 (?a2 action.n))
			(!r4 (not (?a1 = ?a2)))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r4 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (ka (do.v ?a2)))))
		)

		(:Preconds
			(?i1 (not (?x (can.md (do.v ?a2)))))
		)

		(:Steps
			(?e1 (?x ((adv-a (for.p ?a2)) do.v) ?a1))
			(?e2 (?x (can.md (do.v ?a2))))
			(?e3 (?x (do.v ?a2)))
		)

		(:Episode-relations
			(!w1 (?e1 cause-of ?e2))
			(!w2 (?e1 consec ?e2))
			(!w3 (?e1 consec ?e3))
			(!w4 (?e1 before ?e2))
			(!w5 (?e1 before ?e3))
			(!w6 (?e2 postcond-of ?e1))
			(!w7 (?g1 cause-of ?e1))
			(!w8 (?e1 same-time ?e))
			(!w9 (?i1 precond-of ?e))
		)
	)
)

(defparameter use_tool.v
	'(epi-schema ((?x ((adv-a (for.p ?a)) use_tool.v) ?t) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?t implement.n))
			(!r3 (?a action.n))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r2 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (ka (do.v ?a)))))
		)

		(:Preconds
			(?i1 (?x (have.v ?t)))
			(?i2 (?t (suitable_for.p ?a))) ; the "telic" preposition suitable_for.a
											; will appear in prior object knowledge
		)

		(:Steps
			; Lots of ways to paraphrase this...
			(?e1 (?x ((adv-a (with.p ?t)) (do.v ?a))))
			(?e2 (?x ((adv-a (using.p ?t)) (do.v ?a))))
			(?e3 (?x ((adv-a (for.p ?a)) (use.v ?t))))
		)

		(:Episode-relations
			(!w1 (?e1 same-time ?e2))
			(!w2 (?e1 same-time ?e3))
		)
	)
)

(defparameter give.v
	'(epi-schema ((?x ((adv-a (to.p ?y)) give.v) ?y ?o) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?o inanimate_object.n))
			(!r3 (?y agent.n))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r2 necessary-to-degree 1.0))
			(!n3 (!r3 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (that (?y (have.v ?o))))))
		)

		(:Preconds
			(?i1 (?x have.v ?o))
			(?i2 (not (?y have.v ?o)))
		)

		(:Postconds
			(?p1 (not (?x have.v ?o)))
			(?p2 (?y have.v ?o))
		)
	)
)

(defparameter receiving_verb.?
	'(epi-schema ((?x receiving_verb.? ?o (at.p-arg ?l)) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?o inanimate_object.n))
			(!r3 (?l location.n))
			(!r4 (not (?x = ?o)))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r4 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (that (?x (have.v ?o))))))
		)

		(:Preconds
			(?i1 (not (?x have.v ?o)))
			(?i2 (?x (at.p ?l)))
			(?i3 (?o (at.p ?l)))
		)

		(:Postconds
			(?p1 (?x have.v ?o))
		)

		(:Episode-relations
			(!w1 (?e1 same-time ?e))
			(!w2 (?i1 precond-of ?e))
			(!w3 (?i2 precond-of ?e))
			(!w4 (?i3 precond-of ?e))
			(!w5 (?p1 postcond-of ?e))
		)
	)
)

(defparameter transport_object.v
	'(epi-schema ((?x transport_object.v ?o) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?o entity.n))
			(!r3 (?o smaller-than.n ?x))
			(!r4 (?l1 location.n))
			(!r5 (?l2 location.n))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (that (?o ((adv-a (at.p ?l2)) be.v))))))
		)

		(:Preconds
			(?i1 (?o ((adv-a (at.p ?l1)) be.v)))
		)

		(:Steps
			(?e1 (?x (((adv-a (to.p ?l2)) ((adv-a (from.p ?l1)) take.v)) ?o)))
		)

		(:Postconds
			(?p1 (?o ((adv-a (at.p ?l2)) be.v)))
		)

		(:Episode-relations
			(!w1 (?e1 same-time ?e))
			(!w2 (?i1 precond-of ?e))
			(!w3 (?p1 postcond-of ?e))
		)
	)
)

(defparameter eat.v
	'(epi-schema ((?x eat.v ?f) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?f food.n))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (that (not (?x hungry.a))))))
		)

		(:Preconds
			(?i1 (?x have.v ?f))
			(?i2 (?x hungry.a))
		)

		(:Postconds
			(?p1 (not (?x (have.v ?f))))
			(?p2 (not (?x hungry.a)))
		)

		(:Episode-relations
			(!w2 (?p1 after ?e))
			(!w3 (?i1 before ?e))
			(!w4 (?e cause-of ?p1))
		)
	)
)

(defparameter drink.v
	'(epi-schema ((?x drink.v ?f) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?f beverage.n))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (that (not (?x thirsty.a))))))
		)

		(:Preconds
			(?i1 (?x have.v ?f))
			(?i2 (?x thirsty.a))
		)

		(:Postconds
			(?p1 (not (?x (have.v ?f))))
			(?p2 (not (?x thirsty.a)))
		)

		(:Episode-relations
			(!w2 (?p1 after ?e))
			(!w3 (?i1 before ?e))
			(!w4 (?e cause-of ?p1))
		)
	)
)

(defparameter search.v
	'(epi-schema ((?x ((adv-a (for.p ?o)) search.v)) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?lx location.n))
			(!r3 (?lo location.n))
		)

		(:Preconds
			(?i1 (?x (at.p ?lx)))
			(?i2 (?o (at.p ?lo)))
			(?i3 (not (?x (know.v (that (?o (at.p ?lo)))))))
		)

		(:Goals
			(?g1 (?x (want.v (ka (find.v ?o)))))
			(?g2 (?x (want.v (ka (have.v ?o)))))
		)

		(:Postconds
			(?p1 (?x (find.v ?o)))
		)
	)
)

(defparameter find.v
	'(epi-schema ((?x find.v ?o) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?l location.n))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
		)

		(:Preconds
			(?i1 (?x (at.p ?l)))
			(?i2 (?o (at.p ?l)))
			(?i3 (?x ((adv-a (for.p ?o)) search.v)))
			(?i4 (not (?x (know.v (that (?o (at.p ?l)))))))
			(?i5 (not (?x (have.v ?o))))
		)

		(:Postconds
			(?p1 (?x (know.v (that (?o (at.p ?l))))))
			(?p2 (?x (have.v ?o)))
		)
	)
)

(defparameter feed.v
	'(epi-schema ((?x feed.v ?y ?f) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?y agent.n))
			(!r3 (?f food.n))
			(!r4 (not (?x = ?y)))
			(!r5 (not (?y = ?f)))
			(!r6 (not (?x = ?f)))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r2 necessary-to-degree 1.0))
			(!n3 (!r4 necessary-to-degree 1.0))
			(!n4 (!r5 necessary-to-degree 1.0))
			(!n5 (!r6 necessary-to-degree 1.0))
			(!n6 (!e necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (that (not (?y hungry.a))))))
			(?g2 (?x (want.v (that (?y eat.v ?f)))))
		)

		(:Preconds
			(?i1 (?x have.v ?f))
			(?i2 (?y hungry.a))
		)

		(:Steps
			(?e1 (?y eat.v ?f))
		)

		(:Postconds
			(?p1 (not (?x (have.v ?f))))
			(?p2 (not (?y hungry.a)))
		)

		(:Episode-relations
			(!w1 (?e1 after ?e))
		)
	)
)

(defparameter sit.v
	'(epi-schema ((?x ((adv-a (on.p ?s)) ((adv-a (in.p ?s)) sit.v))) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?s inanimate_object.n))
			(!r3 (?s furniture.n))
			(!r4 (?l location.n))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r2 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (ka rest.v))))
		)

		(:Preconds
			(?i1 (?x (at.p ?l)))
			(?i2 (?s (at.p ?l)))
		)
	)
)

(defparameter play.v
	'(epi-schema ((?x ((adv-a (with.p ?t)) play.v) ?g) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?t toy.n))
			(!r3 (?t inanimate_object.n))
			(!r4 (?g game.n))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r3 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (ka (experience.v (k pleasure.n))))))
		)

		(:Preconds
			(?i1 (?x have.v ?t))
		)

		(:Postconds
			(?p1 (?x experience.v (k pleasure.n)))
		)

		(:Episode-relations
			(!w1 (?e1 same-time ?e2))
		)
	)
)

(defparameter travel.v
	;'(epi-schema ((?x travel.v (from.p-arg ?l1) (to.p-arg ?l2) ?l2) ** ?e)
	'(epi-schema ((?x ((adv-a (for.p ?l2)) ((adv-a (from.p ?l1)) ((adv-a (to.p ?l2)) travel.v))) ?l2) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?l1 location.n))
			(!r3 (?l2 location.n))
			(!r4 (not (?l1 = ?l2)))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r4 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (ka ((adv-a (at.p ?l2)) be.v)))))
		)

		(:Preconds
			; (?i1 (?x ((adv-a (at.p ?l1)) be.v)))
			; (?i2 (not (?x ((adv-a (at.p ?l2)) be.v))))
			(?i1 (?x (at.p ?l1)))
			(?i2 (not (?x (at.p ?l2))))
		)

		(:Postconds
			;(?p1 (not (?x ((adv-a (at.p ?l1)) be.v))))
			;(?p2 (?x ((adv-a (at.p ?l2)) be.v)))
			(?p1 (not (?x (at.p ?l1))))
			(?p2 (?x (at.p ?l2)))
		)

		(:Episode-relations
			(!w1 (?i1 before ?e))
			(!w2 (?i2 before ?e))
			(!w3 (?p1 after ?e))
			(!w4 (?p2 after ?e))
			(!w5 (?g1 cause-of ?e))
		)
	)
)
