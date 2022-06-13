import os

from collections import defaultdict
from schema import ELFormula, Schema, Section, schema_from_file, schema_and_protos_from_file, rec_replace
from schema_match import grounded_schema_prop_to_vec, prop_to_vec, grounded_schema_prop, grounded_prop, rec_get_vars, rec_get_advs, is_adv, has_suff, rec_get_pred
from scipy.spatial.distance import cosine
from sexpr import list_to_s_expr, parse_s_expr

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
			score = cosine(in_vec, step_vec)
			if (best_score is None) or (score < best_score):
				best_score = score
				best_schema = schema
				best_step_id = step_id
				best_step = get_step(schema, step_id)
				best_schema_name = schema_name
	return (best_schema_name, best_step_id, grounded_schema_prop(best_step.formula.formula, best_schema))

# Test calls
print(find_best_step([['boy'], ['pray']]))
print(find_best_step([['waiter'], ['serve']]))
