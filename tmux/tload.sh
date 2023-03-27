#!/bin/sh
#

tload () { 
    local BASEPATH=<<replaceme>>/tmux/buffers/
    [ $# -eq 0 ] && FROM=$BASEPATH/$(hostname).$(date +'%Y%m%d') || FROM=$BASEPATH/$1
    if [ ! -d $FROM ]; then
        echo "Cannot find $FROM"
        return
    fi

    # First, we clear the current active buffer list
    # This is to ensure that the resulting buffer contents
    # shall all come from the file
    tmux list-buffers | cut -d':' -f1 | while read x; do
        tmux delete-buffer -b $x
    done

    local count=0
    for f in $FROM/*
    do
        tmux load-buffer -b $(basename $f) $f
        printf '.'
	count=$((count+1))
    done
    printf "\nLoaded $count buffers"
}

tload $*
