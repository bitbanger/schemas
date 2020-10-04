;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                          ;;
;; IMPORTANT POINT TO KEEP IN MIND: Ensure that preprossesing changes POS's ;;
;; that are ambiguous, in such a way that ones that are *not* changed are   ;;
;; uniquely interpretable (i.e., correspond to a unique type). This applies ;;
;; to the -NONE- POS, to WDT, WP, and various others.                       ;;
;;                                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Some likely rules (where 1 < 2, 4 < 5, 7 < 8, ... ordering is observed):

; Hyp: Maybe rules that collect terms (introducing extra brackets)
;      should be applied before other restructuring rules.

; Hyp: Maybe rules with deeper patterns should be applied before ones with
;      shallower patterns

; Hyp: Maybe rules with narrower patterns should be applied before ones with
;      wider patterns (more top-level terms)

; Hyp: Maybe rules that delete terms should be applied before ones
;      that replace or rearrange terms
;
; Hyp: Rules that introduce new symbols ...?
;
; Or maybe all rules can be formulated to ensure they can be applied
; bottom-up! I.e., don't introduce low-level material or structures that
; lead to pattern-recognition failure at higher levels; *OR*, when introducing
; new material or structures, make sure wider-scope or deeper patterns 
; containing them will recognize them.
;
; So this would potentially cause e.g., (DT that) to be at first changed to
; (PRP that), then back to (DT that) if followed by an nominal predicate, or
; to (WDT-REL that) in context (SBAR (WHNP (PRP that)) ..) -- which is also
; what (WDT that) should be changed to in context (SBAR (WHNP (WDT that)) ..)
;
; But if we go bottom-up, the shallowest rules that change POS's should be
; applied first.

; SINGLE-WORD RULES
;``````````````````
(defparameter *expand-something*
; Expand (NN something) into det + NN
    '((NP (NN something) *expr) (NP (DT some) (NN thing) 3)))

(defparameter *expand-everything*
; Expand (NN everything) into det + NN
    '((NP (NN everything) *expr) (NP (DT every) (NN thing) 3)))

(defparameter *expand-anything*
; Expand (NN anything) into det + NN
    '((NP (NN anything) *expr) (NP (DT any) (NN thing) 3)))

(defparameter *expand-someone*
; Expand (NN someone) into det + NN
    '((NP (NN someone) *expr) (NP (DT some) (NN person) 3)))

(defparameter *expand-everyone*
; Expand (NN everyone) into det + NN
    '((NP (NN everyone) *expr) (NP (DT every) (NN person) 3)))

(defparameter *expand-anyone*
; Expand (NN anyone) into det + NN
    '((NP (NN anyone) *expr) (NP (DT any) (NN person) 3)))

(defparameter *comb-such-a*
; Delete the indefinite "a" or "an" from, e.g., "such a great party",
; "such an idiot"
    '((NP (PDT such) (DT .A{N}) *expr) (NP (DT such) 4)))

(defparameter *pluralize-nn-foot*
; Change (NN \') to (NNS \')
    '((NN \') (NNS \')) )

(defparameter *pluralize-nn-inch*
; Change (NN |''|) to (NNS |''|)
    '((NN |''|) (NNS |''|)) )

(defparameter *change-aux-have-to-v*
; BLLIP misparses "have" in context "to have NP" as auxiliary. Fix it.
   '((VP (TO to) (VP (AUX have) (NP +expr))) (VP (TO to) (VP (VB have) 3.3))))

(defparameter *wrap-aux-around-auxliary-to*
; While Brown uses (AUX (TO to)) for auxilary 'to', the BLLIP parser omits the
; AUX, so that it might be a preposition; wrap a (AUX ...) where appropriate
   '((VP ?expr (TO to) ?expr (VP +expr)) (VP 2 (AUX (TO to)) 4 5)))

(defparameter *change-had-to-subjunctive-in-inverted-sbar*
; e.g., "had" in adverbial clause "had he not left" should be subjunctive (cf)
   '((SBAR (SINV (AUX (VBN had)) +expr)) (SBAR (SINV (AUX (VB-CF had)) 2.3))) )

(defparameter *externalize-final-period*
; While Brown adds final periods as sentence-sibling, BLLIP adds it as VP sibling.
; Make it a sentence sibling.
   '((.S +expr (VP +expr) ?expr (\. \.)) (1 (1 2 3 4) (\. \.))))

(defparameter *externalize-final-question-mark*
; While Brown adds final '?' as sentence-sibling, BLLIP adds it as VP sibling.
; Make it a setennce sibling.
   '((.S +expr (VP +expr) ?expr (\. !)) (1 (1 2 3 4) (\. ?))))

(defparameter *externalize-final-excl-mark*
; While Brown adds final '!' as sentence-sibling, BLLIP adds it as VP sibling.
; Make it a sentence sibling.
   '((.S +expr (VP +expr) ?expr (\. !)) (1 (1 2 3 4) (\. !))))

; RULES THAT CHANGE MORE THAN A WORD
;````````````````````````````````````
(defparameter *comb-adv-adjp* 
; For an adv immediately preceding an adj or adjp, add a level of adjp structure:
   '((*expr +list (.RB +expr) (.ADJP +expr) *expr) (1 2 (ADJP 3 4) 5)) )

(defparameter *reformat-advp-rb-rb*
; e.g., (ADVP (RB steadily) (RB enough)) ==> 
;       (ADVP (-NONE- adv) (ADJP (RB steadily) (JJ enough)))
    '((ADVP (.RB +expr) (RB !atom)) 
      (ADVP (-NONE- adv) (ADJP (RB 2.2) (JJ 3.2)))) )
  
(defparameter *comb-nn-nn*
; For an NN (or NNS) modifying an NN (or NNS), add a level 
; of internal NN structure:
    '((.NP *expr (.NN +expr) (.NN !expr) *expr) (1 2 (4.1 3 4) 5)) )
                ;````````````````````````will cause left-to-right noun pairing
; NB: Though NN and NNS categorize just one word in Treebank parses, the rules
;     here may also introduce multiconstituent versions, e.g., NN- or JJ-pre-
;     modified nouns. That's why we use (.NN +expr), rather than (.NN !atom),
;     in the above rule

(defparameter *comb-nn-nn-cc*
; For a noun premodifier in an NP ending at a coordinator or
; comma, add a level of NN structure:
    '((.NP *expr (.NN +expr) (.NN +expr) (.CC !atom) +expr)
      (1 2 (4.1 3 4) 5 6)) )

(defparameter *comb-cc-joined-nns*
; For two CC-joined NNs (possibly with modifiers) form a single, complex NN
   '((!atom (.DT !atom) *list (.NN +expr) (.CC !atom) *list (.NN +expr)) 
     (1 2 (4.1 (4.1 3 4) 5 (7.1 6 7)))) )

(defparameter *comb-cc-joined-adjs*
; For two CC-joined adjectives (possibly modified) form a single, complex JJ
; e.g., (NP (DT a) (JJ smart) (CC and) (JJ savvy) (NN guy))
   '((NP (?list (.JJ !expr) (CC !atom) (.JJ !expr) +expr))
     (NP (2.1 (2.4.1 2.2 2.3 2.4)) 2.5)) )

(defparameter *comb-3-cds*
; For 3 successive count words (e.g., (NP (CD 3) (CD hundred) (CD thousand) ...))
; structure them properly; this could be obtained via multiple passes, next rule
   '((NP (?list (CD !expr) (CD !expr) (CD !expr) *expr))
     (NP (2.1 (CD (CD 2.2 2.3) 2.4) 2.5))) )

(defparameter *comb-2-cds*
; For 2 successive count words (e.g., (NP (CD 3) (CD hundred)...))
; structure them properly
   '((NP (?list (CD !expr) (CD !expr) *expr))
     (NP (2.1 (CD 2.2 2.3) 2.4))) )

(defparameter *comb-cc-joined-cds*
; For two CC-joined count adj's (possibly modified) form a single, complex CD
; e.g., (NP (CD 12) (CC or) (CD 14) (NNS meters))
   '((NP (?list (CD !expr) (CC !atom) (CD !expr) +expr))
     (NP (2.1 (CD 2.2 2.3 2.4)) 2.5)) )

(defparameter *comb-nn-postmod*
; For an NN followed (*within* an NP or WHNP) by a postmodifier (e.g., PP),
; add a level of NN structure combining the predicates; any NN premods
; will already have been combined:
    '((.NP *expr (.NN +expr) +expr) (1 2 (3.1 (-NONE- n+preds) 3 4))) )
  
(defparameter *comb-adj-nn*
; For an adjective premodifier in an NP or WHNP, add a level of NN structure,
; where NN postmodifiers are assumed to have been NN-incorporated already:
    '((.NP *expr (.ADJP +expr) (.NN +expr)) (1 2 (4.1 3 4))) )

(defparameter *comb-adj-nn-cc*
; For an adjective premodifier in an NP or WHNP ending at a coordinator
; or comma, add a level of NN structure:
    '((.NP *expr (.ADJP +expr) (.NN +expr) (.CC !atom) +expr) 
      (1 2 (4.1 3 4) 5 6)) )

(defparameter *form-compar-with-gap*
; For a comparative like (ADJP (JJR sadder) (PP (IN than) (S <NP> (VP <V> ...))))
; replace (IN than) by (-NONE- than-gap) and put *h after the <V>:
    '((ADJP (JJR !atom) 
            (PP (IN than) (S (NP +expr) ?expr (VP (.VB .be-become) *expr))))
      (ADJP (JJR 2.2) 
            (PP (IN than-gap)
                (S 3.3.2 3.3.3 (VP 3.3.4.2 (-NONE- *h) 3.3.4.3))))) )
; We probably need variants, e.g., where the JJR is adv-premodified, as in
; "much sadder". Also, we need a rule where we have a non-.be-become verb,
; and ellipsis after the verb (cf. "It's bigger than I thought", where this
; first needs expansion to "It's bigger than I thought it is")

(defparameter *add-k-to-bare-np*
; For a bare NP add an implicit kind-forming operator; this assumes that
; NN premodifiers, the NP-internal postmodifiers, and then adj-premodifiers
; have already been added. NP-external postmodifiers are added later (by
; *comb-np-postmod*)
    '((NP (.NN +expr)) (NP (-NONE- K) 2)) )

(defparameter *form-what-a-np*
; E.g., "What a big house" currently gets parsed as 
;    (NP (WP what) (DT a) (ADJP (JJ big)) (NN house)),
; but it should be a nominal predicate (via '='), with emphatic "what" applied 
; to a nominal predicate (again via '='):
   '((NP (WP what) (DT .a) *expr (NN !expr))
     (NP (-NONE- =) (NP (DT what-em) (NP (-NONE- =) (NP 3 4 5))))) )

(defparameter *comb-what-np-sbar*
; E.g., "What a big house he has!" after the previous rule will have the form
; ((NP (-NONE- =) (NP (DT what-em) (NP ...))) (SBAR (-NONE 0) (S ...)))),
; whereas we want a sentence with an emphatic, extracted, fronted NP.
; Note that
   '((NP (NP (-NONE- =) (NP (DT what-em) (NP (-NONE- =) (NP +expr))))
         (SBAR (-NONE- !atom) (S +expr))); the (S +expr) should contain a gap
     (S (-NONE- sub) 2 3.3)) ); NB: dropped the (-NONE- !atom), o/w we'd get 
                              ;     a relative clause by later rules.

(defparameter *comb-np-postmod* ; dimensions (3 3) (breadth 3, depth 3);
;  Restructure an NP[with DT] + postmodifier so that the determiner applies
;  to the predicate of the NP *and* the postmodifier (use an 'n+preds' in ULF):
       '((NP (NP (.DT !atom) *expr (.NN +expr)) (.POSTMOD +expr))
         (NP 2.2 2.3 (2.4.1 (-NONE- n+pred) 2.4 3))) )

(defparameter *comb-np-vpg* ; dimensions (3 3) (breadth 3, depth 3);
;  Restructure an NP + (VP (VBG ...) ...) postmodifier so that the 
;  determiner applies to the predicate of the NP *and* the postmodifier 
;  (use an 'n+preds' in ULF); assume that the NP has already had NN
; premodifiers, internal postmodifiers, and adjective premodifiers
; incorporated (see earlier rules), so that now the NP starts with
; a determiner or (-NONE- k):
       '((NP (NP !expr (.NN +expr)) (VP (VBG !atom) *expr))
         (NP 2.2 (NP (-NONE- n+pred) 2.3 3))) )

(defparameter *comb-dt-postmod* ; dim (3 3)
;  Restructure a headless NP + postmodifier so that the determiner applies 
;  to the implicit predicate of the NP and the postmodifier (will become 
;  an 'n+preds'):
      '((NP (NP (DT !atom)) (.POSTMOD +expr)) 
        (NP 2.2 (NN (-NONE- n+preds) (NN {ref}) 3))) )

(defparameter *del-null-subj-after-comma*
; Delete an empty sentential subject for an S right after a comma;
; such an "S" is usually a predicate 
    '((+expr (\, \,) (S (NP (-NONE- *)) +expr) *expr) (1 2 (VP 3.3) 4)) )

(defparameter *comb-verbless-preds*
; For comma-separated predicates of a verbless sentential with[out]-complement,
; combine them into a conjunctive predicate (with the comma viewed conjunctively);
; we use whatever pred category was first as the category of the conjunction;
; we also "take a chance" that the material after the comma will indeed consist
; of further predicates; also, I'm tentatively using |,&| as "conjunctive comma";
; finally, the entire (with[out] S[verbless]) seems to always be an ADVP:
   '((PP (IN .with) (S (NP +expr) (.PRED +expr) (\, \,) +expr))
     (ADVP (-NONE- adv-a) (PP (PS 2.2) (S 3.2 (3.3.1 3.3 (|,&| |,&|) 3.5))))) )

(defparameter *del-inf-subj* ; dim (4 3)
; Delete empty subject-NP of a to-infinitive, making the infinitive an NP:
    '((S (NP (-NONE- *)) (AUX (To to)) *expr) (1 (NP 3 4))) )
; NB: This rules assumes that AUX has not yet been combined with the VP,
;     so it must precede *comb-aux-vp* (the next rule)

(defparameter *change-vform-to-vbn-after-be-being*
; e.g., the misparse (... (AUX (VBD was)) 
;                         (VP (VBG being) (VP (VBD swallowed) ...)))
; is changed to      (... (AUX (VBD was))      ^^^
;                         (VP (VBG being) (VP (VBN swallowed) ...)))
; NB: This assumes the initial AUX is still separate from the main VP --
;     so this must precede the next rule, which incorporates the auxiliary.
   '((+expr (AUX (!atom .be)) (VP (VBG being) (VP (.VB !atom) *expr) *expr) *expr)
     (1 2 (VP (VBG being) (VP (VBN 3.3.2.2) 3.3.3) 3.4) 4)) )

(defparameter *comb-aux-vp* ; dim (5 2)
; Add another level of VP structure for a "floating" auxiliary in an S:
    '((S +expr (AUX !list) *expr (VP +expr) *expr) (1 2 (VP 3 4 5) 6)) )

(defparameter *wrap-aux-around-have-before-vbn* ; (annotation errors)
; Allow for 1 or 2 intervening items, e.g., "have n't ever met him";
; this is ok even for "have n't been sleeping well" (i.e., an intervening
; item is aan auxiliary), since "have" should be auxiliary in that case too
   '((VP (!atom .have) ?expr ?expr (VP (VBN !atom) *expr)) (VP (AUX 2) 3 4 5)) )

(defparameter *change-vbn-to-vben-after-have*
; The previous rule will already have combined aux'y "have" + past-participle
; into (VP (AUX (.VB .have)) (VP (VBN ...))). Change VBN to VBEN. Can't allow
; for arbitrary intervening items, as those might be other auxiliaries (see next)
   '((VP ?list (AUX (!atom .have)) (VP (VBN !atom) *expr))
     (VP 2 3 (VP (VBEN 4.2.2) 4.3))) )

(defparameter *change-vbn-to-vben-after-have-adv*
; Cf. previous rule -- this one allows an adverb between "have" and the VBN;
; We can't collapse the 2 rules using an intervening ?list variable, because
; that would trigger on "has been notified" (vs. "has notified")
; into (VP (AUX (.VB .have)) (VP (VBN ...))). Change VBN to VBEN:
   '((VP ?list (AUX (!atom .have)) (.RB !expr) (VP (VBN !atom) *expr))
     (VP 2 3 4 (VP (VBEN 5.2.2) 5.3))) )

(defparameter *change-vbn-to-vben-after-have-adv-adv*
; Cf. previous rule -- this one allows 2 adverbs between "have" and the VBN;
; Change VBN to VBEN:
   '((VP ?list (AUX (!atom .have)) (.RB !expr) (.RB !expr) (VP (VBN !atom) *expr))
     (VP 2 3 4 5 (VP (VBEN 6.2.2) 6.3))) )

(defparameter *change-question-initial-vbn-to-vbd* ; annotations error
; E.g., "had" in "had not Mr. Sam been there" was misannotated as (AUX (VBN had))
   '((.SQ (AUX (VBN had)) *expr) (1 (AUX (VBD had)) 3)) )

(defparameter *change-vbn-to-vben-after-have-in-question*
; e.g., "Has the man left" -- "left" should be VBEN, i.e., non-passive;
; .SQ can be SQ (top-level question) or SINV (embedded inversion)
   '((.SQ (AUX (!atom .have)) (NP +expr) (VP (VBN !atom) *expr))
     (1 2 3 (VP (VBEN 4.2.2) 4.3))) )

(defparameter *change-vbn-to-vben-after-have-adv-np-in-question*
; e.g., "Has n't the man left" -- "left" should be VBEN, i.e., non-passive;
; .SQ can be SQ (top-level question) or SINV (embedded inversion)
   '((.SQ (AUX (!atom .have)) (.RB !expr) (NP +expr) (VP (VBN !atom) *expr))
     (1 2 3 4 (VP (VBEN 5.2.2) 5.3))) )

(defparameter *change-vbn-to-vben-after-have-adv-np-adv-in-question*
; e.g., "Has n't the man already left" -- "left" should be VBEN, i.e., non-passive;
; .SQ can be SQ (top-level question) or SINV (embedded inversion)
   '((.SQ (AUX (!atom .have)) (.RB !expr) (NP +expr) 
                                          (.RB !expr) (VP (VBN !atom) *expr))
     (1 2 3 4 5 (VP (VBEN 6.2.2) 6.3))) )
  
(defparameter *change-s-to-gerund* ; dim (3 3)
; Recast a gerund with an empty subject as an NP with an implicit Ka:
    '((S (NP (-NONE- *)) (VP (VBG !atom) *expr)) (NP (-NONE- Ka) 3)) )
  
(defparameter *change-s-to-vp*
; Recast a putative S with a trace-subject (that's really a VP within 
; an S-REL -- an SBAR in the original parse) as a VP:
       '((S (NP (-NONE- T)) !expr) 3) )
  
(defparameter *del-sbarq-subj*
; Delete empty subject from  wh-question
       '((SBARQ (WHNP !atom) (SQ (NP (-NONE- T)) *expr)) 
         ((-NONE- sub) 2 3.3)) )
; Elsewhere, any remaining trace (NP (-NONE- T)) will be interpreted as
; *h in ULF; if we were to use rule '((NP (-NONE- T)) (-NONE- *h)) ), we
; would then have to change *change-s-as-vp* to look for (-NONE- *h), or
; add a variant like that to the current version.

(defparameter *comb-np-poss*
; e.g., (NP (NP (DT the) (NN woman)) (POS \'s) (NN stepson) ...) should become
;       (NP (NP (DETP (NP (DT the) (NN woman)) (POS \'s)) (NN stepson)) ...)
   '((+expr (NP +expr) (POS \'s) (.NN +expr) *expr) (1 (NP (DETP 2 3) 4) 5)) )

(defparameter *comb-6-successive-nnp*
   '((*expr (.NNP +expr) (.NNP +expr) (.NNP +expr) (.NNP +expr) 
            (.NNP +expr) (.NNP +expr)) 
     (1 (7.1 (!merge-names '(2.2 3.2 4.2 5.2 6.2 7.2))))) )

(defparameter *comb-5-successive-nnp*
   '((*expr (.NNP +expr) (.NNP +expr) (.NNP +expr) (.NNP +expr) (.NNP +expr)) 
     (1 (6.1 (!merge-names '(2.2 3.2 4.2 5.2 6.2))))) )

(defparameter *comb-4-successive-nnp*
   '((*expr (.NNP +expr) (.NNP +expr) (.NNP +expr) (.NNP +expr)) 
     (1 (5.1 (!merge-names '(2.2 3.2 4.2 5.2))))) )

(defparameter *comb-3-successive-nnp*
   '((*expr (.NNP +expr) (.NNP +expr) (.NNP +expr)) 
     (1 (4.1 (!merge-names '(2.2 3.2 4.2))))) )

(defparameter *comb-2-successive-nnp*
   '((*expr (.NNP +expr) (.NNP +expr)) 
     (1 (3.1 (!merge-names '(2.2 3.2))))) )

(defparameter *change-nnp-to-nn-after-premod*
; e.g., "the silvery Moon"; NB: It's assumed that examples like "Mr. Smith",
; Vice President Gore" won't match here, because successive NNPs should
; already have been merged.
   '((NP (!atom !atom)  *expr (.NNP +expr)) (NP 2 3 (NN 4.2))))

(defparameter *change-nnp-to-nn-before-pp-of*
; e.g., "Speaker of the House" -- "Speaker" is a name-like *noun* here
; But "Stratford on Avon" leaves "Stratford" as a name.
   '((NP *expr (.NNP +expr) (PP (IN of) +expr)) 
     (NP 2 (NN (-NONE- n+preds) (NN 3.2) 4))) )

(defparameter *del-trailing-comma-from-np*; extend to other phrase types??
; e.g., "Behind [[this reply], and [its many variations],] is the ..."
   '((NP +expr (\, \,)) (NP 2)) )

(defparameter *change-indef-np-to-pred-after-be-or-become*
; e.g., "Alice became a doctor" --> drop the "a".
; NB: This rule and the next one need to come after combining pre- &
;     postmodifers of a noun with the noun, so that the (DT a) won't 
;     be embedded, as in (NP (NP (DT a) (NN man)) (PP (IN of) ...))
; Unfortunately, we'd either need extra rules, or repeated top-level      
; rule applications to remove "a" from *both* NPs in something like
; "Alice became a doctor and a community organizer".
   '((VP ?expr (.VB .be-become) *expr (NP (DT .a) +expr) *expr)
     (VP 2 3 4 (NP 5.3) 6)) )

(defparameter *change-np-to-equals-np-after-be-or-become*
; e.g., "Alice became the CEO of the company" --> introduce (= ...)
; This is the default *after* the previous rule has been applied.
   '((VP ?expr (.VB .be-become) *expr (NP +expr) *expr)
     (VP 2 3 4 (= 5) 6)) )

(defparameter *standardize-single-comma-binary-np-conj*
; e.g., "a good man, and a good American" becomes "a good man and a good American"
   '((NP (NP +expr) (\, \,) (CC .and-or) !expr) (NP 2 4 5)) )

(defparameter *standardize-double-comma-binary-np-conj*
; e.g., "a good man, and a good American" becomes "a good man and a good American"
   '((NP (NP +expr) (\, \,) (CC .and-or) (\, \,) !expr) (NP 2 4 6)) )

(defparameter *standardize-single-comma-ternary-np-conj*
; e.g., "a good man, a good American and a good Democrat", aside from brackets,
;        becomes "a good man and a good American a good Democrat"
; NB: comma deletion in NP conjunctions is crucial to avoid faulty appositive
;     formation by the *form-appos-from-np-and-name* rule below.
   '((NP (NP +expr) (\, \,) (NP +expr) (CC .and-or) !expr) (NP 2 5 4 6)) )

(defparameter *standardize-double-comma-ternary-np-conj*
; e.g., "a good man, a good American, and a good Democrat", aside from brackets,
;        becomes "a good man and a good American a good Democrat"
   '((NP (NP +expr) (\, \,) (NP +expr) (\, \,) (CC .and-or) !expr) (NP 2 6 4 7)) )

(defparameter *standardize-triple-comma-ternary-np-conj*
; e.g., "a good man, a good American, and, a good Democrat", aside from brackets,
;        becomes "a good man and a good American a good Democrat"
   '((NP (NP +expr) (\, \,) (NP +expr) (\, \,) (CC .and-or) (\, \,) !expr) 
     (NP 2 6 4 8)) )

(defparameter *form-appos-from-np-and-name*
; e.g., "his court-appointed attorney, Jack Walker", analyzed as successive
; NPs (separated by a comma and followed by one), should lead to ULF
; (np+preds NP1' (= NP2'))
   '((NP (NP +expr) (\, \,) (NP *expr (NNP +expr)) *expr)
     (NP (-NONE- np+preds) 2 (NP (-NONE- =) 4) 5)) )

(defparameter *form-appos-from-np-and-np*
; e.g., "the post he sought, Speaker and power-broker"
; a riskier version of the previous rule -- no NNP requirement, but we're
; not allowing trailing material (after the 2nd NP) in this case
   '((NP (NP +expr) (\, \,) (NP +expr))
     (NP (-NONE- np+preds) 2 (NP (-NONE- =) 4))) )

(defparameter *change-vbn-to-vbd-as-s-headword* 
; An error correction rule, e.g., In "before his father left", "left" is 
; VBD, not VBN. This rule needs to come after the -NONE- rules, since
; after an empty S-subject, a VBN is usually a passive participle.
  '((S (NP +expr) (VP (VBN !atom) *expr)) (S 2 (VP (VBD 3.2.2) 3.3))) )
  
; (defparameter *change-sbar-to-srel*
; ; Recast an SBAR starting with relative pronoun 'that' or 'which' as an S-REL:
; ; Not needed if residual WDT always marks a relative pronoun
;     '((SBAR (WHNP (WDT !atom)) (VP +expr)) (S-REL ((WDT-REL 2.2.2)) 3)) )

(defparameter *change-wdt-to-dt*
; Change WDT to DT if it's the determiner of a NP with an NN or NNS head
      '((WHNP (WDT !atom) *expr (.NN +atom)) (WHNP (DT 2.2) 3 4)) )

; TBC: insert rule where e.g., (WDT what) in "What happened" becomes (WP what)
  
(defparameter *change-init-cd-to-dt*
;  For an initial count adjective in an NP, we have a kind/determiner ambiguity;
;  maybe use a DT by default, which could be postprocessed to, e.g. 'five-gen.d'
     '((NP (CD !atom) (.NN +expr)) (NP (DT 2.2) 3)) )
     ; the alternative would be ((-NONE- k) 2.2)
  
(defparameter *change-inf-to-prep*
;  Repair preposition 'to' misrepresented as infinitive auxiliary 'to':
     '((PP (TO to) (NP +expr)) (PP (IN to) 3)) ); error correction!
  
(defparameter *move-s-advp-to-front*
;  Move comma-enclosed S-premodifying ADVP to front:
     '((S +list \, (ADVP +expr) \, +expr) (S 4 (S 2 6))) )
  
(defparameter *change-non-init-pp-to-s-advp*
;  Expand noninitial S-premodifying PP into ADVP:
     '((S +list (PP +expr) ?\, (S +expr)) (S 2 (S (ADVP (-NONE- adv-s) 3) 5))) ) 
  
(defparameter *change-init-pp-to-s-advp*
;  Expand initial S-premodifying PP into ADVP:
     '((S (PP +expr) ?\, (S +expr)) (S (ADVP (-NONE- adv-s) 2) 4)) )
  
(defparameter *comb-advp-s*
;  Insert another level of S-structure for a noninitial S-premodifying ADVP
     '((S +list (ADVP +expr) ?\, (S +expr)) (S 2 (S (3 5)))) )
  
(defparameter *change-empty-that-to-relativizer*
;  Replace empty relativizer so that its ULF will be tht.rel (the default
;  ULF for silent "that" is complementizer tht):
     '((NP +expr (SBAR (-NONE- 0) (S +expr))) (1 2 (SBAR (-NONE- tht.rel) 3.3))) )
  
(defparameter *mark-it-extra*
;  Change "it" to "it-extra" in it-extraposition (the .EXTRAP-S feature can be
;  SBAR-1, SBAR-2, ..., S-1, S-2, ...): in ULF we assume we can locate the
;  it-referent without an explicit syntactic device; but I decided not to
;  use .EXTRAP-S here - such S's can be determined from the 'it-extra.pro'
     '((NP (PRP it) (!atom (-NONE- *pseudo-attach*))) (NP (PRP it-extra))) )

(defparameter *del-x-wrapper*
; (X ...) seems to get wrapped around a phrase where the annotator thought
; it is implicitly some higher-level phrase, but not sure what.
; This rule should be applied before most other rules, lest it block
; application of rules that expect the phrase that the (X ...) is hiding.
   '((X !expr) 2) )

(defparameter *raise-displaced-s-final-postmod*
;  In Brown, rightward-displaced NP-postmodifiers in the subject are 
;  treated as siblings of the other sentence constituents; we want a 
;  2-part rep (replace) construct at the S-level instead; we introduce
;  the replacement operator rep here, while we'll introduce the *p 
;  placeholder with separate rules using the *pseudo-attach* markings.
;  The .DIS-POSTMOD feature covers displaced postmod predicates -- e.g., 
;  PP-2, SBAR-2 (as rel-clause), VP-3 (a participle), ADJP-2, etc?
     '((S +expr (\, \,) (.DIS-POSTMOD +expr)) (S (-NONE- rep) (S 2) 4)) )

(defparameter *raise-displaced-s-final-appos*
; We need a separate rule for appositives, as they need an '=' relation
; to yield a predicate:
     '((S +expr (\, \,) (.NP +expr)) (S (-NONE- rep) (S 2) (NP (-NONE- =) 4))) )

;; This rule did the rep + *p conversion in one fell swoop; if the above rules
;; misidentify displaced phrases (because of not checking for the *pseudo-attach*
;; pairing with the postmodified NP), this may be needed after all.
;;
; (defparameter *restruc-displaced-appos*
; (defparameter *restruc-displaced-postmod*
; ; the postmodifier can be a PP, rel-clause (headed e.g., by (SBAR-2 ...)),
; ; participial VP, **others?
;     '((S (NP (NP +expr) (!atom (-NONE- *pseudo-attach*))) +expr (\, \,)    
;              (.DIS-POSTMOD +expr))
;       (S (-NONE- rep) (1 ((-NONE- np+preds) (NP 2.2.2) (-NONE- *p)) 3) 5)) )

;; This rule did the rep + *p conversion in one fell swoop; if the above rules
;; misidentify displaced phrases (because of not checking for the *pseudo-attach*
;; pairing with the postmodified NP), this may be needed after all.
;;
; (defparameter *restruc-displaced-appos*
; ;  In Brown, rightward-displaced appositives are treated as siblings
; ;  of the postmodified NP; we want a 2-part rep (replace) construct instead:
; ;  (e.g., scan for "rock" and "skinny" in p16.cmb); !atom is usually NP-1,
; ;  NP2,, etc., but also can be SBAR-2, etc.
;     '((S (NP (NP +expr) (!atom (-NONE- *pseudo-attach*))) +expr (\, \,) 
;              (.NP +expr))
;       (S (-NONE- rep) (1 ((-NONE- np+preds) (NP 2.2.2) (-NONE- *p)) 3) 
;                     (NP (-NONE- =) 5))) ); the equality makes the NP a pred

(defparameter *raise-displaced-vp-final-postmod*
; Brown has rightward-displaced postmodifiers both at the end of S and at
; the end of VP;
    '((VP +expr (\, \,) (.DIS-POSTMOD !expr)) (VP (-NONE- rep) (VP 2) 4)) )

(defparameter *raise-displaced-vp-final-postmod*
; This is a case where the determiner should scope over the NN along with
; the displaced postmodifier not just the NN
   '((VP +expr (NP (NP (DT !atom) (NN +atom)) 
                (.DIS-POSTMOD (-NONE- *pseudo-attach*))) +expr (.DIS-POSTMOD +expr))
     (VP (-NONE- rep) (VP 2 (NP (DT 3.2.2.2) (NN (-NONE- n+preds) 3.2.3 
                                                         (-NONE- *p))) 4) 5)) )

;; ** I'll presumably need a rule for an S-final postmod also, as in
;;    "A man walked in who was wearing a mask"

(defparameter *raise-displaced-np-final-postmod*
; e.g., "the great push initiated recently to teach computer skills in grade school"
; e.g., "the great advances that have been made in recent years in face recognition"
; [my feeling is that this is just free-ordering of noun adjuncts/complements]

 (  ));***TBC

(defparameter *raise-displaced-vp-final-appos*
; Brown has rightward-displaced appositives both at the end of S and at
; the end of VP;
   '((VP +expr (\, \,) (.NP +expr)) (VP (-NONE- rep) (VP 2) (NP (-NONE- =) 4))) )

(defparameter *add-postmod-placeholder*
; Introduce np+preds and pred-placeholder *p for NP with displaced postmodifier;
  '((NP (NP +expr) (!atom (-NONE- *pseudo-attach*)))
    (NP (NP (-NONE- np+preds) 2.2 (-NONE *p)))) )

; TBC -- thoroughly check the accuracy and coverage of the above rules for
;    rightward displacement; In particular, does the immediately preceding
;    rule wrongly apply to other uses of *pseudo-attach*, like "as ... as ..."
;    comparatives, etc.?

;; This rule did the rep + *p conversion in one fell swoop; if the above rules
;; misidentify displaced phrases (because of not checking for the *pseudo-attach*
;; pairing with the postmodified NP), this may be needed after all.
;;
; (defparameter *restruc-displaced-postmod*
; ;  In Brown, rightward-displaced postmodifiers are treated as siblings
; ;  of the postmodified NP; we want a 2-part rep (replace) construct instead:
; ;  (e.g., scan for "bleeding" in p16.cmb); 
;     '((VP +expr (NP (NP +expr) (!atom (-NONE- *pseudo-attach*))) +expr (\, \,) 
;              (.POSTMOD +expr))
;       ((-NONE- rep) (1 ((-NONE- np+preds) (NP 2.2.2) (-NONE- *p)) 3) 
;                     ((-NONE- =) 5))) );

;; This rule did the rep + *p conversion in one fell swoop; if the above rules
;; misidentify displaced phrases (because of not checking for the *pseudo-attach*
;; pairing with the postmodified NP), this may be needed after all.
;;
; (defparameter *restruc-displaced-appos*
; ;  In Brown, rightward-displaced appositives are treated as siblings
; ;  of the postmodified NP; we want a 2-part rep (replace) construct instead:
; ;  (e.g., scan for "bleeding" in p16.cmb); 
;     '((VP +expr (NP (NP +expr) (!atom (-NONE- *pseudo-attach*))) +expr (\, \,) 
;              (.NP +expr))
;       (VP (-NONE- rep) (1 ((-NONE- np+preds) (NP 2.2.2) (-NONE- *p)) 3) 
;                     (NP (-NONE- =) 5))) );


;  Delete *pseudo-attach* placeholders in other uses, such as correlating
;  "as ... as ..." comparatives
;  
(defparameter *add-sub-for-topicalized-pp*
;  Add an implicit substitution operator to the topicalized PP of an
;  inverted sentence:
;  e.g., "Among them were a number of newsmen"
       '((SINV (PP +expr) (VP (.VB .be) (NP +expr))) 
         (SINV (-NONE- sub) 2 (VP 3.2 3.3 (-NONE- *h)))) ) 
;  TBC







; Possibly handle under-bracketed coordination in postprocessing??
; 
;  (.det .pred \, .pred \, .and .pred) ==> (1 (2 6 4 7) 
;                                               
; Similarly for coordination of different types and lengths







