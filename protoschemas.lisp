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
	put.v
	inform.v
	request_action.v
	watch.v
	enjoy_action.v
	transport_object.v
))

(defparameter enjoy_action.v
	'(epi-schema ((?x enjoy_action.v ?a) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?a action.n))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r2 necessary-to-degree 1.0))
		)

		(:Paraphrases
			(?e (?x (want.v ?a)))
			(?e (?x (like.v ?a)))
			(?e (?x (love.v ?a)))
			(?e (?x (enjoy.v ?a)))
		)

		(:Preconds
			(?i1 (?x (think.v (that (?a fun.a)))))
		)
	)
)

(defparameter put.v
	'(epi-schema ((?x ((adv-a (in.p ?c)) put.v) ?o) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (not (?o agent.n)))
			(!r3 (?c container.n))
			(!r4 (not (?c agent.n)))
			(!r5 (?o smaller-than ?c))
		)

		(:Paraphrases
			(?e (?x ((adv-a (into.p ?c)) put.v) ?o))
			(?e (?x ((adv-a (inside.p ?c)) put.v) ?o))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r2 necessary-to-degree 0.9))
			(!n3 (!r4 necessary-to-degree 0.9))
		)

		(:Goals
			(?g1 (?x (want.v (that (?o (in.p ?c))))))
		)

		(:Preconds
			(?i1 (not (?o (in.p ?c))))
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
			(!r2 (not (?o agent.n)))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			; (!n2 (!r2 necessary-to-degree 0.5))
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
	'(epi-schema ((?x (give.v ?y ?o)) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (not (?o agent.n)))
			(!r3 (?y agent.n))
		)

		(:Paraphrases
			(?e (?x ((adv-a (to.p ?y)) (give.v ?o))))
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
	'(epi-schema ((?x receiving_verb.? ?o) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (not (?o agent.n)))
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
			(!w1 (?i1 precond-of ?e))
			(!w2 (?i2 precond-of ?e))
			(!w3 (?i3 precond-of ?e))
			(!w4 (?p1 postcond-of ?e))
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
			(!r6 (?l2 destination.n))
		)

		(:Paraphrases
			(?e (?x ((adv-a (to.p ?l2)) take.v) ?o))
			(?e (?x ((adv-a (to.p ?l2)) carry.v) ?o))
			(?e (?x ((adv-a (to.p ?l2)) bring.v) ?o))
			(?e (?x (location_adv.? take.v) ?o))
			(?e (?x (location_adv.? carry.v) ?o))
			(?e (?x (location_adv.? bring.v) ?o))
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

		(:Postconds
			(?p1 (?o ((adv-a (at.p ?l2)) be.v)))
		)

		(:Episode-relations
			(!w1 (?i1 precond-of ?e))
			(!w2 (?p1 postcond-of ?e))
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

		(:Paraphrases
			(?e (?x ((adv-a (for.p ?o)) look.v)))
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

		(:Paraphrases
			(?e (?x ((adv-a (for.p ?o)) look.v)))
		)

		(:Postconds
			(?p1 (?x (find.v ?o)))
		)

		(:Episode-relations
			(!w1 (?p1 after ?e))
		)

		(:Subordinate-constraints
			(!s1 ((?i3<- ?p1) = ?e))
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

		(:Episode-relations
			(!w1 (?i3 before ?e))
		)

		(:Subordinate-constraints
			(!s1 ((?p1<- ?i3) = ?e))
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
			(!r2 (not (?s agent.n)))
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
	'(epi-schema ((?x play.v) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?t toy.n))
			(!r3 (not (?t agent.n)))
			(!r4 (?g game.n))
			(!r5 (not (?g agent.n)))
		)

		(:Paraphrases
			(?e (?x ((adv-a (with.p ?t)) play.v)))
			(?e (?x play.v ?g))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r3 necessary-to-degree 1.0))
			(!n3 (!r5 necessary-to-degree 1.0))
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
	)
)

(defparameter travel.v
	;'(epi-schema ((?x travel.v (from.p-arg ?l1) (to.p-arg ?l2) ?l2) ** ?e)
	; '(epi-schema ((?x ((adv-a (for.p ?l2)) ((adv-a (from.p ?l1)) ((adv-a (to.p ?l2)) travel.v))) ?l2) ** ?e)
	'(epi-schema ((?x ((adv-a (from.p ?l1)) travel.v) ?l2) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?l1 location.n))
			(!r3 (?l2 location.n))
			(!r4 (not (?l1 = ?l2)))
			(!r5 (?l2 destination.n))
		)

		(:Paraphrases
			(?e (?x ((adv-a (destination_prep.? ?l2)) travel.v)))
			(?e (?x ((adv-a (from.p ?l1)) ((adv-a (destination_prep.? ?l2)) travel.v))))
			(?e (?x ((adv-a (destination_prep.? ?l2)) travel.v) ?l2))
			(?e (?x travel.v))
			(?e (?x travel.v ?l2))
			(?e (?x (location_adv.? travel.v)))
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

(defparameter request_action.v
	'(epi-schema ((?x request_action.v ?y ?a) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?y agent.n))
			(!r3 (?a action.n))
		)

		(:Paraphrases
			(?e (?x (ask.v ?y ?a)))
			(?e (?x (tell.v ?y ?a)))
			(?e (?x (make.v ?y ?a)))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r2 necessary-to-degree 1.0))
			(!n3 (!r3 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v ?y ?a))) ; handle "X wanted (Y) (to do A)" phrasing
			(?g2 (?x (want.v (that (?x (do.v ?a))))))
		)

		(:Steps
			(?e1 (?x (ask.v ?y ?a)))
			(?e2 (?y (do.v ?a)))
		)

		(:Episode-relations
			(!w1 (?g1 cause-of ?e1))
			(!w2 (?e1 cause-of ?e2))
		)
	)
)

(defparameter inform.v
	'(epi-schema ((?x inform.v ?y ?i) ** ?e)
		(:Paraphrases
			(?e (?x tell.v ?y ?i))
			(?e (?x let.v ?y (ka (know.v ?i))))
		)

		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?y agent.n))
			(!r3 (?i information.n)) ; TODO: add any "that"-reified prop as information.n in prop eval?
			(!r4 (not (?i action.n)))
		)

		(:Necessities
			(!n1 (!r4 necessary-to-degree 1.0))
		)

		(:Goals
			(?g1 (?x (want.v (that (?y (know.v ?i))))))
		)

		(:Postconds
			(?p1 (?y (know.v ?i)))
		)
	)
)

(defparameter watch.v
	'(epi-schema ((?x watch.v ?y) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?y entity.n))
			(!r3 (?i information.n))
			(!r4 (?i pertain-to ?y))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r4 necessary-to-degree 0.5))
			(!n3 (!g1 necessary-to-degree 0.5))
			(!n4 (!p1 necessary-to-degree 0.5))
		)

		(:Goals
			(?g1 (?x (want.v (that (?x (know.v ?i))))))
		)

		(:Preconds
			(?i1 (?x (can.md (see.v ?y))))
		)

		(:Postconds
			(?p1 (?y (know.v ?i)))
		)
	)
)
