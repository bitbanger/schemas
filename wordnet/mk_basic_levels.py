import re

from mk_lisp_wn import lemma_to_el

from nltk.corpus import wordnet as wn

# Basic level files obtained from:
# https://github.com/rubenIzquierdo/basic_level_concepts
blc_noun_file = "blc.noun"
blc_verb_file = "blc.verb"

noun_blcs = dict()
verb_blcs = dict()

def rem_str(s, bad_cs):
	return ''.join([c for c in s if c not in bad_cs])

def denum_str(s):
	return rem_str(s, '0123456789')

indfile = wn.open('index.sense')

sense_num_cache = dict()

def lemma_sense_num(lemma):
	#if lemma in sense_num_cache:
		#return sense_num_cache[lemma]

	from nltk.util import binary_search_file as _binary_search_file
	spl = _binary_search_file(indfile, lemma.key())
	if not spl:
		return None
	if len(spl) < 3:
		return None

	#sense_num_cache[lemma] = spl.split()[2]
	return spl.split()[2]

def fix_split_words(grp):
	if len(grp) <= 4:
		return grp

	int_idx = -1
	for idx in range(len(grp)):
		try:
			int(grp[idx])
			int_idx = idx
		except:
			continue
	if int_idx == -1:
		return grp
	pos_idx = int_idx - 1
	pre_word = ''.join(grp[:pos_idx])
	post_word = ''.join(grp[int_idx+1:])
	grp = [pre_word, grp[pos_idx], grp[int_idx], post_word]

	return grp

true_basics = set([
	wn.synset('location.n.01'),
	wn.synset('animal.n.01'),
	wn.synset('person.n.01'),
	wn.synset('act.n.01')
])
hyp_cache = dict()
def best_basic_ss(ss):
	if ss in hyp_cache:
		return hyp_cache[ss]
	if ss in true_basics:
		return ss

	res = [ss] + list(basic_ss.closure(lambda s: s.hypernyms()))
	res_lems = [x.lemmas() for x in res]
	res_lems = [max(lems, key=lambda x: x.count()) for lems in res_lems]
	res_ss = ss
	options = [(res_lems[i], i) for i in range(len(res_lems)) if res_lems[i].count() >= 20]
	if len(options) > 2:
		res_ss = res[options[1][1]]
	elif len(options) > 0:
		if res_lems[0].count() < 20:
			res_ss = res[options[0][1]]

	hyp_cache[ss] = res_ss
	return res_ss

for line in open(blc_noun_file, 'r'):
	if not line.strip() or line[0] == "#":
		continue

	nonbasic_ss = wn.of2ss(line.split()[0] + 'n')
	basic_ss = wn.of2ss(line.split()[1] + 'n')

	continue_outer = False
	for nbl in nonbasic_ss.lemmas():
		if continue_outer:
			break

		nonbasic_grp = str(nbl)[7:-2].split('.')
		nonbasic_grp = fix_split_words(nonbasic_grp)

		nonbasic_sense_num = lemma_sense_num(nbl)
		if not nonbasic_sense_num:
			continue

		nonbasic_lem = "%s%d.%s" % (nonbasic_grp[3], int(nonbasic_sense_num), nonbasic_grp[1])


		basic_grp = str(basic_ss.lemmas()[0])[7:-2].split('.')
		basic_grp = fix_split_words(basic_grp)


		basic_sense_num = lemma_sense_num(basic_ss.lemmas()[0])
		if not basic_sense_num:
			continue_outer = True
			continue

		basic_word = str(basic_ss.lemmas()[0])[7:-2].split('.')[0]
		best_count = -1

		# basic_choices = [basic_ss] + list(basic_ss.closure(lambda s: s.hypernyms()))
		# basic_choices = [x.lemmas() for x in basic_choices]
		# basic_choices = [max(lems, key=lambda x: x.count()) for lems in basic_choices]		
		# basic_freqs = [x.count() for x in basic_choices]
		# basic_words = [str(x)[7:-2].split('.')[0] for x in basic_choices]
		basic_fixed = max(best_basic_ss(basic_ss).lemmas(), key=lambda z: z.count())
		basic_grp = str(basic_fixed)[7:-2].split('.')
		basic_grp = fix_split_words(basic_grp)
		basic_sense_num = lemma_sense_num(basic_fixed)
		if not basic_sense_num:
			continue_outer = True
			continue
		# print(basic_ss, basic_fixed)
		'''for i in range(1, len(basic_choices)):
			if basic_choices[i].count() - basic_choices[i-1].count() > 20:
				basic_grp = fix_split_words(str(basic_choices[i])[7:-2].split('.'))
				basic_sense_num = lemma_sense_num(basic_choices[i])
				basic_word = basic_words[i]
				basic_count = basic_freqs[i]
				break
		if nonbasic_grp[3] == 'cow' or nonbasic_grp[3] == 'dog':
			print(nonbasic_lem)
			print(list(zip(basic_words, basic_freqs)))
			print(basic_word, basic_count)
			print('\n')'''


		basic_lem = "%s%d.%s" % (basic_grp[3], int(basic_sense_num), basic_grp[1])
		# nonbasic_lem = "%s.%s" % (nonbasic_grp[3], nonbasic_grp[1])
		# basic_lem = "%s.%s" % (basic_grp[3], basic_grp[1])

		# print(nonbasic_lem, basic_lem)
		#if nonbasic_lem in noun_blcs and basic_lem != noun_blcs[nonbasic_lem]:
			# print('overwriting %s->%s with %s->%s' % (nonbasic_lem, noun_blcs[nonbasic_lem], nonbasic_lem, basic_lem))
		#else:
			#print('writing %s->%s' % (nonbasic_grp, basic_lem))
		nonbasic_lem = rem_str(nonbasic_lem, "'")
		basic_lem = rem_str(basic_lem, "'")

		noun_blcs[nonbasic_lem.lower()] = basic_lem.lower()

		# quit()

smallest_lhs_sense = dict()
for nonbasic in noun_blcs:
	word = ''
	for c in nonbasic:
		if c not in '0123456789':
			word = word + c
		else:
			break
	num = '0'
	for c in nonbasic:
		if c in '0123456789':
			num = num + c
	num = int(num)

	if word not in smallest_lhs_sense:
		smallest_lhs_sense[word] = (num, nonbasic)
	elif num < smallest_lhs_sense[word][0]:
		# print('replacing %s with %s' % (smallest_lhs_sense[word][1], nonbasic))
		smallest_lhs_sense[word] = (num, nonbasic)

new_lhs_words = set()
for k in smallest_lhs_sense:
	new_lhs_words.add(smallest_lhs_sense[k][1])

new_lhs_words = sorted(list(new_lhs_words))

old_noun_blcs = noun_blcs
noun_blcs = dict()
for lhs in new_lhs_words:
	if denum_str(lhs) != ".":
		noun_blcs[denum_str(lhs)] = denum_str(old_noun_blcs[lhs])
	


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
