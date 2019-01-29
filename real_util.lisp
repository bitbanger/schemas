(defparameter *CANONICAL-HT*
	(make-hash-table :test #'equal)
)

(defun hashtablep (o)
	(equal
		(type-of o)
		(type-of *CANONICAL-HT*)
	)
)
