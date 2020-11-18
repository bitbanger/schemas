(load "ll-load.lisp")

(ll-load "dev-story-sents.lisp")

(defparameter *OTHER-SENTS* '(
("Tom used to have his own boat."
"He had to sell it."
"Now he just comes out on my boat."
"We have such a great time together."
"Now I have someone to help me clean my boat.")

("Today we were playing outside."
"We saw a lot of dark clouds in the sky."
"It looked like a storm was coming."
"We had to go inside to be safe."
"It didn't rain after all, so we went back outside!")

("Today I saw a baby bird."
"The bird was in a tree."
"The mother bird was teaching the baby bird."
"She dropped the bird out of the nest."
"The baby bird flew away.")

("The orange fell from the tree."
"It hit a girl on the head."
"The girl looked up at the tree."
"Another orange fell from the tree."
"That orange broke her nose.")

("Sam's dog ran away."
"He was old and going blind."
"Sam had him for a long time."
"He looked for him for years."
"It took Sam much longer to get over it.")

("My son is a little child."
"He ran outside to play."
"His friend was out there with him."
"They played together with sticks."
"My son came in from outside.")

("John was at work."
"Suddenly it got dark outside."
"He looked out the window."
"There was some very dark rain clouds."
"It started to rain very hard.")

("I took it the harness off the cat."
"The cat did not want to go back inside."
"I took the cat outside."
"We bought the cat a harness."
"The cat always liked to go outside.")

("Tom wanted an apple from his apple tree."
"There was a beautiful one right at the top of the tree."
"He tried to climb the tree but couldn't reach the apple."
"He found a long stick that he used to knock it down."
"The apple fell and hit him on the head.")

("Sam was getting a new baby brother."
"At first he was shy and scared of the baby."
"Sam didn't like the baby because he would cry all day long."
"But the baby began to grow and play."
"In time Sam grew to love his brother and they became best friends.")

("Joe was bit by a cat when he was very young."
"Since then, he has always been scared of cats."
"One day at school, a cat came up to him and played with him."
"Joe had a lot of fun with the cat."
"Now, Joe is not scared of cats.")

("I heard a knock on the door a little while ago."
"I looked out the window and saw an old friend."
"He was always trouble and not fun to be around."
"I did not want to talk to him."
"I was really quiet and pretended not to be home so he left.")

("Grace loved purple flowers."
"She found some beautiful violets to plant in her yard."
"She liked to look at them each morning."
"One day, she clipped a flower and put it in her hair."
"She liked to carry the pretty plant with her as she walked.")

("One day John and his dog went to the beach."
"While on the beach they walked down the sea shore."
"After a little while John threw a stick for his dog."
"His dog jumped up and caught the stick in mid-air!"
"After that they walked back along the shore to go home.")

("My mother had bought me a pair of new shoes."
"As I put them on my feet, my dog came over to lick them."
"I thought that my dog's feet might be cold."
"I took my shoes off and put them on my dog."
"Now I need another pair of new shoes.")

("There was a little lonely boy."
"He didn't have much to play with."
"He found an old ball in the back of the woods."
"He cherished this ball like a friend."
"It was all the boy had just the boy and his ball.")

("Jill walked home from work alone one night."
"It was dark and she was scared."
"She heard a noise in the bushes."
"Jill began walking faster to her house."
"Jill laughed when a dog jumped out of the bush.")

("Tom was at the lake with friends."
"They all wanted to go swimming."
"The water was really cold."
"Tom didn't want to get in."
"It took him a long time to build up the courage to do so.")

("Woods always loved pets cats."
"He had always wanted one but his mom said no."
"One day, he found a cat on the street."
"The cat was very hungry and small."
"Woods fed it and he felt very happy.")

("It was very hot today."
"I decided to go for a long walk."
"I walked for two miles away from home."
"The sky went dark and it started to rain very hard."
"I had to run all the way home!")

("I love to read."
"I read before I go to bed every night."
"I read so much I have read all the good books in our house!"
"My Mom gave me a new book this morning."
"I am off to read it!")

("I left my dog alone last night."
"I was called into work."
"He is not used to being alone for so long."
"When I came home my house was trashed."
"That's the last time I leave him alone for so long.")

("Rose was a new mother."
"Her baby girl wouldn't stop crying."
"The child's father had left for work before she got up."
"Rose showed the baby a picture of her father."
"The baby stopped crying and smiled.")

("Jane had never been in love before."
"She got her first boyfriend."
"It was in high school."
"She thought she loved him but they broke up."
"It took her a long time to get over it.")

("I am so tired today."
"The baby woke up a few times last night."
"I had a lot of trouble getting him back to sleep."
"I was up a lot of the night with him."
"I hope he sleeps better tonight.")

("Julius took his first steps yesterday."
"He was walking along the table all morning."
"He just let go and started walking."
"At first I did not even notice."
"He was so proud of himself.")

("Jane's cat ran out the door one day."
"She went out looking for him."
"After an hour she went back home."
"Her cat was waiting by the door for her."
"Jane laughed a bit and let him in.")

("I sat down to do some work."
"I looked up and saw a spider in the window."
"I got anxious and watched the spider."
"I was afraid that the spider would escape."
"I didn't get any work done.")

("Harry is a baby."
"He doesn't know how to be gentle when he pets a dog."
"Harry's mother tried to teach him how to be gentle."
"Harry pulled the dog's ears."
"His mother decided he is still too young to be near the dog.")

("Tom had a cat."
"He decided to get another one."
"The two cats didn't get along."
"Tom tried his best to get them to live together."
"It never worked and he had to get rid of one.")

("Nancy loved the swings."
"Since she was a child she was always on them."
"Nancy rode the swings next to her friends as well."
"One day, Nancy fell off the swings."
"She was hurt and never rode the swings again.")

("Michael was very shy."
"He would only play by himself."
"One day I asked him to play with me."
"We have been friends ever since."
"Michael is my best friend.")

("Magee was only good at running."
"He loved to run all the time."
"One day he ran far away from home."
"Magee was never seen again."
"Some say Magee is still running today.")

("Joe's dog was very dirty from playing outside."
"So Joe took his do to the tub."
"He began to wash his dog."
"After washing his do he dried the dog."
"Joe's dog was no longer dirty and played inside the house.")

("We went in a hike in the woods by my house."
"The trees were very high."
"My brother climbed one of the trees."
"We told him to get down."
"He fell from the tree.")

("Tom never liked taking pictures."
"He always thought he looked bad in them."
"One day a friend convinced him to take some."
"Tom liked the way he looked in them."
"He started taking more and better pictures.")

("Susie say a girl was playing ball."
"She wanted to play with her too."
"So she went ahead and asked for permission."
"The girl said no."
"Susie then started to cry.")

("Sam's cat ran away one day."
"Sam never got along with it."
"He tried to look for a day or two."
"Sam quickly gave up the search."
"He got a new cat instead.")

("My son was outside playing."
"His best friend came by the house."
"They went off on an adventure."
"They were gone for quite some time."
"They came home before dark.")

("My friend came to visit."
"She wanted to go out."
"I asked if she wanted to meet my brothers."
"I was in trouble that night."
"I didn't find out why until the next day.")

("Helen bought a nice plant in the store."
"She put it into the window at home."
"Next morning she wanted to water it."
"She found it broken on the floor."
"It was her cat.")

("Tom went out for a walk."
"A baby bear walked in front of him."
"He anxiously looked around for the mother bear."
"He did not see the mother bear."
"He quickly turned around and walked home.")

("The girls went to the pond."
"They caught a giant frog."
"They took it home and put it in a bucket."
"They showed it to all their friends."
"The frog lived with them for a month.")

("My friend came to visit me."
"She brought her young son with her."
"He was a cute little boy."
"We gave him some toys to play with."
"We had a great visit.")

("I went to visit a farm on Friday."
"It was a long drive to get there."
"They had a lot of animals."
"I got to pet the cow."
"It was a very fun day.")

("Holly had just started school."
"Her mother dropped her off at school."
"Holly began to cry when her mother left."
"Her mother returned in the afternoon."
"Holly said she didn't want to go back.")

("Fred always wanted to know how he would look like in a cap."
"He decides to buy one."
"Fred loves how he looks in a cap."
"His friends love it too."
"He is glad he bought a cap.")

("Emmy lived on a farm."
"She stayed in a pen with her brother."
"One day a man came and saw Emmy."
"He took her home."
"They are very happy together.")

("The man planted a tree."
"The tree grew to be very tall."
"One day their was a big storm."
"A branch fell from the tree."
"It broke a window of the man's house.")

("Rose was at the jewelry store."
"She wanted to buy a new watch."
"She tried on each one."
"She liked the rose gold watch the most."
"She bought it and wore it home.")

("Jill bought a new dress."
"She tried it on when she got home."
"The dress didn't fit."
"Jill couldn't find the receipt."
"Jill gave the dress to one of her friends.")

("There was a penny on the ground."
"My son went to pick it up."
"I told him not to get it."
"The penny was lying tails up."
"We left the penny right there.")

("Rene loved the swings."
"She didn't think she was too old to use them."
"Rene went very high."
"At the end she jumped off."
"She had much fun.")

("Mary had an apple tree in her garden."
"The tree was full of apples."
"Mary climbed up the tree to pick the apples."
"She fell down from the tree."
"Mary broke her leg when she fell.")

("Kate felt something run across her foot."
"It was a giant spider!"
"She swatted it away."
"It ran under her bed."
"She could not sleep that night.")

("John asked Tom to be his best man."
"They met in grade school."
"They spent the rest of their school years together."
"They were always together."
"They are best friends.")

("Jane and John walked up a hill."
"They wanted to see the view."
"John fell down."
"He hit his head really hard."
"Jane carried him back down.")

("I went to my door yesterday."
"I saw there was a new book."
"It came right to me."
"I was pretty happy about that."
"I couldn't wait to read it.")

("Frank was walking to work one day."
"It began to rain."
"Frank hadn't brought his umbrella with him."
"Frank got to work soaking wet."
"Frank started to always bring an umbrella to work.")

("Tom had a girlfriend he loved very much."
"He cut her with his nails one day."
"She asked him to cut them."
"He cut his nails."
"His girlfriend was happy that he cut his nails.")

("The girl made a dress."
"The dress was pretty."
"All her friends wanted one."
"She made each friend a dress of their own."
"He friends each wore the dress at the girl's wedding.")

("Reese wanted to be more active."
"He mostly sat around the house."
"He wanted to be more fit."
"He started playing one hour outside a day."
"He is much more fit now.")

("Lynn gets a new dog."
"She loves her dog."
"She is out one evening walking him."
"Her dog runs off away from her."
"She cannot catch him and he runs away.")

("I went to the store yesterday."
"I tried some things on."
"I liked them but they were too expensive."
"I couldn't buy them."
"So I put them back.")

("Carlton liked to play with all children."
"One child was sick however."
"His mother told him not to play with him."
"And so Carlton listened."
"So he did not get sick.")

("Barry lost his dog."
"He felt a hole in his heart."
"He went to the pet store."
"The dog he found was great."
"They are best friends now.")

("A new teacher had a bad class."
"The children threw paper."
"The paper hit the teacher."
"She turned back at the class."
"She told them to shut up and sit down.")

("I was walking home from work when I saw a little girl playing."
"An older child came up to her and took her doll."
"She tried to get it back, but he laughed and threw it into the road."
"She didn't see the car coming, and ran after her toy."
"I caught her just in time.")

("We went to the town today."
"It was too hot,"
"It felt like a sauna."
"I couldn't stand it."
"I had to sit down.")

("Tom moved to a new city."
"He couldn't find a church he liked."
"He tried going to a black church."
"Tom had a lot of fun there."
"He returned often.")

("The man put on his jacket."
"He soon became too hot."
"He took his jacket off."
"He became cold again."
"He put on a coat that was not as warm.")

("Susie tried on the dress."
"She found it very uncomfortable."
"She wasn't sure she wanted to even wear it."
"Susie put it away."
"She never wore it again.")

("Mary wanted to paint something for her cousin."
"She got some more paint from the store."
"She started to paint a picture."
"Mary gave her cousin her painting."
"Her cousin loved it.")

("It was very hot outside."
"So we wanted to go where it was cool."
"We walked into the building."
"But then we walked out."
"The building was far too cold.")

("A girl went to play with her friends."
"She went across the street."
"The parents went over to get her."
"She was lost."
"They found her in their home.")

("Today I went swimming."
"I love to swim."
"The water was very cold."
"The water made my teeth chatter."
"The water was so cold, I had to get out.")

("Susie got a new hair oil."
"She thought it was great."
"When she tried it, it worked good,"
"Susie wanted to buy more."
"She loved it.")

("Julia loved flowers."
"She thought they were so pretty."
"One day she was walking."
"She saw a field of flowers."
"She had fun playing the flowers.")

("It was very hot outside."
"So Tina went to the beach."
"She thought it would be good."
"But then it was not."
"It was too hard.")

("It turned out to be a fox."
"I got closer."
"It made a funny sound."
"I heard an animal."
"I was walking through the woods.")

("I needed a to write a song."
"I had nothing to write with."
"I looked in my desk for a pen."
"I only saw a pen cap."
"I threw the pen cap away.")

("Fred liked Susie."
"He really wanted to ask her to the ball."
"But he was nervous."
"She said yes however."
"So fred was very happy.")

("Billy went to work."
"He came home late at night."
"Billy was very tired."
"He laid down in his bed."
"He fell asleep quickly.")

("Billy liked this girl."
"The girl sat in front of him."
"He played with her hair."
"She told him to stop."
"He stopped it.")

("My friend, Mary, loved the rain."
"She would sing songs and write stories about it."
"I asked her why she loved the rain oh so much."
"She looked at me and smiled, as though she were looking inside of me."
"She told me that she loved it so much because we met on a rainy day.")

("The man filled his cup with nuts."
"He sprinkled the nuts around a tree."
"Squirrels came and gathered the nuts."
"The man watched the squirrels."
"The man felt happy feeding the squirrels.")

("The cat strolled through the house."
"It found something funny."
"There was a pink ball on the floor."
"The cat swatted the ball."
"The cat liked playing with the ball.")

("The boy cried."
"A woman saw the boy crying."
"She wanted to help."
"The boy did not want her help."
"The boy's mother came running over.")

("Sam wanted a new tv."
"So he went to the best buy and looked at a tv."
"Found a good tv."
"Bought the tv."
"Sam loved his new tv.")

("We were worried my cat would not get along with our new kitten."
"My cat would hide all day long since the kitten showed up."
"We heard a racket in the middle of the night."
"The cats were playing with each other."
"They are now best friends and play together all the time.")

("I walked through the forest at midnight last night."
"While on my walk, I came across a little fox."
"He was small, but I was still frightened."
"Being more afraid of me, the fox ran away."
"I quickly walked home, determined to take a friend with me next time.")

("The tree lost its leaves."
"That winter it became very cold."
"The branches froze."
"The tree lost its branches."
"The next spring the leaves could not grow back.")

("The man went to a park."
"He saw a woman there."
"The woman was beautiful."
"He took a picture of her."
"The woman saw him do it.")

("The man found the answer."
"He told everyone he could."
"People did not like the answer."
"They got angry at the man."
"They hung the man in the street.")

("The man caught a fish."
"The fish looked sad to him."
"The man felt bad."
"He let the fish go."
"The fish went belly up in the water.")

("The cow left the barn."
"It went out to the field."
"The other cows were out in the field."
"The cow found a spot of grass."
"The cow ate the grass.")

("Shelley wanted a new cat."
"She went to the pet store."
"She found a nice cat."
"Shelley bought the cat and things for the cat."
"She loved her cat.")

("I went to buy some almonds yesterday."
"I bought a large box."
"I tried some."
"They were so good."
"I wanted to have some more.")

("He told himself to go up to her and go for it."
"He went over and made some small talk first."
"Then he asked if she wanted to go out the next weekend."
"She told him she would but she was already seeing someone."
"He told her that did him no good and they both laughed.")

("A new teacher started the day."
"She asked them to sit."
"They didn't sit."
"She didn't know what to do."
"She asked the principal to help.")

))

(defparameter *ALL-STORY-SENTS* (append *OTHER-SENTS* *DEV-STORY-SENTS*))
