import sys
import xmlrpc.client

server = xmlrpc.client.ServerProxy('http://localhost:8000')

print(server.word2vec_similarity(sys.argv[1], sys.argv[2]))
