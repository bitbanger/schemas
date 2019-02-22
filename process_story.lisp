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

; NOTE: right now, we're keeping all schema instances, and all
; of them branch into multiple new instances for each potentially
; matched WFF.
; TODO: study how and when we can combine instances/mutate them
; without fear of later combinatorial retribution.
(block outer

	; use an instance hash table to dedupe
	; TODO: verify that (equals (sxhash ht1) (sxhash ht2)) for all pairs,
	; even when (not (equals ht1 ht2)) [this seems to be true in the REPL]
	(setf instances (make-hash-table :test #'equal))

	(setf kb (make-hash-table :test #'equal))
	(setf already-matched-wffs (make-hash-table :test #'equal))

	(loop for ep in story
			for i upto (length story)
		do (format t "episode ~d:~%" i)

		; Add this episode's WFFs into our KB
		; (Use dummy IDs for them; they won't be rewritten)
		do (loop for wff in ep
			do (setf (gethash (sxhash (list (sxhash ep) (sxhash wff))) kb)
				; Also use dummy triples, since they don't have instance
				; or episode IDs.
				(list nil nil wff))
		)


		do (block inf-loop (loop do (block inf-loop-inner
			; set up a temp HT of new facts to add to the KB after
			(setf tmp-kb (make-hash-table :test #'equal))

			; begin a round of KB reasoning
			(loop for wff-key being the hash-keys of kb do (block continue
			(setf wff-triple (gethash wff-key kb))
			(setf wff (third wff-triple))
			; don't reason about things we've seen
			(if (not (null (gethash wff-triple already-matched-wffs)))
				(return-from continue))

			; mark this as seen
			(setf (gethash wff-triple already-matched-wffs) t)

			; find candidate schemas
			(block schema-loop
				; Try to match the WFF to each of the
				; current schema instances.
				(setf tmp-new-instances (make-hash-table :test #'equal))
				; (loop for instance in instances
				(loop for instid being the hash-keys of instances
					do (block try-instance
						(setf instance (gethash instid instances))
						(setf new-insts (match-wff-with-schema-instance wff instance))
						(dbg 'process-story "got new-insts ~s for wff ~s~%" new-insts wff)
						(loop for new-inst in new-insts
							do (if (not (null (instance-matched-wffs new-inst)))
								; then
								; we'll keep the old instances for now, in case filling these
								; WFFs in is erroneous
								; (setf tmp-new-instances (append tmp-new-instances (list new-inst)))

								; we use the sxhash of the instance as the key because
								; the instance itself contains a hash table, and sxhash
								; seems to handle hash table equality better than whatever
								; hash function the built-in hash table with :test #'equal
								; does
								(setf (gethash (instance-id new-inst) tmp-new-instances) new-inst)
								; else
							)
						)
					)
				)
				

				; Try to instantiate a new version of
				; each protoschema as well.
				(setf cand-schemas nil)
				(loop for ps in *PROTOSCHEMAS*
					do (block try-schema
						(dbg 'process-story "wff: ~s~%" wff)
						(dbg 'process-story "matching with instance of ~s~%" (schema-name ps))
						(setf new-insts (match-wff-with-schema-instance wff (new-schema-instance (schema-name ps))))
						(dbg 'process-story "got new-insts ~s for wff ~s~%" new-insts wff)
						(loop for new-inst in new-insts do (block try-new-inst
							(dbg 'process-story "got ~s~%" (instance-to-str new-inst))
							; (if (null match-bindings) (return-from try-schema))
							(if (not (null (instance-matched-wffs new-inst)))
								; then
								(block new-match
									; (setf tmp-new-instances (append tmp-new-instances (list new-inst)))
									(setf (gethash (instance-id new-inst) tmp-new-instances) new-inst)
									(dbg 'process-story "appending new instance to tmp~%")
								)
							)
							(dbg 'process-story "matched schema WFFs: ~s~%" (matched-wffs ps match-bindings))
							(dbg 'process-story "matched schema WFFs: ~s~%" (ht-to-str (matched-wffs ps match-bindings)))
						))
					)
				)

				; (setf instances (append instances tmp-new-instances))
				; Add all temporary instances to the final list.
				(loop for instid being the hash-keys of tmp-new-instances
					do (setf (gethash instid instances) (gethash instid tmp-new-instances))
				)
				(setf tmp-new-instances (make-hash-table :test #'equal))
				(dbg 'process-story "instances is now ~s~%" instances)

				; Go through all of our current schema instances.
				; Any fulfilled instances happened by definition;
				; we can add their inferences to the KB.
				(loop for instid being the hash-keys of instances
					do (block infer-loop
						(setf new-inst (gethash instid instances))

						(format t "new inst: ~s~%" new-inst)

						(if (instance-fulfilled? new-inst)
						; then
						(loop for inf-fact in (inferred-wffs new-inst t)
							do (setf (gethash
								; hash key (combo of instance ID + fact ID)
								(sxhash (list (instance-id new-inst) (car inf-fact)))
								; hash table (the temporary knowledge base)
								tmp-kb)
									; val to insert (instance ID + fact ID + fact)
									(append (list (instance-id new-inst)) inf-fact))
						))
					)
				)

				; (setf instances (append instances tmp-new-instances))
			)
		))

		; if we added any new facts, put them in the KB;
		; otherwise, we're done for this episode
		(if (> (hash-table-count tmp-kb) 0)
			; then
			(loop for new-fact-id being the hash-keys of tmp-kb
				do (setf (gethash new-fact-id kb) (gethash new-fact-id tmp-kb))
			)
			; else
			(return-from inf-loop)
		)


		)))

		(loop for instid being the hash-keys of instances do (block print-inst-loop
			(setf inst (gethash instid instances))
			(format t "instance ~d: ~d (fulfilled? ~s)~%~%" instid (instance-to-str inst) (instance-fulfilled? inst))
		))
		do (format t "~%~%")
		do (format t "~%~%")
		(format t "FINAL INFERRED FACTS:~%")
		(loop for factid being the hash-keys of kb
			do (block kbloop
				(setf fact (gethash factid kb))
				(setf instid (if (car fact) (car fact) "STORY"))
				(setf epid (if (second fact) (second fact) "N/A")) ; TODO: actually extract the ep ID here

				(if (equal instid "STORY")
					(return-from kbloop))

				(setf wff (third fact))
				(format t "	~s ~s ~s~%~%" instid epid wff)
			)
		)
		do (format t "~%~%")
	)


)
)
)


(process-story may-story)
