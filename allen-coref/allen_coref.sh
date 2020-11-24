#!/bin/bash

# NOTE: on my machine, I have my virtualenv in a weird place.
#if [ $(whoami) == llawley ]; then
#	cd /u/llawley/Downloads
#	source .env/bin/activate
#fi

MY_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )

python3 $MY_DIR/allen_coref.py "$1" 2>/dev/null
