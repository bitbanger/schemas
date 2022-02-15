import sys

import xmlrpc.client

from sexpr import parse_s_expr

match_client = xmlrpc.client.ServerProxy('http://localhost:8415')

def cut_balanced_parens(s):
	pts = []
	count = 0
	buf = []
	for i in range(len(s)):
		c = s[i]
		if c == '(':
			count += 1
		elif c == ')':
			count -= 1
		buf.append(c)
		if i > 0 and count == 0:
			pts.append(''.join(buf))
			buf = []

	if len(buf) > 0:
		pts.append(''.join(buf))

	pts = [p for p in pts if len(p.strip()) > 0]

	return pts

prop_and_story = ''.join(sys.stdin.read().strip().split('\n'))
spl = cut_balanced_parens(prop_and_story)
prop = spl[0].strip()
story = spl[1].strip()

pairs = match_client.match(prop, story)

print('(')
for pair in pairs:
	print('(%s %s)' % (pair[0], pair[1]))
print(')')
