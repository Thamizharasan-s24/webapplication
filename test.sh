#!/bin/bash

IMAGE_NAME="my-web-app"

# Run container in the background (temporary for testing)
docker run -d -p 8080:80 --name test-container $IMAGE_NAME:latest
sleep 2  # Wait for it to start

# Test if the server is responding
curl -s http://localhost:8080 > /dev/null
if [[ $? -eq 0 ]]; then
    echo "✅ Test passed: Web server is running!"
else
    echo "❌ Test failed: Server did not respond!"
    docker logs test-container  # Show logs for debugging
    docker stop test-container && docker rm test-container
    exit 1  # Exit with failure
fi

# Clean up test container
docker stop test-container && docker rm test-container

