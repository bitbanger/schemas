; July 2012
; ~~~~~~~~~
; LOGICAL FORM PREDICATES NEEDED FOR SCOPING
;
; A GLOBAL *VARS* LIST IS DEFINED IN "logical-form.lisp".
;
; **NOTE: THE TYPE FLAGGING OF ATOMS MAY NOT BE CONSISTENT --
;   I ASSIGN AUTOMATIC FLAGS EQUIVALENT TO THE EXTENSIONS IN
;   CREATING LOGICAL ATOMS, BUT HEURISTIC ALGORITHMS MAY ALSO
;   EXPLICITLY ASSIGN FLAGS LIKE 'pred', 'wffmod', etc.
;
;   For the time being, the type-extensions on atoms are
;   CC, DET, PRO, P, A, AUX, N, NAME, PRO, ADV, TO, V, AUX, BE.
;   (I'm not sure about 'BE', and whether there'll perhaps be 
;   'PASV' for verbs like "beaten".) A few basic fixed operators
;   like adv-e, adv-a, that, K, Ka, Ke, etc., don't need to be
;   typed because they can be checked explicitly in logical-form
;   predicates, and used explictly in axioms. Basically I'd like 
;   the logical types of atoms to be the same as the extension 
;   types, so in the latter we want to make just enough distinctions
;   to allow unambiguous semantic axioms.
;
; **NOTE: SOME UNCERTAINTIES 
;   -- WHAT'S THE TYPE OF PASV? 
;   -- SINCE "BE" IS PRED-MODIFYING, WHAT TYPE SHOULD IT GET -- JUST V?
;   -- SIMILARLY "SEEMS", "BECOMES", & SUBJ-/OBJ-ADDING OP'S: THEY 
;      HAVE EXTENSIONS '.V' AND AS SUCH GET "RECOGNIZED" AS PREDICATES,
;      AND IT'S UNCLEAR IF THIS CAN CAUSE PROBLEMS.
;   -- DO WE HAVE DIFFERENT TYPES FOR SENTENTIAL AND PRED-MODIFYING
;      MEANINGS OF MODAL AUXIMIARIES? CAN I IGNORE THE TYPE AMBIGUITY
;      AS LONG AS I HAVE DIFFERENT LOGICAL SYMBOLS FOR THEM, E.G.,
;      'POSSIBLY' AND 'ABLE-TO' FOR THE 2 MEANINGS OF 'CAN'?
; ================================================================
;
; ONE POINT I HAD FORGOTTEN ABOUT IN WRITING NEW PROGRAMS IS THAT 
; THE PREVIOUS PROGRAMS HEAVILY DEPENDED ON THE 'TYPE' FLAGS THAT ARE
; ATTACHED TO LOGICAL ATOMS *IN THE PROCESS OF LF-DERIVATION*. SO
; I ENDED UP WRITING UNNECESSARILY COMPLEX PROGRAMS TO *INFER* AND
; FLAG THE TYPES OF THE ATOMS -- BUT THESE MIGHT BE USEFUL FOR 
; AXIOMS *NOT* DERIVED DIRECTLY FROM NL, SAY FOR INFERENCE OR
; TRANSFORMATIONS VIA TTT, SO I HAVE SAVED THE TYPE-FLAGGING CODE
; IN "heuristic-type-assignment.lisp".
;
; ONE OBSERVATION IN LOOKING AT THE OLD "logical-form.lisp" CODE: 
; THOUGH NL-DERIVED ATOMS GET TYPE FLAGS LIKE 'V', 'N', 'ADV', ETC., 
; I DON'T SEEM TO SYSTEMATICALLY FLAG ATOMS INTRODUCED IN COMPLEX 
; TRANSLATIONS OF LEXICAL ITEMS IN 'derive-word-lf '; e.g., past, 
; pres, perf, past/pres, perf/would, can.md, at-time.p, that.det, 
; at/to-loc.p, location.n, place.n, at-time.p, for-reason.p, reason.n, 
; in-manner.p, manner.n, you.pro, which.det, person.n, pertain-to, 
; person-or-thing.n, thing.n, etc. However, most of these are
; type-recognizable by their extensions (and predicates like
; wff?, pred?, term?, etc. look for such extensions *as well as*
; type flags, given via the 'type' indicator); so what needs to be
; done for safety (esp. if *not* using the heuristic programs
; herein) is to explicitly type the atoms that I tend to use 
; *without* extensions, such as some determiners, tense operators,
; coordinators, episode functions like time-of, etc. The typing
; is unnecessary for atom types belonging to small, fixed groups
; like predicate and sentence reifying operators and adv-e, adv-s,
; adv-a, adv-m, adv-f, etc.

; ================================================================

            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;                          ;;
            ;;   Permanent type flags   ;;
            ;;                          ;;
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Note: *vars* are declared in "scoping.lisp"; the convention
; for using variables in a particular subformula is to choose the
; first elements of *vars* that doesn't appear as an atom in the
; subformula.


(defun flag-as (flag x) 
;~~~~~~~~~~~~~~~~~~~~~~
; Attach 'type indicator, with value flag, to x.
; Allow for unscoped coordination of atoms, because in heuristic
; type flagging (see "heuristic-type-assignment.lisp"), if we
; (rather unnecessarily!) allow for unscoped elements, we sometimes 
; infer that a constituent must be either atomic or an unscoped 
; coordination of atoms)
;
 (prog (prev-type)
   (when (and (listp x) (eq (car x) :o))
         (dolist (xi (cddr x)) (flag-as flag xi))
         (return flag))
   (when (not (symbolp x))
         (format t "~%***WARNING: ATTEMPT TO FLAG NONSYMBOL ~s AS TYPE ~s"
            x flag)
         (return nil))
   (setq prev-flag (get x 'type))
   (if (and prev-flag (not (eq prev-flag flag)))
       (format t "~%***WARNING: RESETTING FLAG OF ~s FROM ~s TO ~s"
          x prev-flag flag))
   (return (setf (get x 'type) flag))
 )); end of flag-as

; IN THE FOLLOWING ALL SYMBOLS WITHOUT EXTENSIONS THAT CAN APPEAR
; IN LOGICAL FORMS SHOULD BE ASSIGNED 'TYPE VALUES (EXCEPT ONES
; FROM SMALL, FIXED CLASSES LIKE COORDINATORS, REIFYING OPERATORS
; (K, KA, KE, THAT, ETC) MODIFIER-CREATING OPERATORS (ADV-S, ADV-E,
; ETC.), K-INV, AND A FEW OTHERS. (However, the syntactic predicates
; like wff?, pred?, predk?, ...) are designed to be somewhat tolerant
; of sloppiness.)

(defun flag-as-det (x) (flag-as 'det x))
(mapcar #'flag-as-det; the flagging of .det-extended items is
                     ; redundant but may speed things up a bit
   '(all each every most many a-few few some a{n} any the
     this these those my your her its our their whose
     all.det each.det every.det most.det many.det a_few.det few.det
     no.det some.det a.det an.det a{n}.det any.det the.det this.det
     that.det these.det those.det my.det your.det her.det his.det
     its.det our.det their.det wh whose.det what.det which.det) )

(defun flag-as-func (x) (flag-as 'f x))
(mapcar #'flag-as-func; just a few -- for others we expect .f-extensions
                      ; or disambiguating context; note that "*" becomes
                      ; ambiguous if used for multiplication and as episodic
                      ; connective, but context always resolves that ambiguity
    '(\| pair + plus sum-of - minus * times product-of / divide ratio-of 
      lg log exp time-of start-of start-time-of end-of end-time-of set-of
      coll-of )) ; ** however, epi2 uses, e.g., ((coll-of 4) leg.n).

(defun flag-as-wffmod (x) (flag-as 'wffmod x))
;;*** RETHINK FLAG VALUE ABOVE -- 'ads', 'adv' extensions??
(mapcar #'flag-as-wffmod; just a few that are apt to be used without 
                        ; extensions -- for others we expect .ads
                        ; omit 'not', which allows tense extraction
    '(past pres futr perf prog maybe perhaps possibly probably
      necessarily unfortunately fortunately ) )

(defun flag-as-adj-pred (x) (flag-as 'a x))
; Aimed primarily at equality and math predicates; the latter might
; show up in numerical talk (e.g., about times and dates and measures,
; and also in comparatives); we regard these as adjectival binary
; predicates (thus, nonverbal).
(mapcar #'flag-as-adj-pred 
    '(= equal-to equal-to.a identical-with identical with.a 
      > greater-than greater-than.a < less-than less-than.a
      pertain-to)); I'm making 'pertain-to' a adj. pred because it's
                  ; intended as a static relation (cf. "pertinent to")

(defun flag-as-var (x) (flag-as 'var x))
(mapcar #'flag-as-var *vars*)

           ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
           ;;                                             ;;
           ;;   Syntactic (LF)  predicates on ULFs/ELFs   ;;
           ;;                                             ;;
           ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; We make use of both pre-existing type flags such as V, MD, PASV, A,  
; F (or FUNC?), etc. on property lists of atoms, and also type-specifying
; extensions such as '.v', '.n', '.a', etc. Also certain small fixed 
; groups of atoms, such as for reification (K, Ka, Ke, that, ...) and 
; adv-s, adv-e, adv-a, etc., are recognized explicitly.

(defun extension-type (atm); July 16/12; tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~
; Return the material after the last dot as an upper-case atom 
; (or nil if there is no dot); e.g., 'V, 'N, 'NAME, etc.
;
 (prog (chars ext)
       (if (not (symbolp atm)) (return nil))
       (setq chars (reverse (coerce (string atm) 'list)))
       (if (not (member #\. chars)) (return nil))
       (if (char= (car chars) #\.) (return nil)); ends in dot (unexpected)
       ; Peel off characters following final '.':
       (dotimes (i (- (length chars) (length (member #\. chars))))
          (push (pop chars) ext))
       (return (intern (string-upcase (coerce ext 'string))))
 )); end of extension-type

(defun wff? (expr)
;~~~~~~~~~~~~~~~~
; Roughly, classify an expression as a wff if it is an infix formula 
; (possibly with initial 'not') or is a modified wff or episodic wff
; or an appropriately modified or coordinated formula (thus not 
; embedded by lambda, 'that', 'Ke', 'whether', 'qnom', or 'ans-to',
; etc.). We count wh-questions as wffs here.
;
 (cond ((and (symbolp expr)
             (member expr ; some possible atomic wffs (** ad hoc!)
               '(yes no yes.s no.s truth falsity something-exists 
                 nothing-exists))) t)
       ((atom expr) nil) ; no other atomic wffs
       ((eq (car expr) :i) t) ; explicit infix formula
       ((member (second expr) '(** * @)) t); episodic formula
       ((and (eq (car expr) 'not); treat wff negation (possibly
                                 ; flattened) separately
             (or (wff? (second expr)) (wff? (cdr expr)))) t)
       ; Recognizable as nonexplicit infix wff from 1st element?
       ((term? (car expr)) t) 
       ; Some obvious non-formulas:
       ((member (car expr) '(:a :l :p :q that that.comp that.compl K Ka Ke 
                             whether qnom ans-to set-of-all
                             adv-s adv-e adv-a adv-f adv-m)) nil)
       ((pred? (car expr)) nil)
       ((predmod? (car expr)) nil)
       ((wffmod? (car expr)) nil)
       (t ; an expression which is not an explicit infix formula or obvious
          ; infix predication, and not obviously a non-formula; thus either
          ; it is not a wff, or else a non-obvious implicit infix coordination, 
          ; or a quantified wff, or a premodified wff, or an unscoped 
          ; coordination of wffs, or an unscoped-tense operator applied 
          ; to a wff. In all wff-cases except the nonobvious infix predication
          ; case, there is a directly embedded wff, so that mapcar recursion 
          ; with 'wff?' gives at least one non-nil result. We take the chance 
          ; of not recognizing a nonobvious infix predication (we prefer
          ; false negatives to false positives, e.g., mistaking (very fast.a)
          ; for a formula):
         (find-if #'(lambda (x) x) (mapcar #'wff? expr)))
 )); end of wff?


(defun var? (expr)
;~~~~~~~~~~~~~~~~~
  (and expr (symbolp expr) (eq (get expr 'type) 'var)))


(defun term? (expr); Nov 25/03; rewritten July 17/12
;~~~~~~~~~~~~~~~~~~
; Note: Variables will be recognized as terms only if they've been
; flagged with type 'var'.
;
 (let (type)
  (cond ((atom expr); atomic term?
         (if (keywordp expr) (return-from term? nil))
         (if (not (symbolp expr)) (return-from term? t)); numbers, etc.
         (if (member (get expr 'type) '(name var sk pron pro term))
             (return-from term? t))
         (setq type (extension-type expr))
         (cond ((member type '(name sk pron pro)) t)
               (t nil))) ; any other extension is not a term-extension
                         ; this might include (allowing for sloppiness)
                         ; v, pasv, a, adv, d, dt, det, n, cc, conj, 
                         ; coord, p, compl, comp, rel, and maybe others.
                         ; If all +ve tests failed, we return nil.

        ; unscoped quantified term?
        ((eq (car expr) :q) t)

        ; reified predicate, proposition or question (with or w/o :f)?
        ((and (eq (car expr) :f)
              (member (second expr) 
                      '(K Ka Ke th that that.compl that.comp qnom whether))) t )
        ((member (car expr) 
                 '(K Ka Ke th that that.compl that.comp qnom whether)) t)

        ; functional term? (** but note that if the function hasn't been
        ; applied to "enough" arguments, this apparent term is actually
        ; still a function; we ignore this issue here)
        ((and (eq (car expr) :f); are all arguments terms?
              (null (find-if-not #'term? (cddr expr))) ) t )
        ((and (functor? (car expr)); function w/o :f keyword
              (null (find-if-not #'term? (cdr expr))) ) t )
        (t nil))
 )); end of term?


(defun functor? (expr); Nov 25/03; rewritten (w. less use of 'type)) Jul 16/12
;~~~~~~~~~~~~~~~~~~~~
; By "functors" we mean expressions that denote functions applicable
; to individuals (not predicates or propositions). This program may
; return nil for a function not typed as such and without .f-extension,
; even when it occurs in an :f-context like (:f fcn arg1 ... argk);
; however, note that this doesn't affect term recognition (see 'term?'
; above), which recognizes the :f-keyword.
;
 (let (type)
  (cond ((and (atom expr) (not (symbolp expr))) nil); numbers (etc.)
        ((and (symbolp expr) (member (get expr 'type) '(f func))) t)
        ((and (symbolp expr) ; some standard fcns used w/o extensions
                             ; (though this is redundant if typing of 
                             ; such functions was done!)
              (member expr '(time-of clock-time-of start-of begin-of end-of
                             duration-of + - * lg log exp coll-of))) t)
                            ; ** however, epi2 uses e.g., ((coll-of 4) leg.n)                  
        ((and (symbolp expr) (setq type (extension-type expr)))
         (if (eq type 'f) t nil)); only 'f'-extensions denote functions
        ((and (listp expr) (eq (car expr) :f) (term? (third expr))) t)
        ; EL has no complex terms denoting functions over individuals.
        ; (Note that this doesn't rule out nested functions like
        ; (area-of.f (surface-of.f Mars.name)).)
        (t nil) )
 )); end of functor?

                         
(defun predk? (expr)
;~~~~~~~~~~~~~~~~~
; Classify an expression as a 'predk?' (a predicate taking one or more 
; arguments) if it is explicitly flagged as a pred, if it has a '.v', 
; '.pasv', '.a', '.n', or '.p' extension, or is a lambda abstract, 
; or is formed (from a term) by 'k-inv' or 'ka-inv', or consists of 
; a predmod applied to a monadic predicate (i.e., where the embedding 
; is not by 'k', 'ka', 'set-of-all, 'attr', or 'nn'), or is an unscoped
; coordinated predicate, or is an unscoped tense-modified predicate.
;
; Note: **This will classify 'become.v', and subj-/obj-adding verbs
; as predicates. It's unclear if this can cause trouble.
;
 (let (type)
      (cond ; non-symbolic atom?
            ((and (atom expr) 
                  (or (null expr) (not (symbolp expr)))) nil)
            ; predicate atom?
            ((and (symbolp expr) 
                  (member (get expr 'type) '(v a n p pasv pred))) t)
            ((symbolp expr); not flagged as pred on p-list
             (setq type (extension-type expr))
             (if (member type '(v pasv a n p)) t nil))
            ((atom expr) nil); no other atomic predicates are possible
            ; lambda predicate?
            ((eq (car expr) :l) t)
            ; pred formed (from a term) by 'k-inv' or 'ka-inv'?
            ((or (member (car expr) '(k-inv ka-inv)) 
                 (and (eq (car expr) :f) 
                      (member (second expr) '(k-inv ka-inv)))) t)
            ; modified (not reified) predicate? ({:f} predmod pred)
            ((or (and (not (member (car expr) 
                                  '(K Ka set-of-all attr nn)))
                      (not (term? (car expr)))
                      (predk? (second  expr)))
                 (and (eq (car expr) :f) 
                      (not (member (second expr) 
                                  '(K Ka set-of-all attr nn)))
                      (predk? (third expr)))) t)
            ; unscoped coordinated or tense-modified predicate?
            ((and (eq (car expr) :o) (predk? (third expr))) t))
 )); end of predk?
            
        
(defun verbal-wff? (expr); Nov 24/03; modified July 19/12
;~~~~~~~~~~~~~~~~~~~~~~~~~
; Determine whether 'expr' is a wff based on a verbal predicate, or (unscoped
; or scoped) coordinated, modified, or quantified verbal wffs, or a wff
; embedded by an episodic operator; this works  whether or not :i, :f, :p 
; keywords have been stripped.
;
  (cond ((atom expr) nil)
        ; infixed verbal predicate?
        ((and (eq (car expr) :i) (verbal-pred? (third expr))) t)
        ((and (term? (car expr)) (verbal-pred? (second expr))) t)

        ; scoped coordinator infixed to (nothing but) verbal wffs?
        ((and (eq (car expr) :i)
              (verbal-wff? (second expr))
              (null (find-if-not #'verbal-wff? (cdddr expr))) ) t)
        ((and (verbal-wff? (car expr))
              (null (find-if-not #'verbal-wff? (cddr expr))) ) t)

        ; modified verbal wff? (Include flattened negation)
        ((and (eq (car expr) :f)
              (not (member (second expr) '(that that.comp that.compl Ke)))
              (verbal-wff? (third expr)) ) t )
        ((and (wffmod? (car expr)) (verbal-wff? (second expr))) t)
        ((and (eq (car expr) 'not) 
              (not (wff? (second expr))) (verbal-wff? (cdr expr))) t) 

        ; unscoped coordinator applied to verbal wffs?
        ((and (eq (car expr) :o) (verbal-wff? (third expr))) t)

        ; quantified verbal wff?
        ; (Note: (if x y z) is true just in case x and y are true,
        ;        or x is nil and z is true)
        ((and (quan? (car expr))
              (if (cdddr expr)
                  (verbal-wff? (fourth expr))
                  (verbal-wff? (third expr)) )) t)

        ; verbal wff embedded by episodic operator?
        ((and (eq (car expr) :i) (member (third expr) '(** * @))
              (verbal-wff? (second expr)) ) t )
        ((and (member (second expr) '(** * @))
              (verbal-wff? (car expr)) ) t )

        (t nil)
 )); end of verbal-wff?



(defun verbal-pred? (expr); Nov 25/03; modified July 19/12
;~~~~~~~~~~~~~~~~~~~~~~~~~~
; Determine whether 'expr' is a verbal predicate, as indicated by a 'type'
; property, or, failing that, a .v suffix; complex verbal predicates
; are recognized as well. 
;
  (cond ((and (atom expr) (not (symbolp expr))) nil); numbers, etc.
        ((atom expr); symbolic atom
         (let ((type (get expr 'type)))
              (if (eq type 'v)
                  t
                  (if type; any type other than v
                      nil
                      (if (eq (extension-type expr) 'v) t nil)))))

        ; complex verbal predicates can be adverbially or tense-modified
        ; verbal predicates, or verbal predicates applied to one or more
        ; arguments; or lambda abstracts of verbal clauses or of verbal
        ; predicates; or unscoped coordinated verbal predicates...
        ; ** We might also consider preds of form ({:f} {ka-inv} term),
        ; but this seems very unlikely to be necessary.
        ;
        ((and (member (car expr) '(:f :p)); allow some sloppiness
              (cddr expr); fcn/pred + operand; tolerate extra operands
              (or (verbal-pred? (second expr)); e.g., "became sick"
                  (and (predmod? (second expr)); e.g., "nearly died"
                       (verbal-pred? (third expr)) ))) t)
        ; same configuration but without keyword?
        ((and (cdr expr)
              (or (verbal-pred? (car expr))
                  (and (predmod? (car expr))
                       (verbal-pred? (second expr)) ))) t)
        ((and (eq (car expr) :o) (verbal-pred? (third expr))) t)
        ((and (eq (car expr) :p) (verbal-pred? (second expr))) t)
        ((verbal-pred? (car expr)) t); pred+args w/o keyword
        ((and (eq (car expr) :l)
              (or (verbal-pred? (third expr)); (:l x pred) (unlikely)
                  (verbal-wff? (third expr)) )) t); may be coordinated
        (t nil)
 )); end of verbal-pred?


(defun pred? (expr); monadic predicate
;~~~~~~~~~~~~~~~~~~
; A new requirement in the new scoping algorithm, since we also
; may scope predicates (as lambda-abstracts).
;
; Determine whether 'expr' is a predicate, as indicated by a 'type'
; property, or, failing that, an appropriate suffix; complex 
; predicates are recognized as well. 
;
  (cond ((and (atom expr) (not (symbolp expr))) nil); numbers, etc.
        ((atom expr); symbolic atom
         (let ((type (get expr 'type)))
              (if (member type '(v n a pasv p pred))
                  t
                  (if type; any known type other than those
                      nil
                      (if (member (extension-type expr) 
                                  '(v n a pasv p pred)) t nil)))))
                      ; '.pred' might have been added for certain 
                      ; unknown atoms

        ; complex predicates can be adverbially or tense-modified
        ; predicates, or predicates applied to one or more
        ; arguments; or lambda abstracts of clauses or of 
        ; predicates; or unscoped coordinated predicates...
        ; We also test for preds of form ({:f} {k-inv,ka-inv} term).
        ;
        ((and (member (car expr) '(:f :p)); allow some sloppiness
              (cddr expr) (null (cdddr expr)); fcn + one operand
              (or (pred? (second expr)); e.g., "became sick"
                  (and (predmod? (second expr)); e.g., "nearly dead"
                       (pred? (third expr)) ))) t)
        ; same configuration but without keyword?
        ((and (cdr expr) (null (cddr expr))
              (or (pred? (car expr))
                  (and (predmod? (car expr))
                       (pred? (second expr)) ))) t)
        ((and (eq (car expr) :o) (pred? (third expr))) t)
        ((and (eq (car expr) :p) (pred? (second expr))) t)
        ((pred? (car expr)) t); pred+args w/o keyword
        ((and (eq (car expr) :l)
              (or (pred? (third expr)); unlikely
                  (wff? (third expr)) )) t)
        ((and (eq (car expr) :f) 
              (member (second expr) '(k-inv ka-inv))) t)
        ((member (car expr) '(k-inv ka-inv)) t)
        (t nil)
 )); end of pred?


(defun quan? (expr);
;~~~~~~~~~~~~~~~~~
 (let (type)
   (cond ((and (atom expr) (not (symbolp expr))) nil)
         ((and (symbolp expr) 
               (member (get expr 'type) '(det dt d quan))) t)
         ((and (symbolp expr) 
               (setq type (extension-type expr)))
               (if (member type '(det dt d quan)) t nil))
         ((and (symbolp expr); redundantly check a few common ones
                             ; in case they've not been flagged
               (member expr 
                 '(all some a{n} most few many the this these those))) t)
         ((atom expr) nil); no other atomic quantifiers
         ; complex quantifiers
         ((member (car expr) '(fquan nquan)) t)
         (t nil))
 )); end of quan?



(defun tense-op? (op); originally from "deindexing.lisp"
;~~~~~~~~~~~~~~~~~~
 (member op '(past pres futr fpres ppres gpres perf)) )

      
(defun wffmod? (expr)
;~~~~~~~~~~~~~~~~~~~~
; Atomic or complex wff modifier
;
 (let (type)
  (cond ((symbolp expr) 
         (cond ((member (get expr 'type) '(wffmod ads)) t); **more?
               ((get expr 'type) nil); wrong type
               ; redundantly check a few atoms, for extra robustness
               ((tense-op? expr) t)
               ; we omit 'not', which allows tense extraction and is
               ; handled specially in finding scoping candidates;
               ((member expr '(never never.adv never.ads 
                               maybe maybe.ads maybe.adv 
                               perhaps perhaps.ads perhaps.adv 
                               possibly possibly.ads possibly.adv 
                               apparently apparently.ads apparently.adv 
                               accordingly accordingly.ads accordingly.adv
                               assuredly assuredly.ads assuredly.adv
                               consequently consequently.ads consequently.adv
                               therefore therefore.ads therefore.adv
                               thus thus.ads thus.adv
                               obviously obviously.ads obviously.adv
                               perchance perchance.adv perchance.ads 
                               conceivably conceivably.adv conceivably.ads 
                               potentially potentially.adv potentially.ads 
                               necessarily necessarily.ads necessarily.adv
                               certainly certainly.ads certainly.adv 
                               definitely definitely.adv definitely.ads 
                               assuredly assuredly.adv assuredly.ads 
                               undoubtedly undoubtedly.adv undoubtedly.ads 
                               of-course of-course.adv of-course.ads 
                               of_course of_course.adv of_course.ads 
                               unexpectedly unexpectedly.adv unexpectedly.ads
                               fortunately fortunately.ads fortunately.adv
                               unfortunately unfortunately.ads unfortunately.adv
                               luckily luckily.ads luckily.adv reportedly 
                               reportedly.ads reportedly.adv admittedly
                               admittedly.ads admittedly.adv surprisingly
                               surprisingly.ads surprisingly.adv)) t); however, 
                                        ; these should really appear only with 
                                        ; an .ads extension and/or ads or wffmod 
                                        ; 'type' value
               ((setq type (extension-type expr))
                (if (member type '(ads)) t nil)); **more?
               (t nil)))
        ((atom expr) nil); nonsymbolic atom
        ; complex wff modifier? (adv-s ({:p} in.p (:q my.det opinion.n)))
        ((eq (car expr) 'adv-s) t)  ; in my current view 'adv-s is
                                     ; the only modifier creator.
        (t nil))
 )); end of wffmod?


(defun predmod? (expr)
;~~~~~~~~~~~~~~~~~~~~
; Atomic or complex pred modifier; atomic ones that are neither type-flagged
; on their property list nor have an .adv extension nor are on the explicit
; (non-exhaustive!) list below won't be recognized.
 (let (type)
  (cond ((symbolp expr) 
         (cond ((member (get expr 'type) '(predmod adv)) t); **more?
               ((get expr 'type) nil); wrong type
               ; redundantly check a few atoms, proactively
               ((member expr '(not.adv nearly almost hardly quickly very 
                               quite quite slightly extremely mostly
                               be be.v become become.v)) t); ** grow? etc.?
                              ; for versions with .adv extensions, see below
                              ; ** Should 'not' be included here? Maybe use
                              ;    'not' for wff negation and 'not.adv' for
                              ;    predicate negation?
                              ; Note: 'most', 'more', and 'less' are
                              ;    ambiguous between adverbs and quantifiers,
                              ;    and we assume the adverb sense requires
                              ;    the .adv extension.
               ((setq type (extension-type expr))
                (if (member type '(adv)) t nil)); **more?
               (t nil)))
        ((atom expr) nil); nonsymbolic atom
        ; unscoped tensed (verbal) predmod or coordinated predmods?
        ((eq (car expr) :o) (predmod? (third expr)))
        ; complex pred modifier? e.g., ({adv-e,adv-a,adv-f,adv-m} 
        ;                               ({:p} in.p {Rome.name,({:f} K haste.n)}))
        ((member (car expr) '(adv-a adv-m attr nn)) t); unmistakable pred
                            ; modifier creators;
        ((and (member (car expr) '(-ly adv-e adv-f)) (pred? (second expr))) t)
                            ; Allows for use of these modifier-creators for
                            ; creating either pred-modifiers or wff-modifiers;
                            ; however, at least for adv-e and adv-f this should 
                            ; be resolved one way or the other eventually 
                            ; (deindexing assumes they form wff modifiers!);
                            ; also, -ly should really be reserved unambiguously
                            ; for forming pred modifiers, while we should use 
                            ; adv-s for forming wff-modifiers.
        (t nil))
 )); end of predmod?

(defun coord? (expr)
;~~~~~~~~~~~~~~~~~~~
; N.B.: Assume "neither ... nor" is expressed in terms of "not"
;       and "or" or "and" (not (... or ...), or else 
;       ((not ...) and (not ...))).
  (and expr (symbolp expr)
       (or (member expr '(and and.cc and.conj and-then.cc and-then.conj 
                          as-well-as as-well-as.cc as-well-as.conj but but.cc
                          but.conj or or.cc or.conj or-else or-else.cc
                          or-else.conj either-or either-or.cc either-or.conj
                          => implies if-then if-then.cc if-then.conj <=> 
                          equiv would-imply because because.cc because.conj
                          because.adv so-that so-that.cc so-that.conj))
           (eq (extension-type expr) 'cc))))

(defun nonsubsective-predmod? (expr)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  (or (member expr '(not.adv nearly nearly.adv almost almost.adv just-about 
                     just-about.adv damn-near damn-near.adv)); others??
      (and (listp expr); expanded forms of "nearly" and "very nearly"
          ; For speed, I've switched to direct matching rather than match-encap
           (or (and (eq (car expr) :f) (member (second expr) '(-ly adv-a))
                    (or (member (third expr) '(near near.a))
                        (and (listp (third expr))
                             (member (car (third expr)) '(very very.adv))
                             (member (second (third expr)) 'near near.a))))
               (and (member (car expr) '(-ly adv-a))
                    (or (member (second expr) '(near near.a))
                        (and (listp (second expr))
                             (member (car (second expr)) '(very very.adv))
                             (member (second (second expr)) 'near near.a)))))
          ; match-encap version of the above big 'or':
          ;(match-encap '((? :f) (! -ly adv-a) 
          ;               (! near near.a ((! very very.adv) 
          ;                               (! near near.a))))
          ;             expr)
      )
 )); end of nonsubsective-predmod?
 

