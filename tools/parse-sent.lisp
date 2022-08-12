(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load-superdir "new-ulf-parser.lisp")

(setf sents
	(loop for sent in
		(split-lst (cdr sb-ext:*posix-argv*) "/")
			collect (join-str-list " " sent)))

(setf el-sents (len-parse-sents sents))

(setf el-sents-valid
	(loop for el-sent in el-sents
		collect (loop for phi in el-sent
			if (canon-prop? phi) collect phi)))

(setf el-sents-invalid
	(loop for el-sent in el-sents
		collect (loop for phi in el-sent
			if (not (canon-prop? phi)) collect phi)))

(loop for sent in sents
		for el-valid in el-sents-valid
		for el-invalid in el-sents-invalid
			do (format t "~s~%" sent)
			do (format t "	VALID:~%")
			do (loop for phi in el-valid
					do (format t "		~s~%" phi))
			do (format t "	INVALID:~%")
			do (loop for phi in el-invalid
					do (format t "		~s~%" phi))
			do (format t "~%"))
