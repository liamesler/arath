BEGIN LK#ARATJ


IF ~Global("LK#ArathCCSlavers","GLOBAL",1)~ LK#Arath_Hendak5
  SAY ~<CHARNAME>. Will you be going after those slavers?~
  ++ ~I couldn't leave a job half-finished, could I?~ DO ~SetGlobal("LK#ArathCCSlavers","GLOBAL",2)~ + LK#Arath_Hendak5.1
  ++ ~Another time, perhaps.~ DO ~SetGlobal("LK#ArathCCSlavers","GLOBAL",2)~ + LK#Arath_Hendak5.2
  ++ ~I don't think so, no.~ DO ~SetGlobal("LK#ArathCCSlavers","GLOBAL",2)~ + LK#Arath_Hendak5.3
END

IF ~~ LK#Arath_Hendak5.1
  SAY ~If I remember correctly, there's a tunnel that runs directly from the Coronet to the main holding area. I remember seeing mention of it--~
  = ~Look, there's something I should tell you before we do this. I've got absolutely no links to it myself, I swear, but my father was the head of a slave syndicate in Athkatla.~
  = ~He died a few years ago, but I suspect we'll run into more than a few of those who worked with him. I'm just letting you know, they might recognise me.~
  ++ ~Thanks for telling me.~ + LK#Arath_Hendak5.4
  ++ ~You couldn't have told me earlier?~ + LK#Arath_Hendak5.5
  ++ ~In that case, it's too much of a risk to take you.~ + LK#Arath_Hendak5.6
END

IF ~~ LK#Arath_Hendak5.2
  SAY ~I'd do it on my own, but somehow I don't think I'd be successful.~
  = ~You know they need to be taken out, and the sooner the better. The longer they're left to operate, the harder it will be. I'll be waiting here when you're ready.~
  IF ~~ DO ~SetGlobal("LK#ArathJoined","LOCALS",0) LeaveParty() MoveToPoint([931.1227]) Face(0)~ EXIT
END

IF ~~ LK#Arath_Hendak5.3
  SAY ~Great. Fantastic. So now they'll be able to strengthen their defenses, bring in more slaves, hire more guards...~
  = ~If you change your mind, I'll be waiting here.~
  IF ~~ DO ~SetGlobal("LK#ArathJoined","LOCALS",0) LeaveParty() MoveToPoint([931.1227]) Face(0)~ EXIT
END

IF ~~ LK#Arath_Hendak5.4
  SAY ~We should get going. The sooner we can get this done the better.~
  IF ~~ EXIT
END

IF ~~ LK#Arath_Hendak5.5
  SAY ~"Oh, hi, I want your help in taking down some slavers! Oh and by the way my father was a slaver and that may complicate things more than a little." Yeah, I'm sure that would have gone down real well.~
  IF ~~ + LK#Arath_Hendak5.6
END

IF ~~ LK#Arath_Hendak5.6
  SAY ~I understand if you're apprehensive, but I can help you. I'm not some kid dreaming of adventure, I'm an experienced druid with more than a few tricks up his sleeve. You've seen what I can do. I can help you.~
  ++ ~I suppose you're right.~ + LK#Arath_Hendak5.4
  ++ ~Alright, but if you cause me any trouble, you're out, you understand?~ + LK#Arath_Hendak5.7
  ++ ~I don't need your help.~ + LK#Arath_Hendak5.8
END

IF ~~ LK#Arath_Hendak5.7
  SAY ~Yeah, yeah, I get it.~
  IF ~~ + LK#Arath_Hendak5.4
END

IF ~~ LK#Arath_Hendak5.8
  SAY ~Fine. Well... best of luck, I suppose.~
  = ~Wait, just... I want to make sure as much of the trade is wiped out here as possible. I'm tired of seeing my father's shadow following me.~
  IF ~~ DO ~SetGlobal("LK#ArathJoined","LOCALS",0) LeaveParty() MoveToPoint([931.1227]) Face(0)~ EXIT
END


I_C_T HENDAK 41 LK#Arath_Hendak6
  == LK#ARATJ IF ~InParty("Arath") !Dead("Arath")~ THEN ~I thought so. It just never ends, does it? You whack one slaver, and three more pop up...~
END

INTERJECT HENDAK 63 LK#Arath_Hendak6
  == LK#ARATJ IF ~InParty("Arath") !Dead("Arath")~ THEN ~You lying bastard! Hendak, you'll not fight alone!~
  DO ~ActionOverride("hendak",Enemy()) ActionOverride("Arath",Enemy())~
END

// Lehtinan
// (hurrrrm)  You are back.  I see.  You wish something else?
EXTEND_BOTTOM LEHTIN 1 #3
  + ~Global("LK#ArathMet","AR0406",1) !Dead("Arath") !InParty("Arath")~ + ~I was just talking to a man named Arath in the back. He intends to free the slaves.~ EXTERN LEHTIN LK#Arath_Leht
END

CHAIN LEHTIN LK#Arath_Leht
  ~That one gave me a bad taste in my mouth from the first... (hurrm...) Thank you. I will have the guards... take care of him.~
  = ~Here is some gold for your... (hurrrm) troubles.~
  DO ~GiveGoldForce(200) SetGlobal("LK#ArathCCKill","AR0406",1)~
EXIT

// (hurrrmm..) Excellent. Here is the key to the cell. Punish the slave and return to me. You shall be well rewarded.
INTERJECT LEHTIN 22 LK#Arath_Leht2
  == LK#ARATJ IF ~InParty("Arath") !Dead("Arath")~ THEN ~<CHARNAME>, what--come over here!~
  = ~What do you think you're doing?! We had an agreement!~
END
  ++ ~It was just a ruse to get the key to the cell, don't worry.~ EXTERN LK#ARATJ LK#Arath_Leht2.1
  ++ ~I know what I'm doing.~ EXTERN LK#ARATJ LK#Arath_Leht2.2
  ++ ~Agreements change.~ EXTERN LK#ARATJ LK#Arath_Leht2.3

CHAIN LK#ARATJ LK#Arath_Leht2.1
  ~Oh. Well. In that case, let's go.~
  DO ~SetGlobal("SlavingJerk","GLOBAL",1) GiveItemCreate("MISC4Z",Player1,0,0,0) AddJournalEntry(#15705,QUEST)~
EXIT

CHAIN LK#ARATJ LK#Arath_Leht2.2
  ~You better, or there'll be trouble. And I don't mean the good kind.~
  DO ~SetGlobal("SlavingJerk","GLOBAL",1) GiveItemCreate("MISC4Z",Player1,0,0,0) AddJournalEntry(#15705,QUEST)~
EXIT

CHAIN LK#ARATJ LK#Arath_Leht2.3
  ~You bastard!~
  DO ~SetGlobal("SlavingJerk","GLOBAL",1) GiveItemCreate("MISC4Z",Player1,0,0,0) AddJournalEntry(#15705,QUEST) SetGlobal("LK#ArathJoined","LOCALS",0) LeaveParty() EscapeArea()~
EXIT


// Beastmaster
// Fool!  You'll never escape here alive!  Come, Tabitha!  Come...open the cages!  Aid your master!
I_C_T BEAST 1 LK#Arath_Beastmaster
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~You bastard!~
  == BEAST ~Kill them, Tabitha!~
END

// Bah!  I have had enough of your insolence!  It is time to feed my Tabitha anyway!  Come...open the cages...attack!!
I_C_T BEAST 5 LK#Arath_Beastmaster1
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~You bastard!~
  == BEAST ~Kill them, Tabitha!~
END

// Insolent!  Did I not tell you to leave?!  Bah!  It is time to feed my Tabitha, now, anyway.  Come...open the cages...attack!
I_C_T BEAST 6 LK#Arath_Beastmaster2
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~You bastard!~
  == BEAST ~Kill them, Tabitha!~
END

APPEND LK#ARATJ

// On seeing the door (DOOR0405) or new trigger area
IF ~Global("LK#ArathJoinDoor","GLOBAL",1)~ tr1
  SAY ~<CHARNAME>, the main building is through here.~
  = ~The last time I was here, I killed seven slavers and my father. I thought I'd taken out their main operation, but my father had laid plan after plan. I suppose his paranoia wouldn't allow anything else.~
  = ~I don't know exactly what you should be expecting, but if it's anything like it was when my father was running things, they'll be formidable. Attack hard and fast.~
  ++ ~I'll keep that in mind.~ DO ~SetGlobal("LK#ArathJoinDoor","GLOBAL",2)~ + tr1.3
  ++ ~And which hand should I use to hold my sword, exactly?~ DO ~SetGlobal("LK#ArathJoinDoor","GLOBAL",2)~ + tr1.1
  ++ ~I know what to do. I've done this plenty of times before.~ DO ~SetGlobal("LK#ArathJoinDoor","GLOBAL",2)~ + tr1.1
  ++ ~You killed your own father?~ + tr1.4
  ++ ~Don't ever tell me what to do.~ DO ~SetGlobal("LK#ArathJoinDoor","GLOBAL",2)~ + tr1.2
  ++ ~Let's go.~ DO ~SetGlobal("LK#ArathJoinDoor","GLOBAL",2)~ + tr1.3
END

IF ~~ tr1.1
  SAY ~I suppose this isn't your first rodeo, is it? I'm--not really used to working with a team.~
  IF ~~ + tr1.3
END

IF ~~ tr1.2
  SAY ~... I'll try to keep that in mind. No promises, though.~
  IF ~~ + tr1.3
END

IF ~~ tr1.3
  SAY ~I'll be right behind you. Just tell me where you want me and I'll do my best. Let's get these bastards.~
  IF ~~ EXIT
END

IF ~~ tr1.4
  SAY ~It's a little more complicated than that, but... essentially, yes.~
  IF ~~ + tr1.3
END


// After killing slavers; in top left room w/ desk (area trigger)
IF ~Global("LK#ArathSlavers","GLOBAL",1)~ tr2
  SAY ~This used to be my father's room.~
  ++ ~Are you alright?~ DO ~SetGlobal("LK#ArathSlavers","GLOBAL",2)~ + tr2.1
  ++ ~Yeah, yeah, and that's the table he used to work on, and that's the bed he used to sleep on...~ DO ~SetGlobal("LK#ArathSlavers","GLOBAL",2)~ + tr2.2
  ++ ~Enough about your father, already! Jeez, don't you ever talk about anything else?~ DO ~SetGlobal("LK#ArathSlavers","GLOBAL",2)~ + tr2.3
  ++ ~Come on, let's get going.~ DO ~SetGlobal("LK#ArathSlavers","GLOBAL",2)~ + tr2.1
END

IF ~~ tr2.1
  SAY ~I swear, I'm not usually this...~
  = ~I didn't actually kill him. It was an infection, I think. I mean, I made the wound, but he musn't have cleaned it, or something must have got in there.~
  = ~Gods, this is a bizarre feeling. Alright. There are probably a few potions and such lying around, maybe a bit of gold. Grab those and let's finish this.~
  IF ~~ EXIT
END

IF ~~ tr2.2
  SAY ~Point taken.~
  IF ~~ + tr2.1
END

IF ~~ tr2.3
  SAY ~It's weird, I generally never talk about him. I barely think about it, usually.~
  IF ~~ + tr2.1
END

END

CHAIN IF WEIGHT #-1 ~InParty("Arath") !Dead("Arath")~ THEN HAEGAN h1
  ~You! How dare you barge in here, attackin' my men left and right?! That's no way to treat an old friend, Arath!~
  == LK#ARATJ ~Shut your mouth, you bastard! How could you do this to these people?! And I'm no friend of yours!~
  == HAEGAN ~Nay? I seem to recall any number o' occasions chattin' about this 'n that under the watchful gaze o' yer good-for-nothing father, ye whoreson--~
  == LK#ARATJ ~Let these people go and we might kill you quickly!~
  == HAEGAN ~Haha! You think you can just sweep in here and order me around? Your father might've had command here once, but no longer!~
  == LK#ARATJ ~Let them go!~
EXTERN HAEGAN 1
// These dregs could nary be called persons! This is no different than trading in cattle! Speakin' of which, it's about time you were butchered!

APPEND LK#ARATJ
// Scenery: Post-Joining Introduction (after speaking to Hendak)  --  Global("HendakReleased","AR0406",4)
IF ~Global("LK#ArathJoinTalk","GLOBAL",1)~ tr3
  SAY ~So I guess it's over, then. Good to work with you, <CHARNAME>. I owe you a drink.~
  ++ ~Another time, perhaps.~ DO ~SetGlobal("LK#ArathJoinTalk","GLOBAL",2)~ + tr3.1
  ++ ~I could use a drink.~ DO ~SetGlobal("LK#ArathJoinTalk","GLOBAL",2)~ + tr3.2
  ++ ~Thank you for your help.~ DO ~SetGlobal("LK#ArathJoinTalk","GLOBAL",2)~ + tr3.3
  ++ ~I have to go.~ DO ~SetGlobal("LK#ArathJoinTalk","GLOBAL",2)~ + tr3.1
END

IF ~~ tr3.1
  SAY ~Wait, before you do.~
  IF ~~ + tr3.9
END
  
IF ~~ tr3.2
  SAY ~A <PRO_MANWOMAN> after my own heart! Hendak? An ale for my friend here?~
  IF ~~ + tr3.4
END

IF ~~ tr3.3
  SAY ~Don't be stupid, you were the one helping me. Hendak! An ale for my friend here?~
  IF ~~ + tr3.4
END

IF ~~ tr3.4
  SAY ~They'll be back. Let's just hope Hendak is able to watch closely enough to catch them next time.~
  ++ ~And if he does, we'll be ready.~ + tr3.5
  ++ ~You're on your own, next time.~ + tr3.6
  ++ ~Thanks for the ale.~ + tr3.7
  + ~Gender(Player1,MALE)~ + ~We got paid, that's the important part.~ + tr3.8a
  + ~Gender(Player1,FEMALE)~ + ~We got paid, that's the important part.~ + tr3.8b
END

IF ~~ tr3.5
  SAY ~Look, I've been thinking.~
  IF ~~ + tr3.9
END

IF ~~ tr3.6
  SAY ~Well, actually I'm sort of hoping I won't be.~
  IF ~~ + tr3.9
END

IF ~~ tr3.7
  SAY ~Thank our foreign friend over there, not me.~
  IF ~~ + tr3.9
END

IF ~~ tr3.8a
  SAY ~Heh, that we did, and gold is its own reward, right? There's enough there to pay for at least a few nights with one of the girls in the back there.~
  = ~Or boys, I don't judge. Not that you need to pay for companionship, I'm sure you can get that easily enough on your own. (grin)~
  IF ~~ + tr3.5
END

IF ~~ tr3.8b
  SAY ~Heh, that we did, and gold is its own reward, right? There's enough there to pay for at least a few nights with one of the guys in the back there.~
  = ~Or girls, I don't judge. Not that you need to pay for companionship, I'm sure you can get that easily enough on your own. (grin)~
  IF ~~ + tr3.5
END

IF ~~ tr3.9
  SAY ~I don't have anything planned after this. Beyond getting a drunk and having some fun with someone out the back, I mean.~
  = ~You never mentioned what exactly you were doing.~
  ++ ~I'm raising money to rescue my foster-sister, who was kidnapped by an evil mage.~ + tr3.10
  ++ ~I'm trying to track down the bastard who kidnapped and tortured me and my foster-sister.~ + tr3.10
  ++ ~And I have no intention to.~ + tr3.11
  + ~OR(2) CheckStatGT(Player1,12,WIS) CheckStatGT(Player1,12,INT)~ + ~Are you trying to ask me if you can join me permanently?~ + tr3.12
END

IF ~~ tr3.10
  SAY ~That sounds a little complicated, what you've got to do there.~
  IF ~~ + tr3.12
END

IF ~~ tr3.11
  SAY ~I guess that's fair. I just wanted to ask... well--~
  IF ~~ + tr3.12
END

IF ~~ tr3.12
  SAY ~Were you, ah. Perhaps you might be needing some help? I come with quite the list of accomplishments. Took down this slaver ring once with some nobody off the street.~
  ++ ~It just so happens that I might need some help, yes. You wouldn't happen to be interested, would you?~ + tr3.13
  ++ ~That 'nobody' is actually the Savior of the Sword Coast, and I'd be happy to have your help.~ + tr3.14
  ++ ~On the Sword Coast I'm regarded as something of a hero. And no, I don't need your help.~ + tr3.15
  ++ ~I would love to have your help, but I've already promised the position to someone else.~ + tr3.16
  ++ ~Hells no. There is no way I am going to voluntarily put up with your whining permanently.~ + tr3.17
END

IF ~~ tr3.13
  SAY ~Being as busy as I am, well, I'll have to think about it. Check my diary, ask my assistant, that kind of thing.~
  = ~Are we staying anywhere? Because I'm famished... could really use a good meal. Somewhere with beds, I hope. And hot water. Mmm...~
  IF ~~ EXIT
END

IF ~~ tr3.14
  SAY ~Really? I didn't know that.~
  = ~Well, let's get going! Are we staying anywhere? Because I'm famished... could really use a good meal. Somewhere with beds, I hope. And hot water. Mmm...~
  IF ~~ EXIT
END

IF ~~ tr3.15
  SAY ~Really? I didn't know that. And here I could have been hero-worshipping you this whole time! Dang, what a shame.~
  IF ~~ + tr3.18
END

IF ~~ tr3.16
  SAY ~Ah. Well. Alright. I'm sure they'll be... adequate.~
  IF ~~ + tr3.18
END

IF ~~ tr3.17
  SAY ~No need to be rude there, adventure<PRO_GIRLBOY>!~
  IF ~~ + tr3.18
END
  
IF ~~ tr3.18
  SAY ~I'll be around if you ever need an extra hand.~
  IF ~~ DO ~SetGlobal("LK#ArathMet","AR0406",2) SetGlobal("LK#ArathJoined","LOCALS",0) LeaveParty() MoveToPoint([931,1227])~ EXIT
END

// ************************
//                        *
// Non-romantic dialogues *
//                        *
// ************************



// Scenery: Underdark
IF ~Global("LK#ArathUnderdark","GLOBAL",2)~ a1
  SAY ~There's a certain weird beauty to these caverns. I'd never have thought such enormous spaces lay beneath our feet as we walked, but... Here you go. Even the drow themselves have a sort of terrifying, brutal beauty.~
  ++ ~I'd have to agree. They do have a certain charm.~ DO ~SetGlobal("LK#ArathUnderdark","GLOBAL",3)~ + a1.5
  ++ ~I don't really care what they look like, I'm more concerned with getting out of them.~ DO ~SetGlobal("LK#ArathUnderdark","GLOBAL",3)~ + a1.1
  ++ ~I don't think they really compare to you, but I suppose.~ DO ~SetGlobal("LK#ArathUnderdark","GLOBAL",3)~ + a1.2
  ++ ~How could you say that? It's disgusting down here.~ DO ~SetGlobal("LK#ArathUnderdark","GLOBAL",3)~ + a1.3
  ++ ~I'm sorry, did you say something?~ DO ~SetGlobal("LK#ArathUnderdark","GLOBAL",3)~ + a1.4
END

IF ~~ a1.1
  SAY ~You've got a point there. I already miss the sky overhead and the grass beneath my feet.~
  IF ~~ + a1.5
END

IF ~~ a1.2
  SAY ~I've never thought of myself as brutally beautiful before, but I suppose? (grin)~
  IF ~~ + a1.5
END


IF ~~ a1.3
  SAY ~I disagree. I think there's something enchanting about the glowing mushrooms, at least. Some of the stone structures are pretty amazing, too.~
  IF ~~ + a1.5
END


IF ~~ a1.4
  SAY ~Don't worry about it.~
  IF ~~ EXIT
END

IF ~~ a1.5
  SAY ~I have to admit, I've never really given thought to what the Underdark might be like. It's never exactly kept me up at night. I knew the drow and duergar lived underground, of course, but I never imagined I'd see either of them myself, let alone walk through a drow city.~
  ++ ~Despite the circumstances, we are lucky to have experienced something few others have.~ + a1.6
  ++ ~Enough gawking. Let's focus on getting out of here.~ + a1.9
  ++ ~I never thought about it, and I wish I never had to.~ + a1.7
  ++ ~There are few things that keep you up at night, in my experience, Arath.~ + a1.8
END

IF ~~ a1.6
  SAY ~We're lucky for a lot of things.~
  IF ~~ + a1.9
END

IF ~~ a1.7
  SAY ~Really? That surprises me. Maybe it shouldn't.~
  IF ~~ + a1.9
END

IF ~~ a1.8
  SAY ~What's that supposed to mean? There are plenty of things that keep me up at night. Most of them involve sharing a bedroll, I'll admit, but now's not the time for that.~
  IF ~~ + a1.9
END

IF ~~ a1.9
  SAY ~I'd just--I hadn't thought about it.~
  = ~I suppose there's a lot of things I haven't really thought about.~
  IF ~~ EXIT
END


// Scenery: North Forest
IF ~Global("LK#ArathNorthForest","GLOBAL",2)~ a2
  SAY ~Some of these trees must be thousands of years old...~
  ++ ~Beautiful, isn't it?~ DO ~SetGlobal("LK#ArathNorthForest","GLOBAL",3)~ + a2.1
  ++ ~Yes, let's all stand and admire the trees. Look, they even have bark!~ DO ~SetGlobal("LK#ArathNorthForest","GLOBAL",3)~ + a2.2
  ++ ~They make me feel so small.~ DO ~SetGlobal("LK#ArathNorthForest","GLOBAL",3)~ + a2.3
  ++ ~Must we stop at everything natural we come across?~ DO ~SetGlobal("LK#ArathNorthForest","GLOBAL",3)~ + a2.4
END

IF ~~ a2.1
  SAY ~It is.~
  IF ~~ + a2.5
END

IF ~~ a2.2
  SAY ~Some even have leaves, I know! Shocking.~
  IF ~~ + a2.5
END

IF ~~ a2.3
  SAY ~Nature has a way of doing that to people, I've noticed.~
  IF ~~ + a2.5
END

IF ~~ a2.4
  SAY ~I don't stop at--~
  = ~Alright, fine, but how can you stand there and be so uninterested when you're standing in a forest that has been untouched since the dawn of time?~
  IF ~~ + a2.5
END

IF ~~ a2.5
  SAY ~I'm glad we got to come here. I've missed this.~
  ++ ~You don't get to see this every day, that's for sure.~ + a2.6
  ++ ~You're adorable when you're like this.~ + a2.7
  ++ ~I'm sorry?~ + a2.8
  ++ ~Care to come back and join us in the real world?~ + a2.9
END

IF ~~ a2.6
  SAY ~I wish we did, though.~
  IF ~~ + a2.10
END

IF ~~ a2.7
  SAY ~I'm adorable the vast majority of the time, I'll have you know. No need to be so rude.~
  IF ~~ + a2.10
END

IF ~~ a2.8
  SAY ~Being around so much nature. There's something special about places like this, <CHARNAME>. Can't you feel it?~
  IF ~~ + a2.10
END

IF ~~ a2.9
  SAY ~This *is* the real world. About as real as you're going to get.~
  IF ~~ + a2.10
END

IF ~~ a2.10
  SAY ~This reminds me of why I wanted to become a druid in the first place. This feeling of... I don't know. Wonderment seems like such a boring way to put it.~
  ++ ~Wonder sounds like a fairly good description to me.~ + a2.11
  ++ ~They're just trees, Arath. They're for making chairs and tables.~ + a2.12
  ++ ~I just feel a little bemused at how ridiculous you are.~ + a2.13
  ++ ~Personally I'd go for "boring," but that's just me.~ + a2.14
END

IF ~~ a2.11
  SAY ~Yeah. Yeah, it is.~
  IF ~~ + a2.15
END

IF ~~ a2.12
  SAY ~If you chop down these trees for timber, I swear, I'd probably chop you down right after. These trees are alive in a way most people don't understand.~
  IF ~~ + a2.15
END

IF ~~ a2.13
  SAY ~I'm glad I could entertain you.~
  IF ~~ + a2.15
END

IF ~~ a2.14
  SAY ~Sometimes I wonder about you, <CHARNAME>. Really.~
  IF ~~ + a2.15
END

IF ~~ a2.15
  SAY ~Well, while we're here I may as well stock up on ingredients.~
  = ~Ooh, is that a lantern beetle? I haven't seen one of those for months!~
  IF ~~ EXIT
END


// Plot - Killing the Dragon in Suldanessellar
IF ~Global("LK#ArathSuldanessellar","GLOBAL",2)~ a3
  SAY ~I don't mean to interrupt your dragon-killing rampage there, crazy <PRO_MANWOMAN>, but I just wanted to say that it's a good cause we're fighting for, and to... keep it up.~
  ++ ~And what cause would that be, exactly?~ DO ~SetGlobal("LK#ArathSuldanessellar","GLOBAL",3)~ + a3.6
  ++ ~That was quite possibly the most bizarre compliment I've ever received.~ DO ~SetGlobal("LK#ArathSuldanessellar","GLOBAL",3)~ + a3.1
  + ~Gender(Player1,MALE) Global("LK#ArathRomanceActive","GLOBAL",2)~ + ~Oh, don't worry. I will.~ DO ~SetGlobal("LK#ArathSuldanessellar","GLOBAL",3)~ + a3.2
  + ~Gender(Player1,FEMALE) Global("LK#ArathRomanceActive","GLOBAL",2)~ + ~Isn't it your job to... uh, "keep it up?"~ DO ~SetGlobal("LK#ArathSuldanessellar","GLOBAL",3)~ + a3.3
  ++ ~You're damn right it's a good cause.~ DO ~SetGlobal("LK#ArathSuldanessellar","GLOBAL",3)~ + a3.5
  ++ ~I hadn't finished my dragon-killing rampage, you know.~ DO ~SetGlobal("LK#ArathSuldanessellar","GLOBAL",3)~ + a3.4
  ++ ~Do we have to do this right now?~ DO ~SetGlobal("LK#ArathSuldanessellar","GLOBAL",3)~ + a3.5
END

IF ~~ a3.1
  SAY ~Hey, I'm trying to be serious here.~
  IF ~~ + a3.6
END

IF ~~ a3.2
  SAY ~My, <CHARNAME>, is it hot out here or is it just me?~
  = ~Hush and stop distracting me. I'm trying to be serious here.~
  IF ~~ + a3.6
END

IF ~~ a3.3
  SAY ~And usually I'd be the first to do so, vixen, but I'm trying to be serious here.~
  IF ~~ + a3.6
END

IF ~~ a3.4
  SAY ~And while I'd usually be the first one to acknowledge that, I'm trying to be serious here.~
  IF ~~ + a3.6
END

IF ~~ a3.5
  SAY ~I'm trying to say something nice. Shut up and let me finish.~
  IF ~~ + a3.6
END

IF ~~ a3.6
  SAY ~Suldanessellar. The forest. Your soul. Stopping Irenicus.~
  = ~They're all good causes. I'm glad I've had the opportunity to help fight for them, and I suppose I have you to thank for dragging me through this, so, uh... thanks.~
  + ~Global("LK#ArathRomanceActive","GLOBAL",2)~ + ~(Kiss him.)~ + a3.7
  ++ ~That's me, here to help!~ + a3.8
  ++ ~It's really me who should be thanking you.~ + a3.9
  ++ ~It really was dragging, I assure you.~ + a3.10
  ++ ~Okay, I get it. Can we go now?~ + a3.11
END

IF ~~ a3.7
  SAY ~Mm.. that was nice. You should do that more often.~
  = ~Wait, what was I saying?~
  IF ~~ EXIT
END

IF ~~ a3.8
  SAY ~Here to help and bother me endlessly, sure. (grin)~
  IF ~~ + a3.12
END

IF ~~ a3.9
  SAY ~Come to think of it, you've got a point there. Where's my thank you?~
  + ~Global("LK#ArathRomanceActive","GLOBAL",2)~ + ~(Kiss him.)~ + a3.7
  ++ ~(Hug him.)~ + a3.7
  ++ ~Thank you, Arath. I appreciate everything you've done for me.~ + a3.15
  ++ ~Thank you for being an enormous pain in the rear.~ + a3.14
  ++ ~Nice try.~ + a3.13
END

IF ~~ a3.10
  SAY ~Well if you're going to have that attitude about it, absolutely, there's going to be dragging involved, and a fair bit of alcohol.~
  IF ~~ + a3.12
END

IF ~~ a3.11
  SAY ~Yes, I'm sure there are plenty more enormous, frightening monsters to kill. Come on, we've got a city to save and a wizard to punish.~
  IF ~~ EXIT
END

IF ~~ a3.12
  SAY ~Now, aren't there more enormous, frightening monsters we have to kill? Come on, we've got a city to save and a wizard to punish.~
  IF ~~ EXIT
END

IF ~~ a3.13
  SAY ~It was worth a shot. (wink)~
  IF ~~ + a3.12
END

IF ~~ a3.14
  SAY ~My pleasure, as always. (wink)~
  IF ~~ + a3.12
END

IF ~~ a3.15
  SAY ~There, was that so difficult? (grin)~
  IF ~~ + a3.12
END


// Plot: Killing Firkraag
IF ~Global("LK#ArathFirkraag","GLOBAL",2)~ a4
  SAY ~So what next? Now that we've got one dragon down, I was thinking we could take on a demigod or something, what do you think?~
  ++ ~I've always had a dislike for demigods. I think you're on to something.~ DO ~SetGlobal("LK#ArathFirkraag","GLOBAL",3)~ + a4.1
  ++ ~Give me a moment while I search for something with which to deflate your enormous ego.~ DO ~SetGlobal("LK#ArathFirkraag","GLOBAL",3)~ + a4.2
  ++ ~Dragonblood is a good look for you. You should wear it more often.~ DO ~SetGlobal("LK#ArathFirkraag","GLOBAL",3)~ + a4.3
  ++ ~I've defeated worse before.~ DO ~SetGlobal("LK#ArathFirkraag","GLOBAL",3)~ + a4.4
END

IF ~~ a4.1
  SAY ~We just need to find one, and we'll be all set. Know where the deities spend their time these days?~
  IF ~~ + a4.5
END

IF ~~ a4.2
  SAY ~Give me a break. We did just conquer a ferocious, bloodthirsty, revenge-bent red dragon. I think I'm entitled to a little self-congratulation.~
  IF ~~ + a4.5
END

IF ~~ a4.3
  SAY ~(grin) You think? You don't look so bad yourself.~
  IF ~~ + a4.5
END

IF ~~ a4.4
  SAY ~Of course you have, my <PRO_LADYLORD> <CHARNAME>. But for those of us who haven't saved the Sword Coast from ruination, I think we can spare a little self-congratulation.~
  IF ~~ + a4.5
END

IF ~~ a4.5
  SAY ~He doesn't look so intimidating now. Actually, he doesn't seem terribly impressive at all.~
  ++ ~They never do.~ + a4.6
  ++ ~Oh, I don't know. I think he'll make a pretty impressive set of armor.~ + a4.7
  ++ ~Dragons talk big, but in the end, they fall just as hard as anything else.~ + a4.8
  ++ ~He wasn't impressive to begin with.~ + a4.9
END

IF ~~ a4.6
  SAY ~Just looks kind of... well. Dead. Gods.~
  IF ~~ + a4.10
END

IF ~~ a4.7
  SAY ~I think he will, at that.~
  IF ~~ + a4.10
END

IF ~~ a4.8
  SAY ~I swear I felt the ground shake when he came down. I've never seen anything so big. Gods.~
  IF ~~ + a4.10
END

IF ~~ a4.9
  SAY ~Maybe not to you, but some of us have never faced off a dragon before, so have a little patience.~
  IF ~~ + a4.10
END

IF ~~ a4.10
  SAY ~Sort of makes all my problems look rather insignificant.~
  = ~We just took down a *dragon*, <CHARNAME>.~
  IF ~~ + a4.11
  IF ~Global("asylumplot","GLOBAL",1)~ + a4.12
END

IF ~~ a4.11
  SAY ~We might even be able to do this. Get the girl, and the wizard. We can do this.~
  IF ~~ + a4.13
END

IF ~~ a4.12
  SAY ~We might even be able to do this. We'll get that bastard, and we'll get your soul back. We can do this.~
  IF ~~ + a4.13
END

IF ~~ a4.13
  SAY ~We can do this.~
  IF ~~ EXIT
END


// Scenery: On Being Raised
IF ~Global("LK#ArathRaised","GLOBAL",2)~ a5
  SAY ~...ugh. What happened? Where am I?~
  ++ ~You died. In rather spectacular fashion, I might add.~  + a5.1
  ++ ~You've managed to outdo yourself, and completely fail at life.~ + a5.2
  ++ ~Welcome back.~ + a5.2
  ++ ~Get up, you idiot. And be more careful next time.~ + a5.2
END

IF ~~ a5.1
  SAY ~I guess that would explain this massive headache, and why I ache in places I don't generally ache.~
  IF ~~ + a5.6
END

IF ~~ a5.2
  SAY ~I... what?~
  = ~Oh gods, I died, didn't I?~
  ++ ~You did indeed.~ + a5.1
  ++ ~It was very dramatic.~ + a5.3
  ++ ~Come on, get up.~ + a5.4
  ++ ~Next time I won't be so generous.~ + a5.5
END

IF ~~ a5.3
  SAY ~I would hope so. I really died?~
  IF ~~ + a5.1
END

IF ~~ a5.4
  SAY ~Hold your horses. I really died?~
  IF ~~ + a5.1
END

IF ~~ a5.5
  SAY ~Well, thanks. I'd really prefer not to... I was really dead?~
  IF ~~ + a5.1
END

IF ~~ a5.6
  SAY ~Wait, I'm not--undead, am I? Because then I'd have to kill myself, and I'd really prefer to avoid that.~
  ++ ~At least your humor is still there.~ + a5.7
  ++ ~You're alive, don't worry.~ + a5.8
  ++ ~Well, at least I know what to do next time.~ + a5.9
END

IF ~~ a5.7
  SAY ~I'm fine, just... sore. Alright, let's get going.~
  IF ~~ + a5.10
END

IF ~~ a5.8
  SAY ~Good.~
  IF ~~ + a5.10
END

IF ~~ a5.9
  SAY ~You wouldn't. Would you? (groan)~
  IF ~~ + a5.10
END

IF ~~ a5.10
  SAY ~I need a drink.~
  IF ~~ EXIT
END


// Scenery: Raised Again
IF ~Global("LK#ArathRaised","GLOBAL",4)~ a6
  SAY ~...it happened again, didn't it? I died? I'm never going to get used to this. (wince)~
  ++ ~It does get easier.~ + a6.1
  ++ ~Bring anything back for me?~ + a6.2
  ++ ~Stop whining, we need to go.~ + a6.3
  ++ ~I don't get a thank you?~ + a6.4
END

IF ~~ a6.1
  SAY ~Gods, I hope so. Alright, let's go.~
  IF ~~ + a6.5
END

IF ~~ a6.2
  SAY ~The gods say hello, and Ao asked me to get your recipe for roast chicken. Apparently it's notorious even amongst deities.~
  = ~Alright, let's get going.~
  IF ~~ + a6.5
END

IF ~~ a6.3
  SAY ~Alright, give me a hand. Let's go.~
  IF ~~ + a6.5
END

IF ~~ a6.4
  SAY ~...thank you. That done, let's get going.~
  IF ~~ + a6.5
END

IF ~~ a6.5
  SAY ~Woah... okay, let's go in a minute. Just give me a second. Is everything spinning for you? Everything's spinning for me.~
  = ~I'll just... wait here for a moment. You go. I'll catch up.~
  = ~Ugh, I think I'm going to be sick...~
  IF ~~ EXIT
END


// Scenery: Caged Animals in Promenade
IF ~Global("LK#Arathxx","GLOBAL",2)~ a7
  SAY ~This is everything wrong with civilization, right here.~
  ++ ~What do you mean?~ DO ~SetGlobal("LK#Arathxx","GLOBAL",3)~ + a7.1
//  ++ ~The animals?~ DO ~SetGlobal("LK#Arathxx","GLOBAL",3)~ + a7.2
  ++ ~What on Faerun are you talking about?~ + a7.1
  ++ ~You mean that adorable monkey?~ + a7.2
  ++ ~There are many things wrong with civilization.~ DO ~SetGlobal("LK#Arathxx","GLOBAL",3)~ + a7.3
  ++ ~Could you, for once, keep your opinions to yourself?~ DO ~SetGlobal("LK#Arathxx","GLOBAL",3)~ + a7.4
END

IF ~~ a7.1
  SAY ~Over there. The animals.~
  IF ~~ + a7.5
END

IF ~~ a7.2
  SAY ~Yes. No. The fact that the adorable monkey has a chain around its leg!~
  IF ~~ + a7.5
END

IF ~~ a7.3
  SAY ~Yes, there are. But this... it symbolises everything negative about it.~
  IF ~~ + a7.5
END

IF ~~ a7.4
  SAY ~Fine.~
  IF ~~ EXIT
END

IF ~~ a7.5
  SAY ~I like a good circus as much as the next man, but this? Caging animals for entertainment? Forcing them to perform for gawking spectactors without a brain in their heads?~
  = ~This is just wrong.~
  ++ ~It is absolutely wrong, and someone should do something about it.~ + a7.6
  ++ ~It is. And there's nothing we can do about it.~ + a7.7
  ++ ~I've never really thought about it that way.~ + a7.8
  ++ ~I don't know, there's a certain toothless charm to a caged tiger. Nothing quite like making nature bow down before you.~ + a7.9
END

IF ~~ a7.6
  SAY ~Don't think I haven't strongly considered it.~
  IF ~~ + a7.10
END

IF ~~ a7.7
  SAY ~You think I don't know that?~
  = ~I know we can't do anything. That's what makes me angry.~
  IF ~~ + a7.10
END

IF ~~ a7.8
  SAY ~Few do. That's what makes me so angry.~
  IF ~~ + a7.10
END

IF ~~ a7.9
  SAY ~You might be joking, but I'm going to pretend you didn't just say that. Because if you did, I'd be obligated to cut you down where you stand, and there are witnesses.~
  IF ~~ + a7.10a
END

IF ~~ a7.10
  SAY ~Why do people feel the need to tame nature? Why can't they admire the lion from afar, instead of muzzling him and putting him behind bars? The sheer audacity of these people astounds me.~
  IF ~~ + a7.10a
END

IF ~~ a7.10a
  SAY ~I ought to let the animals out right here... those idiots deserve to be mauled.~
  ++ ~If you get the keys, I'll hold off the guards.~ + a7.11
  ++ ~These people might be ignorant, but that doesn't mean they deserve to be mauled. They need to be educated.~ + a7.12
  ++ ~You're terribly attractive when you're angry. Did you know that?~ + a7.13
  ++ ~I can maul them for you, if you'd like.~ + a7.14
  ++ ~Does it really matter?~ + a7.15
END

IF ~~ a7.11
  SAY ~I won't say I'm not tempted, but we can't. And even if we did, they'd replace them within six months anyway. (sigh)~
  IF ~~ + a7.16
END

IF ~~ a7.12
  SAY ~You're right. I know.~
  IF ~~ + a7.12a
END

IF ~~ a7.12a
  SAY ~It just... this gets to me. I feel so helpless.~
  IF ~~ + a7.16
END

IF ~~ a7.13
  SAY ~I--~
  = ~What? <CHARNAME>, that's nice, but this really isn't the time.~
  IF ~~ + a7.12a
END

IF ~~ a7.14
  SAY ~I won't say I'm not tempted. I just... I just feel so helpless.~
  IF ~~ + a7.16
END

IF ~~ a7.15
  SAY ~Yes, it matters! Is something wrong with you? These poor creatures are being subjected to a life so confined and limited I doubt they would even remember how to survive on their own! You don't see anything wrong with that?~
  = ~Let's just go. I don't want to talk about this.~
  IF ~~ EXIT
END

IF ~~ a7.16
  SAY ~Let's go before I change my mind and decide to do the right thing.~
  IF ~~ EXIT
END


// Plot: Lavok and the Planar Sphere
IF ~Global("LK#ArathSphere","GLOBAL",2)~ a8
  SAY ~(sigh)~
  ++ ~Copper for your thoughts?~ DO ~SetGlobal("LK#ArathSphere","GLOBAL",3)~ + a8.1
  ++ ~What're you sighing about?~ DO ~SetGlobal("LK#ArathSphere","GLOBAL",3)~ + a8.1
  ++ ~Do you really have to brood quite so loudly?~ DO ~SetGlobal("LK#ArathSphere","GLOBAL",3)~ + a8.1
  ++ ~(Ignore him.)~ DO ~SetGlobal("LK#ArathSphere","GLOBAL",3)~ EXIT
END

IF ~~ a8.1
  SAY ~Hmm?~
  = ~I'm just feeling a bit conflicted. I'm not sure what to think.~
  ++ ~What about, exactly?~ + a8.5
  ++ ~That cloak doesn't go with those shoes.~ +  a8.2
  ++ ~I'm listening.~ + a8.3
  ++ ~I don't have time for this.~ + a8.4
END

IF ~~ a8.2
  SAY ~What?~
  = ~Oh, very funny. Well, it's become clear to me you have very little taste, so I'm going to ignore that.~
  = ~I'm just thinking about Lavok.~
  IF ~~ + a8.5
END

IF ~~ a8.3
  SAY ~I'm just thinking about Lavok.~
  IF ~~ + a8.5
END

IF ~~ a8.4
  SAY ~Don't worry about it.~
  IF ~~ EXIT
END

IF ~~ a8.5
  SAY ~Lavok and the Planar Sphere. Well, more... Lavok's death. He deserved to die for the unnatural horrors he perpetrated, for his crimes against nature.~
  = ~I'm just struggling to reconcile the idea and the man.~
  ++ ~What do you mean?~ + a8.6
  ++ ~The idea and the man?~ + a8.6
  ++ ~I know what you mean.~ + a8.6
  ++ ~As usual, you make very little sense.~ + a8.6
END

IF ~~ a8.6
  SAY ~I don't believe in instant redemption. I still believe what he did was wrong, and that he needed to die. And yet... there was more to it than that. It wasn't that simple.~
  ++ ~Nothing is ever that simple, Arath. There are so many shades of gray, it's a wonder anyone can distinguish what's right and what's wrong at all.~ + a8.7
  ++ ~He died for the evils he did, yes. But in death there can be redemption.~ + a8.8
  ++ ~He fought the evil that was inside of him, and he died on his own terms. There's something honourable about that.~ + a8.8
  ++ ~You don't get redemption after the sort of things he did.~ + a8.9
  ++ ~Why do you care, exactly? He fought us, he died, big deal.~ + a8.10
END

IF ~~ a8.7
  SAY ~There's nothing but shades of gray. You know I don't believe in good and evil, but... what he did went against everything I stand for. Still...~
  IF ~~ + a8.11
END

IF ~~ a8.8
  SAY ~Maybe. You know I don't believe in good and evil, but... what he did went against everything I stand for. Still...~
  IF ~~ + a8.11
END

IF ~~ a8.9
  SAY ~No, you don't. Still...~
  IF ~~ + a8.11
END

IF ~~ a8.10
  SAY ~I'm not sure. What he did goes against everything I stand for, but still...~
  IF ~~ + a8.11
END

IF ~~ a8.11
  SAY ~He asked that his body be taken outside, so he could feel the sun again.~
  = ~I don't know what to think.~
  IF ~~ EXIT
END


// Plot: Corrupted Forest
IF ~Global("LK#ArathShade","GLOBAL",2)~ a9
  SAY ~There is something dreadfully wrong with this forest.~
  ++ ~I know.~ DO ~SetGlobal("LK#ArathShade","GLOBAL",3)~ + a9.3
  ++ ~You don't say?~ DO ~SetGlobal("LK#ArathShade","GLOBAL",3)~ + a9.3
  ++ ~What's wrong with it, do you think?~ DO ~SetGlobal("LK#ArathShade","GLOBAL",3)~ +  a9.2
  ++ ~Less talking, more investigating.~ DO ~SetGlobal("LK#ArathShade","GLOBAL",3)~ + a9.1
END

IF ~~ a9.1
  SAY ~Yes, <PRO_SIRMAAM>.~
  IF ~~ EXIT
END

IF ~~ a9.2
  SAY ~I don't know.~
  IF ~~ + a9.3
END

IF ~~ a9.3
  SAY ~Everything just looks... I don't know. The trees have an unnatural pallor I've never seen before. Even the light seems wrong.~
  = ~The whole forest is filled with shadows. It's dying.~
  ++ ~Whatever it is, we're going to fix it.~ + a9.4
  ++ ~Do you enjoy stating the obvious, or are you just stupid?~ + a9.5
  ++ ~Then let's find out what's wrong.~ + a9.6
  ++ ~I don't know what would have given *that* away...~ + a9.7
END

IF ~~ a9.4
  SAY ~We've got to do it soon. I think the... corruption, or whatever it is, it's getting worse.~
  IF ~~ EXIT
END

IF ~~ a9.5
  SAY ~Do you mind? This is more important than your bloody insults.~
  IF ~~ + a9.7
END

IF ~~ a9.6
  SAY ~Then let's do it quickly. I think the... corruption, or whatever it is, it's getting worse.~
  IF ~~ EXIT
END

IF ~~ a9.7
  SAY ~We have to fix this, and we have to do it soon. I think the... corruption, or whatever it is, it's getting worse.~
  IF ~~ EXIT
END


// Plot: Working for Bodhi
IF ~Global("LK#ArathBodhi","GLOBAL",2)~ a10
  SAY ~You can't be serious about this. We're going to work with *vampires*? Are you out of your mind?~
  ++ ~Quite possibly. Crazy people don't know they're crazy, do they?~ DO ~SetGlobal("LK#ArathBodhi","GLOBAL",3)~ + a10.4
  ++ ~I'm deadly serious. It's the best option.~ DO ~SetGlobal("LK#ArathBodhi","GLOBAL",3)~ + a10.4
  ++ ~I don't like it either.~ DO ~SetGlobal("LK#ArathBodhi","GLOBAL",3)~ + a10.1
  ++ ~And what exactly is wrong with vampires?~ DO ~SetGlobal("LK#ArathBodhi","GLOBAL",3)~ + a10.2
  ++ ~If you've got a problem with it, you're free to leave.~ DO ~SetGlobal("LK#ArathBodhi","GLOBAL",3)~ + a10.3
END

IF ~~ a10.1
  SAY ~Then why in the nine hells are you agreeing to this?~
  IF ~~ + a10.4
END

IF ~~ a10.2
  SAY ~Is there something wrong with you? Vampires are merciless fiends, with no place in the natural order. They should not exist!~
  IF ~~ + a10.4
END

IF ~~ a10.3
  SAY ~I suppose this is goodbye, then. I hope once they've used you for whatever it is they need that they kill you quickly.~
  IF ~~ DO ~SetGlobal("LK#ArathJoined","LOCALS",0) DropInventory() LeaveParty() EscapeArea()~ EXIT
END

IF ~~ a10.4
  SAY ~We should be driving stakes into their unnatural hearts, not furthering their cause and taking out their enemies!~
  ++ ~I don't intend on furthering their cause any more than I have to. But right now I need them in order to rescue Imoen.~ + a10.5
  ++ ~I need them right now, but when I have Imoen back, rest assured that we will return and destroy them.~ + a10.10
  ++ ~You have to understand, Arath, this is my sister. I'll do whatever I have to.~ + a10.5
  ++ ~They're just trying to get by in this world, just like everyone else. I don't have a problem with helping them.~ + a10.6
END

IF ~~ a10.5
  SAY ~So you're willing to consort with vampires and the undead in order to get her back? Is she really worth that much to you?~
  ++ ~Yes. She's my sister.~ + a10.8
  ++ ~She means everything to me.~ + a10.8
  ++ ~We've been together since childhood. I have to rescue her.~ + a10.8
  ++ ~In all honesty, I don't care for her much, but all the same... I have to rescue her.~ + a10.8
END

IF ~~ a10.6
  SAY ~Then I can't stay with you any longer. I refuse to do dirty work for those filth.~
  ++ ~We have to work with them, Arath. It's our best option.~ + a10.9
  ++ ~It's my sister. I have to get her back.~ + a10.5
  ++ ~That's your prerogative.~ + a10.3
END

IF ~~ a10.8
  SAY ~I suppose if I was in your position... I don't know what I'd do.~
  IF ~~ + a10.9
END

IF ~~ a10.9
  SAY ~Promise me this, then. When we have Imoen, will we come back and wipe these aberrations from the face of Toril?~
  ++ ~I swear.~ + a10.10
  ++ ~I'll take a geas if you want me to.~ + a10.11
  ++ ~I can't do that. I don't know what will happen.~ + a10.3
  ++ ~I will promise no such thing.~ + a10.3
END

IF ~~ a10.10
  SAY ~If you're lying to me, <CHARNAME>, I swear by every god, human and otherwise, that I will do everything in my power to end you. These bloodsucking fiends deserve no mercy, and if you don't go through with this, neither will you.~
  ++ ~Understood.~ + a10.12
  ++ ~Tetchy, aren't you?~ + a10.12
  ++ ~I've already agreed, you don't need to threaten me.~ + a10.12
  ++ ~I don't take kindly to threats.~ + a10.12
END

IF ~~ a10.11
  SAY ~I won't make you swear a geas, but...~
  IF ~~ + a10.10
END

IF ~~ a10.12
  SAY ~The undead deserve no place in this world. They are enemies of all that is natural, and they cannot be allowed to live long.~
  = ~I hope the chance to end them comes sooner rather than later.~
  IF ~~ EXIT
END


// Plot: Working for the Shadow Thieves
IF ~Global("LK#ArathShadowThieves","GLOBAL",2)~ a11
  SAY ~I don't have a problem with thieves, <CHARNAME>--well, as long as they don't steal from me--but are you sure it's wise to throw in our lot with the Shadow Thieves? They're not exactly known as the most trustworthy of organizations, to say the least. And they've already taken our money.~
  ++ ~I don't think we have much choice.~ DO ~SetGlobal("LK#ArathShadowThieves","GLOBAL",3)~ + a11.1
  ++ ~At least we know we're in for more exciting backstabbing, right?~ DO ~SetGlobal("LK#ArathShadowThieves","GLOBAL",3)~ +  a11.2
  ++ ~It's my choice to make.~ DO ~SetGlobal("LK#ArathShadowThieves","GLOBAL",3)~ + a11.3
  ++ ~I'd just like to point out that your opinion means really very little to me.~ DO ~SetGlobal("LK#ArathShadowThieves","GLOBAL",3)~ + a11.4
END

IF ~~ a11.1
  SAY ~You may be right.~
  IF ~~ + a11.4
END

IF ~~ a11.2
  SAY ~That's what I'm worried about.~
  IF ~~ + a11.4
END

IF ~~ a11.3
  SAY ~I'm not saying that it isn't.~
  IF ~~ + a11.4
END

IF ~~ a11.4
  SAY ~I just hope you're making the right decision. My father had dealings with the Shadow Thieves. They might have the connections to get us where we need to go, but...~
  = ~I just hope you're right.~
  ++ ~When have I ever led us wrong?~ + a11.5
  ++ ~You're not the only one.~ + a11.6
  ++ ~I don't appreciate your lack of faith.~ + a11.6
  ++ ~I suppose we'll see.~ + a11.6
END

IF ~~ a11.5
  SAY ~Oh, come on, now you're just asking for trouble.~
  IF ~~ + a11.6
END

IF ~~ a11.6
  SAY ~I'm trusting you, so this better not blow up in our faces. Come on.~
  IF ~~ EXIT
END


// Plot: Spellhold
IF ~Global("LK#ArathSpellhold","GLOBAL",2)~ a12
  SAY ~<CHARNAME>... what happened? What did he do to you?~
  ++ ~He said he took my soul.~ DO ~SetGlobal("LK#ArathSpellhold","GLOBAL",3)~ + a12.2
  ++ ~The bastard stole my soul.~ DO ~SetGlobal("LK#ArathSpellhold","GLOBAL",3)~ + a12.2
  ++ ~He found a way to... to take my soul.~ DO ~SetGlobal("LK#ArathSpellhold","GLOBAL",3)~ + a12.2
  ++ ~I'm too tired for this, Arath.~ DO ~SetGlobal("LK#ArathSpellhold","GLOBAL",3)~ + a12.1
END

IF ~~ a12.1
  SAY ~The others are saying... they're saying he took your soul. Is it true?~
  = ~How is that even possible?~
  ++ ~I'm not sure.~ + a12.3
  ++ ~He had some kind of machine.~ + a12.3
  ++ ~Some sort of death spell; many others died in the process.~ + a12.3
  ++ ~He took Imoen's, as well. That's why she's not... herself.~ + a12.3
END

IF ~~ a12.2
  SAY ~He... took your soul? How is that even possible?~
  ++ ~I'm not sure.~ + a12.3
  ++ ~He had some kind of machine.~ + a12.3
  ++ ~Some sort of death spell; many others died in the process.~ + a12.3
  ++ ~He took Imoen's, as well. That's why she's not... herself.~ + a12.3
END

IF ~~ a12.3
  SAY ~This sounds like something out of one of those stories you get told as a child. Surely you can't just... *lose* your soul like that. What's going to happen to you? Will you be alright?~
  ++ ~I really don't know, Arath.~ + a12.6
  ++ ~Without my soul... I'm worried about the Bhaal essence.~ + a12.4
  ++ ~I'll be fine as soon as I kill him and get it back.~ + a12.6
  ++ ~Would you stop questioning me? I've got enough to deal with!~ + a12.5
END

IF ~~ a12.4
  SAY ~Gods... I hadn't thought. <CHARNAME>...~
  IF ~~ + a12.6
END

IF ~~ a12.5
  SAY ~I know.~
  IF ~~ + a12.6
END

IF ~~ a12.6
  SAY ~We'll get it back, <CHARNAME>. We'll fix this. And we'll make him pay.~
  IF ~~ EXIT
END


// Plot: Sahuagin City
IF ~Global("LK#ArathSahuagin","GLOBAL",2)~ a13.
  SAY ~Well, we're now officially involved in fishy politics.~
  ++ ~And it's really starting to get murky!~ DO ~SetGlobal("LK#ArathSahuagin","GLOBAL",3)~ + a13.1
  ++ ~...that's honestly one of the worst jokes I've ever heard.~ DO ~SetGlobal("LK#ArathSahuagin","GLOBAL",3)~ + a13.2
  ++ ~(groan) Did you have to? Really?~ DO ~SetGlobal("LK#ArathSahuagin","GLOBAL",3)~ + a13.2
  ++ ~One more bad joke and I'm leaving you here. I'm not joking.~ DO ~SetGlobal("LK#ArathSahuagin","GLOBAL",3)~ + a13.3
END

IF ~~ a13.1
  SAY ~My joke was funny. That was just... murky? That was the best you could come up with?~
  = ~And here I had high hopes for you, <CHARNAME>. You disappoint me.~
  IF ~~ + a13.4
END

IF ~~ a13.2
  SAY ~I do my best. (wink)~
  IF ~~ + a13.4
END

IF ~~ a13.3
  SAY ~Alright, alright! Jeez. No need to glare at me.~
  IF ~~ + a13.4
END

IF ~~ a13.4
  SAY ~You know, it's a little bizarre how wherever we go, you find some way to get us involved in a problem. People just seem to gravitate towards you. It's like you have this aura of, "come to me, my children, and I shall fix that which is broken, solve that which is unsolvable and speak with the unspeakable!"~
  ++ ~I don't mind. Gives me a chance to right some wrongs, and that's never a bad thing.~ + a13.5
  ++ ~It really is a gift.~ + a13.6
  ++ ~I wish they'd find someone else to fix their bloody problems. It's not like I haven't got enough to do.~ + a13.7
  ++ ~I couldn't care less what they want, as long as I get paid.~ + a13.8
END

IF ~~ a13.5
  SAY ~Well, I'm glad you feel that way. I think in your shoes I'd be getting a little tetchy. Then again, I wouldn't be in your shoes, but let's not get into that.~
  IF ~~ + a13.9
END

IF ~~ a13.6
  SAY ~Seems that way.~
  IF ~~ + a13.9
END

IF ~~ a13.7
  SAY ~You're just too approachable. You should work on that... take some tips from Irenicus. He's got intimidating downpat.~
  IF ~~ + a13.9
END

IF ~~ a13.8
  SAY ~And that's the <CHARNAME> we know and love!~
  IF ~~ + a13.9
END

IF ~~ a13.9
  SAY ~For the record, I could care less what happens here. But it doesn't sound like we've heard the whole story... we should go speak with the Priestess.~
  = ~Really, I don't know how you get us into these things. You've got a talent, my friend.~
  IF ~~ EXIT
END


// Plot: Shadow Druids pt. I
IF ~Global("LK#ArathShadowDruids","GLOBAL",2)~ a14
  SAY ~Before we go in to the grove, <CHARNAME>, I've heard of these Shadow Druids. They're a militant group who defend the Mother by any means necessary, to the death if need be. They will not be swayed by words, only action.~
  = ~<CHARNAME>, their methods might be extreme, but I can't say I disagree with their aims.~
  ++ ~What are their aims, exactly?~ DO ~SetGlobal("LK#ArathShadowDruids","GLOBAL",3)~ +  a14.1
  ++ ~I've heard of them, too. They attack innocent towns for "encroaching," and steal the children.~ DO ~SetGlobal("LK#ArathShadowDruids","GLOBAL",3)~ + a14.1
  ++ ~Damn right their methods are extreme. Care to explain yourself?~ DO ~SetGlobal("LK#ArathShadowDruids","GLOBAL",3)~ + a14.1
  ++ ~Attack first, ask questions later. Got it. I don't need to hear the rest.~ DO ~SetGlobal("LK#ArathShadowDruids","GLOBAL",3)~ + a14.2
END

IF ~~ a14.1
  SAY ~They believe in the sanctity of nature above all else, and devote their lives to defending her. Yes, they do have extreme methods, and I'm not saying I agree with everything they do, but there's something admirable about their devotion.~
  = ~I'm not sure what it is, but... it's there.~  
  ++ ~There is something admirable about defending what you believe in, I suppose.~ + a14.3
  ++ ~Maybe you have a point. But if they attack me, I'm fighting back.~ + a14.3
  ++ ~There is nothing admirable about what the Shadow Druids do.~ + a14.2
  ++ ~I don't care about their intentions, all I care about is getting paid.~ + a14.2
  ++ ~I could care more about what they believe, I'm taking them out.~ + a14.2
END

IF ~~ a14.2
  SAY ~All I'm saying is, hear them out. Some factions are less extreme than others, and they're fighting an important battle. Don't not listen to what they're saying just because you don't agree with their methods.~
  IF ~~ EXIT
END

IF ~~ a14.3
  SAY ~They just do it with a bit more, uh, conviction than some others is all. I'm not saying I agree with the child-stealing or the attacking innocents policies.~
  IF ~~ + a14.2
END


// Plot: Shadow Druids pt. II
IF ~Global("LK#ArathShadowDruids2","GLOBAL",2)~ a15
  SAY ~Well. That didn't go how I was expecting it to.~
  ++ ~Are you alright? You look a little shaken.~ DO ~SetGlobal("LK#ArathShadowDruids2","GLOBAL",3)~ + a15.1
  ++ ~Nothing ever goes how we expect it to. It's some kind of law, I think.~ DO ~SetGlobal("LK#ArathShadowDruids2","GLOBAL",3)~ + a15.2
  ++ ~They were crazy, we killed them. End of story.~ DO ~SetGlobal("LK#ArathShadowDruids2","GLOBAL",3)~ + a15.3
  ++ ~I'm not your confidante. Go whine to someone else.~ DO ~SetGlobal("LK#ArathShadowDruids2","GLOBAL",3)~ + a15.4
END

IF ~~ a15.1
  SAY ~I'm alright, just a little surprised is all.~
  IF ~~ + a15.5
END

IF ~~ a15.2
  SAY ~I've heard that, too. Always seems that way.~
  IF ~~ + a15.5
END

IF ~~ a15.3
  SAY ~I'm not sure.~
  IF ~~ + a15.5
END

IF ~~ a15.4
  SAY ~I didn't think you were my confidante, dearest <CHARNAME>, I just wanted to say that maybe I was wrong. That's all.~
  IF ~~ EXIT
END

IF ~~ a15.5
  SAY ~To be honest, I'd never met a Shadow Druid before, only heard about them. I didn't think they'd be so...~
  ++ ~Insane?~ + a15.6
  ++ ~Brutal?~ + a15.7
  ++ ~Violent?~ + a15.7
  ++ ~Uncompromising?~ + a15.8
  ++ ~Sexy?~ + a15.9
END

IF ~~ a15.6
  SAY ~Well... yeah.~
  IF ~~ + a15.10
END

IF ~~ a15.7
  SAY ~Yes, but...~
  IF ~~ + a15.10
END

IF ~~ a15.8
  SAY ~Uncompromising, absolutely, but...~
  IF ~~ + a15.10
END

IF ~~ a15.9
  SAY ~I don't know, some of those younger men were pretty fine, made me feel awful for having to kill them. (grin)~
  = ~But... no.~
  IF ~~ + a15.10
END

IF ~~ a15.10
  SAY ~They were hurting nature in an attempt to defend it. I just... I can't wrap my head around that. How on Toril do they justify that?~
  ++ ~Crazy people don't need justification for their actions, Arath.~ + a15.11
  ++ ~They justify it by saying that they're doing what they have to. They obviously saw no other option.~ + a15.12
  ++ ~Some people are power-hungry, and will do whatever needs to be done to attain that power.~ + a15.13
  ++ ~They can't justify it.~ + a15.14
  ++ ~Does anyone really care?~ + a15.15
END

IF ~~ a15.11
  SAY ~I suppose not, no.~
  IF ~~ + a15.16
END

IF ~~ a15.12
  SAY ~Maybe that's how they justified it, but they were wrong. There are always other ways than hurting what you're trying to protect.~
  IF ~~ + a15.16
END

IF ~~ a15.13
  SAY ~I hadn't really thought of them as power-hungry before. I guess that makes sense.~
  IF ~~ + a15.16
END

IF ~~ a15.14
  SAY ~No. They can't. (sigh)~
  IF ~~ + a15.16
END

IF ~~ a15.15
  SAY ~Maybe, maybe not. Let's get back to Trademeet and tell Lord Coprith his problems are over.~
  IF ~~ EXIT
END

IF ~~ a15.16
  SAY ~Maybe I was... wrong. I'll admit that.~
  = ~Let's return to Trademeet and tell Lord Coprith his problems are over.~
  IF ~~ EXIT
END


// Misc: Oh God, The Hair, It Has Been Cut
IF ~Global("LK#ArathHair","GLOBAL",2)~ a16
  SAY ~<CHARNAME>, is my hair alright? I had a bit of a tree-accident and there was fire involved. I had to cut it a bit.~
  = ~It looks awful, doesn't it. I can just tell. I hate not having a mirror.~
  ++ ~It looks terribly handsome, don't worry.~ DO ~SetGlobal("LK#ArathHair","GLOBAL",3)~ + a16.1
  ++ ~It's not--great. I could fix it for you if you like.~ DO ~SetGlobal("LK#ArathHair","GLOBAL",3)~ + a16.11
  ++ ~It looks a little like a squirrel took up residence in your hair.~ DO ~SetGlobal("LK#ArathHair","GLOBAL",3)~ + a16.2
  ++ ~You know, sometimes I have trouble telling if you're serious or not.~ DO ~SetGlobal("LK#ArathHair","GLOBAL",3)~ + a16.3
  ++ ~Get out of my face, I don't give a damn about your hair!~ DO ~SetGlobal("LK#ArathHair","GLOBAL",3)~ + a16.4
END

IF ~~ a16.1
  SAY ~Terribly handsome? Terribly?~
  IF ~~ + a16.5
END

IF ~~ a16.2
  SAY ~Oh, gods, it's worse than I thought.~
  IF ~~ + a16.5
END

IF ~~ a16.3
  SAY ~I am serious! Deadly serious!~
  IF ~~ + a16.5
END

IF ~~ a16.4
  SAY ~<CHARNAME>, I wouldn't ask if it wasn't important.~
  IF ~~ + a16.5
END

IF ~~ a16.5
  SAY ~I need to see a barber. <CHARNAME>, take me to a barber post-haste. It is of imperative importance. I may die.~
  ++ ~We'll get you to a barber soon, alright? Just not right now.~ + a16.6
  ++ ~I could cut it for you if you wanted, I've had a bit of experience in the past.~ + a16.11
  ++ ~You won't die. You might have to wait until you can get a mirror in order to fix it yourself, though.~ + a16.7
  ++ ~Well, you might die if we don't see a barber, but you will die if you don't shut up about your hair.~ + a16.8
  ++ ~It's like a squirrel and a rhinocerous mated, and then laid eggs, and the eggs hatched, and a stampede of squirrel rhinocerouses rampaged through your hair...~ + a16.9
END

IF ~~ a16.6
  SAY ~(sigh) I suppose I'll survive for a little while.~
  IF ~~ + a16.10
END

IF ~~ a16.7
  SAY ~Alright, well, I won't *die*, but I'll be terrified and anxious until I see a barber. I'll fumble in battle. I probably *will* die because of the fumbling.~
  IF ~~ + a16.10
END

IF ~~ a16.8
  SAY ~You are so callous, <CHARNAME>. So callous, and so cruel. I'll be terrified and anxious until I see a barber. I'll fumble in battle. I probably *will* die because of the fumbling.~
  IF ~~ + a16.10
END

IF ~~ a16.9
  SAY ~Your vote of confidence just lifts my spirits, <CHARNAME>. Lifts.~
  = ~Ugh, what am I going to do?~
  IF ~~ + a16.10
END

IF ~~ a16.10
  SAY ~This is important to me, I don't want to look like the deformed cousin of Edgar the Troll. Please. As soon as possible?~
  IF ~~ EXIT
END

IF ~~ a16.11
  SAY ~You... you could? You'd do that for me?~
  ++ ~Of course I would.~ + a16.12
  ++ ~Well, I'll need something in return.~ + a16.13
  ++ ~I will be getting paid, right?~ + a16.14
  ++ ~I'll think about it.~ + a16.15
END

IF ~~ a16.12
  SAY ~You have no idea what a relief that is! Thank you, <CHARNAME>!~
  = ~We'll organise it over the campfire tonight! Ugh, it will be so good not to have to worry about looking like some kind of male hag...~
  IF ~~ EXIT
END

IF ~~ a16.13
  SAY ~Anything. Name it. I'll be your slave for a week.~
  ++ ~You realise you are already my slave, right?~ + a16.16
  ++ ~Kiss me.~ + a16.17
  ++ ~Bring me some flowers.~ + a16.18
  ++ ~Cuddle me.~ + a16.19
  ++ ~Deal with the cooking for a week.~ + a16.20
  ++ ~Do the dishes for a week.~ + a16.21
  ++ ~Have woodland creatures serenade me.~ + a16.22
  ++ ~You buy the next round of drinks.~ + a16.23
  ++ ~I like the slave idea.~ + a16.24
END

IF ~~ a16.14
  SAY ~I suppose I could pay you? If you wanted?~
  ++ ~I was kidding, Arath.~ + a16.25
  ++ ~Excellent. We'll agree on a price after the cut.~ + a16.26
  ++ ~You have to give me something.~ + a16.13
END

IF ~~ a16.15
  SAY ~Would you? Please?~
  = ~We'll organise it over the campfire tonight. You have no idea how relieved I am to hear that.~
  IF ~~ EXIT
END

IF ~~ a16.16
  SAY ~Well. I suppose you've got a point there. What else do you want, apart from my eternal devotion?~
  ++ ~Kiss me.~ + a16.17
  ++ ~Bring me some flowers.~ + a16.18
  ++ ~Cuddle me.~ + a16.18
  ++ ~Deal with the cooking for a week.~ + a16.20
  ++ ~Do the dishes for a week.~ + a16.19
  ++ ~Have woodland creatures serenade me.~ + a16.18
  ++ ~You buy the next round of drinks.~ + a16.18
  ++ ~I like the slave idea.~ + a16.20
END

IF ~~ a16.17
  SAY ~Kiss you?~
  = ~Well... if that's what you want, I'm not complaining.~
  = ~(Arath trails a hand over your cheek and pulls you in for a passionate kiss. He is breathing a little hard when you break apart.)~
  = ~So it's a deal? You'll fix my hair?~
  ++ ~Of course I will.~ + a16.12
  ++ ~Mmm... for that, anything.~ + a16.12
  ++ ~We'll just take you to a barber, I think.~ + a16.21
  ++ ~That was a terrible kiss. No haircut for you!~ + a16.22
  ++ ~I wanted a kiss, not a depth probing!~ + a16.23
END

IF ~~ a16.18
  SAY ~At the next possible opportunity. So it's a deal? You'll fix my hair?~
  ++ ~Of course I will.~ + a16.12
  ++ ~On second thought, we'll just take you to a barber.~ + a16.24
  ++ ~I'll think about it.~ + a16.15
END

IF ~~ a16.19
  SAY ~But--~
  = ~Alright. I'll do the dishes. I hate doing the dishes, but I will do the dishes, because I love my hair more than I hate the dishes.~
  IF ~~ + a16.25
END

IF ~~ a16.20
  SAY ~We'll, we'll see about that one, but I'll do my best.~
  IF ~~ + a16.25
END

IF ~~ a16.21
  SAY ~As long as I get it fixed, I'm happy.~
  IF ~~ + a16.10
END

IF ~~ a16.22
  SAY ~I'll have you know that was an excellent kiss. I am an excellent kisser.~
  IF ~~ + a16.26
END

IF ~~ a16.23
  SAY ~But I thought--~
  = ~Oh. You wanted a chaste, tender kiss. Well. You could have said.~
  IF ~~ + a16.26
END

IF ~~ a16.24
  SAY ~I honestly don't care who fixes it as long as it's fixed soon. This is torture.~
  IF ~~ EXIT
END

IF ~~ a16.25
  SAY ~We'll iron out the details over the campfire tonight. You have no idea how relieved I am.~
  IF ~~ EXIT
END

IF ~~ a16.26
  SAY ~Fine, I'll just be ugly then. Forever. Until I can find a mirror and fix it. Please let us stay at an inn soon.~
  IF ~~ EXIT
END


// Plot: the de'Arnise Keep
IF ~Global("LK#ArathKeep","GLOBAL",2)~ a17
  SAY ~Remind me why we're helping the de'Arnise family again?~
  = ~It just seems a little pointless. I know they need help, but there are others who could do it, and we've got no reason to.~
  = ~We're not righting some cosmic wrong, getting revenge, or... any other reason, really. Why're we doing this?~
  ++ ~Because it's the right thing to do.~ DO ~SetGlobal("LK#ArathKeep","GLOBAL",3)~ + a17.1
  ++ ~Helping people in need is important.~ DO ~SetGlobal("LK#ArathKeep","GLOBAL",3)~ + a17.2
  ++ ~Whim, mainly. I felt like helping, so I did.~ DO ~SetGlobal("LK#ArathKeep","GLOBAL",3)~ + a17.3
  ++ ~You realise there will be a reward at the end of this?~ DO ~SetGlobal("LK#ArathKeep","GLOBAL",3)~ + a17.4
  ++ ~Because we are. I don't have to share my reasoning.~ DO ~SetGlobal("LK#ArathKeep","GLOBAL",3)~ + a17.5
END

IF ~~ a17.1
  SAY ~It depends on whose viewpoint you're looking at things.~
  IF ~~ + a17.6
END

IF ~~ a17.2
  SAY ~Is it?~
  IF ~~ + a17.6
END

IF ~~ a17.3
  SAY ~I suppose I can understand that, being fairly whim-oriented myself, but... I don't know.~
  IF ~~ + a17.6
END

IF ~~ a17.4
  SAY ~Well, yes, I do. But if we wanted money we could steal from the upper class Athkatlans.~
  IF ~~ + a17.6
END

IF ~~ a17.5
  SAY ~That's your prerogative, I suppose.~
  IF ~~ EXIT
END

IF ~~ a17.6
  SAY ~Sometimes I just struggle a little with why we do some things. It's all well and good to help people, but there's no real reason to, unless there's something really wrong that needs to be fixed.~
  = ~I can understand clearing a temple of undead; they're unnatural fiends and need to be killed. I can understand returning a lost child to her mother, and I can even understand revenge on someone else's behalf.~
  = ~This whole... helping people just because they need help is a little foreign to me is all. I don't see the point.~
  ++ ~Helping others is a large part of being a good person.~ + a17.7
  ++ ~For me, helping people is an important part of my faith.~ + a17.7
  ++ ~Like I said, I'm in it for the reward. I couldn't care less about helping people.~ +  a17.8
  ++ ~A lot of things are foreign to you, Arath. It doesn't mean they're bad.~ + a17.9
  ++ ~Your definition of what's 'helping people' and what isn't is more than a little blurry.~ + a17.10
  + ~GlobalLT("chapter","GLOBAL",4)~ + ~I'm just doing whatever I can to raise money.~ + a17.11
END

IF ~~ a17.7
  SAY ~I guess I just don't see the lure of trying to be 'good'.~
  IF ~~ + a17.12
END

IF ~~ a17.8
  SAY ~I don't have a problem with that. I guess I just don't understand the desire some people have to try to be 'good'.~
  IF ~~ + a17.12
END

IF ~~ a17.9
  SAY ~I'm not saying it's a bad thing. I guess I just don't understand the desire some people have to try to be 'good'.~
  IF ~~ + a17.12
END

IF ~~ a17.10
  SAY ~It makes perfect sense to me, but then, a lot of things make sense to me that... don't really make sense. I guess I just don't understand the desire some people have to try to be 'good'.~
  IF ~~ + a17.12
END

IF ~~ a17.11
  SAY ~Yeah. I know.~
  = ~I guess I just don't understand the desire some people have to try to be 'good'.~
  IF ~~ + a17.12
END
IF ~~ a17.12
  SAY ~Then again, I don't really understand the desire to be 'evil' either, though I don't think anyone really does. Except maybe small children. I'm fairly sure they're the main exception to that rule.~
  IF ~~ EXIT
END


// Plot: Post-Killing Bodhi
IF ~Global("LK#ArathVampires","GLOBAL",2)~ a18
  SAY ~It may have taken a while, but I'm glad we got to take out that coven. Bodhi was indescribably creepy, on so many levels. I really don't understand what was with that jacket, especially. Was she trying to accentuate her cold, bloodless boobs?~
  + ~OR(4) PartyHasItem("miscbl") PartyHasItem("miscbm") PartyHasItem("miscbn") PartyHasItem("miscbo")~ + ~Do you mind? I just had to kill my lover, you insensitive jerk!~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3)~ + a18.7
  ++ ~I noticed that vampires tend to play up their sexuality. I suppose it gives them a better chance of luring victims.~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3)~ + a18.1
  ++ ~Even the male vampires were dressed... uh. Interestingly.~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3)~ + a18.1
  + ~!InParty("Imoen2")~ + ~I'm just glad it's over.~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3)~ + a18.2
  + ~InParty("Imoen2")~ + ~I'm just glad it's over, and that Imoen has her soul back.~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3)~ + a18.2
  ++ ~Must you always be so flippant?~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3)~ + a18.3
  ++ ~I didn't mind the accentuating.~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3)~ + a18.4
  ++ ~I really don't understand your need to talk about every little thing.~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3)~ + a18.5
END

IF ~~ a18.1
  SAY ~Strangely, I just couldn't bring myself to find it attractive. They just looked so... I don't know. Overly done up?~
  IF ~~ + a18.6
END

IF ~~ a18.2
  SAY ~You can say that again.~
  IF ~~ + a18.6
END

IF ~~ a18.3
  SAY ~And why shouldn't I be? We just almost single-handedly wiped out an entire coven of vampires. A little flippancy is exactly what's needed, I think.~
  IF ~~ + a18.6
END

IF ~~ a18.4
  SAY ~Well, *you* wouldn't. You do have to remember that some of us have taste, <CHARNAME>.~
  IF ~~ + a18.1
END

IF ~~ a18.5
  SAY ~It's a reflex.~
  IF ~~ EXIT
END

IF ~~ a18.6
  SAY ~They certainly had a flair for interesting decor, though, don't you think? The pools of blood and satin cushions were a nice touch, I thought.~
  ++ ~The room filled with spikes was a highlight for me personally.~ + a18.8
  ++ ~Hey, I thought those cushions were pretty nice. I would have taken some if it weren't for the bloodstains.~ + a18.9
  ++ ~When I get a home, I'm thinking of getting the same interior designer, actually.~ + a18.10
  ++ ~Is something wrong with you? It was disgusting.~ + a18.11
  ++ ~Get to the point, Arath.~ + a18.12
END

IF ~~ a18.7
  SAY ~Right. It's a reflex. Sorry.~
  IF ~~ + a18.12
END

IF ~~ a18.8
  SAY ~It did have a certain, uh, attraction.~
  IF ~~ + a18.12
END

IF ~~ a18.9
  SAY ~Don't think I didn't notice that.~
  IF ~~ + a18.12
END

IF ~~ a18.10
  SAY ~I'm not sure anyone's had any success bringing the undead back from the dead, but hey, I'm willing to give it a shot just to see that.~
  IF ~~ + a18.12
END

IF ~~ a18.11
  SAY ~There are many things wrong with me, dear <CHARNAME>. This is the least of them. (grin)~
  IF ~~ + a18.12
END
IF ~~ a18.12
  SAY ~Anyway, I just wanted to say... I'm glad you kept your word. I didn't really want to have to attack you. For one, I'd probably lose, so there's that.~
  + ~OR(4) PartyHasItem("miscbl") PartyHasItem("miscbm") PartyHasItem("miscbn") PartyHasItem("miscbo")~ + ~And look what it got me. The body of my vampirized lover, who I don't even know I can bring back.~ + a18.13
  ++ ~Of course I kept my word. I hate vampires as much as you do.~ + a18.14
  ++ ~You would have lost, yes.~ + a18.17
  ++ ~I do have a certain obligation to kill undead, you know.~ + a18.14
  ++ ~It isn't like I had any choice. They had to be taken out.~ + a18.14
  ++ ~Is it so difficult for you to say thank you?~ + a18.15
END

IF ~~ a18.13
  SAY ~I know. We'll do everything we can, don't worry.~
  IF ~~ + a18.16
END

IF ~~ a18.14
  SAY ~It still means a lot.~
  IF ~~ EXIT
END

IF ~~ a18.15
  SAY ~Yes. Yes, it is. Come on.~
  IF ~~ EXIT
END

IF ~~ a18.16
  SAY ~We'll fix this.~
  IF ~~ EXIT
END

IF ~~ a18.17
  SAY ~Well on that life-affirming note, shall we continue?~
  IF ~~ EXIT
END

END