import re
import sys

from collections import defaultdict

taken = []

if len(sys.argv) <= 3:
	sys.argv = sys.argv + [1, 1]
	try:
		int(sys.argv[1])
		int(sys.argv[2])
	except:
		sys.argv = [sys.argv[0]] + [1, 1]

comp_num = int(sys.argv[1])

verb_nums = defaultdict(lambda: int(sys.argv[2]))

schema_name_remap = dict()

with open('mar-26-mtg-0.txt', 'r') as f:
	lines = [x.strip('\n') for x in f.readlines()]

	taken_buf = []
	taking = False
	for i in range(0, len(lines)):
		line = lines[i]

		result = re.search('[a-zA-Z]+\.\d+\.V', line)
		if result:
			schema_name = result.group(0)
			tmp_schema_name = 'TMP_%s' % schema_name
			line = line.replace(schema_name, tmp_schema_name)
			if tmp_schema_name not in schema_name_remap:
				spl = schema_name.split('.')
				schema_verb = spl[0]

				new_num = verb_nums[schema_verb]
				new_schema_name = '%s.%d.V' % (schema_verb, new_num)
				schema_name_remap[tmp_schema_name] = new_schema_name

				verb_nums[schema_verb] = new_num + 1

			

		if 'COMPOSITE-SCHEMA' in line:
			line = line.replace('COMPOSITE-SCHEMA', 'COMPOSITE-SCHEMA-%d' % comp_num)
			comp_num += 1

		if 'EPI-SCHEMA' in line:
			taking = True
		if line == ')' and taking:
			taking = False
			taken_buf.append(line)
			taken.append(taken_buf)
			taken_buf = []

		if taking:
			taken_buf.append(line)

fixed_taken = []
for schema in taken:
	schema_buf = []
	for line in schema:
		if 'TMP' in line:
			for repl in schema_name_remap.keys():
				new_line = line.replace(repl, schema_name_remap[repl])
				line = new_line
		schema_buf.append(line)
	fixed_taken.append(schema_buf)
taken = fixed_taken

for schema in taken:
	for line in schema:
		print(line)
	print('\n\n')

print('; got %d schemas' % (len(taken)))
print('; max verb schema num was %d' % (max(verb_nums.values())))
