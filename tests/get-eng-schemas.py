with open('better-composed-schemas-for-mtg.txt', 'r') as f:
	lines = [line.strip() for line in f.readlines()]
	cursor = 0
	collected = []
	while cursor < len(lines):
		line = lines[cursor]
		if line == "Schema in English (prototype):":
			collected.append(line)
			print(line)
			cursor2 = cursor+1
			while cursor2 < len(lines):
				line2 = lines[cursor2]
				if line2[0] == '"':
					collected.append(line2)
					print(line2)
					cursor2 += 1
				else:
					break
			cursor = cursor2
			print("")
			continue

		cursor += 1
