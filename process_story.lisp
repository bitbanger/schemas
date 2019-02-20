(load "stories.lisp")
(load "matcher.lisp")
(load "protoschemas.lisp")

; TODO:
;	- figure out when an episode is "fulfilled"
;	- write a function filled-schema-to-episode
;		(should produce canonicalized eps as outputs)
;		(should only do fully-filled WFFs; if we match
;		more WFFs in this same schema later, it can
;		update its associated episode automatically...so
;		the schema instance<->ep name mapping should be
;		deterministic)
;	- throw that episode into our KB at the time in the
;		story we matched it (eventually, episode relations
;		may indicate the actual set of facts to throw in,
;		rather than just the whole schema as one episode)
;	- once matched schema facts are added to the KB, figure
;		out when we'll try to match THOSE to other schemas
;			(probably immediately?)
(defun process-story (story)
	; We'll go through the story, episode by episode, and start filling
	; in schemas. We'll keep candidate schemas for about two episodes
	; before abandoning them, unless they get another match. If a schema
	; is fully "characterized", we'll keep it no matter what.

(let (
	(cand-schemas nil)
	(match-bindings nil)
)

(block outer

	; OPT: make sure schema instances are being hashed
	; uniquely, but efficiently. How does :test work?
	(setf instances (list))
	(setf kb (make-hash-table :test #'equal))
	(setf already-matched-wffs (make-hash-table :test #'equal))

	(loop for ep in story
			for i upto (length story)
		do (format t "episode ~d:~%" i)

		; Add this episode's WFFs into our KB.
		do (loop for wff in ep
			do (setf (gethash wff kb) t)
		)

		do (loop for wff being the hash-keys of kb do (block continue
			; don't reason about things we've seen
			(if (not (null (gethash wff already-matched-wffs)))
				(return-from continue))

			; mark this as seen
			(setf (gethash wff already-matched-wffs) t)

			; find candidate schemas
			(block schema-loop
				; Try to match the WFF to each of the
				; current schema instances.
				(setf tmp-new-instances (list))
				(loop for instance in instances
					do (block try-instance
						(setf new-insts (match-wff-with-schema-instance wff instance))
						(dbg 'process-story "got new-insts ~s~%" new-insts)
						(loop for new-inst in new-insts
							do (if (not (null (instance-matched-wffs new-inst)))
								; then
								; we'll keep the old instances for now, in case filling these
								; WFFs in is erroneous
								(setf tmp-new-instances (append tmp-new-instances (list new-inst)))
								; else
							)
						)
					)
				)

				(setf instances (append instances tmp-new-instances))
				(setf tmp-new-instances (list))
				

				; Try to instantiate a new version of
				; each protoschema as well.
				(setf cand-schemas nil)
				(loop for ps in *PROTOSCHEMAS*
					do (block try-schema
						(dbg 'process-story "wff: ~s~%" wff)
						(dbg 'process-story "matching with instance of ~s~%" (schema-name ps))
						(setf new-insts (match-wff-with-schema-instance wff (new-schema-instance (schema-name ps))))
						(dbg 'process-story "got new-insts ~s~%" new-insts)
						(loop for new-inst in new-insts do (block try-new-inst
							(dbg 'process-story "got ~s~%" (instance-to-str new-inst))
							; (if (null match-bindings) (return-from try-schema))
							(if (not (null (instance-matched-wffs new-inst)))
								; then
								(progn (setf tmp-new-instances (append tmp-new-instances (list new-inst))) (dbg 'process-story "appending new instance to tmp~%"))
							)
							(dbg 'process-story "matched schema WFFs: ~s~%" (matched-wffs ps match-bindings))
							(dbg 'process-story "matched schema WFFs: ~s~%" (ht-to-str (matched-wffs ps match-bindings)))
						))
					)
				)

				(setf instances (append instances tmp-new-instances))
				(dbg 'process-story "instances is now ~s~%" instances)
			)
		))

		(loop for inst in instances for i from 0 do (block print-inst-loop
			(format t "instance ~d: ~d~%~%" i (instance-to-str inst))
		))
		do (format t "~%~%")
	)


)
)
)


(process-story may-story)
