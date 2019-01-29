(declaim (sb-ext:muffle-conditions cl:warning))

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

(defun match-formula-helper (formula pattern bindings)
(block outer
	(cond
		; If pattern is a variable, we'll bind it to the formula if we can.
		; If it's already bound to something else, we return nil.
		((varp pattern)
		(progn
			(if (null (gethash pattern bindings))
				; it's unbound
				(progn
					(setf (gethash pattern bindings) formula)
					bindings
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
						always (not (null (match-formula-helper e1 e2 bindings)))
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

(defun match-formula (formula pattern)
	(match-formula-helper formula pattern (make-hash-table :test #'equal))
)




(defun ht-eq-oneway (ht1 ht2)
	(loop for key being the hash-keys of ht1
		always (equal (gethash key ht1) (gethash key ht2))
	)
)

(defun ht-eq (ht1 ht2)
(cond
	((and (null ht1) (null ht2))
		t)

	((and (null ht1) (not (null ht2)))
		nil)

	((and (not (null ht1)) (null ht2))
		nil)

	((and
		(ht-eq-oneway ht1 ht2)
		(ht-eq-oneway ht2 ht1)
	) t)

	(t nil)
)
)

(defun print-ht (ht)
(cond
	((null ht) (format t "	nil~%"))

	(t (loop for key being the hash-keys of ht
		do (format t "	~s: ~s~%" key (gethash key ht))
	))
)
)

(defun mk-want-bind (pairs)
(cond
	((null pairs) nil)

	(t (progn
		(setf want-bind (make-hash-table :test #'equal))
		(loop for pair in pairs
			do (setf (gethash (car pair) want-bind) (second pair))
		)
		want-bind
	))
)
)

(defun test-match (got want-pairs)
	(cond
		((ht-eq got (mk-want-bind want-pairs))
			(format t "PASS~%")
		)

		(t
			(progn
				(format t "FAIL: got~%")

				(print-ht got)

				(format t "~%but wanted~%")
				
				(print-ht (mk-want-bind want-pairs))

				(format t "~%")
			)
		)
	)
)

; tests
(test-match
	; got
	(match-formula
		'(1 2 3 4)
		'(1 2 ?x 4)
	)

	; want
	'(
		(?x 3)
	)

)

(test-match
	; got
	(match-formula
		'(1 2 3 4)
		'(1 2 ?x ?x)
	)

	; want
	nil
)

(test-match
	; got
	(match-formula
		'(1 2 3 3)
		'(1 2 ?x ?x)
	)

	; want
	'(
		(?x 3)
	)
)

(test-match
	; got
	(match-formula
		'(1 2 (4 5 6) 4)
		'(1 2 (?x ?y ?z) ?x)
	)

	; want
	'(
		(?x 4)
		(?y 5)
		(?z 6)
	)
)

(test-match
	; got
	(match-formula
		'(1 2 (4 5 6) 7)
		'(1 2 (?x ?y ?z) ?x)
	)

	; want
	nil
)
