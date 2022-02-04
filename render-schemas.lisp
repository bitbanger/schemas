(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "schema-html-renderer.lisp")

(format t "~a~%" (schema-webpage-html (read)))
