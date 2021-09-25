(declaim (sb-ext:muffle-conditions cl:warning))

(load "all-story-frames.lisp")
(load "new-ulf-parser.lisp")
(load "ll-util.lisp")

(defparameter *SEED* 1)
(if (and (equal (length sb-ext:*posix-argv*) 2) (num-str? (car (last sb-ext:*posix-argv*))))
	(setf *SEED* (max 1 (parse-integer (car (last sb-ext:*posix-argv*))))))

(ldefun get-invoker (frame tok-eps tok-kas tok-inds tok-kes)
(block outer
	(setf frame-name (second frame))
	(setf invoker-span (third frame))
	(if (not (equal (car invoker-span) (second invoker-span)))
		(return-from outer nil))
	(setf invoker-idx (car invoker-span))

	(setf invoked nil)

	(if (not (null (car (gethash invoker-idx tok-kas))))
		; then
		(setf invoked (car (gethash invoker-idx tok-kas)))
		; else
		(if (not (null (gethash invoker-idx tok-kes)))
			; then
			(setf invoked (car (gethash invoker-idx tok-kes)))
			; else
			(if (not (null (gethash invoker-idx tok-eps)))
				; then
				(setf invoked (gethash invoker-idx tok-eps))
				; else
				(return-from outer nil))))

	(if (symbolp invoked)
		; then
		(progn
			(setf ep-phi (caar (get-elements-pred (fifth parse) (lambda (x)
				(and (canon-charstar? x) (equal (third x) invoked))))))
			(setf invoked (list ep-phi '** invoked))
		))

	(return-from outer invoked)
)
)

(loop for story in (n-shuffles *ALL-STORY-FRAMES* *SEED*) do (handler-case (block outer
	(setf raw-len-ulfs (increment-tilde-tags (len-ulfs-with-word-tags (car story))))

	(setf processed-len-ulfs (mapcar #'prepare-new-ulf-for-parser raw-len-ulfs))

	(setf words-for-tags (make-hash-table :test #'equal))
	(setf tagged-ulf-words (get-elements-pred processed-len-ulfs (lambda (x) (and (symbolp x) (is-idx-tagged x)))))
	(loop for word in tagged-ulf-words
		; do (format t "tagged word: ~s~%" word)
		do (setf (gethash (get-idx-tag word) words-for-tags) word))
	; (print-ht (ninth parse))


	(setf parse (parse-story-maybe-from-ulf-full-output (car story) processed-len-ulfs))


	; (format t "~s~%" (fifth parse))

	(loop for sent in (car story)
		do (format t "~s~%" sent))
	; (print-story-with-els (car story) (fifth parse))
	; (print-ht (ninth parse))

	(setf tok-eps (sixth parse))
	(setf tok-kas (seventh parse))
	(setf tok-inds (eighth parse))
	(setf tok-kes (tenth parse))

	; (print-ht tok-inds)

	(setf frames (second story))

	; Do one pass to get all invokers.
	(setf invoker-to-frame-map (make-hash-table :test #'equal))
	(loop for frame in frames for i from 0 do (block process-frame
		; (format t "~d. ~s~%" i (get-invoker frame tok-eps tok-kas tok-inds tok-kes))
		(setf invoker (get-invoker frame tok-eps tok-kas tok-inds tok-kes))
		(if (not (null invoker))
			(setf (gethash (get-invoker frame tok-eps tok-kas tok-inds tok-kes) invoker-to-frame-map) (list i (second frame))))
	))

	(loop for frame in frames for i from 0 do (block process-frame
		(setf frame-name (second frame))
		(setf invoker-span (third frame))
		(if (not (equal (car invoker-span) (second invoker-span)))
			(return-from process-frame))
		(setf invoker-idx (car invoker-span))

		(setf args (fourth frame))

		(setf invoked nil)

		(if (not (null (car (gethash invoker-idx tok-kas))))
			; then
			; (format t "invokes ka ~s" (gethash invoker-idx tok-kas))
			(setf invoked (car (gethash invoker-idx tok-kas)))
			; else
			(if (not (null (gethash invoker-idx tok-kes)))
				; then
				(setf invoked (gethash invoker-idx tok-kes))
				; else
				(if (not (null (gethash invoker-idx tok-eps)))
					; then
					; (format t "invokes ep ~s" (gethash invoker-idx tok-eps))
					(setf invoked (gethash invoker-idx tok-eps))
					; else
					(return-from process-frame))))


		(if (symbolp invoked)
			; then
			(progn
				(setf ep-phi (caar (get-elements-pred (fifth parse) (lambda (x)
					(and (canon-charstar? x) (equal (third x) invoked))))))
				(setf ep-verb (prop-pred ep-phi))
				(format t "~d. ~s <- ~s~%" i frame-name ep-verb)
			)
			; else
			(format t "~d. ~s <- ~s~%" i frame-name invoked))

		(if (symbolp invoked)
			; then
			(block get-ep-args
				(setf ep-phi (caar (get-elements-pred (fifth parse) (lambda (x)
					(and (canon-charstar? x) (equal (third x) invoked))))))
				(setf invoker-args (prop-all-args ep-phi))

				; If the invoking formula has a negative polarity,
				; note that.
				(if (contains (prop-mods ep-phi) 'NOT)
					; then
					(format t "	(NEGATIVE polarity)~%"))
			)
			; else
			(if (canon-ka? invoked)
				(block get-ka-args
					(setf invoker-args (pred-args (second invoked)))
					;(format t "invoker has args:~%")
					;(loop for invoker-arg in invoker-args
						;do (format t "	~s~%" invoker-arg))
				)
				; else
				(if (canon-event? invoked)
					(setf invoker-args (prop-all-args (second invoked))))))

		(format t "	invoker has args:~%")
		(loop for invoker-arg in invoker-args
			do (format t "		~s~%" invoker-arg))

		(format t "	frame has args:~%")
		(loop for arg in args do (block process-arg
			(setf arg-start-idx (car (second arg)))
			(setf arg-end-idx (second (second arg)))
			; (format t "~d ~d~%" arg-start-idx arg-end-idx)
			(setf invoked-inds (list))
			(loop for i from arg-start-idx to arg-end-idx
				do (setf invoked-inds (append invoked-inds
					(gethash i tok-inds))))

			(setf arg-words (loop for i from (car (second arg)) to (second (second arg))
				if (not (null (gethash i words-for-tags)))
					collect (string (gethash i words-for-tags))
				else collect "_"))

			; If we have multiple invoked-inds, but one
			; of them is a KE or a KE that's identical to our invoker,
			; then we can remove that one.
			(if (and (> (length invoked-inds) 1) (contains invoked-inds invoked))
				; then
				(setf invoked-inds (remove invoked invoked-inds :test #'equal)))

			; Any invoked-ind that itself invokes a frame
			; can be replaced with that frame's identifier
			; now.
			(setf invoked-inds (loop for inv in invoked-inds
				if (not (null (gethash inv invoker-to-frame-map)))
					collect (gethash inv invoker-to-frame-map)
				else
					collect inv))

			(if (> (length invoked-inds) 1)
			; then
			(block case1
			; (format t "	framenet arg ~s (~s) has multiple possible bindings: ~s~%" (car arg) (join-str-list " " arg-words))
			;(loop for ind in (dedupe invoked-inds)
				;do (format t "		~s~%" ind))
			(format t "		~s <- (~a)~%" (car arg) (join-str-list " OR " (sort (mapcar #'force-str (dedupe invoked-inds)) #'< :key #'length)))
			)
			; else
			; (format t "	framenet arg ~s bound to ~s~%" (car arg) (car (dedupe invoked-inds))))
			(format t "		~s <- ~s" (car arg) (car (dedupe invoked-inds)))
			)

			(format t "~%")

		)))

		)

		(format t "~%~%")

		; (format t "~s (~s)~%" frame-name invoker-idx)

		; (loop for arg in args do (format t "	~s (~s ~s)~%" (car arg) (car (second arg)) (second (second arg))))

	(format t "------------------------------~%")

) (error () (format t "error~%"))))
