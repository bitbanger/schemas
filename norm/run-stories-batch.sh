#!/bin/bash

sbcl --script playground3.lisp 0 100   | tee clarg1.lisp
sleep 5
sbcl --script playground3.lisp 100 200 | tee clarg2.lisp
sleep 5
sbcl --script playground3.lisp 200 300 | tee clarg3.lisp
sleep 5
sbcl --script playground3.lisp 300 400 | tee clarg4.lisp
sleep 5
sbcl --script playground3.lisp 400 500 | tee clarg5.lisp
sleep 5
sbcl --script playground3.lisp 500 562 | tee clarg6.lisp
