;; KR '91 is on the 22nd-25th.  You need to schedule a two day
;; workshop immediately before or after the conference.  You also want
;; to spend either the day before or the day after the conference
;; sightseeing with your Uncle Albert.  You can't sightsee on the days
;; of the workshop.  The room for the workshop must be reserved two
;; weeks in advance, and it's already the 7th.  When should you tell
;; Uncle Albert to expect you?

(setq mmode t)
(setq amode t)
(clear)

(setq brief nil)
(setq noisy nil)

(assertm 22 <= left KR91 <= 22)
(assertm 25 <= right KR91 <= 25)
(assertm 2 <= duration WORKSHOP <= 2)
(asserta WORKSHOP (m mi) KR91)
(assertm 1 <= duration SIGHTSEE <= 1)
(asserta SIGHTSEE (m mi) KR91)
(asserta WORKSHOP disjoint SIGHTSEE)
(assertm left RESERVE - left WORKSHOP <= -14)
(assertm 7 <= left TODAY <= 7)
(asserta TODAY (p contains m o) RESERVE)

(allen-reduce)

(mhow SIGHTSEE)

(mhow RESERVE)
