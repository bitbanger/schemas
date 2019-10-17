; A temporary expedient until the preprocessing in ~schubert/lf* is working
; reliably: override the preprocess routine in the latter with the following.

(defparameter *particle-like-adverbs* '(
))

(defun refine-parse-tree (tree) (preprocess-tree tree))
; {Renaming for the MKAM environment)


(defun preprocess-tree (tree); Mar 25/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Preprocess a "raw" Treebank tree to 
; - delete ( ) constituents (relevant to Brown Corpus, which seems to use
;   these as a kind of subconstituent demarcation, in a way that I don't
;   understand and don't see as helpful)
; - change ((S ...) (\. ...)) to (S ... (\. ...)) (relevant to Brown Corpus)
; - delete quotes and braces (which delimit essential editorial insertions)
; - change (VB gotta) to (MD gotta)
; - change sequences of constituents 
;        (AUX (<x> <word>)) ...  where <x> = VB, VBZ, VBD, ..., TO, MD,
;   to VPs of form
;        (VP (AUX<x-ending> <word>) ...)
;   where (respectively) AUX<x-ending> = AUX, AUXZ, AUXD, ..., TO, MD
; - replace VBN by VBEN for *non-passive* past participles, as indicated by
;   an immediately embedding HAVE (note: this bypasses BE VBN forms, etc.)
;   Subsequently we'll be able to treat VBN as passive.
; - replace the POS's of auxiliary forms of `have', non-copular `be' and 
;   `do' by AUX, AUXD, AUXG, AUXEN, AUXP, or AUXZ; at present, the aux-
;   identification is done by looking for verbs with a VP complement, 
;   possibly with an intervening RB or ADVP; thus "is happy", "is a man" 
;   are *not* marked as auxiliary; [but Charniak makes these AUX!]
; - replace the POS's of copular `be' by BE, BED, BEG, BEEN, BEP, BEZ;
;   maybe I should deal analogously with `seem', `become', `grow', `turn',
;   ..., though these don't, for example, allow an immediately following
;   adverb n't, not, never, etc.
; - assimilate verb particles into the verb (e.g., (VP (VB give) (NP ...) 
;   (PRT (RP up))) and likewise (VP (VB give) (PRT (RP up)) (NP ...)) 
;   become (VP (VB give up) (NP ...)).);
; - replace cliche nested PPs by multiword Ps, e.g., `in charge of',`by 
;   means of', `for lack of' are replaced by 3-word prepositions
; - particularize PPs to show the preposition involved, e.g., PP-OF, PP-TO,
;   etc., and further particularize to PP-AT-TIME, PP-IN-TIME for evident
;   temporal PPs (as judged from the NP); also change (PP (TO TO) ...) to 
;   (PP-TO (IN TO) ...) (since the WSJ annotations don't distinguish 
;   preposition TO and verb TO!); 
; - replace SBAR by particular types such as S-THAT, S-SINCE (a clausal
;   adverbial), S-WHNP (a wh-nominal or relative clause) S-REL (a likely
;   relative clause), etc.
; - replace S by S-INF if it is actually an infinitive VP and by S-NONE if
;   it is empty
; - replace VP by VP-INF if it is an infinitive VP (This is important
;   in phrases like "found to be defective", which may be parsed as
;   a VBN followed by a VP, rather than followed by SBAR.
; - replace subjectless S (occurring in relclauses) by S-NO-SUBJ
; - replace NPs that are actually genitive determiners (as indicated by 
;   last constituent (POS |'S|)) by a DETP consisting of a NP and (POS |'S|);
;   in Brown, unfortunately the NP + \' or \'S determiner are treated as 
;   sisters of the remaining NP constituents, so these also need to changed
;   to (DETP (NP ...) (POS ...))
; - replace prenominal participles in NPs by adjectives
; - replace NP by NP-TIME for evident temporal NPs
; - in NPs replace any sequence beginning with and ending in an NNP by a single
;   NNP realized as a sequence of words; also, change any non-NN(S) constituents
;   (e.g., JJ) between an NNP(S) and the head NN(S) to NN, since we want to
;   treat these as noun "classifiers", just like premodifying nouns; e.g., (JJ
;   FOREIGN) in (NP (NNP NEW ZEALAND) (JJ FOREIGN) (NN EXCHANGE) (NNS MARKETS))
;   becomes (NN FOREIGN).
;   Note: nested NN(S)-premodifiers are not grouped together syntactically;
;   ~~~~~ they are treated as iterated modifiers in the semantics, but when
;         NP meanings are abstracted, nested nn-premodifiers are collapsed
;         into a flat sequence.
; - expand possessive determiners like "his", "our", or "whose" into DETP
;   phrases (consisting of a pronomonal NP and a POS) for easy interpretation;
; - replace (WP ...) by (WDT ...) when immediately followed by a noun
;   (e.g., (WP what) (NNS alternatives) becomes (WDT what) (NNS alternatives))
; - change SBARs to in context (NP (NP ...) (SBAR (WHNP|WHPP|WHADV|S ...)))
;   to S-REL (relative clauses); so this is done in the NP-processing;
; - likewise for (NP (NP ...) (\, \,) (SBAR|S ...) ...), i.e., the SBAR or
;   S is changed to S-REL (in this case a nonrestrictive S-REL);
; - change (ADJP (VBN ...)), (ADJP (VBG ...)) to (ADJP (JJ ...))
; - replace X-constructs as much as possible by more specific ones; the
;   heuristics do the following:
;   - change (X (PP ...)) to (ADVP (PP ...))
;   - in all other single-daughter cases, change (X (<cat> ...)) to (<cat> ...)
;   - change (X (<VP or AUX> ...) ...) to (VP (<VP or AUX> ...) ...)
;   - change (X (NP ...) (<NP or PP> ...) {...})
;     to (S (NP ...) (VP (V *null-verb*) (<NP or PP> ...) {...}))
;   - in all other cases, change (X (<phrasal-cat> ...) ...)
;     to (<phrasal-cat> (<phrasal-cat> ...) ...)
; - Change NEG to ADVP; (Brown contains (NEG (RB not)) and (NEG (RB n\'t))
; - [ADDED JAN 2/08] Change (NP (JJ <MANY or FEW or SEVERAL or ...>) ...)
;   to (NP (CD <MANY or FEW or SEVERAL or ...>) ...)
; 
 (prog (root trees tree1 pos1 pos2 pos3 )
       (if (atom tree) (return tree))
       (if (null (car tree)) ; remove initial ( ) (others are handled below)
           (return (preprocess-tree (cdr tree))) )
       (if (listp (car tree)) ; Brown Corpus has ((S...) (\. ...)) at top level;
                              ; add the punctuation as a final S-constituent, as
                              ; in WSJ corpus trees; but before doing this,
                              ; check if the top-level subject is (NP (\-NONE\- \*))
                              ; & if so, replace it by (NP (PRP you)), i.e.,
                              ; assume this is an imperative, or in any case about
                              ; an elided personal subject
           (if (and (eq (caar tree) 'S)
                    (listp (second (car tree)))
                    (second (car tree))
                    (eq (car (second (car tree))) 'NP)
                    (eq (car (second (second (car tree)))) '-none-) )
               (return 
                 (preprocess-tree
                   (append
                     (cons 'S
                       (cons '(NP (PRP you)) (cddar tree)) )
                     (cdr tree) )))
               (return (preprocess-tree (append (car tree) (cdr tree)))) ))
       (setq root (car tree))
       (setq trees (cdr tree))
       (setq trees ; delete ( )'s
             (remove-if #'null trees) )
       (setq trees ; delete quotes
             (remove-if 
                #'(lambda (x) (and (listp x) (member (car x) '(|``| |''|)))) 
                  trees ))
       (setq trees ; delete braces, which are coded as (|(| {) and (|)| })
             (remove-if
                #'(lambda (x) (or (equal x '(|(| {)) (equal x '(|)| }))))
                  trees ))
       (if (and (member root '(VB VBZ)) (eq (car trees) 'gotta))
           (return (cons 'MD trees)) )
       (setq trees ; incorporate AUX constituents (such as (AUX (VBZ has)))
                   ; into a VP whose head is an appropriate type of AUX 
                   ; constituent (e.g., (AUX have), (AUXZ has), (AUXD had), 
                   ; etc.) and whose remaining constituents are those 
                   ; *following* the original AUX constituent. (Brown corpus)
             (let ((tacit-VP 
                   (member-if 
                      #'(lambda (x) 
                          (and (listp x) (eq (car x) 'AUX) (listp (second x))) )
                                trees )))
                  (if (null tacit-VP) 
                      trees; no change to trees if there's no AUX,
                           ; o/w replace items starting with the (AUX ...)
                           ; item by a single VP with an auxiliary head:
                      (append (butlast trees (length tacit-VP))
                              (list (make-auxiliary-VP tacit-VP)) ))))
       (case root
             (VP ; ** I'm not allowing here for an adverb preceding
                 ;    an auxiliary within the VP; though there are no
                 ;    such examples in the 100 sample WSJ sentences,
                 ;    maybe they occur in the Brown corpus...
                 (if trees (setq pos1 (first (first trees))))
                 (if (cdr trees) (setq pos2 (first (second trees))))
                 (if (cddr trees) (setq pos3 (first (third trees))))


                 ; If the VP contains (VB ...) (CC ...) (VB ...) (or a
                 ; consistent variant of VB), change that triple to
                 ; (VB (VB ...) (CC ...) (VB ...)). (This would be simpler
                 ; with TTT!) But allow in principle for other unbracketed
                 ; conjunctions, not just verb conjunctions. [coded Jan 25/16]
                 (if (and (eq pos2 'cc) (eq pos1 pos3) (not (eq pos1 'VP)))
                     (return 
                       (preprocess-tree
                          (cons'VP 
                            (cons (list pos1 
                                    (first trees) (second trees) (third trees))
                                  (cdddr trees))))))
                 ; Allow for the possibility that a word (e.g., an adverb)
                 ; precedes the conjunction, as in "quickly turned and ran"
                 (if (and (eq pos3 'cc) (eq pos2 (car (fourth tree)))
                          (not (eq pos1 pos2))); not a 3-way conjunction
                     (return 
                       (preprocess-tree
                          (cons'VP            
                           (cons (car trees)  
                            (cons (list pos2     
                                    (second trees) (third trees) (fourth trees))
                                  (cddddr trees))))))) 

                 ; Change VP with initial constituent (TO TO) to a VP-INF
                 (if (and (eq pos1 'TO) (eq pos2 'VP))
                     (return
                       (cons 'VP-INF
                          (cons (first trees)
                                (mapcar #'preprocess-tree (cdr trees)) ))))

                 ; Change particle-like adverbs (listed in *particle-like-adverbs*)
                 ; to particles (so that they will be preprocessed to become part
                 ; of the verb). Thus from "He set the book aside" we'll get
                 ; that a male may set_aside a book, rather than that a male
                 ; may set a book. Code segment is by Jonathan Gordon.
                 (unless (or (member pos1 '(AUX BE))
                             (not (eq pos2 'ADVP)))
                   (if (and (eq (first (second (second trees))) 'NP)
                            (eq (first (third (second trees))) 'RB)
                            (member (second (third (second trees)))
                                    *particle-like-adverbs*))
                       (return (preprocess-tree
                                (append (list 'VP
                                              (first trees)
                                              (second (second trees))
                                              (list 'PRT (third (second trees))))
                                        (cddr trees)))))
                   (if (and (eq (first (second (second trees))) 'RB)
                            (eq (first (third (second trees))) 'NP)
                            (member (second (second (second trees))) 
                                    *particle-like-adverbs*))
                       (return (preprocess-tree
                                (append (list 'VP
                                              (first trees)
                                              (list 'PRT (second (second trees)))
                                              (third (second trees)))
                                        (cddr trees))))))

                 ; Change VBN embedded by HAVE to VBEN and recursively
                 ; process the entire phrase (so that the have-auxiliary,
                 ; etc., will also be specialized);
                 ;
                 ; First check for "have" word followed by VBN, which must
                 ; then be changed to a past participle (VBEN) from a passive
                 ; participle (VBN). Later (below) we also change the have-
                 ; (as well as be-) word to be a type of AUX rather than a
                 ; a type of VB, if it is indeed an auxiliary rather than main
                 ; verb.
                 (if (and pos1 pos2
                          ; (member pos1 '(VB VBD VBG VBN VBP VBZ))
                          ; Dec 13/01: the above doesn't allow for the explicit
                          ; AUX-forms obtained for preprocessed Brown trees,
                          ; so omit this (essentially redundant) check
                          (member (second (first trees)) '(have has had having)) 
                          (eq pos2 'VP) (eq (first (second (second trees))) 'VBN) )
                     (return
                       (preprocess-tree
                          (append
                             (list 'VP (first trees))
                             (cons (cons pos2 
                                      (cons
                                         (cons 'VBEN 
                                            (cdr (second (second trees))) )
                                         (cddr (second trees)) ))
                                   (cddr trees) )))))
                 ; There could be an adverb between the HAVE and the VP:
                 (if (and pos1 pos2
                          ; (member pos1 '(VB VBD VBG VBN VBP VBZ))
                          (member (second (first trees)) '(have has had having)) 
                          (member pos2 '(ADVP RB NEG)) (eq pos3 'VP)
                          (eq (first (second (third trees))) 'VBN) )
                     (return
                       (preprocess-tree
                          (append
                             (list 'VP (first trees) (second trees))
                             (cons (cons pos3
                                      (cons
                                         (cons 'VBEN
                                            (cdr (second (third trees))) )
                                         (cddr (third trees)) ))
                                   (cdddr trees) )))))
                 
                 ; Now change auxiliary VB-types to AUX-types, if appropriate.
                 ; Have/be verb with VP complement (possibly after an ADV)?
                 ; Note: this includes BE in BE+VP[ing] & BE+VP[pasv],
                 ;       but not copular BE.
                 (if (and pos1 pos2
                          (member (second (first trees)) 
                            '(have has had having is \'s are \'re was 
                                                    were be been being am \'m ))
                          (or (eq pos2 'VP)
                              (and pos3 (member pos2 '(RB NEG RBR RBS WRB ADVP))
                                   (eq pos3 'VP) )))
                     ; replace verb POS by appropriate AUX-variant:
                     (return 
                       (cons 'VP 
                         (cons
                           (cons 
                             (case pos1; NB: can't be passive (there's no AUXN)
                                   (VB 'AUX) (VBD 'AUXD) (VBG 'AUXG) (VBN 'AUXEN)
                                   (VBEN 'AUXEN) (VBP 'AUXP) (VBZ 'AUXZ) (T pos1) )
                             (cdr (first trees)) )
                         (mapcar #'preprocess-tree (cdr trees)) ))))
                 (if (and pos1 pos2
                          (member (second (first trees)) 
                                 '(is \'s are \'re was were be being been am \'m) ))
                     ; Replace copula (a main verb) by appropriate BE-variant:
                     (return
                       (cons 'VP
                         (cons 
                           (cons
                             (case (second (first trees)); the be-word itself
                                   (be 'BE) ((was were) 'BED) (being 'BEG) 
                                   (been 'BEEN) ((are \'re) 'BEP) 
                                   ((is \'s am \'m) 'BEZ) (t pos1) )
                             (cdr (first trees)) )
                         (mapcar #'preprocess-tree (cdr trees)) ))))

                 (if (and pos1 pos2
                          (member pos1 '(VB VBD VBG VBN VBEN VBP VBZ))
                          (eq pos2 'PRT) ); particle right after verb
                     ; make particle part of verb, e.g., (VB give up)
                     (return
                       (cons 'VP
                         (cons
                           (append (first trees) (cdr (second (second trees))))
                           (mapcar #'preprocess-tree (cddr trees)) ))))
                 (if (and pos1 pos2 pos3
                          (member pos1 '(VB VBD VBG VBN VBEN VBP VBZ))
                          (eq pos3 'PRT) ); particle after verb complement
                     ; make particle part of verb, e.g., (VB give up)
                     (return
                       (cons 'VP
                         (cons
                           (append (first trees) (cdr (second (third trees))))
                           (mapcar #'preprocess-tree 
                                   (cons (second trees) (cdddr trees)) ))))) 

;                ; [Added Nov 15/15 by LKS, and the commented out, as it
;                ; leads to calls to 'particularize-object-sbar', which
;                ; crashes; maybe the latter should make the following repair:]
;                ;
;                ; VP where the verb complement is an S made up of NP & VP-INF,
;                ; which should be changed to two separate complements,
;                ; NP and S-INF; NB: This is geared towards Charniak parse
;                ; trees, or Brown trees where "orphan" AUX constituents
;                ; have already been made the head of a VP, as per the
;                ; S-processing near the beginning of this program; in
;                ; Brown, infinitive complements usually are part of 
;                ;    (S (NP ...) (AUX (TO to)) (VP ...)), 
;                ; where if there's no verb object, (NP ...) is (NP -none-); 
;                ; for Charniak, an infinitive is (VP (TO to) (VP ...)).
;                (when (and (eq pos2 'S)
;                           (eq (first (second (second trees))) 'NP)
;                           (eq (first (third (second trees))) 'VP)
;                           (eq (first (second (third (second trees)))) 'TO))
;                      (setq trees 
;                            (cons (first trees)
;                                  (cons (second (second trees))
;                                        (cons (third (second trees)) 
;                                                            (cddr trees)))))
;                      (return (cons 'VP (mapcar #'preprocess-tree1 trees))))
             )     
             
             (PP (setq tree1 (particularize-pp (cons 'PP trees)))
                 ; Note: this could be of form (PP (P ...) ...) or (PP (PP ...)
                 ; ... (PP ...))
                 (return
                   (cons (first tree1)
                         (mapcar #'preprocess-tree (cdr tree1)) )))
             (SBAR (setq tree1 (particularize-sbar (cons 'SBAR trees)))
                 (return
                   (cons (first tree1)
                         (mapcar #'preprocess-tree (cdr tree1)) )))
             (S  ; First deal with trees like (S (ADJP ...)) (produced
                 ; by Collins' parser), changing to (ADJP ...)
                 (if (eq (caar trees) 'ADJP)
                     (return (preprocess-tree (car trees))) )
                     ; **This may discard something following the
                     ; ADJP, e.g., punctuation.
                 ; Next deal with potential null-subject trees
                 (setq tree1 (particularize-s (cons 'S trees)))
                 (return
                   (cons (first tree1)
                         (mapcar #'preprocess-tree (cdr tree1)) )))
             (NP ; Compress NNP sequences into single NNPs
                 (setq tree1 (combine-names (cons 'NP trees)))
                 ; tree1 = NIL if no multiple names were combined
                 ; (Needed to avoid run-away recursion in what follows)
                 (if tree1 (return (preprocess-tree tree1)))

                 (if (member-if ; change prenominal participles to adjectives
                        #'(lambda (x) (and x (listp x) (member (car x) '(VBN VBG))))
                          trees )
                     (return 
                       (preprocess-tree
                         (change-participle-to-adjective-in-np tree) )))

                 ; NEW SEGMENT (JAN 2/08) BEGINS:
                 (if (and (member (caar trees) '(JJ JJR JJS)); Change number-like JJ to CD
                          (member (second (car trees)) 
                            '(many more most much few less fewer little enough
                              several numerous multiple countless innumerable
                              ; Note: "one", "two", ... are already CD in a raw parse
                              twenty-odd thirty-odd forty-odd fifty-odd 
                              sixty-odd seventy-odd eighty-odd ninety-odd) ))
                     (return 
                        (cons 'NP
                           (cons (cons 'CD (cdr (car trees))) 
                                 (mapcar #'preprocess-tree (cdr trees)) ))))
                 ; END OF NEW SEGMENT (JAN 2/08);
                 
                 ; NEW SEGMENT (JUNE 18/14) BEGINS:
                 (if (and (equal (first trees) '(DT a))    ; change (DT a) (JJ few) to
                          (equal (second trees) '(JJ few)));  (DT a-few)
                     (return
                        (cons 'NP
                           (cons '(DT a-few) 
                                  (mapcar #'preprocess-tree (cddr trees)) ))))
                 ; END OF NEW SEGMENT (JUNE 18/14)

                 (if (eq (caar (last trees)) 'POS); possessives, as treated
                     (return                      ; in WSJ corpus
                       (cons 'DETP
                         (cons (cons 'NP 
                                  (mapcar #'preprocess-tree (butlast trees)) ) 
                               (last trees) ))))
                 (if (eq (first (second trees)) 'POS); possessives, as treated
                     (return                         ; in Brown corpus
                       (cons 'NP
                         (cons
                           (list 'DETP 
                                 (preprocess-tree (first trees))
                                 (second trees) )
                         (mapcar #'preprocess-tree (cddr trees)) ))))
                           
                 (if (temporal-np (cons 'NP trees))
                     (return
                       (cons 'NP-TIME 
                         (mapcar #'preprocess-tree trees) ))) 

                 ; SBARs in context (NP (NP ...) (SBAR (WHNP|WHPP|WHADV|S ...)))
                 ; should almost certainly be changed to S-REL (relative clauses)
                 (if (eq (car (first trees)) 'NP)
                     (if (and (eq (car (second trees)) 'SBAR)
                              (member (car (second (second trees)))
                                     '(WHNP WHPP WHADV S) ))
                         (return
                           (cons 'NP
                             (append (list (preprocess-tree (car trees))
                                      (preprocess-tree
                                       (cons 'S-REL (cdr (second trees))) ))
                                     (mapcar #'preprocess-tree (cddr trees)) ))))
                     ; likewise for (NP (NP ...) (\, \,) (SBAR|S ...) ...),
                     ; i.e., the SBAR or S is probably a nonrestrictive S-REL.
                     (if (and (eq (car (second trees)) '\,)
                              (member (car (third trees)) '(S SBAR)) )
                         (return
                           (cons 'NP
                             (cons (preprocess-tree (car trees))
                               (cons (second trees)
                                 (cons (preprocess-tree
                                         (cons 'S-REL (third trees)))
                                   (mapcar #'preprocess-tree
                                                      (cdddr trees)) ))))))) )

             ((PRP\$ WP\$) ; expand possessive pronouns like "his", "our",
                    ; or "whose" into DETPs, for easy interpretation
                    (return
                      (list 'DETP
                             (list 'NP 
                                    (list (case root (PRP\$ 'PRP) (WP\$ 'WP))
                                          (case (car trees)
                                                ((my mah me) 'I)        
                                                ((your yo\' yore) 'you) 
                                                (his 'he) (her 'she) (its 'it) 
                                                (our 'we) (thy 'thou)
                                                (their 'they) (whose 'who)
                                                (t (car trees))  ))); unknown
                            '(POS \'S) )))
             (WHNP (if (and (eq (car (first trees)) 'WP) 
                            (cdr trees) 
                            (intersection (mapcar #'car (cdr trees)) '(NN NNS)) )
                       (return
                         (cons 'WHNP
                           (cons 
                             (cons 'WDT (cdr (first trees)))
                             (mapcar #'preprocess-tree (cdr trees)) )))))

             (ADJP
              ;; Change (ADJP (VBN ...)), (ADJP (VBG ...)) to (ADJP  (JJ ...))
              ;; Also change it when the VBN is the head of the second  element,
              ;; e.g., (ADJP (RB closely) (VBN related) ...) [case 2 added by JG]
              (cond ((member (first (first trees)) '(VBN VBEN VBG))
                     (return
                      (cons 'ADJP
                            (mapcar #'preprocess-tree
                                    (cons (cons 'JJ (cdr (first trees)))
                                          (cdr trees))))))
                    ((member (first (second trees)) '(VBN VBEN VBG)) 
                     (return
                      (cons 'ADJP
                            (mapcar #'preprocess-tree
                                    (cons (first trees)
                                          (cons (cons 'JJ (cdr (second  trees)))
                                                (cddr trees)))))))))
             (X ; appears all too often in Brown corpus!
                (if (null (cdr trees)); X with a single daughter?
                    (if (eq (caar trees) 'PP); for PP daughter, guess adverbial
                        (return
                          (cons 'ADVP
                            (mapcar #'preprocess-tree trees) ))
                        ; for non-PP single daughters, delete (X ...) wrapper 
                        (return (preprocess-tree (car trees))) )
                    ; multiple daughters
                    (if (member (caar trees) '(VP AUX)); RHS starts with verb?
                        (return
                          (cons 'VP
                            (mapcar #'preprocess-tree trees) ))
                        ; not a VP
                        (if (and (eq (caar trees) 'NP); sentence with null verb?
                                 (member (caadr trees) '(NP PP)) )
                            (return 
                              (list 
                                 'S 
                                 (preprocess-tree (car trees))
                                 (cons 'VP
                                   (cons '(V *null-verb*)
                                     (mapcar #'preprocess-tree (cdr trees)) ))))
                            ; probably not a sentence with null verb; use 
                            ; 1st-daughter category, if phrasal, in place of X
                            (if (member (caar trees) 
                                       '(NP VP PP WHNP ADVP ADJP S SBAR) )
                                (return
                                  (cons (caar trees)
                                    (mapcar #'preprocess-tree trees) )))))))
             (NEG ; A new category used in Brown instead of ADVP to embed 
                  ; (RB not), (RB n\'t); Change it to ADVP
                (return (cons 'ADVP (cdr tree))) )
          )
       (return (cons root (mapcar #'preprocess-tree trees))) 

 )); end of preprocess-tree


(defun combine-names (np); June 21/01
;~~~~~~~~~~~~~~~~~~~~~~~~
; For any sequence of 2 or more NNPs, possibly with intervening non-NNPs 
; such as CCs (e.g., (NP (NNP Merril) (NNP Lynch) (CC &) (NNP Co \.)))
; occurring at the top level of the given noun phrase `np', combine these 
; into a single NNP or NNPS dominating multiple words. In addition, change 
; non-NN(S) constituents such as JJs occurring between an NNP(S) and the 
; head NN(S) to NNs. E.g., change (JJ FOREIGN) in ((NNP NEW ZEALAND) 
; (JJ FOREIGN) (NN EXCHANGE) (NNS MARKETS)) to (NN FOREIGN).
;
; RETURN NIL IF NO CHANGES ARE MADE.
;
 (prog (result nnp-flag yes n main-part m remainder i)
       (dolist (x np)
          (if (and (not (atom x)) (member (car x) '(NNP NNPS)))
              (progn
                 (if nnp-flag            ; Was there a previous NNP(S)?
                     (setq yes T         ; We have multiple NNP(S)s
                           main-part     ; Find the part of `result' to
                             (member-if  ; be incorporated into the NNP(S)
                               #'(lambda (y) 
                                   (and y (listp y) (member (car y) '(NNP NNPS))) )
                                 (reverse result) )
                           remainder
                             (last result (- (length result) (length main-part)))
                           main-part
                             (apply #'append ; form a list of just the words 
                                             ; so far, of the combined NNP(S)
                                (mapcar #'(lambda (z) (if (atom z) z (cdr z)))
                                          main-part ))
                           main-part ; add its type (NNP or NNPS) & new word(s)
                                     ; (we let the last NNP(S) determine the type)
                             (cons (car x) (append main-part (cdr x)))
                           result (push main-part remainder) )
                     (push x result) )
                 (setq nnp-flag t) )
              (push x result) ))
       (if (null nnp-flag) (return nil)); for speed, if there are no NNP(S)s

       ; Split off any material after the head noun
       (setq n (length result))
       (setq main-part 
             (reverse 
                (member-if 
                  #'(lambda (y) (and y (listp y) (member (car y) '(NN NNS))))
                    result )))
       (setq m (length main-part))
       (setq remainder (last (reverse result) (- n m)))
       (setq result nil nnp-flag nil i 0)
       (dolist (x main-part)
          (incf i)
          (if (and (not (atom x)) (member (car x) '(NNP NNPS)))
              (progn (setq nnp-flag T) (push x result))
              (if (and nnp-flag (< i m)); pre-head constituent?
                  (if (and x (listp x))
                      (if (member (car x) '(NN NNS))
                          (push x result)
                          ; Change the type of the premodifier to NN:
                          (progn (setq yes T)
                                 (push (cons 'NN (cdr x)) result) )))
                  (push x result) )))
       (setq result (append (reverse result) remainder))
       (return (if yes result nil))
 )); end of combine-names

