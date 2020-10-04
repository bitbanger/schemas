;; For parsing English into ULF;
;; If repair rules pre-existing from "elf-from-sentences" are added, 
;; ttt and ttt rule files will have to be added from there as well.

; (load "package.lisp")
(load "init1.lisp")
(load "english-to-ulf.lisp")
(load "el_parse.lisp")
(load "parse-tree-to-ulf.lisp")
(load "preprocess-tree-for-ulf.lisp")
(load "pos+word-to-ulf.lisp")        
(load "preprocessing-rules.lisp")   
(load "real_util.lisp")
(load "stem.lisp")
(load "tt.lisp")
(load "postprocess-ulf-tree.lisp")

(defun trace-main () 
  (trace simple-tree pos+word-to-raw-ulf aux-inflection 
         preprocess-tree-for-ulf parse-tree-to-raw-ulf))

(defun trace-rules ()
  (trace apply-rule apply-rule-bottom-up apply-rule-top-down))

(setq *show-stages* nil)

; Same as english-to-ulf, except it re-tags the words
; to correspond better to the sentence for coreference
; analysis.
(defun len-ulf-with-word-tags (sent)
(let (ulf ulf-words words word)
(block outer
	(setf ulf (english-to-ulf sent))

	(setf ulf-words (get-elements-pred ulf (lambda (x) (and (symbolp x) (> (length (split-str (string x) "~")) 1)))))

	(setf words (loop for word in ulf-words
		collect (intern (car (split-str (string word) ".")))
	))

	(setf cleaned-sent (loop for word in (split-str sent " ")
		collect (intern (string-upcase (join-str-list "" (loop for c across word
			if (alphanumericp c) collect (string c)))))
	))

	;(loop for word in words

	(setf sent-word-idx 1)
	(setf sent-tags (list))

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

					(loop for tok in (subseq words 0 (car mpairs))
						do (setf sent-tags (append sent-tags (list sent-word-idx)))
					)
					(setf sent-word-idx (+ sent-word-idx 1))

					(setf words (subseq words (car mpairs) (length words)))
					(setf cleaned-sent (subseq cleaned-sent (second mpairs) (length cleaned-sent)))
				)
				; else
				(progn
					(setf sent-tags (append sent-tags (list sent-word-idx)))
					(setf sent-word-idx (+ sent-word-idx 1))
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

; (load "test...pos+word-to-ulf.lisp")

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
