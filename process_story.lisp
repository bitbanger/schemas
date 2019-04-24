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
	(instance-tree (make-hash-table :test #'equal))
)

; NOTE: right now, we're keeping all schema instances, and all
; of them branch into multiple new instances for each potentially
; matched WFF.
; TODO: study how and when we can combine instances/mutate them
; without fear of later combinatorial retribution.
(block outer

	; use an instance hash table to dedupe
	; TODO: verify that (equals (rechash ht1) (rechash ht2)) for all pairs,
	; even when (not (equals ht1 ht2)) [this seems to be true in the REPL]
	(setf instances (make-hash-table :test #'equal))

	(setf kb (make-hash-table :test #'equal))
	(setf already-matched-wffs (make-hash-table :test #'equal))

	(loop for ep in story
			for i upto (length story)
		; do (format t "episode ~d:~%" i)

		; Add this episode's WFFs into our KB
		; (Use dummy IDs for them; they won't be rewritten)
		do (loop for orig-wff in ep
			do (loop for wff in (apply-standard-rules orig-wff)
			do (setf (gethash (rechash (list (rechash ep) (rechash (normalize-sent wff)))) kb)
				; Also use dummy triples, since they don't have instance
				; or episode IDs.
				(list nil nil (normalize-sent wff)))
			)
		)


		do (block inf-loop (loop do (block inf-loop-inner
			; set up a temp HT of new facts to add to the KB after
			(setf tmp-kb (make-hash-table :test #'equal))

			; begin a round of KB reasoning
			(loop for wff-key being the hash-keys of kb do (block continue
			(setf wff-triple (gethash wff-key kb))
			(setf wff (third wff-triple))
			(setf inst-that-gave-wff (car wff-triple))
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
				(loop for instid being the hash-keys of instances
					do (block try-instance
						(setf instance (gethash instid instances))
						(setf new-insts (match-wff-with-schema-instance wff instance))
						; (dbg 'process-story "got new-insts ~s for wff ~s~%" new-insts wff)
						(loop for new-inst in new-insts
							; if (not (null (instance-matched-wffs new-inst)))
							if (not (same-list-unordered (instance-matched-wffs new-inst) (instance-matched-wffs instance)))
							do (block inner
									; (format t "got new-inst ~s for wff ~s~%" (rechash (instance-matched-wffs new-inst)) (rechash (instance-matched-wffs instance)))
									; we'll keep the old instances for now, in case filling these
									; WFFs in is erroneous
									; (setf tmp-new-instances (append tmp-new-instances (list new-inst)))
	
									; we use the rechash of the instance as the key because
									; the instance itself contains a hash table, and rechash
									; seems to handle hash table equality better than whatever
									; hash function the built-in hash table with :test #'equal
									; does
									(setf (gethash (instance-id new-inst) tmp-new-instances) new-inst)

									; Log the fact that the new instance came from the old instance

									; (We might have to create the nested HT first)
									(if (null (gethash instid instance-tree))
										(setf (gethash instid instance-tree) (make-hash-table :test #'equal)))

									(setf (gethash (instance-id new-inst) (gethash instid instance-tree)) t)
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
						; (dbg 'process-story "got new-insts ~s for wff ~s~%" new-insts wff)
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

						; (format t "new inst: ~s~%" new-inst)

						(if (instance-fulfilled? new-inst)
						; then
						(loop for inf-fact in (inferred-wffs new-inst t)
							; do (format t "inf-fact: ~d~%" inf-fact)
							do (setf (gethash
								; hash key (combo of instance ID + fact ID)
								(rechash (list (instance-id new-inst) (car inf-fact)))
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
				; do (setf (gethash new-fact-id kb) (gethash new-fact-id tmp-kb))
			)
			; else
			(return-from inf-loop)
		)


		)))








		; do (format t "~%~%")
		; do (format t "~%~%")
		; (format t "FINAL INFERRED FACTS:~%")
		(loop for factid being the hash-keys of kb
			do (block kbloop
				(setf fact (gethash factid kb))
				(setf instid (if (car fact) (car fact) "STORY"))
				(setf epid (if (second fact) (second fact) "N/A")) ; TODO: actually extract the ep ID here

				(if (equal instid "STORY")
					(return-from kbloop))

				(setf wff (third fact))
				; (format t "	~s ~s ~s~%~%" instid epid wff)
			)
		)
		; do (format t "~%~%")


	)


		(setf best-match nil)
		(setf best-points 0)
		(setf best-ep-points 0)

		(loop for instid being the hash-keys of instances do (block print-inst-loop
			(setf inst (gethash instid instances))
			(setf points 0)
			;(format t "~%~%")
			;(format t "bindings: ~s~%" (ht-to-str (instance-bindings inst)))

			;(print-schema (apply-bindings (eval (instance-schema-name inst)) (instance-bindings inst)))
			(setf rendered-best (apply-bindings (eval (instance-schema-name best-match)) (instance-bindings best-match)))
			(setf rendered-inst (apply-bindings (eval (instance-schema-name inst)) (instance-bindings inst)))
			
			; You get a point for each binding you have.
			(setf points (+ points (hash-table-count (instance-bindings inst))))

			; You get a point for each consistent episode relation, and lose a point for each inconsistent episode relation.
			; This gets normalized by the number of unique episodes being related.
			(setf ep-points 0)
			(setf unique-eps (list))
			(loop for ep-rel in (mapcar #'second (get-ep-rels rendered-inst))
				do (block erb
					; neutral points for an unfilled relation
					(if (has-element-pred ep-rel #'lex-schema-ep-var?) (return-from erb))

					(push (car ep-rel) unique-eps)
					(push (third ep-rel) unique-eps)

					(if (consistent-ep-rel? ep-rel)
						(progn
							; (format t "~d is consistent~%" ep-rel)
							(setf ep-points (+ ep-points 1))
						)
						; else
						(progn
							; (format t "~d is inconsistent~%" ep-rel)
							(setf ep-points (- ep-points 1))
						)
					)
				)
			)

			(setf unique-eps (remove-duplicates unique-eps :test #'equal))
			; (format t "~d ep points~%" ep-points)
			(if (> 0 (length unique-eps))
				(setf ep-points (/ ep-points (length unique-eps)))
			)
			(setf points (+ points ep-points))


			; TODO: other point contributors, like proved constraints?

			(if (> points best-points)
				(progn
					(setf best-match inst)
					(setf best-points points)
					(setf best-ep-points ep-points)
				)
			)
			

			; (format t "instance ~d: ~d (fulfilled? ~s)~%~%" instid (instance-to-str inst) (instance-fulfilled? inst))
		))


		(format t "~%~%")


		(format t "story:~%~d~%~%" play-sand)
		(format t "subject pronouns dereferenced to last concrete subject:~%~d~%~%" (deref-subj-pronouns play-sand))


		(format t "~%~%")
		(format t "BEST SCHEMA MATCH:~%	(~d points; ~d from # of consistent temporal constraints, ~d from # of bound variables)~%~%" best-points best-ep-points (- best-points best-ep-points))

		(setf rendered-best-match (apply-bindings (eval (instance-schema-name best-match)) (instance-bindings best-match)))

		(print-schema rendered-best-match)

		(format t "~%")

		(format t "BINDINGS:~%~d~%" (tab-all-lines 1 (ht-to-str (instance-bindings best-match))))
		(format t "~%")



		; do generalizations here
		; TODO: how safe to generalize constants if we include all constraints?
		; TODO: and when can we ignore constraints? I guess that's part of generalizing
		(format t "UNIQUE TERMS:~%")
		(setf unique-term-facts (make-hash-table :test #'equal))
		(loop for const in (extract-schema-consts rendered-best-match)
			do (block constloop
				(format t "	~d~%" const)
				(setf (gethash const unique-term-facts) (list))

				(format t "		ATEMPORAL CONSTRAINTS ON ~d:~%" const)
				(loop for factid being the hash-keys of kb do (block factloop
					(setf fact (gethash factid kb))
					(setf fact-wff (third fact))

					; TODO: temporal knowledge could be useful here, too, but
					; determining its relation to the temporal events of the schema
					; is beyond our current capabilities (need to implement AIA).
					(if (not (atemporal fact-wff))
						(return-from factloop))

					(if (has-element fact-wff const)
						(progn
							(push fact-wff (gethash const unique-term-facts))
							(format t "			~d~%" fact-wff)
						)
					)
				))
		))


		; replace constants w/ vars
		(setf sk-var-num 0)
		(setf fact-num 0)
		(loop for ut being the hash-keys of unique-term-facts do (block utblock
			(setf ut-facts (gethash ut unique-term-facts))
			(setf skvarname (intern (concat-strs "?SK" (format nil "~d" sk-var-num))))
			(setf sk-var-num (+ 1 sk-var-num))

			(setf rendered-best-match (replace-vals ut skvarname rendered-best-match))

			(loop for ut-fact in ut-facts do (block utfactblock
				(setf new-constr-id (intern (concat-strs "!SKR" (format nil "~d" fact-num))))
				(setf fact-num (+ 1 fact-num))
				(setf new-fact (replace-vals ut skvarname ut-fact))

				(pusha new-constr-id (get-section rendered-best-match ':Nonfluent-conds))

				(if (mp new-fact (list 'term? 'noun?))
					(progn
						(setf ont-anc-args (ont-ancestors (second new-fact)))
						(push 'GEN-HIERARCHY ont-anc-args)
						(setf new-fact (list (car new-fact) ont-anc-args))
					)
					; else
				)
				(pusha new-fact (get-section rendered-best-match ':Nonfluent-conds))

			))

		))


		(format t "~%")

		(format t "GENERALIZED SCHEMA:~%~%")
		(setf *PRINT-PRETTY* NIL)
		(print-schema rendered-best-match)


	(if nil
	(block output-graph
		; Output the instances and facts into Graphviz format.
		(format t "digraph {~%")
		(loop for instid being the hash-keys of instances do
		(format t "	~s [label=< <B>~d: ~s</B> <br /> <br /> ~d >,fillcolor=~d,style=filled];"
			instid
			; (if (instance-fulfilled? (gethash instid instances)) "FULFILLED" "unfulfilled")
			""
			; instid
			(car (split-str instid "."))
			(join-str-list "<br /><br />" (mapcar (lambda (x) (replace-all (format nil "<B>~d</B>     ~d" (second x) (car x)) "(" "<br />  (")) (instance-matched-wffs (gethash instid instances))))
			(if (instance-fulfilled? (gethash instid instances)) "green" "red")
		)
		)

		; Draw instance parent->child edges.
		(loop for instid being the hash-keys of instance-tree
			do (block drawtreeloop
				(loop for child being the hash-keys of (gethash instid instance-tree) do (block drawtreeloop-inner
					(format t "	~s -> ~s [label=< <B>became instance</B> >];~%" instid child)
				))

			)
		)

		(loop for instid being the hash-keys of instances
			do (block drawmatchloop
				; Draw matched WFF->instance edges.
				(loop for matched-wff in (instance-matched-wffs (gethash instid instances)) do (block drawmatchloop-inner
					; (format "~s LOL ~s;~%" (second matched-wff) instid)
					(format t "	~s [label=< ~d >];~%" (format nil "~s" (car matched-wff)) (remove-prefix (replace-all (format nil "~d" (car matched-wff)) "(" "<br />  (") "<br />"))
					(format t "	~s -> ~s [label=< <B>matched to</B> >];~%" (format nil "~s" (car matched-wff)) instid)
				))
			)
		)

		; Draw schema -> inference lines.
		(loop for factid being the hash-keys of kb do (block factloop2
			(setf fact (gethash factid kb))
			(setf instid (if (car fact) (car fact) "STORY"))
			(setf epid (if (second fact) (second fact) "N/A")) ; TODO: actually extract the ep ID here

			(if (equal instid "STORY")
				(return-from factloop2))

			(setf wff (third fact))
			; (format t "	~s ~s ~s~%~%" instid epid wff)
			(format t "	~s [label=< ~d >];~%" (format nil "~s" wff) (remove-prefix (replace-all (format nil "~d" wff) "(" "<br />  (") "<br />"))
			(format t "	~s -> ~s [label=< <B>generated inference</B> >];~%" instid (format nil "~s" wff))
		))

		(format t "}~%")
	)


)
)
)
)


;(process-story may-story)
;(process-story play-sand)
(process-story (deref-subj-pronouns play-sand))
;(format t "~d~%" play-sand)
;(format t "~d~%" (deref-subj-pronouns play-sand))
