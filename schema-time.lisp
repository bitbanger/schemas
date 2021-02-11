; Include guard for load-mats.lisp, which isn't nicely
; reloadable due to constant symbol redefinitions.
(if (not (boundp 'AIA-MATS-LOADED))
	(progn (ll-load-subdir "allen-time" "load-mats.lisp") (setf AIA-MATS-LOADED t)))

(load "ll-load.lisp")

(ll-load "ll-util.lisp")
(ll-load "schema-el.lisp")

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
	; TODO: cause-of implies (p m o), but not vice versa.
	;		This should affect the certainty scores.
	(
		; prop
		cause-of
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

(ldefun is-now? (s)
	(and
		(symbolp s)
		(has-prefix? (string s) "NOW")
		(is-num-str? (remove-prefix (string s) "NOW"))
	)
)

(ldefun now-num (s)
	(if (is-now? s)
		; then
		(parse-integer (remove-prefix (string s) "NOW"))
		; else
		nil
	)
)

(ldefun mk-now-time-props (tm)
(block outer
	(setf nows (sort (remove-duplicates (get-elements-pred tm 'is-now?) :test #'equal) '< :key 'now-num))

	(setf now-props (list))
	(loop for i from 0 to (- (length nows) 2)
		do (setf now-props (append now-props (list
			(list (nth i nows) 'STRICTLY-BEFORE (nth (+ i 1) nows))
		)))
	)

	(return-from outer now-props)
)
)

(ldefun load-time-model (tm)
(block outer
	; (format t "hash of time model: ~s~%" (rechash tm))
	(setf model-hash (rechash tm))
	(if (equal model-hash *TIME-MODEL-HASH*)
		; then
		(return-from outer nil)
		; nil
		; else
		(progn
		(setf *TIME-MODEL* (append tm (mk-now-time-props tm)))
		(setf *TIME-MODEL-HASH* model-hash)
		)
	)


	; BELOW HERE: Ben adds timegraph model code


	; Clear the state of the AIA solver.
	(clear)
	
	; Load the relationship triples into
	; the AIA solver's internal data model.
	(loop for rel in *TIME-MODEL* do (block inner
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

(ldefun time-pred? (p)
	(not (null (gethash p *TIME-PROP-ALLEN-RELS*)))
)

; convert-time-prop takes a temporal proposition
; and returns its equivalent Allen relation form.
(ldefun convert-time-prop (prop)
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

(ldefun time-prop? (p)
	(not (null (convert-time-prop p)))
)

(ldefun eval-time-prop (prop)
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

	(setf args (prop-all-args prop))
	(setf pred (prop-pred prop))

	(setf allen-result (second (allen-fhow (car args) (second args))))
	(setf allen-rels (gethash pred *TIME-PROP-ALLEN-RELS*))

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
