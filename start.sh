#!/bin/bash

prog=${0##*/}
progdir=$(dirname "$0")

fail () {
    echo "$prog:" "$@" >&2
    exit 1
}

is_true () {
    case "${1-}" in
        [yY]*|[tT]*|1|*true) return 0 ;;
        [nN]*|[fF]*|0|*false) return 1 ;;
    esac
    return 2  # unknown
}

set -o nounset
set -o pipefail
IFS=$'\n\t'
is_true "${DEBUG-}" && export PS4='${LINENO}: ' && set -x  # https://stackoverflow.com/a/17805088



/usr/sbin/sshd &
export DISPLAY=:1
Xvfb $DISPLAY -screen 0 1024x768x16 &
sleep 1
fluxbox &
x11vnc -display :1 -bg -nopw -listen localhost -xkb &

wait
# vim:et:sw=4:sts=4:ts=8
