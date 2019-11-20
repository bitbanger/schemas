(defun coref-pairs (text)
(block outer
	(let ((strm (sb-ext:process-output (sb-ext:run-program "allen_coref.sh" (list text) :output :stream :wait nil))))
		(loop for line = (read-line strm nil)
			while line
			do (return-from outer (read-from-string line))
		)
	)
)
)
