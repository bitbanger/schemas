; (format t "<! --- ")

; (setf *random-state* (make-random-state t))

(load "ll-load.lisp")

(ll-load "ll-util.lisp")
(ll-load "schema-util.lisp")
(ll-load "verbalize-schemas.lisp")

; (format t " --- !>~%")

; (defparameter *USE-GPT* nil)
(defparameter *USE-GPT* t)

(defparameter *ALLOWED-SECTIONS* '(
	:Roles
	:Steps
	:Goals
))

(defparameter *SCHEMA-WEBPAGE-TEMPLATE* (join-str-list *NEWLINE-STR* '(
"<html>"
"<head>"
"<script>"
"</script>"
"<style>"
"body {"
"    background-color: #666666;"
"}"
"p {"
"    margin: 8px;"
"}"
".schema {"
"    font-family: monospace;"
"    font-size: 18px;"
"    line-height: 0.5;"
"    border: 2px solid black;"
"    border-radius: 10px;"
"    display: inline-block;"
"    padding: 10px;"
"    background: #EFE7DB;"
"    flex: 1 1 auto;"
"}"
".epi-schema {"
"    font-weight: bold;"
"    font-size: 18px;"
"}"
".section-title {"
"    font-weight: bold;"
"    font-size: 18px;"
"}"
".el-prop {"
"    font-size: 14px;"
"}"
".nonfluent-id {"
"    font-weight: bold;"
"    color: #BB0000;"
"}"
".fluent-id {"
"    font-weight: bold;"
"    color: #0000FF;"
"}"
".charstar {"
"    font-weight: bold;"
"}"
".variable {"
"    font-weight: bold;"
"}"
".eng {"
"    font-family: serif;"
"    font-size: 16px;"
"    border-radius: 2px;"
"    border: 1px dotted black;"
"    color: #000000;"
; "    text-shadow: 1px 0px 0px gray, -1px 0px 0px gray, 0px 1px 0px gray, 0px -1px 0px gray;"
"    background: rgba(255,255,160,0.5);"
"    padding: 4px;"
"    margin: 4px;"
; "    font-style: italic;"
; "    font-weight: bold;"
"}"
".step {"
"    border: 1px dotted black;"
"    border-radius: 4px;"
"    display: inline-block;"
"    margin-left: 80px;"
"    margin-top: 10px;"
"    padding-bottom: 4px;"
; "    background: rgba(128,128,128,0.);"
"}"
"</style>"
"<title>Schema</title>"
"</head>"
"<body>"
"~a"
"</body>"
"</html>"
)))

(ldefun rel-lum (r g b)
	(+
		(/ (* 0.2126 r) 255)
		(/ (* 0.7152 g) 255)
		(/ (* 0.0722 b) 255))
)

(ldefun raw-rand-color ()
	(list
		(random 256)
		(random 256)
		(random 256))
)

(ldefun rand-color ()
(block outer
	(loop for i from 1 to 50 do (block inner
		(setf cand (raw-rand-color))
		(if (good-lum cand)
			(return-from outer cand))
	))

	(return-from outer (raw-rand-color))
)
)

(ldefun pointwise-cost (c1 c2)
	(sqrt (reduce #'+ (loop for i from 0 to (- (length c1) 1)
		collect (expt (- (nth i c1) (nth i c2)) 2))))
)

(ldefun cost (c colors)
	(pointwise-cost c
		(min-all colors (lambda (x)
			(pointwise-cost c x))))
)

(ldefun good-lum (c)
	(and
		(<= (apply #'rel-lum c) 0.4)
		(>= (apply #'rel-lum c) 0.1))
)

(ldefun children (c)
(block outer
	(setf new-cs (list
		(list (min 255 (+ 1 (car c))) (second c) (third c))
		(list (max 0 (- 1 (car c))) (second c) (third c))
		(list (car c) (min 255 (+ 1 (second c))) (third c))
		(list (car c) (max 0 (- 1 (second c))) (third c))
		(list (car c) (second c) (min 255 (+ 1 (third c))))
		(list (car c) (second c) (max 0 (- 1 (third c))))
		c))

	(setf new-cs (loop for nc in new-cs
		if (good-lum nc)
			collect nc))

	(return-from outer new-cs)
)
)

(ldefun best-child (c colors)
(max-all (children c)
	(lambda (x) (cost x
		(loop for y in colors
			if (not (equal y c))
				collect y))))
)

(ldefun n-colors (n)
(block outer
	(setf colors (loop for i from 1 to n
		collect (rand-color)))

	(if (equal n 1)
		(return-from outer colors))

	(setf cost-window (list))

	(loop for i from 1 to 50000 do (block inner
		(setf colors (loop for c in colors
			collect (best-child c colors)))

		(setf total-cost (reduce #'+ (loop for x in colors
			collect (cost x (loop for y in colors
				if (not (equal x y)) collect y)))))

		(setf cost-window (append cost-window (list total-cost)))
		(if (>= (length cost-window) 5)
			(setf cost-window (subseq cost-window
				(- (length cost-window) 5)
				(length cost-window))))

		(if (and
			(equal 5 (length cost-window))
			(< (abs (- (car (last cost-window)) (car cost-window))) 0.001))
				; then
				(return-from outer colors))
	))

	(return-from outer colors)
)
)

(ldefun prop-html (prop var-color-map)
(let ((var-color-map (if (null var-color-map) (make-hash-table :test #'equal) var-color-map)))
(cond
	((not (null (gethash prop var-color-map)))
		; then
		(let ((col (gethash prop var-color-map)))
			(format nil "<span style='border: 1px dotted black; border-radius: 2px; background: rgba(~d, ~d, ~d, 0.5);'>~a</span>" (car col) (second col) (third col) (if (listp prop)
		; then
		(concat-strs "("
		(join-str-list " "
			(loop for e in prop
				collect (prop-html e var-color-map))) ")")
		; else
		prop))))
	((listp prop)
		; then
		(concat-strs
			"("
				(join-str-list " " 
					(loop for e in prop
						collect (prop-html e var-color-map)))
			")"
		))
	((lex-verb? prop)
		; then
		(format nil "<span style='color: #0000FF; font-weight: bold;'>~a</span>" prop))
	(t
		(format nil "~a" prop)))
))

(ldefun mk-var-color-map (vars)
(block outer
	(setf var-colors (n-colors (length vars)))
	(setf var-color-map (mk-hashtable
		(loop for i from 0 to (- (length vars) 1)
			collect (list (nth i vars) (nth i var-colors)))))

	(return-from outer var-color-map)
)
)

(ldefun schema-html (schema)
(block outer
	(setf verbal-steps (mapcar #'cdr (cdr (car (loop for sec in (verbalize-schema schema)
		if (and (listp sec) (equal (car sec) 'STEPS.))
			collect sec)))))
	(setf verbal-goals nil)
	(handler-case
		(setf verbal-goals (mapcar #'cdr (cdr (car (loop for sec in (verbalize-schema schema)
			if (and (listp sec) (equal (car sec) 'GOALS.))
				collect sec)))))
		(error () nil))
	(setf verbal-preconds nil)
	(handler-case
		(setf verbal-preconds (mapcar #'cdr (cdr (car (loop for sec in (verbalize-schema schema)
			if (and (listp sec) (equal (car sec) 'PRECONDS.))
				collect sec)))))
		(error () nil))
	(setf verbal-preconds nil)
	(handler-case
		(setf verbal-postconds (mapcar #'cdr (cdr (car (loop for sec in (verbalize-schema schema)
			if (and (listp sec) (equal (car sec) 'EFFECTS.))
				collect sec)))))
		(error () nil))

	;(setf verbal-roles (cddr (car (loop for sec in (verbalize-schema schema)
		;if (and (listp sec) (equal (car sec) 'ADDITIONAL) (equal (second sec) 'ROLES.))
			;collect sec))))

	; (setf vars (dedupe (get-elements-pred schema #'varp)))
	(setf vars (dedupe (mapcar #'car (mapcar #'second
		(section-formulas (get-section schema ':Roles))))))
	(setf var-color-map (mk-var-color-map vars))

	(setf buf (list))

	(setf buf (append buf (list
		"<div class='schema'>")))
	(setf buf (append buf (list
		"<span class='epi-schema'>Learned Schema</span>")))
	(setf buf (append buf (list
		(format nil "<span class='el-prop'>~a</span>" (prop-html (car (schema-header schema)) var-color-map)))))
	(setf buf (append buf (list
		"<span class='charstar'>**</span>")))
	(setf buf (append buf (list
		(format nil "<span class='fluent-id'>~a</span>" (third (schema-header schema))))))

	(loop for sec in (nonmeta-sections schema) do (block sec-block
		(if (not (contains *ALLOWED-SECTIONS* (section-name sec)))
			(return-from sec-block))
		(if (equal (section-name sec) ':Episode-relations)
			(return-from sec-block))

		(setf fluent (equal (section-type sec) 'FLUENT))
		(setf css-class (if fluent "fluent-id" "nonfluent-id"))
		(setf buf (append buf (list
			(format nil "<p style='margin-left: 40px;'><span class='section-title'>~a</span></p>" (section-name sec)))))
		(loop for phi-pair in (section-formulas sec)
			for i from 0 do (block phi
			;(setf buf (append buf (list
				;(format nil "<p style='margin-left: 80px;'><span class='~a'>~a</span>" css-class (car phi-pair)))))

			; Add the verbalization
			(if (and (contains *ALLOWED-SECTIONS* (section-name sec)) (equal (section-name sec) ':Steps))
				(setf buf (append buf (list
					(format nil "<p style='padding-top: 10px; margin-left: 40px;'><span class='eng'>~a</span></p>"
						(if *USE-GPT*
						(gpt-reverbalize (join-str-list " " (mapcar (lambda (x) (format nil "~a" x)) (nth i verbal-steps))))
						(nth i verbal-steps))
					)))))
			(if (and (contains *ALLOWED-SECTIONS* (section-name sec)) (equal (section-name sec) ':Goals))
				(setf buf (append buf (list
					(format nil "<p style='padding-top: 10px; margin-left: 40px;'><span class='eng'>~a</span></p>"
						(if *USE-GPT*
						(gpt-reverbalize (join-str-list " " (mapcar (lambda (x) (format nil "~a" x)) (nth i verbal-goals))))
						(nth i verbal-goals))
					)))))
			(if (and (contains *ALLOWED-SECTIONS* (section-name sec)) (equal (section-name sec) ':Preconds))
				(setf buf (append buf (list
					(format nil "<p style='padding-top: 10px; margin-left: 40px;'><span class='eng'>~a</span></p>"
						(if *USE-GPT*
						(gpt-reverbalize (join-str-list " " (mapcar (lambda (x) (format nil "~a" x)) (nth i verbal-preconds))))
						(nth i verbal-preconds))
					)))))
			(if (and (contains *ALLOWED-SECTIONS* (section-name sec)) (equal (section-name sec) ':Postconds))
				(setf buf (append buf (list
					(format nil "<p style='padding-top: 10px; margin-left: 40px;'><span class='eng'>~a</span></p>"
						(if *USE-GPT*
						(gpt-reverbalize (join-str-list " " (mapcar (lambda (x) (format nil "~a" x)) (nth i verbal-postconds))))
						(nth i verbal-postconds))
					)))))

			; Start the step div
			(setf buf (append buf (list "<div class='step'>")))

			; Add the EL prop
			(setf buf (append buf (list
				; (format nil "<p style='margin-left: 80px;'><span class='el-prop'>~a</span></p>" (prop-html (second phi-pair) var-color-map)))))
				(format nil "<p><span class='el-prop'>~a</span></p>" (prop-html (second phi-pair) var-color-map)))))

			; End the step div
			(setf buf (append buf (list "</div>")))

			;(if (equal (section-name sec) ':Roles)
				;(setf buf (append buf (list
					;(format nil "<p style='padding-top: 10px; margin-left: 40px;'><span class='eng'>~a</span></p>" (nth i verbal-roles))))))
			
			; Add a line break
			(setf buf (append buf (list "<br /><br />")))
		))
	))

	(setf buf (append buf (list
		"</div>")))

	(return-from outer (join-str-list *NEWLINE-STR* buf))
)
)

(ldefun ngram-html (ngram ngram-page-fn ngram-schemas)
	(format nil "<form method='get' action='~a'><button type='submit'><div class='eng' style='display: inline-block;'>~a</div></button></form>"
		ngram-page-fn
		(join-str-list "<br />"
			(append
				(loop for e in ngram collect (format nil "~a" e))
				(list (format nil "<br /><span style='font-weight: bold; text-align: center;'>~d occurrences</span>" (length ngram-schemas))))))
)

(ldefun schema-webpage-html (schemas)
	(format nil *SCHEMA-WEBPAGE-TEMPLATE*
		(join-str-list "<br /><br />"
			(append
				(list (format nil "<form method='get' action='index.html'><button type='submit'><div class='eng' style='display: inline-block;'>Return</div></button></form><br />"))
				(list "<div style='display: flex; justify-content: space-between; flex-wrap: wrap;'>")
				(mapcar #'schema-html schemas)
				(list "</div>"))))
)

(ldefun ngram-webpage-html (ngrams)
	(format nil *SCHEMA-WEBPAGE-TEMPLATE*
		(join-str-list *NEWLINE-STR* (list
		"<div style='display: flex; justify-content: center; margin-bottom: 10px;'><div style='display: inline; font-size: 24px; border: 2px solid black; border-radius: 3px; background: #DDDDDD; padding: 5px;'>Click on any n-gram to view its contained schemas!</div></div>"
		"<div style='display: flex; justify-content: space-between; flex-wrap: wrap;'>"
		(join-str-list "<br /><br />"
			(loop for i from 1 to (max-all (mapcar (lambda (x) (length (caar x))) ngrams)) append (append
			(list (format nil "<div style='display: flex; justify-content: center; margin-bottom: 10px;'><div style='display: inline; font-size: 24px; border: 2px solid black; border-radius: 3px; background: #DDDDDD; padding: 5px;'>~d-grams</div></div>" i))
			(loop for ng in ngrams
				if (equal (length (caar ng)) i)
					collect (ngram-html (caar ng) (second ng) (third ng))))))
		"</div>")))
)

; (load "tests/interesting-nesl-compos.lisp")
; (setf *NESL-COMPOS* (shuffle *NESL-COMPOS*))
; (format t "~a~%" (schema-webpage-html (subseq *NESL-COMPOS* 0 20)))
