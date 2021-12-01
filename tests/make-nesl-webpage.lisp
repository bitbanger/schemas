(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load "nesl-compos.lisp")

(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "schema-html-renderer.lisp")
(ll-load-superdir "schema-ngrams.lisp")

(setf *NESL-COMPOS* (dedupe *NESL-COMPOS*))

(setf ngrams (reverse (extract-ngrams (replace-vals 'AGENT.N 'PERSON.N *NESL-COMPOS*) 2 2)))

(if (> (length sb-ext:*posix-argv*) 1)
	(setf ngrams (subseq-safe ngrams 0 (parse-integer (second sb-ext:*posix-argv*)))))

(setf ngrams-to-pages (list))

(loop for ngram in ngrams for i from 0
	do (handler-case (block make-schema-page
		(setf schemas (second ngram))
		(setf sch-html (schema-webpage-html schemas))
		(setf fn (format nil "ngram-~d.html" i))
		(write-str-to-file sch-html (concat-strs "nesl-webpage/" fn))
		(setf ngrams-to-pages (append ngrams-to-pages
			(list (list ngram fn schemas))))
		(format t "~d / ~d~%" (+ i 1) (length ngrams))
)
	(error () (format t "~d / ~d (ERROR)~%" (+ i 1) (length ngrams)))))

(write-str-to-file (ngram-webpage-html ngrams-to-pages) "nesl-webpage/index.html")
