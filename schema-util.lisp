(load "ll-load.lisp")

(ll-load "old-ttt/src/load")
(ll-load "schema-el.lisp")
(ll-load "ll-cache.lisp")
(ll-load "ll-util.lisp")
(ll-load "schema-kb.lisp")
(ll-load "schema-subsumption.lisp")
(ll-load "schema-time.lisp")

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

(defparameter *META-SECS* '(
	:Subordinate-constraints
	:Necessities
	:Certainties
))

(defparameter *UNINTERESTING-PREDS* '(
	HAS-DET.PR
	ORIENTS
))

(defparameter *SCHEMAS-BY-PRED* (make-hash-table :test #'equal))
; (format t "resetting preds-by-schema~%")
(defparameter *PREDS-BY-SCHEMA* (make-hash-table :test #'equal))

; known-schema-pred takes a schema, ignores
; its predicate, looks it up in a database of
; known schemas, and returns the predicate it's
; known by in that database, or nil otherwise.
(ldefun known-schema-pred (schema)
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

(ldefun lambdify-preds! (ps)
	(lambdify-preds-maybe-colon ps nil)
)

(ldefun lambdify-preds-with-sym! (ps sym)
	(lambdify-preds-maybe-colon-with-sym ps nil sym)
)

(ldefun lambdify-preds-colon! (ps)
	(lambdify-preds-maybe-colon ps t)
)

(ldefun schemas-about-equal? (schema1 schema2)
(block outer
	(loop for sec in *SEC-NAMES* do (block compare-sec
		(if (contains *META-SECS* sec)
			(return-from compare-sec))

		(setf sec1 (get-section schema1 sec))
		(setf sec2 (get-section schema2 sec))

		(setf forms1 (section-formulas sec1))
		(setf forms2 (section-formulas sec2))
		
		(if (and (null forms1) (null forms2))
			(return-from compare-sec))
		(if (or (null forms1) (null forms2))
			(return-from outer nil))

		(if (not (equal 'FLUENT (section-type sec1)))
			(progn
				(setf forms1 (mapcar #'second forms1))
				(setf forms2 (mapcar #'second forms2))))

		(if (not (same-list-unordered forms1 forms2))
			(return-from outer nil))
	))

	(return-from outer t)
)
)

(ldefun lambdify-preds-maybe-colon-with-sym (ps colon sym)
(let ((tmp-sym sym))
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

(ldefun lambdify-preds-maybe-colon (ps colon)
	(lambdify-preds-maybe-colon-with-sym ps colon (gensym))
)

(ldefun register-schema (schema)
(block outer
	; (format t "~d schemas registered~%" (ht-count *PREDS-BY-SCHEMA*))
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
(ldefun create-from-match (match)
	(create-from-match-maybe-gen match t)
)

(ldefun create-from-match-maybe-gen (match should-gen)
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
(ldefun sec-formula-prefix (sec-name)
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
			(return-from outer "?H"))
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

(ldefun sec-name-from-prefix (prefix)
(block outer
	(loop for sec-name in *SEC-NAMES*
		if (equal (sec-formula-prefix sec-name) prefix)
			do (return-from outer sec-name)
	)

	(return-from outer nil)
)
)

(ldefun sec-name-from-id (id)
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
(ldefun schema-cond? (phi fluent)
	(ll-cache #'u-schema-cond? (list phi fluent)
		100 nil)
)

(ldefun u-schema-cond? (phi fluent)
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

	(if (canon-prop? (second phi))
		; then
		t
		; else
		(progn
			(format t "~s is an invalid formula~%" (second phi))
			nil
		)
	)
)
)

(ldefun exc-to-var (s)
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

(ldefun var-to-exc (s)
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

(ldefun fluent-cond? (phi)
	(schema-cond? phi t)
)

(ldefun nonfluent-cond? (phi)
	(schema-cond? phi nil)
)

; schema-section? reports whether sec is a valid schema
; section, properly named and populated with valid schema
; conditions (fluent or nonfluent).
(ldefun schema-section? (sec)
	(ll-cache #'u-schema-section? (list sec) 100 nil)
)

(ldefun u-schema-section? (sec)
(and
	(> (length sec) 0)
	(not (null (member (car sec) *SEC-NAMES*)))
	(or
		; These sections don't need to have valid formulas.
		(equal (car sec) ':Necessities)
		(equal (car sec) ':Certainties)

		(loop for phi in (cdr sec)
			always (or (nonfluent-cond? phi) (fluent-cond? phi)))
	)
))

(ldefun section-name (sec)
(progn
	(check #'schema-section? sec)
	(car sec)
)
)

; section-formulas returns all conditions from a schema section.
(ldefun section-formulas (sec)
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
(ldefun section-type (sec)
(block outer
	(check #'schema-section? sec)
	(setf sec-prefix (sec-formula-prefix (section-name sec)))
	(if (contains *META-SECS* (section-name sec))
		(return-from outer 'META))
	(if (has-prefix? sec-prefix "?")
		(return-from outer 'FLUENT))
	(if (has-prefix? sec-prefix "!")
		(return-from outer 'NONFLUENT))

	(return-from outer nil)
)
)

; schema? reports whether s is a valid schema.
(ldefun schema? (s)
(and
	(> (length s) 2)
	(equal (car s) 'epi-schema)
	(canon-charstar? (second s))
	(loop for sec in (cddr s)
		always (schema-section? sec)
	)
)
)

(ldefun schema-name (schema)
	(handler-case
		(prop-pred (car (second schema)))
	(error ()
		nil))
)

(ldefun schema-sections (schema)
(progn
	(check #'schema? schema)
	(cddr schema)
)
)

(ldefun sort-sections (secs)
	(sort (copy-list secs) (lambda (s1 s2)
		(> (length (member (car s1) *SEC-NAMES* :test #'equal)) (length (member (car s2) *SEC-NAMES* :test #'equal)))
	))
)

(ldefun nonmeta-sections (schema)
	(loop for sec in (schema-sections schema)
		if (and (or (equal (section-type sec) 'NONFLUENT)
			   (equal (section-type sec) 'FLUENT))
				(not (contains *META-SECS* (car sec))))
			; then
			collect sec
	)
)

(ldefun nonfluent-sections (schema)
	(loop for sec in (schema-sections schema)
		if (equal (section-type sec) 'NONFLUENT)
			collect sec
	)
)

(ldefun get-schema-ep-var-chars (schema v)
(block outer
	(setf char-forms (list))

	; Check if it characterizes the header formula, first.
	(if (equal (third (schema-header schema)) v)
		; then
		(setf char-forms
			(append char-forms
				(list (car (schema-header schema)))))
	)

	(loop for sec in (fluent-sections schema)
		do (loop for form in (section-formulas sec)
			if (equal (car form) v)
				do (setf char-forms
					(append char-forms
						(list (second form))))
		)
	)

	(return-from outer char-forms)
)
)

(ldefun schema-ep-var? (schema v)
	(not (null (get-schema-ep-var-chars schema v)))
)

(ldefun fluent-sections (schema)
	(loop for sec in (schema-sections schema)
		if (equal (section-type sec) 'FLUENT)
			collect sec
	)
)

(ldefun get-section (schema sec-name)
(block outer
	(loop for sec in (schema-sections schema)
		if (equal (section-name sec) sec-name)
			do (return-from outer sec)
	)

	(return-from outer nil)
)
)

(ldefun renumber-schema-name (name num)
(block outer
	(setf spl (split-str (string name) "."))
	(if (equal 3 (length spl))
		(setf spl (list (car spl) (third spl))))

	(return-from outer (intern
		(format nil "~a.~d.~a" 
			(car spl) num (second spl))))
)
)

(ldefun set-header (schema new-header)
	(append (list
		'epi-schema
		(list new-header '** (third (second schema))))
		(cddr schema)
	)
)

; set-section returns a new schema, identical to the input schema,
; except with the section "sec-name" having the new value "new-sec".
(ldefun set-section (schema sec-name new-sec)
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

(ldefun add-constraint (schema sec-name constraint)
	(add-constraint-with-const schema sec-name constraint nil)
)

(ldefun add-constraint-with-const (schema sec-name constraint new-const-id)
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
(ldefun add-role-constraint (schema constraint)
;(let (new-roles role-num new-role)
;(block outer
;	(setf role-num (- (length (get-section schema ':Roles)) 1))
;	(setf new-role (list (intern (format nil "!R~d" (+ role-num 1))) constraint))
;	(setf new-roles (append (get-section schema ':Roles) (list new-role)))
;	(return-from outer (set-section schema ':Roles new-roles))
;)
;)
	(block outer
		(if (and (equal 2 (length constraint)) (equal (second constraint) 'PLUR))
			; then
			(progn
				(format t "tried to add invalid RC~%")
				(setf x 0)
				(format t "~d~%" (/ 1 x))
			)
		)
		(add-constraint schema ':Roles constraint)
	)
)

; apply-bindings returns a schema where all variables have been replaced with
; their bound referents, given by the bindings map.
(ldefun apply-bindings (schema bindings)
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
))

; print-schema prints a schema with proper formatting, for readability purposes.
(ldefun print-schema (schema &optional show-invisibles)
(block outer
	(check #'schema? schema)

	(format t "(~s ~s~%" (car schema) (second schema))
	(loop for sec in (sort-sections (schema-sections schema))
		if (and
			(not (equal (section-name sec) ':Paraphrases))
			(> (length (section-formulas sec)) 0))
			; then
			do (block print-sec
				(format t "	(~s~%" (section-name sec))
				(loop for elem in (cdr sec)
					; if (or show-invisibles (not (invisible-prop? (second elem))))
						do (format t "		~s~%" elem))
				(format t "	)~%")
			)
	)
	(format t ")~%")
)
)

(ldefun paper-print-schema (schema)
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
(ldefun temporal-prop? (prop)
	; TODO: more nuanced temporal proposition identification
	(has-element prop '**)
)

(ldefun lambda-prop? (prop)
	; TODO: more nuanced lambda proposition identification
	(has-element prop 'LAMBDA.EL)
)

; story-term-constraints takes an EL story, split into N "sentences",
; and returns a hash map where the keys are individual constants and
; the values are lists of atemporal story constraints on those constants.
(ldefun story-term-constraints (story)
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

(ldefun filter-invalid-wffs (wffs)
	(loop for wff in wffs
		if (canon-prop? wff)
			collect wff
	)
)

(ldefun interesting-constr? (constraint)
(and
	(canon-prop? constraint)
	(not (time-prop? constraint))
	(not (contains *UNINTERESTING-PREDS*
		(prop-pred constraint)))
)
)

(ldefun story-select-interesting-term-constraints (story terms)
	(loop for sc in (story-select-term-constraints story terms)
		if (interesting-constr? sc)
			collect sc)
)

; story-select-term-constraints takes a story and a list of individual
; constants and returns a list of all atemporal constraints on any
; of those constants.
(ldefun story-select-term-constraints (story terms)
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

(ldefun schema-header (schema)
	(second schema)
)

(ldefun schema-pred (schema)
	(prop-pred (car (schema-header schema)))
)

; extract-small-individuals returns a list of the individual constants
; in an EL formula.
(ldefun extract-small-individuals (phi)
(block outer
	; (format t "extracting from ~s~%" phi)
	(return-from outer (get-elements-pred phi #'canon-small-individual?))
)
)

(ldefun var-to-sk-fn (var)
(block outer
	(if (not (varp var))
		; then
		(return-from outer nil)
	)

	(return-from outer (intern (concat-strs (remove-prefix (format nil "~s" var) "?") "<-")))
)
)

(ldefun extract-section-vars (schema sec-name)
(block outer
	(setf all-inds (list))
	(loop for phi in (mapcar #'second (section-formulas (get-section schema sec-name)))
		do (setf all-inds (remove-duplicates (append all-inds (get-elements-pred phi #'varp)) :test #'equal))
	)
	(return-from outer all-inds)
)
)

(ldefun extract-schema-small-individuals (schema)
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

(ldefun schema-term-constraints (schema term)
	(loop for sec in (nonfluent-sections schema)
		append (loop for phi in (section-formulas sec)
			; do (format t "second phi: ~s~%" (second phi))
			; do (format t "~s contains ~s: ~s~%" (second phi) term (has-element (second phi) term))
			if (has-element (second phi) term)
				collect phi
		)
	)
)

(ldefun schema-term-type-constraints (schema term &optional include-ownership)
	(loop for constr in (schema-term-constraints schema term)
		if (and
				(or
					(equal 1 (length (prop-all-args (second constr))))
					(and include-ownership
						(equal (prop-pred (second constr)) 'PERTAIN-TO))
				)

				(equal term (car (second constr))))
			collect constr)
)

(ldefun schema-terms-type-constraints (schema terms &optional include-ownership)
	(loop for term in terms
		append (schema-term-type-constraints schema term include-ownership))
)

(ldefun new-schema-match-name (pred)
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

(ldefun constr-name (pred)
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

(ldefun cached-generalize-schema-constants (schema)
	(ll-cache
		'uncached-generalize-schema-constants
		(list schema)
		128
	)
)

(ldefun linearize-unspecified-steps (schema)
(let (
	step-ids 
	ep-rels
	unspec-step-ids
	new-schema
	new-ep-rels
)
(block outer
	(setf step-ids (mapcar #'car (section-formulas (get-section schema ':Steps))))
	(setf ep-rels (mapcar #'second (section-formulas (get-section schema ':Episode-relations))))
	(setf unspec-step-ids
		(loop for step-id in step-ids
			if (not (has-element ep-rels step-id))
				collect step-id
		)
	)
	(setf deduped-unspec-step-ids (remove-duplicates unspec-step-ids :test #'equal :from-end t))
	(if (not (equal deduped-unspec-step-ids unspec-step-ids))
		; then
		(progn
			; (format t "step ID list ~s has duplicates; assuming the first occurrences specify the correct order~%" unspec-step-ids)
			(setf unspec-step-ids deduped-unspec-step-ids)
		)
	)

	(if (null unspec-step-ids)
		(return-from outer schema)
	)

	(setf new-schema (copy-item schema))

	(setf new-ep-rels
		(loop for i from 1 to (- (length unspec-step-ids) 1)
			collect (list
				(nth (- i 1) unspec-step-ids)
				'BEFORE
				(nth i unspec-step-ids)
			)
		)
	)

	(loop for new-ep-rel in new-ep-rels
		do (setf new-schema
				(add-constraint new-schema ':Episode-relations new-ep-rel))
	)

	(return-from outer new-schema)
)
)
)

(ldefun invisible-prop? (prop)
	(or
		(has-element prop 'HAS-DET.PR)
		(has-element prop 'ORIENTS)
	)
)

(ldefun remove-invisible-rcs (schema)
(block outer
	; (format t "schema is ~s~%" schema)

	(setf removed-constr-ids (list))

	(setf cleaned-rcs
		(loop for rc in (section-formulas (get-section schema ':Roles))
			if (not (or (time-prop? (second rc)) (invisible-prop? (second rc))))
				collect rc
			else
				do (setf removed-constr-ids (append removed-constr-ids (list (car rc))))
		)
	)

	; (format t "removed constraint ids ~s~%" removed-constr-ids)

	(setf new-roles-sec (append (list ':Roles) cleaned-rcs))
	(setf ret-schema (set-section schema ':Roles new-roles-sec))

	; Remove all certainty/necessity formulas about the
	; removed constraints. This doesn't need to be recursive,
	; as the cert/necess formulas aren't mentioned anywhere
	; else.
	(setf keep-cert (list))
	(loop for cf in (section-formulas (get-section ret-schema ':Certainties))
		if (contains removed-constr-ids (car (second cf)))
			do (progn
				; (format t "removing cert ~s~%" cf)
				)
		else
			do (setf keep-cert (append keep-cert (list cf)))
	)
	(setf keep-necess (list))
	(loop for nf in (section-formulas (get-section ret-schema ':Necessities))
		if (contains removed-constr-ids (car (second nf)))
			do (progn
				; (format t "removing necess ~s~%" nf)
			)
		else
			do (setf keep-necess (append keep-necess (list nf)))
	)

	(setf new-cert-sec (append (list ':Certainties) keep-cert))
	(setf new-necess-sec (append (list ':Necessities) keep-necess))

	(setf ret-schema (set-section ret-schema ':Certainties new-cert-sec))
	(setf ret-schema (set-section ret-schema ':Necessities new-necess-sec))

	(return-from outer ret-schema)
)
)

(ldefun fully-clean-coscoped-schemas (schemas &optional return-gen-maps)
(block outer
	; Before we clean up constants, we'll "uniquify" all
	; existing, unabstracted variables, to ensure each
	; schema has its own scope, and that we're in control
	; of which variables cross those scopes.
	(setf schemas (uniquify-shared-vars-chain schemas))

	; Collect all of those unabstracted variables now,
	; to ensure the new variables names we create don't
	; conflict with any of them.
	(setf existing-vars
		(dedupe (get-elements-pred schemas #'varp)))

	; Abstract all constants to variables, and maintain
	; maps from the new variables to the constants they
	; abstracted as well.
	(setf cleaned-schema-pairs
		(loop for schema in schemas
			collect (fully-clean-schema schema t)))

	(setf cleaned-schemas (mapcar #'car cleaned-schema-pairs))
	(setf cleaned-bindings (mapcar #'second cleaned-schema-pairs))

	; Keep these binding maps as lists, too, for later replacement
	; of their keys and re-conversion into the final maps.
	(setf cleaned-bindings-lists
		(loop for bindings in cleaned-bindings
			collect (loop for k being the hash-keys of bindings
				collect (list k (gethash k bindings)))))

	; Get all variables used to abstract individuals across
	; each schema.
	(setf all-ind-vars
		(dedupe (loop for bindings in cleaned-bindings
			append (loop for k being the hash-keys of bindings
				collect k))))

	; Get all individuals that have been abstracted to (possibly
	; unique) variables in each schema.
	(setf all-bound-inds
		(dedupe (loop for bindings in cleaned-bindings
			append (loop for k being the hash-keys of bindings
				collect (gethash k bindings)))))

	; Build reverse maps, for each schema, of all
	; abstracted constants to lists of their abstracting
	; variables within its schema.
	(setf ind-to-vars-maps (list))
	(loop for bindings in cleaned-bindings do (block mk-schema-map
		(setf ind-to-vars-map (make-hash-table :test #'equal))
		(loop for var being the hash-keys of bindings
			do (let ((ind (gethash var bindings)))
				(setf (gethash ind ind-to-vars-map)
					(append (gethash ind ind-to-vars-map) (list var))))
		)
		(setf ind-to-vars-maps (append ind-to-vars-maps (list ind-to-vars-map)))
		)
	)

	; For utility, we'll also build a map of all shared
	; bindings, to exclude all schema-specific bindings.
	(setf outer-scope-bindings (make-hash-table :test #'equal))
	; Give each individual a single abstracted variable name,
	; to be shared across all of these co-scoped schemas.

	; TODO: we need to account for these variables potentially
	; colliding with the existing abstracted vars, since that
	; makes pair-by-pair replacement less trivial. For now,
	; these can start with V and those can start with X, but
	; this should really temp-ify those, first, to ensure no
	; collisions during replacement.
	(setf gen-cursor "?V_A")
	(setf all-new-vars (list))
	(loop for ind in all-bound-inds do (block gen-ind
		; Advance gen-cursor until it no longer collides with
		; any non-abstracted vars in any schema.
		(loop while (has-element existing-vars (intern gen-cursor))
			do (setf gen-cursor (next-str gen-cursor)))

		; (format t "binding ind ~s to new var ~s (had old vars" ind (intern gen-cursor))

		; Replace all other variables for this
		; individual across all schemas, and in
		; the keys of all schema binding maps.
		(loop for ind-to-vars-map in ind-to-vars-maps
				for cleaned-schema in cleaned-schemas
				for cleaned-binding-list in cleaned-binding-lists
					for i from 0
			do (block fix-schema
				(setf old-cleaned-schema (copy-item cleaned-schema))
				(setf old-cleaned-binding-list (copy-item cleaned-binding-list))
				(loop for old-ind-var in (gethash ind ind-to-vars-map) do (block fix-schema-vars
				; Replace in schemas
					(setf cleaned-schema
						(replace-vals old-ind-var (intern gen-cursor) cleaned-schema))

					; do (format t " ~s" old-ind-var)
					; (format t "replacing ~s with ~s in schema ~d for ind ~s~%" old-ind-var (intern gen-cursor) i ind)

					; Replace in binding maps
					(setf cleaned-bindings-list
						(replace-vals old-ind-var (intern gen-cursor) cleaned-bindings-list))

					; Note it as a new variable so we know which
					; bindings to filter out of each schema map;
					; we'll use them to construct the outer schema's
					; subordinate constraints, which "reach down into"
					; each inner schema.
					(setf all-new-vars (dedupe (append all-new-vars (list (intern gen-cursor)))))
					))
				(setf cleaned-schemas (replace-vals old-cleaned-schema cleaned-schema cleaned-schemas))
				(setf cleaned-binding-lists (replace-vals old-cleaned-binding-list cleaned-binding-list cleaned-binding-lists))
			)
		)

		; (format t "~%")

		; Construct the list of mappings we'll use for
		; subordinate constraints on each inner schema.
		(loop for cleaned-binding-list in cleaned-binding-lists
			do (block make-subord-map
				(setf only-new-vars
					(loop for pair in cleaned-binding-list
						if (contains all-new-vars (car pair))
							collect pair))
				; (setf only-new-var-binding-list 
			)
		)

		; Advance the cursor.
		(setf gen-cursor (next-str gen-cursor))

	))

	; Construct the new bindings maps from the doctored
	; lists.
	(setf final-bindings
		(loop for cbl in cleaned-bindings-lists
			collect (mk-hashtable cbl)))

	(if return-gen-maps
		; then
		(return-from outer
			(list
				; (schema, bindings-for-schema) pairs
				(loop for cleaned-schema in cleaned-schemas
						for bindings in final-bindings
							collect (list cleaned-schema bindings))
				; outer scope bindings for shared vars
				outer-scope-bindings))
		; else
		(return-from outer cleaned-schemas)
	)
)
)

(ldefun fully-clean-schema (schema &optional return-gen-map)
(block outer
	(setf gen-schema-pair (mapped-generalize-schema-constants schema))
	(setf cleaned-schema (fully-clean-schema-no-gen (second gen-schema-pair)))

	(if return-gen-map
		; then
		(return-from outer
			(list cleaned-schema (car gen-schema-pair)))
		; else
		(return-from outer cleaned-schema)
	)
)
)

(ldefun fully-clean-schema-no-gen (schema)
	; (clean-do-kas (rename-constraints (dedupe-sections (remove-invisible-rcs (sort-steps (linearize-unspecified-steps schema))))))
	(clean-do-kas (dedupe-sections (remove-invisible-rcs (sort-steps (linearize-unspecified-steps schema)))))
)

(ldefun generalize-schema-constants (schema)
	(second (mapped-generalize-schema-constants schema))
)

(ldefun next-safe-cursor (schema)
(block outer
	(setf gen-cursor "?X_A")

	(loop while (has-element schema (intern gen-cursor))
		do (setf gen-cursor (next-str gen-cursor)))

	(return-from outer (intern gen-cursor))
)
)

(ldefun mapped-generalize-schema-constants (in-schema)
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
		; Don't abstract individuals with the "IND" type-shifter,
		; as these are bits of information carried through from
		; the source text.
		(if (and (listp si) (equal (length si) 2) (equal (car si) 'IND))
			(return-from gen-block)
		)

		; (format t "small ind ~s~%" si)
		(if nil
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

(ldefun get-necessity (constr-id schema)
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

(ldefun get-certainty (constr-id schema)
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

(ldefun set-certainty (constr-id num denom schema)
(block outer
	(setf new-schema (copy-list schema))
	(setf replaced nil)
	(if (not (null (get-section new-schema ':Certainties)))
		(loop for c in (section-formulas (get-section new-schema ':Certainties))
			do (if (or
					(equal (car (second c)) (var-to-exc constr-id))
					; also replace separate certainty constraints for duplicate formulas
					(equal (get-formula-by-id schema constr-id) (get-formula-by-id new-schema (car (second c))))
				)
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
		(progn
			; (format t "added cert about ~s to certs about ~s~%" (var-to-exc constr-id) (loop for c in (section-formulas (get-section new-schema ':Certainties)) collect (car (second c))))
			(setf new-schema (add-constraint new-schema ':Certainties (list (var-to-exc constr-id) 'CERTAIN-TO-DEGREE (list '/ num denom))))
		)
	)

	(return-from outer new-schema)
)
)

(ldefun schema-vars (schema)
	(remove-duplicates (get-elements-pred schema #'varp) :test #'equal)
)

(ldefun shared-vars (schema1 schema2)
	(intersection (schema-vars schema1) (schema-vars schema2) :test #'equal)
)

; NOTE: this works on lists of schemas, too
(ldefun uniquify-shared-vars (schema1 schema2)
	(uniquify-shared-vars-except schema1 schema2 nil)
)

(ldefun uniquify-shared-vars-except (schema1 schema2 except)
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

(ldefun uniquify-shared-vars-chain (schemas &optional except-in)
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
(ldefun merge-schemas (schema1 schema2)
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

(ldefun linearize-story (story)
	(loop for sent in story
			append sent
	)
)

; check-temporal-constraints takes a schema match and verifies
; the consistency of each of its temporal constraints with the
; temporal information extracted from the story.
; NOTE: before calling check-temporal-constraints, make sure
; you've called load-time-model with the story's temporal
; model! See norm-time.lisp for more information on loading the
; time model into the Allen Interval Algebra solver.
(ldefun check-temporal-constraints (schema-match)
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

(ldefun get-single-word-preds (schema)
	(remove-duplicates (get-elements-pred schema (lambda (x)
		(and
			(symbolp x)
			(not (lex-p? x))
			(not (null (search "." (format nil "~s" x))))
			(canon-pred? x)
		)
	)) :test #'equal)
)

(ldefun get-word-preds (schema)
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

(ldefun mk-schema-word-pred-idx (schemas)
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

(ldefun top-k-schemas (words schemas k)
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

	(setf schema-scores (sort (copy-item schema-scores) (lambda (x y) (> (second x) (second y)))))
	(return-from outer (mapcar #'car (subseq-safe schema-scores 0 k)))
)
)
)

(ldefun get-formula-by-id (schema id)
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
(ldefun get-id-by-formula (schema formula)
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

(ldefun dedupe-sections (schema)
(block outer
	(setf deduped-schema (copy-list schema))

	; For nonfluent sections, dedupe with the formulas alone
	(loop for sec in (nonfluent-sections schema) do (block sec-loop
		(setf new-sec (list (section-name sec)))

		; map formulas to constr IDs so we can replace them in the cert/necess sections
		(setf deduped-name-map (make-hash-table :test #'equal))
		(loop for pair in (section-formulas sec) do (setf (gethash (second pair) deduped-name-map) (car pair)))

		(setf deduped-constrs (remove-duplicates (mapcar #'second (section-formulas sec)) :test #'equal :from-end t))

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
		(setf new-sec (append (list (section-name sec)) (remove-duplicates (section-formulas sec) :test #'equal :from-end t)))
		(setf deduped-schema (set-section deduped-schema (section-name sec) new-sec))
	))

	(return-from outer deduped-schema)
)
)

; TODO: factor this and remove-subsuming-rcs
; to share code; I haven't done that yet, even
; though it's surely possible, because I didn't
; convince myself in time that ignoring the
; constraint IDs would be safe in a factored
; subsumption replacer, and I had limited
; cognitive bandwidth.
(ldefun remove-subsuming-rcs-list (rcs)
(block outer
	(setf constrs-to-remove (list))

	; We'll keep a hash-graph of subsumptions so we
	; can replace all general constraints with the
	; *most* specific version of them, and then let
	; the deduplication step clean up the rest.
	(setf child-graph (make-hash-table :test #'equal))

	(loop for constr1 in rcs
		for i from 0
		do (block check-against-1
			(setf phi1 (prop-args-pred-mods constr1))
			; no post-args allowed
			(if (> (length (third phi1)) 0)
				(return-from check-against-1)
			)
			; no mods allowed
			(if (> (length (fourth phi1)) 0)
				(return-from check-against-1)
			)
			(loop for constr2 in rcs
				for j from 0
				do (block check-pair
					(if (equal i j)
						(return-from check-pair))

					(setf phi2 (prop-args-pred-mods constr2))

					; Subject arg needs to be equal for subsumption
					(if (not (equal (car phi1) (car phi2)))
						(return-from check-pair)
					)

					; no post-args allowed
					(if (> (length (third phi2)) 0)
						(return-from check-pair)
					)
					; no mods allowed
					(if (> (length (fourth phi2)) 0)
						(return-from check-pair)
					)

					; equal preds can be/already were handled by dedupe
					(if (equal (second phi1) (second phi2))
						(return-from check-pair)
					)

					; If 1 subsumes 2, we don't want to keep 1
					(if (subsumes (second phi1) (second phi2))
						(progn
							(setf (gethash constr1 child-graph) constr2)
							(if (not (contains constrs-to-remove constr1))
								(progn
								(setf constrs-to-remove (append constrs-to-remove (list constr1)))
								; (format t "replacing general ~s with specific ~s~%" constr1 constr2)
								)
							)

							; We won't break the loop yet, since we'd
							; like to mark all subsumed constraints in
							; the child graph for proper resolution.
						)
					)
				)
			)
		)
	)

	(setf new-rcs (copy-list rcs))

	(loop for rc in constrs-to-remove
		do (block remove-rc
			; Get the most specific version of the
			; constraint from the child graph for
			; replacement.
			(setf child-rc rc)
			(loop while (not (null (gethash child-rc child-graph)))
				do (setf child-rc (gethash child-rc child-graph))
			)

			(if (equal child-rc rc)
				(progn
					(format t "ERROR: subsumption check marked general role constraint ~s for removal, but couldn't identify a more specific version in the rc list: ~%" rcs rc)
					(return-from outer rcs)
				)
			)

			(setf new-rcs (replace-vals rc child-rc new-rcs))
		)
	)

	(return-from outer (dedupe new-rcs))
)
)

(ldefun remove-subsuming-rcs (schema)
(block outer
	(setf constrs-to-remove (list))

	; We'll keep a hash-graph of subsumptions so we
	; can replace all general constraints with the
	; *most* specific version of them, and then let
	; the deduplication step clean up the rest.
	(setf child-graph (make-hash-table :test #'equal))

	(loop for constr1 in (section-formulas (get-section schema ':Roles))
		do (block check-against-1
			(setf phi1 (prop-args-pred-mods (second constr1)))
			; no post-args allowed
			(if (> (length (third phi1)) 0)
				(return-from check-against-1)
			)
			; no mods allowed
			(if (> (length (fourth phi1)) 0)
				(return-from check-against-1)
			)
			(loop for constr2 in (section-formulas (get-section schema ':Roles))
				do (block check-pair
					(setf phi2 (prop-args-pred-mods (second constr2)))

					; Subject arg needs to be equal for subsumption
					(if (not (equal (car phi1) (car phi2)))
						(return-from check-pair)
					)

					; no post-args allowed
					(if (> (length (third phi2)) 0)
						(return-from check-pair)
					)
					; no mods allowed
					(if (> (length (fourth phi2)) 0)
						(return-from check-pair)
					)

					; equal preds can be/already were handled by dedupe
					(if (equal (second phi1) (second phi2))
						(return-from check-pair)
					)

					; If 1 subsumes 2, we don't want to keep 1
					(if (subsumes (second phi1) (second phi2))
						(progn
							(setf (gethash constr1 child-graph) constr2)
							(if (not (contains constrs-to-remove constr1))
								(progn
								(setf constrs-to-remove (append constrs-to-remove (list constr1)))
								; (format t "replacing general ~s with specific ~s~%" constr1 constr2)
								)
							)

							; We won't break the loop yet, since we'd
							; like to mark all subsumed constraints in
							; the child graph for proper resolution.
						)
					)
				)
			)
		)
	)

	(setf new-schema (copy-item schema))
	(loop for rc in constrs-to-remove
		do (block remove-rc
			; Get the most specific version of the
			; constraint from the child graph for
			; replacement.
			(setf child-rc rc)
			(loop while (not (null (gethash child-rc child-graph)))
				do (setf child-rc (gethash child-rc child-graph))
			)

			(if (equal child-rc rc)
				(progn
					(format t "ERROR: subsumption check marked general role constraint ~s for removal, but couldn't identify a more specific version in the schema: ~%" rc)
					(print-schema schema)
					(return-from outer schema)
				)
			)

			(setf new-schema (replace-vals (second rc) (second child-rc) new-schema))
		)
	)

	(return-from outer (dedupe-sections new-schema))

	)
)

(ldefun topsort-steps-helper (time-graph ep-lst)
(block outer
	; base case
	(if (equal 0 (hash-table-count time-graph))
		; then
		(progn
			; (format t "empty time graph; returning ep-lst ~s~%" ep-lst)
			(return-from outer ep-lst)
		)
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

(ldefun topsort-steps (schemas)
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

(ldefun topsort-fluents (schemas)
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

(ldefun topsort-eps (schemas unfiltered-ep-ids)
(block outer
	(setf all-ep-rels
		(loop for schema in schemas
			append (mapcar #'second (section-formulas (get-section schema ':Episode-relations)))
		)
	)

	(return-from outer (topsort-ep-list all-ep-rels unfiltered-ep-ids))
)
)

(ldefun topsort-ep-list (all-ep-rels ep-ids)
(block outer
	(load-time-model all-ep-rels)
	; (format t "all-ep-rels: ~s~%" all-ep-rels)
	; (format t "ep-ids: ~s~%" ep-ids)

	; For any ep-ids not related to anything, we'll treat
	; them as coming sequentially as they appear in the
	; list. (Unless there's only one episode.)
	(if (> (length ep-ids) 1)
		(loop for ep-id in ep-ids
				for i from 0
			if (not (has-element all-ep-rels ep-id))
				do (block insert-ep-rel
					(if (< i (- (length ep-ids) 1))
						; then
						; Link the ep forward in the list.
						(setf all-ep-rels (append all-ep-rels (list
							(list ep-id (list 'BEFORE (nth (+ i 1) ep-ids)))
						)))
						; else
						; This unrelated ep is the last in
						; the list, so we need to link it
						; backward instead.
						(setf all-ep-rels (append all-ep-rels (list
							(list (nth (- i 1) ep-ids) (list 'BEFORE ep-id))
						)))
					)
				)
		)
	)

	; all-ep-rels won't have any step names if there's
	; only one unique one, so we'll have to add it in
	; that case.
	(if (equal 1 (length (dedupe ep-ids)))
		(setf ep-ids (list (car ep-ids)))
	)

	(setf time-graph (make-hash-table :test #'equal))
	(loop for ep-id in ep-ids do (setf (gethash ep-id time-graph) (list)))
	(loop for ep1 in ep-ids
		do (loop for ep2 in ep-ids do (block ep-ep-loop
			(if (equal ep1 ep2)
				(return-from ep-ep-loop)
			)
			(setf arel (listify-nonlists (second (allen-fhow ep2 ep1))))
			(if (and (not (null (intersection '(P M O) arel :test #'equal)))
				 (null (intersection '(PI MI OI =) arel :test #'equal)))
				; then
				(setf (gethash ep1 time-graph) (remove-duplicates (append (gethash ep1 time-graph) (list ep2)) :test #'equal))
			)
		))
	)

	; If there's only one episode, or for whatever other
	; reason some collection of episodes not in the time
	; graph, we'll still pass in the episodes we've got.
	(setf ungraphed-ep-lst (list))
	(if (equal 0 (hash-table-count time-graph))
		(setf ungraphed-ep-lst (remove-duplicates ep-ids :test #'equal :from-end t))
	)
	; (format t "ep-ids is ~s~%" ep-ids)
	; (format t "ungraphed ep lst is ~s~%" ungraphed-ep-lst)
	; (format t "~d entries in graph table~%" (hash-table-count time-graph))

	; (handler-case
	(return-from outer (topsort-steps-helper time-graph ungraphed-ep-lst))
	; (error () (format t "error schemas: ~s~%" schemas)))
)
)

(ldefun sort-steps (schema)
(block outer
	; If the schema has steps not yet accounted for in
	; the :Episode-relations section, assume a linear
	; ordering and add the relations now, as they're
	; used in building the time graph for later sorting.
	; That graph will be redundant, but this is an easy
	; way to avoid errors in that graph building code down
	; the line.
	(setf schema (linearize-unspecified-steps schema))
	; (format t "now sorting schema: ~%")
	; (print-schema schema)

	(setf steps (section-formulas (get-section schema ':Steps)))
	(setf sorted-step-ids (topsort-steps (list schema)))
	; (if (or (not (null steps)) (not (null sorted-step-ids)))
		; (progn
			; (format t "steps: ~s~%" steps)
			; (format t "sorted-step-ids: ~s~%" sorted-step-ids)
		; )
	; )
	(setf sorted-steps (sort (copy-seq steps) (lambda (x y) (< (position x sorted-step-ids) (position y sorted-step-ids))) :key #'car))
	(setf new-steps-sec (append (list ':Steps) sorted-steps))
	(return-from outer (set-section schema ':Steps new-steps-sec))
)
)

(ldefun rename-constraints-helper (schema tmp-pass)
(block outer
	(setf new-schema (copy-item schema))

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

(ldefun rename-constraints (schema)
(block outer
	; We're going to do two passes. The first will rename
	; constraint variables to have two dashes in them, which
	; we assume won't happen anywhere else. This is because the
	; old names and the new names may have some overlap, e.g. ?E3
	; might already exist for what is called ?E5 in the rename, but
	; the rename will have a different ?E3. With two passes, we can
	; avoid that aliasing issue (just like using a temp variable for
	; swaps).
	(setf ret-val (rename-constraints-helper (rename-constraints-helper schema t) nil))

	; (setf c1-covered (loop for c1 in (section-formulas (get-section schema ':Certainties)) collect (car (second c1))))
	; (setf c2-covered (loop for c2 in (section-formulas (get-section ret-val ':Certainties)) collect (car (second c2))))

	; (format t "constraint rename had certainty coverage ~s into ~s~%" c1-covered c2-covered)

	(return-from outer ret-val)
)
)

(ldefun do-ka-pred? (p)
(and
	(canon-pred? p)
	(equal (pred-base p) 'do.v)
	(equal (length (pred-args p)) 1)
	(canon-kind? (car (pred-args p)))
	(equal 'KA (car (car (pred-args p))))
)
)

(ldefun do-ka-prop? (p)
(and
	(canon-prop? p)
	(equal (prop-pred p) 'DO.V)
	(equal (length (prop-post-args p)) 1)
	(canon-kind? (car (prop-post-args p)))
	(equal 'KA (car (car (prop-post-args p))))
)
)

(ldefun ttt-clean-do-kas (schema)
	(ttt-replace schema
		'(DO.V (KA _!))
		'_!
	)
)

(ldefun clean-do-kas (schema)
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

(ldefun load-story-time-model (story)
(block outer
	(setf story-time-props
		(loop for phi in (linearize-story story)
			if (time-prop? phi) collect phi))

	; TODO: make these implicit somehow in AIA solver?

	(load-time-model story-time-props)
)
)

(ldefun old-invokes-schema? (phi)
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

(ldefun invokes-schema? (phi &optional strict-name-match)
	(not (null (invoked-schema phi strict-name-match)))
)

(ldefun invoked-proto (phi)
(block outer
	(setf pred (if (canon-atomic-prop? phi) (prop-pred phi) nil))

	(setf best-invoked nil)
	(setf best-score 0)
	(loop for proto-name in *PROTOSCHEMAS* do (block b
		(setf cand-score (subsumption-score proto-name pred))
		(if (> cand-score best-score)
			; then
			(progn
				(setf best-invoked (eval proto-name))
				(setf best-score cand-score)
			)
		)
	))

	(return-from outer best-invoked)
)
)

(ldefun invoked-schema (phi &optional strict-name-match)
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
		; then
		(return-from outer (eval pred))
		; else
		; If it doesn't, and we're doing a "strict" match,
		; fail out.
		(if strict-name-match
			(return-from outer nil)
		)
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

(ldefun get-char-form (ep-id schemas)
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


(ldefun flatten-prop (in-prop)
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

(ldefun clean-tags (flat)
	(loop for e in flat
		collect (intern (car (split-str (string e) ".")))
	)
)

(ldefun el-to-english (prop)
	(clean-tags (flatten-prop prop))
)
