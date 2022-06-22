from collections import defaultdict
from el_dist import el_dist, proto_name_breakdown
from el_expr import *
from el_to_amr import el_to_amr
from schema import ELFormula, Schema, Section, schema_from_file, schema_and_protos_from_file, rec_replace
from schema_match import grounded_schema_prop_to_vec, prop_to_vec, grounded_schema_prop, grounded_prop, rec_get_vars, is_adv
from el_expr import rec_get_advs, rec_get_pred
from scipy.spatial.distance import cosine
from sexpr import list_to_s_expr, parse_s_expr

def unify(prop1, prop2, context=[]):
	(pre1, pred1, posts1, advs1) = elf_breakdown(prop1)
	(pre2, pred2, posts2, advs2) = elf_breakdown(prop2)

	# Decode protoschema predicate names
	orig_proto1 = None
	orig_proto2 = None
	if '_PROTO' in pred1:
		(pred1, orig_proto1) = proto_name_breakdown(pred1)
	if '_PROTO' in pred2:
		(pred2, orig_proto2) = proto_name_breakdown(pred2)

	# print('comparing p1 %s, op1 %s, p2 %s, op2 %s' % (pred1, orig_proto1, pred2, orig_proto2))

	# Check verb matches
	verbs_match = False
	if pred1 == pred2:
		verbs_match = True
	elif pred1 == orig_proto2 and orig_proto2 is not None:
		verbs_match = True
	elif pred2 == orig_proto1 and orig_proto1 is not None:
		verbs_match = True
	elif orig_proto1 == orig_proto2 and orig_proto1 is not None:
		verbs_match = True
	if not verbs_match:
		return None

	bound = dict()
	# Align post-args (assume posts1 has no vars)
	num_posts = min(len(posts1), len(posts2))
	for i in range(num_posts):
		(post1, post2) = (posts1[i], posts2[i])
		if post2 in bound:
			continue
		bound[post2] = post1

	# Align advs
	for adv1 in advs1:
		for adv2 in advs2:
			if type(adv1) != list or type(adv2) != list:
				continue
			print('aligning %s and %s' % (adv1, adv2))
			if adv1[0] != adv2[0]:
				continue
			if adv1[1][0] != adv2[1][0]:
				continue
			(var, val) = (adv2[1][1], adv1[1][1])
			if var in bound:
				continue
			bound[var] = val

	# Align pre-arg no matter what
	bound[pre2] = pre1

	print('bound: %s' % bound)
	return bound
