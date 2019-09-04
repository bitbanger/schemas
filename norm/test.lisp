; (load "compile-mats.lisp")
(load "load-mats.lisp")

(initialize-allen-arrays)
(clear)

(asserta NOW0 < NOW1)
(asserta NOW1 < NOW2)
(asserta NOW2 < NOW3)
(asserta E1 (d) NOW0)
(asserta E2 (d) NOW1)
(asserta E2 (m) E3)
(asserta E4 (d) NOW2)
(asserta E5 (d) NOW3)
(asserta E5 (m) E6)

(allen-reduce)

; (ahow E1 E5)
(format t "~s~%" (allen-fhow 'E1 'E5))
