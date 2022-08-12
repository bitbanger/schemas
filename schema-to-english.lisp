(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "ll-util.lisp")
(ll-load "schema-util.lisp")
(ll-load "schema-expansion.lisp")
(ll-load "new-ulf-parser.lisp")

(ldefun schema-var-types (schema &optional include-ownership)
(block outer
	; Get all vars typed in the roles section
	(setf typed-vars
		(loop for rc in (section-formulas (get-section schema ':Roles))
			if (equal 2 (length (second rc)))
				; then
				collect (car (second rc))))

	; ...And their constraints
	(setf constrs (mapcar #'second (schema-terms-type-constraints schema typed-vars include-ownership)))

	; Get all types of vars in nested schemas, too
	(loop for st in (section-formulas (get-section schema ':Steps))
		do (block expand
			(setf res nil)

			(handler-case
				(setf res (expand-nested-schema st schema))
				(error () nil))

			(if (null res)
				(return-from expand))

			; The variables in the expanded schema that share
			; scope with this parent include those that were
			; bound by the hash map, and all those in the
			; invoking formula (those may not have been bound
			; explicitly, if they already shared a name, for
			; example).
			(setf shared-vars (union
				; Bound vars
				(loop for k being the hash-keys of (second res)
					collect (gethash k (second res)))
				; Vars in invoker
				(get-elements-pred (second st) #'varp)
				:test #'equal))

			; Actually, we don't care about episode variables.
			(setf shared-vars (set-difference
				shared-vars
				(list (car st))
				:test #'equal))

			; Now get the constraints on those variables
			; from the subschema
			(setf constrs (append constrs (mapcar #'second (schema-terms-type-constraints 
				(apply-bindings (car res) (second res))
				shared-vars
				include-ownership))))
		)
	)

	(setf var-types (make-hash-table :test #'equal))
	(loop for c in (dedupe constrs)
		do (setf (gethash (car c) var-types)
			(append (gethash (car c) var-types)
				(list (second c)))))

	(return-from outer var-types)
)
)

(ldefun interesting-schema-var-types (schema)
(block outer
	(setf types (schema-var-types schema))

	(setf interesting-types (make-hash-table :test #'equal))

	(loop for var being the hash-keys of types do (block l1
		(setf var-types (gethash var types))

		; Remove some uninteresting designations from
		; the "interesting" set.
		(setf interesting-var-types
			(loop for e in var-types
				if (and (noun-pred? e) (not (member e '(LOCATION.N DESTINATION.N OBJECT.N ENTITY.N PHYSICAL_ENTITY.N) :test #'equal)))
					collect e))

		(if (> (length interesting-var-types) 0)
			; then
			; (return-from outer (car (last interesting-var-types)))
			(setf (gethash var interesting-types)
				(car (last interesting-var-types)))
			; else
			(setf (gethash var interesting-types)
				(car (last var-types)))
	)))

	(return-from outer interesting-types)
)
)

(ldefun refloat-modifiers (phi)
	(append
		(prop-pre-args phi)
		(list (append
			(prop-pred-with-post-args phi)
			(prop-mods phi))))
)

(ldefun hyphenate-syms (syms)
	(intern (join-str-list "-" (mapcar #'princ-to-string syms)))
)

(ldefun merge-possessives (sent)
(block outer
	(remove '\'S (loop for i from 0 to (- (length sent) 1)
		if (and (< i (- (length sent) 1))
			(equal (nth (+ i 1) sent) '\'S))
			; then
			collect (intern (concat-strs
				(string (nth i sent))
				(string (nth (+ i 1) sent))))
		else
			collect (nth i sent)) :test #'equal)
)
)

(ldefun schema-to-english (schema &optional include-header)
(block outer
	; First, get the schema's steps
	(setf steps (mapcar #'second
		(section-formulas (get-section schema ':Steps))))

	(if include-header
		(setf steps (append (list (car (schema-header schema))) steps)))

	; Next, move all of their modifiers to float at the ends
	; of the verb predicates.
	(setf steps (mapcar #'refloat-modifiers steps))

	; Add ownership markings to all variables.
	(setf var-types-with-owners (schema-var-types schema t))
	(setf var-owners (make-hash-table :test #'equal))
	(loop for var being the hash-keys of var-types-with-owners
		do (loop for c in (gethash var var-types-with-owners)
			if (has-element c 'PERTAIN-TO)
				do (setf (gethash var var-owners) (second c))
			if (has-element c 'PERTAIN-TO)
				do (setf steps (replace-vals
					var
					(list var 'OF.N (second c))
					steps))))

	; Pull out adjectives
	(setf var-adjs (make-hash-table :test #'equal))
	(loop for var being the hash-keys of var-types-with-owners
		do (setf (gethash var var-adjs)
			(dedupe (append (gethash var var-adjs)
				(loop for tp in (gethash var var-types-with-owners)
					if (adj-pred? tp) collect tp)))))

	; Replace each var with (THE.D <VAR>), unless
	; it's possessed by another entity.
	(loop for var being the hash-keys of var-types-with-owners
		if (null (gethash var var-owners))
			do (setf steps (replace-vals
				var
				(list 'THE.D var)
				steps)))

	; Replace the first occurrence of each (THE.D <VAR>)
	; with (A.D <VAR>), and add adjectives.
	(loop for var being the hash-keys of var-types-with-owners
		do (block a-ify-thes
			(setf the-idcs (get-elements-pred-idx
				steps
				(lambda (x) (and
					(listp x)
					(equal 2 (length x))
					(equal (car x) 'THE.D)
					(equal (second x) var)))))

			(setf new-val (list 'A.D var))
			(if (> (length (gethash var var-adjs)) 0)
				(setf new-val (flatten (list
					'A.D
					(gethash var var-adjs)
					var))))

			; Find the THE with the smallest index...
			(setf first-the-idx (min-all the-idcs))

			; ...and replace it.
			(setf steps (replace-element-idx
				steps first-the-idx
				new-val))
		)
	)

	; Get the type predicates for each variable
	; and substitute them in.
	(setf types (interesting-schema-var-types schema))
	(loop for var being the hash-keys of types
			do (setf steps (replace-vals var (gethash var types) steps))
	)

	; Replace the EL-valid OF.N syntax with an apostophe-S
	; syntax.
	(setf steps (ttt-replace steps
		'(_!1 OF.N _!2)
		'(_!2 \'S _!1)))

	; Note all the tree indices of schema-invoking
	; predicates.
	(setf schema-sym-idcs (get-elements-pred-idx steps #'schema-match-pred?))

	; Replace all symbols with their undotted versions.
	(setf all-syms (dedupe (get-elements-pred steps #'symbolp)))
	(loop for sym in all-syms
		do (setf steps (replace-vals
				sym
				(intern (car (split-str (string sym) ".")))
				steps)))

	; Replace all the schema-invoking predicates, at
	; the remembered indices, with bracketed versions.
	(loop for schema-idx in schema-sym-idcs
		do (setf steps (replace-element-idx steps
			schema-idx
			(intern (concat-strs
						"<" (string (get-element-idx steps schema-idx)) ">")))))

	; Remove type shifters.
	(setf steps (ttt-replace steps
		'((!1 lex-removable-for-english?) _!2)
		'_!2))

	; Replace AGENT with PERSON.
	(setf steps (replace-vals 'AGENT 'PERSON steps))

	; Replace KA with TO.
	(setf steps (replace-vals 'KA 'TO steps))

	; Replace (PLUR <VAR>) with <VAR>s.
	(setf plurs (get-elements-pred steps (lambda (x)
		(and (listp x) (equal (car x) 'PLUR)))))
	(loop for plur in plurs do (block replace-plur
		; Replace the last noun in the noun phrase
		; with a pluralized version.
		(setf new-val (second plur))

		(setf last-noun new-val)
		(if (listp new-val)
			(setf last-noun (car (last new-val))))

		; TODO: real pluralization rules here
		(setf last-noun-plur (intern (concat-strs (string last-noun) "S")))
		(setf new-val (replace-vals last-noun last-noun-plur new-val))

		; First, replace the "A" phrase with "SOME".
		(setf steps (replace-vals (list 'A plur) (list 'SOME plur) steps))

		; Then, replace the plur pairs with the actual pluralizations.
		(setf steps (replace-vals plur new-val steps))
	))

	; Flatten out lambdas into each predicate inside, but hyphenate
	; them for transparency
	(loop for lam in (get-elements-pred steps
		(lambda (x) (and
					(listp x) (equal (length x) 3) (equal (car x) 'L)
					(listp (third x)) (and
						(>= (length (third x)) 2)
						(equal (car (third x)) 'AND)))))

			do (setf steps (replace-vals lam
					(hyphenate-syms
						(mapcar #'second (cdr (third lam))))
					steps)))

	; Flatten out N+PREDS, like we did with the lambdas
	(loop for npp in (get-elements-pred steps
		(lambda (x) (and (listp x) (>= (length x) 2)
						(or (equal (car x) 'N+PREDS) (equal (car x) 'N+PRED)))))

			do (setf steps (replace-vals npp
							(hyphenate-syms (cdr npp))
								steps)))

	; Flatten the sentences.
	(setf steps (mapcar #'flatten steps))

	; Merge 'S backward into its preceding noun.	
	(setf steps (mapcar #'merge-possessives steps))

	; Return the sentence strings, with periods and
	; spaces.
	(return-from outer (loop for st in steps
		do (setf buf "")
		do (loop for sym in st for i from 0
			if (> i 0) do (setf buf (concat-strs buf (format nil " ")))
			do (setf buf (concat-strs buf (format nil "~a" (princ-to-string sym)))))
		do (setf buf (concat-strs buf "."))
		collect buf))
)
)

(ldefun summarize-schema (schema)
(block outer
	(setf sents (join-str-list *NEWLINE-STR* (schema-to-english schema)))
	(setf sents (replace-all sents "_PROTO" ""))

	(setf outp (run-proc-with-stdin
		"/home/lane/miniconda3/bin/python3"
		'("/home/lane/Code/gpt/summarize_story.py")
		sents))

	(format t "summary: ~s~%" (car outp))

	(return-from outer (car outp))
)
)

(ldefun try-gpt-schema-header (schema)
(block outer
	(setf eng-summary (summarize-schema schema))

	(setf el-summary (linearize-story
		(len-parse-sents (list eng-summary) t)))

	(setf episodes (loop for wff in el-summary
		if (canon-charstar? wff) collect wff))

	(if (null episodes)
		(return-from outer nil))

	(setf episode (car episodes))

	(setf args (get-elements-pred (car episode) #'lex-skolem?))
	(setf schema-vars (get-elements-pred (get-section schema ':Roles)
		#'varp))

	(setf new-header (car episode))

	(loop for arg in args do (block pick-binding
		(setf constrs (story-select-interesting-term-constraints
			el-summary (list arg)))

		; Loop over all variables in the schema's roles
		; section and find the one with the most shared
		; predications.
		(setf best-score 0)
		(setf best-var nil)
		(loop for var in schema-vars do (block get-var-constrs
			(setf var-constrs (get-elements-pred
				(mapcar #'second (section-formulas
					(get-section schema ':Roles)))
				(lambda (x) (and (listp x)
					(equal (car x) var)))))

			(setf var-constrs (loop for vc in var-constrs
				collect (replace-vals var arg vc)))

			(setf score 0)
			; (loop for vc in var-constrs
				; if (contains constrs vc)
					; do (setf score (+ score 1)))
			(loop for vc in var-constrs
				for c in constrs
					do (setf score (+ score (word2vec-sim (second vc) (second c)))))

			(if (> score best-score)
				(progn
					(setf best-score score)
					(setf best-var var)))
		))

		(if (not (null best-var))
			; then
			(setf new-header (replace-vals
				arg best-var new-header))
		)
			
	))

	(return-from outer (list new-header best-score))
)
)

(ldefun gpt-schema-header (schema &optional samples)
(block outer
	(if (or (null samples) (not (numberp samples)))
		(setf samples 1))

	(setf best-score 0)
	(setf best-header nil)
	(loop for i from 0 to samples do (block sample
		(setf pair (try-gpt-schema-header schema))
		(setf header (car pair))
		(setf score (second pair))

		(if (or (null best-header) (> score best-score))
			(progn
				(setf best-score score)
				(setf best-header header)))
		
	))

	(if (not (null (get-elements-pred best-header #'lex-skolem?)))
		; then
		(progn
		(format t "ditching ~s~%" best-header)
		(return-from outer nil)
		))

	(return-from outer best-header)
)
)
