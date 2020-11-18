(load "ll-load.lisp")

(ll-load "norm-stories.lisp")
(ll-load "coref.lisp")


; print all term constraints
(print-ht (story-select-term-constraints *COUSIN-STORY* '(HENRY.NAME CITY1.SK HE.PRO)))
