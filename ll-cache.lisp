(load "ll-load.lisp")

(ll-load "ll-util.lisp")

(defparameter *DISABLE-ALL-CACHE*
	;t
	nil
)

(defparameter *CACHE-MRUS* (make-hash-table :test #'equal))
(defparameter *CACHE-TABLES* (make-hash-table :test #'equal))

(defun clear-ll-func-cache (&optional fn-name)
(block outer
	(if (null fn-name)
		; then
		(progn
			(setf *CACHE-MRUS* (make-hash-table :test #'equal))
			(setf *CACHE-TABLES* (make-hash-table :test #'equal))
		)
		; else
		(progn
			(setf (gethash fn-name *CACHE-MRUS*)
				(list))
			(setf (gethash fn-name *CACHE-TABLES*)
				(make-hash-table :test #'equal))
		)
	)
)
)

(defun ll-cache (fn-name arg-list size &optional use-lru)
	(ll-partial-cache fn-name arg-list arg-list size use-lru)
)

(defun ll-partial-cache (fn-name cache-by arg-list size &optional use-lru)
	(ll-partial-cache-preloaded-result
		fn-name
		cache-by
		arg-list
		size
		'll-no-preload
		use-lru
	)
)

(defun ll-partial-cache-preloaded-result (fn-name cache-by arg-list size preloaded-result &optional use-lru)
(let (table mru arg-hash ll-result)
(block outer
	(if *DISABLE-ALL-CACHE*
		; then
		(return-from outer (apply fn-name arg-list))
	)


	(setf table (gethash fn-name *CACHE-TABLES*))
	(setf mru (gethash fn-name *CACHE-MRUS*))
	(if (null table)
		(progn
		(setf (gethash fn-name *CACHE-TABLES*) (make-hash-table :test #'equal))
	(setf table (gethash fn-name *CACHE-TABLES*))
		(setf (gethash fn-name *CACHE-MRUS*) (list))
	(setf mru (gethash fn-name *CACHE-MRUS*))
		)
	)

	; (print-ht table)
	; (format t "mru: ~s~%" mru)

	(setf arg-hash (rechash cache-by))

	(if (not (null (gethash arg-hash table)))
		; then
		(block found
			; (format t "found ~s in cache~%" cache-by)
			; bump this to most recently used
			; (format t "pre-bump mru is ~s~%" mru)
			(if use-lru (progn
				(setf mru (append
					(loop for e in mru if (not (equal e arg-hash)) collect e)
					(list arg-hash)
				))
				(setf (gethash fn-name *CACHE-MRUS*) mru)
			))
			; (format t "new mru is ~s~%" mru)

			(return-from outer (car (gethash arg-hash table)))
		)
	)

	; use a sentinel to make sure nulls aren't ambiguous
	; in the cache map
	(setf ll-result (list preloaded-result 'll-sentinel))
	(if (equal preloaded-result 'll-no-preload)
		; then
		(setf ll-result (list (apply fn-name arg-list) 'll-sentinel))
	)

	(if use-lru
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
	)

	; add the result
	(setf (gethash arg-hash table) ll-result)
	(setf (gethash fn-name *CACHE-TABLES*) table)

	; return the result
	(return-from outer (car ll-result))
))
)

