
; MACRO FOR COMBINING RULE-DEFPARAMETER OPERATIONS WITH STORAGE OF THE
; ULF POSTPROCESSING RULES IN *POSTPROCESSING-RULE-NAMES*
(defmacro defrule2 (name body)
 (list 'progn
    (list 'defparameter name body)
    (list 'push (list 'quote name) '*postprocessing-rule-names*)))

(defparameter *postprocessing-rule-names* nil); (re-)initialize to nil
;```````````````````````````````````````````
; The list of rule names is reversed from the result of "push"ing them
; onto *preprocessing-rule-names* at the end; thus the rules will be applied
; in the order of appearance here.

; COORDINATE-STRUCTURE REFORMATTING
;``````````````````````````````````
; ACTUALLY, THIS SHOULDN'T BE NEEDED, BECAUSE THE PREPROCESSING RULES STARTING
; WITH *STANDARDIZE...* SHOULD ALREADY DO IT (DROPPING COMMAS, INFIXING COORD'S)!
;
; TBC: SOME (ADV-S ...), (ADV-A ...), etc. MAY NEED TO BE CHANGED TO OTHER VARIANTS

(defrule2 *remove-conjunctive-commas*
; E.g., "He is lazy, a fool, and a thief" yields a ULF with commas. Drop them.
    '((+expr |,| *expr !coord~ +expr) (1 3 4 5)))

;; ** OMIT THIS RULE TILL THE SUBROUTINES OF !pred~ (!pred-postmod~, !vp-pred~) 
;;    HAVE BEEN FULLY DEFINED.
;; (defrule2 *remove-equal-from-adj-pred*
;; ; E.g., "He is lazy, a fool, and a thief" yields the faulty conjunction
;; ; ((= LAZY.A~4) (= (A.D~6 FOOL.N~7)) AND~8 (= (A.D~10 THIEF.N~11))),
;; ; because in this case BLLIP makes the initial "lazy" an NP.
;;    '((= !pred~) 2))

(defrule2 *remove-repeated-coord*
; E.g., in "He is lazy and a fool and a thief" we remove extra "and";
; It's assumed that if there are *different* coordinators, they will
; be at different structural levels
   '((+expr !coord~ *expr !coord~ +expr) (1 2 3 5)))

; ** I considered writing *flatten-nested-ands*, for cases like ternary 
; conjunctions of form (-- and (-- and --)), but this can't safely be done
; at the ULF level, e.g., "Mix the flour and eggs, and the tomato sauce
; and chicken stock".

; This rule mostly makes a mess, because of interspersed phrases such as
; adverbs in coordination "He served the wine and then left."
; (defrule2 *infix-conjunction*
; ; E.g., in a conjunction of form (<this> <that> and <the other thing>), the
; ; coordinator is moved to second position.
;    '((!expr +expr !coord~ +expr) (1 3 2 4)))


                 

; REVERSE THE RULE NAMES IN *POSTPROCESSING-RULE-NAMES*, SINCE "PUSH"ING
; THEM ONTO *POSTPROCESSING-RULE-NAMES* PUT THEM IN REVERSE ORDER:
; (First remove occurrences of rules with value 'TBC' (used for rules 
; not yet filled in) or another atomic value)
(setf *postprocessing-rule-names*
  (remove-if #'(lambda (x) (atom (eval x)))
              (reverse *postprocessing-rule-names*)))

