#!/bin/sh
#

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
X=$(echo $SCRIPTPATH | sed 's|/|\\/|g')
sed -i "s/<<replaceme>>/$X/" $SCRIPTPATH/env.rc $SCRIPTPATH/tmux/tmux.conf
mkdir -p $SCRIPTPATH/tmux/buffers
mkdir -p $SCRIPTPATH/tmux/capture-pane
