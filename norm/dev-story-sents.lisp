(load "schema-parser.lisp")

(defparameter *DEV-STORY-SENTS* '(("I can see a swan." "A swan can swim well." "She lays eggs in her nest."
  "She is a white swan.")
 ("The cocoanut tree is tall." "It is very pretty."
  "Many cocoanuts grow on the tree." "Simeon can climb the tree."
  "He gets the cocoanuts for his mother." "His mother likes cocoanuts."
  "She likes to play with Simeon.")
 ("The monkey has a cocoanut." "He likes the cocoanut." "He will eat it."
  "The monkey is brown." "It has a large tail." "His eyes are large.")
 ("The monkey can climb a tree." "He climbs the tree and gets a cocoanut."
  "He drops the cocoanut to the ground." "He comes down and eats it.")
 ("Boys like to catch fish." "It is a good sport."
  "A hook is on the end of the line." "It swims with its tail."
  "It can swim very fast.")
 ("This is a schoolhouse in America." "Last night they studied their lessons.")
 ("The old cat can catch a mouse." "She has a mouse in her mouth."
  "She will give it to her little kittens." "They will play with the mouse.")
 ("They brought them in large baskets on their heads."
  "They dip the clothes in the water." "Then they put soap on them."
  "They lay the clothes on a large stone and pound them with a stick."
  "Then they dip them in the water again.")
 ("One day Ned went out to walk." "He looked up and saw a green bird.")
 ("John has a new boat." "His father gave it to him."
  "He keeps the oars at the house." "His home is near the river.")
 ("The little boy has a red wagon." "I will take you with me to the fields.")
 ("Three birds are in the tree." "One is a pretty red bird."
  "You can not catch it." "It is high in the tree."
  "It can see the little girl with the red dress."
  "It can see the good baby and the pretty doll."
  "It can see the man in the field.")
 ("I have a pet hen." "She has a nest in a box." "Two eggs are in the nest.")
 ("One dog was black." "One dog was white." "The large dog was black."
  "The small one was white." "Nothe cats were on the steps."
  "The white cat was lying on the steps.")
 ("These are the little birds." "Their mouths are open." "They are hungry."
  "The mother bird will feed them." "She has a grasshopper in her mouth."
  "If they try to fly, they will fall.")
 ("The bird can fly." "She can not fly." "She may play with my doll.")
 ("This is Tom and May." "Tom and May can play ball."
  "Tom has a little bat and a little ball." "Tom has hit the ball."
  "O, yes, she will get the ball." "Run, May, run, and get the ball!")
 ("Her bird is in a cage." "She is looking at her bird."
  "Two birds are on a bench." "The bench is near the tree."
  "NoMay's bird is in a cage." "These are my little birds."
  "The little birds are in a tree." "They are singing in the tree.")
 ("The boy can play ball." "The man may see the boy play."
  "The boy may take the ball." "The baby has a big doll."
  "The little girl has a ball." "I can see the baby.")
 ("John, Ned, Ben, Tom, and Nell stand on the bank, and look at the duck."
  "The dog with a black spot on his back, is with Tom."
  "Tom has his hat in his hand." "He has left his big top on the box.")
 ("The boy in the red wagon is Frank." "He will give them a ride."
  "They like to go with him to the fields and the woods." "Yes, girls, get in!"
  "And you, too, boys!" "She has a pretty home high in the tree.")
 ("Three birds are in the tree." "One is a pretty red bird."
  "You can not catch it." "It is high in the tree."
  "It can see the little girl with the red dress."
  "It can see the good baby and the pretty doll."
  "It can see the man in the field.")
 ("He holds the horse's foot." "The shoes are made of iron."
  "It does not hurt the horse." "His hoofs are hard.")
 ("They have come to find flowers.")
 ("A top spins." "The tops spin." "Tom spins the tops."
  "He spins the tops on a box." "Tom spins my large top."
  "He spins my small top." "Spin, tops, spin.")
 ("I have a doll." "I can see my doll." "My doll has a hat."
  "The girl has a doll and a hat.")
 ("The girl is good to the little baby." "She can not catch the bird.")
 ("A big apple is on the green grass.")
 ("The mother bird sits on the nest." "You cannot see the eggs."
  "The bird is sitting on them." "It is made of grass and sticks."
  "It is a good home for them.")
 ("I see a girl." "I see a boy." "I see a boy and a girl."
  "The boy can see the girl." "I can see the girl and the boy."
  "I can see the girl.")
 ("Mother gave them to me." "She gave them to me this morning."
  "I will keep the red flower." "I will give all my yellow flowers to Lucy."
  "She will like them." "She will take them home with her.")
 ("Now the ball is lost." "Ponto has found it." "Here he comes with it.")
 ("This is red clover." "The bees like it."
  "They find sweet nectar in the clover flowers." "It is sweet."
  "It grows in the fields with red clover and yellow buttercups."
  "Horses and cows eat clover.")
 ("See, Rosy, here is an apple tree." "It stands on a big hill."
  "Yes, Frank, it is sweet.")
 ("John is rolling the ball to Tyke.")
 ("The man holds the sail."
  "The wind blows on the sail, and the boat moves fast." "I like a row-boat.")
 ("I see a nest." "The little birds can not fly."
  "The big bird is not here now." "She is high in the apple tree.")
 ("We are going to the woods." "Father and Mother are going with us."
  "The nuts are ripe in the woods." "John likes to hold the horse.")
 ("I see May and her dolls." "She has a doll in her lap."
  "One doll is sitting on a bed." "The doll on the bed is wax."
  "May's dolls have blue eyes.")
 ("With a sharp cry, it answered the voice outside."
  "All at once, a large tigress bounded into the middle of the tent.")
 ("The man has a little dog." "The boy has a big dog." "He has my ball."
  "She can not take it.")
 ("They have come to find flowers." "She will take them to the wagon.")
 ("Her home is far away." "She has come to see  Frank and May."
  "All the little girls love Lucy."
  "He will give her the whip, and the horse will go fast.")
 ("They hear their sweet songs.")
 ("We have bees in our garden." "They live in a little house."
  "Honey is very sweet." "Some bees live in trees." "They are wild bees.")
 ("He took Pinky with him." "Pinky was his pet dove."
  "Tom's letter to his papa was a very little one."
  "In the morning he tied it to Pinky's neck." "Pinky did not get lost."
  "He flew back to his own little house in the backyard."
  "Papa took off the letter.")
 ("Dash is with them." "He will take her to the other side."
  "She will not wet her feet." "He holds her on her." "She will not fall off.")
 ("We have made it for the top of your tent.")
 ("The little bird flew out." "It flew into a tree in the yard."
  "The bird did not like to live in the cage.")
 ("The boys like to go to the woods." "Here they are now."
  "They like to play in the woods." "They like to find pretty flowers."
  "If they find little birds in a nest, they will not take them."
  "They will ride home in the wagon.")
 ("One dog is black." "One dog is white." "A dog runs." "The dogs run."
  "Run, dogs, run.")
 ("Will Jones lived on a farm." "Will took him over to the farm."
  "They saw the horses, and the cows."
  "They hunted for hens' nests in the hay."
  "The big fat pigs in the pen looked up.")
 ("Then they are thrown into the water, one at a time.")
 ("One day he drew them on his slate."
  "They are white rabbits, and they have pink eyes.")
 ("We did not see her there.") ("The boy and the dog run.")
 ("We live on the round earth." "Men can sail it over the wide, wide sea.")
 ("I am going to the field with papa." "They can run fast."
  "I like to ride in the wagon with my papa." "I like the horses."
  "We plant wheat and corn." "In the spring we plant the grain.")
 ("I have a large mango." "That is the largest mango in the basket."
  "This tree is tall." "The cocoanut tree is the tallest tree in the yard.")
 ("I can get into bed, and then you can not get me." "This is my red dress."
  "I am Nell." "I can not get you." "You can get into bed."
  "Nell, you have a pretty dress." "I have a black dress.")
 ("John likes to play ball with Tyke." "John can catch the ball."
  "John rolls the ball to Tyke." "Tyke takes the ball to John.")
 ("This man is John's father." "The horse is Billy."
  "Billy is a good old horse." "He is a fine black horse."
  "John likes to ride on Billy." "Billy will not go too fast with John."
  "John will not fall off.")
 ("The cat is on the box." "She saw a big rat and ran to catch it.")
 ("Nothis is Ada." "Ada is sitting in May's chair.")
 ("They are in the basket by his side."
  "He holds the lines in one hand, and his whip in the other.")
 ("A parrot can talk.")
 ("Manuela and Carmen live near the sea." "Yesterday they found these shells."
  "A shell is the house of an animal.")
 ("You can see them at their places in the school room."
  "The teacher has been showing the children some pictures in her new book."
  "The children look and listen.")
 ("Ned has a gun." "Max has a big flag." "All three boys have caps.")
 ("This is my pet hen." "She left her nest, and now a rat is in it."
  "The boy has a pet." "Dash is his pet." "The black hen is my pet."
  "My pet hen has a nest." "The black hen left her nest."
  "A rat ran to the nest." "My pet hen ran." "Dash ran and the rat ran."
  "The rat is not in the nest now." "The black hen is in the nest.")
 ("The day will soon be gone."
  "Some of the clouds are red, and some are as yellow as gold.")
 ("Lucy and her mother are in the woods."
  "They have found a good place under a green tree."
  "Robin Redbreast is in the tree." "By and by he will fly away to his nest.")
 ("Frank has a pretty boat." "It is white, with a black line near the water."
  "He always takes good care of it."
  "Frank has been at work in the garden, and will now row a while.")
 ("Jean can roll the hoop very fast." "The hoop has bells on it.")
 ("This boy has a hat." "His hat is black." "The bat is in his hand."
  "He has his bat." "This is a black hat." "The boy had a black hat."
  "This black hat is his." "I had a black bat." "The black bat is my bat."
  "The boy has his bat in his hand.")
 ("The cats are on the steps." "One cat is sitting on the steps."
  "One cat is lying on the steps." "Noit is the white one."
  "The black one is sitting near the white one.")
 ("Grace is running after the butterfly." "I think not.")
 ("They lay nice white eggs." "You can find them in the hay.")
 ("These men fish in the sea." "They have a large net."
  "They carry the net in a boat and drip it into the water."
  "Soon they pull it to the shore.")
 ("One day Ann and Frank went to the lake with Rover."
  "Pretty soon he came out with the stick in his mouth.")))


(if nil (block ifnil
(setf i 0)
(loop for story in *DEV-STORY-SENTS*
	do (block compare
		(format t "STORY ~s:~%~%" i)
		(format t "~s~%~%" story)
		(format t "Raw EL parse:~%~%")
		(setf *ADD-TOK-NUMBERS* nil)
		(format t "~s~%" (reduce #'append (mapcar #'interpret story)))
		(format t "~%~%")
		(format t "Postprocessed & coref-resolved:~%~%")
		(setf *ADD-TOK-NUMBERS* t)
		(format t "~s~%" (parse-story story))
		(format t "~%~%~%")
		(setf i (+ i 1))
	)
)
))
