#!/bin/bash

sbcl --script playground3.lisp 0 100   | tee final-clarg1.lisp
sleep 5
sbcl --script playground3.lisp 100 200 | tee final-clarg2.lisp
sleep 5
sbcl --script playground3.lisp 200 300 | tee final-clarg3.lisp
sleep 5
sbcl --script playground3.lisp 300 400 | tee final-clarg4.lisp
sleep 5
sbcl --script playground3.lisp 400 500 | tee final-clarg5.lisp
sleep 5
sbcl --script playground3.lisp 500 562 | tee final-clarg6.lisp
