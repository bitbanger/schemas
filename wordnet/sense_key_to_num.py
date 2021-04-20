# Takes a string as input representing
# a lemma with a sense key, e.g.:
#	girl%1:18:00::
# and gives the equivalent sense number
def key2num(lemma_with_key):
	from nltk.corpus import wordnet as wn
	from nltk.util import binary_search_file as _binary_search_file

	pos_num = int(lemma_with_key.split('%')[1].split(':')[0])
	pos = ["n", "v", "a", "adv", "adj-sat"][pos_num-1]

	(word, rest) = lemma_with_key.split('%')
	rest_spl = rest.split(':')

	# if we have an adjective satellite
	if rest_spl[-2]:
		# word becomes head adjective
		word = rest_spl[-2]
		# sense index becomes head index
		rest_spl[2] = rest_spl[-1]
		# blank out the satellite fields
		rest_spl[-2] = ''
		rest_spl[-1] = ''

	lemma_with_key = '%s%%%s' % (word, ':'.join(rest_spl))

	spl = _binary_search_file(wn.open('index.sense'), lemma_with_key)
	if not spl:
		return None
	spl = spl.split()
	if not spl:
		return None
	if len(spl) < 3:
		return None

	sense_num = spl[2]

	return "%s%s.%s" % (word, sense_num, pos)

if __name__ == '__main__':
	print(key2num("girl%1:18:00::"))
	print(key2num('great%3:00:00:good:01'))
	print(key2num('everyday%3:00:00:familiar:02'))
	print(key2num('nervous%3:00:00:tense:03'))
