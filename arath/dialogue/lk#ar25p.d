BEGIN LK#AR25P

// Kicked out
IF ~Global("LK#ArathJoined","LOCALS",1)~ p1
  SAY ~You want me to leave? I mean, I understand, but hey, if it's something I did you'd tell me, right?~
  ++ ~Don't worry, I just need you to head back to the Pocket Plane for a while.~ + p1.1
  ++ ~Can you wait here?~ + p1.2
  ++ ~My mistake, sorry.~ + p1.3
END

IF ~~ p1.1
  SAY ~Sure thing. Just come and get me if you need me.~
  IF ~~ DO ~SetGlobal("LK#ArathJoined","LOCALS",0) EscapeAreaMove("AR4500",2449,1514,5)~ EXIT
END

IF ~~ p1.2
  SAY ~Sure thing. Just come and get me when you need me to rejoin.~
  IF ~~ DO ~SetGlobal("LK#ArathJoined","LOCALS",0)~ EXIT
END

IF ~~ p1.3
  SAY ~Shall we continue?~
  IF ~~ DO ~JoinParty()~ EXIT
END

// Rejoin pocket plane
IF ~Global("LK#ArathJoined","LOCALS",0) AreaCheck("AR4500")~ j.6
  SAY ~<CHARNAME>! Gods, this place is so boring. And hellish. And freakish. I keep having nightmares one of the statues is going to climb down and start chewing on my leg.~
  ++ ~I need some help. Care to join me?~ + j.7
  ++ ~It seems pretty immobile to me.~ + j.8
  ++ ~Just here to see how you're going.~ + j.9
END

IF ~~ j.7
  SAY ~*Finally*. I was beginning to wonder if you'd forgotten me entirely.~
  IF ~~ DO ~SetGlobal("LK#ArathJoined","LOCALS",1) JoinParty()~ EXIT
END

IF ~~ j.8
  SAY ~Yes, well, you're not the one having to sleep under it, are you?~
  IF ~~ EXIT
END

IF ~~ j.9
  SAY ~Oh, fine. Just wonderful.~
  = ~I'm lying, in case you haven't noticed. But... okay. I'm okay. Just let me know when you need me.~
  = ~Sooner would be better.~
  IF ~~ EXIT
END

// Rejoin elsewhere
IF ~Global("LK#ArathJoined","LOCALS",0) !AreaCheck("AR4500")~ j.23
  SAY ~Nice to see you again, my fair <CHARNAME>! Is it time to head out?~
  ++ ~All aboard the S.S. <CHARNAME>'s party, destination: endless fighting!~ + j.24
  ++ ~Heh. Yes, I'd be glad to have you join me.~ + j.24
  ++ ~Sorry, I just wanted to see how you were.~ + j.25
  ++ ~Not yet, I'm afraid.~ + j.26
END

IF ~~ j.24
  SAY ~So where to, heroic leader?~
  IF ~~ DO ~JoinParty() SetGlobal("LK#ArathJoined","LOCALS",1)~ EXIT
END

IF ~~ j.25
  SAY ~Ah. Well, I'm fine. A bit bored, to tell you the truth. Don't... don't make me wait here too long.~
  IF ~~ EXIT
END

IF ~~ j.26
  SAY ~Oh. Well... it's nice to see you. Don't make me wait here too long.~
  IF ~~ EXIT
END