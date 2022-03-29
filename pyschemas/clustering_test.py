import numpy
import os
import sys

from kneed import KneeLocator

from collections import defaultdict

from functools import cmp_to_key

from schema import ELFormula, Schema, schema_from_file, schema_and_protos_from_file
from schema_match import prop_to_vec, grounded_schema_prop, grounded_prop
from scipy.spatial import distance
from sexpr import list_to_s_expr, parse_s_expr

from sklearn.cluster import KMeans
from sklearn.metrics import calinski_harabasz_score as ch_score

from el_expr import pre_arg, verb_pred, post_args

FREQ_THRESHOLD = 3
VAR_FREQ_THRESHOLD = 3
OPTION_FREQ = 0.5

MERGE_ALL_PRE_ARGS = False
# MERGE_ALL_PRE_ARGS = True

ADD_PROTO_TAGS = True

FLOAT_UP_PROTO_FORMULAS = True

BANNED_ROLE_TYPES = {
	'{REF}',
	'DESTINATION',
	'LOCATION',
	'ENTITY',
	'OBJECT',
	'AGENT'
}

def rec_contains(lst, val):
	for e in lst:
		if e == val:
			return True
		elif type(e) == list:
			if rec_contains(e, val):
				return True

	return False

def rec_get_vars(lst):
	vs = []
	for e in lst:
		if type(e) == str and len(e) >= 2 and e[0] == '?':
			vs.append(e)
		elif type(e) == list:
			vs = vs + rec_get_vars(e)

	return list(set(vs))

schema_prompt = 'feeding_pets'
if len(sys.argv) > 1:
	schema_prompt = sys.argv[1].strip()

schemas = []
schema_proto_maps = []
for f in os.listdir('tmp-with-protos/'):
	if len(f) <= len(schema_prompt) or f[:len(schema_prompt)] != schema_prompt:
		continue
	# schemas.append(schema_from_file('tmp-standalones/%s' % f))
	(compo, proto_pairs) = schema_and_protos_from_file('tmp-with-protos/%s' % f)
	schemas.append(compo)

	proto_map = dict()
	for proto_pair in proto_pairs:
		(orig_proto_name, proto) = proto_pair
		# print('orig: %s' % orig_proto_name)
		proto_verb = verb_pred(proto.header_formula)
		proto_map[proto_verb] = proto
	schema_proto_maps.append(proto_map)

'''
schemas = []
for i in range(9):
	try:
		schemas.append(schema_from_file('tmp-standalones/%s_%d.txt' % (schema_prompt, i)))
	except:
		pass
	# print(str(schemas[-1]))
'''

coref_edges = defaultdict(lambda: defaultdict(lambda: defaultdict(bool)))

step_coref_clusters = []

ungr_steps = []
gr_steps = []
step_vecs = []
step_idcs_to_schema_idcs = dict()
schema_step_ids_to_step_idcs = defaultdict(lambda: defaultdict(int))
valid_steps = set()
total_idx = 0
for i in range(len(schemas)):
	schema = schemas[i]
	steps = schema.get_section('steps').formulas
	for j in range(len(steps)):
		step = steps[j].formula.formula

		step_vec = prop_to_vec(step, schema)
		if step_vec is None:
			continue

		# valid_steps.add(j)
		valid_steps.add((i, steps[j].episode_id))

		step_vecs.append(step_vec)

		step_idcs_to_schema_idcs[total_idx] = i

		schema_step_ids_to_step_idcs[i][steps[j].episode_id] = total_idx

		gr_step = grounded_schema_prop(step, schema)
		gr_steps.append(gr_step)
		ungr_steps.append(step)

		total_idx += 1

clusters = []

step_vecs = numpy.array(step_vecs)

# Normalize EL vectors so that Euclidean distance is
# linearly correlated to cosine distance, allowing us
# to use the Euclidean KMeans and CH distance in sklearn
length = numpy.sqrt((step_vecs**2).sum(axis=1))[:,None]
step_vecs = step_vecs / length

ch_dists = []

cluster_maps = []

MIN_CLUSTERS = 4
MAX_CLUSTERS = 20

for n in range(MIN_CLUSTERS, MAX_CLUSTERS):
	try:
		kmeans = KMeans(n_clusters=n).fit(step_vecs)
		# print(kmeans.labels_)
		grs_by_cluster = defaultdict(list)
		for i in range(len(step_vecs)):
			grs_by_cluster[kmeans.labels_[i]].append(i)
		cluster_maps.append(grs_by_cluster)
		# ch_dists.append(ch_score(step_vecs, kmeans.labels_))
		ch_dists.append(kmeans.inertia_)
		# ch_dists.append(ch_score(step_vecs, kmeans.labels_))
	except:
		break

import matplotlib.pyplot as plt

xpoints = numpy.array(list(range(MIN_CLUSTERS, MAX_CLUSTERS)))
ypoints = numpy.array(ch_dists)

cnum = KneeLocator(xpoints, ypoints, curve='convex', direction='decreasing').knee

'''
for label in range(cnum+MIN_CLUSTERS):
	print('cluster %d:' % (label))
	for gr in cluster_maps[cnum][label]:
		print('\t%s' % gr)
'''

clusters = []
for label in range(cnum+MIN_CLUSTERS):
	cluster_step_idcs = []

	for step_idx in cluster_maps[cnum][label]:
		cluster_step_idcs.append(step_idx)

	# Remove steps that don't have the majority verb
	verb_freqs = defaultdict(int)
	for gr_step in [gr_steps[i] for i in cluster_step_idcs]:
		verb_freqs[gr_step[1]] += 1
	best_verb = max([gr_step[1] for gr_step in [gr_steps[i] for i in cluster_step_idcs]], key=lambda x: verb_freqs[x])
	cluster_step_idcs = [idx for idx in cluster_step_idcs if gr_steps[idx][1] == best_verb]

	# Form the cluster
	avg_dist = ypoints[cnum]
	cluster_vecs = [step_vecs[i] for i in cluster_step_idcs]
	cluster_grs = [gr_steps[i] for i in cluster_step_idcs]

	cluster = [sorted(cluster_grs, key=lambda x: str(x)), avg_dist, sorted(list(cluster_step_idcs))]

	clusters.append(cluster)

clusters = [list_to_s_expr(c) for c in clusters]
clusters = sorted(list(set(clusters)))

# Map gen cluster IDs to step IDs
gen_idcs_to_step_idcs = defaultdict(set)
for cluster_idx in range(len(clusters)):
	cluster = parse_s_expr(clusters[cluster_idx])
	# print(cluster)
	for step_idx in cluster[2]:
		# print('adding step %s to gen step %s' % (step_idx, cluster_idx))
		gen_idcs_to_step_idcs[cluster_idx].add(int(step_idx))

# Map step IDs to gen cluster IDs
step_idcs_to_gen_idcs = dict()
for cluster_idx in gen_idcs_to_step_idcs.keys():
	for step_idx in gen_idcs_to_step_idcs[cluster_idx]:
		step_idcs_to_gen_idcs[step_idx] = cluster_idx

def cluster_steps(cluster):
	step_ids = cluster[2]
	grs = [gr_steps[sid] for sid in step_ids]
	ungrs = [ungr_steps[sid] for sid in step_ids]
	schemas = [step_idcs_to_schema_idcs[sid] for sid in step_ids]

	return [(step_ids[i], schemas[i], ungrs[i], grs[i]) for i in range(len(step_ids))]

# Convert cluster s-expressions into better representations
new_clusters = [parse_s_expr(c) for c in clusters]
new_clusters = [[c[0], float(c[1]), [int(x) for x in c[2]]] for c in new_clusters]
gen_steps = new_clusters

# Make a multigraph where vertices are of the form
# 	(genstep id, arg idx)
# and an edge is drawn between (A, I) and (B, J)
# for each schema instantiating both A and B where
# I and J are given by the same schema variable.
# ---
# The "certainty" of a co-reference determination
# between (A, I) and (B, J) is given by the ratio
# of the number of edges linking them to the number
# of schemas instantiating both A and B.
# ---
# Once a certainty threshold T is met, the co-reference
# determination between (A, I) and (B, J) is made. Once
# all co-reference determinations have been made, clusters
# are formed and assigned variable names in the final schema.

# The graph dictionary is indexed like [A][I][B][J]
# and its values are sets of schema IDs. Each schema
# ID in the set represents an edge between (A, I) and
# (B, J). We use a set so that a schema can only link
# two arguments once, to penalize repetition within
# a single schema, which is common when using GPT.
multigraph = defaultdict(lambda: defaultdict(lambda: defaultdict(lambda: defaultdict(set))))

# We're also going to build a *directed* multigraph for
# temporal ordering between the steps. Vertices are
# single step IDs for gen step clusters, and each edge
# represents a "happens-before" relationship between two
# general step instances in one specific schema that
# instantiates them both.

# This graph dictionary is indexed like [A][B] and its values,
# as in the coref multigraph, are sets of schemas, each of
# which schemas represents an edge A->B indicating that A
# happened before B in that schema.
temporal_multigraph = defaultdict(lambda: defaultdict(set))

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

def remove_advs(l):
	if not type(l) == list:
		return l

	new_l = []
	for e in l:
		if not is_adv(e):
			new_l.append(e)

	if len(new_l) == 1 and type(new_l[0]) == list:
		return new_l[0]

	return new_l

def flatten_schema_step(step):
	if type(step) == list and len(step) == 1 and type(step[0]) == list:
		return flatten_schema_step(step[0])

	step = remove_advs(step)

	pre_arg = step[0]
	vp = remove_advs(step[1])
	posts = step[2:]

	verb_posts = []
	verb_pred = None
	if type(vp) == str:
		verb_pred = vp
	elif type(vp) == list:
		for e in vp:
			if has_suff(e, 'v'):
				verb_pred = e
			elif type(e) == list:
				got_verb_pred = False
				for e2 in e:
					if has_suff(e2, 'v'):
						got_verb_pred = True
						verb_pred = e2
				if not got_verb_pred:
					verb_posts.append(e)
			else:
				verb_posts.append(e)

	if verb_pred is None:
		return None

	verb_pred = verb_pred.split('.')[0]

	return [pre_arg, verb_pred] + verb_posts + posts

# Loop over each schema, then each pair of steps,
# then each pair of arguments.
edges = set()
all_temporal_eps = set()
for schema_id in range(len(schemas)):
	# print('testing schema %d' % (schema_id))
	schema = schemas[schema_id]

	steps = schema.get_section('steps').formulas

	'''
	# Index all of the schema's episode relations
	# (the BEFORE and AFTER ones, anyway) to use
	# for the temporal analysis below.
	schema_temporal_graph = defaultdict(lambda: defaultdict(bool))
	for ep_rel in schema.get_section('episode-relations').formulas:
		a = ep_rel.formula.formula[0]
		rel = ep_rel.formula.formula[1][0]
		b = ep_rel.formula.formula[1][1]
		if rel.upper() == 'BEFORE':
			schema_temporal_graph[a][b] = True
		elif rel.upper() == 'AFTER':
			schema_temporal_graph[b][a] = True
	'''

	# TODO: build an actual time graph instead of using
	# the implicit order from the linearization of steps.
	schema_temporal_graph = defaultdict(lambda: defaultdict(bool))
	for step1_idx in range(len(steps)):
		abs1_idx = schema_step_ids_to_step_idcs[schema_id][steps[step1_idx].episode_id]

		if step_idcs_to_schema_idcs[abs1_idx] != schema_id:
			continue
		if abs1_idx not in step_idcs_to_gen_idcs.keys():
			continue

		# If the step is malformed, we'll ignore it.
		step1 = flatten_schema_step(steps[step1_idx].formula.formula)
		if step1 is None:
			continue

		# If the step wasn't properly vectorized, we'll ignore it.
		if (schema_id, steps[step1_idx].episode_id) not in valid_steps:
			continue

		for step2_idx in range(step1_idx, len(steps)):
			abs2_idx = schema_step_ids_to_step_idcs[schema_id][steps[step2_idx].episode_id]

			if step_idcs_to_schema_idcs[abs2_idx] != schema_id:
				continue
			if abs2_idx not in step_idcs_to_gen_idcs.keys():
				continue

			# If the step is malformed, we'll ignore it.
			step2 = flatten_schema_step(steps[step2_idx].formula.formula)
			if step2 is None:
				continue

			# If the step wasn't properly vectorized, we'll ignore it.
			if (schema_id, steps[step2_idx].episode_id) not in valid_steps:
				continue

			if step1_idx == step2_idx:
				continue
			step1_gen_id = step_idcs_to_gen_idcs[abs1_idx]
			step2_gen_id = step_idcs_to_gen_idcs[abs2_idx]
			if step1_gen_id != step2_gen_id:
				# No idea why some schemas can fail to "officially"
				# instantiate the gen step, according to the gen step's
				# list of instances & the instance-idx-to-schema-idx map,
				# but this check works for now.
				# if schema_id in [step_idcs_to_schema_idcs[int(x)] for x in gen_steps[step1_gen_id][2]] and schema_id in [step_idcs_to_schema_idcs[int(x)] for x in gen_steps[step2_gen_id][2]]:
					# if schema_id not in temporal_multigraph[step1_gen_id][step2_gen_id]:
						# print('%s before %s in schema %d' % (gr_steps[abs1_idx], gr_steps[abs2_idx], schema_id))
						# print(schemas[schema_id])
					temporal_multigraph[step1_gen_id][step2_gen_id].add(schema_id)

	# Loop over steps
	# (we'll allow i==j, but only if the
	# arguments are different)
	for i in range(len(steps)):
		if i not in step_idcs_to_gen_idcs.keys():
			continue
		step1 = flatten_schema_step(steps[i].formula.formula)
		if step1 is None:
			continue
		step1_idx = schema_step_ids_to_step_idcs[schema_id][steps[i].episode_id]
		if step1_idx not in step_idcs_to_gen_idcs.keys():
			continue
		step1_gen_id = step_idcs_to_gen_idcs[step1_idx]
		for j in range(len(steps)):
			if j not in step_idcs_to_gen_idcs.keys():
				continue
			step2 = flatten_schema_step(steps[j].formula.formula)
			if step2 is None:
				continue
			step2_idx = schema_step_ids_to_step_idcs[schema_id][steps[j].episode_id]
			if step2_idx not in step_idcs_to_gen_idcs.keys():
				continue
			step2_gen_id = step_idcs_to_gen_idcs[step2_idx]

			# OK, now we can do coreference indexing:

			# Loop over pairs of arguments
			for k1 in range(len(step1)):
				if k1 == 1:
					continue
				for k2 in range(len(step2)):
					if k2 == 1:
						continue
					if step1_gen_id == step2_gen_id and k1 == k2:
						continue

					# Draw an edge for the schema between the args
					if step1[k1] == step2[k2]:
						multigraph[step1_gen_id][k1][step2_gen_id][k2].add(schema_id)
						edges.add((step1_gen_id, k1, step2_gen_id, k2, schema_id))

def coref_certainty(gen1_id, arg1_idx, gen2_id, arg2_idx):
	schema_edges = multigraph[step1_gen_id][arg1_idx][step2_gen_id][arg2_idx]

	# Find all schemas that contain instances of both general steps
	step1_gen = gen_steps[step1_gen_id]
	step2_gen = gen_steps[step2_gen_id]
	step1_schemas = set([step_idcs_to_schema_idcs[x] for x in step1_gen[2]])
	step2_schemas = set([step_idcs_to_schema_idcs[x] for x in step2_gen[2]])
	both_schemas = step1_schemas.intersection(step2_schemas)

	return (len(schema_edges), len(both_schemas))

def corefers(gen1_id, arg1_idx, gen2_id, arg2_idx, threshold=0.5):
	(num, denom) = coref_certainty(gen1_id, arg1_idx, gen2_id, arg2_idx)
	if denom == 0:
		return None

	return (num*1.0 / denom) >= threshold

# Analyze the temporal multigraph to extract ordering
gen_before_rels = defaultdict(lambda: defaultdict(bool))
all_gen_ids = set()
for step1_gen_id in sorted(temporal_multigraph.keys()):
	for step2_gen_id in sorted(temporal_multigraph[step1_gen_id].keys()):
		all_gen_ids.add(step1_gen_id)
		all_gen_ids.add(step2_gen_id)
		# Find all schemas that contain instances of both general steps
		step1_gen = gen_steps[step1_gen_id]
		step2_gen = gen_steps[step2_gen_id]
		step1_schemas = set([step_idcs_to_schema_idcs[x] for x in step1_gen[2]])
		step2_schemas = set([step_idcs_to_schema_idcs[x] for x in step2_gen[2]])
		both_schemas = step1_schemas.intersection(step2_schemas)

		# Count how many schemas ranked step1 before step2
		count = len(temporal_multigraph[step1_gen_id][step2_gen_id])
		after_count = len(temporal_multigraph[step2_gen_id][step1_gen_id])
		if count > after_count:
			# print('step %s before step %s (%d to %d)' % (gen_steps[step1_gen_id][0][0], gen_steps[step2_gen_id][0][0], count, after_count))
			gen_before_rels[step1_gen_id][step2_gen_id] = True
		elif count < after_count:
			# print('step %s after step %s (%d to %d)' % (gen_steps[step1_gen_id][0][0], gen_steps[step2_gen_id][0][0], after_count, count))
			gen_before_rels[step2_gen_id][step1_gen_id] = True

if MERGE_ALL_PRE_ARGS:
	for schema_id in range(len(schemas)):
		# for gen_id_1 in all_gen_ids:
			# for gen_id_2 in all_gen_ids:
		for gen_id_1 in range(len(gen_steps)):
			for gen_id_2 in range(len(gen_steps)):
				if gen_id_1 != gen_id_2:
					multigraph[gen_id_1][0][gen_id_2][0].add(schema_id)
					edges.add((gen_id_1, 0, gen_id_2, 0, schema_id))

# Analyze the coref multigraph to form clusters
coref_pairs = set()

for step1_gen_id in sorted(multigraph.keys()):
	for arg1_idx in sorted(multigraph[step1_gen_id].keys()):
		for step2_gen_id in sorted(multigraph[step1_gen_id][arg1_idx].keys()):
			for arg2_idx in sorted(multigraph[step1_gen_id][arg1_idx][step2_gen_id].keys()):
				if corefers(step1_gen_id, arg1_idx, step2_gen_id, arg2_idx):
					v = (step1_gen_id, arg1_idx)
					e = (step2_gen_id, arg2_idx)
					# print('%d in %s corefers with %d in %s' % (v[1], gen_steps[v[0]][0][0], e[1], gen_steps[e[0]][0][0]))
					coref_pairs.add((v, e))


# print('\n\n-----------\n\n')

coref_vtcs = set()
for (v, e) in coref_pairs:
	coref_vtcs.add(v)
	coref_vtcs.add(e)

coref_clusters = []
for v in coref_vtcs:
	found = False
	for cc in coref_clusters:
		for e in cc:
			if (v, e) in coref_pairs or (e, v) in coref_pairs or (MERGE_ALL_PRE_ARGS and e[1] == 0 and v[1] == 0):
				cc.add(v)
				found = True
				break
		if found:
			break
	if not found:
		coref_clusters.append(set([v]))

# Now that we've formed coreference clusters, we'll
# take reasonably high-frequency role types for them
# for the roles section of the new generalized schema.
var_options = defaultdict(list)
weighted_var_options = defaultdict(list)
next_id = 'A'
arg_pairs_to_vars = dict()
var_option_counts = defaultdict(lambda: defaultdict(int))
for cc in coref_clusters:
	option_counts = defaultdict(int)
	options = set()

	# When tallying option frequencies, don't double-count
	# any from the same schema, because the type really only
	# "occurs" once, in the :Roles section of the schema.
	seen_schema_insts = set()

	# Associate every arg pair in the cluster with the
	# new variable name
	for e in cc:
		arg_pairs_to_vars[e] = next_id

	for e in cc:
		(gen_step_id, arg_idx) = e
		instance_ids = gen_steps[gen_step_id][2]
		instance_ungr_steps = [gr_steps[inst_id] for inst_id in instance_ids]
		instance_gr_steps = [gr_steps[inst_id] for inst_id in instance_ids]

		for i in range(len(instance_gr_steps)):
			instance_id = instance_ids[i]
			schema_inst_id = step_idcs_to_schema_idcs[instance_id]
			if schema_inst_id in seen_schema_insts:
				continue
			else:
				seen_schema_insts.add(schema_inst_id)

			instance = instance_gr_steps[i]
			ungr_instance = instance_ungr_steps[i]
			if len(instance) > arg_idx:
				for option in instance[arg_idx]:
					option_counts[option] += 1

		'''
		for instance in instance_gr_steps:
			if len(instance) > arg_idx:
				for option in instance[arg_idx]:
					num_cluster_instances = len(instance_ids)
					option_freq = option_counts[option] * 1.0 / num_cluster_instances
					if option_freq > OPTION_FREQ:
						print('option %s was observed %d out of %d times' % (option, option_counts[option], num_cluster_instances))
						options.add(option)
		# If no options are frequent enough, take the highest
		# frequency one
		if len(options) == 0:
			options_with_freqs = []
			for instance in instance_gr_steps:
				if len(instance) > arg_idx:
					for option in instance[arg_idx]:
						num_cluster_instances = len(instance_ids)
						option_freq = option_counts[option] * 1.0 / num_cluster_instances
						options_with_freqs.append((option, option_freq))
			if len(options_with_freqs) > 0:
				options.add(max(options_with_freqs, key=lambda x: x[1])[0])
		'''

	options = [x for x in option_counts.keys() if (option_counts[x] * 1.0 / len(schemas)) >= OPTION_FREQ]
	options = [x for x in options if x not in BANNED_ROLE_TYPES]

	if len(options) == 0:
		if len(option_counts.keys()) > 0:
			options = [max(option_counts.keys(), key=lambda x: option_counts[x])]
		else:
			options = ['ENTITY']

	var_options[next_id] = sorted(list(options))

	var_option_counts[next_id] = option_counts
	print('next id is %s, options are %s, counts are %s' % (next_id, var_options, var_option_counts))

	next_id = chr(ord(next_id)+1)

# Reform gen_steps to have sets of variable options
new_steps = []
for gen_step in gen_steps:
	options = defaultdict(set)
	for inst_form in gen_step[0]:
		for arg_idx in range(len(inst_form)):
			if arg_idx == 1:
				continue
			for option in inst_form[arg_idx]:
				if option not in BANNED_ROLE_TYPES:
					options[arg_idx].add(option)

	new_step = []
	for arg_idx in sorted(options.keys()):
		new_step.append(sorted(list(options[arg_idx])))

	# TODO: update this if the verbs are ever allowed to differ
	new_step = [new_step[0], gen_step[0][0][1]] + new_step[1:]

	new_steps.append(new_step)

# Now print out the cluster steps with the new variables subbed in
# for the argument indices that have been scooped into coref clusters.
new_step_strings = []
used_vars = set()
for new_step_id in range(len(new_steps)):
	new_step = new_steps[new_step_id]
	new_step_str = ''
	# new_step_str = new_step_str + '(?E%d (' % (new_step_id+1)
	new_step_str = new_step_str + '('
	for arg_idx in range(len(new_step)):
		if arg_idx > 0:
			new_step_str = new_step_str + ' '
		if arg_idx == 1:
			new_step_str = new_step_str + '%s.V' % new_step[arg_idx]
			continue
		if (new_step_id, arg_idx) in arg_pairs_to_vars:
			new_step_str = new_step_str + '?%s' % arg_pairs_to_vars[(new_step_id, arg_idx)]
			# We're removing role constraints that don't contain vars
			# used by high-frequency steps, so if this is a high-frequency
			# step, save the var for that culling later.
			if len(gen_steps[new_step_id][2]) > VAR_FREQ_THRESHOLD:
				used_vars.add(arg_pairs_to_vars[(new_step_id, arg_idx)])
		else:
			# This arg stands alone, but it needs a new
			# name and a list of options across all schemas.
			# print('standalone for %s:' % next_id)
			for form in gen_steps[new_step_id][0]:
					if arg_idx in range(len(form)):
						for option in form[arg_idx]:
							var_option_counts[next_id][option] += 1
			var_options[next_id] = new_step[arg_idx]
			new_step_str = new_step_str + '?%s' % next_id
			if len(gen_steps[new_step_id][2]) > VAR_FREQ_THRESHOLD:
				used_vars.add(next_id)
			next_id = chr(ord(next_id)+1)
			# print(new_step[arg_idx], end='')
	new_step_str = new_step_str + ')'
	# new_step_str = new_step_str + ')'
	new_step_strings.append(new_step_str)

# Topsort steps according to the temporal ordering
handled_idcs = set()
gen_step_idcs = list(range(len(gen_steps)))
topsorted_gen_step_idcs = []
skip_counts = defaultdict(int)
while len(handled_idcs) < len(gen_step_idcs):
	for gen_step_idx in gen_step_idcs:
		# Skip it if we've handled it
		if gen_step_idx in handled_idcs:
			continue

		# Skip it if anything unhandled happens before it
		should_skip = False
		for idx2 in gen_step_idcs:
			if idx2 != gen_step_idx and idx2 not in handled_idcs and gen_before_rels[idx2][gen_step_idx]:
				if skip_counts[idx2] == 0:
					# Mark events as handled if we've seen them more than once
					# (i.e., if they're part of a cycle)
					should_skip = True
				skip_counts[idx2] += 1
				break
		if should_skip:
			continue

		# Handle it
		topsorted_gen_step_idcs.append(gen_step_idx)
		handled_idcs.add(gen_step_idx)

# Apply the topsort ordering to the new step strings, and
# filter out gen steps that didn't have at least 3 instances
filtered_gen_step_idcs = [i for i in topsorted_gen_step_idcs if len(gen_steps[i][2]) > FREQ_THRESHOLD]
new_step_strings = [new_step_strings[i] for i in filtered_gen_step_idcs]

proto_float_formulas = defaultdict(list)
proto_float_rcs = set()

for i in range(len(new_step_strings)):
	nss = new_step_strings[i]
	ns = parse_s_expr(nss)
	for inst_idx in gen_steps[filtered_gen_step_idcs[i]][2]:
		schema_idx = step_idcs_to_schema_idcs[inst_idx]
		vp = verb_pred(ungr_steps[inst_idx])
		if vp in schema_proto_maps[schema_idx]:
			if ADD_PROTO_TAGS and 'PROTO' not in ns[1]:
				proto = schema_proto_maps[schema_idx][vp]

				proto_header = proto.header_formula
				mapping = dict()
				if len(ns) != len(proto_header):
					continue
				for j in range(len(ns)):
					if j == 1:
						continue
					proto = proto.bind_var(proto_header[j], ns[j])

				for sec in ['goals', 'preconds', 'postconds']:
					for formula in proto.get_section(sec).formulas:
						proto_float_formulas[sec].append(formula.formula)
						# Get constraints on the variables to float up
						# to the roles section as well
						formula_vars = rec_get_vars(formula.formula.formula)
						seen_fvs = set()
						while len(seen_fvs) < len(set(formula_vars)):
							for fv in formula_vars:
								if fv in seen_fvs:
									continue
								for rc in proto.get_section('roles').formulas:
									if rec_contains(rc.formula.formula, fv):
										# print('\t%s' % (rc.formula.formula))
										proto_float_rcs.add(list_to_s_expr(rc.formula.formula))
										for rc_var in rec_get_vars(rc.formula.formula):
											if rc_var not in formula_vars:
												formula_vars.append(rc_var)
								seen_fvs.add(fv)
					
				ns = [ns[0], '%s_PROTO.V' % (ns[1].split('.')[0])] + ns[2:]
				break
	new_step_strings[i] = list_to_s_expr(ns)

# Render the new role constraint s-expressions back to lists
proto_float_rcs = [parse_s_expr(x) for x in proto_float_rcs]

new_steps_str = '(:Steps'
made_steps = set()
for i in range(len(new_step_strings)):
	nss = new_step_strings[i]

	# Don't make duplicate steps
	if nss in made_steps:
		continue
	else:
		made_steps.add(nss)

	new_steps_str = new_steps_str + ' (?E%d %s)' % (i+1, nss)
new_steps_str = new_steps_str + ')'

new_roles = '(:Roles '
var_num = 1
for var in var_options.keys():
	if var not in used_vars:
		continue
	for option in var_options[var]:
		print('option %s for var %s has count %d' % (option, var, var_option_counts[var][option]))
		if option[0] == '?':
			continue
		new_roles = new_roles + ('(!R%d (?%s %s.N))' % (var_num, var, option))
		var_num += 1
new_roles = new_roles + ')'

new_schema = '(epi-schema ((?x new_schema.v) ** ?e) %s %s)' % (new_roles, new_steps_str)

# print(Schema(new_schema))
new_schema = Schema(new_schema)

# Add proto formulas (preconds, postconds, goals...)
if FLOAT_UP_PROTO_FORMULAS:
	for sec_name in proto_float_formulas.keys():
		for formula in proto_float_formulas[sec_name]:

			new_schema.get_section(sec_name).add_formula(formula)
	for pfrc in proto_float_rcs:
		pfrc_vars = rec_get_vars(pfrc)
		has_banned_role_type = any([rec_contains(pfrc, '%s.N' % val) for val in BANNED_ROLE_TYPES])
		constrained = any([rec_contains(parse_s_expr(str(new_schema.get_section('roles'))), var) for var in pfrc_vars])
		if (not has_banned_role_type) or (not constrained):
			new_schema.get_section('roles').add_formula(pfrc)

final_var_to_role_map = defaultdict(set)
for var in rec_get_vars(parse_s_expr(str(new_schema.get_section('roles')))):
	for formula in new_schema.get_section('roles').formulas:
		if rec_contains(formula.formula.formula, var) and len(formula.formula.formula) == 2 and type(formula.formula.formula[1]) == str:
			final_var_to_role_map[var].add(formula.formula.formula[1])

prefix_vars = set()
for step in new_schema.get_section('steps').formulas:
	prefix_vars.add(step.formula.formula[0])

prefix_vars_to_merge = []
for pfv in prefix_vars:
	if final_var_to_role_map[pfv] == {'PERSON.N'}:
		prefix_vars_to_merge.append(pfv)

new_schema_s_expr = parse_s_expr(str(new_schema))

if len(prefix_vars_to_merge) > 1 and MERGE_ALL_PRE_ARGS:
	for pfvtm in prefix_vars_to_merge[1:]:
		new_schema_s_expr = rec_replace(pfvtm, prefix_vars_to_merge[0], new_schema_s_expr)
new_schema = Schema(list_to_s_expr(new_schema_s_expr))

print('(%s)' % new_schema)
# for step in new_schema.get_section('steps').formulas:
	# print(str(step.formula.formula[0]))

for var in final_var_to_role_map.keys():
	print(var)
	for role in final_var_to_role_map[var]:
		print('\t%s' % role)
	print(var_option_counts[var[1:]])
