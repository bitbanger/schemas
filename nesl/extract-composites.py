import argparse

parser = argparse.ArgumentParser()

parser.add_argument('filename', type=str)

parser.add_argument('--include_protos', dest='include_protos', action='store_true')

parser.set_defaults(include_protos=False)

args = parser.parse_args()

with open(args.filename, 'r') as f:
	lines = f.readlines()

	schema_proto_pairs = []

	protos = []
	schemas = []
	buf = []
	taking = False
	taking_proto = False

	for line in lines:
		# parse out compos
		if 'COMPOSITE SCHEMA' in line:
			taking = True
			continue
		if taking and '-----' in line:
			taking = False
			schemas.append(''.join(buf).strip())
			schema_proto_pairs.append((schemas[-1], protos))
			protos = []
			buf = []
			continue

		# parse out protos
		if not taking and 'EPI-SCHEMA' in line:
			taking = True
			taking_proto = True

		if taking_proto and len(line) > 0 and line[0] == ')':
			taking = False
			taking_proto = False
			buf.append(line)
			protos.append(''.join(buf).strip())
			buf = []
			continue

		# take the line
		if taking and len(line.strip()) > 0:
			buf.append(line)

	if len(buf) > 0 or len(protos) > 0:
		schemas.append(''.join(buf).strip())
		schema_proto_pairs.append((schemas[-1], protos))
	protos = []
	buf = []

def strip_ep_rels(schema):
	lines = []
	taking = True
	for line in schema.split('\n'):
		if 'EPISODE-' in line:
			taking = False
			continue
		if (not taking) and line.strip() == ')':
			taking = True
			continue
		if taking:
			lines.append(line)

	return '\n'.join(lines)

if args.include_protos:
	for (schema, protos) in schema_proto_pairs:
		print('(')
		print('; compo')
		print('%s' % (strip_ep_rels(schema),))
		print('; protos')
		print('(')
		for proto in protos:
			print('%s' % (strip_ep_rels(proto),))
		print(')')
		print(')\n')
else:
	for schema in schemas:
		print(strip_ep_rels(schema))
		print('')
