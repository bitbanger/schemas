import argparse
import random
import subprocess
import sys
import xmlrpc.client

from transformers import GPT2Tokenizer

server = xmlrpc.client.ServerProxy('http://localhost:8000')

tokenizer = GPT2Tokenizer.from_pretrained('distilgpt2')

PROMPT = r'''Story:

Tom loved playing baseball.
He had a big game.
He was up to hit.
He hit a long drive.
He made a run and won the game.

Story topic:

baseball

More stories about baseball:

Bob went to see a baseball game.
The players had nice bats.
The players swung at the ball.
One player hit the ball.
He hit a home run.

Jenny was playing baseball.
She took a bat and got ready.
She swung her bat at the ball.
She hit the ball.
She won the game.

--------
Story:

The man took a shower.
The hot water went cold.
He still had soap in his hair.
He washed his hair quickly.
He was shivering when he got out of the shower.

Story topic:

showers

More stories about showers:

Jenny took a shower.
She used soap to wash her body.
She washed her hair.
The water was warm.
She dried off with a towel.

Jack was dirty.
He needed to get clean.
He took a long shower.
The shower water was very hot.
He used plenty of soap.

--------
Story:

Jessie loved plants.
She had plants in her apartment.
She watered the plants every day.
Her favorite plant was her fern.
Jessie wanted to buy more plants.

Story topic:

plants

More stories about plants:

Alan bought a plant at the store.
The plant died.
He bought another plant.
He watered it.
It didn't die.

Plants are usually green.
Some plants are different colors.
Sometimes people keep plants in their houses.
They water those plants.
People like plants.

--------
Story:

Emma went to school.
She studied math.
She ate lunch.
Her teacher gave her a lot of homework.
Later, she went home.

Story topic:

school

More stories about school:

Jason was at school.
He ate lunch in the cafeteria.
After lunch, he went to class.
His teacher taught him about math.
He went home and ate dinner.

Abhishek loved to go to school.
His teacher gave him fun homework.
He finished his homework and gave it back to the teacher.
The teacher said Abhishek did a good job.
The teacher gave him a good grade.

--------
Story:

%s

Story topic:'''

TOPIC_PROMPT = r'''Stories about baseball:

Tom loved playing baseball.
He had a big game.
He was up to hit.
He hit a long drive.
He made a run and won the game.

Bob went to see a baseball game.
The players had nice bats.
The players swung at the ball.
One player hit the ball.
He hit a home run.

Jenny was playing baseball.
She took a bat and got ready.
She swung her bat at the ball.
She hit the ball.
She won the game.

--------
Stories about showers:

The man took a shower.
The hot water went cold.
He still had soap in his hair.
He washed his hair quickly.
He was shivering when he got out of the shower.

Jenny took a shower.
She used soap to wash her body.
She washed her hair.
The water was warm.
She dried off with a towel.

Jack was dirty.
He needed to get clean.
He took a long shower.
The shower water was very hot.
He used plenty of soap.

--------
Stories about plants:

Jessie loved plants.
She had plants in her apartment.
She watered the plants every day.
Her favorite plant was her fern.
Jessie wanted to buy more plants.

Alan bought a plant at the store.
The plant died.
He bought another plant.
He watered it.
It didn't die.

Plants are usually green.
Some plants are different colors.
Sometimes people keep plants in their houses.
They water those plants.
People like plants.

--------
Stories about school:

Emma went to school.
She studied math.
She ate lunch.
Her teacher gave her a lot of homework.
Later, she went home.

Jason was at school.
He ate lunch in the cafeteria.
After lunch, he went to class.
His teacher taught him about math.
He went home and ate dinner.

Abhishek loved to go to school.
His teacher gave him fun homework.
He finished his homework and gave it back to the teacher.
The teacher said Abhishek did a good job.
The teacher gave him a good grade.

Stories about %s:'''

def make_topical_stories(topic, rep_pen=1.1, temp=0.3, resp_length=128):
	prompt = TOPIC_PROMPT % topic.strip()

	input_ids = tokenizer(prompt, return_tensors='pt').input_ids

	gen_texts = []
	for _ in range(1):
		(gen_text, _, lps) = server.gen_with_logprobs(prompt, temp, rep_pen, min(2048, len(input_ids.squeeze())+resp_length))
		score = sum(lps)
		gen_texts.append((gen_text, score))

	gen_text = max(gen_texts, key=lambda x: x[1])[0]

	prompt_text = tokenizer.batch_decode(input_ids)[0]

	gen_text = gen_text[len(prompt_text):]

	new_stories = [story.strip() for story in gen_text.strip().split('\n\n')]

	return new_stories

def make_similar_story(story, rep_pen=1.1, temp=0.3, resp_length=128, retries=3, topic='', return_topic=False):
	prompt = PROMPT
	if len(topic.strip()) > 0:
		prompt = prompt + ' ' + topic.strip()
	prompt = prompt % story

	input_ids = tokenizer(prompt, return_tensors='pt').input_ids

	# gen_text = server.gen(prompt, temp, rep_pen, min(2048, len(input_ids.squeeze())+resp_length))
	gen_texts = []
	for _ in range(1):
		(gen_text, _, lps) = server.gen_with_logprobs(prompt, temp, rep_pen, min(2048, len(input_ids.squeeze())+resp_length))
		score = sum(lps)
		gen_texts.append((gen_text, score))

	gen_text = max(gen_texts, key=lambda x: x[1])[0]

	prompt_text = tokenizer.batch_decode(input_ids)[0]

	gen_text = gen_text[len(prompt_text):]

	input_topic = gen_text.strip().split('\n')[0].strip()

	new_story = gen_text.strip().split('\n\n')[2].strip()

	if retries > 0 and len(new_story.split('\n')) < 3:
		return make_similar_story(story, rep_pen=rep_pen, temp=temp, resp_length=resp_length, retries=retries-1, topic=topic, return_topic=return_topic)

	if return_topic:
		return (new_story, input_topic)
	else:
		return new_story

if __name__ == '__main__':
	parser = argparse.ArgumentParser(description='Complete text with GPT')

	parser.add_argument('--temp', type=float, default=0.35, help='Completion temperature')

	parser.add_argument('--rep_pen', type=float, default=1.1, help='Completion repetition penalty')

	parser.add_argument('--resp_length', type=int, default=128, help='Completion length, in tokens')

	parser.add_argument('--topic', type=str, default='', help='Pre-made topic (if any) for the new stories')

	parser.add_argument('--num_stories', type=int, default=1, help='Number of stories to generate')

	args = parser.parse_args()

	for i in range(args.num_stories):
		if i > 0:
			print('', flush=True)

		if args.topic == '':
			story = sys.stdin.read().strip().split('\n\n')[0]
			(new_story, topic) = make_similar_story(story, rep_pen=args.rep_pen, temp=args.temp, resp_length=args.resp_length, return_topic=True)
			print(new_story, flush=True)
		else:
			stories = make_topical_stories(args.topic, rep_pen=args.rep_pen, temp=args.temp, resp_length=args.resp_length)
			print(stories[0], flush=True)
			
