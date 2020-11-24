(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "ll-util.lisp")
(ll-load "schema-el-parser.lisp")
(ll-load "lenulf.lisp")
(ll-load-subdir "stories" "roc-mcguffey-stories.lisp")
(ll-load-subdir "stories" "school-roc-stories.lisp")

(defparameter *USE-DEBUG-STORIES* t)

(defparameter *SHUFFLE-STORIES* t)

(defparameter *HANDLE-ERRORS* nil)

(setf sents '(
	; "Tom used to have his own boat."
	; "He had to sell it."
	; "Now he just comes out on my boat."
	; "We have such a great time together."
	; "Now I have someone to help me clean my boat."
	"Today we were playing outside."
	"We saw a lot of dark clouds in the sky."
	"It looked like a storm was coming."
	"We had to go inside to be safe."
	"It didn't rain after all, so we went back outside!"
))

(defparameter *POSS-PRONOUNS* (mk-hashtable '(
	(HIS.PRO HE)
	(HER.PRO SHE)
	(THEIR.PRO THEY)
	(ITS.PRO IT)
	; (MY.PRO I)
	(OUR.PRO WE)
)))

(defun poss-pronoun? (sym)
	(not (null (gethash (remove-idx-tag sym) *POSS-PRONOUNS*)))
)

(defun my-pronoun? (sym)
	(equal (remove-idx-tag sym) 'MY.PRO)
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


	(setf new-ulf (unhide-ttt-ops (ttt:apply-rules new-ulf-rules
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

(defun len-parse-sents (sents)
(block outer
	(setf len-ulfs (len-ulfs-with-word-tags sents))
	(setf machine-ulfs (increment-tilde-tags len-ulfs))
	(setf machine-ulfs (mapcar #'prepare-new-ulf-for-parser machine-ulfs))

	(loop for sent in (parse-story-maybe-from-ulf sents machine-ulfs)
	; (loop for sent in (parse-story sents)
		for len-ulf in len-ulfs
		for machine-ulf in machine-ulfs
		for txt in sents
		do (format t "sentence: ~s~%" txt)
		; do (format t "Len's ULF:~%     ~s~%" len-ulf)
		; do (format t "Hand-converted Len ULF fed to parser:~%     ~s~%" new-ulf)
		do (format t "Machine-converted Len ULF fed to parser:~%~s~%" machine-ulf)
		do (format t "EL conversion from parser:~%")
		do (loop for wff in sent
			
			do (format t "     ~s~%" wff)
			do (format t "          ~s~%" (if (canon-prop? wff) "valid" "invalid"))
		)
		do (format t "~%~%--------~%")
	)
)
)

(setf stories *ROC*)

(if *USE-DEBUG-STORIES*
	; then
	(setf stories '((
		"Allie wanted an iPad."
		"She really liked it."
		"But she wanted a new one."
		"So she went to the store."
		"When she got back she had a newer one."
	)))
)

(if *SHUFFLE-STORIES*
	; then
	(setf stories (shuffle stories))
)

(loop for story in stories
	if *HANDLE-ERRORS*
		do (handler-case (len-parse-sents story)
				(error ()
					(format t "; error processing story:~%")
					(loop for sent in story
						do (format t ";	~s~%" sent)
					)
				))
	if (not *HANDLE-ERRORS*)
		do (len-parse-sents story)
)
