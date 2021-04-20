#!/bin/bash

sbcl --dynamic-space-size 10240 --script test-compose.lisp 0 30 | tee apr-16-mtg-0.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 30 60 | tee apr-16-mtg-1.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 60 90 | tee apr-16-mtg-2.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 90 120 | tee apr-16-mtg-3.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 120 150 | tee apr-16-mtg-4.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 150 180 | tee apr-16-mtg-5.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 180 210 | tee apr-16-mtg-6.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 210 240 | tee apr-16-mtg-7.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 240 270 | tee apr-16-mtg-8.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 270 300 | tee apr-16-mtg-9.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 300 330 | tee apr-16-mtg-10.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 330 360 | tee apr-16-mtg-11.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 360 390 | tee apr-16-mtg-12.txt
