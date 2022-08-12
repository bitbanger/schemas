(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")
(ll-load-superdir "ll-util.lisp")

(ll-load-superdir "new-ulf-parser.lisp")

(setf sents (list (second sb-ext:*posix-argv*)))
(setf *show-stages* nil)

(defun tilde-tagged? (s)
(and
	(symbolp s)
	(equal 2 (length (split-str (string s) "~")))
	(is-num-str? (second (split-str (string s) "~")))
)
)

(defun untag (s)
	(intern (car (split-str (string s) "~")))
)

(defun remove-tildes (s)
(block outer
	(setf tilde-tags (dedupe (get-elements-pred s #'tilde-tagged?)))
	(loop for tt in tilde-tags
		do (setf s (replace-vals tt (untag tt) s)))
	(return-from outer s)
)
)

;(setf ulf-sents (list (lenulf:english-to-ulf (car sents))))
(setf ulf nil)

(setf sents (loop for sent in sents
	collect (replace-all sent "\"" "")))

(loop for ulf in (len-ulfs-with-word-tags sents) do (block outer
	(setf ulf (remove-tildes ulf))
	(setf ulf (rec-remove ulf '|.|))
	(format t "~s~%" ulf)
))

; (format t "~s~%" (remove-tildes lenulf:ulf))
