from basic_levels import basic_level

from collections import defaultdict
from nltk import wordnet as wn

THRESHOLD = 0.35

groups = [
'''	KETCHUP.N
	MEAT.N
	FOOD.N
	CHIP.N
	CHEESE.N
	PEANUT.N
	COFFEE.N
	BUTTER.N
	COOKIE.N
	FRUIT.N
	BEER.N
	JUICE.N
	VEGETABLE.N
	MAYONNAISE.N
	CANDY.N
	MILK.N
	SODA.N
	EGG.N
	TEA.N
	BREAD.N
	MUSTARD.N
	WINE.N''',
'''	LAWN.N
	CAR.N
	TOILET.N
	PATIO.N
	BOWL.N
	MEDICINE.N
	WINDOW.N
	CURTAIN.N
	STALL.N
	GARAGE.N
	BASEMENT.N
	PORCH.N
	ROOM.N
	MIRROR.N
	CABINET.N
	BEDROOM.N
	OVEN.N
	PERSON.N
	KITCHEN.N
	SINK.N
	YARD.N
	MICROWAVE.N
	BATHROOM.N
	ATTIC.N
	LIVING.N
	FENCE.N
	STOVE.N''',
'''	POPCORN.N
	COOKIE.N
	PERSON.N
	TACO.N
	DOUGHNUT.N
	PIE.N
	ICE.N
	CANDY.N
	POTATO.N
	HAMBURGER.N
	CREAM.N
	SANDWICH.N
	CHICKEN.N
	FRIED.N
	SPAGHETTI.N
	PIZZA.N
	FOOD.N
	CAKE.N
	CHIP.N''',
'''	MAP.N
	BACKPACK.N
	ANIMAL.N
	CLOTHE.N
	MONEY.N
	BOOK.N
	HAT.N
	STUFFED.N
	OTHER.N
	FOOD.N
	SHOE.N
	THING.N
	TOY.N
	TOOTHBRUSH.N
	BLANKET.N''',
'''	WATCH.N
	PANT.N
	JACKET.N
	SOCK.N
	HAT.N
	TIE.N
	TOY.N'''
]

nounses = [[x.split('.')[0].lower() for x in y.strip().split()] for y in groups]

stop_words = {'substance', 'artifact', 'object', 'abstraction', 'concept', 'act', 'instrumentality', 'whole', 'part', 'causal_agent', 'physical_entity', 'entity'}

def all_hypernyms(noun, cycle_set=[]):
	hns = []
	for synset in wn.wordnet.synsets(noun):
		for hypernym in synset.hypernyms():
			hn = str(hypernym)
			if hn.split('.')[1] != 'n':
				continue
			hn = hn.split('.')[0].split("'")[-1]
			if hn not in stop_words:
				hns.append(hn)
				if hn not in cycle_set:
					hns = hns + all_hypernyms(hn, cycle_set=cycle_set+hns)
			break
		break

	return hns

for nouns in nounses:
	counts = defaultdict(int)
	for noun in nouns:
		for bl in basic_level(noun):
			if bl not in stop_words:
				counts[bl] += 1
	print(sorted([(k, counts[k], '%.2f' % (counts[k]*1.0/len(nouns))) for k in counts.keys() if k not in stop_words], key=lambda x: x[1]))
	# best = max(counts.keys(), key=lambda x: counts[x] if ((x not in stop_words) and ((counts[x] * 1.0 / len(nouns)) > THRESHOLD)) else 0)
	best = max(counts.keys(), key=lambda x: counts[x] if (counts[x]*1.0 / len(nouns) >= THRESHOLD) else 0)
	if (counts[best]*1.0 / len(nouns)) < THRESHOLD:
		best = 'entity'
	print(best)

	
'''
counts = defaultdict(int)
for noun in nouns:
	print(noun)
	print(all_hypernyms(noun))
	for hn in all_hypernyms(noun):
		counts[hn] += 1

print(sorted([(k, counts[k]) for k in counts.keys()], key=lambda x: x[1]))
'''
print(basic_level('jacket'))
