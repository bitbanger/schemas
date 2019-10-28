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

	; Sometimes it tries to put preds in charstars.
	(/
		((!1 canon-pred?) [**] _!2)
		!1
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
	split-and-eps
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

(defparameter *EXISTENTIAL-SYMS* '(
	A.DET
	SOME
))

(defun process-construction (phi pred processor)
(block outer
	(setf phi-copy (copy-list phi))

	(block loop-outer
		(setf pairs nil)
		(loop while t do (block loop-inner
			(setf pairs (get-elements-pred-pairs phi-copy pred))

			(if (null pairs)
				(return-from loop-outer)
			)

			; The processor takes a pair and a formula and returns a new formula.
			(setf phi-copy (funcall processor (car pairs) phi-copy))
		))
	)

	(return-from outer phi-copy)
)
)

(defun skolem-sym-num (s)
(if (and
		(symbolp s)
		(> (length (string s)) 11)
		(equal "NEW-SKOLEM-" (subseq (string s) 0 11))
		(num-str? (subseq (string s) 11 (length (string s)))))
	; then
	(parse-integer (subseq (string s) 11 (length (string s))))
)
)

(defun skolem-sym? (s)
	(not (null (skolem-sym-num s)))
)

(defun get-highest-skolem-num (phi)
	(reduce #'max (append (list 0) (mapcar #'skolem-sym-num (remove-duplicates (get-elements-pred phi #'skolem-sym?)))))
)

(defun skolemize-adets-processor (pair phi)
(block outer
	(setf adet (car pair))
	(setf adet-idx (second pair))
	(setf atemporals (list))

	(setf skolem-placeholder-num (get-highest-skolem-num phi))

	(setf skolem-placeholder (intern (format nil "NEW-SKOLEM-~s" skolem-placeholder-num)))

	(setf skolem-placeholder-num (+ 1 skolem-placeholder-num))

	(setf adet-var (second adet))
	(setf adet-formulas (replace-vals adet-var skolem-placeholder (cddr adet)))

	; HANDLE (SOME E0 (E0 BEFORE NOW0) USE.V)

	; SOME quantifiers have restrictor matrices, which we can count as "adet formulas"
	; for the later replacement. We'll split by ANDs and mark each split formula down,
	; though, so that we can automatically determine that they should be added as
	; atemporals.
	(setf restrictors (list))
	(if (equal (car adet) 'SOME)
		; then
		(block handle-some
			(setf adet-formulas (replace-vals adet-var skolem-placeholder (cdddr adet)))
			(setf restrictors (replace-vals adet-var skolem-placeholder (split-lst (third adet) 'AND)))
			(setf adet-formulas (append adet-formulas restrictors))
		)
	)

	(setf final-adet-formulas (list))
	(loop for form in adet-formulas
		; TODO: better if condition here to identify atemporals
		do (if (or (and (listp form) (equal skolem-placeholder (car form))) (member form restrictors :test #'equal) )
			; then
			(setf atemporals (append atemporals (list form)))
			; else
			(setf final-adet-formulas (append final-adet-formulas (list form)))
		)
	)

	; Replace the adet
	(setf phi-copy (replace-element-idx phi adet-idx (and-chain final-adet-formulas)))



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

	(setf phi-copy (replace-vals skolem-placeholder new-skolem phi-copy))
	(return-from outer phi-copy)
)
)

(defun skolemize-adets (phi)
	(process-construction
		phi
		(lambda (x) (and (listp x) (> (length x) 1) (member (car x) *EXISTENTIAL-SYMS* :test #'equal)   ))
		#'skolemize-adets-processor)
)

; TODO: do this for > 2 and-chained props
(defun split-and-eps (phi)
(block outer
	(setf phi-copy (copy-list phi))
	(loop for e in phi do (block loop-outer
		(if (and
				(listp e)
				(canon-charstar? e)
				(lex-skolem? (third e))
				(listp (car e))
				(equal 3 (length (car e)))
				(equal 'AND.CC (second (car e)))
				(canon-prop? (car (car e)))
				(canon-prop? (third (car e))))
			; then
			(block loop-inner
				(setf ep (third e))
				(setf prop1 (car (car e)))
				(setf prop2 (third (car e)))
				(setf subep1 (new-skolem! "E"))
				(setf subep2 (new-skolem! "E"))
				(setf phi-copy (append (list (list subep1 'DURING ep)) phi-copy))
				(setf phi-copy (append (list (list subep2 'DURING ep)) phi-copy))
				(setf phi-copy (append (list (list subep1 'CONSEC subep2)) phi-copy))
				(setf phi-copy (remove e phi-copy :test #'equal))
				(setf phi-copy (append phi-copy (list (list prop1 '** subep1))))
				(setf phi-copy (append phi-copy (list (list prop2 '** subep2))))
			)
		)
	))

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

(defun process-stdin-story (story-processor-fn)
(block outer
	(let ((sentences (list)) (lines (list)))
	(loop while t do (let ((line (read-line)))
		(if (> (length line) 0)
			; then
			(progn
			(setf sentences (append sentences (list (schema-parse line))))
			(setf lines (append lines (list line)))
			)
			; else
			(progn
				(funcall story-processor-fn sentences lines)
				(setf sentences (list))
				(setf lines (list))
			)
		)
	)))
))

; (process-stdin-story (lambda (sents lines) (format t "~s~%~%~%" sents)))
