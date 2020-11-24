
; Load all files needed for sentence processing. 
; ================================================================
; NB: "initialize-and-preprocess.lisp" LOADS SOME FILES FROM
; ~schubert/lf-from-treebank-trees/
; ----------------------------------------------------------------
;
; This may also be extended to allow for integration of results 
; into epi2, & QA. This would be done by borrowing from 
;   ~schubert/lbs/WORK/my-work/processing/caption-processing/,
; starting with epilog-related commands in the "load-all" file there.
; In the present file I have taken the epilog- and caption-oriented
; functions out of the "process-sentence.lisp" file and put them in
; "process-caption-contents-via-epilog.lisp" -- which currently is
; *not* expected to be loaded. But some of the functions could be 
; used for more general post-LF and knowledge-based processing.

; Load TTT so that TTT-dependent code can be loaded
; `````````````````````````````````````````````````
(load "../ttt/src/load")

; Main sentence processing code
; `````````````````````````````
(load "process-sentence1.lisp")

; Charniak parser
; ```````````````
(load "parse.lisp")

; Basic LF generation files
; `````````````````````````
(load "initialize-and-preprocess.lisp")
;     This also loads
;         /u/schubert/lf-from-treebank-trees/male-names.lisp
;         /u/schubert/lf-from-treebank-trees/female-names.lisp
(load "non-personal-names.lisp")
(load "stem.lisp")
(load "logical-form1.lisp")
(load "deindexing.lisp")
(load "scoping.lisp")
(load "logical-form-predicates.lisp")
;  ** Currently, I need to load preprocess-tree and combine-names
;     from the cdknext version of KNEXT to get this to run, because
;     the preprocess-tree program loaded by init.lisp calls on 
;     routines for SBAR classification that are incomplete. The
;     following enables this temporary expedient (from the caption code):
(load "refine-parse-tree-and-combine-names.lisp")

; TTT rules
; `````````
; Override some prior pred definitions in
;    ttt/examples/caption-funcdefs.lisp
; (but still very ad hoc):
(load "ttt-preds-and-functions.lisp")
; The repair rules also override those from
;    ttt/examples/caption-pp-repairs.lisp
(load "ttt-repair-and-canonicalization-rules.lisp")
; SBAR classification rules (and some helper functions):
(load "ttt-based-sbar-classification.lisp")
; Disambiguate roles of PP-logical forms within VP-logical forms
; ** However, I'm currently leaving he rules set empty and
;    doing disambiguation (of sorts) in the canonicalization rules
(load "ttt-based-pp-disambiguation-rules.lisp")

(defparameter *show-stages* nil)

(defparameter *print-notes* nil)

(if *print-notes*
(progn
(format t "~%~%~%NOTE: You can use the parser on a single sentence ~
          in the manner ~%      (parse ~s)" "This is a test")
(format t "~%    or on multiple punctuation-separated sentences, ~
          in the manner ~%      (parse-all ~s)" "He camped. He canoed? He capsized!")
(format t "~%    A useful temporary synonym for 'parse', avoiding output truncation: ~
           ~%      (defun p (x) (format t ~s ~a))" "~s" '(|parse| |x|))
(format t "~%~%NOTE: To parse and compute the logical form of a sentence, use ~
          ~%      (interpret ~s)" "This is a test.")
(format t "~%~%NOTE: To directly compute the logical form for a treebank tree, use ~
          ~%      (interpret-tree '(S (NP ...)))")
(format t "~%~%NOTE: To reinitialize the tense tree, use ~%      (new-tt)")
(format t "~%~%NOTE: To see sentence processing stages, do ~%      ~
           (setq *show-stages* t)~%~%")
))

