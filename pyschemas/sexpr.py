def balanced_substr(s):
	count = 1
	for i in range(1, len(s)):
		c = s[i]

		if c == '(':
			count += 1
		if c == ')':
			count -= 1
		if count == 0:
			return s[:i+1]

	return None

def clean_s_expr(s_expr):
	s_expr = s_expr.replace('\n', '')
	s_expr = s_expr.replace('\t', '')
	while '  ' in s_expr:
		s_expr = s_expr.replace('  ', ' ')

	return s_expr

def parse_s_expr(s_expr):
	s_expr = clean_s_expr(s_expr)

	if len(s_expr) == 0:
		return None

	if s_expr[0] != '(' or s_expr[-1] != ')':
		return s_expr

	items = []

	item_buf = []
	i = 1
	while i < len(s_expr):
		c = s_expr[i]

		if c == ' ':
			if len(item_buf) > 0:
				items.append(''.join(item_buf))
				item_buf = []
			i += 1
		elif c != '(':
			if c != ')':
				item_buf.append(c)
			i += 1
		else:
			if len(item_buf) > 0:
				items.append(''.join(item_buf))
				item_buf = []
			inner = balanced_substr(s_expr[i:])
			items.append(parse_s_expr(inner))
			i += len(inner)

	if len(item_buf) > 0:
		items.append(''.join(item_buf))
		item_buf = []

	return items

def list_to_s_expr(lst):
	if type(lst) != list:
		return str(lst)

	buf = []

	buf.append('(')
	for i in range(len(lst)):
		if i > 0:
			buf.append(' ')
		buf.append(list_to_s_expr(lst[i]))
	buf.append(')')

	return ''.join(buf)
