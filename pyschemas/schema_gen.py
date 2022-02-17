import numpy
import sys

from collections import defaultdict

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
		step_vecs.append(step_vec)

		step_idcs_to_schema_idcs[total_idx] = i

		schema_step_ids_to_step_idcs[i][steps[j].episode_id] = total_idx

		gr_step = grounded_schema_prop(step, schema)
		gr_steps.append(gr_step)
		ungr_steps.append(step)

		total_idx += 1


'''for i in [0, 2, 3]:
	for j in coref_edges[i].keys():
		for k in coref_edges[i][j].keys():
			if coref_edges[i][j][k]:
				print('%s and %s share arg %d' % (gr_steps[j], gr_steps[k], i))'''

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

if False:
	total_idx = 0
	for i in range(len(schemas)):
		schema = schemas[i]
		steps = schema.get_section('steps').formulas
		valid_steps = set() # Steps that got vectorized (don't try to draw coref edges between others)
		skipped = 0
		seen_in_this_schema = set()
		for j in range(len(steps)):
			step = steps[j].formula.formula

			step_vec = prop_to_vec(step, schema)
			if step_vec is None:
				skipped += 1
				continue
			valid_steps.add(j)
			# step_vecs.append(step_vec)

			# step_idcs_to_schema_idcs[total_idx] = i

			flat_ungrounded_prop = [pre_arg(step)] + [verb_pred(step)] + post_args(step)

			# for k in range(j+1, len(steps)):
			for k in range(0, j+1):
				if k not in valid_steps:
					continue
				step2 = steps[k].formula.formula
				fup2 = [pre_arg(step2)] + [verb_pred(step2)] + post_args(step2)
				if 'EAT' in flat_ungrounded_prop[1] or 'EAT' in fup2[1]:
					print(flat_ungrounded_prop, fup2)
				for k1 in range(min(len(flat_ungrounded_prop), len(fup2))):
					if k1 == 1:
						continue
					if flat_ungrounded_prop[k1] == fup2[k1]:
						absolute_step2_idx = total_idx - (j-k)
						# print('%s and %s share arg %d' % (flat_ungrounded_prop, fup2, k1))
						if 'EAT' in flat_ungrounded_prop[1] or 'EAT' in fup2[1]:
							print('(verb %s and %s) %d and %d share arg %d' % (flat_ungrounded_prop[1], fup2[1], total_idx, absolute_step2_idx, k1))
						coref_edges[k1][total_idx][absolute_step2_idx] = True
				for k1 in range(len(flat_ungrounded_prop)):
					if k1 == 1:
						continue
					for k2 in range(len(fup2)):
						if k2 == 1:
							continue

						if j == k and k1 == k2:
							continue

						if flat_ungrounded_prop[k1] == fup2[k2]:
							absolute_step2_idx = total_idx - ((j-k) - skipped)
							# print('ijk %d %d %d' % (i, j, k))
							print(flat_ungrounded_prop, fup2)
							# print(flat_ungrounded_prop[k1], fup2[k2])
							# print('gen ids are %d and %d' % (step_idcs_to_gen_idcs[j], step_idcs_to_gen_idcs[k]))
							# print('(verb %s and %s) %d and %d share args %d and %d' % (flat_ungrounded_prop[1], fup2[1], total_idx, absolute_step2_idx, k1, k2))
							# print('\tgens are %d and %d' % (step_idcs_to_gen_idcs[total_idx], step_idcs_to_gen_idcs[absolute_step2_idx]))
							coref_lhs = (total_idx, k1)
							coref_rhs = (absolute_step2_idx, k2)

							gen_lhs = (step_idcs_to_gen_idcs[total_idx], k1)
							gen_rhs = (step_idcs_to_gen_idcs[absolute_step2_idx], k2)
							# if (gen_lhs, gen_rhs) in seen_in_this_schema:
								# print('steps %d and %d (%d and %d) have already had their general coref measured in schema %d' % (total_idx, absolute_step2_idx, step_idcs_to_gen_idcs[total_idx], step_idcs_to_gen_idcs[absolute_step2_idx], i))
								# continue
							# seen_in_this_schema.add((gen_lhs, gen_rhs))

							(coref_lhs, coref_rhs) = (gen_lhs, gen_rhs)

							lhs_steps = parse_s_expr(clusters[coref_lhs[0]])[2]
							rhs_steps = parse_s_expr(clusters[coref_rhs[0]])[2]
							lhs_schemas = set([step_idcs_to_schema_idcs[int(x)] for x in lhs_steps if int(x) in step_idcs_to_schema_idcs])
							rhs_schemas = set([step_idcs_to_schema_idcs[int(x)] for x in rhs_steps if int(x) in step_idcs_to_schema_idcs])
							num_schemas = len(lhs_schemas.intersection(rhs_schemas))
							print('gen step %d has schemas %s' % (coref_lhs[0], lhs_schemas))
							print('gen step %d has schemas %s' % (coref_rhs[0], rhs_schemas))
							print('%s and %s co-refer with denominator %d' % (coref_lhs, coref_rhs, num_schemas))
							print('\t%s' % (lhs_schemas.intersection(rhs_schemas)))

							coref_lhs = (coref_lhs[0], coref_lhs[1])
							coref_rhs = (coref_rhs[0], coref_rhs[1])

							found = False
							for scc in step_coref_clusters:
								if coref_lhs in scc or coref_rhs in scc:
									if coref_lhs not in seen_in_this_schema:
										scc.append(coref_lhs)
										# scc.append((coref_lhs[0], coref_lhs[1], num_schemas))
										seen_in_this_schema.add(coref_lhs)
									if coref_rhs not in seen_in_this_schema:
										scc.append(coref_rhs)
										# scc.append((coref_rhs[0], coref_rhs[1], num_schemas))
										seen_in_this_schema.add(coref_rhs)
									found = True
									break
							if not found:
								step_coref_clusters.append(([coref_lhs, coref_rhs]))
								# step_coref_clusters.append(([(coref_lhs[0], coref_lhs[1], num_schemas), (coref_rhs[0], coref_rhs[1], num_schemas)]))

			total_idx += 1

	# print(step_coref_clusters)

	gen_sccs = [set(x) for x in step_coref_clusters]
	next_id = 'A'
	new_gen_sccs = []
	for scc in gen_sccs:
		new_gen_sccs.append((next_id, scc))
		next_id = chr(ord(next_id)+1)
	gen_sccs = new_gen_sccs

	'''
	print(step_coref_clusters)
	gen_sccs = [[e for e in scc if len(e) == 3] for scc in step_coref_clusters]
	gen_sccs = [e for e in gen_sccs if len(e) > 0]
	print(gen_sccs)
	for gen_scc in gen_sccs:
		factors = defaultdict(lambda: defaultdict(int))
		for elem in gen_scc:
			factors[(elem[0], elem[1])][elem[2]] += 1
		# print(factors)

		for coref_arg in factors.keys():
			total = 0
			total_denom = 0
			for denom in factors[coref_arg]:
				total += factors[coref_arg][denom]
				total_denom += denom
			print('%s: %d / %d' % (coref_arg, total, total_denom))


		print('-----')'''

	# Actually do the conversion below
	'''
	gen_sccs = []
	for scc in step_coref_clusters:
		# gen_idx_to_schemas = defaultdict(set)

		new_scc = set()

		for elem in scc:
			gen_idx = step_idcs_to_gen_idcs[elem[0]]
			new_scc.add((gen_idx, elem[1]))

		# gen_sccs.append(new_scc)
		# Check to see whether any of the new, generalized
		# argument coreferences fit into an existing cluster.
		# Make a new one only if they don't.
		found = False
		for gen_arg in new_scc:
			for gen_scc in gen_sccs:
				if gen_arg in gen_scc:
					for gen_arg_2 in new_scc:
						gen_scc.add(gen_arg_2)
					found = True
					break
			if found:
				break
		if not found:
			gen_sccs.append(new_scc)
	'''

	# for st_idx in range(len(gr_steps)):
		# print('%d: %s' % (st_idx, gr_steps[st_idx]))
	# print(step_coref_clusters)
	print(gen_sccs)
	next_id = 'A'
	real_arg_coref_clusters = []
	for gen_scc in gen_sccs:
		real_arg_coref_clusters.append((next_id, gen_scc))
		next_id = chr(ord(next_id)+1)

	# Convert each coref edge between two steps into one between two step clusters
	# (in a multi-graph)
	cluster_coref_edges = defaultdict(lambda: defaultdict(lambda: defaultdict(int)))
	for arg_idx in [0, 2, 3]:
		seen = set()
		for st1_idx in coref_edges[arg_idx].keys():
			for st2_idx in coref_edges[arg_idx][st1_idx].keys():
				# print('converting co-occurring steps %d and %d into clusters' % (st1_idx, st2_idx))
				# print('st1 %s, st2 %s' % (gr_steps[st1_idx], gr_steps[st2_idx]))
				if coref_edges[arg_idx][st1_idx][st2_idx]:
					# NOTE: this could fail, if there's somehow no cluster that contains a vectorized
					# step, but I can't see right now why that'd happen (not ruling it out, though)
					cl1_idx = [i for i in range(len(clusters)) if str(st1_idx) in parse_s_expr(clusters[i])[2]][0]
					cl2_idx = [i for i in range(len(clusters)) if str(st2_idx) in parse_s_expr(clusters[i])[2]][0]
					# print('got cluster idcs %d and %d' % (cl1_idx, cl2_idx))
					if cl1_idx == cl2_idx:
						continue

					schema1_idx = step_idcs_to_schema_idcs[st1_idx]
					schema2_idx = step_idcs_to_schema_idcs[st2_idx]

					if (cl1_idx, cl2_idx, schema1_idx, schema2_idx) in seen:
						continue
					# print('%d and %d share a cluster coref edge for arg %d' % (cl1_idx, cl2_idx, arg_idx))
					cluster_coref_edges[arg_idx][cl1_idx][cl2_idx] += 1
					seen.add((cl1_idx, cl2_idx, schema1_idx, schema2_idx))

	arg_coref_clusters_by_idx = defaultdict(list)
	next_id = 'A'
	for arg_idx in [0, 2, 3]:
		arg_coref_clusters = []
		for cl1_idx in cluster_coref_edges[arg_idx].keys():
			for cl2_idx in cluster_coref_edges[arg_idx][cl1_idx].keys():
				cl1 = parse_s_expr(clusters[cl1_idx])
				cl2 = parse_s_expr(clusters[cl2_idx])

				cl1_steps = [int(x) for x in cl1[2]]
				cl2_steps = [int(x) for x in cl2[2]]
				cl1_schemas = set([step_idcs_to_schema_idcs[x] for x in cl1_steps])
				cl2_schemas = set([step_idcs_to_schema_idcs[x] for x in cl2_steps])

				co_occurring_schemas = cl1_schemas.intersection(cl2_schemas)

				edge_count = cluster_coref_edges[arg_idx][cl1_idx][cl2_idx]
				certainty = edge_count * 1.0 / len(co_occurring_schemas)

				print('clusters %d and %d share arg %d with certainty %d / %d' % (cl1_idx, cl2_idx, arg_idx, cluster_coref_edges[arg_idx][cl1_idx][cl2_idx], len(co_occurring_schemas)))
				if certainty >= 0.5:
					# print('clusters %d and %d share arg %d with certainty %d / %d' % (cl1_idx, cl2_idx, arg_idx, cluster_coref_edges[arg_idx][cl1_idx][cl2_idx], len(co_occurring_schemas)))
					# find the coref cluster that contains either edge and
					# add both
					found = False
					for acc_idx in range(len(arg_coref_clusters)):
						acc = arg_coref_clusters[acc_idx]
						if cl1_idx in acc[1] or cl2_idx in acc[1]:
							found = True
							acc[1].add(cl1_idx)
							acc[1].add(cl2_idx)
							break
					if not found:
						arg_coref_clusters.append((next_id, set([cl1_idx, cl2_idx])))
						next_id = chr(ord(next_id)+1)
		# print('coref clusters for arg %d: %s' % (arg_idx, arg_coref_clusters))
		arg_coref_clusters_by_idx[arg_idx] = arg_coref_clusters

	var_options = defaultdict(set)
	sorted_clusters = sorted(clusters, key=lambda c: len(parse_s_expr(c)[0]), reverse=True)
	next_id_for_new_vars = max(gen_sccs, key=lambda x: x[0])[0]
	next_id_for_new_vars = chr(ord(next_id_for_new_vars)+1)
# print('Steps (no temporal order):')
for cluster_idx in range(len(sorted_clusters)):
	cluster = sorted_clusters[cluster_idx]
	'''
	print('CLUSTER:')
	for e in parse_s_expr(cluster):
		print('\t%s' % e)
	print('')
	'''

	options = defaultdict(set)
	verb = None
	cluster_dist = float(parse_s_expr(cluster)[1])
	cluster_step_idcs = set(parse_s_expr(cluster)[2])
	cluster = parse_s_expr(cluster)[0]


	type_counts = defaultdict(lambda: defaultdict(int))
	# Count how many times each argument type was used
	for inst_idx in cluster_step_idcs:
		inst = gr_steps[int(inst_idx)]
		for i in range(len(inst)):
			# skip the verb
			if i == 1:
				continue
			for t in inst[i]:
				type_counts[i][t] += 1

	for formula in cluster:
		verb = formula[1]
		for i in range(len(formula)):
			elem = formula[i]
			if type(elem) == list:
				for option in elem:
					if type_counts[i][option] * 1.0 / len(cluster_step_idcs) > 0.2:
						options[i].add(option)
	'''
	for arg_idx in options.keys():
		coref_clusters = arg_coref_clusters_by_idx[arg_idx]
		for coref_cluster in coref_clusters:
			if cluster_idx in coref_cluster[1]:
				print('arg %d in cluster %d is %s' % (arg_idx, cluster_idx, coref_cluster[0]))
				pass


	for arg_idx in options.keys():
		coref_cluster_id = (cluster_idx, arg_idx)
		replaced = False
		for coref_cluster in gen_sccs:
			if coref_cluster_id in coref_cluster[1]:
				# print('arg %d in cluster %d is %s' % (arg_idx, cluster_idx, coref_cluster[0]))
				for option in options[arg_idx]:
					var_options[coref_cluster[0]].add(option)
				options[arg_idx] = coref_cluster[0]
				replaced = True
				break
		if not replaced:
			for option in options[arg_idx]:
				var_options[next_id_for_new_vars].add(option)
			options[arg_idx] = next_id_for_new_vars
			next_id_for_new_vars = chr(ord(next_id_for_new_vars)+1)
	'''


	if len(cluster_step_idcs) <= 1:
		continue

	instance_schemas = set([step_idcs_to_schema_idcs[int(x)] for x in cluster_step_idcs])

	'''
	if len(options[3]) > 0:
		print('\t?%s %s ?%s ?%s' % (options[0], verb, options[2], options[3]))
		# print('\t\t%s' % cluster_step_idcs)
		# print('\t\t%s' % [step_idcs_to_schema_idcs[int(x)] for x in cluster_step_idcs])
	else:
		print('\t?%s %s ?%s' % (options[0], verb, options[2]))
		# print('\t\t%s' % cluster_step_idcs)
		# print('\t\t%s' % [step_idcs_to_schema_idcs[int(x)] for x in cluster_step_idcs])
	print('\t\t(seen %d time%s (avg. centroid dist. %.2f))' % (len(instance_schemas), 's' if len(instance_schemas) != 1 else '', cluster_dist))
	'''

'''
for var in var_options.keys():
	print('?%s: %s' % (var, var_options[var]))
'''






# NEW WORLD ORDER UNDER HERE!
# NEW ARG COREF STRAT FROM SCRATCH!

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
'''
for cluster_id in range(len(clusters)):
	cluster = clusters[cluster_id]
	print('cluster %d: %s' % (cluster_id, cluster))
	for (step_id, schema_id, ungr, gr) in cluster_steps(cluster):
		print('\t%d (schema %d): %s (%s)' % (step_id, schema_id, ungr, gr))
'''

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
for schema_id in range(len(schemas)):
	schema = schemas[schema_id]

	steps = schema.get_section('steps').formulas

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
new_steps_str = '(:Steps '
for new_step_id in range(len(new_steps)):
	new_step = new_steps[new_step_id]
	new_step_str = ''
	new_step_str = new_step_str + '(?E%d (' % (new_step_id+1)
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
	new_step_str = new_step_str + '))'

	new_steps_str = new_steps_str + new_step_str
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

