import os
import sys
from allennlp.predictors import predictor
# import allennlp_models.coref
from collections import defaultdict

my_dir = os.path.dirname(os.path.realpath(__file__))

# predictor = Predictor.from_path("/Users/l/Code/schemas/allen-coref/coref-spanbert-large-2021.03.10.tar.gz")
# coref = predictor.Predictor.from_path("%s/coref-spanbert-large-2021.03.10.tar.gz" % (my_dir))
coref = predictor.Predictor.from_path("/home/lane/Code/schemas/allen-coref/coref-spanbert-large-2021.03.10.tar.gz")
# predictor = Predictor.from_path("/tmp/mymount/coref-spanbert-large-2021.03.10.tar.gz")
# predictor._dataset_reader._token_indexers['token_characters']._min_padding_length = 5
# print("document is %s" % sys.argv[1])
res = coref.predict(sys.argv[1])

pronouns = set('''
    they
    them
    their
    he him his
    she her hers
    i me my
    it
'''.strip().split())

def non_pronoun(doc, cluster):
    longest = ""
    for span in cluster:
        spanstr = ' '.join(doc[span[0]:span[1]+1])
        if spanstr.lower() in pronouns:
            continue
        elif len(spanstr) > len(longest):
            longest = spanstr
    return longest

def replace_span(toks, start, end, new):
    return toks[:start] + new + toks[end+1:]

i = 0
repaired_doc = res["document"][:]
replaced = defaultdict(bool)
fresh_outer = True
print("(", end='')
print("(", end='')
for cluster in res["clusters"]:
    ent_name = non_pronoun(res["document"], cluster).upper().replace(" ", "_")
    # print("entity %d:" % (i))
    i += 1
    print("%s(" % (" " if not fresh_outer else ""), end='')
    fresh_outer = False
    fresh = True
    for span in cluster:
        print("%s(%d %d)" % (" " if not fresh else "", span[0], span[1]), end='')
        fresh = False
        new_replacements = False
        for i in range(span[0], span[1]+2):
            if not replaced[i]:
                new_replacements = True
                break
        if new_replacements:
            spantxt = res["document"][span[0]:span[1]+1]
            # print("\treplacing %s with %s" % (spantxt, ent_name))
            to_add = [ent_name]
            if ((span[1]-span[0])+1) > 1:
                padding = ["_PAD_"] * (span[1]-span[0])
                to_add = to_add + padding
            repaired_doc = replace_span(repaired_doc, span[0], span[1], to_add)
            for i in range(span[0], span[1]+2):
                replaced[i] = True
    print(")", end='')
print(")", end='')

# Next, just print the document tokenization to use for alignment
print("(", end='')
for tok in res["document"]:
	# print('|.|' if tok == '.' else tok, end=' ')
	print('"%s"' % (tok), end=' ')
print(")", end='')

print(")")

# print(' '.join([x for x in repaired_doc if x != "_PAD_"]))
