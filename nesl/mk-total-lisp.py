import os
import sys

all_frames = os.listdir(sys.argv[1])
try:
	all_frames = sorted(all_frames, key=lambda x: int(x.split('.')[0].split('story')[1]))
except:
	pass

print("(defparameter *ALL-STORY-FRAMES* '(")

for fn in all_frames:
	try:
		with open(sys.argv[1]+'/' + fn, 'r') as f:
			print(f.read().strip())
	except:
		pass

print("))")
