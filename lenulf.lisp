;; For parsing English into ULF;
;; If repair rules pre-existing from "elf-from-sentences" are added, 
;; ttt and ttt rule files will have to be added from there as well.

; (ll-load "package.lisp")
(load "ll-load.lisp")

(ll-load-subdir "el_parse" "init1.lisp")
(ll-load-subdir "el_parse" "english-to-ulf.lisp")
(ll-load-subdir "el_parse" "parse-tree-to-ulf.lisp")
(ll-load-subdir "el_parse" "preprocess-tree-for-ulf.lisp")
(ll-load-subdir "el_parse" "pos+word-to-ulf.lisp")        
(ll-load-subdir "el_parse" "preprocessing-rules.lisp")   
(ll-load-subdir "el_parse" "stem.lisp")
(ll-load-subdir "el_parse" "tt.lisp")
(ll-load-subdir "el_parse" "postprocess-ulf-tree.lisp")

(ll-load "ll-util.lisp")

(defun trace-main () 
  (trace simple-tree pos+word-to-raw-ulf aux-inflection 
         preprocess-tree-for-ulf parse-tree-to-raw-ulf))

(defun trace-rules ()
  (trace apply-rule apply-rule-bottom-up apply-rule-top-down))

(setq *show-stages* nil)

(defun max-tag (ulf)
(block outer
	(setf len-ulf-max-tag 0)

	(loop for x in (get-elements-pred ulf (lambda (x) (and (symbolp x) (> (length (split-str (string x) "~")) 1))))
		if (> (parse-integer (second (split-str (string x) "~"))) len-ulf-max-tag)
			do (setf len-ulf-max-tag (parse-integer (second (split-str (string x) "~"))))
	)

	(return-from outer len-ulf-max-tag)
)
)

(defun len-ulfs-with-word-tags (sents)
(let (len-ulfs len-ulf tag)
(block outer
	(setf tag 1)
	(loop for sent in sents
		do (block inner
			(setf len-ulf (len-ulf-with-word-tags sent tag))
			(setf len-ulfs (append len-ulfs (list len-ulf)))
			(setf tag (+ (max-tag len-ulf) 1))
		)
	)

	(return-from outer len-ulfs)
)))

; Same as english-to-ulf, except it re-tags the words
; to correspond better to the sentence for coreference
; analysis.
(defun len-ulf-with-word-tags (sent start-tag)
(let (ulf ulf-words words word)
(block outer
	(setf ulf (english-to-ulf sent))

	(setf ulf-words (get-elements-pred ulf (lambda (x) (and (symbolp x) (> (length (split-str (string x) "~")) 1)))))

	(setf words (loop for word in ulf-words
		collect (intern (car (split-str (string (car (split-str (string word) "."))) "~")))
	))

	(setf cleaned-sent (loop for word in (split-str sent " ")
		collect (intern (string-upcase (join-str-list "" (loop for c across word
			if (alphanumericp c) collect (string c)))))
	))

	;(loop for word in words

	(setf sent-word-idx (- start-tag 1))
	(setf sent-tags (list))
	; (format t "sent: ~s~%" words)
	; (format t "parse words: ~s~%" cleaned-sent)

	(loop while (> (length words) 0)
		do (block inner
			(if (not (equal (car words) (car cleaned-sent)))
				; then
				(block inner2
					; find the smallest indices
					; for which the words match
					; again
					(setf mpairs nil)
					(loop for j from 0 to (- (length words) 1)
						append (loop for k from 0 to (- (length cleaned-sent) 1)
							if (and
								(equal (nth j words) (nth k cleaned-sent))
								(or
									(null mpairs)
									(< (+ j k) (+ (car mpairs) (second mpairs)))
								)
							)
								; collect (list j k)
								do (setf mpairs (list j k))
						)
					)

					; If mpairs is still null, the words are never equal again.
					; We can just use the pair (1 1) and let it proceed.
					; (Or, if either list is empty, set its index to 0.)
					(if (null mpairs)
						; then
						(setf mpairs (list (min 1 (length words)) (min 1 (length cleaned-sent))))
					)

					(if (not (null cleaned-sent))
						; then
						(setf sent-word-idx (+ sent-word-idx 1))
					)

					; (format t "mpairs: ~s~%" mpairs)
					; (format t "words: ~s~%" words)
					; (format t "cleaned-sent: ~s~%" cleaned-sent)
					(loop for tok in (subseq words 0 (car mpairs))
						do (setf sent-tags (append sent-tags (list sent-word-idx)))
					)

					(setf words (subseq words (car mpairs) (length words)))
					(setf cleaned-sent (subseq cleaned-sent (second mpairs) (length cleaned-sent)))
				)
				; else
				(progn
					(if (not (null cleaned-sent))
						; then
						(setf sent-word-idx (+ sent-word-idx 1))
					)
					(setf sent-tags (append sent-tags (list sent-word-idx)))
					(setf cleaned-sent (cdr cleaned-sent))
					(setf words (cdr words))
				)
			)
		)
	)

	(loop for word in ulf-words
		for tag in sent-tags
		do (block rplc
			(setf retagged (intern (format nil "~a~~~d" (car (split-str (string word) "~")) tag)))
			(setf ulf (replace-vals word retagged ulf))
		)
	)

	(return-from outer ulf)
)))

(if nil
(block ifnil
(format t "~%NB: (trace-main) can be used for high-level tracing")
(format t "~%    (trace-rules) can be used for tracing preprocessing")

; (ll-load "test...pos+word-to-ulf.lisp")

(setq *show-stages* t)

(let ()
 (format t "~%Example of using 'parse-tree-to-ulf' (from Brown, file p16):~% ~
             (parse-tree-to-ulf~%    ~
                 '((S (NP (PRP I))~%         ~
                      (AUX (VBP \\'m))~%         ~
                      (VP (VBN scared)~%             ~
                          (PP (IN of) (NP (DT the) (NN nightmare))))) (\\. \\.)))")
 (format t "~%~%Suggested handy definition:~%
         (defun p (tree) (format t ~s (parse-tree-to-ulf tree)))" "~%~s")
 (format t "~%~%Suggested handy definition for English to ULF:~%
         (defun ulf (str) (format t ~s (english-to-ulf str)))" "~%~s")
 (format t "~%~%To avoid showing processing stages, do~%  ~
           (setq *show-stages* nil)")
 '     -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-)
))
