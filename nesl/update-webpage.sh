#!/bin/bash

cp nesl-compos.lisp old-nesl-compos.lisp

tac old-nesl-compos.lisp | tail -n +2 | tac > nesl-compos.lisp

python extract_composites.py nesl_output.txt >> nesl-compos.lisp

echo '))' >> nesl-compos.lisp

sbcl --script make-nesl-webpage.lisp

scp -r nesl-webpage cycle3:/u/www/u/llawley/
