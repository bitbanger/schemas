'''
[['ADV-E', ['{DURING}.P', ['ALL.D', 'WEEK.N']]], ['?X_J', [['ADV-A', ['ON.P', '?X_L']], 'WORK.V']]]
['?X_I', [['ADV-A', ['FROM.P', '?L1']], 'GO.5.V'], '?X_M']
['?X_J', [[['ADV-A', ['FOR.P', '?X_L']], 'BUY.V'], '?X_K']]
'''
def rec_get_pred(lst, pred=lambda x: False, dismiss_pred=lambda x: False):
	if pred(lst):
		return [lst]

	if dismiss_pred(lst):
		return []

	if type(lst) != list:
		return []

	ret_lst = []
	for e in lst:
		if pred(e):
			ret_lst.append(e)
		elif type(e) == list:
			ret_lst += rec_get_pred(e, pred=pred, dismiss_pred=dismiss_pred)

	return ret_lst

def rec_get_advs(lst, inside_abstractions=True):
	if inside_abstractions:
		return rec_get_pred(lst, pred=is_adv)
	else:
		return rec_get_pred(lst, pred=is_adv, dismiss_pred=is_abstraction)

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

def is_starry(prop):
	return (len(prop) == 3) and (prop[1] == '**')

def pre_arg(prop):
	stripped = strip_advs(prop)
	if stripped != prop:
		return pre_arg(stripped)

	return prop[0]

def verb_from_pred(pred):
	if is_verb(pred):
		return pred
	stripped = remove_advs(pred)
	if stripped != pred:
		return verb_from_pred(stripped)

	for e in pred:
		if is_verb(e):
			return e
		elif len(e) == 2 and is_adv(e[0]):
			return verb_from_pred(e[1])

def verb_pred(prop):
	stripped = remove_advs(prop)
	if stripped != prop:
		return verb_pred(stripped)

	return verb_from_pred(prop[1])

def post_args(prop):
	stripped = remove_advs(prop)
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

def has_suff(e, suff):
	if type(e) == str and len(e) > len(suff)+1 and len(e.split('.')) > 1 and len(e.split('.')[-1]) >= len(suff) and e.split('.')[-1][:len(suff)].lower() == suff.lower():
		return True
	else:
		return False

def remove_advs(l):
	if not type(l) == list:
		return l

	new_l = []
	for e in l:
		if is_adv(e):
			continue
		elif type(e) == list:
			new_l.append(remove_advs(e))
		else:
			new_l.append(e)

	# if len(new_l) == 1 and type(new_l[0]) == list:
	if len(new_l) == 1:
		return new_l[0]

	return new_l

def flatten_prop(step):
	if type(step) == list and len(step) == 1 and type(step[0]) == list:
		return flatten_prop(step[0])

	step = remove_advs(step)

	pre_arg = step[0]
	vp = remove_advs(step[1])
	posts = step[2:]

	verb_posts = []
	verb_pred = None
	if type(vp) == str:
		verb_pred = vp
	elif type(vp) == list:
		for e in vp:
			if has_suff(e, 'v'):
				verb_pred = e
			elif type(e) == list:
				got_verb_pred = False
				for e2 in e:
					if has_suff(e2, 'v'):
						got_verb_pred = True
						verb_pred = e2
				if not got_verb_pred:
					verb_posts.append(e)
			else:
				verb_posts.append(e)

	if verb_pred is None:
		return None

	verb_pred = verb_pred.split('.')[0]

	return [pre_arg, verb_pred] + verb_posts + posts

def elf_breakdown(prop):
	(pre, pred) = (pre_arg(prop), prop[1])
	flat_posts = []
	if len(prop) > 2:
		flat_posts = prop[2:]
	verb = verb_from_pred(pred)
	advs = rec_get_advs(pred)
	post_args = []
	stripped = remove_advs(pred)
	if type(stripped) == list:
		for e in stripped:
			if e != verb:
				post_args.append(e)
	post_args = post_args + flat_posts

	return (pre, verb, post_args, advs)
