#!/usr/bin/bash

# This computes features for each generalized schema that may be
# useful to a linear classifier in determining which schemas produced
# high-quality inferences as judged by human annotators.

for t in $(cat ../nesl/emnlp_topics.txt); do python clustering_test.py ${t} | tail -n 8; done
