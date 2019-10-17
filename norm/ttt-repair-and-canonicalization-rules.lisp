; TTT rules for textual input repair/refinement, parse tree 
; repair/refinement, and logical form repair/refinement. 
; =====================================================================
;
; Note: Computable predicates (with a final question mark) in some cases
; still have ad hoc definitions in 
;     ./ttt-preds-and-functions-for-captions.lisp .
; For example, 'nn-human?' only checks for a couple of dozen names and
; terms in the initial test set (Noah family pics).
;
; Also some of the preds are from
;    u/schubert/lf*/logical-form-predicates.lisp,
; so this is presumed to have been loaded also (./load-all.lisp
; does this).

(defparameter *repair-rules-for-input-sentences*
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; These rules are applied in 'fast-forward' mode.
;
; They are intended to change the input character string destined for
; the parser so as to increase the likelihood of a successful parse.
; For example, hyphenation of common phrases such as
;   "basketball coach" --> "basketball-coach"
; is likely to prevent break-up of the phrase (e.g., with "coach" as
; a verb); as another example, punctuating unpunctuated acronyms such 
; as "MVP" --> "M.V.P." will prevent parsing of the expression as some
; inappropriate category, such as verb.
;
; However, note that the rules are not applied to (sentential) strings,
; but rather to simply tokenized strings, where alphanumeric character
; sequences are chunked together, and other characters (inluding blanks)
; have been made into single-character symbols. E.g., "basketball coach"
; would actually look like |basketball| | | |coach|. These are changed
; back to a string after "repairs" have been made.

'(
  ; some complex nominal hyphenations; a  better approach might be to use
  ; predicates like 'common-sport?'; many other rules may yet be added.
  (/ (_*1 (!1 |basketball| BASKETBALL |Basketball| |baseball| BASEBALL
              |Baseball| |football| FOOTBALL |Football| |hockey|
              |soccer| SOCCER |Soccer| HOCKEY |Hockey| |tennis| TENNIS 
              |Tennis| |lacrosse| LACROSSE |Lacrosse| |gymnastics| 
              GYMNASTICS |Gymnastics| |waterpolo| WATERPOLO |Waterpolo|
              |swim| SWIM |Swim| |diving| DIVING |Diving|)  
          (+ | |) (!2 |coach| COACH |fan| FAN) _*2)
                  ; we could add "team", "game", "score", etc., but these
                  ; seem less likely to be misparsed.
     (_*1 !1 |-| !2 _*2))
  ; acronym punctuation-introduction:
  (/ (_* (! likely-unpunctuated-acronym?) _*1) 
     (_* (punctuate-acronym! !) _*1))

  ; Maybe some rules for removing bracketed material (which tends to
  ; throw off the Charniak parser)?
  ; Change "(left)" to "is on the left," "(right)" to "is on the right,",
  ; etc.
  (/ (_* |(| (! |left| |right|) |)| _*1) 
     (_* |on| | | |the| | | ! |,| _*1))
  (/ (_* |(| (! |middle| |center|) |)| _*1)
     (_* |in| | | |the| | | ! |,| _*1))
  )
 )

(defparameter *repair-rules-for-charniak-parse*
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; this is intended for direct repair of Charniak parses, before
; refinement by LKS's routines; sketchy start only.
;
; These rules are applied in 'slow-forward' mode (at all depths).
 '(

; *** MAINTAIN A LIST HERE OF ERRONEOUS PARSES FOR WHICH WE STILL NEED
; REPAIR RULES:
;
; "I know the places you go to"
; (S1 (S (S (NP (PRP I)) (VP (VBP KNOW) (NP (DT THE) (NNS PLACES))))
;        (NP (PRP YOU)) (VP (VBP GO) (PP (TO TO)))))
;
; "The town he walked to was deserted"
; [Totally crazy ... but using "into" instead of "to" gives OK result;
; I should look for systematic errors involving (TO TO)...]
; (S1 (S (NP (DT THE) (NN TOWN)) (NP (PRP HE))
;        (VP (VBD WALKED)
;       (S (VP (TO TO) (VP (AUX WAS) (VP (VBN DESERTED))))))))
;
; "The town that he walked to was deserted"
; [Note the horrible "to was deserted" phrase at the end, as above]
; (S1 (NP (DT THE) (NN TOWN)
;         (SBAR (IN THAT)
;            (S (NP (PRP HE))
;               (VP (VBD WALKED)
;                   (S (VP (TO TO) (VP (AUX WAS) (VP (VBN DESERTED))))))))))
;
; "How intelligent is he?"; we should get an initial WHADJP, not WHNP;
; (S1 (SBARQ (WHNP (WRB HOW) (JJ INTELLIGENT)) (SQ (AUX IS) (NP (PRP HE)))
;            (. ?)))
;
; "How fast is she?"; We should get an initial WHADJP, for predicative SQ;
; (S1 (SBARQ (WHADVP (WRB HOW) (RB FAST)) (SQ (AUX IS) (NP (PRP SHE)))
;            (. ?)))
;
; "How many more popular books will you write?"; here "how many more" should
; be a comparative ADJP, of form [[how many] more], i.e., WHADVP + JJR
; (S1 (SBARQ
;      (WHNP (WHADJP (WRB HOW) (JJ MANY)) (ADJP (RBR MORE) (JJ POPULAR))
;            (NNS BOOKS))
;      (SQ (MD WILL) (NP (PRP YOU)) (VP (VB WRITE))) (. ?)))
;
; "How much more expensive is it"; here "how much" should be and ADVP[wh]
; modifying ADJ1[-er], "more expensive"; certainly no initial NP!
; (S1 (SBARQ
;        (WHADVP (WRB HOW)
;                (NP (NP (JJ MUCH)) (ADJP (RBR MORE) (JJ EXPENSIVE))))
;        (SQ (AUX IS) (NP (PRP IT))) (. ?)))
;
; "The DOW dropped so severely as to turn away investors"; the ADVP and SBAR
; need to be turned into a single phrase;
; (S1 (S (NP (DT THE) (NNP DOW))
;        (VP (VBD DROPPED) 
;            (ADVP (RB SO) (RB SEVERELY))
;            (SBAR (IN AS) (S (VP (TO TO)
;                                 (VP (VB TURN) (PRT (RP AWAY)) 
;                                     (NP (NNS INVESTORS)))))))))
;
; "I'll give it back to Mary tomorrow morning"; gives NP "Mary tomorrow morning";
; See the 'truncate-np-if-implausible' function in "add-traces.lisp" for a relevant
; (but quite specific) rules, using 'temporal-noun?';
; (S1
;  (S (NP (PRP I))
;    (VP (MD 'LL)
;       (VP (VB RETURN) (NP (PRP IT))
;           (PP (TO TO) (NP (NNP MARY) (NN TOMORROW) (NN MORNING)))))))
;
; "There is so much I still want to do and see" (Stephen Hawking)
; Here "so much" should be an NP followed by a relative clause
; (S1 (S (NP (EX THERE))
;        (VP (BEZ IS)
;         (SBAR (RB SO) (RB MUCH)
;          (S (NP (PRP I)) (ADVP (RB STILL))
;           (VP (VP (VBP WANT) (VP-INF (TO TO) (VP (AUX DO)))) (CC AND)
;            (VP (VBP SEE))))))))
;        ----------------------------------------

; VP --> V NP ADJP|NP[pred] MISPARSED AS VP --> V S:
; For a sentential verb object where that "sentence" consists of
; an NP and an ADJP or another NP, make the "subject" of the sentence
; an object of the verb, and the ADJP or NP another complements.
; E.g., "I consider him very talented" yields a parse with verb object
;       (S (NP (PRP HIM)) (ADJP (RB VERY) (JJ TALENTED))), where we 
;       should just discard the (S ...) wrapper. 
; E.g., "The injury rendered him a vegetable" yields a parse with verb 
;       object (S (NP (PRP HIM)) (NP (DT A) (NN VEGETABLE))), where
;       we should again discard the (S ...) wrapper. (In other cases,
;       such as "His courageous action made him a hero", a correct
;       NP NP complement structure is obtained; but note the ambiguity
;       here -- compare with "made him a sandwich"!
   (/ (VP ((! verb-cat?) _!) (S (!np (NP _+)) (!ap (ADJP _+))))
      (VP (! _!) !np !ap) )
   (/ (VP ((! verb-cat?) _!) (S (!np (NP _+)) (!np2 (NP _+))))
      (VP (! _!) !np !np2) )

; VP COMPLEMENT MISPARSED AS SUBJECTLESS SENTENCE:
; e.g., (VP (VBD ASKED) (NP (NNP BILL)) (S (VP (TO TO) (VP (VB LEAVE)))))
; Remove the S-wrapper:
   (/ (VP ((! verb-cat?) _!) _* (S (!vp (VP (TO to) (VP _+1)))))
      (VP (! _!) _* !vp))

; HEAD-VP OF SENTENCE (I.E., SENTENTIAL PREDICATE) WRONGLY ATTACHED INTO S-REL;
; e.g., "The parcel that you expected has arrived" is parsed as an NP, where
; "has arrived" is made part of a rel-clause that follows an NN(S), i.e., 
; an SBAR is formed whose VP is "expected has arrived" (with "has arrived" 
; cast as another SBAR); note that such VPs exist, e.g., "The parcel you 
; thought had arrived" -- but this is unlikely to be right if we end up with 
; a "sentence" lacking a VP. NOTE: This is a case where an S1 consisting of
; just an NP is formed -- where normally we would simply interpret the input
; as we would the NP alone. The rule has been tested.
   (/ (S1 (NP _* ((! NN NNS) _+) 
             ((!1 S-REL SBAR) (!2 (IN THAT) (WHNP _+1)) 
              (S (NP _+2) _*1 (VP ((!3 verb-cat?) _!) (SBAR (S (VP _+3))))))))
      (S1 (S (NP (NP _* (! _+))
                 (S-REL !2 (S (NP _+2) _*1 (VP (!3 _!))))) (VP _+3))))
                                  ;NB ^^^^^^^^^^ a VP still needing an NP gap

; SECOND PP OF 2 PP ADJUNCTS WRONGLY INCORPORATED INTO THE 1ST PP:
; This is especially egregious if the first PP ends in a name:
; E.g., (VP (VBD GAVE) (NP (JJ REGULAR) (NNS REPORTS)) 
;           (PP (TO TO) (NP (NNP MARY) (IN ABOUT) (DT THAT) (JJ FAVORITE) (NN BAND))))
;       becomes 
;       (VP (VBD GAVE) (NP (JJ REGULAR) (NNS REPORTS))
;           (PP (TO TO) (NP (NNP MARY))) 
;           (PP (IN ABOUT) (NP (DT THAT) (JJ FAVORITE) (NN BAND))))
   (/ ((! VP NP ADJP) _+ (PP _+1 (NP _* ((!1 NNP NNPS PRP) _!) (IN _!1) _*1
       ((!2 DT CD PRP PRP$ QP DJP NN NNS NNP NNPS) _!2) _*2)) _*3); check for NP
      (! _+ (PP _+1 (NP _* (!1 _!))) (PP (IN _!1) (NP _*1 (!2 _!2) _*2)) _*3))
; If the first PP does not end in a name, at least form a subsumed PP out of
; the pieces of the second PP (it may get "lifted" out by later rules):
   (/ ((! VP NP ADJP) _+ (PP _+1 (NP _* ((!1 NN NNS)  _!) (IN _!1) _*1
       ((!2 DT CD PRP PRP$ QP DJP NN NNS NNP NNPS) _!2) _*2)) _*3)
      (! _+ (PP _+1 (NP _* (!1 _!)) (PP (IN _!1) (NP _*1 (!2 _!2) _*2))) _*3))

; FRAGMENTED CONJUNCTION:
; For a sentence containing coordinated S's plus free-floating premodifiers
; collect the coordinated S's into a single conjunction
   (/ (S (+pre PP-TREE? (ADVP _+)) (?1 (|,| |,|))
         (+ss (<> (S _+) (? (|,| |,|)))) (CC _!) (!s (S _+)) (?2 punc-tree?))
      (S +pre ?1 (S +ss (CC _!) !s) ?2))

; MAIN VERB 'HAVE' MISCLASSIFIED AS AUX:
; Replace AUX as POS for "have" as main verb by appropriate VB forms
; (**However, we should use a more general method, conditioned on already
; having looked for an occurrence of (AUX has/have/had) followed by an NP,
; but making sure this doesn't trigger for questions "Have you eaten?",
; whereas it should trigger for imperatives, "Have a sandwich!")
   (/ (S (?pre PP-TREE? (ADVP _+)) (?1 (|,| |,|))
         (!np (NP _+)) (?adv (ADVP _+)) (VP (AUX has) (!np2 (NP _+)) _*) _*1)
      (S ?pre ?1 !np ?adv (VP (VBZ has) !np2 _*) _*1))
   (/ (S (?pre PP-TREE? (ADVP _+)) (?1 (|,| |,|))
         (!np (NP _+)) (?adv (ADVP _+)) (VP (AUX have) (!np2 (NP _+)) _*) _*1)
      (S ?pre ?1 !np ?adv (VP (VBP have) !np2 _*) _*1))
   (/ (S (?pre PP-TREE? (ADVP _+)) (?1 (|,| |,|))
         (!np (NP _+)) (?adv (ADVP _+)) (VP (AUX had) (!np2 (NP _+)) _*) _*1)
      (S ?pre ?1 !np ?adv (VP (VBD had) !np2 _*) _*1))

; NP COORDINATION MISPARSED AS NNP COORDINATION:
; Insert missing NP symbols in coordination of (up to 3) complex names;
; e.g., Uncle Moshe and Grandma Lillian;
; e.g., Uncle Moshe, Grandma Lillian and Aunt Ruth;
   (/ (NP (+a (NNP _+)) (CC _!) (+b (NNP _+)))
      (NP (NP +a) (CC _!) (NP +b)))
   (/ (NP (+a (NNP _+)) (?1 (|,| |,|)) (+b (NNP _+)) (?2 (|,| |,|))
          (CC _!) (+c (NNP _+)))
      (NP (NP +a) ?1 (NP +b) ?2 (CC _!) (NP +c)))

; NP COORDINATION MISPARSED AS NN COORDINATION:
; Insert missing NP symbols in coordination of (up to 3) NNs;
; e.g., companionship or amusement;
; e.g., companionship, protection, and amusement;
   (/ (NP (!1 ((! NN NNS) _+)) (CC _!) (!2 ((! NN NNS) _+)))
      (NP (NP !1) (CC _!) (NP !2)))
   (/ (NP (!1 ((! NN NNS) _+)) (?1 (|,| |,|)) (!2 ((! NN NNS) _+))
          (?2 (|,| |,|)) (CC _!) (!3 ((! NN NNS) _+)))
      (NP (NP !1) ?1 (NP !2) ?2 (CC _!) (NP !3)))

; NP WITH FINAL PUNCTUATION CONSTITUENT:
; Discard punctuation terminating an NP; (such punctuation causes
; problems with subsequent repairs):
   (/ (NP _+ (! (|,| |,|) (|:| |;|) (\. \.) (\. [!])))
      (NP _+))

; NUMERIC YEAR MISCLASSIFIED AS CD:
; Change a year designator like (NP (CD 2009)) to, e.g., (NP (NNP 2009))
; N.B. 'likely-year?' is defined in "~schubert/lf-from-treebank-trees/
; initialize-and-preprocess.lisp".
   (/ (NP (CD (! likely-year?))) (NP (NNP !))) 

; INAPPRORIATELY NESTED NP COORDINATION:
; Flatten nested NP coordination structures; e.g., an NP seemingly
; consisting of an NP, a comma, and a 3-way coordinated NP,
;   (NP (NP ...) , (NP (NP ...) , (NP ...) and (NP ..)))
; is flattened to a 4-way coordination
;   (NP (NP ...) , (NP ...) , (NP ...) and (NP ..))
; ** There's a similar rule for repairing a refined parse, where we also
;    allow for extra material postmodifying the coordinated NP. Should
;    they becombined?
   (/ (NP (NP _+1) (?1 (|,| |,|)) (NP (NP _+2) (?2 (|,| |,|)) (NP _+3)
                                   (?3 (|,| |,|)) (CC _!) (NP _+4)))
      (NP (NP _+1) ?1 (NP _+2) ?2 (NP _+3) ?3 (CC _!) (NP _+4)))

; NUMERAL ADJECTIVE (AFTER DT) MISCLASSIFIED AS CD:
; Change CD preceded by DT (and possibly one other word, e.g., "first") 
; to JJ; similarly for a genitive
   (/ (NP (DT _!1) _?ord (CD _!2) _*)
      (NP (DT _!1) _?ord (JJ _!2) _*))
   (/ (NP (NP _+ (POS |'S|)) _?ord (CD _!2) _*)
      (NP (NP _+ (POS |'S|)) _?ord (JJ _!2) _*))

; TENSED 'BE'-VERB UNHELPFULLY CLASSIFIED AS UNTENSED 'AUX':
   (/ (AUX is) (AUXZ is))
   (/ (AUX are) (AUXP are))
   (/ (AUX am) (AUXZ am))
   (/ (AUX been) (AUXEN been))
   (/ (AUX has) (AUXZ has))
   (/ (AUX was) (AUXD was))
   (/ (AUX were) (AUXD were))

; ???
; Change (AUX IS) to become (BEZ is) when *not* followed by a VP
; (possibly with an adverbial before the VP); similarly for (AUX ARE),
; which becomes (AUXP are), etc. ***I seem to have decided against trying
; to distinguish copular from auxiliary 'be', at least at this point.

; 'GRANDMA', 'DAD', ETC. NOT RECOGNIZED AS HAVING PREDICATIVE CONTENT:
; Change "Grandma(s)", "Grandpa(s)", and a few other capitalized
; family member terms to "grandmother(s)", "grandfather(s), etc.
; Are there other status indicators used, and parsed, as names?
   (/ (NNP Grandma) (NN grandmother))
   (/ ((! NNP NNPS) Grandmas) (NNS grandmothers))
   (/ (NNP Grandpa) (NN grandfather))
   (/ ((! NNP NNPS) Grandpas) (NNS grandfathers))
   (/ (NNP Granddad) (NN grandfather))
   (/ ((! NNP NNPS) Granddads) (NNS grandfathers))
   (/ (NNP Dad) (NN father))
   (/ (NNP Mom) (NN mother))
   (/ (NNP Sis) (NN sister))
   (/ (NNP Bro) (NN brother))
   
  )
 ) 


(defparameter *repair-rules-for-refined-charniak-parse*
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Many rules are from Adam Purtee's "caption-repairs.lisp" file
; (who adopted/adapted them from LKS)
;
; These rules are applied in 'slow-forward' mode (at all depths).
; ----------------------------------------------------

; *** MAINTAIN A LIST HERE OF ERRONEOUS STRUCTURES FOR WHICH WE STILL
;     NEED REPAIR RULES:
;
; "I don't know what house he is hiding in";      prep'n misparsed as RP
; "I don't know what he is sitting on";               ----- " -----
; "I removed the log people were tripping over";      ----- " -----
; (However, "I don't know what he is waiting for" is parsed correctly)
; (S1 (S (NP (PRP I))
;      (VP (AUX DO) (RB |N'T|)
;       (VP (VB KNOW)
;           (SBAR (WHNP (WP WHAT) (NN HOUSE))
;            (S (NP (PRP HE))
;               (VP (AUX IS) (VP (VBG HIDING) (PRT (RP IN)) (NP -t-)))))))))
; I've inserted the trace that 'add-traces' should insert -- but the
; (PRT (RP IN)) (NP -t-) sequence should be (PP (IN in) (NP -t-)) instead.
; Note that the Wiktionary verb lists include particles; so for example
; the intransitive list includes "blend in" but not "hide in", so this
; can be used in the repair rule.
;
; -----------------------------------------------------

'(

; Change an NP-TIME occurring as a right sister of an NP or PP to a PP-TIME
(_* ((! NP pp-cat?) _+) (? (|,| |,|)) (/ (NP-TIME _+1) 
                                     (PP-IN-TIME (IN IN) (NP-TIME _+1))) _*) 

; "Raise" locative PP postmodifying a final NP conjunct so that it becomes
; a sister of the entire conjunction; as such it might lead to an S1 of
; type NP + Comma- + PP, or to a VP of type V + NP + Comma- + PP. 
; Possibly we should instead make the detached PP part of the conjunctive
; NP (adding another NP-level), rather than its sibling ...
(/ (_* (NP (+ (<> (NP _+1) (? (|,| |,|)))) 
           (CC and) (NP (NP _+2) (? (|,| |,|)) 
                                 (! (pp-cat? loc-p-tree? _+3)))) _*1) 
   (_* (NP + (CC and) (NP _+2)) ! _*1))
;  maybe last line should be (_+ (NP (NP + (CC and) (NP _+2)) !) _*))

; For a PP whose NP is postmodified by another PP (other than a PP[about|
; against|by|for|from|into|of|off|onto|out-of|over|through|to), separate 
; off that other PP (which probably postmodifies the same phrase head as 
; the first PP)
(/ (_* ((!1 pp-cat?) (IN _!) 
        (NP (NP _+1) (!2 ((!3 pp-cat? ~ postmodifying-pp-cat?) _+2)))) _*1) 
   (_* (!1 (IN _!) (NP _+1)) !2 _*1))

; For an NP consisting of a simple NP, comma, and a complex conjunctive NP 
; with postmodifiers, "drop" the initial simple NP into the conjunctive
; NP (as the first conjunct):
(/ (NP (NP _+) (|,| |,|) (NP (NP (+ (<> (NP _+1) (? (|,| |,|)))) (CC _!) _+2) _+3))
   (NP (NP (NP _+) (|,| |,|) + (CC _!) _+2) _+3))

; For a fragment consisting of an NP and a PP (possibly with a separating
; comma), attach the PP to the NP
(/ (FRAG (NP _+) (? (|,| |,|)) (! PP-TREE?) _*) ; NB: 'PP-TREE?' means prep.PHRASE
   (FRAG (NP (NP _+) ? !) _*))

; For a PP whose NP is a conjunction of a simple nonhuman NP with a complex 
; human NP, with a comma between them, separate off the coordinator and human
; NP (thus yielding a PP with a nonhuman NP, followed by a comma, followed by
; by a (complex) human NP, presumably belonging to a larger NP-conjunction) 
(/ (_+ ((!1 PP-CAT?) (IN _!) (NP (NP _* (!2 nn-nonhuman?)) (|,| |,|) (CC and) 
                        (NP (NP _*1 (!3 nn-human?)) _+1))) _*2) 
   (_+ (!1 (IN _!) (NP _* !2)) (|,| |,|) (CC and) 
                               (NP (NP _*1 !3) _+1) _*2))

; Same as the previous rule, with "human" and "nonhuman" interchanged 
(/ (_+ ((!1 PP-CAT?) (IN _!) (NP (NP _* (!2 nn-human?)) (|,| |,|) (CC and) 
                         (NP (NP _*1 (!3 nn-nonhuman?)) _+1))) _*2) 
   (_+ (!1 (IN _!) (NP _* !2)) (|,| |,|) (CC and) 
                               (NP (NP _*1 !3) _+1) _*2))

; Same as the second-last of the above rules, except that the human NP
; conjunct is simple
(/ (_+ ((!1 PP-CAT?) (IN _!) (NP (NP _* (!2 nn-nonhuman?)) (|,| |,|) (CC and) 
                         (NP _*1 (!3 nn-human?)) _+1)) _*2) 
   (_+ (!1 (IN _!) (NP _* !2)) (|,| |,|) (CC and) 
                               (NP _*1 !3) _+1 _*2))

; Same as the second-last of the above rules, except that the nonhuman NP
; conjunct is simple
(/ (_+ ((!1 PP-CAT?) (IN _!) (NP (NP _* (!2 nn-human?)) (|,| |,|) (CC and) 
                         (NP _*1 (!3 nn-nonhuman?)) _+1)) _*2) 
   (_+ (!1 (IN _!) (NP _* !2)) (|,| |,|) (CC and) 
                               (NP _*1 !3) _+1 _*2))

; For an NP consisting of a proper NP, possibly followed by a comma, 
; followed by a complex NP of form 
;    (NP proper-NP , proper-NP and (NP proper-NP PP) additional-material),
; form a new complex NP that coordinates the 4 proper NPs, including the
; commas and coordinator (in the original order), followed by the PP and
; additional material treated as postmodifiers of the conjunction of the
; 4 proper NPs
(/ (_+ (NP (<> (NP _* (NNP _!)) (? (|,| |,|))) 
           (NP (NP (<>1 (NP _* (NNP _!)) (|,| |,|) (NP _* (NNP _!)) (CC AND)) 
                   (NP (! (NP _* (NNP _!))) PP-TREE?)) _+1) _+2)) 
   (_+ (NP (NP <> <>1 !) PP-TREE? _+1 _+2)))

; For a sequence of coordinated NPs (possibly with commas), with a
; coordinator between the last two NPs, followed by other material,
; join the coordinated NPs into a single larger NP, so that the additional
; material will now comprise one or more siblings of the new, large NP
(/ (_+ (+ (<> (NP _+1) (? (|,| |,|)))) (CC (! and or)) (NP _+2) 
       (?1 (|,| |,|)) _+3)
   (_+ (NP + (CC !) (NP _+2)) ?1 _+3))

; For an NP comprised of a "flat" sequence of type NP , PP , (CC ...) NP ...)
; (where the first comma is optional), join the PP to the initial NP
; constituent. (This type of structure can be obtained after some initial
; repairs that don't quite finish the required rearrangement of a
; complex NP containing one or more PPs; see the 'sisters' caption.)
(/ (NP (NP _+1) (? (|,| |,|)) (! (PP-CAT? _+2)) (|,| |,|) (CC _+3) (NP _+4) _*5)
   (NP (NP (NP _+1) ? !) (|,| |,|) (CC _+3) (NP _+4) _*5))

; For an adjective phrase with a PP postmodifier (possibly with an added
; comma), possibly followed by further material, break away the PP (and
; possible comma) from the adjective phrase, so that these parts are now
; at the same structural level as the adjective phrase and any further
; material; ** however, we don't do it for prepositions {of, about, from}
; -- a very tentative list (common ADJ-complementing prepositions)
(/ (_+ (ADJP _+1 (<> ((! PP-CAT? ~ PP-OF PP-ABOUT PP-FROM) _+2) 
                     (? (|,| |,|)))) _*) 
   (_+ (ADJP _+1) <> _*))

; For a PP consisting of "with" and a sentence starting with an NP and
; a VP, combine the "with" and NP into a (nonclausal) PP, followed by
; the VP and any additional material. [Note: this can certainly introduce
; errors in phrases like "Mary lecturing, with John listening intently";
; it might be a good idea to ensure that "with" isn't preceded by a comma.]
(/ (_* (PP-WITH (IN with) (S (NP _+) (VP _+1) _*1)) _*2) 
   (_* (PP-WITH (IN with) (NP _+)) (VP _+1) _*1 _*2))

; For a PP whose NP is a proper NP postmodified by another PP, detach
; the second PP from the proper NP, so that we are left with two successive
; PPs (and extra material before and possibly after)
(/ (_+ ((! PP-CAT?) (IN _!) (NP (NP _* ((!1 NNP  NNPS) _+1)) 
                                ((!2 PP-CAT?) _+2))) _*1) 
   (_+ (! (IN _!) (NP _* (!1 _+1))) (!2 _+2) _*1))

; For a VP in present progressive form (VP (<aux> <be>) ... (VP (VBG|AUXG ...) ...))
; change <aux> to PRG, PRGZ, PRGP, PRGD, as appropriate:
(/ (VP (! aux-be?) (? ~ (VP _!) (verb-cat? _!) (NP _!)) 
       (VP ((!1 VBG AUXG) _!1) _*))
   (VP (change-to-prog-be-form! !) ? (VP (!1 _!1) _*))) 

; For a VP whose main verb type is (copular) "be" and that
; contains an ADJP or ADVP with an initial "not", "n't", or
; "never", make that negation into a separate ADVP preceding
; the rest of the ADJP or existing ADVP (which is apt to be
; changed to an ADJP next)
(/ (VP ((! BE BEZ BED BEG BEEN BEP) _!) 
       ((!1 ADVP ADJP) (_!1 (!2 not n\'t never)) _+))
   (VP (! _!) (ADVP (RB !2)) (!1 _+)))

; For a VP whose main verb type is (copular) "be" and that
; contains an ADVP with a final RB constituent (such as "well")
; instead of an ADJP with a final JJ/JJR/JJS constituent,
; change the ADVP to an ADJP with a JJ/JJR/JJS:
(/ (VP ((! BE BEZ BED BEG BEEN BEP) _!) (? ((!1 ADVP RB RBR RBS) _!1))
       (ADVP _* ((!2 RB RBR RBS) _!2)) (* ~ (ADJP _+) (JJ _!3)))
   (VP (! _!) ? (ADJP _* ((change-to-adj-cat! !2) _!2)) *))


 )); end of *repair-rules-for-refined-charniak-parse*

(defparameter *pronoun-resolution-rules-for-ulfs*
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; A set of TTT rules for determining the referents of anaphoric
; pronouns in a preliminary ULF (with all keywords still in place,
; but as far as possible with minimal reliance on these). The rules
; that follow handle only names or pronouns (not variables).
; The rules are tried at all depths, in slow-forward mode.
; NB: The rules are ordered so that "shallow" referents in an
;     initial part of a sentence are preferred to deep ones, for
;     resolution of pronouns later in the sentence. Also referents
;     further to the left at the same level are preferred to ones
;     further to the right -- I think, given the way matching works!
;     At the same time, we disallow coreference of co-arguments by
;     requiring the pronoun on the right to be a *proper* descendant
;     of a sibling of the earlier term. (Co-arguments require *reflexive*
;     pronouns.)
'(
  
 ; FOR THE TIME BEING, I'VE REPLACED THE RULES FOR ADDING QUASI-EQUALITIES
 ; TO A LIST OF FORMULAS WITH (RISKY) RULES FOR DIRECTLY REPLACING PRONOUNS
 ; IN A SINGLE WFF WITH NAMES; (THAT WON'T WORK FOR ANTECEDENTS OTHER 
 ; THAN NAMES & PRONOUNS!)
 
 ; nonreflexive anaphoric pronoun must be deeper than its subject referent:
 (_* (!1 male-name-or-pron?) predk? _* (^* (^ (/ male-pron? !1))) _*)
 (_* (!1 male-name-or-pron?) (:p _* (^* (^ (/ male-pron? !1))) _*))
 (_* (!1 male-name-or-pron?) (:o _* (:p _* (^* (^ (/ male-pron? !1))) _*) _*))
 ; embedding of anaphor by 2 occurrences of ":q" or ":i" on a downward 
 ; path (to the right of the referent) generally assures accessibility:
 (_* (!1 male-name-or-pron?) _* (^* ((! :q :i) _* (^* ((! :q :i) _*
                                      (^* (/ male-pron? !1)) _*)) _*)) _*)
 ; nonreflexive anaphoric pronoun can refer to an embedded name:
 (_* (^* (^ (!1 male-name?))) _* (^* (/ male-pron? !1)) _*)
 
 ; The remaining groups of rules are analogous to the above:
 ;
 (_* (!1 female-name-or-pron?) predk? _* (^* (^ (/ female-pron? !1))) _*)
 (_* (!1 female-name-or-pron?) (:p _* (^* (^ (/ female-pron? !1))) _*))
 (_* (!1 female-name-or-pron?) (:o _* (:p _* (^* (^ (/ female-pron? !1))) _*) _*))
 (_* (!1 female-name-or-pron?) _* (^* ((! :q :i) _* (^* ((! :q :i) _*
                                      (^* (/ female-pron? !1)) _*)) _*)) _*)
 (_* (^* (^ (!1 female-name?))) _* (^* (/ female-pron? !1)) _*)

 (_* (!1 neuter-name-or-pron?) predk? _* (^* (^ (/ neuter-pron? !1))) _*)
 (_* (!1 neuter-name-or-pron?) (:p _* (^* (^ (/ neuter-pron? !1))) _*))
 (_* (!1 neuter-name-or-pron?) (:o _* (:p _* (^* (^ (/ neuter-pron? !1))) _*) _*))
 (_* (!1 neuter-name-or-pron?) _* (^* ((! :q :i) _* (^* ((! :q :i) _*
                                      (^* (/ neuter-pron? !1)) _*)) _*)) _*)
 (_* (^* (^ (!1 neuter-name?))) _* (^* (/ neuter-pron? !1)) _*)

 (_* (!1 plur-name-or-pron?) predk? _* (^* (^ (/ plur-pron? !1))) _*)
 (_* (!1 plur-name-or-pron?) (:p _* (^* (^ (/ plur-pron? !1))) _*))
 (_* (!1 plur-name-or-pron?) (:o _* (:p _* (^* (^ (/ plur-pron? !1))) _*) _*))
 (_* (!1 plur-name-or-pron?) _* (^* ((! :q :i) _* (^* ((! :q :i) _*
                                      (^* (/ plur-pron? !1)) _*)) _*)) _*)
 (_* (^* (^ (!1 plur-name?))) _* (^* (/ plur-pron? !1)) _*)

 (_* (!1 unknown-gender-name?) predk? _* (^* (^ (/ sing-pron? !1))) _*)
 (_* (!1 unknown-gender-name?) (:p _* (^* (^ (/ sing-pron? !1))) _*))
 (_* (!1 unknown-gender-name?) (:o _* (:p _* (^* (^ (/ sing-pron? !1))) _*) _*))
 (_* (!1 unknown-gender-name?) _* (^* ((! :q :i) _* (^* ((! :q :i) _*
                                      (^* (/ sing-pron? !1)) _*)) _*)) _*)
 (_* (^* (^ (!1 unknown-gender-name?))) _* (^* (/ sing-pron? !1)) _*)

 ; THESE ARE THE RULES FOR ADDING QUASI-EQUATIONS:
 ; ; In a wff that has a name or pronoun as subject or as immediate 
 ; ; constituent of the subject, and is followed by phrases containing
 ; ; a pronoun, the pronoun may be anaphoric to the name in the subject.
 ; (/ (_* (! ((? :i :a) (!1 male-name-or-pron?) (*2 ~ maybe=)
 ;                         (^* (!2 male-pron?)) _*3)) _*4)
 ;    ((_* ! _*4) and (!2 maybe= !1)))
 ; (/ (_* (! ((? :a :i) (_*1 (!1 male-name-or-pron?) (*2 ~ maybe=)
 ;                         (^* (!2 male-pron?)) _*3) _*4)) _*5)
 ;    ((_* ! _*5 (!2 maybe= !1))))
 ;    ; N.B.: The guarding against 'maybe=' equations is designed to 
 ;    ; prevent introduction of further equations to relate the earlier 
 ;    ; name to the pronoun in the 'maybe='-equation!
 ; ; Similarly for female names; also allow indeterminate names;
 ; ; also neuters and plurals ...
 ; (/ (_* (! ((? :i :a) (!1 female-name-or-pron?) (*2 ~ maybe=)
 ;                         (^* (!2 female-pron?)) _*3)) _*4)
 ;    ((_* ! _*4) and (!2 maybe= !1)))
 ; (/ (_* (! ((? :a :i) (_*1 (!1 female-name-or-pron?) (*2 ~ maybe=)
 ;                         (^* (!2 female-pron?)) _*3) _*4)) _*5)
 ;    ((_* ! _*5 (!2 maybe= !1))))
 ; (/ (_* (! ((? :i :a) (!1 neuter-name-or-pron?) (*2 ~ maybe=)
 ;                         (^* (!2 neuter-pron?)) _*3)) _*4)
 ;    ((_* ! _*4) and (!2 maybe= !1)))
 ; (/ (_* (! ((? :a :i) (_*1 (!1 neuter-name-or-pron?) (*2 ~ maybe=)
 ;                         (^* (!2 neuter-pron?)) _*3) _*4)) _*5)
 ;    ((_* ! _*5 (!2 maybe= !1))))
 ; (/ (_* (! ((? :i :a) (!1 plur-name-or-pron?) (*2 ~ maybe=)
 ;                         (^* (!2 plur-pron?)) _*3)) _*4)
 ;    ((_* ! _*4) and (!2 maybe= !1)))
 ; (/ (_* (! ((? :a :i) (_*1 (!1 plur-name-or-pron?) (*2 ~ maybe=)
 ;                         (^* (!2 plur-pron?)) _*3) _*4)) _*5)
 ;    ((_* ! _*5 (!2 maybe= !1))))
 ; (/ (_* (! ((? :i :a) (!1 unknown-gender-name?) (*2 ~ maybe=)
 ;                         (^* (!2 sing-pron?)) _*3)) _*4)
 ;    ((_* ! _*4) and (!2 maybe= !1)))
 ; (/ (_* (! ((? :a :i) (_*1 (!1 unknown-gender-name?) (*2 ~ maybe=)
 ;                         (^* (!2 sing-pron?)) _*3) _*4)) _*5)
 ;    ((_* ! _*5 (!2 maybe= !1))))
  
 ))

(defparameter *{augmented-}predicate-np-incorporation-rules-for-ulf*
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; To be applied prior to less context-dependent augmentation
; incorporation rules.
'(
 ; Change "being identical with a P" to "being P"; i.e. change
 ;   (:p be.v (:l x (:i x = (:q a.det pred)))) 
 ; to
 ;   (:p be.v pred)
 (/ ((!1 :p :f) (!2 be.v (:o _!tense be.v))
     (:l _!.x 
      (:i _!.x = 
       (:q (!3 a.det a.dt a.d a{n} a{n}.det a{n}.dt a{n}.d) _!pred))))
    (!1 !2 _!pred))
 ; Augmentation of an indefinite NP that appeared as complement of
 ; copular "be"; e.g., in ULF this might be 
 ;   (:p be.v (:l x (:i x = (:a (:q a.det pred1) pred2))))
 ; and this needs to become
 ;   (:p be.v (:l x (:i (:i x pred1) and (:i x pred2)))).
 ; We also need to allow for both orderings of the equality:
 (/ ((!1 :p :f) (!2 be.v (:o _!tense be.v)) 
     (:l _!.x 
      (:i _!.x = 
       (:a (:q (!3 a.det a.dt a.d a{n} a{n}.det a{n}.dt a{n}.d) _!pred1)
           _!pred2))))
    (!1 !2 (:l _!.x (:i (:i _!.x _!pred1) and (:i _!.x _!pred2)))))
 (/ ((!1 :p :f) (!2 be.v (:o _!tense be.v)) 
     (:l _!.x 
      (:i (:a (:q (!3 a.det a.dt a.d a{n} a{n}.det a{n}.dt a{n}.d) _!pred1)
           _!pred2) = _!.x)))
    (!1 !2 (:l _!.x (:i (:i _!.x _!pred1) and (:i _!.x _!pred2)))))
))

; FORMULATE RULES THAT COULD BE USED INSTEAD OF 'incorporate-augmentations'
; CURRENTLY IN ~schubert/lf*. [However, this is only a bit simpler, and
; probably less efficient than the ~schubert/lf* version.]
;
(defparameter *augmentation-incorporation-rules-for-ulf*
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; NB: THE CURRENT CAPTION PROCESSING PROGRAM DOESN'T ACCESS THESE
;     RULES, INSTEAD IT APPLIES 'incorporate-augmentations' AS DEFINED
;     IN schubert/lf-from-treebank-trees/logical-form-predicates.lisp
; To be applied to all (:a term pred) expressions embedded in 
; a predication (but first we check for embedding of an indefinite 
; augmented NP by "be")
'(
 ; Augmentation of a quantified term (2 orderings of the
 ; embedding pred and quantified term); we bring the augmentation
 ; into the scope of the quantifier, forming a conjunctive lambda 
 ; abstract:
 (/ (:a (:q _!quan _!pred1) _!pred2)
    (:q _!quan (:l x (:i (:i x _!pred1) and (:i x _!pred2)))))
 (/ (:a (:q _!quan _!pred1) _!pred2)
    (:q _!quan (:l x (:i (:i x _!pred1) and (:i x _!pred2)))))

 ; Augmentation of a non-quantified term (again, 2 orderings);
 ; we form a new quantified term restricted to being the individual
 ; denoted by the original term and having the property denoted by
 ; the augmenting predicate:
 (/ (:a (!term ~ (:q _*)) _!pred)
    (:q some (:l x (:i (:i x = !term) and (:i x _!pred)))))
 (/ (:a (!term ~ (:q _*)) _!pred)
    (:q some (:l x (:i (:i x = !term) and (:i x _!pred)))))
 ))   

(defparameter *repair-rules-for-reduced-lf*
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'(
 ; Contract conjunctions of form (with 'relnom' a relational nominal) 
 ;     ((term1 relnom) and (term1 pertain-to term2))
 ; to  (term1 relnom-of term2); e.g., "x is a friend.n pertaining to
 ; so-and so" becomes "a friend-of.n so-and-so";
 (/ ((_!. (! relnom?)) (!1 and and.cc) (_!. pertain-to _!))
    ((_!. ! ) and (_!. (append-of! !) _!))) ; might add the reverse ordering ...

 ; Standardize names of quantifiers to be free of extensions, as
 ; expected by epi2; (only these are recognized by epi2 currently):
 (/ (! forall all.det all.dt all.d every.det every.dt every.d) all)
 (/ (! no.det no.dt no.d) no)
 (/ (! exists exist some.det some.dt some.d) some)
 (/ (! many.det many.dt many.d) many)
 (/ (! most.det most.dt most.d) most)
 (/ (! few.det few.dt few.d) few)
 (/ (! a-few.det a-few.dt a-few.d) a-few)
 (/ (! the.det the.dt the.d) the)
    
 ; What else? 

 ));end of *repair-rules-for-reduced-lf*


(defparameter *deep-lf-transformation-rules*
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; These rules transform some VP LFs, e.g., "see Kim on a swing"
; effectively becomes "see Kim and that Kim is on a swing";
; they also expand the scope of indefinite quantifiers out of 
; directly embedding '*', '**', and '@' contexts, and definites 
; out of those contexts as well as speech act and nominalization 
; contexts (e.g., 'that', K, Ke, Ka, or 'qnom' nominalization)
;
'(
 ; Transform VP LFs for transitive verbs of cognition with a PP
 ; LF or other predicate following the object term so that what
 ; the agent cognizes is an episode characterized by the pred
 ; applied to the object term; e.g., 
 ;   (I.pro see.v x (:p in.p tree1.sk)) -->
 ;   ((I.pro see.v x) and (I.pro see.v (that (x in.p tree1.sk))))
 (/ (_!subj (!v cognition-pred2?) _!obj (!pred pred?) _*)
    ((_!subj !v _!obj _*) and (_!subj !v (that (_!obj !pred)) _*)))

 ; Change indefinite numeric determiners such as FIVE (or FIVE.DET), 
 ; MANY (or MANY.DET), or A-FEW (or A-FEW.DET) to existential
 ; quantifiers, with a conjunctive predication added. E.g.,
 ; (MANY var phi psi) becomes (some var ((var MANY.A) and phi) psi)
 (/ ((!q indefinite-num-det?) _!v _!w1 _?w2)
    (some _!v (_!w1 and (_!v (adj-from-det! !q))) _?w2))

 ; Widen scope of (in)definites over episodic operators
 (/ (((!q some some.det a.det a{n} a{n}.det exist exist.det
         exists exists.det the the.det that.det this this.det
         these these.det those those.det) 
      _!v _?r _!s) (!op [**] [*] [@]) _!ep)
    (!q _!v _?r (_!s !op _!ep)))

 ; Widen scope of definites in questions; e.g., Asking "Where is
 ; the bottle opener?" can be paraphrased as "The bottle opener --
 ; where is it?" (by contrast, "Where is a convenience store?"
 ; can't be paraphrased as #"A convenience store -- where is it?")
 (/ (ynq ((!q the the.det that.det this this.det
              these these.det those those.det) _!v _?r _!s))
    (!q _!v _?r (ynq _!s)))

 (/ (wh _!v1 _?r1 ((!q the the.det that.det this this.det
                      these these.det those those.det) _!v _?r _!s))
    (!q _!v _?r (wh _!v1 _?r1 _!s)))

 ; Widen scope of definites in the complements of speech act predicates
 ; over the speech act predications
 (/ (_!ag (!speak tell.v ask.v request.v instruct.v) _?co-ag
     ((!op that qnom whether) ((!q the the.det that.det this this.det
         these these.det those those.det) _!v _?r _!s)))
    (!q _!v _?r (_!ag !speak _?co-ag (!op _!s))))

 (/ (_!ag (!speak tell.v ask.v request.v instruct.v) _?co-ag
     (ka (:l _!x ((!q the the.det that.det this this.det
         these these.det those those.det) _!v _?r _!s))))
    (!q _!v _?r (_!ag !speak _?co-ag (ka (:l _!x _!s)))))
)); end of *deep-lf-transformation-rules*
   

(defparameter *canonicalization-rules-for-lfs*  
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; NB: These rules are applied in :shallow t, :rule-order :slow-forward)
;     mode, so as not to do embedded Skolemization, embedded conjunction 
;     splitting, etc.
; A set of TTT rules for Skolemizing and separating conjuncts of
; (reduced, repaired) lfs given as a list. The intended usage is
; to apply this initially to a singleton list containing the
; reduced LF of a sentence or phrase; this will then get expanded
; progressively to a longer list, as canonicalization rules are
; applied. NOTE THAT THE RULES ARE FORMULATED TO APPLY TO A MATCHING
; ITEM IN A LIST. This allows e.g., multiple wffs to replace a single
; wff in conjunction splitting.
;
 '(
 ; Separate conjuncts directly embedded by SAY.V, or other attitudes;
 ; we assume that we have "hidden" the episodic operators by wrapping
 ; [ ] around them. Assume the formula is one in a list of formulas.
 ;
 ; [For the time being, strip off the speech-act wrapper; assume that
 ; quantifiers have been standardized, with no extensions -LKS]
 (/ (_* (some _! _? 
     ((_! (! say.v tell.v) _? (that _!1)) (! [**] [*] [@]) _!2)) _*1)
    (_* _!1 _*1))
    
 ; [Also strip off accidental imperative speech act (for lone VPs)]
 (/ (_* (some _! _? 
     ((_! instruct.v _? (ka _!1)) (! [**] [*] [@]) _!2)) _*1)
    (_* (a-certain-entity.pro _!1) _*1))

 ; Extract definite/indefinite quantifiers from episodic-operator scopes:
 ; ** THIS RULE ASSUMES THAT THE RESTRICTOR PREDICATE IS ATEMPORAL (o/w it 
 ; shouldn't be extracted from the episodic-operator context):
 (/ (_* (((!q {in}definite-det?) _!v _!r _!s)  (!op [**] [*] [@]) _!e) _*1)
    (_* (!q _!v _!r (_!s !op _!e)) _*1))
    
 ; Skolemize an unrestricted existential (here the Skolem just extends
 ; the variable with an integer, dot, and SK).
 (/ (_* ((! indefinite-det?) _! _!1) _*1) 
    (_* (subst! (new-skolem! _!) _! _!1) _*1)) 

 ; Skolemize a restricted existential or definite; use a conjunction in order to
 ; make the same substitution in both conjuncts, but another rule breaks it up.
 ; Here the Skolem is based on the type (if any) specified in the restrictor,
 ; which will be extracted from the second (optional) argument of 'new-skolem!'
 (/ (_* ((! {in}definite-det?) _! _!1 _!2) _*1) 
    (_* (subst! (new-skolem! _!1) _! (_!1 and _!2)) _*1))
 
 ; Skolemize a restricted 'all'-phrase that contains a numerically qualified
 ; restrictor, as in "all four kids"; (we'll need to add analogous rules
 ; eventually for the LFs of phrases like "all of ...", "all John's ...").
 (/ (_* ((! all all.det all.dt all.d) _!. (!1 (_!. (numeral-pred? _!))) _!1) _*1)
    (_* (subst! (new-skolem! !1) _!. (!1 and _!1)) _*1))
 ;
 ; When there is a set-denoting Skolem constant predicated to be a small
 ; (size 2, 3, 4, 5, or 6) plural entity, replace that predication by a
 ; conjunction of individual predications about the members of the set, 
 ; where the members are represented by new Skolem constants, and
 ; replace all occurrences of the set-denoting Skolem constant by
 ; a 'set-of' construct that enumerates the members of the set.
 ; Since this involves multiple occurrences of the same (new) Skolem
 ; constants in the transformed list of formulas, we first use :temp1,
 ; :temp2, ... for the new constants, and at the end replace them by
 ; new Skolem constants. E.g., we introduce two grandmothers for 
 ;    (GRANDMOTHERS0.SK (TWO.A (PLUR GRANDMOTHER.N))),
 ; predicate each to be a GRANDMOTHER.N, and replace all occurrences
 ; of GRANDMOTHERS0.SK by (SET-OF GRANDMOTHER1.SK GRANDMOTHER2.SK)
 ; (or whatever the new Skolem constants turn out to be).
 (/ (_* ((! skolem?) (two.a (plur _!))) _*1)
    (subst! (new-skolem! (foo _!)) :temp2   ; 'foo' is arbitrary, since
     (subst! (new-skolem! (foo _!)) :temp1  ; using (plur _!) would give
                                            ; a plural-sounding Skolem,
                                            ; and using _! would assume
                                            ; _! is a variable (not a pred)
      (subst! (set-of :temp1 :temp2) ! 
              (_* ((:temp1 _!) and (:temp2 _!)) _*1)))))
 ; earlier version of the output template that doesn't yet replace
 ; occurrences of the set-denoting Skolem constant by a 'set-of'
 ; construct: 
  ; (_* (subst! (new-skolem! (foo _!)) :temp2
  ;      (subst! (new-skolem! (foo _!)) :temp1 
  ;       ((! (two.a (plur _!))) and (:temp1 _!) (:temp2 _!) 
  ;        (! = (set-of :temp1 :temp2))))) _*1))
 (/ (_* ((! skolem?) (three.a (plur _!))) _*1)
    (subst! (new-skolem! (foo _!)) :temp3 
     (subst! (new-skolem! (foo _!)) :temp2
      (subst! (new-skolem! (foo _!)) :temp1
       (subst! (set-of :temp1 :temp2 :temp3) ! 
               (_* ((:temp1 _!) and (:temp2 _!) (:temp3 _!)) _*1))))))
 (/ (_* ((! skolem?) (four.a (plur _!))) _*1)
    (subst! (new-skolem! (foo _!)) :temp4 
     (subst! (new-skolem! (foo _!)) :temp3
      (subst! (new-skolem! (foo _!)) :temp2
       (subst! (new-skolem! (foo _!)) :temp1
        (subst! (set-of :temp1 :temp2 :temp3 :temp4) ! 
                (_* ((:temp1 _!) and 
                     (:temp2 _!) (:temp3 _!) (:temp4 _!)) _*1)))))))
 (/ (_* ((! skolem?) (five.a (plur _!))) _*1)
    (subst! (new-skolem! (foo _!)) :temp5 
     (subst! (new-skolem! (foo _!)) :temp4
      (subst! (new-skolem! (foo _!)) :temp3
       (subst! (new-skolem! (foo _!)) :temp2
        (subst! (new-skolem! (foo _!)) :temp1
         (subst! (set-of :temp1 :temp2 :temp3 :temp4) ! 
                 (_* ((:temp1 _!) and (:temp2 _!) 
                      (:temp3 _!) (:temp4 _!) (:temp5 _!)) _*1))))))))
 (/ (_* ((! skolem?) (six.a (plur _!))) _*1)
    (subst! (new-skolem! (foo _!)) :temp6 
     (subst! (new-skolem! (foo _!)) :temp5
      (subst! (new-skolem! (foo _!)) :temp4
       (subst! (new-skolem! (foo _!)) :temp3
        (subst! (new-skolem! (foo _!)) :temp2
         (subst! (new-skolem! (foo _!)) :temp1
          (subst! (set-of :temp1 :temp2 :temp3 :temp4) ! 
                  (_* ((:temp1 _!) and (:temp2 _!) (:temp3 _!) 
                       (:temp4 _!) (:temp5 _!) (:temp6 _!)) _*1)))))))))

 ; Distribute locative predications over members of 'set-of' constructs
 ; (first, subject position of the set-of construct):
 (/ (_* ((set-of _!) (! loc-pred?) _!1) _*1); degenerate (recursion basis)
    (_* (_! ! _!1) _*1))
 (/ (_* ((set-of _! _+) (! loc-pred?) _!1) _*1); general case (> 1 members)
    (_* (_! ! _!1) ((set-of _+) ! _!1) _*1))
 ; object position:
 (/ (_* (_! (! loc-pred?) (set-of _!1)) _*1); degenerate (recursion basis)
    (_* (_! ! _!1) _*1))
 (/ (_* (_! (! loc-pred?) (set-of _!1 _+)) _*1); general case (> 1 members)
    (_* (_! ! _!1) (_! ! (set-of _+)) _*1))
 
 ; Separate surface conjuncts
 (/ (_* (_! (! and and.cc) _+) _*1)
    (_* _! _+ _*1))

 ; For skolems equated to names, first make sure the skolem is on the LHS;
 (/ (_* ((! name?) = (!1 skolem?)) _*1) (_* (!1 = !) _*1))

 ; Then move such equations leftward (avoiding repeated interchanges
 ; of multiple equations, i.e., only far enough not to overtake other
 ; such equations). By doing this we don't need leftward substitution rules:
 (/ (_* (! ~ (skolem? = name?)) _*1 (!1 (skolem? = name?)) _*2)
    (_* !1 ! _*1 _*2))

; Now use equations of type (skolem = name) on the left to substitute for
; any occurrences of the Skolem term to the right.
(/ (_*1 ((!1 skolem?) = (!2 name?)) _*2) 
   (subst! !2 !1 (_*1 _*2))) ; Omitting the now redundant equation prevents
                             ; its re-use.

; ; Tried the following "deep" replacement version again [still doesn't work;
; ; but using global substitution (see above) is better anyway]:
;  (_* ((!1 skolem?) = (! name?)) _*1 ;  rightward instance
;      (^* (/ (!2 skolem?) (if-sk1=sk2-then-name-else-sk2! !1 !2 !))) _*2)

; Leftward substitution is unnecessary if "Skolem = name" equations have been
; moved to the left; but this rule only does shallow replacement anyway
;(/ (_* (_*2 (!2 skolem?) _*3) _*1 ((!1 skolem?) = (! name?)) _*4); leftward instance
;   (_* (_*2 (if-sk1=sk2-then-name-else-sk2! !1 !2 !) _*3) _*1 (!1 = !) _*4))

; The self-identity elimination rule with a sticky variable should work:
 (/ (_* (_1. = _1.) _*1) (_* _*1))

; For apparent adverbs (that are actually adjectival preds)  premodifying
; a VP, transform them into a conjoined predicate; e.g., 
;  (BEN.NAME (OUT.ADV (:L Y (Y PLAY.V (:L Z (Z IN.P SNOW0.SK))))))
; becomes
;  ((BEN.NAME OUT.A) AND (BEN.NAME (:L Y (Y PLAY.V (:L Z (Z IN.P SNOW0.SK))))))
; (which is further transformed by lambda-conversion). 
(/ (_* (_! ((!1 adj-as-adv?) (!2 verbal-pred?))) _*1)
   (_* ((_! (adj-from-adv! !1)) and (_! !2)) _*1))

; Extract PP postmodifiers of intransitive verbs as separate properties
; of the subject; e.g., "x play in the snow" becomes (in effect) 
; "x play and x in the snow":
(/ (_* (_! (!1 intrans-verbal-pred?) (!2 pred?)) _*1)
   (_* ((_! !1) and (_! !2)) _*1))

; Do any superficial lambda conversions, if possible.
(/ (_* (_! (:L _!1 _!2)) _*1) (_* (subst! _! _!1 _!2) _*1)); monadic :L-pred
(/ (_* (_! (:L _!1 _!2) _!3 _*1) _*2)                      ; k-adic :L-pred
   (_* (_! (subst! _!3 _!1 _!2) _*1) _*2))
 
  )); TBC -- fill in more rules?




