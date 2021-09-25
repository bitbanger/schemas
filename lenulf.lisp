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
(ll-load-subdir "el_parse" "parse.lisp")
(ll-load-subdir "el_parse" "tt-match-predicates.lisp")
(ll-load-subdir "el_parse" "lexical-features.lisp")
(ll-load-subdir "el_parse" "transitivity-lists.lisp")
(ll-load-subdir "el_parse" "isa.lisp")
(ll-load-subdir "el_parse" "postprocessing-rules.lisp")
(ll-load-subdir "el_parse" "insert-gaps.lisp")
(ll-load-subdir "el_parse" "subcat-pref.lisp")

(ll-load "ll-util.lisp")

(defun trace-main () 
  (trace simple-tree pos+word-to-raw-ulf aux-inflection 
         preprocess-tree-for-ulf parse-tree-to-raw-ulf))

(defun trace-rules ()
  (trace apply-rule apply-rule-bottom-up apply-rule-top-down))

(setq *show-stages* nil)

(ldefun max-tag (ulf)
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
	
	; Get the AllenNLP coref tokenization so we know how to
	; align the ULF tokens for later resolution.
	; TODO: more punctuation?
	(setf tok-sents (split-lst (coref-toks (join-str-list " " sents)) "."))
	; (setf tok-sents (coref-toks (join-str-list " " sents)))
	(setf tok-sents (loop for sent in tok-sents
		collect (loop for word in sent
			collect (intern (string-upcase word)))))

	(loop for sent in sents
			for tok-sent in tok-sents
		do (block inner
			(setf len-ulf (len-ulf-with-word-tags sent tag tok-sent))
			(setf len-ulfs (append len-ulfs (list len-ulf)))
			(setf tag (+ (max-tag len-ulf) 1))
		)
	)

	(return-from outer len-ulfs)
)))

(ldefun align-tokens (words cleaned-sent start-tag)
(block outer
	(setf sent-word-idx (- start-tag 1))
	(setf sent-tags (list))
	; (format t "ulf sent: ~s~%" ulf-words)
	; (format t "sent: ~s~%" words)
	; (setf cleaned-sent '(ALLIE ONE ONE ONE WATCH A SHOW YESTERDAY))
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

					; We need to handle the case where N words correspond to
					; M>N unequal words. Consider "Allie A B C a sandwich" and
					; "Allie just ate a sandwich". If we don't do anything, the
					; three tokens "A B C" and the two tokens "just ate" will all
					; be tagged with the same number, and sent-word-idx will only
					; advance by 1. So, in this case, we will advance sent-word-idx
					; for each of the first N words, giving each index to the first
					; N of the M words The remainder of the M words will repeat.
					; This ensures that substitutions are only ever of one word, and
					; that spans of N words and N words that are unequal only due to
					; conjugation issues will still be numbered correctly (however,
					; we should still amend the equality predicate to account for
					; this, I think; big TODO!)

					(if (and (> (car mpairs) 1) (> (second mpairs) 1))
						(setf mpairs '(1 1))
					)




					; Increment one here for the first word tag, and then increment any
					; remainder to puff up the next word tag, if it needs it.
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

					; (format t "equating ~s with ~s~%" (subseq cleaned-sent 0 (second mpairs)) (subseq words 0 (car mpairs)))
					(setf words (subseq words (car mpairs) (length words)))
					(setf cleaned-sent (subseq cleaned-sent (second mpairs) (length cleaned-sent)))
					; (format t "set cleaned-sent to ~s~%" cleaned-sent)

					; If there were more text words that got skipped in the ULF, advance the next word
					; such that it skips over all of them.
					(if (not (null cleaned-sent))
						; then
						(setf sent-word-idx (+ sent-word-idx (max 0 (- (second mpairs) 1))))
					)
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

	(return-from outer sent-tags)
))

; Same as english-to-ulf, except it re-tags the words
; to correspond better to the sentence for coreference
; analysis.
(ldefun len-ulf-with-word-tags (sent start-tag allen-coref-toks)
(let (ulf ulf-words words word)
(block outer
	(setf ulf (english-to-ulf sent))

	(setf ulf-words (get-elements-pred ulf (lambda (x) (and (symbolp x) (> (length (split-str (string x) "~")) 1)))))

	(setf words (loop for word in ulf-words
		collect (intern (car (split-str (string (car (split-str (string word) "."))) "~")))
	))

	; (setf cleaned-sent (loop for word in (split-str sent " ")
		; collect (intern (string-upcase (join-str-list "" (loop for c across word
			; if (alphanumericp c) collect (string c)))))
	; ))

	(setf cleaned-sent allen-coref-toks)

	;(loop for word in words


	(setf sent-tags (align-tokens words cleaned-sent start-tag))

	(loop for word in ulf-words
		for tag in sent-tags
		do (block rplc
			(setf retagged (intern (format nil "~a~~~d" (car (split-str (string word) "~")) tag)))
			; (format t "replacing ~s with ~s~%" word retagged)
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
