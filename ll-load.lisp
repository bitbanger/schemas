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

(defun ll-load-superdir (filename)
	(let ((
			*default-pathname-defaults*
			(make-pathname :directory (reverse (cdr (reverse (pathname-directory *default-pathname-defaults*)))))
	))
		(load filename)
	)
)

(defun ll-load-subdir (subdir filename)
	(progn
	(let ((*default-pathname-defaults* (pathname (format nil "~a/" (merge-pathnames *default-pathname-defaults* subdir)))))
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
