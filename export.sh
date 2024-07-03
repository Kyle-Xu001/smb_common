#!/bin/bash

now="$(date +"%F-%H-%M-%S")"
today="$(date +"%F")"

outpath="$HOME/rss_export/${today}/${now}/"
echo $outpath
mkdir -p $outpath

# Copy tare planner config
#scp -r team1@10.0.1.5:/home/team1/smb_ws/src/exploration/tare_planner/src/tare_planner/config ${outpath}/config

# Copy map.pcd
scp -r team1@10.0.1.5:/home/team1/smb_ws/src/core/smb_slam/data/maps/map.pcd ${outpath}/map.pcd

# Copy obj det csv
scp -r team1@10.0.1.5:/home/team1/smb_ws/src/extract_artifacts/detected_artifacts/detected_artifacts.csv ${outpath}/detected_artifacts.csv

