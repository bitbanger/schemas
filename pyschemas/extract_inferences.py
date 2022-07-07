import os
import subprocess
import sys

from collections import defaultdict
from el_unify import unify
from el_dist import el_dist, proto_name_breakdown
from el_expr import is_starry, remove_advs, flatten_prop, rec_get_advs, rec_get_pred
from el_to_amr import el_to_amr
from schema import ELFormula, Schema, Section, schema_from_file, schema_and_protos_from_file, rec_replace
from schema_match import grounded_schema_prop_to_vec, prop_to_vec, grounded_schema_prop, grounded_prop, rec_get_vars, is_adv
# from scipy.spatial.distance import cosine
from sexpr import list_to_s_expr, parse_s_expr
from similar_stories import make_topical_stories

DIR = 'inference_results/'

names = []
orig_schemas = []
filled_schemas = []

for fn in os.listdir(DIR):
	if len(sys.argv) > 1 and fn.split('.')[0] != sys.argv[1]:
		continue
	story = ''
	with open(DIR+fn, 'r') as f:
		spl = f.read().split('Filled schema:\n')
		if len(spl) < 2:
			continue
		sch_txt = spl[-1].strip()
		sch = Schema(sch_txt)
		filled_schemas.append(sch)

		names.append(fn.split('.')[0])

		story = '\n'.join(spl[0].split('\n\n')[0].split('\n')[1:])

		with open('emnlp_clustered_schemas/' + fn, 'r') as f2:
			orig_sch = Schema('\n'.join(f2.read().split('\n')[1:]).strip())
			orig_schemas.append(orig_sch)

for i in range(len(orig_schemas)):
	(orig, filled) = (orig_schemas[i], filled_schemas[i])

	unique_inferences = set()
	for sec_name in orig.sections_by_name:
		if sec_name == 'episode-relations':
			continue

		orig_formulas = orig.get_section(sec_name).formulas
		filled_formulas = filled.get_section(sec_name).formulas

		for j in range(len(orig_formulas)):
			(orig_phi, filled_phi) = (orig_formulas[j], filled_formulas[j])
			if str(orig_phi) != str(filled_phi):
				unique_inferences.add(str(filled_phi.formula))

	if i > 0:
		print('')
	print(names[i])
	print(filled_schemas[i])
	print('---')
	print(story)
	# for inference in unique_inferences:
		# print('\t%s' % inference)
