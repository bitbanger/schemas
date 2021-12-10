(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "new-ulf-parser.lisp")
(ll-load-superdir "schema-ngrams.lisp")

(ll-load "interesting-nesl-compos.lisp")

(if (< (length sb-ext:*posix-argv*) 2)
	(progn
		(format t "need filename as argument~%")
		(quit)
	)
)

;(setf path (second sb-ext:*posix-argv*))

;(setf last-char (subseq path
	;(- (length path) 1)
	;(length path)))

;(if (not (equal last-char "/"))
	;(setf path (concat-strs path "/")))

(setf ngram-to-schema-map (extract-ngrams (shuffle *NESL-COMPOS*) 2 1 nil t))

(setf idx-prop-to-ngram-map (make-hash-table :test #'equal))
(loop for ngram being the hash-keys of ngram-to-schema-map
	do (loop for idx-step in ngram
		do (setf (gethash idx-step idx-prop-to-ngram-map)
			(dedupe (append (gethash idx-step idx-prop-to-ngram-map)
				(list ngram))))))

(defun parse-story (story)
(block outer
	(setf el-sents (len-parse-sents story))

	(setf el-sents-valid
		(loop for el-sent in el-sents
			collect (loop for phi in el-sent
				if (canon-prop? phi) collect phi)))

	(return-from outer el-sents-valid)
)
)

(ldefun idx-props (parsed-story)
(block outer
	(setf charstars (loop for sent in parsed-story
		append (loop for phi in sent
			if (canon-charstar? phi)
				collect phi)))
	(setf nonfluents (loop for sent in parsed-story
		append (loop for phi in sent
			if (not (canon-charstar? phi))
				collect phi)))

	(return-from outer (loop for charstar in charstars
		collect (list charstar (mk-index-prop (car charstar) nonfluents))))
)
)

;(setf story-fns (uiop:directory-files path))
;(setf story-nums (sort (loop for fn in story-fns
	;collect (parse-integer
		;(remove-suffix
			;(remove-prefix (string fn) "story")
			;".txt")))) #'<)

; (loop for fn in (uiop:directory-files path) for i from 0
; (loop for sn-idx from start-idx to (+ start-idx 20)
	; do (handler-case (block parse-story
	;(handler-case (block parse-story
	(block parse-story
		(setf fn (second sb-ext:*posix-argv*))

		;(if (> i 0)
			;(format t "~%; -------------~%~%"))

		(setf story (split-str (read-str-from-file fn) *NEWLINE-STR*))

		(loop for sent in story
			do (format t "; ~s~%" sent))

		(setf parse (parse-story story))

		(loop for idx-prop-pair in (idx-props parse) do (block process-prop
			(setf prop (car idx-prop-pair))
			(setf idx-prop (second idx-prop-pair))

			(format t "~s~%" idx-prop)
			(setf matches (gethash idx-prop idx-prop-to-ngram-map))
			(setf match-freqs (freq-dict (reduce #'append matches)))
			(setf match-freq-pairs (loop for k being the hash-keys of match-freqs
				collect (list k (gethash k match-freqs))))
			(setf match-freq-pairs (sort match-freq-pairs #'< :key #'second))
			(if (equal (length matches) 0)
				(format t "	(no matches)~%")
				; else
				(block handle-matches
					(setf total-matches (reduce #'+
						(mapcar #'second match-freq-pairs)))
					(loop for mfp in match-freq-pairs
						do (format t "	~s ~,2f~%" (car mfp) (/ (second mfp) total-matches)))
				)
			)
		))
	)
	;) (error () (format t "; error~%")))
; )
