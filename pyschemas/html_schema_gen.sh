#!/bin/bash

echo '(' > tmp && python schema_gen.py ${1} >> tmp && echo ')' >> tmp && cd .. && cat pyschemas/tmp | sbcl --script render-schemas.lisp | sed '1d' > pyschemas/tmp.html && cd pyschemas && scp tmp.html cycle3:/u/www/u/llawley/${1}.html
