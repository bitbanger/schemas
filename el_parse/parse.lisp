;; Run Charniak parser
;; Jonathan Gordon, 2011-12-19
;; parse-all and sep-sentences added by LKS

;; Example:
;; (parse "This is a test.")

(load "../ll-load.lisp")

(ll-load "ll-util.lisp")

; (defparameter *parser* "/p/nl/tools/bllip-parser/first-stage/PARSE/parseIt")
(defparameter *parser* "/Users/l/Code/bllip-parser/first-stage/PARSE/parseIt")
;                         ^^^^ changed back from krr (Jan 12); nl had been out of space

;; This is the traditional Charniak language model.
;; McClosky's (slower to load but more accurate) model is
;;   /p/nl/tools/bllip-parser/first-stage/DATA/
;;      ^^ now krr, at least until nl is enlarged; but the reranking
;;         parser is still in nl
; (defparameter *pdata* "/p/nl/tools/reranking-parser/first-stage/DATA/EN/")
(defparameter *pdata* "/Users/l/Code/bllip-parser/newdata/DATA/EN/")

(defparameter *PLACEHOLDER-NAME*
	(intern "Gonzaaalo"))

(defun parse-all (str)
; Here we allow str to consist of multiple sentences separated by
; one of {. ? !}. Return a list of (successive) sentence parses.
  (let ((strings (sep-sentences str)))
    (mapcar #'parse strings)))

(defun sep-sentences (str)
; Produce a list of strings corresponding to sentences in str
; separated by one of {. ? !}.
  (let ((chars (coerce str 'list)) sent sents ch)
    (loop (setq sent nil)
          (loop (if (char= (first chars) #\Space); drop initial blanks,
                    (pop chars) (return nil)))   ; then exit loop
          (if (null chars) (return-from sep-sentences (reverse sents)))
          (loop (setq ch (pop chars))
                (push ch sent)
                (if ; punctuation followed by a blank?
                    (and (member ch '(#\. #\? #\!))
                         (char= (first chars) #\Space))
                         (return nil)) ; exit loop
                (if (null chars) (return nil)))
          (push (coerce (reverse sent) 'string) sents)
          (if (null chars) 
              (return-from sep-sentences (reverse sents))))
 )); end of sep-sentences


(defun parse (str)
;; Here str (a string) is assumed to be a single sentence
;; We create a new file via a 'let', to be used for the stream,
;; and delete it at the end.
  (let ((filename (format nil "~a.txt" (gensym)))
        (result))

	(setf name-toks (mistagged-names str))
	(setf name-tok-idxs (mapcar #'car name-toks))

    (with-open-file (to-parse filename :direction :output
                                       :if-exists :supersede)
      (format to-parse (preproc-for-parse str name-tok-idxs)))

	(setf str-result (output-from-cmd (format nil "~a ~a ~a"
										*parser* *pdata* filename)))
	(setf result (lispify-parser-output str-result))

	; Replace each placeholder name with the original
	; mistagged name it stood in for.
	(setf placeholder-idxs (get-elements-pred-idx result
		(lambda (x) (equal x
			(upcase-symbols *PLACEHOLDER-NAME*)))))

	(if (not (equal (length placeholder-idxs)
		(length name-toks)))
		; then
		(format t "ERROR: number of mistagged names (~d) and number of placeholders (~d) do not match in parse~%" (length placeholder-idxs) (length names))
	)

	(loop for name-tok in name-toks
			for placeholder-idx in placeholder-idxs
		do (setf result (replace-element-idx result
				placeholder-idx
				(upcase-symbols (second name-tok)))))

    (delete-file filename)
    result))

(defun mistagged-names (str)
	(loop for tok in (tokenize-simply str)
			for i from 0
		if (and (> i 0)
				(> (length (string tok)) 1)
				(alpha-str? (subseq (string tok) 0 1))
				(all-caps? (subseq (string tok) 0 1))
				(contains (append *male-names* *female-names*)
					(upcase-symbols tok)))
			collect (list i tok))
)

;; prefix sentence string with <s>, postfix with </s>
(defun preproc-for-parse (str &optional name-tok-idxs)
(block outer
	(setf new-str (loop for tok in (tokenize-simply str)
			for i from 0
		if (contains name-tok-idxs i)
			collect *PLACEHOLDER-NAME*
		else
			collect tok))

	(setf new-str
		(join-str-list "" (mapcar #'string new-str)))

	(format nil "<s> ~a </s>" new-str)
)
)



(defun exec-from-command (command)
	(car (split-str command " "))
)

(defun args-from-command (command)
	(cdr (split-str command " "))
)


;; Adapted from 'port.lisp' from 'asdf-install'.
;; Comment by LKS: The loop syntax here is an extension of the basic
;; loop syntax; the latter allows a sequence of nonatomic list structures
;; to be repeatedly evaluated until there's a return or throw. I find
;; the extended syntax unpalatable, totally out of sync with the spirit
;; of Lisp. I haven't tried it, but I suspect the same result would be
;; obtained with the standard lisp loop syntax
;;    (loop (let ((line (read-line stream nil)))
;;          (if line (write-line line out-stream)
;;                   (return))))
(defun output-from-cmd (command);; 'command' is a string, to be interpreted
                                ;; as a command (used here to invoke the
                                ;; Charniak parser on a sentence string
                                ;; bracketed by <s> ... </s>)
  "Returns a string containing the result of executing the command."
  (with-output-to-string (out-stream)
    ;(let ((stream (excl:run-shell-command command :output :stream
    ;                                              :wait nil)))
	(let ((stream (sb-ext:process-output (sb-ext:run-program (exec-from-command command) (args-from-command command) :output :stream :wait nil :directory *default-pathname-defaults*))))
      (loop for line = (read-line stream nil)
         while line
         do (write-line line out-stream)))))


;; Note: I'd actually use 'tree-from-string' in epik/tools/lisp/utils, but
;; this doesn't depend on a regex package. Below by Lenhart Schubert. -BVD

(defun lispify-parser-output (char-string)
  "Convert a sentence parse, as a string, to a LISP S-expression"
  (read-from-string (preslash-unsafe-chars char-string)) )

(defun preslash-unsafe-chars (char-string)
  "Prefix '\' to unsafe characters # ` ' : ; , . \ | in 'aString'."
  (let ((chars (coerce char-string 'list)) result)
       (dolist (ch chars)
           (cond ((alphanumericp ch) (push ch result))
                 ((member ch '(#\( #\) #\")) (push ch result)); unbalanced "
                 ((member ch
                   '(#\# #\` #\' #\: #\; #\, #\. #\\ #\|) )
                  (push #\\ result) (push ch result) )
                 (T (push ch result)) ))
        (coerce (reverse result) 'string)))
