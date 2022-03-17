import os
import random
import subprocess
import time
import xmlrpc.client

from similar_stories import make_topical_stories

from extract_composites import extract_compos

from collections import defaultdict

PROMPT = 'going to a festival'
NUM_STORIES = 5

US_PROMPT = '_'.join(PROMPT.split(' '))

lome_client = xmlrpc.client.ServerProxy('http://localhost:8040')

def fmt_time(start, end):
	duration = end - start

	mins = int(duration) // 60
	secs = int(duration) % 60

	return '%dm%ds' % (mins, secs)
	

'''
stories = sorted(stories, key=story_num)
stories = sorted(stories, key=story_topic)

stories_by_topic = defaultdict(list)

for story in stories:
	stories_by_topic[story_topic(story)].append(story)

topics_in_order = [story_topic(story) for story in stories]

story_txts = []
for story in stories_by_topic[topic]:
	story_txts.append(load_story(story))
'''

def gen(prompt, num):
	story_txts = []
	us_prompt = '_'.join(prompt.split(' '))

	story_gen_start = time.time()
	print('\tgenerating %d %s...' % (num, 'stories' if num != 1 else 'story'), flush=True)
	for i in range(num):
		story = make_topical_stories(prompt)[0]
		story_txts.append(story)
		print('%d / %d' % (i+1, num), flush=True)
	print('\tdone (%s)' % (fmt_time(story_gen_start, time.time())), flush=True)

	print('\trunning LOME...', flush=True)
	lome_start = time.time()
	# Run LOME and output the Lisp frames to a file
	lome_lisps = lome_client.parse_story_frames(story_txts)
	with open('tmp-story-frames.lisp', 'w') as f:
		f.write(lome_lisps)
	print('\tdone (%s)' % (fmt_time(lome_start, time.time())), flush=True)

	# Run parse-frames.lisp to get EL schemas
	print('\n\tconverting frames into schemas...', flush=True)
	conversion_start = time.time()
	lome_to_el_output = subprocess.run('sbcl --script parse-frames.lisp'.split(' '), capture_output=True, timeout=600).stdout.decode('utf-8')
	with open('lome_to_el_output.txt', 'w') as f:
		f.write(lome_to_el_output)

	# Run extract_composites to get the actual composites and protoschemas out
	compo_and_proto_lisp = extract_compos(lome_to_el_output.split('\n'), include_protos=True)
	print('\tdone (%s)' % (fmt_time(conversion_start, time.time())), flush=True)

	# Format each composite schema as a "standalone" schema for generalization
	standalone_txts = []
	i = 0
	# get the biggest standalone schema number and start there
	standalone_nums = []
	for f in os.listdir('prompt-standalones/'):
		try:
			if len(f) <= len(us_prompt) or f[:len(us_prompt)] != us_prompt:
				continue

			num = int(f.split('.')[0].split('_')[-1])
			standalone_nums.append(num)
		except:
			continue
	if len(standalone_nums) > 0:
		i = max(standalone_nums) + 1
	for (compo, protos) in extract_compos(lome_to_el_output.split('\n'), include_protos=True, as_list=True):
		if len(compo.strip()) < 10:
			continue
		standalone_txts.append('(%s)' % compo)
		with open('prompt-standalones/%s_%d.txt' % ('_'.join(prompt.split(' ')), i), 'w') as f:
			f.write('(%s)' % compo)
		with open('prompt-protos/%s_%d.txt' % ('_'.join(prompt.split(' ')), i), 'w') as f:
			f.write('(%s (' % compo)
			for proto in protos:
				f.write('%s' % proto)
			f.write('))')
		i += 1


	return i

	# Create a general schema
	# subprocess.run(('bash schema-gen.sh %s' % '_'.join(prompt.split(' '))).split(' '), capture_output=True)

def loop_gen(prompt, total_num=15, chunk_size=5):
	us_prompt = '_'.join(prompt.split(' '))

	while True:
		# Find out how many stories we need to generate
		num_already = 0
		for f in os.listdir('prompt-standalones/'):
			try:
				if len(f) <= len(US_PROMPT) or f[:len(US_PROMPT)] != US_PROMPT:
					continue
				num_already += 1
			except:
				continue
		need_to_make = total_num - num_already
		if need_to_make <= 0:
			break
		print('made %d out of %d' % (num_already, total_num))

		# Generate them, either chunk_size at a time, or, if we need N<chunk_size, N at a time
		if need_to_make >= chunk_size:
			print('trying to make %d more' % chunk_size)
			gen(prompt, chunk_size)
		else:
			print('trying to make %d more' % (need_to_make))
			gen(prompt, need_to_make)

loop_gen(PROMPT, total_num=NUM_STORIES, chunk_size=5)

'''
# Append all of the new extracted schemas to nesl-compos.txt, then
# format that file into nesl-compos.lisp
with open('nesl-compos.txt', 'a') as f:
	f.write('\n\n' + compo_and_proto_lisp)
nesl_compos = ''
with open('nesl-compos.txt', 'r') as f:
	nesl_compos = f.read().strip()
with open('nesl-compos.lisp', 'w') as f:
	f.write("(defparameter *NESL-COMPOS-AND-PROTOS* '(\n")
	for line in nesl_compos.split('\n'):
		f.write('\t%s\n' % (line,))
	f.write("))")

# Write individual compos to their own webpages
'''

'''
i = 0
for compo in extract_compos(lome_to_el_output.split('\n'), include_protos=False, as_list=True):
	with open('standalone-schemas/%s_%d.txt' % (topic, i), 'w') as f:
		f.write('(%s)' % (compo))
	i += 1
i = 0
for compo_and_protos in extract_compos(lome_to_el_output.split('\n'), include_protos=True)
	with open('standalone-schemas-with-protos/%s_%d.txt' % (topic, i), 'w') as f:
		f.write('(%s)' % (compo_and_protos))
	i += 1
'''
