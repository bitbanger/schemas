(load "norm-el.lisp")
(load "real_util.lisp")

(defparameter *SEC-NAMES* '(
	:Roles
	:Goals
	:Preconds
	:Postconds
	:Paraphrases
	:Steps
	:Episode-relations
))

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

(defun schema-section? (sec)
(and
	(> (length sec) 0)
	(not (null (member (car sec) *SEC-NAMES*)))
	(loop for phi in (cdr sec)
		always (or (nonfluent-cond? phi) (fluent-cond? phi))
)))

(defun section-name (sec)
(progn
	(check #'schema-section? sec)
	(car sec)
)
)

(defun section-formulas (sec)
(progn
	(check #'schema-section? sec)
	(cdr sec)
)
)

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
