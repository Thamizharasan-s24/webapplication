#!/bin/bash

IMAGE_NAME="my-web-app"

# Stop and remove any running container
docker stop my-running-app 2>/dev/null
docker rm my-running-app 2>/dev/null

# Run new container
docker run -d -p 80:80 --name my-running-app $IMAGE_NAME:latest

