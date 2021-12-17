from sexpr import parse_s_expr, list_to_s_expr as ls
from schema import Schema
from schema_search import SchemaSearcher

compos = []
with open('nesl-compos.lisp', 'r') as f:
	compos_txt = f.read()
	compos_s_expr = parse_s_expr(compos_txt)

	for c in compos_s_expr[3]:
		for e in c:
			if type(e) == list and len(e) > 0 and type(e[0]) == str and e[0].upper() == 'EPI-SCHEMA':
				compos.append(e)

# print(str(Schema(compos[0])).upper())
# schema = Schema(compos[0])

compos = [Schema(compo) for compo in compos]

ss = SchemaSearcher(compos)

for schema in ss.schemas_by_role_preds(['BOY.N', 'BALL.N']):
	print(schema)
