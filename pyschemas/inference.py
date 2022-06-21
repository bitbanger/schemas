import os
import subprocess
import sys

from collections import defaultdict
from el_dist import el_dist
from el_expr import is_starry, remove_advs, flatten_prop
from el_to_amr import el_to_amr
from schema import ELFormula, Schema, Section, schema_from_file, schema_and_protos_from_file, rec_replace
from schema_match import grounded_schema_prop_to_vec, prop_to_vec, grounded_schema_prop, grounded_prop, rec_get_vars, rec_get_advs, is_adv, rec_get_pred
from scipy.spatial.distance import cosine
from sexpr import list_to_s_expr, parse_s_expr
from similar_stories import make_topical_stories

def s2match(amr1, amr2):
	with open('amr1.tmp', 'w+') as f:
		f.write(amr1)
	with open('amr2.tmp', 'w+') as f:
		f.write(amr2)
	outp = subprocess.run('s2match amr1.tmp amr2.tmp'.split(' '), capture_output=True, timeout=900, input=story.encode()).stdout.decode('utf-8').strip()

	return float(outp)

# TOPICS = []
# with open('/home/lane/Code/schemas/nesl/emnlp_topics.txt', 'r') as f:
	# TOPICS = [' '.join(x.strip().split('_')) for x in f.read().strip().split('\n')]

TOPIC = ' '.join(sys.argv[1].strip().split('_'))

'''
John loved to farm.
He grew corn.
He planted seeds.
He harvested the corn.
He sold the corn.
'''

# make_story uses GPT-J to generate a story using a
# specified topic and an optional starting word.
def make_story(topic, starting_word=''):
	stories = make_topical_stories(topic, starting_word=starting_word)
	return starting_word + (' ' if len(starting_word) > 0 else '') + stories[0]

# parse_story takes a text story on multiple lines
# and parses it into EL formulas.
def parse_story(story):
	formula_txts = subprocess.run('el_parse'.split(' '), capture_output=True, timeout=900, input=story.encode()).stdout.decode('utf-8').strip().split('\n')

	formulas = [ELFormula(f) for f in formula_txts]

	return formulas

DIR = 'emnlp_clustered_schemas'

# First, load all the schemas
schema_names = []
schemas = []
for fn in os.listdir(DIR):
	fn = '%s/%s' % (DIR, fn)
	with open(fn, 'r') as f:
		schema_lines = [x.strip() for x in f.read().strip().split('\n')]
		if len(schema_lines) < 3:
			continue
		schema_name = schema_lines[0].strip()
		if schema_name in schema_names:
			# Only take the first file we find
			continue
		schema_names.append(schema_name)
		schema_txt = '\n'.join(schema_lines[1:])
		schema = Schema(schema_txt)
		schemas.append(schema)

# Next, get the step vectors for every schema
schema_step_vecs = []
for i in range(len(schemas)):
	schema_name = schema_names[i]
	schema = schemas[i]

	steps = schema.get_section('steps').formulas
	step_vecs = []
	for j in range(len(steps)):
		step = steps[j].formula.formula

		step_vec = prop_to_vec(step, schema)

		# This might be None, but to keep parity
		# with the step order, we'll add Nones
		# and ignore them during matching
		step_vecs.append(step_vec)

	schema_step_vecs.append(step_vecs)

# Map the schema names to the lists of (step, vec) pairs
schema_name_to_steps = defaultdict(list)
for i in range(len(schema_names)):
	schema_name = schema_names[i]
	step_vecs = schema_step_vecs[i]
	schema = schemas[i]

	step_ids_and_vecs = []

	steps = schema.get_section('steps').formulas
	for j in range(len(steps)):
		step_id = steps[j].episode_id
		step_vec = step_vecs[j]
		if step_vec is None:
			print('None step vec on episode %s' % (steps[j].formula.formula))
			continue
		step_ids_and_vecs.append((step_id, step_vec))

	schema_name_to_steps[schema_name] = step_ids_and_vecs

def get_step(schema, step_id):
	steps = schema.get_section('steps').formulas
	for j in range(len(steps)):
		if steps[j].episode_id == step_id:
			return steps[j]
	return None

def k_best_steps(gr_step, k=3):
	in_vec = grounded_schema_prop_to_vec(gr_step)

	score_pairs = []
	for i in range(len(schema_names)):
		schema_name = schema_names[i]
		schema = schemas[i]
		step_ids_and_vecs = schema_name_to_steps[schema_name]
		for (step_id, step_vec) in step_ids_and_vecs:
			step = get_step(schema, step_id)
			schema_gr_step = grounded_schema_prop(step.formula.formula, schema)
	
			# The distance between PERSON and a more
			# specialized subject noun can throw things
			# off a lot, so if we don't have a parsed specialized
			# type, we'll ignore the subject noun.
			score = None
			if gr_step[0] == ['PERSON'] and schema_gr_step[0] != ['PERSON']:
				score = cosine(in_vec[300:], step_vec[300:])
			else:
				# score = cosine(in_vec, step_vec)
				score = cosine(in_vec[300:], step_vec[300:])
			# print('score for %s and %s is %.2f' % (gr_step, (schema_name, schema_gr_step), score))
			score_pairs.append(((score, schema, step_id, step, schema_name), score))

	score_pairs = sorted(score_pairs, key=lambda x: x[1])
	score_pairs = score_pairs[:k]
	return_pairs = []
	for (tup, score) in score_pairs:
		new_tup = (tup[-1], tup[2], grounded_schema_prop(tup[-2].formula.formula, tup[1]))
		return_pairs.append((new_tup, score))

	return return_pairs

	# return (best_schema_name, best_step_id, grounded_schema_prop(best_step.formula.formula, best_schema))

# find_best_step returns the schema and step with the closest
# match to a grounded input step
def find_best_step(gr_step):
	in_vec = grounded_schema_prop_to_vec(gr_step)

	best_score = None
	best_schema_name = None
	best_step = None
	best_schema = None
	best_step_id = None
	# for schema_name in schema_names:
	for i in range(len(schema_names)):
		schema_name = schema_names[i]
		schema = schemas[i]
		step_ids_and_vecs = schema_name_to_steps[schema_name]
		for (step_id, step_vec) in step_ids_and_vecs:
			schema_gr_step = grounded_schema_prop(get_step(schema, step_id).formula.formula, schema)
	
			# The distance between PERSON and a more
			# specialized subject noun can throw things
			# off a lot, so if we don't have a parsed specialized
			# type, we'll ignore the subject noun.
			score = None
			if gr_step[0] == ['PERSON'] and schema_gr_step[0] != ['PERSON']:
				score = cosine(in_vec[300:], step_vec[300:])
			else:
				# score = cosine(in_vec, step_vec)
				score = cosine(in_vec[300:], step_vec[300:])
			# print('score for %s and %s is %.2f' % (gr_step, (schema_name, schema_gr_step), score))
			if (best_score is None) or (score < best_score):
				best_score = score
				best_schema = schema
				best_step_id = step_id
				best_step = get_step(schema, step_id)
				best_schema_name = schema_name
	return (best_schema_name, best_step_id, grounded_schema_prop(best_step.formula.formula, best_schema))

# Test calls
# print(find_best_step([['boy'], ['pray']]))
# print(find_best_step([['waiter'], ['serve']]))

def story_eps_and_ctx(formulas):
	episodes = []
	context = []
	dedupe_set = set()

	for f in formulas:
		if f is None or f.formula is None:
			continue

		if f in dedupe_set:
			continue
		dedupe_set.add(f)

		if is_starry(f.formula):
			episodes.append(f.formula)
		else:
			skip_outer = False
			for e in f.formula:
				if type(e) == list and e[0] not in ['PLUR', 'K', 'KA']:
					skip_outer = True
					break
			if skip_outer:
				continue
			context.append(f.formula)

	gr_episodes = []
	for ep in episodes:
		no_adv_ep = remove_advs(ep[0])
		try:
			gr_ep = grounded_prop(no_adv_ep, context)
			gr_ep = rec_replace('AGENT', 'PERSON', gr_ep)
			gr_episodes.append(gr_ep)
		except TypeError:
			# This can be caused by non-atomic
			# individuals, like kinds, not being
			# supported by the "grounding" operation
			gr_episodes.append(None)

	return (episodes, gr_episodes, context)

def match():
	formulas = parse_story(make_story(TOPIC, starting_word='John'))
	episodes = []
	context = []
	dedupe_set = set()

	for f in formulas:
		if f is None or f.formula is None:
			continue

		if f in dedupe_set:
			continue
		dedupe_set.add(f)

		if is_starry(f.formula):
			print('ep: %s' % (f.formula))
			episodes.append(f.formula)
		else:
			skip_outer = False
			for e in f.formula:
				if type(e) == list and e[0] not in ['PLUR', 'K', 'KA']:
					skip_outer = True
					break
			if skip_outer:
				continue
			print('\tctx: %s' % (f.formula))
			context.append(f.formula)

	gr_episodes = []
	for ep in episodes:
		print('grounding %s' % ep[0])
		no_adv_ep = remove_advs(ep[0])
		print('flattened ep: %s' % ep)
		try:
			gr_ep = grounded_prop(no_adv_ep, context)
			gr_ep = rec_replace('AGENT', 'PERSON', gr_ep)
			print('gr_ep is %s' % (gr_ep,))
			gr_episodes.append(gr_ep)
		except TypeError:
			# This can be caused by non-atomic
			# individuals, like kinds, not being
			# supported by the "grounding" operation
			gr_episodes.append(None)

	# Map each episode to the K best matching schema formulas,
	# and their scores and parent schemas. Also, add each schema
	# in each list to a global set to choose from.
	k_best = defaultdict(list)
	seen_schemas = set()
	for i in range(len(episodes)):
		orig_ep = episodes[i]
		gr_ep = gr_episodes[i]
		if gr_ep is None:
			continue
		# gr_ep = [['PERSON'], 'HARVEST', ['CORN']]
		print('gr_ep is %s' % (gr_ep,))
		# vec = grounded_schema_prop_to_vec(gr_ep)
		# best_step = find_best_step(gr_ep)
		best_steps = k_best_steps(gr_ep, k=5)
		print(orig_ep)
		for best_step in best_steps:
			seen_schemas.add(best_step[0][0])
			k_best[i].append(best_step)
			print('\t%.2f: %s' % (best_step[1], best_step[0]))
		# print('\t%s' % (best_step,))
		# quit()

	# For each seen schema, find the cumulative cost
	# of mapping each step observed to that schema.
	# If there is no match to a step, treat the cost
	# as 1.0 (out of 1.0). We'll minimize the cost to
	# choose which schema is most likely to fit.
	best_cost = None
	best_schema_name = None
	for schema_name in seen_schemas:
		cost = 0.0
		for i in range(len(episodes)):
			top_k = k_best[i]
			min_cost_for_match = 1.0
			for match in top_k:
				if match[0][0] == schema_name:
					if match[1] < min_cost_for_match:
						min_cost_for_match = match[1]
			cost += min_cost_for_match
		if best_cost is None or cost < best_cost:
			best_cost = cost
			best_schema_name = schema_name

	print('best schema for input topic %s is %s (cost %.2f)' % (TOPIC, best_schema_name, best_cost))


def skolemize_step(phi, schema):
	for rc in schema.get_section('roles').formulas:
		rc = rc.formula.formula
		sk = rc[1].split('.')[0] + '.SK'
		phi = rec_replace(rc[0], sk, phi)

	return phi

def extract_individuals(formulas):
	inds = defaultdict(set)
	for phi in formulas:
		phi = phi.formula
		if len(phi) == 2 and type(phi[0]) == str:
			# handle K and PLUR
			if type(phi[1]) == list:
				if len(phi[1]) == 2 and type(phi[1][1]) == str and phi[0] in ['K', 'PLUR']:
					phi[1] = phi[1][1]
				else:
					continue
			# make sure this isn't an episode variable
			if '.' in phi[0] and (phi[0] != 'E' or phi[1] not in '0123456789'):
				inds[phi[0]].add(phi[1])
			# inds.add(phi[0])
			
	return inds

def match_individuals_to_schema(inds, schema):
	# schema_vars = rec_get_vars(schema.s_expr)
	schema_vars = defaultdict(list)
	for rc in schema.get_section('roles').formulas:
		schema_vars[rc.formula.formula[0]].append(rc.formula.formula[1])

	return schema_vars

# For each schema, generate a story on that topic and
# find the best assignment of story formulas to the
# schema, assuming we know the schema fits a priori.
for i in range(len(schemas)):
	if schema_names[i] != '_'.join(TOPIC.split(' ')):
		continue

	name = schema_names[i]

	print('\n\n-----------------')
	print(name)
	print('')

	topic = ' '.join(name.split('_'))

	schema = schemas[i]
	print(schema)
	step_ids_and_vecs = schema_name_to_steps[name]
	print(step_ids_and_vecs)

	for rc in schema.get_section('roles').formulas:
		print('\t%s' % (rc.formula.formula))
	print('')

	print('role bindings:')
	print(match_individuals_to_schema(None, schema))

	story = make_story(topic, starting_word='John')
	print(story)
	formulas = parse_story(story)
	inds = extract_individuals(formulas)
	# print(formulas)
	print('inds:')
	print(inds)
	inds = extract_individuals(formulas)
	(episodes, gr_episodes, context) = story_eps_and_ctx(formulas)

	for j in range(len(gr_episodes)):
		gr_ep = gr_episodes[j]
		if gr_ep is None:
			continue

		print('%s' % (episodes[j]))
		ep_amr = el_to_amr(episodes[j][0])
		# print('%s' % (gr_ep))

		ep_vec = grounded_schema_prop_to_vec(gr_ep)

		for (step_id, step_vec) in step_ids_and_vecs:
			step = get_step(schema, step_id)
			gr_step = grounded_schema_prop(step.formula.formula, schema)
			step_amr = el_to_amr(skolemize_step(step.formula.formula, schema))
			# score = s2match(ep_amr, step_amr)
			score = el_dist(step.formula.formula, episodes[j][0])

			# score = cosine(ep_vec, step_vec)
			# print('\t%.2f: %s' % (score, gr_step))
			print('\t%.2f: %s' % (score, step.formula.formula))
