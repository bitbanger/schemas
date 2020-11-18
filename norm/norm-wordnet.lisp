(load "ll-load.lisp")

(ll-load "real_util.lisp")
(ll-load "ll-cache.lisp")

(defparameter *WN-CACHE* (make-hash-table :test #'equal))
(defparameter *WN-FAILURE-VAL* '(|raceback| |(most| |recent| |call| |last)|))

(defun err-uncached-wordnet-hyps (word)
(let ((strm (sb-ext:process-output (sb-ext:run-program "/bin/python" (list "wordnet.py" (format nil "~s" word)) :output :stream :wait nil))))
(block outer
	; (format t "call here for ~s~%" word)
	(loop for line = (read-line strm nil)
		while line
		if (not (equal "" line))
		do (return-from outer (mapcar #'intern (split-str (subseq line 1 (- (length line) 1)) " ")))
	)
)
))

(defun batch-cache-preload-wordnet-hyps (words)
(let ((strm (sb-ext:process-output (sb-ext:run-program "/bin/python" (append (list "wordnet.py") (loop for w in words collect (format nil "~s" w))) :output :stream :wait nil))))
(block outer
	(setf results (list))
	(loop for line = (read-line strm nil)
		while line
		if (not (equal "" line))
		; do (format t "line: ~s~%" line)
		do (setf results (append results (list (mapcar #'intern (split-str (subseq line 1 (- (length line) 1)) " ")))))
	)

	(setf processed (list))
	(loop for res in results
		do (block nn
			(setf processed (append processed (list (car res))))
			; we're going to cheat and load the
			; cache up with preloaded results
			(ll-partial-cache-preloaded-result
				'uncached-wordnet-hyps
				(list (car res))
				(list (car res))
				256
				(cdr res)
			)
		)
	)

	; cache the unknown words, too
	(loop for word in words
		if (not (member word processed :test #'equal))
			; then
			do (ll-partial-cache-preloaded-result
				'uncached-wordnet-hyps
				(list word)
				(list word)
				256
				'(ENTITY.N)
			)
	)
)
))

(defun uncached-wordnet-hyps (word)
(let ((val (err-uncached-wordnet-hyps word)))
	(if (equal val *WN-FAILURE-VAL*)
		; then
		'(ENTITY.N)
		; else
		(cdr val)
	)
)
)

(defun wordnet-hypernyms (word)
	(ll-cache
		'uncached-wordnet-hyps
		(list word)
		256
	)
	;(block outer
	;	(if (not (symbolp word))
	;		; then
	;		(return-from outer '(ENTITY.N))
	;	)
;
;		(if (null (gethash word *WN-CACHE*))
;			; then
;			(setf (gethash word *WN-CACHE*) (uncached-wordnet-hyps word))
;		)
;
;		(return-from outer (gethash word *WN-CACHE*))
;	)
)
