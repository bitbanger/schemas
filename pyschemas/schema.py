from sexpr import parse_s_expr, list_to_s_expr as ls

class ELFormula:
	def __init__(self, formula_list):
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

	def __str__(self):
		buf = []

		buf.append('\t(:%s%s' % (self.name[0].upper(), self.name[1:]))
		for formula in self.formulas:
			buf.append('\t\t%s' % formula)
		buf.append('\t)')

		return '\n'.join(buf)

class Schema:
	def __init__(self, s_expr):
		if type(s_expr) == str:
			s_expr = parse_s_expr(s_expr)

		if s_expr[0].lower() != 'epi-schema':
			return None

		self.header_formula = s_expr[1][0]
		self.header_episode = s_expr[1][2]

		self.sections = list()
		for section in s_expr[2:]:
			self.sections.append(Section(section))

	def __str__(self):
		buf = []

		buf.append('(epi-schema (%s ** %s)' % (ls(self.header_formula), self.header_episode))

		for i in range(len(self.sections)):
			if i > 0:
				buf.append('')
			buf.append(str(self.sections[i]))

		buf.append(')')

		return '\n'.join(buf)
