(declaim (sb-ext:muffle-conditions cl:warning))

(load "all-clargs.lisp")
(load "norm-schema-util.lisp")
(load "norm-el.lisp")
(load "real_util.lisp")

; Due to an output bug, we need to "zip up" pairs in matches
(setf zmatches (loop for i from 0 to (length matches)
	if (numberp (car (nth i matches)))
		collect (list (nth i matches) (nth (+ i 1) matches))
))

(setf schemas-by-verb (make-hash-table :test #'equal))

(loop for m in zmatches
	; do (format t "~s~%" (schema-header (second m)))
	; do (format t "~s~%" (get-schema-match-name (prop-pred (car (schema-header (second m))))))
	do (block index
		(setf name (get-schema-match-name (prop-pred (car (schema-header (second m))))))
		(setf (gethash name schemas-by-verb) (append (gethash name schemas-by-verb) (list (second m))))
	)
)

(loop for verb being the hash-keys of schemas-by-verb
	do (block prsch

		(format t "~s~%" verb)
		(format t "~s~%" verb)
		(format t "~s~%" verb)
		(format t "~s~%" verb)
		(format t "~s~%" verb)
		(loop for sch in (gethash verb schemas-by-verb)
			; do (format t "	~s~%~%" (car (schema-header sch)))
			if (or (has-element sch 'STORE.N) (has-element sch 'CHAIR.N))
				do (print-schema sch)
		)
	)
)

;(loop for m in (sort zmatches #'> :key #'caar)
;	do (format t "~s~%" (car m))
;	do (print-schema (second m))
;)
