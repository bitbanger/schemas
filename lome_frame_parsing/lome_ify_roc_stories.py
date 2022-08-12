import sys

import xmlrpc.client

lome_client = xmlrpc.client.ServerProxy('http://localhost:8040')

for i in range(30):
	stories = []
	for j in range(10):
		with open('rocstories/rocstory%d.txt' % (i*10+j+100), 'r') as f:
			story = f.read().strip()
			stories.append(story)

	print(lome_client.parse_story_frames(stories))
