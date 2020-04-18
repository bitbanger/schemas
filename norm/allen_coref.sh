#!/bin/bash

# NOTE: on my machine, I have my virtualenv in a weird place.
#if [ $(whoami) == llawley ]; then
#	cd /u/llawley/Downloads
#	source .env/bin/activate
#fi

python3.6 allen_coref.py "$1" 2>/dev/null
