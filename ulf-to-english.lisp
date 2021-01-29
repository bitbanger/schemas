(load "~/quicklisp/setup.lisp")
(ql:register-local-projects)
(ql:quickload "py4cl")
(ql:quickload "ttt")
(setf py4cl:*python-command* "/usr/local/opt/python@3.8/bin/python3.8")
(ql:quickload "ulf2english")
(ql:quickload "standardize-ulf")
(use-package :standardize-ulf)
	(format t "ENGLISH (converted back):~%")
	(loop for ulf in all-ulfs
		do (handler-case
			(format t "	~s~%" (ulf2english:ulf2english (standardize-ulf ulf :pkg :ulf2english))) (error () (format t "; ulf2english error~%")))
	)
