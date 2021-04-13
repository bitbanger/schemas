from mk_lisp_wn import lemma_to_el

from nltk.corpus import wordnet as wn

# Basic level files obtained from:
# https://github.com/rubenIzquierdo/basic_level_concepts
blc_noun_file = "blc.noun"
blc_verb_file = "blc.verb"

noun_blcs = dict()
verb_blcs = dict()

for line in open(blc_noun_file, 'r'):
	if not line.strip() or line[0] == "#":
		continue

	lemmas = [wn.of2ss(num+'n').lemmas() for num in line.split()[:2]]
	nonbasic_lemmas = lemmas[0]
	basic_lemma = lemmas[1][0]

	if "'" in str(lemma_to_el(basic_lemma)):
		continue

	for i in range(len(nonbasic_lemmas)):
		nonbasic_lemma = nonbasic_lemmas[i]
		if "'" in str(lemma_to_el(nonbasic_lemma)):
			continue
		noun_blcs[lemma_to_el(nonbasic_lemma)] = lemma_to_el(basic_lemma)
		print("mapping %s to %s" % (lemma_to_el(nonbasic_lemma), lemma_to_el(basic_lemma)))
		# print("	line was %s" % (line))
		print("	words were %s and %s" % (nonbasic_lemma, basic_lemma))

for line in open(blc_verb_file, 'r'):
	if not line.strip() or line[0] == "#":
		continue
	(non_basic, basic) = [lemma_to_el(wn.of2ss(num+'v').lemmas()[0]) for num in line.split()[:2]]
	verb_blcs[non_basic] = basic


print("(defparameter *NOUN-BASIC-LEVELS-LST* '(")
for k in noun_blcs:
	print("	(%s %s)" % (k, noun_blcs[k]))
print("))")

print("(defparameter *VERB-BASIC-LEVELS-LST* '(")
for k in verb_blcs:
	print("	(%s %s)" % (k, verb_blcs[k]))
print("))")


print("""

(defparameter *NOUN-BASIC-LEVELS* (make-hash-table :test #'equal))

(loop for pair in *NOUN-BASIC-LEVELS-LST*
	; if (not (null (gethash (car pair) *NOUN-BASIC-LEVELS*)))
		; do (format t "overwriting ~s BL ~s with ~s~%" (car pair) (gethash (car pair) *NOUN-BASIC-LEVELS*) (second pair))
	; Until word senses are in, we'll just not overwrite
	; anything.
	if (null (gethash (car pair) *NOUN-BASIC-LEVELS*))
		do (setf (gethash (car pair) *NOUN-BASIC-LEVELS*) (second pair)))

(defparameter *VERB-BASIC-LEVELS* (make-hash-table :test #'equal))

(loop for pair in *VERB-BASIC-LEVELS-LST*
	do (setf (gethash (car pair) *VERB-BASIC-LEVELS*) (second pair)))""")
