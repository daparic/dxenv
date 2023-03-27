#!/bin/sh
#

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
X=$(echo $SCRIPTPATH | sed 's|/|\\/|g')
sed -i "s/<<replaceme>>/$X/" $SCRIPTPATH/env.rc $SCRIPTPATH/tmux/tmux.conf $SCRIPTPATH/tmux/tload.sh $SCRIPTPATH/tmux/tsave.sh
mkdir -p $SCRIPTPATH/tmux/buffers
mkdir -p $SCRIPTPATH/tmux/capture-pane
ln -sf $SCRIPTPATH/tmux/tmux.conf ~/.tmux.conf
ln -sf $SCRIPTPATH/vifm ~/.vifm
