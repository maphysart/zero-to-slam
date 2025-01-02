# Runs Isaac Sim with its built-in ROS2 support

# TODO set this variable
export ISAAC_PATH=$HOME/OSS/omniverse/pkg/isaac-sim-4.2.0

if ! [[ -d $ISAAC_PATH ]]
then
    echo "Error: $ISAAC_PATH does not exist!"
    echo "Please edit this script with the correct path."
    exit 1
fi

# Set ROS_DISTRO environment variable
export ROS_DISTRO=humble  # Make sure this matches your ROS2 distro

export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ISAAC_PATH/exts/omni.isaac.ros2_bridge/humble/lib

$ISAAC_PATH/isaac-sim.sh
