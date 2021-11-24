#!/bin/sh

tmux split-window -h \;\
    select-pane -t 1 \;\
    split-window -v -p 10 \;\
    select-pane -t 2 \;\
    send-keys 'gpustat -cu --watch' C-m \;\
    # swap-pane -D \;\
    # swap-pane -D \;

