from collections import defaultdict
from nltk.corpus import wordnet

def lemma_to_el(lemma):
    # spl = str(lemma)[7:][:-2].split('.')
    # num = int(spl[2])
    # return ("%s_%d.%s" % (spl[0], num, spl[1])).upper()
    # return ("%s.%s" % (spl[-1], spl[1])).upper()
    return ("%s.%s" % (lemma.name(), lemma.synset().pos()))

def lemma_str_to_el(lemma_str):
    spl = lemma_str.split('.')
    # num = int(spl[2])
    # return ("%s_%d.%s" % (spl[0], num, spl[1])).upper()
    return ("%s.%s" % (spl[0], spl[1])).upper()

def el_to_lemma(el):
    spl = el.split('.')
    wspl = spl[0].split('_')

    # sense = int(wspl[-1])
    sense = 1
    word = '_'.join(wspl).lower()
    pos = spl[1].lower()

    return '%s.%s.%02d' % (word, pos, sense)
    

def wn_hypernyms(lemma):
    syns = wordnet.synset(lemma)
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

def hypernym_chain(synset):
    hyps = [synset]
    while True:
        # print hyps
        hypernym = hyps[-1].hypernyms()
        if hypernym == []:
            break
        hyps.append(hypernym[0]) # forget multiple hyps
    return hyps

def synset_to_els(synset):
    lemmas = synset.lemmas()
    #els = lisp_list([lemma_to_el(x) for x in lemmas])
    els = [lemma_to_el(x) for x in lemmas]
    return els

def lispify_dict(d, name):
    lst_name = "*%s_LST*" % (name.upper())
    map_name = "*%s*" % (name.upper())

    print "(defparameter %s '(" % (lst_name)
    for k in d:
        print " (%s %s)" % (k, d[k])
    print "))"

    print ""

    print "(defparameter %s (make-hash-table :test #'equal))" % (map_name)
    print "(loop for p in %s" % (lst_name)
    print " do (setf (gethash (car p) %s) (second p)))" % (map_name)
        

el_to_syns = dict()


all_lemmas = set()
all_synsets = set()
for ss in wordnet.all_synsets():
    if ss.pos() not in [u'v', u'n', u'a']:
        continue
    if '.' in ss.lemmas()[0].name():
        continue

    el = lemma_to_el(ss.lemmas()[0])
    lemma = el_to_lemma(el)
    all_lemmas.add(lemma)
    # print lemma
    corrected_sense = wordnet.synset(lemma)
    all_synsets.add(corrected_sense)
    

cap = -1

el_to_ladders = defaultdict(list)

synset_to_ids = dict()
ids_to_synset = dict()
j = 0
# for raw_synset in all_synsets:
for lemma in all_lemmas:
    raw_synset = wordnet.synset(lemma)

    if cap >= 0 and j >= cap:
        break
    synset = lisp_list(synset_to_els(raw_synset))
    if synset in synset_to_ids:
        continue
    synset_to_ids[synset] = j
    ids_to_synset[j] = synset

    # el = lemma_to_el(raw_synset.lemmas()[0])
    # print lemma
    el = lemma_str_to_el(lemma)
    # print el
    if el not in el_to_syns:
        # el_to_syns[lemma_to_el(raw_synset.lemmas()[0])] = j
        el_to_syns[el] = j

    # print "synset ID for %s is %d" % (el, j)
    # print "that synset is %s" % (ids_to_synset[j])

    j += 1



chains_to_ids = dict()
ids_to_chains = dict()

i = 0
k = 0
for raw_synset in all_synsets:
    if cap >= 0 and i >= cap:
        break
    #if synset.hypernyms():
    #    print synset_to_els(synset)
    #    for hypset in hypernym_chain(synset)[1:]:
    #        print "\t%s" % (synset_to_els(hypset))
    #    print ""

    synset = synset_to_els(raw_synset)

    # print hypernym_chain(raw_synset)
    # chain = lisp_list([synset_to_ids[lisp_list(synset_to_els(x))] for x in hypernym_chain(raw_synset)[1:]])
    chain = []
    for x in hypernym_chain(raw_synset)[1:]:
        x_lst = lisp_list(synset_to_els(x))
        if x_lst in synset_to_ids:
            chain.append(synset_to_ids[x_lst])
    chain = lisp_list(chain)

    ids_to_chains[k] = chain
    for el in synset[:1]:
        el_to_ladders[el].append(k)
    k += 1

    i += 1

for el in el_to_ladders.keys():
    el_to_ladders[el] = lisp_list(el_to_ladders[el])


lispify_dict(synset_to_ids, 'synset_to_ids')
lispify_dict(ids_to_synset, 'ids_to_synset')
lispify_dict(ids_to_chains, 'ids_to_chains')
lispify_dict(el_to_ladders, 'el_to_ladders')
lispify_dict(el_to_syns, 'el_to_syns')


