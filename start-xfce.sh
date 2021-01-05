#!/bin/bash

export DISPLAY=:1
Xvfb $DISPLAY -screen 0 1366x768x16 &
sleep 1
x11vnc -nopw -display $DISPLAY -N -forever &
exec xfce4-session
# vim:et:sw=4:sts=4:ts=8
