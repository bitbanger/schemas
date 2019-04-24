(load "el.lisp")
(load "protoschemas.lisp")

(defparameter *GIVE-SENTENCE* '(
	(E2.SK AT-ABOUT.P NOW1)
	(MOTHER5.SK MOTHER.N)
	(MOTHER5.SK MOTHER-OF.N SHE.PRO)
	(KITTEN6.SK KITTEN.N)
	((MOTHER5.SK (GIVE-TO.V SHE.PRO KITTEN6.SK)) ** E2.SK)
))
