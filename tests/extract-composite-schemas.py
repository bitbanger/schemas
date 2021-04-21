import re
import sys

from collections import defaultdict


comp_num = 0

verb_nums = defaultdict(lambda: 1)

fn_fmt_str = 'apr-21-mtg-%d.txt'

schema_name_remap = dict()

def extract_schemas(fn, eng_taken):
	global comp_num
	global verb_nums
	global schema_name_remap

	taken = []

	with open(fn, 'r') as f:
		lines = [x.strip('\n') for x in f.readlines()]


		taken_buf = []
		eng_taken_buf = []
		taking = False
		eng_taking = False

		skip_iter = False
		for i in range(0, len(lines)):
			line = lines[i]
			if 'stla' in line:
				continue
			if len(line.strip().split(':')) > 1:
				is_num = line.strip().split(':')[0]
				# print('checking "%s"' % is_num)
				try:
					int(is_num)
					# print('it was an int!')
					skip_iter = True
					continue
				except:
					pass
			if skip_iter:
				continue

			if line.strip() == "parsing" or line.strip() == "done parsing":
				continue

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
				comp_num += 1
				# print('got comp schema %d' % comp_num)
				line = line.replace('COMPOSITE-SCHEMA', 'COMPOSITE-SCHEMA-%d' % comp_num)

			if len(line) >= 11 and line[:11] == '(EPI-SCHEMA':
				taking = True
			if line == ')' and taking:
				taking = False
				taken_buf.append(line)
				taken.append(taken_buf)
				taken_buf = []

			if 'prototype' in line:
				eng_taking = True
				# print('taking eng now')
			if i == len(lines)-1 or (eng_taking and len(line) >= 5 and line[:5] == 'story'):
				while len(eng_taken)+1 < comp_num:
					# print('comp_num is %d, only took %d eng, adding junk' % (comp_num, len(eng_taken)+1))
					eng_taken.append([])

				eng_taking = False
				eng_taken.append(eng_taken_buf)
				# print('got eng %s' % eng_taken_buf)
				# print('now taken %d eng' % len(eng_taken))
				eng_taken_buf = []
				
			if taking:
				taken_buf.append(line)

			if eng_taking and 'prototype' not in line:
				eng_taken_buf.append(line)

			# if (taking or eng_taking) and line.strip() and line.strip()[0] not in 'n() \t' and 'prototype' not in line:
				# print('weird line %s' % line)

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

	# print('eng taken: %d' % len(eng_taken))
	return (taken, eng_taken)

taken = []
eng_taken = []
for fnum in range(0, int(sys.argv[1])+1):
	fnum = int(fnum) # just as a sanity check
	fn = fn_fmt_str % fnum
	taken_pair = extract_schemas(fn, eng_taken)
	schemas_taken = taken_pair[0]
	pair_eng_taken = taken_pair[1]
	taken = taken + schemas_taken
	eng_taken = pair_eng_taken

# print(len([x for x in taken if 'COMPOSITE' in x[0]]))
# print(len(eng_taken))

print("(defparameter *LEARNED-SCHEMAS* '(")

total_stories = 0
eng_idx = 0
for schema in taken:
	is_composite = False
	print('(')
	for line in schema:
		if 'COMPOSITE' in line:
			is_composite = True
			total_stories += 1
		print('\t' + line)

	if is_composite:
		print('\t(')
		for line in eng_taken[eng_idx]:
			print('\t\t' + line)
		eng_idx += 1
		print('\t)')
	else:
		print('\tnil')
	print(')')
	print('\n\n')

print('))')

print('; got %d schemas (%d protoschema matches, %d stories)' % (len(taken), len(taken)-total_stories, total_stories))
