docker buildx build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) --build-arg USER_NAME=$(whoami) -t zero-to-slam:2nd -f Dockerfile.2nd .