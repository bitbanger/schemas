(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load-superdir "new-ulf-parser.lisp")

(setf sents (cdr sb-ext:*posix-argv*))

(setf ulfs (mapcar #'prepare-new-ulf-for-parser
	(increment-tilde-tags
		(len-ulfs-with-word-tags sents))))

(setf words-for-tags (make-hash-table :test #'equal))
(setf tagged-ulf-words (get-elements-pred ulfs (lambda (x) (and (symbolp x) (is-idx-tagged x)))))
(loop for word in tagged-ulf-words
	do (setf (gethash (get-idx-tag word) words-for-tags) word))

(print-ht words-for-tags)
