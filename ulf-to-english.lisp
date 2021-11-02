(load "~/quicklisp/setup.lisp")
(ql:register-local-projects)
(ql:quickload "py4cl")
(ql:quickload "ttt")
(setf py4cl:*python-command* "/home/lane/miniconda3/bin/python3.8")
(ql:quickload "ulf2english")
(ql:quickload "standardize-ulf")

(setf all-ulfs '(
	(I.PRO ((PAST EAT.V) (K FOOD.N)))
))

(use-package :standardize-ulf)
	(format t "ENGLISH (converted back):~%")
	(loop for ulf in '( (I.PRO ((PAST EAT.V) (K FOOD.N))) )
		;do (handler-case
			;(format t "	~s~%" (ulf2english:ulf2english (standardize-ulf ulf :pkg :ulf2english))) (error () (format t "; ulf2english error~%")))
		do (format t "	~s~%" (ulf2english:ulf2english (standardize-ulf ulf :pkg :ulf2english)))
	)
