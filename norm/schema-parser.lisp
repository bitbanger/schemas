(declaim (sb-ext:muffle-conditions cl:warning))

(load "ttt/src/load")
(load "init1.lisp")
(load "real_util.lisp")

; (load "process-sentence1.lisp") ; for hide-ttt-ops and unhide-ttt-ops

(defun undetermine! (x l)
	(loop for el in (replace-vals x 'SKOLEMMMMM l)
			for i from 0
		append (if (equal i 0) (list el) (list 'AND.CC el))
	)
)

(defun has-ext? (x e)
    (and
        (symbolp x)
        (stringp e)
        (>= (length (string x)) (length e))
        (equal
            e
            (subseq
                (string x)
                (- (length (string x)) (length e))
                (length (string x))
            )
        )
    )
)

(defun lex-attr-pred? (x)
(or
	(has-ext? x ".N")
	(has-ext? x ".NN")
	(has-ext? x ".A")
)
)

(defun lex-noun? (x)
	(has-ext? x ".N")
)


(defparameter *SCHEMA-CLEANUP-RULES* '(
	; The case with only one argument
	; (/ (KA (L _!1 (_!1 _!2)))
	; 	(KA _!2))

	; The case with unbracketed serial arguments
	; (/ (KA (L _!1 (_!1 _!2 _+3)))
	; 	(KA _!2 _+3))

	; Get rid of monadic lambda predicates.
	(/ (_*1 (L _!.2 (_!.2 _+3)) _*4)
		(_*1 (_+3) _*4)
	)

	; Split out conjoined verb predications w/
	; the same subject, and fix their "nested"
	; episode characterizations.
	(/
		(_*6 (( ((_!. _+2) AND.CC (_!. _+3)) [**] _!4) [**] _!5) _*7)
		(_*6 ((_!. _+2) ** _!5) ((_!. _+3) ** _!4) _*7)
	)

	; Apply attr modifiers to composite nouns.
	(/
		((!1 lex-attr-pred?) (!2 lex-noun?))
		((ATTR !1) !2)
	)

	; Clean up this weird construction for now.
	(/
		(_!1 BE.V (= _!2))
		(_!1 EL_EQUAL.V _!2)
	)

	; Skolemize existential determiners.
	; TODO: check that they aren't actually
	; Skolem functions of universally quantified
	; variables.
	;(/ (A.DET _!.
	;		(+ (^* _!.))
	;	)
	;
	;	(undetermine! _!. (+))
	;)
))

(defparameter *SCHEMA-CLEANUP-FUNCS* '(
	skolemize-adets
))

(defun and-chain (phis)
;(norm-singletons
(unwrap-singletons
	(loop for phi in phis
		for i from 0
			if (equal i 0)
				append (list phi)
			else
				append (list 'AND.CC phi)
	)
)
)

(defun skolemize-adets (phi)
(block outer
	(setf phi-copy (copy-list phi))
	(setf atemporals (list))

	(block adet-loop-outer
		(setf adet-pairs nil)
		(loop while t do (block adet-loop-inner
			(setf adet-pairs (get-elements-pred-pairs phi-copy (lambda (x) (and (listp x) (equal (car x) 'A.DET)))))

			(if (null adet-pairs)
				(return-from adet-loop-outer)
			)

			(setf adet (car (car adet-pairs)))
			(setf adet-idx (second (car adet-pairs)))

			(setf adet-var (second adet))
			(setf adet-formulas (replace-vals adet-var 'NEW-SKOLEM (cddr adet)))
			(setf final-adet-formulas (list))
			(loop for form in adet-formulas
				; TODO: better if condition here to identify atemporals
				do (if (and (equal 'NEW-SKOLEM (car form)))
					; then
					(setf atemporals (append atemporals (list form)))
					; else
					(setf final-adet-formulas (append final-adet-formulas (list form)))
				)
			)

			; Replace the adet
			(setf phi-copy (replace-element-idx phi-copy adet-idx (and-chain final-adet-formulas)))
		)
		)
	)

	; Add the atemporals
	(setf phi-copy (append atemporals phi-copy))

	; Make a new Skolem name based on the first atemporal.
	; Probably there'll only ever be one (valid) one for this.
	; If there isn't one at all, we'll just call it "OBJECT".
	(setf new-skolem nil)
	(loop for atemp in atemporals
		if (and (equal 2 (length atemp)) (symbolp (second atemp)))
			do (setf new-skolem (new-skolem! (intern (car (split-str (format nil "~s" (second atemp)) ".")))))
	)
	(if (null new-skolem)
		(setf new-skolem (new-skolem! 'OBJECT))
	)

	(setf phi-copy (replace-vals 'NEW-SKOLEM new-skolem phi-copy))

	(return-from outer phi-copy)
)
)

(defun schema-cleanup-ttt (phi)
	(unhide-ttt-ops
		(ttt:apply-rules *SCHEMA-CLEANUP-RULES*
			(hide-ttt-ops phi)
			:rule-order :slow-forward))
)

(defun schema-cleanup-lisp (phi)
(block outer
	(setf phi-copy (copy-list phi))
	(loop for func in *SCHEMA-CLEANUP-FUNCS*
		do (setf phi-copy (funcall func phi-copy))
	)
	(return-from outer phi-copy)
)
)

(defun schema-cleanup (phi)
(block outer
	; until convergence
	(setf last-phi-copy (copy-list phi))
	(setf phi-copy (copy-list phi))
	(loop while t do (block inner
		(setf phi-copy (schema-cleanup-ttt phi-copy))
		(setf phi-copy (schema-cleanup-lisp phi-copy))
		(if (equal phi-copy last-phi-copy)
			; then
			(return-from outer phi-copy)
			; else
			(setf last-phi-copy phi-copy)
		)
	))
)
)

; (defparameter *PHI* '(KA (L Y (Y GO.V (K BIRDING.N)))))
; (defparameter *PSI* '(KA (L Y (Y EAT.V))))
; (format t "~s~%	-> ~s~%" *PHI* (uncompress-lambda *PHI*))
; (format t "~s~%	-> ~s~%" *PSI* (uncompress-lambda *PSI*))

; (defparameter *PHI* '(
 ;((((MAN6.SK EAT.V) AND.CC (MAN6.SK SLEEP.V)) ** E5.SK) ** E4.SK)))


; (format t "~s~%" (schema-cleanup *PHI*))

(defun schema-parse (sent)
	(schema-cleanup (interpret sent))
)

(defun sp (sent)
	;(format t "~s~%" (interpret sent))
	(format t "~s~%" (schema-parse sent))
	; (format t "~s~%" (skolemize-adets (interpret sent)))
)

; (sp "They took it home and put it in a bucket.")
;(sp "Today we were playing outside.")
;(sp "We saw a lot of dark clouds in the sky.")

;(sp "My son is a little child.")

(if t (block main

(defparameter stories (list))

(let ((sentences (list)))
(loop while t do (let ((line (read-line)))
	(if (> (length line) 0)
		; then
		; (format t "~s~%~%" (sp line))
		(setf sentences (append sentences (list (schema-parse line))))
		; else
		(progn
			;(loop for sent in sentences
			;	do (format t "~s~%" sent)
			;)
			; (format t "~%~%~%~%~%")
			(format t "~s~%~%~%" sentences)
			(setf stories (append stories (list sentences)))
			(setf sentences (list))
		)
	)
)))

))
