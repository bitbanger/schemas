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

	(loop for ep in story
			for i upto (length story)
		do (format t "episode ~d:~%" i)

		do (loop for wff in ep


			; find candidate schemas
			do (block schema-loop
				(setf cand-schemas nil)
				(loop for ps in *PROTOSCHEMAS*
					do (block try-schema
						(dbg 'process-story "wff: ~s~%" wff)
						(setf match-bindings (match-wff-with-schema wff ps nil))
						(dbg 'process-story "got ~s~%" match-bindings)
						(if (null match-bindings) (return-from try-schema))
						(dbg 'process-story "matched schema WFFs: ~s~%" (matched-wffs ps match-bindings))
						(dbg 'cur1 "matched schema WFFs: ~s~%" (ht-to-str (matched-wffs ps match-bindings)))
					)
				)
			)
		)

		do (format t "~%~%")
	)

)
)
)

(process-story may_story)
