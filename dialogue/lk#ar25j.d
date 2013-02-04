BEGIN LK#AR25J
BEGIN LK#ARMOM

// Friendtalks and scenery talks
APPEND LK#AR25J

// Sequential: How are you going?
IF ~Global("LK#ArathToBTalks","GLOBAL",2)~ a1
  SAY ~How're you holding up there, <CHARNAME>? Soul settling in nicely? No attachment problems?~
  ++ ~Everything seems to be alright, as far as I can tell.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",3) RealSetGlobalTimer("LK#ArathToBTalksTimer","GLOBAL",3600)~ + a1.1
  ++ ~No attachment problems, but I can feel the Bhaal essence growing stronger inside of me each day.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",3) RealSetGlobalTimer("LK#ArathToBTalksTimer","GLOBAL",3600)~ + a1.2
  ++ ~I'm fine, thank you for asking.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",3) RealSetGlobalTimer("LK#ArathToBTalksTimer","GLOBAL",3600)~ + a1.1
  ++ ~I'm busy right now, Arath.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",3) RealSetGlobalTimer("LK#ArathToBTalksTimer","GLOBAL",3600)~ + a1.3
END

IF ~~ a1.1
  SAY ~Glad to hear it.~
  IF ~~ + a1.4
END

IF ~~ a1.2
  SAY ~Well, that's... not particularly excellent. Still, glad there aren't any problems with your soul.~
  IF ~~ + a1.4
END

IF ~~ a1.3
  SAY ~Alright, alright, no need for that tone. Geez.~
  IF ~~ EXIT
END

IF ~~ a1.4
  SAY ~Nothing worse than regaining your soul only to find it won't fit back in properly!~
  = ~So tell me, what's the latest horrifying nightmare courtesy of our good friend Bhaal? Anything juicy?~
  ++ ~There was this dream where I was a lobster and I was eating you. That was a bit weird.~ + a1.5
  ++ ~The nightmares seem to have lessened since the return of my soul, thankfully.~ + a1.6
  ++ ~Unfortunately not. I was just getting to enjoy those spine-tingling, vomitous nightmare sessions.~ + a1.6
  ++ ~That's not any of your business!~ + a1.7
END

IF ~~ a1.5
  SAY ~I'm... not entirely sure I want to know that one, unless the words 'lobster' and 'eating' are euphemisms. And... I get the feeling they aren't.~
  IF ~~ + a1.8
END

IF ~~ a1.6
  SAY ~I have noticed less girly screaming at night, I will admit. I'm definitely sleeping better, that's for sure.~
  IF ~~ + a1.8
END

IF ~~ a1.7
  SAY ~What are friends for if not prying into each others' business?~
  IF ~~ + a1.8
END

IF ~~ a1.8
  SAY ~You know you can tell me if there is anything bothering you, right? Especially if it involves gore or sex dreams. Those are by far the best ones.~
  ++ ~I'll be sure to tell you if I have any Bhaal dreams involving either of those things, don't worry. (grin)~ + a1.9
  ++ ~I don't recall any of the Bhaal dreams involving sex. Mainly murder, torture, despair, that sort of thing.~ + a1.10
  ++ ~You wouldn't be asking this if you knew what the dreams were actually like.~ + a1.11
  ++ ~What goes on when I'm sleeping is absolutely no concern of yours, and I'd like to keep it that way!~ + a1.11
END

IF ~~ a1.9
  SAY ~Not just those, though, really.~
  IF ~~ + a1.12
END

IF ~~ a1.10
  SAY ~Well, one can always hope!~
  IF ~~ + a1.12
END

IF ~~ a1.11
  SAY ~I'm just trying to lighten the mood a little. You know what I mean.~
  IF ~~ + a1.12
END

IF ~~ a1.12
  SAY ~Wake me up anytime. I'll listen.~
  IF ~~ EXIT
END


// Sequential: Pocket Plane
IF ~Global("LK#ArathToBTalks","GLOBAL",4)~ a2
  SAY ~Just between the two of us, and I mean this with all due respect, but can we do our best to, uh, not sleep in the Pocket Plane in future?~
  ++ ~Why do you ask?~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",5)~ + a2.1
  ++ ~What's wrong with the Pocket Plane?~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",5)~ + a2.1
  ++ ~Why? It's not like we sleep there often.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",5)~ + a2.2
  ++ ~It's too convenient not to.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",5)~ + a2.3
  ++ ~We'll sleep wherever I damn well please.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",5)~ + a2.1
END

IF ~~ a2.1
  SAY ~I just have trouble falling asleep there. Something about the hellish ambience, I think. Possibly the glowing lights, possibly the unnatural nature of it all.~
  = ~Unnatural nature. Now there's a bit of a mouthful. Try saying that fast ten times.~
  ++ ~It might be unnatural, but it's what we've got.~ + a2.4
  ++ ~Unnatural nature unnatural nature unnatural nature...~ + a2.5
  ++ ~I'm not particularly fond of it myself, in all honesty.~ + a2.4
  ++ ~It's fine. You're just being a twat.~ + a2.6
END

IF ~~ a2.2
  SAY ~'Not often' is far too much for my liking.~
  IF ~~ + a2.1
END

IF ~~ a2.3
  SAY ~I know it's convenient.~
  IF ~~ + a2.1
END

IF ~~ a2.4
  SAY ~It's not that I don't appreciate having a good base of operations, as... creepy and demonic as it may be... but. Yeah. Can't sleep. So there's that.~
  ++ ~I'll do my best to avoid having us sleep there, sure.~ + a2.7
  ++ ~Well, you definitely need your beauty sleep, that's for certain.~ + a2.8
  ++ ~Toughen up, princess. You'll survive.~ + a2.9
  ++ ~Will you stop whining?~ + a2.10
END

IF ~~ a2.5
  SAY ~I wasn't being serious, you strange <PRO_MANWOMAN>.~
  IF ~~ + a2.3
END

IF ~~ a2.6
  SAY ~Don't blame me if I fall asleep mid-cast and accidentally call down a hailstorm with hail the size of small rodents!~
  IF ~~ EXIT
END

IF ~~ a2.7
  SAY ~I'd appreciate it.~
  IF ~~ + a2.11
END

IF ~~ a2.8
  SAY ~Hey! I resent that remark! I need absolutely no--~
  = ~I'm not going to stoop to your level. I will be the bigger person.~
  IF ~~ + a2.11
END

IF ~~ a2.9
  SAY ~Survive, maybe.~
  IF ~~ + a2.6
END

IF ~~ a2.10
  SAY ~I'm not whining!~
  = ~Okay, well, maybe I am a little, but with good reason.~
  IF ~~ + a2.6
END

IF ~~ a2.11
  SAY ~Isn't it a bit weird to think that the Pocket Plane comes from some deep, hidden part of yourself?~
  = ~Maybe it's a reflection of what you're really like, underneath all that attractive bluster. Dark, demonic, lots of browns and reds...~
  ++ ~I can vouch for the redness, at least. Not sure about the rest.~ + a2.12
  ++ ~Attractive bluster? What's that supposed to mean?~ + a2.13
  ++ ~I think it comes more from Bhaal than from me.~ + a2.14
  ++ ~Seems like a fairly accurate representation to me!~ + a2.15
END

IF ~~ a2.12
  SAY ~I don't know, you seem pretty demonic to me.~
  IF ~~ + a2.16
END

IF ~~ a2.13
  SAY ~It's pretty self-explanatory? You bluster, it's a little attractive.~
  IF ~~ + a2.16
END

IF ~~ a2.14
  SAY ~Maybe, but I'd prefer to think you have some deep desire within yourself to create enormous statues of multi-breasted demonic women. More entertaining.~
  IF ~~ + a2.16
END

IF ~~ a2.15
  SAY ~I was *trying* to be diplomatic.~
  IF ~~ + a2.16
END

IF ~~ a2.16
  SAY ~Anyway, I'd appreciate it if we could try to avoid sleeping there. For the party's sake, if nothing else. I'd hate to fall asleep mid-spell and cause a hailstorm or conjure some deadly rabbit or something.~
  IF ~~ EXIT
END


// Sequential: The nature of good and evil, and remembering the dead
IF ~Global("LK#ArathToBTalks","GLOBAL",6)~ a4
  SAY ~We've killed a lot of things over the past few months. I used to keep count, in my head. Didn't last long, I lost track after a while.~
  ++ ~And your point is?~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",7)~ + a4.1
  ++ ~Seven hundred and eighty three, at my last count.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",7)~ + a4.2
  ++ ~I don't count them, but I try to remember the important ones.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",7)~ + a4.3
  ++ ~I always knew there was something wrong with you.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",7)~ + a4.4
  ++ ~What are you blabbering about?~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",7)~ + a4.1
END

IF ~~ a4.1
  SAY ~For once, I'm not actually sure what my point is. Just thinking out loud, I guess.~
  IF ~~ + a4.5
END

IF ~~ a4.2
  SAY ~Heh. I wasn't that precise, but I kept track. I forget them almost as soon as we've killed them now.~
  IF ~~ + a4.5
END

IF ~~ a4.3
  SAY ~I used to count every single one. I tried to, anyway. Now, I forget most as soon as they go down.~
  IF ~~ + a4.5
END

IF ~~ a4.4
  SAY ~Trust me, the list of things that are wrong with me could stun a team of oxen in their tracks.~
  IF ~~ + a4.5
END

IF ~~ a4.5
  SAY ~I used to think there was no such thing as real evil. But these Bhaalspawn... I don't know. Maybe I'm not as sure as I thought.~
  ++ ~Bhaal was totally evil, and those that give in to the taint become like him.~ + a4.6
  + ~Global("SaradushSacked","GLOBAL",1)~ + ~Do you remember Saradush? That's what real evil looks like, and it has nothing to do with being a Bhaalspawn.~ + a4.8
  ++ ~There's no such thing as 'real evil'. Just people, what they want, and what they're willing to do to get it.~ + a4.7
  ++ ~I doubt any Bhaalspawn is evil at first, but the taint has a way of changing how you think.~ + a4.6
  ++ ~Does it really matter?~ + a4.8
END

IF ~~ a4.6
  SAY ~The taint probably does have something to do with it. The gods themselves are beyond mortal ideas of good and evil... but I mean, I'm not entirely sure what those terms even mean anymore. They're just words.~
  IF ~~ + a4.8
END

IF ~~ a4.7
  SAY ~That's how I tend to view things. Or I thought that's how I viewed things.~
  IF ~~ + a4.8
END

IF ~~ a4.8
  SAY ~I suppose it depends on what side of the fence you're sitting on. And maybe it doesn't matter, as long as you believe in what you believe in and fight for it.~
  IF ~~ + a4.9
END

IF ~~ a4.9
  SAY ~Even Irenicus, early on, was 'good', from what I understand. And those things you told me about his dungeon, particularly his experiments to recreate Ellesime... twisted and wrong, yes, but there's some weird sort of... I don't know.~
  ++ ~I know what you mean.~ + a4.14
  ++ ~Irenicus may have once been good, but what he did, and what Ellesime and the elven council did to him, irrevocably changed that.~ + a4.14
  ++ ~There are moral imperatives, and there is good, and there is evil. I feel it within me each and every day.~ + a4.13
  ++ ~Irenicus did what he thought was right, and then fought for redemption, of a sort. Isn't that what a soul is?~ + a4.10
  ++ ~This is all getting a bit deep and meaningful for my liking.~ + a4.11
  ++ ~You enjoy this sort of meaningless conversation, don't you? It's like you're taunting me.~ + a4.12
END

IF ~~ a4.10
  SAY ~Gods, I don't know what a soul is, <CHARNAME>. What is the nature of man? What is his purpose? Why does he do the things he does?~
  IF ~~ + a4.13
END

IF ~~ a4.11
  SAY ~You're not the only one. But recently, with everything that's been going on... things are getting serious, and deep, and what we're doing is meaningful.~
  IF ~~ + a4.13
END

IF ~~ a4.12
  SAY ~Hardly. If I was going to taunt you, there are far better ways to do that.~
  = ~I'm just not really sure what I believe anymore.~
  IF ~~ + a4.14
END

IF ~~ a4.13
   SAY ~I used to be so sure in what I believed. Now...~
   IF ~~ + a4.14
END

IF ~~ a4.14
  SAY ~I just... don't know.~
  = ~You know, the older I get, the less I seem to know. Isn't that funny? I used to think I knew the answer to everything, but now...~
  ++ ~It's called growing up, I think. The young think they know everything, and the old know they know nothing at all.~ + a4.15
  ++ ~I know what you mean. There are lots of things I used to think I knew, things I used to believe in. I'm not sure about any of them anymore.~ + a4.16
  ++ ~We must hold onto what we believe in, lest we start to believe in nothing at all.~ + a4.17
  ++ ~Don't worry, Arath, I'm sure you still know the answer to everything.~ + a4.18
END

IF ~~ a4.15
  SAY ~Growing up, eh? Not sure if I like the sound of that.~
  IF ~~ + a4.19
END

IF ~~ a4.16
  SAY ~I'm glad I'm not the only one. Solidarity, <PRO_BROTHERSISTER>.~
  IF ~~ + a4.19
END

IF ~~ a4.17
  SAY ~That's awfully preachy of you there, <CHARNAME>. You might have a point though.~
  IF ~~ + a4.19
END

IF ~~ a4.18
  SAY ~I hope so, otherwise how will I get you out of this whole mess? Without my wise counsel you'd fall all to pieces.~
  IF ~~ + a4.19
END
  
IF ~~ a4.19
  SAY ~I figured out my point, anyway. I think it's important to remember what we've done, and those who have fallen, on both sides.~
  = ~It's just getting a bit difficult when there are so many, and I don't know what the sides are.~
  IF ~~ EXIT
END


// Scenery: Self-consciousness in the face of divinity
IF ~Global("LK#ArathToBTalks","GLOBAL",8)~ a5
  SAY ~I'm not sure if I like the idea that the gods are watching us. Makes me feel awfully self-conscious.~
  ++ ~I know what you mean. Makes me reconsider what I'm wearing each and every morning.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",9)~ + a5.1
  ++ ~Why does it make you feel self-conscious?~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",9)~ + a5.1
  ++ ~It gives me a sort of comfort, knowing someone's watching over me.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",9)~ + a5.1
  ++ ~Don't be ridiculous. The gods don't care what you look like.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",9)~ + a5.1
  ++ ~If they are at all, the gods are watching me, not you.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",9)~ + a5.1
END

IF ~~ a5.1
  SAY ~I've got this image in my head of a bunch of wizened, wrinkled men and women peering into a crystal ball and discussing our adventures for the day.~
  = ~"What do you think of that Arath fellow's cloak? Don't you think it a little too colorful?"~
  = ~"Oh yes, Mystra, I would have to agree."~
  = ~"I'm not sure I agree with his choice of boots, either. They clash with the armor. Tyr, what do you think?"~
  = ~"I think there definitely needs to be a little more justice. Oh, and perhaps he should consider a darker shade of hair."~
  = ~"Mortals can't change their hair on a whim, Tyr."~
  = ~"Why not? It's a perfectly reasonable suggestion."~
  = ~"I have heard they can use certain tree roots as dye..."~
  = ~"Shut your mouth, Mielikki, that's nonsense talk!"~
  = ~(sigh) "Yes, o maimed one."~
  = ~Heh.~
  ++ ~I highly doubt the gods talk that way.~ + a5.2
  ++ ~I find that offensive, Arath. Watch your tongue when you speak of the gods.~ + a5.3
  ++ ~"Ao, Mielikki refuses to stop calling attention to my hand!"~ + a5.4
  ++ ~I think you've missed your calling, Arath! You should have been a bard!~ + a5.5
  ++ ~What... was that?~ + a5.6
END

IF ~~ a5.2
  SAY ~So do I, but it's funner to to think about it like that. Funnier? Is funner a word? Anyway.~
  IF ~~ + a5.7
END

IF ~~ a5.3
  SAY ~Yes, o preachy one.~
  IF ~~ + a5.7
END

IF ~~ a5.4
  SAY ~"Sort out your own squabbles! I'm watching <CHARNAME> undress!"~
  = ~I'm joking! Sheesh.~
  IF ~~ + a5.7
END

IF ~~ a5.5
  SAY ~Nah, I would have butchered the music. I can sing a little, but hand me an instrument and generally I'll have found a way to break it by the next day.~
  IF ~~ + a5.7
END

IF ~~ a5.6
  SAY ~It was a joke. You know? Humor? Ha-ha? Honestly, <CHARNAME>, I don't know what to do with you some days.~
  IF ~~ + a5.7
END

IF ~~ a5.7
  SAY ~Best we get on with things, I guess.~
  = ~Oh, and gods, if you are watching? Uh, I'm just kidding around. You know I respect you. Especially you, Mielikki, you fox.~
  = ~... please don't strike me down?~
  IF ~~ EXIT
END


// Plot: The Final Hug
IF ~Global("LK#ArathToBTalks","GLOBAL",10)~ a6
  SAY ~I'm going to hug you now.~
  ++ ~What? Why?~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",11)~ + a6.1
  ++ ~(Hug him)~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",11)~ + a6.2
  ++ ~Ah, no thank you?~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",11)~ + a6.3
  ++ ~Touch me and you die.~ DO ~SetGlobal("LK#ArathToBTalks","GLOBAL",11)~ + a6.4
END

IF ~~ a6.1
  SAY ~Why do you think?~
  IF ~~ + a6.2
END

IF ~~ a6.2
  SAY ~Okay. I'm not really sure what to say, so I'm just going to get on with it.~
  IF ~~ + a6.5
END

IF ~~ a6.3
  SAY ~You get a hug whether you like it or not.~
  = ~There. Was that so bad? Sheesh. It's just a hug. Not like I'm going to jump on you and perform terrible acts of cruelty upon your person.~
  IF ~~ + a6.2
END

IF ~~ a6.4
  SAY ~Sheesh, someone's touchy today. Fine, no hug for you. I just wanted to say, well. I'm not really sure what I want to say.~
  IF ~~ + a6.5
END

IF ~~ a6.5
  SAY ~Uh. Thanks. I don't say that often, so. You know. It means something.~
  = ~I'm not good at this.~
  ++ ~You're really not, but you're welcome.~ + a6.6
  ++ ~And thank you. We make a good team.~ + a6.7
  ++ ~We're not going to die, you know.~ + a6.8
  ++ ~I have noticed that. And you should say it more often.~ + a6.9
  ++ ~Yeah, yeah.~ + a6.10
END

IF ~~ a6.6
  SAY ~Good. Okay, I'm not sure what else there is to say, so.~
  IF ~~ + a6.11
END

IF ~~ a6.7
  SAY ~We do, don't we? Really. Thanks for everything. It's been good.~
  IF ~~ + a6.11
END

IF ~~ a6.8
  SAY ~You don't know that, but I appreciate the sentiment. Just didn't want to let it stay unspoken.~
  IF ~~ + a6.11
END

IF ~~ a6.9
  SAY ~I'll do my best from now on. Or not. Guess we'll see. (grin)~
  IF ~~ + a6.11
END

IF ~~ a6.10
  SAY ~Hey, I'm being nice here. Fine, no niceness for you! (grin)~
  IF ~~ + a6.11
END

IF ~~ a6.11
  SAY ~Let's finish this, and kick some godspawn ass.~
  IF ~~ EXIT
END


// ---------------------------------------------------------------------------------------------------- //
// Romancccccccccccccccccccccccccccccccccccccccceeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee //
// ---------------------------------------------------------------------------------------------------- //

// Arath ToB romance

// Talk 1
IF ~Global("LK#ArathToBLovetalks","GLOBAL",2)~ a7
  SAY ~Why do you always have to get dragged into these things? I was beginning to get used to my life of quiet obscurity back in Amn. Alright, not really, but still.~
  ++ ~I don't know, honestly. I wish I did.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",3) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a7.1
  ++ ~Well, I *am* the <PRO_SONDAUGHTER> of a dead god. That may have something to do with it.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",3) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a7.2
  ++ ~You could never get used to obscurity. You love the limelight far too much.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",3) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a7.3
  ++ ~Is this important?~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",3) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a7.4
END

IF ~~ a7.1
  SAY ~Doesn't it get a little intimidating, what with the weight of the world on your shoulders? I don't know what I'd do in your position. I'm just glad it's you and not me, honestly.~
  ++ ~Of course it does. There's just not a lot I can do about it.~ + a7.5
  ++ ~Sometimes. Then I remember I have you around to deal with the brunt of it.~ + a7.7
  ++ ~Never. I know I'm up to the challenge, why worry?~ + a7.6
  ++ ~Thanks. Appreciate it.~ + a7.7
END

IF ~~ a7.2
  SAY ~You may just have a point there. Still, it's hardly fair that you're always the one in the middle of things.~
  IF ~~ + a7.1
END

IF ~~ a7.3
  SAY ~<CHARNAME>! I'm shocked at you. Shocked. How could you say that about unassuming old me? (grin)~
  IF ~~ + a7.1
END

IF ~~ a7.4
  SAY ~No. Yes. Well, sort of. To me, anyway.~
  IF ~~ + a7.8
END

IF ~~ a7.5
  SAY ~That just makes it worse.~
  IF ~~ + a7.8
END

IF ~~ a7.6
  SAY ~And what happens if you aren't?~
  IF ~~ + a7.8
END

IF ~~ a7.7
  SAY ~No charge, lover. (grin)~
  IF ~~ + a7.8
END

IF ~~ a7.8
  SAY ~I just... this is dangerous. You could get hurt.~
  ++ ~So could you. We live in a dangerous world, sweetheart.~ + a7.9
  ++ ~Well, the armor's supposed to prevent that.~ + a7.9
  ++ ~I could get hurt, yes. I could even die. It's a part of life.~ + a7.10
END

IF ~~ a7.9
  SAY ~I don't like the idea of not being able to protect you. We're fighting the spawn of a dead god, here. Practically demigods. Fighting us. How do you kill a demigod?~
  ++ ~With a stabbing motion. Or a cutting motion. Or an enormous fireball. There are plenty of ways.~ + a7.11
  ++ ~The Bhaalspawn aren't demigods, Arath. Do I look like a demigod to you?~ + a7.12
  ++ ~What do you think keeps me up at night?~ + a7.13
  ++ ~If they're demigods, then I am too. Look at it that way.~ + a7.11
END

IF ~~ a7.10
  SAY ~Oh gods, don't say that. I don't even want to think about that. And I really don't...~
  IF ~~ + a7.9
END

IF ~~ a7.11
  SAY ~I always thought that... well, not really thought, but you're supposed to be able to protect the people you love. The... person you love. And I can't protect you. And I don't like it.~
  ++ ~You don't have to protect me, Arath. I'm quite capable of doing that myself.~ + a7.14
  ++ ~You? Protect me? You're joking, right?~ + a7.14
  ++ ~You don't have to like it, dumpling, it's just how the world works.~ + a7.15
  ++ ~And you don't think I want to be able to protect you?~ + a7.16
END

IF ~~ a7.12
  SAY ~Well, yes, but that's an entirely different conversation.~
  IF ~~ + a7.11
END

IF ~~ a7.13
  SAY ~Well, me, I'd hope. And definitely not thoughts of your own impending demise. Uh, not that I think you think about that. I mean, I do. Not that it's impending.~
  = ~... this is not coming out like I'd hoped.~
  IF ~~ + a7.11
END

IF ~~ a7.14
  SAY ~I know. I don't mean... I know you can look after yourself. And I'm probably not that great of a protector anyway. But still...~
  IF ~~ + a7.17
END

IF ~~ a7.15
  SAY ~Well, the way the world works is bad. And I know you can look after yourself. And I'm probably not that great a protector anyway. But still...~
  IF ~~ + a7.17
END

IF ~~ a7.16
  SAY ~Well, of course I do, but we're not talking about you here, this is my time to talk about my feelings. (grin)~
  IF ~~ + a7.17
END

IF ~~ a7.17
  SAY ~You just have this... this big fate thing. And that's okay, I understand that. But I worry a bit that maybe one day, one way or another, you'll... leave me behind.~
  ++ ~I'm never going to leave you behind. Don't ever think that.~ + a7.18
  ++ ~And that might happen. I can't promise it won't. But you can't live your life in fear of what *might* happen.~ + a7.19
  ++ ~I may have a 'big fate thing,' but so do you. And that fate is to be mine. So stop worrying about it and kiss me.~ + a7.20
  ++ ~If anything, Arath, I think I should be the one worrying about you leaving me!~ + a7.21
END

IF ~~ a7.18
  SAY ~I can't help it. Hey, if I could control my thoughts, well... we wouldn't be having this conversation right now, and I'd be imagining you naked.~
  = ~Huh. And with that, suddenly the world seems a brighter place. (grin)~
  IF ~~ + a7.22
END

IF ~~ a7.19
  SAY ~I can and I will, so there.~
  IF ~~ + a7.22
END

IF ~~ a7.20
  SAY ~That was disgustingly romantic, <CHARNAME>. You should be ashamed of yourself, honestly.~
  = ~I won't say no to a kiss though... (grin)~
  IF ~~ EXIT
END

IF ~~ a7.21
  SAY ~(snort) Hardly.~
  IF ~~ + a7.22
END

IF ~~ a7.22
  SAY ~I know it's ridiculous. But just because it's ridiculous doesn't mean I'll stop thinking about it.~
  IF ~~ EXIT
END


// Talk 2
IF ~Global("LK#ArathToBLovetalks","GLOBAL",4)~ a8
  SAY ~<CHARNAME>? Are you okay?~
  ++ ~I'm fine. Why, don't I look okay?~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",5) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a8.1
  ++ ~(sigh) Not really, no. I don't understand how anyone could be okay under these sorts of circumstances.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",5) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a8.2
  ++ ~I'm not sure, to be honest. With everything that's going on, it's a bit hard to tell.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",5) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a8.3
  ++ ~Concern? From you? I think I might faint.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",5) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a8.4
END

IF ~~ a8.1
  SAY ~You look fine, I just wanted to check.~
  IF ~~ + a8.5
END

IF ~~ a8.2
  SAY ~Me either, honestly. Sometimes I stop and think... and then remember why I shouldn't stop and think. I'd hate to think how it is for you.~
  IF ~~ + a8.5
END

IF ~~ a8.3
  SAY ~I know what you mean.~
  IF ~~ + a8.5
END

IF ~~ a8.4
  SAY ~Ha-ha, very funny.~
  IF ~~ + a8.5
END

IF ~~ a8.5
  SAY ~Is there anything I can get you? Some... water, or some food, or a potion or anything?~
  ++ ~What... are you doing, exactly?~ + a8.6
  ++ ~What do you want, Arath?~ + a8.6
  ++ ~Are *you* feeling okay?~ + a8.6
  ++ ~Some water would be nice, actually. I'm a bit thirsty.~ + a8.7
  ++ ~Have you got any food? I could use a bite to eat...~ + a8.8
END

IF ~~ a8.6
  SAY ~I'm being... caring. You know, like a... like a good partner should be.~
  ++ ~Oh, so we're partners now, hmm?~ + a8.13
  ++ ~Is the only romance you've experienced through books, princess?~ + a8.14
  ++ ~It's very sweet, but it's unnecessary. Really.~ + a8.15
END

IF ~~ a8.7
  SAY ~Sure, let me just...~
  = ~Here. I don't know how much's left. Oh, wait--uh, wrong wineskin. Here. That one's actually wine. Ugh.~
  ++ ~Give me back the wine!~ + a8.9
  ++ ~Thanks.~ + a8.10
  ++ ~What's your angle here, exactly?~ + a8.6
END

IF ~~ a8.8
  SAY ~I know I've got some bread here somewhere... it might be a bit stale, but at least it's something.~
  = ~Here we go. Oh, uh, maybe not... I'm pretty sure that's mold.~
  ++ ~A bit of mold won't kill me. Give it here.~ + a8.11
  ++ ~Ah. Well, thanks anyway.~ + a8.10
  ++ ~What's your angle here, exactly?~ + a8.6
END

IF ~~ a8.9
  SAY ~But...~
  = ~Alright. Just don't drink it all. Who knows when we might need to get horrifyingly drunk.~
  IF ~~ + a8.15
END

IF ~~ a8.10
  SAY ~'Salright. Sorry.~
  IF ~~ + a8.15
END

IF ~~ a8.11
  SAY ~It's purple. I... really don't think that's safe to eat.~
  IF ~~ + a8.15
END

/*removed*/

IF ~~ a8.13
  SAY ~Ah. Yes? I was under that impression, anyway. Look, I... I just want to do this right.~
  ++ ~You are doing it right. Stop worrying.~ + a8.16
  ++ ~I know. It's adorable.~ + a8.17
  ++ ~So do I.~ + a8.18
  ++ ~Stop fussing over me, then. It drives me insane.~ + a8.19
END

IF ~~ a8.14
  SAY ~Uh. Maybe? Look, I... I just want to do this right. This isn't easy for me.~
  ++ ~You are doing it right. Stop worrying.~ + a8.16
  ++ ~I know. It's adorable.~ + a8.17
  ++ ~So do I.~ + a8.18
  ++ ~Stop fussing over me, then. It drives me insane.~ + a8.19
END

IF ~~ a8.15
  SAY ~I just want to do this right.~
  ++ ~You are doing it right. Stop worrying.~ + a8.16
  ++ ~I know. It's adorable.~ + a8.17
  ++ ~So do I.~ + a8.18
  ++ ~Stop fussing over me, then. It drives me insane.~ + a8.19
END

IF ~~ a8.16
  SAY ~Not likely.~
  IF ~~ EXIT
END

IF ~~ a8.17
  SAY ~Well, I'm glad someone's getting amusement out of it.~
  IF ~~ + a8.18
END

IF ~~ a8.18
  SAY ~(sigh) I'm not cut out for this.~
  IF ~~ EXIT
END

IF ~~ a8.19
  SAY ~If that's what you want, <CHARNAME>.~
  IF ~~ + a8.18
END


// Talk 3: at rest
IF ~Global("LK#ArathToBLovetalks","GLOBAL",6)~ a10
  SAY ~This is a lot harder than I thought. You know, I never wanted a... relationship. I just wanted to have sex with you.~
  ++ ~Relationships are hard at the best of times. Did you think this was going to be easy?~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",7) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a10.2
  ++ ~And they say romance isn't dead.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",7) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a10.2
  ++ ~Sometimes things just happen. In our case, I guess it turned out for the best.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",7) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a10.1
  ++ ~Right. Thanks. That's good to know.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",7) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a10.2
END

IF ~~ a10.1
  SAY ~Did it?~
  IF ~~ + a10.2
END

IF ~~ a10.2
  SAY ~I don't think I've ever been this attached to someone, and honestly, it scares me. A lot.~
  = ~I'm not even sure I'm happy anymore. I used to be happy, I used to be--so many things, and now it's different, and I want things to go back to how they were before you came along.~
  ++ ~Well if that's the way you feel about it, maybe we should call this off, then.~ + a10.3
  ++ ~I'm confused. Did I do something wrong? Did I--hurt your feelings somehow?~ + a10.4
  ++ ~I don't even think I know what happy is anymore.~ + a10.5
  ++ ~If you think you're going to drive me away, Arath, you're wrong.~ + a10.8
  ++ ~Oh, here we go, yet another fit of pique. You're a jackass.~ + a10.6
  ++ ~You *used* to be happy? That's an awful thing to say!~ + a10.7
END

IF ~~ a10.3
  SAY ~Yeah. Maybe we should.~
  IF ~~ + a10.10
END

IF ~~ a10.4
  SAY ~No. You didn't do anything. It's all me, as per usual. I'm just--I don't know if I can keep doing this.~
  IF ~~ + a10.10
END

IF ~~ a10.5
  SAY ~No. I don't suppose you would.~
  IF ~~ + a10.10
END

IF ~~ a10.6
  SAY ~You can say that again.~
  IF ~~ + a10.10
END

IF ~~ a10.7
  SAY ~I know.~
  IF ~~ + a10.10
END

IF ~~ a10.8
  SAY ~I just don't know if I can keep doing this.~
  IF ~~ + a10.10
END

IF ~~ a10.9
  SAY ~I don't know if I can keep doing this.~
  IF ~~ + a10.10
END

IF ~~ a10.10
  SAY ~I'll... I'll talk to you later.~
  IF ~~ EXIT
END

// Talk 4 at rest
IF ~Global("LK#ArathToBLovetalks","GLOBAL",8)~ a11
  SAY ~I have... a theory. It's a good theory. I think. You'll have to tell me if it's a good theory or a bad theory actually, because I'm a bit drunk. Maybe a lot drunk. And I can't really tell.~
  ++ ~And what would that theory be, exactly?~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",9)~ + a11.3
  ++ ~I'll have whatever you're having.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",9) ~ + a11.3
  ++ ~You don't want to do this when you're drunk, Arath. Whatever it is can wait til morning.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",9)~ + a11.1
  ++ ~Talking to me isn't a wise idea right now.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",9)~ + a11.2
END

IF ~~ a11.1
  SAY ~No, because, then I won't say it at all. I know how I work, okay?~
  IF ~~ + a11.3
END

IF ~~ a11.2
  SAY ~Actually I think it's the best idea I've had in a while, if you'll just listen for a moment.~
  IF ~~ + a11.3
END

IF ~~ a11.3
  SAY ~My theory is: if I drink enough firebrandy, I'll... did you want some firebrandy? Have some firebrandy. It's good.~
  ++ ~Pass the bottle and let's get this over with.~ + a11.5
  ++ ~I don't want any firebrandy, Arath. What's this about?~ + a11.5
  ++ ~You're equivocating. Tell me your theory.~ + a11.5
  ++ ~I'm really not interested in what you have to say.~ + a11.4
END

IF ~~ a11.4
  SAY ~Just--just give me a second. That's all I'm asking.~
  IF ~~ + a11.5
END

IF ~~ a11.5
  SAY ~Right, so I was thinking, if I drank enough firebrandy, like... a lot of firebrandy, I'm talkin'... a lot. Maybe I'd be able to apologise to you.~
  = ~D'you think it's a good theory? Maybe?~
  ++ ~You haven't actually said you're sorry yet.~ + a11.6
  ++ ~It's got one or two flaws in it, but I'll accept the premise for now.~ + a11.6
  ++ ~If you can't apologise to me when you're sober, I don't want you to apologise at all.~ + a11.6
  ++ ~No. Just no, Arath.~ + a11.6
END

IF ~~ a11.6
  SAY ~I'm sorry. I'm *really* sorry. I don't think... I've ever been this sorry in my life. Though I guess that's not very hard.~
  = ~The problem is... I just like you too much. Love you too much. Looove. 'Saweird word. A good one though. I like it.~
  ++ ~I love you too, Arath, but... you can't keep doing this. We're never going to work if you do.~ + a11.7
  ++ ~We all make mistakes. And that's okay. I love you, and I'm not going to let some stupid fight come between us.~ + a11.7
  ++ ~You love me so much that you regularly hurt my feelings and then wait until you're drunk to apologise? I don't think so.~ + a11.7
  ++ ~You might think you love me, but the way you treat me isn't love. I would never treat you the way you treat me.~ + a11.8
END

IF ~~ a11.7
  SAY ~I know. I'll... I'm gonna do better. I'm gonna be better for you.~
  IF ~~ + a11.9
END

IF ~~ a11.8
  SAY ~I... I know. But I do love you, I swear, with the gods as my witness. I'm gonna do better. I'm gonna be better for you.~
  IF ~~ + a11.9
END

IF ~~ a11.9
  SAY ~Sorry for being an idiot.~
  ++ ~You're not an idiot, you just act like one sometimes, that's all.~ + a11.10
  ++ ~You should be. What you said was horrible, and I don't ever want to hear you say it again.~ + a11.11
  ++ ~We all have these little lapses from time to time. Pass me the firebrandy.~ + a11.12
  ++ ~I can't do this, Arath, and I won't anymore.~ + a11.13
END

IF ~~ a11.10
  SAY ~'Sthe same thing.~
  IF ~~ + a11.14
END

IF ~~ a11.11
  SAY ~I know. You won't. I promise.~
  IF ~~ + a11.14
END

IF ~~ a11.12
  SAY ~Yes, <PRO_SIRMAAM>. There's not a whole lot left, though.~
  IF ~~ + a11.14
END

IF ~~ a11.13
  SAY ~Oh.~
  = ~Well... just think about it. Please. I... I don't want to be alone.~
  = ~I'll see you in the morning.~
  IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ a11.14
  SAY ~Um, I have to go be... on the ground now. (yawn)~
  = ~Love you.~
  IF ~~ DO ~RestParty()~ EXIT
END


// Talk 5: morning after.
IF ~Global("LK#ArathToBLovetalks","GLOBAL",10)~ a9
  SAY ~Oh gods... what on Toril was I drinking last night. Oh. Oh gods. Excuse me--~
  ++ ~Good morning to you, too.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",11) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a9.1
  ++ ~You deserve every bit of misery you get, moron.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",11) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a9.1
  ++ ~Firebrandy. And you're excused.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",11) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a9.1
  ++ ~Don't talk to me.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",11) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a9.1
END

IF ~~ a9.1
  SAY ~Ugh, okay, that doesn't sound great. I'm almost scared to ask. Scratch that, I am scared. What, uh... what happened?~
  ++ ~You drank enough liquid courage to fell an ox, then attempted to apologise for behaving like an idiot.~ + a9.3
  ++ ~You attempted to make up for behaving like a child, and failed miserably.~ + a9.3
  ++ ~We're over, Arath. I refuse to play this game anymore.~ + a9.2
END

IF ~~ a9.2
  SAY ~Please, just let me--please, don't leave. Not now. I... I don't know what I'd do.~
  ++ ~(sigh) I'm tired of this, Arath. It's like you're five years old, and every time you throw a temper tantrum I'm the one who has to deal with it.~ + a9.5
  ++ ~I'm sorry. It's just not going to work.~ + a9.6
  ++ ~If you really cared about me, you wouldn't treat me this way. We're done.~ + a9.6
END

IF ~~ a9.3
  SAY ~Right. Well.~
  = ~I think I'm done with firebrandy, I know that much.~
  = ~I don't--I don't have a lot of people I can talk to about things. Especially out here. So you just end up being... well. You're my best friend and my lover. And sometimes it's hard to... separate those things.~
  = ~I shouldn't have said what I did the other day. But... I wasn't trying to be petty. This relationship does scare me. I've never cared about someone so much.~
  = ~What happens if you leave me? Or if you die? What do I do then?~
  ++ ~You go on with your life, just like everybody else.~ + a9.4
  ++ ~I'm not going to leave you, and I'm not going to die. Don't be ridiculous.~ + a9.4
  ++ ~I don't want you to have to find out, do I suggest you stop behaving like a child, and act like an adult.~ + a9.5
  ++ ~You're about to find out. We're done. I'm sick of this.~ +  a9.2
END

IF ~~ a9.4
  SAY ~I don't want to lose you.~
  ++ ~You're not going to. So stop worrying about it, and let's get on with our lives.~ + a9.7
  ++ ~Stop whinging and man up, honeybunch. We've got work to do.~ + a9.7
  ++ ~I swear to every single god, if you keep this up, you will!~ + a9.7
  ++ ~... We're done. I'm sorry. But I really can't. I just... I can't.~ + a9.6
END

IF ~~ a9.5
  SAY ~... I deserve that, I know. I won't. I mean, I'll try.~
  IF ~~ + a9.4
END

IF ~~ a9.6
  SAY ~I'm... I'm sorry I disappointed you so much.~
  = ~Don't take this the wrong way, but I... I think I need to go. Away from here. Away from--you. For a while.~
  = ~Maybe I'll see you sometime. Thanks, <CHARNAME>, and I'm... I'm really sorry.~
  IF ~~ DO ~SetGlobal("LK#ArathRomanceActive","GLOBAL",3) DropInventory() SetGlobal("LK#ArathJoined","GLOBAL",0) LeaveParty() EscapeArea()~ EXIT
END

IF ~~ a9.7
  SAY ~Yes, <PRO_SIRMAAM>.~
  IF ~~ EXIT
END

// talk6. At night.
IF ~Global("LK#ArathToBLovetalks","GLOBAL",12)~ a14
  SAY ~Can I... can I talk to you about something? And I just need you to... to listen. And not to judge. Because I don't think I could handle it if you did.~
  ++ ~Of course. And just so you know... nothing you can say will change how I think about you.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",13) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a14.2
  ++ ~I'm all ears, handsome.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",13) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a14.2
  ++ ~Don't be ridiculous. I'm not going to judge you.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",13) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a14.2
  ++ ~Can it wait? We're a little busy...~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",13) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a14.1
END

IF ~~ a14.1
  SAY ~No, I... I need to say it now, or I'm never...~
  IF ~~ + a14.2
END

IF ~~ a14.2
  SAY ~I'm just so ashamed, <CHARNAME>. What the wraith said... it wasn't lying. I knew my father was doing something to my mother, and I just... I didn't question it. And she died.~
  = ~I didn't save her, and I could have. Even at five, I could have done something. I could have told her, warned her. But I didn't, because I was... I was scared.~
  = ~I was so afraid, <CHARNAME>, and I... I feel so worthless. So stupid. So incredibly stupid.~
  = ~I'd hoped to forget it. To put it behind me, to do better. Be better.~
  = ~But I'm not. I'm not better. I'm never going to *be* better. No matter how hard I try, I'm always just going to be stupid and weak, and I...~
  = ~I don't... deserve you. And I know I'll never find anyone better than you, who loves me like you do. And I'm just. I don't... I don't...~
  = ~I don't understand how you can love me.~
  ++ ~Oh, gods, Arath, you're not stupid, or weak, or worthless. You're mine. And you're amazing.~ + a14.3
  ++ ~Hey... hey, sweetheart, it's okay. Shhh. Come here. It's okay.~ + a14.4
  ++ ~Neither can I, looking at you right now. Stop crying and being ridiculous. You're better than this, I swear.~ + a14.5
  ++ ~Chin up, Arath. Snap out of it, and stop blaming yourself. It wasn't your fault.~ + a14.6
END

IF ~~ a14.3
  SAY ~No I'm not. I'm not amazing. But you are, and I'm--I'm so lucky to have you, <CHARNAME>, and I don't know... I don't know what I'd do without you.~
  IF ~~ + a14.7
END

IF ~~ a14.4
  SAY ~I'm... I'm so lucky to have you, <CHARNAME>, you have no idea. I don't--I don't know what I'd do without you.~
  IF ~~ + a14.7
END

IF ~~ a14.5
  SAY ~I know. I know I am. It's just hard to think that when an apparition of your dead mother appears and tells you otherwise.~
  = ~I'm so lucky to have you, <CHARNAME>, and I don't--I don't know what I'd do without you, sometimes.~
  IF ~~ + a14.7
END

IF ~~ a14.6
  SAY ~I know. I know it wasn't. It's just hard to think that when an apparition of your dead mother appears and tells you otherwise.~
  = ~I'm so lucky to have you, <CHARNAME>, and I don't--I don't know what I'd do without you, sometimes.~
  IF ~~ + a14.7
END

IF ~~ a14.7
  SAY ~I've never told anyone the things I've told you. You make me feel so at ease, so protected and loved and...~
  = ~I hope I can make you feel that way someday. So you know how much I care about you.~
  ++ ~You make me feel that way every day.~ + a14.8
  ++ ~There *are* other ways to show me how much you love me, you know... (wink)~ + a14.9
  ++ ~You don't need to prove your love, Arath. You just need to accept mine.~ + a14.10
  ++ ~And someday I hope I can make you love yourself as much as I do.~ + a14.11
  ++ ~Okay, I think you've hit my daily limit of sap, now, Arath. Come on.~ + a14.12
END

IF ~~ a14.8
  SAY ~Then I want to make you feel it even more.~
  IF ~~ + a14.13
END

IF ~~ a14.9
  SAY ~Oh, I know. Trust me. I know. (grin)~
  IF ~~ + a14.13
END

IF ~~ a14.10
  SAY ~I think I can do that. As long as you accept mine.~
  IF ~~ + a14.13
END

IF ~~ a14.11
  SAY ~Heh, best of luck with that. But I appreciate the sentiment.~
  IF ~~ + a14.13
END

IF ~~ a14.12
  SAY ~I know. Just one more thing, I promise, then it'll be over.~
  IF ~~ + a14.13
END

IF ~~ a14.13
  SAY ~Thanks for letting me talk. It's not easy for me to be so--to explain things, but I'm glad you'll let me.~
  = ~That said, I think I'm due for a kiss.~
  ++ ~I think you are, at that.~ + a14.14
  ++ ~Maybe later. (grin)~ + a14.15
  ++ ~Not right now, sweetheart.~ + a14.16
  ++ ~I suppose if I must.~ + a14.14
END

IF ~~ a14.14
  SAY ~Mmm... alright. Let's go.~
  IF ~~ EXIT
END

IF ~~ a14.15
  SAY ~Later, hmm? I think I can deal with that... lover<PRO_GIRLBOY>.~
  IF ~~ EXIT
END

IF ~~ a14.16
  SAY ~So I bare my heart to you and all I get is a pat on the backside? Come on, lover<PRO_GIRLBOY.~
  = ~Oh, alright then. But I'm getting one from you later, if it's the last thing I do. Come on.~
  IF ~~ EXIT
END

// Talk 7 - in place of hugging dialogue
IF ~Global("LK#ArathToBLovetalks","GLOBAL",14)~ a12
  SAY ~Hold my hand?~
  ++ ~Of course.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",15)~ + a12.1
  ++ ~Wait, how old are you again?~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",15)~ + a12.2
  ++ ~You want me to hold your hand. Seriously?~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",15)~ + a12.3
  ++ ~I don't think so.~ DO ~SetGlobal("LK#ArathToBLovetalks","GLOBAL",15)~ + a12.4
END

IF ~~ a12.1
  SAY ~I've been thinking, and I wanted to tell you... I am happy with you. I don't think I actually knew what that was before you. Trite, but true.~
  = ~You make me smile, you give me a reason to keep going, and you set me on insane adventures against unimaginably powerful foes. I don't know what else a man could ask for.~
  ++ ~I didn't think you had a shred of actual romanticism in you, love. I've never been more glad to be proven wrong.~ + a12.5
  ++ ~You're the most handsome, smart, funny guy a <PRO_MANWOMAN> could ever hope for, and I'm lucky to have you, too.~ + a12.6
  ++ ~Oh, gods... must you? Really? You know how much I hate that mushy crap.~ + a12.7
  ++ ~A normal life, maybe. I'm just sorry I can never give you it.~ + a12.8
END

IF ~~ a12.2
  SAY ~(grin) Five, obviously. Come on, just do it. It won't kill you.~
  IF ~~ + a12.1
END

IF ~~ a12.3
  SAY ~Yes, seriously. Come on, just do it. It won't kill you.~
  IF ~~ + a12.1
END

IF ~~ a12.4
  SAY ~Just do it, <CHARNAME>, it won't kill you, and it'll make me happy.~
  IF ~~ + a12.1
END

IF ~~ a12.5
  SAY ~Mm, you should say that more often. And yes, as a matter of fact, I am absolutely a romantic. I am the most romantic of all romantic... romantickers.~
  IF ~~ + a12.9
END

IF ~~ a12.6
  SAY ~Well, I'm glad *someone* agrees with me. (grin)~
  IF ~~ + a12.9
END

IF ~~ a12.7
  SAY ~I'm sorry, darling, but it needs to be said. Now it's out there, and it can float free in the ether, no longer tethered to my own fevered imaginings.~
  IF ~~ + a12.9
END

IF ~~ a12.8
  SAY ~If I wanted normal, do you really think I'd have fallen in love with *you*, <CHARNAME>?~
  = ~Wait, uh. I mean that in the best possible way, of course. You're not normal. You're extraordinary.~
  IF ~~ + a12.9
END

IF ~~ a12.9
  SAY ~Whatever happens, <CHARNAME>, however this ends... I love you.~
  ++ ~I love you too, Arath. From the bottom of my heart.~ + a12.10
  ++ ~Me too. (wink)~ + a12.11
  ++ ~I know.~ + a12.11
  ++ ~(groan) Oh, come on. Let's get going.~ + a12.12
  ++ ~Love you too, you great lug.~ + a12.11
END

IF ~~ a12.10
  SAY ~(Arath brushes his hand along your cheek and reaches behind your neck, pulling you in for a slow, tender kiss. When he finally pulls away, he smiles and entwines his fingers with yours).~
  = ~Shall we?~
  IF ~~ EXIT
END

IF ~~ a12.11
  SAY ~Mmm, I'm going to get you for that.~
  IF ~~ + a12.10
END

IF ~~ a12.12
  SAY ~Oh, hush.~
  IF ~~ + a12.10
END


// Plot: Saradush
IF ~Global("LK#ArathToBSaradush","GLOBAL",2)~ a3
  SAY ~You know, people talk about crimes against nature, but...~
  ++ ~Yeah.~ DO ~SetGlobal("LK#ArathToBSaradush","GLOBAL",3)~ + a3.4
  ++ ~I don't believe it either. I may never sleep again.~ DO ~SetGlobal("LK#ArathToBSaradush","GLOBAL",3)~ + a3.4
  ++ ~What are you talking about?~ DO ~SetGlobal("LK#ArathToBSaradush","GLOBAL",3)~ + a3.1
  ++ ~Are you alright?~ DO ~SetGlobal("LK#ArathToBSaradush","GLOBAL",3)~ + a3.2
  ++ ~I'm not interested, Arath.~ DO ~SetGlobal("LK#ArathToBSaradush","GLOBAL",3)~ + a3.3
END

IF ~~ a3.1
  SAY ~Saradush.~
  IF ~~ + a3.4
END

IF ~~ a3.2
  SAY ~Yeah.~
  = ~No. I don't know.~
  IF ~~ + a3.4
END

IF ~~ a3.3
  SAY ~I just thought--~
  = ~Forget it. You obviously don't care anyway.~
  IF ~~ DO ~RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ EXIT
END

IF ~~ a3.4
  SAY ~All those people... men, women, children. Bhaalspawn, and not. Innocent, and not.~
  IF ~~ DO ~RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",3600)~ + a3.4a
END

IF ~~ a3.4a
  SAY ~Everyone says war is this terrible thing, that it's the worst part of being civilized... but I didn't really know what that meant until now.~
  ++ ~War is a terrible, tragic thing. It's abhorrent, and until you've seen it for yourself, there is no way of understanding it.~ + a3.5
  ++ ~It is awful. Not quite as awful as your hair first thing in the morning, but hey, it's still pretty bad.~ + a3.6
  ++ ~War's not so bad. Yes, people die, and terrible things happen, but it creates change, and can pave the way for better things.~ + a3.7
  ++ ~I don't know, I'd say a good war is the best part of civilization! Profiteering, normal morality out the window... it's a recipe for good times!~ + a3.8
  ++ ~Deal with these little breakdowns on your own time. We're busy.~ + a3.3
END

IF ~~ a3.5
  SAY ~Maybe if more people understood the realities of war, there'd be less of it. (sigh)~
  IF ~~ + a3.9
END

IF ~~ a3.6
  SAY ~I'm sorry, <CHARNAME>, I just don't have it in me to laugh right now. But thanks.~
  IF ~~ + a3.9
END

IF ~~ a3.7
  SAY ~I hadn't thought about it that way. It's still awful.~
  IF ~~ + a3.9
END

IF ~~ a3.8
  SAY ~Just add cardamom, huh?~
  = ~Sorry. I just don't have it in me to joke right now.~
  IF ~~ + a3.9
END

IF ~~ a3.9
  SAY ~It's just a bit hard to comprehend is all. If I hadn't seen it for myself... and now I almost wish I hadn't. I still feel sick to my stomach thinking about it.~
  ++ ~I'm just trying not to think about it.~ + a3.10
  ++ ~The best we can do is continue and ensure those that perpetrated this crime are punished.~ + a3.11
  ++ ~I know what you mean. I'll be having nightmares about it for... for a long time.~ + a3.12
  ++ ~If you could go back in time and prevent yourself from seeing it, would you?~ + a3.13
  ++ ~You're more weak-willed than I thought if *that* makes you sick.~ + a3.14
END

IF ~~ a3.10
  SAY ~I wish I could do that.~
  IF ~~ + a3.15
END

IF ~~ a3.11
  SAY ~And we will, eventually. But somehow that thought doesn't make it better.~
  IF ~~ + a3.15
END

IF ~~ a3.12
  SAY ~There's this one woman I can't stop seeing. She looked like she was reaching for something, and I can't help but wonder...~
  IF ~~ + a3.15
END

IF ~~ a3.13
  SAY ~I don't know. No. I guess I wouldn't. It was terrible, but... I don't know.~
  IF ~~ + a3.15
END

IF ~~ a3.14
  SAY ~Lots of things make me sick, <CHARNAME>. There's no shame in admitting that. And if you think there is, well... good for you, if that makes you happy. I'd rather feel sick than just accept it.~
  IF ~~ + a3.15
END

IF ~~ a3.15
  SAY ~In a way, it was sort of necessary... I don't say that because I enjoy the destruction of assorted towns, but the Bhaalspawn are a very real threat that need to be eliminated.~
  = ~I just wish there could have been another way.~
  ++ ~There's always another way. Some people just prefer to take the easy way out.~ + a3.16
  ++ ~It didn't need to be that way, no. Not all of those people were Bhaalspawn.~ + a3.17
  ++ ~If it helps, we would have had to hunt down them down anyway. The Bhaalspawn are a threat. I should know.~ + a3.18
  ++ ~A little bit of violence and mayhem each day day keeps societal destruction and havok at bay.~ + a3.19
  ++ ~It happened, it was bad, there's no reason to dwell on it.~ + a3.20
END

IF ~~ a3.16
  SAY ~Maybe.~
  IF ~~ + a3.21
END

IF ~~ a3.17
  SAY ~No, they weren't, but... is it somehow justified anyway?~
  = ~That wasn't a question. Not really. I don't think I want to know the answer.~
  IF ~~ + a3.21
END

IF ~~ a3.18
  SAY ~I know. I'm just... stuck on it, you know?~
  IF ~~ + a3.21
END

IF ~~ a3.19
  SAY ~Did you make that up just then? That's pretty impressive. Not sure how correct it is, but it sounds good.~
  IF ~~ + a3.21
END

IF ~~ a3.20
  SAY ~I guess you're right. I'm just... stuck on it, you know?~
  IF ~~ + a3.21
END

IF ~~ a3.21
  SAY ~Anyway. Didn't meant to get all deep and melancholic there. I'll be alright.~
  IF ~~ EXIT
END

END

// Wraith
//  Wraith is about his mother 'abandoning' him because he wasn't good enough.

EXTEND_BOTTOM HGWRA01 18
  IF ~Global("LK#ArathRomanceActive","GLOBAL",2) InParty("Arath")~ DO ~SetGlobal("LK#ArathWraith","GLOBAL",1)~ EXTERN HGWRA01 wraith
END

EXTEND_BOTTOM HGWRA01 24
  IF ~Global("LK#ArathRomanceActive","GLOBAL",2)~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("lk#arwr1")~ EXIT
END

CHAIN HGWRA01 wraith
  ~What of the inevitable pain you must give to the one you love? The druid, Arath.~
  == LK#AR25J ~<CHARNAME> wouldn't hurt me, ghost. Don't be ridiculous.~
  == HGWRA01 ~Ridiculous, is it? <PRO_HESHE> will leave you, one way or another. Just like all the others.~
EXTERN HGWRA01 24

//summons Arath's mother

CHAIN IF ~Global("LK#ArathWraith","GLOBAL",1)~ THEN LK#ARMOM wraith.1
  ~Look at how much you've grown...~
  == LK#AR25J ~What--what kind of trick is this, you're... you can't be...~
  == LK#ARMOM ~It's hardly surprising that you don't remember. After all, I left you so young.~
  == LK#AR25J ~You're not real. This is an illusion of some kind, it's--~
  == LK#ARMOM ~Don't be foolish, Arath. But then, you never could help yourself, could you, sweetheart?~
  == LK#AR25J ~What are you talking about?~
  == LK#ARMOM ~Don't pretend you don't know. You were never the smartest, were you, darling? Nor the strongest. All those tears after I died... poor little Arath, all alone.~
  = ~And to think, you knew all along. Your father, slowly adding poison to my meals, my drinks. And you just watched.~
  == LK#AR25J ~I... Who could I have turned to? What could I have done?!~
  == LK#ARMOM ~Something. Anything. But you never were strong enough... always begging for your father's approval, even then. You chose him.~
  == LK#AR25J ~Gods, please, don't say that, please, please, I--I did my best, I...~
  == LK#ARMOM ~I know, sweetheart. But your best just isn't good enough. And look at you... it still isn't. You're still just as wanting as you were when you were five years old.~
  == LK#AR25J ~I'm... I'm so sorry, mother, I didn't... please... oh gods, please, don't...~
END
  ++ ~Don't listen to her, Arath, it wasn't your fault!~ DO ~SetGlobal("LK#ArathWraith","GLOBAL",2)~ EXTERN HGWRA01 25
  ++ ~That is enough! I won't have you do this any longer, fiend!~ DO ~SetGlobal("LK#ArathWraith","GLOBAL",2)~ EXTERN HGWRA01 25
  ++ ~Gorion, stop it! Don't do this!~ DO ~SetGlobal("LK#ArathWraith","GLOBAL",2)~ EXTERN HGWRA01 25
  ++ ~Arath, it's not real, snap out of it!~ DO ~SetGlobal("LK#ArathWraith","GLOBAL",2)~ EXTERN HGWRA01 25


APPEND LK#AR25J
// Post-wraith dialogue
IF ~Global("LK#ArathWraith","GLOBAL",3)~ a13
  SAY ~Don't... please, just don't say anything, I just want to be alone.~
  ++ ~I'm not going to leave you alone.~ + a13.1
  ++ ~Snap out of it, Arath. We've got work to do.~ + a13.2
  ++ ~I'm so sorry, love. Is there anything I can do?~ + a13.2
  ++ ~You know in your heart it was all a lie.~ + a13.3
  ++ ~I... I had no idea.~ + a13.4
END

IF ~~ a13.1
  SAY ~I don't want to talk to you. Or anyone. Just leave me alone. Please.~
  IF ~~ DO ~SetGlobal("LK#ArathWraith","GLOBAL",4) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ a13.2
  SAY ~Just leave me alone. Please.~
  IF ~~ DO ~SetGlobal("LK#ArathWraith","GLOBAL",4) RealSetGlobalTimer("LK#ArathToBRomanceTimer","GLOBAL",1800)~ EXIT
END

IF ~~ a13.3
  SAY ~Just because it was an illusion doesn't make it a lie.~
  IF ~~ + a13.2
END

IF ~~ a13.4
  SAY ~Of course you didn't. I didn't want you to. Just...~
  IF ~~ + a13.2
END
END


// Interjections
// Draconis
I_C_T BAZDRA01 0 LK#ArathDraconis
  == LK#AR25J IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Something's not right here... he shouldn't be alone. Though it's always the attractive ones harbouring the dark secrets, I suppose.~
END

I_C_T HGNYA01 6 LK#ArathNyalee
  == LK#AR25J IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~This woman is old... older than she looks, even. Just look at her clothes. They're literally falling apart. Tread carefully, <CHARNAME>. This one might bite.~
END

I_C_T HGNYA01 29 LK#ArathNyalee2
  == LK#AR25J IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Poor woman. I almost sympathise with her... but not quite, of course, since--yep, those are angry spirits. Great.~
END

I_C_T AMMAYOR 5 LK#ArathAmmayor
  == LK#AR25J IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~<CHARNAME>, be careful, getting involved in local politics could be tricky. We don't want to make enemies of someone who could be useful.~
END

I_C_T BAZEYE01 9 LK#ArathBazeye
  == LK#AR25J IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~They certainly smell of something, but I'm relatively sure it isn't cheese. I've heard moldy cheese is a delicacy in certain places, though, so maybe that? Who knows. He's definitely crazy, though.~
END

I_C_T SARKIS01 15 LK#ArathSarkis
  == LK#AR25J IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~It can't hurt to listen, right? He could be useful.~
END

I_C_T SARMEL01 36 LK#ArathMelissan
  == LK#AR25J IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~You can't really be faulted for trying to avoid bloodshed, Melissan. I'm sure you did your best.~
  == SARMEL01 ~Perhaps. But perhaps I could have done more. Alas... we will never know.~
END

I_C_T SARWAI01 1 LK#ArathWaitress
  == LK#AR25J IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Many people would suggest that perhaps if you ignored them, they'd go away. My advice? Try a little hemroot in their wine. They won't die, but they'll certainly not be at their best for a few days. (grin)~
END

I_C_T SENDAI 13 LK#ArathSendai
  == LK#AR25J IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Somehow I doubt <CHARNAME> would ally <PRO_HIMHER>self with such as you, drow. Those who ally themselves with illithid aren't generally a safe bet. Oh, we killed it, too, by the way. Sorry about the mess. Tentacles are so hard to get out of carpet, I know.~
END

// Volo
EXTEND_BOTTOM SARVOLO 9 #7
+ ~InParty("Arath") Global("LK#ArathRomanceActive","GLOBAL",2)~ + ~Tell me about Arath.~ EXTERN SARVOLO arathromance
+ ~InParty("Arath") !Global("LK#ArathRomanceActive","GLOBAL",2)~ + ~Tell me about Arath.~ EXTERN SARVOLO arath
END

CHAIN SARVOLO arathromance
  ~Arath Duskhelm, once the sheltered child of an Athkatlan slavemaster, has made a name for himself in the company of his beloved <CHARNAME>, having torn apart the very organisation his father once created.~
EXTERN LK#AR25J arath_volo

CHAIN SARVOLO arath
  ~Born to an Athkatlan slavemaster and his ailing wife, Arath Duskhelm marked himself as a force to be reckoned with when he killed his own father and tore apart his organisation, exacting justice for those whose lives had been ruined by his own flesh and blood.~
EXTERN LK#AR25J arath_volo

CHAIN LK#AR25J arath_volo
 ~Hmm, not bad, I suppose. Still, I'd like to hear a little more about my glamorous good looks, intellect and charm.~
EXTERN SARVOLO 9

// Solar
EXTEND_BOTTOM FINSOL01 27
  IF ~InParty("Arath") !Global("LK#ArathRomanceActive","GLOBAL",2) Global("LK#ArathFinSol","GLOBAL",0)~ DO ~SetGlobal("LK#ArathFinSol","GLOBAL",1)~ EXTERN LK#AR25J LK#ArathFinSol1
  IF ~InParty("Arath") Global("LK#ArathRomanceActive","GLOBAL",2) Global("LK#ArathFinSol","GLOBAL",0)~ DO ~SetGlobal("LK#ArathFinSol","GLOBAL",1)~ EXTERN LK#AR25J LK#ArathFinSol2
END

CHAIN LK#AR25J LK#ArathFinSol1
  ~Power is a dangerous thing, <CHARNAME>. It can twist you from the inside until you don't know yourself anymore... If you choose to accept this, you better be damned sure you can handle it.~
COPY_TRANS FINSOL01 27

CHAIN LK#AR25J LK#ArathFinSol2
  ~Oh, gods, please. Don't do this. Not now. I can't... maybe it's selfish, but <CHARNAME>, what would I do? What could I do without you? What would I *be* without you?~
END
  ++ ~Just as wonderful and beautiful as you are now.~ EXTERN LK#AR25J LK#ArathFinSol2.1
  ++ ~You'd be fine, sweetheart. You're stronger than you think.~ EXTERN LK#AR25J LK#ArathFinSol2.1
  ++ ~What would you do in my position, if you were offered the chance?~ EXTERN LK#AR25J LK#ArathFinSol2.2

CHAIN LK#AR25J LK#ArathFinSol2.1
  ~I can't do this without you, <CHARNAME>. I love you more than I ever thought I had the capacity to... please tell me you love me like I love you.~
COPY_TRANS FINSOL01 27

CHAIN LK#AR25J LK#ArathFinSol2.2
  ~I...~
  = ~I wouldn't accept it. I don't know what I would become without you next to me, there for me.~
EXTERN LK#AR25J LK#ArathFinSol2.1

EXTEND_BOTTOM FINSOL01 29
  IF ~InParty("Arath") Global("ArathPCGod","GLOBAL",0) Global("LK#ArathRomanceActive","GLOBAL",2)~ DO ~SetGlobal("ArathPCGod","GLOBAL",1)~ EXTERN LK#AR25J ArathPCGodRomance
  IF ~InParty("Arath") Global("ArathPCGod","GLOBAL",0) !Global("LK#ArathRomanceActive","GLOBAL",2)~ DO ~SetGlobal("ArathPCGod","GLOBAL",1)~ EXTERN LK#AR25J ArathPCGod
END

EXTEND_BOTTOM FINSOL01 30
  IF ~InParty("Arath") Global("ArathPCGod","GLOBAL",0) Global("LK#ArathRomanceActive","GLOBAL",2)~ DO ~SetGlobal("ArathPCGod","GLOBAL",1)~ EXTERN LK#AR25J ArathPCGodRomance
  IF ~InParty("Arath") Global("ArathPCGod","GLOBAL",0) !Global("LK#ArathRomanceActive","GLOBAL",2)~ DO ~SetGlobal("ArathPCGod","GLOBAL",1)~ EXTERN LK#AR25J ArathPCGod
END

EXTEND_BOTTOM FINSOL01 31
  IF ~InParty("Arath") Global("ArathPCGod","GLOBAL",0) Global("LK#ArathRomanceActive","GLOBAL",2)~ DO ~SetGlobal("ArathPCGod","GLOBAL",1)~ EXTERN LK#AR25J ArathPCGodRomance
  IF ~InParty("Arath") Global("ArathPCGod","GLOBAL",0) !Global("LK#ArathRomanceActive","GLOBAL",2)~ DO ~SetGlobal("ArathPCGod","GLOBAL",1)~ EXTERN LK#AR25J ArathPCGod
END

EXTEND_BOTTOM FINSOL01 32
  IF ~InParty("Arath") Global("ArathPCNotGod","GLOBAL",0) Global("LK#ArathRomanceActive","GLOBAL",2)~ DO ~SetGlobal("ArathPCNotGod","GLOBAL",1)~ EXTERN LK#AR25J ArathPCNotGodRomance
  IF ~InParty("Arath") Global("ArathPCNotGod","GLOBAL",0) !Global("LK#ArathRomanceActive","GLOBAL",2)~ DO ~SetGlobal("ArathPCNotGod","GLOBAL",1)~ EXTERN LK#AR25J ArathPCNotGod
END

CHAIN LK#AR25J ArathPCGodRomance
  ~<CHARNAME>... gods...~
  = ~How could you--no. Just...~
  = ~Do what you can. Do... good things. Wonderful things. And think of me often. Remember me. I'll... I could never forget you.~
  = ~I can't... just go, now before I say something I'll regret.~
  = ~I... I love you.~
COPY_TRANS FINSOL01 29

CHAIN LK#AR25J ArathPCGod
  ~Be careful, <CHARNAME>. And do good things. Wonderful things. Also, when you get a chance, send something exciting my way one day, hey? (grin)~
COPY_TRANS FINSOL01 29

CHAIN LK#AR25J ArathPCNotGodRomance
  ~I'm the luckiest man in the world. I love you.~
COPY_TRANS FINSOL01 32

CHAIN LK#AR25J ArathPCNotGod
  ~I know it must have been hard, but... I think it's for the best. There's so much you can do here on Faerun, <CHARNAME>. And I have no doubt you will. Thanks for everything. (grin)~
COPY_TRANS FINSOL01 32