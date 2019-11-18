(load "ttt/src/load")
(load "process-sentence1.lisp") ; for hide-ttt-ops and unhide-ttt-ops

(defparameter *DBG-TAGS* (list
	; put debug tags you want here
	;'matched-wffs
	;'match-wff
	;'process-story
	;'match-inst
	;'unify-wffs
	;'cur1
	;'unify
	;'coref
	;'match
	;'time
	;'shuffle-match
))

(defparameter *DBG-ALL* nil)

(defparameter *CANONICAL-HT*
	(make-hash-table :test #'equal)
)

(defparameter *EMPTY-HT*
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
			always (and (listp e) (equal 2 (length e)) (funcall pred (car e)))))
	)
)

(defun max-idx (lst)
(cond
	((and (equal 2 (length lst)) (integerp (second lst)))
		(second lst))
			
	(t (apply #'max (mapcar #'second lst)))
)
)

(defun get-elements-pred-helper (lst pred)
(block outer
	; (format t "~s is index pair? ~s~%" lst (index-pair? lst))

	(if (not (index-pair? lst))
		(return-from outer nil))

	(setf cur-elem (clean-idcs (car lst)))

	; (format t "cur elem is: ~s~%" lst)

	(if (funcall pred cur-elem)
		(return-from outer (list (clean-idcs (car lst)) (second lst))))

	(if (not (listp cur-elem))
		(return-from outer nil))

	;(format t "list is: ~s~%" cur-elem)

	(loop for e in (car lst)
		do (setf cur-elem (clean-idcs (car e)))
		do (setf tmp-res (get-elements-pred-helper e pred))
		if (and (index-pair? tmp-res) (not (null (car tmp-res))))
			do (setf tmp-res (list tmp-res))
		if (not (null (car tmp-res)))
			append tmp-res
	)
)
)

(defun idx-ancestors (lst idx)
(block outer
	(setf ancestors (list))

	(setf idxified (el-idcs lst))
	(setf cursor idxified)
	(loop while (not (equal (second cursor) idx))
		do (block loop-outer
			(setf ancestors (append (list (list (get-element-idx lst (second cursor)) (second cursor))) ancestors))

			(setf best '(nil -1))
			(loop for e2 in (car cursor)
				do (if (and (<= (second e2) idx) (> (second e2) (second best)))
					; then
					(setf best e2)
				)
			)
			(setf cursor best)
		)
	)

	(return-from outer ancestors)
)
)

(defun get-elements-pred-pairs (lst pred)
	(get-elements-pred-helper (el-idcs lst) pred)
)

(defun get-elements-pred-idx (lst pred)
	(mapcar #'second (get-elements-pred-helper (el-idcs lst) pred))
)

(defun get-elements-pred (lst pred)
	(mapcar #'car (get-elements-pred-helper (el-idcs lst) pred))
)

(defun index-pair? (x)
	(and
		(listp x)
		(equal 2 (length x))
		(integerp (second x))
	)
)

(defun clean-idcs (lst)
	(cond
		((not (listp lst)) lst)

		((index-pair? lst)
			(clean-idcs (car lst)))

		(t (loop for e in lst
			collect (clean-idcs e)
		))
	)
)

(defun get-element-idx-helper (lst target)
	(block outer
		;(format t "lst is ~s~%" lst)
		;(format t "target is ~s~%" target)
		(if (equal (second lst) target)
			(return-from outer lst))

		(if (and (listp lst) (listp (car lst)))
			(loop for e in (car lst)
				;do (format t "e is ~s~%" e)
				do (setf tmp5 (get-element-idx-helper e target))
				if (not (null tmp5))
					do (return-from outer tmp5)
			))

		(return-from outer nil)
	)
)

(defun get-element-idx (lst target)
(progn
	;(format t "el-idcs is ~s~%" (el-idcs lst))
	;(format t "target is ~s~%" target)
	(clean-idcs (get-element-idx-helper (el-idcs lst) target))
)
)

(defun replace-element-idx-helper (lst target new-val)
(block outer
	(if (not (index-pair? lst))
		(return-from outer nil))

	; NOTE: the dummy -1 in our return value here doesn't actually
	; matter, since we're stripping the indices before we return.
	; In fact, it may even be incorrect, if new-val is a composite
	; list. But again, it doesn't matter either way.
	(if (equal target (second lst))
		(return-from outer (list new-val -1)))

	(if (not (listp (clean-idcs (car lst))))
		(return-from outer lst))

	(return-from outer (list (loop for e in (car lst)
		collect (replace-element-idx-helper e target new-val)
	) (second lst)))
)
)

(defun replace-element-idx (lst target new-val)
	(clean-idcs (replace-element-idx-helper (el-idcs lst) target new-val))
)

(defun el-idcs-helper (lst counter)
(let ((my-counter (eval counter)))
	(cond
		((not (listp lst))
			(list lst my-counter))

		(t (list (loop for e in lst
			do (set counter (+ 1 (eval counter)))
			collect (el-idcs-helper e counter)
		) my-counter))
	)
))

(defun el-idcs (lst)
(progn
	(setf tmp-sym (gensym))
	(set tmp-sym 0)
	(el-idcs-helper lst tmp-sym)
)
)

(defun copy-item (item)
	(if (listp item)
		; then
		(copy-list item)
		; else
		item
	)
)

(defun replace-vals (old new lst)
	(block outer

		(if (equal lst old)
			(return-from outer new))

		(if (not (listp lst))
			(return-from outer lst))

		(loop for e in lst
			collect (replace-vals old new e)
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
		(loop for c across s thereis (alpha-char-p c))
	)
)

(defun num-str? (s)
	(loop for c across s always (and
		(alphanumericp c)
		(not (alpha-char-p c))
	))
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

(defun ht-empty? (ht)
	(or (null ht) (equal 0 (hash-table-count ht)))
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

(defun wrap-nonlists (x)
	(if (not (listp x))
		; then
		(list x)
		; else
		x
	)
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

(defun subseq-safe (seq beg end)
(let (
	(real-beg (if (> beg (length seq)) (length seq) beg))
	(real-end (if (> end (length seq)) (length seq) end))
)
	(subseq seq real-beg real-end)
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

(defun split-lst (lst sep)
(remove nil
(mapcar #'unwrap-singletons
(let ((pos (position sep lst :test #'equal)))
(cond
	((null pos)
		(list lst))

	(t (append
		(list (subseq lst 0 pos))
		(split-lst (subseq lst (+ 1 pos) (length lst)) sep)))
)
)
)))

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

;(defmacro check (pr)
;  `(when (not ,pr)
;	(error "Check failed: ~s~%" ',pr)))
(defun check (pred phi)
	(if (not (funcall pred phi))
		; then
		(progn
		(error "Check failed: (~s ~s)~%" pred phi)
		nil
		)
		; else
		t
	)
)

(defun norm-singletons (lst)
	(if (and
		(listp lst)
		(equal 1 (length lst))
		(listp (car lst))
		)
		; then
		(norm-singletons (car lst))
		; else
		lst
	)
)

(defun listify-nonlists (e)
	(if (listp e)
		; then
		e
		; else
		(list e))
)

(defun unwrap-singletons (lst)
	(if (and (listp lst) (equal 1 (length lst)))
		; then
		(unwrap-singletons (car lst))
		; else
		lst
	)
)

(defun matches-ttt (phi pattern)
(let ((new-sym (gensym)))
	(equal new-sym (ttt-replace phi pattern new-sym))
)
)

(defun mk-ttt-pred (pattern)
	(lambda (x) (matches-ttt x pattern))
)

(defun ttt-replace (phi old new)
	(unhide-ttt-ops
		(ttt:apply-rules
			(list (list '/ old new))
			(hide-ttt-ops phi)
			:rule-order :slow-forward))
)

(defun flat-cdr (lst)
	(if (and (equal 2 (length lst)) (listp (second lst)))
		; then
		(second lst)
		; else
		(cdr lst)
	)
)

(defun first-n (lst n)
(cond
	((< n 0) nil)
	((equal n 0) nil)
	((null lst) nil)
	(t (append (list (car lst))
			(first-n (cdr lst) (- n 1))))
)
)

(defun last-n (lst n)
(cond
	((< n 0) nil)
	((equal n 0) nil)
	((null lst) nil)
	((>= n (length lst)) lst)
	(t (last-n (cdr lst) n))
)
)

(defun remove-nth (lst n)
	(append
		(first-n lst n)
		(last-n lst (- (- (length lst) n) 1))
	)
)

(defun shuffle (lst)
(let (old-lst new-lst)
(block outer
	(setf old-lst (copy-list lst))
	(setf new-lst (list))

	(loop while (> (length old-lst) 0)
		do (block inner
			(setf pick-n (random (length old-lst)))
			(setf pick (nth pick-n old-lst))
			(setf old-lst (remove-nth old-lst pick-n))
			(setf new-lst (append new-lst (list pick)))
		)
	)

	(return-from outer new-lst)
)
)
)

(defun subset (s1 s2)
(and
	(listp s1)
	(listp s2)
	(loop for e in s1
		always (member e s2 :test #'equal))
)
)
