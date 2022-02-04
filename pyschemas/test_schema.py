import sys

from collections import defaultdict
from sexpr import parse_s_expr, list_to_s_expr as ls
from schema import Schema
from schema_search import SchemaSearcher
from el_expr import *

from scipy.spatial.distance import cosine

import numpy

import xmlrpc.client
w2v_client = xmlrpc.client.ServerProxy('http://localhost:8414')

def sim(w1, w2):
	return w2v_client.word2vec_similarity(w1, w2)

def vec(w):
	if type(w) == list:
		if len(w) == 0:
			return None

		vecs = []
		for e in w:
			vec = w2v_client.vector(e)
			if len(vec) > 0:
				vecs.append(vec)
		vecs = numpy.asarray(vecs)
		if len(vecs) == 0:
			return numpy.array([])
		return vecs.mean(axis=0)
	else:
		return numpy.asarray(w2v_client.vector(w))

compos = []
with open('nesl-compos.lisp', 'r') as f:
	compos_txt = f.read()
	compos_s_expr = parse_s_expr(compos_txt)

	for c in compos_s_expr[3]:
		for e in c:
			if type(e) == list and len(e) > 0 and type(e[0]) == str and e[0].upper() == 'EPI-SCHEMA':
				compos.append(e)

def strip_tags(word):
	return word.split('.')[0]

prop_vecs = []
props_by_vec = dict()

def k_closest(prop_vec, prop_vecs, k):
	dist_pairs = []
	for vec in prop_vecs:
		dist = cosine(prop_vec, vec)

		if len(dist_pairs) < k:
			dist_pairs.append((vec, dist))
		else:
			worst = 0
			worst_idx = -1
			for i in range(len(dist_pairs)):
				pair = dist_pairs[i]
				if pair[1] > worst:
					worst_idx = i
					worst = pair[1]

			if worst > dist:
				dist_pairs = dist_pairs[:worst_idx] + dist_pairs[worst_idx+1:]
				dist_pairs.append((vec, dist))

	return dist_pairs

def mk_prop_vec(pre, verb, posts):
	pre_vec = vec(pre)
	verb_vec = vec(verb)
	post_vecs = [vec(x) for x in posts]
	post_vecs = [x for x in post_vecs if len(x) > 0]

	if len(post_vecs) == 0:
		post_vecs.append(numpy.zeros(pre_vec.shape))

	return numpy.concatenate([pre_vec, verb_vec, post_vecs[0]])

def get_role_types(schema):
	role_types = defaultdict(list)

	role_formulas = []
	try:
		role_formulas = schema.get_section('roles').formulas
	except:
		return role_types

	for formula in role_formulas:
		try:
			role = formula.formula.formula
			if type(role[0]) != str:
				continue

			if role[1] == 'AGENT.N':
				role = [role[0], 'PERSON.N']
			if type(role[1]) != list:
				word = strip_tags(role[1])
				role_types[role[0]].append(word)
			elif len(role[1]) == 2 and role[1][0].upper() == 'PLUR':
				word = strip_tags(role[1][1])
				role_types[role[0]].append(word)
		except:
			continue

	return role_types

def grounded_prop(prop, schema):
	role_types = get_role_types(schema)

	try:
		pre = role_types[pre_arg(prop)]
	except:
		return None

	verb = verb_pred(prop)
	posts = post_args(prop)[:2]

	if pre is None or len(pre) == 0:
		return None

	if verb is None:
		return None

	verb = strip_tags(verb)

	if posts is None:
		return None

	# print('\tpre-arg: %s' % pre)
	# print('\tverb: %s' % verb)
	# print('\tpost-args: %s' % (posts,))

	posts = [p for p in posts if type(p) != list]

	post_types = [role_types[x] for x in posts]

	return [pre, verb, post_types[:2]]

def prop_to_vec(prop, schema):
	role_types = get_role_types(schema)

	try:
		pre = role_types[pre_arg(prop)]
	except:
		return None

	verb = verb_pred(prop)
	posts = post_args(prop)[:2]

	if pre is None or len(pre) == 0:
		return None

	if verb is None:
		return None

	verb = strip_tags(verb)

	if posts is None:
		return None

	# print('\tpre-arg: %s' % pre)
	# print('\tverb: %s' % verb)
	# print('\tpost-args: %s' % (posts,))

	posts = [p for p in posts if type(p) != list]

	post_types = [role_types[x] for x in posts]

	pre_vec = vec(pre)
	verb_vec = vec(verb)

	post_vecs = [vec(x) for x in post_types]
	post_vecs = [x for x in post_vecs if x is not None and len(x) > 0]
	if len(post_vecs) == 0:
		post_vecs = [numpy.zeros(pre_vec.shape), numpy.zeros(pre_vec.shape)]
	elif len(post_vecs) == 1:
		post_vecs = post_vecs + [numpy.zeros(pre_vec.shape)]

	vecs = [pre_vec, verb_vec] + post_vecs

	final = numpy.concatenate(vecs)

	if len(final) != 1200:
		return None

	return final

def mk_test_vec(sent):
	words = sent.upper().split(' ')

	pre = words[0]
	verb = words[1]
	posts = words[2:]
	post_vecs = [vec(post) for post in posts]
	while len(post_vecs) < 2:
		post_vecs.append(numpy.zeros((300,)))

	return numpy.concatenate([vec(pre), vec(verb)] + post_vecs)

def test():
	schemas = [Schema(c) for c in compos]

	schemas_by_prop = defaultdict(list)
	props_by_vec = defaultdict(list)
	prop_vecs = []

	for i in range(len(schemas)):
		schema = schemas[i]
		print('%d / %d' % (i+1, len(schemas)))

		all_formulas = []
		try:
			all_formulas = all_formulas + schema.get_section('steps').formulas
		except:
			pass
		try:
			all_formulas = all_formulas + schema.get_section('roles').formulas
		except:
			pass

		for formula in all_formulas:
			# print('formula: %s' % formula.formula.formula)
			# print('vec: %s' % prop_to_vec(formula.formula.formula, schema))
			# schemas_by_prop_vec[prop_to_vec(formula.formula.formula, schema)].append(schema)

			prop_vec = prop_to_vec(formula.formula.formula, schema)
			if prop_vec is None:
				continue

			schemas_by_prop[str(formula.formula.formula)].append(schema)

			prop_vecs.append(prop_vec)
			props_by_vec[prop_vec.tobytes()].append(str(grounded_prop(formula.formula.formula, schema)))

	# test_vec = numpy.concatenate([vec('MAN'), vec('EAT'), vec('STEAK'), numpy.zeros(vec('STEAK').shape)])
	test_sents = ['MAN EAT STEAK', 'GIRL GO PARK', 'DOG RUN']

	for test_sent in test_sents:
		print(test_sent)

		test_vec = mk_test_vec(test_sent)
		
		closest = k_closest(test_vec, prop_vecs, 5)

		closest_props = [props_by_vec[c[0].tobytes()] for c in closest]

		for p in closest_props:
			print('\t%s' % p)

test()
