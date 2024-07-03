#!/bin/bash

now="$(date +"%F-%H-%M-%S")"
today="$(date +"%F")"

outpath="$HOME/rss_export/${today}/${now}/
mkdir -p $outpath

# Copy tare planner config
#scp -r team1@10.0.1.5:/home/team1/smb_ws/src/exploration/tare_planner/src/tare_planner/config ${outpath}/config

# Copy map.pcd
scp -r team1@10.0.1.5:/home/team1/smb_ws/src/core/smb_slam/data/maps/map.pcd ${outpath}/map.pcd

