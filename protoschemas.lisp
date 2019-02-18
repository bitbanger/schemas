(defun schema-header (schema)
	(second schema)
)

(defun schema-name (schema)
	(second (car (schema-header schema)))
)

(defun schema-sections (schema)
	(cddr schema)
)

(defun get-section (schema section-name)
	(loop for section in (schema-sections schema)
		if (equal (car section) section-name)
			return section
	)
)

(defun get-pairs (l)
	(loop for (a b) on l by #'cddr
		collect (list a b)
	)
)

(defun get-int-ep (schema)
	(get-pairs (cdr (get-section schema ':Intended-episodes)))
)

(setf (fdefinition 'gs) #'get-section)

; do_for-pleasure protoschema
(defparameter do_for-pleasure.sch
	'(epi-schema ((?x do_for-pleasure.sch ?a) ** ?e)
		(:Fixed-roles
			?x agent6.n
			?a (kind1-of.n activity1.n)
		)

		(:Var-roles
			?p (kind1-of.n pleasure1.n)
			?p1 pleasure1.n
			?v subjective-value1.n
		)

		(:Nonfluent-conds
			!w1 (?p1 realize3.v ?p)
		)

		(:Init-conds
			?i1 (?x (can.aux-v (do2.v a)))
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
(defparameter give_object.sch
	'(epi-schema ((?x give_object.sch ?y ?o) ** ?e)
		(:Fixed-roles
			?x agent6.n
			?y agent6.n
			?o (kind1-of.n object.n)
		)

		(:Var-roles
			?l location.n
		)

		(:Init-conds
			?i1 (?x (can.aux-v (give-to.v ?y ?o)))
			?i2 (?x (be.v (adv-e (near.p ?y))))
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

(defparameter be_friendly_with.sch
	'(epi-schema ((?x be_friendly_with.sch ?y) ** ?e)
		(:Fixed-roles
			?x agent6.n
			?y agent6.n
			?p (kind1-of.n pleasure.n)
			?a (kind1-of.n activity.n)
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
			?x agent6.n
			?a (kind1-of.n activity1.n)
			?y agent6.n
		)

		(:Init-conds
			?i1 (?x (can.aux-v (do2.v ?a)))
			?i2 (?y (can.aux-v (do2.v ?a)))
			?i3 (?x (be.v (at.p ?l)))
			?i4 (?y (be.v (at.p ?l)))
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
			?x agent6.n
			?o (kind1-of.n object.n)
		)

		(:Var-roles
			?p (kind1-of.n pleasure1.n)
			?p1 pleasure1.n
		)

		(:Init-conds
		)

		(:Nonfluent-conds
			!w1 (?o1 realize3.v ?o)
			!w2 (?x want1.v (ka (have.v ?o1)))
			!w3 (forall ?y (if.ps (?x (have.v ?o1))
				(not (?y (can.aux-v (have.v ?o1))))))
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
	do_for-pleasure.sch
	give_object.sch
	possess.sch
	do_activity_with_other.sch
	be_friendly_with.sch
))

(defun print-schema (schema)
(block outer
	(format t "(epi-schema ~s~%" (schema-header schema))
	(loop for section in (schema-sections schema)
		do (block inner
			(format t "	(~s~%" (car section))
			(loop for pair in (get-pairs (cdr section))
				do (format t "		~s	~s~%" (first pair) (second pair))
			)
			(format t "	)~%")
		)
	)
	(format t ")~%")
)
)
