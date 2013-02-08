BEGIN LK#AR25

EXTEND_TOP FATESP 6 #1
  + ~!Dead("Arath")
      Global("LK#ArathSummoned","GLOBAL",0)~ + ~Bring me Arath, the human druid.~
  DO ~SetGlobal("LK#ArathSummoned","GLOBAL",1) CreateVisualEffect("SPPORTAL",[1999.1228]) Wait(2) CreateCreature("lk#ar25",[1999.1228],1)~ GOTO 8
  + ~!Dead("Arath")
      Global("LK#ArathSummoned","GLOBAL",0)
      OR(3)
        Race(Player1,ELF)
        Race(Player1,HALF_ELF)
        Race(Player1,HUMAN)~ + ~Bring me my lover, Arath Duskhelm.~
  DO ~SetGlobal("LK#ArathRomanceActive","GLOBAL",2) SetGlobal("LK#ArathSummoned","GLOBAL",1) CreateVisualEffect("SPPORTAL",[1999.1228]) Wait(2) CreateCreature("lk#ar25",[1999.1228],1)~ GOTO 8
END

APPEND LK#AR25

IF ~NumTimesTalkedTo(0) !Global("LK#ArathRomanceActive","GLOBAL",2)~ j
  SAY ~<CHARNAME>? Wait, what--~
  = ~What in the nine hells is this place?! Where are we?!~
  ++ ~Calm down, I'll explain it all later. For now, I need your help.~ + j.1
  ++ ~It's a pocket plane of my very own creation, apparently. Like it?~ + j.2
  ++ ~I'll explain later. For now, if you could wait just over there, that would be great.~ + j.3
END

IF ~~ j.1
  SAY ~Not particularly surprising, but still, I'd have appreciated a bit of a heads up. All this teleportation makes one's stomach churn. Ugh.~
  IF ~~ DO ~SetGlobal("LK#ArathToBIntro","GLOBAL",1) SetGlobal("LK#ArathJoined","LOCALS",1) JoinParty()~ EXIT
END

IF ~~ j.2
  SAY ~The decor is definitely... uh. Interesting. Nice touch with the demonic eyes. So why am I here, exactly?~
  ++ ~I need your help once more.~ + j.1
  ++ ~I don't need you right now, but I might soon. I'd appreciate it if you could wait a while.~ + j.3
END

IF ~~ j.3
  SAY ~I... suppose. Obviously I'd prefer to, you know, help somehow, but. Okay. Sure. Just let me know when you need me.~
  IF ~~ DO ~SetGlobal("LK#ArathToBIntro","GLOBAL",1) MoveToPoint([2449.1514])~ EXIT
END


IF ~NumTimesTalkedTo(0) Global("LK#ArathRomanceActive","GLOBAL",2)~ j.4
  SAY ~<CHARNAME>? <CHARNAME>! I'm so glad to see you again, I had no idea where you'd gone, I was so--~
  = ~Wait. WAIT. Where are we? What in the nine hells is this place?!~
  ++ ~Calm down, I'll explain it all later. For now, I need your help. And your company.~ + j.5
  ++ ~It's a pocket plane of my very own creation, apparently. Like it?~ + j.2
  ++ ~I'll explain later. For now, if you could wait just over there, that would be great, love.~ + j.3
END

IF ~~ j.5
  SAY ~Of course. Though, I'd have appreciated a bit of a heads up. All this teleportation makes one's stomach churn. Ugh.~
  IF ~~ DO ~SetGlobal("LK#ArathToBIntro","GLOBAL",1) SetGlobal("LK#ArathJoined","LOCALS",1) JoinParty()~ EXIT
END


IF ~NumTimesTalkedToGT(0)~ j.6
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

END