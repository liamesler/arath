// ****************************
//                            *
//   Arath start dialogues    *
//                            *
// ****************************
BEGIN LK#ARATH

IF ~NumTimesTalkedTo(0)~ j
  SAY ~Enjoying to<DAYNIGHT>'s entertainment, my <PRO_LADYLORD>? You don't look like one any of the Coronet's regulars.~
  ++ ~I'm new around here.~ + j.1
  ++ ~Well hello there, handsome.~ + j.3
  ++ ~Could you explain what's going on?~ + j.2
  ++ ~What is this place?~ + j.2
  ++ ~Whatever it is you're selling, I'm not interested.~ + j.4
  ++ ~I'm not, and I don't intend on staying.~ + j.5
END

IF ~~ j.1
  SAY ~Well that's a little obvious. You don't have a tankard in your hand or the requisite food stains, and you don't look like you were freshly scraped off the street.~
  IF ~~ + j.5
END

IF ~~ j.2
  SAY ~Welcome to the pit! Athkatla's most violent and offensive source of entertainment.~
  IF ~~ + j.5
END

IF ~~ j.3
  SAY ~You flatter me, my <PRO_LADYLORD>!~
  IF ~~ + j.5
END

IF ~~ j.4
  SAY ~Wait a moment.~
  IF ~~ + j.13
END

IF ~~ j.5
  SAY ~Are you enjoying the festivities? I thought that last match was particularly enthralling. The height difference was a treat, if nothing else.~
  ++ ~I think what goes on here is disgusting.~ + j.6
  ++ ~I'm not sure what the point of it is, myself.~ + j.6
  ++ ~I've always enjoyed a good pit fight, I have to admit.~ + j.7
  ++ ~You don't sound particularly enthused.~ + j.8
END

IF ~~ j.6
  SAY ~You're not the only one, but I wouldn't say that so loudly if I was you. Lehtinan's guards will throw you out as soon as look at you. He does like to keep this quiet, as you might understand.~
  IF ~~ + j.9
END

IF ~~ j.7
  SAY ~Well, why else would you be here, I suppose? There's nothing else quite like it.~
  = ~I'm not here for the pit fights, myself.~
  IF ~~ + j.9
END

IF ~~ j.8
  SAY ~Is it that obvious? And here I was thinking those acting lessons paid off.~
  = ~Let's just say I'm not here for the pit fights.~
  IF ~~ + j.9
END

IF ~~ j.9
  SAY ~I'm Arath, by the way.~
  ++ ~<CHARNAME>. A pleasure to meet you.~ + j.10
  ++ ~<CHARNAME>; perhaps you've heard of me?~ + j.11
  ++ ~I'm <CHARNAME>, savior of the Sword Coast.~ + j.12
  ++ ~<CHARNAME>.~ + j.12
END

IF ~~ j.10
  SAY ~The pleasure is all mine, I assure you.~
  IF ~~ + j.13
END

IF ~~ j.11
  SAY ~I haven't, I'm afraid. Nice to meet you.~
  IF ~~ + j.13
END

IF ~~ j.12
  SAY ~A pleasure to meet you, <CHARNAME>. Shame about the location.~
  IF ~~ + j.13
END

IF ~~ j.13
  SAY ~You look terribly capable, if you don't mind me saying so. Very... prepared.~
  = ~Would you be averse to an exchange of services? It just so happens I'm in a bit of a bind, and I could use the help of someone so obviously trained in the arts of battle.~
  ++ ~What do you need?~ + j.14
  ++ ~What are you trying to do?~ + j.14
  ++ ~That depends on what I would be getting in exchange.~ + j.15
  ++ ~I'm not interested.~ + j.4
END

IF ~~ j.14
  SAY ~The owner of this establishment, Lehtinan, deals extensively in the slave trade, as you may have noticed. I'm trying to cause him some trouble.~
  = ~The slaves here are bought and forced to fight innocent animals and other creatures for the amusement of the scum that frequent this place. There are women and children in cells here, <CHARNAME>. It has to stop.~
  = ~Will you help me?~
  ++ ~Any enemy of the slave trade is a friend of mine.~ + j.16
  ++ ~I'd be happy to lend a hand.~ + j.16
  ++ ~I'll help you for a price.~ + j.16
  ++ ~I'm a little busy right now I'm afraid.~ + j.17
  ++ ~I don't think so. I like this place just the way it is.~ + j.18
END

IF ~~ j.15
  SAY ~The satisfaction of a job well done and a winning smile?~
  = ~Look, we can work out the details later.~
  IF ~~ + j.14
END

IF ~~ j.16
  SAY ~Good. Alright, from what I understand, the slaves are kept in cells out the back, we just have to find a way in. We'll have to fight any guards there, but once we've started freeing the slaves they'll help us fight.~
  = ~I can either come with you or I can wait further out and help take slaves take the other guards out. It's up to you.~
  ++ ~Come with me, we'll have a better chance that way.~ + j.19
  ++ ~Wait further out and help the slaves.~ + j.20
END

IF ~~ j.17
  SAY ~There isn't much I can do by myself, but I can keep an eye on things and help heal the slaves when they get injured. I'll be here if you change your mind.~
  IF ~~ DO ~SetGlobal("LK#ArathMet","AR0406",1)~ EXIT
END

IF ~~ j.18
  SAY ~Godsdamn it, and here I was thinking I might have someone willing to help. Alright, well. I hope you enjoy the slaughter of innocents.~
  IF ~~ DO ~SetGlobal("LK#ArathMet","AR0406",1)~ EXIT
END

IF ~~ j.19
  SAY ~Let's find our way to the back, then.~
  IF ~~ DO ~SetGlobal("LK#ArathJoined","LOCALS",1) SetGlobal("LK#ArathMet","AR0406",1) JoinParty()~ EXIT
END

IF ~~ j.20
  SAY ~Alright. Good luck.~
  IF ~~ DO ~SetGlobal("LK#ArathCCFight","AR0406",1) SetGlobal("LK#ArathMet","AR0406",1)~ EXIT
END


// Before slaves released
IF ~Global("LK#ArathMet","AR0406",1) !Global("FreeSlaves","GLOBAL",1) !Global("HendakReleased","AR0406",4) !Global("HendakReleased","AR0406",3)~ j.21
  SAY ~Have you changed your mind about helping me free the slaves?~
  ++ ~Where do we start?~ + j.16
  ++ ~I'm still too busy.~ + j.17
  ++ ~Yeah, good luck with that.~ + j.22
END

IF ~~ j.22
  SAY ~Thanks ever so.~
  IF ~~ EXIT
END


// After slaves released; before slavers killed
IF ~Global("LK#ArathCCTalk","GLOBAL",2)~ j.27
  SAY ~I'm glad everyone got out alright. A few casualties, but mostly on their side.~
  = ~Will you be going after the other slavers?~
  ++ ~I couldn't leave a job half-finished, could I?~ DO ~SetGlobal("LK#ArathSlaversNotDone","AR0406",1)~ + j.28
  ++ ~Another time, perhaps.~ DO ~SetGlobal("LK#ArathSlaversNotDone","AR0406",1)~ + j.29
  ++ ~I don't think so, no.~ DO ~SetGlobal("LK#ArathSlaversNotDone","AR0406",1)~ + j.30
END

IF ~~ j.28
  SAY ~If I remember correctly, there's a tunnel that runs directly from the Coronet to the main holding area. I remember seeing mention of it--~
  = ~Look, there's something I should tell you before we do this. I've got absolutely no links to it myself, I swear, but my father was the head of a slave syndicate in Athkatla.~
  = ~He died a few years ago, but I suspect we'll run into more than a few of those who worked with him. I'm just letting you know, because I want to come with you, and they might recognise me.~
  ++ ~Thanks for telling me. I'd be happy to have your help.~ + j.31
  ++ ~You couldn't have told me this earlier?~ + j.32
  ++ ~In that case, it's too much of a risk to take you.~ + j.33
END

IF ~~ j.29
  SAY ~I'd do it on my own, but somehow I don't think I'd be successful.~
  = ~You know they need to be taken out, and the sooner the better. The longer they're left to operate, the harder it will be. I'll be waiting here when you're ready.~
  IF ~~ DO ~MoveToPoint([931.1227]) Face(0)~ EXIT
END

IF ~~ j.30
  SAY ~Great. Fantastic. So now they'll be able to strengthen their defenses, bring in more slaves, hire more guards...~
  = ~If you change your mind, I'll be waiting here.~
  IF ~~ DO ~MoveToPoint([931.1227]) Face(0)~ EXIT
END

IF ~~ j.31
  SAY ~We should get going. The sooner we can get this done the better.~
  IF ~~ DO ~JoinParty() SetGlobal("LK#ArathJoined","LOCALS",1) SetGlobal("LK#ArathCCSlavers","GLOBAL",2)~ EXIT
END

IF ~~ j.32
  SAY ~"Oh, hi, I want your help in taking down some slavers! Oh and by the way my father was a slaver and that may complicate things more than a little." Yeah, I'm sure that would have gone down real well.~
  IF ~~ + j.32
END

IF ~~ j.33
  SAY ~I understand if you're apprehensive, but I can help you. I'm not some kid dreaming of adventure, I'm an experienced druid with more than a few tricks up his sleeve. You've seen what I can do. I can help you.~
  ++ ~I suppose you're right.~ + j.31
  ++ ~Alright, but if you cause me any trouble, you're out, you understand?~ + j.34
  ++ ~I don't need your help.~ + j.35
END

IF ~~ j.34
  SAY ~Yeah, yeah, I get it.~
  IF ~~ + j.31
END

IF ~~ j.35
  SAY ~Fine. Well... best of luck, I suppose.~
  = ~Wait, just... I want to make sure as much of the trade is wiped out here as possible. I'm tired of seeing my father's shadow following me.~
  IF ~~ DO ~MoveToPoint([931.1227]) Face(0)~ EXIT
END


// Before slavers killed, if above dialogue has already occurred
IF ~Global("FreeSlaves","GLOBAL",1) Global("LK#ArathMet","AR0406",1) Global("LK#ArathSlaversNotDone","AR0406",1)~ j.36
  SAY ~Have you changed your mind? There are women and children in captivity there, <CHARNAME>. These slavers need to be taken out.~
  ++ ~Agreed. Join me and we'll do it now.~ + j.31
  ++ ~I'm still too busy.~ + j.37
  ++ ~Another time.~ + j.37
END

IF ~~ j.37
  SAY ~Well, let me know. It's not like they're slaves or anything.~
  IF ~~ EXIT
END


// After slavers killed
IF ~Global("LK#ArathMet","AR0406",2)~ j.23
  SAY ~Nice to see you again, my fair <CHARNAME>! Are you in need of my services, or is this just a courtesy call to see how I'm doing?~
  ++ ~I would be glad to have you join us.~ + j.24
  ++ ~Just a courtesy call, I'm afraid.~ + j.25
  ++ ~I have to go.~ + j.26
END

IF ~~ j.24
  SAY ~So where to, heroic leader?~
  IF ~~ DO ~JoinParty() SetGlobal("LK#ArathJoined","LOCALS",1)~ EXIT
END

IF ~~ j.25
  SAY ~Ah. Well, I'm fine, the Coronet is treating me well, though I am thinking about travelling back to my grove for a while. I suppose we'll see.~
  IF ~~ + j.26
END

IF ~~ j.26
  SAY ~Good to see you.~
  IF ~~ EXIT
END