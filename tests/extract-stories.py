import re
import sys

from collections import defaultdict


comp_num = 0

verb_nums = defaultdict(lambda: 1)

fn_fmt_str = 'apr-30-output/apr-30-mtg-%d.txt'

schema_name_remap = dict()

def extract_stories(fn):
	with open(fn, 'r') as f:
		lines = [x.strip('\n') for x in f.readlines()]

		stories = []
		schemas = []

		last_line = lines[0]

		taking_schema_sec = True

		seen = set()

		story_buf = []
		schema_buf = []
		for line in lines[1:]:
			if 'story:' in line:
				if len(story_buf) > 0:
					stories.append(story_buf)
					schemas.append(list(set(schema_buf)))
					story_buf = []
					schema_buf = []
			if 'VALID:' in line or 'INVALID:' in line:
				if last_line.strip()[0] == '"':
					story_buf.append(last_line.strip())

			if 'Schema in English' in line:
				taking_schema_sec = False

			if taking_schema_sec:
				result = re.search('[a-zA-Z_]+\.\d+\.V', line)
				if result:
					schema_name = result.group(0)
					tmp_schema_name = 'TMP_%s' % schema_name
					line = line.replace(schema_name, tmp_schema_name)
					if tmp_schema_name not in schema_name_remap:
						spl = schema_name.split('.')
						schema_verb = spl[0]

						new_num = verb_nums[schema_verb]
						new_schema_name = '%s.%d.V' % (schema_verb, new_num)
						print('renaming %s to %s' % (schema_name, new_schema_name))
						schema_name_remap[tmp_schema_name] = new_schema_name

						verb_nums[schema_verb] = new_num + 1
						schema_name = new_schema_name
					else:
						schema_name = schema_name_remap[tmp_schema_name]

					schema_buf.append(schema_name)

			if 'schemas (w/' in line:
				# schema_buf.append(line.strip())
				taking_schema_sec = True

			last_line = line

		if len(schema_buf) > 0 or len(story_buf) > 0:
			stories.append(story_buf)
			schemas.append(list(set(schema_buf)))

		return (stories, schemas)

stories = []
schemases = []
for fnum in range(0, int(sys.argv[1])+1):
	fnum = int(fnum) # just as a sanity check
	fn = fn_fmt_str % fnum
	(storieses, schemas) = extract_stories(fn)
	stories = stories + storieses
	schemases = schemases + schemas

print("(defparameter *ALL-STORIES* '(")
for i in range(len(stories)):
	story = stories[i]
	schemas = schemases[i]
	print("(")

	print("	(")
	for line in story:
		print("		%s" % line)
	print("	)")

	print("	(")
	for schema in schemas:
		print("		%s" % schema)
	print("	)")

	print(")")
print("))")
