(load "load-mats.lisp")
(initialize-allen-arrays)

; A "time model" is a list of infix relation triples
; where the first and third elements are Lisp symbols
; representing episodes, and the second element is a
; list of Allen Interval Algebra relation symbols:
;	=   equals
;	d   during (proper)
;	di  contains (proper)
;	s   starts
;	si  started-by
;	f   finishes
;	fi  finished-by
;	p   precedes (before)
;	pi  preceded by (after)
;	m   meets
;	mi  met-by
;	o   overlaps
;	oi  overlapped-by
; Examples of entries in a time model:
;	(E1.SK (p m o) NOW1)
;	(E2.SK (p) E3.SK)

(defparameter *TIME-PROP-ALLEN-RELS*
(mk-hashtable '(
	; TODO: cause.v implies (p m o), but not vice versa.
	;		This should affect the certainty scores.
	(
		; prop
		cause.v
		; equivalent Allen rel disjunction
		(p m o)
	)
	(
		consec.pr
		(m)
	)
	(
		same-time.pr
		(=)
	)
	(
		at-about.pr
		(s =)
	)
	(
		before.pr
		(p m o)
	)
	(
		strictly-before.pr
		(p)
	)
	(
		after.pr
		(pi mi oi)
	)
	(
		during.pr
		(s d f =)
	)
))
)

(defun load-time-model (tm)
(block outer
	; Clear the state of the AIA solver.
	(clear)
	
	; Load the relationship triples into
	; the AIA solver's internal data model.
	(loop for rel in tm do (block inner
		(setf allen-rel (convert-time-prop rel))
		(if (null allen-rel)
			(progn
				(dbg 'time "invalid temporal proposition ~s~%" rel)
				(return-from outer nil)
			)
		)

		(allen-assert (car allen-rel) (second allen-rel) (third allen-rel))
	))

	; Reduce the AIA solver's model to obtain
	; the strictest possible pairwise relations.
	(allen-reduce)
)
)

(defun time-pred? (p)
	(not (null (gethash p *TIME-PROP-ALLEN-RELS*)))
)

; convert-time-prop takes a temporal proposition
; and returns its equivalent Allen relation form.
(defun convert-time-prop (prop)
(block outer
	(setf pred (prop-pred prop))

	(if (not (time-pred? pred))
		(progn
			(dbg 'time "~s isn't a valid temporal predicate~%" pred)
			(return-from outer nil)
		)
	)

	(setf args (prop-all-args prop))

	(if (not (equal 2 (length args)))
		(progn
			(dbg 'time "~s isn't a temporal predicate; has ~s args, but want 2" prop (length args))
			(return-from outer nil)
		)
	)

	(setf allen-rels (gethash pred *TIME-PROP-ALLEN-RELS*))

	(return-from outer (list (car args) allen-rels (second args)))
)
)

(defun time-prop? (p)
	(not (null (convert-time-prop p)))
)

(defun eval-time-prop (prop)
(block outer
	(setf allen-rel (convert-time-prop prop))
	(if (null allen-rel)
		(progn
			(dbg 'time "invalid temporal proposition ~s~%" prop)
			(return-from outer nil)
		)
	)

	; Evaluate the relationship in the time model.
	; (dbg 'time "evaluating Allen rel ~s~%" allen-rel)

	(setf allen-result (second (allen-fhow (car args) (second args))))

	(dbg 'time "allen result: ~s~%" allen-result)
	(dbg 'time "allen rels: ~s~%" allen-rels)

	(if (equal allen-result 'ANY)
		; This doesn't confirm the proposition, but it doesn't
		; necessarily refute it, either.
		(return-from outer nil)
	)

	; TODO: handle cases (via certainty scores) where
	; the relationship could be an Allen relation that
	; doesn't support the predicate, but it could also
	; be one that supports it.
	(if (not (listp allen-result))
		; then
		(if (member allen-result allen-rels :test #'equal)
			; then
			(return-from outer t)
			; else
			(return-from outer nil)
		)
	)
	(if (subset allen-result allen-rels)
	; (if (not (null (intersection allen-result allen-rels :test #'equal)))
		(return-from outer t)
	)

	(return-from outer nil)
)
)
