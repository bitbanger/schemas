(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")
(ll-load-superdir "ll-util.lisp")

(load "~/quicklisp/asdf.lisp")
(load "~/quicklisp/setup.lisp")

(ql:quickload :lenulf :silent t)

; (ll-load-superdir "new-ulf-parser.lisp")

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

(export 'remove-tildes)
(export 'remove)

;(setf sents
	;(loop for sent in
		;(split-lst (cdr sb-ext:*posix-argv*) "/")
			;collect (join-str-list " " sent)))

(defparameter ulf nil)

(in-package :lenulf)

(setf sents (list (second sb-ext:*posix-argv*)))
(setf *show-stages* nil)


;(setf ulf-sents (list (lenulf:english-to-ulf (car sents))))
(setf ulf nil)

(loop for sent in sents
	;for ulf-sent in ulf-sents
		; do (format t "~s~%" sent)
		; do (format t "	~s~%" (remove-ulf-tags (clean-idx-tags ulf-sent))))
		do (block parse
			(setf ulf (lenulf:english-to-ulf sent))
			(export 'ulf)
			; (format t "~s~%" ulf)
			(setf ulf (cl-user:remove (intern ".") (cl-user:remove-tildes ulf) :test #'equal))
			; (setf ulf (cl-user:remove (intern "\"") (cl-user:remove-tildes ulf) :test #'equal))
			; (setf ulf (cl-user:remove (intern "'") (cl-user:remove-tildes ulf) :test #'equal))

			(format t "~s~%" ulf)
			
			; (in-package :cl-user)
		)
)
(in-package :cl-user)

; (format t "~s~%" (remove-tildes lenulf:ulf))
