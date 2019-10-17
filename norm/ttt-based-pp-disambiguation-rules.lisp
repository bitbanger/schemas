
; 1. TTT rules for disambiguating (:r PP') complements in VP ULFs.
;    They become predicates (i.e., we just remove the (:r ...) wrapper),
;    or adverbials (we prefix an adv-a, adv-e, adv-s ... operator, 
;    and apply the result to whatever remains of the VP ULF (lambda-
;    abstracted in the case of adv-e, adv-f, adv-s so that the 
;    adverbial modifies a sentence.
; 2. TTT rules for disambiguating sentence-initial PP   
; =====================================================================
;
; **Note: Computable predicates (with a final question mark) in some
; cases still have ad hoc definitions in 
;     ./ttt-preds-and-functions-for-captions.lisp .
; For example, 'nn-human?' only checks for a couple of dozen names and
; terms in the initial test set (Noah family pics).
;
; Also some of the preds are from
;    /u/schubert/lf*/logical-form-predicates.lisp,
; so this is presumed to have been loaded also (./load-all.lisp
; does this).

(defparameter *disambiguation-rules-for-pps-in-vp-ulfs*
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; 
'(
  )); TBC 




