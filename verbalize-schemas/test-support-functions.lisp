; verbalize and display schema

(defun v (name sch) 
         (set name (verbalize-schema sch))
         (format t "~%~s" (eval name)))

(defun show (x) (format t "~s" x))
