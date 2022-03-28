#!/bin/bash

for i in $(cat generated_topics.txt); do echo $i; python prompt-story-nesl.py $i; done
