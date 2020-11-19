;; VARIOUS INITIALIZATIONS, & TREEBANK-TREE PREPROCESSING; started Apr 16/10
;;
;; PREPROCESSING IS BEING RECODED IN "preprocess-tree-via-ttt.lisp".
;; ===================================================================
;; [Apr 15/10 -- not sure what I've taken so far from Knext
;;   extractor (version for public access), & Minipar interpreter.]

;; NOTE THAT SOME FUNCTIONS WITH OLD DATES ON THEM MAY NEED TO BE EXCISED
;; OR ALTERED.

;; THIS FILE CONTAINS REVISIONS *NOT NECESSARILY* PRESENT IN 
;; ~schubert/lf*/initialize-and-preprocess
;; SEE ESPECIALLY OCCURRENCES OF SINV (HEREIN) VS S-INV, 
;; THE NAME 'isa-vp-pastprt-or-progprt' (HEREIN) VS 
;; 'isa-vp-passprt-or-pasvprt', NOMINALS OF VARIOUS TYPES (NP-),
;; AND SBAR TREATMENT

;; For explanation of the "colon keywords" :a, :f, :i, :l, :o, :p, :q,
;; in logical forms output by form-pattern, see 'logical-form-syntax'
;; file in this directory.

;[****everything that follows, till the 'preprocess-tree function, has been
;copied over as-is from ~schubert/kn*mi*/my*/V*/extract-patterns.lisp. The
;idea is to delete/add/adapt as needed here.]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                           ;;
;; SOME INITIALIZATIONS AND BASIC UTILITIES: ;;
;;                                           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Flag Treebank parts of speech with their generalizations;
;; NB: VBEN is an added category, meaning *non-passive* past participle
;;     After preprocessing, all remaining VBNs are treated as passives
;; Comments: CD = count determiner; EX = existential there; FW = foreign word;
;;     LS = list item marker (e.g., \1); PDT = predeterminer; POS = \'s;
;;     PRP = personal pronoun; PRP$ = possessive personal pronoun; RB = adverb;
;;     RP = particle (generally embedded in (PRT ...), though not when pre-
;;     modifying a PP); SYM = symbol (math or scientific); RBR = comparative 
;;     adverb; RBS = superlative adverb; TO = infinitive or preposition "to";
;;     UH = interjection (generally embedded in (INTJ ...)); VBP = non-3s, 
;;     present verb; WDT = wh-determiner; WP = wh-pronoun; WP$ = possessive 
;;     wh-pronoun; WRB = wh-adverb; 
;; Punctuation: e.g., (\, \,), (\: \:), (|(| |(|), (|)| |)|), (-LRB- -LRB-),
;;     (-RRB- -RRB-), etc.; these symbols are accepted as parts of speech by
;;     default, without being listed as such. (This is ok inasmuch as punctuation
;;     plays a role only in preprocessing and as "other (nonspecific) categories"
;;     in the syntax-semantics mapping.)
(mapcar #'(lambda (x y) (setf (get x 'isa) y))
'(CC  CD  DT  EX  FW   IN  JJ JJR JJS LS  MD  NN  NNS NNP  NNPS PDT  POS PRP PRP$
      RB  RBR RBS RP   SYM TO UH  VB  VBD VBG VBN VBEN VBP VBZ  WDT  WP   WP$ WRB)
'(CC  DET DET PRO FW   P   A  A   A   LS  AUX N   N   NAME NAME PDET POS PRO DET
      ADV ADV ADV PART SYM TO IJ  V   V   V   V   V    V   V    DET  PRO  DET ADV) )

(mapcar #'(lambda (x y) (setf (get x 'isa) y))
'(WP-REL WDT-REL WP$-REL WRB-REL)
'(PRO-REL DET-REL DET-REL ADV-REL) )

;; It's useful to have 'PUNC' as an abstraction, to simplify phrse matching:
(mapcar #'(lambda (x) (setf (get x 'isa) 'PUNC)) ; Nov 5/10
   '(\. \, \: ) ); *** Check to see what else should go here.
                      ; Note: '!' and '?' have POS \., ';' and '--' have POS \:,
                      ; '/' and '//' may be parsed as NNP, NNS, RB, and maybe 
                      ; others.
 
;; It may also be useful to have a notion of "left delimiter", "right delimiter",
;; and these together with punctuation are "delimiters":
(mapcar #'(lambda (x) (setf (get x 'isa) 'LDELIM)); Feb 5/14
   '(-LRB- -LSB- |``|)) ; Note that both a left single quote (`) and double
                        ;   quote (``) have POS |``|; a single apostrophe
                        ;   at the beginning of a word is parsed as possessive,
                        ;   i.e. (POS |'|). **In some contexts, a left square
                        ;   bracket (-LSB-) is parsed as (JJ -LSB-IN) -- this
                        ;   could cause problems, and might have to be changed
                        ;   in preprocessing to (-LSB- -LSB-).
(mapcar #'(lambda (x) (setf (get x 'isa) 'RDELIM))
   '(-RRB- -RSB- |''|)) ; Note that both a right single quote (') and double
                        ;   quote ('') have POS |''|; **In some contexts,
                        ;   a right square bracked (-RSB-)  is parsed as
                        ;   (JJ -RSB-) -- this might have to be changed in
                        ;   in preprocessing to (-RSB- -RSB-).
(mapcar #'(lambda (x) (setf (get x 'isa) 'DELIM))
   '(LDELIM RDELIM PUNC))


;; Aug 12/10: *** What about "PS" which I assume is the generalized POS of
;; sentential "prepositions" like "while", "because" (and presumably "as if"?!)

;; CD is here generalized to DET; when it occurs non-initially, and not after
;; a predeterminer, in an NP or a QP (quantifying phrase), it functions as an
;; adjective; therefore CD is changed to JJ in preprocessing in those cases.

;; The WSJ corpus also contains POS's like |,|, \., $, -NONE-, etc., and these
;; are mapped to themselves by `generalize-pos'.

;; Root categories considered in `form-pattern' are:  S, NP, VP, PP, ADVP, ADJP, 
;; SBAR, WHNP, WHPP, WHADVP, SINV, PRN, PRT, DETP and UCP; (DETP is my added 
;; category for genitives of form (DETP (NP) (POS |'S|)), after preprocessing.)

;; Also generalize parts of speech inserted (heuristically) by `preprocess-tree':
;; (Note: we are treating V, AUX, and BE as distinct POS's (after preprocessing);
;; also note that any modal MD isa AUX, from above. So we're counting auxiliary
;; have, be, do, and modals, but not "to", as AUX.)
(mapcar #'(lambda (x) (setf (get x 'isa) 'DET))
 '(DT CD PRP\$ DETP QP) ); after preprocessing, CD is always a determiner; QP is
                  ; ADJP-like, & needs to be shifted post hoc with nquan/fquan
(mapcar #'(lambda (x) (setf (get x 'isa) 'AUX))
   '(AUX AUXD AUXG AUXEN AUXP AUXZ MD ; no AUXN -- no passive AUX's! Omit TO;
     PRG PRGZ PRGD PRGP )) ; progressive "be" -- involves PROG, not just tense
(mapcar #'(lambda (x) (setf (get x 'isa) 'BE)); this is copular (not AUX) 'be'
   '(BE BED BEG BEEN BEP BEZ) ); no BEN because there's no passive form of BE

;; NOTE: The 'isa' scheme used here makes V, AUX, and (copular) BE disjoint.

;; Also generalize certain clause types that are always nominals to NP,
;; after preprocessing; related non-NP forms become e.g., S-REL, S-WHILE,
;; S-WHEN, S-AFTER, S-BECAUSE, S-SO, ... N.B.: We won't form S-WHADVP from
;; (SBAR (ADVP (WRB|WDT|WP ...)) ...) because genuine adverbials are never
;; WH-adverbials. For example, the when- and where-clauses in the following
;; are simply ADVPs (we use S-WHEN and S-WHERE) rather than WHADVPs:
;; "She left when he arrived"; "He works where I work".
(mapcar #'(lambda (x) (setf (get x 'isa) 'NP)) ; Nov 2/10
   '(S-THAT S-NO-THAT S-WHNP S-WHPP S-ADVP S-WHETHER S-IF/WHETHER S-FOR-TO))

;; Also generalize the specialized PP-types that are substituted for PP:
;; (Additional types are created when cliche PPs are preprocessed, e.g.,
;; PP-IN-FRONT-OF, PP-IN-SPITE-OF, etc., and these are automatically
;; given the isa PP property as well.)
(mapcar #'(lambda (x) (setf (get x 'isa) 'PP))
   '(PP-ABOUT PP-ABOVE PP-ACROSS PP-AFTER PP-AGAINST PP-ALONG PP-AMONG 
     PP-AROUND PP-AS PP-AT PP-BEFORE PP-BEHIND PP-BELOW PP-BENEATH
     PP-BESIDE PP-BETWEEN PP-BETWIXT PP-BEYOND PP-BY PP-DESPITE PP-DOWN 
     PP-DURING PP-FOR PP-FROM PP-IN PP-INSIDE PP-INTO PP-LIKE PP-NEAR 
     PP-NOTWITHSTANDING PP-OF PP-OFF PP-ON PP-ONTO PP-OUTSIDE PP-OUT-OF
     PP-OVER PP-THROUGH PP-THROUGHOUT PP-TO PP-TOWARD PP-TOWARDS PP-UNDER 
     PP-UNDERNEATH PP-UNTIL PP-UP PP-UPON PP-WITH PP-WITHIN PP-WITHOUT PP-TIME )
    );;                            PP-TIME is special -- see below      ^^^^^^^
     ;; **SHOULD I ALSO BE INCLUDING PP-WH (WHICH CAN BE OF VARIOUS
     ;;   KINDS, LIKE "WHERE", "WHEREVER", "WHITHER", "WHENCE", "WHEN", ...

;; Similarly generalize the specialized clausal adverbials based on
;; subordinationg conjunctions. (Added Oct 27/10)
(mapcar #'(lambda (x) (setf (get x 'isa) 'ADVP))
    '(S-ALTHOUGH S-IF S-EVEN-IF S-ONLY-IF S-IN-CASE S-WHEREAS S-SINCE
      S-BECAUSE S-FOR S-THOUGH S-EVEN-THOUGH S-WHETHER-OR-NOT S-UNLESS
      S-INASMUCH-AS S-AS-LONG-AS S-WHEN S-AS S-WHILE S-BEFORE S-AFTER 
      S-UNTIL S-TILL S-AS-SOON-AS ))

;; Also some wh-words taking sentential complements, such as "when", 
;; "where", "why" and "how", are apt to give rise to WHADVP in Treebank
;; parsers. But of these, "when" and "where" are also subordinating
;; conjunctions (When she left, I left; where Mary goes, Fluffy goes;)
;; and hence the SBARs they form are specialized by the preprocessing
;; routines to type S-WHADVP. So we also need:
(setf (get 'S-WHADVP 'isa) 'ADVP)
;; *** This could turn out to be troublesome, since we have ambiguities:
;; "When she left, I left" vs. "When she left (& where she went), 
;; I don't know". Also wh-clauses can be relative clauses: "the place
;; where she lives", "the day when she graduated", "the reason why she
;; left".
                                                     
;; I don't think the following will actually be used (SBAR is ambiguous
;; among adverbials, relative clauses, subordinate clauses (with or without 
;; "that"), and WH-nominals), but I put it here as a reminder of what new 
;; S-types I've introduced (just as the above lists indicate what new POSs 
;; and PP-types I've introduced. Or should I really make it 'isa NP', etc.?
(mapcar #'(lambda (x) (setf (get x 'isa) 'SBAR))
   '(S-THAT S-SINCE S-ALTHOUGH S-IF S-WHILE S-BECAUSE S-BEFORE S-WHNP S-REL) )
    ; ***THERE ARE MORE -- I GENERATE THEM BASED ON THE ACTUAL WORD USED!
    ; THERE'S ALSO S-THAN AND S-AS.
(mapcar #'(lambda (x) (setf (get x 'isa) 'VP))
   '(VP-INF VP-TO VP-ING ) ); dropped S-NO-SUBJ; what to do about S-NONE (empty S)?
    ;;; TBC....

(defparameter *pp2-adjp-cliche-list*
    '((at home) (at peace) (at rest) (in love) (in trouble) (in doubt) 
      (in debt) (in shambles) (in disarray) (under arrest) (under investigation)
      (under age) (on trial) (on probation) (on drugs) (with child) ))
(defparameter *pp2-advp-cliche-list*
    '((of course) (at least) (at last) (at first) (in time) (in fact) (at all)
      (for good) (for keeps) (on faith) ))
(defparameter *pp3-cliche-list* 
    '((in front of) (on top of)) ); can be predicative or adverbials
(defparameter *pp3-adjp-cliche-list*
    '((in charge of) (at war with) (in league with) (in cahoots with)
      (in sight of) (under investigation by) ))
(defparameter *pp3-advp-cliche-list*
    '((in spite of) (on behalf of) (by way of) (by means of) (for lack of) 
      (in place of) (in lieu of) (on account of) (by dint of) (in light of) 
      (in view of) (in terms of) (as part of) (in addition to) ))
(defparameter *pp4-cliche-list*
    '((in the face of) (by the name of) (at the mercy of)) ); ** more??
(defparameter *pp4-advp-cliche-list*
    '((at the request of) (at the behest of) (with the help of) 
      (with the aid of) (as a matter of) (on the grounds of) )) ; ** more??

;; Flag temporal nouns that are often used in temporal adverbials, with or
;; without a preposition ("today", "early tomorrow", "Saturday" "on Saturday",
;; "last week", "this afternoon", "next time") and either without a determiner 
;; or (typically) determiners THIS, THAT, EACH, EVERY, ALL, SOME, or ONE.
(mapcar #'(lambda (x) (setf (get x 'isa) 'TIME))
         '(YESTERDAY TODAY TOMORROW
           MONDAY TUESDAY WEDNESDAY THURSDAY FRIDAY SATURDAY SUNDAY
           MORNING NOON AFTERNOON EVENING NIGHT MIDNIGHT 
           JANUARY FEBRUARY MARCH APRIL MAY JUNE JULY 
           AUGUST SEPTEMBER OCTOBER NOVEMBER DECEMBER
           SPRING SUMMER FALL WINTER DECADE CENTURY MILLENIUM
           INSTANT MOMENT SECOND MINUTE HOUR DAY WEEK MONTH YEAR TIME) )

;; Likewise flag PP-<prep>-TIME atoms as subordinate to PP-TIME
(mapcar #'(lambda (x) (setf (get x 'isa) 'PP-TIME))
         '(PP-AFTER-TIME PP-AROUND-TIME PP-AT-TIME PP-BEFORE-TIME PP-BETWEEN-TIME
           PP-BY-TIME PP-FOR-TIME PP-FROM-TIME PP-IN-TIME PP-ON-TIME PP-OVER-TIME
           PP-THROUGH-TIME PP-THROUGHOUT-TIME PP-TO-TIME PP-UNTIL-TIME ))

;; Flag `attr', `nnp' and `adv' (** and perhaps eventually some other atoms?)
;; as "modifier-creator"s, i.e., they operate on a predicate and produce
;; a type-preserving function on predicates or propositions. We exempt
;; `nn', even though this is a modifier creator (for nom-nom modification)
;; because we will not abstract away premodifying nominals. (They tend to
;; contribute essentially to propositional truth values; e.g., fountain
;; pens and pig pens have very different properties, and even storm clouds
;; and dust clouds, dress shops and machine shops, etc., do.)
(mapcar #'(lambda (x) (setf (get x 'modifier-creator) T))
         '(attr nnp adv) )

;; Flag common amount nouns (as logical atoms) as such
(mapcar #'(lambda (x) (setf (get x 'amount) T))
         '(NUMBER.N QUANTITY.N AMOUNT.N LOT.N LOTS.N PLENTY.N
           HALF.N THIRD.N QUARTER.N EIGHTH.N SIXTEENTH.N 
           IOTA.N SLEW.N COUPLE.N PAIR.N SCORE.N NONE.N NEITHER.N 
           TON.N POUND.N OUNCE.N KILO.N KILOGRAM.N GRAM.N 
           MILE.N YARD.N INCH.N KILOMETER.N METER.N CENTIMETER.N MILLIMETER.N
           ACRE.N HECTARE.N SQUARE_METER.N SQUARE_FOOT.N SQUARE_INCH.N
           GALLON.N QUART.N PINT.N LITER.N MILLILITER.N
           AEON.N EON.N MILLENIUM.N CENTURY.N YEAR.N MONTH.N 
           WEEK.N DAY.N HOUR.N MINUTE.N SECOND.N ))

;; ADDED SEGMENT (JAN 2/08) BEGINS:
;; Flag common nouns (as logical atoms) that are usually mass as such. 
;; This is based on the 3500 most frequent BNC words listed at
;; http://www.kilgarriff.co.uk/BNClists/lemma.num. Thus it is still
;; very incomplete, and would ideally be replaced by a program
(mapcar #'(lambda (x) (setf (get x 'mass) 'T))
'(access.n ado.n advertising.n advice.n advocacy.n agriculture.n 
  aid.n air.n alcohol.n anger.n anxiety.n approval.n 
  architecture.n assistance.n attention.n authority.n awareness.n
  blood.n bloodshed.n blue.n bread.n butter.n 
  carbon.n care.n cash.n chocolate.n coffee.n 
  concentration.n confidence.n confusion.n consent.n 
  consciousness.n conservation.n construction.n 
  consumption.n co-operation.n cooperation.n cotton.n credit.n 
  damage.n darkness.n data.n depth.n destruction.n 
  determination.n dirt.n discrimination.n dust.n 
  economics.n effectiveness.n efficiency.n electricity.n
  employment.n emphasis.n energy.n entertainment.n enthusiasm.n 
  equipment.n evidence.n excitement.n expertise.n exposure.n 
  fat.n fiction.n flesh.n food.n freedom.n fun.n furniture.n
  gas.n gasoline.n gold.n golf.n grass.n guidance.n
  hair.n handling.n hardware.n harm.n health.n heat.n humor.n humour.n
  ice.n idleness.n imagination.n importance.n independence.n 
  inflation.n integration.n intelligence.n interest.n involvement.n
  juice.n knowledge.n 
  laughter.n leadership.n learning.n leather.n legislation.n 
  leisure.n literature.n loyalty.n luck.n
  machinery.n mail.n maintenance.n marketing.n meat.n 
  milk.n money.n mortality.n music.n 
  neglect.n oil.n opposition.n orange_juice.n ownership.n
  participation.n pay.n peace.n personnel.n petrol.n 
  petroleum.n planning.n plastic.n poetry.n politics.n 
  pollution.n potential.n poverty.n power.n praise.n 
  presence.n pressure.n pride.n progress.n protection.n 
  psychology.n publicity.n
  rain.n reading.n recognition.n regard.n relief.n 
  rent.n research.n resistance.n revenue.n rice.n rubbish.n rugby.n
  safety.n salt.n sand.n satisfaction.n scope.n scoring.n 
  sex.n shopping.n significance.n silk.n  silver.n skin.n 
  sleep.n smoke.n snow.n software.n stability.n steam.n steel.n
  storage.n stress.n stuff.n sugar.n survival.n sympathy.n
  talent.n tar.n taste.n taxation.n tea.n teaching.n 
  television.n tennis.n tension.n timing.n traffic.n 
  travel.n trouble.n trust.n 
  unemployment.n unity.n upkeep.n 
  validity.n variety.n violence.n warmth.n water.n 
  wealth.n welfare.n work.n worth.n writing.n  ; etc etc
))
;; END OF ADDED SEGMENT (JAN 2/08)

;; Flag "picture nominals" as such; this is useful for interpreting phrases
;; like "picture of Mary", "sketch of the house", "film of the wedding", etc.
(mapcar #'(lambda (x) (setf (get x 'picture-nominal) T))
         '(picture.n portrait.n sketch.n drawing.n painting.n canvas.n
           fresco.n caricature.n cartoon.n illustration.n engraving.n 
           etching.n photo.n photograph.n snapshot.n film.n videotape.n 
           movie.n representation.n depiction.n model.n sculpture.n 
           statue.n statuette.n bust.n effigy.n x-ray.n xray.n 
           radiograph.n radiogram.n map.n chart.n atlas.n view.n ))

;; Flag logical atoms for nouns denoting unique local entities as such;
;; These are not normally used with an indefinite determiner.
(mapcar #'(lambda (x) (setf (get x 'local-entity) T))
         '(countryside.n earth.n world.n universe.n cosmos.n sun.n moon.n
           left.n right.n south.n north.n west.n east.n
           air.n atmosphere.n stratosphere.n sky.n ground.n 
           climate.n weather.n temperature.n humidity.n ozone_layer.n 
           police.n press.n media.n economy.n stock_market.n ))

;; Flag logical atoms  for nondescriptive JJ-adjectives as such (so that 
;; their use in propositions can be avoided):
(mapcar #'(lambda (x) (setf (get x 'nondescriptive) T)
                      (remprop x 'descriptive) )
         '(additional.a further.a next.a other.a successive.a such.a
           chief.a main.a mere.a only.a principal.a sole.a own.a average.a
           entire.a whole.a total.a complete.a overall.a over-all.a
           absolute.a sheer.a sheerest.a utter.a consummate.a veritable.a
           ;
           ; I'm unsure about these, but am tentatively flagging them:
           major.a minor.a new.a own.a right.a left.a upper.a lower.a
           ;
           few.a fewer.a fewest.a scant.a little.a less.a least.a
           many.a more.a most.a much.a various.a
           several.a numerous.a countless.a numberless.a innumerable.a 
           constant.a limitless.a untold.a
           damn.a darn.a darned.a goddamn.a goddamned.a 
           fucking.a fuckin\'.a fuckin.a fucken.a
           left.a right.a front.a back.a leftmost.a rightmost.a
           first.a initial.a last.a final.a second.a third.a fourth.a 
           fifth.a sixth.a seventh.a eighth.a ninth.a tenth.a eleventh.a 
           twelfth.a thirteenth.a fourteenth.a fifteenth.a sixteenth.a
           seventeenth.a eighteenth.a nineteenth.a twentieth.a twenty_first.a
           1st.a 2nd.a 3rd.a 4th.a 5th.a 6th.a 7th.a 8th.a 9th.a
           10th.a 11th.a 12th.a 13th.a 14th.a 15th.a 16th.a 17th.a
           18th.a 19th.a 20th.a 21st.a ith.a jth.a kth.a mth.a nth.a
           umpteenth.a hundredth.a thousandth.a millionth.a billionth.a
           trillionth.a zillionth.a
           twenty-odd.a thirty-odd.a forty-odd.a fifty-odd.a sixty-odd.a
           seventy-odd.a eighty-odd.a ninety-odd.a   ; NOTE: ordinary numerals
                                                     ; are not included here, as
                                                     ; they are "CD" in Treebank
           local.a 
           south.a west.a north.a east.a
           southern.a western.a northern.a eastern.a central.a
           southernmost.a westernmost.a northernmost.a easternmost.a
           south-east.a south-west.a north-east.a north-west.a
           south-eastern.a south-western.a north-eastern.a north-western.a
           south-central.a west-central.a north-central.a east-central.a
           erstwhile.a former.a future.a past.a current.a present.a 
           previous.a preceding.a recent.a prospective.a potential.a possible.a
           early.a earlier.a earliest.a immediate.a late.a later.a latest.a 
           actual.a different.a equal.a same.a similar.a maximum.a minimum.a
           certain.a comparative.a considerable.a due.a individual.a 
           particular.a special.a specific.a unique.a
        )); Any others?

;; After defining 'append-pos-to-word' and 'flag-names-as', load
;; male and female names (obtaining values for the *male-names* and
;; *female-names* parameters), and then set the values of their 
;; 'entity-type indicators to 'male*.n 'female*.n.
;; Similarly for countries, US states, US cities, cities of the world,
;; weekdays, months, holidays, planets, companies, and TV networks.
;;
;; NB: A lot of data are also built into the routine `guess-entity-type'
;;                                                    ~~~~~~~~~~~~~~~~~

;; Note: append-pos-to-word could be rewritten as a wrapper around
;; "symb" if we wanted.

(defun append-pos-to-word (word-stem POS); Mar 21/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; E.g., (append-pos-to-word 'person 'N) = PERSON.N
; For words that semantically modify an operand (preserving the
; type of the operand) when used as a function, we also set their 
; 'modifier property to T.
 (let (result)
      (setq result
         (intern 
            (apply #'concatenate 
               (list 'string (write-to-string word-stem) "." (string POS)) )))
      (if (or (member POS '(ADV AUX BE TO PDET))
              (and (eq POS 'V) (member word-stem 
                                  '(be seem become appear turn grow) )))
          (setf (get result 'modifier) T) )
      result ))


(defun flag-names-as (names entity-type); June 21/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; For each <name> in `names', give both <name> and <name>.NAME the property
; 'entity-type with value = entity-type. (This is to allow for some sloppiness
; in using the .NAME suffix in logical atoms, i.e., we can omit it.)
;
 (dolist (name names)
         (setf (get name 'entity-type) entity-type)
         (setf (get (intern (concatenate 'string (string name) ".NAME"))
                   'entity-type ) entity-type )
 )); end of flag-names-as

(when (not (boundp 'names-previously-loaded))
      (load "male-names.lisp")
      (load "female-names.lisp")
      (load "non-personal-names.lisp")
      ; We use a trailing "*", as well as extension ".n", for
      ; gazetteer-abstracted nominals:
      (mapcar #'(lambda (x) 
                   (flag-names-as 
                       (eval (first x)) (append-pos-to-word (second x) 'n) ))
              '((*male-names* male*)
                (*female-names* female*)
                (*continents* continent*)
                (*countries* country*)
                (*us-states* us-state*)
                (*us-cities* us-city*)
                (*world-cities* world-city*)
                (*government-agencies* government-agency*)
                (*legislatures* legislature*)
                (*international-political-entities* international-political-entity*)
                (*activist-organizations* activist-organization*)
                (*service-agencies* service-agency*)
                (*criminal-organizations* criminal-organization*)
                (*weekdays* weekday*)
                (*months* month*)
                (*religious-holidays* religious-holiday*)
                (*civic-holidays* civic-holiday*)
                (*planets* planet*)
                (*rivers* river*)
                (*companies* company*)
                (*tv-networks* tv-network*)
                (*martial-arts* martial-art*)
                (*beverages* beverage*)
                (*medicines* medicine*)
                (*literary-works* literary-work*)

                ; Particular people
                ; ~~~~~~~~~~~~~~~~~
                (*adventurers* adventurer*)
                (*architects* architect*)
                (*artists* artist*)
                (*bands* band*)
                (*composers* composer*)
                (*conductors* conductor*)
                (*conquerors* conqueror*)
                (*criminals/outlaws* criminal/outlaw*)
                (*dictators* dictator*)
                (*emperors* emperor*)
                (*engineers/inventors* engineer/inventor*)
                (*famous-lawyers* famous-lawyer*)
                (*film-makers* film-maker*)
                (*humanitarians* humanitarian*)
                (*kings* king*)
                (*military-commanders* military-commander*)
                (*popes* pope*)
                (*philosophers* philosopher*)
                (*political-leaders* political-leader*)
                (*queens* queen*)
                (*scientists* scientist*)
                (*show-biz-stars* show-biz-star*)
                (*singers* singer*)
                (*sports-celebrities* sports-celebrity*)
                (*supreme-court-justices* supreme-court-justice*)
                (*tycoons* tycoon*)
                (*writers* writer*)
                (*religious-leaders* religious-leader*)
                (*fictitious-characters* fictitious-character*)
                (*us-presidents* us-president*)
                (*deities* deity*) ))
     (setq names-previously-loaded T) )

(defun flag-verbs-as (verbs transitivity) ; June 16/14
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; For each <verb> in 'verbs', give <verb>.v the properties 'intrans',
; 'ambitrans', and 'ditrans', 'rare-intrans', 'rare-trans', 'rare-ditrans',
; as appropriate.
;
; NB: WE ASSUME THAT VERBS WITH 'NIL' TRANSITIVITY FLAGS ARE TRANSITIVE
;
 (dolist (verb verbs) (if (symbolp verb) (setf (get verb transitivity) t))
         ;            ```````````` some verbs are followed by '(from)', '(to)', etc.
 )); end of flag-verbs-as

(when (not (boundp 'verbs-previously-loaded))
      (load "intransitive-verbs.lisp")
      (load "ambitransitive-verbs.lisp")
      (load "ditransitive-verbs.lisp")
      (load "rarely-intransitive-verbs.lisp")
      (load "rarely-transitive-verbs.lisp")
      (load "rarely-ditransitive-verbs.lisp")
      
      (mapcar #'(lambda (x) (flag-verbs-as (eval (first x)) (second x)))
               '((*intransitive-verbs* intrans)
                 (*ambitransitive-verbs* ambitrans)
                 (*ditransitive-verbs* ditrans)
                 (*rarely-intransitive-verbs* rare-intrans)
                 (*rarely-transitive-verbs* rare-trans)
                 (*rarely-ditransitive-verbs* rare-ditrans)))
(setq verbs-previously-loaded T) )
        

;; `PROPOS' and DET are special logical atoms corresponding to propositions
;; and determiners. Also `have.v' is used directly when forming propositions
;; from certain :a-patterns. Also `be.PASV' is used directly in forming
;; semantic patterns from passives; etc. -- there are a number of additional
;; special atoms used in forming semantic and propositional patterns. 
;; Give them indicators needed to verbalize them.
(setf (get 'proposition.n 'type) 'N)
(setf (get 'proposition.n 'word) 'proposition)
(setf (get 'have.v 'type) 'V)
(setf (get 'have.v 'word) 'have)
(setf (get 'be.PASV 'type) 'V)
(setf (get 'be.PASV 'word) 'be)
(setf (get 'by.P 'type) 'P)
(setf (get 'by.P 'word) 'by)
(setf (get 'undergo.v 'type) 'V)
(setf (get 'undergo.v 'word) 'undergo)
(setf (get 'belong-to.v 'type) 'V)
(setf (get 'belong-to.v 'word) 'belong-to)
(setf (get 'number-or-portion.N 'type) 'N); used in null-headed partitives
(setf (get 'number-or-portion.N 'word) 'NUMBER_OR_PORTION)
(setf (get 'constituted-of-or-filled-with.A 'type) 'A); for some NP of NP phrases
(setf (get 'constituted-of-or-filled-with.A 'word) 'CONSTITUTED_OF_OR_FILLED_WITH)
(setf (get 'and.CC 'type) 'CC)
(setf (get 'and.CC 'word) 'and)
(setf (get 'det 'type) 'DET)
(setf (get 'a{n} 'word) 'A)
(setf (get 'a{n} 'type) 'DET)
(setf (get 'det 'word) 'A)
(setf (get 'the 'type) 'DET)
(setf (get 'thing-referred-to.n 'type) 'N)
(setf (get 'thing-referred-to.n 'word) 'THING); don't verbalize "referred-to" 
(setf (get 'exemplar-of.N 'type) 'N)
(setf (get 'exemplar-of.N 'word) 'EXEMPLAR_OF)

; The verbalization of `the' is indefinite `a' (and it is changed to 
; `an' if followed by a vowel); the only reason it is not changed to 
; the generic `DET' by abstraction is that the knowledge that a definite
; phrasing was used is helpful in heuristically interpreting certain
; NP OF NP constructions 
(setf (get 'the 'word) 'A) 

(setf (get 'the-local 'type) 'DET); used, e.g., for "the weather"; its
                                  ; appropriateness is detected from 
                                  ; property entity-type = 'local-entity
(setf (get 'the-local 'word) 'THE); this is verbalized as a definite
(setf (get 'some-number-of 'type) 'DET)
(setf (get 'some-number-of 'word) 'SOME_NUMBER_OF)


(defun generalize-pos (pos-tag); Mar 21/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Find the general part of speech corresponding to the standard part-of-speech
; tag `pos-tag'. E.g., for pos-tag VBD the result is V; if there is no
; generalization, return the pos tag itself.
;
 (if (get pos-tag 'isa) (get pos-tag 'isa) pos-tag) )


(defun isa (x y); Apr 11/01; a function to be used in pattern matching
;~~~~~~~~~~~~~~
; Determine whether we can follow an isa-chain from x to y (where x and y
; are atoms and `isa' is a property indicator). If x and y are the same atom,
; the result is t. Since we allow an isa pointer to be self-referential
; (i.e., the isa-value is the same as the atom that carries the isa indicator),
; we need to avoid unit isa-cycles. (Larger cycles are assumed not to exist.)
;
 (cond ((eq x y) t)
       ((null (get x 'isa)) nil)
       ((eq (get x 'isa) x) nil); cannot reach y (assuming tree-structure)
       (t (isa (get x 'isa) y)) ))



(defun extract-all-ps-rules (tree); Apr 4/01; revised July 13/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Given a Treebank tree (presumably after postprocessing, though this doesn't
; matter), find all the phrase structure rules used in it, above the lexical
; level. The result is a list of these rules, each in a form such as
; (S NP VP), or (VP VBD SBAR), etc. Omit word-level rules like (NN man).
;
 (cond ((or (atom tree)
            (null (cdr tree))
            (atom (second tree)) )
        nil )
       (T (cons (extract-top-level-ps-rule tree)
                (apply #'append (mapcar #'extract-all-ps-rules (cdr tree))) ))
 )); end of extract-all-ps-rules


(defun extract-top-level-ps-rule (tree); July 13/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Given a Treebank tree (presumably after postprocessing, though this doesn't
; matter), find the top-level phrase structure rule used in it
;
 (if (atom tree)
     tree
     (cons (car tree); extract the rule
           (mapcar #'(lambda (x) (if (atom x) x (car x))) (cdr tree)) )))


(defun extract-words-of-phrases (tree phrase-form); Apr 6/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Given a Treebank tree (presumably after postprocessing, though this
; doesn't matter), find the words corresponding to all phrases in the tree
; that have the given phrasal form. E.g., given a tree and the phrase form
; (VP VBZ RB ADJP), the output might be ((is n't readily available)), if
; these are the words of the unique phrase having the given form in the
; given tree.
;
 (prog (cats result)
       (if (or (atom tree) (atom phrase-form)) (return nil)); unexpected case
       (setq result
             (apply #'append
                (mapcar #'(lambda (x) (extract-words-of-phrases x phrase-form))
                          (cdr tree) )))
       (when (eq (car tree) (car phrase-form))
             (setq cats (mapcar #'car (cdr tree)))
             (if (equal cats (cdr phrase-form))
                 (return
                    (cons
                       (apply #'append
                          (mapcar #'extract-words (cdr tree)) )
                       result ))))
       (return result)
 )); end of extract-words-of-phrases


(defun extract-phrases-satisfying-test (tree test); July 13/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Given a Treebank tree (presumably after postprocessing, though this
; doesn't matter) and a monadic test applicable to a tree/subtree, 
; extract a list of rule-phrase pairs obtained by inspecting all nodes
; of `tree' and checking if they satisfy `test'. An example of a test
; function is given below as `test-np-np-np'. We would use this as
; follows: (extract-phrases-satisfying-test #'test-np-np-np <tree>).
;
 (let ((rule-phrase ; a singleton list containing top level rule-phrase pair, if any
        (if (apply test tree nil); does tree satisfy the test?
            (list (list (extract-top-level-ps-rule tree); this is the rule
                        (extract-words tree) )); these are the words of the phrase
            nil ))); test not satisfied at top level
      (append rule-phrase ; singleton list or nil
              (if (atom tree)
                  nil
                  (apply #'append 
                     (mapcar #'(lambda (x) (extract-phrases-satisfying-test x test))
                               (cdr tree) ))))
 )); end of extract-phrases-satisfying-test


(defun test-np-np-np (tree); July 13/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~
; An example of a test that can be applied to a PST: determine if the (sub)tree
; given as input is an NP with at least 2 NPs among its immediate constituents
;
 (if (atom tree) 
     nil
     (let ((rule (extract-top-level-ps-rule tree)))
          (cond ((atom rule) nil)
                ((not (eq (car rule) 'NP)) nil)
                (T (setq rule (member 'NP (cdr rule)))
                   (if rule (member 'NP (cdr rule)) nil) )))
 )); end of test-np-np-np



(defun extract-words (tree); Apr 6/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~
; Given a Treebank tree (presumably after postprocessing, though this
; doesn't matter), find the sequence of leaf nodes (words) of the tree.
;
 (cond ((null tree) nil) ; needed for ( ) constituents in Brown corpus 
       ((atom tree) (list tree))
       ((and (atom (car tree)) (null (cdr tree)))
        '(| |) ); nonatomic node with no child (unexpected case)
       ((listp (car tree)) (apply #'append (mapcar #'extract-words tree)))
       (T (apply #'append (mapcar #'extract-words (cdr tree)))) ))


(defun extract-first-n-words (tree n); June 13/01; tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Given a Treebank tree, find the sequence of first n leaf nodes (words)
; of the tree. If there are fewer than n, return the list of all words.
;
 (cond ((zerop n) nil)
       ((atom tree) (list tree))
       ((null (cdr tree)) '(| |)); nonatomic node with no child (unexpected case)
       ((atom (second tree))
        (if (cddr tree)
            (cons (second tree) (extract-first-n-words (cdr tree) (- n 1)))
            (cdr tree) ))
       (T (let (words (m n) result) 
               (dolist (x (cdr tree))
                       (setq words (extract-first-n-words x m))
                       (setq m (- m (length words)))
                       (setq result (append result words))
                       (if (zerop m) (return result)) )
               result ))
 )); end of extract-first-n-words

;; IMPORTANT N.B.: preprocess-tree IS CURRENTLY OVERRIDDEN
;; BY THE CODE IN "refine-parse-tree-and-combine-names.lisp"
;; No other programs in the present file (except preprocess-tree1, 
;; not used in the old version) are affected

;; THIS ROUTINE IS TO BE EXCISED EVENTUALLY, WHEN THE FILE
;; "preprocess-tree-via-ttt.lisp" has been completed (where
;; a new ttt-based definition of 'preprocess-tree' is given)
;;
(defun preprocess-tree (tree); Mar 8/10; Oct 20/10-Nov 5/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; This first does miscellaneous local repairs, and then some additional
; passes over the tree (a top-level parse tree):
; - collect the parts of a top-level coordinate structure with free-floating
;   premodifiers and possible final punctuation so that the coordinate
;   structure becomes a single constituent;
; - modify progressive & passive participial phrases (adding '-PRT' 
;   extensions to POS's 'VBG' and 'VBN') so that the proper semantics 
;   can be assigned to them; this is context-sensitive (non-local)
;   because the changes are contingent on whether there's a preceding
;   verb sister of the progressive/passive VP;
; - repair relative clauses (originally cast as SBARs, and preprocessed
;   into S-RELs). The required modification of an embedded wh-word also 
;   is not local, because a wh-word that should be changed to a REL-word
;   can be arbitrarily embedded in principle (e.g., "the hospital in 
;   the care of whose doctors he'd rather be" -- the "whose" is a WDT-REL 
;   here, rather than a WDT).
; - add traces, as needed for interpretation of relative clauses, questions,
;   question nominals, certain adverbials, etc.  
;
 (add-traces (repair-rel-clauses 
               ; (modify-participial-phrases ; I've decided to skip this)
                        (preprocess-tree1))
   )); end of preprocess-tree


(defun add-traces (tree) ; STUB
  tree )


;; IMPORTANT N.B.: preprocess-tree IS CURRENTLY OVERRIDDEN
;; BY THE CODE IN "refine-parse-tree-and-combine-names.lisp".
;; No other programs are affected.
;;
;; SEE ALSO COMMENT ABOUT 'preprocess-tree' ABOVE
;; 
(defun preprocess-tree1 (tree); Mar 25/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Preprocess a "raw" Treebank tree to 
; - delete ( ) constituents (relevant to Brown Corpus, which seems to use
;   these as a kind of subconstituent demarcation, in a way that I don't
;   understand and don't see as helpful)
; - change ((S ...) (\. ...)) to (S ... (\. ...)) (relevant to Brown Corpus)
; - delete quotes and braces (which delimit essential editorial insertions)
;   [** but I'm not sure we really want to still do that]
; - change sequences of constituents of type (which occur in Brown but
;   not Charniak parses) 
;        (AUX (<x> <word>)) ...  where <x> = VB, VBZ, VBD, VBP, VBG,
;   VBN, MD to VPs of form
;        (VP (AUX<x-ending> <word>) ...)
;   where (respectively) AUX<x-ending> = AUX, AUXZ, AUXD, ..., AUXEN   
;   (AUXEN, not AUXN, because auxiliaries have no passive forms).
; - Charniak just uses (AUX be), (AUX is), (MD may), etc. (no inflections);
;   this leaves a bit of a problem for words like "have", which could
;   be present tense or base form. So we heuristically change pres tense 
;   occurrences of (AUX have) to (AUXP have) (viz., VP-initial, after NP)
;   We might also want to change (MD ...) to (AUXZ ...) or (AUXD ...),
;   at least for modals {might, must, ought, should, would}, which are
;   all ambiguous between present and past. But we can't pre-disambiguate! 
;   -- so we should use a pres/past operator in the LF
; - Change (AUX (TO TO)) and (AUX (MD ...)) (appearing in Brown, but not
;   in Charniak parses) to just (TO TO) and (MD ...) (as in Charniak).
; - replace VBN by VBEN for *non-passive* past participles, as indicated by
;   an immediately embedding HAVE (note: this bypasses BE VBN forms, etc.)
;   Subsequently we'll be able to treat VBN as passive.
; - replace the POS's of auxiliary forms of `have', non-copular `be' and 
;   `do' by AUX, AUXD, AUXG, AUXEN, AUXP, or AUXZ; at present, the aux-
;   identification is done by looking for verbs with a VP complement, 
;   possibly with an intervening RB or ADVP; thus "is happy", "is a man" 
;   are *not* marked as auxiliary;
; - replace the POS's of copular `be' by BE, BED, BEG, BEEN, BEP, BEZ;
;   maybe I should deal analogously with `seem', `become', `grow', `turn',
;   ..., though these don't, for example, allow an immediately following
;   adverb n't, not, never, etc.
; - *** STILL TO BE DONE:
;       IN NEW VERSION OF 'derive-word-lf', I assume we have VBG-PRT,
;       distinct from VBG, to be used for adverbials, like "Running to
;       the bus, he tripped".
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
; - particularize SBAR's that were not already replaced by S-REL in the
;   context of NP preprocessing (for NPs with constituents NP+SBAR) or by 
;   S-WHNP, or S-WHPP in the context of S-processing (where the subject may 
;   be an SBAR) or in the context of VP processing (where the object may be
;   an SBAR); we use particular types such as S-THAT, S-SINCE (a clausal
;   adverbial), and perhaps additional S-WHNP, S-WHPP, or S-REL instances,
;   based in this case just on the content, not context, of the SBAR.
;   The default for SBARs starting with an WHADVP is S-WHADVP (these are
;   true adverbials, as in "He left WHEN BILL ARRIVED"), assuming that
;   nominal occurrences have already been identified and changed to S-WHPP.
;   The wh-word in these default cases needs to be changed to PS in a later
;   pass;
; - For a tensed S of form SBAR+VP (e.g., What he likes no-one knows; 
;   Where he lives is unknown; When he will arrive is a mystery), change
;   the SBAR to S-WHNP or S-WHPP, as appropriate for the fronted constituent
;   in the S-BAR; (S-WHNP & S-WHPP are recognized as nominals, via ISA-links);
; - replace S by S-INF if it is actually an infinitive VP and by S-NONE if
;   it is empty
; - replace subjectless S (occurring in relclauses, and in fronted clausal 
;   adverbials, as in "SEEING HER CHANCE, Mary left the house")) by VP,
;   VP-INF, or VP-ING as appropriate
; - replace SBARQ by WHQ, and if it contains an SQ as its second element,
;   replace the SQ by SINV (semantically, this is still sentential);
; - replace any remaining (SQ ...) by (YNQ (SINV ...)), a semantic question;
; - replace NPs that are actually genitive determiners (as indicated by 
;   last constituent (POS |'S|)) by a DETP consisting of a NP and (POS |'S|);
;   in Brown, unfortunately the NP + \' or \'S determiner are treated as 
;   sisters of the remaining NP constituents, so these also need to changed
;   to (DETP (NP ...) (POS ...))
;   [** I'll need to also take care of possessives used as predicates,
;       as in "The book is his/mine/Mary's"]
; - contract (DT A) (JJ few) in a NP into (DT a-few)
; - replace CD or QP, coming after anything but a predeterminer, by JJ or
;   ADJP respectively; we don't want NP-internal quantifiers CD or QP. 
; - replace CD coming after a premodifier other than a predeterminer by JJ;
; - replace JJ|JJR|JJS by CD in NP-initial (JJ|JJR|JJS several|many|few|much|
;   little| numerous|more|most|less|fewer|enough);
; - replace initial ADJP with head "several|many|few|...|enough" (see above)
;   in an NP by QP; in the NP lf-postprocessing we'll use a type shift operator
;   'nquan' or 'fquan' (numeral or fractional quantifier) depending on whether
;   the head of the NP is plural (NNS) or singular (NN);
; - in NPs replace any sequence beginning with and ending in an NNP by a single
;   NNP realized as a sequence of words; also, collapse sequences of NN(S)
;   and non-NN(S) constituents between the last NNP(S) and the head NN(S)
;   into a single NN(S), since we want to treat these words as (ambiguously
;   structured) noun "classifiers"; e.g., (NP (NNP NEW ZEALAND) (JJ FOREIGN)
;   (NN EXCHANGE) (NNS MARKETS)) becomes (NP (NNP NEW ZEALAND) (NNS FOREIGN
;   EXCHANGE MARKETS); in other words, we treat these compounds as lexical
;   lemmas (often noncompositional in their semantics);
;   Note: any remaining nested NN(S) premodifiers that might still show up 
;   ~~~~~ were abstracted in KNEXT into flat sequences post-hoc;
; - replace prenominal participles in NPs by adjectives
; - replace NP by NP-TIME for evident temporal NPs
; - expand possessive determiners like "his", "our", or "whose" into DETP
;   phrases (consisting of a pronominal NP and a POS) for easy interpretation;
; - change (WHNP (IN that) ) to (WHNP (WP that) ) (This is a frequent relative
;   pronoun/complementizer confusion). WP will later be changed to WP-REL.
; - replace (WP ...) by (WDT ...) when immediately followed by a noun
;   (e.g., (WP what) (NNS alternatives) becomes (WDT what) (NNS alternatives))
;   [Actually, the routines for repairing rel-clauses applied after this
;   preprocessing routine duplicate some of these repairs.]
; - change SBARs in context (NP (NP ...) (SBAR (WHNP|WHPP|WHADV|S ...)))
;   to S-REL (relative clauses); so this is done in the NP-processing;
; - likewise for (NP (NP ...) (\, \,) (SBAR|S ...) ...), i.e., the SBAR or
;   S is changed to S-REL (in this case a nonrestrictive S-REL);
; - ****STILL TO BE DONE: CHANGE "PREPOSITIONS", OF TYPE "IN" TO "PS"
;       WHEN MODIFYING A SENTENCE OR PREDICATE ("after he left", "while
;       asleep") [I'm not sure about this]
; - change (ADJP (VBN ...)), (ADJP (VBG ...)) to (ADJP (JJ ...))
; - change CD occurring among the constituents of an ADJP or QP to JJ;
;   we don't want quantifiers (of type CD) within ADJPs, or within
;   QPs, which are ADJP used as quantifiers;
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
; 
 (prog (root trees tree1 pos1 pos2 pos3)
       (if (atom tree) (return tree))
       (if (null (car tree)) ; remove initial ( ) (others are handled below)
           (return (preprocess-tree1 (cdr tree))) )
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
                 (preprocess-tree1
                   (append
                     (cons 'S
                       (cons '(NP (PRP you)) (cddar tree)) )
                     (cdr tree) )))
               (return (preprocess-tree1 (append (car tree) (cdr tree)))) ))
       (setq root (car tree))
       (setq trees (cdr tree))
       (setq trees ; delete ( )'s
             (remove-if #'null trees) )
       (setq trees ; delete quotes; ** questionable in the long run!
             (remove-if
                #'(lambda (x) (and (listp x) (member (car x) '(|``| |''|))))
                  trees ))
       (setq trees ; delete braces, which are coded as (|(| {) and (|)| })
                   ; in Brown; ** however, Charniak has PRN (parenthesized
                   ; phrase) headed by (-LRB- -LCB-) (left curly bracket) and 
                   ; closed by (-RRB- -RCB-) (though often the enclosing PRN
                   ; is missing); for round and square brackets, Charniak
                   ; produces (-LRB- -LRB-), (-LRB- -LSB-) and similarly for
                   ; closing brackets. (Note that the type is always -LRB-
                   ; or -RRB-; however, sometimes the type comes out incorrectly,
                   ; e.g., NN instead of -LRB-!)
             (remove-if
                #'(lambda (x) (or (equal x '(|(| {)) (equal x '(|)| }))))
                  trees )); **N.B.: as noted above, no effect for Charniak trees
       (setq trees ; incorporate AUX constituents (such as (AUX (VBZ has)))
                   ; into a VP whose head is an appropriate type of AUX 
                   ; constituent (e.g., (AUX have), (AUXZ has), (AUXD had), 
                   ; etc.) and whose remaining constituents are those 
                   ; *following* the original AUX constituent. (Brown corpus)
                   ; Charniak already forms VPs like (VP (MD may) (VP (VB run)))
                   ; or (VP (AUX has) (VP (VBN run))) -- unfortunately without
                   ; tense distinctions for the AUX or MD.
             (let ((tacit-VP
                   (member-if
                      #'(lambda (x)
                          (and (listp x) (eq (car x) 'AUX) (listp (second x))) )
                                trees ))); tacit-VP: a list *headed* by the tacit VP
                  (if (null tacit-VP)
                      trees; no change to trees if there's no AUX
                      (append (butlast trees (length tacit-VP))
                              (list (make-auxiliary-VP tacit-VP)) ))))
                  ; *** July 25/11: IT NOW SEEMS TO ME THIS WILL ADD AN
                  ;     UNWANTED EXTRA VP LEVEL FOR AN *INITIAL* AUX, e.g.,
                  ;     tree = (VP (AUX (VBD was)) (VP (VBN found))) seems to
                  ;     become (VP (VP (AUXD was) (VP (VBN found))))

       ; Many phrases will fit one of the "if"s within the following case
       ; statement, causing a result to be returned. If not, the root
       ; along with recursively preprocessed children (trees) is returned
       ; at the end:
       (case root
             (VP ; ** I'm not allowing here for an adverb preceding
                 ;    an auxiliary within the VP; though there are no
                 ;    such examples in the 100 sample WSJ sentences,
                 ;    maybe they occur in the Brown corpus or elsewhere...
                 (if trees (setq pos1 (first (first trees))))
                 (if (cdr trees) (setq pos2 (first (second trees))))
                 (if (cddr trees) (setq pos3 (first (third trees))))

                 ; If the VP contains (VB ...) (CC ...) (VB ...) (or a
                 ; consistent variant of VB), change that triple to
                 ; (VB (VB ...) (CC ...) (VB ...)). (This would be simpler
                 ; with TTT!) But allow in principle for other unbracketed
                 ; conjunctions, not just verb conjunctions. [coded Jan 25/16]
                 (if (and (eq pos2 'cc) (eq pos1 pos3)) 
                     (return 
                       (preprocess-tree1
                          (cons'VP 
                            (cons (list pos1 
                                    (first trees) (second trees) (third trees))
                                  (cdddr trees))))))
                 ; Allow for the possibility that a word (e.g., an adverb)
                 ; precedes the conjunction, as in "quickly turned and ran"
                 (if (and (eq pos3 'cc) (eq pos2 (car (fourth tree)))
                          (not (eq pos1 pos2))); not a 3-way conjunction
                     (return 
                       (preprocess-tree1
                          (cons'VP     
                           (cons (car trees)
                            (cons (list pos2     
                                    (second trees) (third trees) (fourth trees))
                                  (cddddr trees)))))))

                 ; If the VP contains an SBAR constituent, check if it is
                 ; a verb object (e.g., We know what he likes/where he 
                 ; lives/when he will arrive; He likes for her to dress up;
                 ; We'll see if/whether he's ok); if so, change the SBAR to 
                 ; S-WHNP, S-WHPP, S-THAT, S-WHETHER, S-IF/WHETHER, or 
                 ; S-FOR-TO as appropriate for the object SBAR constituent;
                 ; recursive processing follows below
                 (setq tree1 (particularize-object-sbar 
                   (cons 'VP trees) )); we don't use the original 'tree',
                                      ; because 'trees' may have been edited

                 ; Change VBN embedded by HAVE to VBEN and recursively
                 ; process the entire phrase (so that the have-auxiliary,
                 ; etc., will also be specialized)
                 (if (and pos1 pos2
                          ; (member pos1 '(VB VBD VBG VBN VBP VBZ))
                          ; Dec 13/01: the above doesn't allow for the explicit
                          ; AUX-forms obtained for preprocessed Brown trees,
                          ; so omit this (essentially redundant) check
                          (member (second (first trees)) '(have has had having))
                          (eq pos2 'VP) (eq (first (second (second trees))) 'VBN) )
                     (return
                       (preprocess-tree1
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
                       (preprocess-tree1
                          (append
                             (list 'VP (first trees) (second trees))
                             (cons (cons pos3
                                      (cons
                                         (cons 'VBEN
                                            (cdr (second (third trees))) )
                                         (cddr (third trees)) ))
                                   (cdddr trees) )))))

                 ; Verb with VP complement (possibly after an ADV)?
                 ; It seems safe to assume that the verb in such cases is
                 ; always an auxiliary verb. For sentences like "He kept
                 ; walking" or "He tried to sleep", Treebank parsers produce
                 ; a verb + S analysis, where the S just consists of a VP.
                 ; Note 1: here we'll catch BE in BE+VP[ing] & BE+VP[pasv],
                 ;       but (appropriately) not copular BE (because 
                 ;       copular BE is not followed by a VP).
                 ; Note 2: Unfortunately, the Charniak parser makes all HAVE/
                 ;       BE auxiliaries, *and* copular BE, into AUX, with
                 ;       no verb form distinctions. So the 'derive-word-lf'
                 ;       routine needs to pay minimal attention to verb POS
                 ;       (for pre-VP verbs), focusing more on the words
                 ;       themselves. Modals are uniformly MD for Charniak,
                 ;       and infinitive "to" is TO.
                 (if (and pos1 pos2
                          (member pos1 '(VB VBD VBG VBN VBEN VBP VBZ))
                          ; won't match Charniak's VP -> AUX|MD|TO VP parses;
                          ; they'll be recursively processed at the end,
                          ; leaving AUX, MD, TO intact; but we *do* change 
                          ; his AUX for copular BE to inflected BE-variants
                          ; below;
                          (or (eq pos2 'VP)
                              (and pos3 (member pos2 '(RB NEG RBR RBS WRB ADVP))
                                   (eq pos3 'VP) )))
                     ; replace verb POS by appropriate AUX-variant
                     ; (not relevant to Charniak):
                     (return
                       (cons 'VP
                         (cons
                           (cons
                             (case pos1; NB: can't be passive (there's no AUXN)
                                   ((VB AUX) 'AUX); preserve Charniak's AUX,
                                                  ; unfortunately untensed
                                   (VBD 'AUXD) (VBG 'AUXG) (VBN 'AUXEN)
                                   (VBEN 'AUXEN) (VBP 'AUXP) (VBZ 'AUXZ) (T pos1) )
                             (cdr (first trees)) )
                         (mapcar #'preprocess-tree1 (cdr trees)) ))))
                 (if (and pos1 pos2
                       (member (second (first trees))
                         '(be am \'m is \'s are \'re was were been bin 
                           being bein\') )); "being" can occur in an ADVP 
                                           ; ("Being sick, he stayed home")
                     ; replace copula by appropriate BE-variant:
                     (return
                       (cons 'VP
                         (cons
                           (cons
                             (case (second (first trees))
                                   ; (We can't use pos1 for tense distinctions,
                                   ; because Charniak just makes it AUX)
                                   (be 'BE) ((am \'m are \'re) 'BEP)
                                   ((is \'s) 'BEZ) ((was were) 'BED)
                                   ((been bin) 'BEEN) ((being bein\') 'BEG) 
                                   (T pos1) ); NB: can't be pasv (there's no BEN)
                             (cdr (first trees)) )
                         (mapcar #'preprocess-tree1 (cdr trees)) ))))

                 (if (and pos1 pos2
                          (member pos1 '(VB VBD VBG VBN VBEN VBP VBZ))
                          (eq pos2 'PRT) ); particle right after verb
                     ; make particle part of verb, e.g., (VB give up)
                     (return
                       (cons 'VP
                         (cons
                           (append (first trees) (cdr (second (second trees))))
                           (mapcar #'preprocess-tree1 (cddr trees)) ))))
                 (if (and pos1 pos2 pos3
                          (member pos1 '(VB VBD VBG VBN VBEN VBP VBZ))
                          (eq pos3 'PRT) ); particle after verb complement
                     ; make particle part of verb, e.g., (VB give up)
                     (return
                       (cons 'VP
                         (cons
                           (append (first trees) (cdr (second (third trees))))
                           (mapcar #'preprocess-tree1
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
                   
                 ; If none of the above steps led to recursive processing
                 ; followed by a return, do it now
                 (return
                   (cons (first tree1)
                         (mapcar #'preprocess-tree1 (cdr tree1)) )))
             (PP (setq tree1 (particularize-pp (cons 'PP trees)))
                 ; Note: this could be of form (PP (P ...) ...) or (PP (PP ...)
                 ; ... (PP ...))
                 ;
                 ; Check if the PP has an SBAR object (e.g., He talked about
                 ; what he likes/where he lives/when he will arrive/whether
                 ; (or not) he'll accept the job); if so, change the SBAR
                 ; to S-WHNP, S-WHPP, S-THAT (rare), S-WHETHER, S-IF/WHETHER
                 ; (rare), or S-FOR-TO (impossible?) as appropriate for the 
                 ; object SBAR constituent; recursive processing follows below
                 (setq tree1 (particularize-object-sbar 
                   (cons 'PP trees) )); we don't use the original 'tree',
                                      ; because 'trees' may have been edited
                 (return
                   (cons (first tree1)
                         (mapcar #'preprocess-tree1 (cdr tree1)) )))
             (S  ; If this is a tensed sentence of form SBAR+VP (e.g., What
                 ; he likes no-one knows; Where he lives is unknown; When he 
                 ; will arrive is a mystery), change the SBAR to S-WHNP,  
                 ; S-WHPP, S-THAT, S-WHETHER, S-IF/WHETHER, or S-FOR-TO as 
                 ; appropriate for the fronted constituent in the S-BAR; 
                 ; recursive processing follows below
                 (setq tree1 (particularize-subject-sbar 
                    (cons 'S trees) )) ; we don't use the original 'tree',
                                       ; because 'trees' may have been edited
                 ; If this is an NP + VP sentence, where the head verb is
                 ; (AUX have), change this to (AUXP have), before recursive
                 ; processing
                 (setq tree1 (particularize-pres-aux-have (cons 'S trees)))
                 (setq tree1 (particularize-s tree1))
                 (return
                   (cons (first tree1)
                         (mapcar #'preprocess-tree1 (cdr tree1)) )))
             (SBAR (setq tree1 (particularize-sbar (cons 'SBAR trees)))
                 ; Note: If an SBAR is embedded as a postmodifier of an NP,
                 ; i.e., as a relative clause, it will be changed to an S-REL
                 ; or S-REL-NO-THAT before the present SBAR case can be 
                 ; reached (because of the top-down manner in which we are 
                 ; doing the preprocessing -- see the NP case below).
                 ;
                 ; The same applies to SBARs changed to S-WHPP or S-WHNP in
                 ; subject or object positions. Note that S-WHPP and S-WHNP
                 ; have ISA links to NP, and so can be recognized as NPs in
                 ; 'derive-phrase-lf'.
                 (return
                   (cons (first tree1)
                         (mapcar #'preprocess-tree1 (cdr tree1)) )))
             (SBARQ ; Change name to WHQ, but more importantly change
                 ; embedded SQ to SINV; inverted sentences within a
                 ; wh-question do *not* have a YNQ operator; e.g., from
                 ; Brown: (SBARQ (WHNP (WP whom)) (SQ (AUX (MD shall))
                 ;         (NP (PRP I)) (VP (VB fear) (NP (-NONE- T)))))
                 (if (eq (car (second trees) 'SQ))
                     (return 
                       (cons 'WHQ 
                         (cons (preprocess-tree1 (car trees))
                           (cons (preprocess-tree1 
                                    (cons 'SINV (cdr (second trees))) )
                              (mapcar #'preprocess-tree1 (cddr trees)) ))))
                     ; if there's no SQ just replace SBARQ by WHQ & hope...
                     (return
                       (cons 'WHQ (mapcar #'preprocess-tree1 trees)) )))
             (SQ ; If we reach this case, the SQ is *not* in the context
                 ; of a wh question (see SBARQ case); therefore it should
                 ; be (YNQ (SINV ...)), i.e., a question.
                 (return 
                   (cons 'YNQ 
                     (cons 'SINV (mapcar #'preprocess-tree1 trees)) )))
             (NP ; Contract (DT A) (JJ few) in a NP into (DT a-few)
                 (setq tree1 (contract-a-few (cons 'NP trees)))
                 ; tree1 = NIL if no (DT A) (JJ few) sequence was found;
                 ; (Needed to avoid run-away recursion in what follows)
                 (if tree1 (return (preprocess-tree1 tree1)))

                 ; Replace CD coming after a determiner by JJ
                 (setq tree1 (change-extra-det-to-jj-or-adjp (cons 'NP trees)))
                 ; tree1 = NIL if no extra determiner was found;
                 ; (Needed to avoid run-away recursion in what follows)
                 (if tree1 (return (preprocess-tree1 tree1)))

                 ; Replace JJ|JJR|JJS by CD in NP-initial (JJ|JJR|JJS several|
                 ; many|few|much|little|numerous|more|most|less|fewer|enough)
                 (setq tree1 (change-initial-count-jj-to-cd (cons 'NP trees)))
                 ; tree1 = NIL if no initial count-jj was found;
                 ; (Needed to avoid run-away recursion in what follows)
                 (if tree1 (return (preprocess-tree1 tree1)))

                 ; Replace initial ADJP with head "several|many|few|...|enough"
                 ; (see above) in an NP by QP (quantifier phrase);
                 (setq tree1 (change-initial-count-adjp-to-qp
                                                         (cons 'NP trees)))
                 ; tree1 = NIL if no initial count ADJP was found;
                 ; (Needed to avoid run-away recursion in what follows)
                 (if tree1 (return (preprocess-tree1 tree1)))

                 ; Flatten NNP sequences into a multiword NNP(S)
                 (setq tree1 (combine-nominals (cons 'NP trees) '(NNP NNPS)))
                 ; tree1 = NIL if no multiple names were combined
                 ; (Needed to avoid run-away recursion in what follows)
                 (if tree1 (return (preprocess-tree1 tree1)))

                 ; Flatten NN(S) sequences into a multiword NN(S)
                 (setq tree1 (combine-nominals (cons 'NP trees) '(NN NNS)))
                 ; tree1 = NIL if no multiple classifiers were combined
                 ; (Needed to avoid run-away recursion in what follows)
                 (if tree1 (return (preprocess-tree1 tree1)))

                 (if (member-if ; change prenominal participles to adjectives
                        #'(lambda (x) (and x (listp x) (member (car x) '(VBN VBG))))
                          trees )
                     (return
                       (preprocess-tree1
                         (change-participle-to-adjective-in-np tree) )))

                 (if (eq (caar (last trees)) 'POS); possessives, as treated
                     (return                      ; in WSJ corpus
                       (cons 'DETP
                         (cons (cons 'NP
                                  (mapcar #'preprocess-tree1 (butlast trees)) )
                               (last trees) ))))
                 (if (eq (first (second trees)) 'POS); possessives, as treated
                     (return                         ; in Brown corpus
                       (cons 'NP
                         (cons
                           (list 'DETP
                                 (preprocess-tree1 (first trees))
                                 (second trees) )
                         (mapcar #'preprocess-tree1 (cddr trees)) ))))

                 (if (temporal-np (cons 'NP trees))
                     (return
                       (cons 'NP-TIME
                         (mapcar #'preprocess-tree1 trees) )))

                 ; SBARs in context (NP (NP ...) (SBAR (WHNP|WHPP|WHADV|S ...)))
                 ; should almost certainly be changed to S-REL (relative clauses);
                 ; Similarly in the context (NP (NP ...) (SBAR (S ...))), SBAR
                 ; should become S-REL-NO-THAT. ** An additional case that should
                 ;   be taken care of here is exemplified by "John Doe, 30, who
                 ;   suffered minor injuries, ..."; i.e., we have a sequence
                 ;   (\, \,) (CD ...) (\, \,) after the head NP, and preceding
                 ;   the relative clause. Also, conjunctive possibilities deserve
                 ;   further thought, e.g., "the suspect (,) who ... and who ...", 
                 ;   which presumably gives (SBAR (SBAR ...) (CC and) (SBAR ...)),
                 ;   so that the outer & embedded SBARs should become S-RELs.
                 (when (eq (car (first trees)) 'NP) 
                       (if (and (eq (car (second trees)) 'SBAR)  
                                (member (car (second (second trees)))
                                       '(WHNP WHPP WHADV S) ))
                           (return 
                             (cons 'NP
                               (append (list (preprocess-tree1 (car trees))
                                        (preprocess-tree1 
                                         (cons 'S-REL (cdr (second trees))) ))
                                       (mapcar #'preprocess-tree1 (cddr trees)) ))))
                       ; similarly for (NP (NP ...) (SBAR (S ...))):
                       (if (and (eq (car (second trees)) 'SBAR)
                                (eq (car (second (second trees))) 'S) )
                           (return
                             (cons 'NP
                               (cons (preprocess-tree1 (car trees))
                                 (cons (preprocess-tree1
                                         (cons 'S-REL-NO-THAT (cdr (second trees))))
                                   (mapcar #'preprocess-tree1
                                                      (cddr trees)) ))))) 
                       ; likewise for (NP (NP ...) (\, \,) (SBAR|S ...) ...),
                       ; i.e., the SBAR or S is probably a nonrestrictive S-REL.
                       (if (and (eq (car (second trees)) '\,)
                                (member (car (third trees)) '(S SBAR)) )
                           (return 
                             (cons 'NP
                               (cons (preprocess-tree1 (car trees))
                                 (cons (second trees)
                                   (cons (preprocess-tree1 
                                           (cons 'S-REL (cdr (third trees))))
                                     (mapcar #'preprocess-tree1 
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
             (WHNP (if (equal (first trees) '(IN that)); (WHNP (IN that))?
                       (return                         ; 'IN' should be 'WP' 
                         (cons 'WHNP             
                           (cons '(WP that)
                             (mapcar #'preprocess-tree1 (cdr trees)) ))))
                   (if (and (eq (car (first trees)) 'WP)
                            (cdr trees)
                            (intersection (mapcar #'car (cdr trees)) '(NN NNS)) )
                            ; 'WP' should be 'WDT'
                       (return
                         (cons 'WHNP
                           (cons
                             (cons 'WDT (cdr (first trees)))
                             (mapcar #'preprocess-tree1 (cdr trees)) )))))
             (ADJP ; change (ADJP (VBN ...)), (ADJP (VBG ...)) to (ADJP (JJ ...))
                (setq tree1 tree)
                (if (member (first (first trees)) '(VBN VBEN VBG))
                    (setq tree1 
                      (cons 'ADJP (cons (cons 'JJ (cdr (first trees))) 
                                        (cdr trees) ))))
                ; change any (CD ...) within an ADJP to (JJ ...)
                (if (cdr (find-if #'(lambda (x) (eq (car x) 'CD)) trees))
                    ; if this is non-nil (e.g., '(five)), replace all top-level
                    ; occurrences of type '(CD ...)' by '(JJ ...)'
                    (setq tree1
                      (cons 'ADJP
                        (mapcar #'(lambda (x) 
                                   (if (eq (car x) 'CD) (cons 'JJ (cdr x)) x) )
                                  trees ))))
                (return
                      (cons 'ADJP (mapcar #'preprocess-tree1 (cdr tree1)) )))

            (QP ; change any (CD ...) within a QP to (JJ ...) -- we want
                ; the complete QP phrase, not a part of it, to become a
                ; quantifier; we treat a QP as an ADJP to begin with, but
                ; in the NP semantics we type-shift it to become a quantifier;
                (setq tree1 tree)
                (if (cdr (find-if #'(lambda (x) (eq (car x) 'CD)) trees))
                    ; if this is non-nil (e.g., '(five)), replace all top-level
                    ; occurrences of type '(CD ...)' by '(JJ ...)'
                    (setq tree1
                      (cons 'ADJP
                        (mapcar #'(lambda (x) 
                                   (if (eq (car x) 'CD) (cons 'JJ (cdr x)) x) )
                                  trees ))))
                (return
                      (cons 'QP (mapcar #'preprocess-tree1 (cdr tree1))) ))
                 
             (X ; appears all too often in Brown corpus!
                (if (null (cdr trees)); X with a single daughter?
                    (if (eq (caar trees) 'PP); for PP daughter, guess adverbial
                        (return
                          (cons 'ADVP
                            (mapcar #'preprocess-tree1 trees) ))
                        ; for non-PP single daughters, delete (X ...) wrapper 
                        (return (preprocess-tree1 (car trees))) )
                    ; multiple daughters
                    (if (member (caar trees) '(VP AUX)); RHS starts with verb?
                        (return
                          (cons 'VP
                            (mapcar #'preprocess-tree1 trees) ))
                        ; not a VP
                        (if (and (eq (caar trees) 'NP); sentence with null verb?
                                 (member (caadr trees) '(NP PP)) )
                            (return
                              (list
                                 'S
                                 (preprocess-tree1 (car trees))
                                 (cons 'VP
                                   (cons '(V *null-verb*)
                                     (mapcar #'preprocess-tree1 (cdr trees)) ))))
                            ; probably not a sentence with null verb; use 
                            ; 1st-daughter category, if phrasal, in place of X
                            (if (member (caar trees)
                                       '(NP VP PP WHNP ADVP ADJP S SBAR) )
                                (return
                                  (cons (caar trees)
                                    (mapcar #'preprocess-tree1 trees) )))))))
             (NEG ; A new category used in Brown instead of ADVP to embed 
                  ; (RB not), (RB n\'t); Change it to ADVP
                (return (cons 'ADVP (cdr tree))) )
          )
       ; None of the particular cases above caused a result to be returned
       (return (cons root (mapcar #'preprocess-tree1 trees)))
 )); end of preprocess-tree1


(defun repair-rel-clauses (tree); Mar 8/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; NB: Since this program is invoked after 'preprocess-tree1', 
; appropriate SBARs will already have been identified as S-REL;
;
; The general idea is to repair rel-clauses by looking for S-RELs
; in 'tree' and (non-destructively) replacing the category of a 
; WH-like word in each S-REL by the corresponding "-REL"-suffixed
; category; e.g., (WP who) by (WP-REL who). The program at hand just
; looks for the S-REL clauses and hands off the first non-punctuation
; constituent of such clauses to 'find-and-repair-rel-word'. If 
; that subroutine fails, this means that the first nontrivial 
; constituent of the S-REL didn't contain a relative word, i.e., 
; it is an S-REL with an elided initial "that"; so in that case 
; we prepend (WHNP (WP-REL that)). (The 'WHNP' isn't really right
; -- strictly, it should be NP-REL -- but the interpretive process 
; doesn't depend on this distinction, as long as we've used the 
; correct LF at the level of the WP-REL.) ** Another option would
;   be to handle S-RELs with tacit "that" directly...
;
; ** An issue that remains at the time of writing is the filling
;    in of traces (gaps) -- which most parsers coyly omit.
;    But I think I'll add gaps via a general program that
;    also handles questions, wh-nominals, topicalization, ...
;    after other repairs have been made.
;
; We need to handle examples like "the man whose dog bit me",
; "the man who/that arrived", "the man (whom/that) I saw", "the 
; thing (that/which) I like", ?"the man whose this is" "the time
; when he arrived", "the reason why he came", ??"the way how he
; did it". The relative words here could be respectively termed
; a possessive determiner, a pronoun (2 e.g.'s), a possessive 
; pronoun, and an adverb (2 e.g.'s). However, rather than being
; question words they are relative words. For example, "who" in
; "the man who arrived" does not mean "which person", i.e.,
; <wh person> (as in a question), but rather <the (:l x [[x person]
; and [x=r]])>, where r is a special variable. Hmm, but what if
; we used this same LF for questions, and then lambda-abstracted
; r at the top level, to get the question as a lambda-form? Well,
; it wouldn't work for "Who loves whom?", where we would need to
; abstract two different variables. 
;
;   [** Aside: Could Liang et al's "routing operators" in their
;   program-learning work be deployed here somehow? Then we
;   wouldn't have any lambdas, just operators that route a value (to
;   which an expression is applied) to one place or another. Hmm, I
;   guess when we shunt in a value, we cover our tracks, eliminating
;   the routing directives we followed? That would be the analogue
;   of lambda conversion. Certainly the routing formalism allows
;   for multiple arguments (we use a sequence of routing symbols at
;   each node, one symbol per argument); but this isn't simpler than
;   lambda abstraction -- instead of a sequence of lambda variables,
;   we have a sequence (same length) of routing symbols. The only
;   advantage would be that "open slots" are all just the identity
;   function, not different, arbitrary variables. In other words, 
;   it's a variable-free formalism.]
;
;   [Originally, I was going to particularize rel-clauses to S-RREL
;   (restrictive relatives) and S-NREL (nonrestrictive relatives),
;   in addition to changing the embedded relative word (determiner,
;   pronoun, possessive pronoun, or adverb to its REL form (i.e.,
;   from WDT, WP, WP$, WRB to WDT-REL, WP-REL, WP$-REL, or WRB-REL)
;   But now I think it best to leave the distinction between
;   restrictive and nonrestrictive relatives to postprocessing,
;   especially since it's just a matter of applying the (:a ...)
;   component either to the NP as a whole or to the variable
;   abstracted from the N1.
;
;   I was going to assume that a relclause is nonrestrictive iff either
;   (a) the relclause occurs as (NP (NP ...) (\, \,) (S-REL ...)),
;   or with the intervening comma replaced by some other punctuation
;   such as (\: --) or (\: \;); or (b) the preceding NP is a pronoun 
;   or name (proper noun). (** I also thought of considering cases
;   where a singular count noun occurs without determiner, as in 
;   "head for home where he would feel safe", "would do it next day 
;   which was his day off"; such nominals function a lot like pronouns.)
;   Anyway, the (abortive) start of the code for distinguishing S-RREL
;   and S-NREL is in 
;   'restrictive-and-nonrestrictive-relclauses-abandoned-code-start.lisp']
;
 (prog (root trees nontrivial-trees success)
       (if (atom tree) (return tree))
       (setq root (car tree))
       (setq trees (cdr tree))
       (if (not (eq root 'S-REL))
           (return (cons root (mapcar #'repair-rel-clauses trees)))
           ; We have an S-REL:
           (cond ((eq (caar trees) 'S-REL); coordinated S-RELs, or
                                          ; postmodified S-REL?
                  (return (cons 'S-REL 
                            (mapcar #'repair-rel-clauses trees) )))
                 ; S-REL is not conjunctive or postmodified:
                 ; *** THE FOLLOWING STUFF NEEDS TO GO WHEREVER S-RELs
                 ;     ARE IDENTIFIED.
                 (T (setq nontrivial-trees; skip punctuation
                      (member-if-not 
                         #'(lambda (x) 
                             (or (atom x)
                                 (member (car x) 
                                   '(\' |''| \, |``| |:| - -- -LRB- -RRB-) )))
                         trees ))
                    (setq success; try to repair the 1st nontrivial
                                 ; constituent of the S-REL:
                      (find-and-repair-rel-word (car nontrivial-trees)) )
                    (if success; reassemble any punctuation, plus the
                               ; constituent with the repaired rel-word,
                               ; plus the (if necessary, repaired)
                               ; remaining constituents
                        (return
                          (append 
                            (cons 'S-REL 
                               (butlast trees (length nontrivial-trees)) )
                            (mapcar #'repair-rel-clauses nontrivial-trees) )))
                   ; Failure to repair a rel-word in the first nontrivial
                   ; constituent implies that this is an S-REL with a
                   ; silent "that"; so change S-REL to S-REL-NO-THAT.
                   ; [** Can I be sure that I'll have formed an S-REL in
                   ; the prior, general preprocessing, even when there's
                   ; no "that" or WH-phrase???]
                   ; *** THIS ALSO SHOULDN'T BE NEEDED IF, IN IDENTIFYING
                   ;     S-RELs, I ALREADY DO THIS INSERTION.
                   (return; keep the initial punctuation, because it could be
                          ; a quote or a left bracket, needing to be balanced
                     (cons 'S-REL-NO-THAT
                        (append
                          (butlast trees (length nontrivial-trees))
                          (mapcar #'repair-rel-clauses nontrivial-trees) ))))))
 )); end of repair-rel-clauses


(defun find-and-repair-rel-word (rel-phrase) ; Mar 8/10; Sep 29/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; 'rel-phrase' is the 1st non-punctuation RHS constituent of a relative
; clause and thus -- unless we have a relclause headed by a silent 'that' --
; its treebank parse will contain a wh-word, which actually should be 
; a relative word. So in that case WDT-REL, WP-REL, WP$-REL, and WRB-REL
; need to be substituted for WDT, WP, WP$, and WRB respectively.
;
; So check if rel-phrase is one of the types of WH-phrases that treebank
; parsers are expected to produce, or, failing that, whether it contains 
; a constituent at some level, not embedded clausally, that contains
; such a WH-constituent. In either case, change the constituent to
; contain a REL-word in place of the WH-word.
;
; If there is no such REL-word, return NIL, indicating that 
; 'rel-phrase' comes from a relclause with an elided 'that'
;
; Note that the rel-words that can occur at the top level are a
; superset of those that can occur at a deeper level. For example,
; 'that', 'where', 'when', 'whereunder, etc., can only occur at the
; top level. Thus the processing at the top level is somewhat different
; than in the subroutine 'find-and-repair-embedded-rel-word' that is
; called for subconstituents of rel-phrase if necessary.
;
 (prog (XP POS word phrases rest init ph result)
       ; Is rel-phrase (WP ...) (erroneous), (IN that) 
       ;   [(in that) is erroneous but is sometimes produced by the 
       ;   Charniak parser. Unfortunately, the Charniak parser insists 
       ;   on parsing "that" after an NN as (IN that), & then insists
       ;   on parsing an immediately following intransitive verb like 
       ;   "sneezed" or "roared" as (NP (JJ <verb>)), so as to make it 
       ;   the subject of the "SBAR" clause!  Transitive verbs in 
       ;   relative clauses lead to other types of screw-ups; e.g., 
       ;   in "The lion that killed the deer is dead", the rel-clause
       ;   does contain an initial WHNP, but the rest is bizarre -- a 
       ;   "sentence", "the deer is dead" is formed, and this is treated 
       ;   as the object of "killed" -- which is built into a sentence 
       ;   with no subject! The Stanford parser does best, getting 
       ;   "The lion that roared is dead" right, though it says the 
       ;   rel-clause (SBAR) consists of (WHNP (WDT that)) and a 
       ;   subjectless sentence, "roared".] 
       ; (NP (WP that)), (NP (WP who)), (NP (WP\$ whose) (NN...)) (Brown
       ; -- erroneous, should be WDT), (WHNP (WP\$ whose) (NN...)) 
       ; (Charniak -- better, but still erroneous, WP\$ should be WDT); 
       ; ((NP (WDT which)) (erroneous -- should be WP, to be changed to 
       ; WP-REL), (ADVP (WRB where)), (ADVP (WRB whereby)), (& similarly 
       ; "why", "wherever", "whenever" -- no (WHADVP ...) in Brown, 
       ; but the Charniak parser has, e.g., (SBAR (WHADVP (WRB why)) 
       ; (S (NP (PRP he)) (VP (VBD sneezed)))) (which could be derived 
       ; from when, where, whereby, wherever, whenever, or somewhat
       ; ungrammatically "why" or "how", or some more deeply embedded
       ; relative word), or ...
       ;
       (if (equal rel-phrase '(WP that)); unexpected (faulty -- non-phrasal)
           (return '(WHNP (WP-REL that))) )
       (if (eq (car rel-phrase) (caadr rel-phrase)); e.g., (WHPP (WHPP ...) ...)
                                    ; as in "for whom, or with whom, he works"
           (return 
             (cons (car rel-phrase)
                   (mapcar #'(lambda (x) ; recursively process conjuncts
                               (if (eq (car x) (car rel-phrase)); e.g., WHPP
                                   (find-and-repair-relword x) x)) 
                            (cdr rel-phrase) ))))

       ; If we do not at least have a phrase of form (blah (blah blah ...)...)
       ; at this point, there can be no embedded rel-word; signal this to
       ; 'repair-rel-clauses' by returning nil: 
       (if (not (and (car rel-phrase) (caadr rel-phrase) (cadadr rel-phrase)))
           (return nil) )

       ; At this point we're likely to be looking at something like,
       ; e.g., (WHNP (WP who)), (WHNP (WDT whose) (NN house)) (or something 
       ; at least of form (blah (blah blah ...)...))
       ;
       ; pull out initial pieces for testing if there is a top-level wh-word
       (setq XP (car rel-phrase) 
             POS (caadr rel-phrase) 
             word (cadadr rel-phrase) ); at least it's *expected* to be a word
       (when (null (cddr rel-phrase)); e.g., (WHNP (WP who)), (WHNP (WP\$ whose)),
                                     ;       (ADVP (WRB where))
          (if (and (member XP '(WHNP NP))
                   (member POS '(WP WDT)); WDT would be an error, but ...
                   (member word '(that who whom which)) )
              (return `(WHNP (WP-REL ,word))))
          (if (and (member XP '(WHNP NP))
                   (member POS '(WP WP\$ WDT))
                   (eq word 'whose) )
                   ; "whose" is a remote top-level WP\$-REL possiblity 
                   ; (e.g., "I've identified the customer whose this is")
              (return '(WHNP (WP\$-REL whose))))
          (if (and (member XP '(ADVP WHADVP)); ADVP would be an error, but...
                   (eq POS WRB); the following can occur as top-level rel-words
                   (member word '(why when where whereabout whereby wherein 
                                  wherewith whereunder whereto whereof 
                                  wherefore whereupon whence whither)) )
                   ; "how", "wherever", "whenever" are very remote possibilities
                   ; omitted here (e.g., ?"the way how he did it", ??"the times
                   ; whenever he felt bad")
              (return `(WHADVP (WRB-REL ,word)))) )
       ; If we reach this point, we may have a wh-phrase of 2 words or more like 
       ;        (WHNP (WDT whose) (NN house)),
       ; or else the wh-word is more deeply embedded; deal with the former:
       (if (and (member XP '(NP WHNP))
                (member POS '(WP\$ WDT))
                (eq word 'whose) 
                (find-if #'(lambda (x) (member (car x) '(NN NNS NNP)))
                         (cddr rel-phrase) ))
           (return (append '(WHNP (WP\$-REL whose)) (cddr rel-phrase))) )

       ; Now deal with cases where the relative word is embedded deeper
       ; in rel-phrase. (*Could* it also appear in the phrase *following* 
       ; rel-phrase? No ....)
       ;
       ; So, look for a wh-word within a constituent, BUT NOT A CLAUSAL 
       ; CONSTITUENT, of rel-phrase. E.g., we should *not* change 
       ; (WRB when) to (WRB-REL when) in "[The woman] (S-REL (NP (PRP he))
       ; (VP (VBD noticed) (SBAR (WHADV (WRB when)) (NP (PRP she)) (VP 
       ; (VBD left))))). Similarly, in relative clauses like "the man
       ; I told who to talk to", or "the man I gave the advice which
       ; house to buy to", we should not mistake the "who" or "which"
       ; for rel-words. (The rel-word is in fact an elided "that".)
       ;
       ; This is taken care of by 'find-and-repair-embedded-rel-word',
       ; which returns nil for clausal constituents.
       ;
       ; The first admissible occurrence should be changed to contain
       ; the appropriate relative word much as above (WDT-REL, WP-REL,
       ; WP$-REL; I think WRB-REL can't occur).  If there is no such 
       ; REL-word, there must be an elided initial 'that'.
       
       ; Search constituents in sequence till success or constituent 
       ; exhaustion; 'init' are the initial constituents (in reverse
       ; order) not containing a rel-word:
       (setq rest (cdr rel-phrase) init nil)
       (dotimes (i (length (cdr rel-phrase)))
          (setq ph (pop rest))
          (setq result (find-and-repair-embedded-rel-word ph))
          (if result ; result = ph with rel-word repaired?
              (return (cons (car phrase)
                            (append (reverse init)
                                    (cons result rest) )))
              (push ph init) ))

       ; No embedded rel-word was found ==> elided 'that';
       ; Return nil as a signal to 'repair-rel-clauses' that it
       ; must be looking at a rel-clause with silent 'that'
       (return nil)
 )); end of find-and-repair-rel-word
           


(defun find-and-repair-embedded-rel-word (phrase); Aug 22/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;
; This is much like 'find-and-repair-rel-word', but guards against
; looking for a rel-word in a clausal phrase, and does not look
; for rel-words that can only occur at the top level of a relative
; clause, such as 'that' and 'where'. If it fails to make a repair 
; at the top level, it recurses to deeper levels. If it fails
; altogether, it returns nil.
;
 (prog (XP POS word rest ph init result)
       (if (not (listp phrase)) (return nil)); nothing found
       
       ; If phrase is clausal, fail
       (if (or (member (car phrase) '(S SBAR Q WHQ SINV))
               (and (car phrase) (symbolp (car phrase))
                    (starts-with (coerce (string (car phrase)) 'list) '(#\S)) ))
           (return nil) ); fail

       ; Coordinated rel-phrases?
       (if (eq (car phrase) (caadr phrase)); e.g., (WHPP (WHPP ...) ...)
                                    ; as in "for whom, or with whom, he works"
           (return
             (cons (car phrase)
                   (mapcar #'(lambda (x) ; recursively process conjuncts
                               (if (eq (car x) (car phrase)); e.g., WHPP
                                   (find-and-repair-embedded-rel-word x) x))
                           (cdr phrase) ))))

       ; pull out initial pieces for testing whether there is
       ; a top-level wh-word
       (when (and (car phrase) (caadr phrase) (cadadr phrase))
             ; e.g., (WHNP (WP whom)), (WHNP (WDT whose) (NN house))
             ; (or something at least of form (blah (blah blah ...)...))
             (setq XP (car phrase)
                   POS (caadr phrase)
                   word (cadadr phrase) ); in the cases of interest, it's a word
             (if (and (null (cddr phrase)); e.g., (WHNP (WP who)), (ADVP (WRB where))
                      (member XP '(WHNP NP))
                      (member POS '(WP WDT)); WDT would be an error, but ...
                      (member word '(who whom which)) )
                 (return `(WHNP (WP-REL ,word))) )

             ; At this point, we may have a 2-or-more-words wh-phrase like 
             ;        (WHNP (WDT whose) (NN house)),
             ; or else the wh-word (if any) is more deeply embedded;
             (if (and (member XP '(NP WHNP))
                      (member POS '(WP\$ WDT))
                      (eq word 'whose)
                      (find-if #'(lambda (x) (member (car x) '(NN NNS NNP)))
                               (cddr phrase) ))
                 (return (append '(WHNP (WP\$-REL whose)) (cddr phrase))) )
      
             ; More deeply non-clausally embedded wh-phrase. 
             ; Non-clausal, so search constituents in sequence till
             ; success or constituent exhaustion; 'init' are the initial
             ; constituents (in reverse order) not containing a rel-word:
             (setq rest (cdr phrase) init nil)
             (dotimes (i (length (cdr phrase)))
                (setq ph (pop rest))
                (setq result (find-and-repair-embedded-rel-word ph))
                (if result ; result = ph with rel-word repaired?
                    (return (cons (car phrase)
                                  (append (reverse init)
                                          (cons result rest) )))
                    (push ph init) ))
             (return nil) ); failure for all constituents
 )); end of find-and-repair-embedded-rel-word
   

(defun starts-with (word chars); Aug 22/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Check whether the word 'word', given as a list of characters,
; starts with the characters `chars'
 (do ((rest word) (cc chars))
     ((or (null cc) (null rest))
      (if (null cc) T nil) )
     (if (not (char-equal (pop rest) (pop cc)))
         (return-from starts-with nil) )))


(defun make-auxiliary-VP (tacit-VP); Dec 10/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; tacit-VP has an initial AUX constituent (such as (AUX (VBZ has)))
; plus further constituents. Make these into a VP whose head is an 
; appropriate type of AUX constituent (e.g., (AUX have), (AUXZ has), 
; (AUXD had), etc.) and whose remaining constituents are those 
; following the original AUX constituent. Auxiliary "TO" remains 
; "TO" and modal "MD" remains "MD". These transformations are needed 
; for transforming explicit VP-initial AUX constituents in the Brown 
; Corpus.
; *** July 25/11: BUT THIS SEEMS RIGHT ONLY FOR AUXILIARIES *AFTER*
;     THE FIRST ONE; IF WE HAVE (VP (AUX (VBD WAS) (AUX (VBG BEING)) ...))
;     (WHERE tacit-VP WILL BE THE CDR OF THIS), WE DON'T WANT TO GET
;     (VP (VP (AUXD WAS) (AUX (VBG BEING)) ...)), OR RECURSIVELY,
;     (VP (VP (AUXD WAS) (VP (AUXG BEING) ...))); AM I MISUNDERSTANDING
;     THE CODE (OR FORMS OF BROWN TREES MOTIVATING THIS?
;
  (let* ((head (second (first tacit-VP)))
         (vtype (first head))
         (verb (second head))
         (aux-variant
            (case vtype
                  (TO 'TO) (MD 'MD) (VB 'AUX) (VBD 'AUXD)
                  (VBZ 'AUXZ) (VBP 'AUXP) (VBN 'AUXEN)
                  (POS 'AUXZ) ; erroneous construct in Brown: "A guy's 
                              ; gotta...", which *isn't* possessive!!
                  (T vtype) )))
         (cons 'VP (cons (list aux-variant verb) (cdr tacit-VP)))
 )); end of make-auxiliary-VP

(defun contract-a-few (np); Oct 28/10
;~~~~~~~~~~~~~~~~~~~~~~~~~
; Contract (DT A) (JJ few) in a NP into (DT a-few); return nil if
; there is no such intitial sequence;
;
 (if (and (equal (third np) '(JJ few)) (equal (second np) '(DT a)))
     (cons (car np) (cons '(DT a-few) (cdddr np))) 
 )); end of contract-a-few


(defun change-extra-det-to-jj-or-adjp (np); Oct 28/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Replace CD or QP, coming after anything but a predeterminer, by JJ or
; ADJP respectively; return nil if there is no such internal CD or QP. 
; Assumption: there's at most 1 such internal CD or QP; e.g., 
;    (NP (DT The) (CD five) (NNS refugees)), or
;    (NP (DT The) (QP (RB nearly) (CD 1000)) (NNS refugees)).
;
 (let ((tail (member-if #'(lambda (x) (member (car x) '(CD QP))) (cddr np))))
      (if (or (null tail) 
              (and (eq (car (second np)) 'PDT); is there a predeterminer, &
                   (equal tail (cddr np)) )); is the CD right after the PDT?
          nil ; no change needed
          (append (butlast np (length tail)); otherwise, make the change
                  (cons (cons (if (atom (second (first tail))) 'JJ 'ADJP)
                              ; substitute for CD or QP (distinguishable by
                              ; the forms (CD <atom>) vs. (QP <list> ...))
                          (cdr (first tail)) )
                        (cdr tail) )))
 )); end of change-extra-det-to-jj
   

(defun change-initial-count-jj-to-cd (np); Oct 28/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Replace JJ|JJR|JJS by CD in NP-initial (JJ|JJR|JJS several|
; many|few|much|little|numerous|more|most|less|fewer|enough).
; If there is no initial count-JJ, return nil;
;
 (if (and (member (car (second np)) '(JJ JJR JJS))
          (member (second (second np)) '(several many few much little 
                               numerous more most less fewer enough )))
     (cons (car np)
           (cons (cons 'CD (cdr (second np))) (cddr np)) )
 )); end of change-initial-count-jj-to-cd
                  

(defun change-initial-count-adjp-to-qp (np); Oct 28/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Replace initial ADJP with head "several|many|few|...|enough"
; (see above) in an NP by QP; e.g., (ADJP (RB far) (JJR fewer))
; as initial constituent becomes (QP (RB far) (JJR fewer));
; this provides a signal to 'derive-phrase-lf' that a type-shifting
; operator needs to be applied to the ADJP to make it a determiner.
;
 (prog (tree1 trees)
   (if (listp np) (setq trees (cdr np)) (return nil))
   (if (and (eq (car (second np)) 'ADJP)
            (find-if 
            #'(lambda (x) 
                (and (member (car x) '(JJ JJR JJS))
                     (member (second x) '(several many few much little
                               numerous more most less fewer enough ))))
              (cdr (second np)) ))
                    
       (setq tree1 (cons 'np 
                      (cons (cons 'QP (cdr (second np))) (cddr np)) )))
   ; tree1 = NIL if no initial count ADJP was found;
   ; (Needed to avoid run-away recursion in the calling program)
   (return tree1)
 )); end of change-initial-count-adjp-to-qp


(defun combine-nominals (np cats); Oct 28/10; Oct 30/10; briefly tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Flatten NN(S) or NNP(S) sequences (more exactly, merging the
; specified categories, 'cats') into multiword nominals; return
; NIL if no multiple nouns were combined. N.B.: we collapse only the
; leftmost nominal sequence, but the routine will be called repeatedly 
; by the preprocess-tree1 routine if a change is actually made
; (until no more changes are possible).
;
 (if (or (null (cddr np)); only one constituent? Or other speedy exits:
         (and (null (cdddr np)) ; 2 constituents, 1st is not nominal;
              (not (member (caadr np) cats)))
         (< (count-if ; fewer than 2 nominals?
             #'(lambda (x) (member (safe-car x) cats)) np ) 2 ))
         ; exit at once
     (return-from combine-nominals nil) )

 (let ((i 0) (j 0) nn-seq)
      ; find largest leftmost sequence of nominals of length 2 or more,
      ; setting i, j so that the ith and jth list elements of np are
      ; the 1st and last sequence elements
      (dolist (x np)
         ; while j=0, i is not at a potential sequence beginning
         (if (zerop j) (incf i))
         (if (member (safe-car x) cats)
             (if (zerop j) (setq j i) (incf j)); 1st or additional nominal?
             (if (= i j) (setq i (1+ i) j 0)) )); 1 or 0 nominals? (re)start j
      (when (> j i)
         (setq nn-seq (subseq np (1- i) j))
         (setq nn-seq (cons (caar (last nn-seq))
                      (mapcar #'second nn-seq) ))
         (append (subseq np 0 (1- i)); prefix of np, preceding nominals
                 (cons nn-seq (nthcdr j np)) ))
 )); end of combine-nominals

        
(defun safe-car (x) (if (listp x) (car x))); Oct 30/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(defun safe-first (x) (if (listp x) (car x))); Oct 30/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(defun safe-second (x) (if (listp x) (cadr x))); Oct 30/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(defun safe-third (x) (if (listp x) (caddr x))); Oct 30/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(defun safe-fourth (x) (if (listp x) (cadddr x))); Oct 30/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(defun safe-fifth (x) (if (listp x) (caddddr x))); Oct 30/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
(defun safe-cdr (x) (if (listp x) (cdr x))); Oct 30/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
(defun safe-cddr (x) (if (listp x) (cddr x))); Oct 30/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
(defun safe-cdddr (x) (if (listp x) (cdddr x))); Oct 30/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
(defun safe-cddddr (x) (if (listp x) (cddddr x))); Oct 30/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
(defun safe-cdddddr (x) (if (listp x) (cdddddr x))); Oct 30/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(defun change-participle-to-adjective-in-np (np-tree); Dec 27/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; np-tree: a Treebank-style tree of form (NP ... (<VBN or VBG> <word>) ...)
;
; Replace the (<VBN or VBG ...) by (NNS ...) if it is last in the NP (unexpected
; case), and by (JJ ...) otherwise (the expected case)
;
 (let* ((tail (member-if
                  #'(lambda (x) (and x (listp x) (member (car x) '(VBN VBG))))
                    (cdr np-tree) ))
        (head (butlast np-tree (length tail))) )
        (if (eq (length tail) 1)
            (append head (list (cons 'NNS (cdar tail))))
            (append head (cons (cons 'JJ (cdar tail)) (cdr tail))) )))

; NOT USED AT THIS TIME -- NOV 16/10
(defun isa-vp-pastprt-or-progprt (vp-tree); Oct 19/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; vp-tree: a Treebank-style tree 
;
; Is it of form (VP <non-verb>* (<VBN or VBG> <word>) ...)?
;
; This is used to help detect subjectless relative clauses and adverbials
; (which may not have been parsed as SBARs or S's by the Treebank parser).
; The LFs for such phrases involve the addition of referential temporal
; modifiers; e.g., "John, driving to work" involves a meaning like
; (skipping colons) (L x (at <that time> (prog [x drive (to (K work))]))).
; But we add the temporal qualifier at the level of the reduced relative
; or adverbial, not at the level of the VP. (But this may require adding
; a level of phrase structure, if the VP was not recognized as a reduced 
; relative or adverbial -- see 'modify-participial-phrases'.)
;
 (let* ((tail (member-if ; scan to first verb (V, AUX, or BE)
                  #'isa-type-of-verb (cdr vp-tree) ))
        (pos (if tail (caar tail) nil)) )
       (member pos '(VBN VBEN VBG))
 )); end of isa-vp-passprt-or-pasvprt


; COMMENTED OUT BECAUSE IT SEEMS UNNECESSARY TO WRAP ANY DISTINCT
; PHRASAL TYPE (LIKE ADVP) AROUND PARTICIPIAL VPs USED AS MODIFIERS --
; IN PARTICULAR, THE 'PROG' OPERATOR IS NOT CALLED FOR FOR -ING
; PARTICIPLES, AND THE MEANING AS ADVP CAN BE FLESHED OUT BY THE
; INTERPRETIVE RULES IN THE CONTEXTS IN WHICH THESE VPs OCCUR.
; (defun modify-participial-phrases (tree); Oct 19/10
; ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; ; tree: a Treebank tree, probably after the main preprocessing pass.
; ;
; ; Identify VPs among the constituents of 'tree' (and by recursion, among
; ; their subconstituents) that *don't* have a verb as sister to the left
; ; (i.e.,  not ones like the bracketed VP in "I kept [eating my dinner]"). 
; ; These seem to be reduced relative clauses and adverbials. E.g.,
; ;   "John, thinking he was alone"; "Mary, delayed by the rain, ...";
; ;   "Seeing her chance, she..."; "Delayed by the rain, Mary ...";
; ; For those VPs, 
; ; 
; ; (***Some S's and SBARs with a participial VP will be modified --
; ; --still need to check if this is generally ok. It *is* ok for
; ; phrases such as "John, wearing a sweater" misparsed as S's.
; ; Is it also ok for, e.g., "He saw [Mary smiling]", assuming 
; ; "Mary smiling" has been parsed as an S?))
; ;
; ;
;  (let (preceded-by-verb; a boolean flag
;        result; a recursively processed phrase
;        eert ; a backward tree (i.e., reversed at the top level)
;        vp )
;  
;       (if (not (member-if #'listp tree)); for speed, bypass lexical items
;           (return-from modify-participial-phrases tree) )
;       (dolist (x tree)
;          (cond ((atom x) (push x eert)); probably the initial element only
;                ((not (symbolp (car x))); unexpected condition;
;                 (if (isa-type-of-verb (list (leftmost-atom x)))
;                     ; even more unexpected, but...
;                     (setq preceded-by-verb T) ); set verb flag just in case
;                 (setq result (modify-participial-phrases x)); recurse on x
;                 (push result eert) )
;                ((isa-type-of-verb x) (setq preceded-by-verb T)
;                 (push x eert) )
;                ((eq (car x) 'VP); if not preceded by a verb, may need to change
;                 (if (not preceded-by-verb)
;                     (when (isa-vp-pastprt-or-progprt x); is the VP a participle?
;                       (setq vp ; ****TBC -- we need to wrap something around this,
;                                ;     if (car tree) isn't already an SBAR or relclause
;                                ;     or adverbial. But we also need to be able to
;                                ;     recognize that an adverbial is of type 
;                                ;     participle in order to add the temporal modifier
;                                ;     in 'derive-phrase-lf' -- I think? Although we
;                                ;     could just dig down a bit in the advl or whatever
;                                ;     before applying 'find-parts'... as I do in a number
;                                ;     of cases (not quite compositional, but that's for
;                                ;     lack of features). In fact I could again use
;                                ;     'isa-vp-pastprt-or-progprt'!
;                          
;                     (setq vp x) )
;                 (setq result (modify-participial-phrases vp))
;                 (push result eert) )
;                (T; not a verb or VP: recurse & push constituent
;                 (setq result (modify-participial-phrases x))
;                 (push result eert) )))
;       (reverse eert) 
;  )); end of modify-participial-phrases
;        
               
(defun isa-type-of-verb (pair); Oct 20/10
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Check if 'pair' is a list starting with an atom that isa V, AUX, or BE
; Also works if there's just one symbol in 'pair', or more than 2.
;
 (and pair (listp pair) (symbolp (car pair))
   (or (isa (car pair) 'V) (isa (car pair) 'AUX) (isa (car pair) 'BE) )))


(defun particularize-pp (pp-tree); Apr 8/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Modify the given PP-phrase structure tree (generally of form (PP (IN ..)
; (NP ...))) so that (a) cliches like "by means of" are replaced by multi-
; word prepositions; (b) PP is replaced by PP-OF, PP-TO, PP-IN, etc., if
; the NP is not recognizable as temporal; (c) PP is replaced by PP-IN-TIME,
; PP-ON-TIME, PP-AT-TIME, etc., if the NP is recognizable as temporal.
; The particular PP-types have PP as value of their 'isa property. 
; (This could be set here, but to avoid repetition is set by a global
; mapcar -- see initializations.)
; 
 (prog (words n phrase-type pp-type pp-tree1)
       ; Replace 2-, 3-, and 4-word PP cliches by multiword prepositions
       ; 2-word examples: in love, at war, on trial (these become ADJPs),
       ;   of course, at least, in fact, in time, at all (these become ADVPs)
       ; 3-word examples: in front of, on top of (these remain PPs), in charge
       ;   of, at war with, in sight of (these become ADJPs), by means of, in 
       ;   spite of, on behalf of, for lack of, on account of, in light of, 
       ;   in terms of (these become ADVPs)
       ; 4-word examples: by the name of, at the request of, as a matter of, ...
       (setq words (extract-first-n-words pp-tree 4)); extract up to 4 words
       (case (length words)
             (2 (if (member words *pp2-adjp-cliche-list* :test #'equal)
                    ; replace the two words by an ADJP with a 2-word adjective
                    ; (since they can't function as adverbials)
                    (return (list 'ADJP (cons 'JJ words))) )
                (if (member words *pp2-advp-cliche-list* :test #'equal)
                    ; replace the two words by an ADVP with a 2-word adverb
                    (return (list 'ADVP (cons 'RB words))) ))
             (4 (cond ((member words *pp4-cliche-list* :test #'equal)
                       (setq n 4 phrase-type 'pp) )
                      ((member words *pp4-advp-cliche-list* :test #'equal)
                       (setq n 4 phrase-type 'advp) )
                      (T (setq words (butlast words) n 3)
                         (cond ((member words *pp3-cliche-list* :test #'equal)
                                (setq phrase-type 'pp) )
                               ((member words *pp3-adjp-cliche-list* :test #'equal)
                                (setq phrase-type 'adjp) )
                               ((member words *pp3-advp-cliche-list* :test #'equal)
                                (setq phrase-type 'advp) ))))
                ; If `phrase-type' received a value, we have a 3- or 4-word
                ; cliche PP, to be rewritten with a multi-word preposition,
                ; and with the outermost phrase type a (specialized) PP,
                ; or an ADJP or ADVP:
                (when phrase-type
                      (setq pp-type (make-multiword "-" (cons 'PP words)))
                      (setf (get pp-type 'isa) 'PP)
                      (setq pp-tree1 (list pp-type (cons 'IN words)
                                           (third (third (third pp-tree))) ))
                      (case phrase-type
                            (pp (return pp-tree1))
                            (adjp (return (list 'ADJP pp-tree1)))
                            (advp (return (list 'ADVP pp-tree1))) ))))

       ; Adverbially modified PP? Use recursion
       (when (member (first (second pp-tree)) '(ADVP RB))
             (setq pp-tree1 (particularize-pp (cons 'PP (cddr pp-tree))))
             (return (cons (first pp-tree1)
                           (cons (second pp-tree) (cdr pp-tree1)) )))
       ; Preposition mislabelled as (TO TO)? (It should be (IN TO); TO is 
       ; also used as label for infinitive TO!) Use recursion
       (if (eq (first (second pp-tree)) 'TO)
           (return (particularize-pp
                     (cons 'PP (cons '(IN TO) (cddr pp-tree))) )))
       ; Now particularize PP
       (when (eq (first (second pp-tree)) 'IN)
             (setq pp-type
                   (intern (concatenate 'string "PP-"
                                 (string (second (second pp-tree))) )))
             (if (temporal-np (third pp-tree))
                 (setq pp-type
                       (intern (concatenate 'string (string pp-type) "-TIME")) ))
             (return (cons pp-type (cdr pp-tree))) )
       ; PP has unexpected form -- return unchanged
       (return pp-tree)
 )); end of particularize-pp

(defun temporal-np (np-tree); Apr 11/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Returns a non-nil result (a temporal word such as TODAY, SATURDAY, or 
; WEEK) iff the NP is recognized as temporal, because of its head word and/
; or other words it contains (e.g., "this week"). The intention is that
; NPs that are normally used as TEMPORAL ADVERBIALS (either by themselves
; or as complement of a preposition like ON, IN, AT or DURING) should yield
; a non-nil result.
;
 (prog (final-n det)
       ; find final NN, NNS, NNP, or NNPS
       (setq final-n
             (find-if #'(lambda (x)
                           (and (listp x) (member (car x) 
                                            '(NN NNS NNP NNPS CD)) ))
                                            ; added Jan 20/13 ^^
                      (cdr np-tree) :from-end t ))
       (if (null final-n) (return nil))
       (if (member (second final-n) '(YESTERDAY TODAY TONIGHT TOMORROW))
           (return (second final-n)) )
       ; Added Jan 20/13 (somewhat riskily):
       (if (likely-year? (second final-n)) 
           (return (second final-n)) ); such integers are usually years C.E.
       (setq det (find-if #'(lambda (x)
                              (and (listp x) (member (car x) '(DT PRP$ WP$ CD)) ))
                            (cdr np-tree) ))
       (if (and (isa (second final-n) 'time) ; (see initializations)
                (or (null det)
                    (member det '(THIS THAT EACH EVERY ALL SOME ONE)) ))
           (return (second final-n)) )
       (if (equal final-n '(NN A \. M \.)) (return '|A.M.|))
       (if (equal final-n '(NN P \. M \.)) (return '|P.M.|))
       (return nil)
 )); end of temporal-np

(defun likely-year? (n); Jan 27/13
;~~~~~~~~~~~~~~~~~~~~~~
; typically encountered years C.E.
 (and (integerp n) (>= n 1900) (>= 2030 n)))

; Aug 12/10 notes on distinguishing S-REL from wh-nominals and adverbials
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; - (NP (NP ...) {(PP ...)} {(\, \,)} (SBAR (WHNP ...) ...) ...) indicates 
;   S-REL; (but note that we may have *nested* SBARs in a conjunction!)
; - (VP ... (SBAR (WHNP ...) ...) ...) indicates a wh-nominal
; - (PP (IN ...) (SBAR (WHNP ...) ...) ...) indicates a wh-nominal
; - (S {(CC ...)}(SBAR (WHNP ...) ...) ..{no NP}.. (VP ...) ...) 
;   indicates wh-nominal
; - I notice that a WHNP may be of form (WHNP (RB ...) (WP what)); e.g.,
;   "exactly what" in "he knew exactly what he was doing"; this is 
;   probably wrong  -- the structure I would ideally want is something like
;      (NP (ADVP (RB exactly)) 
;          (NP (WHS (WHNP (WP what)) (S/WHNP (NP ...) ...)))
;   (cf., "He did exactly that/ exactly the thing he wasn't supposed to")
; - I notice that even when the WHNP is the subject of the rel-clause,
;   the rel-clause is analyzed as (SBAR (WHNP ...) (S (VP ...))) -- so
;   the interpreter will have to expect that extra S-level (or else I
;   should remove it in preprocessing)
; - I notice that the parsed BNC contains SBARQ for questions like
;   "What did the Queen say to you?".
; - an example of deeper embedding of the WH-word:
;   (SBAR (WHNP (DT some) (WHPP (IN of) (WHNP (WDT which)))) (S (VP ...))) 
;
; - (SBAR (IN that) (S ...)) becomes (S-THAT (IN that) (S ...))
; - (SBAR (IN as|while|although|...) (S ...)) becomes 
;   (S-AS|WHILE|ALTHOUGH|... (PS as|while|although|...) (S ...)), I think,
;   because we want to translate e.g., (IN after) differently from (PS after)
;   (cf., "after the storm" vs "after he left")
;   ** TBC -- GIVEN ALL THESE PATTERN TRANSDUCTIONS, I'M STILL WONDERING
;      IF I SHOULDN'T START BY WRITING A PATTERN TRANSDUCTION PROGRAM


(defun particularize-subject-sbar (s-tree); Nov 17-Dec 30/10 (untested)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; [** So far, I haven't tried to make this crash-proof if, for instance
;   atoms turn up where lists are expected.]
; This is aimed at clausal nominals in subject position in 's-tree';
; we don't make explicit here that the resulting specialized clauses
; are nominals -- it will be the responsibility of the interpretive
; patterns in 'derive-phrase-lf' to recognize and appropriately interpret
; these clausal subjects. Particularly tricky issues are distinguishing
; between (SBAR (IN for) ...) clauses like "for Mary to leave" vs. ones
; like "for she was tired"; and (SBAR (IN in) ...) clauses like "in
; whose house he lives" vs. ones like "in order to sleep" (misparsed
; as (PP (IN in) (NP (NN order) (S (VP (TO to) ...))))). Also note that 
; we are not recursing into the lower-level structure of the s-tree; 
; this instead happens in 'preprocess-tree1'.
;
; Particularize sentential subject SBAR to S-WHNP (e.g., if the subject is
;     (SBAR (WHNP (WP what)) (S (NP (PRP he)) (VP (VBZ knows))))), 
; or to S-WHPP (e.g., if the subject is 
;     (SBAR (WHADVP (WRB Why)) (S (NP (PRP he)) (VP (VBD left)))) or
;     (SBAR (WHADVP (WRB When)) (S (NP (PRP he)) (VP (VBD left)))) or
;     (SBAR (WHPP (IN in) (WHNP (WDT what) (NN town))) (S (NP (PRP he))
;       (VP (VBZ lives)))) ),
; or to S-THAT (e.g., if the subject is
;     (SBAR (IN That) (S (NP (PRP he)) (VP (VBD left)))) ),
; or to S-FOR-TO (e.g., if the subject is
;     (SBAR (IN For) (S (NP (PRP him)) (VP (TO to) (VP (VB complain))))) ),
; or to S-WHETHER (e.g., if the subject is
;     (SBAR (IN whether) (S (NP (PRP he)) (VP (VBD left)))) );
; "If" is a less likely alternative ("If he's alive is unknown"; (object
;     position is much more common, e.g., "No-one knows if he's alive"))
; 
 (let ((sbar-etc; look for SBAR, but stop at VP
        (member-if #'(lambda (x) (member (car x) '(SBAR VP))) (cdr s-tree)) ))
      (if (or (null sbar-etc) ; did we find an SBAR subject?
              (eq (caar sbar-etc) 'VP); got to a VP, not to an SBAR
              (eq (caar (member-if #'(lambda (x) (member (car x) '(NP VP)))
                                    ; if sbar-etc has an NP before any VP,
                                    ; then that NP is probably the real subject
                                    (cdr sbar-etc) )) 'NP ))
          s-tree; there's no SBAR subject, so return s-tree unchanged
          (let* ((clause (car sbar-etc)) (phrase (second clause))
                 (prefix (butlast s-tree (length sbar-etc))) )
                (case (car phrase)
                      (WHNP (append prefix
                              (cons S-WHNP (cdr sbar-etc)) ))
                      (WHADVP (append prefix
                                (cons S-WHPP (cdr sbar-etc)) ))
                      (IN (case (second phrase)
                                (that (append prefix
                                        (cons S-THAT (cdr sbar-etc)) ))
                                (whether (append prefix
                                           (cons S-WHETHER (cdr sbar-etc)) ))
                                (for; look for infinitive VP, otherwise this
                                    ; is not a for-to nominal; *very* rare...
                                    (if (and (eq (car (third phrase)) 'S)
                                             (member-if
                                               #'(lambda (x) 
                                                   (and (eq (car x) 'VP)
                                                        (equal (second x)
                                                              '(TO to) )))
                                                 (third phrase) ))
                                        (append prefix
                                           (cons 'S-FOR-TO (cdr sbar-etc)) )
                                        s-tree ))
                                (if (append prefix; we use 'S-IF/WHETHER' because
                                                  ; if-clauses are always parsed as
                                                  ; (SBAR (IN if) ...), and S-IF is
                                                  ; reserved for if-adverbials.
                                        (cons S-IF/WHETHER (cdr sbar-etc)) ))
                                (t s-tree) )); other (SBAR (IN ...) ...) such as
                                             ; "while S", "after S", "whereas S",
                                             ; etc., cannot be nominals even if they 
                                             ; appear to occupy a subject position;
                                             ; they will be preprocessed later,
                                             ; producing e.g., S-WHILE (which is
                                             ; *not* ISA-linked to NP (it's an ADVP))
                      (t s-tree) )))
 )); end of particularize-subject-sbar
                                    

(defun particularize-object-sbar (vp-or-pp-tree); Dec 30-.../10 (untested)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; [** So far, I haven't tried to make this crash-proof if, for instance
;   atoms turn up where lists are expected.]
; This is aimed at clausal nominals in object position in 'vp-or-pp-tree';
; we don't make explicit here that the resulting specialized clauses
; are nominals -- it will be the responsibility of the interpretive
; patterns in 'derive-phrase-lf' to recognize and appropriately interpret
; these clausal objects. 
;
; This is being done by analogy with 'particularize-subject-sbar'.
; ... TBC  ...THIS IS STILL A COPY OF THE PRECEDING ROUTINE
; Again note that 
; we are not recursing into the lower-level structure of the s-tree; 
; this instead happens in 'preprocess-tree1'.
;
; Particularize a verb- or preposition-object SBAR to S-WHNP (i.e.,
; a clausal nominal based on a wh-word; e.g., if the object is
;     (SBAR (WHNP (WP what)) (S (NP (PRP he)) (VP (VBZ knows))))), 
; or to S-WHPP (e.g., if the object is 
;     (SBAR (WHADVP (WRB why)) (S (NP (PRP he)) (VP (VBD left)))) or
;     (SBAR (WHADVP (WRB when)) (S (NP (PRP he)) (VP (VBD left)))) or
;     (SBAR (WHPP (IN in) (WHNP (WDT what) (NN town))) (S (NP (PRP he))
;       (VP (VBZ lives)))) ),
; or to S-THAT (e.g., if the object is
;     (SBAR (IN that) (S (NP (PRP he)) (VP (VBD left)))) ),
; or to S-FOR-TO (e.g., if the object is
;     (SBAR (IN for) (S (NP (PRP him)) (VP (TO to) (VP (VB complain))))) ),
; or to S-WHETHER (e.g., if the object is
;     (SBAR (IN whether) (S (NP (PRP he)) (VP (VBD left)))) );
; "If" is another alternative ("I don't know if he's asleep"; "I wonder
;     if he is asleep"; this seems to occur mostly in negative polarity
;     or question environments).
; Note that "that" and "for" clauses don't seem to occur as preposition
; objects, and whether/if clauses only rarely ("talked about whether ...")
; 
 (let ((sbar-etc; look for SBAR; in the case of a VP, stop at ??
       ; ... TBC -- need to see what SBAR occurrences typically are NPs...
       ;  <the rest is still for clausal subjects>
        (member-if #'(lambda (x) (member (car x) '(SBAR VP))) (cdr s-tree)) ))
      (if (or (null sbar-etc) ; did we find an SBAR subject?
              (eq (caar sbar-etc) 'VP); got to a VP, not to an SBAR
              (eq (caar (member-if #'(lambda (x) (member (car x) '(NP VP)))
                                    ; if sbar-etc has an NP before any VP,
                                    ; then that NP is probably the real subject
                                    (cdr sbar-etc) )) 'NP ))
          s-tree; there's no SBAR subject, so return s-tree unchanged
          (let* ((clause (car sbar-etc)) (phrase (second clause))
                 (prefix (butlast s-tree (length sbar-etc))) )
                (case (car phrase)
                      (WHNP (append prefix
                              (cons S-WHNP (cdr sbar-etc)) ))
                      (WHADVP (append prefix
                                (cons S-WHPP (cdr sbar-etc)) ))
                      (IN (case (second phrase)
                                (that (append prefix
                                        (cons S-THAT (cdr sbar-etc)) ))
                                (whether (append prefix
                                           (cons S-WHETHER (cdr sbar-etc)) ))
                                (for; look for infinitive VP, otherwise this
                                    ; is not a for-to nominal; *very* rare...
                                    (if (and (eq (car (third phrase)) 'S)
                                             (member-if
                                               #'(lambda (x) 
                                                   (and (eq (car x) 'VP)
                                                        (equal (second x)
                                                              '(TO to) )))
                                                 (third phrase) ))
                                        (append prefix
                                           (cons 'S-FOR-TO (cdr sbar-etc)) )
                                        s-tree ))
                                (if (append prefix; we use 'S-IF/WHETHER' because
                                                  ; if-clauses are always parsed as
                                                  ; (SBAR (IN if) ...), and S-IF is
                                                  ; reserved for if-adverbials.
                                        (cons S-IF/WHETHER (cdr sbar-etc)) ))
                                (t s-tree) )); other (SBAR (IN ...) ...) such as
                                             ; "while S", "after S", "whereas S",
                                             ; etc., cannot be nominals even if they 
                                             ; appear to occupy a subject position;
                                             ; they will be preprocessed later,
                                             ; producing e.g., S-WHILE (which is
                                             ; *not* ISA-linked to NP (it's an ADVP))
                      (t s-tree) )))
 )); end of particularize-object-sbar
                                    
 

(defun particularize-sbar (sbar-tree); Apr 8/01; revision Dec 30/10 not tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; When this program is called, many SBARs will already have been changed to
; S-REL, S-WHNP, or S-WHPP because of their occurrence as an NP postmodifier
; (in the case of S-REL), or as a sentential subject or as an immediate verb
; object or prepositional object. Even nominals of type (SBAR (WHADVP ...)
; ...) have been changed to (S-WHPP (WHADVP ...) ...), because we cannot 
; really distinguish WHPP and WHADVP nominals a priori (e.g., "I know WHERE HE
; IS" vs. "I know WHERE HE WORKS"). Note that S-WHNP and S-WHPP are marked as
; nominals (NPs) via ISA links. (** However, the treatment of {how,why,whether}-
; nominals as being of type S-WHPP rather than S-WHADVP, is very dubious.
; For the time being, that's the strategy below as well, but ultimately we
; may need to reinstate S-WHADVP categories at least for {how,why,whether},
; and make this category, too, a nominal, via an ISA link.)
;
; The further conversions of SBARs here should mostly be to clausal adverbials,
; and are made without reference to a larger context, but with attention to the
; initial constituent of the SBAR; e.g., we form S-THAT (generally interpreted
; as a nominal), S-REL (for apparent displaced relatives that weren't "caught"
; in prior processing, S-WHPP (e.g., for displaced how/why-nominals not
; identified as nominals in prior processing), S-WHILE, S-WHEN, S-ALTHOUGH, 
; etc. (interpreted as adverbials).
;
; The given SBAR-phrase structure tree is generally of form 
;     (SBAR (IN ..) (S ...)), or 
;     (SBAR (-NONE- ..) (S ...)), 
; or more rarely (because of prior replacement of rel-clauses & S-nominals),
;     (SBAR (WHNP ...) (S ...)), or
;     (SBAR (WHADVP ...) (S ...)) or 
;     (SBAR (WHPP ...) (S ...)). 
; In the former cases replace SBAR by particular types like S-THAT, S-NO-THAT
; (these are generally interpreted as nominals), or adverbials S-ALTHOUGH, 
; S-IF, S-WHILE, S-WHEN, S-SINCE, S-BECAUSE, S-BEFORE, ..., or a comparative 
; S-THAN or S-AS. [Aug 12/10: **There are also noncomparative S-AS "sentences", 
; e.g., "as required by law", "as mentioned" or "as follows" (clausal adverbials);
; note also that (PS as) can be temporal or reason-giving or referential 
; ("He drank as he drove", "He drank as he was depressed", "He drank, as 
; I mentioned")].
;
; In the latter cases, there may still be nominals, namely when the initial
; constituent is (WRB how), (WRB why) or (WRB whether). OTOH, a when-clause
; not already identified as a nominal subject or object (where unfortunately
; such nominals are usually erroneous) is almost certain to be an adverbial,
; i.e., S-WHEN. A clause of type WHNP, e.g., a which-clause, is almost certain 
; to be a relative clause, even when not immediately postmodifying an NP.
;
 (let (stype init-type)
      ; Type of first constituent? IN, -NONE-, WHNP, WHADVP, WHPP 
      (setq init-type (first (second sbar-tree)))
      (setq stype; particularize type of SBAR
            (case init-type
                  (IN ; this can be an S-THAT, clausal adverbial or comparative
                      ; (e.g., S-AFTER, S-IF, S-BECAUSE, S-AS, etc.)
                       (intern (concatenate 'string "S-"
                                  (string (second (second sbar-tree))) )))
                  (-NONE- 'S-NO-THAT)
                  (WHNP ; such an SBAR, occurring neither as NP-postmodifier nor
                        ; as a subject or object should theoretically be a 
                        ; displaced S-REL, because wh-nominals should not occur
                        ; in non-argument positions (except perhaps in ellipsis)
                        'S-REL )
                  ((WHADVP WHPP); such SBARs also should be nominals only when
                                ; occurring in argument positions, but here we
                                ; nonetheless posit S-WHPP (interpreted as nominals,
                                ; see initial remarks) in some cases, because e.g.,
                                ; "how" does not initiate rel-clauses, and "why"
                                ; and "whether" intuitively should hardly ever
                                ; initiate displaced rel-clauses
                     (case (second (second (second sbar-tree)))
                           ((how why whether) 'S-WHPP); usually nominals, even if not
                                                      ; obviously a subject or object.
                               ; **We use S-WHPP rather than S-WHADVP even for
                               ; {how|why|whether}-nominals, for unity of treatment
                               ; with e.g., where-nominals, for which an a priori
                               ; WHPP/WHADVP distinction is difficult to make
                           (T ; At this point we are probably left with a clausal
                              ; adverbial such as a when- or where-adverbial 
                              ; (** though there's some chance we still have
                              ; a displaced relative, e.g., "He scrubbed the
                              ; place thoroughly WHERE the cat had made a mess";
                              ; refinements may be needed in future.)
                              (intern (concatenate 'string "S-" 
                                        (string (second (second (second sbar-tree)))) 
                              ; this should give results like S-WHEN, S-WHENEVER,
                              ; S-WHERE, S-WHILE (if treated as wh-word), ...
                              ; (** other types? only examination of data will tell)
                  )))))
                                  
                  (otherwise 'SBAR) )); **failure to particularize
      (cons stype (cdr sbar-tree))
 )); end of particularize-sbar


(defun particularize-pres-aux-have (s-tree); Nov 7/10; tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; If the s-tree is of form NP + VP, and the head verb of the VP
; is (AUX have) (as produced by Charniak even in a tensed sentence),
; change (AUX have) to (AUXP have).
;
 (prog ((np-etc (member-if #'(lambda (x) (eq (safe-car x) 'NP)) s-tree))
        vp-etc aux-etc )
       (if (null np-etc) (return s-tree))
       (setq vp-etc (member-if #'(lambda (x) (eq (safe-car x) 'VP)) np-etc))
       (if (null vp-etc) (return s-tree))
       (setq aux-etc 
         (member-if 
           #'(lambda (x) (and (eq (safe-car x) 'AUX) (eq (second x) 'have)))
             (car vp-etc) ))
      (if (null aux-etc) (return s-tree))
      ; We have the situation we're looking for, so return modified
      ; s-tree:
      (return (append (butlast s-tree (length np-etc))
                      (butlast np-etc (length vp-etc))
                      (cons (append (butlast (car vp-etc) (length aux-etc))
                                    (cons '(AUXP have) (cdr aux-etc)))
                            (cdr vp-etc) )))
 )); end of particularize-pres-aux-have

; Aug 12/10: Some notes about S-constituents in the BNC
; - I notice that "has helped him appreciate what others go through"
;   is parsed as containing a *sentential* (i.e., S) complement
;   "him appreciate what ...", with "him" as subject; that could be a pain

(defun particularize-s (s-tree); Apr10/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; If the given sentential phrase structure tree is really an infinitive
; or a progressive participle (represented as an S with an empty subject) 
; or entirely empty (having only a (-NONE- ..) constituent), then change 
; the S header to VP-INF, VP-ING,  or S-NONE, as appropriate. Otherwise 
; leave it as-is.
;
; *** This program should be redone with TTT, allowing some modifiers
;     e.g., between infinitive 'to' or an auxiliary and the VP
;
 (prog (stype init-type); ** void vars (borrowed from particularize-sbar)
       ; Does the S just have a (-NONE- ..) constituent?
       (if (and (eq (first (second s-tree)) '-NONE-) (null (cddr s-tree)))
           (return (cons 'S-NONE (cdr s-tree))) )

       ; Does the S consist of a null NP and a TO-VP?
       (if (and (eq (first (second s-tree)) 'NP)
                (eq (first (second (second s-tree))) '-NONE-)
                (cddr s-tree) (eq (first (third s-tree)) 'VP)
                (eq (first (second (third s-tree))) 'TO) )
           (return (cons 'VP-INF (cdr (third s-tree)))) )
       ; Does the S consist of a null NP, (TO to) and a VP?
       (if (and (eq (first (second s-tree)) 'NP)
                (eq (first (second (second s-tree))) '-NONE-)
                (member (third s-tree) 
                        '((TO to) (AUX (TO to))) :test 'equal)
                (eq (first (fourth s-tree)) 'VP))
           (return (cons 'VP-INF (cddr s-tree))) )
       ; Does the S consist of a null NP and a progressive VP?
       (if (and (eq (first (second s-tree)) 'NP)
                (eq (first (second (second s-tree))) '-NONE-)
                (eq (first (third s-tree)) 'VP)
                (eq (first (second (third s-tree))) 'VBG) )
           (return (cons 'VP-ING (cdr (third s-tree)))) )
       ; Does the S consist of a null NP, an auxiliary and a VP?
       (if (and (eq (first (second s-tree)) 'NP)
                (eq (first (second (second s-tree))) '-NONE-)
                (member (first (third s-tree)) '(AUX MD))
                (eq (first (fourth s-tree)) 'VP) )
           (return (cons 'VP (cddr s-tree))) )
       ; Does the S consist of a null NP and an ordinary VP?
       ; This indicates a relative clause (with an external WHNP)
       (if (and (eq (first (second s-tree)) 'NP)
                (eq (first (second (second s-tree))) '-NONE-)
                (eq (first (third s-tree)) 'VP) )
           (return (third s-tree)) )
       ; Does the S consist simply of a VP (with not even a null NP),
       ; where the verb is not in base form (thus not an imperative
       ; sentence)? Drop the (S ...) wrapper
       (if (and (eq (first (second s-tree)) 'VP)
                (not (member (first (second (second s-tree))) 
                            '(VB BE AUX) )))
           (return (second s-tree)) )
       (return s-tree)
 )); end of particularize-s


(defun make-multiword (str words); Apr 6/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Return a symbol consisting of the given words (symbols) connected by
; the symbol specified as a unit string in the first argument (e.g., 
; str = "_" or "-")
 (cond ((atom words) words)
       ((null (cdr words)) (car words))
       (T (let (strings)
               (push (write-to-string (car words)) strings)
               (dolist (w (cdr words)) 
                       (push str strings)
                       (push (write-to-string w) strings) )
               (intern (apply #'concatenate 
                              (cons 'string (reverse strings)) ))))
 )); end of make-multiword
               
