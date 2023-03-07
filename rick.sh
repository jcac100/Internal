#!/bin/bash

eflatlow=311.13
g=392
bflat=466.16
dflat=554.37
fhigh=698.46

f=349.23
aflat=415.3
c=523.25
eflat=622.25

speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $g -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $g -l 1 & sleep .35 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $eflatlow -l 1 & sleep .6 && kill -9 $!
sleep .2
speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $g -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
sleep .2
speaker-test -t sine -f $eflatlow -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $eflat -l 1 & sleep .2 && kill -9 $!
sleep .2
speaker-test -t sine -f $eflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .2 && kill -9 $!
sleep .8
speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $g -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .2 && kill -9 $!
sleep .2
speaker-test -t sine -f $g -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $eflatlow -l 1 & sleep .4 && kill -9 $!
sleep .6
speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $g -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $eflatlow -l 1 & sleep .2 && kill -9 $!
sleep .2
speaker-test -t sine -f $bflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $c -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .4 && kill -9 $!
sleep .4
speaker-test -t sine -f $aflat -l 1 & sleep 1.2 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $c -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $c -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .4 && kill -9 $!
sleep .8
speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $g -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .2 && kill -9 $!
sleep .2
speaker-test -t sine -f $bflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $c -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .6 && kill -9 $!

speaker-test -t sine -f $eflatlow -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!

speaker-test -t sine -f $c -l 1 & sleep .3 && kill -9 $!
speaker-test -t sine -f $c -l 1 & sleep .3 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .6 && kill -9 $!

speaker-test -t sine -f $eflatlow -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!

speaker-test -t sine -f $bflat -l 1 & sleep .3 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .3 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $g -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .3 && kill -9 $!

speaker-test -t sine -f $eflatlow -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!

speaker-test -t sine -f $aflat -l 1 & sleep .4 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $g -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $eflatlow -l 1 & sleep .2 && kill -9 $!
sleep .1
speaker-test -t sine -f $eflatlow -l 1 & sleep .2 && kill -9 $!

speaker-test -t sine -f $bflat -l 1 & sleep .4 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .4 && kill -9 $!
sleep .4

speaker-test -t sine -f $eflatlow -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!

speaker-test -t sine -f $c -l 1 & sleep .3 && kill -9 $!
speaker-test -t sine -f $c -l 1 & sleep .3 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .6 && kill -9 $!

speaker-test -t sine -f $eflatlow -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!

speaker-test -t sine -f $eflat -l 1 & sleep .4 && kill -9 $!
speaker-test -t sine -f $g -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $g -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .3 && kill -9 $!

speaker-test -t sine -f $eflatlow -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!

speaker-test -t sine -f $aflat -l 1 & sleep .4 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $g -l 1 & sleep .3 && kill -9 $!
speaker-test -t sine -f $f -l 1 & sleep .1 && kill -9 $!
speaker-test -t sine -f $eflatlow -l 1 & sleep .1 && kill -9 $!
sleep .1
speaker-test -t sine -f $eflatlow -l 1 & sleep .2 && kill -9 $!
speaker-test -t sine -f $bflat -l 1 & sleep .4 && kill -9 $!
speaker-test -t sine -f $aflat -l 1 & sleep .4 && kill -9 $!
