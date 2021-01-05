#!/bin/bash

prog=${0##*/}

fail () {
    echo "$prog:" "$@" >&2
    exit 1
}

export DISPLAY=:1
Xvfb $DISPLAY -screen 0 1366x768x16 &
sleep 1
x11vnc -nopw -display $DISPLAY -N -forever &
exec fluxbox
# vim:et:sw=4:sts=4:ts=8
