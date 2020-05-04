#! /usr/bin/bash

EX=${1##*.}

echo $EX

OPENER=vim

[ "$EX" == "pdf" ] && OPENER=zathura
[ "$EX" == "mp4" ] && OPENER=mp4

echo $OPENER
exec $OPENER $1
