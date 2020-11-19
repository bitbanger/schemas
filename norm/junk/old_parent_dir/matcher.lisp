(load "real_util.lisp")
(load "protoschemas.lisp")
(load "schema_util.lisp")
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

; TODO: consider whether this should be baked into a more
; general inference procedure for match-candidate WFFs.
(defun match-wff-with-named-episodes (wff eps bindings)
(let (
	ep-name
	ep-wff
	(norm-wff (normalize-sent wff))
	norm-ep-wff
	unify-res
	results
)
(block outer
	;(dbg 'match-wff "here~%")

	; A single WFF could mean essentially the same thing
	; as several WFFs; we encode these transformations in
	; a set of "standard" inference rules, and we try each
	; form of the WFF when matching. We're happy with the
	; first match.
	(loop for ep in eps do (block alt-loop
		(loop for alt-wff in (apply-standard-rules norm-wff)
			do (setf ep-name (car ep))
			do (setf ep-wff (second ep))
			do (setf norm-ep-wff (normalize-sent ep-wff))

			; If this is a characterizing WFF, event individuation semantics say
			; that the ep-name here can be bound to the episode it characterizes.
			do (if (char-wff? alt-wff) (block bind-ep
				(setf bind-ep (third alt-wff))
				; Clear out the ** operator and just take the underlying WFF
				(setf alt-wff (car alt-wff))
			))

			do (dbg 'match-wff "attempting to unify ~s and ~s~%" alt-wff norm-ep-wff)
			do (setf unify-res (unify-wffs alt-wff norm-ep-wff bindings))
			if (not (null unify-res))
				do (block matched-block
					(setf results (append results (list (list unify-res ep-name))))
					; bind the ep-name variable to the bind-ep individual
					(setf (gethash ep-name unify-res) bind-ep)
					; we don't mind trying to match to multiple
					; episodes, but we don't want to match to
					; multiple syntactic versions of the same
					; WFF
					(return-from alt-loop)
				)
			else
				do (dbg 'match-wff "couldn't unify~%~%")
		))
	)

	(dbg 'match-wff "returning results: ~s~%" results)
	(return-from outer results)
)
)
)

(defun match-wff-with-episodes (wff eps bindings)
	; strip the matched episode name out of each answer;
	; we only want the bindings
	(mapcar #'car
	(match-wff-with-named-episodes
		wff
		; attach a dummy name to each episode
		(loop for ep in eps
			for i from 0 to (length eps)
				collect (list (intern (format nil "dummy-name-~d" i)) ep))
		bindings)
	)
)

(defun match-wff-with-schema (wff schema bindings)
	(match-wff-with-named-episodes
		wff
		; TODO: match things other than intended episodes
		; TODO: check condition violations?
		(get-int-eps schema)
		bindings
	)
)

; An instance is a 4-element list.
; The first element is 'SCHEMA-INSTANCE. The second element
; is a schema name, the third element is a hash map of bound
; variables in the instance, and the fourth element is a list
; of 2-element lists of WFFs, where the first element of the
; each of those lists is a story WFF that was matched to the
; instance, and the second element is the NAME of the schema
; episode (e.g. ?e1) to which it was bound.
; TODO: distinguish between matching WFFs and matching episodes.
(defun match-wff-with-schema-instance (wff instance)
		; TODO: when we apply-bindings to the schema later, we may fail
		; due to some condition conflicts. This may be OK, or it may not
		; be; we don't have a good model of when/how to allow condition
		; violations right now. So we need to think of one.
(let (
	(schema-name (instance-schema-name instance))
	(bindings (instance-bindings instance))
	(matched-eps (instance-matched-wffs instance))
	match-results
	new-bindings
	matched-ep
	; result-instance
	result-instances
)
(block outer
	(setf match-results
		(match-wff-with-named-episodes
			wff
			(get-int-eps (eval schema-name))
			bindings))

	(loop for result in match-results do (block result-loop
		(setf new-bindings (car result))
		(setf matched-ep (second result))

		; If we didn't bind anything new, it's not really a match;
		; this WFF would have been generated as an inference by
		; applying the existing bindings.
		(if (ht-eq new-bindings bindings)
			(return-from result-loop)
		)
	
		(if (not (null new-bindings)) (block if-got-match
			(dbg 'match-inst "got a match for ep ~s with wff ~s~%" matched-ep wff)

			; We won't take it if we've already matched something
			; to this WFF in this instance
			(if (member matched-ep (mapcar #'second matched-eps) :test #'equal)
				(return-from if-got-match))

			(setf result-instances (append result-instances (list
				(mk-schema-instance
					schema-name
					new-bindings
					(remove-duplicates (append matched-eps (list (list wff matched-ep))) :test #'equal)))))
			(dbg 'match-inst "result instances now ~s~%" result-instances)
		))
		)
	)

	(dbg 'match-inst "returning instances ~s~%" result-instances)
	(return-from outer result-instances)
)
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
				do (loop for alt-story-ep in (apply-standard-rules story-ep)
					; do (format t "matching schema WFF ~s against alt story ep ~s~%" schema-ep alt-story-ep)
					do (setf unify-res (unify-wffs schema-ep alt-story-ep match-binds))
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
		;do (setf match-binds (match-wff-with-episodes schema-ep story match-binds))
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



