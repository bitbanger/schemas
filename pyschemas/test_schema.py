import sys

from collections import defaultdict
from sexpr import parse_s_expr, list_to_s_expr as ls
from schema import Schema
from schema_search import SchemaSearcher
from schema_match import SchemaMatcher
from el_expr import *

from scipy.spatial.distance import cosine

import numpy

compos = []
with open('nesl-compos.lisp', 'r') as f:
	compos_txt = f.read()
	compos_s_expr = parse_s_expr(compos_txt)

	for c in compos_s_expr[3]:
		for e in c:
			if type(e) == list and len(e) > 0 and type(e[0]) == str and e[0].upper() == 'EPI-SCHEMA':
				compos.append(e)

def mk_test_vec(sent):
	words = sent.upper().split(' ')

	pre = words[0]
	verb = words[1]
	posts = words[2:]
	post_vecs = [vec(post) for post in posts]
	while len(post_vecs) < 2:
		post_vecs.append(numpy.zeros((300,)))

	return numpy.concatenate([vec(pre), vec(verb)] + post_vecs)

def mk_test_gr_prop(sent):
	words = sent.upper().split(' ')

	pre = words[0]
	verb = words[1]
	posts = words[2:4]

	return [pre, verb] + posts

def test():
	matcher = SchemaMatcher(compos)

	test_sents = ['BOBBY CRY']

	for test_sent in test_sents:
		print(test_sent)
		match_pairs = matcher.match_candidates(mk_test_gr_prop(test_sent))

		for pair in match_pairs:
			(schema, matched_id) = pair
			print(matched_id)
			print('%s' % (schema))

test()
