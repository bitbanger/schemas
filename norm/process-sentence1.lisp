; Apr 20/13: currently mostly a copy of the caption processing code,
; but the post-LF, epilog-dependent code and alignment code have been
; separated off into "process-caption-contents-via-epilog.lisp".
; (The latter file currently is not expected to be used -- though
; some of the functions, e.g., derivation of knowledge from titular 
; nominals such as "Grandma Lillian", are likely to have long-term
; utility.)
; =====================================================================
;
; This file is for processing a given sentence (currently just
; a single sentence; or -- as needed for caption processing --
; a subject plus descriptive predicates but lacking a tensed verb).
; The main program is 'interpret'; e.g.,
;    (interpret "This sentence is an example")
;
; If a parse tree is already available and is to be interpreted,
; we use 'interpret-tree'; e.g.,
;    (interpret-tree '(S (NP (DT This) (NN sentence))
;                        (VP (VBZ is) (NP (DT an) (NN example))))).   
;     
; The result, via several intermediate stages, is a set of 
; canonicalized EL formulas. Specifying
;    (setq *show-stages* T),
;
; will cause the commands and results of the intermediate steps 
; to be displayed.
;
; Everything needed for full sentence processing can be loaded 
; with the single command
;
;   (load "init1.lisp")
;
; A prompt printed at the end of the load asks the user to set
; *show-stages* (show sentece/LF processing stages, if desired) to t.
; =================================================================

; NB: *repair-rules-for-charniak-parse*, 
;     *repair-rules-for-refined-charniak-parse*,
;     *pronoun-resolution-rules-for-ulfs*
;     *repair-rules-for-reduced-lf*
;     *canonicalization-rules-for-lfs*
;     are defined in "ttt-repair-and-canonicalization-rules.lisp"
  
(defun interpret (sentence)
;~~~~~~~~~~~~~~~~~~~~~~~~~~
; The 'sentence' argument is a string
;
; Steps:
;  1. Obtain the Charniak parse using a system call, and convert
;     it into "Lispified" form (with special characters meaningful
;     in Lisp prefixed with a backslash)
;  2. Apply 'interpret-tree' to the resulting ("raw") parse tree.
;     This will repair, refine, and interpret the tree.
;
 (let (parse-tree)
      (when (not (stringp sentence))
            (format t "~%**INPUT TO 'INTERPRET' MUST BE A STRING")
            (return-from interpret `(**BAD INPUT ,sentence)))
      (when (string= "" sentence)
            (format t "~%**'INTERPRET' RECEIVED EMPTY STRING AS INPUT")
            (return-from interpret nil))
      (setq sentence (repair-input sentence))
      (if *show-stages* 
          (format t "~%~% (Possibly) adjusted input string: ~%   ~s~%~%" 
                    sentence))
      (setq parse-tree (parse sentence)); Charniak parse
       ; which handles multi-sentence strings (with {. ! ?} punctuation)
      (if *show-stages*
          (format t "~%~% Initial parse tree: ~%   ~s~%~%" parse-tree))
      (interpret-tree parse-tree)
 )); end of interpret 

(defun interpret-tree (tree)
;~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; Steps:
;  1. Apply preliminary parse-tree repair rules, using TTT;
;  2. Apply parse-tree refinement routines (directly coded in Lisp) 
;     and possibly additional parse tree repair rules (coded in TTT) 
;     in preparation for LF computation;
;  3. Perform compositional LF computation;
;  4. Perform reference resolution;
;  4.1 (Mar 11/14) Heuristically resolve ambiguities of (:r PP')'s (and
;     maybe (:s PP')'s, i.e., PP[by] subjects in pasv) in VPs, using TTT;
;  5. Perform augmentation incorporation (for NP-derived LFs containing
;     an :a-keyword (augmentation) construct);
;  6. Perform operator scoping
;  7. Perform text-source and temporal deindexing
;  8. Reduce the resulting formula by eliminating inessential keywords;
;  9. Apply LF refinement/repair rules, using TTT; for example,
;     "augmented phrases" using the ":A" keyword (e.g., "John at
;     the party") need to be refined to change the augmentation
;     structure to a predication (or in some cases an argument of
;     a predicate;
; 10. Apply canonicalization rules, using TTT, obtaining a list
;     of "minimal" canonical formulas;
;
 (let ( parse-tree1 parse-tree2 parse-tree3 ulf ulf1 ulf2 ulf3
       ulf4 ulf5 ilf lf lf1 lf2 lf3 lf4 final-lfs)
; Editing TBC

      (setq parse-tree1 (repair-parse-tree tree))
      (if *show-stages*
          (format t "~%~% Parse-tree1 (after repairs, if any): ~%   ~
                    ~s~%~%" parse-tree1))
      (setq parse-tree2 (refine-parse-tree parse-tree1))
            ; * NB: 'preprocess-tree' has been renamed 
            ;       (used as the body of) 'refine-parse-tree"
      (if *show-stages*
          (format t "~%~% Parse-tree2 (after refinements, if any): ~%   ~
                    ~s~%~%" parse-tree2))
      (setq parse-tree3 (repair-refined-parse-tree parse-tree2))
      (if *show-stages*
          (format t "~%~% Parse-tree3 (after post-refinement repairs, ~
                    if any): ~%   ~s~%~%" parse-tree3))
      (setq ulf (derive-lf parse-tree3))
      (if *show-stages*
          (format t "~%~% Unscoped LF, ULF: ~%   ~s~%~%" ulf))
      ; We need to find plausible anaphoric referents at this point,
      ; and then adjust augmentation (i.e., (:a ...)) constructs
      ; prior to operator scoping.
      (setq ulf1 (resolve-anaphors-in-ulf ulf))
      (if *show-stages*
          (format t "~%~% Unscoped LF with pronoun resolution, ULF1: ~
                    ~%   ~s~%~%" ulf1))
      (setq ulf2 (incorporate-{augmented-}predicate-np ulf1))
      (if *show-stages*
          (format t "~%~% Unscoped LF with predicative-NP incorporation, ~
                    ULF2: ~%   ~s~%~%" ulf2))
      (setq ulf3 (disambiguate-pp-roles-in-vps ulf2))
      ; **Originally, the intention was as follows, but I'm tentatively
      ; dropping ':r' & leaving disambiguation to 'canonicalize-lf' (below):
      ;   A (:r PP') in a VP may function as a predicate (i.e., we remove 
      ;   the (:r ...)), or as an adverbial (we type-shift it and apply it
      ;   to the rest of the VP), or (rarely) supply a verb-suffix and 
      ;   object (e.g., "rely on"); we use the latter only if omission
      ;   of the object-supplying PP is ungrammatical.
      (if *show-stages*
          (format t "~%~% Unscoped LF with VP-embedded PP disambiguation, ~
                    ULF3: ~%   ~s~%~%" ulf3))
      (setq ulf4 (incorporate-augmentations ulf3))
      (if *show-stages*
          (format t "~%~% Unscoped LF with NP-postmodifier incorporation, ~
                    ULF4: ~%   ~s~%~%" ulf4))
      (setq ulf5 (convert-deep ulf4)); feasible lambda-conversions, since
                                     ; not doing them may block scoping
      (if *show-stages*
          (format t "~%~% Unscoped LF with deep lambda-conversion, ~
                    ULF5: ~%   ~s~%~%" ulf5))
      (setq ilf (scope-ulf ulf5))    
      (if *show-stages*
          (format t "~%~% Scoped, indexical LF, ILF: ~%   ~s~%~%" ilf))
      (setq lf (deindex ilf))
      (if *show-stages*
          (format t "~%~% Deindexed LF: ~%   ~s~%~%" lf))
      (setq lf1 (convert-deep lf)); residual lambda-conversions
      (if *show-stages*
          (format t "~%~% LF with residual lambda-conversion, ~
                    LF1: ~%   ~s~%~%" lf1))
      (setq lf2 (reduce-lf lf1)) ; ** this currently includes incorporating
                                 ;    augmentations, so I seem to be doing 
                                 ;    this twice -- see ulf3 above)
      (if *show-stages*
          (format t "~%~% Flattened, keyword-reduced LF, LF2: ~%   ~
                    ~s~%~%" lf2))
      (setq lf3 (repair-lf lf2)); more augmentation incorporation? 
                                ; relational nouns (add '-of')
      (if *show-stages*
          (format t "~%~% Reduced LF with repairs, e.g., adding '-of' ~
                    suffix to relational nouns, LF3: ~%   ~s~%~%" lf3))
      (setq lf4 (transform-deep lf3))
      (if *show-stages*
          (format t "~%~% LF after deep logical transformations, LF4: ~
                     ~%   ~s~%~%" lf4))
      (setq final-lfs (canonicalize-lfs (list lf4)))
      (if *show-stages*
          (format t "~%~% Final, separated canonical WFFs, with speech-~
                    act wrapper discarded, FINAL-LFS: ~%    ~
                    ~s~%~%" final-lfs))
      (setq final-lfs (change-colon-l-to-l final-lfs)); as needed by epi2
      (if *show-stages*
          (format t "~%~% FINAL-LFS with colons removed from lambdas, ~
                    i.e., from (:L ...): ~%    ~s~%~%" final-lfs))
      ; Needed because conjunction scoping can lead to duplicates:
      (setq final-lfs (remove-duplicates final-lfs :test #'equal))
      (if *show-stages*
          (format t "~%~% FINAL-LFS with duplicates, if any, removed: ~
                    ~%    ~s~%~%" final-lfs)
          final-lfs)
 )); end of interpret-tree

(defun interpret-tree-without-repairs (tree)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Skip steps 1 and 2 of 'interpret-tree'
;  3. Perform compositional LF computation;
;  4. Perform reference resolution;
;  4.1 (Mar 11/14) Heuristically resolve ambiguities of (:r PP')'s (and
;     maybe (:s PP')'s, i.e., PP[by] subjects in pasv) in VPs, using TTT;
;  5. Perform augmentation incorporation (for NP-derived LFs containing
;     an :a-keyword (augmentation) construct);
;  6. Perform operator scoping
;  7. Perform text-source and temporal deindexing
;  8. Reduce the resulting formula by eliminating inessential keywords;
;  9. Apply LF refinement/repair rules, using TTT; for example,
;     "augmented phrases" using the ":A" keyword (e.g., "John at
;     the party") need to be refined to change the augmentation
;     structure to a predication (or in some cases an argument of
;     a predicate;
; 10. Apply canonicalization rules, using TTT, obtaining a list
;     of "minimal" canonical formulas;
;
 (let ( parse-tree1 parse-tree2 parse-tree3 ulf ulf1 ulf2 ulf3
       ulf4 ulf5 ilf lf lf1 lf2 lf3 lf4 final-lfs)
; Editing TBC

      (setq ulf (derive-lf tree))
      (if *show-stages*
          (format t "~%~% Unscoped LF, ULF: ~%   ~s~%~%" ulf))
      ; We need to find plausible anaphoric referents at this point,
      ; and then adjust augmentation (i.e., (:a ...)) constructs
      ; prior to operator scoping.
      (setq ulf1 (resolve-anaphors-in-ulf ulf))
      (if *show-stages*
          (format t "~%~% Unscoped LF with pronoun resolution, ULF1: ~
                    ~%   ~s~%~%" ulf1))
      (setq ulf2 (incorporate-{augmented-}predicate-np ulf1))
      (if *show-stages*
          (format t "~%~% Unscoped LF with predicative-NP incorporation, ~
                    ULF2: ~%   ~s~%~%" ulf2))
      (setq ulf3 (disambiguate-pp-roles-in-vps ulf2))
      ; **Originally, the intention was as follows, but I'm tentatively
      ; dropping ':r' & leaving disambiguation to 'canonicalize-lf' (below):
      ;   A (:r PP') in a VP may function as a predicate (i.e., we remove 
      ;   the (:r ...)), or as an adverbial (we type-shift it and apply it
      ;   to the rest of the VP), or (rarely) supply a verb-suffix and 
      ;   object (e.g., "rely on"); we use the latter only if omission
      ;   of the object-supplying PP is ungrammatical.
      (if *show-stages*
          (format t "~%~% Unscoped LF with VP-embedded PP disambiguation, ~
                    ULF3: ~%   ~s~%~%" ulf3))
      (setq ulf4 (incorporate-augmentations ulf3))
      (if *show-stages*
          (format t "~%~% Unscoped LF with NP-postmodifier incorporation, ~
                    ULF4: ~%   ~s~%~%" ulf4))
      (setq ulf5 (convert-deep ulf4)); feasible lambda-conversions, since
                                     ; not doing them may block scoping
      (if *show-stages*
          (format t "~%~% Unscoped LF with deep lambda-conversion, ~
                    ULF5: ~%   ~s~%~%" ulf5))
      (setq ilf (scope-ulf ulf5))    
      (if *show-stages*
          (format t "~%~% Scoped, indexical LF, ILF: ~%   ~s~%~%" ilf))
      (setq lf (deindex ilf))
      (if *show-stages*
          (format t "~%~% Deindexed LF: ~%   ~s~%~%" lf))
      (setq lf1 (convert-deep lf)); residual lambda-conversions
      (if *show-stages*
          (format t "~%~% LF with residual lambda-conversion, ~
                    LF1: ~%   ~s~%~%" lf1))
      (setq lf2 (reduce-lf lf1)) ; ** this currently includes incorporating
                                 ;    augmentations, so I seem to be doing 
                                 ;    this twice -- see ulf3 above)
      (if *show-stages*
          (format t "~%~% Flattened, keyword-reduced LF, LF2: ~%   ~
                    ~s~%~%" lf2))
      (setq lf3 (repair-lf lf2)); more augmentation incorporation? 
                                ; relational nouns (add '-of')
      (if *show-stages*
          (format t "~%~% Reduced LF with repairs, e.g., adding '-of' ~
                    suffix to relational nouns, LF3: ~%   ~s~%~%" lf3))
      (setq lf4 (transform-deep lf3))
      (if *show-stages*
          (format t "~%~% LF after deep logical transformations, LF4: ~
                     ~%   ~s~%~%" lf4))
      (setq final-lfs (canonicalize-lfs (list lf4)))
      (if *show-stages*
          (format t "~%~% Final, separated canonical WFFs, with speech-~
                    act wrapper discarded, FINAL-LFS: ~%    ~
                    ~s~%~%" final-lfs))
      (setq final-lfs (change-colon-l-to-l final-lfs)); as needed by epi2
      (if *show-stages*
          (format t "~%~% FINAL-LFS with colons removed from lambdas, ~
                    i.e., from (:L ...): ~%    ~s~%~%" final-lfs))
      ; Needed because conjunction scoping can lead to duplicates:
      (setq final-lfs (remove-duplicates final-lfs :test #'equal))
      (if *show-stages*
          (format t "~%~% FINAL-LFS with duplicates, if any, removed: ~
                    ~%    ~s~%~%" final-lfs)
          final-lfs)
 )); end of interpret-tree-without-repairs

(defun repair-input (str); Jan 27/13
; ~~~~~~~~~~~~~~~~~~~~~~~
; Make changes to input string that are likely to produce a better
; Charniak parse; e.g., connect certain fairly common (but not 
; learned or lexicalized) compound nominals with a hyphen (tennis
; coach --> tennis-coach); perhaps change years like "2001" to
; "in 2001"; perhaps delete some parenthetical items (which the
; Charniak parser tends to trip on); punctuate apparent unpunctuated
; acronyms like ID, BA, MVP, ...; etc.
;
; The rules are applied to a simply tokenized version of the input
; str, and after the repairs the tokens are reconverted to a string.
;
  (let (chunks)
       (setq chunks (tokenize-simply str))
       (setq chunks
         (unhide-ttt-ops
           (ttt:apply-rules *repair-rules-for-input-sentences*
             (hide-ttt-ops chunks) :rule-order :fast-forward)))
       (detokenize chunks) )); end of repair-input

(defun tokenize-simply (str); Jan 26/13
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~
; 'str' is a character string;
; Make separate chunks out of alphanumeric character sequences, blanks,
; and nonalphanumeric characters, and make these chunks into a list of
; symbols. Note that after repairs, we want to form a string again, to
; be passed to the Charniak parser; that's why we keep the blanks and
; separate characters;
;
; E.g., "John's high school graduation party, last spring (2012)."
; becomes the list
;   (|John| |'| |s| | | |high| | | |school| | | |graduation| | | 
;    |party| |,| | | |last| | | |spring| | | |(| |2012| |)| |.|)
; This might be "repaired" to replace |high| | | |school| by |high-school|
; using repair rules (and then this would be changed back to a string,
; i.e., "John's high-school graduation party, last spring (2012)."
;
  (let ((chars (coerce str 'list)) chunk result)
       (dolist (ch chars)
          (cond ((not (alphanumericp ch))
                 (when chunk 
                    (push chunk result) (setq chunk nil))
                 (push (list ch) result))
                (t (push ch chunk))))
       ; If the last character was alphabetic, then chunk is non-nil
       ; and we still need to push this last chunk onto result:
       (if chunk (push chunk result))
       ; 
       ; Coerce the chunks into strings and then symbols (reversing
       ; each chunk and result itself):
       (mapcar #'(lambda (x) (intern (coerce (reverse x) 'string))) 
                 (reverse result))
 )); end of tokenize-simply
       
(defun detokenize (chunks)
; ~~~~~~~~~~~~~~~~~~~~~~~~
; Chunks: word-atoms and nonalphanumeric-character atoms (including
;         spaces, as atoms); e.g., (|How| |'| |s| | | |everybody| |?|)
; Change a list of atoms of the type produced by 'tokenize-simply'
; back to a character string (but this would normally be used after
; some "repairs" have been made to the list of chunks.
  (apply 'concatenate 'string (mapcar #'princ-to-string chunks)))


(defun repair-parse-tree (parse-tree)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Apply a set of TTT repair rules to a raw (but "Lispified")
; Charniak parse tree. Apply each rule as often as possible before
; moving to the next rule; repeat till convergence. Since we haven't 
; specified :shallow t in 'apply-rules', rules are applied at all
; levels.
;
 (unhide-ttt-ops
   (ttt:apply-rules *repair-rules-for-charniak-parse* 
      (hide-ttt-ops parse-tree) :rule-order :slow-forward)))


(defun repair-refined-parse-tree (parse-tree)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Apply a set of TTT repair rules to a refined Charniak parse tree
;
 (unhide-ttt-ops
   (ttt:apply-rules *repair-rules-for-refined-charniak-parse* 
     (hide-ttt-ops parse-tree) :rule-order :slow-forward)))


(defun hide-ttt-ops (wff); tested
;~~~~~~~~~~~~~~~~~~~~~~~~
; Wrap [..] around symbols like !, +, ?, *, @, ~, {}, or <>, or
; ones starting this way, which we may want to use in some patterns
; (e.g., in wff-patterns involving *, **, @, or ~), but can't 
; because of their special meanings in TTT. We're assuming that
; the wffs we want to process don't *already* contain symbols in
; square brackets, starting as above inside the brackets, and which
; shouldn't have the brackets removed when we ultimately "unhide"
; the hidden symbols in a formula.
;
  (let (str chars)
       (cond ((symbolp wff) 
              (setq str (string wff))
              (setq chars (coerce str 'list))
              (cond ((member (car chars) '(#\! #\+ #\? #\* #\@ #\~))
                     (intern (concatenate 'string "[" str "]")))
                    ((and (eq (car chars) #\{) (eq (second chars) #\}))
                     (intern (concatenate 'string "[" str "]")))
                    ((and (eq (car chars) #\<) (eq (second chars) #\>))
                     (intern (concatenate 'string "[" str "]")))
                    (t wff)))
             ((atom wff) wff)
             (t (cons (hide-ttt-ops (car wff)) (hide-ttt-ops (cdr wff)))))
 )); end of hide-ttt-ops


(defun unhide-ttt-ops (wff); tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~
; Remove the square brackets that have been added around ttt symbols
; in wff by 'hide-ttt-ops':
;
 (let (str chars)
      (cond ((symbolp wff)
             (setq str (string wff))
             (setq chars (coerce str 'list))
             (cond ((or (not (eq (car chars) #\[))
                        (not (eq (car (last chars)) #\]))) wff)
                   (t (setq chars (cdr (butlast chars)))
                      (setq str (coerce chars 'string))
                      (cond ((null chars) wff)
                            ((member (car chars) '(#\! #\+ #\? #\* #\@ #\~))
                             (intern str))
                            ((and (eq (car chars) #\{) (eq (second chars) #\}))
                             (intern str))
                            ((and (eq (car chars) #\<) (eq (second chars) #\>))
                             (intern str))
                            (t wff)))))
            ((atom wff) wff)
            (t (cons (unhide-ttt-ops (car wff)) (unhide-ttt-ops (cdr wff)))))
 )); end of unhide-ttt-ops
                        

(defun resolve-anaphors-in-ulf (ulf)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Resolve anaphoric pronouns in an unscoped logical form. Keywords 
; have not yet been reduced, but we try to formulate the rules robustly, 
; with minimal dependence on the presence/absence of keywords.
;
; Note that for multi-sentence captions, we would need the previous
; sentence (if any) or perhaps a list of potential referents and their
; types as an additional argument of this function.
 (unhide-ttt-ops
   (ttt:apply-rules *pronoun-resolution-rules-for-ulfs* 
     (hide-ttt-ops ulf) :rule-order :slow-forward)))

(defun incorporate-{augmented-}predicate-np (ulf)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Change the property of "being identical with a P", where "a P" may be
; augmented, to just P (or a conjunctive lambda-abstract, in case of 
; augmentation); other augmentations are currently handled by 
; 'incorporate-augmentations' as defined in the LF derivation code.
 (unhide-ttt-ops
   (ttt:apply-rules *{augmented-}predicate-np-incorporation-rules-for-ulf*
     (hide-ttt-ops ulf) :rule-order :slow-forward)))

(defun disambiguate-pp-roles-in-vps (ulf); Mar 11/14
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; A (:r PP') in a VP may function as a predicate (i.e., we remove 
; the (:r ...)), or as an adverbial (we type-shift it and apply it
; to the rest of the VP), or (rarely) supply a verb-suffix and 
; object (e.g., "rely on"); we use the latter only if omission
; of the object-supplying PP is ungrammatical.
 (unhide-ttt-ops
   (ttt:apply-rules *disambiguation-rules-for-pps-in-vp-ulfs*
     (hide-ttt-ops ulf) :rule-order :slow-forward)))

(defun convert-deep (expr)
;~~~~~~~~~~~~~~~~~~~~~~~~
; Do deep lambda-conversions by applying 'convert' (from the logical-form
; code) recursively. 
 (cond ((atom expr) expr) (t (convert (mapcar #'convert-deep expr)))))

(defun repair-lf (lf);
;~~~~~~~~~~~~~~~~~~~~
; Apply a set of TTT repair rules to the given reduced logical form lf
;
 (unhide-ttt-ops
   (ttt:apply-rules *repair-rules-for-reduced-lf*
     (hide-ttt-ops lf) :rule-order :slow-forward)))

(defun transform-deep (lf)
;~~~~~~~~~~~~~~~~~~~~~~~~~
; Apply rules that widen the scope of indefinites and definites,
; expand the meaning of predications of cognition, etc.
 (unhide-ttt-ops
   (ttt:apply-rules *deep-lf-transformation-rules* 
     (hide-ttt-ops lf) :rule-order :slow-forward)))

(defun canonicalize-lfs (lfs)
;~~~~~~~~~~~~~~~~~~~~~~~~~~
; Apply a set of TTT canonicalization rules to the given (reduced,
; repaired) logical forms in the list lfs; return a list of canonical
; formulas. (Note: a separate start on this, in unaided Lisp, exists
; in ~schubert/lf*/normalizing.lisp).
;
 (unhide-ttt-ops
  ;(ttt:apply-rules-at-root *canonicalization-rules-for-lfs*
   (ttt:apply-rules *canonicalization-rules-for-lfs*
     (hide-ttt-ops lfs) :shallow t :rule-order :slow-forward)))

(defun change-colon-l-to-l (lfs)
; Replace :L by L, as needed for epi2
  (if (not (occurs-in :l lfs))
      lfs
      (cond ((null lfs) nil)
            ((eql lfs :l) 'l)
            ((atom lfs) lfs)
            (t (cons (change-colon-l-to-l (car lfs))
                     (change-colon-l-to-l (cdr lfs)))))))

; REPLACED BY THE ABOVE VERSION OF 'APPLY-RULES'
(defun apply-rules-at-root (rules expr &optional cautious)
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Keep applying the rules at the top level of the expr till
; convergence. Note that this can easily be used to process
; a *list of formulas* till convergence, allowing for addition
; or deletion of formulas along the way, just by formulating 
; the transduction rules to operate on children of the root.
; E.g., (/ (_* [wff-pattern] _*1) (_* [new-wff1] [new-wff2] _*1)
;       shows schematically how we can change one of the wffs
;       in a list to two.
;
; If the optional argument 'cautious' is non-nil, the program
; guards against repetitive cycles by checking against a list
; of exps already seen.
;
; We keep cycling through the rules, aplying each rule once.
; An alternative would be to apply the 1st rule as often as
; possible, then the 2nd rule as often as possible, etc., and
; then starting over. It's unclear wheither both might be useful,
; for different applications.
;
 (let (exp1 (exp2 expr) (exps (list expr)))
      (loop (setq exp1 exp2)
            (dolist (r rules)
                    (setq exp2 (transduce r exp2))
                    (if (and cautious
                             (not (equal exp1 exp2)))
                        (push exp2 exps)))
            (if (equal exp2 exp1)
                (return-from apply-rules-at-root exp1))
            (when (and cautious
                       (member exp2 exps :test #'equal))
                  (format t "~%~%*** TRANSDUCING ~S CYCLED BACK TO~
                               ~%    ~S USING RULES ~%~S~%"
                            expr exp2 rules)
                  (return-from apply-rules-at-root exp2)))
 )); end of apply-rules-at-root

; THE FOLLOWING FUNCTION AS WELL AS THE NEXT TWO
; (conservatively-transduce-wff, productively-transduce-wffs)
; ARE CURRENTLY NOT USED, AND ARE UNLIKELY TO BE USED, BECAUSE
; IT'S EASIER TO ACHIEVE THE SAME RESULTS (ALLOWING FOR RULES
; THAT PRODUCE MULTIPLE WFFS FROM ONE) BY STRICTLY USING
; RULES THAT ALWAYS TRANSFORM SOME TOP-LEVEL LIST ELEMENT OF
; A LIST OF WFFS -- WHICH EASILY ALLOWS ADDITIONAL WFFS TO BE
; PLACED IN THE LIST.
;
(defun conservatively-transduce-wffs (rules wffs)
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Keep applying the rules at the top level of the formulas
; (starting with wffs) till convergence. THIS ROUTINE ASSUMES THAT
; THE RULES USED ARE CONSERVATIVE, I.E., CAN BE APPLIED DIRECTLY
; TO A WFF (RATHER THAN A SINGLETON LIST CONTAINING IT), AND
; MAP THAT FORMULA TO ANOTHER FORMULA (NOT A LIST OF FORMULAS).
; If rules expecting a list of one or more wffs, or producing
; a list of wffs, are used, the result will be incorrect.
;
 (mapcar #'(lambda (w) 
             (conservatively-transduce-wff rules w)) wffs))

; NO LONGER USED
(defun conservatively-transduce-wff (rules wff)
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Keep applying the rules at the top level of the formula
; (starting with wff) till convergence. THIS ROUTINE ASSUMES THAT
; THE RULES USED ARE CONSERVATIVE, I.E., CAN BE APPLIED DIRECTLY
; TO A WFF (RATHER THAN A SINGLETON LIST CONTAINING IT), AND
; MAP THAT FORMULA TO ANOTHER FORMULA (NOT A LIST OF FORMULAS).
; If rules expecting a list of one or more wffs, or producing
; a list of wffs, are used, the result will be incorrect.
;
; The program guards against repetitive cycles by checking
; against a list of wffs already seen
;
 (let (wff1 (wff2 wff) (wffs (list wff)))
      (loop (setq wff1 wff2)
            (dolist (r rules)
                    (setq wff2 (transduce r wff2))
                    (if (not (equal wff1 wff2))
                        (push wff2 wffs)))
            (if (equal wff2 wff1)
                (return-from conservatively-transduce-wff wff1))
            (when (member wff2 wffs :test #'equal)
                  (format t "~%~%*** TRANSDUCING ~S CYCLED BACK TO~
                               ~%    ~S USING RULES ~%~s~%"
                            wff wff2 rules)
                  (return-from conservatively-transduce-wff wff2)))
 )); end of conservatively-transduce-wff

; NO LONGER USED
(defun productively-transduce-wffs (rules wffs)
(block outer
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Keep applying the rules at the top level of the wffs, until
; convergence. EACH RULE IS ASSUMED TO TAKE A LIST CONTAINING
; EXACTLY ONE FORMULA AS INPUT, AND TO PRODUCE A LIST OF FORMULAS
; AS OUTPUT. (A wff may be split into multiple ones, e.g., in
; Skolemization or conjunction splitting).
;
; THIS PROGRAM IS UNSAFE; FOR EFFICIENCY REASONS NO CHECKING
; FOR REPETITIVE CYCLING BACK TO THE SAME LIST OF WFFS IS MADE.
; (Such a check could be added by pushing new values of wffs2
; onto a list, say 'wff-lists', and returning from the loop if
; a previous value of wffs2 is recreated.)
;
 (let (wffs1 (wffs2 wffs))
      (loop (setq wffs1 wffs2)
            (dolist (r rules)
               (setq wffs2
                  (apply #'append
                     (mapcar #'(lambda (w) (transduce r (list w)))
                               wffs2))))
            (if (equal wffs2 wffs1)
                (return-from outer wffs1)))
 ))); end of productively-transduce-wffs

   
(defun subst! (x y z) (subst x y z)); synonym
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; N.B.: It is assumed that 'expr' contains only UNBOUND occurrences
; of x.

(defun new-skolem! (expr) ; revised Mar 13/14 (prefer "E...SK" for events)
;~~~~~~~~~~~~~~~~~~~~~~~
; create a symbol ending in ".SK" based on the input expr (a restrictor
; expression from a quantified wff, or a variable if there is no
; restrictor -- e.g., an episode variable). For a restrictor expression
; we try to extract a type (nominal) to use as basis for the Skolem
; constant; e.g., restrictor (x ((attr big.a) dog.n)) might yield a
; Skolem constant DOG3.SK.
  (prog (pred 1-char-string)
    (if (symbolp expr) ; unrestricted variable (assume no dot-extension)
        (return (intern (concatenate 'string 
                          (string (gentemp (string expr))) ".SK"))))
    ; 'expr' is an expression (if it is a non-symbol atom, an error
    ; will be -- and should be -- generated)
    (setq pred (find-likely-type-pred expr)); an atom or (plur <atom>)
    (when (null pred); this is likely for episodic variables, for example
       (if (atom (car expr)); extract 1-char string as root of the Skolem-
           (setq 1-char-string (1-char-string-from (car expr)))    ; name
           (setq 1-char-string "E")); default root of Skolem name
       (return (intern (concatenate 'string
                            (string (gentemp 1-char-string)) ".SK"))))
    (when (listp pred); a plural predicate, e.g., (plur dog.n)
          (setq pred (string-minus-dot-extension (second pred)))
          (return (intern (format nil "~S.SK" ; e.g., DOGS3.SK
                            ; this adds the S & digit(s):
                            (gentemp (format nil "~AS" pred))))))
    ; non-plural (atomic) predicate
    (setq pred (string-minus-dot-extension pred))
    (return (intern (format nil "~S.SK" (gentemp pred)))); e.g., DOG3.SK
 )); end of new-skolem!


(defun 1-char-string-from (atm); Mar 13/14
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Return a string that contains the first character of 'atm', if
; that character is alphabetic; otherwise return "E" (the default
; root character for Skolem names of entities introduced by
; quantification, without a type constraint -- which are often
; episodes
  (let* ((str (string atm)) (n (length str)) )
        (if (> n 1) (setq str (subseq (reverse str) (- n 1))))
        (if (alpha-char-p (car (coerce str 'list))) str "E")))


(defun find-likely-type-pred (expr); tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; 'expr' is expected to be a quantifier restrictor such as 
; (x ((attr big.a) dog.n)). Extract a likely type predicate (usually
; a nominal with extension '.n') -- here, 'dog.n' -- and return it.
; We also allow for coordinated wffs. By default (and in particular
; if expr has 3 elements), return nil.
;
; WARNING: This is intended for wffs *after* keyword reduction.
;   It is also not a model of good style.
;
  (prog ((n (length expr)) (poss-pred (second expr)) poss-preds)
        (if (and (= n 2) (eq (car expr) 'plur) (symbolp poss-pred))
            (return expr)); result of form (plur <atom>)
        (if (and (= n 2) (symbolp poss-pred); a common case
                 (or (string-ends-in (string poss-pred) ".N")
                      ; avoid returning predicates like 'happy.a',
                      ; but we might lack an '.n', as in 'entity'
                     (lacks-dot-extension poss-pred)))
            (return poss-pred))
        ; atomic predicate with non-nominal extension? 
        (if (and (= n 2) (atom poss-pred))
            (return nil))
        ; complex predicate?
        (if (= n 2) (go dig))

        ; Is expr a coordinated wff (2nd element a coordinator)?
        (when (coord? poss-pred)
              (setq poss-preds 
                    (mapcar #'find-likely-type-pred
                            (cons (car expr) (cddr expr))))
              (setq poss-preds (remove nil poss-preds)); drop any nil's
              ; is there a plural or a <noun>.n among the poss-preds?
              (setq poss-pred
                    (find-if #'(lambda (x) 
                                 (or (and (listp x) (eq (car x) 'plur))
                                     (and (symbolp x)
                                          (string-ends-in (string x) ".N"))) )
                              poss-preds))
              (if poss-pred (return poss-pred))
              ; failing the above, look for an atomic element of poss-preds
              ; (we don't have to check for unwanted dot-extensions, because 
              ; the recursive call avoided these; we've also eliminated nil):
              (setq poss-pred 
                    (find-if #'(lambda (x) (not (eq x 'entity)))
                             poss-preds))
              (if poss-pred (return poss-pred) (return nil)))
        
        ; n > 2 but expr is not a coordination (e.g., a relation):
        (return nil)
        
    dig ; n=2 but poss-pred is complex.
        (return (find-likely-type-pred poss-pred))
  )); end of find-likely-type-pred 

(defun dot-extension-as-list (sym)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 (cond ((not (symbolp sym)) nil)
       (t (let* ((str (string sym)) (chars (coerce str 'list)) n chars2)
                (setq chars2 (member #\. (reverse chars)))
                (if (null chars2) (return-from dot-extension-as-list nil))
                (setq n (- (length chars) (length chars2))); #chars after dot
                (last chars (+ n 1))))
 )); end of dot-extension-as-list


(defun string-minus-dot-extension (sym)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Create a string from a symbol but omit the (final) dot-extension, if any.
 (cond ((not (symbolp sym)) nil)
       (t (let* ((str (string sym)) (chars (coerce str 'list)) n chars2)
                (setq chars2 (member #\. (reverse chars)))
                (if (null chars2) (return-from string-minus-dot-extension str))
                (setq n (- (length chars) (length chars2))); #chars after dot
                (coerce (butlast chars (+ n 1)) 'string)))
 )); end of string-minus-dot-extension


(defun lacks-dot-extension (sym)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 (not (member #\. (coerce (string sym) 'list))))


(defun string-ends-in (str1 str2); tested
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; The test is case-independent
  (prog ((n (length str1)) (m (length str2)))
        (if (< n m) (return nil)
            (if (string-equal (subseq str1 (- n m) n) str2)
                (return t) nil))
  )); end of string-ends-in


