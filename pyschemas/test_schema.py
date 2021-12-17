from sexpr import parse_s_expr
from schema import Schema

compos = []
with open('nesl-compos.lisp', 'r') as f:
	compos_txt = f.read()
	compos_s_expr = parse_s_expr(compos_txt)

	for c in compos_s_expr[3]:
		for e in c:
			if type(e) == list and len(e) > 0 and type(e[0]) == str and e[0].upper() == 'EPI-SCHEMA':
				compos.append(e)

print(str(Schema(compos[0])).upper())
