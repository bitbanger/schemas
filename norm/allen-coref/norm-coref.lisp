(defun coref-pairs (text)
(block outer
	; (this file is being run from the parent directory, so we prepend the PWD to the call)
	(let ((strm (sb-ext:process-output (sb-ext:run-program "allen-coref/allen_coref.sh" (list text) :output :stream :wait nil))))
		(loop for line = (read-line strm nil)
			while line
			do (return-from outer (read-from-string line))
		)
	)
)
)
