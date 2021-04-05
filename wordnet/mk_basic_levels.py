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
	(non_basic, basic) = [lemma_to_el(wn.of2ss(num+'n').lemmas()[0]) for num in line.split()[:2]]
	noun_blcs[non_basic] = basic

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
	do (setf (gethash (car pair) *NOUN-BASIC-LEVELS*) (second pair)))

(defparameter *VERB-BASIC-LEVELS* (make-hash-table :test #'equal))

(loop for pair in *VERB-BASIC-LEVELS-LST*
	do (setf (gethash (car pair) *VERB-BASIC-LEVELS*) (second pair)))""")
