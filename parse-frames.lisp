(declaim (sb-ext:muffle-conditions cl:warning))

; (load "all-story-frames.lisp")
(load "ll-load.lisp")

(ll-load "new-ulf-parser.lisp")
(ll-load "ll-util.lisp")
(ll-load "schema-util.lisp")
(ll-load "framenet-to-schema-mapper.lisp")
(ll-load "protoschemas.lisp")

(if (>= (length sb-ext:*posix-argv*) 3)
	; then
	(load (third sb-ext:*posix-argv*))
	; else
	(load "all-story-frames.lisp")
)

; (setf *DEBUG-SENTENCE* "She saw Rover run off with the hat.")
(setf *DEBUG-SENTENCE* nil)

(if (not (null *DEBUG-SENTENCE*))
	(setf *ALL-STORY-FRAMES* (loop for frame in *ALL-STORY-FRAMES*
		if (equal (car (car frame)) *DEBUG-SENTENCE*)
			collect frame)))

(ldefun print-frame (frame)
(block outer
	(format t "~d. ~s <- ~s [~a]~%"
		(caar frame)
		(second (car frame))
		(third (car frame))
		(if (fourth (car frame)) "NEGATIVE" "POSITIVE"))

	(format t "	invoker has pre arg:~%		~s~%" (second frame))

	(format t "	invoker has post args:~%")
	(loop for post-arg in (third frame)
		do (format t "		~s~%" post-arg))

	(format t "	invoker has mods:~%")
	(loop for inv-mod in (fourth frame)
		do (format t "		~s~%" inv-mod))

	(format t "	frame has args:~%")
	(loop for arg in (fifth frame) do (block print-arg
		(if (equal 1 (length (second arg)))
			; then
			(format t "		~s <- ~s~%" (car arg) (car (second arg)))
			; else
			(format t "		~s <- ~a~%" (car arg) (join-str-list " OR " (sort (mapcar #'force-str (dedupe (second arg))) #'< :key #'length)))
		)
	))
)
)

(defparameter *SEED* 1)
(if (and (>= (length sb-ext:*posix-argv*) 2) (num-str? (second sb-ext:*posix-argv*)))
	(setf *SEED* (max 1 (parse-integer (second sb-ext:*posix-argv*)))))

(ldefun get-invoker (frame parse)
(block outer
	(setf tok-eps (sixth parse))
	(setf tok-kas (seventh parse))
	(setf tok-inds (eighth parse))
	(setf tok-kes (tenth parse))

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

(ldefun get-frames-to-map (story &optional)
(block outer
	(setf raw-len-ulfs (increment-tilde-tags (len-ulfs-with-word-tags (car story))))

	(setf processed-len-ulfs (mapcar #'prepare-new-ulf-for-parser raw-len-ulfs))

	(setf words-for-tags (make-hash-table :test #'equal))
	(setf tagged-ulf-words (get-elements-pred processed-len-ulfs (lambda (x) (and (symbolp x) (is-idx-tagged x)))))
	(loop for word in tagged-ulf-words
		do (setf (gethash (get-idx-tag word) words-for-tags) word))


	(setf parse (parse-story-maybe-from-ulf-full-output (car story) processed-len-ulfs))

	(setf tok-eps (sixth parse))
	(setf tok-kas (seventh parse))
	(setf tok-inds (eighth parse))
	(setf tok-kes (tenth parse))

	; (print-ht tok-eps)
	; (format t "~s~%" (fifth parse))

	(setf frames (second story))

	; Do one pass to get all invokers.
	(setf invoker-to-frame-map (make-hash-table :test #'equal))
	(loop for frame in frames for i from 0 do (block process-frame
		(setf invoker (get-invoker frame parse))
		(if (not (null invoker))
			(setf (gethash (get-invoker frame parse) invoker-to-frame-map) (list i (second frame))))
	))

	(setf frames-ready-to-map (list))

	(loop for frame in frames for i from 0 do (block process-frame
		(setf frame-name (second frame))
		(setf invoker-span (third frame))
		(if (not (equal (car invoker-span) (second invoker-span)))
			(return-from process-frame))
		(setf invoker-idx (car invoker-span))

		(setf args (fourth frame))

		(setf invoked nil)

		; (format t "invoker is ~s~%" (gethash invoker-idx words-for-tags))

		(if (not (null (car (gethash invoker-idx tok-kas))))
			; then
			(setf invoked (car (gethash invoker-idx tok-kas)))
			; else
			(if (not (null (gethash invoker-idx tok-kes)))
				; then
				(setf invoked (gethash invoker-idx tok-kes))
				; else
				(if (not (null (gethash invoker-idx tok-eps)))
					; then
					(setf invoked (gethash invoker-idx tok-eps))
					; else
					(progn
					; (format t "no ka, ke, or episode characterizes~%")
					(return-from process-frame)
					))))


		(if (symbolp invoked)
			; then
			(progn
				(setf ep-phi (caar (get-elements-pred (fifth parse) (lambda (x)
					(and (canon-charstar? x) (equal (third x) invoked))))))
				(setf ep-verb (prop-pred ep-phi))
			)
		)

		(setf negative nil)

		(setf invoker-pre-arg nil)
		(setf invoker-post-args (list))
		(setf invoker-mods (list))

		(if (symbolp invoked)
			; then
			(block get-ep-args
				(setf ep-phi (caar (get-elements-pred (fifth parse) (lambda (x)
					(and (canon-charstar? x) (equal (third x) invoked))))))
				(setf invoker-pre-arg (car (prop-pre-args ep-phi)))
				(setf invoker-post-args (prop-post-args ep-phi))
				(setf invoker-mods (prop-mods ep-phi))

				; If the invoking formula has a negative polarity,
				; note that.
				(if (or
					(contains (prop-mods ep-phi) 'NOT)
					(contains (prop-mods ep-phi) 'NEVER.ADV)
					)
					; then
					(setf negative t))
			)
			; else
			(if (canon-ka? invoked)
				(block get-ka-args
					(setf invoker-post-args (pred-args (second invoked)))
					(setf invoker-mods (pred-mods (second invoked)))
				)
				; else
				(if (canon-event? invoked)
					(progn
						(setf invoker-pre-arg (car (prop-pre-args (second invoked))))
						(setf invoker-post-args (prop-post-args (second invoked)))
						(setf invoker-mods (prop-mods (second invoked)))
					)
				)))

		(setf args-ready-to-map (list))
		(loop for arg in args do (block process-arg
			(setf arg-start-idx (car (second arg)))
			(setf arg-end-idx (second (second arg)))
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

			(setf args-ready-to-map (append args-ready-to-map (list
				(list (car arg) (dedupe invoked-inds)))))


		)

		;(print-frame frame-ready-to-map)

		)

		(if (symbolp invoked)
			(setf invoked (list ep-verb invoked)))

		(setf frame-ready-to-map (list
			(list i frame-name invoked negative)
			invoker-pre-arg
			invoker-post-args
			invoker-mods
			args-ready-to-map
		))
		(setf frames-ready-to-map (append frames-ready-to-map
			(list frame-ready-to-map)))

	))

	(return-from outer (list frames-ready-to-map parse))

)
)

;(loop for story in (n-shuffles *ALL-STORY-FRAMES* *SEED*) do (handler-case (block outer
(loop for story in (n-shuffles *ALL-STORY-FRAMES* *SEED*) do (block outer
	(setf frames-for-mapping-pair (get-frames-to-map story))
	(setf frames-for-mapping (car frames-for-mapping-pair))
	(setf parse (second frames-for-mapping-pair))
	(setf el-sents (fifth parse))
	(setf el-story (linearize-story el-sents))
	(setf el-story (loop for prop in el-story
		if (canon-prop? prop)
			collect prop))

	(loop for sent in (car story)
		do (format t "; ~s~%" sent))

	(format t "~%")

	(loop for frame in frames-for-mapping
		do (print-frame frame))

	(loop for frame in frames-for-mapping do (block print-schema
		(setf map-pair (frame-to-schema frame el-story))
		(if (null map-pair)
			(return-from print-schema))

		(setf schema-template (eval (car map-pair)))
		(setf bindings (second map-pair))

		(setf bound-vars (dedupe (loop for k being the hash-keys of bindings
			collect k)))
		(setf bound-vars (remove '?e bound-vars :test #'equal))

		(if (< (length bound-vars) 2)
			(return-from print-schema))

		(setf bound (dedupe (loop for k being the hash-keys of bindings
			collect (gethash k bindings))))
		(setf story-constrs (dedupe
			(story-select-interesting-term-constraints el-story bound)))

		;(format t "bound: ~s~%" bound)
		;(format t "new constrs:~%")
		;(loop for sc in story-constrs do (format t "	~s~%" sc))

		(loop for sc in story-constrs
			do (setf schema-template
				(add-role-constraint schema-template sc)))

		(print-schema (fully-clean-schema-no-gen
			(apply-bindings schema-template bindings)))
	))
		;do (format t "~s~%" (second (car frame)))
		;do (print-ht (map-frame frame))
		;do (format t "~%~%")
		;if (equal (second (car frame)) 'BRINGING)
			; do (print-schema (bring frame)))
			;do (print-ht (map-frame frame)))
		;if (equal (second (car frame)) 'SELF_MOTION)
			; do (format t "~s~%" frame))
			;do (print-frame frame))

	(format t "~%------------------~%~%")
))
; ) (error () (format t "error~%"))))
