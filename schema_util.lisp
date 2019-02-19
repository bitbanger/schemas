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

(defun schema-name (schema)
	(second (car (schema-header schema)))
)

; reports whether something is an "episode"
; (a collection of WFFs)
(defun episode? (ep)
	t
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
			((not (or
					(listp joined-ep)
					(varp joined-ep)))
				(return-from outer nil))

			((not (equal 3 (length joined-ep)))
				(return-from outer nil))

			((not (equal 'join.f (car joined-ep)))
				(return-from outer nil))

			((varp joined-ep)
				(list joined-ep))
		)

		(setf rec-e1 (uncouple-joins (second joined-ep)))
		(if (null rec-e1) (return-from outer nil))

		(setf rec-e2 (uncouple-joins (third joined-ep)))
		(if (null rec-e2) (return-from outer nil))


		(return-from outer (append rec-e1 rec-e2))
)
)
)

; reports whether an episode relation defines a schema's
; characteristic episode ?e
; TODO: figure out a better way than assuming it's called ?e
(defun characteristic-ep? (ep-rel)
(let (
(uncoupled nil) (equality nil) (to-uncouple nil)
)

(block outer
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
		((equal '?e (car equality))
			(setf to-uncouple (third equality)))

		((equal '?e (third equality))
			(setf to-uncouple (car equality)))

		(t (return-from outer nil))
	)

	(setf uncoupled (uncouple-joins to-uncouple))

	(if (null uncoupled)
		(return-from outer nil))

	; Make sure the characteristic episodes are all in the schema
)

)
)

; reports whether an instance of a schema has
; been "fulfilled"---that is, whether its characteristic
; episode has had all of its constituent episodes matched.
; We allow partial matches of each episode, but inferred
; WFFs won't be added to the KB (for now) until they are
; fully instantiated (i.e. no variables unbound).
(defun instance-fulfilled? (schema-instance)
(let (
(char-ep nil)
)

(block outer
	(loop for ep-rel in (get-ep-rels schema-instance)
		; if 
	)
)

)
)

; INIT: define a bunch of new functions for the schema
; section aliases so I won't have to keep typing
; get-section-pairs calls
(loop for key being the hash-keys of *SCHEMA-SEC-ALIASES*
	do (setf
		; LHS
		(fdefinition (intern (format nil "GET-~s"
			(string (gethash key *SCHEMA-SEC-ALIASES*)))))

		; RHS
		(lambda (schema)
			(get-section-pairs schema key)
		)
	)
)
