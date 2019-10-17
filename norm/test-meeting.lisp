;; KR '91 is on the 22nd-25th.  You need to schedule a two day
;; workshop immediately before or after the conference.  You also want
;; to spend either the day before or the day after the conference
;; sightseeing with your Uncle Albert.  You can't sightsee on the days
;; of the workshop.  The room for the workshop must be reserved two
;; weeks in advance, and it's already the 7th.  When should you tell
;; Uncle Albert to expect you?
(load "load-mats.lisp")

(initialize-allen-arrays)

(setq mmode t)
(setq amode t)
(clear)

(setq brief nil)
(setq noisy nil)

(assertm 4 <= left GEORGIY <= 4)
(assertm 5 <= right GEORGIY <= 5)
(assertm 1 <= duration LANE <= 1)
(asserta LANE (p m) GEORGIY)
(asserta LANE disjoint GEORGIY)

(allen-reduce)

(mhow LANE)
