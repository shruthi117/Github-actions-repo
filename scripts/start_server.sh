#!/bin/bash
set -e

CONTAINER_NAME="demorepo-container"
IMAGE_NAME="879381243591.dkr.ecr.ap-south-1.amazonaws.com/demorepo:latest"

echo "🛑 Checking for existing container ($CONTAINER_NAME)..."

# Check if the container exists and remove it
if [ "$(sudo docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "🛑 Stopping and removing existing container ($CONTAINER_NAME)..."
    sudo docker stop $CONTAINER_NAME || true
    sudo docker rm $CONTAINER_NAME || true
else
    echo "✅ No existing container named $CONTAINER_NAME found."
fi

echo "🚀 Pulling latest Docker image..."
sudo docker pull $IMAGE_NAME

echo "🚀 Starting new container..."
sudo docker run -d --restart always -p 80:3000 --name $CONTAINER_NAME $IMAGE_NAME
