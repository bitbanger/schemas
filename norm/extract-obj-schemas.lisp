(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "output5.lisp")
(ll-load "real_util.lisp")
(ll-load "norm-el.lisp")
(ll-load "norm-matcher.lisp")

(setf nouns (remove-duplicates (flatten (loop for match in matches
	collect (loop for rc in (section-formulas (get-section match ':Roles))
		collect (get-elements-pred rc 'lex-noun?)
	)
)) :test #'equal))

(setf gen-matches (loop for match in matches
	collect (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants match))))
))

(loop for m in gen-matches
	do (set (schema-pred m) m)
)

(format t "nouns: ~s~%" nouns)

(defun run (story)
(block outer
	(setf best-matches (top-k-el-story-matches story 30 (mapcar (lambda (x) (schema-pred x)) gen-matches) 3 1 nil))
	(loop for match in best-matches
		do (block pm
			(format t "~s:~%" (second match))
			(print-schema (car match))
		)
	)
	
	; (setf best-match (caar (top-k-el-story-matches story 30 (mapcar (lambda (x) (schema-pred x)) gen-matches) 5 1 nil)))
	(setf best-match (caar best-matches))
	; (format t "~s~%" best-match)
	(print-schema best-match)
	
	(format t "~s~%" (check-constraints best-match story))
)
)

(loop for noun in nouns
	do (format t "noun: ~s~%" noun)
	do (run (list (list (list 'O1.SK noun))))
	do (format t "~%~%")
)
