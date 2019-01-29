(defparameter *CANONICAL-HT*
	(make-hash-table :test #'equal)
)

(defun hashtablep (o)
	(equal
		(type-of o)
		(type-of *CANONICAL-HT*)
	)
)

(defun verbp (x)
	(and
		(symbolp x)
		(equal
			".V"
			(subseq
				(string x)
				(- (length (string x)) 2)
				(length (string x))
			)
		)
	)
)

(defun print-ht (ht)
(cond
	((not (hashtablep ht)) (format t "	value ~s~%" ht))

	(t (loop for key being the hash-keys of ht
		do (format t "	~s: ~s~%" key (gethash key ht))
	))
)
)
