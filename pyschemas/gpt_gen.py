import argparse
import random
import subprocess
import sys
import xmlrpc.client

from collections import defaultdict
from transformers import GPT2Tokenizer

STOP_WORDS = ['{ref}', 'location', 'destination', 'object', 'entity']

server = xmlrpc.client.ServerProxy('http://localhost:8000')

tokenizer = GPT2Tokenizer.from_pretrained('distilgpt2')

PROMPT='''NOUNS: cheetah lion seal mosquito dog cat
OUTLIERS: none
CLASS: animal

NOUNS: shirt pants computer skirt dress slacks suit tie jacket
OUTLIERS: computer
CLASS: clothing

NOUNS: computer candle controller lighter cup paper
OUTLIERS: none
CLASS: object

NOUNS: husband
OUTLIERS: none
CLASS: husband

NOUNS: husband wife cat
OUTLIERS: cat
CLASS: spouse

NOUNS: theater opera
OUTLIERS: none
CLASS: venue

NOUNS: theater theater theater theater theater opera
OUTLIERS: opera
CLASS: theater

NOUNS: computer ladle cup playstation suit
OUTLIERS: none
CLASS: object

NOUNS: computer computer computer playstation playstation ladle cup suit
OUTLIERS: ladle cup suit
CLASS: electronics

NOUNS: guitar guitar guitar saxophone saxophone saxophone
OUTLIERS: none
CLASS: instrument

NOUNS: guitar guitar guitar guitar guitar saxophone
OUTLIERS: saxophone
CLASS: guitar

NOUNS: restaurant taqueria
OUTLIERS: none
CLASS: restaurant

NOUNS: rabbit rabbit rabbit dog
OUTLIERS: dog
CLASS: rabbit

NOUNS: rabbit rabbit rabbit rabbit rabbit dog cup
OUTLIERS: dog cup
CLASS: rabbit

NOUNS: monitor tv display
OUTLIERS: none
CLASS: screen

NOUNS: coat
OUTLIERS: none
CLASS: coat

NOUNS: google dog amazon yahoo netflix
OUTLIERS: dog
CLASS: website

NOUNS: %s
OUTLIERS:'''

def gen_nouns(nouns, temp=0.2, rep_pen=1.1, resp_length=128, filter_threshold=0.1, singleton_threshold=0.75):
	nouns = nouns.lower().split()

	# Remove 'entity' from nouns iff something
	# else exists in there
	nouns_copy = nouns[::]
	while 'ENTITY' in nouns_copy:
		nouns_copy.remove('ENTITY')
	if len(nouns_copy) > 0:
		nouns = nouns_copy

	noun_counts = defaultdict(int)
	for noun in nouns:
		noun_counts[noun] += 1

	new_nouns = [n for n in nouns if n not in STOP_WORDS]
	if len(new_nouns) == 0:
		new_nouns = nouns
	nouns = new_nouns
	# print('nouns are now %s' % nouns)

	# Redo noun counts
	noun_counts = defaultdict(int)
	for noun in nouns:
		noun_counts[noun] += 1

	if singleton_threshold > 0.0:
		for noun in nouns:
			if noun_counts[noun]*1.0/len(nouns) >= singleton_threshold:
				nouns = [noun]
				return noun
				break

	# Take the noun counts again, now that stop words
	# have been removed
	noun_counts = defaultdict(int)
	for noun in nouns:
		noun_counts[noun] += 1

	'''
	if filter_threshold > 0.0:
		new_nouns = []
		for noun in nouns:
			if noun_counts[noun]*1.0/len(nouns) >= filter_threshold:
				new_nouns.append(noun)
		if len(new_nouns) > 0:
			# Don't filter out nouns if nothing meets the threshold
			nouns = new_nouns
	'''
		

	nouns = ' '.join(nouns)

	inp = PROMPT % (nouns,)
	input_ids = tokenizer(inp, return_tensors='pt').input_ids

	resp = server.gen(inp, temp, rep_pen, min(2048, len(input_ids.squeeze())+resp_length))

	ret_val = resp.split('\n')[:len(inp.split('\n'))+1][-1].split(': ')[-1].replace('<|ENDOFTEXT|>', '')

	if len(ret_val.split(' ')) >= 5:
		ret_val = ret_val.split(' ')[0]

	# print('generalized %s from %s' % (ret_val, nouns))

	return ret_val

if __name__ == '__main__':
	parser = argparse.ArgumentParser(description='Complete text with GPT')

	parser.add_argument('nouns', type=str)

	parser.add_argument('--temp', type=float, default=0.2, help='Completion temperature')

	parser.add_argument('--rep_pen', type=float, default=1.1, help='Completion repetition penalty')

	parser.add_argument('--resp_length', type=int, default=128, help='Completion length, in tokens')

	parser.add_argument('--prompt_limit', type=int, default=512, help='The maximum number of tokens to use for the story generation prompt')

	parser.add_argument('--num_stories', type=int, default=5, help='The number of stories to generate')

	parser.add_argument('--num_similar', type=int, default=3, help='The number of similar stories to generate for each story, to help refine schemas')

	parser.add_argument('--similar_temp', type=float, default=0.4, help='Completion temperature for similar story generation')

	parser.add_argument('--similar_rep_pen', type=float, default=1.12, help='Completion repetition penalty for similar story generation')

	parser.add_argument('--output_dir', type=str, default='.', help='The directory to store the output story files in AFTER tokenization')

	parser.add_argument('--orig_story_dir', type=str, default='.', help='The directory to store the output story files in BEFORE tokenization')

	args = parser.parse_args()

	print(gen_nouns(args.nouns), temp=args.temp, rep_pen=args.rep_pen, resp_length=args.resp_length)
