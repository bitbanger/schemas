(load "../ll-load.lisp")

(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "schema-subsumption.lisp")

(ldefun wn-pred-dist (x y)
(block outer
	(setf ancestor (common-ancestor x y))
	(if (null ancestor)
		(return-from outer 999999999))

	(setf score (/ (+
		(subsumption-score ancestor x)
		(subsumption-score ancestor y)) 2))

	(if (<= score 0)
		(return-from outer 999999999))

	(return-from outer (/ 1 score))
)
)

(ldefun wn-metric (x y)
(block outer
	(setf x (loop for e in x
		if (and (symbolp e) (canon-pred? e))
			collect e))
	(setf y (loop for e in y
		if (and (symbolp e) (canon-pred? e))
			collect e))

	(if (not (equal (length x) (length y)))
		(return-from outer 999999999))

	(return-from outer
		(sum (loop for e1 in x for e2 in y
			collect (wn-pred-dist e1 e2))))
)
)

; DIvisive ANAlysis (DIANA) clustering
; algorithm implementation
(ldefun diana (points metric)
(block outer
	; Set up memoization for the distance
	; metric so the algorithms below can
	; call it freely and inefficiently.
	(clear-ll-func-cache 'diana-metric)

	(setf cached-metric
		(lambda (x y)
			(ll-cache metric
				(list x y) 100 nil)))

	; Start with one cluster. Clusters are
	; 2-element lists, where the first
	; element is a list of points, and the
	; second element is the index of its
	; child cluster in this cluster list,
	; or nil if it's unprocessed.
	(setf clusters (list
		(list points nil)
	))

	; We need to iterate |points|-1 times
	; to fully divide the tree
	(loop for i from 2 to (length points) do (block split
		; Select the cluster with maximum diameter
		(setf max-cluster-idx (car (max-all
			(loop for cluster in clusters
					for j from 0
				if (and (null (second cluster)) (> (length (car cluster)) 1))
					collect (list j (diameter
						(car cluster) cached-metric)))
			; key for max (diameter in second slot):
			#'second)))

		; No more splits are possible.
		(if (null max-cluster-idx)
			(return-from outer (unflatten-tree clusters)))

		(setf max-cluster
			(nth max-cluster-idx clusters))

		(setf child-cluster (list (list) nil))

		; While the most dissimilar point in the
		; cluster should still be moved, move it.
		(block move-points (loop while t do (block move-point
			;(setf rebel-pair (most-dissimilar
			;	(car max-cluster) cached-metric t))
			;(setf rebel-point (car rebel-pair))
			;(setf rebel-dist (second rebel-pair))

			; If the most dissimilar point is still
			; better off in the parent cluster, we're
			; done splitting.
			;(setf dist-from-child-cluster
				;(inner-dissimilarity rebel-point
					;(car child-cluster) cached-metric))

			;(format t "distance ~d, switch would be ~d~%" rebel-dist dist-from-child-cluster)

			;(if (>= dist-from-child-cluster rebel-dist)
				;(return-from move-points))

			(setf rebel-pairs (loop for pt in (car max-cluster)
				collect (list pt (-
					(inner-dissimilarity pt (car max-cluster) cached-metric)
					(inner-dissimilarity pt (car child-cluster) cached-metric)))))

			(format t "~s~%" rebel-pairs)

			(setf rebel-pair (max-all (loop for pt in (car max-cluster)
				collect (list pt (-
					(inner-dissimilarity pt (car max-cluster) cached-metric)
					(inner-dissimilarity pt (car child-cluster) cached-metric)))) #'second))

			(if (<= (second rebel-pair) 0)
				(return-from move-points))

			(setf rebel-point (car rebel-pair))

			; Otherwise, move the point.
			(setf child-cluster (list
				(append (car child-cluster) (list rebel-point))
				(second child-cluster)
			))
			(setf max-cluster (list
				(remove rebel-point (car max-cluster)
					:test #'equal :count 1)
				(second max-cluster)))
		)))

		; Add the child cluster to the list and set the
		; parent cluster's child pointer.
		(setf clusters (append clusters (list child-cluster)))
		(setf max-cluster (list (car max-cluster) (- (length clusters) 1)))
		(setf (nth max-cluster-idx clusters) max-cluster) ; DESTRUCTIVE (but it's ok)
	))

	(return-from outer (unflatten-tree clusters))
)
)

(ldefun most-dissimilar (cluster metric &optional full-pair)
	(let ((result-pair (max-all (loop for point in cluster
		collect (list
			point
			(inner-dissimilarity point cluster metric)))
		; key for max (distance in second slot):
		#'second)))

		(if full-pair
			; then
			result-pair
			; else
			(car result-pair))
	)
)

(ldefun inner-dissimilarity (point cluster metric)
(let ((cluster (remove point cluster :test #'equal :count 1)))
	(avg-mean (loop for point2 in cluster
		collect (funcall metric point point2)))
)
)

; Calculates the diameter (maximum
; pairwise dissimilarity) of a cluster.
(ldefun diameter (cluster metric)
	(max-all (loop for c1 in cluster for i from 0
		append (loop for c2 in cluster for j from 0
			if (not (equal i j))
				collect (funcall metric c1 c2))))
)