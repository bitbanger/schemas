(load "ll-load.lisp")

(ll-load "schema-util.lisp")
(ll-load "ll-util.lisp")
(ll-load "new-ulf-parser.lisp")
(ll-load "protoschemas.lisp")

(ldefun reified-event? (x)
(or
	(canon-ka? x)
	(canon-ke? x)
	(canon-that? x)
)
)

(defparameter *MAPPING-RULES* '(
	(self_motion * -> travel.v
		((?x self_mover)
			pre-arg
			self_mover
		)
		((?l1 source)
			(adv from.p)
			(source (if not event))
		)
		((?l2 goal)
			(adv to.p)
			(post-arg (1 of any))
			(goal (if not event))
		)
	)

	(motion * -> travel.v
		((?x theme)
			pre-arg
			(theme (if not event))
		)
		((?l1 source)
			(adv from.p)
			(source (if not event))
			path
		)
		((?l2 goal)
			(adv to.p)
			(post-arg (1 of any))
			(goal (if not event))
			path
		)
	)

	(bringing * -> transport_object.v
		((?x agent)
			pre-arg
			agent
		)
		((?o theme)
			(post-arg (1 of any))
			theme
		)
		((?l1 source)
			(adv from.p)
			(source (if not event))
		)
		((?l2 goal)
			(adv to.p)
			(goal (if not event))
		)
	)

	(experiencer_focus * -> enjoy_action.v
		((?x experiencer)
			pre-arg
			experiencer
		)


		((?a content) required
			(post-arg (1 of 1) (if event))
			(content (if event))
		)
	)

	(experiencer_focus * -> like.v
		((?x experiencer)
			pre-arg
			experiencer
		)


		((?o content)
			(post-arg (1 of 1) (if not event))
			(content (if not event))
		)
	)

	(ingestion * -> eat.v
		((?x ingestor)
			pre-arg
			ingestor
		)
		((?f ingestibles)
			(post-arg (1 of any))
			ingestibles
		)
	)

	(seeking * -> search.v
		((?x cognizer_agent)
			pre-arg
			cognizer_agent
		)
		((?o sought_entity)
			(adv for.p)
			sought_entity
		)
	)

	(losing * -> lose.v
		((?x owner)
			pre-arg
			owner
		)
		((?o possession)
			(post-arg (1 of any))
			possession
		)
	)

	(locating * -> find.v
		((?x perceiver)
			pre-arg
			perceiver
		)
		((?o sought_entity)
			(post-arg (1 of 1))
			(post-arg (2 of 2))
			sought_entity
		)
	)

	(have_associated * -> possess.v
		((?x topical_entity)
			pre-arg
			topical_entity
		)
		((?o entity)
			(post-arg (1 of 1))
			entity
		)
	)

	(possession * -> possess.v
		((?x owner)
			pre-arg
			(owner (if not event))
		)
		((?o possession)
			(post-arg (1 of 1))
			(possession (if not event))
		)
	)

	(retaining * -> possess.v
		((?x agent)
			pre-arg
			agent
		)
		((?o theme)
			(post-arg (1 of 1))
			(theme (if not event))
		)
	)

	(grooming * -> clean.v
		((?x agent)
			pre-arg
			agent
		)
		((?y patient)
			(post-arg (1 of 1))
			(body_part (if not event))
			(patient (if not event))
		)
	)

	(activity_stop * -> stop_activity.v
		((?x agent)
			pre-arg
			(agent (if not event))
		)
		((?a activity)
			(post-arg (1 of any) (if event))
			(activity (if event))
		)
	)

	(perception_experience * -> witness.v
		((?x perceiver_passive)
			pre-arg
			(perceiver_passive (if not event))
		)
		((?h phenomenon) required
			(post-arg (1 of any) (if event))
			(phenomenon (if event))
		)
	)

	(perception_experience * -> see.v
		((?x perceiver_passive)
			pre-arg
			(perceiver_passive (if not event))
		)
		((?y phenomenon)
			(post-arg (1 of any) (if not event))
			(phenomenon (if not event))
		)
	)

	(wearing * -> wear.v
		((?x wearer)
			pre-arg
			(wearer (if not event))
		)
		((?o clothing)
			(post-arg (1 of any))
			(clothing (if not event))
		)
	)

	(hiding_objects * -> hide.v
		((?x agent)
			pre-arg
			(agent (if not event))
		)
		((?y hidden_object)
			(post-arg (1 of any))
			pre-arg ; if no post args available
			hidden_object
		)
		((?f potential_observer)
			(adv from.p)
			(potential_observer (if not event))
		)
		((?l hiding_place)
			(adv in.p)
			(hiding_place (if not event))
		)
	)

	(placing * -> place.v
		((?x agent)
			pre-arg
			(agent (if not event))
		)
		((?y theme)
			(post-arg (1 of any))
			(theme (if not event))
		)
		((?l goal)
			(adv in.p)
			(goal (if not event))
		)
	)

	(attempt_suasion * -> request_action.v
		((?x speaker)
			pre-arg
			speaker
		)
		((?y addressee)
			addressee
			(post-arg (1 of 2))
		)
		((?a content)
			(content (if event))
			(adv for.p (if event))
		)
	)

	(request * -> request_action.v
		((?x speaker)
			pre-arg
			(speaker (if not event))
		)
		((?y addressee)
			(post-arg (1 of any) (if not event))
			(post-arg (2 of 2) (if not event))
			(addressee (if not event))
		)
		((?a message)
			(post-arg (2 of 2) (if event))
			(post-arg (1 of any) (if event))
			(message (if event))
			
		)
	)

	(departing * -> travel.v
		((?x theme)
			pre-arg
			(theme (if not event))
		)
		((?l1 source)
			(adv from.p)
			(source (if not event))
		)
		((?l2 goal)
			(adv to.p)
			(goal (if not event))
			(journey (if not event))
		)
	)

	(arriving * -> travel.v
		((?x theme)
			pre-arg
			(theme (if not event))
		)
		((?l1 source)
			(adv from.p)
			(source (if not event))
		)
		((?l2 goal)
			(adv to.p)
			(goal (if not event))
		)
	)

	(giving * -> give.v
		((?x donor)
			pre-arg
			(donor (if not event))
		)
		((?y recipient)
			(adv to.p)
			(post-arg (1 of 2))
			(recipient (if not event))
		)
		((?o theme)
			(post-arg (1 of 1))
			(post-arg (2 of 2))
			(theme (if not event))
		)
	)

	(residence * -> reside.v
		((?x resident)
			pre-arg
			(resident (if not event))
		)
		((?l location)
			(location (if not event))
		)
	)

	(earnings_and_losses lose.v -> lose.v
		((?x earner)
			pre-arg
			earner
		)
		((?o earnings)
			(post-arg (1 of 1))
			(post-arg (2 of 2))
			earnings
		)
	)

	(cause_to_fragment * -> damage.v
		((?x agent)
			pre-arg
			agent
		)
		((?y whole_patient)
			(post-arg (1 of 1))
			whole_patient
		)
	)

	(competition * -> play.v
		((?x participant_1)
			pre-arg
			participant_1
		)
		((?g competition)
			(post-arg (1 of 1))
			competition
		)
	)

	(communication_noise cry.v -> cry.v
		((?x speaker)
			pre-arg
			speaker
		)
	)

	(cotheme * -> follow.v
		((?x theme)
			pre-arg
			theme
		)
		((?y cotheme)
			(post-arg (1 of 1))
			cotheme
		)
		((?l1 source)
			(adv from.p)
			(adv out_of.p)
			source
		)
		((?l2 goal)
			(adv to.p)
			(adv into.p)
			(adv toward.p)
			goal
		)
	)

	(make_noise * -> make_noise.v
		((?x sound_source)
			pre-arg
			sound_source
		)
		((?n sound)
			sound
		)
	)

	(operate_vehicle * -> ride.v
		((?x driver)
			pre-arg
			driver
		)
		((?v vehicle)
			vehicle
		)
		((?l1 source)
			(adv from.p)
			source
		)
		((?l2 goal)
			(adv to.p)
			goal
		)
	)
))

(ldefun rule-source-frame (rule)
	(car rule)
)

(ldefun rule-source-verb (rule)
	(second rule)
)

(ldefun rule-protoschema (rule)
	(fourth rule)
)

(ldefun rule-args (rule)
	(cddddr rule)
)

(defparameter *MAPPING-RULES-BY-NAME*
	(make-hash-table :test #'equal))
(loop for rule in *MAPPING-RULES*
	do (setf (gethash (rule-source-frame rule) *MAPPING-RULES-BY-NAME*)
		(append (gethash (rule-source-frame rule) *MAPPING-RULES-BY-NAME*)
			(list rule))))

(ldefun post-arg-bounds? (x)
(and
	(listp x)
	(equal (length x) 3)
	(numberp (car x))
	(>= (car x) 1)
	(equal (second x) 'of)
	(or
		(equal (third x) 'any)

		(and (numberp (third x))
			(>= (third x) (car x))))
)
)

(ldefun rule-var (rule)
	(if (listp (car rule))
		; then
		(caar rule)
		; else
		(car rule))
)

(ldefun rule-fn-role (rule)
	(if (listp (car rule))
		; then
		(second (car rule))
		; else
		nil)
)

(ldefun frame-to-schema (frame el-story &optional use-protos return-proto-names)
(block outer
	(setf invoker-ep nil)
	(setf invoker (third (car frame)))
	(if (not (or (canon-ka? invoker) (canon-ke? invoker)))
		(setf invoker-ep (second invoker))
	)

	(setf rules (gethash (second (car frame)) *MAPPING-RULES-BY-NAME*))
	(if (null rules)
		(return-from outer nil))

	; Take the first match
	(loop for rule in rules do (block inner
		(setf res (map-frame-rule frame rule))
		(setf schema-name (car res))
		(setf bindings (second res))

		(if (null res)
			(return-from inner))

		(if (not (null invoker-ep))
			(setf (gethash '?e bindings) invoker-ep))

		(setf schema (eval schema-name))

		(setf blank-header (list))
		(setf blank-roles (list))
		; (format t "rule here is ~s~%" rule)
		(loop for arg in (rule-args rule)
			; do (format t "got ~s with mapped ~s~%" (car arg) (gethash (rule-var arg) bindings)))
			if (not (null (gethash (rule-var arg) bindings)))
				do (setf blank-roles (append blank-roles (list (list (gethash (rule-var arg) bindings) (intern (format nil "~a-~a.N" (second (car frame)) (rule-fn-role arg)))))))
			if (not (null (gethash (rule-var arg) bindings)))
				do (setf blank-header (append blank-header (list (gethash (rule-var arg) bindings)))))

		; Fix the witness.v schema with our special
		; case function, if we generated it.
		(if (equal schema-name 'witness.v)
			(setf schema (process-witness-schema
				(apply-bindings schema bindings)
				bindings
				el-story)))

		(setf new-verb nil)
		(setf invoker (third (car frame)))
		(if (and (listp invoker) (lex-verb? (car invoker)))
			(setf new-verb (car invoker)))
		(if (canon-ka? invoker)
			(setf new-verb (pred-base (second invoker))))
		(if (canon-ke? invoker)
			(setf new-verb (pred-base
				(prop-pred (second invoker)))))

		(if (not (null new-verb)) (block rename-schema
			(setf old-header (copy-item (schema-header schema)))
			(setf old-pred (schema-pred schema))
			(setf new-header (replace-vals old-pred new-verb old-header))
			(setf schema (replace-vals old-header new-header schema))
		))

		(setf blank-header (append
			(list (car blank-header)
				(intern (format nil "~a-~a" (second (car frame)) new-verb)))
			(cdr blank-header)))

		(setf blank-schema *BLANK-SCHEMA*)
		(setf blank-schema (replace-vals '(?x blank.v) blank-header blank-schema))
		(loop for rc in blank-roles
			do (setf blank-schema (add-role-constraint blank-schema rc)))

		(setf registered-schema-pair nil)
		(if (null use-protos)
			; then
			(setf registered-schema-pair (create-from-match blank-schema t))
			; else
			(setf registered-schema-pair (create-from-match
				(apply-bindings schema bindings)
				t))
		)

		(setf reg-schema-name (car registered-schema-pair))
		(setf reg-schema-bindings (second registered-schema-pair))

		(if return-proto-names
			; then
			(return-from outer (list reg-schema-name reg-schema-bindings schema-name))
			; else
			(return-from outer (list reg-schema-name reg-schema-bindings))
		)
	))

	(return-from outer nil)
)
)

(ldefun required-vars (rule)
	(dedupe (loop for rule-arg in (rule-args rule)
		if (equal (second rule-arg) 'REQUIRED)
			collect (car rule-arg)))
)

(ldefun map-frame-rule (frame rule)
(block outer
	(setf bindings (make-hash-table :test #'equal))

	(setf req-vars (required-vars rule))

	(loop for var in (mapcar #'rule-var (rule-args rule))
		do (let ((mapping (map-frame-var-rule frame var rule)))
			(if (not (null mapping))
				(setf (gethash var bindings)
					mapping))))

	(loop for req-var in req-vars
		if (null (gethash req-var bindings))
			do (return-from outer nil))

	(if (> (ht-count bindings) 0)
		(return-from outer (list (rule-protoschema rule) bindings)))

	(return-from outer nil)
)
)

(ldefun nest-pair? (cand)
(and
	(listp cand)
	(equal (length cand) 2)
	(numberp (car cand))
)
)

(ldefun map-frame-var-rule (frame var rule)
(block outer
	(setf rule-verb (rule-source-verb rule))
	(setf frame-verb (third (car frame)))
	(if (and
		(listp frame-verb)
		(> (length frame-verb) 1)
		(lex-verb? (car frame-verb)))
		; then 
		(setf frame-verb (car frame-verb))
		; else
		(setf frame-verb nil))

	(if (not (or
		(equal rule-verb '*)
		(equal rule-verb frame-verb)))
		; then
		(return-from outer nil))

	(setf our-rule (car (loop for var-rule in (rule-args rule)
		if (equal (rule-var var-rule) var)
			collect var-rule)))

	(setf rule-role (rule-fn-role our-rule))

	(setf is-req (equal (second our-rule) 'REQUIRED))
	(setf options (cdr our-rule))
	(if is-req
		(setf options (cddr our-rule)))

	(loop for option in options do (block inner
		(setf best-option-cands nil)

		(setf option-core option)
		(setf option-constraints nil)
		(if (listp option) (progn
			(setf option-core (car option))
			(setf option-constraints (cdr option))
		))

		; pre-arg
		(if (equal option-core 'pre-arg) (block do-pre-arg
			(if (not (null (second frame)))
				(setf best-option-cands (list (second frame)))
			)
		))

		; If the rule requests a post-arg, process that
		; here
		(if (equal option-core 'post-arg) (block do-post-arg
			; collect bounds
			(setf post-arg-bounds (car (loop for c in option-constraints
				if (post-arg-bounds? c) collect c)))
			(if (null post-arg-bounds)
				(return-from inner))

			; enforce bounds
			(setf post-args (third frame))
			(if (not (or
				(equal (third post-arg-bounds) (length post-args))
				(and
					(equal (third post-arg-bounds) 'any)
					(>= (length post-args) (car post-arg-bounds))
				)))
				; then
				(return-from inner))

			; select the chosen arg
			(setf best-option-cands
				(list (nth (- (car post-arg-bounds) 1)
					post-args)))
		))

		(if (equal option-core 'adv) (block do-adv
			(setf adv-type (car option-constraints))
			(setf best-option-cands (loop for pmod in (fourth frame)
				if (and (listp pmod) (equal (car (second pmod)) adv-type))
					collect (second (second pmod))))
		))

		; fallback: framenet arg name
		(if (null best-option-cands) (block do-fn-arg
			(setf best-option-cands (car (loop for fn-arg in (fifth frame)
				; if (equal (car fn-arg) option-core)
					; do (format t "collecting ~s values ~s~%" (car fn-arg) (second fn-arg))
				if (equal (car fn-arg) option-core)
					collect (second fn-arg))))
		))

		; If we haven't gotten anything by now, we just
		; can't bind this option
		(if (null best-option-cands)
			(return-from inner))

		(setf final-option-cands nil)

		(loop for cand in best-option-cands do (block filter-cands
			; Filter by "if" rules
			(setf ifs (loop for c in option-constraints
				if (and (listp c) (equal (car c) 'if))
					collect c))

			; Default to "if not event" for brevity
			(if (and (not (contains option-constraints 'ifs-ok))
				(not (contains ifs '(if event)))
				(not (contains ifs '(if not event))))
				; then
				(progn
				(setf ifs (append ifs (list '(if not event))))
				; (format t "added if not event~%")
				)
			)

			; Apply "if" rules
			(loop for ifr in ifs do (block apply-if
				(setf neg (equal (second ifr) 'not))

				; (format t "looking at cand ~s with if rule ~s~%" cand ifr)

				; handle event if rules
				(if (equal (car (last ifr)) 'event)
					(if (or (canon-ka? cand) (canon-event? cand) (nest-pair? cand))
						; then
						(if neg (return-from filter-cands))
						; else
						(if (not neg) (return-from filter-cands))
					)
				)
			))

			; Wrap frame references up so they're valid EL---
			; we'll replace them with the true references in
			; a second pass
			(if (nest-pair? cand)
				(setf cand (list 'IND cand)))

			; If we're here, add it to the final option list.
			; (format t "cand ~s mapped to FN role ~s~%" cand rule-role)
			(setf final-option-cands (append final-option-cands (list cand)))
		))

		(if (not (null final-option-cands))
			(return-from outer (car final-option-cands)))
	))
))

(ldefun bring (frame)
(block outer
	(setf frame-name (second (car frame)))

	(if (not (equal frame-name 'BRINGING))
		(return-from outer nil))

	(setf invoker-pre (second frame))
	(setf invoker-post (third frame))

	(setf invoker-mods (fourth frame))

	(setf frame-arg-map (make-hash-table :test #'equal))
	(loop for arg in (fifth frame) do (block pick-arg
		
		(block farg
		(setf frame-arg (second arg))
		(if (equal 1 (length frame-arg))
			(progn
				(setf frame-arg (car frame-arg))
				(return-from farg)))

		(setf non-event-args '(THEME GOAL AGENT))
		(setf event-args '(PURPOSE))

		(if (contains non-event-args (car arg)) (block prune
			(setf non-events (loop for cand in (second arg)
				if (not (reified-event? cand)) collect cand))

			(if (not (null non-events))
				(setf frame-arg (car non-events))
				; else
				(setf frame-arg (car (second arg))))

			(return-from farg)
		))

		(if (contains event-args (car arg)) (block prune
			(setf events (loop for cand in (second arg)
				if (reified-event? cand) collect cand))

			(if (not (null events))
				(setf frame-arg (car events))
				; else
				(setf frame-arg (car (second arg))))

			(return-from farg)
		))

		; Fallback case
		(setf frame-arg (car (second arg)))
		)

		(setf (gethash (car arg) frame-arg-map)
			frame-arg)
	))
		;do (setf (gethash (car arg) frame-arg-map)
			;(second arg)))

	(setf bindings (make-hash-table :test #'equal))

	; Bind the agent
	(if (not (null invoker-pre))
		; then
		(setf (gethash '?x bindings) invoker-pre)
		; else
		(if (not (null (gethash 'AGENT frame-arg-map)))
			; then
			(setf (gethash '?x bindings)
				(gethash 'AGENT frame-arg-map))))

	; Bind the object
	(if (equal 1 (length invoker-post))
		; then
		(setf (gethash '?o bindings)
			(car invoker-post)))

	(if (and (equal 2 (length invoker-post))
		(not (null (gethash 'THEME frame-arg-map))))
		; then
		(progn
			(setf (gethash '?o bindings)
				(gethash 'THEME frame-arg-map))
		)
	)

	(if (and
		(not (null (gethash 'GOAL frame-arg-map)))
		(not (equal (gethash 'GOAL frame-arg-map) (gethash '?o bindings)))
		(not (equal (gethash 'GOAL frame-arg-map) (gethash '?x bindings))))
		; then
		(setf (gethash '?l2 bindings)
			(gethash 'GOAL frame-arg-map)))

	(return-from outer (apply-bindings transport_object.v bindings))
)
)
