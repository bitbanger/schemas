(declaim (sb-ext:muffle-conditions cl:warning))

(load "../ll-load.lisp")

(ll-load-superdir "ll-util.lisp")

(defparameter *COLLAPSE-PAGE-OPENER* "<!-- Nested collapsible page code taken from: https://www.w3schools.com/jquerymobile/tryit.asp?filename=tryjqmob_collapsible_nested -->

<!DOCTYPE html>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css'>
<script src='https://code.jquery.com/jquery-1.11.3.min.js'></script>
<script src='https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js'></script>
</head>
<body>

<div data-role='page' id='pageone'>
  <div data-role='header'>
    <h1>Stories with at least one invalid ELF parse</h1>
  </div>

  <div data-role='main' class='ui-content'>")

(defparameter *COLLAPSE-PAGE-CLOSER* "~%</body>
</html>")

(defparameter *COLLAPSE-ENTRY-OPENER*
    "~%<div data-role='collapsible'>
      <h1>~a</h1>
      <p>~a</p>")

(defparameter *COLLAPSE-ENTRY-CLOSER* "~%</div>")

(ldefun print-collapsible (tree)
(block outer
	(setf retval "")
	(setf content "")

	;(setf content (concat-strs content
		;(format nil *COLLAPSE-ENTRY-OPENER* (car e) content)))

	(if (not (null (second tree)))
		(setf content (format nil "~a" (second tree)))
	)

	(setf recursive-content (loop for child in (third tree)
		collect (print-collapsible child)
	))
	(loop for rc in recursive-content
		do (setf content (concat-strs content (format nil "~%~a" rc)))
	)

	(setf title (car tree))
	(setf color nil)

	(if (and
		(listp (car tree))
		(equal (length (car tree)) 2)
		(listp (car (car tree)))
		(equal (length (car (car tree))) 2)
		(equal (car (car (car tree))) 'COLOR))
			; then
			(setf color (second (car (car tree)))))

	(if (not (null color))
		; then
		(setf title (format nil "<span style='color:~a'>~a</span>" color (second (car tree))))
	)

	(setf retval (format nil (concat-strs *COLLAPSE-ENTRY-OPENER* *COLLAPSE-ENTRY-CLOSER*) title content))

	(return-from outer retval)
))

(defun print-separator (txt)
(format t "
  <div data-role='header'>
   <h1>~a</h1>
  </div>
" txt)
)

(defun mk-collapsible-page (tree)
(block outer
	(format t *COLLAPSE-PAGE-OPENER*)
	(print-separator "Story 1")
	(format t "~a" (print-collapsible tree))
	(format t "~a" (print-collapsible tree))
	(format t "~a" (print-collapsible tree))
	(format t "~a" (print-collapsible tree))
	(format t "~a" (print-collapsible tree))
	(print-separator "Story 2")
	(format t "~a" (print-collapsible tree))
	(format t "~a" (print-collapsible tree))
	(format t "~a" (print-collapsible tree))
	(format t "~a" (print-collapsible tree))
	(format t "~a" (print-collapsible tree))
	(format t *COLLAPSE-PAGE-CLOSER*)
)
)

(defparameter *TEST-TREE* '(
		"This is a story sentence." nil 
			(
				("ULF" "here is the ULF" nil)
				("ELF" "here is the ELF" nil)
			)
))

(ldefun mk-sent-tree (eng is-valid parse-pairs)
	(list
		(if is-valid
			; then
			(list (list 'COLOR "green") (format nil "(valid) ~a" eng))
			; else
			(list (list 'COLOR "red") (format nil "(INVALID) ~a" eng))
		)
		nil

		(loop for pair in parse-pairs
			collect (list (car pair) (second pair) nil)
		)
	)
)

(ldefun print-story (story-name sents)
(block outer
	(if (null sents)
		(progn
			(print-separator (format nil "~a (PARSER CRASHED)" story-name))
			(return-from outer nil)
		)
	)

	(if (loop for sent in sents always (second sent))
		(progn
			; (print-separator (format nil "~a (all sentences valid!)" story-name))
			; (return-from outer nil)
		)
	)

	(print-separator story-name)
	(if (loop for sent in sents always (second sent))
		(format t *COLLAPSE-ENTRY-OPENER* "No invalid parses; view sentences anyway?" "")
	)
	(loop for sent in sents
		do (format t "~a" (print-collapsible (mk-sent-tree (car sent) (second sent) (third sent))))
	)
	(if (loop for sent in sents always (second sent))
		(format t *COLLAPSE-ENTRY-CLOSER*)
	)
)
)

(format t *COLLAPSE-PAGE-OPENER*)
(print-story "Story 1"
	'(
		; Sent 1
		(
			; eng
			"This is the sentence."
			; valid
			t
			; pairs
			(
				("ULF" "This is the ULF")
				("EL" "This is the EL")
			)
		)
		; Sent 2
		(
			; eng
			"This is the sentence."
			; valid
			nil
			; pairs
			(
				("ULF" "This is the ULF")
			)
		)
	)
)
(print-story "Story 2"
	'(
		; Sent 1
		(
			; eng
			"This is the sentence."
			; valid
			nil
			; pairs
			(
				("ULF" "This is the ULF")
				("EL" "This is the EL")
			)
		)
		; Sent 2
		(
			; eng
			"This is the sentence."
			; valid
			t
			; pairs
			(
				("ULF" "This is the ULF")
			)
		)
	)
)
(print-story "Story 3" nil)
(print-story "Story 4"
	'(
		; Sent 1
		(
			; eng
			"This is the sentence."
			; valid
			t
			; pairs
			(
				("ULF" "This is the ULF")
				("EL" "This is the EL")
			)
		)
		; Sent 2
		(
			; eng
			"This is the sentence."
			; valid
			t
			; pairs
			(
				("ULF" "This is the ULF")
			)
		)
	)
)

(format t *COLLAPSE-PAGE-CLOSER*)
