(declaim (sb-ext:muffle-conditions cl:warning))

(load "norm-schema-util.lisp")
(load "norm-protoschemas.lisp")
(load "norm-stories.lisp")
(load "norm-unify.lisp")
(load "norm-match.lisp")




; (setf test-story *FLOWER-STORY*)
(setf test-story *KITE-STORY*)

(setf kite-gen-schema (match-story-to-schema *KITE-STORY* go_somewhere.v t))
(print-schema kite-gen-schema)
(format t "~s~%" *KITE-STORY-2*)
(setf kite-lv2-schema (match-story-to-schema *KITE-STORY-2* kite-gen-schema nil))
(format t "done~%")
(print-schema kite-lv2-schema)
