(declaim (sb-ext:muffle-conditions cl:warning))

(load "real_util.lisp")
(load "schema-parser.lisp")

(setf sents '(
	"Tom used to have a boat."
	"He had to sell it."
	"Now he just comes out on my boat."
	"We have such a great time together."
	"Now I have someone to help me clean my boat."
))

(defparameter *POSS-PRONOUNS* (mk-hashtable '(
	(HIS.PRO HE.PRO)
	(HER.PRO SHE.PRO)
	(THEIR.PRO THEY.PRO)
	(ITS.PRO IT.PRO)
	(MY.PRO I.PRO)
	(OUR.PRO WE.PRO)
)))

(defun poss-pronoun? (sym)
	(not (null (gethash sym *POSS-PRONOUNS*)))
)

(defun nominalize-poss-pronoun! (pro)
	(gethash pro *POSS-PRONOUNS*)
)

(defun tilde-tagged? (s)
(and
	(symbolp s)
	(equal 2 (length (split-str (string s) "~")))
	(is-num-str? (second (split-str (string s) "~")))
)
)

(defun retag-tilde! (s)
(let* (
	(tsplit (split-str (string s) "~"))
	(psplit (split-str (car tsplit) "."))
	)
	(if (equal 2 (length psplit))
		; then
		(intern (format nil "~a$~a$.~a"
			(car psplit)
			(second tsplit)
			(second psplit)
		))
		; else
		(intern (car tsplit))
	)
)
)

(defun prepare-new-ulf-for-parser (ulf)
(let (new-ulf)
(block outer
	(setf new-ulf (copy-item ulf))
	; First, replace all possessive pronoun
	; modifiers with lambdas.
	(setf new-ulf (ttt-replace new-ulf
		; pattern
		'((!1 poss-pronoun?) _!2)
		; replacement
		'(:Q THE.DET (:L X (:I (:I X (:F _!2)) AND (:I X PERTAIN-TO (nominalize-poss-pronoun! !1)))))
	))

	; Replace all tilde-preds with $$-tagged ones.
	(setf new-ulf (ttt-replace new-ulf
		; pattern
		'(!1 tilde-tagged?)
		; replacement
		'(retag-tilde! !1)
	))

	; Remove |.|
	(setf new-ulf (rec-remove new-ulf '|.|))

	; Next, replace n+preds with a lambda.
	(setf new-ulf (ttt-replace new-ulf
		; pattern
		'(N+PREDS _+1)
		; replacement
		'(lambdify-preds-colon! (_+1))
	))

	; Finally, apply missing keywords.
	(setf new-ulf (add-missing-keywords-to new-ulf))
	

	(return-from outer new-ulf)
)
)
)

; (format t "~s~%" (prepare-new-ulf-for-parser '(IT.PRO (BE.V (A.DET (N+PREDS BABY.N (LOVE.V (PLUR DOG.N))))))))

(setf len-ulfs
'(
(TOM~1 ((PAST USE.V~2) (TO~3 (HAVE.V~4 (HIS.PRO~5 (OWN.A~6 BOAT.N~7)))))
      |.|)
(HE.PRO~1 (HAD.AUX~2 (TO~3 (SELL.V~4 IT.PRO~5))) |.|)
(NOW.ADV~1 HE.PRO~2 JUST.ADV~3
      ((PRES COME.V~4) OUT.PRT~5 (ON.P~6 (MY.PRO~7 BOAT.N~8))) |.|)
(WE.PRO~1
      (HAVE.AUX~2
       (SUCH.D~3 A.D~4 (GREAT.A~5 (N+PREDS TIME.N~7 TOGETHER.ADV~8))))
      |.|)
(NOW.ADV~1 I.PRO~2
      (HAVE.AUX~3
       (SOME.D~4
        (N+PRED PERSON.N~6
         (TO~7 (HELP.V~8 (ME.PRO~9 (CLEAN.V~10 (MY.PRO~11 BOAT.N~12))))))))
      |.|)
))

(setf new-ulfs
'(


(:I TOM$0$.NAME (:F (:O PAST USE$1$.V) (:F KA (HAVE$3$.V (:Q THE.DET (:L X (:I (:I X (:F OWN$5$.A BOAT$6$.N)) AND (:I X PERTAIN-TO HE$4$.PRO))))))))



(:I HE$0$.PRO (:F (:O PAST HAVE$1$.V) (:F KA (SELL$3$.V IT$4$.PRO))))



(:I HE$1$.PRO (:F NOW$0$.ADV (:F JUST$2$.ADV (:P (:F OUT$4$.ADV (:O PRES COME$3$.V) (:R (:P ON$5$.P (:Q THE.DET (:L X (:I (:I X BOAT$7$.N) AND (:I X PERTAIN-TO ME$6$.PRO)))))))))))



(:I WE$0$.PRO (:P (:O PRES HAVE$1$.V) (:Q A$3$.DET (:F (SUCH$2$.ADV GREAT$4$.A) (:L X (:I (:I X TIME$6$.N) AND (:I X TOGETHER$7$.ADV)))))))



(:I I$1$.PRO (:F NOW$0$.ADV (:P (:O PRES HAVE$2$.AUX) (:Q SOME$3$.D (:L X (:I (:I X PERSON$5$.N) AND (:I X (:P FOR.P (:F KA (HELP$7$.V (:I ME$8$.PRO (:P CLEAN$9$.V (:Q THE.DET (:L X (:I (:I X BOAT$11$.N) AND (:I X PERTAIN-TO ME$10$.PRO))))))))))))))))


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









;(loop for sent in sents
;	for new-ulf in new-ulfs
;do (format t "~s~%~%"
;	(parse-story-maybe-from-ulf
;		(list sent)
;		(list new-ulf)
;	)
;)
;)

(loop for sent in (parse-story-maybe-from-ulf sents new-ulfs)
	for len-ulf in len-ulfs
	for new-ulf in new-ulfs
	for txt in sents
	do (format t "sentence: ~s~%" txt)
	do (format t "Len's ULF:~%     ~s~%" len-ulf)
	do (format t "Hand-converted Len ULF fed to parser:~%     ~s~%" new-ulf)
	do (format t "Machine-converted Len ULF fed to parser:~%~s~%" (prepare-new-ulf-for-parser len-ulf))
	do (format t "EL conversion from parser:~%")
	do (loop for wff in sent
		
		do (format t "     ~s~%" wff)
	)
	do (format t "~%~%")
)
