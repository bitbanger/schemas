(declaim (sb-ext:muffle-conditions cl:warning))

(load "parse.lisp")

(setf failures 0)
(setf tests 0)

(defun test-parse-func (parse-func inp want)
(block outer
	(setf tests (+ 1 tests))
	(setf tpf-got (funcall parse-func inp))
	(format t "	(~s ~s)~%" parse-func inp)
	(if (equal tpf-got want)
		(format t "PASS	(~A)~%~%" (if want "it is" "it isn't"))

		;else
		(progn
		(setf failures (+ 1 failures))
		(format t "FAIL	(~A)~%~%" (if want "it should have been" "it shouldn't have been"))
		)
	)
)
)


(test-parse-func
	'noun?
	'dog.n
	t
)
(test-parse-func
	'noun?
	'(the.d dog.n)
	nil
)
(test-parse-func
	'noun?
	'(pretta.a dog.n)
	t
)
(test-parse-func
	'noun?
	'(viewing.n party.n)
	t
)
(test-parse-func
	'term?
	'(the.d (last.a samurai.n))
	t
)
(test-parse-func
	'p-arg?
	'(of.p-arg (the.d (last.a samurai.n)))
	t
)
(test-parse-func
	'noun?
	'(viewing.n (of.p-arg (the.d (last.a samurai.n))))
	t
)

; Tests on actual story
(test-parse-func
	'sent?
	'(E4.SK BEFORE NOW1)
	nil
)
(test-parse-func
	'sent?
	'((MOTHER5.SK (GIVE-TO.V SHE.PRO KITTEN6.SK)) ** E4.SK)
	t
)
(test-parse-func
	'sent?
	'((SHE.PRO ((ADV-A (TO.P KITTEN9.SK)) (BE.V KIND.A))) ** E7.SK)
	t
)
(test-parse-func
	'sent?
	'((WILL.MD (SHE.PRO ((ADV-A (FOR.P (KA (PLAY-WITH.V IT.PRO)))) (GIVE-TO.V KITTEN14.SK IT.PRO)))) ** E13.SK)
	t
)

; Tests on schema sentences
(test-parse-func
	'sent?
	'(?x want1.v (that (?x ((adv-a (by-means.p (ka (do2.v ?a)))) (experience4.v ?p)))))
	t
)


(format t "~d tests, ~d failures~%" tests failures)

(setf original1 '(?x want1.v (that (?x ((adv-a (by-means.p (ka (do2.v ?a)))) (experience4.v ?p))))))
(format t "original sentence: ~s~%" original1)
(setf normal1 (normalize-sent original1))
(format t "	normalized sentence subject: ~s~%" (first normal1))
(format t "	normalized sentence verb: ~s~%" (second normal1))

