; Second attempt, abandoning the version in "phrase-tree-to-ulf.lisp" that
; was an attempt to modify the word-level ELF code. Apr 19/20

(defun pos+word-to-raw-ulf (pos+word); NB: increments *word-index*
;````````````````````````````````````
; e.g., (VBD sent) --> (past send.7.v~4); originally, I was going to have
;       ULF alternatives for 'sent' attached to send.7.v, viz., (send.7.v 
;       (pasv send.7.v) sent.7.a); {send.7.v would be used for "has sent":
;       ((past perf) send.7.v); sent.7.a would be used for "sent [mail]"; 
;       or maybe we should directly add  mod-n, i.e., (mod-n sent.7.a),}.
;       But I no longer think it's worthwhile to add all the error-correction
;       possibilities.
; e.g., (AUXD were) --> (past be.5.aux~5) {assuming *word-index* was 4}
;       this may become (past be.5.aux-v), (past be.5.aux-s), (past prog),
;       or (cf be.5.aux-s) in contextual postprocessing (e.g., if its operand
;       is (pasv <word>.v)), or even (past be.5.v), (cf be.5.v) depending
;       on semantic type coherence processing (e.g., if its operand is a
;       predicate), as in "if I were rich") ** more thought needed abt this...
; For additional examples see 'simple-tree-to-ulf".
;
; Derive a logical form for the given part of speech + word; (the code
; for elf-from-sentences allowed multiword entries, presumably not needed
; here (** but perhaps retained for generality)
;
; pos+word: usually a list of two symbols, (pos word);(however, numbers 
;   and strings are allowed for word); ** if we deal with lexical stems
;   consisting of multiple words, we'll convert them to upper case atoms
;   with parts connected by underscores;
;
; pos: CC  CD  DT  EX  FW   IN  JJ JJR JJS LS    NN  NNS NNP  NNPS 
;                                             ^^ NO 'MD' -- WANT 'AUX...' instead
;   PDT  POS PRP PRP$ RB  RBR RBS RP PRT SYM TO UH  VB  VBD VBG VBN VBEN VBP
;                                 ^^^^^^ both "particle"??
;   VBZ VB-CF WDT WP WP$ WRB WDT-REL WP-REL WP$-REL WRB-REL AUX AUXD AUXG AUXEN
;       ^^^^^ subjunctive (counterfactual) -- new! "Were he alive today ..."
;   AUXP AUXZ AUX-CF \. \: \, \"  \` \' |``| |''| -LRB- -RRB- -LSB- -RSB- 
;             ^^^^^^ subjunctive (counterfactual) -- new! "had not Al intervened"
;                                                         "if only he had helped"
;   -LCB- -RCB-
;
; VBEN & AUX-variants created by preprocessing. In the ELF version we also had 
; WDT-REL WP-REL WP$-REL WRB-REL BE BED BEG BEEN BEP BEZ, and it seems at least
; the -REL variants will be needed here.

 (prog (pos word stem stem-str symbol-stem log-atom type-tag log-atom-str 
        op result)

       (if (find (car pos+word) '(\. \, \; ! ? \: \` \' |``| |''| - --))
           (return (second pos+word))); use punct'n itself as ULF, w/o index
       (incf *word-index*)
       (setq pos (car pos+word))
       (setq word (second pos+word)); **In future, there may be further words
       (setq stem (stem pos+word))  ; usually a symbol, but possibly a number
                                    ; (or perhaps even a string);
       (if (eq pos '-NONE-)
           ; Note: Preprocessing creates some -NONE- items that supply tacit
           ; operators (like 'sub' or 'k') as the word, e.g., (-NONE- k)
           (return 
             (if (eq word t) '*h ; Treebank uses (-NONE- t) for "trace"
                 (case word (* 'Ka) (0 'tht) (t word)))))
                                             ;`````` a special added symbol (eg k)
  ;; TBC: want stem-str "perf" (with no word index??) for auxil. "have"
  ;;  We also need preprocessing for auxiliary "be" (prog w/ VP-scope or pasv
  ;;  with V-scope; maybe I should leave perf-have as "have"; and progressive
  ;;  tenseless "be" be.aux-s, and passive tenseless "be" be.aux-v = identity
  ;;  operator. See "test...pos+word-to-ulf.lisp" for some desired rsults.
  ;;  Currently e.g., "running" gives (prog run.i.v), but then prog fails to get
  ;;  VP scope, and it's not a scopable operator -- or do we treat it as aux-s,
  ;;  as just suggested?
       (setq stem-str 
             (if (numberp stem) 
                 (format nil "~s" stem) 
                 (case stem (\' "foot2") (|''| "inch") (t (string stem)))))
       ; Previously this used  (stringify stem "_", but this changes constants
       ; like | Mr. Smith| to "_Mr._Smith"

       (setq symbol-stem (intern stem-str))
       (if (not (equal symbol-stem stem)) (setq stem symbol-stem))

       ; Compute an initial type tag from the POS tag; initial type tags may
       ; later be modified in ULF refinement, e.g., aux to aux-s or aux-v, 
       ; adv to adv-s, adv-e, adv-f, adv-v, mod-a, or mod-n; p to p-arg, ps,
       ; or pq, d to a (e.g., for "many"), etc.
       (setq type-tag
          (case pos
             (CC (if (member word '(and or)) nil 'cc))
             ((VB VBD VBG VBN VBEN VBP VBZ VB-CF) 'v)
             (MOD 'aux); **UNEXPECTED, BUT APPEARS IN SOME VERSIONS
             (AUX (if (eq word 'to) nil 'aux)); no type suffix on inf. "to"
             ((AUXZ AUXP AUXD AUXF AUXG AUXEN AUX-CF) 'aux); postprocessing
                                      ; should change this to 'aux-v'|'aux-s'
              ; NB: AUXN (passive participle of an auxiliary) doesn't exist
             (TO 'p); after casting (AUX (TO to)) as (AUX to), (TO to) is (IN to)
             ((NN NNS) 'n)
             ((NNP NNPS) nil) ; we use pipes | Xyz| instead of a suffix for names
             ((JJ JJR JJS) 'a)
             (IN 'p); may become 'ps'
             (PS 'ps); some preprocessing rules (for "with[out]") change IN to PS 
             ((DT CD) 'd); may be changed to 'a'
             (EX 'pro); existential "there" -- we treat it as a pronoun
             (FW 'fw) ; temporary -- to be replaced by quotes or perhaps a type
          ;  (LS '??) ; don't know what to do about that yet; conjunction or
                      ; ordered collection? Use 'list' for the latter?
             (PDT 'd) ; might be re-formulated, e.g., "half"-> "one half of" [a pie]
             (POS nil); temporary -- possessive 's is left as such (later rephrased 
                      ; in terms of "the N poss-by ...")
             ((PRP PRP$) 'pro)
             ((RB RBR RBS) 'adv); should become 'adv-a', 'adv-s', 'adv-e',
                                ; 'mod-a', 'mod-n'
             ((PRT RP) 'prt); same, i.e., particle?? To be attached to verb
             (SYM 'c); to be modified to pipes, perhaps
             (UH 'x) ; However, filler sounds like "er" are deleted from ULF,
                     ; and evaluative interjections like "ok" or "fine!", get
                     ; a (pu ...) phrasal utterance wrapper, and "yes", "no",
                     ; "uh-huh" get a yn suffix; this is left to postprocessing
             (WDT 'd); e.g., "which dog", but solo occurrences are ones like "which
                     ; means that ..., i.e., suffix should be 'pro'; also some
                     ; cases of WDT are rel-pronouns -- see WDT-REL below
             (WP$ 'd); e.g., "whose dog is this"; expands to a 'poss-by' form;
                     ; more often used as WP$-REL -- see below;
             (WP 'pro); e.g., "who is this"; however, more often it indicates a 
                      ; relative pronoun, in which case  the suffix becomes 'rel'
             (WRB 'adv); e.g., "where is it"; should this perhaps be 'pq', or be
                       ; written as (at.p (what.d place.n))? rarely this is 
                       ; a relative adv, as in "the street where she lives", &
                       ; in that case it is expanded, e.g., (at-loc.p which.rel);
                       ; also 'adv' should ; become adv-e or adv-s ("why": adv-s;
                       ; "where": adv-e)
             ; ** I'm not sure if preprocessing will produce these; maybe WDT *not*
             ;    changed by preprocessing will always be a relative pronoun,
             ;    while as a determiner, (WDT <word>) will have become (DT <word>)
             ;    similarly for the other '...-REL' POS's.
             (WDT-REL 'rel); e.g., "that/which [he saw]"
             (WP-REL 'rel); e.g., "[men] who [smoke]"; "which" is less common; "what"
                          ; is rare, ungramm'l; e.g., "everything what he said"
             (WP$-REL 'd); e.g., "Whose [dog is this?]"
                         ; e.g., "[the dog] whose [owner left it at the kennel];
                         ; must be classified in pre- or postprocessing as (non) 
                         ; relative determiner; as nonrelative, it expands to
                         ; (the.d ((poss-by who.pro) ...)); if referring to a 
                         ; thing, (the.d ((poss-by which.pro) ...)); as relative,
                         ; we use 'who.rel' or 'which.rel' instead of 'who.pro'
                         ; or 'which.pro'.
             (WRB-REL 'adv-rel); "[a time] when [kings ruled]"; needs to be post-
                               ; processed into (sub (at.p which.rel) ... *h...)
             (T nil); this will apply to punctuation and brackets, which means
                    ; they are retained without suffixes -- but will be post-
                    ; processed, e.g., I'd like to treat brackets as prefix
                    ; operators, e.g., (....) --> (() ....), {...} --> ({}...)
                    ; It will also apply to (-NONE- ka) and (-NONE- *h), where
                    ; we assume these have been derived respectively from
                    ; (NP (-NONE- *)) preceding an -ing participle or (NP (-NONE-
                    ; T)) *not* in sentential subject position
            )); end case and setq

       (setq op ; operator to be wrapped around the atomic ULF
          (case pos
             ((VBD AUXD) 'past) ((VBP AUXP VBZ AUXZ) 'pres) ((VB-CF AUX-CF) 'cf)
             ;           ^^^^^ could become 'cf' 
             (AUXF 'fin) ; 'fin' could be {pres | past | cf}
             ((VBG AUXG) 'prog)  ((VBEN AUXEN) 'perf) (VBN 'pasv)
                               ; I decided that the aspectual/pasv operators should
                               ; uniformly derive from the participle, not from
                               ; aux. "be" or "have" preceding them. Those are
                               ; "disambiguating features", but just carry tense,
                               ; if any, while the aux. verb itself is the
                               ; identity operator; this makes aux.-free instances,
                               ; as in "dancing robot", "Having left,...",
                               ; "Given these facts, ..." uniformly treatable.
             ((NNS NNPS) 'plur); however, is e.g., the following what we want?
                               ; ((mod-n |Rocky|.a) (plur |Mountain|))
             (T nil)
            )); end case and setq

;      (format t "~%For ~s, type-tag = ~s, op = ~s" pos+word type-tag op); DEBUG

       (setq log-atom-str
             (if type-tag
               (concatenate 'string stem-str "." (string type-tag) 
                                             "~" (format nil "~a" *word-index*))
               (concatenate 'string stem-str "~" (format nil "~a" *word-index*))))
       (setq result (intern log-atom-str))
       (if op (setq result (list op result)))
       (return result)
 )); end of pos+word-to-raw-ulf


(defun stringify (atm connecting-string); Apr 26/20
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Change the given atom to a case-preserving string, filling in blanks with 
; the specified connecting string (e.g., "-", "_", but it could be longer);
; e.g., for atm = |Twin Peaks| we get "Twin_Peaks".
;
  (let ((chars (coerce (format nil "~a" atm) 'list))
        (chs (coerce connecting-string 'list))
        result )
       (dolist (ch chars)
               (if (not (char-equal ch #\Space))
                   (push ch result)
                   (dolist (c chs) (push c result)) ))
       (coerce (reverse result) 'string)
 )); end of stringify


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


