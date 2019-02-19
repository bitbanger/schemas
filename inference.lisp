(load "real_util.lisp")
(load "parse.lisp")
(load "schema_util.lisp")

; Inference rules are two-element lists.
;
; Each element is a list structure whose elements are either
; literals or variable names (symbol names starting with ?).
;
; To evaluate a formula for a match against the first element of the
; list, they are compared for equality like normal list structures.
; When a variable in the rule is encountered, it is bound to the corresponding
; element in the formula, and all future instances of the variable must correspond
; to the same thing.
;
; The inferent is the second element of the list, where all variables are replaced
; with what they were bound to during the matching. All variables are recursively
; rewritten out.

; In general, it's nice to be able to have the variables
; co-refer in the matching process (stateful schema matching).
; But for inference rules, you kind of want all of the variables in the rule to be "meta", and to never make it into the schema.
; For now, we'll hack around that by binding the non-formula-side first when both are vars down in match-formula, and using uncommon variable names here.
; TODO: something better than that
(defparameter *INF-RULES*
; These are basically all syntactic.
(list
	; IDENTITY RULE
	(list
	; match pattern
	'?x11
	; variable constraints
	nil
	; inferent
	'?x11
	)

	; VERB-TO-"DO" TRANSFORMATION RULE
	(list
	;match pattern
	'(?t12 ?v13)
	; variable constraints
	(mk-hashtable (list
		(list
			; t must be a term
			'?t12
			(list #'term?)
		)
		(list
			; v must be a verb phrase
			'?v13
			(list #'verb?)
		)
	))
	; inferent
	'(?t12 (do2.v (ka ?v13)))
	)

	; strip out episode characterization syntax
	(list
	; match pattern
	'(?s ** ?e)
	; variable constraints
	(mk-hashtable (list
		(list
			; s must be a sentence
			'?s
			(list #'sent?)
		)
		(list
			; v must be an entity.
			; Maybe "term" is sufficient for now?
			; TODO: determine whether "entity" is a more nuanced concept
			(list #'term?)
		)
	))
	)
)
)

; varp reports whether v is a variable (i.e. a symbol name
; starting with a question mark).
(defun varp (v)
	(cond
		((not (symbolp v)) nil)
		((not (> (length (string v)) 1)) nil)
		((not (equal "?" (subseq (string v) 0 1))) nil)
		(t t)
	)
)

(defun meets-constraint-preds (formula preds)
(progn
	(loop for pred in preds
		; do (format t "(~s ~s): ~s~%" pred formula (funcall pred formula))
		always (funcall pred formula)
	)
)
)

; resolve recursively resolves variables a WFF
; until it no longer contains bound variables.
(defun resolve (wff bindings)
	(cond
		; If WFF is a variable, try to resolve it.
		((varp wff)
			(if (not (null (gethash wff bindings)))
				(resolve (gethash wff bindings) bindings)
				wff
			)
		)

		; If WFF is a list, recursively resolve its elements.
		((listp wff)
			(loop for e in wff
				collect (resolve e bindings)
			)
		)

		; If it's anything else, it doesn't need resolution.
		(t wff)
	)
)

(defun match-formula-helper (form pat bindings constraints)
(block outer

	(if (null constraints)
		(setf constraints (make-hash-table :test #'equal))
	)

	; Resolve out all bound variables (equivalent to having
	; made substitutions going forward in MGU algorithm).
	(setf formula (resolve form bindings))
	(setf pattern (resolve pat bindings))


	(cond
		; If pattern is a variable, we'll bind it to the formula if we can.
		; If it's already bound to something else, we return nil.
		((or (varp pattern) (varp formula))
		(progn
			(setf var-side pattern)
			(setf bind-side formula)
			(if (and (varp formula) (not (varp pattern)))
				(progn
					(setf var-side formula)
					(setf bind-side pattern)
				)
			)

			(if (null (gethash var-side bindings))
				; it's unbound; bind it if the value meets any constraint
				; predicates for the variable
				(if (meets-constraint-preds bind-side (gethash var-side constraints))
					; it meets the constraints; bind it
					(progn
						(setf (gethash var-side bindings) bind-side)
						bindings
					)
					; doesn't meet constraints; don't bind it
					(progn
					(dbg 'unify-wffs "var ~s doesn't meet constraints~%" var-side)
					nil
					)
				)
				; it's bound; check if we're consistent
				(if (equal bind-side (gethash var-side bindings))
					; we're consistent
					bindings
					; it's bound to something else
					(progn
					(dbg 'unify-wffs "var ~s was already bound to something else~%" pattern)
					nil
					)
				)
			)
		)
		)

		; If both of them are non-variable non-lists, we just use #'equal.
		((and (not (listp formula)) (not (listp pattern)))
			(if (equal formula pattern)
				; they were equal
				bindings
				; they weren't
				(progn
				(dbg 'unify-wffs "~s didn't equal ~s~%" formula pattern)
				nil
				)
			)
		)

		; If pattern and formula are both lists, we'll recursively make sure each element matches.
		((and (listp formula) (listp pattern))
			(if (and
				(equal (length formula) (length pattern))
				(loop for e1 in formula
					for e2 in pattern
						always (not (null (match-formula-helper e1 e2 bindings constraints)))
					)
				)
				; the lists did match
				bindings
				; something didn't match
				(progn
				(dbg 'unify-wffs "something didn't match~%")
				nil
				)
			)
		)

		; Anything else doesn't match.
		(t (progn
		(dbg 'unify-wffs "unknown bad match case for ~s and ~s~%" formula pattern)
		nil
		))
)
)
)

(defun match-formula (formula pattern constraints)
	(match-formula-with-bindings formula pattern constraints (make-hash-table :test #'equal))
)

(defun match-formula-with-bindings (formula pattern constraints mf-bind)
(progn
	(if (not (hashtablep constraints))
		(setf constraints (make-hash-table :test #'equal))
	)

	(if (not (hashtablep mf-bind))
		(setf mf-bind (make-hash-table :test #'equal))

		; copy the hash table so we don't clobber the
		; old one in a failed match
		(setf mf-bind (ht-copy mf-bind))
	)

	(setf mf-result (match-formula-helper formula pattern mf-bind constraints))

	(cond
		((null mf-result)
			; (format t "helper returned nil~%")
			nil
		)

		((equal 0 (length (loop for key being the hash-keys of mf-bind collect key)))
			; there are no bindings; return t
			t
		)

		(t mf-bind)
	)
)
)

; matched-wffs returns a map from section name
; to all WFFs in that section affected by the
; given bindings (with the bindings applied).
; The schema passed in should not have the
; bindings applied.
(defun matched-wffs (schema bindings)
(let (
(wffs-by-sec (make-hash-table :test #'equal))
(bound-pair nil)
)
(block outer
	(dbg 'matched-wffs "extracting matches for schema ~s~%" (schema-name schema))
	; (dbg 'matched-wffs "sections: ~s~%" (schema-sections schema))
	(loop for section in (schema-section-names schema)
	; do (dbg 'matched-wffs "pairs for section ~s: ~s~%" section (get-section-pairs schema section))
	do (loop for pair in (get-section-pairs schema section)
		do (block inner
			(setf bound-pair (apply-bindings pair bindings))
			(if (not (equal bound-pair pair))
				(block innermore

				(dbg 'matched-wffs "bound-pair is ~s, pair is ~s~%" bound-pair pair)
				(dbg 'matched-wffs "adding ~s~%" (append (gethash section wffs-by-sec) bound-pair))
				(setf (gethash section wffs-by-sec)
					(append (gethash section wffs-by-sec)
						(list bound-pair)))

				(dbg 'matched-wffs "added ~s~%" (gethash section wffs-by-sec))
				(dbg 'matched-wffs "ht is ~s~%" (ht-to-str wffs-by-sec))
				)

				; else
				(dbg 'matched-wffs "bound-pair is ~s, pair is ~s~%" bound-pair pair)

			)

			)
		)
	)

	(dbg 'matched-wffs "final ht count: ~d~%" (hash-table-count wffs-by-sec))

	(dbg 'matched-wffs "returning ~s~%" (if (> (hash-table-count wffs-by-sec) 0) wffs-by-sec nil))
	(return-from outer (if (> (hash-table-count wffs-by-sec) 0) wffs-by-sec nil))
)
)
)

; apply-bindings rewrites all occurrences of bound variables in a pattern
; with their bound values. variables are re-written recursively, and
; cycles are assumed to not be present.
(defun apply-bindings (pattern bindings)
(cond
	((null bindings)
		pattern
	)

	((varp pattern)
		(if (not (null (gethash pattern bindings)))
			; bind it if we can
			(progn
			; (format t "pattern is ~s~%" pattern)
			; (format t "binding ~s to ~s~%" pattern (gethash pattern bindings))
			(apply-bindings (gethash pattern bindings) bindings)
			)
			; leave it free if we can't
			pattern
		)
	)

	((not (listp pattern))
		pattern
	)

	(t
		(loop for e in pattern
			collect (apply-bindings e bindings)
		)
	)
)
)

(defun apply-inference-rule (formula rule)
(block outer

	(setf pattern (car rule))
	(setf constraints (second rule))
	(setf target (third rule))

	(setf air-match-result (match-formula formula pattern constraints))
	; (format t "result: ~s~%" air-match-result)

	(cond
		((not (null air-match-result))
			(apply-bindings
				target
				air-match-result
			)
		)

		(t
			nil
		)
	)
)
)

(defun apply-standard-rules (formula)
	(loop for rule in *INF-RULES*
		do (setf res (apply-inference-rule formula rule))
		if (not (null res))
		collect res
	)
)
