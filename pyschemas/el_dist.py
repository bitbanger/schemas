# Handcrafted methods for calculating the distance
# between two EL propositions. These are meant to
# improve on the disappointing results given by
# el2vec and el-s2match by emphasizing some features
# more than others.

from collections import defaultdict
from el_expr import *
from schema import ELFormula, Schema, Section, schema_from_file, schema_and_protos_from_file, rec_replace
from schema_match import grounded_schema_prop_to_vec, prop_to_vec, grounded_schema_prop, grounded_prop, rec_get_vars, rec_get_advs, is_adv, rec_get_pred, vec, strip_proto_marker
from sexpr import list_to_s_expr, parse_s_expr
from scipy.spatial.distance import cosine

# Returns (invoker, orig_proto) verbs
def proto_name_breakdown(proto):
	# Remove .V tag
	proto = proto.split('.')[0]

	if '_AKA_' not in proto:
		return (proto.replace('_PROTO', '') + '.V', None)

	# Split at _AKA_
	spl = proto.split('_AKA_')
	(invoker, orig_proto) = (spl[0], spl[1])
	orig_proto = orig_proto.replace('_PROTO', '')
	return (invoker + '.V', orig_proto + '.V')

# Compute the distance between two EL formulas
# in a rule-based way. Emphasize matching verbs,
# as protoschema normalization will have happened,
# and emphasize argument parity more than adverbial
# parity. Emphasize verb closeness more than argument
# closeness in general.
def el_dist(elf1, elf2):
	(pre1, pred1, posts1, advs1) = elf_breakdown(elf1)
	(pre2, pred2, posts2, advs2) = elf_breakdown(elf2)

	score = 0.0

	(invoker1, orig1) = proto_name_breakdown(pred1)
	(invoker2, orig2) = proto_name_breakdown(pred2)
	(invoker1, orig1) = (invoker1.split('.')[0], orig1.split('.')[0] if orig1 is not None else None)
	(invoker1, orig1) = (invoker1.split('_')[0], orig1.split('_')[0] if orig1 is not None else None)
	(invoker2, orig2) = (invoker2.split('.')[0], orig2.split('.')[0] if orig2 is not None else None)
	(invoker2, orig2) = (invoker2.split('_')[0], orig2.split('_')[0] if orig2 is not None else None)
	# print('going in with i1 %s, o1 %s, i2 %s, o2 %s' % (invoker1, orig1, invoker2, orig2))

	if invoker1==invoker2 or invoker1==orig2 or orig1==invoker2 or (orig1==orig2 and (orig1 is not None)):
		return 0.0

	min_score = 1.0
	for a in [invoker1, orig1]:
		for b in [invoker2, orig2]:
			try:
				cosine_dist = cosine(vec(a), vec(b))
				min_score = min(min_score, 0.5 + 0.5 * cosine_dist)
			except:
				# print('error computing cosine distance between %s and %s' % (w1, w2))
				continue

	return min_score
