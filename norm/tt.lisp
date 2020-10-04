; Apr 30/20
;
; These are tree transduction tools for making Treebank trees more nearly
; suitable for direct conversion to ULF (essentially by dropping phrase
; category names like NP, VP, SBAR, etc., while keeping the bracketing,
; and converting lexical items of form (POS word) to ULF)
;
; We use a pattern matching/transduction language TT that combines elements
; of TTT and the matching language in the dialogue manager for LISSA, ETA,
; etc. In particular, we use numerical location indices corresponding to
; constituents of an expression, in preference to the names of match 
; variables, for picking out subexpressions of a matched expression; this
; is actually more readable than variable namess. But we also use prefixes
; in the set {! ? * +} on match variables to indicate match to a single
; expression, to 0 or 1 expression, to 0 or more expressions, and to 1 or
; more expressions. Because we refer to subexpressions via indices, we can
; keep reusing the same variables in a single match expression; the names
; indicate type restrictions: E.g., !atom matches an atom, while +list
; matches a sequence of one or more lists; the atoms we prefix with 
; {! ? * +} to form variables are restricted to {atom, list, expr}, where
; wxpr subsumes {atom, list}. Thus there are just 12 basic variables, which
; we can reuse arbitrarily in patterns. But we can add some other special
; variables, e.g., ?\, (optional comma) turns out to be useful.
;
; TT also allows "dot-atoms" like .NN, .S, which can be thought of as 
; features (or superordinate categories) of small groups of atoms, 
; e.g. (respectively) {NN, NNS}, {S, SBAR, SINV}, or whatever might be
; needed. An atom matches a dot-atom if (isa atom dot-atom) is 
; true. (This in principle allows for any computable predicate on atoms)
;
; The 'match' function finds a finds rightmost matches (while TTT finds 
; leftmost matches), but that could fairly easily be changed. Rightmost 
; matches are better when "soft variables" (ones allowing binding to 
; the empty sequence, coded as (:seq)) are more likely to remain empty
; than being filled. (Conversely, leftmost matches are appropriate if
; most optional constituents are expected to be filled.)
;
; The match process, if successful, reproduces the matched expression
; except that it wraps subsequences that were matched by variables of
; type ?, *, or + and are not of length 1 in (:seq ...). (Thus (:seq)
; codes the empty sequence, (:seq A (B C)) codes 'A (B C)', etc. This
; is what allows access to any element via position indices, as follows
;  0 -- the expression as a whole;
;  1, 2, 3, ... -- top-level elements of the match result
;  1.1, 1.2, 1.3, ..., 2.1, 2.2, 2.3, ... -- second-level elements
;  1.1.1, 1.1.2, 1.1.3, ... 1.2.1, 1.2.2, 1.2.3, ... -- 3rd-level elements
;  etc.
; These indices can then be used freely in the reassembly templates;
; reassembly is finished by "flattening" any (:seq ...) elements occurring
; in the result
;
; Utility for using complex indices for expression accesss;
; `````````````````````````````````````````````````````````

(defun indexed-element-of (expr index); May 1/20
;`````````````````````````````````````
; e.g., (indexed-element-of '(a (b c) d) 2) --> (b c)
; e.g., (indexed-element-of '(a (b c) d) 2.1) --> b
; e.g., (indexed-element-of '(a (b (c d) e) (f g)) '2.2.2) --> d
; N.B.: the 3rd example needs a quote on 2.2.2, because it's not a number      
; N.B.: index is assumed to be a proper index, like those above, o/w an crash
;       will occur somewhere along the line.
 (let (ii result)
      ; assume index 0 refers to the entire expr, with (:seq ...) "unwrapped"
      (cond ((eq index 0) (flatten-sequences expr))
            ((not (listp expr)) 
             (format t "~%***Bad first argument in (indexed-element-of ~a ~a)"
                       expr index)
             '*ERROR*)
            ((integerp index) (nth (- index 1) expr))
            (t (setq ii (format nil "(~a)" index)); prepare for reading as a list
               (setq ii (substitute #\Space #\. ii)); blanks instead of dots
               (setq ii (read-from-string ii)); now we have a list of indices
               (setq result expr)
               (dolist (i ii)
                 (setq result (nth (- i 1) result)))
               result))
 )); end of indexed-element-of

; Matching function
; `````````````````
(defun match (pa ex); match pattern pa to expression ex; May 4/20; tested
; `````````````````````````````````````````````````````
; This matching function produces matches that allow retrieval of values of
; matched pattern elements by the positions of the pattern elements. E.g.,
; 3 indexes whatever matched the 3rd top-level element of the pattern; e.g.,
; '3.2.2 (note: a symbol) indexes whatever matched the second element of
; the second element of the 3rd top-level element of the given pattern.
;
; e.g., (match '(!expr *list (f g) ?atom !atom) 
;              '((a) (b c) (d e) (f g) h))
;       --> ((A) (:SEQ (B C) (D E)) (F G) (:SEQ) H); NB: (:seq) is the empty seq.
; e.g., (match '(+expr !atom) 
;              '((a b) c d))
;       --> ((:SEQ (A B) C) D)
; e.g., (match '(+expr !atom) 
;              '((a b) c))
;      --> ((A B) C) ; NB: NOT ((:SEQ (A B)) C) --
;                          a 1-element seq is just the element
; e.g., (match '(*expr +atom) '(a b c)) 
;      --> ((:SEQ) (:SEQ A B C)) ; NB: (:seq) is the place-holder for the empty
;                                      sequence; w/o it, we couldn't retrieve
;                                      matched pa elements by their positions
; e.g., (match '(!atom (a b *list c) ?atom) '(x (a b (u) (v w) c) d))
;      --> (X (A B (:SEQ (U) (V W)) C) D)
;
; e.g., (match '(?atom +expr (*list (d (*atom (?atom)))) ?expr) 
;              '(      (a) b ( (c)  (d ( e f  (  g  )))) ((h))))
;      --> ((:SEQ) (:SEQ (A) B) ((C) (D ((:SEQ E F) (G)))) ((H)))
;
; ** e.g.'s for dot-atoms (features) to be added
;
; Special cases for atomic ex (matching ?/*/+ var's gives a sequence (or :nil)):
; e.g., (match 'a 'a) --> A
; e.g., (match '!atom 'a) --> a
; e.g., (match '?atom ()) --> :NIL {failure; assume any WORD "nil" or "NIL"
;                                  is changed to |nil| or |NIL| in a parse,
;                                  while Lisp NIL, i.e., (), is treated as
;                                  a list and *not* an atom.}
; e.g., (match '!atom 3.14) --> 3.14
; e.g., (match '?atom 'a) --> A; 
; e.g., (match '*atom 'a) --> A; 
; e.g., (match '+atom 'a) --> A; 
;
; The match produced, if any, is the leftmost one; :nil = failure.
;
; Available match variables are {!atom, !list, !expr}, where '!' means 
; exactly 1 occurrence, and may be replaced by '?' (0 or 1 occurrences),
; '*' (0 or more occurrences), or '+' (1 or more occurrences). The three
; !-variables respectively match a Lisp atom, list, or any expression.
;
 (let (p e m mm *v)
      (cond ((null pa) 
             (if (null ex) 
                 nil ; success with match-result nil
                 :nil)); failure
            ((null ex)
             ; a null expression ex, can only be matched by non-null pa if
             ; either pa is a list/expr match variable, or a list of "soft"
             ; variables that will match empty sequences ((:seq) (:seq) ...)
             (if (or (list-var pa) (expr-var pa)) 
                 nil ; success, with match result nil
                 (if (listp pa)
                     (if (find-if #'listp pa) :nil ; fail if there's a sublist
                         (if (find-if #'hard-var pa) :nil ; fail if there's 
                                                          ; a hard variable
                             ; no sublists, and no hard variables:
                             (mapcar #'(lambda (x) '(:seq)) pa)))
                     ; pa is an atom but not a match-var & not nil
                     :nil))) ; failure
                     
            ((equal pa ex) ex)
            ((and (dot-atom pa) (symbolp ex) (isa ex pa)) ex)

            ; pa, ex are non-null and unequal (& pa is not a feature of ex):
            ((atom pa)
             (if (or ; expr/atom/list-var respectively match expr/atom/list 
                     (expr-var pa)
                     (and (atom-var pa) (atom ex))
                     (and (list-var pa) (listp ex))
                     (and (eq pa '?\,) (eq ex '\,)))
                 ex :nil))

            ; pa is a non-null list, and pa, ex are unequal
            ((atom ex) :nil); failure

            ; pa and ex are unequal lists. We now have 6 cases depending
            ; on the initial element, p, of pa

            ; set p and e -- and conjoin with nil, to proceed past this point:
            ((and (setq p (car pa) e (car ex)) nil) nil)

            ; 1. If p is nonatomic, we try matching it to the initial element
            ; of ex, and if successful, recurse on the tails of pa
            ; and ex.
            ((listp p)
             (setq m (match p e)); if successful, returns e or a variant with
                                 ; subspans matching seq-var's in form (:seq ...)
             (if (not (eq m :nil))
                 (prog2 (setq mm (match (cdr pa) (cdr ex)))
                        (if (not (eq mm :nil)) (cons m mm); success 
                            :nil)) ; failure
                 :nil)) ; failure

            ; Initial element p is atomic;

            ; 2. For non-variable p, if it is equal to, or a feature of the
            ; 1st element of ex, we recurse on the tails of pa and ex, o/w fail
            ((not (match-var p))
             (if (or (eq p e) (and (symbolp e) (dot-atom p) (isa e p)))
                 (prog2 (setq mm (match (cdr pa) (cdr ex)))
                        (if (not (eq mm :nil)) (cons e mm) :nil))
                 :nil))

            ; 3. For a !-variable p, we try an initial-element match, and if
            ; successful, recurse on the tails of pa of ex;
            ((!-var p)
             (setq m (match p e))
             (if (not (eq m :nil))
                 (prog2 (setq mm (match (cdr pa) (cdr ex)))
                        (if (not (eq mm :nil)) (cons m mm) :nil))
                 :nil))

            ; 4. For a ?-variable, we try prepending (:seq) to a recursive 
            ; match of the tail of pa to ex; if the recursion fails,
            ; we try an initial-element match, and if successful, recurse
            ; on the tails of pa & ex;
            ((?-var p)
             (prog2 (setq mm (match (cdr pa) ex))
                    (if (not (eq mm :nil)) 
                        (cons '(:seq) mm)
                        ; recursion with empty match to p failed
                        (prog2 (setq m (match p e))
                               (if (not (eq m :nil)) 
                                   (prog2 (setq mm (match (cdr pa) (cdr ex)))
                                          (if (not (eq mm :nil))
                                              (cons m mm) :nil))
                                   :nil)))))
             

            ; 5. For a *-variable, we try prepending (:seq) to a recursive 
            ; match of the tail of pa to ex; if the recursion fails,
            ; we try an initial-element match, and if successful, recurse
            ; on pa (unchanged) and the tail of ex;
            ((*-var p)
             (prog2 (setq mm (match (cdr pa) ex)); try leaving p empty
                    (if (not (eq mm :nil))
                        (cons '(:seq) mm); success with p left empty
                        ; recursion with p left empty failed; so match p to e,
                        ; and if successful, recurse with pa (since the *-var
                        ; may add to its match sequence) and the tail of ex:
                        (prog2 (setq m (match p e))
                               (if (not (eq m :nil))
                                   ; 2nd recursion attempt:
                                   (prog2 (setq mm (match pa (cdr ex)))
                                          (if (not (eq mm :nil))
                                              (if (or (atom (car mm))
                                                      (not (eq (caar mm) :seq)))
                                                  ; 1st element of mm is not
                                                  ; a seq; so, form a seq from
                                                  ; m & (car mm) and make this
                                                  ; the 1st element of result:
                                                  (cons (list :seq m (car mm))
                                                        (cdr mm)) 
                                                  ; 1st element on mm is a seq;
                                                  ; if it's not the empty seq,
                                                  ; make m the 1st element of 
                                                  ; that seq, o/w use m instead:
                                                  (if (cdar mm); not empty seq
                                                      (cons (cons :seq 
                                                             (cons m (cdar mm)))
                                                        (cdr mm))
                                                      (cons m (cdr mm))))
                                              ; 2nd recursion failed
                                              :nil))
                                   :nil)) )))

            ; 6. For a +-variable, we try an initial-element match, and if
            ; successful, recurse on pa and (cdr ex) with the initial 
            ; +-variable of pa replaced by the corresponding *-varianle
            ((+-var p)
             (setq m (match p e))
             (if (not (eq m :nil))
                 (progn 
                   (setq *v (case p (+atom '*atom) (+list '*list) (+expr '*expr)))
                   (setq mm (match (cons *v (cdr pa)) (cdr ex)))
                   (if (not (eq mm :nil))
                       (if (or (atom (car mm))
                               (not (eq (caar mm) :seq)))
                           ; 1st element of mm is not a seq; so, form 
                           ; a seq from m & (car mm) and make this 
                           ; the 1st element of result:
                           (cons (list :seq m (car mm)) (cdr mm))
                           ; 1st element on mm is a seq; if it's not the 
                           ; empty seq, make m the 1st element of that seq,
                           ; else use m instead:
                           (if (cdar mm) ; 1st element is not the empty seq
                               (cons (cons :seq (cons m (cdar mm))) (cdr mm))
                               (cons m (cdr mm))))
                       ; recursion failed
                       :nil))
                 :nil) ) ; initial-element match failed
            (t (format t "~%*** (match ~a ~a) ~%   ~
                           gave neither success nor failure!" pa ex)
               '***ERROR))
 )); end of match


(defun atom-var (var) (member var '(?atom !atom *atom +atom)))

(defun list-var (var) (member var '(?list !list *list +list)))

(defun expr-var (var) (member var '(?expr !expr *expr +expr)))

(defun match-var (var) (or (atom-var var) (list-var var) (expr-var var)))

(defun soft-var (var) (member var '(?atom ?list ?expr *atom *list *expr))) 

(defun hard-var (var) (not (soft-var var)))

(defun ?-var (var) (member var '(?atom ?list ?expr ?\,))); optional comma added

(defun !-var (var) (member var '(!atom !list !expr)))

(defun *-var (var) (member var '(*atom *list *expr)))

(defun +-var (var) (member var '(+atom +list +expr)))

(defun dot-atom (atm)
  (and (symbolp atm) (equal #\. (car (coerce (string atm) 'list)))))

(defun isa (atm feat)
;```````````````````
; Various "dot-atoms" are allowed as features that can be used to match
; the corresponding atoms. The dot-atom repertoire can be freely expanded.
;
 (case feat (.SQ (find atm '(SQ SINV)))
            (.NN (find atm '(NN NNS)))
            (.NNP (find atm '(NNP NNPS)))
            (.NP (find atm '(NP WHNP)))
            (.ADJP (find atm '(ADJP JJ JJR JJS)))
            (.DT (find atm '(DT CD PRP$))); initial CD is often a DT
            (.a{n} (find atm '(a an)))
            (.RB (find atm '(RB RBR RBS ADVP NEG))); ex. of NEG: (NEG (NOT))
            (.NP (find atm '(NP-1 NP-2 NP-3 NP-4))); e.g., rightward displace't
            (.CC (find atm '(CC \, \;))); for detecting end of an NP
            (.and-or (find atm '(and or \&)))
            (.EXTRAP-S (find atm '(SBAR-1 SBAR-2 SBAR-3 SBAR-4 S-1 S2 S-3 S-4)))
             ; these SBAR/S variants are used in Brown to correlate it-extra
             ; with a corresponding clause; in ULF, we expect that it-extra
             ; provides enough of a clue to locate the extraposed clause.
            (.PP (find atm '(PP-1 PP-2 PP-3 PP-4)))
            (.with (find atm '(with without))); "with" is special, allowing 
                                              ; verbles S-complements
            (.PRED (find atm '(ADJP PP))); (VP (VBG|VBN ...) ...) also, but ....
            (.POSTMOD (find atm '(ADJP PP SBAR))); (VP (VBG ...) ...) also, but
                                                 ; allowing general VP seems risky
                                                 ; (change VP to VPG ??)
            (.DIS-POSTMOD (find atm '(PP-1 PP-2 PP-3 PP-4 SBAR-1 SBAR-2 SBAR-3
               SBAR-4 VP-1 VP-2 VP-3 VP-4 ADJP-1 ADJP-2 ADJP-3 ADJP-4))); more?
            (.JJ (find atm '(JJ JJR JJS))); NB: .ADJP also inludes these
            (.VB (find atm '(VB VBZ VBP VBD VBG VBN VBEN)))
            (.have (find atm '(have has having had)))
            (.be (find atm '(be is are am was were being been \'s \'re)))
            (.be-become (find atm '(be is are am was were being been \'s \'re
                                    become becomes became)))
 )); end of isa


(defun apply-rule (rule expr); May 4/20; briefly tested
;``````````````````````````````````````
; Apply the given tree-transformation rule to expr (at the top level)
;
; rule: a (<pattern> <template>) pair, where patterns are expressions that
;   in general contain !-/?-/*-/+-variables, of three types, viz. ones
;   that match atoms (other than () and numbers -- which need to be replaced
;   by non-numeric atoms, e.g., |3.2| instead of 3.2), ones that match lists, 
;   and ones that match any expressions; the template is another expression,
;   often echoing parts of the pattern but in general containing position
;   indicators like 3, 3.2, '3.3.2, where pieces of the match-result are to
;   be placed; here, 3rd element of match result, 2nd element of the third
;   element of the match result, etc.
; expr: an expression containing no numbers -- any that are present must be
;   (temporarily) replaced by atoms, e.g., 3.2 becomes |3.2|; also "NIL" as
;   a word should be replaced by |NIL|, lest it be regarded as a list rather
;   than atom in matching to list-var's.
;
 (let (result)
    ; (if (equal (second rule) '(1 2 (ADJP1 3 4) 5)); DEBUGGING
    ;     (format t "~%## *comb-adv-adjp* called with argument~%   ~s" expr))
      (setq result (match (car rule) expr))
      (if (eq result :nil) expr ; for failure, return exp unchanged
          ; o/w, fill template (w/ sequences flattened), and return the result:
          (fill-template (second rule) result))
 )); end of apply-rule


(defun apply-rule-bottom-up (rule expr); May 7/20; briefly tested
;````````````````````````````````````````
 (if (atom expr) (apply-rule rule expr)
     (apply-rule rule
         (mapcar #'(lambda (x) (apply-rule-bottom-up rule x)) expr))
 )); end of apply-rule-bottom-up


(defun apply-rule-top-down (rule expr)
;````````````````````````````````````
 (let ((ex (apply-rule rule expr)))
      (if (equal ex expr) ; no change? Then apply it to the parts
          (if (atom ex) ex
              (mapcar #'(lambda (x) (apply-rule-top-down1 rule x)) ex))
          ; there was a top-level change, so the rule may apply again:
          (if (atom ex) ex
              (apply-rule-top-down2 rule ex)))
 )); end of apply-rule-top-down

; For tracing either of the recursive occurrences above
(defun apply-rule-top-down1 (x y) (apply-rule-top-down x y))
(defun apply-rule-top-down2 (x y) (apply-rule-top-down x y))

                           
(defun fill-template (template match-result); May 7/20
;````````````````````````````````````````````
; template: an expression, in general containing position indicators 
;   like 3, 3.2, '3.3.2, where pieces of the match-result are to be placed
;   e.g., here, the references are to the 3rd element of match-result, 
;   the 2nd element of the third element of the match-result, etc. The 
;   index 0 is special -- it refers to match-result as a whole, with
;   sequences (:seq ...) flattened, i.e., the expression that was matched.
; match-result: an expression in general containing sequence expressions
;   such as (:seq (a b) c (d (f g))) (a 3-element sequence); (:seq) is
;   the empty sequence.
;
; result: the template is filled in with "pieces" from match-result, as
;   indicated by the position indices it contains. Where a position index
;   indexes a sequence, i.e., (:seq ...), the elements of the sequence
;   (if any) are inserted in the result, without the (:seq ...) wrapper.
;
 (let (val)
      (cond ((eq template 0); unlikely case - refers to entire expression
                            ; matched, which we can reconstruct by
                            ; flattening any sequences in match-result;
                            ; a faster way would be to include the original
                            ; expression as argument of 'fill-template',
                            ; but that's inelegant special-case handling
             (flatten-sequences match-result))
            ((position-index template) 
             (flatten-sequences (indexed-element-of match-result template)))
            ((atom template) template)
             ((listp (car template))
              (cons (fill-template (car template) match-result)
                    (fill-template (cdr template) match-result)))
             ((position-index (car template))
              (setq val (indexed-element-of match-result (car template)))
              (if (and (listp val) (eq (car val) :seq))
                  (append (flatten-sequences (cdr val))
                          (fill-template (cdr template) match-result))
                  (cons (flatten-sequences val)
                        (fill-template (cdr template) match-result))))
             ((spec-function (car template))
              (eval (cons (car template) 
                          (fill-template (cdr template) match-result))))
             (t ; (car template) is an atom but not a position index or function
              (cons (car template) (fill-template (cdr template) match-result))))
 )); end of fill-template
                

(defun flatten-sequences (expr); May 4/20; briefly tested
;``````````````````````````````
; E.g., (x (y z) (:seq (a b) c (d (f g))) u (:seq v (w w))) 
;       becomes
;       (x (y z) (a b) c (d (f g)) u v (w w)) ;
; i.e., lists enclosed by (:seq ... ) are replaced by the sequences they 
; contain. (:seq ...) expressions are not allowed to contain such 
; expressions as sequence elements. (These would not be flattened. It
; would be easy to allow them, but for the pattern transductions here no
; such embeddings occur, because sequence expressions are match-values of
; single sequence variables, like *atom or +expr, and these are matched
; only against input expressions free of sequence expressions.)
;
  (cond ((atom expr) expr)
        ((atom (car expr)) 
         (cons (car expr) (flatten-sequences (cdr expr))))
        ((eq (caar expr) :seq)
         (append (cdar expr) (flatten-sequences (cdr expr))))
        (t
         (cons (flatten-sequences (car expr)) (flatten-sequences (cdr expr))))
 )); end of flatten-sequences

      
(defun position-index (i); May 4/20; tested
;````````````````````````
; Position indices in tree transductions are here
; 1, 2, 3, ..., or
; 1.1, 1.2, 1.3, ..., 2.1, 2.2, 2.3, ..., etc., or
; 1.1.1, 1.1.2, ..., 1.2.1, 1.2.2, ..., 2.1.1, 2.1.2, ... etc.
; etc. (for as many integers chained together as we like)
;
; **Actually, it's a bit crazy that I'm doing the "reading" of the
; index atom both here and in 'indexed-element-of', but I couldn't
; be bothered to tidy up that little inefficiency.
;
 (let (ii)
   (cond ((integerp i) t)
         ((null i) nil)
         ((and (atom i) 
               (setq ii (format nil "(~s)" i)); prepare for reading as a list
               (setq ii (substitute #\Space #\. ii)); blanks instead of dots
               (setq ii (read-from-string ii)); now we have a list of indices
               (not (find-if-not #'integerp ii))) t)
         (t nil))
 )); end of position-index


(defun spec-function (atm) ; May 30/20
;`````````````````````````
; Does atm start with '!', exclusive of (just) '!', '!atom', '!list', !expr ? 
; If so, it is treated as a user-defined function in tt-templates.
;
 (and (atom atm) (char-equal (char (string atm) 0) #\!)
      (not (find atm '(! !atom !list !expr)))))
  

(defun !merge-names (names); May 30/20
;`````````````````````````
; names: e.g., (| New| | York| | State|)
; result: e.g., | New York State|
;
  (intern (apply #'concatenate 'string (mapcar #'string names))))

