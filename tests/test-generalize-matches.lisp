(declaim (sb-ext:muffle-conditions cl:warning))

(load "mtg-schemas.lisp")
(load "../ll-load.lisp")

(ll-load-superdir "protoschemas.lisp")
(ll-load-superdir "schema-el.lisp")
(ll-load-superdir "schema-util.lisp")
(ll-load-superdir "ll-util.lisp")

(loop for protoschema in *PROTOSCHEMAS*
	do (register-schema (eval protoschema)))


(setf proto-matches (loop for sp in *LEARNED-SCHEMAS*
						if (and (not (null (car sp))) (null (second sp))) collect (car sp)))

(setf matches-for-protos (make-hash-table :test #'equal))

(defun get-arg-rcs (arg schema)
	(let ((result (loop for rc in
		(section-formulas (get-section schema ':Roles))
		if (equal (car (second rc)) arg)
			collect (unwrap-singletons (cdr (second rc))))))
		; post-let
		(if (null result) '(ENTITY.N) result))
)

(defun get-args-rcs (args schema)
	(loop for arg in args
		collect (get-arg-rcs arg schema))
)

(loop for pm in proto-matches
			do (block print-inv

	; (format t "schema match:~%")
	; (print-schema pm)
	; (format t "match name ~s~%" (get-schema-match-name (schema-name pm)))
	(setf match-name (get-schema-match-name (schema-name pm)))

	(setf proto-parent (schema-name (invoked-schema (car (schema-header pm)))))

	; No parent for this schema was known; it's its own root.
	(if (null proto-parent)
		(return-from print-inv))

	(setf (gethash proto-parent matches-for-protos)
			(append (gethash proto-parent matches-for-protos) (list pm)))

))


(loop for parent-name being the hash-keys of matches-for-protos
	do (block print-parent-protos

		(setf children
			(loop for child in (gethash parent-name matches-for-protos)
				if (not (equal
							(schema-name child)
							parent-name))
					collect child))

		(setf children (remove-duplicates children
			:test (lambda (x y)
				(loop for rcs1 in (get-args-rcs (prop-all-args (car (schema-header x))) x)
					for rcs2 in (get-args-rcs (prop-all-args (car (schema-header y))) y)
						always (same-list-unordered rcs1 rcs2)
				)
			)
		))

		(if (equal 0 (length children))
			(return-from print-parent-protos))


		(setf parent (eval parent-name))

		; get args from headers
		(setf parent-args (prop-all-args (car (schema-header parent))))

		; (format t "~s~%" (car (schema-header (eval parent-name))))
		(setf parent-arg-rcs (get-args-rcs parent-args parent))
		(format t "~s~%~%" parent-name)


		(loop for parent-rcs in parent-arg-rcs
				for i from 0
			do (block print-parent-args
				(setf child-rcs-to-print (list))
				(loop for child in children
					for j from 0 do (block print-child-args
						(setf child-rcs (nth i (get-args-rcs (prop-all-args (car (schema-header child))) child)))
						(setf novel-child-rcs (set-difference child-rcs parent-rcs :test #'equal))
						;(if (null novel-child-rcs)
							;(return-from print-child-args))
						(setf covering-child-rcs (intersection child-rcs parent-rcs :test #'equal))
						; (if (not (null covering-child-rcs)) (format t "	~~ ~s~%" covering-child-rcs))
						(setf child-rcs-to-print (append child-rcs-to-print (list novel-child-rcs)))
						; (format t "	~s~%" novel-child-rcs)
						; (format t "~%")
				))

				(if (equal 0 (length child-rcs-to-print))
					(return-from print-parent-args))

				; (setf child-rcs-to-print
					; (dedupe-except child-rcs-to-print (list nil)))

				; (format t "-------------------~%")
				(format t "	~s~%" parent-rcs)

				(loop for rcs in child-rcs-to-print
						for k from 1
					if (< k 10)
						do (format t "		 ~d. " k)
					else
						do (format t "		~d. " k)
					if (not (null rcs))
						do (format t "~s~%" rcs)
					else
						do (format t "~~~%")
				)
			)
		)


		(format t "-------------------")
		(format t "-------------------")
		(format t "-------------------")
		(format t "-------------------~%")
		(format t "~%~%")
	)
)
