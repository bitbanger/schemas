
;; MAIN TREEBANK LF PROGRAMS (AS IN THE MINIPAR-ORIENTED VERSION) ARE 
;;
;;           'derive-lf', AND 'derive-phrase-lf'. 
;;            ^^^^^^^^^        ^^^^^^^^^^^^^^^^
;; THE LATTER RESEMBLES THE ORIGINAL 'form-pattern' PROGRAM OF KNEXT.
;; ===================================================================
;;
;; Program for extracting logical forms from Treebank trees.
;; many routines are taken from, or variants of, routines from the
;; public version of the KNEXT extract-pattern code, and from the
;; code for deriving LFs based phrase-structure trees reconstructed
;; from Minipar dependency parses. But both the preprocessing of
;; PSTs for easier interpretation, and the derivation of word and
;; phrase LFs is generally much more thorough.

(defparameter *new-symbol-index* 0); for forming new atoms with numerical
                                   ; suffixes; used in 'missing-word-lf'

(defun trace-lf (); high-level tracing
   (trace instantiate-semrule derive-lf derive-phrase-lf combine-lfs
          find-parts) )

;; A few synonym definitions for debugging (tracing particular
;; calls to 'find-parts' and 'combine-lfs'):
(defun find-parts1 (x y) (find-parts x y))
(defun combine-lfs1 (x y z) (combine-lfs x y z))
(defun find-parts2 (x y) (find-parts x y))
(defun combine-lfs2 (x y z) (combine-lfs x y z))

;; THIS PROGRAM IS STILL AIMED AT THE MINIPAR-BASED PARSER CODE,
;; WHICH WILL BE REPLACED WITH THE CHARNIAK PARSER (SEPARATE FILE).
;;
(defun plf (sentence-str); Oct 24/03 [from Minipar-targeted LF code]
;~~~~~~~~~~~~~~~~~~~~~~~             [for reference, not use, herein]
; "Parse and find LF": Parse a sentence and show the PST, then compute 
; and display the LF -- its initial form, its scoped form, its deindexed
; form, and the final reduced form (with inessential keywords stripped).
;
  (let (pst ulf)
       (setq pst (parse sentence-str))
       (format t "~%~a~%" pst)
       (lf pst)
       '-------------------------------------------------------------
 )); end of plf

(defun lf (pst); Jul 26/05 [Oct 4/10: will use Charniak or Stanford parser
;~~~~~~~~~~~~~~~~~~~~~~~~~            instead of Minipar]
; "Find LF of phrase structure tree": For a PST of the type obtained by
; 'parse', compute and display the corresponding LF -- its initial form, 
; its scoped form, its deindexed form, and the final reduced form (with 
; inessential keywords stripped).
;
  (let (ulf ilf lf reduced-lf)
       (setq ulf (derive-lf pst))
       (format t "~%INITIAL LOGICAL FORM:~%~s" ulf)
       (setq ilf (scope-operators ulf))
       (format t "~%~%SCOPED LOGICAL FORM:~%~s" ilf)
       (setq lf (deindex ilf))
       (format t "~%~%DEINDEXED LOGICAL FORM:~%~s" lf)
       (setq reduced-lf (reduce-lf lf))
       (format t "~%~%AFTER SIMPLIFICATION AND STRIPPING :F, :P, :I KEYWORDS:~%~s"
         reduced-lf)
       '-------------------------------------------------------------
 )); end of lf


(defun reduce-lf (lf); Oct 24/03 [Oct 4/10: again, will use Treebank parser,
;~~~~~~~~~~~~~~~~~~~~~            not Minipar]
; Change (:a (:q det pred1) pred2) to (:q det (:l x (:i (:i x pred1) and 
; (with lambda-conversion if applicable)                (:i x pred2) )))
; ** I may need to change (:p (:p ...) ...) to (:p ... ...) [can it occur?]
; Change (:i expr (:p ...)) to (:i expr ...);
; Strip keywords :f, :i, :p, but not :l, :o, :q, or :r
;
  (let (result)
       (setq result (incorporate-augmentations lf))
       (setq result (flatten-predications result))
       (setq result (strip-keywords result))
 )); end of reduce-lf


(defun flatten-predications (lf); Oct 24/03 [Oct 4/10: Again, Treebank-based,
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             not Minipar-based]
; Change (:i expr (:p ...)) to (:i expr ...) wherever it occurs
;
  (cond ((atom lf) lf)
        ((atom (car lf))
         (cond ((not (eq (car lf) :i)) (mapcar #'flatten-predications lf))
               (T ; leftmost element is :i; look for (:p ...) & flatten,
                  ; and recursively flatten embedded predications
                  (let ((final (car (last lf))) (result lf))
                       (if (and (listp final) (eq (car final) :p))
                           (setq result (append (butlast lf) (cdr final))) )
                       (mapcar #'flatten-predications result) ))))
        (T (mapcar #'flatten-predications lf))
 )); end of flatten-predications


(defun incorporate-augmentations (lf); Oct 24/03 [Oct 4/10: again, Treebank-based,
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~            not Minipar-based]
; Change quantified augmented term (:a (:q det pred1) pred2) to 
;    (:q det (:l x (:i (:i x pred1) and (:i x pred2) )))
; (with lambda-conversion if applicable)
;
; Change non-quantified augmented term (:a term pred2) to 
;    (:q some (:o and (:l x (:i x = term)) pred2))
; equivalently (?) we could make it
;    (:q some (:l x (:i (:i x = term) and (:i x pred2))));
; (with lambda-conversion if applicable). E.g., (:a John.name (:p in.p Rome.name))
; becomes 
;    (:q some (:o and (:l x (:i x = John.name) (:p in.p Rome.name));
; or equivalently (?) 
;    (:q  some x (:i (:i x = John.name) and (:i x in.p Rome.name)); 
; this can later be flattened after scoping of 'and'.
;
  (cond ((atom lf) lf)
        ((atom (car lf))
         (cond ((not (eq (car lf) :a)) (mapcar #'incorporate-augmentations lf))
               (T; leftmost element is :a; if second element is (:q ...),
                 ; combine predicates and process recursively
                 (let ((term (second lf)) (result lf) pred1 pred2)
                      (cond ((and (listp term) (eq (car term) :q))
                             (setq pred1 (third term) pred2 (third lf))
                             (setq pred1 (list :i 'x pred1))
                             (setq pred1 (convert pred1))
                             (setq pred2 (list :i 'x pred2))
                             (setq pred2 (convert pred2))
                             (setq result (list :i pred1 'and pred2))
                             (setq result (list :l 'x result))
                             (setq result (list :q (second term) result))
                             (mapcar #'incorporate-augmentations result) )
                            (t; the term being augmented is not quantified,
                              ; so it's a name, pronoun or functional term; in
                              ; this case we introduce a quantifier;
                             (setq pred2 (third lf))
                             (setq result 
                               `(:q some (:o and (:l x (:i x = ,term)) ,pred2)) )
                             (setq result (convert result))
                             (mapcar #'incorporate-augmentations result) ))))))
        (T (mapcar #'incorporate-augmentations lf))
 )); end of incorporate-augmentations

(defun strip-keywords (lf); Oct 24/03 [Oct 4/10: again, Treebank-based, 
;~~~~~~~~~~~~~~~~~~~~~~~~~            not Minipar-based]
; Strip keywords :f, :i, :p, but not :l, :o, or :q (or :a, which 
; shouldn't be there)
;
  (cond ((atom lf) lf)
        ((atom (car lf))
         (if (member (car lf) '(:f :i :p))
             (mapcar #'strip-keywords (cdr lf))
             (mapcar #'strip-keywords lf) ))
        (T (mapcar #'strip-keywords lf))
 )); end of strip-keywords


(defun derive-lf (tree) ; Jan 29/10
;~~~~~~~~~~~~~~~~~~~~~~
; PURPOSE: To compute the unscoped logical form of a preprocessed Treebank
;     tree (sentential, or a phrasal part).
; tree: a "Lispified" Treebank phrase structure tree such as
;     (S (NP (PRP I))
;      (VP (BEP |'M|)
;       (ADJP (JJ WILLING)
;        (S-INF (NP (-NONE- *))
;         (VP (TO TO)
;          (VP (VB STAKE)
;           (NP (DETP (NP (PRP I)) (POS |'S|)) (JJ POLITICAL) (NN CAREER))
;           (PP-ON (IN ON) (NP (PRP IT))))))))
;      (\. \.))
; RESULT: a logical form for the input tree, with occasional simplifications,
;     e.g., omission of some unrecognizable phrasal modifiers.      
; METHOD: We process `tree' recursively, finding the lists of LFs for
;     the immediate subtrees, and applying an appropriate interpretive rule
;     through a call to 'derive-phrase-lf'.
;
 (cond ((atom tree) ; unexpected condition: we expect at least a category
                    ; and one constituent, i.e., (C w) or (C (...) ...)
        (uncategorized-word-lf tree) )
       ((null (cdr tree)) ; empty cdr -- strange condition
        (if (atom (car tree)); looks like a (lexical?) cat with no content
            (missing-word-lf (car tree)); make missing-word LF
            (derive-lf (car tree)) )); o/w assume the outer (...) are redundant
       (T ; non-empty cdr -- the usual condition
        (if (proper-list (second tree))
                ; if the 1st child is a proper list,
                ; assume we're interpreting a phrase
            (let ((lfs (mapcar #'derive-lf (cdr tree))))
                 (derive-phrase-lf ; wrap (...) around (car tree), if atomic,
                                   ; to make representations of phrases uniform
                                   ; from the perspective of 'derive-phrase-lf'
                                   ; (In contrast with Treebank trees, syntax
                                   ; trees for other parsers such as Minipar may
                                   ; have a list such as (S pres) as parent (LHS)
                                   ; category.)
                    (if (listp (car tree)) tree
                        (cons (list (car tree)) (cdr tree)) )
                    lfs ))
            ; The child is atomic, so assume we have a categorized word
            (derive-word-lf tree) ))
 )); end of derive-lf


(defun uncategorized-word-lf (atm); Oct 17/03
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Assign the given atom an LF consisting of the atom (made into an symbol
; if it is a number, string or character) with extension '.*U*'. Mark
; the new symbol as being of type '*U*'.
;
  (let ((result (intern (concatenate 'string (up-stringify atm "_") ".*U*"))))
       (setf (get result 'type) '*U*); flag as type '*U*' on property list
       result ))


(defun missing-word-lf (atm); Oct 17/03
;~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Assign an unknown word (whose category is given by atm) a gensym'ed
; LF with a dot-extension consisting of the upper-case symbolic version
; of atm. Mark the new symbol as being of the type corresponding to 
; the upper-case symbolic version of atm.
;
  (let* ((type-str (up-stringify atm "-"))
         (result (concatenate 'string "MISSING_WORD"
                    (format nil "~a" (incf *new-symbol-index*))
                    "." type-str )))
       (setq result (intern result))
       (setf (get result 'type) (intern type-str))
       result ))



(defun up-stringify (atm connecting-string); Oct 17/03
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Change the given atom to an upper-case string, filling in blanks with 
; the specified connecting string (e.g., "-", "_", but it could be longer).
;
  (let ((chars (coerce (string-upcase (format nil "~a" atm)) 'list))
        (chs (coerce (string-upcase connecting-string) 'list))
        result )
       (dolist (ch chars)
               (if (not (char-equal ch #\Space))
                   (push ch result)
                   (dolist (c chs) (push c result)) ))
       (coerce (reverse result) 'string)
 )); end of up-stringify


(defun proper-list (x); Oct 17/03
;~~~~~~~~~~~~~~~~~~~~~
; Is x a non-empty list?
  (and x (listp x)) )


(defun derive-word-lf (pos+word{s}); Oct 17/03; Jan 31/10; Oct 4/10; Oct 6/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~; Nov 3-4/10
; Derive a logical form for the given part of speech + word(s);
; this might be done by lexical lookup, but it is done procedurally here.
;
; pos+word{s}: usually a list of symbols of form (pos word word*);
;   (however, numbers and strings are allowed for word, word*);
;   the lexical stem may consist of multiple words, in which case we
;   convert it to an upper case atom with parts connected by underscores;
;
; pos: Currently the POSs expected are
;   CC  CD  DT  EX  FW   IN  JJ JJR JJS LS  MD  NN  NNS NNP  NNPS
;   PDT  POS PRP PRP$ RB  RBR RBS RP SYM TO UH  VB  VBD VBG VBN VBEN 
;   VBP VBZ WDT WP WP$ WRB WDT-REL WP-REL WP$-REL WRB-REL AUX AUXD AUXG
;   AUXEN AUXP AUXZ BE BED BEG BEEN BEP BEZ
;
;   The corresponding generalized parts of speech (many used as extensions
;   on logical atoms) are
;   CC  DET DET PRO FW   P   A  A   A   LS  AUX N   N   NAME NAME
;   PDET POS PRO DET ADV ADV ADV PART SYM TO IJ  V   V   V   V   V 
;   V   V    DET  PRO  DET ADV DET-REL PRO-REL PRO-REL ADV-REL AUX AUX AUX
;   AUX AUX AUX BE BE BE BE BE BE.
;
;     Examples of the REL-words: WDT-REL (the man whose dog died), WP-REL
;     (the man who/that sneezed), WP$-REL (??the man whose it is), WRB-REL
;     (the place where he lives, ?the reason why he left, ??the manner 
;     how he died). "Whose" as WP$-REL is currently ignored.
;
;   Generalized POSs *not* used as extensions on logical atoms:
;   - FW: foreign words might be terms if (in effect) quoted, of
;     have some standard type (if used as if they were English)
;   - LS: list item markers are metalinguistic labels that perhaps
;     could be interpreted in terms of metalinguistic "dubbing" of
;     linguistic segments (and/or their content) by the speaker; 
;     we ignore them for now.
;   - PDET: I don't think these show up directly in the LF, because
;     they're really NPs with an elided "of"; compare "half the bread"
;     with the paraphrase "one half of the bread", where "half" is
;     a noun.
;   - POS: genitives get interpreted in terms of 'pertain-to' ;
;   - PART: Participles are incorporated into the main verb;
;   - SYM: Symbols might in effect be quoted (& thus terms) or
;     used as if they were English, thus acquiring the corresponding
;     POS;
;   - IJ: Interjections do of course convey meaning, just as facial
;     expressions do; but they should be treated in terms of speech
;     acts and quotation, I think; e.g., [Speaker utter.v 'ouch], or
;     maybe [Speaker utter.v "ouch"], if we're allowing strings as
;     terms. Later (Mar 14/14): But this isn't quite right, because
;     1. speech acts are supposed to be introduced at the deindexing
;        stage, not at the compositional LF stage; and
;     2. interjections can be more than single words, and can 
;        involve words of different types, e.g., "Ow, my foot!"
;        "Hey you!", "Hey there!", or "Good day!" (Austral. "hello").
;     So maybe the LF should just be fragments like 'ouch.ij',
;     (:q the x i((:i x foot.n) and (:i x pertain-to* I.pro))),
;     'hey.ij', or You.pro. But the explamation mark matters too.
;     So I think we need a logical "mood" distinct from {decl, imper, 
;     ques, lets}, say 'intj' (echoing the syntactic phrase type).
;     This would then be deindexed as a function of the argument type.
;   - DET-REL, PRO-REL, ADV-REL: These are interpreted in terms of
;     predicates like person.n, thing.n, location.n, reason.n, 
;     at-loc.p, and at-time.p, rather than appearing directly in LFs.
;   - PS: This POS isn't (at the time of these comments) included
;     above; it is intended for "prepositions taking sentences as 
;     complements", as in "WHEN/AFTER/BEFORE John arrived, Mary left".
;     These are tricky to deal with, but in any case get expanded
;     into a complex LF not involving any logical "PS" constituent.
;   - BE: Not sure; maybe distinguish main as .v and auxiliary as .aux?
;     How do we distinguish "has beaten" and "was beaten"? TBC
;
; E.g., (NNP JOHN) yields JOHN.NAME
;       (NNS PEOPLE) yields (:f PLUR PERSON.N)
;       (NN NIL) or (NN -NONE-) yields -t- ("trace" variable, for gaps)
;       (VBG SLEEPING) yields SLEEP.V 
;          (for the VP "is sleeping", the aux. BE adds the PROG operator)
;       (VBD SLEPT) yields (:O PAST SLEEP.V)
;       (VBD GAVE UP) yields (:O PAST GIVE_UP.V)
;       In the following, we take "when" to have 2 basic meanings, one
;       equivalent to "at what time" (so, a WHPP), and the other equivalent
;       to "at the time at which" (so, a sentential wh-preposition):
;       (WRB WHEN) yields (:P AT-TIME.P (:Q WH TIME.N)); should be WHPP, i.e., a
;                 WH-prepositional phrase; but I'm leaving the bad treebank POS;
;                 e.g., "[When] is the lecture?"
;       ***THE FOLLOWING IS NOT QUITE WHAT'S CURRENTLY BEING DONE...
;          SENTENTIAL COMPLEMENTS ARE PRESUMED TO HAVE A GAP, AND 
;          AND WE FORM A PP RATHER THAN ADVERBIAL, TO BE TYPE-RAISED
;          OUT OF VERB COMPLEMENT POSITION...
;       (PS WHEN) yields (:L S (:L T (:F ADV-E (:P AT-TIME.P T) S))); wh-prep-
;                 osition taking a sentential argument, forming NP[pred];
;                 e.g., "12:30 is [when] the lecture starts"
;       These are the basic meanings, out of which several others are built as
;       follows. (We could take "when" to have the core meaning AT-TIME.P, 
;       i.e., a 2-place predicate, and build all other meanings from that;
;       and similarly for "where" & perhaps "why". However, it is then
;       inexplicable why we can't say, e.g., *"The lecture is when 12:30 pm").
;          WHADVP --> WHPP; (:L P (:L X (:F ADV-E WHPP' (:I X P)))); 
;                         ; e.g., "[When] did he leave?"
;          WHADVP-REL --> WPS; (:L S (:F WPS' S R)); NB: free variable R;
;                         ; e.g., "the time [when] he left";
;          ADVP --> WPS S; (:L P (:L X (:F WPS' (:I X P)
;                                       (:Q THE.DET (:F SUB (:F WPS' S'))))))
;                         ; e.g., "[When he left], he was angry"; or, not
;                         ; topicalized, "He was angry [when] he left"
;                          ('SUB' is an identity operator, used to trigger
;                           a tense tree modification)
;          NP --> WPS S; (:Q THE.DET (:F WPS' S'));
;                                           "[When he left] is unknown".
;
;       Note the difference of WHADVP from WHPP: *"When and how unexpectedly
;       is the lecture?", vs., "When and how unexpectedly is he lecturing?"
;
;       Note that expanded out, WHADVP' yields 
;         (:L S (:F ADV-E (:P AT.P R) S)) ; NB: again, free var. R
;
;       Also, if we abstract the sentence argument in the LF for ADVP (so
;       that in effect we have the meaning of 'when' if it is applied to 
;       a sentence to form a VP adverbial) we obtain
;           (:L S
;             (:L P
;               (:L X
;                 (:F ADV-E
;                   (:P AT-TIME.P 
;                     (:Q THE.DET
;                       (:L T (:F SUB (:F (:F ADV-E (:P AT-TIME.P T)) S)))))
;                   (:I X P) ))))
;       which agrees with the semantics of 'when' as per p.18 of C-H & my
;       '94 paper. This is similar to "whenever", "while", etc. E.g., 
;       "When he arrived" becomes (roughly) 
;          (L P (adv-e at-the-time-at-which-he-arrived)).
;
;       I expect to keep 'WRB' for WHPP as well as other uses of "when"
;       *except* in relative clauses, but using the right translation in
;       in terms of WHPP ("WRB") or WPS in the relevant phrase structure 
;       context (I hope); and I'll use POSs with suffix "-REL" in relative
;       clauses, but again using the context to get the right LF in terms
;       of the PS meaning.
;
;       There's also an atemporal generic reading ...  
;
;       (WRB WHERE) yields (:P AT.P (:Q WH LOCATION.N))
;          I used to wrap an (:R ...) around this to indicate ambiguity 
;          between predicate and adverbial modifier ("Where is he?" vs. 
;          "Where does he live?") But I now think that as in the case of
;          "when", I should handle this in the LF-rules for phrases, if
;          necessary introducing an (:R ...) there, if unable to decide
;          between predicate, adverbial, and perhaps NP ... 
;             There is ALSO the "to what place" meaning of "where", e.g.,
;          "Where (i.e., *to* what place) did he go?" and all the sorts
;          of derivative meanings that "when" (above) is involved in. So
;          altogether, in addition to the basic meaning above, we have
;          three more:
;       (WRB WHERETO) ... (:P TO-LOC.P (:Q WH LOCATION.N))
;       (PS WHERE)  ...   (:L S (:L Y (ADV-E (:P AT-LOC.P Y) S)))
;       (PS WHERETO) ...  (:L S (:L Y (ADV-E (:P TO-LOC.P Y) S)))
;
;       (DT THE) yields (:L P (:Q THE.DET P))
;       (DT MY) yields 
;         (:L P (:Q THE.DET (:L X (:I (:I X P) AND.CC (:I X PERTAIN-TO ME.PRO)))))
;       (PRP SHE) yields SHE.PRO
;       (PRP HIM) yields HE.PRO
;       (WP WHAT) yields (:Q WH THING.N)
;       (PRP$ MINE) yields 
;         (:Q THE.DET (:L X (:I (:I X SALIENT-ENTITY.N) AND.CC
;                                (:I X PERTAIN-TO ME.PRO) )))
;
; In addition, we mark any new logical atoms like CAT.N, JOHN.NAME, 
; PERSON.N, SLEEP.V, etc., with their type and with properties useful 
; for abstraction (and perhaps disambiguation) and verbalization (in 
; the 'make-logical-atom' routine from which this program is derived, 
; a 'plural-word' feature was added to logical atoms derived from
; surface plurals to facilitate verbalization, but here we assume 
; this would be done by lexical lookup in the verbalization process):
;
; - the category of the word, such as N, V, A, ADV, DET, NAME, etc., that
;   is used to create a suffix .N, .V, .A, etc., also serves as value
;   of the 'type' property of the logical atom;
;
; - the English word stem on which a logical atom is based is saved as
;   the 'word' property of the logical atom (this could serve as a lookup
;   key into a lexicon that also supplies features, synonyms, etc.);
;
; - In the case of adverbs, predeterminers, and auxiliaries, these are
;   marked as 'modifier' (i.e., type-preserving functor). (Some verbs
;   like 'seem' and 'become' are marked as 'modifier' in the global 
;   initializations.)
;    
; - Certain noun-derived logical atoms are marked as event predicates;
;   e.g., (omitting the .N suffixes) birth, death, destruction, disavowal,
;   impeachment, flogging, etc. (typically de-verbal nouns); others are 
;   marked with boolean property 'attribute', e.g., kindness, heat,
;   happiness, etc. (typically de-adjectival nouns ending in -ness);
;
; - Most JJ adjectives are marked as 'descriptive (with exceptions like
;   "same", "different", "such", "first", "second", "entire", "next", "past")
;
; - Atoms with suffix .NAME are given indicator 'entity-type with values 
;   like 'person, 'country, 'company, etc.; the default value is 'named-entity.
; 
; Possibly (though this is not expected) pos or word{s} may be nil; in
; that case we generate a logical atom translating an unknown word of
; known category, a known word of unknown category, or an unknown word
; of unknown category. A NIL word, though used by some parsers (Minipar)
; to signal a trace, should not be a trace here, since traces are detected 
; at the phrase level and interpreted as '-t-'. So the only possibility is
; (or ought to be) that we have an elided constituent, e.g., a null head
; of an NP. (However, at the time of writing, Oct 21/03, Minipar parses 
; for null-headed NPs like "These" treat them directly as nouns! Oct 4/10:
; Charniak would typically produce (NP (DT these)).)
; 
  (prog (pos general-pos word stem stem-parts stem-str 
         log-atom log-atom-str old possessor result)

        ; Treat single numbers and strings as standing for themselves; 
        ; (if word is followed by additional words, then numbers and strings
        ; are amalgamated into a logical atom with a .name extension)
        (if (and (numberp (second pos+word{s})) (null (cddr pos+word{s})))
            (return (second pos+word{s})))
        (if (and (stringp (second pos+word{s})) (null (cddr pos+word{s})))
            (return (second pos+word{s})))

        (if (null pos+word{s})              ; unexpected condition
            (return (missing-word-lf '*U*)))
            ; e.g., result might be MISSING_WORD452.*U*
        (setq pos (car pos+word{s}))
        (if (null pos) (setq pos '*U*))     ; unexpected condition
        (setq general-pos (generalize-pos pos))
        (if (null (cdr pos+word{s}))        ; unexpected condition
            (return (missing-word-lf general-pos)) )
            ; e.g., result might be MISSING_WORD871.N
        (setq word (second pos+word{s}))   ; N.B.: there may be further words
        (if (member word '(NIL -NONE-)) ; gap: interpret as "trace" variable -t-
            (if (member general-pos '(N PRO P ADV A))
                (return '-t-) ))
        (setq stem (stem pos+word{s})) ; returns an atom, with "_" joins
                                    ; if length(pos+word{s}) > 2; but if
                                    ; there is only a single string or number,
                                    ; it is returned unchanged. If there are
                                    ; no words, 'stem' returns NIL.
        (if (null stem) (setq stem word))         ; null stem (unexpected)
        (if (null stem)                           ; null word as well
            (return (missing-word-lf general-pos)) )
        (setq stem-str ; a string, for use in log-atom 
              (up-stringify stem "_") ); this turns everything into a string,
                                       ; even numbers; e.g. for input |Do it!|
                                       ; the result is "DO_IT!"; for input
                                       ; "har har !" the result is "HAR_HAR_!"
        (setq stem (intern stem-str))
        (setq log-atom-str
              (concatenate 'string stem-str "." (string general-pos)) )
        (if (find-symbol log-atom-str) ; does the logical atom exist already?
            (setq old T) ); if so, set flag; this is used to avoid repeatedly
                          ; setting properties (such as entity-type) of 
                          ; a logical atom (see below);
        (setq log-atom (intern log-atom-str))
        (setq result log-atom) ; THIS PROVIDES A PRELIMINARY LF FOR ALL
                               ; WORDS; HOWEVER, VARIOUS MODIFICATIONS
                               ; REMAIN TO BE MADE FOR MANY TYPES OF WORDS

        ; For most DETs and PROs, the preceding 'result' (log-atom) won't 
        ; be used; e.g., the LF for (PRO HIM) is HE.PRO, not HIM.PRO,
        ; and the LF for (DET THE) is (:L P (:Q THE.DET P)), not THE.DET.
        ; For possessive pronouns, the LFs are particularly complex, as was 
        ; seen in the introductory examples. Relative pronouns (e.g., "who",
        ; "that"), relative determiners ("whose"), and relative adverbs (e.g.,
        ; "where") are handled as a group second-to-last, as their LFs are quite 
        ; distinctive (involving free variable r). "Prepositions" of type PS,
        ; have complex LFs and are dealt with at the end -- see further note
        ; just below.
        ;
        ; Handle REL, DET, PRO, P and UH separately:
        ;
        (if (member general-pos '(pro-rel det-rel adv-rel)) (go REL))
        (if (eq general-pos 'DET) (go DET))
        (if (eq general-pos 'PRO) (go PRO))
        (if (eq general-pos 'PS) (go PS)); though prepositions used with nouns
            ; don't need to be re-interpreted, "prepositions" such as "while"
            ; and "when" used with sentences (and forming clausal adverbials)
            ; do require special interpretation. Such "prepositions" appear
            ; in Merriam-Webster and Google dictionary as "conjunctions" 
            ; (which isn't really correct either); the Brown annotations
            ; unfortunately treat "when" in this role as (WHADVP (WRB when)),
            ; i.e., as adverbs, which is just wrong, and I've decided to change
            ; these to (PS when), for consistency with (PS while). Similarly
            ; for "after" (he left), "before", "as" (he lay sleeping), and
            ; various other words.)
        (if (eq general-pos 'IJ) (go IJ))

        ; At this point 'pos' must be a part of speech other than a relativizer, 
        ; DET, PRO, PS or IJ; in most cases, the result returned is log-atom, but
        ; for N plurals a plur operator is applied, for tensed V a tense operator
        ; is applied, and for wh adverbs, either question-PPs or question-
        ; adverbials are formed; and for several categories various 
        ; properties are set, if the log-atom is new:

        (case general-pos
              (N (if (eq pos 'NNS) ; add PLUR operator for plurals    
                     (setq result (list :f 'PLUR log-atom)) ))
              (AUX; auxiliary "have", "be", "do", & modals (but not main verb 
                  ; "be" and not infinitive particle "to", with POS = TO).
                  ; The modified scheme for these auxiliaries uses a separate
                  ; set of POS's for progressive "be", namely PRG, PRGZ, PRGD,
                  ; PRGP (there is no -ing form of progressive "be"), because
                  ; as far as I can tell this is the only form of "be" that
                  ; introduces a sentential operator, and it is thus semantically
                  ; distinct from the passive auxiliary "be" -- for which we'll
                  ; use (AUX be) and its variants exclusively. So we assume
                  ; that in preprocessing we identify progressive "be", and
                  ; modify its syntax to use the appropriate variant of PRG.
                  ;
                  ; The modal auxiliaries are interpreted as sentential
                  ; operators can.md, could.md, and so on; we could have used
                  ; more suggestive operators like possible-that, necessarily,
                  ; ought-to-be-that, etc., but in view of the ambiguity of 
                  ; modals, it seems like a good idea to (essentially) retain
                  ; them as-is. Unfortunately we can't tell the difference
                  ; between, e.g., counterfactual present "would" and "would"
                  ; as the past tense of "will", i.e., future-in-the-past. 
                  ; So these should be disambiguated post hoc. So we use
                  ; <pres/past would>, etc. to be disambiguated into one of
                  ; <pres would>, <past would>, or <past will>, where 'would'
                  ; in LF is the counterfactual modal only.
                  ;
                  ; The reason for treating the passive auxiliary as vacuous
                  ; (the identity function), rather than a pasv operator, is
                  ; that the pasv operator will already have been "wrapped 
                  ; around" the verb that follows, in the interpretation
                  ; of VBN verbs. However, like other auxiliaries it can carry
                  ; tense information (pres or past). In the case of "do",
                  ; this is just identity when used as initial verb in a
                  ; question; if used declaratively or imperatively, it adds
                  ; emphasis (and something like "contrary to what you might
                  ; think or intend"), but if we wanted to allow for this 
                  ; pragmatic component we would need to distinguish two
                  ; "do"s -- and perhaps deal systematically with contrastive
                  ; stress.
                  ;
                  ; The modal auxilaries can very plausibly be argued to
                  ; have predicate modifier readings as well (e.g., able-to
                  ; in the case of "can" and is-apt-to in the case of "may").
                  ; However, we can't make that choice from the parse, and
                  ; one could argue that the pred-modifier readings are really
                  ; pragmatic inferences from the sentence-modifier readings.
                  ; E.g., (:f can.md (:i John.name dance.v)) might be said to
                  ; express a possibility, but we infer the reason it can 
                  ; happen that John dances is that he is *able* to dance,
                  ; i.e., (:i John.name (:f able-to dance.v)). The other option
                  ; would be to uniformly use initial pred-modifier semantics,
                  ; but that would *require* subsequent transformation of
                  ; have.aux, will.aux, etc., to operate at the sentence 
                  ; level, as they seem not to have pred-modifier readings.
                  ;
                  ; The following could be done much more concisely, but is
                  ; done enumeratively for transparency and modifiability.
                 (setq result
                           ; Progressive "be" -- an exceptional form of "be"
                           ; supplying more than tense, viz. PROG operator
                           ; Cover this in the first part of the "if", and 
                           ; cover all other auxiliaries in the second part
                       (if (member pos '(PRG PRGZ PRGD PRGP))
                           (case word 
                            ((be been) '(:l P (:l x (:f prog (:i x P)))))
                            ((is \'s am \'m are \'re) 
                             '(:l P (:l x (:o pres (:f prog (:i x P))))) )
                            ((was were) ; ** what about would-be meaning (whose
                                        ; "be"-part here is progressive)?
                                        ; Post-repair 'past' to 'pres-subjunc'?
                             '(:l P (:l x (:o past (:f prog (:i x P))))) )
                            (T ; unexpected; maybe some other spelling
                             '(:l P (:l x (:f prog (:i x P))))) )
                   
                           ; Check for auxiliary other than progressive "be"
                           (case word
                             ; to
                             (to '(:l P P)); originally, I used Ka here, but this
                                           ; seems wrong in for-to sentences,
                                           ; or "endeavored/seemed to leave";
                             ; Passive "be" -- assumed to supply tense only
                             ((be being been bin)   
                             '(:l P (:l x (:i x P))) )
                             ((is \'s am \'m are \'re)
                              '(:l P (:l x (:o pres (:i x P)))) )
                             ((was were) ; ** what about would-be meaning
                                         ; (whose "be"-part here is passive)?
                                         ; Post-repair 'past' to 'pres-subjunc'?
                              '(:l P (:l x (:o past (:i x P)))) )

                             ; Perfect "have" -- supplies tense & PERF operator
                             ((have \'ve) ; could be 2p/3p present, or base form
                                ; in a Charniak parse); so preprocessing changes
                                ; (AUX have) to (AUXP have), in the context of
                                ; an NP VP sentence
                              (case pos   
                                (AUXP '(:l P (:l x (:o pres (:f perf (:i x P))))))
                                (T '(:l P (:l x (:f perf (:i x P))))) ))
                             (having  ; -ing form is for adverbials ("having left")
                              '(:l P (:l x (:f perf (:i x P)))) )
                             (has
                              '(:l P (:l x (:o pres (:f perf (:i x P))))) )
                             (had ; ** NB: "had" can also be subjunctive -- 
                                  ; Post-repair 'past' to 'past-subjunc'?
                                  ; clitic "'d" can be either "had" or "would"
                                  ; so we treat that case separately below;
                              '(:l P (:l x (:o past (:f perf (:i x P))))) )

                             ; Emphatic/question "do" -- supplies tense only
                             (do ; could be 2p/3p present, or base form
                              (case pos
                                (AUXP '(:l P (:l x (:f pres (:i x P)))))
                                (T '(:l P (:l x (:i x P)))) )) 
                             (does
                              '(:l P (:l x (:f pres (:i x P)))) )
                             (did ; ** Again, can also (rarely) be subjunctive;
                                  ; Post-repair 'past' to 'pres/past-subjunc'?
                                  ; ("He figured if he did it, he'd be caught";
                                  ; "He figures if he did it, he'd be caught");
                              '(:l P (:l x (:o past (:i x P)))) )

                             ; Clitic 'd -- ambiguous between "had" & "would";
                             ; We should change this in preprocessing to "had"
                             ; and "would", depending on a following VP sister
                             ; having VBEN|AUXEN (or VBN|AUXN, if not properly
                             ; processed) or VB|AUX as its verb type. But just
                             ; in case there are still residual 'd clitics:
                             (\'d '(:l P (:l x (:o past/pres (:f perf/would
                                                                (:i x P) )))))

                             ; Modal auxiliaries; treat as S-level operators
                             ; (Note: we rely on the words themselves, not the 
                             ; 'MD' part of speech assigned by Charniak, to
                             ; obtain the LF.)
                             ((can ca could may might must ought shall sha should
                               will \'ll wo would ) ; "ca" is from "ca n\'t"; etc.
                                                    ; for clitic 'd see above
                              (setq mod-op    
                                    (case stem 
                                       ((can ca) 'can.md) (could 'could.md)
                                       ; N.B.: "dare" is mobl, but not
                                       ; aux, so is not covered here;
                                       ; any (AUX dare) should be changed
                                       ; to (VB dare) in preprocessing.
                                       (may 'may.md) (might 'might.md)
                                       (must 'must.md) (ought 'ought.md)
                                       ((shall sha) 'shall.md) 
                                       (should 'should.md)
                                       ((will \'ll wo) 'will.md) 
                                       (would 'would.md) ))
                              (case mod-op
                                    ((can.md may.md shall.md will.md)
                                     `(:l P (:l x (:o pres 
                                                     (:f ,mod-op (:i x P)) ))))
                                    ((could.md might.md must.md ought.md 
                                      should.md would.md ); ambiguous pres/past
                                      ; NB: ** A future preprocessing step, based
                                      ; on a general pattern transducer, should 
                                      ; make unembedded and present-embedded 
                                      ; (subordinate) occurrences of these words
                                      ; pres tense, and past-embedded (subordinate
                                      ; occurrences past tense. Only "would" can
                                      ; be past tense without being past-embedded).
                                     `(:l P (:l x (:o pres/past 
                                                     (:f ,mod-op (:i x P)) ))))))
                             (t ; unexpected type of auxiliary;
                                ; mark it with asterists, & use 'aux' extension
                                (intern
                                 (concatenate 'string
                                  "*" (string stem) 
                                  (case pos (md "*.MD") (t "*.AUX")) )))))))
              
              ; Auxiliaries have been covered; next do other verbs 
              (TO ; interpret to (in an infinitive) as identity 
                  ; (nominalization using Ka should happen at NP-level)
                   (setq result '(:l P P)) )
              (BE ; Dec 8/12: Despite the distinctive POS,  I've decided
                  ; to treat "be" (as main verb) uniformly with other 
                  ; instances of main verbs V below, as if expanding case
                  ; (VBZ VBP) to (VBZ VBP BEZ BED), etc.; this will
                  ; give LFs like (:i Al.name (:f be.v happy.a)) as
                  ; opposed to (:i Al.name happy.a), i.e., treating 
                  ; BE as vacuous, except for the tense, if any. Note
                  ; that for "is a man" (i.e., nominal complement), I'll
                  ; need to use identity (the property of being = some man)
                   (setq result
                         (case pos
                               ((BEZ BEP) '(:l P (:o pres (:p be.v P))))
                               (BED '(:l P (:o past (:p be.v P))))
                               (t '(:l P (:p be.v P))) )))
              (V ; Nonauxiliary, non-to, non-be verbs
                   (setq result
                         (case pos
                               ((VBZ VBP) (list :o 'pres log-atom))
                               (VBD (list :o 'past log-atom))
                               ; participles, as used in adverbials
                               ; such as "Believing himself safe, he..."
                               ; or, "Knocked to the ground, he ...":
                               (VBG-PRT `(:l x (:p at-time.p
                                                 (:q that.det time.n)
                                                   (:f prog
                                                     (:i x ,log-atom) ))))
                               (VBN-PRT  `(:l x (:p at-time.p
                                                 (:q that.det time.n)
                                                   (:f perf
                                                     (:i x ,log-atom) ))))
                               (t log-atom) ))); otherwise, no change

              (P ; Prepositions are generally just rendered as atoms, but
                 ; "without" and "like" are exceptions
                  (setq result
                    (if (eq word 'without); "without" contains a negation
                       '(:l y (:l x (:f not (:i x with.p y))))
             ;         '(:l y (:p with.p (:q no.det (:l x (:i x = y)))))
                        (if (eq word 'like); "like" is intensional
                           '(:l y (:l x (:i x like.p (:l z (:i z = y)))))
                            log-atom ))))

              ; Special adverbs (For those not explicitly enumerated, we
              ; use the already-set value of result, viz., log-atom, as
              ; the final default case)
              (ADV (setq result
                         (case word ; there should be no 2nd word (ignore);
                            ;
                            ; Separately interpret {not, n\'t} adverbs,
                            ; which are virtually unique in occurring in
                            ; Charniak parses without an ADVP wrapper,
                            ; i.e., just as (RB not), (RB n\'t). For all
                            ; other sentence adverbs we postpone lambda
                            ; abstraction to the ADVP level, so that mofifiers
                            ; can be applied before that. See the functions
                            ; 'sentence-modifying-advp?' in "ttt-preds-*.lisp"
                            ((not n\'t) '(:l p (:l x (:f not (:i x p))))) 

                            ; Preposition-like adverbs
                            (where '(:p at/to-loc.p (:q wh location.n)))
                                    ; NB: relative occurrences and PS occurrences
                                    ; are treated in separate sections below.
                                    ;
                                    ; NB: I had a (:r ...) wrapper around this
                                    ; originally, but this causes problems e.g.,
                                    ; for "APPROXIMATELY WHERE is Rochester?", or
                                    ; "EXACTLY WHERE do you think you're going?",
                                    ; so I decided that the wrapper should be 
                                    ; supplied in the context (e.g., VP) where
                                    ; the apparent ADVP (which could actually be
                                    ; PP-like) occurs (as a trace, or explicitly
                                    ; as in "You're going/living WHERE?")
                                    ;
                                    ; Actually, "where" is more often a PP
                                    ; (as in "Where is he?") than an ADV (as
                                    ; in "Where did he go?"), but the standard
                                    ; parsers uniformly say it's an adverb (WRB)
                                    ; So use ambiguous at/to-meaning here rather
                                    ; than committing. (Separating out the two
                                    ; uses would require more preprocessing.)
                                    ; The same holds for the remaining words.
                            (wherever 
                              '(:l w (:r (:p at/to-loc.p
                                            (:q every.det
                                              (:l x (:i (:i x location.n) and
                                                        (:f (:l -t- w) x) )))))))
                             ; TBC++++++ "whenever", "however"(??) "whatever"??
                             ; but first check whether the above is right
                            (everywhere 
                              '(:p at-loc.p (:q every.det location.n)) )
                            (everyplace
                              '(:p at-loc.p (:q every.det place.n)) )
                            (somewhere
                              '(:p at-loc.p (:q some.det location.n)) )
                            (someplace
                              '(:p at-loc.p (:q some.det place.n)) )
                            (anywhere
                              '(:p at-loc.p (:q any.det location.n)) )
                            (anyplace
                              '(:p at-loc.p (:q any.det place.n)) )
                            (nowhere
                              '(:p at-loc.p (:q no.det location.n)) )
                            (noplace
                              '(:p at-loc.p (:q no.det place.n)) )
                            (when '(:f adv (:p at-time.p (:q wh time.n))))
                                   ; **Unfortunately the Brown annotations mark
                                   ; almost all adverbial-*forming* uses of "when"
                                   ; as being (WHADVP (WRB when)), whereas "while",
                                   ; in exactly the same role, is marked as (IN
                                   ; while). Thus preprocessing is needed to 
                                   ; change these uses of "when" (and likewise
                                   ; "whenever") to (IN when), with the under-
                                   ; standing that (SBAR (IN ...) (S ...)) is
                                   ; to be interpreted as an ADVP.
                            (why '(:f adv (:p for-reason.p (:q wh reason.n))))
                            ; ** The following is for "how" modifying a VP 
                            ; ("How did he do it?") but we should also be able
                            ; to handle it as wh-A ("How is he?"), and as pre-AD
                            ; ADV ("How tall is he?", "How fast did he run?")
                            (how '(:f adv (:p in-manner.p (:q wh manner.n))))
                            (t result) )))); otherwise, no change
        
        ; At this point, noun, auxiliary, verb and adverb LFs are in final form.
        ; We still need to attach some properties before returning the result.
        ; These were used for abstraction in the 2002-2009 version of KNEXT,
        ; but should also be useful for knowledge retrieval & inference when
        ; the goal is full, inference capable LFs.
        (when (not old); (assume that if a logical atom was previously
                       ; created, its properties were set at that time)
              (setf (get log-atom 'type) general-pos)
              (case general-pos
                  (N  (if (event-noun stem)
                          (setf (get log-atom 'event-pred) T)
                          (if (attribute-noun stem)
                              (setf (get log-atom 'attribute) T)) ))
                  (NAME (setf (get log-atom 'entity-type)
                                  (guess-entity-type (cdr pos+word{s})) ))
                              ; (** here it would be nice to improve 
                              ; entity-type guessing!)
                  (A (if (not (get log-atom 'nondescriptive))
                              (setf (get log-atom 'descriptive) T) ))
                  ((AUX BE TO) (setf (get log-atom 'modifier) T) )
                  ((ADV PDET) (setf (get log-atom 'modifier) T)) ))
                   ; (though as noted above ADVs like "where" can be PPs)
        (return result)

    DET ; Embed the determiner in a lambda-abstract that maps a monadic 
        ; predicate to an unscoped quantifier (for consistency with 
        ; the semantics of genitive DETPs). Note: possessive determiners
        ; require a more complex translation than nonpossessive ones,
        ; since they need to express that the tacit referent in the 
        ; possessive "has" the entity referred to.
        ; **REMINDER: DETs and DETPs can be predicates, and I need to handle
        ;   this somewhere; e.g., "The book is mine/his/Mary's" .
        ;   (Note that these predicates are *not* definite determiners.)
        (cond ((member word '(my your yer thy his her its our their))
               (setq possessor
                     ; We take the view that "I, you, ..., they" are
                     ; deictic names for individuals, to be deindexed
                     ; later; after all, even a name like "John" can
                     ; have various referents, depending on context, and
                     ; so should really be particularized post hoc to
                     ; something unique like JOHN34.NAME
                     (case word (my 'me.pro) ((your yer) 'you.pro)
                        (thy 'thou.pro) (his 'he.pro) (her 'she.pro)
                        (its 'it.pro) (our 'we.pro) (their 'they.pro) 
                        (whose '(:q which.det person.n)) )); added 1/31/10
                        ; Note that wh-determiner "whose" is different
                        ; from rel-deterniner "whose" (see below -- the
                        ; latter contains a free trace variable -t-). As noted,
                        ; preprocessing needs to make the distinction
                        ; between wdt & wdt-rel.
               (setq result
                    `(:l P (:q the (:l x (:i (:i x P) and
                                           (:i x pertain-to ,possessor) ))))))
              ((member word '(this these those))
               (setq result 
                    `(:l P (:q the (:l x (:i (:i x P) and
                                             (:i x attended-to-by*.a Speaker)))))))
              ((eq word 'that)
               (setq result
                    `(:l P (:q the (:l x (:i (:i x P) and
                                             (:i x new-salient-entity*.n)))))))
              (T (setq result `(:l P (:q ,log-atom P)))) )
        (return result)

   PRO  ; For pronouns the underlying logical atoms such as ME.PRO,
        ; YOU.PRO, YOURSELF.PRO, etc., have been globally set,
        ; and appropriate properties attached (incl. entity-type).
        ; Here we just need to map multiple forms to the same logical
        ; atom or unscoped term.
        ;
        (setq result
              (case word ((who whom) '(:q wh person.n)) (what '(:q wh thing.n))
                         ((i me ah) 'me.pro) (myself 'myself.pro)
                         ((we us \'s) 'we.pro) (ourselves 'ourselves.pro)
                         ((you ya ye yuh) 'you.pro) (y\'all 'you-all.pro)
                         (yourself 'yourself.pro) (yourselves 'yourselves.pro)
                         ((thou thee) 'thou.pro) (thyself 'thyself.pro)
                         ((he him) 'he.pro) (himself 'himself.pro)
                         ((she her) 'she.pro) (herself 'herself.pro)
                         (it 'it.pro) (itself 'itself.pro)
                         ((they them) 'they.pro) (themselves 'themselves.pro)
                         (oneself 'oneself.pro)
                         ((everyone everybody) '(:q every.det person.n))
                         ((someone somebody) '(:q some.det person.n))
                         (one (if (eq stem 'no_one)
                                 '(:q no.det person.n)
                                 '(:q a{n}.det person-or-thing.n) ))
                         ((anyone anybody) '(:q any.det person.n))
                         (everything '(:q every.det thing.n))
                         (something '(:q some.det thing.n))
                         (nothing '(:q no.det thing.n))
                         (anything '(:q any.det thing.n))
                         ((mine yours thine his hers ours theirs)
                          (setq possessor
                             (case word
                               (mine 'me.pro) (yours 'you.pro)
                               (thine 'thou.pro) (his 'he.pro)
                               (hers 'she.pro) (ours 'we.pro)
                               (theirs 'they.pro) ))
                          `(:q the 
                                (:l x (:i (:i x salient-entity*.n) and
                                          (:i x pertain-to ,possessor) ))))
                         (T ; unknown or misanalyzed pronoun 
                            (setf (get log-atom 'type) '*U*)
                            (setf (get log-atom 'word) word)
                            log-atom )))
        (return result)

    REL ; relative pronoun "that", "who{m}", "which"; relative determiner 
        ; "whose"; relative adverbs "where", "when", "why". The interpretation
        ; includes free variable r to be abstracted at the relclause level.
        ; Again we don't include an (:r ...) wrapper, on the assumption that
        ; such a wrapper will be added in the phrasal context where the XP[rel]
        ; occurs as a trace. To ensure this, the trace for not only a relative
        ; WHPP, but also for a relative WHADVP, should be of type PP/PP (or
        ; rather, (PP -nul-), or something like that).
        (setq result
              (case word
                 (that 'r)
                 ; For "who(m)" and "which", as relative pronouns, we want
                 ; to include the person/thing distinction:
                 ((who whom)
                    '(:q the (:l x (:i (:i x person.n) and (:i x = r)))))
                 (which '(:q the (:l x (:i (:i x thing.n) and (:i x = r)))))
                 (where ; e.g., "the place where he ..."
                   '(:p at/to-loc.p r))
                 (whereby ; e.g., "the means whereby he ..." (cf., "by sheer guile")
                   '(:p by-means.p r))
                 ((wherefrom whence) ; e.g., "the region wherefrom he hails"
                   '(:p from-loc.p r))
                 ((whereto whither) ; e.g., a place whereto the butterflies return ..."
                   '(:p to-loc.p r))
                 (wherewith ; e.g., the means wherewith he started the company"
                   '(:p with-means.p r))
                 (whereon ; "the ground whereon she walks"
                   '(:p on-loc.p r))
                 (wherein ; "the caves wherein they dwell"
                   '(:p in-loc.p r))
                 (whereunder ; "trees whereunder animals may find shelter"
                   '(:p under.p r))
                 (when ; e.g., "a time when the pace of life was slower"
                   '(:p at-time.p r))
                 ((why wherefore) ; e.g., "the reason why he quit"
                   '(:f adv (:q for-reason.p r)))
                 (whose '(:l P (:q the (:l x (:i (:i x P) and
                                                      (:i r have-poss.v x) )))))
                    ; ignoring the possibility ?"the man whose it is"
                 (T ; unknown or misanalyzed REL word
                    (setf (get log-atom 'type) '*U*)
                    (setf (get log-atom 'word) word)
                    log-atom )))
        (return result)

    PS  ; specially interpret "prepositions" that are combined with sentences,
        ; forming PPs/ADVPs, as in "when he left", "while he slept", "after he
        ; returned", "as he was leaving", "before he shaved", etc.
        ; E.g., "When he arrived" becomes (roughly) "at the time at which 
        ; he arrived".
        
        (setq result
           (case word
             (when; temporal reading
               '(:l S (:p at-time.p 
                         (:q the
                            (:l t (:i (:i t time.n) and
                                      (:f (:l -t- S) (:p at-time.p t)) ))))))
             (where
               '(:l S (:p at/to-loc.p 
                         (:q the
                            (:l x (:i (:i x location.n) and
                                      (:f (:l -t- S) (:p at/to-loc.p x)) ))))))
             (whenever; temporal reading
               '(:l S (:p at-time.p                          
                         (:q all 
                            (:l t (:i (:i t time.n) and
                                      (:f (:l -t- S) (:p at-time.p t)) ))))))
             (wherever
               '(:l S (:p at/to-loc.p
                         (:q all
                            (:l x (:i (:i x location.n) and
                                      (:f (:l -t- S) (:p at-loc.p x)) ))))))
             (until
               '(:l S (:p until-time.p
                         (:q the
                            (:l t (:i (:i t time.n) and
                                      (:f (:l -t- S) (:p at-time.p t)) ))))))
             (while; temporal reading
               '(:l S (:p during-time.p
                         (:q the
                            (:l t (:i (:i t time.n) and
                                      (:f (:l -t- S) (:p at-time.p t)) ))))))
             (before
               '(:l S (:p before-time.p
                         (:q the
                            (:l t (:i (:i t time.n) and
                                      (:f (:l -t- S) (:p at-time.p t)) ))))))
             (after
               '(:l S (:p after-time.p
                         (:q the
                            (:l t (:i (:i t time.n) and
                                      (:f (:l -t- S) (:p at-time.p t)) ))))))
             ; "As"-adverbs, temporal reading;
             ; Temporal/atermporal ambiguity is hard to resolve; e.g.,
             ; "She left as he was ranting" -- is it "while" or "because"?
             (as
               (case stem 
                  (as '(:l S (:p during-time.p
                         (:q the
                            (:l t (:i (:i t time.n) and
                                      (:f (:l -t- S) (:p at-time.p t)) ))))))
                  (as_soon_as
                      '(:l S (:p at-time.p
                        (:q the
                          (:f earliest 
                            (:l t (:i (:i t time.n) and
                                      (:f (:l -t- S) (:p at-time.p t)) )))))))
                  (as_long_as; same as "while"? (inaccurate)
                      '(:l S (:p during-time.p
                         (:q the
                            (:l t (:i (:i t time.n) and
                                      (:f (:l -t- S) (:p at-time.p t)) )))))) 
                  (t log-atom) ))

              (t log-atom) ))

        (return result)

   IJ  ; Specially interpret interjection words like "hello", "oh", ...
       (setq result
         (case word
           (hello '(:l x (:i I.pro direct-hello-towards*.v x)))
           (hi '(:l x (:i I.pro direct-hi-towards*.v x)))
           (hey '(:l x (:i I.pro direct-hey-towards*.v x)))
           (oh '(:l x (:i I.pro direct-oh-towards*.v x)))
           (oops '(:i I.pro direct-oops-towards*.v that.pro))
           (damn '(:i I.pro direct-damn-towards*.v that.pro))
           (yes '(:i I.pro say-yes-to*.v that.pro))
           (no '(:i I.pro say-no-to*.v that.pro))
           (t `(:l x (:i I.pro 
                      ,(intern (format nil "DIRECT-~a-TOWARDS*.V" word)) x )))))
       (return result)

;     *** -- this is not complete

 )); end of derive-word-lf


; NB: (defun preprocess-tree ...) and (defun preprocess-tree1 ...) 
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;     and their specialized subroutines now reside in 
;     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;     'initialize-and-preprocess.lisp' [& another version in "refine-parse..."]
;     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


(defun event-noun (noun); June 12/01; Jan 2/08; Oct 9/10
;~~~~~~~~~~~~~~~~~~~~~~~
; Heuristically test whether `noun' (a singular noun, as an atom) is likely
; to be an event noun, where an of-complement adds an "undergoer". For 
; example, "destruction" is such a noun, whereas "recommendation" is not
; since, e.g., in "recommendation of the jury", the jury does the recommending,
; rather than undergoing it). Other non-examples are "mission", "convention",
; "experiment", etc., even though these generally denote events). This is
; done by using a few morphological rules, and use of list of positive and  
; negative exceptions to the rules. 
; 
; A difficulty is that many "NP[event] of NP" are ambiguous, in a fairly
; balanced way, between a reading where the 2nd NP is the undergoer,
; and where it is the agent of the event. E.g., "contribution of Mary",
; vs. "contribution of money". So significant improvement would require
; knowledge of the argument type.
;
  (prog (backword) 

        (case noun
          ; morpholically unrecognizable undergoing-event nouns:
          ; CHANGED JAN 2/08; GREATLY EXPANDED OCT 9/10
          ((abuse accident adventure agony airdrop ambush analysis anger 
            anguish anorexia apocalypse apotheosis appendectomy arrest 
            arthritis ascent assault ban bankruptcy barter belch bellyache 
            birth birthday bloat blockage breach breakage breakdown breakup 
            bribery broadcast bronchitis buildup burglary burnout burp 
            bursitis butchery capture catharsis censure change changeover 
            checkup chemotherapy clash cleanup colonoscopy cough crash 
            closure cloture collapse conflict conquest cramp crash
            critique death decay decline decrease defeat delay delerium
            delivery demise departure descent dialysis discovery
            divestiture divorce doom doomsday drainage drift eclipse 
            electrolysis encephalitis erasure 
            event exchange exegesis exhibit exodus expenditure exposure 
            failure fall falloff fate fever fibrosis forfeiture flexure
            flop flow flush fracture gasp genesis giveaway glide haircut 
            handover hand-over headache hepatitis holdup holocaust 
            homeostatsis hydrolysis hypnosis hysterectomy
            hysteresis hysteria idolatry increase infancy inflow influx
            injury lapse laughter launch layoff lobotomy lockout lockup
            loss mania manufacture marriage martyrdom massage mastectomy
            meltdown menengitis menopause metamorphosis mitosis mockery
            murder necrosis neglect nemesis neuritis nightmare nurture 
            orgasm ostracism pandemonium paralysis 
            pardon parody parse pass penury physiotherapy plunder plunge 
            poverty praise preview progress psychoanalysis psychosis 
            psychotherapy puncture purchase radiotherapy
            rage rape rapture remand rescue ridicule rinse rise roast 
            ruin rupture sabotage scan search seizure setback shift 
            shrinkage shudder shutdown siege simulcast slander slaughter 
            sleep slide slip slowdown slumber sneeze spasm speedup 
            spill spillage spin split spoilage stardom start stasis
            storage struggle stumble stupor surgery surrender
            survey suture swab swap synthesis takeover test theft therapy
            thrombisis tonsillectomy tonsillitis torture toss transfer 
            trickle trip tumble turnabout turnaround turnover tutelage 
            twist twitch use upholstery upkeep upset vasectomy venture 
            voyage wastage waste wobble worship wrapup) ; 
           (return T) )
          ;
          ; We add a case here for exceptions to the rules at the end, 
          ; returning nil for these; the test for putting words on this list
          ; is, do they commonly occur with "of" and when they do, would it be
          ; bad to rephrase "x of y" as "y undergoes x"?

          ((foreboding heading offering ; a fairly complete exclusion list
            morning evening clothing coating feeling meaning scaffolding 
            bing arcing ding pudding spalding inholding being edging lagging
            legging pegging rigging wigging thing something nothing plaything
            anything everything king bluestocking Viking sibling cling seedling
            foundling hireling fling fledgling duckling inkling bestselling
            sapling darling sparling starling sanderling underling sterling
            sling mudsling gosling lemming shortcoming subsuming beginning
            cunning aborning lightning foregoing churchgoing ping weatherstripping
            ring smattering spring bedspring offspring earring averring string
            shoestring bowstring sting formatting abetting pacesetting typesetting
            teletypesetting earsplitting thanksgiving lawgiving earthmoving
            wing lacewing owing batwing zing

            acclamation accusation action adhesion admiration admonition
            affectation affection aggression allegation ambition ammunition
            approbation argumantation assumtion attention attestation
            aversion bastion caption coalition cohesion collocation collusion
            combination commendation compassion composition compunction
            conclusion condescension condition confession configuration
            confrontation congregation concession connotation constitution
            contention contraption contribution convention conversation
            decision declaration denotation derision description destination
            devotion diction dimension direction discretion dissertation
            duration emotion erudition evasion exaltation exception
            exclamation expectation expedition experimentation explanation
            exultation fiction flirtation foundation fraction friction
            function gumtion habitation illusion imagination imprecision
            impression inaction inattention inclination inclusion indecision
            indignation information injunction inscription insurrection
            intention intervention intrusion intuition invitation
            irresolution junction jurisdiction lamentation lesion limitation
            location locomotion locution machination mansion midsection
            mission munition nation notion nutrition obsession occasion
            omission opposition option organization passion pension
            permission perspiration petition pigmentation portion position
            possession potion precaution procession profession profusion
            proportion proposition propulsion protestation provision
            position precision premonition preposition prescription
            presumption presupposition protusion question recommendation
            recursion religion reputation resignation respiration
            retribution revolution revulsion salutation sanction satisfaction
            seclusion section sedition situation solicitation station
            stupefaction succession suction suggestion superstition
            supposition suspicion tension torsion tradition version
            vision workstation


            cabal cannibal gimbal decal radical umbilical geochemical
            radiochemical physiochemical petrochemical sabbatical bifocal
            reciprocal rascal mescal medal pedal scandal sandal vandal 
            conceal deal ideal meal cornmeal oatmeal cereal seal goldenseal
            teal veal weal commonweal zeal offal gal illegal madrigal paschal
            marshal withal wherewithal special official financial dial radial
            gerundial sundial cordial binomial multinomial monomial polynomial
            baronial marsupial aerial serial material memorial factorial
            editorial terrestrial extraterrestrial sial initial credential
            exponential differential essential potential vial extremal decimal
            hexadecimal animal planetesimal infinitesimal mammal isothermal
            normal paranormal abnormal orthonormal canal arsenal signal
            cardinal ordinal original aboriginal marginal virginal criminal
            nominal terminal urinal annal diagonal orthogonal professional
            supranational eternal journal tribunal communal coal charcoal foal
            goal shoal pal sepal principal opal estoppal cathedral liberal
            numeral general mineral funeral collateral integral admiral spiral
            oral coral moral corporal pectoral chaparral corral mitral central
            neutral plural mural natural proposal transversal vassal metal
            petal barbital orbital genital capital hospital total portal 
            pedestal crystal dual individual manual equal usual actual factual
            intellectual victual spiritual bisexual homosexual heterosexual
            naval carnival rival oval larval interval loyal


            significance riddance impedance seance chance ambiance fiance 
            affiance alliance appliance lance balance imbalance semblance 
            parlance conformance ordnance countenance sustenance provenance 
            ordinance finance luminance governance forbearance clearance
            appearance encumbrance hindrance furtherance temperance 
            intemperance perseverance durance endurance insurance assurance
            nuisance reflectance inductance conductance transconductance
            capacitance inheritance acquaintance susceptance inertance
            stance circumstance instance emittance remittance transmittance 
            nuance advance grievance relevance connivance contrivance allowance
            abeyance conveyance annoyance

            apartment argument armament cement compartment complement compliment
            condiment counterargument decrement department detriment
            disappointment document element embodiment emolument experiment
            figment filament fragment government impediment implement increment
            instalment instrument integument ligament liniment moment monument
            ointment ornament parliament pediment pigment regiment sacrament
            sediment segment sentiment statement tenement testament);
           (return nil) )
         )
        (setq backword (reverse (coerce (string noun) 'list)))
        ; Exceptions to the following have been pretty fully enumerated above
        (if (or (ends-in backword '(#\I #\N #\G))
                (ends-in backword '(#\S #\I #\O #\N))
                (ends-in backword '(#\T #\I #\O #\N))
                (ends-in backword '(#\A #\L))
                (ends-in backword '(#\A #\N #\C #\E))
                (ends-in backword '(#\M #\E #\N #\T)) )
            (return T) )
 )); end of event-noun


(defun attribute-noun (noun); June 13/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Heuristically test whether `noun' (a singular noun, as an atom) is likely
; to be an `attribute noun' such as "kindness", "heat", "excitement", etc.
; (typically de-adjectival).
;
  (prog (backword)

        (case noun
          ; Morphologically unrecognizable cases:
          ; Note: many cases are covered pretty well by using "have"
          ;       (i.e., having a property) so completeness is not vital
          ((heat cold warmth excitement wrath) ; ** others ??
           (return T) )
          ; Add a case here for exceptions to the rules that follow,
          ; returning nil for these
          ((witness business illness governess)
           (return nil) ))
         
        (setq backword (reverse (coerce (string noun) 'list)))
        (if (ends-in backword '(#\N #\E #\S #\S))
            (return T) )
 )); end of attribute-noun


(defun derive-phrase-lf (tree rhs-lfs); Mar 31/03 - Oct 14/03; Nov 7/12
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; **Oct 14/03: This is a first draft of the entire lf-computation; 
;   some problems haven't been cleared up and there remain some 
;   assumptions about fixes to the parser still to be done;
;   (see ../plan-for-completion)
; **Note: PPs occurring after the verb in a VP are currently treated
;   as if they were indeed arguments, rather than adjuncts (except in
;   cases where they are simply ignored). The idea is that LF-computation
;   shouldn't have to make this distinction. Now, since parsers won't
;   get this right, we'll either have to preprocess phrase structures
;   to convert PP complements to ADVP where appropriate, or do this
;   in postprocessing LFs; e.g., (:i Speaker talk.v (:p to.p Mary.name))
;   would become (:i Speaker talk-to.v Mary.name); while (:i Kim.name
;   walk.v (:p to.p Tops.name)) would become (:i Kim.name 
;   (:f (:f adv-a (:p to.p Tops.name)) walk.v)). 
;
; PURPOSE: For the preprocessed Treebank tree `tree', and the given 
;     logical forms of the immediate constituents of the root (recursively 
;     obtained by the calling program), compute the logical form for 
;     (the top level of) the tree. Logical forms are obtained by applying
;     semantic rules (associated with particular phrase structure patterns)
;     to logical forms obtained for the constituents. This is done by 
;     "combine-lfs".
;
; tree: a list structure representing a PST, WITH A LIST RATHER THAN WORD
;     ATOM AS FIRST CONSTITUENT; e.g.
;         (S (NP ...) (VP ...)),
;     rather than something like (VBD walked), (-NONE *T*), or (NP -nil-).
;     The calling program takes care of lexical and trace constituents.
; rhs-lfs: the right-hand side LFs, i.e., the list of LFs of the
;     immediate constituents of the phrase.    
;
 (prog ((rootcat (first tree)) matchlist)

       (if (listp rootcat) ; unexpected condition
           ; assume leftmost atom is the actual type of the root
           (setq rootcat (leftmost-atom rootcat)) )

       ; Root categories considered are S1, S, NP, VP, PP, ADVP, ADJP, SBAR, WHNP, 
       ; WHPP, WHADVP, SINV, PRN, PRT, DETP and UCP; (DETP is an added category
       ; for genitives of form (DETP (NP) (POS |'S|)), after preprocessing.)
       ; *** FURTHER CATEGORIES STILL TO BE ADDED...

       ; Since PPs are preprocessed to produce numerous subtypes,
       ; and we don't want to have a separate "case" for each subtype,
       ; we abstract the rootcat back to PP for PP-subtypes:
       (if (isa rootcat 'PP) (setq rootcat 'PP))

       ; First deal with coordination; allow for comma + coordinator;
       ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       ; since we don't have a way of ignoring the commas in a comma-
       ; separated list of arbitrary length, we clumsily provide different
       ; rules for different lengths of conjunctions (up to 10). We 
       ; ignore material after the last conjunct, which is apt to be due
       ; to a bad parse (or perhaps another punctuation mark). An alternative
       ; to the clumsy enumerative approach would be to delete the COMMA
       ; constituents in conjunctions in preprocessing; or we could delete
       ; them here (& their LF counterparts from rhs-lfs).
       ;
       (when (find-if #'(lambda (x) (and (listp x) (eq (car x) 'CC)))
                        (cdr tree) ); bypass phrases with no coordinator
          ; We treat NP and-coordination as set-forming to begin with,
          ; and that distinguishes it from all other coordinate structures.
          ; While some sets (collections) will need to be postprocessed to
          ; form a distributive reading (in effect inserting "each member of"),
          ; it would be much harder to postprocess a scoped distributive
          ; reading to form a collective one. (**Ultimately we should find
          ; a way to decide *prior* to scoping whether or not to insert
          ; "each member of".)
          ;
          ; Are all list elements either of type NP, NNP, NNPS, CC, or comma,
          ; where the CC is "and"? (Note: 'DELIM' includes punctuation,
          ; brackets, and quotes.) If so use a 'set-of' interpretation.
          (cond 
           ((not (find-if-not 
                       #'(lambda (x) 
                          (or (not (listp x))
                              (member (car x) '(NP NP-TIME NNP NNPS |,|))
                              (equal x '(CC and)) ))
                         (cdr tree) ))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) (CC) ( ) (* (DELIM)) ) ))
            (if matchlist 
                (return (combine-lfs rhs-lfs matchlist '(:f set-of 1 4) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) (CC) ( ) (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist '(:f set-of 1 3 6) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) ( ) (- \,) (CC) ( ) (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist '(:f set-of 1 3 5 8) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) 
                  (CC) ( ) (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist 
                                                 '(:f set-of 1 3 5 7 10) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) 
                  (- \,) (CC) ( ) (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist 
                                              '(:f set-of 1 3 5 7 9 12) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) 
                  (- \,) ( ) (- \,) (CC) ( ) (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist 
                                          '(:f set-of 1 3 5 7 9 11 14) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) 
                  (- \,) ( ) (- \,) ( ) (- \,) (CC) ( ) (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist 
                                       '(:f set-of 1 3 5 7 9 11 13 16) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,)
                  ( ) (- \,) ( ) (- \,) ( ) (- \,) (CC) ( ) 
                  (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist 
                                   '(:f set-of 1 3 5 7 9 11 13 15 18) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) 
                  (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) (CC) ( ) 
                  (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist 
                                '(:f set-of 1 3 5 7 9 11 13 15 17 20) ))))

           (t ; Now deal with non-NP coordinate structure (distributive)
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) (CC) ( ) (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist '(:o 3 1 4) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) (CC) ( ) (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist '(:o 5 1 3 6) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) ( ) (- \,) (CC) ( ) 
                  (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist '(:o 7 1 3 5 8) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) 
                  (CC) ( ) (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist 
                                                    '(:o 9 1 3 5 7 10) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) 
                  (- \,) (CC) ( ) (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist 
                                                 '(:o 11 1 3 5 7 9 12) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) 
                  (- \,) ( ) (- \,) (CC) ( ) (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist 
                                              '(:o 13 1 3 5 7 9 11 14) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) 
                  (- \,) ( ) (- \,) ( ) (- \,) (CC) ( ) (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist 
                                           '(:o 15 1 3 5 7 9 11 13 16) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,)
                  ( ) (- \,) ( ) (- \,) ( ) (- \,) (CC) ( ) 
                  (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist 
                                        '(:o 17 1 3 5 7 9 11 13 15 18) )))
            (setq matchlist (find-parts (cdr tree)
                '(( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) ( ) 
                  (- \,) ( ) (- \,) ( ) (- \,) ( ) (- \,) (CC) ( ) 
                  (* (DELIM)) ) ))
            (if matchlist
                (return (combine-lfs rhs-lfs matchlist 
                                     '(:o 19 1 3 5 7 9 11 13 15 17 20) ))))
          ))

       ; Now deal with specific root categories S, NP, VP, PP, ADVP, ADJP, etc.
       ;
       (case rootcat
             (S1 ; S|FRAG;
                 ; ~~~~~~~~~~ 
                 ; the S1 category is used by Charniak for complete &
                 ; incomplete sentences; it dominates S, NP, or FRAG, it seems.
                 ; (Assume provisionally that it's always just one child; then
                 ; 'rhs-lfs' must also be singleton.)
              ;  (trace instantiate-semrule adjust-semrule); DEBUG

                 ; Dec 21/18: It turns out Charniak S1 trees can also be of form
                 ; SINV + V + NP + ..., in a sentence like "Here is Mary with her cat";
                 ; ~~~~~~~~~~~~~~~~~~~~
                 (setq matchlist
                         (find-parts (cdr tree) '((S S-NO-SUBJ SINV FRAG) (- \.))) )
                 (if matchlist (return (car rhs-lfs))) 

                 ; NP + Period- (though usually the period is part of the NP)
                 ; ~~~~~~~~~~~
                 (setq matchlist
                         (find-parts (cdr tree) '((NP) (- \.))) )
                 (if matchlist (return (car rhs-lfs)) )

                 ; NP + Comma- + PP+ + Period-; e.g., Alice and Bob, in Rome.
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; Usually this structure is a FRAG for Charniak (see below),
                 ; but it can also be created as a result of a repair rule
                 ; that "raises" a PP attached to a final NP conjunct to the
                 ; level of the entire conjunction. **However, it's better to
                 ; interpret S1's consisting of a postmodified NP as just that
                 ; NP (previous rule), because the rule for such NPs is more 
                 ; general -- here we're not allowing for commas between PPs, 
                 ; or for non-PP postmodifiers.
                 (setq matchlist
                         (find-parts (cdr tree) '((NP) (- \,) (+ (PP)) (- \.))) )
                 (if matchlist
                       (return (combine-lfs rhs-lfs matchlist '(:i 1 3))) )

                 ; {PP|VP|ADJP} + period-
                 ; ~~~~~~~~~~~~~~~~~~~~
                 (setq matchlist
                         (find-parts (cdr tree) '((NP (PP) ADJP) (- \.))) )
                 (if matchlist
                     (return 
                       `(:i (:q the salient-entity*.n) ,(car rhs-lfs))) )
                
                 ; {SQ|Q|YNQ} PUNC-; e.g., Can you hear me now?
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 (setq matchlist
                         (find-parts (cdr tree) '((SQ Q YNQ) (- \.))) )
                 (if matchlist (return (car rhs-lfs)))

                 (return (default-lf 'S rhs-lfs)) ); structurally unfamiliar S1

             (FRAG ; NP; e.g., "The happy graduate."
                   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                   (setq matchlist
                         (find-parts (cdr tree) '((NP) (- \.))) ) 
                   (if matchlist 
                       (return `(:i ,(car rhs-lfs) salient-entity*.n)) )
                   
                   ; NP + Comma- + PP; e.g., "Halle, in the front yard.";
                   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                   (setq matchlist
                         (find-parts (cdr tree) '((NP) (- \,) (+ (PP)) (- \.))) )
                   (if matchlist
                         (return (combine-lfs rhs-lfs matchlist '(:i 1 3))) )
                   
                   ; NP + Comma- + PP + Comma + PP+; e.g., "Tanya with her cat,
                   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                   ; in the front yard";
                   ; ~~~~~~~~~~~~~~~~~~
                   (setq matchlist
                         (find-parts (cdr tree) 
                               '((NP) (- \,) ((PP)) (- \,) (+ (PP)) (- \.)) ))
                   (if matchlist
                         (return (combine-lfs rhs-lfs matchlist 
                                     '(:i (:i 1 3) and (:i 1 5)) )))
                   
                   ; NP + Comma- + PP + Comma- + PP+ + Comma- +NP;
                   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                   ;  e.g., "Tanya, with her cat in the front yard, 2003.";
                   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                   (setq matchlist
                         (find-parts (cdr tree) 
                               '((NP) (- \,) ((PP)) (- \,) (+ (PP)) 
                                                    (- \,) (NP) (- \.)) ))
                   (if matchlist
                         (return (combine-lfs rhs-lfs matchlist  
                                   '(:i (:i 1 3) and (:i 1 5)
                                            (:i 7 is-referred-to*.v) )))) 

                   ; INTJ + Comma- + NP; e.g., Hello, Jonnie!
                   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                   ; Interpreted as [I.pro direct-hello-towards*.v Jonnie.name]
                   (setq matchlist
                         (find-parts (cdr tree)
                               '((INTJ) (- \,) (NP) (- \.)) ))
                   (if matchlist
                         (return (combine-lfs rhs-lfs matchlist
                                   '(:p 1 3) )))

                   ; single phrase other than NP; e.g., "in the garden";
                   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                   ; assume ISA paths to PUNC from \, \. \; etc., and 
                   ; to DELIM from brackets and quotes;
                   ;
                   (setq matchlist; allow for punctuation or delimiters
                         (find-parts (cdr tree) '((* (DELIM))
                             (~ (DELIM)) (* (DELIM)) )))
                   (if matchlist
                         (return (combine-lfs
                                     rhs-lfs matchlist
                                       '(:i (:f logical-fragment.f 2)
                                            plays-undetermined-role*.v ))))
                   
                   ; Not an anticipated type of FRAG, with up to 10 phrases;
                   ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                   (setq matchlist ; as above assume ISA paths to PUNC from 
                                   ; \, \. \; etc., and to DELIM from brackets
                                   ; and quotes; ignore PUNCs and DELIMs;
                         (find-parts (cdr tree) 
                           '((* (DELIM)) 
                             (~ (DELIM))   (* (DELIM))
                             (- ~ (DELIM)) (* (DELIM))
                             (- ~ (DELIM)) (* (DELIM))
                             (- ~ (DELIM)) (* (DELIM))
                             (- ~ (DELIM)) (* (DELIM))
                             (- ~ (DELIM)) (* (DELIM))
                             (- ~ (DELIM)) (* (DELIM))
                             (- ~ (DELIM)) (* (DELIM))
                             (- ~ (DELIM)) (* (DELIM))
                             (- ~ (DELIM)) (* (DELIM)) )))
                   (if matchlist
                     (return 
                       (combine-lfs rhs-lfs matchlist
                        '(:i (:f logical-fragments.f 2 4 6 8 10 12 14 16 18 20)
                             stand-in-undetermined-relation*.v ))))

                  ; For FRAGs of more than 10 phrases, even \, \( \) \' etc.
                  ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  ; become part of the LF;
                  ; ~~~~~~~~~~~~~~~~~~~~~~
                   (return 
                     (cons :i (cons (append '(:f logical-fragments.f) rhs-lfs) 
                               '(stand-in-undetermined-relation*.v) ))) )

             (INTJ ; UH; e.g., "Hello [!]", "Oh [, ...]"; "Yes [, ...]
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist
                      (find-parts (cdr tree) '((UH))))
                (if matchlist 
                    (return (combine-lfs rhs-lfs matchlist 1)))

                (return (default-lf 'INTJ rhs-lfs)) ); structurally unfamiliar INTJ

             (S ; PP* + Comma + ADVP* + Comma- + S[coord] + PUNC-
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; e.g., For months, no rain fell and strong winds blew;
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist
                      (find-parts (cdr tree)
                        '((- (PP) ~ WHPP) (- (PUNC)) (- (ADVP)) (- (PUNC))
                          (- (PP) ~ WHPP) (- (PUNC)) (- (ADVP)) (- (PUNC))
                          (S) (* (DELIM))) ))
                (if matchlist
                        (return (combine-lfs rhs-lfs matchlist
                                 '(:f (:f adv-s 1)
                                      (:f 3 (:f (:f adv-s 5) (:f 7 9)))) )))

                ; NP + VP[prt] + X* ; reduced relative mistaken for ordinary VP
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; e.g., "Mary, working on her sculpture."
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Find the first VP (if any) and check whether it's a
                ; progressive/passive participle
                (when (find-if #'(lambda (v) (member (car v) '(VBG VBN)))
                        (cdr (find-if 
                              #'(lambda (x) (and (listp x) (eq (car x) 'VP)))
                                (cdr tree) )))
                      (setq matchlist
                        (find-parts (cdr tree) '((NP) (* (PUNC)) (VP) 
                                                 (* (DELIM)))) )
                      (if matchlist
                        (return (combine-lfs
                                    rhs-lfs matchlist '(:i 1 3) ))))

                ; ADVP- + PP- + NP + VP sentence, perhaps with extra material;
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; e.g., John loves Mary; What happened? (will have wh subject)
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; {Once} upon a time{,} there were three little pigs;
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; When I arrived, Kim quickly left; Though Kim arrived, Sandy left;
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; We ignore extra constituents, other than an initial adverbial,
                ; at the sentence level, since it's unclear how they would arise
                ; or what their semantics would be. Guard against picking up
                ; relative clauses like "with whom John spoke" in this rule, 
                ; which might conceivably be misparsed as WHPP NP VP.
                ;
                ; ** At some point we should check if the possibly neglected
                ; constituents should be allowed for in prior, more specific
                ; rules.
                (setq matchlist 
                      (find-parts (cdr tree) 
                        '((- (ADVP)) (- (PP) ~ WHPP)
                          (* ~ NP VP (ADVP) (PP)) ; e.g., punctuation
                          (NP) (* ~ VP ADVP) (* (ADVP)) (* ~ VP ADVP) (VP) 
                          (* (DELIM)) )))
                      ; Note that we disallow, e.g., "with whom Kim left".
                      ; Note the bracketing of ADVPs and PPs, so that these can
                      ; be ISA-abstractions from more particular types, such as
                      ; PP-ABOUT, PP-DESPITE, PP-OF, or, for clausal adverbials,
                      ; S-WHADVP, S-ALTHOUGH, S-WHEN, S-UNTIL, etc.
                (if matchlist 
                    (return (combine-lfs 
                                rhs-lfs matchlist 
                                     '(:f (:f adv-s 2)
                                          (:i 4 (:f 1 (:f 6 8)))))))

                ; ADVP + Comma- + S; e.g., When I arrived, Kim left
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; This would be a better parse (but may never be produced);
                ;
                (setq matchlist (find-parts (cdr tree) 
                                  '(((ADVP)) (- \,) (S) (- \, \; \.)) ))
                ; (allowing more than punctuation at the end might pick
                ; up something requiring another rule)
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 3) )))

                ; VP + PUNC-; e.g., "Go away!"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree)
                                  '((VP) (- \, \; \.)) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 1)))

                ; S-NO-SUBJ + ADVP- VP + X*
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~
                ; e.g., Losing a pet is sad
                ;
                (setq matchlist (find-parts (cdr tree)
                                  '((S-NO-SUBJ) (- \,) (- (ADVP)) (- \,) 
                                                       (VP) (- \, \; \.)) ))
                ; the S-NO-SUBJ will have received a VP predicate interpretation
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 3 (:i (:f Ka 1) 5)))))

                ; NP[THERE] + VP[be|aux|have] + X* (also allowing for extra stuff)
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; e.g., There is a tavern in the town; There certainly will be chaos;
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Parsers misanalyze these (at the time of writing), attaching
                ; any PP after the NP to the NP; this cannot be properly interpeted,
                ; but a rough approximation is used here (e.g., "Something is such
                ; that it is a tavern that is in the town")
                ;
                (when (or (and (eq (car (first (cdr tree))) 'NP) 
                               (eq (caadr (first (cdr tree))) 'EX) )
                          (and (eq (car (second (cdr tree))) 'NP) ; if initial ADVL
                               (eq (caadr (second (cdr tree))) 'EX) )
                          (and (eq (car (third (cdr tree))) 'NP) ; if ADVL, comma|PP
                               (eq (caadr (third (cdr tree))) 'EX) )
                          (and (eq (car (fourth (cdr tree))) 'NP) ; if ADVL, comma, PP
                               (eq (caadr (fourth (cdr tree))) 'EX) ))
                      (setq matchlist (find-parts (cdr tree)
                                       '((- ADVP) (- \,) (- (PP)) (NP); = NP[there] 
                                         (- ADVP) (VP) (* (DELIM)) )))
                      (if matchlist 
                          (return (combine-lfs rhs-lfs matchlist 
                                    '(:f 1 (:f (:f adv-e 3) 
                                               (:f 5 (:i (:q some thing.n) 6)) ))))))

                (return (default-lf 'S rhs-lfs)) ); structurally unfamiliar S
                ; ===========================================================

         (SINV  ; V[aux|be] + NP + ADVP- {VP|NP|ADJP|PP}; e.g., "Did you call[?]"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; "[What] did you (almost) say[?]" (NB: there may be a gap)
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Typically this will only occur in WH-questions, and will 
                ; not include punctuation at the end; preprocessing ensures
                ; that yes-no-questions (thus not part of a wh-question) are
                ; changed to type YNQ, so that they can get a YNQ operator.
                ;
                ; We needn't check for "aux" feature, since an S-initial verb
                ; must be AUX or BE. Note that even progressive "be", modal 
                ; "will", perfect "have", etc., have their LF applied to the 
                ; predicate complement, but this should give an S-level result, 
                ; via lambda-operations; The ADVP, if present, seems typically
                ; to be sentence-level;
                ;
                (setq matchlist 
                    (find-parts (cdr tree)
                      '(((V) (BE) (AUX)) (NP) (- ADVP) (VP NP ADJP (PP)) 
                        (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                                                '(:f 3 (:i 2 (:f 1 4))) )))
                ; ADVP V NP PP-; e.g., "Here comes the bride"
                (setq matchlist
                    (find-parts (cdr tree)
                      '((ADVP) (VP (V) (BE) (AUX)) (NP) (* (PP) ADVP) (* (DELIM)))))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                                                '(:f 1 (:i 3 (:p 2 (:r 4)))))))
                (return (default-lf 'SINV rhs-lfs)) ; unfamiliar SINV
                )
                ; ======================================================


      (S-NO-SUBJ ; subjectless S is used for relclauses in Treebank
                 ; NP[-none-]- + ADVP- VP; e.g., [who] "find ways to help"
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; e.g., (Charniak parser-- no NP at all) "[man who] arrived";
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; ** Assume the ADVP, if any, is a VP adverbial;
                 (setq matchlist 
                       (find-parts (cdr tree)
                          '((* ~ NP VP) (- NP) (- ADVP) 
                                              (* ~ NP VP ADVP) (VP VP-INF) 
                                              (* (DELIM)) )))
                 ; Ignore everything but ADVP and VP:
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist '(:f 3 5))) )

                 (return (default-lf 'S-NO-SUBJ rhs-lfs)) ); unfamiliar S-NO-SUBJ
                 ; ==============================================================


         (S-REL ; NP[rel] + VP + X* ; simple rel-clause; e.g., [man] who smoked
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; The relative clause may be restrictive or nonrestrictive,
                ; but in either cases it is interpreted as a predicate
                ; (just as restrictive and nonrestrictive NP-postmodifying
                ; PPs and ADJPs are) ; S-RELs will have relative variable 
                ; 'r' in their first constituent, which is lambda-abstracted
                ; (see the following) when the S-REL is interpreted.
                (setq matchlist
                      (find-parts (cdr tree) '((NP)  (VP) (* (DELIM)))) )
                (if matchlist
                    (return (combine-lfs
                                rhs-lfs matchlist '(:l r (:i 1 2)) )))
                    ; The LF of the NP[rel] will be r or some 
                    ; (:q ...)-form containing r; e.g., 
                    ; (:q the (:l x (:i (:i x person) & (:i x = r)))), 
                    ; for "who". The VP cannot have a gap in this type
                    ; of relative clause;

                ; XP[rel] + S/XP + X* ; rel-clause with a gap (correct PST);
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; e.g., that you saw; whose hair you cut; who you talked to;
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist 
                    (find-parts (cdr tree) '((WHNP WHPP WHADVP) (S) 
                                             (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                                               '(:l r (:f (:l -t- 2) 1)) )))
                            ; If XP is a pronominal NP, its translation should
                            ; be r (or, more accurately for "who", (:q the (:l x
                            ; (:i (:i x person) & (:i x = r))))), where r is
                            ; the relative variable. If it is a PP like "for which",
                            ; its translation should be (P' r). Thus in either
                            ; case, we're substituting for the -t- in VP' something
                            ; that is, or contains, r. The r is then abstracted.
                
                ; XP[rel] + NP +VP/XP + X* ; rel-clause with a gap (faulty PST); 
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; e.g., with whom you talked; that you saw; who you talked to
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; whose door you opened  
                ; ~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist 
                      (find-parts (cdr tree)
                           '((WHNP WHPP WHADVP) (NP) (VP) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                                           '(:l r (:f (:l -t- (:i 2 3)) 1)) )))

                (return (default-lf 'S-REL rhs-lfs)) ); unfamiliar S-REL
                ; ======================================================


        (S-THAT ; P[that] + S; e.g., "that the problems weren't as severe..."
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree) 
                                   '((IN) (S) (* (DELIM))) )) 
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 2))) )
                            ; Note: this yields a nominalized proposition; thus
                            ; for the exception "so that ..." we should contract
                            ; this into "so-that ...". Complementizer "that"
                            ; isn't actually a preposition, logically...

                (return (default-lf 'S-THAT rhs-lfs)) ); unfamiliar S-THAT
                ; ========================================================


     (S-NO-THAT ; P[-none-] + S; e.g., [said] "the problems weren't severe"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; In Brown the elided complementizer appears as (-none- 0);
                ; this is not to be confused with a gap.
                ; Like (explicit) that-clauses, we assume that S-NO-THAT
                ; clauses are semantically like NPs, so an ISA-link to NP
                ; is set up in the initializations.
                ;
                (setq matchlist (find-parts (cdr tree)
                                  '((-NONE-) (S S-NONE) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                                                  '(:f THT 3) )))

                (return (default-lf 'S-NO-THAT rhs-lfs)) ); unfamiliar S-NO-THAT
                ; ==============================================================


     (S-WHETHER ; P[whether] + S; e.g., "Whether Kim left"; 
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; We assume that the application of 'whether' (equivalent
                ; to (QNOM (YNQ ...))??) produces a nominal; for some
                ; exceptional adverbials like "whether it rains or snows, ...", 
                ; or "whether or not it snows", we assume we'll prefix 
                ; "regardless-of" in the ADVP semantics, after wrapping 
                ; (ADVP ...) around the whether-clause in preprocessing.
                ;
                (setq matchlist (find-parts (cdr tree) '(((P)) (S) 
                                                         (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 2))) )
               
                (return (default-lf 'S-WHETHER rhs-lfs)) ); unfamiliar S-WHETHER
                ; ==============================================================


         (S-FOR ; P[for] + S[inf]; e.g., "for Bill to complain"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; dubious analysis, but that's the way it comes out;
                ; assume 'for' has been interpreted as 'Ke'; i.e., this is
                ; also a nominal meaning, but S-FOR is presumed to have NP
                ; wrapped around it in preprocessing.
                ;
                (setq matchlist (find-parts (cdr tree) '(((P)) (S) 
                                                         (* (DELIM)) )))
                           
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 2))) )

                (return (default-lf 'S-FOR rhs-lfs)) ); unfamiliar S-FOR
                ; ======================================================


            (S-INF
                ; NP[-none-] + VP[to]; e.g., "to change" (in "[needed] to change")
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree) '((VP) 
                                                         (* (DELIM)) )))
                ;
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 2)) )
                ; this does *not* nominalize (because in "for Mary to be late"
                ; we don't want a reified action; also in "began to walk",
                ; "seemed to walk" "seemed almost to float on air", it's not 
                ; clear if reification is appropriate; so form NPs from S-INF
                ; in preprocessing where it seems appropriate, applying a Ka
                ; operator in those cases.

                (return (default-lf 'S-INF rhs-lfs)) ); unfamiliar S-INF
                ; ======================================================

                ; After much thought about the following clause types
                ; formed from "subordinating conjunctions" of two rather
                ; different types (atemporal and temporal), I decided to
                ; keep them together, because we can't sort out a priori
                ; whether we have temporal or atemporal "when", "as", or
                ; "while". We'll just decide in postprocessing which versions
                ; of these three words seems to be the right one, and change
                ; their atemporal versions to "when-it-is-true-that",
                ; "as-it-is-true-that", and "while-it-is-true-that", and
                ; for the temporal versions of these words and the unambiguous
                ; temporal ones, we'll fill in appropriate expansions in the
                ; postprocessing. E.g., for "until" this is tantamount to
                ; "until the time s.t. at that time", i.e., (w/o keywords)
                ; (L S (until <the (L t [[t time] & (adv-e (at-time t) S)])>))
                ; The most challenging part is that temporal "when" as
                ; a subordinating conjunction involves an unbounded
                ; dependency; e.g., "I arrived when I said I would arrive"
                ; (my arriving is not during my saying, on the preferred
                ; reading). Perhaps the only other word allowing this is
                ; "before" (?"I arrived before I said I would arrive").
                ; But this implies that S may or may not have a gap. So
                ; any such gap will have to be inserted (and filled) in LF
                ; postprocessing.
                ;
            ((S-ALTHOUGH S-IF S-EVEN-IF S-ONLY-IF S-IN-CASE S-WHEREAS S-SINCE 
              S-BECAUSE S-THOUGH S-EVEN-THOUGH S-WHETHER-OR-NOT S-UNLESS
              S-INASMUCH-AS S-AS-LONG-AS S-WHEN S-AS S-WHILE S-BEFORE S-AFTER
              S-UNTIL S-TILL S-AS-SOON-AS)
                ; P[{although, if, ...}] + S; e.g., "although he stumbled ..."
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; P[{when, while, ...}] + S; e.g., "while bricks tumbled ..."
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree)
                                  '(((P)) (S S-NONE) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 2 4))) )

                (return (default-lf 'S-ALTHOUGH-IF-WHILE-ETC rhs-lfs)) ); unfamiliar 
                                                       ; S-ALTHOUGH-IF-WHILE-ETC;
                ; ========================================================


            (S-WHNP; NP[wh] + S[null-subj]; e.g., "who left", "which got away";
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; "what matters", "whose car crashed";
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Must be a nominal, assuming that we've identified S-REL cases;
                ; S-WHNP is tagged with "ISA NP" in the initializations;
                ;
                (setq matchlist (find-parts (cdr tree)
                                  '((WHNP) (S-NO-SUBJ S-NONE) 
                                           (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 
                              '(:f answer-to (:i 2 3)))) )


                ; NP[wh] + S/NP ; wh-nominal; e.g., "...whom Kim saw",
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; "which he chose"; "what he did", "which (one) he saw"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; "whose car it is"; we assume there is an '-t-' in LF(S/NP).
                ; ~~~~~~~~~~~~~~~~~~
                ; Must be a nominal, assuming that we've identified S-REL cases;
                ;
                (setq matchlist (find-parts (cdr tree) '((WHNP) (S) 
                                                         (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 
                                 '(:f answer-to (:f (:l -t- 3) 2)) )))


                (return (default-lf 'S-WHNP rhs-lfs)) ); unfamiliar S-WHNP
                ; ========================================================


            (S-WHPP; PP[wh] S[/PP,~inv]; For whom the bell tolls [is unknown];
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Where/when he works [is unknown]; (nominal occurrences);
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; The only Charniak parses currently postprocessed into this
                ; form are nominal occurrences of type (SBAR (WHADVP (WRB ...
                ; ) ) (S ...)), where the S-BAR is then replaced by S-WHPP
                ; and the WRB by WRB-PP, the latter providing meanings like
                ; "at what place" or "to what place", or "at what time".
                ; (SBAR (WHPP ...)) parses currently do not lead to such 
                ; constituents; rather, for relative clauses they become S-REL
                ; and the wh-word in the WHPP is replaced by a POS ending
                ; in "-REL". The only other occurrences of WHPP produced
                ; by the parser are as initial constituents of a clause
                ; correctly or incorrectly parsed as an SBARQ (WH question).
                ; The 1st sentence above, for example, is incorrectly parsed
                ; as a question, and "tolls" is parsed as a noun. "For whom he
                ; works no-one knows" is misanalyzed as containing a yes-no 
                ; question (inverted sentence) "he works no-one knows", with 
                ; "no-one knows" as object of "knows". The following rule 
                ; properly applies only to correct nominal analyses.
                ;
                (setq matchlist (find-parts (cdr tree); not INV
                                  '((WHPP WHADVP) (S) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 
                                          '(:f answer-to (:f (:l -t- 3) 2)) )))

                (return (default-lf 'S-WHPP rhs-lfs)) ); unfamiliar S-WHPP
                ; ========================================================

            
            (S-WHADVP
                ; ADVP[wh] + S/XP ; e.g., "where he goes, [she goes]";
                ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; "[He sings] how he talks", "when he left [I arrived]";
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Must be an adverbial, assuming that preprocessing has
                ; already identified S-REL occurrences and nominal 
                ; occurrences; so these are irrelevant here. The WRB
                ; within the WHADVP constituent will have been replaced
                ; by PS in preprocessing, so that it will be assigned
                ; a meaning like "at the time (or place) at which" analog-
                ; ous to "until/while/after/etc. modifying an S. (S-REL
                ; occurrences will be of form (S-REL (WHADVP ...) (S ...)),
                ; with the WRB inside the WHADVP replaced by WRB-REL
                ; (allowing its interpretation to be construed as involving
                ;  relative variable -r-). NP occurrences will have been
                ; changed from (SBAR (WHADVP ...) (S ...)) into (S-WHPP
                ; (WHADVP ...) (S ...)), with the WRB inside the WHADVP
                ; replaced by WRB-PP (allowing its interpretation to be
                ; construed as PP-like, e.g., "at what place" or "at what
                ; time") and are thus interpreted as nominals as above
                ; (see case S-WHPP).) The interpretation of "where" as a
                ; WRB within the S-WHADVP adverbial is something like "at 
                ; the place at which" or "to the place at which"; and that
                ; of "when" as "at the time at which". These actually again
                ; form a PP, which we usually expect to be type-raised to
                ; an adverbial in postprocessing using the adv-e type-
                ; shifting operator.
                ;
                (setq matchlist (find-parts (cdr tree) ; not INV
                                  '((WHADVP) (S) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f (:l -t- 3) 2))))


                (return (default-lf 'S-WHADVP rhs-lfs)) ); unfamiliar S-WHADVP
                ; ============================================================


            (S-ING; gerund
                (return (default-lf 'S-ING rhs-lfs)) ); nothing yet
                ; =================================================


            (S-THAN
                (return (default-lf 'S-THAN rhs-lfs)) ); nothing yet
                ; ==================================================


            (S-AS-AS
                (return (default-lf 'S-AS-AS rhs-lfs)) ); nothing yet
                ; ===================================================


            (S-NONE
                ; -none-;
                ; ~~~~~~
                ; This is a kind of gap or place-holder in Treebank trees
                (return '(:f THT SOMETHING-PREVIOUS-IS-THE-CASE)) )


            ((YNQ SQ Q)
                ; V[aux] + NP + {ADJP|NP|PP|VP}; e.g., Is he {happy|in love|going}?
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
                ; e.g., Can you leave? Do you like her?
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Preprocessing should give 'YNQ', but 'SQ' or 'Q' perhaps
                ; still show up;
                ;
                (setq matchlist
                    (find-parts (cdr tree)
                           '(((V) (BE) (AUX)) (NP) (- ADVP) (VP NP ADJP (PP)) 
                             (* (DELIM)) )))
                               ; allow for punctuation and (unexpected) 
                               ; extra following material
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                                             '(:f YNQ (:f 3 (:i 2 (:f 1 4)))) )))

                ; S[inv]; perhaps still shows up this way; e.g., Can you leave? 
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree) '((SINV) 
                                                         (* (DELIM)) )))
                               ; allow for punctuation and (unexpected) 
                               ; extra following material
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f YNQ 1))) )

                (return (default-lf 'S-YNQ rhs-lfs)) ); unfamiliar type of YNQ
                ; ============================================================


            
           (WHQ ; XP[wh] + S[inv]/XP; e.g., When can you come? What will you do?
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree) 
                                 '((WHNP WHPP WHADVP WHADJP) (SINV) 
                                   (* (DELIM)))))
                                 ; allow for punctuation and (unexpected) 
                                 ; extra following material
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                                                       '(:f (:l -t- 2) 1) )))
                                 ; The WH-determiner in a wh-question is
                                 ; assumed to have the semantic effect of
                                 ; forming a question. So in contrast with
                                 ; YN-questions (where we need to transform
                                 ; a declarative into a question), we don't 
                                 ; need a question-forming operator.

                (return (default-lf 'WHQ rhs-lfs)) ); unfamiliar WH-question form;
                ; ================================================================


                ; *** WE ALSO NEED VARIANTS OF THE ABOVE QUESTIONS WITH
                ;     A SENTENCE AT THE BEGINNING, E.G., "I WONDER, WILL
                ;     HE SUCCEED?"
                
             (NP ; X* PDT- + DET{P} + ADJP* + N[name]* + N* + N
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; e.g., a big dog; the eight men; John's defunct startup;
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; half the bread stick; all the costumed Star Trek fans;
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; This is aimed at common-noun NPs WITH A DETERMINER, thus
                 ; generally not kind-denoting. We disallow postmodifiers in
                 ; this first rule, just so that we'll be matching a simpler
                 ; pattern, and applying a simpler LF rule (with not too many
                 ; mull constituents that need to be collapsed), where possible.
                 ; (The point is that postmodifiers directly following the head
                 ; noun as NP constituents are rare in the Treebank parses: We
                 ; expect them to be added via a rule NP --> NP PP|S-REL|...)

                 ; This covers both predicate nominals and non-predicate ones;
                 ; we assume that certain verb/adj/noun-complement positions
                 ; are recognized as predicate positions in postprocessing (or
                 ; scoping). We apply (L y (L x [x = y])) to the (unscoped)
                 ; term, shifting it to a predicate. For instance, we may get 
                 ; (L x [x = Agnes]), or (L x [x = <a{n} man>]]), or (L x [x = 
                 ; <the suspect>]); in the second example this creates a 
                 ; (preferred) scoping option (L x (a{n} y [y man] [x = y])), 
                 ; which is logically equivalent to just 'man'. Note -- various
                 ; type-shifting operations will be needed in postprocessing
                 ; (e.g., in shifting PPs to adverbials and in "fleshing out"
                 ; generics). Some examples of predicate positions are: the
                 ; complement of copular "be", "become" and "make" (as in
                 ; "made him happy/an editor"), "resemble", "seek", etc.; also
                 ; the complement of "picture-of", "conception-of", etc.; also
                 ; complement of "reminiscent-of", "similar-to", "like/unlike",
                 ; etc.
                 ;
                 ; We apply ADJPs in attributive position as if they were  
                 ; predicate modifiers -- we don't want to apply 'attr' to them, 
                 ; as this would risk applying this type-shifting operator even
                 ; to adjectives that are intrinsically modifiers, such as the
                 ; strictly attributive adjectives 'former' and 'consummate';
                 ; type-shifting of nonattributive adjectives in attributive
                 ; position is left to postprocessing.
                 ;
                 ; Note that a numeral like "five" or "5" can occur both
                 ; as CD in determiner position, or as JJ in post-determiner
                 ; position (after preprocessing, which changes CD occurring
                 ; after a determiner, or in a complex QP (quantifying phrase)
                 ; to JJ).
                 ;
                 (setq matchlist
                    (find-parts (cdr tree)
                       '((- PDT) ((DET)) (* (A) ADJP VP) (- \,) 
                         (* (A) ADJP VP) (* NNP NNPS) (* NN NNS VB) 
                         (NN NNS) (- \, \.) )))                ;^^
                         ; Note: we need ((DET)) rather than (DET), 
                         ; because DET is an abstraction from DT, DETP,
                         ; QP, or PRP\$.
                         ;
                         ; The premodifying VPs allow for things like
                         ; "the injured veteran" ("injured" is VP in
                         ; Brown); as for predicate adjectives, 'attr'
                         ; will need to be applied in postprocessing;
                         ; the underscored VB allows for such things as
                         ; "think factories", "fall guy", "hush money"
                         ;
                         ; The NNPs and NNs aren't really expected to pile
                         ; up, as they are merged into multiword items in 
                         ; preprocessing; but we allow for it just in case;
                 (if matchlist
                    (return (combine-lfs1 rhs-lfs matchlist
                               '(:f 2 
                                  (:f 3   ; treat ADJP or VP--deverbal
                                    (:f 5 ; adj.-- as pred. modifier
                                      (:f (:f nnp 6)
                                        (:f (:f nn 7) 8) )))))))
                
                 ; DET{P} + ADJP* +  N + N[name]+ + N* + N
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; e.g., Josh's season MVP award; the two crystal Art Nouveau
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; candle holders;
                 ;~~~~~~~~~~~~~~~~
                 ; Similar considerations as in the previous rule apply here;
                 ;
                 (setq matchlist
                    (find-parts (cdr tree)
                       '(((DET)) (* (A) ADJP VP) (- \,) 
                         (* (A) ADJP VP) (* NN NNS) (* NNP NNPS) (* NN NNS) 
                         (NN NNS) (- \, \.) )))
                         ; Note: we need ((DET)) rather than (DET), 
                         ; because DET is an abstraction from DT, DETP,
                         ; QP, or PRP\$.
                         ;
                         ; The NNPs and NNs aren't really expected to pile
                         ; up, as they are merged into multiword items in 
                         ; preprocessing; but we allow for it just in case;
                 (if matchlist
                    (return (combine-lfs1 rhs-lfs matchlist
                               '(:f 1 (:f 2 ; treat ADJP or VP--deverbal
                                          (:f 4 ; adj.-- as pred. modifier
                                            (:f (:f nn 5)
                                                (:f (:f nnp 6)
                                                  (:f (:f nn 7) 8) ))))))))
                
                 ; X* + DET{P} + ADJP* + N* + N + comma- + N[name]* N[name]
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; apposition; e.g., her good friend Jill Brown;
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; Jill's estranged husband Jack;
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; This could be followed by a postmodifier, but in that case
                 ; the proper form should be NP --> NP , postmodifier, as in
                 ; "Jill's estranged husband Jack, who fell prey to alcoholism".
                 ;
                 ; Actually, the correct form would have NP instead of N[name]
                 ; at the end, but it doesn't get parsed that way (one could
                 ; apply repair rules, but it's unclear what the right balance
                 ; between "tolerant interpretation" and syntactic repair is)>
                 ;
                 ; As in the previous rule, this covers both predicate nominals 
                 ; and non-predicate ones, where in the predicative case an
                 ; equative abstraction (being an x identical with ...) would
                 ; be wrapped around the entire NP by earlier processing. But 
                 ; note that the semantic rule already performs equative 
                 ; abstraction to link the two juxtaposed properties: being 
                 ; indentical with DET{P}... N, and being identical with N[name];
                 ; we quantify this complex property definitely with THE.
                 ;
                 ; Again we apply ADJPs in attributive position as if they were  
                 ; predicate modifiers, lest we apply 'attr' to intrinsically
                 ; attributive adjectives.
                 ;
                 ; Note that the determiner should generally be definite,
                 ; though something like "some guy Joe called" is not impossible.
                 ; (often there would be a comma, as in "Some guy, Joe Smith,
                 ; left a message"; but this form of "NP, NP" apposition is
                 ; handled further below).
                 ;
                 (setq matchlist
                    (find-parts (cdr tree)
                       '(((DET)) (* (A) ADJP VP) (- \,) 
                         (* (A) ADJP VP) (* NN NNS) (NN NNS) (- \,) (* NNP NNPS)
                         (NNP NNPS) (- \, \.) ))) 
                         ; Note: we need ((DET)) rather than (DET), 
                         ; because DET is an abstraction from DT, DETP,
                         ; QP, or PRP\$.
                         ;
                         ; The NNPs and NNs aren't really expected to pile
                         ; up, as they are merged into multiword items in 
                         ; preprocessing; but we allow for it just in case;
                 (if matchlist
                    (return (combine-lfs1 rhs-lfs matchlist 
                               '(:f 1
                                  (:l x
                                    (:i (:i x = 
                                          (:f 2 (:f 4 (:f (:f nn 5) 6))))
                                        and (:i x = (:f (:f nnp 8) 9)) ))))))

                 ; DET + ADJP* + N[sing] S[that]; e.g., the fact that he cheated
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 (setq matchlist (find-parts (cdr tree)
                                 '((DT) (* (A) ADJP VP) (NN) (S-THAT))))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist
                               '(:f 1 (:l x (:i (:i x (:f 2 3)) 
                                                and (:i x = 4)))))))

                 ; X* + PDT- + DET + ADJP* + N[name]* + N[sing]* + N [NB: DET]
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; + {PP|S-REL|VP|ADJP} X* ; (Brown has some such postmods)
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; e.g., the soothsayers of the think factories;
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 (setq matchlist (find-parts (cdr tree)
                                 '((- PDT) ((DET)) (* (A) ADJP VP) (- \,)
                                   (* (A) ADJP VP) (* NNP NNPS) (* NN VB) 
                                   (NN NNS) (- \,) ((PP) S-REL S-THAT VP ADJP)
                                   (- \,) (- (PP) S-REL S-THAT VP ADJP) (- \,)
                                   (* (PP) S-REL S-THAT VP ADJP) (- \,)
                                   (* ~ (PP) S-REL S-THAT VP ADJP) ))); ignored
                                   ; this allows for 3 comma-separated postmods
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist
                               '(:a (:f 2 (:f 3
                                           (:f 5
                                            (:f (:f nnp 6)
                                             (:f (:f nn 7) 8) ))))
                                    (:l x (:i (:i x 10) and 
                                              (:i x 12) (:i x 14) ))))))

                     ; Note: ** Constituents 12 and 14 in the last line could
                     ; be iterated modifiers (though this is quite unlikely);
                     ; another way to handle this would be to use two (:a ...)
                     ; augmentation operators, instead of one (which also
                     ; might be iterated. The above should be tested, to see
                     ; if iteration of conjuncts works properly, forming a
                     ; longer conjunction. But as noted in the previous rule,
                     ; nominal postmodifiers in Treebank parses will typically
                     ; be added as NP-, not N-, postmodifiers.

                 ; DET + ADJ- {ADJ|N} + CC + ADJ + ADJ* + N* + N [flat parse!]
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; e.g., "no useful video or photographic archival record"
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 (setq matchlist (find-parts (cdr tree)
                                 '(((DET)) (- (A)) ((A) NN NNS) (CC)
                                   ((A)) (* (A)) (* NN NNS) (NN NNS))))
                 (if matchlist
                     (return 
                      (combine-lfs rhs-lfs matchlist
                       '(:f 1 (:f 2 (:f (:f attr (:l x (:i (:i x 3) 4 (:i x 5))))
                                        (:f 6 (:f (:f nn 7) 8)) ))))))

                 ; PDT- + DET- + ADJP* + ADJP + PP[of]- ; e.g., one, two,
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; most, much, (a) few, the rich, the first six, all six ...
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; often followed by "of" (thus forming a partitive); in Brown,
                 ; the PP[of] may be a sister of the CD determiner (but we 
                 ; preprocess CDs, changing them to JJ if following anything
                 ; but a PDT).
                 ;
                 (setq matchlist 
                       (find-parts (cdr tree) 
                           '((- PDT) (- (DET)) (* (A) ADJP)
                                     ((A) ADJP) (- PP-OF) (- \. \,) )))
                 (if matchlist
                   (return 
                     (combine-lfs rhs-lfs matchlist
                      '(:f 1 (:f 2 (:f 3 (:f 4 (:l x (:i (:i x pred?.n)
                                                        and (:i x 5) )))))))))


                 ; PDT- + DET[deictic]; "that", "these", "all those", "John's"
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 (setq matchlist (find-parts (cdr tree)
                                   '((- PDT RB) ((DET)) (- \. \,)) ))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist
                                         '(:f 1 (:f 2 pred?.n)) )))


                 ; ADJP* + N[name]* + N* + N; Bare sing/plur NP (interpreted
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; as kind); e.g., offshore oil; academic U.S. women;
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; (As for NPs with determiners, we consider non-postmodified
                 ; NPs first only to avoid some nil-matches and the ensuing
                 ; simplifications in LFs)
                 (setq matchlist 
                    (find-parts (cdr tree)
                      '((* (A) ADJP VP) (- \,) (* (A) ADJP VP) 
                        (* NNP NNPS) (* NN NNS VB) (NN NNS) (- \, \.) )))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist
                               '(:f K (:f 1
                                  (:f 3 (:f (:f nnp 4) (:f (:f nn 5) 6))) )))))

                 ; ADJP* + N[name]* + N* + N + X[~N] + Y*; Bare sing/plur NP
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; plus postmodifiers; e.g., offshore oil in the Gulf of Mexico
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; Again the postmodifiers will rarely be present, since they're
                 ; normally added to the NP, not the N, in Treebank parses.
                 (setq matchlist 
                       (find-parts (cdr tree)
                        '((* (A) ADJP VP) (- \,)
                          (* (A) ADJP VP) (* NNP NNPS) (* NN NNS VB) 
                          (NN NNS) (- \,) ((PP) S-REL S-THAT VP ADJP)
                          (- \,) (- (PP) S-REL S-THAT VP ADJP) (- \,)
                          (* (PP) S-REL S-THAT VP ADJP) (- \,)
                          (* ~ (PP) S-REL S-THAT VP ADJP) ))); ignored
                          ; this allows for 3 comma-separated postmods
                 (if matchlist
                    (return 
                        (combine-lfs rhs-lfs matchlist
                         '(:f K (:a (:f 1 (:f 3
                                             (:f (:f nnp 4)
                                              (:f (:f nn 5) 6) )))
                                    (:l x (:i (:i x 8) and 
                                              (:i x 10) (:i x 12) )))))))


                 ; {PRO|NAME}; e.g., John; you; The Bank of America; 
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; i.e., simple pronoun or name, at most with punctuation;
                 (setq matchlist (find-parts (cdr tree) 
                                    '((NNP NNPS (PRO)) (- (PUNC))) ))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist 1)) )


                 ; DET[def] + NAME; Simple or complex name; (see later rule for indef)
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; e.g., The Hague; The Golden State Bank Building; Hogan's Bar
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; Note that sequences of NNP(S) are combined into multiword
                 ; NNP(S) in preprocessing. Note: we need ((DET)) rather than
                 ; (DET), because DET is an abstraction from DT, DETP, QP, or
                 ; PRP\$. 
                 ;
                 (setq matchlist (find-parts (cdr tree) 
                                     '(((DET)) (NNP NNPS) (- (PUNC)))))
                 (if (and matchlist
                          (definite-det? (second (second tree))))
                     (return (combine-lfs rhs-lfs matchlist
                                '(:f referent-of (:f join-names (:f EF-of 1) 
                                                           (:f EF-of 2) )))))
                             ; "EF-of" means "English form of". In general,
                             ; expressions abtained from the above semantic
                             ; rule can be simplified afterwards, e.g.,
                             ; (:f referent-of 
                             ;   (:f join-names 
                             ;     (:f EF-of (:l P (:q the.det P)))
                             ;     (:f EF-of Bank_of_Commerce.name)))
                             ; becomes The_Bank_of_Commerce.name

                 ; DET- + NAME + P[of] NAME; e.g., The Bank of America;
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; Presumably not a frequent pattern, as "of + Name"
                 ; normally becomes "of + NP" and hence PP; note that
                 ; will not match something like "the Grandmother of Sue",
                 ; provided that "of Sue" would be parsed as a PP -- whereas
                 ; the above assumes that annotators of the Treebank corpora
                 ; tended to produce "flat" structures for complex names that
                 ; they recognized; (** but this should be checked);
                 (when (member '(IN of) (cdr tree) :test #'equal)
                       (setq matchlist (find-parts (cdr tree) 
                                        '((- (DET)) (NNP NNPS) (IN)
                                          (NNP NNPS) (- (PUNC)))))
                       (if matchlist
                           (return (combine-lfs rhs-lfs matchlist
                                    '(:f referent-of 
                                       (:f join-names 
                                         (:f EF-of 1) (:f EF-of 2) 
                                         (:f EF-of 3) (:f EF-of 4) ))))))


                 ; DET + NAME + {NAME|FW|\.|DET|SYM}+; Det + {names,minor words}
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; Again a presumed flat name structure, as per TB annotators (?)
                 ; We can risk incorporating "minor words" (but not P, CONJ or
                 ; Comma) into the name; we can't risk P, CONJ or Comma
                 ; incorporation, despite examples like "Smith, Jones & Sons,
                 ; Inc." and "Stratford on Avon", because there are also
                 ; examples like "Grandma, John, & Mary, in NY"; note that
                 ; an exception was made above for preposition "of".
                 ; 
                 (setq matchlist (find-parts (cdr tree)
                                   '(((DET)) ((NAME)) 
                                             (+ (NAME) FW \. (DET) SYM)) ))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist
                                  '(:f referent-of (:f join-names 1 2 3)) )))

                 ; NAME + {NAME|FW|\.|DET|SYM}+; Names + {name(s),minor words}
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; Again a presumed flat name structure, as per TB annotators (?)
                 ; We can risk incorporating "minor words" (but not P, CONJ or
                 ; Comma) into the name; we can't risk P, CONJ or Comma
                 ; incorporation, despite examples like "Smith, Jones & Sons,
                 ; Inc." and "Stratford on Avon", because there are also
                 ; examples like "Grandma, John, & Mary, in NY"; note that
                 ; an exception was made above for preposition "of".
                 ; 
                 (setq matchlist (find-parts (cdr tree) '(((NAME)) 
                                             (+ (NAME) FW \. (DET) SYM)) ))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist
                                  '(:f referent-of (:f join-names 1 2)) )))

                 ; N + NAME; e.g., "chief Dan George"; "officer Lee"; "room 621"
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 (setq matchlist (find-parts (cdr tree)
                                   '((NN NNS) (NNP NNPS) (- (PUNC)) )))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist
                               '(:q the (:l x (:i (:i x 1) and (:i x = 2)))) )))

                 ; DET + N + ADJP* + N + NAME; e.g., "my good friend John"
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 (setq matchlist (find-parts (cdr tree)
                                   '(((DET)) (* (A) ADJP) (NN NNS) (- \,) 
                                                   (NNP NNPS) (- (PUNC)) )))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist
                               '(:f 1 (:l x (:i (:i x (:f 2 3) and 
                                                          (:i x = 5)))) ))))

                 ; DET + ADJP* + NAME; e.g., "the incomparable Pepe Romero";
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; "a nice, cold Coca Cola"; "every Democrat"; i.e., a name 
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; used as a predicate; NB: both DET[def] & DET[indef] allowed.
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; (Note: a bare name will be caught by an earlier rule.)
                 ; The problem is that brand names have a predicate meaning
                 ; to begin with, whereas personal names don't.
                 (setq matchlist (find-parts (cdr tree); allow for 3 commas
                                   '(((DET)) (* (A) ADJP) (- \,)
                                     (* (A) ADJP) (- \,) (* (A) ADJP) (- \,)
                                     (NNP NNPS) (- (PUNC)) )))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist
                               '(:f 1 
                                 (:f 2 
                                   (:f 4 (:f 6 (:f construe-as-pred 8))) )))))

                 ; ADJP+ + NAME; e.g., "big Bill", "big bad Bill"
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; (Note: a bare name will be caught by an earlier rule.)
                 (setq matchlist (find-parts (cdr tree)
                                   '((+ (A) ADJP) (NNP NNPS) (- (PUNC)))))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist
                               '(:q the
                                 (:l x (:i (:i x = 2) and (:i x 1)))))))

                 ; ADJP + ADJP+ + NAME; e.g., "big, bad Bill"
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; (Note: a bare name will be caught by an earlier rule.)
                 (setq matchlist (find-parts (cdr tree); allow for a comma
                                   '(((A) ADJP) (- \,)
                                     (+ (A) ADJP) (NNP NNPS) (- (PUNC)) )))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist
                               '(:q the
                                 (:l x (:i (:i x = 4) and (:i x 1) (:i x 3)))))))

                 ; ADJP + ADJP + ADJP+ + NAME; e.g., "big, bad, brazen Bill"
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; (Note: a bare name will be caught by an earlier rule.)
                 (setq matchlist (find-parts (cdr tree); allow for 3 commas
                                   '(((A) ADJP) (- \,)
                                     ((A) ADJP) (- \,) (+ (A) ADJP)
                                     (NNP NNPS) (- (PUNC)) )))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist
                               '(:q the
                                 (:l x (:i (:i x = 6) and
                                           (:i x 1) (:i x 3) (:i x 5)))))))
                 

                 ; {NP|NAME|PRO} + Comma- + {PP|S-REL|VP|ADJP}*; postmodifiers
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~; 
                 ; e.g., miners trapped underground; Sue, with her sister Ann;
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; everyone in the room who cares about it; you, over there;
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; We alone [can do it]; He who laughs last [laughs best];
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; Note: If NAME or PRO occur without postmodifiers, they will
                 ;    already have been picked up by the relevant earlier rule.
                 ; Charniak may attach postmodifiers directly to a NAME, if 
                 ; the NAME is not premodified; o/w, it produces NP --> [NP 
                 ; Comma- {PP|etc}. A PRO is usually postmodified in this
                 ; latter way, but is included above just to be sure.
                 ;
                 ; Note: This rule lumps together NPs with restrictive and 
                 ;    nonrestrictive postmodifiers (e.g., tea spiked with rum,
                 ; vs. Sue at the party, talking with Al). We can't avoid this,
                 ; because the pattern matcher can't look inside the NP to
                 ; see if it's a name or not (unless we preprocess to create
                 ; NP-NAMEs), and besides, even in the absence of a comma a
                 ; postmodifier may be nonrestrictive, especially in caption
                 ; language (e.g., my boss enjoying a beer; Al's boss who is
                 ; a control freak). So we treat all postmodifiers uniformly
                 ; as augmentations, where in the case of names, pronouns
                 ; or functional terms (e.g., Al at the zoo; Al and Bo in LA) 
                 ; further processing should change occurrences of 
                 ;     (:a <name> <pred>) to
                 ;     (:q some (:l x (:i (:i x = <name>) and (:i x <pred>))),
                 ; and occurrences of 
                 ;     (:a (:q <quan> <restr>) <pred>) to
                 ;     (:q <quan> (:l x (:i (:i x <restr>) and (:i <pred>)))).
                 ;
                 ; We could iterate :a in the semrule for multiple modifiers,
                 ; but it's more direct to collect them into a conjunction.
            ;    (trace find-parts instantiate-semrule adjust-semrule ; DEBUG
            ;     derive-lf derive-phrase-lf combine-lfs);  DEBUG
                 (setq matchlist 
                       ; DEBUG: find-parts1, combine-lfs1 for selective tracing
                       (find-parts1 (cdr tree); allow for 3 commas
                            '((NP (NAME) (PRO)) (- \,) (* (PP) S-REL VP ADJP) 
                              (- \,) (* (PP) S-REL VP ADJP) (- \,)
                              (* (PP) S-REL VP ADJP) (- (PUNC)) )))
            ;    (trace instantiate-semrule adjust-semrule); DEBUG
                 (if matchlist
                     (return (combine-lfs1 rhs-lfs matchlist
                                    '(:a 1 (:o and 3 5 7)) )))
            ;    (untrace instantiate-semrule adjust-semrule); DEBUG

                 ; NP --> NP + Comma- + NP; Ani, the happy bride; (apposition)
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; 
                 (setq matchlist (find-parts (cdr tree)
                                   '((NP) (- \,) (NP) (- (PUNC))) ))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist
                                         '(:a 1 (:l x (:i x = 3))) )))

 
                 ; NP --> NP + Comma- + NP + postmodifiers* ; 
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; "Suzie, the radiant bride, with her dad"
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; (apposition plus postmodification)
                 ; 
                 (setq matchlist 
                    (find-parts (cdr tree); allow for 3 extra commas
                       '((NP) (- \,) (NP) (- \,) (* (PP) VP ADJP S-REL) 
                         (- \,) (* (PP) VP ADJP S-REL) (- \,) 
                         (* (PP) VP ADJP S-REL) (* (PUNC)) )))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist
                              '(:a 1 (:o and (:l x (:i x = 3)) 5 7 9)) ))) 


                 ; {-NONE-|NIL};  null or gapped NP; e.g., (NP (-NONE- *-1))
                 ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 ; e.g., (NP NIL); thus rootcat = (car NIL) = NIL as well;
                 ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 (setq matchlist (find-parts (cdr tree) '((-NONE- NIL))))
                 (if matchlist
                     (return (combine-lfs rhs-lfs matchlist 1)) )
                     ; the interpretation will be '-t-', the "trace-variable";

   ;;*** I NEED TO GO BACK AND CHANGE 'NP' TO '(NP)' WHEREVER I WANT TO
   ;;    ALLOW S-THAT S-NO-THAT S-WHNP S-WHPP S-WHETHER S-FOR (AND
   ;;    NEGATING THOSE I *DON'T* WANT TO ALLOW). BUT WAIT -- THERE ARE
   ;;    PLACES WHERE I SAY (NP), EXPECTING THAT THIS *WON'T* MATCH
   ;;    NP-TIME!

                 (return (default-lf 'NP rhs-lfs)) ); unfamiliar NP form;
                 ; ======================================================


            (DETP
                ; NP + POS; e.g., "Nischwitz'", "the president's"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree) '((NP) (POS))))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:l P (:q THE.DET
                                        (:l x (:i (:i x P) and
                                                  (:i x pertain-to 1) )))))))

                 (return (default-lf 'DETP rhs-lfs)) ); unfamiliar genitive form;
                 ; =============================================================
                 ; N.B.: a possible default here might be '(:l p (:q THE.DET p)))
                 ; so that the definiteness is retained; but we'd rather not 
                 ; lose the NP semantics info, such as it might be ...


            (NP-TIME
                ; N[name,time]; e.g., "Friday"; "yesterday"; "[visited] Tuesdays"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; We treat time terms as (in general ambiguous, i.e., indexical),
                ; names of time periods. So "Friday" and "yesterday" are indexial
                ; names. When used as predicates, as in "every Monday", we need
                ; to apply the 'construe-as-pred' operator.
                (setq matchlist
                      (find-parts (cdr tree) '((NNP NNPS) (* (PUNC)))) )
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 1) ))
                    ; Used directly as an adverbial ("He arrived yesterday"),
                    ; this would give e.g., (:f YESTERDAY.NAME) applied to the
                    ; VP-predicate, which is not satisfactory. So for conformity
                    ; with the treatment of PP adjuncts, such time nominals
                    ; should be treated in the VP semantics as containing an
                    ; implicit "during", e.g., (:p during YESTERDAY.NAME). 
                    ; (YESTERDAY.NAME might itself be expanded into (:q the
                    ; (:l x (:i (:i x day) and (:i precedes x (:f today Now))))).)

                ; Name[count]; e.g., "2009"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist
                      (find-parts (cdr tree) '((NNP) (* (PUNC))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 1)))
            
                ; N[time]; e.g., "time", "spring"; unlikely to function as ADVP
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist
                      (find-parts (cdr tree) '((NN) (* (PUNC))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f K 1) )))


                ; N[name,time] + N[time]*; e.g., "Friday afternoon";
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Note: w/o an N[time], the previous rule will preempt this one;
                (setq matchlist
                      (find-parts (cdr tree) '((NNP) (* NN NNS) (* (PUNC)))) )
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 
                                                '(:q the (:f (:f nnp 1) 2)) )))
                    ; Again this should be augmented with "during" when
                    ; functioning as a VP adjunct.


                ; N[name,time] + A*[num] (allowing for commas); e.g., May 13, 1999
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; e.g., Spring (,) 2010; 
                ; ~~~~~~~~~~~~~~~~~~~~~
                ; Note: w/o an A[num], a previous rule will preempt this one;
                ;
                ; Though such numerals are tagged as JJ in postprocessing,
                ; they are treated as parts of a name (of a time period) here,
                ; in order to postpone commitments about exact meaning ...
                ; Postprocessing, or a more detailed grammar with more
                ; specialized rules, ultimately needs to refine this.
                (setq matchlist
                      (find-parts (cdr tree) 
                        '((NNP) (- \,) (- (A)) (- \,) (- (A)) (* (PUNC))) ))
                (if matchlist
                    (return ; [** a rather tentative "interpretation"] 
                        (combine-lfs rhs-lfs matchlist 
                           '(:f referent-of (:f join-names (:f EF-of 1)
                                                (:f EF-of 3) (:f EF-of 5) )))))
                    ; Again this should be augmented with "during" when
                    ; functioning as a VP adjunct.


                ; NP[name,time] + Comma- + NP[time]; e.g., "Friday, May 13, 1999";
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Note: Charniak phrase structure would be [Friday] , [May 13, 1999]
                ;
                ; Again we simply form a name out of the two logical pieces. These
                ; pieces will themselves be (ambiguous) designators such as
                ; (omitting keywords) '(referent-of "Friday")', via previous rules,
                ; which might be reduced to 'FRIDAY' in postprocessing. Similarly
                ; '(referent-of "May 13, 1999") might be reduced to 'MAY_13_1999'.
                ; So (referent-of (join-names (EF-of FRIDAY) (EF-of MAY_13_1999)))
                ; would be = (join-names "Friday" "May 13, 1999"), or "Friday, 
                ; May 13, 1999", and the 'referent-of' this might be reduced to
                ; 'FRIDAY_MAY_13_1999', as a logical constant corresponding to
                ; the English name. 
                (setq matchlist
                   (find-parts (cdr tree) '((NP-TIME) (- \,) (NP-TIME) (* (PUNC)))) )
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 
                              '(:f referent-of (:f join-names
                                                 (:f EF-of 1) (:f EF-of 3) )))))
                    ; Again this should be augmented with "during" when 
                    ; functioning as a VP adjunct.


                ; Det + N; e.g., "one day", "one fine summer day", "that week",
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; "that very week", "that ill-fated day", "every month"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist
                      (find-parts (cdr tree) 
                           '((DT CD) (* (A) ADJP VP) 
                                     (* NN NNS) (NN NNS) (- (PUNC)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 
                                   '(:f 1 (:f 2 (:f (:f nn 3) 4))) )))
                    ; Actually, any premodifying nouns will have been fused
                    ; into the head noun by preprocessing, but we keep this
                    ; form in case preprocessing policies change.


                (return (default-lf 'NP-TIME rhs-lfs)) ); unfamiliar NP-TIME form;
                ; ===============================================================


            (WHNP
                ; DET[wh] + ADJP* + N* + N; e.g., "what alternatives", "whose ad"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; "whose rusty stick-shift Ford pickup"; no postmodifiers
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist 
                    (find-parts (cdr tree)
                        '((- PDT) (WDT) (* ADJP (A)) (* NN NNS) 
                                        (* NNP NNPS) (NN NNS) (* (PUNC)) )))
                (if matchlist
                   (return 
                      (combine-lfs rhs-lfs matchlist
                        '(:f 1 (:q 2 (:f 3 (:f (:f nn 4) (:f (:f nnp 5) 6))))) )))


                ; DET[wh] + ADJP* + N* + N + XP+; now allow for postmodifiers
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; This is quite improbable -- it would normally be of form NP XP
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist; allow for 3 separating commas
                    (find-parts (cdr tree)
                        '((- PDT) (WDT) (* ADJP (A)) (* NN NNS) 
                          (* NNP NNPS) (NN NNS) (- \,) (* (PP) ADJP S-REL VP) 
                          (- \,) (* (PP) ADJP S-REL VP) (- \,) (* (PP) ADJP S-REL VP)
                          (* (PUNC)) )))
                (if matchlist
                   (return  
                      (combine-lfs rhs-lfs matchlist
                        '(:f 1 
                           (:q 2 
                             (:o and (:l x (:i x (:f 3 (:f (:f nn 4) 
                                                           (:f (:f nnp 5) 6) ))))
                                     8 10 12 ))))))
                               

                ; PRO[wh]; e.g., "who", "what";
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree) '((WP) (* (PUNC)))))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 1)) )

                (return (default-lf 'WHNP rhs-lfs)) ); unfamiliar WHNP form;
                ; ==========================================================

;; ***TBC -- I STILL NEED TO ALLOW FOR ARBITRARY PPs/ADVPs AT THE END
;;    OF EACH VP, AND SOMETIMES BEFORE THE END (THIS WILL USUALLY BE JUST
;;    BEFORE THE (* (DELIM)) (BRACKETS & PUNCTUATION) THAT I'VE INSERTED 
;;    INSTEAD OF (*));
;;
;;    ALSO PREPROCESSING NEEDS TO CHANGE (NP-TIME ...) TO (PP-TIME (NP-TIME ...))
;;    WHERE THIS IS DEFINITELY AN ADVERBIAL. ALSO I'VE INTRODUCED NEW KEYS
;;    :S :T FOR A PP DEFINITELY FUNCTIONING AS A SUBJECT ARGUMENT (BY-PPs)
;;    IN PASSIVES), AND A PP DEFINITELY FUNCTIONING AS A TERM (VACUOUS P),
;;    BUT PRESUMABLY NOT AS SUBJECT.
;;
;;    I HOPE 'ADJUST-SEMRULE' HANDLES MULTIPLE OPTIONAL PPs CORRECTLY (JUST 
;;    PUTTING THEM SEQUENTIALLY INTO COMPLEMENT POS'N) FOR A RULE DONE 
;;    MORE OR LESS CORRECTLY (APART FROM USE OF NP-TIME) 
;;
;;    THE WAY TO ALLOW FOR FINAL PP/ADVP IS PROBABLY
;;      (* (PP)) (* ADVP (ADV)) (* (PP))
;;    WITH LFs (:r i1) i2 (applied to the VP) and (:r i3),
;;    WITH THE 1ST & 3RD OF THESE APPEARING AS VP CONSTITUENTS (TO BE
;;    CHANGED TO ADVERBIAL ADJUNCTS OR ARGUMENTS).
;;   
;;   I'M ALSO IN THE PROCESS OF REMOVING VP-INITIAL PPs and ADVPs --THEY
;;   JUST DON'T OCCUR IN THE CHARNIAK PARSES.
;;
;;   OTHER THAN THAT, I'M DONE WITH THE VPs, AND SHOULD CONTINUE WITH
;;   THE PPs, ETC.
;;
            (VP-INF; TO + VP; e.g., "[was found] to be alive";
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; added May 15/10: this is the same as VP --> TO + VP
                ; below; used because infinitive complements, though usually
                ; parsed as SBAR (which then becomes S-INF), are sometimes
                ; parsed as VP -- and unlike e.g., infinitive purpose adverbials,
                ; we want to include them as verb complements.
                (setq matchlist (find-parts (cdr tree)
                                  '((TO) (- (ADV)) (VP) (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f Ka (:f 2 3)) ))); interpret as action type

                (return (default-lf 'VP-INF rhs-lfs)) ); unfamiliar VP-INF form;
                ; ==========================================================


            (VP ; AUX + VP ...; e.g., "would limit NBC's involvement"
                ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; We deal with these VPs first since they are fairly reliably 
                ; identifiable (via the AUX POSs introduced by preprocessing).
                ; Note that the copula BE is treated as a BE rather than AUX.
                ;
                (setq matchlist (find-parts (cdr tree)
                                   '(((AUX)) (* ADVP (ADV)) (VP) 
                                             (* (DELIM)) )))
                                   ; NB: no allowance is made here for initial
                                   ; ADV or ADVP, since none is assumed to 
                                   ; be present in the preprocessing that
                                   ; detects AUX's; also AUX labels are only
                                   ; present for verbs with VP complements,
                                   ; not ADJP, PP or NP, and no intervening
                                   ; PPs are allowed for (such as "may in fact
                                   ; leave")
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 2 (:f 1 3)) )))


                ; BE + ADV* + {NP|S-THAT}; e.g., "isn't a fool", "is that I'm sad"
                ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ;
                (setq matchlist (find-parts (cdr tree)
                                 '(((BE)) (* (ADV) ADVP)
                                   (NP S-THAT S-NO-THAT S-NONE S-WHNP) 
                                   (- (DELIM)) (* (PP)) (- (DELIM)) (* (ADV) ADVP)
                                   (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                             ; revised Jan 5/16 (LKS)
                             ;'(:f 7 (:f 2 (:f 1 (:l x (:i x = 3)) (:r 5)))) )))
                              '(:f 7 (:f 2 (:f 1 (:p = 3 (:r 5))))) )))

                ; BE + ADV- + {ADJP|PP}; e.g., "isn't severe"
                ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ;
                (setq matchlist (find-parts (cdr tree)
                                 '(((BE)) (* (ADV) ADVP)
                                   (ADJP UCP (PP))
                                   (- (DELIM)) (* (PP)) (- (DELIM)) (* (ADV) ADVP) 
                                   (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 7 (:f 2 (:f 1 3 (:r 5)))) )))
                     ; Mar 18/09: (:p BE.V (:q <indef-det> MAN.N)) should
                     ; become (:p BE.V MAN.N).

                ; Variant of above copular-BE rule, with AUX instead of BE,
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; TO ALLOW FOR CHARNIAK PARSES OF THIS (DUBIOUS) FORM
                ;
              ; Mar 18/09 LKS: I'VE ELIMINATED THIS IN FAVOR OF A PREPROCESSING
              ; STEP THAT CHANGES AUX-VARIANTS TO BE-VARIANTS FOR COPULAR "BE":
              ; (setq matchlist (find-parts (cdr tree)
              ;                  '(((AUX)) (* (ADV) ADVP)
              ;                    (ADJP UCP NP (PP) S-THAT S-NO-THAT S-NONE S-WHNP)
              ;                    (* (DELIM)) )))
              ; (if matchlist
              ;     (return (combine-lfs rhs-lfs matchlist
              ;               '(:f BE.BE 3) )))
              ;             ; ** Comment: Using be.be or be.v instead of 2
              ;             ; in this LF, in order to correct for the fact
              ;             ; that abstr looks for BE.BE but won't find it
              ;             ; for a Charniak parse of a copula (since he 
              ;             ; makes it AUX) leads to a verbalization of type
              ;             ; CAN BE BE.BE/V <adjp>. This needs fixing...
              ;             ; Auxiliaries get discarded in the abstr process,
              ;             ; but main verbs and copular BE don't.


                ; TO + VP ; to change
                ;~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree)
                                  '((TO) (- (ADV)) (VP) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f Ka (:f 2 3)) ))); interpret as action type

                ; V + VP[-ing]; stopped mopping the floor
                ; ~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree)
                                  '(((V)) (VP S-NO-SUBJ) (* (PP)) 
                                    (* ADVP (ADV)) (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 4 (:f 1 (:f Ka 2) (:r 3))) )))

                ; V + VP-INF; began to mop the floor
                ; ~~~~~~~~~~~
                ; NB: We can't combine with the previous rule because VP-INF
                ; is already interpreted as a nominal, so we don't want to
                ; reify (using Ka) again;
                (setq matchlist (find-parts (cdr tree)
                                  '(((V)) (VP-INF) (* (PP))
                                    (* ADVP (ADV)) (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 4 (:f 1 2 (:r 3))) )))

                ; Next we deal with several types of passives

                ; V[pasv] + NP[-none-]- + PP[by] ; e.g., "impressed by his honesty"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~        i.e., PASSIVE with by-PP
                (setq matchlist (find-parts (cdr tree)
                                  '((VBN) (- NP) (- (ADV)) 
                                          (PP-BY) (* (PP)) (* (DELIM)) ))) 
                (if matchlist
                    ; Is the NP empty (indicating object "raised" to subject)?
                    (if (or (null (third matchlist))
                            (eq (car (second (car (third matchlist)))) '-NONE-) )
                        (return (combine-lfs rhs-lfs matchlist
                                  '(:f 3 (:p (:f BE.PASV 1) (:s 4) (:r 5))) ))))
                
                ; V[pasv] + NP[-none-]- + PP + PP[by]; e.g., "taken to jail by them"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  i.e., PASSIVE & extra compl.
                (setq matchlist (find-parts (cdr tree)
                                  '((VBN) (- NP) ; empty NP
                                    (- (ADV)) ((PP) ~ (PP-TIME) PP-BY) (PP-BY) 
                                    (* (PP)) (* (DELIM)) ))) 
                (if matchlist
                    ; Is the NP empty (indicating object "raised" to subject)?
                    (if (or (null (third matchlist))
                            (eq (car (second (car (third matchlist)))) '-NONE-) )
                        (return (combine-lfs rhs-lfs matchlist
                                  '(:f 3 (:p (:f BE.PASV 1) 
                                             (:r 4) (:s 5) (:r 6))) ))))

                ; V[pasv] + NP[-none-]- + PP[~by] ; e.g., "taken to jail"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ i.e., PASSIVE + compl., w/o by-PP
                (setq matchlist (find-parts (cdr tree)
                                  '((VBN) (- NP) (- (ADV) ADVP)
                                    ((PP) ~ (PP-TIME) PP-BY) 
                                    (* (PP) ~ PP-BY) (* (DELIM)) ))) 
                (if matchlist
                    ; Is the NP empty (indicating object "raised" to subject)?
                    (if (or (null (third matchlist))
                            (eq (car (second (car (third matchlist)))) '-NONE-) )
                        (return 
                          (combine-lfs rhs-lfs matchlist
                            '(:f 3 (:p (:f BE.PASV 1) (:r 4) (:r 5)
                   ; FEB 2/08: OMIT AGENT    (:p BY.P (:q A{N} AGENT)) 
                                                                        ))))))

                ; V[pasv] + S-INF PP[by]; e.g., "forced to leave by rebels"
                ; ~~~~~~~~~~~~~~~~~~~~~  i.e., PASSIVE + VP[to] + by-PP
                ; NB: there won't be any confusion with examples like
                ; "(has) decided to leave", since in such examples the VBN
                ; has been rewritten as VBEN by the tree preprocessor
                ;
                ; *** The inclusion of  S-NO-SUBJ is a kluge to deal with
                ;     the fact that not all VP[to]s are recognized as such
                ;     in preprocessing, because the (TO TO) can get pushed
                ;     to another VP when there's a post-VP adverbial!
                (setq matchlist (find-parts (cdr tree)
                                  '((VBN) 
                                    (VP-INF S-INF S-NO-SUBJ) (PP-BY) (* (PP))
                                    ;^^^^^^ added May 15/10, because it turns
                                    ; out that Treebank parsers don't always
                                    ; parse infinitive complements of VPs as
                                    ; "SBAR" (which I change to S-INF).
                                    (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                             '(:p (:f BE.PASV 1) (:s 3) 2 (:r 4) ))))

                ; V[pasv] + PP[by] + S-INF ; e.g., "forced by rebels to leave"
                ; ~~~~~~~~~~~~~~~~~~~~~~~    (Compare with previous pattern);
                (setq matchlist (find-parts (cdr tree)
                                 '((VBN) (PP-BY) 
                                   (VP-INF S-INF S-NO-SUBJ)
                                   ;^^^^^^ added May 15/10 (as above)
                                   (* (PP)) (* (DELIM)))))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                             '(:p (:f BE.PASV 1) (:s 2) 3 (:r 4)) )))

                ; V[pasv] + S-INF; e.g., "forced to leave",
                ; ~~~~~~~~~~~~~~~  i.e., PASSIVE + VP[to] w/o by-PP
                (setq matchlist (find-parts (cdr tree)
                                 '((VBN) 
                                   (VP-INF S-INF S-NO-SUBJ)
                                    ;^^^^^^ added May 15/10 (as above)
                                   (* (PP))  (* (DELIM)))))
                                    ;^^^^^ Can't be PP-BY (covered by earlier rules)
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                             '(:p (:f BE.PASV 1)
                                        ; (:p BY.P (:q A{N} AGENT)); omit agent
                                                                2 (:r 3) ))))
                ;
                ; V[pasv] + NP[-none-]- + ADJP + PP[by]; e.g., "made public by her"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree)
                                 '((VBN) (- NP) 
                                   (ADJP) (PP-BY) 
                                          (- (ADV)) (* (PP)) (* (DELIM)) ))) 
                (if matchlist
                    ; Is the NP empty (indicating object "raised" to subject)?
                    (if (or (null (third matchlist))
                            (eq (car (second (car (third matchlist)))) '-NONE-) )
                        (return 
                          (combine-lfs rhs-lfs matchlist
                            '(:f 5 (:p (:f BE.PASV 1) 3 (:s 4) (:r 6))) ))))
                             ;** Strictly we should combine (:f 2 4), e.g.,
                             ; "make public", and then passivize *that*; but
                             ; it would give bad verbalizations like "may
                             ; be make public -ed".
                ;
                ; V[pasv] + NP[-none-]- + ADJP; e.g., "made public"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree)
                                 '((VBN) (- NP) (ADJP) 
                                         (* (ADV) ADVP) (* (PP)) (* (DELIM)) ))) 
                (if matchlist
                    ; Is the NP empty (indicating object "raised" to subject)?
                    (if (or (null (third matchlist))
                            (eq (car (second (car (third matchlist)))) '-NONE-) )
                        (return 
                          (combine-lfs rhs-lfs matchlist
                            '(:f 4 (:p (:f BE.PASV 1) 3 (:r 5))) ))))
                             ; Note: This can give bad KNEXT verbalizations 
                             ; like "may be make public -ed".
                ;
                ; V[pasv] + NP[-none-]- ; e.g., "built (hastily) (last year)"
                ; ~~~~~~~~~~~~~~~~~~~~~         i.e., PASSIVE w/o by-phrase
                (setq matchlist (find-parts (cdr tree)
                                 '((VBN) (- NP) (- (ADV)) (* (PP)) (* (DELIM)) )))
                (if matchlist
                    ; Is the NP empty (indicating object "raised" to subject)?
                    (if (or (null (third matchlist))
                            (eq (car (second (car (third matchlist)))) '-NONE-) )
                        (return 
                          (combine-lfs rhs-lfs matchlist
                            '(:f 3 (:p (:f BE.PASV 1) (:r 4))) ))))

                ; For miscellaneous VPs, begin with the "largest" complement 
                ; structures, possibly with intervening adverbials; whatever 
                ; is not identified as a complement or intervening adverbial 
                ; in these earlier attempts will be treated as final adverbials 
                ; in the remaining match attempts (looking for smaller complement 
                ; structures).
                ;
                ; V + NP + S ...; e.g., "told Maude that she was in the hall"
                ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; When there's an NP complement, any PP preceding a that-clause 
                ; is likely to be an ADVL. 
                ; Note: NP-TIME doesn't match NP, so this won't accept "said
                ; Friday that ..."
                ;
                (setq matchlist (find-parts (cdr tree)
                                 '(((V)) (NP) 
                                   (* ADVP (ADV)) (* (PP))
                                   (S-THAT S-NO-THAT S-NONE S-WHNP) 
                                   (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 3 (:p 1 2 (:r 4) 5)) )))

                ; V + PP + S ...; "said to her that she would thrive here"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; where a PP[by|from|of|to] is likely to supply an argument
                ; -- but not necessarily: "whispered in her ear that ..."
                ;
                (setq matchlist (find-parts (cdr tree)
                                 '(((V)) (* (PP-TIME)) 
                                   (PP-BY PP-FROM PP-OF PP-TO ~ (PP-TIME))
                                   (* (PP)) (S-THAT S-NO-THAT S-NONE S-WHNP) 
                                   (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:p 1 5 (:r 3) (:r 2) (:r 4)) )))
                    ; ** Possibly the pattern for that-complements should be
                    ; refined to exclude so-that, now-that, and not-that clauses

                ; V + NP + VP[INF] ...; e.g., "asked Kitti to join him"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; We don't allow for an adverbial between the NP and S-INF, 
                ; since then the S-INF is likely to be a purpose-adverbial 
                ; (**which it may be even if it follows an NP ... this may 
                ; need revision); the optional constituent after the V is 
                ; intended to allow for an apostrophe, as in "askin ' Kitti 
                ; to join him";
                ; 
                (setq matchlist (find-parts (cdr tree)
                                   '(((V)) (- ~ NP) 
                                          ;^^^^^^unlikely
                                     (NP) (VP-INF S-INF) (* (DELIM)) )))
                                    ;^^^^^^ added May 15/10 (as above)
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:p 2 3 4) )))

                ; V + NP + VP[BASE] ...; e.g., "let him go", "made him leave"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree)
                                 '(((V)) (- ~ NP) (NP) (VP) (* (DELIM)) ))) 
                                         ;^^^^^^unlikely
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 1 4 3) )))


                ; V + PP + NP ...; e.g., "brought with him several presents"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree)
                                   '(((V)) (- \,) ((PP))
                                     (- \,) (NP) (* (PP)) (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:p 1 5 (:r 3) (:r 5)) )))

                ; V + VP[INF] ...; e.g., "wanted to leave"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; with possible adverbial before the V; we don't allow for 
                ; an adverbial between the V and S-INF, since then the S-INF 
                ; is likely to be a purpose-adverbial
                ; 
                (setq matchlist (find-parts (cdr tree)
                                   '(((V)) (* (ADV) ADVP) 
                                      (VP-INF S-INF) (* (DELIM)) )))
                                     ; ^^^^ added May 15/10 -- as further up
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 2 (:p 1 3)) )))

                ; V + NP + NP[~TIME]...; e.g., gave herself a title"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; with possible adverbials before the V (and a possible
                ; apostrophe or other word after it, preceding either NP);
                ;
                (setq matchlist (find-parts (cdr tree)
                                   '(((V)) (-) 
                                          ;^^^ unlikely
                                     (NP) (-) (NP) (* (PP))
                                         ;^^^ unlikely 
                                     (* ADVP) (* (PP)) (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 7 (:p 1 3 5 (:r 6) (:r 8) )) )))

                ; V + NP + PP[~TIME]...; e.g., told police about the tenant"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; with possible adverbials before the V
                ; [Jan 27/13: *** PREVIOUSLY THE PP's WERE LIMITED TO {PP-ABOUT 
                ; PP-BY PP-FROM PP-TO PP-WITH}, BUT (PRIOR TO GENERAL REVISION
                ; OF THE VP RULES) I'VE CHANGED THIS TO ANY NON-TIME PP, SO ALL
                ; PP's WILL NOW BE APPEARING ALONGSIDE NOMINAL ARGUMENTS OF
                ; VERBS; WHETHER THEY ARE ADJUNCTS OR ARGUMENTS WILL HAVE TO BE
                ; RESOLVED IN THE LF REPAIR STAGE.
                ;
                (setq matchlist (find-parts (cdr tree)
                                   '(((V)) (-) (NP) (* (ADV) ADVP)
                                     ((PP) ~ (PP-TIME)) (* (PP)) (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 4 (:p 1 3 (:r 5) (:r 6))) )))

                ; V + NP + NP[WH]...; e.g., "told you what her doctor said"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; (S-WHADVP is likely to be a nominal rather than adverbial if
                ; not preceded by a comma);
                ;
                (setq matchlist (find-parts (cdr tree)
                                   '(((V)) (-) (NP) (S-ADVP) (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:p 1 3 4) )))

                ; V + ADV- + PP[~TIME] XP[~THAT]*; e.g., "relies heavily on luck"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ;
                (setq matchlist (find-parts (cdr tree)
                                   '(((V)) (* ADVP (ADV)) 
                                     ((PP) ~ (PP-TIME)) (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 2 (:p 1 (:r 3))) )))
                    ; This may often incorporate a PP adjunct into an intrans-
                    ; itive VP, but it seems better to err in this direction 
                    ; than to misclassify a PP complement as an adjunct

          ; EDITING OF VP ADVP/PP TBC ; ADVP prob'ly needs to become (ADVP)
          ;   TO ALLOW FOR S-WHADVP, S-WHEN, ETC.

                ; V + NP + ADJP ...; e.g., "made himself as small as possible"
                ; 
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; with possible adverbials before the V; NOTE: we treat the verb
                ; as a FUNCTION forming a 2-place predicate
                ;
                (setq matchlist (find-parts (cdr tree)
                                   '(((V)) (-) (NP) (ADJP) (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:p (:f 1 4) 3) )))

                ; V + ADJP ...; e.g., "appear better than they really are
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; with possible adverbials before the V; NOTE: we treat the verb
                ; as a FUNCTION forming a 1-place predicate
                ;
                (setq matchlist (find-parts (cdr tree)
                                   '(((V)) (-) (ADJP) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 1 3) )))

                ; V + UCP ...; e.g.,"became increasingly mellifluous, reassuring, ...
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; with possible adverbials before the V; this is an ad hoc insertion
                ; to deal with one UCP example (I don't know in general what UCPs
                ; are). NOTE: we treat the verb as a FUNCTION forming a 1-place 
                ; predicate
                ;
                (setq matchlist (find-parts (cdr tree)
                                   '(((V)) (UCP) (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 1 2) )))


                ; V + S[that|none|wh] ...; e.g., "thought in her mind she might die"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; with 0 or more adverbials between V and S
                ;
                (setq matchlist (find-parts (cdr tree)
                                   '(((V)) (* ADVP (ADV)) 
                                     (* (PP)) (S-THAT S-NO-THAT S-NONE S-WHNP) 
                                     (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 2 (:p 1 4 (:r 3))) )))

                ; V + S ...; e.g., "had its facade sheared off by the shock"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Not covered because this syntactic analysis doesn't permit
                ; a sensible interpretation. (But the final rule below, VP -> V,
                ; guards against interpreting such a VP.)

                ; V + NP ...; e.g., "destroyed all the rolling stock"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; with possible adverbials before the V and after the NP
                ; NB: IT WOULD BE A MISTAKE TO ALLOW AN UNCONSTRAINED FINAL (*),
                ;     AS THE PRECEDING OPTIONAL CONSTITUENTS COULD THEN BE
                ;     IGNORED!
                ;
                (setq matchlist (find-parts (cdr tree)
                                   '(((V)) (-) (NP) 
                                     (* (PP)) (* ADVP (ADV)) (* (PP)) 
                                     (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 5 (:p 1 3 (:r 4) (:r 6))) )))

                ; V + NP[WH] ...; e.g., "knew why I was entering the hospital"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; with a possible adverbial before the V; ** we could insert
                ; optional adverbials and NP-TIME phrases before the S-WHADVP...
                ;
                (setq matchlist (find-parts (cdr tree)
                                   '(((V)) (S-WHADVP) (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:p 1 2) )))

                ; V ...; e.g., "living under a cloud"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; with possible preceding and following adverbials (there 
                ; should be no NPs, ADJPs, or non-adverbial S and SBAR 
                ; unmatched at this point)
                ; 
                (setq matchlist (find-parts (cdr tree)
                                   '(((V)) (* (PP)) (- \,)
                                     (* ADVP (ADV)) (- \,) (* (PP)) (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f 4 (:p 1 (:r 2) (:r 6))) )))

                ; VP + X*; e.g., "quickly sell the car and buy a new one"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree)
                                   '((* (PP)) (* ADVP (ADV)) (* (PP)) (VP) 
                                     (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist
                              '(:f (:f adv-? 1) (:f 2 (:f (:f adv-? 3) 4))) )))

                (return (default-lf 'VP rhs-lfs)) ); unfamiliar VP form;
                ; ======================================================



            (PP 
                ; NP-TIME; e.g., "yesterday"; Note: the PP will be PP-TIME
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree)
                                   '((NP-TIME) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:p during.p 1))))

                ; ADVP- + P + NP; e.g., "in the street"; "later in the evening"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree) 
                                   '((- ADVP) ((P)) (NP NP-TIME) 
                                                    (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 (:p 2 3)))) )

                ; ADV[NOT] + PP; e.g., "not as a response"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree) '(((ADV)) ((PP)))))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 2))) )

                ; NP + ADV; e.g., "light years away"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree) '((NP) ((ADV)))))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:p 2 1))) )

                ; P + gerund; e.g., "in getting their money back"; "by threatening"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Note: the parser is likely to produce (S (VP ...)) gerunds,
                ; which may be changed in preprocessing to just VP rather than
                ; S-ING.
                (setq matchlist (find-parts (cdr tree) '(((P)) (S-ING VP))))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 
                              '(:p 1 (:f KA 2)) )))

                ; ADV[rather] + P[than] + NP; e.g., "rather than a lawful action"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; We dig into the word content for this exceptional construct;
                ; ** The semantics needs further thought: "rather-than", like
                ;    a conjunction, can combine various semantic types (a cottage
                ;    rather than a house; happy rather than sad; Bill rather than
                ;    Bob; likes to read rather than watch TV; at home rather than
                ;    at the office). 
                (when (and (eq (second (first (cdr tree))) 'rather)
                           (eq (second (second (cdr tree))) 'than)
                           (eq (first (third (cdr tree))) 'NP)
                           (null (fourth (cdr tree))) ); no further parts
                      (setq matchlist (find-parts (cdr tree) 
                                        '(((ADV)) (IN) (NP))))
                      (return (combine-lfs rhs-lfs matchlist
                                        '(:p rather-than 3) )))

                ; V[ing] NP; e.g., "including Britain" (** that's weird one!)
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

                ; V[en] PP; e.g., "based on his recommendation" (** also weird)
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; We ignore the above 3 types of "PP"s, for now

                (return (default-lf 'PP rhs-lfs)) ); unfamiliar PP form;
                ; ======================================================

            (ADVP
                ; Quick exeption for 'not', in case it ever occurs as 
                ; ADVP (rather than simply (RB not), as the Charniak parser
                ; generally has it). It is already lambda-abstracted at the
                ; lexical level, so as to become an S-modifer when applied to
                ; a predicate (esp. VP). Other sentential ADVP modifiers 
                ; with an S-adverb head are abstracted that way at the ADVP 
                ; level, and we always apply the result to a predicate (VP),
                ; not the sentence. (PP constituents at the sentence level are
                ; handled differently, using an 'adv-s' operator.)
                (if (or (equal (second tree) '(RB not))
                        (equal (second tree) '(RB n\'t)))
                    (return (car rhs-lfs))); should be (when applied to a pred)
                                           ; (:l p (:l x (:f not (:i x p))))

                ; ADV* + ADV ; e.g., "luckily", "so severely ..."; "much earlier"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; (Note: (ADV) covers RB, RBR, RBS).
                ; We assume that lexical adverbs have the same (predicative)
                ; sense as the underlying adjective, and only become predicate
                ; modifiers through the operation of 'adv' (originally, '-ly'),
                ; which in a more semantically oriented grammar would always
                ; be done at the level of ADVP formation from the ADV. 
                ; 
                ; So here we need to apply 'adv' to the initial adverb, and
                ; to the phrase as a whole. Originally I used an '-ly-inv'
                ; operator, but this becomes rather awkward for comparatives,
                ; e.g., "is/runs at least 5mph faster than I do", where we want
                ; "faster" to be interpreted as (to-degree d fast.a) -- whether
                ; the verb is "is" or "runs".
                ;
                (setq matchlist (find-parts (cdr tree) 
                                 '((* (ADV)) ((ADV)) (* (DELIM))) ))
                (if matchlist 
                    (if (sentence-modifying-advp? (cons 'ADVP (cdr tree)))
                        (return (combine-lfs rhs-lfs matchlist
                                  '(:l p (:l x (:f (:f 1 2) (:i x p)))) ))
                        (return (combine-lfs rhs-lfs matchlist 
                                  '(:f 1 2) ))))

                ; ADJP; e.g., [arrived] very early
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; The example is parsed as (VP <verb> (ADJP (RB VERY) (JJ EARLY))),
                ; whereas "[arrived] early" is parsed as (VP <verb> (ADVP (RB EARLY)))).
                ; If we change the (ADJP ...) to (ADVP (ADJP ...)), except for verbs
                ; taking predicate complements, then we need the present rule:
                (setq matchlist (find-parts (cdr tree)
                                      '((ADJP) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f adv 1))))


                ; ADVP S[AS]; e.g., "so heavily as to pass out"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; The S[AS] is actually parsed as (SBAR (IN AS) (S (VP (TO TO) ...))).
                ; In the variant "so severely as to turn away investors", Charniak
                ; makes "so severely" and "as to turn away investors" separate 
                ; ADVP and SBAR constituents; ** I'll need preprocessing rules
                ; to combine them.
                ;
                (setq matchlist (find-parts (cdr tree) 
                                 '((ADVP) (S-AS) (* (DELIM))) ))
                (if matchlist 
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 2))) )
                    ; *** but this only makes sense if the S-AS  ^^^ has
                    ;     been appropriately interpreted...

                ; ADVP S[than]; e.g., [arrived] much sooner than {he} expected.
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; The S[than] is originally parsed as (SBAR (IN THAN) (S (VP ...)))
                (setq matchlist (find-parts (cdr tree)
                                 '((ADVP) (S-THAN) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 2))) )
                    ; ***but this only makes sense if the S-THAN ^^^ has
                    ;    been appropriately interpreted...
       
                ; PP; e.g., "of course", "in spite of ...", "for lack of ..."
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; This is a construction not originally present in Treebank
                ; trees, but created by preprocessing
                ;
                (setq matchlist (find-parts (cdr tree) 
                                 '(((PP)) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 
                              '(:f adv-s 1) )))
              
                ; ADV PP[than]; e.g.,  {much} later than you"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree) 
                                 '((- ((ADV))) ((ADV)) (PP-THAN) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 (:f 2 3)))) )
                    ; ** This presupposes appropriate semantics for  ^^^^^, i.e., 
                    ;    the comparative adverb and the PP-THAN...
              
                ; ADV PP; e.g., "south of Los Angeles";
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree) 
                                 '(((ADV)) ((PP)) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:p 1 2))) )

                (return (default-lf 'ADVP rhs-lfs)) ); unfamiliar ADVP form;
                ; ==========================================================
                
            (WHADVP; WRB; e.g., "where [did he go]"; 
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ;
                (setq matchlist (find-parts (cdr tree) '((WRB))))
                (if matchlist 
                    (return (combine-lfs rhs-lfs matchlist '(:r 1))))

                ; WRB + RB; e.g., "How fast [did she run]"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Here "fast" should be interpreted as if it were an adjective,
                ; "how" should be interpreted as "to what degree" = 
                ; (L P (to-degree <wh degree> P)), and -- if this is really
                ; a WHADVP and not a WHADJP -- an (adv ...) operator should
                ; be wrapped around the phrase
                ;
                (setq matchlist (find-parts (cdr tree) '((WRB) (RB))))
                (if matchlist 
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 2))))

                ; RB + WRB; e.g., "Exactly where [did you ...]"; 
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; e.g., "Approximately when [did you leave the house?]"
                (setq matchlist (find-parts (cdr tree) '((RB) (WRB))))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:r (:f 1 2)))))

                ; RB + WRB + JJ; e.g., "Exactly how fast [was she driving?]"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ;
                (setq matchlist (find-parts (cdr tree) '((RB) (WRB) (JJ))))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 (:f 2 3)))))

                (return (default-lf 'WHADVP rhs-lfs)) ); unfamiliar WHADVP form;
                ; =============================================================
               
            (ADJP; ADJP + S[AS]; e.g., "as severe as the media suggested"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; ADJP + S[than]; e.g., "better than they really are"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; ADJP + CC + ADJP; "most lucrative and fastest-growing"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Ignore everything but the adjective
                ;
                (setq matchlist (find-parts (cdr tree) 
                                 '((ADJP) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 1)) )

                ; ADV* + ADJ + S-INF; e.g., "hard to justify"; "able to relax" 
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; ADV* + ADJ + S-THAT; e.g., "aware that ..."
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; ADV* + ADJ + PP; e.g., "weary of ..."; "sorry about ..."
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Ignore the adverb, if present; the infinitive complements
                ; are problematic; "hard to justify" should lambda-abstract
                ; the object of "justify", and "hard" should really come out
                ; as "hard-for a certain individual". ("Eager", by contrast,
                ; would have a tacit anaphor as verb object, and no lambda-
                ; abstraction.) Infinitives are assumed to be interpreted 
                ; using (Ka ...), i.e., as action types.
                ;
                (setq matchlist (find-parts (cdr tree) 
                                  '((* (ADV)) ((A)) 
                                    (VP-INF S-INF S-THAT (PP))
                                    ;^^^^^ added May 15/10 
                                    ; (cf. V + VP-INF further up) 
                                    (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 (:p 2 3)))) )


                ; ADV* + ADJ; e.g., "as warm"; "entirely true"; "most lucrative"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; ADV* + ADJ[ER] ...; e.g., "better, safer, or cheaper"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Ignore the adverb, if any, as well as complements
                ;
                (setq matchlist (find-parts (cdr tree) 
                                 '((* (ADV)) ((A)) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 2))) )

                ; ADV (putatively!); e.g., "close", "still" in "come close",
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; "stand still" (This occurs in the Brown corpus.)
                ; ~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree) '((* (ADV)) ((ADV)))))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 2))) )

                ; $ + ADJ[cardinal] ...; e.g., "$10" (in $10 fine)
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree) 
                                 '(($) (CD) (* (DELIM)) )))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:f 1 2))) )

                ; ADV + PP; (putatively!) e.g., "open to the air"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                (setq matchlist (find-parts (cdr tree) 
                                 '(((ADV)) ((PP)) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist '(:p 1 2))) )

                ; PP; e.g., "in charge of the case", "at war with France"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; This does not occur in Treebank trees but can be introduced
                ; by preprocessing (for 3-word pp-cliches that can only be
                ; interpreted as predicates, not adverbials)
                ;
                (setq matchlist (find-parts (cdr tree) 
                                 '(((PP)) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 1)) )

                ; VBG; e.g., "reassuring"
                ; ~~~~~~~~~~~~~~~~~~~~~~~
                ; Jan 2/02: preprocessing (ADJP (VBG ..)) now gives (ADJP (JJ ..))
                ;
                ; Note that verb inflection is ignored in `make-logical-atom',
                ; so the LF of, e.g., "reassuring" will be `reassure.V';
                ; the semantic object should be filled in with a tacit referent,
                ; based on the null syntactic object. Unfortunately, the
                ; Treebank annotations don't provide any "missing object"
                ; information about deverbal adjectives like "reassuring"
                ; vs., say, "glittering"... so here we just "guess" that
                ; there's a missing object. **We might allow complements ...
                ;
                (setq matchlist (find-parts (cdr tree) 
                                 '((- (ADV)) (VBG) (* (DELIM))) ))
                (if matchlist (return (combine-lfs rhs-lfs matchlist 
                                         '(:f 1 (:p 2 impl-ref)) )))

                ; VBN; e.g., "disappointed"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~
                ; Jan 2/02: preprocessing (ADJP (VBN ..)) now gives (ADJP (JJ ..))
                ;
                ; This raises similar issues as VBG (above), except that the VBN
                ; is assumed to have a missing subject, while the object is
                ; lambda-abstracted. Again, the failure to distinguish between
                ; past participle and passive participle is a problem -- e.g.,
                ; "fallen star" vs. "forgotten star". We "guess" that we have
                ; a passive participle.
                ;
                (setq matchlist (find-parts (cdr tree) 
                                 '((- (ADV)) (VBN) (* (DELIM))) ))
                (if matchlist (return (combine-lfs rhs-lfs matchlist
                                         '(:l x (:i impl-ref 2 x)) )))

                (return (default-lf 'ADJP rhs-lfs)) ); unfamiliar ADJP form;
                ; ==========================================================

            (WHADJP; WRB + JJ; e.g., "How many [books did he write?"]
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ;
                (setq matchlist (find-parts (cdr tree) '((WRB) (JJ)) ))
                (if matchlist (return (combine-lfs rhs-lfs matchlist
                                        '(1 2) )))
                ; WHADVP + JJR|ADJP; e.g., "How many more [books will you write]?"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ; e.g., "How much more expensive [is this?]"
                ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                ;
                (setq matchlist (find-parts (cdr tree) 
                                           '((WHADVP) (JJR ADJP)) ))
                (if matchlist (return (combine-lfs rhs-lfs matchlist
                                        '(1 2) )))

                (return (default-lf 'WHADJP rhs-lfs)) ); unfamiliar WHADJP form;
                ; ==========================================================

            (UCP; ** I don't know in general what this is (unknown category
                ; phrase?), but am putting in something to deal with the 
                ; one WSJ example in Amon's random 100 sentences; this is 
                ; of form
                ; (UCP (ADVP ...) (ADJP ...) (|,| |,|) (ADJP ...) etc.),
                ; and I'll just pull out the first ADJP
                (setq matchlist (find-parts (cdr tree) 
                                 '((* ADVP (ADV)) (ADJP) (* (DELIM))) ))
                (if matchlist
                    (return (combine-lfs rhs-lfs matchlist 2)) )

                (return (default-lf 'UCP rhs-lfs)) ); unfamiliar UCP form;
                ; ==========================================================
                
            (T ; unknown phrase type
                 (return (default-lf rootcat  rhs-lfs)) ); unfamiliar phrase type
       ); end of case statement
 )); end of derive-phrase-lf


;;*** THIS IS FROM THE MINIPAR CODE  (no such function in KNEXT code)
;;    Probably requires changes; e.g., in preprocessed Treebank trees,
;;    we have not just V, but also AUX and BE (copular), as abstract (isa)
;;    types. In the Minipar-derived PSTs, 'aux', 'be', etc. are features,
;;    and the category is V. I'll have to apply 'isa', I think (see
;;    also 'isa-type-of-verb').
;;
(defun default-lf (cat rhs-lfs)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; When a phrase is uninterpretable, we output a default LF that consists
; of a new atom flagged with the category (indicator 'cat) and logical 
; type (indicator 'type) of the phrase, followed by the list of logical
; forms rhs-lfs corresponding to the constituents that couldn't be
; incorporated by any semantic rule.
;
  (let (type atm)
       (setq type
             ;; *** DONE VERY QUICKLY -- NEEDS FURTHER THOUGHT TO GET
             ;;     THE RIGHT CATEGORIES
             (case cat ((S S-NO-THAT S-THAN S-AS-AS) 'WFF) 
                       ((YNQ SQ Q SINV) 'YN-QUEST)
                       ((WHQ) 'WH-QUEST)
                       ((NP WHNP S-WHNP S-WHPP VP-INF NAME PRO S-THAT) 'TERM) 
                       ((VP S-NO-SUBJ S-REL S-ING PP ADJP V N P A) 'PRED) 
                       ((ADVP ADV S-WHADVP NP-TIME) 'MODIF)
                       ((DET DETP) 'DET)
                       (CONJ 'CONJ)
                       (UCP 'UCP)
                       (t cat) ))
       (setq atm (intern (concatenate 'string (string (gensym (string type)))
                                             "." (string cat) )))
       (setf (get atm 'type) type)
       (setf (get atm 'cat) cat)
       (cons atm rhs-lfs); result
 )); end of default-lf

;; *** NOT SURE WHICH OF THE FOLLOWING FUNCTIONS FROM "EXTRACT-PATTERNS'
;;     I'LL NEED HERE


(defun guess-entity-type (complex-name); June 15/01; tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; For a simple or complex name given as as list of atoms, such as (JOHN), 
; (MR \. SMITH), (SOUTH KOREA), (THE ROCKY MOUNTAINS), (U \. S \.), (CARNEGIE
; GROUP INC \.), etc., return a probable entity type, such as (respectively)
; MALE.N, MAN.N, COUNTRY.N, (:F PLUR MOUNTAIN.N), COUNTRY.N, COMPANY.N, etc.
; The default is 'NAMED-ENTITY.N.
;
 (prog (word1 name pred chars)
       (setq word1 (car complex-name))
       (if (numberp word1) (return 'numeric-entity*)); e.g., 3 lbs
       (if(stringp word1) (return 'string-characterized-entity*)); e.g., "doh" guy
       (if (listp word1) (return 'list*)) ; (unexpected)
       ; First check for title
       (setq pred
             (case word1 ((mr mr\. senor) 'man*) (king 'king*) (emperor 'emperor*) 
                         (sultan 'sultan*) (prince 'prince*) (princess 'princess*) 
                         (sheik 'sheik*) (raja 'raja*) (maharaja 'maharaja*)
                         ((sir baron lord duke earl marquis count) 'nobleman*)
                         ((mrs mrs\. ms ms\. senora) 'woman*) 
                         ((miss senorita) 'female-person*) 
                         (queen 'queen*) (empress 'empress*)
                         ((lady duchess countess madam) 'noblewoman*)
                         ((dr dr\.) 'doctor-or-phd*)
                         (doctor 'doctor*)
                         ((prof prof\. professor) 'professor*)
                         ((rep rep\. hon hon\. representative) 
                          'elected-representative*)
                         (justice 'judge*)
                         (judge 'judge*)
                         (mayor 'mayor*) ((gen gen\. general) 'general*)
                         ((capt capt\. captain) 'captain*) 
                         ((adm adm\. admiral) 'admiral*)
                         ((gov gov\. governor) 'governor*)
                         ((pres pres\. president) 'president*) ))
       (if (and pred (cdr complex-name)) 
           (return (append-pos-to-word pred 'n)) )

       ; For single words check if this ends in CO (e.g., Philco, Atco, ...) 
       ; and if so take it to be a company name (keeping in mind that the 
       ; rather few common names ending in CO, like Chico or Mexico, are 
       ; assumed to have prior 'entity-type properties and so wouldn't cause 
       ; invocation of this program). For all other one-word names default 
       ; to the entity's name. It may be that if personal names, country names, 
       ; city names, etc., are adequately pretagged with 'entity-type properties,
       ; most such 1-word entities will turn out to be companies, though it
       ; might depend on the genre (e.g., WSJ versus a medical text).
       (when (null (cdr complex-name))
             (setq chars (coerce (string word1) 'list))
             (if (< (length chars) 3) (return 'named-entity*.n))
             (let ((2chars (last chars 2)))
                  (if (and (char-equal (car 2chars) #\C)
                           (char-equal (second 2chars) #\O) )
                      (return 'company*.n) 
                      (return 'named-entity*.n) )))

       ; No entity type found yet; for a one-word abbreviation followed by 
       ; a period, try to look up the type of that one word
       (if (and (cdr complex-name)
                (null (cddr complex-name)) (eq (second complex-name) '\.) )
           (if (get word1 'entity-type) 
               (return (get word1 'entity-type))
               (return 'named-entity*.n) )); return default value
       ; Indicator 'entity-type might have values like 'us-state -- 
       ; and maybe other commonly abbreviated categories (though there are
       ; no other one-word abbreviations so far, as of June 19/01)

       ; For two words, check for continent as second word 
       ; (e.g., South-East Asia, North Africa), or country as second 
       ; word (e.g., East Germany -- which may not be listed as a country)
       ; 
       (if (null (cddr complex-name))
           (if (eq (get (second complex-name) 'entity-type) 'continent*.n)
               (return 'continental-region*.n)
               (if (eq (get (second complex-name) 'entity-type) 'country*.n)
                   (return 'country*.n) )))

       (if (member complex-name
           ; Note: `America' and `USA' should be covered by 'entity-type value =
           ; country
             '((U \. S \.) (U\. S\.) (U \. S \. A \.) (U\. S\. A\.) (UNITED STATES)
               (THE UNITED STATES) (UNITED STATES OF AMERICA)
               (THE UNITED STATES OF AMERICA) (THE U \. S \. OF A \.) )
             :test #'equal )
           (return 'country*.n) ); a parochial rule, but ...

       ; For multiple words, first look for a final key word  like "associates",
       ; "avenue", etc. or abbreviation like  (... CO \.), (... INC \.), 
       ; (... MD \.), etc. (However, we avoid terms like "River", "Lake", and
       ; "Park" here, which are also fairly common personal names.)
       (let* ((final-symbols (last complex-name 2))
              (final-word (if (eq (second final-symbols) '\.)
                              (car final-symbols) 
                              (second final-symbols) )))
             (setq pred
                   (case final-word
                         ((co co\. company corp corp\. corporation inc inc\. 
                           ltd ltd\. group research associates brothers bros
                           bros\. sons systems) 'company* )
                         ((dept dept\. department service bureau commission
                           association refuge jury court board council caucus
                           assembly committee chamber cabinet directorate ) 
                          (symb ; add final '*' after joining last 2 words
                            (make-multiword "-" 
                                (if (eq (second final-symbols) '\.)
                                    (last (butlast complex-name) 2)
                                    (last complex-name 2) ))
                            "*" ))
                         (airlines 'airline*)
                         ((army navy force corps regiment troop column 
                           brigade battalion squadron platoon guard legion)
                          'military-or-other-action-organization* )
                         (md 'doctor*)
                         ((jr jr\. sr sr\.) 'person*) 
                         ((st st\. street ave ave\. avenue road rd rd\.) 'road*) 
                         ((highway parkway turnpike throughway expressway) 
                          'highway*)
                         (building 'building*)
                         (forest 'forest*)
                         ((garden gardens) 'garden*)
                         (school 'school*)
                         (college 'college*)
                         ((univ univ\. university) 'university*)
                         ((mtn mtn\. mountain) 'mountain*)
                         ; the following plural can't be handled by
                         ; 'append-pos-to-word', so treat it specially:
                         (mountains (return '(:f PLUR mountain*.n)))
                         (ocean 'ocean*) 
                         (orchestra 'orchestra*)
                         ((prep prep\. academy) 'school*)
                         (zoo 'zoo*) ))
             (if pred (return (append-pos-to-word pred 'n)))

            ; If there are no commas `and's or &'s, and the first name is 
            ; a given name, take the name as personal; 
            (if (and (null (intersection '(\, and &) complex-name))
                     (member (get word1 'entity-type) 
                            '(male*.n female*.n) ))
                (return (get word1 'entity-type)) )

            ; Check final word again, for common types of named entities 
            ; that might also be names, but weren't confirmed as such in
            ; the previous step:
            (setq pred
                   (case final-word
                         (castle 'castle*)
                         (river 'river*)
                         ; ** Risky: some towns are named "Snake River", etc. ...
                         (lake 'lake*)
                         (park 'park*) ))
            (if pred (return (append-pos-to-word pred 'n)))

            ; Also use types of intermediate words as clues - e.g.,
            ; earl --> 'nobleman, justice --> 'judge
            ; (as in "chief justice ..."), judge --> 'judge
            ; (as in "district court judge ...")
            ; also: first federal savings loans bank & research
            ; are indicative of companies
            (setq name (main-name complex-name))
            (dolist (ww '((air . airline*)
                          (justice . judge*) 
                          (judge . judge*) (savings . bank*)
                          (loan . bank*) (loans . bank*) (first . bank*)
                          (corporate . company*)
                          (& . company*)
                          (federal . national-agency*)
                          (earl . earl*) ))
                    (if (member (car ww) name)
                        (return-from guess-entity-type 
                           (append-pos-to-word (cdr ww) 'n)) ))

            ; still no type found
            (return 'named-entity*.n) )
 )); end of guess-entity-type


;; From Paul Graham's "On Lisp":
;; Given one or more arguments, e.g. symbols or numbers, join them into 
;; a single string.
;;   (mkstr 'hello 'there)
;;   "HELLOTHERE"
;;
(defun mkstr (&rest args)
  (with-output-to-string (s)
    (dolist (a args) (princ a s))))


;; From Paul Graham's "On Lisp":
;; Given one or more arguments, e.g. symbols or numbers, join them into
;; a single symbol.
;;   (symb 'hello 'there)
;;   HELLOTHERE
(defun symb (&rest args)
  (values (intern (apply #'mkstr args))))
            

(defun main-name (complex-name); June 15/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Return an initial word list from complex-name that discards material
; after first `of' or first comma, or in parentheses
;
 (prog (name1 name2 name skip)
       ; First delete parentheticals:
       (dolist (w (reverse complex-name))
               (cond ((eq w '\)) (setq skip t));-(
                     ((eq w '\() (setq skip nil));-)  
                     ((not skip) (push w name)) ))
       ; Drop everything after first comma or `of':
       (setq name1 (member 'of complex-name))
       (if name1 (setq name1 (butlast name (length name1)))
                 (setq name1 name) )
       (setq name2 (member '\, name))
       (if name2 (setq name2 (butlast name (length name2)))
                 (setq name2 name) )
       (if (> (length name1) (length name2))
           (setq name name2)
           (setq name name1) )
       (return name)
 )); end of main-name



(defun make-trace-translation (trace-symbol) ; Mar 25/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; For now, return the trace-symbol itself, e.g., *, *T*, *?*, *-1, ..., *-6,
; *U*, *ICH*, *EXP*, *RNR*, (others? Brown uses \0, T, *pseudo-attach*)
  trace-symbol )

 
(defun leftmost-atom (x) ; Mar 21/01
;~~~~~~~~~~~~~~~~~~~~~~
 (if (atom x) x (leftmost-atom (car x))) )


(defun find-parts (phrases regexp); Mar 27/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; PURPOSE: To match the top-level elements of the list `phrases' using the
;     (more or less) regular expression `regexp', producing a list that
;     represents a segmentation of `phrases' into sublists, one corresponding
;     to each element of `regexp'. If the match fails, the result is nil.
;     The segmentation produced corresponds to a LEFTMOST match, i.e., for
;     each element of `regexp', short matches are tried before longer ones.
;     This is *not* an efficient FSA-based algorithm, but probably fast
;     enough. for the relatively short inputs expected here.
; phrases: a list of phrase structure trees such as ((NP ...) (VP ...)), or
;     ((AUXZ has) (RB |n't|) (VP ... ) (|,| |,|) (ADVP)). These represent
;     the subtrees of a given node in a (preprocessed) Treebank tree.
; regexp: a non-nil list of subexpressions where each subexpression can be 
;     matched against a sequence of elements of `phrases'. A subexpression 
;     in the simplest case is a singleton list containing a phrase type, e.g., 
;     (NP). Or it may contain multiple phrase types, indicating *alternative*
;     allowable phrase types, e.g., (RB ADVP). Or besides phrase types
;     it may contain isa-abstractions of phrase types, distinguished by 
;     being bracketed; e.g., ((V) MD) (verb or modal); or it may be the
;     negation of such a list, indicating that *none* of the given 
;     categories must match;  e.g., (~ RB ADV); or it may be a list of
;     alternatives, followed by `~', followed by a sequence of prohibited
;     types; e.g., ((PP) ~ (PP-TIME)) (any PP not recognized as temporal). 
;     Or it may be an iteration of any of the previous types of subexpressions,
;     indicated by an initial Kleene `*', `+', or `-' (the last meaning "at 
;     most one such constituent"); e.g., (* RB ADVP).
;     N.B: ((A) (B) (C) ... ~ D E F ...) can be equivalently rewritten as
;          ((A) (B) (C) ... ~ (D) (E) (F) ...) since `isa' is treated as
;          reflexive, i.e., any atom is its own isa-abstraction as well as 
;          possibly having a non-trivial abstraction given as value of its 
;          isa-indicator. So an abstraction feature (F) in a pattern component 
;          strictly means that the atom being matched IS F OR IS ABSTRACTABLE 
;          TO F. For instance, ADV is equivalent to (ADV) (assuming that ADV
;          isn't a proper isa-abstraction of anything). 
;     
;     Example of regexp as a whole: ((* ~ NP VP) (NP) (* ~ NP VP) (VP) (*)), 
;     i.e., "A list of trees consisting of 0 or more trees not of type NP or VP,
;     followed by one of type NP, followed by 0 or more trees not of type
;     NP or VP, followed by one of type VP, followed by any number of further
;     subtrees". Note that ( ) denotes a phrase of any type, and (*) zero
;     or more phrases of any types.
; RESULT: If the match succeeds, a list of sublists is returned, where the
;     sublists correspond to successive elements of `regexp', i.e., each
;     is a list of subtrees, matching the corresponding subexpression of
;     `regexp'. In case of match failure, the result is nil.
;  
 (let (subexp1 symbol1 phrase1 result)
              
      (if (and regexp (listp regexp)) (setq subexp1 (first regexp)))
      (if (and subexp1 (listp subexp1)) (setq symbol1 (first subexp1)))
      (if (and phrases (listp phrases)) (setq phrase1 (first phrases)))
      (if (not (listp phrases))
          (format t "~%~%###WARNING: `find-parts' expects a list as its ~
           `phrases' argument,~%  and instead it got the object `~a'" phrases ))

      (cond ((null regexp) (if phrases nil T))
            ((atom regexp); unexpected condition
             (format t "~%~%###WARNING: `find-parts' expects a list as its ~
               `regexp' argument,~%  and it got the atom `~a' instead" regexp ))
            ((null subexp1); nil subexpr. matches any phrase
             (if (null phrases)
                 nil
                 (cons1 (list phrase1) ; cons1 allows for 2nd arg = t
                                               ; and gives nil for 2nd arg = nil
                        (find-parts (cdr phrases) (cdr regexp)) )))
            ; non-nil subexp1:
            ((atom subexp1); regard atomic subexpr. A as just matching
                            ; an atomic phrase A (unexpected condition)
             (if (null phrases)
                 nil
                 (if (eql subexp1 (first phrases))
                     (cons1 (list (first phrases))
                            (find-parts (cdr phrases) (cdr regexp)) )
                     nil ))) 
            ; non-atomic subexp1:
            ((eq symbol1 '-); optional constituent
             (if (setq result ; try empty match first
                       (find-parts phrases (cdr regexp)) )
                 (cons1 nil result)
                 ; empty match wasn't extendable; try actual match
                 (if (and phrases (match-phrase (cdr subexp1) phrase1))
                     (cons1 (list phrase1)
                            (find-parts (cdr phrases) (cdr regexp)) )
                     nil ))) ; fail
            ((eq symbol1 '*); 0 or more constituents
             (if (setq result ; try empty match first
                       (find-parts phrases (cdr regexp)) )
                 (cons1 nil result)
                 ; empty match wasn't extendable; try actual match
                 (if (and phrases (match-phrase (cdr subexp1) phrase1))
                     (cons-cons1 phrase1 ; insert as 1st element of 1st sublist,
                                         ; but allowing for 2nd arg = nil
                                 (find-parts (cdr phrases) regexp)  )
                     nil ))) ; fail
            ((eq symbol1 '+); 1 or more constituents
             (if (and phrases (match-phrase (cdr subexp1) phrase1))
                 (cons-cons1 phrase1 ; insert as 1st element of 1st sublist,
                                     ; but allowing for 2nd arg = nil
                             (find-parts (cdr phrases) 
                                         (cons (cons '* (cdr subexp1)) 
                                               (cdr regexp) )))
                 nil )) ; fail

            ; There's no -, *, or + in subexp1, so we want to match
            ; phrase1 (or fail)
            (T (if (and phrases (match-phrase subexp1 phrase1))
                   (cons1 (list phrase1)
                          (find-parts (cdr phrases) (cdr regexp)) )
                   nil )) ) ; fail
 )); end of find-parts
       

(defun cons1 (x yy); Apr 25/01
;~~~~~~~~~~~~~~~~~~
; If yy = T return (x); if yy = nil (or another atom) return nil;
; otherwise return (cons x yy). This is for extending a list of matched
; sequences of phrases in `find-parts', and T stands for trivial success
; (the result of matching an empty regexp to an empty list of phrases)
; and nil stands for match failure.
 (if (eq yy T) (list x) (if (atom yy) nil (cons x yy))) )


(defun cons-cons1 (x yy); Apr 25/01
;~~~~~~~~~~~~~~~~
; yy is expected to be nil or a list starting with a sublist. If yy 
; = nil return nil; otherwise insert x into the first element of yy.
; Like cons1, this is for extending a list of matched sequences of
; phrases in `find-parts', but in this case, rather than adding x as
; an initial element to yy we add it to the first sublist of yy
; (if the rest of the match succeeded, i.e., yy isn't nil),
 (if (null yy) nil (cons (cons x (first yy)) (cdr yy))) )

(defun match-phrase (features phrase); Apr 25/01; tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Check whether the given `phrase' satisfies the `features' expression,
; returning T if so and nil otherwise. For a `features' list (F1 F2 ... Fm), 
; where the Fi may be atoms or singleton lists of atoms, `phrase' satisfies
; the list if for at least one of the Fi, the 1st element of `phrase' = Fi
; where Fi is an atom, or "it isa Gi" where Fi = (Gi). For a `features' 
; list (~ R1 R2 ... Rn), `phrase' satisfies the list if it doesn't satisfy
; (R1 R2 ... Rn). For a `features' list (F1 F2 ... Fm ~ R1 R2 ... Rn), 
; `phrase' satisfies the list if for some i it satisfies (Fi) as well as
; (~ R1 R2 ... Rn). An empty `features' list is satisfied by any `phrase'.
; If features is (unexpectedly) not a list, then T is returned if `features'
; = `phrase', and nil otherwise.

 (prog (atom1 neg accepts rejects)
       (if (null features) (return T)); null features match anything
       (if (not (listp features)) 
           (if (equal features phrase) (return T) (return nil)) )
       (if (or (not (listp phrase)) (not (atom (first phrase))))
           (return (format t "~%~%###WARNING: `match-phrase' expects a ~
                     list as `phrase' argument,~%  and instead it got `~a'"
                     phrase )))
       (setq atom1 (first phrase))

       ; Split features into initial sequence preceding `~' (if any) and final
       ; sequence preceded by `~' (if any). E.g., features = ((A) ((B)) ~ (C)) 
       ; yields accepts = ((A) ((B))), rejects = ((C))
       (setq neg nil); flag `neg' indicates if `~' was encountered
       (dolist (x features)
               (if (eq x '~)  
                   (setq neg t)
                   (if neg (push x rejects) (push x accepts)) ))
       (setq accepts (reverse accepts))
       (setq rejects (reverse rejects)) 
     
       ; Look for match against `accepts' features, also checking for 
       ; non-match against all 'rejects' features, if any
       (if (null accepts) 
           (setq accepts (list atom1)) ); fake feature list guaranteed
                                        ; to match the phrase
       (dolist (f accepts)
               (setq neg t)
               (if (or (eql f atom1); is the feature matched (via `=' or `isa')?
                       (and f (listp f) (isa atom1 (car f))) )
                   (if (or (null rejects) ; for speed (redundant)
                           (dolist (r rejects); will return nil, but sets `neg'
                                   (when (or (eql r atom1)
                                             (and r (listp r) (isa atom1 (car r))) )
                                         (setq neg nil) ; forbidden feature matched
                                         (return nil) )); break out of inner loop
                           neg )
                       (return-from match-phrase T) )))
 )); end of match-phrase
                   

;; *** THE FOLLOWING CODE IS EXCERPTED FROM THE MINIPAR-BASED INTERPRETER,
;;     AND VARIOUS CHANGES MAY BE NEEDED (AND SOME FUNCTIONS AREN'T USED)

 
(defun combine-lfs (rhs-lfs matchlist semrule); Mar 27/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; THE PROGRAM IS A VARIANT OF 'combine-patterns' IN THE KNEXT PROGRAMS
; PURPOSE: To select the rhs-lfs on the list 'rhs-lfs' that are
;     indicated by the indices in 'semrule' (which requires that we first
;     partition 'rhs-lfs' to structurally match 'matchlist', after
;     which the successive partitions will correspond to indices 1, 2, ...),
;     and to combine those selected rhs-lfs according to the given 
;     LF construction rule 'semrule'. For instance, in "John's dog", 
;     "John's" is interpreted as 
;          (L p <The (L x [[x p]&[x pertain-to John]])>),
;     (suppressing colon keywords and type-extensions such as 'John.name'),
;     based on a rule for interpreting DETP (determiner phrases: genitives).
; rhs-lfs: n "right-hand-side" logical forms corresponding to the n
;     immediate constituents of some node in a phrase structure tree.
;     (Lower levels are taken care of by the recursion in the use of
;     this routine.)
; matchlist: a list of sublists, where each sublist contains a sequence of
;     subtrees that were matched to an element of a "regular expression"; e.g.,
;     (() ((NP ...)) ((RB ...) (RB ...)) ((VP ...)) ((|,| |,|) (ADVP ...)));
;     Some of these lists may be empty (because the PST may lack optional
;     constituents specified by a rule), but the sum of lengths of all the
;     sublists must be the same as the number of rhs-lfs;
; semrule: a prescription for combining the selected rhs-lfs, with the
;     rhs-lfs indicated by the indices above, e.g., (:i 2 4). The indices
;     refer to the sublists of 'matchlist'; for example, 2, 4 refer to 
;     ((NP ...)) and ((VP ...)) in the above example. The 'semrule' is
;     to be applied to the *corresponding* elements of 'rhs-lfs', which
;     in this case are its 2nd and 5th elements, since the 3rd sublist of
;     'matchlist' contains 2 elements, corresponding to the 3rd and 4th
;     elements of 'rhs-lfs'. (The example leaves out the interpretations
;     of the (RB ...) constituents, but we generally try to include all
;     constituents of expected types, as covered by the phrase patterns
;     in 'derive-phrase-lfs'.)
;     
; METHOD: Use a function 'partition-similarly' to partition 'rhs-lfs' 
;     similarly to the top-level sublist structure of 'matchlist'.
;     This gives us access to the appropriate elements of 'rhs-lfs' via
;     the indices in the semantic rule. When the elements of 'matchlist'
;     are singleton lists, the rest is straightforward -- we substitute
;     the heads of the corresponding singleton subpattern lists for the
;     indices. When there are multiple elements in a sublist, and this is
;     used as an operator in the semantic pattern, we iterate the operator
;     accordingly. If a sublist is empty for an operator, we do not apply 
;     the operator but rather return its first operand. If a sublist has
;     multiple elements and these correspond to an operand, we use just
;     the first element of the sublist as operand (** think some more
;     about this...)
 (prog (lf-lists semrule1)
       (if (or (not (listp rhs-lfs)) (not (listp matchlist))
               (member nil (mapcar #'listp matchlist))
               (/= (length rhs-lfs) (apply #'+ (mapcar #'length matchlist))) )
           (return (format t "~%~%###WARNING: 'combine-lfs' received inputs ~
                     of form ~%     rhs-lfs = ~a~%   and~%     matchlist = ~
                     ~a,~%   which cannot be properly aligned" 
                     (surface-form rhs-lfs) (surface-form matchlist) )))
       (setq lf-lists (partition-similarly rhs-lfs matchlist))
       (setq semrule1 (rename-vars semrule)); avoids variable clashes - but not 
                                            ; really necessary (so, use a stub) 
       (return (instantiate-semrule semrule1 lf-lists))
 )); end of combine-lfs



(defun rename-vars (semrule); May 18/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~
; ** I've tentatively decided renaming of variables is unnecessary --
;    lambda-conversion ensures that a variable that occurs both free
;    and bound in an expression will only have its free occurrences
;    replaced. So this is a stub.
  semrule  )


(defun surface-form (x); Apr 26/01; tested
;~~~~~~~~~~~~~~~~~~~~~~
; Return the top-level atoms or incomplete lists (with only the first list
; element, if any, in place) for input x. E.g., (surface-form '(a () (b) 
; (c d e) ((e f) g h))) = (a () (b) (c etc) ((etc) etc)). This is for
; purposes of concise diagnostics print-out.
 (if (atom x) x 
     (mapcar #'(lambda (y) 
                  (if (atom y) y (cons (if (atom (car y)) (car y) '(etc)) 
                                       (if (cdr y) '(etc) nil) )))
               x ))); end of surface-form



(defun partition-similarly (input-list partitioned-list); Apr 26/01; tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; The calling program must ensure that 'list' is a list and 'partitioned-list'
; is a list of sublists, where the length of 'list' equals the sum of sublist
; lengths of 'partitioned-list'. Under these conditions, the function returns
; a version of 'list' partitioned into sublists whose lengths match those 
; in 'partitioned-list'. E.g.,
;    (partition-similarly '(a b c d e f) '((g) () () (h i) (j k l)))
;      = ((a) () () (b c) (d e f)) 
; If the stated input constraints are no met, an error will occur.
;
 (let ((rest input-list) sublist result)
      (dolist (xx partitioned-list)
              (setq sublist nil)
              (dolist (x xx) (push (pop rest) sublist))
              (push (reverse sublist) result) )
      (reverse result) )); end of partition-similarly 
 

(defun convert (expr); May 2/01; modified Feb 16/04 (to do "deeper" conversions)
;~~~~~~~~~~~~~~~~~~~~
; If the expression consists of a lambda abstract applied to one or more 
; arguments, do the conversion. Also simplify any top-level lambda expression
; of form (:l x (:i x <pred>)) or (:l x (:p <pred> x)), where x is an atom,
; to <pred>.
;
; expr: this is a list, normally with an initial keyword :i (infixed
; sentential form), :l (lambda abstract), :p (prefix predicate expression), 
; :f (prefix functional expression), :q (unscoped quantified expression),
; or :o (unscoped coordinated expression).
 (prog (key result v body)
       (if (atom expr) (return expr))
       (setq key (first expr))

       (when (eq key :i)
           (if (or (null (cddr expr)) (atom (third expr)))
               (return expr) )  
           ; the predicate might be an :f or :p-application of a multiple
           ; lambda abstract to an argument, so we may have to lambda-convert
           ; the predicate before the embedded lambda is revealed:
           (setq body (convert (third expr)))
           (if (not (eq (first body) :l))
               (return (append (list :i (second expr) body) (cdddr expr))) )
           ; expr is an infix formula with a lambda expression as predicate
           (if (null (cdddr expr)); predicate to be applied to the subject?
               (return (convert (subst-free (second expr) (second body)
                                            (third body) ))))
           ; There's another argument after the infixed predicate
           (setq result (subst-free (fourth expr) (second body)
                                    (third body) ))
           (return 
              (convert 
                 (cons :i (cons (second expr) (cons result (cddddr expr)))) )))

       (when (eq key :l); top-level lambda: can we simplify?
           (setq v (second expr))
           (setq body (third expr))
           (if (and (listp body) (= (length body) 3))
               (if (and (eq (first body) :i) (eq (second body) v))
                   (return (third body)) 
                   (if (and (eq (first body) :p) (eq (third body) v))
                       (return (second body)) ))))
       (if (not (member key '(:p :f))) (return expr))
       (if (or (null (cdr expr)) (atom (second expr)) 
               (not (eq (first (second expr)) :l)) ) 
           (return expr) )
       ; expr is a lambda expression applied to some arguments.
       ; If there are no arguments, return the lambda expression
       ; without the embedding (;p ...) or (:f ...) wrapper
       (if (null (cddr expr)) (return (second expr)))

       ; Otherwise, apply the lambda expression to the first argument,
       ; and if there are additional arguments, cons the result into 
       ; the list of remaining arguments and apply `convert' recursively.
       ; If there are no additional arguments, just return the result of
       ; applying the lambda expression to the unique argument.
       (setq result
             (subst-free (third expr) (second (second expr)) 
                         (third (second expr)) ))
       (if (null (cdddr expr)) 
           (return (convert result))
           (return (convert (cons key (cons result (cdddr expr))))) )
 )); end of convert


(defun subst-free (val x expr); June 1/00; tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Aug 1/12: I placed a slight variant, called 'subst-for-free', in
; "scoping.lisp", to make the latter file more self-contained. But
; in addition the variant checks whether expr is of form (func x ...),
; i.e., a function w/o keyword :f, in which case x is not bound by
; func. This is a redundant check inasmuch as automatically produced
; LFs will contain keyword :f for all applications of functions to
; terms. But the 'subst-for-free' version is intended to be somewhat
; robust, and usable for testing "sloppy" handcrafted LFs.
;
; Substitute val for all free occurrences of x anywhere in expr.
; This function is one that was originally used in pref*/parser/parser.lisp,
; and then replaced by one that does an occurs-check, i.e., one that
; allows for the possibility that val may contain a free variable that
; is bound somewhere in expr. However, this does not seem necessary here.
; Parts of the result returned are kept EQL to EXPR as much as
; possible. (Thus if no substitution is made, the result is EQL
; to EXPR.)
;
   (COND ((EQL EXPR X) VAL)
       ((ATOM EXPR) EXPR)
       ; is X bound in EXPR by a quantifier or :l?
       ((AND (CDR EXPR) (CDDR EXPR) ; at least 3 elements
             (EQL (SECOND EXPR) X) ; true for lambda or quantifier binding X
             (NOT (MEMBER (CAR EXPR) '(:a :f :i :o :p :q :r))) ); Note:
              ; we phrase the check this way in case we have a scoped 
              ; quantifier, and thus no keyword
        EXPR ); if so, return EXPR unchanged
       (T (LET ((EXPR1 (MAPCAR #'(LAMBDA (Y) (SUBST-FREE VAL X Y)) EXPR)))
               ; Does EXPR1 have any new top-level elements?
               (IF (MEMBER NIL (MAPCAR #'EQL EXPR1 EXPR)) EXPR1 EXPR )))
 )); end of SUBST-FREE


(defun instantiate-semrule (semrule lf-lists); Apr 27/01; May 23/01;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~; entirely re-coded Nov 16/12
; PURPOSE: To instantiate the given semantic rule 'semrule', regarding
;     the indices 1, 2, ... occurring in it as referring to the 1st, 2nd, ...
;     element of lf-lists. When these elements are singleton lists,
;     the result is simply the semrule with the indices replaced by the
;     single members of those singleton lists, and lambda-converted if
;     appropriate. 
;
;     At the start, the given 'semrule' is adjusted so that it no
;     longer references any nil elements of 'lf-lists'. This is done by
;     first substituting *undefined* for indices that reference nil 
;     elements, and then eliminating *undefined* where appropriate. 
;     For example, 
;           (:f *undefined* arg1) becomes arg1 if arg1 is defined, 
;     while (:f *undefined* arg1 arg2 ...) remains as-is if 2 or more
;     of arg1, arg2, ... are defined. For details see 'adjust-semrule'.
;     The 'adjust-semrule' function which does this preprocessing
;     also replaces out-of-range indices i in the semrule with
;     (*out-of-range-semantic-index* i).
;
;     If for any i, the ith sublist of 'lf-lists' is of length > 1, 
;     then if the semrule specifies application of that element as 
;     a monadic functor, it is iterated, i.e., nested applications
;     are constructed with the leftmost element of the ith sublist
;     supplying the outermost functor. For any other multi-element list 
;     corresponding to an index i, we form a 'set-of' term, an unscoped
;     conjunction, or an unscoped disjunction, depending on whether 
;     the multiple elements are terms, or predicates, or one of 
;     {coordinators, quantifiers, tense} respectively. The present
;     program just sets up the initial LF with :mult elements for
;     indices corresponding to a list of LF chunks, and 'reduce-mult'
;     does the rest of the work.
; semrule: a symbolic atom, numeric atom (1, 2, ...), or a list structure
;     normally of form (:i tau1 pred tau2 ...), (:f func tau1 tau2 ...),
;     (:l var expr), (:o expr1 expr2 ...), (:p pred tau1 tau2 ...), or
;     (:q quan var expr), where the tau_i and expr_i are arbitrary 
;     semrule expressions, pred is any semrule expression not of type 
;     (:i ...) or (:q ...), func is any expression not of type (:i ...),
;     (:l ...), (:p ...) or (:q ...), and var and quan are atoms.
;     However, some new forms motivated by semantic indeterminacy have
;     more recently been added: (:a (:q det pred1) pred2), obtained
;     from NPs postmodified by a predicate (PP, R, ...); and 
;     (:r (:p pred tau)), obtained from a "role-PP" postmodifying a
;     verb -- where this may intuitively supply an argument or adjunct,
;     or possibly a predicate, as in "fall in love" (vs "fall in snow")
;     (though I'll try to use special rules for verbs like "be",
;     "fall (in love)", "pose (as)", etc. that actually require a PP).
;     Lambda variables in semrule are assumed already to have been
;     uniquely renamed, so that there will be no conflicts in deriving
;     LFs for a parse tree.
; lf-lists: a list of sublists, where each sublist is a list of logical
;     forms. There must be at least as many sublists as the largest 
;     numerical index occurring in semrule (otherwise an error message 
;     and nil is returned).
;
 (let (index result)

      (setq semrule (adjust-semrule semrule lf-lists))
                  
      ; semrule is a list structure; insert LFs or ':mult' lists of LFs
      ; for the indices, which will then be reduced (and lambda-reduction
      ; will be tried before returning the result)
      (setq result semrule)
      (setq index 0)
      (dolist (lf-list lf-lists)        
         (incf index); the lf-lists elements correspond to indices 1, 2, ...
         (if (null (cdr lf-list)); singleton?
             (setq result (subst (car lf-list) index result))
             (setq result (subst (cons :mult lf-list) index result))))
      
      ; Now reduce ':mult' occurrences as much as possible
      (setq result (reduce-mult result))

      ; return result (with lambda-conversion if applicable)
      (if (occurs-in :l result)
          (convert result)
          result)
 )); end of instantiate-semrule


(defun reduce-mult (mult-ulf); Nov 16/12
;~~~~~~~~~~~~~~~~~~~~~~~~~~~
; mult-ulf: an unscoped LF (or recursively accessed part thereof) 
; possibly containing an occurrence of ':mult' somewhere.
;
; We reduce (:mult ...) constituents occurring in 'mult-ulf' as much as
; possible. These constituents correspond to semantic indices in the
; semantic rule for a phrase that were matched against multiple
; constituents (because of the regex-like form of phrase structure 
; rules).
;
; METHOD: We recursively unpack mult-ulf, where the cases to be dealt
; with are the following (where we reduce some :mult's at lower 
; levels, and others higher-up, in the context of other constructs); 
; [Nov 8/15: Having added treatment of (:r (:mult ...)), in whatever
; context it occurs, I'm not sure what other hight-context cases remain.]
; Primes indicate that 'reduce-mult' has been recursively applied:
;
;   (:f (:mult f1 f2 ... fk) arg ...): 
;       (:f f1' (:f f2' ... (:f fk' arg' ...) ...))
;
;   (<atom> ... (:r (:mult p1 p2 ... pk) ...):          [added Nov 8/15]
;       (<atom> ... (:r p1') (:r p2') ... (:r pk') ...)
;
;   (:mult term1 term2 ...):          {assume collective reading}
;       (:f set-of term1' term2' ...) {NB: we'll have to deal with resulting
;                                     constructs of type (:a (set-of ...) pred)}
;   (:mult pred1 pred2 ...):
;       (:o and pred1' pred2' ...)
;   (:mult coord1 coord2 ...):
;       (:o or coord1' coord2' ...)
;   (:mult quan1 quan2 ...):
;       (:o or quan1' quan2' ...)
;   (:mult tense1 tense2 ...)
;       (:o or tense1' tense2' ...)
;
;   Note that with the preceding reductions, there will be no unexpected
;   multiple terms, predicates, coordinators, quantifiers or tenses as 
;   immediate constituents of any other constructs. The only context-
;   dependent reductions remaining are then ones embedded by :f or :r,
;   which we deal with first. [The :r case was added Nov 8/15]
;
  (let ( ); we will use mult-ulf itself as a local variable
       (cond ((atom mult-ulf) mult-ulf)
             ((not (occurs-in :mult mult-ulf)) mult-ulf)

             ; Check immediately for the multi-function case as indicated
             ; by the (:f (:mult ...) ...) structure, because we don't
             ; want to accidentally form a set or conjunction from the 
             ; elements embedded in (:multi ...), as a result of failure
             ; of those elements to be recognized as functions; e.g.,
             ; this can happen with adjectival premodification of nouns,
             ; where we may well leave the adjectives *as* adjectives
             ; (thus, as predicates, in the case of predicative adjectives)
             ((and (eq (car mult-ulf) :f)
                   (listp (second mult-ulf))
                   (eq (car (second mult-ulf)) :mult))
              ; Recursively process the functions and argument(s), and
              ; then iterate the functions:
              (setq mult-ulf
                (cons :f 
                  (cons (cons :mult 
                          (mapcar #'reduce-mult (cdr (second mult-ulf))))
                        (mapcar #'reduce-mult (cddr mult-ulf)))))
              ; return the result of iterating the functions:
              (iterate-funcs mult-ulf))
             
             ; [Added Nov 8/15: Check whether we have a mult-ulf of form 
             ; (:r (:mult P1 P2 ...)) AS A LIST ELEMENT, in which case we 
             ; want to expand it into SUCCESSIVE elements of the list,
             ;      (:r P1') (:r P2') ... 
             ; rather than an unscoped conjunction in an (:r ...) context
             ; (as is done by default for multiple preds -- see below).
             ; We do that expansion first, and then apply 'reduce-mult'
             ; recursively to the elements of the entire list
             ((member-if 
               #'(lambda (x) (and (listp x) (eq (car x) :r) 
                                  (listp (second x)) (eq (car (second x)) :mult)))
                 mult-ulf)
              (setq mult-ulf (iterate-roles mult-ulf))
              (mapcar #'reduce-mult mult-ulf))

             ; Now deal with multiple predicates, coordinators, quantifiers,
             ; or tenses (after recursively applying 'reduce-mult'):
             ((setq mult-ulf (mapcar #'reduce-mult mult-ulf))
              (cond ((eq (car mult-ulf) :mult)
                     (cond ((term? (second mult-ulf))
                            (cons :f (cons 'set-of (cdr mult-ulf))))
                           ((predk? (second mult-ulf))
                            (cons :o (cons 'and (cdr mult-ulf))))
                           ((or (coord? (second mult-ulf))
                                (intersection '(pres past) (cdr mult-ulf))
                                (quan? (second mult-ulf)))
                            (cons :o (cons 'or (cdr mult-ulf))))
                           (t mult-ulf) )); may be reduced at higher level
                     (t ; not a (:mult ...) construct
                        mult-ulf))); (was already recursively processed)
             ); no further cases are possible
 )); end of reduce-mult
                 

(defun adjust-semrule (semrule lf-lists); Oct 28/03
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; PURPOSE: To adjust the input semantic rule so that it no longer references
;   any NIL elements in lf-lists. Roughly speaking, NIL monadic functions
;   are treated as identity functions; NIL :r-modifiers or :a-modifiers as
;   well as NIL conjuncts are eliminated by "collapsing" the part of the
;   semrule containing them; and NIL arguments of predicates and NIL k-adic
;   functors (with k>1) are replaced by *undefined*. By default these are 
;   presumed to represent semantically obligatory arguments or functors that 
;   are syntactically optional and were omitted in the input text, as in
;   "John wrote --" (omitted object), or in "John, Mary, Bill left" (omitted
;   coordinator). They need to be reconstructed in postprocessing. 
;
;   However, certain predicates ('distinct.a', 'partitioned-into.a', 
;   and perhaps others) and functions ('set-of', 'logical-fragments.f' -- 
;   not a true function, as its "arguments" could be of any type, and 
;   perhaps others) are assumed to allow any number of arguments > 1, so 
;   *undefined* elements are eliminated. Note that for a single argument, 
;   'distinct.a' is logically true, and [<kind> partitioned-into *undefined*] 
;   and [*undefined* partitioned-into <term>] are undefined, and [<kind> 
;   partitioned-into <kind>] amounts to identity, but we don't simplify 
;   these special cases directly in the LF computation (they need to be 
;   dealt with by LF postprocessing).
;
; semrule: a semantic rule of the type used in derive-phrase-lf, e.g.,
;   (:f 2 (:l y (:q (:l x (:i x member-of y))))
;           (:f 3 (:l x (:i (:i x (:f 4 (:f (:f nnp 5) (:f (:f nn 6) 7) ))) AND
;                           (:i x 8) ))))
;   (This is the rule for common noun phrases, allowing various modifiers)
; lf-lists: a list of form (lfs1 lfs2 ... lfsk), where lfsi is a list of
;   0 or more logical forms. The indices 1, ..., k correspond to the numeric
;   constituents of the semrule, and we wish to eliminate those indices i
;   from semrule for which lfsi = NIL.
;
; METHOD: We proceed bottom-up recursively, avoiding structure duplication
;   where possible; i.e., if mapping 'adjust-semrule' onto the semrule
;   yields a list whose elements are EQL to corresponding elements of 
;   semrule, and no changes need to be made at the current level, then
;   semrule itself is returned. The changes at the current level are those
;   mentioned under 'PURPOSE'. We introduce *undefined* elements corresponding
;   to NIL LF pieces at the lower levels, but then eliminate these as far as
;   possible as we work our way upward.
;
  (prog (key result changed)
        ; Return *undefined* for indices to null constituent LFs,
        ; and (*out-of-range-semantic-index* i) for indices that don't
        ; correspond to any constituent
        (if (atom semrule) 
            (if (integerp semrule) 
                ; is the index in the range determined by |lf-lists|?
                (if (and (> semrule 0) (<= semrule (length lf-lists)))
                    (if (null (nth (- semrule 1) lf-lists))
                        (return '*undefined*)
                        (return semrule))
                    ; the integer is out of range; perhaps it is a faulty
                    ; index or it was intended as a number (though semrules
                    ; should *not* be written that way!)
                    (return `(*out-of-range-semantic-index* ,semrule)) )
                ; semrule is a non-integer atom)
                (return semrule))
           ); not an atom -- proceed to next block

        ; The following recursion collapses constituents where possible;
        ; so then it will remain only to collapse the top level:
        (setq result (mapcar #'(lambda (x) (adjust-semrule x lf-lists))
                               semrule ))
        ; Now collapse semrule as much as possible if *undefined*'s are present;
        ; but avoid discarding any defined constituents
        (setq key (car semrule))
        (when (member key '(:f :p :i :o :a :r :s)); :r, :s may or may not be used...
              (case key
                    ((:r :s) ; When semrule is of form (:r *undefined) or
                        ; (:s *undefined), change it to *undefined*:
                        (when (eq (second result) '*undefined*)
                              (setq changed t)
                              (setq result '*undefined*) ))
                    (:f ; When semrule is of form (:f *undefined* expr),
                        ; replace semrule by expr; when semrule is of form 
                        ; (:f *undefined* ...) where '...' includes 2 or more
                        ; defined arguments, replace semrule by (:f *undefined* ..)
                        ; where '..' excludes any *undefined* arguments of '...'.
                        ; when semrule is of form (:f expr *undefined* ... 
                        ; *undefined*) (all arguments undefined), replace it 
                        ; by *undefined*; otherwise delete all occurrences of
                        ; *undefined*:
                        (cond ((and (eq (second result) '*undefined*) 
                                    (= (length result) 3) )
                               (setq changed t)
                               (setq result (third result)) )
                              ((and (eq (second result) '*undefined*)
                                    (member '*undefined* (cddr result))
                                    (> (length (remove '*undefined* (cddr result)))
                                       1))
                               (setq changed t)
                               (setq result (append '(:f *undefined*) 
                                              (remove '*undefined* (cddr result)))))
                              ((null (remove '*undefined* (cddr result)))
                               (setq changed t)
                               (setq result '*undefined*) )
                              ((member '*undefined* (cddr result))
                               (setq changed t)
                               (setq result (remove '*undefined* result)) )))
                              ; otherwise no change
                    (:p ; When semrule is of form (:p pred ...), drop *undefined* args;
                        ; if this leaves semrule as (:p <pred or *undefined*>), change 
                        ; it to pred or *undefined*, as appropriate; otherwise, no 
                        ; further change (so we leave an undefined pred as such, if 
                        ; it has defined arguments):
                        (when (member '*undefined* (cddr result))
                              (setq changed t)
                              (setq result 
                                (cons :p (cons (second result)
                                           (remove '*undefined* (cddr result)) ))))
                        (if (= (length result) 2) 
                            (setq result (second result)) ))
                    (:i ; When semrule is of form  (:i expr <conj> expr1 ...)
                        ; and contains an *undefined* element, temporarily
                        ; reconfigure it to (<conj> expr expr1 ...), and delete
                        ; all occurrences of *undefined* from this; if this 
                        ; leaves only the first element, return *undefined*;
                        ; if it leaves 2 elements, return the 2nd; if it leaves
                        ; (<conj> expi expj ...), return (:i expi <conj> expj ...).
                        ;
                        (cond ((and (coord? (third result)) 
                                    (member '*undefined* (cdr result)) )
                               (setq changed t)
                               (setq result (cons (third result) 
                                                  (cons (second result) 
                                                        (cdddr result) )))
                               (setq result (remove '*undefined* result))
                               (if (null (cdr result)); just (<conj>)
                                   (setq result '*undefined*)
                                   (if (null (cddr result)); (<conj> exp)
                                       (setq result (second result))
                                       (setq result ; (<conj> expi expj ...)
                                             (cons :i 
                                               (cons (second result)
                                                 (cons (car result) 
                                                       (cddr result))))) )))
                              ; If semrule is of form (:i expr pred ...), delete
                              ; all *undefined* arguments (if any) coming after the
                              ; predicate. If in the result just :i and one other
                              ; expression is defined, change semrule to *undefined*;
                              ; [CHANGED FROM EARLIER VERSION, which could leave an 
                              ; undefined 1st argument or an undefined predicate,
                              ; and nothing else;; but this led to things like 
                              ; (:i x *undefined*). With the revised version, we're
                              ; still allowing something like (:i x *undefined* y),
                              ; and maybe that's still too permissive ...]:
                              ;
                              ((member '*undefined* (cddr result))
                               (setq changed t)
                               (setq result
                                 (append `(:i ,(second result) ,(third result))
                                   (remove '*undefined* (cdddr result)) ))
                               (if (< (length (remove '*undefined* (cdr result))) 2)
                                   (setq result '*undefined*)))))

                    (:o ; When semrule is of form (:o expr expr1 ... exprk)
                        ; where one of the expri is *undefined* ...), delete all
                        ; *undefined* expri; if this leaves only two elements,
                        ; return *undefined*; if it leaves 3 elements, return
                        ; the third (even if expr is *undefined*); otherwise,
                        ; no (further) change;
                        (cond ((member '*undefined* (cddr result))
                               (setq changed t)
                               (setq result
                                 (cons (car result)
                                       (cons (second result) 
                                             (remove '*undefined* 
                                                      (cddr result) ))))
                               ; only (:o expr) left over?
                               (if (null (cddr result))
                                   (setq result '*undefined*)
                                   ; only (:o expr expr1) left over?
                                   (if (null (cdddr result))
                                       (setq result (third result)) )))))
                    (:a ; When semrule is of form (:a expr *undefined*),
                        ; simplify to just expr
                        (when (eq (third result) '*undefined*)
                              (setq changed t)
                              (setq result (second result)) ))))

        (if (not changed); avoid structure duplication if possible
            ; are semrule & result element-by-element eql (same pointers)?
            (if (not (member nil (mapcar #'eql semrule result)))
                (return semrule)
                (return result) )
            (return result) )
 )); end of adjust-semrule


(defun find-car (atm expr); Oct 28/03
;~~~~~~~~~~~~~~~~~~~~~~~~
; Find the leftmost element of expr (if any) that is a list with car = atm
;
  (cond ((atom expr) nil)
        (T (find-if #'(lambda (x) (and (listp x) (eq (car x) atm))) expr)) ))


(defun undefined (x); May 24/01
;~~~~~~~~~~~~~~~~~~~
; Return T if x is, or contains at any level, the atom *undefined*
;
 (cond ((eq x '*undefined*) T)
       ((atom x) nil)
       (T (or (undefined (car x)) (undefined (cdr x)))) ))


(defun alternative-arglists (arglists); May 24/01; tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; E.g., (alternative-arglists '((a) (b c) (d e ) (f))) = ((a b d f) (a c d f)).
; Note that we iterate only over elements of the *first* sublist with multiple
; elements, while taking just the first element of each remaining sublist.
; The situation where more than one of the sublists has multiple elements
; is not expected (and for the purposes of `instantiate-semrule' really makes
; no sense).
;
 (prog ((only-singletons-so-far T) prefix (rest arglists) results)
       (dolist (arglist arglists)
          (pop rest)
          (cond ((and only-singletons-so-far arglist (cdr arglist))
                 (setq only-singletons-so-far nil)
                 (setq prefix (reverse prefix))
                 (setq rest
                       (mapcar #'(lambda (x) (if x (car x) '*undefined*))
                                 rest ))
                 (dolist (arg arglist)
                    (push (append prefix (cons arg rest)) results) )
                 (return-from alternative-arglists (reverse results)) )
                (T; no multi-element arglist has been reached yet
                 (push (if arglist (car arglist) '*undefined*) prefix) 
                 (if (null rest) 
                     (return-from alternative-arglists 
                        (list (reverse prefix) ))) )))
 )); end of alternative-arglists


;; REPLACE BY VERSION THAT FOLLOWS THIS...
(defun iterate-funcs (key funcs arg); May 24/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; For funcs = (f1 ... fn), form (key f1 (key f2 ( ...(key fn-1 (key fn arg))...)))
;
 (reduce #'(lambda (x y) (list key y x)) (cons arg (reverse funcs))) )

(defun iterate-funcs (multi-func-expr); Nov 16/12; tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; For multi-func-expr = (:f (:mult f1 ... fn) arg ...), form 
;   (:f f1 (:f f2 ... (:f fn arg ...) ...)).
  (if (or (atom multi-func-expr) ; check for inappropriate input
          (not (eq (car multi-func-expr) :f))
          (atom (second multi-func-expr))
          (not (eq (car (second multi-func-expr)) :mult)))
      ; return inappropriate input unaltered:
      multi-func-expr
      ; otherwise build the innermost (rightmost) function application, 
      ; and then iterate the remaining functions via 'reduce':
      (reduce #'(lambda (x y) (list :f y x)) 
                ; As argument of the 'reduce' operation, cons the 
                ; rightmost function application into the reversed
                ; list of remaining functions
                (cons (append `(:f ,(car (last (second multi-func-expr))))
                               (cddr multi-func-expr))
                      (reverse (cdr (butlast (second multi-func-expr))))))
 )); end of iterate-funcs


(defun iterate-roles (ulf)
;~~~~~~~~~~~~~~~~~~~~~~~~~
; The unscoped LF (or subexpression of an unscoped LF) contains at least 
; one element of form (:r (:mult p1 p2 ...)) (typically, these are
; LFs of multiple PPs in a VP). Replace any and all such elements by
; a SEQUENCE (:r p1) (:r p2) ... in 'ulf'.
;
  (let (result)
       (dolist (expr ulf)
          (if (and (listp expr) (eq (car expr) :r)
                   (listp (second expr)) (eq (car (second expr)) :mult))
              (dolist (p (cdr (second expr)))
                 (push (list :r p) result))
              (push expr result)))
      (reverse result)
 )); end of iterate-roles


(defun subcdr (lists index); Apr 28/01; tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~
; `lists' is a list of lists, and the result is `lists' except that
; the sublist indexed by `index' is replaced by its cdr
;
 (when (not (integerp index))
       (format t "~%~%###WARNING: `subcdr' wants an integer as its `index' ~
          argument, ~%   and it got `~a'" index )
       (return-from subcdr lists) )
 (when (not (listp lists))
       (format t "~%~%###WARNING: `subcdr' wants a list of lists as its `lists' ~
          argument, ~%   and it got `~a'" lists )
       (return-from subcdr lists) )
 (let (result (i 1))
      (dolist (sublist lists)
              (if (= i index) 
                  (if (not (listp sublist))
                      (progn (format t "~%~%###WARNING: `subcdr' wants a list ~
                               of lists as its `lists' argument, ~%   and it ~
                               got `~a' as its ~ath sublist" sublist i )
                             (push sublist result) )
                      (push (cdr sublist) result) )
                  (push sublist result) )
              (incf i) )
      (reverse result) )); end of subcdr
          
