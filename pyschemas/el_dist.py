# Handcrafted methods for calculating the distance
# between two EL propositions. These are meant to
# improve on the disappointing results given by
# el2vec and el-s2match by emphasizing some features
# more than others.

from collections import defaultdict
from el_expr import *
from schema import ELFormula, Schema, Section, schema_from_file, schema_and_protos_from_file, rec_replace
from schema_match import grounded_schema_prop_to_vec, prop_to_vec, grounded_schema_prop, grounded_prop, rec_get_vars, rec_get_advs, is_adv, rec_get_pred
from sexpr import list_to_s_expr, parse_s_expr
