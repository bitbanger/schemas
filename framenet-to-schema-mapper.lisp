(load "ll-load.lisp")

(ll-load "schema-util.lisp")
(ll-load "ll-util.lisp")
(ll-load "new-ulf-parser.lisp")
(ll-load "protoschemas.lisp")

(ldefun reified-event? (x)
(or
	(canon-ka? x)
	(canon-ke? x)
	(canon-that? x)
)
)

(ldefun bring (frame)
(block outer
	(setf frame-name (second (car frame)))

	(if (not (equal frame-name 'BRINGING))
		(return-from outer nil))

	(setf invoker-pre (second frame))
	(setf invoker-post (third frame))

	(setf invoker-mods (fourth frame))

	(setf frame-arg-map (make-hash-table :test #'equal))
	(loop for arg in (fifth frame) do (block pick-arg
		
		(block farg
		(setf frame-arg (second arg))
		(if (equal 1 (length frame-arg))
			(progn
				(setf frame-arg (car frame-arg))
				(return-from farg)))

		(setf non-event-args '(THEME GOAL AGENT))
		(setf event-args '(PURPOSE))

		(if (contains non-event-args (car arg)) do (block prune
			(setf non-events (loop for cand in (second arg)
				if (not (reified-event? cand)) collect cand))

			(if (not (null non-events))
				(setf frame-arg (car non-events))
				; else
				(setf frame-arg (car (second arg))))

			(return-from farg)
		))

		(if (contains event-args (car arg)) do (block prune
			(setf events (loop for cand in (second arg)
				if (reified-event? cand) collect cand))

			(if (not (null events))
				(setf frame-arg (car events))
				; else
				(setf frame-arg (car (second arg))))

			(return-from farg)
		))

		; Fallback case
		(setf frame-arg (car (second arg)))
		)

		(setf (gethash (car arg) frame-arg-map)
			frame-arg)
	))
		;do (setf (gethash (car arg) frame-arg-map)
			;(second arg)))

	(setf bindings (make-hash-table :test #'equal))

	; Bind the agent
	(if (not (null invoker-pre))
		; then
		(setf (gethash '?x bindings) invoker-pre)
		; else
		(if (not (null (gethash 'AGENT frame-arg-map)))
			; then
			(setf (gethash '?x bindings)
				(gethash 'AGENT frame-arg-map))))

	; Bind the object
	(if (equal 1 (length invoker-post))
		; then
		(setf (gethash '?o bindings)
			(car invoker-post)))

	(if (and (equal 2 (length invoker-post))
		(not (null (gethash 'THEME frame-arg-map))))
		; then
		(progn
			(setf (gethash '?o bindings)
				(gethash 'THEME frame-arg-map))
		)
	)

	(if (and
		(not (null (gethash 'GOAL frame-arg-map)))
		(not (equal (gethash 'GOAL frame-arg-map) (gethash '?o bindings)))
		(not (equal (gethash 'GOAL frame-arg-map) (gethash '?x bindings))))
		; then
		(setf (gethash '?l2 bindings)
			(gethash 'GOAL frame-arg-map)))

	(return-from outer (apply-bindings transport_object.v bindings))
)
)
