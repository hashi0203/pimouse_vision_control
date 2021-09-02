[![Build Status](https://travis-ci.com/hashi0203/pimouse_vision_control.svg?branch=main)](https://travis-ci.com/hashi0203/pimouse_vision_control)

# pimouse_vision_control

## Environment

- Raspberry Pi 3 ModelB
- Ubuntu 18.04
    - Ubuntu wiki (https://wiki.ubuntu.com/ARM/RaspberryPi)
    - Download Link (http://cdimage.ubuntu.com/releases/bionic/release/ubuntu-18.04.5-preinstalled-server-armhf+raspi3.img.xz)

## 0. Prepare

If you haven't installed ROS, execute the following commands.

```bash
$ cd ~
$ git clone https://github.com/ryuichiueda/ros_setup_scripts_Ubuntu18.04_server
$ cd ros_setup_scripts_Ubuntu18.04_server/
$ source ~/.bashrc
```

If you haven't created catkin workspace, execute the following commands.

```bash
$ mkdir -p ~/catkin_ws/src
$ cd ~/catkin_ws/src
$ source /opt/ros/melodic/setup.bash
$ catkin_init_workspace
$ cd ~/catkin_ws
$ catkin_make
```

## 1. Install

We use the web_video_server and aync_web_server_cpp.

```bash
$ cd ~/catkin_ws/src
$ git clone https://github.com/hashi0203/pimouse_vision_control.git
$ git clone https://github.com/RobotWebTools/web_video_server.git
$ git clone https://github.com/GT-RAIL/async_web_server_cpp.git
$ cd ~/catkin_ws
$ catkin_make
```

Install necessary ROS packages.

```bash
$ sudo apt install ros-melodic-cv-bridge ros-melodic-cv-camera
$ sudo apt install opencv-data
```

## 2. Run

- Terminal 1

    Start roscore.

    ```bash
    $ roscore
    ```

### 2.1. Dummy movie

Use dummy movie [face-left.bag](./bagfiles/face-left.bag) to test.

- Terminal 2

    The robot should turn left.

    ```bash
    $ roslaunch pimouse_vision_control bagplay.launch
    ```

### 2.2. Real camera

First, connect USB camera on Raspberry Pi.

- Terminal 2

    If your face is in left side, the robot turns left, and if your face is in right side, the robot turns right.

    ```bash
    $ roslaunch pimouse_vision_control vision_control.launch
    ```

You can also see the movie by accessing the following URL.

```
http://<IP address>:10000/stream?topic=/face
```

## Reference

- 「[Raspberry Piで学ぶ ROSロボット入門](https://github.com/ryuichiueda/raspimouse_book_info)」

I also used bagfiles copied from https://github.com/ryuichiueda/pimouse_vision_control.