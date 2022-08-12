import os

for fn in os.listdir('.'):
	if fn.split('.')[-1] != 'txt':
		continue
	buf = []
	with open(fn, 'r') as f:
		lines = [x.strip() for x in f.read().strip().split('\n')]
		for l in lines:
			if l[0] == ';':
				buf.append(l.split('"')[1])

	with open('stories/'+fn, 'w+') as f:
		f.write('\n'.join(buf))
