(if (not (boundp '*LL-LOADED*))
	(progn
		(declaim (sb-ext:muffle-conditions cl:warning))
		(defparameter *LL-LOADED* (make-hash-table :test #'equal))
	)
)

(defun ll-load (filename)
	(if (gethash filename *LL-LOADED*)
		; then
		(progn
			; (format t "not loading ~s~%" filename)
		)
		; else
		(progn
			; (format t "loading ~s~%" filename)
			(load filename)
			(setf (gethash filename *LL-LOADED*) t)
		)
	)
)

(defun ll-load-subdir (subdir filename)
	(progn
	; (format t "default is ~s~%" *default-pathname-defaults*)
	; (let ((*default-pathname-defaults* (merge-pathnames *default-pathname-defaults* (format nil "~a/" subdir))))
	(let* (
		(dpd *default-pathname-defaults*)
		(new-dpd (pathname (format nil "~a/" (merge-pathnames dpd subdir))))
		)
		(if (gethash filename *LL-LOADED*)
			; then
			(progn
				; (format t "not loading ~s~%" filename)
			)
			; else
			(progn
				(setf *default-pathname-defaults* new-dpd)
				; (format t "loading ~s from ~s~%" filename *default-pathname-defaults*)
				(load filename)
				(setf *default-pathname-defaults* dpd)
				(setf (gethash filename *LL-LOADED*) t)
			)
		)
	)
))

(defun clear-ll-load-cache ()
	(setf *LL-LOADED* (make-hash-table :test #'equal))
)

(defun cload (filename)
	(progn
		(clear-ll-load-cache)
		(ll-load filename)
	)
)
