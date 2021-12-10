(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "new-ulf-parser.lisp")
(ll-load-superdir "schema-ngrams.lisp")

(ll-load "interesting-nesl-compos.lisp")
