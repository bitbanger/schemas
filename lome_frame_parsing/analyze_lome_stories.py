import numpy as np
import spacy

from collections import defaultdict
from matplotlib.ticker import PercentFormatter
from numpy.linalg import inv


dep_parser = spacy.load('en_core_web_sm')

frame_counts = defaultdict(int)

seen_verbs = set()
seen_covered_verbs = set()
covered_verbs = 0
total_verbs = 0
total_all_verbs = 0
with open('lome_rocstory_output.txt', 'r') as f:
	take_next = False
	verbs = []
	parse = None
	for line in f.readlines():
		if 'story sentence text for lookup' in line:
			take_next = True
			continue
		if take_next:
			take_next = False
			story = [x for x in line.strip()[1:-1].split('" "')]
			story = ' '.join(story)[1:-1]

			parse = dep_parser(story)

			verbs = [i for i in range(len(parse)) if parse[i].pos_ == 'VERB']
			for verb in verbs:
				seen_verbs.add('%s' % parse[verb])
			total_verbs += len(verbs)
			total_all_verbs += len(verbs)

			# print(story)
			# print(verbs)
			# print([parse[i] for i in verbs])

		if len(verbs) == 0:
			continue
		if len(line.strip()) > 1 and len(line.split('(')) > 2 and line[0] == '(' and 'defparameter' not in line:
			fn = line.split(' ')[1]
			span = line.strip().split('(')[2][:-1]
			(start, end) = (int(span.split(' ')[0]), int(span.split(' ')[1]))
			# print('fn %s' % fn)
			# print('span %d-%d' % (start, end))
			for verb in verbs:
				if verb >= start and verb <= end:
					# print('\tverb %s' % parse[verb])
					if ('%s' % parse[verb]) not in seen_covered_verbs:
						frame_counts[fn] += 1
					seen_covered_verbs.add('%s' % parse[verb])
					covered_verbs += 1

total_verbs = len(seen_verbs)
covered_verbs = len(seen_covered_verbs)

print('total verbs: %d' % total_verbs)
print('total verbs covered: %d' % covered_verbs)
print('total frames counted: %d' % (sum([frame_counts[k] for k in frame_counts.keys()])))
print('total unique frame types: %d' % (len(frame_counts.keys())))
print(covered_verbs*1.0/total_verbs)
print(sorted([(k, frame_counts[k]) for k in frame_counts.keys()], key=lambda x: x[1], reverse=True))

sorted_counts = sorted([(k, frame_counts[k]) for k in frame_counts.keys()], key=lambda x: x[1], reverse=True)

import matplotlib.pyplot as plt
import matplotlib.patches as mpatches

def cumulative(series):
	total = 0
	elems = []
	for e in series:
		elems.append(total+e)
		total += e

	return elems

x_vals = range(1, len(frame_counts.keys())+1)
y_vals = cumulative([x[1] for x in sorted_counts])

# x_vals = [x*1.0/max(x_vals) for x in x_vals]
coverage = covered_verbs*1.0/total_verbs
y_vals = [y*coverage/max(y_vals) for y in y_vals]



# Here, we're going to use Moore-Penrose to fit a log curve
# to the data
A = np.array([[np.log(x), 1] for x in x_vals])
B = np.array(y_vals)
coefs = inv(np.dot(A.T, A))
coefs = np.dot(coefs, A.T)
coefs = np.dot(coefs, B)

print(coefs)


plt.plot(x_vals, y_vals)

(fig, ax) = plt.subplots()
red_patch = mpatches.Patch(color='red', alpha=0.25, label='80% of matched verbs (65% of all verbs)')
green_patch = mpatches.Patch(color='green', alpha=0.25, label='0.177 log(x) + -0.04')
blue_patch = mpatches.Patch(color='blue', alpha=0.25, label='Percent of ROCstory verbs matched to frames')
# green_patch = mpatches.Patch(color='green', alpha=0.25, label='50% of matched verbs')

red_mask = [y <= 0.8*coverage for y in y_vals]
# red_mask = [y >= 0.5*coverage and y <= 0.8*coverage for y in y_vals]
# green_mask = [y <= 0.5*coverage for y in y_vals]

plt.fill_between(x_vals, y_vals, where=red_mask, interpolate=True, color='red', alpha=0.25)
# plt.fill_between(x_vals, y_vals, where=green_mask, interpolate=True, color='green', alpha=0.25)
# plt.fill_between(x_vals, y_vals, where=np.array(x_vals)==x_vals[-1], interpolate=True)
plt.scatter(x_vals, y_vals, s=3, color='blue', alpha=0.35)
plt.plot(x_vals, [(coefs[0] * np.log(x) + coefs[1]) for x in x_vals], color='green', alpha=0.5)

plt.xlabel('Number of FrameNet frames used')
plt.ylabel('Percent of ROCstory verbs matched to frames')

ax.legend(handles=[red_patch, green_patch, blue_patch])
plt.tight_layout()

plt.gca().yaxis.set_major_formatter(PercentFormatter(1))

plt.savefig('frames.png')

print('80% frames (%d):')
cum = 0
i = 0
while cum < 0.8 * covered_verbs:
	print('\t%s' % sorted_counts[i][0])
	cum += sorted_counts[i][1]
	i += 1
print('total: %d' % i)
print(total_all_verbs)
# for frame in [x[0] for x in sorted_counts[:51]]:
	# print('\t%s' % frame)
