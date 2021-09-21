; Sep 20/20
; I'm borrowing the code from ~schubert/elf-to-sentences, main program
; 'process-sentence1.lisp', to get a (potentially somwhat postprocessed)
; parse tree, for use prior to parse tree to ULF conversion.
;
; Then the 'parse-tree-to-ulf' program is applied.
;
; To add the input repairs and parse-tree repairs, we would neen to define
; 'repeatedly-repair-parse-tree' (see below), and add various programs 
; from "process-sentence1.lisp" in "elf-from-sentences.lisp":
;   repair-input, tokenize-simply, detokenize, repair-parse-tree,
;   repair-refined-parse-tree, hide-ttt-ops, unhide-ttt-ops, & maybe more

(defun english-to-ulf (str &key (synparser "BLLIP"))
;~~~~~~~~~~~~~~~~~~~~~~~~~~
; Apply 'english-to-parse-tree' and then 'parse-tree-to-ulf'
;
; The keyword argument `synparser` selects the underlying syntactic parser.
; Currently supports "BLLIP" and "K&K" (the Berkeley parser). This is
; case-insensitive.
 (let (parse-tree)
      (when (not (stringp str))
            (format t "~%**INPUT TO 'ENGLISH-TO-ULF' MUST BE A STRING")
            (return-from english-to-ulf `(**BAD INPUT ,str)))
      (when (string= "" str)
            (format t "~%**'ENGLISH-TO-ULF' RECEIVED EMPTY STRING AS INPUT")
            (return-from english-to-ulf nil))
      (setq parse-tree (english-to-parse-tree str :parser synparser))
      (parse-tree-to-ulf parse-tree)
 )); english-to-ulf
      

(defun english-to-parse-tree (str &key (parser "BLLIP"))
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; This is extracted from the 'interpret' program from 'process-sentence1.lisp',
; except for input checks (moved to 'english-to-ulf'), omission of the final 
; '(interpret-tree parse-tree)', and insertion of (repeatedly-repair-parse-tree
;  parse-tree)
;
; The 'str' argument is a sentence given as a string
;
; Steps:
;   Obtain the Charniak parse using a system call, and convert
;   it into "Lispified" form (with special characters meaningful
;   in Lisp prefixed with a backslash)
;
 (let (parse-tree)
  ;   (setq str (repair-input str)); omit for now (photo-caption-oriented)
  ;   (if *show-stages*
  ;       (format t "~%~% (Possibly) adjusted input string: ~%   ~s~%~%"
  ;                 str))
      (setq parse-tree (parse str :parser parser)); Charniak parse
       ; which handles multi-sentence strings (with {. ! ?} punctuation)
      (if (unpunctuated-wh-question parse-tree)
          (setq parse-tree (parse (concatenate 'string str "?"))))
      (if *show-stages*
          (format t "~%~% Initial parse tree: ~%   ~s~%~%" parse-tree))
  ;   (setq parse-tree; omit tree repairs for now (rewrite in TT?)
  ;       (repeatedly-repair-parse-tree parse-tree)
      parse-tree
 )); end of english-to-parse-tree

; 'repeatedly-repair-parse-tree' would be inserted here, doing repair-parse-tree,
; refine-parse-tree, and repair-refined-parse-tree (see interpret-tree in
; "elf-from-sentences.lisp")

(defun unpunctuated-wh-question (tree)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; BLLIP misparses wh-questions w/o a question mark; so it should be re-parsed
; with a question mark. Tree is a wh-question ; if it starts with 
;  (S1 (<atom> (<WHXP> ...)))
; and its rightmost leaf is not punctuation (\. <punc>) where <punc in {? ! .}.
; <WHXP> is in {WHNP WHADJP WHPP WHADVP}.
;
 (if (or (atom tree) (atom (second tree)) (atom (second (second tree))))
     (return-from unpunctuated-wh-question nil)) 
 (and (eq (car tree) 'S1) 
      (or ; first take care of (S1 (<atom> (WHXP ...) ...) cases from BLLIP
          (member (car (second (second tree))) '(WHNP WHADJP WHPP WHADVP))
          (and; take care of (S1 (S (SBAR (WHXP ...) ...))) cases from BLLIP
            (eq (caadr tree) 'S) 
            (listp (second (second (second tree))))
            (member (car (second (second (second tree)))) 
                    '(WHNP WHADJP WHPP WHADVP))))
      (not (eq (car (rightmost-pair-of-atoms tree)) '\.))
 )); end of unpunctuated-wh-question


(defun rightmost-pair-of-atoms (tree)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 (cond ((atom tree) nil)
       ((and (car tree) (second tree)) 
        (rightmost-pair-of-atoms (cdr tree)))
       (t ; tree has one element
        (if (pair-of-atoms (car tree))
            (car tree)
            (rightmost-pair-of-atoms (car tree))))
 )); end of rightmost-pair-of-atoms


(defun pair-of-atoms (xx)
;~~~~~~~~~~~~~~~~~~~~~~~
 (and (listp xx) (= (length xx) 2) (atom (car xx)) (atom (second xx))
 )); end of pair-of-atoms

