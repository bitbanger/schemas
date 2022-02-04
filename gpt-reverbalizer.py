import sys

import xmlrpc.client

reverb_client = xmlrpc.client.ServerProxy('http://localhost:8041')

print(reverb_client.reverbalize(sys.argv[1]))
