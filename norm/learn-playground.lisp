(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "all-clargs.lisp")
(ll-load "norm-schema-util.lisp")
(ll-load "norm-el.lisp")
(ll-load "real_util.lisp")

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

(loop for noun in (get-elements-pred zmatches 'lex-noun?)
	do (block print-schs
		(setf schs (loop for sch in (mapcar #'second zmatches) if (has-element sch noun) collect sch))
		(if (<= (/ (length schs) (length zmatches)) 0.5)
			; then
			(block print-sch
				(format t "~s~%" (/ (length schs) (length zmatches)))
				(format t "~s~%" noun)
				(format t "~s~%" noun)
				(format t "~s~%" noun)
				(format t "~s~%" noun)
				(format t "~s~%" noun)
				(loop for sch in schs
					do (print-schema sch)
				)
			)
		)
	)
)

;(loop for m in (sort zmatches #'> :key #'caar)
;	do (format t "~s~%" (car m))
;	do (print-schema (second m))
;)
