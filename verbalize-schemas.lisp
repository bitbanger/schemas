(load "schema-el-lex.lisp")
(load "ll-util.lisp")
; Oct 3/21 Copied from 
; ~schubert/lawley/research/stories-converted-to-schemas-oct03-21-my-tt-speculations
; There are more examples in
; ~schubert/lawley/research/stories-converted-to-schemas-oct01-21
; and a large collection of stories & corresponding schemas at
; https://files.slack.com/files-pri/T5Q8VANRY-F02FZC6MMUP/wed-3.txt
; 
; Speculations about using TT to generate English verbalizations of schemas
; `````````````````````````````````````````````````````````````````````````
; Example:
;
 (SETQ *EG-SCHEMA*
 '(EPI-SCHEMA ((FRIEND103.SK REQUEST_ACTION.7.V VIOLINIST104.SK
                (KA (TRY.V IT.PRO)))
               ** E102.SK)
          (:ROLES
                  (!R1 (FRIEND103.SK AGENT.N))
                  (!R2 (VIOLINIST104.SK AGENT.N))
                  (!R3 ((KA (TRY.V IT.PRO)) ACTION.N))
                  (!R4 (NOT (FRIEND103.SK = VIOLINIST104.SK)))
                  (!R5 (VIOLINIST104.SK VIOLINIST.N))
                  (!R6 (FRIEND103.SK FRIEND.N))
                  (!R7 (FRIEND103.SK (PERTAIN-TO VIOLINIST104.SK)))
          )
          (:GOALS
                  (?G1 (FRIEND103.SK (WANT.V VIOLINIST104.SK (KA (TRY.V IT.PRO)))))
                  (?G2 (FRIEND103.SK (WANT.V (THAT (FRIEND103.SK (TRY.V IT.PRO))))))
          )
          (:STEPS
                  (?E1 (FRIEND103.SK (ASK.V VIOLINIST104.SK (KA (TRY.V IT.PRO)))))
                  (?E2 (VIOLINIST104.SK (TRY.V IT.PRO)))
          )
          (:EPISODE-RELATIONS
                  (!W1 (?G1 CAUSE-OF ?E1))
                  (!W2 (?E1 CAUSE-OF ?E2))
          )
          (:NECESSITIES
                  (!N1 (!R1 NECESSARY-TO-DEGREE 1.0))
                  (!N2 (!R2 NECESSARY-TO-DEGREE 1.0))
                  (!N3 (!R3 NECESSARY-TO-DEGREE 1.0))
                  (!N4 (!R4 NECESSARY-TO-DEGREE 1.0))
          )
  ))
; 
; [My attempt to verbalize the above:
; ``````````````````````````````````
;   Schema header: a friend of a violinist requests {of} the violinist
;      to try a specific thing:
;   Additional roles: None.
;   Preconditions: None made explicit.
;   Goals: (1) The friend wants the violinist to try the particular thing.
;          (2) The friend wants him/herself to try the particular thing [ERROR].
;   Steps: (1) The friend asks the violinist to try the particular thing.
;          (2) The violinist tries the particular thing.
;   Effects: None made explicit.
;   Episode relations: Goal 1 is the cause of Step 1.
;                      Step 1 is the cause of Step 2.
; ]
  
; ** PROBABLY NOT NEEDED
  (setq *role-names* nil)
  (dotimes (i 100) 
           (push (intern (concatenate 'string "R" (format nil "~s" i)))
                 *role-names*))
  (setq *role-names* (reverse *role-names*))
; **

(defun verbalize-schema (schema)
;``````````````````````````````
; schema: an epi-schema in the form assumed by Lane.
;
 (let (header main-event main-predication main-pred main-roles role-types
       preconds goals steps effects episode-relations term-ht terms
       typed-terms types bad-type untyped-terms additional-roles 
       english-header english-additional-roles english-preconds english-goals 
       english-steps english-effects english-episode-relations result)

      (setq header (second schema))
      (setq header (repair-composite-header header))
      (if (not (eq (second header) '**))
          (return-from verbalize-schema (verbalize-obj-schema schema)))

      ; Extract the components of the schema that will be separately
      ; verbalized:
      ;
      (setq main-event (third header))
      (setq main-predication (car header))
      (setq main-pred (find-if #'!verb~ main-predication))
      (if (null main-pred)
          (return-from verbalize-schema 
           '(*** the schema header of the given schema lacks a verbal predicate)))
      (setq main-roles (terms-appearing-in main-predication))
                       ;`````````````` finds all atomic terms in each listed wff
      (setq role-types 
            (find-if #'(lambda (x) (eq (car x) :roles)) (cddr schema)))
      (setq goals
            (find-if #'(lambda (x) (eq (car x) :goals)) (cddr schema)))
      (setq preconds
            (find-if #'(lambda (x) (eq (car x) :preconds)) (cddr schema)))
      (setq steps 
            (find-if #'(lambda (x) (eq (car x) :steps)) (cddr schema)))
      (setq effects
            (find-if #'
              (lambda (x) (member (car x) '(:postconds :effects :results))) 
              (cddr schema))) ; equivalent terms ``````````````````````
      (setq episode-relations
            (find-if #'(lambda (x) (eq (car x) :episode-relations)) (cddr schema)))

      ; Find partially-English indefinite phrases to express the various ATOMIC
      ; roles, including undeclared ones. First collect all atomic argument
      ; terms occurring in the schema (except in episode-relations)
      ;
      (setq term-ht (make-hash-table :test 'equal))
      (setq typed-terms (terms-appearing-in (mapcar #'cadr (cdr role-types))))
                                ; (drop the initial ':roles') ^^^^^^^^^^^^^
      (setq typed-terms (remove-duplicates typed-terms))
      (setq terms 
            (append typed-terms
               (terms-appearing-in1 ; DEBUG VARIANT OF terms-appearing-in
                 (cons main-predication
                   (apply #'append
                     (mapcar #'cadr (cdr goals))
                     (mapcar #'cadr (cdr preconds))
                     (mapcar #'cadr (cdr steps))
                     (mapcar #'cadr (cdr effects)))))))
      (setq terms (remove-duplicates terms))
;     (format t "~%@@ terms in schema = ~s" terms); DEBUG
      (setq untyped-terms (set-difference terms typed-terms :test 'equal))

      ; We provide context-independent general types for the untyped atomic
      ; terms (** could be improved on, using a wff as context!)
      ; But we also add these types to the type-info for typed terms,
      ; because it may be more specific, e.g., person_named_allie.n rather
      ; than just agent.n.
      (dolist (term terms)
         (cond ((or (find term '(it.pro that.pro this.pro)) 
                    (atom-starting-with-one-of term '("IT" "THAT" "THIS")))
                (push 'specific_thing.n (gethash term term-ht)))
               ((or (find term '(they.pro them.pro these.pro those.pro))
                    (atom-starting-with-one-of term '("THE" "THO")))
                (push '(plur specific_thing.n) (gethash term term-ht)))
               ((or (find term '(you.pro ya.pro I.pro me.pro))
                    (atom-starting-with-one-of term '("YOU" "YA" "ME")))
                (push 'person.n (gethash term term-ht)))
               ((or (find term '(she.pro her.pro))
                    (atom-starting-with-one-of term '("SHE" "HER")))
                (push 'female.n (gethash term term-ht)))
               ((or (find term '(he.pro him.pro))
                    (atom-starting-with-one-of term '("HE" "HI")))
                (push 'male.n (gethash term term-ht)))
               ((!name~ term)
                (push (intern (concatenate 'string "PERSON_NAMED_"
                                 (reverse (subseq (reverse (string term)) 5))
                                 ".N")) ;          drop ".name", add ".n"
                      (gethash term term-ht)))
               ((atom term) (push 'entity.n (gethash term term-ht)))
               ; Complex terms like (KA ...), (THAT ...) omitted, because
               ; they are verbalized using their structure, and the types
               ; of atomic arguments occurring in them.
               (t nil)))

      ; Now collect type info about the (a priori) typed-terms in term-ht:
      (dolist (role-type (cdr role-types)) ; (drop the initial ':roles')
        ;(format t "~%@@ role-type = ~s, pred = ~s, term = ~s"   ; DEBUG
        ;         role-type (cadadr role-type) (caadr role-type)); DEBUG
         ; collect the type information about each role entity in term-ht;
         ; but ignore negative constraints:
         (if (and (atom (car (second role-type))); atomic term?
                  (find (car (second role-type)) typed-terms); e.g., not 'NOT'!
                  (null (cddr (second role-type)))); monadic predication?
             (push (cadadr role-type) (gethash (caadr role-type) term-ht)) ))
      
      ; Now all atomic pred-arguments anywhere in the schema (except in
      ; episode-relations) have at least one type listed in term-ht,
      ; which will be used to construct English verbalizations.
      (dolist (term terms); store an indefinite description, e.g.,
                          ; (a violinist) or (a friend of ?y)
         (setq types (gethash term term-ht))
         ; cull self-referential predicates (which shouldn't happen, but do)
         (setq bad-type (find-if #'(lambda (x) (occurs-in term x)) types))
         (if bad-type (setf (gethash term term-ht)
                            (remove bad-type types :test 'equal)))
;        (format t "~%## verbalize-schema: term = ~s, ~
;                   ~%## type-info = ~s" term (gethash term term-ht)); DEBUG
         (setf (gethash `(descr ,term) term-ht) (indef-descr term term-ht)))

      ; For separately outputting the the set of atomic role types not
      ; occurring in the header:
      (setq additional-roles
         (set-difference terms main-roles :test 'equal))

      ; When we use the descriptions of terms sequentially below, 
      ; if a term of the same type has been previously used, and the current
      ; determiner is "a/an", we change the determiner to "a second", and if
      ; the current determiner is "a second", we change this to "a third", etc.
      ; After the first use of the description of a term, we'll change
      ; the "a" or "an" to "the", change "a second" to "the second", etc.
      ; Thus the contents of term-ht are modified by the following steps.
      ;
      (setq english-header (header2english main-event main-predication term-ht))
      (setq english-additional-roles 
            (additional-roles2english additional-roles term-ht))
      (setq english-preconds (preconds2english preconds term-ht))
      (setq english-goals (goals2english goals term-ht))
      (setq english-steps (steps2english steps term-ht))
      (setq english-effects (effects2english effects term-ht))
      (setq english-episode-relations 
            (episode-relations2english episode-relations term-ht))
      ;
      (setq result 
            (list english-header english-additional-roles english-preconds 
                  english-goals english-steps english-effects 
                  english-episode-relations))
      ; (If there are no steps, english-steps will be NIL, and if there are no
      ; episode-relations english-episode-relations will be NIL. For other NIL
      ; components, "None made explicit" is output.)
      ;
      (setq result (remove nil result)); but we use a print routine to format this
 )); end of verbalize-schema

(defun repair-composite-header (header)
;`````````````````````````````````````
 (prog ((main-pred (car header)) )
       (if (find-if #'!verb~ main-pred) (return header))
       (cond ((not (find-if #'listp main-pred))
              (setq main-pred
                    (append `(,(car main-pred) *verb.v) (cddr main-pred)))
              (return (cons main-pred (cdr header))))
             ((listp (second main-pred))
              (setq main-pred
                    (cons (car main-pred)
                            (cons (cons '*verb.v (cdr (second main-pred)))
                                  (cddr main-pred))))
              (return (cons main-pred (cdr header))))
             (t header))
  )); end of repair-composite-header
          

(defun atom-starting-with-one-of (atm strings); tested
;````````````````````````````````````````````
 (let (str n)
      (cond ((listp atm) nil)
            (t (setq str (format nil "~s" atm))
               (setq n (length str))
               (find-if #'(lambda (x) (not (null x)))
                  (mapcar 
                   #'(lambda (x) 
                      (let (m) (setq m (length x))
                         (and (<= m n) (string-equal (subseq str 0 m) x))))
                     strings))))
 )); end of atom-starting-with-one-of


(defun indef-descr (term term-ht)
;`````````````````````````````````
; term: an atom such as ?x, it.pro, agent3.sk, joe.name, etc.
;
; Provide an indefinite descriptive term for the given EL term, using the
; type list (singleton or otherwise) about the EL term in term-ht, storing
; this term in term-ht as well under key `(descr ,term)
; e.g., term = FRIEND103.SK, and term-ht provides
;       FRIEND103.SK: (AGENT.N FRIEND.N (PERTAIN-TO VIOLINIST104.SK));
;       VIOLINIST104.SK: (VIOLINIST.N) (This won't be used)
; then the result is
;       (a friend of VIOLINIST104.SK); NB: extra terms are not verbalized.
; Can be as simple as (MONEY) or (PEOPLE) when no other terms are involved.
;
; Also store the given term in term-ht using its chosen type as key, as
; part of a list of terms of that type. This is needed for detecting that
; a new entity of the same type (including the same additional terms
; involved, if any) as a previous one is being verbalized, in which case
; we want to use descriptor, e.g., "a second person" rather than "a person".
;
; When actually verbalizing a schema, going through it sequentially,
; we will also store value T in term-ht under key `(already-used ,term)
; so that we can change the indefinite description to a definite one,
; e.g., "the person" or "the second person" rather than "a person" or
;       "a second person"
;
 (let (type-info type det descr)
      (setq type-info (gethash term term-ht))
;     (format t "~%### indef-descr: type-info = ~s" type-info); DEBUG
      (setq type (select-type type-info)); default: entity.n; a type may be
                                         ; plural, e.g., (plur person.n), or
                                         ; complex, e.g., ((plur <..>.n) <PP>)
      (if (not (find term (gethash type term-ht))); add term to the list of
          (push term (gethash type term-ht)))     ; terms of this type
      (setq det (choose-indef-det type))
      (setq descr (list (english-head-n type))); descr: a LIST (maybe singleton)
      (if det (push det descr))
      (setf (gethash `(descr ,term) term-ht) descr)
      descr
 )); end of indef-descr


(defun select-type (type-info)
; ````````````````````````````
; Select a nominal type from the list if possible, ignoring AGENT.N if there
; is something more specific. Include detached postmodifiers of a nominal 
; type, such as (pertain-to ?y) or (to.p ?l2). A complication is that the
; original nominal type might be plural, i.e., of form (plur <noun>.n).
;
; type-info: a list of monadic predicates (atomic or otherwise)
;
 (let (types types- type mod)
      (setq types type-info)
      (setq types- (remove 'entity.n 
                      (remove '(plur entity.n) types :test 'equal)))
      (setq types- (remove 'physical_entity.n 
                      (remove '(plur physical_entity.n) types- :test 'equal)))
	(setf bad-types '(destination.n object.n location.n))

	(loop for bt in bad-types do
		(if (> (length types-) 1)
			(setq types- (remove bt types- :test #'equal))))

      ; handle adjective-only roles (shouldn't form, but when they do, it's a predicate argument)
      (if (and (not (find-if #'!noun~ types-)) (find-if #'!adj~ types-))
		(setq types types-))

      (if (find-if #'!noun~ types-) (setq types types-))
      (setq types- (remove 'agent.n 
                      (remove '(plur agent.n) types :test 'equal)))
      (if (find-if #'!noun~ types-) (setq types types-))
;     (format t "~%## select-type: modified type-info = ~s" types); DEBUG
      (setq type (or (find-if #'!noun~ types) (find-if #'!adj~ types))); finds sing or plur noun (or adjective -L)
;     (format t "~%## select-type: type = ~s" type); DEBUG
      ; (NB: still nil if no noun type found)
      
      ; look for detached postmodifier, like (pertain-to ?y) or (to.p ?l2)
      (setq mod 
         (find-if #'(lambda (x) 
                     (and (listp x) 
                          (or (eq (car x) 'pertain-to) (!prep~ (car x)))))
                    types))
;     (format t "~%## select-type: mod = ~s" mod); DEBUG
      (when mod
         (setq type; construct postmodified type
           (list (if (null type) 'entity.n type) 
                 (if (eq (car mod) 'pertain-to) 
                     (cons 'of.p (cdr mod)) mod))))
;     (format t "~%## select-type: modified type = ~s" type); DEBUG
      (if type type 'ENTITY.N)
 )); end of select-type


(defun choose-indef-det (type); 
;```````````````````````
; e.g., for MAN or MAN.N: A; for ACT or ACT.N: AN; for mass/(PLUR <noun>): SOME
; But also allow for postmodified types like (FRIEND.N (OF.P ?Y)), or
; (N+PREDS FRIEND.N (OF.P ?Y)), or ones like (K (PLUR DOG.N)), (L X (X DOG.N))
; 
 (let (str ch ch2 tp)
      (cond ((!mass-pred~ type) 'SOME)
            ((and (listp type) (eq (car type) 'PLUR)) 'SOME); unmodified plural
            ((and (listp type) (listp (car type)) 
                  (eq (caar type) 'PLUR)) 'SOME); modified plural
            ((and (listp type) (find (car type) '(TO K KA KE))) nil)
            (t (setq tp (first-nonsilent-atom type))
               (setq str (string tp))
               (setq ch (char str 0))
               (case ch ((#\A #\E #\I #\O) 'AN)
                        (#\U (setq ch2 (char str 1))
                             (case ch2 ((#\K #\V #\-) 'A)
                                       (#\N (if (char= (char str 2) #\I)
                                                'A 'AN))
                                       (#\R (if (eq tp 'urn) 'AN 'A))
                                       (#\S (if (find tp '(usher usherette))
                                                'AN 'A))
                                       (t 'AN)))
                        (t 'A))))
 )); end of choose-indef-det


(defun !mass-pred~ (type); 
;````````````````````````
; E.g., for MILK.N or MILK: T; for (SOUR.A MILK.N): T; for DOG.N or DOG: NIL
;
 (let (head)
      (if (listp type) 
          (setq head (head-noun type))
          (setq head type))
      (setq head (unsuffixed-atom head))
      (gethash head *mass-nouns*)
 )); end of !mass-pred~


(defun first-nonsilent-atom (type); for choosing a/an determiner
;````````````````````````````````   briefly tested
; Find the first atom that will actually be rendered in English,
; but without regard for kind-terms (which properly don't take determiners,
; though in "dogs are barking" or "snow fell" the fact that these are
; implicitly existential -- even if rendered with 'k' -- creates a bit of 
; a problem ...); anyway, we'll bypass {KE N+PREDS NP+PREDS L :L X Y Z}
;
 (cond ((atom type)
        (if (not (find type '(KE N+PREDS NP+PREDS L :L X Y Z)))
            type nil))
       ((atom (car type))
        (if (not (find (car type) '(KE N+PREDS NP+PREDS L :L X Y Z)))
            (car type) (first-nonsilent-atom (cdr type))))
       ((first-nonsilent-atom (car type))
        (first-nonsilent-atom (car type))); duplicate work, but ok
       (t (first-nonsilent-atom (cdr type)))
 )); end of first-nonsilent-atom
             

(defun head-noun (type);; briefly tested
;``````````````````````
; e.g., (SOUR.A MILK.N) --> MILK.N; (MILK.N (OF.P (K MAGNESIA.N))) --> MILK.N
; Allow for the following ULF format, just in case, e.g.,
;       ((VERY.ADV HOT.A) (N+PREDS COFFEE.N (WITH.P (K SUGAR.N))))
; Currently this is just used by !mass-pred~
 (let (head)
      (cond ((atom type) type); an atomic input is expected to be a noun type
                              ; (the recursion below also ensures this)
            ((eq (car type) 'PLUR); PLUR is expected to have a single operand
             (head-noun (second type)))
            ; type is a list, but not headed by PLUR;
            ; allow for pre- and post-modification
            ((and (setq head (head-noun (car type))); NB: might pick non-noun
                  (!noun~ head)) head)
            ((and (setq head (head-noun (second type))); premodified or n+preds?
                  (!noun~ head)) head)
            (t nil))
 )); end of head-noun


(defun !verb~ (expr); symbol ending in '.V', or a premodified such symbol?
;```````````````````  or of form (<verb> <complement>*)?
; The initial '!' and final '~' are for consistency with conventions adopted
; for predicates over ULF expressions in the "ulf-from-sentences" code.
; However, for use in ULF derivation we would need to use the 'defpred'
; macro instead of 'defun', to enable use of *verb~, ?verb~, +verb~.
;
 (let (str n)
      (cond ((null expr) nil)
            ((and (listp expr) (cdr expr) (!verb~ (second expr))) t)
            ((and (listp expr) (!verb~ (car expr))) t)
            ((or (null expr) (not (symbolp expr))) nil)
            (t (setq str (string expr))
               (setq n (length str))
               (if (< n 3) nil
                   (string= (subseq str (- n 2) n) ".V"))))
 )); end of !verb~
 
(defun !adj~ (expr)
(let (str n)
            (cond ((not (symbolp expr)) nil)
            (t (setq str (string expr))
               (setq n (length str))
               (if (< n 3) nil
                   (string= (subseq str (- n 2) n) ".A")))))
)

(defun !noun~ (expr); singular or plural noun? tested
;``````````````````
 (let (str n)
      (cond ((and (listp expr) (eq (car expr) 'PLUR) (!noun~ (second expr))) t)
            ((not (symbolp expr)) nil)
            (t (setq str (string expr))
               (setq n (length str))
               (if (< n 3) nil
                   (string= (subseq str (- n 2) n) ".N"))))
 )); end of !noun~

(defun !prep~ (atm); atom ending in p, or p-arg? tested
;``````````````````````````````````````````````
 (let (str n)
      (cond ((not (symbolp atm)) nil)
            (t (setq str (string atm))
               (setq n (length str))
               (if (< n 3) nil
                   (if (< n 7)
                       (string= (subseq str (- n 2) n) ".P")
                       (string= (subseq str (- n 6) n) ".P-ARG")))))
 )); end of !prep~


(defun !name~ (expr); ending in '.NAME'?; tested
;```````````````````
 (let (str n)
      (cond ((not (symbolp expr)) nil)
            (t (setq str (string expr))
               (setq n (length str))
               (if (< n 6) nil
                   (string= (subseq str (- n 5) n) ".NAME"))))
 )); end of !name~

      
(defun english-head-n (type); e.g., DOG.N, (PLUR DOG.N) --> (dog), (dogs)
;````````````````````````
; Allow for types like PERSON.N or (FRIEND.N (OF.P VIOLINIST104.SK)) or
; (PLUR PERSON.N) or ((PLUR FRIEND.N) (OF.P VIOLINIST104.SK))) -->
;    (person) or (friends (of.p violinist104.sk)))
;
; ** This doesn't currently allow for modified nouns such as 
;        (BIG.A (PLUR DOG.N)).
;   (on the assumption we'll have separated out the BIG.N property -- 
;    questionably!)
;
 (cond ((atom type) (list (unsuffixed-atom type)))
       ((atom (car type)) ; typically, a simple plural like (PLUR DOG.N)
        (if (and (= (length type) 2) (atom (second type)))     ;  e.g.,
            (list (s-inflect (unsuffixed-atom (second type)))) ; (plur dog.n)
            (cons (unsuffixed-atom (car type)) (cdr type)))); eg (pet.n (of.n ..))
        
       ; car of type is a list ... ok if plural, o/w a faulty input
       ((eq (caar type) 'PLUR)
        (cons (s-inflect (unsuffixed-atom (second (car type))))
              (cdr type)))
       (t (format t "~%*** 'english-head-n' got faulty input ~s" type)
          ; attempt a reasonable output, with no suffixes in the car
          (cons (mapcar #'unsuffixed-atom (car type)) (cdr type)))
 )); end of english-head-n


(defun unsuffixed-atom (atm); tested
;``````````````````````````
; Remove characters following a period, forming a new suffix-free atom
;
 (let (chars chars2)
      (cond ((listp atm)
             (mapcar #'unsuffixed-atom atm))
            ((not (symbolp atm)) atm)
            (t (setq chars (coerce (string atm) 'list))
               (if (not (find #\. chars)) atm
                   (prog2 (dolist (ch chars)
                             (if (not (char= ch #\.))
                                 (push ch chars2)
                                 (return nil))); break out of loop
                          (intern (coerce (reverse chars2) 'string))))))
 )); end of unsuffixed-atom


(defun s-inflect (atm)
;````````````````````
; ** Currently a stub -- need many more exception cases, & more rules;
; intended for singular verbs and plural nouns
;
 (let (str last-char)
   (case atm (man 'men) (woman 'women) (child 'children) (person 'people)
             (mouse 'mice) ; ...
             (t (setq str (string atm))
                (intern (inflect-string-with-s str))))
 )); end of s-inflect


(defun inflect-string-with-s (str)
;`````````````````````````````````
; str: a string such as "Place" --> result "PLACES"
; This is for noun pluralization and for forming present tense verbs
; ** This is only roughly coded, e.g., wrong for "hurrah" (*"hurrahes")
;
 (let (st last-char 2nd-last)
      (setq str (string-upcase str))
      (setq st (reverse str))
      (setq last-char (char st 0))
      (case last-char ((#\H #\O #\S #\X)
                       (concatenate 'string str "ES"))
                      (#\Y (setq 2nd-last (char st 1))
                           (if (find 2nd-last '(#\A #\E #\I #\O #\U))
                               (concatenate 'string str "S")
                               (concatenate 'string
                                    (reverse (subseq st 1)) "IES")))
                      (#\Z (setq 2nd-last (char st 1))
                           (if (find 2nd-last '(#\A #\E #\I #\O #\U))
                               (concatenate 'string str "ZES")
                               (concatenate 'string str "ES")))
                      (t (concatenate 'string str "S")))
 )); end of inflect-string-with-s


(defun verbalize-verb (verbal-pred plur term-ht)
;```````````````````````````````````````````````
; Verbalize verbal-pred (ending in '.v') as present singular if plur is nil,
; otherwise as present plural, in either case as a LIST.
;
; This is aimed at the sort of verbs Lane Lawley's created schemas contain
; in the header, which 
; - may be simple, e.g., travel.2.v; --> (TRAVELS)
; - may have an underscore-attached object type: ENJOY_ACTION.6.V
;   --> (ENJOYS AN ACTION)  (or without the "s" for plurals)
; - may be adverbially modified: ((ADV-A (FROM.P ?L1)) TRAVEL.1.V)
;   --> (FROM <an entity> TRAVELS TO <an entity>)
; - direct modification: (DOWN.ADV GET.V)
 (let (str st ch verb-str rest vbz det np)
      (cond ((find verbal-pred '(be.v be.aux)); "be" is special
             (if plur '(are) '(is)))
            ((symbolp verbal-pred)
             (setq verbal-pred (unsuffixed-atom verbal-pred))
             (setq str (string verbal-pred))
             (cond ((find #\_ str)
                    (setq parts (break-at-underscores str)); list of strings
                    (setq verb-str (car parts)); works e.g., for ENJOY_ACTION.6.V
                                               ; Retain 1st part only, as the
                                               ; type will come from the object
                    (setq rest (cdr parts)))
                   (t (setq verb-str str)))
             (setq vbz (intern 
                         (if plur verb-str
                             (inflect-string-with-s verb-str))))

             ; I decided to skip the additional word(s) of the multi-word,
             ; because it usually redundantly supplies a type that is already
             ; separately stated or determined by the structure, e.g., (KA ...)
             ; (when rest; i.e., multi-word
             ;       (setq rest (mapcar #'intern rest))
             ;       (setq rest (mapcar #'unsuffixed-atom rest))
             ;       (setq det (choose-indef-det (car rest)))
             ;       (setq np rest)
             ;       (if det (setq np (cons det np))))
             ; ; vbz is still an atom at this point
             ; (if rest (setq vbz (cons vbz np)) (setq vbz (list vbz)))
             (if (equal vbz 'TRAVELS) '(TRAVELS TO) 
                 (if (equal vbz 'TRAVEL) '(TRAVEL TO) (list vbz))))

            ((atom verbal-pred) (list verbal-pred)); unexpected: non-symbol atom

            (t; complex verbal pred, assumed to be of ADV-A premodified
              (setq vbz (verbalize-expr2 verbal-pred term-ht))))
 )); end of verbalize-verb

 
(defun verbalize-passive (verb)
;``````````````````````````````
; e.g., 'leave.v' --> 'left'
; **Hastily drafted
; 
 (let (str n s)
      (case verb 
        (leave.v 'left) (bite.v 'bitten) (break.v 'broken) (do.v 'done)
        (find.v 'found) (forgive.v 'forgiven) (foresee.v 'foreseen)
        (get.v 'gotten) (give.v 'given) (grow.v 'grown) (know.v 'known)
        (make.v 'made) (say.v 'said) (take.v 'taken) (tell.v 'told) (see.v 'seen)
        (signal.v 'signalled) (speak.v 'spoken) (sank.v 'sunk)
        (signal.v 'signalled) (write.v 'written) (eat.v 'eaten) (begin.v 'begun)
        (blow.v 'blown) (bear.v 'born) (buy.v 'bought) (breed.v 'bred)
        (bring.v 'brought) (build 'built) (cancel.v 'cancelled) (catch.v 'caught)
        (choose.v 'chosen) (control.v 'controlled) (deal.v 'dealt) (draw.v 'drawn)
        (drive.v 'driven) (dig.v dug) (feed.v 'fed) (feel.v 'felt) (fly.v 'flown)
        (fling.v 'flung) (forebid.v 'forebidden) (forget.v 'forgotten)
        (fight.v 'fought) (freeze.v 'frozen) (gyp.v 'gypped) (hear.v 'heard)
        (hold.v 'held) (hide.v 'hidden) (hang.v 'hung) (keep.v 'kept)
        (lay.v 'laid) (lead.v 'led) (leave.v 'left) (lend.v 'lent) (light.v 'lit)
        (lose.v 'lost) (mean.v 'meant) (meet.v  'met) (mislead.v 'misled)
        (pay.v 'paid) (run.v 'run) (ring.v 'rung) (repay.v 'repaid)
        (ride.v 'ridden) (sing.v 'sung) (sink.v 'sunk) (send.v 'sent)
        (sell.v 'sold) (seek.v 'sought) (shake.v 'shaken) (shoot.v 'shot)
        (show.v 'shown) (shrink.v 'shrunken) (spit.v 'spat) (spelt 'SPELL)
        (spend.v 'spent) (speed.v 'sped) (spill.v 'spilt) (spring.v 'sprung)
        (steal.v 'stolen) (strike.v 'struck) (stick.v 'stuck) (sweep.v 'swept)
        (swear.v 'sworn) (swim.v 'swum) (swing.v 'swung) (teach.v 'taught)
        (think.v  'thought) (throw.v 'thrown) (tear.v 'torn) (travel.v 'travelled)
        (understand.v 'understood) (undertake.v 'undertaken)
        (underwrite.v 'underwritten) (undo.v 'undone) (untie.v 'untied)
        (vie.v 'vied) (worship.v 'worshipped) (wake.v 'woken) (win.v 'won)
        (wear.v 'worn) (wring.v 'wrung)
        (t (setq str (string verb))
           (setq n (length str))
           (setq s (subseq str (- n 2) n))
           (when (not (string-equal s ".V"))
                 (format t "~%*** 'verbalize-passive' can't handle ~s" verb)
                 (return-from verbalize-passive verb))
           (setq str (subseq str 0 (- n 2)))
           (setq s (subseq str (- n 3) (- n 2)))
           (if (string-equal s "E") 
               (intern (concatenate 'string str "D"))
               (intern (concatenate 'string str "ED")))))
 )); end of verbalize-passive


(defun break-at-underscores (str)
;```````````````````````````````
; str: a string
; Return a list of strings, as many as there are separated by underscores
 (let (n part parts-list)
      (setq n (length str))
      (dotimes (i n)
         (cond ((char= (char str i) #\_)
                (when part (push part parts-list)
                           (setq part nil)))
               (t (push (char str i) part)
                  (if (= i (- n 1)) (push part parts-list)))))
      (setq parts-list (reverse (mapcar #'reverse parts-list)))
      (mapcar #'(lambda (x) (coerce x 'string)) parts-list)
 )); end of break-at-underscores
         

(defun terms-appearing-in (expr)
;```````````````````````````````
; Find list of Skolem constants, pronouns, and variables occurring in expr;
; expr: An EL expression or list of expressions (atomic or complex), but without
; episodic */@/** operators. Terms are assumed to be names (suffixed with 
; '.NAME'), pronouns (suffixed with '.PRO'), variables (prefixed with '!' or 
; '?) or Skolem constants (suffixed with '.SK')
;
 (let ( )
      (cond ((symbolp expr)
             (if (or (!Skolem~ expr) (!var~ expr) 
                     (!pron~ expr) (!name~ expr))
                 (list expr) nil))
            ((atom expr) nil); non-symbol atom -- ignore
            (t (apply #'append (mapcar #'terms-appearing-in expr))))
 )); end of terms-appearing-in

(defun terms-appearing-in1 (expr); DEBUG VARIANT OF ABOVE
  (terms-appearing-in expr))


(defun !Skolem~ (sym); symbol ending in '.SK'? Tested
;```````````````````
 (let (str n)
      (cond ((not (symbolp sym)) nil)
            (t (setq str (string sym))
               (setq n (length str))
               (if (< n 4) nil
                   (string= (subseq str (- n 3) n) ".SK"))))
 )); end of !Skolem~


(defun !var~ (sym); symbol starting with '?' or '!'?
;`````````````````
 (let (str)
      (cond ((not (symbolp sym)) nil)
            (t (setq str (string sym))
               (or (char= (char (string sym) 0) #\?) 
                   (char= (char (string sym) 0) #\!))))
 )); end of !var~


(defun !pron~ (sym); symbol endding in '.PRO'?
;``````````````````
 (let (str n) 
      (cond ((not (symbolp sym)) nil)
            (t (setq str (string sym))
               (setq n (length str))
               (if (< n 5) nil
                   (string= (subseq str (- n 4) n) ".PRO"))))
 )); end of !pron~


(defun header2english (main-event main-predication term-ht)
;``````````````````````````````````````````````
; e.g., main-predication = 
;       (FRIEND103.SK REQUEST_ACTION.7.V VIOLINIST104.SK (KA (TRY.V IT.PRO)))
;       main-event = ?E
; where 'term-ht' provides the English type information
;       FRIEND103.SK: (AGENT.N FRIEND.N (PERTAIN-TO VIOLINIST104.SK));
;       VIOLINIST104.SK: (VIOLINIST.N);
; then the result is
;       (?E A FRIEND OF A VIOLINIST REQUESTS AN ACTION OF THE VIOLINIST
;        TO TRY A PARTICULAR THING)
; We append the verbalizations of terms and the verbal predicate in the
; order of occurrence in the header. Issues to take care of are breaking
; predicates at underscores, terms headed by KA, TO, or THAT, and keeping
; track of nominal predicates being used, so that a new use of such a predicate
; will cause us to change the corresponding determiner (e.g., 'a' to 'a second'
; etc.), and keeping track of the descriptions themselves so that we can replace
; additional uses of the same term by definites.
;
 (list 'schema-header. 
       (cons main-event (verbalize-expr2 main-predication term-ht))))


(defun additional-roles2english (terms term-ht)
;`````````````````````````````````````````````
; terms: a list of EL pronouns, Skolem constants, names, or !/?-variables
; term-ht: should already contain a list (at least a singleton) of types
;          for each term in terms
; result: A list such as ((Obama) (a specific thing) (a second specific thing))
;
 (let (result)
      (dolist (term terms) (push (verbalize-expr2 term term-ht) result))
      (if (null result) '(additional roles. none)
                         (append '(additional roles.) (reverse result)))
 )); end of additional-roles2english


(defun preconds2english (preconds term-ht)
;`````````````````````````````````````````
; preconds: e.g., (:PRECONDS (?P1 (?X (AT.P ?L))) (?P2 (?Y (AT.P ?L)))) 
; result: e.g., (preconds: (?p1 the agent is at the location)
;                          (?p2 the second agent is at the location))
; The precond names will be replaced later with (1), (2), ... but are
; at this point still needed for reference in episode relationships
;  
 (let (result)
      (dolist (c (cdr preconds)) 
              (push (cons (car c) (verbalize-expr2 (second c) term-ht)) result))
      (if (null result) '(preconds. None made explicit)
                         (cons 'preconds. (reverse result)))
 )); end of preconds2english


(defun goals2english (goals term-ht)
; `````````````````````````````````
; goals: e.g., (:GOALS (?g1 (?x want.v (that (?x happy.a)))) (g2 ...))
; result: e.g., (goals. (?g1 The agent wanst that the agent is happy)
;                       (?g2 ...))
; The goal names will be replaced later with (1), (2), ... but are
; at this point still needed for reference in episode relationships
;
 (let (result)
      (dolist (g (cdr goals)) 
              (push (cons (car g) (verbalize-expr2 (second g) term-ht)) result))
      (if (null result) '(goals. None made explicit)
                         (cons 'goals. (reverse result)))
 )); end of goals2english
      
(defun steps2english (steps term-ht)
; `````````````````````````````````
; steps: e.g., (:STEPS (?s1 (?x (go_to.v ?l))) (?s2 (?x sleep.v)))
; result: e.g., (steps. (?s1 the agent goes to the second location)
;                       (?s2 the agent is asleep))
; The step names will be replaced later with (1), (2), ... but are
; at this point still needed for reference in episode relationships
;
 (let (result)
      (dolist (s (cdr steps)) 
              (push (cons (car s) (verbalize-expr2 (second s) term-ht)) result))
      (if (null result) '(steps. None made explicit)
                         (cons 'steps. (reverse result)))
 )); end of steps2english
      
(defun effects2english (effects term-ht)
; `````````````````````````````````````
; effects: e.g., (:POSTCONDS (?e1 (?x (at.p ?l))) (?e2 (?x asleep.a)))
; result: e.g., (effects. (?e1 the agent is at the second location)
;                         (?e2 the agent is asleep))
; The effect names will be replaced later with (1), (2), ... but are
; at this point still needed for reference in episode relationships
;
 (let (result)
      (dolist (e (cdr effects)) 
              (push (cons (car e) (verbalize-expr2 (second e) term-ht)) result))
      (if (null result) '(effects. None made explicit)
                         (cons 'effects. (reverse result)))
 )); end of effects2english
      
(defun episode-relations2english (episode-relations term-ht)
;``````````````````````````````````````````````````````````
; episode-relations: e.g., (:EPISODE-RELATIONS (!r1 (?g1 before ?s1))
;                                              (!r2 (?s2 cause-of ?e1))
; result: e.g., (episode relations. (goal ?g1 is before step ?s1)
;                                   (step ?s2 is the cause of effect ?e1))
; In postprocessing of the schema verbalization, names like ?g1, ?s1, ?s2
; or ?e1 will be replaced by (1), (1), (2), (1), etc. (respectively, i.e.,
; we start the numbering at 1 in each section.
;
; As an initial stub, I'll just list the relations as-is, e.g.,
; (episode-relations. (?g1 before ?s1) (?s2 cause-of ?e1))
; 
 (if (null episode-relations) 
    '(episode-relations. none added)
     (cons 'episode-relations. (mapcar #'second (cdr episode-relations)))
 )); end of episode-relations2english


(defun verbalize-expr2 (el-expr term-ht)
;`````````````````````````````````````
; Removes any remaining dot-suffixes after application of 'verbalize-expr';
; suffixes may remain because complex stored stored types of terms may have
; suffixes in the parts following the head noun, e.g., (device (of.p ...))
;
; In addition, we make sentences of form (IT IS NOT THE CASE THAT ... IS/ARE...)
; more readable by converting to (... IS/ARE NOT ...) [This would be easier
; using TT, but I wanted to make the verbalization code self-contained, for now.]
 (let (words n rst ii k part1 part2)
;     (format t "~%@@ verbalize-expr2: el-expr = ~s" el-expr); DEBUG
      (setq words (mapcar #'unsuffixed-atom (verbalize-expr el-expr term-ht)))
;     (format t "~%@@ verbalize-expr2: words = ~s" words); DEBUG
      (setq n (length words))
      (setq rst words)
      (dotimes (i (- n 8))
         (if (equal (subseq rst 0 6) '(it is not the case that))
             (prog2 (setq part2 rst) (return nil))); exit loop 
             (push (pop rst) part1))
             
      (when part2
      ; We found a portion (part2) = '(it is not the case that); while
      ; part1 contains any preceding words in reverse order
        (setq n (length part2))
        (if (and (or (setq rst (member 'is (subseq part2 6)))
                     (setq rst (member 'are (subseq part2 6)))))
            (setq words
              (append (reverse part1)
                      (subseq part2 6 (- (+ n 1) (length rst))) 
                      '(NOT) (cdr rst)))))

      ; ** KLUDGE ALERT!! Prefix "the" & insert "and" in set-of terms
      (if (setq rst (member 'set-of words)) (setq n (length rst)))
      (when (and rst (> n 3))
        ; find an <articlecle> <non-article (presumably, noun)> <article>
        ; sequence, and insert 'AND' before the second article. This 
        ; allows for e.g., SET-OF SOME FRIENDS OF A PERSON THE PERSON
        ;               ``^`` insert THE         `````````^``` insert AND
        ; Find article positions in rst = (set-of ...)
         (dotimes (i n)
            (if (find (nth i rst) '(a an the some a_second a_third a_fourth
                                    the_second the_third the_fourth))
                (push i ii)))
         (when ii
            (loop (setq k (pop ii))
                  (when (null ii) (setq k nil) (return nil))
                  (if (= k (+ (car ii) 2)) (return nil)))
            (when k ; insert AND after the k'th word of rst
               (setq words
                  (append (butlast words n) '(THE) 
                          (subseq rst 0 k) '(AND) (subseq rst k))))))

      ; ** KLUDGE ALERT!! Insert "to" in "transport" sentences
      (setq rst (member 'transports words))
      (if (null rst) (setq rst (member 'transport words)))
      (if (and rst (find (car (last words 2)) 
                   '(a an the a_second a_third a_fourth the_second 
                     the_third the_fourth)))
          (append (butlast words 2) '(to) (last words 2))
          words)
 )); end of verbalize-expr2


(defun verbalize-expr (el-expr term-ht); should give list of English words
;`````````````````````````````````````
; Presently a simple "Hail Mary" program; everything is "flattened"
; It's intended for verbalizing everything except episode relations.
 (let (descr plur v-pred type-info type); plur will be set to non-nil for 
                                        ; an infix wff with a plural subject, 
                                        ; to enable enforcing verb agreement
      (cond ((and (listp el-expr) (eq (car el-expr) 'PLUR); simple plural?
                  (symbolp (second el-expr))) 
             (list (s-inflect (unsuffixed-atom (second el-expr)))))

            ((listp el-expr) ; non-atomic, non-plural el-expr?
             ; We verbalize & return some simple expressions directly,
             ; and in other cases make some changes to el-expr and 
             ; verbalize recursively
             ; 
             ; preliminary: compress lambda-conjunctions (eliminating 'and')
             (if (and (atom (car el-expr)) 
                      (find (car el-expr) '(L :L))
                      (symbolp (second el-expr)); spot likely lambda-var's
                      (< (length (string (second el-expr))) 3))
                 (setq el-expr (compress-lambda-conj el-expr)))

             ; wff with a Ka/To-subject will give non-nil type-info for this:
             (setq type-info (if (and (listp (car el-expr)) 
                                      (find (caar el-expr) '(Ka To)))
                                 (list 'action.n) nil))

             ; wff with atomic subject will give non-nil type-info for this:
             (if (null type-info)
                 (setq type-info (gethash (car el-expr) term-ht)))

             (cond ; first, handle number-marked verbs (sing-verb <verb.v>) 
                   ; (plur-verb <verb.v>); number-marking is done below;
                   ((find (car el-expr) '(sing-verb plur-verb))
                    (verbalize-verb (second el-expr)
                       (if (eq (car el-expr) 'plur-verb) t nil) term-ht))
                          ; 'plur' arg of verbalize-verb ````` 

                   ; next, passive verbs
                   ((eq (car el-expr) 'pasv)
                    (list (verbalize-passive (second el-expr))))

                   ; WFF PROCESSING
                   ; ``````````````
                   (type-info; see above: non-nil for wff w/ atomic or Ka subject
                    ; If the sentence predicate has an adverbial premodifier
                    ; on the verb or VP (i.e., on the second element),
                    ; move this to the end of the wff:
                    (setq el-expr
                          (move-verb-premod-to-end-of-vp el-expr))
;                (format t "~%@@ verbalize-expr: type-info = ~s" type-info); DEBUG
                    (setq type (select-type type-info))
                    (setq plur; e.g., (plur pet.n); (plur (pet.n (of.p ?x)))
                          (and (listp type) (eq (car type) 'plur)))
                    ; if plural subject, wrap (plur ...) around verb for 
                    ; correct verbalization; note that in an EL infix wff,
                    ; the predicate is necessarily the second element:
                    (setq vpred (mark-verb-number plur (second el-expr)))
                    (cond ((not (equal vpred (second el-expr))); changed?
                           ; verb found, & "wrapped" with (sing-verb ...)
                           ; (when PLUR = NIL) or (plur-verb) otherwise
                           (setq el-expr 
                             (cons (car el-expr); use the altered vpred
                                (cons vpred (cddr el-expr)))))
                          (t; no verb found in (second el-expr) --
                            ; so likely a nominal or PP or ADJP pred,
                            ; thus requiring "is" or "are" to be added;
                            ; though 'is' and 'are' are not properly
                            ; allowed in an EL formula, they'll be
                            ; retained in the wff verbalization since
                            ; they're not in the "ignored list" (see
                            ; below -- ADV-A, ADV-S, etc.)
                            (setq el-expr
                              (cons (car el-expr)
                                (cons (if plur 'ARE 'IS) (cdr el-expr))))))
                    (mapcar #'unsuffixed-atom
                      (apply #'append
                         (mapcar #'(lambda (x) (verbalize-expr x term-ht))
                                 el-expr))))

                   ; Is the first element 'NOT', followed by a wff? We simply
                   ; use "It is not the case that" (may be changed post-hoc)
                   ((and (eq (car el-expr) 'NOT)
                         (listp (second el-expr))
                         ; test whether the first element of the operand of
                         ; NOT starts with a term (stored, or of type (Ka ...))
                         (or (gethash (car (second el-expr)) term-ht)
                             (and (listp (car (second el-expr)))
                                  (find (caar (second el-expr)) '(Ka To))))) 
                    (append '(it is not the case that)
                             (verbalize-expr (second el-expr) term-ht)))

                   ; Is the first element an action-type-forming operator?
                   ((find (car el-expr) '(KA TO))
                    (cons 'TO (verbalize-expr (cdr el-expr) term-ht)))

                   ; Is the first element an episode-type-forming operator?
                   ; If the wff operand is as per the annotation guidelines,
                   ; we need to insert 'TO' after the wff subject
                   ((eq (car el-expr) 'KE)
                    (if (and (listp (cadr (second el-expr)))
                             (not (find (caadr (second el-expr)) '(KA TO))))
                        (cons 'FOR 
                          (verbalize-expr
                            (cons (car (second el-expr))
                              (cons 'TO (cdr (second el-expr)))) term-ht))
                        (cons 'FOR (verbalize-expr (second el-expr) term-ht))))

                   ; ** Are there other complex el-expr that should get
                   ;    special treatment here?
                   ;
                   ; Default method for complex el-expr: blanket recursion
                   (t (mapcar #'unsuffixed-atom
                       (apply #'append  
                        (mapcar #'(lambda (x) (verbalize-expr x term-ht)) 
                                el-expr))))))
            (t; atomic el-expr;
              ; The only remaining instances of verbs are ones not occurring
              ; as main verbs (which were cast as (sing-verb <verb>) or
              ; (plur-verb <verb>) above, and verbalized accordingly). But we
              ; can treat these as if they were present plural, since this is
              ; indistinguishable from base form in English, *except* for "be":
              (cond ((find el-expr '(ADV-A ADV-S ADV-E ADV-F K KE N+PREDS
                                     NP+PREDS PRES PAST CF PROG PERF L :L X Y Z))
                     nil)
                    ((!verb~ el-expr) 
                     (if (find el-expr '(be.v be.aux)) '(be)
                         (verbalize-verb el-expr t term-ht)))
                    ; Now deal with non-verb atoms:
                    (t ; hopefully this works for all non-verb atoms,
                       ; including ones for which !Skolem~, !var~, !pron~, or
                       ; !name~  holds
                     (if (setq descr (gethash `(descr ,el-expr) term-ht)) 
                         ; term already has verbalizations in term-ht
                         (update-and-return-descr el-expr term-ht)
                         ; no hash-table entry for el-expr
                         (if (find el-expr ; "silent" operators/lambda-vars?
                                     ; (assume lambda vars are in {X, Y, Z})
                                 '(ADV-A ADV-S ADV-E ADV-F K KE N+PREDS
                                   NP+PREDS PRES PAST CF PROG PERF L :L X Y Z))
                             nil 
                             (if (find el-expr '(TO KA)) '(TO)
                                 (list (unsuffixed-atom el-expr)))))))))
                                 ; e.g., preposition, adj, noun, is, are, be, to,
                                 ;       for, cause-of, before, ...
 )); end of verbalize-expr


(defun occurs-in (x expr)
;```````````````````````
 (cond ((equal x expr) T)
       ((atom expr) nil)
       (t (find t (mapcar #'(lambda (y) (occurs-in x y)) expr)))
 )); end of occurs-in


(defun compress-lambda-conj (l-expr)
;```````````````````````````````````
; Input must be a lambda predicate (guaranteed by calling program)
; The expectation is that it is conjunctive, and we drop the 'and'
; and 'n+preds' instead of 'L' or ':L', 
; e.g., (L X (AND (X BLACK.A) (X (PLUR HEN.N))))
;       becomes (N+PREDS BLACK.A (PLUR HEN))
 (if (and (listp (third l-expr)) (find (car (third l-expr)) '(AND AND.CC)))
     (cons 'n+preds (mapcar #'pred-of-wff (cdr (third l-expr))))
     l-expr))

(defun pred-of-wff (wff)
;``````````````````````
; e.g., (X BLACK.A) ==> BLACK.A
; e.g., (X (FOR.P ED.NAME)) ==> (FOR.P ED.NAME)
; e.g., (X SEE.V ?Y) ==> (SEE.V ?Y)
 (if (atom wff) wff (if (null (cddr wff)) (second wff) (cdr wff))))


(defun move-verb-premod-to-end-of-vp (expr)
;``````````````````````````````````````````
; e.g., transform (MAN5.SK ((ADV-A (FROM.P ?L1)) TRAVEL.1.V))
;       into (MAN5.SK (TRAVEL.1.V (FROM.P ?L1)))
; e.g., transform (MAN5.SK (WANT.V (KA ((ADV-A (AT.P ?L2)) BE.V))))
;       into (MAN5.SK (WANT.V (KA (BE.V (AT.P ?L2)))))
; If the verb is premodified, but its object is not included in the 
; modification, move the premodifier past the object.
; e.g., transform (?X ((ADV-A (FROM.P ?L1)) TRAVEL.5.V) SCHOOL79.SK))
;       into (?X TRAVEL.5.V SCHOOL79.SK (FROM.P ?L1))
; Also move particles represented as verb premodifiers to follow the verb,
; e.g., (DOWN.ADV CLIMB.V) becomes (CLIMB.V DOWN)
;
 (let ( )
      (cond ((atom expr) expr)
            ((and (atom (car expr))
                  (cddr expr) ; there's a third element
                  (listp (second expr))
                  (listp (car (second expr)))
                  (find (caar (second expr)) '(adv adv-a adv-e adv-s adv-f)))
             (list (car expr) (second (second expr)) (third expr) 
                   (second (car (second expr)))))
            ((and (listp (car expr))
                  (find (caar expr) '(adv adv-a adv-e adv-s adv-f)))
             (list (second expr) (second (car expr)))); interchange mod & vp
            ; adverbially (partical) modified verb?
            ((and (find (car expr) 
                    '(about.adv ahead.adv aloud.adv amok.adv amuck.adv apart.adv
                      around.adv aside.adv astray.adv asunder.adv away.adv 
                      back.adv by.adv up.adv down.adv forth.adv forward.adv 
                      home.adv in.adv out.adv on.adv over.adv off.adv 
                      together.adv to.adv under.adv waste.adv way.adv low.adv
                      do.adv loose.adv flat.adv)))
             (append (cdr expr) (list (car expr))))

            (t ; list structure may have modified VP within it
               (mapcar #'move-verb-premod-to-end-of-vp expr)))
 )); end of move-verb-premod-to-end-of-vp


(defun mark-verb-number (plur poss-el-vp)
;```````````````````````````````````````
; poss-el-vp: expected to be the predicate of an infix wff; it's likely to
;     be verb-based, and if so we'll hopefully locate the head verb and
;     "mark" it. But it may also be a NP-, ADJP-, or PP-predicate, in which
;     case we do no "marking". ('IS'/'ARE' are added elsewhere.)
; plur: non-nil just in case the subject of the predicate has a PLUR car.
;
; If poss-verbal-pred is a verbal predicate, wrap (sing-verb ...) around the
; verb (just the verb, not the entire possibly complex expressions) if plur
; is nil, and wrap (plur-verb ...) around if plur is non-nil. If no verb is
; found (in an appropriate position to make a VP) return the input unchanged
;
 (cond ((and (atom poss-el-vp) (!verb~ poss-el-vp))
        (list (if plur 'plur-verb 'sing-verb) poss-el-vp))
       ((atom poss-el-vp) poss-el-vp); non-verb atom --> no change
       ((and (atom (car poss-el-vp)) (!verb~ (car poss-el-vp))); verb plus args
        (cons (list (if plur 'plur-verb 'sing-verb) (car poss-el-vp)) 
              (cdr poss-el-vp)))
       (t; premodified verb or VP, or some other structure?
         (cons (car poss-el-vp) (mark-verb-number plur (cdr poss-el-vp))))
         ; this might turn out to be just a copy of poss-el-vp
 )); end of mark-verb-number 


(defun update-and-return-descr (term term-ht &optional stack)
;````````````````````````````````````````````
; term:  an atomic term, e.g., ?X, or VIOLINIST104.SK, YEHUDI.NAME, ...
;        the function is called only if term already has an entry for 
;       `(descr ,el-expr) currently in term-ht, such as (the person),
;        (a friend of ?y), or (a_second person);
; term-ht: the hash table where we can retrieve (a) type lists for atomic
;          terms (with those terms as keys); (b) English descriptive phrases
;          (with `(descr ,term) as keys), but with any additional terms
;          occurring within it kept in EL-atom form; (c) an entry for each
;          descriptive phrase, minus article (e.g., (friend of ?y), rather
;          than (a friend of ?y)) giving the list of EL terms in the schema
;          for which this description was used; (d) and finally, an entry
;          under key `(mentioned ,term) which is non-nil if the term
;          was previously used to produce an English descriptive phrase.
;
;          All but the the first entry for a given term (its type list)
;          is maintained here, since 'update-and-return-descr' will be
;          called in the order of English surface generation.
;
 (let (descr same-type-terms n det)

      ; all atomic EL-terms are assumed to already have an indefinte 
      ; description, generated in the initial pass through all schema terms
;     (format t "~%#### update-and-return-descr: term = ~s" term); DEBUG
      (setq descr (gethash `(descr ,term) term-ht)); current description;
                                                     ; e.g., (a friend of ?y)
;     (format t "~%#### update-and-return-descr: descr = ~s" descr); DEBUG
      (setq same-type-terms (gethash (cdr descr) term-ht)); omit determiner;
                                                     ; NB: embedded terms
                                                     ; like ?y need to match
      (cond ((lex-name? term) (list term))
		((null (gethash `(mentioned ,term) term-ht)); discourse-new?
;            (format t "~%#### update-and-return-descr: ~s unmentioned" term); DEBUG
             (setf (gethash `(mentioned ,term) term-ht) T)
             (cond ((null same-type-terms); no prev. entity of this type?
                    (push term (gethash (cdr descr) term-ht)); omit determiner
                    ; recursive description completion
                    (fully-expand-descr descr term-ht stack))
                   (t (setq n (length same-type-terms));
                      ; we use determiners like 'a_second, 'a_third',...,
                      ; depending on the n previous uses of the descriptor;
                      ; we use these concatenated determiners so that we
                      ; can just use "cdr" to drop them (and hence replace
                      ; them -- they can change from def to indef).
                      (setq det ; allow for two 'some'-descriptions of the
                                ; same type, and four a/an-descriptions
                         (case n (1 (if (eq (car descr) 'some)
                                        'some_additional 'a_second)) 
                         (2 'a_third) (3 'a_fourth)
                           (t (car descr)))); give up counting after 3 more
                      (setq descr (cons det (cdr descr)))
                      (setf (gethash `(descr ,term) term-ht) descr)
                      (fully-expand-descr descr term-ht stack))))
            ((find (car descr); if previously mentioned but not rementioned,
                              ; change indefinite determiner to definite
                  '(a an some some_additional a_second a_third a_fourth))  
;            (format t "~%#### update-and-return-descr: (car descr) = ~s" (car descr)); DEBUG
             (setq det
               (case (car descr)
                  ((a an some) 'the) (a_second 'the_second) 
                  (a_third 'the_third) (a_fourth 'the_fourth)
                  (some_additional 'the_additional)
                  (t 'that_additional))); for 5th, 6th, etc., instances of
                                        ; the descriptively same type
;            (format t "~%#### update-and-return-descr: det = ~s" det) ; DEBUG
             (setq descr (cons det (cdr descr)))
;            (format t "~%#### update-and-return-descr: new descr = ~s" descr); DEBUG
             (setf (gethash `(descr ,term) term-ht) descr)
             (fully-expand-descr descr term-ht stack))

            ; previously mentioned & rementioned (so, already definite)
            (t (fully-expand-descr descr term-ht stack)))
 )); end of update-and-return-descr


(defun fully-expand-descr (descr term-ht &optional stack)
; ``````````````````````````````````````````
; descr: e.g., (a person); (a friend of ?y); (the friend of Bob.name)
;
; Recursively turn this into English as needed, using 'update-and-return-descr',
; if 'descr' contains EL-terms (which thus need to be expanded into English).
; E.g., obtain (a friend of the customer); (the friend of the person_named_Bob)
; 
 (let (term-descr)
      (cond
	((not (equal (length stack) (length (remove-duplicates stack :test #'equal))))
		(list descr)) ; We're caught in an expansion loop, so terminate here
	((and (atom descr)
                  (setq term-descr (gethash `(descr ,descr) term-ht)))
;            (format t "~%#### fully-expand-descr: descr = ~s" descr); DEBUG
;            (format t "~%#### fully-expand-descr: term-descr = ~s" term-descr); DEBUG
             (update-and-return-descr descr term-ht stack)); here descr is a term
            ((atom descr) (list descr)); atom, but not EL-term (in term-ht)
            (t (apply #'append
                 (mapcar #'(lambda (x) (fully-expand-descr x term-ht (append stack (list descr)))) 
                           descr))))
 )); end of fully-expand-descr


(defparameter *mass-nouns* (make-hash-table))
; The following list is borrowed from KNEXT, but a more complete list
; could be obtained from the (COUNT -) nouns in Alvey (though we'd need
; to post-filter for nouns that are sometimes mass but more ofte count)
(mapcar #'(lambda (x) (setf (gethash x *mass-nouns*) t))
'(access advertising advice advocacy agriculture aid air alcohol anger 
  anxiety approval architecture assistance attention authority awareness
  blood bloodshed blue bread butter carbon care cash chocolate coffee
  concentration confidence confusion consent consciousness conservation 
  construction consumption co-operation cooperation cotton credit cutlery 
  damage darkness data depth destruction determination dinnerware dirt 
  discrimination dust economics effectiveness efficiency electricity
  employment emphasis energy entertainment enthusiasm equipment evidence 
  excitement expertise exposure fat fiction flesh food freedom fun furniture
  gas gasoline gold golf grass gravel guidance hair handling hardware harm 
  health heat humor humour ice idleness imagination importance independence
  inflation ink integration intelligence interest involvement juice knowledge
  laughter leadership learning leather legislation leisure literature loyalty 
  luck machinery mail maintenance marketing meat milk money mortality music 
  neglect nitrogen oil opposition orange_juice ownership oxygen participation 
  pay peace pepper personnel petrol petroleum planning plastic poetry politics
  pollution potential poverty power praise presence pressure pride progress 
  protection psychology publicity rain reading recognition regard relief
  rent research resistance revenue rice rubbish rugby safety salt sand 
  satisfaction scope scoring sex shopping significance silicon silk silver 
  skin sleep smoke snow software stability steam steel storage stress stuff 
  sugar survival sympathy talent tar taste taxation tea teaching television 
  tennis tension timing traffic travel trouble trust unemployment unity 
  upkeep urine validity variety violence warmth water wealth welfare work 
  worth writing  ; etc etc
))

(defun verbalize-steps (schema)
(block outer
	(setf verbal-steps (mapcar #'cdr (cdr (car (loop for sec in (verbalize-schema schema)
		if (and (listp sec) (equal (car sec) 'STEPS.))
			collect sec)))))

	(return-from outer verbal-steps)
)
)

(defun verbalize-goals (schema)
(block outer
	(setf verbal-steps (mapcar #'cdr (cdr (car (loop for sec in (verbalize-schema schema)
		if (and (listp sec) (equal (car sec) 'GOALS.))
			collect sec)))))

	(return-from outer verbal-steps)
)
)

(defun stringify-verbalization (verbalization)
	(join-str-list " " (mapcar (lambda (x) (format nil "~a" x)) verbalization))
)

(defun gpt-verbalize-schema (schema)
(block outer
	(setf len-vb (verbalize-schema schema))

	(setf gpt-vbs (list))

	(loop for sec-name in '(STEPS. GOALS. PRECONDS. POSTCONDS.)
	do (block inner
		(setf verbal-forms (mapcar #'cdr (cdr (car (loop for sec in len-vb
			if (and (listp sec) (equal (car sec) sec-name))
				collect sec)))))

		(setf this-sec-gpt-vbs
			(mapcar #'gpt-reverbalize
				(mapcar #'stringify-verbalization verbal-forms)))

		(setf gpt-vbs (append gpt-vbs (list (list sec-name this-sec-gpt-vbs))))
	)
	)

	(return-from outer gpt-vbs)
)
)

(defun gpt-reverbalize (verbalized-sent)
(block outer
	(setf res (car (run-proc-with-stdin "/home/lane/miniconda3/bin/python"
		(list "/home/lane/Code/schemas/gpt-reverbalizer.py" verbalized-sent)
		nil)))

	(setf res (car (split-str res "<|endoftext|>")))

	(return-from outer res)
)
)

(defun gpt-verbalize-steps (schema)
	(loop for st in (mapcar #'gpt-reverbalize (mapcar #'stringify-verbalization (verbalize-steps schema)))
		for ep-name in (mapcar #'car (section-formulas (get-section schema ':Steps)))
			collect (list ep-name st))
)

(defun gpt-verbalize-goals (schema)
(block outer
	(setf goals (loop for goal in (mapcar #'gpt-reverbalize (mapcar #'stringify-verbalization (verbalize-goals schema)))
		for ep-name in (mapcar #'car (section-formulas (get-section schema ':Goals)))
			collect (list ep-name goal)))

	(setf new-goals (list))
	(loop for g in goals do (block inner
		(setf ep-rels (loop for ep-rel in (section-formulas (get-section schema ':Episode-relations))
			if (equal (car (second ep-rel)) (car g))
				collect (list (third (second ep-rel)) (second g))))
		(if (equal (length ep-rels) 0)
			(return-from inner))
		(setf new-goals (append new-goals (list (car ep-rels))))
	))

	(return-from outer new-goals)
)
)
