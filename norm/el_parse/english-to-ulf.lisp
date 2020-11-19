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

(defun english-to-ulf (str)
;~~~~~~~~~~~~~~~~~~~~~~~~~~
; Apply 'english-to-parse-tree' and then 'parse-tree-to-ulf'
;
 (let (parse-tree)
      (when (not (stringp str))
            (format t "~%**INPUT TO 'ENGLISH-TO-ULF' MUST BE A STRING")
            (return-from english-to-ulf `(**BAD INPUT ,str)))
      (when (string= "" str)
            (format t "~%**'ENGLISH-TO-ULF' RECEIVED EMPTY STRING AS INPUT")
            (return-from english-to-ulf nil))
      (setq parse-tree (english-to-parse-tree str))
      (parse-tree-to-ulf parse-tree)
 )); english-to-ulf
      

(defun english-to-parse-tree (str)
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
      (setq parse-tree (parse str)); Charniak parse
       ; which handles multi-sentence strings (with {. ! ?} punctuation)
      (if *show-stages*
          (format t "~%~% Initial parse tree: ~%   ~s~%~%" parse-tree))
  ;   (setq parse-tree; omit tree repairs for now (rewrite in TT?)
  ;       (repeatedly-repair-parse-tree parse-tree)
      parse-tree
 )); end of english-to-parse-tree

; 'repeatedly-repair-parse-tree' would be inserted here, doing repair-parse-tree,
; refine-parse-tree, and repair-refined-parse-tree (see interpret-tree in
; "elf-from-sentences.lisp")


