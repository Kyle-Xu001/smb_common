#!/bin/bash

SESSION_NAME="rss_opc"

tmux new-session -d -s $SESSION_NAME


# Rename the first window
tmux rename-window -t $SESSION_NAME:0 'main'

# Split the first window into 8 panes
# Create the top row (first 4 panes)
tmux split-window -v -t $SESSION_NAME:0
tmux split-window -h -t $SESSION_NAME:0.0
tmux split-window -h -t $SESSION_NAME:0.1
tmux split-window -h -t $SESSION_NAME:0.2
tmux split-window -h -t $SESSION_NAME:0.4

# Execute commands in each pane
tmux send-keys -t $SESSION_NAME:0.0 'roscore'
tmux send-keys -t $SESSION_NAME:0.1 'rosbag play --clock '
tmux send-keys -t $SESSION_NAME:0.2 'roslaunch smb_msf_graph smb_msf_graph.launch use_sim_time:=true'
tmux send-keys -t $SESSION_NAME:0.3 'roslaunch smb smb_opc.launch'
tmux send-keys -t $SESSION_NAME:0.4 'roslaunch smb_slam visualize_map.launch'
tmux send-keys -t $SESSION_NAME:0.5 'vi ~/rss_export/'

# Select the first pane
tmux select-pane -t $SESSION_NAME:0.0

# Attach to the session
tmux attach -t $SESSION_NAME
