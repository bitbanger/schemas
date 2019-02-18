(defparameter *DBG-TAGS* (list
	; put debug tags you want here
	;'matched-wffs
	;'process-story
	'cur1
))

(defparameter *DBG-ALL* nil)

(defparameter *CANONICAL-HT*
	(make-hash-table :test #'equal)
)

(defun varp (v)
	(cond
		((not (symbolp v)) nil)
		((not (> (length (string v)) 1)) nil)
		((not (equal "?" (subseq (string v) 0 1))) nil)
		(t t)
	)
)

(defun ht-copy (ht)
(block outer
	(if (not (hashtablep ht))
		nil
	)

	(setf new-ht (make-hash-table :test #'equal))

	(loop for key being the hash-keys of ht
		do (setf (gethash key new-ht) (gethash key ht))
	)

	(return-from outer new-ht)
)
)

(defun ht-eq-oneway (ht1 ht2)
	(loop for key being the hash-keys of ht1
		always (equal (gethash key ht1) (gethash key ht2))
	)
)

(defun dbg (tag fmt-str &rest args)
	(if (or *DBG-ALL* (member tag *DBG-TAGS*))
		(apply #'format (append (list t fmt-str) args))
	)
)

(defun ht-eq (ht1 ht2)
(cond

	((and (hashtablep ht1) (not (hashtablep ht2)))
		nil)
	((and (hashtablep ht2) (not (hashtablep ht1)))
		nil)

	((and (not (hashtablep ht1)) (not (hashtablep ht2)))
		(equal ht1 ht2)
	)

	((and
		(ht-eq-oneway ht1 ht2)
		(ht-eq-oneway ht2 ht1)
	) t)

	(t nil)
)
)

(defun mk-hashtable (pairs)
(cond
	((equal pairs t) t)

	((null pairs) nil)

	(t (progn
		(setf want-bind (make-hash-table :test #'equal))
		(loop for pair in pairs
			do (setf (gethash (car pair) want-bind) (second pair))
		)
		want-bind
	))
)
)

(defun same-list-unordered (l1 l2)
	(and
		(listp l1)
		(listp l2)
		(equal (length l1) (length l2))
		(loop for e in l1
			always (member e l2)
		)
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

(defun hashtablep (o)
	(equal
		(type-of o)
		(type-of *CANONICAL-HT*)
	)
)

(defun print-ht (ht)
	(format t "~s" (ht-to-str ht))
)

(defun ht-to-str (ht)
(format nil "~{~A~^~%, ~}"
		(cond
			((not (hashtablep ht)) (list (format nil "	value ~s~%" ht)))

			(t (loop for key being the hash-keys of ht
				collect (format nil "	~s: ~s~%" key (gethash key ht))
			))
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
