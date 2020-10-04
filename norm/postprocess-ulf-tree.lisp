
;; To be created

;; e.g., delete extra brackets, like (go.v), ((...))
;; e.g., change (<adv>.adv <adj>.a) to (<adv>.mod-a <adj>.a)
;; e.g., change because.p to because.ps
;; e.g., Numeric age-tags and year-tags, as in "Smith, 54", or "May, 1958"
;;       can probably be handled in postprocessing (they are paired in
;;       brackets, with the comma in between)

(defun postprocess-ulf-tree (ulf); **STUB
  (let ((ulf1 ulf))
       (setq ulf1 (remove-extra-brackets ulf1))
 ))


(defun remove-extra-brackets (ulf)
; Remove brackets around singletons, like ((big.a and heavy.a)) or (*h).
  (cond ((atom ulf) ulf)
        ((null (cdr ulf))
         (if (atom (car ulf)) 
             (car ulf)
             (remove-extra-brackets (car ulf))))
        (t (mapcar #'remove-extra-brackets ulf))
 )); end of remove-extra-brackets
                 
