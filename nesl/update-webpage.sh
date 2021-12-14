#!/bin/bash

cp ~/Code/schemas/tests/nesl-compos.lisp ~/Code/schemas/tests/old-nesl-compos.lisp

tac ~/Code/schemas/tests/old-nesl-compos.lisp | tail -n +2 | tac > ~/Code/schemas/tests/nesl-compos.lisp

cd ~/Code/lome
python extract-composites.py nesl_output.txt >> ~/Code/schemas/tests/nesl-compos.lisp

echo '))' >> ~/Code/schemas/tests/nesl-compos.lisp

cd ~/Code/schemas/tests

sbcl --script make-nesl-webpage.lisp

scp -r nesl-webpage cycle3:/u/www/u/llawley/
