BEGIN BLK#AR25

// Aerie ToB
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("Aerie",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathToBAerie","GLOBAL",0)~ THEN BAERIE25 a1
  ~I wouldn't ask unless I really needed it, but, is there any chance you could... you know...~
  DO ~SetGlobal("LK#ArathToBAerie","GLOBAL",1)~
  == BLK#AR25 ~If it would make you happy, of course, my lady Aerie! What would you like it to smell of?~
  == BAERIE25 ~Wildflowers and... cinnamon? I think that's the one I like?~
  == BLK#AR25 ~I'm not, ah, quite sure we can procure cinammon but I shall do my utmost.~
  = ~The wildflowers may prove a problem too. There are certain desert flowers, but they only bloom after the rains.~
  == BAERIE25 ~Oh.~
  = ~How often does it rain?~
  == BLK#AR25 ~Oh, I'd guess... once every few years?~
  == BAERIE25 ~Maybe I'll just stick with unscented soap, then.~
  == BLK#AR25 ~Unscented it is.~
EXIT

// CN Anomen ToB:
CHAIN IF ~InParty("Anomen")
See("Anomen")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("Anomen",CD_STATE_NOTVALID)
CombatCounter(0)
Alignment("Anomen",CHAOTIC_NEUTRAL)
Global("LK#ArathToBAnomen","GLOBAL",0)~ THEN BLK#AR25 an1
  ~You're brooding, you know.~
  DO ~SetGlobal("LK#ArathToBAnomen","GLOBAL",1)~
  == BANOME25 ~I am not--~
  == BLK#AR25 ~I know brooding when I see it, Anomen. I am a master.~
  == BANOME25 ~Forgive me for pondering the enormitude of what we are doing then, master tree-hugger.~
  == BLK#AR25 ~Come now, there's no need for that sort of language. We're all friends here!~
  == BANOME25 ~Bite me, druid.~
  == BLK#AR25 ~With pleasure.~
  == BANOME25 ~There is something deeply wrong with you. All of you.~
EXIT

// LG Anomen ToB:
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("Anomen",CD_STATE_NOTVALID)
CombatCounter(0)
Alignment("Anomen",LAWFUL_GOOD)
Global("LK#ArathToBAnomen","GLOBAL",0)~ THEN BANOME25 an2
  ~Arath, a moment?~
  DO ~SetGlobal("LK#ArathToBAnomen","GLOBAL",1)~
  == BLK#AR25 ~Of course, Sir Anomen.~
  == BANOME25 ~There is no need for that, my friend. We have fought dragons together.~
  = ~A question, if I may; you fight neither for the side of good, nor for the side of evil. You have made that quite plain to me. But if you do not fight for the cause of good, why join <CHARNAME> in <PRO_HISHER> quest at all? Why is it you are here?~
  == BLK#AR25 ~I am here because I choose to be. And I don't appreciate your tone. You may have a new title, but you are no better than the rest of us underneath that oh-so-impressive armor. Don't speak down to me, Anomen. I'm here because I choose to be.~
EXIT

// Cernd ToB
CHAIN IF ~InParty("Cernd")
See("Cernd")
!StateCheck("Cernd",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathToBCernd","GLOBAL",0)~ THEN BLK#AR25 c1
  ~I don't envy these desert-dwellers. How hard life must be in a place as arid as this.~
  DO ~SetGlobal("LK#ArathToBCernd","GLOBAL",0)~
  == BCERND25 ~Even the smallest of mice can find water in the desert, young pup. There are flora and fauna here beyond your ken, and they have all found ways to survive. So it is with those who make the desert their home. They must learn its secrets and expose themselves to its might: they will find succor if they are true sons and daughters of nature.~
  == BLK#AR25 ~If I exposed myself to the desert, I suspect the only thing I'd be getting is sunburnt.~
  == BCERND25 ~Yes, I suspect you might be right.~
EXIT

// Edwin ToB
CHAIN IF ~InParty("Edwin")
See("Edwin")
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathToBEdwin","GLOBAL",0)~ THEN BLK#AR25 e1
  ~Edwin, I've got a question, if you've got a moment.~
  DO ~SetGlobal("LK#ArathToBEdwin","GLOBAL",1)~
  == BEDWIN25 ~No, I don't--~
  = ~(This will be quicker if you just answer his question. Just get it over with.) Fine. What do you wish to know?~
  == BLK#AR25 ~I swear I'm not an idiot...~
  == BEDWIN25 ~(Well that's been proved patently wrong...)~
  == BLK#AR25 ~... but I wanted to ask, since you're fairly well-versed in arcane lore. Where exactly does magic come from? And what is the difference between what I do and what you do?~
  = ~I know there's a difference, I'm just not sure what exactly it is.~
  == BEDWIN25 ~How do you not...~
  = ~... nevermind. Arcane magic is sourced from the Weave; those with the aptitude, such as myself, can tap directly into the Weave and gain access to its power.~
  = ~Your power is sourced directly from Nature herself. A cleric's magic is called "the Power," and is granted to them by their gods. No expertise or finesse in it at all.~
  == BLK#AR25 ~I guess that make sense. Thanks.~
  == BEDWIN25 ~I am glad to have been of service, oh omnipotent druid. Shall I next teach you the secrets of how to walk?~
  == BLK#AR25 ~Very funny.~
EXIT

// Haer'Dalis ToB
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("Haerdalis",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathToBHaer","GLOBAL",0)~ THEN BHAERD25 h1
  ~My black swan, I am curious.~
  DO ~SetGlobal("LK#ArathToBHaer","GLOBAL",1)~
  == BLK#AR25 ~(groan) Please don't call me that.~
  == BHAERD25 ~You profess to hate all that is unnatural, and have shown as much in past battles, yet you travel with and champion a <PRO_MANWOMAN> who is anything but natural. How is it you justify this to yourself? 'Tis a conundrum, to be sure.~
  == BLK#AR25 ~<CHARNAME> may be a Bhaalspawn, but <PRO_HESHE> fights the unnatural taint within <PRO_HIMHER>. It is hardly the same--I'm sure if <PRO_HESHE> had a choice, <PRO_HESHE> wouldn't be in the position <PRO_HESHE> is in now.~
  == BHAERD25 ~So let me ask you this: does a vampire desire to become a vampire? Undeath, for example, is more often than not entirely involuntary. Is it fair to treat them any differently? How do you know they do not also fight against the evil inside of them?~
  == BLK#AR25 ~<CHARNAME> is the <PRO_SONDAUGHTER> of a God, Haer'Dalis. It's different.~
  == BHAERD25 ~On the planes, laws of what is natural and unnatural become indistinct. Who is to say what is natural, and what is not? Consider this before your next tirade against all that is "wrong" in this world. There are worse things than being unnatural.~
EXIT

// Imoen ToB
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Imoen2",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathToBImoen","GLOBAL",0)~ THEN BIMOEN25 i1
  ~What exactly are you chewing?~
  DO ~SetGlobal("LK#ArathToBImoen","GLOBAL",1)~
  == BLK#AR25 ~Kratom leaf. Want some?~
  == BIMOEN25 ~Ah... no thanks. Why're you chewing leaves, exactly?~
  == BLK#AR25 ~Helps me think, gives a feeling of euphoria and calm. You should try it.~
  == BIMOEN25 ~If it's all the same to you, I'd rather not. But knock yourself out.~
  == BLK#AR25 ~It doesn't cause unconsciousness, just makes you feel good. Maybe another time.~
  == BIMOEN25 ~Alright, maybe. But not right now, we're a little busy. And you should stop that, what if you zone out and we're attacked?~
  == BLK#AR25 ~Yeah, you're right. Sorry.~
  == BIMOEN25 ~Of course I'm right. I'm always right. You should have realised that by now. (wink)~
EXIT

// Jaheira ToB
CHAIN IF ~InParty("Jaheira")
See("Jaheira")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
AreaType(CITY)
Global("LK#ArathToBJaheira","GLOBAL",0)~ THEN BLK#ARAT j1
  ~You are looking radiant today, Jaheira!~
  DO ~SetGlobal("LK#ArathToBJaheira","GLOBAL",1)~
  == BJAHEI25 ~What is it you want?~
  == BLK#AR25 ~I can't compliment one of my dear companions on her inner glow, or beautifully decorated hair? What a world it is we live in!~
  == BJAHEI25 ~Yes, yes. Out with it.~
  == BLK#AR25 ~Can I borrow your comb? Mine seems to have broken, and I'll admit my hair is getting a little unruly, so--~
  == BJAHEI25 ~Here. You need not stoop to false flattery.~
  == BLK#AR25 ~It isn't false, Jaheira. You do look lovely today.~
  == BJAHEI25 ~The three hours of sleep I got last night can, I'm sure, attest to that. Can we continue?~
EXIT

// Jan ToB
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Jan",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathToBJan","GLOBAL",0)~ THEN BJAN25 i2
  ~Athie, why so glum? 'Tis a glorious day--or close enough--and we stand poised on the side of righteousness! Making a tidy profit, too.~
  DO ~SetGlobal("LK#ArathToBJan","GLOBAL",1)~
  == BLK#AR25 ~Glum? Is that even a real word?~
  == BJAN25 ~Now that you mention it, I'm not sure. You know what? I'll find out. I've got an aunt twice-removed on my mother's side who works for the Waterdeep Council of Grammatical Excellence, she'll know the answer. While I'm at it, I'll make sure to ask her about gobbledegook... I've been curious about that one for some time now. In fact, I'll do it right now!~
  == BLK#AR25 ~Is that even a real--~
  = ~You know, we're a little busy now, Jan. I can wait.~
  == BJAN25 ~Good grammar waits for no man! Or woman. No need to be sexist. Not like my cousin Orla, she's about as sexist as they come. Or is it centrist? Hmm... I'll have to check. Where's my quill?~
EXIT

// Keldorn ToB
CHAIN IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathToBKeldorn","GLOBAL",0)~ THEN BLK#AR25 k1
  ~Sir Keldorn, I have something to say.~
  DO ~SetGlobal("LK#ArathToBKeldorn","GLOBAL",1)~
  == BKELDO25 ~(sigh) Yes?~
  == BLK#AR25 ~We have not had the strongest relationship in this group.~
  == BKELDO25 ~That is patently obvious.~
  == BLK#AR25 ~I was wrong to attack you as I did.~
  == BKELDO25 ~Has it really taken you this long?~
  = ~Arath, I was young once. I know how difficult it is at times to distinguish right from wrong, yet that is what we as paladins must do every day.~
  = ~It does not worry me that we disagree. Despite your professed lack of interest in the distinction between good and evil, you try to do what you think is best. I am too old to argue against those I know are on the same side. Do your job in this group, and I will respect you. You need not win my respect through flattery or argument.~
  == BLK#AR25 ~You have given me a lot to think about.~
  == BKELDO25 ~Well? Are you not going to apologise?~
  == BLK#AR25 ~I don't--~
  = ~I... am sorry, Sir Keldorn. It will not happen again.~
  == BKELDO25 ~Was that so difficult? Had you done that earlier, we could have been talking weeks ago. Shall we continue?~
EXIT

//(if Sarevok banter has happened)
CHAIN IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathToBSarevok","GLOBAL",1)
Global("LK#ArathToBKeldornSar","GLOBAL",0)~ THEN BLK#AR25 k2
  ~Do you remember what I said about evil creatures not stating their malevolence outright?~
  DO ~SetGlobal("LK#ArathToBKeldornSar","GLOBAL",1)~
  == BKELDO25 ~Aye, what of it?~
  == BLK#AR25 ~I take it back. Sarevok has proved me wrong. I bow to your greater wisdom.~
  == BKELDO25 ~Sarevok is a... curious case. Do not worry, my friend, <CHARNAME> has him on a tight leash.~
  == BLK#AR25 ~I wish...~
  == BKELDO25 ~Pardon?~
  == BLK#AR25 ~Uh. Nothing.~
EXIT

// Korgan ToB
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Korgan",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathToBKorgan","GLOBAL",0)~ THEN BKORGA25 kn1
  ~Ye owe me an ale or seven when this is finished, longleg.~
  DO ~SetGlobal("LK#ArathToBKorgan","GLOBAL",1)~
  == BLK#AR25 ~Uh, why?~
  == BKORGA25 ~Th' number o' times I've had ta save yer lily ass before it got handed ta ye... iff'n I had a copper fer each swing o' me axe in defense of yer bloody hide, I'd be richer than the King o' Tethyr!~
  == BLK#AR25 ~You might be right there. Alright, just... don't keep a running tab.~
EXIT

// Mazzy ToB
CHAIN IF ~InParty("Mazzy")
See("Mazzy")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathToBMazzy","GLOBAL",0)~ THEN BLK#AR25 m1
  ~A horse walks into a bar. The barman asks, "Why the long face?"~
  DO ~SetGlobal("LK#ArathToBMazzy","GLOBAL",1)~
  == BMAZZY25 ~I am sorry, Arath, is that meant to be funny?~
  == BLK#AR25 ~I... suppose not. You're the one with the long face right now, in any case.~
  == BMAZZY25 ~Forgive me. I have many things on my mind.~
  == BLK#AR25 ~Don't we all?~
  = ~Everyone in this group has lost someone close to them, Mazzy.~
  == BMAZZY25 ~I am not--while I appreciate the sentiment, it is not the loss of Patrick I am contemplating.~
  = ~I am fine, Arath. Truly. But thank you for noticing.~
EXIT

// Minsc ToB
CHAIN IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathToBMinsc","GLOBAL",0)~ THEN BLK#AR25 mn1
  ~I've been talking to Boo, Minsc, and we've come to a little agreement.~
  DO ~SetGlobal("LK#ArathToBMinsc","GLOBAL",1)~
  == BMINSC25 ~You have been talking to Boo? Joyous day! He is a wise little hamser, is he not?~
  == BLK#AR25 ~Very. Look, we've decided that he should spend a little more time with me. You sometimes neglect to do things like brush his fur and check it for burrs, so I'm taking it upon myself to do so from now on.~
  == BMINSC25 ~Oho! Boo has no need for such things, friend Arath! And he would tell me if he had burrs, worry not!~
  == BLK#AR25 ~He really does need brushing, Minsc. He's starting to moult, and it needs to be brushed out every few days.~
  == BMINSC25 ~Minsc has been wondering about the extra fur lining his bedroll... hmm. Well, if Boo has agreed, so shall Minsc!~
  == BLK#AR25 ~Come here, Boo... who's a good little hamster? You are! Yes you are!~
  == BMINSC25 ~(This one is a little strange, I think...)~
EXIT

// Nalia ToB
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathToBNalia","GLOBAL",0)~ THEN BNALIA25 n1
  ~Sometimes I feel like I'm waiting for my life to begin. We're on this enormous, important quest to save the world as we know it, and we have all put our affairs on hold; turned our focus to the here and now of <CHARNAME>'s struggle.~
  DO ~SetGlobal("LK#ArathToBNalia","GLOBAL",1)~
  == BLK#AR25 ~Do you regret joining <CHARNAME> on <PRO_HISHER> quest?~
  == BNALIA25 ~No, of course not. I feel honoured to be a part of what we are doing. I've learnt so much, and done so much. I just feel like... I have so much to do in this world. Me, myself. I can do so much for the people of Athkatla, the people of the Sword Coast. But here I am.~
  == BLK#AR25 ~I don't know about you, but I know this will be one of the most important things I'll ever do. What happens next... I don't know. But this is important.~
  == BNALIA25 ~Many things are important. Not all are quite so large. Some are so small we often forget about them... but I won't. I promise.~
EXIT

// Sarevok ToB
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Sarevok",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathToBSarevok","GLOBAL",0)~ THEN BSAREV25 s1
  ~If you've not the backbone to air your issue with me, druid, avert your gaze lest I avert it for you!~
  DO ~SetGlobal("LK#ArathToBSarevok","GLOBAL",1)~
  == BLK#AR25 ~It's not so much one issue as two warring problems.~
  == BSAREV25 ~Then get it off your chest so we can move on from this accursed staring. I have a feeling <CHARNAME> disapproves of cold-blooded murder.~
  == BLK#AR25 ~Well then. The first issue is that you're an unnatural construct whose existence depends upon the soul of another unnatural creature, so there's that. Likewise, if I didn't think <CHARNAME> would disapprove, we'd be having something of a battle right now.~
  == BSAREV25 ~(sigh) And how do you think you would defeat me, boy? With that pathetic staff and your meagre forest magics?~
  == BLK#AR25 ~I didn't say I'd win, did I?~
  = ~Secondly, you're rather devastatingly handsome, and that always tends to confuse my arguments.~
  == BSAREV25 ~In that case, continue staring, runt, and I assure you <CHARNAME>'s disapproval will not stop me.~
  == BLK#AR25 ~Oo...kay.~
EXIT

// Valygar ToB
CHAIN IF ~InParty("Valygar")
See("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathToBValygar","GLOBAL",0)~ THEN BLK#AR25 v1
  ~The next town we stop in, Valygar, I'm paying for you to spend the night in a brothel. You look like you need it.~
  DO ~SetGlobal("LK#ArathToBValygar","GLOBAL",1)~
  == BVALYG25 ~No.~
  == BLK#AR25 ~Why not? I think you'll find it quite the... engaging experience. You'll discover depths of relaxation you've never even *known*.~
  = ~I remember this one night in the Coronet, there was this gorgeous girl, Sylvia... the next day I was sore in muscles I didn't even know existed. It was amazing.~
  == BVALYG25 ~I stopped listening the moment you opened your mouth.~
  == BLK#AR25 ~If you don't like women, that's not a problem, you know, there are plenty of attractive young men at these places--~
  == BVALYG25 ~I don't--I like women. I'm just not interested.~
  == BLK#AR25 ~It was just a suggestion.~
  == BVALYG25 ~A terrible one.~
  == BLK#AR25 ~Obviously.~
EXIT
