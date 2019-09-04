; norm-timeline.lisp contains functions to help evaluate temporal
; relations between episodes.

; We'll use a simple model where every episode is "oriented" by an
; absolute time NOWX, where X is a number. NOWX happens before NOWY
; if and only if X < Y.

; An episode may be at-about NOWX, consecutive with NOWX, before NOWX,
; or after NOWX.
