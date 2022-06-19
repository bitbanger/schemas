# Code for turning EL propositions in the pyschemas
# library into AMRs. Hopefully the AMRs are then
# useful as the basis for a distance metric for EL
# propositions.

from collections import defaultdict
from el_expr import *
from schema import ELFormula, Schema, Section, schema_from_file, schema_and_protos_from_file, rec_replace
from schema_match import grounded_schema_prop_to_vec, prop_to_vec, grounded_schema_prop, grounded_prop, rec_get_vars, rec_get_advs, is_adv, rec_get_pred
from sexpr import list_to_s_expr, parse_s_expr

def adv_to_amr(adv):
	if type(adv) != list:
		return adv

	amr = ['V', '/', adv[0], ':ARG0',
		['V', '/', adv[1][0], ':ARG0',
			ind_to_amr(adv[1][1])]]

	return amr

def ind_to_amr(ind):
	print('ind %s' % ind)
	if type(ind) != list:
		tag = ind.split('.')[1]
		if tag.upper() == 'SK':
			word = ''
			for c in ind:
				if c not in '0123456789':
					word = word + c
				else:
					break
			word = word + '.N'
			return ['V', '/', 'N+PREDS', ':ARG0', ['V', '/', word]]
		else:
			return ind
	if ind[0] in ['K', 'PLUR']:
		return ['V', '/', 'N+PREDS', ':ARG0', ['V', '/', ind[1]]]

def pred_to_amr(pred):
	verb = verb_from_pred(pred)
	advs = rec_get_advs(pred)
	post_args = []
	stripped = remove_advs(pred)
	if type(stripped) == list:
		for e in stripped:
			if e != verb:
				post_args.append(e)

	# Flatten adv modifiers and post args
	# into numbered AMR args
	amr_args = []
	for adv in advs:
		amr_args.append(adv_to_amr(adv))
	for post_arg in post_args:
		amr_args.append(ind_to_amr(post_arg))

	amr = ['V', '/', 'COMPLEX', ':INSTANCE', ['V', '/', verb]]
	for i in range(len(amr_args)):
		amr.append(':ARG%d' % i)
		amr.append(amr_args[i])

	return amr

def number_vs(amr, counter=1):
	for i in range(len(amr)):
		if amr[i] == 'V':
			amr[i] = 'V%d' % (counter)
			counter += 1
		elif type(amr[i]) == list:
			counter = number_vs(amr[i], counter=counter)
	return counter
			

def el_to_amr(prop):
	(pre, pred) = (pre_arg(prop), prop[1])

	amr = ['V', '/', pre, ':ARG0', pred_to_amr(pred)]

	# Number the Vs
	number_vs(amr)

	# Render into an s-expression
	return str(list_to_s_expr(amr))
