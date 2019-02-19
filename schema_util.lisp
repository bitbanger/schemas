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
		(explain-nil "~s was not a schema instance"))

	(t (second instance))
)
)

(defun instance-bindings (instance)
(cond
	((not (instance? instance))
		(explain-nil "~s was not a schema instance"))

	(t (third instance))
)
)

(defun instance-matched-wffs (instance)
(cond
	((not (instance? instance))
		(explain-nil "~s was not a schema instance"))

	(t (fourth instance))
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

		((equal (schema-ep-name name) (third equality))
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



; gives the full list of inferred WFFs from a schema instance
; (only WFFs with all variables filled)
(defun inferred-wffs (instance)
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
		append (loop for pair in (get-section-pairs bound-schema sec-name)
			; do (format t "candidate: ~s~%" (second pair))
			if (has-no-elements-pred pair
					(lambda (x) (and (varp x) (not (or (lex-schema-ep-var? x) (lex-goal-var? x))))))
				collect pair
			; else do (format t "	(failed)~%")
		)
	)
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
