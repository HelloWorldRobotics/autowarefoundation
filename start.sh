#!/bin/bash

# Set the path to your ROS 2 workspace
ROS2_WS_PATH="/home/emerge/autowarefoundation/src/launcher/autoware_launch/autoware_launch/launch/start"

# Launch files to be launched
LAUNCH_FILES=(
    "initialization.launch.xml"
    "localization.launch.xml"
    "perception.launch.xml"
    "planning_and_control.launch.xml"
)

# Navigate to the ROS 2 workspace
cd $ROS2_WS_PATH

# Iterate through the launch files and launch them
for file in "${LAUNCH_FILES[@]}"
do
    echo "Launching $file"
    ros2 launch $file &
done

# Wait for all launch files to finish
wait
