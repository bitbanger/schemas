import os
import subprocess

from collections import defaultdict
from el_expr import is_starry, remove_advs, flatten_prop
from schema import ELFormula, Schema, Section, schema_from_file, schema_and_protos_from_file, rec_replace
from schema_match import grounded_schema_prop_to_vec, prop_to_vec, grounded_schema_prop, grounded_prop, rec_get_vars, rec_get_advs, is_adv, rec_get_pred
from scipy.spatial.distance import cosine
from sexpr import list_to_s_expr, parse_s_expr
from similar_stories import make_topical_stories

TOPIC = 'farming'

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
			continue
		step_ids_and_vecs.append((step_id, step_vec))

	schema_name_to_steps[schema_name] = step_ids_and_vecs

def get_step(schema, step_id):
	steps = schema.get_section('steps').formulas
	for j in range(len(steps)):
		if steps[j].episode_id == step_id:
			return steps[j]
	return None

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
			if type(e) == list:
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

for i in range(len(episodes)):
	orig_ep = episodes[i]
	gr_ep = gr_episodes[i]
	if gr_ep is None:
		continue
	# gr_ep = [['PERSON'], 'HARVEST', ['CORN']]
	print('gr_ep is %s' % (gr_ep,))
	# vec = grounded_schema_prop_to_vec(gr_ep)
	best_step = find_best_step(gr_ep)
	print(orig_ep)
	print('\t%s' % (best_step,))
	# quit()
