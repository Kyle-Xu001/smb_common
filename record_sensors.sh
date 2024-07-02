#! /bin/bash
#outpath="$1"

# Other variables
now="$(date +"%F-%H-%M-%S")"
today="$(date +"%F")"

# List of useful colors
COLOR_RESET="\033[0m"
COLOR_WARN="\033[0;33m"

# Check outputpath
#if [ "${outpath}" == "" ]; then
  outpath="$HOME/bags/${today}"
#fi

if [ ! -d "${outpath}" ]; then
  mkdir -p "${outpath}"
fi

# Record
rosparam dump ${outpath}/${now}.yaml
rosbag record --output-name=${outpath}/${now}"_smb" \
/control/smb_diff_drive/odom \
/control/smb_lowlevel_controller/wheelSpeeds \
/graph_msf/est_odometry_odom_imu \
/imu \
/rslidar/points \
/tf \
/tf_static \
/tracking_camera/odom/sample \
/object_detector/detection_info \
/object_detector/detection_point_clouds \
/object_detector/detections_in_image \
/object_detector/object_poses

