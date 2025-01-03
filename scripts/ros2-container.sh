# Runs a command inside the ROS2 container

IMAGE=zero-to-slam:latest

if docker image inspect "$IMAGE" > /dev/null 2>&1; then
    >&2 echo "Using local Docker image!"
else
    echo "local image does not exist"
    exit 1
fi

DEVICE_NAME=/dev/input/js0

docker run --rm -ti \
    -e SDL_JOYSTICK_DEVICE=/dev/input/js0 \
    --privileged \
    --device=$DEVICE_NAME:$DEVICE_NAME \
    --gpus all \
    --user $(id -u):$(id -g) \
    --network host \
    --ipc host \
    -e HOME=/workspace \
    -e DISPLAY \
    --volume $PWD:/workspace:z \
    --volume /tmp/.X11-unix:/tmp/.X11-unix:z \
    --device /dev/input \
    --security-opt=label=type:container_runtime_t \
    --volume /etc/passwd:/etc/passwd:ro \
    --volume /etc/group:/etc/group:ro \
    --name ros2-container \
    $IMAGE \
    "$@"
