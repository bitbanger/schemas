import sys

from collections import defaultdict
from sexpr import parse_s_expr, list_to_s_expr as ls
from schema import Schema, rec_replace
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

def is_abstraction(e):
	return type(e) == list and len(e) > 1 and type(e[0]) == str and e[0].upper() in ['KA', 'KE', 'THAT', 'THT', 'TO']

def strip_tags(word):
	return word.split('.')[0]

prop_vecs = []
props_by_vec = dict()

def rec_get_pred(lst, pred=lambda x: False, dismiss_pred=lambda x: False):
	if pred(lst):
		return [lst]

	if dismiss_pred(lst):
		return []

	if type(lst) != list:
		return []

	ret_lst = []
	for e in lst:
		if pred(e):
			ret_lst.append(e)
		elif type(e) == list:
			ret_lst += rec_get_pred(e, pred=pred, dismiss_pred=dismiss_pred)

	return ret_lst

def has_suff(e, suff):
	if type(e) == str and len(e) > len(suff)+1 and len(e.split('.')) > 1 and len(e.split('.')[-1]) >= len(suff) and e.split('.')[-1][:len(suff)].lower() == suff.lower():
		return True
	else:
		return False

def is_adv(e):
	if has_suff(e, 'adv'):
		return True
	elif type(e) == list and len(e) > 1 and type(e[0]) == str and len(e[0]) >= 3 and e[0][:3].lower() == 'adv':
		return True
	else:
		return False

def rec_get_vars(lst):
	return list(set(rec_get_pred(lst, pred=lambda x: type(x) == str and x[0] == '?')))

def rec_get_advs(lst, inside_abstractions=True):
	if inside_abstractions:
		return rec_get_pred(lst, pred=is_adv)
	else:
		return rec_get_pred(lst, pred=is_adv, dismiss_pred=is_abstraction)

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

			if len(role) > 2:
				continue

			if role[1] == 'AGENT.N':
				role = [role[0], 'PERSON.N']
			if type(role[1]) != list:
				word = strip_tags(role[1])
				role_types[role[0]].append(word)
			elif len(role[1]) == 2 and role[1][0].upper() == 'PLUR' and type(role[1][1]) != list:
				word = strip_tags(role[1][1])
				role_types[role[0]].append(word)
		except:
			continue

	return role_types

def grounded_prop(prop, context_formulas, strip_dot_tags=True):
	if len(prop) == 3 and prop[1] == '**':
		prop = prop[0]

	# Flatten out nested verb+postarg expressions
	verb = prop[1]
	flat_verb = []
	got_verb = False
	for x in verb:
		if type(x) == str and x[-2:].upper() == ".V":
			got_verb = True
		if got_verb:
			flat_verb.append(x)
	verb = flat_verb

	if type(verb) == list:
		if len(verb) == 1:
			prop = [prop[0], verb[0]] + prop[2:]
		else:
			prop = [prop[0], verb[0]] + verb[1:] + prop[2:]

	inds = [prop[0]] + prop[2:]
	inds = [x for x in inds if type(x) != list]
	inds = set(inds)

	roles = defaultdict(set)
	for phi in context_formulas:
		if len(phi) == 2 and phi[0] in inds:
			role_type = phi[1]
			if type(role_type) == list and len(role_type) == 2 and role_type[0] in ['PLUR', 'K', 'KA'] and type(role_type[1]) != list:
				roles[phi[0]].add(strip_tags(role_type[1]))
			elif type(role_type) != list:
				roles[phi[0]].add(strip_tags(role_type))

	# for ind in inds:
		# print('%s: %s' % (ind, list(roles[ind])))

	gr_prop = []
	if prop[0] in inds:
		gr_prop.append(list(roles[prop[0]]))
	# print(prop[1])
	if strip_dot_tags:
		gr_prop.append(strip_tags(prop[1]))
	else:
		gr_prop.append(prop[1])
	for e in prop[2:]:
		if e in inds:
			gr_prop.append(list(roles[e]))

	return gr_prop

def grounded_schema_prop(prop, schema):
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

	# posts = [p for p in posts if type(p) != list]
	new_posts = []
	for p in posts:
		if type(p) != list:
			new_posts.append(p)
		else:
			vs = rec_get_vars(p)
			if len(vs) == 1:
				# new_posts.append(vs[0])
				# new_posts.append(rec_replace(vs[0], role_types[vs[0]], p))
				#rts = []
				#for rt in role_types[vs[0]]:
				#	rts.append(rec_replace(vs[0], rt, p))
				#new_posts.append(rts)
				new_posts.append(vs[0])
	posts = new_posts

	post_types = [role_types[x] if type(x) != list and x in role_types else x for x in posts]
	post_types = []
	for x in posts:
		if type(x) != list and x in role_types:
			post_types.append(role_types[x])
		elif type(x) != list and x not in role_types:
			post_types.append(['ENTITY'])
		else:
			post_types.append(x)

	return [pre, verb] + post_types[:2]

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

def grounded_schema_prop_to_vec(gr_prop):
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

	# print('veccing up %s, %s, %s' % (pre, verb, posts))

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
			all_formulas = all_formulas + schema.get_section('steps').formulas
			all_formulas = all_formulas + schema.get_section('roles').formulas

			for formula in all_formulas:
				prop_vec = prop_to_vec(formula.formula.formula, schema)
				if prop_vec is None:
					continue

				self.schemas_by_prop[str(grounded_schema_prop(formula.formula.formula, schema))].append(schema)

				self.prop_vecs.append(prop_vec)
				self.props_by_vec[prop_vec.tobytes()].append(str(grounded_schema_prop(formula.formula.formula, schema)))

	def match_candidates(self, gr_prop):
		gr_vec = grounded_schema_prop_to_vec(gr_prop)
		
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
				if str(grounded_schema_prop(step.formula.formula, match[0])) == str(grounded):
					matched_formula_id = step.episode_id

			# return (match[0], matched_formula_id)
			ret.append((match[0], matched_formula_id))

		return ret

	def match_story_prop(self, prop, story):
		gr_prop = grounded_prop(prop, story)
		return self.match_candidates(gr_prop)

if __name__ == '__main__':
	compos = []
	'''
	with open('nesl-compos.lisp', 'r') as f:
		compos_txt = f.read()
		compos_s_expr = parse_s_expr(compos_txt)

		for c in compos_s_expr[3]:
			for e in c:
				if type(e) == list and len(e) > 0 and type(e[0]) == str and e[0].upper() == 'EPI-SCHEMA':
					compos.append(e)
	'''
	for i in range(0, 9):
		with open('standalone-schemas/farming_%d.txt' % i, 'r') as f:
			compos_txt = f.read()
			compos_lines = compos_txt.strip().split('\n')
			compos_lines = [line.split(';')[0] for line in compos_lines]
			compos_txt = '\n'.join(compos_lines)
			compos_s_expr = parse_s_expr(compos_txt)
			compos.append(compos_s_expr[0])

	matcher = SchemaMatcher(compos)
	def cut_balanced_parens(s):
		pts = []
		count = 0
		buf = []
		for i in range(len(s)):
			c = s[i]
			if c == '(':
				count += 1
			elif c == ')':
				count -= 1
			buf.append(c)
			if i > 0 and count == 0:
				pts.append(''.join(buf))
				buf = []

		if len(buf) > 0:
			pts.append(''.join(buf))

		pts = [p for p in pts if len(p.strip()) > 0]

		return pts

	prop_and_story = ''.join(sys.stdin.read().strip().split('\n'))
	spl = cut_balanced_parens(prop_and_story)
	prop = spl[0].strip()
	story = spl[1].strip()

	pairs = matcher.match_story_prop(parse_s_expr(prop), parse_s_expr(story))

	print(pairs)
