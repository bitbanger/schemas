from xmlrpc.server import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler

import gensim.models

model = gensim.models.KeyedVectors.load_word2vec_format('GoogleNews-vectors-negative300.bin', binary=True)

def similarity(w1, w2):
	if w1.lower() == 'person' and w2.lower() == 'agent':
		return 0.75
	if w2.lower() == 'person' and w1.lower() == 'agent':
		return 0.75

	return float(model.similarity(w1, w2))

def vector(w):
	if w not in model:
		return []

	return [float(x) for x in model[w]]

class RequestHandler(SimpleXMLRPCRequestHandler):
	rpc_paths = ('/RPC2',)

with SimpleXMLRPCServer(('localhost', 8414), requestHandler=RequestHandler) as server:
		server.register_introspection_functions()

		server.register_function(similarity)
		server.register_function(vector)

		print('word2vec server started')
		server.serve_forever()
