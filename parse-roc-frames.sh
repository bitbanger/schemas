#!/bin/bash

for i in $(seq 0 20 380); do sbcl --script parse-frames.lisp 0 tmp-story-frames.lisp $i | tee -a parsed-roc-schemas.txt; done
