(load "real_util.lisp")

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
(defparameter *INF-RULES*
	'(
		
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
		always (funcall pred formula)
	)
)
)

(defun match-formula-helper (formula pattern bindings constraints)
(block outer
	(cond
		; If pattern is a variable, we'll bind it to the formula if we can.
		; If it's already bound to something else, we return nil.
		((varp pattern)
		(progn
			(if (null (gethash pattern bindings))
				; it's unbound; bind it if the value meets any constraint
				; predicates for the variable
				(if (meets-constraint-preds formula (gethash pattern constraints))
					; it meets the constraints; bind it
					(progn
						(setf (gethash pattern bindings) formula)
						bindings
					)
					; doesn't meet constraints; don't bind it
					nil
				)
				; it's bound; check if we're consistent
				(if (equal formula (gethash pattern bindings))
					; we're consistent
					bindings
					; it's bound to something else
					nil
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
				nil
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
				nil
			)
		)

		; Anything else doesn't match.
		(t nil)
)
)
)

(defun match-formula (formula pattern constraints)
(progn
	(if (not (hashtablep constraints))
		(setf constraints (make-hash-table :test #'equal))
	)

	(setf mf-bind (make-hash-table :test #'equal))
	(setf mf-result (match-formula-helper formula pattern mf-bind constraints))

	(cond
		((null mf-result)
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
			(apply-bindings (gethash pattern bindings) bindings)
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
