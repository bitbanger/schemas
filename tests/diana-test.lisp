(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load "diana.lisp")

(setf headers '(
	(AGENT.N ENJOY_ACTION.V ACT.N)
	(ANIMAL.N ENJOY_ACTION.V ACT.N)
	(MONKEY.N ENJOY_ACTION.V (TO (L X (AND (X RUN.V) (X PLAY.V)))))
	(DOG.N ENJOY_ACTION.V (TO (TAKE.V ?X_C)))
	(AGENT.N ENJOY_ACTION.V (TO (((ADV-A (TO.P ?X_B)) ASK.V) ?X_C)))
	(AGENT.N ENJOY_ACTION.V (TO (ASK.V ?X_B (KA (COURT.V ?X_B)))))
	(MAN.N ENJOY_ACTION.V (TO HELP.V))
	(AGENT.N ENJOY_ACTION.V (TO (HUNT.N (PLUR BUG.N))))
	(AGENT.N ENJOY_ACTION.V (TO (GO.V SWIMMING.N)))
	(MOTHER.N ENJOY_ACTION.V (TO ((ADV-A (WITH.P ?X_B)) PLAY.V)))
	(AGENT.N ENJOY_ACTION.V (TO ((ADV-A (IN.P ?X_C)) RIDE.V)))
	(AGENT.N ENJOY_ACTION.V
	(TO (RIDE.V (IN.P (AND (?X_C LITTLE.A) (?X_C WAGON.N))))))
	(AGENT.N ENJOY_ACTION.V (TO (((ADV-A (WITH.P TYKE.N)) PLAY.V) BALL.N)))
	(AGENT.N ENJOY_ACTION.V
	(TO (SEE.V (?X_B ((ADV-A (WITH.P (EACH.D OTHER.A))) PLAY.V)))))
	(AGENT.N ENJOY_ACTION.V (TO VOMIT.V))
	(AGENT.N ENJOY_ACTION.V ACTION.N)
	(AGENT.N ENJOY_ACTION.V (TO (PLAY.V BASEBALL.N)))
	(AGENT.N ENJOY_ACTION.V (TO ((ADV-A (WITH.P ?X_B)) GO.V)))
	(AGENT.N ENJOY_ACTION.V (TO (BUY.V ?X_B)))
	(AGENT.N ENJOY_ACTION.V (TO SKATE.V))
	(AGENT.N ENJOY_ACTION.V (TO GO.V))
	(AGENT.N ENJOY_ACTION.V (TO ((ADV-A (IN.P ?X_C)) PLAY.V)))
	(AGENT.N ENJOY_ACTION.V (TO (GET.V (L X (AND (X FATHER.N) (X |'S|))) ?X_C)))
	(AGENT.N ENJOY_ACTION.V (TO (STOP.V WORK.V)))


	(AGENT.N INFORM.V AGENT.N MESSAGE.N)
	(AGENT.N INFORM.V ANIMAL.N MESSAGE.N)
	(AGENT.N INFORM.V DOG.N INFORMATION.N (TO.P (VET.N)))
	(BOY.N (DOWN.ADV INFORM.V) BOY.N INFORMATION.N HARD.ADV)
	(AGENT.N INFORM.V DAD.N INFORMATION.N)
	(AGENT.N INFORM.V AGENT.N INFORMATION.N)
	(AGENT.N INFORM.V MOTHER.N INFORMATION.N)
	(BROTHER.N INFORM.V AGENT.N INFORMATION.N
	(FOR.P (KA (UP.PRT CLEAN.V) (CAN.N))))
	(BROTHER.N INFORM.V BROTHER.N INFORMATION.N
	(FOR.P (KA (UP.PRT CLEAN.V) (CAN.N))))
	(AGENT.N ((ADV-A (INTO.P AMY.NAME)) INFORM.V) AGENT.N INFORMATION.N
	ALMOST.ADV)
	(AGENT.N INFORM.V AGENT.N INFORMATION.N (THROUGH.P (DOOR.N)))
	(BROTHER.N INFORM.V AGENT.N INFORMATION.N (FROM.P (TREE.N)))
	(MAN.N INFORM.V AGENT.N INFORMATION.N (TO.P (SHOP.N)))
	(AGENT.N TELL.V AGENT.N INFORMATION.N)
	(GIRL.N INFORM.V AGENT.N INFORMATION.N)


	(ANIMAL.N PLAY.V)
	(CAT.N PLAY.V (WITH.P (BALL.N)))
	(CAT.N PLAY.V (WITH.P (EDGE.N)))
	(MOUSE.N PLAY.V (WITH.P (MOUSE.N)))


	(AGENT.N TRAVEL.V ACT.N)
	(MAN.N GO.V (TO ((ADV-A (FOR.P ?X_D)) LOOK.V)) (FROM.P (LOCATION.N)))
	(BABY.N GO.V (TO SLEEP.V) (FROM.P (LOCATION.N)))
	(AGENT.N GO.V (TO (INTRODUCE.V ?X_A)) (FROM.P (LOCATION.N)))
	(AGENT.N GO.V PASS.N (FROM.P (LOCATION.N)))
	(AGENT.N GO.V MARKET.N (FROM.P (LOCATION.N)))
	(AGENT.N GO.V (TO (((ADV-A (ON.P ?X_B)) VISIT.V) ?X_C))
	(FROM.P (LOCATION.N)))
	(GIRL.N GO.V (TO ((ADV-A (WITH.P ?X_D)) PLAY.V)) (FROM.P (HOME.N)))
	(AGENT.N GO.V (TO (((ADV-A (FOR.P ?X_B)) BUY.V) GAS.N))
	(FROM.P (LOCATION.N)))
	(FRIEND.N COME.V (TO (VISIT.V ?X_C)) (FROM.P (LOCATION.N)))
	(AGENT.N GO.V (TO EAT.V) (FROM.P (LOCATION.N)))
	(AGENT.N GO.V (TO WALK.V) (FROM.P (LOCATION.N)))
	(AGENT.N GO.V (TO WORK.V) (FROM.P (LOCATION.N)))


	(AGENT.N TRAVEL.V WATER.N)
	(AGENT.N GO.V POND.N (FROM.P (LOCATION.N)))
	(AGENT.N GO.V LAKE.N (FROM.P (LOCATION.N)))


	(AGENT.N TRAVEL.V AGENT.N)
	(ANIMAL.N TRAVEL.V AGENT.N)
	(BIRD.N BECOME.V FRIEND.N (FROM.P (LOCATION.N)))
	(WOMAN.N BECOME.V FRIEND.N (FROM.P (LOCATION.N)))
	(AGENT.N RUN.V FRIEND.N (FROM.P (LOCATION.N)))
	(MOTHER.N WALK.V BABY.N (FROM.P (LOCATION.N)))


	(AGENT.N TRAVEL.V OBJECT.N)
	(AGENT.N TRAVEL.V EQUIPMENT.N)
	(AGENT.N ROLL.V BALL.N (FROM.P (LOCATION.N)))
	(AGENT.N TRAVEL.V LOCATION.N)
	(ANIMAL.N TRAVEL.V LOCATION.N)
	(KITTEN.N RUN.V DESTINATION.N (FROM.P (LOCATION.N)))
	(HARE.N RUN.V DESTINATION.N (FROM.P (LOCATION.N DOG.N)))
	(COW.N FALL.V DESTINATION.N (FROM.P (LOCATION.N)))
	(COW.N DIE.V DESTINATION.N (FROM.P (LOCATION.N)))
	(DOG.N RUN.V DESTINATION.N (FROM.P (LOCATION.N)))
	(CAT.N STROLL.V DESTINATION.N (FROM.P (LOCATION.N)))
	(BIRD.N SURVIVE.V DESTINATION.N (FROM.P (LOCATION.N)))
	(CAT.N WALK.V DESTINATION.N (FROM.P (LOCATION.N)))
	(CAT.N RUN.V DESTINATION.N (FROM.P (EDGE.N)))
	(COW.N RUN.V DESTINATION.N (FROM.P (LOCATION.N)))
	(CAT.N RUN.V DESTINATION.N (FROM.P (LOCATION.N)))
	(DOG.N COME.V DESTINATION.N (FROM.P (OUTSIDE.N)))
	(COW.N GO.V DESTINATION.N (FROM.P (LOCATION.N)))
	(DOG.N ESCAPE.V DESTINATION.N (FROM.P (LOCATION.N)))
	(MONKEY.N COME.V DESTINATION.N (FROM.P (LOCATION.N)))
	(RAT.N RUN.V DESTINATION.N (FROM.P (LOCATION.N)))
	(DOG.N GO.V DESTINATION.N (FROM.P (LOCATION.N)))
	(DOG.N GO.V OUTSIDE.N (FROM.P (LOCATION.N)))
	(PONY.N STUMBLE.V DESTINATION.N (FROM.P (LOCATION.N)))
	(BIRD.N FLY.V DESTINATION.N (FROM.P (LOCATION.N)))
	(AGENT.N MOVE.V DESTINATION.N (FROM.P (LOCATION.N)))
	(BOY.N COME.V DESTINATION.N (FROM.P (LOCATION.N)))
	(MAN.N WALK.V DESTINATION.N (FROM.P (LOCATION.N)))
	(AGENT.N LEAVE.V OPEN.N (FROM.P (LOCATION.N)))
	(MAN.N GO.V DESTINATION.N (FROM.P (LOCATION.N)))
	(AGENT.N CLIMB.V DESTINATION.N (FROM.P (PARK.N)))
	(AGENT.N RUN.V DESTINATION.N (FROM.P (PARK.N)))
	(WOMAN.N WALK.V DESTINATION.N (FROM.P (LOCATION.N)))
	(AGENT.N LEAVE.V DESTINATION.N (FROM.P (LOCATION.N)))
	(AGENT.N GO.V OUTSIDE.N (FROM.P (LOCATION.N)))
	(FARMER.N GO.V OUTSIDE.N (FROM.P (LOCATION.N)))
	(FRIEND.N COME.V DESTINATION.N (FROM.P (OUTSIDE.N NOISE.N)))
	(BROTHER.N RUN.V DESTINATION.N (FROM.P (LOCATION.N)))
	(GIRL.N GO.V DESTINATION.N (FROM.P (HOME.N)))
	(SON.N IN.PRT ((ADV-A (FROM.P OUTSIDE.N)) COME.V) DESTINATION.N)
	(AGENT.N SWIM.V DESTINATION.N (FROM.P (PARK.N)))
	(AGENT.N RUN.V DESTINATION.N (FROM.P (END.N)))
	(AGENT.N FALL.V DESTINATION.N (FROM.P (LOCATION.N)))
	(MAN.N CLIMB.V DESTINATION.N (FROM.P (LOCATION.N)))
	(MAN.N FLOAT.V DESTINATION.N (FROM.P (LOCATION.N)))
	(AGENT.N GO.V DESTINATION.N (FROM.P (LOCATION.N)))
	(AGENT.N COME.V DESTINATION.N (FROM.P (LOCATION.N)))
	(MAN.N RUN.V DESTINATION.N (FROM.P (LOCATION.N)))
	(BROTHER.N FALL.V DESTINATION.N (FROM.P (LOCATION.N TREE.N)))
	(AGENT.N RIDE.V DESTINATION.N (FROM.P (LOCATION.N)))
	(AGENT.N RUN.V DESTINATION.N (FROM.P (LOCATION.N)))
	(BOY.N RUN.V DESTINATION.N (FROM.P (LOCATION.N)))
	(AGENT.N WALK.V DESTINATION.N (FROM.P (LOCATION.N)))
	(AGENT.N TRAVEL.V STRUCTURE.N)
	(AGENT.N TRAVEL.V PLANT.N)
	(ANIMAL.N TRAVEL.V PLANT.N)
	(MONKEY.N CLIMB.V TREE.N (FROM.P (LOCATION.N)))
	(AGENT.N CLIMB.V TREE.N (FROM.P (LOCATION.N)))
	(ANIMAL.N TRAVEL.V STRUCTURE.N)
	(COW.N LEAVE.V BARN.N (FROM.P (FIELD.N)))
	(AGENT.N GO.V RESTAURANT.N (FROM.P (LOCATION.N)))
	(AGENT.N GO.V CASINO.N (FROM.P (LOCATION.N)))
	(MAN.N GO.V CAFETERIA.N (FROM.P (LOCATION.N)))
	(AGENT.N ROLL.V HOOP.N (FROM.P (LOCATION.N)))
	(AGENT.N GO.V STORE.N (FROM.P (LOCATION.N)))
	(AGENT.N MOVE.V HOME.N (FROM.P (CITY.N)))
	(BOY.N RETURN.V HOME.N (FROM.P (LOCATION.N)))
	(AGENT.N CHASE.V HAT.N (FROM.P (LOCATION.N)))
	(AGENT.N COME.V HOME.N (FROM.P (LOCATION.N)))
	(PERSON.N WALK.V HILL.N (FROM.P (SIDE.N HILL.N)))
	(AGENT.N GO.V HOME.N (FROM.P (CORNER.N)))
	(MAN.N RUN.V HOME.N (FROM.P (LOCATION.N)))
	(AGENT.N GO.V BEACH.N (FROM.P (LOCATION.N)))
))

(print-nested-dfs (diana headers #'wn-metric))
