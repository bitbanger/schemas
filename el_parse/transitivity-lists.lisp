
;                                                          Dec 12/20
; Starting point for this file was
;     ~schubert/elf-from-sentences/purely-intransitive-verbs.lisp
;
; Much reliance on ~schubert/pref-parser/word-parser/alvey/
; ================================================================
; The lists here are intended to facilitate correct gap insertion in
; Treebank constituency parses. I'LL PROBABLY TAKE (MONO-)TRANSITIVE
; AS THE DEFAULT CATEGORY, i.e., taking an NP object (plus possibly one
; or two non-NPs) as complement.
;
; The *purely-intransitive-verbs* are ones which, if appearing in a context
; where an NP gap is expected, are unlikely to dominate the expected gap.
;
; I've eliminated obscure verbs and apparent non-verbs, and many idioms
; that Treebank parsers would parse phrasally. (I've left a lot of verb +
; particle combinations, since the ULF parser should combine them (but
; *when* -- just prior to gap insertion?)

; ** I think I may want to add verbs like "walk", even though we have
;    "walk the streets" and "walk the line", i.e., rarely transitive verbs,
;    because the objects can scarcely be gapped: ?"What did you walk _?"
;    (though we could have "What streets did you walk?")

(defparameter *purely-intransitive-verbs* (make-hash-table))

(mapcar #'(lambda (x) (setf (gethash x *purely-intransitive-verbs*) t))
;``````````````````````````````````````````````````````````````````````
; NB: Many of these verbs take non-NP complements.
;
; Verbs never followed by an NP gap. Note: "behave" is included, even
; though it can be followed by an NP like "himself", because this can't
; be gapped (*"Whom did he behave?"). Verbs like "be" that can really
; only be followed by a predicate, but where that predicate can be a 
; nominal and can be gapped, are listed as *pseudo-transitive-verbs*.
; Note that particles make a difference to transitivity. E.g., "back"
; can be transitive, while "back_away" is not; by contrast, "bargain"
; is intransitive, whereas "bargain_away" is transitive.
'(
abound accede accrue acquiesce act_up adhere agonize allude amble amount anticorrelate antipathize apologize appear arse_around ask_around autodestruct back_away backpedal band_together bang_away bargain base_jump battle_it_out bawl bed-wet behave blast_off blaze_away bleed_to_death blossom bode boil_over bone_up boogie bottom_out bow_down brachiate branch branch_off breeze bring_it bubble_up buckle bugger_off bulge bungee_jump burgeon burst_out busk butt_out cackle caddy calve camp_out campaign care carom carouse catch_on caterwaul cavort cha-cha charleston chat chatter chillax chip_away chirp chortle clam_up clash clomp cloud_over co-occur coconspire coexist cohabit collide collude come come_along come_apart come_away come_back come_correct come_forward come_on_over come_through come_to_grips come_to_life come_to_order come_together come_up come_with commune complain condescend conflict conk_out consist consort converge converse cooperate correspond counterstrike crackle creep creep_up crop_up crouch crump cuddle_up daddle dawn decamp default degenerate deliquesce desist deviate diddle-daddle digress dine_out disagree disco dispose dissent diverge do_battle do_business dote dream_on drift_apart drift_off drone_on drop_away drop_dead drop_round duckwalk duet dwell dwindle eddy edge_up effervesce effloresce egress elapse elope emerge emigrate emote empathize equivocate err evanesce exclaim face_off faint fall_apart fall_away fall_behind fall_in fall_in_love fall_on_deaf_ears fall_out fall_over fall_through fall_together fare fast fawn feel_down fend fess_up feud fib fiddle_about fiddle_around file_in fire_away fishtail fission fizz flail_about flake_out flare_up flatline flicker flounder fluoresce fly_off foam fool_about fool_around fornicate fraternize freestyle freeze_over freeze_up fuck_about function gad gallivant galumph gambol gander gang gape garden genuflect get_along get_by get_carried_away get_cold_feet get_hitched get_in_the_way get_into_trouble get_laid get_lost get_lucky get_together give_birth give_chase glance glimmer glisten glower go_all_the_way go_apeshit go_awry go_back go_bankrupt go_mad go_overboard go_places go_platinum go_public go_steady go_to_war go_wrong grandstand gravitate grind_to_a_halt grouch grow_cold grunt guffaw gyre hang_a_left hang_a_right hang_in hang_out hang_tough hang-glide happen happen_along have_a_go heal_up hearken_back hee-haw hibernate hide_out hit_the_ceiling hit_the_fan hit_the_roof hold_fire hold_hands hold_true hole_out hotdog hotfoot_it hunker ice_over immigrate impend inch intercede interfere introspect iridesce jaw_away jet jet_off jitter jut keel keel_over keep_on_trucking keep_one\'s_eyes_peeled keep_watch kill_time kneel knuckle_down kowtow lactate lapse lay_over lay_rubber leaf level_off lie lie_back lie_down lie_low linger live_in_sin loaf lol look_alike look_round lose_count lose_weight lust luxuriate make_merry make_off make_sense make_time make_way malinger mambo masturbate meddle meditate menstruate meow merengue mingle misspeak misstep moo moonwalk mouth_off move_in move_on muck_about mushroom mutiny nosedive oink opt oscillate ovulate pamphleteer pander partake party pay_attention pay_one\'s_last_respects peak pee peep_out peer pelt_down perspire pertain phone_home pick_holes pick_up_the_pieces pick_up_the_tab pig_out pinch-hit pipe_down pirouette plateau play_hookey play_second_fiddle play_to_the_crowd plummet polka pontificate pour_down powwow preside press_ahead prevail pull_ahead pull_strings pull_the_plug pull_the_trigger punch_in push_the_envelope pussyfoot putter quibble quiver rage ramp reach_out read_lips rebel recidivate recoil recriminate recur reek reign relapse remain reminisce result retrogress reverberate reverse_the_charge revolt ribbit ripen_up rise rock_on rock_out rocket_up roister roll_around roll_in roll_on rush_off salivate salsa sashay scamper scheme scrape_by scuffle seem shape_up shimmer shimmy shop_around shrimp shudder sidle silt_up simmer_down simper sin sit_on_the_fence skateboard skitter skydive slalom slave_away sleep_in sleepwalk slither slouch slug_away smolder snicker sniffle snigger snore snowshoe snuggle_up sojourn spaz_out spazz_out spill_over spill_the_beans spin_out spiral splish spring_up sproing stand_back stand_by stand_out stand_pat stare steal_away steal_the_show steer_clear step_aside step_forward step_in stick_together stomp_off stop_dead stop_off stop_on_a_dime stop_over stride strike_back strut_one\'s_stuff succumb sunbathe sweat_bullets swelter take_a_look take_advantage take_aim take_care take_heed take_ill take_inventory take_notice take_one\'s_time take_part take_place take_pride take_refuge take_root take_shape take_sick take_the_floor take_turns talk_dirty talk_shop tamper tattle teethe telemarket tense_up tent thieve throb thumb_a_ride tie_the_knot tip_the_scale top_out totter transit transmigrate trek tremble trot_off troupe trundle_along tsk tsktsk tsk-tsk tumble_down turn_on_a_dime turn_one\'s_back turn_to_dust vacation vacillate vape verge video_conference waddle waft walk_out wallow want_in want_out water_ski watusi waver wayfare wear_off wee-wee weight-train welter whack_off whither window-shop wise_up wither_away wuther yackety-yak yak yap yarr yaw yo-yo zone_out zoom_in zoom_out))

(defparameter *ditransitive-verbs* (make-hash-table))
 ; commonly taking 2 NP obj's, & readily allowing gapping of either NP.

(mapcar #'(lambda (x) (setf (gethash x *ditransitive-verbs*) T))
;```````````````````````````````````````````````````````````````
; [Mostly from 'allot', 'get', 'give', 'make', 'send', and 'throw' classes 
; in VerbNet, and others by "branching out" from members of those classes. 
; Some of these really involve a predicative nominal: appoint,
; brand (the innocent man they branded a traitor), call, christen,
; crown, dub, label, name, nickname, rename, term, vote; but some 
; can also be truly ditransitive (call me a cab, vs. call me a fool)
;
; The transitive verbs with an additional predicate complement
; should be separately listed; there are several in "rarely-ditransitive-
; verbs.lisp as well (anoint, declare, name, render).

; In the ELF files I moved rare ditransitives to "rarely-ditransitive-
; verbs.lisp";
; most of those allow benefactive (recipient) arguments; I've left
; some of the more commonly occurring ones here.

; Tests: Should readily allow at least one of
;        "What did you <verb> that one?"
;        "Which one did you <verb> that one?"
;        "Whom did you <verb> one?"
; For example, I relegated "advance" to the *weakly-ditransitive-verbs*,
; because "What did you advance him?", or "Who(m) did you advance the money?"
; sound pretty unusual to me. Where I give examples, this tends to indicate
; my uncertaintly about the correctness of having the verb in this category.
 '(

   airmail allocate allot ask assign award bequeath bet bill bring buy
   carve charge cost deliver deny ; "She charged him the full amount"
   FedEx feed fetch fine forgive get give grant guarantee hand hand-deliver
   issue knit lease lend loan lob mail make nickname offer overcharge overpay
   owe pawn pay peddle permit; "permitted him one cigarette"
   pitch pledge pour prepare prescribe proffer promise remit rename sell send
   serve show slip supply teach tell throw tip wager wire wish
 ))


(defparameter *weakly-ditransitive-verbs* (make-hash-table))

(mapcar #'(lambda (x) (setf (gethash x *weakly-ditransitive-verbs*) t))
;``````````````````````````````````````````````````````````````````````
 ; The items in here were originally "starred items" in a comprehensive
 ; list; while many can function perfectly well as ditransitives, they
 ; usually don't freely gap either one or the other position; verbs like
 ; "mean" (as in "She meant him no harm") are left out altogether, as
 ; phrasings like "What harm did she mean him?" or "Who(m) did she mean 
 ; harm?" are just extremely improbable.
 '(
   accord advance allow answer apportion bake bat bear begrudge blow
   boil brew build cable cash cause cede ; "caused me grief" "blew him a kiss"
   chuck cite cook crochet deal deny dictate disburse dribble 
   earn find ; "earned him a medal ; "found him a cozy armchair"
   fix flash fling forbid forward fry grill hawk hock kick land 
   leave microwave mix net order; left her the estate; mixed himself a drink
   pass play pose post punt quote read refund rent repay save secure sew 
   ship sing sneak spare telex toss transmit type write yield)
 )

(defparameter *pp-taking-verbs* (make-hash-table))
; Originally this was to contain all verbs that subcategorize for a PP.
; But parses don't distinguish between complements and adjuncts, and
; PP-adjuncts can always be gapped, there's really no benefit here for
; gap-postulation. However, it may turn out to be useful to identify
; verbs that *just* take a PP complement. The complement/adjunct
; distinction again is often unclear, but since these verbs don't
; (easily/often) take an NP complement, they can be used along with
; "purely intransitive verbs" (with which they overlap because of the
; fuzziness of the adjunct/complement distinction) to identify verbs
; that, e.g., don't (easily) allow for a wh-nominal complement. E.g.,
; contrast "I recall where she lives" vs. "I live where she lives."
; NB: Verbs that take an S[that] complement or NP[wh] complement,
; like "agree", "attest", "care", etc., are omitted, because a following
; wh-phrase is usually understood as an object, even though these verbs
; generally don't take NP objects. E.g., "He agreed {what Alice said /
; where Alice stood on the matter} was unclear"; "He cares what others
; think of him". (So these are "silent preposition" examples.)
(mapcar #'(lambda (x) (setf (gethash x *pp-taking-verbs*) t))
;```````````````````````````````````````````````````````````
; The initial focus was on verbs that readily allow a PP complement gap 
; (in addition ; to allowing a gap of type PP/NP, as all PP-complement-
; taking verbs do).
;
; E.g., "On what topics does the course focus?" is perfectly colloquial
; (as is "What topics does the course focus on?"); whereas we exclude 
; "agree", since gap-examples like "With whom do you agree?" probably
; occur relatively rarely compared with, "Who do you agree with _?";
; Other excluded verbs: ?"Out of what jail did you bail him _?", vs.,
; "What jail did you bail him out of _?"; or ?"At what did he balk _?"
; vs. "What did he balk at _?"; or ?"Into what did you bang _?" vs.,
; "What did you bang into _?"; or ?"On what does this comment bear _?
; vs. "What does this comment bear on _?"; or ?"Into whose car did he 
; break?", vs. "Whose car did he break into _?"
;
; NB: PP adjuncts (as opposed to complements) are a different matter -
;     they gap easily as a whole, e.g., "On what grounds did he balk
;     at helping _?", vs. ??"What grounds did he balk at helping on _?";
;     ??Off what list did you cross him?" vs "What list did you cross
;     him off (of)?"; ??Of what was he cured?" vs "What was he cured of?"
;     ??"At what are you driving?" vs "What are you driving at?"
'(abscond abstain adhere adjust
  affiliate agonize agonise ally apologize apologise appeal 
  arbitrate argue arrive atone 
  band_together  belong benefit 
  bicker bitch blaspheme blaze 
  brag  campaign
  chum co-star co-habit collaborate collide
  collocate collude come come_across come_away come_back come_down come_out 
  come_off come_over come_round comment commiserate commune
  communicate complain comply concentrate concur condescend condole
  confer confide conflict conform connive consent consist
  consort conspire converse cooperate cope
  copulate correspond crawl cringe crusade culminate curtsy dabble
  dance dawn deal default defect delve demur depart depend
  derive desist despair detour deviate devolve dicker differ 
  differentiate digress dine direct disagree disapprove discourse
  discriminate disengage dismount dispose dissent dither
  dive diverge dote dovetail duel eavesdrop elope emanate embark
  emerge emigrate encamp encroach enthuse escape experiment
  fall fawn feast fend feud fiddle flee flinch flirt flock focus
  forage fraternize fraternise fret frown fulminate function fuss
  gamble gape gargle gasp gawk gaze gibe glance glare glisten gloat
  glow glower gnaw go gogle gossip graduate grapple gravitate grieve
  grin groan grouse grovel grumble haggle hanker happen hark 
  harmonize harmonise harp hearken hinge hint hiss hobnob holler
  home_in honk hoot hop hover hunger impinge incline indulge infringe
  inhere inquire insist interact interfere intermarry intermingle
  intertwine intervene intrude inveigh itch jest jockey joke joust
  kneel kowtow labor lag languish lapse lash laugh leaf lean lecture
  leer liaise lie listen loaf long look lust luxuriate major marvel
  masquerade mate matter meddle mediate mesh mess metamorphose
  migrate militate mingle moan monkey moralize moralise motion
  muck muscle muse negotiate nestle nose number object obsess obtrude
  occur officiate opt oscillate overflow pal_around pale pander pant
  partake participate partner peck peek peep peer perch persist pertain
  philosophise philosophize pine pivot plead plod point pontificate
  pore pose pounce prate prattle pray predominate preside prevail
  prey proceed profit pry puff_away puff_up pulsate pun pussyfoot
  put_up puzzle quail quake quarrel quest queue_up quibble quiver
  race rage rail rain_down ramble ramble_on range rat rave react reason
  rebel rebound recede reckon recline recoil recriminate recuperate
  reek refer reflect refrain reign rejoice relate rely remark reminisce
  remonstrate renege repent reply repose reside resort resound respond
  rest result retaliate retrogress return reunite revel revert revolt
  revolve rhapsodise rhapsodize rhyme ricochet riffle rifle riot rise
  rise_up roam robe romance room root ruminate rummage scintillate
  scoff scowl secede seethe sentimentalise sentimentalize shack_up
  shop shudder shy_away side sidle_up sift signal sin sit_in skate
  skimp skirmish skirt slaver sleep smile snicker snigger snipe
  socialise socialize spar sparkle speak speak_out specialise specialize
  speculate splurge spurt_out spy squabble squeal stand star stare 
  stem step step_up step_down stick stick_out stick_up stink stock_up
  stoop stoop_down stray strive struggle stumble subscribe subsist
  succumb suck_up suffer surrender swarm swerve swoop_down sympathise
  sympathize talk tamper tangle team team_up teem teeter tend testify
  thrill throng thrum thud tire toady tool_along tool_around tower toy
  trail tread trespass trifle triumph tumble tune_in tussle vacation
  vacillate vanish verge vibrate vie volunteer vote vouch wade wail
  wait walk wallow wander war waver weary weasel weep welch well_out
  welsh welter wince wink winter withdraw wonder wrangle wriggle yearn
  yield zero_in zoom zoom_in
 ))

(defparameter *rarely-transitive-verbs* (make-hash-table))

(mapcar #'(lambda (x) (setf (gethash x *rarely-transitive-verbs*) t))
;````````````````````````````````````````````````````````````````````
; These are verbs that do occasionally take a referential NP object,
; but normally don't. I decided to put "care" under pure transitives,
; despite "What do you care _?", which seems like an idiomatic variant 
; of "Why do you care _?". "Stand" is an oddball as it is transitive
; only if preceded by "can {not, n't}". But there's also "stood his 
; ground", and various combinations with particles (up, down, by, in).
;
'(attest bleep budget caddie cater disappear feel growl plead sound
  spring stand stay); "How much pain do you feel _?"    `````??
      ;??````  ```` ; "What case did he plead _?" "I can't stand it";
            ;         "Whose execution did he stay _?"
 ; that's all, based on Alvey
 )

(defparameter *pseudo-transitive-verbs* (make-hash-table))

(mapcar #'(lambda (x) (setf (gethash x *pseudo-transitive-verbs*) t))
;`````````````````````````````````````````````````````````````
; These are a small subset of the *pred-taking-verbs*
;
; The goal is to identify verbs that can only be followed by a pred,
; not a gapped referential NP, but are not "strictly intransitive",
; in that they can seem to have an NP gap (predicatively interpreted);
; e.g., "Who did the Unabomber turn out to be _?"; "What kind of doctor did
; he become _?", "What shade of red did he blush?"
;
; Based on Alvey v.le "SC_AP" verbs. I also ckecked "(ARITY 2) (PFORM",
; since verbs allowing a pred complement are largely subsumed by those
; allowing a PP complement. However, most verbs that subcategorize for
; a PP needed to be excluded, as they usually diallow an NP as gap filler
; after the verb, i.e., the verb would be followed by the preposition 
; (a PP with an NP gap).
;
; A quick intuitive filter is viability of the question form "What/who did
; they <verb>?", but excluding the numerous instances where <verb> can also 
; simply be transitive, taking a referential NP as object).
;
'(be become blush); "What color did he blush _?"
 ; that's all, based on Alvey
 )

(defparameter *pred-taking-verbs* (make-hash-table))

(mapcar #'(lambda (x) (setf (gethash x *pred-taking-verbs*) t))
;`````````````````````````````````````````````````````````````
; These are intended to include all verbs that allow for questions
; starting with a phrase like "how big", i.e., with an ADJP gap as a
; complement, possibly in addition to other complements (NPs, etc.)
; These include the pseudo-transitive verbs. Search Alvey v.le using
; string "C_AP", i.e., subject or object control of an ADJP. This list
; includes some "strictly intransitive" verbs (not taking NP complements)
; like "remain". Not all V[_np_pred] are included; e.g., "called her
; brilliant" is ok, but you can't gap the AP: ??"How smart did he call
; her _?" (cf., "How smart dishe consider her _?"; similarly "He came 
; clean", vs *"How clean did he come _?"; some cases are hard to decide,
; e.g., "How smart do you find her _?" is possible but quite unlikely;
; similarly, "How cold do you keep the vaccine _?", "How large does he
; loom _?", etc..
;
; NOTE THE OVERLAP WITH *np+pred-taking-verbs*; the reason is that in
; inserting pred gaps, we may be looking at a passive; e.g., although
; "consider" requires an NP object, in the passive the semantic object is
; in subject position; e.g., "I don't know how smart he is considered _."
; In the gap insertion code, such passives are not distinguished from
; object-less cases, as in "How good did it taste _?".
;
'(appear be become blush consider deem feel get grow keep like look loom
  make plead push remain scrub seal seem set slice smell sound stay
  taste turn wipe); "seal" is doubtful - can't gap "shut" in "seal shut";
  ; "How spicy do you like/want it _?", "How cold did it turn _?";
  ; "How clean was the crime scene wiped _?"
 )

(defparameter *np+pred-taking-verbs* (make-hash-table))

(mapcar #'(lambda (x) (setf (gethash x *np+pred-taking-verbs*) t))
;````````````````````````````````````````````````````````````````
'( appoint brand call christen consider deem dub elect keep label
   like make name reckon render scrub see set slice term vote wipe
   ; that's all I got from Alvey; actually, I'm not sure we need this
   ; category for gap-insertion decisions, since these are transitive
   ; verbs (the assumed default category), and the predicate is rarely
   ; gapped: ?"What did you appoint him?"; though "call", "christen"
   ; and "name" do allow this ...; however, we have "How smart do you
   ; reckon him _?", "How sick did the poison render him _?", etc.
 ))

; For the time being, the following is not needed for gap insertion.
; Consider gapped examples like "What was he disguised as _?", "What did
; you disguise yourself as _?", "As what was he disguised _?", or "As
; what did you disguise yourself _?". in the 1st 2 cases, this is handled
; as completing and object-less preposition with an NP, and the second 2
; as completing a verb with a PP -- and since virtually all verbs allow
; a following PP, this is handled by the "permissive" insertion of a PP
; gap after a verb plus, possibly, an NP
;
(defparameter *np+as+pred-taking-verbs* (make-hash-table))

(mapcar #'(lambda (x) (setf (gethash x *np+as+pred-taking-verbs*) t))
;````````````````````````````````````````````````````````````````
'(acknowledge appoint cast categorize choose classify define denounce
  deride describe diagnose disguise dismiss dress elect employ engage
  enrol enroll establish hail intend interpret nominate picture rank
  reckon recognize recommend regard reinstate remember represent reveal
  strike tag treat view visualize) ; based on Alvey; actually, we probably
  ; won't use this category for gap-insertion decisions, since these are
  ; transitive verbs (the assumed default category.
 )

(defparameter *whs-taking-verbs* (make-hash-table))

(mapcar #'(lambda (x) (setf (gethash x *whs-taking-verbs*) t))
;`````````````````````````````````````````````````````````````
; This was motivated by contrasts like "I arrived WHEN SHE LEFT", vs
; "I know WHEN SHE LEFT", i.e., ADVP vs whs-nominal. So here I've
; picked a subset of (SUBCAT WHS) verbs from the Alvey lexicon, 
; viz., ones where a when-clause complement can naturally come right
; after the verb and would be interpreted as a nominal in that case.
; That includes some simple transitives that Alvey doesn't list,
; like "abandon", "abbreviate", "abide", "abhor", ..., "love", etc.
; So even though the present list gives the common cases, it may be
; better to include everything but purely transitive verbs and maybe
; some pure PP-taking verbs, like "collude"
'(anticipate arrange ascertain ask assess attest calculate care check 
  choose confide confirm consider contemplate count decide deliberate 
  demonstrate describe determine discern disclose discount discover 
  discuss devine divulge doubt enquire establish exclude explain express 
  fathom feel figure_out find find_out forecast foresee foretell forget 
  guess hash_out hear imagine indicate infer inquire judge 
  know learn let make map mind note notice observe perceive ponder predict 
  preordain prescribe prophesy prove puzzle query question realize realise 
  recall recollect reflect remember say see sense settle show smell 
  sort_out specify state suggest take tell think understand verify 
  watch wonder)
 )

(defparameter *np-whs-taking-verbs* (make-hash-table))

(mapcar #'(lambda (x) (setf (gethash x *np-whs-taking-verbs*) t))
;``````````````````````````````````````````````````````````````
; This is largely a subset of the above, but typically interprets
; a whs complement as a nominal even after another np verb argument,
; e.g., "He told Alice when he was leaving". Similarly for "where"
'(ask guarantee pledge promise remind show teach tell)
 )

(defparameter *pp-whs-taking-verbs* (make-hash-table))

(mapcar #'(lambda (x) (setf (gethash x *pp-whs-taking-verbs*) t))
;``````````````````````````````````````````````````````````````
; This is largely a subset of *whs-taking-verbs*, but typically interprets
; a whs complement as a nominal even after a pp verb argument, e.g.,
; e.g., "He checked with Alice when she would arrive; "He divulged to
; Alice when he would start work"; "He forecast on Friday when the hurricane
; would arrive"; "He inferred from the schedule when she would arrive";
; "I know from experience when she will finish the job".
'(ascertain check confide confirm consider decide deliberate determine
  disclose divulge enquire establish forecast foresee foretell forget
  guess indicate infer inquire know learn ponder predict prophesy recall
  reveal specify state verify wonder)
 )

(defparameter *inf-taking-verbs* (make-hash-table))

(mapcar #'(lambda (x) (setf (gethash x *inf-taking-verbs*) t))
;`````````````````````````````````````````````````````````````
; The purpose of this list is to enable likely distinctions between
; infinitives that are stand-alone object complements of the verb, as in
;   "Bob decided to catch a bus"
; and infinitive purpose adverbials, as in
;   "Bob ran to catch the bus",
; which we render in ULF as, e.g., (adv-a (for.p (to (catch.v (the.d bus.n)))))
; Note that for these verbs a standalone infinitive is not interpreted as an
; ADVP, if another complement is present, then in ADVP[inf] may follow; e.g.,
;   "He arranged to surprise her" vs. "He arranged the flowers to surprise her",
;    or "He arranged to dine out to surprise her".
; However, for a PP-complement or adjunct before the infinitive, the infinitive
; is still unlikely to be an adverbial, e.g., 
;   "He attempted yesterday jointly with Alice to solve the problem".
; Some ambiguities remain, e.g., "He looks to her to cheer him up" vs
; "He looks at cartoons to cheer him up"; "He trained to be vigilant" vs
; "He trained to stay fit".
'(abide ache afford aim appear arrange ask aspire attempt begin bother burn
  burst care come cease chance choose claim clamor clamour come commence 
  compete condescend connive consent conspire continue contract contrive 
  cooperate covenant crave decide decline deign delight demand deserve desire
  die disdain dread elect endeavor expect fail fear fix forbear forget get 
  grow happen hasten hate hesitate hope incline intend itch learn like long 
  love manage mean need neglect offer omit pant petition pine plan pledge 
  plot pray prefer prepare presume pretend proceed profess promise propose 
  purport qualify race refuse rejoice remember resolve scheme scorn scramble 
  seek seem set_out stand start strain strive struggle swear tend threaten 
  trouble try undertake venture vote vouchsafe vow wait want wish yearn)
 )

(defparameter *inf-tolerating-verbs* (make-hash-table))

(mapcar #'(lambda (x) (setf (gethash x *inf-tolerating-verbs*) t))
;`````````````````````````````````````````````````````````````
; This is an odd little group where the infinitive denotes some sort of 
; emotion-evoking perception or thought.
;  "He awoke to see a stranger stand by the tent"
;  "He blanched to see her so emaciated"
'(wake blanche blush die exult shudder tremble )
 );                  ``` hmm, = "yearn"?


(defparameter *np-inf-taking-verbs* (make-hash-table))

(mapcar #'(lambda (x) (setf (gethash x *np-inf-taking-verbs*) t))
;`````````````````````````````````````````````````````````````
; The purpose of this list is to enable likely distinctions between
; infinitives after an NP object that are part of the complement structure
; and those that function as adverbials, e.g.,
;   "Bob presumed/asked her to be nice", vs. "Bob complimented her to be nice"
; TBC
'())

(defparameter *inf-taking-nouns* (make-hash-table))

(mapcar #'(lambda (x) (setf (gethash x *inf-taking-nouns*) t))
;`````````````````````````````````````````````````````````````
; The purpose of this list is to help determine whether a postnominal infinitive
; is a noun complement or an implicit relative clause; e.g., "the hope to be
; nominated ..." vs., "the student to be nominated"; or "the desire to help"
; vs "the student to help" (mind you, the latter case involves modality and
; a phrase-final gap).
'((attempt desire effort hope impulse intention means need option promise reason
   resolve threat wish yearning zeal)) ; TBC: This just off the top of my head!
 )
