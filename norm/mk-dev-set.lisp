(load "ll-load.lisp")

(ll-load "firstreaders.lisp")
(ll-load "real_util.lisp")

(setf *random-state* (make-random-state t))

(defun wff-count (stories)
(let ((wc 0))
(block outer
	(loop for story in stories
		do (loop for sent in story
			do (setf wc (+ wc (- (length sent) 1)))
		)
	)

	(return-from outer wc)
)
) 
)

(setf shuff (shuffle PARSED-FR-STORIES))
(setf dev-set (subseq shuff 0 78))
(setf test-set (subseq shuff 78 (length shuff)))


(defun pretty-print-set (story-set name)
(block outer
	(format t "(defparameter ~s '(~%" name)
	(loop for story in story-set
		do (block pretty-story
			(format t "	(~%")
			(loop for sent in story
				do (block pretty-sent
					(format t "		( ; ~s~%" (car sent))
					(loop for wff in (cdr sent)
						do (block pretty-wff
							(format t "			~s~%" wff)
						)
					)
					(format t "		)~%")
				)
			)
			(format t "	)~%~%")
		)
	)
	(format t "))~%")

	(format t "; ~s WFFs, ~s total (~s%)~%" (wff-count dev-set) (wff-count PARSED-FR-STORIES) (* 100 (/ (float (wff-count dev-set)) (float (wff-count PARSED-FR-STORIES)))))
)
)

(pretty-print-set dev-set "*DEV-FRS*")
(pretty-print-set test-set "*TEST-FRS*")

