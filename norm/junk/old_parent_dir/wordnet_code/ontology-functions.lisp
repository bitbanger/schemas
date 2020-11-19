(load "packages.lisp")
(in-package "WORDNET")
(load "parts-of-speech.lisp")
(load "wordnet-database-files.lisp")
(load "parse-wordnet-data.lisp")
(load "representation.lisp")
(load "relationship-algorithms.lisp")
;(in-package "COMMON-LISP-USER")

(in-package #:wordnet)

;; Retrieves the synsets for a given word and part of speech
(defun get-synsets (word part-of-speech)
  (index-entry-synsets (cached-index-lookup word part-of-speech)))

;; Uses sense number to return only the synsets which contain the given word with the given sense number
(defun disambiguate-sense (synset-list word sense-number)
  (remove-if-not (lambda (synset) (member (list word sense-number) (synset-words synset) :test #'equalp)) synset-list))

;; Gets the hypernym of a synset
(defun get-hypernym (synset)
  (wordnet-pointer-to-synset (car (remove-if-not (lambda (p) (member (wordnet-pointer-type p) '(:hypernym :substance-hypernym :instance-hypernym)))
    (wordnet-pointers synset)))))

;; Return t if synset has a hypernym, nil otherwise
(defun has-hypernym (synset)
  (if (car (remove-if-not (lambda (p) (member (wordnet-pointer-type p) '(:hypernym :substance-hypernym :instance-hypernym)))
    (wordnet-pointers synset))) t nil))

;; Recursively construct a hypernym tree for a synset
(defun construct-hypernym-tree (synset)
  (cond
    ((not (has-hypernym synset)) (list synset))
    (t (cons synset (construct-hypernym-tree (get-hypernym synset))))))

;; Currently this is just implemented in terms of the intersection of hypernym trees. It could probably be done more efficiently.
;; Can easily implement metric of abstraction this way though.
(defun get-lowest-common-hypernym (synset1 synset2)
  (let ((hypernym-tree1 (construct-hypernym-tree synset1)) (hypernym-tree2 (construct-hypernym-tree synset2)))
    (car (last (intersection hypernym-tree1 hypernym-tree2 :test #'eq)))))

;; Once a lowest-common-hypernym synset has been found, this can be used to find the level of abstraction of the lowest common
;; hypernym - higher number = more specific
(defun abstraction-distance (lch-synset)
  (labels ((distance-from-root (synset i)
            (cond
              ((not (has-hypernym synset)) i)
              (t (distance-from-root (get-hypernym synset) (+ i 1))))))
  (if lch-synset (distance-from-root lch-synset 0) nil)))

;; Check to make sure lemma is in correct format (word sense-number part-of-speech)
;; Return nil and print error otherwise
(defun check-lemma (lemma)
  (cond
    ((or (not lemma) (not (listp lemma)) (not (equal 3 (length lemma)))) (format t "Lemma must be a triplet (word sense-number part-of-speech)"))
    ((not (stringp (first lemma))) (format t "'word' must be a string"))
    ((not (integerp (second lemma))) (format t "'sense-number' must be an integer"))
    ((not (member (third lemma) '(:noun :verb))) (format t "'part-of-speech' must be either :noun or :verb"))
    (t t)))

;; (wordnet-hypernyms '("dog" 0 :noun))
(defun wordnet-hypernyms (lemma)
  (if (check-lemma lemma) (let ((word (first lemma)) (sense-number (second lemma)) (part-of-speech (third lemma)))
    (mapcar #'construct-hypernym-tree (disambiguate-sense (get-synsets word part-of-speech) word sense-number)))))

;; (wordnet-lch '("dog" 0 :noun) '("rat" 0 :noun))
;; if lemma1 yields n synsets, and lemma2 yields m synsets (both after sense disambiguation), this function returns an
;; mxn matrix of lch and abstraction distance of all possible pairs of synsets
(defun wordnet-lch (lemma1 lemma2)
  (if (and (check-lemma lemma1) (check-lemma lemma2))
    (let ((word1 (first lemma1)) (sense-number1 (second lemma1)) (part-of-speech1 (third lemma1))
          (word2 (first lemma2)) (sense-number2 (second lemma2)) (part-of-speech2 (third lemma2)))
      (mapcar (lambda (synset1) (mapcar (lambda (synset2)
                                          (let ((lch (get-lowest-common-hypernym synset1 synset2)))
                                            (list lch (abstraction-distance lch))))
                                  (disambiguate-sense (get-synsets word1 part-of-speech1) word1 sense-number1)))
        (disambiguate-sense (get-synsets word2 part-of-speech2) word2 sense-number2)))))

;; Converts all synsets in a result to lists of words in that synset
(defun synsets-to-words (result)
  (labels ((to-words (x)
    (cond
      ((not x) x)
      ((or (integerp x) (stringp x)) x)
      ((listp x) (mapcar #'to-words x))
      (t (mapcar #'car (synset-words x))))))
  (mapcar #'to-words result)))