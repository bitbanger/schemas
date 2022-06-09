PROMPT = "The statement above is a reasonably clear, entirely plausible general claim and seems neither too specific nor too general or vague to be useful:"
BUTTON_LABELS = ['Disagree', 'Lean toward disagree', 'Maybe', 'Lean toward agree', 'Agree']

txt = ''
with open('coling_gpt_verbs2.txt', 'r') as f:
	txt = f.read().strip()

def write_step(sch_name, step_sent, num):
	sch_name = ' '.join(schema_name.split('_'))
	eval_name = '%s-steps-%d' % (schema_name, num)
	fn = 'gpt_study_fragments/%s.html' % eval_name
	with open(fn, 'w') as f:
		f.write('<div style="display: inline-block; padding: 15px; border: 3px black dotted; background-color: rgb(0, 0, 255, 0.1);">')
		# f.write('<table style="border: 1px black solid; padding-bottom: 10px; background-color: #dddddd; margin-left: auto; margin-right: auto;">')
		# f.write('<tr style="text-align: left;"><th>arg0</th><th>action</th><th>arg1</th><th>arg2</th><th>adv</th></tr>')

		# handle_formula(phi, f, odd=(i%2!=0))
		# handle_formula(phi, f, odd=False)
		f.write('<h3 class="sent">%s</h3>' % (step_sent))

		# f.write('</table>')

		f.write('<h2 style="padding: 5px; border: 1px black dotted; background-color: rgb(0,0,0,0.1); border-radius: 8px; padding-bottom: 10px; text-align: center;">often occurs in the situation <span style="font-style: italic; color: rgb(210,0,0);">%s</span></h2>' % sch_name)

		f.write('<hr />')

		f.write('<h3 class="prompt">%s</h3><br />' % PROMPT)
		f.write('<div style="display: flex; padding-left: 25%;">')
		f.write('<form>')
		labels = BUTTON_LABELS
		for k in range(1, 6):
			label = labels[k-1]
			f.write('<label for="%s" style="float: left; padding: 0 1em; text-align: center;">%s <br /> <input type="radio" name="%s" value="%d" id="%s"></label>' % (eval_name, label, "score", k, "score%d" % k))
			# f.write('<label for="inference-%d">%d</label>' % (k, k))
		f.write('</form>')
		f.write('</div>')

		f.write('</div>')

def write_goal(schema_name, goal_sent, step_sent, num):
	sch_name = ' '.join(schema_name.split('_'))
	eval_name = '%s-goals-%d' % (schema_name, num)
	fn = 'gpt_study_fragments/%s.html' % eval_name
	with open(fn, 'w') as f:
		f.write('<div style="display: inline-block; padding: 15px; border: 3px black dotted; background-color: rgb(0, 0, 255, 0.1);">')


		f.write('<h2 style="padding: 5px; border: 1px black dotted; background-color: rgb(0,0,0,0.1); border-radius: 8px; padding-bottom: 10px; text-align: center;">in the situation <span style="font-style: italic; color: rgb(210,0,0);">%s</span>...</h2>' % sch_name)

		# f.write('<table style="border: 1px black solid; padding-bottom: 10px; background-color: #dddddd; margin-left: auto; margin-right: auto;">')
		# f.write('<tr style="text-align: left;"><th>arg0</th><th>action</th><th>arg1</th><th>arg2</th><th>adv</th></tr>')

		# handle_formula(goal, f)
		f.write('<h3 class="sent">%s</h3>' % (goal_sent))

		# f.write('</table>')
		f.write('<h2 style="border: 1px black dotted; background-color: rgb(0,0,0,0.1); border-radius: 8px; padding-bottom: 10px; text-align: center;">... motivates ...</h2>')
		# f.write('<table style="border: 1px black solid; padding-bottom: 10px; background-color: #dddddd; margin-left: auto; margin-right: auto;">')
		# f.write('<tr style="text-align: left;"><th>arg0</th><th>action</th><th>arg1</th><th>arg2</th><th>adv</th></tr>')

		# handle_formula(phi, odd=(i%2!=0))
		# handle_formula(phi, f, odd=False)
		f.write('<h3 class="sent">%s</h3>' % (step_sent))

		# f.write('</table>')

		f.write('<hr />')

		f.write('<h3 class="prompt">%s</h3><br />' % PROMPT)

		f.write('<div style="display: flex;">')
		f.write('<form>')
		labels = BUTTON_LABELS
		for k in range(1, 6):
			label = labels[k-1]
			f.write('<label for="%s" style="float: left; padding: 0 1em; text-align: center;">%s <br /> <input type="radio" name="%s" value="%d" id="%s"></label>' % (eval_name, label, "score", k, "score%d" % k))
			# f.write('<label for="goal-%d">%d</label>' % (k, k))
		f.write('</form>')
		f.write('</div>')


		f.write('</div>')

schema_name = ''
steps_by_name = dict()
i = 0

in_steps = True
for line in txt.split('\n'):
	if len(line.strip()) == 0:
		continue

	line = line.strip()

	if line[0] != '?' and line[0] != ':':
		schema_name = line
		steps_by_name = dict()
		continue

	if line == ':steps':
		in_steps = True
		i = 0
	elif line == ':goals':
		in_steps = False
		i = 0

	if line[0] == '?':
		(ep, sent) = line.split('@')
		if in_steps:
			steps_by_name[ep] = sent
			write_step(schema_name, sent, i)
		else:
			write_goal(schema_name, sent, steps_by_name[ep], i)
		i += 1
