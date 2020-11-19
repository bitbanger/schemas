(declaim (sb-ext:muffle-conditions cl:warning))

(load "matcher.lisp")
(load "real_util.lisp")
(load "protoschemas.lisp")
(load "schema_util.lisp")
(load "stories.lisp")

(defun filter-for-sentences (story)
	(loop for canon-set in story
		append (loop for s in canon-set
			if (sent? s)
			collect (normalize-sent s)
		)
	)
)



(setf story1
	(filter-for-sentences may_story)
)

(format t "story:~%" story1)
(loop for sentence in story1
	do (format t "	~s~%" sentence)
)

(loop for protoschema in *PROTOSCHEMAS*
	do (match-story-with-schema story1 protoschema)
)

