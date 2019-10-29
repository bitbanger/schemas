#!/bin/bash

cat ../simple_stories.txt | sbcl --script fix-el.lisp
