#!/bin/bash

prog=${0##*/}

fail () {
    echo "$prog:" "$@" >&2
    exit 1
}

export DISPLAY=:1
Xvfb $DISPLAY -screen 0 1024x768x16 &
sleep 1
x11vnc -nopw -display $DISPLAY -N -forever &
#x11vnc -passwd TestVNC -display $DISPLAY -N -forever &
#(
#    while fluxbox; do
#        :
#    done
#) &
startlxde &
wait
# ^^ XXX In the future this will be `exec fluxbox` (or more likely `exec startlxde`) so the container will be killed once the user 'logs out'
# vim:et:sw=4:sts=4:ts=8
