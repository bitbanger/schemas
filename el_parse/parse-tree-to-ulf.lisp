;; Started Apr 4/20
;; Create an preliminary ULF from a Treebank parse tree;
;; Use the POS's to attach type/sort suffixes to word stems, and adding tense
;; and plur operators -- but also attach occurrence indices, and annotate the 
;; new atoms with the original word as a property, for possible postprocessing 
;; error correction (e.g., changing a past to a past participle).
;;
;; E.g., from E45 file, collapse
;; 
;; ( (S
;;     (S
;;       (ADVP (RB Only) (RB recently) )
;;       (S
;;         (NP
;;           (ADJP (JJ new) )
;;           (|``| |``|) (NNS holes) (|''| |''|) )
;;         (AUX (VBD were) )
;;         (VP (VBN discovered) )
;;         (PP (IN in)
;;           (NP (PRP$ our) (NN safety) (NNS measures) ))))
;;     (\, \,)
;;     (CC and)
;;     (S
;;       (NP (DT a) (NN search) )
;;       (VP (VBZ is)
;;         (ADVP (RB now) )
;;         (PRT (IN on) ))
;;       (PP (IN for)
;;         (ADJP (JJR more) ))))
;;   (\. \.) )
;; 
;; into preliminary ULF
;; 
;; ((((Only.adv~1 recently.adv~2) 
;;    ((new.a~3 |``| (plur hole.n~4) |''|) (past be.aux-v~5) (pasv discover.v~6)
;;     (in.p~7 (our.d~8 safety.n~9 (plur measure.n~10) ))))
;;   \, and~11 ((a.d~12 search.n~13) ((pres be.v~14) now.adv~15 on.prt~16) 
;;                 (for.p~17 more.a ~18))) \.)
;; Editing needed:
;;  (Only.adv~1 recently.adv~2) --> (adv-e (Only.adv~1 recent.a~2))
;;  ((new.a~3 |``| (plur hole.n~4) |''|)  ... (plur measure.n~10) ) -->
;;  (k (mod-n new.a~3) |``| (plur hole.n~4) |''|)  ... (plur measure.n~10) ))))
;;  (in.p~7 (our.d~8 safety.n~9 (plur measure.n~10) )) -->
;;  (adv-e (in.p~7 (our.d~8 ((mod-n safety.n~9) (plur measure.n~10)) )))
;;  now.adv~15 --> now.adv-e~15
;;  on.prt~16 --> on.a~16  [cf. "on its way", "ongoing", "under way"]
;;  more.a~18 --> ((mod-n more.a~18 {ref.1}.n))
;;
;; If we make the ULF changes for quotation in the notes in this directory,
;; we'd also want
;;  ((mod-n (new.a~3)) |``| (plur hole.n~4) |''|) --> 
;;  ((mod-n new.a~3) (iq "holes" (plur hole.n~4)))
;;  
;;
;; Approach: 
;; - do some parse tree preprocessing, e.g., change VBN to VBEN if preceded by
;;   a form of "have"? Or do this later? e.g., eliminate null NP subjects,
;;   like (NP (-NONE- *)), and similarly other null constituents like
;;   (ADVP-1 (-NONE- *pseudo-attach*))
;; - for (AUX (X word)), tag 'word' based on that construct & drop the (AUX (X ..))
;;   adding a numeric index before the tag
;; - for (PRT (IN word)), tag 'word' with '.prt' & drop the (PRT (IN ..))
;;   adding a numeric index before the tag
;; - deal with other such simple, 1-word trees
;; - Otherwise tag 'word' in (X word) just based on X & drop the (X ..)
;;   appending a numeric index before the tag
;; Also attach possible types/sorts to the indexed words
;;

(defparameter *word-index* 0)

(defun parse-tree-to-ulf (tree)
;`````````````````````````````
; tree: a parse tree in the form annotated in the Brown corpus, or 
;       produced by the Charniak parser, BLLIP. These are very 
;       similar, but for example auxiliaries in the Brown corpus look
;       like this: (AUX (VBD had)), (AUX (TO to)), (AUX (MD would)), ...
;       whereas BLLIP produces (AUX had), (TO to), (MD would), ...
;       (really a cheat, discarding tense for 'have', 'be' auxiliaries).
;       A better way: (AUXD had), (AUX have), (AUXZ have), (TO to),
;       (AUXF would), where AUXF means finite, i.e., pres/past/cf
;       (where 'cf' means "counterfactual" or subjunctive)
;
; Preprocess parse-tree to allow more direct conversion to ULF;
; then apply 'parse-tree-to-raw-ulf; then postprocess the ULF
; to fill in anything systematically missing (e.g., *h or **h 
; variables, assuming this isn't handled in preprocessing and that
; we use **h for subdeletion), or systematically incorrect or 
; requiring further decomposition.
;
 (let ((tree1 tree))
      (setq *word-index* 0)
      (setq tree1 (preprocess-tree-for-ulf tree1))
      (setq tree1 (parse-tree-to-raw-ulf tree1))
      (postprocess-ulf-tree tree1)
 )); end of parse-tree-to-ulf


(defun parse-tree-to-raw-ulf (tree)
;`````````````````````````````````
  (cond ((null tree) nil); to allow empty cdr upon recursion
        ((atom tree); unexpected, because no recursion descends to the atomic
                    ; level, just to the (<atom> <atom>) level (exc. for nil)
         (format t "~%** Invalid input ~s to 'parse-tree-to-raw-ulf'" tree))
        ((and (listp (car tree)) (null (cdr tree))); double bracketing (Brown)?
         (parse-tree-to-raw-ulf (car tree))); drop the outer brackets
        ((and (eq (car tree) 'S1) (null (cddr tree))); (S1 (...)) (BLLIP)?
         (parse-tree-to-raw-ulf (second tree))); drop the (S1 (...)) wrapper
        ((simple-tree tree) ; of form (<atom> (<atom> <atom>))?
         (simple-tree-to-raw-ulf tree)); e.g., (AUX (VBD were)) -> (past be.aux~3)
        ((eq (car tree) 'MD) ; BLLIP fails to wrap (AUX ...) around modals
         (pos+word-to-raw-ulf 
                (list (inflect-aux! `(MD ,(cadr tree))) (cadr tree))))
        ((pos+word tree) (pos+word-to-raw-ulf tree)); e.g., (NN safety)
        (t (if (atom (car tree)); drop initial atom (nonterminal category)
                                ; and "recurse downwand" on (cdr tree)
               (mapcar #'parse-tree-to-raw-ulf (cdr tree))
               ; if (car tree) is not at atom -- a possible consequence
               ; of imperfect preprocessing -- recurse "downward" on the
               ; entire tree:
               (mapcar #'parse-tree-to-raw-ulf tree)))
 )); end of parse-tree-to-raw-ulf


(defun simple-tree (tree)
;```````````````````````
; Is the tree shape (<atomic-cat> (<atomic-cat> <word>))?
 (and (listp tree) (atom (car tree)) (cdr tree) (null (cddr tree)) 
      (listp (second tree)) (atom (car (second tree))) 
      (atom (second (second tree)))))


(defun pos+word (expr)
;`````````````````````
; At least for now, any list of two atoms counts as a POS plus a wor,
; e.g., (NN safety), (\. \.).
  (and (listp expr) (atom (car expr)) (atom (second expr))))


(defun simple-tree-to-raw-ulf (tree)
;``````````````````````````````````
; This is intended for occasional single-lexeme phrases where the phrase 
; type can't be dropped without losing information needed for mapping to ULF. 
; Inputs must be of form (atomic-cat (atomic-pos word)), o/w an error will occur.
;
; For example, (ADJP (VBG curving)) gets interpreted as an adjective, whereas
; (VBG curving) alone would be interpreted as a progressive verb. Similarly,
; (PRT (RP on)) is interpreted as a particle, whereas (RP ...) can also occur
; as an adverb or preposition in the Brown corpus.
;
; For most single lexemes there's no such ambiguity, e.g., (NNS people) is
; always a plural noun. with the unique ULF (plur person.n).
;
; Note that this program is used *after* application of preprocessing rules,
; so we could have regularized the types of the single-lexeme phrases via
; preprocessing rules (as we do for Brown auxiliaries like (AUX (VBZ has))).
;
; e.g., (PRT (IN on)) --> on.prt~16, , with ULF alternatives for 'on' attached
;       to on.prt~16, viz., (on.a~16 on.adv-a~16); these alternatives are
;       relevant to "The concert is on", "The concert went on"
; e.g., (ADJP (JJ new)) --> new.a~3 {assuming *word-index* was 2}
; e.g., (ADJP (JJR more)) --> more.a~18, with ULF alternatives for 'more' 
;       attached to more.a~18, viz., (more.adv-a~18 more.d~18)
; e.g., (VP (VBN discovered)) --> discover.v~6, with ULF alternatives for
;       'discovered' attached to discover.v~6: ((past discover.v~6) discovered.a~6)
; e.g., (ADVP (RB now)) --> now.adv-e~15, with ULF alternatives for 'now' 
;       attached to now.adv-e~15: (now.a~15) {"The talk is right now"}
; e.g., (NP (NNP Salem)) --> | Salem~2|, with alternative ULFs for 'Salem'
;       attached to | Salem|~2: (| Salem|.n~2)
; e.g., (NP (NN need)) -> need.n~21, with ULF alternatives for 'need' attached
;       to need.n~21: (need.v~21 (pres need.v~21) (pres need.aux-v~21));
;       NB: We don't try to add (k ...) at this point, since we should deal
;       systematically with bare NPs, as in "Great need exists for vaccines"
 (let ((cat (car tree)) (pos+word (second tree)) (pos (caadr tree)) 
       (word (cadadr tree)))
      (case cat 
            ; Originally, this allowed for simple trees like (AUX (VBD had)),
            ; (AUX (MD would)), (AUX (TO to)), as they occur in Brown trees,
            ; but these are now mapped in preprocessing to forms like 
            ; (AUXD had), (AUXF would), and (TO to).
            (PRT (pos+word-to-raw-ulf (list 'PRT word)))
                ; e.g., (PRT (RP on)) --> (PRT on) -> on.16.prt; 
                ; BLLIP tends to treat all isolated "on" instances as PRT,
                ; though sometimes (wrongly) as ADV, as in "The switch is on",
                ; and sometimes (wrongly) as P, as in "The light was on."
                ; Ideally we'd want interpretations indicated sense numbers,
                ; say, on.16.prt, on.17.a on.18.adv-a
            (ADJP (if (not (find pos '(JJ JJR JJS)))
                      ; e.g., (ADJP (VBG curving)) -- want 'curving.a'
                      (pos+word-to-raw-ulf (list 'JJ word))
                      (pos+word-to-raw-ulf pos+word)))
            (ADVP (if (eq pos 'PS)
                      (pos+word-to-raw-ulf pos+word)
                      (pos+word-to-raw-ulf (list 'RB word))))
            (NP (if (eq pos 'CD) 
                    (pos+word-to-raw-ulf (list 'NNP word)) 
                    (pos+word-to-raw-ulf pos+word)))
            (T (pos+word-to-raw-ulf pos+word)))
 )); end of simple-tree-to-raw-ulf


;; ** The last line of 'simple-tree-to-raw-ulf' assumes that POS + word combin-
;;    ations in other  "simple trees" are items for 'pos+word-to-raw-ulf', where
;;    we assume preprocessing has left only those instances of -NONE- lexemes
;;    and of ambiguous POS's (like (DT that)) that can be uniformly interpreted;
;;    e.g., in (NP (-NONE- T/*/0)), the lexeme becomes *h/Ka/tht respectively.
;;    e.g., remaining (WDT <word>) instances will be uniformly interpretable 
;;          (either as determiners, or as relative pronouns, whichever turns
