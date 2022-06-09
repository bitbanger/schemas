#!/bin/bash

# Compare schemas to GPT-generated completions
# for t in $(cat emnlp_topics.txt); do echo '--------------------------'; echo ${t}; echo ''; echo "SCHEMA:"; cat pyschemas/emnlp_clustered_schemas/${t}.txt | tail -n +2 | sbcl --script schema-verb-test.lisp; echo "GPT:"; cat pyschemas/emnlp-howto-standalones/${t}_3.txt | grep ';'; echo '--------------------------'; echo ''; echo ''; echo ''; done

# Compare schemas to single-story schemas
# for t in $(cat emnlp_topics.txt); do echo '--------------------------'; echo ${t}; echo ''; echo "MULTI:"; cat pyschemas/emnlp_clustered_schemas/${t}.txt | tail -n +2 | sbcl --script schema-verb-test.lisp; echo "SINGLE:"; cat pyschemas/emnlp-howto-standalones/${t}_4.txt | tail -n +2 | sbcl --script schema-verb-test.lisp; echo '--------------------------'; echo ''; echo ''; echo ''; done

# coling
# for t in $(cat coling_topics.txt); do echo '--------------------------'; echo ${t}; echo ''; echo "MULTI:"; cat pyschemas/coling_clustered_schemas/${t}_1.txt | tail -n +2 | sbcl --script schema-verb-test.lisp; echo "SINGLE:"; cat pyschemas/tmp-standalones/${t}_1.txt | tail -n +2 | sbcl --script schema-verb-test.lisp; echo '--------------------------'; echo ''; echo ''; echo ''; done

# Just verbalize coling schemas
for t in $(cat coling_topics.txt); do echo ${t}; cat pyschemas/coling_clustered_schemas/${t}_0.txt | tail -n +2 | sbcl --script schema-verb-test.lisp | grep -v 'NIL'; echo ''; echo ''; done
# for t in $(head -n 1 coling_topics.txt); do echo ${t}; cat pyschemas/coling_clustered_schemas/${t}_2.txt | tail -n +2 | sbcl --script schema-verb-test.lisp; echo ''; echo ''; done
