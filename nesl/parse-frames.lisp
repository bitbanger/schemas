(declaim (sb-ext:muffle-conditions cl:warning))

; (load "all-story-frames.lisp")
(load "../ll-load.lisp")

(ll-load-superdir "new-ulf-parser.lisp")
(ll-load-superdir "ll-util.lisp")
(ll-load-superdir "schema-util.lisp")
(ll-load-superdir "schema-link.lisp")
(ll-load-superdir "schema-to-english.lisp")
(ll-load-superdir "framenet-to-schema-mapper.lisp")
(ll-load-superdir "protoschemas.lisp")

(if (>= (length sb-ext:*posix-argv*) 3)
	; then
	(load (third sb-ext:*posix-argv*))
	; else
	(load "tmp-story-frames.lisp")
)

(setf start-idx 0)

(if (>= (length sb-ext:*posix-argv*) 4)
	; then
	(setf start-idx (parse-integer (fourth sb-ext:*posix-argv*)))
)

(setf num-frames 20)
(if (>= (length sb-ext:*posix-argv*) 5)
	; then
	(setf num-frames (parse-integer (fifth sb-ext:*posix-argv*)))
)

(setf *HANDLE-ERRORS* t)

; (setf *DEBUG-SENTENCE* "Ben came home late at night.")
(setf *DEBUG-SENTENCE* nil)

(setf *DEBUG-OUTPUT* nil)

(if (not (null *DEBUG-SENTENCE*))
	(setf *ALL-STORY-FRAMES* (loop for frame in *ALL-STORY-FRAMES*
		if (equal (car (car frame)) *DEBUG-SENTENCE*)
			collect frame)))

; For alignment, bump the starting index of each sentence
; up by one when indexing with the numbers used by the LOME-
; produced frames, since that's empirically necessary.
(ldefun increment-frame-tags (frame ulfs)
(block outer
	(setf max-sent-tags (loop for ulf in ulfs
		collect (max-all (loop for tagged-word in (get-elements-pred ulf (lambda (x) (and (symbolp x) (is-idx-tagged x)))) collect (get-idx-tag tagged-word)))))

	(setf frame (append (list (intern (format nil "SAFE-~d" (car frame)))) (cdr frame)))

	(setf frame-nums (dedupe (get-elements-pred frame #'numberp)))

	(setf replacements-to-nums (make-hash-table :test #'equal))

	(loop for num in frame-nums do (block new-fn
		; (setf sent-tag (car (last (loop for mt in max-sent-tags if (>= num mt) collect mt))))
		; (format t "tag ~d is >= than: ~s~%" num (loop for mt in max-sent-tags if (>= num mt) collect mt))
		; (setf sent-idx (position sent-tag max-sent-tags :test #'equal))
		; (if (null sent-idx) (setf sent-idx 0))
		; (format t "tag ~d now accesses word" num)
		(setf sent-idx (length (loop for mt in max-sent-tags if (>= num mt) collect mt)))
		(setf new-num (+ num sent-idx))
		; (format t " ~d (incremented by ~d)~%" new-num sent-idx)

		(setf replacement (intern (format nil "REPLC-~d" new-num)))
		(setf (gethash replacement replacements-to-nums) new-num)

		(setf frame (replace-vals num replacement frame))
	))

	(loop for k being the hash-keys of replacements-to-nums
		do (setf frame (replace-vals k (gethash k replacements-to-nums) frame)))

	(return-from outer frame)
)
)

(ldefun print-frame (frame)
(block outer
	(if (not *DEBUG-OUTPUT*) (return-from outer nil))

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

(defparameter *SEED* 0)
(if (and (>= (length sb-ext:*posix-argv*) 2) (num-str? (second sb-ext:*posix-argv*)))
	(setf *SEED* (max 0 (parse-integer (second sb-ext:*posix-argv*)))))

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
	(setf raw-len-ulfs (increment-tilde-tags (fix-tilde-tags-for-merged-particles (len-ulfs-with-word-tags (car story)))))
	; (format t "~s~%" raw-len-ulfs)

	(setf processed-len-ulfs (mapcar #'prepare-new-ulf-for-parser raw-len-ulfs))

	(setf words-for-tags (make-hash-table :test #'equal))
	(setf tagged-ulf-words (get-elements-pred processed-len-ulfs (lambda (x) (and (symbolp x) (is-idx-tagged x)))))
	(loop for word in tagged-ulf-words do (block map-tag
		; Increment the tag by 1 for each sentence before it.
		(setf tag (get-idx-tag word))
		;(setf sent-tag (car (last (loop for mt in max-sent-tags if (>= tag mt) collect mt))))
		;(setf sent-idx (position sent-tag max-sent-tags :test #'equal))
		;(if (null sent-idx) (setf sent-idx 0))
		;(format t "tag ~d now accesses word" tag)
		;(setf tag (+ tag sent-idx))
		;(format t " ~d (incremented by ~d)~%" tag sent-idx)

		(setf (gethash tag words-for-tags) word)
	))

	; (loop for tag being the hash-keys of words-for-tags
		; do (format t "~a: ~a~%" tag (gethash tag words-for-tags)))

	(setf parse (parse-story-maybe-from-ulf-full-output (car story) processed-len-ulfs))

	(setf tok-eps (sixth parse))
	(setf tok-kas (seventh parse))
	(setf tok-inds (eighth parse))
	(setf tok-kes (tenth parse))

	; (print-ht tok-eps)
	; (format t "~s~%" (fifth parse))

	(setf frames (second story))

	;(setf frames (loop for frame in frames
		;collect (increment-frame-tags frame processed-len-ulfs)))

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

		(if *DEBUG-OUTPUT*
		(format t "frame id is ~s~%" frame-name)
		)

		(if *DEBUG-OUTPUT*
		(format t "	invoker is ~s (~d)~%" (gethash invoker-idx words-for-tags) invoker-idx)
		)

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
					(if *DEBUG-OUTPUT*
					(format t "		no ka, ke, or episode characterizes~%")
					)
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

(ldefun map-story-frames (story)
(block outer
	(setf frames-for-mapping-pair (get-frames-to-map story))
	(setf frames-for-mapping (car frames-for-mapping-pair))
	(setf parse (second frames-for-mapping-pair))
	(setf el-sents (fifth parse))
	(setf el-story (linearize-story el-sents))
	(setf el-story (loop for prop in el-story
		if (canon-prop? prop)
			collect prop))

	(if *DEBUG-OUTPUT*
	(loop for sent in (car story)
		for el-sent in el-sents do (block prs
			(format t "~s~%" sent)
			(format t "	valid:~%")
			(loop for phi in el-sent
				if (canon-prop? phi)
					do (format t "		~s~%" phi))
			(format t "	invalid:~%")
			(loop for phi in el-sent
				if (not (canon-prop? phi))
					do (format t "		~s~%" phi))
		)
	)
	)
	; (format t "~%")

	;(loop for sent in (car story)
		;do (format t "; ~s~%" sent))


	(loop for frame in frames-for-mapping
		do (print-frame frame))

	(setf schema-match-tuples (list))

	(loop for frame in frames-for-mapping do (block print-schema
		(setf map-pair (frame-to-schema frame el-story t))
		;(if (null map-pair)
			;(format t "no mapping~%"))
		(if (null map-pair)
			(return-from print-schema))

		(setf schema-template (eval (car map-pair)))
		(setf bindings (second map-pair))

		(setf bound-vars (dedupe (loop for k being the hash-keys of bindings
			collect k)))
		(setf bound-vars (remove '?e bound-vars :test #'equal))

		(if (< (length bound-vars) 1)
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

		(setf schema-match-tuples (append schema-match-tuples
			(list (list schema-template nil bindings))))

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

	(setf composite-schema (make-composite-story-schema
		(car story)
		schema-match-tuples
		el-sents))


	(setf new-header (gpt-schema-header composite-schema))

	(if (not (null new-header))
		(setf composite-schema (replace-vals
			(schema-header composite-schema)
			(list new-header '** '?E)
			composite-schema)))

	(format t "~%COMPOSITE SCHEMA:~%~%")

	(loop for sent in (car story)
		do (format t "; ~s~%" sent))
	(print-schema composite-schema)

	(format t "~%------------------~%~%~%~%")
)
)

(loop for story in (subseq (n-shuffles *ALL-STORY-FRAMES* *SEED*) start-idx (+ start-idx (min num-frames (length *ALL-STORY-FRAMES*))))
	if *HANDLE-ERRORS*
		do (handler-case (map-story-frames story)
			(error () (format t "error~%")))
	else
		do (map-story-frames story))
