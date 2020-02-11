; Include guard for load-mats.lisp, which isn't nicely
; reloadable due to constant symbol redefinitions.
(if (not (boundp 'AIA-MATS-LOADED))
	(progn (load "load-mats.lisp") (setf AIA-MATS-LOADED t)))

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

(defparameter *NOW-TIME-PROPS* '(
	(NOW0 STRICTLY-BEFORE NOW1)
	(NOW1 STRICTLY-BEFORE NOW2)
	(NOW2 STRICTLY-BEFORE NOW3)
	(NOW3 STRICTLY-BEFORE NOW4)
	(NOW4 STRICTLY-BEFORE NOW5)
	(NOW5 STRICTLY-BEFORE NOW6)
	(NOW6 STRICTLY-BEFORE NOW7)
	(NOW7 STRICTLY-BEFORE NOW8)
	(NOW8 STRICTLY-BEFORE NOW9)
	(NOW9 STRICTLY-BEFORE NOW10)
	(NOW10 STRICTLY-BEFORE NOW11)
	(NOW11 STRICTLY-BEFORE NOW12)
	(NOW12 STRICTLY-BEFORE NOW13)
))

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
		consec
		(m)
	)
	(
		same-time
		(=)
	)
	(
		at-about
		(d s f =)
	)
	(
		before
		(p m o)
	)
	(
		strictly-before
		(p)
	)
	(
		after
		(pi mi oi)
	)
	(
		during
		(s d f =)
	)
	(
		precond-of
		(p m)
	)
	(
		postcond-of
		(pi mi)
	)
))
)

(setf *TIME-MODEL-HASH* nil)
(setf *TIME-MODEL* nil)

(defun load-time-model (tm)
(block outer
	; (format t "hash of time model: ~s~%" (rechash tm))
	(setf model-hash (rechash tm))
	(if (equal model-hash *TIME-MODEL-HASH*)
		; then
		(return-from outer nil)
		; nil
		; else
		(progn
		(setf *TIME-MODEL-HASH* model-hash)
		(setf *TIME-MODEL* (append tm *NOW-TIME-PROPS*))
		)
	)


	; BELOW HERE: Ben adds timegraph model code


	; Clear the state of the AIA solver.
	(clear)
	
	; Load the relationship triples into
	; the AIA solver's internal data model.
	(loop for rel in (append tm *NOW-TIME-PROPS*) do (block inner
		(setf allen-rel (convert-time-prop rel))
		(dbg 'time "asserting ~s~%" allen-rel)
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
; BELOW HERE: Ben evaluates using timegraph instead of Allen
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
