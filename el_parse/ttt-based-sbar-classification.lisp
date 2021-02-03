; CODE FOR CLASSIFYING AN SBAR INTO A PARTICULAR CATEGORY OR DISJUNCTION
; ``````````````````````````````````````````````````````````````````````
; OF CATEGORIES, BASED ONLY ON ITS OWN SUPERFICIAL STRUCTURE
; ``````````````````````````````````````````````````````````
; (Later disambiguation rules will take account of the larger 
; syntactic context, and as far far as possible, specific features
; such as verb subcategorization and gaps.)
;
; To be tested on sample patterns in "bnc-vp-sbar-patterns"

; The categories used here, derived from the Treebank categories, 
; correspond to more standard catgories as follows:
;   S-WHNP                                   clausal WH-nominal
;   S-WHADVP                                 clausal WH-adverbial
;   S-WHEN, S-WHILE, S-WHETHER-OR-NOT, ...   clausal adverbial 
;   S-AFTER, S-ALTHOUGH, S-BECAUSE, ...      clausal PP or adverbial??
;   S-REL                                    relative clause
;   WHNP                                     NP[wh] or NP[rel]
;   WHADVP                                   ADVP[wh] or ADVP[rel]

; SBAR DISJUNCTIVE PARTICULARIZATION RULES (aimed at all syntactic contexts)
;``````````````````````````````````````````````````````````````````````````

(defun or-ttt (rules tree shallow max-n) 
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Apply ttt rules to tree till one (if any) returns a value not EQ to tree;
; (an inapplicable rule just returns the tree it was applied to). If no
; rule applies, return the input tree.
;
; rules: a list of TTT rules suitable for individual application of
;   'old-ttt:apply-rule';
; shallow: non-NIL if each rule is to be applied only at the top level  ;
; max-n: number of rule applications allowed for each rule (here, 
;    usually max-n = 1)
;
 (let (result)
      (dolist (r rules) 
         (setq result 
            (old-ttt:apply-rule r tree :shallow shallow :max-n max-n))
         (if (not (equal result tree)); if r doesn't apply, (eq result tree)
             (return-from or-ttt result))); is t; but use 'equal' to be sure!
      tree ; no rule applied, so return input tree
 )); end of or-ttt


(defun classify-sbar (sbar-tree)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; sbar-tree: of form (SBAR ...)
; output: modified version of sbar-tree, e.g., (S-WHNP ...), or
;   ((S-WHNP S-WHADVP) ...), indicating alternative classifications.
;
; Precludes things like (SBAR (PRN (, ,) ('' '') (S ...) (, ,) (S ...))),
; e.g., He announced, "I'm leaving, I've had enough", whose object 
; perhaps should be something like (S-QUOTED (S (S ...) (, ,) (S ...))).
; Likewise (SBAR ('' '') (NP ...) (VP ...)), e.g., "He said 'I refuse'",
; whose object should be something like (S-QUOTED (S (NP ...) (VP ...))).
; We also assume that the comma in something like the following will be
; deleted: "The trouble is, that I can't remember", which tends to get
; parsed as having a complement (SBAR (, ,) (IN that) (S ...)), whereas
; the comma (which is infelicitous anyway) shouldn't be in the SBAR.

; The rules treat wh-infinitives here as well; e.g., "I don't know
; [what to do]/[whether to leave (or not)]/[when to come]/...; in these 
; the infinitive is parsed as a subjectless sentence (S (VP (TO to))),
; and usually can only be understood as nominalizations (in contrast with
; cases where the S-subject is present, where there may be ADVP|NP|S-REL
; ambiguity). The one exception seems to be "as if to ...", which is an 
; adverbial, not an NP ("He turned as if to speak"). **One special case
; not yet addressed is infinitive SBARs in "so ... as to ..." constructions,
; e.g., "so drunk as to be unresponsive", or "so severely as to turn away 
; investors"). Charniak makes the "as to ..." part an (SBAR (IN AS) (S 
; (VP (TO TO) (VP ...)))).
;
; **Also still untreated are "so ... that ..." constructions, as in "so
; heavily that he passed out". The Charniak analysis as an ADVP followed
; by (SBAR (IN THAT) (S ...)) may not be semantically appropriate. (The
; semantics looks challenging, much like comparatives.)
; 
;
 (or-ttt *ttt-sbar-classification-rules* sbar-tree t 1)
 ; shallow = t, max-n = 1, i.e. 1 application; NB: not specifying max-n = 1
 ; would make 'clausal-advp-symbol!' produce things like S-SINCE, S-S-SINCE, etc.
 ;
); end of classify-sbar


(defparameter *ttt-sbar-classification-rules*
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; NB: One rule allows for already having distinguished WDT and WDT-REL;
; whereas VPs are not assumed to be particularized (e.g., to VP-INF,
; VP-ING, or VP-EN).
;
 '(
    (/ (SBAR (<> (S _+) _*)) (S-NO-THAT <>)) 
                             ; "I think [it rained]"
    (/ (SBAR (<> (IN that) (S _+) _*)) (S-THAT <>)) 
                             ; "I know that it rained"
    ; Through bottom-up recursion, coordinated SBARs will have become
    ; S-THAT, S-WHNP, etc. We propagate up the 1st conjunct's type:
    (/ (SBAR (<> ((! SBAR-subtype?) _+) (? (\, \,)) (CC _+) _+)) (! <>))
                             ; "I know [who did it, and why he did it]"
    (/ (SBAR (<> (WHNP (WP _+) _* (NN _+)_*) _+)) (S-WHNP <>))
                             ; "I know [what car he owns]/[what car to buy]" 
    (/ (SBAR (<> (WHNP (WP _+)) _+)) (S-WHNP <>))
                             ; I know (have no idea) [who yelled]/[what to do]"
                             ; Hopefully embedded clauses like "Who yelled" 
                             ; won't get misparsed as SBARQ's (this one is ok)
    (/ (SBAR (WHNP ((! WDT WDT-REL) (!1 that which))) (S _+) _*) 
       (S-REL (WHNP (WDT-REL !1)) (S _+) _*)) 
                             ; "I saw the picture [that he painted]"
                             ; "... an intensity [which borders on mania]"
    (/ (SBAR (<> (WHNP (WDT which) _* (NN _+) _*) _+)) (S-WHNP <>))
                             ; "I know [which car he owns]/[which car to buy]"
    (/ (SBAR (<> (WHNP (WDT whose) _* (NN _+) _*) (S (NP _+) _+))) 
       ((S-WHNP S-REL) <>))  ; "I know [whose car he took]"
                             ; "I know the person [whose car he took]"
    (/ (SBAR (<> (WHNP (WDT whose) _* (NN _+) _*) (S (VP (TO to) _+) _*))) 
       (S-WHNP <>))          ; "I know [whose car to buy]"
    (/ (SBAR (<> (WHNP (WDT (! whatever whichever whosever whose-ever))
                       (? (NN _+)) _*) (S _+) _*)) ((S-WHNP S-WHADVP) <>))
                             ; "I take back [whatever (words) offended you]"
                             ; "I'm annoyed, [whatever (excuse) you muttered]"
    (/ (SBAR (<> (WHNP (WDT (! whoever whomever whatever))) (S _+) _*))
       ((S-WHNP S-WHADVP) <>))
                             ; "I'll grade [whatever he hands in]"
                             ; "He'll pass, [whatever he submits]"
    (/ (SBAR (<> (WHNP _* (WRB how) _*) (S _+) _*)) (S-WHNP <>)) 
                             ; "I don't know [how sick he is]"
    (/ (SBAR (<> (WHPP _+) (S _+))) (S-WHNP <>)); (tho' WHPP should be WHADVP)
                             ; "I can't see [in which tree the bird is singing]" 
    (/ (SBAR (<> (WHADVP (WRB how) _+) (S _+) _*)) (S-WHNP <>))
                             ; "I don't know [how fast he did it]"
    (/ (SBAR (<> (WHADVP (? (RB _+)) (WRB how)) (S (VP (TO to) _+) _*)))
       (S-WHNP <>))          ; "[How to cure cancer] is an unsolved problem"
    (/ (SBAR (<> (WHADVP (? (RB _+)) (WRB how)) (S (NP _+) _+) _*)) 
       ((S-WHNP S-WHADVP) <>)) ; *** Change S-WHADVP to S-HOW??
                             ; "I know exactly how you feel"
                             ; "He writes [exactly how he talks]"
                             ; "how" can of course occur in XP+S/XP (SBARQ)
                             ; questions, but we can leave SBARQ unchanged
    (/ (SBAR (<> ((! WHNP WHADVP) _* (WRB why) _*) _+)) (S-WHNP <>))
                             ; "I don't know [why (in heaven) he left]"
                             ; "why" can of course occur in XP+S/XP (SBARQ)
                             ; questions, but we can leave SBARQ unchanged.
    ;            ??"[why to come]" doesn't sound right for some reason
    ;            (??"Give me 3 reasons why to come" -- I've heard this sort 
    ;            of thing from non-native English speakers).
    
    (/ (SBAR (<> ((! WHNP WHADVP) (WRB however) _*) (S _+) _*)) (S-WHADVP <>))
                             ; "Let's do it, [however (poorly) it plays out]"
    (/ (SBAR (<> (WHADJP (WRB however) (JJ _+)) (S _+))) (S-WHADVP <>))
                             ; "I'll buy them, however many you have"
    
    ; Note: S-types with specific suffixes, like S-WHEN, S-WHILE, S-SINCE,
    ;       etc., are all considered special types of S-ADVP; when these 
    ;       words initiate an NP, we use phrase name S-WHNP, and for relative
    ;       clauses we use S-REL. However, "however" is an exception -- we use
    ;       S-WHADVP, because S-HOWEVER would suggest a sentence like this one.
    ;       I note that "however" in phrases like "however often" tends to get 
    ;       misparsed:
    ;       (S1
    ;        (S (S (NP (PRP HE)) (VP (AUX DID) (NP (PRP IT)))) (, ,)
    ;         (ADVP (RB HOWEVER))
    ;         (S (ADVP (RB OFTEN)) (NP (PRP HE)) (VP (VBZ DENIES) (NP (PRP IT))))))
    
    (/ (SBAR (<> (WHADVP _* (WRB when)) (S (VP (TO to) _+) _*))) (S-WHNP <>))
                             ; "I know [when to quit]"
    (/ (SBAR (<> (WHADVP _* (WRB when)) (S (NP _+) _+) _*)) 
           ((S-WHEN S-WHNP S-REL) <>))
                             ; "I eat [(only) when I'm hungry]"
                             ; "I know [(exactly) when he arrived]" 
                             ; "I know the exact time [when he arrived]" (S-REL)
                             ; For questions we should have SBARQ, which can be
                             ; retained as-is.
    (/ (SBAR (<> (WHADVP (WRB whenever)) (S _+) _*)) (S-WHENEVER <>))
                             ; "He plays guitar [whenever he has time]"
    (/ (SBAR (<> (WHADVP _* (WRB where)) _* (S (VP (TO to) _+) _*) _*)) 
       (S-WHNP <>))          ; "I scarcely know [where to begin]"
    (/ (SBAR (<> (WHADVP _* (WRB where)) _* (S _+) _*)) 
       ((S-WHNP S-WHERE S-REL) <>))
                             ; "I know [where he lives]" (S-WHNP)
                             ; We might use S-WHPP for "Where is he?",
                             ;    but the SBARQ context should allow
                                  correct interpretation.
                             ; "He died [where he was born]" (S-WHERE)
                             ; "[[phi]] = 1, [where '1' denotes truth]"
                             ; "... the street [where you live]" (S-REL)
    (/ (SBAR (<> (WHADVP _* (WRB wherever)) _* (S _+) _*)) (S-WHEREVER <>))
                             ; "I wish you well, [wherever you end up]"
                             ; "He went [wherever she went]"
    (/ (SBAR (<> (IN for) (S _* (VP (TO to) _+) _*) _*)) (S-FOR-TO <>))
                             ; "waited [for Sandy to leave]" (really, V PP VP-inf!)
                             ; "it is unheard of [for Kim to be late]"
    (/ (SBAR (<> (IN for) (S _* (VP ((! ~ TO) _+) _+) _*) _*)) (S-FOR-REASON <>))
                             ; "He left, [for it was late]"
    (/ (SBAR (<> (IN if) (S _+) _*)) ((S-IF S-WHNP) <>))
                             ; "I'll speak to him [if he's in his office]"
                             ; "I'll check [if he's in his office]" (if = whether)
    (/ (SBAR (<> (IN if) (RB (! only ever)) (S _+) _*)) (S-IF <>))
                             ; "I'll be ready [if ever he returns]" 
                             ; ** other adverbs?? ADVP?? (if by some miracle ...)
    (/ (SBAR (<> (IN if) (RB perhaps) (S _+) _*)) (S-WHNP <>))
                             ; "I wonder [if perhaps he's sick]"
                             ; **other adv's?? ADVP?? (..wonder if by any chance ...)
    
    (/ (SBAR (<> (IN as) (IN if) (S _+) _*)) (S-AS-IF <>))
                             ; "He strained forward [as if he were listening]"
                             ; "He strained forward [as if to speak]"
    (/ (SBAR (<> (IN whether) (S (VP (TO to) _+)) (CC or) (RB not))) (S-WHNP <>)) 
                             ; "He wondered [whether to do it or not]"
    (/ (SBAR (<> (IN whether) (S (NP _+) _+) (CC or) (RB not))) 
       ((S-WHETHER-OR-NOT S-WHNP) <>)) 
                             ; "He is crazy, [whether he knows it or not]";
                             ; "You'd better tell me [whether you did it or not]"
                             ; [The adverbial reading S-WHETHER-OR-NOT is
                             ; strongly preferred by default; "," clinches it.]
    (/ (SBAR (<> (IN whether) (CC or) (RB not) (S (VP (TO to) _+) _*)))
       (S-WHNP <>))          ; "He wondered [whether or not to do it]"
    (/ (SBAR (<> (IN whether) (CC or) (RB not) (S (NP _+) _+) _*))
       ((S-WHETHER-OR-NOT S-WHNP) <>))
                             ; "He is crazy, [whether or not he knows it]";
                             ; "You'd better tell me [whether or not you did it]"
                             ; [The adverbial reading S-WHETHER-OR-NOT is
                             ; strongly preferred by default; "," clinches it.]
    (/ (SBAR (<> (IN whether) (S _+))) (S-WHNP <>))
                             ; "You'd better tell me [whether you did it]" 
                             ; "You'd better tell me [whether to do it]"
    (/ (SBAR (IN _!) (<> _* (S _+) _*)) ((clausal-advp-symbol! _!) (IN _!) <>))
                             ; "left [while/as Kim slept]" 
                             ; "slept [until/before/since/after/once Kim left]"
                             ; "left [because/although/though Kim complained]"
                             ; (clausal-advp-symbol! 'while) = S-WHILE, 
                             ; (clausal-advp-symbol! 'until) = S-UNTIL, etc.
    
    ;;(/ (SBAR (RB ...))) ; [TBC] STILL TO BE DONE (so (that), ever since, soon
                          ; after, once, so, so long as, even while, even when, ...
                          ; & conjunctions? (unless and until, before or after, etc.
                          ; The parser doesn't coordinate these, but rather gives
                          ; things like (PP (IN BEFORE) (CC OR) (IN AFTER) (NP ...)).
                          ; Maybe I need to preprocess to get (IN (IN ...) (CC ...)
                          ; (IN ...)). One example of "so" was "Such-and-such is the
                          ; case, (SBAR (RB so) (S (VP don't do this-and-that)))"
 
 )); end of *ttt-sbar-classification-rules*


; Requisite functions
; ```````````````````

(defun SBAR-subtype? (sym)
   (and (symbolp sym) 
        (member sym 
          '(S-THAT S-NO-THAT S-WHNP S-QUOTED S-WHADVP S-REL S-HOW S-WHEN 
            ; 'S-HOW' is currently not being produced (we use S-WHNP)
            S-WHERE S-WHENEVER S-WHEREVER S-WHILE S-UNTIL S-BEFORE S-SINCE 
            S-AFTER S-ONCE S-AS S-BECAUSE S-ALTHOUGH S-THOUGH S-EVEN-THOUGH 
            S-UNLESS S-FOR S-FOR-TO S-IF S-WHETHER S-IF/WHETHER S-EVEN-IF
            S-WHETHER-OR-NOT S-ONLY-IF S-IN-CASE S-WHEREAS ))))


(defun clausal-advp-symbol! (prep); form adverbial symbol S-WHILE, S-BECAUSE, etc.
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; The expected arguments are while, until, before, since, after, once, as, 
; because, although, though, (maybe also even-though?), unless. Note omission
; of that, whether, etc., as these are handled separately.
   (if (symbolp prep)
       (intern (format nil "S-~a" prep))
       (intern (format nil "S-***~a" prep))))

