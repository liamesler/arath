BEGIN BLK#ARAT

// Aerie SoA
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("Aerie",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathAerie","GLOBAL",0)~ THEN BAERIE a1
  ~Thank you for helping us with those slavers, Arath. We--we really appreciate it.~
  DO ~SetGlobal("LK#ArathAerie","GLOBAL",1)~
  == BLK#ARAT ~It was my pleasure, Aerie. Any time you are in need of aid, of any kind, you have but to ask and I shall be at your side!~
  == BAERIE ~Th-that's very gallant of you.~
  = ~Why do you hate them so much?~
  == BLK#ARAT ~Hmm?~
  == BAERIE ~The slavers. Why do you hate them? What did they... what did they do to you?~
  == BLK#ARAT ~Don't worry yourself about it. Let's just say... I owe slavers a great debt, and I intend to repay it as painfully as possible.~
EXIT

CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("Aerie",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathAerie","GLOBAL",1)~ THEN BAERIE a2  
  ~Doesn't your hair bother you, Arath? It's always in your eyes.~
  DO ~SetGlobal("LK#ArathAerie","GLOBAL",2)~
  == BLK#ARAT ~You get used to it after a while, just like anything else.~
  == BAERIE ~But why do you keep it that way? Wouldn't it be easier to just--to keep it shorter?~
  == BLK#ARAT ~Probably, but I like the way it looks. Besides, you do too. (wink).~
EXIT

CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("Aerie",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathAerie","GLOBAL",2)~ THEN BAERIE a3
  ~... and so, thanks to Uncle Quayle, I came to worship Baervan as well as Aerdrie Faenya. It's--it's a little strange, I know, but I respect them equally.~
  DO ~SetGlobal("LK#ArathAerie","GLOBAL",3)~
  == BLK#ARAT ~Hmm? I'm sorry?~
  == BAERIE ~Are you even... are you even listening?~
  == BLK#ARAT ~(sigh) No, I wasn't. I was distracted. Something about the Gnomish god of forests? Baravan?~
  == BAERIE ~Baervan, Baervan Wildwanderer. Arath, I just... I just told you something deeply important to me, I shared it with you, and you...~
  = ~Ex-excuse me.~
EXIT

CHAIN IF ~InParty("Aerie")
See("Aerie")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("Aerie",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathAerie","GLOBAL",3)~ THEN BLK#ARAT a4
  ~If you want men to pay attention to what you're saying, Aerie, perhaps you should consider what you wear.~
  DO ~SetGlobal("LK#ArathAerie","GLOBAL",4)~
  == BAERIE ~What do you mean by that?~
  == BLK#ARAT ~Men have a tendency to get distracted by... shall we say, those of generous proportion? Especially when their assets are on display.~
  = ~It's a compliment, Aerie. Really. Not all women are as blessed as you.~
  == BAERIE ~What I'm wearing and what I look like should have no effect on whether people--whether people listen to me! What kind of advice is that?~
  = ~I'm--I'm not just an object to be stared at, Arath, and I'm tired of you treating me like--like I have nothing to say!~
  = ~Maybe if you stopped thinking with your--with your manhood--you'd stop and realise that sometimes you have to pull your head out of your behind!~
EXIT

// Anomen SoA
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("Anomen",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathAnomen","GLOBAL",0)~ THEN BANOMEN an1
  ~...and there I was, standing atop the very beast I had just impaled. Were it not for my quick thinking, those recruits would have never made it to the tourney.~
  DO ~SetGlobal("LK#ArathAnomen","GLOBAL",1)~
  == BLK#ARAT ~Hah! I can just see it now... what a sight that must have been.~
  == BANOMEN ~It was one of my better moments, druid, I'll admit. Surely you have similar stories of might and bravery?~
  == BLK#ARAT ~Bravado, perhaps, but not bravery. I prefer to avoid the limelight, and work with the Mother for the betterment of all.~
  == BANOMEN ~A noble goal, to be sure, but that is not the work of a hero. A hero must stand tall and let the light of the gods fall upon him; he must fight for the forgotten, the lost, and the weary, and he must never stray from his duty.~
  = ~You would do well to emulate my example.~
  == BLK#ARAT ~I don't want to be a hero, Anomen. I prefer to live in the real world.~
  == BANOMEN ~The world is what you make of it, and this is the path I have chosen. I hope, for your sake, that you soon follow suit. There is no glory in nature.~
EXIT

// CN Anomen SoA
CHAIN IF ~OR(11)
  AreaCheck("AR0021") //City Gates - Crooked Crane 1st floor
  AreaCheck("AR0313") //Docks - Sea's Bounty 1st floor
  AreaCheck("AR0406") //Slums - Copper Coronet
  AreaCheck("AR0509") //Bridge - Five Flagons 1st floor
  AreaCheck("AR0513") //Bridge - Calbor's Inn 1st floor
  AreaCheck("AR0522") //Bridge - Five Flagons 1st floor (stronghold)
  AreaCheck("AR0704") //Waukeen's Promenade - Mithrest Inn
  AreaCheck("AR0709") //Waukeen's Promenade - Den of the Seven Vales
  AreaCheck("AR1105") //Umar Hills - Imnesvale Inn
  AreaCheck("AR1602") //Brynnlaw - Brynnlaw Inn
  AreaCheck("AR2010") //Trademeet - Vytori's Pub
InParty("Anomen")
See("Anomen")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("Anomen",CD_STATE_NOTVALID)
CombatCounter(0)
Alignment("Anomen",CHAOTIC_NEUTRAL)
Global("LK#ArathAnomen","GLOBAL",1)~ THEN BLK#ARAT an2
  ~A drink, Anomen?~
  DO ~SetGlobal("LK#ArathAnomen","GLOBAL",2)~
  == BANOMEN ~I do not need your charity, druid.~
  == BLK#ARAT ~It's not charity if you get the next round.~
  == BANOMEN ~Very well. An ale, then.~
  == BLK#ARAT ~Bartender! Two ales.~
  = ~To throwing authority under the cart at any opportunity!~
  == BANOMEN ~I can drink to that.~
EXIT

// LG Anomen SoA
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Arath",CD_STATE_NOTVALID)
!StateCheck("Anomen",CD_STATE_NOTVALID)
CombatCounter(0)
Alignment("Anomen",LAWFUL_GOOD)
Global("LK#ArathAnomen","GLOBAL",1)~ THEN BANOMEN an3
  ~There is one thing I struggle to understand about you, druid. What drives you? What cause pushes you forward, to greater and more glorious things?~
  DO ~SetGlobal("LK#ArathAnomen","GLOBAL",2)~
  == BLK#ARAT ~Whatever takes my fancy, I suppose. I try not to believe in over-arching causes; I tend to lose my zest for them a few hours in.~
  == BANOMEN ~You must lead a very empty life, my friend.~
  == BLK#ARAT ~I prefer to think of it as freeing. I trust my instict, and I trust the will of the Mother, and beyond that? Well, as long as you're having fun, does it matter?~
  == BANOMEN ~It matters a great deal.~
EXIT

// Cernd SoA
CHAIN IF ~InParty("Cernd")
See("Cernd")
!StateCheck("Cernd",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathCernd","GLOBAL",0)~ THEN BLK#ARAT c1
  ~Your expression speaks volumes.~
  DO ~SetGlobal("LK#ArathCernd","GLOBAL",1)~
  == BCERND ~I am ill at ease in a city such as this. Look at how those who live here choke nature beneath their feet, even as she fights for her place between the pavestones.~
  = ~I notice you do not share my unease, pup.~
  == BLK#ARAT ~For one, I am not a pup, I am a grown man and two, I dislike the city as much as the next druid but you have to admit, there is a certain beauty to the way she attempts to claw her way to dominance even as she is buried and destroyed.~
  == BCERND ~Beauty, yes, and great inspiration can be drawn from her struggle to survive. The fact remains that she should not have to struggle. There should be no contest.~
  == BLK#ARAT ~There is always a contest, whether it be between man and nature or wolves and rabbits. It is our nature.~
  == BCERND ~Youth should defer to wisdom in this, young one; destruction is never an inherent behavior. It is learned and taught. The wolf does not seek to eliminate the rabbit: she hunts in order to eat. Man need not seek to eliminate nature; he should strive to live in harmony with her. This is what our order tries to instil in the world.~
  == BLK#ARAT ~I am not one of your order, Cernd. I follow my own path.~
  == BCERND ~We all follow our own paths, but there need not be such conflict along the way. That is your choice.~
  == BLK#ARAT ~Yes, it is.~
  == BCERND ~Yes. It is.~
EXIT

CHAIN IF ~InParty("Cernd")
See("Cernd")
!StateCheck("Cernd",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathCernd","GLOBAL",1)~ THEN BLK#ARAT c2
  ~Dogwood.~
  DO ~SetGlobal("LK#ArathCernd","GLOBAL",2)~
  == BCERND ~And this?~
  == BLK#ARAT ~Hyssop. Why are we--~
  == BCERND ~And what is hyssop used for?~
  == BLK#ARAT ~Respiratory problems, as a digestion aid, and it can also be made into a poultice for cuts, bruises and sores.~
  = ~Why are we doing this?~
  == BCERND ~Because it can also cause pregnant women to lose their babies, not to mention general nausea, illness and in excessive doses, convulsions.~
  = ~The baby sparrow cannot fly until it is grown, and even then must watch the movements of its mother for many days before attempting to take to the sky.~
  == BLK#ARAT ~I'm not sure that even means anything. I have studied and passed the Rites, Cernd, I know all there is to know about herbal lore, and--~
  == BCERND ~Then what are the risks associated with using bloodroot?~
  = ~Even I do not know all there is to know, pup, and I have been at this for far longer than you. Arrogance is ever the enemy of wisdom, and wisdom is the goal of all who follow the path of druidry. Learn this well.~
EXIT

// Edwin SoA
CHAIN IF ~InParty("Edwin")
See("Edwin")
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathEdwin","GLOBAL",0)~ THEN BLK#ARAT e1
  ~I've heard stories of the might of the Red Wizards, Odesseiron. Surely they are exaggerated?~
  DO ~SetGlobal("LK#ArathEdwin","GLOBAL",1)~
  == BEDWIN  ~If you have heard stories, mewling, then you must know what we do to those who irritate us. I've no interest in speaking to you. (Just ignore him and he'll go away.)~
  == BLK#ARAT ~I have heard stories, yes, but--~
  == BEDWIN  ~Exchanging pleasantries with the likes of you does not interest me in the least. Go play with your flowers, boy. Perhaps you'll accidentally swallow something and choke to death. (One can but hope.)~
EXIT

CHAIN IF ~InParty("Edwin")
See("Edwin")
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathEdwin","GLOBAL",1)~ THEN BLK#ARAT e2
  ~What are you doing there, Edwin?~
  DO ~SetGlobal("LK#ArathEdwin","GLOBAL",2)~
  == BEDWIN  ~(Insufferable monkeyspawn!) If you must know, boy, I am gathering ingredients for an experiment of mine.~
  == BLK#ARAT ~Gathering... ingredients. I see.~
  == BEDWIN  ~What does it *look* like I'm doing?~
  == BLK#ARAT ~I really wasn't sure, but those glasses and the way you were scrunching up your robe did not bode well.~
  == BEDWIN  ~The magnitude of how little I care about what you think astounds even me, druid. Can't you see I'm busy? Go make a daisy necklace, or whatever it is you nature-types do in your downtime. Off with you.~
EXIT

CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathEdwin","GLOBAL",2)~ THEN BEDWIN e3
  ~Druid! Do you have any dried fungi with properties of foxfire?~
  DO ~SetGlobal("LK#ArathEdwin","GLOBAL",3)~
  == BLK#ARAT ~What do you need foxfire for?~
  == BEDWIN  ~Does it matter? Hand it over, or suffer my wrath!~
  == BLK#ARAT ~I am positively terrified. And yes, I do have a little, but you can't have it, as I need it for a tonic I'm making tonight.~
  == BEDWIN  ~Just give it to me, simian.~
  = ~Are you insane?~
  = ~I shudder to ask, but what species exactly do you think this is?~
  == BLK#ARAT ~Uh. It's bitter oyster. A purgative.~
  == BEDWIN  ~This is poison pax, you imbecile! Put this in a tonic and whomever drinks it will soon suffer from acute kidney failure, often followed by death!~
  == BLK#ARAT ~Oh.~
  == BEDWIN  ~Get out of my sight, you pathetic excuse for a druid, and next time you come to me before deciding what kind of fungi goes in your accursed tonics!~
EXIT

// Haer'Dalis SoA
CHAIN IF ~InParty("Haerdalis")
See("Haerdalis")
!StateCheck("Haerdalis",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathHaer","GLOBAL",0)~ THEN BLK#ARAT h1
  ~... I was tied to the pole while she undressed, this gorgeous slip of a girl, do of course I couldn't *do* anything, and just as she is down to her smallclothes she picks up her clothes, laughing uproariously, and leaves me there!~
  DO ~SetGlobal("LK#ArathHaer","GLOBAL",1)~
  == BLK#ARAT ~It took them hours to find me, and what an image it must have been: tied to a post, naked as the day I was born, my cheeks red with rouge... Those were the days, I tell you!~
  == BHAERDA ~What a tale! You have missed your calling, my friend!~
  = ~I must ask, though, what happened to the dwarf?~
  == BLK#ARAT ~As it turns out, she was actually a he -- you know how it is with dwarves -- and made of with both my coinpurse AND the lotus!~
  == BHAERDA ~It sounds like quite the night to remember!~
  == BLK#ARAT ~It really was, apart from the robbery and memory loss. That was the day I learnt not to mix black lotus and ale. Definitely not a good combination.~
  = ~It's also how I acquired the nickname 'the black swan,' in case you were wondering. Though I prefer not to think about that part of the story.~
  == BHAERDA ~I can imagine.~
EXIT

CHAIN IF ~InParty("Haerdalis")
See("Haerdalis")
!StateCheck("Haerdalis",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathHaer","GLOBAL",1)~ THEN BLK#ARAT h2
  ~You must have seen some amazing sights on your travels, troubadour. Care to share a tale or two? My legs are aching and I need a distraction, and I've found your velvet-smooth voice an excellent one in the past.~
  DO ~SetGlobal("LK#ArathHaer","GLOBAL",2)~
  == BHAERDA ~Why, my black swan, I am touched! It would be my pleasure to relate a tale. Would you prefer to hear about the pleasures of Elysia, or my adventures in the City of Doors--or perhaps about the Sensorium?~
  == BLK#ARAT ~Let's go with the Sensorium, that sounds interesting?~
  == BHAERDA ~Contained within the Sensorium, under the watchful gaze of the Society of Sensation, lie hundreds of thousands of recorded sensations. The Society tries to document memories and sensations as best they can, and for a fee one can experience them for oneself. It is a most intriguing place, where you can fall in love, die, couple with a dragon and fly all within a single day.~
  == BLK#ARAT ~That sounds incredible. How is that possible?~
  == BHAERDA ~On the planes, my friend, anything is possible.~
EXIT

// Imoen SoA
CHAIN IF ~InParty("Imoen2")
See("Imoen2")
!StateCheck("Imoen2",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathImoen","GLOBAL",0)~ THEN BLK#ARAT i1
  ~When <CHARNAME> said we were rescuing his foster sister, I had no idea she would be quite so fetching.~
  DO ~SetGlobal("LK#ArathImoen","GLOBAL",1)~
  == BIMOEN2 ~Fetching? What am I, a cloak?~
  == BLK#ARAT ~What I meant to say was that you are quite the catch, Imoen, and any man would surely be glad to--~
  == BIMOEN2 ~I'm not a fish, either, y'know!~
  = ~(grin) Would you like some help with that hole you're digging?~
  == BLK#ARAT ~Ah, no, I think I'm doing quite well enough myself, thank you.~
EXIT

CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Imoen2",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathImoen","GLOBAL",1)~ THEN BIMOEN2 i2
  ~You know, Arath, you're not so bad. A bit old to be sporting that hair, but hey, you pull it off, so bravo to you.~
  DO ~SetGlobal("LK#ArathImoen","GLOBAL",2)~
  == BLK#ARAT ~Thank you! I quite--~
  = ~Wait a moment. I'm not old! I'm twenty four. That's hardly *old*.~
  == BIMOEN2 ~So that means you're almost twenty five. That's only five years to thirty. And when you turn thirty, let's be honest here, you may as well be dead.~
  = ~I'm teasing, Arath. No need to look so worried.~
  = ~Wait, is that a grey hair?~
  == BLK#ARAT ~What?! Where?!~
  == BIMOEN2 ~(Heh heh...)~
EXIT

// Jaheira SoA
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathJaheira","GLOBAL",0)~ THEN BJAHEIR j1
  ~What do you think you are doing, staring at that man? This is Amn, child, you do not know if he was armed or dangerous. I suggest you keep your eyes on the road.~
  DO ~SetGlobal("LK#ArathJaheira","GLOBAL",1)~
  == BLK#ARAT ~One, I was not staring, I was admiring. And two, what business is it of yours? Where my gaze rests is none of your concern.~
  == BJAHEIR ~Do not take this the wrong way, Arath, but not all are as accepting of the breadth of sexuality as yourself. You would do well to be more careful in places such as this.~
  == BLK#ARAT ~While I appreciate your, uh, candor, it was he who was first staring at me. I'm not stupid, Jaheira.~
  == BJAHEIR ~My gladness for you exceeds explanation.~
EXIT

CHAIN IF ~InParty("Jaheira")
See("Jaheira")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
AreaType(CITY)
Global("LK#ArathJaheira","GLOBAL",1)~ THEN BLK#ARAT j2
  ~I don't need you standing over my shoulder every time I cast something, you know. I am more than capable of handling things on my own.~
  DO ~SetGlobal("LK#ArathJaheira","GLOBAL",2)~
  == BJAHEIR ~While I am sure you are correct, you will forgive me if I double-check from time to time. Magic is no plaything, especially ours. We must use it only to benefit nature, lest we become that which we despise.~
  == BLK#ARAT ~That's a lovely little homily you've got going there. I'll just leave you two alone, then.~
  == BJAHEIR ~I am not joking around, Arath. You must be more careful. I seem to recall a number of incidents that were I not there to help could have quite easily gone out of control. The brushfire the other day, for example.~
  == BLK#ARAT ~Will you stop harping on about the brushfire? It was an accident, no harm was done.~
  == BJAHEIR ~No harm was done because I had not finished my waterskin and had the good sense to douse the flames.~
  == BLK#ARAT ~Yes. Well.~
  == BJAHEIR ~I do not say these things because I get some bizarre enjoyment from making you feel guilty, you know. It is my job as an elder druidess to teach you more of the Way. I take that job seriously. When I say something, listen. I do not say it for kicks.~
EXIT

// Jan SoA
CHAIN IF ~InParty("Jan")
See("Jan")
!StateCheck("Jan",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathJan","GLOBAL",0)~ THEN BLK#ARAT jn1
  ~What are you scribbling there, gnome? Some fanciful new tale involving an ox, a cart of turnips and a jilted ogrillion bride?~
  DO ~SetGlobal("LK#ArathJan","GLOBAL",1)~
  == BJAN ~No, but that there sounds like quite the tale. You should tell me sometime. For the moment, I'm working on an invention of mine. I call it the "Autoplow."~
  == BLK#ARAT ~The auto-plow. I see.~
  == BJAN ~Yes, you see, my dear mother's departed uncle Jimmifer once presented me with a problem. "Janny," he said, "I've got a problem." "Yes?" I said, and he replied, "It's a sticky sort of problem, and it's quite the pickle I'm in." He had quite the fondness for pickles, as I recall--bit of a black sheep, really--but then, there's always one.~
  == BLK#ARAT ~I... see. What was the problem?~
  == BJAN ~Oh, he didn't have a problem for long, died on the spot. Anyway, his love of pickles got me to thinking: Janny, I thought, we've got to make farming turnips easier. The turnip industry is a disgrace! The modern plow must be pulled by oxen, which are both expensive to feed and really all too smelly. So I came up with an idea to revolutionise farming.~
  == BLK#ARAT ~A machine?~
  == BJAN ~How did you know? Have you been reading my notes? You really mustn't do that, you know, it's quite rude to read another's diagrams! What if you were to take the idea to the Athkatla Office of Patents and claim my invention for yourself? Why, I remember that happened to my cousin once-removed, Rayleen! Ended up in irons for claiming she invented the wheel. Come to think of it, I'm not sure why she did that, but she did it all the same! You wouldn't do well in jail, my tall friend, so I would suggest you avoid it if you can.~
  == BLK#ARAT ~What does this have to do with agriculture?~
  == BJAN ~Well, I'm not telling you that now, am I!~
  == BLK#ARAT ~(sigh) No, of course not.~
EXIT

CHAIN IF ~InParty("Jan")
See("Jan")
!StateCheck("Jan",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathJan","GLOBAL",1)~ THEN BLK#ARAT jn2
  ~I know I'm going to regret this, but... Jan, why does a machine need to be invented to plow when oxen do just as well?~
  DO ~SetGlobal("LK#ArathJan","GLOBAL",2)~
  == BJAN ~But that's just the thing, Athie! My auto-plow does the work twice as fast for a fraction of the cost, apart from the initial outlay. It'll completely change the way traditional agriculture has worked for thousands of years!~
  == BLK#ARAT ~I still don't understand. Why does it need to be made? The current system works perfectly well.~
  == BJAN ~Progress, my good friend! She is a harsh mistress at times, but she must be obeyed!~
  == BLK#ARAT ~That's your answer? Progress?~
  = ~Progress for progress' sake?~
  == BJAN ~I did mention that it does twice the work in half the time, right? Because that's important.~
  == BLK#ARAT ~You're the reason civilisation encroaches upon and destroys the things I care about, aren't you?~
  == BJAN ~Riddle me this, druid boy: without the advancements of technology, hot water out of the tap would be a pipe dream. Apart from being cold from your dip in the lake, you'd be a little bit dead, because this crossbow, which has saved your hide more than once, would be nothing short of fantasy. Not to mention--~
  == BLK#ARAT ~Okay, I get your point.~
  == BJAN ~Athie, m'boy, you'll get many points in your life, but I doubt this will be among them.~
EXIT

// Keldorn SoA
CHAIN IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathKeldorn","GLOBAL",0)~ THEN BLK#ARAT k1
  ~Sir Keldorn, it is an honour to adventure by your side. I just thought you should know that I have great respect for you and what your Order does, and I look forward to us being comrades-in-arms.~
  DO ~SetGlobal("LK#ArathKeldorn","GLOBAL",1)~
  == BKELDOR ~While I appreciate the sentiment, druid, you need not flatter me to gain my respect.~
  == BLK#ARAT ~I'm not trying to flatter you. I just wanted to let you know how proud I am to fight by your side.~
  == BKELDOR ~I have met many in my life, Arath, and I know false flattery when I see it. There is no need for it here.~
  == BLK#ARAT ~I am only trying to be polite! Mother knows, but you paladins are painful!~
  == BKELDOR ~I suggest you stay your tongue, friend, lest you speak that from which you will have no recourse. Let us speak of this no more.~
EXIT

CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathKeldorn","GLOBAL",1)~ THEN BKELDOR k2
  ~You are an enigma, druid. You fight neither on the side of good nor on the side of evil, yet we agree on many of <CHARNAME>'s decisions.~
  DO ~SetGlobal("LK#ArathKeldorn","GLOBAL",2)~
  == BLK#ARAT ~I follow the laws of nature. Natural laws. A mother must protect her young. The pack must protect its own. Enemies must be killed.~
  == BKELDOR ~You claim the duties of a guardian, yet you do not fight for the cause of righteousness.~ 
  == BLK#ARAT ~I do not believe in absolute good or absolute evil.~ 
  = ~Good and evil are constructs, created to help make decisions simpler for those on the side of "good." Have you noticed there are few who profess to be evil? More often than not, they have rational justification for their actions, the same as yourself.~
  == BKELDOR ~Nay, my friend, you paint with strokes too broad. The righteous put the needs of the many ahead of their own desires, but the wicked serve only themselves.~ 
  = ~They may claim virtue, but if they believe it, they deceive only themselves.~
  == BLK#ARAT ~We are all fallible, and to think otherwise is folly. I fight for myself, for the Mother, and for those I care about.~
  == BKELDOR ~History will judge who was in the right. The important thing is to remember what you were fighting for.~
EXIT

CHAIN IF ~InParty("Keldorn")
See("Keldorn")
!StateCheck("Keldorn",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathKeldorn","GLOBAL",2)~ THEN BLK#ARAT k3
  ~And I suppose the girl's death was the will of mighty Torm?~
  DO ~SetGlobal("LK#ArathKeldorn","GLOBAL",3)~
  == BKELDOR ~There is always a price to be paid for such actions, Arath. You are a druid, and speak of balance, yet it often seems to me you know little of what that actually means.~
  == BLK#ARAT ~She was a child, she stole food for her starving family, and for that she deserves to die?~
  == BKELDOR ~It was a highly regrettable incident. No, I do not believe she deserved to die. Do you think the Order were the ones to put the dagger to her neck? We stand for justice, not murder.~
  == BLK#ARAT ~You left her to the mercy of a group of known bandits. If that is your "justice," I want nothing to do with it.~
  == BKELDOR ~You are wearing my patience dangerously thin. We prayed for guidance, and did what we believed was right.~
  == BLK#ARAT ~There are natural laws, paladin, laws that go beyond your constructs of good and evil--~
  == BKELDOR ~That is enough! I am done with my beliefs being questioned in this manneR. If you want the truth of it, I argued for her to be saved, but the Prelate decided against it, as is his right.~
  = ~Do not lecture me on natural laws. I have two daughters.~
  == BLK#ARAT ~I...~
  == BKELDOR ~I said that is enough.~
EXIT

// Korgan SoA
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Korgan",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathKorgan","GLOBAL",0)~ THEN BKORGAN kn1
  ~What are ye staring at, ye longleg pansyboy?~
  DO ~SetGlobal("LK#ArathKorgan","GLOBAL",1)~
  == BLK#ARAT ~That's the most enormous... how can you even *walk*?~
  == BKORGAN ~She's a biggun, thats fer sure! It jus' takes practice, ye get used ta it.~
  == BLK#ARAT ~It's almost as thick as your forearm. Wow.~
  = ~Sorry, I don't mean to be rude.~
  == BKORGAN ~Nay, laddie, stare all ye want! I'll just content meself knowin' ye'll never have one o' these!~
  == BLK#ARAT ~To be honest, Korgan, I'm not sure if I'd want one in the first place. Just a bit too hefty for my taste.~
  = ~What? What is it? Why is everyone...~
  = ~... ah.~
  == BKORGAN ~Har har! Ye walked right in on that one, lad. A few years 'n ye'll be roarin' with the rest o' us, ye bloody flower-danglin' pansy!~
  == BLK#ARAT ~(sigh) I'll just be over there. Alone. Wishing someone would kill me.~
EXIT

CHAIN IF ~InParty("Korgan")
See("Korgan")
!StateCheck("Korgan",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathKorgan","GLOBAL",1)~ THEN BLK#ARAT kn2
  ~In a month?~
  DO ~SetGlobal("LK#ArathKorgan","GLOBAL",2)~
  == BLK#ARAT ~Twenty-three.~
  == BKORGAN ~Thirty-seven, ye tree-huggin' runt! Hah!~
  == BLK#ARAT ~Thirty--thirty *seven*? How in the blazes did you manage that? I could barely manage twenty-three, and gods know I'm younger, more virile and far more handsome than you!~
  == BKORGAN ~Let's just say I got me a way with the ladies, an' leave it at that, eh boyo?~
  == BLK#ARAT ~Thirty-seven... respect, brother. Respect.~
EXIT

// Mazzy SoA
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathMazzy","GLOBAL",0)~ THEN BMAZZY m1
  ~What is it I have done to offend you, druid? If I have slighted you in some way without realising it, I do apologise.~
  DO ~SetGlobal("LK#ArathMazzy","GLOBAL",1)~
  == BLK#ARAT ~What?~
  = ~You haven't offended me at all, Miss Fentan. You just... unnerve me a little. I'm not used to travelling with halfling companions. In fact, I've met few halflings in my life at all.~
  == BMAZZY  ~How curious! Well, this is an excellent opportunity for you to learn about our kind. We are a small folk, it is true, but large hearts and true minds make up for what we lack in height.~
  == BLK#ARAT ~I don't know exactly what it is that unnerves me. Possibly it's the height, possibly it's the somewhat odd shape of your head, possibly it's that you wear no shoes and have the most peculiar of feet. Don't they get sore from all this walking?~
  == BMAZZY  ~I will have you know that I do not tolerate racism of any kind, nor rudeness in any form. If your intention is--~
  == BLK#ARAT ~I just don't quite know what to make of you.~
  == BMAZZY  ~Then I suggest you watch your words and let me teach you. As a young druid, I am sure you will encounter many more of my kind. I shall take it on as a sort of duty to educate you in our ways, lest you unknowingly offend those you seek to befriend.~
  == BLK#ARAT ~You haven't answered my question about the feet.~
  == BMAZZY  ~Strangely, I did not.~
EXIT

CHAIN IF ~InParty("Mazzy")
See("Mazzy")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathMazzy","GLOBAL",1)~ THEN BLK#ARAT m2
  ~You are a very attractive woman, Mazzy.~
  DO ~SetGlobal("LK#ArathMazzy","GLOBAL",2)~
  == BMAZZY  ~That is very kind, Arath, but you need not flatter me to gain my approval. I am not that shallow.~
  == BLK#ARAT ~Now, now, every woman needs to hear that they're pretty every once in a while. And you deserve to hear it more often.~
  == BMAZZY  ~You are horrifyingly transparent at times, Arath. What is it you want?~
  == BLK#ARAT ~I want for little but your company, of course. You are a delightful conversationalist, you know.~
  == BMAZZY  ~You are starting to stretch the bounds of truth there a little, I'm afraid.~
  == BLK#ARAT ~Hardly!~
  = ~You know, it's starting to get a little cold out... you're always welcome to join me in my sleeping roll if you're feeling cold at night.~
  == BMAZZY  ~I...~
  = ~Arath, are you by any chance trying to... proposition me? I have absolutely no interest in 'sharing your bedroll' as you so cunningly put it. And if you want to keep that which you want to keep warm at night, well, I suggest you steer clear of this conversation from now on.~
  == BLK#ARAT ~Ah... yes, ma'am.~
EXIT

CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Mazzy",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathMazzy","GLOBAL",2)~ THEN BMAZZY m3
  ~When you invited me into your, ah, bedroll, the other night... were you, in a round-about sort of way, trying to apologise to me?~
  DO ~SetGlobal("LK#ArathMazzy","GLOBAL",3)~
  == BLK#ARAT ~Well... not exactly apologise, but--~
  == BMAZZY  ~You are one of the most bizarre men I have had the good fortune to meet. What did you think you were apologising for?~
  == BLK#ARAT ~I didn't treat you... appropriately. When I first met you. I just wanted--~
  == BMAZZY  ~You wanted to *reassure* me that you would treat me the same as anyone else.~
  == BLK#ARAT ~Well. Yes.~
  == BMAZZY  ~I'm not sure whether to be infuriated or flattered.~
  == BLK#ARAT ~You could be both?~
  == BMAZZY  ~I suppose that will have to do.~
EXIT

// Minsc SoA
CHAIN IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathMinsc","GLOBAL",0)~ THEN BLK#ARAT mn1
  ~Is that a hamster? I love hamsters! I used to have one as a child, years ago. May I hold him?~
  DO ~SetGlobal("LK#ArathMinsc","GLOBAL",1)~
  == BMINSC ~Boo is no mere hamster, no sir! Boo is a Miniature Giant Space Hamster, and a most intelligent one at that!~
  == BLK#ARAT ~Ah.~
  = ~... but can I hold him?~
  == BMINSC ~What think you, Boo? Shall we let the funny druid hold you?~
  = ~Boo says maybe later. He has just been cleaning himself, and wishes for his fur to dry uninterrupted.~
  == BLK#ARAT ~Cleaning him...? Nevermind, later it is.~
EXIT

CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathMinsc","GLOBAL",1)~ THEN BMINSC mn2
  ~Friend Arath, hold a moment! I have a question!~
  DO ~SetGlobal("LK#ArathMinsc","GLOBAL",2)~ 
  == BMINSC ~You are a defender of nature and wise in the ways of her creatures, yes?~
  == BLK#ARAT ~Yes?~
  == BMINSC ~Boo has been having a small problem.~
  == BLK#ARAT ~I see. What's wrong with him?~
  == BMINSC ~He keeps squirming and biting at himself, but will not tell me the problem!~
  == BLK#ARAT ~Let me take a look at him...~
  = ~What has he been eating recently?~
  == BMINSC ~Nothing strange, berries, nuts... he shared in a cheese sandwich yesterday morn?~
  == BLK#ARAT ~How much cheese did he eat?~
  == BMINSC ~All of it! He has a deceptively large stomach for someone so small.~
  == BLK#ARAT ~Try rubbing his tummy and don't let him eat so much cheese. It isn't good for him.~
  == BMINSC ~Alas, he will not be happy to hear that. I shall do my best to keep him from my sandwiches henceforth!~
  == BLK#ARAT ~Sounds like a plan, my large friend!~
EXIT


// Nalia
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathNalia","GLOBAL",0)~ THEN BNALIA n1
  ~Arath, I would have a word with you. It may have escaped some of the others, but I know full well what you were doing at the Coronet.~
  DO ~SetGlobal("LK#ArathNalia","GLOBAL",1)~
  == BLK#ARAT ~Nothing that I'm ashamed of.~
  == BNALIA ~You should be. Those poor women... how could you demean them like that?~
  == BLK#ARAT ~For one, I didn't demean them, and two, they're the ones offering. They choose to enter into the profession they do, Nalia, knowing full well what it means. None of them are stupid.~
  == BNALIA ~What an ignorant viewpoint. You think they choose to sell and degrade themselves as they do?~
  == BLK#ARAT ~Well, yes. Otherwise why would they be doing it?~
  == BNALIA ~Imagine this. You're a young mother, living in the Slums. You have no money, your family won't speak to you, and you have no husband to support you. You're a peasant, and were never taught any skills with which you could get a job. What else is there, apart from thievery or prostitution?~
  = ~These women are forced to sell themselves by circumstance, not by choice. Nobody in their right mind would subject themselves to the horror those women endure daily.~
  == BLK#ARAT ~I...~
  == BNALIA ~Not many people take the time to think these things through. Not everyone is as fortunate as we are.~
EXIT

CHAIN IF ~InParty("Nalia")
See("Nalia")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathNalia","GLOBAL",1)~ THEN BLK#ARAT n2
  ~I'm not sure if I ever told you, Nalia, but I lived on the streets for a period.~
  DO ~SetGlobal("LK#ArathNalia","GLOBAL",2)~
  == BNALIA ~I didn't know that. What happened?~
  == BLK#ARAT ~I lived in the slums for a few months after I left home. I stayed with a family there, in exchange for potions and whatever cantrips I could conjure up to help.~
  == BNALIA ~A few months? With somewhere to stay? You were lucky that family was so generous, not everyone has--~
  == BLK#ARAT ~I'm not throwing a woe-is-me party, I swear. My point is that I know how bad it is for those people. I admire what you try to do. I'm not sure I agree with your methods, but you're doing your best, and I can respect that.~
  == BNALIA ~Thank you. Few people know how difficult the lives of the poor truly are.~
  == BLK#ARAT ~The poor outnumber the wealthy by quite a bit, Nalia; somehow I think more than a few people know.~
EXIT

CHAIN IF ~InParty("Nalia")
See("Nalia")
!StateCheck("Nalia",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("NaliaKeepPlot","GLOBAL",1)
Global("LK#ArathNalia","GLOBAL",2)~ THEN BLK#ARAT n3
  ~These are for you.~
  DO ~SetGlobal("LK#ArathNalia","GLOBAL",3)~
  == BNALIA ~They're beautiful. Thank you, Arath. You didn't need to do that.~
  == BLK#ARAT ~Grief is universal. Every one of us suffers, every one of us feels pain, and every one of us grieves. Take comfort in that.~
EXIT

// Valygar SoA
CHAIN IF ~InParty("Valygar")
See("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathValygar","GLOBAL",0)~ THEN BLK#ARAT v1
  ~I know some of the others struggle with it, Valygar, but I understand your problem with magic.~
  DO ~SetGlobal("LK#ArathValygar","GLOBAL",1)~
  == BVALYGA ~Somehow, I doubt that.~
  == BLK#ARAT ~Magic changes the natural order of things. It throws things out of balance, and can be a heinous tool for destruction.~
  == BVALYGA ~Magic is a drug. It feels good, and it seems harmless to begin with. A few cantrips, make some light, some illusion play. But soon the desire to do more sets in. You become entranced by your own power, until you let it take over, and you become a slave to its might.~
  = ~Magic is an aberration of the natural order of things, you are right. But that in itself is not the problem.~
  == BLK#ARAT ~What is the problem, then?~
  == BVALYGA ~The problem is that people are inherently hungry for power, and inherently averse to difficulty.~
EXIT

CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Valygar",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LavokDead","GLOBAL",1)
Global("LK#ArathValygar","GLOBAL",1)~ THEN BVALYGA v2
  ~What is this?~
  DO ~SetGlobal("LK#ArathValygar","GLOBAL",2)~
  == BLK#ARAT ~A forty year old bottle of whiskey. I found it a while back, and I've been saving it for something special.~
  == BVALYGA ~Where exactly did you find a forty year old bottle of whiskey?~
  = ~... actually, I don't think I want to know.~
  == BLK#ARAT ~You have led a difficult life, Valygar. And after what you've been through recently, well, I think you deserve a drink.~
  == BVALYGA ~That is... kind. Thank you.~
EXIT

// Viconia SoA
CHAIN IF ~InParty("Arath")
See("Arath")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathViconia","GLOBAL",0)~ THEN BVICONI vc1
  ~A bit thin for my tastes, but I suppose you'll do.~
  DO ~SetGlobal("LK#ArathViconia","GLOBAL",1)~ 
  == BLK#ARAT ~You suppose I'll do for... what?~
  == BVICONI ~Excellent muscle tone, for a rivvil druid.~
  == BLK#ARAT ~Thank you..? Why are you looking at me like that?~
  == BVICONI ~I am assessing your potential.~
  == BLK#ARAT ~For?~
  == BVICONI ~Are all rivvil truly this brainless?~
  == BLK#ARAT ~Oh.~
EXIT

CHAIN IF ~InParty("Viconia")
See("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathViconia","GLOBAL",1)~ THEN BLK#ARAT vc2
  ~I've been thinking... you're not so bad looking yourself, Viconia. Despite the drow thing.~
  DO ~SetGlobal("LK#ArathViconia","GLOBAL",2)~
  == BVICONI ~Hmph. That "drow thing," as you so aptly name it, happens to be my ancestral heritage and I'll not have it demeaned so, il'kahtical.~
  = ~I suggest you do not make the same mistake again.~
  == BLK#ARAT ~Understood, ma'am. Viconia.~
  == BVICONI ~Was that so difficult, little rivvil? I am sure we will get along perfectly fine.~
  == BLK#ARAT ~(gulp)~
EXIT

CHAIN IF ~InParty("Viconia")
See("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("LK#ArathViconia","GLOBAL",2)~ THEN BLK#ARAT vc3
  ~What... what is that?~
  DO ~SetGlobal("LK#ArathViconia","GLOBAL",3)~
  == BVICONI ~You cannot possibly be that ignorant, druid.~
  == BLK#ARAT ~I know what it *is*, but what exactly do you intend to, ah, use it for?~
  = ~Oh, gods. Alright. Well, I'm flattered, but there is no way in the nine Hells I am getting anywhere near that thing.~
  == BVICONI ~Who said you would have a choice?~
  == BLK#ARAT ~You know, I was seriously considering this, before you went crazy and decided to bring out a... I'm not even sure what to call it. Sorry, Viconia, but I'd like to remain intact, if it's all the same to you.~
  == BVICONI ~Nadorhuan! Why is it you surfacers consistently lack backbone? Is it something you are raised with? Pfah!~
  == BLK#ARAT ~I--~
  == BVICONI ~Do not talk to me, iblith. You deserve none of my time.~
  == BLK#ARAT ~But--~
  = ~Well that's the last time I ever consider bedding a drow. Gods.~
EXIT

// (in Underdark)
CHAIN IF ~InParty("Viconia")
See("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("Arath",CD_STATE_NOTVALID)
CombatCounter(0)
Global("chapter","GLOBAL",5)
Global("LK#ArathViconiaUD","GLOBAL",0)~ THEN BLK#ARAT vc4
  ~I've a question, Viconia. I noticed very little flora here in the Underdark. How do the drow make their potions and poultices with so few ingredients?~
  DO ~SetGlobal("LK#ArathViconiaUD","GLOBAL",1)~
  == BVICONI ~Of all the things you could have asked about the Underdark, rivvil, you ask about... flora? What kind of a man are you?~
  = ~Nevermind. Due to my complete lack of interest in the inane and insignificant, I paid no heed to such in my youth. I do seem to recall there are a variety of different fungi that are used, and there is limited trade with the surface. Many ingredients are harvested from the creatures that live below the surface, as well.~
  == BLK#ARAT ~Interesting. I did notice several varieties of fungi I'd not seen before... now I wish I'd taken a closer look.~
  == BVICONI ~As do I. Many of them are poisonous to the touch, so if you were to have taken a closer look, I'd not be having to answer such ridiculous questions. Was there anything else? Do you wish to know about the formation of stalagmites? Or perhaps the mating patterns of the rothe? I am sure such banalities would fascinate one such as you.~
  == BLK#ARAT ~Are you a bitch all the time, or do you have time off? I'm just curious.~
  == BVICONI ~Dealing with iblith such as yourself drives me to distraction. This is me being polite; I doubt you'd survive long otherwise.~
EXIT

// Viconia ToB


// Yoshimo SoA
