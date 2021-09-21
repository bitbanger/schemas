(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "ll-util.lisp")
(ll-load "schema-el-parser.lisp")
(ll-load "lenulf.lisp")

(defparameter *POSS-PRONOUNS* (mk-hashtable '(
	(HIS.PRO HE)
	(HER.PRO SHE)
	(THEIR.PRO THEY)
	(ITS.PRO IT)
	; (MY.PRO I)
	(OUR.PRO WE)
	(YOUR.PRO YOU)
	(HIS.D HE)
	(HER.D SHE)
	(THEIR.D THEY)
	(ITS.D IT)
	; (MY.D I)
	(OUR.D WE)
	(YOUR.D YOU)
)))

(defun poss-pronoun? (sym)
	(not (null (gethash (remove-idx-tag sym) *POSS-PRONOUNS*)))
)

(defun my-pronoun? (sym)
(or
	(equal (remove-idx-tag sym) 'MY.PRO)
	(equal (remove-idx-tag sym) 'MY.D)
)
)

(defun nominalize-poss-pronoun! (pro)
	(intern (format nil "~a$~a$.PRO"
		(if (my-pronoun? pro)
			; then
			'ME
			; else
			(gethash (remove-idx-tag pro) *POSS-PRONOUNS*)
		)
		(idx-tag-num pro)
	))
)

(defun tilde-tagged? (s)
(and
	(symbolp s)
	(equal 2 (length (split-str (string s) "~")))
	(is-num-str? (second (split-str (string s) "~")))
)
)

(defun get-tilde-tag (s)
	(if (tilde-tagged? s)
		; then
		(parse-integer (second (split-str (string s) "~")))
		; else
		nil
	)
)

(defun set-tilde-tag (s n)
	(if (tilde-tagged? s)
		; then
		(intern (format nil "~a~~~d" (car (split-str (string s) "~")) n))
		; else
		nil
	)
)

; increment-tilde-tags makes sure that periods get accounted for
; as tokens, for Allen coreference purposes.
(defun increment-tilde-tags (ulfs)
(let (new-ulf new-ulfs tts)
(block outer
	(setf new-ulfs (copy-item new-ulf))
	(loop for ulf in ulfs
		for sent-num from 0
		do (block inner
			(setf new-ulf (copy-item ulf))
			(setf tts (get-elements-pred ulf #'tilde-tagged?))
			(loop for tt in tts
				do (setf new-ulf (replace-vals
					tt
					(set-tilde-tag tt (+ sent-num (get-tilde-tag tt)))
					new-ulf
				))
			)
			(setf new-ulfs (append new-ulfs (list new-ulf)))
		)
	)

	(return-from outer new-ulfs)
)
)
)

(defun retag-tilde! (s)
(let* (
	(tsplit (split-str (string s) "~"))
	(psplit (split-str (car tsplit) "."))
	)
	(if (equal 2 (length psplit))
		; then
		(intern (format nil "~a$~d$.~a"
			(car psplit)
			(- (parse-integer (second tsplit)) 1)
			(second psplit)
		))
		; else
		(intern (car tsplit))
	)
)
)

(defun isnpreds? (s)
	(or (equal s 'n+preds) (equal s 'n+pred))
)

(defun untag (x)
	(if (tilde-tagged? x)
		; then
		(intern (car (split-str (string x) "~")))
		; else
		x
	)
)

(defun eq-untagged? (x target)
	(equal (untag x) (untag target))
)

(setf new-ulf-rules '(
; "Used to" should be handled at the ULF stage,
; not EL, because past-tense "use" is easier to
; identify here.
		; pattern
	(/
	(_*1 (PAST (!2 (ll-curry eq-untagged? USE.V))) ((!3 (ll-curry eq-untagged? TO)) _*4) _*5)
	; replacement
	(_*1 (PAST USED_TO.V) (!3 _*4) _*5)
	)

; N'T => NOT
	(/
		(ll-curry eq-untagged? N\'T.ADV)
		NOT
	)

; Replace all tilde-preds with $$-tagged ones.
		; pattern
	(/
	(!1 tilde-tagged?)
	; replacement
	(retag-tilde! !1)
	)

; Replace all possessive pronoun
; modifiers with lambdas.
		; pattern
	(/
	((!1 poss-pronoun?) _!2)
	; replacement
	(:Q THE.DET (:L X (:I (:I X _!2) AND (:I X PERTAIN-TO (nominalize-poss-pronoun! !1)))))
	)

	(/
		CAN
		CAN.MD
	)

	(/
		COULD
		(PAST CAN.MD)
	)

; Special case for MY.PRO, which Skolemizes
; in a scope-invariant way and needs the
; special THE_INV.DET determiner.
		; pattern
	(/
	((!1 my-pronoun?) _!2)
	; replacement
	(:Q THE_INV.DET (:L X (:I (:I X _!2) AND (:I X PERTAIN-TO (nominalize-poss-pronoun! !1)))))
	)

; Replace n+preds with a lambda.
		; pattern
	(/
	((!1 isnpreds?) _+2)
	; replacement
	(lambdify-preds-colon! (_+2))
	)

; Verb preds as first elements of lists get :p
		; pattern
	(/
	((!1 lex-verb?) _*2)
	; replacement
	(:P !1 _*2)
	)
))

(setf new-ulf-rules (curry-ttt-rules new-ulf-rules))

(defun is-name? (sym)
(or
	(not (null (member sym *male-names* :test #'equal)))
	(not (null (member sym *female-names* :test #'equal)))
)
)

(defun prepare-new-ulf-for-parser (ulf)
(let (new-ulf var-cursor)
(block outer
	(setf new-ulf (copy-item ulf))

	; Remove |.|
	(setf new-ulf (rec-remove new-ulf '|.|))

	; Tag names.
	(setf name-toks (get-elements-pred new-ulf (lambda (x) (and (symbolp x) (equal 2 (length (split-str (string x) "~"))) (is-name? (intern (car (split-str (string x) "~"))))))))
	(loop for name-tok in (remove-duplicates name-toks :test #'equal)
		do (block inner
			(setf name-spl (split-str (string name-tok) "~"))
			(setf new-ulf (replace-vals name-tok (intern (format nil "~a.NAME~~~d" (car name-spl) (second name-spl))) new-ulf))
		)
	)


	(setf new-ulf (unhide-ttt-ops (old-ttt:apply-rules new-ulf-rules
			(hide-ttt-ops new-ulf)
			:rule-order :slow-forward)))

	; Replace gensyms with better names.
	;(setf var-cursor "Y")
	;(loop for gs in (get-elements-pred new-ulf (lambda (x) (and (symbolp x) (equal 4 (length (string x))) (has-prefix? (string x) "G") (is-num-str? (remove-prefix (string x) "G")))))
	;	do (setf new-ulf (replace-vals gs (intern var-cursor) new-ulf))
	;	do (setf var-cursor (next-str var-cursor))
	;)

	; Apply missing keywords.
	(setf new-ulf (add-missing-keywords-to new-ulf))

	; Unwrap singletons.
	(block unwrap-singletons-outer
	(loop while t do (block unwrap-singletons-inner
		(setf singletons (get-elements-pred new-ulf
			(lambda (x) (and (listp x) (equal (length x) 1)
							(listp (car x))))))
		(if (null singletons)
			(return-from unwrap-singletons-outer))

		; Only replace one at a time, so order won't matter.
		(setf new-ulf (replace-vals (car singletons) (caar singletons) new-ulf))
	)))

	(return-from outer new-ulf)
)
)
)

(defparameter *KEYWORD-TAGS* '(
	:F
	:O
	:A
	:R
	:Q
	:P
	:I
))

(defun remove-ulf-tags (ulf)
(let (new-ulf)
(block outer
	(setf new-ulf (copy-item ulf))
	(loop for kw in *KEYWORD-TAGS*
		do (setf new-ulf (rec-remove new-ulf kw))
	)
	(return-from outer new-ulf)
)
))

;(loop for sent in sents
;	for new-ulf in new-ulfs
;do (format t "~s~%~%"
;	(parse-story-maybe-from-ulf
;		(list sent)
;		(list new-ulf)
;	)
;)
;)
(defun get-len-ulfs (sents)
(block outer
	(setf len-ulfs (len-ulfs-with-word-tags sents))
	(setf machine-ulfs (increment-tilde-tags len-ulfs))
	(setf machine-ulfs (mapcar #'prepare-new-ulf-for-parser machine-ulfs))
	(setf machine-ulfs (clean-idx-tags machine-ulfs))

	(loop for ulf in machine-ulfs
			for sent in sents
		do (format t "~s~%" sent)
		do (format t "~s~%~%" ulf)
	)

	(format t ";;;;;~%~%")
)
)

(defun len-ulfs (sents)
	(mapcar #'prepare-new-ulf-for-parser
		(increment-tilde-tags
			(len-ulfs-with-word-tags sents)))
)

(ldefun len-parse-sents (sents &optional only-canon)
(let ((ulfs))
(block outer
	(setf ulfs (len-ulfs sents))

	; (format t "ulfs: ~%")
	; (loop for ulf in ulfs
		; do (format t "	~s~%" ulf))

	(setf els (parse-story-maybe-from-ulf sents ulfs))
	(if only-canon
		; then
		(return-from outer (loop for sent in sents collect
			(loop for el in sent if (canon-prop? el) collect el)))
		; else
		(return-from outer els))
)
)
)

(ldefun full-debug-sents (sents)
(block outer
	(setf raw-len-ulfs (increment-tilde-tags (len-ulfs-with-word-tags sents)))

	(setf processed-len-ulfs (mapcar #'prepare-new-ulf-for-parser raw-len-ulfs))

	(setf el-parse-output (parse-story-maybe-from-ulf-full-output sents processed-len-ulfs))

	(return-from outer (append (list raw-len-ulfs) (list processed-len-ulfs) el-parse-output))
)
)

(defun len-ulfs-and-els (sents)
(let ((ulfs (len-ulfs sents)))
	; (list ulfs (parse-story-maybe-from-ulf sents ulfs))
	(loop for ulf in ulfs
		for el in (parse-story-maybe-from-ulf sents ulfs)
			collect (list ulf el)
	)
)
)
