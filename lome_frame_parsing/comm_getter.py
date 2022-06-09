import sys

import xmlrpc.client

lome_client = xmlrpc.client.ServerProxy('http://localhost:8040')

story = sys.stdin.read().strip()

print(lome_client.get_comm_files([story]))
