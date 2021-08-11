#!/bin/bash -xve

sudo apt update
sudo apt install ros-melodic-cv-bridge ros-melodic-cv-camera
sudo apt install opencv-data

# sync and make
rsync -av ./ ~/catkin_ws/src/pimouse_vision_control/

# clone pimouse_ros
cd ~/catkin_ws/src/
git clone --depth=1 https://github.com/hashi0203/pimouse_ros.git

cd ~/catkin_ws
catkin_make