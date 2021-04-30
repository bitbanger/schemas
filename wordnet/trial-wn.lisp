(load "../ll-load.lisp")
(ll-load-superdir "ll-util.lisp")

(load "trial-wn-data.lisp")
(load "wn-basic-levels.lisp")

(ldefun wordnet-hypernyms (el)
(block outer
	(setf ladder-ids (gethash el *EL_TO_LADDERS*))
	(setf ladders (loop for ladder-id in ladder-ids collect
		(loop for synset-id in (gethash ladder-id *IDS_TO_CHAINS*)
			collect (gethash synset-id *IDS_TO_SYNSET*)
		)
	))

	; For some reason, we don't recognize all synonyms as
	; words in their own right, so we'll let them use their
	; fellow synonyms's ladders here.
	(if (and (null (unwrap-singletons ladders)) (loop for s in (wordnet-synonyms el) thereis (not (equal s el))))
		(loop for syn in (wordnet-synonyms el)
			if (and (not (equal syn el)))
				do (progn
					(setf res (wordnet-hypernyms syn))
					(if (not (null res))
						(return-from outer res))
				)
		)
	)

	(return-from outer ladders)
)
)

(ldefun wordnet-synonyms (el)
(block outer
	(return-from outer (gethash (gethash el *EL_TO_SYNS*) *IDS_TO_SYNSET*))
)
)
