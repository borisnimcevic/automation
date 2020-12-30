#!/bin/sh
# Boris Nimcevic
# 2020 Decemver 30

SESSION=imagi
tmux new-session -d -s $SESSION
tmux rename-window -t $SESSION:0 "dev"

tmux select-window -t $SESSION:0
tmux send-keys 'cd ~/esp/imagiLabs-firmware/esp-idf-v4.0/imagiCharm' C-m
tmux send-keys 'nvim main/main.c' C-m
tmux split-window -v -p 30
tmux send-keys 'cd ~/esp/imagiLabs-firmware/esp-idf-v4.0/imagiCharm' C-m
tmux send-keys 'get_idf' C-m


tmux attach -t $SESSION
