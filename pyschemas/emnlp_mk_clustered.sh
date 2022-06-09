#!/bin/bash

for t in $(ls emnlp-howto-standalones | sed 's/_[^_]*$//g' | uniq); do python clustering_test.py ${t} > emnlp_clustered_schemas/${t}.txt; echo ${t}; done
