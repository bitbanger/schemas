import sys

from collections import defaultdict

from schema import ELFormula, Schema, Section, schema_from_file, schema_and_protos_from_file, rec_replace, rec_remove
from schema_match import prop_to_vec, grounded_schema_prop, grounded_prop, rec_get_vars, rec_get_advs, is_adv, has_suff, rec_get_pred
from el_expr import pre_arg, verb_pred, post_args
from sexpr import parse_s_expr, list_to_s_expr

def remove_advs(l):
	if not type(l) == list:
		return l

	new_l = []
	for e in l:
		if is_adv(e):
			continue
		elif type(e) == list:
			new_l.append(remove_advs(e))
		else:
			new_l.append(e)

	# if len(new_l) == 1 and type(new_l[0]) == list:
	if len(new_l) == 1:
		return new_l[0]

	return new_l

def rec_strip(l):
	if not type(l) == list:
		return l

	new_l = []
	for e in l:
		if type(e) == list:
			new_l.append(rec_strip(e))
		elif type(e) == str and len(e.split('.')) > 1:
			new_l.append(e.split('.')[0].split('_PROTO')[::-1][-1])
		else:
			new_l.append(e)

	return new_l

def flatten_list(l):
	flat_list = []
	for e in l:
		if type(e) != list:
			flat_list.append(e)
		else:
			flat_list += flatten_list(e)

	return flat_list

txt = sys.stdin.read().strip()

sch = Schema(txt)

role_types = defaultdict(lambda: 'ENTITY.N')
for formula in sch.get_section('roles').formulas:
	phi = formula.formula.formula
	if len(phi) == 2 and type(phi[0]) == str and type(phi[1]) == str:
		role_types[phi[0]] = phi[1]

def handle_formula(phi, depth=0, odd=True, skip_actor=False, parent_odd=False):
	phi = rec_replace('KA', 'TO', phi)
	phi = rec_remove('K', phi)
	phi = rec_replace('ENTITY', 'SOMETHING', phi)

	# Move "nots" after the prefix arg of what they wrap
	nots = rec_get_pred(phi, pred=lambda x: type(x) == list and len(x) == 2 and x[0] == 'NOT' and type(x[1]) == list)
	for n in nots:
		# new_not = [n[1][0], ['NOT'] + n[1][1:]]
		the_not = n[0]
		the_prop = n[1]
		the_actor = the_prop[0]
		the_pred = the_prop[1]
		the_post_args = []
		if type(the_pred) == list:
			the_post_args = the_pred[1:]
			the_pred = the_pred[0]
		the_pred = ['NOT', the_pred]
		if type(n[1][1][0]) == list:
			new_not = [n[1][0], [['NOT', n[1][1][0]]] +  n[1][1:][0][1:]]
		else:
			new_not = [n[1][0], ['NOT', n[1][1]]]
		# new_not = [the_actor] + the_pred + the_post_args
		if len(the_post_args) > 0:
			new_not = [the_actor, [the_pred, the_post_args]]
		else:
			new_not = [the_actor, the_pred]
		phi = rec_replace(n, new_not, phi)

	for var in role_types.keys():
		phi = rec_replace(var, role_types[var], phi)

	# Recursively handle (to depth 2) KA-abstractions
	kas = rec_get_pred(phi, lambda x: type(x) == list and x[0] == 'TO')
	## for ka in kas:
		# phi = rec_remove(ka, phi)

	# Separate out advs
	advs = rec_get_advs(phi)
	phi = remove_advs(phi)

	# Split out tags
	old_phi = phi
	phi = rec_strip(phi)

	# Flatten nested verb post-args into phi
	if type(old_phi[1]) == list and old_phi[1][0] != 'NOT':
		old_phi = [old_phi[0]] + old_phi[1] + old_phi[2:]
	if type(phi[1]) == list and phi[1][0] != 'NOT':
		phi = [phi[0]] + phi[1] + phi[2:]

	# white = (odd and not parent_odd)
	white = (odd and parent_odd)
	tr_bg = '#ffffff' if white else '#dddddd'

	print('<tr style="background-color: %s">' % (tr_bg))

	if not skip_actor:
		print('<td class="data">%s</td>' % (phi[0]))

	if type(phi[1]) == list:
		print('<td class="data">%s</td>' % (' '.join(phi[1])))
	else:
		print('<td class="data">%s</td>' % phi[1])

	# for arg in phi[2:]:
	if len(phi) > 2:
		if old_phi[2] in kas or (type(old_phi[2]) == list and old_phi[2][0] == 'TO'):
			if not odd:
				print('<td style="background-color: #dddddd; border: 2px black dotted;">')
			else:
				print('<td style="border: 2px black dotted;">')
			print('<table>')
			print('<tr style="text-align: left;"><th>action</th><th>arg0</th><th>arg1</th><th>adv</th></tr>')
			handle_formula(old_phi[2], skip_actor=True, depth=depth+1, parent_odd=not odd)
			print('</table>')
			print('</td>')
		elif old_phi[2][0] == 'THAT':
			if not odd:
				print('<td style="background-color: #dddddd; border: 2px black dotted;">')
			else:
				print('<td style="border: 2px black dotted;">')
			print('<table>')
			print('<tr style="text-align: left;"><th>actor</th><th>action</th><th>arg0</th><th>arg1</th><th>adv</th></tr>')
			handle_formula(old_phi[2][1:], depth=depth+1, parent_odd=not odd)
			print('</table>')
			print('</td>')
		elif type(phi[2]) == list:
			print('<td class="data">%s</td>' % ' '.join(flatten_list(phi[2])))
		else:
			print('<td class="data">%s</td>' % phi[2])
	else:
		print('<td>---</td>')
	if len(phi) > 3:
		if old_phi[3] in kas:
			if odd:
				print('<td style="background-color: #ffffff;">')
			else:
				print('<td>')
			print('<table>')
			print('<tr style="text-align: left;"><th>actor</th><th>action</th><th>arg0</th><th>arg1</th><th>adv</th></tr>')
			handle_formula(old_phi[3])
			print('</table>')
		if type(phi[3]) == list:
			print('<td>%s</td>' % ' '.join(flatten_list(phi[3])))
			print('</td>')
		else:
			print('<td>%s</td>' % phi[3])
	else:
		print('<td>---</td>')

	if len(advs) > 0:
		print('<td class="data">%s</td>' % ' '.join(rec_strip(advs[0][1])))
	else:
		print('<td>---</td>')

	print('</tr>')

print('<html>')
print('<head>')
print('''<style>
table {
	border-spacing: 5px;
}
tr:nth-child(even) {
	background-color: #dddddd;
}
td {
	width: 0px;
	white-space: nowrap;
}
td:nth-child(odd) {
	border: 1px #bbbbbb solid;
}
.data {
	color: #ee0000;
	font-weight: bold;
}
</style>''')
print('</head>')
print('<body>')
for section in [sch.get_section(name) for name in ['steps', 'goals', 'preconds']]:
	print('<h2>%s</h2>' % (section.name.upper()))
	for i in range(len(section.formulas)):
		formula = section.formulas[i]
		phi = formula.formula.formula
		print('<table style="border: 1px black solid; padding-bottom: 10px;">')
		print('<tr style="text-align: left;"><th>actor</th><th>action</th><th>arg0</th><th>arg1</th><th>adv</th></tr>')
		# handle_formula(phi, odd=(i%2!=0))
		handle_formula(phi, odd=False)
		print('</table>')
print('</body>')
print('</html>')
