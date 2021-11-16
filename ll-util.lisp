(load "ll-load.lisp")

(ll-load "old-ttt/src/load")
(ll-load-subdir "el_parse" "process-sentence1.lisp") ; for hide-ttt-ops and unhide-ttt-ops

(ll-load "ll-cache.lisp")

(defparameter *MY-LOAD-PATHNAME* *load-pathname*)

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

(defparameter *LDEFUN-CALLS* (make-hash-table :test #'equal))

(defparameter *NEWLINE-STR* (format nil "~%"))

; Automatically scopes all setfs introduced inside
; a function to be local, without requiring the
; programmer to manually add let-bindings.
(defmacro ldefun (fname lambda-list &rest body)
(block ldefun-outer
	(setf setf-vars
		(dedupe (loop for element in (get-elements-pred body
			(lambda (x) (and
						(listp x)
						(equal (car x) 'setf)
						(not (starry-global? (second x)))
			)))
				if (symbolp (second element))
					collect (second element)
		))
	)

	(setf loop-vars
		(dedupe (loop for loop-elem in (get-elements-pred body
			(lambda (x) (and
						(listp x)
						(equal (car x) 'loop))
			))
				;if (symbolp (second el))
					;collect (second el)
				append (loop for in-loop-elem in loop-elem
								for i from 0
					if (equal in-loop-elem 'for)
						collect (nth (+ i 1) loop-elem)
				)
		))
	)

	(setf bound-vars (list))
	(loop for lt in (get-elements-pred body (lambda (x) (and (listp x) (equal (car x) 'let))))
		append (loop for binding in (second lt)
					if (and (listp lt) (symbolp (car lt)))
						collect (car lt)))

	(setf unscoped-vars (union setf-vars loop-vars :test #'equal))
	(setf unscoped-vars (set-difference unscoped-vars lambda-list :test #'equal))
	(setf unscoped-vars (set-difference unscoped-vars bound-vars :test #'equal))
	(setf unscoped-vars (loop for uv in unscoped-vars if (not (boundp uv)) collect uv))

	; TODO: maybe do some "static analysis" to warn
	; about variables that may be evaluated before
	; they're defined in this scope?

	(setf body (append (list 'let unscoped-vars) body))

	;(setf log-call
		;`(let ((ldfc (gethash ',fname *LDEFUN-CALLS*)))
			;(if (null ldfc)
				;(setf (gethash ',fname *LDEFUN-CALLS*) 1)
				;(setf (gethash ',fname *LDEFUN-CALLS*) (+ 1 ldfc)))))
	;(setf body (list 'PROGN log-call body))

	`(defun ,fname ,lambda-list ,body)
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

(defun k-most-freq (lst k)
(let (
	(elem-to-freq (make-hash-table :test #'equal))
	(freq-to-elems (make-hash-table :test #'equal))
	return-elems
)
(block outer
	; Build a frequency table for the elements.
	(loop for elem in lst
		do (setf (gethash elem elem-to-freq)
				(if (null (gethash elem elem-to-freq))
					; then
					1
					; else
					(+ 1 (gethash elem elem-to-freq))))

	)

	; Invert the frequency table.
	(loop for elem being the hash-keys of elem-to-freq
		do (setf (gethash (gethash elem elem-to-freq) freq-to-elems)
				(append
					(gethash (gethash elem elem-to-freq) freq-to-elems)
					(list elem)
				)
			)
	)

	; Loop through all frequencies, starting at
	; the highest, and accumulate items until we
	; have K or we run out.
	; Since there are at most (length lst) unique
	; frequencies, this still runs in linear time.
	(loop for i from 1 to (length lst)
		do (loop for elem in
			(gethash (- (+ 1 (length lst)) i) freq-to-elems)
				do (if (>= (length return-elems) k)
					; then
					(return-from outer return-elems)
					; else
					(setf return-elems
						(append return-elems (list elem)))
				)
		)
	)

	(return-from outer return-elems)
)
)
)

(defun most-freq (lst)
	(car (k-most-freq lst 1))
)

(defun get-elements-pred-helper (lst pred)
(let (cur-elem tmp-res final-results)
(block outer
	; (format t "~s is index pair? ~s~%" lst (index-pair? lst))

	(if (not (index-pair? lst))
		(return-from outer nil))

	(setf cur-elem (clean-idcs (car lst)))

	;(format t "cur-elem is: ~s~%" cur-elem)
	;(format t "pred is ~s~%" pred)
	;(format t "good? ~s~%" (funcall pred cur-elem))

	(setf final-results nil)

	(if (funcall pred cur-elem)
		; (return-from outer (list (list (clean-idcs (car lst)) (second lst)))))
		(setf final-results (list (list (clean-idcs (car lst)) (second lst)))))

	(if (not (listp cur-elem))
		(return-from outer final-results))

	;(format t "list is: ~s~%" cur-elem)

	(setf final-results (append final-results (loop for e in (car lst)
		do (setf cur-elem (clean-idcs (car e)))
		do (setf tmp-res (get-elements-pred-helper e pred))
		if (and (index-pair? tmp-res) (not (null (car tmp-res))))
			do (setf tmp-res (list tmp-res))
		if (not (null (car tmp-res)))
			append tmp-res
	)))

	(return-from outer final-results)
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
	(if (null lst)
		; then
		nil
		; else
		(mapcar #'car (get-elements-pred-helper (el-idcs lst) pred))
	)
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
		;((not (listp lst))
			; (funcall pred lst))

		((funcall pred lst) t)

		((not (listp lst)) nil)

		(t (loop for e in lst thereis (has-element-pred e pred)))
	)
)

(defun dupes (lst)
	(dedupe (let ((dupe-map (make-hash-table :test #'equal)))
		(loop for e in lst
			if (not (null (gethash e dupe-map)))
				collect e
			else
				do (setf (gethash e dupe-map) t)
		)
	))
)

(defun dedupe (lst)
	(remove-duplicates lst :test #'equal)
)

(defun dedupe-except (lst except)
	(remove-duplicates lst :test
		(lambda (x y)
			(and
				(equal x y)
				(not (contains except x))
			)
		)
	)
)

; A convenience function for a single element in a flat list.
(defun contains (lst elem)
	(not (null (member elem lst :test #'equal)))
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

(defun has-lst-prefix? (l pre)
(and
	(listp l)
	(listp pre)
	(>= (length l) (length pre))
	(equal
		(subseq l 0 (length pre))
		pre
	)
)
)

(defun has-prefix? (s pre)
(and
	(stringp s)
	(>= (length s) (length pre))
	(equal pre (subseq s 0 (length pre)))
)
)

(defun replace-first-substr (s sub rep)
(let ((spl (split-str s sub)))
	(if (not (equal 1 (length spl)))
		; then
		(apply #'concat-strs
			(append
				(list (car spl) rep)
				(cdr spl)
			)
		)
		; else
		s
	)
)
)

(defun has-subseq-pred (s seq eqpred)
(block outer
	(if (or (not (listp s)) (not (listp seq)))
		(return-from outer nil)
	)
	(if (> (length seq) (length s))
		(return-from outer nil)
	)

	(loop for i from 0 to (- (length s) (length seq))
		if (funcall eqpred (subseq s i (+ i (length seq))) seq)
			do (return-from outer t)
	)

	(return-from outer nil)
)
)

(defun has-subseq (s seq)
	(has-subseq-pred s seq #'equal)
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

(defun varp (v)
	(cond
		((not (symbolp v)) nil)
		((not (> (length (string v)) 1)) nil)
		((not (equal "?" (subseq (string v) 0 1))) nil)
		((has-suffix? (string v) "<-") nil) ; subordinate skolems
		(t t)
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

(defun alpha-str? (s)
	(and
		(stringp s)
		(loop for c across s always (alpha-char-p c))
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

(defun rechashtable (data)
	(sxhash (append (list 'rechashtable-ht-sentinel (sort (loop for k being the hash-keys of data collect (rechash (list k (gethash k data)))) #'<))))
)

(defun rechash (data)
(cond
	((hash-table-p data)
		(rechashtable data)
	)

	((not (listp data))
		(sxhash data))

	;(t (sxhash (loop for e in data
	;	if (listp e) collect (rechash e)
	;	else collect e)))
	(t (sxhash (mapcar (lambda (x) (if (listp x) (rechash x) x)) data)))
)
)

(defun unordered-rechash (data)
(cond
	((hash-table-p data)
		(rechashtable data)
	)

	((not (listp data))
		(sxhash data))

	(t (sxhash (sort (loop for e in data
		if (listp e) collect (unordered-rechash e)
		else collect (sxhash e)) #'<)))
)
)

(defun ht-contains (ht key)
	(nth-value 1 (gethash key ht))
)

(defun ht-count (ht)
	(if (or (null ht) (not (hashtablep ht)))
		; then
		0
		; else
		(hash-table-count ht)
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

(defun ht-pairs (ht)
	(loop for k being the hash-keys of ht
		collect (list k (gethash k ht)))
)

(defun rec-equal (l1 l2)
(block outer
	(if (and (not (listp l1)) (not (listp l2)))
		; then
		(return-from outer (equal l1 l2))
	)

	(if (or (listp l1) (listp l2))
		; then
		(return-from outer nil)
	)

	(if (not (equal (length l1) (length l2)))
		; then
		(return-from outer nil)
	)

	(return-from outer
		(loop for e1 in l1
				for e2 in l2
					always (rec-equal e1 e2)))
	)
)

(defun dbg (tag fmt-str &rest args)
	(if (or *DBG-ALL* (member tag *DBG-TAGS* :test #'equal))
		(apply #'format (append (list t fmt-str) args))
	)
)

(defun dbg-tag (tag)
	(if (not (member tag *DBG-TAGS* :test #'equal))
		(setf *DBG-TAGS* (append *DBG-TAGS* (list tag)))
	)
)

(defun dbg-untag (tag)
	(setf *DBG-TAGS* (remove tag *DBG-TAGS*))
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

(defun mk-hashtable (pairs &optional allow-multi)
(cond
	((equal pairs t) t)

	((null pairs) nil)

	(t (progn
		(setf want-bind (make-hash-table :test #'equal))
		(loop for pair in pairs
			if allow-multi
				do (setf (gethash (car pair) want-bind)
					(append (gethash (car pair) want-bind)
						(list (second pair))))
			else
				do (setf (gethash (car pair) want-bind)
					(second pair))
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
	; (format nil "~d~d" str1 str2)
	(concatenate 'string str1 str2)
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
		(split-str (subseq str (+ (length sep) (search sep str)) (length str)) sep)
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

(defun starry-global? (x)
(and
	(symbolp x)
	(let ((str-x (format nil "~s" x)))
		(and
			(has-prefix? str-x "*")
			(has-suffix? str-x "*")
		)
	)
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
		(old-ttt:apply-rules
			(progn
			; (format t "curried TTT rules: ~s~%" (curry-ttt-rules (list (list '/ old new))))
			(curry-ttt-rules (list (list '/ old new)))
			)
			(hide-ttt-ops phi)
			:rule-order :slow-forward))
)

(defun flatten (lst)
	(loop for e in lst
		if (not (listp e))
			collect e
		if (listp e)
			append (flatten e)
	)
)

(defun flat-cdr (lst)
	(if (and (equal 2 (length lst)) (listp (second lst)))
		; then
		(second lst)
		; else
		(cdr lst)
	)
)

(defun list-of-n? (lst n)
	(and (listp lst) (equal (length lst) n))
)

(defun list-at-least-n? (lst n)
	(and (listp lst) (>= (length lst) n))
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

(defun remove-last (lst)
	(subseq lst 0 (- (length lst) 1))
)

(defun rec-remove (lst x)
	(remove x
		(loop for e in lst
			collect (if (listp e)
				; then
				(rec-remove e x)
				; else
				e
			)
		)
	:test #'equal)
)

(defun remove-nth (lst n)
	(append
		(first-n lst n)
		(last-n lst (- (- (length lst) n) 1))
	)
)

(defun shuffle (lst &optional iters)
	(if (or (null iters) (equal iters 0))
		; then
		(shuffle-once lst)
		; else
		(shuffle-once
			(shuffle lst (- iters 1)))
	)
)

(defun shuffle-once (lst)
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

(defparameter *LL-CURRY-NUMS*
	(make-hash-table :test #'equal)
)

; Process all ll-curry rules into curried functions.
(defun curry-ttt-rules (rules)
(let ((new-ulf-rules (copy-item rules)))
(block outer
	(loop for llc in (get-elements-pred new-ulf-rules (lambda (x)
		(and
			(listp x)
			(or
				(equal (car x) 'll-curry)
				(equal (car x) 'll-curry-imper)
			)
		)))
		do (block make-curry ; delicious!
			(setf final-punct "?")
			(if (equal (car llc) 'll-curry-imper)
				(setf final-punct "!"))

			(setf curry-fn (second llc))
			(setf curry-args (cddr llc))
			(setf curry-new-name (intern
				(format nil "LL-CURRY-~a" (remove-suffix (string curry-fn) final-punct))))
			(setf (gethash curry-new-name *LL-CURRY-NUMS*) (append (gethash curry-new-name *LL-CURRY-NUMS*) (list t)))
			(setf curry-num (length (gethash curry-new-name *LL-CURRY-NUMS*)))
			(setf curry-new-name (intern (format nil "~a-~d~a" (string curry-new-name) curry-num final-punct)))
			
			(let ((cargs curry-args) (cfn curry-fn))
			; (setf (fdefinition curry-new-name) (compile nil `(lambda (x)
				; (apply ,cfn (append (list x) ,cargs))
			; )))
				(setf (symbol-function curry-new-name) (lambda (x)
					(apply cfn (append (list x) cargs))
				))
			)

			(setf new-ulf-rules (replace-vals llc curry-new-name new-ulf-rules))
		)
	)

	(return-from outer new-ulf-rules)
)))

(defun stack-nest (base stack &optional reverse)
	(if (null stack)
		; then
		base
		; else
		(if reverse
			; then
			(list (car (last stack))
				(stack-nest base
					(subseq stack 0 (- (length stack) 1)) t))
			; else
			(list (car stack)
				(stack-nest base (cdr stack)))
		)
	)
)

(ldefun topsort (arrows)
(block outer
	(setf all (list))
	(setf children (list))
	(loop for arrow in arrows
		do (setf all (append all arrow))
		do (setf children (append children (cdr arrow)))
	)
	(setf children (dedupe children))
	(setf all (dedupe all))
	(format t "all are ~s~%" all)
	(format t "children are ~s~%" children)

	(if (null children)
		(return-from outer arrows))

	(setf free (set-difference
		all children
		:test #'equal))

	(format t "removing free nodes ~s~%" free)
	(if (null free)
		(return-from outer nil))

	(setf new-arrows
		(loop for arrow in arrows
			if (not (contains free (car arrow)))
				collect arrow))

	(setf orphans
		(dedupe (loop for arrow in arrows
			if (contains free (car arrow))
				collect (second arrow))))

	(return-from outer (dedupe (append
		free
		orphans
		(topsort new-arrows))))
)
)

(ldefun min-graph (es)
(block outer
	(setf vs (dedupe
		(loop for e in es append e)))

	(setf new-es (loop for v in vs
		append (loop for dd in (get-direct-descendants v es)
			collect (list v dd))))

	(return-from outer new-es)
)
)

(ldefun get-direct-descendants (v es)
(block outer
	(setf naive-direct (dedupe
		(loop for e in es if (equal v (car e))
			collect (second e))))

	(setf indirect (dedupe
		(loop for d in naive-direct
			append (get-descendants d es))))

	(return-from outer (set-difference
		naive-direct indirect :test #'equal))
)
)

(ldefun get-descendants (v es &optional seen)
(block outer
	(if (null seen)
		(setf seen (make-hash-table :test #'equal)))

	(setf (gethash v seen) t)

	(setf desc (list))
	(loop for e in es
		if (and (equal v (car e))
			(not (gethash (second e) seen)))
				do (progn
				(setf new-desc
					(get-descendants (second e) es seen))
				(setf desc (append desc (list (second e)) new-desc))
				)
	)

	(return-from outer desc)
)
)

(ldefun print-dfs (root graph-map &optional seen depth)
(block outer
	(if (null seen)
		(setf seen (make-hash-table :test #'equal)))
	(if (null depth)
		(setf depth 0))

	(setf (gethash root seen) t)

	(setf root-str (format nil "~s" root))
	(setf matched-preds
		(get-elements-pred root
			(lambda (x)
				(and (lex-verb? x)
					(not (null (get-schema-match-num x)))))))
	(if (not (null matched-preds))
		; then
		(progn
			(setf cleaned-root (copy-item root))
			(setf nums (list))
			(loop for m in matched-preds
				do (setf nums (append nums (list (format nil "~d" (get-schema-match-num m)))))
				do (setf cleaned-root (replace-vals
					m (get-schema-match-name m)
					cleaned-root)))

			(setf root-str (string-downcase
				(format nil "~s [~a]" cleaned-root
					(join-str-list ", " nums))))
		)
	)

	(if (equal (length (gethash root graph-map)) 1)
		; then
		(setf depth (max 0 (- depth 1)))
		; else
		(format t "~a~a~%" (repeat-str "   " depth) root-str)
	)

	(loop for child in (gethash root graph-map)
		if (not (gethash child seen)) do (progn
			(print-dfs child graph-map seen (+ depth 1))
		)
	)
)
)

(ldefun upcase-symbols (form)
(block outer
	(setf form-copy (copy-item form))

	(setf cased-syms (dedupe (get-elements-pred
		form-copy (lambda (x)
			(and (symbolp x)
				(not (equal (string x)
					(string-upcase (string x)))))))))

	(loop for cs in cased-syms
		do (setf form-copy (replace-vals
			cs (intern (string-upcase (string cs)))
				form-copy)))

	(return-from outer form-copy)
)
)

(ldefun all-caps? (str)
	(equal str (string-upcase str))
)

(ldefun in-span (num span)
	(and (>= num (car span)) (<= num (second span)))
)

(ldefun sum (nums)
	(reduce #'+ nums)
)

(ldefun avg-mean (nums)
	(if (equal 0 (length nums))
		; then
		0
		; else
		(/ (sum nums) (length nums))
	)
)

(ldefun avg-median (nums)
	(if (equal 0 (length nums))
		; then
		0
		; else
		(nth (floor (length nums) 2)
			(sort num #'<))
	)
)

(ldefun avg-mode (nums)
	(unwrap-singletons
		(k-most-freq nums 1))
)

(ldefun min-all (l &optional key)
(block outer
	(setf m (car l))
	(loop for e in l do (block mloop
		(if (not (null key))
			; then
			(if (< (funcall key e) (funcall key m))
				(setf m e))
			; else
			(if (< e m)
				(setf m e)))
	))

	(return-from outer m)
)
)

(ldefun max-all (l &optional key)
(block outer
	(setf m (car l))
	(loop for e in l do (block mloop
		(if (not (null key))
			; then
			(if (> (funcall key e) (funcall key m))
				(setf m e))
			; else
			(if (> e m)
				(setf m e)))
	))

	(return-from outer m)
)
)

(ldefun unflatten-tree (pairs)
(block outer
	; Find the root
	(setf root (caar (loop for pair in pairs
						for i from 0
		if (loop for pair2 in pairs
				for j from 0
			never (contains (second pair2) i))
			collect pair)))

	; Make a child graph
	(setf graph (make-hash-table :test #'equal))
	(loop for pair in pairs
		if (not (null (second pair)))
			do (setf (gethash (car pair) graph)
					(append (gethash (car pair) graph)
							(second pair)
						)))

	; Do a DFS
	(return-from outer (unflatten-tree-helper
		root pairs graph (make-hash-table :test #'equal)))
)
)

(ldefun unflatten-tree-helper (root pairs graph seen)
(block outer
	(setf (gethash root seen) t)

	(if (null (gethash root graph))
		(return-from outer root))

	(setf children (loop for child-idx in
		(gethash root graph)
			collect (car (nth child-idx pairs))))

	(return-from outer (list root
		(loop for child in children
			if (not (gethash child seen))
				collect (unflatten-tree-helper
					child pairs graph seen))))
)
)

(ldefun print-nested-dfs (root &optional seen depth)
(block outer
	(if (null seen)
		(setf seen (make-hash-table :test #'equal)))
	(if (null depth)
		(setf depth 0))
	(setf root (listify-nonlists root))

	(setf (gethash root seen) t)

	(format t "~a~s~%"
		(repeat-str "  " depth)
		(car root))

	(if (> (length root) 1)
		(loop for child in (second root)
			if (not (gethash child seen))
				do (print-nested-dfs
					child
					seen
					(+ depth 1))))
)
)

(ldefun tree-leaves (root)
	(if (and (<= (length root) 8) (>= (length root) 4))
		; then
		(list (car root))
		; else
		(loop for c in (second root)
			append (tree-leaves c))
	)
)

(defun mkht ()
	(make-hash-table :test #'equal)
)

(ldefun schema-root-dir ()
(block outer
	(setf path-components (cdr (pathname-directory *MY-LOAD-PATHNAME*)))
	(setf path-components (append
		(car (split-lst path-components "schemas"))
		(list "schemas")))
	(return-from outer (concat-strs "/" (join-str-list "/" path-components)))
)
)

(ldefun force-str (obj)
	(format nil "~a" obj)
)

(ldefun n-shuffles (lst seed)
	(if (<= seed 1)
		; then
		(shuffle lst)
		; else
		(shuffle (n-shuffles lst (- seed 1))))
)

(ldefun run-proc-with-stdin (proc args inp)
(block outer
	(let* ((p (sb-ext:run-program proc args
			:input :stream
			:output :stream
			:wait nil))
		(s (sb-ext:process-input p)))
			(progn
				(format s inp)
				(finish-output s)
				(close s)
				(return-from outer (loop for line = (read-line (sb-ext:process-output p) nil)
					while line
						collect line))))))

(ldefun strip-dot-tag (s)
(block outer
	(if (not (symbolp s))
		(return-from outer s))

	(setf spl (split-str (string s) "."))
	(return-from outer (intern (car spl)))
)
)

(ldefun word2vec-sim (w1 w2)
	(let ((res (read-from-string (car (run-proc-with-stdin "/home/lane/miniconda3/bin/python3" (list "/home/lane/Code/schemas/word2vec.py" (string (strip-dot-tag w1)) (string (strip-dot-tag w2))) "")))))
		(if (numberp res)
			; then
			res
			; else
			0.0))
)
