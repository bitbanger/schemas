;; July 27/21
;;
;; This file is is a revision of the way 'isa' works, so that the ETA pattern
;; matcher can be easily converted to using "dot-variables" (which will be
;; distinct from explicit word matches). 
;;
;; [The conversion will also require converting 'nil' in ETA input patterns
;; to !atom (or maybe something simpler like !1, !at or !ex, using a defpred).]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; In ETA, features are specified as property lists of words and features.
;; Mapcar is applied to 'attachfeat' for each list of form (feat atm1 atm2 ...),
;;
;; In TT, we want to use hash tables to obtain all the features of a word.
;; Prior to the revisions here, 'isa' directly accessed features of a dot-
;; atom via a 'case' list, and checked if the atom being tested was on the
;; list; however, there were also 4 instances where a property was checked
;; via a hash table (in particular, argument-taking properties of verbs).
;;
;; The new method (like the ETA method) should allow for isa-chaining. 
;; However, some negative features like .NOT-DT needed to be converted
;; to !-predicates, like !not-dt.
;;
;; Suppose the general hash table is *isa-features*. Then in trying to match
;; a feature f specified as .f (i.e., prefixed with a '.') in a pattern
;; to an atom w [allow  expressions to have features as well??], we first
;; check if f = w, in which case the result is true; otherwise we look up
;; w in *isa-features*, and check if f is on the list of features  f1, f2, ...,
;; fk that we retrieve. If so, the match succeeds. If not, we go through
;; f1, f2, ..., fk, looking up each of them in *isa-features*, to see if f
;; appears in any of the features we retrieve for them. This is iterated.
;;
;; The isa-hierarchy is very unlikely to reach very high (and gets sparser
;; the higher we go), so this should be efficient enough. But we do have to
;; guard against circularity (as in ETA) because there's no requirement in
;; feature specification to avoid circularity (e.g., synonyms are by their
;; nature cicular). So we keep a list of features we have used for access
;; into *isa-features*, and don't look up any given feature a second time. 
;;
;; One question is whether it's worthwhile to somehow distinguish features
;; that have parents in the isa-hierarchy from those that don't. E.g., we
;; could use two separate lists for each feature entry, or we could mark
;; a "has-parent" property. But for now, the added programming complexity
;; doesn't seem worthwhile for the time that would be saved...
;;
;; Note: we also want features (specified in a pattern with a dot) to match
;; themselves. E.g., specifying '.doctor' in a pattern should match 'doctor',
;; not only 'surgeon', 'podiatrist', etc. Do we always want this? ETA assumes
;; yes (a feature is just closely related to the words with that feature, 
;; and as such certainly related to themselves), but what if we want to use
;; feature categories, e.g., would we want '.name' to match word 'name'?
;; And would we want '.expletive' to match 'expletive'? I think a reasonable
;; answer is that if we don't want that match, we should instead use 
;; !-predicates, e.g., '!name', '!expletive', which also has the advantage
;; of allowing iteration, e.g., '?name', '*name', '+name', '?expletive', etc.
;; I think we still want to allow categories as isa-features, e.g., POS's
;; like 'aux', but keeping in mind that this will also match 'aux' appearing
;; in text.

(defparameter *isa-features* (make-hash-table)); the table with 'isa' data,
;``````````````````````````````````````````  linking atoms to dot-features
;                                            (which may also have dot-feats)
;
(defparameter *underlying-feat* (make-hash-table)); contains feat for
;`````````````````````````````````````````````````; dot-predicates of
                                                  ; form .feat

(defun attachfeat (feat-xx)
;``````````````````````````
; feat-xx: a list of form (feat x1 x2 ... xk)
;       where feat is a symbol, regarded as a feature
;       & x1, x2, ... are symbols (perhaps allowing expressions in future?) 
;       that will hereby be assigned feat, i.e., (isa xi feat) will be
;       true for each xi among x1, x2, ..., xk.
; We store feat as a feature of x1, x2, ..., xk in the *isa-features* table.
; We avoid duplication, for any xi that already has that feature.
; We also store feat under key .feat (the dot-prefixed version of feat)
; in table *underlying-feat*, for easy access to feat from .feat in the 
; 'match' function. 
;
 (let* ((feat (car feat-xx)) 
        (dot-pred (intern (concatenate 'string "." (string feat)))))
       (setf (gethash dot-pred *underlying-feat*) feat)
       (dolist (x (cdr feat-xx))
          (if (not (isa x feat))
              (push feat (gethash x *isa-features*))))
 )); attachfeat

;; NOTE: We can 'mapc' onto a list of feat-xx lists, like 'attachfeat' in the
;;       current ETA code (to be replaced using 'attachfeat'). But the
;;       initial feat should always be a dot-feature.
          

(defun isa (x feat) ; briefly tested July 27/21
;``````````````````
; x:    a symbol (e.g., 'surgeon' or 'doctor')
; feat: another symbol (e.g., 'professional'). In general, there is
;       no clear presumed logical relation between x and feat -- feat
;       simply "indicates" the sort of thing x refers to, in some sense.
;
; NB: an atom is always assumed to have itself as a feature; e.g., 
;     (isa 'this 'this) is true. So using '.occupation' in a pattern
;     will match 'occupation', even if the pattern coder wrote down
;       (occupation physicist cobbler poet teacher ...)
;     with the intention of using '.occupation' to match 'physicist', etc.,
;     in a sentence like "Alice is a physicist", and concluding "Alice
;     is employed". The sentence "Computer programming is an occupation"
;     would then likewise lead to the conclusion "Computer programming is
;     employed"! The moral is, if you want to use a match-predicate that
;     is true of various expressions but not itself, define it as a
;     !predicate rather than a feature.
;
; Method:
;     Look up x in the *isa-features* hash table and see if feat appears in the
;     retrieved list or in the lists (in the same table) associated with the
;     retrieved features, etc., while guarding against loops. Return T if 
;     the feature is found and NIL otherwise. Case is ignored.
;
  (prog (ff f closed fff)
        (if (eq x feat) (return t))
        ; The next 3 lines aren't needed for the 'match' function, which
        ; looks in hash table *underlying-feat* to find the feature corres-
        ; ponding to a dot-atom. However, in the syntax tree preprocessing 
        ; rules, we use some predicates that directly call "isa", where the
        ; second argument is a dotted atom. The next few lines remove the dot.
        (if (dot-atom x) 
            (setq x (intern (string-left-trim "." (string x)))))
        (if (dot-atom feat) 
            (setq feat (intern (string-left-trim "." (string feat)))))
        (if (eq x feat) (return t))
        ; frequent case: feat is on the list retrieved from *isa-features* for x:
        (setq ff (gethash x *isa-features*))
        (if (find feat ff) (return t))
        ; maybe a feature on list ff has feature feat, etc. (iteration)
        (if (null ff) (return nil))
        (setq closed (list x feat)); ff will serve as the open list
        (loop (setq f (pop ff))
              (when (not (find f closed))
                    (setq fff (gethash f *isa-features*))
                    (when fff (if (find feat fff) (return-from isa t))
                              (push f closed)
                              (setq ff (union fff ff))
                              (setq ff (remove f ff))); just in case
                    (if (null ff) (return-from isa nil))))
 )); end of isa
                              

; DOT-ATOMS .<FEATURE>: Can be viewed as pred's, for matching specific atoms
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
; But they don't allow for !/?/*/+ forms; a dot-predicate is satisfied iff
; there is an isa-path from the word being matched to the feature after
; the dot in the dot-atom. The dot-atom repertoire can be freely expanded.
;
; NB: 'isa' as defined above ensures that a dot-atom predicate is always
;     true of the atom following the dot (this is case-insensitive).
;
; The feature assignments explicitly enumerated here are for features that
; don't apply to more than about a dozen atoms. For ones applying to large
; numbers of atoms, we use separate statements below, that refer to named
; global lists containing those atoms.
;
; I also considered a special notation in TT for feature negation, e.g.,
; -.NP (doesn't have feature .NP), but decided for now this isn't
; tremendously useful, as we can also use defpred, e.g., 
;    (defpred !-NP x (not (isa x '.NP)))
; or, if we don't think the variants ?-NP, *-NP, +-NP will be needed,
;    (defun !-NP (x) (not (isa x '.NP)))
; Currently, the negative !-preds, defined via the 'defpred' macro, use
; !non- or !not- at the beginning of their names.
;
 (mapc #'attachfeat
   '((SQ SINV)
     (S SQ SINV S1 SBAR SBARQ)
     (SBAR SBARQ)
     (VP/SQ VP SQ)
     (VP/S VP S)
     (XP S NP VP AP ADJP ADVP PP WHNP WHADJP WHPP WHADVP)
     (XP-NON-VP S NP AP ADJP ADVP PP WHNP WHADJP WHPP WHADVP)
     (XP-OR-S S NP VP AP ADJP ADVP PP S SQ S1 SBAR SBARQ WHNP 
                      WHADJP WHPP WHADVP)
     (NON-PP S NP VP AP ADJP ADVP S SQ S1 SBAR SBARQ WHNP
                      WHADJP WHADVP)
     ; (NOT-NONE (not (eq atm '-NONE-); changed to !not-none
     (NN NNS)
     (NNP NNPS)
     (NN/NNP NN NNP); e.g., "{last} March" can be NN or NNP
     ; (NOT-DT (not (eq atm 'DT); changed to !not-dt
     (NP WHNP)
     ; CAVEAT: Feature predicates like the next two, subsuming both lexical
     ;         and phrasal elements, can lead to recursive run-away 
     ;         when rules that combine phrases are applied as often
     ;         as possible!
     (ADJP JJ JJR JJS)
     (ADVP WHADVP RB RBR RBS NEG PP)
     (NON-ADVP NP VP AP ADJP PP SQ SBARQ WHNP WHADJP WHPP)
         ; XP, but not explicit 'ADVP'; aimed at topicalization. Assume
         ; fronted SBARs are not considered topicalized: "Although he won,
         ; he's dissatisfied"; allow "Why are you leaving, I ask" as 
         ; topicalized, though probably will be misparsed aby BLLIP.
     (THIS-DAY yesterday today tomorrow)
     (WEEKDAY |Monday| | Monday| Monday 
       |Tuesday| | Tuesday| Tuesday |Wednesday| | Wednesday| Wednesday
       |Thursday| | Thursday| Thursday |Friday| | Friday| Friday
       |Saturday| | Saturday| Saturday |Sunday| | Sunday| Sunday)
     (TIME-PERIOD day week month year decade century morning evening night
       January February March April May June July August September October
       November December Christmas spring summer fall winter)
     (next/last next last)
     (WHNP WDT)
     (WHXP WHNP WHADJP WHPP WHADVP)
     (DT DT CD PRP$); initial CD is often a DT
     (a/an a an)
     (RB RBR RBS NEG); ex. of NEG: (NEG (NOT))
     ; (NOT-PREP-OR-SYMB (not (member atm '(IN -SYMB-))))
     ;    replaced by !NOT-PREP-OR-SYMB
     (NP-i NP-1 NP-2 NP-3 NP-4); e.g., rightward displace't
     (CC \, \;); for detecting end of an NP
     (and/or and \& or \'r)
     (EXTRAP-S SBAR-1 SBAR-2 SBAR-3 SBAR-4 S-1 S2 S-3 S-4)
      ; these SBAR/S variants are used in Brown to correlate it-extra
      ; with a corresponding clause; in ULF, we expect that it-extra
      ; provides enough of a clue to locate the extraposed clause.
     (PP WHPP PP-1 PP-2 PP-3 PP-4)
     (with without); "with" is special, allowing 
                                       ; verbless S-complements
     (when where whenever wherever why how)
                                 ; e.g., when/where there is peace ...
     (PRED ADJP PP); (VP (VBG|VBN ...) ...) also, but ....
     (ADJP/NP/PP/SBAR/UCP/PRED
            ADJP NP PP SBAR UCP PRED);copular complements
     (POSTMOD ADJP PP SBAR); (VP (VBG ...) ...) also, but
                                          ; allowing general VP seems risky
                                          ; Use separate rules for VBG &
                                          ; VBN postmodifiers
     (DIS-POSTMOD PP-1 PP-2 PP-3 PP-4 SBAR-1 SBAR-2 SBAR-3
        SBAR-4 VP-1 VP-2 VP-3 VP-4 ADJP-1 ADJP-2 ADJP-3 ADJP-4); more?
     (JJ JJR JJS); NB: .ADJP also inludes these
     (VB VBZ VBP VBD VBG VBN VBEN)
     (VBG/VBN VBG VBN)
     (VBG/AUXG VBG AUXG)
     (AUX TO AUXZ AUXD AUXP AUXF AUXG AUXEN AUX-CF MD)
     (MD/AUX/TO MD AUX TO)
     (VB/AUX VB VBZ VBP VBD VBG VBN VBEN
                          AUX AUXZ AUXD AUXP AUXG AUXEN AUX-CF MD)
     (POSS-BASE-V VB VBZ VBP AUX AUXZ AUXP); only VB & AUX
               ; (excluding MD) should actually be base forms, but this
               ; list allows for parsing errors
     (PASPART VBN VBEN VBD AUX AUXEN); possible parser-
                         ; assigned POS's for a past/passive participle
     (final-punc \. ? !)
     (it/they/them/this/that it they them this that)
     (have \'ve has \'s having had \'d)
     (have/ve have \'ve)
     (be is \'s are am \'m was were being been \'re)
     ; (non-be (not (find atm
     ;                '(be is \'s are am \'m was were being been \'re))
     ; replaced by !non-be
     (is/s/am/m is \'s am \'m)
     (was/were was were)
     (are/re are \'re)
     (been/being been being)
     (be/become be is \'s are am \'m was were being been \'s \'re
                             become becomes became becoming)
     (go goes going gone went)
     (say says said adds added remarked comments commented shouts
      shouted yells yelled confides confided whispers whispered asserts
      asserted laughed stated blabbers blabbered blurts blurted mutters
      muttered drawls drawled mouthed sputtered spluttered suggests 
      suggested recites recited repeats repeated expostulated affirms
      affirmed claims claimed exclaims exclaimed asks asked ordered
      wonders wondered snarls snarled gasped purrs purred declares
      declared announce announced alleges alleged avers averred hints
      hinted repeats repeated concludes concluded surmised speculates
      speculated insists insisted maintains maintained); Hmm, this 
          ; probably should be treated as a named list of atoms, as below
 )); end of feature assignment list

; Features that apply to numerous atoms on given named lists
;
(mapc #'(lambda (f+name) (attachfeat (cons (car f+name) (eval (cadr f+name)))))
   '((N-PROPOS-OBJ *n-propos-obj*)
     (N-COMMUN-OBJ *n-commun-obj*)
     (N-COG-OBJ (union *n-propos-obj* *n-commun-obj*))
 ))


