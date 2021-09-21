;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                          ;;
;; IMPORTANT POINT TO KEEP IN MIND: Ensure that preprossesing changes POS's ;;
;; that are ambiguous, in such a way that ones that are *not* changed are   ;;
;; uniquely interpretable (i.e., correspond to a unique type). This applies ;;
;; to the -NONE- POS, to WDT, WP, and various others.                       ;;
;;                                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; All rules are currently applied top-down (repeatedly at each level till
; there's no change; one has to avoid rules where we'd keep adding something
; at a fixed level!
;
; THE RULES HERE ARE AIMED AT BOTH BROWN CORPUS PARSES AND BLLIP PARSES.
; THESE DIFFER IN SEVERAL WAYS, MOST NOTABLY IN TREATING AUXILIARIES:
; E.G., (AUX (VBZ HAVE))   VS   (AUX HAVE) <--- BLLIP  ("I have eaten")
;            ````Brown          ```````` unfortunately discards tense info!!
;
; NB: When these rules are applied, the extra wrapper ( (S ...)) that
;     Brown corpus parses use hasn't yet been removed. Analogously, the
;     extra wrapper (S1 (S ...)) that BLLIP parses produce hasn't yet been
;     removed. (This is done by 'parse-tree-to-raw-ulf' after application
;     of the preprocessing rules here.) This doesn't interfere with rule
;     applications, since they're applied at all levels.
;
; NB: The ordering of rules matters (though many shuffles are harmless);
;     i.e., rules may make changes that disable or enable application
;     of later rules. This is especially true for noun pre- and post-
;     modification -- e.g., postmodifiers should be incorporated into
;     the nominal predicate before premodifiers and determiners are
;     applied, and adjectival premodifiers should be applied before
;     a determiner is applied.
;
; NB: Occurrences of '-SYMB-' in the rules here are usually in the OUTPUT
;     pattern: Many of the rules introduce an element of form (-SYMB- <op>),
;     where <op> is a special symbol that will directly appear in the ULF
;     (as if it had been a surface word like "to" or "that"), e.g., *h, adv,
;     adv-a, adv-s, n+preds, np+preds, k, ka, =, sub, rep, *p. 
;
;     Occurrences of form (<XP> (-NONE- <symb>)) in the INPUT patterns are
;     deleted or replaced by something else; e.g., rule '*del-inf-subj*'
;     deletes an occurrence of (NP (-NONE- *)) -- an empty subject
;     ascribed by the Treebank parse to an infinitive phrase; e.g., rule 
;     '*change-s-to-gerund*' changes an occurrence of (NP (-NONE- *)) 
;     to (-SYMB- Ka) for a gerund -- where an empty subject has been 
;     ascribed by the Treebank parse to a gerund. In some cases, PREVIOUS
;     occurrences of (-SYMB- <op>) added by an output patterns is checked
;     for in the input of a subsequent rule to make a further change (even
;     though we try to minimize dependency of one rule on another); e.g.,
;     rule '*form-what-a-np*' introduces two (-SYMB- =) elements for a 
;     phrase like "what a big house" treated as a nominal predicate formed
;     by applying an emphatic "what" to another nominal predicate), and 
;     rule '*comb-what-np-sbar*' subsequently adds a (-SYMB- sub) operator
;     for a sentence like "What a big house you have".

(defparameter *preprocessing-rule-names* nil); (re-)initialize to nil
;```````````````````````````````````````````

; MACRO FOR COMBINING RULE-DEFPARAMETER OPERATIONS WITH STORAGE OF THE
; RULES IN *PREPROCESSING-RULE-NAMES*
(defmacro defrule (name body)
 (list 'progn
    (list 'defparameter name body)
    (list 'push (list 'quote name) '*preprocessing-rule-names*)))

; The list of rule names is reversed from the result of "push"ing them
; onto *preprocessing-rule-names* at the end; thus the rules will be applied
; in the order of appearance here.

(defrule *remove-s1-wrapper*
; (S1 ( ...)) is wrapped aroung BLLIP parses
    '((S1 !expr) 2))

(defrule *replace-initial-empty-list-in-s*
; These occur in some preprocessed versions (e.g., David Ahn/ Phil Michalak)
   '((() (S +expr)) 2))

(defrule *remove-additional-empty-lists*
; These occur in some preprocessed versions (e.g., David Ahn/ Phil Michalak)
   '((+expr () *expr) (1 3)))

; QUOTATION RULES:
; ````````````````
; Keep apparent mention quotes, wrapping the quoted text
; ``````````````````````````````````````````````````````
(defrule *enclose-quoted-vobj*
; E.g., "She said \, |``| do it \"." (Note: \" is parsed as (|''| |''|), 
; \` is parsed as (|``| |`|, etc.) In ULF, we just use \", no other quotes
   '((VP 1 (.VB .say) ?[comma] (|``| !atom) *expr (|''| !atom))
     (VP 2 3 (NP (-SYMB- \") 6 (-SYMB- \")))))

; " (This quote is to reset the text colorizing)

(defrule *enclose-quoted-vobj-wrapped-by-s*
; E.g., "He added \, |``| If this works \, I win \"." 
;       (This sort of form can give an (S (|``| |``|) ... (|''| |''|)))
   '((VP 1 (.VB .say) ?[comma] (S (|``| !atom) +expr (|''| !atom)))
     (VP 2 3 (S (-SYMB- \") 5.3 (-SYMB- \")))))

; " (This quote is to reset the text colorizing)

(defrule *enclose-fronted-quoted-vobj*
; E.g., " |``| I give up \" \, he said." (NB allow for \, in/outside "...")
   '((S (S (|``| !atom) +expr ?[comma] (|''| !atom)) ?[comma] 
        (S ![np] (VP 3 (.VB .say))))
     (S (-SYMB- sub) (S (-SYMB- \") 2.3 (-SYMB- \"))
                     (S 4.2 (VP 4.3.2 4.3.3 (NP (-SYMB- *h)))))))

; " (This quote is to reset the text colorizing) 

; Delete all other quotes
; ```````````````````````
(defrule *delete-quotes*
; E.g., "The |``| hopeless \" campaign"
    '((*expr ![quote] *expr) (1 3)))

; BRACKET RULES
; `````````````
(defrule *del-outer-s-brackets*
; E.g., "(This is a minor point.)"
   '((?atom (-LRB- -LRB-) (S *expr) (\. !atom) (-RRB- -RRB-))
     (S 3 4)))

(defrule *make-bracketed-np-after-np-into-appositive*
; E.g., "Smith (the school principal) has transformed the school."
   '((!atom *expr ![np] (-LRB- -LRB-) ![np] (-RRB- -RRB-) *expr)
     (1 2 (NP (-SYMB- np+preds) 3 (NP (-SYMB- =) 5)) 7)))

; Apart from these two deletion types, it's hard to deal systematically
; with brackets, and we'll just enclose single items in brackets, and
; "package" multiple bracket contents, and enclose them. 
;
(defrule *package-and-enclose-single-bracketed-phrases*
; E.g., "Bob (Alice's spouse) ..."
   '((!atom *expr (-LRB- -LRB-) (!atom *expr) (-RRB- -RRB-) *expr)
     (1 2 (4.1 (-SYMB- \() 4 (-SYMB- \))) 6)))
;
(defrule *package-and-enclose-multiple-bracketed-phrases*
; E.g., consider
;    "Smith (now the school principal) has transformed the school."
; This really means something like "Smith, who is now the school
; principal ...", but here we just wrap the ADVP and NP as an NP and
; keep & enclose the brackets. Similarly,
;    "The 6-3-3 (junior high school) system ..."
; was parsed in Brown making 6-3-3 a CD and "junior high school" a
; three-element JJ, JJ, NN sequence (no compound NN or NP formed).
; We wrap the 3-term sequence as an NN (maybe NP would work better?)
; and keep & enclose the brackets. Use the type of the last expression
; in brackets as overall type.
   '((!atom *expr (-LRB- -LRB-) +expr (!atom !expr) (-RRB- -RRB-) *expr)
     (1 2 (5.1 (-SYMB- \() (5.1 4 5) (-SYMB- \))) 7)))

; Delete all residual (round) brackets
;`````````````````````````````````````
(defrule *delete-left-brackets*
   '((*expr (-LRB- !atom) *expr) (1 3)))

(defrule *delete-right-brackets*
   '((*expr (-RRB- !atom) *expr) (1 3)))

; ** Rules could be added for bracketed constituents that "fit" grammatically,
;    but that's tough in general.

; SOME GLOBAL SENTENCE-RESHAPING RULES
;`````````````````````````````````````
(defrule *externalize-final-punctuation*
; While Brown adds final periods as sentence-sibling, BLLIP adds it as VP sibling.
; Make it a sentence sibling. The pattern looks for >= 2 expressions before the
; punctuation
   '((.S !expr +expr (\. .final-punc)) (1 (1 2 3) (\. 4.2))))

(defrule *insert-silent-complementizer-after-verb*
; E.g., "I think I see it" --> "I think [tht] I see it"; 
;       "I'm happy she's here." "I have no doubt she's smart."
   '((VP *expr (.VB !atom) ?expr (SBAR (S (NP +expr) +expr) ?expr))
     (VP 2 3 4 (SBAR (-SYMB- tht) 5))))

(defrule *insert-silent-complementizer-after-adj*
; E.g., "I'm sure [tht] you know the answer"; 
   '((ADJP *expr (.JJ !atom) ?expr (SBAR (S (NP +expr) +expr) ?expr))
     (ADJP 2 3 4 (SBAR (-SYMB- tht) 5))))

(defrule *insert-silent-complementizer-after-nn*
; E.g., "I have no doubt (in my mind) you know the answer"
   '((NP *expr (.NN +atom) ?expr (SBAR (S (NP +expr) +expr) ?expr))
     (ADJP 2 3 4 (SBAR (-SYMB- tht) 5))))
;
; In Brown, the silent complemetizer in the above cases is represented
; as (-NONE- 0), so we need variants of the rules above:
;
(defrule *insert-silent-complementizer-after-verb-in-brown*
; E.g., "I think I see it" --> "I think [tht] I see it"; 
;       "I'm happy she's here." "I have no doubt she's smart."
   '((VP *expr (.VB !atom) ?expr (SBAR (-NONE- !zero) (S (NP +expr) +expr)))
     (VP 2 3 4 (NP (-SYMB- tht) 5.3))))

(defrule *insert-silent-complementizer-after-adj-in-brown*
; E.g., "I'm sure [tht] you know the answer"; 
   '((ADJP *expr (.JJ !atom) ?expr (SBAR (-NONE- !zero) (S (NP +expr) +expr)))
     (ADJP 2 3 4 (SBAR (-SYMB- tht) 5.3))))

(defrule *insert-silent-complementizer-after-nn-in-brown*
; E.g., "I have no doubt (in my mind) you know the answer"
   '((NP *expr (.NN +atom) ?expr (SBAR (-NONE- !zero) (S (NP +expr) +expr)))
     (ADJP 2 3 4 (NP (-SYMB- tht) 5.3))))

(defrule *comb-aux-vp* ; NEEDED FOR BROWN TREES, WHICH USE (S [NP] [AUX] (VP ...))
; E.g., "He has left the crime scene."
; Add another level of VP structure for a "floating" auxiliary in an S:
    '((S +expr (.AUX !list) *expr (VP +expr) *expr) (1 2 (VP 3 4 5) 6)) )

(defrule *separate-s-premodifying-xp*
; e.g., "Among these people {,} she felt at home." 
;       "To Bob, she said nothing."
;       "Remarkably {,} he survived." 
;       "When it is raining, the roof leaks."
;       "Mary {,} everyone likes." "This, I like."
; A 'sub' operator for such topicalizations is introduced by later rules.
; We keep the comma (if any), to trigger later 'sub' insertion. In general,
; only postprocessing could figure out which PPs are adverbials, & what type.
   '((S (.XP-OR-S +expr) ?[comma] *expr (NP +expr) *expr (VP +expr) *expr)
     (S 2 3 4 (S 5 6 7 8))))

(defrule *extract-falsely-np-incorporated-tomorrow*
; E.g., "Tomorrow, Alice arrives." BLLIP makes an NP out of "Tomorrow, Alice"
; (though not out of "Today, Alice" -- just because "Tomorrow" is rare in
; training corpora! (Mind you, in rare cases the combination could be
; correct: "Tomorrow, Friday, is another day."
   '((S (NP (NP (NN tomorrow)) ?[comma] ![np] *expr) (VP +expr) 2)
     (S 2.2 (S 2.4 2.5 3)))) ; the front NP will still be made into ADVP

(defrule *repair-sentence-broken-by-initial-modifiers*
; This is similar to *separate-s-premodifying-xp* (above), but with multiple
; modifiers ahead of an <NP> and <VP> that should be a sentence.
; E.g., "{Tomorrow}/{On Friday}, after lunch, we leave." 
;       BLLIP forms (S <NP> , <PP> , <NP> <VP>)
; N.B.: We group, rather than stack, the premodifiers, since theoretically
;       (it can be argued) they fill a single gap at the end of the sentence.
;       This is why we keep the commas, if any -- they signal a sort of
;       conjunction.
   '((S ![pp-or-time-np] ?[comma] ![pp-or-time-np] ?[comma] ; allow for 3 mods
        ?[pp-or-time-np] ?[comma] ![np] ?expr (VP +expr) ?expr)
     (S (-SYMB- sub) (ADVP (-SYMB- adv-e) (PP 2 3 4 5 6)) (S 8 9 10 11))))

(defrule *group-episodic-sentence-premodifiers*
; This is similar to the above rule, but assumes that the final <NP> & <VP>
; were correctly combined into an S.
; N.B.: We group, rather than stack, the premodifiers, since theoretically
;       (it can be argued) they fill a single gap at the end of the sentence.
;       This is why we keep the commas, if any -- they signal a sort of
;       conjunction.
   '((S ![pp-or-time-np] ?[comma] ![pp-or-time-np] ?[comma] ; allow for 3 mods
        ?[pp-or-time-np] ?[comma] (S +expr))
     (S (-SYMB- sub) (ADVP (-SYMB- adv-e) (PP 2 3 4 5 6)) 8)))

(defrule *move-comma-embedded-s-premodifying-advp-to-front*
; E.g., "Next week, PERHAPS, the weather will improve."
; Move comma-enclosed S-premodifying ADVP to the front, dropping 1 comma;
; The assumption here is that such explicit, comma-embedded adverbials
; are sentence adverbials (typically adverbs, like "perhaps"). 
; Without a comma after it, the ADVP won't be treated as extracted
; (i.e., won't lead to introduction of a 'sub' operator for it); whatever
; additional XPs precede the sentence might lead to a 'sub' construct,
; if followed by a comma.
     '((S +list (\, \,) (ADVP +expr) (\, \,) +expr) (S 4 (S 2 (\, \,) 6))) )

; OMIT: We just can't tell which PPs ahead of a sentence are adverbials
; (defrule *change-s-premodifying-pp-to-advp*
; ; E.g., "IN ROME, life is hectic."; "In Rome, UNDER NERO, citizens thrived."
; ; Make (probably) topicalized PP(s) into ADVP(s);  remove commas;
; ; No extra S-level for any non-initial S-premodifier is added;
; ; 'sub' is added later.
;      '((S *expr ?[comma] (PP +expr) ?[comma] *expr (S +expr)) 
;        (S 2 (ADVP (-SYMB- adv-?) 3) 4 5)) ) 

(defrule *change-vp-embedded-by-sq-to-sq*
; e.g., BLLIP parses "How big is the house?" as (essentially)
;       (<how big> (SQ (VP <is> <the house>))), whereas we want
;       (<how big> (SQ <is> <the house>))
    '((.SBAR !list (SQ (VP (.VB/AUX !expr) +expr))) (1 2 (SQ 3.2.2 3.2.3))))

(defrule *change-where-to-wp-in-where-x-be-at*
; e.g., "I can see where you're at." BLLIP makes "where" an adverb, and
;       and adverb can't complete a PP (so we get no *h).
   '((SBAR (WHADVP (WRB where)) (S +expr (VP +expr (PP (IN at)))))
     (SBAR (WHNP (WP where)) 3)))

(defrule *move-whereas-to-sentence-level-connective*
; e.g., "Squirrels build nests, whereas chipmunks dig burrows."
;       BLLIP wrongly makes "whereas ..." a verb adjunct.
   '((S *expr (NP +expr) *expr (VP +expr ?[comma] (SBAR (IN whereas) +expr)))
     (S (S 2 3 4 (VP 5.2)) (CC whereas) (S 5.4.3))))

(defrule *move-embedded-whereas-to-sentence-level-connective*
; e.g., "Squirrels will build nests, whereas chipmunks dig burrows."
;       BLLIP wrongly makes "whereas ..." an adjunct in the VP embedded 
;       by (VP (MD will (VP ...)))
   '((S *expr (NP +expr) *expr (VP +expr (VP +expr ?[comma] 
                                           (SBAR (IN whereas) +expr))))
     (S (S 2 3 4 (VP 5.2 (VP 5.3.2))) (CC whereas) (S 5.3.4.3))))

  
; REMOVING THE EXTRA (AUX (VB... )) WRAPPERS FROM BROWN TREES:
; ````````````````````````````````````````````````````````````
; Repairs to AUX and verb POS's are done later.

(defrule *form-auxz-from-aux-vbz*
; E.g., (AUX (VBZ has)) --> (AUXZ has)
   '((AUX (VBZ !atom)) (AUXZ 2.2)))

(defrule *form-auxd-from-aux-vbd*
; E.g., (AUX (VBD had)) --> (AUXD had)
   '((AUX (VBD !atom)) (AUXD 2.2)))

(defrule *form-auxn-from-aux-vbn*
; E.g., (AUX (VBN had)) --> (AUXN had)
; Note: AUXN (passive) may need further correction to AUXEN (perfect)
   '((AUX (VBN !atom)) (AUXN 2.2)))

(defrule *form-auxg-from-aux-vbg*
; E.g., (AUX (VBG having)) --> (AUXG having)
   '((AUX (VBG !atom)) (AUXG 2.2)))

(defrule *form-aux-from-aux-vb*
; E.g., (AUX (VB have)) --> (AUX have)
   '((AUX (VB !atom)) (AUX 2.2)))

(defrule *drop-aux-wrapper*
; E.g., (AUX (MD will)) --> (MD will), (AUX (TO to)) --> (TO to)
; NB: In Brown this leaves forms like (PP (TO to) ...), which also occur
;     in BLLIP parses; we repair those subsequently.
   '((AUX (!atom !atom)) 2))
  
(defrule *change-inf-to-prep*
;  Repair preposition 'to' misrepresented as infinitive auxiliary 'to':
;  All other occurrences of (TO to) remain unchanged (we don't use AUX,
;  and Brown corpus (AUX (TO to)) is reduced to (TO to) by later rules.
     '((PP (TO to) (NP +expr)) (PP (IN to) 3)) ); error correction!


; CORRECTING SOME BLLIP ODDITIES
; ``````````````````````````````
(defrule *make-prog-after-go-a-vp*
; E.g., "On weekends, he GOES ROCK CLIMBING."
; Later rules introduce 'Ka' reification for such cases.
   '((VP (.VB .go) (!atom *expr (!atom !-ing))) (VP 2 (VP 3.2 (VBG 3.3.2)))))

(defrule *reshape-NP-NP-it-all*
; e.g., "Put it all away"; "They all went home"; 
;       BLLIP produces (NP (NP (PRP IT)) (NP (DT ALL)))
   '((NP (NP (PRP .it/they/them/this/that)) (NP (DT all)))
     (NP 3.2 (PP (-SYMB- {of}.p) 2))))

(defrule *reshape-NP-DT-it-all*
; e.g., "This all must stop." BLLIP produces (S (NP (PRP THIS)) (DT ALL) ...)
   '((!atom ?expr (NP (PRP .it/they/them/this/that)) (DT all) *expr)
     (1 2 (NP 4 (PP (-SYMB- {of}.p) 3)) 5)))

(defrule *reshape-NP-it-all*
; e.g., "I've forgotten it all"; (BLLIP produces (NP (PRP IT) (DT ALL))
   '((NP (PRP .it/they/them/this/that) (DT all))
     (NP 3 (PP (-SYMB- {of}.p) 2))))

; No doubt BLLIP has other creative ways of parsing "it all", "them all", etc.

(defrule *make-initial-please-an-adverb*
; e.g., "Please {,} go away" -- BLLIP makes "please" a verb
   '((S ?non-np (VP (VB please) ?[comma] +expr) *expr) 
     (S 2 (VP (RB please) (VP 3.4)) 4)))

(defrule *insert-you-in-please-imperative*
; e.g., "please {,} go away" -- now a VP by the previous rule
; NB: If this is VP-embedded, we'll drop the {you}.pro again
   '((S ?non-np (VP (RB please) ?[comma] (VP (VB !atom) *expr)) *expr)
     (S 2 (S (NP (-SYMB- {you}.pro)) 3.2 3.4) 4))) 

(defrule *separate-obj-pred-combination-after-imperative-v*
; e.g., "Make it very spicy"; "Let's dance"; "Please don't let him fail."
; BLLIP incorrectly makes an S out of an NP complement and any other complement.
   '((!atom *non-np (VP (.VB !atom) (S (NP +expr) +expr)) *expr)
     (1 2 (VP 3.2 3.3.2 3.3.3) 4)))

(defrule *insert-you-in-simple-imperative*
; e.g., "Make it very spicy" (in VP form after previous rule)
; NB: If this is VP-embedded, we'll drop the {you}.pro again
  '((!atom *non-np (VP (VB !atom) *expr) *expr)
    (1 2 (S (NP (-SYMB- {you}.pro)) 3) 4)))

(defrule *insert-you-in-brown-imperative*
; e.g., "Make it very spicy" (Brown makes it an S with subject (NP (-NONE- *)))
; NB: If this is VP-embedded, we'll drop the {you}.pro again
  '((S (NP (-NONE- *)) (VP (VB !atom) *expr) *expr)
    (S (NP (-SYMB- {you}.pro)) 3 4)))

(defrule *remove-inserted-you-in-a-larger-vp*
; e.g., "I want you to MAKE IT VERY SPICY"
  '((VP (TO to) (S (NP (-SYMB- {you}.pro)) +expr) *expr)
    (VP 2 3.3 4)))

(defrule *reunite-prep-with-whnp-in-sbar*
; e.g., "I'm not sure with *[whom to discuss this]." NB: Wrong SBAR grouping
;       "I know the man with *[whom you spoke]." NB: Wrong SBAR grouping
   '((.XP *expr (PP (IN !atom) (SBAR (WHNP +expr) (S +expr))) *expr)
     (1 2 (SBAR (WHPP 3.2 3.3.2) 3.3.3) 4)))

(defrule *reunite-pp-in-sq-with-preceding-noun*
; e.g., "Which type of tango did you say you danced?" BLLIP makes "of tango"
;       part of the inverted SQ-sentence
   '((!atom (WHNP +expr (.NN +expr)) (.SQ (PP +expr) (.VB/AUX !expr) *expr))
     (1 (WHNP 2.2 (2.3.1 (-SYMB- n+preds) 2.3 3.2)) (3.1 3.3 3.4))))

(defrule *repair-clitic-us-parsed-as-clitic-is*
; e.g., "Let's not get ahead of ourselves." BLLIP gives (AUX |'S|).
   '((VP (VB let) (S (VP (AUX \'s) +expr))) (VP 2 (NP (PRP \'s)) 3.2.3)))

(defrule *change-next-etc-preceding-time-period-to-dt-next-etc*
; e.g. "Next March is Women's month."
   '((NP (!not-dt .next/last) (.NN/NNP .TIME-PERIOD)) (NP (DT 2.2) 3)))
         ;`````` guard against run-away recursion!        ```

(defrule *change-s-embedded-pp-to-just-pp*
; e.g., "That guy, I like." BLIPP forms this: (S (PP (IN THAT) (NP (NN GUY))))
   '((S (PP *expr)) 2))

(defrule *make-that-before-bare-np-a-determiner*
; e.g., "That guy, I like." BLIPP still makes (PP (IN THAT) (NP (NN GUY)))
   '((PP (IN that) (NP (NN +expr))) (NP (DT that) 3.2)))

(defrule *change-adjp-in-to-pp-in*
; e.g., "What office is he in?" BLLIP gives (ADJP (IN in)), so *h gets misplaced.
; While (ADJP (IN in)) is ok for "The doctor is in", keeping it PP is preferable.
   '((ADJP (IN !atom)) (PP 2)))

(defrule *combine-adjacent-mistagged-prep-and-whnp*
; e.g., "About what did you quarrel with him last night?"
;       BLLIP forms (SBARQ (RB ABOUT) (WHNP (WP WHAT)) (SQ (AUX DID) ...))
   '((SBARQ (RB !atom) (WHNP +expr) +expr) (SBARQ (WHPP (IN 2.2) 3) 4)))

(defrule *change-adjp-now-to-advp*
; e.g. "Where is he now?" BLLIP makes "now" an ADJP since "is" often has an
;      ADJP complement! (Blindness to overall logical coherence)
   '((ADJP (RB !atom)) (ADVP 2)))

(defrule *change-topicalized-advp-embedding-nnp-to-np*
; e.g., "Alice, he likes." produces (ADVP (NNP Alice))
   '((ADVP (NNP +expr)) (NP 2)))

; WORD COMBINATIONS
;``````````````````
(defrule *comb-out-of*
; e.g., "Bob is out of work" --> ... out_of ...
   '((PP (IN out) (PP (IN of) *expr)) (PP (IN out_of) 3.3)))

(defrule *comb-on-top-of*
; e.g., "The red block is on top of the green one." --> ... on_top_of ...
   '((PP (IN on) (NP (NP (NN top)) (PP (IN of) *expr)))
     (PP (IN on_top_of) 3.3.3)))

(defrule *comb-in-front-of*
; e.g., "the red block is in front of the green block." --> .. in_front_of ..
   '((PP (IN in) (NP (NP (NN front)) (PP (IN of) *expr)))
     (PP (IN in_front_of) 3.3.3)))

(defrule *comb-to-the-left-of*
; e.g., "The red block is to the left of the green block." -> .. to_the_left_of ..
   '((PP (!atom to) (NP (NP (DT the) (NN left)) (PP (IN of) *expr)))
     (PP (IN to_the_left_of) 3.3.3)))

(defrule *comb-to-the-right-of*
; e.g., "The red block is to the right of the green block." -> .. to_the_right_of ..
   '((PP (!atom to) (NP (NP (DT the) (NN right)) (PP (IN of) *expr)))
     (PP (IN to_the_right_of) 3.3.3)))

(defrule *comb-left-of*
; e.g., "The red block is left of the green block." -> .. left_of ..
; BLLIP parse can misconstrue the PP as (VP (VBN left) (PP (IN of) ...))
; or as an (ADJP (JJ left) (PP (IN of) ...))
   '((.XP (!atom left) (PP (IN of) *expr)) (PP (IN left_of) 3.3))) 

(defrule *comb-right-of*
; e.g., "The red block is right of the green block." -> .. right_of ..
; BLLIP parse can misconstrue the PP as (ADJP (JJ right) (PP (IN of) ...))
   '((.XP (!atom right) (PP (IN of) *expr)) (PP (IN right_of) 3.3)))

(defrule *comb-a-lot*
; e.g., "He has changed a lot."
   '((VP (.VB !non-be) *expr (NP (DT A) (NN LOT)) *expr)
     (VP 2 3 (ADVP (RB a_lot)))))

; VERB + PARTICLE combinations
;`````````````````````````````
; 'stem' has been modified so that it will correctly produce stems for
; verb-particale combinations, and multiple nouns, that have been joined 
; with an underscore. For example, (stem '(threw_out)) -> THROW_OUT; or
; (stem '(house_flies)) -> HOUSE_FLY. This was done to avoid more general 
; modifications to allow lexical items in parses such as (VBD threw out) 
; or (NNS house flies). However, 'stem' does handle such multiword lexical
; items, so the modification made splits underscore-connected atoms into
; a list of atoms and then applies 'stem' recursively to that expanded
; version.
;
(defrule *comb-verb-particle*
; E.g., "threw out the newspaper clippings", i.e., this is the adjacent case
   '((VP (.VB !atom) (PRT (RP !atom)) *expr)
     (VP (2.1 (make-multiword! (list '2.2 '3.2.2))) 4)))

(defrule *comb-doubly-separated-verb-particle*
; E.g., "Threw it all out" "gave it all up", "put them all off"
   '((VP (.VB !atom) (NP (PRP .it/they/them/this/that)) (!atom (DT all)) 
                                                   (PRT (RP !atom)) *expr)
     (VP (2.1 (make-multiword! (list '2.2 '5.2.2))) (NP (DT all) 
                                                     (PP (-SYMB- {of}.p) 3) 6))))

(defrule *comb-separated-verb-particle*
; E.g., "threw it out", i.e., this is the non-adjacent case
   '((VP (.VB !atom) (NP +expr) (PRT (RP !atom)) *expr)
     (VP (2.1 (make-multiword! (list '2.2 '4.2.2))) 3 5)))

; SINGLE-WORD RULES
;``````````````````
(defrule *change-trace-t-to-h*
; This is for occurrences of (-NONE- T) in Brown, which are traces --
; except that they also occur in subject position in cases like "[The man]
; who left ..." (in Brown only), which is deleted by a later rule that
; uses a match to (-SYMB- !atom). Note that the gap insertion rules guard
; against *h-insertion where this is already present.
   '((-none- t) (-SYMB- *h)))

(defrule *expand-clitic-not*
  '((!atom n\'t) (1 not)))

(defrule *repair-vp-with-aux-verb-before-obj*
; E.g., BLLIP renders "do" in "I'd rather not do it" as (AUX do);
; Guard against making the change for aux-subj inversion ("Did he leave?")
   '((VP (.AUX !atom) *[advp] (NP +expr) *[non-vp])
     (VP ((pos-as-main-verb! '2.2) 2.2) 3 4)))

(defrule *expand-clitic-will*
  '((!atom \'ll) (1 will)))

(defrule *expand-clitic-had-before-better*
; E.g., "I'd better leave";
   '((+expr (!atom \'d) *[advp] (ADVP (RB better)) (VP +expr))
     (1 (AUX-CF had) 3 4 5)))

(defrule *expand-clitic-would-before-base-vp*
; E.g., "I'd suggest you leave"
   '((+expr (!atom \'d) *[advp] (VP (VB !atom) *expr))
     (1 (AUXZ would) 3 4)))

(defrule *expand-clitic-had-before-perfect*
; E.g., "I'd already left."
; We don't need to check for the perfect VP, because other instances of 'd
; are covered by the previous two rules.
   '((+expr (!atom \'d) *[advp] (VP +expr)) (1 (AUXD had) 3 4)))

(defrule *change-poss-pro-to-dt*
; e.g., "My throat hurts": gives (NP (PRP$ MY) (NN THROAT)); we want DT
   '((NP (PRP$ !atom) *expr (.NN *expr) *expr) (NP (DT 2.2) 3 4 5)))

(defrule *expand-np-det-sing*
; E.g., "THIS is annoying." "THIS is an okapi."
; E.g., "I doubt THAT." "THAT's all." "THAT's all I can offer you."
   '((NP ![det-sing-alone]) (NP 2 (NN {ref}))))

(defrule *change-jjs-most-to-dt-most-when-np-initial*
; E.g., "MOST students passed the course"; "Most got an A"
; If there's no head noun, the next rule inserts (NNS {ref})
   '((NP (JJS most) *expr) (NP (DT most) 3)))

(defrule *expand-np-det-plur*
; E.g., "THESE are starlings"; "THOSE are starlings"; "MANY lost their lives."
;       "MOST have already left"; "FEW remain"; "SOME resisted the police."
   '((NP ![det-plur-alone]) (NP 2 (NNS {ref}))))

(defrule *expand-np-jj-many*
; E.g., "MANY lost their lives."
   '((NP (JJ many)) (NP (DT many) (NNS  {ref}))))

(defrule *separate-possessive-from-np*
; "The tall woman's umbrella ..."
   '((NP *expr (.NN +expr) (POS \'s)) (NP (NP 2 3) (POS \'s))))

; The next three rules distinguish prepositions with sentential arguments
; from the same words with different types, especially "when" and "where".
; Note these distinct uses of "when":
;   1. As when.adv: "No-one knows when he left" (cf. "at what time")
;   2. As when.ps: "No-one was looking when he left." (cf., "at the time at which")
;   3. As when.rel: "The time when dinosaurs lived is long gone." (cf., "at which")
;   4?. As when.pq: "When did he leave?" (cf. "at what time" -- same as when.adv?)

(defrule *change-prep-clause-to-prep-ps-clause*
; E.g., "While/though/if he worked, nothing happened."
;       "He whistled while he worked."
   '((SBAR (IN !not-that) (S +expr)) (SBAR (PS 2.2) 3)))

(defrule *change-pre-sentential-when-clause-to-when-ps-clause*
; E.g., "WHEN it rains, it pours." "WHERE there is smoke, there is fire."
   '((!atom ?expr (SBAR (!atom (WRB .when)) (S +expr)) ?[comma] (S +expr) *expr)
     (1 2 (SBAR (ADVP (PS 3.2.2.2)) 3.3) 4 5 6)))

; (defrule *reify-whnp-object*
; ; E.g., "I don't understand what you are doing" (or "... where you're heading"); 
; ;       "I can't explain to you what he's doing today"
;    '((VP +expr (SBAR ?expr (.WHNP +expr) (S +expr)) *expr)
;      (VP 2 (NP (-SYMB- ans-to) (SBAR (-SYMB- sub) (3.3.1 3.2 3.3) 3.4)) 4)))

(defrule *reify-whs-object*
; E.g., "I know when he's arriving"; "I see what place he's at." BLLIP:(VBP place)!
;        NB: "where he's at" goes astray, because an adv doesn't fit after "at"!
   '((VP ![v_whs] (SBAR ?expr (WHADVP +expr) (S +expr)) *expr)
     (VP 2 (NP (-SYMB- ans-to) (SBAR (-SYMB- sub) (WHADVP 3.2 3.3) 3.4)) 4)))

(defrule *reify-whs-object-after-np*
; E.g., "I told Bob when/where you'll arrive."
   '((VP ![v_np_whs] (NP +expr) (SBAR ?expr (WHADVP +expr) (S +expr)) *expr)
     (VP 2 3 (NP (-SYMB- ans-to) (SBAR (-SYMB- sub) (WHADVP 4.2 4.3) 4.4)) 5)))

(defrule *reify-whs-object-after-pp*
; E.g., "I revealed to him when Alice was arriving." 
   '((VP ![v_pp_whs] (PP +expr) (SBAR ?expr (WHADVP +expr) (S +expr)) *expr)
     (VP 2 3 (NP (-SYMB- ans-to) (SBAR (-SYMB- sub) (WHADVP 4.2 4.3) 4.4)) 5)))

(defrule *change-post-verbal-when-clause-to-when-ps-clause*
; E.g., "I'll call when his plane arrives", "There's flooding where he lives"
; Reified wh-clauses were largely taken care of in the 3 preceding rules
; (They're rare for "when", and fairly rare for "where":
; E.g., "I know WHEN his plane arrives." "I know WHERE he lives."
   '((VP +expr (SBAR (!atom (WRB .when)) (S +expr)) *expr)
     (VP 2 (SBAR (ADVP (PS 3.2.2.2)) 3.3) 4)))

(defrule *reify-wh-subject*
; E.g., "What he told me is alarming"; "Where he lives is a mystery"
   '((S (SBAR (.WHXP +expr) (S +expr)) (VP +expr))
     (S (NP (-SYMB- ans-to) (SBAR (-SYMB- sub) 2.2 2.3)) 3)))

(defrule *change-when-adv-to-when-pq*
; E.g., "WHEN did it rain?", "WHERE does it hurt?"
   '((!atom (!atom (WRB .when)) (.SQ +expr)) (1 (2.1 (PQ 2.2.2)) 3)))

(defrule *change-nns-rains-to-vbz-rains*
; E.g., BLLIP parses "rains" in "It rains a lot" as (VP (NNS rains) ...)
   '((VP (NNS rains) *expr) (VP (VBZ rains) 3)))

(defrule *change-sentential-prepositions-to-ps*
; E.g., "ALTHOUGH the soup is cold, it's good." "If he leaves, so do I."
   '((!atom (IN !atom) (S (NP (!not-none +expr) *expr) +expr)) (1 (PS 2.2) 3))) 

(defrule *combine-even-though*
; E.g., "Even though the sun was shining, ..."
   '((!atom *expr (!atom even) (!atom though) +expr)
     (1 2 (PS even_though) 5)))

(defrule *combine-as-if*
; E.g., "It looks as if it will rain."
   '((!atom (IN as) (IN if) +expr) (1 (PS as_if) 4)))

(defrule *combine-as-though*
; E.g., "It looks as though it will rain."
   '((!atom (IN as) (IN if) +expr) (1 (PS as_though) 4)))

(defrule *combine-disjointed-as-if*
; E.g., "I reflected for some time, and then answered as if I had 
;       discovered a new idea, \" I mean pretty well. \""
   '((SBAR (IN as) (S (SBAR (IN if) (S +expr)) *expr))
     (SBAR (PS as_if) (S 3.2.3 3.2.4))))

(defrule *expand-something*
; Expand (NN something) into det + NN
    '((NP (NN something) *expr) (NP (DT some) (NN thing) 3)))

(defrule *expand-everything*
; Expand (NN everything) into det + NN
    '((NP (NN everything) *expr) (NP (DT every) (NN thing) 3)))

(defrule *expand-nothing*
;  Expand (NN nothing) into det + NN
    '((NP (NN nothing) *expr) (NP (DT no) (NN thing) 3)))

(defrule *expand-anything*
; Expand (NN anything) into det + NN
    '((NP (NN anything) *expr) (NP (DT any) (NN thing) 3)))

(defrule *expand-someone*
; Expand (NN someone) into det + NN
    '((NP (NN someone) *expr) (NP (DT some) (NN person) 3)))

(defrule *expand-somebody*
; Expand (NN somebody) into det + NN
    '((NP (NN somebody) *expr) (NP (DT some) (NN person) 3)))

(defrule *expand-everyone*
; Expand (NN everyone) into det + NN
    '((NP (NN everyone) *expr) (NP (DT every) (NN person) 3)))

(defrule *expand-everybody*
; Expand (NN everybody) into det + NN
    '((NP (NN everybody) *expr) (NP (DT every) (NN person) 3)))

(defrule *expand-anyone*
; Expand (NN anyone) into det + NN
    '((NP (NN anyone) *expr) (NP (DT any) (NN person) 3)))

(defrule *expand-anybody*
; Expand (NN anybody) into det + NN
    '((NP (NN anybody) *expr) (NP (DT any) (NN person) 3)))

(defrule *expand-no-one*
; Expand (NN no-one) into det + NN
    '((NP (!atom no-one) *expr) (NP (DT no) (NN person) 3)))

(defrule *expand-nobody*
; Expand (NN nobody) into det + NN
    '((NP (!atom nobody) *expr) (NP (DT no) (NN person) 3)))

(defrule *expand-cannot*
; Expand "cannot" to "can not"
   '((VP (VBP cannot) ?expr (S (VP +expr) *expr)) (VP (AUXZ can) (RB not) 3 4)))

(defrule *add-prep-for-indicated-day*
; E.g., "He left yesterday" -- add {during}.p, unless a preposition 
; already precedes it. Since we insert -SYMB-, guard against duplication!
; NB: WE don't usually want a match in subject position: "Today is a holiday"
    '((!atom *expr (!not-prep-or-symb +expr) (NP (!atom .THIS-DAY)) *expr)
      (1 2 3 (ADVP (-SYMB- adv-e) (PP (-SYMB- {during}.p) 4)) 5)))

(defrule *add-prep-for-weekday*
; E.g., "He left Friday" -- in Brown, (NP (NNP |Friday|))
    '((!atom *expr (!not-prep-or-symb +expr) (NP (NNP .WEEKDAY)) *expr)
      (1 2 3 (ADVP (-SYMB- adv-e) (PP (-SYMB- {during}.p) 4)) 5)))

(defrule *add-prep-for-definite-embedded-time-np*
; E.g., "I know what you did last summer"; "I'll do it {next week}/{this evening}"
    '((!atom *expr (!not-prep-or-symb +expr) 
                                    (NP +expr (.NN/NNP .TIME-PERIOD)) *expr)
      (1 2 3 (ADVP (-SYMB- adv-e) (PP (-SYMB- {during}.p) 4)) 5)))

(defrule *add-prep-for-topicalized-indicated-day*
; E.g., "Tomorrow {,} Alice arrives."
    '((.S (NP (!atom .THIS-DAY)) ?[comma] (.S +expr))
      (1 (-SYMB- sub) (ADVP (-SYMB- adv-e) (PP (-SYMB- {during}.p) 2)) 4)))

(defrule *add-prep-for-pp-embedded-indicated-day*
; E.g., "Tomorrow, at noon, Alice arrives."
; N.B.: "Tomorrow, at noon" were grouped into a single PP by rules
;       *group-episodic-sentence-premodifiers* or *repair-sentence-
;       broken-by-initial-modifiers*.
   '((PP *[pp-or-np] ![time-np] *[pp-or-np]) (PP 2 (XP (-SYMB- {during}.p) 3) 4)))
                                                   ;^^ to prevent looping

(defrule *add-prep-for-definite-topicalized-time-np*
; E.g., "{Next week}/{this evening} Alice arrives."
; Note: The initial parse may jsut put the NPs for "next week" and "Alice"
; side-by-side as dual subjects, but the rule for creating a subordiate 
; S after the initial XP will change this to a topicalized NP 
    '((.S (NP +expr (.NN/NNP .TIME-PERIOD)) ?[comma] (.S +expr))
      (1 (-SYMB- sub) (ADVP (-SYMB- adv-e) (PP (-SYMB- {during}.p) 2)) 4)))

; ** WE MIGHT ADD RULES FOR MONTHS (JANUARY, ETC.), YEARS (1972, ETC.)
;    BUT THIS REQUIRES CAUTION, E.G., "JULY WAS HOT", AND "HER DAUGHTER,
;    JUNE", AND "1972 DEMONSTRATORS WERE HURT".

(defrule *change-to-to-in-in-pp*
; BLLIP can incorrectly produce (PP (TO TO) ...) instead of (PP (IN TO) ...)
   '((PP (TO TO) *expr) (PP (IN TO) 3))); NB: allow for gapped NP object

(defrule *change-wdt-to-wp-rel*
; In context (NP ...) (SBAR (WHNP (WDT ...) ..) ...), WDT should be WP-REL.
; (For SBARQ instead of SBAR, we have a question and so WDT remains WDT.)
; E.g., "[the car] that he bought"
   '((!atom *expr (NP +expr) (SBAR (WHNP (WDT !atom)) +expr) *expr) 
     (1 2 3 (SBAR (WHNP (WP-REL 4.2.2.2)) 4.3) 5)))

(defrule *change-in-to-wp-rel*
; In context (NP ...) (SBAR (WHNP (IN that) ..) ...), IN should be WP-REL.
; (This corrects for an error that BLLIP tends to make.)
; E.g., "[the car] that he bought"; ** but what about "the fact/claim/... that"?
   '((!atom *expr (NP +expr) (SBAR (WHNP (IN that)) +expr) *expr) 
     (1 2 3 (SBAR (WHNP (WP-REL that)) 4.3) 5)))

(defrule *change-bare-in-to-wp-rel*
; In context (NP ... (SBAR (IN that) (S ...) ...), where the S ends in a
; verb, IN should almost certainly be WP-REL. 'sub' & '*h' are inserted later.
; E.g., "[I like] the car that I bought". We add a level of NP structure, not
; because that's correct, but so that this is like the structure in the 
; previous rule (*change-in-to-wp-rel*), & will be treated the same way.
   '((NP (!not-none +expr) *expr
         (SBAR (IN that) (S *expr (NP (!not-none !expr) *expr) *expr 
                                  (VP *expr (.VB !atom)) *expr)) *expr)
     (NP (NP 2 3) (SBAR (WHNP (WP-REL that)) 4.3) 5)))
                              
(defrule *change-wp-to-wp-rel*
; In context (NP ...) (SBAR (WHNP (WP ...) ..) ...), WP should be WP-REL.
; E.g., "[the man] who called", "[the man] whom everone admires"
   '((!atom *expr (NP +expr) (SBAR (WHNP (WP !atom)) +expr) *expr)
     (1 2 3 (SBAR (WHNP (WP-REL 4.2.2.2)) 4.3) 5)))

(defrule *change-wp$-to-wp$-rel-and-possessive*
; In context (NP ...) (SBAR (WHNP (WP$ ...) ..) ...), WP$ should be a relative
; determiner consisting of WP$-REL and 's (e.g., "whose life" ==> "who's life")
; E.g., "[the man] whose life she saved"
   '((!atom *expr (NP +expr) (SBAR (WHNP (WP$ !atom) +expr) +expr) *expr) 
     (1 2 3 (SBAR (WHNP (WDT-REL (WP$-REL 4.2.2.2) (POS \'s)) 4.2.3) 4.3) 5)))

(defrule *change-wrb-to-wrb-rel*
; In context (NP ...) (SBAR (WHADVP (WDT ...) ..) ...), WDT should be DT-REL.
; (For SBARQ instead of SBAR, we have a question and so WDT remains WDT.)
; E.g., "[the car] that he bought"
   '((!atom *expr (NP +expr) (SBAR (WHADVP (WRB !atom)) +expr) *expr)
     (1 2 3 (SBAR (WHADVP (WP-REL 4.2.2.2)) 4.3) 5)))

(defrule *change-wp-to-wp-rel-within-a-relative-pp*
; E.g., "I know the man with WHOM you talked"; "I know the town from which he hails"
   '((!atom *expr (NP +expr) (PP !expr (SBAR (WP !atom) *expr) *expr) *expr)
     (1 2 3 (PP 4.2 (SBAR (WP-REL 4.3.2.2) 4.3.3) 4.4) 5)))

(defrule *change-whnp-embedded-wp-to-wp-rel-within-a-relative-pp*
; E.g., "I know the man with WHOM you talked"; "I know the town from which he hails"
   '((!atom *expr (NP +expr) (PP !expr (SBAR (WHNP (WP !atom)) *expr) *expr) *expr)
     (1 2 3 (PP 4.2 (SBAR (WP-REL 4.3.2.2.2) 4.3.3) 4.4) 5)))

; TBC: WHAT ABOUT WP-REL, WDT-REL IN NONRESTRICTIVE REL-CLAUSES?

(defrule *comb-such-a*
; Delete the indefinite "a" or "an" from, e.g., "such a great party",
; "such an idiot"
    '((NP (PDT such) (DT .A/AN) *expr) (NP (DT such) (NP (-SYMB- =) 3 4))))

(defrule *comb-cd-quote-cd-double-quote*
; e.g., "He is 6'2'' tall." BLLIP: (ADJP (CD 6) (|''| |'|) (CD 2) (|''| |''|) ...)
    '((.XP (CD !atom) (|''| |'|) (CD !atom) (|''| |''|) *expr)
      (1 (NNS (-SYMB- $) (-SYMB- length) (NNS 2 (NNS \')) (NNS 4 (NNS |''|))) 6)))

(defrule *comb-cd-quote*
; e.g., "He is 6' tall"; BLLIP gives ... (ADJP (CD 6) (|''| |'|) (JJ TALL))
    '((.XP (CD !atom) (|''| |'|) *expr) (1 (NNS 2 (NNS \')) 4)))

(defrule *comb-cd-double-quote*
; e.g., "He is 72'' tall"; BLLIP gives ... (ADJP (CD 72) (|''| |'"|) (JJ TALL))
    '((.XP (CD !atom) (|''| |''|) *expr) (1 (NNS 2 (NNS |''|)) 4)))

(defrule *pluralize-nn-foot*
; Change (NN \') to (NNS \')
    '((NN \') (NNS \')) )

(defrule *pluralize-nn-inch*
; Change (NN |''|) to (NNS |''|)
    '((NN |''|) (NNS |''|)) )

; Auxiliary editing
;``````````````````
; Recall: Brown parses use e.g., (AUX (VBP have)), which is an odd structure
;         but unambiguous as to tense/aspect, vs. BLLIP (AUX have), which
;         is more natural as POS+word, but loses tense/aspect information.
;         For modals, Brown uses e.g., (AUX (MD would)), vs BLLIP (MD would).
;         So both ignore tense -- which is ambiguous for some modals. E.g.,
;         while "can" is simple present, "would" is ambiguous between past
;         and present and past subjunctive (counterfactual), which I'll write
;         as (AUXF would), with F standing for "finite". 
; AUX wrappers from Brown, like (AUX (VBP have)) and (AUX (MD would)), have
;         already been dropped here (in the June 8/21 rewrite of this file)
;         & will be re-assigned POS's "from scratch" as a function of context.
;         The parse-tree-to-ulf code can still handle the original, AUX-
;         wrapped "simple trees" in deriving lexical ULFs, but this is now
;         redundant (see 'simple-tree-to-raw-ulf' in "parse-tree-to-ulf.lisp").
; All occurrences of modals, have, be, do, and to will be assigned appropriate
;         inflections added: (AUXP have), (AUX have) (for base form), 
;         (AUXZ has), (AUXF would), etc., and also non-auxiliary occurrences
;         of these words, as a function of context. E.g., "will have eaten"
;         and "we have eaten" involve (AUX have) and (AUXP have) respectively).
;         Similarly for "if I were working" vs "We were were working", 
;         involving (AUX-CF were) vs (AUXD were).
; Concerning "to": Both Brown parses and BLLIP parses use (TO to) for both
;         the infinitive "to" and preposition "to", but Brown parses disam-
;         biguate by wrapping (AUX ...) around the infinitive (To to). Here
;         we retain BLLIP (TO to) for infinitive & (IN to) for prepositions.

; Now change BLLIP (AUX word) and Brown (AUX (POS word)) to inflected forms
; `````````````````````````````````````````````````````````````````````````
(defrule *change-aux-to-inflected-form*
; e.g., (AUX has) --> (AUXZ has), (MD will) --> (AUXZ will), (MD could) -->
;       (AUXF could), (TO to) -> (TO to); (AUX (VBZ has)) --> (AUXZ has),
;       (AUX (MD will)) --> (AUXZ will), (AUX (TO to)) --> (TO to), etc.
; This rule mostly handles context-independent cases; some instances will 
; be changed context-dependently later, e.g. (AUX have) --> (AUXP have)
; (in "We have ..."), or (AUXD were) --> (AUX-CF were) ("If I were ...")
   '((.AUX !expr) (inflect-aux! '0)))

; Finding the correct auxiliary or verb form of "have"
; ```````````````````````````````````````````````````
(defrule *form-aux-have*
; e.g., "He may HAVE left"; questions are handled separately (see next rule)
; After MD or TO, and before a VP, "have" is (AUX have)
   '((VP ?expr (.MD/AUX/TO !atom) ?expr (VP ?expr (!atom .have/ve) 
                                         ?expr (VP +expr)))
     (VP 2 3 4 (VP 5.2 (AUX 5.3.2) 5.4 5.5))))

(defrule *form-aux-have-in-question*
; e.g., "Will he HAVE left?"
; In a question, after MD and NP and before a VP, "have" is (AUX have)
   '((.SQ ?expr (.AUX !atom) ?expr (NP +expr) ?expr 
                                   (VP ?expr (!atom have) ?expr (VP +expr)))
     (1 2 3 4 5 6 (VP 7.2 (AUX have) 7.4 7.5)))) 

(defrule *form-vb-have*
; e.g., "I don't HAVE a cat"; "It's nice to HAVE a cat"
; After MD, DO, or TO, and not before any VP, "have" is (VB have)
   '((VP ?expr (.AUX !atom) ?expr (VP ?expr (!atom have) *[non-vp]))
     (VP 2 3 4 (VP 5.2 (VB have) 5.4))))

(defrule *form-vb-have-in-question*
; e.g., "Did you ever have a cat?" "That's the best thing I have"
; In a question, after MD and NP and not before a VP, "have" is (VB have)
   '((.SQ ?expr (.AUX !atom) ?expr (NP +expr) ?expr
                                   (VP ?expr (!atom have) *[non-vp]))
     (1 2 3 4 5 6 (VP 7.2 (VB have) 7.4))))

(defrule *form-auxz-has*
; e.g., "He has (probably) left"; "Hasn't he left yet?"
; Before a VP, "has" is (AUXZ has)
   '((!atom (!atom has) ?expr ?expr (VP +expr)) (1 (AUXZ has) 3 4 5)))

(defrule *form-auxp-have*
; e.g., "I know what you've done." "What have you not done yet?" "Have you left?"
;       (But not in "Will you have left by then?")
; After possible non-auxiliaries, if followed by a VP, "have" is (AUXP have)
   '((!atom *[non-aux-part] (VP ?expr (!atom .have/ve) ?expr (VP +expr)))
     (1 2 (VP 3.2 (AUXP 3.3.2) 3.4 3.5))))

(defrule *form-vbz-has*
; e.g., "He (surely) has a friend, perhaps many"
; Before non-VPs, "has" is (VBZ has)
   '((VP (!atom has) *[non-vp]) (VP (VBZ has) 3)))

(defrule *form-vbp-have*
; e.g., "I like the house you have." "You have it all."
   '((.S (NP (!not-none +expr) *expr) *expr 
         (VP *[non-aux-part] (!atom have) *expr))
     (1 2 3 (VP 4.2 (VBP have) 4.4))))

(defrule *form-auxd-had*
; e.g., "He had already left." "Hadn't he already left?"
; Before VP, "had" is (AUXD had)
   '((!atom (!atom had) ?expr ?expr ?expr (VP +expr)) (1 (AUXD had) 3 4 5 6)))

(defrule *form-vbd-had*
; e.g., "He had enough of the stamps for the letters"; "The fun he had was brief"
; If not after "have", and not before VP, "had" is (VBD had); but we ignore
; the "not after have" condition, correcting for this in the next rule.
   '((VP (!atom had) *[non-vp]) (VP (VBD had) 3)))

(defrule *form-vben-had*
; e.g., "I've sometimes had a cat"; "Has he had lunch yet?"
; After "have", and not before VP, "had" is (VBEN had)
; Note: '.have' allows any form of "have".
   '((!atom (!atom .have) ?expr ?expr (VP (VBD had) *[non-vp]))
     (1 2 3 4 (VP (VBEN had) 5.3))));      ^^^^^^ from previous rule

(defrule *form-vbn-had*
; e.g., "I've (certainly) been had."
; After "been" or possibly "being", "had" is (VBN had), i.e., passive
   '((!atom *expr (!atom .been/being) ?expr (VP ?expr (!atom had) *[non-vp]))
     (1 2 3 4 (VP 5.2 (VBN had) 5.4)))) 

; ** We could put in rules for changing (AUXD had) and (VBD had) to subjunctive
;    (counterfactural: CF) in certain conditional contexts

; Finding the correct auxiliary or verb form of "be"
; ``````````````````````````````````````````````````
(defrule *form-vb-be*
; e.g., "He may be a spie"; "Will he ever be an expert?" "To be, or not to be";
; If not before a VP, "be" is (VB be)
   '((VP *expr (!atom be) *[non-vp]) (VP 2 (VB be) 4)))

(defrule *form-aux-be*
; e.g., "I'll be seeing you"; "Will you be rehired?" "Might he be watching TV?"
; Before a VP, "be" is (AUX be)
   '((VP (!atom be) ?expr (VP +expr)) (VP (AUX be) 3 4)))

(defrule *form-vbz-is*
; e.g., "She is definitely smart"; "How smart is she in your opinion?"
; If not before a VP, "is" is (VBZ is)
   '((.VP/SQ *expr (!atom .is/s/am/m) *[non-vp]) (1 2 (VBZ 3.2) 4)))

(defrule *form-auxz-is*
; e.g., "She is always singing"; "She is being hired"; "Isn't she being hired?"
; Before a VP, "is" is (AUXZ is)
   '((VP (!atom .is/s/am/m) *expr (VP +expr)) (VP (AUXZ 2.2) 3 4)))

(defrule *form-vbp-are*
; e.g., "They're definitely smart"; "How smart are they in your opinion?"
; If not before a VP, "are" is (VBP are)
   '((.VP/SQ *expr (!atom .are/re) *[non-vp]) (VP 2 (VBP 3.2) 4)))

(defrule *form-auxp-are*
; e.g., "They're always singing"; "They are being silly"; "Aren't they being hired?"
; Before a VP, "is" is (AUXZ is)
   '((VP (!atom .are/re) *expr (VP +expr)) (VP (AUXP 2.2) 3 4)))

(defrule *form-vbd-was*
; e.g., "He was only a kid"; "Were the grapes already ripe?"
; If not before a VP, "was/were" is (VBD was/were)
; ** Not quite accurate; consider singular subject,n S[if]: "I he were ..." 
   '((VP *expr (!atom .was/were) *[non-vp]) (VP 2 (VBD 3.2) 4)))

(defrule *form-auxd-was*
; e.g., "He was only kidding"; "They were being silly"; "Wasn't he mistreated?"
; Before a VP, "was/were" is (AUXD was/were)
   '((VP (!atom .was/were) *expr (VP +expr)) (VP (AUXD 2.2) 3 4)))

(defrule *form-vben-been*
; e.g., "He's been in Rome"; "How have you been?"; "Every place where I've been ..."
; If not before a VP, "been" is (VBEN been)
   '((VP *expr (!atom been) *[non-vp]) (VP 2 (VBEN been) 4)))

(defrule *form-auxen-been*
; e.g., "He's been working hard"; "He's been mistreated"; "Had he been drinking?"
; Before a VP, "been" is (AUXEN been)
   '((VP (!atom been) *expr (VP +expr)) (VP (AUXEN been) 3 4)))

(defrule *form-vbg-being*
; e.g., "He was just being nice"; "How insistent is he being?"
; If not before a VP, "being" is (VBG being); avoid (NN being) error;
   '((VP *expr (.VB/AUX being) *[non-vp]) (VP 2 (VBEN been) 4)))

(defrule *form-auxg-being*
; e.g., "He's being taken away"; "Are you being adequately rewarded?"
; Before a VP, "being" is (AUXG being);
   '((VP (.VB/AUX being) *expr (VP +expr)) (VP (AUXG being) 3 4)))

; Finding the correct auxiliary or verb form of "do"
; ``````````````````````````````````````````````````
(defrule *form-vbz-do*
; e.g., "I do it without asking"; "That's what I do (all the time)";
; If not after an MD or "to", and not before a VP, "do" is (VBZ do);
; but we ignore the "not after an MD or to", as the next rule corrects 
; this; guard against (NN do), as in "They had a big do".
   '((VP *expr (.VB/AUX do) *[non-vp]) (VP 2 (VBZ do) 4)))

(defrule *form-vb-do*
; e.g., "I'll do that"; "Can you do me a favor?" "That's what I'll do";
;       "I've got much to do"; the previous rule produces (VBZ do) in
;       these examples, but they are "revised" to (VB do) here
; After an MD or "to", "do" is (VB do)
   '((!atom ?expr (.MD/AUX/TO !atom) *expr (VP (!atom do) *expr))
     (1 2 3 4 (VP (VB do) 5.3))))

(defrule *form-auxz-do*
; e.g., "I do appreciate that." "Do you do that often?" (initial "do")
; Before VP (excluding verbs that can't be base-form), "do" is (AUXZ do);
; Preclude just the verb POSs that can't be mistaken for base form:
; VBG VBN VBEN AUXD AUXG AUXEN MD;
   '((!atom (!atom do) *expr (VP (.POSS-BASE-V !atom) *expr)) 
     (1 (AUXZ do) 3 4)))

(defrule *form-vbz-does*
; e.g., "I don't know what he does"; "He does the work without complaint"'
; If not before a VP, "does" is (VBZ does); avoid (NNs does) error;
   '((VP *expr (.VB/AUX does) *[non-vp]) (VP 2 (VBZ does) 4)))

(defrule *form-auxz-does*
; e.g., "That does certainly surprise me"; "Does that bother you?"
; Before a VP, "does" is (AUXZ does); (but avoid mistaking gerunds for
; VPs, e.g., "She does redecorating very well"; & avoid (NNS does);
   '((!atom (.VB/AUX does) *expr (VP (.POSS-BASE-V !atom) *expr)) 
     (1 (AUXZ does) 3 4)))

(defrule *form-vben-done*
; e.g., "I've done it." "Hadn't you done this before?"
; After "have", "done" is (VBEN done). NB: '.have' allows any form of "have"
   '((!atom (.VB/AUX .have) *expr (VP (.PASPART done) *expr))
     (1 2 3 (VP (VBEN done) 4.3))))

(defrule *form-vbn-done*
; e.g., "It was probably done in haste." "Is the job done yet?"
; After "be", "done" is (VBN done), i.e., passive; but see (JJ done) below.
   '((!atom (.VB/AUX .be) *expr (VP (.PASPART done) *expr))
     (1 2 3 (VP (VBN done) 4.3))))

(defrule *form-jj-done*
; e.g., "I'm done with this job"; "Are you done yet?" (cf., "a done deal")
; After a human subject, and after "be", and before at most non-NP complements,
; "done" may be an adjective. The rule here is just aimed at a few likely
; cases. To combine declaratives and questions, we (crudely) allow for a
; personal pronoun either before or after "be".
   '((.S ?[pers-pron-np] (.VB/AUX .be) ?expr ?[pers-pron-np] *expr 
                                       (.XP (.PASPART done) *[non-np-compl]))
     (1 2 3 4 5 6 (ADJP (JJ done) 7.3))))

(defrule *form-vbd-did*
; e.g., "I know what you did last summer"; "I appreciate what you did";
; If not before a VP, "did" is (VBD did)
   '((VP *expr (.VB/AUX did) *[non-vp]) (VP 2 (VBD did) 4)))

(defrule *form-auxd-did*
; e.g., "What did you tell him?" "He did finally graduate";
; Before a VP (that could be in base form), "did" is (AUXD did)
   '((!atom (.VB/AUX did) *expr (VP (.POSS-BASE-V !atom) *expr))
     (1 (AUXD did) 3 4)))

(defrule *change-vbd-to-passive-after-aux-be*
; E.g., "He may have been being (ruthlessly) bullied"
; (VP (.VB ...) ...) after (.AUX .BE)  --> (VP (VBN ...) ...)
   '((VP ?expr (.AUX .be) ?expr (VP ?expr (VBD !atom) *expr))
     (VP 2 3 4 (VP 5.2 (VBN 5.3.2) 5.4))))

(defrule *change-vbd-to-vben-after-have* 
; E.g., "Had he not yelled ..." wrongly would give (past yell.v)
; NB: '.have' allows any form of "have";
   '((!atom (.AUX .have) ?expr ?expr (VP *expr (VBD !atom) *expr) *expr)
     (1 2 3 4 (VP 5.2 (VBEN 5.3.2) 5.4) 6)))

(defrule *change-vbn-to-adj-when-sentence-final*
; E.g., "It's well done." The next rule takes 's to be "has" (which
;       is sometimes right, e.g., "He's certainly done a good job"
;       or "I don't know what he's done". Just consider main sentences.
   '((S (NP +expr) (VP (AUXZ \'s) *[advp] (VP (VBN !atom))))    
     (S 2 (VP (VBZ \'s) (ADJP 3.3 (JJ 3.4.2.2))))))

(defrule *change-vbn-to-vben-after-have*
; E.g., "Had he not yelled ..." wrongly would give (past yell.v)
; NB: '.have' allows any form of "have";
   '((!atom (.AUX .have) *[non-aux-be-verb] (VP *expr (VBN !atom) *expr) *expr)
     (1 2 3 (VP 4.2 (VBEN 4.3.2) 4.4) 5)))

(defrule *change-had-to-subjunctive-in-inverted-sbar*
; e.g., "had" in adverbial clause "had he not left" should be subjunctive (cf)
   '((SBAR (SINV (AUXD had) +expr)) (SBAR (SINV (AUX-CF had) 2.3))) )

; EDITING TBC

; RULES FOR INSERTING 'SUB' FOR EXPECTED TRACES (SOME OF WHICH
;`````````````````````````````````````````````````````````````
; MAY ALREADY BE PRESENT IN BROWN PARSES); FIRST, WH-QUESTIONS:
;`````````````````````````````````````````````````````````````
; NB: When these rules are reached, WDT, WP, WP$, and WRB will already
; have been changed to WDT-REL, WP-REL, WP$-REL, and WRB-REL in SBAR
; (as opposed to SBARQ) contexts. See earlier rules.
;
; Insert an initial (-SYMB- sub) in any wh-questions that expect
; an (<XP> (-SYMB- *h)) verb complement in the given parse tree.

(defrule *remove-sq-wrapper-from-vp*
; E.g., "How big is the house?" has shape (SQ (VP is the house)) in it
;       in a BLLIP parse, which messes things up
    '((SQ (VP (.AUX !atom) *expr)) 2))

(defrule *add-sub-operator-for-wh-question-with-subj-aux-inversion*
; e.g., "What did you buy _?", or "What did you ask him to do _?",
; or "What do you think I bought _?", or "What do you think Mary said
; I should buy _?" We add an initial (-SYMB- sub). Note: the check for
; an NP and a VP guards against inserting 'sub' in subject questions
; like "Who has arrived?".
   '((.SBAR !expr (SQ (.AUX !atom) ?expr (NP +expr) ?expr (.VP/S +expr)))
     (1 (-SYMB- sub) 2 3)))

(defrule *add-sub-operator-for-wh-question-with-subj-be-inversion*
; e.g., "How big is the house?" "Where/How are you?" "What is this?"
;        "Which office is he in?"
   '((.SBAR !expr (.VP/SQ (.VB .be) ?expr (NP +expr) *expr))
     (1 (-SYMB- sub) 2 3)))

; Example at issue:
; (SBARQ (WHADJP (WRB HOW) (JJ BIG))
;   (SQ (VP (VBZ IS) (NP (DT THE) (NN HOUSE)))))

; RULES FOR INSERTING 'SUB' IN (BOUND OR FREE) RELATIVES (WH-NPs)
;```````````````````````````````````````````````````````````````
; THESE RULES ARE BETTER THAN THE EARLIER, "OVERZEALOUS" *REIFY-WHNP-OBJECT* 
; RULE, NOW COMMENTED OUT.
(defrule *add-sub-operator-for-wh-s-nominal-within-vp*
; e.g., "I know what you did _.", "I know what you gave him _.",
;       "I know who you are _"; BUT NOT "I know who arrived"
;       But not "the man that/who I spoke of has left." 
   '((VP +expr (.SBAR (.WHXP +expr) (S (NP (!not-none +expr)) *expr (VP +expr))))
     (VP 2 (3.1 (NP (-SYMB- ans-to) (S (-SYMB- sub) 3.2 3.3))))))

(defrule *add-sub-operator-for-wh-s-nominal-conjoined-within-vp*
; e.g., "I know what you did and how you hid it." (gives SBARs within SBAR)
; A somewhat risky rule, not looking at the structure of the rightmost
; (S +expr) to which we're adding (ans-to (sub ...)). The reason is that
; the normal (S [np] [vp]) structure sometimes has already been modified,
; e.g., because of a topicalization. 
   '((VP +expr (.SBAR *expr (.SBAR (.WHXP +expr) (S +expr)) *expr))
     (VP 2 (3.1 3.2 (3.3.1 (NP (-SYMB- ans-to) 
                               (S (-SYMB- sub) 3.3.2 3.3.3))) 3.4))))

(defrule *add-sub-operator-for-whs-nominal-within-pp*
; e.g., "I'm aware of how hard she works*
   '((.PP ?expr (IN !atom) 
         (.SBAR (.WHXP +expr) (S (NP (!not-none +expr)) *expr (VP +expr))))
     (1 2 3 (4.1 (NP (-SYMB- ans-to) (S (-SYMB- sub) 4.2 4.3))))))

; THIS ONE IS REDUNDANT, ALREADY HANDLED BY *REIFY-WHNP-OBJECT*
; (BUT KEPT HERE IN CASE IT CATCHED SOME STRAY CASES)
(defrule *add-sub-operator-for-wh-vp-inf-nominal*
; e.g., "I know what to do"; "I know with whom to speak";
; Actually, the semantics here is tricky; what's the corresponding question?
; Not simply *"With whom to speak?" (cf., "To be or not to be, that is the 
; question")
    '((.SBAR (.WHXP +expr) (S (VP ?[advp] (To to) +expr)))
      (1 (NP (-SYMB- ans-to) 
             (S (-SYMB- sub) 2 (S (NP (PRP {ref})) 
                                  (VP (MD {should}.aux-v) 3.2.4)))))))

(defrule *add-ans-to-operator-for-wh-vp-nominal*
; e.g., "I know who called"; "I know what needs to be done";
;        But avoid e.g., "{the man} who called"
   '((!atom *non-np (.SBAR (WHNP +expr) (S (VP ?expr (.VB/AUX !atom) *expr))))
     (1 2 (NP (-SYMB- ans-to) (S 3.2 3.3.2)))))


; RULES FOR INSERTING 'SUB' IN CERTAIN TYPES OF REL-CLAUSES 
; `````````````````````````````````````````````````````````
; NOTE: Relclauses with an explicit relative pronoun ("who", "which", that",
;       etc.) already have 'SUB' inserted by *ADD-SUB-OPERATOR-FOR-WH-NOMINAL*
;       So here we deal with some forms peculiar to the Brown corpus, and
;       with "implicit" relclauses, i.e., no explicit relative pronoun.

; In Brown, rel-clauses with gaps have forms (immediately following an NP)
; (SBAR (-NONE- 0 {= tht}) (S (NP (!not-none ..) ...) (VP {with (-NONE- T)} ...)))
;       ```````````````` omitted in BLLIP parses
; (SBAR (WHNP (WP-REL/WDT-REL ..)) (S (NP (-NONE- T)) ... (VP ...)))) ; NOT A GAP!
;                                    ```````````````omitted in BLLIP parses
; (   -------- " -------  (S (NP (!not-none ..) ... (VP {with (-NONE- T) ...)
; So there are really just two patterns, but the gap can be at level >=2 in VP

(defrule *add-sub-operator-for-implicit-relclause-in-brown-parses*
; E.g., "the man I saw"; "the man I saw you with", "The car you want me to see".
; NB: Earlier rules converted (-NONE- 0) to (-SYMB- tht) for v-complements, etc.
; This is for Brown corpus parses; "implicit" means the relativizer ("tht") 
; is implicit; Brown parses usually contain (-NONE- T) already, changed by
; an earlier rule here to (-SYMB- *h). (Lexical interpretation rules will
; change any remaining (-NONE- T) to (-SYMB- *h), but this seems to be
; redundant.)
   '((SBAR (-NONE- !zero) (S (NP (!not-none +expr) *expr) *expr (VP +expr) *expr))
     (SBAR (WHNP (-SYMB- sub) (WHNP (-SYMB- tht.rel)) 3))))

; In BLLIP parses, there is no (-NONE- 0) for a missing initial rel-pron, and
; no trace; so at this point we have .REL suffixes, and nothing else in BLLIP
; parses. In formulating rules, we need to ensure the above Brown-oriented rule
; won't match.
(defrule *add-sub-operator-for-implicit-relclause-in-bllip-parses*
; E.g., "the man I saw"; "The man I talked about has left;"
; insert 'sub' and 'tht.rel'; "implicit" = no rel-pron.
    '((NP (NP (!not-none +expr) *expr) 
          (SBAR (S (NP (!not-none +expr) *expr) *expr (VP +expr))) *expr)
      (NP 2 (SBAR (-SYMB- sub) (WHNP (-SYMB- tht.rel)) 3.2) 4)))
                   
; TBC: DO RARER GAPS, AS IN "THE MORE HE SAW _", "HE SUDDENLY SPOTTED,
;    AND QUICKLY TOOK A PHOTO OF, A BLUEBIRD"; "WHO DID YOU SEE _ LEAVE?"
;    I GOT ((SUB WHO.PRO~2 (DID.AUX~3 YOU.PRO~4 (SEE.V~5 (LEAVE.V~6 *H)))) ?)
;    BUT "SEE" SHOULD HAVE A STRONGER PROPENSITY FOR A COMPLEMENT THA "LEAVE".

(defrule *add-sub-operator-to-s-with-topicalized-phrase*
; e.g., "Mary {,} everyone likes." "This, I like." "On weekends, he goes
;       rock-climbing." "When in Rome, I do as the Romans do."
; Any comma, except after an explicit comma-embedded ADVP, was retained;
; We don't use 'sub' for explicit ADVP -- they might be of type ADV-S.
; Premodifying PPs will in general need to be postprocessed, e.g., into ADVP.
    '((S (.NON-ADVP +expr) ?[comma] (S (NP +expr) ?expr (VP +expr) *expr))
     (S (-SYMB- sub) 2 4)))

(defrule *add-sub-operator-to-s-with-topicalized-whnp*
; e.g., "What a mess you made!"
    '((.SBAR (.NP +expr) (.S (NP +expr) ?expr (VP +expr) *expr))
      (1 (-SYMB- sub) 2 3)))

(defrule *add-sub-operator-to-relclause-with-whpp*
; e.g., "This is the man with whom I work.")
   '((NP (NP *expr (.NN +expr)) (SBAR (WHPP +expr) (S +expr)))
     (NP (NP 2.2 (2.3.1 (-SYMB- n+preds) 2.3 (SBAR (-SYMB- sub) 3.2 3.3))))))

(defrule *delete-remaining-commas-preceding-s*
; e.g., "Perhaps tomorrow, after lunch, I'll do some errands."
;        (only the first ',' is deleted by the previous rule; drop the rest)
    '((S *expr (\, \,) *expr (S +expr)) (S 2 4 5)))

; ** NB: WE DON'T ATTEMPT TO APPLY 'SUB' FOR MORE THAN ONE XP PRECEDING
;        A SENTENCE; WE JUST HAVE NO IMMEDIATE WAY TO SORT OUT XP ROLES IN
;        EXAMPLES LIKE, 
;            "WITH SUITABLE HELP, PERHAPS, HE WILL SUCCEED."
;        WHERE THE ULTIMATE ULF SHOULD LOOK LIKE THIS:
;            (PERHAPS.ADV-S (SUB (ADV-A (PP <with suitable help>)) ...))

(defrule *add-sub-for-topicalized-pp-in-inverted-s*
;  e.g., "Among them were a number of children"
;  Add an implicit substitution operator to the topicalized PP of an
;  inverted sentence. NB: This is different from PP topicalization for S.
;  In this special construction, we directly introduce the *h gap variable.
       '((SINV (PP +expr) (VP (.VB .be) (NP +expr))) 
         (SINV (-SYMB- sub) 2 (VP 3.2 3.3 (-SYMB- *h)))) ) 

; RULES THAT CHANGE MORE THAN A WORD
;````````````````````````````````````
(defrule *comb-adv-adjp* 
; For an adv immediately preceding an adj or adjp, add a level of adjp structure:
   '((*expr +list (.RB +expr) (ADJP +expr) *expr) (1 2 (ADJP 3 4) 5)) )

(defrule *reformat-advp-rb-rb*
; e.g., (ADVP (RB steadily) (RB enough)) ==> 
;       (ADVP (-SYMB- adv) (ADJP (RB steadily) (JJ enough)))
    '((ADVP (.RB +expr) (RB !atom)) 
      (ADVP (-SYMB- adv) (ADJP (RB 2.2) (JJ 3.2)))) )
  
(defrule *comb-nn-nn*
; e.g., "[I removed] the water meter cover."
; For an NN (or NNS) modifying an NN (or NNS), add a level 
; of internal NN structure:
    '((.NP *expr (.NN +expr) (.NN !expr) *expr) (1 2 (4.1 3 4) 5)) )
                ;````````````````````````will cause left-to-right noun pairing
; NB: Though NN and NNS categorize just one word in Treebank parses, the rules
;     here may also introduce multiconstituent versions, e.g., NN- or JJ-pre-
;     modified nouns. That's why we use (.NN +expr), rather than (.NN !atom),
;     in the above rule

(defrule *comb-nn-nn-cc*
; e.g., "[I removed] the water meter and the wiring."
; For a noun premodifier in an NP ending at a coordinator or
; comma, add a level of NN structure:
    '((.NP *expr (.NN +expr) (.NN +expr) (.CC !atom) +expr)
      (1 2 (4.1 3 4) 5 6)) )

(defrule *comb-cc-joined-nns*
; e.g., "[I removed] the water meter and screws."
; For two CC-joined NNs (possibly with modifiers) form conjoined NPs
   '((NP (.DT !atom) *list (.NN +expr) (.CC !atom) *list (.NN +expr)) 
     (NP (NP 2 3 4) 5 (NP 6 7))) )

(defrule *comb-cc-joined-adjs*
; e.g., (NP (DT a) (JJ smart) (CC and) (JJ savvy) (NN guy))
; For two CC-joined adjectives (possibly modified) form a single, complex JJ
   '((NP (?list (.JJ !expr) (CC !atom) (.JJ !expr) +expr))
     (NP (2.1 (2.4.1 2.2 2.3 2.4)) 2.5)) )

(defrule *comb-3-cds*
; For 3 successive count words (e.g., (NP (CD 3) (CD hundred) (CD thousand) ...))
; structure them properly; this could be obtained via multiple passes, next rule
   '((NP (?list (CD !expr) (CD !expr) (CD !expr) *expr))
     (NP (2.1 (CD (CD 2.2 2.3) 2.4) 2.5))) )

(defrule *comb-2-cds*
; For 2 successive count words (e.g., (NP (CD 3) (CD hundred)...))
; structure them properly
   '((NP (?list (CD !expr) (CD !expr) *expr))
     (NP (2.1 (CD 2.2 2.3) 2.4))) )

(defrule *comb-cc-joined-cds*
; For two CC-joined count adj's (possibly modified) form a single, complex CD
; e.g., (NP (CD 12) (CC or) (CD 14) (NNS meters))
   '((NP (?list (CD !expr) (CC !atom) (CD !expr) +expr))
     (NP (2.1 (CD 2.2 2.3 2.4)) 2.5)) )

;TBC

(defrule *reformat-misplaced-relclause-in-s*
; BLIPP misparses, e.g., "The man you watched left" as a dual-subject S
; with a VP containing complement (S (VP (VBN LEFT))). The SBAR introduced
; by the reformatting will be incorporated as a relclause by *comb-np-postmod*
  '((S ![NP] ![NP] (VP (.VB !atom) (S ![VP])))
    (S (NP 2 (SBAR 3 (VP 4.2))) 4.3.2)))

(defrule *reformat-misplaced-relclause-in-q*
; BLIPP misparses, e.g., "Did the man you watched leave?" as containing
; a sentence after "the man", of form (S ![NP] (VP ![verb] (S (VP (VB LEAVE)));
; the SBAR introduced by the reformatting will be incorporated as a relclause
; by *comb-np-postmod*
  '((SQ (.AUX !atom) ?expr ![NP] (S ![NP] (VP ![verb] (S ![VP]))))
    (SQ 2 3 (NP 4 (SBAR 5.2 (VP 5.3.2))) 5.3.3.2)))

(defrule *reformat-misplaced-relclause-in-q-v2*
; BLIPP misparses, e.g., "Did the man you were watching leave?" as containing
; an SBAR (relative clause) after "the man", covering the rest of the sentence,
; of form (SBAR (S ![NP] (VP !aux (VP ![verb] (S ![VP]))))); deeply buried
; main verb! The SBAR introduced by the reformatting will be incorporated
; as a relclause by *comb-np-postmod*
  '((SQ (.AUX !atom) ?expr ![NP] 
                         (SBAR (S ![NP] (VP ![verb] (VP ![verb] (S ![VP]))))))
                               ;```````````````````````````````
    (SQ 2 3 (NP 4 (SBAR (S 5.2.2 (VP 5.2.3.2 (VP 5.2.3.3.2))))) 5.2.3.3.3.2)))

; ** WE NEED A RULE HERE FOR INFINITIVES AS RELATIVE CLAUSES, AFTER
;    NOUNS THAT DON'T TAKE INFINITIVE COMPLEMENTS
;    E.G., "The man to see is Bob"; "This is the paper to be submitted to ACL"

(defrule *treat-inf-after-nn-as-complement*
; E.g., "He made no attempt to outdo Ray Bolger";
   '((.NP *expr (.NN +expr) (S (VP (TO to) +expr)) *expr)
     (1 2 (3.1 3 4) 5))) 

(defrule *treat-modified-inf-after-nn-as-complement*
; E.g., "He made no attempt openly to outdo Ray Bolger";
   '((.NP *expr (.NN +expr) (S ![advp] (VP (TO to) +expr)) *expr)
     (1 2 (3.1 3 (S (VP (TO to) (VP 4.2 4.3.3)))) 5)))

(defrule *comb-nn-postmod*
; For an NN followed (*within* an NP or WHNP) by a postmodifier (e.g., PP),
; add a level of NN structure combining the predicates; any NN premods
; will already have been combined:
    '((.NP *expr (.NN +expr) +expr) (1 2 (3.1 (-SYMB- n+preds) 3 4))) )

(defrule *comb-coordinated-adjs*
; This is to handle comma-separated adj's premodifying an NN{S}, and
; instances of 'and'd adjectives where BLLIP fails to form a conjunction.
; (E.g., BLLIP forms a conjunction for "I like large and friendly dogs",
; and for "I saw large and black dogs" but not "I like large and black dogs")
; e.g., "I saw a large, black dog" -- use \,.cc ?
; e.g., "I like large and black dogs"
; NB: BLLIP yields coordinated adj's in all of the following examples:
;   "I think it was a red or maroon car"
;   "It had black and white stripes" 
;   "He is an experienced and fast programmer"
;   "It was a good but rowdy concert" 
;   "I saw a large, black dog"
    '((.NP *expr (.ADJP +expr) (.CC !atom) (.ADJP +expr) (.NN +expr))
      (1 2 (5.1 3 (CC 4.2) 5) 6)))

(defrule *comb-nn-jj*
; E.g., "The spire is truly [sky high]." "Italians are child friendly"
; Note: if nothing precedes the NN, it will already be grouped with JJ.
    '((ADJP +expr (.NN +expr) (.JJ !atom) *expr)
      (ADJP 2 (ADJP 3 4) 5)))

(defrule *comb-jj-after-rb-with-postmod*
; E.g., "The pool is very big in diameter"; "I'm quite sure that's true."
;       "The rules are strongly tilted towards the rich."
; For a JJ followed (*within* an ADJP) by a postmodifier (e.g., PP),
; add a level of ADJP structure combining the predicates; any NN premods
; will already have been combined '.ADJP' allows for JJ, etc.):
    '((!atom (.RB !atom) (.ADJP +expr) +expr) (ADJP 2 (ADJP 3 4))))

(defrule *comb-jj-after-wrb-with-postmod*
; E.g., "It's reassuring how full of hope they are"; "How full of hope is he?"
; For a JJ followed (*within* an WHADJP or WHNP) by a postmodifier (e.g., PP),
; add a level of ADJP structure combining the predicates; any NN premods
; will already have been combined:
    '((!atom (WRB !atom) (.ADJP +expr) +expr) (WHADJP 2 (ADJP 3 4))))

(defrule *change-whnp-to-whadjp-before-how-jj*
; e.g., "How big is the rocket?" "I can see how big it is"; NB: .ADJP allows JJ
    '((WHNP (!atom how) (.ADJP !expr)) (WHADJP 2 3)))
  
(defrule *comb-adj-nn*
; E.g., "the [last [interview I had]]"
; For an adjective premodifier in an NP or WHNP, add a level of NN structure,
; where NN postmodifiers are assumed to have been NN-incorporated already:
    '((.NP *expr (.ADJP +expr) (.NN +expr)) (1 2 (4.1 3 4))) )

(defrule *comb-adj-nn-cc*
; E.g., "The [[purple irises] and red tulips ...]"
; For an adjective premodifier in an NP or WHNP ending at a coordinator
; or comma, add a level of NN structure:
    '((.NP *expr (.ADJP +expr) (.NN +expr) (.CC !atom) +expr) 
      (1 2 (4.1 3 4) 5 6)) )

; This rule doesn't help, because the "interloping" ADVP really idicates that
; a larger conjunction needs to be formed from the seemingly conjoined pieces.
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (defrule *adjoin-advp-after-np-and-cc-to-next-phrase*
; ; e.g. "[[A mockingbird] or perhaps [a grackle]] flew by." (incorrect structure)
; ;      "perhaps a grackle" means something like "what was perhaps a grackle"
; ;      "He served the wine and then the main course."
;     '((NP *expr (NP +expr) ?[comma] (CC !atom) (.ADVP !expr) (NP +expr) *expr)
;       (NP 2 3 5 (NP (-SYMB- *conj-fragments) 6 7 8))))

(defrule *form-jjr-compar-with-gap*
; e.g., "He is sadder than I am _ {about that}."
; For a comparative like 
;   (ADJP (JJR sadder) (PP/SBAR (IN/PS than) (S <NP> (VP <V> ...))))
; put *adj after the <V>:
    '((ADJP ?[advp] (JJR !atom) 
            (!atom (!atom than) (S (NP +expr) ?expr (VP (.VB .be/become) *expr))))
      (ADJP (2 3) 
            (4.1 (4.2.1 than)
                 (S 4.3.2 4.3.3 (VP 4.3.4.2 (-SYMB- *adj) 4.3.4.3))))) )

(defrule *form-adjp-compar-with-gap*
; e.g., "He is much sadder than I am _ {about that}."
; For a comparative like 
; (ADJP ((ADJP (RB much) (JJR sadder)) (PP/SBAR (IN/PS than) (S <NP> (VP <V> ...))))
; put *adj after the <V>:
    '((ADJP ?[advp] (ADJP *expr (JJR !atom))
            (!atom (!atom than) (S (NP +expr) ?expr (VP (.VB .be/become) *expr))))
      (ADJP (2 3)
            (4.1 (4.2.1 than)
                 (S 4.3.2 4.3.3 (VP 4.3.4.2 (-SYMB- *adj) 4.3.4.3))))) )

; We ultimately need variants, e.g., where we have a non-.be/become verb,
; and ellipsis after the verb (cf. "It's bigger than I thought", where this
; first needs expansion to "It's bigger than I thought it is")

(defrule *add-k-to-bare-np*
; For a bare NP add an implicit kind-forming operator; this assumes that
; NN premodifiers, the NP-internal postmodifiers, and then adj-premodifiers
; have already been added. NP-external postmodifiers are added later (by
; *comb-np-postmod*)
    '((NP (.NN +expr)) (NP (-SYMB- K) 2)) )

(defrule *form-what-a-np*
; E.g., "What a big house" currently gets parsed as 
;    (WHNP (WP what) (DT a) (ADJP (JJ big)) (NN house)),
; but it should be a nominal predicate (via '='), with emphatic "what" applied 
; to a nominal predicate (again via '='):
   '((.NP (WP what) (DT .a/an) *expr (NN +expr))
     (1 (-SYMB- =) (NP (DT what-em) (NP (-SYMB- =) (NP 3 4 5))))) )

(defrule *comb-what-np-sbar*
; E.g., "What a big house he has!" after the previous rule will have the form
; ((NP (-SYMB- =) (NP (DT what-em) (NP ...))) (SBAR (-NONE- 0) (S ...)))),
; whereas we want a sentence with an emphatic, extracted, fronted NP.
; Note that
   '((NP (NP (-SYMB- =) (NP (DT what-em) (NP (-SYMB- =) (NP +expr))))
         (SBAR (-NONE- !atom) (S +expr))); the (S +expr) should contain a gap
     (S (-SYMB- sub) 2 3.3)) ); NB: dropped the (-NONE- !atom), o/w we'd get 
                              ;     a relative clause by later rules.

(defrule *comb-np-postmod* ; dimensions (3 3) (breadth 3, depth 3);
;  Restructure an NP[with possible premods] + postmodifier so that the 
;  determiner applies to the predicate of the NP *and* the postmodifier 
;  (use an 'n+preds' in ULF):
       '((NP (NP *pre-nn-pos+word *expr (.NN +expr)) (.POSTMOD +expr))
         (NP 2.2 2.3 (2.4.1 (-SYMB- n+preds) 2.4 3))) )

(defrule *comb-np-participle* ; dimensions (3 3) (breadth 3, depth 3);
; e.g., "The children playing outside are happy." "Anyone singing is happy."
;       "the child left behind is distraught." "Anyone given money is happy."
;  Restructure an NP + (VP (VBG/VBN ...) ...) postmodifier so that the 
;  determiner applies to the predicate of the NP *and* the postmodifier 
;  (use an 'n+preds' in ULF); assume that the NP has already had NN
; premodifiers, internal postmodifiers, and adjective premodifiers
; incorporated (see earlier rules), so that now the NP starts with
; a determiner or (-SYMB- k):
       '((NP (NP *expr (.NN +expr)) (VP (.VBG/VBN !atom) *expr))
         (NP 2.2 (NP (-SYMB- n+preds) 2.3 3))) )

(defrule *comb-sentence-initial-np-participle*
; e.g., "The child playing in the sand is happy"; I know the man taken to jail."
;       BLLIP makes the participle an S-constituent in these cases.
      '((S (NP *expr (.NN +expr)) (!atom (.VBG/VBN !atom) *expr))
                                  ;`````BLLIP may make this PP, not VP
        (S (NP 2.2 (2.3.1 (-SYMB- n+preds) 2.3 (VP 3.2 3.3))))))

(defrule *comb-dt-postmod* ; dim (3 3)
;  Restructure a headless NP + postmodifier so that the determiner applies 
;  to the implicit predicate of the NP and the postmodifier (will become 
;  an 'n+preds'):
      '((NP (NP (DT !atom)) (.POSTMOD +expr)) 
        (NP 2.2 (NN (-SYMB- n+preds) (NN {ref}) 3))) )

(defrule *augment-dt-jj*
; e.g., "He is trying to achieve the impossible;" "The rich get richer."
     '((NP (DT the) (.ADJP +expr)) (NP 2 (NN 3 (NN {ref})))))

(defrule *del-null-subj-after-comma*
; Delete an empty sentential subject for an S right after a comma;
; such an "S" is usually a predicate 
    '((+expr (\, \,) (S (NP (-NONE- *)) +expr) *expr) (1 2 (VP 3.3) 4)) )

(defrule *comb-verbless-preds*
; For comma-separated predicates of a verbless sentential with[out]-complement,
; combine them into a conjunctive predicate (with the comma viewed conjunctively);
; we use whatever pred category was first as the category of the conjunction;
; we also "take a chance" that the material after the comma will indeed consist
; of further predicates; also, I'm tentatively using |,&| as "conjunctive comma";
; finally, the entire (with[out] S[verbless]) seems to always be an ADVP:
   '((PP (IN .with) (S (NP +expr) (.PRED +expr) (\, \,) +expr))
     (ADVP (-SYMB- adv-a) (PP (PS 2.2) (S 3.2 (3.3.1 3.3 (|,&| |,&|) 3.5))))) )

(defrule *del-null-subj-followed-by-to* ; dim (4 3)
; E.g., "He began to speak." In Brown "to" is a sister of the main VP, but
;       actually by the time we get to this rule, (TO to) is VP-embedded.
; Delete empty subject-NP of a to-infinitive, making the infinitive an NP:
    '((S (NP (-NONE- *)) (To to) *expr) (1 (NP 3 4))) )
; NB: This rule assumes that AUX has not yet been combined with the VP,
;     so it must precede *comb-aux-vp* (the next rule)

(defrule *del-null-subj-followed-by-inf-vp* ; dim (4 3)
; E.g., "He began to speak." After earlier rules (& for BLLIP), we have  
;       (... (NP (-NONE- *)) (VP (TO to) ...) 
; Delete empty subject-NP of a to-infinitive, making the infinitive an NP:
    '((S (NP (-NONE- *)) (VP *[advp] (TO to) *expr)) 
      (S (NP (TO to) 3.2 3.4))) )

(defrule *change-s-with-null-subj-to-gerund* ; dim (3 3)
; Recast an S with an empty subject & a progressive VP as a gerund --
; an NP with an implicit Ka:
   '((S (NP (-NONE- *)) (VP (VBG !atom) *expr)) (NP (-SYMB- Ka) 3)) )

(defrule *change-s-with-no-subj-to-gerund* ; Feb 25/21
; Recast an S with no subject and a progressive VP as a gerund --
; but don't do it for complements of auxiliary "be"; e.g., "Mary likes 
; working" ('S' can get wrapped around the VP), vs. "Mary is working".
    '((VP *expr ![non-aux-be-verb] *expr (S (VP ?[advp] (.VBG/AUXG !atom) *expr))) 
      (VP 2 3 4 (NP (-SYMB- Ka) 5.2))) )

(defrule *change-prog-vp-compl-of-non-be-verb-to-gerund* ; Feb 26/21
; E.g., in "Joe stopped doing homework" treat "doing homework" as a
; gerund (thus, an action type); e.g., "Bob went rock climbing."
; But bypass aux-be verbs, as in "Joe is doing homework". 
    '((VP *expr ![non-aux-be-verb] *expr (VP ?expr (.VBG/AUXG !atom) *expr))
      (VP 2 3 4 (NP (-SYMB- Ka) 5))) )

(defrule *change-prog-s-vp-subject-to-gerund* ; May 1/21
; E.g., in "Sleeping in the park is illegal" the subject should be
; a gerund (to be reified), not an (S (VP ...))
    '((S (S (VP +expr)) *expr) (S (NP (-SYMB- Ka) 2.2) 3)))

(defrule *change-prog-s-vp-object-of-prep-to-gerund*
; E.g., "I'm tired of seeing constant commercials"
    '((PP (IN !atom) (S (VP ?[advp] (.VBG/AUXG +expr) *expr)))
      (PP 2 (NP (-SYMB- Ka) 3.2))))

(defrule *change-s-to-vp*
; Recast a putative S with a trace-subject (that's really a VP within 
; an S-REL -- an SBAR in the original parse) as a VP:
       '((S (NP (-SYMB- !hole-var)) !expr) 3) )
  
(defrule *del-sbarq-subj*
; Delete empty subject from wh-question (in Brown only), e.g., "Who left?"
       '((SBARQ (WHNP !atom) (SQ (NP (-NONE- !atom)) *expr)) 
         ((-SYMB- sub) 2 3.3)) )
; Elsewhere, any remaining trace (NP (-NONE- T)) will be interpreted as
; *h in ULF; if we were to use rule '((NP (-NONE- T)) (-SYMB- *h)) ), we
; would then have to change the input pattern in *change-s-to-vp* and in
; various other rule input patterns to look for (-SYMB- *h), or add 
; a variant like that to the current version. That's not been done.

(defrule *comb-np-poss*
; e.g., (NP (NP (DT the) (NN woman)) (POS \'s) (NN stepson) ...) should become
;       (NP (NP (DT (NP (DT the) (NN woman)) (POS \'s)) (NN stepson)) ...)
; I equivocated between using DETP and DT for the "NP 's" genitive, but decided
; to use DT because I also use WDT-REL for "[the man] WHOSE wife you met",
; and WDETP-REL gets a bit unwieldy, and anyway, linguists nowadays reserve
; "determiner phrase" for "noun phrase" (with a determiner).
   '((+expr (NP +expr) (POS \'s) (.NN +expr) *expr) (1 (NP (DT 2 3) 4) 5)) )

(defrule *format-single-name-for-ulf*
   '((!atom (.NNP !atom)) (1 (2.1 (format-name-for-ulf! (quote 2.2))))))

(defrule *comb-6-successive-nnp*
   '((*expr (.NNP +expr) (.NNP +expr) (.NNP +expr) (.NNP +expr) 
            (.NNP +expr) (.NNP +expr)) 
     (1 (7.1 (merge-names! '(2.2 3.2 4.2 5.2 6.2 7.2))))) )

(defrule *comb-5-successive-nnp*
   '((*expr (.NNP +expr) (.NNP +expr) (.NNP +expr) (.NNP +expr) (.NNP +expr)) 
     (1 (6.1 (merge-names! '(2.2 3.2 4.2 5.2 6.2))))) )

(defrule *comb-4-successive-nnp*
   '((*expr (.NNP +expr) (.NNP +expr) (.NNP +expr) (.NNP +expr)) 
     (1 (5.1 (merge-names! '(2.2 3.2 4.2 5.2))))) )

(defrule *comb-3-successive-nnp*
   '((*expr (.NNP +expr) (.NNP +expr) (.NNP +expr)) 
     (1 (4.1 (merge-names! '(2.2 3.2 4.2))))) )

(defrule *comb-2-successive-nnp*
   '((*expr (.NNP +expr) (.NNP +expr)) 
     (1 (3.1 (merge-names! '(2.2 3.2))))) )

(defrule *change-nnp-to-nn-after-premod*
; e.g., "the silvery Moon"; NB: It's assumed that examples like "Mr. Smith",
; Vice President Gore" won't match here, because successive NNPs should
; already have been merged.
   '((NP *expr ![nn-premod] (.NNP +expr)) (NP 2 3 (NN 4.2))))

(defrule *change-final-nnp-to-nn-after-initial-dt*
; e.g., "the Examiner" should come out as (the.d | Examiner|.n)
   '((NP (.DT !atom) *expr (NNP +expr)) (NP 2 3 (NN 4.2))))

(defrule *change-final-nnps-to-nns-after-initial-dt*
; e.g., "the Celts" should come out as (the.d (plur | Celt|.n))
   '((NP (.DT !atom) *expr (NNPS +expr)) (NP 2 3 (NNS 4.2))))

(defrule *change-nnp-to-nn-before-pp-of*
; e.g., "Speaker of the House" -- "Speaker" is a name-like *noun* here
; But "Stratford on Avon" leaves "Stratford" as a name.
   '((NP *expr (.NNP +expr) (PP (IN of) +expr)) 
     (NP 2 (NN (-SYMB- n+preds) (NN 3.2) 4))) )

(defrule *del-trailing-comma-from-np*; extend to other phrase types??
; e.g., "Behind [[this reply], and [its many variations],] is the ..."
   '((NP +expr (\, \,)) (NP 2)) )

; (defrule *change-indef-np-to-pred-after-be-or-become*
; ; e.g., "Alice became a doctor" --> drop the "a".
; ; NB: This rule and the next one need to come after combining pre- &
; ;     postmodifers of a noun with the noun, so that the (DT a) won't 
; ;     be embedded, as in (NP (NP (DT a) (NN man)) (PP (IN of) ...))
; ; Unfortunately, we'd either need extra rules, or repeated top-level      
; ; rule applications to remove "a" from *both* NPs in something like
; ; "Alice became a doctor and a community organizer". Instead, the rules
; ; below introduce '=' into such conjoined phrases. ** MAYBE THE PRESENT
; ; RULE SHOULD BE OMITTED, SO THAT NP COMPLEMENTS OF BE/BECOME ARE HANDLED
; ; UNIFORMLY??
;    '((VP ?expr (.VB .be/become) *expr (NP (DT .a/an) +expr) *expr)
;      (VP 2 3 4 (NP 5.3) 6)) )

(defrule *add-equals-to-post-cc-np-in-a-conjunction-after-be-or-become*
; e.g., "Alice became rich and a prominent philanthropist" --> introduce (= ...)
; for the embedded NP. If this rule has been applied, and the conjunction
; is an NP we don't want to introduce equality *again* at that level. So
; we change the conjunct to be a PRED (unused elsewhere), after equality
; introduction.
   '((VP ?expr (.VB .be/become) *expr 
               (.ADJP/NP/PP/SBAR/UCP/PRED *expr (CC .and/or) *expr 
                                               (NP +expr) *expr) *expr)
     (VP 2 3 4 (PRED 5.2 5.3 5.4 (PRED (-SYMB- =) 5.5) 5.6) 6)) )

(defrule *add-equals-to-pre-cc-np-in-a-conjunction-after-be-or-become*
; e.g., "Alice became a top executive and very rich" --> introduce (= ...)
; for the embedded NP. If this rule has been applied, and the conjunction
; is an NP we don't want to introduce equality *again* at that level. So
; we change the NP conjunct to be a PRED (unused elsewhere), after equality
; introduction.
   '((VP ?expr (.VB .be/become) *expr
               (.ADJP/NP/PP/SBAR/UCP/PRED *expr (NP +expr) *expr (CC .and/or)
                                                                 *expr) *expr)
     (VP 2 3 4 (PRED 5.2 (PRED (-SYMB- =) 5.3) 5.4 5.5 5.6) 6)) )

(defrule *add-equals-to-np-after-be-or-become-in-sentence*
; e.g., "Alice became the CEO of the company"; "Alice wants to become
;       a lawyer" --> introduce (= ...)
; This is a default *after* the previous 2 rules have been applied.
; Preclude existential "There" as in "There is a tavern in the town".
   '((S +[non-ex-np] (VP ?expr (.VB .be/become) *expr (NP +expr) *expr))
     (S 2 (VP 3.2 3.3 3.4 ((-SYMB- =) 3.5) 3.6))) )

(defrule *add-equals-to-np-after-be-or-become-in-vp-aux*
; e.g., "Alice's dream is to became the CEO of the company"; "Alice will become
;       a lawyer"; "Will she become a lawyer?"; --> introduce (= ...)
; This is a default after the previous 3 rules have been applied.
   '((!atom (.AUX !atom) *expr (VP ?expr (.VB .be/become) *expr (NP +expr) *expr))
     (1 2 3 (VP 4.2 4.3 4.4 (PRED (-SYMB- =) 4.5) 4.6))) )

(defrule *standardize-single-comma-binary-np-conj*
; e.g., "a good man, and a good American" becomes "a good man and a good American"
   '((NP (NP +expr) (\, \,) (CC .and/or) !expr) (NP 2 4 5)) )

(defrule *standardize-double-comma-binary-np-conj*
; e.g., "a good man, and a good American" becomes "a good man and a good American"
   '((NP (NP +expr) (\, \,) (CC .and/or) (\, \,) !expr) (NP 2 4 6)) )

(defrule *standardize-single-comma-ternary-np-conj*
; e.g., "a good man, a good American and a good Democrat", aside from brackets,
;        becomes "a good man and a good American a good Democrat"
; NB: comma deletion in NP conjunctions is crucial to avoid faulty appositive
;     formation by the *form-appos-from-np-and-name* rule below.
   '((NP (NP +expr) (\, \,) (NP +expr) (CC .and/or) !expr) (NP 2 5 4 6)) )

(defrule *standardize-double-comma-ternary-np-conj*
; e.g., "a good man, a good American, and a good Democrat", aside from brackets,
;        becomes "a good man and a good American a good Democrat"
   '((NP (NP +expr) (\, \,) (NP +expr) (\, \,) (CC .and/or) !expr) (NP 2 6 4 7)) )

(defrule *standardize-triple-comma-ternary-np-conj*
; e.g., "a good man, a good American, and, a good Democrat", aside from brackets,
;        becomes "a good man and a good American a good Democrat"
   '((NP (NP +expr) (\, \,) (NP +expr) (\, \,) (CC .and/or) (\, \,) !expr) 
     (NP 2 6 4 8)) )

(defrule *form-appos-from-np-and-name*
; e.g., "his court-appointed attorney, Jack Walker", analyzed as successive
; NPs (separated by a comma and followed by one), should lead to ULF
; (np+preds NP1' (= NP2')). Avoid cases where there's no determiner on the
; first NP, as in "Detroit, Michigan".
   '((NP (NP (.DT !expr) +expr) (\, \,) (NP *expr (NNP +expr)) *expr)
     (NP (-SYMB- np+preds) 2 (NP (-SYMB- =) 4) 5)) )

(defrule *form-appos-from-determinate-np-and-np*
; e.g., "the post he sought, Speaker and power-broker"
; a riskier version of the previous rule -- no NNP requirement, but we're
; not allowing trailing material (after the 2nd NP) in this case
   '((NP (NP (.DT !expr) +expr) (\, \,) (NP +expr))
     (NP (-SYMB- np+preds) 2 (NP (-SYMB- =) 4))) )

(defrule *form-appos-from-np-and-determinate-np*
; e.g., "Robert Molesworth, a Whig leader"
; again somewhat risky but we're requiring a determiner after the comma.
   '((NP (NP +expr) (\, \,) (NP (.DT !expr) +expr))
     (NP (-SYMB- np+preds) 2 (NP (-SYMB- =) 4))) )

(defrule *form-appos-from-np-and-conjunctive-determinate-np*
; e.g., "Robert Molesworth, a Whig leader and member of the Privy Council"
; again somewhat risky but we're requiring an embedded determiner after 
; the comma.
   '((NP (NP +expr) (\, \,) (NP (NP (.DT !expr) +expr) +expr))
     (NP (-SYMB- np+preds) 2 (NP (-SYMB- =) 4))) )


(defrule *change-vbn-to-vbd-as-s-headword* 
; An error correction rule, e.g., In "before his father left", "left" is 
; VBD, not VBN. This rule needs to come after the -NONE- rules, since
; after an empty S-subject, a VBN is usually a passive participle.
  '((S (NP +expr) (VP (VBN !atom) *expr)) (S 2 (VP (VBD 3.2.2) 3.3))) )
  
; (defrule *change-sbar-to-srel*
; ; Recast an SBAR starting with relative pronoun 'that' or 'which' as an S-REL:
; ; Not needed if residual WDT always marks a relative pronoun
;     '((SBAR (WHNP (WDT !atom)) (VP +expr)) (S-REL ((WDT-REL 2.2.2)) 3)) )

(defrule *change-wdt-to-dt*
; Change WDT to DT if it's the determiner of a NP with an NN or NNS head
      '((WHNP (WDT !atom) *expr (.NN +atom)) (WHNP (DT 2.2) 3 4)) )

; TBC: insert rule where e.g., (WDT what) in "What happened" becomes (WP what)
  
(defrule *change-init-cd-to-dt*
;  For an initial count adjective in an NP, we have a kind/determiner ambiguity;
;  maybe use a DT by default, which could be postprocessed to, e.g. 'five-gen.d'
     '((NP (CD !atom) (.NN +expr)) (NP (DT 2.2) 3)) )
     ; the alternative would be ((-SYMB- k) 2.2)
  
(defrule *change-empty-that-to-relativizer*
;  Replace empty relativizer so that its ULF will be tht.rel (the default
;  ULF for silent "that" is complementizer tht):
     '((NP +expr (SBAR (-NONE- !zero) (S +expr))) 
       (1 2 (SBAR (-SYMB- tht.rel) 3.3))) )
  
(defrule *mark-it-extra*
;  Change "it" to "it-extra" in it-extraposition (the .EXTRAP-S feature can be
;  SBAR-1, SBAR-2, ..., S-1, S-2, ...): in ULF we assume we can locate the
;  it-referent without an explicit syntactic device; but I decided not to
;  use .EXTRAP-S here - such S's can be determined from the 'it-extra.pro'
     '((NP (PRP it) (!atom (-NONE- !pseudo-attach))) (NP (PRP it-extra))) )
                                  ;`````````````` just matches *pseudo-attach*

(defrule *del-x-wrapper*
; (X ...) seems to get wrapped around a phrase where the annotator thought
; it is implicitly some higher-level phrase, but not sure what.
; This rule should be applied before most other rules, lest it block
; application of rules that expect the phrase that the (X ...) is hiding.
   '((X !expr) 2) )

(defrule *raise-displaced-s-final-postmod*
;  e.g., "Bob wrote a poem today, {which he is proud of / about his pet goat}."
;  e.g., "The victim died, who had been pulled from the burning car."
;         Make the part before the comma a separate S, with a 'rep'
;         (the place for insertion of *p is provided in Brown)
;  In Brown, rightward-displaced NP-postmodifiers in the subject are 
;  treated as siblings of the other sentence constituents; we want a 
;  2-part rep (replace) construct at the S-level instead; we introduce
;  the replacement operator rep here, while we'll introduce the *p 
;  placeholder with separate rules using the *pseudo-attach* markings.
;  The .DIS-POSTMOD feature covers displaced postmod predicates -- e.g., 
;  PP-2, SBAR-2 (as rel-clause), VP-3 (a participle), ADJP-2, etc?
     '((S +expr (\, \,) (.DIS-POSTMOD +big-expr)) (S (-SYMB- rep) (S 2) 4)) )

(defrule *raise-displaced-s-final-appos*
; e.g., "The victim died, the one who had been pulled from the burning car."
; We need a separate rule for appositives, as they need an '=' relation
; to yield a predicate:
     '((S +expr (\, \,) ![big-np]) (S (-SYMB- rep) (S 2) (NP (-SYMB- =) 4))) )

; The above doesn't deal 

;; This rule did the rep + *p conversion in one fell swoop; if the above rules
;; misidentify displaced phrases (because of not checking for the *pseudo-attach*
;; pairing with the postmodified NP), this may be needed after all.
;;
; (defrule *restruc-displaced-appos*
; (defrule *restruc-displaced-postmod*
; ; the postmodifier can be a PP, rel-clause (headed e.g., by (SBAR-2 ...)),
; ; participial VP, **others?
;     '((S (NP (NP +expr) (!atom (-NONE- !pseudo-attach))) +expr (\, \,)    
;              (.DIS-POSTMOD +expr))
;       (S (-SYMB- rep) (1 ((-SYMB- np+preds) (NP 2.2.2) (-SYMB- *p)) 3) 5)) )

;; This rule did the rep + *p conversion in one fell swoop; if the above rules
;; misidentify displaced phrases (because of not checking for the *pseudo-attach*
;; pairing with the postmodified NP), this may be needed after all.
;;
; (defrule *restruc-displaced-appos*
; ;  In Brown, rightward-displaced appositives are treated as siblings
; ;  of the postmodified NP; we want a 2-part rep (replace) construct instead:
; ;  (e.g., scan for "rock" and "skinny" in p16.cmb); !atom is usually NP-1,
; ;  NP2,, etc., but also can be SBAR-2, etc.
;     '((S (NP (NP +expr) (!atom (-NONE- !pseudo-attach))) +expr (\, \,) 
;              (.NP +expr))
;       (S (-SYMB- rep) (1 ((-SYMB- np+preds) (NP 2.2.2) (-SYMB- *p)) 3) 
;                     (NP (-SYMB- =) 5))) ); the equality makes the NP a pred

(defrule *raise-displaced-vp-final-postmod*
; Brown has rightward-displaced postmodifiers both at the end of S and at
; the end of VP;
    '((VP +expr (\, \,) (.DIS-POSTMOD !big-expr)) (VP (-SYMB- rep) (VP 2) 4)) )

(defrule *raise-displaced-vp-final-postmod-in-brown-corpus*
; This is a case where the determiner should scope over the NN along with
; the displaced postmodifier not just the NN
   '((VP +expr (NP (NP (DT !atom) (NN +atom)) 
                (.DIS-POSTMOD (-NONE- !pseudo-attach))) +expr (.DIS-POSTMOD +expr))
     (VP (-SYMB- rep) (VP 2 (NP (DT 3.2.2.2) (NN (-SYMB- n+preds) 3.2.3 
                                                         (-SYMB- *p))) 4) 5)) )

;; ** I'll presumably need a rule for an S-final postmod also, as in
;;    "A man walked in who was wearing a mask"

(defrule *raise-displaced-np-final-postmod*
; e.g., "the great push initiated recently to teach computer skills in grade school"
; e.g., "the great advances that have been made in recent years in face recognition"
; [my feeling is that this is just free-ordering of noun adjuncts/complements]

 'TBC);***TBC

(defrule *raise-displaced-vp-final-appos*
; Brown has rightward-displaced appositives both at the end of S and at
; the end of VP;
   '((VP +expr (\, \,) ![big-np]) (VP (-SYMB- rep) (VP 2) (NP (-SYMB- =) 4)))) 

(defrule *add-postmod-placeholder*
; Introduce np+preds and pred-placeholder *p for NP with displaced postmodifier;
  '((NP (NP +expr) (!atom (-NONE- !pseudo-attach)))
    (NP (NP (-SYMB- np+preds) 2.2 (-SYMB- *p)))) )

; TBC -- thoroughly check the accuracy and coverage of the above rules for
;    rightward displacement; In particular, does the immediately preceding
;    rule wrongly apply to other uses of *pseudo-attach*, like "as ... as ..."
;    comparatives, etc.?

;; This rule did the rep + *p conversion in one fell swoop; if the above rules
;; misidentify displaced phrases (because of not checking for the *pseudo-attach*
;; pairing with the postmodified NP), this may be needed after all.
;;
; (defrule *restruc-displaced-postmod*
; ;  In Brown, rightward-displaced postmodifiers are treated as siblings
; ;  of the postmodified NP; we want a 2-part rep (replace) construct instead:
; ;  (e.g., scan for "bleeding" in p16.cmb); 
;     '((VP +expr (NP (NP +expr) (!atom (-NONE- !pseudo-attach))) +expr (\, \,) 
;              (.POSTMOD +expr))
;       ((-SYMB- rep) (1 ((-SYMB- np+preds) (NP 2.2.2) (-SYMB- *p)) 3) 
;                     ((-SYMB- =) 5))) );

;; This rule did the rep + *p conversion in one fell swoop; if the above rules
;; misidentify displaced phrases (because of not checking for the *pseudo-attach*
;; pairing with the postmodified NP), this may be needed after all.
;;
; (defrule *restruc-displaced-appos*
; ;  In Brown, rightward-displaced appositives are treated as siblings
; ;  of the postmodified NP; we want a 2-part rep (replace) construct instead:
; ;  (e.g., scan for "bleeding" in p16.cmb); 
;     '((VP +expr (NP (NP +expr) (!atom (-NONE- !pseudo-attach))) +expr (\, \,) 
;              (.NP +expr))
;       (VP (-SYMB- rep) (1 ((-SYMB- np+preds) (NP 2.2.2) (-SYMB- *p)) 3) 
;                     (NP (-SYMB- =) 5))) );


;  Delete *pseudo-attach* placeholders in other uses, such as correlating
;  "as ... as ..." comparatives (use !pseudo-attach, because *pseudo-attach*
;  iteself in a pattern is interpreted as a sequence predicate!
;  
;  TBC

; REVERSE THE RULE NAMES IN *PREPROCESSING-RULE-NAMES*, SINCE "PUSH"ING
; THEM ONTO *PREPROCESSING-RULE-NAMES* PUT THEM IN REVERSE ORDER:
; (First remove occurrences of rules with value 'TBC' (used for rules 
; not yet filled in) or another atomic value)
(setf *preprocessing-rule-names* 
  (remove-if #'(lambda (x) (atom (eval x)))  
              (reverse *preprocessing-rule-names*)))





; Possibly handle under-bracketed coordination in postprocessing??
; 
;  (.det .pred \, .pred \, .and .pred) ==> (1 (2 6 4 7) 
;                                               
; Similarly for coordination of different types and lengths







