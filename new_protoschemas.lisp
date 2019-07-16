(defparameter do_action_to_enable_action.v
	'(epi-schema ((?x do_action_to_enable_action.v ?a1 ?a2) ** ?e)
		(:Roles
			!r1 (?x agent1.n)
			!r2 (?a1 action1.n)
			!r3 (?a2 action1.n)
		)

		(:Goals
			?g1 (?x (want.v (ka (do.v ?a2))))
		)

		(:Preconds
			!i1 (not (?x (can.md (do.v ?a2))))
		)

		(:Steps
			?e1 (?x (do.v ?a1 (adv-a (for.p (ka (do.v ?a2))))))
			?e2 (?x (can.md (do.v ?a2)))
		)

		(:Episode-relations
			!w1 (?e1 cause-of ?e2)
		)
	)
)

(defparameter use_tool_for_action.v
	'(epi-schema ((?x use_tool_for_action.v ?t ?a) ** ?e)
		(:Roles
			!r1 (?x agent1.n)
			!r2 (?t implement1.n)
			!r3 (?a action1.n)
			!r4 (?t be-suitable-for.v ?a) ; this shouldn't be .v; change grammar to allow "relational adjectives"?
		)

		(:Preconds
			!i1 (?x (have.v ?t))
		)

		(:Goals
			?g1 (?x (want.v (that (?x (do.v ?a)))))
		)

		(:Steps
			?e1 (?x (do.v ?a (adv-a (using.p ?t))))
		)
	)
)
