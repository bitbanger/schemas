(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "new-ulf-parser.lisp")

(ll-load-subdir "stories" "roc-mcguffey-stories.lisp")
(ll-load-subdir "stories" "school-roc-stories.lisp")

(setf stories '((
	"My brother had a ball."
	"He threw it to my son."
	"My son could not catch it."
	"It rolled right past my son."
	"My son picked the ball up."
)))

(if nil
(loop for story in stories
	do (loop for pair in (len-ulfs-and-els story)
			; for sent in story
		; do (format t "sent:~%")
		; do (format t "	~s~%" sent)
		do (format t "ulf:~%")
		do (format t "	~s~%" (car pair))
		do (format t "el:~%")
		; do (format t "	~s~%" (second pair))
		do (loop for wff in (second pair)
			do (format t "	~s~%" wff)
			)
	)
)
)

(loop for story in *ROC*

do (block per-story


	(format t "~%~%~%ENGLISH:~%")
	(loop for sent in story
		do (format t "	~s~%" sent))

(setf pairs (len-ulfs-and-els story))
; (setf els (len-parse-sents story))
(setf ulfs (mapcar #'car pairs))
(setf els (mapcar #'second pairs))

(format t "ULF (parsed):~%")
(loop for ulf in ulfs
	do (format t "	~s~%" ulf)
)

(setf els (loop for sent in els append sent))

(format t "EL (converted):~%")
(loop for sent in els
	do (format t "	~s~%" sent)
)

(format t "ULF (converted back):~%")
(setf all-ulfs (list))

(setf events (loop for wff in els if (canon-charstar? wff) collect wff))

(defun now-rel? (phi)
	(has-element-pred phi (lambda (x)
		(and
			(symbolp x)
			(has-prefix? (string x) "NOW")
		)
	))
)

(setf story-skolems (dedupe (get-elements-pred els #'lex-skolem?)))
(setf event-skolems (dedupe (get-elements-pred (mapcar #'car events) #'lex-skolem?)))
(setf skolems (intersection story-skolems event-skolems :test #'equal))


(setf clean-story (filter-invalid-wffs (clean-idx-tags els)))
;(format t "clean story: ~s~%" clean-story)


(setf sk-map (make-hash-table :test #'equal))

;(format t "skolems: ~%")
(loop for sk in skolems
do (block unmake-sk
	(setf constraints
		(story-select-term-constraints
			clean-story
			(list (remove-idx-tag sk)))
	)

	;(format t "	~s~%" sk)
	(setf determiners (loop for c in constraints if (equal (prop-pred c) 'HAS-DET.PR) collect (second (car (prop-post-args c)))))
	(setf constraints (loop for c in constraints if
		(and
			(not (equal (prop-pred c) 'HAS-DET.PR))
			(equal (length c) 2)
			(equal (car c) sk)
		)
		 collect c))
	;(format t "	determiners: ~%")
	;(loop for d in determiners do (format t "		~s~%" d))
	;(format t "	constraints: ~%")
	;(loop for d in constraints do (format t "		~s~%" d))
	;(format t "lambda constraint: ~s~%" (lambdify-preds-with-sym! (mapcar #'second constraints) 'X))

	(setf sk-replacement sk)

	(if (>= (length constraints) 1)
		(progn
			; (setf lambda-pred (lambdify-preds-with-sym! (mapcar #'second constraints) 'X))
			(setf lambda-pred (append (list 'N+PREDS) (mapcar #'second constraints)))
			(if (equal (length constraints) 1)
				(setf lambda-pred (second (car constraints)))
			)

			(setf det (car determiners))
			(if (equal det 'THE_INV.DET)
				(setf det 'THE.D)
			)
			(if (null det)
				(setf det 'THE.D)
			)

			(setf sk-replacement (list det lambda-pred))
		)
	)

	; (format t "	-> ~s~%" (list det lambda-pred))
	(setf (gethash sk sk-map) sk-replacement)
)
)


(loop for event in events
	do (block get-time
		(setf ep (third event))
		(setf now-rels (get-elements-pred els
			(lambda (x) (and
				(canon-prop? x)
				(equal (car (prop-pre-args x)) ep) 
				(now-rel? x)
			))))
		(if (> (length now-rels) 1)
			(format t "too many now-rels for event ~s~%" event)
		)

		; turn all Skolems into lambdas

		; make the VP
		(setf time-idx (prop-pred (car now-rels)))

		(setf tense-mod 'PRES)

		(if (equal time-idx 'BEFORE)
			; then
			(setf tense-mod 'PAST)
		)
		(if (equal time-idx 'AFTER)
			; then
			(setf tense-mod '(PRES WILL.AUX-S))
		)

		(setf verb (prop-pred (car event)))
		(setf post-args (prop-post-args (car event)))
		(setf mods (prop-mods (car event)))

		(if (not (lex-verb? verb))
			; then
			(setf vp (list
						(car (prop-pre-args (car event))) 
						(append (list
							(list (list tense-mod 'BE.V) (render-pred verb post-args mods))))))
			; else
			(setf vp (list (car (prop-pre-args (car event))) (append (list (list tense-mod verb)) post-args mods)))
		)

		; Replace Skolems
		(loop for sk being the hash-keys of sk-map
			do (setf vp (replace-vals sk (gethash sk sk-map) vp))
		)

		
		(setf all-ulfs (append all-ulfs vp))
		(format t "	~s~%" vp)

	)

)

))
