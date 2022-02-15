import numpy

from collections import defaultdict

from schema import Schema, schema_from_file
from schema_match import prop_to_vec, grounded_schema_prop
from scipy.spatial import distance
from sexpr import list_to_s_expr, parse_s_expr

schema_prompt = 'feeding_pets'

schemas = []
for i in range(9):
	schemas.append(schema_from_file('standalone-schemas/%s_%d.txt' % (schema_prompt, i)))

gr_steps = []
step_vecs = []
for schema in schemas:
	for step in schema.get_section('steps').formulas:
		step = step.formula.formula

		step_vec = prop_to_vec(step, schema)
		if step_vec is None:
			continue
		step_vecs.append(step_vec)

		gr_step = grounded_schema_prop(step, schema)
		gr_steps.append(gr_step)

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

print('Generalized schema steps for topic prompt %s:' % (schema_prompt))

clusters = [list_to_s_expr(c) for c in clusters]
clusters = set(clusters)

sorted_clusters = sorted(clusters, key=lambda c: len(parse_s_expr(c)[0]), reverse=True)
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

	# TODO: choosing the max dist score of all merged clusters
	# is inaccurate, but good enough. We should really re-calculate
	# it here (or only calculate it here, honestly)
	max_dist_score = float(max(mcs, key=lambda x: float(x[1]))[1])

	all_formulas = [parse_s_expr(f) for f in list(all_formulas)]
	all_instances = [int(x) for x in list(all_instances)]

	new_clusters.append(list_to_s_expr([all_formulas, max_dist_score, all_instances]))

clusters = new_clusters

for cluster in sorted(clusters, key=lambda c: len(parse_s_expr(c)[0]), reverse=True):
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

	if len(cluster_step_idcs) <= 1:
		continue

	print('\tSeen %d time%s (avg. centroid dist. %.2f):' % (len(cluster_step_idcs), 's' if len(cluster_step_idcs) != 1 else '', cluster_dist))
	if len(options[3]) > 0:
		print('\t\t%s\n\t\t%s\n\t\t%s\n\t\t%s' % (options[0], verb, options[2], options[3]))
		print('\t\t%s' % cluster_step_idcs)
	else:
		print('\t\t%s\n\t\t%s\n\t\t%s' % (options[0], verb, options[2]))
		print('\t\t%s' % cluster_step_idcs)
