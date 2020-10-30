; Treebank tree restructuring to enable more direct mapping to ULF
; (which will be done roughly speaking by dropping nonterminal symbols,
; leaving us with more or less properly bracketed predicates, operators,
; and arguments). The code relies on "./tt.lisp".
;
; E.g., a pervasive issue is the Treebank treatment of NPs and their
; relative clauses as siblings, instead of applying the determiner (or
; a kind-forming operator) to the conjunction of the nominal predicate
; and the relative clause (which is a predicate).
;
; Another class of issues is the various kinds of -NONE- words, which can
; be phantom sentential subjects, or traces, among other things.
;
; Also, there is often insufficient internal structure in phrases, e.g.,
; when they contain coordinated components.
;

(defun preprocess-tree-for-ulf (tree)
;````````````````````````````````````
; Apply all the rules top-down to tree, iterating at each level until
; there's no change, before going deeper.
 (let ((tree1 tree) tree2)
      (if (and (listp tree) (listp (car tree)) (null (cdr tree)))
          (setq tree1 (car tree))); drop extra global brackets
      (if (and (listp tree1) (>= (length tree1) 2)
               (listp (second tree1)) (find (car (second tree1)) '(\. \:)))
          ; e.g., change ((S ...) (\. \.)) to (S (S ...) (\. \.))
          ; for uniform atomic initial list elements
          (setq tree1 (cons (caar tree1) tree1)))

      (if *show-stages*
        (format t "~%## Initial parse tree:    ~%~s~%" tree1))
      (dolist (rule-name *preprocessing-rule-names*)
        (setq tree2 (apply-rule-top-down (eval rule-name) tree1))
        (if *show-stages*
          (if (equal tree2 tree1)
              (format t "~%## Parse tree after ~s: No change" rule-name)
              (format t "~%## Modified parse tree after ~s:    ~%~s" 
                         rule-name tree2)))
        (setq tree1 tree2))
      tree1
 )); end of preprocess-tree-for-ulf


(defparameter *preprocessing-rule-names*
 '(; single-word rules
   *expand-something*
   *expand-everything*
   *expand-anything*
   *expand-someone*
   *expand-everyone*
   *expand-anyone*
   *comb-such-a*
   *pluralize-nn-foot*
   *pluralize-nn-inch*
   *change-aux-have-to-v*
   *wrap-aux-around-auxliary-to*
   *change-had-to-subjunctive-in-inverted-sbar*
   *externalize-final-period*
   *externalize-final-question-mark*
   *externalize-final-excl-mark*
   
   ; others
   *comb-adv-adjp*
   *reformat-advp-rb-rb*
   *comb-nn-nn*
   *comb-nn-nn-cc*
   *comb-cc-joined-nns*
   *comb-cc-joined-adjs*
   *comb-3-cds*
   *comb-2-cds*
   *comb-cc-joined-cds*
   *comb-nn-postmod*
   *comb-coordinated-adjs*
   *replace-disgusting-comma-ccs*
   *comb-adj-nn*
   *comb-adj-nn-cc*
   *form-compar-with-gap*
   *add-k-to-bare-np*
   *form-what-a-np*
   *comb-what-np-sbar*
   *comb-np-postmod*
   *comb-np-vpg*
   *comb-dt-postmod*
   *del-null-subj-after-comma*
   *comb-verbless-preds*
   *del-inf-subj*
   *change-vform-to-vbn-after-be-being*
   *comb-aux-vp*
   *wrap-aux-around-have-before-vbn* 
   *change-vbn-to-vben-after-have*
   *change-vbn-to-vben-after-have-adv*
   *change-vbn-to-vben-after-have-adv-adv*
   *change-question-initial-vbn-to-vbd*
   *change-vbn-to-vben-after-have-in-question*
   *change-vbn-to-vben-after-have-adv-np-in-question*
   *change-vbn-to-vben-after-have-adv-np-adv-in-question*
   *change-s-to-gerund*
   *change-s-to-vp*
   *del-sbarq-subj*
   *comb-np-poss*
   *comb-6-successive-nnp*
   *comb-5-successive-nnp*
   *comb-4-successive-nnp*
   *comb-3-successive-nnp*
   *comb-2-successive-nnp*
   *change-nnp-to-nn-after-premod*
   *change-nnp-to-nn-before-pp-of*
   *del-trailing-comma-from-np*
   *change-indef-np-to-pred-after-be-or-become*
   *change-np-to-equals-np-after-be-or-become*
   *standardize-single-comma-binary-np-conj*
   *standardize-double-comma-binary-np-conj*
   *standardize-single-comma-ternary-np-conj*
   *standardize-double-comma-ternary-np-conj*
   *standardize-triple-comma-ternary-np-conj*
   *form-appos-from-np-and-name*
   *form-appos-from-np-and-np*
   *change-vbn-to-vbd-as-s-headword*
   *change-wdt-to-dt*
   *change-init-cd-to-dt*
   *change-inf-to-prep*
   *move-s-advp-to-front*
   *change-non-init-pp-to-s-advp*
   *change-init-pp-to-s-advp*
   *comb-advp-s*
   *change-empty-that-to-relativizer*
   *mark-it-extra*
   *del-x-wrapper*
   *raise-displaced-s-final-postmod*
   *raise-displaced-s-final-appos*
   *raise-displaced-vp-final-postmod*
   *raise-displaced-vp-final-postmod*
   *raise-displaced-np-final-postmod*
   *raise-displaced-vp-final-appos*
   *add-postmod-placeholder*
   *add-sub-for-topicalized-pp*
 ))
