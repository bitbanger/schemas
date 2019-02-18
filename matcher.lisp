(load "real_util.lisp")
(load "protoschemas.lisp")
(load "inference.lisp")

; CURRENT ASSUMPTIONS:
; 	1. The schema's intended episodes are all simultaneous
; 	2. The story's episodes are consecutive (though effects may endure)

; We're trying to match the intended episodes of the schema with episodes in
; the story.

; Although the story's episodes are consecutive, effects stated in earlier
; episodes may persist (via axioms about those things) until and unless
; negated in a later episode. Thus, they may be implicitly considered part
; of later episodes.

; When matching a schema episode with a candidate episode in the story,
; we apply a variety of inference rules. For example, if the story says (MOTHER5.SK GIVE-TO.V SHE.PRO KITTEN6.SK), but the schema says (?x do2.v (kind1-of.n activity1.n)), we have an inference rule that any (<individual> <verb>.v <args...>) story episode can be matched to the schema as the semantically equivalent (<individual> do2.v (ka <verb>.v <args...>)).
(defun match-story-with-schema (story schema)
	(loop for ep in (get-int-ep schema) do
		; (format t "episode: ~s~%" ep)
		(setf ep_name (car ep))
		(setf episode (second ep))
	)
)

(defun extract-vars-wff (wff)
	(loop for e in wff
		if (varp e) append (list e)
		else if (listp e) append (extract-vars-wff e)
	)
)

(defun extract-vars (wffs)
	(remove-duplicates (loop for wff in wffs
		append (extract-vars-wff wff)
	) :test #'equal)
)

; mk-unbound-var-constraints returns a hash table of
; variable constraints for each variable in a list
; of WFFs. Each constraint specifies that any value
; bound to the variable must be equal to any pre-bound
; value for that same variable in this given bindings
; table.
(defun mk-unbound-var-constraints (wffs bindings)
(block outer
	(setf constrs (make-hash-table :test #'equal))

	(loop for var in (extract-vars wffs)
		do (setf (gethash var constrs)
			; When we match, only allow bindings that don't contradict
			; the bindings we know right now, before the match.
			(lambda (x)
				(or
					(null (gethash var bindings))
					(equal x (gethash var bindings))
				)
			)
		)
	)

	(return-from outer constrs)
)
)

; unifying two WFFs can be done using our match-formula function
; from the inference code, with a constraint predicate on every
; variable to ensure it wasn't bound already in the same schema.
; TODO allow matches for synonyms, generalized predicates, etc. Allow that to affect match scores?
(defun unify-wffs (wff1 wff2 bindings)
(block outer
	(match-formula-with-bindings wff1 wff2 nil bindings)
)
)


(defun match-wff-with-episodes (wff eps bindings)
(block outer
	; A single WFF could mean essentially the same thing
	; as several WFFs; we encode these transformations in
	; a set of "standard" inference rules, and we try each
	; form of the WFF when matching. We're happy with the
	; first match.
	; TODO: consider whether this should be baked into a more
	; general inference procedure for match-candidate WFFs.
	(loop for alt-wff in (apply-standard-rules (normalize-sent wff)) do
		(loop for ep in eps
			do (dbg 'match-wff "unifying ~s and ~s~%" (normalize-sent wff) (normalize-sent ep))
			do (setf unify-res (unify-wffs alt-wff (normalize-sent ep) bindings))
			if (not (null unify-res))
				do (return-from outer unify-res)
			else
				do (dbg 'match-wff "couldn't unify~%~%")
		)
	)
)
)

(defun match-wff-with-schema (wff schema bindings)
	(match-wff-with-episodes
		wff
		; TODO: match things other than intended episodes
		; TODO: check condition violations?
		(mapcar #'second (get-int-ep schema))
		bindings
	)
)

; TODO: "match scores". Matching a "do2.v (kind1-of.n activity1.n)" to some random verb proposition should be an extremely weak signal of a match. More specific predicate matches, or the satisfaction of other conditions, could help.
; For matching the "do for pleasure" protoschema, probably the strongest match you could get is if you had an explicit statement in the story of a kind of pleasure. But, in general, it's not an incredibly useful protoschema to try and match---you'll seldom rule it out or find explicit confirmation of it, and there aren't really enough propositions within to offer more granular levels of uncertainty.
(defun match-story-with-schema (story schema)
(let ((match-binds nil) (unify-res nil))
(block outer
	(loop for schema-ep in (mapcar #'second (get-int-ep schema))
		do (block story-loop
			(loop for story-ep in story
				do (loop for alt-story-ep in (apply-standard-rules (normalize-sent story-ep))
					; do (format t "matching schema WFF ~s against alt story ep ~s~%" (normalize-sent schema-ep) alt-story-ep)
					do (setf unify-res (unify-wffs (normalize-sent schema-ep) alt-story-ep match-binds))
					if (not (null unify-res))
					do (block innermore
					; (format t "we matched! updating bindings~%")
					; we've bound a schema ep to a story ep; update the match bindings and try the next schema ep
						(setf match-binds unify-res)
						(return-from story-loop unify-res)
					)
				)
			)
		)
	)



		; do (format t "on schema ep ~s~%" schema-ep)
		;do (setf match-binds (match-wff-with-episodes (normalize-sent schema-ep) story match-binds))
		;if (null match-binds)
		; do (format t "couldn't bind schema WFF ~s~% to story" schema-ep)
		; else do (block inner
			;(format t "current bindings:~%")
			;(print-ht match-binds)
		;)
	;)
	; (print-ht match-binds)
	(format t "final ~s schema match on story:~%~%" (schema-name schema))
	(print-schema (apply-bindings schema match-binds)))
	; (format t "final schema:~%~%~s~%~%" match-binds)
)
)



