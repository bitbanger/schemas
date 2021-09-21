; We need various template functions for subcat prefs like
;  'v_np-pref!', 'v_np-contextual-pref!, 'v_np-contextual-pref!',
;  'v_np-extra-np-pref!', etc.

; Data are supplied in "transitivity-lists.lisp"
; The functions have been briefly tested (Feb 20/21)

(defun v_np-pref! (pos+verb)
;```````````````````````````
; pos+verb: e.g., (VBD left)
;
; Compute a preference of the stem verb (e.g., 'leave') for a (gapped) NP 
; object, given there's nothing after the verb except perhaps an ADVP or PP.
; In principle the value can be any of 0, 1, 2, 3 (0 - intransitive, 
; 1 - weakly transitive, 2 - transitive, 3 -- strongly transitive). 
; But I'm assuming by default verbs are transitive, and when there's at
; most an ADVP or PP after them, the strength of demand for a gap is 3.
;
; E.g., "the bird that I saw _" (strongly transitive); e.g., "the gift
; that he gave _" (strongly transitive); e.g., "the student I expect _ to
; call _" (two possible transitive positions); e.g., "the friend he wants
; _ to succeed {_}" (a transitive and weakly transitive position). 
;
; We take verbs to be transitive (or ditransitive) by default. So only
; *purely-intransitive-verbs* should resist having a gap inserted.
; (Even 0 strength still allows gap insertion, if there's no better choice
; of gap placement.)
;
 (let ((stm (stem pos+verb))) 
      (cond ((gethash stm *pseudo-transitive-verbs*) 2)
            ; "What kind of scientist would you like to be _ some day?"
            ((gethash stm *rarely-transitive-verbs*) 1)
            ; "Which case did he plead _ in court?"
            ((gethash stm *purely-intransitive-verbs*) 0)
            ; ?"What did he buckle/dispose _?"
            (t 3)) ; transitive by default
 )); end of v_np-pref!


(defun v_np-contextual-pref! (pos+verb)
;``````````````````````````````````````
; Evaluate the preference of the verb (stem) for an NP object (gapped)
; when it is followed by one or more of S|VP|PP|ADVP|ADJP (no NP). The
; preference (in general, ranging from 0-3) should be greater if the
; verb is ditransitive, not just transitive. [** What abt SBAR?]
;
 (let ((stm (stem pos+verb)))
      (cond ((gethash stm *pseudo-transitive-verbs*) 1)
            ; "What kind of doctor is he _ now that he's fully trained?"
            ; "What kind of lawyer did he decide to become _ to get rich?"
            ; "What shade of red do you suppose he blushed _ when I found out?"
            ((gethash stm *rarely-transitive-verbs*) 1)
            ; "What kind of surprise did he spring _ on you?"
            ; "Which rule does he feel _ to be unfair?"
            ((gethash stm *purely-intransitive-verbs*) 0)
            ((gethash stm *ditransitive-verbs*) 3)
            (t 2)) ; singly transitive by default
 )); end of v_np-contextual-pref!

(defun v_np-extra-np-pref! (pos+verb)
;````````````````````````````````````
; Evaluate the preference of the verb (stem) for an extra NP object (gapped)
; when it is followed by an NP & maybe more; the preference will > 0 for
; a ditransitive verb, & probably 0 for a merely transitive one:
;
 (let ((stm (stem pos+verb)))
      (cond ((gethash stm *ditransitive-verbs*) 2)
            (t 0))
 )); end of v_np-extra-np-pref!


(defun v_pp-pref! (pos+verb)
;``````````````````````````
; Evaluate the preference of the verb (stem) for a PP complement (gapped)
; when it lacks overt complements/adjuncts, other than perhaps an NP;
; e.g., "To whom did you dedicate the book _?", "I know where he is _."
;
; Originally I began construction of a list of '*pp-taking-verbs*', but
; discontinued that listing -- it was very time-consuming, and since
; Treebank parses don't distinguish between complements and adjuncts,
; and PP-adjuncts can always be gapped, there's really no benefit here.
; So just use a value here suitable when there's no complement except
; perhaps a NP:
 (let ((stm (stem pos+verb))) 2))


(defun v_ap-pref! (pos+verb)
;``````````````````````````
; Evaluate the preference of the verb (stem), which may be active or passive,
; for an immediately following adjective phrase or other predicate;
; e.g., "How tall is he _?", "I know how smart he is _", "How promising
; is this approach considered _?"
;
 (let ((stm (stem pos+verb)))
      (cond ((gethash stm *pseudo-transitive-verbs*) 3)
            ((gethash stm *pred-taking-verbs*) 2)
            ((gethash stm *np+pred-taking-verbs*) 1)
            (t 0))
 )); end of v_ap-pref!


(defun v_np_ap-pref! (pos+verb)
;``````````````````````````````
; Evaluate the preference of the verb (stem), already followed by an NP,
; for an immediately following adjective phrase or other predicate;
; e.g., "How smart do you consider him _?", "I know how insecure this  
; made him _"; 
;
 (let ((stm (stem pos+verb)))
      (cond ((gethash stm *np+pred-taking-verbs*) 3)
            (t 0))
 )); end of v_np_ap-pref!

(defun v_whs-pref! (pos+verb)
;```````````````````````````
; Evaluate the preference of the verb (stem) for interpreting an immediately
; following when/where-clause as a nominal (rather than adverbial);
; E.g., "He wondered when the tornado was arriving" (vs., "He panicked
; when the tornado was arriving").
 (let ((stm (stem pos+verb)))
      (cond ((gethash stm *whs-taking-verbs*) 3)
            (t 0))
 )); end of v_whs-pref!


(defun v_np_whs-pref! (pos+verb)
;```````````````````````````````
; Evaluate the preference of the verb (stem) for interpreting a when/where-
; clause following an np as a nominal (rather than adverbial);
; E.g., "He told Alice when he was arriving" (vs., "He phoned Alice when
; he was arriving").
 (let ((stm (stem pos+verb)))
      (cond ((gethash stm *np-whs-taking-verbs*) 3)
            (t 0))
 )); end of v_np_whs-pref!

(defun v_pp_whs-pref! (pos+verb)
;```````````````````````````````
; Evaluate the preference of the verb (stem) for interpreting a when/where-
; clause following a pp as a nominal (rather than adverbial);
; E.g., "He confided to Alice when he would resign his position;"
; "He checked with Alice when the concert was scheduled to take place";
; (vs. "He talked to Alice when he resigned his position.")
 (let ((stm (stem pos+verb)))
      (cond ((gethash stm *pp-whs-taking-verbs*) 3)
            (t 0))
 )); end of v_np_whs-pref!


