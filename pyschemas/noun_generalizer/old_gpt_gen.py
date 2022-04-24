import argparse
import random
import subprocess
import sys
import xmlrpc.client

from transformers import GPT2Tokenizer

parser = argparse.ArgumentParser(description='Complete text with GPT')

parser.add_argument('nouns', type=str)

parser.add_argument('--temp', type=float, default=0.2, help='Completion temperature')

parser.add_argument('--rep_pen', type=float, default=1.1, help='Completion repetition penalty')

parser.add_argument('--resp_length', type=int, default=128, help='Completion length, in tokens')

parser.add_argument('--prompt_limit', type=int, default=512, help='The maximum number of tokens to use for the story generation prompt')

parser.add_argument('--num_stories', type=int, default=5, help='The number of stories to generate')

parser.add_argument('--num_similar', type=int, default=3, help='The number of similar stories to generate for each story, to help refine schemas')

parser.add_argument('--similar_temp', type=float, default=0.4, help='Completion temperature for similar story generation')

parser.add_argument('--similar_rep_pen', type=float, default=1.12, help='Completion repetition penalty for similar story generation')

parser.add_argument('--output_dir', type=str, default='.', help='The directory to store the output story files in AFTER tokenization')

parser.add_argument('--orig_story_dir', type=str, default='.', help='The directory to store the output story files in BEFORE tokenization')

args = parser.parse_args()

server = xmlrpc.client.ServerProxy('http://localhost:8000')

tokenizer = GPT2Tokenizer.from_pretrained('distilgpt2')

PROMPT='''NOUNS: cheetah lion seal mosquito dog cat
CLASS: animal

NOUNS: shirt pants computer skirt dress slacks suit tie jacket
CLASS: clothing

NOUNS: computer candle controller lighter cup paper
CLASS: object

NOUNS: monitor tv display
CLASS: screen

NOUNS: google dog amazon yahoo netflix
CLASS: website

NOUNS: %s
CLASS:'''

inp = PROMPT % (args.nouns,)
input_ids = tokenizer(inp, return_tensors='pt').input_ids

resp = server.gen(inp, args.temp, args.rep_pen, min(2048, len(input_ids.squeeze())+args.resp_length))

print(resp.split('\n')[:len(inp.split('\n'))][-1])
