(load "ll-load.lisp")

(ll-load "coref.lisp")
(ll-load "norm-schema-util.lisp")

(defparameter *KB-EXPLICIT* (make-hash-table :test #'equal))                   
(defparameter *KB-ARG-IND* (make-hash-table :test #'equal))                    
(defparameter *KB-PRED-IND* (make-hash-table :test #'equal))                   
(defparameter *KB* (list *KB-EXPLICIT* *KB-ARG-IND* *KB-PRED-IND*))

;(loop for sent in *MONKEY-STORY* do (loop for wff in sent do (add-to-kb wff *KB*)))
(setf kb (story-to-kb (linearize-story *MONKEY-STORY*)))
