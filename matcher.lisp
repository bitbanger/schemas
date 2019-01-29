(load "protoschemas.lisp")

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
		(format t "episode: ~s~%" ep)
		(setf ep_name (car ep))
		(setf episode (second ep))
	)
)

(defun verb-wff-to-do-wff (wff)
	(list
		(car wff) ; same agent
		'do2.v    ; verb is now "do"
		(list
			'ka ; reify the verb predicate for the match
			    ; TODO: figure out whether we should skolemize it?

			(if (equal 1 (length (cddr wff))) ; add the original VP in
				(caddr wff)
				(cddr wff)
			)
		)
		
	)
)

(defun verb-wff? (wff)
	(and
		; prevent infinite transformations of "do"-stacking
		(not (do-wff? wff))

		(verbp (second wff))
	)
)

(defun do-wff? (wff)
	(equal
		'do2.v
		(second wff)
	)
)

(defun match-wff (wff1 wff2)
	(cond
		(
			; we special-case verb WFFs with "do kind of activity" WFFs
			(or (and (verb-wff? wff1) (do-wff? wff2)) (and (do-wff? wff1) (verb-wff? wff2)))

			(if (verb-wff? wff1)
				(match-wff (verb-wff-to-do-wff wff1) wff2)

				; else
				(match-wff wff1 (verb-wff-to-do-wff wff2))
			)
		)


		(t
			; normal matching here
		)
	)
)

(match-story-with-schema nil do_for-pleasure.v)
