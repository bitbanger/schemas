#!/bin/bash

rm -rf ~/Code/schemas/pyschemas/tmp-standalones
cp -r prompt-standalones ~/Code/schemas/pyschemas/tmp-standalones

cd ~/Code/schemas/pyschemas

python schema_gen.py ${1} > ${1}.txt

mv ${1}.txt ~/Code/schemas/nesl/prompt-gen-schemas
