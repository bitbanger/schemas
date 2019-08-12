(load "norm-el.lisp")
(load "real_util.lisp")
(load "coref.lisp")

(defparameter *SEC-NAMES* '(
	:Roles
	:Goals
	:Preconds
	:Postconds
	:Paraphrases
	:Steps
	:Episode-relations
))

; schema-cond? reports whether phi is a well-formed
; pair comprising a schema condition "tag" and an
; EL formula. If fluent is non-nil, the "tag" will
; be an individual (generally an episode) which is
; characterized by the EL formula. If fluent is nil,
; the tag will be an EL metavariable standing for the
; EL formula.
;
; Fluent schema conditions represent temporally-bounded
; constraints on the individuals in the schema. Nonfluent
; conditions are atemporal, i.e. eternal.
(defun schema-cond? (phi fluent)
(and
	(equal 2 (length phi))
	(symbolp (car phi))
	(if fluent
		; then
		;(or
			;(has-prefix? (format nil "~s" (car phi)) "?")
			;(lex-skolem? phi) ; skolemized episodes can sub in here
		;)
		(canon-individual? (car phi))
		; else
		(has-prefix? (format nil "~s" (car phi)) "!"))
	(canon-prop? (second phi))
)
)

(defun fluent-cond? (phi)
	(schema-cond? phi t)
)

(defun nonfluent-cond? (phi)
	(schema-cond? phi nil)
)

; schema-section? reports whether sec is a valid schema
; section, properly named and populated with valid schema
; conditions (fluent or nonfluent).
(defun schema-section? (sec)
(and
	(> (length sec) 0)
	(not (null (member (car sec) *SEC-NAMES*)))
	(or
		(loop for phi in (cdr sec)
			always (nonfluent-cond? phi))
		(loop for phi in (cdr sec)
			always (fluent-cond? phi))
	)
))

(defun section-name (sec)
(progn
	(check #'schema-section? sec)
	(car sec)
)
)

; section-formulas returns all conditions from a schema section.
(defun section-formulas (sec)
(progn
	(check #'schema-section? sec)
	(cdr sec)
)
)

; section-type returns the symbol NONFLUENT if sec contains all
; nonfluent conditions, or FLUENT if it contains all fluent
; conditions.
(defun section-type (sec)
(progn
	(check #'schema-section? sec)
	(if (nonfluent-cond? (car (section-formulas sec)))
		; then
		'NONFLUENT
		; else
		'FLUENT
	)
)
)

; schema? reports whether s is a valid schema.
(defun schema? (s)
(and
	(> (length s) 2)
	(equal (car s) 'epi-schema)
	(canon-charstar? (second s))
	(loop for sec in (cddr s)
		always (schema-section? sec)
	)
)
)

(defun schema-sections (schema)
(progn
	(check #'schema? schema)
	(cddr schema)
)
)

(defun get-section (schema sec-name)
(block outer
	(loop for sec in (schema-sections schema)
		if (equal (section-name sec) sec-name)
			do (return-from outer sec)
	)

	(return-from outer nil)
)
)

; set-section returns a new schema, identical to the input schema,
; except with the section "sec-name" having the new value "new-sec".
(defun set-section (schema sec-name new-sec)
(let (new-schema)
(block outer
	(setf new-schema (list 'epi-schema (second schema)))
	(loop for sec in (schema-sections schema) do (block inner
		(if (equal (section-name sec) sec-name)
			; then
			(setf new-schema (append new-schema (list new-sec)))
			; else
			(setf new-schema (append new-schema (list sec)))
		)
	))

	(return-from outer new-schema)
)
)
)

; add-role-constraint adds a nonfluent condition to the schema with a unique
; metavariable.
(defun add-role-constraint (schema constraint)
(let (new-roles role-num new-role)
(block outer
	(setf role-num (- (length (get-section schema ':Roles)) 1))
	(setf new-role (list (intern (format nil "!R~d" (+ role-num 1))) constraint))
	(setf new-roles (append (get-section schema ':Roles) (list new-role)))
	(return-from outer (set-section schema ':Roles new-roles))
)
)
)

; apply-bindings returns a schema where all variables have been replaced with
; their bound referents, given by the bindings map.
(defun apply-bindings (schema bindings)
(let (val)
(block outer
	(setf cursor schema)
	(loop for key being the hash-keys of bindings do (block inner
		(setf val (gethash key bindings))
		(setf cursor (replace-vals key val cursor))
	))
	(return-from outer cursor)
)))

; print-schema prints a schema with proper formatting, for readability purposes.
(defun print-schema (schema)
(block outer
	(check #'schema? schema)

	(format t "(~s ~s~%" (car schema) (second schema))
	(loop for sec in (schema-sections schema)
		do (format t "	(~s~%" (section-name sec))
		do (loop for elem in (cdr sec)
			do (format t "		~s~%" elem))
		do (format t "	)~%")
	)
	(format t ")~%")
)
)

; temporal propositions characterize episodes, generally.
(defun temporal-prop? (prop)
	; TODO: more nuanced temporal proposition identification
	(has-element prop '**)
)

(defun lambda-prop? (prop)
	; TODO: more nuanced lambda proposition identification
	(has-element prop 'LAMBDA.EL)
)

; story-term-constraints takes an EL story, split into N "sentences",
; and returns a hash map where the keys are individual constants and
; the values are lists of atemporal story constraints on those constants.
(defun story-term-constraints (story)
(let (
			(gen-kb (list (make-hash-table :test #'equal)
						  (make-hash-table :test #'equal)
						  (make-hash-table :test #'equal)))

			(constraints (make-hash-table :test #'equal))
	)
(block outer
	; Index the story into the knowledge base
	(loop for sent in story do
		(loop for wff in sent
			do (add-to-kb wff gen-kb)))

	; Reindex only small individuals by only non-lambda,
	; non-temporal constraints
	(loop for arg being the hash-keys of (kb-arg-ind gen-kb)
		if (canon-small-individual? arg) do (block inner
			(loop for pred in (gethash arg (kb-arg-ind gen-kb))
				if (and
						(not (temporal-prop? pred))
						; TODO: allow lambdas that were in
						; the stories, but not the ones we
						; created during indexing.
						(not (lambda-prop? pred)))
				; then
				do (if (not (member pred (gethash arg constraints) :test #'equal))
					; then
					(push pred (gethash arg constraints))
				)
			)
		)
	)

	; Return the constraints
	(return-from outer constraints)
)
)
)

; story-select-term-constraints takes a story and a list of individual
; constants and returns a list of all atemporal constraints on any
; of those constants.
(defun story-select-term-constraints (story terms)
(let ((constraints (story-term-constraints story)))
	(remove-duplicates (loop for term being the hash-keys of constraints
		if (member term terms :test #'equal)
		append (gethash term constraints)) :test #'equal)
)
)

; extract-small-individuals returns a list of the individual constants
; in an EL formula.
(defun extract-small-individuals (phi)
(block outer
	; (format t "extracting from ~s~%" phi)
	(return-from outer (get-elements-pred phi #'canon-small-individual?))
)
)
