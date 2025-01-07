#!/bin/bash

# Define the container name or ID
CONTAINER_NAME="hb-ros-isro"

# Check if the user provided an argument
if [ -z "$1" ]; then
  echo "Usage: $0 {start|exec|stop}"
  exit 1
fi

# Define actions based on the argument
case "$1" in
  start)
    echo "Starting container $CONTAINER_NAME..."
    docker start "$CONTAINER_NAME"
    ;;

  exec)
    echo "Accessing container $CONTAINER_NAME..."
    docker exec -it "$CONTAINER_NAME" /bin/bash
    ;;

  stop)
    echo "Stopping container $CONTAINER_NAME..."
    docker stop "$CONTAINER_NAME"
    ;;

  *)
    echo "Invalid option. Usage: $0 {start|exec|stop}"
    exit 1
    ;;
esac
