(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "ll-util.lisp")

(ll-load "schema-ngrams.lisp")
(ll-load "tests/nesl-compos-and-protos.lisp")

(setf nesl-compos (shuffle (shuffle (shuffle (shuffle *NESL-COMPOS*)))))

(setf counts (extract-ngrams (mapcar #'car nesl-compos) 2 2 (mapcar #'second nesl-compos)))

(setf counts (sort counts #'< :key (lambda (x) (length (second x)))))

(loop for c in counts do (block gen
	(setf ngram (car c))
	(setf schemas (second c))
	(setf protos (third c))

	(setf schema-proto-pairs
		(loop for i from 0 to
			(- (length (second c)) 1)
				collect (list
					(nth i (second c))
					(nth i (third c)))))

	(format t "~s~%" ngram)
	(format t "~s~%"
		(gen-ngram-schemas ngram schema-proto-pairs))
))
