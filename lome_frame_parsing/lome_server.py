#!/home/lane/miniconda3/bin/python

import lispify_comm_frames
import os
import subprocess

from allennlp.predictors import predictor
from concrete.util import read_communication_from_file as read_comm
from xmlrpc.server import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler

coref = predictor.Predictor.from_path("/home/lane/Code/schemas/allen-coref/coref-spanbert-large-2021.03.10.tar.gz")

DOCKER_IMAGE_NAME = '46e86297e92f'

INPUT_DIR = 'lome-server-input'
OUTPUT_DIR = 'lome-server-output'
ORIG_DIR = 'lome-server-orig'

frame_lispifier = lispify_comm_frames.FrameLispifier()

def clear_dirs():
	for d in [INPUT_DIR, OUTPUT_DIR, ORIG_DIR]:
		subprocess.run(('rm -rf %s/%s' % (os.getcwd(), d)).split(' '))
		subprocess.run(('mkdir %s/%s' % (os.getcwd(), d)).split(' '))

def run_lome():
	subprocess.run(('docker run --gpus all --rm -v %s:/mnt %s /mnt/lome-server-input /mnt/lome-server-output' % (os.getcwd(), DOCKER_IMAGE_NAME)).split(' '))

def tokenize_story(story):
	# Perform coreference resolution for now,
	# since it's the only way I know to get
	# the AllenAI coref tokenization.
	# TODO: find out how to get it without
	# actually doing coref analysis
	resolved = coref.predict(story.strip())

	# Get the tokenized sentences out
	sents = ' '.join(resolved['document'])

	# Strip each line
	sents = '\n'.join([sent.strip() for sent in sents.split('\n')])

	return sents.strip()

def write_story(story, story_num):
	orig_filename = '%s/story%d.txt' % (ORIG_DIR, story_num)
	tok_filename = '%s/story%d.txt' % (INPUT_DIR, story_num)

	with open(orig_filename, 'w') as f:
		f.write(story.strip())

	with open(tok_filename, 'w') as f:
		f.write(tokenize_story(story))

def lispify_frames(stories):
	comms = []
	orig_txts = stories

	for i in range(len(stories)):
		comms.append(read_comm('%s/story%d.comm' % (OUTPUT_DIR, i)))

	pairs = [(comms[i], orig_txts[i]) for i in range(len(comms))]

	return frame_lispifier.lispify_multiple_frames(pairs)

def parse_story_frames(stories):
	clear_dirs()

	for i in range(len(stories)):
		write_story(stories[i], i)

	run_lome()

	lisp = lispify_frames(stories)

	print(lisp)

	return lisp

class RequestHandler(SimpleXMLRPCRequestHandler):
	rpc_paths = ('/RPC2',)

if __name__ == '__main__':
	with SimpleXMLRPCServer(('localhost', 8040), requestHandler=RequestHandler) as server:
		server.register_introspection_functions()

		server.register_function(parse_story_frames)

		print('LOME server started')
		server.serve_forever()
