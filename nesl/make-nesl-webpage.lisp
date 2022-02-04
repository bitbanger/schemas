(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

; (ll-load "dec_10_compos_and_protos.lisp")

(ll-load "nesl-compos.lisp")

(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "schema-html-renderer.lisp")
(ll-load-superdir "schema-ngrams.lisp")
(ll-load-superdir "schema-subsumption.lisp")

(setf *NESL-COMPOS* *NESL-COMPOS-AND-PROTOS*)

(setf *NESL-COMPOS* (mapcar #'car *NESL-COMPOS*))

(setf *NESL-COMPOS* (dedupe *NESL-COMPOS*))

; Remove all null composite schemas
(setf *NESL-COMPOS*
	(loop for compo in *NESL-COMPOS*
		if (not (null compo))
			collect compo))

(setf ngrams (replace-vals 'AGENT.N 'PERSON.N (reverse (extract-ngrams *NESL-COMPOS* 1 2 nil nil t))))

(setf ngrams (un-abstract-ngrams ngrams))

(setf new-ngrams (list))

(if (> (length sb-ext:*posix-argv*) 1)
	(setf ngrams (subseq-safe ngrams 0 (parse-integer (second sb-ext:*posix-argv*)))))

(setf ngrams-to-pages (list))

(loop for ngram in ngrams for i from 0
	; do (handler-case (block make-schema-page
	do (block make-schema-page
		(setf schemas (second ngram))
		(setf sch-html (schema-webpage-html schemas))
		(setf fn (format nil "ngram-~d.html" i))
		(write-str-to-file sch-html (concat-strs "nesl-webpage/" fn))
		(setf ngrams-to-pages (append ngrams-to-pages
			(list (list ngram fn schemas))))
		(format t "~d / ~d~%" (+ i 1) (length ngrams))
)
	)
	; (error () (format t "~d / ~d (ERROR)~%" (+ i 1) (length ngrams)))))

(write-str-to-file (ngram-webpage-html ngrams-to-pages) "nesl-webpage/index.html")
