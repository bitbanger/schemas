(declaim (sb-ext:muffle-conditions cl:warning))

(load "real_util.lisp")
(load "parse.lisp")

(defun get-pairs (l)
	(loop for (a b) on l by #'cddr
		collect (list a b)
	)
)

(defun schema-sections (schema)
	(cddr schema)
)

(defun schema-section-names (schema)
	(mapcar #'car (schema-sections schema))
)

(defun get-section (schema section-name)
	(loop for section in (schema-sections schema)
		if (equal (car section) section-name)
			return section
	)
)

(defun get-section-pairs (schema section-name)
	(get-pairs (cdr (get-section schema section-name)))
)

(defun get-int-ep (schema)
	(get-pairs (cdr (get-section schema ':Intended-episodes)))
)

(setf (fdefinition 'gs) #'get-section)

(defun schema-header (schema)
	(second schema)
)

(defun schema-ep-name (schema)
	(car (last (schema-header schema)))
)

(defun schema-name (schema)
	(second (car (schema-header schema)))
)

(defun new-schema-instance (schema-name)
	(mk-schema-instance schema-name nil nil)
)

(defun mk-schema-instance (schema-name bindings matched-eps)
	(list 'SCHEMA-INSTANCE schema-name bindings matched-eps)
)

(defun instance-to-str (instance)
	(if (not (instance? instance))
		; then
		(explain-nil "~s is not a schema instance" instance)
		; else
		(format nil
			"(SCHEMA-INSTANCE~%	SCHEMA NAME:~%		~s~%	BINDINGS:~%	~d~%	MATCHED WFFS:~%	~d~%)"
			(instance-schema-name instance)
			(tab-all-lines 2
				(ht-to-str (instance-bindings instance)))
			(tab-all-lines 2 (join-str-list *NEWLINE*
				(mapcar
					(lambda (match)
						(format nil "~d: ~d" (second match) (car match)))
					(instance-matched-wffs instance))))
		)
	)
)

(defun instance? (x)
	(and
		(equal 4 (length x))
		(equal 'SCHEMA-INSTANCE (car x))
	)
)

(defun instance-schema-name (instance)
(cond
	((not (instance? instance))
		(explain-nil "~s was not a schema instance" instance))

	(t (second instance))
)
)

(defun instance-bindings (instance)
(cond
	((not (instance? instance))
		(explain-nil "~s was not a schema instance" instance))

	(t (third instance))
)
)

(defun instance-matched-wffs (instance)
(cond
	((not (instance? instance))
		(explain-nil "~s was not a schema instance" instance))

	(t (fourth instance))
)
)

(defun instance-id (instance)
	(concat-strs
		(instance-schema-name instance)
		"-"
		(b10tob64 (rechash (mk-schema-instance
			(instance-schema-name instance)
			(instance-bindings instance)
			(unordered-rechash (instance-matched-wffs instance))
		)))
	)
)

(defun print-schema (schema)
(block outer
	(format t "(epi-schema ~s~%" (schema-header schema))
	(loop for section in (schema-sections schema)
		do (block inner
			(format t "	(~s~%" (car section))
			(loop for pair in (get-pairs (cdr section))
				do (format t "		~s	~s~%" (first pair) (second pair))
			)
			(format t "	)~%")
		)
	)
	(format t ")~%")
)
)

(defun uncouple-joins (joined-ep)
(let (
	(rec-e1 nil) (rec-e2 nil)
)
(block outer
		(cond
			((varp joined-ep)
				(return-from outer (list joined-ep)))

			((not (listp joined-ep))
				(return-from outer nil))

			((not (equal 3 (length joined-ep)))
				(return-from outer nil))

			((not (equal 'join.f (car joined-ep)))
				(return-from outer nil))
		)

		(setf rec-e1 (uncouple-joins (second joined-ep)))
		(if (null rec-e1) (return-from outer nil))

		(setf rec-e2 (uncouple-joins (third joined-ep)))
		(if (null rec-e2) (return-from outer nil))


		(return-from outer (append rec-e1 rec-e2))
)
)
)

; returns the characteristic episode constituents of the schema
(defun extract-characterizers-for-ep (schema ep-rel)
(let (
(uncoupled nil) (equality nil) (to-uncouple nil) (seen-eps nil) (seen-ep-ids nil)
)

(block outer
	(dbg 'extract-characterizers-for-ep "got input schema ~s, ep-rel ~s~%" schema ep-rel)

	; Make sure everything's in the right format
	; e.g.:
	;	(!w1 ((join.f ?e1 (join.f ?e2 ?e3)) = ?e))
	(if (not (equal 2 (length ep-rel)))
		(return-from outer nil))

	(if (not (equal 3 (length (second ep-rel))))
		(return-from outer nil))

	(setf equality (second ep-rel))

	(if (not (equal '= (second equality)))
		(return-from outer nil))

	(cond
		((equal (schema-ep-name schema) (car equality))
			(setf to-uncouple (third equality)))

		((equal (schema-ep-name schema) (third equality))
			(setf to-uncouple (car equality)))

		(t (return-from outer nil))
	)

	(setf uncoupled (uncouple-joins to-uncouple))

	(if (null uncoupled)
		(return-from outer nil))

	(setf seen-eps '())

	; Make sure all of the characteristic episode constituents
	; are in the schema
	; OPT: too many loops! :)
	; TODO: dedupe or something (but probably the same episode won't be listed
	; in a schema twice?)
	(loop for sec-name in (schema-section-names schema)
			do (if (not (member sec-name '(:Episode-relations)))
					(loop for ep in uncoupled
						;do (if (member ep (mapcar #'car (get-section-pairs sec)))
						;		(setf seen-eps (append seen-eps (list ep)))
						;	)
						do (loop for sec-ep-pair in (get-section-pairs schema sec-name)
							do (if (equal ep (car sec-ep-pair))
								(setf seen-eps (append seen-eps (list sec-ep-pair)))
							)
						)
					)
			)
	)

	(setf seen-ep-ids (mapcar #'car seen-eps))

	(if (loop for ep in uncoupled thereis (not (member ep seen-ep-ids)))
		(return-from outer nil)
	)

	(return-from outer seen-eps)
)

)
)

; OPT: extract-characterizers(-for-ep) could be cached.
(defun extract-characterizers (schema)
(let (
(maybe-characterizers nil)
)
(block outer
	(dbg 'extract-characterizers "in extract-characterizers~%")
	(dbg 'extract-characterizers "ep-rels is ~s~%" (get-ep-rels schema))
	(dbg 'extract-characterizers "ep-rels is ~s~%" (get-section-pairs schema ':Episode-relations))
	(loop for ep-rel in (get-ep-rels schema)
		do (dbg 'extract-characterizers "looping on ep-rel ~s~%" ep-rel)
		do (block inner
			(setf maybe-characterizers (extract-characterizers-for-ep schema ep-rel))
			(if (not (null maybe-characterizers))
				(return-from outer maybe-characterizers))
		)
	)
)
)
)

; reports whether an instance of a schema has
; been "fulfilled"---that is, whether its characteristic
; episode has had all of its constituent episodes matched.
; We allow partial matches of each episode, but inferred
; WFFs won't be added to the KB (for now) until they are
; fully instantiated (i.e. no variables unbound).
(defun instance-fulfilled? (instance)
(let (
(schema-name (instance-schema-name instance))
(schema (eval (instance-schema-name instance)))
(instance-bindings (instance-bindings instance))
(matched-wffs (instance-matched-wffs instance))
characterizers
matched-ep-ids
characterizer-ep-ids
)

(block outer
	(setf characterizers (extract-characterizers schema))

	(setf matched-ep-ids (mapcar #'second matched-wffs))
	(setf characterizer-ep-ids (mapcar #'car characterizers))

	(loop for char-ep-id in characterizer-ep-ids
		; do (format t "unbound: ~s~%bound: ~s~%" char-ep (apply-bindings char-ep bindings))
		; always (not (equal char-ep (apply-bindings char-ep bindings)))
		always (member char-ep-id matched-ep-ids)
	)
)

)
)


(defun unbindable-var? (v)
	(or (has-prefix? (string v) "!")
	(and
		(varp v)
		(or
				(lex-schema-ep-var? v)
				(lex-goal-var? v)
		)
	)
	)
)

(defun unbound-var? (v)
	(and
		(varp v)
		(not (unbindable-var? v))
	)
)


; Re-bind all variables in the instance to be unique.
; They're essentially Skolem constants that we'll want
; to refer to consistent individuals throughout the KB.
; We denote them as vars, rather than Skolem constants,
; so that we know the quantification happened in the
; schema and not the story.
(defun rebind-vars (instid cursor bindings)
(block outer
	(setf cp-bind (ht-copy bindings))
	(rebind-vars-helper instid cursor cp-bind)
	(return-from outer cp-bind)
)
)

(defun rebind-vars-helper (instid cursor bindings)
(block outer

	(if (listp cursor)
		(loop for el in cursor
			do (rebind-vars instid el bindings)
		)
	)

	(if (lex-schema-ep-var? cursor)
		(if (null (gethash cursor bindings))
			(setf (gethash cursor bindings)
				(intern (concat-strs
					(string cursor)
					"_"
					(string-upcase instid))))
		)
	)

)
)


(defun new-inferred-wffs (instance)
(let (
(schema-name (instance-schema-name instance))
(instance-id (instance-id instance))
(instance-bindings (instance-bindings instance))
(matched-wffs (instance-matched-wffs instance))
bound-schema
)

(block outer


	; Tie all vars to instance
	(setf bound-schema (apply-bindings (eval schema-name) instance-bindings))
	(setf new-bindings (rebind-vars instance-id bound-schema instance-bindings))
	(setf bound-schema (apply-bindings (eval schema-name) new-bindings))

	
	; Generate the inferences
	; (loop for sec-name in 


)
)
)

; TODO: write a real TRIPS ontology ancestor function.
(defun ont-ancestors (word)
	(cond
		((equal word 'COCONUT.N)
			'(COCONUT.N INGREDIENT3.N FOOD2.N SUBSTANCE1.N MATERIAL1.N OBJECT1.N))

		((equal word 'MONKEY.N)
			'(MONKEY.N MAMMAL1.N VERTEBRATE1.N ANIMAL1.N ORGANISM1.N NATURAL_OBJECT1.N OBJECT1.N))

		((equal word 'TREE.N)
			'(TREE.N PLANT2.N ORGANISM1.N NATURAL_OBJECT1.N OBJECT1.N))

		(t (list word))
	)
)

; gives the full list of inferred WFFs from a schema instance
; (only WFFs with all variables filled)
(defun inferred-wffs (instance definite?)
(let (
(schema-name (instance-schema-name instance))
(instance-bindings (instance-bindings instance))
(matched-wffs (instance-matched-wffs instance))
bound-schema
)

(block outer
	(setf bound-schema (apply-bindings (eval schema-name) instance-bindings))
	(loop for sec-name in (schema-section-names bound-schema)
		if (not (equal sec-name ':Episode-relations))
		append (remove nil (loop for pair in (get-section-pairs bound-schema sec-name)
			if (if (not definite?) (has-element-pred pair #'unbound-var?) (has-no-elements-pred pair #'unbound-var?))
				collect (cond
					;((unbindable-var? (car pair))
						; (second pair))

					; Don't generate inferences that were matched to us; if we
					; matched it, it's already known.

					((member (list (second pair) (car pair)) matched-wffs :test #'equal)
						nil)

					(t pair))
			; else do (format t "	(failed)~%")
		))
	)
)

)
)

(defmacro pusha (e l)
	`(cond
		((null ,l) (push ,e ,l))

		(t (push ,e (cdr (last ,l))))
	)
)

; deref-subj-pronouns replaces sentence subject pronouns
; with the last non-pronoun sentence subject.
(defun deref-subj-pronouns (story)
(block outer
	(setf cur-subj nil)
	(setf new-story (list))

	(loop for sent in story
		do (setf new-sent (list))
		do (loop for wff in sent
			do (block inner
				;(format t "wff: ~d~%subj:~d~%" wff (get-sent-subj wff))
				;(format t "cur-subj: ~d~%" cur-subj)

				(setf subj1 (get-sent-subj wff))
				;(format t "subj1: ~d~%" subj1)
				(cond
					((null subj1) (pusha wff new-sent))
					((and (lex-pronoun? subj1) (null cur-subj)) (pusha wff new-sent))
					((lex-pronoun? subj1) (pusha (replace-sent-subj wff cur-subj) new-sent))
					((null cur-subj) (progn (setf cur-subj subj1) (pusha wff new-sent)))
				)
				)
			)
		do (pusha new-sent new-story)
	)

	(return-from outer new-story)
)
)

(defun disjoint-rel? (ep-rel)
	(or
		(equal ep-rel 'before.p)
		(equal ep-rel 'consec)
		(equal ep-rel 'after.p)
		(equal ep-rel 'cause-of.n)
		(equal ep-rel 'cause-of)
	)
)

(defun consistent-ep-rel? (ep-rel)
(block outer
	; Relating an episode to itself in a disjoint way isn't temporally consistent
	(if (and (disjoint-rel? (second ep-rel))
			(equal (car ep-rel) (third ep-rel)))
		(return-from outer nil))


	; Now we want to make sure the episode relations actually hold, if possible.

	(setf ep1 (car ep-rel))
	(setf ep2 (third ep-rel))

	; Conservatively, assume it's valid unless we can actually
	; do checks on the ep ref numbers.
	; TODO: actually implement interval overlap checking, etc.
	(if (or (not (lex-ep-const? (car ep-rel))) (not (lex-ep-const? (third ep-rel))))
		(return-from outer t))

	; Just compare using the Skolem numbers, for now.
	(setf ep1-num (parse-integer (remove-suffix (remove-prefix (string ep1) "E") ".SK")))
	(setf ep2-num (parse-integer (remove-suffix (remove-prefix (string ep2) "E") ".SK")))

	(cond
		((equal (second ep-rel) 'before.p)
			(return-from outer (<= ep1-num ep2-num)))

		((equal (second ep-rel) 'consec)
			(return-from outer (<= ep1-num ep2-num)))

		((equal (second ep-rel) 'after.p)
			(return-from outer (>= ep1-num ep2-num)))

		((equal (second ep-rel) 'cause-of.n)
			(return-from outer (<= ep1-num ep2-num)))
	)

	; We're being conservative; if we can't prove it's inconsistent,
	; we'll assume it's consistent.
	; TODO: also try to prove consistency, and alter point value.
	(return-from outer t)
)
)


(defun atemporal (wff)
	; TODO: some WFFs might be temporal even if they don't have a ** (or *)?
	(unchar-wff? wff)
)

(defun generalizable-const? (x)
	(and (lex-const? x) (not (lex-ep-ref? x)))
)

(defun extract-schema-consts (schema)
	(remove-duplicates (get-elements-pred schema #'generalizable-const?) :test #'equal)
)

(defun extract-instance-consts (instance)
(let (
(schema-name (instance-schema-name instance))
(instance-id (instance-id instance))
(instance-bindings (instance-bindings instance))
(matched-wffs (instance-matched-wffs instance))
bound-schema
)

(block outer
	(setf bound-schema (apply-bindings (eval schema-name) instance-bindings))

	(return-from outer (extract-schema-consts bound-schema))
)
)
)




(defparameter *SCHEMA-SEC-ALIASES*
	(mk-hashtable (list
		(list ':Fixed-roles 'fixed-roles)
		(list ':Var-roles 'var-roles)
		(list ':Init-conds 'init-conds)
		(list ':Nonfluent-conds 'nonfluent-conds)
		(list ':Fluent-conds 'fluent-conds)
		(list ':Goals 'goals)
		(list ':Intended-episodes 'int-eps)
		(list ':Episode-relations 'ep-rels)
	))
)

; INIT: define a bunch of new functions for the schema
; section aliases so I won't have to keep typing
; get-section-pairs calls
(mapcar
	; Map function
	(lambda (key)
		(setf
			; LHS
			(fdefinition (intern (format nil "GET-~s" (gethash key *SCHEMA-SEC-ALIASES*))))

			; RHS
			(lambda (schema) 
				(get-section-pairs schema key)))
	)

	; List
	(loop for key being the hash-keys of *SCHEMA-SEC-ALIASES* collect key)
)
