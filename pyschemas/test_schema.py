import sys

from collections import defaultdict
from sexpr import parse_s_expr, list_to_s_expr as ls
from schema import Schema
from schema_search import SchemaSearcher
from el_expr import *

compos = []
with open('nesl-compos.lisp', 'r') as f:
	compos_txt = f.read()
	compos_s_expr = parse_s_expr(compos_txt)

	for c in compos_s_expr[3]:
		for e in c:
			if type(e) == list and len(e) > 0 and type(e[0]) == str and e[0].upper() == 'EPI-SCHEMA':
				compos.append(e)

def strip_tags(word):
	return word.split('.')[0]

for i in range(10):
	# print(str(Schema(compos[i])).upper())
	schema = Schema(compos[i])

	role_types = defaultdict(list)

	for formula in schema.get_section('roles').formulas:
		role = formula.formula.formula
		if type(role[0]) != str:
			continue

		if role[1] == 'AGENT.N':
			role = [role[0], 'PERSON.N']
		if type(role[1]) != list:
			word = strip_tags(role[1])
			role_types[role[0]].append(word)
		elif len(role[1]) == 2 and role[1][0].upper() == 'PLUR':
			word = strip_tags(role[1][1])
			role_types[role[0]].append(word)

	for formula in schema.get_section('steps').formulas:
		try:
			pre = role_types[pre_arg(formula.formula.formula)]
			if pre is None:
				continue

			verb = verb_pred(formula.formula.formula)
			if verb is None:
				continue
			verb = strip_tags(verb)

			posts = post_args(formula.formula.formula)
			if posts is None:
				continue

			post_types = [role_types[x] for x in posts]

			print('\tpre-arg: %s' % pre)
			print('\tverb: %s' % verb)
			print('\tpost-args: %s' % (post_types,))
			print('')
		except:
			continue

compos = [Schema(compo) for compo in compos]

ss = SchemaSearcher(compos)

# preds = sys.argv[1:]

# for schema in ss.schemas_by_role_preds(preds):
	# print(schema)
