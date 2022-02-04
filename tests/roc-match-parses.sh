#!/bin/bash

for i in $(seq 0 399 | shuf); do sbcl --script match-parse.lisp ~/Code/lome/tmp-orig-stories/story$i.txt | tee -a roc-matches.txt; done
