(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "new-ulf-parser.lisp")

(ll-load-subdir "stories" "roc-mcguffey-stories.lisp")
(ll-load-subdir "stories" "school-roc-stories.lisp")

(load "~/quicklisp/setup.lisp")
(ql:register-local-projects)
(ql:quickload "py4cl")
(ql:quickload "ttt")
(setf py4cl:*python-command* "/usr/local/opt/python@3.8/bin/python3.8")
(ql:quickload "ulf2english")
(ql:quickload "standardize-ulf")
(use-package :standardize-ulf)

(defparameter *EL-TO-ULF-MAIN* nil)

(defparameter *SHOW-ENG* t)
(defparameter *SHOW-ULF* nil)
(defparameter *SHOW-EL* t)
(defparameter *SHOW-BACK-ULF* nil)
(defparameter *SHOW-BACK-ENG* t)

(defun now-rel? (phi)
	(has-element-pred phi (lambda (x)
		(and
			(symbolp x)
			(has-prefix? (string x) "NOW")
		)
	))
)

(defun var-to-sk (var)
(block outer
	(if (not (varp var))
		; then
		(return-from outer var)
	)

	(return-from outer (intern (concat-strs (remove-prefix (format nil "~s" var) "?") ".SK")))
)
)

(defun vars-to-sks (form)
(let ((all-vars))
(block outer
	(if (not (listp form))
		(return-from outer (var-to-sk form))
	)

	(setf all-vars (dedupe (get-elements-pred form #'varp)))
	(loop for var in all-vars
		do (setf form (replace-vals var (var-to-sk var) form))
	)

	(return-from outer form)
)
)
)

(defun el-to-ulf (els)
(block outer
(setf all-ulfs (list))

(setf els (vars-to-sks els))
(setf lambdas (get-elements-pred els (lambda (x) (and (canon-lambda? x) (not (canon-n-preds? x))))))
(loop for lam in lambdas
	do (setf els (replace-vals lam
							(append (list 'N+PREDS) (mapcar #'prop-pred (split-conjunction (third lam)))) els)))

(setf events (loop for wff in els if (canon-charstar? wff) collect wff))

(setf story-skolems (dedupe (get-elements-pred els #'lex-skolem?)))
(setf event-skolems (dedupe (get-elements-pred (mapcar #'car events) #'lex-skolem?)))
; (setf skolems (intersection story-skolems event-skolems :test #'equal))
(setf skolems story-skolems)

(setf skolems (vars-to-sks skolems))

; (format t "events: ~s~%" events)


(setf clean-story (vars-to-sks (filter-invalid-wffs (clean-idx-tags els))))
; (format t "clean story: ~s~%" clean-story)


(setf sk-map (make-hash-table :test #'equal))

; (format t "skolems: ~%")
(loop for sk in skolems
do (block unmake-sk
	; (format t "looking for constraints matching clean skolem ~s~%" (remove-idx-tag sk))
	(setf constraints
		(story-select-term-constraints
			clean-story
			(list (remove-idx-tag sk)))
	)

	; (format t "	~s~%" sk)
	; (format t "constraints: ~s~%" constraints)
	(setf determiners (loop for c in constraints if (and (canon-prop? c) (equal (prop-pred c) 'HAS-DET.PR)) collect (second (car (prop-post-args c)))))
	(setf constraints (loop for c in constraints if
		(and
			(canon-prop? c)
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

	(if (and (equal (length constraints) 1) (canon-lambda? (second (car constraints))))
		; then
		(progn
			(setf sk-replacement (append (list 'N+PREDS)
								(mapcar #'prop-pred (split-conjunction (third (second (car constraints)))))))
			; (format t "replacing with ~s~%" sk-replacement)
		)
	)

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
				(setf det 'A.D)
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
		(setf tense-mod 'PRES)
		(setf time-idx nil)
		(if (canon-prop? (car now-rels))
			(setf time-idx (prop-pred (car now-rels)))
		)



		(if (equal time-idx 'BEFORE)
			; then
			(setf tense-mod 'PAST)
		)
		(if (equal time-idx 'AFTER)
			; then
			(setf tense-mod '(PRES WILL.AUX-S))
		)

		(if (not (canon-prop? (car event)))
			(return-from get-time)
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
			; do (format t "before: ~s~%" vp)
			do (setf vp (replace-vals sk (gethash sk sk-map) vp))
			; do (format t "after: ~s~%" vp)
		)

		; Second pass, in case some Skolems were in replacements.
		(loop for sk being the hash-keys of sk-map
			; do (format t "before: ~s~%" vp)
			do (setf vp (replace-vals sk (gethash sk sk-map) vp))
			; do (format t "after: ~s~%" vp)
		)

		(setf vp (replace-vals 'PERTAIN-TO 'of.p vp))
		
		(setf all-ulfs (append all-ulfs (list vp)))
		; (format t "	~s~%" vp)

	)

)
		(return-from outer all-ulfs)
))

(defun ulf-to-eng (ulf)
	(ulf2english:ulf2english (standardize-ulf ulf :pkg :ulf2english))
)

(defun el-to-eng (els)
	(mapcar #'ulf-to-eng
		(el-to-ulf els))
)

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


(if *EL-TO-ULF-MAIN* (block main-program
	(loop for story in (append (list (list "She felt dizzy.")) *ROC*)

	do
		; (handler-case
		(block per-story


	(if *SHOW-ENG* (progn
		(format t "~%~%~%ENGLISH:~%")
		(loop for sent in story
			do (format t "	~s~%" sent))
	))

	(setf pairs (len-ulfs-and-els story))
	; (setf els (len-parse-sents story))
	(setf ulfs (mapcar #'car pairs))
	(setf els (mapcar #'second pairs))

	(if *SHOW-ULF* (progn
		(format t "ULF (parsed):~%")
		(loop for ulf in ulfs
			do (format t "	~s~%" ulf)
		)
	))

	(setf els (loop for sent in els append sent))

	(if *SHOW-EL* (progn

		(setf print-els (loop for el in els if (canon-prop? el) collect el))

		(setf charstars (loop for el in print-els if (canon-charstar? el) collect el))
		(setf times (loop for el in print-els if (time-prop? el) collect el))
		(setf constrs (loop for el in print-els if (and (not (has-element el 'HAS-DET.PR)) (not (has-element el 'ORIENTS))) collect el))
		(setf constrs (set-difference constrs times :test #'equal))
		(setf constrs (set-difference constrs charstars :test #'equal))

		(setf print-els (append constrs charstars))

		(format t "EL (converted):~%")
		(loop for sent in print-els
			do (format t "	~s~%" sent)
		)
	))

	(setf converted-ulfs (el-to-ulf els))
	(if *SHOW-BACK-ULF* (progn
		(format t "ULF (converted back):~%")
		(loop for ulf in converted-ulfs
			do (format t "		~s~%" ulf)
		)
	))

	(if *SHOW-BACK-ENG* (progn
		(format t "ENGLISH (converted back):~%")
		(loop for ulf in converted-ulfs
			do (handler-case (format t "	~s~%" (ulf-to-eng ulf)) (error () (format t "; ulf2english error~%")))
			; do (format t "	~s~%" (ulf2english:ulf2english (standardize-ulf ulf :pkg :ulf2english)))
			; do (format t "	~s~%" (ulf2english:ulf2english ulf))
		)
	))

	)

;(error () (progn
		;(format t "parser crashed on story :(~%")
;))

)
)
)

