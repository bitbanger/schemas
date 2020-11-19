; Aug 2012
; ~~~~~~~~
; [July 18/17: I think this is the same or close to scoping.lisp in
; ~schubert/lf-from-treebank-trees, where I originally had built
; a TTT-based scoping method, but found it impractically slow --
; but in ~schubert/lf-from-treebank-trees/scoping-notes, I discuss
; preference-based methods not used here (but used in the TTT version??)
; ==============================================================
; A variant of "scoping-using-ttt.lisp", but using direct equality
; tests and direct calls to logical-form predicates instead of ttt,
; written to determine if the extreme slowness of the scoping process 
; (e.g., 10 seconds for a moderately complex formula, and global
; garbage collection after a few formulas) was due to ttt. It was.
; ==============================================================
;
; July 2012
; ~~~~~~~~~
; SCOPING CODE
;
; THE PROGRAMS HERE ARE DEPENDENT ON THE LF-PREDICATES DEFINED
; IN "logical-form-predicates.lisp". THEY ARE NO LONGER DEPENDENT
; ON THE TTT CODE -- SO (load "ttt.lisp") IS UNNECESSARY. FOR 
; TESTING THE SCOPING CODE SEE "scoping-tests.lisp".
;
; I'VE ALLOWED SOME SLOPPINESS ABOUT THE USE OF KEYWORDS, BUT
; IT TURNS OUT THIS WAS REALLY UNNECESSARY, BECAUSE SCOPING
; PRECEDES DEINDEXING, AND DEINDEXING ASSUMES FULL USE OF
; KEYWORDS.
;
; FOR HAND-CRAFTED FORMULAS (INCLUDING UNSCOPED ONES), E.G.,
; FOR TEST SUITES, WHERE THESE HAVE NOT BEEN OBTAINED FROM NL
; TEXT AND THUS DON'T ALREADY HAVE TYPE-FLAGGED ATOMS, THE
; "heuristic-type-assignment.lisp" CODE CAN BE USED TO ASSIGN
; SUCH FLAGS (AFTER FIRST LOADING "logical-form-predicates.lisp").
;
; **NOTE: THE TYPE FLAGGING OF ATOMS MAY NOT BE CONSISTENT --
;   I ASSIGN AUTOMATIC FLAGS EQUIVALENT TO THE EXTENSIONS IN
;   CREATING LOGICAL ATOMS, BUT ALSO EXPLICITLY ASSIGN FLAGS LIKE
;   'pred', 'wffmod', etc.
;
; **NOTE: SOME UNCERTAINTIES 
;   -- WHAT'S THE TYPE OF PASV? 
;   -- SINCE "BE" IS PRED-MODIFYING, WHAT TYPE SHOULD IT GET -- JUST V?
;   -- SIMILARLY "SEEMS", "BECOMES", & SUBJ-/OBJ-ADDING OP'S: THEY 
;      HAVE EXTENSIONS '.V' AND AS SUCH GET "RECOGNIZED" AS PREDICATES,
;      AND IT'S UNCLEAR IF THIS CAN CAUSE PROBLEMS.
;   -- DO WE HAVE DIFFERENT TYPES FOR SENTENTIAL AND PRED-MODIFYING
;      MEANINGS OF MODAL AUXILIARIES? CAN I IGNORE THE TYPE AMBIGUITY
;      AS LONG AS I HAVE DIFFERENT LOGICAL SYMBOLS FOR THEM, E.G.,
;      POSSIBLY AND ABLE-TO FOR THE 2 MEANINGS OF 'CAN'?
;
; GENERAL COMMENT ABOUT THESE UNCERTAINTIES: My tentative position 
; concerning atomic types is that the syntactic type distinctions in 
; the parse trees are "good enough" for semantics as well. Much as
; in the case of word sense ambiguity, the syntactic ambiguities
; shouldn't matter as long as our lexical and world axioms use the
; atoms appropriately, i.e., with appropriate arguments.
; 
; Consider for example subcategorization (which of course is not
; discernible from type indicators such as ".v"). How do we distinguish
; e.g., inchoative vs causative forms of "break.v"? Well, we can
; write, for example, 
;    (all x (all y (all e ((x break.v y) ** e) ((y break.v) * e))))
;    (all y (all e ((y break.v) ** e)
;                  (((y intact.a) @ (start-of.f e) and
;                   ((y broken.a) @ (end-of.f e))))))
; There's no ambiguity about the conclusions we draw! (This provides
; the same flexibility as a neo-Davidsonian approach without the need
; to fragment predications, or come up with role names.) 
;
; This does entail tolerance for multiple adicities for EL predicates,
; and I previously thought this was a problem in deciding, e.g.,
; whether (break.v x) is a predicate or a formula, but I think this
; gets resolved if we use infix wff form as a requirement, not just 
; as syntactic sugar.
; ================================================================
;
; ONE POINT I HAD FORGOTTEN ABOUT IN WRITING NEW PROGRAMS IS THAT 
; THE PREVIOUS PROGRAMS HEAVILY DEPENDED ON THE 'TYPE' FLAGS THAT ARE
; ATTACHED TO LOGICAL ATOMS *IN THE PROCESS OF LF-DERIVATION*. SO
; I ENDED UP WRITING UNNECESSARILY COMPLEX PROGRAMS TO *INFER* AND
; FLAG THE TYPES OF THE ATOMS -- BUT THESE PROGRAMS MIGHT BE USEFUL
; FOR AXIOMS *NOT* DERIVED DIRECTLY FROM NL, SAY FOR INFERENCE OR
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
; NOTE: I WILL ASSUME THAT AT THE TOP LEVEL, SCOPING IS ALWAYS
;   FOR A WFF, NOT SOME ELLIPTICAL UTTERANCE (LIKE "JOHN AND MARY",
;   OR "IN VENICE") -- ASSUME THAT LF COMPUTATION EXPANDS THESE TO
;   WFFS USING ANAPHORIC PREDICATES (E.G., HAS-RELEVANT-PROPERTY*.V)
;   OR PRONOUNS; LIKEWISE SOMETHING LIKE "AND THIS IS MARY" WOULD 
;   BE FORMALIZED WITH A PROPOSITIONAL ANAPHOR (E.G., THAT-IS-SO*.PRO)
;   AS INITIAL CONJUNCT.
;
;   SO THE SCOPING PROGRAMS WILL FAIL IF THIS ASSUMPTION IS VIOLATED.
; ================================================================
; Based on "scoping-notes-v2"
;
; Assumptions about accessibility of unscoped elements for scoping in 
; a wff: to be accessible, the unscoped element must not be embedded
; - by a larger expression that binds a variable occurring free in
;   the unscoped element; [added Jan 28/13; I hadn't thought it would
;   be needed, given the left-to-right scoping and variable intro-
;   duction; however, there may be preexisting scoped lambdas in the
;   LF];
; - by a sentence modifier other that 'not' (which allows tense 
;   extraction)
; - by a nonsubsective predicate modifier ('not', 'nearly', ...;
;   however, pres/past generally escape even from these contexts);
;   (Most VP adverbials allow access to unscoped elements they contain,
;   and also don't block access to unscoped elements in the VP; I'm
;   unsure at this point about type-shifting VP operators in generics)
; - by an already scoped quantifier, or already scoped tense operator
;   (unexpected case, when scoping left-to-right, unless some LF rules
;   introduce already-scoped quantifiers or tense operators -- which
;   we would treat as trapping unscoped elements within their scope)
; - in an unscoped conjunction or disjunction of sub-wffs
; - in a verbal sub-wff of the wff, e.g., a subordinate or relative
;   or conjoined verbal clause (even in [wff1 {**,*,@} term], wff1 is
;   considered a sub-wff -- but this is an unexpected case, because
;   episodic operators are introduced after scoping; if it does occur,
;   logical axioms can be used to move certain quantifiers outward).)
; 
; We can recursively use these accessibility rules even when we're
; no longer looking at a wff -- e.g., if some *part* of a wff contains
; a verbal sub-wff, any unscoped elements in that sub-wff are
; inaccessible at the level of the wff; similarly for unscoped sub-wff
; conjunctions/disjunctions, and certain modified and already scoped
; elements. However, we need to distinguish top-level and embedded
; candidate extraction, because at the top level extraction of
; unscoped elements from a clause is *not* blocked.
;
; We don't extract definites or indefinites from scope islands.
; For definites, this is logically unnecessary (if they pick out
; some entity not dependent on variables of embedding quantifiers)
; and for indefinites we can "raise" them, if necessary, either by
; a physical transformation (including the possibility of removing
; an argument of a Skolem function, if we Skolemize) or by equating 
; them to an external entity.

                   ;;;;;;;;;;;;;;
                   ;;          ;;
                   ;; TRACING  ;;
                   ;;          ;;
                   ;;;;;;;;;;;;;;

(defun trace-scoping ( ) (trace scope-coord scope-quan scope-tense 
       scope-pred scope-wff scope-ulf))

        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;                                             ;;
        ;; SOME BASIC FUNCTIONS FOR HANDLING VARIABLES ;;
        ;;                                             ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *vars* ; global variable list, to be used for introducing
           ; variables for unscoped quantifiers. They are also 
           ; used in the related code in "logical-form-predicates.lisp" 
           ; and "heuristic-type-assignment.lisp";
  (append '(x y z v w) ; result: (x y z v w x1 y1 z1 v1 w1 ... z99 v99 w99)
           (let (integers symbols)
                (dotimes (i 99)
                         (dotimes (j 5) (push (+ i 1) integers))
                         (setq symbols (append '(x y z v w) symbols)) )
                (mapcar #'(lambda (x y)
                            (intern (concatenate 'string
                               (string x) (write-to-string y) )))
                            symbols (reverse integers) ))))


(defparameter *remaining-vars* ; used as a global source of variables
         ; in scoping an unscoped formula, starting off with *vars*
         ; and removing elements already used in the current formula.
         ; It is re-initialized in 'scope-ulf', which scopes a top-
         ; level unscoped logical form (it is *not* reinitialized for 
         ; *sub*formulas -- these are processed by 'scope-wff').
  *vars*)


(defun new-var (expr);   
;~~~~~~~~~~~~~~~~~~~~
; Pop the first variable from the global *remaining-vars* list 
; that does not occur as an atom in 'expr'; 
;
 (let ((symbols (symbols-in expr)) var)
      (loop (when (null *remaining-vars*); all 500 *vars* used up?
                  (format t "*** ERROR: ALL 500 VARIABLES IN *VARS* ~
                             HAVE BEEN USED UP FOR A SINGLE FORMULA!")
                  (return-from new-var '*emergency-variable*))
            (setq var (pop *remaining-vars*))
            (if (not (member var symbols))
                (return-from new-var var)))
 )); end of new-var


(defun symbols-in (expr); Aug 1/12; tested
;~~~~~~~~~~~~~~~~~~~~~~~
; Return the list of symbolic atoms occurring in expr
;
 (cond ((null expr) nil)
       ((atom expr) (if (symbolp expr) (list expr) nil))
       (t (append (symbols-in (car expr))
                  (symbols-in (cdr expr))))
 )); end of symbols-in
             

(defun occurs-in (atm expr); Aug 3/12; tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~
; Does the atom 'atm' occur anywhere in 'expr' (any expression)?
; (In fact, atm needn't be an atom, as long as atm is actually
; a part of the expr data structure internally. Here "part of"
; is inclusively understood, i.e., not only list elements of a
; list (& its parts) are parts of it, but also its cdr, cddr, etc.))
;
 (cond ((eql atm expr) t); Note: We assume nil occurs-in nil
       ((atom expr) nil)
       (t (or (occurs-in atm (car expr))
              (occurs-in atm (cdr expr))))
 )); end of occurs-in


(defun occurs-properly-in (xp expr); Jan 28/13; tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Does xp occur as a proper part of expr? (I.e., is it eql to
; a list element of expr, or to a list element of a list element, 
; etc.?)
 (cond ((eql xp expr) nil); for quick exit
       ((atom expr) nil)   ; for quick exit
       (t (find-if #'(lambda (x) (not (null x)))
            (mapcar #'(lambda (xpr) 
                        (or (eql xp xpr)
                            (occurs-properly-in xp xpr)))
                      expr)))
 )); end of occurs-properly in

(defun occurs-free-in (atm expr &optional bound-vars); Jan 28/13; tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Does atm occur in expr, w/o being bound therein by lambda or
; a (scoped) quantifier? The optional bound-vars are gathered
; as we work our way downward to the parts of expr recursively.
;
; Method: If atm is among bound-vars, return nil; otherwise, if
;   expr is atomic, then if it is eql to atm, return t, else nil.
;   O/w find the variable bound at the top level, if any, and add
;   it to bound-vars, and recursively test occurs-free-in on
;   all list elements of expr, with the (possibly) expanded 
;   bound-vars; if any yield a non-nil result, return t, else nil.
;
 (cond ((member atm bound-vars) nil)
       ((atom expr) (if (eql atm expr) t nil))
       (t (if (or (and (eql (car expr) :l) (atom (second expr)))
                  (and (quan? (car expr)) (atom (second expr))))
              (push (second expr) bound-vars))
          (find-if #'(lambda (x) (not (null x)))
                     (mapcar #'(lambda (xpr)
                                 (occurs-free-in atm xpr bound-vars))
                              expr)))
 )); end of occurs-free-in


(defun subst-for-free (val x expr); Aug 1/12
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Substitute val for all free occurrences of atom x in expr.
;
; This is partly adapted from 'subst-free', in "logical-form.lisp", 
; to make the present file more self-contained. But in addition the 
; present version makes an occurs-check, and also checks whether 
; expr is of form (func x ...), i.e., a function w/o keyword :f, 
; in which case x is not bound by func. The latter is a redundant 
; check inasmuch as automatically produced LFs will contain keyword 
; :f for all applications of functions to terms. But the 'subst-for-free' 
; version is intended to be somewhat robust, and usable for testing 
; "sloppy" handcrafted LFs.
;
; Making an occurs-check means that we allow for the possibility 
; that val may contain a free variable that is bound somewhere 
; in expr. The program does so by renaming such bound variables.
; Parts of the result returned are kept EQL to EXPR as much as 
; possible. (Thus if no substitution is made, the result is EQL 
; to EXPR.)
;
 (let (renamed-expr)
   (cond ((eql expr x) val)
         ((atom expr) expr)
         ((not (occurs-in x expr)) expr)
         ; is X bound at the top of EXPR by a quantifier or :l?
         ((and (cdr expr) (cddr expr) ; at least 3 elements
               (second expr) (symbolp (second expr)); possibly a
               (not (keywordp (second expr)))       ; bound variable?
               (not (member (car expr) '(:a :f :i :o :p :q :r))) ; Note:
                ; we phrase the check this way in case we have a scoped 
                ; quantifier, and thus no keyword
               (not (functor? (car expr))))
          (cond ((eq (second expr) x); is the bound variable x?
                 expr); if so, return expr unchanged
                ((occurs-in (second expr) val); occurs-check positive?
                 ; first rename the variable, then substitute recursively
                 (setq renamed-expr
                    (cons (car expr); :l or the quantifier
                          (subst-for-free 
                             (new-var (list val (cdr expr))); new name...
                             (second expr); old variable
                             (cdr expr)))); all but :l or quantifier
                 (mapcar #'(lambda (y) (subst-for-free val x y)) renamed-expr))
                (t ; the bound variable isn't x, & doesn't occur in val
                  (mapcar #'(lambda (y) (subst-for-free val x y)) expr))))
         (t ; x occurs within expr, but not as a top-level bound variable
           (mapcar #'(lambda (y) (subst-for-free val x y)) expr)))
 )); end of subst-for-free


        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        ;;                                                      ;;
        ;; ADDING MISSING KEYWORDS TO A (POSSIBLY "SLOPPY") ULF ;;
        ;;                                                      ;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun add-missing-keywords-to (ulf); Aug 4/12; tested.
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; We augment functions occurring in 'ulf' (at least those important 
; in deindexing, viz., past, pres, perf, prog, futr, fpres, ppres) 
; with keyword :f if necessary.
;
; ** Note: This function assumes (as a result of the way 'predmod?'
;          is defined) that the missing keyword in something like
;          (:f nearly (be.v dead.a)) or (:f quickly (become.v tired.a))
;          is :f (in front of 'be.v' or 'become.v') rather than :p;
;          the syntactic status of predicate-taking verbs remains 
;          generally somewhat undecided.
;
 (cond ((atom ulf) ulf)
       ((keywordp (car ulf))
        (mapcar #'add-missing-keywords-to ulf))
       ((and (atom (car ulf)) (not (symbolp (car ulf))))
        (mapcar #'add-missing-keywords-to ulf))
       ; (car ulf) is a symbolic atom or list
       ((and (atom (car ulf))
             (member (car ulf) '(pres past perf prog futr fpres ppres)))
        (cons :f (mapcar #'add-missing-keywords-to ulf)))
       ((and (atom (car ulf)) 
             (member (car ulf) '(that that.comp that.compl K Ka Ke
                             whether qnom ans-to set-of-all
                             adv-s adv-e adv-a adv-f adv-m)))
        ; ** Perhaps we should omit explicit :f for these fixed functors??
        (cons :f (mapcar #'add-missing-keywords-to ulf)))
       ((and (term? (car ulf)) (predk? (second ulf))); formula w/o :i?
        (cons :i (mapcar #'add-missing-keywords-to ulf)))
       ((and (predmod? (car ulf)) (pred? (second ulf))); predmod w/o :f?
        (cons :f (mapcar #'add-missing-keywords-to ulf)))
       ((wff? (car ulf))
        (cond ((wff? (third ulf)) ; coordinated wffs w/o :i?
               (cons :i (mapcar #'add-missing-keywords-to ulf)))
              (t; perhaps an episodic ulf (unexpected)
               (mapcar #'add-missing-keywords-to ulf))))
       ((and (predk? (car ulf)) (term? (second ulf))); pred applic'n w/o :p?
        (cons :p (mapcar #'add-missing-keywords-to ulf)))
       ((and (wffmod? (car ulf)) (wff? (second ulf))); modified wff w/o :f?
        (cons :f (mapcar #'add-missing-keywords-to ulf)))
       ; the only remaining case seems to be that (car ulf) is a quantifier
       (t (mapcar #'add-missing-keywords-to ulf))
 )); end of add-missing-keywords-to


             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
             ;;                            ;;
             ;; FINDING SCOPING CANDIDATES ;;
             ;;                            ;;
             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun scoping-candidates (expr)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Find accessible unscoped elements, if any, in the given expr
; (originally a wff); do this by returning the expr itself if it is
; unscoped, followed by the scoping candidates from all parts that
; are *not* scope islands as determined by the conditions listed in
; the comments preceding the code in this file.
;
 (prog (tensed-expr candidates)
       (if (atom expr) (return nil))
       ; 3 island constraints, i.e., expression patterns that block 
       ; unscoped-element extraction; (for robustness, keyword ":f" 
       ; is kept optional):
       (if (or (and (eq (car expr) :f) 
                    (wffmod? (second expr)) (wff? (third expr)))
               (and (wffmod? (car expr)) (wff? (second expr)))
               (and (quan? (car expr)) (wff? (third expr)))
               (and (eq (car expr) :f) 
                    (member (second expr) '(pres past)) (wff? (third expr)))
               (and (member (car expr) '(pres past)) (wff? (second expr)) ))
           (return nil))

       ; If expr consists of 'not' applied to a NONverbal wff, return nil;
       ; (normally only tense can escape from a negation)
       (if (or (and (eq (car expr) :f)
                    (member (second expr) '(not not.adv not.ads))
                    (wff? (third expr))
                    (not (verbal-wff? (third expr))))
               (and (member (car expr) '(not not.adv not.ads))
                    (wff? (second expr))
                    (not (verbal-wff? (second expr)))))
           (return nil))

       ; ADDED NOV 10/15:
       ; If expr consists of 'not' applied to a wff that has an external
       ; unscoped tense operator applied to it (as may happen when semantic
       ; rules interpret pres|past directly as sentence-level), extract 
       ; the tense expression of the formula and return it in a singleton 
       ; list (only tense easily moves out of negation):
       (when (or (and (eq (car expr) :f)
                      (member (second expr) '(not not.adv not.ads))
                      (wff? (third expr)))
                 (and (member (car expr) '(not not.adv not.ads))
                      (wff? (second expr))))
             (setq tensed-expr (find-unscoped-tensed-expr
                                 (if (eq (car expr) :f)
                                     (third expr)
                                     (second expr))))
             (if tensed-expr (return (list tensed-expr))))
             ; failure does not mean there's no unscoped tense -- it
             ; may be part of the predicate of the wff; so we continue
     
       ; If expr consists of 'not' applied to a verbal wff, extract the tense 
       ; expression of the predicate of the formula (if any) and return 
       ; it in a singleton list, if non-nil, o/w return nil (only tense 
       ; easily moves out of negation):
       (when (or (and (eq (car expr) :f) 
                      (member (second expr) '(not not.adv not.ads))
                      (verbal-wff? (third expr)))
                 (and (member (car expr) '(not not.adv not.ads))
                      (verbal-wff? (second expr))))
             (setq tensed-expr (find-unscoped-tensed-expr 
                                 (if (eq (car expr) :f) 
                                    (find-pred-of-verbal-wff (third expr))
                                    (find-pred-of-verbal-wff (second expr)))))
             (if tensed-expr (return (list tensed-expr))
                             (return nil)))
     
       ; If expr consists of a nonsubsective predicate modifier 
       ; applied to a predicate, extract the tense expression of 
       ; the predicate (if any) and return it as a singleton list
       ; (if non-empty), o/w return nil (only tense easily moves out):
       (when (or (and (eq (car expr) :f) (nonsubsective-predmod? (second expr))
                      (verbal-pred? (third expr)))
                 (and (nonsubsective-predmod? (car expr))
                      (verbal-pred? (second expr))))
             (setq tensed-expr (find-unscoped-tensed-expr 
                               (if (eq (car expr) :f) 
                                   (third expr)
                                   (second expr))))
             (if tensed-expr (return (list tensed-expr))
                             (return nil)))
      
       ; If expr is an unscoped coordination of wffs, extract only
       ; expr itself -- the wffs are scope islands:
       (if (or (and (eq (car expr) :o) (coord? (second expr))
                    (wff? (third expr)))
               (and (coord? (car expr)) (wff? (second expr))) )
           (return (list expr)))

       ; If expr is an unscoped quantified term, an unscoped tense-
       ; modified expression, or an unscoped coordinated expression
       ; (other than coordinated wffs -- they were handled in the 
       ; previous step), then initiate the candidates with (list expr):
       (if (or (eq (car expr) :q) 
                   ; I previously also checked (quan? (second expr))
                   ; and (pred? (third expr)) so that faulty instances
                   ; of 'pred?' and 'quan?' would cause detectable errors,
                   ; but decided that robust identification of unscoped
                   ; quantifiers is more important
               (and (eq (car expr) :o)
                    (member (second expr) '(pres past)) (third expr)
                    (null (fourth expr)))
               (and (eq (car expr) :o)
                    (coord? (second expr)) (third expr))
               (and (coord? (car expr)) (second expr)))
           (setq candidates (list expr)))

      ; Recursively add further candidates (nothing will be added
      ; for embedded verbal wffs, or for subexpressions filtered
      ; out by the above island constraints):
      (setq candidates 
            (append candidates
               (apply 'append 
                   (mapcar #'embedded-scoping-candidates expr))))
      ; Drop candidates that contain a free variable bound in expr
      ; outside of the candidate.
      (setq candidates 
         (remove-if #'(lambda (x) (binding-constrained-candidate x expr))
                      candidates))
      (return candidates)
 )); end of scoping-candidates

(defun binding-constrained-candidate (xp expr); Jan 28/13; tested
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; xp: an unscoped subexpression of expr (a colon-keyword version of
;     a logical formula or smaller expression)
; Determine whether xp is a subexpression of expr, where expr
; contains a variable-binding operator (lambda or quantifier) that
; lies outside of xp itself but binds a free variable in xp.
;
; Method: If there is a variable-binding operator at the top level,
;   and the variable it binds occurs free in xp, return t; o/w
;   check for each top-level subexpression of expr whether xp occurs
;   in it and is binding-constrained relative to it, returning t if
;   this comes out as t for any of those subexpressions, and nil o/w.
;
  (cond ((atom xp) nil) ; unexpected!
        ((atom expr) nil) ; just needed for recursion to bottom out
        ((eql xp expr) nil) ; for speed
        ((not (occurs-properly-in xp expr)) nil); also for recursion

        ; June 18/14: Exempt xp = (:O {pres|past} ...) from the check,
        ; since tense scoping carries no material containing a variable
        ; "upward/outward" (** not sure about this -- may give 
        ; unintuitive scopings!):
        ((and (eq (car xp) :o) (member (second xp) '(pres past))) nil)

        ; top-level lambda, or top-level scoped quantifier (unexpected)?
        ((or (and (eq (car expr) :l) (occurs-free-in (second expr) xp))
             (and (quan? (car expr)) (atom (second expr))
                  (occurs-free-in (second expr) xp))) t)
        ; embedded binding operator, outside xp, binding smthg in xp?
        (t (find-if #'(lambda (x) (not (null x)))
             (mapcar #'(lambda (xpr) 
                        (binding-constrained-candidate xp xpr)) expr)))
 )); end of binding-constrained-candidate
 

(defun find-unscoped-tensed-expr (verbal-pred); Aug 2/12
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; The input must be a verbal pred (as determined by 'verbal-pred?').
; Find a top-level or superficially embedded unscoped-tense expression
; (usually just a tensed atomic verb, but some tensed lexical verbs
; might have non-atomic logical translations); similar to 'verbal-pred?', 
; but omitting consideration of coordinated expressions (since a conjunct 
; or disjunct based on a tensed verb is a strong scope island).
;
; This program is necessary because tense tends to scope outside
; modified verbal predicates EVEN WHEN THE MODIFIER IS NON-SUBSECTIVE
; (whereas quantifiers and binary connectives tend to stay inside; e.g.,
; in "He almost died", it's not that an event of almost-dying-in-the-past
; happened, but rather, that in the past an event of almost-dying 
; happened; by contrast, "He almost solved every problem" is likely
; to be understood as referring to near-completion of the entire set
; of problems, rather than near-completion of each problem individually).
;
  (cond ((atom verbal-pred) nil); an atom can't be tense-modified
        ;
        ; complex verbal predicates can be tense- or adverbially modified
        ; verbal predicates, or verbal predicates applied to one or more
        ; arguments; or lambda abstracts of verbal clauses or of verbal
        ; predicates; but we do not extract from coordinated expressions.
        ;
        ; is verbal-pred itself tense-modified?
        ((and (eq (car verbal-pred) :o) 
                  (member (second verbal-pred) '(pres past))) verbal-pred)
        ; is verbal-pred a verbal pred applied to at least one argument?
        ((and (member (car verbal-pred) '(:p :f)); allow some sloppiness
              (cddr verbal-pred); at least one argument
              (verbal-pred? (second verbal-pred))); e.g., "became sick"
         (find-unscoped-tensed-expr (second verbal-pred)))
        ; same configuration but without keyword :p or :f?
        ((and (cdr verbal-pred) (verbal-pred? (car verbal-pred)))
         (find-unscoped-tensed-expr (car verbal-pred)))
        ; is verbal-pred a modified verbal pred?
        ((and (eq (car verbal-pred) :f)
              (cddr verbal-pred); at least one argument (2+ args tolerated)
              (predmod? (second verbal-pred))
              (verbal-pred? (third verbal-pred))); e.g., "quickly left"
         (find-unscoped-tensed-expr (third verbal-pred)))
        ; same configuration but without keyword :f?
        ((and (cdr verbal-pred)
              (predmod? (car verbal-pred))
              (verbal-pred? (second verbal-pred)))
         (find-unscoped-tensed-expr (second verbal-pred)))
        ; lambda abstract forming a verbal pred?
        ((eq (car verbal-pred) :l)
         (cond ; Is this an abstraction from another verbal pred (rather
               ; than from a wff) -- an unlikely construction?
               ((verbal-pred? (third verbal-pred))
                (find-unscoped-tensed-expr (third verbal-pred)))
               ; Is this an abstraction from an (uncoordinated) wff?
               ;   E.g., (:l x (:i x (:o past laugh.v)));
               ; NOTE: Coordinated or modified embedded sentences
               ;   don't permit tense extraction; e.g., for 
               ;   (:l x (:f maybe (:i x (:o past laugh.v)))),
               ;   'maybe' takes scope over the embedded tense.
               ((and (listp (third verbal-pred)) 
                     (eq (car (third verbal-pred)) :i)
                     (verbal-pred? (third (third verbal-pred))))
                (find-unscoped-tensed-expr (third (third verbal-pred))))
                ; same configuration by with :i keyword omitted?
               ((and (listp (third verbal-pred)) 
                     (term? (car (third verbal-pred)))
                     (verbal-pred? (second (third verbal-pred))))
                (find-unscoped-tensed-expr (second (third verbal-pred))))
               ; Is this an abstraction from a wff consisting of an
               ; unscoped tense operator applied to a wff?
               ;   E.g., (:l x (:o past (:i x laugh.v)));
               ((and (listp (third verbal-pred))
                     (eq (car (third verbal-pred)) :o)
                     (member (second (third verbal-pred)) '(pres past)))
                (third verbal-pred)) ))
        (t nil)
 )); end of find-unscoped-tensed-expr

        
(defun find-pred-of-verbal-wff (wff); Jun 18/14
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; 'wff' has been determined to be a wff based on a verbal predicate;
; find its predicate, provided that the wff is not coordinated or
; has a scoped pres|past operator
;
  (cond ((atom wff) nil)
        ; infixed verbal predicate?
        ((and (eq (car wff) :i) (verbal-pred? (third wff))) 
         (third wff))
        ((and (term? (car wff)) (verbal-pred? (second wff)))
         (second wff))

        ; unscoped coordinator applied to wffs? (Return nil)
        ((and (eq (car wff) :o) (coord? (second wff))) nil)
               
        ; unscoped tense applied to a wff?
        ((and (eq (car wff) :o) (member (second wff) '(pres past)))
         (find-pred-of-verbal-wff (third wff)))

        ; scoped coordinator infixed to wffs? (Return nil)
        ((and (eq (car wff) :i) (wff? (second wff))
              (not (member (third wff) '(** * @)))) nil)
        ((and (wff? (car wff)) (wff? (third wff))
              (not (member (second wff) '(** * @)))) nil)

        ; modified verbal wff? (Include flattened negation)
        ((and (eq (car wff) :f)
              (not (member (second wff) '(that that.comp that.compl Ke)))
              (wff? (third wff)) ) (find-pred-of-verbal-wff (third wff)) )
        ((and (wffmod? (car wff)) (wff? (second wff))) 
         (find-pred-of-verbal-wff (second wff)))
        ((and (eq (car wff) 'not) 
              (not (wff? (second wff))) (wff? (cdr wff)))
         (find-pred-of-verbal-wff (cdr wff)))

        ; quantified verbal wff?
        ((quan? (car wff))
         (if (cdddr wff); restricted quantifier?
             (find-pred-of-verbal-wff (fourth wff))
             (find-pred-of-verbal-wff (third wff)) ))

        ; verbal wff embedded by episodic operator?
        ((and (eq (car wff) :i) (member (third wff) '(** * @)))
         (find-pred-of-verbal-wff (second wff)))
        ((member (second wff) '(** * @))
         (find-pred-of-verbal-wff (car wff)))

        (t nil)
 )); end of find-pred-of-verbal-wff

(defun embedded-scoping-candidates (expr)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Find accessible unscoped elements in a subexpression of a wff.
; We block extraction from embedded verbal wffs (relative clauses,
; clausal adverbials, nominalized clauses), conjuncts, and also
; clauses embedded by episodic operators, i.e., scoping is done
; *within* the operator scopes, though certain quantifiers and
; coordinators may be "raised" axiomatically or by Skolemization
; later). Note that extraction from verbal *predicates* is not 
; blocked (unless embedded by a nonsubsective modifier, as
; detected by 'scoping-candidates').
;
 (if (or (atom expr) (verbal-wff? expr)) 
     nil
     (scoping-candidates expr)
 )); end of embedded-scoping-candidates


             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
             ;;                             ;;
             ;; SCOPING AN UNSCOPED FORMULA ;;
             ;;                             ;;
             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun scope-ulf (ulf); Aug 3/12
;~~~~~~~~~~~~~~~~~~~~~
; This is the top-level scoping program, which is not used
; recursively, but just adds any missing keywords to ulf, 
; re-initializes *remaining-vars* to *vars* and calls 'scope-wff'.
;
 (let ((ulf-proper (add-missing-keywords-to ulf)))
    (if (and (not (occurs-in :o ulf)) (not (occurs-in :q ulf)))
        (return-from scope-ulf ulf-proper)); no unscoped elements
    (setq *remaining-vars* *vars*)
    (scope-wff ulf-proper)
 )); end of scope-ulf


(defun scope-wff (wff)
;~~~~~~~~~~~~~~~~~~~~~
; Find the accessible unscoped elements, & scope the "wide-scope 
; winner", which will also cause recursive top-level scoping of 
; the rest of the formula. If there are no (more) accessible
; unscoped elements (but the formula does contain inaccessible
; unscoped elements), apply mapcar recursion using 'scope'
; (applicable to all expressions)
;
; So in general, the 'wff' to which this is applied may have had
; unscoped elements extracted already
;
 (prog (candidates expr)
    (if (atom wff) (return wff))
    ; **We could first check if wff contains any unscoped elements,
    ; to avoid reassembling wff in that case, but this is not so
    ; simple to check (esp if we allow for omission of :o, :q
    ; keywords), so is not included yet

    (setq candidates (scoping-candidates wff)); pointers into wff
    ; this could include the entire wff, if it is an unscoped coord-
    ; ination of wffs or a wff modified by an unscoped tense operator

    ; If there are no accessible unscoped elements, recursively scope 
    ; all parts:
    (if (null candidates)
        (return (mapcar #'scope wff)))

    ; There are accessible unscoped candidates for scoping.
    ; Scope the presumed widest-scope candidate:
    (setq expr (wide-scope-winner candidates))
    (if (eq (car expr) :q) 
        (return (scope-quan expr wff)))
    (if (and (eq (car expr) :o)
             (member (second expr) '(pres past)) 
             (third expr) (null (fourth expr)))
        (return (scope-tense expr wff)))
    ; the unscoped operator must be unscoped coordination:
    (return (scope-coord expr wff))
 )); end of scope-wff


(defun wide-scope-winner (unscoped-elements)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; The given unscoped-elements are in left-to-right order, and
; (justified by the constituent order in unscoped LF) we pick 
; the leftmost as the default, except for giving preference to tense.
 (let (tense-expr)
   (setq tense-expr 
     (find-if 
       #'(lambda (x) 
           (and (eq (car x) :o) 
                (member (second x) '(pres past))
                (third x) (null (fourth x)))) unscoped-elements))
   (if tense-expr tense-expr 
       (car unscoped-elements))
 )); end of wide-scope-winner


(defun scope (expr)
;~~~~~~~~~~~~~~~~~~
; The input expr could be any expression, but we scope only wffs and 
; monadic preds (though wff/pred *parts* of other expressions are
; also scoped by recursion).
;
 (if (atom expr) 
     expr
     (if (wff? expr)
         (scope-wff expr)
         (if (pred? expr)
             (scope-pred expr)
             (mapcar #'scope expr)))
 )); end of scope


(defun scope-pred (pred)
;~~~~~~~~~~~~~~~~~~~~~~~
; lambda-abstract if necessary, then use scope-wff on the embedded wff;
; used only when no unscoped elements of pred can be scoped as part of
; a larger wff
;
 (prog (var)
    (if (atom pred) (return pred))
    ; **We could first check if pred contains any unscoped elements,
    ; to avoid reassembling pred in that case, but this is not so
    ; simple to check, so is not included yet

    ; Modified pred? (with or without ":f" keyword)
    (if (and (eq (car pred) :f)
             (nonsubsective-predmod? (second pred)) 
             (pred? (third pred)) (null (fourth pred)))
        (return (list :f (scope (second pred)) (scope-pred (third pred)))))
    (if (and (nonsubsective-predmod? (car pred)) (pred? (second pred))
             (null (third pred)))
        (return (list (scope (first pred)) (scope-pred (second pred)))))

    ; Lambda predicate?
    (if (and (eq (car pred) :l) (second pred) (third pred))
        (return (list :l (second pred) (scope-wff (third pred)))))

    ; Nonmonadic pred applied to term(s)? (with or without ":p" keyword)
    (when (and (eq (car pred) :p) (predk? (second pred)) (third pred))
          (setq var (new-var pred))
          (return (list :l var (scope-wff 
                                 (cons :i (cons var (cdr pred)))))))
    (when (and (predk? (car pred)) (second pred))
          (setq var (new-var pred))
          (return (list :l var (scope-wff 
                                 (cons :i (cons var pred))))))
    (return (mapcar #'scope pred))
 )); end of scope-pred


;; *** THE FOLLOWING ARE HASTILY WRITTEN AND NEED TO BE SCRUTINIZED
;;     Are the substitutions (based by default on 'EQ') going to work?

(defun scope-tense (expr wff)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; expr is of form (:o {pres,past} expr1); it points at or into wff;
; we replace expr by expr1 in wff, and wrap :f {pres,past} around the
; result of the resulting wff.
;
 (if (eql expr wff) 
     (scope-wff (cons :f (cdr wff)))
     (list :f (second expr) ; the tense operator
           (scope-wff (subst (third expr) expr wff)))
           ; Note: We're substituting a part of expr for the entire 
           ;       expr within wff.
 )); end of scope-tense


(defun scope-quan (expr wff)
;~~~~~~~~~~~~~~~~~~~~~~~~~~
; expr is of form (:q quan pred); if expr is the entire wff, 
; then wff is an unrestrictedly quantified formula.
;
 (let ((quan (second expr)) (x (new-var wff)) (pred (third expr)) restr)
      ; Prepare restrictor using new variable as subject
      (cond ((atom pred) 
             (setq restr (list :i x pred)))
            ((eq (car pred) :p) ; explicit predicate application
             (setq restr (cons :i (cons x (cdr pred)))))
            ((eq (car pred) :l) ; lambda predicate
             (setq restr (subst-for-free x ; replace old var
                                      (second pred) (third pred))))
            ((predk? (car pred)); implicit predicate application
             (setq restr (cons :i (cons x pred))))
            (t ; remaining case: pred is a modified/coordinated predicate
             (setq restr (list :i x pred))))
      (if (eql expr wff); is restr actually the body of (unrestricted) wff?
          (list quan x (scope-wff restr))
          (list quan x (scope-wff restr); wff is restricted
                       (scope-wff (subst x expr wff))))
 )); end of scope-quan


(defun scope-coord (expr wff)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~
; expr is of form 
;   (:o {and,or,either-or,neither-nor,but,as-well-as} 
;       expr1 expr2 ... exprk)
;
  (if (eql expr wff); top-level sentence coordination
      (insert-coord (second expr); adds :i and infixes coord
         (mapcar #'scope-wff (cddr wff)))
      (insert-coord (second expr)
         (mapcar #'scope-wff 
             (mapcar #'(lambda (x) (subst x expr wff)) 
                       (cddr expr))))
 )); end of scope-coord


(defun insert-coord (coord wffs)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; adds :i and inserts infixed coord 
  (cons :i (cons (car wffs) (cons coord (cdr wffs)))))
      

