FROM ros:noetic-ros-core

# Use bash and install catkin tools
SHELL ["/bin/bash", "-c"]

RUN apt update && apt install -y \
    python3-catkin-tools \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*


RUN apt install ros-noetic-pcl-ros
RUN sudo apt install libyaml-cpp-dev
RUN sudo apt install ros-noetic-rosfmt

RUN sudo apt install libdw-dev libelf-dev
RUN sudo apt install ros-noetic-mavros-msgs
RUN sudo apt install libopencv-dev

# Source ROS setup on every shell
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
