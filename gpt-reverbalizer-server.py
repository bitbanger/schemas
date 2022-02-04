from transformers import AutoModelForCausalLM, GPT2Tokenizer
from xmlrpc.server import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler

tokenizer = GPT2Tokenizer.from_pretrained('gpt2-large')
model = AutoModelForCausalLM.from_pretrained('./gpt-reverbalizer-model').eval().to('cuda:0')

def reverbalize(s):
	inp = tokenizer(s + ' <SEP>', return_tensors='pt').input_ids.to('cuda:0')

	outp = tokenizer.batch_decode(model.generate(inp, max_length=128, pad_token_id=50256))[0]

	outp = outp.split('<END>')[0]
	outp = outp.split('<SEP>')[1]
	outp = outp.strip()

	return outp

class RequestHandler(SimpleXMLRPCRequestHandler):
	rpc_paths = ('/RPC2',)

if __name__ == '__main__':
	with SimpleXMLRPCServer(('localhost', 8041), requestHandler=RequestHandler) as server:
		server.register_introspection_functions()

		server.register_function(reverbalize)

		print('GPT-2 re-verbalization server started')
		server.serve_forever()
