(format t "<! --- ")

(declaim (sb-ext:muffle-conditions cl:warning))

(load "ll-load.lisp")

(ll-load "ll-util.lisp")
(ll-load "schema-util.lisp")

(format t " --- !>~%")

(defparameter *SCHEMA-WEBPAGE-TEMPLATE* (join-str-list *NEWLINE-STR* '(
"<html>"
"<head>"
"<style>"
"body {"
"    background-color: #666666;"
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
"    font-size: 16px;"
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
)

(ldefun schema-html (schema)
(block outer
	; (setf vars (dedupe (get-elements-pred schema #'varp)))
	(setf vars (dedupe (mapcar #'car (mapcar #'second
		(section-formulas (get-section schema ':Roles))))))
	(setf var-colors (n-colors (length vars)))
	(setf var-color-map (mk-hashtable
		(loop for i from 0 to (- (length vars) 1)
			collect (list (nth i vars) (nth i var-colors)))))

	(setf buf (list))

	(setf buf (append buf (list
		"<div class='schema'>")))
	(setf buf (append buf (list
		"<span class='epi-schema'>EPI-SCHEMA</span>")))
	(setf buf (append buf (list
		(format nil "<span class='el-prop'>~a</span>" (prop-html (car (schema-header schema)) var-color-map)))))
	(setf buf (append buf (list
		"<span class='charstar'>**</span>")))
	(setf buf (append buf (list
		(format nil "<span class='fluent-id'>~a</span>" (third (schema-header schema))))))

	(loop for sec in (nonmeta-sections schema) do (block sec
		(setf fluent (equal (section-type sec) 'FLUENT))
		(setf css-class (if fluent "fluent-id" "nonfluent-id"))
		(setf buf (append buf (list
			(format nil "<p style='margin-left: 40px;'><span class='section-title'>~a</span></p>" (section-name sec)))))
		(loop for phi-pair in (section-formulas sec) do (block phi
			;(setf buf (append buf (list
				;(format nil "<p style='margin-left: 80px;'><span class='~a'>~a</span>" css-class (car phi-pair)))))
			(setf buf (append buf (list
				(format nil "<p style='margin-left: 80px;'><span class='el-prop'>~a</span></p>" (prop-html (second phi-pair) var-color-map)))))
		))
	))

	(setf buf (append buf (list
		"</div>")))

	(return-from outer (join-str-list *NEWLINE-STR* buf))
)
)

(ldefun schema-webpage-html (schemas)
	(format nil *SCHEMA-WEBPAGE-TEMPLATE*
		(join-str-list "<br /><br />"
			(mapcar #'schema-html schemas)))
)

(load "tests/nesl-compos.lisp")
(format t "~a~%" (schema-webpage-html (subseq *NESL-COMPOS* 0 20)))
