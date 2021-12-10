(defparameter *NESL-COMPOS* '(


; "Mary is sitting under an oak tree."
; "She sees a butterfly flutter past."
; "She watches as it lands on a flower."
; "She wonders what kind of flower it might be."
(EPI-SCHEMA ((?X_J (WATCH.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_D (AS.P (KE (AND (?X_I (PLUR LAND.N)) (?X_I (ON.P ?X_E)))))))
		(!R2 (?X_F OAK.N))
		(!R3 (?X_F TREE.N))
		(!R4 (?X_I BUTTERFLY.N))
		(!R5 (?X_I FLUTTER.N))
		(!R6 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_A (?X_J ((ADV-A (UNDER.P ?X_F)) SIT.V)))
		(?X_H (?X_J SEE.1.V ?X_I))
		(?X_C (?X_J (WATCH.V ?X_D)))
	)
)

; "Peter saw a beautiful garden."
; "He walked through the garden."
; "He smelled the flowers."
; "He liked the smell."
(EPI-SCHEMA ((?X_J ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_B BEAUTIFUL.A))
		(!R2 (?X_B GARDEN.N))
		(!R3 (?X_G (PLUR FLOWER.N)))
		(!R4 (?X_K SMELL.N))
		(!R5 (?L2 DESTINATION.N))
		(!R6 (?X_K OBJECT.N))
		(!R7 (?X_J AGENT.N))
		(!R8 (NOT (?X_K ACTION.N)))
		(!R9 (NOT (?X_K AGENT.N)))
	)
	(:STEPS
		(?X_A (?X_J SEE.2.V ?X_B))
		(?X_D (?X_J ((ADV-A (FROM.P ?L1)) WALK.3.V) ?L2))
		(?X_F (?X_J SMELL.4.V ?X_G))
		(?X_I (?X_J LIKE.5.V ?X_K))
	)
)

; "Tom saw some beautiful flowers."
; "He picked one for Mary."
; "He gave it to her."
; "Mary put it in her pocket."
(EPI-SCHEMA ((?X_D (GIVE.V ?X_G ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_D AGENT.N))
		(!R2 (?X_G BEAUTIFUL.A))
		(!R3 (?X_G (PLUR FLOWER.N)))
		(!R4 (?X_L POCKET.N))
		(!R5 (?X_L (PERTAIN-TO ?X_M)))
		(!R6 (?X_J AGENT.N))
		(!R7 (NOT (?X_K AGENT.N)))
		(!R8 (?X_L LOCATION.N))
		(!R9 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_F (?X_J (SEE.V ?X_G)))
		(?X_C (?X_J (((ADV-A (FOR.P ?X_M)) PICK.V) ?X_D)))
		(?X_I (?X_J (GIVE.6.V ?X_J ?X_K)))
		(?X_A (?X_M PUT.7.V ?X_K ?X_L))
	)
)

; "Alice walked through the park."
; "She saw a butterfly flying by."
; "She watched as it landed on a flower."
; "Alice wondered if she could catch it."
(EPI-SCHEMA ((?X_N
              (COMPOSITE-SCHEMA.PR ?X_F
               (K (IF.P (?X_N (CAN.MD (CATCH.V ?X_G))))) ?L2 ?X_M ?X_G))
             ** ?E)
	(:ROLES
		(!R1 (?X_G BUTTERFLY.N))
		(!R2 (?X_F (AS.P (KE (?X_G ((ADV-A (ON.P ?X_H)) LAND.V))))))
		(!R3 (?X_M BY.P))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_M DESTINATION.N))
		(!R6 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_J (?X_N ((ADV-A (FROM.P ?L1)) WALK.3.V) ?L2))
		(?X_A (?X_G ((ADV-A (FROM.P ?L1)) FLY.8.V) ?X_M))
		(?X_L (?X_N SEE.9.V ?X_G))
		(?X_E (?X_N (WATCH.V ?X_F)))
		(?X_C (?X_N (WONDER.V (K (IF.P (?X_N (CAN.MD (CATCH.V ?X_G))))))))
	)
)

; "Joe likes roses."
; "His favorite rose is red."
; "Roses have thorns."
; "Joe doesn't mind them."
(EPI-SCHEMA ((?X_I ((ADV-A (ABOUT.P ?X_L)) THINK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_L (PLUR THORN.N)))
		(!R2 (?X_C RED.A))
		(!R3 (?X_C (PERTAIN-TO ?X_I)))
		(!R4 (?X_D FAVORITE.A))
		(!R5 (?X_C ?X_D ROSE.N))
		(!R6 (?X_J (PLUR ROSE.N)))
		(!R7 (?X_K (PLUR ROSE.N)))
		(!R8 (?X_I AGENT.N))
		(!R9 (NOT (?X_J ACTION.N)))
		(!R10 (NOT (?X_J AGENT.N)))
		(!R11 (?X_K AGENT.N))
		(!R12 (?X_L OBJECT.N))
	)
	(:STEPS
		(?X_F (?X_I LIKE.11.V ?X_J))
		(?X_H (?X_K HAVE.12.V ?X_L))
		(?X_B (NOT (?X_I (MIND.V ?X_L))))
	)
)

; "A bee landed on a flower."
; "It stung Mary's finger."
; "Mary screamed."
(EPI-SCHEMA ((?X_F (STING.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_I FINGER.N))
		(!R2 (?X_E FLOWER.N))
		(!R3 (?X_F BEE.N))
		(!R4 (?X_I (PERTAIN-TO ?X_J)))
		(!R5 (?X_J AGENT.N))
		(!R6 (?N NOISE.N))
	)
	(:STEPS
		(?X_D (?X_F ((ADV-A (ON.P ?X_E)) LAND.V)))
		(?X_B (?X_F (STUNG.V ?X_I)))
		(?X_H (?X_J SCREAM.13.V ?N))
	)
)

; "Alice saw some beautiful flowers growing near the road."
; "She stopped to look at them."
; "She picked one for herself."
; "She put it in her pocket."
(EPI-SCHEMA ((?X_E (PICK_UP.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E AGENT.N))
		(!R2 (?X_H ROAD.N))
		(!R3 (?X_K BEAUTIFUL.A))
		(!R4 (?X_L ?X_K (PLUR FLOWER.N)))
		(!R5 (?X_M POCKET.N))
		(!R6 (?X_M (PERTAIN-TO ?X_N)))
		(!R7 (?X_L ENTITY.N))
		(!R8 (?X_M LOCATION.N))
		(!R9 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_A (?X_L ((ADV-A (NEAR.P ?X_H)) GROW.V)))
		(?X_J (?X_N SEE.14.V ?X_L))
		(?X_G (?X_N ((ADV-A (FOR.P (KA ((ADV-A (AT.P ?X_H)) LOOK.V)))) STOP.V)))
		(?X_D (?X_N (((ADV-A (FOR.P ?X_N)) PICK.V) ?X_E)))
		(?X_B (?X_N PUT.15.V ?X_E ?X_M))
	)
)

; "Sarah saw a butterfly."
; "It flew around."
; "It landed on some flowers."
(EPI-SCHEMA ((?X_I ((ADV-A (TO.P ?L2)) FLY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR FLOWER.N)))
		(!R2 (?X_D BUTTERFLY.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_I SEE.16.V ?X_D))
		(?X_H (?X_D ((ADV-A (FROM.P ?L1)) FLY.17.V) ?L2))
		(?X_B (?X_D ((ADV-A (ON.P ?X_C)) LAND.V)))
	)
)

; "Tom loves flowers."
; "He has many kinds of flowers in his yard."
; "His garden is beautiful."
; "Tom wants to grow more flowers."
(EPI-SCHEMA ((?X_L (WANT.V (KA (GROW.V ?X_C)))) ** ?E)
	(:ROLES
		(!R1 (?X_C MORE.A))
		(!R2 (?X_C (PLUR FLOWER.N)))
		(!R3 (?X_K (PLUR FLOWER.N)))
		(!R4 (?X_I (PLUR FLOWER.N)))
		(!R5 (?X_J MANY.A))
		(!R6 (?X_F GARDEN.N))
		(!R7 (?X_F BEAUTIFUL.A))
		(!R8 (?X_F (PERTAIN-TO ?X_L)))
		(!R9 (?X_M (OF.P ?X_I)))
		(!R10 (?X_M ?X_J (PLUR KIND.N)))
		(!R11 (NOT (?X_K ACTION.N)))
		(!R12 (NOT (?X_K AGENT.N)))
		(!R13 (?X_L AGENT.N))
		(!R14 (?X_M OBJECT.N))
	)
	(:STEPS
		(?X_E (?X_L LOVE.18.V ?X_K))
		(?X_H (?X_L HAVE.19.V ?X_M))
		(?X_B (?X_L (WANT.V (KA (GROW.V ?X_C)))))
	)
)

; "Jane saw a butterfly."
; "A butterfly flew by."
; "A butterfly landed on a flower."
; "A butterfly can fly."
(EPI-SCHEMA ((?X_M ((ADV-A (TO.P ?L2)) FLY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C FLOWER.N))
		(!R2 (?X_D BUTTERFLY.N))
		(!R3 (?X_G BUTTERFLY.N))
		(!R4 (?X_J BUTTERFLY.N))
		(!R5 (?X_M AGENT.N))
		(!R6 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_M SEE.20.V ?X_G))
		(?X_I (?X_D ((ADV-A (FROM.P ?L1)) FLY.17.V) ?L2))
		(?X_B (?X_D ((ADV-A (ON.P ?X_C)) LAND.V)))
		(?X_L (?X_J ((ADV-A (FROM.P ?L1)) FLY.17.V) ?L2))
	)
)

; "A boy named John was walking through the park."
; "He met the girl named Mary."
; "They talked for awhile."
; "Then they kissed each other."
(EPI-SCHEMA ((?X_C ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_F GIRL.N))
		(!R3 (?X_F ((PASV NAME.V) ?X_G)))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_H BOY.N))
		(!R6 (?X_H ((PASV NAME.V) ?X_I)))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_K (?X_H ((ADV-A (FROM.P ?L1)) WALK.3.V) ?L2))
		(?X_E (?X_I (MEET.V ?X_F)))
		(?X_B (?X_C ((THEN.ADV KISS.V) (EACH.D OTHER.A))))
	)
)

; "Mary liked to kiss boys."
; "She kissed John."
; "John liked to be kissed by girls."
; "He kissed Mary."
(EPI-SCHEMA ((?X_F (LIKE.V (KA (KISS.V ?X_M)))) ** ?E)
	(:ROLES
		(!R1 (?X_F AGENT.N))
		(!R2 (?X_M (PLUR BOY.N)))
		(!R3 (?X_K (PLUR GIRL.N)))
		(!R4 (?X_L AGENT.N))
		(!R5 ((KA (KISS.V ?X_M)) ACTION.N))
	)
	(:STEPS
		(?X_H (?X_L LIKE.21.V (KA (KISS.V ?X_M))))
		(?X_E (?X_L (KISS.V ?X_F)))
		(?X_J (?X_F LIKE.22.V (KA (L X (AND (X (PASV KISS.V)) (X (BY.P ?X_K)))))))
		(?X_C (?X_F (KISS.V ?X_L)))
	)
)

; "John walked into the park."
; "Mary was there."
; "They talked for awhile."
; "They kissed each other."
; "They held hands."
(EPI-SCHEMA ((?X_F ((ADV-A (THROUGH.P ?X_M)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR HAND.N)))
		(!R2 (?X_F AGENT.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_M PARK.N))
		(!R5 (?X_L AGENT.N))
		(!R6 (?X_M DESTINATION.N))
	)
	(:STEPS
		(?X_K (?X_L ((ADV-A (FROM.P ?L1)) WALK.23.V) ?X_M))
		(?X_H (?X_I (THERE.ADV BE.V)))
		(?X_E (?X_F (KISS.V (EACH.D OTHER.A))))
		(?X_B (?X_F (HOLD.V ?X_C)))
	)
)

; "John walked through the park."
; "He saw a girl named Mary."
; "Mary looked pretty."
; "John thought she was cute."
; "He asked if they could talk."
(EPI-SCHEMA ((?X_C (THINK.V (THAT (?X_C CUTE.A)))) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_M AGENT.N))
		(!R3 (?X_L GIRL.N))
		(!R4 (?X_L ((PASV NAME.V) ?X_M)))
		(!R5 (?L2 DESTINATION.N))
		(!R6 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_I (?X_N ((ADV-A (FROM.P ?L1)) WALK.3.V) ?L2))
		(?X_K (?X_N SEE.24.V ?X_L))
		(?X_G (?X_M (PRETTY.ADV LOOK.V)))
		(?X_E (?X_N (THINK.V (THT (?X_M CUTE.A)))))
		(?X_B (?X_N (ASK.V (K (IF.P (?X_C (CAN.MD TALK.V)))))))
	)
)

; "Mary was kissing John."
; "John liked it."
; "He kissed her back."
(EPI-SCHEMA ((?X_G (KISS.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_D MALE.A))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_J AGENT.N))
		(!R5 (?X_K OBJECT.N))
		(!R6 (NOT (?X_K ACTION.N)))
		(!R7 (NOT (?X_K AGENT.N)))
	)
	(:STEPS
		(?X_F (?X_G (KISS.V ?X_J)))
		(?X_I (?X_J LIKE.25.V ?X_K))
		(?X_C (?X_D ((BACK.ADV KISS.V) ?X_A)))
	)
)

; "Mary was talking on the phone."
; "John walked by."
; "He saw Mary."
; "He waved at her."
; "Mary waved back."
(EPI-SCHEMA ((?X_H ((ADV-A (ON.P ?X_G)) TALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G PHONE.N))
		(!R2 (?X_H AGENT.N))
		(!R3 (?L2 DESTINATION.N))
		(!R4 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_F (?X_H ((ADV-A (ON.P ?X_G)) TALK.V)))
		(?X_J (?X_M ((ADV-A (FROM.P ?L1)) WALK_BY.26.V) ?L2))
		(?X_L (?X_M SEE.27.V ?X_H))
		(?X_D (?X_M ((ADV-A (AT.P ?X_H)) WAVE.V)))
		(?X_B (?X_H (BACK.ADV WAVE.V)))
	)
)

; "Mary and John were friends."
; "They liked to kiss each other."
; "They spent time together."
; "They walked through the park."
; "John asked Mary if she would go out with him."
(EPI-SCHEMA ((?X_G (LIKE.V (KA (((ADV-A (WITH.P ?X_F)) SPEND.V) ?X_C)))) ** ?E)
	(:ROLES
		(!R1 (?X_C TIME.N))
		(!R2 (?X_F (PLUR FRIEND.N)))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_H AGENT.N))
		(!R5 ((KA (KISS.V (EACH.D OTHER.A))) ACTION.N))
		(!R6 (?X_M AGENT.N))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E ((SET-OF ?X_H ?X_G) (= ?X_F)))
		(?X_J (?X_M LIKE.28.V (KA (KISS.V (EACH.D OTHER.A)))))
		(?X_B (?X_M ((TOGETHER.ADV SPEND.V) ?X_C)))
		(?X_L (?X_M ((ADV-A (FROM.P ?L1)) WALK.3.V) ?L2))
	)
)

; "Mary walked down the street."
; "John came running after her."
; "He caught up with her."
; "He grabbed hold of her hand."
; "He held on tight."
(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA.PR ?X_E ?L2)) ** ?E)
	(:ROLES
		(!R1 (?X_E HOLD.N))
		(!R2 (?X_L AGENT.N))
		(!R3 (?X_M AGENT.N))
		(!R4 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_I (?X_L ((ADV-A (FROM.P ?L1)) WALK.3.V) ?L2))
		(?E_1 (?X_L ((ADV-A (FROM.P ?L1)) RUN.29.V) ?L2))
		(?X_K (?X_M ((ADV-A (FROM.P ?L1)) COME.30.V) ?L2))
		(?X_G (?X_M ((ADV-A (WITH.P ?X_L)) CATCH_UP.V)))
		(?X_D (?X_M (GRAB.V ?X_E)))
		(?X_B (?X_M (TIGHT.ADV HOLD_ON.V)))
	)
)

; "Tommy and Sally were kissing."
; "They were kissing on the lips."
; "They kissed each other's cheeks."
; "They kissed each other's noses."
; "They kissed each other's ears."
; "They kissed each other's eyes."
; "They kissed each other's necks."
; "They kissed each other's shoulders."
; "They kissed each other's arms."
; "They kissed each other's hands."
; "They kissed each other's fingers."
; "They kissed each other's legs."
; "They kissed each other's feet."
; "They kissed each other's toes."
; "They kissed each"
(EPI-SCHEMA ((?X_A (KISS.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A AGENT.N))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_E (PLUR LIP.N)))
	)
	(:STEPS
		(?X_C ((SET-OF ?X_A ?X_D) KISS.V))
		(?X_G (?X_D ((ADV-A (ON.P ?X_E)) KISS.V)))
	)
)



; "The girl saw a snake on the sidewalk."
; "A little dog came along and scared it."
; "The snake left the sidewalk."
(EPI-SCHEMA ((?X_C ((ADV-A (FOR.P (KA (SCARE.V ?X_G)))) COME.V)) ** ?E)
	(:ROLES
		(!R1 (?X_J SNAKE.N))
		(!R2 (?X_C DOG.N))
		(!R3 (?X_C LITTLE.A))
		(!R4 (?X_F GIRL.N))
		(!R5 (?X_G SIDEWALK.N))
		(!R6 (?X_J (ON.P ?X_G)))
		(!R7 (NOT (?X_J = ?L2)))
		(!R8 (?X_J LOCATION.N))
		(!R9 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_F SEE.1.V ?X_J))
		(?X_A (?X_C ((ADV-A (FROM.P ?L1)) COME.2.V) ?L2))
		(?X_B (?X_C (SCARE.V ?X_J)))
		(?X_I (?X_J ((ADV-A (FROM.P ?X_J)) LEAVE.3.V) ?L2))
	)
)

; "Joey looked for a snake."
; "He found one."
; "He played with it."
; "Then he put it back where he found it."
(EPI-SCHEMA ((?X_C (FIND.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_D SNAKE.N))
		(!R3 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_F (?X_I ((ADV-A (FOR.P ?X_D)) LOOK.4.V)))
		(?X_H (?X_I FIND.5.V ?X_C))
		(?X_B (?X_I ((ADV-A (WITH.P ?X_C)) PLAY.V)))
	)
)

; "Tommy was afraid of snakes."
; "He didn't want to go near one."
; "He heard about a snake."
; "His friend's father told him not to worry."
(EPI-SCHEMA ((?X_K (OF.P ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D SNAKE.N))
		(!R2 (?X_J AGENT.N))
		(!R3 (?X_G (PLUR SNAKE.N)))
		(!R4 (?X_K AFRAID.A))
		(!R5 (?X_I FRIEND.N))
		(!R6 (?X_I (PERTAIN-TO ?X_K)))
		(!R7 (?X_H FATHER.N))
		(!R8 (?X_H (PERTAIN-TO ?X_I)))
		(!R9 (?X_J DESTINATION.N))
		(!R10 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_A (?X_K (OF.P ?X_G)))
		(?X_F (NOT (?X_K (WANT.V (KA ((ADV-A (NEAR.P ?X_J)) GO.V))))))
		(?X_C (?X_K ((ADV-A (ABOUT.P ?X_D)) HEAR.V)))
		(?E_1 (?X_K ((ADV-A (FROM.P ?L1)) GO.6.V) ?X_J))
	)
)

; "The girl's father caught a snake."
; "He put it in a box."
; "He kept it outside."
; "He let it go."
(EPI-SCHEMA ((?X_K (CATCH.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E SNAKE.N))
		(!R2 (?X_K GIRL.N))
		(!R3 (?X_J FATHER.N))
		(!R4 (?X_J (PERTAIN-TO ?X_K)))
		(!R5 (?X_L BOX.N))
		(!R6 (?X_L LOCATION.N))
	)
	(:STEPS
		(?X_G (?X_J CATCH.9.V ?X_E))
		(?X_I (?X_K PUT.10.V ?X_E ?X_L))
		(?X_D (?X_K ((OUTSIDE.ADV KEEP.V) ?X_E)))
		(?X_B (?X_K (LET.V (KE (?X_E GO.V)))))
	)
)

; "Alice's cat ate a mouse."
; "A dog killed the cat."
; "The cat was dead."
(EPI-SCHEMA ((?X_E (EAT.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_D CAT.N))
		(!R2 (?X_D DEAD.A))
		(!R3 (?X_C DOG.N))
		(!R4 (?X_E AGENT.N))
		(!R5 (?X_D (PERTAIN-TO ?X_E)))
		(!R6 (?X_H MOUSE.N))
		(!R7 (?X_H FOOD.N))
	)
	(:STEPS
		(?X_G (?X_D EAT.11.V ?X_H))
		(?X_B (?X_C (KILL.V ?X_D)))
	)
)

; "Tom's dog ate some grass."
; "The grass tasted good."
; "Tom's dog liked the taste."
; "Tom's dog ate some more grass."
; "Tom's dog licked its lips."
(EPI-SCHEMA ((?X_K (EAT.V ?X_O)) ** ?E)
	(:ROLES
		(!R1 (?X_J (PLUR LIP.N)))
		(!R2 (?X_I DOG.N))
		(!R3 (?X_D GOOD.A))
		(!R4 (?X_N GRASS.N))
		(!R5 (?X_O TASTE.N))
		(!R6 (?X_K AGENT.N))
		(!R7 (?X_I (PERTAIN-TO ?X_K)))
		(!R8 (?X_J (PERTAIN-TO ?X_K)))
		(!R9 (?X_P GRASS.N))
		(!R10 (?X_P MORE.A))
		(!R11 (?X_N FOOD.N))
		(!R12 (?X_O OBJECT.N))
		(!R13 (NOT (?X_O ACTION.N)))
		(!R14 (NOT (?X_O AGENT.N)))
		(!R15 (?X_P FOOD.N))
	)
	(:STEPS
		(?X_F (?X_I EAT.11.V ?X_N))
		(?X_C (?X_N (TASTE.V ?X_D)))
		(?X_H (?X_I LIKE.12.V ?X_O))
		(?X_M (?X_I EAT.11.V ?X_P))
		(?X_A (?X_I (LICK.V ?X_J)))
	)
)

; "The girl's friend invited her over."
; "Her parents were gone."
; "They played video games and watched TV."
; "After awhile they fell asleep."
; "Then they heard noises coming from upstairs."
; "They thought someone was breaking into their house."
(EPI-SCHEMA ((?X_F
              (THINK.V (THT (?X_F (= (KA ((ADV-A (INTO.P ?X_O)) BREAK.V)))))))
             ** ?E)
	(:ROLES
		(!R1 (?X_O HOUSE.N))
		(!R2 (?X_F PERSON.N))
		(!R3 (?X_I UPSTAIRS.N))
		(!R4 (?X_J (PLUR NOISE.N)))
		(!R5 (?X_M AGENT.N))
		(!R6 (?X_N VIDEO.N))
		(!R7 (?X_N (PLUR GAME.N)))
		(!R8 (?X_P AGENT.N))
		(!R9 (?X_O (PERTAIN-TO ?X_P)))
		(!R10 (?X_S FRIEND.N))
		(!R11 (?X_T GIRL.N))
		(!R12 (?X_S (PERTAIN-TO ?X_T)))
		(!R13 (NOT (?X_S = ?X_T)))
		(!R14 (?A ACTION.N))
	)
	(:STEPS
		(?X_R (?X_S INVITE_OVER.13.V ?X_T ?A))
		(?X_B (?X_P (PLAY.V ?X_N)))
		(?X_C (?X_P (WATCH.V ?X_M)))
		(?X_L (?X_A ((AWHILE.ADV AFTER.P) (KE (?X_P (FALL.V ASLEEP.A))))))
		(?X_D (?X_J ((ADV-A (FROM.P ?X_I)) COME.V)))
		(?X_H (?X_P ((THEN.ADV HEAR.V) ?X_J)))
		(?X_E (?X_P (THINK.V (THT (?X_F (= (KA ((ADV-A (INTO.P ?X_O)) BREAK.V))))))))
	)
)

; "Lisa and her friends played video games."
; "They played for hours."
; "They played until they were tired."
(EPI-SCHEMA ((?X_F ((ADV-A (FOR.P ?X_D)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR HOUR.N)))
		(!R2 (?X_E (PLUR GAME.N)))
		(!R3 (?X_E VIDEO.N))
		(!R4 (?X_J (PLUR FRIEND.N)))
		(!R5 (?X_F AGENT.N))
		(!R6 (?X_J (PERTAIN-TO ?X_F)))
		(!R7 (?X_I (UNTIL.P (KE (?X_J TIRED.A)))))
	)
	(:STEPS
		(?X_A ((SET-OF ?X_F ?X_J) (PLAY.V ?X_E)))
		(?X_C (?X_J ((ADV-A (FOR.P ?X_D)) PLAY.V)))
		(?X_H (?X_J PLAY.14.V))
	)
)

; "Tommy lives in an old house."
; "His dad built the house."
; "There is no electricity in the house."
; "Tommy likes living there."
(EPI-SCHEMA ((?X_K ((ADV-A (IN.P ?X_J)) LIVE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_J OLD.A))
		(!R2 (?X_J HOUSE.N))
		(!R3 (?X_I DAD.N))
		(!R4 (?X_I (PERTAIN-TO ?X_K)))
		(!R5 (?X_J LOCATION.N))
		(!R6 ((KA (THERE.ADV LIVE.V)) ACTION.N))
		(!R7 (?X_K AGENT.N))
		(!R8
   ((NO.D (L X (AND (X ELECTRICITY.N) (X (IN.P (THE.D HOUSE.N)))))) LOCATION.N))
	)
	(:STEPS
		(?X_F (?X_K LIVE.15.V ?X_J))
		(?X_B (?X_I (BUILD.V ?X_J)))
		(?X_D
   (?X_A
    (BE.V (NO.D (L X (AND (X ELECTRICITY.N) (X (IN.P (THE.D HOUSE.N)))))))))
		(?X_H (?X_K LIKE.16.V (KA (THERE.ADV LIVE.V))))
		(?E_1
   (?X_K LIVE.17.V
    (NO.D (L X (AND (X ELECTRICITY.N) (X (IN.P (THE.D HOUSE.N))))))))
	)
)

; "Tom played video games."
; "His friends came over."
; "They played video games."
; "Tom played too."
(EPI-SCHEMA ((?X_I ((ADV-A (WITH.P ?X_H)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_H (PLUR FRIEND.N)))
		(!R2 (?X_G VIDEO.N))
		(!R3 (?X_G (PLUR GAME.N)))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_H (PERTAIN-TO ?X_I)))
		(!R6 (?X_L VIDEO.N))
		(!R7 (?X_L (PLUR GAME.N)))
	)
	(:STEPS
		(?X_F (?X_I (PLAY.V ?X_G)))
		(?X_D (?X_H COME_OVER.V))
		(?X_K (?X_H PLAY.18.V))
		(?X_B (?X_I (TOO.ADV PLAY.V)))
	)
)

; "Mary had a bad dream."
; "In her dream she saw a thief break into her house."
; "She woke up crying."
(EPI-SCHEMA ((?X_F (HAVE.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_F BAD.A))
		(!R2 (?X_F DREAM.N))
		(!R3 (?X_F (PERTAIN-TO ?X_H)))
		(!R4 (?X_G HOUSE.N))
		(!R5 (?X_G (PERTAIN-TO ?X_H)))
		(!R6 (?X_H AGENT.N))
		(!R7 (?X_I THIEF.N))
	)
	(:STEPS
		(?X_E (?X_H (HAVE.V ?X_F)))
		(?X_A
   (?X_H SEE.19.V
    (KE (?X_I ((ADV-A (IN.P ?X_F)) ((ADV-A (INTO.P ?X_G)) BREAK.V))))))
		(?X_C (?X_H ((ADV-A (FOR.P (KA CRY.V))) WAKE_UP.V)))
	)
)

; "Alice was playing video games."
; "She found a new game."
; "She liked that game."
; "She played it for hours."
(EPI-SCHEMA ((?X_K (LIKE.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_J NEW.A))
		(!R2 (?X_J GAME.N))
		(!R3 (?X_E VIDEO.N))
		(!R4 (?X_E (PLUR GAME.N)))
		(!R5 (?X_J OBJECT.N))
		(!R6 (NOT (?X_J ACTION.N)))
		(!R7 (NOT (?X_J AGENT.N)))
		(!R8 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_D (?X_K PLAY.20.V))
		(?X_B (?X_K (FIND.V ?X_J)))
		(?X_G (?X_K LIKE.21.V ?X_J))
		(?X_I (?X_K PLAY.22.V ?X_J))
	)
)

; "Alice's mother was not there."
; "Alice's father was not there."
; "Alice's brother was not there."
; "Alice's sister was not there."
; "Alice's dog was not there."
; "Alice's cat was not there."
; "Alice's fish was not there."
; "Alice's frog was not there."
; "Alice's turtle was not there."
(EPI-SCHEMA ((?X_Y (ALONE.ADV BE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_A MOTHER.N))
		(!R2 (?X_A (PERTAIN-TO ?X_Z)))
		(!R3 (?X_D FATHER.N))
		(!R4 (?X_D (PERTAIN-TO ?X_Z)))
		(!R5 (?X_G BROTHER.N))
		(!R6 (?X_G (PERTAIN-TO ?X_Z)))
		(!R7 (?X_J SISTER.N))
		(!R8 (?X_J (PERTAIN-TO ?X_Z)))
		(!R9 (?X_M DOG.N))
		(!R10 (?X_M (PERTAIN-TO ?X_Z)))
		(!R11 (?X_P CAT.N))
		(!R12 (?X_P (PERTAIN-TO ?X_Z)))
		(!R13 (?X_S FISH.N))
		(!R14 (?X_S (PERTAIN-TO ?X_Z)))
		(!R15 (?X_V FROG.N))
		(!R16 (?X_V (PERTAIN-TO ?X_Z)))
		(!R17 (?X_Y TURTLE.N))
		(!R18 (?X_Y (PERTAIN-TO ?X_Z)))
	)
	(:STEPS
		(?X_C (?X_A ((ADV (NOT THERE.A)) BE.V)))
		(?X_F (?X_D ((ADV (NOT THERE.A)) BE.V)))
		(?X_I (?X_G ((ADV (NOT THERE.A)) BE.V)))
		(?X_L (?X_J ((ADV (NOT THERE.A)) BE.V)))
		(?X_O (?X_M ((ADV (NOT THERE.A)) BE.V)))
		(?X_R (?X_P ((ADV (NOT THERE.A)) BE.V)))
		(?X_U (?X_S ((ADV (NOT THERE.A)) BE.V)))
		(?X_X (?X_V ((ADV (NOT THERE.A)) BE.V)))
		(?X_ZB (?X_Y ((ADV (NOT THERE.A)) BE.V)))
	)
)

; "Jack had a lot of toys."
; "His room was full of them."
; "He was playing with some of them."
; "A boy named Tom came by."
(EPI-SCHEMA ((?X_N (HAVE.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_E BOY.N))
		(!R2 (?X_E ((PASV NAME.V) ?X_F)))
		(!R3 (?X_L FULL.A))
		(!R4 (?X_L ROOM.N))
		(!R5 (?X_I (PLUR TOY.N)))
		(!R6 (?X_M LOT.N))
		(!R7 (?X_M (OF.P ?X_I)))
		(!R8 (?X_L (PERTAIN-TO ?X_N)))
		(!R9 (?X_M OBJECT.N))
		(!R10 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_H (?X_N HAVE.23.V ?X_M))
		(?X_B (?X_L (OF.P ?X_A)))
		(?X_K (?X_N PLAY.24.V))
		(?X_D (?X_E COME_BY.V))
	)
)

; "Alice was having fun with her friends."
; "They were all together."
; "A storm came up."
; "The wind blew hard."
; "The girls ran for cover."
(EPI-SCHEMA ((?X_A (HAVE.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_A AGENT.N))
		(!R2 (?X_B FUN.N))
		(!R3 (?X_E STORM.N))
		(!R4 (?X_H WIND.N))
		(!R5 (?X_I HARD.A))
		(!R6 (?X_L (PLUR GIRL.N)))
		(!R7 (?X_M COVER.N))
	)
	(:STEPS
		(?X_D (?X_A (HAVE.V ?X_B)))
		(?X_G (?X_E COME_UP.V))
		(?X_K (?X_H (BLOW.V ?X_I)))
		(?X_O (?X_L ((ADV-A (FOR.P ?X_M)) RUN.V)))
	)
)



; "My sister is always late for dinner."
; "She says she can't find her keys."
; "She doesn't want to eat without them."
; "She has been looking everywhere."
(EPI-SCHEMA ((?X_E ((ADV-A (WITHOUT.P ?X_C)) EAT.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR KEY.N)))
		(!R2 (?X_C (PERTAIN-TO ?X_E)))
		(!R3 (?X_D SISTER.N))
		(!R4 (?X_D (PERTAIN-TO ?X_E)))
		(!R5 (?X_E AGENT.N))
		(!R6 (?F FOOD.N))
	)
	(:STEPS
		(?X_B (NOT (?X_E (WANT.V (KA ((ADV-A (WITHOUT.P ?X_C)) EAT.V))))))
		(?E_1 (?X_E EAT.1.V ?F))
	)
)

; "Bill's sister works for him."
; "His sister makes money."
; "His sister helps him."
; "His sister is good-looking."
; "His sister is smart."
; "His sister likes sports."
(EPI-SCHEMA ((?X_H ((ADV-A (FOR.P ?X_H)) WORK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F MONEY.N))
		(!R2 (?X_G SISTER.N))
		(!R3 (?X_G GOOD-LOOKING.A))
		(!R4 (?X_H AGENT.N))
		(!R5 (?X_G (PERTAIN-TO ?X_H)))
		(!R6 (?X_I SISTER.N))
		(!R7 (?X_I (PERTAIN-TO ?X_J)))
		(!R8 (?X_K (PLUR SPORT.N)))
	)
	(:STEPS
		(?X_E (?X_G ((ADV-A (FOR.P ?X_H)) WORK.V)))
		(?X_A (?X_G (MAKE.V ?X_F)))
		(?X_B (?X_G (HELP.V ?X_H)))
		(?X_C (?X_I (LIKE.V ?X_K)))
	)
)

; "Cindy's sister came over."
; "Cindy was glad to see her."
; "Cindy gave her some food."
(EPI-SCHEMA ((?X_F (((ADV-A (TO.P ?X_F)) GIVE.V) ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_E SISTER.N))
		(!R2 (?X_G (GLAD.A (KA (SEE.V ?X_E)))))
		(!R3 (?X_E (PERTAIN-TO ?X_G)))
		(!R4 (?X_F FOOD.N))
		(!R5 (NOT (?X_F AGENT.N)))
		(!R6 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_B (?X_E COME_OVER.V))
		(?E_1 (?X_G SEE.3.V ?X_E))
		(?X_D (?X_G (GIVE.4.V ?X_E ?X_F)))
	)
)



; "Sammy is going to school today."
; "He has never been there before."
; "He doesn't know what to expect."
; "He will have fun."
(EPI-SCHEMA ((?X_H (HAS.AUX (NEVER.ADV (BEFORE.ADV (THERE.ADV BE.V))))) ** ?E)
	(:ROLES
		(!R1 (?X_H AGENT.N))
		(!R2 (?X_I FUN.N))
	)
	(:STEPS
		(?X_E (?X_H (HAS.AUX (NEVER.ADV (BEFORE.ADV (THERE.ADV BE.V))))))
		(?X_G (NOT (?X_H (KNOW.V (ANS-TO (?X_A ({SHOULD}.AUX-V (EXPECT.V ?X_B))))))))
		(?X_C (?X_H (HAVE.V ?X_I)))
	)
)

; "Mary went to school."
; "She knew how to read."
; "She could write."
; "She liked school."
(EPI-SCHEMA ((?X_E (CAN.AUX WRITE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D SCHOOL.N))
		(!R2 (?X_F SCHOOL.N))
		(!R3 (?X_D DESTINATION.N))
		(!R4 (?X_F OBJECT.N))
		(!R5 (?X_E AGENT.N))
		(!R6 (NOT (?X_F ACTION.N)))
		(!R7 (NOT (?X_F AGENT.N)))
	)
	(:STEPS
		(E36.SK (?X_E (CAN.MD WRITE.V)))
		(?X_A (?X_E ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_D))
		(?X_C (?X_E LIKE.2.V ?X_F))
	)
)

; "Bill went to school."
; "He learned how to read."
; "He was learning to write."
; "He liked school."
(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA.PR ?X_G ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_H BILL.N))
		(!R2 (?X_G SCHOOL.N))
		(!R3 (?X_J SCHOOL.N))
		(!R4 (?X_G DESTINATION.N))
		(!R5 (?X_H AGENT.N))
		(!R6 (?X_J OBJECT.N))
		(!R7 (?X_I AGENT.N))
		(!R8 (NOT (?X_J ACTION.N)))
		(!R9 (NOT (?X_J AGENT.N)))
	)
	(:STEPS
		(?X_D (?X_H ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_G))
		(?X_B (?X_I ((ADV-A (FOR.P (KA WRITE.V))) LEARN.V)))
		(?X_F (?X_I LIKE.3.V ?X_J))
	)
)

; "Sammy went to school."
; "His teacher gave him homework."
; "Sammy did not understand the assignment."
; "He asked for help."
(EPI-SCHEMA ((?X_K
              ((ADV-A
                (FOR.P
                 (KA (L X (AND (X SCHOOL.N) (X (FROM.P (A.D LOCATION.N))))))))
               GO.V))
             ** ?E)
	(:ROLES
		(!R1 (?X_D HOMEWORK.N))
		(!R2 (?X_D ASSIGNMENT.N))
		(!R3 (?X_E TEACHER.N))
		(!R4 (?X_E (PERTAIN-TO ?X_K)))
		(!R5 (?X_J SCHOOL.N))
		(!R6 (?X_J DESTINATION.N))
		(!R7 (?X_K AGENT.N))
		(!R8 (NOT (?X_K = ?Y)))
		(!R9 (?A ACTION.N))
		(!R10 (?Y AGENT.N))
	)
	(:STEPS
		(?X_G (?X_K ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_J))
		(?X_A (?X_E (GIVE.V ?X_K ?X_D)))
		(?X_C (NOT (?X_K (UNDERSTAND.V ?X_D))))
		(?X_I (?X_K ASK.4.V ?Y ?A))
	)
)

; "Mary went to school."
; "She was scared."
; "She wasn't sure how she would do."
; "She was nervous."
(EPI-SCHEMA ((?X_C
              ((ADV-A
                (FOR.P
                 (KA (L X (AND (X SCHOOL.N) (X (FROM.P (A.D LOCATION.N))))))))
               GO.V))
             ** ?E)
	(:ROLES
		(!R1 (?X_C SCARED.A))
		(!R2 (?X_C NERVOUS.A))
		(!R3 (?X_D SCHOOL.N))
		(!R4 (?X_C AGENT.N))
		(!R5 (?X_D DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_C ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_D))
	)
)

; "Sammy's teacher told him that he would be having a test on Monday."
; "He hoped that he would do well."
; "He looked forward to seeing Sammy's teacher again."
(EPI-SCHEMA ((?X_H
              (FORWARD.ADV
               ((ADV-A (TO.P (KA (AGAIN.ADV SEE.V) ?X_G))) LOOK.V)))
             ** ?E)
	(:ROLES
		(!R1 (?X_E TEST.N))
		(!R2 (?X_E (ON.P ?X_F)))
		(!R3 (?X_G TEACHER.N))
		(!R4 (?X_G (PERTAIN-TO ?X_H)))
		(!R5 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_D (?X_G (TELL.V ?X_H (THAT (?X_H (WILL.MD (HAVE.V ?X_E)))))))
		(?X_B (?X_H ((ADV-A (TO.P (KA (AGAIN.ADV SEE.V) ?X_G))) LOOK_FORWARD.V)))
		(?E_1 (?X_H SEE.5.V ?X_G))
	)
)

; "Sammy liked to go to school."
; "He always looked forward to school."
; "His teachers were strict."
; "Sammy did not like school."
(EPI-SCHEMA ((?X_J (LIKE.V (KA ((ADV-A (TO.P ?X_C)) GO.V)))) ** ?E)
	(:ROLES
		(!R1 (?X_C SCHOOL.N))
		(!R2 (?X_F SCHOOL.N))
		(!R3 (?X_I (PLUR TEACHER.N)))
		(!R4 (?X_I STRICT.A))
		(!R5 (?X_I (PERTAIN-TO ?X_J)))
		(!R6 (?X_K SCHOOL.N))
		(!R7 ((KA ((ADV-A (TO.P ?X_K)) GO.V)) ACTION.N))
		(!R8 (?X_J AGENT.N))
		(!R9 (?X_K DESTINATION.N))
	)
	(:STEPS
		(?X_H (?X_J LIKE.6.V (KA ((ADV-A (TO.P ?X_K)) GO.V))))
		(?X_E (?X_J (ALWAYS.ADV ((ADV-A (TO.P ?X_F)) LOOK_FORWARD.V))))
		(?X_B (NOT (?X_J (LIKE.P ?X_C))))
		(?E_1 (?X_J ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_K))
	)
)

; "Sammy went to school."
; "He met some kids."
; "He ate lunch."
; "He played on the playground."
; "He walked home."
(EPI-SCHEMA ((?X_N
              ((ADV-A
                (FOR.P
                 (KA (L X (AND (X SCHOOL.N) (X (FROM.P (A.D LOCATION.N))))))))
               GO.V))
             ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR KID.N)))
		(!R2 (?X_M SCHOOL.N))
		(!R3 (?X_F LUNCH.N))
		(!R4 (?X_O HOME.N))
		(!R5 (?X_M DESTINATION.N))
		(!R6 (?Y ENTITY.N))
		(!R7 (?X_N AGENT.N))
		(!R8 (?X_O DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_N ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_M))
		(?X_B (?X_N (MEET.V ?X_C)))
		(?X_H (?X_N EAT.8.V ?X_F))
		(?X_J (?X_N PLAY.9.V ?Y))
		(?X_L (?X_N ((ADV-A (FROM.P ?L1)) WALK.10.V) ?X_O))
	)
)

; "Alice went to school."
; "She knew all the kids."
; "She was happy to be there."
; "She learned lots of things."
(EPI-SCHEMA ((?X_H (((ADV-A (IN.P ?X_H)) LEARN.V) ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR LOT.N)))
		(!R2 (?X_C (OF.P ?X_D)))
		(!R3 (?X_G (HAPPY.A (KA (THERE.ADV BE.V)))))
		(!R4 (?X_H SCHOOL.N))
		(!R5 (?X_G AGENT.N))
		(!R6 (?X_H DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_G ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_H))
		(?X_B (?X_G (LEARN.V ?X_C)))
	)
)

; "Karen went to school."
; "She had to go to class."
; "She walked to school."
; "She found her locker."
; "She put some books inside."
(EPI-SCHEMA ((?X_G ((ADV-A (TO.P ?X_N)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_M CLASS.N))
		(!R2 (?X_N SCHOOL.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_L (PLUR BOOK.N)))
		(!R5 (?X_M DESTINATION.N))
		(!R6 (?X_N DESTINATION.N))
		(!R7 (?X_O AGENT.N))
		(!R8 (?L LOCATION.N))
	)
	(:STEPS
		(?X_D (?X_O ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_N))
		(?X_B (MUST.AUX-S (?X_O ((ADV-A (TO.P ?X_M)) GO.V))))
		(?E_1 (?X_O ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_M))
		(?X_F (?X_O ((ADV-A (FROM.P ?L1)) WALK.10.V) ?X_N))
		(?X_I (?X_O FIND.11.V ?X_G))
		(?X_K (?X_O PUT.12.V ?X_L ?L))
	)
)

; "Mary loves to play soccer."
; "She has been playing since she was small."
; "She played with some friends today."
; "She scored two goals."
(EPI-SCHEMA ((?X_L
              (COMPOSITE-SCHEMA.PR (K (SINCE.P (?X_L SMALL.A))) ?X_A
               (TWO.D (PLUR GOAL.N)) (KA (PLAY.V ?X_K))))
             ** ?E)
	(:ROLES
		(!R1 (?X_K SOCCER.N))
		(!R2 ((KA (PLAY.V ?X_K)) ACTION.N))
		(!R3 (?X AGENT.N))
		(!R4 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_H (?X_L LOVE.13.V (KA (PLAY.V ?X_K))))
		(?X_B (?X_A (PLAY.V (K (SINCE.P (?X_L SMALL.A))))))
		(?X_F (?X_L ((HAS.AUX BE.V) ?X_A)))
		(?E_1 (?X PLAY.14.V))
		(?X_J (?X_L PLAY.15.V))
		(?X_D (?X_L (SCORE.V (TWO.D (PLUR GOAL.N)))))
	)
)

; "Jake is good at soccer."
; "He plays on a team."
; "His team lost the game."
; "He was mad."
(EPI-SCHEMA ((?X_H (PLAY.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_C GAME.N))
		(!R2 (?X_E TEAM.N))
		(!R3 (?X_D SOCCER.N))
		(!R4 (?X_H GOOD.A))
		(!R5 (?X_H MAD.A))
		(!R6 (?X_E (PERTAIN-TO ?X_H)))
		(!R7 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_A (?X_H (AT.P ?X_D)))
		(?X_G (?X_H PLAY.16.V))
		(?X_B (?X_E (LOSE.V ?X_C)))
	)
)

; "Peter likes football."
; "He plays football for his school."
; "He is good at football."
; "He scores lots of points."
(EPI-SCHEMA ((?X_I (PLAY.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B FOOTBALL.N))
		(!R2 (?X_I GOOD.A))
		(!R3 (?X_H FOOTBALL.N))
		(!R4 (?X_G FOOTBALL.N))
		(!R5 (?X_H OBJECT.N))
		(!R6 (NOT (?X_H ACTION.N)))
		(!R7 (NOT (?X_H AGENT.N)))
		(!R8 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_D (?X_I LIKE.17.V ?X_H))
		(?X_F (?X_I PLAY.18.V))
		(?X_A (?X_I (AT.P ?X_B)))
	)
)

; "Tom played football."
; "He played a lot of games."
; "He played on a team."
; "He played well."
; "He did not win any games."
(EPI-SCHEMA ((?X_N (A_LOT.ADV PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G LOT.N))
		(!R2 (?X_G (OF.P ?X_H)))
		(!R3 (?X_K FOOTBALL.N))
		(!R4 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_J (?X_N PLAY.21.V))
		(?X_F (?X_N (PLAY.V ?X_G)))
		(?X_M (?X_N PLAY.22.V))
		(?X_D (?X_N (WELL.ADV PLAY.V)))
		(?X_B (NOT (?X_N (WIN.V (ANY.D (PLUR GAME.N))))))
	)
)

; "Sarah likes to play basketball."
; "She plays on a team."
; "She is good at basketball."
; "She scores lots of points."
(EPI-SCHEMA ((?X (PLAY.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B BASKETBALL.N))
		(!R2 (?X_H GOOD.A))
		(!R3 (?X_G BASKETBALL.N))
		(!R4 ((KA (PLAY.V ?X_G)) ACTION.N))
		(!R5 (?X AGENT.N))
		(!R6 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_D (?X_H LIKE.23.V (KA (PLAY.V ?X_G))))
		(?E_1 (?X PLAY.14.V))
		(?X_F (?X_H PLAY.24.V))
		(?X_A (?X_H (AT.P ?X_B)))
	)
)

; "Mary plays soccer."
; "She is good at soccer."
; "She plays on a team."
; "She scores many goals."
(EPI-SCHEMA ((?X_H (PLAY.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B SOCCER.N))
		(!R2 (?X_H GOOD.A))
		(!R3 (?X_E SOCCER.N))
		(!R4 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_D (?X_H PLAY.25.V))
		(?X_A (?X_H (AT.P ?X_B)))
		(?X_G (?X_H PLAY.26.V))
	)
)

; "Mary is on a soccer team."
; "She plays for fun."
; "She likes to score goals."
(EPI-SCHEMA ((?X_H (((ADV-A (WITH.P ?Y)) PLAY.V) ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_C SOCCER.N))
		(!R2 (?X_C TEAM.N))
		(!R3 (?X_I (PLUR GOAL.N)))
		(!R4 (?Y ENTITY.N))
		(!R5 (?X_H AGENT.N))
		(!R6 ((KA (SCORE.N ?X_I)) ACTION.N))
	)
	(:STEPS
		(?X_B (?X_H ((ADV-A (ON.P ?X_C)) BE.V)))
		(?X_E (?X_H PLAY.27.V ?Y))
		(?X_G (?X_H LIKE.28.V (KA (SCORE.N ?X_I))))
	)
)

; "Mary is playing soccer."
; "She is good at soccer."
; "She plays for her school team."
; "She likes to play soccer."
(EPI-SCHEMA ((?X_K (PLAY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C SOCCER.N))
		(!R2 (?X_K GOOD.A))
		(!R3 (?X_F SOCCER.N))
		(!R4 (?X_G (PERTAIN-TO ?X_K)))
		(!R5 (?X_H SCHOOL.N))
		(!R6 (?X_G ?X_H TEAM.N))
		(!R7 (?X_L SOCCER.N))
		(!R8 (?X_K AGENT.N))
		(!R9 ((KA (PLAY.V ?X_L)) ACTION.N))
		(!R10 (?X AGENT.N))
	)
	(:STEPS
		(?X_E (?X_K PLAY.29.V))
		(?X_A (?X_K (AT.P ?X_C)))
		(?X_B (?X_K PLAY.30.V))
		(?X_J (?X_K LIKE.31.V (KA (PLAY.V ?X_L))))
		(?E_1 (?X PLAY.14.V))
	)
)



; "The man was walking along the road."
; "A car hit him from behind."
; "He died instantly."
; "No one knew what happened."
(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA.PR ?X_I (ANS-TO (?X_A HAPPEN.V)) ?L2)) **
             ?E)
	(:ROLES
		(!R1 (?X_I MAN.N))
		(!R2 (?X_J BEHIND.N))
		(!R3 (?X_K CAR.N))
		(!R4 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_I ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_H (?X_K (((ADV-A (FROM.P ?X_J)) HIT.V) ?X_I)))
		(?X_F (?X_I (INSTANTLY.ADV DIE.V)))
		(?X_D ((NO.D ONE.N) (KNOW.V (ANS-TO (?X_A HAPPEN.V)))))
	)
)

; "The boy ran into the street."
; "He almost knocked over cars."
; "He looked both ways before running across the street."
; "He did not look where he was going."
; "He ran into the side of a car."
; "The car hit him hard."
; "His head hurt."
(EPI-SCHEMA ((?X_R ((ADV-A (INTO.P ?X_H)) RUN.V)) ** ?E)
	(:ROLES
		(!R1 (?X_I CAR.N))
		(!R2 (?X_H SIDE.N))
		(!R3 (?X_H (OF.P ?X_I)))
		(!R4 (?X_L (WHERE.P (KE (?X_S GO.V)))))
		(!R5 (?X_V STREET.N))
		(!R6 (?X_S MALE.A))
		(!R7 (?X_S AGENT.N))
		(!R8 (?X_Q (PLUR CAR.N)))
		(!R9 (?X_R BOY.N))
		(!R10 (?X_R HEAD.N))
		(!R11 (?X_R (PERTAIN-TO ?X_S)))
		(!R12 (?X_V DESTINATION.N))
	)
	(:STEPS
		(?X_C (?X_R HURT.V))
		(?X_U (?X_R ((ADV-A (FROM.P ?L1)) RUN.2.V) ?X_V))
		(?X_P (?X_R ((ALMOST.ADV KNOCK_OVER.V) ?X_Q)))
		(?X_N
   (?X_S
    (((ADV-A (BEFORE.P (KA ((ADV-A (ACROSS.P ?X_V)) RUN.V)))) LOOK.V)
     (BOTH.D (PLUR WAY.N)))))
		(?X_K (NOT (?X_S (LOOK.V ?X_L))))
		(?X_G (?X_S ((ADV-A (INTO.P ?X_H)) RUN.V)))
		(?X_E (?X_I ((HARD.ADV HIT.V) ?X_A)))
	)
)

; "Tom walked down the street."
; "A dog ran across the road."
; "Tom saw the dog."
; "He did not step on the brakes."
; "He stepped on the brakes."
; "His foot slipped."
; "He crashed into a tree."
(EPI-SCHEMA ((?X_S (COMPOSITE-SCHEMA.PR ?L2 ?X_O ?X_R)) ** ?E)
	(:ROLES
		(!R1 (?X_C TREE.N))
		(!R2 (?X_H FOOT.N))
		(!R3 (?X_R (PLUR BRAKE.N)))
		(!R4 (?X_H (PERTAIN-TO ?X_S)))
		(!R5 (?X_O DOG.N))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?X_R DESTINATION.N))
		(!R8 (?X_S AGENT.N))
	)
	(:STEPS
		(?X_E (?X_H SLIP.V))
		(?X_J (?X_S ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_L (?X_O ((ADV-A (FROM.P ?L1)) RUN.3.V) ?L2))
		(?X_N (?X_S SEE.4.V ?X_O))
		(?X_G (NOT (?X_S (STEP_ON.V ?X_R))))
		(?X_Q (?X_S ((ADV-A (FROM.P ?L1)) STEP_ON.5.V) ?X_R))
		(?X_B (?X_S ((ADV-A (INTO.P ?X_C)) CRASH.V)))
	)
)

; "Tom walked down the street."
; "A car ran into him."
; "He died."
; "His family cried."
(EPI-SCHEMA ((?X_J ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_J AGENT.N))
		(!R2 (?X_E CAR.N))
		(!R3 (?X_L FAMILY.N))
		(!R4 (?X_L (PERTAIN-TO ?X_J)))
		(!R5 (?X_K AGENT.N))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_G (?X_K ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_D (?X_E ((ADV-A (INTO.P ?X_J)) RUN.V)))
		(?X_B (?X_J DIE.V))
		(?X_I (?X_L CRY.6.V))
	)
)

; "Sue's dad was driving on the highway."
; "His brakes failed."
; "He crashed into a tree."
; "He died in the accident."
(EPI-SCHEMA ((?X_G ((ADV-A (INTO.P ?X_C)) CRASH.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR BRAKE.N)))
		(!R2 (?X_C TREE.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_F (PERTAIN-TO ?X_G)))
		(!R5 (?X_H ACCIDENT.N))
	)
	(:STEPS
		(?X_B (?X_F FAIL.V))
		(?X_E (?X_G ((ADV-A (INTO.P ?X_C)) CRASH.V)))
		(?X_J (?X_G ((ADV-A (IN.P ?X_H)) DIE.V)))
	)
)

; "Bob walked down the street."
; "He saw a car parked on the side of the road."
; "There were no cars around."
; "He looked inside the car."
; "It was empty."
(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA.PR (NO.D (PLUR CAR.N)) ?L2 ?X_M ?X_L)) **
             ?E)
	(:ROLES
		(!R1 (?X_K ROAD.N))
		(!R2 (?X_K CAR.N))
		(!R3 (?X_D MALE.A))
		(!R4 (?X_D AGENT.N))
		(!R5 (?X_M SIDE.N))
		(!R6 (?X_M (OF.P ?X_K)))
		(!R7 (?X_L CAR.N))
		(!R8 (?X_L (ON.P ?X_M)))
		(!R9 (?L2 DESTINATION.N))
		(!R10 (?X AGENT.N))
		(!R11 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_H (?X_N ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?E_1 (?X PARK.7.V ?X_L ?X_M))
		(?X_J (?X_N SEE.8.V ?X_L))
		(?X_F (?X_A (BE.V (NO.D (PLUR CAR.N)))))
		(?X_C (?X_D ((ADV-A (INSIDE.P ?X_K)) LOOK.V)))
	)
)

; "Sarah's mother woke her up early."
; "She told Sarah to eat breakfast."
; "Sarah ate breakfast."
; "She drank milk."
; "She watched TV."
(EPI-SCHEMA ((?X_C (EARLY.ADV WAKE_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_M MOTHER.N))
		(!R3 (?X_M (PERTAIN-TO ?X_O)))
		(!R4 (?X_N BREAKFAST.N))
		(!R5 (?X_J MILK.N))
		(!R6 (NOT (?X_M = ?X_O)))
		(!R7 ((KA (EAT.V ?X_N)) ACTION.N))
		(!R8 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_E (?X_M ((EARLY.ADV WAKE_UP.V) ?X_O)))
		(?X_G (?X_M TELL.11.V ?X_O (KA (EAT.V ?X_N))))
		(?E_1 (?X_M EAT.9.V ?X_N))
		(?X_I (?X_O EAT.12.V ?X_N))
		(?X_L (?X_O DRANK.13.V ?X_J))
		(?X_B (?X_O (WATCH.V ?X_C)))
	)
)

; "Bob's dad is a teacher."
; "His mom helps him with homework."
; "His father helped Bob with his math problems."
(EPI-SCHEMA ((?X_G ((ADV-A (WITH.P ?X_C)) HELP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F MOM.N))
		(!R2 (?X_C HOMEWORK.N))
		(!R3 (?X_G FATHER.N))
		(!R4 (?X_H ?X_D (PLUR PROBLEM.N)))
		(!R5 (?X_I AGENT.N))
		(!R6 (?X_E (PERTAIN-TO ?X_I)))
		(!R7 (?X_F (PERTAIN-TO ?X_I)))
		(!R8 (?X_G (PERTAIN-TO ?X_I)))
		(!R9 (?X_H (PERTAIN-TO ?X_I)))
	)
	(:STEPS
		(?X_A (?X_F (((ADV-A (WITH.P ?X_C)) HELP.V) ?X_I)))
		(?X_B (?X_G (((ADV-A (WITH.P ?X_H)) HELP.V) ?X_I)))
	)
)

; "'I'm going to play baseball today.'"
; "'I can't wait until I go back to school.'"
; "'Mommy is taking us to school.'"
; "'I hate school!'"
(EPI-SCHEMA (((ADV-E ({DURING}.P ?X_C)) (?X_F PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C BASEBALL.N))
		(!R2 (?X_C TODAY.N))
		(!R3 (?X_I SCHOOL.N))
		(!R4 (?X_F AGENT.N))
		(!R5 (?X_G ENTITY.N))
		(!R6 (?X_G SMALLER-THAN.N ?X_H))
		(!R7 (?X_H AGENT.N))
		(!R8 (?X_I DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_F ((ADV-A (FOR.P (KA (PLAY.V ?X_C)))) GO.V)))
		(?E_1 (?X_F PLAY.15.V))
		(?X_E (?X_H TAKE.16.V ?X_G ?X_I))
	)
)

; "Tom ate breakfast."
; "He drank milk."
; "He ate cereal."
; "He ate toast."
(EPI-SCHEMA ((?X_L (EAT.V ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_A BREAKFAST.N))
		(!R2 (?X_D MILK.N))
		(!R3 (?X_K CEREAL.N))
		(!R4 (?X_M TOAST.N))
		(!R5 (?X_K FOOD.N))
		(!R6 (?X_L AGENT.N))
		(!R7 (?X_M FOOD.N))
	)
	(:STEPS
		(?X_C (?X_L EAT.12.V ?X_A))
		(?X_F (?X_L DRANK.13.V ?X_D))
		(?X_H (?X_L EAT.12.V ?X_K))
		(?X_J (?X_L EAT.12.V ?X_M))
	)
)

; "Tom went to school."
; "His teacher gave him homework."
; "He did not do the homework."
; "He missed the bus."
(EPI-SCHEMA ((?X_M (MISS.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D BUS.N))
		(!R2 (?X_E MALE.A))
		(!R3 (?X_E AGENT.N))
		(!R4 (?X_H HOMEWORK.N))
		(!R5 (?X_I HOMEWORK.N))
		(!R6 (?X_J TEACHER.N))
		(!R7 (?X_J (PERTAIN-TO ?X_M)))
		(!R8 (?X_N SCHOOL.N))
		(!R9 (?X_M AGENT.N))
		(!R10 (?X_N DESTINATION.N))
	)
	(:STEPS
		(?X_L (?X_M ((ADV-A (FROM.P ?L1)) GO.17.V) ?X_N))
		(?X_A (?X_J (GIVE.V ?X_M ?X_I)))
		(?X_G (NOT (?X_M (DO.V ?X_H))))
		(?X_C (?X_E (MISS.V ?X_D)))
	)
)



; "Mary is an artist."
; "She paints pictures for people."
; "One day Mary painted a picture."
; "It was very good."
; "People loved it."
; "Mary sold many paintings."
(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA.PR ?X_G ?X_E ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_E MANY.A))
		(!R2 (?X_E (PLUR PAINTING.N)))
		(!R3 (?X_L PICTURE.N))
		(!R4 (?X_L (VERY.ADV GOOD.A)))
		(!R5 (?X_F DAY.N))
		(!R6 (?X_G ARTIST.N))
		(!R7 (?X_H AGENT.N))
		(!R8 (?X_K (PLUR PERSON.N)))
		(!R9 (NOT (?X_L ACTION.N)))
		(!R10 (NOT (?X_L AGENT.N)))
	)
	(:STEPS
		(?X_A (?X_H (= ?X_G)))
		(?X_B ((ADV-E (DURING ?X_F)) (?X_H (PAINT.V ?X_L))))
		(?X_J (?X_K LOVE.1.V ?X_L))
		(?X_D (?X_H (SELL.V ?X_E)))
	)
)

; "Mary has been painting for years."
; "She loves art."
; "She sells some of her paintings."
; "She gets paid well."
(EPI-SCHEMA ((?X_I (LOVE.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR YEAR.N)))
		(!R2 (?X_J ART.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (NOT (?X_J ACTION.N)))
		(!R5 (NOT (?X_J AGENT.N)))
	)
	(:STEPS
		(?X_E
   (?X_I (HAS.AUX ((ADV-A (FOR.P (KA ((ADV-A (FOR.P ?X_F)) PAINT.V)))) BE.V))))
		(?X_H (?X_I LOVE.2.V ?X_J))
		(?X_C (?X_I (SELL.V ?X_A)))
	)
)

; "Tom likes art."
; "He has a collection of art."
; "He enjoys looking at art."
; "There's a lot of art in museums."
(EPI-SCHEMA ((?X_O
              (COMPOSITE-SCHEMA.PR ?X_D ?X_N ?X_J (IND (7 PERCEPTION_ACTIVE))))
             ** ?E)
	(:ROLES
		(!R1 (?X_D LOT.N))
		(!R2 (?X_D (OF.P ?X_E)))
		(!R3 (?X_N ART.N))
		(!R4 (?X_K ART.N))
		(!R5 (?X_J COLLECTION.N))
		(!R6 (?X_J (OF.P ?X_K)))
		(!R7 (NOT (?X_N ACTION.N)))
		(!R8 (NOT (?X_N AGENT.N)))
		(!R9 (?X_O AGENT.N))
		(!R10 ((IND (7 PERCEPTION_ACTIVE)) ACTION.N))
	)
	(:STEPS
		(?X_G (?X_O LIKE.3.V ?X_N))
		(?X_I (?X_O HAVE.4.V ?X_J))
		(?X_M (?X_O ENJOY.5.V (IND (7 PERCEPTION_ACTIVE))))
		(?X_C (?X_A (BE.V ?X_D)))
	)
)

; "Mary did some art work."
; "She worked hard on it."
; "She showed it to her friends."
; "They liked what she did."
(EPI-SCHEMA ((?X_I (DO.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_H (PLUR FRIEND.N)))
		(!R2 (?X_G ART.N))
		(!R3 (?X_G WORK.N))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_H (PERTAIN-TO ?X_I)))
	)
	(:STEPS
		(?X_F (?X_I (DO.V ?X_G)))
		(?X_D (?X_I (HARD.ADV ((ADV-A (ON.P ?X_G)) WORK.V))))
		(?X_B (?X_I (((ADV-A (TO.P ?X_H)) SHOW.V) ?X_G)))
		(?X_K (?X_H LIKE.6.V (ANS-TO (?X_I (DO.V ?X_A)))))
	)
)

; "Tom loves music."
; "He has a guitar."
; "He plays songs on his guitar."
(EPI-SCHEMA ((?X_J (LOVE.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR SONG.N)))
		(!R2 (?X_I MUSIC.N))
		(!R3 (?X_H GUITAR.N))
		(!R4 (?X_I OBJECT.N))
		(!R5 (NOT (?X_I ACTION.N)))
		(!R6 (NOT (?X_I AGENT.N)))
		(!R7 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_E (?X_J LOVE.7.V ?X_I))
		(?X_G (?X_J HAVE.8.V ?X_H))
		(?X_B (?X_J (PLAY.V ?X_C)))
	)
)

; "Mary is an artist."
; "She paints pictures for people."
; "One day she painted a picture."
; "It was very good."
; "People liked it."
; "Mary sold many paintings."
(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA.PR ?X_I ?X_C ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_C MANY.A))
		(!R2 (?X_C (PLUR PAINTING.N)))
		(!R3 (?X_N PICTURE.N))
		(!R4 (?X_N (VERY.ADV GOOD.A)))
		(!R5 (?X_F DAY.N))
		(!R6 (?X_I ARTIST.N))
		(!R7 (?X_J AGENT.N))
		(!R8 (?X_M (PLUR PERSON.N)))
		(!R9 (NOT (?X_N ACTION.N)))
		(!R10 (NOT (?X_N AGENT.N)))
	)
	(:STEPS
		(?X_H (?X_J (= ?X_I)))
		(?X_E ((ADV-E ({DURING}.P ?X_F)) (?X_J (PAINT.V ?X_N))))
		(?X_L (?X_M LIKE.9.V ?X_N))
		(?X_B (?X_J (SELL.V ?X_C)))
	)
)

; "Mary's painting was shown in a gallery."
; "A lot of people came to see it."
; "Many people liked it."
; "Mary sold lots of paintings."
(EPI-SCHEMA ((?X_G ((ADV-A (INTO.P ?X_N)) COME.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR LOT.N)))
		(!R2 (?X_D (OF.P ?X_E)))
		(!R3 (?X_F AGENT.N))
		(!R4 (?X_N GALLERY.N))
		(!R5 (?X_O PAINTING.N))
		(!R6 (?X_O (PERTAIN-TO ?X_F)))
		(!R7 (?X_G (PLUR PERSON.N)))
		(!R8 (?X_M LOT.N))
		(!R9 (?X_M (OF.P ?X_G)))
		(!R10 (?X_L MANY.A))
		(!R11 (?X_L (PLUR PERSON.N)))
		(!R12 (?X_M AGENT.N))
		(!R13 (?X_N DESTINATION.N))
		(!R14 (NOT (?X_O ACTION.N)))
		(!R15 (NOT (?X_O AGENT.N)))
	)
	(:STEPS
		(?X_A (?X_O (IN.P ?X_N)))
		(?X_I (?X_M ((ADV-A (FROM.P ?L1)) COME.10.V) ?X_N))
		(?X_K (?X_L LIKE.11.V ?X_O))
		(?X_C (?X_F (SELL.V ?X_D)))
	)
)



; "The man's wife died."
; "When he came back from the funeral,"
; "he found his house empty."
; "He knew something bad must have happened."
(EPI-SCHEMA ((?X_C (FIND.V (KE (?X_D EMPTY.A)))) ** ?E)
	(:ROLES
		(!R1 (?X_C WIFE.N))
		(!R2 (?X_E MAN.N))
		(!R3 (?X_C (PERTAIN-TO ?X_E)))
		(!R4 (?X_D HOUSE.N))
		(!R5 (?X_D (PERTAIN-TO ?X_E)))
	)
	(:STEPS
		(?X_A (?X_C DIE.V))
		(?X_B (?X_E (FIND.V (KE (?X_D EMPTY.A)))))
	)
)

; "Tommy saw a dead body on TV."
; "The police were looking for the killer."
; "Tommy thought that someone should tell them who killed the person."
(EPI-SCHEMA ((?X_G ((ADV-A (FOR.P ?X_D)) LOOK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C DEAD.A))
		(!R2 (?X_C BODY.N))
		(!R3 (?X_H (PLUR POLICE.N)))
		(!R4 (?X_D KILLER.N))
		(!R5 (?X_G AGENT.N))
		(!R6 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_B (?X_G SEE.1.V ?X_C))
		(?X_F (?X_H ((ADV-A (FOR.P ?X_D)) LOOK.2.V)))
	)
)

; "Alice buried her mother."
; "She cried for a while."
; "Then she stopped crying."
; "She felt sad."
(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA.PR ?X_G ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D SAD.A))
		(!R2 (?X_G MOTHER.N))
		(!R3 (?X_G (PERTAIN-TO ?X_J)))
		(!R4 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_A (?X_J (BURY.V ?X_G)))
		(?X_I (?X_J CRY.3.V))
		(?X_F (?X_J (THEN.ADV ((ADV-A (FOR.P (KA CRY.V))) STOP.V))))
		(?X_C (?X_J (FEEL.V ?X_D)))
	)
)

; "A woman died."
; "Her husband cried."
; "His friends were sad."
; "He buried her."
(EPI-SCHEMA ((?X_E DIE.V) ** ?E)
	(:ROLES
		(!R1 (?X_I HUSBAND.N))
		(!R2 (?X_E WOMAN.N))
		(!R3 (?X_I (PERTAIN-TO ?X_E)))
		(!R4 (?X_H (PLUR FRIEND.N)))
		(!R5 (?X_H SAD.A))
		(!R6 (?X_H (PERTAIN-TO ?X_I)))
	)
	(:STEPS
		(?X_D (?X_E DIE.V))
		(?X_G (?X_I CRY.4.V))
		(?X_B (?X_I (BURY.V ?X_E)))
	)
)

; "Alan saw a dead person."
; "A man died in front of him."
; "His wife died."
; "He cried for a long time."
(EPI-SCHEMA ((?X_I (CRY.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_E WIFE.N))
		(!R2 (?X_E (PERTAIN-TO ?X_L)))
		(!R3 (?X_F MAN.N))
		(!R4 (?X_I DEAD.A))
		(!R5 (?X_I PERSON.N))
		(!R6 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_B (?X_E DIE.V))
		(?X_H (?X_L SEE.5.V ?X_I))
		(?X_D (?X_F ((ADV-A (IN_FRONT_OF.P ?X_L)) DIE.V)))
		(?X_K (?X_L CRY.6.V))
	)
)

; "Alice was sad because she lost her dog."
; "She cried for a while."
; "Then she stopped crying."
; "She felt better."
; "She decided not to cry anymore."
(EPI-SCHEMA ((?X_D CRY.V) ** ?E)
	(:ROLES
		(!R1 (?X_D BETTER.A))
		(!R2 (?X_G (BECAUSE.P (KE (?X_L (LOSE.V ?X_K))))))
		(!R3 (?X_H SAD.A))
		(!R4 (?X_K DOG.N))
		(!R5 (?X_K (PERTAIN-TO ?X_L)))
		(!R6 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_A (?X_L (BE.V ?X_H ?X_G)))
		(?X_J (?X_L CRY.7.V))
		(?X_F (?X_L (THEN.ADV ((ADV-A (FOR.P (KA CRY.V))) STOP.V))))
		(?X_C (?X_L (FEEL.V ?X_D)))
	)
)

; "Tom's mother died."
; "His father cried for a week."
; "His brother cried for two days."
(EPI-SCHEMA ((?X_A DIE.V) ** ?E)
	(:ROLES
		(!R1 (?X_A MOTHER.N))
		(!R2 (?X_A (PERTAIN-TO ?X_B)))
	)
	(:STEPS
		(?X_D (?X_A DIE.V))
	)
)

; "Joey is dead."
; "His parents were sad."
; "They cried all night."
(EPI-SCHEMA ((?X_C ((ADV-A (IN.P ?X_C)) CRY_OUT.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR PARENT.N)))
		(!R2 (?X_C SAD.A))
		(!R3 (?X_D DEAD.A))
		(!R4 (?X_D AGENT.N))
		(!R5 (?X_C (PERTAIN-TO ?X_D)))
		(!R6 (?N NOISE.N))
	)
	(:STEPS
		(?X_B (?X_C CRY.9.V ?N))
	)
)

; "Kathy was sad."
; "She lost her mother."
; "She cried all night."
; "She missed her mommy."
(EPI-SCHEMA ((?X_F CRY.V) ** ?E)
	(:ROLES
		(!R1 (?X_C MOTHER.N))
		(!R2 (?X_C MOMMY.N))
		(!R3 (?X_F SAD.A))
		(!R4 (?X_C (PERTAIN-TO ?X_F)))
		(!R5 (?X_F AGENT.N))
	)
	(:STEPS
		(?X_A (?X_F (LOSE.V ?X_C)))
		(?X_E (?X_F CRY.10.V))
		(?X_B (?X_F (MISS.V ?X_C)))
	)
)

; "There was a young boy who lived with his parents."
; "One night they locked him inside their room."
; "He cried and cried."
; "Finally he gave up."
(EPI-SCHEMA ((?X_P CRY.V) ** ?E)
	(:ROLES
		(!R1 (?X_P YOUNG.A))
		(!R2 (?X_E ?X_F BOY.N))
		(!R3 (?X_I NIGHT.N))
		(!R4 (?X_K AGENT.N))
		(!R5 (?X_J ROOM.N))
		(!R6 (?X_J (PERTAIN-TO ?X_K)))
		(!R7 (?X_L YOUNG.A))
		(!R8 (?X_M AGENT.N))
		(!R9 (?X_M YOUNG.A))
		(!R10 (?X_P AGENT.N))
	)
	(:STEPS
		(?X_H (?X_A (BE.V ?X_E)))
		(?X_B
   ((ADV-E ({DURING}.P ?X_I)) (?X_K (((ADV-A (INSIDE.P ?X_J)) LOCK.V) ?X_L))))
		(?X_C (?X_P CRY.11.V))
		(?X_D (?X_P CRY.V))
		(?X_O (?X_M (FINALLY.ADV GIVE_UP.V)))
	)
)

; "Tom's dad came home from work."
; "His mom asked Tom if he was hungry."
; "Tom said yes."
; "His dad put food on the table."
; "Tom ate some food."
(EPI-SCHEMA ((?X_K (((ADV-A (FROM.P ?X_I)) COME.V) ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_F MOM.N))
		(!R2 (?X_F (PERTAIN-TO ?X_O)))
		(!R3 (?X_I WORK.N))
		(!R4 (?X_J HOME.N))
		(!R5 (?X_K DAD.N))
		(!R6 (?X_J (PERTAIN-TO ?X_K)))
		(!R7 (?X_K (PERTAIN-TO ?X_O)))
		(!R8 (?X_N TABLE.N))
		(!R9 (?X_N LOCATION.N))
		(!R10 (?X_O AGENT.N))
		(!R11 (?X_P FOOD.N))
	)
	(:STEPS
		(?X_H (?X_K ((ADV-A (TO.P ?X_J)) ((ADV-A (FROM.P ?X_I)) COME.V))))
		(?X_B (?X_F (KA ASK.V) ?X_O (IF.P (KE (?X_O HUNGRY.A)))))
		(?X_E (?X_O (SAY.V ?X_A)))
		(?X_C (?X_K PUT.12.V ?X_P ?X_N))
		(?X_M (?X_O EAT.13.V ?X_P))
	)
)

; "Tommy woke up early one morning."
; "His mother wasn't there."
; "He was alone in bed."
; "He started to cry."
(EPI-SCHEMA ((?X_F (ALONE.ADV ((ADV-A (IN.P ?X_B)) CRY.V))) ** ?E)
	(:ROLES
		(!R1 (?X_E MOTHER.N))
		(!R2 (?X_B BED.N))
		(!R3 (?X_F AGENT.N))
		(!R4 (?X_E (PERTAIN-TO ?X_F)))
	)
	(:STEPS
		(?X_A (NOT (?X_E (THERE.ADV BE.V))))
		(?X_D (?X_F (ALONE.ADV ((ADV-A (IN.P ?X_B)) BE.V))))
		(?X_H (?X_F ((ADV-A (FOR.P (KA CRY.V))) START.V)))
	)
)

; "Tommy's parents were divorced."
; "His mother moved away from town."
; "Tommy stayed with his father."
; "Tommy knew all the kids on his street."
(EPI-SCHEMA ((?X_G ((ADV-A (FROM.P ?X_F)) (AWAY.ADV MOVE.V))) ** ?E)
	(:ROLES
		(!R1 (?X_E MOTHER.N))
		(!R2 (?X_C TOWN.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_D (PERTAIN-TO ?X_G)))
		(!R5 (?X_E (PERTAIN-TO ?X_G)))
		(!R6 (?X_F FATHER.N))
		(!R7 (?X_F (PERTAIN-TO ?X_G)))
	)
	(:STEPS
		(?X_A (?X_E ((ADV-A (FROM.P ?X_C)) (AWAY.ADV MOVE.V))))
		(?X_B (?X_G ((ADV-A (WITH.P ?X_F)) STAY.V)))
	)
)

; "Tom's father is an engineer."
; "His mother is a teacher."
; "Their house has two bedrooms."
; "Tom lives there with them."
; "Tom likes his family."
(EPI-SCHEMA ((?X_L ((ADV-A (WITH.P ?X_K)) LIVE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C HOUSE.N))
		(!R2 (?X_C (PERTAIN-TO ?X_D)))
		(!R3 (?X_G ENGINEER.N))
		(!R4 (?X_K FATHER.N))
		(!R5 (?X_J MOTHER.N))
		(!R6 (?X_J TEACHER.N))
		(!R7 (?X_K (PERTAIN-TO ?X_L)))
		(!R8 (?X_J (PERTAIN-TO ?X_L)))
		(!R9 (?X_M FAMILY.N))
		(!R10 (?X_M (PERTAIN-TO ?X_L)))
		(!R11 (?X_K LOCATION.N))
		(!R12 (?X_L AGENT.N))
		(!R13 (?X_M OBJECT.N))
		(!R14 (NOT (?X_M ACTION.N)))
		(!R15 (NOT (?X_M AGENT.N)))
	)
	(:STEPS
		(?X_F (?X_K (= ?X_G)))
		(?X_A (?X_C (HAVE.V (TWO.D (PLUR BEDROOM.N)))))
		(?X_I (?X_L LIVE.14.V ?X_K))
		(?X_B (?X_L LIKE.15.V ?X_M))
	)
)

; "A child cries."
; "A baby cries."
; "A dog cries."
; "Cats cry."
; "A cat cries."
; "A puppy cries."
; "An adult cries."
; "A grownup cries."
; "A teenager cries."
; "A teen-ager cries."
; "A kid cries."
; "A little kid cries."
; "A toddler cries."
; "A two year old cries."
; "A three year old cries."
; "A four year old cries."
; "A five year old cries."
; "A six year old cries."
; "A seven year old cries."
; "An eight year old"
(EPI-SCHEMA ((?X_ZS CRY.V) ** ?E)
	(:ROLES
		(!R1 (?X_U TODDLER.N))
		(!R2 (?X_X LITTLE.A))
		(!R3 (?X_X KID.N))
		(!R4 (?X_ZA KID.N))
		(!R5 (?X_ZD TEEN-AGER.N))
		(!R6 (?X_ZG CHILD.N))
		(!R7 (?X_ZJ BABY.N))
		(!R8 (?X_ZM DOG.N))
		(!R9 (?X_ZP CAT.N))
		(!R10 (?X_ZS PUPPY.N))
		(!R11 (?X_ZV ADULT.N))
		(!R12 (?X_ZZA GROWNUP.N))
		(!R13 (?X_ZZB TEENAGER.N))
		(!R14 (?X_ZZA AGENT.N))
		(!R15 (?X_ZZB AGENT.N))
		(!R16 (?N NOISE.N))
	)
	(:STEPS
		(?X_ZF (?X_ZG CRY.16.V ?N))
		(?X_ZI (?X_ZJ CRY.17.V ?N))
		(?X_ZL (?X_ZM CRY.18.V ?N))
		(?X_ZO (?X_ZP CRY.19.V ?N))
		(?X_ZR (?X_ZS CRY.20.V ?N))
		(?X_ZU (?X_ZV CRY.21.V ?N))
		(?X_ZX (?X_ZZA CRY.22.V ?N))
		(?X_ZZ (?X_ZZB CRY.23.V ?N))
		(?X_ZC (?X_ZD CRY.V))
		(?X_Z (?X_ZA CRY.V))
		(?X_W (?X_X CRY.V))
		(?X_T (?X_U CRY.V))
		(?X_R (?X_A CRY.V))
		(?X_P (?X_B CRY.V))
		(?X_N (?X_C CRY.V))
		(?X_L (?X_D CRY.V))
		(?X_J (?X_E CRY.V))
		(?X_H (?X_F CRY.V))
	)
)

; "Tom cried."
; "He was sad."
; "His friends were laughing."
; "He felt better after talking to them."
(EPI-SCHEMA ((?X_H CRY.V) ** ?E)
	(:ROLES
		(!R1 (?X_D ((ADV-A (AFTER.P (KA ((ADV-A (TO.P ?X_G)) TALK.V)))) BETTER.A)))
		(!R2 (?X_H SAD.A))
		(!R3 (?X_G (PLUR FRIEND.N)))
		(!R4 (?X_G (PERTAIN-TO ?X_H)))
		(!R5 (?X_H AGENT.N))
		(!R6 (?N NOISE.N))
	)
	(:STEPS
		(?X_F (?X_H CRY.24.V))
		(?X_A (?X_G LAUGH.25.V ?N))
		(?X_C (?X_H (FEEL.V ?X_D)))
	)
)

; "Tommy's mom put Tommy into a room."
; "Tommy couldn't go outside."
; "Tommy was sad because he couldn't play outside."
; "Tommy felt bad that he couldn't play outside."
(EPI-SCHEMA ((?X_E (IN.P ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_D MOM.N))
		(!R2 (?X_A ROOM.N))
		(!R3 (?X_E AGENT.N))
		(!R4 (?X_D (PERTAIN-TO ?X_E)))
	)
	(:STEPS
		(?X_C (?X_D (((ADV-A (INTO.P ?X_A)) PUT.V) ?X_E)))
		(E465.SK (NOT (?X_E (CAN.MD (OUTSIDE.ADV GO.V)))))
	)
)



; "My sister had a baby boy."
; "She named him James."
; "James likes to play with toys."
; "He loves to eat food."
; "He sleeps well at night."
(EPI-SCHEMA ((?X_J (LIKE.V (KA (EAT.V ?X_N)))) ** ?E)
	(:ROLES
		(!R1 (?X_E NIGHT.N))
		(!R2 (?X_H AGENT.N))
		(!R3 (?X_I BABY.N))
		(!R4 (?X_I BOY.N))
		(!R5 (?X_J SISTER.N))
		(!R6 (?X_J (PERTAIN-TO ?X_O)))
		(!R7 (?X_M (PLUR TOY.N)))
		(!R8 ((KA ((ADV-A (WITH.P ?X_M)) PLAY.V)) ACTION.N))
		(!R9 ((KA (EAT.V ?X_N)) ACTION.N))
		(!R10 (?X_N FOOD.N))
		(!R11 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_A (?X_J (HAVE.V ?X_I)))
		(?X_G (?X_O (NAME.V ?X_I ?X_H)))
		(?X_B (?X_I LIKE.1.V (KA ((ADV-A (WITH.P ?X_M)) PLAY.V))))
		(?X_L (?X_I LOVE.2.V (KA (EAT.V ?X_N))))
		(?X_D (?X_I (WELL.ADV ((ADV-A (AT.P ?X_E)) SLEEP.V))))
		(?E_1 (?X_O EAT.3.V ?X_N))
	)
)

; "A baby is born."
; "A new baby comes into this world."
; "A baby grows up."
; "A baby gets older."
; "A baby has a birthday."
; "A baby learns things."
(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA.PR ?X_K ?X_G ?X_C ?X_S)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR THING.N)))
		(!R2 (?X_D BABY.N))
		(!R3 (?X_G BIRTHDAY.N))
		(!R4 (?X_H BABY.N))
		(!R5 (?X_K OLDER.A))
		(!R6 (?X_L BABY.N))
		(!R7 (?X_O BABY.N))
		(!R8 (?X_P NEW.A))
		(!R9 (?X_P BABY.N))
		(!R10 (?X_S WORLD.N))
		(!R11 (?X_S DESTINATION.N))
	)
	(:STEPS
		(?X_R (?X_P ((ADV-A (FROM.P ?L1)) COME.4.V) ?X_S))
		(?X_N (?X_O GROW_UP.V))
		(?X_J (?X_L (GET.V ?X_K)))
		(?X_F (?X_H (HAVE.V ?X_G)))
		(?X_B (?X_D (LEARN.V ?X_C)))
	)
)

; "Mary has a son."
; "His name is James."
; "James is three years old."
; "He plays with toys."
; "He eats food."
; "He sleeps well at night."
(EPI-SCHEMA ((?X_G (HAVE.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D NIGHT.N))
		(!R2 (?X_G AGENT.N))
		(!R3 (?X_J NAME.N))
		(!R4 (?X_K SON.N))
		(!R5 (?X_J (PERTAIN-TO ?X_K)))
		(!R6 (?X_L AGENT.N))
		(!R7 (?Y ENTITY.N))
		(!R8 (?X_Q FOOD.N))
	)
	(:STEPS
		(?X_I (?X_L (HAVE.V ?X_K)))
		(?X_A (?X_J (= ?X_G)))
		(?X_F (?X_K (BE.V (KE ((THREE.D (PLUR YEAR.N)) OLD.A)))))
		(?X_N (?X_K PLAY.5.V ?Y))
		(?X_P (?X_K EAT.6.V ?X_Q))
		(?X_C (?X_K (WELL.ADV ((ADV-A (AT.P ?X_D)) SLEEP.V))))
	)
)

; "Sarah is a mommy."
; "She has two boys."
; "Their names are James and John."
; "John loves to eat food."
; "James likes to play with toys."
; "James eats lots of food."
(EPI-SCHEMA ((?X_M (LOVE.V (KA (EAT.V ?X_J)))) ** ?E)
	(:ROLES
		(!R1 (?X_B (PLUR NAME.N)))
		(!R2 (?X_B (PERTAIN-TO ?X_C)))
		(!R3 (?X_O MOMMY.N))
		(!R4 (?X_P (PLUR TOY.N)))
		(!R5 (?X_J FOOD.N))
		(!R6 (?X_Q (PLUR LOT.N)))
		(!R7 (?X_Q (OF.P ?X_J)))
		(!R8 (?X_M AGENT.N))
		(!R9 ((KA (EAT.V ?X_N)) ACTION.N))
		(!R10 (?X_N FOOD.N))
		(!R11 (?X_O AGENT.N))
		(!R12 ((KA ((ADV-A (WITH.P ?X_P)) PLAY.V)) ACTION.N))
		(!R13 (?X_Q FOOD.N))
		(!R14 (?X_R AGENT.N))
	)
	(:STEPS
		(?X_E (?X_O (HAVE.V (TWO.D (PLUR BOY.N)))))
		(?X_A (?X_B (BE.V (SET-OF ?X_R ?X_M))))
		(?X_G (?X_M LOVE.7.V (KA (EAT.V ?X_N))))
		(?E_1 (?X_O EAT.3.V ?X_N))
		(?X_I (?X_R LIKE.8.V (KA ((ADV-A (WITH.P ?X_P)) PLAY.V))))
		(?X_L (?X_R EAT.6.V ?X_Q))
	)
)

; "Mary's baby was born."
; "Mary had twins."
; "Mary gave birth to two boys."
; "Mary was happy."
(EPI-SCHEMA ((?X_E (HAVE.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A AGENT.N))
		(!R2 (?X_E AGENT.N))
		(!R3 (?X_E HAPPY.A))
		(!R4 (?X_D (PERTAIN-TO ?X_E)))
		(!R5 (?X_F BIRTH.N))
	)
	(:STEPS
		(?X_C (?X_E (HAVE.V ?X_A)))
		(?X_H (?X_E (((ADV-A (TO.P (TWO.D (PLUR BOY.N)))) GIVE.V) ?X_F)))
	)
)

; "Mary gave birth to a girl."
; "She called her Mary."
; "She said that she was glad to have a daughter."
; "Mary's parents were happy."
(EPI-SCHEMA ((?X_G (GIVE.V ?X_G ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_F BIRTH.N))
		(!R2 (?X_H (PERTAIN-TO ?X_H)))
		(!R3 (?X_G HAPPY.A))
		(!R4 (?X_G (PLUR PARENT.N)))
		(!R5 (?X_G (PERTAIN-TO ?X_H)))
		(!R6 (?X_H AGENT.N))
		(!R7 (?X_I OBJECT.N))
	)
	(:STEPS
		(?X_E (?X_H (((ADV-A (TO.P ?X_I)) GIVE.V) ?X_F)))
		(?X_A (?X_H (CALL.V ?X_H)))
		(?X_C (?X_H (SAY.V (THAT (?X_H (GLAD.A (KA (HAVE.V ?X_I))))))))
		(?E_1 (?X_H HAVE.9.V ?X_I))
	)
)

; "There are two kinds of people in this world."
; "Those who make things happen and those who don't."
; "The man made things happen."
; "The man was successful."
(EPI-SCHEMA ((?X_C (MAKE.V (KE (?X_H HAPPEN.V)))) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR PERSON.N)))
		(!R2 (?X_C (IN.P ?X_D)))
		(!R3 (?X_G MAN.N))
		(!R4 (?X_H (PLUR THING.N)))
	)
	(:STEPS
		(?X_F (?X_A (BE.V (TWO.D (L X (AND (X (PLUR KIND.N)) (X (OF.P ?X_C))))))))
		(?X_J (?X_G (MAKE.V (KE (?X_H HAPPEN.V)))))
	)
)

; "Tom was a good salesman."
; "He sold many cars."
; "His customers were happy."
; "He sold a lot of cars that year."
(EPI-SCHEMA ((?X_D (((ADV-A (IN.P ?X_D)) SELL.V) ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A MANY.A))
		(!R2 (?X_A (PLUR CAR.N)))
		(!R3 (?X_D YEAR.N))
		(!R4 (?X_F GOOD.A))
		(!R5 (?X_F SALESMAN.N))
		(!R6 (?X_E (PERTAIN-TO ?X_F)))
		(!R7 (?X_G LOT.N))
		(!R8 (?X_G (OF.P ?X_H)))
	)
	(:STEPS
		(?X_C (?X_F (SELL.V ?X_A)))
		(?X_J ((ADV-E ({DURING}.P ?X_D)) (?X_F (SELL.V ?X_G))))
	)
)

; "John was a businessman."
; "He owned a company."
; "His company made things."
; "His company sold many products."
(EPI-SCHEMA ((?X_H (OWN.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C MANY.A))
		(!R2 (?X_C (PLUR PRODUCT.N)))
		(!R3 (?X_D (PLUR THING.N)))
		(!R4 (?X_H COMPANY.N))
		(!R5 (?X_G BUSINESSMAN.N))
		(!R6 (?X_H (PERTAIN-TO ?X_G)))
		(!R7 (?X_H OBJECT.N))
	)
	(:STEPS
		(?X_F (?X_G OWN.10.V ?X_H))
		(?X_A (?X_H (MAKE.V ?X_D)))
		(?X_B (?X_H (SELL.V ?X_C)))
	)
)

; "Tom's father was successful."
; "Tom's mother was not."
; "Tom's father is better than Tom's mother."
; "Tom's father is smarter than Tom's mother."
; "Tom's father is taller than Tom's mother."
; "Tom's father has a bigger house than Tom's mother."
; "Tom's father has more money than Tom's mother."
; "Tom's father can do many things that Tom's mother cannot."
; "Tom's father drives an expensive car."
; "Tom's father wears nice clothes."
; "Tom's father plays golf."
; "Tom's father is a doctor"
(EPI-SCHEMA ((?X_Q (HAVE.V ?X_Q)) ** ?E)
	(:ROLES
		(!R1 (?X_F GOLF.N))
		(!R2 (?X_I (PLUR CLOTHE.N)))
		(!R3 (?X_I NICE.A))
		(!R4 (?X_L CAR.N))
		(!R5 (?X_L EXPENSIVE.A))
		(!R6 (?X_W (PERTAIN-TO ?X_W)))
		(!R7 (?X_W FATHER.N))
		(!R8 (?X_O ?X_P (PLUR THING.N)))
		(!R9 (?X_Q SUCCESSFUL.A))
		(!R10 (?X_Q BETTER.A))
		(!R11 (?X_Q TALLER.A))
		(!R12 (?X_Q FATHER.N))
		(!R13 (?X_Q (PERTAIN-TO ?X_W)))
		(!R14 (?X_ZA MOTHER.N))
		(!R15 (?X_ZA (PERTAIN-TO ?X_W)))
		(!R16 (?X_ZB MORE.A))
		(!R17 (?X_V DOCTOR.N))
		(!R18 (?X_V FATHER.N))
		(!R19 (?X_V (PERTAIN-TO ?X_W)))
		(!R20 (?X_ZC (THAN.P ?X_ZA)))
		(!R21 (?X_X BIGGER.A))
		(!R22 (?X_ZC ?X_X HOUSE.N))
		(!R23 (?X_ZD (THAN.P ?X_ZA)))
		(!R24 (?X_ZD ?X_ZB MONEY.N))
		(!R25 (?X_ZC OBJECT.N))
		(!R26 (?X_ZD OBJECT.N))
	)
	(:STEPS
		(?X_S (NOT (?X_ZA BE.V)))
		(?X_A (?X_Q (THAN.P ?X_ZA)))
		(?X_B (?X_Q =))
		(?X_C (?X_Q (THAN.P ?X_ZA)))
		(?X_U (?X_Q HAVE.11.V ?X_ZC))
		(?X_Z (?X_Q HAVE.12.V ?X_ZD))
		(?X_N (?X_Q ((CAN.AUX DO.V) ?X_O)))
		(?X_K (?X_W (DRIVE.V ?X_L)))
		(?X_H (?X_W (WEAR.V ?X_I)))
		(?X_E (?X_W (PLAY.V ?X_F)))
	)
)

; "Tom was a good cook."
; "His food was delicious."
; "He had many friends."
; "Tom liked to eat good food."
(EPI-SCHEMA ((?X_F (LIKE.V (KA (EAT.V ?X_E)))) ** ?E)
	(:ROLES
		(!R1 (?X_G MANY.A))
		(!R2 (?X_G (PLUR FRIEND.N)))
		(!R3 (?X_E FOOD.N))
		(!R4 (?X_E DELICIOUS.A))
		(!R5 (?X_H GOOD.A))
		(!R6 (?X_F GOOD.A))
		(!R7 (?X_F COOK.N))
		(!R8 (?X_E (PERTAIN-TO ?X_F)))
		(!R9 (?X_G OBJECT.N))
		(!R10 ((KA (EAT.V ?X_H)) ACTION.N))
		(!R11 (?X_H FOOD.N))
	)
	(:STEPS
		(?X_B (?X_F HAVE.13.V ?X_G))
		(?X_D (?X_F LIKE.14.V (KA (EAT.V ?X_H))))
		(?E_1 (?X_F EAT.3.V ?X_H))
	)
)

; "The woman saw Tom play baseball."
; "She liked him."
; "She asked him if she could meet him after school."
(EPI-SCHEMA ((?X_K
              (LIKE.V
               (TWO.D (L X (AND (X (PLUR PERSON.N)) (X (PLAY.V ?X_J)))))))
             ** ?E)
	(:ROLES
		(!R1 (?X_D SCHOOL.N))
		(!R2 (?X_E WOMAN.N))
		(!R3 (?X_J BASEBALL.N))
		(!R4 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_G (?X_E SEE.15.V (KE (?X_K (PLAY.V ?X_J)))))
		(?E_1 (?X_K PLAY.16.V))
		(?X_I (?X_E LIKE.17.V (IND (2 ?X_A))))
		(?X_C
   (?X_E (KA ASK.V) ?X_K
    (IF.P (KE (?X_E (CAN.MD (((ADV-A (AFTER.P ?X_D)) MEET.V) ?X_K)))))))
	)
)

; "Helen tried to be successful."
; "She worked hard."
; "She studied hard."
; "She did well on tests."
; "Helen became a doctor."
(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA.PR (KA SUCCESSFUL.A) ?X_E ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_E HARD.A))
		(!R2 (?X_H (PLUR TEST.N)))
		(!R3 (?X_K AGENT.N))
		(!R4 (?X_L DOCTOR.N))
	)
	(:STEPS
		(?X_B (?X_K (TRY.V (KA SUCCESSFUL.A))))
		(?X_D (?X_K (HARD.ADV WORK.V)))
		(?X_G (?X_K (STUDY.V ?X_E)))
		(?X_J (?X_K (WELL.ADV ((ADV-A (ON.P ?X_H)) DO.V))))
		(?X_N (?X_K (BECOME.V ?X_L)))
	)
)



; "The dog ran away from its owner."
; "The police caught him."
; "The owner didn't want him anymore."
; "He gave him to the pound."
(EPI-SCHEMA ((?X_K ((ADV-A (FROM.P ?X_I)) (AWAY.ADV RUN.V))) ** ?E)
	(:ROLES
		(!R1 (?X_D POUND.N))
		(!R2 (?X_K OWNER.N))
		(!R3 (?X_I DOG.N))
		(!R4 (?X_K (PERTAIN-TO ?X_I)))
		(!R5 (?X_J POLICE.N))
		(!R6 (?X_K LOCATION.N))
		(!R7 (NOT (?X_K = ?L2)))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_I ((ADV-A (FROM.P ?X_K)) RUN.1.V) ?L2))
		(?X_H (?X_J (CATCH.V ?X_I)))
		(?X_F (NOT (?X_K ((ANYMORE.ADV WANT.V) ?X_I))))
		(?X_C (?X_K (((ADV-A (TO.P ?X_D)) GIVE.V) ?X_I)))
	)
)

; "Tommy's dog is brown."
; "His name is Spot."
; "Spot has four legs."
; "Spot can bark."
; "Spot likes to play."
(EPI-SCHEMA ((?X_G (BARK.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_G BROWN.A))
		(!R2 (?X_G DOG.N))
		(!R3 (?X_G SPOT.N))
		(!R4 (?X_E AGENT.N))
		(!R5 (?X_G (PERTAIN-TO ?X_E)))
		(!R6 (?X_F NAME.N))
		(!R7 (?X_F SPOT.A))
		(!R8 (?X_F (PERTAIN-TO ?X_G)))
		(!R9 ((FOUR.D (PLUR LEG.N)) NOISE.N))
		(!R10 ((KA PLAY.V) ACTION.N))
	)
	(:STEPS
		(?X_B (?X_G (HAVE.V (FOUR.D (PLUR LEG.N)))))
		(?X_D (?X_G BARK.2.V (FOUR.D (PLUR LEG.N))))
		(?X_I (?X_G LIKE.3.V (KA PLAY.V)))
	)
)

; "The dog ran away from its owner."
; "The police caught him."
; "The owner didn't want him anymore."
; "He gave him to the pound."
(EPI-SCHEMA ((?X_K ((ADV-A (FROM.P ?X_I)) (AWAY.ADV RUN.V))) ** ?E)
	(:ROLES
		(!R1 (?X_D POUND.N))
		(!R2 (?X_K OWNER.N))
		(!R3 (?X_I DOG.N))
		(!R4 (?X_K (PERTAIN-TO ?X_I)))
		(!R5 (?X_J POLICE.N))
		(!R6 (?X_K LOCATION.N))
		(!R7 (NOT (?X_K = ?L2)))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_I ((ADV-A (FROM.P ?X_K)) RUN.1.V) ?L2))
		(?X_H (?X_J (CATCH.V ?X_I)))
		(?X_F (NOT (?X_K ((ANYMORE.ADV WANT.V) ?X_I))))
		(?X_C (?X_K (((ADV-A (TO.P ?X_D)) GIVE.V) ?X_I)))
	)
)

; "A girl named Sue owned a dog."
; "Sue's dog ate some food."
; "Sue told the dog not to eat that food again."
(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA.PR ?X_C ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_C DOG.N))
		(!R2 (?X_D GIRL.N))
		(!R3 (?X_E FOOD.N))
		(!R4 (?X AGENT.N))
	)
	(:STEPS
		(?X_B (?X_D NAME.4.V ?X_C))
		(?E_1 (?X EAT.5.V ?X_E))
	)
)

; "Tommy's dog ran away."
; "Tommy called the pound."
; "The pound sent someone to catch the dog."
; "A policeman came to pick up the dog."
; "The dog was taken to the pound."
(EPI-SCHEMA ((?X_I (CALL.V ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_D PERSON.N))
		(!R2 (?X_N POUND.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_M DOG.N))
		(!R5 (?X_M (PERTAIN-TO ?X_I)))
		(!R6 (?X_J POLICEMAN.N))
		(!R7 (?X_M DESTINATION.N))
		(!R8 (?X_N SMALLER-THAN.N ?X))
		(!R9 (?X_N DESTINATION.N))
		(!R10 (?X AGENT.N))
	)
	(:STEPS
		(?X_H (?X_M RUN_AWAY.V))
		(?X_F (?X_I (CALL.V ?X_N)))
		(?X_C (?X_N (((ADV-A (FOR.P (KA (CATCH.V ?X_M)))) SEND.V) ?X_D)))
		(?X_L (?X_J ((ADV-A (FROM.P ?L1)) COME.6.V) ?X_M))
		(?X_A (?X_M (TO.P ?X_N)))
		(?E_1 (?X TAKE.7.V ?X_N ?X_N))
	)
)

; "Tom's mom said that Tom should watch out for the dog in the yard."
; "Tom saw the dog running around the yard."
; "He told his mom about the dog."
; "His mom said she would take care of it."
(EPI-SCHEMA ((?X_L (((ADV-A (ABOUT.P ?X_L)) TELL.V) ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_D CARE.N))
		(!R2 (?X_J DOG.N))
		(!R3 (?X_G MOM.N))
		(!R4 (?X_G AGENT.N))
		(!R5 (?X_G (PERTAIN-TO ?X_L)))
		(!R6 (?X_K YARD.N))
		(!R7 (?X_J (IN.P ?X_K)))
		(!R8 (?X_L AGENT.N))
		(!R9 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_F
   (?X_G (SAY.V (THAT (?X_L (SHOULD.MD ((ADV-A (FOR.P ?X_J)) WATCH_OUT.V)))))))
		(?X_I (?X_L SEE.8.V ?X_J))
		(?X_A (?X_J ((ADV-A (FROM.P ?L1)) RUN.9.V) ?L2))
		(?X_B (?X_L (((ADV-A (ABOUT.P ?X_J)) TELL.V) ?X_G)))
		(?X_C
   (?X_G (SAY.V (THT (?X_G (WILL.MD (((ADV-A (OF.P ?X_J)) TAKE.V) ?X_D)))))))
	)
)

; "Dan's dog is brown."
; "His dog has spots on his face."
; "His dog has curly fur."
; "He loves his dog."
(EPI-SCHEMA ((?X_D (LOVE.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR SPOT.N)))
		(!R2 (?X_E BROWN.A))
		(!R3 (?X_E (PERTAIN-TO ?X_E)))
		(!R4 (?X_E (KA HAS.V) (CURLY.ADV FUR.N)))
		(!R5 (?X_E DOG.N))
		(!R6 (?X_E (PERTAIN-TO ?X_D)))
		(!R7 (?X_D AGENT.N))
		(!R8 (NOT (?X_E ACTION.N)))
	)
	(:STEPS
		(?X_A (?X_E (HAVE.V ?X_C)))
		(?X_B (?X_D LOVE.10.V ?X_E))
	)
)

; "Tom's family had a dog named Spot."
; "Spot liked to play outside."
; "His family played with him all the time."
; "He chased balls."
; "He barked at strangers."
(EPI-SCHEMA ((?X_L (LIKE.V ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR STRANGER.N)))
		(!R2 (?X_N SPOT.N))
		(!R3 (?X_F DOG.N))
		(!R4 (?X_F ((PASV NAME.V) ?X_N)))
		(!R5 (?X_K FAMILY.N))
		(!R6 (?X_K (PERTAIN-TO ?X_N)))
		(!R7 (?X_L AGENT.N))
		(!R8 (?X_K (PERTAIN-TO ?X_L)))
		(!R9 (?X_M (PLUR BALL.N)))
		(!R10 ((KA (OUTSIDE.ADV PLAY.V)) ACTION.N))
		(!R11 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_E (?X_K (HAVE.V ?X_F)))
		(?X_H (?X_N LIKE.11.V (KA (OUTSIDE.ADV PLAY.V))))
		(?X_J (?X_N CHASE.12.V ?X_M))
		(?X_B (?X_N ((ADV-A (AT.P ?X_C)) BARK.V)))
	)
)

; "Molly's dog ran away."
; "The police found him."
; "He was taken to the pound."
; "He was put down."
(EPI-SCHEMA ((?X_F (FIND.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_H POUND.N))
		(!R2 (?X_I DOG.N))
		(!R3 (?X_G POLICE.N))
		(!R4 (?X_F AGENT.N))
		(!R5 (?X_I (PERTAIN-TO ?X_F)))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?X_G AGENT.N))
		(!R8 (?X_H DESTINATION.N))
		(!R9 (?X_I SMALLER-THAN.N ?X))
		(!R10 (?X AGENT.N))
	)
	(:STEPS
		(?X_C (?X_I ((ADV-A (FROM.P ?L1)) RUN_AWAY.13.V) ?L2))
		(?X_E (?X_G FIND.14.V ?X_I))
		(?X_A (?X_I (TO.P ?X_H)))
		(?E_1 (?X TAKE.15.V ?X_I ?X_H))
	)
)

; "The dog's owner gave him to the pound."
; "The pound sent him to a shelter."
; "A woman adopted him."
; "She called him Rover."
; "Rover liked to play."
(EPI-SCHEMA ((?X_C (GIVE.V ?X_C ?X_O)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_D WOMAN.N))
		(!R3 (?X_N DOG.N))
		(!R4 (?X_P POUND.N))
		(!R5 (?X_G OWNER.N))
		(!R6 (?X_G (PERTAIN-TO ?X_N)))
		(!R7 (?X_O SHELTER.N))
		(!R8 (?X_N SMALLER-THAN.N ?X_P))
		(!R9 (?X_O DESTINATION.N))
		(!R10 (?X_P AGENT.N))
		(!R11 ((KA PLAY.V) ACTION.N))
	)
	(:STEPS
		(?X_F (?X_G (((ADV-A (TO.P ?X_P)) GIVE.V) ?X_N)))
		(?X_I (?X_P SEND.16.V ?X_N ?X_O))
		(?X_K (?X_D ADOPT.17.V ?X_N))
		(?X_B (?X_D (CALL.V ?X_N ?X_C)))
		(?X_M (?X_N LIKE.18.V (KA PLAY.V)))
	)
)

; "A pound is a weight unit."
; "A pound is equal to 0.45359237 kilograms."
; "There are 16 ounces in one pound."
; "A kilogram equals 2.20462262 pounds."
(EPI-SCHEMA ((?X_D (TO.P (|2.D| (PLUR POUND.N)))) ** ?E)
	(:ROLES
		(!R1 (?X_D WEIGHT.N))
		(!R2 (?X_D EQUAL.A))
		(!R3 (?X_D POUND.N))
		(!R4 (?X_G KILOGRAM.N))
	)
	(:STEPS
		(?X_C (?X_D (TO.P (|0.45359237.D| (PLUR KILOGRAM.N)))))
		(?X_F
   (?X_A
    (BE.V (|16.D| (L X (AND (X (PLUR OUNCE.N)) (X (IN.P (ONE.D POUND.N)))))))))
		(?X_I (?X_G (EQUAL.V (|2.20462262.D| (PLUR POUND.N)))))
	)
)

; "My parents told me not to do this."
; "They said it would be dangerous."
; "I did it anyway."
; "I climbed up on top of the roof."
; "I thought I could fly."
(EPI-SCHEMA ((?X_D ((ADV-A (ON_TOP_OF.P ?X_H)) CLIMB_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR PARENT.N)))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_C (PERTAIN-TO ?X_D)))
		(!R4 (?X_E {REF}.N))
		(!R5 (?X_H ROOF.N))
		(!R6 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_B (?X_C (SAY.V (THT (?X_E (WILL.MD DANGEROUS.A))))))
		(?X_G (?X_D (DO.V ?X_E)))
		(?X_J (?X_K ((ADV-A (ON_TOP_OF.P ?X_H)) CLIMB_UP.V)))
		(?X_M (?X_K (THINK.V (THT (?X_K (CAN.MD FLY.V))))))
	)
)

; "Tom climbed a tree."
; "Tom climbed a wall."
; "Tom climbed a rope."
; "Tom climbed a mountain."
; "Tom climbed a ladder."
; "Tom climbed a fence."
; "Tom climbed a hill."
; "Tom climbed an elevator."
; "Tom climbed a building."
; "Tom climbed a bridge."
; "Tom climbed a ship."
; "Tom climbed a boat."
; "Tom climbed a car."
; "Tom climbed a truck."
; "Tom climbed a train."
; "Tom climbed a plane."
; "Tom climbed a helicopter."
; "Tom climbed a balloon."
; "Tom climbed a dragon."
(EPI-SCHEMA ((?X_ZZE
              (COMPOSITE-SCHEMA.PR ?X_ZM ?X_ZN ?X_ZO ?X_ZP ?X_ZQ ?X_ZR ?X_ZS
               ?X_ZT ?X_ZU ?X_ZV ?X_ZW ?X_ZX ?X_ZY ?X_ZZ ?X_ZZA ?X_ZZB ?X_ZZC
               ?X_ZZD ?X_ZZF))
             ** ?E)
	(:ROLES
		(!R1 (?X_ZM TREE.N))
		(!R2 (?X_ZN WALL.N))
		(!R3 (?X_ZO ROPE.N))
		(!R4 (?X_ZP MOUNTAIN.N))
		(!R5 (?X_ZQ LADDER.N))
		(!R6 (?X_ZR FENCE.N))
		(!R7 (?X_ZS HILL.N))
		(!R8 (?X_ZT ELEVATOR.N))
		(!R9 (?X_ZU BUILDING.N))
		(!R10 (?X_ZV BRIDGE.N))
		(!R11 (?X_ZW SHIP.N))
		(!R12 (?X_ZX BOAT.N))
		(!R13 (?X_ZY CAR.N))
		(!R14 (?X_ZZ TRUCK.N))
		(!R15 (?X_ZZA TRAIN.N))
		(!R16 (?X_ZZB PLANE.N))
		(!R17 (?X_ZZC HELICOPTER.N))
		(!R18 (?X_ZZD BALLOON.N))
		(!R19 (?X_ZZF DRAGON.N))
		(!R20 (?X_ZM DESTINATION.N))
		(!R21 (?X_ZN DESTINATION.N))
		(!R22 (?X_ZO DESTINATION.N))
		(!R23 (?X_ZP DESTINATION.N))
		(!R24 (?X_ZQ DESTINATION.N))
		(!R25 (?X_ZR DESTINATION.N))
		(!R26 (?X_ZS DESTINATION.N))
		(!R27 (?X_ZT DESTINATION.N))
		(!R28 (?X_ZU DESTINATION.N))
		(!R29 (?X_ZV DESTINATION.N))
		(!R30 (?X_ZW DESTINATION.N))
		(!R31 (?X_ZX DESTINATION.N))
		(!R32 (?X_ZY DESTINATION.N))
		(!R33 (?X_ZZ DESTINATION.N))
		(!R34 (?X_ZZA DESTINATION.N))
		(!R35 (?X_ZZB DESTINATION.N))
		(!R36 (?X_ZZC DESTINATION.N))
		(!R37 (?X_ZZD DESTINATION.N))
		(!R38 (?X_ZZE AGENT.N))
		(!R39 (?X_ZZF DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZM))
		(?X_D (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZN))
		(?X_F (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZO))
		(?X_H (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZP))
		(?X_J (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZQ))
		(?X_L (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZR))
		(?X_N (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZS))
		(?X_P (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZT))
		(?X_R (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZU))
		(?X_T (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZV))
		(?X_V (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZW))
		(?X_X (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZX))
		(?X_Z (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZY))
		(?X_ZB (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZZ))
		(?X_ZD (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZZA))
		(?X_ZF (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZZB))
		(?X_ZH (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZZC))
		(?X_ZJ (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZZD))
		(?X_ZL (?X_ZZE ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_ZZF))
	)
)

; "Tom climbed a tree."
; "He climbed a tall tree."
; "He climbed to the top of the tree."
; "He jumped from one branch to another."
; "He landed safely on the ground."
(EPI-SCHEMA ((?X_L (((ADV-A (FROM.P ?X_J)) CLIMB.V) ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C GROUND.N))
		(!R2 (?X_J TREE.N))
		(!R3 (?X_K TALL.A))
		(!R4 (?X_K TREE.N))
		(!R5 (?X_M TOP.N))
		(!R6 (?X_M (OF.P ?X_K)))
		(!R7 (?X_J DESTINATION.N))
		(!R8 (?X_K DESTINATION.N))
		(!R9 (?X_L AGENT.N))
		(!R10 (?X_M DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_L ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_J))
		(?X_G (?X_L ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_K))
		(?X_I (?X_L ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_M))
		(?X_B (?X_L (SAFELY.ADV ((ADV-A (ON.P ?X_C)) LAND.V))))
	)
)

; "Sammy climbed up on the rooftop."
; "He tried to jump off."
; "But he fell back down."
; "His face hurt."
(EPI-SCHEMA ((?X_H CLIMB_UP.V) ** ?E)
	(:ROLES
		(!R1 (?X_E FACE.N))
		(!R2 (?X_E (PERTAIN-TO ?X_H)))
		(!R3 (?X_H AGENT.N))
		(!R4 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_E HURT.V))
		(?X_G (?X_H ((ADV-A (FROM.P ?L1)) CLIMB_UP.20.V) ?L2))
		(?X_D (?X_H (TRY.V (KA JUMP_OFF.V))))
		(?E_1 (?X_H ((ADV-A (FROM.P ?L1)) JUMP_OFF.21.V) ?L2))
	)
)

; "Tom climbed up a tree."
; "He was afraid of heights."
; "He climbed higher."
; "He looked down."
; "His heart started beating fast."
; "He saw the ground far below him."
; "He jumped from the tree."
; "He landed safely on the ground."
(EPI-SCHEMA ((?X_P (CLIMB_UP.V ?X_Q)) ** ?E)
	(:ROLES
		(!R1 (?X_E GROUND.N))
		(!R2 (?X_O HEART.N))
		(!R3 (?X_H (PLUR HEIGHT.N)))
		(!R4 (?X_P AFRAID.A))
		(!R5 (?X_O (PERTAIN-TO ?X_P)))
		(!R6 (?X_Q TREE.N))
		(!R7 (?X_Q DESTINATION.N))
		(!R8 (?X_O AGENT.N))
		(!R9 (?N NOISE.N))
		(!R10 (?X_P AGENT.N))
		(!R11 (NOT (?X_Q = ?L2)))
		(!R12 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_J (?X_P ((ADV-A (FROM.P ?L1)) CLIMB_UP.22.V) ?X_Q))
		(?X_A (?X_P (OF.P ?X_H)))
		(?X_L (?X_P ((ADV-A (FROM.P ?L1)) CLIMB.23.V) ?L2))
		(?X_G (?X_P (DOWN.ADV LOOK.V)))
		(?X_B (?X_O ((ADV-A (FOR.P (KA (FAST.ADV BEAT.V)))) START.V)))
		(?E_1 (?X_O BEAT.24.V ?N))
		(?X_N (?X_P ((ADV-A (FROM.P ?X_Q)) JUMP.25.V) ?L2))
		(?X_D (?X_P (SAFELY.ADV ((ADV-A (ON.P ?X_E)) LAND.V))))
	)
)

; "Alicia tried to climb on the roof."
; "She didn't want to fall."
; "She looked around for something to hold onto."
; "She found nothing."
(EPI-SCHEMA ((?X_K (TRY.V (KA (CLIMB.V ?X_J)))) ** ?E)
	(:ROLES
		(!R1 (?X_J ROOF.N))
		(!R2 (?X_K AGENT.N))
		(!R3 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_I (?X_K (TRY.V (KA ((ADV-A (ON.P ?X_J)) CLIMB.V)))))
		(?X_G (NOT (?X_K (WANT.V (KA FALL.V)))))
		(?X_E (?X_K ((ADV-A (FOR.P ?X_A)) LOOK_AROUND.V)))
		(?X_C (?X_K (FIND.V (NO.D THING.N))))
		(?E_1 (?X_K ((ADV-A (FROM.P ?L1)) CLIMB.26.V) ?L2))
	)
)

; "Sally climbed up on the roof."
; "She looked around."
; "There were other things up there."
; "She walked over to them."
; "She picked up one thing."
; "She put it down."
; "Another thing fell from the roof."
; "She jumped away from it."
(EPI-SCHEMA ((?X_R CLIMB_UP.V) ** ?E)
	(:ROLES
		(!R1 (?X_C ROOF.N))
		(!R2 (?X_H THING.N))
		(!R3 (?X_Q OTHER.A))
		(!R4 (?X_Q (PLUR THING.N)))
		(!R5 (?X_Q DESTINATION.N))
		(!R6 (?X_R AGENT.N))
		(!R7 (NOT (?X_S = ?L2)))
		(!R8 (?L2 DESTINATION.N))
		(!R9 (?X_S LOCATION.N))
	)
	(:STEPS
		(?X_L (?X_R ((ADV-A (FROM.P ?L1)) CLIMB_UP.20.V) ?L2))
		(?X_J (?X_R (AROUND.ADV LOOK.V)))
		(?X_N (?X_R ((ADV-A (FROM.P ?L1)) WALK_OVER.27.V) ?X_Q))
		(?X_G (?X_R (PICK_UP.V ?X_H)))
		(?X_E (?X_R ((DOWN.ADV PUT.V) ?X_H)))
		(?X_B ((ANOTHER.D THING.N) ((ADV-A (FROM.P ?X_C)) FALL.V)))
		(?X_P (?X_R ((ADV-A (FROM.P ?X_S)) JUMP_AWAY.28.V) ?L2))
	)
)

; "Tom climbed the tree."
; "He tried to climb higher."
; "He couldn't reach the highest branch."
; "He jumped from one branch to another."
; "He fell down."
(EPI-SCHEMA ((?X_I (CLIMB.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C HIGHEST.A))
		(!R2 (?X_C BRANCH.N))
		(!R3 (?X_H TREE.N))
		(!R4 (?X_H DESTINATION.N))
		(!R5 (?X_I AGENT.N))
		(!R6 (?L2 DESTINATION.N))
	)
	(:STEPS
		(E547.SK (NOT (?X_I ((CAN.MD REACH.V) ?X_C))))
		(?X_G (?X_I ((ADV-A (FROM.P ?L1)) CLIMB.19.V) ?X_H))
		(?X_E (?X_I (TRY.V (KA (HIGHER.ADV CLIMB.V)))))
		(?X_B (?X_I (DOWN.ADV FALL.V)))
		(?E_1 (?X_I ((ADV-A (FROM.P ?L1)) CLIMB.26.V) ?L2))
	)
)



; "My wife and I were in the mall."
; "We saw our son."
; "We called out to him."
; "He ignored us."
; "We followed him."
; "We caught up with him."
(EPI-SCHEMA ((?X_O (CALL.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_I SON.N))
		(!R2 (?X_I (PERTAIN-TO ?X_P)))
		(!R3 (?X_J MALL.N))
		(!R4 (?X_L AGENT.N))
		(!R5 (?X_K WIFE.N))
		(!R6 (?X_K (PERTAIN-TO ?X_L)))
		(!R7 (?X_O (SET-OF AGENT.N)))
		(!R8 (?X_O AGENT.N))
		(!R9 (?X_P AGENT.N))
	)
	(:STEPS
		(?X_A ((SET-OF ?X_K ?X_L) ((ADV-A (IN.P ?X_J)) BE.V)))
		(?X_B (?X_O SEE.1.V ?X_I))
		(?X_H (?X_P ((ADV-A (TO.P ?X_I)) CALL_OUT.V)))
		(?X_F (?X_I (IGNORE.V ?X_P)))
		(?X_N (?X_P FOLLOW.2.V ?X_I))
		(?X_D (?X_P ((ADV-A (WITH.P ?X_I)) CATCH_UP.V)))
	)
)

; "'I want to go shopping,' said Tom."
; "His mother agreed."
; "'Let's go to the mall,' she told him."
; "'OK,' he said."
(EPI-SCHEMA ((?X_A AGREE.V) ** ?E)
	(:ROLES
		(!R1 (?X_A MOTHER.N))
		(!R2 (?X_A (PERTAIN-TO ?X_B)))
	)
	(:STEPS
		(?X_D (?X_A AGREE.V))
	)
)

; "Tom's family goes to the mall often."
; "Lots of people go there."
; "There is a lot of stuff to look at."
; "A lot of stores sell things."
(EPI-SCHEMA ((?X_N ((ADV-A (TO.P ?X_Q)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR THING.N)))
		(!R2 (?X_E LOT.N))
		(!R3 (?X_E (OF.P ?X_F)))
		(!R4 (?X_I STUFF.N))
		(!R5 (?X_J LOT.N))
		(!R6 (?X_K AGENT.N))
		(!R7 (?X_R FAMILY.N))
		(!R8 (?X_R (PERTAIN-TO ?X_K)))
		(!R9 (?X_Q MALL.N))
		(!R10 (?X_N (PLUR PERSON.N)))
		(!R11 (?X_S (PLUR LOT.N)))
		(!R12 (?X_S (OF.P ?X_N)))
		(!R13 (?X_Q DESTINATION.N))
		(!R14 (?X_R AGENT.N))
		(!R15 (?X_S AGENT.N))
		(!R16 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_M (?X_R ((ADV-A (FROM.P ?L1)) GO.3.V) ?X_Q))
		(?X_P (?X_S ((ADV-A (FROM.P ?L1)) GO.4.V) ?L2))
		(?X_H (?X_A (BE.V (KE (?X_J ((OF.P ?X_I) (KA (LOOK.V AT.P))))))))
		(?X_C (?X_E (SELL.V ?X_D)))
	)
)

; "A family was shopping in a mall."
; "Their son was with them."
; "They saw their son."
; "They yelled at him."
; "He ignored them."
(EPI-SCHEMA ((?X_K ((ADV-A (AT.P ?X_J)) YELL.V)) ** ?E)
	(:ROLES
		(!R1 (?X_J SON.N))
		(!R2 (?X_I MALL.N))
		(!R3 (?X_K FAMILY.N))
		(!R4 (?X_J (PERTAIN-TO ?X_K)))
		(!R5 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_H (?X_K ((ADV-A (IN.P ?X_I)) SHOP.V)))
		(?X_A (?X_J ((ADV-A (WITH.P ?X_K)) BE.V)))
		(?X_B (?X_K SEE.5.V ?X_J))
		(?X_F (?X_K ((ADV-A (AT.P ?X_J)) YELL.V)))
		(?X_D (?X_J (IGNORE.V ?X_K)))
	)
)

; "Sally went shopping."
; "She bought some clothes."
; "She bought a new dress."
; "She liked the dress."
(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA.PR ?X_E ?L2 ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_K NEW.A))
		(!R2 (?X_K DRESS.N))
		(!R3 (?X_E (PLUR CLOTHE.N)))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_J AGENT.N))
		(!R6 (NOT (?X_K ACTION.N)))
		(!R7 (NOT (?X_K AGENT.N)))
	)
	(:STEPS
		(?X_G (?X_J ((ADV-A (FROM.P ?L1)) GO.4.V) ?L2))
		(?X_D (?X_J (BUY.V ?X_E)))
		(?X_B (?X_J (BUY.V ?X_K)))
		(?X_I (?X_J LIKE.6.V ?X_K))
	)
)

; "John walked into the mall."
; "His family came along too."
; "'Hey Dad,' said John's son."
; "'Hi there,' said John."
; "'I'm going to look for my mom', said John's daughter."
; "'OK', said John."
; "'Let me know if you find her', said John."
; "'Okay', said John's son."
(EPI-SCHEMA ((?X_I ((ADV-A (THROUGH.P ?X_J)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_L FAMILY.N))
		(!R2 (?X_L (PERTAIN-TO ?X_I)))
		(!R3 (?X_J MALL.N))
		(!R4 (?X_G SON.N))
		(!R5 (?X_G (PERTAIN-TO ?X_I)))
		(!R6 (?X_H DAUGHTER.N))
		(!R7 (?X_H (PERTAIN-TO ?X_I)))
		(!R8 (?X_I AGENT.N))
		(!R9 (?X_J DESTINATION.N))
		(!R10 (?X_K ENTITY.N))
		(!R11 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_F (?X_I ((ADV-A (FROM.P ?L1)) WALK.7.V) ?X_J))
		(?X_B (?X_L (TOO.ADV (ALONG.ADV COME.V))))
		(?X_D (?X_A (SAY.V ?X_I)))
		(?E_1 (?X_L ((ADV-A (FOR.P ?X_K)) LOOK.8.V)))
	)
)

; "Tommy went shopping."
; "He bought some clothes."
; "He bought a shirt."
; "He bought pants."
; "He bought shoes."
; "He bought socks."
; "He bought underwear."
; "He bought a belt."
; "He bought a tie."
; "He bought a hat."
; "He bought a watch."
; "He bought an umbrella."
; "He bought a wallet."
; "He bought a pen."
; "He bought a phone."
; "He bought a map."
; "He bought a camera."
; "He bought a bag."
; "He bought a magazine."
; "He bought a book."
(EPI-SCHEMA ((?X_ZZH
              (COMPOSITE-SCHEMA.PR ?X_C ?X_F ?X_I ?X_L ?X_O ?X_R ?X_U ?X_X
               ?X_ZA ?X_ZD ?X_ZG ?X_ZJ ?X_ZM ?X_ZP ?X_ZS ?X_ZV ?X_ZY ?X_ZZB
               ?X_ZZE ?L2))
             ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR CLOTHE.N)))
		(!R2 (?X_F SHIRT.N))
		(!R3 (?X_I (PLUR PANT.N)))
		(!R4 (?X_L (PLUR SHOE.N)))
		(!R5 (?X_O (PLUR SOCK.N)))
		(!R6 (?X_R UNDERWEAR.N))
		(!R7 (?X_U BELT.N))
		(!R8 (?X_X TIE.N))
		(!R9 (?X_ZA HAT.N))
		(!R10 (?X_ZD WATCH.N))
		(!R11 (?X_ZG UMBRELLA.N))
		(!R12 (?X_ZJ WALLET.N))
		(!R13 (?X_ZM PEN.N))
		(!R14 (?X_ZP PHONE.N))
		(!R15 (?X_ZS MAP.N))
		(!R16 (?X_ZV CAMERA.N))
		(!R17 (?X_ZY BAG.N))
		(!R18 (?X_ZZB MAGAZINE.N))
		(!R19 (?X_ZZE BOOK.N))
		(!R20 (?X_ZZH AGENT.N))
		(!R21 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_ZZH ((ADV-A (FROM.P ?L1)) GO.4.V) ?L2))
		(?X_E (?X_ZZH (BUY.V ?X_C)))
		(?X_H (?X_ZZH (BUY.V ?X_F)))
		(?X_K (?X_ZZH (BUY.V ?X_I)))
		(?X_N (?X_ZZH (BUY.V ?X_L)))
		(?X_Q (?X_ZZH (BUY.V ?X_O)))
		(?X_T (?X_ZZH (BUY.V ?X_R)))
		(?X_W (?X_ZZH (BUY.V ?X_U)))
		(?X_Z (?X_ZZH (BUY.V ?X_X)))
		(?X_ZC (?X_ZZH (BUY.V ?X_ZA)))
		(?X_ZF (?X_ZZH (BUY.V ?X_ZD)))
		(?X_ZI (?X_ZZH (BUY.V ?X_ZG)))
		(?X_ZL (?X_ZZH (BUY.V ?X_ZJ)))
		(?X_ZO (?X_ZZH (BUY.V ?X_ZM)))
		(?X_ZR (?X_ZZH (BUY.V ?X_ZP)))
		(?X_ZU (?X_ZZH (BUY.V ?X_ZS)))
		(?X_ZX (?X_ZZH (BUY.V ?X_ZV)))
		(?X_ZZA (?X_ZZH (BUY.V ?X_ZY)))
		(?X_ZZD (?X_ZZH (BUY.V ?X_ZZB)))
		(?X_ZZG (?X_ZZH (BUY.V ?X_ZZE)))
	)
)

; "'I'm going shopping,' said Tom."
; "'Where do you want to go?' asked Jenny."
; "'To the mall,' replied Tom."
; "'Let's go to the mall,' agreed Jenny."
(EPI-SCHEMA ((?X_A ((ADV-A (TO.P ?X_D)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_A AGENT.N))
		(!R2 (?X_C (PERTAIN-TO ?X_A)))
		(!R3 (?X_D MALL.N))
		(!R4 (?X_E AGENT.N))
		(!R5 (?X_B AGENT.N))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?X_C AGENT.N))
		(!R8 ((K (TO.P (?X_D (AGREE.V ?X_E)))) DESTINATION.N))
	)
	(:STEPS
		(?E_1 (?X_B ((ADV-A (FROM.P ?L1)) GO.9.V) ?L2))
		(E283.SK
   (?X_C ((ADV-A (FROM.P ?L1)) GO.10.V) (K (TO.P (?X_D (AGREE.V ?X_E))))))
	)
)

; "Bob went shopping."
; "He looked for a new shirt."
; "He found one that he liked."
; "He bought it."
(EPI-SCHEMA ((?X_D ((ADV-A (FOR.P ?X_I)) LOOK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D AGENT.N))
		(!R2 (?X_I NEW.A))
		(!R3 (?X_I SHIRT.N))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_F (?X_L ((ADV-A (FROM.P ?L1)) GO.4.V) ?L2))
		(?X_H (?X_L ((ADV-A (FOR.P ?X_I)) LOOK.11.V)))
		(?E_1 (?X ENJOY_ACTION.12.V (IND (0 ?X_A))))
		(?X_K (?X_L FIND.13.V ?X_I))
		(?X_C (?X_L (BUY.V ?X_D)))
	)
)



; "'I want to go for a ride in my new car.'"
; "'My family is going on vacation next week.'"
; "'I'm taking my friends to the movies tonight.'"
; "'We're going to have dinner together this weekend.'"
; "'I'll be sure to take lots of pictures of our trip.'"
; "'Our dog is sick today.'"
; "'I've been thinking about buying a new car.'"
; "'I just love riding around in my car.'"
; "'I can't wait until we start living in our house!'"
; "'I'd really love to have"
(EPI-SCHEMA ((?X_U
              (COMPOSITE-SCHEMA.PR (KA ((ADV-A (FOR.P ?X_R)) GO.V))
               (KA ((ADV-A (IN.P ?X_C)) RIDE_AROUND.V)) ?X_R ?X_S ?X_J))
             ** ?E)
	(:ROLES
		(!R1 (?X_C CAR.N))
		(!R2 (?X_C (PERTAIN-TO ?X_D)))
		(!R3 (?X_F ((WILL.MD SURE.A) (KA (TAKE.V ?X_E)))))
		(!R4 (?X_F AGENT.N))
		(!R5 (?X_F MEMBER-OF ?X_G))
		(!R6 (?X_J DINNER.N))
		(!R7 (?X_K AGENT.N))
		(!R8 (?X_R RIDE.N))
		(!R9 (?X_S VACATION.N))
		(!R10 (?X_T FAMILY.N))
		(!R11 (?X_T (PERTAIN-TO ?X_U)))
		(!R12 (?X_P NEW.A))
		(!R13 (?X_Q (PERTAIN-TO ?X_U)))
		(!R14 (?X_Q ?X_P CAR.N))
		(!R15 (?X_R (IN.P ?X_Q)))
		(!R16 (?X_R DESTINATION.N))
		(!R17 (?X_S DESTINATION.N))
		(!R18 (?X_T AGENT.N))
		(!R19 (?X_U AGENT.N))
	)
	(:STEPS
		(?X_M (?X_U (WANT.V (KA ((ADV-A (FOR.P ?X_R)) GO.V)))))
		(?E_1 (?X_U ((ADV-A (FROM.P ?L1)) GO.2.V) ?X_R))
		(?X_O (?X_T ((ADV-A (FROM.P ?L1)) GO.3.V) ?X_S))
		(?X_I (?X_K ((ADV-A (FOR.P (KA (HAVE.V ?X_J)))) GO.V)))
		(?X_B (?X_F ((JUST.ADV LOVE.V) (KA ((ADV-A (IN.P ?X_C)) RIDE_AROUND.V)))))
		(?E_2 (?X_U HAVE.4.V ?X_J))
	)
)

; "Susan bought a new car."
; "She drove it on the highway."
; "She stopped for gas."
; "She parked the car."
; "She left her keys inside the car."
(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA.PR ?X_K ?X_J ?L)) ** ?E)
	(:ROLES
		(!R1 (?X_K (PLUR KEY.N)))
		(!R2 (?X_D GAS.N))
		(!R3 (?X_G HIGHWAY.N))
		(!R4 (?X_J NEW.A))
		(!R5 (?X_J CAR.N))
		(!R6 (?X_K (PERTAIN-TO ?X_N)))
		(!R7 (?X_N AGENT.N))
		(!R8 (?L LOCATION.N))
	)
	(:STEPS
		(?X_I (?X_N (BUY.V ?X_J)))
		(?X_F (?X_N (((ADV-A (ON.P ?X_G)) DRIVE.V) ?X_J)))
		(?X_C (?X_N ((ADV-A (FOR.P ?X_D)) STOP.V)))
		(?X_M (?X_N PARK.5.V ?X_J ?L))
		(?X_A (?X_N (((ADV-A (INSIDE.P ?X_J)) LEAVE.V) ?X_K)))
	)
)

; "'Susan bought a car.'"
; "She drove it around."
; "She was happy because she liked it."
(EPI-SCHEMA ((?L2 (BUY.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_H CAR.N))
		(!R2 (?X_H SMALLER-THAN.N ?X_G))
		(!R3 (?L2 DESTINATION.N))
		(!R4 ((K (BECAUSE.P (?X_G (LIKE.V ?X_H)))) OBJECT.N))
		(!R5 (?X_G AGENT.N))
		(!R6 (NOT ((K (BECAUSE.P (?X_G (LIKE.V ?X_H)))) ACTION.N)))
		(!R7 (NOT ((K (BECAUSE.P (?X_G (LIKE.V ?X_H)))) AGENT.N)))
	)
	(:STEPS
		(?X_B (?X_G (BUY.V ?X_H)))
		(?X_D (?X_G DRIVE.6.V ?X_H ?L2))
		(?X_F (?X_G BE.7.V (K (BECAUSE.P (?X_G (LIKE.V ?X_H))))))
	)
)



; "The boy was playing soccer."
; "His team lost by three goals."
; "They were all sad about it."
; "Then they decided to have fun."
; "They started singing songs."
(EPI-SCHEMA ((?X_H (HAVE.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR SONG.N)))
		(!R2 (?X_G FUN.N))
		(!R3 (?X_H AGENT.N))
		(!R4 (?X_I SOCCER.N))
		(!R5 (?X_J BOY.N))
	)
	(:STEPS
		(?X_A (?X_J PLAY.1.V))
		(?X_F (?X_H ((THEN.ADV DECIDE.V) (KA (HAVE.V ?X_G)))))
		(?X_C (?X_H ((ADV-A (FOR.P (KA (SING.V ?X_D)))) START.V)))
	)
)

; "Tom's team played against Jenny's team."
; "Tom's team lost by one goal."
; "Tom's team was sad."
; "Tom's team decided to have some fun."
; "They sang songs."
(EPI-SCHEMA ((?X_J ((ADV-A (WITH.P ?X_O)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR SONG.N)))
		(!R2 (?X_F FUN.N))
		(!R3 (?X_I GOAL.N))
		(!R4 (?X_O SAD.A))
		(!R5 (?X_O TEAM.N))
		(!R6 (?X_J AGENT.N))
		(!R7 (?X_O (PERTAIN-TO ?X_J)))
		(!R8 (?X_N AGENT.N))
		(!R9 (?X_M TEAM.N))
		(!R10 (?X_M (PERTAIN-TO ?X_N)))
		(!R11 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_L (?X_O PLAY.2.V))
		(?X_H (?X_O ((ADV-A (BY.P ?X_I)) LOSE.V)))
		(?X_E (?X_O (HAVE.V ?X_F)))
		(?X_B (?X_O (SING.V ?X_C)))
	)
)

; "The girls played music together."
; "They sang songs."
; "They danced around."
; "They laughed."
; "The boys joined them."
; "They sang songs too."
(EPI-SCHEMA ((?X_M ((ADV-A (AROUND.P ?L2)) DANCE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR SONG.N)))
		(!R2 (?X_F (PLUR BOY.N)))
		(!R3 (?X_I (PLUR SONG.N)))
		(!R4 (?X_L MUSIC.N))
		(!R5 (?X_M (PLUR GIRL.N)))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?N NOISE.N))
	)
	(:STEPS
		(?X_K (?X_M ((TOGETHER.ADV PLAY.V) ?X_L)))
		(?X_H (?X_M (SING.V ?X_I)))
		(?X_O (?X_M ((ADV-A (FROM.P ?L1)) DANCE_AROUND.3.V) ?L2))
		(?X_Q (?X_M LAUGH.4.V ?N))
		(?X_E (?X_F (JOIN.V ?X_M)))
		(?X_B (?X_F ((TOO.ADV SING.V) ?X_C)))
	)
)

; "'The boy was playing soccer."
; "His team lost by three goals."
; "They were all sad about it."
; "Then they decided to have fun."
; "They sang songs.'<|endoftext|>"
(EPI-SCHEMA ((?X_H PLAY.V) ** ?E)
	(:ROLES
		(!R1 (?X_C FUN.N))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_G SOCCER.N))
		(!R4 (?X_H BOY.N))
	)
	(:STEPS
		(?X_F (?X_H PLAY.5.V))
		(?X_B (?X_D ((THEN.ADV DECIDE.V) (KA (HAVE.V ?X_C)))))
	)
)

; "A girl watched a soccer match."
; "She thought that soccer was fun."
; "She liked watching the games."
(EPI-SCHEMA ((?X_H (LIKE.V (KA (WATCH.V ?X_D)))) ** ?E)
	(:ROLES
		(!R1 (?X_C FUN.N))
		(!R2 (?X_D SOCCER.N))
		(!R3 (?X_G SOCCER.N))
		(!R4 (?X_G MATCH.N))
		(!R5 (?X_H GIRL.N))
		(!R6 (?X_K (PLUR GAME.N)))
		(!R7 ((KA (WATCH.V ?X_K)) ACTION.N))
	)
	(:STEPS
		(?X_F (?X_H (WATCH.V ?X_G)))
		(?X_B (?X_H (THINK.V (THT (?X_D (= ?X_C))))))
		(?X_J (?X_H LIKE.6.V (KA (WATCH.V ?X_K))))
	)
)

; "The boys played soccer."
; "Their team lost by three goals."
; "They were sad about that."
; "They sang songs."
; "They were happy after they finished singing."
(EPI-SCHEMA ((?X_H PLAY.V) ** ?E)
	(:ROLES
		(!R1 (?X_C SINGING.N))
		(!R2 (?X_F (PLUR SONG.N)))
		(!R3 (?X_G {REF}.N))
		(!R4 (?X_H (PLUR BOY.N)))
		(!R5 (?X_H SAD.A))
		(!R6 (?X_H HAPPY.A))
		(!R7 (?X_K SOCCER.N))
	)
	(:STEPS
		(?X_J (?X_H PLAY.7.V))
		(?X_A (?X_H (ABOUT.P ?X_G)))
		(?X_E (?X_H (SING.V ?X_F)))
		(?X_B (?X_H (AFTER.P (KE (?X_H (FINISH.V ?X_C))))))
	)
)

; "Tommy sang a song."
; "He liked to sing."
; "He sang for his family."
; "His sister liked the song."
; "Tommy played an instrument."
(EPI-SCHEMA ((?X_M ((ADV-A (FOR.P ?X_M)) SING.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E INSTRUMENT.N))
		(!R2 (?X_H FAMILY.N))
		(!R3 (?X_M SONG.N))
		(!R4 (?X_H (PERTAIN-TO ?X_L)))
		(!R5 (?X_K SISTER.N))
		(!R6 (?X_K (PERTAIN-TO ?X_L)))
		(!R7 (?X_L AGENT.N))
		(!R8 ((KA SING.V) ACTION.N))
		(!R9 (?X_M OBJECT.N))
		(!R10 (NOT (?X_M ACTION.N)))
		(!R11 (NOT (?X_M AGENT.N)))
	)
	(:STEPS
		(?X_G (?X_L (SING.V ?X_M)))
		(?X_J (?X_L LIKE.8.V (KA SING.V)))
		(?X_A (?X_L ((ADV-A (FOR.P ?X_H)) SING.V)))
		(?X_B (?X_K LIKE.9.V ?X_M))
		(?X_D (?X_L (PLAY.V ?X_E)))
	)
)

; "Tom sang a song."
; "He was happy."
; "The other kids joined him."
; "They sang some more songs."
(EPI-SCHEMA ((?X_A (SING.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_A AGENT.N))
		(!R2 (?X_B SONG.N))
		(!R3 (?X_E OTHER.A))
		(!R4 (?X_E (PLUR KID.N)))
		(!R5 (?X_F AGENT.N))
		(!R6 (?X_F HAPPY.A))
		(!R7 (?X_I AGENT.N))
		(!R8 (?X_J MORE.A))
		(!R9 (?X_J (PLUR SONG.N)))
	)
	(:STEPS
		(?X_D (?X_A (SING.V ?X_B)))
		(?X_H (?X_E (JOIN.V ?X_F)))
		(?X_L (?X_I (SING.V ?X_J)))
	)
)

; "Tom played soccer."
; "He liked playing soccer."
; "His team lost the game."
; "He missed many chances to score."
(EPI-SCHEMA ((?X_M (PLAY.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_D MANY.A))
		(!R2 (?X_D (PLUR CHANCE.N)))
		(!R3 (?X_E SCORE.N))
		(!R4 (?X_F GAME.N))
		(!R5 (?X_G TEAM.N))
		(!R6 (?X_G (PERTAIN-TO ?X_M)))
		(!R7 (?X_J SOCCER.N))
		(!R8 (?X_N SOCCER.N))
		(!R9 (?X_M AGENT.N))
		(!R10 ((KA (PLAY.V ?X_N)) ACTION.N))
		(!R11 (?X AGENT.N))
	)
	(:STEPS
		(?X_I (?X_M PLAY.10.V))
		(?X_L (?X_M LIKE.11.V (KA (PLAY.V ?X_N))))
		(?X_A (?X_G (LOSE.V ?X_F)))
		(?X_C (?X_M (((ADV-A (TO.P ?X_E)) MISS.V) ?X_D)))
		(?E_1 (?X PLAY.12.V))
	)
)

; "Mary walked down the street."
; "She saw a dog on the sidewalk."
; "She stopped and petted the dog's head."
; "The dog licked Mary's hand."
(EPI-SCHEMA ((?X_L ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G HAND.N))
		(!R2 (?X_F DOG.N))
		(!R3 (?X_E HEAD.N))
		(!R4 (?X_E (PERTAIN-TO ?X_F)))
		(!R5 (?X_G (PERTAIN-TO ?X_L)))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_I (?X_L ((ADV-A (FROM.P ?L1)) WALK.13.V) ?L2))
		(?X_K (?X_L SEE.16.V ?X_F))
		(?X_A (?X_L STOP.V))
		(?X_B (?X_L (PET.V ?X_E)))
		(?X_D (?X_F (LICK.V ?X_G)))
	)
)

; "Tom saw a dog on the street."
; "He ran away from the dog."
; "The dog chased Tom."
(EPI-SCHEMA ((?X_G ((ADV-A (FROM.P ?X_H)) (AWAY.ADV RUN.V))) ** ?E)
	(:ROLES
		(!R1 (?X_H DOG.N))
		(!R2 (?X_H LOCATION.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (NOT (?X_H = ?L2)))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_G SEE.17.V ?X_H))
		(?X_D (?X_G ((ADV-A (FROM.P ?X_H)) RUN.18.V) ?L2))
		(?X_F (?X_H CHASE.19.V ?X_G))
	)
)

; "Mike's dog ran after him."
; "His dog bit Mike."
; "Mike yelled at his dog."
; "The dog stopped biting Mike."
(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA.PR ?L2 (IND (4 CAUSE_HARM)))) ** ?E)
	(:ROLES
		(!R1 (?X_F DOG.N))
		(!R2 (?X_H AGENT.N))
		(!R3 (?X_F (PERTAIN-TO ?X_H)))
		(!R4 (?X_G DOG.N))
		(!R5 (?X_G (PERTAIN-TO ?X_F)))
		(!R6 (?X_G (BIT.N ?X_H)))
		(!R7 (?L2 DESTINATION.N))
		(!R8 ((IND (4 CAUSE_HARM)) ACTION.N))
	)
	(:STEPS
		(?X_C (?X_F ((ADV-A (FROM.P ?L1)) RUN.24.V) ?L2))
		(?X_A (?X_H ((ADV-A (AT.P ?X_F)) YELL.V)))
		(?X_E (?X_F STOP.25.V (IND (4 CAUSE_HARM))))
	)
)

; "Bob saw a dog on the street."
; "He was running after a cat."
; "The cat ran into a house."
; "The dog followed the cat inside."
(EPI-SCHEMA ((?X_H ((ADV-A (FROM.P ?X_H)) (AWAY.ADV RUN.V))) ** ?E)
	(:ROLES
		(!R1 (?X_C DOG.N))
		(!R2 (?X_I CAT.N))
		(!R3 (?X_H AGENT.N))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_I DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_H SEE.26.V ?X_C))
		(?X_E (?X_C ((ADV-A (FROM.P ?L1)) RUN.24.V) ?L2))
		(?X_G (?X_I ((ADV-A (FROM.P ?L1)) RUN.27.V) ?X_I))
	)
)

; "Alice saw a dog on the street."
; "She petted the dog."
; "The dog wagged its tail."
(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA.PR ?X_D ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_D TAIL.N))
		(!R2 (?X_E DOG.N))
		(!R3 (?X_D (PERTAIN-TO ?X_E)))
		(!R4 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_G (?X_H SEE.28.V ?X_E))
		(?X_C (?X_H (PET.V ?X_E)))
		(?X_A (?X_E (WAG.V ?X_D)))
	)
)

; "Tom ran into the house."
; "The dog chased Tom."
; "Tom slammed the door."
; "The dog stopped running."
; "Tom locked the door."
(EPI-SCHEMA ((?X_M ((ADV-A (INTO.P ?X_E)) RUN.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E DOOR.N))
		(!R2 (?X_N HOUSE.N))
		(!R3 (?X_L DOG.N))
		(!R4 (?X_M AGENT.N))
		(!R5 (?X_N DESTINATION.N))
		(!R6 (?A ACTION.N))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_G (?X_M ((ADV-A (FROM.P ?L1)) RUN.29.V) ?X_N))
		(?X_I (?X_L CHASE.30.V ?X_M))
		(?X_D (?X_M (SLAM.V ?X_E)))
		(?X_K (?X_L STOP.31.V ?A))
		(?X_B (?X_M (LOCK.V ?X_E)))
		(?E_1 (?X_L ((ADV-A (FROM.P ?L1)) RUN.32.V) ?L2))
	)
)

; "Joey chased the cat."
; "The cat ran away."
; "Joey chased the cat again."
; "The cat ran into the house."
(EPI-SCHEMA ((?X_J (CHASE.V (ANOTHER.D PERSON.N))) ** ?E)
	(:ROLES
		(!R1 (?X_I CAT.N))
		(!R2 (?X_K HOUSE.N))
		(!R3 (?X_I LOCATION.N))
		(!R4 (NOT (?X_I = ?L2)))
		(!R5 (?L2 DESTINATION.N))
		(!R6 (?X_J AGENT.N))
		(!R7 (?X_K DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_J CHASE.33.V ?X_I))
		(?X_D (?X_I ((ADV-A (FROM.P ?X_I)) RUN_AWAY.34.V) ?L2))
		(?X_F (?X_J CHASE.35.V ?X_I))
		(?X_H (?X_I ((ADV-A (FROM.P ?L1)) RUN.29.V) ?X_K))
	)
)



; "Mary had an accident at school."
; "She fell into a puddle of mud."
; "She hurt herself badly."
; "She needed stitches."
(EPI-SCHEMA ((?X_J ((ADV-A (INTO.P ?X_D)) FALL.V)) ** ?E)
	(:ROLES
		(!R1 (?X_B ACCIDENT.N))
		(!R2 (?X_B (AT.P ?X_C)))
		(!R3 (?X_D PUDDLE.N))
		(!R4 (?X_D (OF.P ?X_E)))
		(!R5 (?X_J AGENT.N))
		(!R6 (?X_K (PLUR STITCH.N)))
	)
	(:STEPS
		(?X_A (?X_J (HAVE.V ?X_B)))
		(?X_G (?X_J ((ADV-A (INTO.P ?X_D)) FALL.V)))
		(?X_I (?X_J ((BADLY.ADV HURT.V) ?X_J)))
		(?X_M (?X_J (NEED.V ?X_K)))
	)
)



; "Mary and Sam were best friends."
; "Mary lived next door to Sam."
; "They always hung out together."
; "But Mary started dating someone else."
; "That hurt Sam."
(EPI-SCHEMA ((?X_K (LIVE.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_K AGENT.N))
		(!R2 (?X_C {REF}.N))
		(!R3 (?X_F AGENT.N))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_J DOOR.N))
		(!R6 (?X_J NEXT.A))
		(!R7 (?X_J (TO.P ?X_K)))
	)
	(:STEPS
		(?X_H (?X_I LIVE.1.V (K (L X (AND (X NEXT.A) (X DOOR.N) (X (TO.P ?X_K)))))))
		(?X_E (?X_F (ALWAYS.ADV (TOGETHER.ADV HANG_OUT.V))))
		(?X_B (?X_C (HURT.V ?X_K)))
	)
)

; "Sam's best friend is Mary."
; "Mary lives next door to Sam."
; "They hang out together all the time."
; "When they're alone, they talk."
; "Sam likes Mary."
; "Mary doesn't like Sam."
(EPI-SCHEMA ((?X_L (LIKE.V ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_D AGENT.N))
		(!R2 (?X_L BEST.A))
		(!R3 (?X_L FRIEND.N))
		(!R4 (?X_K DOOR.N))
		(!R5 (?X_K NEXT.A))
		(!R6 (?X_L (PERTAIN-TO ?X_M)))
		(!R7 (?X_K (TO.P ?X_M)))
		(!R8 (?X_L OBJECT.N))
		(!R9 (NOT (?X_L ACTION.N)))
		(!R10 (?X_M OBJECT.N))
		(!R11 (NOT (?X_M ACTION.N)))
	)
	(:STEPS
		(?X_C (?X_L (= ?X_D)))
		(?X_F (?X_L LIVE.2.V (K (L X (AND (X NEXT.A) (X DOOR.N) (X (TO.P ?X_M)))))))
		(?X_H (?X_M LIKE.3.V ?X_L))
		(?X_J (?X_L LIKE.4.V ?X_M))
	)
)

; "Sam's friend is named Mike."
; "Mike lives on the other side of town."
; "Sam likes hanging out with Mike."
; "Mike has lots of fun things to do."
(EPI-SCHEMA ((?X_C (LIKE.V (KA ((ADV-A (WITH.P ?X_M)) HANG_OUT.V)))) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_M FRIEND.N))
		(!R3 (?X_M (PERTAIN-TO ?X_L)))
		(!R4 (?X_H FUN.N))
		(!R5 (?X_K ?X_H (PLUR THING.N)))
		(!R6 (?X_N (PLUR LOT.N)))
		(!R7 (?X_N (OF.P ?X_K)))
		(!R8 (?L LOCATION.N))
		(!R9 (?X_L AGENT.N))
		(!R10 ((KA ((ADV-A (WITH.P ?X_M)) HANG_OUT.V)) ACTION.N))
		(!R11 (?X_N OBJECT.N))
	)
	(:STEPS
		(?X_B (?X_M ((PASV NAME.V) ?X_C)))
		(?X_E (?X_M LIVE.5.V ?L))
		(?X_G (?X_L LIKE.6.V (KA ((ADV-A (WITH.P ?X_M)) HANG_OUT.V))))
		(?X_J (?X_M HAVE.7.V ?X_N))
	)
)

; "Sam's friend was sad."
; "His friend was angry."
; "Sam was sad for him."
; "His friend was mad at him."
(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA.PR ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_B SAD.A))
		(!R2 (?X_B AGENT.N))
		(!R3 (?X_A SAD.A))
		(!R4 (?X_A ANGRY.A))
		(!R5 (?X_A FRIEND.N))
		(!R6 (?X_A ((ADV-A (AT.P ?X_B)) MAD.A)))
		(!R7 (?X_A (PERTAIN-TO ?X_B)))
	)
	(:STEPS
		(E119.SK (?X_B (FOR.P ?X_A)))
	)
)

; "Sam went to visit Mary."
; "Sam saw Mary's new boyfriend."
; "Mary told Sam that she broke up with her boyfriend."
; "Sam was sad."
(EPI-SCHEMA ((?X_F ((ADV-A (TO.P ?L2)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F SAD.A))
		(!R2 (?L2 DESTINATION.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_F AGENT.N))
		(!R5 (?X_H NEW.A))
		(!R6 (?X_H (PERTAIN-TO ?X_G)))
		(!R7 (?X_H BOYFRIEND.N))
	)
	(:STEPS
		(?X_C (?X_F ((ADV-A (FROM.P ?L1)) GO.8.V) ?L2))
		(?X_E (?X_F SEE.9.V (THAT (?X_G ((ADV-A (WITH.P ?X_H)) BREAK_UP.V)))))
		(?X_A (?X_G (TELL.V ?X_F (THAT (?X_G ((ADV-A (WITH.P ?X_H)) BREAK_UP.V))))))
	)
)

; "Sam liked hanging out with Mary."
; "Mary's boyfriend broke up with her."
; "She moved away from Sam."
; "Sam felt bad for him."
(EPI-SCHEMA ((?X_L ((ADV-A (FROM.P ?X_K)) (AWAY.ADV MOVE.V))) ** ?E)
	(:ROLES
		(!R1 (?X_E BAD.A))
		(!R2 (?X_F BOYFRIEND.N))
		(!R3 (?X_F (PERTAIN-TO ?X_K)))
		(!R4 (?X_E (FOR.P ?X_F)))
		(!R5 (?X_L AGENT.N))
		(!R6 ((KA ((ADV-A (WITH.P ?X_K)) HANG_OUT.V)) ACTION.N))
		(!R7 (?X_K AGENT.N))
		(!R8 (?X_L LOCATION.N))
		(!R9 (NOT (?X_L = ?L2)))
		(!R10 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_H (?X_L LIKE.10.V (KA ((ADV-A (WITH.P ?X_K)) HANG_OUT.V))))
		(?X_D (?X_F ((ADV-A (WITH.P ?X_K)) BREAK_UP.V)))
		(?X_J (?X_K ((ADV-A (FROM.P ?X_L)) MOVE.11.V) ?L2))
		(?X_B (?X_L (FEEL.V ?X_E)))
	)
)

; "Sam was sad."
; "His friend Mary moved away."
; "Sam missed Mary."
; "He cried for a while."
(EPI-SCHEMA ((?X_G CRY.V) ** ?E)
	(:ROLES
		(!R1 (?X_G SAD.A))
		(!R2 (?X_D FRIEND.N))
		(!R3 (?X_D (PERTAIN-TO ?X_G)))
		(!R4 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_A (?X_D (AWAY.ADV MOVE.V)))
		(?X_C (?X_G (MISS.V ?X_D)))
		(?X_F (?X_G CRY.12.V))
	)
)

; "Mary's friend is named Sam."
; "Sam likes to play sports."
; "Sam plays basketball."
(EPI-SCHEMA ((?X_C ((ADV-A (WITH.P ?X_F)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_F FRIEND.N))
		(!R3 (?X_K (PLUR SPORT.N)))
		(!R4 (?X_G AGENT.N))
		(!R5 (?X_F (PERTAIN-TO ?X_G)))
		(!R6 (?X_J BASKETBALL.N))
		(!R7 ((KA (PLAY.V ?X_K)) ACTION.N))
		(!R8 (?X AGENT.N))
	)
	(:STEPS
		(?X_B (?X_F ((PASV NAME.V) ?X_C)))
		(?X_E (?X_F LIKE.13.V (KA (PLAY.V ?X_K))))
		(?E_1 (?X PLAY.14.V))
		(?X_I (?X_F PLAY.15.V))
	)
)

; "Sam's friend is named John."
; "John lives next door to Sam."
; "Sam likes hanging out with John."
; "Sam doesn't want to hang out with John anymore."
(EPI-SCHEMA ((?X_I (WANT.V (KA ((ADV-A (WITH.P ?X_M)) HANG_OUT.V)))) ** ?E)
	(:ROLES
		(!R1 (?X_F AGENT.N))
		(!R2 (?X_M FRIEND.N))
		(!R3 (?X_M (PERTAIN-TO ?X_L)))
		(!R4 (?X_I DOOR.N))
		(!R5 (?X_I NEXT.A))
		(!R6 (?X_I (TO.P ?X_L)))
		(!R7 (?X_L AGENT.N))
		(!R8 ((KA ((ADV-A (WITH.P ?X_M)) HANG_OUT.V)) ACTION.N))
	)
	(:STEPS
		(?X_E (?X_M ((PASV NAME.V) ?X_F)))
		(?X_H (?X_M LIVE.16.V (K (L X (AND (X NEXT.A) (X DOOR.N) (X (TO.P ?X_L)))))))
		(?X_K (?X_L LIKE.17.V (KA ((ADV-A (WITH.P ?X_M)) HANG_OUT.V))))
		(?X_C
   (NOT (?X_L (WANT.V (KA (ANYMORE.ADV ((ADV-A (WITH.P ?X_M)) HANG_OUT.V)))))))
	)
)

; "Sam was sad."
; "His friend Mary broke up with him."
; "He felt bad for himself."
(EPI-SCHEMA ((?X_B ((ADV-A (WITH.P ?X_B)) BREAK_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_B FRIEND.N))
		(!R2 (?X_D SAD.A))
		(!R3 (?X_D AGENT.N))
		(!R4 (?X_B (PERTAIN-TO ?X_D)))
		(!R5 (?X_C BAD.A))
		(!R6 (?X_C (FOR.P ?X_D)))
	)
	(:STEPS
		(?X_A (?X_B ((ADV-A (WITH.P ?X_D)) BREAK_UP.V)))
		(?X_F (?X_D (FEEL.V ?X_C)))
	)
)

; "John was playing basketball."
; "His team won."
; "Afterwards, he felt happy."
; "A few days later, John broke his leg."
(EPI-SCHEMA ((?X_K ((ADV-A (AFTER.P (KA WIN.V))) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C HAPPY.A))
		(!R2 (?X_F TEAM.N))
		(!R3 (?X_F (PERTAIN-TO ?X_K)))
		(!R4 (?X_G LEG.N))
		(!R5 (?X_G (PERTAIN-TO ?X_K)))
		(!R6 (?X_J BASKETBALL.N))
		(!R7 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_E (?X_F WIN.V))
		(?X_I (?X_K PLAY.18.V))
		(?X_B (?X_K ((AFTERWARDS.ADV FEEL.V) ?X_C)))
	)
)

; "Tom played basketball."
; "He scored points."
; "He won the game."
(EPI-SCHEMA ((?X_G (PLAY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C GAME.N))
		(!R2 (?X_F (PLUR POINT.N)))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_J BASKETBALL.N))
		(!R5 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_I (?X_K PLAY.19.V))
		(?X_E (?X_G (SCORE.V ?X_F)))
		(?X_B (?X_G (WIN.V ?X_C)))
	)
)

; "Mike played basketball."
; "He scored points for his team."
; "He missed some shots."
; "He did not make any baskets."
(EPI-SCHEMA ((?X_L (PLAY.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR SHOT.N)))
		(!R2 (?X_G (PLUR POINT.N)))
		(!R3 (?X_H TEAM.N))
		(!R4 (?X_H (PERTAIN-TO ?X_L)))
		(!R5 (?X_K BASKETBALL.N))
		(!R6 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_J (?X_L PLAY.20.V))
		(?X_A (?X_L (((ADV-A (FOR.P ?X_H)) SCORE.V) ?X_G)))
		(?X_E (?X_L (MISS.V ?X_F)))
		(?X_C (NOT (?X_L (MAKE.V (ANY.D (PLUR BASKET.N))))))
	)
)

; "Tom played basketball."
; "His team lost."
; "He felt sad after the game."
(EPI-SCHEMA ((?X_H (PLAY.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_C ((ADV-A (AFTER.P ?X_D)) SAD.A)))
		(!R2 (?X_H AGENT.N))
		(!R3 (?X_G TEAM.N))
		(!R4 (?X_G (PERTAIN-TO ?X_H)))
		(!R5 (?X_K BASKETBALL.N))
		(!R6 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_F (?X_G LOSE.V))
		(?X_J (?X_L PLAY.21.V))
		(?X_B (?X_H (FEEL.V ?X_C)))
	)
)

; "Tom played basketball."
; "His team lost."
; "He was sad after the game."
(EPI-SCHEMA ((?X_H (LOSE.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C TEAM.N))
		(!R2 (?X_C (PERTAIN-TO ?X_D)))
		(!R3 (?X_G BASKETBALL.N))
		(!R4 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_B (?X_C LOSE.V))
		(?X_F (?X_H PLAY.22.V))
	)
)

; "Basketball is played on a court."
; "There are two teams."
; "Each team has five players."
; "Each player can dribble the ball."
; "Players try to shoot baskets."
(EPI-SCHEMA ((?X (TRY.V (KA (SHOOT.V ?X_E)))) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR BASKET.N)))
		(!R2 (?X_F (PLUR PLAYER.N)))
		(!R3 (?X_K COURT.N))
		(!R4 (?X_L BASKETBALL.N))
		(!R5 (?X AGENT.N))
	)
	(:STEPS
		(?X_B (?X_L (ON.P ?X_K)))
		(?X_J (?X_A (BE.V (TWO.D (PLUR TEAM.N)))))
		(?X_H ((EACH.D TEAM.N) (HAVE.V (FIVE.D (PLUR PLAYER.N)))))
		(?X_D (?X_F (TRY.V (KA (SHOOT.V ?X_E)))))
		(?E_1 (?X PLAY.14.V))
	)
)

; "Mary played basketball."
; "She did well on the court."
; "She scored many points."
; "She got injured while playing basketball."
(EPI-SCHEMA ((?X_N (WELL.ADV ((ADV-A (ON.P ?X_I)) PLAY.V))) ** ?E)
	(:ROLES
		(!R1 (?X_C (WHILE.P (KA (PLAY.V ?X_M)))))
		(!R2 (?X_F MANY.A))
		(!R3 (?X_F (PLUR POINT.N)))
		(!R4 (?X_I COURT.N))
		(!R5 (?X_L BASKETBALL.N))
		(!R6 (?X_M BASKETBALL.N))
		(!R7 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_K (?X_N PLAY.24.V))
		(?X_H (?X_N (WELL.ADV ((ADV-A (ON.P ?X_I)) DO.V))))
		(?X_E (?X_N (SCORE.V ?X_F)))
		(?X_B (?X_N (GET.V ?X_C)))
		(?E_1 (?X_N PLAY.25.V))
	)
)

; "Alice played basketball."
; "Her team lost."
; "She missed some shots."
(EPI-SCHEMA ((?X_J (LOSE.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR SHOT.N)))
		(!R2 (?X_F TEAM.N))
		(!R3 (?X_F (PERTAIN-TO ?X_J)))
		(!R4 (?X_I BASKETBALL.N))
		(!R5 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_E (?X_F LOSE.V))
		(?X_H (?X_J PLAY.26.V))
		(?X_B (?X_J (MISS.V ?X_C)))
	)
)



; "One time when I was little,"
; "I fell off my bike."
; "It hurt so bad."
; "I cried and cried."
; "Then I stopped crying because I knew that if I kept crying then I wouldn't be able to ride my bike ever again."
(EPI-SCHEMA ((?X_I (FALL_OFF.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_F (SO.ADV BAD.A)))
		(!R2 (?X_J BIKE.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_J (PERTAIN-TO ?X_I)))
		(!R5 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_H (?X_J (FALL_OFF.V ?X_J)))
		(?X_E (?X_A (HURT.V ?X_F)))
		(?X_B (?X_J CRY.1.V))
		(?X_C (?X_J CRY.V))
	)
)

; "Jake is four years old."
; "His sister is three years old."
; "Their mother has two other kids too."
; "Jake's mommy takes care of him all day."
(EPI-SCHEMA ((?X_I (((ADV-A (DURING.P ?X_H)) TAKE.V) ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_H SISTER.N))
		(!R2 (?X_F MOTHER.N))
		(!R3 (?X_F (PERTAIN-TO ?X_G)))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_I (PERTAIN-TO ?X_I)))
		(!R6 (?X_I MOMMY.N))
		(!R7 (?X_H (PERTAIN-TO ?X_I)))
		(!R8 (?X_J CARE.N))
		(!R9 (?X_J (OF.P ?X_K)))
	)
	(:STEPS
		(?X_E (?X_I (BE.V (KE ((FOUR.D (PLUR YEAR.N)) OLD.A)))))
		(?X_B (?X_H (BE.V (KE ((THREE.D (PLUR YEAR.N)) OLD.A)))))
		(?X_C (?X_F (HAVE.V (TWO.D (L X (AND (X OTHER.A) (X (PLUR KID.N))))))))
		(?X_M ((ADV-E ({DURING}.P (ALL.D DAY.N))) (?X_I (TAKE.V ?X_J))))
	)
)

; "Carrie fell off her bicycle."
; "She landed on her face."
; "She screamed for help."
; "Someone came over and helped Carrie."
(EPI-SCHEMA ((?X_H
              ((ADV-A (OFF.P (SET-OF ?X_I ?X_K)))
               ((ADV-A (ON.P ?X_J)) FALL.V)))
             ** ?E)
	(:ROLES
		(!R1 (?X_I BICYCLE.N))
		(!R2 (?X_J FACE.N))
		(!R3 (?X_E HELP.N))
		(!R4 (?X_H PERSON.N))
		(!R5 (?X_K AGENT.N))
		(!R6 (?X_I (PERTAIN-TO ?X_K)))
		(!R7 (?X_J (PERTAIN-TO ?X_K)))
	)
	(:STEPS
		(?X_A (?X_K (FALL_OFF.V ?X_I)))
		(?X_B (?X_K ((ADV-A (ON.P ?X_J)) LAND.V)))
		(?X_G (?X_K ((ADV-A (FOR.P ?X_E)) SCREAM.V)))
		(?X_C (?X_H COME_OVER.V))
		(?X_D (?X_H (HELP.V ?X_K)))
	)
)

; "Tom fell from a tree."
; "He landed on his head."
; "His neck was broken."
; "He couldn't move."
; "A doctor came."
(EPI-SCHEMA ((?X_G ((ADV-A (FROM.P (SET-OF ?X_D ?L2))) FALL.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E HEAD.N))
		(!R2 (?X_D TREE.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_E (PERTAIN-TO ?X_G)))
		(!R5 (?X_F (PERTAIN-TO ?X_G)))
		(!R6 (?X_H DOCTOR.N))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_C (?X_G ((ADV-A (FROM.P ?X_D)) FALL.V)))
		(?X_A (?X_G ((ADV-A (ON.P ?X_E)) LAND.V)))
		(E195.SK (NOT (?X_G (CAN.MD MOVE.V))))
		(?X_J (?X_H ((ADV-A (FROM.P ?L1)) COME.2.V) ?L2))
	)
)

; "A man saw a baby elephant."
; "He gave him some milk."
; "The baby drank the milk."
; "The baby ate some grass."
(EPI-SCHEMA ((?X_E (GIVE.V ?X_H ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_E MAN.N))
		(!R2 (?X_K MILK.N))
		(!R3 (?X_L GRASS.N))
		(!R4 (?X_H ELEPHANT.N))
		(!R5 (?X_H BABY.N))
		(!R6 (NOT (?X_K AGENT.N)))
		(!R7 (?X_L FOOD.N))
	)
	(:STEPS
		(?X_B (?X_E SEE.7.V ?X_H))
		(?X_D (?X_E (GIVE.8.V ?X_H ?X_K)))
		(?X_G (?X_H DRANK.9.V ?X_K))
		(?X_J (?X_H EAT.10.V ?X_L))
	)
)

; "'What do you think?' asked the teacher."
; "'I don't know,' said Jessica."
; "'Well, I'm going to tell you what I think,' said the teacher."
; "'That's okay,' said Jessica."
; "'I think that elephants are really smart.'"
; "'Why?' asked Jessica."
; "'Because they can learn new things.'"
; "'How?' asked Jessica."
; "'By listening to other people talk about them,' said the teacher."
; "'Oh,' said Jessica."
(EPI-SCHEMA ((?X_B (THINK.V (THAT (?X_C (REALLY.ADV SMART.A))))) ** ?E)
	(:ROLES
		(!R1 (?X_B TEACHER.N))
		(!R2 (?X_C (PLUR ELEPHANT.N)))
		(!R3 (?X_F AGENT.N))
	)
	(:STEPS
		(?X_E (?X_B (THINK.V (THAT (?X_C (REALLY.ADV SMART.A))))))
		(?X_H (?X_A (SAY.V ?X_F)))
	)
)

; "'I want to know all about elephants', said Tom."
; "'Tell me everything you can about elephants', said Lucy."
; "'Well, I'll tell you what I know', said Lucy."
; "'Elephants have tusks that grow from the tops of their heads'."
; "'Their ears stick straight out from the sides of their head'."
; "'An elephant's trunk is like a snake's tongue'."
; "'It can be as thick as a tree trunk or as thin as a pencil'."
; "'An elephant's legs are longer than a horse"
(EPI-SCHEMA ((?X_B (HAVE.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_B (PLUR ELEPHANT.N)))
		(!R2 (?X_A (PERTAIN-TO ?X_B)))
		(!R3 (?X_C (PLUR TUSK.N)))
		(!R4 (?X_F TRUNK.N))
		(!R5 (?X_F (PERTAIN-TO ?X_G)))
		(!R6 (?X_H TONGUE.N))
		(!R7 (?X_H (PERTAIN-TO ?X_I)))
	)
	(:STEPS
		(?X_E (?X_B (HAVE.V ?X_C)))
		(?X_K (?X_F ((ADV-A (LIKE.P ?X_H)) BE.V)))
	)
)

; "Alice saw an elephant."
; "She wondered what it ate."
; "She asked Alice's mom if she could go for a ride on an elephant."
(EPI-SCHEMA ((?X_K (WONDER.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_D ELEPHANT.N))
		(!R2 (?X_G MOM.N))
		(!R3 (?X_H ELEPHANT.N))
		(!R4 (?X_G (PERTAIN-TO ?X_K)))
		(!R5 (?X_L RIDE.N))
		(!R6 (?X_L (ON.P ?X_H)))
		(!R7 (?X_K AGENT.N))
		(!R8 (?X_L DESTINATION.N))
	)
	(:STEPS
		(?X_C (?X_K SEE.11.V ?X_D))
		(?X_F (?X_K WONDER.12.V (ANS-TO (?X_D (EAT.V ?X_A)))))
		(?X_J (?X_K ((ADV-A (FROM.P ?L1)) ASK.13.V) ?X_L))
	)
)

; "Alice saw some elephants on TV."
; "Elephants have tusks that grow from their heads."
; "They can kill other animals with them."
; "Alice wondered how they could do such things."
(EPI-SCHEMA ((?X_C (HAVE.V ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR ELEPHANT.N)))
		(!R2 (?X_G TV.N))
		(!R3 (?X_F (PLUR ELEPHANT.N)))
		(!R4 (?X_F (ON.P ?X_G)))
		(!R5 (?X_H OTHER.A))
		(!R6 (?X_K ?X_H (PLUR ANIMAL.N)))
		(!R7 (?X_M (PLUR TUSK.N)))
		(!R8 (?X_K (WITH.P ?X_M)))
		(!R9 (?X_L AGENT.N))
		(!R10 (?X_M OBJECT.N))
	)
	(:STEPS
		(?X_E (?X_L SEE.14.V ?X_F))
		(?X_J (?X_C HAVE.15.V ?X_M))
		(?X_B (?X_C ((CAN.AUX KILL.V) ?X_K)))
	)
)

; "Joe is an elephant."
; "His name is Joe."
; "He loves eating grass."
; "He chews on things."
; "He doesn't have any teeth."
(EPI-SCHEMA ((?X_K (LOVE.V (KA (EAT.V ?X_D)))) ** ?E)
	(:ROLES
		(!R1 (?X_E NAME.N))
		(!R2 (?X_D ELEPHANT.N))
		(!R3 (?X_E (PERTAIN-TO ?X_K)))
		(!R4 (?X_J GRASS.N))
		(!R5 ((KA (EAT.V ?X_J)) ACTION.N))
		(!R6 (?X_J FOOD.N))
		(!R7 ((ANY.D (PLUR TOOTH.N)) OBJECT.N))
		(!R8 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_C (?X_K (= ?X_D)))
		(?X_A (?X_E (= ?X_K)))
		(?X_G (?X_K LOVE.16.V (KA (EAT.V ?X_J))))
		(?E_1 (?X_K EAT.4.V ?X_J))
		(?X_I (?X_K HAVE.17.V (ANY.D (PLUR TOOTH.N))))
	)
)

; "An elephant is a large animal that lives on land."
; "Elephants can be found in Africa."
; "An elephant's skin is thick."
; "Elephants have trunks."
; "A baby elephant is called a calf."
(EPI-SCHEMA ((?X_H (HAVE.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_C CALF.N))
		(!R2 (?X_D BABY.N))
		(!R3 (?X_D ELEPHANT.N))
		(!R4 (?X_G (PLUR TRUNK.N)))
		(!R5 (?X_H (PLUR ELEPHANT.N)))
	)
	(:STEPS
		(?X_F (?X_H HAVE.18.V ?X_G))
		(?X_B (?X_D ((PASV CALL.V) ?X_C)))
	)
)



; "Mary was very happy."
; "She smiled and laughed every day."
; "One morning Mary woke up sad."
; "She cried all day long."
(EPI-SCHEMA ((?X_I SMILE.V) ** ?E)
	(:ROLES
		(!R1 (?X_E SAD.A))
		(!R2 (?X_F MORNING.N))
		(!R3 (?X_I (VERY.ADV HAPPY.A)))
		(!R4 (?N NOISE.N))
		(!R5 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_A (?X_I SMILE.V))
		(?X_B (?X_I LAUGH.1.V ?N))
		(?X_D ((ADV-E (DURING ?X_F)) (?X_I (WAKE_UP.V ?X_E))))
		(?X_H (?X_I CRY.2.V))
	)
)

; "Tom wanted to play baseball."
; "He played on a team."
; "His friends were there too."
; "A lot of fun happened."
(EPI-SCHEMA ((?X_L (((ADV-A (WITH.P ?X_I)) PLAY.V) ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_D LOT.N))
		(!R2 (?X_D (OF.P ?X_E)))
		(!R3 (?X_I (PLUR FRIEND.N)))
		(!R4 (?X_H BASEBALL.N))
		(!R5 (?X_I (PERTAIN-TO ?X_L)))
		(!R6 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_G (?X_L (WANT.V (KA (PLAY.V ?X_H)))))
		(?E_1 (?X_L PLAY.3.V))
		(?X_K (?X_L PLAY.4.V))
		(?X_A (?X_I (TOO.ADV (THERE.ADV BE.V))))
		(?X_C (?X_D HAPPEN.V))
	)
)

; "Mary is happy."
; "She smiles and laughs."
; "She cries sometimes."
(EPI-SCHEMA ((?X_E (COMPOSITE-SCHEMA.PR ?N)) ** ?E)
	(:ROLES
		(!R1 (?X_E HAPPY.A))
		(!R2 (?X_E AGENT.N))
		(!R3 (?N NOISE.N))
	)
	(:STEPS
		(?X_A (?X_E SMILE.V))
		(?X_B (?X_E LAUGH.V))
		(?X_D (?X_E CRY.5.V ?N))
	)
)

; "Tom's friend is sad."
; "He cries sometimes."
; "His mother doesn't know why he is sad."
(EPI-SCHEMA ((?X_E ((ADV-A (IN.P ?X_C)) CRY_OUT.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_D MOTHER.N))
		(!R3 (?X_E SAD.A))
		(!R4 (?X_E FRIEND.N))
		(!R5 (?X_E (PERTAIN-TO ?X_C)))
		(!R6 (?X_D (PERTAIN-TO ?X_E)))
		(!R7 (?N NOISE.N))
	)
	(:STEPS
		(?X_B (?X_E CRY.6.V ?N))
	)
)

; "Mary was sad."
; "She felt bad."
; "She missed her best friend."
(EPI-SCHEMA ((?X_E (MISS.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B BAD.A))
		(!R2 (?X_E SAD.A))
		(!R3 (?X_E AGENT.N))
		(!R4 (?X_F (PERTAIN-TO ?X_E)))
		(!R5 (?X_F ?X_G FRIEND.N))
	)
	(:STEPS
		(?X_D (?X_E (FEEL.V ?X_B)))
		(?X_A (?X_E (MISS.V ?X_F)))
	)
)

; "Tom felt sad."
; "He was sad because he lost a baseball game."
; "He was sad because he was mad at himself."
; "He was sad because he thought that he would never play again."
(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA.PR ?X_A ?X_D ?X_E ?X_I ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_A SAD.A))
		(!R2 (?X_D SAD.A))
		(!R3 (?X_E (BECAUSE.P (KE (?X_K (LOSE.V ?X_F))))))
		(!R4 (?X_K AGENT.N))
		(!R5 (?X_I SAD.A))
		(!R6 (?X_J (BECAUSE.P (KE (?X_K ((ADV-A (AT.P ?X_K)) MAD.A))))))
	)
	(:STEPS
		(?X_C (?X_K (FEEL.V ?X_A)))
		(?X_H (?X_K (BE.V ?X_D ?X_E)))
		(?X_M (?X_K (BE.V ?X_I ?X_J)))
	)
)

; "Mary is sad."
; "She cries often."
; "She gets upset easily."
(EPI-SCHEMA ((?X_C CRY.V) ** ?E)
	(:ROLES
		(!R1 (?X_C SAD.A))
		(!R2 (?X_C AGENT.N))
		(!R3 (?N NOISE.N))
	)
	(:STEPS
		(?X_B (?X_C CRY.7.V ?N))
	)
)

; "Mary was sad one day."
; "She felt blue."
; "She cried."
; "She was sad."
(EPI-SCHEMA ((?X_F CRY.V) ** ?E)
	(:ROLES
		(!R1 (?X_C BLUE.A))
		(!R2 (?X_F SAD.A))
		(!R3 (?X_F AGENT.N))
	)
	(:STEPS
		(?X_B (?X_F (FEEL.V ?X_C)))
		(?X_E (?X_F CRY.8.V))
	)
)

; "Mary was crying."
; "She was sad."
; "She felt bad."
; "She was sad because she lost something."
(EPI-SCHEMA ((?X_E CRY.V) ** ?E)
	(:ROLES
		(!R1 (?X_C (BECAUSE.P (KE (?X_K (LOSE.V ?X_D))))))
		(!R2 (?X_E SAD.A))
		(!R3 (?X_H BAD.A))
		(!R4 (?X_K SAD.A))
		(!R5 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_J (?X_K CRY.9.V))
		(?X_G (?X_K (FEEL.V ?X_H)))
		(?X_B (?X_K (BE.V ?X_E ?X_C)))
	)
)

; "'I'm so glad you're here', said Tom."
; "'You can help me with my homework.'"
; "'I'll do anything for you,' said Jack."
; "'I love you', said Jenny."
; "'How's your mother?' asked Alan.<|endoftext|>"
(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA.PR ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_A (PERTAIN-TO ?X_B)))
		(!R2 (?X_C HOMEWORK.N))
		(!R3 (?X_D AGENT.N))
		(!R4 (?X_C (PERTAIN-TO ?X_D)))
	)
	(:STEPS
		(?X_F (?X_B ((CAN.AUX ((ADV-A (WITH.P ?X_C)) HELP.V)) ?X_D)))
	)
)

; "John was playing basketball."
; "His team won."
(EPI-SCHEMA ((?X_G ((ADV-A (WITH.P ?X_F)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F TEAM.N))
		(!R2 (?X_E BASKETBALL.N))
		(!R3 (?X_F (PERTAIN-TO ?X_G)))
		(!R4 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_B (?X_F WIN.V))
		(?X_D (?X_G PLAY.10.V))
	)
)

; "Jane watched basketball on TV."
; "She liked watching basketball games."
; "She looked forward to the next game."
; "This is the best sport she knows."
(EPI-SCHEMA ((?X_O (WATCH.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C ?X_D SPORT.N))
		(!R2 (?X_E {REF}.N))
		(!R3 (?X_H NEXT.A))
		(!R4 (?X_H GAME.N))
		(!R5 (?X_K BASKETBALL.N))
		(!R6 (?X_L TV.N))
		(!R7 (?X_P BASKETBALL.N))
		(!R8 (?X_O AGENT.N))
		(!R9 ((KA (WATCH.V ?X_P)) ACTION.N))
	)
	(:STEPS
		(?X_J (?X_O (((ADV-A (ON.P ?X_L)) WATCH.V) ?X_K)))
		(?X_N (?X_O LIKE.11.V (KA (WATCH.V ?X_P))))
		(?X_G (?X_O ((ADV-A (TO.P ?X_H)) LOOK_FORWARD.V)))
		(?X_B (?X_E (= ?X_C)))
	)
)

; "Joe played basketball."
; "His team lost."
; "He missed a shot."
(EPI-SCHEMA ((?X_J ((ADV-A (FOR.P (KA (THEN.ADV PLAY.V)))) LOSE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C SHOT.N))
		(!R2 (?X_F TEAM.N))
		(!R3 (?X_F (PERTAIN-TO ?X_J)))
		(!R4 (?X_I BASKETBALL.N))
		(!R5 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_E (?X_F LOSE.V))
		(?X_H (?X_J PLAY.12.V))
		(?X_B (?X_J (MISS.V ?X_C)))
	)
)

; "Tom played basketball."
; "His team won."
; "He scored points for his team."
(EPI-SCHEMA ((?X_F (PLAY.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_B (PLUR POINT.N)))
		(!R2 (?X_F AGENT.N))
		(!R3 (?X_E TEAM.N))
		(!R4 (?X_E (PERTAIN-TO ?X_F)))
		(!R5 (?X_I BASKETBALL.N))
		(!R6 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_D (?X_E WIN.V))
		(?X_H (?X_J PLAY.13.V))
		(?X_A (?X_F (((ADV-A (FOR.P ?X_E)) SCORE.V) ?X_B)))
	)
)

; "Tom played basketball."
; "He scored a basket."
; "He missed a shot."
; "He lost the game."
(EPI-SCHEMA ((?X_J (PLAY.V ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_C GAME.N))
		(!R2 (?X_F SHOT.N))
		(!R3 (?X_I BASKET.N))
		(!R4 (?X_J AGENT.N))
		(!R5 (?X_M BASKETBALL.N))
		(!R6 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_L (?X_N PLAY.14.V))
		(?X_H (?X_J (SCORE.V ?X_I)))
		(?X_E (?X_J (MISS.V ?X_F)))
		(?X_B (?X_J (LOSE.V ?X_C)))
	)
)

; "A boy named John played basketball."
; "He played for his school team."
; "He scored lots of points."
; "He lost the game."
(EPI-SCHEMA ((?X_O (PLAY.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_D GAME.N))
		(!R2 (?X_G (PLUR LOT.N)))
		(!R3 (?X_G (OF.P ?X_H)))
		(!R4 (?X_K BASKETBALL.N))
		(!R5 (?X_L BOY.N))
		(!R6 (?X_M (PERTAIN-TO ?X_O)))
		(!R7 (?X_N SCHOOL.N))
		(!R8 (?X_M ?X_N TEAM.N))
		(!R9 (?X AGENT.N))
		(!R10 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_J (?X_L (NAME.V (THT (?X_O (PLAY.V ?X_K))))))
		(?E_1 (?X PLAY.15.V))
		(?X_A (?X_O PLAY.16.V))
		(?X_F (?X_O (SCORE.V ?X_G)))
		(?X_C (?X_O (LOSE.V ?X_D)))
	)
)

; "Mark played basketball."
; "His team lost."
; "He wasn't happy because they lost."
(EPI-SCHEMA ((?X_H (LOSE.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_C (BECAUSE.P (KE (?X_G LOSE.V)))))
		(!R2 (NOT (?X_D HAPPY.A)))
		(!R3 (?X_H AGENT.N))
		(!R4 (?X_G TEAM.N))
		(!R5 (?X_G AGENT.N))
		(!R6 (?X_G (PERTAIN-TO ?X_H)))
		(!R7 (?X_K BASKETBALL.N))
		(!R8 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_F (?X_G LOSE.V))
		(?X_J (?X_L PLAY.17.V))
		(?X_B (?X_H (BE.V ?X_D ?X_C)))
	)
)

; "Tom played basketball."
; "His team lost."
; "He missed some shots."
; "He could have scored points."
(EPI-SCHEMA ((?X_J LOSE.V) ** ?E)
	(:ROLES
		(!R1 (?X_A (IMPINGES-ON ?X_B)))
		(!R2 (?X_C (PLUR POINT.N)))
		(!R3 (?X_F (PLUR SHOT.N)))
		(!R4 (?X_J AGENT.N))
		(!R5 (?X_I TEAM.N))
		(!R6 (?X_I (PERTAIN-TO ?X_J)))
		(!R7 (?X_M BASKETBALL.N))
		(!R8 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_H (?X_I LOSE.V))
		(?X_A (?X_J ((CAN.MD HAVE.V) (KA (SCORE.V ?X_C)))))
		(?X_L (?X_N PLAY.18.V))
		(?X_E (?X_J (MISS.V ?X_F)))
	)
)

; "Billy played basketball."
; "His team lost."
; "He was upset."
(EPI-SCHEMA ((?X_H LOSE.V) ** ?E)
	(:ROLES
		(!R1 (?X_C TEAM.N))
		(!R2 (?X_C (PERTAIN-TO ?X_D)))
		(!R3 (?X_G BASKETBALL.N))
		(!R4 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_B (?X_C LOSE.V))
		(?X_F (?X_H PLAY.19.V))
	)
)



; "Tom played on the playground."
; "There were many children there."
; "Tom's friends came too."
; "His friends played games."
; "Tom played with them."
(EPI-SCHEMA ((?X_J ((ADV-A (WITH.P (ANOTHER.D PERSON.N))) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR GAME.N)))
		(!R2 (?X_G (PLUR FRIEND.N)))
		(!R3 (?X_G (PERTAIN-TO ?X_J)))
		(!R4 (?X_J AGENT.N))
		(!R5 (?Y ENTITY.N))
	)
	(:STEPS
		(?X_I (?X_J PLAY.6.V ?Y))
		(?X_F (?X_G (TOO.ADV COME.V)))
		(?X_A (?X_G (PLAY.V ?X_D)))
		(?X_C (?X_J ((ADV-A (WITH.P ?X_G)) PLAY.V)))
	)
)

; "John was walking along."
; "He saw a squirrel."
; "He chased after the squirrel."
; "The squirrel ran into a tree."
; "The squirrel climbed the tree."
; "The squirrel sat on a branch."
(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA.PR ?L2 ?X_D ?X_P)) ** ?E)
	(:ROLES
		(!R1 (?X_C BRANCH.N))
		(!R2 (?X_D SQUIRREL.N))
		(!R3 (?X_P TREE.N))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_O AGENT.N))
		(!R6 (?X_P DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_O ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_H (?X_O SEE.7.V ?X_D))
		(?X_J (?X_O CHASE.8.V ?X_D))
		(?X_L (?X_D ((ADV-A (FROM.P ?L1)) RUN.9.V) ?X_P))
		(?X_N (?X_D ((ADV-A (FROM.P ?L1)) CLIMB.10.V) ?X_P))
		(?X_B (?X_D ((ADV-A (ON.P ?X_C)) SIT.V)))
	)
)

; "The man walked into the park."
; "He saw a squirrel."
; "He chased after the squirrel."
; "The squirrel ran away."
; "The man caught up to the squirrel."
; "The squirrel jumped over a fence."
(EPI-SCHEMA ((?X_C (CHASE.V ?X_O)) ** ?E)
	(:ROLES
		(!R1 (?X_C SQUIRREL.N))
		(!R2 (?X_D MAN.N))
		(!R3 (?X_O PARK.N))
		(!R4 (?X_O DESTINATION.N))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_D ((ADV-A (FROM.P ?L1)) WALK.11.V) ?X_O))
		(?X_H (?X_D SEE.12.V ?X_C))
		(?X_J (?X_D CHASE.13.V ?X_C))
		(?X_L (?X_C ((ADV-A (FROM.P ?L1)) RUN_AWAY.4.V) ?L2))
		(?X_B (?X_D ((ADV-A (TO.P ?X_C)) CATCH_UP.V)))
		(?X_N (?X_C ((ADV-A (FROM.P ?L1)) JUMP.5.V) ?L2))
	)
)

; "Tommy liked to play in the park."
; "There were lots of kids there."
; "Tommy played basketball."
; "Tommy's friends came too."
(EPI-SCHEMA ((?X_N ((ADV-A (IN.P ?X_M)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_L (PLUR FRIEND.N)))
		(!R2 (?X_F (PLUR LOT.N)))
		(!R3 (?X_M PARK.N))
		(!R4 (?X_K BASKETBALL.N))
		(!R5 (?X_L (PERTAIN-TO ?X_N)))
		(!R6 ((KA ((ADV-A (IN.P ?X_M)) PLAY.V)) ACTION.N))
		(!R7 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_H (?X_N LIKE.14.V (KA ((ADV-A (IN.P ?X_M)) PLAY.V))))
		(?X_E (?X_A (BE.V ?X_F)))
		(?X_J (?X_N PLAY.15.V))
		(?X_C (?X_L (TOO.ADV COME.V)))
	)
)

; "Joe was walking down the street."
; "He saw some bushes."
; "He climbed over the bushes."
; "He found an old tire."
(EPI-SCHEMA ((?X_K ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR BUSH.N)))
		(!R2 (?X_H OLD.A))
		(!R3 (?X_H TIRE.N))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_B (?X_K ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_D (?X_K SEE.16.V ?X_E))
		(?X_G (?X_K ((ADV-A (FROM.P ?L1)) CLIMB.17.V) ?L2))
		(?X_J (?X_K FIND.18.V ?X_H))
	)
)

; "Alice was walking on the street."
; "There were many cars parked along the road."
; "She looked both ways before crossing the street."
; "She crossed the street safely."
(EPI-SCHEMA ((?X_L ((SAFELY.ADV CROSS.V) ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_M STREET.N))
		(!R2 (?X_J (ALONG.P ?X_M)))
		(!R3 (?X_K MANY.A))
		(!R4 (?X_J ?X_K (PLUR CAR.N)))
		(!R5 (?X_L AGENT.N))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?X_M LOCATION.N))
		(!R8 ((K MANY.A) ENTITY.N))
		(!R9 (?X AGENT.N))
	)
	(:STEPS
		(?X_I (?X_L ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_G (?X_A (BE.V ?X_J)))
		(?X_E
   (?X_L
    (((ADV-A (BEFORE.P (KA (CROSS.V ?X_M)))) LOOK.V) (BOTH.D (PLUR WAY.N)))))
		(?X_C (?X_L ((SAFELY.ADV CROSS.V) ?X_M)))
		(?E_1 (?X PARK.19.V (K MANY.A) ?X_M))
	)
)

; "Alice fell on the ground."
; "There were some rocks there."
; "She hurt herself."
; "She broke her arm."
(EPI-SCHEMA ((?X_H FALL.V) ** ?E)
	(:ROLES
		(!R1 (?X_B GROUND.N))
		(!R2 (?X_H AGENT.N))
		(!R3 (?X_G ARM.N))
		(!R4 (?X_G (PERTAIN-TO ?X_H)))
	)
	(:STEPS
		(?X_D (?X_H ((ADV-A (ON.P ?X_B)) FALL.V)))
		(?X_F (?X_H (HURT.V ?X_H)))
		(?X_A (?X_H (BREAK.V ?X_G)))
	)
)

; "Sally liked nuts."
; "She ate nuts on the ground."
; "She found some nuts under a tree."
; "She put them in her pocket."
(EPI-SCHEMA ((?X_L (EAT.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_J (PLUR NUT.N)))
		(!R2 (?X_D (PLUR NUT.N)))
		(!R3 (?X_I (PLUR NUT.N)))
		(!R4 (?X_K POCKET.N))
		(!R5 (?X_K (PERTAIN-TO ?X_L)))
		(!R6 (NOT (?X_J ACTION.N)))
		(!R7 (NOT (?X_J AGENT.N)))
		(!R8 (?X_K LOCATION.N))
		(!R9 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_C (?X_L LIKE.21.V ?X_J))
		(?X_F (?X_L EAT.22.V ?X_D))
		(?X_H (?X_L FIND.18.V ?X_I))
		(?X_A (?X_L PUT.23.V ?X_I ?X_K))
	)
)

; "Tom's car broke down."
; "He called AAA."
; "AAA sent someone to fix it."
; "Tom waited for them."
(EPI-SCHEMA ((?X_H (CALL.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_G CAR.N))
		(!R2 (?X_D AAA.A))
		(!R3 (?X_H AGENT.N))
		(!R4 (?X_G (PERTAIN-TO ?X_H)))
	)
	(:STEPS
		(?X_C (?X_G BREAK_DOWN.V))
		(?X_F (?X_H (CALL.V ?X_D)))
		(?X_J (?X_H ((ADV-A (FOR.P ?X_A)) WAIT.V)))
	)
)

; "Tom's car broke down."
; "Tom called AAA."
; "AAA sent someone to fix Tom's car."
; "AAA sent an ambulance too."
(EPI-SCHEMA ((?X_D (CALL.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_C CAR.N))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_C (PERTAIN-TO ?X_D)))
		(!R4 (?X_E AAA.A))
	)
	(:STEPS
		(?X_B (?X_C BREAK_DOWN.V))
		(?X_G (?X_D (CALL.V ?X_E)))
	)
)

; "Tommy's car broke down."
; "He called AAA for help."
; "AAA sent someone to fix his car."
; "Tommy waited outside."
(EPI-SCHEMA ((?X_H (CALL.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_G CAR.N))
		(!R2 (?X_C AAA.A))
		(!R3 (?X_C (FOR.P ?X_D)))
		(!R4 (?X_H AGENT.N))
		(!R5 (?X_G (PERTAIN-TO ?X_H)))
	)
	(:STEPS
		(?X_B (?X_G BREAK_DOWN.V))
		(?X_F (?X_H (CALL.V ?X_C)))
		(?X_J (?X_H (OUTSIDE.ADV WAIT.V)))
	)
)

; "Tom's car broke down."
; "He called AAA."
; "An AAA truck came by."
; "Tom drove away on the tow truck."
(EPI-SCHEMA ((?X_K (CALL.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C AAA.A))
		(!R2 (?X_C TRUCK.N))
		(!R3 (?X_F AAA.A))
		(!R4 (?X_L CAR.N))
		(!R5 (?X_L (PERTAIN-TO ?X_K)))
		(!R6 (?X_K AGENT.N))
		(!R7 (?X_L LOCATION.N))
		(!R8 (NOT (?X_L = ?L2)))
		(!R9 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_H (?X_L BREAK_DOWN.V))
		(?X_E (?X_K (CALL.V ?X_F)))
		(?X_B (?X_C COME_BY.V))
		(?X_J (?X_K ((ADV-A (FROM.P ?X_L)) DRIVE_AWAY.24.V) ?L2))
	)
)



; "The man had a bad dream."
; "He woke up in a sweat."
; "He looked around."
; "There was no one there."
(EPI-SCHEMA ((?X_F ((ADV-A (IN.P ?X_C)) WAKE_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_B BAD.A))
		(!R2 (?X_B DREAM.N))
		(!R3 (?X_C SWEAT.N))
		(!R4 (?X_F MAN.N))
	)
	(:STEPS
		(?X_A (?X_F (HAVE.V ?X_B)))
		(?X_E (?X_F ((ADV-A (IN.P ?X_C)) WAKE_UP.V)))
		(?X_H (?X_F (AROUND.ADV LOOK.V)))
	)
)

; "Tom dreamed that he played baseball."
; "He felt good about himself."
; "He ran fast on the field."
; "He scored many points."
(EPI-SCHEMA ((?X_L ((ADV-A (OF.P (KA (PLAY.V ?X_H)))) DREAM.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C MANY.A))
		(!R2 (?X_C (PLUR POINT.N)))
		(!R3 (?X_I GOOD.A))
		(!R4 (?X_H BASEBALL.N))
		(!R5 (?X_I (ABOUT.P ?X_L)))
		(!R6 (?X AGENT.N))
		(!R7 (?X_L AGENT.N))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_G (?X_L (DREAM.V (THAT (?X_L (PLAY.V ?X_H))))))
		(?X_E (?X_L (FEEL.V ?X_I)))
		(?E_1 (?X PLAY.1.V))
		(?X_K (?X_L ((ADV-A (FROM.P ?L1)) RUN.2.V) ?L2))
		(?X_B (?X_L (SCORE.V ?X_C)))
	)
)

; "Tom was having a nightmare."
; "His eyes were open."
; "He could hear someone talking."
; "Someone came into his room."
(EPI-SCHEMA ((?X_I ((ADV-A (IN.P ?X_I)) TALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_B PERSON.N))
		(!R2 (?X_E NIGHTMARE.N))
		(!R3 (?X_H AGENT.N))
		(!R4 (?X_F (PLUR EYE.N)))
		(!R5 (?X_F OPEN.A))
		(!R6 (?X_F (PERTAIN-TO ?X_H)))
		(!R7 (?X_G PERSON.N))
		(!R8 (?X_I ROOM.N))
		(!R9 (?X_I (PERTAIN-TO ?X_H)))
		(!R10 (?X_I DESTINATION.N))
	)
	(:STEPS
		(?X_D (?X_H (HAVE.V ?X_E)))
		(E61.SK (?X_B TALK.V))
		(E64.SK (?X_H ((CAN.MD HEAR.V) ?X_B)))
		(?X_A (?X_G ((ADV-A (FROM.P ?L1)) COME.3.V) ?X_I))
	)
)

; "Tom has a lot of nightmares."
; "He wakes up screaming."
; "He is afraid of monsters."
(EPI-SCHEMA ((?X_F (HAVE.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B LOT.N))
		(!R2 (?X_B (OF.P ?X_C)))
		(!R3 (?X_F AGENT.N))
		(!R4 (?X_I AFRAID.A))
		(!R5 (?X_I MALE.A))
		(!R6 (?X_I AGENT.N))
		(!R7 (?X_J (PLUR MONSTER.N)))
	)
	(:STEPS
		(?X_E (?X_F (HAVE.V ?X_B)))
		(?X_H (?X_F ((ADV-A (FOR.P (KA SCREAM.V))) WAKE_UP.V)))
		(?X_A (?X_I (OF.P ?X_J)))
	)
)

; "Tom dreamed that he played baseball."
; "He had a good game."
; "He hit a long drive."
; "He made a run and won the game."
(EPI-SCHEMA ((?X_L ((ADV-A (OF.P (KA (PLAY.V ?X_C)))) DREAM.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C BASEBALL.N))
		(!R2 (?X_H LONG.A))
		(!R3 (?X_H DRIVE.N))
		(!R4 (?X_K RUN.N))
		(!R5 (?X_L AGENT.N))
		(!R6 (?X_M GOOD.A))
		(!R7 (?X_M GAME.N))
		(!R8 (?X AGENT.N))
	)
	(:STEPS
		(?X_E (?X_L (DREAM.V (THAT (?X_L (PLAY.V ?X_C))))))
		(?X_G (?X_L (HAVE.V ?X_M)))
		(?X_J (?X_L (HIT.V ?X_H)))
		(?X_A (?X_L (MAKE.V ?X_K)))
		(?X_B (?X_L (WIN.V ?X_M)))
		(?E_1 (?X PLAY.1.V))
	)
)

; "Tom dreamed that he played baseball."
; "He had a good game."
; "He hit a long drive."
; "He made a run and won the game."
(EPI-SCHEMA ((?X_L ((ADV-A (OF.P (KA (PLAY.V ?X_C)))) DREAM.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C BASEBALL.N))
		(!R2 (?X_H LONG.A))
		(!R3 (?X_H DRIVE.N))
		(!R4 (?X_K RUN.N))
		(!R5 (?X_L AGENT.N))
		(!R6 (?X_M GOOD.A))
		(!R7 (?X_M GAME.N))
		(!R8 (?X AGENT.N))
	)
	(:STEPS
		(?X_E (?X_L (DREAM.V (THAT (?X_L (PLAY.V ?X_C))))))
		(?X_G (?X_L (HAVE.V ?X_M)))
		(?X_J (?X_L (HIT.V ?X_H)))
		(?X_A (?X_L (MAKE.V ?X_K)))
		(?X_B (?X_L (WIN.V ?X_M)))
		(?E_1 (?X PLAY.1.V))
	)
)

; "Tom had a bad dream."
; "He woke up in a sweat."
; "He looked around."
; "There was nobody there."
(EPI-SCHEMA ((?X_G (HAVE.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A BAD.A))
		(!R2 (?X_A DREAM.N))
		(!R3 (?X_D SWEAT.N))
		(!R4 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_C (?X_G (HAVE.V ?X_A)))
		(?X_F (?X_G ((ADV-A (IN.P ?X_D)) WAKE_UP.V)))
		(?X_I (?X_G (AROUND.ADV LOOK.V)))
	)
)

; "Tom dreamed that he was throwing a baseball."
; "He threw a great pitch."
; "He hit a homerun."
; "He was up to bat again."
; "He hit a long drive."
; "He made a run and won the game."
(EPI-SCHEMA ((?X_S (DREAM.V (THAT (?X_S (THROW.V ?X_C))))) ** ?E)
	(:ROLES
		(!R1 (?X_C BASEBALL.N))
		(!R2 (?X_F GREAT.A))
		(!R3 (?X_F PITCH.N))
		(!R4 (?X_I HOMERUN.N))
		(!R5 (?X_L BAT.N))
		(!R6 (?X_O LONG.A))
		(!R7 (?X_O DRIVE.N))
		(!R8 (?X_R RUN.N))
		(!R9 (?X_S AGENT.N))
		(!R10 (?X_T GAME.N))
	)
	(:STEPS
		(?X_E (?X_S (DREAM.V (THAT (?X_S (THROW.V ?X_C))))))
		(?X_H (?X_S (THROW.V ?X_F)))
		(?X_K (?X_S (HIT.V ?X_I)))
		(?X_N (?X_S (AGAIN.ADV ((ADV-A (TO.P ?X_L)) (UP.ADV BE.V)))))
		(?X_Q (?X_S (HIT.V ?X_O)))
		(?X_A (?X_S (MAKE.V ?X_R)))
		(?X_B (?X_S (WIN.V ?X_T)))
	)
)



; "Sandy and Jack were playing with toys."
; "Jack made Sandy fall down."
; "Sandy cried."
; "Jack laughed."
(EPI-SCHEMA ((?X_G CRY.V) ** ?E)
	(:ROLES
		(!R1 (?X_B (PLUR TOY.N)))
		(!R2 ((SET-OF ?X_G ?X_H) AGENT.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_H AGENT.N))
		(!R5 (?N NOISE.N))
	)
	(:STEPS
		(?X_A ((SET-OF ?X_G ?X_H) PLAY.1.V))
		(?X_D (?X_G CRY.2.V ?N))
		(?X_F (?X_H LAUGH.3.V ?N))
	)
)

; "Kate played with dolls."
; "She had lots of them."
; "She gave some away."
(EPI-SCHEMA ((?X_H ((ADV-A (WITH.P ?X_C)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR DOLL.N)))
		(!R2 (?X_G (PLUR LOT.N)))
		(!R3 (?X_G (OF.P ?X_F)))
		(!R4 (?X_G OBJECT.N))
		(!R5 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_B (?X_H PLAY.6.V ?X_C))
		(?X_E (?X_H HAVE.7.V ?X_G))
	)
)

; "Sandy fell over while she was playing."
; "She hurt herself."
; "She cried."
; "Jack laughed."
(EPI-SCHEMA ((?X_J FALL_OVER.V) ** ?E)
	(:ROLES
		(!R1 (?X_E (WHILE.P (KE (?X_K PLAY.V)))))
		(!R2 (?X_J AGENT.N))
		(!R3 (?X_K AGENT.N))
		(!R4 (?X_L AGENT.N))
		(!R5 (?N NOISE.N))
	)
	(:STEPS
		(?X_D (?X_J FALL_OVER.8.V))
		(?X_B (?X_K (HURT.V ?X_K)))
		(?X_G (?X_K CRY.9.V))
		(?X_I (?X_L LAUGH.10.V ?N))
	)
)

; "Alice played on the playground."
; "She climbed all over the slide."
; "She ran around the swings."
; "She jumped into the sandbox."
(EPI-SCHEMA ((?X_M ((ADV-A (WITH.P ?Y)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C SANDBOX.N))
		(!R2 (?X_F (PLUR SWING.N)))
		(!R3 (?X_G FEMALE.A))
		(!R4 (?X_G AGENT.N))
		(!R5 (?Y ENTITY.N))
		(!R6
   ((ALL.D (L X (AND (X (PLUR {REF}.N)) (X (OVER.P (THE.D SLIDE.N))))))
    DESTINATION.N))
		(!R7 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_I (?X_M PLAY.11.V ?Y))
		(?X_K
   (?X_M ((ADV-A (FROM.P ?L1)) CLIMB.12.V)
    (ALL.D (L X (AND (X (PLUR {REF}.N)) (X (OVER.P (THE.D SLIDE.N))))))))
		(?X_E (?X_G ((ADV-A (AROUND.P ?X_F)) RUN.V)))
		(?X_B (?X_G ((ADV-A (INTO.P ?X_C)) JUMP.V)))
	)
)

; "Dan played with his friend Tom."
; "Tom threw Dan's toy car into the air."
; "Dan caught the car before it fell."
; "Dan threw the car back into the air."
; "Tom caught the car again."
(EPI-SCHEMA ((?X_L ((ADV-A (WITH.P ?X_L)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_B AIR.N))
		(!R2 (?X_E (BEFORE.P (KE (?X_L FALL.V)))))
		(!R3 (?X_M AGENT.N))
		(!R4 (?X_H AIR.N))
		(!R5 (?X_K FRIEND.N))
		(!R6 (?X_K (PERTAIN-TO ?X_M)))
		(!R7 (?X_L TOY.N))
		(!R8 (?X_L CAR.N))
		(!R9 (?X_L (PERTAIN-TO ?X_M)))
	)
	(:STEPS
		(?X_A (?X_M ((ADV-A (WITH.P ?X_K)) PLAY.V)))
		(?X_D (?X_K (((ADV-A (INTO.P ?X_B)) THROW.V) ?X_L)))
		(?X_G (?X_M (CATCH.V ?X_L ?X_E)))
		(?X_J (?X_M (((ADV-A (INTO.P ?X_H)) (BACK.ADV THROW.V)) ?X_L)))
		(?X_O (?X_K ((AGAIN.ADV CATCH.V) ?X_L)))
	)
)

; "Sandy liked playing with toys."
; "She played with all kinds of toys."
; "She played with dolls."
; "She played with cars."
; "She played with blocks."
; "She played with trucks."
(EPI-SCHEMA ((?X_T
              (COMPOSITE-SCHEMA.PR (KA ((ADV-A (WITH.P ?X_S)) PLAY.V))
               (ALL.D (L X (AND (X (PLUR KIND.N)) (X (OF.P ?X_O))))) ?X_R))
             ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR TRUCK.N)))
		(!R2 (?X_G (PLUR BLOCK.N)))
		(!R3 (?X_J (PLUR CAR.N)))
		(!R4 (?X_S (PLUR TOY.N)))
		(!R5 (?X_O (PLUR TOY.N)))
		(!R6 (?X_R (PLUR DOLL.N)))
		(!R7 ((KA ((ADV-A (WITH.P ?X_S)) PLAY.V)) ACTION.N))
		(!R8 (?X_T AGENT.N))
	)
	(:STEPS
		(?X_L (?X_T LIKE.13.V (KA ((ADV-A (WITH.P ?X_S)) PLAY.V))))
		(?X_N (?X_T PLAY.14.V (ALL.D (L X (AND (X (PLUR KIND.N)) (X (OF.P ?X_O)))))))
		(?X_Q (?X_T PLAY.15.V ?X_R))
		(?X_I (?X_T ((ADV-A (WITH.P ?X_J)) PLAY.V)))
		(?X_F (?X_T ((ADV-A (WITH.P ?X_G)) PLAY.V)))
		(?X_C (?X_T ((ADV-A (WITH.P ?X_D)) PLAY.V)))
	)
)

; "Jack played with Sandy's toys."
; "They were fun."
; "Jack threw them away."
(EPI-SCHEMA ((?X_H ((ADV-A (WITH.P ?X_H)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E FUN.N))
		(!R2 (?X_H (PLUR TOY.N)))
		(!R3 (?X_H AGENT.N))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_H (PERTAIN-TO ?X_I)))
		(!R6 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_G (?X_J PLAY.16.V ?X_H))
		(?X_D (?X_H (= ?X_E)))
		(?X_B (?X_J ((AWAY.ADV THROW.V) ?X_H)))
	)
)

; "Sandy's mom put away all of their toys."
; "She didn't want them to play with toys anymore."
; "Sandy's dad said that she could have some toys again."
; "She played with her dolls."
(EPI-SCHEMA ((?X_M
              (PUT_AWAY.V
               (ALL.D
                (L X
                 (AND (X (PLUR {REF}.N))
                      (THE Y (AND (Y (PLUR TOY.N)) (Y (PERTAIN-TO THEY.PRO)))
                           (X (OF.P Y))))))))
             ** ?E)
	(:ROLES
		(!R1 (?X_H (PLUR TOY.N)))
		(!R2 (?X_I DAD.N))
		(!R3 (?X_I (PERTAIN-TO ?X_S)))
		(!R4 (?X_L (PLUR TOY.N)))
		(!R5 (?X_M FEMALE.A))
		(!R6 (?X_M AGENT.N))
		(!R7 (?X_P AGENT.N))
		(!R8 (?X_Q MOM.N))
		(!R9 (?X_Q (PERTAIN-TO ?X_S)))
		(!R10 (?X_R (PLUR DOLL.N)))
		(!R11 (?X_R (PERTAIN-TO ?X_S)))
		(!R12 (?X_S AGENT.N))
	)
	(:STEPS
		(?X_O
   (?X_Q PUT_AWAY.17.V
    (ALL.D
     (L X
      (AND (X (PLUR {REF}.N))
           (?X_A ?X_C (AND (?X_C (PLUR TOY.N)) (?X_C (PERTAIN-TO ?X_P)))
            (X (OF.P ?X_C))))))
    ?L))
		(?X_K
   (NOT (?X_M (WANT.V ?X_D (KA (ANYMORE.ADV ((ADV-A (WITH.P ?X_L)) PLAY.V)))))))
		(?X_G (?X_I (SAY.V (THAT (?X_S (CAN.MD (HAVE.V ?X_H)))))))
		(?X_E (?X_S PLAY.18.V ?X_R))
	)
)

; "Ricky played with toys."
; "His sister played with toys too."
; "They both made toys for each other."
(EPI-SCHEMA ((?X_D ((ADV-A (WITH.P ?X_C)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR TOY.N)))
		(!R2 (?X_D AGENT.N))
	)
	(:STEPS
		(?X_B (?X_D PLAY.19.V ?X_C))
	)
)

; "Sandy's grandfather came to visit."
; "He played with Sandy."
; "He tickled her."
; "Sandy screamed."
(EPI-SCHEMA ((?X_J ((ADV-A (WITH.P ?X_J)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E GRANDFATHER.N))
		(!R2 (?X_E (PERTAIN-TO ?X_J)))
		(!R3 (?L2 DESTINATION.N))
		(!R4 (?X_J AGENT.N))
		(!R5 (?N NOISE.N))
	)
	(:STEPS
		(?X_G (?X_E ((ADV-A (FROM.P ?L1)) COME.20.V) ?L2))
		(?X_D (?X_E ((ADV-A (WITH.P ?X_J)) PLAY.V)))
		(?X_B (?X_E (TICKLE.V ?X_J)))
		(?X_I (?X_J SCREAM.21.V ?N))
	)
)

; "Tommy has a dog."
; "His dog is brown and black."
; "His dog barks a lot."
; "He doesn't want to go outside anymore."
(EPI-SCHEMA ((?X_F (OUTSIDE.ADV ((ADV-A (WITH.P ?X_F)) GO.V))) ** ?E)
	(:ROLES
		(!R1 (?X_F BROWN.A))
		(!R2 (?X_F BLACK.A))
		(!R3 (?X_F DOG.N))
		(!R4 (?X_F (PERTAIN-TO ?X_G)))
		(!R5 (?N NOISE.N))
		(!R6 (?X_G AGENT.N))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_G HAVE.23.V ?X_F))
		(?X_A (?X_F BARK.24.V ?N))
		(?X_C (NOT (?X_F (WANT.V (KA (ANYMORE.ADV (OUTSIDE.ADV GO.V)))))))
		(?E_1 (?X_G ((ADV-A (FROM.P ?L1)) GO.25.V) ?L2))
	)
)

; "Tommy has a dog."
; "His name is Max."
; "His mom calls him Max."
; "His dad calls him Tommy."
(EPI-SCHEMA ((?X_L (HAVE.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_D DAD.N))
		(!R2 (?X_D (PERTAIN-TO ?X_L)))
		(!R3 (?X_E DOG.N))
		(!R4 (?X_F MOM.N))
		(!R5 (?X_F (PERTAIN-TO ?X_L)))
		(!R6 (?X_G AGENT.N))
		(!R7 (?X_H NAME.N))
		(!R8 (?X_H (PERTAIN-TO ?X_I)))
		(!R9 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_K (?X_L HAVE.26.V ?X_E))
		(?X_A (?X_H (= ?X_G)))
		(?X_B (?X_F (CALL.V ?X_E ?X_G)))
		(?X_C (?X_D (CALL.V ?X_L ?X_L)))
	)
)

; "Mary's father bought Mary a puppy."
; "Mary called it Max."
; "Max liked to play."
; "Mary played with Max."
; "Mary's mom said that Max would be ok if someone else played with him."
(EPI-SCHEMA ((?X_M ((ADV-A (WITH.P ?X_J)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_K MOM.N))
		(!R2 (?X_J PUPPY.N))
		(!R3 (?X_M AGENT.N))
		(!R4 (?X_K (PERTAIN-TO ?X_M)))
		(!R5 (?X_L FATHER.N))
		(!R6 (?X_L (PERTAIN-TO ?X_M)))
		(!R7 (?X_P AGENT.N))
		(!R8 ((KA PLAY.V) ACTION.N))
	)
	(:STEPS
		(?X_I (?X_L (BUY.V ?X_M ?X_J)))
		(?X_G (?X_M (CALL.V ?X_J ?X_P)))
		(?X_O (?X_P LIKE.27.V (KA PLAY.V)))
		(?X_E (?X_M ((ADV-A (WITH.P ?X_P)) PLAY.V)))
		(?X_C
   (?X_K
    (SAY.V
     (THAT
      (?X_P
       (WILL.MD (BE.V OK.A (IF.P (?X_A ((ADV-A (WITH.P ?X_P)) PLAY.V))))))))))
	)
)

; "John loves playing baseball."
; "He has a good team."
; "His team plays well."
(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA.PR (KA (PLAY.V ?X_F)) ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_F BASEBALL.N))
		(!R2 (?X_H GOOD.A))
		(!R3 (?X_H TEAM.N))
		(!R4 (?X_H (PERTAIN-TO ?X_G)))
		(!R5 ((KA (PLAY.V ?X_F)) ACTION.N))
		(!R6 (?X AGENT.N))
		(!R7 (?X_G AGENT.N))
		(!R8 (?X_H OBJECT.N))
		(!R9 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_C (?X_G LOVE.28.V (KA (PLAY.V ?X_F))))
		(?E_1 (?X PLAY.29.V))
		(?X_E (?X_G HAVE.30.V ?X_H))
		(?X_A (?X_H PLAY.31.V))
	)
)

; "Kate has two dogs."
; "She loves them both."
; "She takes care of them."
; "Her dad bought her a puppy."
(EPI-SCHEMA ((?X_J (HAVE.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C PUPPY.N))
		(!R2 (?X_G DAD.N))
		(!R3 (?X_F CARE.N))
		(!R4 (?X_G (PERTAIN-TO ?X_J)))
		(!R5 ((TWO.D (PLUR DOG.N)) OBJECT.N))
		(!R6 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_I (?X_J HAVE.32.V (TWO.D (PLUR DOG.N))))
		(?X_E (?X_J (((ADV-A (OF.P ?X_A)) TAKE.V) ?X_F)))
		(?X_B (?X_G (BUY.V ?X_J ?X_C)))
	)
)

; "Mary has a dog."
; "His name is Max."
; "He plays all the time."
; "Mary loves Max."
(EPI-SCHEMA ((?X_B (LOVE.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_B AGENT.N))
		(!R2 (?X_G NAME.N))
		(!R3 (?X_I DOG.N))
		(!R4 (?X_G (PERTAIN-TO ?X_I)))
		(!R5 (?X_H AGENT.N))
		(!R6 (NOT (?X_I ACTION.N)))
	)
	(:STEPS
		(?X_D (?X_H HAVE.33.V ?X_I))
		(?X_A (?X_G (= ?X_B)))
		(?X_F (?X_H LOVE.34.V ?X_I))
	)
)

; "Mary's parents bought her a dog."
; "She loves her dog."
; "Her dog is happy."
; "She plays with her dog."
(EPI-SCHEMA ((?X_H (LOVE.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_G DOG.N))
		(!R2 (?X_G (PERTAIN-TO ?X_H)))
		(!R3 (?X_E (PLUR PARENT.N)))
		(!R4 (?X_E (PERTAIN-TO ?X_H)))
		(!R5 (?X_F DOG.N))
		(!R6 (?X_F HAPPY.A))
		(!R7 (?X_F (PERTAIN-TO ?X_G)))
		(!R8 (NOT (?X_G ACTION.N)))
		(!R9 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_D (?X_E (BUY.V ?X_H ?X_G)))
		(?X_A (?X_H LOVE.35.V ?X_G))
		(?X_B (?X_H PLAY.36.V))
	)
)



; "A car ran over the dog."
; "The owner did not care."
; "He just drove away."
; "The dog died."
(EPI-SCHEMA ((NOT (?X_F CARE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F OWNER.N))
		(!R2 (?X_G DOG.N))
		(!R3 (?X_H CAR.N))
		(!R4 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_H ((ADV-A (OVER.P ?X_G)) RUN.V)))
		(?X_E (NOT (?X_F CARE.V)))
		(?X_J (?X_F ((ADV-A (FROM.P ?L1)) DRIVE_AWAY.1.V) ?L2))
		(?X_C (?X_G DIE.V))
	)
)

; "Alice's car broke down."
; "She called for help."
; "Someone came to fix it."
; "The mechanic fixed it."
(EPI-SCHEMA ((?X_I ((ADV-A (FOR.P ?X_F)) CALL.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C MECHANIC.N))
		(!R2 (?X_F HELP.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_M CAR.N))
		(!R5 (?X_M (PERTAIN-TO ?X_I)))
		(!R6 (?X_J PERSON.N))
		(!R7 (?X_M DESTINATION.N))
	)
	(:STEPS
		(?X_H (?X_M BREAK_DOWN.V))
		(?X_E (?X_I ((ADV-A (FOR.P ?X_F)) CALL.V)))
		(?X_L (?X_J ((ADV-A (FROM.P ?L1)) COME.2.V) ?X_M))
		(?X_B (?X_C (FIX.V ?X_M)))
	)
)

; "'I saw a car crash on the highway."
; "There were lots of cars involved."
; "No one was hurt."
; "The drivers were angry."
(EPI-SCHEMA ((?X_K (SEE.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR LOT.N)))
		(!R2 (?X_D (OF.P ?X_E)))
		(!R3 (?X_H HIGHWAY.N))
		(!R4 (?X_I CAR.N))
		(!R5 (?X_J (ON.P ?X_H)))
		(!R6 (?X_J ?X_I CRASH.N))
		(!R7 (?X_J ENTITY.N))
		(!R8 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_G (?X_K SEE.3.V ?X_J))
		(?X_C (?X_A (BE.V ?X_D)))
	)
)

; "Tom's dog was sick."
; "He took him to the vet."
; "The vet gave Tom some medicine."
; "Tom's dog felt better."
(EPI-SCHEMA ((?X_K (GIVE.V ?X_K ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C BETTER.A))
		(!R2 (?X_I SICK.A))
		(!R3 (?X_I DOG.N))
		(!R4 (?X_K VET.N))
		(!R5 (?X_I (PERTAIN-TO ?X_J)))
		(!R6 (?X_H MEDICINE.N))
		(!R7 (?X_I SMALLER-THAN.N ?X_J))
		(!R8 (?X_K DESTINATION.N))
		(!R9 (?X_J AGENT.N))
		(!R10 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_E (?X_J TAKE.4.V ?X_I ?X_K))
		(?X_G (?X_K (GIVE.5.V ?X_J ?X_H)))
		(?X_B (?X_I (FEEL.V ?X_C)))
	)
)

; "Tom's car broke down."
; "His battery died."
; "He couldn't start the car."
; "He called for help."
(EPI-SCHEMA ((?X_E BREAK_DOWN.V) ** ?E)
	(:ROLES
		(!R1 (?X_F BATTERY.N))
		(!R2 (?X_E CAR.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_E (PERTAIN-TO ?X_G)))
		(!R5 (?X_F (PERTAIN-TO ?X_G)))
		(!R6 (?X_H HELP.N))
	)
	(:STEPS
		(?X_B (?X_E BREAK_DOWN.V))
		(?X_D (?X_F DIE.V))
		(E145.SK (NOT (?X_G ((CAN.MD START.V) ?X_E))))
		(?X_J (?X_G ((ADV-A (FOR.P ?X_H)) CALL.V)))
	)
)

; "Dan owned a car that broke down."
; "He fixed it."
; "His car started working fine."
(EPI-SCHEMA ((?X_G (FIX.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D CAR.N))
		(!R2 (?X_D (PERTAIN-TO ?X_G)))
		(!R3 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_F (?X_G OWN.7.V ?X_D))
		(?X_C (?X_G (FIX.V ?X_D)))
		(?X_A (?X_D ((ADV-A (FOR.P (KA (WORK.V FINE.A)))) START.V)))
	)
)



; "The girl was walking along the road."
; "She saw a big rock."
; "She picked it up and threw it away."
(EPI-SCHEMA ((?X_E (PICK_UP.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_D BIG.A))
		(!R2 (?X_D ROCK.N))
		(!R3 (?X_E GIRL.N))
		(!R4 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_E ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_G (?X_E SEE.2.V ?X_D))
		(?X_B (?X_E (PICK_UP.V ?X_D)))
		(?X_C (?X_E (THROW_AWAY.V ?X_D)))
	)
)

; "The boy found a big rock on the beach."
; "He walked along the shoreline."
; "He looked for a good place to throw the rock."
; "He chose a spot near some bushes."
; "He threw the rock into the bushes."
(EPI-SCHEMA ((?X_K (FIND.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR BUSH.N)))
		(!R2 (?X_E SPOT.N))
		(!R3 (?X_E (NEAR.P ?X_F)))
		(!R4 (?X_I BIG.A))
		(!R5 (?X_I ROCK.N))
		(!R6 (?X_J BEACH.N))
		(!R7 (?X_K BOY.N))
		(!R8 (?L2 DESTINATION.N))
		(!R9 (?X_P ENTITY.N))
	)
	(:STEPS
		(?X_H (?X_K (((ADV-A (ON.P ?X_J)) FIND.V) ?X_I)))
		(?X_M (?X_K ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_O (?X_K ((ADV-A (FOR.P ?X_P)) LOOK.3.V)))
		(?X_D (?X_K (CHOOSE.V ?X_E)))
		(?X_B (?X_K (((ADV-A (INTO.P ?X_F)) THROW.V) ?X_I)))
	)
)

; "A boy named Tom played football."
; "He ran fast."
; "He caught the ball."
; "He kicked the ball high into the air."
; "He caught the ball again."
; "He kicked the ball again."
; "He caught the ball for a third time."
; "He kicked the ball for a fourth time."
; "He caught the ball for a fifth time."
; "He kicked the ball for a sixth time."
; "He caught the ball for a seventh time."
; "He kicked the ball for an eighth time."
; "He caught the ball for a ninth time."
; "He kicked"
(EPI-SCHEMA ((?X_ZK (((ADV-A (FOR.P ?X_K)) KICK.V) ?X_ZD)) ** ?E)
	(:ROLES
		(!R1 (?X_E NINTH.A))
		(!R2 (?X_E TIME.N))
		(!R3 (?X_H EIGHTH.A))
		(!R4 (?X_H TIME.N))
		(!R5 (?X_K SEVENTH.A))
		(!R6 (?X_K TIME.N))
		(!R7 (?X_N SIXTH.A))
		(!R8 (?X_N TIME.N))
		(!R9 (?X_Q FIFTH.A))
		(!R10 (?X_Q TIME.N))
		(!R11 (?X_T FOURTH.A))
		(!R12 (?X_T TIME.N))
		(!R13 (?X_W THIRD.A))
		(!R14 (?X_W TIME.N))
		(!R15 (?X_ZD BALL.N))
		(!R16 (?X_ZG FOOTBALL.N))
		(!R17 (?X_ZH BOY.N))
		(!R18 (?X_ZH ((PASV NAME.V) ?X_ZK)))
		(!R19 (?X_ZK AGENT.N))
		(!R20 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_ZF (?X_ZH PLAY.4.V))
		(?X_ZJ (?X_ZK ((ADV-A (FROM.P ?L1)) RUN.5.V) ?L2))
		(?X_ZC (?X_ZK (CATCH.V ?X_ZD)))
		(?X_ZA (?X_ZK ((AGAIN.ADV CATCH.V) ?X_ZD)))
		(?X_Y (?X_ZK ((AGAIN.ADV KICK.V) ?X_ZD)))
		(?X_V (?X_ZK (((ADV-A (FOR.P ?X_W)) CATCH.V) ?X_ZD)))
		(?X_S (?X_ZK (((ADV-A (FOR.P ?X_T)) KICK.V) ?X_ZD)))
		(?X_P (?X_ZK (((ADV-A (FOR.P ?X_Q)) CATCH.V) ?X_ZD)))
		(?X_M (?X_ZK (((ADV-A (FOR.P ?X_N)) KICK.V) ?X_ZD)))
		(?X_J (?X_ZK (((ADV-A (FOR.P ?X_K)) CATCH.V) ?X_ZD)))
		(?X_G (?X_ZK (((ADV-A (FOR.P ?X_H)) KICK.V) ?X_ZD)))
		(?X_D (?X_ZK (((ADV-A (FOR.P ?X_E)) CATCH.V) ?X_ZD)))
		(?X_B (?X_ZK KICK.V))
	)
)



; "The cow ate grass all day."
; "The farmer gave her hay."
; "The cow grew big."
; "The farmer sold the cow."
(EPI-SCHEMA ((?X_E (EAT.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E FARMER.N))
		(!R2 (?X_H BIG.A))
		(!R3 (?X_I COW.N))
		(!R4 (?X_J GRASS.N))
		(!R5 (?X_K HAY.N))
		(!R6 (?X_K (PERTAIN-TO ?X_I)))
		(!R7 (?X_J FOOD.N))
		(!R8 (?X_J AGENT.N))
		(!R9 (NOT (?X_K AGENT.N)))
	)
	(:STEPS
		(?X_A (?X_I EAT.1.V ?X_J))
		(?X_B (?X_E (GIVE.2.V ?X_J ?X_K)))
		(?X_G (?X_I (GROW.V ?X_H)))
		(?X_D (?X_E (SELL.V ?X_I)))
	)
)

; "Karen fed the cow."
; "It drank some milk."
; "It grew bigger and stronger."
; "The farmer sold the cow."
(EPI-SCHEMA ((?X_J (EAT.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_D FARMER.N))
		(!R2 (?X_I COW.N))
		(!R3 (?X_J AGENT.N))
		(!R4 (?X_K MILK.N))
	)
	(:STEPS
		(?X_H (?X_J (FED.V ?X_I)))
		(?X_M (?X_I DRANK.11.V ?X_K))
		(?X_F (?X_I (GROW.V (K (L X (AND (X BIGGER.A) (X STRONGER.A)))))))
		(?X_C (?X_D (SELL.V ?X_I)))
	)
)

; "Mary loves eating ice cream."
; "She likes to eat ice cream."
; "She eats ice cream for lunch."
(EPI-SCHEMA ((?X_J (EAT.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_G ICE.N))
		(!R2 (?X_G CREAM.N))
		(!R3 (?X_H ICE.N))
		(!R4 (?X_H CREAM.N))
		(!R5 (?X_I ICE.N))
		(!R6 (?X_I CREAM.N))
		(!R7 ((KA (EAT.V ?X_G)) ACTION.N))
		(!R8 (?X_G FOOD.N))
		(!R9 ((KA (EAT.V ?X_H)) ACTION.N))
		(!R10 (?X_H FOOD.N))
		(!R11 (?X_I FOOD.N))
		(!R12 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_B (?X_J LOVE.12.V (KA (EAT.V ?X_G))))
		(?E_1 (?X_J EAT.13.V ?X_G))
		(?X_D (?X_J LIKE.14.V (KA (EAT.V ?X_H))))
		(?E_2 (?X_J EAT.13.V ?X_H))
		(?X_F (?X_J EAT.1.V ?X_I))
	)
)

; "Diane liked cats."
; "She had many cats."
; "She fed them."
; "She played with them."
(EPI-SCHEMA ((?X_K (LIKE.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_E MANY.A))
		(!R2 (?X_E (PLUR CAT.N)))
		(!R3 (?X_J (PLUR CAT.N)))
		(!R4 (NOT (?X_J ACTION.N)))
		(!R5 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_G (?X_K LIKE.15.V ?X_J))
		(?X_I (?X_K HAVE.16.V ?X_E))
		(?X_D (?X_K (FED.V ?X_E)))
		(?X_B (?X_K ((ADV-A (WITH.P ?X_E)) PLAY.V)))
	)
)

; "A cow drinks from a stream."
; "The cow is thirsty."
; "The cow has no food."
; "The cow eats grass."
; "The cow grows milk."
(EPI-SCHEMA ((?X_D (EAT.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C MILK.N))
		(!R2 (?X_D THIRSTY.A))
		(!R3 (?X_D COW.N))
		(!R4 (?X_I GRASS.N))
		(!R5 ((NO.D FOOD.N) OBJECT.N))
		(!R6 (?X_I FOOD.N))
	)
	(:STEPS
		(?X_F (?X_D HAVE.17.V (NO.D FOOD.N)))
		(?X_H (?X_D EAT.1.V ?X_I))
		(?X_B (?X_D (GROW.V ?X_C)))
	)
)

; "A dog is an animal."
; "A cat is also an animal."
; "An elephant is also an animal."
; "A horse is also an animal."
; "A cow is also an animal."
; "A sheep is also an animal."
; "A pig is also an animal."
; "A bird is also an animal."
(EPI-SCHEMA ((?X_B (= ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_A DOG.N))
		(!R2 (?X_B ANIMAL.N))
	)
	(:STEPS
		(?X_D (?X_A (= ?X_B)))
	)
)

; "Alice liked reading books."
; "She read lots of books."
; "She read many books."
; "She read some good books."
; "She read some bad books."
(EPI-SCHEMA ((?X_P (READ.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C BAD.A))
		(!R2 (?X_C (PLUR BOOK.N)))
		(!R3 (?X_F GOOD.A))
		(!R4 (?X_F (PLUR BOOK.N)))
		(!R5 (?X_I MANY.A))
		(!R6 (?X_I (PLUR BOOK.N)))
		(!R7 (?X_L (PLUR LOT.N)))
		(!R8 (?X_L (OF.P ?X_M)))
		(!R9 (?X_Q (PLUR BOOK.N)))
		(!R10 (?X_P AGENT.N))
		(!R11 ((KA (READ.V ?X_Q)) ACTION.N))
	)
	(:STEPS
		(?X_O (?X_P LIKE.18.V (KA (READ.V ?X_Q))))
		(?X_K (?X_P (READ.V ?X_L)))
		(?X_H (?X_P (READ.V ?X_I)))
		(?X_E (?X_P (READ.V ?X_F)))
		(?X_B (?X_P (READ.V ?X_C)))
	)
)

; "The cow is white or brown."
; "A cow's horns are sharp."
; "Cows eat grass."
; "A cow has four legs."
(EPI-SCHEMA ((?X_A (HAVE.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_G GRASS.N))
		(!R2 (?X_A (PLUR COW.N)))
		(!R3 (?X_F COW.N))
		(!R4 (?X_G FOOD.N))
		(!R5 ((FOUR.D (PLUR LEG.N)) OBJECT.N))
	)
	(:STEPS
		(?X_C (?X_A EAT.1.V ?X_G))
		(?X_E (?X_F HAVE.19.V (FOUR.D (PLUR LEG.N))))
	)
)

; "Alice's mother kept many cows."
; "She fed them lots of food."
; "The cows were happy."
(EPI-SCHEMA ((?X_E (FEED.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C MANY.A))
		(!R2 (?X_C (PLUR COW.N)))
		(!R3 (?X_C HAPPY.A))
		(!R4 (?X_D MOTHER.N))
		(!R5 (?X_E AGENT.N))
		(!R6 (?X_D (PERTAIN-TO ?X_E)))
		(!R7 (?X_H FOOD.N))
		(!R8 (?X_I (PLUR LOT.N)))
		(!R9 (?X_I (OF.P ?X_H)))
		(!R10 (NOT (?X_I AGENT.N)))
	)
	(:STEPS
		(?X_B (?X_D (KEEP.V ?X_C)))
		(?X_G (?X_D (FED.20.V ?X_C ?X_I)))
	)
)

; "The cow ate grass all day."
; "The farmer gave her hay."
; "The cow grew big."
; "The farmer sold the cow."
(EPI-SCHEMA ((?X_D (EAT.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D FARMER.N))
		(!R2 (?X_G BIG.A))
		(!R3 (?X_J COW.N))
		(!R4 (?X_K GRASS.N))
		(!R5 (?X_L HAY.N))
		(!R6 (?X_L (PERTAIN-TO ?X_J)))
		(!R7 (?X_K FOOD.N))
		(!R8 (?X_K AGENT.N))
		(!R9 (NOT (?X_L AGENT.N)))
	)
	(:STEPS
		(?X_I (?X_J EAT.1.V ?X_K))
		(?X_A (?X_D (GIVE.21.V ?X_K ?X_L)))
		(?X_F (?X_J (GROW.V ?X_G)))
		(?X_C (?X_D (SELL.V ?X_J)))
	)
)

; "The boy threw stones at the cat."
; "One stone hit the cat."
; "The cat ran away."
; "The boy chased the cat."
; "The cat jumped over the wall."
(EPI-SCHEMA ((?X_G (((ADV-A (AT.P ?X_N)) THROW.V) ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C STONE.N))
		(!R2 (?X_N (PLUR STONE.N)))
		(!R3 (?X_F CAT.N))
		(!R4 (?X_G BOY.N))
		(!R5 (?X_N LOCATION.N))
		(!R6 (NOT (?X_N = ?L2)))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_G (((ADV-A (AT.P ?X_F)) THROW.V) ?X_N)))
		(?X_B (?X_C (HIT.V ?X_F)))
		(?X_I (?X_F ((ADV-A (FROM.P ?X_N)) RUN_AWAY.22.V) ?L2))
		(?X_K (?X_G CHASE.23.V ?X_F))
		(?X_M (?X_F ((ADV-A (FROM.P ?L1)) JUMP.24.V) ?L2))
	)
)

; "Cecil liked to play with rocks."
; "He played with them all the time."
; "He brought some rocks to school."
; "His teacher asked him what he was doing."
(EPI-SCHEMA ((?X_I (((ADV-A (TO.P ?X_G)) BRING.V) ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR ROCK.N)))
		(!R2 (?X_C TEACHER.N))
		(!R3 (?X_C (PERTAIN-TO ?X_I)))
		(!R4 (?X_H (PLUR ROCK.N)))
		(!R5 (?X_G SCHOOL.N))
		(!R6 ((KA ((ADV-A (WITH.P ?X_F)) PLAY.V)) ACTION.N))
		(!R7 (?X_G DESTINATION.N))
		(!R8 (?X_I AGENT.N))
		(!R9 (?X_H SMALLER-THAN.N ?X_I))
	)
	(:STEPS
		(?X_B (?X_I LIKE.25.V (KA ((ADV-A (WITH.P ?X_F)) PLAY.V))))
		(?X_E (?X_I BRING.26.V ?X_H ?X_G))
	)
)

; "Tom's cat ate an apple."
; "Tom put the apple on the table."
; "Tom's cat liked apples."
; "Tom gave Tom's cat an apple."
; "Tom's cat licked the apple."
; "Tom's cat ate the apple."
; "Tom's cat is hungry."
(EPI-SCHEMA ((?X_P (GIVE.V ?X_P ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_Q APPLE.N))
		(!R2 (?X_K HUNGRY.A))
		(!R3 (?X_K CAT.N))
		(!R4 (?X_N TABLE.N))
		(!R5 (?X_O (PLUR APPLE.N)))
		(!R6 (?X_K (PERTAIN-TO ?X_P)))
		(!R7 (?X_N LOCATION.N))
		(!R8 (NOT (?X_O ACTION.N)))
		(!R9 (NOT (?X_O AGENT.N)))
		(!R10 (?X_P AGENT.N))
		(!R11 (NOT (?X_Q AGENT.N)))
	)
	(:STEPS
		(?X_D (?X_K EAT.1.V ?X_Q))
		(?X_F (?X_P PUT.27.V ?X_Q ?X_N))
		(?X_H (?X_K LIKE.28.V ?X_O))
		(?X_J (?X_P (GIVE.29.V ?X_K ?X_Q)))
		(?X_B (?X_K (LICK.V ?X_Q)))
		(?X_M (?X_K EAT.1.V ?X_Q))
	)
)

; "A boy threw stones at the cat."
; "One stone hit the cat."
; "The cat ran away."
; "The boy chased the cat."
; "The cat jumped over the wall."
(EPI-SCHEMA ((?X_G (((ADV-A (AT.P ?X_C)) THROW.V) ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C STONE.N))
		(!R2 (?X_N (PLUR STONE.N)))
		(!R3 (?X_F CAT.N))
		(!R4 (?X_G BOY.N))
		(!R5 (?X_N LOCATION.N))
		(!R6 (NOT (?X_N = ?L2)))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_G (((ADV-A (AT.P ?X_F)) THROW.V) ?X_N)))
		(?X_B (?X_C (HIT.V ?X_F)))
		(?X_I (?X_F ((ADV-A (FROM.P ?X_N)) RUN_AWAY.22.V) ?L2))
		(?X_K (?X_G CHASE.30.V ?X_F))
		(?X_M (?X_F ((ADV-A (FROM.P ?L1)) JUMP.24.V) ?L2))
	)
)

; "The boy threw stones at the cat."
; "One stone hit the cat."
; "The cat ran away."
; "The boy chased the cat."
; "The cat jumped over the wall."
(EPI-SCHEMA ((?X_G (((ADV-A (AT.P ?X_N)) THROW.V) ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C STONE.N))
		(!R2 (?X_N (PLUR STONE.N)))
		(!R3 (?X_F CAT.N))
		(!R4 (?X_G BOY.N))
		(!R5 (?X_N LOCATION.N))
		(!R6 (NOT (?X_N = ?L2)))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_G (((ADV-A (AT.P ?X_F)) THROW.V) ?X_N)))
		(?X_B (?X_C (HIT.V ?X_F)))
		(?X_I (?X_F ((ADV-A (FROM.P ?X_N)) RUN_AWAY.22.V) ?L2))
		(?X_K (?X_G CHASE.31.V ?X_F))
		(?X_M (?X_F ((ADV-A (FROM.P ?L1)) JUMP.24.V) ?L2))
	)
)

; "'I have two cats,' said Tom."
; "'My first cat is black."
; "His name is Blacky."
; "Blacky likes to play."
; "Blacky loves to eat."
(EPI-SCHEMA ((?X_E (LIKE.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E FIRST.A))
		(!R2 (?X_F FIRST.A))
		(!R3 ((KA PLAY.V) ACTION.N))
		(!R4 (?X_E AGENT.N))
		(!R5 (?X_F AGENT.N))
		(!R6 ((KA EAT.V) ACTION.N))
	)
	(:STEPS
		(?X_B (?X_E LIKE.32.V (KA PLAY.V)))
		(?X_D (?X_F LOVE.33.V (KA EAT.V)))
	)
)

; "Tom played football."
; "He kicked the ball."
; "The ball went through the goal posts."
; "He scored a touchdown."
(EPI-SCHEMA ((?X_K (KICK.V (ANOTHER.D PLAYER.N))) ** ?E)
	(:ROLES
		(!R1 (?X_C TOUCHDOWN.N))
		(!R2 (?X_L BALL.N))
		(!R3 (?X_H FOOTBALL.N))
		(!R4 (?X_M (PLUR POST.N)))
		(!R5 (?X_K AGENT.N))
		(!R6 (?X_L AGENT.N))
		(!R7 (NOT (?X_M = ?X_M)))
	)
	(:STEPS
		(?X_G (?X_K PLAY.34.V))
		(?X_E (?X_K (KICK.V ?X_L)))
		(?X_J (?X_L ((ADV-A (FROM.P ?X_M)) GO.35.V) ?X_M))
		(?X_B (?X_K (SCORE.V ?X_C)))
	)
)

; "Tommy's cat is white."
; "His name is Tommy."
; "Tommy likes to play."
; "Tommy has four legs."
; "Tommy doesn't like to be alone."
(EPI-SCHEMA ((?X_J (LIKE.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_H AGENT.N))
		(!R2 (?X_I NAME.N))
		(!R3 (?X_J WHITE.A))
		(!R4 (?X_J CAT.N))
		(!R5 (?X_J (PERTAIN-TO ?X_H)))
		(!R6 (?X_I (PERTAIN-TO ?X_J)))
		(!R7 ((KA PLAY.V) ACTION.N))
		(!R8 ((FOUR.D (PLUR LEG.N)) OBJECT.N))
		(!R9 ((KA (ALONE.ADV BE.V)) ACTION.N))
	)
	(:STEPS
		(?X_A (?X_I (= ?X_H)))
		(?X_C (?X_J LIKE.36.V (KA PLAY.V)))
		(?X_E (?X_J HAVE.37.V (FOUR.D (PLUR LEG.N))))
		(?X_G (?X_J LIKE.38.V (KA (ALONE.ADV BE.V))))
	)
)

; "The boy liked to play catch."
; "His friends played too."
; "One time the boys were throwing rocks at each other."
; "A rock hit the cat in the head."
; "The cat ran away."
; "The boys followed the cat."
(EPI-SCHEMA ((?X_I (((ADV-A (WITH.P ?X_U)) PLAY.V) ?X_T)) ** ?E)
	(:ROLES
		(!R1 (?X_Q CAT.N))
		(!R2 (?X_D ROCK.N))
		(!R3 (?X_G TIME.N))
		(!R4 (?X_H (PLUR ROCK.N)))
		(!R5 (?X_I (PLUR BOY.N)))
		(!R6 (?X_U (PLUR FRIEND.N)))
		(!R7 (?X_T CATCH.N))
		(!R8 (?X_L BOY.N))
		(!R9 (?X_U (PERTAIN-TO ?X_L)))
		(!R10 (?X_R HEAD.N))
		(!R11 (?X_Q (IN.P ?X_R)))
		(!R12 (?X_S (PLUR BOY.N)))
		(!R13 ((KA (PLAY.V ?X_T)) ACTION.N))
		(!R14 (?X_U LOCATION.N))
		(!R15 (NOT (?X_U = ?L2)))
		(!R16 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_K (?X_L LIKE.39.V (KA (PLAY.V ?X_T))))
		(?X_A (?X_U (TOO.ADV PLAY.V)))
		(?X_F (?X_I (((ADV-A (AT.P (EACH.D OTHER.A))) THROW.V) ?X_H ?X_G)))
		(?X_C (?X_D (HIT.V ?X_Q)))
		(?X_N (?X_Q ((ADV-A (FROM.P ?X_U)) RUN_AWAY.22.V) ?L2))
		(?X_P (?X_S FOLLOW.40.V ?X_Q))
	)
)



; "My friend's dad has an apple tree."
; "His apples are delicious."
; "He makes me apple pie."
; "He gave me two of them."
(EPI-SCHEMA ((?X_K (((ADV-A (FROM.P ?X_H)) GET.V) ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_F APPLE.N))
		(!R2 (?X_F PIE.N))
		(!R3 (?X_J FRIEND.N))
		(!R4 (?X_J (PERTAIN-TO ?X_K)))
		(!R5 (?X_G TREE.N))
		(!R6 (?X_G APPLE.N))
		(!R7 (?X_H DAD.N))
		(!R8 (?X_H (PERTAIN-TO ?X_J)))
		(!R9 (?X_I (PLUR APPLE.N)))
		(!R10 (?X_I DELICIOUS.A))
		(!R11 (?X_I (PERTAIN-TO ?X_J)))
		(!R12 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_B (?X_H HAVE.1.V ?X_G))
		(?X_E (?X_J (MAKE.V ?X_K ?X_F)))
		(?X_C (?X_J (GIVE.2.V ?X_K ?X_A)))
	)
)

; "Tom loves apples."
; "He likes eating apples."
; "He likes making apple pies."
; "He likes having apple pie for dessert."
; "Tom wants to make apple pies."
(EPI-SCHEMA ((?X_O
              (COMPOSITE-SCHEMA.PR (KA (MAKE.V ?X_C)) ?X_L (KA (EAT.V ?X_M))
               ?X_M (KA (MAKE.V ?X_N)) ?X_P (KA (HAVE.V ?X_P))))
             ** ?E)
	(:ROLES
		(!R1 (?X_C APPLE.N))
		(!R2 (?X_C (PLUR PIE.N)))
		(!R3 (?X_L (PLUR APPLE.N)))
		(!R4 (?X_M (PLUR APPLE.N)))
		(!R5 (?X_N APPLE.N))
		(!R6 (?X_N (PLUR PIE.N)))
		(!R7 (?X_P APPLE.N))
		(!R8 (?X_P PIE.N))
		(!R9 (NOT (?X_L ACTION.N)))
		(!R10 (NOT (?X_L AGENT.N)))
		(!R11 ((KA (EAT.V ?X_M)) ACTION.N))
		(!R12 ((KA (MAKE.V ?X_N)) ACTION.N))
		(!R13 (?X_O AGENT.N))
		(!R14 ((KA (HAVE.V ?X_P)) ACTION.N))
	)
	(:STEPS
		(?X_E (?X_O LOVE.3.V ?X_L))
		(?X_G (?X_O LIKE.4.V (KA (EAT.V ?X_M))))
		(?E_1 (?X_O EAT.5.V ?X_M))
		(?X_I (?X_O LIKE.6.V (KA (MAKE.V ?X_N))))
		(?E_2 (?X_O HAVE.7.V ?X_P))
		(?X_K (?X_O LIKE.8.V (KA (HAVE.V ?X_P))))
		(?X_B (?X_O (WANT.V (KA (MAKE.V ?X_C)))))
	)
)

; "Bill liked apples."
; "He ate some apples."
; "He baked apple pies."
; "He made apple juice."
(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA.PR ?X_C ?X_I ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C APPLE.N))
		(!R2 (?X_C JUICE.N))
		(!R3 (?X_J BILL.N))
		(!R4 (?X_I (PLUR APPLE.N)))
		(!R5 (?X_F (PLUR APPLE.N)))
		(!R6 (NOT (?X_I ACTION.N)))
		(!R7 (NOT (?X_I AGENT.N)))
		(!R8 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_E (?X_J LIKE.9.V ?X_I))
		(?X_H (?X_J EAT.10.V ?X_F))
		(?X_B (?X_J (MAKE.V ?X_C)))
	)
)

; "Tom ate some apple pie."
; "He liked it."
; "He ate three pieces."
; "He had some left over."
; "He put it away for later."
(EPI-SCHEMA ((?X_M (EAT.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_L APPLE.N))
		(!R2 (?X_L PIE.N))
		(!R3 (NOT (?X_L ACTION.N)))
		(!R4 (NOT (?X_L AGENT.N)))
		(!R5 (?X_M AGENT.N))
		(!R6 ((THREE.D (PLUR PIECE.N)) FOOD.N))
	)
	(:STEPS
		(?X_G (?X_M EAT.10.V ?X_L))
		(?X_I (?X_M LIKE.11.V ?X_L))
		(?X_K (?X_M EAT.12.V (THREE.D (PLUR PIECE.N))))
		(?X_E (?X_A LEAVE_OVER.V))
		(?X_C (?X_M (HAVE.V ?X_A)))
	)
)

; "Sammy likes apple pie."
; "He doesn't like other kinds of pies."
; "He likes to eat apple pie."
; "He eats apple pie for dessert."
(EPI-SCHEMA ((?X_P (COMPOSITE-SCHEMA.PR ?X_L ?X_M (KA (EAT.V ?X_N)) ?X_N ?X_O))
             ** ?E)
	(:ROLES
		(!R1 (?X_L APPLE.N))
		(!R2 (?X_L PIE.N))
		(!R3 (?X_E (PLUR PIE.N)))
		(!R4 (?X_F OTHER.A))
		(!R5 (?X_M (OF.P ?X_E)))
		(!R6 (?X_M ?X_F (PLUR KIND.N)))
		(!R7 (?X_N APPLE.N))
		(!R8 (?X_N PIE.N))
		(!R9 (?X_I DESSERT.N))
		(!R10 (?X_O ?X_N PIE.N))
		(!R11 (?X_O (FOR.P ?X_I)))
		(!R12 (NOT (?X_L ACTION.N)))
		(!R13 (NOT (?X_L AGENT.N)))
		(!R14 (?X_M OBJECT.N))
		(!R15 (NOT (?X_M ACTION.N)))
		(!R16 (NOT (?X_M AGENT.N)))
		(!R17 ((KA (EAT.V ?X_N)) ACTION.N))
		(!R18 (?X_O FOOD.N))
		(!R19 (?X_P AGENT.N))
	)
	(:STEPS
		(?X_B (?X_P LIKE.13.V ?X_L))
		(?X_D (?X_P LIKE.14.V ?X_M))
		(?X_H (?X_P LIKE.15.V (KA (EAT.V ?X_N))))
		(?E_1 (?X_P EAT.5.V ?X_N))
		(?X_K (?X_P EAT.10.V ?X_O))
	)
)

; "Joe ate some apple pie for dinner."
; "He liked it."
; "He thought it was good."
; "He would eat apple pie again."
(EPI-SCHEMA ((?X_J ((AGAIN.ADV EAT.V) ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B APPLE.N))
		(!R2 (?X_B PIE.N))
		(!R3 (?X_E APPLE.N))
		(!R4 (?X_E PIE.N))
		(!R5 (?X_J AGENT.N))
	)
	(:STEPS
		(E206.SK (?X_J ((AGAIN.ADV EAT.V) ?X_B)))
		(?X_G (?X_J EAT.10.V ?X_E))
		(?X_I (?X_J LIKE.16.V (IND (6 ?X_A))))
		(?X_D (?X_J (THINK.V (THT (?X_E GOOD.A)))))
	)
)

; "Bill loves apple pie."
; "He likes eating apple pie."
; "He eats a lot of apple pie."
; "He is going to make some apple pie."
(EPI-SCHEMA ((?X_N (EAT.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C APPLE.N))
		(!R2 (?X_C PIE.N))
		(!R3 (?X_N BILL.N))
		(!R4 (?X_K APPLE.N))
		(!R5 (?X_K PIE.N))
		(!R6 (?X_L APPLE.N))
		(!R7 (?X_L PIE.N))
		(!R8 (?X_H APPLE.N))
		(!R9 (?X_H PIE.N))
		(!R10 (?X_M LOT.N))
		(!R11 (?X_M (OF.P ?X_H)))
		(!R12 (NOT (?X_K ACTION.N)))
		(!R13 (NOT (?X_K AGENT.N)))
		(!R14 ((KA (EAT.V ?X_L)) ACTION.N))
		(!R15 (?X_M FOOD.N))
		(!R16 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_E (?X_N LOVE.17.V ?X_K))
		(?X_G (?X_N LIKE.18.V (KA (EAT.V ?X_L))))
		(?E_1 (?X_N EAT.5.V ?X_L))
		(?X_J (?X_N EAT.10.V ?X_M))
		(?X_B (?X_N ((ADV-A (FOR.P (KA (MAKE.V ?X_C)))) GO.V)))
	)
)

; "Molly loves apples."
; "She likes to eat them."
; "She is going to make some pies."
; "She will bake apples for dinner."
(EPI-SCHEMA ((?X_M (LOVE.V (THREE.D (PLUR PERSON.N)))) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR APPLE.N)))
		(!R2 (?X_D DINNER.N))
		(!R3 (?X_G (PLUR PIE.N)))
		(!R4 (?X_L (PLUR APPLE.N)))
		(!R5 ((KA (EAT.V ?X_L)) ACTION.N))
		(!R6 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_I (?X_M LOVE.21.V (IND (3 ?X_A))))
		(?X_K (?X_M LIKE.22.V (KA (EAT.V ?X_L))))
		(?X_F (?X_M ((ADV-A (FOR.P (KA (MAKE.V ?X_G)))) GO.V)))
		(?X_B (?X_M (((ADV-A (FOR.P ?X_D)) BAKE.V) ?X_C)))
		(?E_1 (?X_M EAT.5.V ?X_L))
	)
)

; "Alice likes apple pie."
; "She bought some apples from the store."
; "She baked some apple pie."
; "She ate some of it."
(EPI-SCHEMA ((?X_L (BUY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR APPLE.N)))
		(!R2 (?X_D STORE.N))
		(!R3 (?X_J APPLE.N))
		(!R4 (?X_J PIE.N))
		(!R5 (?X_K {REF}.N))
		(!R6 (?X_K (OF.P ?X_G)))
		(!R7 (NOT (?X_J ACTION.N)))
		(!R8 (NOT (?X_J AGENT.N)))
		(!R9 (?X_K FOOD.N))
		(!R10 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_F (?X_L LIKE.23.V ?X_J))
		(?X_B (?X_L (((ADV-A (FROM.P ?X_D)) BUY.V) ?X_C)))
		(?X_I (?X_L EAT.10.V ?X_K))
	)
)

; "Alice ate some apples."
; "A few were good."
; "All were sour."
; "She threw away the rest."
(EPI-SCHEMA ((?X_G (THROW_AWAY.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_C REST.N))
		(!R2 (?X_D (PLUR APPLE.N)))
		(!R3 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_F (?X_G EAT.10.V ?X_D))
		(?X_B (?X_G (THROW_AWAY.V ?X_C)))
	)
)

; "There was a storm that night."
; "Thunder, lightning, rain."
; "Wind blew my curtains around."
; "I could not sleep."
(EPI-SCHEMA ((?X_J SLEEP.V) ** ?E)
	(:ROLES
		(!R1 (?X_B STORM.N))
		(!R2 (?X_E WIND.N))
		(!R3 (?X_F (PLUR CURTAIN.N)))
		(!R4 (?X_F (PERTAIN-TO ?X_G)))
		(!R5 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_D (?X_A (BE.V ?X_B)))
		(?X_I (?X_E ((AROUND.ADV BLOW.V) ?X_F)))
		(E372.SK (NOT (?X_J (CAN.MD SLEEP.V))))
	)
)

; "Tommy liked to play baseball."
; "His team played well."
; "But Tommy's team lost the game."
(EPI-SCHEMA ((?X_D (PLAY.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E BASEBALL.N))
		(!R2 (?X_F TEAM.N))
		(!R3 (?X_F (PERTAIN-TO ?X_D)))
		(!R4 (?X_D AGENT.N))
		(!R5 ((KA (PLAY.V ?X_E)) ACTION.N))
		(!R6 (?X AGENT.N))
		(!R7 (?X_F AGENT.N))
	)
	(:STEPS
		(?X_C (?X_D LIKE.24.V (KA (PLAY.V ?X_E))))
		(?E_1 (?X PLAY.25.V))
		(?X_A (?X_F PLAY.26.V))
	)
)

; "Tom's mother told him to go outside and play."
; "He played on the swing set."
; "The wind blew hard."
; "His mother came out and watched him."
(EPI-SCHEMA ((?X_K ((ADV-A (WITH.P ?X_F)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C SWING.N))
		(!R2 (?X_C SET.N))
		(!R3 (?X_F WIND.N))
		(!R4 (?X_G HARD.A))
		(!R5 (?X_J MOTHER.N))
		(!R6 (?X_K AGENT.N))
		(!R7 (?X_J (PERTAIN-TO ?X_K)))
	)
	(:STEPS
		(?X_E (?X_K ((ADV-A (ON.P ?X_C)) PLAY.V)))
		(?X_I (?X_F (BLOW.V ?X_G)))
		(?X_A (?X_J COME_OUT.V))
		(?X_B (?X_J (WATCH.V ?X_K)))
	)
)

; "Alice walked through the park."
; "She saw a tree."
; "A branch fell on the ground."
; "She heard thunder."
; "She looked for shelter."
(EPI-SCHEMA ((?X_P ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C GROUND.N))
		(!R2 (?X_D BRANCH.N))
		(!R3 (?X_I TREE.N))
		(!R4 (?X_O THUNDER.N))
		(!R5 (?X_L SHELTER.N))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?X_O ENTITY.N))
		(!R8 (?X_P AGENT.N))
	)
	(:STEPS
		(?X_F (?X_P ((ADV-A (FROM.P ?L1)) WALK.27.V) ?L2))
		(?X_H (?X_P SEE.28.V ?X_I))
		(?X_B (?X_D ((ADV-A (ON.P ?X_C)) FALL.V)))
		(?X_K (?X_P HEAR.29.V ?X_O))
		(?X_N (?X_P ((ADV-A (FOR.P ?X_L)) LOOK.30.V)))
	)
)

; "'Tom's mother was sick."
; "He took care of her for many years."
; "His father left them alone."
; "He worked all week."
; "He came home on weekends."
(EPI-SCHEMA ((?X_H (((ADV-A (OF.P ?X_F)) TAKE.V) ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E CARE.N))
		(!R2 (?X_F MANY.A))
		(!R3 (?X_F (PLUR YEAR.N)))
		(!R4 (?X_H AGENT.N))
		(!R5 (?X_G (PERTAIN-TO ?X_H)))
		(!R6 (?X_L HOME.N))
		(!R7 (?X_L (PERTAIN-TO ?X_K)))
		(!R8 (?X_K AGENT.N))
		(!R9 (?X_L DESTINATION.N))
	)
	(:STEPS
		(?X_D (?X_H (((ADV-A (OF.P ?X_H)) ((ADV-A (FOR.P ?X_F)) TAKE.V)) ?X_E)))
		(?X_B ((ADV-E ({DURING}.P (ALL.D WEEK.N))) (?X_K WORK.V)))
		(?X_J (?X_K ((ADV-A (FROM.P ?L1)) COME.31.V) ?X_L))
	)
)

; "A man went outside on a windy night."
; "His house shook from the wind."
; "His windows rattled."
; "His car moved."
(EPI-SCHEMA ((?X_I ((ADV-A (FROM.P ?X_I)) (SOMEWHERE.ADV GO.V))) ** ?E)
	(:ROLES
		(!R1 (?X_B WIND.N))
		(!R2 (?X_G HOUSE.N))
		(!R3 (?X_I (PLUR WINDOW.N)))
		(!R4 (?X_H MAN.N))
		(!R5 (?X_G (PERTAIN-TO ?X_H)))
		(!R6 (?X_I (PERTAIN-TO ?X_H)))
		(!R7 (?L2 DESTINATION.N))
		(!R8 (?X_I AGENT.N))
		(!R9 (?N NOISE.N))
	)
	(:STEPS
		(?X_D (?X_H ((ADV-A (FROM.P ?L1)) GO.32.V) ?L2))
		(?X_A (?X_G ((ADV-A (FROM.P ?X_B)) SHAKE.V)))
		(?X_F (?X_I RATTLE.33.V ?N))
	)
)

; "Tom woke up early on Saturday morning."
; "He decided to go for a walk."
; "He walked through the park."
; "A storm came up."
; "Rain started falling."
; "Tom ran into a tree."
; "His umbrella broke open."
(EPI-SCHEMA ((?X_Q ((ADV-A (FOR.P ?X_K)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_L UMBRELLA.N))
		(!R2 (?X_E RAIN.N))
		(!R3 (?X_H STORM.N))
		(!R4 (?X_K WALK.N))
		(!R5 (?X_L (PERTAIN-TO ?X_Q)))
		(!R6 (?X_R PARK.N))
		(!R7 (?L2 DESTINATION.N))
		(!R8 (?X_Q AGENT.N))
		(!R9 (?X_R DESTINATION.N))
	)
	(:STEPS
		(?X_J (?X_Q ((ADV-A (FOR.P ?X_K)) GO.V)))
		(?X_B (?X_L BREAK_OPEN.V))
		(?E_1 (?X_Q ((ADV-A (FROM.P ?L1)) GO.34.V) ?L2))
		(?X_N (?X_Q ((ADV-A (FROM.P ?L1)) WALK.27.V) ?L2))
		(?X_G (?X_H COME_UP.V))
		(?X_D (?X_E ((ADV-A (FOR.P (KA FALL.V))) START.V)))
		(?X_P (?X_Q ((ADV-A (FROM.P ?L1)) RUN.35.V) ?X_R))
	)
)



; "A boy had a dog named Rover."
; "Rover loved to play fetch."
; "They were best friends."
; "One day, Rover ran away."
; "His family searched everywhere."
; "Finally they found him."
(EPI-SCHEMA ((?X_K
              ((ADV-A (FROM.P ?X_L)) (AWAY.ADV ((ADV-A (WITH.P ?X_H)) RUN.V))))
             ** ?E)
	(:ROLES
		(!R1 (?X_L FAMILY.N))
		(!R2 (?X_C BOY.N))
		(!R3 (?X_H DOG.N))
		(!R4 (?X_H ((PASV NAME.V) ?X_K)))
		(!R5 (?X_L (PERTAIN-TO ?X_K)))
		(!R6 ((KA (PLAY.V FETCH.V)) ACTION.N))
		(!R7 (?X_K AGENT.N))
		(!R8 (?L2 DESTINATION.N))
		(!R9 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_A (?X_C HAVE.1.V ?X_H))
		(?X_E (?X_K LOVE.2.V (KA (PLAY.V FETCH.V))))
		(?X_G (?X_K ((ADV-A (FROM.P ?L1)) RUN_AWAY.3.V) ?L2))
		(?X_B (?X_L (EVERYWHERE.ADV SEARCH.V)))
		(?X_J (?X_L FIND.4.V ?X_K))
	)
)

; "The boy had a dog named Rover."
; "Rover liked to play fetch."
; "They were good friends."
; "One day, Rover ran away."
; "His family looked for him everywhere."
; "Finally they found him."
(EPI-SCHEMA ((?X_D ((ADV-A (FROM.P ?L2)) (AWAY.ADV RUN.V))) ** ?E)
	(:ROLES
		(!R1 (?X_C GOOD.A))
		(!R2 (?X_C (PLUR FRIEND.N)))
		(!R3 (?X_D AGENT.N))
		(!R4 (?X_G BOY.N))
		(!R5 (?X_L DOG.N))
		(!R6 (?X_P FAMILY.N))
		(!R7 (?X_L ((PASV NAME.V) ?X_O)))
		(!R8 (?X_P (PERTAIN-TO ?X_O)))
		(!R9 ((KA (PLAY.V FETCH.V)) ACTION.N))
		(!R10 (?X_O AGENT.N))
		(!R11 (?L2 DESTINATION.N))
		(!R12 (?X_P AGENT.N))
	)
	(:STEPS
		(?X_F (?X_G HAVE.5.V ?X_L))
		(?X_I (?X_O LIKE.6.V (KA (PLAY.V FETCH.V))))
		(?X_B (?X_D (= ?X_C)))
		(?X_K (?X_O ((ADV-A (FROM.P ?L1)) RUN_AWAY.3.V) ?L2))
		(?X_N (?X_P FIND.4.V ?X_O))
	)
)

; "Rover liked to play fetch."
; "He played fetch all the time."
; "He played fetch with his owner."
(EPI-SCHEMA ((?X_C (LIKE.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 ((KA (PLAY.V FETCH.V)) ACTION.N))
	)
	(:STEPS
		(?X_B (?X_C LIKE.7.V (KA (PLAY.V FETCH.V))))
	)
)

; "Molly has a cat."
; "The cat likes to hide under furniture."
; "When Molly comes home from work, she looks for the cat."
; "The cat is hiding under a chair."
(EPI-SCHEMA ((?X_H
              (COMPOSITE-SCHEMA.PR (KA ((ADV-A (UNDER.P ?X_J)) HIDE.V)) ?Y
               ?X_H))
             ** ?E)
	(:ROLES
		(!R1 (?X_J FURNITURE.N))
		(!R2 (?X_G CHAIR.N))
		(!R3 (?X_H CAT.N))
		(!R4 (?X_I AGENT.N))
		(!R5 ((KA ((ADV-A (UNDER.P ?X_J)) HIDE.V)) ACTION.N))
		(!R6 (?Y ENTITY.N))
	)
	(:STEPS
		(?X_B (?X_I HAVE.8.V ?X_H))
		(?X_D (?X_H LIKE.9.V (KA ((ADV-A (UNDER.P ?X_J)) HIDE.V))))
		(?E_1 (?X_H HIDE.10.V ?Y))
		(?X_F (?X_H HIDE.11.V ?X_H))
	)
)

; "Rover liked to play fetch."
; "He played fetch all day."
; "He played fetch until his tail was wagging."
; "Then he stopped playing fetch."
(EPI-SCHEMA ((?X_E ((ADV-A (FOR.P (KA (DO.V ?X_E)))) STOP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E AGENT.N))
		(!R2 ((KA (PLAY.V FETCH.V)) ACTION.N))
		(!R3 (?A ACTION.N))
		(!R4 (?X_F AGENT.N))
		(!R5 ((ALL.D DAY.N) GAME.N))
		(!R6 (NOT ((ALL.D DAY.N) AGENT.N)))
	)
	(:STEPS
		(?X_B (?X_E LIKE.13.V (KA (PLAY.V FETCH.V))))
		(?X_D (?X_F STOP.14.V ?A))
		(?X_D (?X_F STOP.15.V))
	)
)

; "Sally's dog is white."
; "His name is Spot."
; "Spot likes to chase cars."
; "He chases them until he catches one."
; "Then he takes it home."
(EPI-SCHEMA ((?X_H
              (CHASE.V (SET-OF ?X_I ?X_J)
               (K (UNTIL.P (?X_H (CATCH.V IT.PRO))))))
             ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_H WHITE.A))
		(!R3 (?X_H DOG.N))
		(!R4 (?X_H SPOT.N))
		(!R5 (?X_I (PLUR CAR.N)))
		(!R6 (?X_F AGENT.N))
		(!R7 (?X_H (PERTAIN-TO ?X_F)))
		(!R8 (?X_G NAME.N))
		(!R9 (?X_G SPOT.A))
		(!R10 (?X_G (PERTAIN-TO ?X_H)))
		(!R11 ((KA (CHASE.V ?X_I)) ACTION.N))
		(!R12 (?X_J ENTITY.N))
	)
	(:STEPS
		(?X_E (?X_H LIKE.17.V (KA (CHASE.V ?X_I))))
		(?X_B (?X_H (KA CHASE.V) ?X_J (UNTIL.P (KE (?X_H (CATCH.V ?X_C))))))
		(?E_1 (?X_H CHASE.18.V ?X_I))
		(?E_2 (?X_H CHASE.18.V ?X_J))
	)
)

; "A little girl saw a puppy outside her window."
; "Her mother said no."
; "But the little girl kept begging."
; "So her mother agreed to look after it."
; "When the time came, the little girl put the puppy inside."
(EPI-SCHEMA ((?X_I (SEE.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_G MOTHER.N))
		(!R2 (?X_I LITTLE.A))
		(!R3 (?X_I GIRL.N))
		(!R4 (?X_G (PERTAIN-TO ?X_I)))
		(!R5 (?X_H ENTITY.N))
		(!R6 (NOT (?X_I = ?Y)))
		(!R7 (?A ACTION.N))
		(!R8 (?Y AGENT.N))
	)
	(:STEPS
		(?X_F (?X_I SEE.19.V ?X_H))
		(?X_C (?X_G (SAY.V ?X_A)))
		(?X_D
   (?X_G
    (SO.ADV ((ADV-A (FOR.P (KA ((ADV-A (AFTER.P ?X_B)) LOOK.V)))) AGREE.V))))
		(?E_1 (?X_I BEG.20.V ?Y ?A))
	)
)

; "Sammy is a puppy."
; "His mom says that he's cute."
; "His dad doesn't think so."
(EPI-SCHEMA ((?X_D (THINK.V (THAT (?X_C CUTE.A)))) ** ?E)
	(:ROLES
		(!R1 (?X_C MOM.N))
		(!R2 (?X_E AGENT.N))
		(!R3 (?X_C (PERTAIN-TO ?X_E)))
		(!R4 (?X_D DAD.N))
		(!R5 (?X_D (PERTAIN-TO ?X_E)))
	)
	(:STEPS
		(?X_A (?X_C (SAY.V (THAT (?X_E CUTE.A)))))
		(?X_B (NOT (?X_D (SO.ADV THINK.V))))
	)
)

; "Alice's mommy gave Alice a puppy for Christmas."
; "Alice named him Spot."
; "Spot is brown and white."
(EPI-SCHEMA ((?X_D (GIVE.V ?X_D ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C PUPPY.N))
		(!R2 (?X_C SPOT.N))
		(!R3 (?X_C BROWN.A))
		(!R4 (?X_C WHITE.A))
		(!R5 (?X_D AGENT.N))
		(!R6 (?X_C (FOR.P ?X_D)))
		(!R7 (?X_H MOMMY.N))
		(!R8 (?X_H (PERTAIN-TO ?X_G)))
		(!R9 (?X_G AGENT.N))
		(!R10 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_F (?X_H (GIVE.21.V ?X_G ?X_C)))
		(?X_B (?X_G (NAME.V (KE (?X_C SPOT.V)))))
	)
)

; "Jane's dog is black."
; "His name is Jack."
; "Jane has two cats named Kitty and Mouse."
(EPI-SCHEMA ((?X_C (HAVE.V (TWO.D (PLUR CAT.N)))) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_D NAME.N))
		(!R3 (?X_I BLACK.A))
		(!R4 (?X_I DOG.N))
		(!R5 (?X_D (PERTAIN-TO ?X_I)))
		(!R6 (?X_G KITTY.N))
		(!R7 (?X_H AGENT.N))
		(!R8 (?X_J AGENT.N))
		(!R9 (?X_I (PERTAIN-TO ?X_J)))
	)
	(:STEPS
		(?X_B (?X_D (= ?X_C)))
		(?X_F
   (?X_J HAVE.22.V
    (TWO.D
     (L X (AND (X (PLUR CAT.N)) (X ((PASV NAME.V) (SET-OF ?X_G ?X_H))))))))
	)
)

; "The boy's dog barked."
; "The boy yelled at him."
; "'Stop barking!'"
(EPI-SCHEMA ((?X_D ((ADV-A (AT.P ?X_C)) YELL.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C DOG.N))
		(!R2 (?X_D BOY.N))
		(!R3 (?X_C (PERTAIN-TO ?X_D)))
		(!R4 (?N NOISE.N))
	)
	(:STEPS
		(?X_F (?X_C BARK.23.V ?N))
		(?X_B (?X_D ((ADV-A (AT.P ?X_C)) YELL.V)))
	)
)

; "Mike has a dog."
; "His name is Spot."
; "Spot likes to play."
; "Spot loves to eat."
; "Spot sleeps a lot."
(EPI-SCHEMA ((?X_K (HAVE.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_H DOG.N))
		(!R2 (?X_H SPOT.N))
		(!R3 (?X_G NAME.N))
		(!R4 (?X_G SPOT.A))
		(!R5 (?X_G (PERTAIN-TO ?X_H)))
		(!R6 ((KA PLAY.V) ACTION.N))
		(!R7 ((KA EAT.V) ACTION.N))
		(!R8 (?X_K AGENT.N))
		(!R9 (?F FOOD.N))
	)
	(:STEPS
		(?X_D (?X_K HAVE.24.V ?X_H))
		(?X_F (?X_H LIKE.25.V (KA PLAY.V)))
		(?X_J (?X_H LOVE.26.V (KA EAT.V)))
		(?X_B (?X_H (A_LOT.ADV SLEEP.V)))
		(?E_1 (?X_K EAT.27.V ?F))
	)
)

; "[First person:] I love my dog."
; "I want to take him for a walk."
; "I don't have enough money."
; "My mom says no."
(EPI-SCHEMA ((?X_J (((ADV-A (FOR.P ?X_E)) TAKE.V) ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_F MOM.N))
		(!R2 (?X_I DOG.N))
		(!R3 (?X_E WALK.N))
		(!R4 (?X_I (PERTAIN-TO ?X_K)))
		(!R5 (?X_F (PERTAIN-TO ?X_K)))
		(!R6 (?X_J ENOUGH.A))
		(!R7 (?X_J MONEY.N))
		(!R8 (?X_I SMALLER-THAN.N ?X_K))
		(!R9 (?L2 DESTINATION.N))
		(!R10 (?X_J OBJECT.N))
		(!R11 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_D (?X_K (WANT.V (KA (((ADV-A (FOR.P ?X_E)) TAKE.V) ?X_I)))))
		(?E_1 (?X_K TAKE.28.V ?X_I ?L2))
		(?X_H (?X_K HAVE.29.V ?X_J))
		(?X_B (?X_F (NO.ADV SAY.V)))
	)
)

; "Sue loves dogs."
; "She has two dogs."
; "She takes them for walks."
; "She feeds them food."
(EPI-SCHEMA ((?X ((ADV-A (FOR.P ?L2)) SUE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_J (PLUR DOG.N)))
		(!R2 (NOT (?X_J ACTION.N)))
		(!R3 (?X AGENT.N))
		(!R4 ((TWO.D (PLUR DOG.N)) OBJECT.N))
		(!R5 (?X_K SMALLER-THAN.N ?X_L))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?X_K FOOD.N))
		(!R8 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_C (?X_A ((ADV-A (FOR.P (KA (LOVE.V ?X_J)))) SUE.V)))
		(?E_1 (?X LOVE.30.V ?X_J))
		(?X_E (?X_L HAVE.31.V (TWO.D (PLUR DOG.N))))
		(?E_2 (?X_J ((ADV-A (FROM.P ?L1)) WALK.32.V) ?L2))
		(?X_G (?X_L TAKE.33.V ?X_K ?L2))
		(?X_I (?X_L FEED.34.V ?X_K))
	)
)

; "Tommy's mom told him not to play with dogs."
; "He disobeyed his mom."
; "A dog bit Tommy."
; "His mom yelled at him."
; "Tommy ran away from home."
(EPI-SCHEMA ((?X_D (DISOBEY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C MOM.N))
		(!R2 (?X_D DOG.N))
		(!R3 (?X_D BIT.N))
		(!R4 (?X_C (PERTAIN-TO ?X_D)))
		(!R5 (?X_G HOME.N))
		(!R6 (NOT (?X_G = ?L2)))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_D (DISOBEY.V ?X_C)))
		(?X_B (?X_C ((ADV-A (AT.P ?X_D)) YELL.V)))
		(?X_F (?X_D ((ADV-A (FROM.P ?X_G)) RUN.35.V) ?L2))
	)
)



; "My brother came over today."
; "He brought me something."
; "It was a book."
; "It was a storybook."
; "I loved reading stories."
(EPI-SCHEMA ((?X_G (((ADV-A (TO.P ?L2)) BRING.V) ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_F BROTHER.N))
		(!R2 (?X_F (PERTAIN-TO ?X_G)))
		(!R3 (?X_H (PLUR STORY.N)))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_G SMALLER-THAN.N ?X_F))
		(!R6 (?X_G DESTINATION.N))
		(!R7 (?X_G AGENT.N))
		(!R8 ((KA (READ.V ?X_H)) ACTION.N))
	)
	(:STEPS
		(?X_A (?X_F ((ADV-A (FROM.P ?L1)) COME.1.V) ?L2))
		(?X_C (?X_F BRING.2.V ?X_G ?X_G))
		(?X_E (?X_G LOVE.3.V (KA (READ.V ?X_H))))
	)
)

; "Kate read a book."
; "The book was called \"Stories\"."
; "Kate liked the book."
; "She read it again."
(EPI-SCHEMA ((?X_J (READ.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR STORY.N)))
		(!R2 (?X_F BOOK.N))
		(!R3 (?X_I BOOK.N))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_B (?X_J (READ.V ?X_I)))
		(?X_E (?X_I ((PASV CALL.V) ?X_C)))
		(?X_H (?X_J (LIKE.V ?X_F)))
		(?X_L (?X_I ((AGAIN.ADV READ.V) ?X_J)))
	)
)

; "Tommy read a storybook."
; "His brother gave him a storybook."
; "He liked reading books."
(EPI-SCHEMA ((?X_I (READ.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D STORYBOOK.N))
		(!R2 (?X_H STORYBOOK.N))
		(!R3 (?X_E BROTHER.N))
		(!R4 (?X_E (PERTAIN-TO ?X_I)))
		(!R5 (?X_J (PLUR BOOK.N)))
		(!R6 (NOT (?X_H AGENT.N)))
		(!R7 (?X_I AGENT.N))
		(!R8 ((KA (READ.V ?X_J)) ACTION.N))
	)
	(:STEPS
		(?X_C (?X_I (READ.V ?X_D)))
		(?X_A (?X_E (GIVE.4.V ?X_I ?X_H)))
		(?X_G (?X_I LIKE.5.V (KA (READ.V ?X_J))))
	)
)

; "Tom read a book."
; "The book was full of pictures."
; "He liked the pictures."
; "He kept the book on his shelf."
(EPI-SCHEMA ((?X_I (LIKE.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_F SHELF.N))
		(!R2 (?X_J (PLUR PICTURE.N)))
		(!R3 (?X_E FULL.A))
		(!R4 (?X_E BOOK.N))
		(!R5 (?X_F (PERTAIN-TO ?X_I)))
		(!R6 (?X_I AGENT.N))
		(!R7 (NOT (?X_J ACTION.N)))
		(!R8 (NOT (?X_J AGENT.N)))
	)
	(:STEPS
		(?X_D (?X_I (READ.V ?X_E)))
		(?X_A (?X_E (OF.P ?X_J)))
		(?X_H (?X_I LIKE.6.V ?X_J))
		(?X_B (?X_I (((ADV-A (ON.P ?X_F)) KEEP.V) ?X_E)))
	)
)

; "Mary read a book."
; "She liked books."
; "She read many books."
; "She read a lot of books."
(EPI-SCHEMA ((?X_M (LIKE.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C LOT.N))
		(!R2 (?X_C (OF.P ?X_D)))
		(!R3 (?X_G MANY.A))
		(!R4 (?X_G (PLUR BOOK.N)))
		(!R5 (?X_J BOOK.N))
		(!R6 (?X_N (PLUR BOOK.N)))
		(!R7 (?X_M AGENT.N))
		(!R8 (NOT (?X_N ACTION.N)))
		(!R9 (NOT (?X_N AGENT.N)))
	)
	(:STEPS
		(?X_I (?X_M (READ.V ?X_J)))
		(?X_L (?X_M LIKE.7.V ?X_N))
		(?X_F (?X_M (READ.V ?X_G)))
		(?X_B (?X_M (READ.V ?X_C)))
	)
)

; "Sammy read the storybook."
; "It had many pictures."
; "He liked the pictures."
(EPI-SCHEMA ((?X_H (LIKE.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_I MANY.A))
		(!R2 (?X_I (PLUR PICTURE.N)))
		(!R3 (?X_E STORYBOOK.N))
		(!R4 (?X_H AGENT.N))
		(!R5 (NOT (?X_I ACTION.N)))
		(!R6 (NOT (?X_I AGENT.N)))
	)
	(:STEPS
		(?X_D (?X_H (READ.V ?X_E)))
		(?X_B (?X_E (HAVE.V ?X_I)))
		(?X_G (?X_H LIKE.8.V ?X_I))
	)
)

; "Tom read a book."
; "He liked to read."
; "He started reading a book."
; "He read for hours."
; "He finished the book."
(EPI-SCHEMA ((?X_M ((ADV-A (FOR.P ?X_E)) READ.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR HOUR.N)))
		(!R2 (?X_J BOOK.N))
		(!R3 (?X_M AGENT.N))
		(!R4 ((KA READ.V) ACTION.N))
	)
	(:STEPS
		(?X_I (?X_M (READ.V ?X_J)))
		(?X_L (?X_M LIKE.9.V (KA READ.V)))
		(?X_G (?X_M ((ADV-A (FOR.P (KA (READ.V ?X_J)))) START.V)))
		(?X_D (?X_M ((ADV-A (FOR.P ?X_E)) READ.V)))
		(?X_B (?X_M (FINISH.V ?X_J)))
	)
)

; "Alice read a storybook."
; "The pictures were interesting."
; "The story was fun."
(EPI-SCHEMA ((?X_A (READ.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_A AGENT.N))
		(!R2 (?X_B STORYBOOK.N))
		(!R3 (?X_E STORY.N))
		(!R4 (?X_F FUN.N))
	)
	(:STEPS
		(?X_D (?X_A (READ.V ?X_B)))
		(?X_H (?X_E (= ?X_F)))
	)
)

; "Tom read a story."
; "He liked to read books."
; "He read a lot."
; "He read a book."
(EPI-SCHEMA ((?X_K (READ.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C BOOK.N))
		(!R2 (?X_H STORY.N))
		(!R3 (?X_L (PLUR BOOK.N)))
		(!R4 (?X_K AGENT.N))
		(!R5 ((KA (READ.V ?X_L)) ACTION.N))
	)
	(:STEPS
		(?X_G (?X_K (READ.V ?X_H)))
		(?X_J (?X_K LIKE.10.V (KA (READ.V ?X_L))))
		(?X_E (?X_K (A_LOT.ADV READ.V)))
		(?X_B (?X_K (READ.V ?X_C)))
	)
)

; "Tom read a storybook to Jenny."
; "He told Jenny a story."
; "Tom liked reading books."
(EPI-SCHEMA ((?X_G (TELL.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C STORY.N))
		(!R2 (?X_G AGENT.N))
		(!R3 (?X_F STORYBOOK.N))
		(!R4 (?X_F (TO.P ?X_G)))
		(!R5 (?X_K (PLUR BOOK.N)))
		(!R6 (?X_J AGENT.N))
		(!R7 ((KA (READ.V ?X_K)) ACTION.N))
	)
	(:STEPS
		(?X_E (?X_J (READ.V ?X_F)))
		(?X_B (?X_J (TELL.V ?X_G ?X_C)))
		(?X_I (?X_J LIKE.11.V (KA (READ.V ?X_K))))
	)
)

; "Bill wrote a story."
; "He wrote on paper."
; "He put his pen down."
(EPI-SCHEMA ((?X_J (WRITE_DOWN.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_D PAPER.N))
		(!R2 (?X_G STORY.N))
		(!R3 (?X_H BILL.N))
		(!R4 (?X_I PEN.N))
		(!R5 (?X_I (PERTAIN-TO ?X_J)))
		(!R6 (?X_J AGENT.N))
		(!R7 (?L LOCATION.N))
	)
	(:STEPS
		(?X_F (?X_H (WRITE.V ?X_G)))
		(?X_C (?X_J ((ADV-A (ON.P ?X_D)) WRITE.V)))
		(?X_A (?X_J PUT.12.V ?X_I ?L))
	)
)

; "Tom wrote a story."
; "He read it to his friends."
; "His friends liked the story."
; "Tom thought that he would become a famous writer."
(EPI-SCHEMA ((?X_I (WRITE.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_H (PLUR FRIEND.N)))
		(!R2 (?X_J STORY.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_H (PERTAIN-TO ?X_I)))
		(!R5 (?X_J OBJECT.N))
		(!R6 (NOT (?X_J ACTION.N)))
		(!R7 (NOT (?X_J AGENT.N)))
	)
	(:STEPS
		(?X_G (?X_I (WRITE.V ?X_J)))
		(?X_B (?X_I (((ADV-A (TO.P ?X_H)) READ.V) ?X_J)))
		(?X_C (?X_H LIKE.13.V ?X_J))
		(?X_E
   (?X_I
    (THINK.V
     (THAT (?X_I (WILL.MD (BECOME.V (L X (AND (X FAMOUS.A) (X WRITER.N))))))))))
	)
)

; "Tom read some books."
; "He liked them all."
; "He read one book a week."
; "His favorite book was The Adventures of Tom Sawyer."
(EPI-SCHEMA ((?X_C
              (LIKE.V
               (KE ((ALL.D (PLUR {REF}.N)) (OF.P ?X_C) (HE.PRO READ.V)))))
             ** ?E)
	(:ROLES
		(!R1 (?X_C BOOK.N))
		(!R2 (?X_D WEEK.N))
		(!R3 (?X_G (PLUR BOOK.N)))
		(!R4 (?X_H AGENT.N))
		(!R5 (?X_I (PERTAIN-TO ?X_H)))
		(!R6 (?X_J FAVORITE.A))
		(!R7 (?X_I ?X_J BOOK.N))
	)
	(:STEPS
		(?X_F (?X_H (READ.V ?X_G)))
		(?X_L (?X_H LIKE.14.V (ALL.D ({OF}.P ?X_G))))
		(?X_B ((ADV-E ({DURING}.P ?X_D)) (?X_H (READ.V ?X_C))))
	)
)

; "Jack wrote a story."
; "It was about a boy who played baseball."
; "His name was Tom."
; "He liked baseball."
; "He played on a team called the Yankees."
(EPI-SCHEMA ((?X_P (WRITE.V ?X_P)) ** ?E)
	(:ROLES
		(!R1 (?X_B AGENT.N))
		(!R2 (?X_N NAME.N))
		(!R3 (?X_E BOY.N))
		(!R4 (?X_H STORY.N))
		(!R5 (?X_I AGENT.N))
		(!R6 (?X_O BASEBALL.N))
		(!R7 (?X_P BASEBALL.N))
		(!R8 (?X_N (PERTAIN-TO ?X_P)))
		(!R9 (?X_O OBJECT.N))
		(!R10 (NOT (?X_O ACTION.N)))
		(!R11 (NOT (?X_O AGENT.N)))
		(!R12 (?X_P AGENT.N))
	)
	(:STEPS
		(?X_G (?X_I (WRITE.V ?X_H)))
		(?X_D (?X_H ((ADV-A (ABOUT.P ?X_E)) BE.V)))
		(?X_A (?X_N (= ?X_B)))
		(?X_K (?X_P LIKE.15.V ?X_O))
		(?X_M (?X_P PLAY.16.V))
	)
)

; "Tom is a good writer."
; "His work is published."
; "He writes for magazines."
; "He has an agent."
; "He gets paid well."
(EPI-SCHEMA ((?X_E ((ADV-A (FOR.P ?X_C)) WRITE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR MAGAZINE.N)))
		(!R2 (?X_E GOOD.A))
		(!R3 (?X_E WRITER.N))
		(!R4 (?X_D WORK.N))
		(!R5 (?X_D (PERTAIN-TO ?X_E)))
		(!R6 (?X_H AGENT.N))
		(!R7 (?X_H OBJECT.N))
	)
	(:STEPS
		(?X_B (?X_E ((ADV-A (FOR.P ?X_C)) WRITE.V)))
		(?X_G (?X_E HAVE.17.V ?X_H))
	)
)

; "Tom wrote a book."
; "His book was good."
; "He read some parts of his book."
; "He liked his book."
(EPI-SCHEMA ((?X_I (LIKE.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_J GOOD.A))
		(!R2 (?X_J BOOK.N))
		(!R3 (?X_J (PERTAIN-TO ?X_I)))
		(!R4 (?X_G AGENT.N))
		(!R5 (?X_H AGENT.N))
		(!R6 (?X_J (PERTAIN-TO ?X_H)))
		(!R7 (?X_I AGENT.N))
		(!R8 (NOT (?X_J ACTION.N)))
		(!R9 (NOT (?X_J AGENT.N)))
	)
	(:STEPS
		(?X_F (?X_G (WRITE.V ?X_J)))
		(?X_D (?X_I (READ.V ?X_A)))
		(?X_B (?X_I LIKE.18.V ?X_J))
	)
)



; "Bill loves to play golf."
; "His favorite club is a driver."
; "He plays on the course every day."
; "Today he hit a ball into the woods."
; "He walked through the woods looking for it."
(EPI-SCHEMA ((?X (PLAY.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C BALL.N))
		(!R2 (?X_D (PLUR WOOD.N)))
		(!R3 (?X_K BILL.N))
		(!R4 (?X_E TODAY.N))
		(!R5 (?X_J GOLF.N))
		(!R6 (?X_F DRIVER.N))
		(!R7 (?X_F (PERTAIN-TO ?X_K)))
		(!R8 (?X_G FAVORITE.A))
		(!R9 (?X_F ?X_G CLUB.N))
		(!R10 ((KA (PLAY.V ?X_J)) ACTION.N))
		(!R11 (?X AGENT.N))
		(!R12 (?L2 DESTINATION.N))
		(!R13 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_A (?X_K LOVE.1.V (KA (PLAY.V ?X_J))))
		(?X_B ((ADV-E ({DURING}.P ?X_E)) (?X_K (((ADV-A (INTO.P ?X_D)) HIT.V) ?X_C))))
		(?E_1 (?X PLAY.2.V))
		(?X_I (?X_K ((ADV-A (FROM.P ?L1)) WALK.3.V) ?L2))
	)
)

; "Bill played golf."
; "He putted around the holes."
; "He drove the ball into the woods."
; "He searched for the ball."
(EPI-SCHEMA ((?X_O ((ADV-A (WITH.P ?X_L)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C BALL.N))
		(!R2 (?X_F GOLF.N))
		(!R3 (?X_K BILL.N))
		(!R4 (?X_L (PLUR HOLE.N)))
		(!R5 (?X_N BALL.N))
		(!R6 (?X_M (PLUR WOOD.N)))
		(!R7 (?X_K AGENT.N))
		(!R8 (?X_L LOCATION.N))
		(!R9 (?X_O AGENT.N))
		(!R10 (?X_M DESTINATION.N))
		(!R11 (?X_N SMALLER-THAN.N ?X_O))
	)
	(:STEPS
		(?X_E (?X_K PLAY.4.V))
		(?X_H (?X_O PUT_AROUND.5.V ?X_L ?X_L))
		(?X_J (?X_O DRIVE.6.V ?X_N ?X_M))
		(?X_B (?X_O ((ADV-A (FOR.P ?X_C)) SEARCH.V)))
	)
)

; "Bob likes to go fishing."
; "He takes a pole and line."
; "He goes fishing in the river."
; "He fishes for fish."
; "He catches lots of fish."
(EPI-SCHEMA ((?X_R (LIKE.V (KA (DO.V ?X_O)))) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR LOT.N)))
		(!R2 (?X_C (OF.P ?X_D)))
		(!R3 (?X_G FISH.N))
		(!R4 (?X_J FISHING.N))
		(!R5 (?X_K RIVER.N))
		(!R6 (?X_N LINE.N))
		(!R7 (?X_O POLE.N))
		(!R8 ((KA (GO.V (KA FISH.V))) ACTION.N))
		(!R9 (?X_R AGENT.N))
		(!R10 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_Q (?X_R LIKE.7.V (KA (GO.V (KA FISH.V)))))
		(?X_M (?X_R (TAKE.V (SET-OF ?X_O ?X_N))))
		(?X_I (?X_R (((ADV-A (IN.P ?X_K)) GO.V) ?X_J)))
		(?X_F (?X_R ((ADV-A (FOR.P ?X_G)) FISH.V)))
		(?X_B (?X_R (CATCH.V ?X_C)))
		(?E_1 (?X_R ((ADV-A (FROM.P ?L1)) GO.8.V) ?L2))
	)
)

; "A golfer has many clubs."
; "There's a tee box."
; "A fairway."
; "And a green."
; "You can use a putter or a wedge."
(EPI-SCHEMA ((?X_G (HAVE.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_D TEE.N))
		(!R2 (?X_D BOX.N))
		(!R3 (?X_H MANY.A))
		(!R4 (?X_H (PLUR CLUB.N)))
		(!R5 (?X_G GOLFER.N))
		(!R6 (?X_H OBJECT.N))
	)
	(:STEPS
		(?X_F (?X_G HAVE.9.V ?X_H))
		(?X_C (?X_A (BE.V ?X_D)))
	)
)

; "Tom played golf."
; "He drove the ball over the green."
; "He drove the ball into the woods."
; "He found the ball in the woods."
; "He putted the ball onto the green."
(EPI-SCHEMA ((?X_N ((ADV-A (WITH.P ?X_M)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C GOLF.N))
		(!R2 (?X_M BALL.N))
		(!R3 (?X_L GREEN.N))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_L DESTINATION.N))
		(!R6 (?X_M SMALLER-THAN.N ?X_N))
		(!R7 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_B (?X_N PLAY.10.V))
		(?X_E (?X_N DRIVE.11.V ?X_M ?L2))
		(?X_G (?X_N DRIVE.6.V ?X_M ?X_L))
		(?X_I (?X_N FIND.12.V ?X_M))
		(?X_K (?X_N PUT.13.V ?X_M ?X_L))
	)
)

; "Billy played golf."
; "He missed the ball."
; "He couldn't find the ball."
; "He looked all over."
; "He lost the ball."
(EPI-SCHEMA ((?X_K (FIND.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_G BALL.N))
		(!R2 (?X_J GOLF.N))
		(!R3 (?X_K AGENT.N))
	)
	(:STEPS
		(E194.SK (NOT (?X_K ((CAN.MD FIND.V) ?X_G))))
		(?X_I (?X_K PLAY.14.V))
		(?X_F (?X_K (MISS.V ?X_G)))
		(?X_D (?X_K ((ADV (ALL.ADV OVER.A)) LOOK.V)))
		(?X_B (?X_K (LOSE.V ?X_G)))
	)
)

; "Sammy played golf."
; "He liked the game."
; "He had fun playing golf."
; "He enjoyed swinging his clubs."
; "He played golf every day."
(EPI-SCHEMA ((?X_P (PLAY.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E GOLF.N))
		(!R2 (?X_F FUN.N))
		(!R3 (?X_O GOLF.N))
		(!R4 (?X_K (PLUR CLUB.N)))
		(!R5 (?X_K (PERTAIN-TO ?X_P)))
		(!R6 (?X_N GOLF.N))
		(!R7 (?X_O OBJECT.N))
		(!R8 (NOT (?X_O ACTION.N)))
		(!R9 (NOT (?X_O AGENT.N)))
		(!R10 (?X AGENT.N))
		(!R11 (?X_P AGENT.N))
	)
	(:STEPS
		(?X_H (?X_P PLAY.15.V))
		(?X_J (?X_P LIKE.16.V ?X_O))
		(?X_D (?X_P (HAVE.V (KE (?X_F (PLAY.V ?X_E))))))
		(?E_1 (?X PLAY.2.V))
		(?X_B (?X_P ENJOY.17.V (IND (4 ?X_A))))
		(?X_M (?X_P PLAY.18.V))
	)
)

; "Bill played golf."
; "He liked to play."
; "He enjoyed playing golf."
; "He missed playing golf."
(EPI-SCHEMA ((?X_N (PLAY.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D GOLF.N))
		(!R2 (?X_G GOLF.N))
		(!R3 (?X_M BILL.N))
		(!R4 (?X_J GOLF.N))
		(!R5 (?X_M AGENT.N))
		(!R6 ((KA PLAY.V) ACTION.N))
		(!R7 (?X_N AGENT.N))
		(!R8 (?X AGENT.N))
	)
	(:STEPS
		(?X_F (?X_M PLAY.19.V))
		(?X_I (?X_N LIKE.20.V (KA PLAY.V)))
		(?E_1 (?X PLAY.2.V))
		(?X_L (?X_N ENJOY.21.V (IND (2 ?X_A))))
		(?X_C (?X_N ((ADV-A (FOR.P (KA (PLAY.V ?X_D)))) MISS.V)))
		(?E_2 (?X PLAY.2.V))
	)
)

; "Mary likes to read books."
; "Her favorite book is about animals."
; "Yesterday she took her dog to the park."
; "She found an old book that she liked."
; "She looked inside and saw pictures of different kinds of animals."
(EPI-SCHEMA ((?X_U (((ADV-A (FOR.P ?X_R)) TAKE.V) ?X_S)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR ANIMAL.N)))
		(!R2 (?X_K (PERTAIN-TO ?X_U)))
		(!R3 (?X_Q (PLUR BOOK.N)))
		(!R4 (?X_R PARK.N))
		(!R5 (?X_H FAVORITE.A))
		(!R6 (?X_T ?X_H BOOK.N))
		(!R7 (?X_S DOG.N))
		(!R8 (?X_S (PERTAIN-TO ?X_U)))
		(!R9 (?X_L FAVORITE.A))
		(!R10 (?X_K ?X_L BOOK.N))
		(!R11 (?X_M DIFFERENT.A))
		(!R12 (?X_P ?X_M (PLUR KIND.N)))
		(!R13 (?X_N (PLUR ANIMAL.N)))
		(!R14 (?X_P (OF.P ?X_N)))
		(!R15 (?X_O (PLUR PICTURE.N)))
		(!R16 (?X_O (OF.P ?X_P)))
		(!R17 ((KA (READ.V ?X_Q)) ACTION.N))
		(!R18 (?X_R DESTINATION.N))
		(!R19 (?X_S SMALLER-THAN.N ?X_U))
		(!R20 (?X_T ENTITY.N))
		(!R21 (?X_U AGENT.N))
	)
	(:STEPS
		(?X_G (?X_U LIKE.23.V (KA (READ.V ?X_Q))))
		(?X_A (?X_K ((ADV-A (ABOUT.P ?X_E)) BE.V)))
		(?X_B (?X_U TAKE.24.V ?X_S ?X_R))
		(?X_J (?X_U FIND.12.V ?X_T))
		(?X_C (?X_U (INSIDE.ADV LOOK.V)))
		(?X_D (?X_U SEE.25.V ?X_O))
	)
)

; "Amy loves reading books."
; "Her favorite book is about sports."
; "She reads many books."
; "She looks for good books."
(EPI-SCHEMA ((?X_N (LOVE.V (KA (READ.V ?X_M)))) ** ?E)
	(:ROLES
		(!R1 (?X_D GOOD.A))
		(!R2 (?X_D (PLUR BOOK.N)))
		(!R3 (?X_G MANY.A))
		(!R4 (?X_G (PLUR BOOK.N)))
		(!R5 (?X_H (PLUR SPORT.N)))
		(!R6 (?X_I (PERTAIN-TO ?X_N)))
		(!R7 (?X_J FAVORITE.A))
		(!R8 (?X_I ?X_J BOOK.N))
		(!R9 (?X_M (PLUR BOOK.N)))
		(!R10 ((KA (READ.V ?X_M)) ACTION.N))
		(!R11 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_L (?X_N LOVE.26.V (KA (READ.V ?X_M))))
		(?X_A (?X_I ((ADV-A (ABOUT.P ?X_H)) BE.V)))
		(?X_F (?X_N (READ.V ?X_G)))
		(?X_C (?X_N ((ADV-A (FOR.P ?X_D)) LOOK.V)))
	)
)

; "Mary loves reading books."
; "She reads many books."
; "She has a lot of books."
; "She has lots of bookshelves."
(EPI-SCHEMA ((?X_N (HAVE.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C MANY.A))
		(!R2 (?X_C (PLUR BOOK.N)))
		(!R3 (?X_L (PLUR BOOK.N)))
		(!R4 (?X_H (PLUR BOOK.N)))
		(!R5 (?X_M LOT.N))
		(!R6 (?X_M (OF.P ?X_H)))
		(!R7 (?X_K (PLUR BOOKSHELVE.N)))
		(!R8 (?X_O (PLUR LOT.N)))
		(!R9 (?X_O (OF.P ?X_K)))
		(!R10 ((KA (READ.V ?X_L)) ACTION.N))
		(!R11 (?X_M OBJECT.N))
		(!R12 (?X_N AGENT.N))
		(!R13 (?X_O OBJECT.N))
	)
	(:STEPS
		(?X_E (?X_N LOVE.27.V (KA (READ.V ?X_L))))
		(?X_B (?X_N (READ.V ?X_C)))
		(?X_G (?X_N HAVE.28.V ?X_M))
		(?X_J (?X_N HAVE.29.V ?X_O))
	)
)

; "Jane loves reading books."
; "Her favorite book is about horses."
; "She reads books all the time."
; "She takes her book everywhere."
(EPI-SCHEMA ((?X_M (READ.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR HORSE.N)))
		(!R2 (?X_I (PERTAIN-TO ?X_M)))
		(!R3 (?X_K (PLUR BOOK.N)))
		(!R4 (?X_J FAVORITE.A))
		(!R5 (?X_I ?X_J BOOK.N))
		(!R6 (?X_L BOOK.N))
		(!R7 (?X_L FAVORITE.A))
		(!R8 (?X_L (PERTAIN-TO ?X_M)))
		(!R9 ((KA (READ.V ?X_K)) ACTION.N))
		(!R10 (?X_M AGENT.N))
		(!R11 (?X_L SMALLER-THAN.N ?X_M))
		(!R12 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_H (?X_M LOVE.30.V (KA (READ.V ?X_K))))
		(?X_B (?X_I ((ADV-A (ABOUT.P ?X_F)) BE.V)))
		(?X_E (?X_M (READ.V ?X_A)))
		(?X_C (?X_M TAKE.31.V ?X_L ?L2))
	)
)

; "Mary has lots of books."
; "She reads all the time."
; "She loves reading."
; "She looks for good books."
(EPI-SCHEMA ((?X_J (HAVE.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_C GOOD.A))
		(!R2 (?X_C (PLUR BOOK.N)))
		(!R3 (?X_F (PLUR BOOK.N)))
		(!R4 (?X_I (PLUR LOT.N)))
		(!R5 (?X_I (OF.P ?X_F)))
		(!R6 (?X_I OBJECT.N))
		(!R7 (?X_J AGENT.N))
		(!R8 ((KA READ.V) ACTION.N))
	)
	(:STEPS
		(?X_E (?X_J HAVE.32.V ?X_I))
		(?X_H (?X_J LOVE.33.V (KA READ.V)))
		(?X_B (?X_J ((ADV-A (FOR.P ?X_C)) LOOK.V)))
	)
)

; "Tom has many books on his shelf."
; "His bookshelves have lots of books."
; "Books can be hard or soft."
; "Tom's books were hard."
(EPI-SCHEMA ((?X_C (HAVE.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_H (PLUR LOT.N)))
		(!R2 (?X_B (PLUR BOOKSHELVE.N)))
		(!R3 (?X_B (PERTAIN-TO ?X_H)))
		(!R4 (?X_C (PLUR BOOK.N)))
		(!R5 (?X_H (OF.P ?X_C)))
		(!R6 (?X_D HARD.A))
		(!R7 (?X_D (PLUR BOOK.N)))
		(!R8 (?X_D (PERTAIN-TO ?X_H)))
		(!R9 (?X_G MANY.A))
		(!R10 (?X_G (PLUR BOOK.N)))
		(!R11 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_F (?X_H HAVE.34.V ?X_G))
		(?X_A (?X_B (HAVE.V ?X_H)))
	)
)

; "Alice loves reading books."
; "She reads all the time."
; "She has lots of books."
; "She takes them everywhere."
; "She always carries a book with her."
(EPI-SCHEMA ((?X_M (((ADV-A (FOR.P (KA READ.V))) TAKE.V) ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_I (PLUR LOT.N)))
		(!R2 (?X_J (PLUR BOOK.N)))
		(!R3 (?X_I (OF.P ?X_J)))
		(!R4 (?X_K (PLUR BOOK.N)))
		(!R5 (?X_L BOOK.N))
		(!R6 (?X_L (WITH.P ?X_M)))
		(!R7 ((KA (READ.V ?X_K)) ACTION.N))
		(!R8 (?X_I OBJECT.N))
		(!R9 (?X_J SMALLER-THAN.N ?X_M))
		(!R10 (?X_K DESTINATION.N))
		(!R11 (?X_M AGENT.N))
		(!R12 (?X_L SMALLER-THAN.N ?X_M))
		(!R13 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_M LOVE.35.V (KA (READ.V ?X_K))))
		(?X_D (?X_M HAVE.36.V ?X_I))
		(?X_F (?X_M TAKE.24.V ?X_J ?X_K))
		(?X_H (?X_M CARRY.37.V ?X_L ?L2))
	)
)

; "Mary read a book."
; "The pages were yellow."
; "She read the book."
; "She liked the book."
(EPI-SCHEMA ((?X_G (READ.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_H BOOK.N))
		(!R2 (?X_G AGENT.N))
		(!R3 (NOT (?X_H ACTION.N)))
		(!R4 (NOT (?X_H AGENT.N)))
	)
	(:STEPS
		(?X_D (?X_G (READ.V ?X_H)))
		(?X_B (?X_G (READ.V ?X_H)))
		(?X_F (?X_G LIKE.38.V ?X_H))
	)
)

; "Tom has been reading all summer."
; "He's read many books."
; "His favorite book is about sports."
; "He reads to learn new things."
(EPI-SCHEMA ((?X_H (READ.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B MANY.A))
		(!R2 (?X_B (PLUR BOOK.N)))
		(!R3 (?X_G ?X_E BOOK.N))
		(!R4 (?X_F (PLUR SPORT.N)))
		(!R5 (?X_H AGENT.N))
		(!R6 (?X_G (PERTAIN-TO ?X_H)))
		(!R7 (?X_I NEW.A))
		(!R8 (?X_I (PLUR THING.N)))
	)
	(:STEPS
		(?X_D (?X_H (READ.V ?X_B)))
		(?X_A (?X_G ((ADV-A (ABOUT.P ?X_F)) BE.V)))
		(?X_K (?X_H ((ADV-A (FOR.P (KA (LEARN.V ?X_I)))) READ.V)))
	)
)



; "Sammy loves playing soccer."
; "His team won last year."
; "This year they lost."
; "They were sad about it."
(EPI-SCHEMA ((?X_I (LOVE.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_G YEAR.N))
		(!R2 (?X_H TEAM.N))
		(!R3 (?X_H SAD.A))
		(!R4 (?X_H AGENT.N))
		(!R5 (?X_H (PERTAIN-TO ?X_I)))
		(!R6 (?X_J SOCCER.N))
		(!R7 (?X_I AGENT.N))
		(!R8 ((KA (PLAY.V ?X_J)) ACTION.N))
		(!R9 (?X AGENT.N))
	)
	(:STEPS
		(?X_B (?X_I LOVE.1.V (KA (PLAY.V ?X_J))))
		(?X_C ((ADV-E ({DURING}.P (LAST.D YEAR.N))) (?X_H WIN.V)))
		(?X_F ((ADV-E ({DURING}.P ?X_G)) (?X_H LOSE.V)))
		(?X_D (?X_H (ABOUT.P ?X_A)))
		(?E_1 (?X PLAY.2.V))
	)
)

; "Sammy played soccer."
; "His team won."
; "He scored a goal."
(EPI-SCHEMA ((?X_F (COMPOSITE-SCHEMA.PR ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C GOAL.N))
		(!R2 (?X_G AGENT.N))
		(!R3 (?X_F TEAM.N))
		(!R4 (?X_F (PERTAIN-TO ?X_G)))
		(!R5 (?X_J SOCCER.N))
		(!R6 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_E (?X_F WIN.V))
		(?X_I (?X_K PLAY.3.V))
		(?X_B (?X_G (SCORE.V ?X_C)))
	)
)

; "Mark played soccer."
; "His team won last time."
; "This year they lost again."
; "They were sad about that."
(EPI-SCHEMA ((?X_M PLAY.V) ** ?E)
	(:ROLES
		(!R1 (?X_C {REF}.N))
		(!R2 (?X_I SAD.A))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_F YEAR.N))
		(!R5 (?X_G LAST.A))
		(!R6 (?X_G TIME.N))
		(!R7 (?X_H TEAM.N))
		(!R8 (?X_H (PERTAIN-TO ?X_I)))
		(!R9 (?X_L SOCCER.N))
		(!R10 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_K (?X_M PLAY.4.V))
		(?X_A (?X_H (WIN.V ?X_G)))
		(?X_E ((ADV-E ({DURING}.P ?X_F)) (?X_I (AGAIN.ADV LOSE.V))))
		(?X_B (?X_I (ABOUT.P ?X_C)))
	)
)

; "Kate played soccer."
; "She wore shorts and a shirt."
; "She kicked the ball around."
; "She scored lots of goals."
(EPI-SCHEMA ((?X_M ((ADV-A (WITH.P (SET-OF ?X_N ?X_O))) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR LOT.N)))
		(!R2 (?X_C (OF.P ?X_D)))
		(!R3 (?X_G BALL.N))
		(!R4 (?X_J SOCCER.N))
		(!R5 (?X_O SHIRT.N))
		(!R6 (?X_N (PLUR SHORT.N)))
		(!R7 (?X_M AGENT.N))
		(!R8 (NOT ((SET-OF ?X_N ?X_O) AGENT.N)))
		(!R9 ((SET-OF ?X_N ?X_O) OBJECT.N))
	)
	(:STEPS
		(?X_I (?X_M PLAY.5.V))
		(?X_L (?X_M WEAR.6.V (SET-OF ?X_N ?X_O)))
		(?X_F (?X_M ((AROUND.ADV KICK.V) ?X_G)))
		(?X_B (?X_M (SCORE.V ?X_C)))
	)
)

; "Sammy's team played soccer."
; "They lost again."
; "They were disappointed."
; "They were sad."
(EPI-SCHEMA ((?X_C (AGAIN.ADV LOSE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G TEAM.N))
		(!R2 (?X_G DISAPPOINTED.A))
		(!R3 (?X_G SAD.A))
		(!R4 (?X_C AGENT.N))
		(!R5 (?X_G (PERTAIN-TO ?X_C)))
		(!R6 (?X_F SOCCER.N))
		(!R7 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_E (?X_G PLAY.8.V))
		(?X_B (?X_G (AGAIN.ADV LOSE.V)))
	)
)

; "Tom played soccer on Saturday."
; "His team lost."
; "Tom felt bad."
(EPI-SCHEMA ((?X_J (LOSE.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C BAD.A))
		(!R2 (?X_F TEAM.N))
		(!R3 (?X_F (PERTAIN-TO ?X_J)))
		(!R4 (?X_I SOCCER.N))
		(!R5 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_E (?X_F LOSE.V))
		(?X_H (?X_J PLAY.9.V))
		(?X_B (?X_J (FEEL.V ?X_C)))
	)
)

; "Sammy played soccer."
; "His team won last year."
; "This year they lost."
; "They were sad."
(EPI-SCHEMA ((?X_I (PLAY.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_D YEAR.N))
		(!R2 (?X_H TEAM.N))
		(!R3 (?X_H AGENT.N))
		(!R4 (?X_H SAD.A))
		(!R5 (?X_G SOCCER.N))
		(!R6 (?X_H (PERTAIN-TO ?X_I)))
		(!R7 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_F (?X_I PLAY.10.V))
		(?X_A ((ADV-E ({DURING}.P (LAST.D YEAR.N))) (?X_H WIN.V)))
		(?X_C ((ADV-E ({DURING}.P ?X_D)) (?X_H LOSE.V)))
	)
)

; "Tina played soccer."
; "Her team won the championship."
; "She scored a goal."
; "She was happy."
(EPI-SCHEMA ((?X_G PLAY.V) ** ?E)
	(:ROLES
		(!R1 (?X_D GOAL.N))
		(!R2 (?X_G AGENT.N))
		(!R3 (?X_G HAPPY.A))
		(!R4 (?X_E CHAMPIONSHIP.N))
		(!R5 (?X_F TEAM.N))
		(!R6 (?X_F (PERTAIN-TO ?X_G)))
		(!R7 (?X_J SOCCER.N))
		(!R8 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_I (?X_K PLAY.11.V))
		(?X_A (?X_F (WIN.V ?X_E)))
		(?X_C (?X_G (SCORE.V ?X_D)))
	)
)

; "Sammy played soccer."
; "His team won the championship."
; "This year they lost again."
; "They weren't happy."
(EPI-SCHEMA ((?X_G ((ADV-A (DURING.P ?X_D)) LOSE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G AGENT.N))
		(!R2 (NOT (?X_G HAPPY.A)))
		(!R3 (?X_D YEAR.N))
		(!R4 (?X_E CHAMPIONSHIP.N))
		(!R5 (?X_F TEAM.N))
		(!R6 (?X_F (PERTAIN-TO ?X_G)))
		(!R7 (?X_J SOCCER.N))
		(!R8 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_I (?X_K PLAY.12.V))
		(?X_A (?X_F (WIN.V ?X_E)))
		(?X_C ((ADV-E ({DURING}.P ?X_D)) (?X_G (AGAIN.ADV LOSE.V))))
	)
)

; "Tom played baseball."
; "He went to play baseball."
; "He joined other boys who were playing."
; "They played baseball."
; "They lost the game."
(EPI-SCHEMA ((?X_Q (PLAY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C GAME.N))
		(!R2 (?X_F ?X_G (PLUR BOY.N)))
		(!R3 (?X_J BASEBALL.N))
		(!R4 (?X_M BASEBALL.N))
		(!R5 (?X_P BASEBALL.N))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?X_Q AGENT.N))
		(!R8 (?X_R AGENT.N))
	)
	(:STEPS
		(?X_I (?X_Q PLAY.14.V))
		(?X_L (?X_Q ((ADV-A (FROM.P ?L1)) GO.15.V) ?L2))
		(?X_E (?X_Q (JOIN.V ?X_F)))
		(?E_1 (?X_Q PLAY.16.V))
		(?X_O (?X_R PLAY.17.V))
		(?X_B (?X_R (LOSE.V ?X_C)))
	)
)

; "Bob played baseball."
; "His friends were there."
; "He played hard."
; "He was tired."
; "He went home."
(EPI-SCHEMA ((?X_J (HARD.ADV PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_J TIRED.A))
		(!R2 (?X_D (PLUR FRIEND.N)))
		(!R3 (?X_D (PERTAIN-TO ?X_J)))
		(!R4 (?X_G BASEBALL.N))
		(!R5 (?X_K HOME.N))
		(!R6 (?X_K (PERTAIN-TO ?X_J)))
		(!R7 (?X_J AGENT.N))
		(!R8 (?X_K DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_J PLAY.18.V))
		(?X_A (?X_D (THERE.ADV BE.V)))
		(?X_C (?X_J (HARD.ADV PLAY.V)))
		(?X_I (?X_J ((ADV-A (FROM.P ?L1)) GO.13.V) ?X_K))
	)
)

; "A boy came to play on the playground."
; "He played for a while."
; "Then he went home."
; "The boy's mother asked him how he liked the playground."
(EPI-SCHEMA ((?X ((ADV-A (FOR.P ?X_C)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C WHILE.N))
		(!R2 (?X_E BOY.N))
		(!R3 (?X_D MOTHER.N))
		(!R4 (?X_D (PERTAIN-TO ?X_E)))
		(!R5 (?X_H PLAYGROUND.N))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?X AGENT.N))
	)
	(:STEPS
		(?X_G (?X_E ((ADV-A (FROM.P ?L1)) COME.19.V) ?L2))
		(?X_B (?X_E ((ADV-A (FOR.P ?X_C)) PLAY.V)))
		(?E_1 (?X PLAY.2.V))
	)
)

; "Sammy was going to play baseball."
; "He was wearing a glove."
; "He was swinging a bat."
; "He missed the ball."
; "He lost the game."
(EPI-SCHEMA ((?X_O (PLAY.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_C GAME.N))
		(!R2 (?X_F BALL.N))
		(!R3 (?X_I BAT.N))
		(!R4 (?X_L BASEBALL.N))
		(!R5 (?X_P GLOVE.N))
		(!R6 (?X_O AGENT.N))
		(!R7 (?X_P OBJECT.N))
		(!R8 (NOT (?X_P AGENT.N)))
	)
	(:STEPS
		(?X_K (?X_O ((ADV-A (FOR.P (KA (PLAY.V ?X_L)))) GO.V)))
		(?E_1 (?X_O PLAY.16.V))
		(?X_N (?X_O WEAR.20.V ?X_P))
		(?X_H (?X_O (SWING.V ?X_I)))
		(?X_E (?X_O (MISS.V ?X_F)))
		(?X_B (?X_O (LOSE.V ?X_C)))
	)
)

; "Sammy played baseball."
; "He was good at baseball."
; "He joined the team."
; "His friends were on the team too."
(EPI-SCHEMA ((?X_K (PLAY.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_G (PLUR FRIEND.N)))
		(!R2 (?X_E TEAM.N))
		(!R3 (?X_F BASEBALL.N))
		(!R4 (?X_K GOOD.A))
		(!R5 (?X_G (PERTAIN-TO ?X_K)))
		(!R6 (?X_J BASEBALL.N))
		(!R7 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_I (?X_K PLAY.21.V))
		(?X_A (?X_K (AT.P ?X_F)))
		(?X_D (?X_K (JOIN.V ?X_E)))
		(?X_B (?X_G (TOO.ADV ((ADV-A (ON.P ?X_E)) BE.V))))
	)
)

; "Tom played baseball."
; "He had a good time."
; "He watched the other boys play."
; "They were all having fun."
(EPI-SCHEMA ((?X_J ((ADV-A (WITH.P (ANOTHER.D BOY.N))) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C OTHER.A))
		(!R2 (?X_C (PLUR BOY.N)))
		(!R3 (?X_F GOOD.A))
		(!R4 (?X_F TIME.N))
		(!R5 (?X_I BASEBALL.N))
		(!R6 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_B (?X_J (WATCH.V (THT (?X_C PLAY.V)))))
		(?X_H (?X_J PLAY.22.V))
		(?X_E (?X_J (HAVE.V ?X_F)))
	)
)

; "Tom played baseball."
; "He had a good time."
; "His friends were there too."
; "They all played together."
; "There was a lot of noise."
(EPI-SCHEMA ((?X_I ((ADV-A (WITH.P ?X_M)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E LOT.N))
		(!R2 (?X_E (OF.P ?X_F)))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_M (PLUR FRIEND.N)))
		(!R5 (?X_L GOOD.A))
		(!R6 (?X_L TIME.N))
		(!R7 (?X_M (PERTAIN-TO ?X_Q)))
		(!R8 (?X_P BASEBALL.N))
		(!R9 (?X_Q AGENT.N))
	)
	(:STEPS
		(?X_O (?X_Q PLAY.23.V))
		(?X_K (?X_Q (HAVE.V ?X_L)))
		(?X_B (?X_M (TOO.ADV (THERE.ADV BE.V))))
		(?X_H ((ALL.D ({OF}.P ?X_I)) (TOGETHER.ADV PLAY.V)))
		(?X_D (?X_A (BE.V ?X_E)))
	)
)



; "My wife's sister came over today."
; "Her husband died last year."
; "I think that they are getting along well."
(EPI-SCHEMA (((ADV-E ({DURING}.P ?X_D)) (?X_C COME_OVER.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C SISTER.N))
		(!R2 (?X_C (PERTAIN-TO ?X_F)))
		(!R3 (?X_D TODAY.N))
		(!R4 (?X_E HUSBAND.N))
		(!R5 (?X_E (PERTAIN-TO ?X_F)))
	)
	(:STEPS
		(?X_A (?X_C ((ADV-A (OVER.P ?X_D)) COME.V)))
		(?X_B ((ADV-E ({DURING}.P (LAST.D YEAR.N))) (?X_E DIE.V)))
	)
)

; "Alice saw a funeral procession."
; "There were lots of cars in the procession."
; "A hearse drove by."
; "There were flowers on top of the hearse."
(EPI-SCHEMA ((?X_O ((BY.ADV SEE.V) ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR FLOWER.N)))
		(!R2 (?X_D (ON_TOP_OF.P ?X_E)))
		(!R3 (?X_H FUNERAL.A))
		(!R4 (?X_H PROCESSION.N))
		(!R5 (?X_H HEARSE.N))
		(!R6 (?X_K (PLUR LOT.N)))
		(!R7 (?X_K (OF.P ?X_L)))
		(!R8 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_N (?X_O SEE.1.V ?X_H))
		(?X_J (?X_A (BE.V ?X_K)))
		(?X_G (?X_H DRIVE_BY.V))
		(?X_C (?X_A (BE.V ?X_D)))
	)
)

; "John is sad because his father died."
; "His mother is sad too."
; "He wants to go to the funeral."
; "But he can't leave his house."
(EPI-SCHEMA ((?X_H ((ADV-A (TO.P ?X_I)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_I FUNERAL.N))
		(!R2 (?X_D (BECAUSE.P (KE (?X_F DIE.V)))))
		(!R3 (?X_E SAD.A))
		(!R4 (?X_F FATHER.N))
		(!R5 (?X_F (PERTAIN-TO ?X_H)))
		(!R6 (?X_G (TOO.ADV SAD.A)))
		(!R7 (?X_G MOTHER.N))
		(!R8 (?X_G (PERTAIN-TO ?X_H)))
		(!R9 (?X_H AGENT.N))
		(!R10 (?X_I DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_H (BE.V ?X_E ?X_D)))
		(?X_C (?X_H (WANT.V (KA ((ADV-A (TO.P ?X_I)) GO.V)))))
		(?E_1 (?X_H ((ADV-A (FROM.P ?L1)) GO.2.V) ?X_I))
	)
)

; "Tommy is going to be buried."
; "His family will have a funeral."
; "His friends will come to the funeral."
; "A lot of people will attend the funeral."
; "His family will put him into the ground."
(EPI-SCHEMA ((?X_M (HAVE.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_L (PLUR FRIEND.N)))
		(!R2 (?X_G LOT.N))
		(!R3 (?X_G (OF.P ?X_H)))
		(!R4 (?X_I FUNERAL.N))
		(!R5 (?X_K FAMILY.N))
		(!R6 (?X_J GROUND.N))
		(!R7 (?X_M AGENT.N))
		(!R8 (?X_K (PERTAIN-TO ?X_M)))
		(!R9 (?X_L (PERTAIN-TO ?X_M)))
	)
	(:STEPS
		(?X_F (?X_M ((ADV-A (FOR.P (KA (PASV BURY.V)))) GO.V)))
		(?X_A (?X_K (HAVE.V ?X_I)))
		(?X_B (?X_L ((ADV-A (TO.P ?X_I)) COME.V)))
		(?X_C (?X_G (ATTEND.V ?X_I)))
		(?X_D (?X_K (((ADV-A (INTO.P ?X_J)) PUT.V) ?X_M)))
	)
)

; "Alice's dad died."
; "His heart stopped beating."
; "His doctors said that he would not live."
; "He did not want to be buried."
(EPI-SCHEMA ((?X_H DIE.V) ** ?E)
	(:ROLES
		(!R1 (?X_F HEART.N))
		(!R2 (?X_H DAD.N))
		(!R3 (?X_F (PERTAIN-TO ?X_H)))
		(!R4 (?X_H (PERTAIN-TO ?X_I)))
		(!R5 (?X_G (PLUR DOCTOR.N)))
		(!R6 (?X_G (PERTAIN-TO ?X_H)))
		(!R7 (?X_I AGENT.N))
		(!R8 (?N NOISE.N))
	)
	(:STEPS
		(?X_E (?X_H DIE.V))
		(?X_A (?X_F ((ADV-A (FOR.P (KA BEAT.V))) STOP.V)))
		(?X_C (NOT (?X_H (WANT.V (KA (PASV BURY.V))))))
		(?E_1 (?X_I BEAT.3.V ?N))
	)
)

; "A woman lost her husband."
; "Her husband died."
; "She cried for days."
(EPI-SCHEMA ((?X_D (LOSE.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D HUSBAND.N))
		(!R2 (?X_E WOMAN.N))
		(!R3 (?X_D (PERTAIN-TO ?X_E)))
	)
	(:STEPS
		(?X_A (?X_E (LOSE.V ?X_D)))
		(?X_C (?X_D DIE.V))
		(?X_G (?X_E CRY.4.V))
	)
)

; "Bill has been sick for several years."
; "His doctor told him that he wouldn't live much longer."
; "He is going to die soon."
(EPI-SCHEMA ((?X_G ((ADV-A (FOR.P ?X_A)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_A BILL.N))
		(!R2 (?X_B ((ADV-A (FOR.P ?X_C)) SICK.A)))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_F (PERTAIN-TO ?X_G)))
	)
	(:STEPS
		(?X_E (?X_A ((HAS.AUX BE.V) ?X_B)))
		(?X_I (?X_G ((ADV-A (FOR.P (KA (SOON.ADV DIE.V)))) GO.V)))
	)
)

; "Tom's parents were divorced."
; "His mother moved away."
; "Tom's father lives in another state."
; "Tom visits his father sometimes."
(EPI-SCHEMA ((?X_H ((SOMETIMES.ADV VISIT.V) ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C FATHER.N))
		(!R2 (?X_H AGENT.N))
		(!R3 (?X_C (PERTAIN-TO ?X_H)))
		(!R4 (?X_D MOTHER.N))
		(!R5 (?X_D (PERTAIN-TO ?X_H)))
		(!R6 (?X_G (PLUR PARENT.N)))
		(!R7 (?X_G (PERTAIN-TO ?X_H)))
		(!R8 ((ANOTHER.D STATE.N) LOCATION.N))
	)
	(:STEPS
		(?X_A (?X_D (AWAY.ADV MOVE.V)))
		(?X_F (?X_C LIVE.5.V (ANOTHER.D STATE.N)))
		(?X_B (?X_H ((SOMETIMES.ADV VISIT.V) ?X_C)))
	)
)

; "A woman died."
; "Her family said she was happy."
; "A man died."
; "His family said he was sad."
; "A boy died."
; "People cried for him."
; "A girl died."
; "Others were sad for her."
; "A dog died."
; "Friends buried him."
(EPI-SCHEMA ((?X_J DIE.V) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR PERSON.N)))
		(!R2 (?X_I FAMILY.N))
		(!R3 (?X_J WOMAN.N))
		(!R4 (?X_I (PERTAIN-TO ?X_J)))
		(!R5 (?X_M FAMILY.N))
		(!R6 (?X_N MAN.N))
		(!R7 (?X_M (PERTAIN-TO ?X_N)))
		(!R8 (?X_O BOY.N))
		(!R9 (?X_T SAD.A))
		(!R10 (?X_T (PLUR OTHER.N)))
		(!R11 (?X_U GIRL.N))
		(!R12 (?X_X (PLUR FRIEND.N)))
		(!R13 (?X_Y DOG.N))
	)
	(:STEPS
		(?X_H (?X_J DIE.V))
		(?X_A (?X_I (SAY.V (THT (?X_J HAPPY.A)))))
		(?X_L (?X_N DIE.V))
		(?X_B (?X_M (SAY.V (THT (?X_N SAD.A)))))
		(?X_Q (?X_O DIE.V))
		(?X_E (?X_F CRY.6.V))
		(?X_S (?X_U DIE.V))
		(?X_C (?X_T (FOR.P ?X_U)))
		(?X_W (?X_Y DIE.V))
		(?X_ZA (?X_X (BURY.V ?X_Y)))
	)
)

; "I met this girl named Mary."
; "Mary has blonde hair."
; "She wears glasses."
; "She lives next door."
(EPI-SCHEMA ((?X_F (MEET.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_C BLONDE.A))
		(!R2 (?X_C HAIR.N))
		(!R3 (?X_L GIRL.N))
		(!R4 (?X_F AGENT.N))
		(!R5 (?X_K (PLUR GLASS.N)))
		(!R6 (?X_K OBJECT.N))
		(!R7 (NOT (?X_K AGENT.N)))
		(!R8 (?X_L LOCATION.N))
		(!R9 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_E (?X_F (MEET.V (THT (?X_L (NAME.V ?X_M))))))
		(?X_B (?X_M (HAVE.V ?X_C)))
		(?X_H (?X_M WEAR.7.V ?X_K))
		(?X_J (?X_M LIVE.8.V ?X_L))
	)
)

; "Mary is a girl."
; "She likes to play games."
; "She plays basketball."
; "She loves to swim."
; "She goes to school."
(EPI-SCHEMA ((?X (PLAY.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_K (PLUR GAME.N)))
		(!R2 (?X_E BASKETBALL.N))
		(!R3 (?X_H GIRL.N))
		(!R4 (?X_L SCHOOL.N))
		(!R5 ((KA (PLAY.V ?X_K)) ACTION.N))
		(!R6 (?X AGENT.N))
		(!R7 ((KA SWIM.V) ACTION.N))
		(!R8 (?L2 DESTINATION.N))
		(!R9 (?X_L DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_H LIKE.9.V (KA (PLAY.V ?X_K))))
		(?E_1 (?X PLAY.10.V))
		(?X_D (?X_H PLAY.11.V))
		(?X_G (?X_H LOVE.12.V (KA SWIM.V)))
		(?E_2 (?X_H ((ADV-A (FROM.P ?L1)) SWIM.13.V) ?L2))
		(?X_J (?X_H ((ADV-A (FROM.P ?L1)) GO.14.V) ?X_L))
	)
)

; "Bob met Mary at school."
; "She is tall."
; "She has blond hair."
; "She wears glasses."
; "She lives next door."
(EPI-SCHEMA ((?X_G (MEET.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C BLOND.A))
		(!R2 (?X_C HAIR.N))
		(!R3 (?X_M TALL.A))
		(!R4 (?X_F SCHOOL.N))
		(!R5 (?X_G AGENT.N))
		(!R6 (?X_L (PLUR GLASS.N)))
		(!R7 (?X_N DOOR.N))
		(!R8 (?X_L OBJECT.N))
		(!R9 (NOT (?X_L AGENT.N)))
		(!R10 (?X_M AGENT.N))
		(!R11 (?X_N LOCATION.N))
	)
	(:STEPS
		(?X_E (?X_G (((ADV-A (AT.P ?X_F)) MEET.V) ?X_M)))
		(?X_B (?X_M (HAVE.V ?X_C)))
		(?X_I (?X_M WEAR.15.V ?X_L))
		(?X_K (?X_M LIVE.16.V ?X_N))
	)
)

; "[This is a story about Tom.]"
; "Tom was a boy who liked to play baseball."
; "He played on the team that won the championship."
; "He was good at hitting."
; "He could hit the ball really far."
; "Tom was proud of himself."
(EPI-SCHEMA ((?X_E (((ADV (REALLY.ADV FAR.A)) HIT.V) ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D BALL.N))
		(!R2 (?X_E BOY.N))
		(!R3 (?X_E GOOD.A))
		(!R4 (?X_E PROUD.A))
		(!R5 (?X_F AGENT.N))
		(!R6 (?X_F STORY.N))
		(!R7 (?X_G BASEBALL.N))
		(!R8 (?X_J TEAM.N))
		(!R9 (?X AGENT.N))
	)
	(:STEPS
		(?X_A (?X_F (ABOUT.P ?X_E)))
		(E389.SK (?X_E ((CAN.MD ((ADV (REALLY.ADV FAR.A)) HIT.V)) ?X_D)))
		(?E_1 (?X PLAY.10.V))
		(?X_I (?X_E PLAY.17.V))
		(?X_B (?X_E (AT.P (KA HIT.V))))
		(?X_C (?X_E (OF.P ?X_E)))
	)
)

; "Joe likes girls."
; "He goes to parties where there are lots of girls."
; "Girls go to parties too."
; "At these parties Joe meets many girls."
(EPI-SCHEMA ((?X_M ((ADV-A (TO.P ?X_L)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C MANY.A))
		(!R2 (?X_C (PLUR GIRL.N)))
		(!R3 (?X_K (PLUR GIRL.N)))
		(!R4 (?X_L (PLUR PARTY.N)))
		(!R5 (?X_H (PLUR GIRL.N)))
		(!R6 (?X_N (PLUR PARTY.N)))
		(!R7 (?X_K OBJECT.N))
		(!R8 (NOT (?X_K ACTION.N)))
		(!R9 (?X_L DESTINATION.N))
		(!R10 (?X_M AGENT.N))
		(!R11 (?X_N DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_M LIKE.18.V ?X_K))
		(?X_G (?X_M ((ADV-A (FROM.P ?L1)) GO.14.V) ?X_L))
		(?X_J (?X_H ((ADV-A (FROM.P ?L1)) GO.14.V) ?X_N))
		(?X_B (?X_M (((ADV-A (AT.P (THESE.D (PLUR PARTY.N)))) MEET.V) ?X_C)))
	)
)

; "Tom met Mary."
; "She is pretty."
; "She likes Tom."
(EPI-SCHEMA ((?X_E (LIKE.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_E AGENT.N))
		(!R2 (?X_F OBJECT.N))
		(!R3 (NOT (?X_F ACTION.N)))
	)
	(:STEPS
		(?X_B (?X_F (MEET.V ?X_E)))
		(?X_D (?X_E LIKE.19.V ?X_F))
	)
)

; "Alice loves people."
; "She likes talking to them."
; "She knows how to talk to people."
; "She talks to people all the time."
(EPI-SCHEMA ((?X_F (LOVE.V (THREE.D (PLUR PERSON.N)))) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR PERSON.N)))
		(!R2 ((KA ((ADV-A (TO.P ?X_F)) TALK.V)) ACTION.N))
		(!R3 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_C (?X_G LOVE.22.V (IND (3 ?X_A))))
		(?X_E (?X_G LIKE.23.V (KA ((ADV-A (TO.P ?X_F)) TALK.V))))
	)
)

; "Mary's parents were divorced."
; "Her mother lived in California."
; "Her father lived in New York."
; "Mary's friends liked Mary."
; "Mary's family moved from one house to another."
(EPI-SCHEMA ((?X_G (LIKE.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR FRIEND.N)))
		(!R2 (?X_F (PERTAIN-TO ?X_F)))
		(!R3 (?X_F FAMILY.N))
		(!R4 (?X_G AGENT.N))
		(!R5 (?X_D MOTHER.N))
		(!R6 (?X_D (PERTAIN-TO ?X_F)))
		(!R7 (?X_E (PLUR PARENT.N)))
		(!R8 (?X_E (PERTAIN-TO ?X_F)))
		(!R9 (?X_G LOCATION.N))
	)
	(:STEPS
		(?X_A (?X_D LIVE.24.V ?X_G))
		(?X_C (?X_F (LIKE.V ?X_F)))
	)
)



; "Tom's family came from Italy."
; "His father is an Italian American."
; "His mother is also from Italy."
; "Tom has two sisters."
(EPI-SCHEMA ((?X_G (HAVE.V (TWO.D (PLUR SISTER.N)))) ** ?E)
	(:ROLES
		(!R1 (?X_E FAMILY.N))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_G MOTHER.N))
		(!R4 (?X_E (PERTAIN-TO ?X_G)))
		(!R5 (?X_F (PERTAIN-TO ?X_G)))
		(!R6 (?X_G (PERTAIN-TO ?X_H)))
	)
	(:STEPS
		(?X_C (?X_E ((ADV-A (FROM.P ?X_D)) COME.V)))
		(?X_A (?X_G (ALSO.ADV ((ADV-A (FROM.P ?X_D)) BE.V))))
		(?X_J (?X_G (HAVE.V (TWO.D (PLUR SISTER.N)))))
	)
)

; "Joe's family lived near Lake Michigan."
; "His dad liked fishing there."
; "His mom liked swimming."
; "His sister liked watching TV."
(EPI-SCHEMA ((?X_H (WATCH.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_D SWIMMING.N))
		(!R2 (?X_E FISHING.N))
		(!R3 (?X_G DAD.N))
		(!R4 (?X_G MOM.N))
		(!R5 (?X_G SISTER.N))
		(!R6 (?X_F FAMILY.N))
		(!R7 (?X_F (PERTAIN-TO ?X_G)))
		(!R8 (?X_H MALE.A))
		(!R9 (?X_H AGENT.N))
		(!R10 (?X_G (PERTAIN-TO ?X_H)))
		(!R11 (?X_I OBJECT.N))
		(!R12 (NOT (?X_I ACTION.N)))
	)
	(:STEPS
		(?X_A (?X_G ((THERE.ADV LIKE.V) ?X_E)))
		(?X_B (?X_G (LIKE.V ?X_D)))
		(?X_C (?X_G (LIKE.V (KA (WATCH.V ?X_I)))))
		(?E_1 (?X_G WATCH.1.V ?X_I))
	)
)

; "'I'm going to my sister's house for dinner tonight,' said Susan."
; "'My parents will be there too.'"
; "'We'll have fun,' said Mary."
; "'I hope so,' said Susan."
; "'I love you,' said Mary."
; "'I love you too,' said Susan."
(EPI-SCHEMA ((?X_A (THERE.ADV BE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_A (PLUR PARENT.N)))
		(!R2 (?X_A (PERTAIN-TO ?X_B)))
	)
	(:STEPS
		(E86.SK (?X_A (TOO.ADV (THERE.ADV BE.V))))
	)
)

; "Tom's mother is a teacher."
; "His father is a doctor."
; "They have three children."
; "Tom's sister has two kids."
(EPI-SCHEMA ((?X_G (HAVE.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C SISTER.N))
		(!R2 (?X_C (PERTAIN-TO ?X_D)))
		(!R3 (?X_G AGENT.N))
		(!R4 ((THREE.D (PLUR CHILD.N)) OBJECT.N))
	)
	(:STEPS
		(?X_F (?X_G HAVE.2.V (THREE.D (PLUR CHILD.N))))
		(?X_B (?X_C (HAVE.V (TWO.D (PLUR KID.N)))))
	)
)

; "Alice's family is from Canada."
; "Her family has many members."
; "Her family lives in a house on the beach."
; "Her family goes skiing in winter."
(EPI-SCHEMA ((?X_H (HAVE.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_D SKIING.N))
		(!R2 (?X_E WINTER.N))
		(!R3 (?X_H AGENT.N))
		(!R4 (?X_K FAMILY.N))
		(!R5 (?X_J MANY.A))
		(!R6 (?X_J (PLUR MEMBER.N)))
		(!R7 (?X_L HOUSE.N))
		(!R8 (?X_I AGENT.N))
		(!R9 (?X_K (PERTAIN-TO ?X_I)))
		(!R10 (?X_J OBJECT.N))
		(!R11 (?X_K AGENT.N))
		(!R12 (?X_L LOCATION.N))
	)
	(:STEPS
		(?X_G (?X_K ((ADV-A (FROM.P ?X_H)) BE.V)))
		(?X_A (?X_K HAVE.3.V ?X_J))
		(?X_B (?X_K LIVE.4.V ?X_L))
		(?X_C (?X_K (((ADV-A (IN.P ?X_E)) GO.V) ?X_D)))
	)
)

; "Mary's mother came for dinner."
; "She brought some food."
; "Mary's father called."
; "He said he was coming home soon."
(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA.PR ?X_J ?L2)) ** ?E)
	(:ROLES
		(!R1 (?X_F FATHER.N))
		(!R2 (?X_E DINNER.N))
		(!R3 (?X_K MOTHER.N))
		(!R4 (?X_G AGENT.N))
		(!R5 (?X_K (PERTAIN-TO ?X_G)))
		(!R6 (?X_F (PERTAIN-TO ?X_G)))
		(!R7 (?X_J FOOD.N))
		(!R8 (?L2 DESTINATION.N))
		(!R9 (?X_J SMALLER-THAN.N ?X_K))
	)
	(:STEPS
		(?X_D (?X_K ((ADV-A (FOR.P ?X_E)) COME.V)))
		(?X_I (?X_K BRING.5.V ?X_J ?L2))
		(?X_B (?X_F CALL.V))
	)
)

; "Tom's family came to visit him."
; "His mother hugged Tom."
; "His father shook hands with him."
; "His brother gave him a hug."
; "His sister gave him a kiss on the cheek."
(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA.PR ?X_F ?X_L ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_G FAMILY.N))
		(!R2 (?X_H MOTHER.N))
		(!R3 (?X_I FATHER.N))
		(!R4 (?X_F (PLUR HAND.N)))
		(!R5 (?X_J BROTHER.N))
		(!R6 (?X_L AGENT.N))
		(!R7 (?X_G (PERTAIN-TO ?X_L)))
		(!R8 (?X_H (PERTAIN-TO ?X_L)))
		(!R9 (?X_I (PERTAIN-TO ?X_L)))
		(!R10 (?X_J (PERTAIN-TO ?X_L)))
		(!R11 (?X_K (PERTAIN-TO ?X_L)))
		(!R12 (?X_M HUG.N))
	)
	(:STEPS
		(?X_E (?X_G ((ADV-A (FOR.P (KA (VISIT.V ?X_L)))) COME.V)))
		(?X_A (?X_H (HUG.V ?X_L)))
		(?X_B (?X_I (((ADV-A (WITH.P ?X_L)) SHAKE.V) ?X_F)))
		(?X_C (?X_J (GIVE.V ?X_L ?X_M)))
	)
)

; "Billy's parents were going to the zoo."
; "Billy was excited."
; "He looked forward to seeing the animals."
; "His parents took him to the zoo."
; "There were lots of animals there."
(EPI-SCHEMA ((?X_M ((ADV-A (TO.P ?X_K)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR LOT.N)))
		(!R2 (?X_H (PLUR ANIMAL.N)))
		(!R3 (?X_L EXCITED.A))
		(!R4 (?X_M (PLUR PARENT.N)))
		(!R5 (?X_M (PERTAIN-TO ?X_L)))
		(!R6 (?X_K ZOO.N))
		(!R7 (?X_L AGENT.N))
		(!R8 (?X_K DESTINATION.N))
		(!R9 (?X_L SMALLER-THAN.N ?X_M))
	)
	(:STEPS
		(?X_J (?X_M ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_K))
		(?X_G (?X_L ((ADV-A (TO.P (KA (SEE.V ?X_H)))) LOOK_FORWARD.V)))
		(?E_1 (?X_L SEE.8.V ?X_H))
		(?X_B (?X_M TAKE.9.V ?X_L ?X_K))
		(?X_D (?X_A (BE.V ?X_E)))
	)
)

; "Peter's dad is an engineer."
; "His mom works as a nurse."
; "He has two brothers and one sister."
; "They have three dogs."
; "Their house is on a lake."
; "There is a dock on the lake."
(EPI-SCHEMA ((?X_S (HAVE.V (SET-OF (TWO.D (PLUR BROTHER.N)) ?X_T))) ** ?E)
	(:ROLES
		(!R1 (?X_F DOCK.N))
		(!R2 (?X_G LAKE.N))
		(!R3 (?X_F (ON.P ?X_G)))
		(!R4 (?X_R HOUSE.N))
		(!R5 (?X_H NURSE.N))
		(!R6 (?X_O MOM.N))
		(!R7 (?X_K ENGINEER.N))
		(!R8 (?X_N DAD.N))
		(!R9 (?X_T SISTER.N))
		(!R10 (?X_N (PERTAIN-TO ?X_S)))
		(!R11 (?X_O (PERTAIN-TO ?X_S)))
		(!R12 (?X_R (PERTAIN-TO ?X_U)))
		(!R13 (?X_S AGENT.N))
		(!R14 ((SET-OF (TWO.D (PLUR BROTHER.N)) ?X_T) OBJECT.N))
		(!R15 ((THREE.D (PLUR DOG.N)) OBJECT.N))
		(!R16 (?X_U AGENT.N))
	)
	(:STEPS
		(?X_J (?X_N (= ?X_K)))
		(?X_B (?X_O ((ADV-A (AS.P ?X_H)) WORK.V)))
		(?X_M (?X_S HAVE.11.V (SET-OF (TWO.D (PLUR BROTHER.N)) ?X_T)))
		(?X_Q (?X_U HAVE.12.V (THREE.D (PLUR DOG.N))))
		(?X_C (?X_R ((ADV-A (ON.P ?X_G)) BE.V)))
		(?X_E (?X_A (BE.V ?X_F)))
	)
)

; "Mary's children were away for the summer."
; "They missed Mary."
; "Mary did not want to go without her children."
; "Mary wanted to stay with her children."
(EPI-SCHEMA ((?X_I
              (WANT.V
               (KA ((ADV-A (WITH.P ?X_H)) ((ADV-A (FOR.P ?X_G)) STAY.V)))))
             ** ?E)
	(:ROLES
		(!R1 (?X_G SUMMER.N))
		(!R2 (?X_H (PLUR CHILD.N)))
		(!R3 (?X_H (PERTAIN-TO ?X_I)))
		(!R4 (?X_I AGENT.N))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_H (AWAY.ADV ((ADV-A (FOR.P ?X_G)) BE.V))))
		(?X_D (?X_H (MISS.V ?X_I)))
		(?X_A (NOT (?X_I (WANT.V (KA ((ADV-A (WITHOUT.P ?X_H)) GO.V))))))
		(?X_B (?X_I (WANT.V (KA ((ADV-A (WITH.P ?X_H)) STAY.V)))))
		(?E_1 (?X_I ((ADV-A (FROM.P ?L1)) GO.13.V) ?L2))
	)
)

; "Tom went on a day trip."
; "His friends went too."
; "They had fun together."
; "They played games."
; "They ate snacks."
(EPI-SCHEMA ((?X_H ((ADV-A (FROM.P ?L2)) (SOMEWHERE.ADV GO.V))) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR SNACK.N)))
		(!R2 (?X_G (PLUR GAME.N)))
		(!R3 (?X_H AGENT.N))
		(!R4 (?X_K FUN.N))
		(!R5 (?X_N (PLUR FRIEND.N)))
		(!R6 (?X_N (PERTAIN-TO ?X_O)))
		(!R7 (?X_O AGENT.N))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_M (?X_O ((ADV-A (FROM.P ?L1)) GO.14.V) ?L2))
		(?X_A (?X_N ((ADV-A (FROM.P ?L1)) GO.14.V) ?L2))
		(?X_J (?X_N (HAVE.V ?X_K)))
		(?X_F (?X_H (PLAY.V ?X_G)))
		(?X_C (?X_H (EAT.V ?X_D)))
	)
)



; "A woman walked into a store."
; "She bought an apple pie."
; "She ate half of it."
; "She felt sick."
; "She threw up all over the floor."
(EPI-SCHEMA ((?X_J
              (COMPOSITE-SCHEMA.PR ?X_K ?X_G
               (ALL.D
                (L X (AND (X (PLUR {REF}.N)) (X (OVER.P (THE.D FLOOR.N))))))
               ?X_N ?X_O))
             ** ?E)
	(:ROLES
		(!R1 (?X_G SICK.A))
		(!R2 (?X_K APPLE.N))
		(!R3 (?X_K PIE.N))
		(!R4 (?X_J WOMAN.N))
		(!R5 (?X_N STORE.N))
		(!R6 (?X_O HALF.N))
		(!R7 (?X_O (OF.P ?X_K)))
		(!R8 (?X_N DESTINATION.N))
		(!R9 (?X_O FOOD.N))
	)
	(:STEPS
		(?X_B (?X_J ((ADV-A (FROM.P ?L1)) WALK.1.V) ?X_N))
		(?X_I (?X_J (BUY.V ?X_K)))
		(?X_M (?X_J EAT.2.V ?X_O))
		(?X_F (?X_J (FEEL.V ?X_G)))
		(?X_D
   (?X_J
    (THROW_UP.V
     (ALL.D (L X (AND (X (PLUR {REF}.N)) (X (OVER.P (THE.D FLOOR.N)))))))))
	)
)

; "Mary bought some pie for dinner."
; "She ate half of it."
; "She felt better."
; "She finished eating."
(EPI-SCHEMA ((?X_M (EAT.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_E BETTER.A))
		(!R2 (?X_I PIE.N))
		(!R3 (?X_H DINNER.N))
		(!R4 (?X_L HALF.N))
		(!R5 (?X_L (OF.P ?X_I)))
		(!R6 (?X_L FOOD.N))
		(!R7 (?X_M AGENT.N))
		(!R8 (?F FOOD.N))
	)
	(:STEPS
		(?X_G (?X_M (((ADV-A (FOR.P ?X_H)) BUY.V) ?X_I)))
		(?X_K (?X_M EAT.2.V ?X_L))
		(?X_D (?X_M (FEEL.V ?X_E)))
		(?X_B (?X_M ((ADV-A (FOR.P (KA EAT.V))) FINISH.V)))
		(?E_1 (?X_M EAT.3.V ?F))
	)
)

; "Mary ate some food that tasted bad."
; "She got sick."
; "She threw up on the ground."
; "She threw up again."
; "She threw up again."
(EPI-SCHEMA ((?X_M (REPEATEDLY.ADV THROW_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G GROUND.N))
		(!R2 (?X_J SICK.A))
		(!R3 (?X_M AGENT.N))
		(!R4 (?X_N FOOD.N))
	)
	(:STEPS
		(?X_L (?X_M EAT.2.V ?X_N))
		(?X_I (?X_M (GET.V ?X_J)))
		(?X_F (?X_M ((ADV-A (ON.P ?X_G)) THROW_UP.V)))
		(?X_D (?X_M (AGAIN.ADV THROW_UP.V)))
		(?X_B (?X_M (AGAIN.ADV THROW_UP.V)))
	)
)

; "Alice's mother baked pies for Alice."
; "Alice liked eating pies."
; "Alice ate many pies."
; "Alice knew how to make pies."
(EPI-SCHEMA ((?X_G (EAT.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR PIE.N)))
		(!R2 (?X_C MOTHER.N))
		(!R3 (?X_H MANY.A))
		(!R4 (?X_H (PLUR PIE.N)))
		(!R5 (?X_C (PERTAIN-TO ?X_G)))
		(!R6 ((KA (EAT.V ?X_F)) ACTION.N))
		(!R7 (?X_F FOOD.N))
		(!R8 (?X_G AGENT.N))
		(!R9 (?X_H FOOD.N))
	)
	(:STEPS
		(?X_B (?X_G LIKE.7.V (KA (EAT.V ?X_F))))
		(?E_1 (?X_G EAT.8.V ?X_F))
		(?X_E (?X_G EAT.2.V ?X_H))
	)
)

; "Alice bought some apples for dinner."
; "She made apple pies."
; "She cut them into slices."
; "She put them on plates."
; "She served them to her family."
(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA.PR ?X_H ?X_L ?X_M ?X_O)) ** ?E)
	(:ROLES
		(!R1 (?X_L (PLUR SLICE.N)))
		(!R2 (?X_O APPLE.N))
		(!R3 (?X_O (PLUR PIE.N)))
		(!R4 (?X_H (PLUR APPLE.N)))
		(!R5 (?X_I DINNER.N))
		(!R6 (?X_M FAMILY.N))
		(!R7 (?X_M (PERTAIN-TO ?X_N)))
		(!R8 (?X_L LOCATION.N))
		(!R9 (?X_M AGENT.N))
		(!R10 (?X_N AGENT.N))
		(!R11 (NOT (?X_O AGENT.N)))
	)
	(:STEPS
		(?X_G (?X_N (((ADV-A (FOR.P ?X_I)) BUY.V) ?X_H)))
		(?X_E (?X_N (MAKE.V ?X_O)))
		(?X_C (?X_N (((ADV-A (INTO.P ?X_L)) CUT.V) ?X_O)))
		(?X_K (?X_N PUT.9.V ?X_O ?X_L))
		(?X_A (?X_N (SERVE.10.V ?X_M ?X_O)))
	)
)

; "A man's wife baked him an apple pie."
; "She cut the pie in two pieces."
; "She put one piece on a plate for him."
; "She gave him the other piece."
; "He ate the pie."
(EPI-SCHEMA ((?X_M (EAT.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_H APPLE.N))
		(!R2 (?X_H (IN.P (TWO.D (PLUR PIECE.N)))))
		(!R3 (?X_H PIE.N))
		(!R4 (?X_I WIFE.N))
		(!R5 (?X_E PIECE.N))
		(!R6 (?X_M OTHER.A))
		(!R7 (?X_M PIECE.N))
		(!R8 (?X_J MAN.N))
		(!R9 (?X_I (BAKED.A ?X_J ?X_H)))
		(!R10 (?X_I (PERTAIN-TO ?X_J)))
		(!R11 ((TWO.D (PLUR PIECE.N)) LOCATION.N))
		(!R12 (NOT (?X_M AGENT.N)))
	)
	(:STEPS
		(?X_B (?X_I (CUT.V ?X_H)))
		(?X_D (?X_I PUT.11.V ?X_E (TWO.D (PLUR PIECE.N))))
		(?X_G (?X_I (GIVE.12.V ?X_J ?X_M)))
		(?X_L (?X_J EAT.2.V ?X_H))
	)
)

; "Alice bought some apples."
; "She cut them open."
; "She put two slices on each plate."
; "She baked the apple pie."
; "She liked the taste of the pie."
(EPI-SCHEMA ((?X_K (BUY.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR APPLE.N)))
		(!R2 (?X_J APPLE.N))
		(!R3 (?X_J PIE.N))
		(!R4 (?X_L TASTE.N))
		(!R5 (?X_L (OF.P ?X_J)))
		(!R6 ((TWO.D (PLUR SLICE.N)) ENTITY.N))
		(!R7 ((EACH.D PLATE.N) LOCATION.N))
		(!R8 (?X_K AGENT.N))
		(!R9 (?X_L OBJECT.N))
		(!R10 (NOT (?X_L ACTION.N)))
		(!R11 (NOT (?X_L AGENT.N)))
	)
	(:STEPS
		(?X_D (?X_K (BUY.V ?X_E)))
		(?X_B (?X_K (CUT.V (KE (?X_E OPEN.A)))))
		(?X_G (?X_K PUT.13.V (TWO.D (PLUR SLICE.N)) (EACH.D PLATE.N)))
		(?X_I (?X_K LIKE.14.V ?X_L))
	)
)

; "'I want to go shopping,' said Tom."
; "'Let's go to the mall,' said Jenny."
; "'No, I don't feel like going shopping,' said Alan."
; "'We could go to the park instead,' said Jessie."
; "'That sounds good,' said Jack."
; "'Let's do that!' they all agreed."
(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA.PR ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_A (PERTAIN-TO ?X_B)))
		(!R2 (?X_C {REF}.N))
	)
	(:STEPS
		(E279.SK (?X_A (DO.V ?X_C)))
	)
)

; "Alice bought an apple pie."
; "She cut it into pieces."
; "She put some on a plate."
; "She ate half of the pie."
(EPI-SCHEMA ((?X_I (BUY.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E APPLE.N))
		(!R2 (?X_E PIE.N))
		(!R3 (?X_H HALF.N))
		(!R4 (?X_H (OF.P ?X_E)))
		(!R5 (?X_H FOOD.N))
		(!R6 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_B (?X_I (BUY.V ?X_E)))
		(?X_D (?X_I CUT.15.V ?X_E))
		(?X_G (?X_I EAT.2.V ?X_H))
	)
)

; "Tommy liked apples."
; "He bought some apples at the store."
; "He cut them open and ate them."
(EPI-SCHEMA ((?X_J (BUY.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR APPLE.N)))
		(!R2 (?X_F STORE.N))
		(!R3 (?X_I (PLUR APPLE.N)))
		(!R4 (NOT (?X_I ACTION.N)))
		(!R5 (NOT (?X_I AGENT.N)))
		(!R6 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_H (?X_J LIKE.16.V ?X_I))
		(?X_D (?X_J (((ADV-A (AT.P ?X_F)) BUY.V) ?X_E)))
		(?X_A (?X_J (CUT.V ?X_E (K OPEN.A))))
		(?X_B (?X_J EAT.2.V ?X_E))
	)
)

; "The guy went to work."
; "He was happy because he did well."
; "He got a raise."
; "He was proud of himself."
(EPI-SCHEMA ((?X_E (SOMEWHERE.ADV GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D RAISE.N))
		(!R2 (?X_E GUY.N))
		(!R3 (?X_E PROUD.A))
		(!R4 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_G (?X_E ((ADV-A (FROM.P ?L1)) GO.17.V) ?L2))
		(?X_C (?X_E (GET.V ?X_D)))
		(?X_A (?X_E (OF.P ?X_E)))
	)
)

; "Bill worked hard all week."
; "He earned money for his family."
; "He spent time with his family."
; "His wife gave him a hug."
(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA.PR ?X_F ?X_I ?X_L ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_C BILL.N))
		(!R2 (?X_F MONEY.N))
		(!R3 (?X_J FAMILY.N))
		(!R4 (?X_I TIME.N))
		(!R5 (?X_K WIFE.N))
		(!R6 (?X_L AGENT.N))
		(!R7 (?X_J (PERTAIN-TO ?X_L)))
		(!R8 (?X_K (PERTAIN-TO ?X_L)))
		(!R9 (?X_M HUG.N))
	)
	(:STEPS
		(?X_E ((ADV-E ({DURING}.P (ALL.D WEEK.N))) (?X_C (HARD.ADV WORK.V))))
		(?X_H (?X_L (EARN.V ?X_F)))
		(?X_A (?X_L (((ADV-A (WITH.P ?X_J)) SPEND.V) ?X_I)))
		(?X_B (?X_K (GIVE.V ?X_L ?X_M)))
	)
)

; "Tom's father worked for a company."
; "His father was proud of him."
; "Tom liked working for that company."
(EPI-SCHEMA ((?X_G (LIKE.V (KA ((ADV-A (FOR.P ?X_H)) WORK.V)))) ** ?E)
	(:ROLES
		(!R1 (?X_B PROUD.A))
		(!R2 (?X_B FATHER.N))
		(!R3 (?X_B (PERTAIN-TO ?X_G)))
		(!R4 (?X_C (PERTAIN-TO ?X_G)))
		(!R5 (?X_F (PERTAIN-TO ?X_G)))
		(!R6 (?X_H COMPANY.N))
		(!R7 (?X_F (FOR.P ?X_H)))
		(!R8 (?X_G AGENT.N))
		(!R9 ((KA ((ADV-A (FOR.P ?X_H)) WORK.V)) ACTION.N))
	)
	(:STEPS
		(?X_A (?X_B (OF.P ?X_G)))
		(?X_E (?X_G LIKE.18.V (KA ((ADV-A (FOR.P ?X_H)) WORK.V))))
	)
)

; "Tom's boss gave him a raise."
; "He was happy for Tom."
; "He was proud of Tom."
; "Tom felt good about himself."
(EPI-SCHEMA ((?X_F (((ADV-A (FROM.P ?X_F)) GET.V) ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C RAISE.N))
		(!R2 (?X_F BOSS.N))
		(!R3 (?X_F HAPPY.A))
		(!R4 (?X_F PROUD.A))
		(!R5 (?X_F AGENT.N))
		(!R6 (?X_H AGENT.N))
		(!R7 (?X_F (PERTAIN-TO ?X_H)))
		(!R8 (?X_G GOOD.A))
		(!R9 (?X_G (ABOUT.P ?X_H)))
	)
	(:STEPS
		(?X_E (?X_F (GIVE.V ?X_H ?X_C)))
		(?X_A (?X_F (FOR.P ?X_H)))
		(?X_B (?X_F (OF.P ?X_H)))
		(?X_J (?X_H (FEEL.V ?X_G)))
	)
)

; "John worked for a company."
; "He had good job."
; "He got a raise."
; "He was proud of himself."
(EPI-SCHEMA ((?X_K (HAVE.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_B COMPANY.N))
		(!R2 (?X_E GOOD.A))
		(!R3 (?X_E JOB.N))
		(!R4 (?X_H RAISE.N))
		(!R5 (?X_K PROUD.A))
		(!R6 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_D (?X_K ((ADV-A (FOR.P ?X_B)) WORK.V)))
		(?X_G (?X_K (HAVE.V ?X_E)))
		(?X_J (?X_K (GET.V ?X_H)))
		(?X_A (?X_K (OF.P ?X_K)))
	)
)

; "Tom worked hard all week."
; "His boss gave him a raise."
; "Tom felt good about himself."
(EPI-SCHEMA ((?X_G (GET.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_E BOSS.N))
		(!R2 (?X_D RAISE.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_E (PERTAIN-TO ?X_G)))
		(!R5 (?X_F GOOD.A))
		(!R6 (?X_F (ABOUT.P ?X_G)))
	)
	(:STEPS
		(?X_C ((ADV-E ({DURING}.P (ALL.D WEEK.N))) (?X_G (HARD.ADV WORK.V))))
		(?X_A (?X_E (GIVE.V ?X_G ?X_D)))
		(?X_I (?X_G (FEEL.V ?X_F)))
	)
)

; "Tom worked hard."
; "He earned lots of money."
; "His boss gave him a raise."
; "Tom was happy."
(EPI-SCHEMA ((?X_I (HARD.ADV WORK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR LOT.N)))
		(!R2 (?X_D (OF.P ?X_E)))
		(!R3 (?X_H BOSS.N))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_I HAPPY.A))
		(!R6 (?X_H (PERTAIN-TO ?X_I)))
		(!R7 (?X_J RAISE.N))
	)
	(:STEPS
		(?X_C (?X_I (HARD.ADV WORK.V)))
		(?X_G (?X_I (EARN.V ?X_D)))
		(?X_A (?X_H (GIVE.V ?X_I ?X_J)))
	)
)

; "Sam worked hard."
; "He got tired."
; "His boss told him to go home early."
(EPI-SCHEMA ((?X_H (TELL.V ?X_H ?L2)) ** ?E)
	(:ROLES
		(!R1 (?X_D TIRED.A))
		(!R2 (?X_G BOSS.N))
		(!R3 (?X_G (PERTAIN-TO ?X_H)))
		(!R4 (?X_G AGENT.N))
		(!R5 (NOT (?X_G = ?X_H)))
		(!R6 ((KA (EARLY.ADV (HOME.ADV GO.V))) ACTION.N))
		(!R7 (?X_H AGENT.N))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_H (HARD.ADV WORK.V)))
		(?X_C (?X_H (GET.V ?X_D)))
		(?X_A (?X_G TELL.20.V ?X_H (KA (EARLY.ADV (HOME.ADV GO.V)))))
		(?E_1 (?X_H ((ADV-A (FROM.P ?L1)) GO.21.V) ?L2))
	)
)



; "The man saw a dead body on the beach."
; "The police found the body."
; "A policeman took pictures and fingerprints."
; "The man left."
(EPI-SCHEMA ((?X_J (FIND.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_D POLICEMAN.N))
		(!R2 (?X_M POLICE.N))
		(!R3 (?X_G DEAD.A))
		(!R4 (?X_G BODY.N))
		(!R5 (?X_J MAN.N))
		(!R6 (?X_M AGENT.N))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_J SEE.3.V ?X_G))
		(?X_I (?X_M FIND.4.V ?X_G))
		(?X_C (?X_D (TAKE.V ?X_A)))
		(?X_L (?X_J ((ADV-A (FROM.P ?L1)) LEAVE.2.V) ?L2))
	)
)

; "A man was walking on the beach."
; "He saw a dead body lying in the sand."
; "The police arrived."
; "The police took pictures and fingerprints."
; "The man left."
(EPI-SCHEMA ((?X_M ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_Q POLICE.N))
		(!R2 (?X_E SAND.N))
		(!R3 (?X_J DEAD.A))
		(!R4 (?X_P ?X_J BODY.N))
		(!R5 (?X_M MAN.N))
		(!R6 (?X_P ENTITY.N))
		(!R7 (?X_Q AGENT.N))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_G (?X_M ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_B (?X_P ((ADV-A (IN.P ?X_E)) LIE.V)))
		(?X_I (?X_M SEE.5.V ?X_P))
		(?X_L (?X_Q ((ADV-A (FROM.P ?L1)) ARRIVE.6.V) ?L2))
		(?X_D (?X_Q (TAKE.V ?X_A)))
		(?X_O (?X_M ((ADV-A (FROM.P ?L1)) LEAVE.2.V) ?L2))
	)
)

; "The man saw some footprints on the beach."
; "He followed them."
; "He found a dead body."
; "He called the police."
(EPI-SCHEMA ((?X_D (FIND.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C POLICE.N))
		(!R2 (?X_D MAN.N))
		(!R3 (?X_I (PLUR FOOTPRINT.N)))
		(!R4 (?X_J DEAD.A))
		(!R5 (?X_J BODY.N))
	)
	(:STEPS
		(?X_F (?X_D SEE.7.V ?X_I))
		(?X_H (?X_D FOLLOW.8.V ?X_I))
		(?X_L (?X_D FIND.4.V ?X_J))
		(?X_B (?X_D (CALL.V ?X_C)))
	)
)

; "The man found a dead body on the beach."
; "The police were there."
; "The police took fingerprints."
; "The police took pictures."
; "The police left."
(EPI-SCHEMA ((?X_P (FIND.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR PICTURE.N)))
		(!R2 (?X_F (PLUR FINGERPRINT.N)))
		(!R3 (?X_K DEAD.A))
		(!R4 (?X_K BODY.N))
		(!R5 (?X_L BEACH.N))
		(!R6 (?X_M MAN.N))
		(!R7 (?X_P AGENT.N))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_J (?X_M (((ADV-A (ON.P ?X_L)) FIND.V) ?X_K)))
		(?X_H (?X_P (THERE.ADV BE.V)))
		(?X_E (?X_P (TAKE.V ?X_F)))
		(?X_B (?X_P (TAKE.V ?X_C)))
		(?X_O (?X_P ((ADV-A (FROM.P ?L1)) LEAVE.2.V) ?L2))
	)
)

; "Tom walked along the beach."
; "He saw some shells on the sand."
; "He picked them up."
; "He put them in his pocket."
(EPI-SCHEMA ((?X_F (PICK_UP.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_F MALE.A))
		(!R2 (?X_F AGENT.N))
		(!R3 (?X_E (PLUR SHELL.N)))
		(!R4 (?X_K POCKET.N))
		(!R5 (?X_K (PERTAIN-TO ?X_F)))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_H (?X_K ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_J (?X_K SEE.9.V ?X_E))
		(?X_D (?X_K (PICK_UP.V ?X_E)))
		(?X_B (?X_F (((ADV-A (IN.P ?X_K)) PUT.V) ?X_A)))
	)
)

; "A policeman found a body on the beach."
; "The body was covered by sand."
; "The man took pictures and fingerprints."
; "The body was taken to the morgue."
(EPI-SCHEMA ((?X (((ADV-A (IN.P ?X_F)) FIND.V) ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_L MORGUE.N))
		(!R2 (?X_K POLICEMAN.N))
		(!R3 (?X_K MAN.N))
		(!R4 (?X_F SAND.N))
		(!R5 (?X_G BODY.N))
		(!R6 (?X_H BEACH.N))
		(!R7 (?X_G (ON.P ?X_H)))
		(!R8 (?X_K SMALLER-THAN.N ?X))
		(!R9 (?X_L DESTINATION.N))
		(!R10 (?X AGENT.N))
	)
	(:STEPS
		(?X_J (?X_K FIND.4.V ?X_G))
		(?X_B (?X_G (BY.P ?X_F)))
		(?X_E (?X_K (TAKE.V ?X_A)))
		(?X_C (?X_G (TO.P ?X_L)))
		(?E_1 (?X TAKE.10.V ?X_K ?X_L))
	)
)

; "Tom saw a policeman walking on the street."
; "A policeman stopped Tom."
; "A policeman asked him questions."
(EPI-SCHEMA ((?X_J (BY.P ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR QUESTION.N)))
		(!R2 (?X_D POLICEMAN.N))
		(!R3 (?X_G POLICEMAN.N))
		(!R4 (?X_J AGENT.N))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_I (?X_J SEE.11.V ?X_D))
		(?X_F (?X_G (STOP.V ?X_J)))
		(?X_B (?X_D (ASK.V ?X_J ?X_C)))
		(?E_1 (?X_D ((ADV-A (FROM.P ?L1)) WALK.12.V) ?L2))
	)
)

; "Tom's father died."
; "His mother cried for days."
; "Tom felt sad."
(EPI-SCHEMA ((?X_I (FEEL.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D SAD.A))
		(!R2 (?X_I AGENT.N))
		(!R3 (?X_G FATHER.N))
		(!R4 (?X_G (PERTAIN-TO ?X_I)))
		(!R5 (?X_H MOTHER.N))
		(!R6 (?X_H (PERTAIN-TO ?X_I)))
	)
	(:STEPS
		(?X_F (?X_G DIE.V))
		(?X_A (?X_H CRY.13.V))
		(?X_C (?X_I (FEEL.V ?X_D)))
	)
)

; "The woman had an accident."
; "She broke her leg."
; "Her doctor said that she should be careful."
(EPI-SCHEMA ((?X_G (BREAK.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C ACCIDENT.N))
		(!R2 (?X_F LEG.N))
		(!R3 (?X_G DOCTOR.N))
		(!R4 (?X_H WOMAN.N))
		(!R5 (?X_F (PERTAIN-TO ?X_H)))
		(!R6 (?X_G (PERTAIN-TO ?X_H)))
	)
	(:STEPS
		(?X_E (?X_H (HAVE.V ?X_C)))
		(?X_A (?X_H (BREAK.V ?X_F)))
		(?X_B (?X_G (SAY.V (THAT (?X_H (SHOULD.MD CAREFUL.A))))))
	)
)

; "A boy fell down on the playground."
; "He hurt himself."
; "His mother called the doctor."
; "The doctor came over."
(EPI-SCHEMA ((?X_I ((ADV-A (ON.P ?X_G)) FALL_DOWN.V)) ** ?E)
	(:ROLES
		(!R1 (?X_B DOCTOR.N))
		(!R2 (?X_H MOTHER.N))
		(!R3 (?X_G PLAYGROUND.N))
		(!R4 (?X_I BOY.N))
		(!R5 (?X_H (PERTAIN-TO ?X_I)))
		(!R6 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_I (DOWN.ADV ((ADV-A (ON.P ?X_G)) FALL.V))))
		(?X_D (?X_I (HURT.V ?X_I)))
		(?X_A (?X_H (CALL.V ?X_B)))
		(?X_K (?X_B ((ADV-A (FROM.P ?L1)) COME_OVER.14.V) ?L2))
	)
)

; "Mary fell down."
; "She hurt her head."
; "Her family helped her."
; "A nurse came to help Mary."
(EPI-SCHEMA ((?X_G FALL_DOWN.V) ** ?E)
	(:ROLES
		(!R1 (?X_F FAMILY.N))
		(!R2 (?X_E HEAD.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_E (PERTAIN-TO ?X_G)))
		(!R5 (?X_F (PERTAIN-TO ?X_G)))
		(!R6 (?X_H NURSE.N))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_D (?X_G (DOWN.ADV FALL.V)))
		(?X_A (?X_G (HURT.V ?X_E)))
		(?X_B (?X_F (HELP.V ?X_G)))
		(?X_J (?X_H ((ADV-A (FROM.P ?L1)) COME.15.V) ?L2))
	)
)

; "Mary's car ran into a tree."
; "She couldn't move."
; "Her leg hurt."
; "Her knee was swollen."
(EPI-SCHEMA ((?X_D ((ADV-A (INTO.P ?X_A)) RUN.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D CAR.N))
		(!R2 (?X_A TREE.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_D (PERTAIN-TO ?X_G)))
		(!R5 (?X_E (PERTAIN-TO ?X_G)))
		(!R6 (?X_F LEG.N))
		(!R7 (?X_F (PERTAIN-TO ?X_G)))
	)
	(:STEPS
		(?X_C (?X_D ((ADV-A (INTO.P ?X_A)) RUN.V)))
		(E363.SK (NOT (?X_G (CAN.MD MOVE.V))))
		(?X_I (?X_F HURT.V))
	)
)



; "Two people were walking down the street."
; "One person stopped to talk to another."
; "The other person just walked past them."
(EPI-SCHEMA ((?X_B ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_B OTHER.A))
		(!R2 (?X_B PERSON.N))
		(!R3 ((TWO.D (PLUR PERSON.N)) AGENT.N))
		(!R4 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_A ((TWO.D (PLUR PERSON.N)) ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_D (?X_B ((ADV-A (FROM.P ?L1)) WALK.2.V) ?L2))
	)
)

; "A man and woman were talking on the phone."
; "The man said something funny."
; "The woman laughed."
; "The man hung up the phone."
; "The man and the woman talked for awhile."
(EPI-SCHEMA (((SET-OF ?X_J ?X_I) ((ADV-A (ON.P ?X_H)) TALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E THING.N))
		(!R2 (?X_E FUNNY.A))
		(!R3 (?X_H PHONE.N))
		(!R4 (?X_I WOMAN.N))
		(!R5 (?X_J MAN.N))
		(!R6 (?X_M WOMAN.N))
		(!R7 (?N NOISE.N))
	)
	(:STEPS
		(?X_G ((SET-OF ?X_J ?X_I) ((ADV-A (ON.P ?X_H)) TALK.V)))
		(?X_D (?X_J (SAY.V ?X_E)))
		(?X_L (?X_M LAUGH.3.V ?N))
		(?X_B (?X_J (HANG_UP.V ?X_H)))
	)
)

; "Tom liked to play baseball."
; "He played on the team."
; "His team lost."
(EPI-SCHEMA ((?X_I (PLAY.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_G TEAM.N))
		(!R2 (?X_H BASEBALL.N))
		(!R3 (?X_G (PERTAIN-TO ?X_I)))
		(!R4 ((KA (PLAY.V ?X_H)) ACTION.N))
		(!R5 (?X AGENT.N))
		(!R6 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_B (?X_G LOSE.V))
		(?X_D (?X_I LIKE.4.V (KA (PLAY.V ?X_H))))
		(?E_1 (?X PLAY.5.V))
		(?X_F (?X_I PLAY.6.V))
	)
)

; "Tom and Bob talked to each other."
; "They talked for a while."
; "Tom asked Bob what he thought of baseball."
(EPI-SCHEMA ((?X_A ((ADV-A (FOR.P ?X_F)) TALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_A AGENT.N))
		(!R2 (?X_B AGENT.N))
		(!R3 (?X_E AGENT.N))
		(!R4 (?X_F WHILE.N))
	)
	(:STEPS
		(?X_D ((SET-OF ?X_A ?X_B) ((ADV-A (TO.P (EACH.D OTHER.A))) TALK.V)))
		(?X_H (?X_E ((ADV-A (FOR.P ?X_F)) TALK.V)))
	)
)

; "Tom and Jenny met on the street."
; "They talked for awhile."
; "They decided to go to a party together."
(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA.PR ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_G PARTY.N))
		(!R2 (?X_E STREET.N))
		(!R3 (?X_F AGENT.N))
		(!R4 (?X_G DESTINATION.N))
		(!R5 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_D ((SET-OF ?X_F ?X_H) ((ADV-A (ON.P ?X_E)) MEET.V)))
		(?X_B (?X_H (TOGETHER.ADV ((ADV-A (TO.P ?X_G)) GO.V))))
		(?E_1 (?X_H ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_G))
	)
)

; "A girl named Jessie walks into a store."
; "She buys some plants."
; "She takes them outside."
; "She puts them in the ground."
; "She waters them."
(EPI-SCHEMA ((?X_I (BUY.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_K (PLUR PLANT.N)))
		(!R2 (?X_J STORE.N))
		(!R3 (?X_I GIRL.N))
		(!R4 (?X_I ((PASV NAME.V) ?X_L)))
		(!R5 (?X_M GROUND.N))
		(!R6 (?X_J DESTINATION.N))
		(!R7 (?X_L DESTINATION.N))
		(!R8 (?X_K SMALLER-THAN.N ?X_L))
		(!R9 (?X_L AGENT.N))
		(!R10 (?X_M LOCATION.N))
	)
	(:STEPS
		(?X_D (?X_I ((ADV-A (FROM.P ?L1)) WALK.8.V) ?X_J))
		(?X_B (?X_L (BUY.V ?X_K)))
		(?X_F (?X_L TAKE.9.V ?X_K ?X_L))
		(?X_H (?X_L PUT.10.V ?X_K ?X_M))
	)
)

; "A boy and girl played together on the playground."
; "They climbed all over each other."
; "They chased each other around."
; "The boy caught the girl."
; "He held her tight."
(EPI-SCHEMA ((?X_J (CHASE.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E GIRL.N))
		(!R2 (?X_J BOY.N))
		(!R3 (?X_K GIRL.N))
		(!R4 ((SET-OF ?X_J ?X_K) AGENT.N))
		(!R5 ((EACH.D OTHER.A) ENTITY.N))
	)
	(:STEPS
		(?X_G ((SET-OF ?X_J ?X_K) PLAY.11.V))
		(?X_I (?X_K CHASE.12.V (EACH.D OTHER.A)))
		(?X_D (?X_J (CATCH.V ?X_E)))
		(?X_B (?X_J ((TIGHT.ADV HOLD.V) ?X_E)))
	)
)

; "Peter said hello to Mary."
; "Mary asked Peter how she was doing."
; "Peter told Mary that he was fine."
; "Mary told Peter that she was okay too."
(EPI-SCHEMA ((?X_D (SAY.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D AGENT.N))
		(!R2 (?X_E AGENT.N))
	)
	(:STEPS
		(?X_C (?X_E (((ADV-A (TO.P ?X_D)) SAY.V) ?X_A)))
		(?X_G (?X_E (TELL.V ?X_D (THAT (?X_E FINE.A)))))
	)
)

; "Tom saw some kids playing basketball."
; "He watched them play for awhile."
; "Then they played again."
; "The first kid scored a basket."
(EPI-SCHEMA ((?X_I ((ADV-A (WITH.P ?X_G)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C BASKET.N))
		(!R2 (?X_D FIRST.A))
		(!R3 (?X_D KID.N))
		(!R4 (?X_G (PLUR KID.N)))
		(!R5 (?X_H BASKETBALL.N))
		(!R6 (?X_I AGENT.N))
		(!R7 (?X AGENT.N))
	)
	(:STEPS
		(?X_F (?X_I SEE.13.V ?X_G))
		(?X_B (?X_D (SCORE.V ?X_C)))
		(?E_1 (?X PLAY.5.V))
	)
)

; "I was going to school today."
; "I saw a girl I liked."
; "I waved at her."
; "She smiled back."
; "Then she ran off."
(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA.PR ?X_J ?L2)) ** ?E)
	(:ROLES
		(!R1 (?X_J GIRL.N))
		(!R2 (?X_I AGENT.N))
		(!R3 (?X_J LOCATION.N))
		(!R4 (NOT (?X_J = ?L2)))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_I SEE.14.V ?X_J))
		(?X_D (?X_I ((ADV-A (AT.P ?X_J)) WAVE.V)))
		(?X_B (?X_J (BACK.ADV SMILE.V)))
		(?X_H (?X_J ((ADV-A (FROM.P ?X_J)) RUN_OFF.15.V) ?L2))
	)
)

; "Tom went to school."
; "He saw a boy he liked."
; "He waved at him."
; "The boy waved back."
(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA.PR ?X_J ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E BOY.N))
		(!R2 (?X_J SCHOOL.N))
		(!R3 (?X_J DESTINATION.N))
		(!R4 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_G (?X_K ((ADV-A (FROM.P ?L1)) GO.16.V) ?X_J))
		(?X_I (?X_K SEE.17.V ?X_E))
		(?X_D (?X_K ((ADV-A (AT.P ?X_E)) WAVE.V)))
		(?X_B (?X_E (BACK.ADV WAVE.V)))
	)
)

; "'I'm going to school tomorrow,' said Tom."
; "'I'll be late because my dad is taking me to work.'"
; "'I can walk there by myself,' said Tom's mom."
; "'You don't have to go with your father,' said Tom's dad."
; "'That's all right,' said Tom."
(EPI-SCHEMA ((?X_B (FOR.P ?X_B)) ** ?E)
	(:ROLES
		(!R1
   (?X_A (BECAUSE.P (KE (?X_D (((ADV-A (FOR.P (KA WORK.V))) TAKE.V) ?X_E))))))
		(!R2 (?X_B LATE.A))
		(!R3 (?X_E AGENT.N))
		(!R4 (?X_C MOM.N))
		(!R5 (?X_C (PERTAIN-TO ?X_E)))
		(!R6 (?X_D DAD.N))
		(!R7 (?X_D (PERTAIN-TO ?X_E)))
		(!R8
   ((K (BECAUSE.P (?X_D (((ADV-A (FOR.P (KA WORK.V))) TAKE.V) ?X_E))))
    DESTINATION.N))
		(!R9 (?X AGENT.N))
	)
	(:STEPS
		(E319.SK (?X_E (BE.V ?X_B ?X_A)))
		(?E_1
   (?X ((ADV-A (FROM.P ?L1)) GO.18.V)
    (K (BECAUSE.P (?X_D (((ADV-A (FOR.P (KA WORK.V))) TAKE.V) ?X_E))))))
	)
)

; "Tommy met Sally at the park."
; "They played catch together."
; "They walked around the park."
; "They talked for a while."
; "Sally asked Tommy if he would go to the movies with her."
(EPI-SCHEMA ((?X_I (((ADV-A (AT.P ?X_J)) MEET.V) ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_D WHILE.N))
		(!R2 (?X_I AGENT.N))
		(!R3 (?X_J PARK.N))
		(!R4 (?X_K AGENT.N))
		(!R5 (?X_N AGENT.N))
		(!R6 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_H (?X_K (((ADV-A (AT.P ?X_J)) MEET.V) ?X_I)))
		(?X_F (?X_N (PLAY.V (KE (?X_A CATCH_TOGETHER.V)))))
		(?X_M (?X_N ((ADV-A (FROM.P ?L1)) WALK.2.V) ?L2))
		(?X_C (?X_N ((ADV-A (FOR.P ?X_D)) TALK.V)))
	)
)

; "'I was going to school today."
; "There were many students there."
; "I saw a girl I liked."
; "She looked good."
; "I waved at her."
; "She smiled back."
; "Then she ran away."
(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA.PR ?X_G ?X_H ?L2)) ** ?E)
	(:ROLES
		(!R1 (?X_G GOOD.A))
		(!R2 (?X_H GIRL.N))
		(!R3 (?X_N MANY.A))
		(!R4 (?X_N (PLUR STUDENT.N)))
		(!R5 (?X_M AGENT.N))
		(!R6 (NOT (?X_N = ?L2)))
		(!R7 (?L2 DESTINATION.N))
		(!R8 (?X_N LOCATION.N))
	)
	(:STEPS
		(?X_J (?X_M SEE.19.V ?X_H))
		(?X_F (?X_H (LOOK.V ?X_G)))
		(?X_D (?X_M ((ADV-A (AT.P ?X_H)) WAVE.V)))
		(?X_B (?X_H (BACK.ADV SMILE.V)))
		(?X_L (?X_H ((ADV-A (FROM.P ?X_N)) RUN_AWAY.20.V) ?L2))
	)
)

; "Diana has been skipping school for two days."
; "She doesn't want to go to school anymore."
; "She is tired of school."
(EPI-SCHEMA ((?X_I (SKIP.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B SCHOOL.N))
		(!R2 (?X_H SCHOOL.N))
		(!R3 (?X_G SCHOOL.N))
		(!R4 (?X_I TIRED.A))
		(!R5 (?X_G DESTINATION.N))
		(!R6 (?X_H DESTINATION.N))
		(!R7 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_F
   (?X_I
    (HAS.AUX
     ((ADV-A (FOR.P (KA (((ADV-A (FOR.P (TWO.D (PLUR DAY.N)))) SKIP.V) ?X_G))))
      BE.V))))
		(?X_D (NOT (?X_I (WANT.V (KA (ANYMORE.ADV ((ADV-A (TO.P ?X_H)) GO.V)))))))
		(?X_A (?X_I (OF.P ?X_B)))
		(?E_1 (?X_I ((ADV-A (FROM.P ?L1)) SKIP.21.V) ?X_G))
		(?E_2 (?X_I ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_H))
	)
)



; "The boy watched TV."
; "He saw an old movie."
; "He liked it."
; "It made him laugh."
(EPI-SCHEMA ((?X_D ((ADV-A (AT.P ?X_G)) LAUGH.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G OLD.A))
		(!R2 (?X_G MOVIE.N))
		(!R3 (?X_D BOY.N))
		(!R4 (NOT (?X_G ACTION.N)))
		(!R5 (?N NOISE.N))
	)
	(:STEPS
		(?X_A (?X_D (SEE.V ?X_G)))
		(?X_F (?X_D LIKE.1.V ?X_G))
		(?X_C (?X_G (MAKE.V (KE (?X_D LAUGH.V)))))
		(?E_1 (?X_G MAKE_NOISE.2.V ?N))
	)
)

; "Tom watched a TV show."
; "He saw an old movie."
; "He liked it."
; "It made him laugh."
(EPI-SCHEMA ((?X_J (LIKE.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_K OLD.A))
		(!R2 (?X_K MOVIE.N))
		(!R3 (?X_G TV.N))
		(!R4 (?X_G SHOW.N))
		(!R5 (?X_J AGENT.N))
		(!R6 (NOT (?X_K ACTION.N)))
		(!R7 (?N NOISE.N))
	)
	(:STEPS
		(?X_F (?X_J (WATCH.V ?X_G)))
		(?X_D (?X_J (SEE.V ?X_K)))
		(?X_I (?X_J LIKE.3.V ?X_K))
		(?X_B (?X_K (MAKE.V (KE (?X_J LAUGH.V)))))
		(?E_1 (?X_K MAKE_NOISE.2.V ?N))
	)
)

; "Tom likes movies."
; "He has seen many movies."
; "His favorites are comedy movies."
(EPI-SCHEMA ((?X_J (LIKE.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_B COMEDY.N))
		(!R2 (?X_B (PLUR MOVIE.N)))
		(!R3 (?X_H (PLUR FAVORITE.N)))
		(!R4 (?X_I (PLUR MOVIE.N)))
		(!R5 (?X_G MANY.A))
		(!R6 (?X_G (PLUR MOVIE.N)))
		(!R7 (?X_H (PERTAIN-TO ?X_J)))
		(!R8 (NOT (?X_I ACTION.N)))
		(!R9 (NOT (?X_I AGENT.N)))
		(!R10 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_D (?X_J LIKE.4.V ?X_I))
		(?X_F (?X_J SEE.5.V ?X_G))
		(?X_A (?X_H (= ?X_B)))
	)
)

; "Tom watched a movie on TV."
; "He saw an old movie."
; "He laughed at some parts of the movie."
; "He cried at other parts of the movie."
(EPI-SCHEMA ((?X_M ((ADV-A (AT.P ?X_G)) LAUGH.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G (PLUR PART.N)))
		(!R2 (?X_I OLD.A))
		(!R3 (?X_I MOVIE.N))
		(!R4 (?X_G (OF.P ?X_I)))
		(!R5 (?X_H (OF.P ?X_I)))
		(!R6 (?X_J TV.N))
		(!R7 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_F (?X_M (((ADV-A (ON.P ?X_J)) WATCH.V) ?X_I)))
		(?X_D (?X_M (SEE.V ?X_I)))
		(?X_B (?X_M ((ADV-A (AT.P ?X_G)) LAUGH.V)))
		(?X_L (?X_M CRY.6.V))
	)
)

; "Tom watched television."
; "He saw an old movie."
; "He laughed."
(EPI-SCHEMA ((?X_I ((ADV-A (AT.P ?X_C)) LAUGH.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C OLD.A))
		(!R2 (?X_C MOVIE.N))
		(!R3 (?X_F TELEVISION.N))
		(!R4 (?X_I AGENT.N))
		(!R5 (?N NOISE.N))
	)
	(:STEPS
		(?X_E (?X_I (WATCH.V ?X_F)))
		(?X_B (?X_I (SEE.V ?X_C)))
		(?X_H (?X_I LAUGH.7.V ?N))
	)
)

; "Joey watched TV."
; "He saw an old movie."
; "He laughed."
; "It was funny."
(EPI-SCHEMA ((?X_F ((ADV-A (AT.P ?X_C)) LAUGH.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C OLD.A))
		(!R2 (?X_C MOVIE.N))
		(!R3 (?X_C FUNNY.A))
		(!R4 (?X_F AGENT.N))
		(!R5 (?X_I AGENT.N))
		(!R6 (?N NOISE.N))
	)
	(:STEPS
		(?X_E (?X_I (WATCH.V ?X_F)))
		(?X_B (?X_I (SEE.V ?X_C)))
		(?X_H (?X_I LAUGH.8.V ?N))
	)
)

; "Aunt Sue watched TV."
; "She watched cartoons."
; "She watched movies."
; "She watched sports on TV."
(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA.PR ?X_A ?X_D ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_A (PLUR CARTOON.N)))
		(!R2 (?X_D (PLUR MOVIE.N)))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_H TV.N))
		(!R5 (?X_I (PLUR SPORT.N)))
	)
	(:STEPS
		(?X_C (?X_G (WATCH.V ?X_A)))
		(?X_F (?X_G (WATCH.V ?X_D)))
		(?X_K (?X_G (((ADV-A (ON.P ?X_H)) WATCH.V) ?X_I)))
	)
)

; "Joe watched a movie on TV."
; "He laughed."
; "He cried."
; "He felt sad."
; "He felt happy."
; "He fell asleep."
(EPI-SCHEMA ((?X_R (COMPOSITE-SCHEMA.PR ?X_L ?X_I ?X_F ?X_C ?N)) ** ?E)
	(:ROLES
		(!R1 (?X_C ASLEEP.A))
		(!R2 (?X_F HAPPY.A))
		(!R3 (?X_I SAD.A))
		(!R4 (?X_L MOVIE.N))
		(!R5 (?X_M TV.N))
		(!R6 (?N NOISE.N))
		(!R7 (?X_R AGENT.N))
	)
	(:STEPS
		(?X_K (?X_R (((ADV-A (ON.P ?X_M)) WATCH.V) ?X_L)))
		(?X_O (?X_R LAUGH.9.V ?N))
		(?X_Q (?X_R CRY.10.V))
		(?X_H (?X_R (FEEL.V ?X_I)))
		(?X_E (?X_R (FEEL.V ?X_F)))
		(?X_B (?X_R (FALL.V ?X_C)))
	)
)

; "Tom watched TV while he ate dinner."
; "He watched an old movie."
; "He laughed because he remembered something funny from the movie."
(EPI-SCHEMA ((?X_F (((ADV-A (WHILE.P (KA (EAT.V ?X_E)))) WATCH.V) ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_F OLD.A))
		(!R2 (?X_F MOVIE.N))
		(!R3 (?X_E DINNER.N))
		(!R4 (?X_I ((ADV-A (FROM.P ?X_F)) FUNNY.A)))
		(!R5 (?X_I THING.N))
		(!R6 ((K (BECAUSE.P (?X_J (REMEMBER.V ?X_I)))) AGENT.N))
		(!R7 (?X_J AGENT.N))
		(!R8 (?N NOISE.N))
	)
	(:STEPS
		(?X_D (?X_J (KA (TV.ADV WATCH.V)) (WHILE.P (KE (?X_J (EAT.V ?X_E))))))
		(?X_B (?X_J (WATCH.V ?X_F)))
		(?E_1 ((K (BECAUSE.P (?X_J (REMEMBER.V ?X_I)))) EAT.11.V ?X_E))
		(?X_H (?X_J LAUGH.12.V ?N))
	)
)

; "The girl watched TV."
; "She saw an old movie."
; "It was funny."
; "She laughed."
(EPI-SCHEMA ((?X_A ((ADV-A (AT.P ?X_D)) LAUGH.V)) ** ?E)
	(:ROLES
		(!R1 (?X_A AGENT.N))
		(!R2 (?X_D OLD.A))
		(!R3 (?X_D MOVIE.N))
		(!R4 (?X_D FUNNY.A))
		(!R5 (?X_G GIRL.N))
	)
	(:STEPS
		(?X_C (?X_G (WATCH.V ?X_A)))
		(?X_F (?X_G (SEE.V ?X_D)))
		(?X_I (?X_G LAUGH.V))
	)
)

; "Joe watched TV."
; "He saw an old movie."
; "He laughed at some parts."
; "He thought the movie was funny."
(EPI-SCHEMA ((?X_A ((ADV-A (AT.P ?X_F)) LAUGH.V)) ** ?E)
	(:ROLES
		(!R1 (?X_A AGENT.N))
		(!R2 (?X_F (PLUR PART.N)))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_J OLD.A))
		(!R5 (?X_J MOVIE.N))
	)
	(:STEPS
		(?X_C (?X_I (WATCH.V ?X_A)))
		(?X_E (?X_I (SEE.V ?X_J)))
		(?X_H (?X_I ((ADV-A (AT.P ?X_F)) LAUGH.V)))
		(?X_L (?X_I (THINK.V (THT (?X_J FUNNY.A)))))
	)
)

; "I'm going to tell you about my friend John."
; "John has been playing football since grade school."
; "His favorite team is the Cowboys."
; "When we are together, we always talk about sports."
(EPI-SCHEMA ((?X_E ((ADV-A (ABOUT.P ?X_P)) TALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C FOOTBALL.N))
		(!R2 (?X_E AGENT.N))
		(!R3 (?X_D (PERTAIN-TO ?X_E)))
		(!R4 (?X_F AGENT.N))
		(!R5 (?X_L AGENT.N))
		(!R6 (?X_I SCHOOL.N))
		(!R7 (?X_I GRADE.N))
		(!R8 (?X_M (PERTAIN-TO ?X_L)))
		(!R9 (?X_M ?X_N TEAM.N))
		(!R10 (?X_O COWBOYS.N))
		(!R11 (?X_P (PLUR SPORT.N)))
		(!R12 (?X_S AGENT.N))
		(!R13 (?X AGENT.N))
	)
	(:STEPS
		(?X_H (?X_E ((ADV-A (FOR.P (KA (TELL.V ?X_F (ABOUT.P ?X_A ?X_L))))) GO.V)))
		(?X_K
   (?X_L
    (HAS.AUX
     ((ADV-A (FOR.P (KA (((ADV-A (SINCE.P ?X_I)) PLAY.V) ?X_C)))) BE.V))))
		(?X_B (?X_M (= ?X_O)))
		(?X_R (?X_S (ALWAYS.ADV ((ADV-A (ABOUT.P ?X_P)) TALK.V))))
		(E304.SK (?X_S (TOGETHER.ADV BE.V)))
		(?E_1 (?X PLAY.13.V))
	)
)

; "Bill played football."
; "He was on the football team."
; "His team lost the game."
(EPI-SCHEMA ((?X_F (PLAY.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B GAME.N))
		(!R2 (?X_E FOOTBALL.N))
		(!R3 (?X_E TEAM.N))
		(!R4 (?X_F AGENT.N))
		(!R5 (?X_E (PERTAIN-TO ?X_F)))
		(!R6 (?X_I FOOTBALL.N))
		(!R7 (?X_J BILL.N))
		(!R8 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_H (?X_J PLAY.14.V))
		(?X_D (?X_F ((ADV-A (ON.P ?X_E)) BE.V)))
		(?X_A (?X_E (LOSE.V ?X_B)))
	)
)

; "Tom played basketball."
; "He played for the high school."
; "Tom's father coached the team."
; "Tom liked playing on the court."
(EPI-SCHEMA ((?X_C (((ADV-A (WITH.P ?X_C)) PLAY.V) ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C HIGH.A))
		(!R2 (?X_C SCHOOL.N))
		(!R3 (?X_C TEAM.N))
		(!R4 (?X_K FATHER.N))
		(!R5 (?X_F BASKETBALL.N))
		(!R6 (?X_K (PERTAIN-TO ?X_L)))
		(!R7 (?X_M COURT.N))
		(!R8 (?X_L AGENT.N))
		(!R9 ((KA ((ADV-A (ON.P ?X_M)) PLAY.V)) ACTION.N))
	)
	(:STEPS
		(?X_E (?X_L PLAY.15.V))
		(?X_H (?X_L PLAY.16.V))
		(?X_B (?X_K (COACH.V ?X_C)))
		(?X_J (?X_L LIKE.17.V (KA ((ADV-A (ON.P ?X_M)) PLAY.V))))
	)
)

; "Mary loves football."
; "She plays on a team."
; "She watches games on TV."
(EPI-SCHEMA ((?X_J (PLAY.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR GAME.N)))
		(!R2 (?X_C (ON.P ?X_D)))
		(!R3 (?X_I FOOTBALL.N))
		(!R4 (?X_I OBJECT.N))
		(!R5 (NOT (?X_I ACTION.N)))
		(!R6 (NOT (?X_I AGENT.N)))
		(!R7 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_F (?X_J LOVE.18.V ?X_I))
		(?X_H (?X_J PLAY.19.V))
		(?X_B (?X_J (WATCH.V ?X_C)))
	)
)

; "Tom played basketball."
; "He liked to play basketball."
; "He played for his high school."
; "He played on a team."
; "He practiced hard."
(EPI-SCHEMA ((?X_O (PLAY.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_D HARD.A))
		(!R2 (?X_G BASKETBALL.N))
		(!R3 (?X_N BASKETBALL.N))
		(!R4 (?X_J (PERTAIN-TO ?X_O)))
		(!R5 (?X_K HIGH.A))
		(!R6 (?X_J ?X_K SCHOOL.N))
		(!R7 ((KA (PLAY.V ?X_N)) ACTION.N))
		(!R8 (?X AGENT.N))
		(!R9 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_F (?X_O PLAY.20.V))
		(?X_I (?X_O LIKE.21.V (KA (PLAY.V ?X_N))))
		(?E_1 (?X PLAY.13.V))
		(?X_A (?X_O PLAY.22.V))
		(?X_M (?X_O PLAY.23.V))
		(?X_C (?X_O (PRACTICE.V ?X_D)))
	)
)

; "Tom likes to play tennis."
; "He plays tennis on Saturdays."
; "He's good at tennis."
; "Tom doesn't like basketball."
(EPI-SCHEMA ((?X_I (PLAY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C TENNIS.N))
		(!R2 (?X_M GOOD.A))
		(!R3 (?X_L TENNIS.N))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_H TENNIS.N))
		(!R6 (?X_H (ON.P ?X_I)))
		(!R7 ((KA (PLAY.V ?X_L)) ACTION.N))
		(!R8 (?X AGENT.N))
		(!R9 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_E (?X_M LIKE.24.V (KA (PLAY.V ?X_L))))
		(?E_1 (?X PLAY.13.V))
		(?X_G (?X_M PLAY.25.V))
		(?X_B (?X_M (AT.P ?X_C)))
		(?X_K (?X_M LIKE.26.V (IND (1 ?X_A))))
	)
)

; "Carol was playing softball."
; "She played first base."
; "She hit a fly ball."
; "She caught the ball."
(EPI-SCHEMA ((?X_M ((ADV-A (WITH.P ?X_C)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C BALL.N))
		(!R2 (?X_F FLY.N))
		(!R3 (?X_F BALL.N))
		(!R4 (?X_I SOFTBALL.N))
		(!R5 (?X_L FIRST.A))
		(!R6 (?X_L BASE.N))
		(!R7 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_H (?X_M PLAY.27.V))
		(?X_K (?X_M PLAY.28.V))
		(?X_E (?X_M (HIT.V ?X_F)))
		(?X_B (?X_M (CATCH.V ?X_C)))
	)
)

; "Mary played softball."
; "She liked to play softball."
; "She practiced hard for the games."
(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA.PR (KA (PLAY.V ?X_I)))) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR GAME.N)))
		(!R2 (?X_F SOFTBALL.N))
		(!R3 (?X_I SOFTBALL.N))
		(!R4 ((KA (PLAY.V ?X_I)) ACTION.N))
		(!R5 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_E (?X_J PLAY.29.V))
		(?X_H (?X_J LIKE.30.V (KA (PLAY.V ?X_I))))
		(?X_B (?X_J (HARD.ADV ((ADV-A (FOR.P ?X_C)) PRACTICE.V))))
		(?E_1 (?X_J PLAY.31.V))
	)
)



; "My friend is an artist."
; "His art is amazing."
; "I like his paintings."
; "One of them is even hanging in our house."
(EPI-SCHEMA ((?X_F (((ADV-A (BY.P ?X_E)) LIKE.V) ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_C ARTIST.N))
		(!R2 (?X_E FRIEND.N))
		(!R3 (?X_D ART.N))
		(!R4 (?X_D AMAZING.A))
		(!R5 (?X_D (PERTAIN-TO ?X_E)))
		(!R6 (?X_E (PERTAIN-TO ?X_F)))
		(!R7 (?X_G (PLUR PAINTING.N)))
		(!R8 (?X_G (PERTAIN-TO ?X_E)))
		(!R9 (?X_F AGENT.N))
		(!R10 (NOT (?X_G ACTION.N)))
		(!R11 (NOT (?X_G AGENT.N)))
	)
	(:STEPS
		(?X_A (?X_E (= ?X_C)))
		(?X_B (?X_F LIKE.1.V ?X_G))
	)
)

; "Karen has many paintings."
; "One painting is on her wall."
; "She likes some of her paintings better than others."
(EPI-SCHEMA ((?X_I (LIKE.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_H WALL.N))
		(!R2 (?X_B PAINTING.N))
		(!R3 (?X_E MANY.A))
		(!R4 (?X_E (PLUR PAINTING.N)))
		(!R5 (?X_H (PERTAIN-TO ?X_I)))
		(!R6 (?X_I AGENT.N))
		(!R7 (?X_J OBJECT.N))
		(!R8 (NOT (?X_J ACTION.N)))
		(!R9 (NOT (?X_J AGENT.N)))
	)
	(:STEPS
		(?X_D (?X_I HAVE.2.V ?X_E))
		(?X_A (?X_B ((ADV-A (ON.P ?X_H)) BE.V)))
		(?X_G (?X_I LIKE.3.V ?X_J))
	)
)

; "John likes music."
; "He plays the guitar."
; "He sings songs."
; "He writes songs."
; "He plays for fun."
(EPI-SCHEMA ((?X_O (LIKE.V ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR SONG.N)))
		(!R2 (?X_F (PLUR SONG.N)))
		(!R3 (?X_I GUITAR.N))
		(!R4 (?X_N MUSIC.N))
		(!R5 (?X_N OBJECT.N))
		(!R6 (NOT (?X_N ACTION.N)))
		(!R7 (NOT (?X_N AGENT.N)))
		(!R8 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_K (?X_O LIKE.4.V ?X_N))
		(?X_H (?X_O (PLAY.V ?X_I)))
		(?X_E (?X_O (SING.V ?X_F)))
		(?X_B (?X_O (WRITE.V ?X_C)))
		(?X_M (?X_O PLAY.5.V))
	)
)

; "Tom painted a picture."
; "It looked good."
; "He gave it to Jenny."
; "She liked it."
(EPI-SCHEMA ((?X_F (GIVE.V ?X_K ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_C GOOD.A))
		(!R2 (?X_M PICTURE.N))
		(!R3 (?X_F AGENT.N))
		(!R4 (?X_K MALE.A))
		(!R5 (?X_K AGENT.N))
		(!R6 (?X_L AGENT.N))
		(!R7 (NOT (?X_M ACTION.N)))
		(!R8 (NOT (?X_M AGENT.N)))
	)
	(:STEPS
		(?X_E (?X_F (PAINT.V ?X_M)))
		(?X_B (?X_M (LOOK.V ?X_C)))
		(?X_H (?X_K (GIVE.7.V ?X_L ?X_M)))
		(?X_J (?X_L LIKE.8.V ?X_M))
	)
)

; "Bill painted some pictures."
; "One of them was good."
; "Another one wasn't so good."
; "He liked painting."
(EPI-SCHEMA ((?X_G (LIKE.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR PICTURE.N)))
		(!R2 (?X_D BILL.N))
		(!R3 (?X_G MALE.A))
		(!R4 (?X_H PAINTING.N))
		(!R5 (?X_G AGENT.N))
		(!R6 (NOT (?X_H ACTION.N)))
		(!R7 (NOT (?X_H AGENT.N)))
	)
	(:STEPS
		(?X_B (?X_D (PAINT.V ?X_C)))
		(?X_F (?X_G LIKE.9.V ?X_H))
	)
)

; "Tom loves playing baseball."
; "He has a big game."
; "He plays for the team."
; "He hits a long drive."
; "He makes a run and wins the game."
(EPI-SCHEMA ((?X (PLAY.V ?X_O)) ** ?E)
	(:ROLES
		(!R1 (?X_C RUN.N))
		(!R2 (?X_F LONG.A))
		(!R3 (?X_F DRIVE.N))
		(!R4 (?X_I BIG.A))
		(!R5 (?X_I GAME.N))
		(!R6 (?X_O BASEBALL.N))
		(!R7 (?X_N TEAM.N))
		(!R8 ((KA (PLAY.V ?X_O)) ACTION.N))
		(!R9 (?X AGENT.N))
		(!R10 (?X_P AGENT.N))
	)
	(:STEPS
		(?X_K (?X_P LOVE.10.V (KA (PLAY.V ?X_O))))
		(?X_H (?X_P (HAVE.V ?X_I)))
		(?E_1 (?X PLAY.11.V))
		(?X_M (?X_P PLAY.12.V))
		(?X_E (?X_P (HIT.V ?X_F)))
		(?X_A (?X_P (MAKE.V ?X_C)))
		(?X_B (?X_P (WIN.V ?X_I)))
	)
)

; "Mark is an artist."
; "His art is good."
; "He paints pictures."
; "He has lots of paintings."
(EPI-SCHEMA ((?X_D (HAVE.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_C ARTIST.N))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_H ART.N))
		(!R4 (?X_H GOOD.A))
		(!R5 (?X_G (PLUR PAINTING.N)))
		(!R6 (?X_I (PLUR LOT.N)))
		(!R7 (?X_I (OF.P ?X_G)))
		(!R8 (?X_H (PERTAIN-TO ?X_J)))
		(!R9 (?X_I OBJECT.N))
		(!R10 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_B (?X_D (= ?X_C)))
		(?X_F (?X_J HAVE.13.V ?X_I))
	)
)

; "Tom played basketball."
; "He played well."
; "He scored many points."
; "He beat his opponent."
(EPI-SCHEMA ((?X_H (WELL.ADV PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G OPPONENT.N))
		(!R2 (?X_D MANY.A))
		(!R3 (?X_D (PLUR POINT.N)))
		(!R4 (?X_H AGENT.N))
		(!R5 (?X_G (PERTAIN-TO ?X_H)))
		(!R6 (?X_K BASKETBALL.N))
		(!R7 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_J (?X_L PLAY.16.V))
		(?X_F (?X_H (WELL.ADV PLAY.V)))
		(?X_C (?X_H (SCORE.V ?X_D)))
		(?X_A (?X_H (BEAT.V ?X_G)))
	)
)

; "Ralph played on the playground."
; "He climbed the monkey bars."
; "He slid down the slide."
; "He played tag."
; "He threw rocks into the sandbox."
(EPI-SCHEMA ((?X_O (PLAY.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR ROCK.N)))
		(!R2 (?X_D SANDBOX.N))
		(!R3 (?X_G TAG.N))
		(!R4 (?X_P PLAYGROUND.N))
		(!R5 (?X_N MONKEY.N))
		(!R6 (?X_N (PLUR BAR.N)))
		(!R7 (?X_N DESTINATION.N))
		(!R8 (?X_O AGENT.N))
		(!R9 (?X_P DESTINATION.N))
		(!R10 (NOT (?X_P = ?X_P)))
	)
	(:STEPS
		(?X_I (?X_O ((ADV-A (ON.P ?X_P)) PLAY.V)))
		(?X_K (?X_O ((ADV-A (FROM.P ?L1)) CLIMB.17.V) ?X_N))
		(?X_M (?X_O ((ADV-A (FROM.P ?X_P)) SLIDE_DOWN.18.V) ?X_P))
		(?X_F (?X_O (PLAY.V ?X_G)))
		(?X_B (?X_O (((ADV-A (INTO.P ?X_D)) THROW.V) ?X_C)))
	)
)

; "Tommy liked to play football."
; "He played on the team."
; "He played for the school."
; "He scored many touchdowns."
(EPI-SCHEMA ((?X (PLAY.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C MANY.A))
		(!R2 (?X_C (PLUR TOUCHDOWN.N)))
		(!R3 (?X_J FOOTBALL.N))
		(!R4 ((KA (PLAY.V ?X_J)) ACTION.N))
		(!R5 (?X AGENT.N))
		(!R6 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_E (?X_K LIKE.22.V (KA (PLAY.V ?X_J))))
		(?E_1 (?X PLAY.11.V))
		(?X_G (?X_K PLAY.23.V))
		(?X_I (?X_K PLAY.24.V))
		(?X_B (?X_K (SCORE.V ?X_C)))
	)
)

; "Tom's family went to the park."
; "There were lots of kids there."
; "Tom played ball."
; "He hit the ball."
; "He made a run and scored."
(EPI-SCHEMA ((?X_R ((ADV-A (IN.P ?X_M)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D RUN.N))
		(!R2 (?X_G BALL.N))
		(!R3 (?X_J (PLUR LOT.N)))
		(!R4 (?X_M PARK.N))
		(!R5 (?X_N FAMILY.N))
		(!R6 (?X_N (PERTAIN-TO ?X_R)))
		(!R7 (?X_Q BALL.N))
		(!R8 (?X_R AGENT.N))
	)
	(:STEPS
		(?X_L (?X_N ((ADV-A (TO.P ?X_M)) GO.V)))
		(?X_I (?X_A (BE.V ?X_J)))
		(?X_P (?X_R PLAY.25.V))
		(?X_F (?X_R (HIT.V ?X_G)))
		(?X_B (?X_R (MAKE.V ?X_D)))
		(?X_C (?X_R SCORE.V))
	)
)

; "'We played baseball.'"
; "'We played basketball.'"
; "'We played tag.'"
; "'We played hide-and-seek.'"
; "'We played hopscotch.'"
; "'We played tag.'"
; "'We played basketball.'"
; "'We played football.'"
; "'We played catch.'"
; "'We played hide-and-seek.'"
; "'We played tag.'"
; "'We played tag.'<|endoftext|>"
(EPI-SCHEMA ((?X_S (COMPOSITE-SCHEMA.PR ?X_A ?X_D ?X_G ?X_J ?X_M ?X_P ?X_T)) **
             ?E)
	(:ROLES
		(!R1 (?X_A HOPSCOTCH.N))
		(!R2 (?X_D TAG.N))
		(!R3 (?X_G BASKETBALL.N))
		(!R4 (?X_J FOOTBALL.N))
		(!R5 (?X_M CATCH.N))
		(!R6 (?X_P HIDE-AND-SEEK.A))
		(!R7 (?X_S AGENT.N))
		(!R8 (?X_S (SET-OF AGENT.N)))
		(!R9 (?X_T TAG.N))
	)
	(:STEPS
		(?X_C (?X_S (PLAY.V ?X_A)))
		(?X_F (?X_S (PLAY.V ?X_D)))
		(?X_I (?X_S (PLAY.V ?X_G)))
		(?X_L (?X_S (PLAY.V ?X_J)))
		(?X_O (?X_S (PLAY.V ?X_M)))
		(?X_R (?X_S (PLAY.V ?X_P)))
		(?X_V (?X_S (PLAY.V ?X_T)))
	)
)

; "Bobby went on vacation."
; "His parents took him to the park."
; "There was a sandbox there."
; "A little boy was playing in the sand."
; "He was rolling around in the sand."
(EPI-SCHEMA ((?X_L (((ADV-A (FROM.P ?X_J)) TAKE.V) ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_D SAND.N))
		(!R2 (?X_E LITTLE.A))
		(!R3 (?X_E BOY.N))
		(!R4 (?X_J VACATION.N))
		(!R5 (?X_M (PLUR PARENT.N)))
		(!R6 (?X_M (PERTAIN-TO ?X_L)))
		(!R7 (?X_K PARK.N))
		(!R8 (?X_J DESTINATION.N))
		(!R9 (?X_L AGENT.N))
		(!R10 (?X_K DESTINATION.N))
		(!R11 (?X_L SMALLER-THAN.N ?X_M))
	)
	(:STEPS
		(?X_G (?X_L ((ADV-A (FROM.P ?L1)) GO.28.V) ?X_J))
		(?X_A (?X_M TAKE.29.V ?X_L ?X_K))
		(?X_I (?X_E PLAY.30.V))
		(?X_C (?X_E (AROUND.ADV ((ADV-A (IN.P ?X_D)) ROLL.V))))
	)
)



; "The boy went to eat ice cream."
; "His mouth was full."
; "He ate some ice cream."
; "He drank milk."
(EPI-SCHEMA ((?X_F (EAT.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_J ICE.N))
		(!R2 (?X_J CREAM.N))
		(!R3 (?X_K ICE.N))
		(!R4 (?X_K CREAM.N))
		(!R5 (?X_F MOUTH.N))
		(!R6 (?X_F FULL.A))
		(!R7 (?X_E MILK.N))
		(!R8 (?X_G BOY.N))
		(!R9 (?X_F (PERTAIN-TO ?X_G)))
		(!R10 (?L2 DESTINATION.N))
		(!R11 (?X_J FOOD.N))
		(!R12 (?X_K FOOD.N))
	)
	(:STEPS
		(?X_B (?X_G ((ADV-A (FROM.P ?L1)) GO.1.V) ?L2))
		(?E_1 (?X_G EAT.2.V ?X_J))
		(?X_D (?X_G EAT.3.V ?X_K))
		(?X_I (?X_G DRANK.4.V ?X_E))
	)
)

; "Alice liked ice cream."
; "She always ate ice cream."
; "She ate lots of ice cream."
; "She bought some ice cream."
(EPI-SCHEMA ((?X_M (EAT.V ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_C ICE.N))
		(!R2 (?X_C CREAM.N))
		(!R3 (?X_K ICE.N))
		(!R4 (?X_K CREAM.N))
		(!R5 (?X_L ICE.N))
		(!R6 (?X_L CREAM.N))
		(!R7 (?X_H ICE.N))
		(!R8 (?X_H CREAM.N))
		(!R9 (?X_N (PLUR LOT.N)))
		(!R10 (?X_N (OF.P ?X_H)))
		(!R11 (NOT (?X_K ACTION.N)))
		(!R12 (NOT (?X_K AGENT.N)))
		(!R13 (?X_L FOOD.N))
		(!R14 (?X_M AGENT.N))
		(!R15 (?X_N FOOD.N))
	)
	(:STEPS
		(?X_E (?X_M LIKE.5.V ?X_K))
		(?X_G (?X_M EAT.3.V ?X_L))
		(?X_J (?X_M EAT.3.V ?X_N))
		(?X_B (?X_M (BUY.V ?X_C)))
	)
)

; "A car ran into a tree."
; "The driver was hurt."
; "The police came."
; "They arrested the driver."
(EPI-SCHEMA ((?X_G ((ADV-A (INTO.P ?X_F)) RUN.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C DRIVER.N))
		(!R2 (?X_J POLICE.N))
		(!R3 (?X_F TREE.N))
		(!R4 (?X_G CAR.N))
		(!R5 (?X_J AGENT.N))
		(!R6 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_G ((ADV-A (INTO.P ?X_F)) RUN.V)))
		(?X_I (?X_J ((ADV-A (FROM.P ?L1)) COME.6.V) ?L2))
		(?X_B (?X_J (ARREST.V ?X_C)))
	)
)

; "Tom loves ice cream."
; "His favorite flavor is chocolate."
; "He likes vanilla too."
; "Tom wants some ice cream right now."
(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA.PR ?X_E ?X_D ?X_L ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_D ICE.N))
		(!R2 (?X_D CREAM.N))
		(!R3 (?X_E CHOCOLATE.N))
		(!R4 (?X_H (PERTAIN-TO ?X_M)))
		(!R5 (?X_L ICE.N))
		(!R6 (?X_L CREAM.N))
		(!R7 (?X_I FAVORITE.A))
		(!R8 (?X_H ?X_I FLAVOR.N))
		(!R9 (?X_N VANILLA.N))
		(!R10 (NOT (?X_L ACTION.N)))
		(!R11 (NOT (?X_L AGENT.N)))
		(!R12 (?X_M AGENT.N))
		(!R13 (NOT (?X_N ACTION.N)))
		(!R14 (NOT (?X_N AGENT.N)))
	)
	(:STEPS
		(?X_G (?X_M LOVE.7.V ?X_L))
		(?X_A (?X_H (= ?X_E)))
		(?X_K (?X_M LIKE.8.V ?X_N))
		(?X_C (?X_M (((ADV (RIGHT.ADV NOW.A)) WANT.V) ?X_D)))
	)
)

; "Joe bought some ice cream from a store."
; "He ate two scoops."
; "He liked them."
(EPI-SCHEMA ((?X_I (((ADV-A (FROM.P ?X_D)) BUY.V) ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C ICE.N))
		(!R2 (?X_C CREAM.N))
		(!R3 (?X_D STORE.N))
		(!R4 (?F FOOD.N))
		(!R5 (?X_I AGENT.N))
		(!R6 (?X_J OBJECT.N))
		(!R7 (NOT (?X_J ACTION.N)))
	)
	(:STEPS
		(?X_B (?X_I (((ADV-A (FROM.P ?X_D)) BUY.V) ?X_C)))
		(?X_F (?X_I EAT.9.V ?F))
		(?X_H (?X_I LIKE.10.V ?X_J))
	)
)

; "Tom loves ice cream."
; "His favorite flavor is chocolate."
; "He has ice cream for breakfast."
; "Tom wants to eat ice cream everyday."
(EPI-SCHEMA ((?X_M (LOVE.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_D ICE.N))
		(!R2 (?X_D CREAM.N))
		(!R3 (?X_E CHOCOLATE.N))
		(!R4 (?X_H (PERTAIN-TO ?X_M)))
		(!R5 (?X_L ICE.N))
		(!R6 (?X_L CREAM.N))
		(!R7 (?X_I FAVORITE.A))
		(!R8 (?X_H ?X_I FLAVOR.N))
		(!R9 (?X_N ICE.N))
		(!R10 (?X_N CREAM.N))
		(!R11 (NOT (?X_L ACTION.N)))
		(!R12 (NOT (?X_L AGENT.N)))
		(!R13 (?X_M AGENT.N))
		(!R14 (?X_N FOOD.N))
	)
	(:STEPS
		(?X_G (?X_M LOVE.11.V ?X_L))
		(?X_A (?X_H (= ?X_E)))
		(?X_K (?X_M HAVE.12.V ?X_N))
		(?X_C (?X_M (WANT.V (KA (EVERYDAY.ADV EAT.V) ?X_D))))
	)
)

; "The girl ate ice cream."
; "She liked it so much."
; "She ate three scoops."
(EPI-SCHEMA ((?X_E (EAT.V ?F)) ** ?E)
	(:ROLES
		(!R1 (?X_H ICE.N))
		(!R2 (?X_H CREAM.N))
		(!R3 (?X_E GIRL.N))
		(!R4 (?X_H FOOD.N))
		(!R5 (NOT (?X_H ACTION.N)))
		(!R6 (NOT (?X_H AGENT.N)))
		(!R7 (?F FOOD.N))
	)
	(:STEPS
		(?X_B (?X_E EAT.3.V ?X_H))
		(?X_D (?X_E LIKE.13.V ?X_H))
		(?X_G (?X_E EAT.9.V ?F))
	)
)

; "Sammy liked ice cream."
; "His favorite flavor was chocolate."
; "He couldn't eat any more ice cream."
; "He walked back home."
(EPI-SCHEMA ((?X_L (EAT.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C CHOCOLATE.N))
		(!R2 (?X_F (PERTAIN-TO ?X_L)))
		(!R3 (?X_J ICE.N))
		(!R4 (?X_J CREAM.N))
		(!R5 (?X_G FAVORITE.A))
		(!R6 (?X_F ?X_G FLAVOR.N))
		(!R7 (?X_K HOME.N))
		(!R8 (?X_K (PERTAIN-TO ?X_L)))
		(!R9 (NOT (?X_J ACTION.N)))
		(!R10 (NOT (?X_J AGENT.N)))
		(!R11 (?X_K DESTINATION.N))
		(!R12 (?X_L AGENT.N))
	)
	(:STEPS
		(E246.SK
   (NOT
    (?X_L
     ((CAN.MD EAT.V) (ANY.D (L X (AND (X MORE.A) (X ICE.N) (X CREAM.N))))))))
		(?X_E (?X_L LIKE.14.V ?X_J))
		(?X_B (?X_F (= ?X_C)))
		(?X_I (?X_L ((ADV-A (FROM.P ?L1)) WALK_BACK.15.V) ?X_K))
	)
)

; "The girl was tired."
; "Her parents were asleep."
; "She decided to play a game."
; "She played the game until midnight."
(EPI-SCHEMA ((?X_D (PLAY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C GAME.N))
		(!R2 (?X_E GIRL.N))
		(!R3 (?X_E TIRED.A))
		(!R4 (?X_D (PLUR PARENT.N)))
		(!R5 (?X_D ASLEEP.A))
		(!R6 (?X_D (PERTAIN-TO ?X_E)))
	)
	(:STEPS
		(?X_B (?X_E (PLAY.V ?X_C)))
		(?X_G (?X_E PLAY.16.V))
	)
)

; "Alice was having fun playing a game."
; "She was winning the game."
; "She kept on playing."
; "She lost the game."
(EPI-SCHEMA ((?X_F (PLAY.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_A FUN.N))
		(!R2 (?X_F AGENT.N))
		(!R3 (?X_I FEMALE.A))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_J GAME.N))
	)
	(:STEPS
		(?X_C (?X_F (HAVE.V (KE (?X_A (PLAY.V ?X_J))))))
		(?X_E (?X_F (WIN.V ?X_J)))
		(?X_H (?X_F ((ADV-A (FOR.P (KA PLAY.V))) KEEP_ON.V)))
		(?X_L (?X_I (LOSE.V ?X_J)))
	)
)

; "Alice played chess."
; "She played against other people."
; "She played for money."
; "She lost some money."
(EPI-SCHEMA ((?X_L ((ADV-A (FOR.P ?X_C)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C MONEY.N))
		(!R2 (?X_F CHESS.N))
		(!R3 (?X_I OTHER.A))
		(!R4 (?X_I (PLUR PERSON.N)))
		(!R5 (?X_M MONEY.N))
		(!R6 (?X_L AGENT.N))
		(!R7 (?X_M OBJECT.N))
	)
	(:STEPS
		(?X_E (?X_L PLAY.17.V))
		(?X_H (?X_L PLAY.18.V))
		(?X_B (?X_L ((ADV-A (FOR.P ?X_C)) PLAY.V)))
		(?X_K (?X_L LOSE.19.V ?X_M))
	)
)

; "Tommy liked playing cards."
; "He played poker."
; "He played bridge."
; "He played chess."
; "He played checkers."
; "He played dominoes."
; "He played war."
; "He played Go Fish."
(EPI-SCHEMA ((?X_C (PLAY.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_F WAR.N))
		(!R3 (?X_I POKER.N))
		(!R4 (?X_W (PLUR CARD.N)))
		(!R5 (?X_N BRIDGE.N))
		(!R6 (?X_Q CHESS.N))
		(!R7 (?X_T (PLUR CHECKER.N)))
		(!R8 (?X_X (PLUR DOMINOE.N)))
		(!R9 ((KA (PLAY.V ?X_W)) ACTION.N))
		(!R10 (?X_X ENTITY.N))
		(!R11 (?X_Y AGENT.N))
	)
	(:STEPS
		(?X_K (?X_Y LIKE.20.V (KA (PLAY.V ?X_W))))
		(?X_H (?X_Y (PLAY.V ?X_I)))
		(?X_M (?X_Y PLAY.21.V))
		(?X_P (?X_Y PLAY.22.V))
		(?X_S (?X_Y PLAY.23.V ?X_T))
		(?X_V (?X_Y PLAY.24.V ?X_X))
		(?X_E (?X_Y (PLAY.V ?X_F)))
		(?X_B (?X_Y (PLAY.V (KE (?X_C FISH.N)))))
	)
)

; "Sarah was going to bed."
; "She put on pajamas."
; "She turned off the lights."
; "She went to sleep."
(EPI-SCHEMA ((?X_K ((ADV-A (TO.P ?X_L)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR LIGHT.N)))
		(!R2 (?X_H (PLUR PAJAMA.N)))
		(!R3 (?X_L BED.N))
		(!R4 (?X_K AGENT.N))
		(!R5 (?X_L DESTINATION.N))
	)
	(:STEPS
		(?X_J (?X_K ((ADV-A (FROM.P ?L1)) GO.25.V) ?X_L))
		(?X_G (?X_K ((ADV-A (ON.P ?X_H)) PUT.V)))
		(?X_D (?X_K (TURN_OFF.V ?X_E)))
		(?X_B (?X_K ((ADV-A (FOR.P (KA SLEEP.V))) GO.V)))
	)
)

; "Tom played a game on the computer."
; "He typed some words into the computer."
; "He pressed keys on the keyboard."
; "He clicked buttons on the mouse."
; "He moved the cursor around the screen."
(EPI-SCHEMA ((?X_P ((PLUR TYPE.N) ?X_E (K (INTO.P ?X_D ?X_I ?X_L)))) ** ?E)
	(:ROLES
		(!R1 (?X_A GAME.N))
		(!R2 (?X_D COMPUTER.N))
		(!R3 (?X_E (PLUR WORD.N)))
		(!R4 (?X_H KEYBOARD.N))
		(!R5 (?X_I (PLUR KEY.N)))
		(!R6 (?X_L (PLUR BUTTON.N)))
		(!R7 (?X_L (ON.P ?X_M)))
		(!R8 (?X_P AGENT.N))
		(!R9 (?X_Q SCREEN.N))
		(!R10 (?X_R CURSOR.N))
	)
	(:STEPS
		(?X_C (?X_P (((ADV-A (ON.P ?X_D)) PLAY.V) ?X_A)))
		(?X_G (?X_P (((ADV-A (INTO.P ?X_D)) TYPE.V) ?X_E)))
		(?X_K (?X_P (((ADV-A (ON.P ?X_H)) PRESS.V) ?X_I)))
		(?X_O (?X_P (CLICK.V ?X_L)))
		(?X_T (?X_P (((ADV-A (AROUND.P ?X_Q)) MOVE.V) ?X_R)))
	)
)

; "Tom played chess."
; "His opponent was good."
; "He beat him."
; "He won the game."
(EPI-SCHEMA ((?X_J (PLAY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C GAME.N))
		(!R2 (?X_F OPPONENT.N))
		(!R3 (?X_F GOOD.A))
		(!R4 (?X_F (PERTAIN-TO ?X_J)))
		(!R5 (?X_I CHESS.N))
		(!R6 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_H (?X_J PLAY.26.V))
		(?X_E (?X_J (BEAT.V ?X_F)))
		(?X_B (?X_J (WIN.V ?X_C)))
	)
)

; "Tom fell asleep on the couch."
; "His mom woke him up."
; "'You're not going to bed,' she said."
; "'I'm just resting my eyes,' Tom answered."
(EPI-SCHEMA ((?X_G (FALL.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B ASLEEP.A))
		(!R2 (?X_B (ON.P ?X_C)))
		(!R3 (?X_F MOM.N))
		(!R4 (?X_G AGENT.N))
		(!R5 (?X_G (PLUR EYE.N)))
		(!R6 (?X_F (PERTAIN-TO ?X_G)))
		(!R7 (?X_G (PERTAIN-TO ?X_H)))
	)
	(:STEPS
		(?X_E (?X_G (FALL.V ?X_B)))
		(?X_A (?X_F (WAKE_UP.V ?X_G)))
	)
)



; "The girl put some clothes into the washing machine."
; "After she washed them, they were clean."
; "She hung them up on the line."
; "In the morning, they were dirty again."
; "What happened?"
(EPI-SCHEMA ((?X_C (WASH.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C MACHINE.N))
		(!R2 (?X_F GIRL.N))
		(!R3 (?X_G (PLUR CLOTHE.N)))
		(!R4 (?X_G AGENT.N))
		(!R5 (?X_H LINE.N))
		(!R6 (?L LOCATION.N))
		(!R7 (?X_H LOCATION.N))
	)
	(:STEPS
		(?X_A (?X_C WASH.V))
		(?X_B (?X_F PUT.1.V ?X_G ?L))
		(?X_E (?X_F HANG_UP.2.V ?X_G ?X_H))
	)
)

; "Alice washed her clothes."
; "She hung them on the line."
; "They were dirty in the morning."
(EPI-SCHEMA ((?X_F (WASH.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_D MORNING.N))
		(!R2 (?X_E (PLUR CLOTHE.N)))
		(!R3 (?X_E AGENT.N))
		(!R4 (?X_E ((ADV-A (IN.P ?X_D)) DIRTY.A)))
		(!R5 (?X_E (PERTAIN-TO ?X_F)))
		(!R6 (?X_G LINE.N))
		(!R7 (?X_F AGENT.N))
		(!R8 (?X_G LOCATION.N))
	)
	(:STEPS
		(?X_A (?X_F WASH.3.V ?X_E))
		(?X_C (?X_F HANG.4.V ?X_E ?X_G))
	)
)

; "Alice washed her clothes."
; "She put them into the washing machine."
; "She turned the dials."
; "She watched the clothes spin around."
; "The clothes came out clean."
(EPI-SCHEMA ((?X_F WASH.V) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR DIAL.N)))
		(!R2 (?X_F MACHINE.N))
		(!R3 (?X_I (PLUR CLOTHE.N)))
		(!R4 (?X_I (PERTAIN-TO ?X_J)))
		(!R5 (?X_I ENTITY.N))
		(!R6 (?X_J AGENT.N))
		(!R7 (?L LOCATION.N))
	)
	(:STEPS
		(?X_A (?X_J WASH.5.V ?X_I))
		(?X_B (?X_F WASH.V))
		(?X_H (?X_J PUT.6.V ?X_I ?L))
		(?X_D (?X_J (TURN.V ?X_E)))
	)
)

; "Alice had a washing machine."
; "The machine broke down."
; "She called the repairman."
; "He fixed it."
(EPI-SCHEMA ((?X_I BREAK_DOWN.V) ** ?E)
	(:ROLES
		(!R1 (?X_F REPAIRMAN.N))
		(!R2 (?X_I MACHINE.N))
		(!R3 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_A (?X_I WASH.V))
		(?X_K (?X_L HAVE.7.V ?X_I))
		(?X_H (?X_I BREAK_DOWN.V))
		(?X_E (?X_L (CALL.V ?X_F)))
		(?X_C (?X_F (FIX.V ?X_I)))
	)
)

; "Mary washed her clothes by hand."
; "She liked that way better than using a washing machine."
; "She used lots of soap."
(EPI-SCHEMA ((?X_K (USE.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR LOT.N)))
		(!R2 (?X_E (OF.P ?X_F)))
		(!R3 (?X_G MACHINE.N))
		(!R4 (?X_H (PLUR CLOTHE.N)))
		(!R5 (?X_H (PERTAIN-TO ?X_K)))
		(!R6 (?X_L WAY.N))
		(!R7 (?X_K AGENT.N))
		(!R8 (NOT (?X_L AGENT.N)))
		(!R9 (?X_L OBJECT.N))
	)
	(:STEPS
		(?X_A (?X_K WASH.8.V ?X_H))
		(?X_B (?X_G WASH.V))
		(?X_J (?X_K LIKE.9.V ?X_L))
		(?X_D (?X_K (USE.V ?X_E)))
	)
)

; "Mary washed her clothes."
; "She put them in the dryer."
; "She hung them on the line."
; "When she came back from work, they were clean."
(EPI-SCHEMA ((?X_G (WASH.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR CLOTHE.N)))
		(!R2 (?X_F AGENT.N))
		(!R3 (?X_F (PERTAIN-TO ?X_G)))
		(!R4 (?X_H DRYER.N))
		(!R5 (?X_G AGENT.N))
		(!R6 (?X_H LOCATION.N))
	)
	(:STEPS
		(?X_A (?X_G WASH.10.V ?X_F))
		(?X_C (?X_G PUT.11.V ?X_F ?X_H))
		(?X_E (?X_G HANG.12.V ?X_F ?X_H))
	)
)

; "Sammy's mom gave him money for laundry."
; "He took his clothes to the laundromat."
; "He put his clothes in the washing machine."
; "He turned the dials until they were all dry."
(EPI-SCHEMA ((?X_O (((ADV-A (TO.P (ANOTHER.D PERSON.N))) GIVE.V) ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_F (UNTIL.P (KE (?X_M (ALL.ADV DRY.A))))))
		(!R2 (?X_G (PLUR DIAL.N)))
		(!R3 (?X_P MACHINE.N))
		(!R4 (?X_J LAUNDRY.N))
		(!R5 (?X_L MONEY.N))
		(!R6 (?X_L (FOR.P ?X_J)))
		(!R7 (?X_N LAUNDROMAT.N))
		(!R8 (?X_K MOM.N))
		(!R9 (?X_K (PERTAIN-TO ?X_O)))
		(!R10 (?X_M (PLUR CLOTHE.N)))
		(!R11 (?X_M AGENT.N))
		(!R12 (?X_M (PERTAIN-TO ?X_O)))
		(!R13 (?X_K AGENT.N))
		(!R14 (NOT (?X_L AGENT.N)))
		(!R15 (?X_M SMALLER-THAN.N ?X_O))
		(!R16 (?X_N DESTINATION.N))
		(!R17 (?X_O AGENT.N))
		(!R18 (?X_P LOCATION.N))
	)
	(:STEPS
		(?X_I (?X_K (GIVE.13.V ?X_O ?X_L)))
		(?X_A (?X_O TAKE.14.V ?X_M ?X_N))
		(?X_B (?X_P WASH.V))
		(?X_C (?X_O PUT.15.V ?X_M ?X_P))
		(?X_E (?X_O (TURN.V ?X_G ?X_F)))
	)
)

; "Alice washed her clothes."
; "She put them in the dryer."
; "When they were dry, she hung them up."
(EPI-SCHEMA ((?X_F WASH.V) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR CLOTHE.N)))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_D (PERTAIN-TO ?X_E)))
		(!R4 (?X_F DRYER.N))
		(!R5 (?X_E AGENT.N))
		(!R6 (?X_F LOCATION.N))
	)
	(:STEPS
		(?X_A (?X_E WASH.16.V ?X_D))
		(?X_C (?X_E PUT.17.V ?X_D ?X_F))
	)
)

; "Bobby's mom cleaned the house."
; "Bobby helped her."
; "The dishes piled up."
; "Bobby washed the dishes."
; "His mother gave him a dollar for doing so."
(EPI-SCHEMA ((?X_O (CLEAN.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_C DOLLAR.N))
		(!R2 (?X_C (FOR.P (KA (SO.ADV DO.V)))))
		(!R3 (?X_I MOM.N))
		(!R4 (?X_I MOTHER.N))
		(!R5 (?X_F (PLUR DISH.N)))
		(!R6 (?X_I (PERTAIN-TO ?X_O)))
		(!R7 (?X_L HOUSE.N))
		(!R8 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_K (?X_I CLEAN.18.V ?X_L))
		(?X_H (?X_O (HELP.V ?X_A)))
		(?X_E (?X_F PILE_UP.V))
		(?X_N (?X_O WASH.19.V ?X_F))
		(?X_B (?X_I (GIVE.V ?X_O ?X_C)))
	)
)

; "Alice washed her clothes in the washing machine."
; "When she finished washing them, they were clean."
; "She hung them on the line."
; "In the morning, they were dirty again."
(EPI-SCHEMA ((?X_H (WASH.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C MACHINE.N))
		(!R2 (?X_F (PLUR CLOTHE.N)))
		(!R3 (?X_F AGENT.N))
		(!R4 (?X_F (PERTAIN-TO ?X_H)))
		(!R5 (?X_G LINE.N))
		(!R6 (?X_G LOCATION.N))
		(!R7 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_A (?X_C WASH.V))
		(?X_B (?X_H WASH.20.V ?X_F))
		(?E_1 (?X_H WASH.21.V ?X_F))
		(?X_E (?X_H HANG.22.V ?X_F ?X_G))
	)
)

; "Alice washed her clothes."
; "She hung them up on the line."
; "When they were dry, they were clean."
; "But they weren't as good as new."
(EPI-SCHEMA ((?X_E (HANG_UP.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR CLOTHE.N)))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_D (PERTAIN-TO ?X_E)))
		(!R4 (?X_F LINE.N))
		(!R5 (?X_E AGENT.N))
		(!R6 (?X_F LOCATION.N))
	)
	(:STEPS
		(?X_A (?X_E WASH.23.V ?X_D))
		(?X_C (?X_E HANG_UP.24.V ?X_D ?X_F))
	)
)

; "The boy's father told him not to go outside."
; "But he didn't listen."
; "His dad caught him."
; "Now he can't play outside anymore."
(EPI-SCHEMA ((?X_B (BY.P ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A DAD.N))
		(!R2 (?X_B BOY.N))
		(!R3 (?X_A (PERTAIN-TO ?X_B)))
	)
	(:STEPS
		(E307.SK (?X_A (CATCH.V ?X_B)))
	)
)

; "Tom played on the swingset."
; "He liked to swing."
; "He couldn't wait for recess."
; "He was tired after recess."
(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA.PR ?X_B ?Y ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_B RECESS.N))
		(!R2 (?X_H SWING.N))
		(!R3 (?Y ENTITY.N))
		(!R4 (?X_G AGENT.N))
		(!R5 (?X_H OBJECT.N))
		(!R6 (NOT (?X_H AGENT.N)))
	)
	(:STEPS
		(E348.SK (NOT (?X_G (CAN.MD ((ADV-A (FOR.P ?X_B)) WAIT.V)))))
		(?X_D (?X_G PLAY.25.V ?Y))
		(?X_F (?X_G LIKE.26.V ?X_H))
		(?X_A (?X_G (AFTER.P ?X_B)))
	)
)

; "Mark played outside."
; "He climbed on top of the fence."
; "He jumped over the fence."
; "He ran around the yard."
; "He found some rocks."
; "He put them in his pocket."
(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA.PR ?L2 ?X_M ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_D AGENT.N))
		(!R2 (?X_M (PLUR ROCK.N)))
		(!R3 (?X_N POCKET.N))
		(!R4 (?X_N (PERTAIN-TO ?X_O)))
		(!R5 (?L2 DESTINATION.N))
		(!R6 (?X_N LOCATION.N))
		(!R7 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_C (?X_D (OUTSIDE.ADV PLAY.V)))
		(?X_F (?X_O ((ADV-A (FROM.P ?L1)) CLIMB.27.V) ?L2))
		(?X_H (?X_O ((ADV-A (FROM.P ?L1)) JUMP.28.V) ?L2))
		(?X_J (?X_O ((ADV-A (FROM.P ?L1)) RUN.29.V) ?L2))
		(?X_L (?X_O FIND.30.V ?X_M))
		(?X_A (?X_O PUT.31.V ?X_M ?X_N))
	)
)

; "Timmy's mom is always tired."
; "She doesn't sleep well at night."
; "When she gets up in the morning, Timmy has to wake her up."
(EPI-SCHEMA ((?X_C (BADLY.ADV ((ADV-A (AT.P ?X_C)) SLEEP.V))) ** ?E)
	(:ROLES
		(!R1 (?X_A MOM.N))
		(!R2 (?X_A AGENT.N))
		(!R3 (?X_A (PERTAIN-TO ?X_B)))
		(!R4 (?X_C NIGHT.N))
	)
	(:STEPS
		(?X_E (NOT (?X_A (WELL.ADV ((ADV-A (AT.P ?X_C)) SLEEP.V)))))
	)
)

; "Amy is always telling her daughter not to do something."
; "Her daughter doesn't listen."
; "She scolds her daughter."
; "Amy wants her daughter to be good."
(EPI-SCHEMA ((?X_D (SCOLD.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_E DAUGHTER.N))
		(!R2 (?X_E (PERTAIN-TO ?X_D)))
		(!R3 ((IND (0 INTENTIONALLY_ACT)) ACTION.N))
		(!R4 (?X_D AGENT.N))
		(!R5 (NOT (?X_D = ?X_E)))
	)
	(:STEPS
		(?X_A (NOT (?X_E LISTEN.V)))
		(?X_B (?X_D (SCOLD.V ?X_E)))
		(?X_C (?X_D (WANT.V ?X_E (KA GOOD.A))))
		(?E_1 (?X_D TELL.32.V ?X_E (IND (0 INTENTIONALLY_ACT))))
	)
)

; "Mary played on the playground."
; "She climbed on the swing set."
; "She jumped over the monkey bars."
; "She ran around the jungle gym."
(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA.PR ?Y ?L2)) ** ?E)
	(:ROLES
		(!R1 (?Y ENTITY.N))
		(!R2 (?X_I AGENT.N))
		(!R3 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_I PLAY.33.V ?Y))
		(?X_D (?X_I ((ADV-A (FROM.P ?L1)) CLIMB.27.V) ?L2))
		(?X_F (?X_I ((ADV-A (FROM.P ?L1)) JUMP.28.V) ?L2))
		(?X_H (?X_I ((ADV-A (FROM.P ?L1)) RUN.29.V) ?L2))
	)
)

; "A playground is for children."
; "Children play on a playground."
; "Kids enjoy playing on a playground."
(EPI-SCHEMA ((?X_G ((ADV-A (IN.P ?X_C)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C PLAYGROUND.N))
		(!R2 (?X_D (PLUR KID.N)))
		(!R3 (?X_G (PLUR CHILD.N)))
		(!R4 (?X_H PLAYGROUND.N))
		(!R5 (?X_K PLAYGROUND.N))
		(!R6 (?X_L (PLUR CHILD.N)))
	)
	(:STEPS
		(?X_F (?X_H ((ADV-A (FOR.P ?X_G)) BE.V)))
		(?X_J (?X_L PLAY.34.V))
		(?X_B (?X_D ((ADV-A (FOR.P (KA ((ADV-A (ON.P ?X_C)) PLAY.V)))) ENJOY.V)))
	)
)

; "The boy's father told him not to go outside."
; "He said that there were dangerous animals."
; "The boy ignored his father."
; "He went outside anyway."
; "A tiger bit him on the leg."
(EPI-SCHEMA ((?X_E (COMPOSITE-SCHEMA.PR (THAT (?X_A (BE.V ?X_D))) ?L2)) ** ?E)
	(:ROLES
		(!R1 (?X_D DANGEROUS.A))
		(!R2 (?X_D (PLUR ANIMAL.N)))
		(!R3 (?X_E FATHER.N))
		(!R4 (?X_F FATHER.N))
		(!R5 (?X_G BOY.N))
		(!R6 (?X_E (PERTAIN-TO ?X_G)))
		(!R7 (?X_F (PERTAIN-TO ?X_G)))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_C (?X_E (SAY.V (THAT (?X_A (BE.V ?X_D))))))
		(?X_I (?X_G ((ADV-A (FROM.P ?L1)) GO.35.V) ?L2))
	)
)



; "We have a new baby brother."
; "His name is Jack."
; "Jack has been born today."
(EPI-SCHEMA ((?X_C (HAVE.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_D NAME.N))
		(!R3 (?X_E NEW.A))
		(!R4 (?X_E BABY.N))
		(!R5 (?X_E BROTHER.N))
		(!R6 (?X_D (PERTAIN-TO ?X_E)))
		(!R7 (?X_F (SET-OF AGENT.N)))
		(!R8 (?X_E OBJECT.N))
		(!R9 (?X_F AGENT.N))
	)
	(:STEPS
		(?X_A (?X_F HAVE.1.V ?X_E))
		(?X_B (?X_D (= ?X_C)))
	)
)

; "Sammy's parents were having a party."
; "There were lots of presents for Sammy."
; "Aunt Helen gave him a present."
(EPI-SCHEMA ((?X_C (HAVE.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR PARENT.N)))
		(!R2 (?X_C (PERTAIN-TO ?X_D)))
		(!R3 (?X_E PARTY.N))
		(!R4 (?X_F (PLUR LOT.N)))
		(!R5 (?X_F (OF.P ?X_G)))
	)
	(:STEPS
		(?X_B (?X_C (HAVE.V ?X_E)))
		(?X_I (?X_A (BE.V ?X_F)))
	)
)

; "Sarah's mother gave birth to a baby girl."
; "They named her Sarah."
; "Sarah weighed eight pounds."
; "Sarah cried a lot."
; "Sarah slept most of the time."
(EPI-SCHEMA ((?X_M CRY.V) ** ?E)
	(:ROLES
		(!R1 (?X_H AGENT.N))
		(!R2 (?X_K BIRTH.N))
		(!R3 (?X_M GIRL.N))
		(!R4 (?X_M BABY.N))
		(!R5 (?X_L MOTHER.N))
		(!R6 (?X_L (PERTAIN-TO ?X_M)))
	)
	(:STEPS
		(?X_J (?X_L (((ADV-A (TO.P ?X_M)) GIVE.V) ?X_K)))
		(?X_G (?X_H (NAME.V ?X_M ?X_M)))
		(?X_E (?X_M (WEIGH.V (EIGHT.D (PLUR POUND.N)))))
		(?X_O (?X_M CRY.2.V))
		(?X_C
   (?X_M
    (SLEEP.V
     (MOST.D (L X (AND (X (PLUR {REF}.N)) (X (OF.P (THE.D TIME.N)))))))))
	)
)

; "John's wife gave birth to a baby girl."
; "The doctor said she would be fine."
; "The mother named the baby girl Mary."
; "Mary was happy that she had a sister."
(EPI-SCHEMA ((?X_K (GIVE.V ?X_K ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_C DOCTOR.N))
		(!R2 (?X_F BIRTH.N))
		(!R3 (?X_J BABY.N))
		(!R4 (?X_J GIRL.N))
		(!R5 (?X_J (HAPPY.A (THAT (?X_J (HAVE.V ?X_L))))))
		(!R6 (?X_G WIFE.N))
		(!R7 (?X_G MOTHER.N))
		(!R8 (?X_G (PERTAIN-TO ?X_H)))
		(!R9 (?X_K AGENT.N))
		(!R10 (?X_I ((PASV NAME.V) ?X_J ?X_K)))
		(!R11 (?X_L SISTER.N))
		(!R12 (?X_L OBJECT.N))
	)
	(:STEPS
		(?X_E (?X_G (((ADV-A (TO.P ?X_J)) GIVE.V) ?X_F)))
		(?X_B (?X_C (SAY.V (THT (?X_J (WILL.MD FINE.A))))))
		(?E_1 (?X_J POSSESS.3.V ?X_L))
	)
)

; "Tom's mom gave birth to Tom."
; "Tom was happy that he had a brother."
; "Tom was excited for Jack's first birthday."
(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA.PR ?X_D ?X_E ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_E BIRTHDAY.N))
		(!R2 (?X_E FIRST.A))
		(!R3 (?X_D BIRTH.N))
		(!R4 (?X_H (HAPPY.A (THAT (?X_H (HAVE.V ?X_G))))))
		(!R5 (?X_H EXCITED.A))
		(!R6 (?X_E (PERTAIN-TO ?X_H)))
		(!R7 (?X_F MOM.N))
		(!R8 (?X_F (PERTAIN-TO ?X_H)))
		(!R9 (?X_G BROTHER.N))
		(!R10 (?X_G OBJECT.N))
		(!R11 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_C (?X_F (((ADV-A (TO.P ?X_H)) GIVE.V) ?X_D)))
		(?X_A (?X_H (FOR.P ?X_E)))
		(?E_1 (?X_H POSSESS.3.V ?X_G))
	)
)

; "Jenny's parents were excited."
; "They had a new baby son."
; "They named him Jack."
; "They gave him a bath."
; "They changed his diaper."
(EPI-SCHEMA ((?X_K (GIVE.V (ANOTHER.D PERSON.N) ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_L NEW.A))
		(!R2 (?X_L BABY.N))
		(!R3 (?X_L SON.N))
		(!R4 (?X_F BATH.N))
		(!R5 (?X_I EXCITED.A))
		(!R6 (?X_I (PLUR PARENT.N)))
		(!R7 (?X_I (PERTAIN-TO ?X_J)))
		(!R8 (?X_K DIAPER.N))
		(!R9 (?X_K (PERTAIN-TO ?X_L)))
	)
	(:STEPS
		(?X_C (?X_I (HAVE.V ?X_L)))
		(?X_E (?X_I (NAME.V ?X_L ?X_L)))
		(?X_H (?X_I (GIVE.V ?X_L ?X_F)))
		(?X_A (?X_I (CHANGE.V ?X_K)))
	)
)

; "Tom's sister, Jenny, had twins."
; "Their names were Tom and Jerry."
; "Tom and Jerry were boys."
; "Tom and Jerry liked to play together."
(EPI-SCHEMA ((?X_M (HAVE.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR BOY.N)))
		(!R2 (?X_M AGENT.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_G (PLUR NAME.N)))
		(!R5 (?X_L AGENT.N))
		(!R6 (?X_G (PERTAIN-TO ?X_L)))
		(!R7 (?X_H SISTER.N))
		(!R8 (?X_H (PERTAIN-TO ?X_I)))
		(!R9 ((SET-OF ?X_L ?X_M) AGENT.N))
		(!R10 ((KA (TOGETHER.ADV PLAY.V)) ACTION.N))
	)
	(:STEPS
		(?X_F (?X_H (HAVE.V ?X_L)))
		(?X_A (?X_G (= (SET-OF ?X_I ?X_M))))
		(?X_C ((SET-OF ?X_L ?X_M) (= ?X_D)))
		(?X_K ((SET-OF ?X_L ?X_M) LIKE.4.V (KA (TOGETHER.ADV PLAY.V))))
	)
)

; "Tom's family had a new baby brother."
; "His name was Jack."
; "He was born on a Saturday."
(EPI-SCHEMA ((?X_G (HAVE.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_C FAMILY.N))
		(!R2 (?X_C (PERTAIN-TO ?X_D)))
		(!R3 (?X_H NAME.N))
		(!R4 (?X_G AGENT.N))
		(!R5 (?X_I NEW.A))
		(!R6 (?X_I BABY.N))
		(!R7 (?X_I BROTHER.N))
		(!R8 (?X_H (PERTAIN-TO ?X_I)))
		(!R9 (?X_J SATURDAY.N))
	)
	(:STEPS
		(?X_F (?X_C (HAVE.V ?X_I)))
		(?X_A (?X_H (= ?X_G)))
		(?X_B (?X_I (ON.P ?X_J)))
	)
)

; "I want a baby sister."
; "My mommy wants a baby sister."
; "My daddy doesn't want a baby sister."
(EPI-SCHEMA ((?X_I (WANT.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_I AGENT.N))
		(!R2 (?X_A BABY.N))
		(!R3 (?X_A SISTER.N))
		(!R4 (?X_D MOMMY.N))
		(!R5 (?X_D (PERTAIN-TO ?X_I)))
		(!R6 (?X_E BABY.N))
		(!R7 (?X_E SISTER.N))
		(!R8 (?X_H DADDY.N))
		(!R9 (?X_H (PERTAIN-TO ?X_I)))
		(!R10 (?X_J BABY.N))
		(!R11 (?X_J SISTER.N))
	)
	(:STEPS
		(?X_C (?X_I (WANT.V ?X_A)))
		(?X_G (?X_D (WANT.V ?X_E)))
		(?X_L (NOT (?X_H (WANT.V ?X_J))))
	)
)

; "I had a dream about flying."
; "I flew over mountains, lakes, and rivers."
; "I landed safely back on Earth."
(EPI-SCHEMA ((?X_D (HAVE.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A DREAM.N))
		(!R2 (?X_A (ABOUT.P (KA FLY.V))))
		(!R3 (?X_D AGENT.N))
		(!R4 (?X_E AGENT.N))
	)
	(:STEPS
		(?X_C (?X_D (HAVE.V ?X_A)))
		(?X_G (?X_D (BACK.ADV (SAFELY.ADV ((ADV-A (ON.P ?X_E)) LAND.V)))))
	)
)

; "Tom dreamed that he was flying."
; "He flew over hills and valleys."
; "He flew over trees and fields."
; "He flew over oceans and seas."
; "He landed safely back on earth."
(EPI-SCHEMA ((?X_L (DREAM.V (THAT (?X_L FLY.V)))) ** ?E)
	(:ROLES
		(!R1 (?X_C EARTH.N))
		(!R2 (?X_L AGENT.N))
		(!R3 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_L (DREAM.V (THAT (?X_L FLY.V)))))
		(?X_G (?X_L ((ADV-A (FROM.P ?L1)) FLY.6.V) ?L2))
		(?X_I (?X_L ((ADV-A (FROM.P ?L1)) FLY.6.V) ?L2))
		(?X_K (?X_L ((ADV-A (FROM.P ?L1)) FLY.6.V) ?L2))
		(?X_B (?X_L (BACK.ADV (SAFELY.ADV ((ADV-A (ON.P ?X_C)) LAND.V)))))
	)
)

; "Tommy dreamed that he was flying."
; "He flew around the world."
; "He saw lots of places."
; "He landed safely back on earth."
(EPI-SCHEMA ((?X_J (DREAM.V (THAT (?X_J ((ADV-A (AROUND.P ?X_C)) FLY.V))))) **
             ?E)
	(:ROLES
		(!R1 (?X_C WORLD.N))
		(!R2 (?X_F (PLUR LOT.N)))
		(!R3 (?X_F (OF.P ?X_G)))
		(!R4 (?X_J AGENT.N))
		(!R5 (?X_K EARTH.N))
	)
	(:STEPS
		(?X_B (?X_J (DREAM.V (THAT (?X_J FLY.V)))))
		(?X_E (?X_J ((ADV-A (AROUND.P ?X_C)) FLY.V)))
		(?X_I (?X_J (SEE.V ?X_F)))
		(?X_M (?X_J (BACK.ADV (SAFELY.ADV ((ADV-A (ON.P ?X_K)) LAND.V)))))
	)
)

; "Mabel dreamed that she was flying."
; "She flew over tall buildings."
; "She saw lots of people."
; "She flew over oceans."
; "She landed safely back on Earth."
(EPI-SCHEMA ((?X_C (DREAM.V (THAT (?X_C FLY.V)))) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_K (PLUR PERSON.N)))
		(!R3 (?X_J (PLUR LOT.N)))
		(!R4 (?X_J (OF.P ?X_K)))
		(!R5 (?X_N AGENT.N))
		(!R6 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_N (DREAM.V (THAT (?X_N FLY.V)))))
		(?X_G (?X_N ((ADV-A (FROM.P ?L1)) FLY.6.V) ?L2))
		(?X_I (?X_N SEE.7.V ?X_J))
		(?X_M (?X_N ((ADV-A (FROM.P ?L1)) FLY.6.V) ?L2))
		(?X_B (?X_N (BACK.ADV (SAFELY.ADV ((ADV-A (ON.P ?X_C)) LAND.V)))))
	)
)



; "Mikey was having fun with his friends."
; "His friend said something funny."
; "Mikey laughed."
(EPI-SCHEMA ((?X_E (HAVE.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C FUN.N))
		(!R2 (?X_D FRIEND.N))
		(!R3 (?X_E THING.N))
		(!R4 (?X_E FUNNY.A))
		(!R5 (?X_E AGENT.N))
		(!R6 (?X_D (PERTAIN-TO ?X_E)))
	)
	(:STEPS
		(?X_A (?X_E (HAVE.V ?X_C)))
		(?X_B (?X_D (SAY.V ?X_E)))
		(?X_G (?X_E LAUGH.V))
	)
)

; "Mary liked boys."
; "She liked to play with them."
; "She played football with some boys."
; "She played basketball with other boys."
(EPI-SCHEMA ((?X_M ((ADV-A (WITH.P ?X_L)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_L (PLUR BOY.N)))
		(!R2 (?X_H FOOTBALL.N))
		(!R3 (?X_K BASKETBALL.N))
		(!R4 ((KA ((ADV-A (WITH.P ?X_L)) PLAY.V)) ACTION.N))
		(!R5 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_C (?X_M LIKE.1.V (IND (3 ?X_A))))
		(?X_E (?X_M LIKE.2.V (KA ((ADV-A (WITH.P ?X_L)) PLAY.V))))
		(?E_1 (?X_M PLAY.3.V))
		(?X_G (?X_M PLAY.4.V))
		(?X_J (?X_M PLAY.5.V))
	)
)

; "Nancy is pretty."
; "She has brown eyes."
; "She likes boys."
; "She plays sports."
; "She is good at basketball."
(EPI-SCHEMA ((?X_K (LIKE.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_B BASKETBALL.N))
		(!R2 (?X_E BROWN.A))
		(!R3 (?X_E (PLUR EYE.N)))
		(!R4 (?X_L PRETTY.A))
		(!R5 (?X_L GOOD.A))
		(!R6 (?X_K (PLUR BOY.N)))
		(!R7 (?X_J (PLUR SPORT.N)))
		(!R8 (?X_K OBJECT.N))
		(!R9 (NOT (?X_K ACTION.N)))
		(!R10 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_D (?X_L (HAVE.V ?X_E)))
		(?X_G (?X_L LIKE.6.V ?X_K))
		(?X_I (?X_L PLAY.7.V))
		(?X_A (?X_L (AT.P ?X_B)))
	)
)

; "Mary is a girl."
; "She likes boys."
; "Mary has two brothers."
; "Mary's dad is a doctor."
; "Mary's mom works as an office clerk."
; "Mary's family lives near a park."
(EPI-SCHEMA ((?X_M (LIKE.V ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_C CLERK.N))
		(!R2 (?X_C OFFICE.N))
		(!R3 (?X_F MOM.N))
		(!R4 (?X_M GIRL.N))
		(!R5 (?X_F (PERTAIN-TO ?X_M)))
		(!R6 (?X_N (PLUR BOY.N)))
		(!R7 (?X_K PARK.N))
		(!R8 (?X_O FAMILY.N))
		(!R9 (?X_O (PERTAIN-TO ?X_M)))
		(!R10 (?X_L DOCTOR.N))
		(!R11 (?X_L DAD.N))
		(!R12 (?X_L (PERTAIN-TO ?X_M)))
		(!R13 (?X_N OBJECT.N))
		(!R14 (NOT (?X_N ACTION.N)))
		(!R15 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_H (?X_M LIKE.8.V ?X_N))
		(?X_E (?X_M (HAVE.V (TWO.D (PLUR BROTHER.N)))))
		(?X_B (?X_F ((ADV-A (AS.P ?X_C)) WORK.V)))
		(?X_J (?X_O LIVE.9.V ?X_K))
	)
)

; "Mary is a girl."
; "She has blond hair."
; "She wears glasses."
; "She likes to go shopping."
(EPI-SCHEMA ((?X_D (LIKE.V (KA (WEAR.V ?X_I)))) ** ?E)
	(:ROLES
		(!R1 (?X_C BLOND.A))
		(!R2 (?X_C HAIR.N))
		(!R3 (?X_D GIRL.N))
		(!R4 (?X_I (PLUR GLASS.N)))
		(!R5 (?X_I OBJECT.N))
		(!R6 (NOT (?X_I AGENT.N)))
		(!R7 ((KA (GO.V (KA SHOP.V))) ACTION.N))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_D (HAVE.V ?X_C)))
		(?X_F (?X_D WEAR.11.V ?X_I))
		(?X_H (?X_D LIKE.12.V (KA (GO.V (KA SHOP.V)))))
		(?E_1 (?X_D ((ADV-A (FROM.P ?L1)) GO.13.V) ?L2))
	)
)

; "Maggie is a girl."
; "She likes boys."
; "She has lots of friends."
(EPI-SCHEMA ((?X_F (LIKE.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_G (PLUR BOY.N)))
		(!R2 (?X_E (PLUR FRIEND.N)))
		(!R3 (?X_H (PLUR LOT.N)))
		(!R4 (?X_H (OF.P ?X_E)))
		(!R5 (?X_F GIRL.N))
		(!R6 (?X_G OBJECT.N))
		(!R7 (NOT (?X_G ACTION.N)))
		(!R8 (?X_H OBJECT.N))
	)
	(:STEPS
		(?X_B (?X_F LIKE.14.V ?X_G))
		(?X_D (?X_F HAVE.15.V ?X_H))
	)
)

; "Michael wants to find a girlfriend."
; "He is looking for someone to date."
; "He will ask her out on a date."
; "He wants to know what she likes."
(EPI-SCHEMA ((?X_J (FIND.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_C OUT.P))
		(!R2 (?X_C (ON.P ?X_D)))
		(!R3 (?X_K DATE.N))
		(!R4 (?X_K AGENT.N))
		(!R5 (?X_G GIRLFRIEND.N))
		(!R6 (?X_J PERSON.N))
		(!R7 (?X_J (TO.P ?X_K)))
		(!R8 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_F (?X_N (WANT.V (KA (FIND.V ?X_G)))))
		(?E_1 (?X_N FIND.16.V ?X_G))
		(?X_I (?X_N ((ADV-A (FOR.P ?X_J)) LOOK.17.V)))
		(?X_B (?X_N (ASK.V ?X_K ?X_C)))
		(?X_M (?X_N WANT.18.V (KA (KNOW.V (ANS-TO (?X_K (LIKE.V ?X_A)))))))
	)
)

; "Tommy was dating a girl."
; "His parents were mad at him."
; "They said they were going to break up with him."
(EPI-SCHEMA ((?X_E (DATE.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A GIRL.N))
		(!R2 (?X_D (PLUR PARENT.N)))
		(!R3 (?X_E AGENT.N))
		(!R4 (?X_D (PERTAIN-TO ?X_E)))
		(!R5 (?X_D ((ADV-A (AT.P ?X_E)) MAD.A)))
	)
	(:STEPS
		(?X_C (?X_E (DATE.V ?X_A)))
		(?X_G
   (?X_D
    (SAY.V
     (THT
      (?X_D ((ADV-A (FOR.P (KA ((ADV-A (WITH.P ?X_E)) BREAK_UP.V)))) GO.V))))))
	)
)

; "Bobby ate too much at dinner."
; "He felt sick."
; "He had to throw up."
; "He threw up all over his mother's kitchen floor."
(EPI-SCHEMA ((?X_N
              (((ADV-A (AFTER.P (KA (EAT.V ?X_O)))) THROW_UP.V)
               (ALL.D
                (L X (AND (X (PLUR {REF}.N)) (X (OVER.P HIMSELF.PRO)))))))
             ** ?E)
	(:ROLES
		(!R1 (?X_J SICK.A))
		(!R2 (?X_K DINNER.N))
		(!R3 (?X_O ((ADV-A (AT.P ?X_K)) (TOO.ADV MUCH.A))))
		(!R4 (?X_N AGENT.N))
		(!R5 (?X_O FOOD.N))
	)
	(:STEPS
		(?X_M (?X_N EAT.19.V ?X_O))
		(?X_I (?X_N (FEEL.V ?X_J)))
		(?X_G (MUST.AUX-S (?X_N THROW_UP.V)))
		(?X_E
   (?X_N
    (THROW_UP.V
     (ALL.D
      (L X
       (AND (X (PLUR {REF}.N))
            (?X_A ?X_B (AND (?X_B MOTHER.N) (?X_B (PERTAIN-TO ?X_N)))
             (X
              (OVER.P
               (SOME.D
                (L X
                 (AND (X (PERTAIN-TO ?X_B)) (X KITCHEN.N)
                      (X FLOOR.N)))))))))))))
	)
)

; "Eating is fun."
; "You can eat anything you want."
; "Food tastes good."
; "I'm hungry right now."
(EPI-SCHEMA ((?X_F (EAT.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_E GOOD.A))
		(!R2 (?X_F AGENT.N))
		(!R3 (?X_I FUN.N))
		(!R4 (?X_J EATING.N))
		(!R5 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_H (?X_J (= ?X_I)))
		(?X_O
   (?X_M EAT.20.V
    (ANY.D
     (L X
      (AND (X THING.N)
           (X
            (?X_M
             ((?X_B ?X_K (AND (?X_K (AT-ABOUT ?X_C)) (?X_D (ORIENTS ?X_K)))
               (WANT.V ** ?X_K))
              THT.REL))))))))
		(?X_L (?X_F (TASTE.V ?X_E)))
	)
)

; "Tom ate pizza for lunch."
; "He ate an apple."
; "His stomach hurt."
(EPI-SCHEMA ((?X_K (EAT.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_H STOMACH.N))
		(!R2 (?X_D LUNCH.N))
		(!R3 (?X_C PIZZA.N))
		(!R4 (?X_C (FOR.P ?X_D)))
		(!R5 (?X_G APPLE.N))
		(!R6 (?X_H (PERTAIN-TO ?X_K)))
		(!R7 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_B (?X_H HURT.V))
		(?X_F (?X_K EAT.19.V ?X_C))
		(?X_J (?X_K EAT.19.V ?X_G))
	)
)

; "'Bobby ate too much at dinner."
; "His tummy hurt."
; "He had to throw up."
; "He threw up on the floor."
(EPI-SCHEMA ((?X_M ((ADV-A (AFTER.P (KA (EAT.V ?X_L)))) THROW_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C FLOOR.N))
		(!R2 (?X_H TUMMY.N))
		(!R3 (?X_H (PERTAIN-TO ?X_M)))
		(!R4 (?X_I DINNER.N))
		(!R5 (?X_L ((ADV-A (AT.P ?X_I)) (TOO.ADV MUCH.A))))
		(!R6 (?X_L FOOD.N))
		(!R7 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_G (?X_H HURT.V))
		(?X_K (?X_M EAT.19.V ?X_L))
		(?X_E (MUST.AUX-S (?X_M THROW_UP.V)))
		(?X_B (?X_M ((ADV-A (ON.P ?X_C)) THROW_UP.V)))
	)
)

; "'Bobby ate too much at dinner.'"
; "He ate some food."
; "He ate lots of food."
; "He ate until he couldn't eat any more."
; "He ate too much."
(EPI-SCHEMA ((?X_O (EAT.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_A DINNER.N))
		(!R2 (?X_K ((ADV-A (AT.P ?X_A)) (TOO.ADV MUCH.A))))
		(!R3 (?X_F FOOD.N))
		(!R4 (?X_M (PLUR LOT.N)))
		(!R5 (?X_M (OF.P ?X_F)))
		(!R6 (?X_N (TOO.ADV MUCH.A)))
		(!R7 (?X_K FOOD.N))
		(!R8 (?X_L FOOD.N))
		(!R9 (?X_M FOOD.N))
		(!R10 (?X_N FOOD.N))
		(!R11 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_C (?X_O EAT.19.V ?X_K))
		(?X_E (?X_O EAT.19.V ?X_L))
		(?X_H (?X_O EAT.19.V ?X_M))
		(?X_J (?X_O EAT.19.V ?X_N))
	)
)

; "Tom ate spaghetti for supper."
; "His father said that was good food."
; "Tom liked spaghetti."
; "Tom ate some bread for dessert."
(EPI-SCHEMA ((?X_O (EAT.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_B FOOD.N))
		(!R2 (?X_B GOOD.A))
		(!R3 (?X_C {REF}.N))
		(!R4 (?X_K FATHER.N))
		(!R5 (?X_E SUPPER.N))
		(!R6 (?X_D (PLUR SPAGHETTI.N)))
		(!R7 (?X_D (FOR.P ?X_E)))
		(!R8 (?X_N (PLUR SPAGHETTI.N)))
		(!R9 (?X_J DESSERT.N))
		(!R10 (?X_P BREAD.N))
		(!R11 (?X_P (FOR.P ?X_J)))
		(!R12 (?X_K (PERTAIN-TO ?X_O)))
		(!R13 (?X_N OBJECT.N))
		(!R14 (NOT (?X_N ACTION.N)))
		(!R15 (NOT (?X_N AGENT.N)))
		(!R16 (?X_O AGENT.N))
		(!R17 (?X_P FOOD.N))
	)
	(:STEPS
		(?X_G (?X_O EAT.19.V ?X_D))
		(?X_A (?X_K (SAY.V (THT (?X_C (= ?X_B))))))
		(?X_I (?X_O LIKE.21.V ?X_N))
		(?X_M (?X_O EAT.19.V ?X_P))
	)
)

; "Mary had dinner for her family."
; "She cooked a good meal."
; "Everyone liked the food."
; "Mary served it on plates."
(EPI-SCHEMA ((?X_K (SERVE.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_B DINNER.N))
		(!R2 (?X_E GOOD.A))
		(!R3 (?X_E MEAL.N))
		(!R4 (?X_H FOOD.N))
		(!R5 (?X_K AGENT.N))
		(!R6 (?X_L (PLUR PLATE.N)))
	)
	(:STEPS
		(?X_D (?X_K (HAVE.V ?X_B)))
		(?X_G (?X_K (COOK.V ?X_E)))
		(?X_J ((EVERY.D PERSON.N) (LIKE.V ?X_H)))
		(?X_N (?X_K (((ADV-A (ON.P ?X_L)) SERVE.V) ?X_A)))
	)
)



; "I'm going to have a baby!"
; "I am excited about this."
; "This will change everything."
; "I can't wait till she comes home from school."
; "She'll help me with things."
(EPI-SCHEMA ((?X_C (ABOUT.P ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C EXCITED.A))
		(!R2 (?X_C AGENT.N))
		(!R3 (?X_D {REF}.N))
		(!R4 (?X_E {REF}.N))
	)
	(:STEPS
		(?X_A (?X_C (ABOUT.P ?X_D)))
		(?X_B (?X_E (CHANGE.V (EVERY.D THING.N))))
	)
)

; "Karen is pregnant."
; "She has a lot of friends who are pregnant."
; "She's happy that she is having a baby."
(EPI-SCHEMA ((?X_E (HAVE.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR FRIEND.N)))
		(!R2 (?X_D BABY.N))
		(!R3 (?X_F LOT.N))
		(!R4 (?X_F (OF.P ?X_C)))
		(!R5 (?X_E PREGNANT.A))
		(!R6 (?X_E (HAPPY.A (THAT (?X_E (HAVE.V ?X_D))))))
		(!R7 (?X_E AGENT.N))
		(!R8 (?X_F OBJECT.N))
	)
	(:STEPS
		(?X_B (?X_E HAVE.1.V ?X_F))
	)
)

; "A woman gave birth to a baby girl."
; "She named the baby Rosemary."
; "Rosemary's father is Robert."
; "Robert has two children."
; "Rosemary's mother is Mary."
; "Mary has three children."
(EPI-SCHEMA ((?X_M
              (COMPOSITE-SCHEMA.PR ?X_I ?X_L ?X_F (THREE.D (PLUR CHILD.N))
               (TWO.D (PLUR CHILD.N))))
             ** ?E)
	(:ROLES
		(!R1 (?X_F AGENT.N))
		(!R2 (?X_K MOTHER.N))
		(!R3 (?X_I BIRTH.N))
		(!R4 (?X_L GIRL.N))
		(!R5 (?X_L BABY.N))
		(!R6 (?X_J (PERTAIN-TO ?X_L)))
		(!R7 (?X_K (PERTAIN-TO ?X_L)))
		(!R8 (?X_M WOMAN.N))
		(!R9 ((TWO.D (PLUR CHILD.N)) OBJECT.N))
		(!R10 (?X_P AGENT.N))
	)
	(:STEPS
		(?X_A (?X_M (((ADV-A (TO.P ?X_L)) GIVE.V) ?X_I)))
		(?X_H (?X_M (NAME.V ?X_L ?X_L)))
		(?X_O (?X_P HAVE.2.V (TWO.D (PLUR CHILD.N))))
		(?X_E (?X_K (= ?X_F)))
		(?X_C (?X_K (HAVE.V (THREE.D (PLUR CHILD.N)))))
	)
)

; "Mary loves babies."
; "She has two children."
; "Both of them are boys."
; "Mary's son is three years old."
; "His name is John."
(EPI-SCHEMA ((?X_M (LOVE.V ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_J SON.N))
		(!R2 (?X_G (PLUR BOY.N)))
		(!R3 (?X_J (PERTAIN-TO ?X_M)))
		(!R4 (?X_N (PLUR BABY.N)))
		(!R5 (?X_M AGENT.N))
		(!R6 (?X_N OBJECT.N))
		(!R7 (NOT (?X_N ACTION.N)))
	)
	(:STEPS
		(?X_L (?X_M LOVE.3.V ?X_N))
		(?X_I (?X_M (HAVE.V (TWO.D (PLUR CHILD.N)))))
		(?X_F ((BOTH.D (L X (AND (X {REF}.N) (X (OF.P ?X_B))))) (= ?X_G)))
		(?X_D (?X_J (BE.V (KE ((THREE.D (PLUR YEAR.N)) OLD.A)))))
	)
)

; "Kathy is pregnant."
; "She has morning sickness."
; "She feels sick all the time."
(EPI-SCHEMA ((?X_B (HAVE.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A MORNING.N))
		(!R2 (?X_A SICKNESS.N))
		(!R3 (?X_B PREGNANT.A))
		(!R4 (?X_B AGENT.N))
	)
	(:STEPS
		(?X_D ((ADV-E (DURING ?X_A)) (?X_B HAVE.V)))
	)
)

; "Mary is pregnant."
; "She's scared."
; "She doesn't know what to do."
; "She wants to tell her parents."
(EPI-SCHEMA ((?X_G
              (COMPOSITE-SCHEMA.PR (ANS-TO (?X_A ({SHOULD}.AUX-V (DO.V ?X_B))))
               (KA (TELL.V ?X_F))))
             ** ?E)
	(:ROLES
		(!R1 (?X_G PREGNANT.A))
		(!R2 (?X_G SCARED.A))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_F (PLUR PARENT.N)))
		(!R5 (?X_F (PERTAIN-TO ?X_G)))
	)
	(:STEPS
		(?X_E (NOT (?X_G (KNOW.V (ANS-TO (?X_A ({SHOULD}.AUX-V (DO.V ?X_B))))))))
		(?X_C (?X_G (WANT.V (KA (TELL.V ?X_F)))))
	)
)

; "Tom's parents were having a baby."
; "Tom was excited."
; "His mom was getting bigger."
; "His dad was getting smaller."
(EPI-SCHEMA ((?X_G (GET.V (KJ BIGGER.A))) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR PARENT.N)))
		(!R2 (?X_C (PERTAIN-TO ?X_J)))
		(!R3 (?X_D BABY.N))
		(!R4 (?X_G MOM.N))
		(!R5 (?X_G (PERTAIN-TO ?X_J)))
		(!R6 (?X_H BIGGER.A))
		(!R7 (?X_I DAD.N))
		(!R8 (?X_I (PERTAIN-TO ?X_J)))
		(!R9 (?X_K SMALLER.A))
	)
	(:STEPS
		(?X_F (?X_C (HAVE.V ?X_D)))
		(?X_A (?X_G (GET.V ?X_H)))
		(?X_B (?X_I (GET.V ?X_K)))
	)
)

; "I like to play basketball."
; "I played today."
; "I won by one point."
; "I beat my opponent."
(EPI-SCHEMA (((ADV-E (DURING ?X_M)) (?X_L PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_H OPPONENT.N))
		(!R2 (?X_E POINT.N))
		(!R3 (?X_H (PERTAIN-TO ?X_L)))
		(!R4 (?X_I TODAY.N))
		(!R5 (?X_M BASKETBALL.N))
		(!R6 (?X_L AGENT.N))
		(!R7 ((KA (PLAY.V ?X_M)) ACTION.N))
		(!R8 (?X AGENT.N))
	)
	(:STEPS
		(?X_K (?X_L LIKE.4.V (KA (PLAY.V ?X_M))))
		(?X_G ((ADV-E ({DURING}.P ?X_I)) (?X_L PLAY.V)))
		(?X_D (?X_L ((ADV-A (BY.P ?X_E)) WIN.V)))
		(?X_B (?X_L (BEAT.V ?X_H)))
		(?E_1 (?X PLAY.5.V))
	)
)

; "Tom played basketball."
; "He was good at basketball."
; "He played for the school team."
; "His coach told him that he did well."
(EPI-SCHEMA ((?X_G (PLAY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C BASKETBALL.N))
		(!R2 (?X_F BASKETBALL.N))
		(!R3 (?X_G COACH.N))
		(!R4 (?X_H ((ADV-A (AT.P ?X_F)) GOOD.A)))
		(!R5 (?X_G (PERTAIN-TO ?X_H)))
		(!R6 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_B (?X_H PLAY.6.V))
		(?X_E (?X_H PLAY.7.V))
	)
)

; "Mary liked to watch basketball games."
; "She watched them on TV."
; "She saw some good plays."
; "She cheered for her team."
(EPI-SCHEMA ((?X_K (WATCH.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_J BASKETBALL.N))
		(!R2 (?X_D TV.N))
		(!R3 (?X_I TEAM.N))
		(!R4 (?X_I (PERTAIN-TO ?X_K)))
		(!R5 (?X_L GOOD.A))
		(!R6 (?X_L (PLUR PLAY.N)))
		(!R7 ((KA (WATCH.V ?X_J)) ACTION.N))
		(!R8 (?X_K AGENT.N))
		(!R9 (?X_L OBJECT.N))
		(!R10 (NOT (?X_L ACTION.N)))
		(!R11 (NOT (?X_L AGENT.N)))
	)
	(:STEPS
		(?X_F (?X_K LIKE.8.V (KA (WATCH.V ?X_J))))
		(?X_C (?X_K (((ADV-A (ON.P ?X_D)) WATCH.V) ?X_J)))
		(?X_H (?X_K SEE.9.V ?X_L))
		(?X_A (?X_K CHEER.10.V ?X_L))
	)
)

; "Tom liked to watch basketball games on TV."
; "He watched the NBA on ESPN."
; "Today's game was close."
; "There were lots of fouls."
(EPI-SCHEMA ((?X_I (WATCH.V ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR LOT.N)))
		(!R2 (?X_D (OF.P ?X_E)))
		(!R3 (?X_H NBA.N))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_M TV.N))
		(!R6 (?X_N BASKETBALL.N))
		(!R7 (?X_L AGENT.N))
		(!R8 ((KA (((ADV-A (ON.P ?X_M)) WATCH.V) ?X_N)) ACTION.N))
	)
	(:STEPS
		(?X_K (?X_L LIKE.11.V (KA (((ADV-A (ON.P ?X_M)) WATCH.V) ?X_N))))
		(?X_G (?X_L (((ADV-A (ON.P ?X_I)) WATCH.V) ?X_H)))
		(?X_C (?X_A (BE.V ?X_D)))
	)
)

; "Tom liked playing basketball."
; "He played on the team."
; "He scored many points."
; "His coach gave him a trophy for winning."
(EPI-SCHEMA ((?X_K (PLAY.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_D MANY.A))
		(!R2 (?X_D (PLUR POINT.N)))
		(!R3 (?X_J BASKETBALL.N))
		(!R4 (?X_I COACH.N))
		(!R5 (?X_I (PERTAIN-TO ?X_K)))
		(!R6 (?X_L TROPHY.N))
		(!R7 (?X_L (FOR.P (KA WIN.V))))
		(!R8 ((KA (PLAY.V ?X_J)) ACTION.N))
		(!R9 (?X AGENT.N))
		(!R10 (?X_K AGENT.N))
		(!R11 (NOT (?X_L AGENT.N)))
	)
	(:STEPS
		(?X_F (?X_K LIKE.12.V (KA (PLAY.V ?X_J))))
		(?E_1 (?X PLAY.5.V))
		(?X_H (?X_K PLAY.13.V))
		(?X_C (?X_K (SCORE.V ?X_D)))
		(?X_A (?X_I (GIVE.14.V ?X_K ?X_L)))
	)
)

; "Bobby played basketball."
; "He played for the school team."
; "He scored points."
; "He missed a basket."
(EPI-SCHEMA ((?X_L (PLAY.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_C BASKET.N))
		(!R2 (?X_F (PLUR POINT.N)))
		(!R3 (?X_I BASKETBALL.N))
		(!R4 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_H (?X_L PLAY.15.V))
		(?X_K (?X_L PLAY.16.V))
		(?X_E (?X_L (SCORE.V ?X_F)))
		(?X_B (?X_L (MISS.V ?X_C)))
	)
)

; "Bill liked basketball."
; "He played basketball all year round."
; "He played on a team."
; "He practiced for hours each day."
; "He practiced hard."
(EPI-SCHEMA ((?X_K (LIKE.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C HARD.A))
		(!R2 (?X_K BILL.N))
		(!R3 (?X_J BASKETBALL.N))
		(!R4 (NOT (?X_J ACTION.N)))
		(!R5 (NOT (?X_J AGENT.N)))
		(!R6 (?X_J OBJECT.N))
		(!R7 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_E (?X_K LIKE.17.V ?X_J))
		(?X_G (?X_K PLAY.18.V))
		(?X_I (?X_K PLAY.19.V))
		(?X_B (?X_K (PRACTICE.V ?X_C)))
	)
)



; "A man named John lived alone."
; "His neighbors said that he was weird."
; "They also said that he was strange."
; "People kept telling them so."
(EPI-SCHEMA ((?X_H (SAY.V (THAT (AND (?X_E WEIRD.A) (?X_E STRANGE.A))))) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR PERSON.N)))
		(!R2 (?X_J AGENT.N))
		(!R3 (?X_H (PLUR NEIGHBOR.N)))
		(!R4 (?X_H (PERTAIN-TO ?X_J)))
		(!R5 (?X_I MAN.N))
		(!R6 (?X_I ((PASV NAME.V) ?X_J)))
		(!R7 (?L LOCATION.N))
	)
	(:STEPS
		(?X_A (?X_I LIVE.1.V ?L))
		(?X_B (?X_H (SAY.V (THAT (?X_J WEIRD.A)))))
		(?X_G (?X_H ((ALSO.ADV SAY.V) (THAT (?X_J STRANGE.A)))))
		(?X_D (?X_E ((ADV-A (FOR.P (KA (SO.ADV TELL.V) ?X_E))) KEEP.V)))
	)
)

; "Tom is strange."
; "He doesn't talk much."
; "He's not normal."
; "People think Tom is strange."
(EPI-SCHEMA ((?X_D ((ADV-A (TO.P ?X_D)) TALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR PERSON.N)))
		(!R2 (?X_D STRANGE.A))
		(!R3 (NOT (?X_D NORMAL.A)))
		(!R4 (?X_D AGENT.N))
	)
	(:STEPS
		(?X_B (NOT (?X_D (MUCH.ADV TALK.V))))
		(?X_F (?X_C (THINK.V (THT (?X_D STRANGE.A)))))
	)
)

; "Bob's neighbor is weird."
; "He has lots of cats."
; "He keeps them in cages."
; "His cats don't have any food or water."
(EPI-SCHEMA ((?X_E (HAVE.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_H (PLUR CAT.N)))
		(!R2 (?X_C (PLUR CAGE.N)))
		(!R3 (?X_D WEIRD.A))
		(!R4 (?X_D NEIGHBOR.N))
		(!R5 (?X_H (PERTAIN-TO ?X_D)))
		(!R6 (?X_E AGENT.N))
		(!R7 (?X_D (PERTAIN-TO ?X_E)))
		(!R8 (?X_I (PLUR LOT.N)))
		(!R9 (?X_I (OF.P ?X_H)))
		(!R10 (?X_I OBJECT.N))
	)
	(:STEPS
		(?X_G (?X_D HAVE.2.V ?X_I))
		(?X_B (?X_D (((ADV-A (IN.P ?X_C)) KEEP.V) ?X_H)))
	)
)

; "John liked to play golf."
; "He played golf every week."
; "He found a new club."
; "He practiced all year round."
(EPI-SCHEMA ((?X (PLAY.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_C ROUND.N))
		(!R2 (?X_L GOLF.N))
		(!R3 (?X_H GOLF.N))
		(!R4 (?X_I NEW.A))
		(!R5 (?X_I CLUB.N))
		(!R6 ((KA (PLAY.V ?X_L)) ACTION.N))
		(!R7 (?X AGENT.N))
		(!R8 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_E (?X_M LIKE.3.V (KA (PLAY.V ?X_L))))
		(?E_1 (?X PLAY.4.V))
		(?X_G (?X_M PLAY.5.V))
		(?X_K (?X_M FIND.6.V ?X_I))
		(?X_B ((ADV-E ({DURING}.P (ALL.D YEAR.N))) (?X_M (PRACTICE.V ?X_C))))
	)
)

; "John's neighbors were worried about him."
; "They told their friends."
; "Their friends told other people."
; "Other people thought John was weird."
(EPI-SCHEMA ((?X_E (((ADV-A (ABOUT.P ?X_G)) TELL.V) ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_G WORRIED.A))
		(!R2 (?X_G (PLUR NEIGHBOR.N)))
		(!R3 (?X_D (PLUR FRIEND.N)))
		(!R4 (?X_D (PERTAIN-TO ?X_G)))
		(!R5 (?X_E OTHER.A))
		(!R6 (?X_E (PLUR PERSON.N)))
		(!R7 (?X_F OTHER.A))
		(!R8 (?X_F (PLUR PERSON.N)))
		(!R9 (?X_H AGENT.N))
		(!R10 (?X_G (PERTAIN-TO ?X_H)))
	)
	(:STEPS
		(?X_A (?X_G (ABOUT.P ?X_H)))
		(?X_B (?X_G (TELL.V ?X_D)))
		(?X_C (?X_D (TELL.V ?X_E)))
		(?X_J (?X_F (THINK.V (THT (?X_H WEIRD.A)))))
	)
)

; "Tom's friends were worried about him."
; "They told Tom not to go outside."
; "They said that someone might hurt him."
; "Tom ignored them."
(EPI-SCHEMA ((?X_E (IGNORE.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E AGENT.N))
		(!R2 (?X_D WORRIED.A))
		(!R3 (?X_D (PLUR FRIEND.N)))
		(!R4 (?X_D (PERTAIN-TO ?X_E)))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_D (ABOUT.P ?X_E)))
		(?X_C (?X_E (IGNORE.V ?X_D)))
		(?E_1 (?X_D ((ADV-A (FROM.P ?L1)) GO.7.V) ?L2))
	)
)

; "John was strange."
; "He was quiet."
; "He was always by himself."
; "No one liked him."
(EPI-SCHEMA ((?X_E (LIKE.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E STRANGE.A))
		(!R2 (?X_E QUIET.A))
		(!R3 (?X_E OBJECT.N))
		(!R4 ((NO.D ONE.N) AGENT.N))
		(!R5 (NOT (?X_E ACTION.N)))
	)
	(:STEPS
		(?X_B (?X_E (ALWAYS.ADV ((ADV-A (BY.P ?X_E)) BE.V))))
		(?X_D ((NO.D ONE.N) LIKE.8.V ?X_E))
	)
)

; "Tom's mother told him not to play outside."
; "He did anyway."
; "He played on the street."
; "He played in the park."
; "He played in the yard."
; "He played in the woods."
; "He played in the field."
(EPI-SCHEMA ((?X_R ((ADV-A (IN.P ?X_C)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR WOOD.N)))
		(!R2 (?X_F PARK.N))
		(!R3 (?X_I STREET.N))
		(!R4 (?X_N MOTHER.N))
		(!R5 (?X_N (PERTAIN-TO ?X_R)))
		(!R6 (?X_Q YARD.N))
		(!R7 (?X_R AGENT.N))
	)
	(:STEPS
		(?X_K (?X_R (ANYWAY.ADV DO.V)))
		(?X_H (?X_R ((ADV-A (ON.P ?X_I)) PLAY.V)))
		(?X_E (?X_R ((ADV-A (IN.P ?X_F)) PLAY.V)))
		(?X_M (?X_R PLAY.9.V))
		(?X_B (?X_R ((ADV-A (IN.P ?X_C)) PLAY.V)))
		(?X_P (?X_R PLAY.10.V))
	)
)

; "The man's name was George."
; "He worked at the bank."
; "He liked to play golf."
; "He played golf every day."
; "George always wore a green shirt."
(EPI-SCHEMA ((?X_H (PLAY.V ?X_P)) ** ?E)
	(:ROLES
		(!R1 (?X_C BANK.N))
		(!R2 (?X_H MAN.N))
		(!R3 (?X_F AGENT.N))
		(!R4 (?X_G NAME.N))
		(!R5 (?X_G (PERTAIN-TO ?X_H)))
		(!R6 (?X_P GOLF.N))
		(!R7 (?X_M GOLF.N))
		(!R8 (?X_Q GREEN.A))
		(!R9 (?X_Q SHIRT.N))
		(!R10 ((KA (PLAY.V ?X_P)) ACTION.N))
		(!R11 (?X AGENT.N))
		(!R12 (NOT (?X_Q AGENT.N)))
	)
	(:STEPS
		(?X_E (?X_G (= ?X_F)))
		(?X_B (?X_H ((ADV-A (AT.P ?X_C)) WORK.V)))
		(?X_J (?X_H LIKE.15.V (KA (PLAY.V ?X_P))))
		(?E_1 (?X PLAY.4.V))
		(?X_L (?X_H PLAY.16.V))
		(?X_O (?X_H WEAR.17.V ?X_Q))
	)
)

; "Mike went to the bank."
; "He put some money in an envelope."
; "He left the envelope on his desk."
(EPI-SCHEMA ((?X_H (((ADV-A (IN.P ?X_I)) PUT.V) ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_I ENVELOPE.N))
		(!R2 (?X_B DESK.N))
		(!R3 (?X_B (PERTAIN-TO ?X_J)))
		(!R4 (?X_H BANK.N))
		(!R5 (?X_G MONEY.N))
		(!R6 (?X_H DESTINATION.N))
		(!R7 (?X_I LOCATION.N))
		(!R8 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_D (?X_J ((ADV-A (FROM.P ?L1)) GO.18.V) ?X_H))
		(?X_F (?X_J PUT.19.V ?X_G ?X_I))
		(?X_A (?X_J (((ADV-A (ON.P ?X_B)) LEAVE.V) ?X_I)))
	)
)

; "Bob likes to go fishing."
; "He fishes on the lake."
; "He catches fish."
; "He has a boat."
; "He takes his fishing gear with him."
(EPI-SCHEMA ((?X_O ((ADV-A (IN.P ?X_G)) FISH.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D FISH.N))
		(!R2 (?X_G LAKE.N))
		(!R3 (?X_L BOAT.N))
		(!R4 (?X_M FISHING.N))
		(!R5 (?X_N (PERTAIN-TO ?X_O)))
		(!R6 (?X_N ?X_M GEAR.N))
		(!R7 ((KA (GO.V (KA FISH.V))) ACTION.N))
		(!R8 (?X_O AGENT.N))
		(!R9 (?X_N ENTITY.N))
		(!R10 (?X_N SMALLER-THAN.N ?X_O))
		(!R11 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_I (?X_O LIKE.20.V (KA (GO.V (KA FISH.V)))))
		(?X_F (?X_O ((ADV-A (ON.P ?X_G)) FISH.V)))
		(?X_C (?X_O (CATCH.V ?X_D)))
		(?E_1 (?X_O ((ADV-A (FROM.P ?L1)) GO.7.V) ?L2))
		(?X_K (?X_O HAVE.21.V ?X_L))
		(?X_A (?X_O TAKE.22.V ?X_N ?L2))
	)
)

; "Alice was working at the bank."
; "She was counting money."
; "There were many customers at the bank."
(EPI-SCHEMA ((?X_E ((ADV-A (IN.P ?X_B)) WORK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_B BANK.N))
		(!R2 (?X_E AGENT.N))
		(!R3 (?X_F MONEY.N))
		(!R4 (?X_I MANY.A))
		(!R5 (?X_I (PLUR CUSTOMER.N)))
	)
	(:STEPS
		(?X_D (?X_E ((ADV-A (AT.P ?X_B)) WORK.V)))
		(?X_H (?X_E (COUNT.V ?X_F)))
		(?X_K (?X_A (BE.V ?X_I)))
	)
)

; "Kathy went to the bank."
; "She saw some money on the counter."
; "A teller gave Kathy money."
(EPI-SCHEMA ((?X_J ((ADV-A (TO.P ?X_H)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_H BANK.N))
		(!R2 (?X_E MONEY.N))
		(!R3 (?X_I TELLER.N))
		(!R4 (?X_K MONEY.N))
		(!R5 (?X_H DESTINATION.N))
		(!R6 (?X_I AGENT.N))
		(!R7 (?X_J AGENT.N))
		(!R8 (NOT (?X_K AGENT.N)))
	)
	(:STEPS
		(?X_B (?X_J ((ADV-A (FROM.P ?L1)) GO.18.V) ?X_H))
		(?X_D (?X_J SEE.23.V ?X_E))
		(?X_G (?X_I (GIVE.24.V ?X_J ?X_K)))
	)
)

; "Dan has a golf club."
; "He uses it to hit balls."
; "He plays golf on weekends."
; "He likes to go to the country club."
(EPI-SCHEMA ((?X_N ((ADV-A (WITH.P ?X_I)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_L GOLF.N))
		(!R2 (?X_L CLUB.N))
		(!R3 (?X_C (PLUR BALL.N)))
		(!R4 (?X_I (PLUR WEEKEND.N)))
		(!R5 (?X_H GOLF.N))
		(!R6 (?X_H (ON.P ?X_I)))
		(!R7 (?X_M COUNTRY.N))
		(!R8 (?X_M CLUB.N))
		(!R9 (?X_L OBJECT.N))
		(!R10 ((KA ((ADV-A (TO.P ?X_M)) GO.V)) ACTION.N))
		(!R11 (?X_M DESTINATION.N))
		(!R12 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_E (?X_N HAVE.25.V ?X_L))
		(?X_B (?X_N (((ADV-A (FOR.P (KA (HIT.V ?X_C)))) USE.V) ?X_L)))
		(?X_G (?X_N PLAY.26.V))
		(?X_K (?X_N LIKE.27.V (KA ((ADV-A (TO.P ?X_M)) GO.V))))
		(?E_1 (?X_N ((ADV-A (FROM.P ?L1)) GO.28.V) ?X_M))
	)
)

; "The man walked into the bank."
; "He asked for money."
; "He gave some money to the teller."
; "The teller gave him change."
(EPI-SCHEMA ((?Y (((ADV-A (TO.P ?Y)) GIVE.V) ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_I BANK.N))
		(!R2 (?X_K MONEY.N))
		(!R3 (?X_L TELLER.N))
		(!R4 (?X_J MAN.N))
		(!R5 (?X_M CHANGE.N))
		(!R6 (?X_I DESTINATION.N))
		(!R7 (NOT (?X_J = ?Y)))
		(!R8 (?A ACTION.N))
		(!R9 (?Y AGENT.N))
		(!R10 (NOT (?X_K AGENT.N)))
		(!R11 (?X_L AGENT.N))
		(!R12 (NOT (?X_M AGENT.N)))
	)
	(:STEPS
		(?X_B (?X_J ((ADV-A (FROM.P ?L1)) WALK.29.V) ?X_I))
		(?X_D (?X_J ASK.30.V ?Y ?A))
		(?X_F (?X_J (GIVE.31.V ?X_L ?X_K)))
		(?X_H (?X_L (GIVE.32.V ?X_J ?X_M)))
	)
)



; "A boy named John was born."
; "His parents loved him so much."
; "They gave him all they could."
; "John lived happily ever after."
(EPI-SCHEMA ((?X_F (LOVE.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_E BOY.N))
		(!R2 (?X_F (PLUR PARENT.N)))
		(!R3 (?X_E ((PASV NAME.V) ?X_H)))
		(!R4 (?X_F (PERTAIN-TO ?X_H)))
		(!R5 (?X_G AGENT.N))
		(!R6 (?X_H OBJECT.N))
		(!R7 (NOT (?X_H ACTION.N)))
	)
	(:STEPS
		(?X_B (?X_F LOVE.1.V ?X_H))
		(?X_D
   (?X_F
    (GIVE.2.V ?X_H (ALL.D (L X (AND (X (PLUR {REF}.N)) (X (?X_G CAN.MD))))))))
	)
)

; "Mary had a birthday party for her son."
; "Everyone came to the party."
; "Mary's friends sang happy birthday songs."
; "Mary played games with her son."
(EPI-SCHEMA ((?X_O ((ADV-A (TO.P ?X_N)) ((ADV-A (FROM.P ?X_N)) COME.V))) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR SONG.N)))
		(!R2 (?X_F BIRTHDAY.N))
		(!R3 (?X_F HAPPY.A))
		(!R4 (?X_I (PLUR FRIEND.N)))
		(!R5 (?X_I (PERTAIN-TO ?X_O)))
		(!R6 (?X_N PARTY.N))
		(!R7 (?X_L SON.N))
		(!R8 (?X_L (PERTAIN-TO ?X_O)))
		(!R9 (?X_M (PLUR GAME.N)))
		(!R10 ((EVERY.D PERSON.N) AGENT.N))
		(!R11 (?X_N DESTINATION.N))
		(!R12 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_H (?X_O (HAVE.V ?X_A)))
		(?X_K ((EVERY.D PERSON.N) ((ADV-A (FROM.P ?L1)) COME.3.V) ?X_N))
		(?X_D (?X_I (SING.V ?X_F ?X_E)))
		(?X_B (?X_O PLAY.4.V))
	)
)

; "Tommy's birthday is on April 15th."
; "He has a party for himself."
; "He invites his friends."
; "He gives them presents."
; "He eats cake."
(EPI-SCHEMA ((?X_G (HAVE.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_D PARTY.N))
		(!R2 (?X_D (FOR.P ?X_P)))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_H BIRTHDAY.N))
		(!R5 (?X_H (PERTAIN-TO ?X_P)))
		(!R6 (?X_N (PLUR PRESENT.N)))
		(!R7 (?X_M (PLUR FRIEND.N)))
		(!R8 (?X_M (PERTAIN-TO ?X_P)))
		(!R9 (?X_O CAKE.N))
		(!R10 (NOT (?X_P = ?X_M)))
		(!R11 (?A ACTION.N))
		(!R12 (NOT (?X_N AGENT.N)))
		(!R13 (?X_O FOOD.N))
		(!R14 (?X_P AGENT.N))
	)
	(:STEPS
		(?X_F (?X_H (ON.P (KE (?X_G 15TH.A)))))
		(?X_C (?X_P (HAVE.V ?X_D)))
		(?X_A (?X_P INVITE.5.V ?X_M ?A))
		(?X_J (?X_P (GIVE.6.V ?X_M ?X_N)))
		(?X_L (?X_P EAT.7.V ?X_O))
	)
)

; "Mary's birthday is on April 30th."
; "Her friends came to celebrate."
; "They sang happy birthday for Mary."
(EPI-SCHEMA ((?X_F ((ADV-A (TO.P ?X_K)) ((ADV-A (FOR.P ?X_G)) COME.V))) ** ?E)
	(:ROLES
		(!R1 (?X_H (PLUR FRIEND.N)))
		(!R2 (?X_F AGENT.N))
		(!R3 (?X_G BIRTHDAY.N))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_G (PERTAIN-TO ?X_I)))
		(!R6 (?X_H (PERTAIN-TO ?X_I)))
		(!R7 (?X_J (FOR.P ?X_I)))
		(!R8 (?X_K HAPPY.A))
		(!R9 (?X_J ?X_K BIRTHDAY.N))
		(!R10 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_G (ON.P (KE (?X_F 30TH.A)))))
		(?X_A (?X_H ((ADV-A (FROM.P ?L1)) COME.8.V) ?L2))
		(?X_C (?X_H (SING.V ?X_J)))
	)
)

; "Mary had a baby girl."
; "Her mother called the doctor."
; "The doctor came over."
; "The nurse put a band on Mary's wrist."
(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA.PR ?X_B ?X_M ?X_K ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_B DOCTOR.N))
		(!R2 (?X_E MOTHER.N))
		(!R3 (?X_M BABY.N))
		(!R4 (?X_M GIRL.N))
		(!R5 (?X_L AGENT.N))
		(!R6 (?X_E (PERTAIN-TO ?X_L)))
		(!R7 (?X_J NURSE.N))
		(!R8 (?X_K BAND.N))
		(!R9 (?X_N WRIST.N))
		(!R10 (?X_N (PERTAIN-TO ?X_L)))
		(!R11 (?X_M DESTINATION.N))
		(!R12 (?X_N LOCATION.N))
	)
	(:STEPS
		(?X_D (?X_L (HAVE.V ?X_M)))
		(?X_A (?X_E (CALL.V ?X_B)))
		(?X_G (?X_B ((ADV-A (FROM.P ?L1)) COME_OVER.9.V) ?X_M))
		(?X_I (?X_J PUT.10.V ?X_K ?X_N))
	)
)

; "Tom's birthday is on July 4th."
; "Tom likes eating cake."
; "Tom has many friends."
(EPI-SCHEMA ((?X_C (EAT.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_G CAKE.N))
		(!R2 (?X_F ((ADV-A (ON.P ?X_C)) 4TH.A)))
		(!R3 (?X_F BIRTHDAY.N))
		(!R4 (?X_C AGENT.N))
		(!R5 (?X_I MANY.A))
		(!R6 (?X_I (PLUR FRIEND.N)))
		(!R7 (?X_F (PERTAIN-TO ?X_H)))
		(!R8 ((KA (EAT.V ?X_G)) ACTION.N))
		(!R9 (?X_G FOOD.N))
		(!R10 (?X_H AGENT.N))
		(!R11 (?X_I OBJECT.N))
	)
	(:STEPS
		(?X_B (?X_H LIKE.11.V (KA (EAT.V ?X_G))))
		(?E_1 (?X_H EAT.12.V ?X_G))
		(?X_E (?X_H HAVE.13.V ?X_I))
	)
)

; "'Happy Birthday!' said a friend."
; "'Thank you,' said John."
; "'What's your name?' asked the friend."
; "'John,' replied John."
; "'That's a funny name for a boy,' commented the friend."
; "'My mother chose it,' explained John."
(EPI-SCHEMA ((?X_C ((ADV-A (TO.P ?X_C)) REPLY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_A (PERTAIN-TO ?X_C)))
		(!R3 (?X_B (PERTAIN-TO ?X_C)))
	)
	(:STEPS
		(?X_E (?X_C (REPLY.V ?X_C)))
	)
)

; "Linda's birthday is on Thursday."
; "She has a party for herself."
; "She gets presents from friends."
; "She likes getting presents."
(EPI-SCHEMA ((?X_O (HAVE.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR PRESENT.N)))
		(!R2 (?X_D (PLUR FRIEND.N)))
		(!R3 (?X_G PARTY.N))
		(!R4 (?X_G (FOR.P ?X_O)))
		(!R5 (?X_J AGENT.N))
		(!R6 (?X_K BIRTHDAY.N))
		(!R7 (?X_K (PERTAIN-TO ?X_O)))
		(!R8 (?X_N (PLUR PRESENT.N)))
		(!R9 ((KA (GET.V ?X_N)) ACTION.N))
		(!R10 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_I (?X_K ((ADV-A (ON.P ?X_J)) BE.V)))
		(?X_F (?X_O (HAVE.V ?X_G)))
		(?X_B (?X_O (((ADV-A (FROM.P ?X_D)) GET.V) ?X_C)))
		(?X_M (?X_O LIKE.14.V (KA (GET.V ?X_N))))
	)
)

; "A baby girl was born."
; "Her mother loved her."
; "Her mother kissed her baby."
; "Her father smiled at her baby."
(EPI-SCHEMA ((?X_G (LOVE.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_I GIRL.N))
		(!R2 (?X_I BABY.N))
		(!R3 (?X_E FATHER.N))
		(!R4 (?X_D BABY.N))
		(!R5 (?X_D (PERTAIN-TO ?X_I)))
		(!R6 (?X_G MOTHER.N))
		(!R7 (?X_F AGENT.N))
		(!R8 (?X_I (PERTAIN-TO ?X_F)))
		(!R9 (?X_E (PERTAIN-TO ?X_F)))
		(!R10 (?X_H MOTHER.N))
		(!R11 (?X_H (PERTAIN-TO ?X_I)))
		(!R12 (?X_G (PERTAIN-TO ?X_H)))
		(!R13 (NOT (?X_I ACTION.N)))
		(!R14 (?X_I OBJECT.N))
	)
	(:STEPS
		(?X_A (?X_H LOVE.15.V ?X_I))
		(?X_B (?X_G (KISS.V ?X_D)))
		(?X_C (?X_E ((ADV-A (AT.P ?X_I)) SMILE.V)))
	)
)

; "Mary was walking down the street."
; "Her dog followed behind her."
; "One day Mary saw something that made her stop."
; "She walked around the block."
(EPI-SCHEMA ((?X_J ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F THING.N))
		(!R2 (?X_G DOG.N))
		(!R3 (?X_G (PERTAIN-TO ?X_J)))
		(!R4 (?X_J AGENT.N))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_C (?X_J ((ADV-A (FROM.P ?L1)) WALK.16.V) ?L2))
		(?X_A (?X_G FOLLOW.17.V ?X_J))
		(?X_E (?X_J SEE.18.V ?X_F))
		(?X_I (?X_J ((ADV-A (FROM.P ?L1)) WALK.16.V) ?L2))
	)
)

; "Mary walked along the sidewalk."
; "Mary's dog followed her."
; "Mary stopped to look at some flowers."
; "Mary looked for someone who could help her."
(EPI-SCHEMA ((?X_K ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR FLOWER.N)))
		(!R2 (?X_H DOG.N))
		(!R3 (?X_H (PERTAIN-TO ?X_K)))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_K AGENT.N))
		(!R6 (?X_L ENTITY.N))
	)
	(:STEPS
		(?X_E (?X_K ((ADV-A (FROM.P ?L1)) WALK.16.V) ?L2))
		(?X_G (?X_H FOLLOW.19.V ?X_K))
		(?X_B (?X_K ((ADV-A (FOR.P (KA ((ADV-A (AT.P ?X_C)) LOOK.V)))) STOP.V)))
		(?X_J (?X_K ((ADV-A (FOR.P ?X_L)) LOOK.20.V)))
	)
)

; "Mary walked up the hill."
; "She walked fast."
; "She walked slowly."
; "She walked on the sidewalk."
; "She walked through the park."
; "Mary walked to the store."
(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA.PR ?X_M ?L2 ?X_O)) ** ?E)
	(:ROLES
		(!R1 (?X_M HILL.N))
		(!R2 (?X_O STORE.N))
		(!R3 (?X_M DESTINATION.N))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_N AGENT.N))
		(!R6 (?X_O DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_N ((ADV-A (FROM.P ?L1)) WALK_UP.21.V) ?X_M))
		(?X_D (?X_N ((ADV-A (FROM.P ?L1)) WALK.16.V) ?L2))
		(?X_F (?X_N ((ADV-A (FROM.P ?L1)) WALK.16.V) ?L2))
		(?X_H (?X_N ((ADV-A (FROM.P ?L1)) WALK.16.V) ?L2))
		(?X_J (?X_N ((ADV-A (FROM.P ?L1)) WALK.16.V) ?L2))
		(?X_L (?X_N ((ADV-A (FROM.P ?L1)) WALK.22.V) ?X_O))
	)
)

; "Bob walked on the sidewalk."
; "He walked across the street."
; "He walked through a park."
; "He walked into a building."
(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA.PR ?L2 ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_J SIDEWALK.N))
		(!R2 (?L2 DESTINATION.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_J DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_I ((ADV-A (FROM.P ?L1)) WALK.16.V) ?L2))
		(?X_D (?X_I ((ADV-A (FROM.P ?L1)) WALK.16.V) ?L2))
		(?X_F (?X_I ((ADV-A (FROM.P ?L1)) WALK.16.V) ?L2))
		(?X_H (?X_I ((ADV-A (FROM.P ?L1)) WALK.22.V) ?X_J))
	)
)

; "A boy was walking home from school."
; "His dog was following him."
; "He saw a rabbit on the side of the road."
; "He picked up the rabbit."
; "He carried the rabbit home."
(EPI-SCHEMA ((?X_L (((ADV-A (FROM.P ?X_K)) PICK_UP.V) ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_M RABBIT.N))
		(!R2 (?X_M HOME.N))
		(!R3 (?X_N BOY.N))
		(!R4 (?X_K SCHOOL.N))
		(!R5 (?X_L HOME.N))
		(!R6 (?X_L (PERTAIN-TO ?X_N)))
		(!R7 (?X_H DOG.N))
		(!R8 (?X_H (PERTAIN-TO ?X_N)))
		(!R9 (?X_K LOCATION.N))
		(!R10 (?X_L DESTINATION.N))
		(!R11 (NOT (?X_K = ?X_L)))
		(!R12 (?X_M SMALLER-THAN.N ?X_N))
		(!R13 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_N ((ADV-A (FROM.P ?X_K)) WALK.25.V) ?X_L))
		(?X_A (?X_H FOLLOW.26.V ?X_N))
		(?X_G (?X_N SEE.27.V ?X_M))
		(?X_C (?X_N (PICK_UP.V ?X_M)))
		(?X_J (?X_N CARRY.28.V ?X_M ?L2))
	)
)

; "Mary walked to the store."
; "She carried a basket full of groceries."
; "She stopped for a while."
; "She looked around."
; "She found what she wanted."
(EPI-SCHEMA ((?X_N ((ADV-A (INTO.P ?X_N)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F WHILE.N))
		(!R2 (?X_N STORE.N))
		(!R3 (?X_I (PLUR GROCERY.N)))
		(!R4 (?X_O BASKET.N))
		(!R5 (?X_O ((ADV-A (OF.P ?X_I)) FULL.A)))
		(!R6 (?X_N DESTINATION.N))
		(!R7 (?X_P AGENT.N))
		(!R8 (?X_O SMALLER-THAN.N ?X_P))
		(!R9 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_H (?X_P ((ADV-A (FROM.P ?L1)) WALK.22.V) ?X_N))
		(?X_K (?X_P CARRY.28.V ?X_O ?L2))
		(?X_E (?X_P ((ADV-A (FOR.P ?X_F)) STOP.V)))
		(?X_C (?X_P (AROUND.ADV LOOK.V)))
		(?X_M (?X_P FIND.29.V (ANS-TO (?X_P (WANT.V ?X_A)))))
	)
)

; "Mary and her dog were on a walk."
; "They walked along the sidewalk."
; "There was a tree in front of them."
; "Mary stopped to look at the tree."
; "She looked at the leaves."
(EPI-SCHEMA ((?X_M ((ADV-A (PAST.P ?X_K)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR LEAF.N)))
		(!R2 (?X_K TREE.N))
		(!R3 (?X_J WALK.N))
		(!R4 (?X_L DOG.N))
		(!R5 (?X_K (IN_FRONT_OF.P ?X_L)))
		(!R6 (?X_M AGENT.N))
		(!R7 (?X_L (PERTAIN-TO ?X_M)))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_B ((SET-OF ?X_M ?X_L) ((ADV-A (ON.P ?X_J)) BE.V)))
		(?X_O (?X_L ((ADV-A (FROM.P ?L1)) WALK.16.V) ?L2))
		(?X_I (?X_A (BE.V ?X_K)))
		(?X_G (?X_M ((ADV-A (FOR.P (KA ((ADV-A (AT.P ?X_K)) LOOK.V)))) STOP.V)))
		(?X_D (?X_M ((ADV-A (AT.P ?X_E)) LOOK.V)))
	)
)



; "Sammy loves cats."
; "His cat died."
; "He felt sad about this."
; "He wanted another cat."
; "He bought a kitten."
(EPI-SCHEMA ((?X_M (LOVE.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_E KITTEN.N))
		(!R2 (?X_J SAD.A))
		(!R3 (?X_J (ABOUT.P ?X_K)))
		(!R4 (?X_L CAT.N))
		(!R5 (?X_L (PERTAIN-TO ?X_M)))
		(!R6 (?X_N (PLUR CAT.N)))
		(!R7 (?X_M AGENT.N))
		(!R8 (NOT (?X_N ACTION.N)))
	)
	(:STEPS
		(?X_A (?X_L DIE.V))
		(?X_B (?X_M LOVE.1.V ?X_N))
		(?X_I (?X_M (FEEL.V ?X_J)))
		(?X_G (?X_M (WANT.V (ANOTHER.D CAT.N))))
		(?X_D (?X_M (BUY.V ?X_E)))
	)
)

; "Tom's cat ate some food."
; "Tom said that his cat looked hungry."
; "Tom's cat ate some more food."
; "Tom's cat was happy."
(EPI-SCHEMA ((?X_C (EAT.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_B HAPPY.A))
		(!R2 (?X_B CAT.N))
		(!R3 (?X_C AGENT.N))
		(!R4 (?X_B (PERTAIN-TO ?X_C)))
		(!R5 (?X_I MORE.A))
		(!R6 (?X_H FOOD.N))
		(!R7 (?X_I FOOD.N))
	)
	(:STEPS
		(?X_E (?X_B EAT.2.V ?X_H))
		(?X_A (?X_C (SAY.V (THAT (?X_B (LOOK.V HUNGRY.A))))))
		(?X_G (?X_B EAT.2.V ?X_I))
	)
)

; "Tom's dog is named Rover."
; "Rover likes to play."
; "He has four legs."
; "Rover doesn't have fur."
(EPI-SCHEMA ((?X_H (LIKE.V (KA (HAVE.V (SET-OF ?X_H ?X_L))))) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_H DOG.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_H (PERTAIN-TO ?X_I)))
		(!R5 (?X_L FUR.N))
		(!R6 ((KA PLAY.V) ACTION.N))
		(!R7 ((FOUR.D (PLUR LEG.N)) OBJECT.N))
		(!R8 (?X_L OBJECT.N))
	)
	(:STEPS
		(?X_B (?X_H ((PASV NAME.V) ?X_C)))
		(?X_E (?X_H LIKE.3.V (KA PLAY.V)))
		(?X_G (?X_H HAVE.4.V (FOUR.D (PLUR LEG.N))))
		(?X_K (?X_H HAVE.5.V ?X_L))
	)
)

; "Molly likes to play with balls."
; "She plays with balls all the time."
; "She has lots of balls."
; "She plays with them all the time."
(EPI-SCHEMA ((?X_G (LIKE.V (KA ((ADV-A (WITH.P ?X_F)) PLAY.V)))) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR BALL.N)))
		(!R2 (?X_E (PLUR BALL.N)))
		(!R3 (?X_H (PLUR LOT.N)))
		(!R4 (?X_H (OF.P ?X_E)))
		(!R5 ((KA ((ADV-A (WITH.P ?X_F)) PLAY.V)) ACTION.N))
		(!R6 (?Y ENTITY.N))
		(!R7 (?X_G AGENT.N))
		(!R8 (?X_H OBJECT.N))
	)
	(:STEPS
		(?X_B (?X_G LIKE.6.V (KA ((ADV-A (WITH.P ?X_F)) PLAY.V))))
		(?E_1 (?X_G PLAY.7.V ?Y))
		(?X_D (?X_G HAVE.8.V ?X_H))
	)
)

; "'Sammy's cat is dead,' said Jenny."
; "'I'm sorry,' said Sammy."
; "'Maybe I'll have another cat.'"
; "'That would be good,' said Jenny."
(EPI-SCHEMA ((?X_A (COMPOSITE-SCHEMA.PR (ANOTHER.D CAT.N))) ** ?E)
	(:ROLES
		(!R1 (?X_A AGENT.N))
	)
	(:STEPS
		(E127.SK (?X_A ((MAYBE.ADV HAVE.V) (ANOTHER.D CAT.N))))
	)
)

; "Tom's cat was named Rover."
; "Rover liked to play."
; "Rover liked to chase mice."
; "Rover ate food."
; "Rover slept on Tom's bed."
; "Rover ran away."
(EPI-SCHEMA ((?X_E (CHASE.V ?X_Q)) ** ?E)
	(:ROLES
		(!R1 (?X_M BED.N))
		(!R2 (?X_E AGENT.N))
		(!R3 (?X_L CAT.N))
		(!R4 (?X_Q (PLUR MOUSE.N)))
		(!R5 (?X_N AGENT.N))
		(!R6 (?X_L (PERTAIN-TO ?X_N)))
		(!R7 (?X_M (PERTAIN-TO ?X_N)))
		(!R8 ((KA PLAY.V) ACTION.N))
		(!R9 ((KA (CHASE.V ?X_Q)) ACTION.N))
		(!R10 (?X_R FOOD.N))
		(!R11 (?X_R LOCATION.N))
		(!R12 (NOT (?X_R = ?L2)))
		(!R13 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_D (?X_L ((PASV NAME.V) ?X_E)))
		(?X_G (?X_L LIKE.9.V (KA PLAY.V)))
		(?X_I (?X_L LIKE.10.V (KA (CHASE.V ?X_Q))))
		(?E_1 (?X_L CHASE.11.V ?X_Q))
		(?X_K (?X_L EAT.2.V ?X_R))
		(?X_B (?X_L ((ADV-A (ON.P ?X_M)) SLEEP.V)))
		(?X_P (?X_L ((ADV-A (FROM.P ?X_R)) RUN_AWAY.12.V) ?L2))
	)
)

; "Sammy's cat died."
; "He felt sad about that."
; "He missed his cat."
; "He wanted a new cat."
; "He bought a kitten."
(EPI-SCHEMA ((?X_L (MISS.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_D SAD.A))
		(!R2 (?X_D (ABOUT.P ?X_E)))
		(!R3 (?X_K CAT.N))
		(!R4 (?X_H NEW.A))
		(!R5 (?X_H CAT.N))
		(!R6 (?X_L AGENT.N))
		(!R7 (?X_K (PERTAIN-TO ?X_L)))
		(!R8 (?X_M KITTEN.N))
	)
	(:STEPS
		(?X_C (?X_K DIE.V))
		(?X_G (?X_L (FEEL.V ?X_D)))
		(?X_A (?X_L (MISS.V ?X_K)))
		(?X_J (?X_L (WANT.V ?X_H)))
		(?X_O (?X_L (BUY.V ?X_M)))
	)
)

; "A boy named Sammy played with his cat."
; "His cat liked to play."
; "Sammy's cat ran away."
; "Sammy looked for him."
; "He found his cat."
(EPI-SCHEMA ((?X_D ((ADV-A (WITH.P ?X_D)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E CAT.N))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_E (PERTAIN-TO ?X_D)))
		(!R4 (?X_F BOY.N))
		(!R5 (?X_E (PERTAIN-TO ?X_F)))
		(!R6 ((KA PLAY.V) ACTION.N))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_F (NAME.V (THT (?X_D ((ADV-A (WITH.P ?X_E)) PLAY.V))))))
		(?X_B (?X_E LIKE.13.V (KA PLAY.V)))
		(?E_1 (?X_F PLAY.14.V))
		(?X_H (?X_E ((ADV-A (FROM.P ?L1)) RUN_AWAY.15.V) ?L2))
		(?X_J (?X_F ((ADV-A (FOR.P ?X_E)) LOOK.16.V)))
		(?X_C (?X_F FIND.17.V ?X_E))
	)
)

; "Peter liked cats."
; "He played with a cat."
; "He kept a cat as a pet."
; "He gave the cat food."
; "He put the cat on the bed."
(EPI-SCHEMA ((?X_P (LIKE.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C CAT.N))
		(!R2 (?X_O PET.N))
		(!R3 (?X_F CAT.N))
		(!R4 (?X_M (PLUR CAT.N)))
		(!R5 (?X_N FOOD.N))
		(!R6 (NOT (?X_M ACTION.N)))
		(!R7 (NOT (?X_N AGENT.N)))
		(!R8 (?X_O LOCATION.N))
		(!R9 (?X_P AGENT.N))
	)
	(:STEPS
		(?X_H (?X_P LIKE.18.V ?X_M))
		(?X_E (?X_P ((ADV-A (WITH.P ?X_F)) PLAY.V)))
		(?X_B (?X_P (((ADV-A (AS.P ?X_O)) KEEP.V) ?X_C)))
		(?X_J (?X_P (GIVE.19.V ?X_C ?X_N)))
		(?X_L (?X_P PUT.20.V ?X_C ?X_O))
	)
)

; "Mary was sick."
; "Her mom took care of her."
; "Mary didn't want to be there."
; "She missed going to school."
; "(END OF STORY)"
(EPI-SCHEMA ((?X_G ((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_G)) GO.V)))) MISS.V)) **
             ?E)
	(:ROLES
		(!R1 (?X_E MOM.N))
		(!R2 (?X_B CARE.N))
		(!R3 (?X_F SICK.A))
		(!R4 (?X_F AGENT.N))
		(!R5 (?X_E (PERTAIN-TO ?X_F)))
		(!R6 (?X_G SCHOOL.N))
	)
	(:STEPS
		(?X_A (?X_E (((ADV-A (OF.P ?X_F)) TAKE.V) ?X_B)))
		(?X_D (NOT (?X_F (WANT.V (KA (THERE.ADV BE.V))))))
		(?X_I (?X_F ((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_G)) GO.V)))) MISS.V)))
	)
)

; "Mary's mom took care of Mary."
; "Mary didn't want to go to school."
; "She missed going to school."
(EPI-SCHEMA ((?X_J ((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_C)) GO.V)))) MISS.V)) **
             ?E)
	(:ROLES
		(!R1 (?X_C SCHOOL.N))
		(!R2 (?X_K SCHOOL.N))
		(!R3 (?X_H CARE.N))
		(!R4 (?X_I MOM.N))
		(!R5 (?X_I (PERTAIN-TO ?X_J)))
		(!R6 (?X_J AGENT.N))
		(!R7 (?X_K DESTINATION.N))
	)
	(:STEPS
		(?X_G (?X_I (((ADV-A (OF.P ?X_J)) TAKE.V) ?X_H)))
		(?X_E (NOT (?X_J (WANT.V (KA ((ADV-A (TO.P ?X_K)) GO.V))))))
		(?X_B (?X_J ((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_C)) GO.V)))) MISS.V)))
		(?E_1 (?X_J ((ADV-A (FROM.P ?L1)) GO.21.V) ?X_K))
	)
)

; "Tom's mother is sick."
; "His father takes care of him."
; "Tom misses seeing his friends."
; "Tom wants to go back to school."
(EPI-SCHEMA ((?X_I (MISS.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_J SCHOOL.N))
		(!R2 (?X_F (PLUR FRIEND.N)))
		(!R3 (?X_E CARE.N))
		(!R4 (?X_F (PERTAIN-TO ?X_I)))
		(!R5 (?X_G FATHER.N))
		(!R6 (?X_G (PERTAIN-TO ?X_I)))
		(!R7 (?X_H SICK.A))
		(!R8 (?X_H MOTHER.N))
		(!R9 (?X_H (PERTAIN-TO ?X_I)))
		(!R10 (?X_I AGENT.N))
		(!R11 (?X_J DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_G (((ADV-A (OF.P ?X_I)) TAKE.V) ?X_E)))
		(?X_B (?X_I ((ADV-A (FOR.P (KA (SEE.V ?X_F)))) MISS.V)))
		(?X_D (?X_I (WANT.V (KA ((ADV-A (TO.P ?X_J)) (BACK.ADV GO.V))))))
		(?E_1 (?X_I ((ADV-A (FROM.P ?L1)) GO.21.V) ?X_J))
	)
)

; "Tommy's friend is sick."
; "His mother takes care of him."
; "Tommy doesn't have any friends."
(EPI-SCHEMA ((?X_C (((ADV-A (OF.P ?X_C)) TAKE.V) ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B CARE.N))
		(!R2 (?X_F SICK.A))
		(!R3 (?X_F FRIEND.N))
		(!R4 (?X_C MOTHER.N))
		(!R5 (?X_C (PERTAIN-TO ?X_F)))
		(!R6 (?X_F (PERTAIN-TO ?X_G)))
		(!R7 (?X_G AGENT.N))
		(!R8 ((ANY.D (PLUR FRIEND.N)) OBJECT.N))
	)
	(:STEPS
		(?X_A (?X_C (((ADV-A (OF.P ?X_F)) TAKE.V) ?X_B)))
		(?X_E (?X_G HAVE.22.V (ANY.D (PLUR FRIEND.N))))
	)
)

; "Kate's mother has cancer."
; "She is not feeling well."
; "She needs help."
(EPI-SCHEMA ((?X_F (HAVE.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A CANCER.N))
		(!R2 (?X_F MOTHER.N))
		(!R3 (?X_F (PERTAIN-TO ?X_G)))
		(!R4 (?X_H HELP.N))
	)
	(:STEPS
		(?X_C (?X_F (HAVE.V ?X_A)))
		(?X_E (NOT (?X_F ((ADV-A (FOR.P (KA (WELL.ADV FEEL.V)))) BE.V))))
		(?X_J (?X_F (NEED.V ?X_H)))
	)
)

; "Mary's mom took care of Mary."
; "Mary didn't want to be there."
; "Mary missed going to school."
(EPI-SCHEMA ((?X_G (MISS.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_F MOM.N))
		(!R2 (?X_A CARE.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_F (PERTAIN-TO ?X_G)))
		(!R5 (?X_H SCHOOL.N))
	)
	(:STEPS
		(?X_C (?X_F (((ADV-A (OF.P ?X_G)) TAKE.V) ?X_A)))
		(?X_E (NOT (?X_G (WANT.V (KA (THERE.ADV BE.V))))))
		(?X_J (?X_G ((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_H)) GO.V)))) MISS.V)))
	)
)



; "Mary went to the store yesterday."
; "She bought some milk."
; "She put it into the fridge."
; "Later that day, Mary came back with ice cream."
(EPI-SCHEMA ((?X_H ((ADV-A (TO.P ?X_G)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D MILK.N))
		(!R2 (?X_G STORE.N))
		(!R3 (?X_I FRIDGE.N))
		(!R4 (?X_G DESTINATION.N))
		(!R5 (?X_H AGENT.N))
		(!R6 (?X_I LOCATION.N))
	)
	(:STEPS
		(?X_A (?X_H ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_G))
		(?X_C (?X_H (BUY.V ?X_D)))
		(?X_F (?X_H PUT.2.V ?X_D ?X_I))
	)
)

; "John likes ice cream."
; "He has an ice cream maker."
; "His family loves ice cream."
; "He makes lots of ice cream for them."
(EPI-SCHEMA ((?X_L (LIKE.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR LOT.N)))
		(!R2 (?X_D (OF.P ?X_E)))
		(!R3 (?X_M FAMILY.N))
		(!R4 (?X_M (PERTAIN-TO ?X_L)))
		(!R5 (?X_K ICE.N))
		(!R6 (?X_K CREAM.N))
		(!R7 (?X_J ICE.N))
		(!R8 (?X_J CREAM.N))
		(!R9 (?X_J MAKER.N))
		(!R10 (?X_N ICE.N))
		(!R11 (?X_N CREAM.N))
		(!R12 (NOT (?X_K ACTION.N)))
		(!R13 (NOT (?X_K AGENT.N)))
		(!R14 (?X_L AGENT.N))
		(!R15 (?X_M AGENT.N))
		(!R16 (NOT (?X_N ACTION.N)))
		(!R17 (NOT (?X_N AGENT.N)))
	)
	(:STEPS
		(?X_G (?X_L LIKE.3.V ?X_K))
		(?X_I (?X_L HAVE.4.V ?X_J))
		(?X_A (?X_M LOVE.5.V ?X_N))
		(?X_C (?X_L (((ADV-A (FOR.P ?X_M)) MAKE.V) ?X_D)))
	)
)

; "Alice put some groceries into the refrigerator."
; "She closed the door."
; "The food stayed cool for a while."
; "Then it started to get warm again."
(EPI-SCHEMA ((?X_K (((ADV-A (IN.P ?X_L)) PUT.V) ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_C ((ADV-A (FOR.P ?X_D)) COOL.A)))
		(!R2 (?X_E (PLUR GROCERY.N)))
		(!R3 (?X_E FOOD.N))
		(!R4 (?X_H DOOR.N))
		(!R5 (?X_L REFRIGERATOR.N))
		(!R6 (?X_K AGENT.N))
		(!R7 (?X_L LOCATION.N))
	)
	(:STEPS
		(?X_J (?X_K PUT.6.V ?X_E ?X_L))
		(?X_G (?X_K (CLOSE.V ?X_H)))
		(?X_B (?X_E (STAY.V ?X_C)))
	)
)

; "Mary went shopping for groceries."
; "She bought some milk."
; "She put it into the refrigerator."
; "Later that day, she came back with ice cream."
(EPI-SCHEMA ((?X_H (BUY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C MILK.N))
		(!R2 (?X_I REFRIGERATOR.N))
		(!R3 (?L2 DESTINATION.N))
		(!R4 (?X_H AGENT.N))
		(!R5 (?X_I LOCATION.N))
	)
	(:STEPS
		(?X_E (?X_H ((ADV-A (FROM.P ?L1)) GO.7.V) ?L2))
		(?X_B (?X_H (BUY.V ?X_C)))
		(?X_G (?X_H PUT.8.V ?X_C ?X_I))
	)
)

; "Mary loves ice cream."
; "She likes strawberry ice cream."
; "She eats ice cream for dessert."
; "Ice cream is good."
(EPI-SCHEMA ((?X_J
              (COMPOSITE-SCHEMA.PR ?X_G (KE (AND (?X_H ICE.N) (?X_H CREAM.N)))
               ?X_I))
             ** ?E)
	(:ROLES
		(!R1 (?X_G ICE.N))
		(!R2 (?X_G CREAM.N))
		(!R3 (?X_H AGENT.N))
		(!R4 (?X_I ICE.N))
		(!R5 (?X_I CREAM.N))
		(!R6 (NOT (?X_G ACTION.N)))
		(!R7 (NOT (?X_G AGENT.N)))
		(!R8 ((KE (AND (?X_H ICE.N) (?X_H CREAM.N))) ACTION.N))
		(!R9 (?X_I FOOD.N))
		(!R10 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_B (?X_J LOVE.9.V ?X_G))
		(?X_D (?X_J LIKE.10.V (KE (AND (?X_H ICE.N) (?X_H CREAM.N)))))
		(?X_F (?X_J EAT.11.V ?X_I))
	)
)

; "Kate loves ice cream."
; "She eats ice cream everyday."
; "It's not healthy."
; "It makes you fat."
(EPI-SCHEMA ((?X_C (EAT.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_D ICE.N))
		(!R3 (?X_D CREAM.N))
		(!R4 (NOT (?X_D HEALTHY.A)))
		(!R5 (?X_I ICE.N))
		(!R6 (?X_I CREAM.N))
		(!R7 (NOT (?X_I ACTION.N)))
		(!R8 (NOT (?X_I AGENT.N)))
		(!R9 (?X_J AGENT.N))
		(!R10 (?F FOOD.N))
	)
	(:STEPS
		(?X_F (?X_J LOVE.12.V ?X_I))
		(?X_H (?X_J EAT.13.V ?F))
		(?X_B (?X_D (MAKE.V (KE (?X_C FAT.A)))))
	)
)

; "Bobby ate ice cream for breakfast."
; "He liked it so much."
; "He ate lots of ice cream."
; "He ate too much ice cream."
(EPI-SCHEMA ((?X_M (EAT.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_J ICE.N))
		(!R2 (?X_J CREAM.N))
		(!R3 (?X_E ICE.N))
		(!R4 (?X_E CREAM.N))
		(!R5 (?X_K (PLUR LOT.N)))
		(!R6 (?X_K (OF.P ?X_E)))
		(!R7 (?X_L (TOO.ADV MUCH.A)))
		(!R8 (?X_L ICE.N))
		(!R9 (?X_L CREAM.N))
		(!R10 (?X_J FOOD.N))
		(!R11 (NOT (?X_J ACTION.N)))
		(!R12 (NOT (?X_J AGENT.N)))
		(!R13 (?X_K FOOD.N))
		(!R14 (?X_L FOOD.N))
		(!R15 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_B (?X_M EAT.11.V ?X_J))
		(?X_D (?X_M LIKE.14.V ?X_J))
		(?X_G (?X_M EAT.11.V ?X_K))
		(?X_I (?X_M EAT.11.V ?X_L))
	)
)

; "Mark liked ice cream."
; "His favorite flavor was vanilla."
; "He ate ice cream every day."
; "He had an ice cream party once."
(EPI-SCHEMA ((?X_O (EAT.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_B VANILLA.N))
		(!R2 (?X_L ICE.N))
		(!R3 (?X_L CREAM.N))
		(!R4 (?X_M ICE.N))
		(!R5 (?X_M CREAM.N))
		(!R6 (?X_G FAVORITE.A))
		(!R7 (?X_H ?X_G FLAVOR.N))
		(!R8 (?X_N ICE.N))
		(!R9 (?X_N CREAM.N))
		(!R10 (?X_H (PERTAIN-TO ?X_O)))
		(!R11 (?X_K AGENT.N))
		(!R12 (NOT (?X_L ACTION.N)))
		(!R13 (NOT (?X_L AGENT.N)))
		(!R14 (?X_M FOOD.N))
		(!R15 (?X_N FOOD.N))
		(!R16 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_D (?X_K LIKE.15.V ?X_L))
		(?X_A (?X_H (= ?X_B)))
		(?X_F (?X_O EAT.11.V ?X_M))
		(?X_J (?X_O HAVE.16.V ?X_N))
	)
)

; "Alice's mom gave Alice some milk."
; "Alice drank it."
; "She liked it."
(EPI-SCHEMA ((?X_I (EAT.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_H MILK.N))
		(!R2 (?X_G MOM.N))
		(!R3 (?X_G (PERTAIN-TO ?X_I)))
		(!R4 (?X_G AGENT.N))
		(!R5 (NOT (?X_H AGENT.N)))
		(!R6 (?X_J OBJECT.N))
		(!R7 (?X_I AGENT.N))
		(!R8 (NOT (?X_J ACTION.N)))
		(!R9 (NOT (?X_J AGENT.N)))
	)
	(:STEPS
		(?X_B (?X_G (GIVE.17.V ?X_I ?X_H)))
		(?X_D (?X_I DRANK.18.V ?X_H))
		(?X_F (?X_I LIKE.19.V ?X_J))
	)
)

; "Mary bought some ice cream."
; "She ate it all by herself."
; "She ate too much ice cream."
(EPI-SCHEMA ((?X_I (EAT.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_D (TOO.ADV MUCH.A)))
		(!R2 (?X_D ICE.N))
		(!R3 (?X_D CREAM.N))
		(!R4 (?X_E FEMALE.A))
		(!R5 (?X_E AGENT.N))
		(!R6 (?X_H ICE.N))
		(!R7 (?X_H CREAM.N))
		(!R8 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_G (?X_I (BUY.V ?X_H)))
		(?X_K (?X_I EAT.20.V (ALL.D ({OF}.P ?X_A))))
		(?X_C (?X_E (EAT.V ?X_D)))
	)
)

; "I met a girl named Mary."
; "Mary lived next door."
; "Mary and I became friends."
; "One day we were walking together."
; "Suddenly, a stranger grabbed us both."
(EPI-SCHEMA ((?X_I (MEET.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR FRIEND.N)))
		(!R2 (?X_J GIRL.N))
		(!R3 (?X_J ((PASV NAME.V) ?X_I)))
		(!R4 (?X_F AGENT.N))
		(!R5 (?X_I AGENT.N))
		(!R6 (?X_J LOCATION.N))
	)
	(:STEPS
		(?X_E (?X_F (MEET.V ?X_J)))
		(?X_H (?X_I LIVE.21.V ?X_J))
		(?X_B ((SET-OF ?X_I ?X_F) (BECOME.V (K (= ?X_C)))))
	)
)

; "A man walked down the street."
; "He saw a woman."
; "He asked if she was married."
; "She said yes."
; "He asked if they knew each other."
; "She said no."
(EPI-SCHEMA ((?X_N ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G (IF.P (KE (?X_H (KNOW.V (EACH.D OTHER.A)))))))
		(!R2 (?X_N WOMAN.N))
		(!R3 (?X_M (IF.P (KE (?X_N (PASV MARRY.V))))))
		(!R4 (?X_O MAN.N))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_Q (?X_O ((ADV-A (FROM.P ?L1)) WALK.22.V) ?L2))
		(?X_S (?X_O SEE.23.V ?X_N))
		(?X_L (?X_O (ASK.V ?X_M)))
		(?X_J (?X_N (SAY.V ?X_A)))
		(?X_F (?X_O (ASK.V ?X_G)))
		(?X_D (?X_N (SAY.V ?X_B)))
	)
)

; "A boy named Tom walked down the street."
; "His friend named Bob came along too."
; "Tom saw an old woman on the sidewalk."
; "Tom asked if she was okay."
; "She said she was fine."
(EPI-SCHEMA ((?X_M ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G OLD.A))
		(!R2 (?X_G WOMAN.N))
		(!R3 (?X_F (IF.P (KE (?X_G OKAY.A)))))
		(!R4 (?X_M AGENT.N))
		(!R5 (?X_H FRIEND.N))
		(!R6 (?X_H ((PASV NAME.V) ?X_I)))
		(!R7 (?X_H (PERTAIN-TO ?X_I)))
		(!R8 (?X_L BOY.N))
		(!R9 (?X_L ((PASV NAME.V) ?X_M)))
		(!R10 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_K (?X_L ((ADV-A (FROM.P ?L1)) WALK.22.V) ?L2))
		(?X_A (?X_H (TOO.ADV (ALONG.ADV COME.V))))
		(?X_O (?X_M SEE.24.V (THT (?X_G FINE.A))))
		(?X_E (?X_M (ASK.V ?X_F)))
		(?X_C (?X_G (SAY.V (THT (?X_G FINE.A)))))
	)
)

; "A man walked down the street."
; "He saw a woman on a bicycle."
; "He stopped her."
; "'Hello,' she said."
; "'How do you do?' he answered."
(EPI-SCHEMA ((?X_H (STOP.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_H WOMAN.N))
		(!R2 (?X_I MAN.N))
		(!R3 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_K (?X_I ((ADV-A (FROM.P ?L1)) WALK.22.V) ?L2))
		(?X_M (?X_I SEE.25.V ?X_H))
		(?X_G (?X_I (STOP.V ?X_H)))
		(?X_E (?X_A ?X_H SAY.V))
		(?X_C (?X_I ANSWER.V))
	)
)

; "Tom and Jenny walked down the street."
; "A strange man stopped them."
; "He said that they looked suspicious."
; "He told Tom and Jenny to go away."
(EPI-SCHEMA ((?X_I (TELL.V ?X_K (THAT (?X_I (LOOK.V SUSPICIOUS.A))))) ** ?E)
	(:ROLES
		(!R1 (?X_K AGENT.N))
		(!R2 (?X_I MAN.N))
		(!R3 (?X_I STRANGE.A))
		(!R4 (?X_J AGENT.N))
		(!R5 (?L2 DESTINATION.N))
		(!R6 ((KA (AWAY.ADV GO.V)) ACTION.N))
		(!R7 ((SET-OF ?X_J ?X_K) AGENT.N))
		(!R8 (NOT (?X_I = (SET-OF ?X_J ?X_K))))
	)
	(:STEPS
		(?X_F ((SET-OF ?X_J ?X_K) ((ADV-A (FROM.P ?L1)) WALK.26.V) ?L2))
		(?X_D (?X_I (STOP.V ?X_K)))
		(?X_B (?X_I (SAY.V (THAT (?X_K (LOOK.V SUSPICIOUS.A))))))
		(?X_H (?X_I TELL.27.V (SET-OF ?X_J ?X_K) (KA (AWAY.ADV GO.V))))
	)
)

; "Mary liked going for walks."
; "She walked along the street."
; "A tall man grabbed her by the arm."
; "He pulled her into an alley."
(EPI-SCHEMA ((?X_L ((ADV-A (INTO.P ?X_C)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C ALLEY.N))
		(!R2 (?X_F ARM.N))
		(!R3 (?X_G MAN.N))
		(!R4 (?X_G TALL.A))
		(!R5 ((KA ((ADV-A (FOR.P (KA WALK.V))) GO.V)) ACTION.N))
		(!R6 (?X_L AGENT.N))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_I (?X_L LIKE.28.V (KA ((ADV-A (FOR.P (KA WALK.V))) GO.V))))
		(?E_1 (?X_L ((ADV-A (FROM.P ?L1)) WALK.29.V) ?L2))
		(?E_2 (?X_L ((ADV-A (FROM.P ?L1)) GO.30.V) ?L2))
		(?X_K (?X_L ((ADV-A (FROM.P ?L1)) WALK.22.V) ?L2))
		(?X_E (?X_G (((ADV-A (BY.P ?X_F)) GRAB.V) ?X_L)))
		(?X_B (?X_G (((ADV-A (INTO.P ?X_C)) PULL.V) ?X_L)))
	)
)

; "Tommy saw a strange woman on the street."
; "A strange man grabbed him by the arm."
; "A strange car pulled up."
; "A strange man jumped into the car."
(EPI-SCHEMA ((?X_M (INTO.P ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_N STRANGE.A))
		(!R2 (?X_N CAR.N))
		(!R3 (?X_E ARM.N))
		(!R4 (?X_F MAN.N))
		(!R5 (?X_F STRANGE.A))
		(!R6 (?X_I STRANGE.A))
		(!R7 (?X_I WOMAN.N))
		(!R8 (?X_J STRANGE.A))
		(!R9 (?X_J MAN.N))
		(!R10 (?X_M AGENT.N))
		(!R11 (?X_N DESTINATION.N))
	)
	(:STEPS
		(?X_H (?X_M SEE.31.V ?X_I))
		(?X_D (?X_F (((ADV-A (BY.P ?X_E)) GRAB.V) ?X_M)))
		(?X_B (?X_N (UP.ADV PULL.V)))
		(?X_L (?X_J ((ADV-A (FROM.P ?L1)) JUMP.32.V) ?X_N))
	)
)



; "Mary loved to sing."
; "One day, she sang at church."
; "Everyone enjoyed it."
; "Afterward, Mary sang again."
; "People were pleased."
(EPI-SCHEMA ((?X_I ((ADV-A (DURING.P ?X_G)) SING.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G CHURCH.N))
		(!R2 (?X_H DAY.N))
		(!R3 (?X_I AGENT.N))
		(!R4 ((KA SING.V) ACTION.N))
	)
	(:STEPS
		(?X_B (?X_I LOVE.1.V (KA SING.V)))
		(?X_F ((ADV-E ({DURING}.P ?X_H)) (?X_I ((ADV-A (AT.P ?X_G)) SING.V))))
		(?X_D ((EVERY.D PERSON.N) (ENJOY.V ?X_A)))
	)
)

; "Tom played guitar."
; "He liked to play music."
; "His band played for many years."
; "Tom's band was popular."
(EPI-SCHEMA ((?X_G (LIKE.V (KA (PLAY.V ?X_C)))) ** ?E)
	(:ROLES
		(!R1 (?X_C GUITAR.N))
		(!R2 (?X_D POPULAR.A))
		(!R3 (?X_D BAND.N))
		(!R4 (?X_D (PERTAIN-TO ?X_G)))
		(!R5 (?X_H MUSIC.N))
		(!R6 (?X_G AGENT.N))
		(!R7 ((KA (PLAY.V ?X_H)) ACTION.N))
	)
	(:STEPS
		(?X_B (?X_G (PLAY.V ?X_C)))
		(?X_F (?X_G LIKE.2.V (KA (PLAY.V ?X_H))))
	)
)

; "Mary sang at church on Sunday."
; "She sang for an hour."
; "People liked that song."
(EPI-SCHEMA ((?X_K ((ADV-A (FOR.P ?X_C)) SING.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C HOUR.N))
		(!R2 (?X_F AGENT.N))
		(!R3 (?X_G CHURCH.N))
		(!R4 (?X_H AGENT.N))
		(!R5 (?X_K (PLUR PERSON.N)))
		(!R6 (?X_L SONG.N))
		(!R7 (?X_L OBJECT.N))
		(!R8 (NOT (?X_L ACTION.N)))
		(!R9 (NOT (?X_L AGENT.N)))
	)
	(:STEPS
		(?X_E (?X_H ((ADV-A (AT.P ?X_G)) ((ADV-A (ON.P ?X_F)) SING.V))))
		(?X_B (?X_H ((ADV-A (FOR.P ?X_C)) SING.V)))
		(?X_J (?X_K LIKE.3.V ?X_L))
	)
)

; "John played music on his guitar."
; "He sang a song."
; "Everyone liked John's singing."
(EPI-SCHEMA ((?X_I (LIKE.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_D SONG.N))
		(!R2 (?X_E MUSIC.N))
		(!R3 (?X_F GUITAR.N))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_F (PERTAIN-TO ?X_I)))
		(!R6 (?X_J SINGING.N))
		(!R7 (?X_J (PERTAIN-TO ?X_I)))
		(!R8 ((EVERY.D PERSON.N) AGENT.N))
		(!R9 (?X_J OBJECT.N))
		(!R10 (NOT (?X_J ACTION.N)))
		(!R11 (NOT (?X_J AGENT.N)))
	)
	(:STEPS
		(?X_A (?X_I (((ADV-A (ON.P ?X_F)) PLAY.V) ?X_E)))
		(?X_C (?X_I (SING.V ?X_D)))
		(?X_H ((EVERY.D PERSON.N) LIKE.4.V ?X_J))
	)
)

; "Tom played a song on his guitar."
; "His friends liked that song."
; "He sang for them."
; "They all clapped."
(EPI-SCHEMA ((?X_L ((ADV-A (FOR.P ?X_L)) SING.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E AGENT.N))
		(!R2 (?X_H (PLUR FRIEND.N)))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_H (PERTAIN-TO ?X_I)))
		(!R5 (?X_L SONG.N))
		(!R6 (?X_J GUITAR.N))
		(!R7 (?X_K AGENT.N))
		(!R8 (?X_J (PERTAIN-TO ?X_K)))
		(!R9 (?X_L OBJECT.N))
		(!R10 (NOT (?X_L ACTION.N)))
		(!R11 (NOT (?X_L AGENT.N)))
	)
	(:STEPS
		(?X_A (?X_K (((ADV-A (ON.P ?X_J)) PLAY.V) ?X_L)))
		(?X_B (?X_H LIKE.5.V ?X_L))
		(?X_G (?X_I ((ADV-A (FOR.P ?X_H)) SING.V)))
		(?X_D ((ALL.D ({OF}.P ?X_E)) CLAP.V))
	)
)

; "Tom liked to play basketball."
; "He was good at basketball."
; "He played on the team."
(EPI-SCHEMA ((?X (PLAY.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_F BASKETBALL.N))
		(!R2 (?X_E BASKETBALL.N))
		(!R3 (?X_G ((ADV-A (AT.P ?X_E)) GOOD.A)))
		(!R4 ((KA (PLAY.V ?X_F)) ACTION.N))
		(!R5 (?X AGENT.N))
		(!R6 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_B (?X_G LIKE.6.V (KA (PLAY.V ?X_F))))
		(?E_1 (?X PLAY.7.V))
		(?X_D (?X_G PLAY.8.V))
	)
)

; "Doris is good at singing."
; "She can sing songs from memory."
; "She sings all the time."
; "She likes singing."
(EPI-SCHEMA ((?X_H (LIKE.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR SONG.N)))
		(!R2 (?X_D (FROM.P ?X_E)))
		(!R3 (?X_H GOOD.A))
		(!R4 (?X_I SINGING.N))
		(!R5 (?X_H AGENT.N))
		(!R6 (?X_I OBJECT.N))
		(!R7 (NOT (?X_I ACTION.N)))
		(!R8 (NOT (?X_I AGENT.N)))
	)
	(:STEPS
		(?X_A (?X_H (AT.P (KA SING.V))))
		(?X_C (?X_H ((CAN.AUX SING.V) ?X_D)))
		(?X_G (?X_H LIKE.9.V ?X_I))
	)
)

; "Mary's mother is an opera singer."
; "She sings on stage."
; "Mary likes to listen to her mom sing."
(EPI-SCHEMA ((?X_J (LIKE.V (KA ((ADV-A (TO.P ?X_E)) LISTEN.V)))) ** ?E)
	(:ROLES
		(!R1 (?X_E STAGE.N))
		(!R2 (?X_H SINGER.N))
		(!R3 (?X_H OPERA.N))
		(!R4 (?X_I MOTHER.N))
		(!R5 (?X_I MOM.N))
		(!R6 (?X_I (PERTAIN-TO ?X_J)))
		(!R7 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_G (?X_I (= ?X_H)))
		(?X_D (?X_I ((ADV-A (ON.P ?X_E)) SING.V)))
		(?X_B (?X_J LIKE.10.V (KA (((ADV-A (TO.P ?X_I)) LISTEN.V) (?X_A SING.V)))))
	)
)

; "Mary sang for a crowd."
; "She sang at church."
; "She sang at a party."
; "A lot of people liked her singing."
(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA.PR ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_D PARTY.N))
		(!R2 (?X_G CHURCH.N))
		(!R3 (?X_J CROWD.N))
		(!R4 (?X_L AGENT.N))
		(!R5 (?X_K (PLUR PERSON.N)))
		(!R6 (?X_M LOT.N))
		(!R7 (?X_M (OF.P ?X_K)))
		(!R8 (?X_N SINGING.N))
		(!R9 (?X_N (PERTAIN-TO ?X_L)))
		(!R10 (?X_M AGENT.N))
		(!R11 (?X_N OBJECT.N))
		(!R12 (NOT (?X_N ACTION.N)))
		(!R13 (NOT (?X_N AGENT.N)))
	)
	(:STEPS
		(?X_I (?X_L ((ADV-A (FOR.P ?X_J)) SING.V)))
		(?X_F (?X_L ((ADV-A (AT.P ?X_G)) SING.V)))
		(?X_C (?X_L ((ADV-A (AT.P ?X_D)) SING.V)))
		(?X_A (?X_M LIKE.13.V ?X_N))
	)
)

; "The man took a walk."
; "He came across an apple tree."
; "He picked an apple from it."
; "He ate it."
; "Then he put the apple back on the branch."
(EPI-SCHEMA ((?X_J (EAT.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C APPLE.N))
		(!R2 (?X_F APPLE.N))
		(!R3 (?X_F TREE.N))
		(!R4 (?X_I WALK.N))
		(!R5 (?X_J MAN.N))
	)
	(:STEPS
		(?X_H (?X_J (TAKE.V ?X_I)))
		(?X_E (?X_J ((ADV-A (ACROSS.P ?X_F)) COME.V)))
		(?X_B (?X_J (((ADV-A (FROM.P ?X_F)) PICK.V) ?X_C)))
		(?X_L (?X_J EAT.14.V ?X_C))
	)
)

; "Alice liked apples."
; "She planted some apple seeds."
; "She grew them into trees."
; "She gave some apples to Tom."
(EPI-SCHEMA ((?X_L (GIVE.V ?X_K ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR TREE.N)))
		(!R2 (?X_F APPLE.N))
		(!R3 (?X_F (PLUR SEED.N)))
		(!R4 (?X_K (PLUR APPLE.N)))
		(!R5 (?X_N (PLUR APPLE.N)))
		(!R6 (NOT (?X_K ACTION.N)))
		(!R7 (NOT (?X_K AGENT.N)))
		(!R8 (?X_L AGENT.N))
		(!R9 (?X_M AGENT.N))
		(!R10 (NOT (?X_N AGENT.N)))
	)
	(:STEPS
		(?X_H (?X_M LIKE.15.V ?X_K))
		(?X_E (?X_M (PLANT.V ?X_F)))
		(?X_B (?X_M (((ADV-A (INTO.P ?X_C)) GROW.V) ?X_F)))
		(?X_J (?X_M (GIVE.16.V ?X_L ?X_N)))
	)
)

; "Tom walked down the street."
; "He saw an apple tree."
; "He looked at the apple tree."
; "He ate one of its apples."
(EPI-SCHEMA ((?X_I ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D APPLE.N))
		(!R2 (?X_D TREE.N))
		(!R3 (?L2 DESTINATION.N))
		(!R4 (?X_I AGENT.N))
		(!R5 (?F FOOD.N))
	)
	(:STEPS
		(?X_F (?X_I ((ADV-A (FROM.P ?L1)) WALK.17.V) ?L2))
		(?X_H (?X_I SEE.18.V ?X_D))
		(?X_C (?X_I ((ADV-A (AT.P ?X_D)) LOOK.V)))
		(?X_A (?X_I EAT.19.V ?F))
	)
)

; "Alice picked apples from an apple tree."
; "She ate one of them."
; "She liked that kind of fruit."
(EPI-SCHEMA ((?X_J (EAT.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR APPLE.N)))
		(!R2 (?X_D APPLE.N))
		(!R3 (?X_D TREE.N))
		(!R4 (?X_J AGENT.N))
		(!R5 (?X_I FRUIT.N))
		(!R6 (?X_L KIND.N))
		(!R7 (?X_L (OF.P ?X_I)))
		(!R8 (?X_J FOOD.N))
		(!R9 (?X_L OBJECT.N))
		(!R10 (?X_K AGENT.N))
		(!R11 (NOT (?X_L ACTION.N)))
		(!R12 (NOT (?X_L AGENT.N)))
	)
	(:STEPS
		(?X_B (?X_K (((ADV-A (FROM.P ?X_D)) PICK.V) ?X_C)))
		(?X_F (?X_K EAT.14.V ?X_J))
		(?X_H (?X_K LIKE.20.V ?X_L))
	)
)

; "Andy picked apples from an apple tree."
; "He ate them all."
; "He left some for later."
(EPI-SCHEMA ((?X_E
              (((ADV-A (IN.P ?X_C)) EAT.V)
               (ALL.D
                (L X
                 (AND (X (PLUR {REF}.N)) (X (OF.P (THE.D (PLUR APPLE.N)))))))))
             ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR APPLE.N)))
		(!R2 (?X_D APPLE.N))
		(!R3 (?X_D TREE.N))
		(!R4 (?X_E AGENT.N))
	)
	(:STEPS
		(?X_B (?X_E (((ADV-A (FROM.P ?X_D)) PICK.V) ?X_C)))
		(?X_G (?X_E EAT.21.V (ALL.D ({OF}.P ?X_C))))
	)
)

; "Alice walked through the park."
; "There were many apple trees there."
; "She saw some apples on one tree."
; "She climbed the tree."
; "She reached for the apple."
; "She pulled it down."
; "She ate the apple."
(EPI-SCHEMA ((?X_Q (CLIMB.V ?X_P)) ** ?E)
	(:ROLES
		(!R1 (?X_C FEMALE.A))
		(!R2 (?X_C AGENT.N))
		(!R3 (?X_H APPLE.N))
		(!R4 (?X_M (PLUR APPLE.N)))
		(!R5 (?X_P TREE.N))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?X_P DESTINATION.N))
		(!R8 (?X_Q AGENT.N))
	)
	(:STEPS
		(?X_J (?X_Q ((ADV-A (FROM.P ?L1)) WALK.17.V) ?L2))
		(?X_L (?X_Q SEE.22.V ?X_M))
		(?X_O (?X_Q ((ADV-A (FROM.P ?L1)) CLIMB.23.V) ?X_P))
		(?X_G (?X_Q ((ADV-A (FOR.P ?X_H)) REACH.V)))
		(?X_E (?X_Q (PULL_DOWN.V ?X_H)))
		(?X_B (?X_C (EAT.V ?X_H)))
	)
)

; "A boy named Tom likes apples."
; "He likes eating them too."
; "When he is hungry he eats apples."
(EPI-SCHEMA ((?X_G (LIKE.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR APPLE.N)))
		(!R2 (?X_G BOY.N))
		(!R3 (?X_G ((PASV NAME.V) ?X_H)))
		(!R4 (?X_H AGENT.N))
		(!R5 (?X_H FOOD.N))
	)
	(:STEPS
		(?X_C (?X_G LIKE.24.V (IND (5 ?X_A))))
		(?X_E (?X_H LIKE.25.V (KA (TOO.ADV EAT.V) ?X_F)))
		(?E_1 (?X_H EAT.26.V ?X_H))
	)
)

; "Tom walked down the street."
; "He saw some apples on a tree."
; "He picked one apple."
; "He ate it."
; "He liked apples."
(EPI-SCHEMA ((?X_M (PICK.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C APPLE.N))
		(!R2 (?X_H (PLUR APPLE.N)))
		(!R3 (?X_N (PLUR APPLE.N)))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_M AGENT.N))
		(!R6 (NOT (?X_N ACTION.N)))
		(!R7 (NOT (?X_N AGENT.N)))
	)
	(:STEPS
		(?X_E (?X_M ((ADV-A (FROM.P ?L1)) WALK.17.V) ?L2))
		(?X_G (?X_M SEE.27.V ?X_H))
		(?X_B (?X_M (PICK.V ?X_C)))
		(?X_J (?X_M EAT.14.V ?X_C))
		(?X_L (?X_M LIKE.28.V ?X_N))
	)
)



; "The woman was angry with her husband."
; "She told him that he should be ashamed of himself."
; "Her husband left the room."
; "A few minutes later, he returned."
(EPI-SCHEMA ((?X_C (LEAVE.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_C HUSBAND.N))
		(!R2 (?X_D ANGRY.A))
		(!R3 (?X_D WOMAN.N))
		(!R4 (?X_C (PERTAIN-TO ?X_D)))
		(!R5 (?X_E ROOM.N))
		(!R6 (?X_E LOCATION.N))
		(!R7 (NOT (?X_E = ?L2)))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_D (WITH.P ?X_C)))
		(?X_B (?X_C ((ADV-A (FROM.P ?X_E)) LEAVE.1.V) ?L2))
	)
)

; "Alice was angry with her father."
; "She shouted at him."
; "He started crying."
; "He ran away from her."
(EPI-SCHEMA ((?X_F ((ADV-A (AT.P ?X_F)) SHOUT.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F FATHER.N))
		(!R2 (?X_I ANGRY.A))
		(!R3 (?X_F (PERTAIN-TO ?X_I)))
		(!R4 (?X_I AGENT.N))
		(!R5 (?N NOISE.N))
		(!R6 (?X_I LOCATION.N))
		(!R7 (NOT (?X_I = ?L2)))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_I (WITH.P ?X_F)))
		(?X_E (?X_I ((ADV-A (AT.P ?X_F)) SHOUT.V)))
		(?X_C (?X_F ((ADV-A (FOR.P (KA CRY.V))) START.V)))
		(?E_1 (?X_I CRY.2.V ?N))
		(?X_H (?X_F ((ADV-A (FROM.P ?X_I)) RUN.3.V) ?L2))
	)
)

; "Alice was angry with her mother."
; "She yelled at her mother."
; "Her mother was upset."
(EPI-SCHEMA ((?X_C ((ADV-A (AT.P ?X_C)) YELL.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D ANGRY.A))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_C MOTHER.N))
		(!R4 (?X_C UPSET.A))
		(!R5 (?X_C (PERTAIN-TO ?X_D)))
	)
	(:STEPS
		(?X_A (?X_D (WITH.P ?X_C)))
		(?X_B (?X_D ((ADV-A (AT.P ?X_C)) YELL.V)))
	)
)

; "Alice was mad at her friend."
; "She said some bad words."
; "She threw things."
; "She yelled at her friend."
(EPI-SCHEMA ((?X_I ((ADV-A (AT.P ?X_I)) YELL.V)) ** ?E)
	(:ROLES
		(!R1 (?X_B BAD.A))
		(!R2 (?X_B (PLUR WORD.N)))
		(!R3 (?X_E (PLUR THING.N)))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_H FRIEND.N))
		(!R6 (?X_I ((ADV-A (AT.P ?X_H)) MAD.A)))
		(!R7 (?X_H (PERTAIN-TO ?X_I)))
	)
	(:STEPS
		(?X_D (?X_I (SAY.V ?X_B)))
		(?X_G (?X_I (THROW.V ?X_E)))
		(?X_A (?X_I ((ADV-A (AT.P ?X_H)) YELL.V)))
	)
)

; "'I'm so angry!' said Jenny."
; "'I don't know what I'll do if you don't stop yelling at me.'"
; "'I'm not yelling!', said Tom."
; "'You're shouting at me!' said Jenny."
; "'Well, if you want to shout, then shout,' said Tom."
; "'Fine! You've been shouting for hours!' said Jenny."
(EPI-SCHEMA ((?X_C (KNOW.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 ((IND (5 COMMUNICATION_NOISE)) ACTION.N))
		(!R2 (?X_C AGENT.N))
	)
	(:STEPS
		(?X_B (?X_C KNOW.5.V (IND (5 COMMUNICATION_NOISE))))
	)
)





; "The man went to the hospital."
; "He saw a doctor there."
; "The doctor examined him."
; "The doctor thought that he might have cancer."
(EPI-SCHEMA ((?X_C (EXAMINE.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_B HOSPITAL.N))
		(!R2 (?X_C DOCTOR.N))
		(!R3 (?X_D MAN.N))
	)
	(:STEPS
		(?X_A (?X_D ((ADV-A (TO.P ?X_B)) GO.V)))
		(?X_F (?X_C (EXAMINE.V ?X_D)))
	)
)

; "Mary went to the doctor's office."
; "A nurse helped Mary fill out some forms."
; "Mary filled out the forms correctly."
; "The doctor looked at her chart."
(EPI-SCHEMA ((?X_L ((CORRECTLY.ADV FILL_OUT.V) ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_G CHART.N))
		(!R2 (?X_I DOCTOR.N))
		(!R3 (?X_F (PLUR FORM.N)))
		(!R4 (?X_G (PERTAIN-TO ?X_L)))
		(!R5 (?X_H NURSE.N))
		(!R6 (?X_M OFFICE.N))
		(!R7 (?X_M (PERTAIN-TO ?X_I)))
		(!R8 (?X_L AGENT.N))
		(!R9 (?X_M DESTINATION.N))
	)
	(:STEPS
		(?X_K (?X_L ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_M))
		(?X_E (?X_H (HELP.V (KE (?X_L (FILL_OUT.V ?X_F))))))
		(?X_C (?X_L ((CORRECTLY.ADV FILL_OUT.V) ?X_F)))
		(?X_A (?X_I ((ADV-A (AT.P ?X_G)) LOOK.V)))
	)
)

; "Tom went to the emergency room."
; "A nurse helped Tom."
; "A doctor checked Tom's eyes."
; "The doctor told Tom he had an infection."
(EPI-SCHEMA ((?X_M ((ADV-A (TO.P ?X_N)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C INFECTION.N))
		(!R2 (?X_I (PLUR EYE.N)))
		(!R3 (?X_F DOCTOR.N))
		(!R4 (?X_I (PERTAIN-TO ?X_M)))
		(!R5 (?X_J NURSE.N))
		(!R6 (?X_N EMERGENCY.N))
		(!R7 (?X_N ROOM.N))
		(!R8 (?X_M AGENT.N))
		(!R9 (?X_N DESTINATION.N))
	)
	(:STEPS
		(?X_L (?X_M ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_N))
		(?X_H (?X_J (HELP.V ?X_M)))
		(?X_E (?X_F (CHECK.V ?X_I)))
		(?X_B (?X_F (TELL.V ?X_M (THT (?X_M (HAVE.V ?X_C))))))
	)
)

; "Carrie went to the hospital."
; "She saw a nurse there."
; "A doctor came by."
; "He looked at Carrie's leg."
(EPI-SCHEMA ((?X_I ((ADV-A (BY.P ?X_K)) COME.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D LEG.N))
		(!R2 (?X_C DOCTOR.N))
		(!R3 (?X_D (PERTAIN-TO ?X_I)))
		(!R4 (?X_J HOSPITAL.N))
		(!R5 (?X_K NURSE.N))
		(!R6 (?X_I AGENT.N))
		(!R7 (?X_J DESTINATION.N))
		(!R8 (?X_K DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_I ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_J))
		(?X_H (?X_C ((ADV-A (FROM.P ?L1)) COME_BY.2.V) ?X_K))
		(?X_B (?X_C ((ADV-A (AT.P ?X_D)) LOOK.V)))
	)
)

; "Bill went to the doctor."
; "He told Bill that he had cancer."
; "The doctor gave Bill some medicine."
; "Bill felt better after taking the medicine."
(EPI-SCHEMA ((?X_I (TAKE.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_C ((ADV-A (AFTER.P (KA (TAKE.V ?X_L)))) BETTER.A)))
		(!R2 (?X_F CANCER.N))
		(!R3 (?X_I DOCTOR.N))
		(!R4 (?X_M BILL.N))
		(!R5 (?X_L MEDICINE.N))
		(!R6 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_H (?X_M ((ADV-A (TO.P ?X_I)) GO.V)))
		(?X_E (?X_I (TELL.V ?X_M (THAT (?X_I (HAVE.V ?X_F))))))
		(?X_K (?X_I (GIVE.3.V ?X_M ?X_L)))
		(?X_B (?X_M (FEEL.V ?X_C)))
	)
)

; "Anna went to the hospital."
; "She met a nurse who helped her."
; "The nurse told Anna what to do."
; "Anna felt better after talking to the nurse."
(EPI-SCHEMA ((?X_J
              ((ADV-A (TO.P ?X_I))
               ((ADV-A (AFTER.P (KA ((ADV-A (TO.P ?X_F)) TALK.V)))) GO.V)))
             ** ?E)
	(:ROLES
		(!R1 (?X_C ((ADV-A (AFTER.P (KA ((ADV-A (TO.P ?X_F)) TALK.V)))) BETTER.A)))
		(!R2 (?X_F NURSE.N))
		(!R3 (?X_I HOSPITAL.N))
		(!R4 (?X_I DESTINATION.N))
		(!R5 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_H (?X_J ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_I))
		(?X_E (?X_J (MEET.V ?X_F)))
		(?X_B (?X_J (FEEL.V ?X_C)))
	)
)

; "A woman went to the hospital."
; "She had an appointment."
; "She met a nurse."
; "The nurse told her what to do."
; "The nurse helped the woman."
(EPI-SCHEMA ((?X_I ((ADV-A (TO.P ?X_L)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E NURSE.N))
		(!R2 (?X_H APPOINTMENT.N))
		(!R3 (?X_I WOMAN.N))
		(!R4 (?X_L HOSPITAL.N))
		(!R5 (?X_L DESTINATION.N))
	)
	(:STEPS
		(?X_K (?X_I ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_L))
		(?X_G (?X_I (HAVE.V ?X_H)))
		(?X_D (?X_I (MEET.V ?X_E)))
		(?X_B (?X_E (HELP.V ?X_I)))
	)
)

; "The woman went to the hospital."
; "She saw a doctor there."
; "The doctor looked at her."
; "The doctor told her what was wrong with her."
; "The doctor gave her medicine."
; "The woman felt better."
(EPI-SCHEMA ((?X_J ((ADV-A (TO.P ?X_I)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C BETTER.A))
		(!R2 (?X_F DOCTOR.N))
		(!R3 (?X_I HOSPITAL.N))
		(!R4 (?X_J WOMAN.N))
		(!R5 (?X_M MEDICINE.N))
	)
	(:STEPS
		(?X_H (?X_J ((ADV-A (TO.P ?X_I)) GO.V)))
		(?X_E (?X_F ((ADV-A (AT.P ?X_J)) LOOK.V)))
		(?X_L (?X_F (GIVE.4.V ?X_J ?X_M)))
		(?X_B (?X_J (FEEL.V ?X_C)))
	)
)

; "Linda went to the hospital."
; "A nurse helped her with her clothes."
; "A doctor checked her blood pressure."
; "A doctor measured her pulse."
; "A doctor put some medicine into her arm."
(EPI-SCHEMA ((?X_P ((ADV-A (TO.P ?X_Q)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G PULSE.N))
		(!R2 (?X_E DOCTOR.N))
		(!R3 (?X_F DOCTOR.N))
		(!R4 (?X_L (PERTAIN-TO ?X_P)))
		(!R5 (?X_G (PERTAIN-TO ?X_P)))
		(!R6 (?X_H (PLUR CLOTHE.N)))
		(!R7 (?X_H (PERTAIN-TO ?X_P)))
		(!R8 (?X_I NURSE.N))
		(!R9 (?X_Q HOSPITAL.N))
		(!R10 (?X_M BLOOD.N))
		(!R11 (?X_L ?X_M PRESSURE.N))
		(!R12 (?X_N DOCTOR.N))
		(!R13 (?X_O MEDICINE.N))
		(!R14 (?X_R ARM.N))
		(!R15 (?X_R (PERTAIN-TO ?X_P)))
		(!R16 (?X_P AGENT.N))
		(!R17 (?X_Q DESTINATION.N))
		(!R18 (?X_R LOCATION.N))
	)
	(:STEPS
		(?X_K (?X_P ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_Q))
		(?X_A (?X_I (((ADV-A (WITH.P ?X_H)) HELP.V) ?X_P)))
		(?X_B (?X_F (CHECK.V ?X_L)))
		(?X_C (?X_E (MEASURE.V ?X_G)))
		(?X_D (?X_N PUT.5.V ?X_O ?X_R))
	)
)

; "Alfred went to the hospital for surgery."
; "He arrived early."
; "Surgeons were waiting."
; "He waited in the operating room."
; "He watched the surgeons work."
; "He watched as they cut open his chest."
(EPI-SCHEMA ((?X_N ((ADV-A (TO.P ?X_M)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E OPERATING.N))
		(!R2 (?X_E ROOM.N))
		(!R3 (?X_H (PLUR SURGEON.N)))
		(!R4 (?X_M HOSPITAL.N))
		(!R5 (?X_M DESTINATION.N))
		(!R6 (?X_N AGENT.N))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_J (?X_N ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_M))
		(?X_L (?X_N ((ADV-A (FROM.P ?L1)) ARRIVE.6.V) ?L2))
		(?X_G (?X_H WAIT.V))
		(?X_D (?X_N ((ADV-A (IN.P ?X_E)) WAIT.V)))
		(?X_B (?X_N (WATCH.V (KE (?X_H WORK.V)))))
	)
)

; "A patient is sick."
; "The doctors give them medicine."
; "The nurse gives them food."
; "The patient gets better."
(EPI-SCHEMA ((?X_G
              ((ADV-A (AFTER.P (KA (TAKE.V (SET-OF ?X_H ?X_L)))))
               (BETTER.ADV GET.V)))
             ** ?E)
	(:ROLES
		(!R1 (?X_C BETTER.A))
		(!R2 (?X_D SICK.A))
		(!R3 (?X_D PATIENT.N))
		(!R4 (?X_G (PLUR DOCTOR.N)))
		(!R5 (?X_H MEDICINE.N))
		(!R6 (?X_K NURSE.N))
		(!R7 (?X_L FOOD.N))
		(!R8 (NOT (?X_L AGENT.N)))
	)
	(:STEPS
		(?X_F (?X_G (GIVE.7.V ?X_D ?X_H)))
		(?X_J (?X_K (GIVE.8.V ?X_D ?X_L)))
		(?X_B (?X_D (GET.V ?X_C)))
	)
)

; "The girl went to school."
; "She met a boy at school."
; "They talked together."
; "Later they kissed each other."
(EPI-SCHEMA ((?X_D (MEET.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_A SCHOOL.N))
		(!R2 (?X_D GIRL.N))
		(!R3 (?X_E SCHOOL.N))
		(!R4 (?X_F BOY.N))
		(!R5 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_C (?X_D ((ADV-A (TO.P ?X_A)) GO.V)))
		(?X_H (?X_D (((ADV-A (AT.P ?X_E)) MEET.V) ?X_F)))
		(?X_J (?X_K (TOGETHER.ADV TALK.V)))
		(?X_M (?X_K ((LATER.ADV KISS.V) (EACH.D OTHER.A))))
	)
)

; "Tina took a bath."
; "She put bubbles in the tub."
; "She turned on the hot water."
; "She washed herself."
(EPI-SCHEMA ((?X_M (TAKE.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C HOT.A))
		(!R2 (?X_C WATER.N))
		(!R3 (?X_F BATH.N))
		(!R4 (?X_I (PLUR BUBBLE.N)))
		(!R5 (?X_L TUB.N))
		(!R6 (?X_L LOCATION.N))
		(!R7 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_E (?X_M (TAKE.V ?X_F)))
		(?X_H (?X_M PUT.9.V ?X_I ?X_L))
		(?X_B (?X_M ((ADV-A (ON.P ?X_C)) TURN.V)))
		(?X_K (?X_M WASH.10.V ?X_M))
	)
)

; "Tom played basketball."
; "He liked to play basketball."
; "He watched the game on TV."
; "He missed a shot."
(EPI-SCHEMA ((?X_L (PLAY.V ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_C SHOT.N))
		(!R2 (?X_M BASKETBALL.N))
		(!R3 (?X_F TV.N))
		(!R4 (?X_I BASKETBALL.N))
		(!R5 (?X_L AGENT.N))
		(!R6 ((KA (PLAY.V ?X_M)) ACTION.N))
		(!R7 (?X AGENT.N))
	)
	(:STEPS
		(?X_H (?X_L PLAY.11.V))
		(?X_K (?X_L LIKE.12.V (KA (PLAY.V ?X_M))))
		(?X_E (?X_L (((ADV-A (ON.P ?X_F)) WATCH.V) ?X_M)))
		(?X_B (?X_L (MISS.V ?X_C)))
		(?E_1 (?X PLAY.13.V))
	)
)

; "Sarah's dad told her to do her homework."
; "She read books at her desk."
; "She wrote down what she learned from reading."
; "She liked to study."
(EPI-SCHEMA ((?X_L (((ADV-A (FOR.P ?X_L)) WRITE_DOWN.V) ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR BOOK.N)))
		(!R2 (?X_G DESK.N))
		(!R3 (?X_G (PERTAIN-TO ?X_L)))
		(!R4 (?X_K DAD.N))
		(!R5 (?X_K (PERTAIN-TO ?X_L)))
		(!R6 (?X_J HOMEWORK.N))
		(!R7 (?X_J (PERTAIN-TO ?X_L)))
		(!R8 ((KA (DO.V ?X_J)) ACTION.N))
		(!R9 (NOT (?X_K = ?X_L)))
		(!R10 (?X_L AGENT.N))
		(!R11 ((KA STUDY.V) ACTION.N))
	)
	(:STEPS
		(?X_B (?X_K TELL.19.V ?X_L (KA (DO.V ?X_J))))
		(?X_C (?X_L (((ADV-A (AT.P ?X_G)) READ.V) ?X_F)))
		(?X_E
   (?X_L
    (WRITE_DOWN.V
     (ANS-TO (?X_L ((ADV-A (FROM.P (KA (READ.V ?X_A)))) LEARN.V))))))
		(?X_I (?X_L LIKE.20.V (KA STUDY.V)))
	)
)

; "Alicia loves to go to school."
; "Her teacher gives her interesting homework."
; "Alicia has lots of friends."
; "She likes going to school."
(EPI-SCHEMA ((?X_O (LOVE.V (KA (GO.V (KA SCHOOL.N))))) ** ?E)
	(:ROLES
		(!R1 (?X_J TEACHER.N))
		(!R2 (?X_L SCHOOL.N))
		(!R3 (?X_F (PLUR FRIEND.N)))
		(!R4 (?X_M (PLUR LOT.N)))
		(!R5 (?X_M (OF.P ?X_F)))
		(!R6 (?X_G INTERESTING.A))
		(!R7 (?X_K ?X_G HOMEWORK.N))
		(!R8 (?X_J (PERTAIN-TO ?X_O)))
		(!R9 (?X_K (PERTAIN-TO ?X_O)))
		(!R10 (?X_N SCHOOL.N))
		(!R11 ((KA ((ADV-A (TO.P ?X_L)) GO.V)) ACTION.N))
		(!R12 (?X_L DESTINATION.N))
		(!R13 (?X_M OBJECT.N))
		(!R14 ((KA ((ADV-A (TO.P ?X_N)) GO.V)) ACTION.N))
		(!R15 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_C (?X_O LOVE.21.V (KA ((ADV-A (TO.P ?X_L)) GO.V))))
		(?X_A (?X_J (GIVE.V ?X_K)))
		(?E_1 (?X_O ((ADV-A (FROM.P ?L1)) GO.22.V) ?X_L))
		(?X_E (?X_O HAVE.23.V ?X_M))
		(?X_I (?X_O LIKE.24.V (KA ((ADV-A (TO.P ?X_N)) GO.V))))
	)
)



; "The boy was playing football."
; "He kicked the ball through the goal post."
; "The ball hit the goalie."
; "The goalie fell down."
; "The referee blew the whistle."
; "The game was over."
(EPI-SCHEMA ((?X_N (((ADV-A (THROUGH.P ?X_L)) KICK.V) ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_D GAME.N))
		(!R2 (?X_I GOALIE.N))
		(!R3 (?X_L BALL.N))
		(!R4 (?X_M GOAL.N))
		(!R5 (?X_M POST.N))
		(!R6 (?X_N BOY.N))
		(!R7 (?X_O FOOTBALL.N))
		(!R8 (?X_S WHISTLE.N))
		(!R9 (?X_R REFEREE.N))
		(!R10 (?X_S OBJECT.N))
	)
	(:STEPS
		(?X_A (?X_N PLAY.1.V))
		(?X_K (?X_N (((ADV-A (THROUGH.P ?X_M)) KICK.V) ?X_L)))
		(?X_H (?X_L (HIT.V ?X_I)))
		(?X_F (?X_I (DOWN.ADV FALL.V)))
		(?X_Q (?X_R BLOW.2.V ?X_S))
		(?X_C (?X_D (OVER.ADV BE.V)))
	)
)

; "John played football."
; "His team lost the game."
; "He missed a pass."
(EPI-SCHEMA ((?X_J (PLAY.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_D PASS.N))
		(!R2 (?X_E GAME.N))
		(!R3 (?X_F TEAM.N))
		(!R4 (?X_F (PERTAIN-TO ?X_J)))
		(!R5 (?X_I FOOTBALL.N))
		(!R6 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_H (?X_J PLAY.3.V))
		(?X_A (?X_F (LOSE.V ?X_E)))
		(?X_C (?X_J (MISS.V ?X_D)))
	)
)

; "Alfred played football."
; "He was on the team."
; "He scored points for his team."
; "He caught a pass from another player."
; "He ran after the ball."
; "He caught the ball."
; "He threw the ball into the end zone."
(EPI-SCHEMA ((?X_T (PLAY.V ?X_Q)) ** ?E)
	(:ROLES
		(!R1 (?X_D END.N))
		(!R2 (?X_D ZONE.N))
		(!R3 (?X_G BALL.N))
		(!R4 (?X_J PASS.N))
		(!R5 (?X_K (PLUR POINT.N)))
		(!R6 (?X_N TEAM.N))
		(!R7 (?X_N (PERTAIN-TO ?X_T)))
		(!R8 (?X_Q FOOTBALL.N))
		(!R9 (?X_T AGENT.N))
		(!R10 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_P (?X_T PLAY.4.V))
		(?X_M (?X_T ((ADV-A (ON.P ?X_N)) BE.V)))
		(?X_A (?X_T (((ADV-A (FOR.P ?X_N)) SCORE.V) ?X_K)))
		(?X_I (?X_T (((ADV-A (FROM.P (ANOTHER.D PLAYER.N))) CATCH.V) ?X_J)))
		(?X_S (?X_T ((ADV-A (FROM.P ?L1)) RUN.5.V) ?L2))
		(?X_F (?X_T (CATCH.V ?X_G)))
		(?X_C (?X_T (((ADV-A (INTO.P ?X_D)) THROW.V) ?X_G)))
	)
)

; "Alfred played football."
; "He kicked the ball into the goal post."
; "The ball hit the goalie."
; "The goalie fell down."
; "The referee blew the whistle."
; "The game was over."
(EPI-SCHEMA ((?X_S (((ADV-A (INTO.P ?X_K)) KICK.V) ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_C GAME.N))
		(!R2 (?X_H GOALIE.N))
		(!R3 (?X_K BALL.N))
		(!R4 (?X_L GOAL.N))
		(!R5 (?X_L POST.N))
		(!R6 (?X_O FOOTBALL.N))
		(!R7 (?X_T WHISTLE.N))
		(!R8 (?X_R REFEREE.N))
		(!R9 (?X_S AGENT.N))
		(!R10 (?X_T OBJECT.N))
	)
	(:STEPS
		(?X_N (?X_S PLAY.8.V))
		(?X_J (?X_S (((ADV-A (INTO.P ?X_L)) KICK.V) ?X_K)))
		(?X_G (?X_K (HIT.V ?X_H)))
		(?X_E (?X_H (DOWN.ADV FALL.V)))
		(?X_Q (?X_R BLOW.9.V ?X_T))
		(?X_B (?X_C (OVER.ADV BE.V)))
	)
)

; "Joe played football."
; "He kicked the ball."
; "He tried to kick the ball through the goal post."
; "He missed the goal post."
; "He missed the ball."
(EPI-SCHEMA ((?X_O (KICK.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_G BALL.N))
		(!R2 (?X_H GOAL.N))
		(!R3 (?X_H POST.N))
		(!R4 (?X_K BALL.N))
		(!R5 (?X_N FOOTBALL.N))
		(!R6 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_M (?X_O PLAY.10.V))
		(?X_J (?X_O (KICK.V ?X_K)))
		(?X_F (?X_O (TRY.V (KA (((ADV-A (THROUGH.P ?X_H)) KICK.V) ?X_G)))))
		(?X_D (?X_O (MISS.V ?X_H)))
		(?X_B (?X_O (MISS.V ?X_G)))
	)
)

; "Mike played football."
; "He ran fast."
; "He threw the ball well."
; "He scored many touchdowns."
(EPI-SCHEMA ((?X_L (WELL.ADV PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C MANY.A))
		(!R2 (?X_C (PLUR TOUCHDOWN.N)))
		(!R3 (?X_F BALL.N))
		(!R4 (?X_I FOOTBALL.N))
		(!R5 (?X_L AGENT.N))
		(!R6 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_H (?X_L PLAY.11.V))
		(?X_K (?X_L ((ADV-A (FROM.P ?L1)) RUN.5.V) ?L2))
		(?X_E (?X_L ((WELL.ADV THROW.V) ?X_F)))
		(?X_B (?X_L (SCORE.V ?X_C)))
	)
)

; "Tom played football."
; "He ran fast."
; "He scored many touchdowns."
; "He scored one touchdown."
; "He was happy because he won the game."
(EPI-SCHEMA ((?X_E PLAY.V) ** ?E)
	(:ROLES
		(!R1 (?X_C (BECAUSE.P (KE (?X_Q (WIN.V ?X_D))))))
		(!R2 (?X_E HAPPY.A))
		(!R3 (?X_H TOUCHDOWN.N))
		(!R4 (?X_K MANY.A))
		(!R5 (?X_K (PLUR TOUCHDOWN.N)))
		(!R6 (?X_N FOOTBALL.N))
		(!R7 (?X_Q AGENT.N))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_M (?X_Q PLAY.12.V))
		(?X_P (?X_Q ((ADV-A (FROM.P ?L1)) RUN.5.V) ?L2))
		(?X_J (?X_Q (SCORE.V ?X_K)))
		(?X_G (?X_Q (SCORE.V ?X_H)))
		(?X_B (?X_Q (BE.V ?X_E ?X_C)))
	)
)

; "The train came around a bend."
; "The car jumped from one side of the track to the other."
; "Everyone was scared."
; "No one knew why they moved like this."
; "But then the train stopped."
(EPI-SCHEMA ((?X_K ((ADV-A (AROUND.P ?L2)) COME.V)) ** ?E)
	(:ROLES
		(!R1 (?X_H TRAIN.N))
		(!R2 (?X_E TRACK.N))
		(!R3 (?X_J SIDE.N))
		(!R4 (?X_J (OF.P ?X_E)))
		(!R5 (?X_I CAR.N))
		(!R6 (?X_K OTHER.A))
		(!R7 (?X_K {REF}.N))
		(!R8 (?X_H AGENT.N))
		(!R9 (?L2 DESTINATION.N))
		(!R10 (?X_I AGENT.N))
		(!R11 (?X_K DESTINATION.N))
		(!R12 (NOT (?X_J = ?X_K)))
	)
	(:STEPS
		(?X_B (?X_A BEND.V))
		(?X_D (?X_H ((ADV-A (FROM.P ?L1)) COME_AROUND.13.V) ?L2))
		(?X_G (?X_I ((ADV-A (FROM.P ?X_J)) JUMP.14.V) ?X_K))
	)
)

; "The man was on the train."
; "He read a book."
; "The train left the station."
; "He watched the scenery pass by."
(EPI-SCHEMA ((?X_F ((ADV-A (ON.P ?X_J)) BE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C BOOK.N))
		(!R2 (?X_J TRAIN.N))
		(!R3 (?X_F MAN.N))
		(!R4 (?X_I STATION.N))
		(!R5 (?X_I LOCATION.N))
		(!R6 (NOT (?X_I = ?L2)))
		(!R7 (?L2 DESTINATION.N))
		(!R8 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_E (?X_F ((ADV-A (ON.P ?X_J)) BE.V)))
		(?X_B (?X_F (READ.V ?X_C)))
		(?X_H (?X_J ((ADV-A (FROM.P ?X_I)) LEAVE.16.V) ?L2))
	)
)

; "The train arrived."
; "The passengers were happy."
; "They got on the train."
; "The train started moving."
; "The train stopped."
(EPI-SCHEMA ((?X_G ((ADV-A (AT.P ?L2)) ARRIVE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_J TRAIN.N))
		(!R2 (?X_G (PLUR PASSENGER.N)))
		(!R3 (?X_G HAPPY.A))
		(!R4 (?X_J DESTINATION.N))
		(!R5 (?X_J AGENT.N))
		(!R6 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_J ((ADV-A (FROM.P ?L1)) ARRIVE.17.V) ?L2))
		(?X_I (?X_G ((ADV-A (FROM.P ?L1)) GET.18.V) ?X_J))
		(?X_D (?X_J ((ADV-A (FOR.P (KA MOVE.V))) START.V)))
		(?X_B (?X_J STOP.V))
		(?E_1 (?X_J ((ADV-A (FROM.P ?L1)) MOVE.19.V) ?L2))
	)
)



; "Mary loves to cook."
; "Her husband likes to eat."
; "Mary cooked for her family today."
; "Her husband enjoyed what Mary prepared."
(EPI-SCHEMA ((?X_F
              (COMPOSITE-SCHEMA.PR (ANS-TO (?X_I (PREPARE.V ?X_A))) (KA COOK.V)
               (KA EAT.V) ?F))
             ** ?E)
	(:ROLES
		(!R1 (?X_F HUSBAND.N))
		(!R2 (?X_G FAMILY.N))
		(!R3 (?X_F (PERTAIN-TO ?X_I)))
		(!R4 (?X_G (PERTAIN-TO ?X_I)))
		(!R5 (?X_H TODAY.N))
		(!R6 (?X_I AGENT.N))
		(!R7 ((KA COOK.V) ACTION.N))
		(!R8 ((KA EAT.V) ACTION.N))
		(!R9 (?F FOOD.N))
	)
	(:STEPS
		(?X_B (?X_I LOVE.1.V (KA COOK.V)))
		(?X_C (?X_F LIKE.2.V (KA EAT.V)))
		(?X_D ((ADV-E ({DURING}.P ?X_H)) (?X_I ((ADV-A (FOR.P ?X_G)) COOK.V))))
		(?X_E (?X_F (ENJOY.V (ANS-TO (?X_I (PREPARE.V ?X_A))))))
		(?E_1 (?X_F EAT.3.V ?F))
	)
)

; "Tom liked to play sports."
; "He played football."
; "He played basketball."
; "He played baseball."
; "He played softball."
; "He played soccer."
; "He played tennis."
; "He played golf."
(EPI-SCHEMA ((?X (PLAY.V ?X_X)) ** ?E)
	(:ROLES
		(!R1 (?X_X (PLUR SPORT.N)))
		(!R2 (?X_E FOOTBALL.N))
		(!R3 (?X_H BASKETBALL.N))
		(!R4 (?X_K BASEBALL.N))
		(!R5 (?X_N SOFTBALL.N))
		(!R6 (?X_Q SOCCER.N))
		(!R7 (?X_T TENNIS.N))
		(!R8 (?X_W GOLF.N))
		(!R9 ((KA (PLAY.V ?X_X)) ACTION.N))
		(!R10 (?X AGENT.N))
		(!R11 (?X_Y AGENT.N))
	)
	(:STEPS
		(?X_B (?X_Y LIKE.4.V (KA (PLAY.V ?X_X))))
		(?E_1 (?X PLAY.5.V))
		(?X_D (?X_Y PLAY.6.V))
		(?X_G (?X_Y PLAY.7.V))
		(?X_J (?X_Y PLAY.8.V))
		(?X_M (?X_Y PLAY.9.V))
		(?X_P (?X_Y PLAY.10.V))
		(?X_S (?X_Y PLAY.11.V))
		(?X_V (?X_Y PLAY.12.V))
	)
)

; "Mary served food at a party."
; "Everyone liked what she served."
; "Her husband told everyone that he liked what she served."
(EPI-SCHEMA ((?X_G (SERVE.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_F HUSBAND.N))
		(!R2 (?X_E FOOD.N))
		(!R3 (?X_J PARTY.N))
		(!R4 (?X_G AGENT.N))
		(!R5 (?X_F (PERTAIN-TO ?X_G)))
		(!R6 (?X_J AGENT.N))
		(!R7 ((IND (7 EXPERIENCER_FOCUS)) ACTION.N))
	)
	(:STEPS
		(?X_D (?X_G (((ADV-A (AT.P ?X_J)) SERVE.V) ?X_E)))
		(?X_I ((EVERY.D PERSON.N) LIKE.13.V (ANS-TO (?X_G (SERVE.V ?X_A)))))
		(?X_I ((EVERY.D PERSON.N) (LIKE.14.V ?Y (ANS-TO (?X_G (SERVE.V ?X_A))))))
		(?X_B
   (?X_F
    (TELL.V (EVERY.D PERSON.N)
     (THAT (?X_F (LIKE.V (ANS-TO (?X_G (SERVE.V ?X_A)))))))))
		(?E_1 (?X_J ENJOY_ACTION.15.V (IND (7 EXPERIENCER_FOCUS))))
	)
)

; "Mary's friend is a chef."
; "Mary wants to learn how to cook."
; "She learned some recipes from her friend."
; "She tried her new recipe."
; "It was delicious."
(EPI-SCHEMA ((?X_F (((ADV-A (FROM.P ?X_E)) LEARN.V) ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_E FRIEND.N))
		(!R2 (?X_C (PLUR RECIPE.N)))
		(!R3 (?X_F AGENT.N))
		(!R4 (?X_D (PERTAIN-TO ?X_F)))
		(!R5 (?X_E (PERTAIN-TO ?X_F)))
		(!R6 (?X_G (PERTAIN-TO ?X_F)))
		(!R7 (?X_G ?X_H RECIPE.N))
	)
	(:STEPS
		(?X_A (?X_F (((ADV-A (FROM.P ?X_E)) LEARN.V) ?X_C)))
		(?X_B (?X_F (TRY.V ?X_G)))
	)
)

; "Alfred is an artist."
; "He paints pictures on canvas."
; "He paints pictures that look real."
; "He paints pictures of flowers."
; "He painted a picture of a flower."
(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA.PR ?X_A ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_A ARTIST.N))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_E PICTURE.N))
		(!R4 (?X_E (OF.P ?X_F)))
	)
	(:STEPS
		(?X_C (?X_D (= ?X_A)))
		(?X_H (?X_D (PAINT.V ?X_E)))
	)
)

; "Karen liked to play tennis."
; "She played with friends."
; "Her coach gave her some advice."
(EPI-SCHEMA ((?X_I (((ADV-A (WITH.P ?X_E)) PLAY.V) ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_B ADVICE.N))
		(!R2 (?X_F COACH.N))
		(!R3 (?X_E (PLUR FRIEND.N)))
		(!R4 (?X_F (PERTAIN-TO ?X_I)))
		(!R5 (?X_J TENNIS.N))
		(!R6 (?X_I AGENT.N))
		(!R7 ((KA (PLAY.V ?X_J)) ACTION.N))
		(!R8 (?X AGENT.N))
	)
	(:STEPS
		(?X_H (?X_I LIKE.16.V (KA (PLAY.V ?X_J))))
		(?X_D (?X_I ((ADV-A (WITH.P ?X_E)) PLAY.V)))
		(?X_A (?X_F (GIVE.V ?X_I ?X_B)))
		(?E_1 (?X PLAY.5.V))
	)
)

; "'Mary's friends came over for dinner."
; "Mary served them food."
; "Mary's friend liked what Mary served."
; "Mary's friend told Mary that she would come again soon."
(EPI-SCHEMA ((?X_L (SERVE.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D FOOD.N))
		(!R2 (?X_L AGENT.N))
		(!R3 (?X_G DINNER.N))
		(!R4 (?X_H (PLUR FRIEND.N)))
		(!R5 (?X_H (PERTAIN-TO ?X_L)))
		(!R6 (?X_K FRIEND.N))
		(!R7 (?X_K (PERTAIN-TO ?X_L)))
	)
	(:STEPS
		(?X_F (?X_H ((ADV-A (FOR.P ?X_G)) COME_OVER.V)))
		(?X_C (?X_L (SERVE.V ?X_H ?X_D)))
		(?X_J (?X_K LIKE.17.V (ANS-TO (?X_L (SERVE.V ?X_A)))))
		(?X_J (?X_K (LIKE.18.V ?Y (ANS-TO (?X_L (SERVE.V ?X_A))))))
	)
)

; "John is an athlete."
; "He plays soccer."
; "He has a goal."
; "He scored a goal."
(EPI-SCHEMA ((?X_M (PLAY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C GOAL.N))
		(!R2 (?X_F GOAL.N))
		(!R3 (?X_I ATHLETE.N))
		(!R4 (?X_L SOCCER.N))
		(!R5 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_H (?X_M (= ?X_I)))
		(?X_K (?X_M PLAY.19.V))
		(?X_E (?X_M (HAVE.V ?X_F)))
		(?X_B (?X_M (SCORE.V ?X_C)))
	)
)

; "Tom is eating food."
; "He has a spoonful of soup."
; "He eats some bread."
; "He drinks milk."
; "He finishes eating."
(EPI-SCHEMA ((?X_M (EAT.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_E SOUP.N))
		(!R2 (?X_K SPOONFUL.N))
		(!R3 (?X_K (OF.P ?X_E)))
		(!R4 (?X_L BREAD.N))
		(!R5 (?X_J FOOD.N))
		(!R6 (?X_K FOOD.N))
		(!R7 (?X_L FOOD.N))
		(!R8 (?X_M AGENT.N))
		(!R9 (?F FOOD.N))
	)
	(:STEPS
		(?X_D (?X_M EAT.20.V ?X_J))
		(?X_G (?X_M HAVE.21.V ?X_K))
		(?X_I (?X_M EAT.20.V ?X_L))
		(?X_B (?X_M ((ADV-A (FOR.P (KA EAT.V))) FINISH.V)))
		(?E_1 (?X_M EAT.3.V ?F))
	)
)

; "Susan is allergic to cats."
; "She does not want any pets."
; "But she has a dog."
; "Susan wants to keep the dog."
(EPI-SCHEMA ((?X_H (WANT.V (NO.D (PLUR PET.N)))) ** ?E)
	(:ROLES
		(!R1 (?X_D DOG.N))
		(!R2 (?X_G (PLUR CAT.N)))
		(!R3 (?X_H ALLERGIC.A))
		(!R4 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_A (?X_H (TO.P ?X_G)))
		(?X_F (NOT (?X_H (WANT.V (ANY.D (PLUR PET.N))))))
		(?X_C (?X_H (WANT.V (KA (KEEP.V ?X_D)))))
		(?E_1 (?X_H KEEP.22.V ?X_D))
	)
)

; "Bob likes to play baseball."
; "He plays softball."
; "He plays with other kids."
; "He plays catch with his friends."
; "He hits the ball."
; "He runs fast."
; "He catches the ball."
(EPI-SCHEMA ((?X_T (PLAY.V ?X_S)) ** ?E)
	(:ROLES
		(!R1 (?X_D BALL.N))
		(!R2 (?X_G BALL.N))
		(!R3 (?X_S BASEBALL.N))
		(!R4 (?X_L SOFTBALL.N))
		(!R5 (?X_O CATCH.N))
		(!R6 (?X_P (PLUR FRIEND.N)))
		(!R7 (?X_P (PERTAIN-TO ?X_T)))
		(!R8 ((KA (PLAY.V ?X_S)) ACTION.N))
		(!R9 (?X AGENT.N))
		(!R10 (?X_T AGENT.N))
		(!R11 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_I (?X_T LIKE.23.V (KA (PLAY.V ?X_S))))
		(?E_1 (?X PLAY.5.V))
		(?X_K (?X_T PLAY.24.V))
		(?X_N (?X_T PLAY.25.V))
		(?X_A (?X_T PLAY.26.V))
		(?X_F (?X_T (HIT.V ?X_G)))
		(?X_R (?X_T ((ADV-A (FROM.P ?L1)) RUN.27.V) ?L2))
		(?X_C (?X_T (CATCH.V ?X_D)))
	)
)

; "Susan likes animals."
; "She loves dogs."
; "She doesn't have a cat."
; "She has a small dog."
(EPI-SCHEMA ((?X_M (LOVE.V (KA (HAVE.V (SET-OF ?X_J ?X_L))))) ** ?E)
	(:ROLES
		(!R1 (?X_C SMALL.A))
		(!R2 (?X_C DOG.N))
		(!R3 (?X_K (PLUR ANIMAL.N)))
		(!R4 (?X_L (PLUR DOG.N)))
		(!R5 (?X_J CAT.N))
		(!R6 (NOT (?X_K ACTION.N)))
		(!R7 (NOT (?X_L ACTION.N)))
		(!R8 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_E (?X_M LIKE.28.V ?X_K))
		(?X_G (?X_M LOVE.29.V ?X_L))
		(?X_I (?X_M HAVE.30.V ?X_J))
		(?X_B (?X_M (HAVE.V ?X_C)))
	)
)

; "Susan's cat scratched her."
; "She had an allergy attack."
; "She had trouble breathing."
; "She called 911."
; "An ambulance came."
; "A doctor treated Susan."
(EPI-SCHEMA ((?X_F (HAVE.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_C DOCTOR.N))
		(!R2 (?X_F AGENT.N))
		(!R3 (?X_I TROUBLE.N))
		(!R4 (?X_L ALLERGY.N))
		(!R5 (?X_L ATTACK.N))
		(!R6 (?X_O AGENT.N))
		(!R7 (?X_M (PERTAIN-TO ?X_O)))
		(!R8 (?X_N (PERTAIN-TO ?X_O)))
		(!R9 (?X_R AMBULANCE.N))
		(!R10 (?X_R AGENT.N))
		(!R11 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_K (?X_O (HAVE.V ?X_L)))
		(?X_H (?X_O (HAVE.V (KE (?X_I BREATHE.V)))))
		(?X_E (?X_O (CALL.V ?X_F)))
		(?X_Q (?X_R ((ADV-A (FROM.P ?L1)) COME.31.V) ?L2))
		(?X_B (?X_C (TREAT.V ?X_O)))
	)
)

; "John loves dogs."
; "His neighbor's dog bit him."
; "He started to cry."
; "The dog left John alone."
(EPI-SCHEMA ((?X_G (LOVE.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C DOG.N))
		(!R2 (?X_C (BIT.N ?X_G)))
		(!R3 (?X_D NEIGHBOR.N))
		(!R4 (?X_D DOG.N))
		(!R5 (?X_D (PERTAIN-TO ?X_G)))
		(!R6 (?X_C (PERTAIN-TO ?X_D)))
		(!R7 (?X_H (PLUR DOG.N)))
		(!R8 (?X_G AGENT.N))
		(!R9 (NOT (?X_H ACTION.N)))
	)
	(:STEPS
		(?X_F (?X_G LOVE.32.V ?X_H))
		(?X_B (?X_G ((ADV-A (FOR.P (KA CRY.V))) START.V)))
	)
)

; "Peter loves cats."
; "He likes to play with them."
; "He brings them food."
; "He lets them sleep on his bed."
(EPI-SCHEMA ((?X_I (LOVE.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_H (PLUR CAT.N)))
		(!R2 (NOT (?X_H ACTION.N)))
		(!R3 ((KA ((ADV-A (WITH.P ?X_G)) PLAY.V)) ACTION.N))
		(!R4 (?X_G ENTITY.N))
		(!R5 (?X_G SMALLER-THAN.N ?X_I))
		(!R6 (?X_H DESTINATION.N))
		(!R7 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_B (?X_I LOVE.33.V ?X_H))
		(?X_D (?X_I LIKE.34.V (KA ((ADV-A (WITH.P ?X_G)) PLAY.V))))
		(?E_1 (?X_I PLAY.35.V))
		(?X_F (?X_I BRING.36.V ?X_G ?X_H))
	)
)

; "Tom's family had no pets."
; "There were no dogs or cats in Tom's house."
; "Tom's parents did not allow him to have a pet."
; "Tom did not like pets."
(EPI-SCHEMA ((?X_K (HAVE.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C PET.N))
		(!R2 (?X_D (PLUR PARENT.N)))
		(!R3 (?X_D (PERTAIN-TO ?X_K)))
		(!R4 (?X_G FAMILY.N))
		(!R5 (?X_G (PERTAIN-TO ?X_K)))
		(!R6 (?X_H HOUSE.N))
		(!R7 (?X_H (PERTAIN-TO ?X_K)))
		(!R8 (?X_L (PLUR PET.N)))
		(!R9 (?X_K AGENT.N))
		(!R10 (NOT (?X_L ACTION.N)))
	)
	(:STEPS
		(?X_F (?X_G (HAVE.V (NO.D (PLUR PET.N)))))
		(?X_B (NOT (?X_D (((ADV-A (FOR.P (KA (HAVE.V ?X_C)))) ALLOW.V) ?X_K))))
		(?E_1 (?X_K HAVE.37.V ?X_C))
		(?X_J (?X_K LIKE.38.V ?X_L))
	)
)

; "Peter loves dogs."
; "His dog likes to play."
; "His dog goes outside."
; "Peter's dog barks."
(EPI-SCHEMA ((?X_H ((ADV-A (WITH.P ?X_G)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G DOG.N))
		(!R2 (?X_I (PLUR DOG.N)))
		(!R3 (?X_G (PERTAIN-TO ?X_H)))
		(!R4 (?X_H AGENT.N))
		(!R5 (NOT (?X_I ACTION.N)))
		(!R6 ((KA PLAY.V) ACTION.N))
		(!R7 (?N NOISE.N))
	)
	(:STEPS
		(?X_D (?X_H LOVE.39.V ?X_I))
		(?X_A (?X_G LIKE.40.V (KA PLAY.V)))
		(?X_B (?X_G (OUTSIDE.ADV GO.V)))
		(?E_1 (?X_G PLAY.35.V))
		(?X_F (?X_G BARK.41.V ?N))
	)
)



; "I was watching TV one night."
; "I saw an ad for a movie."
(EPI-SCHEMA ((?X_G (WATCH.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_F MOVIE.N))
		(!R2 (?X_E AD.N))
		(!R3 (?X_E (FOR.P ?X_F)))
		(!R4 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_B ((ADV-E ({DURING}.P ?X_A)) (?X_G WATCH.V)))
		(?X_D (?X_G SEE.1.V ?X_E))
	)
)

; "Mike watched TV."
; "He liked cartoons."
; "He watched some shows on TV."
; "He watched a show about a dog."
(EPI-SCHEMA ((?X_K (WATCH.V ?X_O)) ** ?E)
	(:ROLES
		(!R1 (?X_C SHOW.N))
		(!R2 (?X_C (ABOUT.P ?X_D)))
		(!R3 (?X_G (PLUR SHOW.N)))
		(!R4 (?X_H TV.N))
		(!R5 (?X_K AGENT.N))
		(!R6 (?X_O (PLUR CARTOON.N)))
		(!R7 (?X_O OBJECT.N))
		(!R8 (?X_N AGENT.N))
		(!R9 (NOT (?X_O ACTION.N)))
		(!R10 (NOT (?X_O AGENT.N)))
	)
	(:STEPS
		(?X_J (?X_N (WATCH.V ?X_K)))
		(?X_M (?X_N LIKE.2.V ?X_O))
		(?X_F (?X_N (((ADV-A (ON.P ?X_H)) WATCH.V) ?X_G)))
		(?X_B (?X_N (WATCH.V ?X_C)))
	)
)

; "Matt watched a movie on TV."
; "It was scary."
; "It was funny."
; "He liked the movie."
(EPI-SCHEMA ((?X_F (LIKE.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_G SCARY.A))
		(!R2 (?X_G FUNNY.A))
		(!R3 (?X_G MOVIE.N))
		(!R4 (?X_C TV.N))
		(!R5 (?X_F AGENT.N))
		(!R6 (NOT (?X_G ACTION.N)))
		(!R7 (NOT (?X_G AGENT.N)))
	)
	(:STEPS
		(?X_B (?X_F (((ADV-A (ON.P ?X_C)) WATCH.V) ?X_G)))
		(?X_E (?X_F LIKE.3.V ?X_G))
	)
)

; "Bill watched TV."
; "He liked cartoons on TV."
; "He watched them all the time."
; "He couldn't stop watching them."
(EPI-SCHEMA ((?X_D (WATCH.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_A TV.N))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_H BILL.N))
		(!R4 (?X_G (PLUR CARTOON.N)))
		(!R5 (?X_G OBJECT.N))
		(!R6 (NOT (?X_G ACTION.N)))
		(!R7 (NOT (?X_G AGENT.N)))
		(!R8 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_C (?X_H (WATCH.V ?X_D)))
		(E88.SK (NOT (?X_H (CAN.MD ((ADV-A (FOR.P (KA (WATCH.V ?X_A)))) STOP.V)))))
		(?X_F (?X_H LIKE.4.V ?X_G))
	)
)

; "Jill watched television all the time."
; "She liked to watch movies."
; "She watched a scary movie."
; "When she turned on the television, she found something interesting."
(EPI-SCHEMA ((?X_G (LIKE.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C SCARY.A))
		(!R2 (?X_C MOVIE.N))
		(!R3 (?X_F (PLUR MOVIE.N)))
		(!R4 ((KA (WATCH.V ?X_F)) ACTION.N))
		(!R5 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_E (?X_G LIKE.5.V (KA (WATCH.V ?X_F))))
		(?X_B (?X_G (WATCH.V ?X_C)))
	)
)

; "Bill watched TV on the couch."
; "He fell asleep."
; "He woke up."
; "He saw a commercial."
; "Another commercial came on."
; "He turned off the TV."
(EPI-SCHEMA ((?X_N WAKE_UP.V) ** ?E)
	(:ROLES
		(!R1 (?X_C TV.N))
		(!R2 (?X_J ASLEEP.A))
		(!R3 (?X_M COMMERCIAL.N))
		(!R4 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_I (?X_N (FALL.V ?X_J)))
		(?X_G (?X_N WAKE_UP.V))
		(?X_L (?X_N SEE.6.V ?X_M))
		(?X_E ((ANOTHER.D COMMERCIAL.N) COME_ON.V))
		(?X_B (?X_N (TURN_OFF.V ?X_C)))
	)
)

; "A man watched television."
; "He saw an ad for a movie."
; "He went to the theater."
; "He paid $10 for tickets."
; "He found a seat."
(EPI-SCHEMA ((?X_D (COMPOSITE-SCHEMA.PR ?X_C ?X_G ?X_N ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_C TELEVISION.N))
		(!R2 (?X_D MAN.N))
		(!R3 (?X_H MOVIE.N))
		(!R4 (?X_G AD.N))
		(!R5 (?X_G (FOR.P ?X_H)))
		(!R6 (?X_N THEATER.N))
		(!R7 (?X_K SEAT.N))
		(!R8 (?X_N DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_D (WATCH.V ?X_C)))
		(?X_F (?X_D SEE.7.V ?X_G))
		(?X_J (?X_D ((ADV-A (FROM.P ?L1)) GO.8.V) ?X_N))
		(?X_M (?X_D FIND.9.V ?X_K))
	)
)

; "Alice watched television."
; "She liked the shows on TV."
; "She heard that there were new shows coming out soon."
; "She wanted to watch them."
(EPI-SCHEMA ((?X_O (WATCH.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_E NEW.A))
		(!R2 (?X_H ?X_I (PLUR SHOW.N)))
		(!R3 (?X_L TELEVISION.N))
		(!R4 (?X_P (PLUR SHOW.N)))
		(!R5 (?X_P OBJECT.N))
		(!R6 (?X_O AGENT.N))
		(!R7 (NOT (?X_P ACTION.N)))
		(!R8 (NOT (?X_P AGENT.N)))
	)
	(:STEPS
		(?X_K (?X_O (WATCH.V ?X_L)))
		(?X_N (?X_O LIKE.10.V ?X_P))
		(?X_G (?X_O (HEAR.V (THAT (?X_A (BE.V ?X_H))))))
		(?X_B (?X_H ((ADV (OUT.ADV SOON.A)) COME.V)))
		(?X_D (?X_O (WANT.V (KA (WATCH.V ?X_E)))))
	)
)

; "Sue watched television."
; "She liked television programs."
; "She never missed a show."
; "She watched many shows."
(EPI-SCHEMA ((?X_I (LIKE.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C MANY.A))
		(!R2 (?X_C (PLUR SHOW.N)))
		(!R3 (?X_F SHOW.N))
		(!R4 (?X_J TELEVISION.N))
		(!R5 (?X_J (PLUR PROGRAM.N)))
		(!R6 (?X_I AGENT.N))
		(!R7 (NOT (?X_J ACTION.N)))
		(!R8 (NOT (?X_J AGENT.N)))
	)
	(:STEPS
		(?X_H (?X_I LIKE.11.V ?X_J))
		(?X_E (?X_I ((NEVER.ADV MISS.V) ?X_F)))
		(?X_B (?X_I (WATCH.V ?X_C)))
	)
)



; "I was walking through the park."
; "I saw a bench."
; "I sat down."
; "I started talking to myself."
(EPI-SCHEMA ((?X_I SIT_DOWN.V) ** ?E)
	(:ROLES
		(!R1 (?X_H BENCH.N))
		(!R2 (?L2 DESTINATION.N))
		(!R3 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_A (?X_I ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_G (?X_I SEE.2.V ?X_H))
		(?X_E (?X_I (DOWN.ADV SIT.V)))
		(?X_C (?X_I ((ADV-A (FOR.P (KA ((ADV-A (TO.P ?X_I)) TALK.V)))) START.V)))
	)
)

; "Tom walked along the street."
; "He saw a bench."
; "He sat on the bench."
; "He talked to himself."
(EPI-SCHEMA ((?X_J ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E BENCH.N))
		(!R2 (?L2 DESTINATION.N))
		(!R3 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_G (?X_J ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_I (?X_J SEE.3.V ?X_E))
		(?X_D (?X_J ((ADV-A (ON.P ?X_E)) SIT.V)))
		(?X_B (?X_J ((ADV-A (TO.P ?X_J)) TALK.V)))
	)
)

; "Mary was having trouble with her homework."
; "She couldn't do it."
; "She talked to herself."
; "She tried hard."
; "But she couldn't finish her homework."
(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA.PR ?X_B ?X_A ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_B TROUBLE.N))
		(!R2 (?X_G AGENT.N))
		(!R3 (?X_H HARD.A))
	)
	(:STEPS
		(?X_D (?X_G (HAVE.V ?X_B)))
		(E74.SK (NOT (?X_G ((CAN.MD DO.V) ?X_A))))
		(?X_F (?X_G ((ADV-A (TO.P ?X_G)) TALK.V)))
		(?X_J (?X_G (TRY.V ?X_H)))
	)
)

; "Tom walked into the park."
; "He found a bench."
; "He sat on the bench."
; "He looked around."
; "He talked to himself."
(EPI-SCHEMA ((?X_M ((ADV-A (THROUGH.P ?X_L)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G BENCH.N))
		(!R2 (?X_L PARK.N))
		(!R3 (?X_L DESTINATION.N))
		(!R4 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_I (?X_M ((ADV-A (FROM.P ?L1)) WALK.4.V) ?X_L))
		(?X_K (?X_M FIND.5.V ?X_G))
		(?X_F (?X_M ((ADV-A (ON.P ?X_G)) SIT.V)))
		(?X_D (?X_M (AROUND.ADV LOOK.V)))
		(?X_B (?X_M ((ADV-A (TO.P ?X_M)) TALK.V)))
	)
)

; "Peter walked around the park."
; "He saw a bench."
; "He sat on the bench."
; "He talked to himself."
; "The sun shone."
; "He looked at the sky."
(EPI-SCHEMA ((?X_M ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C SKY.N))
		(!R2 (?X_H BENCH.N))
		(!R3 (?X_M AGENT.N))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_J (?X_M ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_L (?X_N SEE.6.V ?X_H))
		(?X_G (?X_N ((ADV-A (ON.P ?X_H)) SIT.V)))
		(?X_E (?X_N ((ADV-A (TO.P ?X_N)) TALK.V)))
		(?X_B (?X_N ((ADV-A (AT.P ?X_C)) LOOK.V)))
	)
)

; "Alfred walked around the park."
; "There were lots of trees there."
; "Alfred saw some flowers."
; "He picked them and put them in his pocket."
(EPI-SCHEMA ((?X_L (PICK.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR FLOWER.N)))
		(!R2 (?X_I (PLUR LOT.N)))
		(!R3 (?X_M POCKET.N))
		(!R4 (?X_M (PERTAIN-TO ?X_L)))
		(!R5 (?L2 DESTINATION.N))
		(!R6 (?X_L AGENT.N))
		(!R7 (?X_M LOCATION.N))
	)
	(:STEPS
		(?X_K (?X_L ((ADV-A (FROM.P ?L1)) WALK.1.V) ?L2))
		(?X_H (?X_A (BE.V ?X_I)))
		(?X_E (?X_L (SEE.V ?X_F)))
		(?X_B (?X_L (PICK.V ?X_F)))
		(?X_C (?X_L PUT.7.V ?X_F ?X_M))
	)
)

; "A woman walked into the park."
; "She saw some kids playing on the playground equipment."
; "She watched them for awhile."
(EPI-SCHEMA ((?X_G PLAY.V) ** ?E)
	(:ROLES
		(!R1 (?X_H PARK.N))
		(!R2 (?X_F WOMAN.N))
		(!R3 (?X_G (PLUR KID.N)))
		(!R4 (?X_H DESTINATION.N))
	)
	(:STEPS
		(?X_C (?X_F ((ADV-A (FROM.P ?L1)) WALK.4.V) ?X_H))
		(?X_E (?X_F SEE.8.V ?X_G))
		(?X_A (?X_G PLAY.9.V))
	)
)

; "John walked into a bar."
; "He looked around."
; "There were many people there."
; "The bartender asked John what he would have."
; "John ordered a beer."
; "He drank it."
; "Then he left the bar."
(EPI-SCHEMA ((?X_L ((ADV-A (INTO.P ?X_M)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C BEER.N))
		(!R2 (?X_M BAR.N))
		(!R3 (?X_M DESTINATION.N))
		(!R4 (?X_L AGENT.N))
		(!R5 (NOT (?X_M = ?L2)))
		(!R6 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_G (?X_L ((ADV-A (FROM.P ?L1)) WALK.4.V) ?X_M))
		(?X_E (?X_L (AROUND.ADV LOOK.V)))
		(?X_B (?X_L (ORDER.V ?X_C)))
		(?X_I (?X_L DRANK.10.V ?X_C))
		(?X_K (?X_L ((ADV-A (FROM.P ?X_M)) LEAVE.11.V) ?L2))
	)
)

; "The man's car broke down."
; "He called AAA."
; "AAA sent someone to fix it."
; "The man waited."
(EPI-SCHEMA ((?X_G (CALL.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_F CAR.N))
		(!R2 (?X_C AAA.A))
		(!R3 (?X_G MAN.N))
		(!R4 (?X_F (PERTAIN-TO ?X_G)))
	)
	(:STEPS
		(?X_B (?X_F BREAK_DOWN.V))
		(?X_E (?X_G (CALL.V ?X_C)))
		(?X_I (?X_G WAIT.V))
	)
)

; "Tom's car broke down."
; "He couldn't find AAA."
; "A man came to help him."
; "The man helped Tom."
; "Tom thanked him for helping him."
(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA.PR (K AAA.A) ?X_E ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_E MAN.N))
		(!R2 (?X_K AGENT.N))
		(!R3 (?X_H CAR.N))
		(!R4 (?X_H (PERTAIN-TO ?X_K)))
		(!R5 (?X_K DESTINATION.N))
	)
	(:STEPS
		(?X_G (?X_H BREAK_DOWN.V))
		(E354.SK (NOT (?X_K ((CAN.MD FIND.V) (K AAA.A)))))
		(?X_J (?X_E ((ADV-A (FROM.P ?L1)) COME.14.V) ?X_K))
		(?X_D (?X_E (HELP.V ?X_K)))
		(?X_B (?X_K (((ADV-A (FOR.P (KA (HELP.V ?X_K)))) THANK.V) ?X_E)))
	)
)



; "One morning, the sun rose early."
; "It shone brightly through the window."
; "The birds sang loudly outside."
; "The sun warmed the room."
(EPI-SCHEMA ((?X_F ((ADV-A (THROUGH.P ?X_E)) SHINE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D ROOM.N))
		(!R2 (?X_E WINDOW.N))
		(!R3 (?X_F SUN.N))
		(!R4 (?X_G MORNING.N))
		(!R5 (?X_J (PLUR BIRD.N)))
		(!R6 (?N NOISE.N))
	)
	(:STEPS
		(?X_A ((ADV-E ({DURING}.P ?X_G)) (?X_F (EARLY.ADV RISE.V))))
		(E6.SK (?X_F (BRIGHTLY.ADV ((ADV-A (THROUGH.P ?X_E)) SHONE.V))))
		(?X_I (?X_J SING.1.V ?N))
		(?X_C (?X_F (WARM.V ?X_D)))
	)
)

; "Tom woke up early on Saturday morning."
; "He looked out the window."
; "Sunlight came into the room."
; "He saw a beautiful sunrise."
(EPI-SCHEMA ((?X_I (LOOK.V (K (OUT.P OF.P ?X_H)))) ** ?E)
	(:ROLES
		(!R1 (?X_H WINDOW.N))
		(!R2 (?X_G SUNLIGHT.N))
		(!R3 (?X_J BEAUTIFUL.A))
		(!R4 (?X_J SUNRISE.N))
		(!R5 (?X_G AGENT.N))
		(!R6 (?X_H DESTINATION.N))
		(!R7 (?X_I AGENT.N))
		(!R8 (?X_J ENTITY.N))
	)
	(:STEPS
		(?X_B (?X_I ((ADV-A (OUT.P ?X_H)) LOOK.V)))
		(?X_D (?X_G ((ADV-A (FROM.P ?L1)) COME.2.V) ?X_H))
		(?X_F (?X_I SEE.3.V ?X_J))
	)
)

; "Tom woke up."
; "He looked at the clock."
; "It was 7:00 am."
; "He got dressed and went downstairs."
; "He ate breakfast."
(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA.PR (KJ DRESSED.A) ?X_K ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_E CLOCK.N))
		(!R2 (?X_K (PLUR DOWNSTAIR.N)))
		(!R3 (?X_H BREAKFAST.N))
		(!R4 (?X_K DESTINATION.N))
		(!R5 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_G (?X_L WAKE_UP.V))
		(?X_D (?X_L ((ADV-A (AT.P ?X_E)) LOOK.V)))
		(?X_A (?X_L (GET.V (KJ DRESSED.A))))
		(?X_B (?X_L ((ADV-A (FROM.P ?L1)) GO.4.V) ?X_K))
		(?X_J (?X_L EAT.5.V ?X_H))
	)
)

; "Alice woke up one morning."
; "She saw the sun shining bright."
; "She looked at the clock on the nightstand."
; "It was 5:30 am."
(EPI-SCHEMA ((?X_L ((ADV-A (DURING.P ?X_I)) WAKE_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D NIGHTSTAND.N))
		(!R2 (?X_E CLOCK.N))
		(!R3 (?X_F BRIGHT.A))
		(!R4 (?X_M SUN.N))
		(!R5 (?X_I MORNING.N))
		(!R6 (?X_L AGENT.N))
		(!R7 (?X_M ENTITY.N))
	)
	(:STEPS
		(?X_H ((ADV-E ({DURING}.P ?X_I)) (?X_L WAKE_UP.V)))
		(?X_A (?X_M (SHINE.V ?X_F)))
		(?X_K (?X_L SEE.6.V ?X_M))
		(?X_C (?X_L ((ADV-A (AT.P ?X_E)) ((ADV-A (ON.P ?X_D)) LOOK.V))))
	)
)

; "In the evening, the sun set."
; "At night, the moon came up."
; "The stars were bright."
(EPI-SCHEMA ((?X_A SET.V) ** ?E)
	(:ROLES
		(!R1 (?X_A SUN.N))
		(!R2 (?X_B EVENING.N))
		(!R3 (?X_E MOON.N))
		(!R4 (?X_F NIGHT.N))
	)
	(:STEPS
		(?X_D (?X_A ((ADV-A (IN.P ?X_B)) SET.V)))
		(?X_H (?X_E ((ADV-A (AT.P ?X_F)) COME_UP.V)))
	)
)

; "Rita woke up early."
; "She looked out the window."
; "There were many clouds in the sky."
; "The sun was shining bright."
(EPI-SCHEMA ((?X_D (EARLY.ADV WAKE_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D AGENT.N))
		(!R2 (?X_E WINDOW.N))
		(!R3 (?X_I (IN.P ?X_H)))
		(!R4 (?X_I ?X_J (PLUR CLOUD.N)))
		(!R5 (?X_M SUN.N))
		(!R6 (?X_N BRIGHT.A))
	)
	(:STEPS
		(?X_C (?X_D (EARLY.ADV WAKE_UP.V)))
		(?X_G (?X_D ((ADV-A (OUT.P ?X_E)) LOOK.V)))
		(?X_L (?X_A (BE.V ?X_I)))
		(?X_P (?X_M (SHINE.V ?X_N)))
	)
)

; "Karen woke up early one morning."
; "She looked out the window."
; "The sky was clear."
; "There were bright stars in the sky."
(EPI-SCHEMA ((?X_B (COMPOSITE-SCHEMA.PR ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_B AGENT.N))
		(!R2 (?X_C WINDOW.N))
		(!R3 (?X_G (IN.P ?X_F)))
		(!R4 (?X_G ?X_H (PLUR STAR.N)))
	)
	(:STEPS
		(?X_E (?X_B ((ADV-A (OUT.P ?X_C)) LOOK.V)))
		(?X_J (?X_A (BE.V ?X_G)))
	)
)

; "Alice woke up one morning."
; "She looked at the clock."
; "It was 7 o'clock."
; "She went to school."
(EPI-SCHEMA ((?X_J ((ADV-A (DURING.P ?X_F)) WAKE_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C CLOCK.N))
		(!R2 (?X_F MORNING.N))
		(!R3 (?X_I SCHOOL.N))
		(!R4 (?X_I DESTINATION.N))
		(!R5 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_E ((ADV-E ({DURING}.P ?X_F)) (?X_J WAKE_UP.V)))
		(?X_B (?X_J ((ADV-A (AT.P ?X_C)) LOOK.V)))
		(?X_H (?X_J ((ADV-A (FROM.P ?L1)) GO.4.V) ?X_I))
	)
)

; "Timmy woke up early on Saturday morning."
; "He looked at the clock."
; "It was 6:30 AM."
; "He put on his clothes."
; "He walked downstairs."
; "He saw his dad sleeping in bed."
(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA.PR ?X_K ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C BED.N))
		(!R2 (?X_H DAD.N))
		(!R3 (?X_G (PLUR CLOTHE.N)))
		(!R4 (?X_F CLOCK.N))
		(!R5 (?X_G (PERTAIN-TO ?X_L)))
		(!R6 (?X_H (PERTAIN-TO ?X_L)))
		(!R7 (?X_K (PLUR DOWNSTAIR.N)))
		(!R8 (?X_K DESTINATION.N))
		(!R9 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_E (?X_L ((ADV-A (AT.P ?X_F)) LOOK.V)))
		(?X_A (?X_L ((ADV-A (ON.P ?X_G)) PUT.V)))
		(?X_J (?X_L ((ADV-A (FROM.P ?L1)) WALK.7.V) ?X_K))
		(?X_B (?X_L (KA SEE.V) ?X_H ((ADV-A (IN.P ?X_C)) SLEEP.V)))
		(?E_1 (?X_L SEE.8.V ?X_H))
	)
)

; "The man was walking along the street."
; "He saw a beautiful girl."
(EPI-SCHEMA ((?X_F ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E BEAUTIFUL.A))
		(!R2 (?X_E GIRL.N))
		(!R3 (?X_F MAN.N))
		(!R4 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_F ((ADV-A (FROM.P ?L1)) WALK.9.V) ?L2))
		(?X_D (?X_F SEE.10.V ?X_E))
	)
)

; "Jenny was on the bus."
; "She looked pretty."
; "She wore a dress."
; "The other kids were laughing at her."
(EPI-SCHEMA ((?X_K ((ADV-A (ON.P ?X_H)) BE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR KID.N)))
		(!R2 (?X_C OTHER.A))
		(!R3 (?X_H BUS.N))
		(!R4 (?X_L DRESS.N))
		(!R5 (?X_K AGENT.N))
		(!R6 (NOT (?X_L AGENT.N)))
	)
	(:STEPS
		(?X_G (?X_K ((ADV-A (ON.P ?X_H)) BE.V)))
		(?X_E (?X_K (PRETTY.ADV LOOK.V)))
		(?X_J (?X_K WEAR.11.V ?X_L))
		(?X_B (?X_C ((ADV-A (AT.P ?X_K)) LAUGH.V)))
	)
)

; "Karen liked to play softball."
; "She played on a team."
; "Her coach told her how to swing her bat."
; "She hit the ball hard."
; "She ran fast."
; "She scored lots of runs."
(EPI-SCHEMA ((?X_Q (PLAY.V ?X_P)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR LOT.N)))
		(!R2 (?X_C (OF.P ?X_D)))
		(!R3 (?X_G BALL.N))
		(!R4 (?X_P SOFTBALL.N))
		(!R5 (?X_L BAT.N))
		(!R6 (?X_L (PERTAIN-TO ?X_Q)))
		(!R7 (?X_M COACH.N))
		(!R8 (?X_M (PERTAIN-TO ?X_Q)))
		(!R9 ((KA (PLAY.V ?X_P)) ACTION.N))
		(!R10 (?X AGENT.N))
		(!R11 (?X_Q AGENT.N))
		(!R12 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_I (?X_Q LIKE.12.V (KA (PLAY.V ?X_P))))
		(?E_1 (?X PLAY.13.V))
		(?X_K (?X_Q PLAY.14.V))
		(?X_F (?X_Q ((HARD.ADV HIT.V) ?X_G)))
		(?X_O (?X_Q ((ADV-A (FROM.P ?L1)) RUN.15.V) ?L2))
		(?X_B (?X_Q (SCORE.V ?X_C)))
	)
)

; "Jack walked down the street."
; "There were lots of cars on the road."
; "A car drove by Jack."
; "The driver waved to him."
(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA.PR ?X_K ?L2)) ** ?E)
	(:ROLES
		(!R1 (?X_G DRIVER.N))
		(!R2 (?X_H CAR.N))
		(!R3 (?X_K (PLUR LOT.N)))
		(!R4 (?X_K (OF.P ?X_L)))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_N (?X_G ((ADV-A (FROM.P ?L1)) WALK.9.V) ?L2))
		(?X_J (?X_A (BE.V ?X_K)))
		(?X_F (?X_H ((ADV-A (BY.P ?X_G)) DRIVE.V)))
		(?X_D (?X_G ((ADV-A (TO.P ?X_B)) WAVE.V)))
	)
)

; "Bob walked down the street."
; "A pretty girl smiled at him."
; "He smiled back."
; "She waved at him."
; "He waved back."
; "She ran away from him."
(EPI-SCHEMA ((?X_N (BACK.ADV ((ADV-A (AT.P ?X_K)) SMILE.V))) ** ?E)
	(:ROLES
		(!R1 (?X_K GIRL.N))
		(!R2 (?X_K PRETTY.A))
		(!R3 (?X_N AGENT.N))
		(!R4 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_M (?X_N ((ADV-A (FROM.P ?L1)) WALK.9.V) ?L2))
		(?X_J (?X_K ((ADV-A (AT.P ?X_N)) SMILE.V)))
		(?X_H (?X_N (BACK.ADV SMILE.V)))
		(?X_F (?X_K ((ADV-A (AT.P ?X_N)) WAVE.V)))
		(?X_D (?X_N (BACK.ADV WAVE.V)))
		(?X_B (?X_K ((ADV-A (FROM.P ?X_N)) (AWAY.ADV RUN.V))))
	)
)



; "The man walked into town."
; "He stopped at a store."
; "He looked around."
; "He didn't find what he was looking for."
(EPI-SCHEMA ((?X_H ((ADV-A (FOR.P ?X_K)) LOOK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G STORE.N))
		(!R2 (?X_H MAN.N))
		(!R3 (?X_K TOWN.N))
		(!R4 (?X_K DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_H ((ADV-A (FROM.P ?L1)) WALK.1.V) ?X_K))
		(?X_F (?X_H ((ADV-A (AT.P ?X_G)) STOP.V)))
		(?X_D (?X_H (AROUND.ADV LOOK.V)))
		(?X_J (?X_H FIND.2.V (ANS-TO (?X_H ((ADV-A (FOR.P ?X_A)) LOOK.V)))))
		(?X_J
   (?X_H
    ((ADV-A (FOR.P (ANS-TO (?X_H ((ADV-A (FOR.P ?X_A)) LOOK.V))))) FIND.3.V)))
	)
)

; "Alfred lived near a store."
; "He liked to shop there."
; "He bought some things at the store."
; "He liked how easy it was to shop there."
(EPI-SCHEMA ((?X_L (((ADV-A (AT.P ?X_K)) BUY.V) ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR THING.N)))
		(!R2 (?X_K STORE.N))
		(!R3 (?X_K LOCATION.N))
		(!R4 ((KA (THERE.ADV SHOP.V)) ACTION.N))
		(!R5 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_F (?X_L LIVE.4.V ?X_K))
		(?X_H (?X_L LIKE.5.V (KA (THERE.ADV SHOP.V))))
		(?X_C (?X_L (((ADV-A (AT.P ?X_K)) BUY.V) ?X_D)))
		(?X_J
   (?X_L LIKE.6.V
    (ANS-TO
     (?X_A (((ADV-A (FOR.P (KA (THERE.ADV SHOP.V)))) BE.V) (HOW.ADV EASY.A))))))
	)
)

; "Tom went to the park."
; "There were many children there."
; "Tom played on the swings."
; "He liked the playground."
(EPI-SCHEMA ((?X_I ((ADV-A (TO.P ?X_H)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR SWING.N)))
		(!R2 (?X_H PARK.N))
		(!R3 (?X_J PLAYGROUND.N))
		(!R4 (?X_H DESTINATION.N))
		(!R5 (?X_I AGENT.N))
		(!R6 (NOT (?X_J ACTION.N)))
		(!R7 (NOT (?X_J AGENT.N)))
	)
	(:STEPS
		(?X_E (?X_I ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_H))
		(?X_B (?X_I ((ADV-A (ON.P ?X_C)) PLAY.V)))
		(?X_G (?X_I LIKE.8.V ?X_J))
	)
)

; "Bobby went to a store."
; "He looked around."
; "There were many things in the store."
; "He found what he wanted."
; "He bought some candy."
(EPI-SCHEMA ((?X_P ((ADV-A (TO.P ?X_P)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E CANDY.N))
		(!R2 (?X_J MANY.A))
		(!R3 (?X_K ?X_J (PLUR THING.N)))
		(!R4 (?X_P STORE.N))
		(!R5 (?X_K (IN.P ?X_P)))
		(!R6 (?X_P DESTINATION.N))
		(!R7 (?X_Q AGENT.N))
	)
	(:STEPS
		(?X_M (?X_Q ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_P))
		(?X_I (?X_Q (AROUND.ADV LOOK.V)))
		(?X_G (?X_A (BE.V ?X_K)))
		(?X_O (?X_Q FIND.9.V (ANS-TO (?X_Q (WANT.V ?X_B)))))
		(?X_D (?X_Q (BUY.V ?X_E)))
	)
)

; "Jack went to a store."
; "He saw some things that he liked."
; "He bought them all."
; "He liked the store."
(EPI-SCHEMA ((?X_K
              (((ADV-A (IN.P ?X_J)) BUY.V)
               (ALL.D
                (L X
                 (AND (X (PLUR {REF}.N)) (X (OF.P (THE.D (PLUR THING.N)))))))))
             ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR THING.N)))
		(!R2 (?X_J STORE.N))
		(!R3 (?X_J DESTINATION.N))
		(!R4 (NOT (?X_J ACTION.N)))
		(!R5 (NOT (?X_J AGENT.N)))
		(!R6 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_E (?X_K ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_J))
		(?X_G (?X_K SEE.10.V ?X_C))
		(?X_B (?X_K (BUY.V (ALL.D ({OF}.P ?X_C)))))
		(?E_1 (?X_K LIKE.11.V (ALL.D ({OF}.P ?X_C))))
		(?X_I (?X_K LIKE.12.V ?X_J))
	)
)

; "'I want to visit a museum,' Tom said."
; "'We have many museums here,' Bob said."
; "'Let's go to one now,' Tom suggested."
; "'OK,' Bob agreed."
; "They went to the museum."
; "They saw many interesting things."
(EPI-SCHEMA ((?X_G ((ADV-A (TO.P ?X_F)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F MUSEUM.N))
		(!R2 (?X_E MANY.A))
		(!R3 (?X_E INTERESTING.A))
		(!R4 (?X_E (PLUR THING.N)))
		(!R5 (?X_F DESTINATION.N))
		(!R6 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_B (?X_G ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_F))
		(?X_D (?X_G SEE.13.V ?X_E))
	)
)

; "Tom saw a store."
; "He went inside the store."
; "He looked around."
; "He found what he was looking for."
; "He bought some things."
(EPI-SCHEMA ((?X_M ((ADV-A (TO.P ?X_L)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR THING.N)))
		(!R2 (?X_L STORE.N))
		(!R3 (?X_L DESTINATION.N))
		(!R4 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_G (?X_M SEE.14.V ?X_L))
		(?X_I (?X_M ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_L))
		(?X_E (?X_M (AROUND.ADV LOOK.V)))
		(?X_K (?X_M ((ADV-A (FOR.P ?O)) FIND.15.V)))
		(?X_B (?X_M (BUY.V ?X_C)))
	)
)

; "Alfred was going to the store."
; "He saw some interesting things."
; "He bought them all."
; "He brought them home."
(EPI-SCHEMA ((?X_L ((ADV-A (TO.P ?X_I)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_K INTERESTING.A))
		(!R2 (?X_K (PLUR THING.N)))
		(!R3 (?X_I STORE.N))
		(!R4 (?X_J HOME.N))
		(!R5 (?X_J (PERTAIN-TO ?X_L)))
		(!R6 (?X_I DESTINATION.N))
		(!R7 (?X_J DESTINATION.N))
		(!R8 (?X_K SMALLER-THAN.N ?X_L))
		(!R9 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_D (?X_L ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_I))
		(?X_F (?X_L SEE.16.V ?X_K))
		(?X_B (?X_L (BUY.V (ALL.D ({OF}.P ?X_K)))))
		(?X_H (?X_L BRING.17.V ?X_K ?X_J))
	)
)

; "Sarah walked into town."
; "She saw a shop."
; "She went inside."
; "There were many things in the shop."
; "She found what she was looking for."
; "She left the shop."
(EPI-SCHEMA ((?X_E ((ADV-A (INTO.P ?X_R)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E FEMALE.A))
		(!R2 (?X_E AGENT.N))
		(!R3 (?X_S SHOP.N))
		(!R4 (?X_H SHOP.N))
		(!R5 (?X_H AGENT.N))
		(!R6 (?X_K MANY.A))
		(!R7 (?X_K (PLUR THING.N)))
		(!R8 (?X_R TOWN.N))
		(!R9 (?X_R DESTINATION.N))
		(!R10 (?X_S AGENT.N))
		(!R11 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_M (?X_S ((ADV-A (FROM.P ?L1)) WALK.1.V) ?X_R))
		(?X_O (?X_S SEE.18.V ?X_H))
		(?X_Q (?X_S ((ADV-A (FROM.P ?L1)) GO.19.V) ?L2))
		(?X_J (?X_A (BE.V ?X_K)))
		(?X_G (?X_H (FIND.V (ANS-TO (?X_S ((ADV-A (FOR.P ?X_B)) LOOK.V))))))
		(?X_D (?X_E (LEAVE.V ?X_S)))
	)
)

; "Tom went to the library."
; "He read books there."
; "There were lots of books on the shelf."
; "He found some interesting books."
(EPI-SCHEMA ((?X_O (((ADV-A (IN.P ?X_N)) FIND.V) ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR LOT.N)))
		(!R2 (?X_D (OF.P ?X_E)))
		(!R3 (?X_H (PLUR BOOK.N)))
		(!R4 (?X_N LIBRARY.N))
		(!R5 (?X_K INTERESTING.A))
		(!R6 (?X_K (PLUR BOOK.N)))
		(!R7 (?X_N DESTINATION.N))
		(!R8 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_J (?X_O ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_N))
		(?X_G (?X_O ((THERE.ADV READ.V) ?X_H)))
		(?X_C (?X_A (BE.V ?X_D)))
		(?X_M (?X_O FIND.20.V ?X_K))
	)
)

; "Karen liked to walk around town."
; "She saw a store."
; "She walked inside."
; "She found some things she wanted."
; "She paid for them."
; "She left the store."
(EPI-SCHEMA ((?X_O ((ADV-A (AROUND.P ?X_N)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR THING.N)))
		(!R2 (?X_N TOWN.N))
		(!R3 (?X_P STORE.N))
		(!R4 ((KA ((ADV-A (AROUND.P ?X_N)) WALK.V)) ACTION.N))
		(!R5 (?X_O AGENT.N))
		(!R6 (?X_P LOCATION.N))
		(!R7 (NOT (?X_P = ?L2)))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_O LIKE.21.V (KA ((ADV-A (AROUND.P ?X_N)) WALK.V))))
		(?E_1 (?X_O ((ADV-A (FROM.P ?L1)) WALK.22.V) ?L2))
		(?X_G (?X_O SEE.23.V ?X_P))
		(?X_I (?X_O ((ADV-A (FROM.P ?L1)) WALK.24.V) ?L2))
		(?X_K (?X_O FIND.20.V ?X_C))
		(?X_B (?X_O ((ADV-A (FOR.P ?X_C)) PAY.V)))
		(?X_M (?X_O ((ADV-A (FROM.P ?X_P)) LEAVE.25.V) ?L2))
	)
)

; "Mark's car broke down on the road."
; "A policeman stopped Mark for speeding."
; "The policeman asked Mark where he was going."
; "Mark told the policeman that he was going to visit his friend."
; "The policeman asked Mark if he knew how to fix the car."
; "Mark said no, but he would ask someone else."
(EPI-SCHEMA ((?X_L
              (TELL.V ?X_I
               (THAT (?X_L ((ADV-A (FOR.P (KA (VISIT.V ?X_L)))) GO.V)))))
             ** ?E)
	(:ROLES
		(!R1 (?X_J CAR.N))
		(!R2 (?X_D ROAD.N))
		(!R3 (?X_I POLICEMAN.N))
		(!R4 (?X_K FRIEND.N))
		(!R5 (?X_L MARK.N))
		(!R6 (?X_L AGENT.N))
		(!R7 (?X_J (PERTAIN-TO ?X_L)))
		(!R8 (?X_K (PERTAIN-TO ?X_L)))
	)
	(:STEPS
		(?X_F (?X_J ((ADV-A (ON.P ?X_D)) BREAK_DOWN.V)))
		(?X_H (?X_I (((ADV-A (FOR.P (KA SPEED.V))) STOP.V) ?X_L)))
		(?X_B
   (?X_L
    (TELL.V ?X_I (THAT (?X_L ((ADV-A (FOR.P (KA (VISIT.V ?X_K)))) GO.V))))))
		(?X_C (?X_L (SAY.V ?X_A)))
	)
)

; "Tom saw a sign on the road."
; "The sign said \"No U-Turn\"."
; "He knew that he could not turn around."
; "He drove through town."
(EPI-SCHEMA ((?X_H ((ADV-A (THROUGH.P ?X_C)) DRIVE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C TOWN.N))
		(!R2 (?X_D MALE.A))
		(!R3 (?X_D AGENT.N))
		(!R4 (?X_G SIGN.N))
		(!R5 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_F (?X_H SEE.26.V ?X_G))
		(?X_B (?X_D ((ADV-A (THROUGH.P ?X_C)) DRIVE.V)))
	)
)

; "Tom saw a car on the road."
; "He looked at the driver's license plate."
; "He saw that the license plate was expired."
; "He called the police."
(EPI-SCHEMA ((?X_M (SEE.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_C POLICE.N))
		(!R2 (?X_H LICENSE.N))
		(!R3 (?X_H PLATE.N))
		(!R4 (?X_H (PERTAIN-TO ?X_I)))
		(!R5 (?X_L CAR.N))
		(!R6 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_K (?X_M SEE.27.V ?X_L))
		(?X_G (?X_M ((ADV-A (AT.P ?X_H)) LOOK.V)))
		(?X_E (?X_M (SEE.V (THAT (?X_H (PASV EXPIRE.V))))))
		(?X_B (?X_M (CALL.V ?X_C)))
	)
)



; "My mom made some cookies today."
; "She told us we were going to eat them."
; "But they tasted bad."
; "Our stomachs hurt."
(EPI-SCHEMA (((ADV-E (DURING ?X_K)) (?X_K EAT.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR STOMACH.N)))
		(!R2 (?X_K AGENT.N))
		(!R3 (?X_E (PERTAIN-TO ?X_J)))
		(!R4 (?X_H AGENT.N))
		(!R5 (?X_F (PLUR COOKIE.N)))
		(!R6 (?X_G MOM.N))
		(!R7 (?X_G (PERTAIN-TO ?X_H)))
		(!R8 (?X_I TODAY.N))
		(!R9 (?X_J AGENT.N))
		(!R10 (?X_K FOOD.N))
	)
	(:STEPS
		(?X_A ((ADV-E ({DURING}.P ?X_I)) (?X_G (MAKE.V ?X_F))))
		(?X_D
   (?X_H (TELL.V ?X_J (THT (?X_J ((ADV-A (FOR.P (KA (EAT.V ?X_K)))) GO.V))))))
		(?X_B (?X_E HURT.V))
		(?E_1 (?X_J EAT.1.V ?X_K))
	)
)

; "'I love eating cookies,' said Tom."
; "'My mom makes delicious cookies.'"
; "'We're going to have cookies for dessert tonight,' said Jenny."
; "'What kind of cookie do you want?' asked Jack."
; "'Chocolate chip,' said Tom."
; "'I'll make chocolate chip cookies,' said Jenny."
; "'Let's all have chocolate chip cookies,' said Jack."
; "'I'll help too,' said Tom."
(EPI-SCHEMA ((?X_C (MAKE.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_A MOM.N))
		(!R2 (?X_A (PERTAIN-TO ?X_B)))
		(!R3 (?X_C DELICIOUS.A))
		(!R4 (?X_C (PLUR COOKIE.N)))
	)
	(:STEPS
		(?X_E (?X_A (MAKE.V ?X_C)))
	)
)

; "Annie's mother baked cookies."
; "She put them on a plate."
; "She served them to Annie."
; "Annie liked the cookies."
(EPI-SCHEMA ((?X_J (SERVE.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_K (PLUR COOKIE.N)))
		(!R2 (?X_H (PERTAIN-TO ?X_J)))
		(!R3 (?X_I PLATE.N))
		(!R4 (?X_E (PLUR COOKIE.N)))
		(!R5 (?X_E BAKED.A))
		(!R6 (?X_H (MOTHER.N ?X_E)))
		(!R7 (?X_H AGENT.N))
		(!R8 (?X_I LOCATION.N))
		(!R9 (?X_K OBJECT.N))
		(!R10 (?X_J AGENT.N))
		(!R11 (NOT (?X_K ACTION.N)))
		(!R12 (NOT (?X_K AGENT.N)))
	)
	(:STEPS
		(?X_D (?X_H PUT.2.V ?X_K ?X_I))
		(?X_B (?X_H (((ADV-A (TO.P ?X_J)) SERVE.V) ?X_K)))
		(?X_G (?X_J LIKE.3.V ?X_K))
	)
)

; "Karen made some cookies for her family."
; "She baked the cookies."
; "She put them on a plate."
; "She served them to her children."
; "They liked the cookies."
(EPI-SCHEMA ((?X_K (SERVE.V ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_J PLATE.N))
		(!R2 (?X_G (PLUR CHILD.N)))
		(!R3 (?X_G (PERTAIN-TO ?X_K)))
		(!R4 (?X_M (PLUR COOKIE.N)))
		(!R5 (?X_J LOCATION.N))
		(!R6 (?X_K AGENT.N))
		(!R7 (?X_L AGENT.N))
		(!R8 (NOT (?X_M ACTION.N)))
		(!R9 (NOT (?X_M AGENT.N)))
		(!R10 (?X_M OBJECT.N))
	)
	(:STEPS
		(?X_D (?X_K (MAKE.V ?X_A)))
		(?X_F (?X_K PUT.4.V ?X_M ?X_J))
		(?X_B (?X_K (SERVE.5.V ?X_G ?X_M)))
		(?X_I (?X_L LIKE.6.V ?X_M))
	)
)

; "Kate's mother baked cookies for Kate."
; "Kate liked chocolate chip cookies."
; "Kate's mother put the cookies on a plate."
; "She set the plate down on the table."
(EPI-SCHEMA ((?X_H (((ADV-A (ON.P ?X_J)) PUT.V) ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_I CHOCOLATE.N))
		(!R2 (?X_I CHIP.N))
		(!R3 (?X_I (PLUR COOKIE.N)))
		(!R4 (?X_G MOTHER.N))
		(!R5 (?X_G (PERTAIN-TO ?X_H)))
		(!R6 (?X_J PLATE.N))
		(!R7 (?X_K TABLE.N))
		(!R8 (?X_I OBJECT.N))
		(!R9 (?X_H AGENT.N))
		(!R10 (NOT (?X_I ACTION.N)))
		(!R11 (NOT (?X_I AGENT.N)))
		(!R12 (?X_J LOCATION.N))
		(!R13 (?X_K LOCATION.N))
	)
	(:STEPS
		(?X_B (?X_H LIKE.7.V ?X_I))
		(?X_D (?X_G PUT.8.V ?X_I ?X_J))
		(?X_F (?X_G SET.9.V ?X_J ?X_K))
	)
)

; "Mary's mom baked cookies."
; "Mary liked eating them."
; "Mary's mom put lots of sugar on them."
; "Mary thought the cookies were delicious."
(EPI-SCHEMA ((?X_I (EAT.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_J BAKED.A))
		(!R2 (?X_J (PLUR COOKIE.N)))
		(!R3 (?X_H SUGAR.N))
		(!R4 (?X_K MOM.N))
		(!R5 (?X_K (MOM.N ?X_J)))
		(!R6 (?X_K (PERTAIN-TO ?X_I)))
		(!R7 (?X_G (PLUR LOT.N)))
		(!R8 (?X_G (OF.P ?X_H)))
		(!R9 ((KA (EAT.V ?X_J)) ACTION.N))
		(!R10 (?X_J FOOD.N))
		(!R11 (?X_I AGENT.N))
		(!R12 (?X_J LOCATION.N))
		(!R13 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_D (?X_I LIKE.10.V (KA (EAT.V ?X_J))))
		(?E_1 (?X_I EAT.1.V ?X_J))
		(?X_F (?X_K PUT.11.V ?X_G ?X_J))
		(?X_B (?X_I (THINK.V (THT (?X_J DELICIOUS.A)))))
	)
)

; "Joe's mom made some cookies for breakfast."
; "They tasted good."
; "Joe's brother ate them all."
; "Joe's sister ate some too."
; "Joe ate some cookies for lunch."
; "His mother made some cookies for supper."
; "Joe ate some cookies for dessert."
(EPI-SCHEMA ((?X_X (EAT.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B (PLUR COOKIE.N)))
		(!R2 (?X_B (FOR.P ?X_C)))
		(!R3 (?X_F GOOD.A))
		(!R4 (?X_I (PLUR COOKIE.N)))
		(!R5 (?X_I AGENT.N))
		(!R6 (?X_Q MOM.N))
		(!R7 (?X_Q MOTHER.N))
		(!R8 (?X_J BREAKFAST.N))
		(!R9 (?X_I (FOR.P ?X_J)))
		(!R10 (?X_M LUNCH.N))
		(!R11 (?X_V (PLUR COOKIE.N)))
		(!R12 (?X_V (FOR.P ?X_M)))
		(!R13 (?X_R BROTHER.N))
		(!R14 (?X_S SISTER.N))
		(!R15 (?X_P DESSERT.N))
		(!R16 (?X_W (PLUR COOKIE.N)))
		(!R17 (?X_W (FOR.P ?X_P)))
		(!R18 (?X_Q (PERTAIN-TO ?X_X)))
		(!R19 (?X_R (PERTAIN-TO ?X_X)))
		(!R20 (?X_S (PERTAIN-TO ?X_X)))
		(!R21 (?X_V FOOD.N))
		(!R22 (?X_W FOOD.N))
		(!R23 (?X_X AGENT.N))
	)
	(:STEPS
		(?X_H (?X_Q (MAKE.V ?X_I)))
		(?X_E (?X_I (TASTE.V ?X_F)))
		(?X_L (?X_R EAT.12.V (ALL.D ({OF}.P ?X_I))))
		(?X_O (?X_X EAT.13.V ?X_V))
		(?X_A (?X_Q (MAKE.V ?X_B)))
		(?X_U (?X_X EAT.13.V ?X_W))
	)
)

; "Diana had some chocolate chips."
; "She put them on a cookie sheet."
; "She baked the cookies for ten minutes."
; "Then she let them cool."
(EPI-SCHEMA ((?X_H (((ADV-A (IN.P ?L)) PUT.V) ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_G CHOCOLATE.N))
		(!R2 (?X_G (PLUR CHIP.N)))
		(!R3 (?X_G FOOD.N))
		(!R4 (?X_H AGENT.N))
		(!R5 (?L LOCATION.N))
	)
	(:STEPS
		(?X_D (?X_H HAVE.14.V ?X_G))
		(?X_F (?X_H PUT.15.V ?X_G ?L))
		(?X_B (?X_H ((THEN.ADV LET.V) (KE (?X_G COOL.V)))))
	)
)

; "Jack's mother baked cookies."
; "She put them on a plate."
; "Jack helped himself to a cookie."
; "He liked the taste."
(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA.PR ?X_L ?X_F ?X_I ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_C COOKIE.N))
		(!R2 (?X_I PLATE.N))
		(!R3 (?X_J (PERTAIN-TO ?X_L)))
		(!R4 (?X_F (PLUR COOKIE.N)))
		(!R5 (?X_F BAKED.A))
		(!R6 (?X_J (MOTHER.N ?X_F)))
		(!R7 (?X_K TASTE.N))
		(!R8 (?X_I LOCATION.N))
		(!R9 (?X_J AGENT.N))
		(!R10 (?X_K OBJECT.N))
		(!R11 (NOT (?X_K ACTION.N)))
		(!R12 (NOT (?X_K AGENT.N)))
		(!R13 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_E (?X_J PUT.16.V ?X_F ?X_I))
		(?X_B (?X_L (((ADV-A (TO.P ?X_C)) HELP.V) ?X_L)))
		(?X_H (?X_L LIKE.17.V ?X_K))
	)
)

; "Aunt Mary baked cookies for everyone."
; "They all liked the cookies."
; "They ate the cookies."
(EPI-SCHEMA ((?X_C (EAT.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_G (PLUR COOKIE.N)))
		(!R3 (?X_F AGENT.N))
		(!R4 (?X_G FOOD.N))
	)
	(:STEPS
		(?X_B ((ALL.D ({OF}.P ?X_C)) LIKE.18.V ?X_G))
		(?X_E (?X_F EAT.13.V ?X_G))
	)
)

; "Mary went to the park."
; "She played basketball."
; "She scored many points."
(EPI-SCHEMA ((?X_J ((ADV-A (IN.P ?X_I)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C MANY.A))
		(!R2 (?X_C (PLUR POINT.N)))
		(!R3 (?X_I PARK.N))
		(!R4 (?X_H BASKETBALL.N))
		(!R5 (?X_I DESTINATION.N))
		(!R6 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_E (?X_J ((ADV-A (FROM.P ?L1)) GO.19.V) ?X_I))
		(?X_G (?X_J PLAY.20.V))
		(?X_B (?X_J (SCORE.V ?X_C)))
	)
)

; "John is a basketball player."
; "He plays for his team."
; "He scores lots of points."
(EPI-SCHEMA ((?X_A PLAY.V) ** ?E)
	(:ROLES
		(!R1 (?X_A TEAM.N))
		(!R2 (?X_B BASKETBALL.N))
		(!R3 (?X_B PLAYER.N))
		(!R4 (?X_A (PERTAIN-TO ?X_B)))
	)
	(:STEPS
		(E340.SK (?X_B PLAY.21.V))
	)
)

; "Sammy liked basketball."
; "He watched a basketball game on TV."
; "He cheered for one team."
; "He cheered for the other team."
(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA.PR ?X_F ?X_L ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_C TEAM.N))
		(!R2 (?X_F BASKETBALL.N))
		(!R3 (?X_G TV.N))
		(!R4 (?X_L BASKETBALL.N))
		(!R5 (?X_N OTHER.A))
		(!R6 (?X_N TEAM.N))
		(!R7 (?X_L OBJECT.N))
		(!R8 (NOT (?X_L ACTION.N)))
		(!R9 (NOT (?X_L AGENT.N)))
		(!R10 (?X_M AGENT.N))
		(!R11 (?X_N OBJECT.N))
		(!R12 (NOT (?X_N ACTION.N)))
		(!R13 (NOT (?X_N AGENT.N)))
	)
	(:STEPS
		(?X_I (?X_M LIKE.22.V ?X_L))
		(?X_E (?X_M (((ADV-A (ON.P ?X_G)) WATCH.V) ?X_F)))
		(?X_B (?X_M ((ADV-A (FOR.P ?X_C)) CHEER.V)))
		(?X_K (?X_M CHEER.23.V ?X_N))
	)
)

; "Mary went to the park."
; "She played basketball."
; "She scored many points."
(EPI-SCHEMA ((?X_J ((ADV-A (IN.P ?X_I)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C MANY.A))
		(!R2 (?X_C (PLUR POINT.N)))
		(!R3 (?X_I PARK.N))
		(!R4 (?X_H BASKETBALL.N))
		(!R5 (?X_I DESTINATION.N))
		(!R6 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_E (?X_J ((ADV-A (FROM.P ?L1)) GO.19.V) ?X_I))
		(?X_G (?X_J PLAY.24.V))
		(?X_B (?X_J (SCORE.V ?X_C)))
	)
)

; "Dennis played basketball."
; "He practiced hard and scored well."
; "He played for the team."
; "He was on the winning team."
(EPI-SCHEMA ((?X_L COMPOSITE-SCHEMA.PR) ** ?E)
	(:ROLES
		(!R1 (?X_F TEAM.N))
		(!R2 (?X_I BASKETBALL.N))
		(!R3 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_H (?X_L PLAY.25.V))
		(?X_A (?X_L (HARD.ADV PRACTICE.V)))
		(?X_B (?X_L (WELL.ADV SCORE.V)))
		(?X_K (?X_L PLAY.26.V))
		(?X_C (?X_F WIN.V))
		(?X_E (?X_L ((ADV-A (ON.P ?X_F)) BE.V)))
	)
)

; "Alyssa was playing basketball."
; "She dribbled the ball."
; "She passed it to someone else."
; "Then someone else passed it to Alyssa."
; "She shot the ball."
; "She missed the basket."
(EPI-SCHEMA ((?X_M ((ADV-A (WITH.P ?X_N)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C BASKET.N))
		(!R2 (?X_N BALL.N))
		(!R3 (?X_J BASKETBALL.N))
		(!R4 (?X_M AGENT.N))
		(!R5 (NOT (?X_N AGENT.N)))
		(!R6 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_I (?X_O PLAY.27.V))
		(?X_G (?X_O (DRIBBLE.V ?X_N)))
		(?X_L (?X_M (PASS.28.V ?X_O ?X_N)))
		(?X_E (?X_O (SHOOT.V ?X_N)))
		(?X_B (?X_O (MISS.V ?X_C)))
	)
)

; "Sarah's team lost the game."
; "They were sad."
; "Sarah stayed after school."
; "Her coach talked to Sarah."
(EPI-SCHEMA ((?X_J (LOSE.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_H TEAM.N))
		(!R2 (?X_H AGENT.N))
		(!R3 (?X_H SAD.A))
		(!R4 (?X_B GAME.N))
		(!R5 (?X_E SCHOOL.N))
		(!R6 (?X_I COACH.N))
		(!R7 (?X_J AGENT.N))
		(!R8 (?X_H (PERTAIN-TO ?X_J)))
		(!R9 (?X_I (PERTAIN-TO ?X_J)))
	)
	(:STEPS
		(?X_D (?X_H (LOSE.V ?X_B)))
		(?X_G (?X_J ((ADV-A (AFTER.P ?X_E)) STAY.V)))
		(?X_A (?X_I ((ADV-A (TO.P ?X_J)) TALK.V)))
	)
)

; "'John is learning to play basketball."
; "He can dribble the ball well."
; "He can shoot baskets often."
; "He plays basketball for hours each day."
(EPI-SCHEMA ((?X_D (PLAY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C BASKETBALL.N))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X AGENT.N))
	)
	(:STEPS
		(?X_B (?X_D ((ADV-A (FOR.P (KA (PLAY.V ?X_C)))) LEARN.V)))
		(?E_1 (?X PLAY.29.V))
	)
)



; "Mary bought some clothes."
; "She tried them on."
; "They were way too small."
; "She went to the store to return them."
; "She did not get any money back."
(EPI-SCHEMA ((?X_I (BUY.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR CLOTHE.N)))
		(!R2 (?X_F AGENT.N))
		(!R3 (?X_F (WAY.ADV (TOO.ADV SMALL.A))))
		(!R4 (?X_J STORE.N))
		(!R5 (?X_I AGENT.N))
		(!R6 (?X_J DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_I (BUY.V ?X_F)))
		(?X_E (?X_I (KA TRY.V) ?X_F ON.P))
		(?X_H (?X_I ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_J))
		(?X_C (NOT (?X_I ((BACK.ADV GET.V) (ANY.D MONEY.N)))))
	)
)

; "Mary wore a shirt to work."
; "She put it on over her blouse."
; "She put on jeans."
; "She looked neat."
(EPI-SCHEMA ((?X_M ((ADV-A (ON.P ?X_F)) PUT.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E NEAT.A))
		(!R2 (?X_F FEMALE.A))
		(!R3 (?X_F AGENT.N))
		(!R4 (?X_I (PLUR JEAN.N)))
		(!R5 (?X_J BLOUSE.N))
		(!R6 (?X_J (PERTAIN-TO ?X_M)))
		(!R7 (?X_N (SHIRT.N (KA WORK.V))))
		(!R8 (?X_M AGENT.N))
		(!R9 (?X_N OBJECT.N))
		(!R10 (NOT (?X_N AGENT.N)))
	)
	(:STEPS
		(?X_L (?X_M WEAR.4.V ?X_N))
		(?X_A (?X_M ON.P))
		(?X_B (?X_M (OVER.P ?X_J)))
		(?X_H (?X_M (PUT_ON.V ?X_I)))
		(?X_D (?X_F (LOOK.V ?X_E)))
	)
)

; "'Sammy liked the new shirt that Mary bought."
; "Mary's old shirt was torn."
; "Mary looked for something else to wear."
; "She saw an ad on TV."
; "'Sale!' Mary thought."
; "She bought the shirt."
(EPI-SCHEMA ((?X_N (BUY.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_L NEW.A))
		(!R2 (?X_L SHIRT.N))
		(!R3 (?X_I OLD.A))
		(!R4 (?X_I SHIRT.N))
		(!R5 (?X_I (PERTAIN-TO ?X_N)))
		(!R6 (?X_J AD.N))
		(!R7 (?X_K AGENT.N))
		(!R8 (NOT (?X_L ACTION.N)))
		(!R9 (NOT (?X_L AGENT.N)))
		(!R10 (?X ENTITY.N))
		(!R11 (?X_M ENTITY.N))
		(!R12 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_D (?X_K LIKE.5.V ?X_L))
		(?E_1 (?X TEAR.6.V ?X_I))
		(?X_F (?X_N ((ADV-A (FOR.P ?X_M)) LOOK.7.V)))
		(?X_H (?X_N SEE.8.V ?X_J))
		(?X_B (?X_N (BUY.V ?X_L)))
	)
)

; "Nancy's clothes were getting old."
; "She decided to get new clothes."
; "She bought some clothes at the store."
; "She tried them on."
; "They were too big."
; "She returned them."
(EPI-SCHEMA ((?X_M (BUY.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_L (PLUR CLOTHE.N)))
		(!R2 (?X_A OLD.A))
		(!R3 (?X_D (PLUR CLOTHE.N)))
		(!R4 (?X_D NEW.A))
		(!R5 (?X_G STORE.N))
		(!R6 (?X_M AGENT.N))
		(!R7 (?X_L (PERTAIN-TO ?X_M)))
		(!R8 (?X_N (PLUR CLOTHE.N)))
		(!R9 (?X_N AGENT.N))
		(!R10 (?X_N (TOO.ADV BIG.A)))
	)
	(:STEPS
		(?X_C (?X_L (GET.V ?X_A)))
		(?X_F (?X_M (GET.V ?X_D)))
		(?X_I (?X_M (((ADV-A (AT.P ?X_G)) BUY.V) ?X_N)))
		(?X_K (?X_M (KA TRY.V) ?X_N ON.P))
		(?X_P (?X_M (RETURN.V ?X_N)))
	)
)

; "John had a new pair of shoes."
; "He wore them for a while."
; "Then they started to hurt his feet."
; "He took them off."
(EPI-SCHEMA ((?X_J (TAKE_OFF.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR FOOT.N)))
		(!R2 (?X_D (PERTAIN-TO ?X_J)))
		(!R3 (?X_G (PLUR SHOE.N)))
		(!R4 (?X_I (OF.P ?X_G)))
		(!R5 (?X_H NEW.A))
		(!R6 (?X_I ?X_H PAIR.N))
		(!R7 (?X_I OBJECT.N))
		(!R8 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_F (?X_J HAVE.9.V ?X_I))
		(?X_A (?X_G (THEN.ADV ((ADV-A (FOR.P (KA (HURT.V ?X_D)))) START.V))))
		(?X_C (?X_J ((OFF.ADV TAKE.V) ?X_G)))
		(?E_1 (?X_J WEAR.10.V ?X_G))
	)
)

; "Mary bought some clothes."
; "She tried them on."
; "They were way too small for her."
; "She went to the store to return them."
; "The clerk told her that they were too big."
(EPI-SCHEMA ((?X_L (BUY.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_C CLERK.N))
		(!R2 (?X_H (PLUR CLOTHE.N)))
		(!R3 (?X_H AGENT.N))
		(!R4 (?X_K STORE.N))
		(!R5 (?X_K DESTINATION.N))
		(!R6 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_G (?X_L (BUY.V ?X_H)))
		(?X_E (?X_L (KA TRY.V) ?X_H ON.P))
		(?X_J (?X_L ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_K))
		(?X_B (?X_C (TELL.V ?X_L (THAT (?X_H (TOO.ADV BIG.A))))))
	)
)



; "One night there was a big thunderstorm."
; "A bolt hit the roof."
; "It broke our window."
; "Our family was scared."
(EPI-SCHEMA ((?X_I (HIT.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_D NIGHT.N))
		(!R2 (?X_E BIG.A))
		(!R3 (?X_E THUNDERSTORM.N))
		(!R4 (?X_F ROOF.N))
		(!R5 (?X_I BOLT.N))
		(!R6 (?X_J WINDOW.N))
		(!R7 (?X_J (PERTAIN-TO ?X_K)))
	)
	(:STEPS
		(?X_B ((ADV-E ({DURING}.P ?X_D)) (?X_A (BE.V ?X_E))))
		(?X_H (?X_I (HIT.V ?X_F)))
		(?X_C (?X_I (BREAK.V ?X_J)))
	)
)

; "Diana saw lightning outside."
; "There were loud noises."
; "Thunder sounded."
; "There was a flash of light."
(EPI-SCHEMA ((?X_O (SEE.V ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_D FLASH.N))
		(!R2 (?X_D (OF.P ?X_E)))
		(!R3 (?X_H THUNDER.N))
		(!R4 (?X_K LOUD.A))
		(!R5 (?X_K (PLUR NOISE.N)))
		(!R6 (?X_N LIGHTNING.N))
		(!R7 (?X_N OUTSIDE.N))
		(!R8 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_M (?X_O SEE.1.V ?X_N))
		(?X_J (?X_A (BE.V ?X_K)))
		(?X_G (?X_H SOUND.V))
		(?X_C (?X_A (BE.V ?X_D)))
	)
)

; "Sammy and John were afraid of thunderstorms."
; "They were not allowed to play outside during thunderstorms."
; "Their parents told them that they could stay inside if they listened to some music."
(EPI-SCHEMA ((?X_B ((ADV-A (WITH.P ?X_A)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_A (PLUR THUNDERSTORM.N)))
		(!R2 (?X_B AGENT.N))
		(!R3 (?X_C (PLUR PARENT.N)))
		(!R4 (?X_C (PERTAIN-TO ?X_D)))
		(!R5 (?X_D AGENT.N))
	)
	(:STEPS
		(E77.SK ((SET-OF ?X_B ?X_D) (OF.P ?X_A)))
		(?E_1 (?X_D PLAY.2.V))
	)
)

; "There were thunderstorms all over the world."
; "There were lightning bolts everywhere."
; "Some people were afraid of thunderstorms."
(EPI-SCHEMA ((?X_G (OF.P ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR THUNDERSTORM.N)))
		(!R2 (?X_C ((ALL.ADV OVER.P) ?X_D)))
		(!R3 (?X_G AFRAID.A))
		(!R4 (?X_G (PLUR PERSON.N)))
		(!R5 (?X_H (PLUR THUNDERSTORM.N)))
	)
	(:STEPS
		(?X_F (?X_A (BE.V ?X_C)))
		(?X_B (?X_G (OF.P ?X_H)))
	)
)

; "Anita's mom told Anita not to play outside."
; "Anita's dad told her not to climb on roofs."
; "Anita's brother told her not to touch things that were broken."
; "Anita listened to her parents."
; "Anita played inside."
(EPI-SCHEMA ((?X_H ((ADV-A (TO.P ?X_D)) LISTEN.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR PARENT.N)))
		(!R2 (?X_D (PERTAIN-TO ?X_H)))
		(!R3 (?X_E MOM.N))
		(!R4 (?X_E (PERTAIN-TO ?X_H)))
		(!R5 (?X_F DAD.N))
		(!R6 (?X_F (PERTAIN-TO ?X_H)))
		(!R7 (?X_G BROTHER.N))
		(!R8 (?X_G (PERTAIN-TO ?X_H)))
		(!R9 (?X_H AGENT.N))
		(!R10 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_H ((ADV-A (TO.P ?X_D)) LISTEN.V)))
		(?X_C (?X_H (INSIDE.ADV PLAY.V)))
		(?E_1 (?X_H ((ADV-A (FROM.P ?L1)) CLIMB.3.V) ?L2))
	)
)

; "Maggie was afraid of thunder storms."
; "She was afraid that lightning would strike her house."
; "She was afraid that a tree might fall on her house."
; "She was afraid that a tornado could come."
(EPI-SCHEMA ((?X_D (OF.P ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_D AFRAID.A))
		(!R2 (?X_D (AFRAID.A (THAT (?X_A (WILL.MD (STRIKE.V ?X_C)))))))
		(!R3 (?X_D AGENT.N))
		(!R4 (?X_D (AFRAID.A (THAT (?X_B (CAN.MD COME.V))))))
		(!R5 (?X_C (PERTAIN-TO ?X_D)))
		(!R6 (?X_E (PLUR STORM.N)))
		(!R7 (?X_E THUNDER.N))
	)
	(:STEPS
		(E196.SK (?X_D (OF.P ?X_E)))
	)
)

; "Bobby was on vacation."
; "He saw a storm coming."
; "He ran inside."
; "He locked himself in a room away from the lightning."
(EPI-SCHEMA ((?X_J ((ADV-A (FROM.P ?L2)) COME.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D VACATION.N))
		(!R2 (?X_I STORM.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_J AGENT.N))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_C (?X_J ((ADV-A (ON.P ?X_D)) BE.V)))
		(?X_F (?X_J SEE.4.V ?X_I))
		(?X_A (?X_I ((ADV-A (FROM.P ?L1)) COME.5.V) ?L2))
		(?X_H (?X_J ((ADV-A (FROM.P ?L1)) RUN.6.V) ?L2))
	)
)

; "Jenny was afraid of thunderstorms."
; "There were thunderstorms that night."
; "She stayed inside the house."
; "She heard loud noises outside."
(EPI-SCHEMA ((?X_I (HEAR.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_D HOUSE.N))
		(!R2 (?X_E (PLUR THUNDERSTORM.N)))
		(!R3 (?X_I AFRAID.A))
		(!R4 (?X_H LOUD.A))
		(!R5 (?X_H (PLUR NOISE.N)))
		(!R6 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_A (?X_I (OF.P ?X_E)))
		(?X_C (?X_I ((ADV-A (INSIDE.P ?X_D)) STAY.V)))
		(?X_G (?X_I HEAR.7.V ?X_H))
	)
)

; "Samantha liked thunderstorms."
; "She watched them on TV."
; "She saw one last year."
; "It was scary."
(EPI-SCHEMA ((?X_I (WATCH.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_H (PLUR THUNDERSTORM.N)))
		(!R2 (?X_C TV.N))
		(!R3 (NOT (?X_H ACTION.N)))
		(!R4 (NOT (?X_H AGENT.N)))
		(!R5 (?X_H OBJECT.N))
		(!R6 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_E (?X_I LIKE.8.V ?X_H))
		(?X_B (?X_I (((ADV-A (ON.P ?X_C)) WATCH.V) ?X_H)))
		(?X_G (?X_I SEE.9.V ?X_H))
	)
)

; "Bob had a bad dream."
; "He dreamed that he was on a plane."
; "He was flying over a stormy sea."
; "There were lightning bolts everywhere."
; "The plane crashed into the ocean."
(EPI-SCHEMA ((?X_K (DREAM.V (THAT (?X_K ((ADV-A (IN.P ?X_E)) FLY.V))))) ** ?E)
	(:ROLES
		(!R1 (?X_L STORMY.A))
		(!R2 (?X_L SEA.N))
		(!R3 (?X_L OCEAN.N))
		(!R4 (?X_E PLANE.N))
		(!R5 (?X_H BAD.A))
		(!R6 (?X_H DREAM.N))
		(!R7 (?X_K AGENT.N))
		(!R8 (?X_L DESTINATION.N))
	)
	(:STEPS
		(?X_G (?X_K (HAVE.V ?X_H)))
		(?X_D (?X_K (DREAM.V (THAT (?X_K ((ADV-A (ON.P ?X_E)) BE.V))))))
		(?X_J (?X_K ((ADV-A (FROM.P ?L1)) FLY.10.V) ?X_L))
		(?X_B (?X_E ((ADV-A (INTO.P ?X_L)) CRASH.V)))
	)
)

; "The girl was sad."
; "Her boyfriend broke up with her."
; "She cried all day."
; "She felt lonely."
(EPI-SCHEMA ((?X_F (CRY.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_D LONELY.A))
		(!R2 (?X_F GIRL.N))
		(!R3 (?X_F SAD.A))
		(!R4 (?X_E BOYFRIEND.N))
		(!R5 (?X_E (PERTAIN-TO ?X_F)))
	)
	(:STEPS
		(?X_A (?X_E ((ADV-A (WITH.P ?X_F)) BREAK_UP.V)))
		(?X_H (?X_F CRY.11.V))
		(?X_C (?X_F (FEEL.V ?X_D)))
	)
)

; "Sarah liked going to school."
; "She was happy there."
; "She had friends in school."
(EPI-SCHEMA ((?X_F (LIKE.V (KA ((ADV-A (TO.P ?X_G)) GO.V)))) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR FRIEND.N)))
		(!R2 (?X_G SCHOOL.N))
		(!R3 ((KA ((ADV-A (TO.P ?X_G)) GO.V)) ACTION.N))
		(!R4 (?X_F AGENT.N))
		(!R5 (?X_G DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_F LIKE.12.V (KA ((ADV-A (TO.P ?X_G)) GO.V))))
		(?X_B (?X_F (HAVE.V ?X_C)))
		(?E_1 (?X_F ((ADV-A (FROM.P ?L1)) GO.13.V) ?X_G))
	)
)

; "Sally's friend liked to play games on the computer."
; "She played games all day."
; "She spent time alone."
(EPI-SCHEMA ((?X_D (((ADV-A (WITH.P ?X_C)) PLAY.V) ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_D AGENT.N))
		(!R2 (?X_C FRIEND.N))
		(!R3 (?X_C (PERTAIN-TO ?X_D)))
		(!R4 (?X_E COMPUTER.N))
		(!R5 (?X_F (PLUR GAME.N)))
		(!R6 (?X AGENT.N))
		(!R7 ((KA (((ADV-A (ON.P ?X_E)) PLAY.V) ?X_F)) ACTION.N))
	)
	(:STEPS
		(?E_1 (?X PLAY.14.V))
		(?X_B (?X_C LIKE.15.V (KA (((ADV-A (ON.P ?X_E)) PLAY.V) ?X_F))))
	)
)

; "Tommy went to school."
; "A boy named Jason came to Tommy's house."
; "Jason asked if Tommy could play basketball."
; "Tommy said no."
; "Jason left."
(EPI-SCHEMA ((?X_N
              ((ADV-A
                (FOR.P
                 (KA (L X (AND (X SCHOOL.N) (X (FROM.P (A.D LOCATION.N))))))))
               GO.V))
             ** ?E)
	(:ROLES
		(!R1 (?X_O SCHOOL.N))
		(!R2 (?X_P HOUSE.N))
		(!R3 (?X_P (PERTAIN-TO ?X_N)))
		(!R4 (?X_J BASKETBALL.N))
		(!R5 (?X_K BOY.N))
		(!R6 (?X_K ((PASV NAME.V) ?X_Q)))
		(!R7 (?X_N AGENT.N))
		(!R8 (?X_O DESTINATION.N))
		(!R9 (?X_P DESTINATION.N))
		(!R10 (?X_Q AGENT.N))
		(!R11 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_N ((ADV-A (FROM.P ?L1)) GO.16.V) ?X_O))
		(?X_G (?X_K ((ADV-A (FROM.P ?L1)) COME.17.V) ?X_P))
		(?X_I (?X_Q ASK.18.V))
		(?X_C (?X_N (SAY.V ?X_A)))
		(?X_M (?X_Q ((ADV-A (FROM.P ?L1)) LEAVE.19.V) ?L2))
	)
)

; "Mary was sad because her boyfriend broke up with her."
; "She cried all day."
; "She felt lonely."
(EPI-SCHEMA ((?X_J CRY.V) ** ?E)
	(:ROLES
		(!R1 (?X_D LONELY.A))
		(!R2 (?X_E (BECAUSE.P (KE (?X_I ((ADV-A (WITH.P ?X_J)) BREAK_UP.V))))))
		(!R3 (?X_F SAD.A))
		(!R4 (?X_I BOYFRIEND.N))
		(!R5 (?X_I (PERTAIN-TO ?X_J)))
		(!R6 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_A (?X_J (BE.V ?X_F ?X_E)))
		(?X_H (?X_J CRY.20.V))
		(?X_C (?X_J (FEEL.V ?X_D)))
	)
)

; "A boy was feeling sad."
; "He missed his friend."
; "He thought about his friend."
; "He remembered what they did together."
(EPI-SCHEMA ((?X_G (BE.V (K SAD.A) (THAT (?X_G (NOT (HAVE.V ?X_F)))))) ** ?E)
	(:ROLES
		(!R1 (?X_C SAD.A))
		(!R2 (?X_G BOY.N))
		(!R3 (?X_F FRIEND.N))
		(!R4 (?X_F (PERTAIN-TO ?X_G)))
	)
	(:STEPS
		(?X_E (?X_G (FEEL.V ?X_C)))
		(?X_A (?X_G (MISS.V ?X_F)))
		(?X_B (?X_G ((ADV-A (ABOUT.P ?X_F)) THINK.V)))
	)
)

; "Tom saw a movie."
; "The actors were funny."
; "The actors acted silly."
; "The actors played games."
(EPI-SCHEMA ((?X_A (PLAY.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_A AGENT.N))
		(!R2 (?X_B MOVIE.N))
		(!R3 (?X_G FUNNY.A))
		(!R4 (?X_G (PLUR ACTOR.N)))
		(!R5 (?X_H (PLUR GAME.N)))
	)
	(:STEPS
		(?X_D (?X_A (SEE.V ?X_B)))
		(?X_F (?X_G (SILLY.ADV ACT.V)))
		(?X_J (?X_G (PLAY.V ?X_H)))
	)
)

; "'I don't want to be alone,' Mary said."
; "'I hate being alone.'"
; "Mary's mother told her that she could stay over at her friend's house."
; "Mary decided to do this."
(EPI-SCHEMA ((?X_C
              (COMPOSITE-SCHEMA.PR ?X_E
               (THAT (?X_E (CAN.MD ((ADV-A (AT.P ?X_B)) STAY_OVER.V)))) ?X_F))
             ** ?E)
	(:ROLES
		(!R1 (?X_C MOTHER.N))
		(!R2 (?X_B HOUSE.N))
		(!R3 (?X_B (PERTAIN-TO ?X_D)))
		(!R4 (?X_E AGENT.N))
		(!R5 (?X_C (PERTAIN-TO ?X_E)))
		(!R6 (?X_D (PERTAIN-TO ?X_E)))
		(!R7 (?X_F {REF}.N))
	)
	(:STEPS
		(?X_A
   (?X_C
    (TELL.V ?X_E (THAT (?X_E (CAN.MD ((ADV-A (AT.P ?X_B)) STAY_OVER.V)))))))
		(?X_H (?X_E (DO.V ?X_F)))
	)
)

; "Mary was lonely."
; "No one liked Mary."
; "She was sad."
; "She cried."
(EPI-SCHEMA ((?X_E (LIKE.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E LONELY.A))
		(!R2 (?X_E SAD.A))
		(!R3 ((NO.D ONE.N) AGENT.N))
		(!R4 (?X_E OBJECT.N))
		(!R5 (NOT (?X_E ACTION.N)))
	)
	(:STEPS
		(?X_B ((NO.D ONE.N) LIKE.21.V ?X_E))
		(?X_D (?X_E CRY.22.V))
	)
)



; "Susan was working late."
; "She was tired."
; "She was hungry."
; "She decided to get something to eat."
; "She walked into a restaurant."
; "There was a line."
(EPI-SCHEMA ((?X_K ((ADV-A (TO.P ?X_L)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F LINE.N))
		(!R2 (?X_K TIRED.A))
		(!R3 (?X_K HUNGRY.A))
		(!R4 (?X_L RESTAURANT.N))
		(!R5 (?X_K AGENT.N))
		(!R6 (?X_L DESTINATION.N))
	)
	(:STEPS
		(?X_C (?X_K (LATE.ADV WORK.V)))
		(?X_H (?X_K (GET.V ?X_A)))
		(?X_J (?X_K ((ADV-A (FROM.P ?L1)) WALK.1.V) ?X_L))
		(?X_E (?X_B (BE.V ?X_F)))
	)
)

; "Cindy went to the movies."
; "She saw a movie."
; "She liked the movie."
; "She paid for her ticket."
(EPI-SCHEMA ((?X_K ((ADV-A (FOR.P ?X_J)) PAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D TICKET.N))
		(!R2 (?X_J MOVIE.N))
		(!R3 (?X_D (PERTAIN-TO ?X_K)))
		(!R4 (?X_I (PLUR MOVIE.N)))
		(!R5 (?X_I DESTINATION.N))
		(!R6 (NOT (?X_J ACTION.N)))
		(!R7 (NOT (?X_J AGENT.N)))
		(!R8 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_F (?X_K ((ADV-A (FROM.P ?L1)) GO.2.V) ?X_I))
		(?X_C (?X_K (SEE.V ?X_J)))
		(?X_H (?X_K LIKE.3.V ?X_J))
		(?X_A (?X_K ((ADV-A (FOR.P ?X_D)) PAY.V)))
	)
)

; "Mary went to a restaurant."
; "She ordered food."
; "She ate some food."
; "She paid for her meal."
(EPI-SCHEMA ((?X_K ((ADV-A (FOR.P ?X_D)) PAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E MEAL.N))
		(!R2 (?X_D FOOD.N))
		(!R3 (?X_E (PERTAIN-TO ?X_K)))
		(!R4 (?X_J RESTAURANT.N))
		(!R5 (?X_J DESTINATION.N))
		(!R6 (?X_K AGENT.N))
		(!R7 (?X_L FOOD.N))
	)
	(:STEPS
		(?X_G (?X_K ((ADV-A (FROM.P ?L1)) GO.2.V) ?X_J))
		(?X_C (?X_K (ORDER.V ?X_D)))
		(?X_I (?X_K EAT.4.V ?X_L))
		(?X_A (?X_K ((ADV-A (FOR.P ?X_E)) PAY.V)))
	)
)

; "Mary was going to work on Friday."
; "She worked all week."
; "She was tired."
; "She needed to take a nap."
; "She went to bed early."
(EPI-SCHEMA ((?X_K ((ADV-A (FOR.P (KA SLEEP.V))) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C NAP.N))
		(!R2 (?X_K TIRED.A))
		(!R3 (?X_J BED.N))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_J DESTINATION.N))
		(!R6 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_G (?X_K ((ADV-A (FROM.P ?L1)) GO.5.V) ?L2))
		(?X_E ((ADV-E ({DURING}.P (ALL.D WEEK.N))) (?X_K WORK.V)))
		(?X_B (?X_K (NEED.V (KA (TAKE.V ?X_C)))))
		(?X_I (?X_K ((ADV-A (FROM.P ?L1)) GO.2.V) ?X_J))
	)
)



; "I have been working on this story for two weeks now."
; "I am almost finished."
; "There are only three more lines left."
; "I hope you enjoy reading it as much as I enjoyed writing it."
(EPI-SCHEMA ((?X_F
              (HOPE.V
               (THAT
                (?X_E
                 ((ADV-A
                   (FOR.P
                    (KA
                     (READ.V ?X_G
                      ((ADV (AS.ADV MUCH.A))
                       (AS.P
                        (?X_F
                         ((ADV-A (FOR.P (KA (WRITE.V ?X_G)))) ENJOY.V))))))))
                  ENJOY.V)))))
             ** ?E)
	(:ROLES
		(!R1 (?X_E AGENT.N))
		(!R2 (?X_F (ALMOST.ADV FINISHED.A)))
		(!R3 (?X_F AGENT.N))
		(!R4 (?X_G STORY.N))
	)
	(:STEPS
		(?X_D (?X_A (BE.V ?X_B)))
		(?X_I
   (?X_F
    (HOPE.V
     (THT
      (?X_E
       (ENJOY.V (READ.V ?X_G)
        ((ADV (AS.ADV MUCH.A))
         (AS.P (?X_F ((ADV-A (FOR.P (KA (WRITE.V ?X_G)))) ENJOY.V))))))))))
	)
)

; "Tom read a book called \"How To Write A Story\"."
; "He learned how to write a story."
; "He wrote a story."
; "He sent it to a magazine."
(EPI-SCHEMA ((?X_B (((ADV-A (TO.P ?X_K)) SEND.V) ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_B AGENT.N))
		(!R2 (?X_C BOOK.N))
		(!R3 (?X_D STORY.N))
		(!R4 (?X_G STORY.N))
		(!R5 (?X_J MALE.A))
		(!R6 (?X_J AGENT.N))
		(!R7 (?X_K MAGAZINE.N))
	)
	(:STEPS
		(?X_F
   (?X_B (READ.V (THT (?X_C ((ADV-A (HOW.P (KA (WRITE.V ?X_D)))) CALL.V))))))
		(?X_I (?X_J (WRITE.V ?X_G)))
		(?X_M (?X_J (((ADV-A (TO.P ?X_K)) SEND.V) ?X_A)))
	)
)

; "Bill liked to read books."
; "He read many books."
; "He read one book a week."
; "He read all the time."
; "He read some books over and over again."
(EPI-SCHEMA ((?X_J (((ADV-A (IN.P ?X_D)) READ.V) ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_C BOOK.N))
		(!R2 (?X_D WEEK.N))
		(!R3 (?X_G MANY.A))
		(!R4 (?X_G (PLUR BOOK.N)))
		(!R5 (?X_J BILL.N))
		(!R6 (?X_K (PLUR BOOK.N)))
		(!R7 (?X_J AGENT.N))
		(!R8 ((KA (READ.V ?X_K)) ACTION.N))
	)
	(:STEPS
		(?X_I (?X_J LIKE.1.V (KA (READ.V ?X_K))))
		(?X_F (?X_J (READ.V ?X_G)))
		(?X_B ((ADV-E ({DURING}.P ?X_D)) (?X_J (READ.V ?X_C))))
	)
)

; "Mary wrote a book."
; "She read it to her friends."
; "They liked it."
(EPI-SCHEMA ((?X_F (WRITE.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR FRIEND.N)))
		(!R2 (?X_D BOOK.N))
		(!R3 (?X_F AGENT.N))
		(!R4 (?X_E (PERTAIN-TO ?X_F)))
		(!R5 (?X_I AGENT.N))
		(!R6 (?X_J OBJECT.N))
		(!R7 (NOT (?X_J ACTION.N)))
		(!R8 (NOT (?X_J AGENT.N)))
	)
	(:STEPS
		(?X_C (?X_F (WRITE.V ?X_D)))
		(?X_A (?X_F (((ADV-A (TO.P ?X_E)) READ.V) ?X_D)))
		(?X_H (?X_I LIKE.2.V ?X_J))
	)
)

; "Jane wrote an essay."
; "She read it to her friend."
; "Jane's friend liked Jane's essay."
(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA.PR ?X_E ?X_A ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_F FRIEND.N))
		(!R2 (?X_E ESSAY.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_F (PERTAIN-TO ?X_I)))
		(!R5 (?X_J ESSAY.N))
		(!R6 (?X_J (PERTAIN-TO ?X_I)))
		(!R7 (?X_J OBJECT.N))
		(!R8 (NOT (?X_J ACTION.N)))
		(!R9 (NOT (?X_J AGENT.N)))
	)
	(:STEPS
		(?X_D (?X_I (WRITE.V ?X_E)))
		(?X_B (?X_I (((ADV-A (TO.P ?X_F)) READ.V) ?X_A)))
		(?X_H (?X_F LIKE.3.V ?X_J))
	)
)

; "Ricky liked to write poems."
; "He wrote many poems."
; "He read some of them to friends."
(EPI-SCHEMA ((?X_L (LIKE.V (KA (WRITE.V ?X_K)))) ** ?E)
	(:ROLES
		(!R1 (?X_C {REF}.N))
		(!R2 (?X_C (OF.P ?X_D)))
		(!R3 (?X_E (PLUR FRIEND.N)))
		(!R4 (?X_H MANY.A))
		(!R5 (?X_H (PLUR POEM.N)))
		(!R6 (?X_K (PLUR POEM.N)))
		(!R7 ((KA (WRITE.V ?X_K)) ACTION.N))
		(!R8 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_J (?X_L LIKE.4.V (KA (WRITE.V ?X_K))))
		(?X_G (?X_L (WRITE.V ?X_H)))
		(?X_B (?X_L (((ADV-A (TO.P ?X_E)) READ.V) ?X_C)))
	)
)

; "Joe wrote a book."
; "He sold many copies."
; "He read the book."
; "It was interesting."
(EPI-SCHEMA ((?X_C (WRITE.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_D MANY.A))
		(!R3 (?X_D (PLUR COPY.N)))
		(!R4 (?X_G MALE.A))
		(!R5 (?X_G AGENT.N))
		(!R6 (?X_H BOOK.N))
		(!R7 (?X_H INTERESTING.A))
	)
	(:STEPS
		(?X_B (?X_C (WRITE.V ?X_H)))
		(?X_F (?X_C (SELL.V ?X_D)))
		(?X_J (?X_G (READ.V ?X_H)))
	)
)

; "Tom is an author."
; "He writes books."
; "He has been writing books for years."
; "He loves to write."
(EPI-SCHEMA ((?X_M (LOVE.V (KA (WRITE.V ?X_C)))) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR BOOK.N)))
		(!R2 (?X_D (PLUR YEAR.N)))
		(!R3 (?X_G (PLUR BOOK.N)))
		(!R4 (?X_J AUTHOR.N))
		(!R5 (?X_M AGENT.N))
		(!R6 ((KA WRITE.V) ACTION.N))
	)
	(:STEPS
		(?X_I (?X_M (= ?X_J)))
		(?X_F (?X_M (WRITE.V ?X_G)))
		(?X_B
   (?X_M
    (HAS.AUX
     ((ADV-A (FOR.P (KA (((ADV-A (FOR.P ?X_D)) WRITE.V) ?X_C)))) BE.V))))
		(?X_L (?X_M LOVE.5.V (KA WRITE.V)))
	)
)

; "Tom's friend is an actor."
; "He plays games all the time."
; "He can do anything he wants."
; "Tom likes to play sports."
(EPI-SCHEMA ((?X_M (LIKE.V (KA (PLAY.V ?X_N)))) ** ?E)
	(:ROLES
		(!R1 (?X_I ACTOR.N))
		(!R2 (?X_L FRIEND.N))
		(!R3 (?X_L (PERTAIN-TO ?X_M)))
		(!R4 (?X_N (PLUR SPORT.N)))
		(!R5 (?X_M AGENT.N))
		(!R6 ((KA (PLAY.V ?X_N)) ACTION.N))
		(!R7 (?X AGENT.N))
	)
	(:STEPS
		(?X_H (?X_L (= ?X_I)))
		(?X_F
   (?X_L
    ((CAN.AUX DO.V)
     (ANY.D
      (L X
       (AND (X THING.N)
            (X
             (?X_L
              ((?X_B ?X_J (AND (?X_J (AT-ABOUT ?X_C)) (?X_D (ORIENTS ?X_J)))
                (WANT.V ** ?X_J))
               THT.REL)))))))))
		(?X_K (?X_M LIKE.6.V (KA (PLAY.V ?X_N))))
		(?E_1 (?X PLAY.7.V))
	)
)

; "Tom loves to play baseball."
; "He has a big game."
; "He is up to hit."
; "He hits a long drive."
; "He makes a run and wins the game."
(EPI-SCHEMA ((?X_N (HIT.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C RUN.N))
		(!R2 (?X_F LONG.A))
		(!R3 (?X_F DRIVE.N))
		(!R4 (?X_K BIG.A))
		(!R5 (?X_K GAME.N))
		(!R6 (?X_O BASEBALL.N))
		(!R7 (?X_N AGENT.N))
		(!R8 ((KA (PLAY.V ?X_O)) ACTION.N))
		(!R9 (?X AGENT.N))
	)
	(:STEPS
		(?X_M (?X_N LOVE.8.V (KA (PLAY.V ?X_O))))
		(?X_J (?X_N (HAVE.V ?X_K)))
		(?X_H (?X_N ((ADV-A (UP.P (KA HIT.V))) BE.V)))
		(?X_E (?X_N (HIT.V ?X_F)))
		(?X_A (?X_N (MAKE.V ?X_C)))
		(?X_B (?X_N (WIN.V ?X_K)))
		(?E_1 (?X PLAY.7.V))
	)
)

; "The boy was playing baseball."
; "He struck out."
; "He did not like it."
; "He walked off the field."
(EPI-SCHEMA ((?X_K (LIKE.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_C BOY.N))
		(!R2 (?X_F BASEBALL.N))
		(!R3 (?X_L FIELD.N))
		(!R4 (?X_K OBJECT.N))
		(!R5 (NOT (?X_K ACTION.N)))
		(!R6 (NOT (?X_K AGENT.N)))
		(!R7 (NOT (?X_L = ?L2)))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_C PLAY.9.V))
		(?X_B (?X_C STRIKE_OUT.V))
		(?X_H (?X_C LIKE.10.V ?X_K))
		(?X_J (?X_C ((ADV-A (FROM.P ?X_L)) WALK.11.V) ?L2))
	)
)

; "Karen played softball."
; "She hit a homerun."
; "She got an award for hitting a homerun."
(EPI-SCHEMA ((?X_J (PLAY.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C HOMERUN.N))
		(!R2 (?X_F SOFTBALL.N))
		(!R3 (?X_I HOMERUN.N))
		(!R4 (?X_K AWARD.N))
		(!R5 (?X_K (FOR.P (KA (HIT.V ?X_I)))))
		(!R6 (?X_J AGENT.N))
		(!R7 (?X_K OBJECT.N))
	)
	(:STEPS
		(?X_E (?X_J PLAY.12.V))
		(?X_B (?X_J (HIT.V ?X_C)))
		(?X_H (?X_J GET.13.V ?X_K))
	)
)

; "Tom played baseball."
; "He liked to play baseball."
; "He played baseball for many years."
; "He went on vacation."
(EPI-SCHEMA ((?X_L (PLAY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C BASEBALL.N))
		(!R2 (?X_K BASEBALL.N))
		(!R3 (?X_H BASEBALL.N))
		(!R4 (?X_M VACATION.N))
		(!R5 ((KA (PLAY.V ?X_K)) ACTION.N))
		(!R6 (?X_L AGENT.N))
		(!R7 (?X_M DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_L PLAY.14.V))
		(?X_E (?X_L LIKE.15.V (KA (PLAY.V ?X_K))))
		(?E_1 (?X_L PLAY.16.V))
		(?X_G (?X_L PLAY.17.V))
		(?X_J (?X_L ((ADV-A (FROM.P ?L1)) GO.18.V) ?X_M))
	)
)

; "Tom played baseball."
; "He liked to play baseball."
; "He was up to bat."
; "He hit the ball."
; "He made a run and won the game."
(EPI-SCHEMA ((?X_Q (PLAY.V ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_C GAME.N))
		(!R2 (?X_D RUN.N))
		(!R3 (?X_G BALL.N))
		(!R4 (?X_J BAT.N))
		(!R5 (?X_M BASEBALL.N))
		(!R6 (?X_P BASEBALL.N))
		(!R7 ((KA (PLAY.V ?X_P)) ACTION.N))
		(!R8 (?X_Q AGENT.N))
	)
	(:STEPS
		(?X_L (?X_Q PLAY.19.V))
		(?X_O (?X_Q LIKE.20.V (KA (PLAY.V ?X_P))))
		(?X_I (?X_Q ((ADV-A (TO.P ?X_J)) (UP.ADV BE.V))))
		(?X_F (?X_Q (HIT.V ?X_G)))
		(?X_A (?X_Q (MAKE.V ?X_D)))
		(?X_B (?X_Q (WIN.V ?X_C)))
		(?E_1 (?X_Q PLAY.16.V))
	)
)

; "Tom played baseball."
; "He was on the team."
; "He was up to bat."
; "He hit a home run."
; "He scored a goal."
(EPI-SCHEMA ((?X_Q (PLAY.V ?X_P)) ** ?E)
	(:ROLES
		(!R1 (?X_D GOAL.N))
		(!R2 (?X_G HOME.N))
		(!R3 (?X_J BAT.N))
		(!R4 (?X_M TEAM.N))
		(!R5 (?X_P BASEBALL.N))
		(!R6 (?X_Q AGENT.N))
	)
	(:STEPS
		(?X_O (?X_Q PLAY.21.V))
		(?X_L (?X_Q ((ADV-A (ON.P ?X_M)) BE.V)))
		(?X_I (?X_Q ((ADV-A (TO.P ?X_J)) (UP.ADV BE.V))))
		(?X_A (?X_G RUN.V))
		(?X_F (?X_Q (HIT.V ?X_G)))
		(?X_C (?X_Q (SCORE.V ?X_D)))
	)
)

; "A girl played softball."
; "She struck out."
; "She didn't like that."
; "She threw the ball away."
(EPI-SCHEMA ((?X_I ((ADV-A (WITH.P ?X_C)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C BALL.N))
		(!R2 (?X_F {REF}.N))
		(!R3 (?X_I GIRL.N))
		(!R4 (?X_L SOFTBALL.N))
	)
	(:STEPS
		(?X_K (?X_I PLAY.22.V))
		(?X_H (?X_I STRIKE_OUT.V))
		(?X_E (NOT (?X_I (LIKE.P ?X_F))))
		(?X_B (?X_I ((AWAY.ADV THROW.V) ?X_C)))
	)
)

; "Tom was playing baseball."
; "He played for his team."
; "He hit a home run."
; "He ran around the bases."
; "He scored a goal."
(EPI-SCHEMA ((?X_P (PLAY.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_E GOAL.N))
		(!R2 (?X_H HOME.N))
		(!R3 (?X_K BASEBALL.N))
		(!R4 (?X_L TEAM.N))
		(!R5 (?X_L (PERTAIN-TO ?X_P)))
		(!R6 (?X_O AGENT.N))
		(!R7 (?X_P AGENT.N))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_J (?X_O PLAY.23.V))
		(?X_A (?X_P PLAY.24.V))
		(?X_B (?X_H RUN.V))
		(?X_G (?X_P (HIT.V ?X_H)))
		(?X_N (?X_P ((ADV-A (FROM.P ?L1)) RUN.25.V) ?L2))
		(?X_D (?X_P (SCORE.V ?X_E)))
	)
)

; "Tom played baseball."
; "He was on first base."
; "He ran hard."
; "He made a slide into second base."
(EPI-SCHEMA ((?X_M (PLAY.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C SLIDE.N))
		(!R2 (?X_D SECOND.A))
		(!R3 (?X_D BASE.N))
		(!R4 (?X_G FIRST.A))
		(!R5 (?X_G BASE.N))
		(!R6 (?X_J BASEBALL.N))
		(!R7 (?X_M AGENT.N))
		(!R8 (?X_N AGENT.N))
		(!R9 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_I (?X_M PLAY.26.V))
		(?X_F (?X_N ((ADV-A (ON.P ?X_G)) BE.V)))
		(?X_L (?X_N ((ADV-A (FROM.P ?L1)) RUN.25.V) ?L2))
		(?X_B (?X_N (((ADV-A (INTO.P ?X_D)) MAKE.V) ?X_C)))
	)
)



; "Mike went to see an old movie last night."
; "It was really boring."
; "He fell asleep."
; "When he woke up, he realized he missed the ending."
(EPI-SCHEMA ((?X_F ((ADV-A (TO.P ?X_E)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D ASLEEP.A))
		(!R2 (?X_E OLD.A))
		(!R3 (?X_E MOVIE.N))
		(!R4 (?X_E (REALLY.ADV BORING.A)))
		(!R5 (?X_E DESTINATION.N))
		(!R6 (?X_F AGENT.N))
	)
	(:STEPS
		(?X_A (?X_F ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_E))
		(?X_C (?X_F (FALL.V ?X_D)))
	)
)

; "'I want to watch a movie,' Mike said."
; "'What kind of movie do you want to watch?' Mary asked."
; "'I don't know,' Mike answered."
; "'Let's watch a comedy movie,' Mary suggested."
; "'That sounds okay,' Mike agreed."
(EPI-SCHEMA ((?X_B (WATCH.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_B AGENT.N))
		(!R2 (?X_E (PERTAIN-TO ?X_F)))
		(!R3 (?X_G COMEDY.N))
		(!R4 (?X_G MOVIE.N))
	)
	(:STEPS
		(?X_D (?X_B ASK.V))
		(?X_A (?X_E (WATCH.V ?X_G)))
	)
)

; "Mike saw a movie."
; "It was very interesting."
; "He liked the movie."
; "He watched it for two hours."
(EPI-SCHEMA ((?X_G (LIKE.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_H (VERY.ADV INTERESTING.A)))
		(!R2 (?X_H MOVIE.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (NOT (?X_H ACTION.N)))
		(!R5 (NOT (?X_H AGENT.N)))
	)
	(:STEPS
		(?X_D (?X_G SEE.2.V ?X_H))
		(?X_F (?X_G LIKE.3.V ?X_H))
		(?X_B (?X_G (((ADV-A (FOR.P (TWO.D (PLUR HOUR.N)))) WATCH.V) ?X_H)))
	)
)

; "Tom liked to watch movies."
; "Last week, Tom saw a new movie."
; "This week, he watched a new movie."
; "Tom's friend told him about a new movie that will be released soon."
; "That movie is called \"The Greatest Movie Ever Made\"."
; "When Tom sees this movie, he will understand why it is the greatest movie ever made."
(EPI-SCHEMA ((?X_T (WATCH.V ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_C GREATEST.A))
		(!R2 (?X_C MOVIE.N))
		(!R3 (?X_D MOVIE.N))
		(!R4 (?X_D NEW.A))
		(!R5 (?X_G ?X_H MOVIE.N))
		(!R6 (?X_L FRIEND.N))
		(!R7 (?X_K NEW.A))
		(!R8 (?X_K MOVIE.N))
		(!R9 (?X_L (PERTAIN-TO ?X_T)))
		(!R10 (?X_M WEEK.N))
		(!R11 (?X_S (PLUR MOVIE.N)))
		(!R12 (?X_R NEW.A))
		(!R13 (?X_R MOVIE.N))
		(!R14 ((KA (WATCH.V ?X_S)) ACTION.N))
		(!R15 (?X_T AGENT.N))
	)
	(:STEPS
		(?X_F (?X_L (((ADV-A (ABOUT.P ?X_G)) TELL.V) ?X_T)))
		(?X_O (?X_T LIKE.4.V (KA (WATCH.V ?X_S))))
		(?X_Q (?X_T SEE.5.V ?X_R))
		(?X_J ((ADV-E ({DURING}.P ?X_M)) (?X_T (WATCH.V ?X_K))))
		(?X_B (?X_D ((PASV CALL.V) (KE (?X_C (EVER.ADV (PASV MAKE.V)))))))
	)
)

; "I went to the mall today."
; "I found a lot of things."
; "I bought a new pair of shoes."
; "I also bought a dress."
; "I wore both items."
(EPI-SCHEMA ((?X_R (BUY.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_C DRESS.N))
		(!R2 (?X_G (OF.P ?X_F)))
		(!R3 (?X_G ?X_H PAIR.N))
		(!R4 (?X_Q MALL.N))
		(!R5 (?X_Q TODAY.N))
		(!R6 (?X_L (PLUR THING.N)))
		(!R7 (?X_K LOT.N))
		(!R8 (?X_K (OF.P ?X_L)))
		(!R9 (?X_Q DESTINATION.N))
		(!R10 ((BOTH.D (PLUR ITEM.N)) OBJECT.N))
		(!R11 (NOT ((BOTH.D (PLUR ITEM.N)) AGENT.N)))
		(!R12 (?X_R AGENT.N))
	)
	(:STEPS
		(?X_J (?X_R ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_Q))
		(?X_N (?X_R FIND.6.V ?X_K))
		(?X_E (?X_R (BUY.V ?X_G)))
		(?X_B (?X_R ((ALSO.ADV BUY.V) ?X_C)))
		(?X_P (?X_R WEAR.7.V (BOTH.D (PLUR ITEM.N))))
	)
)

; "Amit went shopping."
; "He liked clothes."
; "He bought some clothes."
; "He looked for a hat."
; "He found one."
; "He bought that too."
(EPI-SCHEMA ((?X_L ((ADV-A (FROM.P ?L2)) (SOMEWHERE.ADV GO.V))) ** ?E)
	(:ROLES
		(!R1 (?X_D HAT.N))
		(!R2 (?X_G (PLUR CLOTHE.N)))
		(!R3 (?X_L AGENT.N))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_I (?X_O ((ADV-A (FROM.P ?L1)) GO.8.V) ?L2))
		(?X_K (?X_O LIKE.9.V (IND (0 ?X_A))))
		(?X_F (?X_O (BUY.V ?X_G)))
		(?X_C (?X_O ((ADV-A (FOR.P ?X_D)) LOOK.V)))
		(?X_N (?X_O FIND.6.V ?X_L))
	)
)

; "Tom went shopping."
; "He looked around for something."
; "He saw some clothes."
; "He liked them."
; "He bought them."
(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA.PR ?L2 ?X_N (IND (0 ?X_A)))) ** ?E)
	(:ROLES
		(!R1 (?X_N (PLUR CLOTHE.N)))
		(!R2 (?X_F THING.N))
		(!R3 (?L2 DESTINATION.N))
		(!R4 (?X_M AGENT.N))
		(!R5 (?X_N ENTITY.N))
	)
	(:STEPS
		(?X_H (?X_M ((ADV-A (FROM.P ?L1)) GO.8.V) ?L2))
		(?X_E (?X_M ((ADV-A (FOR.P ?X_F)) LOOK_AROUND.V)))
		(?X_J (?X_M SEE.10.V ?X_N))
		(?X_L (?X_M LIKE.11.V (IND (0 ?X_A))))
		(?X_C (?X_M (BUY.V ?X_N)))
	)
)

; "Asha went shopping at the mall."
; "She looked for clothes."
; "She saw some clothes that she liked."
; "She bought them."
(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA.PR ?L2 ?X_J ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_J (PLUR CLOTHE.N)))
		(!R2 (?X_L (PLUR CLOTHE.N)))
		(!R3 (?X_K MALL.N))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?X_I AGENT.N))
		(!R6 (?X_J ENTITY.N))
		(!R7 (?X_L OBJECT.N))
		(!R8 (?X_K AGENT.N))
		(!R9 (NOT (?X_L ACTION.N)))
		(!R10 (NOT (?X_L AGENT.N)))
	)
	(:STEPS
		(?X_F (?X_I ((ADV-A (FROM.P ?L1)) GO.8.V) ?L2))
		(?X_D (?X_I ((ADV-A (FOR.P ?X_L)) LOOK.V)))
		(?X_H (?X_I SEE.12.V ?X_J))
		(?X_B (?X_I (BUY.V ?X_J)))
		(?E_1 (?X_K LIKE.13.V ?X_L))
	)
)

; "Tom walked into the mall."
; "There were many stores there."
; "Tom looked around."
; "He saw a shoe store."
; "He decided to look for a new pair of shoes."
(EPI-SCHEMA ((?X_M ((ADV-A (AROUND.P ?X_L)) LOOK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_L MALL.N))
		(!R2 (?X_I SHOE.N))
		(!R3 (?X_I STORE.N))
		(!R4 (?X_J (PLUR SHOE.N)))
		(!R5 (?X_N (OF.P ?X_J)))
		(!R6 (?X_K NEW.A))
		(!R7 (?X_N ?X_K PAIR.N))
		(!R8 (?X_L DESTINATION.N))
		(!R9 (?X_M AGENT.N))
		(!R10 (?X_N ENTITY.N))
	)
	(:STEPS
		(?X_F (?X_M ((ADV-A (FROM.P ?L1)) WALK.14.V) ?X_L))
		(?X_D (?X_M (AROUND.ADV LOOK.V)))
		(?X_H (?X_M SEE.15.V ?X_I))
		(?X_B (?X_M ((ADV-A (FOR.P ?X_N)) LOOK.V)))
		(?E_1 (?X_M ((ADV-A (FOR.P ?X_N)) LOOK.16.V)))
	)
)

; "Jessica was shopping at the mall."
; "She saw a dress that caught her eye."
; "She liked the color."
; "She tried on the dress."
; "She looked great in it."
; "She paid for the dress."
(EPI-SCHEMA ((?X_P ((ADV-A (ON.P ?X_H)) TRY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E ((ADV-A (IN.P ?X_H)) GREAT.A)))
		(!R2 (?X_H DRESS.N))
		(!R3 (?X_K MALL.N))
		(!R4 (?X_Q COLOR.N))
		(!R5 (?X_Q OBJECT.N))
		(!R6 (?X_P AGENT.N))
		(!R7 (NOT (?X_Q ACTION.N)))
		(!R8 (NOT (?X_Q AGENT.N)))
	)
	(:STEPS
		(?X_J (?X_P ((ADV-A (AT.P ?X_K)) SHOP.V)))
		(?X_M (?X_P SEE.17.V ?X_H))
		(?X_O (?X_P LIKE.18.V ?X_Q))
		(?X_G (?X_P ((ADV-A (ON.P ?X_H)) TRY.V)))
		(?X_D (?X_P (LOOK.V ?X_E)))
		(?X_B (?X_P ((ADV-A (FOR.P ?X_H)) PAY.V)))
	)
)

; "Tom loves shopping."
; "He goes to the mall often."
; "He buys lots of stuff."
; "He likes buying clothes."
(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA.PR ?X_C (KA SHOP.V) ?X_K ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR LOT.N)))
		(!R2 (?X_C (OF.P ?X_D)))
		(!R3 (?X_K MALL.N))
		(!R4 (?X_M BUYING.N))
		(!R5 (?X_M (PLUR CLOTHE.N)))
		(!R6 ((KA SHOP.V) ACTION.N))
		(!R7 (?X_K DESTINATION.N))
		(!R8 (?X_L AGENT.N))
		(!R9 (NOT (?X_M ACTION.N)))
		(!R10 (NOT (?X_M AGENT.N)))
		(!R11 (?X_M OBJECT.N))
	)
	(:STEPS
		(?X_F (?X_L LOVE.19.V (KA SHOP.V)))
		(?X_H (?X_L ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_K))
		(?X_B (?X_L (BUY.V ?X_C)))
		(?X_J (?X_L LIKE.20.V ?X_M))
	)
)



; "The man walked into the room."
; "There was a lot of smoke there."
; "He opened the window."
; "Then he closed it."
; "He left the room."
(EPI-SCHEMA ((?X_J ((ADV-A (INTO.P ?X_Q)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_Q ROOM.N))
		(!R2 (?X_J WINDOW.N))
		(!R3 (?X_K MALE.A))
		(!R4 (?X_K AGENT.N))
		(!R5 (?X_N LOT.N))
		(!R6 (?X_N (OF.P ?X_O)))
		(!R7 (?X_P MAN.N))
		(!R8 (?X_Q DESTINATION.N))
	)
	(:STEPS
		(?X_C (?X_P ((ADV-A (FROM.P ?L1)) WALK.1.V) ?X_Q))
		(?X_M (?X_A (BE.V ?X_N)))
		(?X_I (?X_K (OPEN.V ?X_J)))
		(?X_G (?X_K ((THEN.ADV CLOSE.V) ?X_B)))
		(?X_E (?X_K (LEAVE.V ?X_Q)))
	)
)

; "Tom's house was on fire."
; "The firemen came."
; "They put out the fire."
; "Tom's house was okay."
(EPI-SCHEMA ((?X_D ((ADV-A (TO.P ?L2)) COME.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C FIRE.N))
		(!R2 (?X_D (PLUR FIREMAN.N)))
		(!R3 (?X_G FIRE.N))
		(!R4 (?X_H OKAY.A))
		(!R5 (?X_H HOUSE.N))
		(!R6 (?X_H (PERTAIN-TO ?X_I)))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_H ((ADV-A (ON.P ?X_G)) BE.V)))
		(?X_K (?X_D ((ADV-A (FROM.P ?L1)) COME.2.V) ?L2))
		(?X_B (?X_D (PUT_OUT.V ?X_C)))
	)
)

; "Amber's house is small."
; "She has two bedrooms."
; "In one bedroom, there are lots of toys."
; "In the other bedroom, there are some toys."
(EPI-SCHEMA ((?X_I (HAVE.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR TOY.N)))
		(!R2 (?X_E OTHER.A))
		(!R3 (?X_E BEDROOM.N))
		(!R4 (?X_H SMALL.A))
		(!R5 (?X_H HOUSE.N))
		(!R6 (?X_H (PERTAIN-TO ?X_I)))
		(!R7 ((TWO.D (PLUR BEDROOM.N)) OBJECT.N))
		(!R8 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_G (?X_I HAVE.3.V (TWO.D (PLUR BEDROOM.N))))
		(?X_C (?X_A (((ADV-A (IN.P ?X_E)) BE.V) ?X_D)))
	)
)

; "The man walked into the room."
; "There was lots of smoke in the room."
; "The man opened the window."
; "The man closed the window."
; "The man left the room."
(EPI-SCHEMA ((?X_F (WALK.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_F MAN.N))
		(!R2 (?X_I MAN.N))
		(!R3 (?X_I WINDOW.N))
		(!R4 (?X_I ROOM.N))
		(!R5 (?X_P ROOM.N))
		(!R6 (?X_P MAN.N))
		(!R7 (?X_L (PLUR LOT.N)))
		(!R8 (?X_L (OF.P ?X_M)))
		(!R9 (?X_P DESTINATION.N))
	)
	(:STEPS
		(?X_O (?X_I ((ADV-A (FROM.P ?L1)) WALK.1.V) ?X_P))
		(?X_K (?X_A (BE.V ?X_L)))
		(?X_H (?X_P (OPEN.V ?X_I)))
		(?X_E (?X_F (CLOSE.V ?X_I)))
		(?X_C (?X_F (LEAVE.V ?X_I)))
	)
)

; "John went to a restaurant."
; "When he arrived, the hostess told him that they were full."
; "The hostess pointed to where John should sit."
(EPI-SCHEMA ((?X_C ((ADV-A (TO.P ?X_D)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D RESTAURANT.N))
		(!R2 (?X_C AGENT.N))
		(!R3 (?X_D DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_C ((ADV-A (FROM.P ?L1)) GO.4.V) ?X_D))
	)
)

; "Bob went to a restaurant."
; "The food was delicious."
; "The waiter brought Bob some ice cream."
; "The waiter asked Bob if he would like anything else."
(EPI-SCHEMA ((?X_G (((ADV-A (TO.P ?X_E)) BRING.V) ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_E RESTAURANT.N))
		(!R2 (?X_F WAITER.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_E DESTINATION.N))
		(!R5 (?X_G SMALLER-THAN.N ?X_F))
		(!R6 (?X_G DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_G ((ADV-A (FROM.P ?L1)) GO.4.V) ?X_E))
		(?X_D (?X_F BRING.5.V ?X_G ?X_G))
	)
)

; "Tom liked to play basketball."
; "He played on a team."
; "He practiced hard."
; "He learned how to shoot baskets."
(EPI-SCHEMA ((?X (PLAY.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C HARD.A))
		(!R2 (?X_H BASKETBALL.N))
		(!R3 ((KA (PLAY.V ?X_H)) ACTION.N))
		(!R4 (?X AGENT.N))
		(!R5 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_E (?X_I LIKE.6.V (KA (PLAY.V ?X_H))))
		(?E_1 (?X PLAY.7.V))
		(?X_G (?X_I PLAY.8.V))
		(?X_B (?X_I (PRACTICE.V ?X_C)))
	)
)

; "Lisa went to a party."
; "She had a lot of friends there."
; "She played games."
; "She danced."
; "She felt happy."
(EPI-SCHEMA ((?X_O ((ADV-A (TO.P ?X_N)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D HAPPY.A))
		(!R2 (?X_G (PLUR GAME.N)))
		(!R3 (?X_N PARTY.N))
		(!R4 (?X_N DESTINATION.N))
		(!R5 (?X_O AGENT.N))
		(!R6 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_K (?X_O ((ADV-A (FROM.P ?L1)) GO.4.V) ?X_N))
		(?X_I (?X_O (HAVE.V ?X_A)))
		(?X_F (?X_O (PLAY.V ?X_G)))
		(?X_M (?X_O ((ADV-A (FROM.P ?L1)) DANCE.9.V) ?L2))
		(?X_C (?X_O (FEEL.V ?X_D)))
	)
)

; "Sarah's house is small."
; "There are only two rooms."
; "Her bedroom has a bed."
; "Her kitchen has a table."
; "The bathroom has a sink."
(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA.PR ?X_D ?X_G ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_C BEDROOM.N))
		(!R2 (?X_C (PERTAIN-TO ?X_F)))
		(!R3 (?X_D BED.N))
		(!R4 (?X_E KITCHEN.N))
		(!R5 (?X_E (PERTAIN-TO ?X_F)))
		(!R6 (?X_G TABLE.N))
		(!R7 (?X_H BATHROOM.N))
		(!R8 (?X_I SINK.N))
	)
	(:STEPS
		(?X_A (?X_C (HAVE.V ?X_D)))
		(?X_B (?X_E (HAVE.V ?X_G)))
		(?X_K (?X_H (HAVE.V ?X_I)))
	)
)

; "Ravi went into the kitchen."
; "There was a lot of smoke there."
; "He opened the windows."
; "The smoke cleared away."
; "He closed the windows."
(EPI-SCHEMA ((?X_Q (OPEN.V ?X_P)) ** ?E)
	(:ROLES
		(!R1 (?X_M SMOKE.N))
		(!R2 (?X_H (PLUR WINDOW.N)))
		(!R3 (?X_I MALE.A))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_L LOT.N))
		(!R6 (?X_L (OF.P ?X_M)))
		(!R7 (?X_P KITCHEN.N))
		(!R8 (?X_P DESTINATION.N))
		(!R9 (?X_Q AGENT.N))
	)
	(:STEPS
		(?X_O (?X_Q ((ADV-A (FROM.P ?L1)) GO.4.V) ?X_P))
		(?X_K (?X_A (BE.V ?X_L)))
		(?X_G (?X_I (OPEN.V ?X_H)))
		(?X_E (?X_M CLEAR_AWAY.V))
		(?X_C (?X_I (CLOSE.V ?X_H)))
	)
)

; "Mike worked for the company."
; "He worked hard all week."
; "On Saturday, he played golf."
; "Mike's boss paid him well."
(EPI-SCHEMA ((?X_I (HARD.ADV ((ADV-A (FOR.P ?X_G)) WORK.V))) ** ?E)
	(:ROLES
		(!R1 (?X_H BOSS.N))
		(!R2 (?X_G COMPANY.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_H (PERTAIN-TO ?X_I)))
		(!R5 (?X_L GOLF.N))
		(!R6 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_F (?X_I ((ADV-A (FOR.P ?X_G)) WORK.V)))
		(?X_D ((ADV-E ({DURING}.P (ALL.D WEEK.N))) (?X_I (HARD.ADV WORK.V))))
		(?X_K (?X_M PLAY.11.V))
		(?X_B (?X_H ((WELL.ADV PAY.V) ?X_I)))
	)
)

; "Lisa worked in an office."
; "She liked her job."
; "She sat down at her desk."
; "She opened a file."
; "She read some papers."
(EPI-SCHEMA ((?X_N ((ADV-A (AT.P ?X_N)) SIT_DOWN.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR PAPER.N)))
		(!R2 (?X_H FILE.N))
		(!R3 (?X_L DESK.N))
		(!R4 (?X_K OFFICE.N))
		(!R5 (?X_L (PERTAIN-TO ?X_M)))
		(!R6 (?X_N JOB.N))
		(!R7 (?X_N (PERTAIN-TO ?X_M)))
		(!R8 (?X_N OBJECT.N))
		(!R9 (?X_M AGENT.N))
		(!R10 (NOT (?X_N ACTION.N)))
		(!R11 (NOT (?X_N AGENT.N)))
	)
	(:STEPS
		(?X_J (?X_M ((ADV-A (IN.P ?X_K)) WORK.V)))
		(?X_A (?X_M LIKE.12.V ?X_N))
		(?X_B (?X_M (DOWN.ADV ((ADV-A (AT.P ?X_L)) SIT.V))))
		(?X_G (?X_M (OPEN.V ?X_H)))
		(?X_D (?X_M (READ.V ?X_E)))
	)
)

; "Bob worked hard all week."
; "He put on his uniform."
; "He walked into the office."
; "He sat down at his desk."
(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA.PR ?X_E ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_F DESK.N))
		(!R2 (?X_E UNIFORM.N))
		(!R3 (?X_E (PERTAIN-TO ?X_I)))
		(!R4 (?X_F (PERTAIN-TO ?X_I)))
		(!R5 (?X_J OFFICE.N))
		(!R6 (?X_I AGENT.N))
		(!R7 (?X_J DESTINATION.N))
	)
	(:STEPS
		(?X_D ((ADV-E ({DURING}.P (ALL.D WEEK.N))) (?X_I (HARD.ADV WORK.V))))
		(?X_A (?X_I (PUT_ON.V ?X_E)))
		(?X_H (?X_I ((ADV-A (FROM.P ?L1)) WALK.1.V) ?X_J))
		(?X_B (?X_I (DOWN.ADV ((ADV-A (AT.P ?X_F)) SIT.V))))
	)
)

; "The man worked all day."
; "He went home after work."
; "The man's boss told him to do something."
; "The man did what he was told."
(EPI-SCHEMA ((?X_K (TELL.V ?X_K (KA (DO.V ?X_K)))) ** ?E)
	(:ROLES
		(!R1 (?X_M MAN.N))
		(!R2 (?X_J HOME.N))
		(!R3 (?X_J (PERTAIN-TO ?X_M)))
		(!R4 (?X_L BOSS.N))
		(!R5 (?X_L (PERTAIN-TO ?X_M)))
		(!R6 (?X_K THING.N))
		(!R7 (?X_J DESTINATION.N))
		(!R8 ((KA (DO.V ?X_K)) ACTION.N))
		(!R9 (?X_L AGENT.N))
		(!R10 (NOT (?X_L = ?X_M)))
	)
	(:STEPS
		(?X_E ((ADV-E ({DURING}.P (ALL.D DAY.N))) (?X_M WORK.V)))
		(?X_G (?X_M ((ADV-A (FROM.P ?L1)) GO.4.V) ?X_J))
		(?X_I (?X_L TELL.13.V ?X_M (KA (DO.V ?X_K))))
		(?X_C (?X_M (DO.V (ANS-TO (?X_M ((PASV TELL.V) ?X_A))))))
	)
)

; "Bill woke up late."
; "He couldn't find his keys."
; "He found them under the bed."
; "He locked the door behind him."
(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA.PR ?X_D ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_D DOOR.N))
		(!R2 (?X_G (PLUR KEY.N)))
		(!R3 (?X_J BILL.N))
		(!R4 (?X_G (PERTAIN-TO ?X_J)))
		(!R5 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_F (?X_J (LATE.ADV WAKE_UP.V)))
		(?X_A (NOT (?X_J ((CAN.MD FIND.V) ?X_G))))
		(?X_I (?X_J FIND.14.V ?X_G))
		(?X_C (?X_J (((ADV-A (BEHIND.P ?X_J)) LOCK.V) ?X_D)))
	)
)



; "The man was playing golf."
; "He shot a hole-in-one."
; "He won $10,000."
; "He bought a diamond ring."
(EPI-SCHEMA ((?X_I (PLAY.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_D DIAMOND.N))
		(!R2 (?X_D RING.N))
		(!R3 (?X_E MALE.A))
		(!R4 (?X_E AGENT.N))
		(!R5 (?X_F GOLF.N))
		(!R6 (?X_I MAN.N))
		(!R7 (?X_J HOLE-IN-ONE.N))
		(!R8 (?X_J OBJECT.N))
	)
	(:STEPS
		(?X_A (?X_I PLAY.1.V))
		(?X_H (?X_I SHOOT.2.V ?X_J))
		(?X_C (?X_E (BUY.V ?X_D)))
	)
)

; "Tina played golf."
; "She enjoyed playing golf."
; "She played on the links."
; "She played in tournaments."
(EPI-SCHEMA ((?X ((ADV-A (WITH.P ?X_D)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR LINK.N)))
		(!R2 (?X_G GOLF.N))
		(!R3 (?X_L GOLF.N))
		(!R4 (?X AGENT.N))
		(!R5 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_F (?X_M PLAY.3.V))
		(?E_1 (?X PLAY.4.V))
		(?X_I (?X_M ENJOY.5.V (IND (1 ?X_A))))
		(?X_C (?X_M (PLAY_ON.V ?X_D)))
		(?X_K (?X_M PLAY.6.V))
	)
)

; "Tom played golf."
; "He tried hard."
; "He missed some shots."
; "He lost the game."
(EPI-SCHEMA ((?X_M (PLAY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C GAME.N))
		(!R2 (?X_F (PLUR SHOT.N)))
		(!R3 (?X_I HARD.A))
		(!R4 (?X_L GOLF.N))
		(!R5 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_K (?X_M PLAY.7.V))
		(?X_H (?X_M (TRY.V ?X_I)))
		(?X_E (?X_M (MISS.V ?X_F)))
		(?X_B (?X_M (LOSE.V ?X_C)))
	)
)

; "Mike played golf."
; "He scored well on the first round."
; "He scored poorly on the second round."
; "He missed some easy putts."
; "He lost money on the third round."
; "He won money on the fourth round."
(EPI-SCHEMA ((?X_T (PLAY.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C MONEY.N))
		(!R2 (?X_D FOURTH.A))
		(!R3 (?X_D ROUND.N))
		(!R4 (?X_G EASY.A))
		(!R5 (?X_G (PLUR PUTT.N)))
		(!R6 (?X_J SECOND.A))
		(!R7 (?X_J ROUND.N))
		(!R8 (?X_M FIRST.A))
		(!R9 (?X_M ROUND.N))
		(!R10 (?X_P GOLF.N))
		(!R11 (?X_S MONEY.N))
		(!R12 (?X_S OBJECT.N))
		(!R13 (?X_T AGENT.N))
	)
	(:STEPS
		(?X_O (?X_T PLAY.8.V))
		(?X_L (?X_T (WELL.ADV ((ADV-A (ON.P ?X_M)) SCORE.V))))
		(?X_I (?X_T (POORLY.ADV ((ADV-A (ON.P ?X_J)) SCORE.V))))
		(?X_F (?X_T (MISS.V ?X_G)))
		(?X_R (?X_T LOSE.9.V ?X_S))
		(?X_B (?X_T (((ADV-A (ON.P ?X_D)) WIN.V) ?X_C)))
	)
)

; "Bill played golf."
; "He hit many balls."
; "He lost some money."
; "He won some money."
(EPI-SCHEMA ((?X_C PLAY.V) ** ?E)
	(:ROLES
		(!R1 (?X_C MONEY.N))
		(!R2 (?X_F MANY.A))
		(!R3 (?X_F (PLUR BALL.N)))
		(!R4 (?X_L BILL.N))
		(!R5 (?X_I GOLF.N))
		(!R6 (?X_M MONEY.N))
		(!R7 (?X_L AGENT.N))
		(!R8 (?X_M OBJECT.N))
	)
	(:STEPS
		(?X_H (?X_L PLAY.10.V))
		(?X_E (?X_L (HIT.V ?X_F)))
		(?X_K (?X_L LOSE.11.V ?X_M))
		(?X_B (?X_L (WIN.V ?X_C)))
	)
)

; "Bob played golf."
; "He missed the ball on one hole."
; "He lost some money."
(EPI-SCHEMA ((?X_J PLAY.V) ** ?E)
	(:ROLES
		(!R1 (?X_C BALL.N))
		(!R2 (?X_D HOLE.N))
		(!R3 (?X_G GOLF.N))
		(!R4 (?X_K MONEY.N))
		(!R5 (?X_J AGENT.N))
		(!R6 (?X_K OBJECT.N))
	)
	(:STEPS
		(?X_F (?X_J PLAY.12.V))
		(?X_B (?X_J (((ADV-A (ON.P ?X_D)) MISS.V) ?X_C)))
		(?X_I (?X_J LOSE.13.V ?X_K))
	)
)

; "Bill played golf."
; "He drove the ball far."
; "He hit the ball into the woods."
; "He lost the ball."
(EPI-SCHEMA ((?X_M ((ADV-A (WITH.P ?X_L)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_L BALL.N))
		(!R2 (?X_E (PLUR WOOD.N)))
		(!R3 (?X_H GOLF.N))
		(!R4 (?X_K BILL.N))
		(!R5 (?X_K AGENT.N))
		(!R6 (?X_M AGENT.N))
		(!R7 (?X_L SMALLER-THAN.N ?X_M))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_G (?X_K PLAY.14.V))
		(?X_J (?X_M DRIVE.15.V ?X_L ?L2))
		(?X_D (?X_M (((ADV-A (INTO.P ?X_E)) HIT.V) ?X_L)))
		(?X_B (?X_M (LOSE.V ?X_L)))
	)
)

; "Joe played golf."
; "He missed the ball."
; "He hit the ball into the woods."
; "He lost his ball."
; "He found his ball."
(EPI-SCHEMA ((?X_M ((ADV-A (WITH.P ?X_I)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_I BALL.N))
		(!R2 (?X_E (PLUR WOOD.N)))
		(!R3 (?X_H BALL.N))
		(!R4 (?X_I (PERTAIN-TO ?X_M)))
		(!R5 (?X_L GOLF.N))
		(!R6 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_K (?X_M PLAY.16.V))
		(?X_G (?X_M (MISS.V ?X_H)))
		(?X_D (?X_M (((ADV-A (INTO.P ?X_E)) HIT.V) ?X_H)))
		(?X_A (?X_M (LOSE.V ?X_I)))
		(?X_B (?X_M FIND.17.V ?X_I))
	)
)

; "Bob played golf."
; "He hit the ball into the woods."
; "He lost his ball."
; "He found it."
(EPI-SCHEMA ((?X_L ((ADV-A (WITH.P ?X_F)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F BALL.N))
		(!R2 (?X_D BALL.N))
		(!R3 (?X_E (PLUR WOOD.N)))
		(!R4 (?X_F (PERTAIN-TO ?X_L)))
		(!R5 (?X_I GOLF.N))
		(!R6 (?X_L AGENT.N))
		(!R7 (?X_M ENTITY.N))
	)
	(:STEPS
		(?X_H (?X_L PLAY.18.V))
		(?X_C (?X_L (((ADV-A (INTO.P ?X_E)) HIT.V) ?X_D)))
		(?X_A (?X_L (LOSE.V ?X_F)))
		(?X_K (?X_L FIND.17.V ?X_M))
	)
)

; "Tom played golf."
; "He hit the ball on the green."
; "He got a birdie."
; "He shot a hole-in-one."
(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA.PR ?X_C ?X_L ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_C BALL.N))
		(!R2 (?X_D GREEN.N))
		(!R3 (?X_G GOLF.N))
		(!R4 (?X_L BIRDIE.N))
		(!R5 (?X_N HOLE-IN-ONE.N))
		(!R6 (?X_L OBJECT.N))
		(!R7 (?X_M AGENT.N))
		(!R8 (?X_N OBJECT.N))
	)
	(:STEPS
		(?X_F (?X_M PLAY.19.V))
		(?X_B (?X_M (((ADV-A (ON.P ?X_D)) HIT.V) ?X_C)))
		(?X_I (?X_M GET.20.V ?X_L))
		(?X_K (?X_M SHOOT.21.V ?X_N))
	)
)

; "The man was taking a walk."
; "He met a bear cub."
; "The bear cub followed him."
; "The man tried to scare the bear cub."
; "The bear cub did not run away."
(EPI-SCHEMA ((?X_H
              (TRY.V
               (KA
                (((ADV-A (BY.P (KA ((ADV-A (PAST.P ?X_G)) WALK.V)))) SCARE.V)
                 ?X_G))))
             ** ?E)
	(:ROLES
		(!R1 (?X_G BEAR.N))
		(!R2 (?X_G CUB.N))
		(!R3 (?X_H MAN.N))
		(!R4 (?X_M WALK.N))
		(!R5 (?X_M DESTINATION.N))
	)
	(:STEPS
		(?X_J (?X_H ((ADV-A (FROM.P ?L1)) TAKE.22.V) ?X_M))
		(?X_F (?X_H (MEET.V ?X_G)))
		(?X_L (?X_G FOLLOW.23.V ?X_H))
		(?X_D (?X_H (TRY.V (KA (SCARE.V ?X_G)))))
		(?X_B (NOT (?X_G (AWAY.ADV RUN.V))))
	)
)

; "Bob walked into the woods."
; "There were many trees there."
; "He saw some birds flying around."
; "He heard a bird singing."
(EPI-SCHEMA ((?X_J ((ADV-A (THROUGH.P ?X_H)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_H (PLUR WOOD.N)))
		(!R2 (?X_G BIRD.N))
		(!R3 (?X_G SINGING.N))
		(!R4 (?X_H DESTINATION.N))
		(!R5 (?X_I ENTITY.N))
		(!R6 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_B (?X_J ((ADV-A (FROM.P ?L1)) WALK.24.V) ?X_H))
		(?X_D (?X_J SEE.25.V ?X_I))
		(?X_F (?X_J HEAR.26.V ?X_G))
	)
)

; "A man was walking through a park."
; "He saw a little bear cub."
; "The man thought the bear cub would be afraid of him."
; "But the bear cub just walked by."
(EPI-SCHEMA ((?X_E ((ADV-A (TO.P ?L2)) WALK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E LITTLE.A))
		(!R2 (?X_E BEAR.N))
		(!R3 (?X_E CUB.N))
		(!R4 (?X_F MAN.N))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_F ((ADV-A (FROM.P ?L1)) WALK.27.V) ?L2))
		(?X_D (?X_F SEE.28.V ?X_E))
	)
)

; "Joe liked to play baseball."
; "One day he played baseball."
; "A boy who lived near Joe's house came over."
; "The boy told Joe that he could play too."
(EPI-SCHEMA ((?X_H (((ADV-A (WITH.P ?X_C)) PLAY.V) ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_C BOY.N))
		(!R2 (?X_F HOUSE.N))
		(!R3 (?X_F BOY.N))
		(!R4 (?X_F (PERTAIN-TO ?X_H)))
		(!R5 (?X_G BASEBALL.N))
		(!R6 ((KA (PLAY.V ?X_G)) ACTION.N))
		(!R7 (?X_H AGENT.N))
		(!R8 (?X AGENT.N))
	)
	(:STEPS
		(?X_E (?X_H LIKE.29.V (KA (PLAY.V ?X_G))))
		(?X_B (?X_C COME_OVER.V))
		(?E_1 (?X PLAY.4.V))
	)
)

; "Jenny saw a bear cub."
; "The bear cub was cute."
; "The bear cub ran after Jenny."
; "Jenny laughed."
(EPI-SCHEMA ((?X_H ((ADV-A (TO.P ?L2)) RUN.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E CUTE.A))
		(!R2 (?X_E BEAR.N))
		(!R3 (?X_E CUB.N))
		(!R4 (?X_H AGENT.N))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_D (?X_H SEE.30.V ?X_E))
		(?X_G (?X_E ((ADV-A (FROM.P ?L1)) RUN.31.V) ?L2))
		(?X_B (?X_H LAUGH.V))
	)
)

; "A boy saw a bear cub."
; "He called his friends."
; "They were afraid."
; "They ran away from the bear cub."
(EPI-SCHEMA ((?X_C (CALL.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B (PLUR FRIEND.N)))
		(!R2 (?X_B AFRAID.A))
		(!R3 (?X_C BOY.N))
		(!R4 (?X_B (PERTAIN-TO ?X_C)))
		(!R5 (?X_H BEAR.N))
		(!R6 (?X_H CUB.N))
		(!R7 (?X_H LOCATION.N))
		(!R8 (NOT (?X_H = ?L2)))
		(!R9 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_C SEE.32.V ?X_H))
		(?X_A (?X_C (CALL.V ?X_B)))
		(?X_G (?X_B ((ADV-A (FROM.P ?X_H)) RUN.33.V) ?L2))
	)
)

; "A boy named Tom played basketball."
; "He was on the team."
; "He played well."
; "He scored points for the team."
(EPI-SCHEMA ((?X_M (WELL.ADV ((ADV-A (FOR.P ?X_H)) PLAY.V))) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR POINT.N)))
		(!R2 (?X_H TEAM.N))
		(!R3 (?X_M AGENT.N))
		(!R4 (?X_K BASKETBALL.N))
		(!R5 (?X_L BOY.N))
		(!R6 (?X_L ((PASV NAME.V) ?X_M)))
	)
	(:STEPS
		(?X_J (?X_L PLAY.34.V))
		(?X_G (?X_M ((ADV-A (ON.P ?X_H)) BE.V)))
		(?X_E (?X_M (WELL.ADV PLAY.V)))
		(?X_B (?X_M (((ADV-A (FOR.P ?X_H)) SCORE.V) ?X_C)))
	)
)

; "John saw a bear cub."
; "He wondered if he could catch it."
; "He chased after the bear cub."
; "The bear cub ran away."
(EPI-SCHEMA ((?X_J (WONDER.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C BEAR.N))
		(!R2 (?X_C CUB.N))
		(!R3 (?X_J AGENT.N))
		(!R4 (?Y ENTITY.N))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_J SEE.35.V ?X_C))
		(?X_B (?X_J (WONDER.V (K (IF.P (?X_J (CAN.MD (CATCH.V ?X_C))))))))
		(?X_G (?X_J CHASE.36.V ?Y))
		(?X_I (?X_C ((ADV-A (FROM.P ?L1)) RUN_AWAY.37.V) ?L2))
	)
)

; "A boy named Tom played baseball."
; "He had a big game."
; "He was up to hit."
; "He hit a long drive."
; "He made a run and won the game."
(EPI-SCHEMA ((?X_P (HIT.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C RUN.N))
		(!R2 (?X_F LONG.A))
		(!R3 (?X_F DRIVE.N))
		(!R4 (?X_K BIG.A))
		(!R5 (?X_K GAME.N))
		(!R6 (?X_P AGENT.N))
		(!R7 (?X_N BASEBALL.N))
		(!R8 (?X_O BOY.N))
		(!R9 (?X_O ((PASV NAME.V) ?X_P)))
	)
	(:STEPS
		(?X_M (?X_O PLAY.38.V))
		(?X_J (?X_P (HAVE.V ?X_K)))
		(?X_H (?X_P (UP.ADV ((ADV-A (FOR.P (KA HIT.V))) BE.V))))
		(?X_E (?X_P (HIT.V ?X_F)))
		(?X_A (?X_P (MAKE.V ?X_C)))
		(?X_B (?X_P (WIN.V ?X_K)))
	)
)



; "I was going to watch TV."
; "I turned on the TV."
; "I changed channels."
; "I watched a movie."
; "I fell asleep watching the movie."
(EPI-SCHEMA ((?X_B (WATCH.V ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_B AGENT.N))
		(!R2 (?X_C TV.N))
		(!R3 (?X_F (PLUR CHANNEL.N)))
		(!R4 (?X_M MOVIE.N))
		(!R5 (?X_K AGENT.N))
		(!R6 (?X_L (ASLEEP.A (KA (WATCH.V ?X_M)))))
	)
	(:STEPS
		(?X_A (?X_K ((ADV-A (FOR.P (KA (WATCH.V ?X_B)))) GO.V)))
		(?X_E (?X_K ((ADV-A (ON.P ?X_C)) TURN.V)))
		(?X_H (?X_K (CHANGE.V ?X_F)))
		(?X_J (?X_K (WATCH.V ?X_M)))
		(?X_O (?X_K (FALL.V ?X_L)))
	)
)

; "Diane watched television."
; "She fell asleep while watching TV."
; "She woke up and read a book."
; "She slept again until morning."
(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA.PR ?X_C ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_C TELEVISION.N))
		(!R2 (?X_F AGENT.N))
		(!R3 (?X_I BOOK.N))
		(!R4 (?X_J AGENT.N))
		(!R5 (?X_K MORNING.N))
	)
	(:STEPS
		(?X_E (?X_J (WATCH.V ?X_C)))
		(?X_H (?X_J (ASLEEP.ADV ((ADV-A (WHILE.P (KA (WATCH.V ?X_F)))) FALL.V))))
		(?X_A (?X_J WAKE_UP.V))
		(?X_B (?X_J (READ.V ?X_I)))
		(?X_M (?X_J (AGAIN.ADV ((ADV-A (UNTIL.P ?X_K)) SLEEP.V))))
	)
)

; "John watched TV."
; "He saw a program about sports."
; "There were lots of sports games."
; "He liked sports."
(EPI-SCHEMA ((?X_H (WATCH.V ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR LOT.N)))
		(!R2 (?X_D (OF.P ?X_E)))
		(!R3 (?X_H AGENT.N))
		(!R4 (?X_K (PLUR SPORT.N)))
		(!R5 (?X_N PROGRAM.N))
		(!R6 (?X_N (ABOUT.P ?X_K)))
		(!R7 (?X_P (PLUR SPORT.N)))
		(!R8 (?X_N ENTITY.N))
		(!R9 (?X_O AGENT.N))
		(!R10 (?X_P OBJECT.N))
		(!R11 (NOT (?X_P ACTION.N)))
		(!R12 (NOT (?X_P AGENT.N)))
	)
	(:STEPS
		(?X_G (?X_O (WATCH.V ?X_H)))
		(?X_J (?X_O SEE.1.V ?X_N))
		(?X_C (?X_A (BE.V ?X_D)))
		(?X_M (?X_O LIKE.2.V ?X_P))
	)
)

; "John saw a movie."
; "He liked the movie."
; "He watched the movie again."
; "He watched a second movie."
(EPI-SCHEMA ((?X_J (LIKE.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_C SECOND.A))
		(!R2 (?X_C MOVIE.N))
		(!R3 (?X_K MOVIE.N))
		(!R4 (?X_J AGENT.N))
		(!R5 (NOT (?X_K ACTION.N)))
		(!R6 (NOT (?X_K AGENT.N)))
	)
	(:STEPS
		(?X_G (?X_J (SEE.V ?X_K)))
		(?X_I (?X_J LIKE.3.V ?X_K))
		(?X_E (?X_J ((AGAIN.ADV WATCH.V) ?X_K)))
		(?X_B (?X_J (WATCH.V ?X_C)))
	)
)

; "Karen watched TV all day."
; "She liked to watch movies."
; "She fell asleep while watching a movie."
(EPI-SCHEMA ((?X_F (ASLEEP.ADV ((ADV-A (WHILE.P (KA (WATCH.V ?X_C)))) FALL.V)))
             ** ?E)
	(:ROLES
		(!R1 (?X_C MOVIE.N))
		(!R2 (?X_G (PLUR MOVIE.N)))
		(!R3 (?X_F AGENT.N))
		(!R4 ((KA (WATCH.V ?X_G)) ACTION.N))
	)
	(:STEPS
		(?X_E (?X_F LIKE.4.V (KA (WATCH.V ?X_G))))
		(?X_B (?X_F (ASLEEP.ADV ((ADV-A (WHILE.P (KA (WATCH.V ?X_C)))) FALL.V))))
	)
)

; "Peter watched TV."
; "He liked watching movies."
; "He saw a movie."
; "He fell asleep while watching the movie."
(EPI-SCHEMA ((?X_H (WATCH.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E MOVIE.N))
		(!R2 (?X_H AGENT.N))
		(!R3 (?X_L (PLUR MOVIE.N)))
		(!R4 (?X_K AGENT.N))
		(!R5 ((KA (WATCH.V ?X_L)) ACTION.N))
	)
	(:STEPS
		(?X_G (?X_K (WATCH.V ?X_H)))
		(?X_J (?X_K LIKE.5.V (KA (WATCH.V ?X_L))))
		(?X_D (?X_K (SEE.V ?X_E)))
		(?X_B (?X_K (ASLEEP.ADV ((ADV-A (WHILE.P (KA (WATCH.V ?X_E)))) FALL.V))))
	)
)

; "Bill watched television."
; "He saw a show."
; "He saw a movie."
; "He saw an old movie."
; "He watched a cartoon."
; "He fell asleep while watching the cartoon."
(EPI-SCHEMA ((?X_R (COMPOSITE-SCHEMA.PR ?X_N ?X_K ?X_H ?X_E ?X_Q)) ** ?E)
	(:ROLES
		(!R1 (?X_E CARTOON.N))
		(!R2 (?X_H OLD.A))
		(!R3 (?X_H MOVIE.N))
		(!R4 (?X_K MOVIE.N))
		(!R5 (?X_N TELEVISION.N))
		(!R6 (?X_R BILL.N))
		(!R7 (?X_Q SHOW.N))
		(!R8 (?X_R AGENT.N))
	)
	(:STEPS
		(?X_M (?X_R (WATCH.V ?X_N)))
		(?X_P (?X_R SEE.6.V ?X_Q))
		(?X_J (?X_R (SEE.V ?X_K)))
		(?X_G (?X_R (SEE.V ?X_H)))
		(?X_D (?X_R (WATCH.V ?X_E)))
		(?X_B (?X_R (ASLEEP.ADV ((ADV-A (WHILE.P (KA (WATCH.V ?X_E)))) FALL.V))))
	)
)

; "Sammy liked to play sports."
; "He played basketball."
; "He played football."
; "He played soccer."
; "He played baseball."
(EPI-SCHEMA ((?X (PLAY.V ?X_O)) ** ?E)
	(:ROLES
		(!R1 (?X_O (PLUR SPORT.N)))
		(!R2 (?X_E BASKETBALL.N))
		(!R3 (?X_H FOOTBALL.N))
		(!R4 (?X_K SOCCER.N))
		(!R5 (?X_N BASEBALL.N))
		(!R6 ((KA (PLAY.V ?X_O)) ACTION.N))
		(!R7 (?X AGENT.N))
		(!R8 (?X_P AGENT.N))
	)
	(:STEPS
		(?X_B (?X_P LIKE.8.V (KA (PLAY.V ?X_O))))
		(?E_1 (?X PLAY.9.V))
		(?X_D (?X_P PLAY.10.V))
		(?X_G (?X_P PLAY.11.V))
		(?X_J (?X_P PLAY.12.V))
		(?X_M (?X_P PLAY.13.V))
	)
)

; "Sammy watched TV."
; "He saw a show about animals."
; "He learned that some animals have fur."
; "He also learned that some animals don't have fur."
(EPI-SCHEMA ((?X_G (LEARN.V (THAT (?X_D (HAVE.V ?X_C))))) ** ?E)
	(:ROLES
		(!R1 (?X_C FUR.N))
		(!R2 (?X_D (PLUR ANIMAL.N)))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_K (PLUR ANIMAL.N)))
		(!R5 (?X_J SHOW.N))
		(!R6 (?X_J (ABOUT.P ?X_K)))
		(!R7 (?X_O FUR.N))
		(!R8 (?X_N AGENT.N))
		(!R9 (?X_O OBJECT.N))
	)
	(:STEPS
		(?X_F (?X_N (WATCH.V ?X_G)))
		(?X_I (?X_N SEE.14.V ?X_J))
		(?X_B (?X_N (LEARN.V (THAT (?X_D (HAVE.V ?X_C))))))
		(?X_M (?X_N LEARN.15.V ?X_O))
	)
)

; "I went to the park today."
; "It was sunny."
; "I played basketball."
; "I lost."
(EPI-SCHEMA ((?X_I ((ADV-A (IN.P ?X_H)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_H PARK.N))
		(!R2 (?X_G BASKETBALL.N))
		(!R3 (?X_H DESTINATION.N))
		(!R4 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_D (?X_I ((ADV-A (FROM.P ?L1)) GO.16.V) ?X_H))
		(?X_F (?X_I PLAY.17.V))
		(?X_B (?X_I LOSE.V))
	)
)

; "Billy went to the park."
; "He played basketball."
; "He lost the game."
(EPI-SCHEMA ((?X_I ((ADV-A (IN.P ?X_H)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C BASKETBALL.N))
		(!R2 (?X_H PARK.N))
		(!R3 (?X_H DESTINATION.N))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_E (?X_I ((ADV-A (FROM.P ?L1)) GO.16.V) ?X_H))
		(?X_G (?X_J PLAY.18.V))
		(?X_B (?X_J (LOSE.V ?X_C)))
	)
)

; "A boy named Tom liked to play baseball."
; "He played on his team."
; "He played well."
; "He hit the ball hard."
; "He ran fast."
; "He scored many runs."
(EPI-SCHEMA ((?X_Q (PLAY.V ?X_P)) ** ?E)
	(:ROLES
		(!R1 (?X_D MANY.A))
		(!R2 (?X_D (PLUR RUN.N)))
		(!R3 (?X_G BALL.N))
		(!R4 (?X_P BASEBALL.N))
		(!R5 (?X_L BOY.N))
		(!R6 (?X_L ((PASV NAME.V) ?X_Q)))
		(!R7 (?X_M TEAM.N))
		(!R8 (?X_M (PERTAIN-TO ?X_Q)))
		(!R9 ((KA (PLAY.V ?X_P)) ACTION.N))
		(!R10 (?X AGENT.N))
		(!R11 (?X_Q AGENT.N))
		(!R12 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_K (?X_L LIKE.19.V (KA (PLAY.V ?X_P))))
		(?E_1 (?X PLAY.9.V))
		(?X_A (?X_Q PLAY.20.V))
		(?X_I (?X_Q (WELL.ADV PLAY.V)))
		(?X_F (?X_Q ((HARD.ADV HIT.V) ?X_G)))
		(?X_O (?X_Q ((ADV-A (FROM.P ?L1)) RUN.21.V) ?L2))
		(?X_C (?X_Q (SCORE.V ?X_D)))
	)
)

; "Tom went to the park."
; "It was sunny outside."
; "There were lots of kids there."
; "Tom threw a ball into the air."
; "A kid caught the ball."
; "Tom ran around the playground."
(EPI-SCHEMA ((?X_U (((ADV-A (INTO.P ?X_I)) THROW.V) ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_E KID.N))
		(!R2 (?X_H BALL.N))
		(!R3 (?X_I AIR.N))
		(!R4 (?X_L (PLUR LOT.N)))
		(!R5 (?X_O SUNNY.A))
		(!R6 (?X_O OUTSIDE.N))
		(!R7 (?X_T PARK.N))
		(!R8 (?X_T DESTINATION.N))
		(!R9 (?X_U AGENT.N))
		(!R10 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_Q (?X_U ((ADV-A (FROM.P ?L1)) GO.16.V) ?X_T))
		(?X_N (?X_A (= ?X_O)))
		(?X_K (?X_B (BE.V ?X_L)))
		(?X_G (?X_U (((ADV-A (INTO.P ?X_I)) THROW.V) ?X_H)))
		(?X_D (?X_E (CATCH.V ?X_H)))
		(?X_S (?X_U ((ADV-A (FROM.P ?L1)) RUN.21.V) ?L2))
	)
)

; "Tom went to the park."
; "He walked around."
; "He saw some kids playing sports."
; "He watched them play for awhile."
; "He went home."
(EPI-SCHEMA ((?X_M ((ADV-A (TO.P ?X_L)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_L PARK.N))
		(!R2 (?X_H (PLUR SPORT.N)))
		(!R3 (?X_I (PLUR KID.N)))
		(!R4 (?X_N HOME.N))
		(!R5 (?X_N (PERTAIN-TO ?X_M)))
		(!R6 (?X_L DESTINATION.N))
		(!R7 (?L2 DESTINATION.N))
		(!R8 (?X_M AGENT.N))
		(!R9 (?X_N DESTINATION.N))
	)
	(:STEPS
		(?X_C (?X_M ((ADV-A (FROM.P ?L1)) GO.16.V) ?X_L))
		(?X_E (?X_M ((ADV-A (FROM.P ?L1)) WALK_AROUND.22.V) ?L2))
		(?X_G (?X_M SEE.23.V ?X_I))
		(?X_A (?X_I PLAY.24.V))
		(?X_K (?X_M ((ADV-A (FROM.P ?L1)) GO.16.V) ?X_N))
	)
)

; "Peter walked down the street."
; "A car ran into Peter."
; "Peter fell on the ground."
; "Someone helped Peter."
(EPI-SCHEMA ((?X_C FALL.V) ** ?E)
	(:ROLES
		(!R1 (?X_C PERSON.N))
		(!R2 (?X_F GROUND.N))
		(!R3 (?X_I CAR.N))
		(!R4 (?X_L AGENT.N))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_K (?X_L ((ADV-A (FROM.P ?L1)) WALK.25.V) ?L2))
		(?X_H (?X_I ((ADV-A (INTO.P ?X_L)) RUN.V)))
		(?X_E (?X_L ((ADV-A (ON.P ?X_F)) FALL.V)))
		(?X_B (?X_C (HELP.V ?X_L)))
	)
)



; "Susan went shopping today."
; "She bought lots of things."
; "She bought many things."
; "She bought some shoes."
; "Then she bought some socks."
(EPI-SCHEMA ((?X_K (BUY.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_A (PLUR LOT.N)))
		(!R2 (?X_A (OF.P ?X_B)))
		(!R3 (?X_E MANY.A))
		(!R4 (?X_E (PLUR THING.N)))
		(!R5 (?X_H (PLUR SHOE.N)))
		(!R6 (?X_K AGENT.N))
		(!R7 (?X_L (PLUR SOCK.N)))
	)
	(:STEPS
		(?X_D (?X_K (BUY.V ?X_A)))
		(?X_G (?X_K (BUY.V ?X_E)))
		(?X_J (?X_K (BUY.V ?X_H)))
		(?X_N (?X_K ((THEN.ADV BUY.V) ?X_L)))
	)
)

; "Amy likes to shop."
; "She buys clothes for herself."
; "She goes to the mall."
; "She shops on the internet."
(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA.PR ?X_C (KA SHOP.V) ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR CLOTHE.N)))
		(!R2 (?X_C (FOR.P ?X_I)))
		(!R3 (?X_H MALL.N))
		(!R4 ((KA SHOP.V) ACTION.N))
		(!R5 (?X_H DESTINATION.N))
		(!R6 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_E (?X_I LIKE.1.V (KA SHOP.V)))
		(?X_B (?X_I (BUY.V ?X_C)))
		(?X_G (?X_I ((ADV-A (FROM.P ?L1)) GO.2.V) ?X_H))
	)
)

; "Dan was shopping for clothes."
; "He looked at the prices on the tags."
; "He found a shirt that fit him well."
; "He bought the shirt."
(EPI-SCHEMA ((?X_M (BUY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C SHIRT.N))
		(!R2 (?X_F (PLUR PRICE.N)))
		(!R3 (?X_F (ON.P ?X_G)))
		(!R4 (?X_J (PLUR CLOTHE.N)))
		(!R5 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_I (?X_M ((ADV-A (FOR.P ?X_J)) SHOP.V)))
		(?X_E (?X_M ((ADV-A (AT.P ?X_F)) LOOK.V)))
		(?X_L (?X_M FIND.3.V ?X_C))
		(?X_B (?X_M (BUY.V ?X_C)))
	)
)

; "Alice is going to the store."
; "She is buying groceries."
; "She buys a lot of food."
; "She buys milk."
; "She buys cheese."
; "She buys bread."
; "She buys eggs."
; "She buys meat."
; "She buys vegetables."
(EPI-SCHEMA ((?X_ZB (BUY.V ?X_Y)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR VEGETABLE.N)))
		(!R2 (?X_F MEAT.N))
		(!R3 (?X_I (PLUR EGG.N)))
		(!R4 (?X_L BREAD.N))
		(!R5 (?X_O CHEESE.N))
		(!R6 (?X_R MILK.N))
		(!R7 (?X_U LOT.N))
		(!R8 (?X_U (OF.P ?X_V)))
		(!R9 (?X_Y (PLUR GROCERY.N)))
		(!R10 (?X_ZC STORE.N))
		(!R11 (?X_ZB AGENT.N))
		(!R12 (?X_ZC DESTINATION.N))
	)
	(:STEPS
		(?X_ZA (?X_ZB ((ADV-A (FROM.P ?L1)) GO.2.V) ?X_ZC))
		(?X_X (?X_ZB (BUY.V ?X_Y)))
		(?X_T (?X_ZB (BUY.V ?X_U)))
		(?X_Q (?X_ZB (BUY.V ?X_R)))
		(?X_N (?X_ZB (BUY.V ?X_O)))
		(?X_K (?X_ZB (BUY.V ?X_L)))
		(?X_H (?X_ZB (BUY.V ?X_I)))
		(?X_E (?X_ZB (BUY.V ?X_F)))
		(?X_B (?X_ZB (BUY.V ?X_C)))
	)
)

; "Karen went to the store."
; "She shopped for food."
; "She bought some bread."
; "She bought eggs."
; "She bought milk."
; "She bought meat."
; "She bought vegetables."
; "She bought fruit."
; "She paid for the groceries."
(EPI-SCHEMA ((?X_ZA (BUY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR GROCERY.N)))
		(!R2 (?X_F FRUIT.N))
		(!R3 (?X_I (PLUR VEGETABLE.N)))
		(!R4 (?X_L MEAT.N))
		(!R5 (?X_O MILK.N))
		(!R6 (?X_R (PLUR EGG.N)))
		(!R7 (?X_U BREAD.N))
		(!R8 (?X_X FOOD.N))
		(!R9 (?X_ZB STORE.N))
		(!R10 (?X_ZA AGENT.N))
		(!R11 (?X_ZB DESTINATION.N))
	)
	(:STEPS
		(?X_Z (?X_ZA ((ADV-A (FROM.P ?L1)) GO.2.V) ?X_ZB))
		(?X_W (?X_ZA ((ADV-A (FOR.P ?X_X)) SHOP.V)))
		(?X_T (?X_ZA (BUY.V ?X_U)))
		(?X_Q (?X_ZA (BUY.V ?X_R)))
		(?X_N (?X_ZA (BUY.V ?X_O)))
		(?X_K (?X_ZA (BUY.V ?X_L)))
		(?X_H (?X_ZA (BUY.V ?X_I)))
		(?X_E (?X_ZA (BUY.V ?X_F)))
		(?X_B (?X_ZA ((ADV-A (FOR.P ?X_C)) PAY.V)))
	)
)

; "Holly went shopping."
; "She bought a new dress."
; "She also bought new shoes."
; "She spent $20 on the new clothes."
(EPI-SCHEMA ((?X_I ((ADV-A (FOR.P (KA (BUY.V ?X_C)))) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C NEW.A))
		(!R2 (?X_C (PLUR SHOE.N)))
		(!R3 (?X_F NEW.A))
		(!R4 (?X_F DRESS.N))
		(!R5 (?X_I AGENT.N))
		(!R6 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_H (?X_I ((ADV-A (FROM.P ?L1)) GO.4.V) ?L2))
		(?X_E (?X_I (BUY.V ?X_F)))
		(?X_B (?X_I ((ALSO.ADV BUY.V) ?X_C)))
	)
)

; "Tom went grocery shopping."
; "He bought eggs, milk, bread, and cheese."
; "He also bought chips, cookies, and candy."
(EPI-SCHEMA ((?X_F (BUY.V ?L2)) ** ?E)
	(:ROLES
		(!R1 (?X_F AGENT.N))
		(!R2 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_F ((ADV-A (FROM.P ?L1)) GO.4.V) ?L2))
		(?X_C (?X_F (BUY.V ?X_A)))
	)
)

; "Joe bought some new clothes."
; "He looked good in them."
; "He wore them to work."
(EPI-SCHEMA ((?X_I (BUY.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C ((ADV-A (IN.P ?X_H)) GOOD.A)))
		(!R2 (?X_H NEW.A))
		(!R3 (?X_H (PLUR CLOTHE.N)))
		(!R4 ((K ((ADV-A (IN.P ?X_H)) GOOD.A)) DESTINATION.N))
		(!R5 (?X_I AGENT.N))
		(!R6 (?X_H ENTITY.N))
		(!R7 (?X_H SMALLER-THAN.N ?X_I))
	)
	(:STEPS
		(?X_E (?X_I (BUY.V ?X_H)))
		(?X_B (?X_I (LOOK.V ?X_C)))
		(?X_G (?X_I WEAR.5.V ?X_H (K ((ADV-A (IN.P ?X_H)) GOOD.A))))
	)
)

; "Molly liked shopping."
; "She bought lots of clothes."
; "She bought some new clothes."
; "She bought a dress for an important party."
(EPI-SCHEMA ((?X_N (BUY.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C DRESS.N))
		(!R2 (?X_D IMPORTANT.A))
		(!R3 (?X_D PARTY.N))
		(!R4 (?X_G NEW.A))
		(!R5 (?X_G (PLUR CLOTHE.N)))
		(!R6 (?X_J (PLUR LOT.N)))
		(!R7 (?X_J (OF.P ?X_K)))
		(!R8 (?X_O SHOPPING.N))
		(!R9 (?X_N AGENT.N))
		(!R10 (?X_O OBJECT.N))
		(!R11 (NOT (?X_O ACTION.N)))
		(!R12 (NOT (?X_O AGENT.N)))
	)
	(:STEPS
		(?X_M (?X_N LIKE.6.V ?X_O))
		(?X_I (?X_N (BUY.V ?X_J)))
		(?X_F (?X_N (BUY.V ?X_G)))
		(?X_B (?X_N (((ADV-A (FOR.P ?X_D)) BUY.V) ?X_C)))
	)
)

; "'I'm going to play tennis tomorrow.'"
; "'What should I wear?'"
; "'How much money do you have?'"
(EPI-SCHEMA (((ADV-E ({DURING}.P ?X_C)) (?X_D PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C TENNIS.N))
		(!R2 (?X_C TOMORROW.N))
		(!R3 (?X_D AGENT.N))
	)
	(:STEPS
		(?X_B (?X_D ((ADV-A (FOR.P (KA (PLAY.V ?X_C)))) GO.V)))
		(?E_1 (?X_D PLAY.7.V))
	)
)

; "I am writing this story."
; "This is what happened."
; "I woke up early."
; "I ate breakfast."
; "I went to school."
; "I studied English."
(EPI-SCHEMA ((?X_D (EARLY.ADV WAKE_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D AGENT.N))
		(!R2 (?X_I {REF}.N))
		(!R3 (?X_L STORY.N))
		(!R4 (?X_M BREAKFAST.N))
		(!R5 (?X_S SCHOOL.N))
		(!R6 (?X_R AGENT.N))
		(!R7 (?X_S DESTINATION.N))
	)
	(:STEPS
		(?X_K (?X_R (WRITE.V ?X_L)))
		(?X_H (?X_I (= (ANS-TO (?X_A HAPPEN.V)))))
		(?X_F (?X_R (EARLY.ADV WAKE_UP.V)))
		(?X_O (?X_R EAT.8.V ?X_M))
		(?X_Q (?X_R ((ADV-A (FROM.P ?L1)) GO.2.V) ?X_S))
		(?X_C (?X_R (STUDY.V ?X_D)))
	)
)

; "Tom's dad told Tom to write a story."
; "Tom wrote a story."
; "He wrote a book."
; "He read his book to his friends."
; "His friends liked his book."
(EPI-SCHEMA ((?X_L (WRITE.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_K (PLUR FRIEND.N)))
		(!R2 (?X_L BOOK.N))
		(!R3 (?X_L AGENT.N))
		(!R4 (?X_G STORY.N))
		(!R5 (?X_L (PERTAIN-TO ?X_O)))
		(!R6 (?X_K (PERTAIN-TO ?X_O)))
		(!R7 (?X_M STORY.N))
		(!R8 (?X_N DAD.N))
		(!R9 (?X_N (PERTAIN-TO ?X_O)))
		(!R10 (?X_J (PLUR FRIEND.N)))
		(!R11 (?X_J (PERTAIN-TO ?X_K)))
		(!R12 (?X_P BOOK.N))
		(!R13 (?X_P (PERTAIN-TO ?X_L)))
		(!R14 (?X_O AGENT.N))
		(!R15 ((KA (WRITE.V ?X_M)) ACTION.N))
		(!R16 (NOT (?X_N = ?X_O)))
		(!R17 (NOT (?X_P ACTION.N)))
		(!R18 (NOT (?X_P AGENT.N)))
	)
	(:STEPS
		(?X_I (?X_N TELL.9.V ?X_O (KA (WRITE.V ?X_M))))
		(?X_F (?X_O (WRITE.V ?X_G)))
		(?X_D (?X_O (WRITE.V ?X_L)))
		(?X_A (?X_O (((ADV-A (TO.P ?X_K)) READ.V) ?X_L)))
		(?X_B (?X_J LIKE.10.V ?X_P))
	)
)

; "Tom's father asked Tom if he would help him write an essay for school."
; "Tom agreed to do that."
; "Tom sat down at his desk."
; "He started writing."
(EPI-SCHEMA ((?X_K ((ADV-A (FOR.P (KA (HELP.V ?X_I (WRITE.V ?X_B))))) AGREE.V))
             ** ?E)
	(:ROLES
		(!R1 (?X_I FATHER.N))
		(!R2 (?X_B ESSAY.N))
		(!R3 (?X_B (FOR.P ?X_C)))
		(!R4 (?X_F {REF}.N))
		(!R5 (?X_J DESK.N))
		(!R6 (?X_K AGENT.N))
		(!R7 (?X_I (PERTAIN-TO ?X_K)))
		(!R8 (?X_J (PERTAIN-TO ?X_K)))
	)
	(:STEPS
		(?X_E
   (?X_I (ASK.V ?X_K (K (IF.P (?X_K (WILL.MD (HELP.V ?X_I (WRITE.V ?X_B)))))))))
		(?X_H (?X_K ((ADV-A (FOR.P (KA (DO.V ?X_F)))) AGREE.V)))
		(?X_A (?X_K (DOWN.ADV ((ADV-A (AT.P ?X_J)) SIT.V))))
		(?X_M (?X_K ((ADV-A (FOR.P (KA WRITE.V))) START.V)))
	)
)

; "Alice was writing a book."
; "She wrote all day."
; "She wrote for hours."
; "She wrote until evening."
; "She stopped writing."
(EPI-SCHEMA ((?X_O ((ADV-A (FOR.P ?X_I)) WRITE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D BOOK.N))
		(!R2 (?X_I (PLUR HOUR.N)))
		(!R3 (?X_L EVENING.N))
		(!R4 (?X_O AGENT.N))
		(!R5 (?A ACTION.N))
	)
	(:STEPS
		(?X_F (?X_O (= (KA (WRITE.V ?X_D)))))
		(?X_H ((ADV-E ({DURING}.P (ALL.D DAY.N))) (?X_O WRITE.V)))
		(?X_K (?X_O ((ADV-A (FOR.P ?X_I)) WRITE.V)))
		(?X_N ((ADV-E (L X (AND (X DURING) (X (UNTIL.P ?X_L))))) (?X_O WRITE.V)))
		(?X_C (?X_O STOP.11.V ?A))
	)
)

; "Tom's friend played baseball."
; "He had a big game."
; "He was up to hit."
; "He hit a long drive."
; "He made a run and won the game."
(EPI-SCHEMA ((?X_M (((ADV-A (WITH.P ?X_L)) PLAY.V) ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C RUN.N))
		(!R2 (?X_F LONG.A))
		(!R3 (?X_F DRIVE.N))
		(!R4 (?X_K BIG.A))
		(!R5 (?X_K GAME.N))
		(!R6 (?X_L FRIEND.N))
		(!R7 (?X_M AGENT.N))
		(!R8 (?X_L (PERTAIN-TO ?X_M)))
		(!R9 (?X_P BASEBALL.N))
	)
	(:STEPS
		(?X_O (?X_L PLAY.12.V))
		(?X_J (?X_L (HAVE.V ?X_K)))
		(?X_H (?X_L (UP.ADV ((ADV-A (FOR.P (KA HIT.V))) BE.V))))
		(?X_E (?X_L (HIT.V ?X_F)))
		(?X_A (?X_L (MAKE.V ?X_C)))
		(?X_B (?X_L (WIN.V ?X_K)))
	)
)

; "Mary went swimming."
; "She saw some fish."
; "She swam around them."
; "She felt happy."
; "She heard someone yell."
(EPI-SCHEMA ((?X_N ((ADV-A (TO.P ?L2)) SWIM.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C HAPPY.A))
		(!R2 (?X_H FISH.N))
		(!R3 (?L2 DESTINATION.N))
		(!R4 (?X_M AGENT.N))
		(!R5 (?X_N PERSON.N))
	)
	(:STEPS
		(?X_E (?X_M ((ADV-A (FOR.P (KA SWIM.V))) GO.V)))
		(?E_1 (?X_M ((ADV-A (FROM.P ?L1)) SWIM.13.V) ?L2))
		(?X_G (?X_M SEE.14.V ?X_H))
		(?X_J (?X_M ((ADV-A (FROM.P ?L1)) SWAM.15.V) ?L2))
		(?X_B (?X_M (FEEL.V ?X_C)))
		(?X_L (?X_M HEAR.16.V (KE (?X_N YELL.V))))
	)
)

; "Sophia liked to write poems."
; "She wrote poetry for fun."
; "She read some of her poems to her friends."
(EPI-SCHEMA ((?X_E (WRITE.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_G (PLUR FRIEND.N)))
		(!R2 (?X_E POETRY.N))
		(!R3 (?X_E AGENT.N))
		(!R4 (?X_E (FOR.P ?X_F)))
		(!R5 (?X_G (PERTAIN-TO ?X_J)))
		(!R6 (?X_K (PLUR POEM.N)))
		(!R7 (?X_J AGENT.N))
		(!R8 ((KA (WRITE.V ?X_K)) ACTION.N))
	)
	(:STEPS
		(?X_I (?X_J LIKE.17.V (KA (WRITE.V ?X_K))))
		(?X_D (?X_J (WRITE.V ?X_E)))
		(?X_B (?X_J (((ADV-A (TO.P ?X_G)) READ.V) ?X_A)))
	)
)

; "Alfred read a book."
; "He liked reading books."
; "He read a book on history."
; "He read a book on science."
; "He read a book on geography."
(EPI-SCHEMA ((?X_R (READ.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C BOOK.N))
		(!R2 (?X_C (ON.P ?X_D)))
		(!R3 (?X_G BOOK.N))
		(!R4 (?X_G (ON.P ?X_H)))
		(!R5 (?X_K BOOK.N))
		(!R6 (?X_K (ON.P ?X_L)))
		(!R7 (?X_O BOOK.N))
		(!R8 (?X_S (PLUR BOOK.N)))
		(!R9 (?X_R AGENT.N))
		(!R10 ((KA (READ.V ?X_S)) ACTION.N))
	)
	(:STEPS
		(?X_N (?X_R (READ.V ?X_O)))
		(?X_Q (?X_R LIKE.18.V (KA (READ.V ?X_S))))
		(?X_J (?X_R (READ.V ?X_K)))
		(?X_F (?X_R (READ.V ?X_G)))
		(?X_B (?X_R (READ.V ?X_C)))
	)
)



; "The girl was sad today."
; "Her boyfriend left her."
; "She cried all day long."
; "She missed him."
(EPI-SCHEMA ((?X_E (CRY.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 ((ADV-E ({DURING}.P ?X_H)) (?X_E SAD.A)))
		(!R2 (?X_E GIRL.N))
		(!R3 (?X_D BOYFRIEND.N))
		(!R4 (?X_D (PERTAIN-TO ?X_E)))
		(!R5 (?X_H TODAY.N))
	)
	(:STEPS
		(?X_A (?X_D (LEAVE.V ?X_E)))
		(?X_G (?X_E CRY.1.V))
		(?X_C (?X_E (MISS.V ?X_D)))
	)
)

; "Tom's girlfriend broke up with him."
; "She told Tom that she couldn't be with him anymore."
; "Tom was upset by this news."
(EPI-SCHEMA ((?X_D ((ADV-A (WITH.P ?X_E)) BREAK_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D GIRLFRIEND.N))
		(!R2 (?X_E AGENT.N))
		(!R3 (?X_D (PERTAIN-TO ?X_E)))
		(!R4 (?X_F NEWS.N))
	)
	(:STEPS
		(?X_C (?X_D ((ADV-A (WITH.P ?X_E)) BREAK_UP.V)))
		(?X_A (?X_E (BY.P ?X_F)))
	)
)

; "Alicia liked to play soccer."
; "She played on a team."
; "She was good at soccer."
(EPI-SCHEMA ((?X (PLAY.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_F SOCCER.N))
		(!R2 (?X_E SOCCER.N))
		(!R3 (?X_G ((ADV-A (AT.P ?X_E)) GOOD.A)))
		(!R4 ((KA (PLAY.V ?X_F)) ACTION.N))
		(!R5 (?X AGENT.N))
		(!R6 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_B (?X_G LIKE.2.V (KA (PLAY.V ?X_F))))
		(?E_1 (?X PLAY.3.V))
		(?X_D (?X_G PLAY.4.V))
	)
)

; "Sarah was sad because her little sister was sick."
; "Her parents were worried that Sarah's sister might die."
; "Sarah was scared for her sister."
(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA.PR ?X_D ?X_C ?X_E ?O)) ** ?E)
	(:ROLES
		(!R1 (?X_E SISTER.N))
		(!R2 (?X_E LITTLE.A))
		(!R3 (?X_C (BECAUSE.P (KE (?X_H SICK.A)))))
		(!R4 (?X_D SAD.A))
		(!R5 (?X_E (PERTAIN-TO ?X_J)))
		(!R6 (?X_F (PLUR PARENT.N)))
		(!R7 (?X_F (PERTAIN-TO ?X_J)))
		(!R8 (?X_G SISTER.N))
		(!R9 (?X_G LITTLE.A))
		(!R10 (?X_G (PERTAIN-TO ?X_J)))
		(!R11 (?X_H (PERTAIN-TO ?X_J)))
		(!R12 (?X_I LITTLE.A))
		(!R13 (?X_H ?X_I SISTER.N))
		(!R14 (?X_J AGENT.N))
		(!R15 (NOT (?O ACTION.N)))
		(!R16 (NOT (?O AGENT.N)))
		(!R17 (?O OBJECT.N))
	)
	(:STEPS
		(?X_A (?X_J (BE.V ?X_D ?X_C)))
		(?X_B (?X_J (FOR.P ?X_E)))
		(?E_1 (?X_J SCARE.5.V ?O))
	)
)

; "Krishna was sad."
; "He felt bad for himself."
; "He thought that everyone was better than he is."
; "He was sad because other people were happier than he was."
(EPI-SCHEMA ((?X_B (FEEL.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_B SAD.A))
		(!R2 (?X_B AGENT.N))
		(!R3 (?X_A BAD.A))
		(!R4 (?X_A (FOR.P ?X_B)))
	)
	(:STEPS
		(?X_D (?X_B (FEEL.V ?X_A)))
	)
)

; "Alice had a girlfriend named Jane."
; "Jane was pretty."
; "Alice liked Jane."
(EPI-SCHEMA ((?X_F (LIKE.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_E GIRLFRIEND.N))
		(!R2 (?X_G PRETTY.A))
		(!R3 (?X_E ((PASV NAME.V) ?X_G)))
		(!R4 (?X_G OBJECT.N))
		(!R5 (?X_F AGENT.N))
		(!R6 (NOT (?X_G ACTION.N)))
	)
	(:STEPS
		(?X_B (?X_F (HAVE.V ?X_E)))
		(?X_D (?X_F LIKE.6.V ?X_G))
	)
)

; "The man was angry."
; "He yelled at everyone."
; "He even yelled at his boss."
; "People thought he was crazy."
; "They started avoiding him."
(EPI-SCHEMA ((?X_H ((ADV-A (AT.P (EVERY.D PERSON.N))) YELL.V)) ** ?E)
	(:ROLES
		(!R1 (?X_G BOSS.N))
		(!R2 (?X_F (PLUR PERSON.N)))
		(!R3 (?X_H MAN.N))
		(!R4 (?X_H ANGRY.A))
		(!R5 (?X_G (PERTAIN-TO ?X_H)))
	)
	(:STEPS
		(?X_C (?X_H ((ADV-A (AT.P (EVERY.D PERSON.N))) YELL.V)))
		(?X_A (?X_H (EVEN.ADV ((ADV-A (AT.P ?X_G)) YELL.V))))
		(?X_E (?X_F (THINK.V (THT (?X_H CRAZY.A)))))
		(?X_J (?X_F ((ADV-A (FOR.P (KA (AVOID.V ?X_H)))) START.V)))
	)
)

; "A girl named Jenny likes to play sports."
; "She plays softball."
; "She is on the girls' team."
; "She has a friend named Jack."
(EPI-SCHEMA ((?X_O (PLAY.V ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_D FRIEND.N))
		(!R2 (?X_D ((PASV NAME.V) ?X_E)))
		(!R3 (?X_N (PLUR SPORT.N)))
		(!R4 (?X_J GIRL.N))
		(!R5 (?X_J ((PASV NAME.V) ?X_O)))
		(!R6 (?X_M SOFTBALL.N))
		(!R7 ((KA (PLAY.V ?X_N)) ACTION.N))
		(!R8 (?X AGENT.N))
		(!R9 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_I (?X_J LIKE.7.V (KA (PLAY.V ?X_N))))
		(?E_1 (?X PLAY.3.V))
		(?X_L (?X_O PLAY.8.V))
		(?X_G (?X_O (ON.P (KE (?X_A TEAM.N)))))
		(?X_C (?X_O (HAVE.V ?X_D)))
	)
)

; "Tom was mad."
; "He yelled at his brother."
; "He yelled at his sister."
; "He yelled at his mom."
; "He yelled at his dad."
; "He yelled at his friends."
; "He yelled at his dog."
; "He yelled at himself."
(EPI-SCHEMA ((?X_N ((ADV-A (AT.P (EVERY.D PERSON.N))) YELL.V)) ** ?E)
	(:ROLES
		(!R1 (?X_H BROTHER.N))
		(!R2 (?X_I SISTER.N))
		(!R3 (?X_J MOM.N))
		(!R4 (?X_K DAD.N))
		(!R5 (?X_L (PLUR FRIEND.N)))
		(!R6 (?X_M DOG.N))
		(!R7 (?X_N MAD.A))
		(!R8 (?X_N AGENT.N))
		(!R9 (?X_H (PERTAIN-TO ?X_N)))
		(!R10 (?X_I (PERTAIN-TO ?X_N)))
		(!R11 (?X_J (PERTAIN-TO ?X_N)))
		(!R12 (?X_K (PERTAIN-TO ?X_N)))
		(!R13 (?X_L (PERTAIN-TO ?X_N)))
		(!R14 (?X_M (PERTAIN-TO ?X_N)))
	)
	(:STEPS
		(?X_B (?X_N ((ADV-A (AT.P ?X_H)) YELL.V)))
		(?X_C (?X_N ((ADV-A (AT.P ?X_I)) YELL.V)))
		(?X_D (?X_N ((ADV-A (AT.P ?X_J)) YELL.V)))
		(?X_E (?X_N ((ADV-A (AT.P ?X_K)) YELL.V)))
		(?X_F (?X_N ((ADV-A (AT.P ?X_L)) YELL.V)))
		(?X_G (?X_N ((ADV-A (AT.P ?X_M)) YELL.V)))
		(?X_P (?X_N ((ADV-A (AT.P ?X_A)) YELL.V)))
	)
)

; "Bob was mad."
; "He yelled at his friend."
; "His friend tried to calm him down."
; "Bob's friend told Bob to stop yelling."
(EPI-SCHEMA ((?X_E (TELL.V (ANOTHER.D FRIEND.N) (KA (STOP.V (KA YELL.V))))) **
             ?E)
	(:ROLES
		(!R1 (?X_E FRIEND.N))
		(!R2 (?X_F MAD.A))
		(!R3 (?X_F FRIEND.N))
		(!R4 (?X_F (PERTAIN-TO ?X_F)))
		(!R5 (?X_E (PERTAIN-TO ?X_F)))
		(!R6 (?A ACTION.N))
	)
	(:STEPS
		(?X_A (?X_F ((ADV-A (AT.P ?X_E)) YELL.V)))
		(?X_B (?X_E (TRY.V (KA (CALM_DOWN.V ?X_F)))))
		(?X_D (?X_F (TELL.V ?X_F (KA (STOP.V (KA YELL.V))))))
		(?E_1 (?X_E YELL.9.V ?A))
	)
)

; "Timmy was mad."
; "He was really upset."
; "He threw things around."
; "He broke some stuff."
; "He shouted at his mom."
; "He told his dad that he hated them."
; "He slammed the door."
(EPI-SCHEMA ((?X_L ((AROUND.ADV THROW.V) ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_F DOOR.N))
		(!R2 (?X_N DAD.N))
		(!R3 (?X_M MOM.N))
		(!R4 (?X_I STUFF.N))
		(!R5 (?X_L (PLUR THING.N)))
		(!R6 (?X_O MAD.A))
		(!R7 (?X_O (REALLY.ADV UPSET.A)))
		(!R8 (?X_M (PERTAIN-TO ?X_O)))
		(!R9 (?X_N (PERTAIN-TO ?X_O)))
		(!R10 ((IND (8 EXPERIENCER_FOCUS)) ACTION.N))
		(!R11 (?X_O AGENT.N))
	)
	(:STEPS
		(?X_K (?X_O ((AROUND.ADV THROW.V) ?X_L)))
		(?X_H (?X_O (BREAK.V ?X_I)))
		(?X_B (?X_O ((ADV-A (AT.P ?X_M)) SHOUT.V)))
		(?X_C (?X_O (TELL.V ?X_N (THAT (?X_O (HATE.V ?X_A))))))
		(?X_E (?X_O (SLAM.V ?X_F)))
		(?E_1 (?X_O ENJOY_ACTION.10.V (IND (8 EXPERIENCER_FOCUS))))
	)
)

; "Peter's mother gave him money for an ice cream cone."
; "He ran down the street."
; "He stopped at a shop."
; "He bought two ice creams."
; "He walked home."
(EPI-SCHEMA ((?X_J (BUY.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_F SHOP.N))
		(!R2 (?X_J AGENT.N))
		(!R3 (?X_I ICE.N))
		(!R4 (?X_I CREAM.N))
		(!R5 (?X_P MONEY.N))
		(!R6 (?X_P (FOR.P ?X_I ?X_J)))
		(!R7 (?X_M MOTHER.N))
		(!R8 (?X_M (PERTAIN-TO ?X_Q)))
		(!R9 (?X_R HOME.N))
		(!R10 (NOT (?X_P AGENT.N)))
		(!R11 (?L2 DESTINATION.N))
		(!R12 (?X_Q AGENT.N))
		(!R13 (?X_R DESTINATION.N))
	)
	(:STEPS
		(?X_H (?X_M (GIVE.11.V ?X_Q ?X_P)))
		(?X_L (?X_Q ((ADV-A (FROM.P ?L1)) RUN.12.V) ?L2))
		(?X_E (?X_Q ((ADV-A (AT.P ?X_F)) STOP.V)))
		(?X_C (?X_Q (BUY.V (TWO.D (L X (AND (X ICE.N) (X (PLUR CREAM.N))))))))
		(?X_O (?X_Q ((ADV-A (FROM.P ?L1)) WALK.13.V) ?X_R))
	)
)

; "John was mad."
; "He yelled at the kids."
; "He yelled at his wife."
; "He yelled at his boss."
; "He yelled at his mom."
(EPI-SCHEMA ((?X_J ((ADV-A (AT.P ?X_G)) YELL.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR KID.N)))
		(!R2 (?X_G WIFE.N))
		(!R3 (?X_H BOSS.N))
		(!R4 (?X_J MAD.A))
		(!R5 (?X_J AGENT.N))
		(!R6 (?X_G (PERTAIN-TO ?X_J)))
		(!R7 (?X_H (PERTAIN-TO ?X_J)))
		(!R8 (?X_I MOM.N))
		(!R9 (?X_I (PERTAIN-TO ?X_J)))
	)
	(:STEPS
		(?X_F (?X_J ((ADV-A (AT.P ?X_D)) YELL.V)))
		(?X_A (?X_J ((ADV-A (AT.P ?X_G)) YELL.V)))
		(?X_B (?X_J ((ADV-A (AT.P ?X_H)) YELL.V)))
		(?X_C (?X_J ((ADV-A (AT.P ?X_I)) YELL.V)))
	)
)

; "'I'm going to be late,' Tom said."
; "'Don't worry,' Bob said."
; "'We'll wait for you.'"
; "'Thanks,' Tom said."
(EPI-SCHEMA ((?X_A ((ADV-A (FOR.P ?X_A)) WAIT.V)) ** ?E)
	(:ROLES
		(!R1 (?X_A AGENT.N))
		(!R2 (?X_A (SET-OF AGENT.N)))
		(!R3 (?X_B AGENT.N))
	)
	(:STEPS
		(E428.SK (?X_A ((ADV-A (FOR.P ?X_B)) WAIT.V)))
	)
)



; "'Sandra cooked dinner for her family."
; "She put some food on a plate."
; "She left the room."
; "She came back into the room."
; "She saw a mouse."
; "She screamed."
(EPI-SCHEMA ((?X_Q (((ADV-A (IN.P ?X_P)) LEAVE.V) ?X_P)) ** ?E)
	(:ROLES
		(!R1 (?X_D ROOM.N))
		(!R2 (?X_E DINNER.N))
		(!R3 (?X_O FAMILY.N))
		(!R4 (?X_O (PERTAIN-TO ?X_Q)))
		(!R5 (?X_P FOOD.N))
		(!R6 (?X_L MOUSE.N))
		(!R7 (?X_O LOCATION.N))
		(!R8 (?X_P LOCATION.N))
		(!R9 (NOT (?X_P = ?L2)))
		(!R10 (?L2 DESTINATION.N))
		(!R11 (?X_Q AGENT.N))
		(!R12 (?X_Q NOISE.N))
	)
	(:STEPS
		(?X_A (?X_Q (((ADV-A (FOR.P ?X_O)) COOK.V) ?X_E)))
		(?X_G (?X_Q PUT.1.V ?X_P ?X_O))
		(?X_I (?X_Q ((ADV-A (FROM.P ?X_P)) LEAVE.2.V) ?L2))
		(?X_C (?X_Q ((ADV-A (INTO.P ?X_D)) (BACK.ADV COME.V))))
		(?X_K (?X_Q SEE.3.V ?X_L))
		(?X_N (?X_Q SCREAM.4.V ?X_Q))
	)
)

; "Jane cooked for her family."
; "She had a big kitchen."
; "She liked to cook."
; "She cooked many things."
; "She was a chef."
(EPI-SCHEMA ((?X_I (FOR.P ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_D MANY.A))
		(!R2 (?X_D (PLUR THING.N)))
		(!R3 (?X_G BIG.A))
		(!R4 (?X_G KITCHEN.N))
		(!R5 (?X_H FAMILY.N))
		(!R6 (?X_I CHEF.N))
		(!R7 (?X_H (PERTAIN-TO ?X_I)))
		(!R8 ((KA COOK.V) ACTION.N))
	)
	(:STEPS
		(?X_A (?X_I ((ADV-A (FOR.P ?X_H)) COOK.V)))
		(?X_F (?X_I (HAVE.V ?X_G)))
		(?X_K (?X_I LIKE.5.V (KA COOK.V)))
		(?X_C (?X_I (COOK.V ?X_D)))
	)
)

; "'I'm going to cook dinner for my family,' said Sandra."
; "'I'll make spaghetti tonight.'"
; "'What will you do if there is a mouse?' asked Tom."
; "'I don't know,' said Sandra."
; "'Maybe I should leave some cheese on the counter for it,' said Tom."
; "'That would be better than running around screaming,' said Sandra."
(EPI-SCHEMA ((?X_B (MAKE.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_B AGENT.N))
		(!R2 (?X_A (PERTAIN-TO ?X_B)))
		(!R3 (?X_C TONIGHT.N))
		(!R4 (?X_C (PLUR SPAGHETTI.N)))
	)
	(:STEPS
		(E105.SK (?X_B (MAKE.V ?X_C)))
	)
)

; "'I'm going to make spaghetti,' Tom said."
; "'Can I help?' Jenny asked."
; "'Sure!' Tom answered."
; "'How do you cook spaghetti?' Jenny asked."
; "'You put some sauce on top of noodles. Then you add cheese and meatballs.'"
; "'Awesome! I'll help!' Jenny said."
(EPI-SCHEMA ((?X_C (((ADV-A (FOR.P ?X_C)) ASK.V) ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
	)
	(:STEPS
		(?X_B (?X_C ASK.V))
		(?X_E (?X_C ASK.V))
	)
)

; "[Narrator:] Sarah was working on her homework."
; "She looked for a pencil."
; "She found one in the drawer."
; "Sarah put the pencil away."
; "She went to her room."
(EPI-SCHEMA ((?X_I (FIND.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B PENCIL.N))
		(!R2 (?X_I AGENT.N))
		(!R3 (?X_I PENCIL.N))
		(!R4 (?X_J HOMEWORK.N))
		(!R5 (?X_J (PERTAIN-TO ?X_K)))
		(!R6 (?X_L ROOM.N))
		(!R7 (?X_L (PERTAIN-TO ?X_K)))
		(!R8 (?L LOCATION.N))
		(!R9 (?X_K AGENT.N))
		(!R10 (?X_L DESTINATION.N))
	)
	(:STEPS
		(?X_D (?X_K ((ADV-A (FOR.P ?X_B)) LOOK.6.V)))
		(?X_F (?X_K FIND.7.V ?X_I))
		(?X_H (?X_K PUT.8.V ?X_I ?L))
		(?X_A (?X_K ((ADV-A (FROM.P ?L1)) GO.9.V) ?X_L))
	)
)

; "Joe went into the kitchen."
; "He saw some food on the table."
; "He grabbed some food."
(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA.PR ?X_C ?X_I ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C FOOD.N))
		(!R2 (?X_I KITCHEN.N))
		(!R3 (?X_H FOOD.N))
		(!R4 (?X_I DESTINATION.N))
		(!R5 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_E (?X_J ((ADV-A (FROM.P ?L1)) GO.9.V) ?X_I))
		(?X_G (?X_J SEE.12.V ?X_H))
		(?X_B (?X_J (GRAB.V ?X_C)))
	)
)

; "Karen cooked for her family."
; "She baked cookies."
; "She cleaned the kitchen after she cooked."
(EPI-SCHEMA ((?X_F (CLEAN.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_B FAMILY.N))
		(!R2 (?X_B (PERTAIN-TO ?X_F)))
		(!R3 (?X_E KITCHEN.N))
		(!R4 (?X_F AGENT.N))
	)
	(:STEPS
		(?X_A (?X_F ((ADV-A (FOR.P ?X_B)) COOK.V)))
		(?X_D (?X_F CLEAN.13.V ?X_E))
	)
)

; "Sandy cooked for her family."
; "She made spaghetti."
; "She put cheese on top of the pasta."
; "She served it to her family."
; "They all liked it."
(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA.PR ?X_E ?X_I ?L ?X_N ?X_O)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR SPAGHETTI.N)))
		(!R2 (?X_N FAMILY.N))
		(!R3 (?X_N (PERTAIN-TO ?X_M)))
		(!R4 (?X_F AGENT.N))
		(!R5 (?X_N (PERTAIN-TO ?X_F)))
		(!R6 (?X_I CHEESE.N))
		(!R7 (?X_L AGENT.N))
		(!R8 (?L LOCATION.N))
		(!R9 (?X_M AGENT.N))
		(!R10 (?X_N AGENT.N))
		(!R11 (NOT (?X_O AGENT.N)))
	)
	(:STEPS
		(?X_A (?X_F ((ADV-A (FOR.P ?X_N)) COOK.V)))
		(?X_D (?X_M (MAKE.V ?X_E)))
		(?X_H (?X_M PUT.14.V ?X_I ?L))
		(?X_B (?X_M (SERVE.15.V ?X_N ?X_O)))
		(?X_K ((ALL.D ({OF}.P ?X_L)) LIKE.16.V ?X_O))
	)
)

; "Julianne cooked for her family."
; "She liked to cook."
; "She liked to eat."
(EPI-SCHEMA ((?X_G (FOR.P ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B FAMILY.N))
		(!R2 (?X_B (PERTAIN-TO ?X_G)))
		(!R3 ((KA COOK.V) ACTION.N))
		(!R4 ((KA EAT.V) ACTION.N))
		(!R5 (?X_G AGENT.N))
		(!R6 (?F FOOD.N))
	)
	(:STEPS
		(?X_A (?X_G ((ADV-A (FOR.P ?X_B)) COOK.V)))
		(?X_D (?X_G LIKE.17.V (KA COOK.V)))
		(?X_F (?X_G LIKE.18.V (KA EAT.V)))
		(?E_1 (?X_G EAT.19.V ?F))
	)
)

; "The girl was walking along the beach."
; "She saw a turtle."
; "The turtle was floating on the water."
; "She picked up some shells."
; "She took them home."
(EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA.PR ?X_K ?X_L ?L2 ?X_N ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_N (PLUR SHELL.N)))
		(!R2 (?X_O GIRL.N))
		(!R3 (?X_K BEACH.N))
		(!R4 (?X_L TURTLE.N))
		(!R5 (?X_M HOME.N))
		(!R6 (?X_M (PERTAIN-TO ?X_O)))
		(!R7 (?X_K DESTINATION.N))
		(!R8 (?X_L AGENT.N))
		(!R9 (?L2 DESTINATION.N))
		(!R10 (?X_M DESTINATION.N))
		(!R11 (?X_N SMALLER-THAN.N ?X_O))
	)
	(:STEPS
		(?X_D (?X_O ((ADV-A (FROM.P ?L1)) WALK_ALONG.20.V) ?X_K))
		(?X_F (?X_O SEE.21.V ?X_L))
		(?X_H (?X_L ((ADV-A (FROM.P ?L1)) FLOAT.22.V) ?L2))
		(?X_B (?X_O (PICK_UP.V ?X_N)))
		(?X_J (?X_O TAKE.23.V ?X_N ?X_M))
	)
)

; "A boy played on the beach."
; "He found an old shell."
; "He looked for something else."
; "He found a starfish."
(EPI-SCHEMA ((?X_D (FIND.V (SET-OF ?X_E ?X_H))) ** ?E)
	(:ROLES
		(!R1 (?X_C BEACH.N))
		(!R2 (?X_D BOY.N))
		(!R3 (?X_E OLD.A))
		(!R4 (?X_E SHELL.N))
		(!R5 (?X_H STARFISH.N))
	)
	(:STEPS
		(?X_B (?X_D ((ADV-A (ON.P ?X_C)) PLAY.V)))
		(?X_G (?X_D FIND.7.V ?X_E))
		(?X_J (?X_D FIND.7.V ?X_H))
	)
)

; "A boy named Tom liked to play baseball."
; "He played for the team."
; "He played well."
; "He was one of the best players."
(EPI-SCHEMA ((?X_D (PLAY.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_C BEST.A))
		(!R2 (?X_C (PLUR PLAYER.N)))
		(!R3 (?X_D AGENT.N))
		(!R4 (?X_L BASEBALL.N))
		(!R5 (?X_I BOY.N))
		(!R6 (?X_I ((PASV NAME.V) ?X_M)))
		(!R7 ((KA (PLAY.V ?X_L)) ACTION.N))
		(!R8 (?X AGENT.N))
		(!R9 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_H (?X_I LIKE.24.V (KA (PLAY.V ?X_L))))
		(?E_1 (?X PLAY.25.V))
		(?X_K (?X_M PLAY.26.V))
		(?X_F (?X_M (WELL.ADV PLAY.V)))
		(?X_B (?X_M (= (KE (?X_D (OF.P ?X_C))))))
	)
)

; "A boy named Tom played baseball."
; "He liked to play baseball."
; "His team played against a team from another town."
; "He hit a long drive."
; "He made a run and won the game."
(EPI-SCHEMA ((?X_Q (PLAY.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_D GAME.N))
		(!R2 (?X_E RUN.N))
		(!R3 (?X_H LONG.A))
		(!R4 (?X_H DRIVE.N))
		(!R5 (?X_K BASEBALL.N))
		(!R6 (?X_P BASEBALL.N))
		(!R7 (?X_N BOY.N))
		(!R8 (?X_N ((PASV NAME.V) ?X_Q)))
		(!R9 (?X_O TEAM.N))
		(!R10 (?X_O (FROM.P (ANOTHER.D TOWN.N))))
		(!R11 (?X_R TEAM.N))
		(!R12 (?X_R (PERTAIN-TO ?X_Q)))
		(!R13 ((KA (PLAY.V ?X_P)) ACTION.N))
		(!R14 (?X_Q AGENT.N))
		(!R15 (?X_R AGENT.N))
	)
	(:STEPS
		(?X_J (?X_N PLAY.27.V))
		(?X_M (?X_Q LIKE.28.V (KA (PLAY.V ?X_P))))
		(?E_1 (?X_Q PLAY.29.V))
		(?X_A (?X_R PLAY.30.V))
		(?X_G (?X_Q (HIT.V ?X_H)))
		(?X_B (?X_Q (MAKE.V ?X_E)))
		(?X_C (?X_Q (WIN.V ?X_D)))
	)
)

; "Sarah liked to collect seashells."
; "She found lots of seashells on the beach."
; "She cleaned all the shells."
; "She put them away in a box."
(EPI-SCHEMA ((?X_L (FIND.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_I (PLUR SEASHELL.N)))
		(!R2 (?X_D (PLUR SEASHELL.N)))
		(!R3 (?X_C (PLUR LOT.N)))
		(!R4 (?X_C (OF.P ?X_D)))
		(!R5 (?X_K BOX.N))
		(!R6 ((KA (COLLECT.V ?X_I)) ACTION.N))
		(!R7 (?X_J ENTITY.N))
		(!R8 (?X_K LOCATION.N))
		(!R9 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_B (?X_L LIKE.31.V (KA (COLLECT.V ?X_I))))
		(?X_F (?X_L FIND.7.V ?X_C))
		(?X_H (?X_L PUT.32.V ?X_J ?X_K))
	)
)

; "A boy named Tom was swimming in the ocean."
; "He found a shell."
; "It looked pretty."
; "He put it in his pocket."
(EPI-SCHEMA ((?X_J (FIND.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D SHELL.N))
		(!R2 (?X_I BOY.N))
		(!R3 (?X_I ((PASV NAME.V) ?X_J)))
		(!R4 (?X_K POCKET.N))
		(!R5 (?X_K (PERTAIN-TO ?X_J)))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?X_J AGENT.N))
		(!R8 (?X_K LOCATION.N))
	)
	(:STEPS
		(?X_F (?X_I ((ADV-A (FROM.P ?L1)) SWIM.33.V) ?L2))
		(?X_H (?X_J FIND.7.V ?X_D))
		(?X_C (?X_D (PRETTY.ADV LOOK.V)))
		(?X_A (?X_J PUT.34.V ?X_D ?X_K))
	)
)

; "Molly liked collecting shells."
; "She found many interesting shells."
; "She put them away."
(EPI-SCHEMA ((?X_I (FIND.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C MANY.A))
		(!R2 (?X_C INTERESTING.A))
		(!R3 (?X_C (PLUR SHELL.N)))
		(!R4 (?X_H (PLUR SHELL.N)))
		(!R5 ((KA (COLLECT.V ?X_H)) ACTION.N))
		(!R6 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_E (?X_I LIKE.35.V (KA (COLLECT.V ?X_H))))
		(?X_G (?X_I FIND.7.V ?X_C))
		(?X_B (?X_I ((AWAY.ADV PUT.V) ?X_C)))
	)
)

; "Karen loves to play golf."
; "She plays with friends."
; "She is a good golfer."
; "She has many trophies."
(EPI-SCHEMA ((?X (((ADV-A (WITH.P ?X_C)) PLAY.V) ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR FRIEND.N)))
		(!R2 (?X_D GOOD.A))
		(!R3 (?X_D GOLFER.N))
		(!R4 (?X_I GOLF.N))
		(!R5 (?X_J MANY.A))
		(!R6 (?X_J (PLUR TROPHY.N)))
		(!R7 ((KA (PLAY.V ?X_I)) ACTION.N))
		(!R8 (?X AGENT.N))
		(!R9 (?X_J OBJECT.N))
	)
	(:STEPS
		(?X_F (?X_D LOVE.36.V (KA (PLAY.V ?X_I))))
		(?X_B (?X_D ((ADV-A (WITH.P ?X_C)) PLAY.V)))
		(?E_1 (?X PLAY.25.V))
		(?X_H (?X_D HAVE.37.V ?X_J))
	)
)

; "Karen walked down the beach."
; "A turtle floated by."
; "She threw a shell into the water."
; "She watched the turtle swim away."
(EPI-SCHEMA ((?X_I (WALK_DOWN.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C SHELL.N))
		(!R2 (?X_D WATER.N))
		(!R3 (?X_J BEACH.N))
		(!R4 (?X_K TURTLE.N))
		(!R5 (?X_I AGENT.N))
		(!R6 (?X_J DESTINATION.N))
		(!R7 (?X_K AGENT.N))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_I ((ADV-A (FROM.P ?L1)) WALK_DOWN.38.V) ?X_J))
		(?X_H (?X_K ((ADV-A (FROM.P ?L1)) FLOAT_BY.39.V) ?L2))
		(?X_B (?X_I (((ADV-A (INTO.P ?X_D)) THROW.V) ?X_C)))
	)
)



; "The man was tired."
; "He decided to take a nap."
; "He fell asleep."
; "When he woke up, he was dead."
(EPI-SCHEMA ((?X_D (TAKE.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A NAP.N))
		(!R2 (?X_D MAN.N))
		(!R3 (?X_D TIRED.A))
		(!R4 (?X_E ASLEEP.A))
	)
	(:STEPS
		(?X_C (?X_D (TAKE.V ?X_A)))
		(?X_G (?X_D (FALL.V ?X_E)))
	)
)

; "Tom took a nap on Saturday morning."
; "He slept for a while."
; "Then he woke up."
; "He felt better."
(EPI-SCHEMA ((?X_J (TAKE.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A NAP.N))
		(!R2 (?X_A (ON.P (KE (?X_B MORNING.N)))))
		(!R3 (?X_E WHILE.N))
		(!R4 (?X_J AGENT.N))
		(!R5 (?X_K BETTER.A))
	)
	(:STEPS
		(?X_D (?X_J (TAKE.V ?X_A)))
		(?X_G (?X_J ((ADV-A (FOR.P ?X_E)) SLEEP.V)))
		(?X_I (?X_J (THEN.ADV WAKE_UP.V)))
		(?X_M (?X_J (FEEL.V ?X_K)))
	)
)

; "Tommy liked to play baseball."
; "He played on a team."
; "He practiced hard."
; "His coach told him to do better."
; "Tommy listened to his coach."
(EPI-SCHEMA ((?X_L
              (COMPOSITE-SCHEMA.PR ?X_E (KA (PLAY.V ?X_J)) ?X_L
               (KA (BETTER.ADV DO.V))))
             ** ?E)
	(:ROLES
		(!R1 (?X_K COACH.N))
		(!R2 (?X_E HARD.A))
		(!R3 (?X_K (PERTAIN-TO ?X_L)))
		(!R4 (?X_J BASEBALL.N))
		(!R5 ((KA (PLAY.V ?X_J)) ACTION.N))
		(!R6 (?X AGENT.N))
		(!R7 (?X_L AGENT.N))
		(!R8 ((KA (BETTER.ADV DO.V)) ACTION.N))
		(!R9 (NOT (?X_K = ?X_L)))
	)
	(:STEPS
		(?X_G (?X_L LIKE.1.V (KA (PLAY.V ?X_J))))
		(?E_1 (?X PLAY.2.V))
		(?X_I (?X_L PLAY.3.V))
		(?X_D (?X_L (PRACTICE.V ?X_E)))
		(?X_A (?X_K TELL.4.V ?X_L (KA (BETTER.ADV DO.V))))
		(?X_B (?X_L ((ADV-A (TO.P ?X_K)) LISTEN.V)))
	)
)

; "Tom's father told him that if he didn't study hard, he would be poor."
; "If Tom studied hard, he could have lots of money."
; "Tom liked studying."
; "He worked hard on his studies."
(EPI-SCHEMA ((?X_F (LIKE.V (KA (DO.V ?X_B)))) ** ?E)
	(:ROLES
		(!R1 (?X_B (PLUR STUDY.N)))
		(!R2 (?X_B (PERTAIN-TO ?X_F)))
		(!R3 (?X_C FATHER.N))
		(!R4 (?X_C (PERTAIN-TO ?X_F)))
		(!R5 (?X_F AGENT.N))
		(!R6 ((KA STUDY.V) ACTION.N))
	)
	(:STEPS
		(?X_E (?X_F LIKE.5.V (KA STUDY.V)))
		(?X_A (?X_F (HARD.ADV ((ADV-A (ON.P ?X_B)) WORK.V))))
	)
)

; "Tommy went to bed."
; "He slept for a while."
; "Then he woke up."
; "He felt better."
; "He went to sleep again."
(EPI-SCHEMA ((?X_M ((ADV-A (TO.P ?X_N)) ((ADV-A (FROM.P ?X_M)) GO.V))) ** ?E)
	(:ROLES
		(!R1 (?X_C BETTER.A))
		(!R2 (?X_H WHILE.N))
		(!R3 (?X_N BED.N))
		(!R4 (?X_M AGENT.N))
		(!R5 (?X_N DESTINATION.N))
	)
	(:STEPS
		(?X_J (?X_M ((ADV-A (FROM.P ?L1)) GO.6.V) ?X_N))
		(?X_G (?X_M ((ADV-A (FOR.P ?X_H)) SLEEP.V)))
		(?X_E (?X_M (THEN.ADV WAKE_UP.V)))
		(?X_B (?X_M (FEEL.V ?X_C)))
		(?X_L (?X_M ((ADV-A (FROM.P ?L1)) GO.6.V) ?X_N))
	)
)

; "Alice slept in bed."
; "She dreamed that she was walking through a park."
; "In the dream, Alice saw lots of flowers."
(EPI-SCHEMA ((?X_D (DREAM.V (THAT (?X_D ((ADV-A (THROUGH.P ?X_E)) WALK.V)))))
             ** ?E)
	(:ROLES
		(!R1 (?X_A BED.N))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_E PARK.N))
	)
	(:STEPS
		(?X_C (?X_D ((ADV-A (IN.P ?X_A)) SLEEP.V)))
		(?X_G (?X_D (DREAM.V (THAT (?X_D ((ADV-A (THROUGH.P ?X_E)) WALK.V))))))
	)
)

; "Mary loved to play baseball."
; "She played on a team."
; "She liked to swing her bat at the ball."
; "After practice, she went home."
(EPI-SCHEMA ((?X_K (PLAY.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_H BASEBALL.N))
		(!R2 (?X_I BALL.N))
		(!R3 (?X_J BAT.N))
		(!R4 (?X_J (PERTAIN-TO ?X_K)))
		(!R5 (?X_L HOME.N))
		(!R6 (?X_L (PERTAIN-TO ?X_K)))
		(!R7 ((KA (PLAY.V ?X_H)) ACTION.N))
		(!R8 (?X AGENT.N))
		(!R9 ((KA (((ADV-A (AT.P ?X_I)) SWING.V) ?X_J)) ACTION.N))
		(!R10 (?X_K AGENT.N))
		(!R11 (?X_L DESTINATION.N))
	)
	(:STEPS
		(?X_C (?X_K LOVE.7.V (KA (PLAY.V ?X_H))))
		(?E_1 (?X PLAY.2.V))
		(?X_E (?X_K PLAY.8.V))
		(?X_A (?X_K LIKE.9.V (KA (((ADV-A (AT.P ?X_I)) SWING.V) ?X_J))))
		(?X_G (?X_K ((ADV-A (FROM.P ?L1)) GO.6.V) ?X_L))
	)
)

; "John went to bed early."
; "He slept for two hours."
; "He woke up feeling refreshed."
; "He felt great!"
(EPI-SCHEMA ((?X_G ((ADV-A (TO.P ?X_H)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_H BED.N))
		(!R2 (?X_G AGENT.N))
		(!R3 (?X_H DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_G ((ADV-A (FROM.P ?L1)) GO.6.V) ?X_H))
		(?X_D (?X_G ((ADV-A (FOR.P (TWO.D (PLUR HOUR.N)))) SLEEP.V)))
		(?X_B (?X_G ((ADV-A (FOR.P (KA (FEEL.V REFRESHED.A)))) WAKE_UP.V)))
	)
)

; "Jenny took a nap."
; "She slept for two hours."
; "She woke up feeling refreshed."
; "She felt better after taking a nap."
(EPI-SCHEMA ((?X_H (TAKE.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A NAP.N))
		(!R2 (?X_H AGENT.N))
		(!R3 (?X_I ((ADV-A (AFTER.P (KA (TAKE.V ?X_J)))) BETTER.A)))
	)
	(:STEPS
		(?X_C (?X_H (TAKE.V ?X_A)))
		(?X_E (?X_H ((ADV-A (FOR.P (TWO.D (PLUR HOUR.N)))) SLEEP.V)))
		(?X_G (?X_H ((ADV-A (FOR.P (KA (FEEL.V REFRESHED.A)))) WAKE_UP.V)))
		(?X_L (?X_H (FEEL.V ?X_I)))
	)
)

; "Alfred was taking a nap."
; "He slept for a while."
; "He woke up."
; "He felt better."
(EPI-SCHEMA ((?X_I (TAKE.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A NAP.N))
		(!R2 (?X_D WHILE.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_J BETTER.A))
	)
	(:STEPS
		(?X_C (?X_I (TAKE.V ?X_A)))
		(?X_F (?X_I ((ADV-A (FOR.P ?X_D)) SLEEP.V)))
		(?X_H (?X_I WAKE_UP.V))
		(?X_L (?X_I (FEEL.V ?X_J)))
	)
)

; "A man died."
; "His family buried him."
; "Everyone cried."
; "The funeral director read a poem."
(EPI-SCHEMA ((?X_E DIE.V) ** ?E)
	(:ROLES
		(!R1 (?X_D FAMILY.N))
		(!R2 (?X_E MAN.N))
		(!R3 (?X_D (PERTAIN-TO ?X_E)))
		(!R4 (?X_H FUNERAL.A))
		(!R5 (?X_H DIRECTOR.N))
		(!R6 (?X_I POEM.N))
	)
	(:STEPS
		(?X_C (?X_E DIE.V))
		(?X_A (?X_D (BURY.V ?X_E)))
		(?X_G ((EVERY.D PERSON.N) CRY.V))
		(?X_K (?X_H (READ.V ?X_I)))
	)
)

; "The man was having a bad day."
; "He was angry at everyone."
; "He was upset about everything."
; "He was so mad."
; "He threw something against the wall."
(EPI-SCHEMA ((?X_F ((AROUND.ADV THROW.V) ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C BAD.A))
		(!R2 (?X_C DAY.N))
		(!R3 (?X_F MAN.N))
		(!R4 (?X_F ANGRY.A))
		(!R5 (?X_F (SO.ADV MAD.A)))
		(!R6 (?X_G WALL.N))
		(!R7 (?X_H THING.N))
	)
	(:STEPS
		(?X_E ((ADV-E ({DURING}.P ?X_C)) (?X_F HAVE.V)))
		(?X_A (?X_F (AT.P (EVERY.D PERSON.N))))
		(?X_B (?X_F (ABOUT.P (EVERY.D THING.N))))
		(?X_J (?X_F (((ADV-A (AGAINST.P ?X_G)) THROW.V) ?X_H)))
	)
)

; "Tom was angry."
; "He yelled at Bob."
; "He yelled at Jenny."
; "He yelled at Jack."
; "He yelled at Alan."
; "He yelled at Emma."
; "He yelled at Jason."
; "He yelled at Mr. Smith."
; "He yelled at Mrs. Jones."
; "He yelled at Ms. Brown."
(EPI-SCHEMA ((?X_S ((ADV-A (AT.P ?X_A)) YELL.V)) ** ?E)
	(:ROLES
		(!R1 (?X_A AGENT.N))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_J AGENT.N))
		(!R5 (?X_M AGENT.N))
		(!R6 (?X_P AGENT.N))
		(!R7 (?X_S ANGRY.A))
		(!R8 (?X_S AGENT.N))
		(!R9 (?X_T AGENT.N))
		(!R10 (?X_W AGENT.N))
		(!R11 (?X_Z MALE.A))
		(!R12 (?X_Z AGENT.N))
		(!R13 (?X_ZA AGENT.N))
	)
	(:STEPS
		(?X_C (?X_S ((ADV-A (AT.P ?X_A)) YELL.V)))
		(?X_F (?X_S ((ADV-A (AT.P ?X_D)) YELL.V)))
		(?X_I (?X_S ((ADV-A (AT.P ?X_G)) YELL.V)))
		(?X_L (?X_S ((ADV-A (AT.P ?X_J)) YELL.V)))
		(?X_O (?X_S ((ADV-A (AT.P ?X_M)) YELL.V)))
		(?X_R (?X_S ((ADV-A (AT.P ?X_P)) YELL.V)))
		(?X_V (?X_S ((ADV-A (AT.P ?X_T)) YELL.V)))
		(?X_Y (?X_Z ((ADV-A (AT.P ?X_W)) YELL.V)))
		(?X_ZC (?X_Z ((ADV-A (AT.P ?X_ZA)) YELL.V)))
	)
)

; "John was very angry."
; "He yelled at his boss."
; "He yelled at his friends."
; "He yelled at his wife."
(EPI-SCHEMA ((?X_G ((ADV-A (AT.P ?X_F)) YELL.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D BOSS.N))
		(!R2 (?X_E (PLUR FRIEND.N)))
		(!R3 (?X_G (VERY.ADV ANGRY.A)))
		(!R4 (?X_G AGENT.N))
		(!R5 (?X_D (PERTAIN-TO ?X_G)))
		(!R6 (?X_E (PERTAIN-TO ?X_G)))
		(!R7 (?X_F WIFE.N))
		(!R8 (?X_F (PERTAIN-TO ?X_G)))
	)
	(:STEPS
		(?X_A (?X_G ((ADV-A (AT.P ?X_D)) YELL.V)))
		(?X_B (?X_G ((ADV-A (AT.P ?X_E)) YELL.V)))
		(?X_C (?X_G ((ADV-A (AT.P ?X_F)) YELL.V)))
	)
)

; "Tom went to the park."
; "He played soccer."
; "His team lost the game."
; "He went home."
(EPI-SCHEMA ((?X_L ((ADV-A (TO.P ?X_L)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_B GAME.N))
		(!R2 (?X_H TEAM.N))
		(!R3 (?X_L PARK.N))
		(!R4 (?X_G SOCCER.N))
		(!R5 (?X_H (PERTAIN-TO ?X_M)))
		(!R6 (?X_N HOME.N))
		(!R7 (?X_N (PERTAIN-TO ?X_M)))
		(!R8 (?X_K AGENT.N))
		(!R9 (?X_L DESTINATION.N))
		(!R10 (?X_M AGENT.N))
		(!R11 (?X_N DESTINATION.N))
	)
	(:STEPS
		(?X_D (?X_K ((ADV-A (FROM.P ?L1)) GO.6.V) ?X_L))
		(?X_F (?X_M PLAY.11.V))
		(?X_A (?X_H (LOSE.V ?X_B)))
		(?X_J (?X_M ((ADV-A (FROM.P ?L1)) GO.6.V) ?X_N))
	)
)

; "Tom was sad because he lost his dog."
; "He was having a bad day."
; "He felt depressed."
; "He cried for awhile."
; "Then he stopped crying."
(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA.PR ?X_B ?X_C ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_B SAD.A))
		(!R2 (?X_C (BECAUSE.P (KE (?X_K (LOSE.V ?X_J))))))
		(!R3 (?X_D BAD.A))
		(!R4 (?X_D DAY.N))
		(!R5 (?X_G DEPRESSED.A))
		(!R6 (?X_K AGENT.N))
		(!R7 (?X_J (PERTAIN-TO ?X_K)))
	)
	(:STEPS
		(?X_A (?X_K (BE.V ?X_B ?X_C)))
		(?X_F ((ADV-E ({DURING}.P ?X_D)) (?X_K HAVE.V)))
		(?X_I (?X_K (FEEL.V ?X_G)))
		(?X_M (?X_K (THEN.ADV ((ADV-A (FOR.P (KA CRY.V))) STOP.V))))
	)
)

; "'I'm really angry right now,' Tom said."
; "'Why am I so angry?' he asked himself."
; "'Because I can't find my keys,' Tom thought."
; "'Maybe they're in here somewhere,' he said."
(EPI-SCHEMA ((?X_B (ASK.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B AGENT.N))
		(!R2 (?X_A (PERTAIN-TO ?X_B)))
	)
	(:STEPS
		(?X_D (?X_B (ASK.V ?X_B)))
	)
)

; "Benjamin was angry."
; "He was really mad."
; "He yelled at someone."
; "He punched a hole in the wall."
(EPI-SCHEMA ((?X_A (PUNCH.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_A PERSON.N))
		(!R2 (?X_D ANGRY.A))
		(!R3 (?X_D (REALLY.ADV MAD.A)))
		(!R4 (?X_D AGENT.N))
		(!R5 (?X_E WALL.N))
		(!R6 (?X_F HOLE.N))
	)
	(:STEPS
		(?X_C (?X_D ((ADV-A (AT.P ?X_A)) YELL.V)))
		(?X_H (?X_D (((ADV-A (IN.P ?X_E)) PUNCH.V) ?X_F)))
	)
)

; "Tommy was angry."
; "He was really mad."
; "He yelled at his friends."
; "He punched someone."
; "He broke something."
(EPI-SCHEMA ((?X_B ((ADV-A (AT.P ?X_F)) YELL.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR FRIEND.N)))
		(!R2 (?X_B PERSON.N))
		(!R3 (?X_F ANGRY.A))
		(!R4 (?X_F (REALLY.ADV MAD.A)))
		(!R5 (?X_F AGENT.N))
		(!R6 (?X_E (PERTAIN-TO ?X_F)))
		(!R7 (?X_G THING.N))
	)
	(:STEPS
		(?X_A (?X_F ((ADV-A (AT.P ?X_E)) YELL.V)))
		(?X_D (?X_F (PUNCH.V ?X_B)))
		(?X_I (?X_F (BREAK.V ?X_G)))
	)
)



; "Mary's mother died."
; "Her father cried."
; "Mary cried."
; "Mary's dad said he needed help."
; "Mary could not do anything."
(EPI-SCHEMA ((?X_E
              (COMPOSITE-SCHEMA.PR (THT (?X_K (NEED.V ?X_D))) (ANY.D THING.N)))
             ** ?E)
	(:ROLES
		(!R1 (?X_D HELP.N))
		(!R2 (?X_E DAD.N))
		(!R3 (?X_E (PERTAIN-TO ?X_K)))
		(!R4 (?X_F MOTHER.N))
		(!R5 (?X_F (PERTAIN-TO ?X_K)))
		(!R6 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_A (?X_F DIE.V))
		(E20.SK (NOT (?X_K ((CAN.MD DO.V) (ANY.D THING.N)))))
		(?X_H (?X_E CRY.1.V))
		(?X_J (?X_K CRY.2.V))
		(?X_C (?X_E (SAY.V (THT (?X_K (NEED.V ?X_D))))))
	)
)

; "Mary's mom died."
; "Mary's dad cried."
; "Mary cried."
; "Mary's dad said he needed help."
; "Mary could not do anything."
(EPI-SCHEMA ((?X_L CRY.V) ** ?E)
	(:ROLES
		(!R1 (?X_C HELP.N))
		(!R2 (?X_D DAD.N))
		(!R3 (?X_D (PERTAIN-TO ?X_L)))
		(!R4 (?X_G MOM.N))
		(!R5 (?X_G (PERTAIN-TO ?X_L)))
		(!R6 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_F (?X_G DIE.V))
		(E50.SK (NOT (?X_L ((CAN.MD DO.V) (ANY.D THING.N)))))
		(?X_I (?X_D CRY.3.V))
		(?X_K (?X_L CRY.4.V))
		(?X_B (?X_D (SAY.V (THT (?X_L (NEED.V ?X_C))))))
	)
)

; "Tom's mom died."
; "Tom cried."
; "Tom's dad said he needed help."
; "Tom could not do anything."
(EPI-SCHEMA ((?X_J
              (COMPOSITE-SCHEMA.PR (THT (?X_J (NEED.V ?X_C))) (ANY.D THING.N)))
             ** ?E)
	(:ROLES
		(!R1 (?X_C HELP.N))
		(!R2 (?X_D DAD.N))
		(!R3 (?X_D (PERTAIN-TO ?X_J)))
		(!R4 (?X_G MOM.N))
		(!R5 (?X_G (PERTAIN-TO ?X_J)))
		(!R6 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_F (?X_G DIE.V))
		(E73.SK (NOT (?X_J ((CAN.MD DO.V) (ANY.D THING.N)))))
		(?X_I (?X_J CRY.5.V))
		(?X_B (?X_D (SAY.V (THT (?X_J (NEED.V ?X_C))))))
	)
)

; "Aunt Mary's mom died."
; "Her dad cried."
; "Mary cried."
; "Mary's dad said he needed help."
; "Mary couldn't do anything."
(EPI-SCHEMA ((?X_D
              (COMPOSITE-SCHEMA.PR (THT (?X_I (NEED.V ?X_C))) (ANY.D THING.N)))
             ** ?E)
	(:ROLES
		(!R1 (?X_C HELP.N))
		(!R2 (?X_D DAD.N))
		(!R3 (?X_D (PERTAIN-TO ?X_I)))
		(!R4 (?X_I AGENT.N))
	)
	(:STEPS
		(E101.SK (NOT (?X_I ((CAN.MD DO.V) (ANY.D THING.N)))))
		(?X_F (?X_D CRY.6.V))
		(?X_H (?X_I CRY.7.V))
		(?X_B (?X_D (SAY.V (THT (?X_I (NEED.V ?X_C))))))
	)
)

; "Mary's mom died."
; "Mary's dad cried."
; "Mary cried."
; "Mary's dad said he needed help."
; "Mary couldn't do anything."
(EPI-SCHEMA ((?X_D
              (COMPOSITE-SCHEMA.PR (THT (?X_L (NEED.V ?X_C))) (ANY.D THING.N)))
             ** ?E)
	(:ROLES
		(!R1 (?X_C HELP.N))
		(!R2 (?X_D DAD.N))
		(!R3 (?X_D (PERTAIN-TO ?X_L)))
		(!R4 (?X_G MOM.N))
		(!R5 (?X_G (PERTAIN-TO ?X_L)))
		(!R6 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_F (?X_G DIE.V))
		(E127.SK (NOT (?X_L ((CAN.MD DO.V) (ANY.D THING.N)))))
		(?X_I (?X_D CRY.8.V))
		(?X_K (?X_L CRY.9.V))
		(?X_B (?X_D (SAY.V (THT (?X_L (NEED.V ?X_C))))))
	)
)

; "Sophia was sad because her mom died."
; "She missed her mom."
; "She cried for a while."
; "Then she stopped crying."
(EPI-SCHEMA ((?X_J CRY.V) ** ?E)
	(:ROLES
		(!R1 (?X_G MOM.N))
		(!R2 (?X_E (BECAUSE.P (KE (?X_G DIE.V)))))
		(!R3 (?X_F SAD.A))
		(!R4 (?X_G (PERTAIN-TO ?X_J)))
		(!R5 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_A (?X_J (BE.V ?X_F ?X_E)))
		(?X_B (?X_J (MISS.V ?X_G)))
		(?X_I (?X_J CRY.10.V))
		(?X_D (?X_J (THEN.ADV ((ADV-A (FOR.P (KA CRY.V))) STOP.V))))
	)
)

; "Sarah's mom died."
; "She cried for days."
; "She missed her mom."
(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA.PR ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D MOM.N))
		(!R2 (?X_D (PERTAIN-TO ?X_G)))
		(!R3 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_C (?X_D DIE.V))
		(?X_F (?X_G CRY.11.V))
		(?X_A (?X_G (MISS.V ?X_D)))
	)
)

; "Tom's mom died."
; "He missed her."
; "Tom's dad told Tom that he would miss her too."
; "Tom felt sad."
(EPI-SCHEMA ((?X_G (MISS.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E MOM.N))
		(!R2 (?X_G AGENT.N))
		(!R3 (?X_E (PERTAIN-TO ?X_G)))
		(!R4 (?X_F (PERTAIN-TO ?X_G)))
		(!R5 (?X_H SAD.A))
	)
	(:STEPS
		(?X_B (?X_E DIE.V))
		(?X_D (?X_G (MISS.V ?X_E)))
		(?X_J (?X_G (FEEL.V ?X_H)))
	)
)

; "Tom's mom died."
; "He cried for a while."
; "Then he stopped crying."
; "He felt sad for a while."
(EPI-SCHEMA ((?X_K ((ADV-A (FOR.P ?X_K)) CRY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_H MOM.N))
		(!R2 (?X_H (PERTAIN-TO ?X_K)))
		(!R3 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_G (?X_H DIE.V))
		(?X_J (?X_K CRY.12.V))
		(?X_E (?X_K (THEN.ADV ((ADV-A (FOR.P (KA CRY.V))) STOP.V))))
		(?X_C
   ((ADV-E (L X (AND (X DURING) (X SAD.A) (X (FOR.P (A.D WHILE.N))))))
    (?X_K FEEL.V)))
	)
)

; "Tom's sister died."
; "Tom cried."
; "Tom's mom told Tom that Mary's sister died."
; "Tom felt sad for Mary."
(EPI-SCHEMA ((?X_M (COMPOSITE-SCHEMA.PR ?X_M (THAT (?X_J DIE.V)) ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_K SAD.A))
		(!R2 (?X_E MOM.N))
		(!R3 (?X_E (PERTAIN-TO ?X_M)))
		(!R4 (?X_J SISTER.N))
		(!R5 (?X_J (PERTAIN-TO ?X_M)))
		(!R6 (?X_L AGENT.N))
		(!R7 (?X_J (PERTAIN-TO ?X_L)))
		(!R8 (?X_K (FOR.P ?X_L)))
		(!R9 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_G (?X_J DIE.V))
		(?X_I (?X_M CRY.13.V))
		(?X_D (?X_E (TELL.V ?X_M (THAT (?X_J DIE.V)))))
		(?X_B (?X_M (FEEL.V ?X_K)))
	)
)

; "The girl was dancing."
; "She danced well."
; "She won a trophy."
; "Everyone clapped."
(EPI-SCHEMA ((?X_F ((ADV-A (AT.P ?L2)) DANCE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E TROPHY.N))
		(!R2 (?X_F GIRL.N))
		(!R3 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_H (?X_F ((ADV-A (FROM.P ?L1)) DANCE.14.V) ?L2))
		(?X_J (?X_F ((ADV-A (FROM.P ?L1)) DANCE.14.V) ?L2))
		(?X_D (?X_F (WIN.V ?X_E)))
		(?X_B ((EVERY.D PERSON.N) CLAP.V))
	)
)

; "Amber liked to dance."
; "She was a dancer."
; "She went to a party."
; "There were many dancers there."
; "They all danced together."
(EPI-SCHEMA ((?X_F ((ADV-A (TO.P ?X_I)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C DANCER.N))
		(!R2 (?X_I PARTY.N))
		(!R3 (?X_F AGENT.N))
		(!R4 ((KA DANCE.V) ACTION.N))
		(!R5 (?X_I DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_C LIKE.15.V (KA DANCE.V)))
		(?X_E (?X_C ((ADV-A (FROM.P ?L1)) GO.16.V) ?X_I))
		(?X_H ((ALL.D ({OF}.P ?X_F)) ((ADV-A (FROM.P ?L1)) DANCE.17.V) ?L2))
	)
)

; "Kate was studying dance."
; "She learned how to dance."
; "She practiced dancing."
; "She performed on stage."
(EPI-SCHEMA ((?X_G (COMPOSITE-SCHEMA.PR ?X_A ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_A DANCE.N))
		(!R2 (?X_D DANCING.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_H STAGE.N))
	)
	(:STEPS
		(?X_C (?X_G (STUDY.V ?X_A)))
		(?X_F (?X_G (PRACTICE.V ?X_D)))
		(?X_J (?X_G ((ADV-A (ON.P ?X_H)) PERFORM.V)))
	)
)

; "Sarah was dancing."
; "She danced very well."
; "She danced for many hours."
; "She danced until everyone left the room."
(EPI-SCHEMA ((?X_J (DANCE.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_I (UNTIL.P (KE ((EVERY.D PERSON.N) (LEAVE.V ?X_K))))))
		(!R2 (?X_K ROOM.N))
		(!R3 (?X_I DESTINATION.N))
		(!R4 ((K (UNTIL.P ((EVERY.D PERSON.N) (LEAVE.V ?X_K)))) LOCATION.N))
		(!R5 (?X_J AGENT.N))
		(!R6 (NOT ((K (UNTIL.P ((EVERY.D PERSON.N) (LEAVE.V ?X_K)))) = ?L2)))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_J ((ADV-A (FROM.P ?L1)) DANCE.14.V) ?L2))
		(?X_D (?X_J ((ADV-A (FROM.P ?L1)) DANCE.14.V) ?L2))
		(?X_F (?X_J ((ADV-A (FROM.P ?L1)) DANCE.14.V) ?L2))
		(?X_H (?X_J ((ADV-A (FROM.P ?L1)) DANCE.18.V) ?X_I))
		(?X_H
   (?X_J
    ((ADV-A (FROM.P (K (UNTIL.P ((EVERY.D PERSON.N) (LEAVE.V ?X_K))))))
     DANCE.19.V)
    ?L2))
	)
)

; "A boy named Tom played basketball."
; "He practiced hard."
; "He played on the team."
; "He scored lots of points."
; "He beat all the other teams."
(EPI-SCHEMA ((?X_N (HARD.ADV PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR LOT.N)))
		(!R2 (?X_C (OF.P ?X_D)))
		(!R3 (?X_G HARD.A))
		(!R4 (?X_J BASKETBALL.N))
		(!R5 (?X_K BOY.N))
		(!R6 (?X_K ((PASV NAME.V) ?X_N)))
		(!R7 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_I (?X_K PLAY.20.V))
		(?X_F (?X_N (PRACTICE.V ?X_G)))
		(?X_M (?X_N PLAY.21.V))
		(?X_B (?X_N (SCORE.V ?X_C)))
	)
)

; "Karen was dancing."
; "She moved her arms and legs."
; "She lifted her knees high."
; "She bent her knees low."
; "She jumped on one foot."
; "She bounced on one foot."
; "She walked around."
(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA.PR (SET-OF ?X_D ?X_C) ?X_E ?L2)) ** ?E)
	(:ROLES
		(!R1 (?X_E LOW.A))
		(!R2 (?X_E (PLUR KNEE.N)))
		(!R3 (?X_C (PLUR LEG.N)))
		(!R4 (?X_D (PLUR ARM.N)))
		(!R5 (?X_D (PERTAIN-TO ?X_N)))
		(!R6 (?X_N (BENT.N ?X_E)))
		(!R7 (?X_E (PERTAIN-TO ?X_N)))
		(!R8 (?X_N AGENT.N))
		(!R9 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_G (?X_N ((ADV-A (FROM.P ?L1)) DANCE.14.V) ?L2))
		(?X_A (?X_N (MOVE.V (SET-OF ?X_D ?X_C))))
		(?X_B (?X_N ((HIGH.ADV LIFT.V) ?X_E)))
		(?X_I (?X_N ((ADV-A (FROM.P ?L1)) JUMP.22.V) ?L2))
		(?X_K (?X_N ((ADV-A (FROM.P ?L1)) BOUNCE.23.V) ?L2))
		(?X_M (?X_N ((ADV-A (FROM.P ?L1)) WALK_AROUND.24.V) ?L2))
	)
)

; "Sammy liked to dance."
; "He could dance well."
; "He also played basketball."
(EPI-SCHEMA ((?X_F DANCE.V) ** ?E)
	(:ROLES
		(!R1 (?X_E BASKETBALL.N))
		(!R2 ((KA DANCE.V) ACTION.N))
		(!R3 (?X_F AGENT.N))
	)
	(:STEPS
		(E434.SK (?X_F (CAN.MD (WELL.ADV DANCE.V))))
		(?X_B (?X_F LIKE.25.V (KA DANCE.V)))
		(?X_D (?X_F PLAY.26.V))
	)
)



; "The boy sat in front of the TV."
; "He watched cartoons all day long."
; "When he woke up, he felt sick."
; "He stayed home for three days."
(EPI-SCHEMA ((?X_D
              ((ADV-A (IN_FRONT_OF.P ?X_B))
               ((ADV-A (FOR.P (THREE.D (PLUR DAY.N)))) STAY.V)))
             ** ?E)
	(:ROLES
		(!R1 (?X_B TV.N))
		(!R2 (?X_D BOY.N))
		(!R3 (?X_C HOME.N))
		(!R4 (?X_C (PERTAIN-TO ?X_D)))
	)
	(:STEPS
		(?X_A (?X_D ((ADV-A (IN_FRONT_OF.P ?X_B)) SIT.V)))
		(?X_F
   (?X_D ((ADV-A (TO.P ?X_C)) ((ADV-A (FOR.P (THREE.D (PLUR DAY.N)))) STAY.V))))
	)
)

; "Tom watched TV."
; "He liked cartoons on TV."
; "He saw some funny movies on TV."
(EPI-SCHEMA ((?X_C (LIKE.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_J (PLUR CARTOON.N)))
		(!R3 (?X_H TV.N))
		(!R4 (?X_I FUNNY.A))
		(!R5 (?X_L (ON.P ?X_H)))
		(!R6 (?X_L ?X_I (PLUR MOVIE.N)))
		(!R7 (?X_J OBJECT.N))
		(!R8 (NOT (?X_J ACTION.N)))
		(!R9 (NOT (?X_J AGENT.N)))
		(!R10 (?X_K AGENT.N))
		(!R11 (?X_L ENTITY.N))
	)
	(:STEPS
		(?X_B (?X_K (WATCH.V ?X_C)))
		(?X_E (?X_K LIKE.2.V ?X_J))
		(?X_G (?X_K SEE.3.V ?X_L))
	)
)

; "Jack watched cartoons on television."
; "He liked them."
; "He watched them all day long."
(EPI-SCHEMA ((?X_G (LIKE.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR CARTOON.N)))
		(!R2 (?X_C TELEVISION.N))
		(!R3 (?X_F OBJECT.N))
		(!R4 (NOT (?X_F ACTION.N)))
		(!R5 (NOT (?X_F AGENT.N)))
		(!R6 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_B (?X_G (((ADV-A (ON.P ?X_C)) WATCH.V) ?X_F)))
		(?X_E (?X_G LIKE.4.V ?X_F))
	)
)

; "John watched television."
; "He saw lots of shows on TV."
; "He watched cartoons."
; "He liked watching cartoons."
(EPI-SCHEMA ((?X_N (WATCH.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR CARTOON.N)))
		(!R2 (?X_F TELEVISION.N))
		(!R3 (?X_J (PLUR SHOW.N)))
		(!R4 (?X_I (PLUR LOT.N)))
		(!R5 (?X_I (OF.P ?X_J)))
		(!R6 (?X_M (PLUR CARTOON.N)))
		(!R7 ((KA (WATCH.V ?X_M)) ACTION.N))
		(!R8 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_E (?X_N (WATCH.V ?X_F)))
		(?X_H (?X_N SEE.5.V ?X_I))
		(?X_B (?X_N (WATCH.V ?X_C)))
		(?X_L (?X_N LIKE.6.V (KA (WATCH.V ?X_M))))
	)
)

; "Jason's mom watched TV on Saturday nights."
; "That night, Jason's dad came home late from work."
; "Jason's mother yelled at him because he missed the end of the show."
; "Jason's father got mad too."
(EPI-SCHEMA ((?X_I ((ADV-A (AT.P ?X_I)) YELL.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C (BECAUSE.P (KE (?X_K (MISS.V ?X_D))))))
		(!R2 (?X_L DAD.N))
		(!R3 (?X_G (ON.P (KE (?X_H (PLUR NIGHT.N))))))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_J MOM.N))
		(!R6 (?X_J MOTHER.N))
		(!R7 (?X_K AGENT.N))
		(!R8 (?X_J (PERTAIN-TO ?X_K)))
		(!R9 (?X_L (PERTAIN-TO ?X_K)))
		(!R10 (?X_O WORK.N))
		(!R11 (?X_P HOME.N))
		(!R12 (?X_P (PERTAIN-TO ?X_L)))
		(!R13 (?X_P DESTINATION.N))
		(!R14 (?X_O LOCATION.N))
		(!R15 (NOT (?X_O = ?X_P)))
	)
	(:STEPS
		(?X_F (?X_J (WATCH.V ?X_I ?X_G)))
		(?X_N (?X_L ((ADV-A (FROM.P ?X_O)) COME.8.V) ?X_P))
		(?X_B (?X_J (((ADV-A (AT.P ?X_L)) YELL.V) ?X_C)))
	)
)

; "Tom liked watching television."
; "He watched cartoons."
; "He played video games."
; "He watched movies."
; "He also read books on tape."
(EPI-SCHEMA ((?X_P
              (COMPOSITE-SCHEMA.PR ?X_M ?X_J ?X_G ?X_C (KA (WATCH.V ?X_Q))))
             ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR BOOK.N)))
		(!R2 (?X_C (ON.P ?X_D)))
		(!R3 (?X_G (PLUR MOVIE.N)))
		(!R4 (?X_J VIDEO.N))
		(!R5 (?X_J (PLUR GAME.N)))
		(!R6 (?X_M (PLUR CARTOON.N)))
		(!R7 (?X_Q TELEVISION.N))
		(!R8 (?X_P AGENT.N))
		(!R9 ((KA (WATCH.V ?X_Q)) ACTION.N))
	)
	(:STEPS
		(?X_O (?X_P LIKE.9.V (KA (WATCH.V ?X_Q))))
		(?X_L (?X_P (WATCH.V ?X_M)))
		(?X_I (?X_P (PLAY.V ?X_J)))
		(?X_F (?X_P (WATCH.V ?X_G)))
		(?X_B (?X_P ((ALSO.ADV READ.V) ?X_C)))
	)
)

; "Tommy liked watching TV."
; "He often watched TV."
; "He watched cartoons."
(EPI-SCHEMA ((?X_I ((OFTEN.ADV WATCH.V) ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR CARTOON.N)))
		(!R2 (?X_I AGENT.N))
		(!R3 (?X_H AGENT.N))
		(!R4 ((KA (WATCH.V ?X_I)) ACTION.N))
	)
	(:STEPS
		(?X_G (?X_H LIKE.10.V (KA (WATCH.V ?X_I))))
		(?X_E (?X_H ((OFTEN.ADV WATCH.V) ?X_I)))
		(?X_B (?X_H (WATCH.V ?X_C)))
	)
)

; "The dog ran into the house."
; "He jumped on the couch."
; "He barked loudly."
; "No one answered."
; "The dog lay down."
(EPI-SCHEMA ((?X_C (COMPOSITE-SCHEMA.PR ?X_J ?L2 ?N)) ** ?E)
	(:ROLES
		(!R1 (?X_C DOG.N))
		(!R2 (?X_J HOUSE.N))
		(!R3 (?X_J DESTINATION.N))
		(!R4 (?L2 DESTINATION.N))
		(!R5 (?N NOISE.N))
	)
	(:STEPS
		(?X_E (?X_C ((ADV-A (FROM.P ?L1)) RUN.11.V) ?X_J))
		(?X_G (?X_C ((ADV-A (FROM.P ?L1)) JUMP.12.V) ?L2))
		(?X_I (?X_C BARK.13.V ?N))
		(?X_B (?X_C LIE-FLAT_DOWN.V))
	)
)

; "Alfred's dog was hungry."
; "He ate some food."
; "He walked around the yard."
; "He played fetch."
; "He chased balls."
; "He slept next to Alfred."
(EPI-SCHEMA ((?X_L
              (COMPOSITE-SCHEMA.PR ?X_M ?X_P ?L2 (KE (?X_A FETCH.V)) ?X_O))
             ** ?E)
	(:ROLES
		(!R1 (?X_M NEXT.A))
		(!R2 (?X_L HUNGRY.A))
		(!R3 (?X_L DOG.N))
		(!R4 (?X_N AGENT.N))
		(!R5 (?X_L (PERTAIN-TO ?X_N)))
		(!R6 (?X_M (TO.P ?X_N)))
		(!R7 (?X_O (PLUR BALL.N)))
		(!R8 (?X_P FOOD.N))
		(!R9 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_L EAT.14.V ?X_P))
		(?X_G (?X_L ((ADV-A (FROM.P ?L1)) WALK.15.V) ?L2))
		(?X_I (?X_L PLAY.16.V (KE (?X_A FETCH.V))))
		(?X_K (?X_L CHASE.17.V ?X_O))
		(?X_C (?X_L (SLEEP.V ?X_M)))
	)
)

; "Alice went for a walk with her dog."
; "The dog chased rabbits."
; "The rabbit ran away."
; "The dog caught the rabbit."
(EPI-SCHEMA ((?X_K ((ADV-A (FROM.P ?X_C)) (AWAY.ADV RUN.V))) ** ?E)
	(:ROLES
		(!R1 (?X_C RABBIT.N))
		(!R2 (?X_D DOG.N))
		(!R3 (?X_L (PLUR RABBIT.N)))
		(!R4 (?X_K AGENT.N))
		(!R5 (?X_L LOCATION.N))
		(!R6 (NOT (?X_L = ?L2)))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_F (?X_K ((ADV-A (FROM.P ?L1)) GO.18.V) ?L2))
		(?X_H (?X_D CHASE.19.V ?X_L))
		(?X_J (?X_C ((ADV-A (FROM.P ?X_L)) RUN_AWAY.20.V) ?L2))
		(?X_B (?X_D (CATCH.V ?X_C)))
	)
)

; "Tommy liked to play basketball."
; "He played basketball."
; "He scored points."
; "He made some baskets."
; "He won the game."
(EPI-SCHEMA ((?X (PLAY.V ?X_O)) ** ?E)
	(:ROLES
		(!R1 (?X_C GAME.N))
		(!R2 (?X_F (PLUR BASKET.N)))
		(!R3 (?X_I (PLUR POINT.N)))
		(!R4 (?X_O BASKETBALL.N))
		(!R5 (?X_N BASKETBALL.N))
		(!R6 ((KA (PLAY.V ?X_O)) ACTION.N))
		(!R7 (?X AGENT.N))
		(!R8 (?X_P AGENT.N))
	)
	(:STEPS
		(?X_K (?X_P LIKE.21.V (KA (PLAY.V ?X_O))))
		(?E_1 (?X PLAY.22.V))
		(?X_M (?X_P PLAY.23.V))
		(?X_H (?X_P (SCORE.V ?X_I)))
		(?X_E (?X_P (MAKE.V ?X_F)))
		(?X_B (?X_P (WIN.V ?X_C)))
	)
)

; "Lilly's dog chased the cat."
; "The cat ran away."
; "The dog caught the cat."
(EPI-SCHEMA ((?X_G ((ADV-A (FROM.P ?X_F)) (AWAY.ADV RUN.V))) ** ?E)
	(:ROLES
		(!R1 (?X_C CAT.N))
		(!R2 (?X_F DOG.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_F (PERTAIN-TO ?X_G)))
		(!R5 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_F CHASE.28.V ?X_C))
		(?X_I (?X_C ((ADV-A (FROM.P ?L1)) RUN_AWAY.29.V) ?L2))
		(?X_B (?X_F (CATCH.V ?X_C)))
	)
)

; "Alfred's dog ran into the house."
; "He jumped on the couch."
; "He barked loudly."
; "No one answered."
; "The dog laid down."
(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA.PR ?X_K ?L2 ?N)) ** ?E)
	(:ROLES
		(!R1 (?X_I DOG.N))
		(!R2 (?X_K HOUSE.N))
		(!R3 (?X_J AGENT.N))
		(!R4 (?X_I (PERTAIN-TO ?X_J)))
		(!R5 (?X_K DESTINATION.N))
		(!R6 (?L2 DESTINATION.N))
		(!R7 (?N NOISE.N))
	)
	(:STEPS
		(?X_D (?X_I ((ADV-A (FROM.P ?L1)) RUN.11.V) ?X_K))
		(?X_F (?X_I ((ADV-A (FROM.P ?L1)) JUMP.12.V) ?L2))
		(?X_H (?X_I BARK.30.V ?N))
		(?X_B (?X_I LAY_DOWN.V))
	)
)



; "The school bus came by."
; "All the kids got on."
; "Some kids started fighting."
; "The driver stopped the bus."
; "He took all the kids off."
(EPI-SCHEMA ((?X_D ((ADV-A (BY.P ?L2)) COME.V)) ** ?E)
	(:ROLES
		(!R1 (?X_H SCHOOL.N))
		(!R2 (?X_H BUS.N))
		(!R3 (?X_D DRIVER.N))
		(!R4 (?X_G (PLUR KID.N)))
		(!R5 (?X_H AGENT.N))
		(!R6 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_H ((ADV-A (FROM.P ?L1)) COME_BY.1.V) ?L2))
		(?X_F (?X_G ((ADV-A (FOR.P (KA FIGHT.V))) START.V)))
		(?X_C (?X_D (STOP.V ?X_H)))
	)
)

; "Alfred's mom drove him to school."
; "He got on the bus."
; "When they arrived at school, Alfred's mom dropped him off."
(EPI-SCHEMA ((?X_H (DRIVE.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_C BUS.N))
		(!R2 (?X_H AGENT.N))
		(!R3 (?X_D MOM.N))
		(!R4 (?X_D (PERTAIN-TO ?X_H)))
		(!R5 (?X_I MOM.N))
		(!R6 (?X_I (PERTAIN-TO ?X_H)))
		(!R7 (?X_G SCHOOL.N))
		(!R8 (?X_G DESTINATION.N))
		(!R9 (?X_I AGENT.N))
		(!R10 (?X_H SMALLER-THAN.N ?X_I))
	)
	(:STEPS
		(?X_F (?X_I DRIVE.2.V ?X_H ?X_G))
		(?X_B (?X_H ((ADV-A (ON.P ?X_C)) GET.V)))
	)
)

; "The children were getting on a bus."
; "They sat down together."
; "Some kids fought."
; "A policeman broke up the fight."
; "The children got off the bus."
(EPI-SCHEMA ((?X_H (GET_OFF.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_K BUS.N))
		(!R2 (?X_E POLICEMAN.N))
		(!R3 (?X_H (PLUR CHILD.N)))
		(!R4 (?X_K DESTINATION.N))
	)
	(:STEPS
		(?X_J (?X_H ((ADV-A (FROM.P ?L1)) GET.3.V) ?X_K))
		(?X_G (?X_H (TOGETHER.ADV SIT_DOWN.V)))
		(?X_D (?X_E ((ADV-A (FOR.P (KA FIGHT.V))) BREAK_UP.V)))
		(?X_B (?X_H ((ADV-A (OFF.P ?X_K)) GET.V)))
	)
)

; "John's mom drove him to school in the car."
; "She dropped him off at the front door."
; "She picked him up from school."
; "The school had a playground."
(EPI-SCHEMA ((?X_L (DRIVE.V ?X_L ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_N SCHOOL.N))
		(!R2 (?X_L AGENT.N))
		(!R3 (?X_E DOOR.N))
		(!R4 (?X_E FRONT.A))
		(!R5 (?X_M MOM.N))
		(!R6 (?X_M (PERTAIN-TO ?X_L)))
		(!R7 (?X_H CAR.N))
		(!R8 (?X_N (IN.P ?X_H)))
		(!R9 (?X_K PLAYGROUND.N))
		(!R10 (?X_L SMALLER-THAN.N ?X_M))
		(!R11 (?X_M AGENT.N))
		(!R12 (?X_N DESTINATION.N))
		(!R13 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_G (?X_M DRIVE.2.V ?X_L ?X_N))
		(?X_D (?X_M (((ADV-A (AT.P ?X_E)) DROP_OFF.V) ?X_L)))
		(?X_B (?X_M (((ADV-A (FROM.P ?X_N)) PICK_UP.V) ?X_L)))
		(?X_J (?X_N HAVE.4.V ?X_K))
	)
)

; "The teacher called the parents."
; "The parents came right away."
; "The teacher explained what happened."
; "The parents talked about discipline."
(EPI-SCHEMA ((?X_F (CALL.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_F TEACHER.N))
		(!R2 (?X_I (PLUR PARENT.N)))
		(!R3 (?X_J DISCIPLINE.N))
	)
	(:STEPS
		(?X_C (?X_F (CALL.V ?X_I)))
		(?X_E (?X_I ((ADV (RIGHT.ADV AWAY.A)) COME.V)))
		(?X_H (?X_F (EXPLAIN.V (ANS-TO (?X_A HAPPEN.V)))))
		(?X_L (?X_I ((ADV-A (ABOUT.P ?X_J)) TALK.V)))
	)
)

; "Jack's mom is strict."
; "She doesn't let Jack do anything wrong."
; "She gets mad if Jack breaks rules."
; "Jack likes to break rules."
(EPI-SCHEMA ((?X_K (GET.V (KJ MAD.A))) ** ?E)
	(:ROLES
		(!R1 (?X_E (IF.P (KE (?X_L (BREAK.V ?X_D))))))
		(!R2 (?X_E MAD.A))
		(!R3 (?X_H STRICT.A))
		(!R4 (?X_H MOM.N))
		(!R5 (?X_H AGENT.N))
		(!R6 (?X_H (PERTAIN-TO ?X_L)))
		(!R7 (?X_K (PLUR RULE.N)))
		(!R8 ((KA (BREAK.V ?X_K)) ACTION.N))
		(!R9 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_G
   (NOT
    (?X_H
     (((ADV-A (FOR.P (KA (DO.V (ANY.D (L X (AND (X THING.N) (X WRONG.A))))))))
       LET.V)
      ?X_L))))
		(?X_C (?X_H (GET.V ?X_E)))
		(?X_J (?X_L LIKE.5.V (KA (BREAK.V ?X_K))))
	)
)

; "Alicia's mom told her not to talk during recess."
; "Alicia wasn't allowed to play on the playground."
; "She couldn't play outside."
; "She was sad because she could only watch her friends."
(EPI-SCHEMA ((?X_C (OUTSIDE.ADV PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C AGENT.N))
		(!R2 (?X_A (PERTAIN-TO ?X_C)))
		(!R3 (?X_B (PERTAIN-TO ?X_C)))
		(!R4 (?X_D PLAYGROUND.N))
		(!R5 (?X AGENT.N))
	)
	(:STEPS
		(E296.SK (NOT (?X_C (CAN.MD (OUTSIDE.ADV PLAY.V)))))
		(?E_1 (?X PLAY.6.V))
	)
)

; "'The teacher told the students to sit down.'"
; "'The students were quiet.'"
; "'The teacher asked the students to stand up.'"
; "'The students stood up.'"
; "'The teacher told the students to sit down again.'"
; "'The students sat down.'"
; "'The teacher told the students to stand up again.'"
; "'The students stood up.'"
; "'The teacher told the students to sit down again.'"
; "'The students sat down.'"
; "'The teacher told the students to stand up again.'"
; "'The students stood up.'"
; "'The teacher"
(EPI-SCHEMA ((?X_W
              (COMPOSITE-SCHEMA.PR (KA (DOWN.ADV SIT.V)) (KA STAND_UP.V)
               (KA (AGAIN.ADV SIT_DOWN.V)) ?X_X (KA (AGAIN.ADV STAND_UP.V))))
             ** ?E)
	(:ROLES
		(!R1 (?X_W TEACHER.N))
		(!R2 (?X_X QUIET.A))
		(!R3 (?X_X (PLUR STUDENT.N)))
		(!R4 ((KA (DOWN.ADV SIT.V)) ACTION.N))
		(!R5 ((KA STAND_UP.V) ACTION.N))
		(!R6 ((KA (AGAIN.ADV SIT_DOWN.V)) ACTION.N))
		(!R7 (NOT (?X_W = ?X_X)))
		(!R8 ((KA (AGAIN.ADV STAND_UP.V)) ACTION.N))
	)
	(:STEPS
		(?X_P (?X_W TELL.7.V ?X_X (KA (DOWN.ADV SIT.V))))
		(?X_R (?X_W ASK.8.V ?X_X (KA STAND_UP.V)))
		(?X_N (?X_X STAND_UP.V))
		(?X_L (?X_W (TELL.V ?X_X (KA (AGAIN.ADV SIT_DOWN.V)))))
		(?X_J (?X_X (DOWN.ADV SIT.V)))
		(?X_H (?X_W (TELL.V ?X_X (KA (AGAIN.ADV STAND_UP.V)))))
		(?X_F (?X_X STAND_UP.V))
		(?X_T (?X_W TELL.9.V ?X_X (KA (AGAIN.ADV SIT_DOWN.V))))
		(?X_D (?X_X (DOWN.ADV SIT.V)))
		(?X_V (?X_W TELL.10.V ?X_X (KA (AGAIN.ADV STAND_UP.V))))
		(?X_B (?X_X STAND_UP.V))
	)
)

; "Tom's mom worked all week."
; "His dad worked too."
; "He helped Tom do his chores on Saturday."
(EPI-SCHEMA ((?X_H (DO.V ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_E MOM.N))
		(!R2 (?X_F DAD.N))
		(!R3 (?X_H AGENT.N))
		(!R4 (?X_E (PERTAIN-TO ?X_H)))
		(!R5 (?X_F (PERTAIN-TO ?X_H)))
		(!R6 (?X_G (PLUR CHORE.N)))
		(!R7 (?X_G (PERTAIN-TO ?X_H)))
	)
	(:STEPS
		(?X_D ((ADV-E ({DURING}.P (ALL.D WEEK.N))) (?X_E WORK.V)))
		(?X_A (?X_F (TOO.ADV WORK.V)))
		(?X_B (?X_F (HELP.V (KE (?X_H (DO.V ?X_G))))))
	)
)

; "'I don't want my kids to be like that,' said Bill."
; "'My wife is going to give them some punishment.'"
; "Bill's wife told him to call the police."
(EPI-SCHEMA ((?X_G (TELL.V ?X_H (KA (CALL.V ?X_I)))) ** ?E)
	(:ROLES
		(!R1 (?X_C PUNISHMENT.N))
		(!R2 (?X_F (PLUR KID.N)))
		(!R3 (?X_G WIFE.N))
		(!R4 (?X_F (PERTAIN-TO ?X_H)))
		(!R5 (?X_G (PERTAIN-TO ?X_H)))
		(!R6 (?X_I POLICE.N))
		(!R7 (?X_H AGENT.N))
		(!R8 (NOT (?X_G = ?X_H)))
		(!R9 ((KA (CALL.V ?X_I)) ACTION.N))
	)
	(:STEPS
		(?X_B (?X_G ((ADV-A (FOR.P (KA (GIVE.V ?X_F ?X_C)))) GO.V)))
		(?X_E (?X_G TELL.11.V ?X_H (KA (CALL.V ?X_I))))
	)
)

; "Kate loves to play soccer."
; "She plays on a team."
; "The team has a coach."
; "The coach teaches Kate how to kick the ball."
(EPI-SCHEMA ((?X (PLAY.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_C COACH.N))
		(!R2 (?X_D TEAM.N))
		(!R3 (?X_I SOCCER.N))
		(!R4 ((KA (PLAY.V ?X_I)) ACTION.N))
		(!R5 (?X AGENT.N))
		(!R6 (?X_J AGENT.N))
	)
	(:STEPS
		(?X_F (?X_J LOVE.12.V (KA (PLAY.V ?X_I))))
		(?E_1 (?X PLAY.6.V))
		(?X_H (?X_J PLAY.13.V))
		(?X_B (?X_D (HAVE.V ?X_C)))
	)
)

; "Tina's mom came home from work."
; "Her dad was waiting for her."
; "He asked Tina how she was doing."
; "Tina told her mom everything that happened."
(EPI-SCHEMA ((?X_I ((ADV-A (TO.P ?X_F)) ((ADV-A (FROM.P ?X_B)) COME.V))) ** ?E)
	(:ROLES
		(!R1 (?X_F HOME.N))
		(!R2 (?X_B WORK.N))
		(!R3 (?X_E DAD.N))
		(!R4 (?X_E (PERTAIN-TO ?X_G)))
		(!R5 (?X_I MOM.N))
		(!R6 (?X_F (PERTAIN-TO ?X_I)))
		(!R7 (?X_I (PERTAIN-TO ?X_G)))
		(!R8 (?X_H ?X_I EVERYTHING.N))
	)
	(:STEPS
		(?X_D (?X_I ((ADV-A (TO.P ?X_F)) ((ADV-A (FROM.P ?X_B)) COME.V))))
		(?X_A (?X_E ((ADV-A (FOR.P ?X_I)) WAIT.V)))
	)
)



; "The man was tired."
; "He couldn't sleep."
; "He decided to take a nap."
; "He lay down on the couch."
; "He dozed off."
(EPI-SCHEMA ((?X_G (TAKE.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A NAP.N))
		(!R2 (?X_D COUCH.N))
		(!R3 (?X_G MAN.N))
		(!R4 (?X_G TIRED.A))
	)
	(:STEPS
		(E13.SK (NOT (?X_G (CAN.MD SLEEP.V))))
		(?X_C (?X_G (TAKE.V ?X_A)))
		(?X_F (?X_G ((ADV-A (ON.P ?X_D)) LIE-FLAT_DOWN.V)))
		(?X_I (?X_G DOZE_OFF.V))
	)
)

; "Amber slept on the couch."
; "She fell asleep there."
; "She woke up later."
; "She moved to bed."
(EPI-SCHEMA ((?X_M (FALL.V (K ASLEEP.A))) ** ?E)
	(:ROLES
		(!R1 (?X_E (ASLEEP.A ?X_F)))
		(!R2 (?X_I COUCH.N))
		(!R3 (?X_L BED.N))
		(!R4 (?X_L DESTINATION.N))
		(!R5 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_H (?X_M ((ADV-A (ON.P ?X_I)) SLEEP.V)))
		(?X_D (?X_M (FALL.V ?X_E)))
		(?X_B (?X_M (LATER.ADV WAKE_UP.V)))
		(?X_K (?X_M ((ADV-A (FROM.P ?L1)) MOVE.1.V) ?X_L))
	)
)

; "Tommy woke up early."
; "He wanted to play outside."
; "He put on his shoes."
; "He left the house."
(EPI-SCHEMA ((?X_I (EARLY.ADV WAKE_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR SHOE.N)))
		(!R2 (?X_F (PERTAIN-TO ?X_I)))
		(!R3 (?X_J HOUSE.N))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_J LOCATION.N))
		(!R6 (NOT (?X_J = ?L2)))
		(!R7 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_I (EARLY.ADV WAKE_UP.V)))
		(?X_C (?X_I (WANT.V (KA (OUTSIDE.ADV PLAY.V)))))
		(?X_A (?X_I ((ADV-A (ON.P ?X_F)) PUT.V)))
		(?E_1 (?X_I PLAY.2.V))
		(?X_H (?X_I ((ADV-A (FROM.P ?X_J)) LEAVE.3.V) ?L2))
	)
)

; "Tom's mom told him not to play baseball."
; "He played anyway."
; "He hit a long drive."
; "He made a run and won the game."
(EPI-SCHEMA ((?X_L (PLAY.V ?X_C)) ** ?E)
	(:ROLES
		(!R1 (?X_C GAME.N))
		(!R2 (?X_D RUN.N))
		(!R3 (?X_G LONG.A))
		(!R4 (?X_G DRIVE.N))
		(!R5 (?X_J MOM.N))
		(!R6 (?X_J (PERTAIN-TO ?X_L)))
		(!R7 (?X_K BASEBALL.N))
		(!R8 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_I (?X_L (ANYWAY.ADV PLAY.V)))
		(?X_F (?X_L (HIT.V ?X_G)))
		(?X_A (?X_L (MAKE.V ?X_D)))
		(?X_B (?X_L (WIN.V ?X_C)))
		(?E_1 (?X_L PLAY.4.V))
	)
)

; "Dan slept for a while."
; "He woke up."
; "He felt better."
; "He fell asleep again."
(EPI-SCHEMA ((?X_I WAKE_UP.V) ** ?E)
	(:ROLES
		(!R1 (?X_A WHILE.N))
		(!R2 (?X_F BETTER.A))
		(!R3 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_C (?X_I ((ADV-A (FOR.P ?X_A)) SLEEP.V)))
		(?X_E (?X_I WAKE_UP.V))
		(?X_H (?X_I (FEEL.V ?X_F)))
		(?X_K (?X_I ((ADV (ASLEEP.ADV AGAIN.A)) FALL.V)))
	)
)

; "Kathy went to bed early."
; "She slept well."
; "She woke up in the morning."
; "She felt rested."
(EPI-SCHEMA ((?X_J ((ADV-A (TO.P ?X_K)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E MORNING.N))
		(!R2 (?X_K BED.N))
		(!R3 (?X_J AGENT.N))
		(!R4 (?X_K DESTINATION.N))
	)
	(:STEPS
		(?X_I (?X_J ((ADV-A (FROM.P ?L1)) GO.6.V) ?X_K))
		(?X_G (?X_J (WELL.ADV SLEEP.V)))
		(?X_D (?X_J ((ADV-A (IN.P ?X_E)) WAKE_UP.V)))
		(?X_B (?X_J ((ADV-A (FOR.P (KA REST.V))) FEEL.V)))
	)
)

; "The man took a nap on the couch."
; "He fell asleep."
; "He dreamed that he was being chased by a monster."
; "He woke up."
; "He felt better."
(EPI-SCHEMA ((?X_M (TAKE.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_C BETTER.A))
		(!R2 (?X_H ASLEEP.A))
		(!R3 (?X_K NAP.N))
		(!R4 (?X_K (ON.P ?X_L)))
		(!R5 (?X_M MAN.N))
		(!R6 (?Y ENTITY.N))
	)
	(:STEPS
		(?X_J (?X_M (TAKE.V ?X_K)))
		(?X_G (?X_M (FALL.V ?X_H)))
		(?X_O (?X_M DREAM.7.V ?Y))
		(?X_E (?X_M WAKE_UP.V))
		(?X_B (?X_M (FEEL.V ?X_C)))
	)
)

; "Hannah slept for a while."
; "She woke up."
; "She felt sleepy again."
; "She fell asleep."
(EPI-SCHEMA ((?X_F (FALL.V (K ASLEEP.A))) ** ?E)
	(:ROLES
		(!R1 (?X_A WHILE.N))
		(!R2 (?X_F AGENT.N))
		(!R3 (?X_G ASLEEP.A))
	)
	(:STEPS
		(?X_C (?X_F ((ADV-A (FOR.P ?X_A)) SLEEP.V)))
		(?X_E (?X_F WAKE_UP.V))
		(?X_I (?X_F (FALL.V ?X_G)))
	)
)

; "The man woke up."
; "He realized he forgot something."
; "He left the room."
; "He returned with his wallet."
; "He put it on the table."
(EPI-SCHEMA ((?X_D (LEAVE.V ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_D THING.N))
		(!R2 (?X_L MAN.N))
		(!R3 (?X_M ROOM.N))
		(!R4 (?X_K WALLET.N))
		(!R5 (?X_K (PERTAIN-TO ?X_L)))
		(!R6 (?X_N TABLE.N))
		(!R7 (?X_M LOCATION.N))
		(!R8 (NOT (?X_M = ?L2)))
		(!R9 (?L2 DESTINATION.N))
		(!R10 (?X_N LOCATION.N))
	)
	(:STEPS
		(?X_F (?X_L WAKE_UP.V))
		(?X_C (?X_L (REALIZE.V (THT (?X_L (FORGET.V ?X_D))))))
		(?X_H (?X_L ((ADV-A (FROM.P ?X_M)) LEAVE.3.V) ?L2))
		(?X_A (?X_L ((ADV-A (FROM.P ?L1)) RETURN.8.V) ?L2))
		(?X_J (?X_L PUT.9.V ?X_K ?X_N))
	)
)

; "Jill went to work."
; "She worked for an airline company."
; "She met some friends there."
(EPI-SCHEMA ((?X_F ((ADV-A (FOR.P ?X_C)) WORK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C AIRLINE.N))
		(!R2 (?X_C COMPANY.N))
		(!R3 (?X_F AGENT.N))
		(!R4 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_F ((ADV-A (FROM.P ?L1)) GO.10.V) ?L2))
		(?X_B (?X_F ((ADV-A (FOR.P ?X_C)) WORK.V)))
	)
)

; "Bill's wallet was stolen."
; "He looked for it everywhere."
; "He couldn't find it."
(EPI-SCHEMA ((?X_B (FIND.V (KE (?X_B ((NOT ABLE.A) (KA DO.V)))))) ** ?E)
	(:ROLES
		(!R1 (?X_B AGENT.N))
	)
	(:STEPS
		(E313.SK (NOT (?X_B ((CAN.MD FIND.V) ?X_A))))
	)
)

; "The man woke up."
; "He remembered that he forgot something."
; "He left the room."
; "He returned with his wallet."
; "He put it on the table."
(EPI-SCHEMA ((?X_D (LEAVE.V ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_D THING.N))
		(!R2 (?X_L MAN.N))
		(!R3 (?X_M ROOM.N))
		(!R4 (?X_K WALLET.N))
		(!R5 (?X_K (PERTAIN-TO ?X_L)))
		(!R6 (?X_N TABLE.N))
		(!R7 (NOT (?X_M = ?L2)))
		(!R8 (?X_M LOCATION.N))
		(!R9 (?L2 DESTINATION.N))
		(!R10 (?X_N LOCATION.N))
	)
	(:STEPS
		(?X_F (?X_L WAKE_UP.V))
		(?X_C (?X_L (REMEMBER.V (THAT (?X_L (FORGET.V ?X_D))))))
		(?X_H (?X_L ((ADV-A (FROM.P ?X_M)) LEAVE.3.V) ?L2))
		(?X_A (?X_L ((ADV-A (FROM.P ?L1)) RETURN.8.V) ?L2))
		(?X_J (?X_L PUT.11.V ?X_K ?X_N))
	)
)

; "Tom's parents were going away for the weekend."
; "Tom and his friends decided to have a party."
; "They invited all their friends over."
; "Tom's friend brought a bunch of balloons."
; "Everyone had a great time."
(EPI-SCHEMA ((?X_G (HAVE.V ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_D GREAT.A))
		(!R2 (?X_D TIME.N))
		(!R3 (?X_G BUNCH.N))
		(!R4 (?X_G (OF.P ?X_H)))
		(!R5 (?X_I PARTY.N))
		(!R6 (?X_J (PLUR FRIEND.N)))
		(!R7 (?X_L (PERTAIN-TO ?X_L)))
		(!R8 (?X_L FRIEND.N))
		(!R9 (?X_J (PERTAIN-TO ?X_L)))
		(!R10 (?X_K (PLUR PARENT.N)))
		(!R11 (?X_K (PERTAIN-TO ?X_L)))
		(!R12 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_N (?X_K ((ADV-A (FROM.P ?L1)) GO.10.V) ?L2))
		(?X_A ((SET-OF ?X_L ?X_J) (HAVE.V ?X_I)))
		(?X_F (?X_L (BRING.V ?X_G)))
		(?X_C ((EVERY.D PERSON.N) (HAVE.V ?X_D)))
	)
)

; "Sarah was tired after working all day."
; "She decided to take a nap."
; "She lay down in bed."
; "She fell asleep."
(EPI-SCHEMA ((?X_G (TAKE.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A NAP.N))
		(!R2 (?X_D BED.N))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_H ASLEEP.A))
	)
	(:STEPS
		(?X_C (?X_G (TAKE.V ?X_A)))
		(?X_F (?X_G ((ADV-A (IN.P ?X_D)) LIE-FLAT_DOWN.V)))
		(?X_J (?X_G (FALL.V ?X_H)))
	)
)

; "Tom's father drove him to school."
; "He parked the car."
; "Tom walked to school."
; "His friend told him that there were lots of kids waiting for him at the door."
(EPI-SCHEMA ((?X_E (((ADV-A (FOR.P (KA SCHOOL.N))) DRIVE.V) ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR LOT.N)))
		(!R2 (?X_E FRIEND.N))
		(!R3 (?X_D DOOR.N))
		(!R4 (?X_E (PERTAIN-TO ?X_P)))
		(!R5 (?X_G (PLUR KID.N)))
		(!R6 (?X_F (OF.P ?X_G)))
		(!R7 (?X_L CAR.N))
		(!R8 (?X_O FATHER.N))
		(!R9 (?X_O (PERTAIN-TO ?X_P)))
		(!R10 (?X_Q SCHOOL.N))
		(!R11 (?X_P SMALLER-THAN.N ?X_O))
		(!R12 (?L LOCATION.N))
		(!R13 (?X_P AGENT.N))
		(!R14 (?X_Q DESTINATION.N))
	)
	(:STEPS
		(?X_I (?X_O DRIVE.12.V ?X_P ?X_Q))
		(?X_K (?X_O PARK.13.V ?X_L ?L))
		(?X_N (?X_P ((ADV-A (FROM.P ?L1)) WALK.14.V) ?X_Q))
		(?X_B (?X_G ((ADV-A (FOR.P ?X_P)) ((ADV-A (AT.P ?X_D)) WAIT.V))))
		(?X_C (?X_E (TELL.V ?X_P (THAT (?X_A (BE.V ?X_F))))))
	)
)

; "'I need my wallet,' Tom said."
; "'Where is it?' Tom asked."
; "'In your pocket,' Tom's mom answered."
; "'What should I do?' Tom asked."
; "'You can give it back to me later,' Tom's dad told him."
; "'No way!' Tom said."
; "'Why not?' Tom's dad asked."
; "'Because you always forget things,' Tom's mother explained."
; "'That's true,' Tom agreed."
; "'I'll bring it by tomorrow,' Tom promised."
; "'OK,' Tom's parents replied"
(EPI-SCHEMA ((?X_G (((ADV-A (FOR.P ?X_J)) ASK.V) ?X_G)) ** ?E)
	(:ROLES
		(!R1 (?X_G MOM.N))
		(!R2 (?X_G MOTHER.N))
		(!R3 (?X_H POCKET.N))
		(!R4 (?X_J (PERTAIN-TO ?X_J)))
		(!R5 (?X_J DAD.N))
		(!R6 (?X_F (PERTAIN-TO ?X_J)))
		(!R7 (?X_G (PERTAIN-TO ?X_J)))
		(!R8 (?X_H (PERTAIN-TO ?X_J)))
		(!R9 (?X_I (PERTAIN-TO ?X_J)))
	)
	(:STEPS
		(?X_C (?X_J ASK.V))
		(?X_A (?X_G ((ADV-A (IN.P ?X_H)) ANSWER.V)))
		(?X_E (?X_J ASK.V))
		(?X_L (?X_J ASK.V))
	)
)

; "A woman walked into a restaurant."
; "She ordered some food."
; "She paid for her order."
; "She sat down."
; "She saw a man sitting near her."
(EPI-SCHEMA ((?X_J SIT_DOWN.V) ** ?E)
	(:ROLES
		(!R1 (?X_C MAN.N))
		(!R2 (?X_I ORDER.N))
		(!R3 (?X_H FOOD.N))
		(!R4 (?X_J WOMAN.N))
		(!R5 (?X_I (PERTAIN-TO ?X_J)))
		(!R6 (?X_O RESTAURANT.N))
		(!R7 (?X_O DESTINATION.N))
	)
	(:STEPS
		(?X_L (?X_J ((ADV-A (FROM.P ?L1)) WALK.14.V) ?X_O))
		(?X_G (?X_J (ORDER.V ?X_H)))
		(?X_A (?X_J ((ADV-A (FOR.P ?X_I)) PAY.V)))
		(?X_E (?X_J (DOWN.ADV SIT.V)))
		(?X_B (?X_C ((ADV-A (NEAR.P ?X_J)) SIT.V)))
		(?X_N (?X_J SEE.15.V ?X_C))
	)
)



; "Mary woke up early."
; "She looked around."
; "She saw a spider."
; "She picked it up."
; "She threw it away."
(EPI-SCHEMA ((?X_M (PICK_UP.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_E FEMALE.A))
		(!R2 (?X_E AGENT.N))
		(!R3 (?X_H SPIDER.N))
		(!R4 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_B (?X_M (EARLY.ADV WAKE_UP.V)))
		(?X_J (?X_M (AROUND.ADV LOOK.V)))
		(?X_L (?X_M SEE.1.V ?X_H))
		(?X_G (?X_M (PICK_UP.V ?X_H)))
		(?X_D (?X_E ((AWAY.ADV THROW.V) ?X_A)))
	)
)

; "Bobby liked to play baseball."
; "He played on the team."
; "His team lost."
(EPI-SCHEMA ((?X_I (PLAY.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_G TEAM.N))
		(!R2 (?X_H BASEBALL.N))
		(!R3 (?X_G (PERTAIN-TO ?X_I)))
		(!R4 ((KA (PLAY.V ?X_H)) ACTION.N))
		(!R5 (?X AGENT.N))
		(!R6 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_B (?X_G LOSE.V))
		(?X_D (?X_I LIKE.2.V (KA (PLAY.V ?X_H))))
		(?E_1 (?X PLAY.3.V))
		(?X_F (?X_I PLAY.4.V))
	)
)

; "Joey is afraid of spiders."
; "He doesn't want any spiders near him."
; "He wants all the spiders to be far from him."
; "Joey has lots of spiders."
(EPI-SCHEMA ((?X_I (OF.P ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR SPIDER.N)))
		(!R2 (?X_I AFRAID.A))
		(!R3 (?X_G (PLUR SPIDER.N)))
		(!R4 (?X_H (PLUR LOT.N)))
		(!R5 (?X_H (OF.P ?X_G)))
		(!R6 (?X_H OBJECT.N))
		(!R7 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_A (?X_I (OF.P ?X_D)))
		(?X_C (NOT (?X_I (((ADV-A (NEAR.P ?X_I)) WANT.V) (ANY.D (PLUR SPIDER.N))))))
		(?X_F (?X_I HAVE.6.V ?X_H))
	)
)

; "Sue liked to play on the computer."
; "She played games."
; "She watched movies."
; "She read books."
; "She wrote letters."
(EPI-SCHEMA ((?X_J (COMPOSITE-SCHEMA.PR ?X_A ?X_D ?X_G ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_A (PLUR GAME.N)))
		(!R2 (?X_D (PLUR MOVIE.N)))
		(!R3 (?X_G (PLUR BOOK.N)))
		(!R4 (?X_J AGENT.N))
		(!R5 (?X_K (PLUR LETTER.N)))
	)
	(:STEPS
		(?X_C (?X_J (PLAY.V ?X_A)))
		(?X_F (?X_J (WATCH.V ?X_D)))
		(?X_I (?X_J (READ.V ?X_G)))
		(?X_M (?X_J (WRITE.V ?X_K)))
	)
)

; "Mary was scared of spiders."
; "She picked one up."
; "She put it down on the floor."
; "She saw another spider."
; "She threw that one away too."
(EPI-SCHEMA ((?X_N (PICK_UP.V ?X_P)) ** ?E)
	(:ROLES
		(!R1 (?X_E ONE.N))
		(!R2 (?X_J FLOOR.N))
		(!R3 (?X_K FEMALE.A))
		(!R4 (?X_K AGENT.N))
		(!R5 (?X_N AGENT.N))
		(!R6 (?X_P (PLUR SPIDER.N)))
		(!R7 (?X_O AGENT.N))
		(!R8 (NOT (?X_P ACTION.N)))
	)
	(:STEPS
		(?X_B (?X_O (OF.P ?X_P)))
		(?X_M (?X_O (PICK_UP.V ?X_N)))
		(?X_I (?X_K ((DOWN.ADV ((ADV-A (ON.P ?X_J)) PUT.V)) ?X_A)))
		(?X_G (?X_K (SEE.V (ANOTHER.D SPIDER.N))))
		(?X_D (?X_K ((TOO.ADV THROW_AWAY.V) ?X_E)))
		(?E_1 (?X_O SCARE.14.V ?X_P))
	)
)



; "Mary went to the market."
; "She bought some food for dinner."
; "She put the food in the fridge."
; "She forgot where she left the keys."
; "She searched everywhere."
(EPI-SCHEMA ((?X_L (((ADV-A (FOR.P ?X_G)) BUY.V) ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_F FOOD.N))
		(!R2 (?X_G DINNER.N))
		(!R3 (?X_J MARKET.N))
		(!R4 (?X_K FRIDGE.N))
		(!R5 (?X_J DESTINATION.N))
		(!R6 (?X_K LOCATION.N))
		(!R7 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_A (?X_L ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_J))
		(?X_E (?X_L (((ADV-A (FOR.P ?X_G)) BUY.V) ?X_F)))
		(?X_I (?X_L PUT.2.V ?X_G ?X_K))
		(?X_C (?X_L (EVERYWHERE.ADV SEARCH.V)))
	)
)

; "Bill went to the grocery store."
; "He bought food for dinner."
; "He paid for the groceries."
; "He took them home."
; "He cooked dinner."
(EPI-SCHEMA ((?X_N (BUY.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E (PLUR GROCERY.N)))
		(!R2 (?X_P FOOD.N))
		(!R3 (?X_H DINNER.N))
		(!R4 (?X_M BILL.N))
		(!R5 (?X_N GROCERY.N))
		(!R6 (?X_N STORE.N))
		(!R7 (?X_O HOME.N))
		(!R8 (?X_O (PERTAIN-TO ?X_Q)))
		(!R9 (?X_M AGENT.N))
		(!R10 (?X_N DESTINATION.N))
		(!R11 (?X_O DESTINATION.N))
		(!R12 (?X_P SMALLER-THAN.N ?X_Q))
		(!R13 (?X_Q AGENT.N))
	)
	(:STEPS
		(?X_J (?X_M ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_N))
		(?X_G (?X_Q (((ADV-A (FOR.P ?X_H)) BUY.V) ?X_P)))
		(?X_D (?X_Q ((ADV-A (FOR.P ?X_E)) PAY.V)))
		(?X_L (?X_Q TAKE.3.V ?X_P ?X_O))
		(?X_B (?X_Q (COOK.V ?X_H)))
	)
)

; "Mary went to the grocery store."
; "She bought some milk for dinner."
; "She put the milk in the refrigerator."
; "She saw the keys on the table."
; "She found them."
; "She locked the door."
(EPI-SCHEMA ((?X_S (BUY.V ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_C DOOR.N))
		(!R2 (?X_J MILK.N))
		(!R3 (?X_Q GROCERY.N))
		(!R4 (?X_Q STORE.N))
		(!R5 (?X_K DINNER.N))
		(!R6 (?X_J (FOR.P ?X_K)))
		(!R7 (?X_R REFRIGERATOR.N))
		(!R8 (?X_N (PLUR KEY.N)))
		(!R9 (?X_Q DESTINATION.N))
		(!R10 (?X_R LOCATION.N))
		(!R11 (?X_S AGENT.N))
	)
	(:STEPS
		(?X_G (?X_S ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_Q))
		(?X_E (?X_S (BUY.V ?X_J)))
		(?X_I (?X_S PUT.4.V ?X_J ?X_R))
		(?X_M (?X_S SEE.5.V ?X_N))
		(?X_P (?X_S FIND.6.V ?X_N))
		(?X_B (?X_S (LOCK.V ?X_C)))
	)
)

; "Karen went to the grocery store."
; "She bought lots of groceries."
; "She put them away."
; "She cooked dinner."
(EPI-SCHEMA ((?X_L (BUY.V ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_C DINNER.N))
		(!R2 (?X_I (PLUR GROCERY.N)))
		(!R3 (?X_H (PLUR LOT.N)))
		(!R4 (?X_H (OF.P ?X_I)))
		(!R5 (?X_M GROCERY.N))
		(!R6 (?X_M STORE.N))
		(!R7 (?X_L AGENT.N))
		(!R8 (?X_M DESTINATION.N))
	)
	(:STEPS
		(?X_K (?X_L ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_M))
		(?X_G (?X_L (BUY.V ?X_H)))
		(?X_E (?X_L ((AWAY.ADV PUT.V) ?X_I)))
		(?X_B (?X_L (COOK.V ?X_C)))
	)
)

; "Sally went shopping."
; "She saw lots of things."
; "She bought a few things."
; "She bought cheese."
; "She bought milk."
; "She bought bread."
(EPI-SCHEMA ((?X_S (BUY.V ?X_R)) ** ?E)
	(:ROLES
		(!R1 (?X_C BREAD.N))
		(!R2 (?X_F MILK.N))
		(!R3 (?X_I CHEESE.N))
		(!R4 (?X_L FEW.A))
		(!R5 (?X_L (PLUR THING.N)))
		(!R6 (?X_R (PLUR THING.N)))
		(!R7 (?X_Q (PLUR LOT.N)))
		(!R8 (?X_Q (OF.P ?X_R)))
		(!R9 (?L2 DESTINATION.N))
		(!R10 (?X_S AGENT.N))
	)
	(:STEPS
		(?X_N (?X_S ((ADV-A (FROM.P ?L1)) GO.7.V) ?L2))
		(?X_P (?X_S SEE.8.V ?X_Q))
		(?X_K (?X_S (BUY.V ?X_L)))
		(?X_H (?X_S (BUY.V ?X_I)))
		(?X_E (?X_S (BUY.V ?X_F)))
		(?X_B (?X_S (BUY.V ?X_C)))
	)
)

; "Bobby went to the grocery store."
; "He looked around."
; "He found the items on his list."
; "He paid for them."
; "He went home and cooked dinner."
(EPI-SCHEMA ((?X_N (COMPOSITE-SCHEMA.PR ?X_D ?X_M ?X_G ?X_O)) ** ?E)
	(:ROLES
		(!R1 (?X_D DINNER.N))
		(!R2 (?X_G (PLUR ITEM.N)))
		(!R3 (?X_M GROCERY.N))
		(!R4 (?X_M STORE.N))
		(!R5 (?X_L LIST.N))
		(!R6 (?X_L (PERTAIN-TO ?X_N)))
		(!R7 (?X_O HOME.N))
		(!R8 (?X_O (PERTAIN-TO ?X_N)))
		(!R9 (?X_M DESTINATION.N))
		(!R10 (?X_N AGENT.N))
		(!R11 (?X_O DESTINATION.N))
	)
	(:STEPS
		(?X_K (?X_N ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_M))
		(?X_I (?X_N (AROUND.ADV LOOK.V)))
		(?X_A (?X_N FIND.6.V ?X_G))
		(?X_F (?X_N ((ADV-A (FOR.P ?X_G)) PAY.V)))
		(?X_B (?X_N ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_O))
		(?X_C (?X_N ((PASV COOK.V) ?X_D)))
	)
)

; "Alexa went to the supermarket."
; "She looked around."
; "She found what she wanted."
; "She paid for the food."
; "She carried the groceries into the house."
(EPI-SCHEMA ((?X_P ((ADV-A (TO.P ?X_M)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D FOOD.N))
		(!R2 (?X_M SUPERMARKET.N))
		(!R3 (?X_O (PLUR GROCERY.N)))
		(!R4 (?X_N HOUSE.N))
		(!R5 (?X_M DESTINATION.N))
		(!R6 (?X_N DESTINATION.N))
		(!R7 (?X_P AGENT.N))
		(!R8 (?X_O SMALLER-THAN.N ?X_P))
	)
	(:STEPS
		(?X_H (?X_P ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_M))
		(?X_F (?X_P (AROUND.ADV LOOK.V)))
		(?X_J (?X_P FIND.9.V (ANS-TO (?X_P (WANT.V ?X_A)))))
		(?X_C (?X_P ((ADV-A (FOR.P ?X_D)) PAY.V)))
		(?X_L (?X_P CARRY.10.V ?X_O ?X_N))
	)
)

; "Sarah went to the grocery store."
; "She bought some groceries."
; "She cooked dinner."
; "She cleaned up after dinner."
(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA.PR ?X_H ?X_E ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_E DINNER.N))
		(!R2 (?X_H (PLUR GROCERY.N)))
		(!R3 (?X_K GROCERY.N))
		(!R4 (?X_K STORE.N))
		(!R5 (?X_K DESTINATION.N))
		(!R6 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_J (?X_L ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_K))
		(?X_G (?X_L (BUY.V ?X_H)))
		(?X_D (?X_L (COOK.V ?X_E)))
		(?X_B (?X_L ((ADV-A (AFTER.P ?X_E)) CLEAN_UP.V)))
	)
)

; "The boy was playing with his toys."
; "He found a ball."
; "He threw it against the wall."
; "The ball bounced back toward him."
; "He missed the ball."
(EPI-SCHEMA ((?X_H (BACK.ADV ((ADV-A (FROM.P ?X_F)) BOUNCE.V))) ** ?E)
	(:ROLES
		(!R1 (?X_M BALL.N))
		(!R2 (?X_F WALL.N))
		(!R3 (?X_H BOY.N))
		(!R4 (?X_G (PLUR TOY.N)))
		(!R5 (?X_G (PERTAIN-TO ?X_H)))
		(!R6 (?Y ENTITY.N))
		(!R7 (?L2 DESTINATION.N))
		(!R8 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_A (?X_H PLAY.12.V ?Y))
		(?X_J (?X_H FIND.6.V ?X_M))
		(?X_E (?X_H (((ADV-A (AGAINST.P ?X_F)) THROW.V) ?X_M)))
		(?X_L (?X_M ((ADV-A (FROM.P ?L1)) BOUNCE_BACK.13.V) ?L2))
		(?X_C (?X_H (MISS.V ?X_M)))
	)
)

; "Karen likes to play with dolls."
; "She plays with them all the time."
; "She has many dolls."
; "Dolls can have clothes."
(EPI-SCHEMA ((?X_I (LIKE.V (KA ((ADV-A (WITH.P ?X_H)) PLAY.V)))) ** ?E)
	(:ROLES
		(!R1 (?X_H (PLUR DOLL.N)))
		(!R2 (?X_E MANY.A))
		(!R3 (?X_E (PLUR DOLL.N)))
		(!R4 (?X_K (PLUR CLOTHE.N)))
		(!R5 (?X_J (PLUR DOLL.N)))
		(!R6 ((KA ((ADV-A (WITH.P ?X_H)) PLAY.V)) ACTION.N))
		(!R7 (?X_I AGENT.N))
		(!R8 (?X_J AGENT.N))
		(!R9 (?X_K OBJECT.N))
	)
	(:STEPS
		(?X_B (?X_I LIKE.14.V (KA ((ADV-A (WITH.P ?X_H)) PLAY.V))))
		(?X_D (?X_I HAVE.15.V ?X_E))
		(?X_G (?X_J HAVE.16.V ?X_K))
	)
)

; "Linda played with her dolls."
; "She put them away."
; "She read books."
; "She watched TV."
; "She wanted to play outside."
(EPI-SCHEMA ((?X_F ((ADV-A (WITH.P ?X_L)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F AGENT.N))
		(!R2 (?X_I (PLUR BOOK.N)))
		(!R3 (?X_L (PLUR DOLL.N)))
		(!R4 (?X_L (PERTAIN-TO ?X_M)))
		(!R5 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_A (?X_M PLAY.17.V ?X_L))
		(?X_K (?X_M ((AWAY.ADV PUT.V) ?X_L)))
		(?X_H (?X_M (READ.V ?X_I)))
		(?X_E (?X_M (WATCH.V ?X_F)))
		(?X_C (?X_M (WANT.V (KA (OUTSIDE.ADV PLAY.V)))))
		(?E_1 (?X_M PLAY.18.V))
	)
)

; "The girl played soccer."
; "She kicked the ball into the goal."
; "She scored a goal."
(EPI-SCHEMA ((?X_H (((ADV-A (INTO.P ?X_C)) KICK.V) ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C GOAL.N))
		(!R2 (?X_F BALL.N))
		(!R3 (?X_G GOAL.N))
		(!R4 (?X_H GIRL.N))
		(!R5 (?X_K SOCCER.N))
	)
	(:STEPS
		(?X_J (?X_H PLAY.19.V))
		(?X_E (?X_H (((ADV-A (INTO.P ?X_G)) KICK.V) ?X_F)))
		(?X_B (?X_H (SCORE.V ?X_C)))
	)
)

; "Johnny played with his toys."
; "He found a toy car."
; "He put it on the floor."
; "He ran after the car."
; "The car rolled away from him."
(EPI-SCHEMA ((?X_L (COMPOSITE-SCHEMA.PR ?X_H ?X_K ?L2 ?X_M)) ** ?E)
	(:ROLES
		(!R1 (?X_K FLOOR.N))
		(!R2 (?X_H (PLUR TOY.N)))
		(!R3 (?X_H (PERTAIN-TO ?X_L)))
		(!R4 (?X_M TOY.N))
		(!R5 (?X_M CAR.N))
		(!R6 (?X_K LOCATION.N))
		(!R7 (?X_L AGENT.N))
		(!R8 (?L2 DESTINATION.N))
		(!R9 (?X_M AGENT.N))
		(!R10 (?X_M DESTINATION.N))
		(!R11 (?X_L LOCATION.N))
		(!R12 (NOT (?X_L = ?X_M)))
	)
	(:STEPS
		(?X_A (?X_L PLAY.20.V ?X_H))
		(?X_C (?X_L FIND.6.V ?X_M))
		(?X_E (?X_L PUT.21.V ?X_M ?X_K))
		(?X_G (?X_L ((ADV-A (FROM.P ?L1)) RUN.22.V) ?L2))
		(?X_J (?X_M ((ADV-A (FROM.P ?X_L)) ROLL_AWAY.23.V) ?X_M))
	)
)

; "Kathy loves to play with dolls."
; "She plays with them all day."
; "She likes to dress them up."
; "She puts makeup on them."
(EPI-SCHEMA ((?X_L ((ADV-A (WITH.P ?X_M)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D MAKEUP.N))
		(!R2 (?X_E FEMALE.A))
		(!R3 (?X_E AGENT.N))
		(!R4 (?X_M (PLUR DOLL.N)))
		(!R5 ((KA ((ADV-A (WITH.P ?X_M)) PLAY.V)) ACTION.N))
		(!R6 (?X_L AGENT.N))
		(!R7 ((KA (DRESS_UP.V ?X_M)) ACTION.N))
	)
	(:STEPS
		(?X_G (?X_L LOVE.24.V (KA ((ADV-A (WITH.P ?X_M)) PLAY.V))))
		(?X_I (?X_L PLAY.25.V))
		(?X_K (?X_L LIKE.26.V (KA (DRESS_UP.V ?X_M))))
		(?X_C (?X_E (((ADV-A (ON.P ?X_A)) PUT.V) ?X_D)))
	)
)

; "Kate loves playing with dolls."
; "She plays with them all the time."
; "She likes to dress her dolls."
; "She plays with them for hours."
(EPI-SCHEMA ((?X_G ((ADV-A (WITH.P ?X_F)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_F (PLUR DOLL.N)))
		(!R2 (?X_F (PERTAIN-TO ?X_G)))
		(!R3 ((KA ((ADV-A (WITH.P ?X_F)) PLAY.V)) ACTION.N))
		(!R4 ((KA (DRESS.V ?X_F)) ACTION.N))
		(!R5 (?X_G AGENT.N))
	)
	(:STEPS
		(?X_C (?X_G LOVE.27.V (KA ((ADV-A (WITH.P ?X_F)) PLAY.V))))
		(?X_A (?X_G LIKE.28.V (KA (DRESS.V ?X_F))))
		(?X_E (?X_G PLAY.29.V))
	)
)

; "A girl named Sarah was playing outside."
; "She played with her dolls."
; "She looked for some new dolls."
; "She found them on the shelf."
; "Sarah liked her dolls."
(EPI-SCHEMA ((?X_L ((ADV-A (WITH.P ?X_M)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E SHELF.N))
		(!R2 (?X_H NEW.A))
		(!R3 (?X_H (PLUR DOLL.N)))
		(!R4 (?X_K GIRL.N))
		(!R5 (?X_K ((PASV NAME.V) ?X_L)))
		(!R6 (?X_M (PLUR DOLL.N)))
		(!R7 (?X_M (PERTAIN-TO ?X_L)))
		(!R8 (?X_L AGENT.N))
		(!R9 (NOT (?X_M ACTION.N)))
		(!R10 (NOT (?X_M AGENT.N)))
	)
	(:STEPS
		(?X_J (?X_K (OUTSIDE.ADV PLAY.V)))
		(?X_A (?X_L PLAY.30.V ?X_M))
		(?X_G (?X_L ((ADV-A (FOR.P ?X_H)) LOOK.V)))
		(?X_D (?X_L (((ADV-A (ON.P ?X_E)) FIND.V) ?X_H)))
		(?X_B (?X_L LIKE.31.V ?X_M))
	)
)

; "Tom played with his toys."
; "He looked for his ball."
; "He caught the ball."
; "He put the ball away."
(EPI-SCHEMA ((?X_I ((ADV-A (WITH.P ?X_H)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E BALL.N))
		(!R2 (?X_E (PERTAIN-TO ?X_I)))
		(!R3 (?X_H (PLUR TOY.N)))
		(!R4 (?X_H (PERTAIN-TO ?X_I)))
		(!R5 (?X_I AGENT.N))
		(!R6 (?L LOCATION.N))
	)
	(:STEPS
		(?X_A (?X_I PLAY.32.V ?X_H))
		(?X_B (?X_I ((ADV-A (FOR.P ?X_E)) LOOK.33.V)))
		(?X_D (?X_I (CATCH.V ?X_E)))
		(?X_G (?X_I PUT.34.V ?X_E ?L))
	)
)



; "'My brother is sick,' said Mary."
; "'I want to take him to the hospital.'"
; "'We can't afford an ambulance.'"
; "'Maybe we should call for one.'"
; "'What will happen if my brother dies?'"
; "'Who will pay for the ambulance?'"
; "'Will I have to pay for it myself?'"
(EPI-SCHEMA ((?X_A (((ADV-A (FOR.P ?X_I)) CALL.V) ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_A AGENT.N))
		(!R2 (?X_D AMBULANCE.N))
		(!R3 (?X_E AGENT.N))
		(!R4 (?X_I BROTHER.N))
		(!R5 (?X_H HOSPITAL.N))
		(!R6 (?X_I (PERTAIN-TO ?X_J)))
		(!R7 (?X_J AGENT.N))
		(!R8 (?X_H DESTINATION.N))
		(!R9 (?X_I SMALLER-THAN.N ?X_J))
	)
	(:STEPS
		(?X_G (?X_J (WANT.V (KA (((ADV-A (TO.P ?X_H)) TAKE.V) ?X_I)))))
		(?X_C (NOT (?X_E ((CAN.AUX AFFORD.V) ?X_D))))
		(E91.SK (?X_E (MAYBE.ADV (SHOULD.MD ((ADV-A (FOR.P ?X_A)) CALL.V)))))
		(?E_1 (?X_J TAKE.5.V ?X_I ?X_H))
	)
)



; "The boy went to school."
; "He sat in class."
; "He played with his toys."
; "At recess he played ball."
; "After school he walked home."
(EPI-SCHEMA ((?X_J ((ADV-A (WITH.P ?X_I)) PLAY.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E CLASS.N))
		(!R2 (?X_J BOY.N))
		(!R3 (?X_M SCHOOL.N))
		(!R4 (?X_H BALL.N))
		(!R5 (?X_I (PLUR TOY.N)))
		(!R6 (?X_I (PERTAIN-TO ?X_J)))
		(!R7 (?X_N HOME.N))
		(!R8 (?X_M DESTINATION.N))
		(!R9 (?X_N DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_J ((ADV-A (FROM.P ?L1)) GO.1.V) ?X_M))
		(?X_D (?X_J ((ADV-A (IN.P ?X_E)) SIT.V)))
		(?X_B (?X_J PLAY.2.V ?X_I))
		(?X_G (?X_J PLAY.3.V))
		(?X_L (?X_J ((ADV-A (FROM.P ?L1)) WALK.4.V) ?X_N))
	)
)

; "Alfred liked to tell stories."
; "He told many stories."
; "He always had stories to tell."
; "He told his friends about his stories."
(EPI-SCHEMA ((?X_L (TELL.V ?X_D)) ** ?E)
	(:ROLES
		(!R1 (?X_I (PLUR FRIEND.N)))
		(!R2 (?X_D MANY.A))
		(!R3 (?X_D (PLUR STORY.N)))
		(!R4 (?X_I (PERTAIN-TO ?X_L)))
		(!R5 (?X_J (PLUR STORY.N)))
		(!R6 (?X_K (PLUR STORY.N)))
		(!R7 (?X_K (PERTAIN-TO ?X_L)))
		(!R8 (?X_I (ABOUT.P ?X_K)))
		(!R9 ((KA (TELL.V ?X_J)) ACTION.N))
		(!R10 (?X_K OBJECT.N))
		(!R11 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_F (?X_L LIKE.5.V (KA (TELL.V ?X_J))))
		(?X_C (?X_L (TELL.V ?X_D)))
		(?X_H (?X_L HAVE.6.V ?X_K))
		(?X_A (?X_L (TELL.V ?X_I)))
	)
)

; "Diane was sitting on the couch."
; "She watched TV."
; "She read a book."
; "She listened to music."
; "She was tired."
(EPI-SCHEMA ((?X_J SIT_DOWN.V) ** ?E)
	(:ROLES
		(!R1 (?X_A COUCH.N))
		(!R2 (?X_D AGENT.N))
		(!R3 (?X_G BOOK.N))
		(!R4 (?X_J AGENT.N))
		(!R5 (?X_J TIRED.A))
		(!R6 (?X_K MUSIC.N))
	)
	(:STEPS
		(?X_C (?X_J ((ADV-A (ON.P ?X_A)) SIT.V)))
		(?X_F (?X_J (WATCH.V ?X_D)))
		(?X_I (?X_J (READ.V ?X_G)))
		(?X_M (?X_J ((ADV-A (TO.P ?X_K)) LISTEN.V)))
	)
)

; "Tommy liked to play baseball."
; "He played on the team."
; "When he came home from school, he watched TV."
(EPI-SCHEMA ((?X (PLAY.V ?X_E)) ** ?E)
	(:ROLES
		(!R1 (?X_E BASEBALL.N))
		(!R2 ((KA (PLAY.V ?X_E)) ACTION.N))
		(!R3 (?X AGENT.N))
		(!R4 (?X_F AGENT.N))
	)
	(:STEPS
		(?X_B (?X_F LIKE.7.V (KA (PLAY.V ?X_E))))
		(?E_1 (?X PLAY.8.V))
		(?X_D (?X_F PLAY.9.V))
	)
)



; "My dog ate my homework last night."
; "I am so mad!"
; "I want to kick him."
; "I don't think he will do it again."
(EPI-SCHEMA ((?X_F (EAT.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_D DOG.N))
		(!R2 (?X_E AGENT.N))
		(!R3 (?X_D (PERTAIN-TO ?X_E)))
		(!R4 (?X_F HOMEWORK.N))
		(!R5 (?X_F (PERTAIN-TO ?X_E)))
		(!R6 (?X_F FOOD.N))
	)
	(:STEPS
		(?X_A (?X_D EAT.1.V ?X_F))
		(?X_C (?X_E (WANT.V (KA (KICK.V ?X_D)))))
	)
)

; "Bobby went to school."
; "His teacher gave him some work."
; "He worked on it all afternoon."
; "He gave it back to the teacher."
(EPI-SCHEMA ((?X_K (GIVE.V ?X_K ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_F WORK.N))
		(!R2 (?X_G TEACHER.N))
		(!R3 (?X_G (PERTAIN-TO ?X_K)))
		(!R4 (?X_J SCHOOL.N))
		(!R5 (?X_J DESTINATION.N))
		(!R6 (?X_K AGENT.N))
	)
	(:STEPS
		(?X_I (?X_K ((ADV-A (FROM.P ?L1)) GO.2.V) ?X_J))
		(?X_A (?X_G (GIVE.V ?X_K ?X_F)))
		(?X_E
   ((ADV-E (DURING (ALL.D AFTERNOON.N))) (?X_K ((ADV-A (ON.P ?X_F)) WORK.V))))
		(?X_C (?X_K (((ADV-A (TO.P ?X_G)) (BACK.ADV GIVE.V)) ?X_F)))
	)
)

; "Billy's dog ran away."
; "He looked for Billy's dog for hours."
; "He found Billy's dog."
; "Billy's dog looked sad."
(EPI-SCHEMA ((?X_I (FIND.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_C SAD.A))
		(!R2 (?X_H DOG.N))
		(!R3 (?X_I AGENT.N))
		(!R4 (?X_H (PERTAIN-TO ?X_I)))
		(!R5 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_E (?X_H RUN_AWAY.V))
		(?X_G (?X_L ((ADV-A (FOR.P ?X_H)) LOOK.3.V)))
		(?X_K (?X_L FIND.4.V ?X_H))
		(?X_B (?X_H (LOOK.V ?X_C)))
	)
)

; "Sammy is going to school today."
; "His teacher has some fun homework for him."
; "She told Sammy what to do."
; "Sammy's parents have lots of work to do."
; "Sammy wants to help his family."
(EPI-SCHEMA ((?X_K (WANT.V (KA (HELP.V ?X_C)))) ** ?E)
	(:ROLES
		(!R1 (?X_C FAMILY.N))
		(!R2 (?X_K AGENT.N))
		(!R3 (?X_C (PERTAIN-TO ?X_K)))
		(!R4 (?X_F (PLUR LOT.N)))
		(!R5 (?X_F (OF.P ?X_G)))
		(!R6 (?X_H (PLUR PARENT.N)))
		(!R7 (?X_H (PERTAIN-TO ?X_K)))
		(!R8 (?X_I FUN.N))
		(!R9 (?X_L (FOR.P ?X_K)))
		(!R10 (?X_L ?X_I HOMEWORK.N))
		(!R11 (?X_J TEACHER.N))
		(!R12 (?X_J (PERTAIN-TO ?X_K)))
		(!R13 (?X_L OBJECT.N))
	)
	(:STEPS
		(?X_A (?X_J HAVE.5.V ?X_L))
		(?X_E (?X_H (HAVE.V ?X_F)))
		(?X_B (?X_K (WANT.V (KA (HELP.V ?X_C)))))
	)
)

; "Karen's cat ate her homework."
; "She was upset because of that."
; "She couldn't concentrate on her work."
; "She went to bed early."
(EPI-SCHEMA ((?X_G (ABOUT.P ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_H WORK.N))
		(!R2 (?X_E (BECAUSE.P (K OF.P) ?X_F)))
		(!R3 (?X_G UPSET.A))
		(!R4 (?X_H (PERTAIN-TO ?X_M)))
		(!R5 (?X_I CAT.N))
		(!R6 (?X_I (PERTAIN-TO ?X_M)))
		(!R7 (?X_L HOMEWORK.N))
		(!R8 (?X_L (PERTAIN-TO ?X_M)))
		(!R9 (?X_N BED.N))
		(!R10 (?X_L FOOD.N))
		(!R11 (?X_M AGENT.N))
		(!R12 (?X_N DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_I EAT.1.V ?X_L))
		(?X_D (?X_M (BE.V ?X_G ?X_E)))
		(?X_B (NOT (?X_M (CAN.MD ((ADV-A (ON.P ?X_H)) CONCENTRATE.V)))))
		(?X_K (?X_M ((ADV-A (FROM.P ?L1)) GO.2.V) ?X_N))
	)
)

; "Bobby is reading a book."
; "He read chapter 1."
; "Chapter 2 is next."
; "He turned the page."
; "He found a word he didn't know."
; "He looked it up."
; "He looked up the definition."
; "He looked up the sentence structure."
; "He looked up the meaning."
; "He looked up the pronunciation."
; "He wrote down the new words."
(EPI-SCHEMA ((?X_X (READ.V ?X_A)) ** ?E)
	(:ROLES
		(!R1 (?X_A BOOK.N))
		(!R2 (?X_D CHAPTER.N))
		(!R3 (?X_D |1.N|))
		(!R4 (?X_G PAGE.N))
		(!R5 (?X_L WORD.N))
		(!R6 (?X_O DEFINITION.N))
		(!R7 (?X_R SENTENCE.N))
		(!R8 (?X_R STRUCTURE.N))
		(!R9 (?X_U MEANING.N))
		(!R10 (?X_X AGENT.N))
		(!R11 (?X_Y NEW.A))
		(!R12 (?X_Y (PLUR WORD.N)))
	)
	(:STEPS
		(?X_C (?X_X (READ.V ?X_A)))
		(?X_F (?X_X (READ.V ?X_D)))
		(?X_I (?X_X (TURN.V ?X_G)))
		(?X_K (?X_X (FIND.V (THT (?X_X (NOT (KNOW.V ?X_L)))))))
		(?X_N (?X_X ((UP.ADV LOOK.V) ?X_L)))
		(?X_Q (?X_X (LOOK_UP.V ?X_O)))
		(?X_T (?X_X (LOOK_UP.V ?X_R)))
		(?X_W (?X_X (LOOK_UP.V ?X_U)))
		(?X_ZA (?X_X (WRITE_DOWN.V ?X_Y)))
	)
)

; "Henry's mom brought Henry to school."
; "Henry's teacher gave him some homework."
; "Henry worked hard on his homework."
; "Henry was happy that he did his homework well."
(EPI-SCHEMA ((?X_J (((ADV-A (TO.P ?X_J)) BRING.V) ?X_I)) ** ?E)
	(:ROLES
		(!R1 (?X_D HOMEWORK.N))
		(!R2 (?X_H (HAPPY.A (THAT (?X_H (DO.V ?X_D))))))
		(!R3 (?X_H AGENT.N))
		(!R4 (?X_D (PERTAIN-TO ?X_H)))
		(!R5 (?X_E TEACHER.N))
		(!R6 (?X_E (PERTAIN-TO ?X_H)))
		(!R7 (?X_I MOM.N))
		(!R8 (?X_I (PERTAIN-TO ?X_H)))
		(!R9 (?X_J SCHOOL.N))
		(!R10 (?X_I AGENT.N))
		(!R11 (?X_H SMALLER-THAN.N ?X_I))
		(!R12 (?X_J DESTINATION.N))
	)
	(:STEPS
		(?X_G (?X_I BRING.6.V ?X_H ?X_J))
		(?X_C (?X_E (GIVE.V ?X_H ?X_D)))
		(?X_A (?X_H (HARD.ADV ((ADV-A (ON.P ?X_D)) WORK.V))))
	)
)

; "Aisha was tired."
; "She slept for awhile."
; "She woke up."
; "She felt better."
(EPI-SCHEMA ((?X_C ((ADV-A (FOR.P (KA (FEEL.V BETTER.A)))) WAKE_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C TIRED.A))
		(!R2 (?X_C AGENT.N))
		(!R3 (?X_D BETTER.A))
	)
	(:STEPS
		(?X_B (?X_C WAKE_UP.V))
		(?X_F (?X_C (FEEL.V ?X_D)))
	)
)

; "Sue was tired."
; "She fell asleep on the couch."
; "She woke up and looked around."
; "Sue felt better after waking up."
(EPI-SCHEMA ((?X_G (FALL.V (K ASLEEP.A))) ** ?E)
	(:ROLES
		(!R1 (?X_G TIRED.A))
		(!R2 (?X_J ASLEEP.A))
		(!R3 (?X_J (ON.P ?X_K)))
	)
	(:STEPS
		(?X_I (?X_A (KA SUE.V) (BE.V ?X_G)))
		(?X_M ((KA SUE.V) (FALL.V ?X_J)))
		(?X_D ((KA SUE.V) WAKE_UP.V))
		(?X_F ((KA SUE.V) LOOK_AROUND.V))
		(?X_E (?X_C (FEEL.V (K ((ADV-A (AFTER.P (KA WAKE_UP.V))) BETTER.A)))))
		(?X_O (?X_B (SUE.V ?X_C)))
	)
)

; "Karen works as a nurse."
; "She has many patients."
; "She is tired after work."
; "She goes home and takes a nap."
(EPI-SCHEMA ((?X_L ((ADV-A (AS.P ?X_H)) WORK.V)) ** ?E)
	(:ROLES
		(!R1 (?X_D NAP.N))
		(!R2 (?X_E WORK.N))
		(!R3 (?X_H NURSE.N))
		(!R4 (?X_K MANY.A))
		(!R5 (?X_K (PLUR PATIENT.N)))
		(!R6 (?X_M HOME.N))
		(!R7 (?X_M (PERTAIN-TO ?X_L)))
		(!R8 (?X_K OBJECT.N))
		(!R9 (?X_L AGENT.N))
		(!R10 (?X_M DESTINATION.N))
	)
	(:STEPS
		(?X_G (?X_L ((ADV-A (AS.P ?X_H)) WORK.V)))
		(?X_J (?X_L HAVE.9.V ?X_K))
		(?X_A (?X_L (AFTER.P ?X_E)))
		(?X_B (?X_L ((ADV-A (FROM.P ?L1)) GO.2.V) ?X_M))
		(?X_C (?X_L (TAKE.V ?X_D)))
	)
)

; "John is tired from work."
; "He wants to take a nap."
; "He goes to bed."
; "He falls asleep."
; "He wakes up later."
(EPI-SCHEMA ((?X_L (ASLEEP.ADV ((ADV-A (IN.P ?X_F)) FALL.V))) ** ?E)
	(:ROLES
		(!R1 (?X_B WORK.N))
		(!R2 (?X_C NAP.N))
		(!R3 (?X_F BED.N))
		(!R4 (?X_I ASLEEP.A))
		(!R5 (?X_L TIRED.A))
		(!R6 (?X_L AGENT.N))
	)
	(:STEPS
		(?X_A (?X_L (FROM.P ?X_B)))
		(?X_E (?X_L (WANT.V (KA (TAKE.V ?X_C)))))
		(?X_H (?X_L ((ADV-A (TO.P ?X_F)) GO.V)))
		(?X_K (?X_L (FALL.V ?X_I)))
		(?X_N (?X_L (LATER.ADV WAKE_UP.V)))
	)
)

; "Bobby woke up early."
; "He couldn't sleep."
; "He got tired."
; "He fell asleep."
(EPI-SCHEMA ((?X_F (EARLY.ADV WAKE_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C TIRED.A))
		(!R2 (?X_F AGENT.N))
		(!R3 (?X_G ASLEEP.A))
	)
	(:STEPS
		(?X_B (?X_F (EARLY.ADV WAKE_UP.V)))
		(E427.SK (NOT (?X_F (CAN.MD SLEEP.V))))
		(?X_E (?X_F (GET.V ?X_C)))
		(?X_I (?X_F (FALL.V ?X_G)))
	)
)

; "John was tired."
; "He couldn't stay awake."
; "He fell asleep."
(EPI-SCHEMA ((?X_A (FALL.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_A TIRED.A))
		(!R2 (?X_A AGENT.N))
		(!R3 (?X_B ASLEEP.A))
	)
	(:STEPS
		(E447.SK (NOT (?X_A (CAN.MD (AWAKE.ADV STAY.V)))))
		(?X_D (?X_A (FALL.V ?X_B)))
	)
)

; "Tom fell asleep on the couch."
; "He woke up late."
; "He couldn't find his watch."
; "He looked for his watch under his pillow."
; "He found his watch under his pillow."
(EPI-SCHEMA ((?X_M ((ADV (UP.ADV LATE.A)) WAKE.V)) ** ?E)
	(:ROLES
		(!R1 (?X_J WATCH.N))
		(!R2 (?X_H ASLEEP.A))
		(!R3 (?X_H (ON.P ?X_I)))
		(!R4 (?X_J (PERTAIN-TO ?X_M)))
		(!R5 (?X_K PILLOW.N))
		(!R6 (?X_K (PERTAIN-TO ?X_M)))
		(!R7 (?X_L WATCH.N))
		(!R8 (?X_L (PERTAIN-TO ?X_M)))
		(!R9 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_G (?X_M (FALL.V ?X_H)))
		(?X_E (?X_M (LATE.ADV WAKE_UP.V)))
		(?X_A (NOT (?X_M ((CAN.MD FIND.V) ?X_J))))
		(?X_B (?X_M ((ADV-A (FOR.P ?X_L)) LOOK.3.V)))
		(?X_C (?X_M FIND.4.V ?X_J))
	)
)



; "A little girl named Janey has a pet frog."
; "One day she decided to take it out into the garden."
; "She carried it outside."
; "She walked along carrying it."
; "Suddenly the frog jumped out of her hands."
(EPI-SCHEMA ((?X_J (TAKE.V ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_I ((PASV NAME.V) ?X_J)))
		(!R2 (?X_H LITTLE.A))
		(!R3 (?X_I ?X_H GIRL.N))
		(!R4 (?X_L (PLUR HAND.N)))
		(!R5 (?X_L (PERTAIN-TO ?X_J)))
		(!R6 (?X_K PET.A))
		(!R7 (?X_K FROG.N))
		(!R8 (?X_I AGENT.N))
		(!R9 ((THE.D GARDEN.N) DESTINATION.N))
		(!R10 (?X_K SMALLER-THAN.N ?X_J))
		(!R11 (?X_J AGENT.N))
		(!R12 (?X_K SMALLER-THAN.N ?X))
		(!R13 (?X AGENT.N))
		(!R14 (?X_L LOCATION.N))
		(!R15 (NOT (?X_L = ?L2)))
		(!R16 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_A (?X_I HAVE.1.V ?X_K))
		(?X_B (?X_J TAKE.2.V ?X_K (THE.D GARDEN.N)))
		(?X_E (?X_J CARRY.3.V ?X_K ?L2))
		(?X_G (?X_J ((ADV-A (FROM.P ?L1)) WALK.4.V) ?L2))
		(?E_1 (?X CARRY.5.V ?X_K ?L2))
		(?X_C (?X_K ((ADV-A (FROM.P ?X_L)) JUMP.6.V) ?L2))
	)
)





; "I'm going camping this weekend."
; "I want to bring some food."
; "I need to buy some cans."
; "I can't find any cans."
; "I looked everywhere."
; "I even checked under the bed."
(EPI-SCHEMA ((?X_K
              (COMPOSITE-SCHEMA.PR (KA (BRING.V ?X_J)) ?L ?X_J ?L2
               (ANY.D (PLUR CAN.N))))
             ** ?E)
	(:ROLES
		(!R1 (?X_E BED.N))
		(!R2 (?X_J FOOD.N))
		(!R3 (?L LOCATION.N))
		(!R4 (?X_J SMALLER-THAN.N ?X_K))
		(!R5 (?L2 DESTINATION.N))
		(!R6 ((ANY.D (PLUR CAN.N)) ENTITY.N))
		(!R7 (?X_K AGENT.N))
	)
	(:STEPS
		(?E_1 (?X_K CAMP.1.V ?L))
		(?X_A (?X_K ((ADV-A (FROM.P ?L1)) GO.2.V) ?L2))
		(?X_G (?X_K (WANT.V (KA (BRING.V ?X_J)))))
		(?E_2 (?X_K BRING.3.V ?X_J ?L2))
		(?X_I (?X_K FIND.4.V (ANY.D (PLUR CAN.N))))
		(?X_B (?X_K (EVERYWHERE.ADV LOOK.V)))
		(?X_D (?X_K (EVEN.ADV ((ADV-A (UNDER.P ?X_E)) CHECK.V))))
	)
)

; "Pam and Jim were camping."
; "Jim brought lots of food."
; "Pam's parents told her that there wasn't enough food for everyone."
; "Pam cooked something special."
(EPI-SCHEMA ((?X_M (((ADV-A (FOR.P (EVERY.D PERSON.N))) BRING.V) ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_D THING.N))
		(!R2 (?X_D SPECIAL.A))
		(!R3 (?X_M AGENT.N))
		(!R4 (?X_G (PLUR PARENT.N)))
		(!R5 (?X_G (PERTAIN-TO ?X_M)))
		(!R6 (?X_J FOOD.N))
		(!R7 (?X_N (PLUR LOT.N)))
		(!R8 (?X_N (OF.P ?X_J)))
		(!R9 ((SET-OF ?X_M ?X_O) AGENT.N))
		(!R10 (?L LOCATION.N))
		(!R11 (?X_O AGENT.N))
		(!R12 (?X_N SMALLER-THAN.N ?X_O))
		(!R13 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_I ((SET-OF ?X_M ?X_O) CAMP.5.V ?L))
		(?X_L (?X_O BRING.6.V ?X_N ?L2))
		(?X_F
   (?X_G
    (TELL.V ?X_M
     (THAT
      (?X_A (NOT (ENOUGH.ADV ((ADV-A (FOR.P (EVERY.D PERSON.N))) FOOD.N))))))))
		(?X_C (?X_M (COOK.V ?X_D)))
	)
)

; "Mary loves camping."
; "She takes lots of things with her on camping trips."
; "She has an air mattress."
; "She likes sleeping under the stars."
(EPI-SCHEMA ((?X_K
              (COMPOSITE-SCHEMA.PR (KA CAMP.V) ?L ?X_I ?L2 ?X_J
               (KA ((ADV-A (UNDER.P ?X_L)) SLEEP.V))))
             ** ?E)
	(:ROLES
		(!R1 (?X_I (PLUR LOT.N)))
		(!R2 (?X_J AGENT.N))
		(!R3 (?X_J AIR.N))
		(!R4 (?X_L (PLUR STAR.N)))
		(!R5 ((KA CAMP.V) ACTION.N))
		(!R6 (?L LOCATION.N))
		(!R7 (?X_I SMALLER-THAN.N ?X_K))
		(!R8 (?L2 DESTINATION.N))
		(!R9 (?X_J OBJECT.N))
		(!R10 (?X_K AGENT.N))
		(!R11 ((KA ((ADV-A (UNDER.P ?X_L)) SLEEP.V)) ACTION.N))
	)
	(:STEPS
		(?X_B (?X_K LOVE.7.V (KA CAMP.V)))
		(?E_1 (?X_K CAMP.1.V ?L))
		(?X_D (?X_K TAKE.8.V ?X_I ?L2))
		(?X_F (?X_K HAVE.9.V ?X_J))
		(?X_H (?X_K LIKE.10.V (KA ((ADV-A (UNDER.P ?X_L)) SLEEP.V))))
	)
)

; "Billy went camping last summer."
; "He slept on a cot."
; "He cooked over an open fire."
; "He enjoyed himself."
(EPI-SCHEMA ((?X_I ((ADV-A (IN.P ?X_E)) SLEEP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E OPEN.A))
		(!R2 (?X_E FIRE.N))
		(!R3 (?X_H COT.N))
		(!R4 (?L LOCATION.N))
		(!R5 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_G (?X_I ((ADV-A (ON.P ?X_H)) SLEEP.V)))
		(?X_D (?X_I ((ADV-A (OVER.P ?X_E)) COOK.V)))
		(?X_B (?X_I (ENJOY.V ?X_I)))
		(?E_1 (?X_I CAMP.1.V ?L))
	)
)

; "Sarah's parents were going camping for two weeks."
; "Sarah wanted to go too."
; "She was excited."
; "Sarah packed everything she would need."
(EPI-SCHEMA ((?X_M ((ADV-A (TO.P ?L2)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_N EXCITED.A))
		(!R2 (?X_N AGENT.N))
		(!R3 (?X_M (PLUR PARENT.N)))
		(!R4 (?X_M (PERTAIN-TO ?X_N)))
		(!R5 (?L2 DESTINATION.N))
		(!R6 (?L LOCATION.N))
	)
	(:STEPS
		(?X_J (?X_M ((ADV-A (FROM.P ?L1)) GO.2.V) ?L2))
		(?X_H (?X_N (WANT.V (KA (TOO.ADV GO.V)))))
		(?E_1 (?X_M CAMP.1.V ?L))
		(?E_2
   ((EVERY.D
     (L X
      (AND (X THING.N)
           (X
            (?X_N
             ((?X_A WOULD.AUX)
              (?X_C ?X_F (AND (?X_F (AT-ABOUT ?X_D)) (?X_E (ORIENTS ?X_F)))
               (NEED.AUX ** ?X_F))))))))
    ((ADV-A (FROM.P ?L1)) GO.11.V) ?L2))
		(?X_L
   (?X_N PACK.12.V
    (EVERY.D
     (L X
      (AND (X THING.N)
           (X
            (?X_N
             (WILL.MD
              (?X_C ?X_F (AND (?X_F (AT-ABOUT ?X_D)) (?X_E (ORIENTS ?X_F)))
               (NEED.AUX ** ?X_F))))))))
    ?L))
	)
)

; "Timmy wanted to go camping."
; "He packed all his things."
; "He put them into a bag."
; "He put the bag on his shoulder."
; "He walked outside and started walking."
(EPI-SCHEMA ((?X_K ((ADV-A (TO.P ?X_J)) GO.V)) ** ?E)
	(:ROLES
		(!R1 (?X_I BAG.N))
		(!R2 (?X_J SHOULDER.N))
		(!R3 (?X_J (PERTAIN-TO ?X_K)))
		(!R4 (?L LOCATION.N))
		(!R5 (?X_H ENTITY.N))
		(!R6 (?X_I LOCATION.N))
		(!R7 (?X_J LOCATION.N))
		(!R8 (?X_K AGENT.N))
		(!R9 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_E (?X_K (WANT.V (KA (GO.V (KA CAMP.V))))))
		(?E_1 (?X_K CAMP.1.V ?L))
		(?E_2 (?X_K ((ADV-A (FROM.P ?L1)) GO.13.V) ?L2))
		(?X_G (?X_K PUT.14.V ?X_H ?X_I))
		(?X_A (?X_K PUT.15.V ?X_I ?X_J))
		(?X_B (?X_K (OUTSIDE.ADV WALK.V)))
		(?X_C (?X_K WALK.V))
		(?E_3 (?X_K ((ADV-A (FROM.P ?L1)) WALK.16.V) ?L2))
	)
)

; "There are many kinds of campsites."
; "You might have a tent."
; "A camper has a roof over your head."
; "You might sleep in a cabin."
(EPI-SCHEMA ((?X_H (HAVE.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_D (OF.P ?X_C)))
		(!R2 (?X_D ?X_E (PLUR KIND.N)))
		(!R3 (?X_H CAMPER.N))
	)
	(:STEPS
		(?X_G (?X_A (BE.V ?X_D)))
		(?X_J (?X_H (HAVE.V ?X_B)))
	)
)

; "Karen loves camping."
; "She has lots of friends who camp."
; "She likes to be outside."
; "She wants to make sure she has enough food for the trip."
; "She makes lists of what she needs to pack."
(EPI-SCHEMA ((?X_D (WANT.V (KA (MAKE.V (SURE.A (THT (?X_D (HAVE.V ?X_P))))))))
             ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR LIST.N)))
		(!R2 (?X_D FEMALE.A))
		(!R3 (?X_D AGENT.N))
		(!R4 (?X_P FOOD.N))
		(!R5 (?X_P ENOUGH.A))
		(!R6 (?X_K (PLUR FRIEND.N)))
		(!R7 (?X_N (PLUR LOT.N)))
		(!R8 (?X_N (OF.P ?X_K)))
		(!R9 ((KA CAMP.V) ACTION.N))
		(!R10 (?L LOCATION.N))
		(!R11 (?X_N OBJECT.N))
		(!R12 (?X_O AGENT.N))
		(!R13 ((KA (OUTSIDE.ADV BE.V)) ACTION.N))
		(!R14 (?X_P OBJECT.N))
		(!R15 (?X AGENT.N))
	)
	(:STEPS
		(?X_H (?X_O LOVE.17.V (KA CAMP.V)))
		(?E_1 (?X_O CAMP.1.V ?L))
		(?X_J (?X_O HAVE.18.V ?X_N))
		(?X_M (?X_O LIKE.19.V (KA (OUTSIDE.ADV BE.V))))
		(?X_F (?X_O (WANT.V (KA (MAKE.V (SURE.A (THT (?X_O (HAVE.V ?X_P)))))))))
		(?X_B (?X_D (MAKE.V ?X_C)))
		(?E_2 (?X POSSESS.20.V ?X_P))
	)
)

; "Bill went camping."
; "He slept on a cot in a tent."
; "The wind blew through the tent."
(EPI-SCHEMA ((?X_I (COMPOSITE-SCHEMA.PR ?L ?X_K)) ** ?E)
	(:ROLES
		(!R1 (?X_F COT.N))
		(!R2 (?X_C MALE.A))
		(!R3 (?X_C AGENT.N))
		(!R4 (?X_I BILL.N))
		(!R5 (?X_J WIND.N))
		(!R6 (?X_K TENT.N))
		(!R7 (?X_F (IN.P ?X_K)))
		(!R8 (?X_I AGENT.N))
		(!R9 (?L LOCATION.N))
		(!R10 (?X_J AGENT.N))
		(!R11 (?X_K DESTINATION.N))
		(!R12 (NOT (?X_K = ?X_K)))
	)
	(:STEPS
		(?X_E (?X_I ((ADV-A (FOR.P (KA CAMP.V))) GO.V)))
		(?X_B (?X_C ((ADV-A (ON.P ?X_F)) SLEEP.V)))
		(?E_1 (?X_I CAMP.1.V ?L))
		(?X_H (?X_J ((ADV-A (FROM.P ?X_K)) BLOW.21.V) ?X_K))
	)
)

; "I bought a new car."
; "It was red."
; "There was a dent in the side."
; "I fixed it myself."
(EPI-SCHEMA ((?X_I (BUY.V ?X_B)) ** ?E)
	(:ROLES
		(!R1 (?X_B NEW.A))
		(!R2 (?X_B CAR.N))
		(!R3 (?X_B RED.A))
		(!R4 (?X_G DENT.N))
		(!R5 (?X_H SIDE.N))
		(!R6 (?X_G (IN.P ?X_H)))
		(!R7 (?X_I AGENT.N))
	)
	(:STEPS
		(?X_D (?X_I (BUY.V ?X_B)))
		(?X_F (?X_A (BE.V ?X_G)))
		(?X_K (?X_I (FIX.V ?X_H ?X_I)))
	)
)

; "A car is a vehicle that can go on roads."
; "Cars have seats for passengers."
; "Many people own cars."
; "People use them to go places."
(EPI-SCHEMA ((?X_H ((ADV-A (FROM.P ?L2)) (SOMEWHERE.ADV GO.V))) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR SEAT.N)))
		(!R2 (?X_C (FOR.P ?X_D)))
		(!R3 (?X_I (PLUR CAR.N)))
		(!R4 (?X_G (PLUR CAR.N)))
		(!R5 (?X_H MANY.A))
		(!R6 (?X_H (PLUR PERSON.N)))
		(!R7 (?X_I AGENT.N))
		(!R8 (?L2 DESTINATION.N))
	)
	(:STEPS
		(?X_B (?X_I (HAVE.V ?X_C)))
		(?X_F (?X_H OWN.23.V ?X_G))
		(?E_1 (?X_I ((ADV-A (FROM.P ?L1)) GO.13.V) ?L2))
	)
)



; "Diane liked gardening."
; "She planted seeds in the garden."
; "She put a fence around the garden."
; "She kept the weeds away from the garden."
(EPI-SCHEMA ((?X_M (((ADV-A (AROUND.P ?X_G)) PUT_UP.V) ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR WEED.N)))
		(!R2 (?X_F (PLUR SEED.N)))
		(!R3 (?X_G GARDEN.N))
		(!R4 (?X_M GARDENING.N))
		(!R5 (?X_L FENCE.N))
		(!R6 (?X_M OBJECT.N))
		(!R7 (NOT (?X_M ACTION.N)))
		(!R8 (NOT (?X_M AGENT.N)))
		(!R9 (?X_N AGENT.N))
	)
	(:STEPS
		(?X_I (?X_N LIKE.1.V ?X_M))
		(?X_E (?X_N (((ADV-A (IN.P ?X_G)) PLANT.V) ?X_F)))
		(?X_K (?X_N PUT.2.V ?X_L ?X_G))
		(?X_B (?X_N (((ADV-A (FROM.P ?X_G)) (AWAY.ADV KEEP.V)) ?X_C)))
	)
)

; "A farmer planted some corn."
; "He grew the corn."
; "He picked the corn."
; "He put the corn in a bin."
; "He waited for the corn to dry."
(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA.PR ?X_I ?X_J ?X_N)) ** ?E)
	(:ROLES
		(!R1 (?X_J CORN.N))
		(!R2 (?X_I (FOR.P ?X_J (KA DRY.V))))
		(!R3 (?X_K FARMER.N))
		(!R4 (?X_N BIN.N))
		(!R5 (?X_N LOCATION.N))
	)
	(:STEPS
		(?X_H (?X_K (PLANT.V ?X_J)))
		(?X_F (?X_K (GROW.V ?X_J)))
		(?X_D (?X_K (PICK.V ?X_J)))
		(?X_M (?X_K PUT.3.V ?X_J ?X_N))
		(?X_B (?X_K (WAIT.V ?X_I)))
	)
)

; "Jill was at work."
; "She worked for a company that makes cars."
; "She sold cars."
; "She put on her uniform."
(EPI-SCHEMA ((?X_L (SELL.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_B WORK.N))
		(!R2 (?X_E COMPANY.N))
		(!R3 (?X_H (PLUR CAR.N)))
		(!R4 (?X_L AGENT.N))
		(!R5 (?X_K UNIFORM.N))
		(!R6 (?X_K (PERTAIN-TO ?X_L)))
	)
	(:STEPS
		(?X_D (?X_L ((ADV-A (AT.P ?X_B)) BE.V)))
		(?X_G (?X_L ((ADV-A (FOR.P ?X_E)) WORK.V)))
		(?X_J (?X_L (SELL.V ?X_H)))
		(?X_A (?X_L (PUT_ON.V ?X_K)))
	)
)

; "The farmer planted corn."
; "A bug bit his ear."
; "He put an insecticide on his corn."
; "The bugs died."
(EPI-SCHEMA ((?X_H (COMPOSITE-SCHEMA.PR ?X_I ?X_J)) ** ?E)
	(:ROLES
		(!R1 (?X_D (PLUR BUG.N)))
		(!R2 (?X_J CORN.N))
		(!R3 (?X_H FARMER.N))
		(!R4 (?X_J (PERTAIN-TO ?X_H)))
		(!R5 (?X_G EAR.N))
		(!R6 (?X_G (PERTAIN-TO ?X_H)))
		(!R7 (?X_I INSECTICIDE.N))
		(!R8 (?X_J LOCATION.N))
	)
	(:STEPS
		(?X_F (?X_H (PLANT.V ?X_J)))
		(?X_A (?X_H PUT.4.V ?X_I ?X_J))
		(?X_C (?X_D DIE.V))
	)
)

; "Tom liked going to school."
; "He learned how to read."
; "He enjoyed learning new things."
; "He liked learning from his teacher."
(EPI-SCHEMA ((?X_H (LIKE.V (KA ((ADV-A (TO.P ?X_G)) GO.V)))) ** ?E)
	(:ROLES
		(!R1 (?X_G SCHOOL.N))
		(!R2 (?X_I TEACHER.N))
		(!R3 (?X_I (PERTAIN-TO ?X_H)))
		(!R4 ((KA ((ADV-A (TO.P ?X_G)) GO.V)) ACTION.N))
		(!R5 (?X_G DESTINATION.N))
		(!R6 (?X_H AGENT.N))
		(!R7 ((KA ((ADV-A (FROM.P ?X_I)) LEARN.V)) ACTION.N))
	)
	(:STEPS
		(?X_D (?X_H LIKE.6.V (KA ((ADV-A (TO.P ?X_G)) GO.V))))
		(?E_1 (?X_H ((ADV-A (FROM.P ?L1)) GO.7.V) ?X_G))
		(?X_F (?X_H ENJOY.8.V (IND (2 ?X_A))))
		(?X_B (?X_H LIKE.9.V (KA ((ADV-A (FROM.P ?X_I)) LEARN.V))))
	)
)

; "Kumar liked farming."
; "He grew corn and beans."
; "He harvested all of them."
; "He sold them for money."
(EPI-SCHEMA ((?X_N (LIKE.V ?X_O)) ** ?E)
	(:ROLES
		(!R1 (?X_F MONEY.N))
		(!R2 (?X_G MALE.A))
		(!R3 (?X_G AGENT.N))
		(!R4 (?X_O FARMING.N))
		(!R5 (?X_O OBJECT.N))
		(!R6 (?X_N AGENT.N))
		(!R7 (NOT (?X_O ACTION.N)))
		(!R8 (NOT (?X_O AGENT.N)))
	)
	(:STEPS
		(?X_M (?X_N LIKE.10.V ?X_O))
		(?X_K (?X_N (GROW.V ?X_A)))
		(?X_I
   (?X_N (HARVEST.V (ALL.D (L X (AND (X (PLUR {REF}.N)) (X (OF.P ?X_C))))))))
		(?X_E (?X_G (((ADV-A (FOR.P ?X_F)) SELL.V) ?X_C)))
	)
)

; "Dan loves farms."
; "He has a farm."
; "He grows vegetables."
; "He sells them at the market."
(EPI-SCHEMA ((?X_M (GROW.V ?X_F)) ** ?E)
	(:ROLES
		(!R1 (?X_C MARKET.N))
		(!R2 (?X_F (PLUR VEGETABLE.N)))
		(!R3 (?X_L (PLUR FARM.N)))
		(!R4 (?X_K FARM.N))
		(!R5 (NOT (?X_L ACTION.N)))
		(!R6 (NOT (?X_L AGENT.N)))
		(!R7 (?X_M AGENT.N))
	)
	(:STEPS
		(?X_H (?X_M LOVE.11.V ?X_L))
		(?X_J (?X_M HAVE.12.V ?X_K))
		(?X_E (?X_M (GROW.V ?X_F)))
		(?X_B (?X_M (((ADV-A (AT.P ?X_C)) SELL.V) ?X_F)))
	)
)

; "The girl was very tired."
; "She fell asleep while reading."
; "She slept until noon."
; "She awoke with a headache."
; "She drank tea and rested."
(EPI-SCHEMA ((?X_K (COMPOSITE-SCHEMA.PR ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_E HEADACHE.N))
		(!R2 (?X_H NOON.N))
		(!R3 (?X_K GIRL.N))
		(!R4 (?X_K (VERY.ADV TIRED.A)))
		(!R5 (?X_L TEA.N))
	)
	(:STEPS
		(?X_J (?X_K (ASLEEP.ADV ((ADV-A (WHILE.P (KA READ.V))) FALL.V))))
		(?X_G (?X_K ((ADV-A (UNTIL.P ?X_H)) SLEEP.V)))
		(?X_D (?X_K ((ADV-A (WITH.P ?X_E)) AWOKE.V)))
		(?X_A (?X_K DRANK.13.V ?X_L))
		(?X_B (?X_K REST.V))
	)
)

; "A boy sat down on the couch."
; "He took a book from the shelf."
; "He read some pages."
; "He turned the page."
; "He looked at the next page."
; "He looked at the last page."
(EPI-SCHEMA ((?X_D (READ.V ?X_H)) ** ?E)
	(:ROLES
		(!R1 (?X_A COUCH.N))
		(!R2 (?X_D SHELF.N))
		(!R3 (?X_E BOOK.N))
		(!R4 (?X_H (PLUR PAGE.N)))
		(!R5 (?X_K PAGE.N))
		(!R6 (?X_N NEXT.A))
		(!R7 (?X_N PAGE.N))
		(!R8 (?X_Q BOY.N))
		(!R9 (?X_R LAST.A))
		(!R10 (?X_R PAGE.N))
	)
	(:STEPS
		(?X_C (?X_Q (DOWN.ADV ((ADV-A (ON.P ?X_A)) SIT.V))))
		(?X_G (?X_Q (((ADV-A (FROM.P ?X_D)) TAKE.V) ?X_E)))
		(?X_J (?X_Q (READ.V ?X_H)))
		(?X_M (?X_Q (TURN.V ?X_K)))
		(?X_P (?X_Q ((ADV-A (AT.P ?X_N)) LOOK.V)))
		(?X_T (?X_Q ((ADV-A (AT.P ?X_R)) LOOK.V)))
	)
)

; "Dani went to bed early."
; "She woke up late."
; "She had trouble getting up."
; "She took a short nap."
; "She felt better after taking a nap."
(EPI-SCHEMA ((?X_P
              (((ADV-A (AFTER.P (KA ((ADV-A (TO.P ?X_O)) GO.V)))) TAKE.V)
               ?X_G))
             ** ?E)
	(:ROLES
		(!R1 (?X_C ((ADV-A (AFTER.P (KA (TAKE.V ?X_D)))) BETTER.A)))
		(!R2 (?X_G SHORT.A))
		(!R3 (?X_G NAP.N))
		(!R4 (?X_J TROUBLE.N))
		(!R5 (?X_O BED.N))
		(!R6 (?X_O DESTINATION.N))
		(!R7 (?X_P AGENT.N))
	)
	(:STEPS
		(?X_N (?X_P ((ADV-A (FROM.P ?L1)) GO.14.V) ?X_O))
		(?X_L (?X_P (LATE.ADV WAKE_UP.V)))
		(?X_I (?X_P (HAVE.V (KE (?X_J GET_UP.V)))))
		(?X_F (?X_P (TAKE.V ?X_G)))
		(?X_B (?X_P (FEEL.V ?X_C)))
	)
)

; "Sarah went to sleep."
; "She woke up later."
; "She felt better."
(EPI-SCHEMA ((?X_E (LATER.ADV WAKE_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_E AGENT.N))
		(!R2 (?X_F BETTER.A))
	)
	(:STEPS
		(?X_B (?X_E ((ADV-A (FOR.P (KA SLEEP.V))) GO.V)))
		(?X_D (?X_E (LATER.ADV WAKE_UP.V)))
		(?X_H (?X_E (FEEL.V ?X_F)))
	)
)

; "Mary woke up early."
; "She read a book."
; "She had a good time."
; "She went to bed around midnight."
(EPI-SCHEMA ((?X_K (EARLY.ADV WAKE_UP.V)) ** ?E)
	(:ROLES
		(!R1 (?X_C GOOD.A))
		(!R2 (?X_C TIME.N))
		(!R3 (?X_F BOOK.N))
		(!R4 (?X_L BED.N))
		(!R5 (?X_K AGENT.N))
		(!R6 (?X_L DESTINATION.N))
	)
	(:STEPS
		(?X_H (?X_K (EARLY.ADV WAKE_UP.V)))
		(?X_E (?X_K (READ.V ?X_F)))
		(?X_B (?X_K (HAVE.V ?X_C)))
		(?X_J (?X_K ((ADV-A (FROM.P ?L1)) GO.14.V) ?X_L))
	)
)

; "Karen's mom gave Karen a book."
; "She read the book on the bus ride home."
; "She looked forward to going to bed."
(EPI-SCHEMA ((?X_J (READ.V ?X_L)) ** ?E)
	(:ROLES
		(!R1 (?X_C BED.N))
		(!R2 (?X_F HOME.N))
		(!R3 (?X_L BOOK.N))
		(!R4 (?X_G BUS.N))
		(!R5 (?X_G RIDE.N))
		(!R6 (?X_K MOM.N))
		(!R7 (?X_K (PERTAIN-TO ?X_J)))
		(!R8 (?X_J AGENT.N))
		(!R9 (?X_K AGENT.N))
		(!R10 (NOT (?X_L AGENT.N)))
	)
	(:STEPS
		(?X_I (?X_K (GIVE.15.V ?X_J ?X_L)))
		(?X_E (?X_J (((ADV-A (ON.P ?X_G)) READ.V) ?X_L ?X_F)))
		(?X_B (?X_J ((ADV-A (TO.P (KA ((ADV-A (TO.P ?X_C)) GO.V)))) LOOK_FORWARD.V)))
	)
)

; "Annie was tired from playing baseball."
; "She lay down on the couch."
; "She fell asleep."
; "She woke up at noon."
(EPI-SCHEMA ((?X_I ((ADV-A (ON.P ?X_C)) LIE_DOWN.V)) ** ?E)
	(:ROLES
		(!R1 (?X_B BASEBALL.N))
		(!R2 (?X_C COUCH.N))
		(!R3 (?X_F ASLEEP.A))
		(!R4 (?X_I AGENT.N))
		(!R5 (?X_J NOON.N))
		(!R6 (?X AGENT.N))
	)
	(:STEPS
		(?X_A (?X_I (FROM.P (KA (PLAY.V ?X_B)))))
		(?X_E (?X_I ((ADV-A (ON.P ?X_C)) LIE-FLAT_DOWN.V)))
		(?X_H (?X_I (FALL.V ?X_F)))
		(?X_L (?X_I ((ADV-A (AT.P ?X_J)) WAKE_UP.V)))
		(?E_1 (?X PLAY.16.V))
	)
)

; "Lisa read a book."
; "She liked to read books."
; "She enjoyed reading."
; "She read lots of things."
(EPI-SCHEMA ((?X_M (LIKE.V (KA (READ.V ?X_G)))) ** ?E)
	(:ROLES
		(!R1 (?X_C (PLUR LOT.N)))
		(!R2 (?X_C (OF.P ?X_D)))
		(!R3 (?X_G BOOK.N))
		(!R4 (?X_L (PLUR BOOK.N)))
		(!R5 ((KA (READ.V ?X_L)) ACTION.N))
		(!R6 (?X_M AGENT.N))
		(!R7 ((IND (5 READING_ACTIVITY)) ACTION.N))
	)
	(:STEPS
		(?X_F (?X_M (READ.V ?X_G)))
		(?X_I (?X_M LIKE.17.V (KA (READ.V ?X_L))))
		(?X_K (?X_M ENJOY.18.V (IND (5 READING_ACTIVITY))))
		(?X_B (?X_M (READ.V ?X_C)))
	)
)



; "'I'm going to the store,' Tom said."
; "'We need some milk,' Mary said."
; "'What kind of milk do you want?' Bob asked."
; "'Whole milk is fine,' Mary answered."
; "'Do you have any coupons?' Bob asked."
; "'No,' Mary replied."
; "'Okay, I'll be right back.'"
; "When Bob came back, he had a carton of whole milk."
(EPI-SCHEMA ((?X_E (ASK.V ?X_E (KA ((ADV (RIGHT.ADV BACK.A)) BE.V)))) ** ?E)
	(:ROLES
		(!R1 (?X_E AGENT.N))
		(!R2 (?X_H AGENT.N))
	)
	(:STEPS
		(?X_D (?X_E ASK.V))
		(?X_G (?X_E ASK.V))
		(?X_B (?X_A ?X_H ((ADV (RIGHT.ADV BACK.A)) BE.V)))
	)
)

))
