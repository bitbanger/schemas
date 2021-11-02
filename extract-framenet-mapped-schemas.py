import sys

with open(sys.argv[1], 'r') as f:
	stories = []
	schema_buf = []
	buf = []
	taking = False
	for line in f.readlines():
		if 'EPI-SCHEMA' in line:
			taking = True
		if taking and len(line.strip()) > 0 and line[0] == ')':
			taking = False
			buf.append(line)
			schema_buf.append(buf)
			buf = []
		if '-----' in line or 'error' in line:
			# schemas.append(buf)
			schema_buf.append(buf)
			stories.append(schema_buf)
			buf = []
			schema_buf = []
			taking = False

		if taking and len(line.strip()) > 0:
			buf.append(line)

	if len(buf) > 0:
		schema_buf.append(buf)
	if len(schema_buf) > 0:
		stories.append(schema_buf)
		

print("(defparameter *FRAMENET-SCHEMAS* '(")
for story in stories:
	print('\t(')
	for schema in story:
		for line in schema:
			print('\t\t' + line, end='')
		print('\n\n')
		print('\t\t; done with schema')
	print('\t; done with story')
	print('\t)')
print("))")
