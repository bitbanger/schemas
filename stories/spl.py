with open('rocstories.txt', 'r') as f:
	i = 0
	for story in f.read().strip().split('\n\n'):
		lines = [x.strip() for x in story.strip().split('\n')]
		with open('rocstories/rocstory%d.txt' % i, 'w+') as f2:
			first = True
			for line in lines:
				f2.write(line + '\n')
		i += 1
