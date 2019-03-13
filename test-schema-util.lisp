(declaim (sb-ext:muffle-conditions cl:warning))

(load "inference.lisp")
(load "matcher.lisp")
(load "schema_util.lisp")
(load "protoschemas.lisp")

(setf test-schema-name 'give_to.sch)

(setf instance1 (match-wff-with-schema-instance
	'(MOTHER5.SK (GIVE-TO.V SHE.PRO KITTEN6.SK))
	(new-schema-instance test-schema-name)))

(setf instance2 (match-wff-with-schema-instance
	'(SHE.PRO (HAVE.V KITTEN6.SK))
	(new-schema-instance test-schema-name)))

; NOTE: just because variables are set in the characteristic episodes
; doesn't mean we can count them as observed. We need to keep track of
; the actual episodes that have been seen for each instance, as well as
; the bindings.

; (format t "instance 1:~%~d~%" (tab-all-lines 1 (instance-to-str instance1)))
; (format t "instance 2:~%~d~%" (tab-all-lines 1 (instance-to-str instance2)))
(format t "~s instance 1 matched facts:~%" test-schema-name)
(format t "~%")
(format t "	~s~%" '(MOTHER5.SK (GIVE-TO.V SHE.PRO KITTEN6.SK)))
(format t "~%")
(format t "~s instance 1 definitely happened? ~d~%" test-schema-name (if (instance-fulfilled? instance1) "YES" "NO"))
(format t "~%")
(format t "instance 1 inferred facts:~%")
(loop for inf in (inferred-wffs instance1 t)
	do (format t "	~s~%" inf))
(format t "~%")
(format t "~%")
(format t "~%")
(format t "~%")
(format t "~s instance 2 matched facts:~%" test-schema-name)
(format t "~%")
(format t "	~s~%" '(SHE.PRO (HAVE.V KITTEN6.SK)))
(format t "~%")
(format t "~s instance 2 definitely happened? ~d~%" test-schema-name (if (instance-fulfilled? instance2) "YES" "NO"))
(format t "~%")
(format t "instance 2 inferred facts:~%")
(loop for inf in (inferred-wffs instance2 t)
	do (format t "	~s~%" inf))
(format t "~%")
(format t "~%")
(format t "~%")
