(load "parse.lisp")
(load "norm-el.lisp")
(load "real_util.lisp")

(defparameter *MOVEMENT-PREDS* '(
	go.v
	come.v
	run.v
	walk.v
	crawl.v
))

(defun subsumes (schema-pred story-pred)
(block outer
	; If they're equal, schema subsumes story
	(if (equal schema-pred story-pred)
		(return-from outer t)
	)

	(if (and (equal schema-pred 'movement_verb.v)
			(not (null (member story-pred *MOVEMENT-PREDS* :test #'equal))))
		; then
		(return-from outer t)
	)

	; Check WordNet hypernym hierarchy
	(if (not (null (member schema-pred (wordnet-hypernyms story-pred))))
		(return-from outer t)
	)

	; Default case: no subsumption
	(return-from outer nil)
)
)

(defun word-sym-split (sym)
(let (symstr spl wspl word num pos)
(block outer
	(setf symstr (string sym))
	(setf spl (split-str symstr "."))
	(setf wspl (split-str (car spl) "#")

	(setf word (car wspl))
	(setf num (parse-integer (second wspl)))
	(setf pos (second spl))

	(return-from outer (list word num pos))
)
)
)
)

(defun wordnet-hypernyms (word-sym)
(block outer
(cond
	((equal word-sym 'FIELD_1.N)
		'(TRACT_1.N GEOGRAPHICAL_AREA_1.N REGION_3.N LOCATION_1.N OBJECT_1.N PHYSICAL_ENTITY_1.N ENTITY_1.N))

	((equal word-sym 'WAGON_1.N)
		'(WHEELED_VEHICLE_1.N CONTAINER_1.N INSTRUMENTALITY_3.N ARTIFACT_1.N WHOLE_2.N OBJECT_1.N PHYSICAL_ENTITY_1.N ENTITY_1.N))

	((equal word-sym 'FLOWER_1.N)
		'(ANGIOSPERM_1.N SPERMATOPHYTE_1.N VASCULAR_PLANT_1.N PLANT_2.N ORGANISM_1.N LIVING_THING_1.N WHOLE_2.N OBJECT_1.N PHYSICAL_ENTITY_1.N ENTITY_1.N))

	((equal word-sym 'MONKEY_1.N)
		'(PRIMATE_2.N PLACENTAL_1.N MAMMAL_1.N VERTEBRATE_1.N CHORDATE_1.N ANIMAL_1.N ORGANISM_1.N LIVING_THING_1.N WHOLE_2.N OBJECT_1.N PHYSICAL_ENTITY_1.N ENTITY_1.N))

	((equal word-sym 'COCOANUT_1.N)
		'(FOOD_2.N SOLID_1.N MATTER_3.N PHYSICAL_ENTITY_1.N ENTITY_1.N))

	;((equal word-sym 'SET_1.N
		;'(COLLECTION_1.N GROUP_1.N ABSTRACTION_6.N ENTITY_1.N)))

	(t '(ENTITY_1.N))
)
)
)

