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