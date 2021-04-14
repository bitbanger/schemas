# Takes a string as input representing
# a lemma with a sense key, e.g.:
#	girl%1:18:00::
# and gives the equivalent sense number
def key2num(lemma_with_key):
	from nltk.corpus import wordnet as wn
	from nltk.util import binary_search_file as _binary_search_file

	pos_num = int(lemma_with_key.split('%')[1].split(':')[0])
	pos = ["n", "v", "a", "adv", "adj-sat"][pos_num-1]

	word = lemma_with_key.split('%')[0]

	spl = _binary_search_file(wn.open('index.sense'), lemma_with_key)
	spl = spl.split()
	if not spl:
		return None
	if len(spl) < 3:
		return None

	sense_num = spl[2]

	return "%s%s.%s" % (word, sense_num, pos)

# print("girl%1:18:00::")
# print(key2num("girl%1:18:00::"))
