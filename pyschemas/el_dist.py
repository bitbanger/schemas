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
	if strip_proto_marker(pred1) != strip_proto_marker(pred2):
		(w1, w2) = (pred1.split('.')[0], pred2.split('.')[0])
		cosine_dist = cosine(vec(w1), vec(w2))
		score = 0.5 + 0.5 * cosine_dist

	return score
