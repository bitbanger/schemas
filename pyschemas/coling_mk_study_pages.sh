#!/bin/bash

for p in $(ls tmp-standalones/ | sed 's/_[^_]*$//g' | uniq); do cat coling_clustered_schemas/${p}_0.txt | python mk_study_pages.py; done
