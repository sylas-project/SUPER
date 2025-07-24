cmake_minimum_required(VERSION 3.0.2)
project(perfect_drone_sim)

## Compile options
add_compile_options(-std=c++14 -DQT_NO_VERSION_TAGGING)
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -Wall -g -fPIC")
add_definitions(-DROOT_DIR=\"${CMAKE_CURRENT_SOURCE_DIR}/\")

## Find catkin and system dependencies
find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  pcl_ros
  geometry_msgs
  nav_msgs
  message_generation
  super_msgs
  visualization_msgs
  rosfmt
  message_filters
  marsim_render
)

find_package(Eigen3 REQUIRED)
find_package(PCL REQUIRED)
find_package(OpenCV REQUIRED)

## Declare catkin package
catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS roscpp std_msgs 
                # geometry_msgs nav_msgs
                #  message_generation super_msgs visualization_msgs
                #  rosfmt message_filters marsim_render
)

## Include directories
include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  ${EIGEN3_INCLUDE_DIRS}
  ${PCL_INCLUDE_DIRS}
)

## Libraries to link
set(THIRD_PARTY_LIBS
  ${catkin_LIBRARIES}
  ${PCL_LIBRARIES}
  yaml-cpp
)

## Executables
add_executable(perfect_drone
  src/ros1_perfect_drone_node.cpp
)

target_link_libraries(perfect_drone
  ${THIRD_PARTY_LIBS}
)

