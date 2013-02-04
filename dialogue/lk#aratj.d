// ----------------------------------------------------------
// Arath NPC, Joined Dialogue 
// By K'aeloree
// ----------------------------------------------------------

// ******************
// INDEX OF CONTENT *
// ******************

// ----------------------------------------------------------
// JOINING SEQUENCE CONTENT & INTERJECTIONS
// ----------------------------------------------------------

// ----------------------------------------------------------
// NON-ROMANTIC CONTENT
// ----------------------------------------------------------
// -- Underdark
// -- North Forest
// Killing the Dragon in Suldanessellar
// -- Killing Firkraag
// -- On Being Raised
// On Being Raised... again
// -- Caged Animals in Athkatla
// * Lavok and the Planar Sphere
// -- Corrupted Forest
// -- Working for Bodhi
// -- Working for the Shadow Thieves
// -- Under Spellhold
// -- Sahuagin City
// -- Shadow Druids pt. I
// -- Shadow Druids pt. II
// -- The de'Arnise Keep
// -- Post-Killing Bodhi
// -- The Bhaalspawn Thing, pt. I
// -- The Bhaalspawn Thing, pt. II
// -- The Bhaalspawn Thing, pt. III
// -- The Bhaalspawn Thing, pt. IV

// ----------------------------------------------------------
// ROMANTIC CONTENT
// ----------------------------------------------------------
// -- Lovetalk 1 - Class-based Flirting (spellcaster, fighter, thief, bard)
// -- Lovetalk 2 - Further Compliments
// -- Lovetalk 3 - A "Romantic" Proposal
// -- Lovetalk 4 - A "Romantic" Dinner
// -- Lovetalk 5 - The Wonders of Athkatla
// -- Lovetalk 6 - Bizarre Dreams
// -- Lovetalk 7 - More compliments!
// -- Lovetalk 8 - Hottubs and Death
// -- Lovetalk 9 - The Rash
// -- Lovetalk 10 - Candlekeep and Siblings
// -- Lovetalk 11 - Take a fucking break, <CHARNAME>!
// -- Lovetalk 12 - Smalltalk and Intimations
// -- Lovetalk 13 - Post-Spellhold, Continued Lack of Sleep
// -- Lovetalk 14 - Logistics of a Lost Soul
// -- Lovetalk 15 - A Potion for <CHARNAME>
// -- Lovetalk 16 - Breaking Point
// -- Lovetalk 17 - A Drunken Kiss
// -- Lovetalk 18 - Morning After
// -- Lovetalk 19 - Revelations
// -- Lovetalk 20 - The Bracelet
// -- Sex Scene 2 - The Forest
// -- Sex Scene 3 - The Massage

// ----------------------------------------------------------
// INTERJECTIONS
// ----------------------------------------------------------

// ----------------------------------------------------------
// BODHINAPPING
// ----------------------------------------------------------

// ----------------------------------------------------------
// QUEST
// ----------------------------------------------------------

BEGIN LK#ARATJ


IF ~Global("LK#ArathCCSlavers","GLOBAL",1)~ LK#Arath_Hendak5
  SAY ~<CHARNAME>. Will you be going after those slavers?~ [lk#ar48]
  ++ ~I couldn't leave a job half-finished, could I?~ DO ~SetGlobal("LK#ArathCCSlavers","GLOBAL",2)~ + LK#Arath_Hendak5.1
  ++ ~Another time, perhaps.~ DO ~SetGlobal("LK#ArathCCSlavers","GLOBAL",2)~ + LK#Arath_Hendak5.2
  ++ ~I don't think so, no.~ DO ~SetGlobal("LK#ArathCCSlavers","GLOBAL",2)~ + LK#Arath_Hendak5.3
END

IF ~~ LK#Arath_Hendak5.1
  SAY ~If I remember correctly, there's a tunnel that runs directly from the Coronet to the main holding area. I remember seeing mention of it--~
  = ~Look, there's something I should tell you before we do this. I've got absolutely no links to it myself, I swear, but my father was the head of a slave syndicate in Athkatla.~
  = ~He died a few years ago, but I suspect we'll run into more than a few of those who worked with him. I'm just letting you know, they might recognize me.~
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
  SAY ~"Oh, hi, I want your help in taking down some slavers! Oh, and by the way, my father was a slaver and that may complicate things more than a little." Yeah, I'm sure that would have gone down real well.~
  IF ~~ + LK#Arath_Hendak5.6
END

IF ~~ LK#Arath_Hendak5.6
  SAY ~I understand if you're apprehensive, but I can help you. I'm not some kid dreaming of adventure; I'm an experienced druid with more than a few tricks up his sleeve. You've seen what I can do. I can help you.~
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
EXIT

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
I_C_T SAFE BEAST 1 LK#Arath_Beastmaster
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~You bastard!~
  == BEAST ~Kill them, Tabitha!~
END

// Bah!  I have had enough of your insolence!  It is time to feed my Tabitha anyway!  Come...open the cages...attack!!
I_C_T SAFE BEAST 5 LK#Arath_Beastmaster1
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~You bastard!~
  == BEAST ~Kill them, Tabitha!~
END

// Insolent!  Did I not tell you to leave?!  Bah!  It is time to feed my Tabitha, now, anyway.  Come...open the cages...attack!
I_C_T SAFE BEAST 6 LK#Arath_Beastmaster2
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~You bastard!~
  == BEAST ~Kill them, Tabitha!~
END

APPEND LK#ARATJ

// On seeing the door (DOOR0405) or new trigger area
IF ~Global("LK#ArathJoinDoor","GLOBAL",1)~ tr1
  SAY ~<CHARNAME>, the main building is through here.~
  = ~The last time I was here, I killed seven slavers and my father. I thought I'd taken out their main operation, but my father had laid plan after plan. I suppose his paranoia wouldn't allow anything else.~ [lk#ar49]
  = ~I don't know exactly what you should be expecting, but if it's anything like it was when my father was running things, they'll be formidable. Attack hard and fast.~
  ++ ~I'll keep that in mind.~ DO ~SetGlobal("LK#ArathJoinDoor","GLOBAL",2)~ + tr1.3
  ++ ~And which hand should I use to hold my sword, exactly?~ DO ~SetGlobal("LK#ArathJoinDoor","GLOBAL",2)~ + tr1.1
  ++ ~I know what to do. I've done this plenty of times before.~ DO ~SetGlobal("LK#ArathJoinDoor","GLOBAL",2)~ + tr1.1
  ++ ~You killed your own father?~ DO ~SetGlobal("LK#ArathJoinDoor","GLOBAL",2)~ + tr1.4
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
  SAY ~This used to be my father's room.~ [lk#ar50]
  ++ ~Are you alright?~ DO ~SetGlobal("LK#ArathSlavers","GLOBAL",2)~ + tr2.1
  ++ ~Yeah, yeah, and that's the table he used to work on, and that's the bed he used to sleep on...~ DO ~SetGlobal("LK#ArathSlavers","GLOBAL",2)~ + tr2.2
  ++ ~Enough about your father, already! Geez, don't you ever talk about anything else?~ DO ~SetGlobal("LK#ArathSlavers","GLOBAL",2)~ + tr2.3
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
  SAY ~I don't have anything planned after this. Beyond getting a bit drunk and having some fun with someone out the back, I mean.~
  = ~You never mentioned what, exactly, you were doing.~
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
  IF ~~ DO ~SetGlobal("LK#ArathMet","AR0406",2) SetGlobal("LK#ArathJoined","LOCALS",0) LeaveParty() MoveToPoint([931.1227])~ EXIT
END

// ************************
//                        *
// Non-romantic dialogues *
//                        *
// ************************



// Scenery: Underdark
IF ~Global("LK#ArathUnderdark","GLOBAL",2)~ a1
  SAY ~There's a certain weird beauty to these caverns. I'd never have thought such enormous spaces lay beneath our feet as we walked, but... Here you go. Even the drow themselves have a sort of terrifying, brutal beauty.~
  ++ ~I'd have to agree. They do have a certain charm.~ DO ~SetGlobal("LK#ArathUnderdark","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a1.5
  ++ ~I don't really care what they look like, I'm more concerned with getting out of them.~ DO ~SetGlobal("LK#ArathUnderdark","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a1.1
  ++ ~I don't think they really compare to you, but I suppose.~ DO ~SetGlobal("LK#ArathUnderdark","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a1.2
  ++ ~How could you say that? It's disgusting down here.~ DO ~SetGlobal("LK#ArathUnderdark","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a1.3
  ++ ~I'm sorry, did you say something?~ DO ~SetGlobal("LK#ArathUnderdark","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a1.4
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
  ++ ~Beautiful, isn't it?~ DO ~SetGlobal("LK#ArathNorthForest","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a2.1
  ++ ~Yes, let's all stand and admire the trees. Look, they even have bark!~ DO ~SetGlobal("LK#ArathNorthForest","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a2.2
  ++ ~They make me feel so small.~ DO ~SetGlobal("LK#ArathNorthForest","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a2.3
  ++ ~Must we stop at everything natural we come across?~ DO ~SetGlobal("LK#ArathNorthForest","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a2.4
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
  SAY ~This reminds me of why I wanted to become a druid in the first place. This feeling of... I don't know. "Wonderment" seems like such a boring way to put it.~
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
IF ~Global("LK#ArathSuldanessellar","GLOBAL",1)~ a3
  SAY ~I don't mean to interrupt your dragon-killing rampage there, crazy <PRO_MANWOMAN>, but I just wanted to say that it's a good cause we're fighting for, and to... keep it up.~
  ++ ~And what cause would that be, exactly?~ DO ~SetGlobal("LK#ArathSuldanessellar","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a3.6
  ++ ~That was quite possibly the most bizarre compliment I've ever received.~ DO ~SetGlobal("LK#ArathSuldanessellar","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a3.1
  + ~Gender(Player1,MALE) Global("LK#ArathRomanceActive","GLOBAL",2)~ + ~Oh, don't worry. I will.~ DO ~SetGlobal("LK#ArathSuldanessellar","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a3.2
  + ~Gender(Player1,FEMALE) Global("LK#ArathRomanceActive","GLOBAL",2)~ + ~Isn't it your job to... uh, "keep it up?"~ DO ~SetGlobal("LK#ArathSuldanessellar","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a3.3
  ++ ~You're damn right it's a good cause.~ DO ~SetGlobal("LK#ArathSuldanessellar","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a3.5
  ++ ~I hadn't finished my dragon-killing rampage, you know.~ DO ~SetGlobal("LK#ArathSuldanessellar","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a3.4
  ++ ~Do we have to do this right now?~ DO ~SetGlobal("LK#ArathSuldanessellar","GLOBAL",32) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a3.5
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
  ++ ~I've always had a dislike for demigods. I think you're on to something.~ DO ~SetGlobal("LK#ArathFirkraag","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a4.1
  ++ ~Give me a moment while I search for something with which to deflate your enormous ego.~ DO ~SetGlobal("LK#ArathFirkraag","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a4.2
  ++ ~Dragonblood is a good look for you. You should wear it more often.~ DO ~SetGlobal("LK#ArathFirkraag","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a4.3
  ++ ~I've defeated worse before.~ DO ~SetGlobal("LK#ArathFirkraag","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a4.4
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
  ++ ~You died. In rather spectacular fashion, I might add.~ DO ~SetGlobal("LK#ArathRaised","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a5.1
  ++ ~You've managed to outdo yourself, and completely fail at life.~ DO ~SetGlobal("LK#ArathRaised","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a5.2
  ++ ~Welcome back.~ DO ~SetGlobal("LK#ArathRaised","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a5.2
  ++ ~Get up, you idiot. And be more careful next time.~ DO ~SetGlobal("LK#ArathRaised","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a5.2
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
  ++ ~It does get easier.~ DO ~SetGlobal("LK#ArathRaised","GLOBAL",5) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a6.1
  ++ ~Bring anything back for me?~ DO ~SetGlobal("LK#ArathRaised","GLOBAL",5) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a6.2
  ++ ~Stop whining, we need to go.~ DO ~SetGlobal("LK#ArathRaised","GLOBAL",5) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a6.3
  ++ ~I don't get a thank you?~ DO ~SetGlobal("LK#ArathRaised","GLOBAL",5) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a6.4
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
IF ~Global("LK#ArathAnimals","GLOBAL",1)~ a7
  SAY ~This is everything wrong with civilization, right here.~
  ++ ~What do you mean?~ DO ~SetGlobal("LK#ArathAnimals","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a7.1
  ++ ~What on Faerun are you talking about?~ DO ~SetGlobal("LK#ArathAnimals","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a7.1
  ++ ~You mean that adorable monkey?~ DO ~SetGlobal("LK#ArathAnimals","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a7.2
  ++ ~There are many things wrong with civilization.~DO ~SetGlobal("LK#ArathAnimals","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a7.3
  ++ ~Could you, for once, keep your opinions to yourself?~ DO ~SetGlobal("LK#ArathAnimals","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a7.4
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
  SAY ~Yes, there are. But this... it symbolizes everything negative about it.~
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
  SAY ~I ought to let the animals out right here... Those idiots deserve to be mauled.~
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
  ++ ~Copper for your thoughts?~ DO ~SetGlobal("LK#ArathSphere","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a8.1
  ++ ~What're you sighing about?~ DO ~SetGlobal("LK#ArathSphere","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a8.1
  ++ ~Do you really have to brood quite so loudly?~ DO ~SetGlobal("LK#ArathSphere","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a8.1
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
  ++ ~He fought the evil that was inside of him, and he died on his own terms. There's something honorable about that.~ + a8.8
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
  ++ ~I know.~ DO ~SetGlobal("LK#ArathShade","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a9.3
  ++ ~You don't say?~ DO ~SetGlobal("LK#ArathShade","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a9.3
  ++ ~What's wrong with it, do you think?~ DO ~SetGlobal("LK#ArathShade","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ +  a9.2
  ++ ~Less talking, more investigating.~ DO ~SetGlobal("LK#ArathShade","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a9.1
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
IF ~Global("LK#ArathBodhi","GLOBAL",1)~ a10
  SAY ~You can't be serious about this. We're going to work with *vampires*? Are you out of your mind?~
  ++ ~Quite possibly. Crazy people don't know they're crazy, do they?~ DO ~SetGlobal("LK#ArathBodhi","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a10.4
  ++ ~I'm deadly serious. It's the best option.~ DO ~SetGlobal("LK#ArathBodhi","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a10.4
  ++ ~I don't like it either.~ DO ~SetGlobal("LK#ArathBodhi","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a10.1
  ++ ~And what exactly is wrong with vampires?~ DO ~SetGlobal("LK#ArathBodhi","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a10.2
  ++ ~If you've got a problem with it, you're free to leave.~ DO ~SetGlobal("LK#ArathBodhi","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a10.3
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
IF ~Global("LK#ArathShadowThieves","GLOBAL",1)~ a11
  SAY ~I don't have a problem with thieves, <CHARNAME>--well, as long as they don't steal from me--but are you sure it's wise to throw in our lot with the Shadow Thieves? They're not exactly known as the most trustworthy of organizations, to say the least. And they've already taken our money.~
  ++ ~I don't think we have much choice.~ DO ~SetGlobal("LK#ArathShadowThieves","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a11.1
  ++ ~At least we know we're in for more exciting backstabbing, right?~ DO ~SetGlobal("LK#ArathShadowThieves","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ +  a11.2
  ++ ~It's my choice to make.~ DO ~SetGlobal("LK#ArathShadowThieves","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a11.3
  ++ ~I'd just like to point out that your opinion means really very little to me.~ DO ~SetGlobal("LK#ArathShadowThieves","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a11.4
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
  ++ ~He said he took my soul.~ DO ~SetGlobal("LK#ArathSpellhold","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a12.2
  ++ ~The bastard stole my soul.~ DO ~SetGlobal("LK#ArathSpellhold","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a12.2
  ++ ~He found a way to... to take my soul.~ DO ~SetGlobal("LK#ArathSpellhold","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a12.2
  ++ ~I'm too tired for this, Arath.~ DO ~SetGlobal("LK#ArathSpellhold","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a12.1
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
  ++ ~And it's really starting to get murky!~ DO ~SetGlobal("LK#ArathSahuagin","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a13.1
  ++ ~...that's honestly one of the worst jokes I've ever heard.~ DO ~SetGlobal("LK#ArathSahuagin","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a13.2
  ++ ~(groan) Did you have to? Really?~ DO ~SetGlobal("LK#ArathSahuagin","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a13.2
  ++ ~One more bad joke and I'm leaving you here. I'm not joking.~ DO ~SetGlobal("LK#ArathSahuagin","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a13.3
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
  SAY ~Alright, alright! Geez. No need to glare at me.~
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
IF ~Global("LK#ArathShadowDruids","GLOBAL",1)~ a14
  SAY ~Before we go in to the grove, <CHARNAME>, I've heard of these Shadow Druids. They're a militant group who defend the Mother by any means necessary, to the death if need be. They will not be swayed by words, only action.~
  = ~<CHARNAME>, their methods might be extreme, but I can't say I disagree with their aims.~
  ++ ~What are their aims, exactly?~ DO ~SetGlobal("LK#ArathShadowDruids","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a14.1
  ++ ~I've heard of them, too. They attack innocent towns for "encroaching," and steal the children.~ DO ~SetGlobal("LK#ArathShadowDruids","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a14.1
  ++ ~Damn right their methods are extreme. Care to explain yourself?~ DO ~SetGlobal("LK#ArathShadowDruids","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a14.1
  ++ ~Attack first, ask questions later. Got it. I don't need to hear the rest.~ DO ~SetGlobal("LK#ArathShadowDruids","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a14.2
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
IF ~Global("LK#ArathShadowDruids2","GLOBAL",1)~ a15
  SAY ~Well. That didn't go how I was expecting it to.~
  ++ ~Are you alright? You look a little shaken.~ DO ~SetGlobal("LK#ArathShadowDruids2","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a15.1
  ++ ~Nothing ever goes how we expect it to. It's some kind of law, I think.~ DO ~SetGlobal("LK#ArathShadowDruids2","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a15.2
  ++ ~They were crazy, we killed them. End of story.~ DO ~SetGlobal("LK#ArathShadowDruids2","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a15.3
  ++ ~I'm not your confidante. Go whine to someone else.~ DO ~SetGlobal("LK#ArathShadowDruids2","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a15.4
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


// Plot: the de'Arnise Keep
IF ~Global("LK#ArathKeep","GLOBAL",2)~ a17
  SAY ~Remind me why we're helping the de'Arnise family again?~
  = ~It just seems a little pointless. I know they need help, but there are others who could do it, and we've got no reason to.~
  = ~We're not righting some cosmic wrong, getting revenge, or... any other reason, really. Why're we doing this?~
  ++ ~Because it's the right thing to do.~ DO ~SetGlobal("LK#ArathKeep","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a17.1
  ++ ~Helping people in need is important.~ DO ~SetGlobal("LK#ArathKeep","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a17.2
  ++ ~Whim, mainly. I felt like helping, so I did.~ DO ~SetGlobal("LK#ArathKeep","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a17.3
  ++ ~You realise there will be a reward at the end of this?~ DO ~SetGlobal("LK#ArathKeep","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a17.4
  ++ ~Because we are. I don't have to share my reasoning.~ DO ~SetGlobal("LK#ArathKeep","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a17.5
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
  + ~OR(4) PartyHasItem("miscbl") PartyHasItem("miscbm") PartyHasItem("miscbn") PartyHasItem("miscbo")~ + ~Do you mind? I just had to kill my lover, you insensitive jerk!~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a18.7
  ++ ~I noticed that vampires tend to play up their sexuality. I suppose it gives them a better chance of luring victims.~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a18.1
  ++ ~Even the male vampires were dressed... uh. Interestingly.~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a18.1
  + ~!InParty("Imoen2")~ + ~I'm just glad it's over.~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a18.2
  + ~InParty("Imoen2")~ + ~I'm just glad it's over, and that Imoen has her soul back.~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a18.2
  ++ ~Must you always be so flippant?~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a18.3
  ++ ~I didn't mind the accentuating.~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a18.4
  ++ ~I really don't understand your need to talk about every little thing.~ DO ~SetGlobal("LK#ArathVampires","GLOBAL",3) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + a18.5
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
  SAY ~Anyway, I just wanted to say... I'm glad you kept your word. I didn't really want to have to kill you. For one, I'd probably lose, so there's that.~
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



// Cycle: The Bhaalspawn Thing, pt. I
IF ~Global("LK#ArathBhaalspawn","GLOBAL",2)~ a19
  SAY ~Can we talk?~
  IF ~~ + a19.2
  IF ~NumInPartyGT(2)~ + a19.1
END

IF ~~ a19.1
  SAY ~Away from the others?~
  ++ ~Of course. What's the matter?~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",3) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a19.3
  ++ ~What is it now?~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",3) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a19.3
  ++ ~Is something wrong?~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",3) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a19.3
  ++ ~I'm busy right now.~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",3) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a19.4
END

IF ~~ a19.2
  SAY ~I wouldn't ask if it wasn't important.~
  ++ ~Of course. What's the matter?~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",3) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a19.3
  ++ ~What is it now?~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",3) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a19.3
  ++ ~Is something wrong?~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",3) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a19.3
  ++ ~I'm busy right now.~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",3) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a19.4
END

IF ~~ a19.3
  SAY ~Look, I've been hearing something recently. I'm not sure what it means, exactly, but...~
  = ~<CHARNAME>, what exactly is a Bhaalspawn?~
  ++ ~Ah. I was wondering when we were going to get to that.~ + a19.5
  ++ ~It means a person with the blood of the dead god Bhaal running through their veins.~ + a19.6
  ++ ~(sigh) Can we talk about something else?~ + a19.5
  ++ ~Do we have to do this right now?~ + a19.7
END

IF ~~ a19.4
  SAY ~You can take a minute.~
  IF ~~ + a19.3
END

IF ~~ a19.5
  SAY ~What does it mean, <CHARNAME>?~
  ++ ~Before the Time of Troubles, the god Bhaal foresaw his own death. In order to ensure he would rise again, he spawned a score of mortal progeny. From the Prophecies of Alaundo.~ + a19.8
  ++ ~Bhaalspawn are the children of the dead god of murder, Bhaal.~ + a19.8
  ++ ~Some dead god had sex with a bunch of women and then died.~ + a19.9
END

IF ~~ a19.6
  SAY ~A person with the...~
  IF ~~ + a19.8
END

IF ~~ a19.7
  SAY ~We do.~
  IF ~~ + a19.8
END

IF ~~ a19.8
  SAY ~Well. That is... not what I was expecting.~
  = ~Gods, <CHARNAME>. Are you...~
  ++ ~I am a Bhaalspawn, if that's what you're asking.~ + a19.10
  ++ ~Yes, I am in fact a Chinchilla.~ + a19.11
  ++ ~Do you have to ask?~ + a19.12
  ++ ~No, I'm a wild water caribou. Idiot.~ + a19.13
END

IF ~~ a19.9
  SAY ~You really have a way with words, you know.~
  IF ~~ + a19.8
END

IF ~~ a19.10
  SAY ~Okay.~
  IF ~~ + a19.14
END

IF ~~ a19.11
  SAY ~Yes, because you look fluffy and soft and cuddly and--~
  IF ~~ + a19.10
END

IF ~~ a19.12
  SAY ~I really do.~
  IF ~~ + a19.10
END

IF ~~ a19.13
  SAY ~I think I'd prefer that to--~
  IF ~~ + a19.10
END

IF ~~ a19.14
  SAY ~I need to--~
  = ~I just need to have a think. I have to go.~
  IF ~~ EXIT
END


// Cycle: The Bhaalspawn Thing, pt. II
IF ~Global("LK#ArathBhaalspawn","GLOBAL",4)~ a20
  SAY ~You were born this way, right?~
  ++ ~What do you mean?~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",5) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a20.1
  ++ ~Born what way?~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",5) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a20.1
  + ~OR(2) CheckStatGT(Player1,12,WIS) CheckStatGT(Player1,12,INT)~ + ~You mean, was I born a Bhaalspawn?~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",5) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a20.2
  ++ ~Leave me alone, Arath.~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",5) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a20.3
END

IF ~~ a20.1
  SAY ~You were born a Bhaalspawn?~
  ++ ~Yes, I was.~ + a20.4
  ++ ~No, I woke up one day and bam, there it was!~ + a20.5
  ++ ~Of course I was, you idiot. It's not a disease.~ + a20.5
END

IF ~~ a20.2
  SAY ~... yeah.~
  ++ ~Yes, I was.~ + a20.4
  ++ ~No, I woke up one day and bam, there it was!~ + a20.4
  ++ ~Of course I was, you idiot. It's not a disease.~ + a20.4
END

IF ~~ a20.3
  SAY ~Alright.~
  IF ~~ + a20.5
END

IF ~~ a20.4
 SAY ~You didn't seek it out, or anything like that?~
 ++ ~No! I didn't!~ + a20.5
 ++ ~No, of course not. Arath, what are you getting at?~ + a20.5
 ++ ~This questioning is getting tedious, Arath.~ + a20.5
 ++ ~I would have if it were possible.~ + a20.6
 + ~OR(2) CheckStatGT(Player1,12,WIS) CheckStatGT(Player1,12,INT)~ + ~This isn't something that I wanted, if that's what you mean.~ + a20.7
END

IF ~~ a20.5
  SAY ~I'm just a bit uncertain about this whole thing. It feels... wrong. It is wrong. It goes against everything natural, everything I stand for.~
  = ~I just don't know how to deal with it, exactly.~
  ++ ~I've found it helps if you just don't think about it too much.~ + a20.8
  ++ ~You get used to the idea.~ + a20.9
  ++ ~I don't *want* to be this way.~ + a20.10
  ++ ~I'm a Bhaalspawn, and that's something you're just going to have to accept.~ + a20.8
  ++ ~You can start by not interrogating me.~ + a20.11
END

IF ~~ a20.6
  SAY ~Well, that doesn't surprise me.~
  IF ~~ + a20.5
END

IF ~~ a20.7
  SAY ~Well, yeah.~
  IF ~~ + a20.5
END

IF ~~ a20.8
  SAY ~Great advice, there. I'll have to remember that.~
  IF ~~ + a20.12
END

IF ~~ a20.9
  SAY ~I don't know if I'd go that far. It's a big sort of idea.~
  IF ~~ + a20.12
END

IF ~~ a20.10
  SAY ~I wouldn't think so. Or at least, I'd hope not.~
  IF ~~ + a20.12
END

IF ~~ a20.11
  SAY ~Don't I have a right to know what kind of companions I'm travelling with?~
  IF ~~ + a20.12
END

IF ~~ a20.12
  SAY ~I'm just not sure what to think about this. And I'm not sure I want anything to do with it, but I owe you.~
  = ~Enough about that though... I've got another question, it's a little more important. When are we next going to eat? I may have to resort to eating the fallen soon, and nobody wants to see that.~
  IF ~~ EXIT
END


// Cycle: The Bhaalspawn Thing, pt. III
IF ~Global("LK#ArathBhaalspawn","GLOBAL",6)~ a21
  SAY ~So.~
  ++ ~So?~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",7) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a21.1
  ++ ~Yes?~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",7) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a21.1
  ++ ~What is it?~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",7) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a21.1
  ++ ~(Ignore him.)~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",7) RealSetGlobalTimer("LK#ArathBhaalspawnTimer","GLOBAL",3600)~ + a21.1
END

IF ~~ a21.1
  SAY ~I'm not particularly in love with the idea that you've got the blood of a dead god in your veins, or that you might, you know, turn on us at any time.~
  = ~But then again, if you stole my comb I might do the same, so I suppose I can live with it for now.~
  ++ ~If I stole your comb, Arath, I doubt the entire Athkatlan Guard could prevent the slaughter.~ + a21.2
  ++ ~I would never steal your comb, Arath. What kind of heinous creature do you think I am?~ + a21.3
  ++ ~I appreciate that, Arath.~ + a21.5
  ++ ~I'm ever so glad you approve.~ + a21.5
  ++ ~What gave you the impression that I care?~ + a21.4
END

IF ~~ a21.2
  SAY ~Too true, too true.~
  IF ~~ + a21.5
END

IF ~~ a21.3
  SAY ~And here I was fairly sure we'd covered that ground?~
  IF ~~ + a21.5
END

IF ~~ a21.4
  SAY ~I'm just reassuring you I won't poison you or kill you while you sleep, <CHARNAME>. I'm sure a <PRO_MANWOMAN> like yourself can appreciate that.~
  IF ~~ + a21.5
END

IF ~~ a21.5
  SAY ~Just so we're clear, I'm not comfortable with this. But I'm not going to waste time worrying about it, either.~
  ++ ~I don't expect you to be comfortable with it. I know I'm not.~ + a21.6          
  ++ ~Well, thank you for your honesty.~ + a21.7
  ++ ~All I expect you to do is follow my orders. Is that clear?~ + a21.8
  ++ ~I don't care if you're comfortable about it or not.~ + a21.9
  ++ ~You can waste all the time you like, but you're no longer wasting mine.~ + a21.10
END

IF ~~ a21.6
  SAY ~That's... good to hear.~
  IF ~~ + a21.11
END

IF ~~ a21.7
  SAY ~Always! Well, mostly, anyway.~
  IF ~~ + a21.11
END

IF ~~ a21.8
  SAY ~Understood.~
  IF ~~ + a21.11
END

IF ~~ a21.9
  SAY ~Well, I don't particularly care if you care that I'm comfortable about it. I do, and really, I'm all that matters to me, so.~
  IF ~~ + a21.11
END

IF ~~ a21.10
  SAY ~Don't worry, I'm done with this for now.~
  IF ~~ + a21.11
END

IF ~~ a21.11
  SAY ~Oh gods, I think I'm getting a cramp. Alright. Let's go. Ow.~
  IF ~~ EXIT
END


// Cycle: The Bhaalspawn Thing, pt. IV
IF ~Global("LK#ArathBhaalspawn","GLOBAL",8)~ a22
  SAY ~How are you feeling?~
  ++ ~Fine? Why do you ask?~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",9)~ + a22.1
  ++ ~That's so sweet!~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",9)~ + a22.12
  ++ ~I could kill for some food...~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",9)~ + a22.2
  ++ ~I'm alright, I suppose.~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",9)~ + a22.3
  ++ ~Pretty terrible, all things considered.~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",9)~ + a22.4
  ++ ~That's none of your concern.~ DO ~SetGlobal("LK#ArathBhaalspawn","GLOBAL",9)~ + a22.5
END

IF ~~ a22.1
  SAY ~No reason.~
  IF ~~ + a22.6
END

IF ~~ a22.2
  SAY ~I think I hate you a little bit. Just a bit.~
  = ~I'm serious, though.~
  IF ~~ + a22.6
END

IF ~~ a22.3
  SAY ~Just alright?~
  IF ~~ + a22.6
END

IF ~~ a22.4
  SAY ~Well, yeah, but...~
  IF ~~ + a22.6
END

IF ~~ a22.5
  SAY ~Well, it is my concern, since I have to travel with you. So if you don't mind...~
  IF ~~ + a22.6
END

IF ~~ a22.6
  SAY ~No murderous inclinations? No sudden reversals in temperament? No growing temptation to raze small villages to the ground?~
  ++ ~I'm fine, just a little tired. Really.~ + a22.7
  ++ ~No, no, yes. I think I can feel a dragon form coming on, actually...~ + a22.8
  ++ ~Well I wasn't feeling murderous before you decided to bother me, no.~ + a22.9
  ++ ~Yes, to all of those things. But I'm not about to act on them.~ + a22.10
  ++ ~A little, I have to admit. It's getting more and more difficult to stay in control.~ + a22.10
  ++ ~Well, none of those are unusual for me.~ + a22.11
END

IF ~~ a22.7
  SAY ~You will let me know before you go on a murderous rampage, right? You know. Just for old times' sake.~
  IF ~~ + a22.13
END

IF ~~ a22.8
  SAY ~Very funny.~
  = ~Gods, I can't tell if you're joking or not. If there is a dragon form by all means feel free to go right over there where I won't be crushed during your transformation, if not, then you can go right over there just in case.~
  IF ~~ + a22.13
END

IF ~~ a22.9
  SAY ~Very funny.~
  = ~Gods, I can't tell if you're joking or not. If you are going to murder me by all means feel free to give me a bit of warning so I can run away, if not, I might run away just in case.~
  IF ~~ + a22.13
END

IF ~~ a22.10
  SAY ~Well. Uh. Nice that you feel you can be so honest, but that doesn't exactly ease my fears.~
  IF ~~ + a22.13
END

IF ~~ a22.11
  SAY ~That's... very true. Well. I'll just go stand over there in case you decide to go on a little Bhaal rampage, okay? Call me back when you're done.~
  IF ~~ + a22.13
END

IF ~~ a22.12
  SAY ~Uh. Not really.~
  IF ~~ + a22.6
END

IF ~~ a22.13
  SAY ~Just... let me know if there's anything I can do to help. That was all.~
  IF ~~ EXIT
END


// ***********************
//                       *
//   Romance dialogues   *
//                       *
// ***********************

// LT1: Spellcaster
IF ~Global("LK#ArathLovetalks","GLOBAL",2) OR(11) Class(Player1,DRUID_ALL) Class(Player1,CLERIC) Class(Player1,MAGE_ALL) Class(Player1,SORCERER) Class(Player1,FIGHTER_MAGE) Class(Player1,FIGHTER_CLERIC) Class(Player1,FIGHTER_MAGE_THIEF) Class(Player1,MAGE_THIEF) Class(Player1,CLERIC_MAGE) Class(Player1,CLERIC_THIEF) Class(Player1,CLERIC_RANGER)~ f1
  SAY ~<CHARNAME>, how do you do that thing with your wrist when you cast? I've been trying to figure it out for hours.~
  ++ ~It's easy, you just bend and flick, like this.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.1
  ++ ~So *that's* what you've been doing! I was starting to wonder...~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.2
  ++ ~If you can't figure it out yourself, it's probably best you don't learn it at all.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.3
END

IF ~~ f1.1
  SAY ~Oh! Like this?~
  = ~That makes *much* more sense. Heh.~
  IF ~~ + f1.4
END

IF ~~ f1.2
  SAY ~... in retrospect, I imagine that would have looked a little suspect.~
  IF ~~ + f1.4
END

IF ~~ f1.3
  SAY ~Ouch! I'm hurt, <CHARNAME>. Hurt.~
  IF ~~ EXIT
END

IF ~~ f1.4
  SAY ~You've really got a flair for magic, you know.~
  ++ ~Thanks. You're not so bad yourself.~ + f1.5
  ++ ~That's sweet, but I really don't.~ + f1.6
  ++ ~What's your angle here, Arath?~ + f1.7
END

IF ~~ f1.5
  SAY ~Hardly.~
  IF ~~ + f1.8
END

IF ~~ f1.6
  SAY ~No, really! You do. Watching you cast is like watching artist at work.~
  IF ~~ + f1.8
END

IF ~~ f1.7
  SAY ~Angle? No angle, just genuine appreciation! Is that so hard to believe?~
  = ~Ah well. It was worth a shot.~
  IF ~~ EXIT
END
  
IF ~~ f1.8
  SAY ~Every time I have to cast something I worry I'll accidentally call lightning down and obliterate us all.~
  = ~That... probably doesn't fill you with confidence, does it? Uh. Forget I said anything.~
  IF ~~ EXIT
END


// LT1: Fighter
IF ~Global("LK#ArathLovetalks","GLOBAL",2) OR(6) Class(Player1,PALADIN_ALL) Class(Player1,FIGHTER_ALL) Kit(Player1,BARBARIAN) Class(Player1,MONK) Class(Player1,RANGER) Class(Player1,FIGHTER_DRUID) Class(Player1,FIGHTER_MAGE_CLERIC)~ f1.9
  SAY ~Hey, <CHARNAME>, I just wanted to let you know, you're damn good in battle. I'd hate to be on the other side of the field, let me just say that.~
  ++ ~Thanks, Arath. You're not so bad yourself.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.10
  ++ ~Practice does make perfect. And I've had a *lot* of practice.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.11
  ++ ~My skills are nothing to brag about.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.10
  ++ ~What do you want, Arath?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.12
END

IF ~~ f1.10
  SAY ~I don't know about that. Every time I have to cast something I worry I'll accidentally call lightning down and obliterate us all.~
  = ~That... probably doesn't fill you with confidence, does it?~
  IF ~~ + f1.13
END

IF ~~ f1.11
  SAY ~This is true. Much more than your average adventurer, I'd wager.~
  IF ~~ + f1.13
END

IF ~~ f1.12
  SAY ~A man isn't allowed to give a free compliment? What a world it is we live in!~
  IF ~~ EXIT
END

IF ~~ f1.13
  SAY ~Anyway, you're quite the sight. In battle, I mean. Well, out of it too, but that's for another conversation. (wink)~
  ++ ~Why, thank you, Arath! It's been at least three hours since you last complimented me.~ + f1.14
  ++ ~I don't know if I have your charm, though.~ + f1.15
  ++ ~How about we make this conversation about that?~ + f1.16
  ++ ~I'm not remotely interested in your flattery, druid.~ + f1.17
END

IF ~~ f1.14
  SAY ~Three hours is a long time! I'll have to make sure it doesn't stretch that long next time. (grin)~
  IF ~~ EXIT
END

IF ~~ f1.15
  SAY ~That's true. But hey, charm isn't everything! (grin)~
  IF ~~ EXIT
END

IF ~~ f1.16
  SAY ~Well, we *could*, but that would take all the fun out of the next conversation!~
  IF ~~ EXIT
END

IF ~~ f1.17
  SAY ~Pshh, fine. Be that way.~
  IF ~~ EXIT
END


// LT1: Thieves
IF ~Global("LK#ArathLovetalks","GLOBAL",2) Class(Player1,THIEF_ALL)~ f1.18
  SAY ~I have to admire the way you can just blend into the crowd, <CHARNAME>. I've never seen anything quite like it. One minute you're there and I'm talking to you, the next, I'm talking to myself.~
  ++ ~Thank you. It's not that difficult a trick, really.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.19
  ++ ~I appreciate that, Arath. In my line of work, it's generally when my skills go unnoticed that I'm successful.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.20
  ++ ~Hah! I doubt that's due to any skill of mine, and rather more your terrible sense of direction.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.21
  ++ ~It's more that your voice gets very tiresome very quickly.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.22
END

IF ~~ f1.19
  SAY ~I don't know about that. I may as well go walking around with a giant target painted on my back. It might not be difficult for you, but for most of us, it's impressive.~
  IF ~~ + f1.23
END

IF ~~ f1.20
  SAY ~Huh. I hadn't really thought about it that way before. Well, it's very impressive, and more people should compliment you.~
  IF ~~ + f1.23
END

IF ~~ f1.21
  SAY ~Hey! My sense of direction is far from terrible. It's... alright, a little bit terrible, but it's not polite to *say* so.~
  IF ~~ + f1.23
END

IF ~~ f1.22
  SAY ~Ouch! I'm hurt, <CHARNAME>. Hurt.~
  IF ~~ EXIT
END

IF ~~ f1.23
  SAY ~Anyway. I just wanted to tell you that. We should get going.~
  IF ~~ EXIT
END


// LT1: Bard
IF ~Global("LK#ArathLovetalks","GLOBAL",2) Class(Player1,BARD_ALL)~ f1.24
  SAY ~I used to pretend I played the lute when I was little. I always imagined myself as some famous musician, adored for my talent and charm.~
  = ~Luckily I do have the charm, but when I actually tried to take up the instrument, it was disastrous. No amount of coaching could help. Every tutor my father hired threw their arms up in disgust.~
  = ~I really admire your musical talents. Well, I'm a little jealous, really. It just seems to come so naturally to you.~
  ++ ~Thank you, but nothing ever comes naturally. It took me years of training to get where I am today.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.25
  ++ ~If I'm really so talented, maybe I should try to teach you?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.26
  ++ ~Oh, I'm sure you weren't that bad.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.27
  ++ ~What do you want, Arath?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f1.12
END

IF ~~ f1.25
  SAY ~You may have had training, but something about the way you play is just... I don't know. Mesmerising. You're better than most.~
  IF ~~ + f1.28
END

IF ~~ f1.26
  SAY ~Gods, no. I mean no offence, <CHARNAME>, but the days of me wanting to be a minstrel are far behind me. I've also got no wish to revisit memories of tragic, terrible failure on my part.~
  = ~But thanks for the offer.~
  IF ~~ EXIT
END

IF ~~ f1.27
  SAY ~You really don't want to know. Trust me. If music could make ears bleed, I'm pretty sure my playing would have injured thousands.~
  IF ~~ + f1.28
END

IF ~~ f1.28
  SAY ~Anyway. I just wanted to tell you that I'd like to hear you play more.~
  = ~Come on, we should get going.~
  IF ~~ EXIT
END


// LT2

IF ~Gender(Player1,MALE) Global("LK#ArathLovetalks","GLOBAL",4)~ f2.a
  SAY ~So, you're a glorious hero, from what I understand? Savior of the Sword Coast? Striking terror in the hearts of those who oppose you, and adoration into the hearts of the faithful?~
  ++ ~I'm not sure I'd call myself a hero, exactly.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f2.1
  ++ ~I'm no hero. Rather the opposite, really.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f2.1
  ++ ~Adoration, you say? Obviously I haven't been paying enough attention!~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f2.2
  ++ ~Hardly. I just do what I need to in order to get the job done.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f2.1
  ++ ~We don't have time for meaningless chatter, Arath.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f2.3
END

IF ~Gender(Player1,FEMALE) Global("LK#ArathLovetalks","GLOBAL",4)~ f2.b
  SAY ~So, you're a glorious heroine, from what I understand? Savior of the Sword Coast? Striking terror in the hearts of those who oppose you, and adoration into the hearts of the faithful?~
  ++ ~I'm not sure I'd call myself a hero, exactly.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f2.1
  ++ ~I'm no hero. Rather the opposite, really.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f2.1
  ++ ~Adoration, you say? Obviously I haven't been paying enough attention!~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f2.2
  ++ ~Hardly. I just do what I need to in order to get the job done.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f2.1
  ++ ~We don't have time for meaningless chatter, Arath.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + f2.3
END

IF ~~ f2.1
  SAY ~Oh, I don't know. You did save the Sword Coast from ruin, ousted a man who was bound to become a terrible dictator, and resolved several crises along the way.~
  IF ~~ + f2.7
END

IF ~~ f2.2
  SAY ~Apparently so! I suppose it's not terribly surprising. You did save the Sword Coast from ruin, ousted a man who was bound to become a terrible dictator, and resolved several crises along the way.~
  IF ~~ + f2.7
END

IF ~~ f2.3
  SAY ~Of course, oh glorious leader.~
  IF ~~ EXIT
END

// * no f2.4-f2.6 *

IF ~~ f2.7
  SAY ~Really, I'm surprised there aren't more people falling over themselves to get into your bedroll at night.~
  ++ ~Oh, there are, I'm just very discreet.~ + f2.8
  ++ ~And how do you know there aren't?~ + f2.9
  ++ ~Well, you certainly seem to be.~ + f2.10
  + ~Gender(Player1,MALE)~ + ~I wish I were that lucky.~ + f2.11a
  + ~Gender(Player1,FEMALE)~ + ~I wish I were that lucky.~ + f2.11b
  ++ ~Arath! That's entirely inappropriate.~ + f2.12
END

IF ~~ f2.8
  SAY ~Oh, I see. Discreet. Well, I'll keep that in mind.~
  IF ~~ EXIT
END

IF ~~ f2.9
  SAY ~It's not like I obsessively keep an eye on you while you sleep, or anything.~
  = ~I'm kidding. It was a joke. I don't watch you while you sleep. At least, not all the time. (grin)~
  IF ~~ EXIT
END

IF ~~ f2.10
  SAY ~Is it that obvious? Huh. And here I thought I was being subtle.~
  IF ~~ EXIT
END

IF ~~ f2.11a
  SAY ~I can't imagine why not. A good looking guy such as yourself? You shouldn't have any trouble at all!~
  IF ~~ EXIT
END

IF ~~ f2.11b
  SAY ~I can't imagine why not. A good looking girl such as yourself? You shouldn't have any trouble at all!~
  IF ~~ EXIT
END

IF ~~ f2.12
  SAY ~Of course it is. Nothing would be fun if everything were appropriate.~
  IF ~~ EXIT
END



// LT3: A romantic proposal
IF ~Global("LK#ArathLovetalks","GLOBAL",6)~ l1
  SAY ~<CHARNAME>, do you have a moment?~
  ++ ~Of course. What do you need?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",1800)~ + l1.1
  ++ ~As long as it's a quick moment, sure.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",1800)~ + l1.1
  ++ ~We really don't, but go ahead.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",1800)~ + l1.1
  ++ ~Not right now, Arath.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",1800)~ + l1.2
END

IF ~~ l1.1
  SAY ~If you don't mind me saying so, you're a rather attractive <PRO_MANWOMAN>. I'm a rather attractive man. I think you can see where I'm going with this.~
  ++ ~Well that's... direct.~ + l1.3
  ++ ~You are rather attractive, at that. I'll... consider it.~ + l1.4
  ++ ~I'm already three steps ahead of you.~ + l1.4
  ++ ~I'm not interested in anything like you're suggesting.~ + l1.5
  ++ ~I'm not interested in men, Arath.~ + l1.6
END

IF ~~ l1.2
  SAY ~Oh come now, <CHARNAME>, a few minutes won't hurt you.~
  IF ~~ + l1.1
END

IF ~~ l1.3
  SAY ~Subtlety was never my strong point. (grin)~
  IF ~~ + l1.9
END

IF ~~ l1.4
  SAY ~Good to know. (grin)~
  IF ~~ + l1.9
END

IF ~~ l1.5
  SAY ~Ah. That's a shame.~
  IF ~~ + l1.8
END

IF ~~ l1.6
  SAY ~Really? Huh. I was sure you were... but maybe I misjudged you. You are filled with surprises, <CHARNAME>.~
  IF ~~ + l1.8
END

// no l1.7

IF ~~ l1.8
  SAY ~Sorry to have bothered you, then. Forget I said anything.~
  IF ~~ DO ~SetGlobal("LK#ArathRomance","GLOBAL",3)~ EXIT
END

IF ~~ l1.9
  SAY ~I was thinking... maybe we could grab some dinner together. Just the two of us. And some ale, maybe. Might be nice.~
  ++ ~I'd like that.~ + l1.10
  ++ ~Right now? We're a bit busy...~ + l1.11
  ++ ~Sounds awfully prosaic.~ + l1.12
  ++ ~A romantic dinner? Really? That's the best you can come up with?~ + l1.12
  ++ ~On second thought, I'm really not interested.~ + l1.5
END

IF ~~ l1.10
  SAY ~Good. Let me know if there's anywhere you'd like to eat. I'm sure we could organize something.~
  IF ~~ + l1.13
END

IF ~~ l1.11
  SAY ~Not right now. Sometime soon, though. Just let me know if there's anywhere you'd like to eat. I'm sure we could organize something.~
  IF ~~ + l1.13
END

IF ~~ l1.12
  SAY ~Never underestimate a good romantic dinner, <CHARNAME>. Anyway, the dinner isn't the important part.~
  = ~Let me know if there's anywhere you'd like to eat. I'm sure we could organize something.~
  IF ~~ + l1.13
END

IF ~~ l1.13
  SAY ~Though the venue wouldn't really matter, let's be honest. It's the conversation and what follows that's more interesting. (wink)~
  IF ~~ EXIT
END


// A romantic dinner
IF ~Global("LK#ArathLovetalks","GLOBAL",8)~ l4
  SAY ~Well, this didn't turn out quite like I'd hoped. I have a nice bottle of wine, though, and the food should be adequate. I had the perfect night planned, but... (sigh)~
  = ~Sometimes getting that many rose petals is a little difficult, but I suppose that's a blessing in disguise. I'm not even sure if you like roses.~
  ++ ~I'm sure it will be fine.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600) RealSetGlobalTimer("LK#ArathSexTimer","GLOBAL",10800)~ + l4.1
  ++ ~Just for the record? I love roses.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600) RealSetGlobalTimer("LK#ArathSexTimer","GLOBAL",10800)~ + l4.2
  ++ ~Even if the food is awful, the company makes up for it.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600) RealSetGlobalTimer("LK#ArathSexTimer","GLOBAL",10800)~ + l4.2
  ++ ~We probably could have done a little better.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600) RealSetGlobalTimer("LK#ArathSexTimer","GLOBAL",10800)~ + l4.3
  ++ ~This was a mistake.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600) RealSetGlobalTimer("LK#ArathSexTimer","GLOBAL",10800)~ + l4.4
END

IF ~~ l4.1
  SAY ~I hope so. It will be nice to eat some real food, either way... camp rations can only get a man so far.~
  IF ~~ + l4.5
END

IF ~~ l4.2
  SAY ~(grin) That's sweet. It will be nice to eat some real food, either way... camp rations can only get a man so far.~
  IF ~~ + l4.5
END

IF ~~ l4.3
  SAY ~That's alright. It will be nice to eat some real food, either way... camp rations can only get a man so far.~
  IF ~~ + l4.5
END

IF ~~ l4.4
  SAY ~Hey, a proper dinner will do us both good. It will be nice to eat some real food... camp rations can only get a man so far.~
  IF ~~ + l4.5
END

IF ~~ l4.5
  SAY ~Most of the places I'd like to take you aren't really open to the public, in the Government District. There was this one restaurant that served the most amazing lobster, smothered in this garlic cream sauce...~
  = ~But here we are, so I suppose we should make the most of it. (grin)~
  = ~What are you thinking?~ 
  ++ ~I'm wondering when we're going to get some food. I'm starved.~ + l4.6
  ++ ~Trying to decide what to make of you, to be honest.~ + l4.7
  ++ ~I'm deciding whether I should kiss you a little bit or not.~ + l4.8
  ++ ~Arath... I'm involved with someone else.~ + l4.9
  ++ ~I'm not sure I want to do this.~ + l4.10
  + ~Gender(Player1,FEMALE)~ + ~I'm trying to figure out what *you're* thinking.~ + l4.11a
  + ~Gender(Player1,MALE)~ + ~I'm trying to figure out what *you're* thinking.~ + l4.11b
END

IF ~~ l4.6
  SAY ~Me too, to be honest. I feel like I haven't eaten properly in days.~
  IF ~~ + l4.15
END

IF ~~ l4.7
  SAY ~I am, I hear, an enigma wrapped in a puzzle wrapped in a pretty little bow. I'm nothing complex, <CHARNAME>. Or, well, I am, but I don't have any ulterior motives, if that's what you're worried about.~
  IF ~~ + l4.15
END

IF ~~ l4.8
  SAY ~Well, I wouldn't be averse to that! But maybe later?~
  IF ~~ + l4.15
END

IF ~~ l4.9
  SAY ~That doesn't bother me if it doesn't bother you.~
  ++ ~Well... it does bother me. I'm sorry.~ + l4.12
  ++ ~As long as you're sure.~ + l4.13
  ++ ~This was a mistake.~ + l4.14
END

IF ~~ l4.10
  SAY ~Well, I can't decide that for you.~
  IF ~~ + l4.19
END

IF ~~ l4.11a
  SAY ~Just that you're looking terribly beautiful tonight.~
  IF ~~ + l4.15
END

IF ~~ l4.11b
  SAY ~Just that you're looking terribly handsome tonight.~
  IF ~~ + l4.15
END

IF ~~ l4.12
  SAY ~Alright. Well. I'll see you in the morning.~
  IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ l4.13
  SAY ~It's never bothered me before.~
  IF ~~ + l4.19
END

IF ~~ l4.14
  SAY ~Right. Well.~
  = ~I'll see you in the morning, <CHARNAME>.~
  IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ l4.15
  SAY ~There's a lot going on right now. I would never have imagined I'd be involved in something like this two months ago. I suppose around that time you were probably conquering the Sword Coast?~
  + ~Gender(Player1,MALE)~ + ~Somewhere around then, probably, yes. "Bow before me, Sword Coast!" I said, and lo, the Sword Coast did bow.~ + l4.16a
  + ~Gender(Player1,FEMALE)~ + ~Somewhere around then, probably, yes. "Bow before me, Sword Coast!" I said, and lo, the Sword Coast did bow.~ + l4.16b
  ++ ~If by conquer you mean saved from certain famine and destruction, absolutely.~ + l4.17
  ++ ~Something like that.~ + l4.19
  ++ ~Nobody in their right mind envisions they'll be involved in something like we are.~ + l4.18
END

IF ~~ l4.16a
  SAY ~Heh. That's good. You make an excellent evil victor, <CHARNAME>. I know I'd get on my knees. (grin)~
  IF ~~ + l4.19
END

IF ~~ l4.16b
  SAY ~Heh. That's good. You make an excellent evil mistress, <CHARNAME>. I'm trembling in my stylish yet affordable boots. (grin)~
  IF ~~ + l4.19
END

IF ~~ l4.17
  SAY ~Well, there was that, but my way is more fun. (grin)~
  IF ~~ + l4.19
END

IF ~~ l4.18
  SAY ~And if they do, well, I guess that's how we distinguish the crazy ones from the sane ones. (grin)~
  IF ~~ + l4.19
END

IF ~~ l4.19
  SAY ~I like you, <CHARNAME>. But I want to make something clear. I'm not interested in anything long-term. In my experience... well, those types of relationships don't tend to work terribly well.~
  IF ~Gender(Player1,MALE)~ + l4.20a
  IF ~Gender(Player1,FEMALE)~ + l4.20b
END

IF ~~ l4.20a
  SAY ~What I am interested in is you, me, maybe a few ales, a private room, and a distinct lack of clothing. Interested?~
  ++ ~You'll have to try a little harder than that, I'm afraid.~ + l4.21
  ++ ~I think I could manage that.~ + l4.22
  ++ ~Follow me and you'll find out...~ + l4.22
  ++ ~I don't know how much sleep we'll get, but... (grin)~ + l4.22
  ++ ~Arath, I've--I've never done this before.~ + l4.23
  ++ ~I'm interested, but I don't know... this feels wrong.~ + l4.24
  ++ ~There is no way in the nine hells that is happening.~ + l4.25
END

IF ~~ l4.20b
  SAY ~What I am interested in is you, me, a bottle of wine, some candles, and a private room. Interested?~
  ++ ~You'll have to try a little harder than that, I'm afraid.~ + l4.21
  ++ ~I think I could manage that...~ + l4.22
  ++ ~Follow me and you'll find out...~ + l4.22
  ++ ~I don't know how much sleep we'll get, but... (grin)~ + l4.22
  ++ ~Arath, I've--I've never done this before.~ + l4.23
  ++ ~I'm interested, but I don't know... this feels wrong.~ + l4.24
  ++ ~There is no way in the nine hells that is happening.~ + l4.25
END

IF ~~ l4.21
  SAY ~I can be as hard as--heh, no, even I can't say that with a straight face.~
  IF ~~ + l4.24
END

IF ~~ l4.22
  SAY ~Maybe we can skip the food and get to the interesting part, hmm? (smirk)~
  IF ~~ DO ~SetGlobal("LK#ArathSex","GLOBAL",1) RestParty()~ EXIT
END

IF ~~ l4.23
  SAY ~Then you're in for an educational night, I'd say. Don't worry, <CHARNAME>. I know what I'm doing. You're going to enjoy it, I promise.~
  ++ ~Alright.  Just be--careful.~ + l4.27
  ++ ~Then what we we waiting for?~ + l4.22
  ++ ~I don't want to do it this way. I don't know you well enough.~ DO ~SetGlobal("LK#ArathPCVirgin","GLOBAL",1)~ + l4.28
  ++ ~No. I don't want to do this.~ DO ~SetGlobal("LK#ArathPCVirgin","GLOBAL",1)~ + l4.25
END

IF ~~ l4.24
  SAY ~I'm not interested in some lengthy chase. I want you. Tonight. I'm not sure how much more specific I can get than that.~
  ++ ~Alright. I'm in, as long as you pay for the room. (grin)~ + l4.22
  ++ ~Then what are we waiting for?~ + l4.22
  + ~Gender(Player1,MALE)~ + ~If we're going to do this, it will be on my terms. Not yours.~ DO ~SetGlobal("LK#ArathPCsTerms","GLOBAL",1)~ + l4.26a
  + ~Gender(Player1,FEMALE)~ + ~If we're going to do this, it will be on my terms. Not yours.~ DO ~SetGlobal("LK#ArathPCsTerms","GLOBAL",1)~ + l4.26b
  ++ ~I'm not some impressionable young <PRO_GIRLBOY> looking for a quick fix, Arath.~ + l4.25
  ++ ~I don't want to do this.~ + l4.12
END

IF ~~ l4.25
  SAY ~(sigh) Well, it was worth a shot. You should get some food. I'll see you in the morning.~
  IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ l4.26a
  SAY ~Hey, I'm fine with that. So, handsome, what do you want to do?~
  ++ ~Then why don't we get some food, and see where the night takes us?~ + l4.29
  ++ ~How about we skip the food, then, and get to the fun part?~ + l4.29
  ++ ~Have some food, and go to sleep. I'm exhausted.~ + l4.30
  ++ ~Anything that doesn't involve talking, preferably.~ + l4.31
END

IF ~~ l4.26b
  SAY ~Hey, I'm fine with that. So, beautiful, what do you want to do?~
  ++ ~Then why don't we get some food, and see where the night takes us?~ + l4.29
  ++ ~How about we skip the food, then, and get to the fun part?~ + l4.29
  ++ ~Have some food, and go to sleep. I'm exhausted.~ + l4.30
  ++ ~Anything that doesn't involve talking, preferably.~ + l4.31
END

IF ~~ l4.27
  SAY ~Always.~
  IF ~~ + l4.22
END

IF ~~ l4.28
  SAY ~Ah. Well... fair enough. I suppose I'll have to get to know you a little better, then. (wink)~
  IF ~~ + l4.32
END

IF ~~ l4.29
  SAY ~That sounds like a plan to me. Lead the way.~
  IF ~~ DO ~SetGlobal("LK#ArathSex","GLOBAL",1) RestParty()~ EXIT
END

IF ~~ l4.30
  SAY ~What? But I... but you...~
  = ~On your terms. Right.~
  IF ~~ + l4.32
END

IF ~~ l4.31
  SAY ~I'm sure we can arrange that. Lead the way.~
  IF ~~ DO ~SetGlobal("LK#ArathSex","GLOBAL",1) RestParty()~ EXIT
END

IF ~~ l4.32
  SAY ~Let's get some food and head to sleep. We've got a long day ahead of us tomorrow, I'm sure.~
  IF ~~ DO ~RestParty()~ EXIT
END


// LT5: The wonders of Athkatla
IF ~Global("LK#ArathLovetalks","GLOBAL",10)~ l5
  SAY ~So what do you think of Athkatla so far?~
  ++ ~It's a city, just like any other. There's nothing particularly memorable about it.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l5.1
  ++ ~Parts of it are beautiful. Other parts... well, nobody said anything about consistency, I suppose.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l5.2
  ++ ~I love it here. There's so much going on, so much intrigue, so many people.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l5.3
  ++ ~It's disgusting. The streets are filled with urchins and cutthroats, there's no culture, no class.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l5.4
END

IF ~~ l5.1
  SAY ~I suppose I don't have much to compare it to. I'll take your word for it.~
  IF ~~ + l5.5
END

IF ~~ l5.2
  SAY ~Heh. You're right, Athkatla is everything but consistent. Fun, though.~
  IF ~~ + l5.5
END

IF ~~ l5.3
  SAY ~The amount of people gets tiring after a while, trust me. Why do you think I left and become a druid? (grin)~
  IF ~~ + l5.5
END

IF ~~ l5.4
  SAY ~Oh, I don't know if I'd say there's *no* class. I mean, I came from here, after all, and I am *all* class. (grin)~
  IF ~~ + l5.5
END

IF ~~ l5.5
  SAY ~You know, I never really thought Athkatla would be central to anything. It's metropolitan, sure, but nothing ever really happens in Amn.~
  = ~Actually, I take that back. A lot happens, but nothing really changes. Then the vampires came along, and, well... you know what's happened since then. And now you're here. It just seems so unlikely.~
  ++ ~You think that's unlikely; imagine what it's like to wake up one day and discover that you're the child of a dead god.~ + l5.6
  ++ ~Life is full of these happy little surprises, I've found.~ + l5.7
  ++ ~Irenicus has changed a lot of things. Trust me when I say that Athkatla is the least of them.~ + l5.8
  ++ ~Well, I'm sorry to have uprooted your delicate little life.~ + l5.9
  ++ ~What's your point, exactly?~ + l5.10
END

IF ~~ l5.6
  SAY ~Try as I might, that one eludes me. Maybe if I were the child of the dead god of puppies and kittens. But Bhaal? You certainly got the short end of the stick, my friend.~
  IF ~~ + l5.11
END

IF ~~ l5.7
  SAY ~Happy little surprises my ass. Life upends you at every turn, and seems determined to make sure you've got no sure direction at any given point in time.~
  IF ~~ + l5.11
END

IF ~~ l5.8
  SAY ~I suppose you're right. He certainly has a way of reaching out and touching people, doesn't he?~
  IF ~~ + l5.11
END

IF ~~ l5.9
  SAY ~Hey, I'm not complaining. I'm not sure what I would have done if you hadn't come along, but I'm glad you did.~
  IF ~~ + l5.11
END

IF ~~ l5.10
  SAY ~Point?~
  = ~I don't really have a point. Just talking, I suppose.~
  IF ~~ + l5.11
END

IF ~~ l5.11
  SAY ~I'm not sure if I've told you, but grew up in the Government District. My father was a lord, we owned a small estate there. I never really liked it much.~
  = ~I guess it's not so bad here, really. I mean, apart from the rubbish, and the corruption, and... well, okay, maybe it's not great, but it's home. Or at least, it was.~
  ++ ~What happened? What made you leave?~ + l5.12
  ++ ~Home is where the heart is, so your real home's in your chest, I suppose.~ + l5.13
  ++ ~If your father was a lord, what does that make you?~ + l5.14
  ++ ~Home is where you want it to be.~ + l5.15
END

IF ~~ l5.12
  SAY ~Finding out my father was a slaver, for one. There were other reasons too, but that was the main one.~
  IF ~~ + l5.16
END

IF ~~ l5.13
  SAY ~Heh. I'm not sure how I feel about that. I'd like to think of the grove as home, if I had to choose somewhere. ~
  IF ~~ + l5.16
END

IF ~~ l5.14
  SAY ~I'm not sure, to be honest. And I'm not really interested in finding out. I turned my back on that part of my life a long time ago.~
  IF ~~ + l5.16
END

IF ~~ l5.15
  SAY ~That's how I like to think about it. If I had to choose somewhere, it would probably be the grove, but...~
  IF ~~ + l5.16
END

IF ~~ l5.16
  SAY ~Look, I'm not really one to talk about the past. Maybe another time? I'm sure we've got better things to do. Come on.~
  IF ~~ EXIT
END


// LT6: Bizarre dreams
IF ~Global("LK#ArathLovetalks","GLOBAL",12)~ l6
  SAY ~I had the worst dream last night. I don't remember all of it, but I do know it involved cucumber, a harpy and possibly a giant pair of pantaloons.~
  ++ ~That certainly sounds... bizarre, to say the least.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l6.3
  ++ ~You lead a very active dream life, I see.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l6.3
  ++ ~That doesn't sound terribly bad to me.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l6.1
  ++ ~Hey, if that's all you have to deal, lucky you.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l6.1
  ++ ~We don't have time for this, Arath.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l6.2
END

IF ~~ l6.1
  SAY ~Well, it was a lot more frightening in my dream. Out loud it just sounds strange.~
  IF ~~ + l6.3
END

IF ~~ l6.2
  SAY ~You might be right. Another time, perhaps.~
  IF ~~ EXIT
END

IF ~~ l6.3
  SAY ~I don't generally remember my dreams, but I guess it's not everyday you dream about giant killer cucumbers.~
  = ~Look, I don't--I didn't really want to say anything, I know it's probably intensely private or personal or whatever, but...~
  = ~What kind of dreams do you, uh, deal with? Because some of them sound distinctly... I can't decide whether I should say "scary" or "terrifying." Terrifying seems more apt.~
  ++ ~Since I escaped Irenicus' dungeon, I've been having nightmares. They're not pleasant.~ + l6.4
  ++ ~I'm really sorry about that. I probably keep you all awake at night.~ + l6.5
  ++ ~Terrifying isn't the word I'd use. They're... interesting. They show me things about myself I didn't know.~ + l6.6
  ++ ~I don't want to talk about it.~ + l6.7
END

IF ~~ l6.4
  SAY ~Well, it was either that or... (wink)~
  IF ~~ + l6.8
END

IF ~~ l6.5
  SAY ~No, no--not *all* night! Just... the majority of it. (grin)~
  IF ~~ + l6.8
END

IF ~~ l6.6
  SAY ~Really? They don't really seem that way when you're asleep. But hey, it's your head. I'll take your word for it.~
  IF ~~ + l6.8
END

IF ~~ l6.7
  SAY ~That bad, huh? Alright. I'm not going to bug you about it.~
  IF ~~ EXIT
END

IF ~~ l6.8
  SAY ~Where do they come from, do you think? I mean, I've never seen anyone with the kind of nightmares you deal with. Even night terrors don't come close.~
  ++ ~I really don't know, but you're right. They're nothing like night terrors.~ + l6.9
  ++ ~I don't know if they really come from anywhere. I have to deal with a lot of awful things.~ + l6.10
  ++ ~Irenicus features in many of them, so I would imagine it has something to do with him.~ + l6.11
  ++ ~They're all to do with the Bhaal essence, so... something related to that, I would guess.~ + l6.12
  ++ ~The sleeping mind has far greater knowledge than the waking mind. They just come from a different part of me.~ + l6.13
END

IF ~~ l6.9
  SAY ~Yeah. I don't know either.~
  IF ~~ + l6.14
END

IF ~~ l6.10
  SAY ~That might be true, but... I don't know.~
  IF ~~ + l6.14
END

IF ~~ l6.11
  SAY ~That would make sense. He doesn't seem like the most decent person around, and definitely the sort to play with the minds of his opponents.~
  IF ~~ + l6.14
END

IF ~~ l6.12
  SAY ~I can't say I hadn't thought about that. It would make sense.~
  IF ~~ + l6.14
END

IF ~~ l6.13
  SAY ~That's a scary thought. Maybe some deep part of my mind is actually a mass-murdering goblin intent on world domination, and only makes itself known as I sleep.~
  IF ~~ + l6.14
END

IF ~~ l6.14
  SAY ~It definitely doesn't seem normal, that's all. I'm pretty sure most people don't get tortured in their sleep.~
  = ~Then again, you've never really been normal, so maybe that's just your body's way of recuperating during the night. (grin)~
  ++ ~A little torture is always a refreshing way to start the day!~ + l6.15
  ++ ~What an awful thought. I really hope not.~ + l6.16
  ++ ~I don't appreciate you making jokes about this, Arath.~ + l6.17
  ++ ~Somehow I doubt that.~ + l6.18
END

IF ~~ l6.15
  SAY ~You're a very strange <PRO_MANWOMAN>, <CHARNAME>. But somehow, I don't mind.~
  IF ~~ EXIT
END

IF ~~ l6.16
  SAY ~You never know!~
  IF ~~ EXIT
END

IF ~~ l6.17
  SAY ~That's a shame, isn't it?~
  IF ~~ EXIT
END

IF ~~ l6.18
  SAY ~Yeah, me too. But hey, it's funnier than the other options.~
  IF ~~ EXIT
END


// LT7: More compliments!
IF ~Global("LK#ArathLovetalks","GLOBAL",14) Gender(Player1,FEMALE)~ l7a
  SAY ~You know, you really do have a rather shapely figure, <CHARNAME>. And trust me when I say, I have some experience in this area.~
  ++ ~You're not so lacking in the attractiveness department yourself, you know.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l7.5
  ++ ~I really don't. But it's nice of you to say so.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l7.1a
  ++ ~A lot of women, hey? How many, exactly?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l7.2
  ++ ~Which is your favourite part, exactly?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l7.3a
  ++ ~I'm not interested in compliments, Arath.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l7.6
  ++ ~You're about as subtle as an axe to the head.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l7.4
  + ~Global("LK#ArathSex","GLOBAL",1)~ + ~Well, you have seen it more... intimately than most. (wink)~ + l7.x
END

IF ~Global("LK#ArathLovetalks","GLOBAL",14) Gender(Player1,MALE)~ l7b
  SAY ~You know, you really do cut a rather dashing figure, <CHARNAME>. And trust me when I say, I have some experience in this area~
  ++ ~You're not so lacking in the attractiveness department yourself, you know.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l7.5
  ++ ~I really don't. But it's nice of you to say so.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l7.1b
  ++ ~A lot of men, hey? How many, exactly?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l7.2
  ++ ~Which is your favourite part, exactly?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l7.3b
  ++ ~I'm not interested in compliments, Arath.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l7.6
  ++ ~You're about as subtle as an axe to the head.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l7.4
END

IF ~~ l7.x
  SAY ~This is true, and I wouldn't mind seeing it again sometime soon. (wink)~
  IF ~~ + l7.6
END

IF ~~ l7.1a
  SAY ~Don't be so harsh on yourself. You're a beautiful woman, <CHARNAME>. Which makes me wonder if you're just angling for more compliments.~
  = ~Trust me when I say you don't need to angle.~
  IF ~~ + l7.6
END

IF ~~ l7.1b
  SAY ~Don't be so harsh on yourself. You're an incredibly handsome man, <CHARNAME>. Which makes me wonder if you're just angling for more compliments.~
  = ~Trust me when I say you don't need to angle.~
  IF ~~ + l7.6
END

IF ~~ l7.2
  SAY ~Less than every one of them and more than none of them. Let's just leave it at that, shall we?~
  IF ~~ + l7.6
END

IF ~~ l7.3a
  SAY ~Hmm... your legs, definitely. There's nothing quite like a good pair of legs, and yours certainly are.~
  IF ~~ + l7.6
END

IF ~~ l7.3b
  SAY ~Hmm... your arms, definitely. There's something about forearms that just does it for me.~
  IF ~~ + l7.6
END

IF ~~ l7.4
  SAY ~Who needs subtlety when you have hair like this? Let's be honest here, <CHARNAME>. (grin)~
  IF ~~ + l7.6
END

IF ~~ l7.5
  SAY ~I have seen myself in a mirror every now and then, you know. I'm glad you approve. (grin)~
  IF ~~ + l7.6
END

IF ~~ l7.6
  SAY ~I'm a little curious. How many people have you been with? Just to compare notes, of course.~
  ++ ~Arath! I can't believe you'd ask me that!~ + l7.7
  + ~!Global("LK#ArathSex","GLOBAL",1) Global("LK#ArathPCVirgin","GLOBAL",1)~ + ~That's no business of yours.~ + l7.8a
  + ~!Global("LK#ArathSex","GLOBAL",1) !Global("LK#ArathPCVirgin","GLOBAL",1)~ + ~That's no business of yours.~ + l7.8b
  + ~Global("LK#ArathSex","GLOBAL",1)~ + ~That's no business of yours.~ + l7.8c
  ++ ~More than a few. Less than a lot.~ + l7.9
  + ~Global("LK#ArathSex","GLOBAL",1)~ + ~Apart from you? A few. Not many.~ + l7.10
  + ~!Global("LK#ArathSex","GLOBAL",1)~ + ~A few people. Not very many.~ + l7.10
  + ~Global("LK#ArathSex","GLOBAL",1)~ + ~Nobody, apart from you.~ + l7.11
  + ~!Global("LK#ArathSex","GLOBAL",1) Gender(Player1,MALE)~ + ~I've never been with anyone.~ + l7.12a
  + ~!Global("LK#ArathSex","GLOBAL",1) Gender(Player1,FEMALE)~ + ~I've never been with anyone.~ + l7.12b
END

IF ~~ l7.7
  SAY ~Why not? You know I don't care about that sort of thing. I've spent enough time in the land of propriety to learn that at the end of the day, it means absolutely nothing.~
  IF ~!Global("LK#ArathSex","GLOBAL",1) Global("LK#ArathPCVirgin","GLOBAL",1)~ + l7.8a
  IF ~!Global("LK#ArathSex","GLOBAL",1) !Global("LK#ArathPCVirgin","GLOBAL",1)~ + l7.8b
  IF ~Global("LK#ArathSex","GLOBAL",1)~ + l7.8c
END

IF ~~ l7.8a
  SAY ~Come to think of it, I seem to remember you saying you were a virgin. Ah, well. And here I was hoping for some exciting stories.~
  = ~Maybe I'll just have to tell a few to you, hmm?~
  ++ ~I would really rather you didn't.~ + l7.14
  ++ ~(grin) Sure. I wouldn't mind that.~ + l7.15
  ++ ~I... uh... that is...~ + l7.16
END

IF ~~ l7.8b
  SAY ~You know, I don't think I've ever met anyone quite like you, <CHARNAME>. And to be honest, I'm not sure if that's an insult or a compliment. Both, maybe.~
  IF ~~ + l7.13
END

IF ~~ l7.8c
  SAY ~Well, I know there's me... but apart from that, I suppose I'll just have to imagine. I'm sure I can manage that.~
  IF ~~ + l7.13
END

IF ~~ l7.9
  SAY ~Hmm... perhaps we could swap some stories sometime? Share a few of our more interesting conquests?~
  ++ ~Sounds like my idea of a good time.~ + l7.15
  ++ ~I never kiss and tell.~ + l7.17
  ++ ~As long as there's some alcohol involved, I'm game!~ + l7.18
  ++ ~With you? Heh. Not a chance.~ + l7.19
END

IF ~~ l7.10
  SAY ~Hmm... perhaps we could swap stories sometime? I could tell you about a few of my experiences, you could share yours...~
  ++ ~Sounds like my idea of a good time.~ + l7.15
  ++ ~I never kiss and tell.~ + l7.17
  ++ ~As long as there's some alcohol involved, I'm game!~ + l7.18
  ++ ~With you? Heh. Not a chance.~ + l7.19
END

IF ~~ l7.11
  SAY ~You know, I don't think I've been someone's first before. Not that I know of, anyway.~
  = ~I can't say the idea is... unpleasant.~
  IF ~~ + l7.13
END

IF ~~ l7.12a
  SAY ~Then you're one of the virtuous few, my friend. I'm not sure how you do it, myself, but I suppose there's a certain... honor in it.~
  IF ~~ + l7.13
END

IF ~~ l7.12b
  SAY ~Then you're one of the virtuous few, my dear <CHARNAME>. I'm not sure how you do it, myself, but I suppose there's a certain... honor in it.~
  IF ~~ + l7.13
END

IF ~~ l7.13
  SAY ~I'm not going to lie and say I'm some blushing maiden, because I'm not. I'm sure you've realized that by now. I've never seen much point to virtue, myself, or fidelity, really, for that matter.~
  = ~Sex is sex. It's a physical thing, not an emotional thing, and I've never felt the need to complicate it.~
  = ~In any case, any more of this and I know my breeches are going to require a little adjustment, so let's head off. I'm sure there are plenty of other things we can talk about.~
  = ~The weather, maybe. (wink)~
  IF ~~ EXIT
END

IF ~~ l7.14
  SAY ~Prude. (grin)~
  IF ~~ EXIT
END

IF ~~ l7.15
  SAY ~I'll have to do some thinking, then, and wrack my brains for some of the more interesting ones. (wink)~
  IF ~~ EXIT
END

IF ~~ l7.16
  SAY ~You're terribly cute when you're tongue-tied. I just thought you should know.~
  IF ~~ EXIT
END

IF ~~ l7.17
  SAY ~Ahh, so you're one of *those*. I should have known. There's no fun in it if you can't recount the tale later, <CHARNAME>!~ 
  = ~Ah, well. At least I can share some of mine.~
  IF ~~ + l7.15
END

IF ~~ l7.18
  SAY ~Heh! I'll have to make sure we have something on hand, and wrack my brains for some of the more interesting liasons I've had. (wink)~
  IF ~~ EXIT
END

IF ~~ l7.19
  SAY ~I'm hurt. Really, <CHARNAME>, that's totally unnecessary. Ouch.~
  = ~I'll be over here, crying my eyes out into my sleeve. No, don't feel the need to come and comfort me. I'd rather bear my suffering alone.~
  IF ~~ EXIT
END


// LT8: The fantastical hot-tub and the boringness of death
IF ~Global("LK#ArathLovetalks","GLOBAL",16) GlobalLT("chapter","GLOBAL",3)~ l8a
  SAY ~I wish we had a hot-tub. Something like Aran Linvail has, except... somehow magically portable. That would be amazing.~
  IF ~~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l8.1
END

IF ~Global("LK#ArathLovetalks","GLOBAL",16) GlobalGT("chapter","GLOBAL",2)~ l8b
  SAY ~I wish we had a hot-tub. A big, comfortable, soothing hot-tub... that was somehow magically portable. That would be amazing.~
  IF ~~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l8.1
END

IF ~~ l8.1
  SAY ~I feel like it's been months since I've had a proper soak. And gods, I need it. I'm dirty in places I didn't even know existed. And I don't mean that in a sexy way.~
  ++ ~We'll see what we can do at the next inn we stop by, maybe.~ + l8.2
  ++ ~Ohh, yes... with some kind of magical bubble dispenser. Oh! And a fluffy towel dispenser!~ + l8.3
  ++ ~Ahh, but this is the charm of life on the road! Makes you appreciate everything more.~ + l8.4
  ++ ~You are so incredibly shallow, sometimes. Do you have any depth to you whatsoever?~ + l8.5
  ++ ~Aren't you supposed to be against things like that? You are a druid, after all.~ + l8.6
  ++ ~Deal with it. Wash on your own time.~ + l8.7
END

IF ~~ l8.2
  SAY ~It won't be the same. This is one of the things I miss about not living like a noble anymore... ahh, hot water on demand. So many good memories.~
  IF ~~ + l8.8
END

IF ~~ l8.3
  SAY ~Mmm, that sounds perfect. I knew you and I had some excellent things in common.~
  IF ~~ + l8.8
END

IF ~~ l8.4
  SAY ~I don't usually have a dagger in my gut, but that doesn't make me appreciate it more.~
  = ~Uh. That made a lot more sense in my head.~
  IF ~~ + l8.8
END

IF ~~ l8.5
  SAY ~Pshh, I have plenty of depth. I just usually drain it off. (grin)~
  IF ~~ + l8.8
END

IF ~~ l8.6
  SAY ~Hey, just because I'm a proponent of protecting and serving nature doesn't mean I can't enjoy a good bath.~
  IF ~~ + l8.8
END

IF ~~ l8.7
  SAY ~Yes, <PRO_SIRMAAM>. (grimace)~
  IF ~~ EXIT
END

IF ~~ l8.8
  SAY ~It's not just the dirt, though. I don't know. Sometimes I think there really are parts of me, inside, that will never be the same. That I'll never be able to wash clean.~
  = ~I never thought I'd kill people. It just never really crossed my mind as something I'd ever have to do. And then I did.~
  = ~I'm not saying I shouldn't have, but... do you have any idea what I mean? Heh. It must sound kind of ridiculous.~
  ++ ~It doesn't sound ridiculous at all. I felt exactly the same way, up until an assassin tried to kill me back in Candlekeep.~ + l8.9
  ++ ~We do what we must in order to survive. Sometimes that involves things we don't expect.~ + l8.10
  ++ ~Death is a natural part of life. Sometimes you just have to accept that.~ + l8.11
  ++ ~Get over it. It's kill or be killed, and somehow I doubt you'd want the latter.~ + l8.12
END

IF ~~ l8.9
  SAY ~An assassin? Wow... well, that's a compliment, in a way. Somebody thought you were dangerous or important enough to kill. Way to show me up there, <CHARNAME>.~
  = ~I'm glad it's not just me, though. Not that I had assassins sent after me, but... you know what I mean.~
  IF ~~ + l8.13
END

IF ~~ l8.10
  SAY ~And sometimes that involves a little mayhem and bloodshed. Nothing I haven't heard or thought before, trust me.~
  IF ~~ + l8.13
END

IF ~~ l8.11
  SAY ~I know that better than most. I know how it works... us supposedly more 'intelligent' creatures tend to mess up the normal cycle of things, though.~
  IF ~~ + l8.13
END

IF ~~ l8.12
  SAY ~Nothing I haven't thought before. I know how it works. Didn't make it any less unexpected at the time.~
  IF ~~ + l8.13
END

IF ~~ l8.13
  SAY ~I don't usually talk like this. Something about you just makes me open my mouth and spew out whatever's on my mind.~
  = ~Enough of that, though. I think I've done quite enough soul searching for today.~
  IF ~~ EXIT
END


// LT 9
IF ~Global("LK#ArathLovetalks","GLOBAL",18)~ l9
  SAY ~Ugh... okay, maybe aloe... or a mint compress... no, that won't work, I need something a little more astringent...~
  ++ ~What are you up to there?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l9.4
  ++ ~What kind of terrible concoction are you creating today?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l9.4
  ++ ~Anything I can help with?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l9.1
  ++ ~Sounds like fun.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l9.2
  ++ ~(ignore him)~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l9.3
END

IF ~~ l9.1
  SAY ~I'm not really sure yet.~
  IF ~~ + l9.6
END

IF ~~ l9.2
  SAY ~You have no idea.~
  IF ~~ + l9.6
END

IF ~~ l9.3
  SAY ~What on Faerun could have given me a rash like that? Ugh... alright... keep thinking...~
  IF ~~ EXIT
END

IF ~~ l9.4
  SAY ~I, uh. This is a little embarassing. I'm trying to find the best way to counteract a rash. The problem is, I'm just not sure how I contracted it.~
  ++ ~What kind of rash, exactly?~ + l9.5
  + ~Global("LK#ArathSex","GLOBAL",1)~ + ~Oh, god. Should I be worried?~ + l9.6
  ++ ~Are you alright?~ + l9.7
  ++ ~Isn't that fairly elementary?~ + l9.8
  ++ ~Have fun with that.~ + l9.9
  + ~OR(8) Class(Player1,DRUID_ALL) Class(Player1,FIGHTER_DRUID) Class(Player1,RANGER_ALL) Class(Player1,CLERIC_ALL) Class(Player1,FIGHTER_CLERIC) Class(Player1,CLERIC_MAGE) Class(Player1,CLERIC_THIEF) Class(Player1,CLERIC_RANGER)~ + ~Looks like a poison ivy rash to me.~ + l9.11
END

IF ~~ l9.5
  SAY ~It's nothing serious, just annoying and itchy. Very annoying and itchy.~
  IF ~~ + l9.11
END

IF ~~ l9.6
  SAY ~No, no, it's nothing like that. At least, I don't think so.~
  IF ~~ + l9.10
END

IF ~~ l9.7
  SAY ~I'm--I'm fine, just a little itchy and confused. I'm not quite sure how...~
  IF ~~ + l9.10
END

IF ~~ l9.8
  SAY ~Rashes can be contracted from all sorts of things. I'm not quite sure how...~
  IF ~~ + l9.10
END

IF ~~ l9.9
  SAY ~Ugh. Thanks.~
  IF ~~ EXIT
END

IF ~~ l9.10
  SAY ~I was trying to find a certain plant, and I must have brushed past something I shouldn't have. Could be an allergy, maybe, but I thought by now I'd have come into contact with most things...~
  IF ~~ + l9.11
END

IF ~~ l9.11
  SAY ~Oh. Oh, no. Great. You're going to laugh at me.~
  ++ ~I really won't. Don't worry.~ + l9.12
  ++ ~I'll be honest: I probably will.~ + l9.12
  ++ ~When am I not laughing at you?~ + l9.12
END

IF ~~ l9.12
  SAY ~I'm relatively sure this is a poison ivy rash. Ugh. I can't believe I didn't think of that earlier. And I'm supposed to be a druid...~
  = ~I... I think I need some time alone. Gods, this is embarassing. I'll talk to you later.~
  IF ~~ EXIT
END


// LT 10
IF ~Global("LK#ArathLovetalks","GLOBAL",20)~ l10
  SAY ~You grew up in Candlekeep, right? I've heard you mention it before. You were fostered with Imoen -- the girl we're saving?~
  ++ ~Yeah. That's right.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l10.1
  ++ ~Do we have to talk about Imoen?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l10.2
  ++ ~I grew up in Candlekeep, and Imoen and I were raised by a mage by the name of Gorion.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l10.1
  ++ ~I'd rather leave the past where it is, if that's alright.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l10.3
  ++ ~I don't want to talk about it.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l10.4
END

IF ~~ l10.1
  SAY ~I'm a little jealous of you, if I'm totally honest.~
  IF ~~ + l10.5
END

IF ~~ l10.2
  SAY ~Not really, but... well. I'd like to get to know a little about her at some point, considering everything.~
  IF ~~ + l10.5
END

IF ~~ l10.3
  SAY ~Sure. No problem.~
  IF ~~ + l10.5
END

IF ~~ l10.4
  SAY ~I know what you mean. No problem.~
  IF ~~ EXIT
END

IF ~~ l10.5
  SAY ~I always wanted a sibling as a kid. I was an only child, obviously. My father was always fairly busy, and my mother died when I was fairly young, so I was mainly raised by the myself.~
  = ~And the maids, of course. But I always wanted a sibling. Though really, in retrospect, I think I liked the idea of having a sibling more than I would have liked the reality of it.~
  ++ ~Trust me when I say, you are completely correct in that assumption.~ + l10.6
  ++ ~Siblings can be a pain, but... at the end of the day, it's worth it to have someone at your back.~ + l10.6
  ++ ~I wouldn't trade Imoen for the world.~ + l10.6
  ++ ~Trust me, if I had the choice, I'd have been an only child as well.~ + l10.7
END
  
IF ~~ l10.6
  SAY ~Are you and your foster sister very close?~
  ++ ~Very. We're usually inseparable.~ + l10.8
  ++ ~I love her because she's my sister, but we're not really close.~ + l10.9
  ++ ~Not really, no. I put up with her because it's what Gorion would want.~ + l10.10
  ++ ~She's an annoying brat. I'm glad Irenicus took her, because it means I don't have to deal with her.~ + l10.10
END

IF ~~ l10.7
  SAY ~Huh. Fair enough. I take it you and your sister aren't very close?~
  ++ ~I love her because she's my sister, but we're not really close, no.~ + l10.9
  ++ ~Not really, no. I put up with her because it's what Gorion would want.~ + l10.10
  ++ ~She's an annoying brat. I'm glad Irenicus took her, because it means I don't have to deal with her.~ + l10.10
END

IF ~~ l10.8
  SAY ~I'm looking forward to meeting her. She certainly sounds like she'll be... interesting, to say the least.~
  IF ~~ EXIT
END

IF ~~ l10.9
  SAY ~See, I can't understand that. I suppose I probably never will.~
  IF ~~ + l10.11
END

IF ~~ l10.10
  SAY ~That I can understand. Well, I'm glad I didn't have siblings, then. They sound painful.~
  IF ~~ + l10.11
END

IF ~~ l10.11
  SAY ~I'm looking forward to meeting her, though. She certainly sounds like she'll be... interesting, to say the least.~
  IF ~~ EXIT
END


// LT 11
IF ~Global("LK#ArathLovetalks","GLOBAL",22)~ l11
  SAY ~<CHARNAME>, you look terrible. You should really try to get more sleep. Those bags under your eyes won't go away by themselves, you know.~
  ++ ~I'm fine. Really, Arath, there's no need to worry about me.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l11.1
  ++ ~I know. I'm not sure what I can do about it, though. I just can't sleep.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l11.1
  ++ ~Right. Thanks. Because that's exactly what I needed to hear right now.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l11.1
  ++ ~Trust me, Arath, looking good is the last thing on my agenda right now.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l11.1
  ++ ~Let's not do this right now.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l11.1
END

IF ~~ l11.1
  SAY ~You need to rest. There's no chance we could take a few days and recuperate? I don't think you're the only one who needs a break, though you're definitely the one who needs it most.~
  ++ ~We can't afford to lose time. There's so much we have to do, and we're working against a running clock.~ + l11.3
  ++ ~You don't think we'd be doing that if we could?~ + l11.3
  ++ ~No. There is absolutely no chance, so don't even consider it.~ + l11.3
  ++ ~You just want some time off for yourself. It's nothing to do with me.~ + l11.3
  ++ ~Don't tempt me. There's nothing I'd like to do more. But... we can't. You know that.~ + l11.3
  ++ ~Thanks. You're just a little ray of sunshine. Just leave me alone, Arath.~ + l11.2
END

IF ~~ l11.2
  SAY ~That's me, adding a little brightness to each and every day!~
  = ~(sigh) Alright. But... you really should try to get some sleep sometime.~
  IF ~~ EXIT
END

IF ~~ l11.3
  SAY ~I don't think I've ever gone this long without a few days break. I'm not great, but... you've been doing this a lot longer than I have. I don't know how you're even holding together.~
  ++ ~Because I have to. If you were in my position, you would, too.~ + l11.4
  ++ ~I'm not, really. I've just become very good at pretending I am.~ + l11.4
  ++ ~When this is all over, I'll be in pieces somewhere, don't you worry.~ + l11.4
  ++ ~I've never had a problem holding together. It's falling apart I can't do.~ + l11.5
  ++ ~Nothing really gets to me. This is what I'm good at.~ + l11.6
END

IF ~~ l11.4
  SAY ~I don't know about that. You're a very strong <PRO_MANWOMAN>, <CHARNAME>. Stronger than most, I'd wager.~
  IF ~~ + l11.6
END

IF ~~ l11.5
  SAY ~ You're a very strong <PRO_MANWOMAN>, <CHARNAME>. Stronger than most, I'd wager.~
  IF ~~ + l11.6
END

IF ~~ l11.6
  SAY ~It's one of the things that attracts me to you, actually.~
  IF ~~ EXIT
END


// LT12
IF ~Global("LK#ArathLovetalks","GLOBAL",24)~ l12
  SAY ~Nice weather, hey?~
  ++ ~It's... not bad, I guess.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l12.3
  ++ ~Pretty nice, yeah.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l12.3
  ++ ~You want to talk about the weather? Really?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l12.1
  ++ ~What do you want?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l12.2
END

IF ~~ l12.1
  SAY ~What's wrong with the weather? The weather is a perfectly acceptable topic for conversation! If I were the weather, I'd be offended. Just so you know.~
  IF ~~ + l12.4
END

IF ~~ l12.2
  SAY ~Uh, nothing? I just wanted to have a talk. Is that so wrong?~
  IF ~~ + l12.4
END

IF ~~ l12.3
  SAY ~Yeahhh. And, uh... it's not raining, so that's good. Not that I mind rain, just when we're adventuring, you know... it gets... annoying.~
  IF ~~ + l12.4
END

IF ~~ l12.4
  SAY ~I'm, ah. Not very good at this. The whole small-talk thing. I was trained to do it when I was a child, but now it just seems so pointless.~
  ++ ~You don't need to make small talk with me, Arath. (grin)~ + l12.5
  ++ ~You might not be good at it, but you're terribly cute when you try.~ + l12.6
  ++ ~You were trained to do it? Why?~ + l12.7
  ++ ~It *is* pointless.~ + l12.5
END

IF ~~ l12.5
  SAY ~I know. I'm just trying to find a way to say what I actually want to say, but I'm not sure how to say it, so... yeah. Heh.~
  IF ~~ + l12.8
END

IF ~~ l12.6
  SAY ~Heh. Thanks. I'm just trying to find a way to say what I actually want to say, but I'm not sure how to say it, so... yeah.~
  IF ~~ + l12.8
END

IF ~~ l12.7
  SAY ~Uh. I was raised as a noble, <CHARNAME>. Of course I learnt societal niceties.~
  = ~Really, I'm just trying to find a way to say what I actually want to say, but I'm not sure how to say it, so... yeah. Heh.~
  IF ~~ + l12.8
END

IF ~~ l12.8
  SAY ~I like you quite a bit, <CHARNAME>. And to be honest, I'm not really sure how to deal with that. I enjoy talking to you, spending time with you... having sex with you. (grin)~
  = ~Anyway. I just... thought you should know.~
  ++ ~I like you too, Arath. In case you hadn't realized.~ + l12.9
  ++ ~Oh. I didn't realise. Because the sex was definitely not a giveaway.~ + l12.10
  ++ ~Well, thanks. I appreciate that. (grin)~ + l12.11
  ++ ~I'm not exactly sure what you mean.~ + l12.12
  ++ ~I'm not interested in anything beyond what we have, Arath.~ + l12.13
END

IF ~~ l12.9
  SAY ~Well, I had some idea. (wink)~
  IF ~~ + l12.14
END

IF ~~ l12.10
  SAY ~Hey, I've slept with people I didn't like before! It was pretty good most of the time, actually. Fiery, heh.~
  IF ~~ + l12.14
END

IF ~~ l12.11
  SAY ~Any time!~
  IF ~~ + l12.14
END

IF ~~ l12.12
  SAY ~I'm not sure I am either, but I thought you should know.~
  IF ~~ + l12.14
END

IF ~~ l12.13
  SAY ~Neither am I, really, but... I wanted to let you know anyway.~
  IF ~~ + l12.14
END

IF ~~ l12.14
  SAY ~I'm going to pretend that I've got something to be busy with now, because I'm not really sure what else to say, so. Uh. Yeah.~
  IF ~~ EXIT
END


// Post-spellhold romance
IF ~Global("LK#ArathLovetalks","GLOBAL",26)~ l13
  SAY ~You look like you haven't slept in weeks. I know you actually haven't slept in weeks, but you're starting to *look* it.~
  ++ ~I know. (sigh)~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l13.1
  ++ ~If you have any suggestions, I'm all ears.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l13.2
  ++ ~Thanks, Arath. Because that's exactly what I needed to hear right now.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l13.3
  ++ ~Go fly a kite, Arath.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l13.4
END

IF ~~ l13.1
  SAY ~That... sounded a lot better in my head. I didn't mean to--~
  IF ~~ + l13.5
END

IF ~~ l13.2
  SAY ~I wish I did. Look, that sounded a lot better in my head, I didn't mean to--~
  IF ~~ + l13.5
END

IF ~~ l13.3
  SAY ~If it's any consolation, it sounded a lot better in my head. I didn't mean to--~
  IF ~~ + l13.5
END

IF ~~ l13.4
  SAY ~No, wait, I didn't mean to--~
  IF ~~ + l13.5
END

IF ~~ l13.5
  SAY ~I'm just concerned. Are you alright? Do you need some water, or something? Is there anything I can do?~
  ++ ~You could give me a hug, for starters. After that... I don't know. I really don't.~ + l13.6
  ++ ~Got a spare soul lying around? Because that'd sure be useless right about now.~ + l13.6
  ++ ~There's nothing anyone can do.~ + l13.6
  ++ ~You can stop treating me like an invalid.~ + l13.6
END

IF ~~ l13.6
  SAY ~I just feel useless. I'm not... used to feeling useless. I want to *do* something, and it just, I just want to--to make it better, and it's just so frustrating that I can't *do* anything!~
  ++ ~You don't have to convince me. I know exactly what you mean.~ + l13.7
  ++ ~Calm down. You're not helping anyone by shouting.~ + l13.7
  + ~OR(2) CheckStatGT(Player1,12,INT) CheckStatGT(Player1,12,WIS)~ + ~This isn't about me, it's about you, and I'm not interested in hearing it.~ + l13.8
  ++ ~I've got enough to deal with without you getting angry!~ + l13.7
END

IF ~~ l13.7
  SAY ~... okay. Wow, I didn't--I didn't mean to shout at you.~
  IF ~~ + l13.9
END

IF ~~ l13.8
  SAY ~... okay. You're right. I didn't--I didn't mean to shout at you. I know it's not your fault.~
  IF ~~ + l13.9
END

IF ~~ l13.9
  SAY ~It just gets to me that we have to go around as though nothing's wrong, pretending that you're fine, when you barely sleep and you look half-dead.~
  = ~Okay, this... really isn't going well. Let's just get going, before I say something else offensive.~
  IF ~~ EXIT
END


//
IF ~Global("LK#ArathLovetalks","GLOBAL",28)~ l14
  SAY ~How does it feel?~
  ++ ~How does what feel?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l14.4
  ++ ~Soft, porous, a little bit elastic...~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l14.1
  + ~OR(2) CheckStatGT(Player1,12,INT) CheckStatGT(Player1,12,WIS)~ + ~Not having a soul, you mean?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l12.2
  ++ ~We don't have time for nonsense questions, Arath.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l12.3
END

IF ~~ l14.1
  SAY ~... what are you talking about?~
  IF ~~ + l14.4
END

IF ~~ l14.2
  SAY ~Yeah. Does it... hurt? Can you feel that it isn't there?~
  ++ ~It's hard to explain. It's like there's just this... blank space. I can feel it's missing, but it doesn't hurt.~ + l14.8
  ++ ~How do you think you'd feel if your soul had been ripped from your body?~ + l14.5
  ++ ~In all honesty, I'm not sure what the difference is. I don't feel any different.~ + l14.8
  ++ ~I don't remember what having a soul feels like in the first place. I've nothing to compare it against.~ + l14.8
  ++ ~Don't you think asking that's a little bit insensitive?~ + l14.6
  ++ ~I don't want to talk about it.~ + l14.7
END

IF ~~ l14.3
  SAY ~It's not a nonsense question. Really.~
  = ~How does it feel, not having a soul? Does it... hurt? Can you feel that it isn't there?~
  ++ ~It's hard to explain. It's like there's just this... blank space. I can feel it's missing, but it doesn't hurt.~ + l14.8
  ++ ~How do you think you'd feel if your soul had been ripped from your body?~ + l14.5
  ++ ~In all honesty, I'm not sure what the difference is. I don't feel any different.~ + l14.8
  ++ ~I don't remember what having a soul feels like in the first place. I've nothing to compare it against.~ + l14.8
  ++ ~Don't you think asking that's a little bit insensitive?~ + l14.6
  ++ ~I don't want to talk about it.~ + l14.7
END

IF ~~ l14.4
  SAY ~Not having a soul, I mean. Does it... hurt? Can you feel that it isn't there?~
  ++ ~It's hard to explain. It's like there's just this... blank space. I can feel it's missing, but it doesn't hurt.~ + l14.8
  ++ ~How do you think you'd feel if your soul had been ripped from your body?~ + l14.5
  ++ ~In all honesty, I'm not sure what the difference is. I don't feel any different.~ + l14.8
  ++ ~I don't remember what having a soul feels like in the first place. I've nothing to compare it against.~ + l14.8
  ++ ~Don't you think asking that's a little bit insensitive?~ + l14.6
  ++ ~I don't want to talk about it.~ + l14.7
END

IF ~~ l14.5
  SAY ~I don't know. That's why I'm asking. It's not like they give classes on this sort of thing.~
  IF ~~ + l14.8
END

IF ~~ l14.6
  SAY ~Uh. Is it? I was just curious. I mean, it's not like they give classes on this sort of thing.~
  IF ~~ + l14.8
END

IF ~~ l14.7
  SAY ~Oh. Alright. Well, I'm here if you change your mind.~
  IF ~~ EXIT
END

IF ~~ l14.8
  SAY ~What do you think will happen if it never... you know, comes back?~
  ++ ~I don't know. I really don't.~ + l14.12
  ++ ~I'm not sure, but I don't know how long you can survive without a soul.~ + l14.9
  ++ ~I'll probably become a childkiller, or something equally heinous.~ + l14.10
  ++ ~Not something I want to talk about right now.~ + l14.11
END

IF ~~ l14.9
  SAY ~I've never really know anyone without a soul before, but if I knew, I'd tell you.~
  IF ~~ + l14.12
END

IF ~~ l14.10
  SAY ~Heh. "Need to murder all those kids to get to the golden key? No problem!" "Need to topple the best leader this city has had in a hundred years for money? Consider it done!"~
  ++ ~That's in really bad taste, Arath.~ + l14.13
  ++ ~While I admit that is funny, now's really not the time.~ + l14.13
  ++ ~"Need me to drown those puppies in order to find out how long they survive? Absolutely!"~ + l14.14
  ++ ~Shut your mouth. That's *me* you're talking about!~ + l14.13
END

IF ~~ l14.11
  SAY ~Sure. Let's get going, then.~
  IF ~~ EXIT
END

IF ~~ l14.12
  SAY ~Losing your conscience would probably make some things a lot easier, though. "Need to murder all those kids to get to the golden key? No problem!" "Need to topple the best leader this city has had in a hundred years for money? Already did it!"~
  ++ ~That's in really bad taste, Arath.~ + l14.13
  ++ ~While I admit that is funny, now's really not the time.~ + l14.13
  ++ ~"Need me to drown those puppies in order to find out how long they survive? Absolutely!"~ + l14.14
  ++ ~Shut your mouth. That's *me* you're talking about!~ + l14.13
END

IF ~~ l14.13
  SAY ~Yeah. Yeah, it is. Heh.~
  = ~Uh. Sorry.~
  IF ~~ EXIT
END

IF ~~ l14.14
  SAY ~Heh. Let's hope it doesn't come to that. Puppies are adorable!~
  IF ~~ EXIT
END


//
IF ~Global("LK#ArathLovetalks","GLOBAL",30)~ l15
  SAY ~Here. Drink this.~
  ++ ~Alright.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l15.1
  ++ ~Uh. What is it, first?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l15.2
  ++ ~Why should I?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l15.2
  ++ ~Not a chance.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l15.2
END

IF ~~ l15.1
  SAY ~It's a drought intended to make you feel a little better. You're not eating right, you're not drinking enough water, you're...~
  IF ~~ + l15.6
END

IF ~~ l15.2
  SAY ~It's a drought intended to make you feel a little better. You're not eating right, you're not drinking enough water, you're... just drink it, okay?~
  ++ ~Fine, fine! Sheesh. No need to get so touchy.~ + l15.3
  ++ ~Alright. For you.~ + l15.3
  ++ ~If it'll make you stop whining, sure.~ + l15.4
  ++ ~I'm not drinking anything, and that's final.~ + l15.5
END

IF ~~ l15.3
  SAY ~Good. It'll at least help get some nutrients into you, if nothing else.~
  IF ~~ + l15.6
END

IF ~~ l15.4
  SAY ~I'm not whining! I'm just--~
  IF ~~ + l15.6
END

IF ~~ l15.5
  SAY ~(sigh) Fine. I'm just...~
  IF ~~ + l15.6
END

IF ~~ l15.6
  SAY ~I'm just worried about you.~
  ++ ~You? Worried about *me*? Gods, who are you and what have you done with Arath?~ + l15.10
  ++ ~You've got nothing to worry about. I'll be fine.~ + l15.7
  ++ ~So what, you're going to mother me?~ + l15.8
  ++ ~Yeah. Me too.~ + l15.9
END

IF ~~ l15.7
  SAY ~Well, I'm glad you think so, because I'm not so sure.~
  IF ~~ + l15.9
END

IF ~~ l15.8
  SAY ~If I have to.~
  IF ~~ + l15.9
END

IF ~~ l15.9
  SAY ~Gods, I need something to drink.~
  IF ~~ EXIT
END

IF ~~ l15.10
  SAY ~Don't be silly. I do that enough for both of us.~
  IF ~~ EXIT
END


//
IF ~Global("LK#ArathLovetalks","GLOBAL",32)~ l16
  SAY ~Will you stop it?! Just stop it, stop looking at me like that, stop--stop looking so sick! I'm so bloody tired of having to look after you!~
  ++ ~Where's this come from?!~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",7200)~ + l16.1
  ++ ~Arath, what's going on?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",7200)~ + l16.1
  ++ ~What are you talking about? You don't have to look after me at all!~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",7200)~ + l16.1
  ++ ~And I'm so bloody tired of hearing you go on and on!~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",7200)~ + l16.1
END

IF ~~ l16.1
  SAY ~I can't do this anymore. I just... I can't. I can't look at you every day, feeling the way I do about you, and watch you...~
  = ~It's over, <CHARNAME>. I'll stick around and help you, but... I can't do it anymore.~
  ++ ~So that's it? The going gets tough, so you get going?~ + l16.2
  ++ ~Wow. Um. I don't... I don't really know what to say.~ + l16.2
  ++ ~Arath, please. We can work this out.~ + l16.2
  ++ ~I was sick and tired of hearing your voice all the time anyway.~ + l16.3
END

IF ~~ l16.2
  SAY ~I didn't want this! I didn't want some kind of messed up relationship, it was just meant to be--~
  = ~Forget it.~
  IF ~~ + l16.3
END

IF ~~ l16.3
  SAY ~I think it's best if we just... pretend this never happened.~
  = ~Don't just... stop looking at me like that! I said it and I meant it. We're done.~
  IF ~~ EXIT
END


//(2 hour break here)


// at night, about to rest
IF ~Global("LK#ArathLovetalks","GLOBAL",34)~ l17
  SAY ~<CHARNAME>?~
  = ~I'm.. going to kiss you, now.~
  ++ ~(kiss him)~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1)~ + l17.1
  ++ ~Arath... are you drunk?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1)~ + l17.1
  ++ ~What do you think you're doing?!~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1)~ + l17.1
  ++ ~Go away, Arath. I'm not interested.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1)~ + l17.1
END

IF ~~ l17.1
  SAY ~Stay with me. Just for tonight. We don't have to do anything.~
  = ~Please.~
  ++ ~Of course.~ + l17.2
  ++ ~Are you sure this is what you want?~ + l17.3
  ++ ~I'm not going to take advantage of you.~ + l17.4
  ++ ~You said we were through, Arath.~ + l17.5
  ++ ~I can't do this again. I'm sorry.~ + l17.6
  ++ ~Get lost, Arath.~ + l17.6
END

IF ~~ l17.2
  SAY ~I'm sorry for what I said. I miss you.~
  ++ ~I miss you too.~ + l17.7
  ++ ~Let's not talk, okay? We can talk tomorrow.~ + l17.8
  ++ ~This is just for tonight, okay? Nothing more than that.~ + l17.8
  ++ ~Are you really sorry?~ + l17.9
END

IF ~~ l17.3
  SAY ~Yes. I'm sure. Please, I just want... I want to have you next to me.~
  ++ ~You don't need to convince me.~ + l17.2
  ++ ~Alright. But just for tonight.~ + l17.2
  ++ ~I can't. I'm sorry.~ + l17.6
  ++ ~Well, too bad. You made your decision.~ + l17.10
END

IF ~~ l17.4
  SAY ~You won't be. Please, I just want... I want to have you next to me.~
  ++ ~You don't need to convince me.~ + l17.2
  ++ ~Alright. But just for tonight.~ + l17.2
  ++ ~I can't. I'm sorry.~ + l17.6
  ++ ~Well, too bad. You made your decision.~ + l17.10
END

IF ~~ l17.5
  SAY ~Forget what I said, okay? Please, I just want... I want to have you next to me.~
  ++ ~You don't need to convince me.~ + l17.2
  ++ ~Alright. But just for tonight.~ + l17.2
  ++ ~I can't. I'm sorry.~ + l17.6
  ++ ~Well, too bad. You made your decision.~ + l17.10
END

IF ~~ l17.6
  SAY ~Oh.~
  = ~I just thought...~
  = ~Okay. Goodnight, <CHARNAME>. I'm... I'm sorry for what I said, the other day. I miss you.~
  IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ l17.7
  SAY ~(yawn) I'm pretty tired. I drank a bit too much, I think... woah, okay, um, I'm just gonna lie here. Here is good.~
  = ~Goodnight, <CHARNAME>. I really am sorry for what I said.~
  IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ l17.8
  SAY ~Okay.~
  IF ~~ + l17.7
END

IF ~~ l17.9
  SAY ~Yeah. I miss you.~
  IF ~~ + l17.7
END

IF ~~ l17.10
  SAY ~I just thought...~
  = ~Okay. Goodnight, <CHARNAME>. I'm... I really am sorry for what I said, the other day.~
  IF ~~ DO ~RestParty()~ EXIT
END


// morning after
IF ~Global("LK#ArathLovetalks","GLOBAL",36)~ l18
  SAY ~I'm not... I don't know if I want a forever after. But I want you. I'm not sure I want to *be* with you, though. It's... complicated.~
  ++ ~Well, try to explain.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l18.3
  ++ ~You're either with me or you're not, Arath. There is no in-between.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l18.3
  ++ ~Well, I do want a forever after. And if you're not able to be that guy...~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l18.1
  ++ ~If it helps, I know I *don't*. So that simplifies things for you enormously.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l18.2
END

IF ~~ l18.1
  SAY ~I... I could be. I don't know.~
  IF ~~ + l18.3
END

IF ~~ l18.2
  SAY ~Oh.~
  = ~I'm... I. That does... simplify things. Okay. Fine. I guess that's it then.~
  IF ~~ DO ~SetGlobal("LK#ArathRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ l18.3
  SAY ~I've never done this before. A relationship, I mean. I don't know how it works. And that just... I don't like not knowing. I've... I'ver never let it get this far before.~
  = ~I don't know why. Well, I do, but it's... I don't know, it probably sounds ridiculous.~
  ++ ~Somehow, I doubt that.~ + l18.6
  ++ ~Don't worry, if it is, I'll let you know.~ + l18.4
  ++ ~Do I look like I'm going to laugh at you?~ + l18.5
  ++ ~(stay silent)~ + l18.6
END

IF ~~ l18.4
  SAY ~Right.~
  IF ~~ + l18.6
END

IF ~~ l18.5
  SAY ~I guess not.~
  IF ~~ + l18.6
END

IF ~~ l18.6
  SAY ~Not many people... I've never--people leave me. I let someone in and they leave me. And I was... I was scared you would, too. Maybe not right away, but... one way or another.~
  ++ ~You're an idiot. I love you, Arath. I have for quite a while, and I'm not going to leave you.~ + l18.7
  ++ ~I'm not going to leave you anytime soon, Arath. I like you far too much to do that to you.~ + l18.8
  ++ ~Is that what this is all about? You're worried I'm going to abandon you, so you abandon me first?~ + l18.9
  ++ ~I thought you wanted something that wasn't serious?~ + l18.10
  ++ ~Right. So is that any excuse to treat me like you did?~ + l18.11
  ++ ~Oh, Arath. Come here. (hug him)~ + l18.12
  ++ ~Sometimes you have to take a leap of faith.~ + l18.8
  ++ ~That is the most pathetic excuse I have quite literally ever heard.~ + l18.11
END

IF ~~ l18.7
  SAY ~Oh. That's a... love is a big word, <CHARNAME>. I don't know if I'm exactly comfortable with that... but...~
  IF ~~ + l18.8
END

IF ~~ l18.8
  SAY ~I... I do want to be with you. But I really have no idea what I'm doing, I don't know how it works.~
  ++ ~Then let me teach you.~ + l18.12
  ++ ~Well, it starts with you kissing me. Then we'll see where it goes from there.~ + l18.12
  ++ ~You're not alone there. I've never done this either, but I want to try.~ + l18.13
  ++ ~I don't think I could do this, Arath. I'm sorry.~ + l18.14
  ++ ~After treating me like you did, you think you can act cute and I'll just forgive you?~ +  l18.15
END
  
IF ~~ l18.9
  SAY ~(mutters) I told you it was ridiculous.~
  IF ~~ + l18.11
END

IF ~~ l18.10
  SAY ~I did. Initially. Or, I thought I did. But now...~
  IF ~~ + l18.8
END

IF ~~ l18.11
  SAY ~I am sorry for what I did. I said that last night, and I meant it. I want to try to make this work.~
  IF ~~ + l18.8
END

IF ~~ l18.12
  SAY ~I think I might be able to do that.~
  IF ~~ DO ~SetGlobal("LK#ArathRomanceActive","GLOBAL",2)~ EXIT
END

IF ~~ l18.13
  SAY ~That... that sounds good to me, <CHARNAME>. I'd like to try.~
  IF ~~ DO ~SetGlobal("LK#ArathRomanceActive","GLOBAL",2)~ EXIT
END

IF ~~ l18.14
  SAY ~... oh. I'm...~
  = ~Okay. I guess that's that, then. I... I wish we could have. Worked out, I mean. I'm sorry.~
  IF ~~ DO ~SetGlobal("LK#ArathRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ l18.15
  SAY ~I...~
  = ~I'm not trying to act cute. I hoped that maybe... but I was wrong, obviously. I'm sorry.~
  ++ ~You're not wrong. I just wish you weren't such an ass sometimes.~ + l18.16
  ++ ~You really hurt me, Arath.~ + l18.17
  ++ ~It was never going to work.~ + l18.18
  ++ ~You were. Definitely.~ + l18.19
END

IF ~~ l18.16
  SAY ~(grin) Well, don't hold your breath, but... I'll try.~
  = ~Thanks, <CHARNAME>. I do like you a lot, and... I really do want to make this work.~
  = ~Come on, let's get moving. We're starting to get odd looks.~
  IF ~~ EXIT
END

IF ~~ l18.17
  SAY ~I know. And I'm sorry about that. I really am. But... I'd like to try to make this work. If... if you want. I mean.~
  ++ ~I'm not going to pretend that everything is okay, but... I do want that. I want this relationship. But you need to try, not just me.~ + l18.20
  ++ ~Apology accepted. I just wanted to see how far I could jerk your chain. Of course I want to be with you. (grin)~ + l18.21
  ++ ~I can't. I'm sorry, Arath.~ + l18.22
  ++ ~I don't. Not after being rejected like that.~ + l18.23
END

IF ~~ l18.18
  SAY ~Maybe, but...~
  IF ~~ + l18.24
END

IF ~~ l18.19
  SAY ~I'm sorry.~
  IF ~~ + l18.24
END

IF ~~ l18.20
  SAY ~I will. I promise.~
  IF ~~ DO ~SetGlobal("LK#ArathRomanceActive","GLOBAL",2)~ EXIT
END

IF ~~ l18.21
  SAY ~I can't believe you'd do that! That's so...~
  = ~You're evil, <CHARNAME>. Pure, unadulterated evil. And I like it. (grin)~
  IF ~~ DO ~SetGlobal("LK#ArathRomanceActive","GLOBAL",2)~ EXIT
END

IF ~~ l18.22
  SAY ~Me too.~
  IF ~~ + l18.24
END

IF ~~ l18.23
  SAY ~I... that's fair enough.~
  IF ~~ + l18.24
END

IF ~~ l18.24
  SAY ~I guess that's that, then. (sigh)~
  IF ~~ DO ~SetGlobal("LK#ArathRomanceActive","GLOBAL",3)~ EXIT
END


//
IF ~Global("LK#ArathLovetalks","GLOBAL",38)~ l19
  SAY ~Did I ever tell you how I became a druid?~
  ++ ~I don't think you have, no.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l19.3
  ++ ~No, but I'd like to find out.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l19.3
  ++ ~I just figured you tripped over one day, blacked out, and woke up with druidic powers.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l19.2
  ++ ~Is it important?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1) RealSetGlobalTimer("LK#ArathLovetalkTimer","GLOBAL",3600)~ + l19.1
END

IF ~~ l19.1
  SAY ~Sort of. I guess it is. To me, anyway. I want you to understand me a bit better.~
  IF ~~ + l19.3
END

IF ~~ l19.2
  SAY ~Heh, that's good. I'll have to remember that one.~
  IF ~~ + l19.3
END

IF ~~ l19.3
  SAY ~When I was little, I didn't get to... I didn't know very many people. Or, I knew a lot of people, but didn't really get to know anybody *well*. My father took care of that.~
  = ~After my mother died, I didn't really... I didn't have anyone, apart from the nurses who looked after me, and gods know they didn't care. But... we had a gardener, who tended the grounds around our estate.~
  = ~He sort of took me under his wing. Showed me how to look after some of the plants, taught me about them. I had an excellent memory, and... I don't know. A lot of what he taught me stuck.~
  = ~After a while, he went away, but father didn't hire another groundskeeper. I did what I could. And I found myself--whenever I was frustrated or angry or sad or whatever, I would go into the garden and think, and... it made me feel better.~
  = ~Sounds a bit odd out loud, heh. Is this, uh, making any sense whatsoever? If it's not, just tell me.~
  ++ ~It's not that odd. I know exactly what you mean.~ + l19.6
  ++ ~Well, not much, but it's nice to listen to anyway. (grin)~ + l19.4
  ++ ~No, you're fine.~ + l19.6
  ++ ~It's making sense, I don't know if it's providing much insight so far.~ + l19.5
END

IF ~~ l19.4
  SAY ~Heh. Well at least I'm providing some entertainment!~
  IF ~~ + l19.6
END

IF ~~ l19.5
  SAY ~I'm getting there, don't worry.~ 
  IF ~~ + l19.6
END

IF ~~ l19.6
  SAY ~When I found out about... you know, my father being a slaver and all, I couldn't stay at the manse any longer. I needed to get out, to... I don't know, really. But I needed to go.~
  = ~I went to the one place I knew he'd never find me. I'd never been to the slums before, and they... well, it shocked me a bit. I didn't realise. I was only there for a few weeks, but I quickly learnt how to survive.~
  = ~A herbalist took me in, mainly because I was able to find things she needed. I had a knack for spotting obscure plants, and in exchange she taught me a little of what she knew. She was the one who recommended me to the druids.~
  = ~Not knowing what else to do, I went. And... well, that's the story, I guess. I'm not sure I've ever actually told anyone the whole thing before.~
  = ~I know I don't talk much about my past. I thought maybe if I did you'd understand me a bit better. Bit pathetic when I think about it, heh~
  ++ ~(hug him)~ + l19.7
  ++ ~It's not pathetic at all. Thanks for sharing it with me.~ + l19.8
  ++ ~Not your average route to becoming a druid, I'd imagine.~ + l19.9
  ++ ~A bit, but I'm not going to hold it against you. (grin)~ + l19.10
END

IF ~~ l19.7
  SAY ~That was... unexpected. But nice. Thanks. (grin)~
  IF ~~ + l19.8
END

IF ~~ l19.8
  SAY ~Alright, enough of me talking at you. We've got work to do.~
  IF ~~ EXIT
END

IF ~~ l19.9
  SAY ~Definitely not. Most people are raised in that lifestyle, or follow some inner calling. For me, it was just... it just fit, somehow.~
  IF ~~ + l19.8
END

IF ~~ l19.10
  SAY ~Good. (grin)~
  IF ~~ + l19.8
END


// last LT
IF ~Global("LK#ArathLovetalks","GLOBAL",40)~ l20
  SAY ~Hey, uh. I made you this.~
  ++ ~That's so sweet! What is it, exactly?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1)~ + l20.1
  ++ ~What on Faerun is that?~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1)~ + l20.1
  ++ ~That's... lovely. Thank you.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1)~ + l20.1
  ++ ~You are a romantic failure.~ DO ~IncrementGlobal("LK#ArathLovetalks","GLOBAL",1)~ + l20.1
END

IF ~~ l20.1
  SAY ~It's a woven grass bracelet. Or... it was, anyway. I think I must have broken it in my pocket. Ugh.~
  IF ~Gender(Player1,MALE)~ + l20.2a
  IF ~Gender(Player1,FEMALE)~ + l20.2b
END

IF ~~ l20.2a
  SAY ~What I *wanted* to give you was a carved statue of a lion, but that proved problematic, because I couldn't find the right material to carve it with, or the right tools.~
  = ~Well, that and I don't really know how to carve. But I had hoped to pick it up as I go.~
  = ~Anyway. I'm... I wanted to tell you that I'm a lucky man, to have such a handsome guy as yourself as his... his partner. Lover. I'm not really sure what to call you, heh.~
  ++ ~(kiss him)~ + l20.3
  ++ ~Either is fine. You're awfully cute, yourself, you know.~ + l20.4
  ++ ~I'm the lucky one, Arath, not you.~ + l20.5
  ++ ~I don't care what you call me, as long as I can call you mine.~ + l20.6
END
  
IF ~~ l20.2b
  SAY ~What I *wanted* to give you was a carved statue of a lioness, but that proved problematic, because I couldn't find the right material to carve it with, or the right tools.~
  = ~Well, that and I don't really know how to carve. But I had hoped to pick it up as I go.~
  = ~Anyway. I'm... I wanted to tell you that I'm a lucky man, to have such a beautiful woman as yourself as his... his partner. Lover. I'm not really sure what to call you, heh.~
  ++ ~(kiss him)~ + l20.3
  ++ ~Either is fine. You're awfully cute, yourself, you know.~ + l20.4
  ++ ~I'm the lucky one, Arath, not you.~ + l20.5
  ++ ~I don't care what you call me, as long as I can call you mine.~ + l20.6
END

IF ~~ l20.3
  SAY ~Mmm... you know, I've kissed a lot of people, <CHARNAME>. But I don't think I've ever meant it as much as when I kiss you.~
  IF ~~ + l20.7
END

IF ~~ l20.4
  SAY ~I know. (grin)~
  IF ~~ + l20.7
END

IF ~~ l20.5
  SAY ~Hardly. I'm the emotional cripple here, not you. Unable to deal with his own emotions, a wreck at the slightest provocation.~
  = ~Alright, well, not really, but it sounds pretty deep and dramatic. (grin)~
  IF ~~ + l20.7
END

IF ~~ l20.6
  SAY ~Awww. That's so sweet. Do any more of that and I think I might vomit rainbows, <CHARNAME>, so be careful.~
  IF ~~ + l20.7
END

IF ~~ l20.7
  SAY ~Whatever this is we have... I like it. It's scary, and new, and... sometimes a bit disturbing to think about, but... I want it. And I want you. Desperately.~
  = ~In fact, if there weren't people around, I'd probably tear off your clothes right now. I'm just saying.~
  ++ ~I wouldn't mind that, as long as I could tear off yours first!~ + l20.8
  ++ ~Well, we can always go somewhere a little more... private.~ + l20.9
  ++ ~Slow down there, cowboy. Let's save that for later.~ + l20.10
  ++ ~You're a real romantic at heart, aren't you?~ + l20.11
END

IF ~~ l20.8
  SAY ~I'm sure we could arrange something like that. Maybe not right now, though.~
  IF ~~ + l20.12
END

IF ~~ l20.9
  SAY ~Heh, as much as I'd like that, I think we have more pressing matters to attend to. And there's always after everyone else has gone to sleep. (wink)~
  IF ~~ + l20.12
END

IF ~~ l20.10
  SAY ~I wasn't suggesting right now! There's always after everyone else has gone to sleep. (wink)~
  IF ~~ + l20.12
END

IF ~~ l20.11
  SAY ~Of course! A romantic to the end, I swear.~
  IF ~~ + l20.12
END

IF ~~ l20.12
  SAY ~I don't know where this will go, but I want to be with you. So... yeah. I hope you do, too.~
  ++ ~If I didn't want to be with you, I wouldn't be here right now.~ + l20.13
  ++ ~I love you. I'm not about to go anywhere.~ + l20.14
  ++ ~I don't know where this will go, either, but I like what we have.~ + l20.15
  ++ ~You're... very sweet, Arath. But I don't think I do want this.~ + l20.16
END

IF ~~ l20.13
  SAY ~I guess you have a point. I hope you don't mind if I stick around a little while longer, then... my gorgeous <PRO_MANWOMAN>.~
  IF ~~ EXIT
END

IF ~~ l20.14
  SAY ~I know. I hope you don't mind if I stick around a little while longer, then... my gorgeous <PRO_MANWOMAN>.~
  IF ~~ EXIT
END

IF ~~ l20.15
  SAY ~Good. I hope you don't mind if I stick around a little while longer, then... my gorgeous <PRO_MANWOMAN>.~
  IF ~~ EXIT
END

IF ~~ l20.16
  SAY ~But... I made you a bracelet. And...~
  = ~I can't believe you. Fine, then, if that's what you want. I... wish you felt differently.~
  IF ~~ DO ~SetGlobal("LK#ArathRomanceActive","GLOBAL",3)~ EXIT
END


// sex scenes

// In forest
IF ~Global("LK#ArathForestSex","GLOBAL",1)~ s1
  SAY ~Something about sleeping amidst nature is incredibly intoxicating. The smell of the trees, the grass beneath your feet...~
  = ~Primal, I guess is the word. It feels primal. Like all that matters is hunting, and killing, and eating, and sex.~
  = ~I want you, <CHARNAME>. I want to have you, here, underneath the stars, our bodies' frenzied movement all that stirs the forest around us as nature looks on.~
  IF ~Gender(Player1,MALE)~ DO ~SetGlobal("LK#ArathForestSex","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1) RealSetGlobalTimer("LK#ArathSexTimer","GLOBAL",10800)~ + s1.1a
  IF ~Gender(Player1,FEMALE)~ DO ~SetGlobal("LK#ArathForestSex","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1) RealSetGlobalTimer("LK#ArathSexTimer","GLOBAL",10800)~ + s1.1b
END

IF ~~ s1.1a
  SAY ~I want to feel your taut muscles on mine, your arms around me as we climax. I want your kiss-swollen lips on mine as we lie, panting, on the earth that bore us.~
  IF ~~ + s1.2
END

IF ~~ s1.1b
  SAY ~I want to feel your body writhing under mine, your nails on my back as you climax, and again. I want your kiss-swollen lips on mine as I thrust into you, groaning, on the earth that bore us.~
  IF ~~ + s1.2
END

IF ~~ s1.2
  SAY ~Sound good to you, <CHARNAME>? Up for a frolic in the woods? (wink)~
  ++ ~A frolic in the woods, hmm? As long as that's not all we'll be doing, I'm in.~ + s1.3
  ++ ~I'm not interested in having sex with you, Arath. I thought I'd made that clear.~ + s1.4
  ++ ~Oh gods, Arath, you read a lot of really bad romance novels as a child, didn't you?~ + s1.5
  ++ ~I don't know...~ + s1.3
  ++ ~Not a chance, my friend. But it was worth a shot. (grin)~ + s1.3
  ++ ~Absolutely not! What kind of <PRO_MANWOMAN> do you think I am?!~ + s1.3
  ++ ~Get lost.~ + s1.9
END

IF ~~ s1.3
  SAY ~I thought maybe we could see if there's a stream around, maybe have a quick dip... find a nice clearing... what do you think?~
  ++ ~(kiss him)~ + s1.12
  ++ ~Sounds like my kind of night!~ + s1.6
  ++ ~Have sex... in a clearing? Outside? Are you insane?~ + s1.7
  ++ ~I don't think so. Another time, maybe.~ + s1.4
  ++ ~I'm not interested in you like that, Arath.~ + s1.8
END

IF ~~ s1.4
  SAY ~Pshh, fine. Spoilsport.~
  IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ s1.5
  SAY ~Uh. Yes, but that's not...~
  = ~It was a bit over the top, at that. Force of habit. You're a bit smarter than the people I'm used to. (grin)~
  IF ~~ + s1.3
END

IF ~~ s1.6
  SAY ~Well, what are we waiting for?~
  IF ~~ DO ~IncrementGlobal("LK#ArathSex","GLOBAL",1) RestParty()~ EXIT
END

IF ~~ s1.7
  SAY ~What's wrong with outside, exactly?~
  ++ ~There's dirt, and bugs, and gods know what else!~ + s1.10
  ++ ~It's just so open. I'm not sure I want to feel that vulnerable.~ + s1.10
  ++ ~Well--nothing, really. It just surprised me, that's all.~ + s1.11
  ++ ~So many things, I don't even know where to start.~ + s1.10
END

IF ~~ s1.8
  SAY ~Ah.~
  = ~Well, your loss, I suppose. (shrug)~
  IF ~~ DO ~SetGlobal("LK#ArathRomanceActive","GLOBAL",3) RestParty()~ EXIT
END

IF ~~ s1.9
  SAY ~That's a bit harsh. Fine.~
  IF ~~ DO ~SetGlobal("LK#ArathRomanceActive","GLOBAL",3) RestParty()~ EXIT
END

IF ~~ s1.10
  SAY ~(shrug) Your loss, I suppose.~
  IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ s1.11
  SAY ~So is that a yes, or...?~
  ++ ~(kiss him)~ + s1.12
  ++ ~I think so, yes. (grin)~ + s1.6
  ++ ~That's... a no. Sorry.~ + s1.8
END

IF ~~ s1.12
  SAY ~I'll take that as a yes, then. (grin)~
  IF ~~ + s1.6
END


// In inn
IF ~Global("LK#ArathInnSex","GLOBAL",1)~ s2
  SAY ~Hey there, gorgeous. Come here often?~
  ++ ~Oh, now and then.~ DO ~SetGlobal("LK#ArathInnSex","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + s2.1
  ++ ~(grin) This is my first time, actually.~ DO ~SetGlobal("LK#ArathInnSex","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + s2.1
  ++ ~... really? That's your line?~ DO ~SetGlobal("LK#ArathInnSex","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + s2.2
  ++ ~Oh, gods.~ DO ~SetGlobal("LK#ArathInnSex","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + s2.2
  ++ ~Oh, go away.~ DO ~SetGlobal("LK#ArathInnSex","GLOBAL",2) SetGlobal("LK#ArathBreak","GLOBAL",1)~ + s2.3
END

IF ~~ s2.1
  SAY ~You know, I've never actually got this far with that line before. What happens now?~
  ++ ~Well, to start with, you invite me to your room... (wink)~ + s2.4
  ++ ~I've never known anyone dumb enough to use it, so I'm not sure either, to be honest.~ + s2.5
  ++ ~I would imagine you offer to buy me a drink?~ + s2.6
  ++ ~I really have no idea, I'm afraid.~ + s2.7
END

IF ~~ s2.2
  SAY ~Heh. Sorry about that. I couldn't resist the opportunity to try it out.~
  IF ~~ + s2.8
END

IF ~~ s2.3
  SAY ~(sigh) Fine.~
  IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ s2.4
  SAY ~Oh, is that how it works? I'm sure we can arrange something to that tune...~
  = ~My room, maybe some reciprocal massage, possibly a little whipped cream...~
  ++ ~With that in mind, how about we skip dinner and get straight to dessert?~ + s2.9
  ++ ~Hey, I was talking about it in the theoretical sense! I never said anything about whipped cream!~ + s2.10
  ++ ~I never said I'd accept your invitation.~ + s2.11
  ++ ~Nice try, but I don't think so.~ + s2.12
END

IF ~~ s2.5
  SAY ~Ouch! I'm burned, <CHARNAME>. Truly. Someone should call a priest.~
  IF ~~ + s2.8
END

IF ~~ s2.6
  SAY ~Well, I can do that. What's your poison, dearest <CHARNAME>? Wine? Ale? Juice? Some bizarre Waterdhavian concoction?~
  ++ ~Anything as long as it contains plenty of alcohol.~ + s2.13
  ++ ~An ale would go down great right about now.~ + s2.14
  ++ ~Surprise me.~ + s2.15
  ++ ~A glass of one is probably not such a bad idea.~ + s2.16
  ++ ~Just some juice or water for me, thank you.~ + s2.17
  ++ ~I couldn't possibly. Thanks, though.~ + s2.18
END

IF ~~ s2.7
  SAY ~Neither do I, heh. How about a drink? What's your poison, dearest <CHARNAME>? Wine? Ale? Juice? Some bizarre Waterdhavian concoction, perhaps?~
  ++ ~Anything as long as it contains plenty of alcohol.~ + s2.13
  ++ ~An ale would go down great right about now.~ + s2.14
  ++ ~A glass of one is probably not such a bad idea.~ + s2.16
  ++ ~Just some juice or water for me, thank you.~ + s2.17
  ++ ~Surprise me.~ + s2.15
  ++ ~I couldn't possibly. Thanks, though.~ + s2.18
END

IF ~~ s2.8
  SAY ~You look a little stressed. I've been told I'm a pretty good masseuse...?~
  ++ ~Mmm, a massage sounds good.~ + s2.19
  ++ ~Maybe later... somewhere more private?~ + s2.20
  ++ ~I think I'll be the judge of that.~ + s2.19
  ++ ~Not right now, thank you.~ + s2.21
END

IF ~~ s2.9
  SAY ~Mmm... I think I could manage that.~
  IF ~~ DO ~IncrementGlobal("LK#ArathSex","GLOBAL",1) RestParty()~ EXIT
END

IF ~~ s2.10
  SAY ~Well, you may be, but I'm not. And what's a good sensual massage without something to make it interesting?~
  ++ ~Alright, I'm in. I've always wanted to try licking whipped cream from someone's stomach...~ + s2.23
  + ~Gender(Player1,MALE)~ + ~It'a a sensual massage. There's plenty of other things we can do to make it interesting, trust me. (wink)~ + s2.24a
  + ~Gender(Player1,FEMALE)~ + ~It'a a sensual massage. There's plenty of other things we can do to make it interesting, trust me. (wink)~ + s2.24b
  ++ ~Not tonight, Arath.~ + s2.21
  ++ ~I'm not interested in you that way, Arath.~ + s2.25
END

IF ~~ s2.11
  SAY ~Well? Will you?~
  ++ ~Absolutely. (kiss him)~ + s2.23
  + ~Gender(Player1,MALE)~ + ~Mmm... how about we wait and see?~ + s2.24a
  + ~Gender(Player1,FEMALE)~ + ~Mmm... how about we wait and see?~ + s2.24b
  ++ ~Not tonight. ~ + s2.3
END

IF ~~ s2.12
  SAY ~Well, it was worth a try. Ah well. Your loss. (grin)~
  IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ s2.13
  SAY ~Heh, I'll see what I can do.~
  IF ~~ + s2.8
END

IF ~~ s2.14
  SAY ~I think I saw some Tethyrian rye ale at the bar... I'll see what I can do.~
  IF ~~ + s2.8
END

IF ~~ s2.15
  SAY ~Hmmm... alright. How about some Moonshae bloodwhiskey? You know, I'm not sure why it's called that, but... (shrug)~
  IF ~~ + s2.8
END

IF ~~ s2.16
  SAY ~I think I saw some aged Chessentan red at the bar... I'll see what I can do.~
  IF ~~ + s2.8
END

IF ~~ s2.17
  SAY ~No problem. I'm sure they'll have some apple juice or something along those lines.~
  IF ~~ + s2.8
END

IF ~~ s2.18
  SAY ~I'll grab something later on, then.~
  IF ~~ + s2.8
END

IF ~~ s2.19
  SAY ~Gods, you're tense. You should relax, stop worrying so much. It'll do you a world of good.~
  = ~You know what, maybe this would be better somewhere a little less public.~
  IF ~~ + s2.20
END

IF ~~ s2.20
  SAY ~My room, maybe some reciprocal massage, possibly a little whipped cream...~
  ++ ~With that in mind, how about we skip dinner and get straight to dessert?~ + s2.9
  ++ ~Hey, I never said anything about whipped cream!~ + s2.10
  ++ ~Reciprocal? No, no, that won't do.~ + s2.22
  ++ ~Nice try, but I don't think so.~ + s2.12
END

IF ~~ s2.21
  SAY ~Maybe another time, then.~
  = ~Sleep well, I suppose, I'm heading off. Been a long day.~
  IF ~~ DO ~RestParty()~ EXIT
END

IF ~~ s2.22
  SAY ~Heh! Now you are a <PRO_MANWOMAN> who knows what <PRO_HESHE> wants. Alright, a massage for you, and... well, we'll see what I get when there, hmm? (wink)~
  IF ~~ DO ~IncrementGlobal("LK#ArathSex","GLOBAL",1) RestParty()~ EXIT
END

IF ~~ s2.23
  SAY ~Mm, I think I might be able to withstand that... (wink)~
  IF ~~ DO ~IncrementGlobal("LK#ArathSex","GLOBAL",1) RestParty()~ EXIT
END

IF ~~ s2.24a
  SAY ~Sounds good to me, handsome. Shall we? (wink)~
  IF ~~ DO ~IncrementGlobal("LK#ArathSex","GLOBAL",1) RestParty()~ EXIT
END

IF ~~ s2.24b
  SAY ~Sounds good to me, beautiful. Shall we? (wink)~
  IF ~~ DO ~IncrementGlobal("LK#ArathSex","GLOBAL",1) RestParty()~ EXIT
END

IF ~~ s2.25
  SAY ~Ah. Well, that does throw a damper on things.~
  = ~Sleep well, I suppose, I'm heading off. Been a long day.~
  IF ~~ DO ~RestParty()~ EXIT
END


IF ~Global("LK#ArathRomKill","GLOBAL",2)~ rk1
  SAY ~<CHARNAME>, have you got a moment?~
  IF ~Global("AnomenRomanceActive","GLOBAL",2)~ + rk.ano
  IF ~Global("AerieRomanceActive","GLOBAL",2)~ + rk.aer
  IF ~Global("JaheiraRomanceActive","GLOBAL",2)~ + rk.jah
  IF ~Global("ViconiaRomanceActive","GLOBAL",2)~ + rk.vic
END

IF ~~ rk.ano
  SAY ~You and Anomen have become very close recently. I'm not interested in being the other man, I've been there, I have that t-shirt and it's not an experience I'm going to repeat with you. I respect you too much.~
  IF ~~ + rk.end
END

IF ~~ rk.aer
  SAY ~You and Aerie have become very close recently. I'm not interested in being the other man, I've been there, I have that t-shirt and it's not an experience I'm going to repeat with you. I respect you too much.~
  IF ~~ + rk.end
END

IF ~~ rk.jah
  SAY ~You and Jaheira have become very close recently. I'm not interested in being the other man, I've been there, I have that t-shirt and it's not an experience I'm going to repeat with you. I respect you too much.~
  IF ~~ + rk.end
END

IF ~~ rk.vic
  SAY ~You and Viconia have become very close recently. I'm not interested in being the other man, I've been there, I have that t-shirt and it's not an experience I'm going to repeat with you. I respect you too much.~
  IF ~~ + rk.end
END

IF ~~ rk.end
  SAY ~It's been fun, <CHARNAME>. Come on, we've got other things to worry about.~
  IF ~~ DO ~SetGlobal("LK#ArathRomKill","GLOBAL",3) SetGlobal("LK#ArathRomanceActive","GLOBAL",3)~ EXIT
END

END


// ***********************
//                       *
//     Interjections     *
//                       *
// ***********************

I_C_T ACOLYTE1 1 LK#Arath_acolyte1
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~The man has a point.~
END

I_C_T ANNO1 0 LK#Arath_anno1
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Charming. Yes, let's bid on which life is pointlessly lost! Absolutely!~
END

I_C_T ARAN 49 LK#Arath_aran1
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~You slimy bastard. <CHARNAME> paid you well more than what your services were worth!~
END

I_C_T ARAN 24 LK#Arath_aran2
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~I hear you. These vampires need to be eradicated before they can grow their numbers even further. Gods know what we'd do then.~
END

CHAIN IF WEIGHT #-1 ~See("Arath")
InParty("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
Global("LK#Arath_argrim","LOCALS",0)~ THEN ARGRIM LK#Arath_argrim
  ~My family is one of the wealthiest in Athkatla...we have interests in the gold mines up north and the shipwrights here in the city.  So I will thank you not to stand too close..~
  DO ~SetGlobal("LK#Arath_argrim","LOCALS",1)~
  == LK#ARATJ ~Ahh, Lord Argrim, what a surprise to see you here, of all places? How have you been?~
  == ARGRIM ~Oh! My lord Duskhelm, I hardly recognised you beneath all that paraphernalia. I have had better days, I can assure you.~
  == LK#ARATJ ~And how are Cecilia and the children?~
  == ARGRIM ~They hardly recognise me with all the work I've been given by the Government. The nerve! My days of working should be far behind me.~
  == LK#ARATJ ~Ahh, yes, how unfortunate. Well, do say hello.~
  == ARGRIM ~Yes, yes... good day to you.~
EXIT

I_C_T ARNBOY01 0 LK#Arath_arnboy01
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Few do. And with good reason.~
  = ~Is that... what I think it is?~
  == ARNBOY01 ~He made me... (erf)... remove it. He wouldn't stop screaming...~
  == LK#ARATJ ~Oookay, enough information for me... ugh...~
END

CHAIN IF WEIGHT #-1 ~See("Arath")
InParty("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
RandomNum(2,1)
Global("LK#Arath_bftown3","LOCALS",0)~ THEN BFTOWN3 LK#Arath_bftown3
  ~Ye seem awfully familiar... do I know ye?~
  DO ~SetGlobal("LK#Arathbftown3","LOCALS",1)~
  == LK#ARATJ ~I, uh, I doubt it.~
  == BFTOWN3 ~Somethin' about yer face... (shrug)~
  == LK#ARATJ ~Well, it is rather striking.~
EXIT

I_C_T BDOCK2 1 LK#Arath_bdock2
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~You tell him, my big ugly orc fellow! Throw off your chains of needless oppression! Embrace the light of day as free orcs!~
  = ~... alright, a bit much. Uh.~
END

I_C_T BMTOWN3 0 LK#Arath_bmtown3
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~It does, but until the people at the top actually understand what life is like here... it won't.~
  == BMTOWN3 ~Well, not with that attitude!~
END

I_C_T BODHI 1 LK#Arath_bodhi1
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~<CHARNAME>... I don't trust this woman. Something about her is... wrong, somehow.~
END

I_C_T BOOTER 3 LK#Arath_booter
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~You... do that.~
  = ~What a revolting little man.~
END

I_C_T BRAT3 4 LK#Arath_brat3
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~A kobold?! I'll have you know, you miserable little child, that I have met kobolds, and they're more personable than you will ever grow up to be. Hmph.~
END

I_C_T BSHOP01 1 LK#Arath_bshop1
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Ah, <CHARNAME>, if I were you, I'd trust this guy as far as I could throw him.~
  == KORGANJ IF ~InParty("Korgan") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~So ye trust him to about where he be right now, do ye?~
  == LK#ARATJ ~I'm just saying. Be careful with what you purchase, it might not... you know, work.~
END

CHAIN IF WEIGHT #-1 ~See("Arath")
InParty("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
RandomNum(2,2)
Global("LK#Arath_burch2","LOCALS",0)~ THEN BURCH2 LK#Arath_burch2
~MY MOTHER SAYS THAT DRUIDS SHOULD GO AND RUTT WITH THE ANIMALS IF THEY LOVE THEM SO MUCH!~
DO ~SetGlobal("LK#Arath_burch2","LOCALS",1)~
== LK#ARATJ ~Right, then. They also like to feed them little girls, so you better be nice!~
EXIT

I_C_T c6BODHI 0 LK#Arath_bodhi2
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~All we had to do was follow the stale trail of blood, vampire. It's time for this to end!~
  == C6BODHI ~Oh yes, it will end... one way or another, my handsome little human. But not so well for you.~
END

I_C_T c6DRIZZ1 1 LK#Arath_drizzt
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Huh. You're... smaller than I imagined you. Older, too. Shame.~
END

I_C_T c6REGIS1 2 LK#Arath_drizzt
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Huh. He's... smaller than I imagined him. Older, too. Shame.~
END

I_C_T C6ELHAN2 28 LK#Arath_elhan
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~What?! The entire city... gone? Just like that?!~
END

I_C_T C6ELHAN2 45 LK#Arath_elhan2
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~He's not wrong. The government would have a fit if they ever found out.~
END

I_C_T C6ELHAN2 59 LK#Arath_elhan3
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~I never thought I'd be vouching for a drow, but... Viconia has done us no harm. Quite the opposite, in fact. She's been... surprisingly helpful in our endeavors.~
  == JAHEIRAJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~Then you are more foolish than I thought, pup. She will betray us, it is only a matter of time. It's in her very blood.~
  == VICONIJ IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN ~Yes, yes, the same tired old accusations from the same tired old woman. He was not asking your opinion, waela.~
END

INTERJECT CEFALD04 3 LK#Arath_cefald04
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Oh gods... what have you done, <CHARNAME>?! You're worse than the Shadow Druids themselves! I can't let you do this!~
COPY_TRANS CEFALD04 3

/*
EXTEND_TOP CEFALDOR 2 #0
  + ~!Class(Player1,DRUID_ALL) InParty("Arath") !Dead("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ + ~The old rituals still hold sway here! Arath shall challenge you for leadership!~ EXTERN LK#ARATJ LK#Arath_cefaldor
END

CHAIN LK#ARATJ LK#Arath_cefaldor
  ~I will? Uh, okay... would have been nice to have a heads up, maybe.~
  = ~I, Arath Duskhelm of Athkatla, challenge your authority in this grove, as is my right by the ancient laws laid down aeons ago in this place!~
*/

CHAIN IF WEIGHT #-1 ~See("Arath")
InParty("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
RandomNum(2,2)
Global("LK#Arath_celvan","LOCALS",0)~ THEN CELVAN LK#Arath_celvan
  ~"There once was a druid sore troubled,
whose own father's death had redoubled,
his efforts to top,
the slavers nonstop
and how he has nothing but stubble."~
  DO ~SetGlobal("LK#Arath_celvan","LOCALS",1)~
  == LK#ARATJ ~How on Faerun did you...~
EXTERN CELVAN 1

CHAIN IF WEIGHT #-1 ~See("Arath")
InParty("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
RandomNum(2,2)
Global("LK#Arath_civil02","LOCALS",0)~ THEN CIVIL02 LK#Arath_civil02
  ~Hmm... are you Arath Duskhelm, by any chance? Son of Lord Batthias Duskhelm?~
  DO ~SetGlobal("LK#Arath_civil02","LOCALS",1)~
  == LK#ARATJ ~Yes? Why?~
  == CIVIL02 ~According to my records, sir, you haven't paid taxes in three years. The total amounts to--~
  == LK#ARATJ ~I haven't lived in Athkatla since I was fourteen. You people should really keep better records.~
  == CIVIL02 ~... trust me, if I could make the census staff do their job properly, I would. (sigh)~ 
  = ~Sorry to bother you.~
EXIT

I_C_T DASLAVE1 7 LK#Arath_daslave1
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Though I doubt he'll actually make it anywhere near the surface, that was a commendable gesture, <CHARNAME>. Better death on his own terms than... this.~
END

I_C_T DASLAVE1 8 LK#Arath_daslave2
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Though I doubt he'll actually make it anywhere near the surface, that was a commendable gesture, <CHARNAME>. Better death on his own terms than... this.~
END

I_C_T DASLAVE1 9 LK#Arath_daslave3
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Though I doubt he'll actually make it anywhere near the surface, that was a commendable gesture, <CHARNAME>. Better death on his own terms than... this.~
END

I_C_T DASLAVE1 10 LK#Arath_daslave4
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Though I doubt he'll actually make it anywhere near the surface, that was a commendable gesture, <CHARNAME>. Better death on his own terms than... this.~
END

I_C_T DBEGGAR 8 LK#Arath_dbeggar
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~I'll... keep that in mind. Just out of curiosity, ah, what *is* a welcher?~
  == DBEGGAR ~A welcher's a welcher! Unless you've gold to give!~
END

I_C_T DELCIA 1 LK#Arath_delcia
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Charming woman.~
END

I_C_T DELCIA 32 LK#Arath_delcia2
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Hmph. The least she could do is a fruit basket. Really.~
END

CHAIN IF WEIGHT #-1 ~See("Arath")
InParty("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
RandomNum(2,2)
Global("LK#Arath_deltow01","LOCALS",0)~ THEN DELTOW01 LK#Arath_deltow01
  ~Everything keeps getting more expensive. How am I supposed to feed a family AND buy ale?~
  DO ~SetGlobal("LK#Arath_deltow01","LOCALS",1)~
  == LK#ARATJ ~Get a better job?~
  == DELTOW01 ~Easy for you to say.~
EXIT

CHAIN IF WEIGHT #-1 ~See("Arath")
InParty("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
RandomNum(2,2)
Global("LK#Arath_dharlot1","LOCALS",0)~ THEN DHARLOT1 LK#Arath_dharlot1
  ~Well hello there, handsome.~
  DO ~SetGlobal("LK#Arath_dharlot1","LOCALS",1)~
  == LK#ARATJ ~Uh. Hullo, Charlotte.~
  == DHARLOT1 ~Care for a tumble, for old times sake? Hmm?~
  == LK#ARATJ ~Not right now, Lottie. Maybe another time.~
  == DHARLOT1 ~(sigh) What's a poor woman to do... never get any of the good ones...~
EXIT

CHAIN IF WEIGHT #-1 ~See("Arath")
InParty("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
RandomNum(2,2)
Global("LK#Arath_dmtown2","LOCALS",0)~ THEN DMTOWN2 LK#Arath_dmtown2
  ~Ye're a little old to be sportin' hair like that, don't ye think?~
  == LK#ARATJ ~A good haircut has no age.~
  == DMTOWN2 ~Keep tellin' yerself that.~
EXIT

I_C_T ELGEA 0 LK#Arath_elgea
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Oh, dear. So you're going to be one of *those*. It might just be easier to leave this one, <CHARNAME>. Then again, her family might reward us handsomely, so... (shrug)~
END

I_C_T FFCUST02 2 LK#Arath_ffcust02
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Oh dear, can't let her know you frequent a place as common as this!~
  == FFCUST02 ~Indeed, I can hardly imagine her reaction. It would probably involve a fainting spell. (sigh)~
  = ~She does love her fainting spells...~
END


I_C_T FIRKRA01 6 LK#Arath_firkraag
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Ten thousand gold is no small sum... we should definitely consider this, <CHARNAME>. I really need a new mirror.~
END

CHAIN IF WEIGHT #-1 ~See("Arath")
InParty("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
RandomNum(2,2)
Global("LK#Arath_ftown7","LOCALS",0)~ THEN FTOWN7 LK#Arath_ftown7
  ~What's a handsome man like ye doin' in a place like this, eh? Don't ye have nicer places t'be?~
  == LK#ARATJ ~I'm afraid not. I love how you've done your hair, by the way.~
  == FTOWN7 ~Really?~
  == LK#ARATJ ~Very unique.~
  == FTOWN7 ~Oh.~
  == LK#ARATJ ~In a good way, though.~
  == FTOWN7 ~Oh!~
EXIT

I_C_T SAFE GIRL2 5 LK#Arath_girl2
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~I'm sure she will. Thank you, <CHARNAME>.~
  == GIRL2 ~Thank you again!~
END

I_C_T GMTOWN02 3 LK#Arath_
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Coward? No. Sensible and devilishly attractive? Yes.~
  = ~Have fun with the death and all.~
END

I_C_T GNOBLEF2 1 LK#Arath_gnoblef2
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~(gasp) How awful! How will you survive?!~
  == GNOBLEF2 ~I hardly know. If things continue to go south, next I won't be able to buy that new gold-plated dresser I've so been longing for!~
  == LK#ARATJ ~Tragic.~
END

I_C_T PLAYER1 25 LK#Arath_hell
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~<CHARNAME>? I... I saw you fall, and then I felt something *pull* at me...~
  = ~Oh. Ohhh. Sweet merciful gods. I'm dead, aren't I? You pulled me with you when you died. I can't believe you, <CHARNAME>. Honestly!~
  = ~Let's just... get this over with. Whatever it is. And hope someone revives us soon.~
END

I_C_T HELLJON 7 LK#Arath_irenicushell
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~It's time for this to end, Irenicus! We killed you once, and we'll do it again! Permanently, this time!~
END

I_C_T HELLJON 8 LK#Arath_irenicushell2
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~It's time for this to end, Irenicus! We killed you once, and we'll do it again! Permanently, this time!~
END

I_C_T HELLJON 9 LK#Arath_irenicushell3
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~It's time for this to end, Irenicus! We killed you once, and we'll do it again! Permanently, this time!~
END

I_C_T HELLJON 10 LK#Arath_irenicushell4
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~It's time for this to end, Irenicus! We killed you once, and we'll do it again! Permanently, this time!~
END

EXTEND_BOTTOM PLAYER1 33
  IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID) InMyArea("Arath") !Global("LK#ArathRomanceActive","GLOBAL",2) Global("LK#ArathTreeofLife","GLOBAL",0)~ EXTERN PLAYER1 LK#Arath_tol
  IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID) InMyArea("Arath") Global("LK#ArathRomanceActive","GLOBAL",2) Global("LK#ArathTreeofLife","GLOBAL",0)~ EXTERN PLAYER1 LK#Arath_tolrom
END

CHAIN PLAYER1 LK#Arath_tol
  ~Arath, the irreverant, complex Athkatlan druid, has promised to see your quest though. But he has a life yet to live, and many accomplishments yet to achieve.~
END
  ++ ~You shouldn't risk your life for this, Arath. This is my fight, not yours.~ DO ~SetGlobal("LK#ArathTreeofLife","GLOBAL",1)~ EXTERN LK#ARATJ LK#Arath_tol1
  ++ ~You've seen what Irenicus can do. I don't want you to endanger yourself any further on my behalf.~ DO ~SetGlobal("LK#ArathTreeofLife","GLOBAL",1)~ EXTERN LK#ARATJ LK#Arath_tol1
  ++ ~Are you sure you're ready for this, Arath? I need you at your best if we're going to win this.~ DO ~SetGlobal("LK#ArathTreeofLife","GLOBAL",1)~ EXTERN LK#ARATJ LK#Arath_tol2

  CHAIN PLAYER1 LK#Arath_tolrom
  ~Arath: what started as something simple and physical has quickly become much more. He strokes your cheek lightly, waiting for you to continue.~
END
  ++ ~Arath... I--~ DO ~SetGlobal("LK#ArathTreeofLife","GLOBAL",1)~ EXTERN LK#ARATJ LK#Arath_tol3

APPEND LK#ARATJ
  IF ~~ LK#Arath_tol1
    SAY ~You're right, of course. Good luck!~
    = ~Don't be ridiculous, <CHARNAME>. You're not getting rid of me that easily. Let's do this.~
    COPY_TRANS PLAYER1 33
  END
  
  IF ~~ LK#Arath_tol2
    SAY ~As ready as I'll ever be to take on a maniacal, all-powerful wizard, absolutely. Let's do this.~
    COPY_TRANS PLAYER1 33
  END
  
  IF ~~ LK#Arath_tol3
    SAY ~Hush. I'm with you til the end if need be, <CHARNAME>. I... I'll stand by your side, your proud lover.~
    = ~You've showed me so much in the short time I've known you, and I... I can't ever repay you for that.~
    = ~Then again, you've also put me in mortal danger more times than I can count, so I guess it evens out in the end. (wink)~
    = ~Come on. Let's do this.~
    COPY_TRANS PLAYER1 33
  END
END

I_C_T INSPECT 13 LK#Arath_inspect
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Merciful gods.~
END

I_C_T JARLAXLE 0 LK#Arath_jarlaxle
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Are you telling me... actually, I'm not sure I want to think about that. (shudder)~
END

I_C_T KALAH2 11 LK#Arath_kalah
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~So you... how sad. I almost feel sorry for you.~
END

I_C_T LISSA 4 LK#Arath_lissa
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~What a despicable speck of a man. No, he doesn't even deserve to be a speck of a man. No child should suffer that.~
END

INTERJECT MESSEN 5 LK#Arath_messen
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~That's ridiculous. Why would druids attack Trademeet?~
EXTERN MESSEN 15

CHAIN IF WEIGHT #-1 ~See("Arath")
InParty("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
RandomNum(2,2)
Global("LK#Arath_murtlen","LOCALS",0)~ THEN MURTLEN LK#Arath_murtlen
  ~You!  Have you ever been cheated, here?  I bet ye have!~
  DO ~SetGlobal("LK#Arath_murtlen","LOCALS",1)~
  == LK#ARATJ ~Ah, that would be a no, I'm afraid. There was this one time across town where I was charged a few gold more than I should have, but it was more a convenience fee than anything else. And the fact that I accidentally broke the merchant's nose. A bit.~
EXIT

CHAIN IF WEIGHT #-1 ~See("Arath")
InParty("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
RandomNum(2,2)
Global("LK#Arath_noblew1","LOCALS",0)~ THEN NOBLEW1 LK#Arath_noblew1
  ~Your friend is quite the handsome one, isn't he? My, I have been without entertainment lately... perhaps I could interest him in a position with my house staff?~
  DO ~SetGlobal("LK#Arath_noblew1","LOCALS",1)~
  == LK#ARATJ ~As appealing as it is to go back into noble captivity, I'm afraid I have to decline.~
  == NOBLEW1 ~Well... if you ever change your mind.~
  == LK#ARATJ ~Not even if it was that or being violated with a cactus.~
  == NOBLEW1 ~My word!~
EXIT

CHAIN IF WEIGHT #-1 ~See("Arath")
InParty("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
RandomNum(2,2)
Global("LK#Arath_oriona","LOCALS",0)~ THEN ORIONA LK#Arath_oriona
  ~Now I could let you in on some delicious secrets of some of the most powerful men in Athkatla...but that would be telling, wouldn't it?~
  DO ~SetGlobal("LK#Arath_oriona","LOCALS",1)~
  == LK#ARATJ ~Lady Oriona. A pleasure.~
  == ORIONA ~Hmmm... now where do I know you from? You look terribly familiar...~
  == LK#ARATJ ~I only know you by reputation, I assure you. And while I'm sure you have many of Athkat's more... delectable morsels of gossip, from what I hear you've a fair amount whispered about you as well.~
  == ORIONA ~Lies and aspersions, all of it!~
  == LK#ARATJ ~I'm sure.~
EXIT

EXTEND_BOTTOM PIRMUR01 2
  IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ EXTERN LK#ARATJ LK#Arath_pirmur01
END

CHAIN LK#ARATJ LK#Arath_pirmur01
  ~Dead, as you'll soon be if you don't watch yourself. You can't just kill girls you're unhappy with! Apart from the fact you'll quickly run out of them in a place like this, it's just not done.~
EXTERN PIRMUR01 3

I_C_T YOSHJ 113 LK#Arath_yoshbetray
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~I... wow. I can't believe he'd do that to us! We played cards! He taught me how to cheat at it! And now he goes and cheats us?!~
END

INTERJECT Player1 3 LK#Arath_slayer1
  == LK#ARATJ IF ~InParty("Arath") !Global("AerieRomanceActive","GLOBAL",2) !Global("AnomenRomanceActive","GLOBAL",2) !Global("JaheiraRomanceActive","GLOBAL",2) !Global("ViconiaRomanceActive","GLOBAL",2) OR(2) Global("LK#ArathRomanceActive","GLOBAL",1)~ THEN
  ~Uh, <CHARNAME>? You don't look so great... if you're going to faint or something, let me know, okay? That way I can dramatically catch you in my arms and sweep you up in a romantic kiss.~
END
  ++ ~I'm fine. Let's keep moving.~ EXTERN LK#ARATJ LK#Arath_slayer1_1
  ++ ~I'm just feeling a bit dizzy, that's all. Nothing to worry about.~ EXTERN LK#ARATJ LK#Arath_slayer1_1
  ++ ~I did just have my soul torn out, so there's that.~ EXTERN LK#ARATJ LK#Arath_slayer1_2


APPEND LK#ARATJ
IF ~~ LK#Arath_slayer1_1
  SAY ~If you say so. You will tell me though, right? I don't want to miss an opportunity!~
  IF ~~ EXIT
END

IF ~~ LK#Arath_slayer1_2
  SAY ~Point taken. You will tell me though, right? I don't want to miss an opportunity!~
  IF ~~ EXIT
END
END

INTERJECT_COPY_TRANS Player1 5 LK#Arath_slayer2
  == LK#ARATJ IF ~InParty("Arath")~ THEN
  ~I don't mean to alarm you or anything, <CHARNAME>, but what the hells was that?! I really hope it was just some kind of obscure party trick... please let it be an obscure party trick.~
  = ~It's not a party trick, is it. (sigh)~
END

INTERJECT Player1 7 LK#Arath_slayer3
  == LK#ARATJ IF ~InParty("Arath") Global("LK#ArathRomanceActive","GLOBAL",1)~ THEN
  ~<CHARNAME>? I wasn't kidding with the catching thing. You know what, maybe I'll just... I'll be right here, okay?~
END
  ++ ~I'm feeling... really strange. Maybe it's best if you--~ DO ~SetGlobal("EndangerLovedOne","GLOBAL",454) ActionOverride(Player1,ReallyForceSpell(Myself,SLAYER_CHANGE))~ EXIT
  ++ ~I'd appreciate that. Oh, Arath--~ DO ~SetGlobal("EndangerLovedOne","GLOBAL",454) ActionOverride(Player1,ReallyForceSpell(Player1,SLAYER_CHANGE))~ EXIT
  ++ ~Will you hold me, Arath? I just feel...~ DO ~SetGlobal("EndangerLovedOne","GLOBAL",454) ActionOverride(Player1,ReallyForceSpell(Player1,SLAYER_CHANGE))~ EXIT

EXTEND_BOTTOM Player1 10
  IF ~OR(3) !InParty("Arath") Dead("Arath") StateCheck("Arath",CD_STATE_NOTVALID) Global("EndangerLovedOne","GLOBAL",454)~ THEN EXTERN Player1 12
END

INTERJECT Player1 10 LK#Arath_slayer4
  == LK#ARATJ IF ~InParty("Arath") Global("EndangerLovedOne","GLOBAL",454)~ THEN ~Okay. Okay. Don't freak out. Stay calm. Deep breaths. In, out. In, out.~
  = ~This isn't working. I just--I need some fresh air. Godsdamnit, why can't we be somewhere normal for once?!~
END
  ++ ~Arath? Can you calm down, please? You're not the only one who needs some air!~ EXTERN LK#ARATJ LK#Arath_slayer4_1
  ++ ~Nothing about me is normal. You knew that. I told you.~ EXTERN LK#ARATJ LK#Arath_slayer4_2
  ++ ~Have a bit of compassion, please?!~ EXTERN LK#ARATJ LK#Arath_slayer4_3
  ++ ~I need you to be focused right now. You need to snap out of it.~ EXTERN LK#ARATJ LK#Arath_slayer4_4

APPEND LK#ARATJ
IF ~~ LK#Arath_slayer4_1
  SAY ~Calm down?! You just... you just turned into some giant bloody death monster with claws! How do you expect me to be *calm*? You almost killed me!~
  IF ~~ + LK#Arath_slayer4_4
END

IF ~~ LK#Arath_slayer4_2
  SAY ~You didn't tell me you'd soon be turning into some giant bloody death monster with claws! You almost killed me, <CHARNAME>!~
  IF ~~ + LK#Arath_slayer4_4
END

IF ~~ LK#Arath_slayer4_3
  SAY ~Compassion?! You just turned into some giant bloody death monster with claws! Compassion is not what I should be feeling right now! You almost killed me!~
  IF ~~ + LK#Arath_slayer4_4
END

IF ~~ LK#Arath_slayer4_4
  SAY ~Okay. I just--this is a lot to handle right now. Sorry for shouting at you. Let's... let's just keep going.~
  IF ~~ EXIT
END
END

I_C_T POSTUL1 7 LK#Arath_postul1
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Trust me, you'd think differently if you knew what went on behind closed doors here.~
END

I_C_T PPDILI 2 LK#Arath_ppdili
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~That is disturbing on... so many levels.~
END

I_C_T PPIMOEN 2 LK#Arath_ppimoen
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~<CHARNAME>? I know this is... hard for you, but you need to consider--look. Just... take it easy with her, okay? Who knows what that mage has done to her.~
END

I_C_T PPIRENI2 35 LK#Arath_ppireni2
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID) Global("LK#ArathRomanceActive","GLOBAL",1)~ THEN ~You're going to pay for what you did to <CHARNAME>, you bastard!~
END

I_C_T PPSAEM2 1 LK#Arath_ppsaem2
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Well, you're not doing a terribly good job at being an ally!~
END

I_C_T RIFTG03 7 LK#Arath_riftg03
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN  ~This is just kind of... sad. I had no idea something like this could happen, but... I guess it makes sense.~
END

I_C_T SAHBEH01 7 LK#Arath_sahbeh01
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~It's alright, we feel suitably terrified. Or I do, at least. Pants are wet and everything.~
  == SAHBEH01 ~Excellent.~
END

I_C_T SAHPR1 1 LK#Arath_
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Sahuagin. I've read about them before... humanoids that are sort of a cross between a fish and a reptile. Except, you know, intelligent and deadly. I have to admit, though, I didn't know they... you know, spoke, had their own language.~
END

CHAIN IF WEIGHT #-1 ~See("Arath")
InParty("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
RandomNum(2,2)
Global("LK#Arath_salvanas","LOCALS",0)~ THEN SALVANAS LK#Arath_salvanas
  ~You're not, ah, really my type, I'm afraid. What with being... a man, and all.~
  DO ~SetGlobal("LK#Arath_salvanas","LOCALS",1)~
  == LK#ARATJ ~I may not be much of a maiden, Salvanas, but I'll give you one hell of a ride. (wink)~
  == SALVANAS ~Ah... no thanks. (gulp)~
EXIT

I_C_T SBWENCH 4 LK#Arath_sbwench
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Apple blossom elven wine? I've heard that's very hard to come by...~
  == SBWENCH ~Yes, it is. Which is why I want to keep it out of your grubby hands.~
  = ~Ah. No offense meant.~
  == LK#ARATJ ~None taken. If I had any, I'd feel much the same way!~
END

I_C_T SUDEMIN 23 LK#Arath_
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Gods. Severed? But...~
  = ~This is starting to make sense. And I'm not sure if either side is right. What you did to him...~
END

I_C_T SUAVATAR 5 LK#Arath_
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Well, I can't say I didn't see that coming. Well, maybe not the whole god thing, but... the whole seeking-power-for-himself thing. I guess divinity is about as much power as you could ever hope for, so...~
END

I_C_T TIRDIR 2 LK#Arath_tirdir
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~They *buried you alive*? Nice. Really nice.~
END

I_C_T TREVIL01 5 LK#Arath_trevil01
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Ah. They've got enough land of their own. Trust me. And your land is, well, kind of populated. Not what druids generally go for.~
END

I_C_T TREVIL01 16 LK#Arath_trevil012
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~Good. You deserved whatever they did to you, and worse. Bastard.~
END

I_C_T TREVIL01 24 LK#Arath_trevil013
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~You're insane. You cannot be listening to this, <CHARNAME>. He'll destroy the entire grove!~
END

EXTEND_BOTTOM TRGYP02 2
  IF ~!InPartySlot(LastTalkedToBy,0) Name("Arath",LastTalkedToBy)~ EXTERN TRGYP02 LK#Arath_trgyp02_1
END

CHAIN TRGYP02 LK#Arath_trgyp02_1
  ~The actions of your past haunt you, despite your attempts to forget. In order to move forward, you must come to terms with yourself, your actions and your inner conflicts.~
  == LK#ARATJ ~I... thank you, I guess. But I'm not sure if I *have* any deep inner conflicts, really. I mean, apart from my indecision over whether I like strawberries or blueberries more.~
EXIT

I_C_T UDPHAE01 10 LK#Arath_
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~I think I like this one, <CHARNAME>. She's definitely got a mouth on her, that's for sure. (grin)~
END

I_C_T UDSOLA01 1 LK#Arath_
  == LK#ARATJ IF ~InParty("Arath") !StateCheck("Arath",CD_STATE_NOTVALID)~ THEN ~(whisper) "Welcome to Ust Natha! We hope you have a wonderful time here. Don't forget to check out the hot springs and famous culinary delights while you're here!"~
END


// ***********************
//                       *
//     Bodhinapping      *
//                       *
// ***********************

BEGIN LK#ARVMP

// bodhinapping--when Bodhi says she's snatching Dace(BOHDIAMB)
ADD_TRANS_TRIGGER BODHIAMB 5 ~OR(2) !InParty("Arath") !Global("LK#ArathRomanceActive","GLOBAL",2)~ DO 0

INTERJECT BODHIAMB 5 LK#ArathBodhiAbduct
  == BODHIAMB IF ~Global("LK#ArathRomanceActive","GLOBAL",2) InParty("Arath")~ THEN
  ~You follow in the hopes of retrieving something dear to you. I say that the longer you keep this up, the more you will lose.~
END
  IF ~OR(2) !InPartyAllowDead("Arath") Dead("Arath")~ EXTERN BODHIAMB 6
  IF ~InPartyAllowDead("Arath") !Dead("Arath")~ EXTERN BODHIAMB LK#ArathBodhiAbduct_1
  
CHAIN BODHIAMB LK#ArathBodhiAbduct_1
  ~Take handsome Arath here. From what I understand, the two of you have developed quite the relationship since I last saw you. It's so difficult when you lose someone dear to you, isn't it?~
  == LK#ARATJ ~<CHARNAME>, what is she--~
END
  IF ~~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("lk#arct1")~
  UNSOLVED_JOURNAL ~The Final Battle with Bodhi.

Bodhi appeared in an ambush shortly before I reached her haven, warning me that she was aware of my pursuit and stealing from me the one person that is dearest to my heart: Arath.  Before she vanished and unleashed more of her undead creations upon me, Bodhi warned me that if I continue I will lose even more than I thought possible.  I cannot give up on the Rhynn Lanthorn... but now the life and immortal soul of Arath is at stake, as well!~ EXIT

// Bodhi section 2
ADD_TRANS_TRIGGER C6BODHI 21 ~!Global("LK#ArathVampire","GLOBAL",2)~ DO 0

INTERJECT C6BODHI 21 LK#ArathBodhi_1
  == C6BODHI IF ~Global("LK#ArathVampire","GLOBAL",2)~ THEN
  ~But... no, I have already prepared much for this meeting, <CHARNAME>. I did warn you that you would suffer great loss if you continued your push towards me.  I did not lie.~
END
  ++ ~You have taken too much already!  You will return both Imoen's soul and Arath!~ EXTERN C6BODHI LK#ArathBodhi_2
  ++ ~And you have delivered on that promise.  Return Arath and perhaps I will be merciful.~ EXTERN C6BODHI LK#ArathBodhi_2
  ++ ~I would have hunted you for your theft of Arath alone.  He is very important to me.~ EXTERN C6BODHI LK#ArathBodhi_2
  ++ ~You place too much confidence in sentiment.  The theft of Arath will not save you.~ EXTERN C6BODHI LK#ArathBodhi_3


APPEND C6BODHI

IF ~~ LK#ArathBodhi_2
SAY ~He is lost to you, <CHARNAME>.  Arath was quite receptive to my discipline.  I doubt your fumbling could have inspired the loyalty I have taken with a bite and a gaze.~
IF ~~ DO ~AddJournalEntry(%The Final Battle with Bodhi.

Bodhi has turned Arath into a vampire!  Or... or very nearly.  The process may not have been completed in the short time Bodhi has had him.  Hopefully something can be done or I will have lost him.  Perhaps the elven war sage might know some way of restoration... or Elhan...%,QUEST)~ EXTERN LK#ARVMP LK#ArathBodhi_4
END

IF ~~ LK#ArathBodhi_3
  SAY ~An interesting ploy, though I am sure his fate will still serve as an example, whether you wish her back or not.~
  IF ~~ + LK#ArathBodhi_2
END
                                                                                                                          
END

CHAIN LK#ARVMP LK#ArathBodhi_4
  ~As you wish, Mistress Bodhi.~
  == C6BODHI ~Don't you see, <CHARNAME>?  He is not even fully turned and he has betrayed you.  Prepare to die at your lover's hand!~
EXTERN C6BODHI 28


// Normal new options...
EXTEND_BOTTOM C6ELHAN2 70
  + ~PartyHasItem("LK#ARBDY")~ + ~Elhan!  I've the half vampire body of Arath here because of you!  You'll tell me now!~ GOTO 76
END

EXTEND_BOTTOM DOGHMA 0 #5
  + ~Global("RevealUmar","GLOBAL",1) PartyHasItem("LK#ARBDY")~ + ~A friend is afflicted by vampirism.  An old book suggested that followers of Oghma might know something about that.~ GOTO 10
END

EXTEND_BOTTOM DOGHMA 3 7 9 #4
  + ~Global("RevealUmar","GLOBAL",1) PartyHasItem("LK#ARBDY")~ + ~A friend is afflicted by vampirism.  An old book suggested that followers of Oghma might know something about that.~ GOTO 10
END

EXTEND_BOTTOM IMNBOOK1 0
  + ~Global("RevealUmar","GLOBAL",1) PartyHasItem("LK#ARBDY")~ + ~I'm looking for information about a tome that details the curing of Vampirism.~ GOTO 4
END

ADD_STATE_TRIGGER OGHMONK1 0 ~!PartyHasItem("LK#ARBDY")~ 1 2 3


// Appending Oghmanite's dialogue
APPEND OGHMONK1
IF WEIGHT #-1 ~Global("RevealUmar","GLOBAL",1) PartyHasItem("LK#ARBDY")~ LK#Arath_oghma
  SAY ~Have you come seeking wisdom from the Binder of What is Known? The Wise God stands ready.~
  ++ ~No, thank you, I have no need of help at the moment.~ + 5
  ++ ~A friend is afflicted by vampirism.  An old book suggested that followers of Oghma might know something about that.~ + 6
END
END

// New Demin option
EXTEND_BOTTOM SUDEMIN 2
  + ~PartyHasItem("LK#ARBDY")~ + ~I lost a dear one in a battle with his sister, Bodhi.  I seek a means of curing him.~ GOTO 3
END

EXTEND_BOTTOM WARSAGE 0
  + ~!Dead("c6bodhi") Global("LK#ArathVampire","GLOBAL",2)~ + ~A dear one was taken by a vampire. What can I expect when I find him?~ GOTO 6
  + ~PartyHasItem("LK#ARBDY")~ + ~Someone I care about has fallen to a vampire. Is there any way to save him?~ GOTO 5
END

// ***********************
//                       *
//         QUEST         *
//                       *
// ***********************


// Arath's quest, chapter 6
BEGIN LK#ARMES

// Messenger; 10 minutes post-Underdark
CHAIN IF ~NumTimesTalkedTo(0)~ THEN LK#ARMES t1
  ~Are you Arath Duskhelm?~
  == LK#ARATJ ~Yes? Why?~
  == LK#ARMES ~I have a message for you from Archdruid Wreimasss. She requests your presence at the Druid Grove outside of Trademeet. She has an important task for you.~
  == LK#ARATJ ~She didn't happen to tell you what that task was, did she?~
  == LK#ARMES ~No sir, that was the message in full.~
  == LK#ARATJ ~Thank you.~
  DO ~SetGlobal("LK#ArathQuest","GLOBAL",3) ActionOverride("LK#ARMES",EscapeAreaDestroy(1))~
EXIT

APPEND LK#ARATJ

IF ~Global("LK#ArathQuest","GLOBAL",3) Global("LK#ArathQuestReminder","GLOBAL",0)~ t1.1
  SAY ~<CHARNAME>? I wouldn't ask if I didn't think it was important.~
  ++ ~We can spare some time. We'll go there now.~ + t1.2
  ++ ~We're a little busy right now, can it wait a few days?~ + t1.3
  ++ ~Can't you deal with this yourself?~ + t1.4
  ++ ~We're too busy for this, Arath.~ + t1.5
END

IF ~~ t1.2
  SAY ~Good. We may as well get it out of the way sooner rather than later.~
  IF ~~ + t1.3
END

IF ~~ t1.3
  SAY ~As I recall, the Archdruid doesn't mind waiting... I've heard stories she waited twenty years for a flower to bloom, once. Still, she wouldn't have sent someone if it wasn't urgent, so we shouldn't keep her waiting too long.~
  IF ~~ DO ~SetGlobal("LK#ArathQuestReminder","GLOBAL",1) RealSetGlobalTimer("LK#ArathQuestReminderTimer","GLOBAL",1800) AddJournalEntry(%Mining for Trouble

We received a message from the Archdruid of Arath's grove asking to meet us at the Druid Grove outside of Trademeet. Arath mentioned it must be relatively urgent for the Archdruid to send a messenger.%,QUEST)~ EXIT
END

IF ~~ t1.4
  SAY ~I suppose. I mean, I'd rather not, but...~
  ++ ~I would prefer if you could go by yourself. We can spare you for a few days.~ + t1.6
  ++ ~Fine, we'll go do it now.~ + t1.2
  ++ ~Alright. We'll do it as soon as we can.~ + t1.3
END

IF ~~ t1.5
  SAY ~If you won't go with me, I'll have to go myself. She's the Archdruid, I can't just ignore her summons.~
  ++ ~Then that's what you're going to have to do.~ + t1.6
  ++ ~Fine, we'll go do it now.~ + t1.2
  ++ ~Alright. We'll do it as soon as we can.~ + t1.3
  ++ ~Deal with your own problems.~ + t1.6
END

IF ~~ t1.6
  SAY ~Fine. If you change your mind, I'll be outside the Druid Grove nearby Trademeet.~
  = ~I know you had no obligation to help me, but this is a low move, <CHARNAME>.~
  = ~Be seeing you.~
  IF ~~ DO ~SetGlobal("LK#ArathQuestReminder","GLOBAL",1) SetGlobal("LK#ArathJoined","LOCALS",0) LeaveParty() EscapeAreaMove("AR1901",919,485,0) AddJournalEntry(%Mining for Trouble

We received a message from the Archdruid of Arath's grove asking to meet us at the Druid Grove outside of Trademeet. Arath mentioned it must be relatively urgent for the Archdruid to send a messenger. I told him to handle it himself. He said he would be waiting at the Druid Grove if I changed my mind.%,QUEST)~ EXIT
END

// Reminder 1
IF ~Global("LK#ArathQuestReminder","GLOBAL",2)~ t1.7
  SAY ~I don't mean to bug you, <CHARNAME>, but it's been a while. We should really go and talk to the Archdruid at the grove.~
  = ~I can only wait so long. I'll go by myself if I have to.~
  ++ ~You won't. We're going now.~ + t1.8
  ++ ~I haven't forgotten. We're going soon.~ + t1.9
  ++ ~You might have to.~ + t1.6
END

IF ~~ t1.8
  SAY ~I'd appreciate it. She wouldn't have sent a messenger if it wasn't urgent.~
  IF ~~ DO ~SetGlobal("LK#ArathQuestReminder","GLOBAL",3) RealSetGlobalTimer("LK#ArathQuestReminderTimer","GLOBAL",1800)~ EXIT
END

IF ~~ t1.9
  SAY ~Sooner is better. She wouldn't have sent a messenger if it wasn't urgent.~
  IF ~~ DO ~SetGlobal("LK#ArathQuestReminder","GLOBAL",3) RealSetGlobalTimer("LK#ArathQuestReminderTimer","GLOBAL",1800)~ EXIT
END

// Reminder 2
IF ~Global("LK#ArathQuestReminder","GLOBAL",4)~ t1.10
  SAY ~I have to go to the grove. I'm sorry, <CHARNAME>, but you've ignored my repeated requests, so...~
  = ~I know you had no obligation to help me, but this is a low move, <CHARNAME>.~
  = ~Be seeing you.~
  IF ~~ DO ~SetGlobal("LK#ArathQuestWaiting","GLOBAL",1) SetGlobal("LK#ArathQuestReminder","GLOBAL",5) SetGlobal("LK#ArathJoined","LOCALS",0) LeaveParty() EscapeAreaMove("AR1901",919,485,0) AddJournalEntry(%Mining for Trouble

Arath has left, I assume to deal with his grove's problem on his own. He mentioned that if I wanted to help, he could be found at the Druid Grove.%,QUEST)~ EXIT
END 

END


// Archdruid Wreimass
BEGIN LK#ARWRE

CHAIN IF ~InParty("Arath") Global("LK#ArathQuest","GLOBAL",3)~ THEN LK#ARWRE t2
  ~Arath! You're late.~
  == LK#ARATJ ~(sigh) Yes, Archdruid.~
  == LK#ARWRE ~We've got something of a situation developing at home.~
  == LK#ARATJ ~A... situation? What do you mean?~
  == LK#ARWRE ~The grove is dying.~
  == LK#ARATJ ~The grove is--what? How could it be dying? It's a blessed grove!~
  == LK#ARWRE ~Something is going on nearby, in one of the abandoned mines. It's no longer abandoned, I'm afraid.~
  == LK#ARATJ ~Gods. The quicksilver mines.~
  == LK#ARWRE ~Yes. Sometimes I wonder how you ever passed the rites, boy.~
  == LK#ARATJ ~It's a mystery to us all. Alright. What do you want me--us--to do?~
  == LK#ARWRE ~Your friends. Can they be trusted?~
  == LK#ARATJ ~Yes.~
  = ~This is <CHARNAME>. <PRO_HESHE> is the leader of our group.~
  == LK#ARWRE ~Can you be trusted?~
END
  ++ ~I'd like to think so.~ EXTERN LK#ARWRE t2.1
  ++ ~Absolutely not, in my experience.~ EXTERN LK#ARWRE t2.2
  ++ ~Just tell me what you want us to do.~ EXTERN LK#ARWRE t2.3
  ++ ~Do I look like I can be trusted?~ EXTERN LK#ARWRE t2.3
  
APPEND LK#ARWRE

// If Arath is not in party
IF ~!InParty("Arath") Global("LK#ArathQuest","GLOBAL",3)~ t2.0
  SAY ~I'm waiting for someone. Excuse me.~
  IF ~~ EXIT
END

// and now back to our scheduled programming
IF ~~ t2.1
  SAY ~I suppose we don't have much choice in the matter, in any case.~
  IF ~~ + t2.3
END

IF ~~ t2.2
  SAY ~I suppose you'll have to do. We don't have much choice.~
  IF ~~ + t2.3
END

IF ~~ t2.3
  SAY ~I'll be short with you. Our grove is being poisoned by a local mining operation. We need it stopped, or our grove may die.~
  ++ ~Who's behind the operation?~ + t2.4
  ++ ~How is it being poisoned?~ + t2.5
  ++ ~What about payment?~ + t2.6
  ++ ~Why should I care?~ + t2.7
  ++ ~What do you want us to do?~ + t2.8
END

IF ~~ t2.4
  SAY ~I'm not a fortuneteller, I'm a druid. All I know is that it's a mine, and our grove is gravely ill.~
  ++ ~How is it being poisoned?~ + t2.5
  ++ ~What about payment?~ + t2.6
  ++ ~Why should I care?~ + t2.7
  ++ ~What do you want us to do?~ + t2.8
END

IF ~~ t2.5
  SAY ~We're not sure. It's not the mining itself, it's whatever they do to what they mine after it's been mined. It's draining into our creeks.~
  ++ ~Who's behind the operation?~ + t2.4
  ++ ~What about payment?~ + t2.6
  ++ ~Why should I care?~ + t2.7
  ++ ~What do you want us to do?~ + t2.8
END

IF ~~ t2.6
  SAY ~Payment?~
  = ~Fine. You will be... rewarded for your time.~
  ++ ~Who's behind the operation?~ + t2.4
  ++ ~How is it being poisoned?~ + t2.5
  ++ ~Why should I care?~ + t2.7
  ++ ~What do you want us to do?~ + t2.8
END

IF ~~ t2.7
  SAY ~Because it is the right thing to do, and because thousands of creatures and plants including some that are many thousands of years old will die if you do not.~
  = ~Arath, I am not accustomed to this questioning. Who is this insolent child to speak to me this way?~
  IF ~~ EXTERN LK#ARATJ t2.9
END

IF ~~ t2.8
  SAY ~Find out who is behind this travesty and put a stop to it.~
  IF ~~ EXTERN LK#ARATJ t2.10
END

IF ~~ t2.11
  SAY ~There are many abandoned mines nearby! It could be any of them. Your job is to find it and put a stop to it.~
  IF ~~ + t2.12
END

IF ~~ t2.12
  SAY ~We have a contact in Athkatla who may know the location, or at least be able to put you on the right track. Find him in the Copper Coronet.~
  IF ~~ EXTERN LK#ARATJ t2.14
END

END

CHAIN LK#ARATJ t2.9
  ~It's... a long story, Archdruid.~
  == LK#ARWRE ~I'm sure it is. They usually are with you.~
  = ~Did you have any further questions?~
END
  ++ ~Who's behind the operation?~ EXTERN LK#ARWRE t2.4
  ++ ~How is it being poisoned?~ EXTERN LK#ARWRE t2.5
  ++ ~What about payment?~ EXTERN LK#ARWRE t2.6
  ++ ~What do you want us to do?~ EXTERN LK#ARWRE t2.8

CHAIN LK#ARATJ t2.10
  ~And how do you propose we do that, Archdruid? Knock on their door and ask them to keep it down because the kids are trying to sleep?~
  == LK#ARWRE ~If that will get the job done. Deal with it however you like.~
  = ~There is one minor problem, however. We do not know exactly where the mine is located.~
END
  ++ ~You don't know where the mine *is*? How do you expect me to stop them, then?~ EXTERN LK#ARWRE t2.11
  ++ ~How can I find out?~ EXTERN LK#ARWRE t2.12
  ++ ~Fat lot of help you are!~ EXTERN LK#ARATJ t2.13
  
CHAIN LK#ARATJ t2.13
  ~By which I'm sure <CHARNAME> meant, how do you suggest we locate the mine?~
  == LK#ARWRE ~Hmph. Yes, I am *sure* that is what <PRO_HESHE> meant.~
EXTERN LK#ARWRE t2.12

CHAIN LK#ARATJ t2.14
  ~Does this contact have a name, o wise one?~
  == LK#ARWRE ~You may have passed the rites, whelpling, but that does not give you the right to ridicule your betters.~
  == LK#ARATJ ~Ah... yes, ma'am.~
  == LK#ARWRE ~His name is Hendak. I believe you have met him before.~
  == LK#ARATJ ~Met him? We helped him escape!~
  == LK#ARWRE ~I seem to recall that was mentioned. He has proved an excellent source of information on the more... shady side of Athkatla to many. You are to be commended.~
  == LK#ARATJ ~I try.~
END
  ++ ~I hate to interrupt your little catchup session, but was there anything else?~ EXTERN LK#ARWRE t2.15
  ++ ~I'd like to point out that it was me who killed Lehtinan and freed the slaves, not Arath.~ EXTERN LK#ARATJ t2.16a
  ++ ~Was there anything else we need to know?~ EXTERN LK#ARWRE t2.15

CHAIN LK#ARWRE t2.15
  ~Hendak believes it to be an illegal mining operation.~
  == LK#ARATJ ~An illegal mining operation? But--~
  == LK#ARWRE ~I do not know anything further. Question Hendak, not me.~
  == LK#ARATJ ~Thank you, Archdruid. We'll see what we can do.~
  == LK#ARWRE ~You know, sometimes I miss your face around the grove. Then I see you for five minutes and remember why you left.~
  == LK#ARATJ ~Thanks, Ellen. Appreciated.~
  == LK#ARWRE ~Anytime, dear.~
  == LK#ARATJ ~Come on <CHARNAME>, let's get out of here. We've got a mine to shut down, apparently.~
  DO ~SetGlobal("LK#ArathQuest","GLOBAL",4) AddJournalEntry(%Mining for Trouble

We have met with the Archdruid, who has tasked us with investigating what she believes to be an illegal mining operation that is poisoning the grove. She suggested we speak with Hendak in Athkatla to find out more.%,QUEST)~
EXIT

CHAIN LK#ARATJ t2.16a
  ~<CHARNAME> helped.~
  == LK#ARWRE ~Yes, I'm sure.~
  = ~There is one last thing.~
EXTERN LK#ARWRE t2.15

// Outside grove
APPEND LK#ARATJ 

IF ~Global("LK#ArathQuest","GLOBAL",4)~ t2.16
  SAY ~I'm sorry you had to get dragged into taking care of my responsibilities.~
  = ~And for Wreimass. She's a pain, but she's a good Archdruid, and she means well. She's just a bit... hard to warm up to.~
  ++ ~Don't worry about it, Arath.~ + t2.17
  ++ ~She's a cow. I don't know how you could put up with her.~ + t2.18
  ++ ~You owe me for this, Arath.~ + t2.19
  ++ ~Come on. Let's get this done.~ + t2.20
END

IF ~~ t2.17
  SAY ~I think she liked you, personally. She's usually far more abrupt.~
  IF ~~ + t2.20
END

IF ~~ t2.18
  SAY ~Oh, I don't know if I would...~
  = ~Yeah, okay, she's a cow. But that's not all she is.~
  IF ~~ + t2.17
END

IF ~~ t2.19
  SAY ~The list of things I owe you for is becoming uncomfortably long. Ugh.~
  IF ~~ + t2.20
END

IF ~~ t2.20
  SAY ~Alright. Hendak awaits. Let's not keep him waiting too long.~
  IF ~~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",5)~ EXIT
END

END

EXTEND_TOP HENDAK 33 #0
  + ~Global("LK#ArathQuest","GLOBAL",5)~ + ~Hendak, we were sent by Archdruid Wreimass. What can you tell us?~ + t3.1
  + ~Global("LK#ArathQuest","GLOBAL",6)~ + ~What happened to the building the slavers worked out of, Hendak? I'd like a little warning if I'm going to meet opposition there.~ + t5.1
  + ~GlobalGT("LK#ArathQuest","GLOBAL",7) Global("LK#ArathQuestQuicksilver","GLOBAL",0)~ + ~I've come across a store of quicksilver. Would you be interested in helping me sell it?~ + t7.1
  + ~GlobalGT("LK#ArathQuest","GLOBAL",7) Global("LK#ArathQuestQuicksilver","GLOBAL",0)~ + ~I've come across a store of quicksilver. I want to give it to you. You can sell it and use the funds to continue helping the people here.~ + t7.2
END

APPEND HENDAK

IF ~~ t3.1
  SAY ~Since you helped us to escape Lehtinan's grasp and take the Coronet, I have done my best to keep my ear to the ground in the hope that I could monitor the slave trade here in Athkatla. They have kept very quiet, suspiciously so, until several weeks ago.~
  ++ ~What happened several weeks ago?~ + t3.2
  ++ ~How does this relate to the poisoned grove?~ + t3.2
  ++ ~What do you mean, you've kept your ear to the ground?~ + t3.3
  ++ ~Just tell me what I need to know.~ + t3.2
END

IF ~~ t3.2
  SAY ~Three weeks ago, several large, unidentified ships passed through the docks. The authorities seemed to ignore it as it nothing happened, but my sources tell me there was human cargo aboard.~
  = ~From what I can piece together, a large amount of slaves were shipped into Athkatla. The next day, they were no longer here.~
  ++ ~What happened to them?~ + t3.4
  ++ ~How do you know?~ + t3.5
  ++ ~Where did they go?~ + t3.4
  ++ ~And what does this have to do with the grove, exactly?~ + t3.6
END

IF ~~ t3.3
  SAY ~Since I took over here, I have spent a great deal of effort to learn who to talk to and what to ask. The gold that lined Lehtinan's chests helped.~
  IF ~~ + t3.2
END

IF ~~ t3.4
  SAY ~I am not exactly sure where they went, but I have my suspicions.~
  ++ ~How does this fit in with the poisoning of the druid grove?~ + t3.6
  ++ ~What do you think happened?~ + t3.6
  ++ ~Who do I need to kill this time?~ + t3.7
END

IF ~~ t3.5
  SAY ~Officially, they never existed, but everywhere I had my sources look was empty. Not every place was checked, but... I am certain. They are no longer within Athkatlan walls.~
  ++ ~So where are they, then?~ + t3.4
  ++ ~Any idea what might have happened~ + t3.6
  ++ ~Just tell me who I need to kill this time.~ + t3.7
END

IF ~~ t3.6
  SAY ~I suspect these slaves have been taken to work at the mine the Archdruid is so worried about. I thought they were unrelated incidents in the beginning, but...~
  = ~The more I think on it, the more sense it seems to make. The two events must be linked.~
  ++ ~What do you suggest I do?~ + t3.8
  ++ ~Who do you think is behind it?~ + t3.9
  ++ ~Sounds unlikely to me.~ + t3.10
END

IF ~~ t3.7
  SAY ~Hah! I admire your zeal, <CHARNAME>. It reminds me of myself, many years ago.~
  IF ~~ + t3.6
END

IF ~~ t3.8
  SAY ~What you do is your choice, but I would start by talking to Magistrate Bylanna. If there is an illegal mining operation run by slavers nearby, she might know something. The Athkatlan guard may be conveniently deaf and dumb at certain times, but stupid they are not.~
  ++ ~Thank you, Hendak.~ + t3.11
  ++ ~Was there anything else?~ + t3.12
  ++ ~I'll let you know if I find anything.~ + t3.13
  ++ ~I have to go.~ + t3.14
END

IF ~~ t3.9
  SAY ~I do not know, my friend. It must be someone with power here in Athkatla; no mere peasant could make the Athkatlan Guard turn a blind eye.~
  IF ~~ + t3.8
END

IF ~~ t3.10
  SAY ~Unlikely it may be, but it is remarkably coincidental. I may be wrong, but I do not think so.~
  IF ~~ + t3.8
END

IF ~~ t3.11
  SAY ~Nay, my friend, it is thanks to you that I am alive today. You are the one who deserves thanks. Good luck.~
  IF ~~ DO ~AddJournalEntry(%Mining for Trouble

We have spoken with Hendak, who has informed us a shipment of slaves came into Athkatla three weeks ago. He believes these slaves may have been taken to work at the mine polluting the grove. He suggested we speak with Magistrate Bylanna in the Government district, saying that if there was an illegal mining operation occuring, she might know something useful.%,QUEST)~ EXIT
END

IF ~~ t3.12
  SAY ~That is all I have, I am afraid. Good luck.~
  IF ~~ DO ~AddJournalEntry(%Mining for Trouble

We have spoken with Hendak, who has informed us a shipment of slaves came into Athkatla three weeks ago. He believes these slaves may have been taken to work at the mine polluting the grove. He suggested we speak with Magistrate Bylanna in the Government district, saying that if there was an illegal mining operation occuring, she might know something useful.%,QUEST)~ EXIT
END

IF ~~ t3.13
  SAY ~I would appreciate it. Good luck.~
  IF ~~ DO ~AddJournalEntry(%Mining for Trouble

We have spoken with Hendak, who has informed us a shipment of slaves came into Athkatla three weeks ago. He believes these slaves may have been taken to work at the mine polluting the grove. He suggested we speak with Magistrate Bylanna in the Government district, saying that if there was an illegal mining operation occuring, she might know something useful.%,QUEST)~ EXIT
END

IF ~~ t3.14
  SAY ~Good luck.~
  IF ~~ DO ~AddJournalEntry(%Mining for Trouble

We have spoken with Hendak, who has informed us a shipment of slaves came into Athkatla three weeks ago. He believes these slaves may have been taken to work at the mine polluting the grove. He suggested we speak with Magistrate Bylanna in the Government district, saying that if there was an illegal mining operation occuring, she might know something useful.%,QUEST)~ EXIT
END

IF ~~ t7.1
  SAY ~Quicksilver? That may be a little difficult to find buyers for, but... I shall see what I can do. I will contact you when it has been sold with a good share of the profit.~
  = ~Thank you, <CHARNAME>.~
  IF ~~ DO ~SetGlobal("LK#ArathQuestQuicksilver","GLOBAL",1)~ EXIT
END

IF ~~ t7.2
  SAY ~Quicksilver? That may be a little difficult to find buyers for, but... I shall see what I can do. Thank you, <CHARNAME>. The money will go to good use.~
  IF ~~ DO ~SetGlobal("LK#ArathQuestQuicksilver","GLOBAL",2)~ EXIT
END

END

// Informing Hendak
CHAIN HENDAK t5.1
  ~There has been no activity there, if that's what you are trying to discover. Though it has been useful to leave certain channels open, I will not deal with slavers.~
  = ~Thank you for letting me know, <CHARNAME>. I wish you the best of luck in finding something of use.~
EXIT

EXTEND_TOP BYLANNA 5 #1
  + ~Global("LK#ArathQuest","GLOBAL",8)~ + ~We investigated the old slaver stockade and found these documents, detailing an operation much like the one we're facing.~ + t13.3
  + ~Global("LK#ArathQuest","GLOBAL",5)~ + ~Have you heard anything about an illegal mining operation running nearby?~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",6)~ + t4.1
  + ~GlobalGT("LK#ArathQuest","GLOBAL",7) Global("LK#ArathQuestQuicksilver","GLOBAL",0)~ + ~In my investigation of the slave ring I came across a stockpile of quicksilver in the old slaver warehouse.~ + t7.4
  + ~GlobalGT("LK#ArathQuest","GLOBAL",10) Global("LK#ArathBylanna","LOCALS",0)~ + ~We've shut down the mine, and killed the slavers. It's over.~ + t13
END

APPEND BYLANNA

IF ~~ t4.1
  SAY ~How did you know about that? Where did you get that information?~
  ++ ~I'm an adventurer. It's my job to know these things, ma'am.~ + t4.2
  ++ ~I've been tasked by a local Archdruid to stop it.~ + t4.2
  ++ ~I have heard rumors about it.~ + t4.2
  ++ ~Hendak in the Copper Coronet mentioned it.~ + t4.4
END

IF ~~ t4.2
  SAY ~I see.~
  IF ~~ + t4.3
END

IF ~~ t4.3
  SAY ~There have indeed been reports of an illegal mining operation running nearby Athkatlan walls. I have been told it is related to an influx of quicksilver into the black market here.~
  = ~What do you know about it? I have had several of my people attempt to ascertain its location, but none have been successful.~
  ++ ~I was hoping you would be able to tell me.~ + t4.5
  ++ ~I don't know any more than you do.~ + t4.5
  ++ ~Aren't you people supposed to be intelligence experts?~ + t4.5
  ++ ~I know it is being run by slavers, if that helps.~ + t4.6
END

IF ~~ t4.4
  SAY ~Hm. I shall have to have him watched. Someone with this sort of information cannot have gained it through legal means.~
  IF ~~ + t4.3
END

IF ~~ t4.5
  SAY ~As I recall, you were involved in the death of Lehtinan, original proprietor of the Copper Coronet and local slaver. Despite what I imagine to be your good intent, in killing him you have caused us any number of troubles.~
  = ~Lehtinan was far too confident, and often let slip extremely useful intelligence on the Shadow Thieves, the local slave trade and much more.~
  = ~With his death, you removed that source, and we must now attempt to deal with less than honorable types in order to discover that which we need to know.~
  = ~I am afraid I cannot help you. There is nothing I can tell you other than what I am sure you already know. However... I do have a suggestion.~
  ++ ~What is it you suggest?~ + t4.7
  ++ ~Oh gods, here we go.~ + t4.7
  ++ ~I don't need your suggestions.~ + t4.8
END

IF ~~ t4.6
  SAY ~That does not surprise me, though it was not something I knew. Thank you.~
  IF ~~ + t4.5
END

IF ~~ t4.7
  SAY ~You were the one who destroyed the slaver ring Lehtinan was involved with. You may have access to their original base of operations, and most importantly, their records.~
  = ~I would send men of my own, but... Perhaps you should return there, and determine if this new situation is related in some way to the previous one.~
  = ~Report to me if you discover anything.~
  ++ ~I will as soon as I do.~ + t4.9
  ++ ~And vice versa, please.~ + t4.12
  ++ ~Why should I?~ + t4.10
  ++ ~Not bloody likely.~ + t4.11
END

IF ~~ t4.8
  SAY ~You would do well to listen to me, <PRO_GIRLBOY>. I have had many more years of experience at this than you.~
  IF ~~ + t4.7
END

IF ~~ t4.9
  SAY ~Excellent. Now, I have other things to attend to. Excuse me.~
  IF ~~ EXIT
END

IF ~~ t4.10
  SAY ~Because I am a magistrate, and I have overlooked many of your transgressions during your time here in Amn. You owe me this much.~
  IF ~~ + t4.13
END

IF ~~ t4.11
  SAY ~That is your prerogative, but you would do well to have a friend here, <CHARNAME>. I have overlooked many of your transgressions during your time here in Amn, but if you do not cooperate, that may change.~
  IF ~~ + t4.13
END

IF ~~ t4.12
  SAY ~Of course.~
  IF ~~ + t4.13
END
  
IF ~~ t4.13
  SAY ~Now, if you'll excuse me, I have other things to attend to.~
  IF ~~ DO ~AddJournalEntry(%Mining for Trouble

Unfortunately Bylanna did not know anything much about the mining operation, except to confirm that it existed and was being investigated. Given our initial destruction of the slavers in Athkatla, she has tasked us to return to the slaver stockade to see if we can find anything useful, and report back once we have done so.%,QUEST)~ EXIT
END

IF ~~ t7.4
  SAY ~Thank you for bringing it to my attention. I will ensure it gets confiscated and dealt with appropriately.~
  ++ ~Anything I can do to help.~ DO ~SetGlobal("LK#ArathQuestQuicksilver","GLOBAL",4)~ + t7.5
  ++ ~Is there anything new you've discovered about the case?~ DO ~SetGlobal("LK#ArathQuestQuicksilver","GLOBAL",4)~ + t7.7
  ++ ~Where's my reward?~ + t7.6
END

IF ~~ t7.5
  SAY ~Excuse me.~
  IF ~~ EXIT
END

IF ~~ t7.6
  SAY ~Reward? This is government business, <CHARNAME>. There are no rewards.~
  ++ ~Then I will take the quicksilver elsewhere.~ + t7.8
  ++ ~That's... disappointing, to say the least.~ DO ~SetGlobal("LK#ArathQuestQuicksilver","GLOBAL",4)~ + t7.9
  ++ ~Fine. Well, I'm glad I could help.~ DO ~SetGlobal("LK#ArathQuestQuicksilver","GLOBAL",4)~ + t7.5
END

IF ~~ t7.7
  SAY ~Nothing new, I'm afraid. Excuse me.~
  IF ~~ EXIT
END

IF ~~ t7.8
  SAY ~Do that and you will regret it.~
  ++ ~Fine. You take it.~ DO ~SetGlobal("LK#ArathQuestQuicksilver","GLOBAL",4)~ + t7.10
  ++ ~I'm quaking in my stylish yet affordable boots.~ + t7.11
  ++ ~I'll live.~ + t7.11
END

IF ~~ t7.9
  SAY ~We must all endure disappointments. Excuse me.~
  IF ~~ EXIT
END

IF ~~ t7.10
  SAY ~Excellent choice. Excuse me.~
  IF ~~ EXIT
END

IF ~~ t7.11
  SAY ~You will get no help from us in the future, <CHARNAME>. I am watching you.~
  IF ~~ EXIT
END

IF ~~ t13
  SAY ~Thank you, <CHARNAME>, for your aid in this matter. I have put together a small reward for you and your group as payment, and I will do my best to keep you out of the courts while you continue your quest.~
  = ~All the same, I would appreciate you staying out of trouble. The paperwork is... painful.~
  ++ ~Thank you, Magistrate.~ + t13.1
  ++ ~I'll do my best to stay out of trouble.~ + t13.1
  ++ ~Me? Stay out of trouble? Hardly.~ + t13.2
END

IF ~~ t13.1
  SAY ~Off with you. This building is crowded enough as it is without a group of fully equipped adventurers traipsing the halls.~
  IF ~~ DO ~SetGlobal("LK#ArathBylanna","LOCALS",1) GiveGoldForce(500)~ EXIT
END

IF ~~ t13.2
  SAY ~(sigh) Just keep it to a minimum.~
  IF ~~ + t13.1
END

IF ~~ t13.3
  SAY ~Hmm... thank you, <CHARNAME>. These will prove most useful.~
  = ~Scouts have found what they believe to be the location of the mine, not far from the Trademeet grove. Initial reports suggest it is a relatively small operation, merceneries, that sort of thing. You should have no trouble taking it out. I have assigned an agent, who will meet you at the entrance to the grove. He will direct you from there.~
  ++ ~Thank you, Magistrate. We will go immediately.~ + t13.4
  ++ ~You could mark it on our map?~ + t13.5
  ++ ~And what if I say no?~ + t13.6
END

IF ~~ t13.4
  SAY ~The sooner this is resolved, the better. Good luck.~
  IF ~~ DO ~SetGlobal("LK#ArathGuide","GLOBAL",1) AddJournalEntry(%Mining for Trouble

While we investigated the old slaver stockade, Bylanna's agents found the location of the mine. She has sent a guide to take us there; we are to meet him near the entrance of the Trademeet Druid Grove.%,QUEST)~ EXIT
END

IF ~~ t13.5
  SAY ~The swamp surrounding the druid grove is difficult at best to navigate. I would prefer you did not get lost for weeks in the process of trying to find the mine; I'm not sure we have the resources to arrange a search and rescue right now.~
  IF ~~ + t13.4
END

IF ~~ t13.6
  SAY ~You've come this far. To stop now would be... impractical.~
  IF ~~ + t13.4
END

END

BEGIN LK#ARGUI

IF ~Global("timetogo","LOCALS",0)~ gu1
  SAY ~You must be <CHARNAME>? Hi, I'm Tomas, and I'll be your guide through the jungle today!~
  = ~Just a bit of humor there. You know. Ice-breaker, and all that. Alright. Are you ready to get going? It's a bit of a hike, so make sure you've got enough water.~
  ++ ~Let's go.~ + gu1.1
  ++ ~Nice to, uh, meet you.~ + gu1.3
  ++ ~I'm not quite ready yet.~ + gu1.2
END

IF ~~ gu1.1
  SAY ~Just this way... watch those giant mushrooms, they're not weight-bearing mushrooms like you might be used to!~
  IF ~~ DO ~SetGlobal("timetogo","LOCALS",1)
            ActionOverride("LK#ARGUI",LeaveAreaLUA("LK#AR1","",[1655.1025],8))
            ActionOverride(Player1,LeaveAreaLUA("LK#AR1","",[1606.1044],8))
            ActionOverride(Player2,LeaveAreaLUA("LK#AR1","",[1468.1089],8))
            ActionOverride(Player3,LeaveAreaLUA("LK#AR1","",[1510.1123],8))
            ActionOverride(Player4,LeaveAreaLUA("LK#AR1","",[1589.1129],8))
            ActionOverride(Player5,LeaveAreaLUA("LK#AR1","",[1659.1115],8))
            ActionOverride(Player6,LeaveAreaLUA("LK#AR1","",[1719.1092],8))~ EXIT
END

IF ~~ gu1.2
  SAY ~Just let me know when you're ready to go!~
  IF ~~ EXIT
END

IF ~~ gu1.3
  SAY ~And you! It's not often I get to go out to the field, being more of a scientist than anything else, a biologist, some might say, so this is terribly exciting!~
  = ~Did you want to head off, or wait a little?~
  ++ ~We're ready if you are.~ + gu1.1
  ++ ~Give us a moment, please.~ + gu1.2
END

IF ~Global("timetogo","LOCALS",1)~ gu2
  SAY ~Well, here we are. Sorry about the bugs, not much we can do about that--I did manage to catch some fascinating specimens, however!~
  ++ ~Good for you. Thanks for the help.~ + gu2.1
  ++ ~Right. Well, enjoy that.~ + gu2.2
  ++ ~I'm going to get moving.~ + gu2.3
  ++ ~You're an exceedingly strange man.~ + gu2.4
END

IF ~~ gu2.1
  SAY ~Anytime! Literally, just ask for me at the bureau. It might take me a while, sometimes I get distracted, but I'll be there!~
  IF ~~ + gu2.5
END

IF ~~ gu2.2
  SAY ~Don't worry, I will! Just wait 'til my colleagues find out I found a yellow-winged gasbeetle!~
  IF ~~ + gu2.5
END

IF ~~ gu2.3
  SAY ~Best of luck! And if you ever need my services, just ask for me at the bureau. It might take me a while, sometimes I get distracted, but I'll be there!~
  IF ~~ + gu2.5
END

IF ~~ gu2.4
  SAY ~I get that a lot.~
  IF ~~ + gu2.5
END

IF ~~ gu2.5
  SAY ~I'll leave you to it, I'm sure you can find your way back. Best of luck!~
  IF ~~ DO ~SetGlobal("timetogo","LOCALS",2) EscapeAreaDestroy(3)~ EXIT
END


APPEND LK#ARATJ 

IF ~Global("LK#ArathQuest","GLOBAL",7)~ t6.1
  SAY ~There has to be something here...~
  = ~I should have known. My father's work.~
  = ~<CHARNAME>, he planned the operation. The slaves, the mine... he must have planned it years ago. Before his death. And someone is enacting it.~
  = ~Godsdamnit! I thought I had escaped the shadow of his idiocy when we killed the slavers last time! How does he keep following me?!~
  ++ ~Calm down. There's no point in getting angry about it. We have to work out what to do next.~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",8)~ + t6.2
  ++ ~Sometimes the legacy of our fathers haunts us in ways even do don't understand.~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",8)~ + t6.3
  ++ ~We don't have time for this. What do the plans say?~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",8)~ + t6.4
END

IF ~~ t6.2
  SAY ~Right.~
  IF ~~ + t6.4
END

IF ~~ t6.3
  SAY ~Apparently even beyond the grave!~
  = ~Okay. I just need a minute.~
  IF ~~ + t6.4
END

IF ~~ t6.4
  SAY ~There's hundreds of pages of notes here, detailed plans and fallbacks for every move he intended to make. They're mining raw quicksilver. Hells...~
  = ~We've got to fix this, <CHARNAME>. And we've got to do it soon.~
  ++ ~Is there anything else?~ + t6.5
  ++ ~Why should I care about your stupid grove, anyway?~ + t6.6
  ++ ~I'm sorry about this, Arath. This can't be easy.~ + t6.7
END

IF ~~ t6.5
  SAY ~<CHARNAME>, they were stockpiling quicksilver here. In this building. I'm not sure where, but... there's a note here. The handwriting isn't my father's.~
  = ~We should tell somebody. Bylanna, perhaps. Or... we could sell it. Give it to Hendak. I don't know.~
  = ~We need to go see Bylanna. Now. If this has been going on for weeks... <CHARNAME>, the grove won't last much longer.~
  ++ ~We'll go right now.~ + t6.8
  ++ ~We'll go as soon as we can.~ + t6.8
  ++ ~Deal with it yourself. This quicksilver is reward enough for me.~ + t6.9
END

IF ~~ t6.6
  SAY ~Because--I don't know, because I do!~
  = ~Wait... hang on.~
  IF ~~ + t6.5
END

IF ~~ t6.7
  SAY ~Let's not do this right now, okay?~
  = ~Wait... hang on.~
  IF ~~ + t6.5
END

IF ~~ t6.8
  SAY ~Good. These bastards need to pay.~
  IF ~~ DO ~AddJournalEntry(%Mining for Trouble

Investigating the old slaver stockade indeed proved useful. Amongst his father's old documents, Arath found plans for illegal mining operation that he is certain is the one being used. In addition to vital information about the operation, it includes the location of a horde of quicksilver hidden in the stockade. I should tell Bylanna, or see if Hendak is interested in buying it.%,QUEST)~ EXIT
END

IF ~~ t6.9
  SAY ~You bastard. You utter bastard.~
  = ~Rot in hell.~
  IF ~~ DO ~SetGlobal("LK#ArathJoined","LOCALS",0) LeaveParty() EscapeArea() SetGlobal("LK#ArathQuest","GLOBAL",20)       EraseJournalEntry(%Mining for Trouble

We received a message from the Archdruid of Arath's grove asking to meet us at the Druid Grove outside of Trademeet. Arath mentioned it must be relatively urgent for the Archdruid to send a messenger.%)
      EraseJournalEntry(%Mining for Trouble

We received a message from the Archdruid of Arath's grove asking to meet us at the Druid Grove outside of Trademeet. Arath mentioned it must be relatively urgent for the Archdruid to send a messenger. I told him to handle it himself. He said he would be waiting at the Druid Grove if I changed my mind.%)
      EraseJournalEntry(%Mining for Trouble

Arath has left, I assume to deal with his grove's problem on his own. He mentioned that if I wanted to help, he could be found at the Druid Grove.%)
      EraseJournalEntry(%Mining for Trouble

We have met with the Archdruid, who has tasked us with investigating what she believes to be an illegal mining operation that is poisoning the grove. She suggested we speak with Hendak in Athkatla to find out more.%)
      EraseJournalEntry(%Mining for Trouble

We have spoken with Hendak, who has informed us a shipment of slaves came into Athkatla three weeks ago. He believes these slaves may have been taken to work at the mine polluting the grove. He suggested we speak with Magistrate Bylanna in the Government district, saying that if there was an illegal mining operation occuring, she might know something useful.%)
      EraseJournalEntry(%Mining for Trouble

Unfortunately Bylanna did not know anything much about the mining operation, except to confirm that it existed and was being investigated. Given our initial destruction of the slavers in Athkatla, she has tasked us to return to the slaver stockade to see if we can find anything useful, and report back once we have done so.%)
      EraseJournalEntry(%Mining for Trouble

While we investigated the old slaver stockade, Bylanna's agents found the location of the mine. She has sent a guide to take us there; we are to meet him near the entrance of the Trademeet Druid Grove.%)
      AddJournalEntry(%Mining for Trouble

I told Arath he could deal with his problems himself, after discovering a horde of quicksilver hidden in the slaver stockade. I should see if Hendak is interested in buying it.%,QUEST)~ EXIT
END

END

BEGIN LK#ARGD1
BEGIN LK#ARGD2

CHAIN IF ~NumTimesTalkedTo(0)~ THEN LK#ARGD1 t8
  ~What are ye doin' in here?! Ye ain't allowed in the mine!~
  == LK#ARSLV ~You! You've got to help me, they've--~ []
  == LK#ARGD1 ~Shut yer trap, ye godsfersaken rat!~
  == LK#ARGD2 ~Hells, now you've gone and done it! Get them! They can't get away!~
  DO ~ActionOverride("LK#ARGD1",Enemy()) ActionOverride("LK#ARGD2",Enemy())~
EXIT

BEGIN LK#ARSLV

IF ~!Global("LK#AR1_talk","GLOBAL",1)~ t8.1
  SAY ~Thank you! You've no idea what they're...~
  = ~The others! You've got to help the others! They're down the mine!~
  ++ ~Tell them to escape if they get the opportunity. We'll take the slavers.~ + t8.2
  ++ ~Tell them to fight. We need all the help we're going to get.~ + t8.3
  ++ ~You should escape while you can.~ + t8.4
  ++ ~Die, slave! If you couldn't escape, you don't deserve to live!~ + t8.5
END

IF ~~ t8.2
  SAY ~G-go back down there? Yes, I... I must. Thank you, my <PRO_LADYLORD>. I will tell them.~
  IF ~~ DO ~SetGlobal("LK#ArathQuest_slavesescape","GLOBAL",1) SetGlobal("LK#AR1_talk","GLOBAL",1) EscapeAreaDestroy(3)~ EXIT
END

IF ~~ t8.3
  SAY ~G-go back down there? Yes, I... I must. Thank you, my <PRO_LADYLORD>. I will tell them.~
  IF ~~ DO ~SetGlobal("ArathQuest_slavesfight","GLOBAL",1) SetGlobal("LK#AR1_talk","GLOBAL",1) EscapeAreaDestroy(3)~ EXIT
END

IF ~~ t8.4
  SAY ~Get the others out! You have to help them!~
  IF ~~ DO ~SetGlobal("LK#ArathQuest_slavesescape","GLOBAL",1) SetGlobal("LK#AR1_talk","GLOBAL",1) MoveToPoint([1952.638]) Wait(1) DestroySelf()~ EXIT
END

IF ~~ t8.5
  SAY ~Gods, no! Please! Have mercy!~
  ++ ~Run away, little man. Run away like the rodent you are.~ + t8.6
  ++ ~Prepare to meet your god!~ EXTERN LK#ARATJ t8.7
END

IF ~~ t8.6
  SAY ~Gods curse you!~
  IF ~~ DO ~SetGlobal("LK#ArathQuest_slavesescape","GLOBAL",1) SetGlobal("LK#AR1_talk","GLOBAL",1) MoveToPoint([1952.638]) Wait(1) DestroySelf()~ EXIT
END

CHAIN LK#ARATJ t8.7
  ~What in the hells do you think you're doing, <CHARNAME>?! If you attack this man, you'll have to fight me as well!~
  == NALIAJ IF ~InParty("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN ~What do you think you're doing?! This man is innocent!~
  == IMOEN2J IF ~InParty("Imoen") !StateCheck("Imoen",CD_STATE_NOTVALID)~ THEN ~You can't be serious, little <PRO_BROTHERSISTER>! What has this man done to you?~
  == JAHEIRAJ IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN ~And I. This is a travesty, <CHARNAME>, and I will not let you enact it!~
  == KELDORJ IF ~InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN ~Attack this man, <CHARNAME>, and Arath is not the only problem you will encounter.~ 
  == AERIEJ IF ~InParty("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN ~Y-you cannot do this, <CHARNAME>! I won't let you!~
  == MAZZYJ IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN ~Do this and I *will* stand against you!~
  == ANOMENJ IF ~InParty("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN ~I will not let this evil occur! Attack this man and you will face my wrath!~
  == VALYGARJ IF ~InParty("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN ~This is wrong. I will defend this man if I have to.~
  == MINSCJ IF ~InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN ~Nay, <CHARNAME>, you cannot kill this man! Boo will have none of it!~
END
  ++ ~Fine, fine! I was joking. It was a joke.~ EXTERN LK#ARATJ t8.8
  ++ ~Then you will go down with him!~ EXTERN LK#ARATJ t8.9

CHAIN LK#ARATJ t8.8
  ~In very poor taste. That man did nothing to you, and you treat him like garbage. You should be ashamed of yourself.~
  DO ~SetGlobal("LK#AR1_talk","GLOBAL",1) ActionOverride("LK#ARSLV",EscapeArea()~
EXIT

CHAIN LK#ARATJ t8.9
  ~Then defend yourself!~
  DO ~SetGlobal("LK#ArathQuest_slavesescape","GLOBAL",1)
      SetGlobal("LK#AR1_talk","GLOBAL",1)
      ActionOverride("LK#ARSLV",Enemy())
      ActionOverride("Nalia",LeaveParty())
      ActionOverride("Nalia",Enemy())
      ActionOverride("Jaheira",LeaveParty()) 
      ActionOverride("Jaheira",Enemy())
      ActionOverride("Keldorn",LeaveParty()) 
      ActionOverride("Keldorn",Enemy())
      ActionOverride("Aerie",LeaveParty()) 
      ActionOverride("Aerie",Enemy())
      ActionOverride("Mazzy",LeaveParty())
      ActionOverride("Mazzy",Enemy())
      ActionOverride("Anomen",LeaveParty()) 
      ActionOverride("Anomen",Enemy())
      ActionOverride("Valygar",LeaveParty()) 
      ActionOverride("Valygar",Enemy())
      ActionOverride("Minsc",LeaveParty()) 
      ActionOverride("Minsc",Enemy())
      ActionOverride("Arath",LeaveParty())
      ActionOverride("Arath",Enemy())~
EXIT


BEGIN LK#ARBOS

// Boss slaver dialogue
CHAIN IF ~NumTimesTalkedTo(0)~ THEN LK#ARBOS t9
  ~I should have known this idiocy was your fault. Your father's son, through and through.~
  == LK#ARATJ ~Hardly. Your little operation is over, you ugly cretin!~
  == LK#ARBOS ~Har har! That's not what your mother said!~
  == LK#ARATJ ~Oh, give it up, Haftmund. You can't goad me with your petty insults. My mother was a whore and we both know it.~
  == LK#ARBOS ~We certainly do, don't we, Arath.~
  = ~Look at what you've reduced me to. Hiding down mines, harrying slaves for quicksilver. Pfah. Your cockroach of a father would be proud.~
  == LK#ARATJ ~Somehow, I doubt that. And I didn't do this to you--you did.~
  == LK#ARBOS ~So you really think... you're a fool through and through.~
  == LK#ARATJ ~Let's skip the pleasantries. We've won, and you need to die.~
  == LK#ARBOS ~Haha! The peacock has talons!~
  == LK#ARATJ ~He's got a lot more than that, you bastard!~
  DO ~SetGlobal("LK#ArathQuest","GLOBAL",9) SetGlobal("LK#AR2_attack","LK#AR2",1) ActionOverride("LK#ARBOS",Enemy())~
EXIT

CHAIN IF ~Global("LK#ArathQuest","GLOBAL",9)~ THEN LK#ARBOS t10
  ~Stop! Stop! I yield!~
  == LK#ARATJ ~You deserve no mercy, slaver!~
  == LK#ARBOS ~I have information! If I die, it goes with me!~
  == LK#ARATJ ~I don't care! No good has ever come from your mouth!~
END
  ++ ~Whatever you have to say better be good, slaver.~ EXTERN LK#ARBOS t10.1
  ++ ~What's in it for me?~ EXTERN LK#ARBOS t10.3
  ++ ~If Arath doesn't care what you have to say, neither do I!~ EXTERN LK#ARBOS t10.2
  ++ ~Die, slaver scum!~ EXTERN LK#ARBOS t10.2

CHAIN LK#ARBOS t10.1
  ~Do you really think one man could bring down an entire ring, boy? Did you really think *you* stopped us?~
  == LK#ARATJ ~I thought--~
  == LK#ARBOS ~You're an idiot. Your father laid the seeds for our destruction years ago. He planned it, he must have, because the defections that day were staggering. The locks on the cages were broken. You had very little to do with it at all.~
  == LK#ARATJ ~My father is dead, Haftmund, don't--~
  == LK#ARBOS ~Of course he's dead, you stupid boy! I watched him die! No, he planned our fall long before I poisoned him. Didn't you ever wonder, or did you really just think you were that powerful? A one-man army, who took down an entire ring of slavers?~
  = ~That's what I thought. You're pathetic.~
  DO ~AddJournalEntry(%Mining for Trouble

We confronted the slavers in the mine, and encountered an old "friend" of Arath's fathers, who in exchange for his life told Arath that his father was not who Arath thought he was. Once the mine is clear, we should return to the Druid Grove and speak to Archdruid Wreimass.%,QUEST) SetGlobal("LK#ArathQuestInfo","GLOBAL",1) ChangeEnemyAlly(Myself,NEUTRAL) MoveToPoint([2273.1610]) DestroySelf()~
EXIT

CHAIN LK#ARBOS t10.2
  ~I submitted! I yielded, you idiots!~
  = ~Do it quickly, then. DO IT!~
  DO ~AddJournalEntry(%Mining for Trouble

We confronted the slavers in the mine, and encountered an old "friend" of Arath's fathers, who attacked us. Once the mine is clear, we should return to the Druid Grove and speak to Archdruid Wreimass.%,QUEST) DestroyItem("minhp1") Attack(Player1)~
EXIT

CHAIN LK#ARBOS t10.3
  ~Nothing, but for him...~
END
  ++ ~Not good enough. Prepare to die!~ EXTERN LK#ARBOS t10.2
  ++ ~Fine. Whatever it is better be good.~ EXTERN LK#ARBOS t10.1
  ++ ~Make it quick.~ EXTERN LK#ARBOS t10.1

APPEND LK#ARATJ

IF ~Global("LK#ArathQuest","GLOBAL",9)~ t11
  SAY ~I don't want to... let's just not talk right now, okay?~
  = ~We need to tell Wreimass. And Magistrate Bylanna. They'll want to know the slavers have been taken down.~
  IF ~~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",10)~ EXIT
END

END

CHAIN IF ~Global("LK#ArathQuest","GLOBAL",10)~ THEN LK#ARWRE t12
  ~Arath? Is it done?~
  == LK#ARATJ ~It's done. We killed the slavers, the mine won't be running any longer.~
  == LK#ARWRE ~Good. Took you long enough.~
  == LK#ARATJ ~"Took you long enough?" We just took down an entire--~
  == LK#ARWRE ~Arath?~
  == LK#ARATJ ~...~
  = ~I don't want to talk about it.~
  == LK#ARWRE ~Whatever it is, get over it. It doesn't matter. All that matters is that you have saved the grove, and for that we are thankful.~
  == LK#ARATJ ~Right.~
  == LK#ARWRE ~To you, <CHARNAME>, we also owe our thanks. A blessing on you and yours, to help you on your way.~
  DO ~SetGlobal("LK#ArathQuest","GLOBAL",11) ClearAllActions() StartCutSceneMode() StartCutScene("lk#arct2")~ /*cutscene -- she casts a blessing on the party*/
EXIT

CHAIN IF ~Global("LK#ArathQuest","GLOBAL",11)~ THEN LK#ARWRE t12.1
  ~That done, I think it's about time we returned. You're welcome to join us, if you wish, Arath.~
  == LK#ARATJ ~I... I owe my loyalty to <CHARNAME>. <PRO_HESHE> has earned it.~
  == LK#ARWRE ~As you will. Best of luck with whatever it is you're doing. Do stop by sometime.~
  == LK#ARATJ ~I will. Goodbye, Ellen.~
  == LK#ARWRE ~Take care of yourself.~
  == LK#ARATJ ~Yeah.~
  DO ~SetGlobal("LK#ArathQuest","GLOBAL",12) 
      EraseJournalEntry(%Mining for Trouble

We received a message from the Archdruid of Arath's grove asking to meet us at the Druid Grove outside of Trademeet. Arath mentioned it must be relatively urgent for the Archdruid to send a messenger.%)
      EraseJournalEntry(%Mining for Trouble

We received a message from the Archdruid of Arath's grove asking to meet us at the Druid Grove outside of Trademeet. Arath mentioned it must be relatively urgent for the Archdruid to send a messenger. I told him to handle it himself. He said he would be waiting at the Druid Grove if I changed my mind.%)
      EraseJournalEntry(%Mining for Trouble

Arath has left, I assume to deal with his grove's problem on his own. He mentioned that if I wanted to help, he could be found at the Druid Grove.%)
      EraseJournalEntry(%Mining for Trouble

We have met with the Archdruid, who has tasked us with investigating what she believes to be an illegal mining operation that is poisoning the grove. She suggested we speak with Hendak in Athkatla to find out more.%)
      EraseJournalEntry(%Mining for Trouble

We have spoken with Hendak, who has informed us a shipment of slaves came into Athkatla three weeks ago. He believes these slaves may have been taken to work at the mine polluting the grove. He suggested we speak with Magistrate Bylanna in the Government district, saying that if there was an illegal mining operation occuring, she might know something useful.%)
      EraseJournalEntry(%Mining for Trouble

Unfortunately Bylanna did not know anything much about the mining operation, except to confirm that it existed and was being investigated. Given our initial destruction of the slavers in Athkatla, she has tasked us to return to the slaver stockade to see if we can find anything useful, and report back once we have done so.%)
      EraseJournalEntry(%Mining for Trouble

Investigating the old slaver stockade indeed proved useful. Amongst his father's old documents, Arath found plans for illegal mining operation that he is certain is the one being used. In addition to vital information about the operation, it includes the location of a horde of quicksilver hidden in the stockade. I should tell Bylanna, or see if Hendak is interested in buying it.%)
      EraseJournalEntry(%Mining for Trouble

We confronted the slavers in the mine, and encountered an old "friend" of Arath's fathers, who in exchange for his life told Arath that his father was not who Arath thought he was. Once the mine is clear, we should return to the Druid Grove and speak to Archdruid Wreimass.%)
      EraseJournalEntry(%Mining for Trouble

We confronted the slavers in the mine, and encountered an old "friend" of Arath's fathers, who attacked us. Once the mine is clear, we should return to the Druid Grove and speak to Archdruid Wreimass.%)
      EraseJournalEntry(%Mining for Trouble

While we investigated the old slaver stockade, Bylanna's agents found the location of the mine. She has sent a guide to take us there; we are to meet him near the entrance of the Trademeet Druid Grove.%)
      AddJournalEntry(%Mining for Trouble

We cleared out the mine and in exchange, received a blessing from Archdruid Wreimass. Bylanna would probably like to be informed.%,QUEST_DONE) ActionOverride("lk#arwre",EscapeAreaDestroy(5))~
EXIT

APPEND LK#ARATJ

IF ~Global("LK#ArathQuest","GLOBAL",12)~ x
  SAY ~Thank you, <CHARNAME>. You didn't have to help me, but you did, and I appreciate that. Really.~
  = ~Come on. I'm sure we've got better things to do than get bitten by flies.~
  IF ~~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",13) RealSetGlobalTimer("LK#ArathQuestTalkTimer","GLOBAL",3600)~ EXIT
END

IF ~Global("LK#ArathQuest","GLOBAL",14) Global("LK#ArathQuestInfo","GLOBAL",1)~ t14
  SAY ~We should have killed him.~
  ++ ~Who should we have killed?~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",15)~ + t14.1
  ++ ~What are you talking about?~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",15)~ + t14.1
  + ~OR(2) CheckStatGT(Player1,12,INT) CheckStatGT(Player1,12,WIS)~ + ~The slaver? Haftmund?~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",15)~ + t14.4
  ++ ~Snap out of it, Arath. I need you here, not in your head.~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",15)~ + t14.2
  ++ ~I don't have time for this. Stop being a child.~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",15)~ + t14.3
END

IF ~~ t14.1
  SAY ~The slaver. Haftmund. We should have killed him.~
  IF ~~ + t14.4
END

IF ~~ t14.2
  SAY ~We should have killed him.~
  IF ~~ + t14.4
END

IF ~~ t14.3
  SAY ~Then make time for it! I'm tired of you not listening to me!~
  = ~You know what? Forget it. I don't care. Whatever.~
  IF ~~ EXIT
END

IF ~~ t14.4
  SAY ~He was just lying to save his own damned skin. There's no way my father planned to destroy the slavers. He was the one who made them powerful in Athkatla in the first place.~
  ++ ~Maybe he had a change of heart.~ + t14.5
  ++ ~People will say anything to avoid death. Don't worry about it.~ + t14.5
  ++ ~Maybe Haftmund was lying. Maybe he wasn't. Does it matter?~ + t14.5
  + ~OR(2) CheckStatGT(Player1,13,INT) CheckStatGT(Player1,13,WIS)~ + ~It sounds like you're trying to convince yourself, not me.~ + t14.5
END

IF ~~ t14.5
  SAY ~I really don't know what to believe anymore.~
  = ~Anyway. Thanks. You didn't have to help me, but you did. I appreciate it.~
  ++ ~Of course. Any time.~ + t14.6
  ++ ~No, I didn't have to help you.~ + t14.7
  ++ ~You certainly don't seem very appreciative.~ + t14.8
  ++ ~Can we get going? We've got business to attend to.~ + t14.9
END

IF ~~ t14.6
  SAY ~Yeah.~
  IF ~~ + t14.10
END

IF ~~ t14.7
  SAY ~No, you didn't.~
  = ~Thanks.~
  IF ~~ + t14.10
END

IF ~~ t14.8
  SAY ~I am. I just... I've got a lot on my mind.~
  IF ~~ + t14.10
END

IF ~~ t14.9
  SAY ~You're right. Let's continue.~
  IF ~~ EXIT
END
  
IF ~~ t14.10
  SAY ~If you don't mind, I'd rather not talk much. We can just walk. If you want to.~
  IF ~~ EXIT
END

IF ~Global("LK#ArathQuest","GLOBAL",14) !Global("LK#ArathQuestInfo","GLOBAL",1)~ t15
  SAY ~<CHARNAME>? You got a minute?~
  ++ ~Of course. What is it?~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",15)~ + t15.3
  ++ ~What do you want?~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",15)~ + t15.3
  ++ ~Well, I don't have any on me, but...~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",15)~ + t15.1
  ++ ~Is it important?~ DO ~SetGlobal("LK#ArathQuest","GLOBAL",15)~ + t15.2
END

IF ~~ t15.1
  SAY ~Very funny. You know what I meant.~
  IF ~~ + t15.3
END

IF ~~ t15.2
  SAY ~Yeah. I guess it is.~
  IF ~~ + t15.3
END

IF ~~ t15.3
  SAY ~I just wanted to thank you. For helping me with the slavers. Again.~
  = ~It's a good thing we did.~
  ++ ~It was. And it was my pleasure. Any time.~ + t15.4
  ++ ~Anything involving you and chains, and I'm in.~ + t15.5
  ++ ~We saved an entire grove, and all we got was a stupid blessing. I'm not happy.~ + t15.6
  ++ ~Right. Well, we've got business to attend to.~ + t15.7
END

IF ~~ t15.4
  SAY ~Yeah.~
  IF ~~ + t15.8
END

IF ~~ t15.5
  SAY ~Heh. I'll keep that in mind.~
  IF ~~ + t15.8
END

IF ~~ t15.6
  SAY ~Not many people are honoured with an Archdruid's blessing, you know. Most people would be proud.~
  = ~But I suppose I should know better. You *are* <CHARNAME>, after all.~
  IF ~~ + t15.8
END

IF ~~ t15.7
  SAY ~You're right. Let's get going.~
  IF ~~ EXIT
END

IF ~~ t15.8
  SAY ~I just... I keep thinking back over what happened. What Haftmund said. I don't regret killing him--the bastard deserved to die--but...~
  ++ ~You wish you found out what he had to say?~ + t15.9
  ++ ~You should have made his death far more drawn out, if you ask me.~ + t15.10
  ++ ~It's not worth agonising over. It's in the past.~ + t15.11
  ++ ~Snap out of it, Arath. You need to come back to the real world.~ + t15.12
END

IF ~~ t15.9
  SAY ~I don't know.~
  IF ~~ + t15.13
END

IF ~~ t15.10
  SAY ~I just wonder...~
  = ~Anyway.~
  IF ~~ + t15.13
END

IF ~~ t15.11
  SAY ~You're right. I know that. Still...~
  IF ~~ + t15.13
END

IF ~~ t15.12
  SAY ~I know. Don't worry about it.~
  IF ~~ + t15.13
END

IF ~~ t15.13
  SAY ~Let's get going. We've got a lot yet to do, and not much time to do it in.~
  IF ~~ EXIT
END

END