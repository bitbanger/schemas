(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")


(ll-load "new-ulf-parser.lisp")
(ll-load-subdir "stories" "roc-mcguffey-stories.lisp")
(ll-load-subdir "stories" "school-roc-stories.lisp")

(ll-load-subdir "parse-webpage" "collapse-html.lisp")

; (dbg-tag 'coref)

; (setf *random-state* (make-random-state t))

(defparameter *PRINT-OUTPUT* t)

(defparameter *USE-DEBUG-STORIES* t)

(defparameter *SHUFFLE-STORIES* t)

(defparameter *HANDLE-ERRORS* t)

(defparameter *PRINT-VALID-SENTS* t)

(defparameter *PRINT-INVALID-SENTS* t)

(defparameter *FILTER-INVISIBLE-PREDS* t)

(defparameter *STORY-START* 0)
(defparameter *STORY-LIMIT* 150)

; (setf stories *MCGUFFEY*)
; (setf stories *ROC*)
(setf stories *ROC-MCGUFFEY*)

(if *PRINT-OUTPUT*
	(dbg-tag 'ulf-html)
)

(if *USE-DEBUG-STORIES*
	; then
	(setf stories '((
		"Allie felt dizzy."
		"Allie was watching a show yesterday."
		"It was very funny."
		"Allie laughed out loud."
		"She didn't know how to keep it in."
		"She wanted to watch it again."
	)))
)

(if *SHUFFLE-STORIES*
	; then
	(setf stories (shuffle stories))
)

(if (not (null *STORY-LIMIT*))
	(setf stories (subseq stories *STORY-START* (min (length stories) (+ *STORY-START* *STORY-LIMIT*))))
)

(ldefun invisible? (wff)
(let ((pred (prop-pred wff)))
	(or
		(equal pred 'HAS-DET.PR)
		(equal pred 'ORIENTS)
	)
)
)

(ldefun print-story-wffs (story)
(block outer
	(setf sent-trees (list))

	; (setf sents (len-parse-sents story))

	; (setf ulf-el-sents (len-ulfs-and-els story))
	; (setf ulf-sents (mapcar #'car ulf-el-sents))
	; (setf sents (mapcar #'second ulf-el-sents))
	(setf parser-full-output (full-debug-sents story))
	(setf pso parser-full-output) ; shorthand

	(setf raw-len-ulfs (nth 0 pso))
	(setf ulf-sents (nth 1 pso))
	(setf raw-interps (nth 2 pso))
	(setf cleaned-interps (nth 3 pso))
	(setf resolved-interps (nth 4 pso))
	(setf no-idx-interps (nth 5 pso))
	(setf sents (nth 6 pso))

	(loop for eng-sent in story
			for raw-ulf-sent in raw-len-ulfs
			for ulf-sent in ulf-sents
			for raw-el-sent in raw-interps
			for cleaned-el-sent in cleaned-interps
			for coref-el-sent in resolved-interps
			for stripped-el-sent in no-idx-interps
			for el-sent in sents
				do (block wff-loop
					(setf sent-tree (list eng-sent))

					(format nil "~s~%" eng-sent)

					(setf valid-wffs (list))
					(setf invalid-wffs (list))

					(loop for wff in el-sent
						if (canon-prop? wff)
							do (setf valid-wffs (append valid-wffs (list wff)))
						else
							do (setf invalid-wffs (append invalid-wffs (list wff))))

					(if (> (length invalid-wffs) 0)
						; then
						(setf sent-tree (append sent-tree (list nil)))
						; else
						(setf sent-tree (append sent-tree (list t)))
					)

					(setf parse-pair-tree (list))


					(setf raw-ulf-tree (list "ULF (Len's parser's raw output)" raw-ulf-sent))
					(setf parse-pair-tree (append parse-pair-tree (list raw-ulf-tree)))

					(setf ulf-tree (list "ULF (post-processed by Lane's code)" ulf-sent))
					(setf parse-pair-tree (append parse-pair-tree (list ulf-tree)))


					(setf raw-el-tree (list "EL (Len's parser's raw conversion of post-processed ULF)" raw-el-sent))
					(setf parse-pair-tree (append parse-pair-tree (list raw-el-tree)))

					(setf el-tree (list "EL (post-processed by Lane's code)" "Individual WFFs:"
						(append
							(loop for wff in valid-wffs
								collect (list t wff))
							(loop for wff in invalid-wffs
								collect (list nil wff))
						)
					))
					(setf parse-pair-tree (append parse-pair-tree (list el-tree)))
					; (setf sent-tree (append sent-tree (list (list el-tree))))

					(setf sent-tree (append sent-tree (list parse-pair-tree)))

					(setf sent-trees (append sent-trees (list sent-tree)))



					(if (and *PRINT-VALID-SENTS* (> (length valid-wffs) 0))
						(progn
						(format nil "	Valid ELFs: ~%")
						(loop for valid-wff in valid-wffs
							if (or (not *FILTER-INVISIBLE-PREDS*) (not (invisible? valid-wff)))
								do (format nil "		~s~%" valid-wff)
						)
						)
					)
					(if (and *PRINT-INVALID-SENTS* (> (length invalid-wffs) 0))
						(progn
						(format nil "~%	Invalid ELFs: ~%")
						(loop for invalid-wff in invalid-wffs
							do (format nil "		~s~%" invalid-wff)
						)
						)
					)

					(format nil "~%")

				)
	)

	(return-from outer sent-trees)

	; (print-story "Story" sent-trees)
))

(dbg 'ulf-html *COLLAPSE-PAGE-OPENER*)
(loop for story in stories
		for i from 1
	if *HANDLE-ERRORS*
		do (handler-case (progn
							(setf outer-sent-trees (print-story-wffs story))
							; (format nil "~%~%==================~%~%")
						)
				(error ()
					(format nil "; error processing story:~%")
					; (loop for sent in story
						; do (format nil ";	~s~%" sent)
					; )
					; (print-story (format nil "Story ~d of ~d" i (length stories)) nil)
					; (setf sent-tree (list (format nil "Story ~d of ~d" i (length stories)))
					
				))
	if (not *HANDLE-ERRORS*)
		; do (len-parse-sents story)
		; do (get-len-ulfs story)
		do (progn
				(setf outer-sent-trees (print-story-wffs story))
				; (format nil "~%~%==================~%~%")
			)

	do (print-story (format nil "Story ~d of ~d" i (length stories)) outer-sent-trees)
)
(dbg 'ulf-html *COLLAPSE-PAGE-CLOSER*)
