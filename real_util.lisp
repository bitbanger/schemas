(defparameter *DBG-TAGS* (list
	; put debug tags you want here
	;'matched-wffs
	;'match-wff
	;'process-story
	;'match-inst
	;'unify-wffs
	;'cur1
))

(defparameter *DBG-ALL* nil)

(defparameter *CANONICAL-HT*
	(make-hash-table :test #'equal)
)

(defun varp (v)
	(cond
		((not (symbolp v)) nil)
		((not (> (length (string v)) 1)) nil)
		((not (equal "?" (subseq (string v) 0 1))) nil)
		(t t)
	)
)

(defun neg-pred (pred)
	(lambda (x) (not (funcall pred x)))
)

(defun list-of-pred (lst pred)
	(cond
		((not (listp lst)) nil)

		(t (loop for e in lst
			always (funcall pred e)))
	)
)

(defun get-elements-pred (lst pred)
	(cond
		((funcall pred lst) lst)

		((not (listp lst)) nil)

		(t (loop for e in lst
			do (setf tmp3 (get-elements-pred e pred))
			if (and (not (null tmp3)) (not (list-of-pred tmp3 pred)))
				do (setf tmp3 (list tmp3))
			append tmp3
		))
	)
)

(defun replace-vals (old new lst)
	(cond
		((not (listp lst))
			(if (equal lst old) new lst))

		(t
			(loop for e in lst
				collect (replace-vals old new e)
			)
		)
	)
)

; DFS for an element matching a predicate in
; a(n assumed-to-be-acyclic) list structure.
(defun has-element-pred (lst pred)
	(cond
		((not (listp lst))
			(funcall pred lst))

		(t (loop for e in lst thereis (has-element-pred e pred)))
	)
)

(defun has-element (lst elem)
	(has-element-pred lst (lambda (x) (equal x elem)))
)

(defun has-all-elements-pred (lst pred)
	(not (has-element-pred lst (neg-pred pred)))
)

(defun has-no-elements-pred (lst pred)
	(not (has-element-pred lst pred))
)

(defun has-prefix? (s pre)
(and
	(stringp s)
	(>= (length s) (length pre))
	(equal pre (subseq s 0 (length pre)))
)
)

(defun has-suffix? (s suf)
(and
	(stringp s)
	(>= (length s) (length suf))
	(equal suf (subseq s
				(- (length s) (length suf))
				(length s)))
)
)

(defun remove-prefix (s pre)
(if (has-prefix? s pre)
	;then
	(subseq s (length pre) (length s))
	; else
	s
)
)

(defun remove-suffix (s suf)
(if (has-suffix? s suf)
	;then
	(subseq s 0 (- (length s) (length suf)))
	; else
	s
)
)

(defun is-letter? (c)
	(or
		(and
			(>= (char-code c) (char-code #\a))
			(<= (char-code c) (char-code #\z))
		)
		(and
			(>= (char-code c) (char-code #\A))
			(<= (char-code c) (char-code #\Z))
		)
	)
)

(defun is-digit? (c)
	(and
		(>= (char-code c) (char-code #\0))
		(<= (char-code c) (char-code #\9))
	)
)

(defun is-num-str? (s)
	(and
		(stringp s)
		(loop for c across s always (is-digit? c))
	)
)

(defun alphanum-str? (s)
	(and
		(stringp s)
		(loop for c across s always (alphanumericp c))
	)
)

(defun next-str (s)
(block outer
	(if (not (equal s (string-upcase s)))
		(return-from outer (next-str (string-upcase s)))
	)

	(if (equal "Z" (subseq s (- (length s) 1) (length s)))
		(return-from outer (concat-strs s "A"))
	)

	(return-from outer (concat-strs
		(subseq s 0 (- (length s) 1))
		(string (code-char (+ 1 (char-code (char s (- (length s) 1))))))
	))
)
)

(defun rechash (data)
(cond
	((not (listp data))
		(sxhash data))

	(t (sxhash (loop for e in data
		if (listp e) collect (rechash e)
		else collect e)))
)
)

(defun unordered-rechash (data)
(cond
	((not (listp data))
		(sxhash data))

	(t (sxhash (sort (loop for e in data
		if (listp e) collect (unordered-rechash e)
		else collect (sxhash e)) #'<)))
)
)

(defun ht-copy (ht)
(block outer
	(if (not (hashtablep ht))
		nil
	)

	(setf new-ht (make-hash-table :test #'equal))

	(loop for key being the hash-keys of ht
		do (setf (gethash key new-ht) (gethash key ht))
	)

	(return-from outer new-ht)
)
)

(defun ht-eq-oneway (ht1 ht2)
	(loop for key being the hash-keys of ht1
		always (equal (gethash key ht1) (gethash key ht2))
	)
)

(defun dbg (tag fmt-str &rest args)
	(if (or *DBG-ALL* (member tag *DBG-TAGS*))
		(apply #'format (append (list t fmt-str) args))
	)
)

(defun ht-eq (ht1 ht2)
(cond

	((and (hashtablep ht1) (not (hashtablep ht2)))
		nil)
	((and (hashtablep ht2) (not (hashtablep ht1)))
		nil)

	((and (not (hashtablep ht1)) (not (hashtablep ht2)))
		(equal ht1 ht2)
	)

	((and
		(ht-eq-oneway ht1 ht2)
		(ht-eq-oneway ht2 ht1)
	) t)

	(t nil)
)
)

(defun xor (p q)
	(or
		(and p (not q))
		(and q (not p))
	)
)

(defun mk-hashtable (pairs)
(cond
	((equal pairs t) t)

	((null pairs) nil)

	(t (progn
		(setf want-bind (make-hash-table :test #'equal))
		(loop for pair in pairs
			do (setf (gethash (car pair) want-bind) (second pair))
		)
		want-bind
	))
)
)

(defun same-list-unordered (l1 l2)
	(and
		(listp l1)
		(listp l2)
		(equal (length l1) (length l2))
		(loop for e in l1
			always (member e l2 :test #'equal)
		)
	)
)

(defun verbp (x)
	(and
		(symbolp x)
		(equal
			".V"
			(subseq
				(string x)
				(- (length (string x)) 2)
				(length (string x))
			)
		)
	)
)

(defun hashtablep (o)
	(equal
		(type-of o)
		(type-of *CANONICAL-HT*)
	)
)

(defun print-ht (ht)
	(format t "~s" (ht-to-str ht))
)

(defun explain-nil (str &rest args)
	(progn
		(apply #'format (append (list t str) args))
		nil
	)
)

; replace-all taken from https://lispcookbook.github.io/cl-cookbook/strings.html
(defun replace-all (str part replacement &key (test #'equal))
"Returns a new string in which all the occurences of the part
is replaced with replacement."
    (with-output-to-string (out)
      (loop with part-length = (length part)
            for old-pos = 0 then (+ pos part-length)
            for pos = (search part str
                              :start2 old-pos
                              :test test)
            do (write-string str out
                             :start old-pos
                             :end (or pos (length str)))
            when pos do (write-string replacement out)
            while pos)))

(defun concat-two-strs (str1 str2)
	(format nil "~d~d" str1 str2)
)

(defun concat-strs (&rest strs)
(cond
	((null strs) nil)
	((equal 1 (length strs)) (car strs))
	(t (concat-two-strs
			(car strs)
			(apply #'concat-strs (cdr strs))))
)
)

(defparameter *B64-STR* "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/")

(defun b10tob64 (num)
(let (b8str b64lst val) (block outer
	(setf b8str (write-to-string num :base 8))
	(setf b64lst (list))
	(loop for i from 0 to (- (length b8str) 2)
			if (equal 0 (mod i 2)) do (block inner
				(setf val (- (* (+ 1 (parse-integer (subseq b8str i (+ i 1))))
								(+ 1 (parse-integer (subseq b8str (+ i 1) (+ i 2))))) 1))
				(setf b64lst (append b64lst (list (subseq *B64-STR* val (+ val 1)))))
			)
	)
	(return-from outer (apply #'concat-strs b64lst))
))
)

(defun join-str-list (sep strs)
(cond
	((null strs) "")

	((equal (length strs) 1)
		(car strs))

	(t (concat-strs
		(car strs)
		sep
		(join-str-list sep (cdr strs))))
)
)

(defun split-str (str sep)
(cond
	((null (search sep str))
		(list str))

	(t (append
		(list (subseq str 0 (search sep str)))
		(split-str (subseq str (+ 1 (search sep str)) (length str)) sep)
	))
)
)

(defun repeat-str (str n)
	(format nil "~v@{~A~:*~}" n str)
)

(defparameter *NEWLINE* (string #\Newline))
(defparameter *TAB* (string #\Tab))

(defun tab-all-lines (n str)
	(concat-two-strs *TAB*
		(replace-all str
			*NEWLINE*
			(concat-two-strs
				*NEWLINE*
				(repeat-str *TAB* n))))
)

(defun ht-to-str (ht)
(join-str-list *NEWLINE*
		(cond
			((not (hashtablep ht)) (list (format nil "value ~s" ht)))

			(t (loop for key being the hash-keys of ht
				; do (format t "GOT ~s~%" (gethash key ht))
				collect (format nil "~d: ~d" key (gethash key ht))
			))
		)
)
)

(defun print-ht (ht)
(cond
	((not (hashtablep ht)) (format t "	value ~s~%" ht))

	(t (loop for key being the hash-keys of ht
		do (format t "	~s: ~s~%" key (gethash key ht))
	))
)
)
