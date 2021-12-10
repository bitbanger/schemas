(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load-superdir "schema-util.lisp")
(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "new-ulf-parser.lisp")
(ll-load-superdir "schema-ngrams.lisp")

(ll-load "dec_10_compos_and_protos.lisp")

(ldefun true-preconditions (expanded)
(block outer
	(setf pres (list))
	(setf posts (make-hash-table :test #'equal))

	(loop for schema in expanded do (block track
		(loop for pre in (mapcar #'second (section-formulas (get-section schema ':Preconds)))
			if (not (or
				(not (null (gethash pre posts)))
				(not (null (gethash (list 'NOT pre) posts)))))
				; then
				do (setf pres (append pres (list pre))))

		(loop for post in (mapcar #'second (section-formulas (get-section schema ':Postconds)))
			do (setf (gethash post posts) t))
	))

	(return-from outer (dedupe pres))
)
)

(ldefun true-postconditions (expanded)
(block outer
	(setf statuses (make-hash-table :test #'equal))

	(loop for schema in expanded do (block track
		(loop for post in (mapcar #'second (section-formulas (get-section schema ':Postconds)))
			if (equal (car post) 'NOT)
				do (setf (gethash (second post) statuses) nil)
			else
				do (setf (gethash post statuses) t))))

	(return-from outer (loop for k being the hash-keys of statuses
		if (not (null (gethash k statuses)))
			collect k
		else
			collect (list 'NOT k)))
)
)

(loop for pair in *NESL-COMPOS-AND-PROTOS* do (block main
	(setf compo (car pair))
	(setf protos (second pair))

	; Clear all registered schemas (incl. bare
	; protoschemas)
	(clear-registered-schemas)

	; Register all protos for expansion
	(loop for proto in protos
		; do (register-schema proto))
		; do (create-from-match proto))
		do (register-schema (fully-clean-schema proto)))

	; List each step in the compo that invokes
	; a proto
	; (format t "additional goals:~%")
	(setf expandeds (list))
	(loop for st in (section-formulas (get-section
		compo ':Steps)) do (block check-step
			(if (and (invokes-schema? (second st))
				(contains (mapcar #'schema-pred protos) (schema-pred (invoked-schema (second st)))))
				; then
				(handler-case (block expand
					(setf expanded-pair (expand-nested-schema st compo))
					(setf expanded-schema (apply-bindings (car expanded-pair) (second expanded-pair)))
					(setf expandeds (append expandeds (list expanded-schema)))
				) (error () (format t "error~%")))
			)
		))

	(setf final-preconds (true-preconditions expandeds))
	(setf final-postconds (true-postconditions expandeds))
	(setf final-goals (dedupe (loop for schema in expandeds
		append (mapcar #'second (section-formulas
			(get-section schema ':Goals))))))

	(loop for pre in final-preconds
		do (setf compo (add-constraint compo ':Preconds pre)))
	(loop for post in final-postconds
		do (setf compo (add-constraint compo ':Postconds post)))
	(loop for goal in final-goals
		do (setf compo (add-constraint compo ':Goals goal)))

	(print-schema compo)

	(format t "----------------~%~%")

	; Clear all the protos we just registered, as well
	(clear-registered-schemas)
))
