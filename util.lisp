; episode-dag takes a list of episode relations and returns
; a DAG structure of the episodes representing their temporal ordering.
; The DAG structure is represented by a list of two elements: the first
; is the set of "roots" of the DAG (episodes with no incoming edges).
; The second is a hash table, h, where y \in h[x] means y happens immediately
; after x, or is a direct effect of x.
;
; TODO: Represent eventual succession as well as, and distinctly from,
; immediate succession.
(defun episode-dag (ep-rels)
(block outer

	(

)
)

; during-groups returns an unordered list of lists of episodes, where each
; top-level list contains all episodes that are known to happen at the same
; time. You can think of it as the list of points in time that fully enclose
; all known episodes.
(defun during-groups (ep-rels)
(block outer

	(setf ep-to-moment (make-hash-table :test #'equal))
	(setf moment-to-eps (make-hash-table :test #'equal))

	(loop for rel in ep-rels
		(cond
			((or (equal 'during.p (second rel)) (equal 'cause-of.n (second rel)))
				(handle-during rel ep-to-moment moment-to-eps)
			)
		)
	)
)
)


; YOU WERE WORKING ON TOPSORTING EPISODES, & NEED TO FIGURE OUT HOW TO
; LOOP OVER A HASH TABLE IN SBCL TO GET THE MAX MOMENT ID!

(defun max-moment-id (ep-to-moment)
	(loop for val being the hash-values of ep-to-moment
		maximize val
	)
)

(defun handle-during (ep-rel ep-to-moment moment-to-eps)
(block outer

	(setf hd-e1 (first ep-rel))
	(setf hd-e2 (third ep-rel))

	(cond
		; We've seen e1, but not e2
		((and
			(not (null (gethash hd-e1 ep-to-moment)))
			(null (gethash hd-e2 ep-to-moment))

			; So we assign e2 to have the same moment as e1
			(setf (gethash hd-e2 ep-to-moment) (gethash hd-e1 ep-to-moment))
		)


		; We've seen e2, but not e1
		((and
			(null (gethash hd-e1 ep-to-moment))
			(not (null (gethash hd-e2 ep-to-moment)))

			; So we assign e1 to have the same moment as e2
			(setf (gethash hd-e1 ep-to-moment) (gethash hd-e2 ep-to-moment))
		)



		; We haven't seen either episode
		((and
			(null (gethash hd-e1 ep-to-moment))
			(null (gethash hd-e2 ep-to-moment))

			; So we assign e1 to have the same moment as e2
			(setf (gethash hd-e1 ep-to-moment) (gethash hd-e2 ep-to-moment))
		)
	)

)
)

; prev-eps returns the set of episodes that immediately precede
; or cause a given episode.
(defun prev-eps (ep ep-rels)
(block outer
	(loop for ep-rel in ep-rels
		if (not (null (prev-ep ep ep-rel)))
		then collect (prev-ep ep ep-rel)
	)
)
)

; prev-ep returns the episode that ep-rel implies immediately precedes, or
; causes, the given episode, or nil if no such episode is implied by ep-rel. 
(defun prev-ep (ep ep-rel)
	(cond
		; We're looking for "cause of" and "consec" rels
		((not (or
			(equal 'cause-of.n (second ep-rel))
			(equal 'consec (second ep-rel))
		))
			nil)

		; The other ep has to lead to ours
		((not (equal (third ep-rel) ep))
			nil)

		(t (first ep-rel))
	)
)

; order-episodes takes a list of episode relations.
; It outputs a list of lists. Each sub-list contains the set of episodes
; with no defined before-after or causal relationships. The sub-lists are
; in chronological order.
(defun order-episodes
