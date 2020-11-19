;	Copyright AT&T 1991


;;; Metric Temporal Reasoning System
;;; Implements shortest-path algorithm for metric constraints

;;; DEPENDS ON:  
;;; bitcode  (compile, load, eval)
;;; allen-constraint-prop  (load, eval)

(eval-when (eval compile load)
  (proclaim '(special extended-sym-to-bit noisy noisy-values))
  (proclaim '(special DEFINED-INTERVALS allenQ amode mmode
	      brief metric-array
	      metric-needs-reducing
	      pi-max
	      ))
  (defconstant max-number-of-intervals 128)
  (defconstant max-number-of-points (* 2 max-number-of-intervals))
  (proclaim `(type (simple-array t (,max-number-of-points
				    ,max-number-of-points)) metric-array))
  (defconstant CONST-LE0 1 "Encoding of the constraint <= 0")
  (defconstant UNKNOWN '?)
  (defconstant POINT0 0)
  )

;;*********************************************************
;;* Storing constraints
;;*********************************************************

;; In Allegro, fixnums are 27 bits long:
;; (integer-length most-positive-fixnum) = 28 
;; The metric array will use the lowest-order bit (bit 0) to indicate
;; the kind of inequality:  1 means <=, while 0 means <.

(defun neg-maybe-unknown (n)
  "Return the negation of N.  If N is a number, return -N; 
if is ?, just return ?"
  (cond ((numberp n) (- n))
	((eql n UNKNOWN) UNKNOWN)
	(t (error "bad argument ~s" n))))

(defun inequality-of (constraint)
  "Return the inequality symbol < or <= encoded by CONSTRAINT"
  (if (and (numberp constraint) (logtest 1 constraint)) '<= '<))

(defun numeral-of (constraint)
  "Return the number or ? encoded by CONSTRAINT"
  (if (numberp constraint) (ash constraint -1) constraint))

;; Note that (fixnump ...) is not part of Common Lisp; it can be
;; defined as
;; (and (integerp n) (<= n most-postive-fixnum) (>= n most-negative-fixnum)
;;

(defun fixnump (n)
	(and (integerp n) (<= n most-positive-fixnum) (>= n most-negative-fixnum))
)

(defun check-safe-metric-value (n)
  "Signal an error if N is not either UNKNOWN or an appropriate number to 
be the numeric part of a metric constraint."
  (unless (or (eql n UNKNOWN)
	      (fixnump (ash n 1)))
    (error "metric constraint ~s out of range" n)
    ))


;; We rely on the correspondence
;;    (left X) = 2 * position(X, DEFINED-INTERVALS)
;;    (right X) = 1 + (left X)
;;    point0 = 0
;; The current implementation simply performs these calculations
;; each time, but the values could also be stored in an array.

(defparameter pi-max 1 "The current number of points")

(defparameter metric-needs-reducing nil)

(defparameter metric-array (make-array (list max-number-of-points
					     max-number-of-points) 
				       )
  "Holds the metric constraints")

(defun left (i)
  "return the point representing the start of interval I"
  (let ((p (position i DEFINED-INTERVALS)))
    (if p 
	(1+ (ash p 1))
	(error "No such interval ~s" i))))

(defun right (i)
  "return the point representing the end of interval I"
  (let ((p (position i DEFINED-INTERVALS)))
    (if p 
	(+ 2 (ash p 1))
	(error "No such interval ~s" i))))

(defun make-point (point-form)
  "Return the point representing the given point-form"
  (ecase (car point-form)
    (left (left (cadr point-form)))
    (right (right (cadr point-form)))))

(defun make-point-maybe-new (point-form)
  "Return the point representing the given point-form, which may
include a new interval"
  (maybe-new-interval (cadr point-form))
  (make-point point-form))

(defun point-of (p)
  "return the interval of which P is an endpoint"
  (cond ((eql p POINT0) (error "POINT0 is not part of any interval"))
	(t (nth (ash (- p 1) -1) DEFINED-INTERVALS))))

(defun side-of (p)
  "return the symbols LEFT or RIGHT"
  (if (logtest 1 p) 'LEFT 'RIGHT))

(defun external-point-form (p)
  "returns the functional form of point P, e.g. (left A)"
  (if (eql p POINT0) 
      'point0
    (list (side-of p) (point-of p))))

(defun get-mc (p1 p2)
  "return the raw encoded form of the constraint on P1 - P2"
  (aref metric-array p1 p2))


(defun clear-metric-net nil
  ;; Wipes out entire metric net
  (setq pi-max 1)
  (setf (aref metric-array 0 0) CONST-LE0)
  )

(defun new-metric-interval (interval)
  "INTERVAL has just been added to defined-intervals, so now 
it's time to create it's endpoints"
  (mumble 'metric-new-point "new points for ~s" interval)
  (setq pi-max (+ 2 pi-max))
  (do ((j (- pi-max 1) (+ 1 j))) ((> j pi-max))
    (dotimes (i j) 
      (setf (aref metric-array i (- j 1)) UNKNOWN)
      (setf (aref metric-array (- j 1) i) UNKNOWN)))
  (setf (aref metric-array (- pi-max 1) (- pi-max 1)) CONST-LE0)
  (setf (aref metric-array (- pi-max 2) (- pi-max 2)) CONST-LE0)
  (setf (aref metric-array (- pi-max 2) (- pi-max 1)) 0)
  )

;;*********************************************************
;;*  I/O
;;*********************************************************

(defun print-metric-timeinfo (stream)
  "dump metric information to STREAM"
  (format stream "(setq metric-needs-reducing '~s)~%" metric-needs-reducing)
  (let ((*print-array* t))
    (format stream "(setq metric-array '~s)~%" metric-array))
  )

;;*********************************************************
;;*  Propagation
;;*********************************************************

(defun add-metric-constraint (p1 p2 n strict)
  "add the constraint that P1 - P2 <= N if STRICT is NIL; if
STRICT is non-NIL, add P1 - P2 < N"
  (mumble 'metric-add "asserting ~a - ~a ~a ~a" (external-point-form p1)
	  (external-point-form p2) (if strict "<" "<=") n)
  (check-safe-metric-value n)
  (unless (eql n UNKNOWN)
    (let ((oldval (aref metric-array p1 p2))
	  (newval (logior (ash n 1) (if strict 0 1))))
      (when (or (eql UNKNOWN oldval) (< newval oldval))
	(mumble 'metric-encode "encoding ~a - ~a ~a ~a as A(~a, ~a) = ~a" 
		(external-point-form p1)
		(external-point-form p2)
		(if strict "<" "<=")
		n
		p1 p2 newval)
	(setq metric-needs-reducing t)
	(setf (aref metric-array p1 p2) newval)))))

(defun metric-not-reduced-p ()
  "Used by the reduce interface function"
  metric-needs-reducing)
  
(defun reduce-metric-network ()
  (calculate-shortest-paths)
  (setq metric-needs-reducing nil)
  ;; extract the allen constraints
  (when amode (extract-allen-from-metric))
  )

(defun calculate-shortest-paths ()
  "Run the Floyd-Washall algorithm on the metric array"
  (let (dij dik dkj dikj)
    (mumble 'metric-reduce "reducing metric array")
    (dotimes (k pi-max)
      (dotimes (i pi-max)
	(setq dik (aref metric-array i k))
	(when (not (eql dik UNKNOWN))
	  (dotimes (j pi-max)
	    (setq dkj (aref metric-array k j))
	    (when (not (eql dkj UNKNOWN))
	      (setq dij (aref metric-array i j))
	      (setq dikj (+ (ash (+ (ash dik -1) (ash dkj -1)) 1)
			    (logand 1 dik dkj)))
	      (when (or (eql dij UNKNOWN)
			(< dikj dij))
		(when (eql i j)
		  (error "negative cycle detected in constraint set: A(~d, ~d) = ~d"
			 i j dikj))
		(check-safe-metric-value dikj)
		(setf (aref metric-array i j) dikj)
		))))))
    ))

(defun point-comparison (p1 p2)
  "Takes as input two point indexes (NOT point values!), and returns a 
relational symbol R such that Point(p1) R Point(p2), where R is one
of {<, <=, =, >=, >, ?}.  The strongest applicable relation is returned (e.g., 
if < holds it will be returned rather than <=)."
  (let ((m1-2 (get-mc p1 p2))
	(m2-1 (get-mc p2 p1)))
    (cond ((and (numberp m1-2) (< m1-2 CONST-LE0)) '<)
	  ((and (eql m1-2 CONST-LE0) (eql m2-1 CONST-LE0)) '=)
	  ((and (numberp m1-2) (= m1-2 CONST-LE0)) '<=)
	  ((and (numberp m2-1) (< m2-1 CONST-LE0)) '>)
	  ((and (numberp m2-1) (= m2-1 CONST-LE0)) '>=)
	  (t '?)))
  )

(defun point-diff-comparison (p1 p2 p3 p4)
  "Takes as input four point indexes (NOT point values!), and returns a 
relational symbol R such that Point(p1)-Point(p2) R Point(p3)-Point(p4), 
where R is one of {<, <=, =, >=, >, ?}.  The strongest applicable relation 
is returned (e.g., if < holds it will be returned rather than <=)."
  (let ((c1-2 (get-mc p1 p2))
	(c2-1 (get-mc p2 p1))
	(c3-4 (get-mc p3 p4))
	(c4-3 (get-mc p4 p3)))
    (let ((m1-2 (numeral-of c1-2))
	  (m2-1 (numeral-of c2-1))
	  (m3-4 (numeral-of c3-4))
	  (m4-3 (numeral-of c4-3))
	  (s1-2 (eq '< (inequality-of c1-2)))
	  (s2-1 (eq '< (inequality-of c2-1)))
	  (s3-4 (eq '< (inequality-of c3-4)))
	  (s4-3 (eq '< (inequality-of c4-3))))

      (cond ((and (numberp m1-2) (numberp m4-3) 
		  (or (< m1-2 (- m4-3))
		      (and (= m1-2 m4-3) s1-2 s4-3)))
	     '<)
	  
	    ((and (numberp m2-1) (numberp m3-4) 
		  (or (> (- m2-1) m3-4)
		      (and (= m2-1 m3-4) s2-1 s3-4)))
	     '>)

	    ((and (numberp m1-2) (numberp m4-3) (numberp m2-1) (numberp m3-4)
		  (= m1-2 (- m4-3) (- m2-1) m3-4)) 
	     '=)

	    ((and (numberp m1-2) (numberp m4-3) 
		  (<= m1-2 (- m4-3)))
	     '<=)

	    ((and (numberp m2-1) (numberp m3-4) 
		  (>= (- m2-1) m3-4)) 
	     '>=)
	    (t '?))
      )))



(defun extract-allen-from-metric ()
  "Extract all the allen relations from the metric network and assert them.  (Of course,
many will be redundant, but that's okay, add-allen-constraint will just
ignore the assertion.)"
  (let ( iR jR newa)
    (mumble 'metric-to-allen "extracting allen relns from metric")
    ;; Iterate over all pairs of intervals (without repeating any pairs
    ;; or pairing an interval with itself).
    (do ((iL 1 (+ iL 2))) ((> iL (- pi-max 2)))
      (setq iR (+ iL 1))
      (do ((jL 1 (+ jL 2))) ((>= jL iL))
	(setq jR (+ jL 1))
	(setq newa any)
	(setq newa (logand newa
			   (case (point-comparison iL jL)
			     (< (&& p m o fi di))
			     (= (&& s e si))
			     (<= (&& p m o fi di s e si))
			     (> (&& pi mi oi f d))
			     (>= (&& pi mi oi f d s e si))
			     (? newa))))
	(setq newa (logand newa
			   (case (point-comparison iR jR)
			     (< (&& p m o s d))
			     (= (&& f e fi))
			     (<= (&& p m o s d f e fi))
			     (> (&& pi mi oi si di))
			     (>= (&& pi mi oi si di f e fi))
			     (? newa))))
	(setq newa (logand newa
			   (case (point-comparison iL jR)
			     (< (&& p m o e s f d oi si di fi))
			     (= (&& mi))
			     (<= (&& p m o e s f d oi si di fi mi))
			     (> (&& pi))
			     (>= (&& pi mi))
			     (? newa))))
	(setq newa (logand newa
			   (case (point-comparison iR jL)
			     (< (&& p))
			     (= (&& m))
			     (<= (&& p m))
			     (> (&& pi mi oi e si fi di o s d f))
			     (>= (&& pi mi oi e si fi di o s d f m))
			     (? newa))))
	(setq newa (logand newa
			   (case (point-diff-comparison iR iL jR jL)
				 (< (&& p m o s d f oi mi pi))
				 (= (&& p m o e oi mi pi))
				 (<= (&& p m o s d f e oi mi pi))
				 (> (&& p m o si di fi oi mi pi))
				 (>= (&& p m o si di fi e oi mi pi))
				 (? newa))))
	(add-allen-constraint (point-of iL) (point-of jL) newa)
	)
      )
    ))



(defun add-metric-based-on-allen (i1 i2 newvalue)
  "Assert a metric constraint based on the given allen constraint."
  (let ((l1 (left i1)) (l2 (left i2)) (r1 (right i1)) (r2 (right i2)))
    (mumble 'allen-to-metric "extracting metric relns from allen reln")

    (if (= newvalue (logand newvalue (&& p m o fi di)))
	(add-metric-constraint l1 l2 0 t)
      (if (= newvalue (logand newvalue (&& p m o fi di s si =)))
	  (add-metric-constraint l1 l2 0 nil)))
    
    (if (= newvalue (logand newvalue (&& p m o = s f d oi si di fi)))
	(add-metric-constraint l1 r2 0 t)
      (if (= newvalue (logand newvalue (&& p m o = s f d oi si di fi mi)))
	  (add-metric-constraint l1 r2 0 nil)))

    (if (= newvalue (logand newvalue (&& p )))
	(add-metric-constraint r1 l2 0 t)
      (if (= newvalue (logand newvalue (&& p m)))
	  (add-metric-constraint r1 l2 0 nil)))

    (if (= newvalue (logand newvalue (&& p m o s d )))
	(add-metric-constraint r1 r2 0 t)
      (if (= newvalue (logand newvalue (&& p m o s d = f fi)))
	  (add-metric-constraint r1 r2 0 nil)))

    (if (= newvalue (logand newvalue (&& pi mi oi f d)))
      (add-metric-constraint l2 l1 0 t)
      (if (= newvalue (logand newvalue (&& pi mi oi f d si s =)))
	  (add-metric-constraint l2 l1 0 nil)))

    (if (= newvalue (logand newvalue (&& pi mi oi = si fi di o s d f)))
	(add-metric-constraint l2 r1 0 t)
      (if (= newvalue (logand newvalue (&& pi mi oi = si fi di o s d f m)))
	  (add-metric-constraint l2 r1 0 nil)))

    (if (= newvalue (logand newvalue (&& pi)))
	  (add-metric-constraint r2 l1 0 t)
      (if (= newvalue (logand newvalue (&& pi mi)))
	  (add-metric-constraint r2 l1 0 nil)))

    (if (= newvalue (logand newvalue (&& pi mi oi si di)))
      (add-metric-constraint r2 r1 0 t)
      (if (= newvalue (logand newvalue (&& pi mi oi si di = fi f)))
	  (add-metric-constraint r2 r1 0 nil)))
    ))



;;*********************************************************
;;* Functions used by and linking Allen and Metric nets
;;*********************************************************

(defmacro mhow (&rest args)
  "Either one or two argument sequences, each of which can either be
an interval, or a point form sequence.  E.g.:  (mhow left A right B).
When a single interval is given, print it's duration and position."
  `(metric-how ',args))

(defun metric-how (args)
  (let (a1 a2 int)
    ;; Put point args into functional form if necessary
    (when args
      (if (member (car args) '(left right))
	  (progn
	    (unless (cadr args) (error "Bad argument ~s" args))
	    (setq a1 (list (car args) (cadr args)))
	    (setq args (cddr args)))
	(progn
	  (setq a1 (car args))
	  (setq args (cdr args)))))
    (when args
      (if (member (car args) '(left right))
	  (progn
	    (unless (cadr args) (error "Bad argument ~s" args))
	    (setq a2 (list (car args) (cadr args)))
	    (setq args (cddr args)))
	(progn
	  (setq a2 (car args))
	  (setq args (cdr args)))))
    (when args (error "Bad argument ~s" args))
    (cond ((and (null a1) (null a2))	; no argument: print metric table
	   (let (e)
	     ;; print index key
	     (format t "~% Interval     left      right~%")
	     (do* ((ints DEFINED-INTERVALS (cdr ints))
		   (i 1 (+ 2 i)))
		 ((null ints))
	       (setq int (car ints))
	       (format t "~10A  ~5D    ~5D~%" int i (+ 1 i)))
	     ;; print metric array in a pretty format
	     (format t "~%Point(row) - Point(column) <= Table(row,column)~%~%")
	     (format t "An < before an entry means relation is strictly <~%~%")
	     (format t "       |")
	     (dotimes (i pi-max)
	       (format t "~5d|" i))
	     (format t "~%~%")
	     (dotimes (i pi-max)
	       (format t "|~3d|  " i)
	       (dotimes (j pi-max)
		 (setq e (aref metric-array i j))
		 (if (numberp e)
		     (format t "~6@a"
			     (format nil "~a~d" 
				     (if (eql `< (inequality-of e)) "<" "")
				     (numeral-of e)))
		   (format t "     ?")))
	       (format t "~%"))
	     ))

	  ((and a1 (not a2) (listp a1))	; single point: print position
	   (let* ((p1 (make-point a1))
		  (clow (get-mc POINT0 p1))
		  (chigh (get-mc p1 POINT0)))
	     (format t "~5D ~2a  ~10@A ~10A  ~2a ~5D~%"
		(neg-maybe-unknown (numeral-of clow))
		(inequality-of clow)
		(car a1) (cadr a1)
		(inequality-of chigh)
		(numeral-of chigh))))
	   
	  ((and a1 (not a2))		; single interval: print duration and position
	   (let* ((pL (left a1))
		  (pR (right a1))
		  (clow (get-mc pL pR))
		  (chigh (get-mc pR pL)))
	   (format t "~5D ~2a    duration ~10A  ~2a ~5D~%"
		   (neg-maybe-unknown (numeral-of clow))
		   (inequality-of clow)
		   a1
		   (inequality-of chigh)
		   (numeral-of chigh)))
	   (metric-how (list 'left a1))
	   (metric-how (list 'right a1)))
	  
	  ((and (listp a1) (listp a2))	; pair of points: print differences
	   (let* ((p1 (make-point a1))
		  (p2 (make-point a2))
		  (clow (get-mc p2 p1))
		  (chigh (get-mc p1 p2)))
	   (format t "~5D ~2a ~10@A - ~10A ~2a ~5D~%"
		   (neg-maybe-unknown (numeral-of clow))
		   (inequality-of clow)
		   a1 a2
		   (inequality-of chigh)
		   (numeral-of chigh))))

	  ((and a1 a2 (atom a1) (atom a2)) ; pair of intervals: print differences
	   (metric-how (list 'left a1 'left a2))
	   (metric-how (list 'left a1 'right a2))
	   (metric-how (list 'right a1 'left a2))
	   (metric-how (list 'right a1 'right a2)))

	  (t (error "Bad argument ~s ~s ~s" a1 a2 args)))
    )
  (values))
	  

;; It would be nice to replace the following with a real parser, so
;; forms such as (assertm left a > right b + 3) are all acceptable.

(defmacro assertm (&rest args)
  "Assert a metric constraint of one of the following forms:
n <= left foo <= m
n <= duration foo <= m
n <= left foo - right bar <= m
where either of the left or right inequalities are optional, and
may be strict inequality < instead"
  `(metric-assert ',args))

(defun metric-assert (args)
  (let (n m a1 a2 strict1 strict2)
    ;; Parse the arguments
    ;; Parse the first inequality
    (when (numberp (car args))
      (setq n (car args))
      (setq args (cdr args))
      (cond ((eql (car args) '<) (setq strict1 t))
	    ((eql (car args) '<=))
	    (t (error "Bad argument ~s" args)))
      (setq args (cdr args)))
    ;; Parse the point expression
    (when (eql 'duration (car args))
      (setq args `(right ,(cadr args) - left ,(cadr args) ,@(cddr args))))
    (unless (member (car args) '(left right))
      (error "Bad argument ~s" args))
    (setq a1 (list (car args) (cadr args)))
    (setq args (cddr args))
    (when (eql (car args) '-)
      (setq args (cdr args))
      (unless (member (car args) '(left right))
	(error "Bad argument ~s" args))
      (setq a2 (list (car args) (cadr args)))
      (setq args (cddr args)))
    ;; Parse the second inequality
    (when args
      (cond ((eql (car args) '<) (setq strict2 t))
	    ((eql (car args) '<=))
	    (t (error "Bad argument ~s" args)))
      (setq args (cdr args))
      (unless (numberp (car args))
	(error "Bad argument ~s" args))
      (setq m (car args))
      (setq args (cdr args)))
    (unless (null args)
      (error "Bad argument ~s" args))
    (unless (or n m)
      (error "Bad argument ~s" args))
    ;; Normalize the parameters
    (setq a1 (make-point-maybe-new a1))
    (if (null a2)
	(setq a2 POINT0)
      (setq a2 (make-point-maybe-new a2)))
    (when m
      (add-metric-constraint a1 a2 m strict2))
    (when n
      (add-metric-constraint a2 a1 (neg-maybe-unknown n) strict1))
    )
  (values)
  )
