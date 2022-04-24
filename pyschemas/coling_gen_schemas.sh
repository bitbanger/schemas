#!/bin/bash

for f in $(ls howto-standalones/*.txt | sed 's/_[^_]*$//g' | sed 's/[^/]*\///g' | uniq); do for i in $(seq 0 2); do python clustering_test.py ${f} > howto_clustered_schemas/${f}_${i}.txt; echo ${f}_${i}; done; done
