(declaim (sb-ext:muffle-conditions cl:warning))

(load "output5.lisp")
(load "real_util.lisp")
(load "norm-el.lisp")
(load "norm-match.lisp")

(setf nouns (remove-duplicates (flatten (loop for match in matches
	collect (loop for rc in (section-formulas (get-section match ':Roles))
		collect (get-elements-pred rc 'lex-noun?)
	)
)) :test #'equal))

(setf gen-matches (loop for match in matches
	collect (clean-do-kas (rename-constraints (sort-steps (generalize-schema-constants match))))
))

(loop for m in gen-matches
	do (set (second (car (second m))) m)
)

(format t "nouns: ~s~%" nouns)

(setf story '(
	(
		(OAK.SK TREE.N)
	)
))

(setf best-match (caar (top-k-story-matches story 30 (mapcar (lambda (x) (second (car (second x)))) gen-matches) 5 nil 3)))
(format t "~s~%" best-match)

(format t "~s~%" (check-constraints best-match story))
