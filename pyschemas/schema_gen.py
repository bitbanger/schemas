import numpy
import sys

from collections import defaultdict

from functools import cmp_to_key

from schema import Schema, schema_from_file
from schema_match import prop_to_vec, grounded_schema_prop
from scipy.spatial import distance
from sexpr import list_to_s_expr, parse_s_expr
from el_expr import pre_arg, verb_pred, post_args

schema_prompt = 'feeding_pets'
if len(sys.argv) > 1:
	schema_prompt = sys.argv[1].strip()

schemas = []
for i in range(9):
	try:
		schemas.append(schema_from_file('standalone-schemas/%s_%d.txt' % (schema_prompt, i)))
	except:
		pass
	# print(str(schemas[-1]))

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

for i in range(len(step_vecs)):
	st1 = step_vecs[i]
	# print(gr_steps[i])
	other_steps = [(step_vecs[j], gr_steps[j], j) for j in range(len(step_vecs)) if j != i]
	other_steps = sorted(other_steps, key=lambda x: distance.cosine(x[0], st1))
	last = 0

	# Do a pass to calculate the derivative of the
	# sorted cosine distances
	delta_dist = []
	for j in range(len(other_steps)):
		dist = distance.cosine(other_steps[j][0], st1)
		delta = dist-last
		if j == 0:
			delta = 0
		last = dist
		delta_dist.append(delta)

	max_delta_idx = max(range(len(delta_dist)), key=lambda i: delta_dist[i])

	cluster_vecs = [st1]
	cluster = [gr_steps[i]]
	cluster_step_idcs = set([i])

	for j in range(max_delta_idx):
		root_verb = gr_steps[i][1]
		this_verb = other_steps[j][1][1]
		if root_verb == this_verb:
			cluster.append(other_steps[j][1])
			cluster_vecs.append(other_steps[j][0])
			cluster_step_idcs.add(other_steps[j][2])
		dist = distance.cosine(other_steps[j][0], st1)
		# print('\t%.2f: %s' % (dist, other_steps[j][1]))
	# print('\t------')
	for j in range(max_delta_idx+1, len(other_steps)):
		dist = distance.cosine(other_steps[j][0], st1)
		# print('\t%.2f: %s' % (dist, other_steps[j][1]))

	# calculate avg. distance from centroid
	centroid = numpy.average(cluster_vecs, axis=0)
	avg_dist = sum([distance.cosine(x, centroid) for x in cluster_vecs]) * 1.0 / len(cluster_vecs)

	clusters.append([sorted(cluster, key=lambda x: str(x)), avg_dist, sorted(list(cluster_step_idcs))])

# print('Generalized schema steps for topic prompt %s:' % (schema_prompt))

clusters = [list_to_s_expr(c) for c in clusters]
clusters = sorted(list(set(clusters)))

sorted_clusters = sorted(list(clusters), key=lambda c: len(parse_s_expr(c)[0]), reverse=True)
handled_clusters = set()
merged_clusters = []
for i in range(len(sorted_clusters)):
	if i in handled_clusters:
		continue
	handled_clusters.add(i)
	cluster1 = parse_s_expr(sorted_clusters[i])
	instances1 = set(cluster1[2])

	merged = []

	for j in range(len(sorted_clusters)):
		if j in handled_clusters:
			continue
		cluster2 = parse_s_expr(sorted_clusters[j])
		instances2 = set(cluster2[2])

		if len(instances1.intersection(instances2)) > 0:
			merged.append(j)

	for m in merged:
		handled_clusters.add(m)

	merged_clusters.append([i] + merged)

new_clusters = []
for mc_idcs in merged_clusters:
	mc_sexps = [sorted_clusters[i] for i in mc_idcs]
	mcs = [parse_s_expr(x) for x in mc_sexps]
	all_formulas = set()
	all_instances = set()
	for mc in mcs:
		formulas = set([list_to_s_expr(x) for x in mc[0]])
		all_formulas = all_formulas.union(formulas)

		instances = set(mc[2])
		all_instances = all_instances.union(instances)

	all_formulas = sorted(list(all_formulas))
	all_instances = sorted(list(all_instances))

	# TODO: choosing the max dist score of all merged clusters
	# is inaccurate, but good enough. We should really re-calculate
	# it here (or only calculate it here, honestly)
	max_dist_score = float(max(mcs, key=lambda x: float(x[1]))[1])

	all_formulas = [parse_s_expr(f) for f in list(all_formulas)]
	all_instances = [int(x) for x in list(all_instances)]

	new_clusters.append(list_to_s_expr([all_formulas, max_dist_score, all_instances]))

clusters = sorted(new_clusters)

# Map gen cluster IDs to step IDs
gen_idcs_to_step_idcs = defaultdict(set)
for cluster_idx in range(len(clusters)):
	cluster = parse_s_expr(clusters[cluster_idx])
	for step_idx in cluster[2]:
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
		# If the step is malformed, we'll ignore it.
		step1 = flatten_schema_step(steps[step1_idx].formula.formula)
		if step1 is None:
			continue

		# If the step wasn't properly vectorized, we'll ignore it.
		if (schema_id, steps[step1_idx].episode_id) not in valid_steps:
			continue

		for step2_idx in range(step1_idx, len(steps)):
			# If the step is malformed, we'll ignore it.
			step2 = flatten_schema_step(steps[step2_idx].formula.formula)
			if step2 is None:
				continue

			# If the step wasn't properly vectorized, we'll ignore it.
			if (schema_id, steps[step2_idx].episode_id) not in valid_steps:
				continue

			if step1_idx == step2_idx:
				continue
			step1_gen_id = step_idcs_to_gen_idcs[step1_idx]
			step2_gen_id = step_idcs_to_gen_idcs[step2_idx]
			if step1_gen_id != step2_gen_id:
				# No idea why some schemas can fail to "officially"
				# instantiate the gen step, according to the gen step's
				# list of instances & the instance-idx-to-schema-idx map,
				# but this check works for now.
				if schema_id in [step_idcs_to_schema_idcs[int(x)] for x in gen_steps[step1_gen_id][2]] and schema_id in [step_idcs_to_schema_idcs[int(x)] for x in gen_steps[step2_gen_id][2]]:
					temporal_multigraph[step1_gen_id][step2_gen_id].add(schema_id)

	# Loop over steps
	# (we'll allow i==j, but only if the
	# arguments are different)
	for i in range(len(steps)):
		step1 = flatten_schema_step(steps[i].formula.formula)
		if step1 is None:
			continue
		step1_idx = schema_step_ids_to_step_idcs[schema_id][steps[i].episode_id]
		step1_gen_id = step_idcs_to_gen_idcs[step1_idx]
		for j in range(len(steps)):
			step2 = flatten_schema_step(steps[j].formula.formula)
			if step2 is None:
				continue
			step2_idx = schema_step_ids_to_step_idcs[schema_id][steps[j].episode_id]
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

	return (num*1.0 / denom) >= threshold

# Analyze the temporal multigraph to extract ordering
gen_before_rels = defaultdict(lambda: defaultdict(bool))
for step1_gen_id in sorted(temporal_multigraph.keys()):
	for step2_gen_id in sorted(temporal_multigraph[step1_gen_id].keys()):
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
			gen_before_rels[step1_gen_id][step2_gen_id] = True
		elif count < after_count:
			gen_before_rels[step2_gen_id][step1_gen_id] = True

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
			if (v, e) in coref_pairs or (e, v) in coref_pairs:
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
next_id = 'A'
arg_pairs_to_vars = dict()
for cc in coref_clusters:
	option_counts = defaultdict(int)
	options = set()

	# Associate every arg pair in the cluster with the
	# new variable name
	for e in cc:
		arg_pairs_to_vars[e] = next_id

	for e in cc:
		(gen_step_id, arg_idx) = e
		instance_ids = gen_steps[gen_step_id][2]
		instance_gr_steps = [gr_steps[inst_id] for inst_id in instance_ids]

		for instance in instance_gr_steps:
			if len(instance) > arg_idx:
				for option in instance[arg_idx]:
					option_counts[option] += 1

		for instance in instance_gr_steps:
			if len(instance) > arg_idx:
				for option in instance[arg_idx]:
					num_cluster_instances = len(instance_ids)
					option_freq = option_counts[option] * 1.0 / num_cluster_instances
					if option_freq > 0.2:
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
			options = [max(options_with_freqs, key=lambda x: x[1])[0]]

	var_options[next_id] = sorted(list(options))

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
		else:
			var_options[next_id] = new_step[arg_idx]
			new_step_str = new_step_str + '?%s' % next_id
			next_id = chr(ord(next_id)+1)
			# print(new_step[arg_idx], end='')
	new_step_str = new_step_str + ')'
	# new_step_str = new_step_str + ')'
	new_step_strings.append(new_step_str)


# Topsort steps according to the temporal ordering
handled_idcs = set()
gen_step_idcs = list(range(len(gen_steps)))
topsorted_gen_step_idcs = []
while len(handled_idcs) < len(gen_step_idcs):
	for gen_step_idx in gen_step_idcs:
		# Skip it if we've handled it
		if gen_step_idx in handled_idcs:
			continue

		# Skip it if anything unhandled happens before it
		should_skip = False
		for idx2 in gen_step_idcs:
			if idx2 != gen_step_idx and idx2 not in handled_idcs and gen_before_rels[idx2][gen_step_idx]:
				should_skip = True
				break
		if should_skip:
			continue

		# Handle it
		topsorted_gen_step_idcs.append(gen_step_idx)
		handled_idcs.add(gen_step_idx)

# Apply the topsort ordering to the new step strings
new_step_strings = [new_step_strings[i] for i in topsorted_gen_step_idcs]

new_steps_str = '(:Steps'
for i in range(len(new_step_strings)):
	nss = new_step_strings[i]
	new_steps_str = new_steps_str + ' (?E%d %s)' % (i+1, nss)
new_steps_str = new_steps_str + ')'

new_roles = '(:Roles '
var_num = 1
for var in var_options.keys():
	for option in var_options[var]:
		new_roles = new_roles + ('(!R%d (?%s %s.N))' % (var_num, var, option))
		var_num += 1
new_roles = new_roles + ')'

new_schema = '(epi-schema ((?x new_schema.v) ** ?e) %s %s)' % (new_roles, new_steps_str)

print(Schema(new_schema))

