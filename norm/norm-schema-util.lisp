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
	:Certainties
	:Necessities
))

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
		(t
			(return-from outer nil))
	)
)
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

(defun schema-sections (schema)
(progn
	(check #'schema? schema)
	(cddr schema)
)
)

(defun nonmeta-sections (schema)
	(loop for sec in (schema-sections schema)
		if (or (equal (section-type sec) 'NONFLUENT)
			   (equal (section-type sec) 'FLUENT))
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
(block outer
	(if (null (member sec-name *SEC-NAMES* :test #'equal))
		; then
		(progn
		(error "Cannot add constraint: invalid section name ~s~%" sec-name)
		(return-from outer nil)
		)
	)

	(setf const-num (- (length (get-section schema sec-name)) 1))
	(setf new-const (list (intern (format nil "~a~d" (sec-formula-prefix sec-name) (+ const-num 1))) constraint))
	(setf new-sec (append (get-section schema sec-name) (list new-const)))
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
	(loop for wff in story
		do (add-to-kb wff gen-kb))

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
	(loop for sec in (nonmeta-sections schema)
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

(defun generalize-schema-constants (schema)
(block outer
	(setf gen-cursor "?X_A")
	(setf gen-schema schema)
	(loop for si in (extract-schema-small-individuals schema) do (block gen-block
		(loop while (has-element gen-schema (intern gen-cursor))
			do (setf gen-cursor (next-str gen-cursor))
		)

		(setf gen-schema (replace-vals si (intern gen-cursor) gen-schema))
		(setf gen-cursor (next-str gen-cursor))
	))

	(return-from outer gen-schema)
)
)

(defun schema-vars (schema)
	(remove-duplicates (get-elements-pred schema #'varp) :test #'equal)
)

(defun shared-vars (schema1 schema2)
	(intersection (schema-vars schema1) (schema-vars schema2) :test #'equal)
)

; To merge two schemas, we'll:
;	1. rename their variables to be unique
;	2. concatenate all the formulas in each section
;	3. 
(defun merge-schemas (schema1 schema2)
(block outer
	; 1. rename their variables to be unique
	(setf shared (shared-vars schema1 schema2))
	(setf sc1 schema1)
	(setf sc2 schema2)
	(loop for var in shared
		do (block rename
			(setf var1 (intern (concat-strs (string var) "_1")))
			(setf var2 (intern (concat-strs (string var) "_2")))
			(setf sc1 (replace-vals var var1 sc1))
			(setf sc2 (replace-vals var var2 sc2))
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

(defun get-schema-ep-var-char (schema v)
(block outer
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

(defun dedupe-sections (schema)
(block outer
	(setf deduped-schema schema)

	; For nonfluent sections, dedupe with the formulas alone
	(loop for sec in (nonfluent-sections schema) do (block sec-loop
		(setf new-sec (list (section-name sec)))
		(setf deduped-constrs (remove-duplicates (mapcar #'second (section-formulas sec)) :test #'equal))

		; Blank out the section in the schema and
		; add the constraints back in one by one
		(setf deduped-schema (set-section deduped-schema (section-name sec) (list (section-name sec))))
		(loop for constr in deduped-constrs
			do (setf deduped-schema (add-constraint deduped-schema (section-name sec) constr))
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

(defun topsort-steps (schema)
(block outer
	(setf ep-ids (mapcar #'car (section-formulas (get-section schema ':Steps))))
	; (format t "ep IDs: ~s~%" ep-ids)
	(load-time-model (mapcar #'second (section-formulas (get-section schema ':Episode-relations))))

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

	(return-from outer (topsort-steps-helper time-graph (list)))
)
)

(defun sort-steps (schema)
(block outer
	(setf steps (section-formulas (get-section schema ':Steps)))
	(setf sorted-step-ids (topsort-steps schema))
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


(defun clean-do-kas (schema)
(let (cleaned-schema do-ka-idcs do-ka action)
(block outer
	(setf cleaned-schema schema)
	(setf do-ka-idcs (get-elements-pred-idx cleaned-schema #'do-ka-pred?))
	(loop while (not (null do-ka-idcs))
		do (block replace-do-ka
			(setf do-ka (get-element-idx cleaned-schema (car do-ka-idcs)))
			(setf action (second (second do-ka)))
			(setf cleaned-schema (replace-element-idx cleaned-schema (car do-ka-idcs) action))
			(setf do-ka-idcs (get-elements-pred-idx cleaned-schema #'do-ka-pred?))
			(return-from replace-do-ka)
		)
	)

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
