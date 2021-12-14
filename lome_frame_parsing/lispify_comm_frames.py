import concrete.inspect
import spacy
import sys

POSSIBLE_DOBJS = ['nsubj', 'nsubjpass', 'dobj', 'pobj', 'advmod']

def span_contains(big_span, little_span):
	return little_span[0] >= big_span[0] and little_span[-1] <= big_span[-1]

class Arg:
	def __init__(self, role, span, orig_span, text):
		self.role = role
		self.span = span
		self.orig_span = orig_span
		self.nested = []

class Event:
	def __init__(self, ments, ments_id, sent_offsets, dobj_idcs, dobj_vals):
		self.frame = ments.situationKind
		self.id = ments_id

		ments_sent = ' '.join([x.text for x in ments.tokens.tokenization.tokenList.tokenList])
		invoker_span_offset = sent_offsets[ments_sent]

		invoker_span = [ments.tokens.tokenIndexList[0] + invoker_span_offset]
		if len(ments.tokens.tokenIndexList) > 1:
			invoker_span.append(ments.tokens.tokenIndexList[-1] + invoker_span_offset)
		self.invoker_span = invoker_span

		self.orig_invoker_span = invoker_span[::]

		# Get all dobj_idcs that apply
		found_idcs = []
		for k in range(len(dobj_idcs)):
			dobj_idx = dobj_idcs[k]
			dobj_val = dobj_vals[k]
			if invoker_span[0] <= dobj_idx and invoker_span[-1] >= dobj_idx:
				found_idcs.append((dobj_idx, dobj_val))

		if len(found_idcs) > 0:
			best_dobj_pick = min(found_idcs, key=lambda x: POSSIBLE_DOBJS.index(x[1]))[0]
			invoker_span = (best_dobj_pick, best_dobj_pick)

		self.invoker_text = ments.text

		args = []
		for arg in ments.argumentList:
			if not arg.entityMention:
				continue
			toks = [tok.text for tok in arg.entityMention.tokens.tokenization.tokenList.tokenList]

			arg_sent = ' '.join(toks)
			arg_span_offset = sent_offsets[arg_sent]

			tok_idcs = arg.entityMention.tokens.tokenIndexList
			tok_span = [tok_idcs[0] + arg_span_offset]

			if len(tok_idcs) > 1:
				tok_span.append(tok_idcs[-1] + arg_span_offset)

			orig_tok_span = tok_span[::]

			for dobj_idx in dobj_idcs:
				if tok_span[0] <= dobj_idx and tok_span[-1] >= dobj_idx:
					tok_span = (dobj_idx, dobj_idx)
					break

			args.append(Arg(arg.role, tok_span, orig_tok_span, toks[(tok_span[0]-arg_span_offset):(tok_span[-1]-arg_span_offset)+1]))
		self.args = args

	def render_lisp(self):
		buf = []

		buf.append('(%d %s (%d %d)' % (self.id, self.frame, self.invoker_span[0], self.invoker_span[-1]))
		buf.append('\t(')
		for arg in self.args:
			buf.append('\t\t(%s (%d %d) (%s))' % (arg.role, arg.span[0], arg.span[-1], ' '.join([str(x) for x in arg.nested])))
		buf.append('\t)')
		buf.append(')')

		return '\n'.join(buf)

class FrameLispifier:
	def __init__(self):
		self.dep_parser = spacy.load('en_core_web_sm')

	def lispify_frame(self, comm, orig_story):
		sents = [x for x in comm.text.split('\n') if x != '']

		sent_token_counts = dict()
		sents_to_tokens = dict()

		for sent in sents:
			sent_token_counts[sent] = len(sent.strip().split(' '))
			sents_to_tokens[sent] = sent.strip().split(' ')

		sent_offsets = dict()
		sent_offsets[sents[0]] = 0
		total = 0
		for i in range(1, len(sents)):
			sent_offsets[sents[i]] = total + sent_token_counts[sents[i-1]]
			total += sent_token_counts[sents[i-1]]

		dobj_idcs = []
		dobj_vals = []
		for sent in sents:
			deps = [tok for tok in self.dep_parser(sent)]
			for i in range(len(deps)):
				if deps[i].dep_ in POSSIBLE_DOBJS:
					dobj_idcs.append(i+sent_offsets[sent])
					dobj_vals.append(deps[i].dep_)

		events = []

		ments_id_counter = 0
		for sitset in comm.situationMentionSetList:
			for ments in sitset.mentionList:
				if not ments.text:
					continue
				events.append(Event(ments, ments_id_counter, sent_offsets, dobj_idcs, dobj_vals))
				ments_id_counter += 1

		# Find nesters
		for i in range(len(events)):
			for j in range(len(events)):
				if i == j:
					continue

				nester = events[i]
				nested = events[j]

				for arg in nester.args:
					if span_contains(arg.span, nested.invoker_span):
						# print('%s~%s contains %s~%s' % (nester.frame, arg[2], nested.frame, nested.invoker_text))
						arg.nested.append(j)

		# Render the Lisp
		buf = []
		buf.append('(')

		buf.append('; story sentence text for lookup')
		buf.append('(%s)' % (' '.join(['"%s"' % line.replace('"', '\\"') for line in orig_story.split('\n')])))

		buf.append('; events')
		buf.append('(')
		for event in events:
			buf.append(event.render_lisp())
		buf.append(')')

		buf.append(')')

		return '\n'.join(buf)

	def lispify_multiple_frames(self, pairs):
		lisps = []

		buf = []
		buf.append("(defparameter *ALL-STORY-FRAMES* '(")
		for (comm, orig_txt) in pairs:
			buf.append(self.lispify_frame(comm, orig_txt))
		buf.append("))")

		return '\n'.join(buf)

if __name__ == '__main__':
	# test code

	fl = FrameLispifier()
	from concrete.util import read_communication_from_file as read_comm
	comm = read_comm('new-output/story2.comm')
	orig = ''
	with open('tmp-orig-stories/story2.txt', 'r') as f:
		orig = f.read().strip()

	print(fl.lispify_frame(comm, orig))
