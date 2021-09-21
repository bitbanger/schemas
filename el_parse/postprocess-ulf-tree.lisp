;; Postprocess "raw" ULFs, assuming that some modifications are best
;; done after ULF computation, rather than on the syntactic parse tree
;; ====================================================================

;; e.g., delete extra brackets, like (go.v), ((...))
;; More generally, apply postprocessing rules, such as (perhaps)
;; e.g., coordination regularizations rules;
;; e.g., change (<adv>.adv <adj>.a) to (<adv>.mod-a <adj>.a)
;; e.g., change because.p to because.ps (if necessary)
;; e.g., Numeric age-tags and year-tags, as in "Smith, 54", or "May, 1958"
;;       can probably be handled in postprocessing (they are paired in
;;       brackets, with the comma in between)

; To allow for loading this file w/o worrying about othes that are needed:

(if (not (boundp '*implicit-pred*)); hash table of tt-match-predicates, allowing
                                  ; access to their !/*/?/+ variants
    (prog2 (load "tt-match-predicates.lisp")
           (load "postprocessing-rules.lisp")))

(if (not (fboundp 'match)) (load "tt.lisp"))

(defun postprocess-ulf-tree (ulf); **STUB
;```````````````````````````````
; Modify "raw" ULFs produced via syntax tree preprocessing and conversion
; to ULF, by removing extra brackets (if any) and applying all rules named
; in *postprocessing-rule-names* to ulf
;
  (let ((ulf1 (remove-extra-brackets ulf)) ulf2)
        (when *show-stages*
              (format t "~%~%## ULF before postprocessing:~%~s" ulf1)
              (format t "~%~%## Apply ULF postprocessing rules:~%")
              (format t  "   ```````````````````````````````"))
        (dolist (rule-name *postprocessing-rule-names*)
           (setq ulf2 (apply-rule-top-down (eval rule-name) ulf1))
           (if *show-stages*
             (if (equal ulf2 ulf1)
                 (format t "~%## ULF after ~s: No change" rule-name)
                 (format t "~%## Modified ULF after ~s:    ~%~s"
                            rule-name ulf2)))
           (setq ulf1 ulf2))
        ulf1 
 )); end of postprocess-ulf-tree


(defun remove-extra-brackets (ulf); tested
; Remove brackets around singletons, like ((big.a and heavy.a)) or (*h).
  (cond ((atom ulf) ulf)
        ((null (cdr ulf))
         (if (atom (car ulf)) 
             (car ulf)
             (remove-extra-brackets (car ulf))))
        (t (mapcar #'remove-extra-brackets ulf))
 )); end of remove-extra-brackets


