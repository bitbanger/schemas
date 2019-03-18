(load "schema_util.lisp")

; do_for-pleasure protoschema
(defparameter do_for-pleasure.sch
	'(epi-schema ((?x do_for-pleasure.sch ?a) ** ?e)
		(:Fixed-roles
			!r1 (?x agent6.n)
			!r2 (?a (kind1-of.n activity1.n))
		)

		(:Var-roles
			!r3 (?p (kind1-of.n pleasure1.n))
			!r4 (?p1 pleasure1.n)
			!r5 (?v subjective-value1.n)
		)

		(:Nonfluent-conds
			!w1 (?p1 realize3.v ?p)
		)

		(:Init-conds
			!i1 (?x (can.aux-v (do2.v a)))
		)

		(:Goals
			?g1 (?x want1.v
				(that (?x ((adv-a (by-means.p (ka (do2.v ?a))))
						(experience4.v ?p)))))
		)

		(:Intended-episodes
			?e1 (?x do2.v ?a)
			?e2 (?x experience4.v ?p1)
		)

		(:Episode-relations
			!w2 (?g1 = ?e)
			!w3 (?e1 during.p ?i1)
			!w4 (?e2 during.p ?e1)
			!w5 (?e1 cause-of.n ?e2)
			!w6 (?e1 during.p ?g1)
		)
	)
)

; TODO: out of order arg matching using types?
(defparameter give_to.sch
	'(epi-schema ((?x give_to.sch ?y ?o) ** ?e)
		(:Fixed-roles
			!r1 (?x agent6.n)
			!r2 (?y agent6.n)
			!r3 (?o (kind1-of.n object.n))
		)

		(:Var-roles
			!r4 (?l location.n)
		)

		(:Init-conds
			!i1 (?x (can.aux-v (give-to.v ?y ?o)))
			!i2 (?x (be.v (adv-e (near.p ?y))))
		)

		(:Goals
			?g1 (?x want1.v
				(that (?y (have.v ?o))))
		)

		(:Intended-episodes
			?e1 (?x (give-to.v ?y ?o))
			?e2 (?y (have.v ?o))
		)

		(:Episode-relations
			!w1 (?e = ?e1)
			!w2 (?e1 before.p ?e2)
			!w3 (?e1 cause-of.n ?e2)
			!w4 (?e1 during.p ?e2)
		)
	)
)



(defparameter give_obj_for_poss.v
	'(epi-schema ((?x give_to.sch ?y ?o) ** ?e)
		(:Nonfluent-conds
			!r1 (?x agent.n)
			!r2 (?y agent.n)
			!r3 (?o object.n)
			!r4 (?l location.n)
		)

		(:Init-conds
			?i1 (?x (can.aux-v (give_to.v ?y ?o)))
			?i2 (?x (be.v (adv-e (at.p ?l))))
			?i3 (?y (be.v (adv-e (at.p ?l))))
		)

		(:Goals
			?g1 (?x want.v (that (?y have.v ?o)))
		)

		(:Steps
			?e1 (?x (give_to.v ?y ?o))
		)

		(:Post-conds
			?p1 (?y (possess_obj.v ?o))
		)

		(:Episode-relations
			!w1 (?e1 same-time ?e)
			!w2 (?e1 consec ?p1)
			!w3 (?e1 cause-of.n ?p1)
		)
	)
)

(defparameter possess_obj.v
	'(epi-schema ((?x possess_obj.v ?o) ** ?e)
		(:Nonfluent-conds
			!r1 (?x agent.n)
			!r2 (?o object.n)
			!r3 (not (?o agent.n))
		)

		(:Init-conds
		)

		(:Goals
		)

		(:Values
			?v1 (?e valuable_for.p ?x)
		)

		(:Steps
			?e1 (?x have.v ?o)
		)

		(:Episode-relations
			!w1 (?e1 same-time ?e)
		)
	)
)

; Do an action to bring about a valuable episode.
(defparameter do_action_for_value.v
	; Our EL inferences are going to be driven by matching a
	; schema WFF to the atemporal KB.
	; For now, we want to avoid actual Rule Instantiation,
	; because the result of the inference ideally wouldn't
	; add more complexities to the match (or else we'd be
	; modifying the schema WFFs with new conditions); for now,
	; we'll sacrifice some power (for things like conditionals,
	; variables in the story, etc.).
	; So the way we'll match schema WFFs to story ones is:
	; 1. make sure we CAN'T match any nots
	;	(you'll have to find time windows here; easy for NFs)
	;	(optionally, confirm some foralls as well)
	; 2. resolve "macros" like kind-of-action, unstated types,
	; 	potentially relational nouns...this step could eventually
	;	split out into goal chaining infs, from conds
	; 3. form alt-wffs for syntactic stuff (do ka from verb, etc.)
	; 4. for all canonicalized episodes, for all WFFs in the
	; 	top-level conjunction, just try to match against those.
	;	(also, confirm the episode is temporally consistent
	;	  w/ the matched schema WFF's ep)
	'(epi-schema ((?x do_action_for_value.v ?a ?ev) ** ?e)
		(:Nonfluent-conds
			; TODO: we'll need to implement a series of
			; hacky "match checks" to do stuff like define
			; kind1-of.n action.n as a predicate in Lisp
			; that checks the grammar of a potential
			; match. After these checks are done, it can
			; fall back to a structural match. Eventually,
			; we'll need to do actual EL matching, with
			; arbitrary minor premises, polarity tracking,
			; etc.
			!r1 (?a (kind1-of.n action.n))
		)

		(:Init-conds
			; TODO: we'll want to implement "not" matching
			; for schema WFFs by looking through the KB
			; for the base prop. Not finding anything should
			; be compatible, but less strongly matched than
			; finding the explicit negation.
		)

		(:Steps
			; TODO: this schema should really trigger
			; when a reward is observed (e2), rather than
			; when an action is done (e1). In that case,
			; we'll have to go back in time to match
			; telic steps that occurred before the matched
			; step.
			?e1 (?x do.v ?a)

			?e2 (?x have_value.v ?ev)
		)

		(:Goals
			; TODO: what does wanting an episode mean?
			; Does it mean wanting the ke of its characterizer?
			; Of everything true in it?
			?g1 (?x want1.v ?ev)
		)

		(:Episode-relations
			; When determining the truth of cause-of in the
			; KB, if ?e1's characterizer is a schema, we can
			; check that schema's postconditions for ?ev.
			!w1 (?e1 cause-of.n ?ev)
		)
	)
)

(defparameter do_to_enable_action.v
	'(epi-schema ((?x do_to_enable_action.v ?a1 ?a2) ** ?e)
		(:Nonfluent-conds
			!r1 (?a1 (kind1-of.n action.n))
			!r2 (?a2 (kind1-of.n ation.n))
		)

		(:Goals
			?g1 (?x want1.v (that (?x can.md (do2.v ?a2))))
		)

		(:Trigger-conds
			?t1 (?x ((adv-a (for.p (that (?x do2.v ?a2))))) do2.v ?a1)
		)

		(:Steps
			?e1 (?x do2.v ?a1)
			?e2 (?x (can.md (do2.v ?a2)))
		)
	)
)

(defparameter be_friendly_with.sch
	'(epi-schema ((?x be_friendly_with.sch ?y) ** ?e)
		(:Fixed-roles
			!r1 (?x agent6.n)
			!r2 (?y agent6.n)
			!r3 (?p (kind1-of.n pleasure.n))
			!r4 (?a (kind1-of.n activity.n))
		)

		(:Init-conds
		)

		(:Nonfluent-conds
			; this is symmetric
			!w1 (?y (be_friendly_with.sch ?x))

			; TODO: bind inline kinds to variables instead of pulling them out manually?
			!w2 (?x want1.v
				(that (?y (experience1.v ?p))))

			; should these have episode quantifiers/frequencies?
			!w3 (?x want1.v
				(that (?x (do_activity_with_other.sch ?a))))

			!w4 (?x (like.v ?y))

			!w5 (?x (know.v (some.d (information.n (about.p-arg ?y)))))
		)

		(:Goals
		)

		(:Intended-episodes
			?e1 (?x (be.v (friend.n (of.p ?y))))
		)

		(:Episode-relations
			!w6 (?e = ?e1)
		)
	)
)

(defparameter do_activity_with_other.sch
	'(epi-schema ((?x do_activity_with_other.sch ?a ?y) ** ?e)
		(:Fixed-roles
			!r1 (?x agent6.n)
			!r2 (?a (kind1-of.n activity1.n))
			!r3 (?y agent6.n)
		)

		(:Init-conds
			!i1 (?x (can.aux-v (do2.v ?a)))
			!i2 (?y (can.aux-v (do2.v ?a)))
			!i3 (?x (be.v (at.p ?l)))
			!i4 (?y (be.v (at.p ?l)))
		)

		(:Nonfluent-conds
			!w1 (if.ps (?x (do_for-pleasure.sch ?a))
				(?x (be_friendly_with.sch ?y)))
		)

		(:Goals
		)

		(:Intended-episodes
			?e1 (?x (do2.v ?a (adv-a (with.p ?y))))
		)

		(:Episode-relations
			!w2 (?e = ?e1)
			!w3 (?i3 during.p ?e1)
			!w4 (?i4 during.p ?e1)
		)
	)
)

(defparameter possess.sch
	'(epi-schema ((?x possess.sch ?o) ** ?e)
		(:Fixed-roles
			!r1 (?x agent6.n)
			!r2 (?o (kind1-of.n object.n))
		)

		(:Var-roles
			!r3 (?p (kind1-of.n pleasure1.n))
			!r4 (?p1 pleasure1.n)
		)

		(:Init-conds
		)

		(:Nonfluent-conds
			!w1 (?o1 realize3.v ?o)
			!w2 (?x want1.v (ka (have.v ?o1)))
			!w3 (forall ?y (not (?y = ?x)) (not (?y (can.aux-v (possess.sch ?o1)))))
			!w4 (?p1 realize3.v ?p)
		)

		(:Goals
		)

		(:Intended-episodes
			?e1 (?x (have.v ?o1))
			?e2 (?x experience4.v ?p1)
		)

		(:Episode-relations
			!w5 (?e = ?e1)
			!w6 (?e1 cause-of.n ?e2)
		)
	)
)

(defparameter *PROTOSCHEMAS* (list
	; do_for-pleasure.sch
	give_to.sch
	possess.sch
	do_activity_with_other.sch
	be_friendly_with.sch
))
