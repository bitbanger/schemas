(load "real_util.lisp")
(load "norm-el.lisp")
(load "timegraph.lisp")


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

(defparameter *TIME-PROP-RELS*
(mk-hashtable '(
	(cause.v t)
	(consec t)
	(same-time t)
	(at-about t)
	(before t)
	(strictly-before t)
	(after t)
	(during t)
	(precond-of t)
	(postcond-of t))))
		
	
(setf *TIME-MODEL-HASH* nil)
(setf *TIME-MODEL* nil)
(setf *TIME-GRAPH* nil)

(defun is-now? (s)
	(and
		(symbolp s)
		(has-prefix? (string s) "NOW")
		(is-num-str? (remove-prefix (string s) "NOW"))
	)
)

(defun now-num (s)
	(if (is-now? s)
		; then
		(parse-integer (remove-prefix (string s) "NOW"))
		; else
		nil
	)
)

(defun mk-now-time-props (tm)
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
		(setf *TIME-MODEL* (append tm (mk-now-time-props tm)))
		(setf *TIME-MODEL-HASH* model-hash)
		)
	)


	; BELOW HERE: Ben adds timegraph model code


	; Clear Timegraph
	(setf *TIME-GRAPH* (make-timegraph))
	
	; Load the relationship triples into
	; the timegraph's internal data model.
	(dolist (rel *TIME-MODEL*)
	  (when (time-prop? rel)
		(let ((pred (prop-pred rel))
			  (e1 (first (prop-all-args rel)))
			  (e2 (second (prop-all-args rel))))

		  (cond 
			((and (or (equal pred "cause.v")
					  (equal pred "before"))
				  (not (ep-not-before-p *TIME-GRAPH* e1 e2)))
			 (ep-assert-before *TIME-GRAPH* e1 e2))

			((and (or (equal pred "precond-of")
				 	  (equal pred "strictly-before"))
				  (not (ep-not-precond-of-p *TIME-GRAPH* e1 e2)))
			 (ep-assert-precond-of *TIME-GRAPH* e1 e2))

			((and (or (equal pred "at-about")
					  (equal pred "during"))
				  (not (ep-not-at-about-p *TIME-GRAPH* e1 e2)))
			 (ep-assert-at-about *TIME-GRAPH* e1 e2))

			((and (equal pred "consec")
				  (not (ep-not-consec-p *TIME-GRAPH* e1 e2)))
			 (ep-assert-consec *TIME-GRAPH* e1 e2))

			((and (equal pred "same-time")
				  (not (ep-not-equals-p *TIME-GRAPH* e1 e2)))
			 (ep-assert-equals *TIME-GRAPH* e1 e2))

			((and (equal pred "after")
				  (not (ep-not-before-p *TIME-GRAPH* e2 e1)))
			 (ep-assert-before *TIME-GRAPH* e2 e1))

			((and (equal pred "postcond-of")
				  (not (ep-not-precond-of-p *TIME-GRAPH* e2 e1)))
			 (ep-assert-precond-of *TIME-GRAPH* e2 e1))

			(t 
			  (dbg 'time "temporal proposition ~s is inconsistent with time model ~s~%"
				   rel tm))))))

)
)

(defun time-pred? (p)
	(not (null (gethash p *TIME-PROP-RELS*)))
)


; check if temporal proposition is valid
(defun time-prop? (prop)
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

	(return-from outer t)
))

(defun eval-time-prop (prop)
  (when (not (time-prop? prop))
		(dbg 'time "invalid temporal proposition ~s~%" prop)
		nil)

  (let ((pred (prop-pred prop))
		(e1 (first (prop-all-args prop)))
		(e2 (second (prop-all-args prop))))
		
	(cond 
		
	  ((and (or (equal pred "cause.v")
				(equal pred "before"))
			(not (ep-not-before-p *TIME-GRAPH* e1 e2)))
	   (ep-before-p *TIME-GRAPH* e1 e2))
	
	  ((and (or (equal pred "precond-of")
	
				(equal pred "strictly-before"))
			
			(not (ep-not-precond-of-p *TIME-GRAPH* e1 e2)))
		
	   (ep-precond-of-p *TIME-GRAPH* e1 e2))
			
	  ((and (or (equal pred "at-about")
				(equal pred "during"))
			(not (ep-not-at-about-p *TIME-GRAPH* e1 e2)))
	   (ep-at-about-p *TIME-GRAPH* e1 e2))

	  ((and (equal pred "consec")
			(not (ep-not-consec-p *TIME-GRAPH* e1 e2)))
	   (ep-consec-p *TIME-GRAPH* e1 e2))

	  ((and (equal pred "same-time")
			(not (ep-not-equals-p *TIME-GRAPH* e1 e2)))
	   (ep-equals-p *TIME-GRAPH* e1 e2))

	  ((and (equal pred "after")
			(not (ep-not-before-p *TIME-GRAPH* e2 e1)))
	   (ep-before-p *TIME-GRAPH* e2 e1))

	  ((and (equal pred "postcond-of")
			(not (ep-not-precond-of-p *TIME-GRAPH* e2 e1)))
	   (ep-precond-of-p *TIME-GRAPH* e2 e1))

	  (t nil))

	;(dbg 'time "allen result: ~s~%" allen-result)
	;(dbg 'time "allen rels: ~s~%" allen-rels)


	; TODO: handle cases (via certainty scores) where
	; the relationship could be an Allen relation that
	; doesn't support the predicate, but it could also
	; be one that supports it.
))
