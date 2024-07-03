#!/bin/bash

SESSION_NAME="rss_smb"

tmux new-session -d -s $SESSION_NAME


# Rename the first window
tmux rename-window -t $SESSION_NAME:0 'main'

# Split the first window into 8 panes
# Create the top row (first 4 panes)
tmux split-window -h -t $SESSION_NAME:0
tmux split-window -h -t $SESSION_NAME:0.0
tmux split-window -h -t $SESSION_NAME:0.1
tmux split-window -h -t $SESSION_NAME:0.2

# Create the bottom row by splitting each pane in the top row
tmux split-window -v -t $SESSION_NAME:0.0
tmux split-window -v -t $SESSION_NAME:0.1
tmux split-window -v -t $SESSION_NAME:0.2
tmux split-window -v -t $SESSION_NAME:0.3

# Execute commands in each pane
tmux send-keys -t $SESSION_NAME:0.0 'roslaunch smb smb.launch'
tmux send-keys -t $SESSION_NAME:0.1 'roslaunch smb_msf_graph smb_msf_graph.launch'
tmux send-keys -t $SESSION_NAME:0.2 'roslaunch object_detection object_detection.launch object_detection_classes:="[0,1,2,10,11,24,25,39,64,67,73,74]"'
tmux send-keys -t $SESSION_NAME:0.3 'cd ~/smb_ws && rosrun extract_artifacts detection_listener.py'
tmux send-keys -t $SESSION_NAME:0.4 'roslaunch smb_navigation navigate2d_cmu.launch use_msf:=true global_frame:=world_graph_msf state_estimation_topic:=/transformed_odom launch_far_planner:=false'
tmux send-keys -t $SESSION_NAME:0.5 'roslaunch smb_exploration smb_rss_tare.launch rviz:=false world_frame:=world_graph_msf'
tmux send-keys -t $SESSION_NAME:0.6 'cd ~/smb_ws/src/core/ && bash record_sensors.sh'
tmux send-keys -t $SESSION_NAME:0.7 'cd ~/smb_ws/src/extract_artifacts && git checkout -- .'

# Select the first pane
tmux select-pane -t $SESSION_NAME:0.0

# Attach to the session
tmux attach -t $SESSION_NAME
