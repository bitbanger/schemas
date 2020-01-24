(defparameter *PROTOSCHEMAS* '(
	do_action_for_pleasure.v
	avoid_action_to_avoid_displeasure.v
	do_action_to_enable_action.v
	use_tool.v
	give_object.v
	receiving_verb?
	go_somewhere.v
	eat.v
	feed_someone.v
	play_for_fun.v
))

(defparameter do_action_for_pleasure.v
	'(epi-schema ((?x do_action_for_pleasure.v ?a) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?a action.n))
			(!r3 (?p pleasure.n))
		)

		(:Goals
			(?g1 (?x (want.v (ka (experience.v ?p)))))
		)

		(:Preconds
			(?i1 (?x (enjoy_verb.v ?a)))
		)

		(:Steps
			(?e1 (?x (do.v ?a)))
		)

		(:Postconds
			(?p1 (?x (experience.v ?p)))
		)

		(:Episode-relations
			(!w1 (?g1 cause.v ?e1))
			(!w2 (?e1 cause.v ?p1))
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

		(:Goals
			(?g1 (?x (want.v (that (not (?x (experience.v ?d)))))))
		)

		(:Preconds
			(?i1 ((ke (?x (do.v ?a))) cause.v (ke (?x (experience.v ?d)))))
		)

		(:Steps
			(?e1 (not (?x (do.v ?a))))
		)

		(:Episode-relations
			(!w1 (?g1 cause.v ?e1))
		)
	)
)

(defparameter do_action_to_enable_action.v
	'(epi-schema ((?x do_action_to_enable_action.v ?a1 ?a2) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?a1 action.n))
			(!r3 (?a2 action.n))
		)

		(:Goals
			(?g1 (?x (want.v (ka (do.v ?a2)))))
		)

		(:Preconds
			(?i1 (not (?x (can.md (do.v ?a2)))))
		)

		(:Steps
			(?e1 (?x ((adv-a (for.p (ka (do.v ?a2)))) do.v) ?a1))
			(?e2 (?x (can.md (do.v ?a2))))
			(?e3 (?x (do.v ?a2)))
		)

		(:Episode-relations
			(!w1 (?e1 cause.v ?e2))
			(!w2 (?e1 consec ?e2))
			(!w3 (?e1 consec ?e3))
			(!w4 (?e1 before ?e2))
			(!w5 (?e1 before ?e3))
			(!w6 (?e2 postcond-of ?e1))
			(!w7 (?g1 cause.v ?e1))
			(!w8 (?e1 same-time ?e))
			(!w9 (?i1 precond-of ?e))
		)
	)
)

(defparameter use_tool.v
	'(epi-schema ((?x use_tool.v ?t (for.p-arg ?a)) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?t implement.n))
			(!r3 (?a action.n))
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

(defparameter give_object.v
	'(epi-schema ((?x give_object.v ?o (to.p-arg ?y)) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?o object.n))
			(!r3 (?y agent.n))
		)

		(:Goals
			(?g1 (?x (want.v (that (?y (have.v ?o))))))
		)

		(:Preconds
			(?i1 (?x have.v ?o))
			(?i2 (not (?y have.v ?o)))
		)

		(:Steps
			(?e1 (?x (((adv-a (to.p ?y)) give.v) ?o)))
		)

		(:Postconds
			(?p1 (not (?x have.v ?o)))
			(?p2 (?y have.v ?o))
		)
	)
)

(defparameter receiving_verb?
	'(epi-schema ((?x receiving_verb? ?o) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?o object.n))
			(!r3 (?l location.n))
		)

		(:Goals
			(?g1 (?x (want.v (that (?x (have.v ?o))))))
		)

		(:Preconds
			(?i1 (not (?x have.v ?o)))
			(?i2 (?x at.p ?l))
			(?i3 (?o at.p ?l))
		)

		(:Postconds
			(?p1 (?x have.v ?o))
		)

		(:Episode-relations
			(!w1 (?e1 same-time ?e))
			(!w2 (?i1 precond-of ?e))
			(!w3 (?p1 postcond-of ?e))
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
			(!w4 (?e cause.v ?p1))
		)
	)
)

(defparameter feed_someone.v
	'(epi-schema ((?x feed_someone.v ?y ?f) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?y agent.n))
			(!r3 (?f food.n))
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
			(?e1 (?x feed.v ?y))
			(?e2 (?x feed.v ?y ?f))
			(?e3 (?y eat.v ?f))
		)

		(:Postconds
			(?p1 (not (?x (have.v ?f))))
			(?p2 (not (?y hungry.a)))
		)

		(:Episode-relations
			(!w1 (?e1 same-time ?e2))
		)
	)
)

(defparameter play_for_fun.v
	'(epi-schema ((?x play_for_fun.v ?t) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?t toy.n))
			(!r3 (?g game.n))
		)

		(:Goals
			(?g1 (?x (want.v (ka (experience.v (k pleasure.n))))))
		)

		(:Preconds
			(?i1 (?x have.v ?t))
		)

		(:Steps
			(?e1 (?x ((adv-a (with.p ?t)) play.v)))
			(?e2 (?x ((adv-a (with.p ?t)) play.v) ?g))
		)

		(:Postconds
			(?p1 (?x experience.v (k pleasure.n)))
		)

		(:Episode-relations
			(!w1 (?e1 same-time ?e2))
		)
	)
)

(defparameter go_somewhere.v
	'(epi-schema ((?x go_somewhere.v ?l1 ?l2) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?l1 location.n))
			(!r3 (?l2 location.n))
		)

		(:Goals
			(?g1 (?x (want.v (ka ((adv-a (at.p ?l2)) be.v)))))
		)

		(:Preconds
			; (?i1 (?x ((adv-a (at.p ?l1)) be.v)))
			; (?i2 (not (?x ((adv-a (at.p ?l2)) be.v))))
			(?i1 (?x at.p ?l1))
			(?i2 (not (?x at.p ?l2)))
		)

		(:Steps
			; Lots of ways to paraphrase this...
			; TODO: implement "optional" p-args like from
			; TODO: automatic synonym detection
			; TODO: separate active take vs. passive receive?
			(?e1 (?x ((adv-a (from.p ?l1)) ((adv-a (to.p ?l2)) movement_verb.v))))
			(?e2 (?x ((adv-a (to.p ?l2)) movement_verb.v)))
			(?e3 (?x ((adv-a (from.p ?l1)) movement_verb.v)))
		)

		(:Postconds
			;(?p1 (not (?x ((adv-a (at.p ?l1)) be.v))))
			;(?p2 (?x ((adv-a (at.p ?l2)) be.v)))
			(?p1 (not (?x at.p ?l1)))
			(?p2 (?x at.p ?l2))
		)

		(:Episode-relations
			(!w1 (?i1 before ?e1))
			(!w2 (?i2 before ?e1))
			(!w3 (?p1 after ?e1))
			(!w4 (?p2 after ?e1))
			(!w5 (?g1 cause.v ?e1))
			(!w6 (?e2 same-time ?e1))
			(!w7 (?e3 same-time ?e1))
		)
	)
)
