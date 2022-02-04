#!/bin/bash

# Clean up the temp directories.
rm -rf tmp-orig-stories 2>/dev/null
rm -rf tmp-input 2>/dev/null
rm -rf tmp-output 2>/dev/null
rm -rf tmp-frames 2>/dev/null
rm tmp-story-frames.lisp 2>/dev/null
rm ~/Code/schemas/tmp-story-frames.lisp 2>/dev/null

mkdir tmp-orig-stories
mkdir tmp-input
mkdir tmp-output
mkdir tmp-frames

# First, create some synthetic stories.
cd ~/Code/gpt
rm -rf tmp-stories
mkdir tmp-stories

echo -n "generating ${1} stories... "
python make_stories.py --temp=0.3 --rep_pen=1.15 --resp_length=128 --num_stories=${1} --num_similar=10 --similar_temp=0.5 --prompt_limit=1024 --output_dir='/home/lane/Code/schemas/nesl/tmp-input' --orig_story_dir='/home/lane/Code/schemas/nesl/tmp-orig-stories' >/dev/null 2>/dev/null
echo 'done'
echo ''

# Run the FrameNet parser
cd ~/Code/schemas/nesl
echo -n 'running FrameNet parser... '
docker run --gpus all --rm -v `pwd`:/mnt 46e86297e92f /mnt/tmp-input /mnt/tmp-output >/dev/null 2>/dev/null
echo 'done'
echo ''

# Convert the parsed FrameNet files into s-expressions
echo -n 'converting FrameNet frame files to Lisp... '
for f in $(ls tmp-output/); do python get_frames.py tmp-output/$f > tmp-frames/$f.frames 2>/dev/null; done
echo 'done'
echo ''

# Combine the s-expressions into one Lisp file to be
# loaded by the FrameNet-to-schema mapping code
echo -n 'combining FrameNet Lisp files... '
python mk-total-lisp.py tmp-frames > tmp-story-frames.lisp
echo 'done'
echo ''

cp tmp-story-frames.lisp ~/Code/schemas

# Map the FrameNet frames into protoschemas
cd ~/Code/schemas

# Use an RNG seed of 1
echo -n 'FrameNet frame to EL schema mapping beginning now'
echo ''
sbcl --script parse-frames.lisp 0 tmp-story-frames.lisp | tee tmp-mapped-schemas.txt

# I'm not sure whether I need to do this or not
cd ~/Code/schemas/nesl
