(declaim (sb-ext:muffle-conditions cl:warning))

(load "norm-matcher.lisp")
(load "norm-protoschemas.lisp")

(defparameter nest_schema.v
	'(epi-schema ((?xp nest_schema.v ?yp) ** ?e)
		(:Roles
			(!r1 (?xp agent.n))
			(!r2 (?yp object.n))
		)
	
		(:Steps
			(?e1 (?xp (receiving_verb.? ?yp)))
			(?e2 (?xp (eat.v ?yp)))
		)

		(:Episode-relations
			(!w1 (?e1 before ?e2))
			(!w2 (?e1 during ?e))
			(!w3 (?e2 during ?e))
		)
	)
)

(setf match1 (match-story-to-schema
	'((I.PRO AGENT.N))

	nest_schema.v

	nil
)
)

(print-schema (car match1))

(setf match2 (match-story-to-schema
	'((PARK.SK LOCATION.N) (PARK.SK NICE.A))

	(car match1)

	nil
)
)


(defun gen-clean (schema)
	(rename-constraints (sort-steps (generalize-schema-constants schema)))
)

(defun print-expanded (schema)
	(print-schema schema)

	(loop for st in (section-formulas (get-section schema ':Steps))
		if (invokes-schema? (second st))
			do (block print-expanded
				(setf expanded-pair (expand-nested-schema st schema))
				(print-schema (apply-bindings (car expanded-pair) (second expanded-pair)))
			)
	)
)

(format t "~s~%" (extract-small-individuals (car match2)))
; (print-expanded (gen-clean (car match2)))
(print-expanded (car match2))
