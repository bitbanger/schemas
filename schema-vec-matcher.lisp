(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "ll-util.lisp")
(ll-load "new-ulf-parser.lisp")
(ll-load "schema-match.lisp")
(ll-load "schema-util.lisp")
(ll-load "schema-time.lisp")

(ll-load "verbalize-schemas.lisp")

(ldefun match-prop (prop story)
	(read-from-string (join-str-list "" (run-proc-with-stdin "/home/lane/miniconda3/bin/python" '("pyschemas/schema_match_client.py") (format nil "~a ~a" prop story))))
)

(setf story (car (len-parse-sents '("Jack planted seeds."))))
(setf prop (car (loop for p in story if (canon-charstar? p) collect p)))

(format t "~a ~a~%" prop story)

(setf pairs (match-prop prop story))

(loop for pair in pairs do (block match-one
	(setf schema (car pair))
	(register-schema schema)
	(setf target-id (second pair))

	(setf match-tup (unchecked-match-formula-to-single-schema prop schema (make-hash-table :test #'equal) 0 nil story nil))

	(setf new-schema (car match-tup))
	; (print-schema new-schema)
	; (format t "~s~%" (verbalize-schema new-schema))

	(setf new-type-constraints (list))

	(setf story-inds (dedupe (extract-small-individuals story)))
	(loop for ind in story-inds do (block type-inferences
		(setf schema-types (dedupe (mapcar #'second (schema-term-constraints new-schema ind))))
		(setf new-schema-types (set-difference schema-types (story-select-term-constraints story (list ind)) :test #'equal))
		(setf new-type-constraints (append new-type-constraints new-schema-types))
	))
	(setf new-type-constraints (loop for e in (dedupe new-type-constraints) if (interesting-constr? e) collect e))

	(format t "~s~%" new-type-constraints)
	(format t "~s~%" (mapcar #'stringify-verbalization (verbalize-steps new-schema)))
	; (format t "~s~%" (gpt-verbalize-steps new-schema))

	; (print-schema schema)
	; (setf unify-tup (unify-with-schema-maybe-header prop schema story nil))
	; (print-schema (apply-bindings schema (third unify-tup)))
	; (format t "~s~%" (gpt-verbalize-steps (apply-bindings schema (third unify-tup))))
	; (format t "~s~%" (verbalize-schema (apply-bindings schema (third unify-tup))))
))
