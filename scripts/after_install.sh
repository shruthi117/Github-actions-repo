#!/bin/bash
set -e

echo "🔐 Authenticating AWS ECR..."
aws ecr get-login-password --region ap-south-1 | sudo docker login --username AWS --password-stdin 879381243591.dkr.ecr.ap-south-1.amazonaws.com

echo "⬇️ Pulling latest Docker image..."
sudo docker pull 879381243591.dkr.ecr.ap-south-1.amazonaws.com/demorepo:latest
