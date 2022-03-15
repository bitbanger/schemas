from xmlrpc.server import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler

from schema_match import SchemaMatcher
from sexpr import parse_s_expr

class RequestHandler(SimpleXMLRPCRequestHandler):
	rpc_paths = ('/RPC2',)

with SimpleXMLRPCServer(('localhost', 8415), requestHandler=RequestHandler) as server:
	print('loading schemas...')
	compos = []
	'''
	with open('nesl-compos.lisp', 'r') as f:
		compos_txt = f.read()
		compos_s_expr = parse_s_expr(compos_txt)

		for c in compos_s_expr[3]:
			for e in c:
				if type(e) == list and len(e) > 0 and type(e[0]) == str and e[0].upper() == 'EPI-SCHEMA':
					compos.append(e)
	'''
	for i in range(0, 9):
		with open('standalone-schemas/farming_%d.txt' % i, 'r') as f:
			compos_txt = f.read()
			compos_lines = compos_txt.strip().split('\n')
			compos_lines = [line.split(';')[0] for line in compos_lines]
			compos_txt = '\n'.join(compos_lines)
			compos_s_expr = parse_s_expr(compos_txt)
			compos.append(compos_s_expr[0])
			

	matcher = SchemaMatcher(compos)
	print('done')

	def match(prop_sexpr, story_sexpr):
		pairs = matcher.match_story_prop(parse_s_expr(prop_sexpr), parse_s_expr(story_sexpr))
		return [(str(pair[0]), pair[1]) for pair in pairs]

	server.register_introspection_functions()

	server.register_function(match)

	print('schema match server started')
	server.serve_forever()
