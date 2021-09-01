(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "ll-util.lisp")
(ll-load "schema-util.lisp")
(ll-load "schema-expansion.lisp")

(defparameter *TESTSCHEMAS* '(
    (EPI-SCHEMA ((?X_O (COMPOSITE-SCHEMA-362.PR ?X_I ?X_N ?X_D ?X_P)) ** ?E)
        (:ROLES
            (!R1 (?X_D BOOT.N))
            (!R2 (?X_I FISH.N))
            (!R3 (?X_N ROD.N))
            (!R4 (?X_N (PERTAIN-TO ?X_O)))
            (!R5 (?X_O AGENT.N))
            (!R6 (?X_P DESTINATION.N))
            (!R7 (?X_P POND.N))
        )
        (:STEPS
            (?X_M (?X_O ((ADV-A (FROM.P ?L1)) GO.3.V) ?X_P))
            (?X_A (?X_O (((ADV-A (IN.P ?X_P)) CAST.V) ?X_N)))
            (?X_H (?X_O (CATCH.V ?X_I)))
            (?X_F (?X_O ((UP.ADV PULL.V) ?X_N)))
            (?X_C (?X_N ((ACTUALLY.ADV BE.V) ?X_D)))
        )
		(:SUBORDINATE-CONSTRAINTS
			(!S1 ((?X_A<- ?X_M) = ?X_N))
			(!S2 ((?X_C<- ?X_M) = ?X_P))
		)
    )

	(EPI-SCHEMA ((?X_B ((ADV-A (FROM.P ?L1)) GO.3.V) ?X_C) ** ?X_D)
		(:ROLES
			(!R1 (?X_B AGENT.N))
			(!R2 (?L1 LOCATION.N))
			(!R3 (?X_C DESTINATION.N))
			(!R4 (NOT (?L1 = ?X_C)))
			(!R5 (?X_C POND.N))
			(!R6 (?X_A ROD.N))
			(!R7 (?X_A (PERTAIN-TO ?X_B)))
		)
		(:GOALS
			(?G1 (?X_B (WANT.V (KA ((ADV-A (AT.P ?X_C)) BE.V)))))
		)
		(:PRECONDS
			(?I1 (?X_B (AT.P ?L1)))
			(?I2 (NOT (?X_B (AT.P ?X_C))))
		)
		(:POSTCONDS
			(?P1 (NOT (?X_B (AT.P ?L1))))
			(?P2 (?X_B (AT.P ?X_C)))
		)
		(:PARAPHRASES
			(?X_D
	   (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) ((ADV-A (TO.P ?X_C)) GO.3.V))))
			(?X_D
	   (?X_B ((ADV-A (FROM.P ?L1)) ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.3.V))))
			(?X_D (?X_B ((ADV-A (DESTINATION_PREP.? ?X_C)) GO.3.V) ?X_C))
			(?X_D (?X_B GO.3.V))
			(?X_D (?X_B GO.3.V ?X_C))
			(?X_D (?X_B (LOCATION_ADV.? GO.3.V)))
		)
	)


))

(loop for sch in *TESTSCHEMAS*
	do (register-schema sch))



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
			(setf res (expand-nested-schema st schema))
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

	; We're only going to take one type per
	; variable; if the first letter of the
	; type is the same as the variable's last
	; letter, we'll prefer that one. Otherwise,
	; or if more than one such type exists,
	; arbitrarily select the last one to break
	; ties.
	(setf interesting-types (make-hash-table :test #'equal))

	(loop for var being the hash-keys of types do (block l1
		(setf var-types (gethash var types))
		(setf same-letter-var-types
			(loop for tp in var-types
				if (has-suffix? (string var)
					(subseq (string tp) 0 1))
					; then
					collect tp))

		(if (> (length same-letter-var-types) 0)
			; then
			; (return-from outer (car (last same-letter-var-types)))
			(setf (gethash var interesting-types)
				(car (last same-letter-var-types)))
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

(ldefun schema-to-english (schema)
(block outer
	; First, get the schema's steps
	(setf steps (mapcar #'second
		(section-formulas (get-section schema ':Steps))))

	; Next, move all of their modifiers to float at the ends
	; of the verb predicates.
	(setf steps (mapcar #'refloat-modifiers steps))

	; Add ownership markings to all variables.
	(setf var-types (schema-var-types schema t))
	(loop for var being the hash-keys of var-types
		do (loop for c in (gethash var var-types)
			if (has-element c 'PERTAIN-TO)
				do (setf steps (replace-vals
					var
					(list var 'OF.N (second c))
					steps))))

	; Get the type predicates for each variable
	; and substitute them in.
	(setf types (interesting-schema-var-types schema))
	(loop for var being the hash-keys of types
		do (setf steps (replace-vals var (gethash var types) steps)))

	; Replace the EL-valid OF.N syntax with an apostophe-S
	; syntax.
	(setf steps (ttt-replace steps
		'(_!1 OF.N _!2)
		'(_!2 \'S _!1)))

	; Replace all symbols with their undotted versions.
	(setf all-syms (dedupe (get-elements-pred steps #'symbolp)))
	(loop for sym in all-syms
		do (setf steps (replace-vals
				sym
				(intern (car (split-str (string sym) ".")))
				steps)))

	; Remove type shifters.
	(setf steps (ttt-replace steps
		'((!1 lex-type-shifter?) _!2)
		'_!2))

	; Replace AGENT with PERSON.
	(setf steps (replace-vals 'AGENT 'PERSON steps))

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
