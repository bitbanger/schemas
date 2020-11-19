;	Copyright AT&T 1991

;;*********************************************************
;;*  Bit String Manipulation
;;*********************************************************

;; The macros and supporting functions and symbols are needed
;; at compile as well as run time.
;; Compiling this file causes it to be loaded as well.
(eval-when (eval compile load)

(proclaim '(special extended-sym-to-bit noisy noisy-values))

(defconstant sym-to-bit `((= . 1)(d . 2)(di . 4)(s . 8)(si . 16)
			   (f . 32)(fi . 64)(p . 128)(pi . 256)
			   (m . 512)(mi . 1024)(o . 2048)(oi . 4096)))

(defparameter extended-sym-to-bit sym-to-bit)
  ;; Must define this twice to avoid problem with recursive definition of && 

;; Meanings:
;;	=	equals 
;;	d	during (proper)
;;	di	contains (proper)
;;	s	starts
;;	si	started-by
;;	f	finishes
;;	fi	finished-by
;;	p	precedes (before)
;;	pi	preceded by (after)
;;	m	meets
;;	mi	met-by
;;	o	overlaps
;;	oi	overlapped-by

;; Extended symbols
;;	any		e d c s si f fi b a m mi o oi
;;	during		d s f
;;	contains 	c si fi
;;	disjoint	b m mi a
;;	b		p
;;	a		pi
;;	c		di
;;	e		=
;;	<		p
;;	>		pi
;;
;; Note: the symbols p, pi, and di are used by Ladkin;
;; the symbols b, a, c were used by Allen.

(defun bitcode (x)
    "Convert symbolic constraint X to binary code"
    (cond ((null x) 0)
	  ((atom x) (cdr (assoc x extended-sym-to-bit)))
	  ((or (eq '~ (car x)) (eq 'not (car x)))
	   (negate (bitcode (cdr x))))
	  (t (logior (bitcode (car x)) (bitcode (cdr x))))))
  
(defmacro && (&rest params)
  ;; Same as bitcode, but is a macro rather than a function,
  ;; with no run-time overhead.  Use: (&& e ce o)
  (bitcode params))

(setq extended-sym-to-bit
  ;; Defines additional (derived) relationships for convenience in input.
  (append 
   `((any . ,(&& = d di s si f fi p pi m mi o oi))
     (during . ,(&& d s f))
     (contains . ,(&& di si fi))
     (disjoint . ,(&& p m mi pi))
     )
   sym-to-bit
   `((b . ,(&& p))
     (a . ,(&& pi))
     (c . ,(&& di))
     (e . ,(&& =))
     (< . ,(&& p))
     (> . ,(&& pi)))))

;; The variables "any" and "empty" are used as constants to represent the
;; set of all relationships and of none respectively.  Therefore, NO function
;; should use "any" or "empty" as the names of local variables!

(defconstant any (&& any))
(defconstant empty (&&))

(defconstant legal-symbolic-constraints (mapcar 'car extended-sym-to-bit))

(defun bitdecode (x)
  "Return the symbolic form of bit encoded constraint X"
  (or (car (find x extended-sym-to-bit :key #'cdr))
      (bitdecode1 x)))

(defun bitdecode1 (x)
  "Like bitdecode, but leaves the result in list form
and doesn't use special abbreviations."
  (bdc x  sym-to-bit))

(defun bdc (bitval searchlist)
  (cond ((null searchlist) nil)
	((logtest bitval (cdar searchlist))
	 (cons (caar searchlist) (bdc bitval (cdr searchlist))))
	(t (bdc bitval (cdr searchlist)))))


;; Following are used by the inverse function below.
(defparameter  allinvs (&& c si fi mi oi a))
(defparameter  allnoninvs (&& d s f m o b))

(defun inverse  (x)
  "Return the bit value of the inverse of bit constraint X"
  (logior
   (logior
    (logand (ash x 1) allinvs)
    (logand (ash x -1) allnoninvs))
   (logand x (&& e))))

(defun negate (x)
  "Return the bit value of the negation of bit constraint x"
  (logand any (lognot x)))

;;*********************************************************
;;*  Tracing macros
;;*********************************************************

(defparameter noisy nil "If true, trace execution; may also be a list of mumble values")
(defparameter noisy-values nil 
  "List of all possible mumble values; updated by executing with NOISY = t")

(defparameter mumble-count 0)

(defmacro mumble (priority &rest args)
  "Use to trace execution:  (mumble priority format-string {arg1} ...)
The PRIORITY is a symbol, and FORMAT-STRING a string.  Print the formatted
argument if and only if one of the following conditions holds:
 1.  NOISY = t
 2.  NOISY = PRIORITY
 3.  NOISY is a list such that (member PRIORITY NOISY)
The arguments are evaluated ONLY if they are printed."
  `(when (and noisy
	      (or (eq noisy t)
		  (eq noisy ,priority)
		  (and (listp noisy)
		       (member ,priority noisy))))
     (unless (member ,priority noisy-values)
       (setq noisy-values (cons ,priority noisy-values)))
     (mumble1 ,@args)))
       

(defun mumble1 (&rest args)
  (format t " ... ")
  (apply #'format t args)
  (format t " ... ")
  (incf mumble-count)
  (when (> mumble-count 2) 
    (format t "~%")
    (setq mumble-count 0)))

) ;; End of eval-when
