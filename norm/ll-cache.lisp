(load "real_util.lisp")

(defparameter *CACHE-MRUS* (make-hash-table :test #'equal))
(defparameter *CACHE-TABLES* (make-hash-table :test #'equal))

(defun ll-cached (fn-name arg-list size)
	(ll-partial-cached fn-name arg-list arg-list size)
)

(defun ll-partial-cached (fn-name cache-by arg-list size)
(block outer
	(setf table (gethash fn-name *CACHE-TABLES*))
	(setf mru (gethash fn-name *CACHE-MRUS*))
	(if (null table)
		(progn
		(setf (gethash fn-name *CACHE-TABLES*) (make-hash-table :test #'equal))
		(setf (gethash fn-name *CACHE-MRUS*) (list))
		)
	)
	(setf table (gethash fn-name *CACHE-TABLES*))
	(setf mru (gethash fn-name *CACHE-MRUS*))

	; (print-ht table)
	; (format t "mru: ~s~%" mru)

	(setf arg-hash (rechash cache-by))

	(if (not (null (gethash arg-hash table)))
		; then
		(block found
			; (format t "found ~s in cache~%" cache-by)
			; bump this to most recently used
			; (format t "pre-bump mru is ~s~%" mru)
			(setf mru (append
				(loop for e in mru if (not (equal e arg-hash)) collect e)
				(list arg-hash)
			))
			(setf (gethash fn-name *CACHE-MRUS*) mru)
			; (format t "new mru is ~s~%" mru)

			(return-from outer (car (gethash arg-hash table)))
		)
	)

	; use a sentinel to make sure nulls aren't ambiguous
	; in the cache map
	(setf result (list (apply fn-name arg-list) 'll-sentinel))

	(if (>= (length mru) size)
		; then
		(block overload
			; (format t "cache is full for ~s~%" fn-name)
			; cut the least recently used from the
			; mru list and cache map, then update
			; mru to include this hash
			; (format t "mru is full. old mru is ~s~%" mru)
			(setf lru (car mru))
			(setf mru (append (cdr mru) (list arg-hash)))
			(setf (gethash fn-name *CACHE-MRUS*) mru)
			; (format t "new mru is ~s~%" mru)
			(remhash lru table)
		)
		; else
		(progn
		(setf mru (append mru (list arg-hash)))
		(setf (gethash fn-name *CACHE-MRUS*) mru)
		)
	)

	; add the result
	(setf (gethash arg-hash table) result)

	; return the result
	(return-from outer (car result))
)
)

