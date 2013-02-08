@echo off
@echo Installing audio...
    
arath\oggdec.exe override\lk#ar*.ogg
del override\lk#ar*.ogg
del override\lk#blk.mus
    
@echo Finished installing audio.

@echo Installing areas...

arath\tisunpack.exe -s override\lk#ar1.tiz
arath\tisunpack.exe -s override\lk#ar2.tiz

del override\lk#ar*.tiz

@echo Finished installing areas.
