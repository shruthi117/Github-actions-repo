#!/bin/bash
set -e

echo "🚀 Starting new container..."
sudo docker run -d --restart always -p 80:3000 --name myapp-container 879381243591.dkr.ecr.ap-south-1.amazonaws.com/demorepo:latest
