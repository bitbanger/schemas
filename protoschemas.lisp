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
						(experience4.v ?p)))))
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

; TODO: out of order arg matching using types?
(defparameter give_object
	'(epi-schema ((?x give_object ?y ?o) ** ?e)
		(:Fixed-roles
			?x agent6.n
			?y agent6.n
			?o (kind1-of.n object.n)
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
			!w2 (?e = ?e1)
			!w3 (?e1 before.p ?e2)
			!w4 (?e1 cause-of.n ?e2)
			!w5 (?e1 during.p ?e2)
		)
	)
)

(defparameter possession
	'(epi-schema ((?x possess ?o) ** ?e)
		(:Fixed-roles
			?x agent6.n
			?o (kind1-of.n object.n)
		)

		(:Init-conds
		)

		(:Nonfluent-conds
			!w1 (?o1 realize3.v ?o)
			!w2 (?x want1.v (ka (have.v ?o1)))
			!w3 (forall ?y (if.ps (?x (have.v ?o1))
				(not (?y (can.aux-v (have.v ?o1))))))
		)

		(:Goals
			?g1 (?x want1.v
				(that (?y (have.v ?o))))
		)

		(:Intended-episodes
			?e1 (?x (have.v ?o1))
		)

		(:Episode-relations
			!w2 (?e = ?e1)
			!w3 (?e1 during.p ?g1)
		)
	)
)

(defparameter *PROTOSCHEMAS* (list
	do_for-pleasure.v
	give_object
	possession
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
