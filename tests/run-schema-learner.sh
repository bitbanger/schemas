#!/bin/bash

DATE=${1}

if [ ! ${1} ]; then
	echo "Please provide a folder name for output."
	exit
fi

NUMSECTORS=3906000 # a sector is 512 bytes
mydev=`hdiutil attach -nomount ram://$NUMSECTORS`
newfs_hfs $mydev
mkdir /tmp/mymount
mount -t hfs $mydev /tmp/mymount
cp ../allen-coref/coref-spanbert-large-2020.02.27.tar.gz /tmp/mymount

rm -rf $DATE-output
mkdir $DATE-output
sbcl --dynamic-space-size 10240 --script test-compose.lisp 0 30 | tee $DATE-output/$DATE-mtg-0.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 30 60 | tee $DATE-output/$DATE-mtg-1.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 60 90 | tee $DATE-output/$DATE-mtg-2.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 90 120 | tee $DATE-output/$DATE-mtg-3.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 120 150 | tee $DATE-output/$DATE-mtg-4.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 150 180 | tee $DATE-output/$DATE-mtg-5.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 180 210 | tee $DATE-output/$DATE-mtg-6.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 210 240 | tee $DATE-output/$DATE-mtg-7.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 240 270 | tee $DATE-output/$DATE-mtg-8.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 270 300 | tee $DATE-output/$DATE-mtg-9.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 300 330 | tee $DATE-output/$DATE-mtg-10.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 330 360 | tee $DATE-output/$DATE-mtg-11.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 360 390 | tee $DATE-output/$DATE-mtg-12.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 390 420 | tee $DATE-output/$DATE-mtg-13.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 420 450 | tee $DATE-output/$DATE-mtg-14.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 450 480 | tee $DATE-output/$DATE-mtg-15.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 480 510 | tee $DATE-output/$DATE-mtg-16.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 510 540 | tee $DATE-output/$DATE-mtg-17.txt
sbcl --dynamic-space-size 10240 --script test-compose.lisp 540 560 | tee $DATE-output/$DATE-mtg-18.txt

sudo umount -l /tmp/mymount
