FROM docker.io/osrf/ros:humble-desktop-full-jammy

RUN apt update && \
    apt install -y \
        ros-humble-teleop-twist-joy \
        ros-humble-navigation2 \
        ros-humble-nav2-bringup \
        ros-humble-slam-toolbox \
        ros-humble-rmw-cyclonedds-cpp && \
    rm -rf /var/lib/apt/lists/*a

RUN apt update && \
    apt install -y \
        jstest-gtk libsdl2-dev libudev-dev libts-dev && \
    rm -rf /var/lib/apt/lists/*a

ARG USER_NAME
ARG INPUT_GID

RUN adduser --disabled-password --gecos "" $USER_NAME && \
echo "$USER_NAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Get the GID of the input group on the host
RUN groupadd -g $INPUT_GID input
RUN usermod -aG input "$USER_NAME"


RUN mkdir /workspace

WORKDIR /workspace

ENTRYPOINT ["/ros_entrypoint.sh"]
