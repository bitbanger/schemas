(load "stories.lisp")
(load "parse.lisp")

(defparameter *KB* (make-hash-table :test #'equal))

(defun populate-kb (story kb)
	(loop for sent in story
		do (loop for wff in sent
			do (setf (gethash wff kb) t)
		)
	)
)

; Find all atemporal propositions about a term
(defun find-atemporal-about (term kb)
	(loop for wff being the hash-keys of kb
		if (and (unchar-wff? wff) (has-element wff term))
			collect wff
	)
)

(defun print-atemporals (term kb)
		(loop for wff in (find-atemporal-about term kb)
			do (format t "WFF: ~d~%~%" wff)
		)
)

(populate-kb play-sand *KB*)
(print-atemporals 'HE.PRO *KB*)
