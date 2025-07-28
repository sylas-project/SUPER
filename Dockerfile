FROM ros:noetic-ros-core

# Use bash and install catkin tools
SHELL ["/bin/bash", "-c"]

RUN apt update && apt install -y \
    python3-catkin-tools \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*


RUN apt update && apt install -y ros-noetic-pcl-ros libyaml-cpp-dev ros-noetic-rosfmt libdw-dev libelf-dev ros-noetic-mavros-msgs libopencv-dev libglfw3 libglfw3-dev

# Source ROS setup on every shell
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
