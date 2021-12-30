'''
[['ADV-E', ['{DURING}.P', ['ALL.D', 'WEEK.N']]], ['?X_J', [['ADV-A', ['ON.P', '?X_L']], 'WORK.V']]]
['?X_I', [['ADV-A', ['FROM.P', '?L1']], 'GO.5.V'], '?X_M']
['?X_J', [[['ADV-A', ['FOR.P', '?X_L']], 'BUY.V'], '?X_K']]
'''

def is_verb(s):
	return type(s) == str and len(s.split('.')) > 1 and s.split('.')[-1].lower() == 'v'

def is_adv(s):
	if type(s) == list and len(s) > 0 and type(s[0]) == str and s[0].lower() in ['adv', 'adv-a', 'adv-e', 'adv-s', 'adv-f']:
		return True

	if type(s) == str and len(s.split('.')) > 1 and s.split('.')[-1].lower() in ['adv', 'adv-a', 'adv-e', 'adv-s', 'adv-f']:
		return True

	return False

def strip_advs(prop):
	if prop is None:
		return None

	has_sent_advs = False
	real_prop = None
	for e in prop:
		if is_adv(e):
			has_sent_advs = True
		else:
			real_prop = e

	if has_sent_advs:
		return real_prop
	else:
		return prop

def pre_arg(prop):
	stripped = strip_advs(prop)
	if stripped != prop:
		return pre_arg(stripped)

	return prop[0]

def verb_from_pred(pred):
	if is_verb(pred):
		return pred

	for e in pred:
		if is_verb(e):
			return e
		elif len(e) == 2 and is_adv(e[0]):
			return verb_from_pred(e[1])

def verb_pred(prop):
	stripped = strip_advs(prop)
	if stripped != prop:
		return verb_pred(stripped)

	return verb_from_pred(prop[1])

def post_args(prop):
	stripped = strip_advs(prop)
	if stripped != prop:
		return post_args(stripped)

	args = []

	pred = prop[1]
	if type(pred) == list:
		for e in pred:
			if is_adv(e):
				continue
			if type(e) == list and is_adv(e[0]):
				continue
			if is_verb(e):
				continue
			else:
				args.append(e)

	if len(prop) > 2:
		args = args + prop[2:]

	return [arg for arg in args if not is_verb(arg)]
