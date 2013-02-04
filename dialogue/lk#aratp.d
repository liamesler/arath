// Initial
BEGIN LK#ARATP

// Before slavers killed, if above dialogue has already occurred
IF ~Global("FreeSlaves","GLOBAL",1) Global("LK#ArathMet","AR0406",1) Global("LK#ArathSlaversNotDone","AR0406",1) Global("LK#ArathJoined","LOCALS",0)~ j.36
  SAY ~Have you changed your mind? There are women and children in captivity there, <CHARNAME>. These slavers need to be taken out.~
  ++ ~Agreed. Join me and we'll do it now.~ + j.31
  ++ ~I'm still too busy.~ + j.37
  ++ ~Another time.~ + j.37
END

IF ~~ j.31
  SAY ~We should get going. The sooner we can get this done the better.~
  IF ~~ DO ~JoinParty() SetGlobal("LK#ArathJoined","LOCALS",1)~ EXIT
END

IF ~~ j.37
  SAY ~Well, let me know. It's not like they're slaves or anything.~
  IF ~~ EXIT
END


// After slavers killed
IF ~Global("LK#ArathMet","AR0406",2) Global("LK#ArathJoined","LOCALS",0)~ j.23
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


// Kicked out
IF ~Global("LK#ArathJoined","LOCALS",1)~ p1
  SAY ~You want me to leave? I mean, I understand, but hey, if it's something I did you'd tell me, right?~
  + ~!Global("chapter","GLOBAL",4) !Global("chapter","GLOBAL",5)~ + ~Don't worry, I just need you to head back to the Coronet for a while.~ + p1.1
  ++ ~Can you wait here?~ + p1.2
  ++ ~My mistake, sorry.~ + p1.3
END

IF ~~ p1.1
  SAY ~Sure thing, boss. Just come and get me if you need me.~
  IF ~~ DO ~SetGlobal("LK#ArathJoined","LOCALS",0) EscapeAreaMove("AR0406",931,1227,0)~ EXIT
END

IF ~~ p1.2
  SAY ~Sure thing, boss. Just come and get me when you need me to rejoin.~
  IF ~~ DO ~SetGlobal("LK#ArathJoined","LOCALS",0)~ EXIT
END

IF ~~ p1.3
  SAY ~Shall we continue?~
  IF ~~ DO ~JoinParty()~ EXIT
END


IF WEIGHT #-1 ~Global("LK#ArathVampire","GLOBAL",4)~ LK#ArathReturn
  SAY ~What... what happened? <CHARNAME>? Where are we? Why does my head ache? Ugh... I feel like I'm going to be sick.~
  ++ ~Bodhi turned you into a vampire. I brought you back.~ DO ~SetGlobal("LK#ArathVampire","GLOBAL",5)~ + LK#ArathReturn_1
  ++ ~You were a vampire for a little while, and then you died, so that's probably not surprising.~ DO ~SetGlobal("LK#ArathVampire","GLOBAL",5)~ + LK#ArathReturn_1
  ++ ~You don't remember anything?~ DO ~SetGlobal("LK#ArathVampire","GLOBAL",5)~ + LK#ArathReturn_1
  ++ ~Well, toughen up, princess. We have things to do.~ DO ~SetGlobal("LK#ArathVampire","GLOBAL",5)~ + LK#ArathReturn_1
END

IF ~~ LK#ArathReturn_1
  SAY ~Oh, gods. Now I remember. No wonder I feel sick... she bit me! I probably have some awful disease, now. Vampire rabies or something.~
  = ~This... this is going to take a little while to process. How do you reverse vampirism? I thought it was impossible?~
  ++ ~Don't worry about it. What matters is that you're safe.~ + LK#ArathReturn_2
  ++ ~With the help of a book, Bodhi's heart and a long dead god.~ + LK#ArathReturn_3
  ++ ~It was... complicated. Something to do with Amaunator, anyway.~ + LK#ArathReturn_3
  ++ ~I had some help. Come on, let's get going.~ + LK#ArathReturn_4
END

IF ~~ LK#ArathReturn_2
  SAY ~I suppose. I would have preferred it if I was safe in the first place, but...~
  IF ~~ + LK#ArathReturn_4
END

IF ~~ LK#ArathReturn_3
  SAY ~Sounds fun. Wish I could have been there to help, heh.~
  IF ~~ + LK#ArathReturn_4
END

IF ~~ LK#ArathReturn_4
  SAY ~Thank you. Though I'm not sure "thank you" is really sufficient here. I'll make sure you get thoroughly rewarded later... somewhere a little more private.~
  = ~(wince) As soon as I recover enough, anyway. I really don't feel great.~
  = ~I take it you killed the bitch?~
  ++ ~Staked her twice just to make sure she was dead, don't worry.~ + LK#ArathReturn_5
  ++ ~Actually, we sort of... hit it off. Went out to dinner a few times. We're getting married next summer.~ + LK#ArathReturn_8
  ++ ~Of course. I couldn't let her vampirise you and then leave her to her own devices now, could I?~ + LK#ArathReturn_6
  ++ ~She was already dead, but yeah, I killed her again.~ + LK#ArathReturn_7
END

IF ~~ LK#ArathReturn_5
  SAY ~Good. You probably could have staked her three times, but I trust you.~
  IF ~~ + LK#ArathReturn_9
END

IF ~~ LK#ArathReturn_6
  SAY ~Well, you could have, but I probably wouldn't have been very happy about it.~
  IF ~~ + LK#ArathReturn_9
END

IF ~~ LK#ArathReturn_7
  SAY ~Good. She really deserves to be killed again, but... I suppose twice will have to do.~
  IF ~~ + LK#ArathReturn_9
END

IF ~~ LK#ArathReturn_8
  SAY ~(grin) As long as I'm invited and get to be best man, I'm happy.~
  IF ~~ + LK#ArathReturn_9
END

IF ~~ LK#ArathReturn_9
  SAY ~Alright, let's get going.~
  = ~As soon as I regain feeling in my legs, anyway. Ugh. Remind me not to get vampirized again.~
  IF ~~ DO ~JoinParty() SetGlobal("LK#ArathJoined","GLOBAL",1) EraseJournalEntry(32084)
EraseJournalEntry(32085)
EraseJournalEntry(16351)
EraseJournalEntry(%The Final Battle with Bodhi.

Bodhi appeared in an ambush shortly before I reached her haven, warning me that she was aware of my pursuit and stealing from me the one person that is dearest to my heart: Arath.  Before she vanished and unleashed more of her undead creations upon me, Bodhi warned me that if I continue I will lose even more than I thought possible.  I cannot give up on the Rhynn Lanthorn... but now the life and immortal soul of Arath is at stake, as well!%)
EraseJournalEntry(15710)
EraseJournalEntry(6589)
EraseJournalEntry(%The Final Battle with Bodhi.

Bodhi has turned Arath into a vampire!  Or... or very nearly.  The process may not have been completed in the short time Bodhi has had him.  Hopefully something can be done or I will have lost him.  Perhaps the elven war sage might know some way of restoration... or Elhan...%)
IncrementGlobal("LK#ArathVampire","GLOBAL",1)~ SOLVED_JOURNAL ~The Final Battle with Bodhi.

While I had feared for some time that Bodhi's final revenge on me would be to take away Arath forever, it seems that the information in the lorebook was right...  Amaunator's idol has restored Arath not only to life, but has removed the vampiric curse from him, as well.~ EXIT
END


// At Druid Grove
IF WEIGHT #-2 ~!InParty("Arath") AreaCheck("AR1901")~ t1.11
  SAY ~Took you long enough. Let's go talk to the Archdruid.~
  ++ ~I'll handle this. You wait here, I'll come and get you when we're done.~ + t1.12
  ++ ~Sounds like a plan to me.~ + t1.13
  ++ ~I'm not interested in whatever he wants. I need you to come back with me.~ + t1.14
END

IF ~~ t1.12
  SAY ~I mean no offense to you, dear <CHARNAME>, but he wants to talk to me, not you.~
  ++ ~Alright, join up and we'll go.~ + t1.13
  ++ ~I don't have room for you right now.~ + t1.15
  ++ ~Then you can do this on your own.~ + t1.16
END

IF ~~ t1.13
  SAY ~Then let's go see what Her Naturalness requires of me today. (sigh)~
  IF ~~ DO ~JoinParty() SetGlobal("LK#ArathJoined","LOCALS",1) SetGlobal("LK#ArathQuestWaiting","GLOBAL",2)~ EXIT
END

IF ~~ t1.14
  SAY ~Sorry, <CHARNAME>, but I can't do that. I have to sort this out, whatever it is. It's my duty. Now you can either help me, or leave me to do it myself. Your choice.~
  ++ ~Alright, join up and we'll go.~ + t1.13
  ++ ~I don't have room for you right now.~ + t1.15
  ++ ~Then you can do this on your own.~ + t1.16
END

IF ~~ t1.15
  SAY ~Then make room and come back. This is important.~
  IF ~~ EXIT
END

IF ~~ t1.16
  SAY ~Fine. I'll be here if you change your mind.~
  IF ~~ EXIT
END
