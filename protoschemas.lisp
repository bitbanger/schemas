(defun schema-name (schema)
	(car schema)
)

(defun schema-header (schema)
	(second schema)
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

(defun get-int-ep (schema)
	(get-pairs (cdr (get-section schema ':Intended-episodes)))
)

(defun get-pairs (l)
	(loop for (a b) on l by #'cddr
		collect (list a b)
	)
)

(setf (fdefinition 'gs) #'get-section)

; do_for-pleasure protoschema
(defparameter do_for-pleasure.v
	'(epi-schema ((?x do_for-pleasure.v ?a) ** ?e)
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
			?i1 (x (can.aux-v (do2.v a)))
		)

		(:Goals
			?g1 (?x want1.v
				(that (?x ((adv-a (by-means.p (ka (do2.v ?a))))
						(?x experience4.v ?p)))))
		)

		(:Intended-episodes
			?e1 (?x do2.v ?a)
			?e2 (?x experience4.v ?p1)
		)

		(:Episode-relations
			!w2 ((join.f ?e1 ?e2) = ?e)
			!w3 (?e1 during.p ?i1)
			!w4 (?e2 during.p ?e1)
			!w5 (?e1 cause-of.n ?e2)
			!w6 (?e1 during.p ?g1)
		)
	)
)




