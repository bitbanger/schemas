#!/bin/bash

python clustering_test.py ${1} > ${1}.txt
cat ${1}.txt | python verbalize_test.py > ${1}.html
