import sys

from collections import defaultdict

from schema import ELFormula, Schema, Section, schema_from_file, schema_and_protos_from_file, rec_replace, rec_remove
from schema_match import prop_to_vec, grounded_schema_prop, grounded_prop, rec_get_vars, rec_get_advs, is_adv, rec_get_pred, is_abstraction
from el_expr import pre_arg, verb_pred, post_args
from sexpr import parse_s_expr, list_to_s_expr

PRINT_GOALS = True
PRINT_PRECONDS = True
PRINT_POSTCONDS = True
PRINT_STEPS = True

def remove_advs(l, inside_abstractions=False):
	if not type(l) == list:
		return l

	if is_abstraction(l) and not inside_abstractions:
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

sch_name = ' '.join(txt.split('\n')[0].strip().split('_'))
txt = '\n'.join(txt.split('\n')[1:])

sch = Schema(txt)

role_types = defaultdict(lambda: 'ENTITY.N')
for formula in sch.get_section('roles').formulas:
	phi = formula.formula.formula
	if len(phi) == 2 and type(phi[0]) == str and type(phi[1]) == str:
		role_types[phi[0]] = phi[1]

def handle_formula(phi, depth=0, odd=True, skip_actor=False, parent_odd=False, rei=''):
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
		if the_actor[0] != '?':
			the_pred = the_prop
			the_actor = None
		the_post_args = []
		if type(the_pred) == list:
			the_post_args = the_pred[1:]
			the_pred = the_pred[0]
		the_pred = ['NOT', the_pred]
		# new_not = [the_actor] + the_pred + the_post_args
		if len(the_post_args) > 0:
			if the_actor is not None:
				new_not = [the_actor, [the_pred, the_post_args]]
			else:
				new_not = [the_pred, the_post_args]
		else:
			if the_actor is not None:
				new_not = [the_actor, the_pred]
			else:
				new_not = [the_pred]
		phi = rec_replace(n, new_not, phi)

	for var in role_types.keys():
		phi = rec_replace(var, role_types[var], phi)

	# Recursively handle (to depth 2) KA-abstractions
	kas = rec_get_pred(phi, lambda x: type(x) == list and x[0] == 'TO')
	## for ka in kas:
		# phi = rec_remove(ka, phi)

	# Separate out advs
	advs = rec_get_advs(phi, inside_abstractions=depth>0)
	phi = remove_advs(phi, inside_abstractions=depth>0)

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
	white = True
	tr_bg = '#ffffff' if white else '#dddddd'

	data_class = 'data' if depth==0 else 'inner_data'

	print('<tr style="background-color: %s">' % (tr_bg))

	if rei != '':
		print('<td class="%s">%s</td>' % (data_class, rei))

	if not skip_actor:
		print('<td class="%s">%s</td>' % (data_class, phi[0]))

	if type(phi[1]) == list:
		print('<td class="%s">%s</td>' % (data_class, ' '.join(phi[1])))
	else:
		print('<td class="%s">%s</td>' % (data_class, phi[1]))

	# for arg in phi[2:]:
	if len(phi) > 2:
		if old_phi[2] in kas or (type(old_phi[2]) == list and old_phi[2][0] == 'TO'):
			if not odd:
				print('<td style="background-color: #eeeeee; border: 2px black dotted;">')
			else:
				print('<td style="border: 2px black dotted;">')
			print('<table>')
			print('<tr style="text-align: left;"><th>rei</th><th>action</th><th>arg0</th><th>arg1</th><th>adv</th></tr>')
			handle_formula(old_phi[2], skip_actor=True, depth=depth+1, parent_odd=not odd, rei='TO')
			print('</table>')
			print('</td>')
		elif old_phi[2][0] == 'THAT':
			if not odd:
				print('<td style="background-color: #eeeeee; border: 2px black dotted;">')
			else:
				print('<td style="border: 2px black dotted;">')
			print('<table>')
			print('<tr style="text-align: left;"><th>rei</th><th>actor</th><th>action</th><th>arg0</th><th>arg1</th><th>adv</th></tr>')
			handle_formula(old_phi[2][1:], depth=depth+1, parent_odd=not odd, rei='THAT')
			print('</table>')
			print('</td>')
		elif type(phi[2]) == list:
			print('<td class="%s">%s</td>' % (data_class, ' '.join(flatten_list(phi[2]))))
		else:
			print('<td class="%s">%s</td>' % (data_class, phi[2]))
	else:
		print('<td>---</td>')
	if len(phi) > 3:
		if old_phi[3] in kas:
			if odd:
				print('<td style="background-color: #ffffff;">')
			else:
				print('<td>')
			print('<table>')
			print('<tr style="text-align: left;"><th>rei</th><th>actor</th><th>action</th><th>arg0</th><th>arg1</th><th>adv</th></tr>')
			handle_formula(old_phi[3], rei='TO')
			print('</table>')
		if type(phi[3]) == list:
			print('<td class="%s">%s</td>' % (data_class, ' '.join(flatten_list(phi[3]))))
			# print('</td>')
		else:
			print('<td class="%s">%s</td>' % (data_class, phi[3]))
	else:
		print('<td>---</td>')

	if len(advs) > 0:
		print('<td class="%s">%s</td>' % (data_class, ' '.join(rec_strip(advs[0][1]))))
	else:
		print('<td>---</td>')

	print('</tr>')

print('<html>')
print('<head>')
print('''<style>
table {
	border-spacing: 5px;
	margin-bottom: 20px;
}
tr:nth-child(even) {
	background-color: #dddddd;
}
td {
	width: 0px;
	white-space: nowrap;
	border: 1px #bbbbbb solid;
}
td:nth-child(odd) {
}
.data {
	color: #009900;
	font-weight: bold;
}
.inner_data {
	color: #0000ee;
	font-weight: bold;
}
</style>''')
print('</head>')
print('<body>')
# for section in [sch.get_section(name) for name in ['steps', 'goals', 'preconds']]:
total_goal_num = 0
total_precond_num = 0
total_step_num = 0
total_postcond_num = 0
for section in [sch.get_section(name) for name in ['steps']]:
	# print('<h2>%s</h2>' % (section.name.upper()))
	for i in range(len(section.formulas)):
		formula = section.formulas[i]
		step_id = formula.episode_id
		phi = formula.formula.formula

		# Get all ep-rels that relate to our step
		want_eps = set()
		for er in sch.get_section('episode-relations').formulas:
			er = er.formula.formula
			if er[2] == step_id:
				want_eps.add(er[0])


		relevant_formulas = defaultdict(list)

		# Find all eps related to our step
		for sec_name2 in ['goals', 'preconds', 'postconds']:
			section2 = sch.get_section(sec_name2)
			for formula2 in section2.formulas:
				if formula2.episode_id in want_eps:
					relevant_formulas[sec_name2].append(formula2.formula.formula)

		if PRINT_STEPS:
			total_step_num += 1
			print('<div style="display: inline-block; padding: 15px; border: 3px black dotted; background-color: rgb(0, 0, 255, 0.1);">')
			print('<table style="border: 1px black solid; padding-bottom: 10px; background-color: #dddddd; margin-left: auto; margin-right: auto;">')
			print('<tr style="text-align: left;"><th>actor</th><th>action</th><th>arg0</th><th>arg1</th><th>adv</th></tr>')
			# handle_formula(phi, odd=(i%2!=0))
			handle_formula(phi, odd=False)
			print('</table>')

			print('<h2 style="padding: 5px; border: 1px black dotted; background-color: rgb(0,0,0,0.1); border-radius: 8px; padding-bottom: 10px; text-align: center;">often occurs in the situation <span style="font-style: italic; color: rgb(210,0,0);">%s</span></h2>' % sch_name)

			print('<hr />')

			print('<div style="display: flex;">')
			print('<form>')
			labels = ['Strongly Disagree', 'Disagree', 'Neutral', 'Agree', 'Strongly Agree']
			for k in range(1, 6):
				label = labels[k-1]
				print('<label for="step-%d-%d" style="float: left; padding: 0 1em; text-align: center;">%s <br /> <input type="radio" name="step-%d-eval" value="%d" id="step-%d-%d"></label>' % (total_step_num, k, label, total_step_num, k, total_step_num, k))
				# print('<label for="inference-%d">%d</label>' % (k, k))
			print('</form>')
			print('</div>')

			print('</div>')
			print('<br />'*3)
		if PRINT_GOALS and len(relevant_formulas['goals']) > 0:
			for j in range(len(relevant_formulas['goals'])):
				goal = relevant_formulas['goals'][j]
				total_goal_num += 1
				print('<div style="display: inline-block; padding: 15px; border: 3px black dotted; background-color: rgb(0, 0, 255, 0.1);">')


				print('<h2 style="padding: 5px; border: 1px black dotted; background-color: rgb(0,0,0,0.1); border-radius: 8px; padding-bottom: 10px; text-align: center;">in the situation <span style="font-style: italic; color: rgb(210,0,0);">%s</span>...</h2>' % sch_name)

				print('<table style="border: 1px black solid; padding-bottom: 10px; background-color: #dddddd; margin-left: auto; margin-right: auto;">')
				print('<tr style="text-align: left;"><th>actor</th><th>action</th><th>arg0</th><th>arg1</th><th>adv</th></tr>')
				handle_formula(goal)
				print('</table>')
				print('<h2 style="border: 1px black dotted; background-color: rgb(0,0,0,0.1); border-radius: 8px; padding-bottom: 10px; text-align: center;">... motivates ...</h2>')
				print('<table style="border: 1px black solid; padding-bottom: 10px; background-color: #dddddd; margin-left: auto; margin-right: auto;">')
				print('<tr style="text-align: left;"><th>actor</th><th>action</th><th>arg0</th><th>arg1</th><th>adv</th></tr>')
				# handle_formula(phi, odd=(i%2!=0))
				handle_formula(phi, odd=False)
				print('</table>')

				print('<hr />')

				print('<div style="display: flex;">')
				print('<form>')
				labels = ['Strongly Disagree', 'Disagree', 'Neutral', 'Agree', 'Strongly Agree']
				for k in range(1, 6):
					label = labels[k-1]
					print('<label for="goal-%d-%d" style="float: left; padding: 0 1em; text-align: center;">%s <br /> <input type="radio" name="goal-%d-eval" value="%d" id="goal-%d-%d"></label>' % (total_goal_num, k, label, total_goal_num, k, total_goal_num, k))
					# print('<label for="goal-%d">%d</label>' % (k, k))
				print('</form>')
				print('</div>')


				print('</div>')
				print('<br />'*3)
		if PRINT_PRECONDS and len(relevant_formulas['preconds']) > 0:
			for precond in relevant_formulas['preconds']:
				total_precond_num += 1
				print('<div style="display: inline-block; padding: 15px; border: 3px black dotted; background-color: rgb(255, 0, 0, 0.1);">')

				print('<h2 style="padding: 5px; border: 1px black dotted; background-color: rgb(0,0,0,0.1); border-radius: 8px; padding-bottom: 10px; text-align: center;">in the situation <span style="font-style: italic; color: rgb(210,0,0);">%s</span>...</h2>' % sch_name)

				print('<table style="border: 1px black solid; padding-bottom: 10px; background-color: #dddddd; margin-left: auto; margin-right: auto;">')
				print('<tr style="text-align: left;"><th>actor</th><th>action</th><th>arg0</th><th>arg1</th><th>adv</th></tr>')
				handle_formula(precond)
				print('</table>')
				print('<h2 style="border: 1px black dotted; background-color: rgb(0,0,0,0.1); border-radius: 8px; padding-bottom: 10px; text-align: center;">... is true before ...</h2>')
				print('<table style="border: 1px black solid; padding-bottom: 10px; background-color: #dddddd; margin-left: auto; margin-right: auto;">')
				print('<tr style="text-align: left;"><th>actor</th><th>action</th><th>arg0</th><th>arg1</th><th>adv</th></tr>')
				# handle_formula(phi, odd=(i%2!=0))
				handle_formula(phi, odd=False)
				print('</table>')

				print('<hr />')

				print('<div style="display: flex;">')
				print('<form>')
				labels = ['Strongly Disagree', 'Disagree', 'Neutral', 'Agree', 'Strongly Agree']
				for k in range(1, 6):
					label = labels[k-1]
					print('<label for="precond-%d-%d" style="float: left; padding: 0 1em; text-align: center;">%s <br /> <input type="radio" name="precond-%d-eval" value="%d" id="precond-%d-%d"></label>' % (total_precond_num, k, label, total_precond_num, k, total_precond_num, k))
					# print('<label for="precond-%d">%d</label>' % (k, k))
				print('</form>')
				print('</div>')


				print('</div>')
				print('<br />'*3)
		if PRINT_POSTCONDS and len(relevant_formulas['postconds']) > 0:
			for postcond in relevant_formulas['postconds']:
				total_postcond_num += 1
				print('<div style="display: inline-block; padding: 15px; border: 3px black dotted; background-color: rgb(0, 255, 0, 0.1);">')

				print('<h2 style="padding: 5px; border: 1px black dotted; background-color: rgb(0,0,0,0.1); border-radius: 8px; padding-bottom: 10px; text-align: center;">in the situation <span style="font-style: italic; color: rgb(210,0,0);">%s</span>...</h2>' % sch_name)

				print('<table style="border: 1px black solid; padding-bottom: 10px; background-color: #dddddd; margin-left: auto; margin-right: auto;">')
				print('<tr style="text-align: left;"><th>actor</th><th>action</th><th>arg0</th><th>arg1</th><th>adv</th></tr>')
				handle_formula(postcond)
				print('</table>')
				print('<h2 style="border: 1px black dotted; background-color: rgb(0,0,0,0.1); border-radius: 8px; padding-bottom: 10px; text-align: center;">... is true after ...</h2>')
				print('<table style="border: 1px black solid; padding-bottom: 10px; background-color: #dddddd; margin-left: auto; margin-right: auto;">')
				print('<tr style="text-align: left;"><th>actor</th><th>action</th><th>arg0</th><th>arg1</th><th>adv</th></tr>')
				# handle_formula(phi, odd=(i%2!=0))
				handle_formula(phi, odd=False)
				print('</table>')

				print('<hr />')


				print('<div style="display: flex;">')
				print('<form>')
				labels = ['Strongly Disagree', 'Disagree', 'Neutral', 'Agree', 'Strongly Agree']
				for k in range(1, 6):
					label = labels[k-1]
					print('<label for="postcond-%d-%d" style="float: left; padding: 0 1em; text-align: center;">%s <br /> <input type="radio" name="postcond-%d-eval" value="%d" id="postcond-%d-%d"></label>' % (total_postcond_num, k, label, total_postcond_num, k, total_postcond_num, k))
					# print('<label for="postcond-%d">%d</label>' % (k, k))
				print('</form>')
				print('</div>')

				print('</div>')
				print('<br />'*3)
print('</body>')
print('</html>')
