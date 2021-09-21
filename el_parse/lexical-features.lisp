;; THE DOT-FEATURES BASED ON THE LISTS HEREIN (VIZ., .N-PROPOS-OBJ,
;; .N-COMMUN-OBJ, .N-COG-OBJ), THOUGH APPEARING IN "isa.lisp", AREN'T
;; ACTUALLY USED ANYWHERE. THE LISTS ULTIMATELY USED FOR GAP INSERTION
;; ARE IN "transitivity-lists.lisp".
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; We may need syntactic and semantic features for many parse disambiguations
; (this is relevant to gap insertion, though I used new lists of lexical
; features for that, in "transitivity-lists.lisp")
;
; E.g., consider "the car that he bought", vs. "the fact that he smokes",
;       "the pipe that he smokes".
;       Here both the head noun semantics (phy-sobj vs cog-obj, say) and the
;       verb subcat (trans vs. intrans) make a big different to the rel-clause
;       vs appositive clause distinction.
; E.g., consider "What do you plan to do _?" vs "What do you do _ to stay fit?"
;       Here again subcat -- transitivity -- is crucial. In the first sentence
;       "plan" already has a complement, whereas "do" doesn't, so the trace is
;       embedded at VP-level 2, while in the second sentence the level-1 verb
;       calls for a complement whereas the level-2 verb does not, so the trace
;       is at level 1.
;
; So the idea is to create hash-table lexicons where we can check for features.
;
; The question is whether to use words or features as keys. 
; For the moment I opt for features as keys, because then I can use "tests"
; like .V_np, .N-phys-obj in tt patterns, and these will just be lookups in
; corresponding hash tables V_np, N-phys-obj, etc., with non-nil result
; providing confirmation of the feature. Also the lists of words with
; particular features is then easy to examine, and to fill in missing items.
;
; Will this be inconvenient for feature hierarchies? Well, for the moment
; we can use combinatory feature tests, e.g., .N-cog-obj could actually be
; a disjunctive test for .N-propos-obj (e.g., "belief") or .N-commun-obj 
; (e.g., "assertion").
;
; (In the following I used the comparison predicate below on a raw word list,
; collected from the Brown corpus for key "(SBAR (IN that)", noting ones
; that were NP appositives rather than rel-clauses (also throwing in nominals
; for some verb objects, e.g., "stated that ..." => "statement"); I stopped
; after checking all instances in a01.cmb, a02.cmb, ... , g33.cmb, at which 
; point I was getting very few new examples:
; #'(lambda (x y) (string-lessp (string x) (string y)))

(defparameter *n-propos-obj*
; Nouns that indicate an attitude towards, or truth-status of, their
; propositional complement
;
'(AWARENESS BELIEF CHANCE CONCERN CONCLUSION CONVICTION DELUSION
 DESIRE DISCOVERY DOUBT EVIDENCE FACT FEAR FEELING FINDING HOPE IDEA 
 ILLUSION IMPLICATION IMPRESSION INFORMATION INTENTION KNOWLEDGE NEED 
 NOTION OPINION POINT POLICY POSSIBILITY PRESUMPTION PRESUPPOSITION 
 PROOF REALIZATION REASON RECOGNITION REQUIREMENT RESULT SENSE SIGN 
 SUSPICION THOUGHT UNDERSTANDING UNEASINESS))

(defparameter *n-commun-obj* 
; Nouns that indicate communication of their propositional complement
;
'(ACKNOWLEDGEMENT ADMISSION ADVICE ANNOUNCEMENT ASSERTION ASSURANCE
  CHARGE CLAIM COMMENT CONFESSION CONTENTION DECLARATION DEMAND 
  DEMONSTRATION DENIAL DICTUM ILLUSTRATION INDICATION INSISTENCE LESSON
  OBSERVATION PROMISE PROPHESY PROPOSAL RECOMMENDATION REMARK REMINDER
  REPORT STATEMENT STIPULATION SUGGESTION))

(defparameter *v-needs-np*
; verbs that typically take an NP complement (possibly of type (that phi),(Ka pi))
; [I think I cut this short, as not worth the effort -- most verbs are transitive,
; and it makes more sense to enumerate the intransitive ones. That's the
; strategy used in "transitivity-lists.lisp".]
;
'(; this probably needs to be split into v-needs-np, v-prefers-np, v-allows-np;
  ; the latter 3 cases seem to generally correspond to selection for *either*
  ; an NP *or* an infinitive *or* S[that] *or* PP; 
  ; e.g., likes {Mary, to dance}, believes {the story, that it's true},
  ;       advertises {her work, on the web};
  ; Also, need to think about how to handle "blow", "blow out", ..., since
  ; particles are parsed originally as separate constituent. Use preprocessing
  ; rules?
   drink abort actualize advertise allow alter attend bake balance bead
   beg begin believe bend blacken bleach bloody_up blow blow_away blow_off
   blow_out board bore button_up calculate clear_away
   ; TBC? See ~schubert/elf-from-sentences/rarely-intransitive-verbs-sekora.lisp
   farm
   fatten
   startle 
   subdivide 
   zip_up
 ))
