#!/bin/bash

# Howto
for p in $(ls howto-standalones/*.txt | sed 's/_[^_]*$//g' | sed 's/[^/]*\///g' | uniq); do mkdir howto_html/${p}; for i in $(seq 0 2); do echo -n '(' > tmp.txt; cat howto_clustered_schemas/${p}_${i}.txt | tac | head -n -1 | tac | perl -pe 'chomp if eof' >> tmp.txt; echo -n ')' >> tmp.txt; mv tmp.txt ../; cd ../; cat tmp.txt | sbcl --script render-schemas.lisp > pyschemas/howto_html/${p}/${p}_${i}.html; cd pyschemas; echo ${p}_${i}; done; done

# Normal (story)
# for p in $(ls tmp-standalones/*.txt | sed 's/_[^_]*$//g' | sed 's/[^/]*\///g' | uniq); do mkdir coling_html/${p}; for i in $(seq 0 2); do echo -n '(' > tmp.txt; cat coling_clustered_schemas/${p}_${i}.txt | tac | head -n -1 | tac | perl -pe 'chomp if eof' >> tmp.txt; echo -n ')' >> tmp.txt; mv tmp.txt ../; cd ../; cat tmp.txt | sbcl --script render-schemas.lisp > pyschemas/coling_html/${p}/${p}_${i}.html; cd pyschemas; echo ${p}_${i}; done; done

# Debug (story)
# for p in mailing_a_letter; do for i in $(seq 0 2); do echo -n '(' > tmp.txt; cat coling_clustered_schemas/${p}_${i}.txt | tac | head -n -1 | tac | perl -pe 'chomp if eof' >> tmp.txt; echo -n ')' >> tmp.txt; mv tmp.txt ../; cd ../; cat tmp.txt | sbcl --script render-schemas.lisp > pyschemas/coling_html/${p}_${i}.html; cd pyschemas; echo ${p}_${i}; done; done
