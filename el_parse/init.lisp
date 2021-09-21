;; For parsing English into ULF;
;; If repair rules pre-existing from "elf-from-sentences" are added, 
;; ttt and ttt rule files will have to be added from there as well.

(load "english-to-ulf.lisp")
(load "parse.lisp")
(load "parse-tree-to-ulf.lisp")
(load "preprocess-tree-for-ulf.lisp")
(load "tt-match-predicates.lisp")
(load "pos+word-to-ulf.lisp")        
(load "preprocessing-rules.lisp")   
(load "stem.lisp")
(load "lexical-features.lisp")
(load "transitivity-lists.lisp")
(load "tt.lisp")
(load "isa.lisp")
(load "postprocess-ulf-tree.lisp")
(load "postprocessing-rules.lisp")
(load "insert-gaps.lisp")
(load "subcat-pref.lisp")

(defun trace-main () 
  (trace simple-tree pos+word-to-raw-ulf inflect-aux!
         preprocess-tree-for-ulf parse-tree-to-raw-ulf))

(defun trace-rules ()
  (trace apply-rule apply-rule-bottom-up apply-rule-top-down))

(format t "~%NB: (trace-main) can be used for high-level tracing")
(format t "~%    (trace-rules) can be used for tracing preprocessing")

; (load "test...pos+word-to-ulf.lisp")

(setq *show-stages* t)

(let ()
 (format t "~%Example of using 'parse-tree-to-ulf' (from Brown, file p16):~% ~
             (parse-tree-to-ulf~%    ~
                 '((S (NP (PRP I))~%         ~
                      (AUX (VBP \\'m))~%         ~
                      (VP (VBN scared)~%             ~
                          (PP (IN of) (NP (DT the) (NN nightmare))))) (\\. \\.)))")
 (format t "~%~%Suggested handy definition:~%
         (defun p (tree) (format t ~s (parse-tree-to-ulf tree)))" "~%~s")
 (format t "~%~%Suggested handy definition for English to ULF:~%
         (defun ulf (str) (format t ~s (english-to-ulf str)))" "~%~s")
 (format t "~%~%To print an item x in full, define:~%
         (defun show (x) (format t ~a~a~a x))" #\" "~s" #\")
 (format t "~%~%To avoid showing processing stages, do~%  ~
           (setq *show-stages* nil)")
 '     -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-)
