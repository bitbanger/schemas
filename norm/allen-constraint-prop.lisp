;	Copyright AT&T 1991

;;; Allen Interval Reasoning System
;;; Original version written by Henry Kautz in 1982 or 1983
;;; Converted to Common Lisp 9/15/90
;;; Rewritten 9/26/90:  greatly simplified and cleaned up code.
;;; Eliminated code for reference classes.  Straightened out
;;; the main propagation iterative loop.

;;; DEPENDS ON:  
;;; bitcode  (compile, load, eval)
;;; fast-multiply  (load, eval)

(eval-when (eval compile load)
  (proclaim '(special extended-sym-to-bit noisy noisy-values))
  (proclaim '(special DEFINED-INTERVALS allenQ amode mmode
	      brief))
  )

;;*********************************************************
;;* Storing constraints
;;*********************************************************


(defparameter DEFINED-INTERVALS nil)

(defun create-queue ()
  "Return a new empty queue"
  (cons nil nil))

(defun enqueue (item queue)
  "Add ITEM to QUEUE"
  (cond ((and (null (car queue)) (null (cdr queue)))
	 (let ((e (cons item nil)))
	   (setf (car queue) e)
	   (setf (cdr queue) e)))
	((or (null (car queue)) (null (cdr queue)))
	 (error "Bad queue ~s" queue))
	(t (let ((e (cons item nil)))
	     (setf (cdr (cdr queue)) e)
	     (setf (cdr queue) e)))))

(defun emptyq? (queue)
  "Test if QUEUE is empty"
  (null (car queue)))

(defun dequeue (queue)
  "Return and remove first element of QUEUE"
  (if (null (car queue))
      (error "empty queue ~x" queue)
    (let ((e (car (car queue))))
      (setf (car queue) (cdr (car queue)))
      (if (null (car queue))
	  (setf (cdr queue) nil))
      e)))

(defparameter allenQ (create-queue))

(defun makel (obj)
  "If OBJ is a list, return it, otherwise make it into one"
  (if (listp obj)
      obj
    (list obj)))

(defun makea (obj)
  "If OBJ is a list containing a single element, return that
element; otherwise, return OBJ"
  (if (and (listp obj) (= 1 (length obj)))
      (car obj)
    obj))


(defun add-to-assoc (ind val list)
  "Return a new list setting the IND property for VAL in association LIST,
possibly modify the old list"
  (let ((old (assoc ind list)))
    (if old
	(progn
	  (setf (cdr old) val)
	  list)
      (cons (cons ind val) list))))



(defun set-allen-relation (t1 t2 val)
  (if (eql t1 t2)
      (when (not (eql (&& e) val))
	(error "Cannot set ~s ~s to itself!" t1 val))
    (setf (get t1 'allen-rels)
      (add-to-assoc t2 val (get t1 'allen-rels)))))


(defun get-allen-rels (t1)
    (get t1 'allen-rels))


(defun get-allen-relation (t1 t2)
  (if (eql t1 t2)
      (&& e)
    (or (cdr (assoc t2 (get-allen-rels t1)))
	any)))


(defun maybe-new-interval (t1)
  (when (not (member t1 DEFINED-INTERVALS))
      (mumble 'new-interval "new interval ~s" t1)
      (setq DEFINED-INTERVALS (nconc DEFINED-INTERVALS
				     (list t1)))
      (when mmode (new-metric-interval t1))))

(defun clear-allen-net nil
  ;; Wipes out entire interval net
  (setq allenQ (create-queue))
  (dolist (int DEFINED-INTERVALS)
    (remprop int 'allen-rels)))


;;*********************************************************
;;*  I/O
;;*********************************************************

(defun tsave (filename)
  (let (OUTFILE)
    (setq OUTFILE (open filename :direction :output :if-exists :rename))
    (format OUTFILE "(setq DEFINED-INTERVALS '~s)~%" DEFINED-INTERVALS)
    (when amode (print-allen-timeinfo OUTFILE))
    (when mmode (print-metric-timeinfo OUTFILE))
    (close OUTFILE)))

(defun print-allen-timeinfo (file)
  "print defs of time intervals to FILE"
  (mapcar #'(lambda (atom)
	      (format file
		      "(setf (get '~s 'allen-rels) '~s)~%" atom 
		      (get atom 'allen-rels)))
	  DEFINED-INTERVALS)
  (format file "~%(setq allenQ (create-queue))~%")
  (let (unprocessed)
    (do () ((emptyq? allenQ))
      (push (dequeue allenQ) unprocessed))
    (setq unprocessed (reverse unprocessed))
    (format file "(mapc #'(lambda (e) (enqueue e allenQ)) '~s)~%" unprocessed))
  )


;;*********************************************************
;;*  Propagation
;;*********************************************************


(defun add-allen-constraint-maybe-new (t1 t2 invalue)
  "add constraint between t1 and t2, which may be new intervals"
  (maybe-new-interval t1)
  (maybe-new-interval t2)
  (add-allen-constraint t1 t2 invalue))


(defun add-allen-constraint (t1 t2 invalue)
  "intersects new constraint with old constraint (if one exists)"
    (unless (eql invalue any)
      (let (oldvalue newvalue)
	(setq oldvalue (get-allen-relation t1 t2))
	(setq newvalue (logand oldvalue invalue))
	(cond ((eql newvalue empty)
	       (error "Error: ~s ~s ~s contradicts ~s" 
		      t1 (bitdecode oldvalue) t2 (bitdecode invalue)))
	      ((not (eql oldvalue newvalue))
	       (if (= 1 (logcount newvalue))
		   (mumble 'allen-determine "determing ~s ~s ~s" t1 (bitdecode newvalue) t2)
		 (mumble 'allen-add "adding ~s ~s ~s" t1 (bitdecode newvalue) t2))
	       (set-allen-relation t1 t2 newvalue)
	       (set-allen-relation t2 t1 (inverse newvalue))
	       ;; Possibly create a new metric constraint at this point
	       (when mmode
		     (add-metric-based-on-allen t1 t2 newvalue))
	       (enqueue (list t1 t2 newvalue) allenQ))))))


(defun allen-not-reduced-p ()
  (not (emptyq? allenQ)))

(defun reduce-allen-network ()
  (let (constraint i1 i2 r current-r)
    (do () ((emptyq? allenQ))
      (setq constraint (dequeue allenQ))
      (setq i1 (car constraint))
      (setq i2 (cadr constraint))
      (setq r (caddr constraint))
      (setq current-r (get-allen-relation i1 i2))
      (when (eql current-r r)
	(mumble 'allen-popping "popping ~s ~s ~s" i1 (bitdecode r) i2)
	(constrain-one-way i1 i2 r)
	(constrain-one-way i2 i1 (inverse r))))))

(defun constrain-one-way (i1 i2 val)
  "Calculate transitivity relations through i2"
  (let ((all-rels (get-allen-rels i2)))
    (dolist (rel all-rels)
      (unless (eql (car rel) i1)
	(add-allen-constraint i1 (car rel)
			    (allen-multiply val (cdr rel)))))))



;;*********************************************************
;;* Functions used by and linking Allen and Metric nets
;;*********************************************************

(defparameter amode t "True if Allen network is used")
(defparameter mmode t "True if Metric network is used")

(defparameter brief t "True to print out information in brief format")

(defmacro ahow (&optional this that)
  `(allen-how ',this ',that))

(defun allen-how (this that)
  (cond ((and this that)
	 (format t "~%~10@a   ~a   ~a~%" this (bitdecode (get-allen-relation this that)) that))
	(this
	 (format t "~%~a~20T" this)
	 (dolist (i DEFINED-INTERVALS)
	   (unless (and brief (or (eql (get-allen-relation this i) any)
				  (eql this i)))
	     (format t "~a~40T~a~%~20T" (bitdecode (get-allen-relation this i)) i))))
	(t
	 (dolist (j DEFINED-INTERVALS)
	   (format t "~%")
	   (allen-how j nil))))
  (values))


(defun allen-fhow (this that)
(block outer
  (cond ((and this that)
	 ; (format t "~%~10@a   ~a   ~a~%" this (bitdecode (get-allen-relation this that)) that)
		(return-from outer (list this (bitdecode (get-allen-relation this that)) that))
		)
	(this
	 (format t "~%~a~20T" this)
	 (dolist (i DEFINED-INTERVALS)
	   (unless (and brief (or (eql (get-allen-relation this i) any)
				  (eql this i)))
	     (format t "~a~40T~a~%~20T" (bitdecode (get-allen-relation this i)) i))))
	(t
	 (dolist (j DEFINED-INTERVALS)
	   (format t "~%")
	   (allen-how j nil))))
  (values))
)


(defmacro asserta (left rel right)
  `(allen-assert ',left ',rel ',right))

(defun allen-assert (left rel right)
  (add-allen-constraint-maybe-new left right (bitcode rel))
  (values))

(defun allen-reduce ()
  (do () ((not (or (and amode (allen-not-reduced-p))
		   (and mmode (metric-not-reduced-p)))))
      (when (and amode (allen-not-reduced-p))
	      ; (format t "~%Reducing Allen network~%")
	      (reduce-allen-network))
      (when (and mmode (metric-not-reduced-p))
	      ; (format t "~%Reducing metric network~%")
	      (reduce-metric-network))
      ))


(defun clear ()
  "Reset all constraints to ANY, and delete all intervals"
  (when amode
	(clear-allen-net))
  (when mmode
	(clear-metric-net))
  (setq DEFINED-INTERVALS nil)
  )

(defmacro intervals (&rest intervals)
  "Declare the existence of the INTERVALS.  This is an optional operation;
it may make metric operations faster"
  `(mapc #'maybe-new-interval ',intervals))
