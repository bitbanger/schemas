#!/bin/bash

cd ../

cat nesl/${1} | sbcl --script run-verbalizer.lisp
