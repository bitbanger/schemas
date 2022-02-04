import os
import subprocess
import time
import xmlrpc.client

from extract_composites import extract_compos

from collections import defaultdict

STORY_DIR = '/home/lane/Code/gpt/synth_stories_for_schema_learning'

stories = os.listdir(STORY_DIR)

lome_client = xmlrpc.client.ServerProxy('http://localhost:8040')

def mark_as_done(topic):
	with open('premade-done-markers/%s' % (topic,), 'w') as f:
		pass

def is_done(topic):
	return topic in os.listdir('premade-done-markers')

def story_topic(story):
	return '_'.join(story.split('_')[:-1])

def story_num(story):
	return int(story.split('_')[-1].split('.')[0])

def load_story(story):
	txt = ''
	with open('%s/%s' % (STORY_DIR, story), 'r') as f:
		txt = f.read().strip()
	return txt

def fmt_time(start, end):
	duration = end - start

	mins = int(duration) // 60
	secs = int(duration) % 60

	return '%dm%ds' % (mins, secs)
	

stories = sorted(stories, key=story_num)
stories = sorted(stories, key=story_topic)

stories_by_topic = defaultdict(list)

for story in stories:
	stories_by_topic[story_topic(story)].append(story)

topics_in_order = [story_topic(story) for story in stories]

# topics_in_order contains duplicates, so we'll hack out
# a fix for that here :|
seen = set()

for topic in topics_in_order:
	if topic in seen:
		continue
	else:
		seen.add(topic)

	if topic[-1] == '.':
		# This topic is a whole sentence, which is bad.
		# It means GPT did a bad job summarizing a story.
		continue

	if is_done(topic):
		print('skipping topic %s\n' % (topic,), flush=True)
		continue
	else:
		print('processing topic %s' % (topic,), flush=True)

	topic_start = time.time()

	story_txts = []
	for story in stories_by_topic[topic]:
		story_txts.append(load_story(story))

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
	lome_to_el_output = subprocess.run('sbcl --script parse-frames.lisp'.split(' '), capture_output=True).stdout.decode('utf-8')
	with open('lome_to_el_output.txt', 'w') as f:
		f.write(lome_to_el_output)

	# Run extract_composites to get the actual composites and protoschemas out
	compo_and_proto_lisp = extract_compos(lome_to_el_output.split('\n'), include_protos=True)
	print('\tdone (%s)' % (fmt_time(conversion_start, time.time())), flush=True)

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
	i = 0
	for compo in extract_compos(lome_to_el_output.split('\n'), include_protos=False, as_list=True):
		with open('standalone-schemas/%s_%d.txt' % (topic, i), 'w') as f:
			f.write('(%s)' % (compo))

	# Make the webpage with the new schemas and upload
	# it to cycle3
	r'''
	print('\n\tgenerating webpage updates...', flush=True)
	webpage_start = time.time()
	subprocess.run('sbcl --script make-nesl-webpage.lisp'.split(' '))
	print('\tdone (%s)' % (fmt_time(webpage_start, time.time())), flush=True)
	print('\n\tuploading webpage updates...', flush=True)
	upload_start = time.time()
	subprocess.run('scp -r nesl-webpage cycle3:/u/www/u/llawley'.split(' '))
	print('\tdone (%s)' % (fmt_time(upload_start, time.time())), flush=True)
	'''

	print('finished topic %s schema generation in %s\n' % (topic, fmt_time(topic_start, time.time())))

	# Mark the topic as done and move on
	mark_as_done(topic)
