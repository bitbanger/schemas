(defpackage :old-ttt)
(asdf:defsystem :old-ttt
    :components ((:file "package")
                 (:file "operators")
		 (:file "expressions")
		 (:file "keys")
		 (:file "bindings")
		 (:file "trees")
		 (:file "patterns")
		 (:file "operators/unrestricted-seq")
		 (:file "operators/restricted-seq")
		 (:file "operators/fpseq-gen")
		 (:file "operators/descendant")
		 (:file "operators/vertical")
		 (:file "operators/literal")
		 (:file "sticky")
		 (:file "predicates")
		 (:file "template-construction")
		 (:file "transductions")
		 (:file "tests")
		 (:file "util")
		 (:file "process-tb")
		 (:file "search-tb"))
    :serial t)
