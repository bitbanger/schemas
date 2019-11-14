(load "real_util.lisp")

(defparameter *WN-CACHE* (make-hash-table :test #'equal))
(defparameter *WN-FAILURE-VAL* '(|raceback| |(most| |recent| |call| |last)|))

(defun err-uncached-wordnet-hyps (word)
(let ((strm (sb-ext:process-output (sb-ext:run-program "/bin/python" (list "wordnet.py" (format nil "~s" word)) :output :stream :wait nil))))
(block outer
	(loop for line = (read-line strm nil)
		while line
		do (return-from outer (mapcar #'intern (split-str (subseq line 1 (- (length line) 1)) " ")))
	)
)
))

(defun uncached-wordnet-hyps (word)
(let ((val (err-uncached-wordnet-hyps word)))
	(if (equal val *WN-FAILURE-VAL*)
		; then
		'(ENTITY.N)
		; else
		val
	)
)
)

(defun wordnet-hypernyms (word)
	(block outer
		(if (not (symbolp word))
			; then
			(return-from outer '(ENTITY.N))
		)

		(if (null (gethash word *WN-CACHE*))
			; then
			(setf (gethash word *WN-CACHE*) (uncached-wordnet-hyps word))
		)

		(return-from outer (gethash word *WN-CACHE*))
	)
)
