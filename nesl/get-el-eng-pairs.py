import os
import subprocess

OUTPUT_EL = True

for fn in os.listdir('howto-standalones/'):
	with open('howto-standalones/%s' % fn, 'r') as f:
		txt = f.read().strip()
		pre_epi = txt.split('EPI')[0].strip().split('\n')
		story = []
		for x in pre_epi:
			x = x.strip()
			if len(x) < 2:
				continue
			if x[:2] == '(;' or x[0] == ';':
				story.append(x)

		story = [' '.join(line.split(' ')[1:])[1:-1] for line in story]

		try:
			steps = txt.split('STEPS')[1].split('\t)')[0].strip().split('\n')
			steps = [x.strip() for x in steps]
			if len(steps) == len(story):
				verbalized_steps = subprocess.run(('bash verbalize-schemas.sh howto-standalones/%s' % fn).split(' '), capture_output=True).stdout.decode('utf-8').split('\n')[1:]
				for i in range(len(verbalized_steps)):
					if OUTPUT_EL:
						print('%s <SEP> %s <SEP> %s <END>' % (steps[i], verbalized_steps[i], story[i]))
					else:
						print('%s <SEP> %s <END>' % (verbalized_steps[i], story[i]))
			else:
				continue
		except KeyboardInterrupt:
			quit()
		except:
			continue
