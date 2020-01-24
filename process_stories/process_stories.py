import csv
from StringIO import StringIO
from heapq import heappush, heappushpop
from nltk.tokenize import TreebankWordTokenizer

K_RATIOS = 300

stories = []
with open('raw_stories.txt', 'r') as f:
    take = False
    for line in f.readlines():
        if 'Content=' in line:
            take = True
            continue
        if take:
            take = False
            stories.append(line.strip())

tokenizer = TreebankWordTokenizer()
reader_tokens = set()
for story in stories:
    for token in tokenizer.tokenize(story):
        add_tok = token
        if token[-1] == '.':
            add_tok = token[:-1]
        reader_tokens.add(add_tok.lower())


def uncsv(story):
    f = StringIO(story)
    return '\n'.join([x for x in csv.reader(f, delimiter=',')][0])

with open('roc2.csv', 'r') as f:
    top_ratios = []


    i = 0
    for line in f.readlines():
        if i%10000 == 0:
            print i
        i += 1
        raw_roc_tokens = tokenizer.tokenize(line)
        roc_tokens = set()
        for tok in raw_roc_tokens:
            add_tok = tok
            if tok[-1] == '.':
               add_tok = tok[:-1] 
            roc_tokens.add(add_tok.lower())

        if len(roc_tokens) > 0:
            recognized = len(roc_tokens.intersection(reader_tokens))
            total = len(roc_tokens)
            ratio = recognized*1.0/total

            # HACK: modify ratio to account for total story length
            ratio -= (len(line) * 1.0 / 398)

            # print "%d / %d (%.2f)" % (recognized, total, ratio)

            if len(top_ratios) < K_RATIOS:
                heappush(top_ratios, (ratio, line))
            else:
                heappushpop(top_ratios, (ratio, line))

    print min([x[0] for x in top_ratios])
    print '\n\n'.join([uncsv(x[1]) for x in sorted(top_ratios, reverse=True)])
