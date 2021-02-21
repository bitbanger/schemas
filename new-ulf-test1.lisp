(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "new-ulf-parser.lisp")
(ll-load-subdir "stories" "roc-mcguffey-stories.lisp")
(ll-load-subdir "stories" "school-roc-stories.lisp")

(ll-load-subdir "parse-webpage" "collapse-html.lisp")

; (setf *random-state* (make-random-state t))

(defparameter *USE-DEBUG-STORIES* nil)

(defparameter *SHUFFLE-STORIES* t)

(defparameter *HANDLE-ERRORS* t)

(defparameter *PRINT-VALID-SENTS* t)

(defparameter *PRINT-INVALID-SENTS* t)

(defparameter *FILTER-INVISIBLE-PREDS* t)

(defparameter *STORY-LIMIT* 150)

; (setf stories *MCGUFFEY*)
; (setf stories *ROC*)
(setf stories *ROC-MCGUFFEY*)

(if *USE-DEBUG-STORIES*
	; then
	(setf stories '((
        "These are the little birds."
        "How many are there?"
        "Their mouths are open."
        "They are hungry."
        "The mother bird will feed them."
        "She has a grasshopper in her mouth."
        "Can the little birds fly?"
        "No they are too young."
        "If they try to fly, they will fall."
        "Soon they will be stronger."
        "Then their mother will teach them to fly."
        "She will teach them to sing, too."
	)))
)

(if *SHUFFLE-STORIES*
	; then
	(setf stories (shuffle stories))
)

(if (not (null *STORY-LIMIT*))
	(setf stories (subseq stories 0 *STORY-LIMIT*))
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

	(setf sents (len-parse-sents story))
	(loop for eng-sent in story
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


					(setf el-tree (list "EL" "Individual WFFs:"
						(append
							(loop for wff in valid-wffs
								collect (list t wff))
							(loop for wff in invalid-wffs
								collect (list nil wff))
						)
					))

					(setf sent-tree (append sent-tree (list (list el-tree))))

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

(format t *COLLAPSE-PAGE-OPENER*)
(let (sent-trees)
(loop for story in stories
		for i from 1
	if *HANDLE-ERRORS*
		do (handler-case (progn
							(setf sent-trees (print-story-wffs story))
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
				(setf sent-trees (print-story-wffs story))
				; (format nil "~%~%==================~%~%")
			)

	do (print-story (format nil "Story ~d of ~d" i (length stories)) sent-trees)
)
)
(format t *COLLAPSE-PAGE-CLOSER*)
