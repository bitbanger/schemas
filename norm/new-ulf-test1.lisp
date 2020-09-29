(declaim (sb-ext:muffle-conditions cl:warning))

(load "real_util.lisp")
(load "schema-parser.lisp")

(setf sents '(
	"Tom used to have his own boat."
	"He had to sell it."
	"Now he just comes out on my boat."
	"We have such a great time together."
	"Now I have someone to help me clean my boat."
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
		(intern (format nil "~a$~a$.~d"
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

(defun prepare-new-ulf-for-parser (ulf)
(let (new-ulf var-cursor)
(block outer
	(setf new-ulf (copy-item ulf))

	; Remove |.|
	(setf new-ulf (rec-remove new-ulf '|.|))


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

; (format t "~s~%" (prepare-new-ulf-for-parser '(IT.PRO (BE.V (A.DET (N+PREDS BABY.N (LOVE.V (PLUR DOG.N))))))))

(setf len-ulfs
'(
(TOM.NAME~1 ((PAST USE.V~2) (TO~3 (HAVE.V~4 (HIS.PRO~5 (OWN.A~6 BOAT.N~7)))))
      |.|)
(HE.PRO~8 (HAD.AUX~9 (TO~10 (SELL.V~11 IT.PRO~12))) |.|)
(NOW.ADV~13 HE.PRO~14 JUST.ADV~15
      ((PRES COME.V~16) OUT.PRT~17 (ON.P~18 (MY.PRO~19 BOAT.N~20))) |.|)
(WE.PRO~21
      (HAVE.AUX~22
       (SUCH.D~23 (GREAT.A~25 (N+PREDS TIME.N~26 TOGETHER.ADV~27))))
      |.|)
(NOW.ADV~28 I.PRO~29
      (HAVE.AUX~30
       (SOME.D
        (N+PRED PERSON.N~31
         (TO~32 (HELP.V~33 (ME.PRO~34 (CLEAN.V~35 (MY.PRO~36 BOAT.N~37))))))))
      |.|)
))

(setf new-ulfs
'(


(:I TOM$0$.NAME (:F (:O PAST USE$1$.V) (:F KA (HAVE$3$.V (:Q THE.DET (:L X (:I (:I X (:F OWN$5$.A BOAT$6$.N)) AND (:I X PERTAIN-TO HE$4$.PRO))))))))



(:I HE$0$.PRO (:F (:O PAST HAVE$1$.V) (:F KA (SELL$3$.V IT$4$.PRO))))



(:I HE$1$.PRO (:F NOW$0$.ADV (:F JUST$2$.ADV (:P (:F OUT$4$.ADV (:O PRES COME$3$.V) (:R (:P ON$5$.P (:Q THE.DET (:L X (:I (:I X BOAT$7$.N) AND (:I X PERTAIN-TO ME$6$.PRO)))))))))))



(:I WE$0$.PRO (:P (:O PRES HAVE$1$.V) (:Q A$3$.DET (:F (SUCH$2$.ADV GREAT$4$.A) (:L X (:I (:I X TIME$6$.N) AND (:I X TOGETHER$7$.ADV)))))))



(:I I$1$.PRO (:F NOW$0$.ADV (:P (:O PRES HAVE$2$.AUX) (:Q SOME$3$.D (:L X (:I (:I X PERSON$5$.N) AND (:I X (:P FOR.P (:F KA (HELP$7$.V (:I ME$8$.PRO (:P CLEAN$9$.V (:Q THE.DET (:L Y (:I (:I Y BOAT$11$.N) AND (:I Y PERTAIN-TO ME$10$.PRO))))))))))))))))


;((K TODAY.N~2) WE.PRO~3 (WERE.AUX~4 ((PROG PLAY.V~5) OUTSIDE.ADV~6)) |.|)


;(WE.PRO~1
;      ((PAST SEE.V~2)
;       (A.D~3 (N+PRED LOT.N~5 (OF.P~6 (K (DARK.A~8 (PLUR CLOUD.N~9))))))
;       (IN.P~10 (THE.D~11 SKY.N~12)))
;      |.|)


;(IT.PRO~1
;      ((PAST LOOK.V~2)
;       (LIKE.P~3 ((A.D~4 STORM.N~5) (WAS.AUX~6 (PROG COME.V~7)))))
;      |.|)


;(WE.PRO~1
;      (HAD.AUX~2 (TO~3 (GO.V~4 INSIDE.ADV~5 (TO~6 (BE.AUX~7 SAFE.A~8))))) |.|)


;((IT.PRO~1 (DID.AUX~2 |N'T.ADV~3| (RAIN.V~4 (AFTER.P~5 ALL.D~6)))) |,|
;      SO.CC~7 (WE.PRO~8 ((PAST GO.V~9) BACK.ADV~10 OUTSIDE.ADV~11)) !)


;(TODAY.ADV~1 I.PRO~2 ((PAST SEE.V~3) (A.D~4 (BABY.N~5 BIRD.N~6))) |.|)


;((THE.D~1 BIRD.N~2) (WAS.AUX~3 (IN.P~4 (A.D~5 TREE.N~6))) |.|)


;((THE.D~1 (MOTHER.N~2 BIRD.N~3))
;      (WAS.AUX~4 ((PROG TEACH.V~5) (THE.D~6 (BABY.N~7 BIRD.N~8)))) |.|)


;(SHE.PRO~1
;      ((PAST DROP.V~2) (THE.D~3 BIRD.N~4)
;       (OUT.P~5 (OF.P~6 (THE.D~7 NEST.N~8))))
;      |.|)


;((THE.D~1 (BABY.N~2 BIRD.N~3)) ((PAST FLY.V~4) AWAY.ADV~5) |.|)


;((THE.D~1 ORANGE.N~2) ((PAST FALL.V~3) (FROM.P~4 (THE.D~5 TREE.N~6))) |.|)


;(IT.PRO~1 ((PAST HIT.V~2) (A.D~3 GIRL.N~4) (ON.P~5 (THE.D~6 HEAD.N~7)))
;      |.|)


;((THE.D~1 GIRL.N~2) ((PAST LOOK.V~3) UP.PRT~4 (AT.P~5 (THE.D~6 TREE.N~7)))
;      |.|)


;((ANOTHER.D~1 ORANGE.N~2) ((PAST FALL.V~3) (FROM.P~4 (THE.D~5 TREE.N~6)))
;      |.|)


;((THAT.D~1 ORANGE.N~2) ((PAST BREAK.V~3) (HER.PRO~4 NOSE.N~5)) |.|)

))

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

(setf machine-ulfs (increment-tilde-tags len-ulfs))
(setf machine-ulfs (mapcar #'prepare-new-ulf-for-parser machine-ulfs))

(loop for sent in (parse-story-maybe-from-ulf sents machine-ulfs)
	for len-ulf in len-ulfs
	for new-ulf in new-ulfs
	for machine-ulf in machine-ulfs
	for txt in sents
	do (format t "sentence: ~s~%" txt)
	; do (format t "Len's ULF:~%     ~s~%" len-ulf)
	; do (format t "Hand-converted Len ULF fed to parser:~%     ~s~%" new-ulf)
	; do (format t "Machine-converted Len ULF fed to parser:~%~s~%" machine-ulf)
	do (format t "EL conversion from parser:~%")
	do (loop for wff in sent
		
		do (format t "     ~s~%" wff)
		do (format t "          ~s~%" (if (canon-prop? wff) "valid" "invalid"))
	)
	do (format t "~%~%")
)
