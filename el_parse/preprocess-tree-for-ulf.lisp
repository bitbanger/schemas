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

; NB: *preprocessing-rule-names* is set up in "preprocessing-rules.lisp".

(defun preprocess-tree-for-ulf (tree)
;````````````````````````````````````
; Apply all the rules top-down to tree, iterating at each level until
; there's no change, before going deeper. Then apply 'globally-insert-gaps'
; (silent (-NONE- sub) operators will already have been inserted by the
; rules named in *preprocessing-rule-names*)).
;
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
      (globally-insert-gaps tree1)
 )); end of preprocess-tree-for-ulf


