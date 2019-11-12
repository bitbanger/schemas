(setf *default-pathname-defaults* (truename "../"))

(load "schema-parser.lisp")
(load "norm-el.lisp")
(load "real_util.lisp")

(defun tab-wff (wff)
	(tab-all-lines 5 (format nil "~s" wff))
)

(defun fix-story (sents lines)
(block outer
	(setf ok-sents (list))
	(setf ok-lines (list))
	(loop for sent in sents
			for line in lines
		do (block inner

		(setf ok-wffs (list))
		(setf not-ok nil)

		; (format t "~%~%~s~%" line)
		(loop for wff in sent
			do (if (canon-prop? wff)
				; then
				(setf ok-wffs (append ok-wffs (list wff)))
				; else
				(setf not-ok t)

				;(+ 1 2)
				; (format t "				~a~%" (tab-wff wff))
				; (format t "~s~%~%" wff)
				; else
				; (format t "			~s~%" wff)
			)
		)

		(if (not not-ok)
			; then
			(progn
			(setf ok-sents (append ok-sents (list ok-wffs)))
			(setf ok-lines (append ok-lines (list line)))
			)
		)
	)
	)

	(if (not (null ok-sents))
		; then
		(block print-story
			(format t "	(~%")
			(loop for sent in ok-sents
					for line in ok-lines
				do (format t "		( ; ~s~%" line)
				do (loop for wff in sent
					do (format t "			~s~%" wff)
				)
				do (format t "		)~%")
			)
			(format t "	)~%~%")
		)
	)
)
)

(format t "(defparameter PARSED-FR-STORIES '(~%")
(process-stdin-story #'fix-story t)
(format t ")~%")
