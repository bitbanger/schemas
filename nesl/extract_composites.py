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

def extract_compos(lines, include_protos=False):
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

	return_str_buf = []
	if include_protos:
		for (schema, protos) in schema_proto_pairs:
			return_str_buf.append('(')
			return_str_buf.append('; compo')
			compo = strip_ep_rels(schema)
			if len(compo.strip()) > 0:
				return_str_buf.append(compo)
			else:
				return_str_buf.append('nil')
			return_str_buf.append('; protos')
			return_str_buf.append('(')
			for proto in protos:
				return_str_buf.append('%s' % (strip_ep_rels(proto),))
			return_str_buf.append(')')
			return_str_buf.append(')\n')
	else:
		for schema in schemas:
			return_str_buf.append(strip_ep_rels(schema))
			return_str_buf.append('')

	return '\n'.join(return_str_buf)

if __name__ == '__main__':
	import argparse

	parser = argparse.ArgumentParser()

	parser.add_argument('filename', type=str)

	parser.add_argument('--include_protos', dest='include_protos', action='store_true')
	parser.set_defaults(include_protos=False)

	args = parser.parse_args()

	with open(args.filename, 'r') as f:
		print(extract_compos(f.readlines(), include_protos=args.include_protos))
