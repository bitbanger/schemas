(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "new-ulf-parser.lisp")
(ll-load-subdir "stories" "roc-mcguffey-stories.lisp")
(ll-load-subdir "stories" "school-roc-stories.lisp")

(defparameter *USE-DEBUG-STORIES* t)

(defparameter *SHUFFLE-STORIES* t)

(defparameter *HANDLE-ERRORS* nil)

(setf sents '(
	; "Tom used to have his own boat."
	; "He had to sell it."
	; "Now he just comes out on my boat."
	; "We have such a great time together."
	; "Now I have someone to help me clean my boat."
	"Today we were playing outside."
	"We saw a lot of dark clouds in the sky."
	"It looked like a storm was coming."
	"We had to go inside to be safe."
	"It didn't rain after all, so we went back outside!"
))

(setf stories *ROC*)

(if *USE-DEBUG-STORIES*
	; then
	(setf stories '((
		"Allie wanted an iPad."
		"She really liked it."
		"But she wanted a new one."
		"So she went to the store."
		"When she got back she had a newer one."
	)))
)

(if *SHUFFLE-STORIES*
	; then
	(setf stories (shuffle stories))
)

(loop for story in stories
	if *HANDLE-ERRORS*
		do (handler-case (len-parse-sents story)
				(error ()
					(format t "; error processing story:~%")
					(loop for sent in story
						do (format t ";	~s~%" sent)
					)
				))
	if (not *HANDLE-ERRORS*)
		do (len-parse-sents story)
		; do (get-len-ulfs story)
)
