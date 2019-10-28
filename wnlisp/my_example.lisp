
(load "packages.lisp")
(in-package "WORDNET")
(load "parts-of-speech.lisp")
(load "wordnet-database-files.lisp")
(load "parse-wordnet-data.lisp")
(load "representation.lisp")
(load "relationship-algorithms.lisp")

(in-package "COMMON-LISP-USER")

(defparameter pointers (wn:wordnet-pointers (car (wn:index-entry-synsets (wn:cached-index-lookup "american_state" :noun)))))

(loop for p in pointers
	do (loop for ss in (mapcar #'car (wn:synset-words (wn:wordnet-pointer-to-synset p)))
		do (format t "~s~%" ss)
	)
)
