from sexpr import parse_s_expr, list_to_s_expr as ls

sec_name_id_prefixes = {
	'preconds': '?I',
	'postconds': '?P',
	'steps': '?E',
	'roles': '!R',
	'episode-relations': '!W',
	'goals': '?G'
}

section_order = [
	'roles',
	'steps',
	'goals',
	'preconds',
	'postconds',
	'episode-relations'
]

class ELFormula:
	def __init__(self, formula_list):
		if type(formula_list) == str:
			self.formula = parse_s_expr(formula_list)
		else:
			self.formula = formula_list

	def __str__(self):
		return ls(self.formula)

class SectionFormula:
	def __init__(self, formula_list):
		self.episode_id = formula_list[0]
		self.formula = ELFormula(formula_list[1])

	def __str__(self):
		return '(%s %s)' % (self.episode_id, str(self.formula))

class Section:
	def __init__(self, section_list):
		self.name = section_list[0][1:].lower()
		self.formulas = []
		for formula in section_list[1:]:
			self.formulas.append(SectionFormula(formula))

	def add_formula(self, formula):
		prefix = '?Q'
		if self.name in sec_name_id_prefixes.keys():
			prefix = sec_name_id_prefixes[self.name]

		new_num = 1
		if len(self.formulas) > 0:
			new_num = max([int(''.join([c for c in str(x.episode_id) if c in '0123456789'])) for x in self.formulas]) + 1

		new_id = '%s%d' % (prefix, new_num)

		self.formulas.append(SectionFormula([new_id, formula]))

	def __str__(self):
		buf = []

		buf.append('\t(:%s%s' % (self.name[0].upper(), self.name[1:]))
		for formula in self.formulas:
			buf.append('\t\t%s' % formula)
		buf.append('\t)')

		return '\n'.join(buf)

def rec_replace(old, new, lst):
	if lst == old:
		return new

	new_lst = []
	for e in lst:
		if e == old:
			new_lst.append(new)
		elif type(e) == list:
			new_lst.append(rec_replace(old, new, e))
		else:
			new_lst.append(e)

	return new_lst

def rec_remove(target, lst):
	new_lst = []
	for e in lst:
		if e == target:
			continue
		elif type(e) == list:
			new_lst.append(rec_remove(target, e))
		else:
			new_lst.append(e)

	return new_lst

class Schema:
	def __init__(self, s_expr):
		if type(s_expr) == str:
			s_expr = parse_s_expr(s_expr)

		if s_expr[0].lower() != 'epi-schema':
			return None

		self.s_expr = s_expr

		self.header_formula = s_expr[1][0]
		self.header_episode = s_expr[1][2]

		# Hack to fix duplicate variable for now
		if self.header_episode == '?e':
			self.header_episode = '?ee'
			self.s_expr[1][2] = '?ee'

		self.sections = list()
		self.sections_by_name = dict()
		for section in s_expr[2:]:
			sec = Section(section)
			self.sections.append(sec)
			self.sections_by_name[sec.name.lower()] = sec

	def get_section(self, sec_name):
		if sec_name.lower() in self.sections_by_name:
			return self.sections_by_name[sec_name.lower()]
		else:
			new_sec = Section([':%s%s' % (sec_name[0].upper(), sec_name[1:])])
			self.sections.append(new_sec)
			self.sections_by_name[sec_name.lower()] = new_sec
			return new_sec

	def sort_sections(self):
		self.sections = sorted(self.sections, key=lambda x: section_order.index(x.name) if x.name in section_order else float('inf'))

	def dedupe(self):
		new_sections = []
		episode_rename_map = dict()
		removed = set()
		for section in self.sections:
			if section.name not in ['steps', 'roles']:
				new_sections.append(section)
				continue
			id_prefix = section.formulas[0].episode_id[:2]
			formulas = [formula.formula.formula for formula in section.formulas]
			formulas = [ls(f) for f in formulas]
			seen = set()
			new_formulas = []
			num = 1
			old_f_num = 0
			for f in formulas:
				old_f_num += 1
				if f in seen:
					if section.name == 'steps':
						removed.add('%s%d' % (id_prefix, old_f_num))
					continue
				seen.add(f)
				# new_formulas.append('(%s%d %s)' % (id_prefix, num, f))
				new_formulas.append(['%s%d' % (id_prefix, num), parse_s_expr(f)])
				if old_f_num != num:
					episode_rename_map['%s%d' % (id_prefix, old_f_num)] = '%s%d' % (id_prefix, num)
				num += 1
			# formulas = [ls(f) for f in new_formulas]
			new_sections.append(Section([':%s'%section.name] + new_formulas))
			# print('%s: %s' % (section.name, formulas))
			self.sections_by_name[section.name] = new_sections[-1]
		self.sections = new_sections

		# First, remove all ep rels that reference the step numbers of removed steps
		new_ep_rels = Section([':Episode-relations'])
		for er in self.get_section('episode-relations').formulas:
			er = er.formula.formula
			if er[2] in removed:
				continue
			if er[2] in episode_rename_map.keys():
				er[2] = episode_rename_map[er[2]]
			new_ep_rels.add_formula(ls(er))
		self.set_section(new_ep_rels)

		# Next, remove all goal/precond/postcond formulas
		# that only referred to duplicate, removed steps
		forms_in_ep_rels = set([e.formula.formula[0] for e in self.get_section('episode-relations').formulas])
		for section in self.sections:
			if section.name not in ['goals', 'preconds', 'postconds']:
				continue
			id_prefix = section.formulas[0].episode_id[:2]
			renamed = dict()
			new_sec = Section([':%s%s' % (section.name[0].upper(), section.name[1:])])
			added = 0
			for fi in range(len(section.formulas)):
				formula = section.formulas[fi]
				if formula.episode_id in forms_in_ep_rels:
					added += 1
					new_sec.add_formula(formula.formula)
					renamed[formula.episode_id] = '%s%d' % (id_prefix, added)

			self.set_section(new_sec)

			# Also, rename references to the kept ones ep-rels section
			new_ep_rels = Section([':Episode-relations'])
			for er in self.get_section('episode-relations').formulas:
				er = er.formula.formula
				if er[0] in renamed.keys():
					er[0] = renamed[er[0]]
				new_ep_rels.add_formula(ls(er))
			self.set_section(new_ep_rels)


		# Next, for all formulas that have been re-numbered, update the numbers
		'''
		new_ep_rels = parse_s_expr(str(self.get_section('episode-relations')))
		undo_tmp = []
		for k in episode_rename_map.keys():
			if k[0] != '?':
				continue
			new_ep_rels = rec_replace(k, 'tmp_%s' % episode_rename_map[k], new_ep_rels)
			undo_tmp.append('tmp_%s' % episode_rename_map[k])
			# print('replacing %s with %s' % (k, 'tmp_%s' % episode_rename_map[k]))
		for u in undo_tmp:
			new_ep_rels = rec_replace(u, u.split('_')[-1], new_ep_rels)
			# print('replacing %s with %s' % (u, u.split('_')[-1]))
		'''

		# print('old ep rels: %s' % self.get_section('episode-relations'))
		# print('new ep rels: %s' % ls(new_ep_rels))

		# self.sections_by_name['episode-relations'] = Section(new_ep_rels)
		# self.set_section(Section(new_ep_rels))

	def set_section(self, section):
		sec_name = section.name
		self.sections = [sec for sec in self.sections if sec.name != sec_name]
		self.sections.append(section)
		self.sections_by_name[sec_name] = section

	def bind_var(self, var, value):
		return Schema(rec_replace(var, value, self.s_expr))

	def __str__(self):
		buf = []

		buf.append('(epi-schema (%s ** %s)' % (ls(self.header_formula), self.header_episode))

		for i in range(len(self.sections)):
			if i > 0:
				buf.append('')
			buf.append(str(self.sections[i]))

		buf.append(')')

		return '\n'.join(buf)

def schema_from_file(fn):
	with open(fn, 'r') as f:
		txt = f.read()
		lines = txt.strip().split('\n')
		lines = [line.split(';')[0] for line in lines]
		txt = '\n'.join(lines)
		s_expr = parse_s_expr(txt)
		return Schema(s_expr[0])

def schema_and_protos_from_file(fn):
	with open(fn, 'r') as f:
		txt = f.read()
		lines = txt.strip().split('\n')
		lines = [line.split(';')[0] for line in lines]
		txt = '\n'.join(lines)
		s_expr = parse_s_expr(txt)
		return (Schema(s_expr[0]), [(proto_pair[0], Schema(proto_pair[1])) for proto_pair in s_expr[1]])
