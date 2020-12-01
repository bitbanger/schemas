(load "ll-load.lisp")

(ll-load "ttt/src/load")
(ll-load "schema-el.lisp")
(ll-load "ll-util.lisp")
(ll-load "schema-kb.lisp")
(ll-load "schema-subsumption.lisp")
(ll-load "schema-time.lisp")
(ll-load "ll-cache.lisp")

(defparameter *BLANK-SCHEMA*
	'(epi-schema ((?x blank.v) ** ?E) (:Roles))
)

(setf *DEFAULT-NECESSITY* 0.9)
(setf *DEFAULT-CERTAINTY* '(/ 1 1))

(defparameter *SCHEMA-MATCH-NUM* 0)

(defparameter *SEC-NAMES* '(
	:Roles
	:Goals
	:Preconds
	:Steps
	:Postconds
	:Paraphrases
	:Episode-relations
	:Certainties
	:Necessities
	:Subordinate-constraints
))

(defparameter *SCHEMAS-BY-PRED* (make-hash-table :test #'equal))
; (format t "resetting preds-by-schema~%")
(defparameter *PREDS-BY-SCHEMA* (make-hash-table :test #'equal))

; known-schema-pred takes a schema, ignores
; its predicate, looks it up in a database of
; known schemas, and returns the predicate it's
; known by in that database, or nil otherwise.
(defun known-schema-pred (schema)
(block outer
	; We only disregard the match number of a given
	; predicate; if a schema is identical but has
	; a different predicate name, it's not identical.
	(setf blanked-schema (replace-vals (schema-pred schema) (get-schema-match-name (schema-pred schema)) schema))
	; (format t "looking schema up in known db:~%")
	; (print-schema blanked-schema)
	; (format t "~s~%" blanked-schema)
	(if (not (null (gethash blanked-schema *PREDS-BY-SCHEMA*)))
		; then
		(progn
		; (format t "schema ~s known by name ~s~%" (schema-pred schema) (gethash blanked-schema *PREDS-BY-SCHEMA*))
		(return-from outer (gethash blanked-schema *PREDS-BY-SCHEMA*))
		)
	)

	(return-from outer nil)
)
)

(defun lambdify-preds! (ps)
	(lambdify-preds-maybe-colon ps nil)
)

(defun lambdify-preds-colon! (ps)
	(lambdify-preds-maybe-colon ps t)
)

(defun lambdify-preds-maybe-colon (ps colon)
(let ((tmp-sym (gensym)))
	(list
		(if colon ':L 'L)
		tmp-sym
		(if colon
			; then
			(append (list ':O 'AND) (mapcar (lambda (x) (list ':I tmp-sym x)) ps))
			; else
			(append (list 'AND) (mapcar (lambda (x) (list tmp-sym x)) ps))
		)
	)
)
)

(defun register-schema (schema)
(block outer
	(setf (gethash (schema-pred schema) *SCHEMAS-BY-PRED*) schema)
	(set (schema-pred schema) schema)

	(setf blanked-schema (replace-vals (schema-pred schema) (get-schema-match-name (schema-pred schema)) schema))
	(if (null (gethash blanked-schema *PREDS-BY-SCHEMA*))
		; then
		(progn
			; (format t "adding schema (~s) to known list:~%" blanked-schema)
			; (format t "with pred ~s~%" (schema-pred schema))
			; (print-schema blanked-schema)
			; (format t "~s~%" blanked-schema)
			(setf (gethash blanked-schema *PREDS-BY-SCHEMA*) (schema-pred schema))
			; (format t "preds-by-schema size ~s~%" (ht-count *PREDS-BY-SCHEMA*))
			; (format t "successfully added? ~s (val ~s)~%" (not (null (gethash blanked-schema *PREDS-BY-SCHEMA*))) (gethash blanked-schema *PREDS-BY-SCHEMA*))
		)
	)
)
)

; create-from-match takes a schema match and:
; 	1. gives it a new name, or re-uses a name
;		if the schema is known
;	2. generalizes constants to variables
;	3. registers the generalized schema under
;		the new name
;	4. returns the generalized schema name
(defun create-from-match (match)
	(create-from-match-maybe-gen match t)
)

(defun create-from-match-maybe-gen (match should-gen)
(block outer
	(setf is-new-schema nil)

	; (maybe) generalize the schema
	(setf new-schema match)
	(if should-gen
		; then
		; (setf new-schema (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants new-schema)))))
		(setf new-schema (fully-clean-schema match))
	)

	; check whether we know the generalized schema
	; by some name
	(setf new-schema-name (known-schema-pred new-schema))
	(if (null new-schema-name)
		; then
		(progn
		(setf new-schema-name (new-schema-match-name (schema-pred match)))
		(setf is-new-schema t)
		)
	)

	; Replace the name and generalize the schema
	(setf new-schema (replace-vals (schema-pred new-schema) new-schema-name new-schema))

	(if is-new-schema
		; then
		(register-schema new-schema)
	)

	(return-from outer new-schema-name)
)
)

; sec-formula-prefix tells you the prefix for condition
; formulas for a given section, e.g. !W for Episode-relations
; to yield !W1, ?E for Steps to yield ?E1, etc.
(defun sec-formula-prefix (sec-name)
(block outer
	(if (null (member sec-name *SEC-NAMES* :test #'equal))
		(return-from outer nil))

	(cond
		((equal sec-name ':Roles)
			(return-from outer "!R"))
		((equal sec-name ':Goals)
			(return-from outer "?G"))
		((equal sec-name ':Preconds)
			(return-from outer "?I"))
		((equal sec-name ':Postconds)
			(return-from outer "?P"))
		((equal sec-name ':Paraphrases)
			(return-from outer "?PAR"))
		((equal sec-name ':Steps)
			(return-from outer "?E"))
		((equal sec-name ':Episode-relations)
			(return-from outer "!W"))
		((equal sec-name ':Certainties)
			(return-from outer "!C"))
		((equal sec-name ':Necessities)
			(return-from outer "!N"))
		((equal sec-name ':Subordinate-constraints)
			(return-from outer "!S"))
		(t
			(return-from outer nil))
	)
)
)

(defun sec-name-from-prefix (prefix)
(block outer
	(loop for sec-name in *SEC-NAMES*
		if (equal (sec-formula-prefix sec-name) prefix)
			do (return-from outer sec-name)
	)

	(return-from outer nil)
)
)

(defun sec-name-from-id (id)
	(sec-name-from-prefix (subseq (string id) 0 2))
)

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
		(has-prefix? (string (car phi)) "!"))
	(canon-prop? (second phi))
)
)

(defun exc-varp (s)
(and
	(symbolp s)
	(> (length (string s)) 1)
	(equal "!" (subseq (string s) 0 1))
)
)

(defun exc-to-var (s)
	(if (exc-varp s)
		; then
			(intern (concat-strs "?" (remove-prefix (string s) "!")))
		; else
		(if (varp s)
			; then
			s
			; else
			nil
		)
	)
)

(defun var-to-exc (s)
	(if (varp s)
		; then
		(intern (concat-strs "!" (remove-prefix (string s) "?")))
		; else
		(if (exc-varp s)
			; then
			s
			; else
			nil
		)
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
		; These sections don't need to have valid formulas.
		(equal (car sec) ':Necessities)
		(equal (car sec) ':Certainties)

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
(block outer
	(if (null sec)
		(return-from outer nil))
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
		(if (fluent-cond? (car (section-formulas sec)))
			; then
			'FLUENT
			; else
			'META
		)
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

(defun schema-name (schema)
	(prop-pred (car (second schema)))
)

(defun schema-sections (schema)
(progn
	(check #'schema? schema)
	(cddr schema)
)
)

(defun sort-sections (secs)
	(sort secs (lambda (s1 s2)
		(> (length (member (car s1) *SEC-NAMES* :test #'equal)) (length (member (car s2) *SEC-NAMES* :test #'equal)))
	))
)

(defun nonmeta-sections (schema)
	(loop for sec in (schema-sections schema)
		if (and (or (equal (section-type sec) 'NONFLUENT)
			   (equal (section-type sec) 'FLUENT))
				(not (equal (car sec) ':Subordinate-constraints)))
			; then
			collect sec
	)
)

(defun nonfluent-sections (schema)
	(loop for sec in (schema-sections schema)
		if (equal (section-type sec) 'NONFLUENT)
			collect sec
	)
)

(defun get-schema-ep-var-char (schema v)
(block outer
	; Check if it characterizes the header formula, first.
	(if (equal (third (schema-header schema)) v)
		; then
		(return-from outer (car (schema-header schema)))
	)

	(loop for sec in (fluent-sections schema)
		do (loop for form in (section-formulas sec)
			if (equal (car form) v) do (return-from outer (second form))
		)
	)
)
)

(defun schema-ep-var? (schema v)
	(not (null (get-schema-ep-var-char schema v)))
)

(defun fluent-sections (schema)
	(loop for sec in (schema-sections schema)
		if (equal (section-type sec) 'FLUENT)
			collect sec
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

(defun set-header (schema new-header)
	(append (list
		'epi-schema
		(list new-header '** (third (second schema))))
		(cddr schema)
	)
)

; set-section returns a new schema, identical to the input schema,
; except with the section "sec-name" having the new value "new-sec".
(defun set-section (schema sec-name new-sec)
(let (new-schema found)
(block outer
	(setf new-schema (list 'epi-schema (second schema)))
	(loop for sec in (schema-sections schema) do (block inner
		(if (equal (section-name sec) sec-name)
			; then
			(progn
			(setf found t)
			(setf new-schema (append new-schema (list new-sec)))
			)
			; else
			(setf new-schema (append new-schema (list sec)))
		)
	))

	; Add the section if it doesn't exist.
	(if (not found)
		; then
		(setf new-schema (append new-schema (list new-sec)))
	)

	(return-from outer new-schema)
)
)
)

(defun add-constraint (schema sec-name constraint)
	(add-constraint-with-const schema sec-name constraint nil)
)

(defun add-constraint-with-const (schema sec-name constraint new-const-id)
(block outer
	(if (null (member sec-name *SEC-NAMES* :test #'equal))
		; then
		(progn
		(error "Cannot add constraint: invalid section name ~s~%" sec-name)
		(return-from outer nil)
		)
	)

	(setf const-num (- (length (get-section schema sec-name)) 1))
	(if (equal const-num -1)
		(setf const-num 0)
	)

	(if (null new-const-id)
		(setf new-const-id (intern (format nil "~a~d" (sec-formula-prefix sec-name) (+ const-num 1))))
	)

	(setf new-const (list new-const-id constraint))

	(setf new-sec (append (get-section schema sec-name) (list new-const)))
	(if (equal 1 (length new-sec))
		; we're creating it, so add the name
		(setf new-sec (append (list sec-name) new-sec))
	)
	(return-from outer (set-section schema sec-name new-sec))
)
)

; add-role-constraint adds a nonfluent condition to the schema with a unique
; metavariable.
(defun add-role-constraint (schema constraint)
;(let (new-roles role-num new-role)
;(block outer
;	(setf role-num (- (length (get-section schema ':Roles)) 1))
;	(setf new-role (list (intern (format nil "!R~d" (+ role-num 1))) constraint))
;	(setf new-roles (append (get-section schema ':Roles) (list new-role)))
;	(return-from outer (set-section schema ':Roles new-roles))
;)
;)
	(add-constraint schema ':Roles constraint)
)

; apply-bindings returns a schema where all variables have been replaced with
; their bound referents, given by the bindings map.
(defun apply-bindings (schema bindings)
(let (val)
(block outer
	(setf cursor schema)

	; We make some "intermediate" bindings to avoid situations like
	; A -> B
	; B -> C
	; forcing all As to be Cs if done in order.
	(setf alias-bindings (make-hash-table :test #'equal))
	(loop for k being the hash-keys of bindings
		if (symbolp (gethash k bindings))
		do (block alias
			(setf old-val (gethash k bindings))
			(setf new-val (intern (concat-strs (string old-val) "_BINDTMP")))
			(setf (gethash old-val alias-bindings) new-val)
		)
	)

	(loop for key being the hash-keys of bindings do (block inner
		(setf val (gethash key bindings))
		(setf alias val)
		(if (not (null (gethash val alias-bindings)))
			(setf alias (gethash val alias-bindings))
		)
		(setf cursor (replace-vals key alias cursor))
	))
	; convert back
	(loop for old-val being the hash-keys of alias-bindings do (block inner
		(setf alias-val (gethash old-val alias-bindings))
		(setf cursor (replace-vals alias-val old-val cursor))
	))
	(return-from outer cursor)
)))

; print-schema prints a schema with proper formatting, for readability purposes.
(defun print-schema (schema)
(block outer
	(check #'schema? schema)

	(format t "(~s ~s~%" (car schema) (second schema))
	(loop for sec in (sort-sections (schema-sections schema))
		do (format t "	(~s~%" (section-name sec))
		do (loop for elem in (cdr sec)
			do (format t "		~s~%" elem))
		do (format t "	)~%")
	)
	(format t ")~%")
)
)

(defun paper-print-schema (schema)
	(check #'schema? schema)

	(format t "(~s ~s~%" (car schema) (second schema))
	(loop for sec in (sort-sections (schema-sections schema))
		do (format t "  ~s~%" (section-name sec))
		do (loop for elem in (cdr sec)
			do (format t "    ~s ~s~%" (car elem) (second elem)))
		do (format t "  ~%")
	)
	(format t ")~%")
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
			;(gen-kb (list (make-hash-table :test #'equal)
			;			  (make-hash-table :test #'equal)
			;			  (make-hash-table :test #'equal)))
			(gen-kb (story-to-kb story))

			(constraints (make-hash-table :test #'equal))
	)
(block outer
	; Index the story into the knowledge base
	;(loop for wff in story
	;	do (add-to-kb wff gen-kb))

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

(defun filter-invalid-wffs (wffs)
	(loop for wff in wffs
		if (canon-prop? wff)
			collect wff
	)
)

; story-select-term-constraints takes a story and a list of individual
; constants and returns a list of all atemporal constraints on any
; of those constants.
(defun story-select-term-constraints (story terms)
(let ((constraints (story-term-constraints story)))
(block outer
	(setf ret-constrs (remove-duplicates (loop for term being the hash-keys of constraints
		if (member term terms :test #'equal)
		append (gethash term constraints)) :test #'equal))

	; Transitively pull in constraints on all the new small individuals mentioned
	; in the constraints we just pulled in.

	(if (not (null ret-constrs)) (block pull-in-outer
	(setf old-small-inds terms)
	(setf new-small-inds (set-difference (extract-small-individuals ret-constrs) old-small-inds :test #'equal))

	(loop while (not (null new-small-inds)) do (block pull-in
		(setf new-ret-constrs (remove-duplicates (loop for term being the hash-keys of constraints
			if (member term new-small-inds :test #'equal)
			append (gethash term constraints)) :test #'equal))
		(if (null new-ret-constrs)
			(return-from pull-in-outer)
		)
		(setf ret-constrs (remove-duplicates (append ret-constrs new-ret-constrs) :test #'equal))
		(setf old-small-inds (remove-duplicates (append old-small-inds new-small-inds) :test #'equal))
		(setf new-small-inds (set-difference (extract-small-individuals new-ret-constrs) old-small-inds :test #'equal))
	))
	))

	(return-from outer ret-constrs)
)
)
)

(defun schema-header (schema)
	(second schema)
)

(defun schema-pred (schema)
	(prop-pred (car (schema-header schema)))
)

; extract-small-individuals returns a list of the individual constants
; in an EL formula.
(defun extract-small-individuals (phi)
(block outer
	; (format t "extracting from ~s~%" phi)
	(return-from outer (get-elements-pred phi #'canon-small-individual?))
)
)

(defun var-to-sk-fn (var)
(block outer
	(if (not (varp var))
		; then
		(return-from outer nil)
	)

	(return-from outer (intern (concat-strs (remove-prefix (format nil "~s" var) "?") "<-")))
)
)

(defun extract-section-vars (schema sec-name)
(block outer
	(setf all-inds (list))
	(loop for phi in (mapcar #'second (section-formulas (get-section schema sec-name)))
		do (setf all-inds (remove-duplicates (append all-inds (get-elements-pred phi #'varp)) :test #'equal))
	)
	(return-from outer all-inds)
)
)

(defun extract-schema-small-individuals (schema)
(block outer
	(setf all-inds (list))
	; (loop for sec in (nonmeta-sections schema)
	(loop for sec in (schema-sections schema)
		do (loop for phi in (mapcar #'second (section-formulas sec))
			do (setf all-inds (remove-duplicates (append all-inds (extract-small-individuals phi)) :test #'equal))
		)
	)
	(return-from outer all-inds)
)
)

(defun schema-term-constraints (schema term)
	(loop for sec in (nonfluent-sections schema)
		append (loop for phi in (section-formulas sec)
			; do (format t "second phi: ~s~%" (second phi))
			; do (format t "~s contains ~s: ~s~%" (second phi) term (has-element (second phi) term))
			if (has-element (second phi) term)
				collect phi
		)
	)
)

(defun new-schema-match-name (pred)
(block outer
	(setf spl (split-str (format nil "~s" pred) "."))

	(if (and (symbolp pred)
			(> (length spl) 2)
			(is-num-str? (nth (- (length spl) 2) spl)))
		(progn
		(setf *SCHEMA-MATCH-NUM* (+ 1 *SCHEMA-MATCH-NUM*))
		(return-from outer (intern (join-str-list "."
			(append
				(subseq spl 0 (- (length spl) 2))
				; (list (+ 1 (parse-integer (nth (- (length spl) 2)))))
				(list (format nil "~s" *SCHEMA-MATCH-NUM*))
				(last spl)
			)
			)
		)))
	)

	(if (and (symbolp pred) (equal 2 (length spl)))
		(progn
		(setf *SCHEMA-MATCH-NUM* (+ 1 *SCHEMA-MATCH-NUM*))
		(return-from outer
			(intern (join-str-list "."
				(append
					(list (car spl))
					(list (format nil "~s" *SCHEMA-MATCH-NUM*))
					(last spl)
				)
			)
		))
		)
	)
)
)

(defun constr-name (pred)
(block outer
	(if (symbolp pred)
		(return-from outer (intern (car (split-str (format nil "~s" pred) "."))))
	)

	(if (and
			(listp pred)
			(equal 2 (length pred))
			(equal 'PLUR (car pred))
			(symbolp (second pred))
		)
		; then
		(return-from outer (intern (concat-strs (car (split-str (format nil "~s" (second pred)) ".")) "S")))
	)

	(return-from outer nil)
)
)

(defun cached-generalize-schema-constants (schema)
	(ll-cache
		'uncached-generalize-schema-constants
		(list schema)
		128
	)
)

(defun fully-clean-schema (schema)
	(clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants schema))))
)

(defun generalize-schema-constants (schema)
	(second (mapped-generalize-schema-constants schema))
)

(defun mapped-generalize-schema-constants (in-schema)
(block outer
	(setf gen-cursor "?X_A")
	(setf gen-schema in-schema)

	; NOTE: when we create the generalization, we need to map the constants to the new variable names to create an updated binding list for the new schema. That way, subordinate constraints not in the header can be properly specified with the new variable names. Not an issue for monkey example #1.
	(setf gen-map (make-hash-table :test #'equal))

	; don't take any variables scoped by lambdas; we'll replace
	; them with dummy list values to make sure they're not taken
	(setf schema (copy-list in-schema))
	(setf s-lambdas (get-elements-pred in-schema #'canon-lambda?))
	(loop for l in s-lambdas
		do (block replace-lambda
			(setf new-l (copy-list l))
			(setf l-vars (listify-nonlists (second l)))
			(loop for lv in l-vars
				do (setf new-l (replace-vals lv nil l))
			)
			(setf schema (replace-vals l new-l schema))
		)
	)

	(loop for si in (extract-schema-small-individuals schema) do (block gen-block
		; (format t "small ind ~s~%" si)
		(loop for constr in (schema-term-constraints schema si)
			do (block cc
				(if (and
						(listp (second constr))
						(equal 2 (length (second constr)))
						(equal si (car (second constr)))
						(not (null (constr-name (second (second constr)))))
					)
					; then
					(progn
					; (format t "	constr ~s~%" (constr-name (second (second constr))))
					; (format t "~s~%" (second constr))
					)
				)
			)
		)

		(loop while (has-element gen-schema (intern gen-cursor))
			do (setf gen-cursor (next-str gen-cursor))
		)

		(setf gen-schema (replace-vals si (intern gen-cursor) gen-schema))
		; (setf (gethash si gen-map) (intern gen-cursor))
		(setf (gethash (intern gen-cursor) gen-map) si)
		(setf gen-cursor (next-str gen-cursor))
	))

	(return-from outer (list gen-map gen-schema))
)
)

(defun get-necessity (constr-id schema)
(block outer
	(if (not (null (get-section schema ':Necessities)))
		; then
		(loop for pair in (section-formulas (get-section schema ':Necessities))
			do (if (equal (car (second pair)) (var-to-exc constr-id))
				; then
				(return-from outer (third (second pair)))
			)
		)
	)

	(return-from outer *DEFAULT-NECESSITY*)
)
)

(defun get-certainty (constr-id schema)
(block outer
	(if (not (null (get-section schema ':Certainties)))
		; then
		(loop for c in (section-formulas (get-section schema ':Certainties))
			do (if (equal (car (second c)) (var-to-exc constr-id))
				; then
				(return-from outer (third (second c)))
			)
		)
	)

	(return-from outer *DEFAULT-CERTAINTY*)
)
)

(defun set-certainty (constr-id num denom schema)
(block outer
	(setf new-schema (copy-list schema))
	(setf replaced nil)
	(if (not (null (get-section new-schema ':Certainties)))
		(loop for c in (section-formulas (get-section new-schema ':Certainties))
			do (if (equal (car (second c)) (var-to-exc constr-id))
				; then
				(block replace-cert
					(setf new-cert (replace-vals (third (second c)) (list '/ num denom) c))
					(setf new-schema (replace-vals c new-cert new-schema))
					(setf replaced t)
				)
			)
		)
	)

	(if (null replaced)
		; then
		(setf new-schema (add-constraint new-schema ':Certainties (list (var-to-exc constr-id) 'CERTAIN-TO-DEGREE (list '/ num denom))))
	)

	(return-from outer new-schema)
)
)

(defun schema-vars (schema)
	(remove-duplicates (get-elements-pred schema #'varp) :test #'equal)
)

(defun shared-vars (schema1 schema2)
	(intersection (schema-vars schema1) (schema-vars schema2) :test #'equal)
)

; NOTE: this works on lists of schemas, too
(defun uniquify-shared-vars (schema1 schema2)
	(uniquify-shared-vars-except schema1 schema2 nil)
)

(defun uniquify-shared-vars-except (schema1 schema2 except)
(block outer
	(setf shared (shared-vars schema1 schema2))
	(setf shared (set-difference shared except :test #'equal))
	(setf sc1 (copy-list schema1))
	(setf sc2 (copy-list schema2))
	(loop for var in shared
		do (block rename
			(setf var1 (intern (concat-strs (string var) "_1")))
			(setf var2 (intern (concat-strs (string var) "_2")))
			(setf sc1 (replace-vals var var1 sc1))
			(setf sc2 (replace-vals var var2 sc2))
		)
	)

	(return-from outer (list sc1 sc2))
)
)

(defun uniquify-shared-vars-chain (schemas except-in)
(block outer
	(if (equal 1 (length schemas))
		(return-from outer schemas)
	)

	; get shared vars for all schemas
	(setf processed (list (car schemas) (second schemas)))
	(setf shared (shared-vars (car schemas) (second schemas)))
	(loop for schema in (cddr schemas) do (block lss
		(setf shared (shared-vars processed schemas))
		(setf processed (append processed (list schema)))
	))

	(setf in-exception-vars (shared-vars processed except-in))
	(setf shared (set-difference shared in-exception-vars))

	; give each schema a unique suffix for its shared vars
	(setf new-schemas (list))
	(loop for schema in schemas for i from 1
		do (block ns-loop
			(setf new-schema schema)

		   (loop for sv in shared do (block rename-block
			(setf new-var (intern (format nil "~s_~d" sv i)))
			(setf new-schema (replace-vals sv new-var new-schema))
			))

			(setf new-schemas (append new-schemas (list new-schema)))
		)
	)

	(return-from outer new-schemas)
)
)

; To merge two schemas, we'll:
;	1. rename their variables to be unique
;	2. concatenate all the formulas in each section
;	3. 
(defun merge-schemas (schema1 schema2)
(block outer
	; 1. rename their variables to be unique
	(setf sc1 nil)
	(setf sc2 nil)
	(let ((uniq-pair (uniquify-shared-vars schema1 schema2)))
		(progn
			(setf sc1 (car uniq-pair))
			(setf sc2 (second uniq-pair))
		)
	)

	;(print-schema sc1)
	;(format t "~%~%")
	;(print-schema sc2)
	;(format t "~%~%")

	; 2. concatenate all the formulas in each section

	; 2(a). nonfluent sections
	(setf new-sections (make-hash-table :test #'equal))
	(loop for sc in (list sc1 sc2)
		do (loop for sec in (nonfluent-sections sc)
			do (loop for formula in (section-formulas sec)
				do (setf (gethash (section-name sec) new-sections) (append (gethash (section-name sec) new-sections) (list formula)))
			)
		)
	)
	(setf new-sections-fixed (make-hash-table :test #'equal))
	(loop for k being the hash-keys of new-sections
		do (block make-new-sec
			(setf phi_count 1)
			(setf prefix (sec-formula-prefix k))
			(loop for phi in (gethash k new-sections)
				do (block add-new-form
					(setf new-cond-id (intern (format nil "~a~s" prefix phi_count)))
					(setf (gethash k new-sections-fixed) (append (gethash k new-sections-fixed) (list (list new-cond-id (second phi)))))
					(setf phi_count (+ phi_count 1))
				)
			)

			; (format t "~s: ~s~%" k (gethash k new-sections-fixed))
		)
	)

	; 2(b). fluent sections
	; no need to "fix" these; their variable IDs have already been made unique
	(loop for sc in (list sc1 sc2)
		do (loop for sec in (fluent-sections sc)
			do (loop for formula in (section-formulas sec)
				do (setf (gethash (section-name sec) new-sections-fixed) (append (gethash (section-name sec) new-sections-fixed) (list formula)))
			)

			; do (format t "~s: ~s~%" (section-name sec) (gethash (section-name sec) new-sections-fixed))
		)

	)

	; We'll use the first schema as the "outer" schema and take its header.
	(setf final-schema sc1)
	(loop for sec-name being the hash-keys of new-sections-fixed
		do (setf final-schema (set-section final-schema sec-name (append (list sec-name) (gethash sec-name new-sections-fixed))))
	)

	(return-from outer final-schema)
)
)

(defun linearize-story (story)
	(loop for sent in story
		append sent)
)

; check-temporal-constraints takes a schema match and verifies
; the consistency of each of its temporal constraints with the
; temporal information extracted from the story.
; NOTE: before calling check-temporal-constraints, make sure
; you've called load-time-model with the story's temporal
; model! See norm-time.lisp for more information on loading the
; time model into the Allen Interval Algebra solver.
(defun check-temporal-constraints (schema-match)
(block outer
	(setf trues 0)
	(setf falses 0)

	(loop for ep-rel in (section-formulas (get-section schema-match ':Episode-relations))
		do (block ep-rel-loop
			(setf allen-rel (convert-time-prop (second ep-rel)))
	
			(if (null allen-rel)
				(return-from ep-rel-loop)
			)
	
			; DEFINED-INTERVALS is a global variable defined by
			; the Allen Interval Algebra solver.
			(if (or (not (member (car allen-rel) DEFINED-INTERVALS :test #'equal))
					(not (member (third allen-rel) DEFINED-INTERVALS :test #'equal)))
				; then
				(return-from ep-rel-loop)
			)
	
			(if (eval-time-prop (second ep-rel))
				; then
				(setf trues (+ trues 1))
				; else
				(setf falses (+ falses 1))
			)
		)
	)

	(return-from outer (list trues falses))
)
)

(defun get-single-word-preds (schema)
	(remove-duplicates (get-elements-pred schema (lambda (x)
		(and
			(symbolp x)
			(not (lex-p? x))
			(not (null (search "." (format nil "~s" x))))
			(canon-pred? x)
		)
	)) :test #'equal)
)

(defun get-word-preds (schema)
(block outer
	(setf word-preds (get-single-word-preds schema))
	(loop for prop in (mapcar #'second (section-formulas (get-section schema ':Steps)))
		do (block check
			(if (and (boundp (prop-pred prop))
					(not (equal (prop-pred prop) (schema-pred schema)))
					(schema? (eval (prop-pred prop))))
				; then
				(progn
				; (format t "adding embedded word preds for ~s~%" (prop-pred prop))
				(setf word-preds (union word-preds (get-word-preds (eval (prop-pred prop))) :test #'equal))
				)
			)
		)
	)

	(return-from outer word-preds)
)
)

(defun mk-schema-word-pred-idx (schemas)
(let ((ht (make-hash-table :test #'equal)))
(block outer
	(loop for schema in schemas
		do (loop for word in (get-word-preds schema)
			do (if (null (member schema (gethash word ht) :test #'equal))
				; then
				(push schema (gethash word ht))
			)
		)
	)

	(return-from outer ht)
)
)
)

(defun top-k-schemas (words schemas k)
(let (
(schema-scores (list))
)
(block outer
	(loop for schema in schemas
		do (block check-schema
			(setf schema-score 0)
			(setf schema-words (get-word-preds schema))
			(loop for word in words
				do (loop for schema-word in schema-words
					do (if (or
						(subsumes schema-word word)
						(subsumes word schema-word)
						(not (null (common-ancestor schema-word word)))
						)
						; then
						(setf schema-score (+ schema-score (expt (max (subsumption-score schema-word word) (subsumption-score word schema-word)) 2)))
						; else
						; (dbg 'match "~s didn't subsume ~s~%" schema-word word)
					)
				)
			)

			(if (> schema-score 0)
				(setf schema-scores (append schema-scores (list (list schema schema-score))))
			)
		)
	)

	(setf schema-scores (sort schema-scores (lambda (x y) (> (second x) (second y)))))
	(return-from outer (mapcar #'car (subseq-safe schema-scores 0 k)))
)
)
)

(defun get-formula-by-id (schema id)
(block outer
	(loop for sec in (schema-sections schema)
		do (loop for formula in (section-formulas sec)
			if (or (equal (car formula) (exc-to-var id)) (equal (car formula) (var-to-exc id)))
				do (return-from outer (second formula))
		)
	)

	(return-from outer nil)
)
)

; NOTE: some formulas have duplicates and different IDs.
; This will only return the first one. You shouldn't use
; it for non-deduped schemas.
(defun get-id-by-formula (schema formula)
(block outer
	(loop for sec in (schema-sections schema)
		do (loop for pair in (section-formulas sec)
			if (equal formula (second pair))
				do (return-from outer (car pair))
		)
	)

	(return-from outer nil)
)
)

(defun dedupe-sections (schema)
(block outer
	(setf deduped-schema (copy-list schema))

	; For nonfluent sections, dedupe with the formulas alone
	(loop for sec in (nonfluent-sections schema) do (block sec-loop
		(setf new-sec (list (section-name sec)))

		; map formulas to constr IDs so we can replace them in the cert/necess sections
		(setf deduped-name-map (make-hash-table :test #'equal))
		(loop for pair in (section-formulas sec) do (setf (gethash (second pair) deduped-name-map) (car pair)))

		(setf deduped-constrs (remove-duplicates (mapcar #'second (section-formulas sec)) :test #'equal))

		; Blank out the section in the schema and
		; add the constraints back in one by one
		(setf deduped-schema (set-section deduped-schema (section-name sec) (list (section-name sec))))
		(loop for constr in deduped-constrs
			do (setf deduped-schema (add-constraint deduped-schema (section-name sec) constr))
		)

		; Fix certainty constraint IDs
		(if (not (null (get-section deduped-schema ':Certainties)))
			(progn
			(setf deduped-schema (set-section deduped-schema ':Certainties (list ':Certainties)))
			(loop for cert in (section-formulas (get-section schema ':Certainties))
				do (block replace-cert-ids
					; get the constraint ID out of the certainty formula
					(setf constr-id (car (second cert)))
					; look up the formula for the original constraint id
					(setf orig-formula (get-formula-by-id schema constr-id))
					; find that formula's new constraint name
					(setf new-id (get-id-by-formula deduped-schema orig-formula))
					; add the updated certainty formula
					(setf new-cert-form (replace-vals constr-id new-id (second cert)))
					(setf deduped-schema (add-constraint deduped-schema ':Certainties new-cert-form))
				)
			)
			)
		)
	))

	; For fluent sections, not all episodes are fully characterized
	; here (necessarily), so we'll just dedupe episode/characterizer
	; pairs in their entireties.
	(loop for sec in (fluent-sections schema) do (block sec-loop-2
		(setf new-sec (append (list (section-name sec)) (remove-duplicates (section-formulas sec) :test #'equal)))
		(setf deduped-schema (set-section deduped-schema (section-name sec) new-sec))
	))

	(return-from outer deduped-schema)
)
)

(defun topsort-steps-helper (time-graph ep-lst)
(block outer
	; base case
	(if (equal 0 (hash-table-count time-graph))
		; then
		(return-from outer ep-lst)
	)

	(loop for ep being the hash-keys of time-graph do (block inner
		; Look for episodes with no "before" entries
		(if (null (gethash ep time-graph))
			; then
			(block found-beg
				; Pull such episodes out of the time graph & move on
				(setf new-ep-lst (append ep-lst (list ep)))
				(setf new-time-graph (ht-copy time-graph))
				(remhash ep new-time-graph)
				(loop for k being the hash-keys of new-time-graph
					do (setf (gethash k new-time-graph) (remove ep (gethash k new-time-graph) :test #'equal))
				)
				(return-from outer (topsort-steps-helper new-time-graph new-ep-lst))
			)
		)
	))

	; If we haven't found a beginning episode & recursed by now, there's a cycle
	(return-from outer nil)
)
)

(defun topsort-steps (schemas)
(block outer
	(setf ep-ids
		(loop for schema in schemas
			append (mapcar #'car (section-formulas (get-section schema ':Steps)))
		)
	)

	; (handler-case
	(return-from outer (topsort-eps schemas ep-ids))
	; (error () (format t "error schemas: ~s~%" schemas)))
)
)

(defun topsort-fluents (schemas)
(block outer
	(setf ep-ids
		(loop for schema in schemas
			append (loop for sec in (fluent-sections schema)
			 append (mapcar #'car (section-formulas sec))
			)
		)
	)

	(setf ep-ids (append ep-ids
		(loop for schema in schemas
			collect (third (second schema))
		)
	))

	; (handler-case
	(return-from outer (topsort-eps schemas ep-ids))
	; (error () (format t "error schemas: ~s~%" schemas)))
)
)

(defun topsort-eps (schemas unfiltered-ep-ids)
(block outer
	(setf all-ep-rels
		(loop for schema in schemas
			append (mapcar #'second (section-formulas (get-section schema ':Episode-relations)))
		)
	)

	(return-from outer (topsort-ep-list all-ep-rels unfiltered-ep-ids))
)
)

(defun topsort-ep-list (all-ep-rels unfiltered-ep-ids)
(block outer
	; (format t "ep IDs: ~s~%" ep-ids)
	(load-time-model all-ep-rels)

	(setf ep-ids (loop for ep-id in unfiltered-ep-ids
		if (has-element all-ep-rels ep-id)
			collect ep-id
	))

	(setf time-graph (make-hash-table :test #'equal))
	(loop for ep-id in ep-ids do (setf (gethash ep-id time-graph) (list)))
	(loop for ep1 in ep-ids
		do (loop for ep2 in ep-ids do (block ep-ep-loop
			(setf arel (listify-nonlists (second (allen-fhow ep2 ep1))))
			(if (and (not (null (intersection '(P M O) arel :test #'equal)))
				 (null (intersection '(PI MI OI =) arel :test #'equal)))
				; then
				(setf (gethash ep1 time-graph) (remove-duplicates (append (gethash ep1 time-graph) (list ep2)) :test #'equal))
			)
		))
	)

	; (handler-case
	(return-from outer (topsort-steps-helper time-graph (list)))
	; (error () (format t "error schemas: ~s~%" schemas)))
)
)

(defun sort-steps (schema)
(block outer
	(setf steps (section-formulas (get-section schema ':Steps)))
	(setf sorted-step-ids (topsort-steps (list schema)))
	(setf sorted-steps (sort (copy-seq steps) (lambda (x y) (< (position x sorted-step-ids) (position y sorted-step-ids))) :key #'car))
	(setf new-steps-sec (append (list ':Steps) sorted-steps))
	(return-from outer (set-section schema ':Steps new-steps-sec))
)
)

(defun rename-constraints-helper (schema tmp-pass)
(block outer
	(setf new-schema schema)

	(loop for sec in (schema-sections schema) do (block sec-block
		(setf new-sec (list (section-name sec)))
		(setf cursor 1)
		(setf prefix (sec-formula-prefix (section-name sec)))
		(if tmp-pass (setf prefix (concat-strs prefix "--")))

		(loop for constr in (section-formulas sec) do (block constr-block
			(setf old-const-id (car constr))
			(setf new-const-id (intern (format nil "~a~d" prefix cursor)))
			(setf cursor (+ cursor 1))

			; (setf (gethash old-const-id const-map) new-const-id)
			; (format t "replacing ~s with ~s~%" old-const-id new-const-id)
			(setf new-schema (replace-vals old-const-id new-const-id new-schema))
		))

		; (setf new-schema (set-section new-schema (section-name sec) new-sec))
	))

	(return-from outer new-schema)
)
)

(defun rename-constraints (schema)
	; We're going to do two passes. The first will rename
	; constraint variables to have two dashes in them, which
	; we assume won't happen anywhere else. This is because the
	; old names and the new names may have some overlap, e.g. ?E3
	; might already exist for what is called ?E5 in the rename, but
	; the rename will have a different ?E3. With two passes, we can
	; avoid that aliasing issue (just like using a temp variable for
	; swaps).
	(rename-constraints-helper (rename-constraints-helper schema t) nil)
)

(defun do-ka-pred? (p)
(and
	(canon-pred? p)
	(equal (pred-base p) 'do.v)
	(equal (length (pred-args p)) 1)
	(canon-kind? (car (pred-args p)))
	(equal 'KA (car (car (pred-args p))))
)
)

(defun do-ka-prop? (p)
(and
	(canon-prop? p)
	(equal (prop-pred p) 'DO.V)
	(equal (length (prop-post-args p)) 1)
	(canon-kind? (car (prop-post-args p)))
	(equal 'KA (car (car (prop-post-args p))))
)
)

(defun ttt-clean-do-kas (schema)
	(ttt-replace schema
		'(DO.V (KA _!))
		'_!
	)
)

(defun clean-do-kas (schema)
(let (cleaned-schema do-ka-idcs do-ka action)
(block outer
	(setf cleaned-schema schema)
	(setf do-ka-idcs (get-elements-pred-idx cleaned-schema #'do-ka-prop?))
	(loop while (not (null do-ka-idcs))
		do (block replace-do-ka
			;(setf do-ka (get-element-idx cleaned-schema (car do-ka-idcs)))
			;(setf action (second (second do-ka)))
			;(setf cleaned-schema (replace-element-idx cleaned-schema (car do-ka-idcs) action))
			;(setf do-ka-idcs (get-elements-pred-idx cleaned-schema #'do-ka-pred?))
			(setf do-ka-prop (get-element-idx cleaned-schema (car do-ka-idcs)))
			(setf breakdown (prop-args-pred-mods do-ka-prop))

			(setf new-pred (second (car (third breakdown))))
			(setf new-pred-base (pred-base new-pred))
			(setf new-pred-args (pred-args new-pred))
			(setf new-pred-mods (pred-mods new-pred))

			(setf new-prop (render-prop
								(car breakdown) ; Old pre-args
								new-pred-base   ; From KA
								new-pred-args   ; Curried post-args from KA
								(append (fourth breakdown) new-pred-mods) ; Mods from KA
			))

			(setf cleaned-schema (replace-element-idx cleaned-schema (car do-ka-idcs) new-prop))
			(setf do-ka-idcs (get-elements-pred-idx cleaned-schema #'do-ka-prop?))

			(return-from replace-do-ka)
		)
	)

	; Now feed it through a TTT rule to grab stragglers, e.g. embedded do-KAs within KAs.
	(setf cleaned-schema (ttt-clean-do-kas cleaned-schema))

	(return-from outer cleaned-schema)
)))

(defun load-story-time-model (story)
(block outer
	(setf story-time-props
		(loop for phi in (linearize-story story)
			if (time-prop? phi) collect phi))

	; TODO: make these implicit somehow in AIA solver?

	(load-time-model story-time-props)
)
)

(defun old-invokes-schema? (phi)
; TODO: extend to non-atomic props?
(let ((pred (if (canon-atomic-prop? phi) (prop-pred phi) nil)))
	(and
		(not (null pred))
		(not (member 'can.md (prop-mods phi) :test #'equal))
		(boundp pred)
		(schema? (eval pred))
		; TODO: subsumption, not just boundp. Need index of known schemas
	)
)
)

(defun invokes-schema? (phi)
	(not (null (invoked-schema phi)))
)

(defun invoked-schema (phi)
(let (
	(best-score 0)
	(pred (if (canon-atomic-prop? phi) (prop-pred phi) nil))
	)
(block outer
	(if (or
			(null pred)
			(member 'can.md (prop-mods phi) :test #'equal)
		)
		; then
		(return-from outer nil)
	)

	; If it invokes a schema directly, return that one.
	(if (and (boundp pred) (schema? (eval pred)))
		(return-from outer (eval pred))
	)

	; Otherwise, loop over known schemas and return the one
	; with the highest subsumption score.
	(setf best-invoked nil)
	(loop for sn being the hash-keys of *SCHEMAS-BY-PRED*
		do (block check-invoked
			(setf cand-score (subsumption-score sn pred))
			(if (> cand-score best-score)
				; then
				(progn
					(setf best-invoked (gethash sn *SCHEMAS-BY-PRED*))
					(setf best-score cand-score)
				)
			)
		)
	)

	(return-from outer best-invoked)
)
)
)

(defun get-char-form (ep-id schemas)
(block outer
(loop for schema in schemas do (block inner
	; first, check the header
	(if (equal (third (second schema)) ep-id)
		(return-from outer (car (second schema)))
	)

	; then check all fluent sections
	(loop for sec in (fluent-sections schema)
		do (loop for form in (section-formulas sec)
			if (equal ep-id (car form))
				do (return-from outer (second form))
		)
	)

))

; give up
(return-from outer nil)
)
)


(defun flatten-prop (in-prop)
(block outer
	(setf prop (copy-list in-prop))

	(setf doctored nil)

	(if (and
			(equal 2 (length prop))
			(or
				(not (equal (car prop) 'NOT))
				(and (equal (car prop) 'NOT)
					(equal 2 (length (second prop)))
					(not (has-element-pred (second prop) 'lex-verb?)))
			)
			(not (has-element-pred prop 'lex-verb?))
		)
		; then
		(progn
		(if (equal (car prop) 'NOT)
			; then
			(setf prop (list (car (second prop)) 'IS 'NOT (second (second prop))))
			; else
			(setf prop (list (car prop) 'IS (second prop)))
		)
		(setf doctored t)
		)
	)

	(if (and
			(has-element-pred prop 'lex-verb?)
			(equal (car prop) 'NOT))
		; then
		(progn
			(setf prop (second prop))
			(setf verb (car (get-elements-pred prop 'lex-verb?)))
			(setf prop (replace-vals verb (list 'NOT verb) prop))
			(setf doctored t)
		)
	)


	(if (null doctored)
		(progn
		(setf prop (prop-args-pred-mods prop))
		)
	)

	; Reformat all ka-preds to have mods last
	(loop for ka in (get-elements-pred (copy-list prop) 'kind-of-action?)
		; do (format t "replacing ~s with ~s~%" ka (cdr (prop-args-pred-mods (list 'LL-SENTINEL.NAME (second ka)))))
		do (setf prop (replace-vals ka (list 'ka (cdr (prop-args-pred-mods (list 'LL-SENTINEL.NAME (second ka))))) prop))
	)

	; (setf prop (prop-args-pred-mods prop))
	(setf prop (flatten prop))
	(setf prop (replace-vals 'KA 'TO prop))
	; (setf prop (remove-if 'lex-adv? prop))
	(setf prop (remove-if
		(lambda (x) (member x '(NN ADV-A ADV-E ADV-S ADV-F ADV nil) :test #'equal))
		prop))

	(return-from outer prop)
)
)

(defun clean-tags (flat)
	(loop for e in flat
		collect (intern (car (split-str (string e) ".")))
	)
)

(defun el-to-english (prop)
	(clean-tags (flatten-prop prop))
)

(defun expand-nested-schema (invoker parent-schema)
(block outer
	; (setf invoked-schema (eval (prop-pred (second invoker))))
	(setf invoked-schema (invoked-schema (second invoker)))

	(setf header-bindings (third (unify-with-schema (list (second invoker) '** (car invoker)) invoked-schema nil)))
	; NOTE: the following "WEIRD BUG" can happen because wordnet, especially without
	; sense numbers, gives weird invoke relations for words that fit different schemas
	; w/ different argument structures.
	; (if (null header-bindings)
		; (format t "WEIRD BUG: invoker ~s can't unify with header ~s~%" invoker (second parent-schema))
	; )
	(if (null header-bindings)
		(return-from outer nil)
	)
	; (setf identical-header-vars (shared-vars (list (second invoker) '** (car invoker)) (second invoked-schema)))
	; (loop for id in identical-header-vars
		; do (setf (gethash id header-bindings) id)
	; )

	(loop for sc in (section-formulas (get-section parent-schema ':Subordinate-constraints))
			if (equal (car invoker) (second (car (second sc))))
				do (block apply-subord
					(setf key (remove-ext (car (car (second sc))) "<-"))
					(setf val (third (second sc)))
					; (setf (gethash key header-bindings) val)
					(if (not (bind-if-unbound key val header-bindings))
						(progn
						; (format t "WEIRD EXPANSION BUG: subordinate constraint ~s can't bind over existing bound value ~s~%" sc (gethash key header-bindings))
						; (format t "invoker is ~s~%" invoker)
						; (print-schema parent-schema)
						; We're going to just cause an error here and make
						; the whole story fail, because I don't want to fix
						; this right now and it also makes the story take
						; forever for some reason.
						; TODO: fix it.
						(error "Weird subordinate constraint expansion bug (see TODO)")
						(return-from outer nil)
						)
					)
				)
	)

	; (setf invoked-schema-bound (apply-bindings invoked-schema header-bindings))

	(return-from outer (list invoked-schema header-bindings))
)
)

; TODO: safe multi-level expansion. How to prevent loops? Just stop at duplicates, maybe?
(defun expand-nested-schemas (parent-schema story)
(block outer
	(setf invoked-schemas (list))

	(loop for st in (section-formulas (get-section parent-schema ':Steps))
		do (block get-invokers
			(if (not (invokes-schema? (second st)))
				; then
				(progn
				; (format t "~s doesn't invoke~%" (second st))
				(return-from get-invokers)
				)
			)

			(setf invoked-pair (expand-nested-schema st parent-schema))
			(setf invoked-schema (apply-bindings (car invoked-pair) (second invoked-pair)))
			; (format t "invoked ~s~%" (prop-pred (second st)))
			; (print-schema invoked-schema)
			(setf except-parent-vars (loop for k being the hash-keys of (second invoked-pair) if (varp (gethash k (second invoked-pair))) collect (gethash k (second invoked-pair))))
			; (format t "rename shared vars except ~s~%" except-parent-vars)

			(setf invoked-schema (second (uniquify-shared-vars-except parent-schema invoked-schema except-parent-vars)))

			(setf invoked-schemas (append invoked-schemas (list (list (car st) invoked-schema))))

			(format t "; invoked ~s~%" invoked-schema)

			;(setf invoked-schema (eval (prop-pred (second st))))
			;(setf invoked-schema (second (uniquify-shared-vars parent-schema invoked-schema)))

			;(setf header-bindings (third (unify-with-schema (list (second st) '** (car st)) invoked-schema nil)))
			;(setf invoked-schema-bound (apply-bindings invoked-schema header-bindings))


			;(setf invoked-schemas (append invoked-schemas (list (list (car st) invoked-schema-bound))))
		)
	)

	(format t "; parent: ~s~%" parent-schema)

	; Give each invoked schema a unique variable name, except for any variables shared
	; with the parent schema; the initial pairwise uniquification above between each
	; subschema and the parent will have already ensured that any new shared variables
	; with the parent were the result of a unification, and thus truly cross the scope.
	(setf invoked-schemas (uniquify-shared-vars-chain invoked-schemas parent-schema))

	; (return-from outer invoked-schemas)

	 ; (format t "invoked subordinate schemas are:~%")
	 ; (loop for is in invoked-schemas
		; do (print-schema (second is))
	; )

	(setf all-schemas (append (list parent-schema) (mapcar #'second invoked-schemas)))

	(setf sorted-ep-ids (topsort-fluents all-schemas))

	(setf sorted-eps
		(loop for ep-id in sorted-ep-ids
			collect (get-char-form ep-id all-schemas)))



	(setf all-role-consts
		(remove-duplicates (loop for schema in all-schemas
			append (loop for form in (section-formulas (get-section schema ':Roles))
				collect (second form)
			)
		) :test #'equal)
	)

	;(setf all-role-vars (loop for rc in all-role-consts collect (car form)))
	;(setf all-role-consts (append all-role-consts
	;	(loop for wff in (linearize-story story)
	;		if (and
	;				(member (car wff) all-role-vars :test #'equal)
	;				(not (canon-charstar? wff))
	;				(equal 1 (length (prop-all-args wff)))
	;			)
	;			collect wff)))


	(setf all-role-consts
		(sort all-role-consts
			(lambda (a b)
				(< (rechash (car a)) (rechash (car b)))
			)
		))


	; (format t "sorted eps: ~s~%" sorted-eps)
	; (format t "all role consts: ~s~%" all-role-consts)

	(setf all-vars (get-elements-pred all-role-consts 'varp))
	(setf var-renames (make-hash-table :test #'equal))
	(loop for v in all-vars
		do (block rename
			(setf const-types (loop for const in all-role-consts if (and (symbolp (second const)) (equal (car const) v)) collect (second const)))
			; (format t "types for ~s: ~s~%" v const-types)
			(setf chosen-type (car const-types))
			(setf new-name (intern (car (split-str (string (new-skolem! (intern (car (split-str (string chosen-type) "."))))) "."))))
			; (setf new-name (intern (concat-strs (car (split-str (string chosen-type) ".")) ".SK")))
			; (format t "new name is ~s~%" new-name)
			(if (has-element sorted-eps v)
				; then
				(progn
					(setf (gethash v var-renames) new-name)
					; (setf sorted-eps (replace-vals v new-name sorted-eps))
					; (setf all-role-consts (replace-vals v new-name sorted-eps))
				)
			)
		)
	)
	(loop for v being the hash-keys of var-renames
		do (progn
			(setf new-name (gethash v var-renames))
			(setf sorted-eps (replace-vals v new-name sorted-eps))
			(setf all-role-consts (replace-vals v new-name all-role-consts))
		)
	)

	(format t "predicted entity types:~%")
	(loop for role-const in all-role-consts
		if (and
				(or
					(not (has-element-pred role-const 'varp))
					; (has-element sorted-eps (car role-const))
					(loop for p in (get-elements-pred role-const 'varp)
						always (has-element sorted-eps p))
				)
				; (not (member role-const (linearize-story story) :test #'equal))
			)
			do (format t "	~s~%" (el-to-english role-const))
	)

	(format t "I predict these steps in the story (in order):~%")
	(loop for ep in sorted-eps
			for ep-id in sorted-ep-ids
		do (format t "	~a ~a~%" (if (not (varp ep-id)) "(known from story) " "(schema prediction)") (el-to-english ep))
	)
)
)
