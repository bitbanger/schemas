#!/bin/bash

cd /home/lane/Code/schemas/lome_frame_parsing
python lome_server.py | grep -v INFO &
cd /home/lane/Code/schemas/pyschemas
python word2vec_server.py &
sleep 40
python schema_match_server.py &
cd /home/lane/Code/gpt
python gpt_server.py
