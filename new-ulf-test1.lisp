(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "new-ulf-parser.lisp")
(ll-load-subdir "stories" "roc-mcguffey-stories.lisp")
(ll-load-subdir "stories" "school-roc-stories.lisp")

(setf *random-state* (make-random-state t))

(defparameter *USE-DEBUG-STORIES* nil)

(defparameter *SHUFFLE-STORIES* t)

(defparameter *HANDLE-ERRORS* t)

(defparameter *PRINT-VALID-SENTS* t)

(defparameter *PRINT-INVALID-SENTS* t)

(defparameter *FILTER-INVISIBLE-PREDS* t)

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
	(setf sents (len-parse-sents story))
	(loop for eng-sent in story
			for el-sent in sents
				do (block wff-loop
					(format t "~s~%" eng-sent)

					(setf valid-wffs (list))
					(setf invalid-wffs (list))

					(loop for wff in el-sent
						if (canon-prop? wff)
							do (setf valid-wffs (append valid-wffs (list wff)))
						else
							do (setf invalid-wffs (append invalid-wffs (list wff))))

					(if (and *PRINT-VALID-SENTS* (> (length valid-wffs) 0))
						(progn
						(format t "	Valid ELFs: ~%")
						(loop for valid-wff in valid-wffs
							if (or (not *FILTER-INVISIBLE-PREDS*) (not (invisible? valid-wff)))
								do (format t "		~s~%" valid-wff)
						)
						)
					)
					(if (and *PRINT-INVALID-SENTS* (> (length invalid-wffs) 0))
						(progn
						(format t "~%	Invalid ELFs: ~%")
						(loop for invalid-wff in invalid-wffs
							do (format t "		~s~%" invalid-wff)
						)
						)
					)

					(format t "~%")

				)
	)
))

(loop for story in stories
	if *HANDLE-ERRORS*
		do (handler-case (progn
							(print-story-wffs story)
							(format t "~%~%==================~%~%")
						)
				(error ()
					(format t "; error processing story:~%")
					(loop for sent in story
						do (format t ";	~s~%" sent)
					)
				))
	if (not *HANDLE-ERRORS*)
		; do (len-parse-sents story)
		; do (get-len-ulfs story)
		do (progn
				(print-story-wffs story)
				(format t "~%~%==================~%~%")
			)
)
