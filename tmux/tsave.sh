#!/bin/sh
#

tsave () { 
    local BASEPATH=<<replaceme>>/tmux/buffers/
    [ $# -eq 0 ] && DEST=$BASEPATH/$(hostname).$(date +'%Y%m%d') || DEST=$BASEPATH/$1
    mkdir -p $DEST
    tmux list-buffers | cut -d':' -f1 | while read x; do
        tmux save-buffer -b $x $DEST/$x
    done
}

tsave $*
