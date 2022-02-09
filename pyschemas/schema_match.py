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

def grounded_prop_to_vec(gr_prop):
	pre = gr_prop[0]
	verb = gr_prop[1]
	posts = gr_prop[2:4]

	pre_vec = vec(pre)
	verb_vec = vec(verb)
	post_vecs = [vec(p) for p in posts]
	if len(post_vecs) == 0:
		post_vecs.append(numpy.zeros(300))
	if len(post_vecs) == 1:
		post_vecs.append(numpy.zeros(300))

	print('veccing up %s, %s, %s' % (pre, verb, posts))

	return numpy.concatenate([pre_vec, verb_vec] + post_vecs)

class SchemaMatcher:
	def __init__(self, compos):
		self.schemas = [Schema(c) for c in compos]

		self.schemas_by_prop = defaultdict(list)
		self.props_by_vec = defaultdict(list)
		self.prop_vecs = []

		for i in range(len(self.schemas)):
			schema = self.schemas[i]
			print('%d / %d' % (i+1, len(self.schemas)))

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
				prop_vec = prop_to_vec(formula.formula.formula, schema)
				if prop_vec is None:
					continue

				self.schemas_by_prop[str(grounded_prop(formula.formula.formula, schema))].append(schema)

				self.prop_vecs.append(prop_vec)
				self.props_by_vec[prop_vec.tobytes()].append(str(grounded_prop(formula.formula.formula, schema)))

	def match_candidates(self, gr_prop):
		gr_vec = grounded_prop_to_vec(gr_prop)
		
		closest = k_closest(gr_vec, self.prop_vecs, 5)

		closest_props = [self.props_by_vec[c[0].tobytes()] for c in closest]

		matches = []
		for ps in closest_props:
			# print('\t%s' % [schemas_by_prop[p] for p in ps])
			# matches = matches + [schemas_by_prop[p] for p in ps]
			for p in ps:
				for schema in self.schemas_by_prop[p]:
					matches.append((schema, p))

		matches = set(matches)

		ret = []

		for match in matches:
			grounded = match[1]
			matched_formula_id = None
			for step in match[0].get_section('steps').formulas:
				if str(grounded_prop(step.formula.formula, match[0])) == str(grounded):
					matched_formula_id = step.episode_id

			# return (match[0], matched_formula_id)
			ret.append((match[0], matched_formula_id))

		return ret
