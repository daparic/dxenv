#!/bin/sh
#

tmux list-buffers | cut -d':' -f1 | while read x;do
    tmux delete-buffer -b $x
done
