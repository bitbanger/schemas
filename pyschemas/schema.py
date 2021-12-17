from sexpr import parse_s_expr, list_to_s_expr as ls

class Schema:
	def __init__(self, schema_txt):
		self.SEC_NAMES = [
			'roles',
			'goals',
			'preconds',
			'steps',
			'postconds',
			'paraphrases',
			'episode-relations',
			'certainties',
			'necessities',
			'subordinate-constraints'
		]

		s_expr = parse_s_expr(schema_txt)

		if s_expr[0].lower() != 'epi-schema':
			return None

		self.header_formula = s_expr[1][0]
		self.header_episode = s_expr[1][2]

		self.sections = dict()
		for section in s_expr[2:]:
			section_name = section[0][1:].lower()
			section_formulas = []
			for formula in section[1:]:
				section_formulas.append(formula)
			self.sections[section_name] = section_formulas

	def __str__(self):
		buf = []

		buf.append('(epi-schema (%s ** %s)' % (ls(self.header_formula), self.header_episode))
		section_names = sorted(list(self.sections.keys()), key=lambda x: self.SEC_NAMES.index(x))
		for i in range(len(section_names)):
			if i > 0:
				buf.append('')

			section_name = section_names[i]

			buf.append('\t(:%s%s' % (section_name[0].upper(), section_name[1:]))
			section_formulas = self.sections[section_name]
			for formula in section_formulas:
				buf.append('\t\t%s' % ls(formula))
			buf.append('\t)')

		buf.append(')')

		return '\n'.join(buf)

if __name__ == '__main__':
	TEST_LISP = r'''(epi-schema ((?x enjoy_action.v ?a) ** ?e)
		(:Roles
			(!r1 (?x agent.n))
			(!r2 (?a action.n))
		)

		(:Necessities
			(!n1 (!r1 necessary-to-degree 1.0))
			(!n2 (!r2 necessary-to-degree 1.0))
		)

		(:Paraphrases
			(?e (?x (want.v ?a)))
			(?e (?x (like.v ?a)))
			(?e (?x (love.v ?a)))
			(?e (?x (enjoy.v ?a)))
		)

		(:Preconds
			(?i1 (?x (think.v (that (?a fun.a)))))
		)
	)'''

	print(Schema(TEST_LISP))
