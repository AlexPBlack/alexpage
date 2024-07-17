#!/bin/bash

rm -rf data

cd redis

echo "Starting Redis server..."
docker-compose up -d
if [ $? -ne 0 ]; then
    echo "Failed to start Redis server"
    exit 1
fi


# 切换到输出目录
cd ../pgsql
echo "Starting PostgreSQL server..."

docker-compose up -d

if [ $? -ne 0 ]; then
    echo "Failed to start Docker Compose services"
    exit 1
fi

echo "Docker Compose services have been started successfully."
