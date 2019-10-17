;; NB: THIS PROGRAM REQUIRES THE 'ISA'-PROPERTIES THAT ARE SET IN THE
;;     FILE "initialize-and-preprocess.lisp", AND THE 'GENERALIZE-POS'
;;     PROGRAM IN THAT SAME FILE.
;; =====================================================================
;; Simple program for finding stems of verbs and singulars of nouns,
;; not dependent on having a lexicon.

(defun stem (pos-word) ; Mar 21/01; various dates up to present
;~~~~~~~~~~~~~~~~~~~~~
; FAIRLY CRUDE -- this does only some simple-minded stemming, with exception lists!
; It deals with plural nouns (NNS) and with verbs (MD VB VBD VBG VBN VBEN VBP VBZ)
; NOTE: A version of this program exists that also finds stems of -ly adverbs & 
;       -ness-nouns (with adj root -- non-public, at ~schubert/word-counts/lisp/
;       read-textfile.lisp). However, we do not want to stem words here whose
;       stems are of different category than the original word (i.e., derivational
;       affixes), as this would then require introduction of semantic rules
;       for interpreting the affixes.
;
; Given a (POS-tag word ...) pair or tuple (where all elements are symbols), 
; find the stem of the word, for use as part of the logical translation of 
; the word. E.g., (stem '(NNS children)) = child; e.g., (stem '(VBD gave up))
; = give_up.
;
 (prog ((tag (first pos-word)) (word (second pos-word)) cat backword result)
       (setq cat (generalize-pos tag))
       
       ; Handle multi-words as a special case, with recursion to find the stem:
       (when (cddr pos-word)
             (if (eq cat 'V); verb-particle combination?
                 (return (make-multiword "_" 
                            (list (stem (butlast pos-word)) (third pos-word)) )))
             (if (eq tag 'NNS); complex plural noun?
                 (return (make-multiword "_"
                            (append (cdr (butlast pos-word))
                                    (list (stem (cons tag (last pos-word)))) ))))
             ; neither V+particle nor NNS: just return concatenated atom
             ; (with inserted underscores)
             (return (make-multiword "_" (cdr pos-word))) )
       
       (if (not (member cat '(N V BE)))
           (return word); NB: includes NNPS, since this has cat = NAME, not N
           (if (eq cat 'N)
               (cond ((eq tag 'NN) (return word) )
                     ; plural noun; deal directly with some irregular ones:
                     (T (setq result
                              (case word
                                    (men 'MAN)
                                    (women 'WOMAN)
                                    (children 'CHILD)
                                    (people 'PERSON)
                                    (calves 'CALF)
                                    (cattle 'COW)
                                    (wives 'WIFE)
                                    (lives 'LIFE)
                                    (feet 'FOOT)
                                    (leaves 'LEAF)
                                    (loaves 'LOAF)
                                    (knives 'KNIFE)
                                    (sheaves 'SHEAF)
                                    (shelves 'SHELF)
                                    (mice 'MOUSE)
                                    (geese 'GOOSE)
                                    (lice 'LOUSE)
                                    (dice 'DIE)
                                    (teeth 'TOOTH)
                                    (cookies 'COOKIE)
                                    (zombies 'ZOMBIE)
                                    (species 'SPECIES)
                                    (kiddies 'KIDDIE)
                                    (birdies 'BIRDIE)
                                    (hoagies 'HOAGIE)
                                    (quickies 'QUICKIE)
                                    (talkies 'TALKIE)
                                    (walkie-talkies 'WALKIE-TALKIE)
                                    (pinkies 'PINKIE)
                                    (bookies 'BOOKIE)
                                    (rookies 'ROOKIE)
                                    (collies 'COLLIE)
                                    (girlies 'GIRLIE)
                                    (genies 'GENIE)
                                    (brownies 'BROWNIE)
                                    (magpies 'MAGPIE)
                                    (dearies 'DEARIE)
                                    (menageries 'MENAGERIE)
                                    (lingeries 'LINGERIE)
                                    (gaucheries 'GAUCHERIE)
                                    (reveries 'REVERIES)
                                    (prairies 'PRAIRIE)
                                    (calories 'CALORIE)
                                    (Valkyries 'VALKYRIES)
                                    (neckties 'NECKTIE)
                                    (aunties 'AUNTIE)
                                    (sorties 'SORTIE)
                                    (beasties 'BEASTIE)
                                    (movies 'MOVIE)
                                    (bowies 'BOWIE)
                           ; (mostly) Latinate exceptions to "...uses"
                           ; --> "...use", in order of frequency;
                           ; Also "...ses" --> "...sis".
                                    (buses 'BUS)
                                    (viruses 'VIRUS)
                                    (bonuses 'BONUS)
                                    (surplusses 'SURPLUS)
                                    (syllabuses 'SYLLABUS)
                                    (censuses 'CENSUS)
                                    (campuses 'CAMPUS)
                                    (choruses 'CHORUS)
                                    (circuses 'CIRCUS)
                                    (theses 'THESIS)
                                    (hyotheses 'HYPOTHESIS)
                                    (oases 'OASIS)
                                    (parentheses 'PARENTHESIS)
                                    (prostheses 'PROSTHESIS)
                                    (crises 'CRISES)
                                    (thromboses 'THROMBOSIS)
                                    (psychoses 'PSYCHOSIS)
                                    (diagnoses 'DIAGNOSIS)
                                    (prognoses 'PROGNOSIS)
                                    (neuroses 'NEUROSIS)
                                    (synopses 'SYNOPSIS)
                                    (chasses 'CHASSIS)
                                    (analyses 'ANALYSIS)
                                    (psychoanalyses 'PSYCHOANALYSIS)
                                    (metamorphoses 'METAMORPHOSIS)
                                    (prospectuses 'PROSPECTUS)
                                    (apparatuses 'APPARATUS)
                                    (pluses 'PLUS)
                                    (crocuses 'CROCUS)
                                    (sinuses 'SINUS)
                                    (geniuses 'GENIUS)
                                    (fetuses 'FETUS)
                                    (trolleybuses 'TROLLEYBUS)
                                    (statuses 'STATUS)
                                    (foetuses 'FOETUS)
                                    (minuses 'MINUS)
                                    (retroviruses 'RETROVIRUS)
                                    (octopuses 'OCTOPUS)
                                    (minibuses 'MINIBUS)
                                    (omnibuses 'OMNIBUS)
                                    (plexuses 'PLEXUS)
                                    (calluses 'CALLUS)
                                    (walruses 'WALRUS)
                                    (thymuses 'THYMUS)
                                    (baculoviruses 'BACULOVIRUS)
                                    (phalluses 'PHALLUS)
                                    (corpuses 'CORPUS)
                                    (hippopotamuses 'HIPPOPOTAMUS)
                                    (mini-buses 'MINI-BUS)
                                    (cactuses 'CACTUS)
                                    (poxviruses 'POXVIRUS)
                                    (trolley-buses 'TROLLEY-BUS)
                                    (ignoramuses 'IGNORAMUS)
                                    (funguses 'FUNGUS)
                                    (conceptuses 'CONCEPTUS)
                                    (boluses 'BOLUS)
                                    (anuses 'ANUS)
                                    (thesauruses 'THESAURUS)
                                    (railbuses 'RAILBUS)
                                    (venuses 'VENUS)
                                    (uteruses 'UTERUS)
                                    (rhinoviruses 'RHINOVIRUS)
                                    (post-buses 'POST-BUS)
                                    (polioviruses 'POLIOVIRUS)
                                    (papillomaviruses 'PAPILLOMAVIRUS)
                                    (mancuses 'MANCUS)
                                    (abacuses 'ABACUS)
                                    (styluses 'STYLUS)
                                    (papyruses 'PAPYRUS)
                                    (nexuses 'NEXUS)
                                    (motor-buses 'MOTOR-BUS)
                                    (incubuses 'INCUBUS)
                                  ))
                        (if result (return result))
                                    
                        ; Form reverse character list for further analysis:
                        (setq backword (reverse (coerce (string word) 'list)))
                        (when (not (char-equal (first backword) #\S))
                              ; irregurlar plural;
                              ; deal with "aldermen", "alderwomen", "Frenchmen",...
                              (if (ends-in backword '(#\M #\E #\N)) 
                                  (return (alter-ending backword 2 '(#\A #\N))) 
                                  (return word) )) ; other irregular plural -- 
                                                   ; leave as-is
                        ; Plural ending in -s:
                        (setq backword (cdr backword)) ; remove final s
                        (if (not (char-equal (first backword) #\E))
                            (return (intern (coerce (reverse backword) 'string))) )
                        ; Deal with a few of special -es cases:
                        (if (and (char-equal (second backword) #\I); -ie(s) ending?
                                 (> (length backword) 3) )
                            (return (alter-ending backword 2 '(#\Y))) )
                        (if (and (ends-in backword '(#\T #\O #\E)) (cdddr backword))
                            (return (alter-ending backword 1 nil)) )
                        (if (and (> (length backword) 3)
                                 (or (ends-in backword '(#\C #\H #\E))
                                     (ends-in backword '(#\S #\H #\E))
                                     (ends-in backword '(#\X #\E))
                                     (ends-in backword '(#\S #\S #\E))
                                     (ends-in backword '(#\Z #\Z #\E)) ))
                            (return (alter-ending backword 1 nil)) )
                        ; in all other cases, return the word without the final s:
                        (return (intern (coerce (reverse backword) 'string))) ))

               ; Category is V or BE:
               ; we need a single statement here for the if-not N part
               (progn
                  (if (eq tag 'VBP)
                      (if (member word '(are \'re am \'m))
                          (return-from stem 'BE) ))
                  (if (member tag '(MD VB VBP)) (return-from stem word)) 
                  ; Handle auxiliary inflections and some light verbs directly:
                  (setq result
                        (case word
                              ; verbs with multiple stored inflections
                              ((be been being is \' s was are \'re were) 'BE) 
                              ((biases biased biasing) 'BIAS)
                              ((bite bitten bit biting bites) 'BITE)
                              ((break broken breaking broke breaks) 'BREAK)
                              ((change changed changes changing) 'CHANGE)
                              ((die died dying dies) 'DIE)
                              ((do done doing does did)  'DO)
                              ((fall falls fell fallen falling) 'FALL)
                              ((find finds found finding)  'FIND)
                              ((forgive foregive forgives foregives forgave
                                foregave forgiven foregiven forgiving foregiving)
                                'FORGIVE)
                              ((foresee foresaw foresees foreseen foreseeing)  
                                'FORESEE)
                              ((get got gotten getting gets)  'GET)
                              ((give gives gave given giving)  'GIVE)
                              ((go goes went gone going goin goin\')  'GO)
                              ((grow grows grown grew growing) 'GROW)
                              ((have had has having \'ve)  'HAVE) 
                              ((know knows knew knowing)  'KNOW)
                              ((make makes made making)  'MAKE)
                              ((rise rose rises risen rising) 'RISE)
                              ((say says said saying)  'SAY)
                              ((take takes taken took taking)  'TAKE)
                              ((tell tells told telling)  'TELL)
                              ((see saw sees seen seeing)  'SEE)
                              ((speak spoke speaks spoken speaking) 'SPEAK)
                              ((wrote written writes writing) 'WRITE)

                              ; verbs with 1 or 2 stored inflections
                              ((added adding) 'ADD)
                              ((arose arisen) 'ARISE)
                              ((ate eaten) 'EAT)
                              ((batoned batoning) 'BATON)
                              ((began begun) 'BEGIN)
                              (became 'BECOME)
                              ((binged binging) 'BINGE)
                              ((blew blown) 'BLOW)
                              ((bore born borne) 'BEAR)
                              ((bored boring) 'BORE)
                              (bought 'BUY)
                              ((braceleted braceleting) 'BRACELET)
                              (bred 'BREED)
                              (brought  'BRING)
                              (built 'BUILD)
                              ((buttoned buttoning) 'BUTTON)
                              (came 'COME)
                              ((cancelled cancelling) 'CANCEL)
                              (caught  'CATCH)
                              ((chose chosen) 'CHOOSE)
                              (clung 'CLING)
                              ((competed competing) 'COMPETE)
                              ((condoned condoning) 'CONDONE)
                              ((controlled controlling) 'CONTROL)
                              ((credited crediting) 'CREDIT)
                              (crept 'CREEP)
                              (dealt 'DEAL)
                              ((developed developing) 'DEVELOP)
                              ((drew drawn) 'DRAW)
                              ((drove driven) 'DRIVE)
                              (dug 'DIG)
                              ((enveloped enveloping) 'ENVELOP)
                              ((exited exiting) 'EXIT)
                              (felt 'FEEL)
                              ((feted feting) 'FETE)
                              (fled 'FLEE)
                              ((flew flown) 'FLY)
                              (flung 'FLING)
                              ((focused focussed) 'FOCUS)
                              ((forebade forebidden) 'FOREBID)
                              ((forgot forgotten) 'FORGET)
                              (fought 'FIGHT)
                              ((froze frozen freezing freezes) 'FREEZE)
                              ((gossiped gossiping) 'GOSSIP)
                              ((gypped gypping) 'GYP)
                              (heard 'HEAR)
                              (held 'HOLD)
                              ((hid hidden) 'HIDE)
                              ((hinged hinging) 'HINGE)
                              (hung 'HANG)
                              ((interfered interfering) 'INTERFERE)
                              ((ironed ironing) 'IRON)
                              (kept 'KEEP)
                              (laid 'LAY)
                              (lain 'LIE-FLAT)
                              (lied 'TELL_LIES)
                              (lying 'LIE); remains ambiguous
                              (learnt 'LEARN)
                              (led 'LEAD)
                              (left 'LEAVE)
                              (lent 'LEND)
                              (lit 'LIGHT)
                              (lost 'LOSE)
                              (meant 'MEAN)
                              (met  'MEET)
                              ((meted meting) 'METE)
                              (misled 'MISLEAD)
                              ((murmuring murmured) 'MURMUR)
                              ((nauseated nauseating) 'NAUSEATE)
                              ((nucleated nucleating) 'NUCLEATE)
                              (paid 'PAY)
                              ((persevered persevering) 'PERSEVERE)
                              ((plunged plunging) 'PLUNGE)
                              ((premiered premiering) 'PREMIERE)
                              ((quelled quelling) 'QUELL)
                              ((quoted quoting) 'QUOTE)
                              (ran 'RUN)
                              ((rang rung) 'RING)
                              (repaid 'REPAY)
                              ((revered revering) 'REVERE)
                              ((riposted reposting) 'RIPOSTE)
                              ((rode ridden) 'RIDE)
                              ((sang sung) 'SING)
                              ((sank sunk) 'SINK)
                              (sat  'SIT) 
                              (sent 'SEND)
                              ((siphoned siphoning) 'SIPHON)
                              (sold 'SELL)
                              (sought 'SEEK)
                              ((shook shaken) 'SHAKE)
                              (shot 'SHOOT)
                              (shown 'SHOW)
                              ((shrank shrunken) 'SHRINK)
                              (slept 'SLEEP)
                              (slid 'SLIDE)
                              (smelt 'SMELL)
                              (spat 'SPIT)
                              (spelt 'SPELL)
                              (spent 'SPEND)
                              (spilt 'SPILL)
                              ((sprang sprung) 'SPRING)
                              ((stole stolen) 'STEAL)
                              (stood 'STAND)
                              (strode 'STRIDE)
                              (struck 'STRIKE)
                              (stuck 'STICK)
                              (swept 'SWEEP)
                              ((swore sworn) 'SWEAR)
                              ((swum swam) 'SWIM)
                              (swung 'SWING)
                              ((tasted tasting) 'TASTE)
                              (taught 'TEACH)
                              (thought  'THINK)
                              ((threw thrown) 'THROW)
                              ((torn tore) 'TEAR)
                              ((travelled travelling) 'TRAVEL)
                              (understood 'UNDERSTAND)
                              ((undertook undertaken) 'UNDERTAKE)
                              ((underwent undergone) 'UNDERGO)
                              ((underwrote underwritten) 'UNDERWRITE)
                              ((undid undone) 'UNDO)
                              ((untied untying) 'UNTIE)
                              ((vied vying) 'VIE)
                              ((visited visiting) 'VISIT)
                              (wept 'WEEP)
                              ((worshiped worshiping) 'WORSHIP)
                              ((woke woken) 'WAKE)
                              (won 'WIN)
                              ((worn wore) 'WEAR)
                              (wrought 'WORK)
                              (wrung 'WRING)
                             ))
                  (if result (return-from stem result))

                  ; "Lay" is subject to very special confusion!
                  (if (equal pos-word '(VBD lay)) (return-from stem 'lie-flat))

                  ; Form backward character list for further analysis:
                  (setq backword (reverse (coerce (string word) 'list)))

                  ; Verb ending in -s? Handle much like plural nouns:
                  (when (eq tag 'VBZ)
                        (setq backword (cdr backword)) ; remove final s
                        (if (not (char-equal (first backword) #\E))
                            (return (intern (coerce (reverse backword) 'string))) )
                        ; Deal with a few special -e(s) case:
                        (if (and (char-equal (second backword) #\I); -ie(s) ending?
                                 (> (length backword) 3) )
                            (return (alter-ending backword 2 '(#\Y))) )
                        (if (and (> (length backword) 3)
                                 (or (ends-in backword '(#\C #\H #\E))
                                     (ends-in backword '(#\S #\H #\E))
                                     (ends-in backword '(#\X #\E))
                                     (ends-in backword '(#\S #\S #\E))
                                     (ends-in backword '(#\Z #\Z #\E)) ))
                            (return (alter-ending backword 1 nil)) ); drop the e
                        ; in all other cases, return the word with the final e:
                        (return (intern (coerce (reverse backword) 'string))) )
      
                  ; For -ed past or past/passive participle, detach -ed, and
                  ; for -ing participle detach -ing:
                  (if (and (member tag '(VBD VBN VBEN))
                           (ends-in backword '(#\E #\D)); -ed past or pastpart?
                           (> (length backword) 3) ; long enough, & at least
                           (intersection '(#\A #\E #\I #\O #\U #\Y); 1 extra vowel
                                          (cddr backword) :test #'char-equal ))
                      (setq backword (cddr backword)); detach -ed
                      (if (and (eq tag 'VBG); -ing or -in or in' (slang) ending?
                               (> (length backword) 4) )
                          (setq backword 
                                (if (ends-in backword '(#\I #\N))
                                    (cddr backword); detach -in
                                    (cdddr backword) )); detach -ing or -in'
                          (return word) )); can't analyze -- return as-is

                  ; Now modify stem, from which ending has been detached
                  ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  ; Doubled-up consonant? If not f, s, or z, remove one:
                  ; In the case of l, drop one if we have <v|d|i|u><vow>ll.
                  (if (char-equal (first backword) (second backword) )
                      (if (and (> (length backword) 3)
                               (or (member (first backword) '(#\F #\S #\Z)
                                                       :test #'char-equal )
                                   (and (char-equal (first backword) #\L)
                                        (not (member (fourth backword)
                                                    '(#\D #\I #\U #\V)
                                                     :test #'char-equal )))))
                          (return (intern (coerce (reverse backword) 'string)))
                          (return (intern (coerce (reverse (cdr backword))
                                                  'string )))))
                  ; -i(ed)? Change i to y
                  (if (and (member tag '(VBD VBN VBEN))
                           (char-equal (first backword) #\I) )
                      (if (= (length backword) 2); eg, di-ed
                          (return (alter-ending backword 0 '(#\E)))
                          (return (alter-ending backword 1 '(#\Y))) ))

                  ; -x? Do not consider adding -e
                  (if (char-equal (first backword) #\X)
                      (return (intern (coerce (reverse backword) 'string))) )

                  ; Some conditions for restoring an e ...
                  ; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  ; -e(ed), -u(ed), -u(ing), -c(ed), -v(ed)? 
                  ; e.g., agreed, arguing, forced, carved
                  ; (Exclude -e(ing))
                  (if (or (member (first backword) 
                                 '(#\C #\U #\V) :test #'char-equal)
                          (and (char-equal (first backword) #\E)
                               (member tag '(VBD VBN VBEN)) ))
                      (return (alter-ending backword 0 '(#\E))) )

                  ; Add -e for -<cons><vow><cons> (after detaching -ed or -ing),
                  ; but not for -<cons>e<n|r|l>, & not for -<cons><vow><w|y>,
                  ; & not for -<cons>et (unless the cons is l or r),
                  ; & not for -<cons>ot (unless the cons is d, n, m, or t)
                  ; & not for -<vow><cons>it (exceptions handled later)
                  ; & not for -<cons>or (unless the cons is c, d, g, n or p),
                  ;   (some additional -or cases are considered later)
                  ; & not for -<cons>on (unless the cons is h, l, p, r or t),
                  ; & not for certain -<cons><vow>p stems (depending on <vow>),
                  ; & not for -ny<cons> or -<cons>y<l|r> stems (unless length < 5)
                  ;
                  ; e.g., for revis(ed), hop(ing), conven(ed), ignor(ed), 
                  ; phon(ed), but not for listen(ed), show(ed), play(ed),
                  ; favor(ed), pardon(ed)
                  (if (and (not (member (first backword) '(#\A #\E #\I #\O #\U)
                                                        :test #'char-equal ))
                           (member (second backword) '(#\A #\E #\I #\O #\U #\Y)
                                                      :test #'char-equal )
                           (or (= (length backword) 2)
                               (not (member (third backword)
                                           '(#\A #\E #\I #\O #\U)
                                            :test #'char-equal )))

                           ; don't add -e to stems like "open", "suffer", "channel"
                           ; i.e., don't (at this point) add -e to e<n|r|l>
                           (or (not (member (first backword) '(#\N #\R #\L) 
                                            :test #'char-equal ))
                               (not (char-equal (second backword) #\E)) )
                               ; exceptions like "adher(e)" are handled below
                               
                           ; don't add -e to stems like "abet", "budget", "carpet"
                           ; i.e., don't add -e to <cons>et (but do add it to
                           ; "excret", "secret")
                           (or (not (ends-in backword '(#\E #\T)))
                               (and (cdddr backword); length > 3
                                    (ends-in (cddr backword) '(#\C #\R)) ))
                               
                           ; don't add -e to stems like "abet", "budget", "carpet"
                           ; i.e., don't add -e to <cons>et (but do add it to
                           ; "delet", "complet", "excet", "secret")
                           (or (not (ends-in backword '(#\E #\T)))
                               (member (third backword) '(#\L #\R)
                                                        :test #'char-equal ))
                               
                           ; don't add -e to stems like "bigot", "pivot", "pilot"
                           ; i.e., don't add -e to <cons>ot (but do add it to
                           ; "dot", "denot", "not", "promot", "tot")
                           (or (not (ends-in backword '(#\O #\T)))
                               (member (third backword) '(#\D #\N #\M #\T) 
                                                        :test #'char-equal ))
                                   ; cases like "vote", "quote" handled separately
                               
                           ; don't add -e to stems like "edit", "exhibit", "profit"
                           ; i.e., don't add -e to -it (exceptions like "cite",
                           ; "expedite", etc., are handled later)
                           (not (ends-in backword '(#\I #\T)))

                           ; don't add -e to stems like "show", "gnaw", "play"
                           (or (not (member (first backword) 
                                           '(#\W #\Y) :test #'char-equal ))
                               (= (length backword) 2) )
                               
                           ; don't add -e to stems like "labor", "doctor"
                           ; (but do add it to "gor", "ador", "ignor")
                           (or (not (ends-in backword '(#\O #\R)))
                               (member (third backword) '(#\C #\D #\G #\N #\P)
                                                        :test #'char-equal ))
                           (or (not (ends-in backword '(#\O #\N)))
                               (member (third backword) '(#\H #\L #\P #\R #\T)
                                                        :test #'char-equal ))

                           ; don't add -e to stems like kidnap, burlap, worship,
                           ; tulip, turnip, gossip, develop, envelop, gallop,
                           ; wallop, stirrup, syrup:
                           (or (not (ends-in backword '(#\A #\P)))
                               (null (cdddr backword)); allows for "nap(ed)"
                               (not (member (third backword) '(#\L #\N)
                                                        :test #'char-equal )))
                           (or (not (ends-in backword '(#\I #\P)))
                               (null (cddddr backword)); allows for "snip(ed)"
                               (not (member (third backword) '(#\H #\L #\N #\S)
                                                        :test #'char-equal )))
                           (or (not (ends-in backword '(#\O #\P)))
                               (null (cddddr backword)); allows "{e|s}lope"
                               (ends-in (cddr backword) '(#\S #\L)) ); "(up)slope"
                           (not (ends-in backword '(#\R #\U #\P))) 
                           
                           ; don't add -e to stems like vinyl, methyl, martyr,
                           ; antonym (but do add it for typ(ed/ing), styl(ed/ing)
                           ; hairstyl(ed/ing), rhym(ed/ing)
                           (or (not (char-equal (second backword) #\Y))
                               (null (cddddr backword)); e.g., rhym(e)
                               (ends-in backword '(#\S #\T #\Y #\L))
                               (and (not (char-equal (first backword) #\L))
                                    (not (char-equal (first backword) #\R))
                                    (not (char-equal (third backword) #\N)) ))
                       )
                      (return (alter-ending backword 0 '(#\E))) )

                  ; <not c|p|s|t>her? e.g., adher(ed/ing), coher(ed/ing)
                  ; (but not bother, usher, butcher, decipher)
                  (if (and (cdddr backword); length > 3
                           (ends-in backword '(#\H #\E #\R))
                           (not (member (fourth backword)
                                       '(#\C #\P #\S #\T)
                                        :test #'char-equal )))
                      (return (alter-ending backword 0 '(#\E))) )

                  ; <cons>it, or -<cons><c|n|r|v>it, or -<char><a|e><cons>it?
                  ; e.g., cit(ed/ing), writ(ing), expedit(ed/ing), extradit(ed)
                  ; But don't add -e to stems like "inhabit, debit, limit", or
                  ; cases of -<vow><cons>it other than those pattern 3 above
                  (if (and (cddr backword); length > 2
                           (ends-in backword '(#\I #\T))
                           (not (member (third backword)
                                       '(#\A #\E #\I #\O #\U)
                                        :test #'char-equal ))
                           (or (null (cdddr backword)); length 3 (e.g., bit(e))
                               (and (member (third backword)
                                           '(#\C #\N #\R #\V)
                                            :test #'char-equal )
                                    (not (member (fourth backword); e.g., writ(e)
                                                '(#\A #\E #\I #\O #\U)
                                                 :test #'char-equal )))
                               (and (> (length backword) 4); rules out "edit"
                                    (char-equal (third backword) #\D)
                                    (member (fourth backword); eg expedit(e)
                                           '(#\A #\E)
                                            :test #'char-equal ))))
                                    ; ("Credit" must be handled as exception)
                       (return (alter-ending backword 0 '(#\E))) )

                  ; -<e|p>let(ed/ing)? e.g., delete, deplete, complete
                  ; (exception: "bracelet(ed/ing)")
                  (if (and (cdddr backword); length > 3
                           (ends-in backword '(#\L #\E #\T))
                           (member (fourth backword) '(#\E #\P)
                                                    :test #'char-equal ))
                      (return (alter-ending backword 0 '(#\E))) )

                  ; -quot(ed/ing), vot(ed/ing), -evot(ed/ing)?
                  (if (and (cddr backword); length > 2
                           (ends-in backword '(#\O #\T))
                           (member (third backword) '(#\U #\V) 
                                                   :test #'char-equal )
                           (or (null (cdddr backword)); i.e., vot(ed/ing)
                               (member (fourth backword) '(#\E #\Q)
                                                   :test #'char-equal )))
                      (return (alter-ending backword 0 '(#\E))) )

                  ; -<d|l|r>g(ed/ing)? e.g., judged, bulging, merging, forged
                  (if (and (char-equal (first backword) #\G)
                           (member (second backword) '(#\D #\L #\R)
                                                    :test #'char-equal ))
                      (return (alter-ending backword 0 '(#\E))) )

                  ; -qu<i|a|u><k|r|t>(ed/ing)? e.g., requiring, quaked
                  (if (and (member (first backword) '(#\K #\R #\T)
                                                   :test #'char-equal )
                           (member (second backword) '(#\I #\A #\U)
                                                   :test #'char-equal )
                           (cdddr backword) ; length > 3?
                           (ends-in (cddr backword) '(#\Q #\U)) )
                      (return (alter-ending backword 0 '(#\E))) )

                  ; -<l|n|p|r|w>s(ed/ing)? e.g., pulsing, rinsing, elapsed, browsed
                  (if (and (char-equal (first backword) #\S)
                           (member (second backword) '(#\L #\N #\P #\R #\W)
                                                    :test #'char-equal ))
                      (return (alter-ending backword 0 '(#\E))) )

                  ; -<i|u>a<d|t>(ed/ing)? e.g., associated, fluctuating, persuaded
                  (if (or (ends-in backword '(#\I #\A #\T))
                          (ends-in backword '(#\U #\A #\T))
                          (ends-in backword '(#\U #\A #\D)) )
                      (return (alter-ending backword 0 '(#\E))) ) 

                  ; -u<a|i>r(ed/ing)? e.g., square, require, inquire, ...
                  (if (or (ends-in backword '(#\U #\A #\R))
                          (ends-in backword '(#\U #\I #\R)) )
                      (return (alter-ending backword 0 '(#\E))) )

                  ; -plor(ed/ing), -<s|w>hor(ed/ing), -stor(ed/ing)?
                  (if (or (ends-in backword '(#\P #\L #\O #\R))
                          (ends-in backword '(#\S #\H #\O #\R))
                          (ends-in backword '(#\W #\H #\O #\R))
                          (ends-in backword '(#\S #\T #\O #\R)) )
                      (return (alter-ending backword 0 '(#\E))) )

                  ; -<cons excl. h, r, w>l(ed/ing)? e.g., tumbling
                  (if (and (char-equal (first backword) #\L)
                           (not (member (second backword) 
                                       '(#\A #\E #\I #\O #\U #\Y #\H #\R #\W)
                                        :test #'char-equal )))
                      (return (alter-ending backword 0 '(#\E))) )

                  ; -rang(ed/ing)? e.g., arranged, ranging
                  (if (ends-in backword '(#\R #\A #\N #\G))
                      (return (alter-ending backword 0 '(#\E))) )

                  ; -<vow><vow><c|s|z>(ed/ing)? e.g., ceased, paused, seizing
                  (if (and (member (first backword) 
                                  '(#\C #\S #\Z) :test #'char-equal )
                           (member (second backword)
                                  '(#\A #\E #\I #\O #\U) :test #'char-equal )
                           (cddr backword); length > 2
                           (member (third backword)
                                  '(#\A #\E #\I #\O #\U) :test #'char-equal ))
                      (return (alter-ending backword 0 '(#\E))) )

                  ; -ven(ed/ing)? e.g., convened, intervening
                  (if (and (char-equal (first backword) #\N)
                           (char-equal (second backword) #\E)
                           (cddr backword); length > 2
                           (char-equal (third backword) #\V) )
                      (return (alter-ending backword 0 '(#\E))) )

                  ; <b|p|t|w>ast(ed/ing)? e.g., tasting, wasted
                  (if (and (> (length backword) 3)
                           (char-equal (first backword) #\T)
                           (char-equal (second backword) #\S)
                           (char-equal (third backword) #\A)
                           (member (fourth backword)
                                  '(#\B #\P #\T #\W) :test #'char-equal ))
                      (return (alter-ending backword 0 '(#\E))) )

                  ; <not t><d|m|n|r>eat(ed/ing)? e.g., ideate, permeate, create
                  ; (nucleate and nauseate are listed directly)
                  (if (and (> (length backword) 3)
                           (char-equal (first backword) #\T)
                           (char-equal (second backword) #\A)
                           (char-equal (third backword) #\E)
                           (member (fourth backword)
                                  '(#\D #\M #\N #\R) :test #'char-equal )
                           (or (null (fifth backword))
                               (not (char-equal (fifth backword) #\T)) ))
                      (return (alter-ending backword 0 '(#\E))) )

                  ; Otherwise, return word minus ending:
                  (return (intern (coerce (reverse backword) 'string))) )))
 )); end of stem


(defun ends-in (backword chars); Mar 21/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Check whether the word `backword', given as a list of characters 
; in reverse order, ends in the characters `chars' (which actually means
; that `backword' begins with `chars', in reverse)
 (do ((rest backword) (cc (reverse chars)))
     ((or (null cc) (null rest))
      (if (null cc) T nil) )
     (if (not (char-equal (pop rest) (pop cc)))
         (return-from ends-in nil) )))


(defun alter-ending (backword n newchars) ; Mar 21/01
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Given a word `backword', as a list of characters in reverse order,
; trim off the first n characters, prepend `newchars' in reverse,
; and then reverse the result, change it to a string, and finally to
; an atom, and return this.
;
 (intern (coerce (reverse (append (reverse newchars) (nthcdr n backword)))
                 'string )))


