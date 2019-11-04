(setf *default-pathname-defaults* (truename "../"))

(load "schema-parser.lisp")
(load "norm-el.lisp")
(load "real_util.lisp")

(defun tab-wff (wff)
	(tab-all-lines 5 (format nil "~s" wff))
)

(defun fix-story (sents lines)
(block outer
	(loop for sent in sents
			for line in lines
		do (block inner

		(if (loop for wff in sent thereis (not (canon-prop? wff)))
			; then
			(format t "~%~%~s~%" line)
			; (return-from inner)
			; else
			(format t "~%~%~s~%" line))
		(loop for wff in sent
			do (if (not (canon-prop? wff))
				; then
				;(+ 1 2)
				;(format t "				~a~%" (tab-wff wff))
				(format t "~s~%~%" wff)
				; else
				(format t "~s~%~%" wff)
			)
		)
	))
)
)

(process-stdin-story #'fix-story t)
