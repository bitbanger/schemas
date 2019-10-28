WORD_LST = [
    "FIELD_1.N",
    "WAGON_1.N",
    "FLOWER_1.N",
    "SET_1.N",
]

import sys
from nltk.corpus import wordnet

WORD_LST = sys.argv[1:]

def lemma_to_el(lemma):
    spl = str(lemma)[7:][:-2].split('.')[:3]
    num = int(spl[2])
    return ("%s_%d.%s" % (spl[0], num, spl[1])).upper()

def el_to_lemma(el):
    spl = el.split('.')
    wspl = spl[0].split('_')

    sense = int(wspl[-1])
    word = '_'.join(wspl[:-1]).lower()
    pos = spl[1].lower()

    return '%s.%s.%02d' % (word, pos, sense)
    

def hypernyms(word_sym):
    syns = wordnet.synset(el_to_lemma(word_sym))
    hypernyms = [syns]
    while True:
        hypernym = hypernyms[-1].hypernyms()
        if hypernym == []:
            break
        hypernyms.append(hypernym[0])

    lemmas = []
    for hyp in hypernyms:
        lemma = hyp.lemmas()[0]
        lemmas.append(lemma_to_el(lemma))

    return lemmas[1:]

def lisp_list(lst):
    return '(' + ' '.join([str(x) for x in lst]) + ')'

def wn_hypernyms(el):
    return lisp_list(hypernyms(el))

first = True
for x in WORD_LST:
    if first:
        first = False
    else:
        print ''

    print wn_hypernyms(x)
