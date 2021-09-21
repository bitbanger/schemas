
; NOTE: The various template functions for subcat prefs like
;      'v_np-pref!', 'v_np-contextual-pref!, 'v_np-contextual-pref!' and
;      'v_np-extra-np-pref!' are in "subcat-pref.lisp" 
;
; NOTE: This file temporarily sets of some test trees at the end.
;======================================================================
; Insert missing gaps (NP, PP, ADVP, ADJP, VP) into phrase structure trees,
; probably best after all other PST processing is done AND ALL 'SUB' OPERATORS
; HAVE BEEN INSERTED.
;
; insert-np-trace -- given S's or SQ's in contexts like
;   (NP ... (SBAR (-SYMB- SUB) ... (S ...)))
;   (SBARQ (-SYMB- sub) (WHNP ...) (SQ ... ))
;                                     `````` need to handle deep *h embeddings
; The recursive embedding structure then ends up at a VP or PP; note that ADJ
; and ADV can't have NP complements, and hence no NP gaps. Reified S or VP
; are perhaps a quasi-plausible exception: ??"That he's crafty, she's well
; aware"; ??"To do it again, he's not particularly eager". However, ADJ's can
; have PP complements, which can have an NP gap; e.g., "What is he guilty of?"
;
; PP trace context:
;   (SBARQ (-SYMB- sub) (WHPP (TO/IN ..) (-SYMB- sub)) (SQ ... ))
;
; The PP trace is likely to be in a VP. Nouns and adjectives can have PP
; complements, but these can't easily be gapped. ("She took note of his 
; demand for a raise" =/=> *"For a raise she took note of his demand"; 
; ?"Of these developments, she took careful note"; ?"Of his constant
; complaints, she was thoroughly weary")
;
; ADVP trace context:
;  (SBARQ (-SYMB- SUB) (WHADVP ...) (SQ ... ))
;
; ADJP trace context:
;   (SBARQ (WHNP (WRB HOW) (JJ ...)) (SQ ... )); NB: should be WHADJP !!

; insert-np-trace (XP YP); assume XP is the 1st arg of 'sub', & YP needs *h
; ``````````````````````
;  - at the top level first make sure there's no *h outside the scope of a
;    (sub X Y) in the entire structure; if there is one, no action is needed;
;
;  - If the verb of the XP is a form of "be", "seem", "become", or another
;    v_pred, recursively process the AP or PP or indef NP, and incorporate
;    the result in the XP;
;    E.g., "[What is he] guilty of _?"; "[the crime he] is guilty of _"
;    E.g., "[What room is he] in _?"; "[the room he] is in _"
;    E.g., "[What task is he] in the middle of _?"
;    E.g., "[What food has he] become fond of _?"
;
; TBC: Fist look for an incomplete phrase-final PP at all levels, & complete
;      with an *h if found. ?? After that we only have to worry about objects
;      of verbs -- whichever make the strongest claim for an object ??
;
;  - If the type XP is S or SQ, recursively process the first-encountered VP
;    (e.g., "[What] did he say _" or "[the man] I talked to _ yesterday";
;    "What did you ask him to buy?"), incorporating the result in the
;    output for the S/SQ;
;
;  - if the type is (VP ... (.VB <verb>) *expr (PP (IN !atom)) *expr),
;    return (VP ... (.VB <verb>) *expr (PP (IN !atom) (NP (-SYMB- *h))) *expr)
;    E.g., "[Who did you] talk to _ at the party?", "[What] was all that
;    fuss about _?" (BLLIP: (ADJP (IN about)) !!)
;
;  - if the type is (VP ... (.VB <v_np,~_vp>) *<~NP~VP>),
;    return (VP ... (.VB <trans-verb>) (NP (-SYMB- *h)) *<~NP~VP>)
;    E.g., "[Who do you] like _ in your class?", 
;    E.g., "[Who did you] catch _ cheating on the test?"
;                                 ````````````````````` (BLLIP: S[VP])
;
;  - if the type is (VP ... (.VB <v{_np}_vp>) ?<ADVP> !<S[VP/NP]-or-VP/NP>)
;                                 ````````` i.e., v_vp or v_np_vp
;    recursively process the VP/NP, incorporating the result in the output
;    for the given VP; by S[VP] I mean (S (VP ....)), as per BLLIP parses.
;    E.g., "[What would you] like {most of all, not} to do _?"
;    E.g., "[Who did you] see Mary talking to _?" (BLLIP: "talking to" is S[VP])
;
;  - if the type is (VP ... (.VB <v_np_vp>) *<~NP~VP> !<S[VP]-or-VP>),
;    return (VP ... (.VB <trans-verb>) (NP (-SYMB- *h)) *<~NP~VP>)
;    E.g., "[What would you] like _ {not} to happen?" (no gap in VP[inf])
;    E.g., "[Whom did you] tell _ to see the doctor?"        --- " ---
;    E.g., "[Whom did you] tell _ to leave the box on the curb?" --"--
;
;  - if the type is (VP ... (.VB <v{_np}_vp>) !<NP> !VP/NP),
;    recursively process the VP/NP, incorporating the result in the output
;    for the given VP;
;    E.g., "[What would you] like Bob to do _?",
;    E.g., "[Whom did you] tell Mary to see _?",
;    E.g., "[What did you] tell Bob to leave _ on the curb?"
;
;  - if the type is (VP ... (.VB <intrans-verb>) *<non-VP> (VP ...)),
;    recursively process the embedded VP, incorporating the result in the
;    output for the given VP;
;
;  - if the type is (VP ... (.VB <v[_np,~_vp]>) *<non-NP>),
;    (e.g., "[Who does Ed] like _?", "[What did Ed] do _ with the car?",
;    but, "[What does Ed like to do _?", "[Who did he] talk to _?"),
;    return (VP ... (.VB <trans-verb>) (NP (-SYMB- *h)) *<non-NP>).
;
;    NB: Ditransitive verbs ("give", "tell", "sell", ...) can also have
;    just one NP complement (i.e., be monotransitive) plus a non-NP
;    complement; e.g., "What did you give _ to Bob?", "What did you
;    tell Bob to do _?", "Who did you sell the car to _?", "Who did
;    you tell Bob to sell the car to _?"; the next rule deals with that
;
;  - if the type is (VP ... (.VB <v[_np_vp]>) *<non-NP/VP>),
;    (e.g., "[Who does Ed] like _?", "[What did Ed] do _ with the car?",
;    but, "[What does Ed like to do _?", "[Who did he] talk to _?"),
;
;  - if the type is (VP ... (.VB <ditrans-verb>) !<NP-inanim> *<expr>),
;    & XP is personal (e.g., "[Whom did you] tell _ the secret?"),
;    return (VP ... (.VB <ditrans-verb>) (NP (-SYMB- *h)) !<NP-inanim> *<expr>)
;
;  - if the type is (VP ... (.VB <ditrans-verb>) !<NP-inanim> *<expr>),
;    & XP is personal (e.g., "[Whom did you] tell _ the secret?"),
;    return (VP ... (.VB <ditrans-verb>) (NP (-SYMB- *h)) !<NP-inanim> *<expr>)
;
;  - if the type is (VP ... (.VB <ditrans-verb>) !<NP-anim> *<expr>),
;    & XP is impersonal (e.g., "[What did you] tell Alice _?", "[What
;    brand of kittles do you feed your cat _?"), return
;    (VP ... (.VB <ditrans-verb>) (NP (-SYMB- *h)) !<NP-inanim> *<expr>)
;
;  OLD -- I WAS CONSIDERING *H INSERTION INTO ULFs
;  - if looking at a form (.aux~ !term~ *non-v~ (.trans-v~ *non-term~)),
;       [ACTUALLY, "TERM" IS HARDER TO DETERMINE IN ULF THAN IN THE PST!!]
;    return (1 2 3 (4.1 *h 4.2)) ; I'm using !term~ as a pred over ULF
;    expressions, and prefixed ?, *, or + for iterating such a predicate;
;    the prefix '.' remains reserved for single-atom, obligatory constituents;
;
;  - if looking at a form (.aux~ !term~ *non-v~ (.v~ +expr)),
;    return (1 2 3 (insert-np-trace! 4)) ; postfixed '!' indicates a function;
;    allowing functions in output templates requires another extension to TT.
;      [So far this doesn't allow "What did you (ask Bob to do?)"]
;
;  - if looking at a form (.v~ !term ?adv~ (+expr)),
;    return (1 2 3 (insert-np-trace! 4))

(defun trace-gaps ()
; Trace the major functions used in gap insertion; successful gap insertion
; depends on (-SYMB- sub) operators already being in place, and local
; insertion of gap candidates operates on 'sub'-constructs.
  (trace globally-insert-gaps1 locally-insert-gaps insert-gap-candidates
         extract-first-xp-gap-candidate insert-np-gap-candidates 
         insert-pp-gap-candidates insert-advp-gap-candidates
         insert-adjp-gap-candidates assign-indices-to-gap-candidates
         equalize-coordinated-gap-candidates retain-strongest-gap-candidate
         delete-weaker-gap-candidates confirm-rightmost-gap-candidates))


(defun globally-insert-gaps (tree)
;``````````````````````````````````
 ; if there are no (sub ...) constructs in tree (hence no gaps), return tree
 (let ()
   (when *show-stages*
       (format t "~%~%@@ Parse tree prior to gap-insertion:")
       (format t   "~%   ``````````````````````````````````~%~s" tree)
       (format t "~%~%@@ Insert missing *h wherever there are 'sub' constructs")
       (format t "~%   `````````````````````````````````````````````````````"))
   (if (not (contains-sub-construct tree))
       tree; to avoid unneccesary tree reconstruction
       (globally-insert-gaps1 tree))
    )); end of globally-insert-gaps

(defun contains-sub-construct (tree); briefly tested
;``````````````````````````````````
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
; Check whether tree is of form (<atom> (-SYMB- sub) ...), or contains at
; least one such construct somewhere within it. (Gap insertion in a tree
; is relevant only if a sub-construct is present.)
;
 (cond ((atom tree) nil)
       ((sub-construct tree) t)
       (t (dolist (x tree) (if (contains-sub-construct x) (return t))))
 )); end of contains-sub-construct


(defun sub-construct (tree)
;`````````````````````````
; Check whether tree is of form (<atom> (-SYMB- sub) ...)
 (and (listp tree) (atom (car tree)) (equal (second tree) '(-SYMB- sub))))


(defun globally-insert-gaps1 (tree)
;```````````````````````````````````
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
; Consider tree and all its subtrees, and if any is of form 
;     (<atom> (-SYMB- sub) <expr1> <expr2>), 
; and no gap of form (-SYMB- *h) is present in <expr2>, we insert such a gap
; (or multiple related gaps, for conjunctive & parasitic gaps).
 (let (tree1)
      (cond ((atom tree) tree)
            (t ; first take care of filler-gap dependencies within subtrees:
               (setq tree1 (mapcar #'globally-insert-gaps1 tree))
               ; now do the top level
               (if (sub-construct tree1) 
                   (if (already-contains-gap (fourth tree1))
                       tree1
                       ; NB: we need the initial elements of the 'sub'
                       ; context in 'locally-insert-gaps' to know what
                       ; type of gap is needed; this is why we use the 
                       ; entire tree as arg in the following:
                       (locally-insert-gaps tree1))
                   tree1)))
 )); end of globally-insert-gaps1


(defun already-contains-gap (tree); Oct 21/20; briefly tested
;````````````````````````````````
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
;
; Check if tree already contains a gap of form (-SYMB- *h) outside the scope
; of any 'sub' context within tree; if so, return T, o/w return NIL.
;
  (cond ((atom tree) nil)
        ((equal tree '(-SYMB- *h)) t)
        ((sub-construct tree) nil)
        ((member t (mapcar #'already-contains-gap tree)) t)
        (t nil))
 ); end of already-contains-gap


(defun locally-insert-gaps (tree)
;````````````````````````````````
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) for-
;       mat, of form 
;            (XP (-SYMB- sub) expr1 expr2), 
;       i.e., a 'sub' construct (indicating a filler-gap dependency), where
;       no gaps have yet been inserted (as verified in 'globally-insert-gaps1').
; Result: the tree with a hole constituent (-SYMB- *h) inserted at one place
;       in the 4th element of tree, or possibly two or more such constituents 
;       for coordination or parasitic gaps; e.g., "Who did you meet _ and 
;       talk to _?", "Who did you meet _ without greeting _?". Candidate 
;       places initially marked (:xp i) with highest i (preference strength) 
;       are preferred for insertion of (-SYMB- *h), but for ties, we choose 
;       the rightmost place.
; Method: 
; 1. Find and insert all candidate gaps of the type implied by (third tree);
;    all candidates are represented as (:xp i), but (third tree) will
;    determine whether we look for positions of type NP, PP, AP, ADVP, or VP;
;    i is the strength of preference (= 0, 1, 2, 3, or 4) for a constituent
;    of that type in that location; only positions outside the scope of
;    subordinate 'sub' contexts are considered.
; 2. Count n-cand, the number of occurrences of (:xp i) in tree outside
;    of 'sub' contexts; if n-cand = 0 return tree (no reasonable location
;    for the gap indicated by the 'sub' context could be found); if n-cand
;    = 1, replace the  unique (:xp i) outside of 'sub' contexts with
;    (-SYMB- *h), & return the altered tree;
; 3. Assign occurrence indices to all candidates lying outside of 'sub' 
;    contexts, in a depth-first left-to-right traversal of tree. At the
;    same time find imax, the highest preference strength i among them;
;    also record the highest occurrence index lmax that was assigned.
;    E.g., two candidates (:np i), (:np j) might become (:np i 2),
;    (:np j 5), where the latter is thus further right in tree.
; 4. Make occurrence indices of coordinated and parasitically linked 
;    candidates equal to the rightmost such index, and set their
;    strengths to the maximum value among them as well. (Thus linked
;    candidates will appear to be as far right as their rightmost member,
;    and as strongly preferred as their most strongly preferred member.)
; 5. Candidate deletions:
;    Delete all occurrences of (:xp i l) outside of 'sub' contexts in
;    tree where i < imax; at the same time find the highest occurrence
;    index among candidates *not* deleted. 
; 6. Then delete all candidates  with non-maximal occurrence indices.
;    replacing the remaining (:xp i l) instances by (-SYMB- *h).
;
 (prog (tree0 tree4 n-cand cand i+l+tree4 imax lmax)
       (setq tree0 (insert-gap-candidates tree)); insert (:xp i) instances
       ; in (fourth tree), (where preference strength i is in {0,1,2,3,4})

       (setq tree4 (fourth tree0))
       ; Simple special cases (for efficiency):
       (setq n-cand (count-xp-gap-candidates tree4))
       (if (zerop n-cand) (return tree))
       (when (= n-cand 1) 
             (setq cand (extract-first-xp-gap-candidate tree4))
             (setq tree0 ; for output
                   (cons (first tree)
                     (cons (second tree)
                      (cons (third tree)
                       (cons (subst '(-SYMB- *h) cand tree4 :test 'equal)
                        (cddddr tree0)))))); just in case there's more in tree
             (if *show-stages*
               (format t "~%~%@@ (sub)tree with chosen *h-gap:~%~s" tree0))
             (return tree0))

       ; Add occurrence indices to gap candidates; we use start values
       ; -1, -1 for imax and lmax (highest index assigned), and we get back
       ;  actual values along with the modified tree: (imax lmax tree1)
       (setq i+l+tree4 (assign-indices-to-gap-candidates (list -1 -1 tree4)))
       ; DEBUG:
    ;  (format t "~% Result of 'assign-indices-to-gap-candidates': ~%~s" i+l+tree4)
       (setq imax (car i+l+tree4) lmax (second i+l+tree4) )
       (setq tree4 (third i+l+tree4))
       ; error check: we should have lmax = n-cand - 1 (because the
       ; occurrence indices start at 0)
       (if (not (= lmax (1- n-cand)))
           (format t "~%~%## Error: Previous count of :xp gap cadidates, ~
            ~%          n-cand = ~a, doesn't agree with count based on ~
            ~%          assigning indices to :xp positions, = ~a" n-cand
            lmax))

       (setq tree4 (equalize-coordinated-gap-candidates tree4))

       ; delete gap candidates with preference strengths < imax, and for
       ; those with i = imax, delete those with l < lmax.
       (setq tree4 (delete-weaker-gap-candidates imax tree4))
       ; DEBUG:
    ;  (format t "~% Result of 'delete-weaker-gap-candidate': ~%~s" tree4)
       ; The deletions may have deleted the rightmost candidates, so we
       ; need to recompute lmax
       (setq lmax (position-index-of-rightmost-gap-candidate tree4))
       ; Now delete all candidates  with non-maximal occurrence indices,
       ; replacing the remaining (:xp i l) instances by (-SYMB- *h).
       (setq tree4 (confirm-rightmost-gap-candidates lmax tree4))
       ; DEBUG:
    ;  (format t "~% Result of 'confirm-rightmost-gap-candidates': ~%~s" tree4)
       (setq tree0 ; for output
         (append (list (car tree) (second tree) (third tree) tree4) 
                 (cddddr tree))); just in case there's a further element
       (if *show-stages*
           (format t "~%~%@@ (sub)tree with chosen *h-gap(s):~%~s~%" tree0))
       (return tree0)
 )); end of locally-insert-gaps


(defun insert-gap-candidates (tree)
;``````````````````````````````````
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format
;       of form 
;           (XP (-SYMB- sub) expr1 expr2),
;       i.e., a sub' construct (indicating a filler-gap dependency), where
;       no gaps have yet been inserted (as verified in 'globally-insert-gaps1').
;
; We mark all possible gap positions of the appropriate type determined
; by expr1 (the expression "moved" out of the gap) using (:xp 1), (:xp 2),
; ... (:xp 4), where 1 - 4 represent "preference levels", intended to allow
; making a choice of a maximally preferred gap position.
;
; Note: expr1 (i.e., (third tree) may itself contain 'sub' contexts, but
;       those are processed via 'globally-insert-gaps1'.
;
 (let ((whxp (car (third tree))) result)
      (if *show-stages*
         (format t 
           "~%@@ (sub)tree of form (XP (-SYMB- sub) ... lacking gaps:~%~s" tree))
      (if (eq whxp 'SBAR); topicalized clause or clausal nominal, e.g.,
                         ; "What he writes, no-one knows"; "Where he lives,
                         ; there's no water"; "Where he lives, no-one knows"
          ; reset whxp to reflect the type of clause, based on (third tree)
          ; (allow for possible (-SYMB- sub) as 2nd element of (third tree)):
          (if (intersection '(WHNP NP)
                (list (car (second (third tree))) (car (third (third tree)))))
              (setq whxp 'whnp)
              (if (intersection '(WHADVP ADVP)
                   (list (car (second (third tree))) (car (third (third tree)))))
                  (setq whxp 'WHADVP))))
      (setq result
            (cond ((find whxp '(WHNP NP)) ; NP gap expected?
                   (insert-np-gap-candidates (fourth tree)))
                  ((find whxp '(WHPP PP)) ; PP gap expected?
                   (insert-pp-gap-candidates (fourth tree)))
                  ((find whxp '(WHADVP ADVP)) ; ADVP gap expected?
                               ; e.g., "How quickly did he finish _?"
                               ;       "For what reason did he quit _?"
                   (insert-advp-gap-candidates (fourth tree)))
                  ((find whxp '(WHADJP ADJP WHAP AP)) ; ADJP gap expected?
                   (insert-adjp-gap-candidates (fourth tree)))
                  ((eq whxp 'VP) ; VP gap expected?
                   (insert-vp-gap-candidates (fourth tree)))
            ))
     (if *show-stages*
         (format t "~%~%@@ (sub)tree with :XP gap candidates inserted:~%~s~%"
            (list (car tree) (second tree) (third tree) result)))
     (list (car tree) (second tree) (third tree) result)
 )); end of insert-gap-candidates


(defun count-xp-gap-candidates (tree) ; Oct 29/20 - briefly tested
;````````````````````````````````````
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
;       it's expected to be the body of a 'sub' construct (indicating a filler-
;       hole dependency, with possible gap positions marked in the manner
;       (:xp i), where i is in {0, 1, 2, 3, 4}, indicating preference for
;       for a hole variable (*h) in that location.
; Result: The number of (:xp i) occurrences in tree outside of 'sub' contexts,
;         (A gap filler can't go inside a subordinate 'sub' structure.)
 (cond ((atom tree) 0)
       ((eq (car tree) :xp) 1)
       ; 'sub' context?
       ((sub-construct tree) 0)
       (t (+ (count-xp-gap-candidates (car tree))
             (count-xp-gap-candidates (cdr tree))))
 )); end of count-np-gap-candidates


(defun extract-first-xp-gap-candidate (tree); Oct 30/20 briefly tested 
;````````````````````````````````````````````
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
;       it's expected to be the body of a 'sub' construct (indicating a filler-
;       hole dependency, with at least one trace/hole position marked in the
;       manner (:xp i), where i is in {0, 1, 2, 3, 4}, outside any 'sub' context.
;       [The extraction needn't distinguish NP, PP, AP, ADV, VP gapacandidates]
; Result: (:xp i), the leftmost occurrence (outside of any 'sub' contexts)
;
 (let (result)
      (cond ((atom tree) nil)
            ((eq (car tree) :xp) tree)
            ; 'sub' context?
            ((sub-construct tree) nil)
            (t (if (setq result (extract-first-xp-gap-candidate (car tree)))
                   result
                   (extract-first-xp-gap-candidate (cdr tree)))))
 )); end of extract-first-xp-gap-candidate


(defun insert-np-gap-candidates (tree)
;````````````````````````````````````
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
;       IT'S EXPECTED TO BE THE BODY OF A 'SUB' CONSTRUCT (indicating a filler-
;       np-gap dependency, but with the gap(s) not yet identified)
;
; This marks the possible NP gaps in the body of a 'sub' context, using
; degrees of preference from 1 to 4 (i.e., markers (:np 1), (:np 2), (:np 3),
; (:np 4)), at all depths in tree, but bypassing lower-level 'sub' contexts
; (which cannot contain gaps corresponding to the current ({WH}NP ...) filler.
; 
; Degrees of preference depend on local context, not just the verb/prep
; (though we consider the preference for completing a reduced PP as always
; maximal, 4); for example, consider the following possible trace positions
; _i, marked with estimated strength i:
;   "What did you dance _0?"                     ("forced" transitivity)
;   "What do you think _1?"                      (weak trans, no further S|VP|PP))
;   "What did you think _1 to do _3?"            (weak trans, & strong trans)
;   "What did you say _3?"                       (strong trans, no further S|VP|PP)
;   "What did you say _2 that you saw _3?"       ("say" already has a complement)
;   "What did you see _2 that troubled you?"     ("troubled" already has NP object)
;   "What did you see _2 that you wanted _?)     (2nd '_' is in a 'sub' context)
;   "Whom did you tell _2 the news _2?"          ("tell" wants pers, ~pers args)
;   "What news did you tell _2 Bob _2?"          ("tell" wants pers, ~pers args)
;   "What news did you tell _1 Bob _1 about _4?" ("about" demands an NP arg)
;   "What news did you tell _1 Bob _1 about me?" ("about" already has an NP arg)
;   "Who did you tell _1 the story _1 to _4?"    (again, "to" demands an NP arg)
;   "What did you tell Bob _1 to make _2?",      (_1 ∵ "tell" has 2 other args)
;   "What did you tell Bob _1 to make him understand _1?" (tough decision!)
;   "What did you ask Bob _1 to make me understand _1?"   (tough decision!)
;   "What did you tell Bob _1 to say _1 to Ed?"
;   "What did you pick out _3 and pay for _4?"   (coordinated gaps)
;   "Is there anything (that) you want to say _3 or do _3?" (coord. gaps)
;   "What did you sign _2 without reading _3?"   (parasitic gap)
; Picking the right one(s) uniformly can't be done by any simple algorithm;
; but there are some rules of thumb, like the following for verb objects,
; where we consider a word or phrase to be in a given 'sub' context if
; it isn't embedded in a subordinate 'sub' context:
; 
; (All this is aborted  if trace introduction was done previously --
; perhaps by other methods; i.e., if (-SYMB- *h) is present already in
; tree, except perhaps in subordinate 'sub' contexts, which we bypass.) 
;
; NP-object preference strength markings for verbs (by a transitive verb
; we mean a verb taking an NP object, but not 2 NP objects; it might take
; other complements as well).
; - 0 for intransitive verbs
; - 1 for weakly transitive verbs with no object (but perhaps following S|VP|PP)
; - 0 for weakly transitive verbs with an NP object 
; - 3 for definitely trans verbs with no object or following S|VP|PP;
;     this gives a "rightward preference" for *h-placement;
; - 2 for definitely trans verbs followed by S|VP|PP
; - 0 for weak transitive (but not ditrans) verb followed by NP (& maybe more)
; - 3 for ditrans verbs with no object, nor followed by S|VP|PP
; - 2 for ditrans verb with 1 object and not followed by S|VP|PP
; - 1 for ditrans verb with 1 object and followed by S|VP|PP
;
; The preference strengths will be determined by function 'v_np-pref!'
;
; - Rightmost gaps are preferred, other things (preference strengths) 
;   being equal (except for ditransitive verbs that already have a non-human 
;   object in place)
;
; We'll use preferences like that, and in a separate program pick the most
; strongly preferred complement locus for each 'sub' context for inserting 
; (-SYMB- *h). We use the 'match' and 'fill-template' functions of TT+
; 
; KEEP IN MIND: 'tree' here is the BODY (4th element) of a sub-construct
;   (in contrast with 'locally-insert-gaps' and 'insert-gap-candidates')
;
 (let (tree1 ma) 
    (if (or (atom tree) (sub-construct tree)); bypass 'sub' constructs
        (return-from insert-np-gap-candidates tree))
    (setq tree1
      (cond ; Verb lacking complements/adjuncts (except perhaps ADVP)?
            ; e.g., "[the cookie you] ate _ secretly"; "[the man you] trust _";
            ; e.g., "[the expert you trust Bob] to contact _ promptly";
            ; 'v_np-pref!' is a function computing the strength of preference
            ; of a given verb for an NP object (0 for intransitive verb);
            ; NB: Particles have been attached to verbs when this code is run;
            ((ok (setq ma (match '(VP (.VB !atom) ?[advp]) tree)))
             (fill-template '(VP 2 (:xp (v_np-pref! '2)) 3) ma))

            ; Reduced PP? (NB: the preference level of a preposition for an
            ; NP complement will generally be maximal (= 4), but putting '4'
            ; in the output template would be a position reference!)
            ((ok (setq ma (match '(PP (IN !atom)) tree)))
             (fill-template '(PP 2 (:xp 4.0)) ma))

            ; Verb followed by punctuation and/or a coordinator and one or
            ; more further (incorrectly) coordinated verbs (w/o separate VP);
            ; intended to allow for coordination, as in "Who did you approach,
            ; greet, and talk to?"
            ((ok (setq ma (match '(VP (.VB !atom) +[punc-or-coord] 
                                    *non-np (.VB !atom) *non-np) tree)))
             (fill-template '(VP 2 (:xp (v_np-contextual-pref! '2)) 3 4 5
                               (:xp (v_np-contextual-pref! '5)) 6) ma))

            ; Verb followed by punctuation and/or a coordinator (this shouldn't
            ; really happen, but does), and further material
            ((ok (setq ma (match '(VP (.VB !atom) +[punc-or-coord] 
                                                         +expr) tree)))
             (fill-template '(VP 2 (:xp (v_np-contextual-pref! '2)) 3 4) ma))
            
            ; Verb followed by S|VP|PP|ADVP|ADJP (no NP); ('v_np-contextual-pref!'
            ; evaluates the preference for an NP object in this context;
            ; this is larger if the verb is ditransitive, not just transitive)
            ((ok (setq ma (match '(VP (.VB !atom) +[non-np-compl]) tree)))
             (fill-template '(VP 2 (:xp (v_np-contextual-pref! '2)) 3) ma))
            
            ; Verb followed by NP & maybe more; Note that the case where there's
            ; no NP after a ditransitive verb is already taken care of (case 1);
            ; the preference will > 0 for a ditransitive verb, & probably 0 
            ; for a merely transitive one:
            ((ok (setq ma (match '(.VP/SQ (.VB !atom) (NP +expr) *expr) tree)))
             (fill-template '(VP 2 3 (:xp (v_np-extra-np-pref! '2)) 4) ma))
                                  ;```````prefer gap *after* the first NP
                                  ;       ** something to be checked further
            (t tree))) ; no change at the top level of sub-construct body

         (mapcar #'insert-np-gap-candidates tree1); recurse on tree parts
         ; (though this tries *all* phrases in tree, non-XPs stay unchanged)
 )); end of insert-np-gap-candidates


(defun insert-pp-gap-candidates (tree)
;````````````````````````````````````
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
;       it's expected to be the body of a 'sub' construct (indicating a filler-
;       pp-gap dependency, but with the gap(s) not yet identified)
;
; This marks the possible PP gaps in the body of a 'sub' context, using
; degrees of preference from 1 to 4 (i.e., markers (:xp 1), (:xp 2), (:xp 3),
; (:xp 4)), at all depths in tree, but bypassing lower-level 'sub' contexts
; (which cannot contain gaps corresponding to the current ({WH}PP ...) filler.
; 
; There seems to be a slight preference for phrase-final gap positions,
; for nested phrases; but within a phrase, proximity to the lexical head
; but *after* any NP complement seems preferred.
;     e.g., "About what did you talk _3?"
;           "To whom did you dedicate the book _3?"
;           "About which candidate are you claiming _2 that he lied _2?"
;           "the hungry masses about whom he writes _2 with such eloquence _1"
;           "With whom did you quarrel about it _2 (this morning) _1?"
;           "About what did you quarrel with him _2 (this morning) _1?"
;           "Of what are you most afraid _3?"
;           "Of what are you afraid _2 most of all _1 in the night _0?"
;           "To which foods is he allergic _3?"
;           "the friend of whom he became tired _2 after some quarrels"
;           "In what class is he _3?"
;           "Where is he _3?"  (vs "Where does he work?" OK answer: "Locally")
;           "Of which mountain is this a photograph _1?"  (supposedly no good)
;           "the kind of music of which this is an example _1"
;     So we can have gaps in VPs, APs, and (rarely) NPs
; 
; (All this is aborted if gap introduction was done previously --
; perhaps by other methods; i.e., if (-SYMB- *h) is present already in
; tree, except perhaps in subordinate 'sub' contexts, which we bypass. 
; This was already taken care of before any call to this program -- 
; see 'globally-insert-gaps1') 
;
; The preference strengths will be determined by function 'x_pp-pref!'
;
; We'll assume that proximity to the lexical head is preferred within the
; immediate complements, and rightmost for nested phrases.
;
; We'll use preferences like that, and in a separate program pick the most
; strongly preferred complement locus for each 'sub' context for inserting 
; (-SYMB- *h). We use the 'match' and 'fill-template' functions of TT+
;
 (let (tree1 ma) 
    (if (or (atom tree) (sub-construct tree)); bypass 'sub' constructs
        (return-from insert-pp-gap-candidates tree))
    (setq tree1
      (cond ; Verb lacking overt complements/adjuncts, other than perhaps an NP?
            ; e.g., "About what did you talk _3?"
            ; e.g., "To whom did you dedicate the book _3?"
            ; e.g., "With whom did you travel _2?"
            ((ok (setq ma (match '(VP (.VB !atom) ?[np]) tree)))
             (fill-template '(VP 2 3 (:xp (v_pp-pref! '2))) ma))

            ; (SQ ...) with subject/be inversion
            ; e.g., "In what class is she _3?"
            ((ok (setq ma (match '(.SQ (.VB .be) ?[advp] ![np] *[advp]) tree)))
             (fill-template '(1 2 3 4 (:xp 3.0) 5) ma))

            ; Question with NP after inverted subject NP -- attach PP to NN;
            ; "Of which mountain is this a photograph _?"
            ((ok (setq ma (match '(SQ (.VB .be) (NP +expr) (NP *expr (.NN !expr)))
                                 tree)))
             (fill-template '(1 2 3 (NP 4.2 
                                      (4.3.1 (-SYMB- n+preds) 4.3 (:xp 1.0))))))
            
            ; Verb with complements/adjunct(s)?
            ; e.g., "With whom did you discuss it _ yesterday at the meeting?"
            ; e.g., "About which candidate are you claiming _2 that he lied _2?"
            ((ok (setq ma (match '(VP (.VB !atom) ?[np] +[v-adjunct]) tree)))
             (fill-template '(VP 2 3 (:xp 2.0) 4) ma)); NB: '2' would cause error
            
            ; Predicate-taking verb followed by ... (ADJP (.JJ ...));
            ; E.g., "the song of which he has now become tired _"
            ; Because we may get e.g., (ADJP (VBN disapointed)), we allow
            ; any POS for the (presumed) adjective itself, using '!atom', not .JJ
            ((ok (setq ma (match '(VP (.VB !atom) (ADJP (!atom !atom))) tree)))
             (fill-template '(VP 2 (ADJP (3.2.1 3.2 (:xp 2.0)))) ma))
        
            ; Predicate-taking verb followed by ... (ADJP !expr (.JJ ...));
            ; E.g., "the song of which he's become so thoroughly tired _"
            ((ok (setq ma 
                    (match '(VP (.VB !atom) (ADJP !expr (.JJ !atom))) tree)))
             (fill-template '(VP 2 (ADJP (ADJP 3.2 (3.3.1 3.3 (:xp 2.0))))) ma))

            ; Now deal with possible ADJ+PP combinations, IN A VP CONTEXT.
            ; QUESTIONS CONTAINING COPULA "BE" BUT NO VP, AS IN "TO WHAT IS
            ; HE ALLERGIC?" ARE TREATED SEPARATELY BELOW (because the patterns
            ; are hard to treat uniformly, e.g., BLIPP may have AUX for the
            ; copula).
            ;
            ; Predicate-taking verb followed by ... (ADJP (.JJ ...)) ...;
            ; E.g., "the foods to which he's been allergic _ since childhood"
            ((ok (setq ma 
                   (match '(VP (.VB !atom) (ADJP (.JJ !atom)) +expr) tree)))
             (fill-template '(VP 2 (ADJP (3.2.1 3.2 (:xp 1.0))) 4) ma))

            ; Predicate-taking verb followed by ... (ADJP !expr (.JJ ...));
            ; "the foods to which he's been strongly allergic since childhood"
            ((ok (setq ma
                   (match '(VP (.VB !atom) (ADJP !expr (.JJ !atom)) +expr) tree)))
             (fill-template '(VP 2 (ADJP (ADJP 3.2 (3.3.1 3.3 (:xp 2.0))))4) ma))
       
            ; Questions with copular "be" and a PP gap;
            ; e.g., "To what is he (not) allergic, besides penicillin?" 
            ((ok (setq ma (match '(!atom (!atom .be) 
                                   ?expr ?expr (ADJP (.JJ !atom)) *expr) 
                                 tree)))
             (fill-template '(1 2 3 4 (ADJP (5.2.1 5.2 (:xp 1.0))) 6) ma))
            ; Cover the case of a premodified JJ:
            ((ok (setq ma
                       (match '(!atom (!atom .be) ?expr ?expr 
                                (ADJP !expr (.JJ !atom)) *expr) tree)))
             (fill-template '(1 2 3 4 (ADJP 5.2 
                                        (ADJP (5.3.1 5.3) (:xp 1.0))) 6) ma))
                       
            ; no top-level gap candidates -- tree1 is just tree
            (t tree)))

     ; Recurse on tree parts:
     (mapcar #'insert-pp-gap-candidates tree1)
     ; (though this tries *all* phrases in tree, non-XPs stay unchanged)
 )); end of insert-pp-gap-candidates


(defun insert-advp-gap-candidates (tree)
;```````````````````````````````````````
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
;       it's expected to be the body of a 'sub' construct (indicating a filler-
;       advp-gap dependency, but with the gap(s) not yet identified)
;
; This marks the possible ADVP gaps in the body of a 'sub' context, using
; degrees of preference from 1 to 4 (i.e., markers (:xp 1), (:xp 2), (:xp 3),
; (:xp 4)), at all depths in tree, but bypassing lower-level 'sub' contexts
; (which cannot contain gaps corresponding to the current ({WH}PP ...) filler.
; 
; There seems to be a slight preference for phrase-final gap positions,
; for nested phrases; but within a phrase, proximity to the lexical head
; but *after* any NP complement seems preferred, especially for "how"
; (not so much for "why" and attitudinal verbs).
;     e.g., "How did you do it _3?"   (an adv-a)
;     e.g., "I don't know why [[he thought [[this would happen] _2]] _3]" (adv-s)
;     e.g., "I know where he used to live _3 as a student"
;     e.g., "I don't know how he [expected Alice to [do it _2] without help _0]"
;     e.g., "How [can you [say that _2] _2]?"
;     e.g., "When did he say _2 he would call _3?"
;     e.g., "When do you expect the guests _3?"  -- odd! (time of expectation)
;     e.g., "I wonder why [he asked Alice to talk Bob into stealing the cow] _2"
; But I don't really know how to set the preferences in any straightforward way
; (except that [why SBAR] ("why he did it") prefers the gap after the SBAR).
;
 (let (tree1 ma)
    (if (or (atom tree) (sub-construct tree)); bypass 'sub' constructs
        (return-from insert-advp-gap-candidates tree))

    ; An ADVP gap will almost always be last in a VP; an exception
    ; can be verbs taking adverbial complements like "fare", "do";
    ; E.g., "How did you fare _ in the exam?" But compare to
    ;       "Why did you cheat on the exam?"
    ; Also perhaps temporal adverbials may follow a gap.
    ; E.g.,"Where do you buy your food these days?"
    ; Also maybe "how", "why" need separate treatment...

    (setq tree1
      (cond ; [Why SBAR] seems to prefer the gap after the SBAR (an adv-s),
            ; though for uniformity we make the gap the final VP constituent;
            ; "I don't know why [he thought [this would happen _2] _3]
            ; ** SOME GLITCH HERE? How can the S-complement of a why-clause 
            ;    LACKING A 'SUB' be an *h-insertion target?
            ((ok (setq ma (match '(SBAR (!atom (!atom why)) 
                                         (S +expr (VP +expr))) tree)))
             (fill-template '(SBAR 2 3 (S 3.2 (VP 3.3.2 (:xp 3.0)))) ma))

            ; Subject/be inversion; "Why is(n't) he happy?" "Where are you?"
            ((ok (setq ma (match '(.SQ (.VB .be) ?[advp] ![np] ?[pred] 
                                                               *[advp]) tree)))
             (fill-template '(1 2 3 4 5 (:xp 3.0) 6) ma))

            ; Verb with complements/adjunct(s)?
            ; e.g., "With whom did you discuss it _ yesterday at the meeting?"
            ; e.g., "About which candidate are you claiming _2 that he lied _2?"
            ((ok (setq ma (match '(VP (.VB !atom) ?[np] +[v-adjunct]) tree)))
             (fill-template '(VP 2 3 (:xp 2.0) 4) ma)); NB: '2' would cause error

            ; By default, add a gap candidate at the end of a VP ;
            ; e.g., "How did you do it _?"; "I know why he looks unhappy"
            ((ok (setq ma (match '(VP (.VB !atom) *expr) tree)))
             (fill-template '(VP 2 3 (:xp 2.0)) ma))

            ; no top-level candidate found, so tree1 is just tree:
            (t tree)))

    ; Recurse on tree parts:
    (mapcar #'insert-advp-gap-candidates tree1); recurse on tree parts
    ; (though this tries *all* phrases in tree, non-XPs stay unchanged)
 )); end of insert-advp-gap-candidates


(defun insert-adjp-gap-candidates (tree)
;```````````````````````````````````````
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
;       it's expected to be the body of a 'sub' construct (indicating a filler-
;       adjp-gap dependency, but with the gap(s) possibly not yet identified)
;
; This marks the possible ADJP gaps in the body of a 'sub' context, using
; degrees of preference from 1 to 4 (i.e., markers (:xp 1), (:xp 2), (:xp 3),
; (:xp 4)), at all depths in tree, but bypassing lower-level 'sub' contexts,
; which cannot contain gaps corresponding to the current ({WH}ADJP ...) filler.
; 
; There seems to be a preference for phrase-final gap positions,
; for nested phrases; but within a phrase, proximity to the lexical head
; but *after* any NP complement seems preferred.
; [** I'm puting a temporary '@' next to cases so far covered]
;  @  e.g., "How are you _?"
;  @  e.g., "Tell me how you are _."
;           [vs. ADVP gap, "Tell me how you are doing _."]
;  @  e.g., "How clever you are _!"
;  @  e.g., "How good are you _ (now) in math?"
;  @  e.g., "How good do you think she is (now) _ in math?"
;  @  e.g., "I know how eager he is _ (now) to participate."
;  @  e.g., "I know how eager he is _ for Mary to join the team."
;  @  e.g., "I know how easy it is _ (for him) to do it"
;  @  e.g., "How easy is it _ for him to do that?"
;  @  e.g., "I know how fond he is _ of his cat."
;  @  e.g., "How eager are you _ (now) to participate?" [infinitive VP]
;  @  e.g., "How eager are you _ for Mary to meet you?" [SBAR]
;  @  e.g., "How do you plead _?"
;  @  e.g., "How old are you _?"
;  @  e.g., "How old will you be _ tomorrow?"
;  @  e.g., "How old are you turning _?"
;  @  e.g., "I noticed how crimson he blushed _."
;  @  e.g., "Did you notice how red he got _ in the face?"
;  @  e.g., "I was scared by how dark the clouds turned _ in mere minutes."
;  @  e.g., "I'm aware of how angry that remark made him _."
;  @  e.g., "How long did the paper become _3 (in the end, when you submitted it)?"
;  @  e.g., "How tired did he seem _ to you?"
;  @  e.g., "How tired did he seem {_} to become _?"
;  @  e.g., "How eager did he seem _ to leave?"
;  @  e.g., "How eager did he seem _ for Mary to be hired?"
;  @  e.g., "I know how poor he is likely to remain _."
;  @  e.g., "I know how silly that must sound _ to you."
;  @  e.g., "How awful that smells _!"
;
 (let (tree1 ma)
    (if (or (atom tree) (sub-construct tree)); bypass 'sub' constructs
        (return-from insert-adjp-gap-candidates tree))
    (setq tree1
      (cond ; For (VP (AUX <be-verb>)) there's strong gap candidate
            ; (after the AUX); the subsequent cases subsume this, but
            ; I'm keeping the simple case separate, as it may eventually
            ; require a higher strength than if there are postmodifiers.
            ;
            ; But possibly the following 4 cases could be collapsed into 1
            ; e.g., "I wonder how she is _."
            ((ok (setq ma (match '(VP (!atom .BE)) tree)))
             (fill-template '(VP 2 (:xp 3.0)) ma))

            ; With following PPs or ADVPs, we still have a strong gap
            ; possibility (for now, also make it 3.0); e.g., "I wonder
            ; how she is _ today"; "I wonder how fond he is _ of his cat."
            ; (The ![advp] predicate covers bothe PPs and ADVPs)
            ((ok (setq ma (match '(VP (!atom .BE) +[advp]) tree)))
             (fill-template '(VP 2 (:xp 3.0) 3) ma))

            ; Even with a following infinitive, we may have a gap 
            ; (infinitive-taking adjectives, e.g., "I know how eager he 
            ; is _ (now) to participate":
            ((ok (setq ma (match '(VP (!atom .BE) ?[advp] (S ![inf])) tree)))
             (fill-template '(VP 2 (:xp 3.0) 3) ma))

            ; Another possibility is a following for-sentence, e.g., 
            ; "I know how eager he was _ for Mary to acknowledge him";
            ; (However, "easy" constructions get parsed the same way, e.g.,
            ; "How easy is it _ for him to acknowledge his mistake?",
            ; whereas here "for him" should be a constituent...
            ((ok (setq ma (match '(VP (!atom .BE) ?[advp] 
                                        (SBAR (IN FOR) (S +expr))) tree)))
             (fill-template '(VP 2 (:xp 3.0) 3 4) ma))
            
            ; The next cases are ones like "How are you _?", where we
            ; have an NP after a be-verb, and the parse contains 
            ;       (SQ (AUX ARE) (NP (PRP YOU))), 
            ; so a pattern (SQ (!atom .be) ![np]) will match.
            ;
            ; Again, the following 4 cases could be collapsed into 1,
            ; if the gap preference strengths can be kept at 3.0.
            ((ok (setq ma (match '(SQ (!atom .be) ![np]) tree)))
             (fill-template '(SQ 2 3 (:xp 3.0)) ma))

            ; With following PPs or ADVPs, we still have a strong gap
            ; possibility (for now, also make it 3.0); e.g., "How are
            ; you _ today after all that commotion?"
            ((ok (setq ma (match '(SQ (!atom .be) ![np] +[advp]) tree)))
             (fill-template '(SQ 2 3 (:xp 3.0) 4 5) ma))

            ; Even with a following infinitive, we may have a gap 
            ; (infinitive-taking adjectives), e.g., "How eager is he _
            ; to join the company?"
            ((ok (setq ma (match '(SQ (!atom .be) ![np] ?[advp] ![inf]) tree)))
             (fill-template '(SQ 2 3 (:xp 3.0) 4 5) ma))

            ; Again another possibility is a following for-sentence, e.g., 
            ; "I know how eager he was _ for Mary to acknowledge him"
            ((ok (setq ma (match '(VP (!atom .BE) ![np] ?[advp] 
                                        (SBAR (IN FOR) (S +expr))) tree)))
             (fill-template '(VP 2 3 (:xp 3.0) 4 5) ma))

            ; Now deal with non-be-verbs -- I ran the ULF parser on the 
            ; listed examples  in the comments above to get this 
            ; approximately right. ADJP-taking verb as only complement;
            ; E.g., "How old are you turning tomorrow?"
            ((ok (setq ma (match '(VP (.vb !atom) *[advp]) tree)))
             (fill-template '(VP 2 (:xp (v_ap-pref! '2)) 3) ma))
           
            ; Verb of type v_np_ap; e.g., "... how angry that made him _":
            ((ok (setq ma (match '(VP (.vb !atom) ![np] *[advp]) tree)))
             (fill-template '(VP 2 3 (:xp (v_np_ap-pref! '2)) 4) ma))

            ; Eager-construction with non-be verbs; e.g., "How eager 
            ; did he seem _ to leave?". The inf-VP is parsed as 
            ; (S (VP (AUX (TO TO)) (VP (VB LEAVE))))
            ((ok (setq ma (match '(VP (.vb !atom) *[advp] (S ![inf])) tree)))
             (fill-template '(VP 2 (:xp (v_ap-pref! '2)) 3) ma))

            ; "How eager does he seem at the meeting for Mary to join the team?"
            ; The VP[seem] parse produced by BLLIP: 
            ; (VP (VB SEEM) (SBAR (IN FOR) (S (NP ...) (VP (AUX (TO TO)) ...))))
            ((ok (setq ma (match '(VP (.vb !atom) *[advp] 
                                     (SBAR (IN FOR) (S ![np] ![inf]))) tree)))
              (fill-template '(VP 2 (:xp (v_ap-pref! '2)) 3 4) ma))

            ; No top-level gap candidates found, so tree1 is just tree
            (t tree)))

     ;recurse on the parts of tree1
     (mapcar #'insert-adjp-gap-candidates tree1)
     ; (though this tries *all* phrases in tree, non-XPs stay unchanged)
 )); end of insert-adjp-gap-candidates


; TBC: I was about to do 'insert-vp-gaps', but this seems to occur only in
; TOPICALIZATION. Some forms of topicalization are currently not properly
; parsed by BLLIP -- it simply has an initial phrase, then a comma, then
; subject and verb (& maybe more), with the subject sometimes as NN instead
; of NP. I'll need preprocessing rules that insert 'sub' -- and perhaps
; *h directly as well, though that won't work for "Mary, they want Bill
; to meet _ as soon as possible". Before doing this, complete insertion
; of *h for the nontopicalized cases: 'delete-inferior-gap-candidates',
; [I've worked some more on this since writing the above.]

(defun insert-vp-gap-candidates (tree)
;````````````````````````````````````
; [I decided to put in a rudimentary version to try to deal with certain
; cases in the Brown corpus]
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
;       it's expected to be the body of a 'sub' construct (indicating a filler-
;       vp-gap dependency, but with the gap(s) possibly not yet identified)
;
; This marks just one possible VP gap in the body of a 'sub' context, using
; degrees of preference 3 (i.e., marker (:xp 3)) at the end of a VP, but
; bypassing lower-level 'sub' contexts, which cannot contain gaps corresponding 
; to the current (VP ...) filler.
; 
; Brown example:
; "Also being treated are Houston, Bleckley, Tift, Turner and Dodge counties, 
; Blasingame said." The entire segment "Also ... counties" gets treated as
; a VP to be inserted in "Blasingame said". So tree corresponds to the latter.
;
 (let (tree1)
      (if (or (atom tree) (sub-construct tree)); bypass 'sub' constructs
          (return-from insert-vp-gap-candidates tree))
      (setq tree1
            (apply-rule '((S *expr (NP +expr) *expr (VP *expr (.vb !atom)))
                          (S 2 3 4 (VP 5.2 5.3 (:xp 3)))) tree))
      (if (not (equal tree1 tree)); successful insertion of (:xp 3)
          tree1
          ; otherwise try treating the gap as an ADVP gap
          (insert-advp-gap-candidates tree))
 )); end of insert-vp-gap-candidates
 

(defun retain-strongest-gap-candidate (tree); May 2/21
;```````````````````````````````````````````
; Find  and retain only the strongest gap candidate (:xp i ...) in 'tree',
; not within a sub-construct; return (i tree'), where i is the strength
; of the strongest candidate (-1 if there is none) and tree' is the modified
; tree. 
;
; If there are multiple candidates (:xp 3 1) of maximal strength i, only
; the rightmost is retained, because this is intended for eliminating all
; but one gap candidate from a conjunct in a coordinate structure, and there's
; a general rightmost-preference for gaps..
;
; Note: Any :xp in tree must be followed by a number, or there'll be errors.
;
 (let (i+tree1 j+tree2 i j tree1 tree2)
      (cond ((atom tree) (list -1 tree))
            ((eq (car tree) :xp) (list (second tree) tree))
            ((sub-construct tree) (list -1 tree)); bypass sub-construct
            (t (setq i+tree1 (retain-strongest-gap-candidate (car tree)))
               (setq j+tree2 (retain-strongest-gap-candidate (cdr tree)))
               (setq i (car i+tree1) j (car j+tree2))
               (setq tree1 (second i+tree1) tree2 (second j+tree2))
               (cond ((and (= i -1) (= j -1)); no (:xp ...) in car or cdr of tree
                      (list -1 tree))
                     ((and (> i -1) (= j -1)); only (car tree) had an (:xp ...)
                      (list i (cons tree1 tree2)))
                     ((and (> j -1) (= i -1)); only (cdr tree) had an (:xp ...)
                      (list j (cons tree1 tree2)))
                     (t ; i, j > -1, so both car & cdr of tree have an (:xp ...)
                      (if (>= j i); NB: This gives rightward preference for i=j 
                          (if (eq (car tree1) :xp); omit tree1 (:xp k ...), j>=k
                              ; this drops weak, & non-rightmost strong :xp i ...)
                              (list j (delete-weaker-gap-candidates j tree2))
                              (list j 
                                (cons (delete-weaker-gap-candidates (+ j 1) tree1)
                                ; NB: We use j+1 in deleting because we also want
                                ;     to delete (on the left) in the case i=j
                                      (delete-weaker-gap-candidates j tree2))))
                          ; i > j
                          (list i (cons (delete-weaker-gap-candidates i tree1)
                                        (delete-weaker-gap-candidates i tree2))))))
            ))
 )); end of retain-strongest-gap-candidate
                    

(defun delete-weaker-gap-candidates (imax tree); briefly tested Apr 15/21
;````````````````````````````````````````````` 
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
;       it's expected to be either the body of a 'sub' construct (indicating
;       a filler-gap dependency), or part of a conjunct of a conjunction
;       from which all (:xp ...) outside sub-constructs are to be dropped.
;
;       In the first case, when this routine is called, gap candidates are
;       already marked in the manner (xp i l), where i is a gap strength
;       (preference), and l is an occurrence index; imax is expected to be
;       the maximum gap strength among the gap candidates in tree, where
;       for coordinated and parasitic gaps the candidates have already been
;       equalized in gap strength and occurrence index.
;
;       For the second use, imax is expected to be greater than the i in 
;       any (:xp i ...), so all candidates from tree outside sub-constructs
;       are eliminated.
;
; Delete gap candidates with preference strengths < imax, returning the
; altered tree; but avoid 'sub' contexts embedded within tree.
;
 (let (tree1)
      (if (atom tree) tree
          (cond ((and (eq (car tree) :xp) (eq (second tree) imax))
                 tree) ; retain a maximally preferred gap cadidate;
                ((sub-construct tree) tree); sub context: no change

                ; tree is not an atom or a maximally preferred gap candidate;
                ; remove non-maximally strong candidates at the top level 
                ; (so they won't be recursed upon):
                (t (setq tree1
                    (remove-if
                     #'(lambda (x)
                        (and (listp x) (eq (car x) :xp)
                             (not (equal (second x) imax))))
                      tree))
                   ; now we can recurse "safely":
                   (mapcar
                    #'(lambda (x) (delete-weaker-gap-candidates imax x))
                    tree1))))
 )); end of delete-weaker-gap-candidates
         

(defun position-index-of-rightmost-gap-candidate (tree)
;`````````````````````````````````````````````````````
; When weaker gap candidates have been deleted, those with the highest
; position index may have been deleted, and we need to recompue that index.
;
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
;       it's expected to be the body (4th el.) of a 'sub' construct (indicating
;       a filler-gap dependency). When this routine is called, correlated gap
;       candidates have already been equalized in their strengths and indices,
;       and candidates of less than maximum strength have already been deleted.
;       But there may still be multiple candidates, all of maximum strength.
;       These remaining candidates are marked (xp imax l) for potentially
;       different l-values, where imax is the gap strength (preference) of 
;       these gaps. We find the maximal l.
  (let ((lmax -1))
       (cond ((atom tree) -1)
             ((eq (car tree) :xp) 
              (if (> (third tree) lmax) (third tree) lmax))
             (t (apply 'max 
                 (mapcar #'position-index-of-rightmost-gap-candidate tree))))
 )); end of position-index-of-rightmost-gap-candidate
             

(defun confirm-rightmost-gap-candidates (lmax tree); briefly tested Apr 14/21
;````````````````````````````````````````````````
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
;       it's expected to be the body (4th el.) of a 'sub' construct (indicating
;       a filler-gap dependency). When this routine is called, correlated gap
;       candidates have already been equalized in their strengths and indices,
;       and candidates of less than maximum strength have already been deleted.
;       But there may still be multiple candidates, all of maximum strength.
;       These remaining candidates are marked (xp imax l), where imax is the
;       gap strength (preference) of these gaps. It remains to get rid of
;       candidates that don't have the highest index, lmax.
; lmax: maximum (rightmost) index of gap candidates, where correlated gap
;       candidates on the left already have the rightmost occurrence index 
;       among the correlated (coordinated or parasitic gap) candidates.
;
; Delete gap candidates with occurrence index < lmax, replace those with
; occurrence index = lmax by (-SYMB- *h); but avoid 'sub' contexts embedded
; within tree. Note that we have to allow for gaps being at arbitrary depths.
;
 (let (tree1)
      (if (atom tree) tree
          (cond ((and (eq (car tree) :xp) (eq (third tree) lmax)) 
                 '(-SYMB- *h)); replace rightmost candidate by standard gap
                ((sub-construct tree) tree); sub context: no change
                 
                ; tree is not an atom or a rightmost gap candidate;
                ; remove non-rightmost candidates at the top level 
                ; (so they won't be recursed upon):
                (t (setq tree1
                    (remove-if 
                     #'(lambda (x) 
                        (and (listp x) (eq (car x) :xp) 
                             (not (eq (third x) lmax))))
                      tree))
                   ; now we can recurse "safely":
                   (mapcar 
                    #'(lambda (x) (confirm-rightmost-gap-candidates lmax x))
                    tree1))))
 )); end of confirm-rightmost-gap-candidates
            

(defun assign-indices-to-gap-candidates (i+l+tree); Oct 29/20 briefly tested
;`````````````````````````````````````````````````
; i+l+tree: a list of form (i l tree), where i, l are integers and tree is
;       a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
;       it's expected to be the body of a 'sub' construct (indicating a filler-
;       hole dependency, with possible trace/hole positions marked in the
;       manner (:xp i), where i is in {0, 1, 2, 3, 4}, indicating preference
;       for a hole variable (*h) in that location. The tree has already been
;       determined to contain at least 2 gap-candidates.
; i:    In i+l+tree, i is the highest i (for some (:xp i)) outside of tree 
;       seen before this call; and l is the highest occurrence index outside 
;       of tree seen so far;
; The routine is initially called with i = -1 and l = -1. In the recursion,
; tree in i+l+tree can be a list of tree constituents.
;
; Result: replacement of all (:xp i) by (:xp i l) lying outside of any 'sub'
;       contexts, where l is the occurrence index (starting at 0) of the 
;       candidate in a depth-first, left-to right traversal of tree; we return 
;             (imax lmax modified-tree),
;       where imax is the largest i (gap preference strength) for candidates
;       (:xp i) encountered and lmax is the largest occurrence index assigned.
 (let ((i (car i+l+tree)) (l (second i+l+tree)) (tree (third i+l+tree))
       result1 result2 i1 i2 l1 l2 tree1 tree2)
      (cond ((atom tree) i+l+tree)
            ;
            ; XP-gap candidate?
            ((eq (car tree) :xp)
             (if (> (second tree) i) (setq i (second tree)))
             (incf l)
             (list i l `(:xp ,(second tree) ,l)))
            ;
            ; another constituent of form (atom atom)? Return i+l+tree
            ((and (atom (car tree)) (atom (cadr tree)) (null (cddr tree)))
             i+l+tree)
            (t (setq result1 (assign-indices-to-gap-candidates 
                     (list i l (car tree))))
               (setq i1 (car result1) l1 (second result1) tree1 (third result1))
               (setq result2 (assign-indices-to-gap-candidates 
                     (list i1 l1 (cdr tree))))
               (setq i2 (car result2) l2 (second result2) tree2 (third result2))
               (list i2 l2 (cons tree1 tree2))))
 )); end of assign-indices-to-gap-candidates


(defun equalize-coordinated-gap-candidates (tree); briefly tested Apr 14/21
;```````````````````````````````````````````
; tree: a syntactic phrase structure in Treebank parser (e.g., BLLIP) format;
;       it's expected to be the body of a 'sub' construct (indicating a filler-
;       gap dependency, with candidate trace/gap positions marked in the
;       manner (:xp i l), where i is in {0, 1, 2, 3, 4}, indicating preference
;       for a gap variable (*h) in that location, and l is the left-to-right
;       occurrence index of the candidate. E.g., "Which car did he choose and
;       pay for?"
;        (SBARQ (-SYMB- SUB) (WHNP (WDT WHAT) (NN CAR))
;          (SQ (AUX DID) (NP (PRP HE))
;              (VP (VP (VB CHOOSE) (:XP 3 2)) 
;                  (CC AND) (VP (VB PAY) (PP (IN FOR) (:XP 4 3))))))
;       Here the (:XP 3 2) will we changed to (:XP 4 3), i.e., strength
;       4 and position 3 (as far right as the second conjunct)
;      
; Result: gap candidates within the conjuncts of a conjunction (and not 
;       inside sub-constructs in tree), for any conjunction somehwere 
;       in 'tree', will be modified to have identical (:xp i l) markings, 
;       where i and l are the previous maxima among the linked candidates; 
;       thus preference strength i of a candidate may be boosted thanks to
;       its linkage to a stronger candidate, and l will be boosted to the
;       righmost occurrence index among linked candidates (i.e., it will be
;       as if all linked candidates were packed to the rightmost position
;       among them; this will be used to prevent deletion of linked gap
;       candidates to the left of their righmost correlate.)
; Method: If there are no coordinators in tree, return tree.
;       Otherwise, for each coordinate structure outside
;       any 'sub' contexts, determine whether each constituent contains a gap
;       candidate; if not, go on to the next such structure (or return tree,
;       if there are no more); if so, make copy of the structure, send the
;       copy to 'link-gap-candidates' (which inserts the link indices and max'es
;       candidate strengths) and substitute it for the original structure ...
;       ** hmm, I need to think about that subroutine before proceeding here ...
;
 (let (result check imax lmax cand result1)
      ; This is best done with TT+ pattern matching: 
      ; (.XP-OR-S +expr (CC !atom) (.XP-OR-S +expr)); poss. coordinated gaps
      ;      `````this +expr could be comma-separated conjuncts
      ;
      ; (VP ?expr (.VB !atom) ?expr (PP (IN !atom) +expr)); poss. parasitic gap
      ; **TBC -- USE SEPARATE PROGRAM FOR THE LATTER
      ;
      ; Use find-patt-inst routine in TT+ to see if there are coordinated phrases
      (setq result (find-patt-inst '(CC !atom) tree))
      (if (null result) (return-from equalize-coordinated-gap-candidates tree))
      ; If there are, do a more detailed match, avoiding 'sub' contexts, and
      ; ensuring that all conjuncts contain an (:xp ...) instance; if found, 
      ; transduce the tree to equalize the gap candidates in the conjuncts;
      (setq result 
            (find-open-patt-inst 
                '(.XP-OR-S +expr (CC !atom) ?[advp] (.XP-OR-S +expr)) tree))
                           ;`````           ```````
                 ; maybe multiple conjuncts, maybe commas, errant advp, etc.
      (if (null result) (return-from equalize-coordinated-gap-candidates tree))

      ;'result' is a conjunction somewhere within 'tree', and not within
      ; a sub-construct; check if every conjunct contains a gap candidate
      ; (outside any 'sub' context), at some level
      ;
      ; Delete all but the strongest candidate in each conjunct (with
      ; further-right preferred) before finding the optimal candidate 
      ; over all conjuncts:
      (setq result1
            (mapcar 
              #'(lambda (x) (cadr (retain-strongest-gap-candidate x)))
               result)); 'retain-strongest-gap-candidate' produces results 
                       ; of form (i expr), where i = -1 if there's no 
                       ; (:xp ...) in expr; 'cadr' removes these indices
      (setq check 
            (mapcar 
              #'(lambda (x) 
                 (or (atom x) ; bypass atoms and lexical elements
                     (ok (match '(!atom !atom) x))
                     (find-open-patt-inst '(:xp +atom) x))) result1))
;     (format t "~%@@@ result of mapping find-open-patt-inst to ~%    ~s" result1); DEBUG
;     (format t "~%is~%    ~s" check) ; DEBUG
      ; 'check' will contain an (:xp ...) instance from conjuncts
      ; that subsume such an instance, or NIL for ones that don't
      (when (not (find nil check)); do all conjuncts contain :xp?
            ; 'check' contains the first (:xp i l) from each conjunct
            ; (betting on the first being a "good enough choice", if
            ; there's more than one candidate gap per conjunct!).
            ; We pick the largest i and largest l and substitute the
            ; corresponding (:xp i l) for all such occurrences in result.
            ; Then we substitute the altered result for result in tree.
            (setq imax 
                  (apply #'max 
                    (mapcar 
                      #'(lambda (x) (if (eq (match '(:xp +atom) x) :nil)
                                        -1 (second x))) check)))
            (setq lmax
                  (apply #'max 
                    (mapcar 
                      #'(lambda (x) (if (eq (match '(:xp +atom) x) :nil)
                                        -1 (third x))) check)))
            (setq cand (list :xp imax lmax))

            ; NB: To substitute 'cand' for other occurrences of 
            ;     (:xp <number> <number>), we cannot use rule
            ;     application with a rule of form 
            ;        ((:xp !atom !atom) cand),
            ;     because 'cand' contains numbers that will be
            ;     interpreted as indices of components of the match
            ;     result. Another point to note: In making the
            ;     substitutions, we guard against substituting for
            ;     a gap candidate of form (:xp <number>), i.e., 
            ;     without a left-to-right position index as third
            ;     element, just in case we "break into" 'sub' contexts
            ;     in which *h-insertion hasn't been completed yet,
            ;     i.e., in which position indices remain to be inserted
            ;     (even though this would only occur if there was some
            ;     error in the bottom-up *h-insertion process into
            ;     a sentential ULF).
            ;   
            (setq result1 ; equalize an (:xp ..) constituent of each conjunct
                  (subst-if cand 
                    #'(lambda (x) 
                        (and (listp x) (= (length x) 3) (eq (car x) :xp)))
                     result1))
;       (format t "~%@@@@ result = %    ~s~%@@@@ result1 = %    ~s" result result1)
                                                ;```````````````DEBUG
            (return-from equalize-coordinated-gap-candidates
              (subst result1 result tree :test #'equal))
         ); end when
         (format t "~% ## At least one conjunct in the following conjunction")
         (format t "~%    didn't contain the required gap candidate: ~
                    ~%    ~a" result)
         tree ; at least one conjunct didn't contain a gap candidate
 )); end of equalize-coordinated-gap-candidates

   ; TBC Then similarly for possible parasitic gaps, VP+PP (usually the PP
   ; will be a verb sister in BLLIP (also Brown??) ...



(defun find-open-patt-inst (patt expr); Oct 30/20; briefly tested Apr 14/21
;````````````````````````````````````
; A variant of the TT function find-patt-inst that avoids 'sub' contexts
; in searching for a match to patt.
; expr: expected to be the body (4th element) of a 'sub' construct
 (prog (result results)
       (setq result (match patt expr)) ; top-level -- can't be a 'sub' context
       (if (ok result) (return expr))
       (if (atom expr) (return nil))
       ; Is this a 'sub' construct (4 elements, with 2nd element = (-SYMB- sub))?
       ; (But for robustness, allow extra 5th element, e.g., punctuation)
       (if (sub-construct expr) (return nil)); no match allowed in 'sub' contexts
       ; It's not a 'sub' construct:
       (setq results (mapcar #'(lambda (x) (find-open-patt-inst patt x)) expr))
       (setq result (find-if #'(lambda (x) x) results)); leftmost non-nil result
       (return result)
 )); end of find-open-patt-inst


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Miscellaneous examples for testing the gap isertion code.

; Example for testing (coordinated gaps, strength marking only)
; [This is processed correctly by 'globally-insert-gaps' if the (:xp 2) & (:xp 3)
; are removed; when they're present, they subvert the pattern matching, and for
; some reason get excised altogether. That may be something to be looked into,
; if we expect that candidate markings may already be present in some cases.]
(setq coordinated-gap-tree
'(SBARQ
  (SBARQ (-SYMB- SUB) (WHNP (WP WHOM))
   (SQ (AUX DID) (NP (PRP YOU))
    (VP (VP (VB APPROACH) (:xp 2) (CC AND) (VP (VB TALK) (PP (TO TO) (:xp 3))))))
  (\. ?))) ) ; bad example: (\. ?) isn't top-level! **Check rules for moving \. out
        ; However, my programs now only check whether element #2 = (-SYMB- sub)

; A subtree of the above and susbsubtree of the above, with added position indices:
; [Probably no longer needed for testing]
(setq subtree
 '(SQ (AUX DID) (NP (PRP YOU))
    (VP (VP (VB APPROACH) (:xp 2 3) (CC AND) (VP (VB TALK) (PP (TO TO) (:xp 3 5)))))))

(setq subsubtree
 '(VP (VP (VB APPROACH) (:xp 2 3) (CC AND) (VP (VB TALK) (PP (TO TO) (:xp 3 5))))))

; without the gaps: [corrctly processed by 'globally-insert-gaps' -- see above]
(setq coordinated-gap-tree~
'(SBARQ
  (SBARQ (-SYMB- SUB) (WHNP (WP WHOM))
   (SQ (AUX DID) (NP (PRP YOU))
    (VP (VP (VB APPROACH) (CC AND) (VP (VB TALK) (PP (TO TO) )))))
  (\. ?))) )

; Temp test tree (coordinated gap candidates, strength markings only):
(setq coordinated-gap-tree1
'(SBARQ
  (SBARQ (-SYMB- SUB) (WHNP (WP WHAT))
   (SQ (AUX DO) (NP (PRP YOU)) (VP (VBP SEE) (:xp 2) (CC AND) (VBP HEAR) (:xp 3))))
  (\. ?)) )

; without the gaps: [***ONLY THE FIRST GAP IS INSERTED!! IT'S BECAUSE OF THE
;    LACK OF A COORDINATED VP FOR THE SECOND CONJUNCT.
(setq coordinated-gap-tree1~
'(SBARQ
  (SBARQ (-SYMB- SUB) (WHNP (WP WHAT))
   (SQ (AUX DO) (NP (PRP YOU)) (VP (VBP SEE) (CC AND) (VBP HEAR) )))
  (\. ?)) )

; Temp test tree for subordinate sub within a sub (strength & position markings):
; "What car did the man whom you watched steal?" [see 2nd & 3rd version]
(setq embedded-sub-tree1; embedded gap already inserted 
'(SBARQ
  (SBARQ (-SYMB- SUB) (WHNP (WP WHAT) (NN CAR))
   (SQ (AUX DID)
    (NP (DT THE)
     (NN (-SYMB- N+PREDS) (NN MAN)
      (SBAR (-SYMB- SUB) (WHNP (WP-REL WHOM))
       (S (NP (PRP YOU)) (VP (VBD WATCHED) (-SYMB- *H))))))
    (VP (VB STEAL) (:XP 3 1))))
  (\. ?)) )

(setq embedded-sub-tree2; ['globally-insert-gaps' works correctly on this]
'(SBARQ
  (SBARQ (-SYMB- SUB) (WHNP (WP WHAT) (NN CAR))
   (SQ (AUX DID)
    (NP (DT THE)
     (NN (-SYMB- N+PREDS) (NN MAN)
      (SBAR (-SYMB- SUB) (WHNP (WP-REL WHOM))
       (S (NP (PRP YOU)) (VP (VBD WATCHED))))))
    (VP (VB STEAL))))
  (\. ?)) )

; no sub and no gaps [testing awaits 'sub'-insertion rules] 
(setq question-with-embedded-relative-gap
'(SBARQ
  (SBARQ (WHNP (WP WHAT))
   (SQ (AUX DID)
    (NP (DT THE)
     (NN (-SYMB- N+PREDS) (NN MAN)
      (SBAR (NP (PRP YOU)) (VP (VBD WATCHED)))))
    (VP (VB STEAL))))
  (\. ?)) )

; Temporary test examples -- parasitic & coordinated gap candidates (fully marked)
(setq parasitic-gap-tree
'(SBARQ
  (SBARQ (-SYMB- SUB) (WHNP (WP WHOM))
   (SQ (AUX DID) (NP (PRP YOU))
    (VP (VB HIRE) (:xp 3 4)
     (PP (IN WITHOUT) (S (VP (VBG INTERVIEWING) (:xp 3 5)))))))
  (\. ?)) )

; without the gaps:
(setq parasitic-gap-tree~
'(SBARQ
  (SBARQ (-SYMB- SUB) (WHNP (WP WHOM))
   (SQ (AUX DID) (NP (PRP YOU))
    (VP (VB HIRE) 
     (PP (IN WITHOUT) (S (VP (VBG INTERVIEWING) ))))))
  (\. ?)) )

; [unnecessary, as 'globally-insert-gaps' does the full processing correctly]
(setq coordinated-gap-tree2
'(S
  (S (NP (PRP I))
   (VP (VBD MET)
    (NP (DT THE)
     (NN (-SYMB- N+PREDS) (NN PROGRAMMER)
      (SBAR (WHNP (WP-REL WHO))
       (S (NP (PRP YOU))
        (VP (VP (AUX WERE) (ADJP (JJ ENTHUSIASTIC) (PP (IN ABOUT) (:xp 4 0))))
         (CC AND) (VP (VBN HIRED) (:xp 3 1)))))))))
  (\. \.)) )

; without gaps or 'sub': [testing awaits sub-insertion rules]
(setq coordinated-gap-tree2~
'(S
  (S (NP (PRP I))
   (VP (VBD MET)
    (NP (DT THE)
     (NN (-SYMB- N+PREDS) (NN PROGRAMMER)
      (SBAR (WHNP (WP-REL WHO))
       (S (NP (PRP YOU))
        (VP (VP (AUX WERE) (ADJP (JJ ENTHUSIASTIC) (PP (IN ABOUT) )))
         (CC AND) (VP (VBN HIRED) ))))))))
  (\. \.)) )

; without gaps but with 'sub': ['globally-insert-gaps' correctly inserts 2 gaps]
(setq coordinated-gap-tree2~~
'(S
  (S (NP (PRP I))
   (VP (VBD MET)
    (NP (DT THE)
     (NN (-SYMB- N+PREDS) (NN PROGRAMMER)
      (SBAR (-SYMB- sub) (WHNP (WP-REL WHO))
       (S (NP (PRP YOU))
        (VP (VP (AUX WERE) (ADJP (JJ ENTHUSIASTIC) (PP (IN ABOUT) )))
         (CC AND) (VP (VBN HIRED) ))))))))
  (\. \.)) )

; Challenge sentence for gap insertion (no sub and no gap)
"Did the man you were watching leave?"

; ['globally-insert-gaps *probably* works correctly for this]
(setq question-with-deep-gap
'(SQ
  (SQ (AUX DID)
   (NP (DT THE)
    (NN (-SYMB- N+PREDS) (NN MAN)
     (SBAR (-SYMB- sub) (WHNP (WP-REL THT))
           (S (NP (PRP YOU)) (VP (AUX WERE) (VP (VBG WATCHING)))))))
   (VP (VB LEAVE)))
  (\. ?)) )

; with sub: ['globally-insert-gaps' works correctly for this]
(setq question-with-deep-gap1
'(SQ
  (SQ (AUX DID)
   (NP (DT THE)
    (NN (-SYMB- N+PREDS) (NN MAN)
     (SBAR (-SYMB- sub) (WHNP (WP-REL THT)) 
           (S (NP (PRP YOU)) (VP (AUX WERE) (VP (VBG WATCHING)))))))
   (VP (VB LEAVE)))
  (\. ?)) )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; May 2/21 examples, with gap insertion included in 'preprocess-tree-for-ulf'
; but with further rules for inserting (-SYMB- sub) still to be added:

; "Who did you think you saw?" (:-)
;
; ((SUB WHO.PRO~2
;   (DID.AUX~3 YOU.PRO~4
;    (THINK.V~5 (THT (YOU.PRO~7 ((PAST SEE.V~8) *H))))))
;  ?)


; "Whom did you approach and talke to?" (:-) ok as of May 21/21
;
; (SBARQ
;  (SBARQ (-SYMB- SUB) (WHNP (WP WHOM))
;   (SQ (AUX DID) (NP (PRP YOU))
;    (VP (VP (VB APPROACH)) (CC AND) (VP (VB TALK) (PP (TO TO))))))
;  (\. ?))
; 
; ((SUB WHOM.PRO~2
;  (DID.AUX~3 YOU.PRO~4
;   ((APPROACH.V~5 *H) AND~7 (TALK.V~8 (TO.P~9 *H)))))
; ?)
;
; "What did the man whom I hired complain about?"  (:-) ok as of May 21/21
;
; ((SUB WHAT.PRO~2
;   (DID.AUX~3
;    (THE.D~4
;     (N+PREDS MAN.N~6 (SUB WHOM.REL~8 (I.PRO~9 ((PAST HIRE.V~10) *H)))))
;    (COMPLAIN.V~12 (ABOUT.P~13 *H))))
;  ?)
