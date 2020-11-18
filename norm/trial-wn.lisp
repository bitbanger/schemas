(load "ll-load.lisp")

(ll-load "trial-wn-data.lisp")

(defun wordnet-hypernyms (el)
(block outer
	(setf ladder-ids (gethash el *EL_TO_LADDERS*))
	(setf ladders (loop for ladder-id in ladder-ids collect
		(loop for synset-id in (gethash ladder-id *IDS_TO_CHAINS*)
			collect (gethash synset-id *IDS_TO_SYNSET*)
		)
	))
	(return-from outer ladders)
)
)

(defun wordnet-synonyms (el)
(block outer
	(return-from outer (gethash (gethash el *EL_TO_SYNS*) *IDS_TO_SYNSET*))
)
)
