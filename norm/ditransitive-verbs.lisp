; [Mostly from 'allot', 'get', 'give', 'make', 'send', and 'throw' classes 
; in VerbNet, and others by "branching out" from members of those classes. 
; Some of these really involve a predicative nominal: appoint,
; brand (the innocent man they branded a traitor), call, christen,
; crown, dub, label, name, nickname, rename, term, vote; but some 
; can also be truly ditransitive (call me a cab, vs. call me a fool)
;
; Maybe the transitive verbs with an additional predicate complement
; should be separately listed; there are several in "rarely-ditransitive-
; verbs.lisp as well (anoint, declare, name, render).

(defparameter *ditransitive-verbs* ; commonly taking 2 NP complements
 '(
  ; I have moved rare ditransitives to "rarely-ditransitive-verbs.lisp";
  ; most of those allow benefactive (recipient) arguments; I've left
  ; some of the more commonly occurring ones here.
  
   advance
   airmail
   allocate
   allot
   allow
   appoint ; (predicate)
   apportion
   ask
   assign
   award
   bake
   bat
   bear
   bequeath
   bet
   bill
   boil
   brand ; (predicate)
   brew
   bring
   build
   buy
   call ; (predicate)
   carve
   cause ; "caused him grief"
   charge ; "She charged him the full amount"
   christen ; (predicate?)
   cite
   cook
   crown ; (predicate)
   chuck
   cook
   deny
   dictate
   disburse
   dribble
   dub ; (predicate)
   earn; "earned him a medal/ new friends"
   FedEx
   feed
   fetch
   find; "found him a cozy armchair"
   fine
   fix
   flash
   fling
   forgive
   forward
   fry
   get
   give
   grant
   grill
   guarantee
   hand
   handdeliver
   hand-deliver
   hawk
   hock
   issue
   kick
   knit
   label ; (predicate)
   land
   lease
   leave
   lend
   loan
   lob
   mail
   make
   microwave
   net
   nickname ; (predicate?)
   offer
   overcharge
   overpay
   owe
   pass
   pawn
   pay
   peddle
   permit; "permitted him one cigarette"
   pitch
   pledge 
   pose
   post
   pour
   prepare
   prescribe
   proffer
   promise
   punt
   quote
   read
   refund 
   remit
   rename ; (predicate?)
   rent
   repay
   save
   secure
   sell
   send
   serve
   sew
   ship 
   show
   sing
   slip
   sneak
   spare
   supply
   teach
   tell
   term ; (predicate)
   throw
   tip
   toss
   transmit
   type
   vote ; (predicate)
   wager
   wire
   wish
   write
   
 ))
