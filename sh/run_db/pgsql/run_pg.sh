#!/bin/bash
docker-compose  up -d
if [ $? -ne 0 ]; then
    echo "Failed to start Docker Compose services"
    exit 1
fi

echo "Docker Compose services have been started successfully."
