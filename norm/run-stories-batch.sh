#!/bin/bash

#sbcl --script playground3.lisp 0 100   | tee third-clarg1.lisp
#sleep 5
sbcl --script playground3.lisp 100 200 | tee third-clarg2.lisp
sleep 5
sbcl --script playground3.lisp 200 300 | tee third-clarg3.lisp
sleep 5
sbcl --script playground3.lisp 300 400 | tee third-clarg4.lisp
sleep 5
sbcl --script playground3.lisp 400 500 | tee third-clarg5.lisp
sleep 5
sbcl --script playground3.lisp 500 562 | tee third-clarg6.lisp
