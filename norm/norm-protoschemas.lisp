(defparameter *PROTOSCHEMAS* '(
	do_action_for_pleasure.v
	avoid_action_to_avoid_displeasure.v
	do_action_to_enable_action.v
	use_tool.v
	give_object.v
	take_object.v
	go_somewhere.v
	eat_food.v
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
			(?e3 (?x (use.v ?t (for.p-arg ?a))))
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
			(?e1 (?x (give.v ?o (to.p-arg ?y))))
		)

		(:Postconds
			(?p1 (not (?x have.v ?o)))
			(?p2 (?y have.v ?o))
		)
	)
)

(defparameter take_object.v
	'(epi-schema ((?x take_object.v ?o) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?o object.n))
		)

		(:Goals
			(?g1 (?x (want.v (that (?x (have.v ?o))))))
		)

		(:Preconds
			(?i1 (not (?x have.v ?o)))
		)

		(:Steps
			; Lots of ways to paraphrase this...
			; TODO: implement "optional" p-args like from
			; TODO: automatic synonym detection
			; TODO: separate active take vs. passive receive?
			(?e1 (?x (receiving_verb.v ?o)))
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

(defparameter eat_food.v
	'(epi-schema ((?x eat_food.v ?f) ** ?e)
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

		(:Steps
			(?e1 (?x eat.v ?f))
		)

		(:Postconds
			(?p1 (not (?x (have.v ?f))))
			(?p2 (not (?x hungry.a)))
		)

		(:Episode-relations
			(!w1 (?p1 after ?e1))
			(!w2 (?i1 before ?e1))
			(!w3 (?e1 cause.v ?p1))
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
			(?g2 (?x (want.v (that (?y eat_food.v ?f)))))
		)

		(:Preconds
			(?i1 (?x have.v ?f))
			(?i2 (?y hungry.a))
		)

		(:Steps
			(?e1 (?x feed.v ?y))
			(?e2 (?x feed.v ?y ?f))
			(?e3 (?y eat_food.v ?f))
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
			(!r2 (?o location.n))
		)

		(:Goals
			(?g1 (?x (want.v (ka ((adv-a (at.p ?l2)) be.v)))))
		)

		(:Preconds
			(?i1 (?x ((adv-a (at.p ?l1)) be.v)))
			(?i2 (not (?x ((adv-a (at.p ?l2)) be.v))))
		)

		(:Steps
			; Lots of ways to paraphrase this...
			; TODO: implement "optional" p-args like from
			; TODO: automatic synonym detection
			; TODO: separate active take vs. passive receive?
			(?e1 (?x (movement_verb.v (to.p-arg ?l2))))
			(?e2 (?x (movement_verb.v (from.p-arg ?l1) (to.p-arg ?l2))))
			(?e3 (?x (movement_verb.v (to.p-arg ?l2) (from.p-arg ?l1))))
			(?e4 (?x (movement_verb.v (from.p-arg ?l1))))
			(?e5 (?x (movement_verb.v)))
		)

		(:Postconds
			(?p1 (not (?x ((adv-a (at.p ?l1)) be.v))))
			(?p2 (?x ((adv-a (at.p ?l2)) be.v)))
		)

		(:Episode-relations
			(!w1 (?e1 same-time ?e2))
			(!w2 (?e1 same-time ?e3))
			(!w3 (?e1 same-time ?e4))
			(!w3 (?e1 same-time ?e5))
		)
	)
)
